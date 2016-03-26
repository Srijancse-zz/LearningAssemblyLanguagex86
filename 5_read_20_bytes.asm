;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   24/10/2015                                                     ;
; Program   :   Print first 20 bytes of file                                   ;
; Note      :   This program was tested in Ubuntu 14.04 64 bit with package    ;
;               gcc-multilib installed.                                        ;
;                                                                              ;
; Copyright 2014 Amrita Centre for Cybersecurity Systems and Networks          ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern fclose
extern fopen
extern fread
extern memset
extern printf

%define BUF_SIZE 20
%define ELEM_SIZE 1

section .data
    filename : dd 0
    fh : dd 0
    open_error : db "Cannot open file! Exiting!", 10, 0
    open_mode : db "r", 0
    output_format : db "%s", 0
    usage : db "Usage: %s FILENAME", 10, 0

section .bss
    buffer : resb BUF_SIZE

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        mov eax, DWORD [ebp + 0x8]
        cmp eax, 0x2
        jne nofilename

        mov eax, DWORD [ebp + 0xc]
        mov eax, [eax + 4]
        mov [filename], eax
        push open_mode
        push DWORD [filename]
        call fopen
        add esp, 4
        test eax, eax
        jz openfailed

        mov [fh], eax

        push BUF_SIZE
        push 0
        push buffer
        call memset
        add esp, 12

        push DWORD [fh]
        push BUF_SIZE
        push ELEM_SIZE
        push buffer
        call fread
        add esp, 0x10

        push buffer
        push output_format
        call printf
        add esp, 8

        push DWORD [fh]
        call fclose
        add esp, 4
        mov eax, 0
        jmp final

    nofilename:
        mov eax, DWORD [ebp + 0xc]
        mov eax, [eax]
        push eax
        push usage
        call printf
        add esp, 8
        mov eax, 1
        jmp final

    openfailed:
        push open_error
        call printf
        add esp, 4
        mov eax, 1
        jmp final

    final:
        leave
        ret
