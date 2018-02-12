bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global sequence
extern poz,max,sir,len

; our code starts here
segment code use32 class=code
    sequence:
        ; ...
        mov esi,sir ;pun in esi adresa primului element din sir
        mov edx,esi ;pun prima pozitie in edx
        xor ecx,ecx
        mov cl,[len] ;pun len in ecx pentru a parcurge toate elementele sirului
        xor ebx,ebx ;curat ebx, in ebx vom numara lungimea secventei
        xor eax,eax ;curat eax
        ;bucla de prelucrare
        bucla:
            lodsb ;pun in al primul element
            cmp eax,0 ;vad daca e 0
            jne increase ;daca nu e sar mai departe
            mov al,[max] ;daca e pun in al cea mai mare lungime de secventa gasita
            cmp bl,al ;compar sa vad daca cel din ebx este mai mare
            jle re ;daca nu e sar peste
                mov [max],bl ;daca e actualizez lungimea secventei
                mov [poz],edx ;actualizez pozitia de inceput
            re:
            mov edx,esi ;reactualizez adresa pt segventa curenta 
            xor ebx,ebx ;actualizez lungimea
            jmp end_loop ;sar la sfarsitu loop-ului
            increase:
            inc ebx
            end_loop:
        loop bucla
        ret
    
        
