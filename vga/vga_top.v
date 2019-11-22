module vga_top(
    input wire CLK,             // clock de 25 MHz
    input wire RST_BTN,         // botón de reset
    output wire VGA_HS_O,       // salida HS
    output wire VGA_VS_O,       // salida VS
    output wire [7:0] VGA_R,    // salida rojo
    output wire [7:0] VGA_G,    // salida verde
    output wire [7:0] VGA_B,     // salida azul
	 input wire [6:0] keyArray
    );

    wire rst = ~RST_BTN;    // reset = active low

    wire [9:0] x;  // posicion X, 10 bits entre 0-1023
    wire [8:0] y;  // posición y, 9 bits entre: 0-511


	 wire display_enabled;
	 

    vga640x480 display (
        .i_clk(CLK),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y),
		  .o_active(display_enabled)
		  );
		  
	 ttt_drawer(CLK, display_enabled, x, y, VGA_R, VGA_G, VGA_B, keyArray);


endmodule