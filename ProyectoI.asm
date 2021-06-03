;Tecnológico de Costa Rica, Campus Tecnológico de Cartago, Escuela de Computación, Arquitectura de Computadoras (IC3101).
;Proyecto I
;Trivia. 
;Mónica María Alfaro Parrales, 2020132572
;Viernes 05 de mayo de 2021, I Semestre, Esteban Arias Méndez.


%include "io.mac" 

.DATA
;Mensajes generales
msj_prompt0  db '~Bienvenido a su juego de Trivia preferido~',0AH,0
msj_menu     db '~~~~~~~Menu~~~~~~~~~',0AH,0
msj_op1      db '1. Jugar ',0AH,0
msj_op2      db '2. Ranking ',0AH,0
msj_op3      db '3. Salir ',0AH,0
msj_prompt1  db 'Con cuantos jugadores desea jugar? Max 5: ',0
msj_prompt2  db 'Indique su nickname: ',0
msj_prompt3  db 'Desea salir? ',0
msj_prompt4  db 'Cual opcion desea realizar: ',0
msj_prompt5  db 'Ranking: ',0
msj_prompt6  db 'Su respuesta: ',0
;Preguntas
question0  db 'q0',0AH,0
question1  db 'Cual es el canton en el que se encuentra el volcan Poas? a) Poas b) Alajuela c) Perez Zeledon d) Sabanilla',0AH,0
question2  db 'A que canton pertenece el distrito de Vargas Araya? a) Montes de Oca b) Desamparados c) Alajuelita d) Poas',0AH,0
question3  db 'Desamparados es el canton mas grande de Costa Rica: verdadero o falso',0AH,0
question4  db 'El distrito de Sabanilla pertenece al canton de Montes de Oca: verdadero o falso',0AH,0
question5  db 'En cual billete aparece Carmen Lyra? a)20 mil b)10 mil c)5 mil d)50 mil',0AH,0
question6  db 'q6',0
question7  db 'q7',0
question8  db 'q8',0
question9  db 'q9',0
question10  db 'q10',0


;Respuestas
array_resp      dd 'a','a','f','v','b'

;Puntos por pregunta
array_pts_abc   dd 2,3,1,1

;Preguntas ya respondidas
array_done_users    TIMES 30  dd '~'

;Usuarios jugando
array_ingame_users  TIMES 5  dd '~'
array_users_pts     TIMES 5  dd -1

;Usuarios en ranking
array_users         TIMES 11  dd '~'

.UDATA
players         resd 1              
;Cantidad de jugadores ingame
nickname        resb 1              
;Nicknames de cada usuario
result          resb 1  
answer          resb 1
option          resd 1

.CODE

;******************************************* 
;MACRO:
;******************************************* 

%macro five_questions 0
    cmp EAX,0
    je  %%0
    cmp EAX,1
    je  %%1
    cmp EAX,2
    je  %%2
    cmp EAX,3
    je  %%3
    cmp EAX,4
    je  %%4
    cmp EAX,5
    je  %%5
%%0:
    PutStr question0
    jmp %%done_fq
%%1:
    PutStr question1
    jmp %%done_fq
%%2:
    PutStr question2
    jmp %%done_fq
%%3:
    PutStr question3
    jmp %%done_fq
%%4:
    PutStr question4
    jmp %%done_fq
%%5:
    PutStr question5
    jmp %%done_fq
%%done_fq:
%endmacro

;******************************************* 
;MACRO:
;******************************************* 
%macro ten_questions 0
    cmp EAX,6
    je  %%6
    cmp EAX,7
    je  %%7
    cmp EAX,8
    je  %%8
    cmp EAX,9
    je  %%9
    cmp EAX,10
    je  %%10
%%6:
    PutStr question6
    jmp %%done_tq
%%7:
    PutStr question7
    jmp %%done_tq
%%8:
    PutStr question8
    jmp %%done_tq
%%9:
    PutStr question9
    jmp %%done_tq
%%10:
    PutStr question10
    jmp %%done_tq
%%done_tq:
%endmacro

.STARTUP                    
    sub     EAX,EAX             ;Se limpian los registros      
    sub     EBX,EBX
    sub     ECX,ECX         
    sub     EDX,EDX
    sub     ESI,ESI
    sub     EDI,EDI
    mov     ECX,players
    PutStr  msj_prompt0         ;Mensaje general                
show_menu:
    PutStr  msj_menu
    PutStr  msj_op1
    PutStr  msj_op2
    PutStr  msj_op3
ask_menu_option:
    PutStr  msj_prompt4        ;Pregunta la opcion del menu
    GetInt  DX 
compare_option:
    cmp     DX,1
    je      players_count
    cmp     DX,2
    je      ranking
    cmp     DX,3
    je      done
ranking:
    PutStr  msj_prompt5
    nwln
    jmp     show_menu
players_count:
    PutStr  msj_prompt1         ;Pregunta cuantos jugadores jugaran
    GetInt  CX  
get_nickname:
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname            ;Lo adquiere
    dec     CX
    sub     EAX,EAX  
    mov     EAX,nickname
    mov     [array_ingame_users+ESI*4],EAX
    inc     ESI
    cmp     CX,0
    jne     get_nickname
get_random_number:
    rdtsc                       ;Hora del computador para generar el random
    sub     EDX, EDX
    mov     ECX, 10-0+1         ;Numeros random de 0 a 30
    div     ECX
    mov     EAX,EDX             ;PutLInt EAX
    nwln
    call question_selection
get_answer_user:
    PutStr  msj_prompt6
    GetStr  answer
    mov     EDX,answer
    cmp     EDX,byte[array_resp+EAX]
    jne     get_answer_user
done:
    .EXIT

;******************************************* 
;PROCEDURE:
;*******************************************    
question_selection:
    cmp AL,5
    jg question_selection2
    five_questions  
    jmp return 
question_selection2:
    cmp AL,10
    jg question_selection3
    ten_questions
    jmp return 
question_selection3:

return:
    ret

