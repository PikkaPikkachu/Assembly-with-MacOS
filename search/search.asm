section	.text
   global _main   ;must be declared for linker (ld)
   extern _printf, _exit


_main:
  push ebp
  mov ebp, esp          ; Set up stack frame
  sub esp, 8            ; 16-byte align stack + room for parameters passed
                        ; to functions we call
   mov  eax,10      ;number bytes to be summed
   mov  ecx, x     ;ECX will point to the current element to be summed

top:
   cmp dword[ecx], 41
   je done
   add  ecx,1      ;move pointer to next element
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again
   jmp not_done

done:
   mov  dword[esp+4], 1
   jmp display

not_done:
    mov  dword[esp+4], -1

display:
    mov dword[esp], hello ; First parameter at esp+0
    call _printf

    xor eax, eax          ; Return value = 0
    mov esp, ebp
    pop ebp               ; Remove stack frame
    ret

section	.data
hello   db  "The location is %d", 0x0a, 0x00
x       dd  13, 41, 51, 61, 71, 81, 91, 101, 23, 45


;/usr/bin/nasm -f macho search.asm -o search.o && ld -macosx_version_min 10.8 -no_pie -arch i386 -o search search.o -lc
