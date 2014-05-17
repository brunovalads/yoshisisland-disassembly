
	; dl $01AF8F		;C Level fade in + level name (init)
	; dl $01B4E0		;D Level fade in after pipe/door (init)
	; dl $108D4B		;E Level fade in (after level name) (main)
	; dl $01C0D8		;F Level (with control) (main)

!level				=	$015F 		; level number (don't touch this)

lorom

org $01B084				; set area #
	autoclean JML set_level
	NOP #6

org $01B1EE				; game mode 0C
	autoclean JML init_0C
	NOP

org $01B541 			; game mode 0D
	autoclean JML init_0D
	NOP #3

org $01C0D9				; game modes 0E & 0F
	autoclean JML main_0F
	NOP

macro preserve(jump)
	PHA
	PHX
	PHY
	PHB
	<jump>
	PLB
	PLP
	PLY
	PLX
	PLA
endmacro

freecode
print pc

set_level:
	AND #$00FF
	ASL A
	STA !level
	STA $00
	ASL A
	ADC $00
	TAX
	JML $01B08E

init_0C:
	; overwritten
	INC $0118

	%preserve("JSR run_init_code")

	JML $01B22F

init_0D:
	; overwritten
	INC $0118

	%preserve("JSR run_init_code")

	JML $1083E2

main_0F:
	; overwritten
	LDA #$10 
	STA $0B83

	%preserve("JSR run_main_code")

	JML $01C0DE

run_init_code:
	PHK
	PLB
	SEP #$10
	LDX !level
	JMP (level_init_table,x)

run_main_code:
	PHK
	PLB
	SEP #$10
	LDX !level
	JMP (level_main_table,x)

; don't touch this
level_main_table:
dw level0	
dw level1	
dw level2	
dw level3	
dw level4
dw level5
dw level6
dw level7
dw level8
dw level9
dw levelA
dw levelB
dw levelC
dw levelD
dw levelE
dw levelF
dw level10
dw level11
dw level12
dw level13
dw level14
dw level15
dw level16
dw level17
dw level18
dw level19
dw level1A
dw level1B
dw level1C
dw level1D
dw level1E
dw level1F
dw level20
dw level21
dw level22
dw level23
dw level24
dw level25
dw level26
dw level27
dw level28
dw level29
dw level2A
dw level2B
dw level2C
dw level2D
dw level2E
dw level2F
dw level30
dw level31
dw level32
dw level33
dw level34
dw level35
dw level36
dw level37
dw level38
dw level39
dw level3A
dw level3B
dw level3C
dw level3D
dw level3E
dw level3F
dw level40
dw level41
dw level42
dw level43
dw level44
dw level45
dw level46
dw level47
dw level48
dw level49
dw level4A
dw level4B
dw level4C
dw level4D
dw level4E
dw level4F
dw level50
dw level51
dw level52
dw level53
dw level54
dw level55
dw level56
dw level57
dw level58
dw level59
dw level5A
dw level5B
dw level5C
dw level5D
dw level5E
dw level5F
dw level60
dw level61
dw level62
dw level63
dw level64
dw level65
dw level66
dw level67
dw level68
dw level69
dw level6A
dw level6B
dw level6C
dw level6D
dw level6E
dw level6F
dw level70
dw level71
dw level72
dw level73
dw level74
dw level75
dw level76
dw level77
dw level78
dw level79
dw level7A
dw level7B
dw level7C
dw level7D
dw level7E
dw level7F
dw level80
dw level81
dw level82
dw level83
dw level84
dw level85
dw level86
dw level87
dw level88
dw level89
dw level8A
dw level8B
dw level8C
dw level8D
dw level8E
dw level8F
dw level90
dw level91
dw level92
dw level93
dw level94
dw level95
dw level96
dw level97
dw level98
dw level99
dw level9A
dw level9B
dw level9C
dw level9D
dw level9E
dw level9F
dw levelA0
dw levelA1
dw levelA2
dw levelA3
dw levelA4
dw levelA5
dw levelA6
dw levelA7
dw levelA8
dw levelA9
dw levelAA
dw levelAB
dw levelAC
dw levelAD
dw levelAE
dw levelAF
dw levelB0
dw levelB1
dw levelB2
dw levelB3
dw levelB4
dw levelB5
dw levelB6
dw levelB7
dw levelB8
dw levelB9
dw levelBA
dw levelBB
dw levelBC
dw levelBD
dw levelBE
dw levelBF
dw levelC0
dw levelC1
dw levelC2
dw levelC3
dw levelC4
dw levelC5
dw levelC6
dw levelC7
dw levelC8
dw levelC9
dw levelCA
dw levelCB
dw levelCC
dw levelCD
dw levelCE
dw levelCF
dw levelD0
dw levelD1
dw levelD2
dw levelD3
dw levelD4
dw levelD5
dw levelD6
dw levelD7
dw levelD8
dw levelD9
dw levelDA
dw levelDB
dw levelDC
dw levelDD

level_init_table:
dw levelinit0	
dw levelinit1	
dw levelinit2	
dw levelinit3	
dw levelinit4
dw levelinit5
dw levelinit6
dw levelinit7
dw levelinit8
dw levelinit9
dw levelinitA
dw levelinitB
dw levelinitC
dw levelinitD
dw levelinitE
dw levelinitF
dw levelinit10
dw levelinit11
dw levelinit12
dw levelinit13
dw levelinit14
dw levelinit15
dw levelinit16
dw levelinit17
dw levelinit18
dw levelinit19
dw levelinit1A
dw levelinit1B
dw levelinit1C
dw levelinit1D
dw levelinit1E
dw levelinit1F
dw levelinit20
dw levelinit21
dw levelinit22
dw levelinit23
dw levelinit24
dw levelinit25
dw levelinit26
dw levelinit27
dw levelinit28
dw levelinit29
dw levelinit2A
dw levelinit2B
dw levelinit2C
dw levelinit2D
dw levelinit2E
dw levelinit2F
dw levelinit30
dw levelinit31
dw levelinit32
dw levelinit33
dw levelinit34
dw levelinit35
dw levelinit36
dw levelinit37
dw levelinit38
dw levelinit39
dw levelinit3A
dw levelinit3B
dw levelinit3C
dw levelinit3D
dw levelinit3E
dw levelinit3F
dw levelinit40
dw levelinit41
dw levelinit42
dw levelinit43
dw levelinit44
dw levelinit45
dw levelinit46
dw levelinit47
dw levelinit48
dw levelinit49
dw levelinit4A
dw levelinit4B
dw levelinit4C
dw levelinit4D
dw levelinit4E
dw levelinit4F
dw levelinit50
dw levelinit51
dw levelinit52
dw levelinit53
dw levelinit54
dw levelinit55
dw levelinit56
dw levelinit57
dw levelinit58
dw levelinit59
dw levelinit5A
dw levelinit5B
dw levelinit5C
dw levelinit5D
dw levelinit5E
dw levelinit5F
dw levelinit60
dw levelinit61
dw levelinit62
dw levelinit63
dw levelinit64
dw levelinit65
dw levelinit66
dw levelinit67
dw levelinit68
dw levelinit69
dw levelinit6A
dw levelinit6B
dw levelinit6C
dw levelinit6D
dw levelinit6E
dw levelinit6F
dw levelinit70
dw levelinit71
dw levelinit72
dw levelinit73
dw levelinit74
dw levelinit75
dw levelinit76
dw levelinit77
dw levelinit78
dw levelinit79
dw levelinit7A
dw levelinit7B
dw levelinit7C
dw levelinit7D
dw levelinit7E
dw levelinit7F
dw levelinit80
dw levelinit81
dw levelinit82
dw levelinit83
dw levelinit84
dw levelinit85
dw levelinit86
dw levelinit87
dw levelinit88
dw levelinit89
dw levelinit8A
dw levelinit8B
dw levelinit8C
dw levelinit8D
dw levelinit8E
dw levelinit8F
dw levelinit90
dw levelinit91
dw levelinit92
dw levelinit93
dw levelinit94
dw levelinit95
dw levelinit96
dw levelinit97
dw levelinit98
dw levelinit99
dw levelinit9A
dw levelinit9B
dw levelinit9C
dw levelinit9D
dw levelinit9E
dw levelinit9F
dw levelinitA0
dw levelinitA1
dw levelinitA2
dw levelinitA3
dw levelinitA4
dw levelinitA5
dw levelinitA6
dw levelinitA7
dw levelinitA8
dw levelinitA9
dw levelinitAA
dw levelinitAB
dw levelinitAC
dw levelinitAD
dw levelinitAE
dw levelinitAF
dw levelinitB0
dw levelinitB1
dw levelinitB2
dw levelinitB3
dw levelinitB4
dw levelinitB5
dw levelinitB6
dw levelinitB7
dw levelinitB8
dw levelinitB9
dw levelinitBA
dw levelinitBB
dw levelinitBC
dw levelinitBD
dw levelinitBE
dw levelinitBF
dw levelinitC0
dw levelinitC1
dw levelinitC2
dw levelinitC3
dw levelinitC4
dw levelinitC5
dw levelinitC6
dw levelinitC7
dw levelinitC8
dw levelinitC9
dw levelinitCA
dw levelinitCB
dw levelinitCC
dw levelinitCD
dw levelinitCE
dw levelinitCF
dw levelinitD0
dw levelinitD1
dw levelinitD2
dw levelinitD3
dw levelinitD4
dw levelinitD5
dw levelinitD6
dw levelinitD7
dw levelinitD8
dw levelinitD9
dw levelinitDA
dw levelinitDB
dw levelinitDC
dw levelinitDD

incsrc level_code.asm
incsrc level_init_code.asm

print bytes