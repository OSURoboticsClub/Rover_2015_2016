// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.4.1.213
// Netlist written on Sat Jan  9 21:51:52 2016
//
// Verilog Description of module RCPeripheral
//

module RCPeripheral (clk_255kHz, databus, reg_size, register_addr, rw, 
            select, rc1, rc2, rc3, rc4, rc7, rc8, reset) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(180[8:20])
    input clk_255kHz;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    output [31:0]databus;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(182[20:27])
    output [2:0]reg_size;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(183[19:27])
    input [7:0]register_addr;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    input rw;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(185[13:15])
    input select;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(186[13:19])
    input rc1;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(187[13:16])
    input rc2;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(188[13:16])
    input rc3;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(189[13:16])
    input rc4;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(190[13:16])
    input rc7;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(191[13:16])
    input rc8;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(192[13:16])
    input reset;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(193[13:18])
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire select_c /* synthesis SET_AS_NETWORK=select_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(186[13:19])
    wire n8057 /* synthesis nomerge= */ ;
    
    wire GND_net, VCC_net, n5, n4, n2, n1, n5_adj_32, n4_adj_33, 
        n2_adj_34, n1_adj_35, n5_adj_36, n4_adj_37, n2_adj_38, n1_adj_39, 
        n5_adj_40, n4_adj_41, n2_adj_42, n1_adj_43, n5_adj_44, n4_adj_45, 
        n2_adj_46, n1_adj_47, n5_adj_48, n4_adj_49, n2_adj_50, n1_adj_51, 
        register_addr_c_7, register_addr_c_6, register_addr_c_5, register_addr_c_4, 
        register_addr_c_3, register_addr_c_2, register_addr_c_1, register_addr_c_0, 
        rw_c, rc1_c, rc2_c, rc3_c, rc4_c, rc7_c, rc8_c, reset_c;
    wire [7:0]\register[6] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[5] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[4] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[3] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[2] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[1] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]\register[0] ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(197[13:21])
    wire [7:0]read_value;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(200[12:22])
    wire [2:0]read_size;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(201[12:21])
    
    wire n176, n7354, n7351, n7348, n7357, n7366, n7360, n7363, 
        n5_adj_52, n4_adj_53, n2_adj_54, n1_adj_55, n1270, n8, n7, 
        n5_adj_56, n1_adj_57, n4_adj_58, n7368, n7367, n2_adj_59, 
        n7365, n7364, n7712, n1301, n7362, n7361, n7359, n7358, 
        n7356, n7355, n7353, n7352, n7350, n7349, n7347, n7346, 
        n7345;
    
    VHI i2 (.Z(VCC_net));
    PWMReceiver recv_ch8 (.clk_255kHz_c(clk_255kHz_c), .VCC_net(VCC_net), 
            .GND_net(GND_net), .rc8_c(rc8_c), .\register[6] ({\register[6] }), 
            .n8057(n8057), .reset_c(reset_c), .\register[0][7] (\register[0] [7])) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(247[14] 251[36])
    OBZ databus_pad_31 (.I(GND_net), .T(n1270), .O(databus[31]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_24 (.I(GND_net), .T(n1270), .O(databus[24]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_23 (.I(GND_net), .T(n1270), .O(databus[23]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_22 (.I(GND_net), .T(n1270), .O(databus[22]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OFS1P3IX read_value__i1 (.D(n7359), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[1]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i1.GSR = "ENABLED";
    OBZ databus_pad_21 (.I(GND_net), .T(n1270), .O(databus[21]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_0 (.I(read_value[0]), .T(n1270), .O(databus[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_25 (.I(GND_net), .T(n1270), .O(databus[25]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_26 (.I(GND_net), .T(n1270), .O(databus[26]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_27 (.I(GND_net), .T(n1270), .O(databus[27]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    LUT4 i4371_2_lut (.A(\register[1] [5]), .B(register_addr_c_0), .Z(n1_adj_47)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4371_2_lut.init = 16'h8888;
    LUT4 mux_112_Mux_5_i2_3_lut (.A(\register[2] [5]), .B(\register[3] [5]), 
         .C(register_addr_c_0), .Z(n2_adj_46)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_5_i2_3_lut.init = 16'hcaca;
    OBZ databus_pad_28 (.I(GND_net), .T(n1270), .O(databus[28]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_29 (.I(GND_net), .T(n1270), .O(databus[29]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    LUT4 mux_112_Mux_5_i4_3_lut (.A(\register[4] [5]), .B(\register[5] [5]), 
         .C(register_addr_c_0), .Z(n4_adj_45)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_5_i4_3_lut.init = 16'hcaca;
    OBZ databus_pad_30 (.I(GND_net), .T(n1270), .O(databus[30]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    IB reset_pad (.I(reset), .O(reset_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(193[13:18])
    OBZ databus_pad_1 (.I(read_value[1]), .T(n1270), .O(databus[1]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    LUT4 i4379_2_lut (.A(\register[6] [5]), .B(register_addr_c_0), .Z(n5_adj_44)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4379_2_lut.init = 16'h2222;
    OBZ databus_pad_2 (.I(read_value[2]), .T(n1270), .O(databus[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_3 (.I(read_value[3]), .T(n1270), .O(databus[3]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_4 (.I(read_value[4]), .T(n1270), .O(databus[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    LUT4 mux_112_Mux_6_i4_3_lut (.A(\register[4] [6]), .B(\register[5] [6]), 
         .C(register_addr_c_0), .Z(n4_adj_49)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_6_i4_3_lut.init = 16'hcaca;
    IB rc8_pad (.I(rc8), .O(rc8_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(192[13:16])
    LUT4 i4380_2_lut (.A(\register[6] [6]), .B(register_addr_c_0), .Z(n5_adj_48)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4380_2_lut.init = 16'h2222;
    IB rc7_pad (.I(rc7), .O(rc7_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(191[13:16])
    IB rc4_pad (.I(rc4), .O(rc4_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(190[13:16])
    LUT4 mux_112_Mux_7_i4_3_lut (.A(\register[4] [7]), .B(\register[5] [7]), 
         .C(register_addr_c_0), .Z(n4_adj_53)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_7_i4_3_lut.init = 16'hcaca;
    IB rc3_pad (.I(rc3), .O(rc3_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(189[13:16])
    IB rc2_pad (.I(rc2), .O(rc2_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(188[13:16])
    LUT4 i4381_2_lut (.A(\register[6] [7]), .B(register_addr_c_0), .Z(n5_adj_52)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4381_2_lut.init = 16'h2222;
    LUT4 mux_112_Mux_3_i4_3_lut (.A(\register[4] [3]), .B(\register[5] [3]), 
         .C(register_addr_c_0), .Z(n4_adj_37)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_3_i4_3_lut.init = 16'hcaca;
    OBZ databus_pad_5 (.I(read_value[5]), .T(n1270), .O(databus[5]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_6 (.I(read_value[6]), .T(n1270), .O(databus[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_7 (.I(read_value[7]), .T(n1270), .O(databus[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    PFUMX i7113 (.BLUT(n1), .ALUT(n2), .C0(register_addr_c_1), .Z(n7357));
    OBZ databus_pad_8 (.I(GND_net), .T(n1270), .O(databus[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    IB rc1_pad (.I(rc1), .O(rc1_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(187[13:16])
    LUT4 i4376_2_lut (.A(\register[6] [3]), .B(register_addr_c_0), .Z(n5_adj_36)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4376_2_lut.init = 16'h2222;
    IB select_pad (.I(select), .O(select_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(186[13:19])
    IB rw_pad (.I(rw), .O(rw_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(185[13:15])
    LUT4 mux_112_Mux_1_i4_3_lut (.A(\register[4] [1]), .B(\register[5] [1]), 
         .C(register_addr_c_0), .Z(n4)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_1_i4_3_lut.init = 16'hcaca;
    IB register_addr_pad_0 (.I(register_addr[0]), .O(register_addr_c_0));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    IB register_addr_pad_1 (.I(register_addr[1]), .O(register_addr_c_1));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    LUT4 i4370_2_lut (.A(\register[6] [1]), .B(register_addr_c_0), .Z(n5)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4370_2_lut.init = 16'h2222;
    L6MUX21 i7103 (.D0(n7345), .D1(n7346), .SD(register_addr_c_2), .Z(n7347));
    OBZ databus_pad_9 (.I(GND_net), .T(n1270), .O(databus[9]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_10 (.I(GND_net), .T(n1270), .O(databus[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_11 (.I(GND_net), .T(n1270), .O(databus[11]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_12 (.I(GND_net), .T(n1270), .O(databus[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    IB register_addr_pad_2 (.I(register_addr[2]), .O(register_addr_c_2));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    L6MUX21 i7106 (.D0(n7348), .D1(n7349), .SD(register_addr_c_2), .Z(n7350));
    L6MUX21 i7109 (.D0(n7351), .D1(n7352), .SD(register_addr_c_2), .Z(n7353));
    L6MUX21 i7112 (.D0(n7354), .D1(n7355), .SD(register_addr_c_2), .Z(n7356));
    L6MUX21 i7115 (.D0(n7357), .D1(n7358), .SD(register_addr_c_2), .Z(n7359));
    L6MUX21 i7118 (.D0(n7360), .D1(n7361), .SD(register_addr_c_2), .Z(n7362));
    LUT4 mux_112_Mux_1_i1_3_lut (.A(\register[0] [1]), .B(\register[1] [1]), 
         .C(register_addr_c_0), .Z(n1)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_1_i1_3_lut.init = 16'hcaca;
    IB register_addr_pad_3 (.I(register_addr[3]), .O(register_addr_c_3));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    L6MUX21 i7121 (.D0(n7363), .D1(n7364), .SD(register_addr_c_2), .Z(n7365));
    LUT4 mux_112_Mux_1_i2_3_lut (.A(\register[2] [1]), .B(\register[3] [1]), 
         .C(register_addr_c_0), .Z(n2)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_1_i2_3_lut.init = 16'hcaca;
    IB register_addr_pad_4 (.I(register_addr[4]), .O(register_addr_c_4));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    L6MUX21 i7124 (.D0(n7366), .D1(n7367), .SD(register_addr_c_2), .Z(n7368));
    PFUMX i7101 (.BLUT(n1_adj_47), .ALUT(n2_adj_46), .C0(register_addr_c_1), 
          .Z(n7345));
    IB register_addr_pad_5 (.I(register_addr[5]), .O(register_addr_c_5));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    IB register_addr_pad_6 (.I(register_addr[6]), .O(register_addr_c_6));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    LUT4 mux_112_Mux_2_i1_3_lut (.A(\register[0] [2]), .B(\register[1] [2]), 
         .C(register_addr_c_0), .Z(n1_adj_35)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_2_i1_3_lut.init = 16'hcaca;
    LUT4 mux_112_Mux_2_i2_3_lut (.A(\register[2] [2]), .B(\register[3] [2]), 
         .C(register_addr_c_0), .Z(n2_adj_34)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_2_i2_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut (.A(register_addr_c_2), .B(register_addr_c_4), .C(register_addr_c_0), 
         .D(register_addr_c_1), .Z(n7)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut.init = 16'heccc;
    LUT4 i2_2_lut (.A(register_addr_c_5), .B(register_addr_c_7), .Z(n8)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    OBZ databus_pad_13 (.I(GND_net), .T(n1270), .O(databus[13]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    PFUMX i7102 (.BLUT(n4_adj_45), .ALUT(n5_adj_44), .C0(register_addr_c_1), 
          .Z(n7346));
    PFUMX i7105 (.BLUT(n4_adj_49), .ALUT(n5_adj_48), .C0(register_addr_c_1), 
          .Z(n7349));
    PFUMX i7108 (.BLUT(n4_adj_53), .ALUT(n5_adj_52), .C0(register_addr_c_1), 
          .Z(n7352));
    PFUMX i7111 (.BLUT(n4_adj_37), .ALUT(n5_adj_36), .C0(register_addr_c_1), 
          .Z(n7355));
    OBZ databus_pad_14 (.I(GND_net), .T(n1270), .O(databus[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_15 (.I(GND_net), .T(n1270), .O(databus[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_16 (.I(GND_net), .T(n1270), .O(databus[16]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    PFUMX i7114 (.BLUT(n4), .ALUT(n5), .C0(register_addr_c_1), .Z(n7358));
    IB register_addr_pad_7 (.I(register_addr[7]), .O(register_addr_c_7));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(184[19:32])
    LUT4 mux_112_Mux_0_i1_3_lut (.A(\register[0] [0]), .B(\register[1] [0]), 
         .C(register_addr_c_0), .Z(n1_adj_57)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_0_i1_3_lut.init = 16'hcaca;
    LUT4 mux_112_Mux_0_i2_3_lut (.A(\register[2] [0]), .B(\register[3] [0]), 
         .C(register_addr_c_0), .Z(n2_adj_59)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_0_i2_3_lut.init = 16'hcaca;
    LUT4 mux_112_Mux_0_i4_3_lut (.A(\register[4] [0]), .B(\register[5] [0]), 
         .C(register_addr_c_0), .Z(n4_adj_58)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_0_i4_3_lut.init = 16'hcaca;
    LUT4 i4358_2_lut (.A(\register[6] [0]), .B(register_addr_c_0), .Z(n5_adj_56)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4358_2_lut.init = 16'h2222;
    IB clk_255kHz_pad (.I(clk_255kHz), .O(clk_255kHz_c));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    LUT4 mux_112_Mux_3_i1_3_lut (.A(\register[0] [3]), .B(\register[1] [3]), 
         .C(register_addr_c_0), .Z(n1_adj_39)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_3_i1_3_lut.init = 16'hcaca;
    LUT4 mux_112_Mux_3_i2_3_lut (.A(\register[2] [3]), .B(\register[3] [3]), 
         .C(register_addr_c_0), .Z(n2_adj_38)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_3_i2_3_lut.init = 16'hcaca;
    PFUMX i7117 (.BLUT(n4_adj_58), .ALUT(n5_adj_56), .C0(register_addr_c_1), 
          .Z(n7361));
    OBZ reg_size_pad_0 (.I(read_size[0]), .T(n1301), .O(reg_size[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(203[9:17])
    OBZ databus_pad_17 (.I(GND_net), .T(n1270), .O(databus[17]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    PFUMX i7120 (.BLUT(n4_adj_33), .ALUT(n5_adj_32), .C0(register_addr_c_1), 
          .Z(n7364));
    LUT4 mux_112_Mux_7_i1_3_lut (.A(\register[0] [7]), .B(\register[1] [7]), 
         .C(register_addr_c_0), .Z(n1_adj_55)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_7_i1_3_lut.init = 16'hcaca;
    OBZ databus_pad_18 (.I(GND_net), .T(n1270), .O(databus[18]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    LUT4 i7161_2_lut (.A(select_c), .B(rw_c), .Z(n1270)) /* synthesis lut_function=(!(A (B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    defparam i7161_2_lut.init = 16'h7777;
    OBZ databus_pad_19 (.I(GND_net), .T(n1270), .O(databus[19]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    OBZ databus_pad_20 (.I(GND_net), .T(n1270), .O(databus[20]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(204[9:16])
    PFUMX i7123 (.BLUT(n4_adj_41), .ALUT(n5_adj_40), .C0(register_addr_c_1), 
          .Z(n7367));
    OFS1P3DX read_size_i1 (.D(n176), .SP(VCC_net), .SCLK(select_c), .CD(GND_net), 
            .Q(read_size[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_size_i1.GSR = "ENABLED";
    OBZ reg_size_pad_1 (.I(GND_net), .T(n1301), .O(reg_size[1]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(203[9:17])
    OFS1P3IX read_value__i7 (.D(n7353), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i7.GSR = "ENABLED";
    OFS1P3IX read_value__i6 (.D(n7350), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i6.GSR = "ENABLED";
    OFS1P3IX read_value__i5 (.D(n7347), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[5]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i5.GSR = "ENABLED";
    LUT4 mux_112_Mux_7_i2_3_lut (.A(\register[2] [7]), .B(\register[3] [7]), 
         .C(register_addr_c_0), .Z(n2_adj_54)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_7_i2_3_lut.init = 16'hcaca;
    OFS1P3IX read_value__i4 (.D(n7368), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i4.GSR = "ENABLED";
    OFS1P3IX read_value__i3 (.D(n7356), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[3]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i3.GSR = "ENABLED";
    OFS1P3IX read_value__i2 (.D(n7365), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i2.GSR = "ENABLED";
    PFUMX i7122 (.BLUT(n1_adj_43), .ALUT(n2_adj_42), .C0(register_addr_c_1), 
          .Z(n7366));
    LUT4 i1091_1_lut (.A(select_c), .Z(n1301)) /* synthesis lut_function=(!(A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(203[9:17])
    defparam i1091_1_lut.init = 16'h5555;
    OBZ reg_size_pad_2 (.I(GND_net), .T(n1301), .O(reg_size[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(203[9:17])
    OFS1P3IX read_value__i0 (.D(n7362), .SP(VCC_net), .SCLK(select_c), 
            .CD(n7712), .Q(read_value[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(207[9] 219[6])
    defparam read_value__i0.GSR = "ENABLED";
    GSR GSR_INST (.GSR(VCC_net));
    PFUMX i7119 (.BLUT(n1_adj_35), .ALUT(n2_adj_34), .C0(register_addr_c_1), 
          .Z(n7363));
    PFUMX i7116 (.BLUT(n1_adj_57), .ALUT(n2_adj_59), .C0(register_addr_c_1), 
          .Z(n7360));
    PFUMX i7110 (.BLUT(n1_adj_39), .ALUT(n2_adj_38), .C0(register_addr_c_1), 
          .Z(n7354));
    PFUMX i7107 (.BLUT(n1_adj_55), .ALUT(n2_adj_54), .C0(register_addr_c_1), 
          .Z(n7351));
    LUT4 mux_112_Mux_2_i4_3_lut (.A(\register[4] [2]), .B(\register[5] [2]), 
         .C(register_addr_c_0), .Z(n4_adj_33)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_2_i4_3_lut.init = 16'hcaca;
    LUT4 i4373_2_lut (.A(\register[6] [2]), .B(register_addr_c_0), .Z(n5_adj_32)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4373_2_lut.init = 16'h2222;
    LUT4 i5_4_lut_rep_107 (.A(register_addr_c_3), .B(n7), .C(register_addr_c_6), 
         .D(n8), .Z(n7712)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i5_4_lut_rep_107.init = 16'hfffe;
    LUT4 i4599_1_lut_4_lut (.A(register_addr_c_3), .B(n7), .C(register_addr_c_6), 
         .D(n8), .Z(n176)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam i4599_1_lut_4_lut.init = 16'h0001;
    LUT4 mux_112_Mux_4_i4_3_lut (.A(\register[4] [4]), .B(\register[5] [4]), 
         .C(register_addr_c_0), .Z(n4_adj_41)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_4_i4_3_lut.init = 16'hcaca;
    LUT4 i4378_2_lut (.A(\register[6] [4]), .B(register_addr_c_0), .Z(n5_adj_40)) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4378_2_lut.init = 16'h2222;
    PWMReceiver_U3 recv_ch2 (.clk_255kHz_c(clk_255kHz_c), .VCC_net(VCC_net), 
            .GND_net(GND_net), .rc2_c(rc2_c), .reset_c(reset_c), .n8057(n8057), 
            .\register[0][1] (\register[0] [1]), .\register[2] ({\register[2] })) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(227[14] 231[36])
    LUT4 mux_112_Mux_6_i1_3_lut (.A(\register[0] [6]), .B(\register[1] [6]), 
         .C(register_addr_c_0), .Z(n1_adj_51)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_6_i1_3_lut.init = 16'hcaca;
    LUT4 mux_112_Mux_6_i2_3_lut (.A(\register[2] [6]), .B(\register[3] [6]), 
         .C(register_addr_c_0), .Z(n2_adj_50)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_6_i2_3_lut.init = 16'hcaca;
    LUT4 i4372_2_lut (.A(\register[1] [4]), .B(register_addr_c_0), .Z(n1_adj_43)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam i4372_2_lut.init = 16'h8888;
    LUT4 mux_112_Mux_4_i2_3_lut (.A(\register[2] [4]), .B(\register[3] [4]), 
         .C(register_addr_c_0), .Z(n2_adj_42)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(211[29:42])
    defparam mux_112_Mux_4_i2_3_lut.init = 16'hcaca;
    PWMReceiver_U4 recv_ch1 (.clk_255kHz_c(clk_255kHz_c), .GND_net(GND_net), 
            .reset_c(reset_c), .n8057(n8057), .\register[1] ({\register[1] }), 
            .\register[0][0] (\register[0] [0]), .VCC_net(VCC_net), .rc1_c(rc1_c)) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(222[17] 226[36])
    PWMReceiver_U2 recv_ch3 (.clk_255kHz_c(clk_255kHz_c), .VCC_net(VCC_net), 
            .GND_net(GND_net), .rc3_c(rc3_c), .reset_c(reset_c), .n8057(n8057), 
            .\register[3] ({\register[3] }), .\register[0][2] (\register[0] [2])) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(232[14] 236[36])
    PFUMX i7104 (.BLUT(n1_adj_51), .ALUT(n2_adj_50), .C0(register_addr_c_1), 
          .Z(n7348));
    PWMReceiver_U1 recv_ch4 (.clk_255kHz_c(clk_255kHz_c), .VCC_net(VCC_net), 
            .GND_net(GND_net), .rc4_c(rc4_c), .reset_c(reset_c), .n8057(n8057), 
            .\register[4] ({\register[4] }), .\register[0][3] (\register[0] [3])) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(237[14] 241[36])
    PWMReceiver_U0 recv_ch7 (.reset_c(reset_c), .clk_255kHz_c(clk_255kHz_c), 
            .VCC_net(VCC_net), .GND_net(GND_net), .rc7_c(rc7_c), .n8057(n8057), 
            .\register[5] ({\register[5] }), .\register[0][6] (\register[0] [6])) /* synthesis syn_module_defined=1 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(242[14] 246[36])
    VLO i1 (.Z(GND_net));
    LUT4 m1_lut (.Z(n8057)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    
endmodule
//
// Verilog Description of module PWMReceiver
//

module PWMReceiver (clk_255kHz_c, VCC_net, GND_net, rc8_c, \register[6] , 
            n8057, reset_c, \register[0][7] ) /* synthesis syn_module_defined=1 */ ;
    input clk_255kHz_c;
    input VCC_net;
    input GND_net;
    input rc8_c;
    output [7:0]\register[6] ;
    input n8057;
    input reset_c;
    output \register[0][7] ;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7698, n7246, n7710, n7690;
    wire [7:0]n329;
    
    wire n23;
    wire [7:0]n1;
    
    wire n7693, n1340;
    wire [15:0]n81;
    
    wire latched_in, prev_in, n2300, n2838, n6, n4, n6708, n6577, 
        n1613, n7696, n6758, n6_adj_25, n7727, n4_adj_26;
    wire [15:0]n116;
    
    wire n6601, n6576, n6575, n6600, n6746, n6574, n6599, n6598, 
        n6573, n6572, n6571, n6570, n7309, n6_adj_27, n43, n6847, 
        n54, n8, n6793, n4_adj_28, n7725, n7711, n7718, n5, 
        n16, n6_adj_29, n5_adj_30, n7128, n6_adj_31, n6658, n7724;
    
    LUT4 i4672_3_lut_rep_85_4_lut (.A(count[8]), .B(n7698), .C(n7246), 
         .D(n7710), .Z(n7690)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i4672_3_lut_rep_85_4_lut.init = 16'hfeee;
    LUT4 i4401_2_lut (.A(n329[6]), .B(n23), .Z(n1[6])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4401_2_lut.init = 16'h8888;
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc8_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut (.A(count[11]), .B(count[10]), .C(count[14]), 
         .Z(n6)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'hfefe;
    LUT4 i1_3_lut_4_lut (.A(count[1]), .B(count[2]), .C(count[3]), .D(count[4]), 
         .Z(n4)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_3_lut_4_lut.init = 16'hff80;
    LUT4 i2_3_lut_4_lut (.A(count[1]), .B(count[2]), .C(count[3]), .D(count[4]), 
         .Z(n6708)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2_3_lut_4_lut.init = 16'hfff8;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6577), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    FD1P3IX count_i15 (.D(n8057), .SP(n1613), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    LUT4 i1_2_lut_4_lut (.A(n7710), .B(n7696), .C(n7246), .D(n6758), 
         .Z(n6_adj_25)) /* synthesis lut_function=(!(A (B (D)+!B ((D)+!C))+!A ((D)+!B))) */ ;
    defparam i1_2_lut_4_lut.init = 16'h00ec;
    LUT4 i5_2_lut_rep_122 (.A(prev_in), .B(latched_in), .Z(n7727)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_122.init = 16'h4444;
    LUT4 i1130_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1340)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1130_2_lut_3_lut.init = 16'hf4f4;
    FD1P3IX count_i14 (.D(n81[14]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1P3JX count_i13 (.D(n116[13]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1P3JX count_i12 (.D(n116[12]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n81[11]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n81[10]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n81[9]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1P3JX count_i7 (.D(n116[7]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1P3JX count_i6 (.D(n116[6]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n81[5]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n81[4]), .SP(n7693), .CD(n1340), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1P3JX count_i3 (.D(n116[3]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1P3JX count_i2 (.D(n116[2]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1P3JX count_i1 (.D(n116[1]), .SP(n4_adj_26), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    CCU2D sub_128_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6601), .S0(n329[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_128_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_128_add_2_9.INIT1 = 16'h0000;
    defparam sub_128_add_2_9.INJECT1_0 = "NO";
    defparam sub_128_add_2_9.INJECT1_1 = "NO";
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6576), .COUT(n6577), .S0(n81[13]), .S1(n81[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6575), .COUT(n6576), .S0(n81[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    CCU2D sub_128_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6600), .COUT(n6601), .S0(n329[5]), .S1(n329[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_128_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_128_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_128_add_2_7.INJECT1_0 = "NO";
    defparam sub_128_add_2_7.INJECT1_1 = "NO";
    LUT4 i4416_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[13]), 
         .Z(n116[13])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4416_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4410_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[12]), 
         .Z(n116[12])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4410_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4402_2_lut (.A(n329[5]), .B(n23), .Z(n1[5])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4402_2_lut.init = 16'h8888;
    LUT4 i4393_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[2]), .Z(n116[2])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4393_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4392_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[1]), .Z(n116[1])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4392_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4366_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4366_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4395_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[3]), .Z(n116[3])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4395_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i7188_2_lut_rep_88_3_lut (.A(n6746), .B(count[14]), .C(count[15]), 
         .Z(n7693)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7188_2_lut_rep_88_3_lut.init = 16'h0101;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n6746), .B(count[14]), .C(n7727), .D(count[15]), 
         .Z(n4_adj_26)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf0f1;
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6574), .COUT(n6575), .S0(n81[9]), .S1(n81[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    CCU2D sub_128_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6599), .COUT(n6600), .S0(n329[3]), .S1(n329[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_128_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_128_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_128_add_2_5.INJECT1_0 = "NO";
    defparam sub_128_add_2_5.INJECT1_1 = "NO";
    LUT4 i4363_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[7]), .Z(n116[7])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4363_2_lut_3_lut.init = 16'hb0b0;
    CCU2D sub_128_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6598), .COUT(n6599), .S0(n329[1]), .S1(n329[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_128_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_128_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_128_add_2_3.INJECT1_0 = "NO";
    defparam sub_128_add_2_3.INJECT1_1 = "NO";
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6573), 
          .COUT(n6574), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    LUT4 i4353_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[6]), .Z(n116[6])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4353_2_lut_3_lut.init = 16'hb0b0;
    CCU2D sub_128_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6598), 
          .S1(n329[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_128_add_2_1.INIT0 = 16'hF000;
    defparam sub_128_add_2_1.INIT1 = 16'h5555;
    defparam sub_128_add_2_1.INJECT1_0 = "NO";
    defparam sub_128_add_2_1.INJECT1_1 = "NO";
    LUT4 i4400_2_lut (.A(n329[7]), .B(n23), .Z(n1[7])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4400_2_lut.init = 16'h8888;
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6572), 
          .COUT(n6573), .S0(n81[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    LUT4 i1403_2_lut_3_lut (.A(n6746), .B(count[14]), .C(n81[15]), .Z(n1613)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1403_2_lut_3_lut.init = 16'h1010;
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6571), 
          .COUT(n6572), .S0(n81[3]), .S1(n81[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6570), 
          .COUT(n6571), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    LUT4 i7174_4_lut (.A(reset_c), .B(n7727), .C(n7309), .D(n6_adj_27), 
         .Z(n43)) /* synthesis lut_function=(A+!(B+!(C+!(D)))) */ ;
    defparam i7174_4_lut.init = 16'hbabb;
    LUT4 i7065_2_lut (.A(n6746), .B(count[15]), .Z(n7309)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7065_2_lut.init = 16'heeee;
    LUT4 i2_4_lut (.A(prev_in), .B(count[14]), .C(latched_in), .D(n6847), 
         .Z(n6_adj_27)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))) */ ;
    defparam i2_4_lut.init = 16'h3331;
    LUT4 i4_4_lut (.A(n23), .B(n54), .C(n8), .D(n6_adj_25), .Z(n6847)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i4_4_lut.init = 16'h1000;
    LUT4 i7202_4_lut (.A(n8), .B(n7693), .C(reset_c), .D(n6758), .Z(n6793)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7202_4_lut.init = 16'h0008;
    LUT4 i2_4_lut_adj_62 (.A(count[13]), .B(count[12]), .C(count[9]), 
         .D(n4_adj_28), .Z(n6746)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_62.init = 16'h8880;
    LUT4 i1_4_lut (.A(n7725), .B(count[5]), .C(n7711), .D(n4), .Z(n4_adj_28)) /* synthesis lut_function=(A+(B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut.init = 16'hfaea;
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    FD1P3AX valid_48 (.D(n6793), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][7] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6570), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_adj_63 (.A(count[0]), .B(n7718), .C(count[5]), 
         .Z(n5)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_3_lut_adj_63.init = 16'h8080;
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    LUT4 i4406_2_lut (.A(n329[1]), .B(n23), .Z(n1[1])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4406_2_lut.init = 16'h8888;
    LUT4 i4405_2_lut (.A(n329[2]), .B(n23), .Z(n1[2])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4405_2_lut.init = 16'h8888;
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_64 (.A(latched_in), .B(reset_c), .C(n16), .D(prev_in), 
         .Z(n2300)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_64.init = 16'h1000;
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2300), .PD(n2838), .CK(clk_255kHz_c), 
            .Q(\register[6] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=247, LSE_RLINE=251 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    LUT4 i4404_2_lut (.A(n329[3]), .B(n23), .Z(n1[3])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4404_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_65 (.A(n54), .B(n23), .C(n8), .D(n7690), .Z(n16)) /* synthesis lut_function=(A+(B+!((D)+!C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_65.init = 16'heefe;
    LUT4 i2633_2_lut (.A(n2300), .B(n54), .Z(n2838)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2633_2_lut.init = 16'h8888;
    LUT4 i4403_2_lut (.A(n329[4]), .B(n23), .Z(n1[4])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4403_2_lut.init = 16'h8888;
    LUT4 i4306_2_lut (.A(n329[0]), .B(n23), .Z(n1[0])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4306_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_66 (.A(n7698), .B(count[8]), .C(n7718), .D(n7246), 
         .Z(n23)) /* synthesis lut_function=(!(A+((C (D))+!B))) */ ;
    defparam i2_4_lut_adj_66.init = 16'h0444;
    LUT4 i2_3_lut_rep_113 (.A(count[1]), .B(count[3]), .C(count[2]), .Z(n7718)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut_rep_113.init = 16'h8080;
    LUT4 i1_2_lut_rep_105_4_lut (.A(count[1]), .B(count[3]), .C(count[2]), 
         .D(count[0]), .Z(n7710)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_2_lut_rep_105_4_lut.init = 16'h8000;
    LUT4 i21_4_lut (.A(n5), .B(n6758), .C(n7698), .D(n6_adj_29), .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    LUT4 i1_4_lut_adj_67 (.A(n5_adj_30), .B(n7128), .C(count[9]), .D(n6_adj_31), 
         .Z(n6758)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i1_4_lut_adj_67.init = 16'hfcec;
    LUT4 i1_3_lut_4_lut_adj_68 (.A(count[5]), .B(count[4]), .C(count[7]), 
         .D(n6658), .Z(n5_adj_30)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i1_3_lut_4_lut_adj_68.init = 16'hf8f0;
    LUT4 i2_3_lut_4_lut_adj_69 (.A(count[5]), .B(count[4]), .C(count[6]), 
         .D(count[7]), .Z(n7246)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_3_lut_4_lut_adj_69.init = 16'h8000;
    LUT4 i1_2_lut_rep_93 (.A(count[9]), .B(n7128), .Z(n7698)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_93.init = 16'heeee;
    LUT4 i2_2_lut (.A(count[6]), .B(count[8]), .Z(n6_adj_31)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i3_4_lut (.A(count[1]), .B(count[0]), .C(count[3]), .D(count[2]), 
         .Z(n6658)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_91_3_lut (.A(count[9]), .B(n7128), .C(count[8]), 
         .Z(n7696)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_91_3_lut.init = 16'hfefe;
    LUT4 i4_4_lut_adj_70 (.A(count[13]), .B(count[15]), .C(count[12]), 
         .D(n6), .Z(n7128)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4_4_lut_adj_70.init = 16'hfffe;
    LUT4 i1_2_lut_rep_119 (.A(count[7]), .B(count[6]), .Z(n7724)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_119.init = 16'h8888;
    LUT4 i1_4_lut_adj_71 (.A(count[5]), .B(n7696), .C(n7724), .D(n6708), 
         .Z(n8)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_71.init = 16'heccc;
    LUT4 i1_2_lut_rep_106_3_lut (.A(count[7]), .B(count[6]), .C(count[8]), 
         .Z(n7711)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_106_3_lut.init = 16'h8080;
    LUT4 i2_2_lut_3_lut_4_lut (.A(count[7]), .B(count[6]), .C(count[4]), 
         .D(count[8]), .Z(n6_adj_29)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_rep_120 (.A(count[11]), .B(count[10]), .Z(n7725)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_120.init = 16'heeee;
    
endmodule
//
// Verilog Description of module PWMReceiver_U3
//

module PWMReceiver_U3 (clk_255kHz_c, VCC_net, GND_net, rc2_c, reset_c, 
            n8057, \register[0][1] , \register[2] ) /* synthesis syn_module_defined=1 */ ;
    input clk_255kHz_c;
    input VCC_net;
    input GND_net;
    input rc2_c;
    input reset_c;
    input n8057;
    output \register[0][1] ;
    output [7:0]\register[2] ;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7689, n1316;
    wire [15:0]n81;
    
    wire latched_in, prev_in, n2214, n4, n6743, n7735, n6691, 
        n16, n2322, n54, n23, n8, n7697, n2866, n1610;
    wire [7:0]n293;
    wire [7:0]n1;
    
    wire n7705, n6767, n7158, n6, n4_adj_21;
    wire [15:0]n116;
    
    wire n6541, n6542, n7713, n7738, n7140, n7702, n6540, n6539, 
        n7737, n7301, n6_adj_22, n43, n6796, n6538, n6784, n6694, 
        n5, n6_adj_23, n6661, n7736, n6_adj_24, n6545, n7325, 
        n6544, n6543, n6585, n6584, n6583, n6582;
    
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc2_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    LUT4 i2_4_lut (.A(count[13]), .B(count[12]), .C(n2214), .D(n4), 
         .Z(n6743)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut.init = 16'h8880;
    LUT4 i1_4_lut (.A(count[8]), .B(count[9]), .C(n7735), .D(n6691), 
         .Z(n4)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut.init = 16'heccc;
    LUT4 i2_4_lut_adj_51 (.A(latched_in), .B(reset_c), .C(n16), .D(prev_in), 
         .Z(n2322)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_51.init = 16'h1000;
    LUT4 i2_4_lut_adj_52 (.A(n54), .B(n23), .C(n8), .D(n7697), .Z(n16)) /* synthesis lut_function=(A+(B+!((D)+!C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_52.init = 16'heefe;
    LUT4 i2661_2_lut (.A(n2322), .B(n54), .Z(n2866)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2661_2_lut.init = 16'h8888;
    FD1P3IX count_i15 (.D(n8057), .SP(n1610), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    LUT4 i4282_2_lut (.A(n293[0]), .B(n23), .Z(n1[0])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4282_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_4_lut (.A(count[8]), .B(n7705), .C(n6767), .D(n7158), 
         .Z(n6)) /* synthesis lut_function=(!(A (C)+!A (B (C)+!B (C+!(D))))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0f0e;
    LUT4 i1_2_lut (.A(count[11]), .B(count[10]), .Z(n2214)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    FD1P3IX count_i14 (.D(n81[14]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1P3JX count_i13 (.D(n116[13]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1P3JX count_i12 (.D(n116[12]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n81[11]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n81[10]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n81[9]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1P3JX count_i7 (.D(n116[7]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1P3JX count_i6 (.D(n116[6]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n81[5]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n81[4]), .SP(n7689), .CD(n1316), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1P3JX count_i3 (.D(n116[3]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1P3JX count_i2 (.D(n116[2]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1P3JX count_i1 (.D(n116[1]), .SP(n4_adj_21), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6541), 
          .COUT(n6542), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    LUT4 i2_3_lut_4_lut (.A(n7713), .B(n7735), .C(count[0]), .D(n7738), 
         .Z(n7158)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_rep_100 (.A(count[9]), .B(n7140), .Z(n7705)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_100.init = 16'heeee;
    LUT4 i4594_2_lut_rep_92_3_lut_4_lut (.A(count[9]), .B(n7140), .C(n7158), 
         .D(count[8]), .Z(n7697)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4594_2_lut_rep_92_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_97_3_lut (.A(count[9]), .B(n7140), .C(count[8]), 
         .Z(n7702)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_97_3_lut.init = 16'hfefe;
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6540), 
          .COUT(n6541), .S0(n81[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6539), 
          .COUT(n6540), .S0(n81[3]), .S1(n81[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    LUT4 i4436_2_lut (.A(n293[1]), .B(n23), .Z(n1[1])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4436_2_lut.init = 16'h8888;
    LUT4 i7172_4_lut (.A(reset_c), .B(n7737), .C(n7301), .D(n6_adj_22), 
         .Z(n43)) /* synthesis lut_function=(A+!(B+!(C+!(D)))) */ ;
    defparam i7172_4_lut.init = 16'hbabb;
    LUT4 i7057_2_lut (.A(n6743), .B(count[15]), .Z(n7301)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7057_2_lut.init = 16'heeee;
    LUT4 i2_4_lut_adj_53 (.A(prev_in), .B(count[14]), .C(latched_in), 
         .D(n6796), .Z(n6_adj_22)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))) */ ;
    defparam i2_4_lut_adj_53.init = 16'h3331;
    LUT4 i4_4_lut (.A(n23), .B(n54), .C(n8), .D(n6), .Z(n6796)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i4_4_lut.init = 16'h1000;
    LUT4 i4433_2_lut (.A(n293[2]), .B(n23), .Z(n1[2])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4433_2_lut.init = 16'h8888;
    LUT4 i4421_2_lut (.A(n293[3]), .B(n23), .Z(n1[3])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4421_2_lut.init = 16'h8888;
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6538), 
          .COUT(n6539), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    LUT4 i7199_4_lut (.A(n8), .B(n7689), .C(reset_c), .D(n6767), .Z(n6784)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7199_4_lut.init = 16'h0008;
    LUT4 i1_4_lut_adj_54 (.A(n7735), .B(n7702), .C(n6694), .D(count[5]), 
         .Z(n8)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_54.init = 16'heccc;
    LUT4 i1_4_lut_adj_55 (.A(count[9]), .B(n7140), .C(n5), .D(n6_adj_23), 
         .Z(n6767)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_4_lut_adj_55.init = 16'heeec;
    LUT4 i4420_2_lut (.A(n293[4]), .B(n23), .Z(n1[4])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4420_2_lut.init = 16'h8888;
    FD1P3AX valid_48 (.D(n6784), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][1] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    LUT4 i2_2_lut (.A(count[6]), .B(count[8]), .Z(n6_adj_23)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i1_2_lut_rep_130 (.A(count[6]), .B(count[7]), .Z(n7735)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_130.init = 16'h8888;
    LUT4 i3_4_lut (.A(count[2]), .B(count[3]), .C(count[1]), .D(count[0]), 
         .Z(n6661)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i3_4_lut.init = 16'hfffe;
    LUT4 i4419_2_lut (.A(n293[5]), .B(n23), .Z(n1[5])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4419_2_lut.init = 16'h8888;
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_131 (.A(count[2]), .B(count[1]), .Z(n7736)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_131.init = 16'h8888;
    LUT4 i2_3_lut_4_lut_adj_56 (.A(count[2]), .B(count[1]), .C(count[3]), 
         .D(count[4]), .Z(n6694)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_3_lut_4_lut_adj_56.init = 16'hfff8;
    LUT4 i4_4_lut_adj_57 (.A(count[15]), .B(n2214), .C(count[12]), .D(n6_adj_24), 
         .Z(n7140)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i4_4_lut_adj_57.init = 16'hfffe;
    LUT4 i1_2_lut_adj_58 (.A(count[13]), .B(count[14]), .Z(n6_adj_24)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_2_lut_adj_58.init = 16'heeee;
    LUT4 i4418_2_lut (.A(n293[6]), .B(n23), .Z(n1[6])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4418_2_lut.init = 16'h8888;
    LUT4 i4417_2_lut (.A(n293[7]), .B(n23), .Z(n1[7])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4417_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_rep_108_3_lut (.A(count[2]), .B(count[1]), .C(count[3]), 
         .Z(n7713)) /* synthesis lut_function=(A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_108_3_lut.init = 16'h8080;
    LUT4 i5_2_lut_rep_132 (.A(prev_in), .B(latched_in), .Z(n7737)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_132.init = 16'h4444;
    LUT4 i7192_2_lut_rep_84_3_lut (.A(n6743), .B(count[14]), .C(count[15]), 
         .Z(n7689)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7192_2_lut_rep_84_3_lut.init = 16'h0101;
    LUT4 i4382_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[12]), 
         .Z(n116[12])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4382_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4386_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[13]), 
         .Z(n116[13])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4386_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4342_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[2]), .Z(n116[2])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4342_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4281_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[1]), .Z(n116[1])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4281_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i1106_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1316)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1106_2_lut_3_lut.init = 16'hf4f4;
    LUT4 i1_2_lut_3_lut_4_lut_adj_59 (.A(n6743), .B(count[14]), .C(n7737), 
         .D(count[15]), .Z(n4_adj_21)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_59.init = 16'hf0f1;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6545), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    LUT4 i4440_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4440_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4383_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[3]), .Z(n116[3])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4383_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4384_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[6]), .Z(n116[6])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4384_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i1400_2_lut_3_lut (.A(n6743), .B(count[14]), .C(n81[15]), .Z(n1610)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1400_2_lut_3_lut.init = 16'h1010;
    LUT4 i1_4_lut_adj_60 (.A(count[8]), .B(n7705), .C(count[5]), .D(n7325), 
         .Z(n23)) /* synthesis lut_function=(!((B+(C (D)))+!A)) */ ;
    defparam i1_4_lut_adj_60.init = 16'h0222;
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    LUT4 i4409_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[7]), .Z(n116[7])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4409_2_lut_3_lut.init = 16'hb0b0;
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    LUT4 i21_4_lut (.A(count[8]), .B(n6767), .C(n7705), .D(n7158), .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_133 (.A(count[4]), .B(count[5]), .Z(n7738)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_133.init = 16'h8888;
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2322), .PD(n2866), .CK(clk_255kHz_c), 
            .Q(\register[2] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=227, LSE_RLINE=231 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut (.A(count[4]), .B(count[5]), .C(n6661), .D(count[7]), 
         .Z(n5)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_3_lut_4_lut.init = 16'hff80;
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6544), .COUT(n6545), .S0(n81[13]), .S1(n81[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6543), .COUT(n6544), .S0(n81[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6542), .COUT(n6543), .S0(n81[9]), .S1(n81[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6538), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i2_3_lut_4_lut_adj_61 (.A(count[3]), .B(n7736), .C(count[5]), 
         .D(count[4]), .Z(n6691)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_3_lut_4_lut_adj_61.init = 16'hfff8;
    CCU2D sub_124_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6585), .S0(n293[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_124_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_124_add_2_9.INIT1 = 16'h0000;
    defparam sub_124_add_2_9.INJECT1_0 = "NO";
    defparam sub_124_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_124_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6584), .COUT(n6585), .S0(n293[5]), .S1(n293[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_124_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_124_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_124_add_2_7.INJECT1_0 = "NO";
    defparam sub_124_add_2_7.INJECT1_1 = "NO";
    CCU2D sub_124_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6583), .COUT(n6584), .S0(n293[3]), .S1(n293[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_124_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_124_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_124_add_2_5.INJECT1_0 = "NO";
    defparam sub_124_add_2_5.INJECT1_1 = "NO";
    CCU2D sub_124_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6582), .COUT(n6583), .S0(n293[1]), .S1(n293[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_124_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_124_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_124_add_2_3.INJECT1_0 = "NO";
    defparam sub_124_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_124_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6582), 
          .S1(n293[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_124_add_2_1.INIT0 = 16'hF000;
    defparam sub_124_add_2_1.INIT1 = 16'h5555;
    defparam sub_124_add_2_1.INJECT1_0 = "NO";
    defparam sub_124_add_2_1.INJECT1_1 = "NO";
    LUT4 i7081_2_lut_3_lut_4_lut (.A(count[3]), .B(n7736), .C(count[4]), 
         .D(n7735), .Z(n7325)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i7081_2_lut_3_lut_4_lut.init = 16'h8000;
    
endmodule
//
// Verilog Description of module PWMReceiver_U4
//

module PWMReceiver_U4 (clk_255kHz_c, GND_net, reset_c, n8057, \register[1] , 
            \register[0][0] , VCC_net, rc1_c) /* synthesis syn_module_defined=1 */ ;
    input clk_255kHz_c;
    input GND_net;
    input reset_c;
    input n8057;
    output [7:0]\register[1] ;
    output \register[0][0] ;
    input VCC_net;
    input rc1_c;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    
    wire n7704;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7279;
    wire [7:0]n284;
    wire [7:0]n1;
    
    wire prev_in, latched_in, n6742, n7723, n4, n6533;
    wire [15:0]n81;
    
    wire n6534, n7692, n1310, n6579, n6580, n1304, n6578, n7134, 
        n7701, n7699, n16, n2323, n54, n8, n4851, n2873, n7700, 
        n6765, n5, n6, n6670, n7732, n4_adj_17, n99, n6_adj_18, 
        n7721, n6669, n7305, n6_adj_19, n43, n6530, n7207, n7206, 
        n6777, n2835, n2687;
    wire [15:0]n116;
    
    wire n6536, n6537, n6532, n6535, n6531, n4_adj_20, n6673, 
        n7722, n6581;
    
    LUT4 i1_2_lut_4_lut (.A(n7704), .B(count[8]), .C(n7279), .D(n284[1]), 
         .Z(n1[1])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut.init = 16'h0400;
    LUT4 i1_2_lut_4_lut_adj_34 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[2]), 
         .Z(n1[2])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_34.init = 16'h0400;
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    LUT4 i1_2_lut_4_lut_adj_35 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[3]), 
         .Z(n1[3])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_35.init = 16'h0400;
    LUT4 i1_2_lut_4_lut_adj_36 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[4]), 
         .Z(n1[4])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_36.init = 16'h0400;
    LUT4 i1_2_lut_4_lut_adj_37 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[5]), 
         .Z(n1[5])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_37.init = 16'h0400;
    LUT4 i1_2_lut_4_lut_adj_38 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[6]), 
         .Z(n1[6])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_38.init = 16'h0400;
    LUT4 i4313_2_lut_4_lut (.A(n7704), .B(count[8]), .C(n7279), .D(n284[7]), 
         .Z(n1[7])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i4313_2_lut_4_lut.init = 16'h0400;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n6742), .B(count[14]), .C(n7723), .D(count[15]), 
         .Z(n4)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf0f1;
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6533), 
          .COUT(n6534), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    LUT4 i7196_2_lut_rep_87_3_lut (.A(n6742), .B(count[14]), .C(count[15]), 
         .Z(n7692)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7196_2_lut_rep_87_3_lut.init = 16'h0101;
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    CCU2D sub_123_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6579), .COUT(n6580), .S0(n284[3]), .S1(n284[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_123_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_123_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_123_add_2_5.INJECT1_0 = "NO";
    defparam sub_123_add_2_5.INJECT1_1 = "NO";
    LUT4 i1094_2_lut_3_lut (.A(n6742), .B(count[14]), .C(n81[15]), .Z(n1304)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1094_2_lut_3_lut.init = 16'h1010;
    CCU2D sub_123_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6578), .COUT(n6579), .S0(n284[1]), .S1(n284[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_123_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_123_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_123_add_2_3.INJECT1_0 = "NO";
    defparam sub_123_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_123_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6578), 
          .S1(n284[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_123_add_2_1.INIT0 = 16'hF000;
    defparam sub_123_add_2_1.INIT1 = 16'h5555;
    defparam sub_123_add_2_1.INJECT1_0 = "NO";
    defparam sub_123_add_2_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_99 (.A(count[9]), .B(n7134), .Z(n7704)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_2_lut_rep_99.init = 16'heeee;
    LUT4 i1_3_lut_rep_96_4_lut (.A(count[9]), .B(n7134), .C(n7279), .D(count[8]), 
         .Z(n7701)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_3_lut_rep_96_4_lut.init = 16'hfeff;
    LUT4 i1_2_lut_rep_94_3_lut (.A(count[9]), .B(n7134), .C(count[8]), 
         .Z(n7699)) /* synthesis lut_function=(A+(B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_2_lut_rep_94_3_lut.init = 16'hfefe;
    LUT4 i2_4_lut (.A(latched_in), .B(reset_c), .C(n16), .D(prev_in), 
         .Z(n2323)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2_4_lut.init = 16'h1000;
    LUT4 i2_4_lut_adj_39 (.A(n54), .B(n7701), .C(n8), .D(n4851), .Z(n16)) /* synthesis lut_function=(A+!(B ((D)+!C))) */ ;
    defparam i2_4_lut_adj_39.init = 16'hbbfb;
    LUT4 i2668_2_lut (.A(n2323), .B(n54), .Z(n2873)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2668_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_rep_95 (.A(count[0]), .B(n7279), .Z(n7700)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_95.init = 16'h8888;
    LUT4 i21_4_lut (.A(count[8]), .B(n6765), .C(n7704), .D(n7700), .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    LUT4 i1_4_lut (.A(count[9]), .B(n7134), .C(n5), .D(n6), .Z(n6765)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_4_lut.init = 16'heeec;
    LUT4 i2_2_lut (.A(count[8]), .B(count[6]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i3_4_lut (.A(count[3]), .B(count[2]), .C(count[1]), .D(count[0]), 
         .Z(n6670)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut.init = 16'hfffe;
    LUT4 i2_4_lut_adj_40 (.A(n7732), .B(count[1]), .C(count[2]), .D(n4_adj_17), 
         .Z(n7279)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_4_lut_adj_40.init = 16'h8000;
    LUT4 i4_4_lut (.A(count[15]), .B(n99), .C(count[12]), .D(n6_adj_18), 
         .Z(n7134)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut (.A(count[14]), .B(count[13]), .Z(n6_adj_18)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut_adj_41 (.A(count[5]), .B(n7699), .C(n7721), .D(n6669), 
         .Z(n8)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_41.init = 16'heccc;
    LUT4 i7158_4_lut (.A(reset_c), .B(n7723), .C(n7305), .D(n6_adj_19), 
         .Z(n43)) /* synthesis lut_function=(A+!(B+!(C+!(D)))) */ ;
    defparam i7158_4_lut.init = 16'hbabb;
    LUT4 i7061_2_lut (.A(n6742), .B(count[15]), .Z(n7305)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7061_2_lut.init = 16'heeee;
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6530), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_42 (.A(prev_in), .B(count[14]), .C(latched_in), 
         .D(n7207), .Z(n6_adj_19)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))) */ ;
    defparam i2_4_lut_adj_42.init = 16'h3331;
    LUT4 i3_4_lut_adj_43 (.A(n4851), .B(n8), .C(n6765), .D(n7206), .Z(n7207)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i3_4_lut_adj_43.init = 16'h0800;
    LUT4 i7177_4_lut (.A(n8), .B(n7692), .C(reset_c), .D(n6765), .Z(n6777)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7177_4_lut.init = 16'h0008;
    FD1P3IX count_i15 (.D(n8057), .SP(n1304), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    LUT4 i4394_4_lut (.A(count[13]), .B(n7723), .C(n81[13]), .D(n7692), 
         .Z(n2835)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4394_4_lut.init = 16'h3022;
    LUT4 i4431_4_lut (.A(count[12]), .B(n7723), .C(n81[12]), .D(n7692), 
         .Z(n2687)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4431_4_lut.init = 16'h3022;
    FD1P3IX count_i14 (.D(n81[14]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1S3JX count_i13 (.D(n2835), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1S3JX count_i12 (.D(n2687), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n81[11]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n81[10]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n81[9]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1P3JX count_i7 (.D(n116[7]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1P3JX count_i6 (.D(n116[6]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n81[5]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n81[4]), .SP(n7692), .CD(n1310), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1P3JX count_i3 (.D(n116[3]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1P3JX count_i2 (.D(n116[2]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1P3JX count_i1 (.D(n116[1]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_127 (.A(count[4]), .B(count[5]), .Z(n7732)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_127.init = 16'h8888;
    LUT4 i1_3_lut_4_lut (.A(count[4]), .B(count[5]), .C(count[7]), .D(n6670), 
         .Z(n5)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i1_3_lut_4_lut.init = 16'hf8f0;
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6536), .COUT(n6537), .S0(n81[13]), .S1(n81[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6532), 
          .COUT(n6533), .S0(n81[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    FD1P3AX valid_48 (.D(n6777), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][0] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc1_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    LUT4 i4653_2_lut_3_lut_4_lut (.A(count[0]), .B(n7279), .C(n7704), 
         .D(count[8]), .Z(n4851)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;
    defparam i4653_2_lut_3_lut_4_lut.init = 16'hfff8;
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2323), .PD(n2873), .CK(clk_255kHz_c), 
            .Q(\register[1] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=17, LSE_RCOL=36, LSE_LLINE=222, LSE_RLINE=226 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6535), .COUT(n6536), .S0(n81[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    LUT4 i1_2_lut_4_lut_adj_44 (.A(n7704), .B(count[8]), .C(n7279), .D(n284[0]), 
         .Z(n1[0])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_44.init = 16'h0400;
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6531), 
          .COUT(n6532), .S0(n81[3]), .S1(n81[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6530), 
          .COUT(n6531), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_4_lut_adj_45 (.A(n7704), .B(count[8]), .C(n7279), .D(n54), 
         .Z(n7206)) /* synthesis lut_function=(!(A (D)+!A (B ((D)+!C)+!B (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_4_lut_adj_45.init = 16'h00fb;
    LUT4 i2_4_lut_adj_46 (.A(count[13]), .B(count[12]), .C(n99), .D(n4_adj_20), 
         .Z(n6742)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_46.init = 16'h8880;
    LUT4 i1_4_lut_adj_47 (.A(n6673), .B(count[9]), .C(n7721), .D(count[8]), 
         .Z(n4_adj_20)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_4_lut_adj_47.init = 16'heccc;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6537), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_48 (.A(count[4]), .B(count[5]), .C(count[3]), .D(n7722), 
         .Z(n6673)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_4_lut_adj_48.init = 16'hfeee;
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6534), .COUT(n6535), .S0(n81[9]), .S1(n81[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_49 (.A(count[11]), .B(count[10]), .Z(n99)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_2_lut_adj_49.init = 16'heeee;
    CCU2D sub_123_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6581), .S0(n284[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_123_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_123_add_2_9.INIT1 = 16'h0000;
    defparam sub_123_add_2_9.INJECT1_0 = "NO";
    defparam sub_123_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_123_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6580), .COUT(n6581), .S0(n284[5]), .S1(n284[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_123_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_123_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_123_add_2_7.INJECT1_0 = "NO";
    defparam sub_123_add_2_7.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_116 (.A(count[6]), .B(count[7]), .Z(n7721)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_116.init = 16'h8888;
    LUT4 i1_2_lut_3_lut (.A(count[6]), .B(count[7]), .C(count[3]), .Z(n4_adj_17)) /* synthesis lut_function=(A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_rep_117 (.A(count[2]), .B(count[1]), .Z(n7722)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_117.init = 16'h8888;
    LUT4 i2_3_lut_4_lut (.A(count[2]), .B(count[1]), .C(count[3]), .D(count[4]), 
         .Z(n6669)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_3_lut_4_lut.init = 16'hfff8;
    LUT4 i5_2_lut_rep_118 (.A(prev_in), .B(latched_in), .Z(n7723)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_118.init = 16'h4444;
    LUT4 i4415_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[2]), .Z(n116[2])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4415_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4369_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[1]), .Z(n116[1])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4369_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4274_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4274_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4471_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[7]), .Z(n116[7])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4471_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4432_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[3]), .Z(n116[3])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4432_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4468_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[6]), .Z(n116[6])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4468_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i1_2_lut_3_lut_adj_50 (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1310)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1_2_lut_3_lut_adj_50.init = 16'hf4f4;
    
endmodule
//
// Verilog Description of module PWMReceiver_U2
//

module PWMReceiver_U2 (clk_255kHz_c, VCC_net, GND_net, rc3_c, reset_c, 
            n8057, \register[3] , \register[0][2] ) /* synthesis syn_module_defined=1 */ ;
    input clk_255kHz_c;
    input VCC_net;
    input GND_net;
    input rc3_c;
    input reset_c;
    input n8057;
    output [7:0]\register[3] ;
    output \register[0][2] ;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7695, n1322;
    wire [15:0]n81;
    
    wire latched_in, prev_in, n7734, n7295, n6, n43, n6711, n6821, 
        n23, n54, n8, n6_adj_12, n4861, n6764, n6787, n6552;
    wire [15:0]n99;
    
    wire n6553, n6551, n2218, n4, n7143, n7706, n1971, n6550, 
        n6549, n2202, n6664, n7236, n7733, n16, n2321, n2859, 
        n4_adj_13, n6548, n6547;
    wire [7:0]n302;
    wire [7:0]n1;
    
    wire n5, n6_adj_14, n6684, n6_adj_15, n7739, n6665, n6546, 
        n1891, n4_adj_16;
    wire [15:0]n116;
    
    wire n2831, n2833, n2827, n2829, n2821, n6589, n6588, n6587, 
        n6586;
    
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc3_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    LUT4 i7168_4_lut (.A(reset_c), .B(n7734), .C(n7295), .D(n6), .Z(n43)) /* synthesis lut_function=(A+!(B+!(C+!(D)))) */ ;
    defparam i7168_4_lut.init = 16'hbabb;
    LUT4 i7051_2_lut (.A(n6711), .B(count[15]), .Z(n7295)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7051_2_lut.init = 16'heeee;
    LUT4 i2_4_lut (.A(prev_in), .B(count[14]), .C(latched_in), .D(n6821), 
         .Z(n6)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))) */ ;
    defparam i2_4_lut.init = 16'h3331;
    LUT4 i4_4_lut (.A(n23), .B(n54), .C(n8), .D(n6_adj_12), .Z(n6821)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i4_4_lut.init = 16'h1000;
    LUT4 i1_2_lut (.A(n4861), .B(n6764), .Z(n6_adj_12)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut.init = 16'h2222;
    LUT4 i7152_4_lut (.A(n8), .B(n7695), .C(reset_c), .D(n6764), .Z(n6787)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7152_4_lut.init = 16'h0008;
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6552), .COUT(n6553), .S0(n81[13]), .S1(n99[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6551), .COUT(n6552), .S0(n99[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_22 (.A(count[13]), .B(count[12]), .C(n2218), .D(n4), 
         .Z(n6711)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_22.init = 16'h8880;
    LUT4 i1_2_lut_rep_101 (.A(count[9]), .B(n7143), .Z(n7706)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_101.init = 16'heeee;
    LUT4 i1_2_lut_3_lut (.A(count[9]), .B(n7143), .C(count[8]), .Z(n1971)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'hfefe;
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6550), .COUT(n6551), .S0(n99[9]), .S1(n99[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6549), 
          .COUT(n6550), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(n2202), .B(count[9]), .C(n6664), .D(count[8]), 
         .Z(n4)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut.init = 16'heccc;
    LUT4 i1_4_lut_4_lut (.A(count[8]), .B(n7236), .C(n2202), .D(n7706), 
         .Z(n23)) /* synthesis lut_function=(!((B (C+(D))+!B (D))+!A)) */ ;
    defparam i1_4_lut_4_lut.init = 16'h002a;
    LUT4 i2_4_lut_adj_23 (.A(count[3]), .B(count[5]), .C(n7733), .D(count[4]), 
         .Z(n6664)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_4_lut_adj_23.init = 16'hffec;
    LUT4 i2_4_lut_adj_24 (.A(latched_in), .B(reset_c), .C(n16), .D(prev_in), 
         .Z(n2321)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_24.init = 16'h1000;
    LUT4 i2_4_lut_adj_25 (.A(n54), .B(n23), .C(n8), .D(n4861), .Z(n16)) /* synthesis lut_function=(A+(B+!((D)+!C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_25.init = 16'heefe;
    LUT4 i1_2_lut_adj_26 (.A(count[7]), .B(count[6]), .Z(n2202)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_26.init = 16'h8888;
    LUT4 i2654_2_lut (.A(n2321), .B(n54), .Z(n2859)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2654_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_adj_27 (.A(count[8]), .B(n7236), .C(count[0]), 
         .Z(n4_adj_13)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_3_lut_adj_27.init = 16'h8080;
    LUT4 i1_2_lut_adj_28 (.A(count[11]), .B(count[10]), .Z(n2218)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_28.init = 16'heeee;
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6548), 
          .COUT(n6549), .S0(n81[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6547), 
          .COUT(n6548), .S0(n81[3]), .S1(n81[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    LUT4 i4289_2_lut (.A(n302[0]), .B(n23), .Z(n1[0])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4289_2_lut.init = 16'h8888;
    LUT4 i21_4_lut (.A(n2202), .B(n6764), .C(n7706), .D(n4_adj_13), 
         .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    LUT4 i1_4_lut_adj_29 (.A(n5), .B(n7143), .C(count[9]), .D(n6_adj_14), 
         .Z(n6764)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_4_lut_adj_29.init = 16'hfcec;
    LUT4 i2_2_lut (.A(count[6]), .B(count[8]), .Z(n6_adj_14)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i3_4_lut (.A(count[0]), .B(count[1]), .C(count[2]), .D(count[3]), 
         .Z(n6684)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut.init = 16'hfffe;
    LUT4 i4_4_lut_adj_30 (.A(count[15]), .B(n2218), .C(count[12]), .D(n6_adj_15), 
         .Z(n7143)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i4_4_lut_adj_30.init = 16'hfffe;
    LUT4 i1_2_lut_adj_31 (.A(count[13]), .B(count[14]), .Z(n6_adj_15)) /* synthesis lut_function=(A+(B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_2_lut_adj_31.init = 16'heeee;
    LUT4 i3_4_lut_adj_32 (.A(count[3]), .B(count[1]), .C(count[2]), .D(n7739), 
         .Z(n7236)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut_adj_32.init = 16'h8000;
    LUT4 i1_4_lut_adj_33 (.A(n6665), .B(n1971), .C(n2202), .D(count[5]), 
         .Z(n8)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_33.init = 16'heccc;
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6546), 
          .COUT(n6547), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6546), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i4663_4_lut (.A(count[0]), .B(n1971), .C(n7236), .D(n2202), 
         .Z(n4861)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i4663_4_lut.init = 16'heccc;
    FD1P3IX count_i15 (.D(n8057), .SP(n1891), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    LUT4 i873_2_lut_rep_128 (.A(count[1]), .B(count[2]), .Z(n7733)) /* synthesis lut_function=(A (B)) */ ;
    defparam i873_2_lut_rep_128.init = 16'h8888;
    LUT4 i2_3_lut_4_lut (.A(count[1]), .B(count[2]), .C(count[3]), .D(count[4]), 
         .Z(n6665)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;
    defparam i2_3_lut_4_lut.init = 16'hfff8;
    LUT4 i5_2_lut_rep_129 (.A(prev_in), .B(latched_in), .Z(n7734)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_129.init = 16'h4444;
    FD1P3IX count_i14 (.D(n99[14]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1P3JX count_i13 (.D(n116[13]), .SP(n4_adj_16), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1P3JX count_i12 (.D(n116[12]), .SP(n4_adj_16), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n99[11]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n99[10]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n99[9]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    LUT4 i4555_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[12]), 
         .Z(n116[12])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4555_2_lut_3_lut.init = 16'hb0b0;
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4_adj_16), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1S3JX count_i7 (.D(n2831), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1S3JX count_i6 (.D(n2833), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n81[5]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n81[4]), .SP(n7695), .CD(n1322), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1S3JX count_i3 (.D(n2827), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1S3JX count_i2 (.D(n2829), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1S3JX count_i1 (.D(n2821), .CK(clk_255kHz_c), .PD(reset_c), .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    LUT4 i4549_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4549_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4556_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[13]), 
         .Z(n116[13])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4556_2_lut_3_lut.init = 16'hb0b0;
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    LUT4 i1112_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1322)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1112_2_lut_3_lut.init = 16'hf4f4;
    FD1P3AX valid_48 (.D(n6787), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][2] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    LUT4 i4349_2_lut (.A(n302[1]), .B(n23), .Z(n1[1])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4349_2_lut.init = 16'h8888;
    LUT4 i4348_2_lut (.A(n302[2]), .B(n23), .Z(n1[2])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4348_2_lut.init = 16'h8888;
    LUT4 i4347_2_lut (.A(n302[3]), .B(n23), .Z(n1[3])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4347_2_lut.init = 16'h8888;
    LUT4 i4346_2_lut (.A(n302[4]), .B(n23), .Z(n1[4])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4346_2_lut.init = 16'h8888;
    LUT4 i4345_2_lut (.A(n302[5]), .B(n23), .Z(n1[5])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4345_2_lut.init = 16'h8888;
    LUT4 i4344_2_lut (.A(n302[6]), .B(n23), .Z(n1[6])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4344_2_lut.init = 16'h8888;
    LUT4 i4343_2_lut (.A(n302[7]), .B(n23), .Z(n1[7])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4343_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_rep_134 (.A(count[4]), .B(count[5]), .Z(n7739)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_2_lut_rep_134.init = 16'h8888;
    LUT4 i1_3_lut_4_lut (.A(count[4]), .B(count[5]), .C(count[7]), .D(n6684), 
         .Z(n5)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i1_3_lut_4_lut.init = 16'hf8f0;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6553), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    CCU2D sub_125_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6589), .S0(n302[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_125_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_125_add_2_9.INIT1 = 16'h0000;
    defparam sub_125_add_2_9.INJECT1_0 = "NO";
    defparam sub_125_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_125_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6588), .COUT(n6589), .S0(n302[5]), .S1(n302[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_125_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_125_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_125_add_2_7.INJECT1_0 = "NO";
    defparam sub_125_add_2_7.INJECT1_1 = "NO";
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    CCU2D sub_125_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6587), .COUT(n6588), .S0(n302[3]), .S1(n302[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_125_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_125_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_125_add_2_5.INJECT1_0 = "NO";
    defparam sub_125_add_2_5.INJECT1_1 = "NO";
    CCU2D sub_125_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6586), .COUT(n6587), .S0(n302[1]), .S1(n302[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_125_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_125_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_125_add_2_3.INJECT1_0 = "NO";
    defparam sub_125_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_125_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6586), 
          .S1(n302[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_125_add_2_1.INIT0 = 16'hF000;
    defparam sub_125_add_2_1.INIT1 = 16'h5555;
    defparam sub_125_add_2_1.INJECT1_0 = "NO";
    defparam sub_125_add_2_1.INJECT1_1 = "NO";
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2321), .PD(n2859), .CK(clk_255kHz_c), 
            .Q(\register[3] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=232, LSE_RLINE=236 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    LUT4 i7184_2_lut_rep_90_3_lut (.A(n6711), .B(count[14]), .C(count[15]), 
         .Z(n7695)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7184_2_lut_rep_90_3_lut.init = 16'h0101;
    LUT4 i4350_4_lut (.A(count[6]), .B(n7734), .C(n81[6]), .D(n7695), 
         .Z(n2833)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4350_4_lut.init = 16'h3022;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n6711), .B(count[14]), .C(n7734), .D(count[15]), 
         .Z(n4_adj_16)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf0f1;
    LUT4 i1681_2_lut_3_lut (.A(n6711), .B(count[14]), .C(n81[15]), .Z(n1891)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1681_2_lut_3_lut.init = 16'h1010;
    LUT4 i4550_4_lut (.A(count[3]), .B(n7734), .C(n81[3]), .D(n7695), 
         .Z(n2827)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4550_4_lut.init = 16'h3022;
    LUT4 i4540_4_lut (.A(count[2]), .B(n7734), .C(n81[2]), .D(n7695), 
         .Z(n2829)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4540_4_lut.init = 16'h3022;
    LUT4 i4507_4_lut (.A(count[1]), .B(n7734), .C(n81[1]), .D(n7695), 
         .Z(n2821)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4507_4_lut.init = 16'h3022;
    LUT4 i4352_4_lut (.A(count[7]), .B(n7734), .C(n81[7]), .D(n7695), 
         .Z(n2831)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i4352_4_lut.init = 16'h3022;
    
endmodule
//
// Verilog Description of module PWMReceiver_U1
//

module PWMReceiver_U1 (clk_255kHz_c, VCC_net, GND_net, rc4_c, reset_c, 
            n8057, \register[4] , \register[0][3] ) /* synthesis syn_module_defined=1 */ ;
    input clk_255kHz_c;
    input VCC_net;
    input GND_net;
    input rc4_c;
    input reset_c;
    input n8057;
    output [7:0]\register[4] ;
    output \register[0][3] ;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7715, n7252, n6702, n5, n7694, n1328;
    wire [15:0]n81;
    
    wire latched_in, prev_in, n7707, n4829, n6745, n7726, n4, 
        n7293, n6, n43, n7219, n8, n6766, n7311, n23, n54, 
        n6790;
    wire [15:0]n116;
    
    wire n6561, n1787, n16, n2320, n6560;
    wire [15:0]n99;
    
    wire n2852;
    wire [7:0]n311;
    wire [7:0]n1;
    
    wire n7740, n5_adj_6, n6_adj_7, n7131, n6_adj_8, n2222, n6_adj_9, 
        n7703, n7714, n4_adj_10, n6559, n6558, n6557, n6593, n6556, 
        n4_adj_11, n6592, n6591, n7719, n6660, n6590, n6555, n7720, 
        n6554;
    
    LUT4 i1_2_lut_rep_110_4_lut (.A(count[2]), .B(count[3]), .C(count[1]), 
         .D(count[0]), .Z(n7715)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_2_lut_rep_110_4_lut.init = 16'h8000;
    LUT4 i2_2_lut_3_lut_4_lut (.A(count[5]), .B(count[4]), .C(count[6]), 
         .D(count[7]), .Z(n7252)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_3_lut_4_lut (.A(count[5]), .B(count[4]), .C(count[7]), .D(n6702), 
         .Z(n5)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i1_3_lut_4_lut.init = 16'hf8f0;
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc4_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    LUT4 i4632_3_lut_4_lut (.A(count[8]), .B(n7707), .C(n7252), .D(n7715), 
         .Z(n4829)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i4632_3_lut_4_lut.init = 16'hfeee;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n6745), .B(count[14]), .C(n7726), .D(count[15]), 
         .Z(n4)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf0f1;
    LUT4 i7166_4_lut (.A(reset_c), .B(n7726), .C(n7293), .D(n6), .Z(n43)) /* synthesis lut_function=(A+!(B+!(C+!(D)))) */ ;
    defparam i7166_4_lut.init = 16'hbabb;
    LUT4 i7049_2_lut (.A(n6745), .B(count[15]), .Z(n7293)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7049_2_lut.init = 16'heeee;
    LUT4 i2_4_lut (.A(prev_in), .B(count[14]), .C(latched_in), .D(n7219), 
         .Z(n6)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))) */ ;
    defparam i2_4_lut.init = 16'h3331;
    LUT4 i3_4_lut (.A(n4829), .B(n8), .C(n6766), .D(n7311), .Z(n7219)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i3_4_lut.init = 16'h0008;
    LUT4 i7067_2_lut (.A(n23), .B(n54), .Z(n7311)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7067_2_lut.init = 16'heeee;
    LUT4 i7164_4_lut (.A(n8), .B(n7694), .C(reset_c), .D(n6766), .Z(n6790)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7164_4_lut.init = 16'h0008;
    LUT4 i5_2_lut_rep_121 (.A(prev_in), .B(latched_in), .Z(n7726)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_121.init = 16'h4444;
    LUT4 i1118_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1328)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1118_2_lut_3_lut.init = 16'hf4f4;
    LUT4 i4423_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[13]), 
         .Z(n116[13])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4423_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4422_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[12]), 
         .Z(n116[12])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4422_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4351_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[2]), .Z(n116[2])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4351_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4489_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[1]), .Z(n116[1])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4489_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4536_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4536_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4368_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[3]), .Z(n116[3])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4368_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4439_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[6]), .Z(n116[6])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4439_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4472_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[7]), .Z(n116[7])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4472_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i7156_2_lut_rep_89_3_lut (.A(n6745), .B(count[14]), .C(count[15]), 
         .Z(n7694)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7156_2_lut_rep_89_3_lut.init = 16'h0101;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6561), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    LUT4 i1577_2_lut_3_lut (.A(n6745), .B(count[14]), .C(n81[15]), .Z(n1787)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1577_2_lut_3_lut.init = 16'h1010;
    LUT4 i3_4_lut_adj_11 (.A(latched_in), .B(prev_in), .C(reset_c), .D(n16), 
         .Z(n2320)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i3_4_lut_adj_11.init = 16'h0400;
    LUT4 i2_4_lut_adj_12 (.A(n54), .B(n23), .C(n8), .D(n4829), .Z(n16)) /* synthesis lut_function=(A+(B+!((D)+!C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_12.init = 16'heefe;
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6560), .COUT(n6561), .S0(n81[13]), .S1(n99[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    LUT4 i2647_2_lut (.A(n2320), .B(n54), .Z(n2852)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2647_2_lut.init = 16'h8888;
    LUT4 i4296_2_lut (.A(n311[0]), .B(n23), .Z(n1[0])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4296_2_lut.init = 16'h8888;
    LUT4 i1_4_lut (.A(count[8]), .B(n7740), .C(n7707), .D(n7252), .Z(n23)) /* synthesis lut_function=(!((B (C+(D))+!B (C))+!A)) */ ;
    defparam i1_4_lut.init = 16'h020a;
    LUT4 i21_4_lut (.A(n5_adj_6), .B(n6766), .C(n7707), .D(n6_adj_7), 
         .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    LUT4 i1_2_lut (.A(count[4]), .B(count[8]), .Z(n5_adj_6)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_13 (.A(n5), .B(n7131), .C(count[9]), .D(n6_adj_8), 
         .Z(n6766)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[28:39])
    defparam i1_4_lut_adj_13.init = 16'hfcec;
    LUT4 i2_2_lut (.A(count[6]), .B(count[8]), .Z(n6_adj_8)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i3_4_lut_adj_14 (.A(count[0]), .B(count[1]), .C(count[2]), .D(count[3]), 
         .Z(n6702)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut_adj_14.init = 16'hfffe;
    LUT4 i4_4_lut (.A(count[15]), .B(n2222), .C(count[12]), .D(n6_adj_9), 
         .Z(n7131)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_adj_15 (.A(count[13]), .B(count[14]), .Z(n6_adj_9)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_15.init = 16'heeee;
    LUT4 i1_4_lut_adj_16 (.A(count[4]), .B(n7703), .C(n7714), .D(n4_adj_10), 
         .Z(n8)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i1_4_lut_adj_16.init = 16'hfcec;
    LUT4 i1_2_lut_rep_102 (.A(count[9]), .B(n7131), .Z(n7707)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_102.init = 16'heeee;
    LUT4 i1_2_lut_rep_98_3_lut (.A(count[9]), .B(n7131), .C(count[8]), 
         .Z(n7703)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_98_3_lut.init = 16'hfefe;
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6559), .COUT(n6560), .S0(n99[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6558), .COUT(n6559), .S0(n99[9]), .S1(n99[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    FD1P3IX count_i15 (.D(n8057), .SP(n1787), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6557), 
          .COUT(n6558), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    CCU2D sub_126_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6593), .S0(n311[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_126_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_126_add_2_9.INIT1 = 16'h0000;
    defparam sub_126_add_2_9.INJECT1_0 = "NO";
    defparam sub_126_add_2_9.INJECT1_1 = "NO";
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6556), 
          .COUT(n6557), .S0(n99[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    FD1P3IX count_i14 (.D(n99[14]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1P3JX count_i13 (.D(n116[13]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1P3JX count_i12 (.D(n116[12]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n99[11]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n99[10]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n99[9]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1P3JX count_i7 (.D(n116[7]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1P3JX count_i6 (.D(n116[6]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n99[5]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n99[4]), .SP(n7694), .CD(n1328), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1P3JX count_i3 (.D(n116[3]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1P3JX count_i2 (.D(n116[2]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1P3JX count_i1 (.D(n116[1]), .SP(n4), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_17 (.A(count[13]), .B(count[12]), .C(n2222), .D(n4_adj_11), 
         .Z(n6745)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_17.init = 16'h8880;
    CCU2D sub_126_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6592), .COUT(n6593), .S0(n311[5]), .S1(n311[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_126_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_126_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_126_add_2_7.INJECT1_0 = "NO";
    defparam sub_126_add_2_7.INJECT1_1 = "NO";
    FD1P3AX valid_48 (.D(n6790), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][3] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    CCU2D sub_126_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6591), .COUT(n6592), .S0(n311[3]), .S1(n311[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_126_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_126_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_126_add_2_5.INJECT1_0 = "NO";
    defparam sub_126_add_2_5.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_18 (.A(n7719), .B(count[9]), .C(n6660), .D(count[8]), 
         .Z(n4_adj_11)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_18.init = 16'heccc;
    CCU2D sub_126_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6590), .COUT(n6591), .S0(n311[1]), .S1(n311[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_126_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_126_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_126_add_2_3.INJECT1_0 = "NO";
    defparam sub_126_add_2_3.INJECT1_1 = "NO";
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6555), 
          .COUT(n6556), .S0(n81[3]), .S1(n99[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    LUT4 i4453_2_lut (.A(n311[1]), .B(n23), .Z(n1[1])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4453_2_lut.init = 16'h8888;
    CCU2D sub_126_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6590), 
          .S1(n311[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_126_add_2_1.INIT0 = 16'hF000;
    defparam sub_126_add_2_1.INIT1 = 16'h5555;
    defparam sub_126_add_2_1.INJECT1_0 = "NO";
    defparam sub_126_add_2_1.INJECT1_1 = "NO";
    LUT4 i4452_2_lut (.A(n311[2]), .B(n23), .Z(n1[2])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4452_2_lut.init = 16'h8888;
    LUT4 i4451_2_lut (.A(n311[3]), .B(n23), .Z(n1[3])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4451_2_lut.init = 16'h8888;
    LUT4 i4450_2_lut (.A(n311[4]), .B(n23), .Z(n1[4])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4450_2_lut.init = 16'h8888;
    LUT4 i4449_2_lut (.A(n311[5]), .B(n23), .Z(n1[5])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4449_2_lut.init = 16'h8888;
    LUT4 i4448_2_lut (.A(n311[6]), .B(n23), .Z(n1[6])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4448_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_19 (.A(count[5]), .B(count[4]), .C(n7720), .D(count[3]), 
         .Z(n6660)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i2_4_lut_adj_19.init = 16'hfeee;
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6554), 
          .COUT(n6555), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6554), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i4447_2_lut (.A(n311[7]), .B(n23), .Z(n1[7])) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4447_2_lut.init = 16'h8888;
    LUT4 i2_3_lut_rep_135 (.A(count[2]), .B(count[3]), .C(count[1]), .Z(n7740)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut_rep_135.init = 16'h8080;
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    LUT4 i2_2_lut_3_lut_4_lut_adj_20 (.A(count[0]), .B(n7740), .C(n7719), 
         .D(count[5]), .Z(n6_adj_7)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_2_lut_3_lut_4_lut_adj_20.init = 16'h8000;
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2320), .PD(n2852), .CK(clk_255kHz_c), 
            .Q(\register[4] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=237, LSE_RLINE=241 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    LUT4 i1_2_lut_adj_21 (.A(count[11]), .B(count[10]), .Z(n2222)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_21.init = 16'heeee;
    LUT4 i1_2_lut_rep_114 (.A(count[7]), .B(count[6]), .Z(n7719)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_114.init = 16'h8888;
    LUT4 i1_2_lut_rep_109_3_lut (.A(count[7]), .B(count[6]), .C(count[5]), 
         .Z(n7714)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_109_3_lut.init = 16'h8080;
    LUT4 i917_2_lut_rep_115 (.A(count[1]), .B(count[2]), .Z(n7720)) /* synthesis lut_function=(A (B)) */ ;
    defparam i917_2_lut_rep_115.init = 16'h8888;
    LUT4 i1_2_lut_3_lut (.A(count[1]), .B(count[2]), .C(count[3]), .Z(n4_adj_10)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;
    defparam i1_2_lut_3_lut.init = 16'hf8f8;
    
endmodule
//
// Verilog Description of module PWMReceiver_U0
//

module PWMReceiver_U0 (reset_c, clk_255kHz_c, VCC_net, GND_net, rc7_c, 
            n8057, \register[5] , \register[0][6] ) /* synthesis syn_module_defined=1 */ ;
    input reset_c;
    input clk_255kHz_c;
    input VCC_net;
    input GND_net;
    input rc7_c;
    input n8057;
    output [7:0]\register[5] ;
    output \register[0][6] ;
    
    wire clk_255kHz_c /* synthesis SET_AS_NETWORK=clk_255kHz_c */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(181[13:23])
    wire n8057 /* synthesis nomerge= */ ;
    
    wire n3953, prev_in, latched_in, n7213, n7216, n4875, n8, 
        n129, n7212, n4, n54;
    wire [15:0]count;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    
    wire n7741, n7255, n7315, n7319, n7688, n7278, n7691, n1334;
    wire [15:0]n81;
    
    wire n6564, n6565, n6563, n6562, n7138, n7708, n6697, n7717, 
        n1701, n4_adj_1;
    wire [15:0]n116;
    
    wire n6597;
    wire [7:0]n320;
    
    wire n6596, n7728, n6595, n6594, n7729, n4_adj_3, n6, n7716, 
        n7730, n7709, n6654, n7731, n5, n2319, n2845;
    wire [7:0]n1;
    
    wire n43, n87_adj_4, n90_adj_5, n7339, n7343, n7331, n6569, 
        n6568, n6567, n6566, n6695;
    
    LUT4 i1_4_lut (.A(n3953), .B(prev_in), .C(latched_in), .D(n7213), 
         .Z(n7216)) /* synthesis lut_function=(!(A+!((C+(D))+!B))) */ ;
    defparam i1_4_lut.init = 16'h5551;
    LUT4 i3_4_lut (.A(n4875), .B(n8), .C(n129), .D(n7212), .Z(n7213)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i3_4_lut.init = 16'h0800;
    LUT4 i1_2_lut (.A(n4), .B(n54), .Z(n7212)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut.init = 16'h2222;
    LUT4 i4558_2_lut_rep_136 (.A(count[5]), .B(count[4]), .Z(n7741)) /* synthesis lut_function=(A (B)) */ ;
    defparam i4558_2_lut_rep_136.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_4_lut (.A(count[5]), .B(count[4]), .C(count[6]), 
         .D(count[7]), .Z(n7255)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i2_4_lut (.A(n7315), .B(reset_c), .C(n7319), .D(n7688), .Z(n7278)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i2_4_lut.init = 16'h0100;
    FD1P3IX count_i0 (.D(n81[0]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i0.GSR = "ENABLED";
    IFS1P3DX latched_in_45 (.D(rc7_c), .SP(VCC_net), .SCLK(clk_255kHz_c), 
            .CD(GND_net), .Q(latched_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam latched_in_45.GSR = "ENABLED";
    FD1S3AX prev_in_46 (.D(latched_in), .CK(clk_255kHz_c), .Q(prev_in)) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam prev_in_46.GSR = "ENABLED";
    CCU2D add_30_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6564), 
          .COUT(n6565), .S0(n81[5]), .S1(n81[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_7.INIT0 = 16'h5aaa;
    defparam add_30_7.INIT1 = 16'h5aaa;
    defparam add_30_7.INJECT1_0 = "NO";
    defparam add_30_7.INJECT1_1 = "NO";
    CCU2D add_30_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6563), 
          .COUT(n6564), .S0(n81[3]), .S1(n81[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_5.INIT0 = 16'h5aaa;
    defparam add_30_5.INIT1 = 16'h5aaa;
    defparam add_30_5.INJECT1_0 = "NO";
    defparam add_30_5.INJECT1_1 = "NO";
    CCU2D add_30_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6562), 
          .COUT(n6563), .S0(n81[1]), .S1(n81[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_3.INIT0 = 16'h5aaa;
    defparam add_30_3.INIT1 = 16'h5aaa;
    defparam add_30_3.INJECT1_0 = "NO";
    defparam add_30_3.INJECT1_1 = "NO";
    CCU2D add_30_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6562), 
          .S1(n81[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_1.INIT0 = 16'hF000;
    defparam add_30_1.INIT1 = 16'h5555;
    defparam add_30_1.INJECT1_0 = "NO";
    defparam add_30_1.INJECT1_1 = "NO";
    LUT4 i7075_2_lut (.A(count[12]), .B(count[13]), .Z(n7319)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7075_2_lut.init = 16'heeee;
    LUT4 i7071_2_lut (.A(count[14]), .B(count[15]), .Z(n7315)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7071_2_lut.init = 16'heeee;
    LUT4 i115_4_lut (.A(n7138), .B(n7708), .C(n7741), .D(n6697), .Z(n129)) /* synthesis lut_function=(A (B)+!A (B (C (D)))) */ ;
    defparam i115_4_lut.init = 16'hc888;
    LUT4 i3_4_lut_adj_1 (.A(count[7]), .B(count[8]), .C(count[6]), .D(n7717), 
         .Z(n7138)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut_adj_1.init = 16'hfffe;
    LUT4 i3_4_lut_adj_2 (.A(count[0]), .B(count[3]), .C(count[1]), .D(count[2]), 
         .Z(n6697)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut_adj_2.init = 16'hfffe;
    FD1P3IX count_i15 (.D(n8057), .SP(n1701), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[15])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i15.GSR = "ENABLED";
    FD1P3IX count_i14 (.D(n81[14]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[14])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i14.GSR = "ENABLED";
    FD1P3JX count_i13 (.D(n116[13]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[13])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i13.GSR = "ENABLED";
    FD1P3JX count_i12 (.D(n116[12]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[12])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i12.GSR = "ENABLED";
    FD1P3IX count_i11 (.D(n81[11]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[11])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i11.GSR = "ENABLED";
    FD1P3IX count_i10 (.D(n81[10]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[10])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i10.GSR = "ENABLED";
    FD1P3IX count_i9 (.D(n81[9]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[9])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i9.GSR = "ENABLED";
    FD1P3JX count_i8 (.D(n116[8]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[8])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i8.GSR = "ENABLED";
    FD1P3JX count_i7 (.D(n116[7]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i7.GSR = "ENABLED";
    FD1P3JX count_i6 (.D(n116[6]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i6.GSR = "ENABLED";
    FD1P3IX count_i5 (.D(n81[5]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i5.GSR = "ENABLED";
    FD1P3IX count_i4 (.D(n81[4]), .SP(n7691), .CD(n1334), .CK(clk_255kHz_c), 
            .Q(count[4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i4.GSR = "ENABLED";
    FD1P3JX count_i3 (.D(n116[3]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i3.GSR = "ENABLED";
    FD1P3JX count_i2 (.D(n116[2]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i2.GSR = "ENABLED";
    FD1P3JX count_i1 (.D(n116[1]), .SP(n4_adj_1), .PD(reset_c), .CK(clk_255kHz_c), 
            .Q(count[1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam count_i1.GSR = "ENABLED";
    CCU2D sub_127_add_2_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6597), .S0(n320[7]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_127_add_2_9.INIT0 = 16'h5aaa;
    defparam sub_127_add_2_9.INIT1 = 16'h0000;
    defparam sub_127_add_2_9.INJECT1_0 = "NO";
    defparam sub_127_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_127_add_2_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6596), .COUT(n6597), .S0(n320[5]), .S1(n320[6]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_127_add_2_7.INIT0 = 16'h5aaa;
    defparam sub_127_add_2_7.INIT1 = 16'h5aaa;
    defparam sub_127_add_2_7.INJECT1_0 = "NO";
    defparam sub_127_add_2_7.INJECT1_1 = "NO";
    LUT4 i7069_2_lut_rep_123 (.A(count[11]), .B(count[10]), .Z(n7728)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i7069_2_lut_rep_123.init = 16'heeee;
    CCU2D sub_127_add_2_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6595), .COUT(n6596), .S0(n320[3]), .S1(n320[4]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_127_add_2_5.INIT0 = 16'h5aaa;
    defparam sub_127_add_2_5.INIT1 = 16'h5aaa;
    defparam sub_127_add_2_5.INJECT1_0 = "NO";
    defparam sub_127_add_2_5.INJECT1_1 = "NO";
    LUT4 i4_3_lut_rep_112_4_lut (.A(count[11]), .B(count[10]), .C(n7315), 
         .D(n7319), .Z(n7717)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4_3_lut_rep_112_4_lut.init = 16'hfffe;
    CCU2D sub_127_add_2_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6594), .COUT(n6595), .S0(n320[1]), .S1(n320[2]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_127_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_127_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_127_add_2_3.INJECT1_0 = "NO";
    defparam sub_127_add_2_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_124 (.A(count[7]), .B(count[6]), .Z(n7729)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_124.init = 16'h8888;
    CCU2D sub_127_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n6594), 
          .S1(n320[0]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(158[22:33])
    defparam sub_127_add_2_1.INIT0 = 16'hF000;
    defparam sub_127_add_2_1.INIT1 = 16'h5555;
    defparam sub_127_add_2_1.INJECT1_0 = "NO";
    defparam sub_127_add_2_1.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_3 (.A(count[13]), .B(n7728), .C(count[12]), .D(n4_adj_3), 
         .Z(n3953)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_4_lut_adj_3.init = 16'ha080;
    LUT4 i2_2_lut_3_lut_4_lut (.A(count[7]), .B(count[6]), .C(count[8]), 
         .D(count[5]), .Z(n6)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_rep_111_3_lut (.A(count[7]), .B(count[6]), .C(count[5]), 
         .Z(n7716)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_111_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_rep_125 (.A(count[1]), .B(count[3]), .C(count[2]), .Z(n7730)) /* synthesis lut_function=(A (B (C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_3_lut_rep_125.init = 16'h8080;
    LUT4 i1_2_lut_rep_104_4_lut (.A(count[1]), .B(count[3]), .C(count[2]), 
         .D(count[0]), .Z(n7709)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_2_lut_rep_104_4_lut.init = 16'h8000;
    LUT4 i1_4_lut_adj_4 (.A(count[8]), .B(count[9]), .C(n6654), .D(n7729), 
         .Z(n4_adj_3)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i1_4_lut_adj_4.init = 16'heccc;
    LUT4 i2_3_lut (.A(count[5]), .B(count[4]), .C(n7730), .Z(n6654)) /* synthesis lut_function=(A+(B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(123[16:21])
    defparam i2_3_lut.init = 16'hfefe;
    LUT4 i5_2_lut_rep_126 (.A(prev_in), .B(latched_in), .Z(n7731)) /* synthesis lut_function=(!(A+!(B))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i5_2_lut_rep_126.init = 16'h4444;
    LUT4 i1124_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(reset_c), 
         .Z(n1334)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i1124_2_lut_3_lut.init = 16'hf4f4;
    LUT4 i4385_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[13]), 
         .Z(n116[13])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4385_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4367_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[12]), 
         .Z(n116[12])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4367_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4377_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[2]), .Z(n116[2])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4377_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4341_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[1]), .Z(n116[1])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4341_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4412_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[8]), .Z(n116[8])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4412_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i1_2_lut_3_lut (.A(count[0]), .B(n7730), .C(count[4]), .Z(n5)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'h8080;
    LUT4 i4387_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[3]), .Z(n116[3])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4387_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4338_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[6]), .Z(n116[6])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4338_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i4411_2_lut_3_lut (.A(prev_in), .B(latched_in), .C(n81[7]), .Z(n116[7])) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(142[10:31])
    defparam i4411_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i7205_2_lut_rep_86_3_lut (.A(n3953), .B(count[14]), .C(count[15]), 
         .Z(n7691)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i7205_2_lut_rep_86_3_lut.init = 16'h0101;
    FD1P3JX period_i0_i0 (.D(n1[0]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [0])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i0.GSR = "ENABLED";
    FD1P3AX valid_48 (.D(n7278), .SP(n43), .CK(clk_255kHz_c), .Q(\register[0][6] ));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam valid_48.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_5 (.A(count[8]), .B(n7729), .C(count[5]), .D(n87_adj_4), 
         .Z(n90_adj_5)) /* synthesis lut_function=(A+(B (C (D)))) */ ;
    defparam i1_4_lut_adj_5.init = 16'heaaa;
    LUT4 i7180_4_lut (.A(count[7]), .B(count[6]), .C(count[8]), .D(n7339), 
         .Z(n7343)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam i7180_4_lut.init = 16'h0001;
    LUT4 i7095_3_lut (.A(count[5]), .B(n7331), .C(count[4]), .Z(n7339)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i7095_3_lut.init = 16'h8080;
    LUT4 i7087_4_lut (.A(count[3]), .B(count[0]), .C(count[1]), .D(count[2]), 
         .Z(n7331)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i7087_4_lut.init = 16'hfffe;
    CCU2D add_30_17 (.A0(count[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6569), 
          .S0(n81[15]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_17.INIT0 = 16'h5aaa;
    defparam add_30_17.INIT1 = 16'h0000;
    defparam add_30_17.INJECT1_0 = "NO";
    defparam add_30_17.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_6 (.A(count[2]), .B(count[3]), .C(count[1]), .D(count[4]), 
         .Z(n87_adj_4)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;
    defparam i2_4_lut_adj_6.init = 16'hffec;
    CCU2D add_30_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6568), .COUT(n6569), .S0(n81[13]), .S1(n81[14]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_15.INIT0 = 16'h5aaa;
    defparam add_30_15.INIT1 = 16'h5aaa;
    defparam add_30_15.INJECT1_0 = "NO";
    defparam add_30_15.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut_adj_7 (.A(n3953), .B(count[14]), .C(n7731), 
         .D(count[15]), .Z(n4_adj_1)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C+!(D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_7.init = 16'hf0f1;
    LUT4 n90_bdd_4_lut (.A(n90_adj_5), .B(n7343), .C(count[9]), .D(n7728), 
         .Z(n7688)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;
    defparam n90_bdd_4_lut.init = 16'h00ca;
    CCU2D add_30_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6567), .COUT(n6568), .S0(n81[11]), .S1(n81[12]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_13.INIT0 = 16'h5aaa;
    defparam add_30_13.INIT1 = 16'h5aaa;
    defparam add_30_13.INJECT1_0 = "NO";
    defparam add_30_13.INJECT1_1 = "NO";
    LUT4 i7170_4_lut (.A(reset_c), .B(n7731), .C(n7216), .D(n7315), 
         .Z(n43)) /* synthesis lut_function=(A+!(B+!((D)+!C))) */ ;
    defparam i7170_4_lut.init = 16'hbbab;
    LUT4 i1491_2_lut_3_lut (.A(n3953), .B(count[14]), .C(n81[15]), .Z(n1701)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1491_2_lut_3_lut.init = 16'h1010;
    CCU2D add_30_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n6566), .COUT(n6567), .S0(n81[9]), .S1(n81[10]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_11.INIT0 = 16'h5aaa;
    defparam add_30_11.INIT1 = 16'h5aaa;
    defparam add_30_11.INJECT1_0 = "NO";
    defparam add_30_11.INJECT1_1 = "NO";
    LUT4 i4430_2_lut (.A(n320[1]), .B(n4), .Z(n1[1])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4430_2_lut.init = 16'h2222;
    LUT4 i4429_2_lut (.A(n320[2]), .B(n4), .Z(n1[2])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4429_2_lut.init = 16'h2222;
    LUT4 i4428_2_lut (.A(n320[3]), .B(n4), .Z(n1[3])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4428_2_lut.init = 16'h2222;
    CCU2D add_30_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n6565), 
          .COUT(n6566), .S0(n81[7]), .S1(n81[8]));   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(173[18:25])
    defparam add_30_9.INIT0 = 16'h5aaa;
    defparam add_30_9.INIT1 = 16'h5aaa;
    defparam add_30_9.INJECT1_0 = "NO";
    defparam add_30_9.INJECT1_1 = "NO";
    LUT4 i4425_2_lut (.A(n320[6]), .B(n4), .Z(n1[6])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4425_2_lut.init = 16'h2222;
    LUT4 i4426_2_lut (.A(n320[5]), .B(n4), .Z(n1[5])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4426_2_lut.init = 16'h2222;
    LUT4 i4424_2_lut (.A(n320[7]), .B(n4), .Z(n1[7])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4424_2_lut.init = 16'h2222;
    LUT4 i4427_2_lut (.A(n320[4]), .B(n4), .Z(n1[4])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4427_2_lut.init = 16'h2222;
    FD1P3JX period_i0_i1 (.D(n1[1]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [1])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i1.GSR = "ENABLED";
    FD1P3JX period_i0_i2 (.D(n1[2]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [2])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i2.GSR = "ENABLED";
    FD1P3JX period_i0_i3 (.D(n1[3]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [3])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i3.GSR = "ENABLED";
    FD1P3JX period_i0_i4 (.D(n1[4]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [4])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i4.GSR = "ENABLED";
    FD1P3JX period_i0_i5 (.D(n1[5]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [5])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i5.GSR = "ENABLED";
    FD1P3JX period_i0_i6 (.D(n1[6]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [6])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i6.GSR = "ENABLED";
    FD1P3JX period_i0_i7 (.D(n1[7]), .SP(n2319), .PD(n2845), .CK(clk_255kHz_c), 
            .Q(\register[5] [7])) /* synthesis LSE_LINE_FILE_ID=5, LSE_LCOL=14, LSE_RCOL=36, LSE_LLINE=242, LSE_RLINE=246 */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam period_i0_i7.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_103_4_lut (.A(n7319), .B(n7728), .C(n7315), .D(count[9]), 
         .Z(n7708)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_2_lut_rep_103_4_lut.init = 16'hfffe;
    LUT4 i2_4_lut_adj_8 (.A(n6695), .B(reset_c), .C(latched_in), .D(prev_in), 
         .Z(n2319)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(137[5] 175[8])
    defparam i2_4_lut_adj_8.init = 16'h0200;
    LUT4 i4676_3_lut_4_lut (.A(count[8]), .B(n7708), .C(n7255), .D(n7709), 
         .Z(n4875)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i4676_3_lut_4_lut.init = 16'hfeee;
    LUT4 i2_4_lut_adj_9 (.A(n54), .B(n4), .C(n8), .D(n4875), .Z(n6695)) /* synthesis lut_function=(A+!(B ((D)+!C))) */ ;
    defparam i2_4_lut_adj_9.init = 16'hbbfb;
    LUT4 i2640_2_lut (.A(n2319), .B(n54), .Z(n2845)) /* synthesis lut_function=(A (B)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(127[9] 176[6])
    defparam i2640_2_lut.init = 16'h8888;
    LUT4 i1_3_lut_4_lut (.A(count[8]), .B(n7708), .C(n7716), .D(n87_adj_4), 
         .Z(n8)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i1_3_lut_4_lut.init = 16'hfeee;
    LUT4 i4303_2_lut (.A(n320[0]), .B(n4), .Z(n1[0])) /* synthesis lut_function=(!((B)+!A)) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(155[10] 159[14])
    defparam i4303_2_lut.init = 16'h2222;
    LUT4 i2_4_lut_adj_10 (.A(n7255), .B(count[8]), .C(n7730), .D(n7708), 
         .Z(n4)) /* synthesis lut_function=(A ((C+(D))+!B)+!A ((D)+!B)) */ ;
    defparam i2_4_lut_adj_10.init = 16'hffb3;
    LUT4 i21_4_lut (.A(n5), .B(n129), .C(n7708), .D(n6), .Z(n54)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B+!(C)))) */ ;   // /home/nick/Desktop/nickfolder/documents/projects/in-progress/project 5l - OSURC Rover 2016/electrical/uniboard/software/hdl-verilog/pwm.v(160[13:39])
    defparam i21_4_lut.init = 16'h3230;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

