/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none

/* Decodes quadrature signals to a signed count value.
 * Adapted from http://www.fpga4fun.com/QuadratureDecoder.html. */
module QuadratureDecoder(
	input wire clk, 
	input wire A, 
	input wire B, 
	output reg [31:0] count,
	input wire reset);

	reg quadA_delayed, quadB_delayed;

	wire count_enable = A ^ quadA_delayed ^ B ^ quadB_delayed;
	wire count_direction = A ^ quadB_delayed;

	reg [7:0] count;
	always @(posedge clk)
		begin
			quadA_delayed <= A;
			quadB_delayed <= B;
			if(reset)
				begin
					count <= 0;
				end
			else
				begin
					if(count_enable)
						begin
							if(count_direction) count<=count+1; else count<=count-1;
						end
				end
		end

endmodule

/* Encoder peripheral; implements the API for a single encoder.
   To facilitate this, this module accepts registers 0-3. */
module EncoderPeripheral(
	input wire clk_12MHz,
	input wire clk_10Hz,
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire [7:0] register_addr,
	input wire rw, /* 0 = write, 1 = read. */
	input wire select, /* Rising edge writes or hold high to read. */
	input wire A,
	input wire B,
	input wire I,
	input wire reset);
	
	parameter num_regs = 2;
	
	wire [31:0] register[num_regs-1:0];
	
	assign register[0] = {28'b0, A, B, I, 1'b0};
	
	wire qreset;
	wire clk_10Hz;
	assign qreset = reset | clk_10Hz;
	
	/* Bus read handling */
	reg [31:0] read_value;
	reg [2:0] read_size;
	assign reg_size = select ? read_size : 'bz;
	assign databus = (select & rw) ? read_value : 'bz;
	
	/* Bus handling */
	always @ (posedge select)			
		begin
			if(register_addr < num_regs)
				begin
					read_value <= register[register_addr];
					read_size <= (register_addr == 0) ? 3'd1 : 3'd4;
				end
			else
				begin
					read_value <= 'b0;
					read_size <= 'b0;
				end
		end
		
	
		
	QuadratureDecoder q(.clk(clk_12MHz),
	                    .A(A),
	                    .B(B),
	                    .count(register[1]),
	                    .reset(qreset));
endmodule
	