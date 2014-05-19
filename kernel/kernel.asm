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

  ;wait for keyboard input before reboot
mov ah,00h
int 16h
call reboot
;----------------------;
print_string:
      ;write character, tty mode
    mov ah,0eh

    .loop:
        lodsb
        cmp al,0
          je return
        int 10h
        jmp .loop

reboot:
    int 19h

return:
    ret
;----------------------;
string_os db 'http://iterami.com OS v2014.05.19',10,13,'Press any key to reboot.',0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
