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

  ;begin cli loop
call os_cli
;----------------------;
os_cli:
    pusha
    call os_print_newline
    mov si,string_os_cli
    call os_print_string

    .loop:
          ;wait for keyboard input
        mov ah,00h
        int 16h

          ;if enter pressed, new cli
        cmp al,0x0D
          je .done

          ;else print character
        mov ah,0eh ;tty mode write characters
        int 10h

        jmp .loop

    .done:
        popa
        call os_cli

os_print_newline:
    pusha
    mov ah,0eh ;tty mode write characters

    mov al,13
    int 10h
    mov al,10
    int 10h

    popa
    ret

os_print_string:
    pusha
    mov ah,0eh ;tty mode write characters

    .loop:
        lodsb
        cmp al,0
          je .done
        int 10h
        jmp .loop
    
    .done:
        popa
        ret

os_reboot:
    int 19h
;----------------------;
string_os_cli db '>',0
string_os_info db 'http://iterami.com OS v2014.05.22',0
;----------------------;
times 510-($-$$) db 0
dw 0xaa55
