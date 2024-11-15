global _start

section .data

	result dw 0;

section .text
_start:
	mov ax,10
	mov bx,5
	sub ax,bx
	add ax,'0'
	mov [result],ax

	
	mov eax,4
	mov ebx,1
	mov ecx,result
	mov edx,2
	int 80h
	
	mov eax,1
	int 80h
