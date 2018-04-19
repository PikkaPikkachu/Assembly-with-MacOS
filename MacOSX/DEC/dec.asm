global    start
          section   .text
start:
          mov       rdx, output               ; rdx holds address of next byte to write
          mov       r8, '0'                   ; keep track of decrements
          mov       r9, '5'                   ; number to be decremented stored
line:

          dec       r9                      ; decrement number
          cmp       r9, r8                  ; is number equal to decrement num?
          jne       line                    ; keep decrementing
          mov       [rdx],  r9              ; write number to output

done:
          mov       rax, 0x02000004         ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, output             ; address of string to output
          mov       rdx, 1           ; number of bytes
          syscall                           ; invoke operating system to do the write
          mov       rax, 0x02000001         ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .bss
output:   resq      1


; Run the increase program
; nasm -fmacho64 dec.asm && ld dec.o && ./a.out
