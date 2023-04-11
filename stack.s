section .data
msg db 'Enter a string: ', 0
msg_len equ $-msg
palindrome db ' is a palindrome.', 0
not_palindrome db ' is not a palindrome.', 0

section .bss
input resb 100
stack resb 100
len resb 1

section .text
global _start

_start:
    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Length of input
    mov ebx, input
    xor ecx, ecx
    xor eax, eax
    mov cl, [ebx]
    inc eax
    inc ebx
    cmp cl, 10
    je end_of_string
loop1:
    mov cl, [ebx]
    cmp cl, 10
    je end_of_string
    inc eax
    inc ebx
    jmp loop1
end_of_string:
    mov [len], al

    ; Push to stack
    mov ebx, input
    xor ecx, ecx
    cmp byte [ebx], 10
    je end_of_push
push_loop:
    mov al, [ebx]
    push eax
    inc ebx
    inc ecx
    cmp ecx, [len]
    jne push_loop
end_of_push:

    ; Compare
    mov ebx, input
    xor ecx, ecx
    cmp byte [ebx], 10
    je end_of_pop
pop_loop:
    pop eax
    cmp al, [ebx]
    jne not_palindrome_output
    inc ebx
    inc ecx
    cmp ecx, [len]
    jne pop_loop
end_of_pop:

    ; Print to user
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, [len]
    int 0x80
    cmp byte [input + edx - 1], 10
    je end_of_output
    mov eax, 4
    mov ebx, 1
    mov ecx, palindrome
    mov edx, 17
    int 0x80
    jmp end_of_program
not_palindrome_output:
    mov eax, 4
    mov ebx, 1
    mov ecx, not_palindrome
    mov edx, 19
    int 0x80
end_of_output:
    ; Exit 
    jmp end_of_program
end_of_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
