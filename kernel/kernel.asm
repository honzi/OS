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
call os_print_newline
mov si,string_os_reboot
  call os_print_string

  ;wait for keyboard input before reboot
mov ah,00h
int 16h
call os_reboot
;----------------------;
os_print_newline:
    mov ah,0eh ;tty mode write characters
    mov al,13
    int 10h
    mov al,10
    int 10h
    ret

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
string_os_info db 'http://iterami.com OS v2014.05.19',0
string_os_reboot db 'Press any key to reboot.',0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
