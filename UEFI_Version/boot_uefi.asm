[bits 64]

section .text
global _uefi_main

_uefi_main:
    
    sub rsp, 40         

    mov rsi, rdx        
    mov rax, [rsi + 64] 
    
    
    mov rcx, rax        
    lea rdx, [rel _msg] 
    mov rbp, [rax + 8]  
    call rbp            

    
    xor rax, rax        
    add rsp, 40         
    jmp $               

section .data

_msg dw __utf16__("Abood was in your motherboard ^^"), 13, 10, 0