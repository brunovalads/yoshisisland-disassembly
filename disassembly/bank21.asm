; Waves crashing SFX (BRR)
org $20B0B6  
	incbin "Samples/TitleScreen/00_WAVES.BRR"			; $20B0B6 |
	incbin "Samples/TitleScreen/01_GULLS.BRR":0-10D1	; $20EF2F |
org $218000
	incbin "Samples/TitleScreen/01_GULLS.BRR":10D1-1B48	; $218000 | Bank-Crossing requires a split
	incbin "Samples/TitleScreen/02_XYLOPHONE.BRR"  		; $218A77 |
	incbin "Samples/TitleScreen/03_VIBRAPHONE.BRR" 		; $219422 | Used for menu sfx on the title screen
	incbin "Samples/TitleScreen/04_PANFLUTE.BRR"		; $2195B7 |
	incbin "Samples/TitleScreen/05_ALTRECORDER.BRR"		; $219A1C | Unused!
	incbin "Samples/TitleScreen/06_SLAPBASS.BRR"		; $219A52 |
	incbin "Samples/TitleScreen/07_BONGO.BRR"			; $219BCC |
	incbin "Samples/TitleScreen/08_SHAKERS.BRR"			; $21A75D |
	incbin "Samples/TitleScreen/09_MUSICBOX.BRR"		; $21AAA2 |
	incbin "Samples/TitleScreen/0A_MBOXMECHANISM.BRR"	; $21B015 |
  
  ;filler
  
  fillbyte $FF : fill $0C ; $21B3E8 |
  
  ;related to above
  db $00, $00, $00, $04 ; $21B3F7 |

; freespace
  fillbyte $FF : fill $4C06 ; $21B3FB |
  
