;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   18/05/2014                                                     ;
; Program   :   print "Hello World" using printf                               ;
; Note      :   This program was tested in Ubuntu 14.04 64 bit with package    ;
;               gcc-multilib installed.                                        ;
;                                                                              ;
; Copyright 2014 Amrita Centre for Cybersecurity Systems and Networks          ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern printf                           ; declare printf as extern

section .data
    msg:    db "Hello World", 10, 0     ; msg to print
    len:    equ $-msg                   ; len of msg

section .text
    global main                         ; entry point for gcc

    main:
        push ebp                        ; saving old base pointer
        mov ebp, esp                    ; setting up current base pointer

        push dword msg                  ; push msg
        call printf

        add esp, 4                      ; pop msg off stack
        mov eax, 0                      ; exit code
        leave                           ; return from function
        ; leave instruction is equivalent to following 2 instructions
        ; mov esp, ebp
        ; pop ebp
        ret
