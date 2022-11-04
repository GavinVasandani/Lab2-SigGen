module rom # (
    parameter ADDRESS_WIDTH = 8, //Parameters are just the constants
              DATA_WIDTH = 8
)(
    //Assign input and output variables and their size:
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] dout

);

//Create 2D Array which is the ROM of size 2^8-1:0 (256 memory locations) and each memory location can hold 8-bit binary [7:0]
logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin 
        $display("Loading rom.");
        $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk) 
    //So at positive clk edge, output the value at rom_array[addr]
    dout <= rom_array [addr]; 

endmodule
