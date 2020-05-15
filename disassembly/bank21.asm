; Waves crashing SFX (BRR)
org $20B0B6  
	incbin "samples/titlescreen/00_WAVES.brr"			; $20B0B6 |
	incbin "samples/titlescreen/01_GULLS.brr":0-10D1	; $20EF2F |
org $218000
	incbin "samples/titlescreen/01_GULLS.brr":10D1-1B48	; $218000 | Bank-Crossing requires a split
	incbin "samples/titlescreen/02_XYLOPHONE.brr"  		; $218A77 |
	incbin "samples/titlescreen/03_VIBRAPHONE.brr" 		; $219422 | Used for menu sfx on the title screen
	incbin "samples/titlescreen/04_PANFLUTE.brr"		; $2195B7 |
	incbin "samples/titlescreen/05_ALTRECORDER.brr"		; $219A1C | Unused!
	incbin "samples/titlescreen/06_SLAPBASS.brr"		; $219A52 |
	incbin "samples/titlescreen/07_BONGO.brr"			; $219BCC |
	incbin "samples/titlescreen/08_SHAKERS.brr"			; $21A75D |
	incbin "samples/titlescreen/09_MUSICBOX.brr"		; $21AAA2 |
	incbin "samples/titlescreen/0A_MBOXMECHANISM.brr"	; $21B015 |
  
  ;filler
  
  fillbyte $FF : fill $0C ; $21B3E8 |
  
  ;related to above
  db $00, $00, $00, $04 ; $21B3F7 |

; freespace
  fillbyte $FF : fill $4C06 ; $21B3FB |
  
