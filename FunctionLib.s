.data  // start of the data segment

// create a helloworld variable and size variable
helloWorld: 
	.asciz "Hello World of Assembly!\n"
helloSize = .-helloWorld

.text  // start o the text segment (Code)

// declare the globally available functions here
.globl mulby4
.globl printXtimes
.globl getRandNum
.globl getMax

/*
mulby4 int
parameters: X0, the value to multiply by 4
precondition: X0, has a value in it 
postcondition: X0, has a value in it 4 that is its original value multiplied by 4 
return: X0, the value mulitplied by 4
*/
mulby4:
// Your code goes here
mov X2, #4
mov X3, X0
mul X0, X3, X2
ret

/*
printXtimes     int, int
parameters:     X0, the value to print to the scren using (you can use BL printX0)
                X1, the number of times to print the value to the screen
precondition:   X0 and X1 must contain values
postcondition:  X0 has been printed X1 times, X1 will be used to count down so will change
return:         N/A, will return what was in X0 to start  with
*/
printXtimes:
// Your code goes here
mov X2, X1 // Set X2 = times to loop
printXtimes_loop:
cmp X2, #0
beq printXtimes_done
BL printX0
sub X2, X2, #1
BL printX2
b printXtimes_loop 
printXtimes_done:
ret     


/*
getRandNum  
parameters:     X0, the maximum number boundary, numbers will be between 0 and X0 -1 
precondition:   X0, must have a value in it
postcondition:  a random number between 0 and X0-1 will be in X0
return:         X0, holds the random number
*/
getRandNum:
// Your code goes here
bl getRandNum
ret

/*
getMax
parameters:         X0, one of 6 integers to determine which has the largest value
                    X1, one of 6 integers to determine which has the largest value
                    X2, one of 6 integers to determine which has the largest value
                    X3, one of 6 integers to determine which has the largest value
                    X4, one of 6 integers to determine which has the largest value
                    X5, one of 6 integers to determine which has the largest value
precondition:       X0 ... X6 have integers to compare
postcondition:      X0 holds the largest integer passed into the function
return:             X0, the largest integer passed into the function
*/
getMax:
// Your code goes here
mov X10, X0
cmp X1, X10
b.gt setX1Max
b continueCompare
setX1Max:
mov X10, X1
continueCompare:
cmp X2, X10
b.gt setX2Max
b continueCompare2
setX2Max:
mov X10, X2
continueCompare2:
cmp X3, X10
b.gt setX3Max
b continueCompare3
setX3Max:
mov X10, X3
continueCompare3:
cmp X4, X10
b.gt setX4Max
b continueCompare4
setX4Max:
mov X10, X4
continueCompare4:
cmp X5, X10
b.gt setX5Max
b done
setX5Max:
mov X10, X5
done:
mov X0, X10 
ret


