// Author   : Admin (www.chipverify.com)
// Purpose  : Create a dynamic array within each index of 
//            an associative array
//            var ['index'] = { v1, v2, v3, ... };
//            var ['index'] = { v1, v2, v3, ... };
//-------------------------------------------------------

// Have to create a new typedef and use that 
typedef int int_da [];

module tb;
  int_da fruits [string];
  
  initial begin
    fruits ["apple"] = new [2];
    fruits ["apple"] = '{ 4, 5};
    
    foreach (fruits[str1]) 
      foreach (fruits[str1][i])
        $display ("fruits[%s][%0d] = %0d", str1, i, fruits[str1][i]);
    
  end
endmodule

/* Simulation Log:
------------------
ncsim> run
fruits[apple][0] = 4
fruits[apple][1] = 5
ncsim: *W,RNQUIE: Simulation is complete.

*/
