extern printf
extern scanf

section .data
    a     :    dd 0                       ; a
    i     :    dd 0                       ; i
    m     :    dd 0                       ; m
    c     :    dd 0                       ; c
    s     :    dd 0                       ; seed
    inp   :    dd "%d"                    ; input format for scanf
    out   :    db "%d "  ,10, 0           ; output format for printf
    promptm :    db "Enter m: ", 0        ; prompt to enter input     
    prompts :    db "Enter seed: ", 0 
    prompta :    db "Enter a: ", 0        
    promptc :    db "Enter c: ", 0     
  
section .text
    global main

    main :
        push ebp
        mov ebp, esp

    push promptm                     
        call printf                     
        add esp, 4

        push m                          
        push inp                        
        call scanf                      
        add esp, 8

        push prompta                     
        call printf                     
        add esp, 4

        push a                          
        push inp                        
        call scanf                      
        add esp, 8

        push promptc                     
        call printf                     
        add esp, 4

        push c                          
        push inp                        
        call scanf                      
        add esp, 8
        
        push prompts                     
        call printf                     
        add esp, 4

        push s                          
        push inp                        
        call scanf                      
        add esp, 8 
        
        mov ecx, DWORD [s]
        mov DWORD [i],ecx      
        
        lcg:
            mov eax, DWORD [a]
            mov ebx, DWORD [s]
            mul ebx
            
            add eax, DWORD[c]
            
            mov edx,0 
            mov ebx, DWORD [m]
            div ebx
            
            mov DWORD [s], edx
            
            push edx
            push out
            call printf
            add esp,8     
            
            mov ecx, DWORD [s]
            cmp DWORD [i],ecx     
            jg lcg
            jl lcg
            je final
            
              final:                    
                 mov eax, 0
                 leave
                 ret