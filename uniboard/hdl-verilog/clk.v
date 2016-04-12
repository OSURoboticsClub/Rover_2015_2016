/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none

/* Parametric clock divider. */
module ClockDividerP(
	input wire clk_i,
	output reg clk_o, /* During reset, clk_o is low. */
	input wire reset);
	parameter factor = 2;
	
	reg [31:0] count;					
								
	always @ (posedge clk_i)			
		begin
			if(reset)
				begin
					count <= 0;
					clk_o <= 0;
				end
			else
				begin	
					if(count < (factor >> 1))
						clk_o <= 0;
					else
						clk_o <= 1;

					if(count == factor-1)			
						count <= 0;					
					else
						count <= count + 1;	
				end
		end
endmodule

/* Clock divider. */
module ClockDivider(
	input wire [31:0] factor,
	input wire clk_i,
	output reg clk_o, /* During reset, clk_o is low. */
	input wire reset);
	
	reg [31:0] count;					
	reg [31:0] int_factor;
	
	always @ (posedge clk_i)			
		begin
			if(reset)
				begin
					count <= 0;
					clk_o <= 0;
					if(factor > 32'd1)
						int_factor <= factor;
					else
						int_factor <= 32'd2;
				end
			else
				begin	
					if(count < (int_factor >> 1))
						clk_o <= 0;
					else
						clk_o <= 1;

					if(count >= int_factor-1)
						begin
							count <= 0;
							if(factor > 32'd1)
								int_factor <= factor;
							else
								int_factor <= 32'd2;
						end
					else
						count <= count + 1;	
				end
		end
endmodule

/* Parametric clock divider, outputting short reset pulses. */
module ClockDividerP_SP(
	input wire clk_i,
	output reg clk_o, /* During reset, clk_o is low. */
	input wire reset);
	parameter factor = 2;
	
	reg [31:0] count;					
								
	always @ (posedge clk_i)			
		begin
			if(reset)
				begin
					count <= 0;
					clk_o <= 0;
				end
			else
				begin	
					if(count == 0)
						clk_o <= 1;
					else
						clk_o <= 0;

					if(count == factor-1)			
						count <= 0;					
					else
						count <= count + 1;	
				end
		end
endmodule