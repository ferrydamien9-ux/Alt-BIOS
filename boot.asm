; ALT-BIOS Entry Point (x86 16-bit Real Mode)
[BITS 16]
[ORG 0x7C00] ; The standard location for boot sectors

start:
    cli             ; Clear interrupts
    xor ax, ax      ; Reset registers
    mov ds, ax
    mov es, ax
    
    call bios_main  ; Jump to our C code logic
    
    hlt             ; Halt the CPU if we ever return

times 510-($-$$) db 0 ; Pad the rest of the 512 bytes with zeros
dw 0xAA55             ; The "Magic Number" that tells BIOS this is bootable
