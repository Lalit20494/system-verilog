// Author   :   Admin   (www.chipverify.com)
// Purpose  :   Example of the usage of $value$plusargs
//-----------------------------------------------------


// Note FS : Format Specifier

module tb;
  initial begin
  	string  	var1, var2;
    bit [31:0] 	data;

    if ($value$plusargs ("STRING=%s", var1))
      $display ("STRING with FS has a value %s", var1);
    
    if ($value$plusargs ("NUMBER=%0d", data))
      $display ("NUMBER with %%0d has a value %0d", data);
    
    if ($value$plusargs ("NUMBER=%0h", data))
      $display ("NUMBER with %%0h has a value %0d", data);
    
    if ($value$plusargs ("NUMBER=%s", data))
      $display ("NUMBER with %%s has a value %0d", data);
    
    if ($value$plusargs ("STRING=", var1))
      $display ("STRING without FS has a value %s", var1);
    
    if ($value$plusargs ("+STRING=%s", var1))
      $display ("STRING with + char has a value %s", var1);

`ifdef RUNTIME_ERR
    if ($value$plusargs ("STRING=%0d", var2))
      $display ("STRING with %%0d has a value %s", var2);
`endif	
  end
endmodule


/* Simulation Log  :  +STRING=Joey    or     +STRING="Joey"
-----------------------------------------------------------
ncsim> run
STRING with FS has a value Joey
STRING without FS has a value Joey
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  +NUMBER=100
-----------------------------
ncsim> run
NUMBER with %0d has a value 100
NUMBER with %0h has a value 256
NUMBER with %s has a value 3223600
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  +STRING
-------------------------
ncsim> run
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  +STRING=
--------------------------
ncsim> run
STRING with FS has a value 
STRING without FS has a value
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  ++STRING=Joey
-------------------------------
ncsim> run
STRING with + char has a value Joey
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  +STRING=1234
------------------------------
ncsim> run
STRING with FS has a value 1234
STRING without FS has a value 1234
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log :  +define+RUNTIME_ERR    +STRING=Joey
-----------------------------------------------------
ncsim> run
STRING with FS has a value Joey
STRING without FS has a value Joey
    if ($value$plusargs ("STRING=%0d", var2))
                      |
ncsim: *E,SYSFMT (./testbench.sv,27|22): $value$plusargs --  value found 'Joey' for plusarg 'STRING=' does not match specified format.
STRING with %0d has a value 
ncsim: *W,RNQUIE: Simulation is complete.

*/
