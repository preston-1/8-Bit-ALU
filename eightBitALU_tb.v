`timescale 1ns / 1ns
`include "eightBitALU.v"

module eightBitALU_tb;
    reg[7:0] inputA, inputB;
    reg [2:0] code;
    integer i;
    wire [7:0] out;
    wire swap;
    eightBitALU UTT(inputA, inputB, code, out,swap);

    initial begin
        $dumpfile("eightBitALU_tb.vcd");
        $dumpvars(0, eightBitALU_tb);
        /*
            Codes for simple (positive) ALU
            0 = A + B
            1 = A - B
            2 = A * B
            3 = A / B
        */
        
        for (i = 0; i < 4; i = i + 1) begin
            case (i)
                0 : begin
                    inputA = $urandom;
                    inputB = $urandom;
                    code = 3'b000;
                    #20;
                    $display("output from A-> %b + B-> %b = %b",inputA, inputB, out);
                end
                1 : begin
                    inputA = $urandom;
                    inputB = $urandom;
                    code = 3'b001;
                    #20;
                    if(swap)begin
                        $display("output from B-> %b - A-> %b = %b",inputB, inputA, out);

                    end
                    else begin
                        $display("output from A-> %b - B-> %b = %b",inputA, inputB, out);
                    end
                end
                2: begin
                    inputA = $urandom;
                    inputB = $urandom;
                    code = 3'b010;
                    #20;
                    $display("output from A-> %b * B-> %b = %b",inputA, inputB, out);
                end
                3: begin
                    inputA = $urandom;
                    inputB = $urandom;
                    code = 3'b011;
                    #20;
                    if (swap) begin
                        $display("output from B-> %b / A-> %b = %b",inputB, inputA, out);

                    end
                    else begin
                        $display("output from A-> %b / B-> %b = %b",inputA, inputB, out);
                    end
                end
            endcase
        end
        

        $display("Finished...");

    end

endmodule