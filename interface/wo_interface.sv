// Author         :  Admin (www.chipverify.com)
// Purpose        :  To show conventional style of connecting DUT with TB
//                   without the use of any interface block
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// A simple DUT that will display message when module is enabled and write = 1
// This is an example of a DUT that does not use an interface.
//-----------------------------------------------------------------------------
module dut (   
               input          clk,                 // Clock at some freq
               input          rstn,                // Active Low  Sync Reset
               input          wr,                  // Active High Write
               input          en,                  // Module Enable
               input  [7:0]   wdata,               // Write Data
               input  [7:0]   addr,                // Address

               output [7:0]   rdata                // Read Data
            );

   always @ (posedge clk)
      if (rstn)
         if (wr & en) 
            $display ("[%0t] Write data = 0x%0h to addr[0x%0h]", $time, wdata, addr);

endmodule 


//-----------------------------------------------------------------------------
// Top-Level module where both the interface and the DUT is instantiated
//-----------------------------------------------------------------------------

module tb_top;

   bit       rstn;
   bit       wr;
   bit       en;
   bit [7:0] wdata;
   bit [7:0] addr;
   bit [7:0] rdata;

   // Clock Generation Logic
   bit clk;
   always #10 clk = ~clk;

   // Connection without any interface - normal verilog method
   dut         dsn1  (  .clk     (clk),
                        .rstn    (rsnt),
                        .wr      (wr),
                        .en      (en),
                        .wdata   (wdata),
                        .addr    (addr),
                        .rdata   (rdata));

   initial begin
      assert_reset ();

      repeat (4) @ (posedge clk) begin
         write (8'hfe, 8'h44);
      end
      
      $finish;
   end

   task write (input bit [7:0] laddr, bit [7:0] ldata);
      en <= 1;
      wr <= 1;
      addr <= laddr;
      wdata <= ldata;
   endtask

   task assert_reset ();
      $display ("[%0t] Assert reset ...", $time);
      #25   rstn <= 1;
      $display ("[%0t] De-assert reset ...", $time);
   endtask
endmodule



/* Simulation Log:
------------------
ncsim> run
[0] Assert reset ...
[25] De-assert reset ...
Simulation complete via $finish(1) at time 90 NS + 0

*/
