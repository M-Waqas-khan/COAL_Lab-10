.model small
.stack 100h
.code

FIB_MACRO MACRO
    pop bx            ; F(n-1)
    pop ax            ; F(n-2)
    add ax, bx        ; F(n) = F(n-1) + F(n-2)
    push bx           ; Push F(n-1)
    push ax           ; Push F(n)
ENDM

main proc
    mov ax, 0         ; F(0)
    push ax
    mov ax, 1         ; F(1)
    push ax

    mov cx, 4         ; 4 Fibonacci numbers (F2 to F5)
calc_fib:
    FIB_MACRO         ; Calculate next Fibonacci number
    loop calc_fib

    mov ax, 4C00h     ; Exit
    int 21h

main endp
end main
