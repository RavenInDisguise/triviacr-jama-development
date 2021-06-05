;Sorting integers using quicksort             QSORT.ASM
;
;        Objective: Sorts an array of integers using 
;                   quick sort. Uses recursion.
;            Input: Requests integers from the user.
;                   Terminated by entering zero.
;           Output: Outputs the sorted arrray.
                  
%include "io.mac"

.DATA
prompt_msg  db  "Ingrese enteros. ",0DH,0AH
            db  "Ingresar un cero terminara la entrada.",0
output_msg  db  "De mayor a menor: ",0

.UDATA
array1      resw  200

.CODE
      .STARTUP
      PutStr  prompt_msg     ; request the number
      nwln
      mov     EBX,array1
      xor     EDI,EDI        ; EDI keeps a count of 
read_more:                   ;     input numbers
      GetInt  AX             
      mov     [EBX+EDI*2],AX ; store input # in array
      cmp     AX,0           ; test if it is zero
      je      exit_read
      inc     EDI             
      jmp     read_more

exit_read:
      ; prepare arguments for procedure call
      mov     EBX,array1
      xor     ESI,ESI        ; ESI = lo index
      dec     EDI            ; EDI = hi index
      call    qsort

      PutStr  output_msg     ; output sorted array
write_more:
      ; since qsort preserves all registers, we will 
      ; have valid EBX and ESI values.
      mov     AX,[EBX+EDI*2]
      cmp     AX,0
      je      done
      PutInt  AX
      nwln
      dec     EDI
      jmp     write_more

done:
      .EXIT

;-------------------------------------------------------
;Procedure qsort receives a pointer to the array in BX. 
;LO and HI are received in ESI and EDI, respectively.
;It preserves all the registers.
;-------------------------------------------------------

qsort:
      pushad   
      cmp     EDI,ESI
      jle     qsort_done     ; end recursion if hi <= lo

      ; save hi and lo for later use
      mov     ECX,ESI
      mov     EDX,EDI

      mov     AX,[EBX+EDI*2] ; AX = xsep

lo_loop:                        ;
      cmp     [EBX+ESI*2],AX    ;
      jge     lo_loop_done      ; LO while loop
      inc     ESI               ;
      jmp     lo_loop           ;
lo_loop_done:

      dec     EDI            ; hi = hi-1
hi_loop:
      cmp     EDI,ESI           ;
      jle     sep_done          ;
      cmp     [EBX+EDI*2],AX    ; HI while loop
      jle     hi_loop_done      ;
      dec     EDI               ;
      jmp     hi_loop           ;
hi_loop_done:

      xchg    AX,[EBX+ESI*2]    ;
      xchg    AX,[EBX+EDI*2]    ; x[i] <=> x[j]
      xchg    AX,[EBX+ESI*2]    ;
      jmp     lo_loop

sep_done:
      xchg    AX,[EBX+ESI*2]    ;
      xchg    AX,[EBX+EDX*2]    ; x[i] <=> x[hi]
      xchg    AX,[EBX+ESI*2]    ;
      
      dec     ESI
      mov     EDI,ESI           ; hi = i-1
      ; We modify the ESI value in the next statement.
      ; Since the original ESI value is in EDI, we use
      ; EDI to get i+1 value for the second qsort call.
      mov     ESI,ECX
      call    qsort

      ; EDI has the i value
      inc     EDI       
      inc     EDI
      mov     ESI,EDI           ; lo = i+1
      mov     EDI,EDX            
      call    qsort

qsort_done:
      popad
      ret  
