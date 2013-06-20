BITS 16
;------------------------------------------;
mov ax,07C0h       ;setup 4k stack after bl
add ax,288
mov ss,ax
mov sp,4096

mov ax,07C0h       ;set data segment
mov ds,ax

mov si,text_string
call print_string

jmp $
;------------------------------------------;
text_string db 'OS',0
;------------------------------------------;
print_string:
    mov ah,0Eh

.repeat:
    lodsb
    cmp al,0
    je .done
    int 10h
    jmp .repeat

.done:
    ret
;------------------------------------------;
times 510-($-$$) db 0  ;fill bsector with 0
dw 0xAA55              ;standard boot sig
