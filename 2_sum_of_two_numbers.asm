;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   18/05/2014                                                     ;
; Program   :   Input 2 numbers using scanf and print sum using printf         ;
; Note      :   This program was tested in Ubuntu 14.04 64 bit with package    ;
;               gcc-multilib installed.                                        ;
;                                                                              ;
; Copyright 2014 Amrita Centre for Cybersecurity Systems and Networks          ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern printf
extern scanf

section .data
    inp   :    db "%d"                  ; input format for scanf
    num1  :    dd 0                     ; first number
    num2  :    dd 0                     ; second number
    out   :    db "Sum is %d", 10, 0    ; output format for printf
    prompt:    db "Enter number: ", 0   ; prompt to enter input

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        push prompt                     ; Push address of prompt onto stack
        call printf                     ; Display prompt

        push num1                       ; Push address of first number onto stack
        push inp                        ; Push address of input format onto stack
        call scanf                      ; Call scanf

        push prompt                     ; Push address of prompt onto stack
        call printf                     ; Display prompt

        push num2                       ; Push address of second number onto stack
        push inp                        ; Push address of input format onto stack
        call scanf                      ; Call scanf

        mov eax, DWORD [num1]           ; Move 4 bytes at address num1 into EAX
        add eax, DWORD [num2]           ; Move 4 bytes at address num2 into EAX

        push eax                        ; Push sum onto the stack
        push out                        ; Push output format onto stack
        call printf                     ; Call printf

        add esp, 4
        mov eax, 0
        leave
        ret
