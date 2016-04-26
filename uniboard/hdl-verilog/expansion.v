// module expansion_gpio

module ExpansionGPIO(
	input wire clk_12MHz,
	inout wire [31:0] databus,
	output tri [2:0] reg_size, /* Register size (in bytes), to set command reply size. */
	input wire [7:0] register_addr,
	input wire rw, /* 0 = write, 1 = read. */
	input wire select, /* Rising edge writes or hold high to read. */
	output wire expansion1,
	output wire expansion2,
	output wire expansion3,
	inout wire expansion4,
	inout wire expansion5,
	input wire reset);
	
	reg [7:0] register[1:0];
	
	assign expansion1 = register[1][1];
	assign expansion2 = register[1][2];
	assign expansion3 = register[1][3];
	assign expansion4 = register[0][4] ? register[1][4] : 'bz;
	assign expansion4 = register[0][5] ? register[1][5] : 'bz;
	
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
					register[0] <= 0;
					register[1] <= 0;
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
							8'd2:
								begin
									read_value <= {2'd0, expansion5, expansion4, expansion3, expansion2, expansion1, 1'b0};
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
endmodule