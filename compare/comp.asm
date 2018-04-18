section	.text
   global _main   ;must be declared for linker (ld)
   extern _printf, _exit

_main:
  push ebp
  mov ebp, esp          ; Set up stack frame
  sub esp, 8            ; 16-byte align stack + room for parameters passed
                        ; to functions we call
   mov ebx, 10
   mov  ecx, x     ;ECX will point to the current element to be summed
   cmp  ebx, [ecx]
   je equal
   jl great
   mov  dword[esp+4], 1
   jmp display
equal:
   mov  dword[esp+4], 0
   jmp display
great:
   mov  dword[esp+4], 2

display:
    mov dword[esp], msg ; First parameter at esp+0
    call _printf

    xor eax, eax          ; Return value = 0
    mov esp, ebp
    pop ebp               ; Remove stack frame
    ret

section	.data
msg   db  "The number is %d, (0 = equal, 1 = less, 2 = greater)", 0x0a, 0x00
x     db  50

;/usr/bin/nasm -f macho comp.asm -o comp.o && ld -macosx_version_min 10.8 -no_pie -arch i386 -o comp comp.o -lc
