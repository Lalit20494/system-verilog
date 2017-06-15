module clockGen (output clk);
    parameter FREQ = 100;  // this is in MHz
    reg clk;
  	real tp;
  	real half_tp;
    initial begin
        clk = 0;
    end

  	initial begin
    	tp = 1.0/FREQ * 1000.0; 		// convert to ns
      	half_tp = tp/2.0;
      $display ("freq=%0d Mhz tp = %fns, half_tp=%fns", FREQ, tp, half_tp);
      	forever begin
          #(half_tp);
          clk = 1;
          #(half_tp);
          clk = 0;
        end
    end
    
    initial begin
      $dumpfile ("dump.vcd");
      $dumpvars;
     
      #200 $finish;
    end
endmodule
