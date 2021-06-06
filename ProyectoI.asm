;Tecnológico de Costa Rica, Campus Tecnológico de Cartago, Escuela de Computación, Arquitectura de Computadoras (IC3101).
;Proyecto I
;Trivia 
;Mónica María Alfaro Parrales,         2020132572
;Jennifer Soledad Alvarado Brenes,     2020124171
;Sabado 05 de mayo de 2021, I Semestre, Esteban Arias Méndez.


%include "io.mac" 

.DATA
;Mensajes generales
msj_prompt0  db '~Bienvenido a su juego de Trivia preferido~',0AH,0
msj_menu     db '~~~~~~~~~~~~~~~~~~~Menu~~~~~~~~~~~~~~~~~~~~',0AH,0
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
msj_prompt10 db 'Turno: ',0AH,0
msj_prompt11 db '~Al ingresar una respuesta hagalo insertando las opciones dadas: a,b,c,d o las opciones: v,f.',0AH,0
msj_prompt12 db '~Usted puede salir en cualquier momento de la Trivia al ingresar la letra s.',0AH,0
msj_prompt13 db '~~~~~~~~~~~Instrucciones de uso~~~~~~~~~~~',0AH,0
msj_prompt14 db 'Los puntos de esta partida: ',0AH,0
decorator    db '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',0AH,0
points       db ':',0AH,0

