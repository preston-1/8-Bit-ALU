module eightBitALU (inputA, inputB, code, result, swap);
    input [7:0]inputA, inputB;
    input [2:0] code;
    output [7:0] result;
    output swap;
    reg [7:0] result;
    reg swap;
    always @ (inputA, inputB, code) begin
        case(code)
            3'b000 : begin
                        result <= inputA + inputB; 
                        swap <= 0;
                    end
            3'b001 : begin
                if (inputA >= inputB) begin
                    result <= inputA - inputB;
                    swap <= 0;
                end
                else begin
                    swap <= 1;
                    result <= inputB - inputA;
                end
            end
            3'b010 : begin
                result <= inputA * inputB;
                swap <= 0;
            end
            3'b011 : begin
                if (inputA >= inputB) begin
                    result <= inputA / inputB;
                    swap <= 0;
                end
                else begin
                    swap <= 1;
                    result <= inputB / inputA;
                end
            end 
        endcase   
    end
    
endmodule