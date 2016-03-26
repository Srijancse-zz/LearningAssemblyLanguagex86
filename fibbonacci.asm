extern printf
extern scanf

section .data
    inp   :    db "%d"                  
    a     :    dd 0                     
    b     :    dd 1                     
    c     :    dd 0                     
    n     :    dd 0                     
    i     :    dd 1                     
    out   :    db "%d", 10, 0          
    prompt:    db "Enter number n: ", 0 

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