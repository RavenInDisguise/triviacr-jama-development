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
msj_prompt1  db 'Con cuantos jugadores desea jugar? Max 3: ',0
msj_prompt2  db 'Indique su nickname: ',0
msj_prompt3  db 'Desea salir? ',0
msj_prompt4  db 'Cual opcion desea realizar: ',0
msj_prompt5  db 'Ranking: ',0
msj_prompt6  db 'Su respuesta: ',0
msj_prompt7  db 'Su respuesta fue correcta!',0AH,0
msj_prompt8  db 'Su respuesta fue incorrecta!',0AH,0
msj_prompt9  db 'La trivia ha terminado!',0AH,0

;Preguntas
question0  db 'Costa Rica es el pais mas grande de Centroamerica: verdadero o falso',0AH,0
question1  db 'Cual es el canton en el que se encuentra el volcan Poas? a) Poas b) Alajuela c) Perez Zeledon d) Sabanilla',0AH,0
question2  db 'A que canton pertenece el distrito de Vargas Araya? a) Montes de Oca b) Desamparados c) Alajuelita d) Poas',0AH,0
question3  db 'Desamparados es el canton mas grande de Costa Rica: verdadero o falso',0AH,0
question4  db 'El distrito de Sabanilla pertenece al canton de Montes de Oca: verdadero o falso',0AH,0
question5  db 'En cual billete aparece Carmen Lyra? a)20 mil b)10 mil c)5 mil d)50 mil',0AH,0
question6  db 'q6',0AH,0
question7  db 'q7',0AH,0
question8  db 'q8',0AH,0
question9  db 'q9',0AH,0
question10 db 'q10',0AH,0
question11 db '',0AH,0
question12 db '',0AH,0
question13 db '',0AH,0
question14 db '',0AH,0
question15 db '',0AH,0
question16 db '',0AH,0
question17 db '',0AH,0
question18 db '',0AH,0
question19 db '',0AH,0
question20 db '',0AH,0
question21 db '',0AH,0
question22 db '',0AH,0
question23 db '',0AH,0
question24 db '',0AH,0
question25 db '',0AH,0
question26 db '',0AH,0
question27 db '',0AH,0
question28 db '',0AH,0
question29 db '',0AH,0
question30 db '',0AH,0
question31 db '',0AH,0
question32 db '',0AH,0
question33 db '',0AH,0
question34 db '',0AH,0
question35 db '',0AH,0
question36 db '',0AH,0
question37 db '',0AH,0
question38 db '',0AH,0
question39 db '',0AH,0
question40 db '',0AH,0
question41 db '',0AH,0
question42 db '',0AH,0
question43 db '',0AH,0
question44 db '',0AH,0
question45 db '',0AH,0
question46 db '',0AH,0
question47 db '',0AH,0
question48 db '',0AH,0
question49 db '',0AH,0
question50 db '',0AH,0

;Respuestas
array_resp   db 'f','a','a','v','v','b','a','a','a','a','a','a','a'

;Puntos por pregunta
array_pts   db 2,3,1,1

;Preguntas ya respondidas
array_done_quest    TIMES 51  dd 51

;Usuarios jugando actualmente
array_ingame_users  TIMES 4   dd '~'
array_users_pts     TIMES 4   dd -1

;Usuarios en ranking
array_users_ranking TIMES 11  dd '~'
array_pts_ranking   TIMES 11  dd -1

;Pruebas ########################################
prueba1 db 'Nums del array:',0AH,0
prueba2 db 'Num actual',0AH,0

.UDATA
players     resd 1              ;Cantidad de jugadores ingame
nickname1   resd 3              ;Nickname de cada usuario
nickname2   resd 3              ;Nickname de cada usuario
nickname3   resd 3              ;Nickname de cada usuario
answer      resb 1              ;Respuestas dadas por los usuarios
option      resd 1              ;Opciones escogidas del menu
value       resd 5
result      resb 1 

.CODE

;***********************MACROS*******************************

;******************************************* 
;MACRO: This macro goes from the questions 0-5 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
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
;MACRO: This macro goes from the questions 6-10 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
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

