`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2026 02:55:06 AM
// Design Name: 
// Module Name: carry_look_ahead_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module carry_look_ahead_tb(

    );
    
    
parameter nbits = 4;
    reg [nbits-1:0] A, B;
    reg cin;
    wire [nbits:0] cout;
    carry_look_ahead_adder  #(nbits) cla(
        .A(A),
        .B(B),
        .cin(cin),
        .cout(cout)
    );
    
    initial
    begin
        #100;
        $stop;
    end
    initial begin
        A = 4'b1101; B = 4'b1011; cin = 1'b0;
        #10;
        A = 4'b1111; B = 4'b1111; cin = 1'b1;
        #10;
        A = 4'b0000; B = 4'b0000; cin = 1'b0;
        #10;
        A = 4'b1001; B = 4'b0110; cin = 1'b1;
        #10;
        A = 4'b1010; B = 4'b0101; cin = 1'b1;
        #10;
        A = 4'b1000; B = 4'b1001; cin = 1'b1;
        #10;        
        A = 4'b1000; B = 4'b1001; cin = 1'b0;
        #10;
        A = 4'b1100; B=4'b0111; cin = 1'b1;
        #10;
    
        $stop;
    end
    
    endmodule
     
