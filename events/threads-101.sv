//module tb_top;
//   initial begin
//      fork
//         #5 $display ("T=%0t \tStarted at time 5ns", $time);
//         begin
//            #2 $display ("T=%0t \tStarted at time 2ns", $time);
//            #4 $display ("T=%0t \tStarted at time 6ns", $time);
//         end
//         #10 $display ("T=%0t \tStarted at time 10ns", $time);
//      join
//         $display ("T=%0t \tAfter Fork-Join", $time);
//   end
//endmodule

module tb_top;

   task spawn2threads ();
      fork : SP2THRDS
         #100 $display ("T=%0t [spawn2threads] Show #40 $display statement", $time);
         begin : SP2THRD_BEGIN
            #20 $display ("T=%0t [spawn2threads] Show #20 $display statement", $time);
            #50 $display ("T=%0t [spawn2threads] Show #50 $display statement", $time);
         end
         #60 $display ("T=%0t [spawn2threads] TIMEOUT", $time);
      join_any
      $display ("T=%0t Disabling fork", $time);
      disable fork;
   endtask

   initial begin
      spawn2threads ();
   end
endmodule
