
; continued from bank $1E
; intro, map, castle/fort samples

org $1F82D6     ;$1F8000-$1F82D5 are part of a brr. See Bank1E.asm
  ;filler 
  db $FF, $FF                               ; $1F82D6 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $1F82D8 |
  db $FF, $FF                               ; $1F82E0 |
  
  ;related to above?
  db $00, $00, $00, $04                     ; $1F82E2 |

; default music track
  db $60, $00, $00, $3C, $00, $40, $12, $40 ; $1F82E6 |
  db $DE, $43, $47, $59, $47, $59, $D8, $64 ; $1F82EE |
  db $D8, $64, $49, $66, $6D, $66, $8D, $67 ; $1F82F6 |
  db $E7, $67, $1F, $6C, $1F, $6C, $67, $6C ; $1F82FE |
  db $82, $6C, $57, $70, $57, $70, $4D, $77 ; $1F8306 |
  db $01, $78, $1C, $78, $57, $79, $C9, $7C ; $1F830E |
  db $65, $83, $9D, $87, $9D, $87, $38, $8C ; $1F8316 |
  db $38, $8C, $99, $91, $99, $91, $7A, $92 ; $1F831E |
  db $95, $92, $E6, $9B, $E6, $9B, $01, $9C ; $1F8326 |
  db $1C, $9C, $AF, $A2, $AF, $A2, $CA, $A2 ; $1F832E |
  db $E5, $A2, $56, $A4, $83, $A4, $E4, $A9 ; $1F8336 |
  db $E4, $A9, $B9, $AD, $B9, $AD, $75, $B5 ; $1F833E |
  db $75, $B5, $87, $B5, $60, $79, $00, $40 ; $1F8346 |
  
;SFX samples. 
;BRRs usually start off with a header byte followed by eight bytes of silence ($00) in order to circumvent
;a bug in the SPC chip that causes a popping sound if a sample is interrupted by new sample data, as it basically
;makes the pop silent as a workaround. Note that this header byte can be $00 too!
  
incbin Samples/Global/00_ROCKROLL.brr       ; $1F834E |
incbin Samples/Global/01_CRY.brr            ; $1F872C |
incbin Samples/Global/02_BONGO.brr          ; $1F9C95 |
incbin Samples/Global/03_VIBRAPHONE.brr     ; $1FA826 |
incbin Samples/Global/04_SLAPBASS.brr       ; $1FA9BB |
incbin Samples/Global/05_WARNING.brr        ; $1FAB35 |
incbin Samples/Global/06_PERCORGAN.brr      ; $1FAF6D |
incbin Samples/Global/07_COWBELL.brr        ; $1FAFD0 |
    
incbin Samples/Global/08_GUITARSTRUM.brr    ; $1FB3A5 |
incbin Samples/Global/09_MOTOR.brr          ; $1FBB4F |
incbin Samples/Global/0A_TRUMPET.brr        ; $1FBC9F |
incbin Samples/Global/0B_BOING.brr          ; $1FC6B3 |
incbin Samples/Global/0C_LICK.brr           ; $1FCAEB |
incbin Samples/Global/0D_DOORSLAM.brr       ; $1FCF86 |
incbin Samples/Global/0E_GLOCKENSPIEL.brr   ; $1FD4E7 |
incbin Samples/Global/0F_ORCHIT.brr         ; $1FD5E3 |
  
incbin Samples/Global/10_RECORDER.brr       ; $1FDF34 |
incbin Samples/Global/11_SNARE.brr          ; $1FDF6A |
incbin Samples/Global/12_VIOLIN.brr         ; $1FE5FD |
incbin Samples/Global/13_JAZZGUITAR.brr     ; $1FE633 |

