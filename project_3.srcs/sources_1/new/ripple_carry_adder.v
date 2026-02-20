`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2026 02:29:45 PM
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder
#(parameter n=6)
(
    input [n-1:0] x, y,
    input c_in,
    output [n-1:0] sum,
    output cout
    );
    
    wire [n:0] c;
    assign {c[n], c[0]} = {cout, c_in};
    
    
    generate 
        genvar i;
        for(i=0; i<n; i=i+1)
        begin: stage
            adders FA(
            .a(x[i]),
            .b(y[i]),
            .cin(c[i]),
            .cout(c[i+1]),
            .sum(sum[i])
            );
        end
    endgenerate 
    
    
endmodule
