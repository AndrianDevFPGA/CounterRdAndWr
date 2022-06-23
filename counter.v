/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Counter that generate tx and rx 
*/
module counter(
              clk,
              rst,
              txWr,
              txRd

    );
    input clk;
    input rst;
    output reg txWr;
    output reg txRd;
    
    reg [31:0] counterWr; 
    reg [31:0] counterRd;
    
    always @ (posedge clk)
      begin
        if (rst)
          begin
            counterWr <= 0;
            counterRd <= 0;
            txWr <=0;
            txRd <= 0;
          end 
        else
          begin
            counterRd <= counterRd +1;
            counterWr <= counterWr +1;
            // generate tx for write 
            if (counterWr ==32'd15)
              begin
                txWr <=1;
              end 
            if (counterWr == 32'd35)
              begin
                txWr <= 0;
              end
            // generate tx for read 
            if (counterRd == 32'd50 )
              begin
                txRd <= 1;
              end
            if (counterRd == 32'd75)
              begin
                txRd <= 0;
                counterRd <= 0;
                counterWr <= 0;
              end 
          end 
      end 
    
endmodule
