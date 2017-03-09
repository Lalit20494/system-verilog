// Author   : Admin (www.chipverify.com)
// Purpose  : Example of how to initialize and use an associative
//            array. We'll create three different arrays, traverse
//            and print its contents
//----------------------------------------------------------------


module tb;
  int     array1  [string];     // integer array with string index
  int     array2  [int];        // integer array with integer index
  string  array3  [string];     // string array with string index
  
  initial begin
    array1 = '{ "joey" : 1,
               "ross" : 2,
               "rachel" : 10,
               "monica" : 25};
               
    array2 = '{  1 : 22,
                 6 : 35 };
     
    array3 ["Apples"] = "Oranges";
    array3 ["Pears"] = "44";
    
    foreach (array1[name])
      $display ("array1[%s] = %0d", name, array1[name]);
      
    foreach (array2[i])
      $display ("array2[%0d] = %0d", i, array2[i]);
      
    foreach (array3[str1])
      $display ("array3[%s] = %s", str1, array3[str1]);
     
  end
endmodule

/* Simulation Log:
-------------------
run -all;
# KERNEL: array1[joey] = 1
# KERNEL: array1[monica] = 25
# KERNEL: array1[rachel] = 10
# KERNEL: array1[ross] = 2
# KERNEL: array2[1] = 22
# KERNEL: array2[6] = 35
# KERNEL: array3[Apples] = Oranges
# KERNEL: array3[Pears] = 44
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
