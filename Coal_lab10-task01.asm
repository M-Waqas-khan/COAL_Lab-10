display macro var
    push ax
    lea dx, var
    mov ah, 09h
    int 21h
    pop ax
endm

.model small
.stack 100h
.data
var1 db 'hello$'
var2 db 'world$'
.code
main proc
    mov ax, @data
    mov ds, ax  
          
    display var1
    
    mov dx , 10
    mov ah ,2 
    int 21h
    
     mov dx , 13
    mov ah ,2 
    int 21h
    display var2  ; Display var2 content using the display macro
    
    mov ah, 4Ch   ; DOS interrupt to exit
    int 21h
    
main endp
end main