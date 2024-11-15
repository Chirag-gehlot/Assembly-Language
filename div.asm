global _start

section .data

	dividend db 25 ; Dividend (example: 1Ah)
	divisor db 5 ; Divisor (example: 05h)
	quotient db 0 ; Memory location to store the quotient
	remainder db 0 ; Memory location to store the remainder

section .text

_start:
	; Load the 8-bit numbers
	mov al, [dividend] ; Load dividend intso AL
	mov bl, [divisor] ; Load divisor into BL
	
	; Clear AH register
	xor ah, ah ; Clear AH to ensure AH:AL is the dividend
	
	; Divide the numbers
	div bl ; Divide AX by BL, quotient in AL, remainder in AH
	
	; Store the result
	mov [quotient], al ; Store the quotient in memory
	mov [remainder], ah ; Store the remainder in memory
	
	; Exit program using Linux system call
	mov eax, 1 ; syscall number for exit (sys_exit)
	xor ebx, ebx ; exit code 0
	int 0x80 ; invoke syscall