`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2026 05:28:52 PM
// Design Name: 
// Module Name: carry_look_ahead_adder
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
//module HA(
//    input  a, b, 
//    output  sum,
//    output cout
//    );
//    assign sum = a^b;
//    assign cout = a&b;
//endmodule

module carry_look_ahead_generator
    #(parameter n=4)
    (
        input [n-1:0] A, B,
        input cin,
        output [n:0] cout
    );
   
    wire [n-1:0] p, g;
    
    generate 
        genvar i;
        for(i=0; i<n; i=i+1)
        begin: unit
            HA block(
                .a(A[i]),
                .b(B[i]),
                .sum(p[i]),
                .cout(g[i])
            );
        end
    endgenerate
    
    assign cout[0] = cin;
    generate
        genvar j;
        for(j=0; j<n; j=j+1)
        begin
            assign cout[j+1] = g[j] | (p[j]&cout[j]);
        end
    endgenerate
    
endmodule
