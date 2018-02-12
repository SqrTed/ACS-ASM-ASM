bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start,poz,max,sir,len
extern sequence       

; declare external functions needed by our program
extern exit,scanf,printf     
import exit msvcrt.dll    
import scanf msvcrt.dll
import printf msvcrt.dll

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    sir db 1,2,0,2,5,10,8,9,0,3,11,14,0
    len db $-sir
    max db 0
    format db "%d ",0
    poz dd 0
    
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov eax,len
        call sequence ;apelez functia
        
        xor ecx,ecx ;curat ecx
        mov cl,[max] ;pun in cl maximul gasit
        mov esi,[poz] ;pun in esi pozitia de inceput a secventei
        xor eax,eax ;curat eax
        
        repeta:
            lodsb ;pun in al elementul din secventa
            push ecx ;pun ecx pe stiva pt ca printf mi-l modifica
            push eax ;pun eax eax pe stiva pt a fi printat
            push dword format ;pun formatul pe stiva
            call [printf] ;apelez printf
            add esp,4*2 ;curat stiva
            pop ecx ;recuperez ecx de pe stiva
        loop repeta
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
