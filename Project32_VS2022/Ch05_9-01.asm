;--------------------------------------------------------------
; Program: Chapter 5.9 #1 - Print Same Message in 4 Colors
; Purpose:
;   - Prints the same message 4 times.
;   - Each time it changes the text color before printing.
;   - Uses a loop and the Irvine32 SetTextColor procedure.
;--------------------------------------------------------------

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
message BYTE "Same string, different color.", 0

; A list (array) of 4 color values we want to use.
; These color names come from Irvine32.inc.
colorList BYTE lightRed, lightGreen, lightCyan, yellow

.code
main PROC

    ; ESI will point at the current color in colorList
    mov esi, OFFSET colorList

    ; ECX is the loop counter (how many times to repeat)
    mov ecx, LENGTHOF colorList      ; = 4

PrintMessageInNextColor:

    ; Load the next color (a BYTE) from memory into EAX
    ; movzx = "move with zero-extend" so EAX becomes 0..255 cleanly
    movzx eax, BYTE PTR [esi]

    ; Set the console text color using Irvine32
    call SetTextColor

    ; Print the message
    mov edx, OFFSET message
    call WriteString
    call Crlf

    ; Move to the next color in the list
    inc esi

    ; LOOP does: ECX = ECX - 1, and if ECX != 0, jump back to the label
    loop PrintMessageInNextColor

    ; Pause so you can see output (good for screenshots)
    call WaitMsg

    invoke ExitProcess, 0
main ENDP

END main