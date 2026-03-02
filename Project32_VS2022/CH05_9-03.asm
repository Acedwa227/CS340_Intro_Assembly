;--------------------------------------------------------------
; Program: Chapter 5.9 #3 - Add Two Integers
; Purpose:
;   - Clears the screen
;   - Moves the cursor near the middle
;   - Prompts user for two integers
;   - Adds them and displays the sum
;--------------------------------------------------------------

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
prompt1 BYTE "Enter the first integer: ",0
prompt2 BYTE "Enter the second integer: ",0
resultMsg BYTE "Sum = ",0

.code
main PROC
    ; Clear the console screen
    call Clrscr

    ; Move cursor near middle of screen (row, col)
    ; 25-row console: middle is around row 12
    ; 80-col console: middle is around col 30
    mov dh, 12          ; row
    mov dl, 30          ; column
    call Gotoxy

    ; Ask for first integer
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt        ; result goes into EAX
    mov ebx, eax        ; save first integer in EBX

    call Crlf

    ; Ask for second integer
    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt        ; EAX = second integer

    ; Add them: EAX = second + first
    add eax, ebx

    call Crlf
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

    call WaitMsg
    invoke ExitProcess, 0
main ENDP

END main