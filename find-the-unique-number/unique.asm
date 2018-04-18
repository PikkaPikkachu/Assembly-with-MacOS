section	.text
   global _main   ;must be declared for linker (ld)
   extern _printf, _exit


_main:
  push ebp
  mov ebp, esp          ; Set up stack frame
  sub esp, 8            ; 16-byte align stack + room for parameters passed
                        ; to functions we call
   mov  ebx,0      ;EBX will store the sum
   mov  eax,11      ;number bytes to be summed
   mov  ecx, x     ;ECX will point to the current element to be summed

top:
   xor  ebx, [ecx]
   add  ecx,4      ;move pointer to next element
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again


done:
   mov  dword[esp+4], ebx

display:
    mov dword[esp], msg ; First parameter at esp+0
    call _printf

    xor eax, eax          ; Return value = 0
    mov esp, ebp
    pop ebp               ; Remove stack frame
    ret

section	.data
msg   db  "The unique number is %d", 0x0a, 0x00
x     dd  13, 13, 42, 42, 43, 56, 56, 90, 90, 43, 50


;/usr/bin/nasm -f macho unique.asm -o unique.o && ld -macosx_version_min 10.8 -no_pie -arch i386 -o unique unique.o -lc
