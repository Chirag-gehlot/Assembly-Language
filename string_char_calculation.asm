section .data
    string1 db "Hello, World!", 0 ; Null-terminated string

section .bss
    output resb 4 ; Reserve 4 bytes for the length (up to 3 digits + null terminator)

section .text

global _start

_start:
    ; Initialize registers
    mov esi, string1  ; Move the address of string1 into ESI
    xor ecx, ecx      ; Clear ECX to use it as a counter

length_loop:
    lodsb            ; Load byte at DS:ESI into AL and increment ESI
    cmp al, 0        ; Check if the byte is the null terminator
    je done_length   ; If it is, jump to the done_length label
    inc ecx          ; Increment the length counter
    jmp length_loop  ; Repeat the loop

done_length:
    ; Store the length as a decimal number in the output buffer
    mov edi, output  ; Point EDI to the output buffer
    xor eax, eax     ; Clear EAX to use it for division
    xor ebx, ebx     ; Clear EBX

    ; Convert ECX (length) to ASCII digits
    mov eax, ecx     ; Move the length value into EAX
    mov ebx, 10      ; Set divisor to 10
print_digit:
    xor edx, edx     ; Clear EDX for division
    div ebx          ; Divide EAX by 10, quotient in EAX, remainder in EDX
    add dl, '0'      ; Convert remainder to ASCII character
    dec edi          ; Move EDI backward
    mov [edi], dl    ; Store ASCII character in output buffer
    test eax, eax    ; Check if quotient is zero
    jnz print_digit  ; If not zero, repeat the loop

    ; Calculate the number of digits
    mov eax, output  ; Move base address of output buffer to EAX
    sub eax, edi     ; Calculate length of the number string
    mov edx, eax     ; Set EDX to length of the number string

    ; Write to stdout
    mov eax, 4       ; sys_write
    mov ebx, 1       ; file descriptor (stdout)
    mov ecx, edi     ; buffer to write from (current position of EDI)
    int 0x80

    ; Exit the program
    mov eax, 1       ; sys_exit
    xor ebx, ebx     ; status code 0
    int 0x80

