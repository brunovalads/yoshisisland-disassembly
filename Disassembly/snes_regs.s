;PPU registers

.define REG_INIDISP		$2100 ; f--- xxxx, Force vblank and set screen brightness

;OAM control registers
.define REG_OBSEL		$2101 ; sssn nbbb, s = obj size, n = name select b = name base addr>>14
; Object size and tile address 
	; sssnnbbb
	;	 sss = size
		;000 =  8x8  and 16x16 sprites
		;001 =  8x8  and 32x32 sprites
		;010 =  8x8  and 64x64 sprites
		;011 = 16x16 and 32x32 sprites
		;100 = 16x16 and 64x64 sprites
		;101 = 32x32 and 64x64 sprites
	; nn = name select, bbb = name base select
; Each sprite entry in oam is 4 bytes (+2 bits in the high table), format is:
;	1 xxxx xxxx
;	2 yyyy yyyy
;	3 tttt tttt Note that this could also be considered as 'rrrrcccc' specifying the row and column of the tile in the 16x16 character table.
;	4 hvoo pppN N = msb of tile number, p = set palette 0-7, o = priority, h/v flip
; Each byte in the high table contains settings for 4 sprites, ie 2 bits per sprite.
;	first bit = X "sign" bit for x position 
;	second bit = S size bit, used to determine which size to use, each sss setting in $2101 has two different sizes see above. Set to 0 for small 1 for large
; Sprite tile table in vram:
; The first table is at the address specified by the Name Base bits of $2101, and the offset of the second is determined by the Name bits of $2101.
; The word address in VRAM of a sprite's first tile may be calculated as:
; ((Base<<13) + (cccccccc<<4) + (N ? ((Name+1)<<12) : 0)) & 0x7fff
.define REG_OBJSEL		$2101
.define REG_OAMADDL		$2102 ; aaaa aaaa, a = OAM address low byte
.define REG_OAMADDH		$2103 ; p--- ---b, OAM address high bit and priority
; Changing sprite priority sprite to sprite (not sprite to BG, see byte 4 of sprite entry for this):
; Write 1 to b to index the high table
; p can be used for rotating priority order in OAM
; step 1: set p to 1
; step 2: write the highest priority OBJ number (0-127) to $2102
; during V-blank every frame
; step 3: repeat

.define REG_OAM_DATA	$2104 ; bbbb bbbb, OAM Data write register
;Write 1 byte at a time to OAM, changes won't take effect until 2 bytes are written

.define REG_BGMODE		$2105 ; DCBA emmm, e = mode 1 bg3 prio bit, mmm = BG mode
; A/B/C/D = tile size for BG1/BG2/BG3/BG4, if set 16x16 else 8x8
.define REG_MOSAIC		$2106 ; xxxx DCBA, xxxx = size, DCBA = bg 4321

;BG tile and map vram address
; a = map address>>10, x = horizontal flip, y = vertical flip
.define REG_BG1SC		$2107 ; aaaa aayx
.define REG_BG2SC		$2108 ; aaaa aayx
.define REG_BG3SC		$2109 ; aaaa aayx
.define REG_BG4SC		$210A ; aaaa aayx
.define REG_BG12NBA		$210B ; bbbb aaaa, tile address>>12: a = BG1/3, b = BG2/4
.define REG_BG34NBA		$210C ; bbbb aaaa

;BG Scroll registers
; The registers for BG1 behave differently in mode 7 from mode 0-6, see below
.define REG_BG1HOFS		$210D ; ---- --xx xxxx xxxx, unsigned, 10 bit x scroll
.define REG_BG1VOFS		$210E ; ---- --yy yyyy yyyy, unsigned, 10 bit y scroll
; signed, 13 bit twos complement x,y scroll for the mode7 background
.define REG_M7HOFS		$210D ; ---x xxxx xxxx xxxx
.define REG_M7VOFS		$210E ; ---y yyyy yyyy yyyy
; Same as BG1H/VOFS
.define REG_BG2HOFS		$210F ; ---- --xx xxxx xxxx
.define REG_BG2VOFS		$2110 ; ---- --yy yyyy yyyy
.define REG_BG3HOFS		$2111 ; ---- --xx xxxx xxxx
.define REG_BG3VOFS		$2112 ; ---- --yy yyyy yyyy
.define REG_BG4HOFS		$2113 ; ---- --xx xxxx xxxx
.define REG_BG4VOFS		$2114 ; ---- --yy yyyy yyyy

