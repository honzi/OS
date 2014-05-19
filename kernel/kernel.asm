BITS 16

  ;setup stack
cli
mov ax,07c0h
add ax,288
mov ss,ax
mov sp,4096
sti

  ;string offset
mov ax,07c0h
mov ds,ax

  ;print string_os
mov si,string_os
call print_string

  ;hang
cli
hlt
;----------------------;
print_string:
    mov ah,0eh

    .loop:
        lodsb
        cmp al,0
          je return
        int 10h
        jmp .loop

reboot:
    jmp 0ffffh:0000h

return:
    ret
;----------------------;
string_os db 'OS v2014.05.18',10,13,'by http://iterami.com',0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
