global _start

section .data
	num1 db 50 ; First 8-bit number (example: 0Ah)
	num2 db 2 ; Second 8-bit number (example: 05h)
	result dw 0 ; Memory location to store the result (16-bit)



section .text


_start:
	
	mov al, [num1] ; Load first 8-bit number into AL

	mov bl, [num2] ; Load second 8-bit number into BL
	
	mul bl ; Multiply AL by BL, result in AX

	; Store the result
	mov [result], ax ; Store the result in memory (AX is 16-bit)

	
	mov eax, 1 ; syscall number for exit (sys_exit)
	xor ebx, ebx ; exit code 0
	int 80h ; invoke syscall
	