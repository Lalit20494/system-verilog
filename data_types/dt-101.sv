//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :    
//-----------------------------------------------------------------------------

module dt_201;
   
   // Declare some variables to illustrate different datatypes
   bit         flag_bit;
   bit [7:0]   data_bit;
   byte        data_byte;
  
   reg         flag_reg;
   reg [7:0]   data_reg;

   logic       flag_logic;
   logic [7:0] data_logic;

   integer     data_integer;

   shortint    data_shint;
   int         data_int;
   longint     data_longint;

   real        data_real;

   time        data_time;

   initial begin

      // Initial values
      $display ("--------------- Before assigning values -----------------");
      display (1);

      // Let's assign same value to all variables and see what it actually gets
      $display ("\n--------------- Assign 'hx -----------------");
      assign_value ('hxxx);
      display ();

      $display ("\n--------------- Assign 32'hz -----------------");
      assign_value (32'hzzzz_zzzz);
      display ();

      $display ("\n--------------- Assign 8'ha5 -----------------");
      assign_value (8'ha5);
      display (); 
   end

   function void assign_value (reg [7:0] val);
      flag_bit    = val;
      flag_reg    = val;
      flag_logic  = val;

      data_bit    = val;
      data_byte   = val;
      data_reg    = val;
      data_logic  = val;
      data_integer = val;
      data_real   = val;
      data_time   = val;
      data_longint= val;
      data_int    = val;
      data_shint  = val;
   endfunction

   function void display (bit init = 0);
      if (init) begin
         $display ("[%0t] flag_bit     : %0h    size : %0d", $time, flag_bit,     $bits (flag_bit));
         $display ("[%0t] flag_reg     : %0h    size : %0d", $time, flag_reg,     $bits (flag_reg));
         $display ("[%0t] flag_logic   : %0h    size : %0d", $time, flag_logic,   $bits (flag_logic));
   
         $display ("[%0t] data_bit     : %0h    size : %0d", $time, data_bit,     $bits (data_bit)); 
         $display ("[%0t] data_byte    : %0h    size : %0d", $time, data_byte,    $bits (data_byte)); 
         $display ("[%0t] data_reg     : %0h    size : %0d", $time, data_reg,     $bits (data_reg)); 
         $display ("[%0t] data_logic   : %0h    size : %0d", $time, data_logic,   $bits (data_logic)); 
         $display ("[%0t] data_integer : %0h    size : %0d", $time, data_integer, $bits (data_integer)); 
         $display ("[%0t] data_shint   : %0h    size : %0d", $time, data_shint,   $bits (data_shint)); 
         $display ("[%0t] data_int     : %0h    size : %0d", $time, data_int,     $bits (data_int)); 
         $display ("[%0t] data_longint : %0h    size : %0d", $time, data_longint, $bits (data_longint)); 
         $display ("[%0t] data_real    : %0.1f", $time, data_real); 
         $display ("[%0t] data_time    : %0h    size : %0d", $time, data_time,    $bits(data_time)); 
      end else begin
         $display ("[%0t] flag_bit     : %h    ", $time, flag_bit);
         $display ("[%0t] flag_reg     : %h    ", $time, flag_reg);
         $display ("[%0t] flag_logic   : %h    ", $time, flag_logic);
                                                                      
         $display ("[%0t] data_bit     : %h    ", $time, data_bit);
         $display ("[%0t] data_byte    : %h    ", $time, data_byte);
         $display ("[%0t] data_reg     : %h    ", $time, data_reg);
         $display ("[%0t] data_logic   : %h    ", $time, data_logic);
         $display ("[%0t] data_integer : %h    ", $time, data_integer);
         $display ("[%0t] data_shint   : %h    ", $time, data_shint);
         $display ("[%0t] data_int     : %h    ", $time, data_int);
         $display ("[%0t] data_longint : %h    ", $time, data_longint);
         $display ("[%0t] data_real    : %.1f  ", $time, data_real); 
         $display ("[%0t] data_time    : %h    ", $time, data_time);
      end
   endfunction

endmodule

//-----------------------------------------------------------------------------
