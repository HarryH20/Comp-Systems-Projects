; Author:                 Harrison Hassler
; Assignment Title:       P6_3 Min-max array
; Assignment Description: Write an entire assembly
;                         language program that will
;                         prompt the user to enter
;                         twenty 32-bit values.
;                         Store them in an array and
;                         print the minimum and maximum
;                         values entered.
; Due Date:               11/7/2023
; Date Created:           11/1/2023
; Date Last Modified:     11/7/2023

.586
.MODEL FLAT

INCLUDE io.h                              ; header file for input/output

.STACK 4096

.DATA
array     DWORD   20 DUP(?)
prompt1   BYTE    "Enter a number", 0
string    BYTE    30 DUP (?)
labelBuff BYTE    20 DUP (?)
minOutput BYTE    "Min Value: "
minValue  BYTE    11 DUP (?), 0dh, 0ah
maxOutput BYTE    "Max Value: "
maxValue  BYTE    11 DUP(?), 0


.CODE
_MainProc PROC
             lea    ebx, array            ; load array address
             mov    ecx, 20               ; loop 20 times
                  
inputLoop:   
             input  prompt1, string, 30   ; read ASCII characters
             atod   string                ; convert to integer
             mov    [ebx], eax            ; move to ebx array
             add    ebx, 4                ; move to next memory location
             loop   inputLoop             ; loop to inputLoop

             lea    ebx, array            ; load array address
             mov    eax, [ebx]            ; set min value
             mov    edx, [ebx]            ; set max value
             add    ebx, 4                ; move to next memory location

             mov    ecx, 19               ; loop 19 times

minMaxLoop: 
             cmp    [ebx], eax            ; compare number with current min
             jnl    skipMin               ; jump if not less
             mov    eax, [ebx]            ; if less set new current min

skipMin:
             cmp    [ebx], edx            ; compare number with current max
             jng    skipMax               ; jump if not greater
             mov    edx, [ebx]            ; if greater set new current max

skipMax:     
             add    ebx, 4                ; move to next memory location
             loop   minMaxLoop            ; loop to minMaxLoop
    
             dtoa   minValue, eax         ; convert to ASCII characters
             dtoa   maxValue, edx         ; convert to ASCII characters
             output labelBuff, minOutput  ; output label and min and max

             sub    eax, eax              ; clear eax
             ret                          ; exit with return code 0
_MainProc ENDP
END                                       ; end of source code

