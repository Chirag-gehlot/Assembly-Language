global _start

section .data
	first_print dw "Enter the value: ",10;
	len_first_print equ $- first_print
	
	second_print dw "Entered number is:  ",10;
	len_second_print equ $- second_print

section .bss
	num resb 2
	
section .text
	
%macro in_out 3
	mov eax,%1
	mov ebx,1
	mov ecx,%2
	mov edx,%3
	
	int 80h

%endmacro

_start:
	in_out 4,first_print,len_first_print
	in_out 3,num,2
	in_out 4,second_print,len_second_print
	in_out 4,num,2
	
	mov eax,1
	xor ebx,ebx
	int 80h
	