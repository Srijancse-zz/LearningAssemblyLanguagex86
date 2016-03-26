extern printf
extern scanf

section .data
    inp   :    db "%d"                  ; input format for scanf
    a     :    dd 0                     ; first number
    b     :    dd 1                     ; second number
    c     :    dd 0                     ; sum of a and b
    n     :    dd 0                     ; Nth number
    i     :    dd 1                     ; Counter
    out   :    db "%d", 10, 0           ; Output format
    prompt:    db "Enter number n: ", 0 ; prompt to enter input

section .text
    global main

    main :
        push ebp
        mov ebp, esp

        push prompt                     
        call printf                     
        add esp, 4

        push n                          
        push inp                        
        call scanf                      
        add esp, 8
	add DWORD [n], -1

        fibo:

            inc DWORD [i]               
            mov ebx, DWORD [a]          
            add ebx, DWORD [b]          
            mov DWORD [c], ebx          
            mov ecx, DWORD [b]          
            mov DWORD [a], ecx          
            mov edx, DWORD [c]          
            mov DWORD [b], edx          
            mov eax, DWORD [i]          
            cmp eax, DWORD [n]          
	    jle fibo                   

        final:
           push ebx                        
           push out                        
           call printf                  
           mov eax, 0
           leave
           ret