incbin Samples/Global/14_PIRANHABITE.brr    ; $1FE7D1 |
incbin Samples/Global/15_SHYGUYSTOMP.brr    ; $1FED32 |
incbin Samples/Global/16_POP.brr            ; $1FF107 |
incbin Samples/Global/17_SPLASH.brr         ; $1FF8C3 |

  ;this is also uploaded to the SPC700 for some reason . . .
  ;possibly to make it easier to round the BRRs? 
  ;Shouldn't be necessary as locating the BRRs is usually 
  ;done on the hardware side
  
  db $FF, $FF, $FF, $FF, $FF                ; $1FFC9E |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $1FFCA6 |
  
  ;end of Sound Effect BRRs. The four bytes below are not uploaded with the above.
  
  db $00, $00, $00, $04                     ; $1FFCAE |

; castle/fort music track
  db $A8, $00, $00, $3D, $00, $FF, $E0, $B8 ; $1FFCB2 |
  db $02, $D6, $01, $FF, $E0, $B8, $03, $CC ; $1FFCBA |
  db $02, $FF, $E0, $B8, $07, $A8, $03, $FF ; $1FFCC2 |
  db $F6, $B8, $03, $FF, $04, $FF, $EC, $B8 ; $1FFCCA |
  db $0A, $02, $05, $FF, $E0, $B8, $03, $C8 ; $1FFCD2 |
  db $06, $FF, $E0, $B8, $03, $00, $07, $FF ; $1FFCDA |
  db $E0, $B8, $07, $A8, $08, $FF, $E0, $B8 ; $1FFCE2 |
  db $0A, $12, $09, $FF, $E0, $B8, $01, $D4 ; $1FFCEA |
  db $0A, $FF, $E0, $B8, $03, $74, $0B, $FF ; $1FFCF2 |
  db $EB, $B8, $01, $ED, $0C, $FF, $E0, $B8 ; $1FFCFA |
  db $03, $D0, $0D, $FF, $E0, $B8, $01, $E0 ; $1FFD02 |
  db $0E, $8F, $19, $B8, $03, $00, $0F, $8F ; $1FFD0A |
  db $E0, $B8, $07, $A8, $10, $8D, $E0, $B8 ; $1FFD12 |
  db $03, $00, $11, $8F, $F1, $B8, $07, $A8 ; $1FFD1A |
  db $12, $8B, $E0, $B8, $03, $00, $13, $FE ; $1FFD22 |
  db $F3, $B8, $04, $FF, $14, $FF, $E0, $B8 ; $1FFD2A |
  db $02, $7A, $15, $FF, $E0, $B8, $05, $5A ; $1FFD32 |
  db $16, $FF, $E0, $B8, $02, $3F, $17, $FF ; $1FFD3A |
  db $E0, $B8, $01, $18, $18, $FF, $F6, $B8 ; $1FFD42 |
  db $01, $81, $19, $FC, $E0, $B8, $03, $00 ; $1FFD4A |
  db $1A, $FF, $E0, $B8, $03, $00, $1B, $FF ; $1FFD52 |
  db $E0, $B8, $05, $3D, $18, $00, $E8, $3F ; $1FFD5A |
  db $33, $66, $7F, $99, $B2, $CC, $E5, $FC ; $1FFD62 |
  db $19, $33, $4C, $66, $72, $7F, $8C, $99 ; $1FFD6A |
  db $A5, $B2, $BF, $CC, $D8, $E5, $F2, $FC ; $1FFD72 |
  db $BA, $05, $7F, $DC, $97, $DC, $C7, $DC ; $1FFD7A |
  db $C7, $DC, $A7, $DC, $A7, $DC, $D7, $DC ; $1FFD82 |
  db $E7, $DC, $B7, $DC, $F7, $DC, $FF, $00 ; $1FFD8A |
  db $85, $DC, $00, $00, $07, $DD, $31, $DD ; $1FFD92 |
  db $00, $00, $48, $DD, $70, $DD, $98, $DD ; $1FFD9A |
  db $00, $00, $00, $00, $E5, $DD, $11, $DE ; $1FFDA2 |
  db $28, $DE, $3B, $DE, $59, $DE, $00, $00 ; $1FFDAA |
  db $00, $00, $00, $00, $79, $DE, $AA, $DE ; $1FFDB2 |
  db $B8, $DE, $00, $00, $00, $00, $00, $00 ; $1FFDBA |
  db $00, $00, $00, $00, $C6, $DE, $F3, $DE ; $1FFDC2 |
  db $FB, $DE, $00, $00, $FF, $DE, $00, $00 ; $1FFDCA |
  db $00, $00, $00, $00, $18, $DF, $43, $DF ; $1FFDD2 |
  db $5F, $DF, $94, $DF, $D1, $DF, $1E, $E0 ; $1FFDDA |
  db $00, $00, $00, $00, $39, $E0, $44, $E0 ; $1FFDE2 |
  db $4E, $E0, $00, $00, $75, $E0, $00, $00 ; $1FFDEA |
  db $00, $00, $00, $00, $9E, $E0, $CF, $E0 ; $1FFDF2 |
  db $DD, $E0, $EB, $E0, $00, $00, $00, $00 ; $1FFDFA |
  db $00, $00, $00, $00, $FA, $1C, $E5, $DC ; $1FFE02 |
  db $E7, $19, $F5, $FF, $00, $00, $F7, $02 ; $1FFE0A |
  db $1E, $02, $F8, $28, $0A, $0A, $E0, $1B ; $1FFE12 |
  db $ED, $50, $EE, $96, $E6, $E3, $00, $50 ; $1FFE1A |
  db $5A, $E1, $06, $60, $7D, $8C, $C8, $C8 ; $1FFE22 |
  db $EE, $96, $64, $C8, $C8, $00, $E0, $1B ; $1FFE2A |
  db $ED, $50, $EE, $96, $E6, $E3, $14, $28 ; $1FFE32 |
  db $32, $E1, $0E, $60, $7D, $8C, $C8, $C8 ; $1FFE3A |
  db $EE, $96, $64, $C8, $C8, $E0, $10, $E1 ; $1FFE42 |
  db $0A, $ED, $F0, $E3, $14, $18, $1E, $14 ; $1FFE4A |
  db $C9, $1E, $68, $A4, $05, $79, $A5, $09 ; $1FFE52 |
  db $38, $A7, $09, $57, $A4, $0A, $37, $A5 ; $1FFE5A |
  db $09, $38, $A8, $04, $75, $AB, $EF, $09 ; $1FFE62 |
  db $E1, $01, $60, $68, $A4, $E0, $10, $E1 ; $1FFE6A |
  db $11, $ED, $AA, $E3, $0F, $18, $1E, $1A ; $1FFE72 |
  db $C9, $1E, $68, $A4, $05, $79, $A5, $09 ; $1FFE7A |
  db $38, $A7, $09, $57, $A4, $0A, $37, $A5 ; $1FFE82 |
  db $09, $38, $A8, $04, $75, $AB, $EF, $09 ; $1FFE8A |
  db $E1, $01, $5A, $68, $A4, $E0, $02, $E1 ; $1FFE92 |
  db $0E, $ED, $3C, $EE, $78, $C8, $28, $C9 ; $1FFE9A |
  db $03, $3D, $AB, $AB, $AB, $06, $5D, $AB ; $1FFEA2 |
  db $A6, $AB, $08, $A6, $0A, $AB, $0B, $AB ; $1FFEAA |
  db $0E, $AB, $12, $A6, $14, $AB, $18, $AB ; $1FFEB2 |
  db $08, $A6, $04, $AB, $08, $AB, $60, $C9 ; $1FFEBA |
  db $12, $C9, $08, $A6, $08, $5F, $AB, $06 ; $1FFEC2 |
  db $5D, $A6, $06, $5F, $AB, $AB, $AB, $06 ; $1FFECA |
  db $5D, $A6, $06, $5F, $AB, $AB, $AB, $06 ; $1FFED2 |
  db $5D, $A6, $08, $5F, $AB, $AB, $10, $AB ; $1FFEDA |
  db $48, $C9, $E0, $1B, $ED, $F0, $E3, $18 ; $1FFEE2 |
  db $1C, $18, $E1, $06, $48, $7D, $8C, $48 ; $1FFEEA |
  db $6D, $8E, $E6, $90, $B4, $48, $7D, $8F ; $1FFEF2 |
  db $48, $6D, $8E, $E6, $90, $F0, $48, $7D ; $1FFEFA |
  db $91, $48, $6D, $93, $E6, $90, $B4, $48 ; $1FFF02 |
  db $7D, $94, $48, $6D, $93, $00, $EF, $56 ; $1FFF0A |
  db $E1, $01, $C9, $31, $5B, $A1, $17, $C9 ; $1FFF12 |
  db $1A, $1B, $A4, $17, $A4, $EF, $73, $E1 ; $1FFF1A |
  db $01, $C9, $31, $5B, $A9, $EF, $7F, $E1 ; $1FFF22 |
  db $01, $17, $C9, $1A, $1B, $A0, $17, $A0 ; $1FFF2A |
  db $EF, $A0, $E1, $01, $C9, $31, $5D, $A3 ; $1FFF32 |
  db $E0, $1B, $ED, $F0, $E3, $12, $1E, $18 ; $1FFF3A |
  db $E1, $0A, $17, $7D, $A4, $1A, $1D, $A7 ; $1FFF42 |
  db $17, $AB, $EF, $AC, $E1, $01, $17, $7D ; $1FFF4A |
  db $B0, $19, $1D, $AF, $18, $C9, $E0, $1B ; $1FFF52 |
  db $ED, $AA, $E3, $0E, $1F, $18, $E1, $08 ; $1FFF5A |
  db $0A, $C9, $17, $7D, $A4, $1A, $1D, $A7 ; $1FFF62 |
  db $17, $AB, $EF, $AC, $E1, $01, $17, $7D ; $1FFF6A |
  db $B0, $19, $1D, $AF, $0E, $C9, $E5, $B4 ; $1FFF72 |
  db $E6, $90, $E6, $E0, $1B, $ED, $C8, $E3 ; $1FFF7A |
  db $18, $1C, $18, $E1, $06, $48, $7D, $8C ; $1FFF82 |
  db $48, $6D, $93, $E6, $90, $B4, $48, $7D ; $1FFF8A |
  db $8C, $48, $6D, $93, $E6, $90, $F0, $48 ; $1FFF92 |
  db $7D, $8C, $48, $6D, $93, $E6, $90, $B4 ; $1FFF9A |
  db $48, $7D, $8C, $48, $6D, $93, $00, $E0 ; $1FFFA2 |
  db $1B, $ED, $F0, $E3, $15, $1C, $18, $E1 ; $1FFFAA |
  db $0C, $EF, $DD, $E1, $02, $E0, $1B, $ED ; $1FFFB2 |
  db $F0, $E3, $14, $1E, $1B, $E1, $0E, $EF ; $1FFFBA |
  db $F4, $E1, $02, $E5, $B4, $E6, $90, $E6 ; $1FFFC2 |
  db $E7, $23, $F5, $FF, $00, $00, $F7, $02 ; $1FFFCA |
  db $1E, $02, $F8, $60, $28, $28, $E0, $1B ; $1FFFD2 |
  db $ED, $F0, $E3, $18, $1C, $18, $E1, $06 ; $1FFFDA |
  db $48, $7D, $8C, $48, $6D, $8E, $E6, $90 ; $1FFFE2 |
  db $B4, $48, $7D, $8F, $48, $6D, $8E, $00 ; $1FFFEA |
  db $EF, $56, $E1, $01, $C9, $31, $5B, $A1 ; $1FFFF2 |
  db $EF, $7F, $E1, $01, $E0, $1B           ; $1FFFFA |
; continued into bank $20
