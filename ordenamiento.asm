.DOSSEG
.MODEL SMALL
.STACK 100h
.DATA
num db 10 dup (0)
salto db cr,lf,'$'

cr equ 10
lf equ 13

.CODE
mov dx,@data
mov ds,dx

lea si,num
mov si,0
mov cx,10

inicio:
mov ah,01h
int 21h
mov num[si],al
mov ah,09
mov dx,offset salto
int 21h
inc si
loop inicio
mov si,0
mov cx,10
imprime:
mov ah,02h
mov dl,num[si]
int 21h
mov ah,02h
mov dl,' '
int 21h
inc si
loop imprime
lea di,num
mov di,0
mov si,0
mov cx,10

ciclo1:
push cx
; mov al,num[si]
mov cx,10

ciclo2:
; mov ah,num[di]
cmp num[si],num[di]
ja intercambio
jmp sigue

intercambio:
mov al,num[si]
mov num[si],num[di]
mov num[di],al
;mov num[si],ah
;mov num[di],al
;mov al,ah 

sigue:
inc di
loop ciclo2
inc si
pop cx
loop ciclo1
mov si,0
mov cx,10

print:
mov ah,02h
mov dl,num[si]
int 21h
mov ah,02h
mov dl,' '
int 21h
inc si

loop print
mov ah,4ch
int 21h

end

