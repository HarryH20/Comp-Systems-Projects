; Author:                  Harrison Hassler
; Assignment Title:        P5_1 Weighted Average
; Assignment Description:  Develop a solution
;                          that will prompt the
;                          user for four scores,
;                          and four weights for each
;                          of the scores. Calculate
;                          the weighted sum, the sum
;                          of the weights, and the
;                          weighted average. 
;                          Display the weighted sum
;                          and average on two lines
;                          of a message box, each line with
;                          an appropriate label.
; Due Date:                10/22/2022
; Date Created:            10/22/2022
; Date Last Modified:      10/22/2022


.586
.MODEL FLAT

INCLUDE io.h                                  ; header file for input/output

.STACK 4096

.DATA
score1        DWORD   ?
score2        DWORD   ?
score3        DWORD   ?
score4        DWORD   ?
promptScore1  BYTE    "Enter first score", 0
promptScore2  BYTE    "Enter second score", 0
promptScore3  BYTE    "Enter third score", 0
promptScore4  BYTE    "Enter fourth score", 0
promptWeight1 BYTE    "Enter weight for first score", 0
promptWeight2 BYTE    "Enter weight for second score", 0
promptWeight3 BYTE    "Enter weight for third score", 0
promptWeight4 BYTE    "Enter weight for fourth score", 0
string        BYTE    40 DUP (?)
resultLbl     BYTE    "Result:", 0
resultWSum    BYTE    "The weighted sum is:", 20h
weightedSum   BYTE    11 DUP (?), 0dh
resultASum    BYTE    "The average is:", 20h
average       BYTE    11 DUP(?), 0

.CODE
_MainProc PROC
        input   promptScore1, string, 40      ; prompt for first score
        atod    string                        ; convert to integer
        mov     score1, eax                   ; copy to score1
        
        input   promptWeight1, string, 40     ; prompt for first weight
        atod    string                        ; convert to integer
        mov     ebx, eax                      ; copy to ebx
        imul    eax, score1                   ; multiply first score and weight
        mov     ecx, eax                      ; copy to ecx
        
        

        input   promptScore2, string, 40      ; prompt for second score
        atod    string                        ; convert to integer
        mov     score2, eax                   ; copy to score2

        input   promptWeight2, string, 40     ; prompt for second weight
        atod    string                        ; convert to integer
        add     ebx, eax                      ; add to sumOfWeights
        imul    eax, score2                   ; multiply second score by weight
        add     ecx, eax                      ; add to weightedSum
        

        input   promptScore3, string, 40      ; prompt for third score
        atod    string                        ; convert to integer
        mov     score3, eax                   ; copy to score3

        input   promptWeight3, string, 40     ; prompt for third weight
        atod    string                        ; convert to integer
        add     ebx, eax                      ; add to sumOfWeights
        imul    eax, score3                   ; multiply third score and weight
        add     ecx, eax                      ; add to weightedSum

        input   promptScore4, string, 40      ; prompt for fourth weight
        atod    string                        ; convert to string
        mov     score4, eax                   ; copy to score4

        input   promptWeight4, string, 40     ; prompt for fourth weight
        atod    string                        ; convert to integer
        add     ebx, eax                      ; add to sumOfWeights
        imul    eax, score4                   ; multiply fourth score and weight
        add     ecx, eax                      ; add to weightedSum
        

        mov     eax, ecx                      ; copy weightedSum to eax
        sub     edx, edx                      ; clear edx
        div     ebx                           ; weightedSum/sumOfWeights
        

        dtoa    weightedSum, ecx              ; convert to ASCII characters
        dtoa    average,    eax               ; convert to ASCII characters
        output  resultLbl, resultWSum         ; Display the weighted sum and average
                                              ; on two lines of a message box

        sub     eax, eax                      ; clear eax
        ret                                   ; return 
_MainProc ENDP
END                                           ; end of source code

