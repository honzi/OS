BITS 16
;------------------------------------------;
mov ax,07C0h
add ax,288
mov ss,ax
mov sp,4096

mov ax,07C0h
mov ds,ax

mov si,text_string
call print_string

jmp $
;------------------------------------------;
text_string db 'OS',0
;------------------------------------------;
print_string:
    mov ah,0Eh

.repeat:              ;print each character
    lodsb
    cmp al,0
    je ret            ;until last char is 0
    int 10h
    jmp .repeat
;------------------------------------------;
times 510-($-$$) db 0
dw 0xAA55
