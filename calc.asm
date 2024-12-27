%include "util.asm"  ; This should include utility functions like printstr, readint, etc.

GLOBAL _start

section .text

_start:
    ; using util.asm for this one.
    mov rdi,num1
    call printstr
    call readint                  ; Get first number
    mov [user_num1], rax          ; Store first number

    mov rdi,num2
    call printstr
    call readint                  ; Get second number
    mov [user_num2], rax          ; Store second number

    mov rdi, operator
    call printstr
    mov rdi, user_oper
    mov rsi, 2
    call readstr                  ; Get operator as string

_cmp_ope:
    ; Compare operator & etc.
    mov rdi, [user_oper]
    cmp byte [rdi], 43            ; Compare with ASCII '+'
    je _addition
    cmp byte [rdi], 45            ; Compare with ASCII '-'
    je _substraction
    cmp byte [rdi], 42            ; Compare with ASCII '*'
    je _multiply
    cmp byte [rdi], 47            ; Compare with ASCII '/'
    je _divide

    ; If not then error msg is printed
    mov rdi, err_msg
    call printstr

    ; Exit code
    call exit0

_addition:
    mov rdi, [user_num1]          ; Load first number
    add rdi, [user_num2]          ; Add second number
    call _result

_substraction:
    mov rdi, [user_num1]          ; Load first number
    sub rdi, [user_num2]          ; Subtract second number
    call _result

_multiply:
    mov rdi, [user_num1]          ; Load first number
    imul rdi, [user_num2]         ; Multiply with second number
    call _result

_divide:
    mov rdx, 0                    ; Clear RDX (for division)
    mov rax, [user_num1]          ; Load first number
    mov rbx, [user_num2]          ; Load second number
    idiv rbx                      ; Signed division
    mov rdi, rax                  ; Move quotient to rdi
    call _result

_result:
    call printstr                 ; Print the result (you may need to convert rdi to string first)
    call endl                     ; Print newline
    call exit0                    ; Exit the program

section .data
    num1: db "Enter the 1st number : ", 0
    num2: db "Enter the 2nd number : ", 0
    operator: db "Enter the Operation symbol (+,-,*,/): ", 0
    err_msg: db "Cannot perform operations, SORRY!", 0

section .bss
   user_num1: resq 1    ; Reserve 8 bytes (64-bit integer)
   user_num2: resq 1    ; Reserve 8 bytes (64-bit integer)
   user_oper: resb 2    ; Reserve space for operator (1 byte + null terminator)
