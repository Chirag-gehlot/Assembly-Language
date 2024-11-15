global _start

section .data
	first_print db "Enter first value: ",10;
	len_first_print equ $- first_print
	
	second_print db "Enter second value: ",10;
	len_second_print equ $- second_print
	
section .bss
	num1 resb 2
	num2 resb 2
	sum resb 2

section .text
	
%macro in_out 3
	mov eax, %1
	mov ebx, 1
	mov ecx, %2
	mov edx, %3
	
	int 80h
%endmacro

_start:
	in_out 4,first_print,len_first_print
	in_out 3,num1,2
	in_out 4,second_print,len_second_print
	in_out 3,num2,2

	
	mov ax,[num1]
	sub ax, '0'
	mov bx,[num2]
	sub bx,'0'
	
	add ax,bx
	add ax,'0'
	
	mov [sum],ax
	in_out 4,sum,2
	
	int 80h
	
	mov eax, 1
	int 80h
	
	