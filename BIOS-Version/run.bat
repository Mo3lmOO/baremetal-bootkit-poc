@echo off
"C:\Users\YOUR USERNAME\AppData\Local\bin\NASM\nasm.exe" -f bin boot.asm -o boot.bin

if %ERRORLEVEL% EQU 0 (
    echo Compiling successful Starting QEMU
    "C:\Program Files\qemu\qemu-system-x86_64.exe" -fda boot.bin
) else (
    echo Compiling failed Check your assembly syntax
)
pause