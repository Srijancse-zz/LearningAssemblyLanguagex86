extern printf
extern scanf

section .data
    i     :    dd 2                         
    n     :    dd 0                               
    out   :    db "%d", 10, 0  
    p     :    db "Prime number", 10, 0           
    m     :    dd 0                              
    np    :    db "Not a prime number", 10, 0                      
    inp   :    dd "%d"                   
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
        
        mov ebx, DWORD [n]          
        cmp ebx, 1
        je yesprime
        
        mov ebx, DWORD [n]          
        cmp ebx, 2
        je yesprime
        
        mov edx,0
        mov eax, DWORD [n]
        mov ecx, 2
        div ecx
        mov DWORD[m],eax    

        prime:  
            mov edx,0
            mov eax, DWORD [n]
            mov ecx, DWORD [i]
            div ecx           
            cmp edx, 0
            je noprime
            inc DWORD [i] 
            mov ebx, DWORD [i]          
            cmp ebx, DWORD [m]          
        jle prime  
        
        yesprime:
            push p
            call printf
            add esp, 4
            jmp final 
                
        noprime:
            push np
            call printf
            add esp, 4
            jmp final                

        final:                 
           mov eax, 0
           leave
           ret