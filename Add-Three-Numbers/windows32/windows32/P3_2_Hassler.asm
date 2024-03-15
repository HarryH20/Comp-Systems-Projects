; Author: Harrison Hassler
; Assignment Title: P3_2 Add Three Values
; Assignment Description: develop an assembly language solution
; that will prompt the user for 3 32-bit integers,
; calculate the sum, and display the results to the screen
; Due Date: 9/26/2023
; Date Created: 9/25/2023
; Date Last Modified: 9/25/2023

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA

prompt1 BYTE         "Enter first number", 0
prompt2 BYTE         "Enter second number", 0
prompt3 BYTE         "Enter third number", 0
string BYTE 40 DUP (?)
resultLbl BYTE       "The sum is", 0
sum BYTE 11 DUP (?), 0

.CODE
_MainProc PROC

input prompt1, string, 40     ; read ASCII characters
atod string                   ; convert to integer
mov ebx, eax                  ; moves eax to ebx to clear eax

input prompt2, string, 40     ; read ASCII characters
atod string                   ; convert to integer

add ebx, eax                  ; add first number to ebx

input prompt3, string, 40     ; read ASCII characters
atod string                   ; convert to integer
add ebx, eax;                 ; adds third number to eax

dtoa sum, ebx                 ; convert to ASCII characters
output resultLbl, sum         ; output label and sum
mov eax, 0                    ; exit with return code 0
ret
_MainProc ENDP
END                           ; end of source code
