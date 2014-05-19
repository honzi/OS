A custom OS, probably maybe written in NASM assembly for x86 PCs.

Set it up with these commands...

    nasm -f bin kernel.asm -o os.bin
    dd if=os.bin of=os.img bs=512 count=1

...and run it using your favorite virtual machine software.
