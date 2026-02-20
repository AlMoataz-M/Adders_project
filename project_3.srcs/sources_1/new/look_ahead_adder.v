`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2026 01:44:49 PM
// Design Name: 
// Module Name: look_ahead_adder
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


module look_ahead_adder
#(parameter bits = 4) (
    input [bits-1:0] A, B,
    input cin,
    output cout,
    output [bits-1:0] sum
    );
    wire [bits-1:0] p,g;
    wire [bits:0] c;
    generate 
        genvar i;
        for(i=0; i<bits; i=i+1)
        begin
            HA unit(
                .a(A[i]),
                .b(B[i]),
                .cout(g[i]),
                .sum(p[i])
            );
            end
    endgenerate
    carry_look_ahead_generator #(bits) block(
        .p(p),
        .g(g),
        .cin(cin),
        .cout(c)
    );
    generate 
        genvar j;
        for(j=0; j<bits; j=j+1)
        begin
            assign sum[j] = p[j] ^c[j];
        end
    endgenerate
    assign cout = c[bits];
    
endmodule
