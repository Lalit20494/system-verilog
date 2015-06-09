//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Parameter can be inside a module, interface, class, program
// Definitions    :  DEFPARAM_BEFORE
//                   EXPLICIT
//                   IMPLICIT
//                   DEFPARAM
// Note that a defparam statment will override everything else
//-----------------------------------------------------------------------------

module mydesign #(parameter MSB = 4, depth = 3) (input pulse);

   initial begin
     $display ("Parameter MSB = %0d", MSB);
     $display ("Parameter depth = %0d", depth);
   end
endmodule

//-----------------------------------------------------------------------------
// If EXPLICIT_OVERRIDE is defined, the module will be instantiated with new
// parameters which will override the default ones of 4 and 3 with 10 and 34
//-----------------------------------------------------------------------------

module tb_top;

  bit pulse;

// To see if DEFPARAM will be overridden by EXPLICIT/IMPLICIT 
`ifdef DEFPARAM_BEFORE
    defparam dsn0.MSB = 222;
    defparam dsn0.depth = 333;
`endif
 
// Example of explicit override 
`ifdef EXPLICIT
   mydesign #(.MSB (10), .depth (34)) dsn0 (.pulse (pulse));

// Example of implicit override
`elsif IMPLICIT
  mydesign #(256, 128) dsn0 (.pulse (pulse));

// Example of default parameterization 
`else
   mydesign dsn0 (.pulse (pulse));
`endif

// Example of defparam override; note that it is not within initial/always
`ifdef DEFPARAM
    defparam dsn0.MSB = 1024;
    defparam dsn0.depth = 512;
`endif

endmodule

//-----------------------------------------------------------------------------
// To instantiate mydesign with explicit parameter override, run command as:
// $> irun param-101.sv +define+EXPLICIT
//
// To instantiate mydesign with implicit parameter override, run command as:
// $> irun param-101.sv +define+IMPLICIT
//
// To see output for default values of mydesign module, run without the define
// $> irun param-101.sv
//
// To see if defparam overrides an EXPLICIT or IMPLICIT override, run:
// $> irun param-101.sv +define+EXPLICIT+DEFPARAM
//
// To see if defparam overrides an EXPLICIT or IMPLICIT override, run:
// $> irun param-101.sv +define+EXPLICIT+DEFPARAM_BEFORE
//-----------------------------------------------------------------------------
