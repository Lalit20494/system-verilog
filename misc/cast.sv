//---------------------------------------------------------------------------
// Author : Admin | ChipVerify (www.chipverify.com)
//---------------------------------------------------------------------------

typedef enum { PENNY=1, FIVECENTS=5, DIME=10, QUARTER=25, DOLLAR=100 } Cents;
 
module tb;
   Cents   myCent = 1;

   initial begin
`ifdef DIRECT
      myCent = 10 + 5 + 10;
`elsif OUT_OF_RANGE
      $cast (myCent, 75);
`elsif FUNCTION
      if ($cast (myCent, 75))
         $display ("Cast passed");
      else
         $display ("Cast failed");
`else
      $cast (myCent, 10 + 5 + 10);
`endif
      $display ("Money=%s", myCent.name());
   end
endmodule

/* 
Simulation Log : +define+DIRECT
-------------------------------
ERROR VCP2694 "Assignment to enum variable from expression of different type." "testbench.sv" 10  1
FAILURE "Compile failure 1 Errors 0 Warnings  Analysis time: 0[s]."

Simulation Log : +define+OUT_OF_RANGE
-------------------------------------
run -all;
# KERNEL: Fatal Error: testbench.sv (10): dynamic cast failed on enum cast, Illegal conversion to enum of type UnitScopePackage_1::Cents
# RUNTIME: Info: RUNTIME_0068 testbench.sv (10): $finish called.

Simulation Log : +define+FUNCTION
---------------------------------
run -all;
# KERNEL: Cast failed
# KERNEL: Money=
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

Simulation Log (Default) - Task
-------------------------------
run -all;
# KERNEL: Money=QUARTER
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
