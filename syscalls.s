.data  // start of the data segment

file_prompt: .asciz "Enter a file name to write to (max 100 characters): \n"
file_prompt_size = .-file_prompt

message_prompt: .asciz "Enter a message to write to the file (max 100 characters): \n"
message_prompt_size = .-message_prompt

file_name: .skip 100
.equ fileSize, 100

message: .skip 100
.equ messageSize, 100

.equ READ, 0
.equ WRITE, 1
.equ READWRITE, 0666
.equ CREATE, 0100
.equ AT_FDCWD, -100

.text  // start o the text segment (Code)

.global _start // Linux Standard _start, similar to main in C/C++ 
_start:

ldr x1, =file_prompt 
ldr x2, =file_prompt_size
mov X8, 64
SVC 0

mov X0, #0
ldr x1, =file_name
ldr x2, =fileSize
mov X8, 64
SVC 0

BL printX0
mov X8, #0
SUB X0, X0, #1
strb w8, [x1, x0]

mov X0, #0
ldr x1, =message
ldr x2, =messageSize
mov X8, 64
SVC 0
mov x12, x0

mov x0, AT_FDCWD
ldr x1, =file_name
mov x2, CREATE+WRITE
mov x3, READWRITE
mov x8, 56
SVC 0
mov x9, x0

mov x0, x9
ldr x1, =message
mov x2, x12
mov X8, 64
SVC 0

mov x0, x9
mov x8, 57
SVC 0

mov x0, AT_FDCWD
ldr x1, =file_name
mov x2, READ
mov x3, READWRITE	
mov x8, 56
SVC 0
mov x9, x0

mov x0, x9
ldr x1, =fileSize
ldr x2, =fileSize
mov x8, 64
SVC 0

mov x10, x0

mov x0, x9
mov x8, 57
SVC 0

mov x0, #0
ldr x1, =fileSize
mov x2, x10
mov x8, 64
SVC 0

mov x0, #0
mov x8, 93
SVC 0






