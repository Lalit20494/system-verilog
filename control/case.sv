// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a case-endcase construct
//-----------------------------------------------

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

/* Simulation Log:
------------------
run -all;
# KERNEL: Counter 0 value ignored
# KERNEL: Counter 1 within limits
# KERNEL: Counter 2 within limits
# KERNEL: Counter 3 within limits
# KERNEL: Counter 4 value ignored
# KERNEL: Counter 5 full
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
