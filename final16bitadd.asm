data segment
num1 dw 1234h
num2 dw 5678h
sum dw 00h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ax,num1
mov bx,num2
add al,bl
daa
mov cl,al
adc ah,bh
daa
mov ch,ah
mov sum,cx
mov ah,4ch
int 21h
code ends
end start
