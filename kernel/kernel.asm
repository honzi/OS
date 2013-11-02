BITS 16
mov ax,07C0h   ;setup 4k stack after bl
add ax,288
mov ss,ax
mov sp,4096

mov ax,07C0h   ;set data segment
mov ds,ax

mov si,str0
call print_str

jmp $
;----------------------;
str0 db 'OS v2013.11.02',13,10,'by http://iterami.com',0
;----------------------;
print_str:
    mov ah,0Eh

.repeat:
    lodsb
    cmp al,0
    je .done
    int 10h
    jmp .repeat

.done:
    ret
;----------------------;
times 510-($-$$) db 0
dw 0xAA55             ;standard boot sig
