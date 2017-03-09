// Author   : Admin (www.chipverify.com)
// Purpose  : Create a dynamic array of associative arrays
//            var[0] = { 'index' : 'value', ... }
//            var[n] = { 'index' : 'value', ... }
//---------------------------------------------------------

module tb;
  int fruits [] [string];
  
  initial begin
    fruits = new [2];
    fruits [0] = '{ "apple" : 1, "grape" : 2 };
    fruits [1] = '{ "melon" : 3, "cherry" : 4 };
    
    // Iterate and display
    foreach (fruits[i])
      foreach (fruits[i][fruit])
        $display ("fruits[%0d][%s] = %0d", i, fruit, fruits[i][fruit]);
    
  end
endmodule

/* Simulation Log:
------------------
ncsim> run
fruits[0][apple] = 1
fruits[0][grape] = 2
fruits[1][cherry] = 4
fruits[1][melon] = 3
ncsim: *W,RNQUIE: Simulation is complete.

*/
