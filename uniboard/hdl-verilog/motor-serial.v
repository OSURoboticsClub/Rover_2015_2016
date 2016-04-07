/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none


/* Sabertooth serial generator
 * Outputs simple serial commands at 9600 baud. */
module SabertoothSerial (
	input wire [7:0] m1, /* 0 = full reverse, 127 = stop, 255 = full forward. */
	input wire [7:0] m2, /* 0 = full reverse, 127 = stop, 255 = full forward. */
	input wire clk_12MHz,
	output wire s1,
	input wire reset);
					
	reg [7:0] tx_data;
	reg [3:0] state;
	reg send;
	wire select_clk;
	
	ClockDividerP #(12000) baud_gen(.clk_i(clk_12MHz),
	                                .clk_o(select_clk),
	                                .reset(reset));

	always @ (posedge select_clk)			
		begin
			if(reset)
				begin
					send <= 0;
					state <= 0;
				end
			else
				begin
					case(state)
						2'd0:
							begin
								tx_data <= (m1 == 8'd255 || m1 == 8'd254) ? 8'd127 : m1[7:1] + 1; /* Transmit M1. */
								send <= 1;
								state <= 2'd1;
							end
						2'd1:
							begin
								send <= 0;
								state <= 2'd2;
							end
						2'd2:
							begin
								tx_data <= (m2 == 8'd255 || m2 == 8'd254) ? 8'd255 : m2[7:1] + 129; /* Transmit M1. */
								send <= 1;
								state <= 2'd3;
							end
						2'd3:
							begin
								send <= 0;
								state <= 2'd0;
							end
					endcase
					
				end
				
		end
		
	UARTTransmitter #(1250) sender(.tx(s1),
	                               .clk(clk_12MHz),
	                               .data(tx_data),
	                               .send(send),
	                               .reset(reset));
endmodule


/* Sabertooth serial peripheral
 * Outputs simple serial commands at 9600 baud. */
module SabertoothSerialPeripheral(
	input wire clk_12MHz,
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire [7:0] register_addr,
	input wire rw, /* 0 = write, 1 = read. */
	input wire select, /* Rising edge writes or hold high to read. */
	output wire sabertooth_s1,
	input wire pause,
	input wire reset);
	
	reg [7:0] register[1:0];
	wire [7:0] left_value;
	wire [7:0] right_value;
	
	assign left_value = pause ? 8'd127 : register[0];
	assign right_value = pause ? 8'd127 : register[1];
	
	/* Bus read handling */
	reg [7:0] read_value;
	reg [2:0] read_size;
	reg prev_select;
	
	assign reg_size = select ? read_size : 'bz;
	assign databus = (select & rw) ? {24'd0, read_value} : 'bz;
	
	
	/* Bus handling */
	always @ (posedge clk_12MHz)			
		begin
			prev_select <= select;
			if(reset == 1)
				begin
					register[0] <= 8'd127;
					register[1] <= 8'd127;
				end
			else
				if(~prev_select & select)
					begin
						case(register_addr)
							8'd0:
								begin
									read_value <= register[0];
									read_size <= 3'd1;
								end
							8'd1:
								begin
									read_value <= register[1];
									read_size <= 3'd1;
								end
							default:
								begin
									read_value <= 'b0;
									read_size <= 'b0;
								end
						endcase
						if(~rw)
							begin
								case(register_addr)
									8'd0:
										register[0] <= databus[7:0];
									8'd1:
										register[1] <= databus[7:0];
								endcase
							end
					end
		end
		
	/* Peripheral components */
	SabertoothSerial sserial(
	                  .m1(left_value),
	                  .m2(right_value),
	                  .clk_12MHz(clk_12MHz),
	                  .s1(sabertooth_s1),
	                  .reset(reset));
endmodule