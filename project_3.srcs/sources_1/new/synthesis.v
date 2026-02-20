`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2026 10:39:50 PM
// Design Name: 
// Module Name: synthesis
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
module HA #(parameter n=4)(
    input  a, b, 
    output  sum,
    output cout
    );
    assign sum = a^b;
    assign cout = a&b;
endmodule

module adders
#(parameter n=4) (
    input  a,b,
    input cin,
    output  sum,
    output cout
    );
    wire w0, w1, w2;
    HA adder0( .a(a) , .b(b), .sum(w0), .cout(w1));
    HA adder1( .a(w0) , .b(cin), .sum(sum), .cout(w2));
    assign cout = w1|w2;
endmodule
