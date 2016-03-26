extern printf
extern puts
extern gets

section .data
    inp   :    dd "%s"                        ; input format for scanf
    key   :    db 3                           ; key for encryption
    p1    :    dd "Enter the word: ", 0
    n     :    times 20  dq " " 
    out   :    dd "%s", 0                     ; Output format
    i     :    dd 0                           ; counter 

section .text
    global main

    main:
        push ebp
        mov ebp, esp
        
        push p1                     
        call printf                     
        add esp, 4

        push n                                                
        call gets                      
        add esp, 8

    len:
        push ebx
        mov ecx,0
        dec ebx
      
    count:
        inc ecx
        inc ebx
        cmp byte [ebx],0
        jnz count
        dec ecx
        pop ebx
        mov edx,eax
        jmp check
        


    check:
        cmp DWORD [i], edx
        jg final
        inc DWORD [i]
        cmp DWORD[i],'X'
        je eX
        cmp DWORD [i],'Y'
        je eY
        cmp DWORD [i],'Z'
        je eZ
        cmp DWORD [i],'x'
        je ex
        cmp DWORD [i],'y'
        je ey
        cmp DWORD [i],'z'
        je ez
      
        jmp encrypt
      
    eX:
        mov DWORD [i], 'A'
        push eax
        push out
        call puts
        add esp,8
        jmp check
    
   eY:
        mov DWORD [i], 'B'
        push eax
        push out
        call puts
        add esp,8
        jmp check
 
   eZ:
        mov DWORD [i], 'C'
        push eax
        ;push out
        call puts
        add esp,8
        jmp check       
 
   ex:
        mov DWORD [i], 'a'
        push eax
        ;push out
        call puts
        add esp,8
        jmp check   
   
   ey:
        mov DWORD [i], 'b'
        push eax
        push out
        call puts
        add esp,8
        jmp check   

   ez:
        mov DWORD [i], 'c'
        push eax
        push out
        call puts
        add esp,8
        jmp check   
    
    encrypt:
        add DWORD [i],3
        mov eax, DWORD [i]
      
        push eax
        push out
        call puts
        add esp,8
      
    final:                    
        mov eax, 0
        leave
        ret    
      
      
