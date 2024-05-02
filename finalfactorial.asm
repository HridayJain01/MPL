data segment
num dw 05h
fact dw 0
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov cx,05
mov ax,1

factorial:
mul cx
loop factorial
mov [fact],ax

mov ax,2121h
mov bx,fact
mov bx,[bx]
int 21h
code ends
end start
