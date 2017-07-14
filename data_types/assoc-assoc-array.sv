// Author   : Aravind Prakash
// Purpose  : Example of an associative array for every index in another associative array

typedef int aa [int];

module tb;
  aa 	db [int];
  int 	reg_db [int];
  
  initial begin
    for (int i = 0; i < 4; i++) begin
      reg_db [i] = $urandom_range (0, 20000);
    end
    
    db [0] = reg_db;
    
    for (int i = 0; i < 4; i++) begin
      reg_db [i] = $urandom_range (0, 20000);
    end
    
    db [1] = reg_db;
    
    foreach (db[i])
      foreach (db[i][j])
        $display ("db[SA=%0d] = RA=%0d:RD:%0d", i, j, db[i][j]);
  end
endmodule

/* Output:
----------

ncsim> run
db[SA=0] = RA=0:RD:3908
db[SA=0] = RA=1:RD:12345
db[SA=0] = RA=2:RD:16188
db[SA=0] = RA=3:RD:4815
db[SA=1] = RA=0:RD:1118
db[SA=1] = RA=1:RD:15066
db[SA=1] = RA=2:RD:9066
db[SA=1] = RA=3:RD:16241
ncsim: *W,RNQUIE: Simulation is complete.
*/
