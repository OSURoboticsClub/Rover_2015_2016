/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none
 
/* UART Receiver. Receives RS-232 signals with 8 data bits,
 * no parity, and one stop bit. */
module UARTReceiver(
	input wire rx, /* UART RX line */
	input wire clk, /* Module clock. */
	output reg [7:0] data, /* Received data. */
	output reg drdy, /* Rising edge indicates new data. */
	input wire reset
	);
	
	parameter baud_div=2083; /* Division factor to produce
	                          * a clock at the baud rate from the
							  * module clock. */
							   
	wire bclk; /* Clock at the baud rate. */
	reg baud_reset = 1; /* Baud clk generator reset. */
	reg [7:0] rdata; /* Data being received. */
	reg [5:0] state = 0; /* Current FSM state. */
	
	ClockDividerP #(baud_div) baud_gen(.clk_i(clk),
	                                   .clk_o(bclk),
	                                   .reset(baud_reset));
	
	always @ (posedge clk)
		begin
			if(reset)
				begin
					state <= 0;
					drdy <= 0;
					baud_reset <= 1;
				end
			else
				begin
					casex(state)
						/* Idle; waiting for start bit. */
						6'b00000:
							if(!rx)
								begin
									state <= 6'b001110;
									baud_reset <= 0;
									drdy <= 0;
								end
								
						 /* Wait for rising edge of baud clock during start bit.
						  * The next state will be a falling-edge wait state,
						  * followed by the bit 0 sampling state. */
						6'b001110:
							if(bclk)
									state <= state + 1;
									
						/* Odd-numbered states are used to wait for the falling edge of
						 * the baud clock, allowing the sampling states to wait for the rising edge. */
						6'bxxxxx1:
							if(!bclk)
									state <= state + 1;
									
						/* Sampling states store the current state of rx into the correct bit. */
						6'b01xxx0:
							if(bclk)
								begin
									state <= state + 1;
									rdata[state[3:1]] <= rx;
								end
								
						/* After the bit 7 sampling state, a falling-edge wait state is entered,
						 * then this state. */
						6'b100000:
							begin
								data <= rdata;
								drdy <= 1;
								baud_reset <= 1;
								if(rx)
									state <= 6'b000000;
							end
						default:
							state <= 6'b000000;	
					endcase
				end
		end
endmodule
								   
/* UART Transmitter. Transmits RS-232 signals with 8 data bits,
 * no parity, and one stop bit. */
module UARTTransmitter(
	output reg tx,
	input wire clk,
	input wire [7:0] data,
	input wire send, /* A rising edge while busy is low starts transmission. */
	output reg busy, /* High = currently sending, low = ready */
	input wire reset);
	
	parameter baud_div=2083; /* Division factor to produce
	                          * a clock at the baud rate from the
	                          * module clock. */
	wire bclk; /* Clock at the baud rate. */
	reg [7:0] tdata; /* Data being transmitted. */
	reg [3:0] state = 0; /* Current FSM state. */
	
	ClockDividerP #(baud_div) baud_gen(.clk_i(clk),
	                                   .clk_o(bclk),
	                                   .reset(1'b0));
	always @ (posedge bclk)
		begin
			if(reset)
				begin
					state <= 0;
					busy <= 0;
					tx <= 1;
				end
			else
				begin
					casex(state)
						/* Idle; waiting for start bit. */
						4'd0:
							if(send)
								begin
									tdata <= data;
									busy <= 1;
									state <= state+1;
								end
						4'd1:
							begin
								tx <= 0;
								state <= state+1;
							end
						4'd2:
							begin
								tx <= tdata[0];
								state <= state+1;
							end
						4'd3:
							begin
								tx <= tdata[1];
								state <= state+1;
							end
						4'd4:
							begin
								tx <= tdata[2];
								state <= state+1;
							end
						4'd5:
							begin
								tx <= tdata[3];
								state <= state+1;
							end
						4'd6:
							begin
								tx <= tdata[4];
								state <= state+1;
							end
						4'd7:
							begin
								tx <= tdata[5];
								state <= state+1;
							end
						4'd8:
							begin
								tx <= tdata[6];
								state <= state+1;
							end
						4'd9:
							begin
								tx <= tdata[7];
								state <= state+1;
							end
						4'd10:
							begin
								tx <= 1;
								state <= state+1;
							end
						4'd11:
							begin
								busy <= 0;
								if(~send)
									state <= state+1;
							end
						4'd12:
							begin
								state <= 0;
							end
						default:
							state <= 4'd0;	
					endcase
			end
		end
endmodule 
