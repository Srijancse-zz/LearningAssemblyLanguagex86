;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   18/05/2014                                                     ;
; Program   :   Find greatest of two numbers                                   ;
; Note      :   This program was tested in Ubuntu 14.04 64 bit with package    ;
;               gcc-multilib installed.                                        ;
;                                                                              ;
; Copyright 2014 Amrita Centre for Cybersecurity Systems and Networks          ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern printf
extern scanf

section .data
    inp  :    db "%d"                        ; input format for scanf
    num1 :    dd 0                           ; first number
    num2 :    dd 0                           ; second number
    grt  :    db "%d is greater", 10, 0      ; output format for printf
    equ  :    db "Both are equal", 10, 0     ; output format for printf
    p1   :    db "Enter first number: ", 0   ; prompt to enter inputs
    p2   :    db "Enter second number: ", 0  ; for the two numbers

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        push p1                              ; Push address of prompt onto stack
        call printf                          ; Display prompt

        push num1                            ; Push address of first number onto stack
        push inp                             ; Push address of input format onto stack
        call scanf                           ; Call scanf

        push p2                              ; Push address of prompt onto stack
        call printf                          ; Display prompt

        push num2                            ; Push address of second number onto stack
        push inp                             ; Push address of input format onto stack
        call scanf                           ; Call scanf

        mov eax, DWORD [num1]                ; Move 4 bytes at address num1 into EAX
        cmp eax, DWORD [num2]                ; Compare 4 bytes at address num2 with EAX
        jg greater                           ; num1 is greater
        jl lesser                            ; num2 is greater
        jmp equal                            ; Both are equal


    equal:
        push equ
        call printf
        add esp, 4
        jmp final

    greater:
        push DWORD [num1]
        jmp display

    lesser:
        push DWORD [num2]
        jmp display

    display:
        push grt
        call printf
        add esp, 8

    final:
        mov eax, 0
        leave
        ret
