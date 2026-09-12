`include "./command.v"

module ALU_8_BIT(
    input [7:0] operand_1,
    input [7:0] operand_2,
    input [3:0] command,
    output reg [15:0] calc_out
);

    reg [15:0] AU_out;
    reg [15:0] LU_out;

    always @(*)
    begin
        case(command[2:0])
            3'b000: AU_out = operand_1 + operand_2;
            3'b001: AU_out = operand_1 - operand_2;
            3'b010: AU_out = operand_1 * operand_2;
            3'b011: AU_out = (operand_2 != 0) ? (operand_1 / operand_2) : 16'b0;
            3'b100: AU_out = operand_1 << 1;
            3'b101: AU_out = operand_1 >> 1;
            3'b110: AU_out = operand_1 + 1;
            3'b111: AU_out = operand_1 - 1;
            default: AU_out = 16'd0;
        endcase
    end

    always @(*)
    begin
        case(command[2:0])
            3'b000: LU_out = operand_1 & operand_2;
            3'b001: LU_out = ~(operand_1 & operand_2);
            3'b010: LU_out = operand_1 | operand_2;
            3'b011: LU_out = ~(operand_1 | operand_2);
            3'b100: LU_out = operand_1 ^ operand_2;
            3'b101: LU_out = ~(operand_1 ^ operand_2);
            3'b110: LU_out = ~operand_1;
            3'b111: LU_out = operand_1;
            default: LU_out = 16'd0;
        endcase
    end

    always @(*)
    begin
        case(command[3])
            1'b0: calc_out = AU_out;
            1'b1: calc_out = LU_out;
        endcase
    end

endmodule
