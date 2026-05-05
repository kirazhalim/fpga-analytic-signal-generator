`timescale 1ns / 1ps
module top_module(
    clk,
    reset,
    out_LED
    );

    input clk;
    input reset;
    output out_LED;
    
    wire clk_out;
    
    wire signal_tready;
    wire signal_tvalid;
    
    wire [15:0] signal_sine;
    wire [47:0] m_axis_data_tdata;
    
    wire [13:0] signal_I;
    wire [30:0] signal_Q;
    
    assign signal_I = m_axis_data_tdata[13:0];
    assign signal_Q = m_axis_data_tdata[46:16];

    clk_wiz_0 clock_i
       (
        // Clock out ports
        .clk_out1(clk_out),     // output clk_out1
        // Status and control signals
        .reset(reset), // input reset
       // Clock in ports
        .clk_in1(clk)      // input clk_in1
    );

    dds_compiler_0 DDS_i (
      .aclk(clk_out),                              // input wire aclk
      .m_axis_data_tvalid(signal_tvalid),  // output wire m_axis_data_tvalid
      .m_axis_data_tready(signal_tready),  // input wire m_axis_data_tready
      .m_axis_data_tdata(signal_sine)    // output wire [15 : 0] m_axis_data_tdata
    );
    
    fir_compiler_0 Hilbert_i(
      .aclk(clk_out),                              // input wire aclk
      .s_axis_data_tvalid(signal_tvalid),  // input wire s_axis_data_tvalid
      .s_axis_data_tready(signal_tready),  // output wire s_axis_data_tready
      .s_axis_data_tdata(signal_sine),    // input wire [15 : 0] s_axis_data_tdata
      .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
      .m_axis_data_tdata(m_axis_data_tdata)    // output wire [47 : 0] m_axis_data_tdata
    ); 
      
    led_toggle led_toggle_i(
        .clk(clk_out),
        .reset(reset),
        .led(out_LED)
    );
    
    ila_0 ILA_i (
        .clk(clk_out), // input wire clk
    
    
        .probe0(signal_sine), // input wire [15:0]  probe0  
        .probe1(signal_I), // input wire [13:0]  probe1 
        .probe2(signal_Q) // input wire [30:0]  probe2
    );
    
    
endmodule