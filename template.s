.data  // start of the data segment

prompt:
	.asciz "I'm thinking of a number between 0 and 0xFF, can you guess it?\n"
promptSize = .-prompt

low:
	.asciz "Your guess is lower than my number try a higher number\n"
lowSize = .-low

high:
	.asciz "Your guess is higher than my number try a lower number\n"
highSize = .-high

win: 
	.asciz "Your guess is correct, you win!\n"
winSize = .-win
loss:
	.asciz "You are out of guesses, try again!\n"
lossSize = .-loss
.equ Guess, 10

.text  // start o the text segment (Code)

.global _start // Linux Standard _start, similar to main in C/C++ 
_start:

ldr x1, =prompt
ldr x2, =promptSize
mov x8, #64
svc 0

mov x0, #0xFF
bl getHexNumber

bl printX0
mov x10, x0

b loop

loop:
cmp x1, x2
b.hi high
b.lo low
b.eq win

mov x2, #0
mov x8, #64
svc 0
b loop

gLower:
mov x0, #0
ldr x1, =low
ldr x2, =lowSize
mov x2, #0
mov x8, #64
svc 0
mov x2, #0
b guessCount

gHigher:
mov x0, #0
ldr x1, =high
ldr x2, =highSize
mov x2, #0
mov x8, #64
svc 0
mov x2, #0
b guessCount

Win:
ldr x1, win
ldr x2, =winSize
mov x1, #winSize
mov x2, #0
mov x8, #64
svc 0
b end

guessCount:
add x3, x3, #1
cmp x3, #Guess
b.le loop
ldr x1, =loss
ldr x2, =lossSize
mov x2, #0
mov x8, #64
svc 0
b end

end:
mov x0, #0
mov x8, #93
svc #0
// Exit to the OS, essentially this code does this in c
// return 0;
mov x0, #0          // return value
mov x8, #93         // Service call code
svc 0               // Linux service call
