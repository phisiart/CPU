`timescale 1ns / 1ps

// TESTBENCH for UART_Sender
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

module test_UART_Sender;

	// Inputs
	reg sysclk;
	wire brclk;
	UART_Baud_Rate_Generator UBRG(sysclk, reset, brclk);
	reg reset;
	reg [7:0] TX_DATA;
	reg TX_EN;

	// Outputs
	wire UART_TX;
	wire TX_STATUS;

	// Instantiate the Unit Under Test (UUT)
	UART_Sender uut (
		.sysclk(sysclk), 
		.brclk(brclk), 
		.reset(reset), 
		.TX_DATA(TX_DATA), 
		.TX_EN(TX_EN), 
		.UART_TX(UART_TX), 
		.TX_STATUS(TX_STATUS)
	);

	initial begin
		// Initialize Inputs
		sysclk = 0;
		reset = 0;
		TX_DATA = 0;
		TX_EN = 0;

		#200000;
      reset = 1;
		// Add stimulus here
		TX_DATA = 8'b01001010;
		#100000;
		TX_EN = 1;
		#10 TX_EN = 0;
		
		#2000000;
		TX_DATA = 8'b01001010;
		TX_EN = 1;
		#10 TX_EN = 0;
	end
	
	always #5 sysclk = ~sysclk;
      
endmodule
