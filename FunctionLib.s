.data  // start of the data segment

// create a helloworld variable and size variable
helloWorld: 
	.asciz "Hello World of Assembly!\n"
helloSize = .-helloWorld

.text  // start o the text segment (Code)

// declare the globally available functions here
.globl catString
.globl catStrings


/*
catStrings  
parameters:     X0,     the number of characters to cat to the screen next
                X1,     the characters to cat to the string next
                X2,     the number of characters to cat to the screen next
                X3,     the characters to cat to the string next
                X4,     the number of characters to cat to the screen next
                X5,     the characters to cat to the string next
                X6,     the number of characters to cat to the screen next
                X7,     the characters to cat to the string next
                stack,  the number of characters to cat to the screen next
                stack,  the characters to cat to the string next
                stack,  the number of characters to cat to the screen next
                stack,  the characters to cat to the string next
precondition:   X0...X7, must have valid size/text pairs
                the stack must have 2 valid size/text pairs
postcondition:  the text will be printed to stdout based on the size values 
return:         N/A, no return value is defined 
*/
catStrings:
// your code goes here
STP FP, LR, [SP, #-16]!
ADD FP, SP, #16
MOV X10, X2
MOV X2, X0
MOV X0, #0
MOV X8, 64
SVC 0

MOV X2, X10
MOV X1, X3
MOV X0, #0
MOV X8, 64
SVC 0

MOV X2, X4
MOV X1, X5
MOV X0, #0
MOV X8, 64
SVC 0

MOV X2, X6
MOV X1, X7
MOV X0, #0
MOV X8, 64
SVC 0

LDR X1, [FP, #8]
LDR W2, [FP, #0]
MOV X0, #0
MOV X8, 64
SVC 0

LDR X1, [FP, #24]
LDR W2, [FP, #16]
MOV X0, #0
MOV X8, 64
SVC 0

LDP FP, LR, [SP], #16
ret



/*
catString
parameters:     X0,     the number of characters to cat to the screen next
                X1,     the characters to cat to the string next
precondition:   X0 and X1, must have valid size/text pairs
postcondition:  the text will be printed to stdout based on the size values
return:         N/A, no return value is defined
*/

catString:
STP FP, LR, [SP, #-16]!

MOV X2, X0      // first parameter is the lenghth of the string  
//MOV X1, X1      // second paramater is the pointer to the string 
MOV X0, #0      // set the output to stdout
MOV X8, 64      // write
SVC 0           // call the service routine


LDP FP, LR, [SP], #16
ret   