;VRAM write stuff
.define REG_VMAIN		$2115 ; i---mmaa
; i = set to 0/1 for increment after writing $2118/2119
; mm = Address translation
; aa = Address increment step (0..3 = Increment Word-Address by 1,32,128,128)
;	m m a a		Increment value for $2116 and $2117
;	0 1 0 0		Increment by 8 (for 32 times) (4 color mode)
;	1 0 0 0		Increment by 8 (for 64 times) (16 color mode)
;	1 1 0 0		Increment by 8 (for 128 times) (256 color mode)
;	0 0 0 0		Address Increments 1x1
;	0 0 0 1		Address Increments 32x32
;	0 0 1 0		Address Increments 128x128 (64x64?)
;	0 0 1 1		Address Increments 128x128
; Step 32 (without translation) is useful for updating BG Map columns (eg. after horizontal scrolling).
; $89 to write 4bpp (bit) column, $85 seems to work as well?
.define REG_VMADD		$2116
.define REG_VMADDL		$2116 ; Low byte of VRAM read/write address
.define REG_VMADDH		$2117 ; High byte of VRAM read/write address
.define REG_VMDATAWL	$2118 ; Write register for low VRAM
.define REG_VMDATAWH	$2119 ; Write register for high VRAM
; VRAM writes are done as such: write $2118, write 2119, write 2118, write 2119 etc.

;Mode7 settings and matrix
.define REG_M7SEL		$211A ; rc----yx
; r = When clear, the playing field is 1024x1024 pixels (so the tilemap completely fills it). When set, the playing field is much larger, and the ‘empty space’ fill is controlled by bit 6
; c = Empty space fill, when bit r is set: 0 = Transparent. 1 = Fill with character 0.
; x/y = Horizontal/Veritcal mirroring. If the bit is set, flip the 256x256 pixel 'screen' in that direction.

; Mode7 affine matrix, all are write twice registers
; M7A and M7B can also be used for signed multiplication.
; Write a 16 bit value to M7A and an 8 bit value to M7B and the 24 bit product
; can be read from registers $2134 to $2136 with trivial delay.
; However this is not possible during scanning in mode 7.
.define REG_M7A		$211B ; aaaa aaaa aaaa aaaa
.define REG_M7B		$211C ; bbbb bbbb bbbb bbbb
.define REG_M7C		$211D ; you get the idea
.define REG_M7D		$211E ; format is 16 bit two's complement signed, 7.8 fixeds

.define REG_M7X		$211F ; ---x xxxx xxxx xxxx
.define REG_M7Y		$2120 ; ---y yyyy yyyy yyyy
; 13 bit two's complement signed, origin X,Y for mode7 affine transformation

;CGRAM write stuff
.define REG_CGADD		$2121 ; cccc cccc, destination address in CGRAM for read/write
.define REG_CGDATAW		$2122 ; -bbb bbgg gggr rrrr, color to be written, write twice register low byte then high

; Window mask settings
; The following 3 registers have the format:
;	ABCD abcd
;		c/a = Enable window 1/2 for BG1/BG3/OBJ
;		C/A = Enable window 1/2 for BG2/BG4/Color
;		d/b = Window 1/2 Inversion for BG1/BG3/OBJ
;		D/B = Window 1/2 Inversion for BG2/BG4/Color
; Example: window 2 enabled for BG1 outside and window 1 enabled for BG2 inside
; lda #%00101100
; sta $2123
.define REG_W12SEL		$2123 ; Window Mask Settings for BG1 and BG2
.define REG_W34SEL		$2124 ; Window Mask Settings for BG3 and BG4
.define REG_WOBJSEL		$2125 ; Window Mask Settings for OBJ and Color Window

; Window position
; All 1 byte unsigned
.define REG_WH0		$2126 ; Window 1 Left Position
.define REG_WH1		$2127 ; Window 1 Right Position
.define REG_WH2		$2128 ; Window 2 Left Position
.define REG_WH3		$2129 ; Window 2 Right Position

; Window BG, OBJ and Color logic
;	44/33/22/11/oo/cc = Mask logic for BG1/BG2/BG3/BG4/OBJ/Color
.define REG_WBGLOG		$212A ; 4433 2211
.define REG_WOBJLOG		$212B ; ---- ccoo

