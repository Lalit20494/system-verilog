//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Simple examples on using constraints
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Create a class to hold data variables 
//-----------------------------------------------------------------------------

class myPacket;
   typedef enum bit[1:0] {RED, BLUE, YELLOW, GREEN} e_color;

         e_color     arr_color [] = '{YELLOW, YELLOW, GREEN, BLUE};
   rand  e_color     fav_color;
   rand  bit [2:0]   a, b, c;
   rand  int         price;
   rand  bit [7:0]   retail;
   rand  bit [7:0]   sales_tax;
   
         int         range_lo = 3;
         int         range_hi = 7;
   rand  bit [2:0]   data1, data2;

//-----------------------------------------------------------------
//                            CONSTRAINTS
//-----------------------------------------------------------------
   constraint c_fav_color  { fav_color inside {arr_color}; }

`ifdef CHECK
   constraint c_abc        {  0 < a < b < c; }
`else 
   constraint c_abc        {  0 < a;
                              a < b;
                              b < c; }
`endif
   
   constraint c_price      {  retail == 24;  
                              sales_tax == 8; }
   constraint c_totprice   {  price == retail + (2*sales_tax); }

   constraint c_range      {  data1 inside {[range_lo:range_hi]}; }
   constraint c_more       {  !(data2 inside {[range_lo:range_hi]}); } 
	
//-----------------------------------------------------------------
//                            display ()
//-----------------------------------------------------------------
   virtual function void display ();
      $display ("-------------- myData ----------------");
      $display (" fav_color         : %s", fav_color.name);
      $display (" a,b,c             : %0h, %0h, %0h", a, b, c);
      $display (" price             : %0h", price);
      $display (" retail            : %0h", retail);
      $display (" sales_tax         : %0h", sales_tax);
      $display (" data1             : %0h", data1);
      $display (" data2             : %0h", data2);
      $display ("--------------------------------------");
   endfunction
endclass

//-----------------------------------------------------------------------------
// In the top module, create an instance, and randomize the object in a loop 
//-----------------------------------------------------------------------------

module tb_top;
	myPacket pkt;
    bit [3:0]    myVar;
	
	initial begin
		pkt = new ();
		for (int i = 0; i < 5; i++) begin
			void'(pkt.randomize ());
			pkt.display ();
		end
	end
endmodule

//-----------------------------------------------------------------------------
