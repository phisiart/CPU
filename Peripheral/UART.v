`timescale 1ns / 1ps

// UART Peripheral
// Created by Zhengrong Wang
// Created 03/07/2014
// Last Modified 04/07/2014

module UART(
    input UART_RX,
    output UART_TX,
    output [7:0] UART_RXD,
    input [7:0] UART_TXD,
    output reg RX_EFF,
	 input RX_READ,
    output TX_STATUS,
    input TX_EN,
    input sysclk,
    input reset
    );
wire brclk;
wire RX_STATUS;

wire reset_UBRG;

// negedge_detc module to detect the negedge of reset
// it generates a negative impluse to reset the UART_Baud_Rate_Generator Module

negedge_detc NEG_inst(
	.clk(sysclk),
	.signal(reset),
	.z(reset_UBRG)
	);

//////////////////////////

// RX_EFF:
// 1'b1: THE UART_RXD hasn't been read
// 1'b0: THE UART_RXD has been read, and no new data has been received
// basically, RX_EFF is a flag to tell whether the data stored in UART_RXD is unused

//////////////////////////

always @(posedge sysclk or negedge reset) begin
	if (!reset) begin
		RX_EFF <= 1'b0;
	end
	else if (RX_READ) begin
		RX_EFF <= 1'b0;
	end
	else if (RX_STATUS) begin
		RX_EFF <= 1'b1;
	end
end

// Generate the baud rate
UART_Baud_Rate_Generator UBRG_inst(
		.sysclk(sysclk),
		.reset(reset_UBRG),
		.brclk(brclk)
	);

UART_Receiver UART_Receiver_inst(
		.UART_RX(UART_RX), 
		.sysclk(sysclk), 
		.brclk(brclk), 
		.reset(reset), 
		.RX_STATUS(RX_STATUS), 
		.RX_DATA(UART_RXD)
	);
	
divider_16 di(brclk, reset_UBRG, baudclk);

UART_Sender UART_Sender_inst(
		.sysclk(sysclk), 
		.baudclk(baudclk), 
		.reset(reset), 
		.TX_DATA(UART_TXD), 
		.TX_EN(TX_EN), 
		.UART_TX(UART_TX), 
		.TX_STATUS(TX_STATUS)
	);
endmodule

// The negedge_detc module is used to detect the negedge of some signal
// Designed by FSM

module negedge_detc(
		input clk,
		input signal,
		output z
	);
	reg [1:0] status;
	assign z = status[1] || signal;
	wire [1:0] status_next;
	assign status_next[0] = (~status[0]) & (~signal) & (~status[1]);
	assign status_next[1] = (~signal) & (status[0] | status[1]);
	always @(posedge clk) begin
		status <= status_next;
	end
endmodule
