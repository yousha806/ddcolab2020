// Write code for modules you need here



module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;
   xor3 _i0 (i0, i1, cin, sum);
   and2 _i1 (i0, i1, t0);
   and2 _i2 (i1, cin, t1);
   and2 _i3 (cin, i0, t2);
   or3 _i4 (t0, t1, t2, cout);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
  wire t;
  fa _i0 (i0, t, cin, sumdiff, cout);
  xor2 _i1 (i1, addsub, t);
endmodule


module pcslice0 (input wire clk,reset,cin,load,inc,sub,offset, output wire cout,pc);

  wire t,in;
  or2 o1 (offset,inc,t);
  addsub a1 (sub, pc,t,cin,in,cout);
  dfrl d1 (clk,reset,load,in,pc);
endmodule

module pcslice1 (input wire clk,reset,cin,load,inc,sub,offset, output wire cout,pc);
  wire inc1;
  invert i1 (inc,inc1);
  and2 a1 (offset,inc1,t);
  addsub a2 (sub,pc,t,cin,in,cout);
  dfrl d2 (clk,reset,load,in,pc);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);

// Declare wires here
  input wire load;
  input wire [15:0] c;

// Instantiate modules here

  or3 o3(inc,add,sub,load);
  pcslice0 o0(clk,reset,sub,load,inc,sub,offset[0],c[0],pc[0]);

  pcslice1 p1 (clk,reset,c[0],load,inc,sub,offset[1],c[1],pc[1]);
  pcslice1 p2 (clk,reset,c[1],load,inc,sub,offset[2],c[2],pc[2]);
  pcslice1 p3 (clk,reset,c[2],load,inc,sub,offset[3],c[3],pc[3]);
  pcslice1 p4 (clk,reset,c[3],load,inc,sub,offset[4],c[4],pc[4]);
  pcslice1 p5 (clk,reset,c[4],load,inc,sub,offset[5],c[5],pc[5]);
  pcslice1 p6 (clk,reset,c[5],load,inc,sub,offset[6],c[6],pc[6]);
  pcslice1 p7 (clk,reset,c[6],load,inc,sub,offset[7],c[7],pc[7]);
  pcslice1 p8 (clk,reset,c[7],load,inc,sub,offset[8],c[8],pc[8]);
  pcslice1 p9 (clk,reset,c[8],load,inc,sub,offset[9],c[9],pc[9]);
  pcslice1 p10 (clk,reset,c[9],load,inc,sub,offset[10],c[10],pc[10]);
  pcslice1 p11 (clk,reset,c[10],load,inc,sub,offset[11],c[11],pc[11]);
  pcslice1 p12 (clk,reset,c[11],load,inc,sub,offset[12],c[12],pc[12]);
  pcslice1 p13 (clk,reset,c[12],load,inc,sub,offset[13],c[13],pc[13]); 
  pcslice1 p14 (clk,reset,c[13],load,inc,sub,offset[14],c[14],pc[14]);
  pcslice1 p15 (clk,reset,c[14],load,inc,sub,offset[15],c[15],pc[15]);

endmodule
