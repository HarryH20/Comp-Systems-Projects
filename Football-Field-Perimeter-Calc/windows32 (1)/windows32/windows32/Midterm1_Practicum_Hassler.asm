; Author:                  Harrison Hassler
; Assignment Title:        Midterm1-Practicum
; Assignment Description:  This assembly langauge
;                          program calculates the perimeter
;                          of a football field based on the
;                          3 user inputs.
; Due Date:                9/30/2023
; Date Created:            9/29/2023
; Date Last Modified:      9/29/2023

.586
.MODEL FLAT

INCLUDE io.h                             ; header file for input/output

.STACK 4096

.DATA
number1 DWORD   ?
number2 DWORD   ?
number3 DWORD   ?
prompt1 BYTE    "Enter the length of the field", 0
prompt2 BYTE    "Enter the length of the endzones", 0
prompt3 BYTE    "Enter the width of the field", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The perimeter is", 0
perimeter     BYTE    11 DUP (?), 0

                                         ; using 32-bit
.CODE
_MainProc PROC
        input   prompt1, string, 40      ; prompt user for 1st input
        atod    string                   ; convert to integer
        add     eax, eax                 ; double field length
        mov     ebx, eax;                ; move length to ebx

        input   prompt2, string, 40      ; prompt user for 2nd input
        atod    string                   ; convert to integer
        add     eax, eax                 ; double endzone length
        add     eax, eax                 ; double again  
        add     ebx, eax                 ; add length to ebx
        
        input   prompt3, string, 40      ; prompt user for 3rd input
        atod    string                   ; convert to integer
        add     eax, eax                 ; double width
        add     ebx, eax                 ; add width to ebx

        dtoa    perimeter, ebx           ; convert to ASCII characters
        output  resultLbl, perimeter     ; output label and perimeter

        sub     eax, eax                 ; exit with return code 0
        ret
_MainProc ENDP
END                                      ; end of source code

