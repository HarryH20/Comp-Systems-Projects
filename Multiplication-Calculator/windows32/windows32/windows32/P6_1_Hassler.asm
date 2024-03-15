; Author:                 Harrison Hassler
; Assignment Title:       P6_1 Product of Positives
; Assignment Description: Write an entire assembly language
;                         program that will prompt the user
;                         to enter a series of ten 16-bit values,
;                         calculating the product of all positive,
;                         non-zero values. Display the product of
;                         ten numbers and the number of zeros entered.
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
label1      BYTE    "Product of 10 numbers is "
product     BYTE    11 DUP (?), 0dh, 0ah
label2      BYTE    "Number of zeros is "
zeroes      BYTE    6 DUP (?), 0

.CODE
_MainProc PROC 
                   mov      ebx, 1              ; copy 1 to ebx
                   mov      dx, 0               ; copy 0 to dx
                   mov      cx, 10              ; loop 10 times

forIndex:                 
                   input    prompt1, string, 20 ; read ASCII characters     
                   atow     string              ; convert to integer                 
                   cmp      ax, 0               ; compare number entered to 0
                   jnz      multiply            ; if it is not 0 jump to multiply
                   inc      dx                  ; increment zero count 
                   jmp      forIndex            ; jmp to forIndex

multiply:                
                   movzx    eax, ax             ; move to bigger register
                   imul     ebx, eax            ; multiply product
                   loop     forIndex            ; jump to forIndex

                   dtoa     product, ebx        ; convert to ASCII characters                         
                   wtoa     zeroes, dx          ; convert to ASCII characters
                   output   labelBuffer, label1 ; output label and answers
                   sub      eax, eax            ; clear eax
 ret                                            ; exit with return code 0
_MainProc ENDP
END                                             ; end of source code