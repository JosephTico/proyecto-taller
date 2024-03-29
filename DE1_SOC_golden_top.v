// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Thu Jul 11 11:26:45 2013
// ============================================================================

`define ENABLE_ADC
`define ENABLE_AUD
`define ENABLE_CLOCK2
`define ENABLE_CLOCK3
`define ENABLE_CLOCK4
`define ENABLE_CLOCK
`define ENABLE_DRAM
`define ENABLE_FAN
`define ENABLE_FPGA
`define ENABLE_GPIO
`define ENABLE_HEX
//`define ENABLE_HPS
`define ENABLE_IRDA
`define ENABLE_KEY
`define ENABLE_LEDR
`define ENABLE_PS2
`define ENABLE_SW
`define ENABLE_TD
`define ENABLE_VGA

module DE1_SOC_golden_top(

      /* Enables ADC - 3.3V */
	`ifdef ENABLE_ADC

      output             ADC_CONVST,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

	`endif

       /* Enables AUD - 3.3V */
	`ifdef ENABLE_AUD

      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

	`endif

      /* Enables CLOCK2  */
	`ifdef ENABLE_CLOCK2
      input              CLOCK2_50,
	`endif

      /* Enables CLOCK3 */
	`ifdef ENABLE_CLOCK3
      input              CLOCK3_50,
	`endif

      /* Enables CLOCK4 */
	`ifdef ENABLE_CLOCK4
      input              CLOCK4_50,
	`endif

      /* Enables CLOCK */
	`ifdef ENABLE_CLOCK
      input              CLOCK_50,
	`endif

       /* Enables DRAM - 3.3V */
	`ifdef ENABLE_DRAM
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,
	`endif

      /* Enables FAN - 3.3V */
	`ifdef ENABLE_FAN
      output             FAN_CTRL,
	`endif

      /* Enables FPGA - 3.3V */
	`ifdef ENABLE_FPGA
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,
	`endif

      /* Enables GPIO - 3.3V */
	`ifdef ENABLE_GPIO
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
	`endif
 

      /* Enables HEX - 3.3V */
	`ifdef ENABLE_HEX
      output      [6:0]  HEX0,
      output      [6:0]  HEX1,
      output      [6:0]  HEX2,
      output      [6:0]  HEX3,
      output      [6:0]  HEX4,
      output      [6:0]  HEX5,
	`endif
	
	/* Enables HPS */
	`ifdef ENABLE_HPS
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N, //1.5V
      output             HPS_DDR3_CK_P, //1.5V
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif 

      /* Enables IRDA - 3.3V */
	`ifdef ENABLE_IRDA
      input              IRDA_RXD,
      output             IRDA_TXD,
	`endif

      /* Enables KEY - 3.3V */
	`ifdef ENABLE_KEY
      input       [3:0]  KEY,
	`endif

      /* Enables LEDR - 3.3V */
	`ifdef ENABLE_LEDR
      output      [9:0]  LEDR,
	`endif

      /* Enables PS2 - 3.3V */
	`ifdef ENABLE_PS2
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,
	`endif

      /* Enables SW - 3.3V */
	`ifdef ENABLE_SW
      input       [9:0]  SW,
	`endif

      /* Enables TD - 3.3V */
	`ifdef ENABLE_TD
      input             TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output            TD_RESET_N,
      input             TD_VS,
	`endif

      /* Enables VGA - 3.3V */
	`ifdef ENABLE_VGA
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
	`endif
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

logic right_ready;
logic left_ready;
logic [15:0] sample_data;
logic sample_valid;

logic [3:0] note;
logic [2:0] octave = 3;
logic [7:0] volume;
logic [6:0] keyArray;
wire A, S, D, F, G, H, J;


assign VGA_SYNC_N = 0;
assign VGA_BLANK_N = 1;

wire CLOCK_25;

divide_clock_by_two(CLOCK_50, CLOCK_25);
vga_top(CLOCK_25, SW[0], VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, keyArray);
assign VGA_CLK = CLOCK_25;



keyboard_to_notes(A, S, D, F, G, H, J, note, volume, keyArray);

tonegen tg(.clk(CLOCK_50), .reset(~KEY[0]), .volume(volume), .note(note), .octave(octave), .left_chan_ready(left_ready),
    .right_chan_ready(right_ready), .sample_data(sample_data), .sample_valid(sample_valid));
	 
	 keyboard_controller kc(
								 .clock(CLOCK_50),
								 .reset(KEY[0]),
								 .PS2_CLK(PS2_CLK),
								 .PS2_DAT(PS2_DAT),
								 .w(),
								 .a(A),
								 .s(S),
								 .d(D),
								 .f(F),
								 .g(G),
								 .h(H),
								 .j(J),
								 .down(),
								 .space(),
								 .enter()
								 );	

//=======================================================
//  Structural coding
//=======================================================


    audio u0 (
        .reset_reset_n                                    (KEY[0]),                                    //                                       reset.reset_n
        .clk_clk                                          (CLOCK_50),                                          //                                         clk.clk
        .audio_and_video_config_0_external_interface_SDAT (FPGA_I2C_SDAT), // audio_and_video_config_0_external_interface.SDAT
        .audio_and_video_config_0_external_interface_SCLK (FPGA_I2C_SCLK), //                                            .SCLK
        .audio_0_avalon_left_channel_sink_data            (sample_data),            //            audio_0_avalon_left_channel_sink.data
        .audio_0_avalon_left_channel_sink_valid           (sample_valid),           //                                            .valid
        .audio_0_avalon_left_channel_sink_ready           (left_ready),           //                                            .ready
        .audio_0_external_interface_BCLK                  (AUD_BCLK),                  //                  audio_0_external_interface.BCLK
        .audio_0_external_interface_DACDAT                (AUD_DACDAT),                //                                            .DACDAT
        .audio_0_external_interface_DACLRCK               (AUD_DACLRCK),               //                                            .DACLRCK
        .audio_0_avalon_right_channel_sink_data           (sample_data),           //           audio_0_avalon_right_channel_sink.data
        .audio_0_avalon_right_channel_sink_valid          (sample_valid),          //                                            .valid
        .audio_0_avalon_right_channel_sink_ready          (right_ready),           //                                            .ready
        .audio_pll_0_audio_clk_clk                        (AUD_XCK)                         //                       audio_pll_0_audio_clk.clk
    );




endmodule