.define REG_TM			$212C ; ---o 4321 Main screen designation
.define REG_TS			$212D ; ---o 4321 Subscreen designation
.define REG_TMW			$212E ;	---o 4321 Window Mask Designation for the Main Screen
.define REG_TSW			$212F ; ---o 4321 Window Mask Designation for the Subscreen

; Color math registers
.define REG_CGWSEL		$2130 ; ccmm --sd Color Addition Select
.define REG_CGADSUB		$2131 ; shbo 4321 Color math designation
.define REG_COLDATA		$2132 ; bgrc cccc Color for color math

.define REG_SETINI		$2133 ; se-- poIi Screen Mode/Video Select

; You can read the two's complement product from M7A*(M7B>>8) here
.define REG_MPYL		$2134 ; xxxx xxxx, low byte of fractional part of the product
.define REG_MPYM		$2135 ; xxxx xxxx, high byte of fractional part of the product
.define REG_MPYH		$2136 ; xxxx xxxx, integer part of the product

.define REG_SLHV		$2137 ; When read, the H/V counter (as read from $213C and $213D) will be latched to the current X and Y position if bit 7 of $4201 is set (really?). The data actually read is open bus.
.define REG_OAMDATAR	$2138 ; OAM data read
.define REG_VMDATARL	$2139 ; VRAM read low
.define REG_VMDATARH	$213A ; VRAM read high
.define REG_CGDATAR		$213B ; Read cgram

; $2137, $213C and $213D
; Operation goes something like this:
;	Read register $2137 to latch counter
;	Read register twice for position (9 bits, bits 1-7 of high byte are ppu2 open bus)
; Each register ($213C, $213D) keeps seperate track of whether to return the low or high byte. The high/low selector is reset to ‘low’ when $213f is read (the selector is NOT reset when the counter is latched). 
; H Counter values range from 0 to 339, with 22-277 being visible on the screen. V Counter values range from 0 to 261 in NTSC mode (262 is possible every other frame when interlace is active) and 0 to 311 in PAL mode (312 in interlace?), with 1-224 (or 1-239(?) if overscan is enabled) visible on the screen.
.define REG_OPHCT		$213C ; ---- ---h hhhh hhhh, Horizontal scanline location
.define REG_OPVCT		$213D ; ---- ---v vvvv vvvv, Vertical scanline location
.define REG_STAT77		$213E ; trm- vvvv, OAM overflow flags
.define REG_STAT78		$213F ; fl-pvvvv, p = if PAL SNES this bit is 1, else 0. 

;APU registers
; Always write to $2140 / $2141 with 8-bit writes
.define REG_APU_PORT0	$2140
.define REG_APU_PORT1	$2141
.define REG_APU_PORT2	$2142
.define REG_APU_PORT3	$2143

.define REG_APUIO0		$2140
.define REG_APUIO1		$2141
.define REG_APUIO2		$2142
.define REG_APUIO3		$2143

;WRAM registers
.define REG_WMDATA		$2180 ; dddd dddd, read or write one byte at a time
.define REG_WMADDL		$2181 ; aaaa aaaa, wram address low byte
.define REG_WMADDM		$2182 ; aaaa aaaa, wram address high byte
.define REG_WMADDH		$2183 ; ---- ---b, bank 7F/7E 

.define REG_DEBUG	$21FC ; NO$SNS debug port, write ascii character
; The char_out function can be used with ASCII chars 20h..7Fh, line breaks may be
; send as 0Dh, 0Ah, or 0Dh+0Ah (all three variations supported)

;Old style joypad registers, these registers have extra slow access time
.define REG_JOYSER0		$4016 ; Write 0 to enable joypad auto read something
; Note: bit 2-7 is open bus!
.define REG_JOYSER1		$4017 ; bit 5-7 open bus
; Supposedly you want to read these two "if expanded bit is exist" (lol)

;CPU registers
.define REG_NMITIMEN	$4200 ; n-yx ---a
; n = NMI, y & x = IRQ, a = auto-joy
.define REG_WRIO		$4201 ; ab-- ----
; b = controller 1 (and 3?), a = controller 2 (and 4?)

