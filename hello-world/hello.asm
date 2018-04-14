global start

section .text
start:                     ; sys_write syscall
    push    dword msg.len  ; Last argument is length
    push    dword msg      ; 2nd last is pointer to string
    push    dword 1        ; 1st argument is File descriptor (1=STDOUT)
    mov     eax, 4         ; eax = 4 is write system call
    sub     esp, 4         ; On OS/X 32-bit code always need to allocate 4 bytes on stack
    int     0x80           ; call the kernel 
    
    push    dword 42       ; Return value
    mov     eax, 1         ; eax=1 is exit system call
    sub     esp, 4         ; allocate 4 bytes on stack
    int     0x80

section .rodata

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg