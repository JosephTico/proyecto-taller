// audio.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module audio (
		input  wire [15:0] to_dac_left_channel_data,     //    avalon_left_channel_sink.data
		input  wire        to_dac_left_channel_valid,    //                            .valid
		output wire        to_dac_left_channel_ready,    //                            .ready
		input  wire        from_adc_left_channel_ready,  //  avalon_left_channel_source.ready
		output wire [15:0] from_adc_left_channel_data,   //                            .data
		output wire        from_adc_left_channel_valid,  //                            .valid
		input  wire [15:0] to_dac_right_channel_data,    //   avalon_right_channel_sink.data
		input  wire        to_dac_right_channel_valid,   //                            .valid
		output wire        to_dac_right_channel_ready,   //                            .ready
		input  wire        from_adc_right_channel_ready, // avalon_right_channel_source.ready
		output wire [15:0] from_adc_right_channel_data,  //                            .data
		output wire        from_adc_right_channel_valid, //                            .valid
		input  wire        clk,                          //                         clk.clk
		input  wire        AUD_BCLK,                     //          external_interface.BCLK
		output wire        AUD_DACDAT,                   //                            .DACDAT
		input  wire        AUD_DACLRCK,                  //                            .DACLRCK
		input  wire        reset                         //                       reset.reset
	);

	audio_audio_0 audio_0 (
		.clk                          (clk),                          //                         clk.clk
		.reset                        (reset),                        //                       reset.reset
		.from_adc_left_channel_ready  (from_adc_left_channel_ready),  //  avalon_left_channel_source.ready
		.from_adc_left_channel_data   (from_adc_left_channel_data),   //                            .data
		.from_adc_left_channel_valid  (from_adc_left_channel_valid),  //                            .valid
		.from_adc_right_channel_ready (from_adc_right_channel_ready), // avalon_right_channel_source.ready
		.from_adc_right_channel_data  (from_adc_right_channel_data),  //                            .data
		.from_adc_right_channel_valid (from_adc_right_channel_valid), //                            .valid
		.to_dac_left_channel_data     (to_dac_left_channel_data),     //    avalon_left_channel_sink.data
		.to_dac_left_channel_valid    (to_dac_left_channel_valid),    //                            .valid
		.to_dac_left_channel_ready    (to_dac_left_channel_ready),    //                            .ready
		.to_dac_right_channel_data    (to_dac_right_channel_data),    //   avalon_right_channel_sink.data
		.to_dac_right_channel_valid   (to_dac_right_channel_valid),   //                            .valid
		.to_dac_right_channel_ready   (to_dac_right_channel_ready),   //                            .ready
		.AUD_BCLK                     (AUD_BCLK),                     //          external_interface.export
		.AUD_DACDAT                   (AUD_DACDAT),                   //                            .export
		.AUD_DACLRCK                  (AUD_DACLRCK)                   //                            .export
	);

endmodule