;Hardware multiplication write registers, the multiplication is unsigned.
.define REG_WRMPYA		$4202 ; mmmm mmmm. Write $4202, then $4203. 8 "machine cycles" (probably 48 master cycles) after $4203 is set, the product may be read from $4216/7.
.define REG_WRMPYB		$4203 ; mmmm mmmm. $4202 will not be altered by this process, thus a new value may be written to $4203 to perform another multiplication without resetting $4202.
.define REG_MULTA		$4202
.define REG_MULTB		$4203

;Hardware division write registers, the division is unsigned.
.define REG_WRDIVL		$4204 ; xxxx xxxx
.define REG_WRDIVH		$4205 ; xxxx xxxx
.define REG_WRDIVB		$4206 ; 1 byte divisor
; Write $4204/5 then 6, 16 cycles after 6 is written the result may be read
; from $4214/15 and the remainder from $4216/17
.define REG_DIVL		$4204 ;\same as WRDIVx
.define REG_DIVH		$4205 ;|
.define REG_DIVB		$4206 ;/

;IRQ timing
.define REG_HTIMEL		$4207 ; hhhh hhhh
.define REG_HTIMEH		$4208 ; ---- ---h
.define REG_VTIMEL		$4209 ; vvvv vvvv
.define REG_VTIMEH		$420A ; ---- ---v
; h = set the pixel where HIRQ fires if bit 4 is set in $4200
; v =  set the scanline where VIRQ fires if bit 5 is set in $4200.
; If both V+H IRQ are enabled in $4200, IRQ fires just after scanline V pixel H

.define REG_MDMAEN		$420B ; 7654 3210 - Enable DMA flags, channels 0-7
.define REG_HDMAEN		$420C ; 7654 3210 - Enable HDMA flags, channels 0-7

.define REG_MEMSEL		$420D ; -------f
; set f for FastROM, must access rom through banks $80-$FF

.define REG_RDNMI		$4210 ; n---vvvv, bits 4-6 are open bus
; n = NMI flag, this bit is set at the start of V-Blank (happens even if NMIs
; are disabled, we suspect when H-Counter is somewhere between $28 and $4E),
; and cleared on read or at the end of V-Blank.
; Supposedly, it is required that this register be read during NMI.
; v = cpu version

.define REG_TIMEUP		$4211 ; i-------, i = IRQ flag, is set when IRQ is triggered, bits 0-6 is open bus
.define REG_HVBJOY		$4212 ; vh-----a, bits 1-5 is open bus
; v = currently in V-Blank if set. h = currently in H-Blank if set.
; a = Auto-Joypad reading pads if set.

.define REG_RDIO		$4213 ; ab-- ----
; a = controller 1 pin 6, b = controller 2 pin 6
; Reading this register reads data from the I/O Port.
; The way the I/O Port works, any bit set to 0 in $4201 will be 0 here.
; Any bit set to 1 in $4201 may be 1 or 0 here, depending on whether any
; other device connected to the I/O Port has set a 0 to that bit.
; Bit ‘b’ is connected to pin 6 of Controller Port 1. Bit ‘a’ is connected
; to pin 6 of Controller Port 2, and to the PPU Latch line.
; See register $4201 for the O side of the I/O Port

;Hardware division read registers, see $4204/6
.define REG_RDDIVL		$4214 ; qqqq qqqq, low byte of quotient
.define REG_RDDIVH		$4215 ; qqqq qqqq, high byte of quotient
;Hardware multiplication read registers, see $4202/3
.define REG_RDMPYL		$4216 ; xxxx xxxx, low byte of product/remainder
.define REG_RDMPYH		$4217 ; xxxx xxxx, high byte of product/remainder
.define REG_PRODUCTL	$4216
.define REG_PRODUCTH	$4217

;Joypad registers, one word per pad read high to low
.define REG_JOY1L		$4218 ; axlr0000 = A/X/L/R button status
.define REG_JOY1H		$4219 ; byetUDLR = B/Y/SELECT/START/UP/DOWN/LEFT/RIGHT
.define REG_JOY2L		$421A ; 
.define REG_JOY2H		$421B ; 
.define REG_JOY3L		$421C ; 
.define REG_JOY3H		$421D ; These registers are only updated when the Auto-Joypad Read bit (bit 0) of $4200 is set.
.define REG_JOY4L		$421E ; They are being updated while the Auto-Joypad Status bit (bit 0) of $4212 is set.
.define REG_JOY4H		$421F ; Reading during this time will return incorrect values.
;.endscope

