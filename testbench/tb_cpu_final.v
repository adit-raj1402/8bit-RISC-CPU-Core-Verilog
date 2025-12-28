module tb_cpu_final;
    reg clk;
    reg reset;
    wire [7:0] pc;
    wire [7:0] alu_result;

    // Instantiate the CPU
    risc_cpu_8bit uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .alu_result(alu_result)
    );

    // Clock Generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_cpu_final);

        clk = 0; reset = 1;
        #15 reset = 0; // Release Reset

        #120; // Run for 12 clock cycles to see the loop
        $finish;
    end
endmodule