;Preguntas
question0  db 'Costa Rica es el pais mas grande de Centroamerica: verdadero o falso',0AH,0
question1  db '¿Cual es el canton en el que se encuentra el volcan Poas? a) Poas b) Alajuela c) Perez Zeledon d) Sabanilla',0AH,0
question2  db '¿A que canton pertenece el distrito de Vargas Araya? a) Montes de Oca b) Desamparados c) Alajuelita d) Poas',0AH,0
question3  db 'Desamparados es el canton mas grande de Costa Rica: verdadero o falso',0AH,0
question4  db 'El distrito de Sabanilla pertenece al canton de Montes de Oca: verdadero o falso',0AH,0
question5  db '¿En cual billete aparece Carmen Lyra? a) 20 mil b) 10 mil c) 5 mil d) 50 mil',0AH,0
question6  db '¿Cuantas veces ha sido campeon el Deportivo Saprissa? a) 26 b) 31 c) 21 d) 36 ',0AH,0
question7  db 'La Asamblea legislativa posee 56 diputados: verdadero o falso',0AH,0
question8  db 'Los parques nacionales ocupan el siguiente porcentaje de superficie del pais: a) 11% b) 13% c) 12% d) 15%',0AH,0
question9  db 'Costa Rica es un pais sin ejercito: verdadero o falso',0AH,0
question10 db 'La mayor actividad tectonica se da entre las placas: a) Cocos y Caribe b) Cocos y Pacifico c) Mangos y Caribe d) Pacifico y Nazca',0AH,0
question11 db 'A las tierras de relleno en Costa Rica, donde se recogen los sedimentos que vienen de las montañas, las conocemos como llanuras: verdadero o falso',0AH,0
question12 db 'El próximo 15 de setiembre Costa Rica estará celebrando su bicentenario: verdadero o falso',0AH,0
question13 db 'El pueblo indígena Miskitu pertenece a Costa Rica: verdadero o falso',0AH,0
question14 db 'El Volcán de Fuego se encuentra en la Cordillera Volcánica Central de Costa Rica: verdadero o falso',0AH,0
question15 db 'El himno nacional de Costa Rica fue compuesto por Manuel María Gutiérrez Flores: verdadero o falso',0AH,0
question16 db 'El Ave Nacional de Costa Rica es el quetzal: verdadero o falso',0AH,0
question17 db 'El Parque Nacional Corcovado es un parque nacional de Costa Rica: verdadero o falso',0AH,0
question18 db 'Guanacaste se anexó a Costa Rica el 25 de julio de 1824: verdadero o falso',0AH,0
question19 db 'Costa Rica limita al sur con Nicaragua: verdadero o falso',0AH,0
question20 db 'El escudo nacional de Costa Rica tiene 8 estrellas: verdadero o falso',0AH,0
question21 db 'El punto es un baile típico de Costa Rica: verdadero o falso',0AH,0
question22 db 'En Costa Rica hay casi 200 volcanes: verdadero o falso',0AH,0
question23 db 'El gallo pinto es una comida típica de Costa Rica: : verdadero o falso',0AH,0
question24 db 'El país de Costa Rica está formado por 7 provincias y ¿cuántos cantones? a) 76 b) 38 c) 82 d) 57',0AH,0
question25 db 'Las provincias de Costa Rica son: a) 12 b) 11 c) 20 d) 7',0AH,0
question26 db 'Uno de los símbolos nacionales de Costa Rica es: a) La carreta b) El tucán c) La mariposa morfo d) Ninguna de las anteriores',0AH,0
question27 db 'Los parques nacionales de Costa Rica son: a) 35 b) 27 c) 42 d) 13',0AH,0
question28 db 'El río más grande de Costa Rica es: a) Sixaola b) Tempisque c) Reventazón d) Grande de Térraba',0AH,0
question29 db 'El felino más grande de Costa Rica es: a) El león b) El jaguar c) El puma d) El chita',0AH,0
question30 db '¿Cuál de estos volcanes de Costa Rica se encuentra activo? a) Poás b) Barva c) Chato d) Cerro Pelón',0AH,0
question31 db 'En Costa Rica se conoce como grano de oro a: a) Los garbanzos b) El arroz c) El maíz d) El café',0AH,0
question32 db 'La flor nacional de Costa Rica es: a) La margarita b) El clavel rosado c) La guaria morada d) El tulipán',0AH,0
question33 db 'Una serpiente venenosa de Costa Rica es: a) La cobra b) La coral c) La boa d) La cascabel',0AH,0
question34 db 'Cartago lleva sin ser campeon la siguiente cantidad de años: a) 78 b) 67 c) 82 d) 80',0AH,0
question35 db 'Cuando emergen la Cordillera de Guanacaste y la Sierra Volcánica de Tilarán, después de las tierras más viejas, se formó un grupo de islas llamadas: a) Isla del Coco b) Isla Guanarivas c) Isla Tortuga d) Isla Rivas',0AH,0
question36 db 'En general, las primeras tierras que emergieron en Costa Rica están en Bahia Santa Elena: verdadero o falso',0AH,0
question37 db 'Según los estudios más aceptados la etnia y cultura indígena que migró desde el norte hasta Costa Rica fue: a) Boutos b) Malekus c) Chorotegas d) Huetares',0AH,0
question38 db 'El presidente que abolio la pena de muerte fue Tomas Guardia: verdadero o falso',0AH,0
question39 db 'EL fundador y primer presidente de la Republica fue: a) Tomas Guardia b) Jose Maria Castro Madriz c) Clodomiro Picado d) Mario Echandi',0AH,0
question40 db 'El presidente de Costa Rica que fue electo sin haber sido candidato fue Otilio Ulate: verdadero o falso',0AH,0
question41 db 'La escritora de "Cuentos de mi Tia Panchita" fue: a) Carmen Lyra b) Yolanda Oreamuno c) Sandra Cauffman d) Marcela Rey"',0AH,0
question42 db 'Franklyn Chang fue el primer costarricense en trabajar en la NASA: verdadero o falso',0AH,0
question43 db 'El tranvía eléctrico de San José fue inaugurado en el año: a) 1898 b) 1990 c) 2001 d) 1999',0AH,0
question44 db 'Sandra Cauffman fue la primera costarricense en trabajar en la NASA: verdadero o falso',0AH,0
question45 db 'La capital de Costa Rica es: a) Madrid b) Buenos Aires c) San Jose d) Santiago',0AH,0
question46 db 'Gloria Bejarano diseño la bandera de Costa Rica: verdadero o falso',0AH,0
question47 db 'El año de la independecia de Costa Rica fue: a) 1820 b) 1821 c) 1600 d) 1870',0AH,0
question48 db 'La bandera de Costa Rica estuvo inspirada en la bandera de Canada: verdadero o falso',0AH,0
question49 db 'El año en que se descubrio Costa Rica fue: a) 1500 b) 1600 c)1505 d) 1502',0AH,0
question50 db 'El primer contrato ferrocarrilero se hizo en 1860: verdadero o falso',0AH,0
                                           
