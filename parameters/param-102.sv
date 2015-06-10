//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  parameter can also specify a data-type and hence each 
//                   module instance can have its data of a different type, set
//                   during instantiation
//-----------------------------------------------------------------------------

module mydesign #(parameter MSB = 4, type ADDR = bit[31:0], type DATA = logic) (input pulse);

   ADDR          addr;
   DATA          data0;
   DATA [2:0]    data1;
   DATA [2:0]    data2 [3];
   
   initial begin
     $display ("Parameter MSB = %0d", MSB);
     $display ("Parameter size(addr)  = %0d type = %s", $bits(addr), $typename(addr));
     $display ("Parameter size(data0) = %0d type = %s", $bits(data0), $typename(data0));
     $display ("Parameter size(data1) = %0d type = %s", $bits(data1), $typename(data1));
     $display ("Parameter size(data2) = %0d type = %s", $bits(data2), $typename(data2));
   end
endmodule

//-----------------------------------------------------------------------------
// Instantiate the design module with different data-type parameters
//-----------------------------------------------------------------------------

module tb_top;

   bit pulse;

   // Let's instantiate the module with different data-types
`ifdef LONGINT
   mydesign #(.ADDR(longint), .DATA(reg))        dsn0 (.pulse (pulse));

`elsif SHORTINT
   mydesign #(.ADDR(shortint), .DATA(bit [7:0]))  dsn0 (.pulse (pulse));

`elsif LOGIC
   mydesign #(.MSB(), .ADDR(logic[7:0])) dsn0 (.pulse (pulse));
`endif

endmodule

//-----------------------------------------------------------------------------
// To instantiate mydesign with explicit parameter override, run command as:
// $> irun param-102.sv +define+LONGINT
// $> irun param-102.sv +define+SHORTINT
// $> irun param-102.sv +define+LOGIC
//-----------------------------------------------------------------------------
