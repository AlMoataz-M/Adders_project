`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2026 03:58:59 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor
#(parameter width = 5) (
    // when M = 0, out = in2 + in1, M = 1, out = in2-in1
    input M, 
    input [width-1:0] in1 , in2,
    output [width-1:0] out,
    output cout
    );
    wire [width-1:0] x;
    generate 
        genvar i;
        for(i=0; i<width; i=i+1)
        begin: stage
            assign x[i] = in1[i] ^ M;
        end
    endgenerate
    
    look_ahead_adder #(width) adder  
    ( 
        .A(in2), .B(x), .cin(M), .cout(cout), .sum(out)
    );
    
endmodule
