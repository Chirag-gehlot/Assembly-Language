section .data
    prompt db 'Enter a string: ', 0x0a, 0x00 ; prompt string with newline
    input_buffer times 100 db 0 ; 100 byte buffer for input

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4      ; sys_write system call
    mov ebx, 1      ; file descriptor 1 (stdout)
    mov ecx, prompt ; pointer to prompt string
    mov edx, 16     ; length of prompt string
    int 0x80        ; make system call

    ; Read user input
    mov eax, 3      ; sys_read system call
    mov ebx, 0      ; file descriptor 0 (stdin)
    mov ecx, input_buffer ; pointer to input buffer
    mov edx, 100    ; maximum length of input
    int 0x80        ; make system call

    ; Print the input string
    mov eax, 4      ; sys_write system call
    mov ebx, 1      ; file descriptor 1 (stdout)
    mov ecx, input_buffer ; pointer to input buffer
    int 0x80        ; make system call

    ; Exit the program
    mov eax, 1      ; sys_exit system call
    xor ebx, ebx    ; exit status 0
    int 0x80        ; make system call