;Respuestas
array_resp   db 'f','a','a','v','v','b','d','f','c','v','a','v','v','f','f','v','f','v','v','f','f','v','v','v','c','d','a','b','d','b','a','d','c','d','d','b','v','c','v','b','f','a','v','d','v','c','f','b','f','d','f'

;Puntos por pregunta
array_pts    dd  1,  2,  2,  1,  1,  2,  2,  1,  2,  1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  2,  1,  2,  1,  2,  1,  2,  1,  2,  1,  2,  1,  2,  1
;                0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50

;Preguntas ya respondidas
array_done_quest           TIMES 51  dd 51

;Usuarios jugando actualmente
array_ingame_users         TIMES 4   dd '~'
array_ingame_users_pts     TIMES 4   dd 0

;Usuarios en ranking
array_users_ranking        TIMES 11  dd '~'
array_pts_ranking          TIMES 11  dd 0

.UDATA
players     resd 1              ;Cantidad de jugadores ingame
nickname1   resd 3              ;Nickname de usuario
nickname2   resd 3              ;Nickname de usuario
nickname3   resd 3              ;Nickname de usuario
answer      resb 1              ;Respuestas dadas por los usuarios
option      resd 1              ;Opciones escogidas del menu

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
    PutStr  msj_prompt0
    nwln
    PutStr  msj_prompt13
    PutStr  msj_prompt12
    PutStr  msj_prompt11
    nwln                       
show_menu:                      ;Muestra las opciones del menu
    PutStr  msj_menu
    PutStr  msj_op1
    PutStr  msj_op2
    PutStr  msj_op3
ask_menu_option:
    PutStr  msj_prompt4         ;Pregunta la opcion del menu
    GetInt  DX                  ;La guarda en DX
compare_option:
    cmp     DX,1                ;Si escoge 1, inicia el juego
    je      players_count
    cmp     DX,2                ;Si escoge 2, muestra el ranking
    je      ranking
    cmp     DX,3                ;Si escoge 3 termina el programa
    je      done
ranking:
    sub     EDX,EDX
    nwln
    PutStr  msj_prompt5
    nwln
    jmp     done
players_count:
    sub     EDX,EDX
    PutStr  msj_prompt1         ;Pregunta cuantos jugadores jugaran
    GetInt  CX                  ;Lo guarda en CX
    mov     [players],CX        ;Lo guarda en la variable players
get_nickname:
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname1           ;Lo adquiere
    mov     EAX,nickname1       ;Lo mueve al registro EAX para moverlo al array de usuarios jugando
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
    inc     ESI
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname2           ;Lo adquiere
    mov     EAX,nickname2       ;Lo mueve al registro EAX para moverlo al array de usuarios jugando
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
    inc     ESI
    PutStr  msj_prompt2         ;Pide el nickname
    GetStr  nickname3           ;Lo adquiere
    mov     EAX,nickname3       ;Lo mueve al registro EAX para moverlo al array de usuarios jugando
    mov     [array_ingame_users+ESI*4],EAX
    dec     CX
    cmp     CX,0
    je      get_random_number
