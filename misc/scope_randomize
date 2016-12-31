// Example of scope randomization function std::randomize()

module tb;
  bit [3:0]  mode;
  bit [3:0]  hist;
  bit       auto;
 
  initial begin
    std::randomize (mode);
    $display ("mode=0x%0h", mode);
 
    for (int i=0; i < 5; i++) begin
      randomize (mode, hist) with { mode dist {[0:3]:/40, [4:15]:/60};
                                    if (mode < 3) {
                                       hist inside {[3:9]}; 
                                    } else {
                                       hist inside {[13:15]};
                                    }};
      $display ("mode=0x%0h hist=0x%0h", mode, hist);
    end
  end
endmodule




/* Simulation Log
------------------
ncsim> run
mode=0x4
mode=0xc hist=0xe
mode=0xb hist=0xe
mode=0x1 hist=0x9
mode=0x1 hist=0x3
mode=0x2 hist=0x4
ncsim: *W,RNQUIE: Simulation is complete
*/
