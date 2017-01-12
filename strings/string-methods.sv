// Author   : Admin (www.chipverify.com)
// Purpose  : To illustrate usage of System Verilog string methods
//-----------------------------------------------------------------


module tb;
   string str, tmp;

   initial begin
      str = "Hello World!";

      $display ("str.len() = %0d", str.len());

      tmp = str;
      tmp.putc (3,"d");
      $display ("str.putc(3, d) = %s", tmp);

      // Get the character at index N
      $display ("str.getc(2) = %s (%0d)", str.getc(2), str.getc(2));

      // Convert all characters to lower case
      $display ("str.tolower() = %s", str.tolower());

      // Comparison
      tmp = "Hello World!";
      $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));
      tmp = "How are you ?";
      $display ("[tmp,str are diff] str.compare(tmp) = %0d", str.compare(tmp));

      // Ignore case comparison
      tmp = "hello world!";
      $display ("[tmp is in lowercase] str.compare(tmp) = %0d", str.compare(tmp));
      tmp = "Hello World!";
      $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));

      // Extract new string from i to j
      $display ("str.substr(4,8) = %s", str.substr (4,8));

   end
endmodule

/* Simulation Log
-----------------
run -all;
# KERNEL: str.len() = 12
# KERNEL: str.putc(3, d) = Heldo World!
# KERNEL: str.getc(2) = l (108)
# KERNEL: str.tolower() = hello world!
# KERNEL: [tmp,str are same] str.compare(tmp) = 0
# KERNEL: [tmp,str are diff] str.compare(tmp) = -1
# KERNEL: [tmp is in lowercase] str.compare(tmp) = -1
# KERNEL: [tmp,str are same] str.compare(tmp) = 0
# KERNEL: str.substr(4,8) = o Wor
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
