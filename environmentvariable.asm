extern printf
extern getenv
extern gets
extern puts

section .data
  n      :    times 10  dq " "          ; Number
  prompt :    db "Enter : ", 0          ; prompt to enter input

section .text
    global main

    main :
    push ebp
        mov ebp, esp
    
        push prompt                     
        call printf                     
        add esp, 4

        push n                                                         
        call gets                      
        add esp, 8
        
        push n
        call getenv
        
        push eax                      
        call puts                      
        add esp, 8

    final:                 
           mov ax, 0
           leave
           ret