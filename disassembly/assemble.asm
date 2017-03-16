; variables
incsrc vars/reg_vars.asm
incsrc vars/ram_vars.asm
incsrc vars/sram_vars.asm
incsrc vars/sprite_table_vars.asm

incsrc bank00.asm
incsrc bank01.asm
incsrc bank02.asm
incsrc bank03.asm
incsrc bank04.asm
incsrc bank05.asm
incsrc bank06.asm
incsrc bank07.asm
incsrc bank08.asm ; Super FX banks
incsrc bank09.asm ; Super FX banks
incsrc bank0A.asm ; Super FX banks
incsrc bank0B.asm ; Super FX banks
incsrc bank0C.asm
incsrc bank0D.asm
incsrc bank0E.asm
incsrc bank0F.asm
incsrc bank10.asm
incsrc bank11.asm
incsrc bank12.asm
incsrc bank13.asm
incsrc bank14.asm
incsrc bank15.asm
incsrc bank16.asm
incsrc bank17.asm
incsrc bank18.asm
incsrc bank19.asm
incsrc bank1A.asm
incsrc bank1B.asm
incsrc bank1C.asm
incsrc bank1D.asm
incsrc bank1E.asm
incsrc bank1F.asm
incsrc bank20.asm
incsrc bank21.asm
incsrc bank22.asm
incsrc bank23.asm ; freespace

; uncompressed graphics
; see graphics/bankXX.bmp for visuals of all these

; see .bin filenames for info
; 2bpp & 4bpp refer to SNES tile graphics

; gsu refers to bitmap split by high & low nibble
; they are all two 256x128 chunks except bank 2E is 256x60

org $248000
incbin gfx/bank24-4bpp.bin

org $258000
incbin gfx/bank25-4bpp.bin

; map screen icons
org $268000
incbin gfx/bank26-gsu.bin

; $8000-$BFFF: gsu  (selection/bonus icons)
; $C000-$FFFF: 4bpp (cutscene Yoshi graphics?)
org $278000
incbin gfx/bank27-gsu.bin
incbin gfx/bank27-4bpp.bin

org $288000
incbin gfx/bank28-gsu.bin

org $298000
incbin gfx/bank29-gsu.bin

org $2A8000
incbin gfx/bank2A-gsu.bin

org $2B8000
incbin gfx/bank2B-gsu.bin

; mostly island cutscene graphics
org $2C8000
incbin gfx/bank2C-gsu.bin

; $8000-$E7FF: 2bpp
; $E800-$FFFF: 4bpp
org $2D8000
incbin gfx/bank2D-2bpp.bin
incbin gfx/bank2D-4bpp.bin

; 256x60: French & German icon graphics
org $2E8000
incbin gfx/bank2E-gsu.bin

; compressed graphic files
incsrc gfx/lz1.asm
incsrc gfx/lz16.asm

incsrc bank3F.asm
