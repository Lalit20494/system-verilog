//-----------------------------------------------------------------------------
// (c) ChipVerify
//-----------------------------------------------------------------------------
// Author   :  Admin 
// E-mail   :  info@chipverify.com
// Purpose  :  To demonstrate the various control flow constructs in System 
//             Verilog.
//             1. do_while 
//             2. foreach
//             3. if else if
//             4. case
//             5. final -  Report phase after simulation - not control flow 
//                         element
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//                               DO_WHILE
//-----------------------------------------------------------------------------

`ifdef DO_WHILE
module tb_top;
bit clk;

always #10 clk <= ~clk;
initial begin
	bit [3:0] counter;
	do begin 
		@ (posedge clk);
		counter ++;
	end while (counter < 1);
end
endmodule
`endif

//-----------------------------------------------------------------------------
//                               FOREACH
//-----------------------------------------------------------------------------

`ifdef FOREACH
module tb_top;

   bit [7:0] array [8];

   initial begin
      foreach (array [index]) begin
         array[index] = index;
      end
      foreach (array [index]) begin
         $display ("array[%0d] = 0x%0d", index, array[index]);
      end
   end
endmodule
`endif

//-----------------------------------------------------------------------------
//                               IF_ELSE
//-----------------------------------------------------------------------------

`ifdef IF_ELSE
module tb_top;
   initial begin
   	bit [7:0] counter;
   	
   	for (counter = 2; counter < 10; counter ++) begin
   		if (counter == 4) begin
   			$display ("Counter reached 4 ! Be Careful");
   		end else if (counter == 9) begin
   			$display ("Stop !!!");
   		end else 
   			$display ("All's well for %0d, continue", counter);

         // Check another condition
         if (counter == 6) 
            $display ("yaay ! Counter %0d is my lucky one !", counter);
   	end
   end
endmodule
`endif

//-----------------------------------------------------------------------------
//                               CASE
//-----------------------------------------------------------------------------

`ifdef CASE
module tb_top;
   bit [3:0] counter;

   initial begin
      while (counter < 6) begin
         case (counter) 
            1,2,3 : begin
                        $display ("Counter %0d within limits", counter);
                    end
            5     : $display ("Counter %0d full", counter);
            default : $display ("Counter %0d value ignored", counter);
         endcase
         counter++;
      end
   end
endmodule
`endif

//-----------------------------------------------------------------------------
//                               FINAL
//-----------------------------------------------------------------------------

`ifdef FINAL
module tb_top;
   bit [3:0] counter;
   bit [3:0] pass;
   bit [3:0] fail;

   initial begin
      for (counter = 0; counter < 13; counter ++) begin
         #1;
         if (counter % 2) 
            pass++;
         else 
            fail++;
      end
   end

   final begin
      $display ("----------------------------------------");
      $display ("          REPORT @ %0t ns            ", $time);
      $display ("----------------------------------------");
      $display ("       Pass  : %0d", pass);
      $display ("       Fail  : %0d", fail);
   end
endmodule
`endif

