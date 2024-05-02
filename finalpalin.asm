data segment
string db 'bananab'
len dw 07h
palchk db ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov si,offset string
mov di,si
mov bx,len
dec bx
add di,bx
again:
mov al,[si]
mov ah,[di]
cmp al,ah
jnz notpal
inc si
dec di
cmp si,di
jbe again
jmp palindrome
notpal:
mov palchk,00h
jmp printr
palindrome:
mov palchk,0ffh
printr:
mov dl,palchk
mov ah,02h
exit:
mov ah,4ch
int 21h
code ends
end start
