/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none

/* Arm axis control peripheral (single-axis).
 * This module must be reset before use. */
module ArmPeripheral(
	input wire clk_12MHz,
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire [7:0] register_addr,
	input wire rw, /* 0 = write, 1 = read. */
	input wire select, /* Rising edge writes or hold high to read. */
	input wire pause,
	output wire [2:0] microstep,
	output wire step_line,
	output wire dir,
	output wire en,
	input wire fault,
	input wire limitn,
	input wire reset);
	parameter axis_haddr = 0; /* High nibble of the registers of this instance. */
	
	/* Peripheral Registers */
	reg [7:0] control_reg;
	reg [31:0] div_factor_reg;
	reg [31:0] steps_reg;
	
	/* Internal signals */
	reg fault_latched;
	reg limit_latched;
	reg prev_limit_latched;
	wire stepping;
	reg int_step; /* Internal step signal; active on rising edge. */
	wire go;
	wire step_clk;
	reg prev_step_clk;
	
	assign go = control_reg[7];
	assign stepping = ~pause & go & (steps_reg > 0);
	
	/* Outputs */
	assign en = control_reg[6];
	assign dir = control_reg[5];
	assign step_line = int_step ^ ~control_reg[3];
	assign microstep = control_reg[2:0];
	
	/* Bus read handling */
	reg [31:0] read_value;
	reg [2:0] read_size;
	reg prev_select;
	
	assign reg_size = select ? read_size : 'bz;
	assign databus = (select & rw) ? read_value : 'bz;
	
	/* Bus handling and step generation */
	always @ (posedge clk_12MHz)			
		begin
			prev_select <= select;
			prev_step_clk <= step_clk;
			limit_latched <= ~limitn;
			prev_limit_latched <= limit_latched;
			fault_latched <= fault;
			
			if(reset == 1)
				begin
					control_reg <= 8'b01101010;
					div_factor_reg <= 32'd12000;
					steps_reg <= 'b0;
				end
			else
				begin
					if(prev_step_clk & ~step_clk)
						int_step <= 'b0;
					if(~prev_step_clk & step_clk & stepping)
						begin
							int_step <= 'b1;
							steps_reg <= steps_reg - 1;
						end
						
					if(~prev_select & select)
						begin
							case(register_addr)
								axis_haddr + 8'd0: /* Control */
									begin
										read_value <= {24'b0, control_reg};
										read_size <= 3'd1;
									end
								axis_haddr + 8'd1: /* Status */
									begin
										read_value <= {29'b0, stepping, fault_latched, limit_latched};
										read_size <= 3'd1;
									end
								axis_haddr + 8'd2: /* Div. Factor */
									begin
										read_value <= div_factor_reg;
										read_size <= 3'd4;
									end
								axis_haddr + 8'd3: /* Steps */
									begin
										read_value <= steps_reg;
										read_size <= 3'd4;
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
										axis_haddr + 8'd0:
											control_reg <= databus[7:0];
										axis_haddr + 8'd2:
											div_factor_reg <= databus;
										axis_haddr + 8'd3:
											steps_reg <= databus;
									endcase
								end
						end	
					if(~prev_limit_latched & limit_latched) /* Unpressed->Pressed */
						begin
							control_reg[7] <= 1'b0;
						end
				end
		end
	ClockDivider step_clk_gen(.clk_i(clk_12MHz),
	                          .clk_o(step_clk),
	                          .factor(div_factor_reg),
	                          .reset(reset));
endmodule