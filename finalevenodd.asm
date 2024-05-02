data segment
arr1 db 10h,11h,12h,13h,14h,15h
even db 0h
odd db 0h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov si,offset arr1
mov cx,6
again:
mov al,[si]
ror al,1
jc skip
inc even
jmp next
skip:
inc odd
next:
inc si
loop again

mov ah,4ch
int 21h

code ends
end start
