@echo off
setlocal

"C:\Users\YOUR USERNAME\AppData\Local\bin\NASM\nasm.exe" -f win64 boot_uefi.asm -o boot_uefi.obj
if %ERRORLEVEL% NEQ 0 (echo NASM Failed & pause & exit)

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1


if %ERRORLEVEL% NEQ 0 call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
if %ERRORLEVEL% NEQ 0 call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1


link.exe /entry:_uefi_main /subsystem:efi_application /nodefaultlib boot_uefi.obj /out:BOOTX64.EFI
if %ERRORLEVEL% NEQ 0 (echo Linking Failed & pause & exit)


mkdir vdrv\EFI\BOOT 2>nul
copy /y BOOTX64.EFI vdrv\EFI\BOOT\BOOTX64.EFI >nul

"C:\Program Files\qemu\qemu-system-x86_64.exe" -bios OVMF.fd -drive file=fat:rw:vdrv,format=raw

pause
