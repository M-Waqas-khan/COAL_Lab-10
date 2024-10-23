.model small
.stack 100h
.data
msg db "The sum of Five digits are: $"
result db ?  
.code

sum macro num1, num2, num3, num4, num5
    mov al, num1    
    add al, num2    
    add al, num3 
    add al, num4
    add al, num5   
    add al, '0'     
    mov result, al  
endm

main proc
    mov ax, @data
    mov ds, ax  
    
    lea dx, msg
    mov ah, 9     
    int 21h      
    
    sum 9, 10, 15, 44, 17  
    
    mov ah, 2
    mov dl, result    
    int 21h       
    
    mov ah, 4Ch       
    int 21h      
    
main endp

end main