;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   18/05/2014                                                     ;
; Program   :   Display numbers from 1 to 10                                   ;
; Note      :   This program was tested in Ubuntu 14.04 64 bit with package    ;
;               gcc-multilib installed.                                        ;
;                                                                              ;
; Copyright 2014 Amrita Centre for Cybersecurity Systems and Networks          ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern printf
extern scanf

section .data
    i   :    dd 1                       ; Counter
    out :    db "%d", 10, 0             ; Output format

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        loop:
            push DWORD [i]
            push out
            call printf
            add esp, 8
            inc DWORD [i]               ; Increment counter
            cmp DWORD [i], 10           ; Compare with 10
            jg final                    ; Exit if greater
            jmp loop                    ; else continue

        final:
            mov eax, 0
            leave
            ret