get_random_number:
    rdtsc                       ;Hora del computador para generar el random
    sub     EDX, EDX
    mov     ECX, 50-0+1         ;Numeros random de 0 a 50
    div     ECX
    mov     EAX,EDX             ;Guarda el numero random en EAX
    sub     EBX,EBX
analize_next_turn:
    cmp     dword[players],ESI  ;Compara si el valor de ESI es igual a la cantidad de jugadores actuales
    je      restart_ESI         ;De ser asi, se reinica ESI para que reinicie el contador de turnos
get_turno:   
    nwln
    PutStr  msj_prompt10        ;Muestra a quien le toca responder por turno
    PutStr  dword[array_ingame_users+ESI*4] 
    inc     ESI                 ;Incrementa ESI que representa el contador de turnos
get_answered_questions:
    cmp     dword[array_done_quest+EBX*4],51 ;Si se topa con un 51, significa que llego al final del array
    je      clear_question      ;Eso significa que la pregunta no esta en el array de preguntas ya respondidas
    cmp     EBX,50              ;Si ya hay 51 preguntas en el array de preguntas respondidas
    je      trivia_done1        ;Significa que ya se terminaron todas las preguntas y ya fueron respondidas
    cmp     dword[array_done_quest+EBX*4],EAX ;Si la pregunta ya existe en el array, se genera otro numero random
    je      get_random_number
    inc     EBX                
    jmp     get_answered_questions
clear_question:
    nwln
    call    question_selection  ;Llama al procedure encargado de mostrar la pregunta random
get_answer_user:
    PutStr  msj_prompt6
    GetCh   [answer]            ;Se adquiere la respuesta del usuario
    mov     DL,byte[answer]     ;Se mueve al registro DL
    cmp     DL,'s'              ;Si la respuesta fue 's', significa salir
    je      trivia_done1        ;Va al label trivia_done1 que es para salir del juego
    cmp     byte[array_resp+EAX],DL ;Si la respuesta es correcta
    je      is_correct
    PutStr  msj_prompt8
    jmp     get_random_number   ;Si no es correcta, entonces se llama al generador de numeros random para mostrar otra pregunta
is_correct:
    sub     EDX,EDX
    PutStr  msj_prompt7
    mov     dword[array_done_quest+EDI*4],EAX ;Si la respuesta ingresada es correcta, se mueve la pegunta al array de preguntas ya respondidas
    mov     EDX,dword[array_pts+EAX*4] ;Se mueven los puntos correspondientes al puntaje por la pregunta
    add     dword[array_ingame_users_pts+(ESI-1)*4],EDX ;Para sumarselos al usuario que la respondio
    inc     EDI                 ;Incrementa EDI que es el puntero en el array de preguntas ya respondidas
    jmp     get_random_number   ;Se llama al generador de numeros random para mostrar otra pregunta
trivia_done1:
    sub     EDX,EDX             ;Se limpia el EDX
    nwln
    PutStr  msj_prompt9
    PutStr  msj_prompt14
    jmp     points_per_user     ;Se llama al label que mostraria los los puntos de esta partida
trivia_done2:
    jmp     ranking             ;Salta al label que muestra el ranking
restart_ESI:
    sub     ESI,ESI             ;Reinicia ESI para los turnos
    jmp     get_turno           ;Salta al label de los turnos
points_per_user:
    cmp     EDX,dword[players]  ;Si EDX es igual a la cantidad de jugadores, deja de mostrar puntajes
    je      trivia_done2        ;Salta al label que mostraria los datos del ranking
    PutStr  dword[array_ingame_users+EDX*4] ;Muestra el nombre del usuario en juego
    PutStr  points              
    PutLInt dword[array_ingame_users_pts+EDX*4] ;Muestra el puntaje del usuario en juego
    nwln
    inc     EDX
    jmp     points_per_user   
done:
    .EXIT

;******************************************* 
;PROCEDURE:
;This procedure works as a switch to direct the 
;random number generated of the questions 
;in order to show them according to the number generated in
;groups of 5.
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