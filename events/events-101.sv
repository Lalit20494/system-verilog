
// Events
/*
module tb_top;
	event eventA;
	bit   resetn;
	
	initial begin
		resetn = 0;
		#20 resetn = 1;
        fork 
            waitForTrigger (eventA);
            #5 ->eventA;
        join_none
		#10 resetn = 0;
	end
	
	task waitForTrigger (event eventA);
        $display ("[%0t] Waiting for EventA to be triggered", $time);
		wait (eventA.triggered);
		$display ("[%0t] EventA has triggered", $time);
	endtask
endmodule
*/

// Semaphores
/*
module tb_top;
   semaphore key;

   initial begin 
      key = new (1);
      fork
         personA ();
         personB ();
         #25 personA ();
      join_none
   end

   task getRoom (bit [1:0] id);
      $display ("[%0t] Trying to get a room for id[%0d] ...", $time, id);
      key.get (1);
      $display ("[%0t] Room Key retrieved for id[%0d]", $time, id);
   endtask

   task putRoom (bit [1:0] id);
      $display ("[%0t] Leaving room id[%0d] ...", $time, id);
      key.put (1);
      $display ("[%0t] Room Key put back id[%0d]", $time, id);
   endtask

   task personA ();
      getRoom (1);
      #20 putRoom (1);
   endtask

   task personB ();
      #5  getRoom (2);
      #10 putRoom (2);
   endtask
endmodule
*/

// Mailbox
// Data packet in this environment
class transaction;
   rand bit [7:0] data;

   function display ();
      $display ("[%0t] Data = 0x%0h", $time, data);
   endfunction
endclass

// Generator class - Generate a transaction object and put into mailbox
class generator;
   mailbox mbx;

   function new (mailbox mbx);
      this.mbx = mbx;
   endfunction

   task genData ();
      transaction trns = new ();
      trns.randomize ();
      trns.display ();
      $display ("[%0t] [Generator] Going to put data packet into mailbox", $time);
      mbx.put (trns);
      $display ("[%0t] [Generator] Data put into mailbox", $time);
   endtask
endclass

// Driver class - Get the transaction object from Generator
class driver;
   mailbox mbx;
   
   function new (mailbox mbx);
      this.mbx = mbx;
   endfunction

   task drvData ();
      transaction drvTrns = new ();
      $display ("[%0t] [Driver] Waiting for available data", $time);
      mbx.get (drvTrns);
      $display ("[%0t] [Driver] Data received from Mailbox", $time);
      drvTrns.display ();
   endtask
endclass

// Top Level environment that will connect Gen and Drv with a mailbox
module tb_top;
   mailbox   mbx;
   generator Gen;
   driver    Drv;

   initial begin
      mbx = new ();
      Gen = new (mbx);
      Drv = new (mbx);

      fork 
         #10 Gen.genData ();
         Drv.drvData ();
      join_none
   end
endmodule
