BITS 16
mov ax,07c0h
add ax,288
mov ss,ax
mov sp,4096

mov ax,07c0h
mov ds,ax

mov si,string_os
call print_string

jmp $
;----------------------;
print_string:
    mov ah,0eh

    .loop:
        lodsb
        cmp al,0
          je .done
        int 10h
        jmp .loop

    .done:
        ret
;----------------------;
string_os db 'OS v2014.05.18',10,13,'by http://iterami.com',0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
