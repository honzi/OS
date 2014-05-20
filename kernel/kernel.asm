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

  ;print strings
mov si,string_os_info
call os_print_string
mov si,string_os_reboot
call os_print_string

  ;wait for keyboard input before reboot
mov ah,00h
int 16h
call os_reboot
;----------------------;
os_print_string:
    mov ah,0eh ;tty mode write characters

    .loop:
        lodsb
        cmp al,0
          je os_ret
        int 10h
        jmp .loop

os_reboot:
    int 19h

os_ret:
    ret
;----------------------;
string_os_info db 'http://iterami.com OS v2014.05.19',10,13,0
string_os_reboot db 'Press any key to reboot.',10,13,0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
