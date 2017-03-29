// Author   :   Admin (www.chipverify.com)
// Purpose  :   Simple example of clock frequency measurement
//-----------------------------------------------------------

`timescale 1ns/1ns

module tb;
  bit clk;
  bit [15:0] delay;
  
  always #(delay) clk = ~clk;
  
  initial begin
  	delay = 10;
    #100 delay = 20;
    #100 delay = 30;
    #100 delay = 40;
  end
  
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars;
  end
  
  _if 	if0 (clk);
 
  initial begin
	#500 $finish;
  end
endmodule

interface _if (input bit clk);
  real freq_list [$];
	initial begin
      fork
        clk_monitor ();
      join
    end
  
  task clk_monitor ();
    real start;
    real stop;
    real freq;
    
    real freq_prev = 0;
    
    forever begin
      @ (posedge clk);
      start = $time;
      @ (posedge clk);
      stop = $time;
      
      freq = 1.0/(stop - start);
      $display ("Freq = %0.4f GHz", freq);
      
      if (freq_prev != freq)
        freq_list.push_back (freq);
      
      freq_prev = freq;
    end
  endtask
  
  final begin
    foreach (freq_list[i]) begin
      $display ("Freq[%0d] = %0.4f Ghz", i, freq_list[i]);
    end
  end
endinterface


/* Simulation Log:
------------------
ncsim> run
Freq = 0.0500 GHz
Freq = 0.0500 GHz
Freq = 0.0500 GHz
Freq = 0.0250 GHz
Freq = 0.0167 GHz
Freq = 0.0125 GHz
Freq[0] = 0.0500 Ghz
Freq[1] = 0.0250 Ghz
Freq[2] = 0.0167 Ghz
Freq[3] = 0.0125 Ghz
Simulation complete via $finish(1) at time 500 NS + 0

*/
