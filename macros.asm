global _start

section .data
	name db "Name: Chirag", 10; '10'  is a new line character
	name_len equ $-name
	
	surname db "Surname: Gehlot",10
	surname_len equ $-surname
	
	location db "Location: Pune",10
	location_len equ $-location
	
	branch db "Branch: CSE",10
	branch_len equ $-branch
	
	univ db "University: MITADT",10
	univ_len equ $-univ
	
	
section .text
	
%macro print 2 ; Here 'print' is name of macro and '2' is the register that it going to change
	mov eax,4
	mov ebx,1
	mov ecx,%1 ; This is the first changing register. That's why we have written %1
	mov edx,%2 ; This is the second changing register. That's why we have written %2
	int 80h
	
%endmacro

_start:
	print name, name_len
	print surname, surname_len
	print location, location_len
	print branch, branch_len
	print univ,univ_len
	int 80h;
	

	mov eax,1
	xor ebx,ebx
	int 80h
	
	