;(H)DMA stuff, these registers can be read or written at any time, fast access time
.define REG_DMAP0		$4300 
.define REG_BBAD0		$4301
.define REG_A1T0L		$4302
.define REG_A1T0H		$4303
.define REG_A1B0		$4304
.define REG_DAS0L		$4305
.define REG_DAS0H		$4306
.define REG_DASB0		$4307
.define REG_A2A0L		$4308 
.define REG_A2A0H		$4309
.define REG_NTLR0		$430A


DMA_B_TO_A	= $80
DMA_FIXED	= $08

;	<---Registers used for DMA--->
; DMA transfers take 8 master cycles per byte transferred, no matter if fastROM or not.
; There is also an overhead of 8 master cycles per channel, and an overhead of 12-24 cycles for the whole transfer.
;DMA Control Register			$43x0 ; d--i fttt
;	d = Transfer direction, 0 = A bus to B bus, 1 = B to A.
;	i = Address increment, 0 = increment DMA address for each byte. 1 = decrement
;	f = DMA fixed transfer
;		0 = source address will be adjusted as specified by bit 4
;		1 = source address will not be adjusted
;	t = How data is written/read, see table below (dest = byte in $43x1):
;	000 => 1 register write once             (1 byte:  p               )
;	001 => 2 registers write once            (2 bytes: p, p+1          )
;	010 => 1 register write twice            (2 bytes: p, p            )
;	011 => 2 registers write twice each      (4 bytes: p, p,   p+1, p+1)
;	100 => 4 registers write once            (4 bytes: p, p+1, p+2, p+3)
;	101 => 2 registers write twice alternate (4 bytes: p, p+1, p,   p+1)
;	110 => 1 register write twice            (2 bytes: p, p            )
;	111 => 2 registers write twice each      (4 bytes: p, p,   p+1, p+1)

;DMA Destination				$43x1 ; aaaa aaaa
;	a = Destination register for DMA write on address bus B ($21xx)

;DMA Source Address (Low)		$43x2 ; llll llll
;DMA Source Address (High)		$43x3 ; hhhh hhhh
;DMA Source Bank				$43x4 ; bbbb bbbb
;	bhl = bank:address for the source on A bus in DMA transfer (eg. $80BEEF)

;DMA Transfer Size (Low)		$43x5 ; llll llll
;DMA Transfer Size (High)		$43x6 ; hhhh hhhh
; Size of the transfer, 2 bytes ($0000 = 64k transfer,$8000 = 32k transfer)


;	<---Registers used for HDMA--->
; HDMA overhead is ~18 master cycles, plus 8 master cycles for each channel set for direct HDMA and 24 master cycles for each channel set for indirect HDMA.
;HDMA Control Register			$43x0 ; da-- -ttt
;	d and t are same as DMA
;	a = Set to 1 for indirect addressing, 0 for direct.

;HDMA Destination				$43x1 ; aaaa aaaa
;	a = same as DMA
;HDMA Table Address (Low)		$43x2 ; llll llll
;HDMA Table Address (High)		$43x3 ; hhhh hhhh
;HDMA Table Bank				$43x4 ; bbbb bbbb
;	bhl = same as DMA

;HDMA Indirect Address (Low)	$43x5 ; llll llll
;HDMA Indirect Address (High)	$43x6 ; hhhh hhhh
;HDMA Indirect Bank				$43x7 ; bbbb bbbb
;	bhl = bank:address for indirect HDMA (eg. $7EFACE)
;	You only need to set the bank byte for indirect HDMA.
;	The resulting bank:address is the pointer used in the HDMA transfer.

;HDMA Mid Frame Table Address (Low) $43x8 ; aaaa aaaa, 
;HDMA Mid Frame Table Address (High)$43x9 ; aaaa aaaa, 
;	At the beginning of the frame $43x2/3 are copied into $43x8/9 registers for all active HDMA channels,
;	and then this register is updated as the table is read.

;HDMA Line Counter Register			$43xA ; rccc cccc, r = Repeat, c = Line count
;	About $43xA:
;	The register is decremeted before being checked for r status or c==0.
;	Thus, setting a value of $80 is really "128 lines with no repeat" rather than "0 lines with repeat".
;	Similarly, a value of $00 will be "128 lines with repeat" when it doesn't mean "terminate the channel"(assuming this can only happen if you manually write $43xA?).
;	This register is initialized at the end of V-Blank for every active HDMA channel.
;	Note that if a game wishes to begin HDMA during the frame, it will most likely have to initalize this register.
;

