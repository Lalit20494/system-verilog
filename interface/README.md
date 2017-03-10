<p>Interfaces are new constructs in System Verilog that capture port signals into a single entity that can be passed around the testbench so that any component that requires to access the port signals can do so by using the interface handle. </p>

<pre>
                       .-----.       
                       |  I  |       .-------------.
   .-----------.       |  N  |       |             |
   |           |       |  T  |       |             |
   |   Driver  |       |  E  |       |             |
   |    in     |------>|  R  |------>|     DUT     |     
   | TestBench |       |  F  |       |             |
   |           |<------|  A  |<------|             |
   |           |       |  C  |       |             |
   '-----------'       |  E  |       '-------------'
                       '-----'
</pre>


<table>
  <tr>
    <th>Tag</th>
    <th>Description</th>
  </tr>
  
  <tr>
    <td>wo_interface</td>
    <td>Traditional method of connecting DUT with TestBench</td>
  </tr>
  
  <tr>
    <td>w_interface</td>
    <td>Modern method of connecting DUT with TestBench using an interface</td>
  </tr>
  
  <tr>
    <td>clocking-block</td>
    <td>Declare a clocking block with default input-output skews</td>
  </tr>
    
</table>
