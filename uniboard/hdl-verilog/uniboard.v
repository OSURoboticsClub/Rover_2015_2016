/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */

/* See the Uniboard manual for information on the command protocol
 * and peripheral mapping.
 * Internally, peripherals are connected to the top module using a bus with several signals:
 *  -clk_12Mhz (1-bit top->peripherals)
 *  -databus (32-bit tri-state bidirectional) - conveys register contents to and from peripherals
 *  -reg_size (3-bit tri-state peripheral->top) - gives number of bytes in register for command reply size
 *  -reg_addr (8-bit top->peripherals) - select the register to read/write
 *  -rw (1-bit top->peripherals) - selects read/write (0 = write, 1 = read)
 * Each peripheral has an individual select signal:
 *  -select (1-bit top->peripheral) - performs a read/write operation
 *
 * To access a peripheral, the bus is configured (asserting reg_size, rw, and databus if necessary)
 * and the select line of the peripheral is raised. Bus configuration must occur before raising
 * the select line. For a write operation, the write is performed on the rising edge of select.
 * For a read operation, databus and reg_size will be set as long as select is high. The databus should
 * be set to the read value within one cycle of raising select. Once set, it must not change until select
 * goes low. */
`default_nettype none
 
 
/* Implements the Uniboard computer interface protocol. This module must be reset 
 * before use in order to work properly. */
module ProtocolInterface(
	input wire rx,
	output wire tx,
	input wire clk_12MHz,
	inout wire [31:0] databus,
	input wire [2:0] reg_size,
	output reg [7:0] reg_addr,
	output reg rw, 
	output reg [127:0] select,
	input wire reset,
	//TODO
	output reg [4:0] state,
	output wire drdy);
	
	parameter baud_div=2083; /* Division factor to produce
	                          * a clock at the baud rate from the
	                          * module clock. */
	
	reg [7:0] buffer[5:0];
	reg [3:0] bufcount;
	//reg state[4:0] = 0;
	reg escape;
	//reg drdy;
	wire [7:0] rx_data;
	reg [7:0] esc_data;
	reg [7:0] tx_data;
	reg send;
	reg [4:0] sendcount;
	reg [31:0] databus_out;
	wire busy;
	
	assign databus = rw ? 'bz : databus_out;
	
	UARTReceiver #(baud_div) uart_input(.rx(rx),
	                                .clk(clk_12MHz),
				                    .data(rx_data),
									.drdy(drdy),
				                    .reset(reset));
	UARTTransmitter #(baud_div) uart_output(.tx(tx),
	                                    .clk(clk_12MHz),
	                                    .data(tx_data),
	                                    .send(send),
	                                    .busy(busy),
	                                    .reset(reset));
	                                    
	always @ (posedge clk_12MHz)
		begin
			if(reset)
				begin
					state <= 0;
					send <= 0;
					select <= 0;
					bufcount <= 0;
					buffer[0] <= 'd0;
					buffer[1] <= 'd0;
					buffer[2] <= 'd0;
					buffer[3] <= 'd0;
					buffer[4] <= 'd0;
					buffer[5] <= 'd0;
				end
			else
				begin
					case(state)
						/* Waiting for start byte. */
						5'd0:
							begin
								select <= 0;
								bufcount <= 0;
								buffer[0] <= 'd0;
								buffer[1] <= 'd0;
								buffer[2] <= 'd0;
								buffer[3] <= 'd0;
								buffer[4] <= 'd0;
								buffer[5] <= 'd0;
								if(drdy)
									begin
										if(rx_data == 8'h01)
											state <= 2; /* If start received, proceed. */
										else
											state <= 1; /* If not start character, prepare to wait. */
									end
							end
						/* Waiting for DRDY low, proceed back to wait for start byte. */
						5'd1:
							if(~drdy)
								begin
									state <= 0;
								end
						/* Waiting for DRDY low, proceed to wait for data. */
						5'd2:
							if(~drdy)
								begin
									state <= 3;
								end
					
						/* Waiting for data. (Here, data refers to any of the six
						 * bytes between the start and end markers, not just the register data. */
						5'd3:
							if(drdy)
								begin
									if(escape)
										begin
											escape <= 0;
											state <= 5'd4; /* Deposit character in buffer. */
										end
									else
										case(rx_data)
											8'h1B: /* Escape character */
												begin
													escape <= 1;
													state <= 5'd2; /* Wait for DRDY low, then wait for data. */
												end
											8'h01: /* Start character */
												begin
													bufcount <= 0;
													buffer[0] <= 'd0;
													buffer[1] <= 'd0;
													buffer[2] <= 'd0;
													buffer[3] <= 'd0;
													buffer[4] <= 'd0;
													buffer[5] <= 'd0;
													state <= 5'd2; /* Wait for DRDY low, then wait for data. */
												end
											8'h17: /* End character */
												begin
													if(bufcount > 1)
														if(buffer[0][7])
															state <= 5'd10; /* Read */
														else 
															state <= 5'd5; /* Write */
													else /* Incomplete address, invalid command. */
														begin
															state <= 5'd1; /* Wait for DRDY low, then wait start byte. */
														end
												end
											default: /* Data (non-special) character. */
												begin
													state <= 5'd4; /* Deposit character in buffer. */
												end
										endcase
								end
						/* Deposit character in buffer. */
						5'd4:
							begin
								state <= 5'd2; /* Next, wait for DRDY low then wait for data. */
								if(bufcount < 6)
									begin
										/* NB: This is "non-blocking" assignment. The right-hand side of all
										 * assignments is evaluated first, then stored. */
										 buffer[bufcount] <= rx_data;
										 bufcount <= bufcount + 1;
									end
							end
						/* Write */
						5'd5:
							begin
								databus_out <= {buffer[5], buffer[4], buffer[3], buffer[2]};
								rw <= 0;
								reg_addr <= buffer[1];
								state <= 5'd6;
							end
						
						/* Write 2 */
						5'd6:
							begin
								select <= 0;
								select[buffer[0][6:0]] <= 1;
								state <= 5'd7;
							end
						/* Write 3 */
						5'd7:
							begin
								/* Hold select high for an extra cycle, in case a peripheral requires it. */
								state <= 5'd8;
							end
						/* Write 4 */
						5'd8:
							begin
								select <= 0;
								state <= 5'd9;
							end
						/* Write 5 */
						5'd9:
							begin
								/* Wait an extra cycle with select low, in case a peripheral requires it. */
								state <= 5'd10; /* Read back the stored value. */
							end
						/* Read */
						5'd10:
							begin
								state <= 5'd11;
								rw <= 1;
								reg_addr <= buffer[1];
							end
							
						/* Read 2 */
						5'd11:
							begin
								state <= 5'd12;
								select <= 0;
								select[buffer[0][6:0]] <= 1;
							end
							
						/* Read 3 */
						5'd12:
							begin
								/* Wait an extra cycle before reading. */
								state <= 5'd13;
							end
						/* Prepare to send read data */
						5'd13:
							begin
								sendcount <= 0;
								buffer[2] <= databus[7:0];
								buffer[3] <= databus[15:8];
								buffer[4] <= databus[23:16];
								buffer[5] <= databus[31:24];
								state <= 5'd14;
							end
						/* Send read data */
						5'd14:
							begin
								case(sendcount)
									4'd0: /* Start byte */
										begin
											esc_data <= 8'h01;
											state <= 5'd18; /* Send without escaping */
										end
									4'd7: /* End byte */
										begin
											esc_data <= 8'h17;
											state <= 5'd18; /* Send without escaping */
										end
									4'd8: /* Done */
										state <= 0;
									default:
										begin
											esc_data <= buffer[sendcount - 1]; 
											state <= 5'd15; /* Send data, escaping if necessary. */
										end
								endcase
								if(sendcount == (reg_size + 2))
									sendcount <= 4'd7;
								else
									sendcount <= sendcount + 1;
									
							end
							
						/* Transmit escape character if necessary */
						5'd15:
							begin
								if(esc_data == 8'h01 | esc_data == 8'h17 | esc_data == 8'h1B)
									begin
										tx_data <= 8'h1B;
										state <= 5'd16;
									end
								else
									begin
										state <= 5'd18;
									end
							end
						/* Transmit escape 2 */
						5'd16:
							begin
								send <= 1;
								if(busy)
									state <= 5'd17;
							end
						/* Transmit escape 3 */
						5'd17:
							begin
								send <= 0;
								if(~busy)
									state <= 5'd18;
							end
							
						/* Transmit without escape */
						5'd18:
							begin
								tx_data <= esc_data;
								state <= 5'd19;
							end
						/* Transmit without escape 2 */
						5'd19:
							begin
								send <= 1;
								if(busy)
									state <= 5'd20;
							end
						/* Transmit without escape 3 */
						5'd20:
							begin
								send <= 0;
								if(~busy)
									state <= 5'd14;
							end

						default:
							state <= 0;
					endcase	
				end
		end
	/* States:
	 * 0 - Waiting for start (others ignored, buffer empty)
	 * 1 - Wait for DRDY low (start)
	 *     When low, goto wait for start
	 * 2 - Wait for DRDY low (start-continue)
	 *     When low, goto wait for receive
	 * 3 - Waiting for receive
	 *     On DRDY high, check type:
	 *      -If escape = 1, set escape to 0 and goto deposit
	 *      -If escape character, set escape to 1 and goto wait for drdy low.
	 *      -If start character, goto wait for drdy low.
	 *      -If end character, goto process.
	 * 4 - Deposit
	 *     If count < 6, buffer[count-1] = character, increment count, goto wait for receive
	 * 5 - Wait for DRDY low
	 *     Goto Waiting for receive. */
	 
	
endmodule

/* Dummy peripheral. Used to capture invalid peripheral addresses and returns 0
 * for all reads. */
module DummyPeripheral(
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire rw, /* 0 = write, 1 = read. */
	input wire select);
	
	/* Bus read handling */
	assign reg_size = select ? 'b0 : 'bz;
	assign databus = (select & ~rw) ? 'b0 : 'bz;
endmodule

module UniboardTop(
	input wire uart_rx, /* UART input from control computer. */
	output wire uart_tx, /* UART output to control computer. */
	output wire [2:0] status_led,
	input wire clk_12MHz,
	
    output wire Stepper_X_Step,
    output wire Stepper_X_Dir,
    output wire Stepper_X_M0,
    output wire Stepper_X_M1,
    output wire Stepper_X_M2,
    output wire Stepper_X_En,
    input wire Stepper_X_nFault,
    
    output wire Stepper_Y_Step,
    output wire Stepper_Y_Dir,
    output wire Stepper_Y_M0,
    output wire Stepper_Y_M1,
    output wire Stepper_Y_M2,
    output wire Stepper_Y_En,
    input wire Stepper_Y_nFault,
    
    output wire Stepper_Z_Step,
    output wire Stepper_Z_Dir,
    output wire Stepper_Z_M0,
    output wire Stepper_Z_M1,
    output wire Stepper_Z_M2,
    output wire Stepper_Z_En,
    input wire Stepper_Z_nFault,
    
    output wire Stepper_A_Step,
    output wire Stepper_A_Dir,
    output wire Stepper_A_M0,
    output wire Stepper_A_M1,
    output wire Stepper_A_M2,
    output wire Stepper_A_En,
    input wire Stepper_A_nFault,
	
	input wire [3:0] limit,
	output wire expansion1,
	output wire expansion2,
	output wire expansion3,
	inout wire expansion4,
	inout wire expansion5,
	output wire signal_light,
	
	input wire encoder_ra,
	input wire encoder_rb,
	input wire encoder_ri,
	input wire encoder_la,
	input wire encoder_lb,
	input wire encoder_li,
	
	input wire rc_ch1,
	input wire rc_ch2,
	input wire rc_ch3,
	input wire rc_ch4,
	input wire rc_ch7,
	input wire rc_ch8,
	
	output wire motor_pwm_l,
	output wire motor_pwm_r,
	input wire xbee_pause,
	
	inout wire [8:0] debug
	);
	
	/* Placeholder assignments */
	
	assign status_led[0] = 1 | ((& limit)& xbee_pause  & encoder_ra & encoder_rb& encoder_ri& encoder_la& encoder_lb & encoder_li&rc_ch1&rc_ch2&rc_ch3&rc_ch4&rc_ch7&rc_ch8&Stepper_X_nFault&Stepper_Y_nFault&Stepper_Z_nFault&Stepper_A_nFault);
	
	
	/* Debug and status LED assignments */
	wire [4:0] state;
	wire drdy;
	//assign debug[0] = uart_rx;
	assign debug[1] = uart_tx;
	assign debug[2] = state[0];
	assign debug[3] = state[1];
	assign debug[4] = state[2];
	assign debug[5] = state[3];
	assign debug[6] = reset; 
	assign debug[7] = drdy;
	assign debug[8] = clk_12MHz;
	
	assign status_led[1] = 1;
	assign status_led[2] = 1;
	
	/* Bus and reset generator. */
	wire [31:0] databus;
	wire [2:0] reg_size;
	wire [7:0] register_addr;
	wire rw;
	wire [127:0] select;
	wire reset;
	wire interface_reset;
	reg [15:0] reset_count = 0; /* Counter used to de-assert reset after a while. */
	always @ (posedge clk_12MHz)			
		begin
			if(reset_count < 16'd18001) /* 1.5 ms */
				reset_count <= reset_count + 1;
		end
	assign interface_reset = (reset_count < 16'd12000); /* 1 ms */
	assign reset = (reset_count < 16'd18000); /* 1.5 ms */
	
	/* Timeout generator. */
	reg timeout_pause;
	reg [31:0] timeout_count;
	reg prev_uart_rx;
	parameter PAUSE_COUNT = 32'd60000000;
	always @ (posedge clk_12MHz)			
		begin
			prev_uart_rx <= uart_rx;
			if(uart_rx ^ prev_uart_rx)
				begin
					timeout_count <= 32'd0;
				end
			else
				begin
					if(timeout_count < PAUSE_COUNT) /* 5s */
						timeout_count <= timeout_count + 1;
				end
				
			if(timeout_count == PAUSE_COUNT)
				timeout_pause <= 1;
			else
				timeout_pause <= 0;
			
		end
		
	/* Protocol interface and peripherals. */
	ProtocolInterface #(12) protocol_interface(.tx(uart_tx),
	                                           .rx(uart_rx),
	                                           .clk_12MHz(clk_12MHz),
	                                           .databus(databus),
	                                           .reg_size(reg_size),
	                                           .reg_addr(register_addr),
	                                           .rw(rw),
	                                           .select(select),
	                                           .reset(interface_reset),
	                                           .state(state),
	                                           .drdy(drdy));
	/* Dummy peripheral */
	wire dummy_select;
	assign dummy_select = | select[127:8] | select[0] | select[6];
	DummyPeripheral dummy(.databus(databus),
	                      .reg_size(reg_size),
	                      .rw(rw),
	                      .select(dummy_select));
	
	/* Global Control */
	wire global_pause;
	GlobalControlPeripheral #(32'd0, 32'h0009) global_control(.clk_12MHz(clk_12MHz),
	                                                          .databus(databus),
	                                                          .reg_size(reg_size),
	                                                          .register_addr(register_addr),
	                                                          .rw(rw),
	                                                          .select(select[1]),
	                                                          .global_pause(global_pause),
	                                                          .signal_light(signal_light),
	                                                          .xbee_pause_n(xbee_pause),
	                                                          .timeout_pause(timeout_pause),
	                                                          .battery_voltage(16'd6),
	                                                          .reset(reset));
	/* Motor Sabertooth Serial */
	assign motor_pwm_r = 0;
	SabertoothSerialPeripheral motor_serial(.clk_12MHz(clk_12MHz),
	                                        .databus(databus),
	                                        .reg_size(reg_size), 
	                                        .register_addr(register_addr),
	                                        .rw(rw),
	                                        .select(select[2]),
	                                        .sabertooth_s1(motor_pwm_l),
	                                        .pause(global_pause),
	                                        .reset(reset));
	wire clk_255kHz;
	ClockDivider pwm_clk_div(.factor(32'd47),
						     .clk_i(clk_12MHz),
	                         .clk_o(clk_255kHz),
	                         .reset(reset));
	/* Arm */
	reg [4:0] arm_select; /* 0 = X ... 3 = A, 4 = analog. */
	always @*
		begin
			casex(register_addr)
				8'b000000xx:
					begin
						arm_select[0] = select[4];
						arm_select[4:1] = 'b0;
					end
				8'b000100xx:
					begin
						arm_select[0] = 'b0;
						arm_select[1] = select[4];
						arm_select[4:2] = 'b0;
					end
				8'b001000xx:
					begin
						arm_select[1:0] = 'b0;
						arm_select[2] = select[4];
						arm_select[4:3] = 'b0;
					end
				8'b001100xx:
					begin
						arm_select[2:0] = 'b0;
						arm_select[3] = select[4];
						arm_select[4] = 'b0;
					end
				default:
					begin
						arm_select[3:0] = 'b0;
						arm_select[4] = select[4];
					end
			endcase
		end
	
	ArmPeripheral #(8'h00) arm_x(.clk_12MHz(clk_12MHz),
	                             .databus(databus),
	                             .reg_size(reg_size),
	                             .register_addr(register_addr),
	                             .rw(rw),
	                             .select(arm_select[0]),
	                             .pause(global_pause),
	                             .microstep({Stepper_X_M2, Stepper_X_M1, Stepper_X_M0}),
	                             .step_line(Stepper_X_Step),
	                             .dir(Stepper_X_Dir),
	                             .en(Stepper_X_En),
	                             .fault(Stepper_X_nFault),
	                             .limitn(limit[0]),
	                             .reset(reset));
	                             
	ArmPeripheral #(8'h10) arm_y(.clk_12MHz(clk_12MHz), 
	                             .databus(databus),
	                             .reg_size(reg_size),
	                             .register_addr(register_addr),
	                             .rw(rw),
	                             .select(arm_select[1]),
	                             .pause(global_pause),
	                             .microstep({Stepper_Y_M2, Stepper_Y_M1, Stepper_Y_M0}),
	                             .step_line(Stepper_Y_Step),
	                             .dir(Stepper_Y_Dir),
	                             .en(Stepper_Y_En),
	                             .fault(Stepper_Y_nFault),
	                             .limitn(limit[1]),
	                             .reset(reset));
	                             
	ArmPeripheral #(8'h20) arm_z(.clk_12MHz(clk_12MHz), 
	                             .databus(databus),
	                             .reg_size(reg_size),
	                             .register_addr(register_addr),
	                             .rw(rw),
	                             .select(arm_select[2]),
	                             .pause(global_pause),
	                             .microstep({Stepper_Z_M2, Stepper_Z_M1, Stepper_Z_M0}),
	                             .step_line(Stepper_Z_Step),
	                             .dir(Stepper_Z_Dir),
	                             .en(Stepper_Z_En),
	                             .fault(Stepper_Z_nFault),
	                             .limitn(limit[2]),
	                             .reset(reset));
	                   
	ArmPeripheral #(8'h30) arm_a(.clk_12MHz(clk_12MHz), 
	                             .databus(databus),
	                             .reg_size(reg_size),
	                             .register_addr(register_addr),
	                             .rw(rw),
	                             .select(arm_select[3]),
	                             .pause(global_pause),
	                             .microstep({Stepper_A_M2, Stepper_A_M1, Stepper_A_M0}),
	                             .step_line(Stepper_A_Step),
	                             .dir(Stepper_A_Dir),
	                             .en(Stepper_A_En),
	                             .fault(Stepper_A_nFault),
	                             .limitn(limit[3]),
	                             .reset(reset));
	//TODO: Arm analog peripheral.
	
	/* Encoders */
	wire clk_100Hz;
	ClockDividerP_SP #(120000) clk_100Hz_divider(.clk_i(clk_12MHz),
	                                             .clk_o(clk_100Hz),
	                                             .reset(reset));
	assign debug[0] = clk_100Hz;                          
	                                                   
	reg [1:0] encoder_select;
	wire [7:0] encoder_right_regaddr;
	assign encoder_right_regaddr = {4'b0, register_addr[3:0]};
	always @*
		begin
			casex(register_addr)
				8'b0000xxxx:
					begin
						encoder_select[0] = select[3];
						encoder_select[1] = 'b0;
					end
				8'b0001xxxx:
					begin
						encoder_select[1] = select[3];
						encoder_select[0] = 'b0;
					end
				default:
					begin
						encoder_select[0] = select[3];
						encoder_select[1] = 'b0;
					end
			endcase
		end
	EncoderPeripheral left_encoder(.clk_12MHz(clk_12MHz),
	                               .clk_100Hz(clk_100Hz),
	                               .databus(databus),
	                               .reg_size(reg_size),
	                               .register_addr(register_addr),
	                               .rw(rw),
	                               .select(encoder_select[0]),
	                               .A(encoder_la),
	                               .B(encoder_lb),
	                               .I(encoder_li),
	                               .reset(reset));
	EncoderPeripheral right_encoder(.clk_12MHz(clk_12MHz),
	                               .clk_100Hz(clk_100Hz),
	                               .databus(databus),
	                               .reg_size(reg_size),
	                               .register_addr(encoder_right_regaddr),
	                               .rw(rw),
	                               .select(encoder_select[1]),
	                               .A(encoder_ra),
	                               .B(encoder_rb),
	                               .I(encoder_ri),
	                               .reset(reset));
	
	ExpansionGPIO   gpio(.clk_12MHz(clk_12MHz),
	                      .databus(databus),
	                      .reg_size(reg_size),
	                      .register_addr(register_addr),
	                      .rw(rw),
	                      .select(select[5]),
	                      .expansion1(expansion1),
	                      .expansion2(expansion2),
	                      .expansion3(expansion3),
	                      .expansion4(expansion4),
	                      .expansion5(expansion5),
	                      .reset(reset));
	
	/* RC Receiver */
	RCPeripheral rc_receiver(.clk_255kHz(clk_255kHz),
	                         .databus(databus),
	                         .reg_size(reg_size),
	                         .register_addr(register_addr),
	                         .rw(rw),
	                         .select(select[7]),
	                         .rc1(rc_ch1),
	                         .rc2(rc_ch2),
	                         .rc3(rc_ch3),
	                         .rc4(rc_ch4),
	                         .rc7(rc_ch7),
	                         .rc8(rc_ch8),
	                         .reset(reset));
	
endmodule
