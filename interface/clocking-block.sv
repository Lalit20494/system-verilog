// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a clocking block


`timescale 1ns/1ns

// Let's design a counter with sync active-low reset that either
// counts up or down based on the "dir" input pin
module d_counter ( input            clk,
                                    rstn,
                                    dir,
                   output reg [3:0] out );

   always @ (posedge clk)
      if (! rstn)
         out <= 0;
      else
         if (dir)
            out <= out + 1;
         else
            out <= out - 1;
endmodule

// Now let's create an interface for the counter design with a clocking 
// block. The idea of a clocking block is independent and it's just that 
// we can utilize the clocking block to drive and sample signals
interface counter_if (input bit clk);
   logic       rstn;
   logic       dir;
   logic [3:0] out;

   // Create a clocking block called "cb" which uses posedge "clk" as the 
   // event in which it drives/samples signals. By default inputs are 
   // sampled 1ns before posedge clk, and driven 2ns after posedge clk
   clocking cb @ (posedge clk);
      default input #1ns output #2ns;
      output rstn, dir;
      input out;      
   endclocking

   initial begin
      cb.rstn <= 0;
      cb.dir <= 0;
   end
endinterface


module tb;
   bit clk;
   bit flag;
   
   // Generate a clock for testing the design
   always #10 clk = ~clk;

   // Instantiate the interface and pass "clk" as an argument
   counter_if  _if (clk);

   // Instantiate the design and connect appropriate ports with 
   // the interface instantiated before
   d_counter   dc0   (  .clk (clk),
                        .rstn (_if.rstn),
                        .dir (_if.dir),
                        .out (_if.out)); 

   // Note that we are driving and sampling signals from 
   // the clocking block declared earlier as "cb"
   initial begin
      repeat (2) @ (_if.cb);
      _if.cb.rstn <= 1;
      repeat (3) @ (_if.cb);
      _if.cb.dir <= 1;
      repeat (10) @ (_if.cb) begin
         if (_if.cb.out == 'hE) begin
            flag <= 1;
            @(_if.cb);
            flag <= 0;
         end
      end
      $finish;
   end

   // Use this to dump waveform when using Cadence simulator
   //initial begin
   //   $shm_open ("waves.shm", 0, , 1);
   //   $shm_probe (tb, "ACTF");
   //end
endmodule
