//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Simple Interface example that illustrates the benefits of
//                   using interfaces, and a comparison with the normal verilog
//                   way of connecting with a DUT instance
//-----------------------------------------------------------------------------

`ifdef WITHOUT_IF
///////////////////////////////////////////////////////////////////////////////
//                               WITHOUT INTERFACE {{{1
///////////////////////////////////////////////////////////////////////////////

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

`else 

///////////////////////////////////////////////////////////////////////////////
//                               WITH INTERFACE {{{1
///////////////////////////////////////////////////////////////////////////////


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

`endif

//-----------------------------------------------------------------------------
