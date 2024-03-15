; Author:                 Harrison Hassler
; Assignment Title:       P6_2 Sum Input Values
; Assignment Description: Write an entire assembly language
;                         program that will prompt the user to
;                         enter a series of 16-bit values, summing
;                         the input values.  Continue prompting the
;                         user for values until the sum of the input
;                         values exceeds 5,000 or until ten zeroes
;                         have been input and processed. Display
;                         the sum of all values entered and the
;                         number of zeros entered.
; Due Date:               11/7/2023
; Date Created:           11/1/2023
; Date Last Modified:     11/3/2023

.586
.MODEL FLAT

INCLUDE io.h            

.STACK 4096

.DATA
prompt1     BYTE    "Enter a number", 0
string      BYTE    20 DUP (?)
labelBuffer BYTE    20 DUP (?)
resultLbl   BYTE    "The sum of 10 numbers is "
sum         BYTE    6 DUP (?), 0dh, 0ah
result2Lbl  BYTE    "Number of zeros is "
zeroes      BYTE    6 DUP (?), 0

.CODE
_MainProc PROC 
                    sub    bx, bx                  ; clear bx

whileSum:                 
                    cmp    cx, 10                  ; compare zero count to 10
                    je     endWhile                ; jump to endWhile if equal
                    cmp    bx, 5000                ; compare bx to 5000
                    jg     endWhile                ; jump if bx > 5000
                    input  prompt1, string, 20     ; read ASCII characters     
                    atow   string                  ; convert to integer                 
                    cmp    ax, 0                   ; compare ax to 0
                    jne    addNum                  ; jump to addNum if not equal
                    inc    cx                      ; increment zero count

addNum:                   
                    add    bx, ax                  ; add to sum
                    jmp    whileSum                ; jump to whileSum
                          
endWhile:                 
                    wtoa   sum, bx                 ; convert to ASCII characters
                    wtoa   zeroes, cx              ; convert to ASCII characters
                    output labelBuffer, resultLbl  ; output label and answers
                    sub    ax, ax                  ; clear ax
 ret                                               ; exit with return code 0
_MainProc ENDP
END                                                ; end of source code