/* OSU Robotics Club Rover 2016
 * Core Electrical System Uniboard HDL
 * Written 2015-2016 Nick Ames <nick@fetchmodus.org> */
`default_nettype none

/* Global Control Peripheral. */
module GlobalControlPeripheral(
	input wire clk_12MHz,
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire [7:0] register_addr,
	input wire rw, /* 0 = write, 1 = read. */
	input wire select, /* Rising edge writes or hold high to read. */
	output wire global_pause,
	output wire signal_light,
	input wire xbee_pause_n,
	input wire [15:0] battery_voltage,
	input wire reset);
	parameter hdl_build = 32'd0;
	parameter api_version = 32'h0009;
	
	reg force_pause;
	wire [31:0] register[4:0];
	reg [31:0] uptime_count;
	wire clk_1Hz;
	reg prev_clk_1Hz;
	reg xbee_pause_latched;
	
	/* Bus read handling */
	reg [31:0] read_value;
	reg [2:0] read_size;
	reg prev_select;
	
	assign reg_size = select ? read_size : 'bz;
	assign databus = (select & rw) ? read_value : 'bz;
	
	/* Register assignments */
	assign global_pause = xbee_pause_latched | force_pause;
	assign signal_light = global_pause ? 1'b1 : clk_1Hz;
	assign register[0] = {29'b0, xbee_pause_latched, force_pause, global_pause};
	assign register[1] = {16'b0, battery_voltage};
	assign register[2] = uptime_count;
	assign register[3] = hdl_build;
	assign register[4] = api_version;
	
	//TODO: Make light blink as specified in the standard
	
	
	/* Bus handling */
	always @ (posedge clk_12MHz)			
		begin
			prev_select <= select;
			prev_clk_1Hz <= clk_1Hz;
			xbee_pause_latched <= ~xbee_pause_n;
			if(reset == 1)
				begin
					force_pause <= 0;
					uptime_count <= 0;
				end
			else
				begin
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
										read_size <= 3'd2;
									end
								8'd2:
									begin
										read_value <= register[2];
										read_size <= 3'd4;
									end
								8'd3:
									begin
										read_value <= register[3];
										read_size <= 3'd4;
									end
								8'd4:
									begin
										read_value <= register[4];
										read_size <= 3'd2;
									end
								default:
									begin
										read_value <= 'b0;
										read_size <= 'b0;
									end
							endcase
							if(~rw)
								begin
									if(register_addr == 8'd0)
										force_pause <= databus[1];
								end
						end
					if(~prev_clk_1Hz & clk_1Hz)
						uptime_count <= uptime_count + 1;
				end
		end

	ClockDividerP #(12000000) uptime_div(.clk_i(clk_12MHz),
	                                     .clk_o(clk_1Hz),
	                                     .reset(reset));
endmodule