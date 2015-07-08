/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 21955 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w2048,
    w2049,
    w64,
    w1985,
    w15880,
    w17865,
    w4098,
    w21963,
    w8,
    w21955;

  assign w1 = i_data0;
  assign w15880 = w1985 << 3;
  assign w17865 = w1985 + w15880;
  assign w1985 = w2049 - w64;
  assign w2048 = w1 << 11;
  assign w2049 = w1 + w2048;
  assign w21955 = w21963 - w8;
  assign w21963 = w17865 + w4098;
  assign w4098 = w2049 << 1;
  assign w64 = w1 << 6;
  assign w8 = w1 << 3;

  assign o_data0 = w21955;

  //multiplier_block area estimate = 9227.43362084412;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule