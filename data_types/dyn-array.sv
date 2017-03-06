// Author   :   Admin (www.chipverify.com)
// Purpose  :   Example of dynamic array
//------------------------------------------

module tb;
	int array [];
  	int id [];
  
  	initial begin
		// Create an array of size 5
    		array = new [5];
		
		// Initialize the dynamic array
      		array = '{1, 2, 3, 4, 5};
      
		// Copy array into another dynamic array id
      		id = array;
		
		// Use custom function to iterate and display array contents
		display (id);
		
		// Increase size of id by one
      		id = new [id.size() + 1] (id);
		
		// Set last element as 6
      		id [id.size() - 1] = 6;
		
		// Use custom function to iterate and display array contents
      		display (id);
      
		$display ("Size of array = %0d", array.size());
		
		// Delete all elements of the array and diplay size
      		array.delete();
      		$display ("Size of array = %0d", array.size());  
    	end
  
  	function display (int arr []);
    		$display ("----------------");
		
		// Iterate through each element and display
    		foreach (arr [i])
      			$display ("arr[%0d] = %0d", i, arr[i]);
  	endfunction
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: ----------------
# KERNEL: arr[0] = 1
# KERNEL: arr[1] = 2
# KERNEL: arr[2] = 3
# KERNEL: arr[3] = 4
# KERNEL: arr[4] = 5
# KERNEL: ----------------
# KERNEL: arr[0] = 1
# KERNEL: arr[1] = 2
# KERNEL: arr[2] = 3
# KERNEL: arr[3] = 4
# KERNEL: arr[4] = 5
# KERNEL: arr[5] = 6
# KERNEL: Size of array = 5
# KERNEL: Size of array = 0
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
