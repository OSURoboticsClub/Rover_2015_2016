// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.4.1.213
// Netlist written on Sat Jan  9 21:20:29 2016
//
// Verilog Description of module ClockDivider
//

module ClockDivider (factor, clk_i, clk_o, reset) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(38[8:20])
    input [31:0]factor;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    input clk_i;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(40[13:18])
    output clk_o;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(41[13:18])
    input reset;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(42[13:18])
    
    wire clk_i_c /* synthesis SET_AS_NETWORK=clk_i_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(40[13:18])
    
    wire GND_net, VCC_net, factor_c_31, factor_c_30, factor_c_29, 
        factor_c_28, factor_c_27, factor_c_26, factor_c_25, factor_c_24, 
        factor_c_23, factor_c_22, factor_c_21, factor_c_20, factor_c_19, 
        factor_c_18, factor_c_17, factor_c_16, factor_c_15, factor_c_14, 
        factor_c_13, factor_c_12, factor_c_11, factor_c_10, factor_c_9, 
        factor_c_8, factor_c_7, factor_c_6, factor_c_5, factor_c_4, 
        factor_c_3, factor_c_2, factor_c_1, factor_c_0, clk_o_c, reset_c;
    wire [31:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(44[13:18])
    wire [31:0]n134;
    wire [31:0]n6;
    
    wire n39, n288, n215, n250, n287, n286, n285, n284, n283, 
        n282, n281, n280, n279, n278, n277, n276, n275, n274, 
        n273, n272, n271, n270, n269, n268, n267, n266, n265, 
        n264, n263, n262, n261, n260, n259, n258, n257, n256, 
        n289, n290, n291, n292, n293, n294, n295, n296, n297, 
        n298, n299, n300, n301, n302, n303, n304, n305, n306, 
        n307, n308, n309, n310, n311;
    
    VHI i2 (.Z(VCC_net));
    CCU2D sub_5_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(factor_c_0), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n264), .S1(n6[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_1.INIT0 = 16'hF000;
    defparam sub_5_add_2_1.INIT1 = 16'h5555;
    defparam sub_5_add_2_1.INJECT1_0 = "NO";
    defparam sub_5_add_2_1.INJECT1_1 = "NO";
    OB clk_o_pad (.I(clk_o_c), .O(clk_o));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(41[13:18])
    CCU2D sub_23_add_2_15 (.A0(count[13]), .B0(factor_c_14), .C0(GND_net), 
          .D0(GND_net), .A1(count[14]), .B1(factor_c_15), .C1(GND_net), 
          .D1(GND_net), .CIN(n286), .COUT(n287));
    defparam sub_23_add_2_15.INIT0 = 16'h5999;
    defparam sub_23_add_2_15.INIT1 = 16'h5999;
    defparam sub_23_add_2_15.INJECT1_0 = "NO";
    defparam sub_23_add_2_15.INJECT1_1 = "NO";
    FD1S3IX count_26__i0 (.D(n134[0]), .CK(clk_i_c), .CD(n215), .Q(count[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i0.GSR = "ENABLED";
    VLO i1 (.Z(GND_net));
    LUT4 i22_2_lut (.A(n39), .B(reset_c), .Z(n215)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(54[5] 64[8])
    defparam i22_2_lut.init = 16'heeee;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    FD1S3IX count_26__i31 (.D(n134[31]), .CK(clk_i_c), .CD(n215), .Q(count[31]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i31.GSR = "ENABLED";
    IB factor_pad_31 (.I(factor[31]), .O(factor_c_31));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    GSR GSR_INST (.GSR(VCC_net));
    CCU2D count_26_add_4_33 (.A0(count[31]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n311), .S0(n134[31]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_33.INIT0 = 16'hfaaa;
    defparam count_26_add_4_33.INIT1 = 16'h0000;
    defparam count_26_add_4_33.INJECT1_0 = "NO";
    defparam count_26_add_4_33.INJECT1_1 = "NO";
    CCU2D count_26_add_4_31 (.A0(count[29]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[30]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n310), .COUT(n311), .S0(n134[29]), .S1(n134[30]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_31.INIT0 = 16'hfaaa;
    defparam count_26_add_4_31.INIT1 = 16'hfaaa;
    defparam count_26_add_4_31.INJECT1_0 = "NO";
    defparam count_26_add_4_31.INJECT1_1 = "NO";
    CCU2D count_26_add_4_29 (.A0(count[27]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[28]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n309), .COUT(n310), .S0(n134[27]), .S1(n134[28]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_29.INIT0 = 16'hfaaa;
    defparam count_26_add_4_29.INIT1 = 16'hfaaa;
    defparam count_26_add_4_29.INJECT1_0 = "NO";
    defparam count_26_add_4_29.INJECT1_1 = "NO";
    CCU2D count_26_add_4_27 (.A0(count[25]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[26]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n308), .COUT(n309), .S0(n134[25]), .S1(n134[26]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_27.INIT0 = 16'hfaaa;
    defparam count_26_add_4_27.INIT1 = 16'hfaaa;
    defparam count_26_add_4_27.INJECT1_0 = "NO";
    defparam count_26_add_4_27.INJECT1_1 = "NO";
    CCU2D count_26_add_4_25 (.A0(count[23]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[24]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n307), .COUT(n308), .S0(n134[23]), .S1(n134[24]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_25.INIT0 = 16'hfaaa;
    defparam count_26_add_4_25.INIT1 = 16'hfaaa;
    defparam count_26_add_4_25.INJECT1_0 = "NO";
    defparam count_26_add_4_25.INJECT1_1 = "NO";
    CCU2D count_26_add_4_23 (.A0(count[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n306), .COUT(n307), .S0(n134[21]), .S1(n134[22]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_23.INIT0 = 16'hfaaa;
    defparam count_26_add_4_23.INIT1 = 16'hfaaa;
    defparam count_26_add_4_23.INJECT1_0 = "NO";
    defparam count_26_add_4_23.INJECT1_1 = "NO";
    CCU2D count_26_add_4_21 (.A0(count[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n305), .COUT(n306), .S0(n134[19]), .S1(n134[20]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_21.INIT0 = 16'hfaaa;
    defparam count_26_add_4_21.INIT1 = 16'hfaaa;
    defparam count_26_add_4_21.INJECT1_0 = "NO";
    defparam count_26_add_4_21.INJECT1_1 = "NO";
    CCU2D count_26_add_4_19 (.A0(count[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n304), .COUT(n305), .S0(n134[17]), .S1(n134[18]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_19.INIT0 = 16'hfaaa;
    defparam count_26_add_4_19.INIT1 = 16'hfaaa;
    defparam count_26_add_4_19.INJECT1_0 = "NO";
    defparam count_26_add_4_19.INJECT1_1 = "NO";
    CCU2D count_26_add_4_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n303), .COUT(n304), .S0(n134[15]), .S1(n134[16]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_17.INIT0 = 16'hfaaa;
    defparam count_26_add_4_17.INIT1 = 16'hfaaa;
    defparam count_26_add_4_17.INJECT1_0 = "NO";
    defparam count_26_add_4_17.INJECT1_1 = "NO";
    CCU2D count_26_add_4_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n302), .COUT(n303), .S0(n134[13]), .S1(n134[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_15.INIT0 = 16'hfaaa;
    defparam count_26_add_4_15.INIT1 = 16'hfaaa;
    defparam count_26_add_4_15.INJECT1_0 = "NO";
    defparam count_26_add_4_15.INJECT1_1 = "NO";
    CCU2D count_26_add_4_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n301), .COUT(n302), .S0(n134[11]), .S1(n134[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_13.INIT0 = 16'hfaaa;
    defparam count_26_add_4_13.INIT1 = 16'hfaaa;
    defparam count_26_add_4_13.INJECT1_0 = "NO";
    defparam count_26_add_4_13.INJECT1_1 = "NO";
    CCU2D count_26_add_4_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n300), .COUT(n301), .S0(n134[9]), .S1(n134[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_11.INIT0 = 16'hfaaa;
    defparam count_26_add_4_11.INIT1 = 16'hfaaa;
    defparam count_26_add_4_11.INJECT1_0 = "NO";
    defparam count_26_add_4_11.INJECT1_1 = "NO";
    CCU2D count_26_add_4_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n299), .COUT(n300), .S0(n134[7]), .S1(n134[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_9.INIT0 = 16'hfaaa;
    defparam count_26_add_4_9.INIT1 = 16'hfaaa;
    defparam count_26_add_4_9.INJECT1_0 = "NO";
    defparam count_26_add_4_9.INJECT1_1 = "NO";
    CCU2D count_26_add_4_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n298), .COUT(n299), .S0(n134[5]), .S1(n134[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_7.INIT0 = 16'hfaaa;
    defparam count_26_add_4_7.INIT1 = 16'hfaaa;
    defparam count_26_add_4_7.INJECT1_0 = "NO";
    defparam count_26_add_4_7.INJECT1_1 = "NO";
    CCU2D count_26_add_4_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n297), .COUT(n298), .S0(n134[3]), .S1(n134[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_5.INIT0 = 16'hfaaa;
    defparam count_26_add_4_5.INIT1 = 16'hfaaa;
    defparam count_26_add_4_5.INJECT1_0 = "NO";
    defparam count_26_add_4_5.INJECT1_1 = "NO";
    CCU2D count_26_add_4_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n296), .COUT(n297), .S0(n134[1]), .S1(n134[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_3.INIT0 = 16'hfaaa;
    defparam count_26_add_4_3.INIT1 = 16'hfaaa;
    defparam count_26_add_4_3.INJECT1_0 = "NO";
    defparam count_26_add_4_3.INJECT1_1 = "NO";
    CCU2D count_26_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n296), .S1(n134[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26_add_4_1.INIT0 = 16'hF000;
    defparam count_26_add_4_1.INIT1 = 16'h0555;
    defparam count_26_add_4_1.INJECT1_0 = "NO";
    defparam count_26_add_4_1.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_33 (.A0(count[31]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n295), .S1(n250));
    defparam sub_23_add_2_33.INIT0 = 16'h5555;
    defparam sub_23_add_2_33.INIT1 = 16'h0000;
    defparam sub_23_add_2_33.INJECT1_0 = "NO";
    defparam sub_23_add_2_33.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_31 (.A0(count[29]), .B0(factor_c_30), .C0(GND_net), 
          .D0(GND_net), .A1(count[30]), .B1(factor_c_31), .C1(GND_net), 
          .D1(GND_net), .CIN(n294), .COUT(n295));
    defparam sub_23_add_2_31.INIT0 = 16'h5999;
    defparam sub_23_add_2_31.INIT1 = 16'h5999;
    defparam sub_23_add_2_31.INJECT1_0 = "NO";
    defparam sub_23_add_2_31.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_29 (.A0(count[27]), .B0(factor_c_28), .C0(GND_net), 
          .D0(GND_net), .A1(count[28]), .B1(factor_c_29), .C1(GND_net), 
          .D1(GND_net), .CIN(n293), .COUT(n294));
    defparam sub_23_add_2_29.INIT0 = 16'h5999;
    defparam sub_23_add_2_29.INIT1 = 16'h5999;
    defparam sub_23_add_2_29.INJECT1_0 = "NO";
    defparam sub_23_add_2_29.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_27 (.A0(count[25]), .B0(factor_c_26), .C0(GND_net), 
          .D0(GND_net), .A1(count[26]), .B1(factor_c_27), .C1(GND_net), 
          .D1(GND_net), .CIN(n292), .COUT(n293));
    defparam sub_23_add_2_27.INIT0 = 16'h5999;
    defparam sub_23_add_2_27.INIT1 = 16'h5999;
    defparam sub_23_add_2_27.INJECT1_0 = "NO";
    defparam sub_23_add_2_27.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_25 (.A0(count[23]), .B0(factor_c_24), .C0(GND_net), 
          .D0(GND_net), .A1(count[24]), .B1(factor_c_25), .C1(GND_net), 
          .D1(GND_net), .CIN(n291), .COUT(n292));
    defparam sub_23_add_2_25.INIT0 = 16'h5999;
    defparam sub_23_add_2_25.INIT1 = 16'h5999;
    defparam sub_23_add_2_25.INJECT1_0 = "NO";
    defparam sub_23_add_2_25.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_23 (.A0(count[21]), .B0(factor_c_22), .C0(GND_net), 
          .D0(GND_net), .A1(count[22]), .B1(factor_c_23), .C1(GND_net), 
          .D1(GND_net), .CIN(n290), .COUT(n291));
    defparam sub_23_add_2_23.INIT0 = 16'h5999;
    defparam sub_23_add_2_23.INIT1 = 16'h5999;
    defparam sub_23_add_2_23.INJECT1_0 = "NO";
    defparam sub_23_add_2_23.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_21 (.A0(count[19]), .B0(factor_c_20), .C0(GND_net), 
          .D0(GND_net), .A1(count[20]), .B1(factor_c_21), .C1(GND_net), 
          .D1(GND_net), .CIN(n289), .COUT(n290));
    defparam sub_23_add_2_21.INIT0 = 16'h5999;
    defparam sub_23_add_2_21.INIT1 = 16'h5999;
    defparam sub_23_add_2_21.INJECT1_0 = "NO";
    defparam sub_23_add_2_21.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_19 (.A0(count[17]), .B0(factor_c_18), .C0(GND_net), 
          .D0(GND_net), .A1(count[18]), .B1(factor_c_19), .C1(GND_net), 
          .D1(GND_net), .CIN(n288), .COUT(n289));
    defparam sub_23_add_2_19.INIT0 = 16'h5999;
    defparam sub_23_add_2_19.INIT1 = 16'h5999;
    defparam sub_23_add_2_19.INJECT1_0 = "NO";
    defparam sub_23_add_2_19.INJECT1_1 = "NO";
    OFS1P3IX clk_o_15 (.D(n250), .SP(VCC_net), .SCLK(clk_i_c), .CD(reset_c), 
            .Q(clk_o_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(46[9] 65[6])
    defparam clk_o_15.GSR = "ENABLED";
    FD1S3IX count_26__i30 (.D(n134[30]), .CK(clk_i_c), .CD(n215), .Q(count[30]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i30.GSR = "ENABLED";
    FD1S3IX count_26__i29 (.D(n134[29]), .CK(clk_i_c), .CD(n215), .Q(count[29]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i29.GSR = "ENABLED";
    FD1S3IX count_26__i28 (.D(n134[28]), .CK(clk_i_c), .CD(n215), .Q(count[28]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i28.GSR = "ENABLED";
    FD1S3IX count_26__i27 (.D(n134[27]), .CK(clk_i_c), .CD(n215), .Q(count[27]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i27.GSR = "ENABLED";
    FD1S3IX count_26__i26 (.D(n134[26]), .CK(clk_i_c), .CD(n215), .Q(count[26]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i26.GSR = "ENABLED";
    FD1S3IX count_26__i25 (.D(n134[25]), .CK(clk_i_c), .CD(n215), .Q(count[25]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i25.GSR = "ENABLED";
    FD1S3IX count_26__i24 (.D(n134[24]), .CK(clk_i_c), .CD(n215), .Q(count[24]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i24.GSR = "ENABLED";
    FD1S3IX count_26__i23 (.D(n134[23]), .CK(clk_i_c), .CD(n215), .Q(count[23]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i23.GSR = "ENABLED";
    FD1S3IX count_26__i22 (.D(n134[22]), .CK(clk_i_c), .CD(n215), .Q(count[22]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i22.GSR = "ENABLED";
    FD1S3IX count_26__i21 (.D(n134[21]), .CK(clk_i_c), .CD(n215), .Q(count[21]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i21.GSR = "ENABLED";
    FD1S3IX count_26__i20 (.D(n134[20]), .CK(clk_i_c), .CD(n215), .Q(count[20]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i20.GSR = "ENABLED";
    FD1S3IX count_26__i19 (.D(n134[19]), .CK(clk_i_c), .CD(n215), .Q(count[19]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i19.GSR = "ENABLED";
    FD1S3IX count_26__i18 (.D(n134[18]), .CK(clk_i_c), .CD(n215), .Q(count[18]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i18.GSR = "ENABLED";
    FD1S3IX count_26__i17 (.D(n134[17]), .CK(clk_i_c), .CD(n215), .Q(count[17]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i17.GSR = "ENABLED";
    FD1S3IX count_26__i16 (.D(n134[16]), .CK(clk_i_c), .CD(n215), .Q(count[16]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i16.GSR = "ENABLED";
    FD1S3IX count_26__i15 (.D(n134[15]), .CK(clk_i_c), .CD(n215), .Q(count[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i15.GSR = "ENABLED";
    FD1S3IX count_26__i14 (.D(n134[14]), .CK(clk_i_c), .CD(n215), .Q(count[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i14.GSR = "ENABLED";
    FD1S3IX count_26__i13 (.D(n134[13]), .CK(clk_i_c), .CD(n215), .Q(count[13]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i13.GSR = "ENABLED";
    FD1S3IX count_26__i12 (.D(n134[12]), .CK(clk_i_c), .CD(n215), .Q(count[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i12.GSR = "ENABLED";
    FD1S3IX count_26__i11 (.D(n134[11]), .CK(clk_i_c), .CD(n215), .Q(count[11]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i11.GSR = "ENABLED";
    FD1S3IX count_26__i10 (.D(n134[10]), .CK(clk_i_c), .CD(n215), .Q(count[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i10.GSR = "ENABLED";
    FD1S3IX count_26__i9 (.D(n134[9]), .CK(clk_i_c), .CD(n215), .Q(count[9]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i9.GSR = "ENABLED";
    FD1S3IX count_26__i8 (.D(n134[8]), .CK(clk_i_c), .CD(n215), .Q(count[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i8.GSR = "ENABLED";
    FD1S3IX count_26__i7 (.D(n134[7]), .CK(clk_i_c), .CD(n215), .Q(count[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i7.GSR = "ENABLED";
    FD1S3IX count_26__i6 (.D(n134[6]), .CK(clk_i_c), .CD(n215), .Q(count[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i6.GSR = "ENABLED";
    FD1S3IX count_26__i5 (.D(n134[5]), .CK(clk_i_c), .CD(n215), .Q(count[5]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i5.GSR = "ENABLED";
    FD1S3IX count_26__i4 (.D(n134[4]), .CK(clk_i_c), .CD(n215), .Q(count[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i4.GSR = "ENABLED";
    FD1S3IX count_26__i3 (.D(n134[3]), .CK(clk_i_c), .CD(n215), .Q(count[3]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i3.GSR = "ENABLED";
    FD1S3IX count_26__i2 (.D(n134[2]), .CK(clk_i_c), .CD(n215), .Q(count[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i2.GSR = "ENABLED";
    FD1S3IX count_26__i1 (.D(n134[1]), .CK(clk_i_c), .CD(n215), .Q(count[1]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(63[16:25])
    defparam count_26__i1.GSR = "ENABLED";
    CCU2D sub_23_add_2_17 (.A0(count[15]), .B0(factor_c_16), .C0(GND_net), 
          .D0(GND_net), .A1(count[16]), .B1(factor_c_17), .C1(GND_net), 
          .D1(GND_net), .CIN(n287), .COUT(n288));
    defparam sub_23_add_2_17.INIT0 = 16'h5999;
    defparam sub_23_add_2_17.INIT1 = 16'h5999;
    defparam sub_23_add_2_17.INJECT1_0 = "NO";
    defparam sub_23_add_2_17.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_13 (.A0(count[11]), .B0(factor_c_12), .C0(GND_net), 
          .D0(GND_net), .A1(count[12]), .B1(factor_c_13), .C1(GND_net), 
          .D1(GND_net), .CIN(n285), .COUT(n286));
    defparam sub_23_add_2_13.INIT0 = 16'h5999;
    defparam sub_23_add_2_13.INIT1 = 16'h5999;
    defparam sub_23_add_2_13.INJECT1_0 = "NO";
    defparam sub_23_add_2_13.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_11 (.A0(count[9]), .B0(factor_c_10), .C0(GND_net), 
          .D0(GND_net), .A1(count[10]), .B1(factor_c_11), .C1(GND_net), 
          .D1(GND_net), .CIN(n284), .COUT(n285));
    defparam sub_23_add_2_11.INIT0 = 16'h5999;
    defparam sub_23_add_2_11.INIT1 = 16'h5999;
    defparam sub_23_add_2_11.INJECT1_0 = "NO";
    defparam sub_23_add_2_11.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_9 (.A0(count[7]), .B0(factor_c_8), .C0(GND_net), 
          .D0(GND_net), .A1(count[8]), .B1(factor_c_9), .C1(GND_net), 
          .D1(GND_net), .CIN(n283), .COUT(n284));
    defparam sub_23_add_2_9.INIT0 = 16'h5999;
    defparam sub_23_add_2_9.INIT1 = 16'h5999;
    defparam sub_23_add_2_9.INJECT1_0 = "NO";
    defparam sub_23_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_7 (.A0(count[5]), .B0(factor_c_6), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(factor_c_7), .C1(GND_net), 
          .D1(GND_net), .CIN(n282), .COUT(n283));
    defparam sub_23_add_2_7.INIT0 = 16'h5999;
    defparam sub_23_add_2_7.INIT1 = 16'h5999;
    defparam sub_23_add_2_7.INJECT1_0 = "NO";
    defparam sub_23_add_2_7.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_5 (.A0(count[3]), .B0(factor_c_4), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(factor_c_5), .C1(GND_net), 
          .D1(GND_net), .CIN(n281), .COUT(n282));
    defparam sub_23_add_2_5.INIT0 = 16'h5999;
    defparam sub_23_add_2_5.INIT1 = 16'h5999;
    defparam sub_23_add_2_5.INJECT1_0 = "NO";
    defparam sub_23_add_2_5.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_3 (.A0(count[1]), .B0(factor_c_2), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(factor_c_3), .C1(GND_net), 
          .D1(GND_net), .CIN(n280), .COUT(n281));
    defparam sub_23_add_2_3.INIT0 = 16'h5999;
    defparam sub_23_add_2_3.INIT1 = 16'h5999;
    defparam sub_23_add_2_3.INJECT1_0 = "NO";
    defparam sub_23_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_23_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(factor_c_1), .C1(GND_net), .D1(GND_net), 
          .COUT(n280));
    defparam sub_23_add_2_1.INIT0 = 16'h0000;
    defparam sub_23_add_2_1.INIT1 = 16'h5999;
    defparam sub_23_add_2_1.INJECT1_0 = "NO";
    defparam sub_23_add_2_1.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_33 (.A0(factor_c_31), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n279), .S0(n6[31]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_33.INIT0 = 16'h5555;
    defparam sub_5_add_2_33.INIT1 = 16'h0000;
    defparam sub_5_add_2_33.INJECT1_0 = "NO";
    defparam sub_5_add_2_33.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_31 (.A0(factor_c_29), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_30), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n278), .COUT(n279), .S0(n6[29]), .S1(n6[30]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_31.INIT0 = 16'h5555;
    defparam sub_5_add_2_31.INIT1 = 16'h5555;
    defparam sub_5_add_2_31.INJECT1_0 = "NO";
    defparam sub_5_add_2_31.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_29 (.A0(factor_c_27), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_28), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n277), .COUT(n278), .S0(n6[27]), .S1(n6[28]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_29.INIT0 = 16'h5555;
    defparam sub_5_add_2_29.INIT1 = 16'h5555;
    defparam sub_5_add_2_29.INJECT1_0 = "NO";
    defparam sub_5_add_2_29.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_27 (.A0(factor_c_25), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_26), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n276), .COUT(n277), .S0(n6[25]), .S1(n6[26]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_27.INIT0 = 16'h5555;
    defparam sub_5_add_2_27.INIT1 = 16'h5555;
    defparam sub_5_add_2_27.INJECT1_0 = "NO";
    defparam sub_5_add_2_27.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_25 (.A0(factor_c_23), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_24), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n275), .COUT(n276), .S0(n6[23]), .S1(n6[24]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_25.INIT0 = 16'h5555;
    defparam sub_5_add_2_25.INIT1 = 16'h5555;
    defparam sub_5_add_2_25.INJECT1_0 = "NO";
    defparam sub_5_add_2_25.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_23 (.A0(factor_c_21), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_22), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n274), .COUT(n275), .S0(n6[21]), .S1(n6[22]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_23.INIT0 = 16'h5555;
    defparam sub_5_add_2_23.INIT1 = 16'h5555;
    defparam sub_5_add_2_23.INJECT1_0 = "NO";
    defparam sub_5_add_2_23.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_21 (.A0(factor_c_19), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_20), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n273), .COUT(n274), .S0(n6[19]), .S1(n6[20]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_21.INIT0 = 16'h5555;
    defparam sub_5_add_2_21.INIT1 = 16'h5555;
    defparam sub_5_add_2_21.INJECT1_0 = "NO";
    defparam sub_5_add_2_21.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_19 (.A0(factor_c_17), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_18), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n272), .COUT(n273), .S0(n6[17]), .S1(n6[18]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_19.INIT0 = 16'h5555;
    defparam sub_5_add_2_19.INIT1 = 16'h5555;
    defparam sub_5_add_2_19.INJECT1_0 = "NO";
    defparam sub_5_add_2_19.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_17 (.A0(factor_c_15), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_16), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n271), .COUT(n272), .S0(n6[15]), .S1(n6[16]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_17.INIT0 = 16'h5555;
    defparam sub_5_add_2_17.INIT1 = 16'h5555;
    defparam sub_5_add_2_17.INJECT1_0 = "NO";
    defparam sub_5_add_2_17.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_15 (.A0(factor_c_13), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_14), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n270), .COUT(n271), .S0(n6[13]), .S1(n6[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_15.INIT0 = 16'h5555;
    defparam sub_5_add_2_15.INIT1 = 16'h5555;
    defparam sub_5_add_2_15.INJECT1_0 = "NO";
    defparam sub_5_add_2_15.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_13 (.A0(factor_c_11), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_12), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n269), .COUT(n270), .S0(n6[11]), .S1(n6[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_13.INIT0 = 16'h5555;
    defparam sub_5_add_2_13.INIT1 = 16'h5555;
    defparam sub_5_add_2_13.INJECT1_0 = "NO";
    defparam sub_5_add_2_13.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_11 (.A0(factor_c_9), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_10), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n268), .COUT(n269), .S0(n6[9]), .S1(n6[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_11.INIT0 = 16'h5555;
    defparam sub_5_add_2_11.INIT1 = 16'h5555;
    defparam sub_5_add_2_11.INJECT1_0 = "NO";
    defparam sub_5_add_2_11.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_9 (.A0(factor_c_7), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_8), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n267), .COUT(n268), .S0(n6[7]), .S1(n6[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_9.INIT0 = 16'h5555;
    defparam sub_5_add_2_9.INIT1 = 16'h5555;
    defparam sub_5_add_2_9.INJECT1_0 = "NO";
    defparam sub_5_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_7 (.A0(factor_c_5), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_6), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n266), .COUT(n267), .S0(n6[5]), .S1(n6[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_7.INIT0 = 16'h5555;
    defparam sub_5_add_2_7.INIT1 = 16'h5555;
    defparam sub_5_add_2_7.INJECT1_0 = "NO";
    defparam sub_5_add_2_7.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_5 (.A0(factor_c_3), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_4), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n265), .COUT(n266), .S0(n6[3]), .S1(n6[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_5.INIT0 = 16'h5555;
    defparam sub_5_add_2_5.INIT1 = 16'h5555;
    defparam sub_5_add_2_5.INJECT1_0 = "NO";
    defparam sub_5_add_2_5.INJECT1_1 = "NO";
    CCU2D sub_5_add_2_3 (.A0(factor_c_1), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(factor_c_2), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n264), .COUT(n265), .S0(n6[1]), .S1(n6[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[18:26])
    defparam sub_5_add_2_3.INIT0 = 16'h5555;
    defparam sub_5_add_2_3.INIT1 = 16'h5555;
    defparam sub_5_add_2_3.INJECT1_0 = "NO";
    defparam sub_5_add_2_3.INJECT1_1 = "NO";
    CCU2D equal_6_32 (.A0(n6[1]), .B0(count[1]), .C0(n6[0]), .D0(count[0]), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n263), 
          .S1(n39));
    defparam equal_6_32.INIT0 = 16'h9009;
    defparam equal_6_32.INIT1 = 16'hFFFF;
    defparam equal_6_32.INJECT1_0 = "YES";
    defparam equal_6_32.INJECT1_1 = "NO";
    CCU2D equal_6_31 (.A0(n6[5]), .B0(count[5]), .C0(n6[4]), .D0(count[4]), 
          .A1(n6[3]), .B1(count[3]), .C1(n6[2]), .D1(count[2]), .CIN(n262), 
          .COUT(n263));
    defparam equal_6_31.INIT0 = 16'h9009;
    defparam equal_6_31.INIT1 = 16'h9009;
    defparam equal_6_31.INJECT1_0 = "YES";
    defparam equal_6_31.INJECT1_1 = "YES";
    CCU2D equal_6_29 (.A0(n6[9]), .B0(count[9]), .C0(n6[8]), .D0(count[8]), 
          .A1(n6[7]), .B1(count[7]), .C1(n6[6]), .D1(count[6]), .CIN(n261), 
          .COUT(n262));
    defparam equal_6_29.INIT0 = 16'h9009;
    defparam equal_6_29.INIT1 = 16'h9009;
    defparam equal_6_29.INJECT1_0 = "YES";
    defparam equal_6_29.INJECT1_1 = "YES";
    CCU2D equal_6_27 (.A0(n6[13]), .B0(count[13]), .C0(n6[12]), .D0(count[12]), 
          .A1(n6[11]), .B1(count[11]), .C1(n6[10]), .D1(count[10]), 
          .CIN(n260), .COUT(n261));
    defparam equal_6_27.INIT0 = 16'h9009;
    defparam equal_6_27.INIT1 = 16'h9009;
    defparam equal_6_27.INJECT1_0 = "YES";
    defparam equal_6_27.INJECT1_1 = "YES";
    CCU2D equal_6_25 (.A0(n6[17]), .B0(count[17]), .C0(n6[16]), .D0(count[16]), 
          .A1(n6[15]), .B1(count[15]), .C1(n6[14]), .D1(count[14]), 
          .CIN(n259), .COUT(n260));
    defparam equal_6_25.INIT0 = 16'h9009;
    defparam equal_6_25.INIT1 = 16'h9009;
    defparam equal_6_25.INJECT1_0 = "YES";
    defparam equal_6_25.INJECT1_1 = "YES";
    CCU2D equal_6_23 (.A0(n6[21]), .B0(count[21]), .C0(n6[20]), .D0(count[20]), 
          .A1(n6[19]), .B1(count[19]), .C1(n6[18]), .D1(count[18]), 
          .CIN(n258), .COUT(n259));
    defparam equal_6_23.INIT0 = 16'h9009;
    defparam equal_6_23.INIT1 = 16'h9009;
    defparam equal_6_23.INJECT1_0 = "YES";
    defparam equal_6_23.INJECT1_1 = "YES";
    CCU2D equal_6_21 (.A0(n6[25]), .B0(count[25]), .C0(n6[24]), .D0(count[24]), 
          .A1(n6[23]), .B1(count[23]), .C1(n6[22]), .D1(count[22]), 
          .CIN(n257), .COUT(n258));
    defparam equal_6_21.INIT0 = 16'h9009;
    defparam equal_6_21.INIT1 = 16'h9009;
    defparam equal_6_21.INJECT1_0 = "YES";
    defparam equal_6_21.INJECT1_1 = "YES";
    CCU2D equal_6_19 (.A0(n6[29]), .B0(count[29]), .C0(n6[28]), .D0(count[28]), 
          .A1(n6[27]), .B1(count[27]), .C1(n6[26]), .D1(count[26]), 
          .CIN(n256), .COUT(n257));
    defparam equal_6_19.INIT0 = 16'h9009;
    defparam equal_6_19.INIT1 = 16'h9009;
    defparam equal_6_19.INJECT1_0 = "YES";
    defparam equal_6_19.INJECT1_1 = "YES";
    CCU2D equal_6_0 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n6[31]), .B1(count[31]), .C1(n6[30]), .D1(count[30]), 
          .COUT(n256));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(60[9:26])
    defparam equal_6_0.INIT0 = 16'hF000;
    defparam equal_6_0.INIT1 = 16'h9009;
    defparam equal_6_0.INJECT1_0 = "NO";
    defparam equal_6_0.INJECT1_1 = "YES";
    IB factor_pad_30 (.I(factor[30]), .O(factor_c_30));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_29 (.I(factor[29]), .O(factor_c_29));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_28 (.I(factor[28]), .O(factor_c_28));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_27 (.I(factor[27]), .O(factor_c_27));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_26 (.I(factor[26]), .O(factor_c_26));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_25 (.I(factor[25]), .O(factor_c_25));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_24 (.I(factor[24]), .O(factor_c_24));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_23 (.I(factor[23]), .O(factor_c_23));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_22 (.I(factor[22]), .O(factor_c_22));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_21 (.I(factor[21]), .O(factor_c_21));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_20 (.I(factor[20]), .O(factor_c_20));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_19 (.I(factor[19]), .O(factor_c_19));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_18 (.I(factor[18]), .O(factor_c_18));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_17 (.I(factor[17]), .O(factor_c_17));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_16 (.I(factor[16]), .O(factor_c_16));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_15 (.I(factor[15]), .O(factor_c_15));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_14 (.I(factor[14]), .O(factor_c_14));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_13 (.I(factor[13]), .O(factor_c_13));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_12 (.I(factor[12]), .O(factor_c_12));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_11 (.I(factor[11]), .O(factor_c_11));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_10 (.I(factor[10]), .O(factor_c_10));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_9 (.I(factor[9]), .O(factor_c_9));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_8 (.I(factor[8]), .O(factor_c_8));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_7 (.I(factor[7]), .O(factor_c_7));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_6 (.I(factor[6]), .O(factor_c_6));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_5 (.I(factor[5]), .O(factor_c_5));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_4 (.I(factor[4]), .O(factor_c_4));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_3 (.I(factor[3]), .O(factor_c_3));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_2 (.I(factor[2]), .O(factor_c_2));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_1 (.I(factor[1]), .O(factor_c_1));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB factor_pad_0 (.I(factor[0]), .O(factor_c_0));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(39[20:26])
    IB clk_i_pad (.I(clk_i), .O(clk_i_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(40[13:18])
    IB reset_pad (.I(reset), .O(reset_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/clk.v(42[13:18])
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

