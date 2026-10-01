[org 0x7c00]

when_motherbor_start:
   
   xor ax, ax
   mov ds, ax

   mov ah, 0x0e
   mov si, msg


for_loop:
  lodsb
  
  cmp al, 0
  je done
  
  int 0x10
  jmp for_loop


done:
   jmp $


msg db "Abood was in your motherbord ^^ ", 0 ;change the text if you want

times 510 - ($ - $$) db 0 
dw 0xaa55

  


   