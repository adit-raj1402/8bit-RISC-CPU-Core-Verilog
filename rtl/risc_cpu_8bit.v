module risc_cpu_8bit (
    input clk,
    input reset,
    output reg [7:0] pc,
    output [7:0] alu_result
);
    // Internal Storage: 8 Registers of 8-bits each
    reg [7:0] register_file [7:0];
    reg [7:0] rom [15:0]; // 16-word Instruction Memory
    
    // Instruction Fetch and Decode
    wire [7:0] instr = rom[pc[3:0]]; 
    wire [2:0] rd    = instr[7:5]; // Destination Register
    wire [2:0] rs    = instr[4:2]; // Source Register
    wire [1:0] op    = instr[1:0]; // Opcode

    // Program: Load instructions into ROM
    initial begin
        // Program Logic:
        // 1. MOV Reg[0] to Reg[1] -> 001_000_11
        // 2. ADD Reg[1] to Reg[2] -> 010_001_00
        // 3. JMP to 0             -> 000_000_10 (Op 10, Rd 000)
        rom[0] = 8'b001_000_11; 
        rom[1] = 8'b010_001_00; 
        rom[2] = 8'b000_000_10; 
        rom[3] = 8'b000_000_00; // NOP
    end

    // Execution Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 8'b0;
            // Initialize registers with test data
            register_file[0] <= 8'h05; // Starting value 5
            register_file[1] <= 8'h00;
            register_file[2] <= 8'h00;
        end else begin
            // PC Logic: Check for Jump (Opcode 10 and Rd 000)
            if (op == 2'b10 && rd == 3'b000) 
                pc <= {5'b0, rs}; // Jump to address in rs bits
            else
                pc <= pc + 1; // Normal increment

            // Instruction Execution
            case(op)
                2'b00: register_file[rd] <= register_file[rd] + register_file[rs]; // ADD
                2'b01: register_file[rd] <= register_file[rd] - register_file[rs]; // SUB
                2'b11: register_file[rd] <= register_file[rs];                    // MOV
                default: ; // Op 10 handled by Jump logic
            endcase
        end
    end

    assign alu_result = register_file[rd];
endmodule