;******************************************* 
;MACRO: This macro goes from the questions 11-15 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro fifteen_questions 0
    cmp EAX,11
    je  %%11
    cmp EAX,12
    je  %%12
    cmp EAX,13
    je  %%13
    cmp EAX,14
    je  %%14
    cmp EAX,15
    je  %%15
%%11:
    PutStr question11
    jmp %%done_ftq
%%12:
    PutStr question12
    jmp %%done_ftq
%%13:
    PutStr question13
    jmp %%done_ftq
%%14:
    PutStr question14
    jmp %%done_ftq
%%15:
    PutStr question15
    jmp %%done_ftq
%%done_ftq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 16-20 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro twenty_questions 0
    cmp EAX,16
    je  %%16
    cmp EAX,17
    je  %%17
    cmp EAX,18
    je  %%18
    cmp EAX,19
    je  %%19
    cmp EAX,20
    je  %%20
%%16:
    PutStr question16
    jmp %%done_twq
%%17:
    PutStr question17
    jmp %%done_twq
%%18:
    PutStr question18
    jmp %%done_twq
%%19:
    PutStr question19
    jmp %%done_twq
%%20:
    PutStr question20
    jmp %%done_twq
%%done_twq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 21-25 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro twentyfive_questions 0
    cmp EAX,21
    je  %%21
    cmp EAX,22
    je  %%22
    cmp EAX,23
    je  %%23
    cmp EAX,24
    je  %%24
    cmp EAX,25
    je  %%25
%%21:
    PutStr question21
    jmp %%done_twfq
%%22:
    PutStr question22
    jmp %%done_twfq
%%23:
    PutStr question23
    jmp %%done_twfq
%%24:
    PutStr question24
    jmp %%done_twfq
%%25:
    PutStr question25
    jmp %%done_twfq
%%done_twfq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 26-30 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro thirty_questions 0
    cmp EAX,26
    je  %%26
    cmp EAX,27
    je  %%27
    cmp EAX,28
    je  %%28
    cmp EAX,29
    je  %%29
    cmp EAX,30
    je  %%30
%%26:
    PutStr question26
    jmp %%done_thq
%%27:
    PutStr question27
    jmp %%done_thq
%%28:
    PutStr question28
    jmp %%done_thq
%%29:
    PutStr question29
    jmp %%done_thq
%%30:
    PutStr question30
    jmp %%done_thq
%%done_thq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 31-35 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro thirtyfive_questions 0
    cmp EAX,31
    je  %%31
    cmp EAX,32
    je  %%32
    cmp EAX,33
    je  %%33
    cmp EAX,34
    je  %%34
    cmp EAX,35
    je  %%35
%%31:
    PutStr question31
    jmp %%done_thfq
%%32:
    PutStr question32
    jmp %%done_thfq
%%33:
    PutStr question33
    jmp %%done_thfq
%%34:
    PutStr question34
    jmp %%done_thfq
%%35:
    PutStr question35
    jmp %%done_thfq
%%done_thfq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 36-40 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro forty_questions 0
    cmp EAX,36
    je  %%36
    cmp EAX,37
    je  %%37
    cmp EAX,38
    je  %%38
    cmp EAX,39
    je  %%39
    cmp EAX,40
    je  %%40
%%36:
    PutStr question36
    jmp %%done_foq
%%37:
    PutStr question37
    jmp %%done_foq
%%38:
    PutStr question38
    jmp %%done_foq
%%39:
    PutStr question39
    jmp %%done_foq
%%40:
    PutStr question40
    jmp %%done_foq
%%done_foq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 41-45 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro fortyfive_questions 0
    cmp EAX,41
    je  %%41
    cmp EAX,42
    je  %%42
    cmp EAX,43
    je  %%43
    cmp EAX,44
    je  %%44
    cmp EAX,45
    je  %%45
%%41:
    PutStr question41
    jmp %%done_fofq
%%42:
    PutStr question42
    jmp %%done_fofq
%%43:
    PutStr question43
    jmp %%done_fofq
%%44:
    PutStr question44
    jmp %%done_fofq
%%45:
    PutStr question45
    jmp %%done_fofq
%%done_fofq:
%endmacro