; GSU registers

; During GSU operation, only SFR, SCMR, and VCR may be accessed by the SNES CPU.
.define GSU_R0		$3000 ;Default source/destination register
.define GSU_R1		$3002 ;PLOT instruction X coordinate
.define GSU_R2		$3004 ;PLOT instruction Y coordinate
.define GSU_R3		$3006 ; General purpose
.define GSU_R4		$3008 ;LMULT instruction lower 16 bits of result
.define GSU_R5		$300A ; General purpose
.define GSU_R6		$300C ;FMULT and LMULT instructions, multiplier
.define GSU_R7		$300E ;MERGE instruction, source 1
.define GSU_R8		$3010 ;MERGE instruction, source 2
.define GSU_R9		$3012 ; General purpose
.define GSU_R10		$3014 ; General purpose (conventionally stack pointer)
.define GSU_R11		$3016 ;LINK instruction destination register, used for return address
.define GSU_R12		$3018 ;LOOP instruction counter
.define GSU_R13		$301A ;LOOP instruction branch address
.define GSU_R14		$301C ;Gamepak ROM address pointer for GETxx opcodes
.define GSU_R15		$301E ;Program counter, write MSB to start operation
; Access from snes cpu for R0-R15: R/W

; SNES CPU access disabled  for COLR and POR registers
;.define GSU_COLR	Color register
; Access from snes cpu: -
; $pppp pppp, p = palette entry used by plot instruction
;.define GSU_POR	Plot option register
; Access from snes cpu: -
; $---o fhdt
;	t = Transparency flag or rather whether to plot color 0 or not, 1 = plot color 0, 0 = don't plot color 0 (transparency on)
;		If t is on and the color register is 0, the plot circuit only changes the X coordinate (R1)
;	d = Dither flag, 1 = on (only valid in 4bpp mode?)
;		if(R1&1 == R2&1) lower 4 bit sin the color register are plotted.
;		else plot upper 4 bits of color register
;	h = Upper 4 bits color, 1 = on (4bpp, or 8bpp with f set)
;		When enabled, the upper 4 bits in the source register are stored in the lower 4 bits
;		of the color register when using COLOR and GETC instructions.
;		This allows the data for 2 pixels to be stored in one byte.
;	f = Freeze upper 4 bits, 1 = on (8bpp only)
;		lock the upper 4 bits of the color register while processing the COLOR and GETC instructions and change the lower 4 bits only.
;	o = Sprite mode, set to 1 to specify the bitmap in sprite mode.
; Plot option register flags:
GSU_POR_OPAQUE			= $01
GSU_POR_DITHER			= $02
GSU_POR_COLOR_SRC_HIGH	= $04
GSU_POR_FIX_HIGH_4BITS	= $08
GSU_POR_OBJ				= $10

.define GSU_SFR		$3030 ;Status/flag registers
; Access from snes cpu: R/W
; I--B HL21 -RGV SCZ- 
;	Z = Zero flag
;	C = Carry flag
;	S = Sign flag
;	V = Overflow flag
;	G = GSU is running (cleared on STOP) (set 0 to force GSU stop)
;	R = ROM[R14] read (0 = no, 1 = reading ROM via R14 address)
;	1 = Prefix flag \for ALT1, ALT2, ALT3
;	2 = Prefix flag /
;	L = Immediate lower 8 bit flag \Unknown, probably set/reset internally
;	H = Immediate upper 8 bit flag /when processing opcodes with imm operands
;	B = Prefix flag (for WITH prefix, used by MOVE/MOVES opcodes)
;	I = Interrupt Flag (reset on read, set on STOP) (also set if IRQ masked in $3037?)
GSU_GO_BIT	=	$20

