global _start

section .data
sum dw 0

section .text
_start:
	mov ax,7; 'ax' is of 16 bit
	mov bx,2;
	add ax,bx; This will perform addition of 7 and 2. Here it will save it as ASCII code number
	add ax,'0'; Here this will add the ASCII of character '0' with the ASCII of '9'
	; Now we'll get the value of character '9'. That is what it is going to display
	mov [sum],ax;
	
	
	mov eax,4; 'eax' is of 32 bit.
	mov ebx,1;
	mov ecx,sum;
	mov edx,2;
	int 80h; Now it is neccessary to give the output as 32 bit that's why we are using eax as a register
	
	mov eax,1;
	int 80h;