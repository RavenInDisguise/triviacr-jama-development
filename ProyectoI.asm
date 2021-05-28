;Tecnológico de Costa Rica, Campus Tecnológico de Cartago, Escuela de Computación, Arquitectura de Computadoras (IC3101).
;Proyecto I
;Trivia. 
;Mónica María Alfaro Parrales, 2020132572
;Viernes 05 de mayo de 2021, I Semestre, Esteban Arias Méndez.


%include "io.mac" 

.DATA
;Mensajes generales
msj_prompt0  db '~Bienvenido a su juego de Trivia preferido~',0AH,0
msj_prompt1  db 'Con cuantos jugadores desea jugar? ',0
msj_prompt2  db 'Indique su nickname: ',0
msj_prompt3  db 'Desea salir? ',0

;Preguntas
preg_geografia1 db 'Cual es el canton en el que se encuentra el volcan Poas? a) Poas b) Alajuela c) Perez Zeledon d) Sabanilla ~ A que canton pertenece el distrito de Vargas Araya? a) Montes de Oca b) Desamparados c) Alajuelita d) Poas ',0
preg_geografia2 db 'Desamparados es el canton mas grande de Costa Rica: verdadero o falso~ El distrito de Sabanilla pertenece al canton de Montes de Oca: verdadero o falso~',0
array_resp_geog1           db 'a','a'
array_preg_geog1           db 2,3 
array_done_geog1 TIMES 30  db '~' 
array_users      TIMES 30  db '~'
array_users_pts  TIMES 30  db -1

.UDATA
players     resd 1
nickname    resb 1
result      resd 1
answer      resd 1

.CODE

.STARTUP
    sub     EAX,EAX             ;Se limpian los registros
    sub     EBX,EBX
    sub     ECX,ECX         
    sub     EDX,EDX
    sub     ESI,ESI
    sub     EDI,EDI
    mov     ECX,players
    PutStr  msj_prompt0         ;Mensaje general
    PutStr  msj_prompt1         ;Pregunta cuantos jugadores
    GetLInt  [ECX]              ;Los adquiere
get_nickname:
    inc     ECX
    PutStr  msj_prompt2 ;Nickname
    GetStr  nickname
    ;mov     dword [array_users], nickname  
    cmp     ECX,0
    jne     get_nickname
    call    random_number
done:
    .EXIT

random_number: 
    rdtsc 
    sub     ECX,ECX    
    sub     EDX,EDX                            ;Hora del computador para generar el random
    mov     ECX, 30-0 + 1
    div     ECX
    mov     EAX,EDX
    sub     ECX, ECX
    sub     EDX, EDX
pregunta_random:
    mov     BL,[preg_geografia1+ESI]       ; Copio cada caracter en BL
    inc     ESI                         ; Incremento ESI para moverme en el array
    cmp     BL,'~'
    mov     [EDX],BL    