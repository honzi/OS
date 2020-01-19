#!/bin/sh
set -eu

# No args.

# create os-asm.bin
nasm -f bin kernel/kernel.asm -o os-asm.bin

# use os-asm.bin to create os-asm.img
dd if=os-asm.bin of=os-asm.img bs=512 count=1

# delete os-asm.bin
rm os-asm.bin