.define GSU_BRAMR	$3033 ;Back-up (s)ram register
; Access from snes cpu: W
; ---- ---B, B = 0/1 disable/enable
; Some info from nocash:
; 	This register would be used only if the PCB does have a separate "Backup" RAM chip
;	mapped to 780000h-79FFFFh (additionally to the Game Pak RAM chip).
;	None of the existing PCBs have that extra SRAM chip, so the register has no practical function.
;	(Note: However, some PCBs do include a battery wired to Game Pak RAM chip, regardless,
;	that type of "backup" isn't affected by this register).
;	The "real" back-up RAM is also the game pak RAM (aka buffer RAM) and resides in bank $70-$71 (max 128KiB)
; Book says: Data becomes protected when the BRAM flag is reset (0) after saving data to the back-up RAM.

.define GSU_PBR		$3034 ;Program bank register
; Access from snes cpu: R/W
; bbbb bbbb, works like SNES CPU program bank register
.define GSU_ROMBR	$3036 ;Game pak rom bank register
; Access from snes cpu: R
; bbbb bbbb, used for ROM buffering, specifies the bank for ops using the ROM buffer

.define GSU_CFGR	$3037 ;Config register
; Access from snes cpu: W
; I-M- ----, I = IRQ mask, set to 1 to mask GSU triggered IRQ
; M = multiplier speed select, 0 standard 1 high speed
; When operating at 21MHz (CLSR = $01) M must be 0(?) seems to work in 21mhz tho so screw that, give 1 cycle mult!
GSU_CFGR_FASTMUL	= $20
GSU_CFGR_IRQ_MASK	= $80


.define GSU_SCBR	$3038 ;Screen base register
; Access from snes cpu: W
; aaaa aaaa, a = start address (in 1KiB units ) in character data storage area

.define GSU_CLSR	$3039 ;Clock select register
; Access from snes cpu: W
; ---- ---S, S = Clock speed, 0 = 10.7MHz 1 = 21.4MHz 

; RON/RAN flags
.define GSU_SCMR	$303A ;Screen mode register
; Access from snes cpu: W
; --hO Ahcc, O = RON, A = RAN, h = screen height, c = color depth mode
; Write 0 to RON/RAN (ROM/RAM enable) flags to temporarily put GSU in
; WAIT mode, this allows SCPU access to game pak ROM/RAM respectively.
; Write 1 to give game pak ROM/RAM access back to GSU and it will resume processing.
; hh settings: 00 = 128px, 01 = 160px, 10 = 192px, 11 = obj mode
; cc settings: 00 = 2bpp, 01 = 4bpp, 10 = not used, 11 = 8bpp
GSU_RON	= $10
GSU_RAN	= $08
GSU_SCMR_2BPP	= $00
GSU_SCMR_4BPP	= $01
GSU_SCMR_8BPP	= $03
GSU_SCMR_H128	= $00
GSU_SCMR_H160	= $04
GSU_SCMR_H192	= $20
GSU_SCMR_OBJ	= $24

.define GSU_VCR		$303B ;Version code register read only, 1 byte.
; Access from snes cpu: R
; There are 4 known versions, $01 = MARIO, $04 = GSU-2 ($02 = GSU? $03 = GSU-1 ????)

.define GSU_RAMBR	$303C ;Game pak ram bank register
; Access from snes cpu: R
; ---- ---A, A = bank select ($70-71)

.define GSU_CBR		$303E ;Cache base register
; Access from snes cpu: R
; cccc cccc cccc ----, This register specifies the starting address when data is loaded from ROM or gamepak RAM to cache RAM.

.define GSU_CACHE	$3100 ;GSU cache start
;.define ccccccccc	$32FF ;GSU cache end

;.define bbbbbbbbb	$347F ; ?

; GSU2 (and probably 1) information below courtesy of nocash.emubase.de
; GSU2 memory map at SNES side
;	00-3F/80-BF:6000-7FFF  Mirror of 70:0000-1FFF (ie. FIRST 8K of Game Pak RAM)
;	70-71:0000-FFFF        Game Pak RAM       (128KiB max, usually 32K or 64K)
;	78-79:0000-FFFF        Additional "Backup" RAM  (128KiB max, usually none)
;
; GSU2 memory map at GSU Side
; 	00-3F:0000-7FFF  Mirror of LoROM at 00-3F:8000-FFFF (for "GETB R15" vectors)
; 	00-3F:8000-FFFF  Game Pak ROM in LoRom mapping (2MiB max)
; 	40-5F:0000-FFFF  Game Pak ROM in HiRom mapping (mirror of above 2MiB)
; 	70-71:0000-FFFF  Game Pak RAM       (128KiB max, usually 32K or 64K)
; 	PBR:0000-01FF    Code-Cache (when having manually stored opcodes in it)
; PBR can be set to both ROM/RAM regions (or cache region), ROMBR only to ROM region (00h-5Fh), RAMBR only to RAM region (70h-71h).
