// Module 4-bit ripple carry adder.

module fulladdR(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);

   // Instantiate full adder modules here.
wire [2:0] c; 
  
fulladd FA1(a[0],b[0],cin,sum[0],c[0]);
fulladd FA2(a[1],b[1],c[0],sum[1],c[1]);
fulladd FA3(a[2],b[2],c[1],sum[2],c[2]);
fulladd FA4(a[3],b[3],c[2],sum[3],cout);


endmodule 


    