;******************************************* 
;MACRO: This macro goes from the questions 46-50 as a 
;switch in order to reduce the amount of times it is compared.
;*Entries: None
;*Function: Show the question 
;according to the random number generated.
;*Outs: A question for the user to answer.
;******************************************* 
%macro fifty_questions 0
    cmp EAX,46
    je  %%46
    cmp EAX,47
    je  %%47
    cmp EAX,48
    je  %%48
    cmp EAX,49
    je  %%49
    cmp EAX,50
    je  %%50
%%46:
    PutStr question46
    jmp %%done_fiq
%%47:
    PutStr question47
    jmp %%done_fiq
%%48:
    PutStr question48
    jmp %%done_fiq
%%49:
    PutStr question49
    jmp %%done_fiq
%%50:
    PutStr question50
    jmp %%done_fiq
%%done_fiq:
%endmacro

;********************FIN MACROS*****************************

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
    sub     EDX,EDX
    PutStr  msj_prompt5
    nwln
    jmp     show_menu
players_count:
    sub     EDX,EDX
    PutStr  msj_prompt1         ;Pregunta cuantos jugadores jugaran
    GetInt  CX  
get_nickname:
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname1           ;Lo adquiere
    mov     EAX,nickname1
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
    inc     ESI
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname2           ;Lo adquiere
    mov     EAX,nickname2
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
    inc     ESI
    PutStr  msj_prompt2        ;Pide el nickname
    GetStr  nickname3          ;Lo adquiere
    mov     EAX,nickname3
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
get_random_number:
    rdtsc                       ;Hora del computador para generar el random
    sub     EDX, EDX
    mov     ECX, 10-0+1         ;Numeros random de 0 a 50
    div     ECX
    mov     EAX,EDX           
    ;PutLInt EAX
get_answered_questions:
    cmp     dword[array_done_quest+EBX*4],51
    je      clear_question
    cmp     EBX,50
    je      trivia_done
    cmp     dword[array_done_quest+EBX*4],EAX
    je      get_random_number
    PutLInt dword[array_done_quest+EBX*4]
    inc     EBX
    jmp     get_answered_questions
clear_question:
    call    question_selection
get_answer_user:
    PutStr  msj_prompt6
    GetCh   [answer]
    mov     DL,byte[answer]
    cmp     byte[array_resp+EAX],DL
    je      is_correct
    PutStr  msj_prompt8
    jmp     get_random_number
is_correct:
    sub     EDX,EDX
    PutStr  msj_prompt7
    mov     dword[array_done_quest+EDI*4],EAX
    ;mov     EDX,dword[array_done_quest+EDI*4]
    inc     EDI
    ;PutLInt EDX
    ;PutLInt EDI
    jmp     get_random_number
trivia_done:
    PutStr  msj_prompt9
    jmp     ranking
done:
    .EXIT

;******************************************* 
;PROCEDURE:
;This procedure works as a switch to direct the 
;random number generated of the questions 
;in order to show them according to the number generated.
;*Entries: None
;*Function: Call the macro that shows the question 
;according to the number.
;*Outs: A question for the user to answer.
;*******************************************    
question_selection:
    sub     EBX,EBX  
    cmp     EAX,5
    jg      question_selection2
    five_questions  
    jmp     return 
question_selection2:
    cmp     EAX,10
    jg      question_selection3
    ten_questions
    jmp     return 
question_selection3:
    cmp     EAX,15
    jg      question_selection4
    fifteen_questions
    jmp     return 
question_selection4:
    cmp     EAX,20
    jg      question_selection5
    twenty_questions
    jmp     return
question_selection5:
    cmp     EAX,25
    jg      question_selection6
    twentyfive_questions
    jmp     return      
question_selection6:
    cmp     EAX,30
    jg      question_selection7
    thirty_questions  
    jmp     return 
question_selection7:
    cmp     EAX,35
    jg      question_selection8
    thirtyfive_questions
    jmp     return 
question_selection8:
    cmp     EAX,40
    jg      question_selection9
    forty_questions
    jmp     return 
question_selection9:
    cmp     EAX,45
    jg      question_selection10
    fortyfive_questions
    jmp     return
question_selection10:
    fifty_questions
    jmp     return      
return:
    ret

