class myTransaction;
	rand bit [2:0] 	mode;
	rand bit [1:0] 	key;

   function display ();
      $display ("[%0tns] mode = 0x%0h, key = 0x%0h", $time, mode, key);
   endfunction
	
	covergroup CovGrp;
		coverpoint mode {
			bins featureA 	= {0};
			bins featureB 	= {[1:3]};
			bins common [] 	= {4,6,7};
			bins reserve	= default;
		}
		coverpoint key;
	endgroup
endclass

module tb_top;	
	myTransaction myTrns0;
	
	initial begin
		myTrns0 = new ();
        
         #5 myTrns0.randomize ();
            myTrns0.CovGrp.sample();
            myTrns0.display ();

        #10 myTrns0.randomize ();
            myTrns0.CovGrp.sample ();
            myTrns0.display ();
	end
	
endmodule
