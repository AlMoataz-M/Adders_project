module look_ahead_adder_tb;

    // Parameters
    parameter bits = 4;

    // Inputs
    reg [bits-1:0] A;
    reg [bits-1:0] B;
    reg cin;

    // Outputs
    wire cout;
    wire [bits-1:0] sum;

    // Instantiate the Unit Under Test (UUT)
    look_ahead_adder #(bits) uut (
        .A(A), 
        .B(B), 
        .cin(cin), 
        .cout(cout), 
        .sum(sum)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        cin = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        A = 4'b1101; B = 4'b1011; cin = 0; // 13 + 11 = 24
        #10;
        
        A = 4'b0110; B = 4'b0011; cin = 1; // 6 + 3 + 1 = 10
        #10;
        
        A = 4'b1111; B = 4'b0001; cin = 0; // 15 + 1 = 16
        #10;
        
        A = 4'b0000; B = 4'b0000; cin = 0; // 0 + 0 = 0
        #10;
        
        A = 4'b1001; B = 4'b0110; cin = 1; // 9 + 6 + 1 = 16
        #10;

        $stop;
    end

endmodule