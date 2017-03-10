// Author         :  Admin (www.chipverify.com)
// Purpose        :  To show modern style of connecting DUT with TB
//                   with an interface block
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Interface Declaration and definition for the design above
//-----------------------------------------------------------------------------

interface dut_if (input clk);

   logic          rstn;
   logic [7:0]    wdata;
   logic [7:0]    rdata;
   logic [7:0]    addr;
   logic          wr;
   logic          en;

endinterface


//-----------------------------------------------------------------------------
// The same DUT from above, but WITH an interface. Note that signals are 
// accessed via the interface handle 
//-----------------------------------------------------------------------------

module dut ( dut_if _if);
   always @ (posedge _if.clk)
      if (_if.rstn)
         if (_if.wr & _if.en) 
            $display ("[%0t] Write data = 0x%0h to addr[0x%0h]", $time, _if.wdata, _if.addr);

endmodule



//-----------------------------------------------------------------------------
// Top-Level module where both the interface and the DUT is instantiated
//-----------------------------------------------------------------------------

module tb_top;

   // Clock Generation Logic
   bit clk;
   always #10 clk = ~clk;

   // Interface instantiation - Note: clk is passed to the interface
   dut_if      _if (.clk (clk));

   // Connection with DUT using an interface
   dut         dsn0  (._if (_if));

   initial begin
      assert_reset ();

      repeat (4) @ (posedge _if.clk) begin
         write (22, 8'h11);
      end
      $finish;
   end

   task write (input bit [7:0] laddr, bit [7:0] ldata);
      _if.en      <= 1;
      _if.wr      <= 1;
      _if.addr    <= laddr;
      _if.wdata   <= ldata;
   endtask

   task assert_reset ();
      $display ("[%0t] Assert reset ...", $time);
      #25   _if.rstn <= 1;
      $display ("[%0t] De-assert reset ...", $time);
   endtask

endmodule



/* Simulation Log:
------------------
ncsim> run
[0] Assert reset ...
[25] De-assert reset ...
[50] Write data = 0x11 to addr[0x16]
[70] Write data = 0x11 to addr[0x16]
Simulation complete via $finish(1) at time 90 NS + 1

*/
