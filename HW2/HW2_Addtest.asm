; Chapter 3.9.2 Question 5 

.386
.model flat, stdcall
.stack 4096


.code
main PROC
    add eax, 5
    add edx, 5
    exit
main ENDP
END main