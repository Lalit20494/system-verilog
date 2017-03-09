// Author   : Admin (www.chipverify.com)
// Purpose  : Create a queue of dynamic arrays
//---------------------------------------------

typedef string str_da [];

module tb;
  str_da list [$];
 
  initial begin
    str_da marvel = '{"Spiderman", "Hulk", "Captain America", "Iron Man"};
    str_da dcWorld = '{"Batman", "Superman" };
    
    list.push_back (marvel);
    list.push_back (dcWorld);
    
    foreach (list[i])
      foreach (list[i][j])
        $display ("list[%0d][%0d] = %s", i, j, list[i][j]);
  end
endmodule

/* Simulation Log:
------------------
ncsim> run
list[0][0] = Spiderman
list[0][1] = Hulk
list[0][2] = Captain America
list[0][3] = Iron Man
list[1][0] = Batman
list[1][1] = Superman
ncsim: *W,RNQUIE: Simulation is complete.

*/
