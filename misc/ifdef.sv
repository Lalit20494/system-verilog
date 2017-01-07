// Author   : Admin (www.chipverify.com)
// Purpose  : To demonstrate the example of using `ifdef compiler macros
//            These are compiler directives or in other words, instructions
//            for the compiler to include or omit certain parts of the code
//            as defined by the `ifdef in the simulation
//            You can also do the below to always include the part as:
//             `define [ifdef_macro_text] 

// `define USAGE        // Uncomment this to always execute code within USAGE

module tb;
   bit [7:0]  data;

   initial begin
      // This display statement is not within any `ifdef block and hence will 
      // always be printed regardless of what is passed using +define+
      $display ("This code is not within `ifdef ...");

`ifdef PART1
      data = 8'hef;
      $display ("PART1: data = 0x%0h", data);
`elsif PART2
      data = 8'h4c;
      $display ("PART2: data = 0x%0h", data);
`else
      data = 8'h22;
      $display ("ELSE: data = 0x%0h", data);
`endif
      
      $display ("This code is outside `ifdef ...");

`ifdef USAGE        // Look for this display message in log if +define+USAGE used 
   $display ("This is the usage of `ifdef - `endif");
`endif

`ifndef NOTDEF      // if not defined : This display will be output by default, to mask use +define+NOTDEF
   $display ("NOTDEF was not provided as compile time arg ...");
`endif

   end
endmodule

/*
Simulation Log:  
---------------
ncsim> run
This code is not within `ifdef ...
ELSE: data = 0x22
This code is outside `ifdef ...
NOTDEF was not provided as compile time arg ...
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log: +define+PART1
-----------------------------
ncsim> run
This code is not within `ifdef ...
PART1: data = 0xef
This code is outside `ifdef ...
NOTDEF was not provided as compile time arg ...
ncsim: *W,RNQUIE: Simulation is complete.

Simulation Log: +define+PART2
-----------------------------
ncsim> run
This code is not within `ifdef ...
PART2: data = 0x4c
This code is outside `ifdef ...
NOTDEF was not provided as compile time arg ...
ncsim: *W,RNQUIE: Simulation is complete.

Simulation Log: +define+USAGE
-----------------------------
ncsim> run
This code is not within `ifdef ...
ELSE: data = 0x22
This code is outside `ifdef ...
This is the usage of `ifdef - `endif
NOTDEF was not provided as compile time arg ...
ncsim: *W,RNQUIE: Simulation is complete.

Simulation Log: +define+NOTDEF+USAGE
------------------------------------
ncsim> run
This code is not within `ifdef ...
ELSE: data = 0x22
This code is outside `ifdef ...
This is the usage of `ifdef - `endif
ncsim: *W,RNQUIE: Simulation is complete.

*/
