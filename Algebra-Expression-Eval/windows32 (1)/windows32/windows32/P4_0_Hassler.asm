; Author:                  Harrison Hassler
; Assignment Title:        P4_0 Evaluate an Expression
; Assignment Description:  Develop a solution that will
;                          evaluate the following expression
;                          as efficiently as possible.
;
;                          5x + 5y - 2z
;
; Due Date:                10/12/2023
; Date Created:            10/10/2023
; Date Last Modified:      10/10/2023

.586
.MODEL FLAT

INCLUDE io.h                             ; header file for input/output

.STACK 4096                              ; reserve 4096-byte stack 

.DATA                                    ; reserve storage for data

prompt1 BYTE    "Enter the number of apples", 0
prompt2 BYTE    "Enter the number of oranges", 0
prompt3 BYTE    "Enter the number of bananas", 0
string  BYTE    40 DUP (?)
result  BYTE    "The solution is", 0
sum     BYTE    11 DUP (?), 0

.CODE                                    ; beginning of code
_MainProc PROC
        input   prompt1, string, 40      ; prompt/read number of apples
        atod    string                   ; convert to integer
        mov     ebx, eax                 ; copy to ebx

        input   prompt2, string, 40      ; prompt/read number of oranges
        atod    string                   ; convert to integer
        add     ebx, eax                 ; add oranges and apples together
        mov     eax, ebx                 ; copy to eax

        add     ebx, ebx                 ; double oranges and apples
        add     ebx, ebx                 ; double again
        add     ebx, eax                 ; add once more

        input   prompt3, string, 40      ; prompt/read number of bananas
        atod    string                   ; convert to integer
        add     eax, eax                 ; double bananas

        sub     ebx, eax                 ; subtract total bananas
        
       
        dtoa    sum, ebx                 ; convert to ASCII characters
        output  result, sum              ; output label and sum

        sub     eax, eax                 ; exit with return code 0
        ret
_MainProc ENDP
END                                      ; end of source code

