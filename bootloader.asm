
; Instruct the assembler to generate code designed to run on real mode 16 bit cpu mode

bits	16


; Set the origin of the storage variable to the 0x7c00 offset

org 0x7c00


; Define a label x that has a memory offset which is the start of the code pointing to character Z

x:

	db	"K"


; Move offset of x to the bx register

mov	bx, x

; Add 0x7c00 to the bx register which will set the offset of the bx register as 0x7c00 - it is universally known that BIOS loads bootloaders to this location

;add	bx, 0x7c00


; Move contents of the bx register to the al register

mov	al, [bx]

; Prepare interrupt to print a character in TTY mode and issue the interrupt

mov	ah, 0x0e

int	0x10

times	510 - ($ - $$) db 0

dw	0xaa55

