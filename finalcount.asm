data segment
num db 08h
zeros db 00h
ones db 00h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,8
mov al,num
again:
ror al,1
jc bit1
inc zeros
jmp next
bit1:
inc ones
next:
loop again

mov ah,4ch
int 21h
code ends
end start
