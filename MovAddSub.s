.data  // start of the data segment

// create a helloworld variable and size variable
helloWorld: 
	.asciz "Hello World of Assembly!\n"
helloSize = .-helloWorld

registerString: .asciz "        "
registerSize = .-registerString

hex: .ascii "0x"
hexSize = .-hex
tempBytes: .word 0x0


.text  // start o the text segment (Code)

.global _start // Linux Standard _start, similar to main in C/C++ 
_start:


// Print, essentialy this code does this in c
// cout << helloWorld;
ldr x1, =helloWorld  // store the address of helloWorld into x1
ldr x2, =helloSize   // store the size of the hellowWorld string into x2
mov x8, #64          // store 64 to x8, this is the linux write call
svc 0                // Linux service call .





// perform the following work as outlined in the comments below, you will turn in a screenshot of the run of this program, along with your source code, when your done
// Using MOV/MOVK set the value of X2 to 0xFACED000000DECAF
// Then using the library call printX2 print the value to the screen

// your code goes here
MOV X2, #0xECAF
MOVK X2, #0x000D, LSL 16
MOVK X2, #0xD000, LSL 32
MOVK X2, #0xFACE, LSL 48
BL printX2



// MOVK
// We want to put the value 0x123456789ABCDEF0 in register 1
// With ARM we cannot do this in one instruction sow we need to fill it 16 bytes at a time with MOVK
// First we move the least significant portion into the register
// using a MOVK we will move in the next 16 bits

// your code goes here
MOV X1, #0xDEF0
MOVK X1, #0x9ABC, LSL 16
MOVK X1, #0x5678, LSL 32
MOVK X1, #0x1234, LSL 48




// I have linked a library cs12Lib to this file via the Makefile
// you are not responsible to know how the file works, but I have left the source code (not well documented at the moment) if you wish to read it
// one of the functions of this library is to allow you to print out the value of registers 1-30
// you call this in the manner seen below
BL printX1


// MOVN
// move the 1ʻs complement of the value 0x0531 into X2
// then print the value to the screen

// your code goes here

MOVN X1, #0x1531
BL printX1


// ADD
// add register X1 and X2 together into X3 and print the value to the screen
 
// your code goes here
add X3, X1, X2

BL printX3


// SUB
// subtract register X2 from X1 into X4 and print the value to the screen

// your code goes here
sub X4, X2, X1
BL printX4



// ADC
// lets look at carry operations
// fill register X5 with the value 0xFFFFFFFFFFFFFFFF and print the value to the screen
// note there are several ways to set the register to this value, some in a single operation

// your code goes here

MOV X5, #0xFFFFFFFFFFFFFFFF 
BL printX5


// now lets add 1 to register X5, but use the ADDS (Status bit flag on)
// be careful not to add any instructions after the ADDS or the carry flag may change 

// your code goes here

ADDS X5, X5, #1

// at this point X5 should be 0, and the carry flag should be set
// using ADC lets see if the carry bit was set 
// ADC into X6 the value in X6 (0) plus the carry flag 
// X6 = X6 + X7 + CarryFlag
// Use register X7 as a temporary register for this call and store 0 in it, it will be the final parameter to ADC
// then print out X5 and X6

// your code goes here


MOV X7, #0
ADC X5, X5, X7

BL printX6
BL printX5


// SBC
// Fill register 7 with the value 1
// then subtract 1, but use the SUBS instruction so the carry flag can clear
// do not print the vaule out yet

// your code goes here
MOV X7, #1
SUBS X7, X7, #1



// set R8 to 5
// Now run SBC into X8 subtracting X9 from X8
// X8 = X8 - X9 - CarryFlag
// Use register X9 as a temporary register for this call and store 0 in it, it will be the final parameter to SBC
// print out the values for X7 and X8

// your code goes here

MOV X8, #5
MOV X9, #0

SBC X8, X8, X9

BL printX7
BL printX8

// The value above should have X8 still holding the value 5
// Run all the commands (in the SBC Section) again (but leave X7 with its existing value) 
// This will  SBC section to see the carry flag drop the value to 4
// print out the values for X7 and X8

// your code goes here

SUBS X7, X7, #1
ADDS X8, X8, X7

BL printX7
BL printX8


// you will now do a printshot of your programs output and post, along with your source code to canvas
// Note that the correct ouput is here, I will run your application, your screen shot is subplimental your grade will come from your code.

/*
Hello World of Assembly!
0xFACED000000DECAF
0x123456789ABCDEF0
0xFFFFFFFFFFFFFACE
0x123456789ABCD9BE
0x123456789ABCE422
0xFFFFFFFFFFFFFFFF
0x0000000000000000
0x0000000000000001
0x0000000000000000
0x0000000000000005
0xFFFFFFFFFFFFFFFF
0x0000000000000004
*/


// Exit to the OS, essentially this code does this in c
// return 0;

// ---------- cut
mov x0, #0          // return value
mov x8, #93         // Service call code
svc 0               // Linux service call
// ---------- cut

