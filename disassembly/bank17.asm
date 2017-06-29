org $178000

; tilemap init queue entries
; island graphic tilemap init
  dw $3000, $47FF, $01BF                    ; $178000 |
  dw $FFFF                                  ; $178006 |
; island cutscene tilemap init
  dw $3800, $47FF, $0000                    ; $178008 |
  dw $7E82, $4277, $05FF                    ; $17800E |
  dw $FFFF                                  ; $178014 |


  db $43, $1B, $18, $5B, $7E                ; $178016 |

  db $F0, $40, $50, $F0, $40, $50, $00      ; $17801B |

  db $43, $1D, $98, $5B, $7E                ; $178022 |

  db $F0, $00, $52, $F0, $00, $52, $00      ; $178027 |

  db $43, $21, $18, $5C, $7E                ; $17802E |

  db $20, $22, $5C, $B0, $C0, $53, $01, $22 ; $178033 |
  db $5C, $00, $26, $26, $FF, $7F           ; $17803B |

  db $43, $0D, $18, $5C, $7E                ; $178041 |

  db $76, $45, $00, $01, $39, $00, $00      ; $178046 |

  db $43, $0F, $98, $5C, $7E                ; $17804D |

  db $20, $C0, $55, $B0, $C4, $55, $01, $C0 ; $178052 |
  db $55, $00                               ; $17805A |

  db $41, $26, $98, $5C, $7E                ; $17805C |

  db $0F, $C0, $55, $E4, $C2, $55, $81, $A0 ; $178061 |
  db $56, $00                               ; $178069 |

  db $00, $05, $18, $5A, $7E                ; $17806B |

  db $76, $10, $6A, $07, $00                ; $178070 |

  db $00, $2C, $98, $5A, $7E                ; $178075 |

  db $70, $13, $70, $11, $00                ; $17807A |

  db $43, $0D, $18, $5D, $7E                ; $17807F |

  db $5F, $41, $00, $01, $A1, $09, $01, $A5 ; $178084 |
  db $09, $01, $A9, $09, $02, $AD, $09, $03 ; $17808C |
  db $B1, $09, $04, $B5, $09, $05, $B9, $09 ; $178094 |
  db $06, $BD, $09, $01, $39, $00, $00      ; $17809C |

  db $00, $F8, $0F, $80, $93, $5F, $DA, $58 ; $1780A3 |
  db $A1, $21, $C8, $BB, $20, $B9, $34, $40 ; $1780AB |
  db $B9, $D4, $70, $00, $4D, $00, $1C, $00 ; $1780B3 |
  db $EF, $00, $9C, $00, $2A, $00           ; $1780BB |

save_data_last_lvl_ptr:
  dl $707C02, $707C6A, $707CD2              ; $1780C1 | "last level beaten" save data pointers file 1, 2, 3

save_data_6_E_ptr:
  dw $7C47, $7CAF, $7D17                    ; $1780CA | 6-E completed / score save data pointers file 1, 2, 3

save_data_6_8_ptr:
  dw $7C46, $7CAE, $7D16                    ; $1780D0 | 6-8 completed / score save data pointers file 1, 2, 3

; title screen init
gamemode_18:
  LDA #$12                                  ; $1780D6 |
  JSL $008279                               ; $1780D8 |
  JSL clear_basic_states                    ; $1780DC | init some ram
  JSL copy_division_lookup_to_sram          ; $1780E0 |
  REP #$20                                  ; $1780E4 |
  LDA #$0080                                ; $1780E6 |
  STA $020E                                 ; $1780E9 |
  LDA #$0100                                ; $1780EC |
  STA $0210                                 ; $1780EF |
  STZ $39                                   ; $1780F2 |
  LDA #$0060                                ; $1780F4 |
  STA $3B                                   ; $1780F7 |
  STZ $3D                                   ; $1780F9 |
  LDA #$008F                                ; $1780FB |
  STA $3F                                   ; $1780FE |
  STZ $41                                   ; $178100 |
  STZ $43                                   ; $178102 |
  STZ $09A3                                 ; $178104 |
  STZ $09A7                                 ; $178107 |
  STZ $09AB                                 ; $17810A |
  STZ $09AF                                 ; $17810D |
  STZ $09B3                                 ; $178110 |
  STZ $09B7                                 ; $178113 |
  STZ $09BB                                 ; $178116 |
  STZ $09BF                                 ; $178119 |
  STZ $0214                                 ; $17811C |
  SEP #$20                                  ; $17811F |
  LDA $011A                                 ; $178121 |
  BNE CODE_17815C                           ; $178124 |
  LDA $707E7C                               ; $178126 |\
  ASL A                                     ; $17812A | | save file slot * 3
  ADC $707E7C                               ; $17812B | |
  TAX                                       ; $17812F |/
  REP #$20                                  ; $178130 |\
  LDA save_data_last_lvl_ptr,x              ; $178132 | | store long save "last level beaten" file pointer
  STA $00                                   ; $178135 | | -> $7E0000~$7E0002
  LDA save_data_last_lvl_ptr+1,x            ; $178137 | |
  STA $01                                   ; $17813A |/
  STZ !r_last_world_unlocked                ; $17813C | clear "final world unlocked" flag
  SEP #$20                                  ; $17813F |
  LDX #$00                                  ; $178141 |
  LDA [$00]                                 ; $178143 |\  load last level beaten save data
  AND #$7F                                  ; $178145 | | mask off the "completed" flag
  BEQ .store_world                          ; $178147 |/  if this is 0, skip computing

.compute_world
  INX                                       ; $178149 |\  loop
  SEC                                       ; $17814A | | subtract $C (# of icons per world) until
  SBC #$0C                                  ; $17814B | | negative, counting 1 in X each time
  BPL .compute_world                        ; $17814D | |
  DEX                                       ; $17814F |/  then -1 afterward
  CPX #$05                                  ; $178150 |\
  BNE .store_world                          ; $178152 | | are we final world value $05?
  INC !r_last_world_unlocked                ; $178154 |/  if so, set "final world unlocked" flag

.store_world
  TXA                                       ; $178157 |\
  ASL A                                     ; $178158 | | store world * 2 -> current world value
  STA !r_cur_world                          ; $178159 |/

CODE_17815C:
  LDX #$04                                  ; $17815C |

CODE_17815E:
  LDA $8016,x                               ; $17815E |
  STA $4370,x                               ; $178161 |
  LDA $8022,x                               ; $178164 |
  STA $4360,x                               ; $178167 |
  LDA $802E,x                               ; $17816A |
  STA $4350,x                               ; $17816D |
  LDA $804D,x                               ; $178170 |
  STA $4340,x                               ; $178173 |
  LDA $806B,x                               ; $178176 |
  STA $4330,x                               ; $178179 |
  LDA $8075,x                               ; $17817C |
  STA $4320,x                               ; $17817F |
  LDA $807F,x                               ; $178182 |
  STA $4310,x                               ; $178185 |
  DEX                                       ; $178188 |
  BPL CODE_17815E                           ; $178189 |
  LDA #$7E                                  ; $17818B |
  STA $4377                                 ; $17818D |
  STA $4367                                 ; $178190 |
  STA $4357                                 ; $178193 |
  STA $4347                                 ; $178196 |
  STA $4337                                 ; $178199 |
  STA $4327                                 ; $17819C |
  STZ $4317                                 ; $17819F |
  LDX #$1E                                  ; $1781A2 |

CODE_1781A4:
  LDA $801B,x                               ; $1781A4 |
  STA $7E5B18,x                             ; $1781A7 |
  LDA $8027,x                               ; $1781AB |
  STA $7E5B98,x                             ; $1781AE |
  LDA $8033,x                               ; $1781B2 |
  STA $7E5C18,x                             ; $1781B5 |
  LDA $8052,x                               ; $1781B9 |
  STA $7E5C98,x                             ; $1781BC |
  LDA $8070,x                               ; $1781C0 |
  STA $7E5A18,x                             ; $1781C3 |
  LDA $807A,x                               ; $1781C7 |
  STA $7E5A98,x                             ; $1781CA |
  LDA $8084,x                               ; $1781CE |
  STA $7E5D18,x                             ; $1781D1 |
  DEX                                       ; $1781D5 |
  BPL CODE_1781A4                           ; $1781D6 |
  LDA #$0D                                  ; $1781D8 |
  STA $09A0                                 ; $1781DA |
  JSL $00B3CF                               ; $1781DD |
  LDX #$00                                  ; $1781E1 |
  JSL init_scene_regs                       ; $1781E3 |
  LDA #$3C                                  ; $1781E7 |
  STA !reg_bg4sc                            ; $1781E9 |
  STZ !reg_m7sel                            ; $1781EC |
  REP #$20                                  ; $1781EF |
  LDY #$00                                  ; $1781F1 |
  STY !reg_vmain                            ; $1781F3 |
  LDA #$3800                                ; $1781F6 |
  STA !reg_vmadd                            ; $1781F9 |
  LDA #$3980                                ; $1781FC |
  STA $4300                                 ; $1781FF |
  LDA #$7BBE                                ; $178202 |
  STA $4302                                 ; $178205 |
  LDY #$7E                                  ; $178208 |
  STY $4304                                 ; $17820A |
  LDA #$0800                                ; $17820D |
  STA $4305                                 ; $178210 |
  LDY !reg_vmdatarl                         ; $178213 |
  LDX #$01                                  ; $178216 |
  STX !reg_mdmaen                           ; $178218 |
  LDY #$80                                  ; $17821B |
  STY !reg_vmain                            ; $17821D |
  LDA #$3800                                ; $178220 |
  STA !reg_vmadd                            ; $178223 |
  LDY #$3A                                  ; $178226 |
  STY $4301                                 ; $178228 |
  LDA #$0800                                ; $17822B |
  STA $4305                                 ; $17822E |
  LDY !reg_vmdatarh                         ; $178231 |
  STX !reg_mdmaen                           ; $178234 |
  LDY #$7F                                  ; $178237 |
  STY $00                                   ; $178239 |
  STZ !reg_vmain                            ; $17823B |
  STZ !reg_vmadd                            ; $17823E |
  LDA #$1808                                ; $178241 |
  STA $4300                                 ; $178244 |
  LDA #$0000                                ; $178247 |
  STA $4302                                 ; $17824A |
  STZ $4304                                 ; $17824D |
  LDA #$2000                                ; $178250 |
  STA $4305                                 ; $178253 |
  LDX #$01                                  ; $178256 |
  STX !reg_mdmaen                           ; $178258 |
  LDY #$80                                  ; $17825B |
  STY !reg_vmain                            ; $17825D |
  LDY #$03                                  ; $178260 |
  LDA $011A                                 ; $178262 |
  AND #$00FF                                ; $178265 |
  CMP #$0080                                ; $178268 |
  BEQ CODE_178275                           ; $17826B |
  LDA !r_last_world_unlocked                ; $17826D |
  BNE CODE_178275                           ; $178270 |
  DEY                                       ; $178272 |
  DEY                                       ; $178273 |
  DEY                                       ; $178274 |

CODE_178275:
  LDA #$3C00                                ; $178275 |
  STA !reg_vmadd                            ; $178278 |
  LDA #$1801                                ; $17827B |
  STA $4300                                 ; $17827E |
  LDA $80A4,y                               ; $178281 |
  STA $4303                                 ; $178284 |
  LDA $80A3,y                               ; $178287 |
  STA $4302                                 ; $17828A |
  LDA #$0480                                ; $17828D |
  STA $4305                                 ; $178290 |
  STX !reg_mdmaen                           ; $178293 |
  LDA #$3E40                                ; $178296 |
  STA !reg_vmadd                            ; $178299 |
  LDA #$FC80                                ; $17829C |
  STA $4302                                 ; $17829F |
  LDY #$0F                                  ; $1782A2 |
  STY $4304                                 ; $1782A4 |
  LDA #$0380                                ; $1782A7 |
  STA $4305                                 ; $1782AA |
  STX !reg_mdmaen                           ; $1782AD |
  LDX #$70                                  ; $1782B0 |
  STX $02                                   ; $1782B2 |
  LDA $707E7C                               ; $1782B4 |
  ASL A                                     ; $1782B8 |
  TAX                                       ; $1782B9 |
  LDA $80CA,x                               ; $1782BA |
  STA $00                                   ; $1782BD |
  LDY #$05                                  ; $1782BF |
  LDA #$3E9A                                ; $1782C1 |
  STA $0A                                   ; $1782C4 |
  LDA #$3EBA                                ; $1782C6 |
  STA $0C                                   ; $1782C9 |

CODE_1782CB:
  LDA #$2B22                                ; $1782CB |
  STA $10                                   ; $1782CE |
  STA $12                                   ; $1782D0 |
  STA $20                                   ; $1782D2 |
  STA $22                                   ; $1782D4 |
  LDA [$00]                                 ; $1782D6 |
  AND #$007F                                ; $1782D8 |
  CMP #$0064                                ; $1782DB |
  BCC CODE_1782F0                           ; $1782DE |
  LDA #$2F0B                                ; $1782E0 |
  STA $10                                   ; $1782E3 |
  INC A                                     ; $1782E5 |
  STA $12                                   ; $1782E6 |
  LDA #$2F1B                                ; $1782E8 |
  STA $20                                   ; $1782EB |
  INC A                                     ; $1782ED |
  STA $22                                   ; $1782EE |

CODE_1782F0:
  LDA $0A                                   ; $1782F0 |
  STA !reg_vmadd                            ; $1782F2 |
  LDA $10                                   ; $1782F5 |
  STA !reg_vmdatawl                         ; $1782F7 |
  LDA $12                                   ; $1782FA |
  STA !reg_vmdatawl                         ; $1782FC |
  LDA $0C                                   ; $1782FF |
  STA !reg_vmadd                            ; $178301 |
  LDA $20                                   ; $178304 |
  STA !reg_vmdatawl                         ; $178306 |
  LDA $22                                   ; $178309 |
  STA !reg_vmdatawl                         ; $17830B |
  LDA $00                                   ; $17830E |
  SEC                                       ; $178310 |
  SBC #$000C                                ; $178311 |
  STA $00                                   ; $178314 |
  DEC $0A                                   ; $178316 |
  DEC $0A                                   ; $178318 |
  DEC $0C                                   ; $17831A |
  DEC $0C                                   ; $17831C |
  DEY                                       ; $17831E |
  BPL CODE_1782CB                           ; $17831F |
  LDY $011A                                 ; $178321 |
  BNE CODE_17838C                           ; $178324 |
  LDA #$0400                                ; $178326 |
  STA $1405                                 ; $178329 |
  LDA #$DA00                                ; $17832C |
  STA $6CA4                                 ; $17832F |
  LDA #$5800                                ; $178332 |
  STA $6CA6                                 ; $178335 |
  LDA #$0000                                ; $178338 |
  STA $6CA8                                 ; $17833B |
  LDA #$0070                                ; $17833E |
  STA $6CA0                                 ; $178341 |
  PHB                                       ; $178344 |
  LDX #$7E                                  ; $178345 |
  PHX                                       ; $178347 |
  PLB                                       ; $178348 |
  REP #$10                                  ; $178349 |
  LDY #$01FC                                ; $17834B |

CODE_17834E:
  LDA #$2626                                ; $17834E |
  STA $53C0,y                               ; $178351 |
  DEY                                       ; $178354 |
  DEY                                       ; $178355 |
  DEY                                       ; $178356 |
  DEY                                       ; $178357 |
  BPL CODE_17834E                           ; $178358 |
  LDX #$007E                                ; $17835A |
  LDY #$00FC                                ; $17835D |

CODE_178360:
  LDA $5FCC2E,x                             ; $178360 |
  STA $53C2,y                               ; $178364 |
  STA $54C2,y                               ; $178367 |
  DEY                                       ; $17836A |
  DEY                                       ; $17836B |
  DEY                                       ; $17836C |
  DEY                                       ; $17836D |
  DEX                                       ; $17836E |
  DEX                                       ; $17836F |
  BPL CODE_178360                           ; $178370 |
  LDX #$00E0                                ; $178372 |

CODE_178375:
  LDA $3D                                   ; $178375 |
  STA $55C0,x                               ; $178377 |
  LDA $3F                                   ; $17837A |
  STA $55C2,x                               ; $17837C |
  DEX                                       ; $17837F |
  DEX                                       ; $178380 |
  DEX                                       ; $178381 |
  DEX                                       ; $178382 |
  BPL CODE_178375                           ; $178383 |
  SEP #$30                                  ; $178385 |
  PLB                                       ; $178387 |
  LDA #$FE                                  ; $178388 |
  BRA CODE_1783BD                           ; $17838A |

CODE_17838C:
  LDY #$00                                  ; $17838C |
  LDA #$7BBE                                ; $17838E |
  STA $20                                   ; $178391 |
  LDX #$7E                                  ; $178393 |
  STX $22                                   ; $178395 |
  LDA #$0400                                ; $178397 |
  JSL dma_init_gen_purpose                  ; $17839A |
  LDA #$83BE                                ; $17839E |
  STA $20                                   ; $1783A1 |
  LDA #$0400                                ; $1783A3 |
  JSL dma_init_gen_purpose                  ; $1783A6 |
  LDA #$0011                                ; $1783AA |
  STA !r_reg_tm_mirror                      ; $1783AD |
  SEP #$20                                  ; $1783B0 |
  LDA #$06                                  ; $1783B2 |
  STA $0127                                 ; $1783B4 |
  JSL prepare_tilemap_dma_queue_l           ; $1783B7 |
  LDA #$CE                                  ; $1783BB |

CODE_1783BD:
  STA !r_reg_hdmaen_mirror                  ; $1783BD |
  REP #$10                                  ; $1783C0 |
  LDX #$0044                                ; $1783C2 |

CODE_1783C5:
  STZ $09C1,x                               ; $1783C5 |
  DEX                                       ; $1783C8 |
  BPL CODE_1783C5                           ; $1783C9 |
  LDX #$05DD                                ; $1783CB |

CODE_1783CE:
  STZ $702A,x                               ; $1783CE |
  DEX                                       ; $1783D1 |
  BPL CODE_1783CE                           ; $1783D2 |
  SEP #$10                                  ; $1783D4 |
  LDX #$02                                  ; $1783D6 |
  LDA $011A                                 ; $1783D8 |
  CMP #$80                                  ; $1783DB |
  BEQ CODE_1783E6                           ; $1783DD |
  LDA !r_last_world_unlocked                ; $1783DF |
  BNE CODE_1783E6                           ; $1783E2 |
  DEX                                       ; $1783E4 |
  DEX                                       ; $1783E5 |

CODE_1783E6:
  JSL $00BAEA                               ; $1783E6 |
  PHB                                       ; $1783EA |
  LDA #$7E                                  ; $1783EB |
  PHA                                       ; $1783ED |
  PLB                                       ; $1783EE |
  REP #$30                                  ; $1783EF |
  LDA #$0400                                ; $1783F1 |
  STA $04                                   ; $1783F4 |
  LDA $011A                                 ; $1783F6 |
  AND #$00FF                                ; $1783F9 |
  CMP #$0080                                ; $1783FC |
  BEQ CODE_178408                           ; $1783FF |
  LDA !r_last_world_unlocked                ; $178401 |
  BNE CODE_178408                           ; $178404 |
  STZ $04                                   ; $178406 |

CODE_178408:
  LDY $4800                                 ; $178408 |
  LDA $04                                   ; $17840B |
  CLC                                       ; $17840D |
  ADC #$9800                                ; $17840E |
  STA $04                                   ; $178411 |
  LDA #$0020                                ; $178413 |
  STA $02                                   ; $178416 |
  LDA #$0800                                ; $178418 |

CODE_17841B:
  STA $00                                   ; $17841B |
  STA $0000,y                               ; $17841D |
  LDA #$0000                                ; $178420 |
  STA $0002,y                               ; $178423 |
  LDA #$1800                                ; $178426 |
  STA $0003,y                               ; $178429 |
  LDA $04                                   ; $17842C |
  STA $0005,y                               ; $17842E |
  CLC                                       ; $178431 |
  ADC #$0020                                ; $178432 |
  STA $04                                   ; $178435 |
  LDA #$005F                                ; $178437 |
  STA $0007,y                               ; $17843A |
  LDA #$0020                                ; $17843D |
  STA $0008,y                               ; $178440 |
  TYA                                       ; $178443 |
  CLC                                       ; $178444 |
  ADC #$000C                                ; $178445 |
  STA $000A,y                               ; $178448 |
  TAY                                       ; $17844B |
  LDA $00                                   ; $17844C |
  CLC                                       ; $17844E |
  ADC #$0080                                ; $17844F |
  DEC $02                                   ; $178452 |
  BNE CODE_17841B                           ; $178454 |
  STY $4800                                 ; $178456 |
  PLB                                       ; $178459 |
  LDX #$0002                                ; $17845A |
  LDA $011A                                 ; $17845D |
  AND #$00FF                                ; $178460 |
  CMP #$0080                                ; $178463 |
  BEQ CODE_17846F                           ; $178466 |
  LDA !r_last_world_unlocked                ; $178468 |
  BNE CODE_17846F                           ; $17846B |
  DEX                                       ; $17846D |
  DEX                                       ; $17846E |

CODE_17846F:
  LDA $10EE9A,x                             ; $17846F |
  STA $00                                   ; $178473 |
  LDA $10EE9E,x                             ; $178475 |
  STA $02                                   ; $178479 |
  SEP #$20                                  ; $17847B |
  PHB                                       ; $17847D |
  LDA #$10                                  ; $17847E |
  PHA                                       ; $178480 |
  PLB                                       ; $178481 |
  LDY #$0000                                ; $178482 |

CODE_178485:
  LDA ($00),y                               ; $178485 |
  CMP #$FF                                  ; $178487 |
  BEQ CODE_17849C                           ; $178489 |
  INC $702A                                 ; $17848B |
  LDX #$0004                                ; $17848E |

CODE_178491:
  LDA ($00),y                               ; $178491 |
  STA $702C,y                               ; $178493 |
  INY                                       ; $178496 |
  DEX                                       ; $178497 |
  BNE CODE_178491                           ; $178498 |
  BRA CODE_178485                           ; $17849A |

CODE_17849C:
  PLB                                       ; $17849C |
  LDA $6CA5                                 ; $17849D |
  STA $702D                                 ; $1784A0 |
  LDA $6CA7                                 ; $1784A3 |
  STA $702E                                 ; $1784A6 |
  LDA $6CA9                                 ; $1784A9 |
  STA $702F                                 ; $1784AC |
  LDA #$C0                                  ; $1784AF |
  SEC                                       ; $1784B1 |
  SBC $6CA0                                 ; $1784B2 |
  STA $021E                                 ; $1784B5 |
  REP #$30                                  ; $1784B8 |
  LDX #$0254                                ; $1784BA |
  LDA #$0100                                ; $1784BD |

CODE_1784C0:
  STA $7286,x                               ; $1784C0 |
  DEX                                       ; $1784C3 |
  DEX                                       ; $1784C4 |
  DEX                                       ; $1784C5 |
  DEX                                       ; $1784C6 |
  BPL CODE_1784C0                           ; $1784C7 |
  SEP #$30                                  ; $1784C9 |
  PHB                                       ; $1784CB |
  LDA #$10                                  ; $1784CC |
  PHA                                       ; $1784CE |
  PLB                                       ; $1784CF |
  LDY #$00                                  ; $1784D0 |

CODE_1784D2:
  LDA ($02),y                               ; $1784D2 |
  BMI CODE_1784E3                           ; $1784D4 |
  LDX #$04                                  ; $1784D6 |

CODE_1784D8:
  LDA ($02),y                               ; $1784D8 |
  STA $09C1,y                               ; $1784DA |
  INY                                       ; $1784DD |
  DEX                                       ; $1784DE |
  BNE CODE_1784D8                           ; $1784DF |
  BRA CODE_1784D2                           ; $1784E1 |

CODE_1784E3:
  PLB                                       ; $1784E3 |
  JSR CODE_178661                           ; $1784E4 |
  LDX !r_cur_world                          ; $1784E7 |
  BNE CODE_1784EF                           ; $1784EA |
  JMP CODE_1785A1                           ; $1784EC |

CODE_1784EF:
  LDA $011A                                 ; $1784EF |
  AND #$7F                                  ; $1784F2 |
  BNE CODE_1784F8                           ; $1784F4 |
  INX                                       ; $1784F6 |
  INX                                       ; $1784F7 |

CODE_1784F8:
  LDA $80A7,x                               ; $1784F8 |
  STA $6CA5                                 ; $1784FB |
  STA $702D                                 ; $1784FE |
  LDA $80A8,x                               ; $178501 |
  STA $6CA7                                 ; $178504 |
  STA $702E                                 ; $178507 |
  LDA $80B3,x                               ; $17850A |
  STA $6CA0                                 ; $17850D |
  LDA #$C0                                  ; $178510 |
  SEC                                       ; $178512 |
  SBC $6CA0                                 ; $178513 |
  STA $021E                                 ; $178516 |
  LDA $011A                                 ; $178519 |
  AND #$7F                                  ; $17851C |
  BNE CODE_178568                           ; $17851E |
  LDA !r_cur_world                          ; $178520 |\
  CMP #$0A                                  ; $178523 | | if current world != world 6
  BNE CODE_178568                           ; $178525 |/
  LDA $707E7C                               ; $178527 |\
  ASL A                                     ; $17852B | | load save file # * 2 (00, 02, 04)
  TAY                                       ; $17852C |/
  LDA #$70                                  ; $17852D |\ sram bank
  STA $02                                   ; $17852F |/
  REP #$20                                  ; $178531 |\
  LDA save_data_6_8_ptr,y                   ; $178533 | | sram address for 6-8's score/completed
  STA $00                                   ; $178536 |/  -> $7E0000~$7E0002
  SEP #$20                                  ; $178538 |\
  LDA [$00]                                 ; $17853A | | branch if not completed 6-8
  AND #$80                                  ; $17853C | |
  BEQ CODE_178566                           ; $17853E |/
  REP #$20                                  ; $178540 |
  LDA $13FD97,x                             ; $178542 |
  STA $021C                                 ; $178546 |
  LDA $10F0DE,x                             ; $178549 |
  STA $096D                                 ; $17854D |
  REP #$10                                  ; $178550 |
  TAY                                       ; $178552 |
  LDA #$0000                                ; $178553 |
  STA $702C,y                               ; $178556 |
  SEP #$10                                  ; $178559 |
  TXA                                       ; $17855B |
  ASL A                                     ; $17855C |
  TAY                                       ; $17855D |
  LDA #$000A                                ; $17855E |
  STA $09C1,y                               ; $178561 |
  SEP #$20                                  ; $178564 |

CODE_178566:
  BRA CODE_1785A1                           ; $178566 |

CODE_178568:
  REP #$20                                  ; $178568 |
  LDA $13FD97,x                             ; $17856A |
  STA $021C                                 ; $17856E |
  LDA $10F0DE,x                             ; $178571 |
  STA $096D                                 ; $178575 |
  SEP #$20                                  ; $178578 |
  CPX #$0C                                  ; $17857A |
  BCS CODE_1785A1                           ; $17857C |
  TXA                                       ; $17857E |
  ASL A                                     ; $17857F |
  TAY                                       ; $178580 |

CODE_178581:
  DEY                                       ; $178581 |
  DEY                                       ; $178582 |
  DEY                                       ; $178583 |
  DEY                                       ; $178584 |
  BEQ CODE_1785A1                           ; $178585 |
  LDA #$0A                                  ; $178587 |
  STA $09C1,y                               ; $178589 |
  TYA                                       ; $17858C |
  LSR A                                     ; $17858D |
  TAX                                       ; $17858E |
  REP #$20                                  ; $17858F |
  LDA $10F0DE,x                             ; $178591 |
  REP #$10                                  ; $178595 |
  TAX                                       ; $178597 |
  SEP #$20                                  ; $178598 |
  STZ $702C,x                               ; $17859A |
  SEP #$10                                  ; $17859D |
  BRA CODE_178581                           ; $17859F |

CODE_1785A1:
  LDA $011A                                 ; $1785A1 |
  BEQ CODE_1785B8                           ; $1785A4 |
  LDA $011A                                 ; $1785A6 |
  BEQ CODE_1785B8                           ; $1785A9 |
  CMP #$80                                  ; $1785AB |
  BNE CODE_1785B3                           ; $1785AD |
  LDA #$1C                                  ; $1785AF |
  BRA CODE_1785B5                           ; $1785B1 |

CODE_1785B3:
  LDA #$02                                  ; $1785B3 |

CODE_1785B5:
  STA $6CA2                                 ; $1785B5 |

CODE_1785B8:
  LDA $011A                                 ; $1785B8 |
  BMI CODE_1785F3                           ; $1785BB |
  LDA $707E7C                               ; $1785BD |
  STA $111D                                 ; $1785C1 |
  JSR CODE_1790E0                           ; $1785C4 |
  REP #$30                                  ; $1785C7 |
  LDX #$0A06                                ; $1785C9 |
  LDA #$0000                                ; $1785CC |
  STA $01                                   ; $1785CF |
  LDY #$3020                                ; $1785D1 |
  LDA #$0300                                ; $1785D4 |
  JSL $00BEA6                               ; $1785D7 |
  LDX #$2800                                ; $1785DB |
  LDA #$0070                                ; $1785DE |
  STA $01                                   ; $1785E1 |
  LDY #$2000                                ; $1785E3 |
  LDA #$1000                                ; $1785E6 |
  JSL $00BEA6                               ; $1785E9 |
  SEP #$30                                  ; $1785ED |
  JSL process_vram_dma_queue_l              ; $1785EF |

CODE_1785F3:
  LDA $011A                                 ; $1785F3 |
  BPL CODE_1785FC                           ; $1785F6 |
  LDA #$F0                                  ; $1785F8 |
  BRA CODE_17860D                           ; $1785FA |

CODE_1785FC:
  LDA $012B                                 ; $1785FC |
  BPL CODE_17860F                           ; $1785FF |
  LDA #$01                                  ; $178601 |
  STA $012B                                 ; $178603 |
  LDX !r_last_world_unlocked                ; $178606 |
  BEQ CODE_17860D                           ; $178609 |
  INC A                                     ; $17860B |
  INC A                                     ; $17860C |

CODE_17860D:
  STA $4D                                   ; $17860D |

CODE_17860F:
  LDA $098E                                 ; $17860F |
  BNE CODE_17861F                           ; $178612 |
  LDA #$1F                                  ; $178614 |
  STA $0990                                 ; $178616 |
  STA $0992                                 ; $178619 |
  STA $0994                                 ; $17861C |

CODE_17861F:
  STZ $098E                                 ; $17861F |
  JSL $008245                               ; $178622 |
  JSL $1787D2                               ; $178626 |
  LDA $0982                                 ; $17862A |
  STA $0980                                 ; $17862D |

CODE_178630:
  LDA $0980                                 ; $178630 |
  BNE CODE_178630                           ; $178633 |
  LDA $0984                                 ; $178635 |
  EOR #$01                                  ; $178638 |
  STA $0984                                 ; $17863A |
  LDA #$0F                                  ; $17863D |
  STA !r_reg_inidisp_mirror                 ; $17863F |
  JSR CODE_178649                           ; $178642 |
  JML $1083E2                               ; $178645 |

CODE_178649:
  LDA $0201                                 ; $178649 |
  ASL A                                     ; $17864C |
  ASL A                                     ; $17864D |
  TAX                                       ; $17864E |
  LDY #$04                                  ; $17864F |

CODE_178651:
  LDA $00C214,x                             ; $178651 |
  STA $0996,y                               ; $178655 |
  INX                                       ; $178658 |
  DEY                                       ; $178659 |
  DEY                                       ; $17865A |
  BPL CODE_178651                           ; $17865B |
  INC $098E                                 ; $17865D |
  RTS                                       ; $178660 |

CODE_178661:
  STZ $6CA2                                 ; $178661 |
  LDA $011A                                 ; $178664 |
  BEQ CODE_178673                           ; $178667 |

CODE_178669:
  LDA #$03                                  ; $178669 |
  STA $0988                                 ; $17866B |
  LDA #$06                                  ; $17866E |
  STA $098A                                 ; $178670 |

CODE_178673:
  RTS                                       ; $178673 |

  dw $2850, $2E00, $2870, $2E04             ; $178674 |
  dw $2890, $2E08, $4830, $2E40             ; $17867C |
  dw $4850, $2E44, $4870, $2E48             ; $178684 |
  dw $4890, $2E4C, $48B0, $2E0C             ; $17868C |
  dw $6820, $2E80, $6840, $2E84             ; $178694 |
  dw $6860, $2E88, $6880, $2E8C             ; $17869C |
  dw $68A0, $2F40, $68C0, $2F44             ; $1786A4 |
  dw $8820, $2EC0, $8840, $2EC4             ; $1786AC |
  dw $8860, $2EC8, $8880, $2ECC             ; $1786B4 |
  dw $A820, $2F00, $A840, $2F04             ; $1786BC |
  dw $A860, $2F08, $A880, $2F0C             ; $1786C4 |
  dw $98A0, $2F48, $98C0, $2F4C             ; $1786CC |
  dw $88A0, $2F80, $88B0, $2F82             ; $1786D4 |
  dw $88C0, $2F84, $88D0, $2F86             ; $1786DC |
  dw $B8A0, $2F88, $B8B0, $2F8A             ; $1786E4 |
  dw $B8C0, $2F8C, $B8D0, $2F8E             ; $1786EC |
  dw $7810, $2FA0, $8810, $2FA2             ; $1786F4 |
  dw $9810, $2FA4, $A810, $2FA6             ; $1786FC |
  dw $78E0, $2FA8, $88E0, $2FAA             ; $178704 |
  dw $98E0, $2FAC, $A8E0, $2FAE             ; $17870C |

  dw $AAAA, $AAAA, $AAAA, $0000             ; $178714 |
  dw $0000, $872E, $8750, $8766             ; $17871C |
  dw $877F                                  ; $178724 |

  dw $56DE, $64DE, $72DE, $80DE             ; $178726 |
  dw $3C00, $800C, $045A, $3C20             ; $17872E |
  dw $A00C, $045A, $3C40, $C00C             ; $178736 |
  dw $045A, $3C60, $E00C, $045A             ; $17873E |
  dw $3280, $A010, $1032, $32C0             ; $178746 |
  dw $FF10, $32E0, $0010, $102E             ; $17874E |
  dw $2E20, $4010, $102E, $2E60             ; $178756 |
  dw $8010, $102E, $2EA0, $FF10             ; $17875E |
  dw $2EC0, $E010, $102E, $2F00             ; $178766 |
  dw $2010, $102F, $2F40, $6010             ; $17876E |
  dw $102F, $5600, $C008, $0856             ; $178776 |
  dw $20FF, $0856, $56E0, $4008             ; $17877E |
  dw $0856, $5700, $6008, $0856             ; $178786 |
  dw $5720, $8008, $0856, $5740             ; $17878E |
  dw $A008, $0856, $5760, $4008             ; $178796 |
  dw $0229, $2980, $C002, $0229             ; $17879E |
  dw $2A00, $4002, $026A, $6A80             ; $1787A6 |
  dw $C002, $026A, $6B00, $6002             ; $1787AE |
  dw $0229, $29A0, $E002, $0229             ; $1787B6 |
  dw $2A20, $6002, $026A, $6AA0             ; $1787BE |
  dw $E002, $026A, $6B20, $FF02             ; $1787C6 |

  dw $0000, $7FFF                           ; $1787CE |

  PHB                                       ; $1787D2 |
  PHK                                       ; $1787D3 |
  PLB                                       ; $1787D4 |

gamemode19:
  JSL init_oam                              ; $1787D5 |
  REP #$30                                  ; $1787D9 |
  LDX #$009E                                ; $1787DB |

CODE_1787DE:
  LDA $8674,x                               ; $1787DE |
  STA $006A80,x                             ; $1787E1 |
  DEX                                       ; $1787E5 |
  DEX                                       ; $1787E6 |
  BPL CODE_1787DE                           ; $1787E7 |
  LDX #$0008                                ; $1787E9 |

CODE_1787EC:
  LDA $8714,x                               ; $1787EC |
  STA $006C08,x                             ; $1787EF |
  DEX                                       ; $1787F3 |
  DEX                                       ; $1787F4 |
  BPL CODE_1787EC                           ; $1787F5 |
  SEP #$30                                  ; $1787F7 |
  LDA $011A                                 ; $1787F9 |
  BMI CODE_178809                           ; $1787FC |
  LDA $0214                                 ; $1787FE |
  BEQ CODE_178809                           ; $178801 |
  JSR CODE_1794E1                           ; $178803 |
  JMP CODE_1788BE                           ; $178806 |

CODE_178809:
  REP #$20                                  ; $178809 |
  LDX #$08                                  ; $17880B |
  LDA #$C745                                ; $17880D |
  JSL r_gsu_init_1                          ; $178810 | GSU init
  SEP #$20                                  ; $178814 |
  JSR CODE_178919                           ; $178816 |
  LDA !r_frame_counter_global_dp            ; $178819 |
  AND #$07                                  ; $17881B |
  ASL A                                     ; $17881D |
  TAX                                       ; $17881E |
  REP #$20                                  ; $17881F |
  LDA $5FC77E,x                             ; $178821 |
  STA $7021EE                               ; $178825 |
  LDX #$08                                  ; $178829 |
  LDA #$C701                                ; $17882B |
  JSL r_gsu_init_1                          ; $17882E | GSU init
  LDX #$08                                  ; $178832 |
  LDA #$C7CA                                ; $178834 |
  JSL r_gsu_init_1                          ; $178837 | GSU init
  SEP #$20                                  ; $17883B |

CODE_17883D:
  LDA $0980                                 ; $17883D |
  BNE CODE_17883D                           ; $178840 |

CODE_178842:
  LDA !reg_hvbjoy                           ; $178842 |
  BPL CODE_178842                           ; $178845 |

CODE_178847:
  LDA !reg_hvbjoy                           ; $178847 |
  BMI CODE_178847                           ; $17884A |
  REP #$20                                  ; $17884C |
  LDA $0A04                                 ; $17884E |
  CLC                                       ; $178851 |
  ADC #$0020                                ; $178852 |
  AND #$07FE                                ; $178855 |
  STA $0A04                                 ; $178858 |
  STA $04                                   ; $17885B |
  STZ $06                                   ; $17885D |
  LDA #$6E00                                ; $17885F |
  STA $23                                   ; $178862 |
  LDA #$0070                                ; $178864 |
  STA $25                                   ; $178867 |
  LDX #$06                                  ; $178869 |

CODE_17886B:
  STX $00                                   ; $17886B |
  LDA $17871E,x                             ; $17886D |
  STA !gsu_r14                              ; $178871 |
  LDA #$0017                                ; $178874 |
  STA !gsu_r0                               ; $178877 |
  LDX #$08                                  ; $17887A |
  LDA #$C712                                ; $17887C |
  JSL r_gsu_init_5                          ; $17887F | GSU init
  LDX $00                                   ; $178883 |
  LDA #$7F56                                ; $178885 |
  STA $21                                   ; $178888 |
  LDA $8726,x                               ; $17888A |
  STA $20                                   ; $17888D |
  SEP #$20                                  ; $17888F |

CODE_178891:
  BIT !reg_hvbjoy                           ; $178891 |
  BVC CODE_178891                           ; $178894 |

CODE_178896:
  BIT !reg_hvbjoy                           ; $178896 |
  BVS CODE_178896                           ; $178899 |
  LDY #$04                                  ; $17889B |

CODE_17889D:
  DEY                                       ; $17889D |
  BNE CODE_17889D                           ; $17889E |
  REP #$20                                  ; $1788A0 |
  LDA #$0E00                                ; $1788A2 |
  JSL dma_wram_gen_purpose                  ; $1788A5 |
  DEX                                       ; $1788A9 |
  DEX                                       ; $1788AA |
  BPL CODE_17886B                           ; $1788AB |
  LDA $0984                                 ; $1788AD |
  EOR #$0001                                ; $1788B0 |
  STA $0984                                 ; $1788B3 |
  LDA #$0003                                ; $1788B6 |
  STA $0982                                 ; $1788B9 |
  SEP #$20                                  ; $1788BC |

CODE_1788BE:
  LDA $098E                                 ; $1788BE |
  BNE CODE_1788CD                           ; $1788C1 |
  LDA $0988                                 ; $1788C3 |
  BEQ CODE_178909                           ; $1788C6 |
  JSR CODE_178FB6                           ; $1788C8 |
  BRA CODE_178909                           ; $1788CB |

CODE_1788CD:
  LDA $0201                                 ; $1788CD |
  ASL A                                     ; $1788D0 |
  TAX                                       ; $1788D1 |
  REP #$20                                  ; $1788D2 |
  LDA $0994                                 ; $1788D4 |
  ASL A                                     ; $1788D7 |
  ASL A                                     ; $1788D8 |
  ASL A                                     ; $1788D9 |
  ASL A                                     ; $1788DA |
  ASL A                                     ; $1788DB |
  ORA $0992                                 ; $1788DC |
  ASL A                                     ; $1788DF |
  ASL A                                     ; $1788E0 |
  ASL A                                     ; $1788E1 |
  ASL A                                     ; $1788E2 |
  ASL A                                     ; $1788E3 |
  ORA $0990                                 ; $1788E4 |
  CMP $87CE,x                               ; $1788E7 |
  SEP #$20                                  ; $1788EA |
  BNE CODE_178909                           ; $1788EC |
  STZ $098E                                 ; $1788EE |
  LDA $0201                                 ; $1788F1 |
  TAX                                       ; $1788F4 |
  LDA $890B,x                               ; $1788F5 |
  STA !r_reg_inidisp_mirror                 ; $1788F8 |
  TXA                                       ; $1788FB |
  EOR #$01                                  ; $1788FC |
  STA $0201                                 ; $1788FE |
  BNE CODE_178909                           ; $178901 |
  LDA $099C                                 ; $178903 |
  STA !r_game_mode                          ; $178906 |

CODE_178909:
  PLB                                       ; $178909 |
  RTL                                       ; $17890A |

  dw $000F                                  ; $17890B |
  dw $8933                                  ; $17890D |
  dw $896A                                  ; $17890F |
  dw $89A8                                  ; $178911 |
  dw $8A9E                                  ; $178913 |
  dw $8FA3                                  ; $178915 |
  dw $8D93                                  ; $178917 |

CODE_178919:
  LDY #$3C                                  ; $178919 |

CODE_17891B:
  LDX $09C1,y                               ; $17891B |
  BEQ CODE_17892C                           ; $17891E |
  LDA $09C4,y                               ; $178920 |
  BEQ CODE_178929                           ; $178923 |
  DEC A                                     ; $178925 |
  STA $09C4,y                               ; $178926 |

CODE_178929:
  JSR ($890B,x)                             ; $178929 |

CODE_17892C:
  DEY                                       ; $17892C |
  DEY                                       ; $17892D |
  DEY                                       ; $17892E |
  DEY                                       ; $17892F |
  BPL CODE_17891B                           ; $178930 |
  RTS                                       ; $178932 |

  STZ $00                                   ; $178933 |
  STZ $01                                   ; $178935 |
  LDA $09C2,y                               ; $178937 |
  INC A                                     ; $17893A |
  STA $09C2,y                               ; $17893B |
  LDX #$40                                  ; $17893E |
  JMP CODE_1789D2                           ; $178940 |

  db $00, $00, $00, $FF, $00, $01, $01, $00 ; $178943 |
  db $FF, $FF, $00, $01, $00                ; $17894B |

  db $00, $00, $00, $FF, $00, $01, $01, $00 ; $178950 |
  db $FF, $FF, $00, $01, $00                ; $178958 |

  db $1C, $1D, $1E, $1E, $1E, $1E, $1E, $1E ; $17895D |
  db $1E, $1F, $20, $21, $22                ; $178965 |

  LDA $702F,y                               ; $17896A |
  INC A                                     ; $17896D |
  INC A                                     ; $17896E |
  STA $702F,y                               ; $17896F |
  LDX $09C2,y                               ; $178972 |
  INX                                       ; $178975 |
  CPX #$0D                                  ; $178976 |
  BCC CODE_178981                           ; $178978 |
  LDX #$00                                  ; $17897A |
  LDA #$1A                                  ; $17897C |
  STA $702F,y                               ; $17897E |

CODE_178981:
  TXA                                       ; $178981 |
  STA $09C2,y                               ; $178982 |
  LDA $702D,y                               ; $178985 |
  CLC                                       ; $178988 |
  ADC $8943,x                               ; $178989 |
  STA $702D,y                               ; $17898C |
  LDA $702E,y                               ; $17898F |
  CLC                                       ; $178992 |
  ADC $8950,x                               ; $178993 |
  STA $702E,y                               ; $178996 |
  LDA $895D,x                               ; $178999 |
  STA $702C,y                               ; $17899C |
  RTS                                       ; $17899F |

  db $23, $24, $25, $26, $27, $28, $29, $2A ; $1789A0 |

  LDX $09C3,y                               ; $1789A8 |
  INX                                       ; $1789AB |
  CPX #$08                                  ; $1789AC |
  BCC CODE_1789B2                           ; $1789AE |
  LDX #$00                                  ; $1789B0 |

CODE_1789B2:
  TXA                                       ; $1789B2 |
  STA $09C3,y                               ; $1789B3 |
  LDA $89A0,x                               ; $1789B6 |
  STA $702C,y                               ; $1789B9 |
  LDA #$B6                                  ; $1789BC |
  STA $00                                   ; $1789BE |
  LDA #$F0                                  ; $1789C0 |
  STA $01                                   ; $1789C2 |
  LDA $09C2,y                               ; $1789C4 |
  CLC                                       ; $1789C7 |
  ADC #$04                                  ; $1789C8 |
  STA $09C2,y                               ; $1789CA |
  LDX #$10                                  ; $1789CD |
  JMP CODE_1789D2                           ; $1789CF |

CODE_1789D2:
  STX $02                                   ; $1789D2 |
  REP #$30                                  ; $1789D4 |
  AND #$00FF                                ; $1789D6 |
  ASL A                                     ; $1789D9 |
  TAX                                       ; $1789DA |
  LDA $00E954,x                             ; $1789DB |
  STA $03                                   ; $1789DF |
  BPL CODE_1789E7                           ; $1789E1 |
  EOR #$FFFF                                ; $1789E3 |
  INC A                                     ; $1789E6 |

CODE_1789E7:
  CMP #$0100                                ; $1789E7 |
  SEP #$20                                  ; $1789EA |
  BCS CODE_178A05                           ; $1789EC |
  STA !reg_wrmpya                           ; $1789EE |
  LDA $02                                   ; $1789F1 |
  STA !reg_wrmpyb                           ; $1789F3 |
  NOP                                       ; $1789F6 |
  NOP                                       ; $1789F7 |
  NOP                                       ; $1789F8 |
  NOP                                       ; $1789F9 |
  LDA !reg_rdmpyl                           ; $1789FA |
  ASL A                                     ; $1789FD |
  LDA !reg_rdmpyh                           ; $1789FE |
  ADC #$00                                  ; $178A01 |
  BRA CODE_178A07                           ; $178A03 |

CODE_178A05:
  LDA $02                                   ; $178A05 |

CODE_178A07:
  BIT $04                                   ; $178A07 |
  BPL CODE_178A0E                           ; $178A09 |
  EOR #$FF                                  ; $178A0B |
  INC A                                     ; $178A0D |

CODE_178A0E:
  CLC                                       ; $178A0E |
  ADC $00                                   ; $178A0F |
  STA $702D,y                               ; $178A11 |
  REP #$20                                  ; $178A14 |
  LDA $00E9D4,x                             ; $178A16 |
  STA $03                                   ; $178A1A |
  BPL CODE_178A22                           ; $178A1C |
  EOR #$FFFF                                ; $178A1E |
  INC A                                     ; $178A21 |

CODE_178A22:
  CMP #$0100                                ; $178A22 |
  SEP #$20                                  ; $178A25 |
  BCS CODE_178A40                           ; $178A27 |
  STA !reg_wrmpya                           ; $178A29 |
  LDA $02                                   ; $178A2C |
  STA !reg_wrmpyb                           ; $178A2E |
  NOP                                       ; $178A31 |
  NOP                                       ; $178A32 |
  NOP                                       ; $178A33 |
  NOP                                       ; $178A34 |
  LDA !reg_rdmpyl                           ; $178A35 |
  ASL A                                     ; $178A38 |
  LDA !reg_rdmpyh                           ; $178A39 |
  ADC #$00                                  ; $178A3C |
  BRA CODE_178A42                           ; $178A3E |

CODE_178A40:
  LDA $02                                   ; $178A40 |

CODE_178A42:
  BIT $04                                   ; $178A42 |
  BPL CODE_178A49                           ; $178A44 |
  EOR #$FF                                  ; $178A46 |
  INC A                                     ; $178A48 |

CODE_178A49:
  CLC                                       ; $178A49 |
  ADC $01                                   ; $178A4A |
  STA $702E,y                               ; $178A4C |
  SEP #$10                                  ; $178A4F |
  RTS                                       ; $178A51 |

  db $FF, $01, $FC, $04                     ; $178A52 |

  dw $302B, $3A35, $443F, $4E49             ; $178A56 |
  dw $312C, $3B36, $4540, $4F4A             ; $178A5E |
  dw $322D, $3C37, $4641, $504B             ; $178A66 |
  dw $332E, $3D38, $4742, $514C             ; $178A6E |
  dw $342F, $3E39, $4843, $524D             ; $178A76 |
  dw $312C, $3B53, $4540, $4F57             ; $178A7E |
  dw $322D, $3C54, $4641, $5058             ; $178A86 |
  dw $332E, $3D55, $4742, $5159             ; $178A8E |
  dw $342F, $3E56, $4843, $525A             ; $178A96 |

  REP #$20                                  ; $178A9E |
  STZ $099E                                 ; $178AA0 |
  SEP #$20                                  ; $178AA3 |
  LDX $6CA2                                 ; $178AA5 |
  JSR ($8B45,x)                             ; $178AA8 |
  LDA $6CA5                                 ; $178AAB |
  STA $702D,y                               ; $178AAE |
  LDA $6CA7                                 ; $178AB1 |
  STA $702E,y                               ; $178AB4 |
  LDA $6CA9                                 ; $178AB7 |
  STA $702F,y                               ; $178ABA |
  PHY                                       ; $178ABD |
  LDA $702D,y                               ; $178ABE |
  STA $00                                   ; $178AC1 |
  LDA $702E,y                               ; $178AC3 |
  STA $01                                   ; $178AC6 |
  JSR CODE_178F32                           ; $178AC8 |
  LDA #$C0                                  ; $178ACB |
  SEC                                       ; $178ACD |
  SBC $02                                   ; $178ACE |
  LDX $011A                                 ; $178AD0 |
  BNE CODE_178AF5                           ; $178AD3 |
  LDX $0988                                 ; $178AD5 |
  BEQ CODE_178AFF                           ; $178AD8 |
  LDX #$03                                  ; $178ADA |
  SEC                                       ; $178ADC |
  SBC $6CA0                                 ; $178ADD |
  BNE CODE_178AE7                           ; $178AE0 |
  INC $011A                                 ; $178AE2 |
  BRA CODE_178B1C                           ; $178AE5 |

CODE_178AE7:
  BPL CODE_178AEA                           ; $178AE7 |
  DEX                                       ; $178AE9 |

CODE_178AEA:
  PHA                                       ; $178AEA |
  CLC                                       ; $178AEB |
  ADC #$04                                  ; $178AEC |
  CMP #$09                                  ; $178AEE |
  PLA                                       ; $178AF0 |
  BCC CODE_178B02                           ; $178AF1 |
  BRA CODE_178AFF                           ; $178AF3 |

CODE_178AF5:
  LDX #$01                                  ; $178AF5 |
  CMP $6CA0                                 ; $178AF7 |
  BEQ CODE_178B1C                           ; $178AFA |
  BPL CODE_178AFF                           ; $178AFC |
  DEX                                       ; $178AFE |

CODE_178AFF:
  LDA $8A52,x                               ; $178AFF |

CODE_178B02:
  PHA                                       ; $178B02 |
  CLC                                       ; $178B03 |
  ADC $6CA0                                 ; $178B04 |
  STA $6CA0                                 ; $178B07 |
  PLA                                       ; $178B0A |
  XBA                                       ; $178B0B |
  REP #$20                                  ; $178B0C |
  AND #$FF00                                ; $178B0E |
  BPL CODE_178B16                           ; $178B11 |
  ORA #$00FF                                ; $178B13 |

CODE_178B16:
  XBA                                       ; $178B16 |
  STA $099E                                 ; $178B17 |
  SEP #$20                                  ; $178B1A |

CODE_178B1C:
  PLY                                       ; $178B1C |
  LDA $6CA2                                 ; $178B1D |
  CMP #$18                                  ; $178B20 |
  BCS CODE_178B44                           ; $178B22 |
  LDA $021F                                 ; $178B24 |
  ASL A                                     ; $178B27 |
  ASL A                                     ; $178B28 |
  ASL A                                     ; $178B29 |
  STA $00                                   ; $178B2A |
  LDA $021E                                 ; $178B2C |
  CLC                                       ; $178B2F |
  ADC $6CA0                                 ; $178B30 |
  CLC                                       ; $178B33 |
  ADC #$10                                  ; $178B34 |
  LSR A                                     ; $178B36 |
  LSR A                                     ; $178B37 |
  LSR A                                     ; $178B38 |
  LSR A                                     ; $178B39 |
  LSR A                                     ; $178B3A |
  ORA $00                                   ; $178B3B |
  TAX                                       ; $178B3D |
  LDA $8A56,x                               ; $178B3E |
  STA $702C,y                               ; $178B41 |

CODE_178B44:
  RTS                                       ; $178B44 |

  dw $8B7E                                  ; $178B45 |
  dw $8B67                                  ; $178B47 |
  dw $8DFE                                  ; $178B49 |
  dw $8BB4                                  ; $178B4B |
  dw $8BBF                                  ; $178B4D |
  dw $8B6E                                  ; $178B4F |
  dw $8BF0                                  ; $178B51 |
  dw $8BFB                                  ; $178B53 |
  dw $8B6E                                  ; $178B55 |
  dw $8C3E                                  ; $178B57 |
  dw $8C49                                  ; $178B59 |
  dw $8C71                                  ; $178B5B |
  dw $8CCD                                  ; $178B5D |
  dw $8CE8                                  ; $178B5F |
  dw $8D26                                  ; $178B61 |
  dw $8D5B                                  ; $178B63 |
  dw $8D6A                                  ; $178B65 |

  INC $6CA2                                 ; $178B67 |
  INC $6CA2                                 ; $178B6A |
  RTS                                       ; $178B6D |

  REP #$20                                  ; $178B6E |
  DEC $0977                                 ; $178B70 |
  BNE CODE_178B7B                           ; $178B73 |
  INC $6CA2                                 ; $178B75 |
  INC $6CA2                                 ; $178B78 |

CODE_178B7B:
  SEP #$20                                  ; $178B7B |
  RTS                                       ; $178B7D |

  STZ $021F                                 ; $178B7E |
  LDA $098E                                 ; $178B81 |
  ORA $0988                                 ; $178B84 |
  BNE CODE_178BB3                           ; $178B87 |
  LDA $011A                                 ; $178B89 |
  BNE CODE_178BB3                           ; $178B8C |
  REP #$20                                  ; $178B8E |
  DEC $1405                                 ; $178B90 |
  SEP #$20                                  ; $178B93 |
  LDA $1405                                 ; $178B95 |
  ORA $1406                                 ; $178B98 |
  BNE CODE_178BA6                           ; $178B9B |
  LDA #$04                                  ; $178B9D |
  STA $099C                                 ; $178B9F |
  INC $098E                                 ; $178BA2 |
  RTS                                       ; $178BA5 |

CODE_178BA6:
  LDA $35                                   ; $178BA6 |
  AND #$C0                                  ; $178BA8 |
  ORA $36                                   ; $178BAA |
  AND #$D0                                  ; $178BAC |
  BEQ CODE_178BB3                           ; $178BAE |
  INC $0988                                 ; $178BB0 |

CODE_178BB3:
  RTS                                       ; $178BB3 |

  LDA #$87                                  ; $178BB4 |
  JSR CODE_178F9C                           ; $178BB6 |
  INC $6CA2                                 ; $178BB9 |
  INC $6CA2                                 ; $178BBC |
  REP #$30                                  ; $178BBF |
  LDX $096D                                 ; $178BC1 |
  LDA $7286,x                               ; $178BC4 |
  CLC                                       ; $178BC7 |
  ADC #$0010                                ; $178BC8 |
  STA $7286,x                               ; $178BCB |
  CMP #$01F0                                ; $178BCE |
  BCC CODE_178BED                           ; $178BD1 |
  INC $6CA2                                 ; $178BD3 |
  INC $6CA2                                 ; $178BD6 |
  STZ $0970                                 ; $178BD9 |
  LDA #$0010                                ; $178BDC |
  STA $0977                                 ; $178BDF |
  CPX #$0168                                ; $178BE2 |
  BNE CODE_178BED                           ; $178BE5 |
  LDA #$008A                                ; $178BE7 |
  STA $7044                                 ; $178BEA |

CODE_178BED:
  SEP #$30                                  ; $178BED |
  RTS                                       ; $178BEF |

  LDA #$99                                  ; $178BF0 |
  JSR CODE_178F9C                           ; $178BF2 |
  INC $6CA2                                 ; $178BF5 |
  INC $6CA2                                 ; $178BF8 |
  LDA !r_frame_counter_global_dp            ; $178BFB |
  AND #$01                                  ; $178BFD |
  BNE CODE_178C3D                           ; $178BFF |
  REP #$10                                  ; $178C01 |
  LDX $096D                                 ; $178C03 |
  LDA $0970                                 ; $178C06 |
  PHA                                       ; $178C09 |
  CLC                                       ; $178C0A |
  ADC #$74                                  ; $178C0B |
  STA $702C,x                               ; $178C0D |
  PLA                                       ; $178C10 |
  LSR A                                     ; $178C11 |
  CLC                                       ; $178C12 |
  ADC $702F,x                               ; $178C13 |
  STA $702F,x                               ; $178C16 |
  LDA #$00                                  ; $178C19 |
  STA $7286,x                               ; $178C1B |
  INC $0970                                 ; $178C1E |
  LDA $0970                                 ; $178C21 |
  CMP #$0B                                  ; $178C24 |
  BCC CODE_178C3B                           ; $178C26 |
  LDA #$00                                  ; $178C28 |
  STA $702C,x                               ; $178C2A |
  LDA #$10                                  ; $178C2D |
  STA $0977                                 ; $178C2F |
  INC $6CA2                                 ; $178C32 |
  INC $6CA2                                 ; $178C35 |
  STZ $0970                                 ; $178C38 |

CODE_178C3B:
  SEP #$10                                  ; $178C3B |

CODE_178C3D:
  RTS                                       ; $178C3D |

  LDA #$97                                  ; $178C3E |
  JSR CODE_178F9C                           ; $178C40 |
  INC $6CA2                                 ; $178C43 |
  INC $6CA2                                 ; $178C46 |
  REP #$30                                  ; $178C49 |
  LDA !r_cur_world                          ; $178C4B |
  ASL A                                     ; $178C4E |
  TAX                                       ; $178C4F |
  SEP #$20                                  ; $178C50 |
  LDA $0970                                 ; $178C52 |
  CLC                                       ; $178C55 |
  ADC #$7E                                  ; $178C56 |
  STA $702C,x                               ; $178C58 |
  SEP #$10                                  ; $178C5B |
  INC $0970                                 ; $178C5D |
  LDA $0970                                 ; $178C60 |
  CMP #$0A                                  ; $178C63 |
  BCC CODE_178C70                           ; $178C65 |
  INC $6CA2                                 ; $178C67 |
  INC $6CA2                                 ; $178C6A |
  STZ $0970                                 ; $178C6D |

CODE_178C70:
  RTS                                       ; $178C70 |

  REP #$30                                  ; $178C71 |\
  LDA !r_cur_world                          ; $178C73 | | x = current world * 2
  ASL A                                     ; $178C76 | | (since world is already * 2, now * 4)
  TAX                                       ; $178C77 |/
  SEP #$20                                  ; $178C78 |
  LDA $0970                                 ; $178C7A |
  AND #$03                                  ; $178C7D |
  CLC                                       ; $178C7F |
  ADC #$86                                  ; $178C80 |
  STA $702C,x                               ; $178C82 |
  SEP #$10                                  ; $178C85 |
  INC $0970                                 ; $178C87 |
  LDA $0970                                 ; $178C8A |
  CMP #$30                                  ; $178C8D |
  BCC CODE_178CCC                           ; $178C8F |
  STZ $0970                                 ; $178C91 |
  CPX #$14                                  ; $178C94 |\ if world != world 6
  BNE CODE_178CAE                           ; $178C96 |/
  INC $6CA2                                 ; $178C98 |
  INC $6CA2                                 ; $178C9B |
  LDA #$8B                                  ; $178C9E |
  STA $702C                                 ; $178CA0 |
  LDA $6CA9                                 ; $178CA3 |
  SEC                                       ; $178CA6 |
  SBC #$0C                                  ; $178CA7 |
  STA $6CA9                                 ; $178CA9 |
  BRA CODE_178CCC                           ; $178CAC |

CODE_178CAE:
  LDA #$0A                                  ; $178CAE |
  STA $09C1,x                               ; $178CB0 |
  STZ $6CA2                                 ; $178CB3 |
  CPX #$18                                  ; $178CB6 |
  BCC CODE_178CC4                           ; $178CB8 |
  LDA #$0C                                  ; $178CBA |
  STA $09FD                                 ; $178CBC |
  STZ $09C1                                 ; $178CBF |
  BRA CODE_178CCC                           ; $178CC2 |

CODE_178CC4:
  LDA #$20                                  ; $178CC4 |
  STA $099C                                 ; $178CC6 |
  INC $098E                                 ; $178CC9 |

CODE_178CCC:
  RTS                                       ; $178CCC |

  REP #$20                                  ; $178CCD |
  LDA $6CA8                                 ; $178CCF |
  CLC                                       ; $178CD2 |
  ADC #$0080                                ; $178CD3 |
  STA $6CA8                                 ; $178CD6 |
  SEP #$20                                  ; $178CD9 |
  LDA $0970                                 ; $178CDB |
  CMP #$20                                  ; $178CDE |
  BCC CODE_178CE8                           ; $178CE0 |
  INC $6CA2                                 ; $178CE2 |
  INC $6CA2                                 ; $178CE5 |

CODE_178CE8:
  LDA $0970                                 ; $178CE8 |
  AND #$03                                  ; $178CEB |
  CLC                                       ; $178CED |
  ADC #$8C                                  ; $178CEE |
  STA $702C                                 ; $178CF0 |
  INC $0970                                 ; $178CF3 |
  LDA $0970                                 ; $178CF6 |
  CMP #$40                                  ; $178CF9 |
  BCC CODE_178D0A                           ; $178CFB |
  LDA #$80                                  ; $178CFD |
  STA $011A                                 ; $178CFF |
  LDA #$09                                  ; $178D02 |
  STA $099C                                 ; $178D04 |
  INC $098E                                 ; $178D07 |

CODE_178D0A:
  REP #$30                                  ; $178D0A |
  LDA !r_cur_world                          ; $178D0C |
  ASL A                                     ; $178D0F |
  TAX                                       ; $178D10 |
  SEP #$20                                  ; $178D11 |
  LDA $0970                                 ; $178D13 |
  AND #$03                                  ; $178D16 |
  CLC                                       ; $178D18 |
  ADC #$86                                  ; $178D19 |
  STA $702C,x                               ; $178D1B |
  SEP #$10                                  ; $178D1E |
  LDA #$C0                                  ; $178D20 |
  STA $1139                                 ; $178D22 |
  RTS                                       ; $178D25 |

  LDA #$C0                                  ; $178D26 |
  STA $1139                                 ; $178D28 |
  LDA $0970                                 ; $178D2B |
  AND #$03                                  ; $178D2E |
  CLC                                       ; $178D30 |
  ADC #$8C                                  ; $178D31 |
  STA $702C                                 ; $178D33 |
  INC $0970                                 ; $178D36 |
  REP #$20                                  ; $178D39 |
  LDA $6CA8                                 ; $178D3B |
  SEC                                       ; $178D3E |
  SBC #$0100                                ; $178D3F |
  STA $6CA8                                 ; $178D42 |
  XBA                                       ; $178D45 |
  SEP #$20                                  ; $178D46 |
  CMP #$10                                  ; $178D48 |
  BCS CODE_178D5A                           ; $178D4A |
  STZ $1139                                 ; $178D4C |
  INC $6CA2                                 ; $178D4F |
  INC $6CA2                                 ; $178D52 |
  LDA #$8B                                  ; $178D55 |
  STA $702C                                 ; $178D57 |

CODE_178D5A:
  RTS                                       ; $178D5A |

  LDA $6CA9                                 ; $178D5B |
  CLC                                       ; $178D5E |
  ADC #$0C                                  ; $178D5F |
  STA $6CA9                                 ; $178D61 |
  INC $6CA2                                 ; $178D64 |
  INC $6CA2                                 ; $178D67 |
  LDA #$3F                                  ; $178D6A |
  STA $702C                                 ; $178D6C |
  REP #$20                                  ; $178D6F |
  LDA $6CA8                                 ; $178D71 |
  SEC                                       ; $178D74 |
  SBC #$0080                                ; $178D75 |
  STA $6CA8                                 ; $178D78 |
  BPL CODE_178D8C                           ; $178D7B |
  STZ $6CA8                                 ; $178D7D |
  STZ $6CA2                                 ; $178D80 |
  LDA #$001F                                ; $178D83 |
  STA $099C                                 ; $178D86 |
  INC $098E                                 ; $178D89 |

CODE_178D8C:
  SEP #$20                                  ; $178D8C |
  RTS                                       ; $178D8E |

  dw $8DCA                                  ; $178D8F |
  dw $8DE5                                  ; $178D91 |

  LDX $6CA2                                 ; $178D93 |
  JSR ($8D8F,x)                             ; $178D96 |
  LDX $09C2,y                               ; $178D99 |
  INX                                       ; $178D9C |
  CPX #$08                                  ; $178D9D |
  BCC CODE_178DA3                           ; $178D9F |
  LDX #$00                                  ; $178DA1 |

CODE_178DA3:
  TXA                                       ; $178DA3 |
  STA $09C2,y                               ; $178DA4 |
  BNE CODE_178DAE                           ; $178DA7 |
  LDA #$9F                                  ; $178DA9 |
  JSR CODE_178F9C                           ; $178DAB |

CODE_178DAE:
  LDA $89A0,x                               ; $178DAE |
  STA $702C,y                               ; $178DB1 |
  LDA #$09                                  ; $178DB4 |
  STA $00                                   ; $178DB6 |
  LDA #$16                                  ; $178DB8 |
  STA $01                                   ; $178DBA |
  LDA $09C3,y                               ; $178DBC |
  CLC                                       ; $178DBF |
  ADC #$04                                  ; $178DC0 |
  STA $09C3,y                               ; $178DC2 |
  LDX $10                                   ; $178DC5 |
  JMP CODE_1789D2                           ; $178DC7 |
  LDA $702F,y                               ; $178DCA |
  INC A                                     ; $178DCD |
  STA $702F,y                               ; $178DCE |
  CMP #$40                                  ; $178DD1 |
  BCC CODE_178DDB                           ; $178DD3 |
  INC $6CA2                                 ; $178DD5 |
  INC $6CA2                                 ; $178DD8 |

CODE_178DDB:
  LSR A                                     ; $178DDB |
  CMP #$10                                  ; $178DDC |
  BCC CODE_178DE2                           ; $178DDE |
  LDA #$10                                  ; $178DE0 |

CODE_178DE2:
  STA $10                                   ; $178DE2 |
  RTS                                       ; $178DE4 |

  LDA #$10                                  ; $178DE5 |
  STA $10                                   ; $178DE7 |
  INC $0970                                 ; $178DE9 |
  LDA $0970                                 ; $178DEC |
  CMP #$30                                  ; $178DEF |
  BCC CODE_178DFD                           ; $178DF1 |
  LDA !r_game_mode                          ; $178DF3 |
  INC A                                     ; $178DF6 |
  STA $099C                                 ; $178DF7 |
  INC $098E                                 ; $178DFA |

CODE_178DFD:
  RTS                                       ; $178DFD |

  LDA $098E                                 ; $178DFE |
  BNE CODE_178E41                           ; $178E01 |
  LDA $09C2,y                               ; $178E03 |
  BNE CODE_178E27                           ; $178E06 |
  REP #$10                                  ; $178E08 |
  LDX $021C                                 ; $178E0A |\
  LDA $13FDA6,x                             ; $178E0D | |
  STA $0972                                 ; $178E11 | |
  LDA $13FDA7,x                             ; $178E14 | | set yoshi's X/Y/Z coordinates for
  STA $0973                                 ; $178E18 | | his path in the cinema sequences
  LDA $13FDA8,x                             ; $178E1B | |
  STA $0974                                 ; $178E1F |/
  SEP #$10                                  ; $178E22 |
  JSR CODE_178E42                           ; $178E24 |

CODE_178E27:
  JSR CODE_178EE0                           ; $178E27 |
  LDA $021F                                 ; $178E2A |
  INC A                                     ; $178E2D |
  PHA                                       ; $178E2E |
  AND #$03                                  ; $178E2F |
  BNE CODE_178E37                           ; $178E31 |
  LDA #$9B                                  ; $178E33 |
  STA $53                                   ; $178E35 |

CODE_178E37:
  PLA                                       ; $178E37 |
  CMP #$09                                  ; $178E38 |
  BCC CODE_178E3E                           ; $178E3A |
  LDA #$01                                  ; $178E3C |

CODE_178E3E:
  STA $021F                                 ; $178E3E |

CODE_178E41:
  RTS                                       ; $178E41 |

CODE_178E42:
  PHY                                       ; $178E42 |
  LDA $0972                                 ; $178E43 |
  SEC                                       ; $178E46 |
  SBC $702D,y                               ; $178E47 |
  STA $03                                   ; $178E4A |
  BPL CODE_178E51                           ; $178E4C |
  EOR #$FF                                  ; $178E4E |
  INC A                                     ; $178E50 |

CODE_178E51:
  STA $04                                   ; $178E51 |
  LDA $0973                                 ; $178E53 |
  SEC                                       ; $178E56 |
  SBC $702E,y                               ; $178E57 |
  STA $05                                   ; $178E5A |
  BPL CODE_178E61                           ; $178E5C |
  EOR #$FF                                  ; $178E5E |
  INC A                                     ; $178E60 |

CODE_178E61:
  STA $06                                   ; $178E61 |
  LDA $0974                                 ; $178E63 |
  SEC                                       ; $178E66 |
  SBC $702F,y                               ; $178E67 |
  STA $07                                   ; $178E6A |
  BPL CODE_178E71                           ; $178E6C |
  EOR #$FF                                  ; $178E6E |
  INC A                                     ; $178E70 |

CODE_178E71:
  STA $08                                   ; $178E71 |
  LDY #$04                                  ; $178E73 |
  CMP $06                                   ; $178E75 |
  BCS CODE_178E7D                           ; $178E77 |
  LDY #$02                                  ; $178E79 |
  LDA $06                                   ; $178E7B |

CODE_178E7D:
  CMP $04                                   ; $178E7D |
  BCS CODE_178E85                           ; $178E7F |
  LDY #$00                                  ; $178E81 |
  LDA $04                                   ; $178E83 |

CODE_178E85:
  STA $0976                                 ; $178E85 |
  STY $09                                   ; $178E88 |
  LDX #$04                                  ; $178E8A |

CODE_178E8C:
  CPX $09                                   ; $178E8C |
  BNE CODE_178E97                           ; $178E8E |
  REP #$20                                  ; $178E90 |
  LDA #$0200                                ; $178E92 |
  BRA CODE_178EB2                           ; $178E95 |

CODE_178E97:
  STZ !reg_wrdivl                           ; $178E97 |
  LDA $04,x                                 ; $178E9A |
  STA !reg_wrdivh                           ; $178E9C |
  LDA $0004,y                               ; $178E9F |
  STA !reg_wrdivb                           ; $178EA2 |
  NOP                                       ; $178EA5 |
  NOP                                       ; $178EA6 |
  NOP                                       ; $178EA7 |
  NOP                                       ; $178EA8 |
  NOP                                       ; $178EA9 |
  NOP                                       ; $178EAA |
  NOP                                       ; $178EAB |
  REP #$20                                  ; $178EAC |
  LDA !reg_rddivl                           ; $178EAE |
  ASL A                                     ; $178EB1 |

CODE_178EB2:
  BIT $02,x                                 ; $178EB2 |
  BPL CODE_178EBA                           ; $178EB4 |
  EOR #$FFFF                                ; $178EB6 |
  INC A                                     ; $178EB9 |

CODE_178EBA:
  STA $097A,x                               ; $178EBA |
  SEP #$20                                  ; $178EBD |
  DEX                                       ; $178EBF |
  DEX                                       ; $178EC0 |
  BPL CODE_178E8C                           ; $178EC1 |
  STZ $6CA4                                 ; $178EC3 |
  STZ $6CA6                                 ; $178EC6 |
  STZ $6CA8                                 ; $178EC9 |
  LDA $03                                   ; $178ECC |
  STA $00                                   ; $178ECE |
  LDA $05                                   ; $178ED0 |
  STA $01                                   ; $178ED2 |
  JSR CODE_178F32                           ; $178ED4 |
  PLY                                       ; $178ED7 |
  STA $021E                                 ; $178ED8 |
  TYX                                       ; $178EDB |
  INC $09C2,x                               ; $178EDC |
  RTS                                       ; $178EDF |

CODE_178EE0:
  REP #$20                                  ; $178EE0 |
  LDX #$04                                  ; $178EE2 |

CODE_178EE4:
  LDA $6CA4,x                               ; $178EE4 |
  CLC                                       ; $178EE7 |
  ADC $097A,x                               ; $178EE8 |
  STA $6CA4,x                               ; $178EEB |
  DEX                                       ; $178EEE |
  DEX                                       ; $178EEF |
  BPL CODE_178EE4                           ; $178EF0 |
  SEP #$20                                  ; $178EF2 |
  DEC $0976                                 ; $178EF4 |
  DEC $0976                                 ; $178EF7 |
  BMI CODE_178EFE                           ; $178EFA |
  BNE CODE_178F31                           ; $178EFC |

CODE_178EFE:
  REP #$10                                  ; $178EFE |
  LDX $021C                                 ; $178F00 |
  LDA $13FDA5,x                             ; $178F03 |\ check if it's time to end the cinema sequence
  BPL CODE_178F12                           ; $178F07 |/
  INC $6CA2                                 ; $178F09 |
  INC $6CA2                                 ; $178F0C |
  JSR CODE_178669                           ; $178F0F |

CODE_178F12:
  INX                                       ; $178F12 |
  INX                                       ; $178F13 |
  INX                                       ; $178F14 |
  INX                                       ; $178F15 |
  STX $021C                                 ; $178F16 |
  SEP #$10                                  ; $178F19 |
  TYX                                       ; $178F1B |
  STZ $09C2,x                               ; $178F1C |
  LDA $0972                                 ; $178F1F |
  STA $6CA5                                 ; $178F22 |
  LDA $0973                                 ; $178F25 |
  STA $6CA7                                 ; $178F28 |
  LDA $0974                                 ; $178F2B |
  STA $6CA9                                 ; $178F2E |

CODE_178F31:
  RTS                                       ; $178F31 |

CODE_178F32:
  LDX #$00                                  ; $178F32 |
  LDA $00                                   ; $178F34 |
  BPL CODE_178F3D                           ; $178F36 |
  LDX #$04                                  ; $178F38 |
  EOR #$FF                                  ; $178F3A |
  INC A                                     ; $178F3C |

CODE_178F3D:
  STA $02                                   ; $178F3D |
  LDA $01                                   ; $178F3F |
  BPL CODE_178F48                           ; $178F41 |
  INX                                       ; $178F43 |
  INX                                       ; $178F44 |
  EOR #$FF                                  ; $178F45 |
  INC A                                     ; $178F47 |

CODE_178F48:
  LDY $02                                   ; $178F48 |
  CMP $02                                   ; $178F4A |
  BEQ CODE_178F54                           ; $178F4C |
  BCC CODE_178F54                           ; $178F4E |
  INX                                       ; $178F50 |
  TAY                                       ; $178F51 |
  LDA $02                                   ; $178F52 |

CODE_178F54:
  STZ !reg_wrdivl                           ; $178F54 |
  STA !reg_wrdivh                           ; $178F57 |
  STY !reg_wrdivb                           ; $178F5A |
  STY $02                                   ; $178F5D |
  STZ $03                                   ; $178F5F |
  TXA                                       ; $178F61 |
  ASL A                                     ; $178F62 |
  TAX                                       ; $178F63 |
  NOP                                       ; $178F64 |
  NOP                                       ; $178F65 |
  NOP                                       ; $178F66 |
  NOP                                       ; $178F67 |
  REP #$30                                  ; $178F68 |
  LDA !reg_rdmpyl                           ; $178F6A |
  ASL A                                     ; $178F6D |
  SEC                                       ; $178F6E |
  SBC $02                                   ; $178F6F |
  LDA !reg_rddivl                           ; $178F71 |
  ADC #$0000                                ; $178F74 |
  ASL A                                     ; $178F77 |
  TAY                                       ; $178F78 |
  CPY #$0202                                ; $178F79 |
  BCC CODE_178F81                           ; $178F7C |
  LDY #$0200                                ; $178F7E |

CODE_178F81:
  LDA $048153,x                             ; $178F81 |
  ASL A                                     ; $178F85 |
  STA $02                                   ; $178F86 |
  TYX                                       ; $178F88 |
  LDA $0BB810,x                             ; $178F89 |
  BCC CODE_178F93                           ; $178F8D |
  EOR #$FFFF                                ; $178F8F |
  INC A                                     ; $178F92 |

CODE_178F93:
  CLC                                       ; $178F93 |
  ADC $02                                   ; $178F94 |
  LSR A                                     ; $178F96 |
  SEP #$30                                  ; $178F97 |
  STA $02                                   ; $178F99 |
  RTS                                       ; $178F9B |

CODE_178F9C:
  PHY                                       ; $178F9C |
  JSL push_sound_queue                      ; $178F9D |
  PLY                                       ; $178FA1 |
  RTS                                       ; $178FA2 |

  LDA $09C2,y                               ; $178FA3 |
  CLC                                       ; $178FA6 |
  ADC #$86                                  ; $178FA7 |
  STA $702C,y                               ; $178FA9 |
  LDA $09C2,y                               ; $178FAC |
  INC A                                     ; $178FAF |
  AND #$03                                  ; $178FB0 |
  STA $09C2,y                               ; $178FB2 |
  RTS                                       ; $178FB5 |

CODE_178FB6:
  ASL A                                     ; $178FB6 |
  TAX                                       ; $178FB7 |
  JMP ($8FB9,x)                             ; $178FB8 |

  dw $8FD3                                  ; $178FBB |
  dw $8FDB                                  ; $178FBD |
  dw $8FDB                                  ; $178FBF |
  dw $906D                                  ; $178FC1 |

  dw $7BBE, $83BE, $7BBF, $83BF             ; $178FC4 |
  dw $7BBE, $83BE, $7BBF, $83BF             ; $178FCC |

  LDA #$0E                                  ; $178FD3 |
  STA $098A                                 ; $178FD5 |
  INC $0988                                 ; $178FD8 |
  PHB                                       ; $178FDB |
  LDY $098A                                 ; $178FDC |
  REP #$10                                  ; $178FDF |
  LDX $8FC3,y                               ; $178FE1 |
  STX $00                                   ; $178FE4 |
  LDA #$7E                                  ; $178FE6 |
  PHA                                       ; $178FE8 |
  PLB                                       ; $178FE9 |
  CPY #$0008                                ; $178FEA |
  LDY #$0200                                ; $178FED |
  BCC CODE_178FFC                           ; $178FF0 |

CODE_178FF2:
  STZ $0000,x                               ; $178FF2 |
  INX                                       ; $178FF5 |
  INX                                       ; $178FF6 |
  DEY                                       ; $178FF7 |
  BNE CODE_178FF2                           ; $178FF8 |
  BRA CODE_179007                           ; $178FFA |

CODE_178FFC:
  LDA $0400,x                               ; $178FFC |
  STA $0000,x                               ; $178FFF |
  INX                                       ; $179002 |
  INX                                       ; $179003 |
  DEY                                       ; $179004 |
  BNE CODE_178FFC                           ; $179005 |

CODE_179007:
  LDA #$7E                                  ; $179007 |
  PHA                                       ; $179009 |
  PLB                                       ; $17900A |
  REP #$20                                  ; $17900B |
  LDX $4800                                 ; $17900D |
  LDA #$3800                                ; $179010 |
  STA $0000,x                               ; $179013 |
  LDA $00                                   ; $179016 |
  STA $0005,x                               ; $179018 |
  LSR A                                     ; $17901B |
  BCC CODE_179021                           ; $17901C |
  INC $0000,x                               ; $17901E |

CODE_179021:
  LDY #$1800                                ; $179021 |
  AND #$0400                                ; $179024 |
  BNE CODE_17902F                           ; $179027 |
  LDA #$0080                                ; $179029 |
  LDY #$1900                                ; $17902C |

CODE_17902F:
  STA $0002,x                               ; $17902F |
  TYA                                       ; $179032 |
  STA $0003,x                               ; $179033 |
  LDA #$007E                                ; $179036 |
  STA $0007,x                               ; $179039 |
  LDA #$03FF                                ; $17903C |
  STA $0008,x                               ; $17903F |
  TXA                                       ; $179042 |
  CLC                                       ; $179043 |
  ADC #$000C                                ; $179044 |
  STA $000A,x                               ; $179047 |
  STA $4800                                 ; $17904A |
  SEP #$30                                  ; $17904D |
  PLB                                       ; $17904F |
  DEC $098A                                 ; $179050 |
  DEC $098A                                 ; $179053 |
  BMI CODE_179069                           ; $179056 |
  LDA $098A                                 ; $179058 |
  CMP #$06                                  ; $17905B |
  BNE CODE_17906C                           ; $17905D |
  LDA #$CE                                  ; $17905F |
  STA !r_reg_hdmaen_mirror                  ; $179061 |
  LDA #$11                                  ; $179064 |
  STA !r_reg_tm_mirror                      ; $179066 |

CODE_179069:
  INC $0988                                 ; $179069 |

CODE_17906C:
  RTS                                       ; $17906C |

  LDA $011A                                 ; $17906D |
  BEQ CODE_1790DF                           ; $179070 |
  BMI CODE_1790DF                           ; $179072 |
  LDA $0984                                 ; $179074 |
  EOR #$01                                  ; $179077 |
  BNE CODE_1790DF                           ; $179079 |
  STA $0984                                 ; $17907B |
  STZ $0982                                 ; $17907E |
  STZ $099E                                 ; $179081 |
  STZ $099F                                 ; $179084 |
  LDX #$04                                  ; $179087 |

CODE_179089:
  LDA $8041,x                               ; $179089 |
  STA $4350,x                               ; $17908C |
  LDA $805C,x                               ; $17908F |
  STA $4340,x                               ; $179092 |
  DEX                                       ; $179095 |
  BPL CODE_179089                           ; $179096 |
  LDX #$1E                                  ; $179098 |

CODE_17909A:
  LDA $8046,x                               ; $17909A |
  STA $7E5C18,x                             ; $17909D |
  LDA $8061,x                               ; $1790A1 |
  STA $7E5C98,x                             ; $1790A4 |
  DEX                                       ; $1790A8 |
  BPL CODE_17909A                           ; $1790A9 |
  JSR CODE_179466                           ; $1790AB |
  INC $0214                                 ; $1790AE |
  LDA #$41                                  ; $1790B1 |
  STA !r_reg_bgmode_mirror                  ; $1790B3 |
  LDA #$17                                  ; $1790B6 |
  STA !r_reg_tm_mirror                      ; $1790B8 |
  LDA #$30                                  ; $1790BB |
  STA !r_reg_bg1sc_mirror                   ; $1790BD |
  STA !r_reg_bg2sc_mirror                   ; $1790C0 |
  LDA #$11                                  ; $1790C3 |
  STA $09A0                                 ; $1790C5 |
  REP #$20                                  ; $1790C8 |
  STZ $45                                   ; $1790CA |
  STZ $47                                   ; $1790CC |
  STZ $3D                                   ; $1790CE |
  LDA #$0080                                ; $1790D0 |
  STA $3F                                   ; $1790D3 |
  SEP #$20                                  ; $1790D5 |
  LDA #$FE                                  ; $1790D7 |
  STA !r_reg_hdmaen_mirror                  ; $1790D9 |
  STZ $0988                                 ; $1790DC |

CODE_1790DF:
  RTS                                       ; $1790DF |

CODE_1790E0:
  JSR CODE_17942D                           ; $1790E0 |
  JSR CODE_17912F                           ; $1790E3 |
  LDA $707E7C                               ; $1790E6 |
  TAX                                       ; $1790EA |
  LDA $96BE,x                               ; $1790EB |
  STA $1109                                 ; $1790EE |
  LDA #$3A                                  ; $1790F1 |
  STA $110A                                 ; $1790F3 |
  REP #$20                                  ; $1790F6 |
  LDA #$000E                                ; $1790F8 |
  STA !gsu_r9                               ; $1790FB |
  LDA #$0017                                ; $1790FE |
  STA $6000                                 ; $179101 |
  LDA #$9123                                ; $179104 |
  STA $6002                                 ; $179107 |
  LDX #$08                                  ; $17910A |
  LDA #$D995                                ; $17910C |
  JSL r_gsu_init_1                          ; $17910F | GSU init
  SEP #$20                                  ; $179113 |
  LDA #$01                                  ; $179115 |
  STA $1117                                 ; $179117 |
  LDA #$06                                  ; $17911A |
  STA $1113                                 ; $17911C |
  STZ $1114                                 ; $17911F |
  RTS                                       ; $179122 |

  dw $1515, $1515, $1515, $1515             ; $179123 |
  dw $1515, $1515                           ; $17912B |

CODE_17912F:
  REP #$30                                  ; $17912F |
  LDX #$0000                                ; $179131 |
  LDA $1106                                 ; $179134 |
  AND #$0001                                ; $179137 |
  BEQ CODE_17913F                           ; $17913A |
  LDX #$0380                                ; $17913C |

CODE_17913F:
  STX $10                                   ; $17913F |
  LDA $1129                                 ; $179141 |
  ASL A                                     ; $179144 |
  TAX                                       ; $179145 |
  LDA $93C3,x                               ; $179146 |
  STA $12                                   ; $179149 |
  LDX $10                                   ; $17914B |
  LDY #$007F                                ; $17914D |
  LDA #$21BF                                ; $179150 |

CODE_179153:
  STA $0A06,x                               ; $179153 |
  STA $0B06,x                               ; $179156 |
  STA $0C06,x                               ; $179159 |
  INX                                       ; $17915C |
  INX                                       ; $17915D |
  DEY                                       ; $17915E |
  BPL CODE_179153                           ; $17915F |
  LDX $10                                   ; $179161 |
  LDY #$0000                                ; $179163 |

CODE_179166:
  LDA $92C7,y                               ; $179166 |
  ORA $12                                   ; $179169 |
  STA $0A0E,x                               ; $17916B |
  LDA $92F7,y                               ; $17916E |
  ORA $12                                   ; $179171 |
  STA $0A4E,x                               ; $179173 |
  LDA $9327,y                               ; $179176 |
  ORA $12                                   ; $179179 |
  STA $0A8E,x                               ; $17917B |
  STA $0ACE,x                               ; $17917E |
  STA $0B0E,x                               ; $179181 |
  STA $0B4E,x                               ; $179184 |
  STA $0B8E,x                               ; $179187 |
  STA $0BCE,x                               ; $17918A |
  STA $0C0E,x                               ; $17918D |
  STA $0C4E,x                               ; $179190 |
  STA $0C8E,x                               ; $179193 |
  LDA $9357,y                               ; $179196 |
  ORA $12                                   ; $179199 |
  STA $0CCE,x                               ; $17919B |
  INX                                       ; $17919E |
  INX                                       ; $17919F |
  INY                                       ; $1791A0 |
  INY                                       ; $1791A1 |
  CPY #$0030                                ; $1791A2 |
  BCC CODE_179166                           ; $1791A5 |
  LDX $10                                   ; $1791A7 |
  LDY #$0000                                ; $1791A9 |

CODE_1791AC:
  LDA $9387,y                               ; $1791AC |
  STA $0AB2,x                               ; $1791AF |
  LDA $9391,y                               ; $1791B2 |
  STA $0AF2,x                               ; $1791B5 |
  STA $0B32,x                               ; $1791B8 |
  STA $0B72,x                               ; $1791BB |
  STA $0BB2,x                               ; $1791BE |
  STA $0BF2,x                               ; $1791C1 |
  STA $0C32,x                               ; $1791C4 |
  STA $0C72,x                               ; $1791C7 |
  LDA $939B,y                               ; $1791CA |
  STA $0CB2,x                               ; $1791CD |
  INX                                       ; $1791D0 |
  INX                                       ; $1791D1 |
  INY                                       ; $1791D2 |
  INY                                       ; $1791D3 |
  CPY #$000A                                ; $1791D4 |
  BCC CODE_1791AC                           ; $1791D7 |
  LDX $10                                   ; $1791D9 |
  LDY #$0000                                ; $1791DB |

CODE_1791DE:
  LDA $93A5,y                               ; $1791DE |
  ORA $12                                   ; $1791E1 |
  STA $0BD2,x                               ; $1791E3 |
  LDA $93AF,y                               ; $1791E6 |
  ORA $12                                   ; $1791E9 |
  STA $0BDC,x                               ; $1791EB |
  LDA $93B9,y                               ; $1791EE |
  ORA $12                                   ; $1791F1 |
  STA $0BE6,x                               ; $1791F3 |
  INX                                       ; $1791F6 |
  INX                                       ; $1791F7 |
  INY                                       ; $1791F8 |
  INY                                       ; $1791F9 |
  CPY #$000A                                ; $1791FA |
  BCC CODE_1791DE                           ; $1791FD |
  LDA $1106                                 ; $1791FF |
  AND #$0001                                ; $179202 |
  XBA                                       ; $179205 |
  LSR A                                     ; $179206 |
  STA $02                                   ; $179207 |
  LDX $10                                   ; $179209 |
  LDY #$000D                                ; $17920B |
  LDA #$2200                                ; $17920E |
  ORA $02                                   ; $179211 |
  ORA $12                                   ; $179213 |
  STA $00                                   ; $179215 |

CODE_179217:
  LDA $00                                   ; $179217 |
  STA $0A54,x                               ; $179219 |
  ORA #$0010                                ; $17921C |
  STA $0A94,x                               ; $17921F |
  INC $00                                   ; $179222 |
  INX                                       ; $179224 |
  INX                                       ; $179225 |
  DEY                                       ; $179226 |
  BNE CODE_179217                           ; $179227 |
  LDX $10                                   ; $179229 |
  LDY #$0010                                ; $17922B |
  LDA #$2220                                ; $17922E |
  ORA $02                                   ; $179231 |
  ORA $12                                   ; $179233 |
  STA $00                                   ; $179235 |

CODE_179237:
  LDA $00                                   ; $179237 |
  STA $0C50,x                               ; $179239 |
  ORA #$0010                                ; $17923C |
  STA $0C90,x                               ; $17923F |
  INC $00                                   ; $179242 |
  INX                                       ; $179244 |
  INX                                       ; $179245 |
  DEY                                       ; $179246 |
  BNE CODE_179237                           ; $179247 |
  LDA $00                                   ; $179249 |
  CLC                                       ; $17924B |
  ADC #$0010                                ; $17924C |
  STA $0C50,x                               ; $17924F |
  ORA #$0010                                ; $179252 |
  STA $0C90,x                               ; $179255 |
  SEP #$10                                  ; $179258 |
  LDX #$00                                  ; $17925A |

CODE_17925C:
  LDA $1123,x                               ; $17925C |
  AND #$00FF                                ; $17925F |
  ASL A                                     ; $179262 |
  TAY                                       ; $179263 |
  LDA $93E1,y                               ; $179264 |
  ORA $93F9,y                               ; $179267 |
  STA $00                                   ; $17926A |
  LDA $93CB,x                               ; $17926C |
  CLC                                       ; $17926F |
  ADC $10                                   ; $179270 |
  STA $0A                                   ; $179272 |
  CLC                                       ; $179274 |
  ADC #$0040                                ; $179275 |
  STA $0C                                   ; $179278 |
  CLC                                       ; $17927A |
  ADC #$0040                                ; $17927B |
  STA $0E                                   ; $17927E |
  JSR CODE_179407                           ; $179280 |
  INX                                       ; $179283 |
  INX                                       ; $179284 |
  CPX #$06                                  ; $179285 |
  BCC CODE_17925C                           ; $179287 |
  LDA $1129                                 ; $179289 |
  ASL A                                     ; $17928C |
  ASL A                                     ; $17928D |
  TAX                                       ; $17928E |

CODE_17928F:
  LDA $93D1,x                               ; $17928F |
  STA $00                                   ; $179292 |
  TXA                                       ; $179294 |
  AND #$0002                                ; $179295 |
  TAY                                       ; $179298 |
  LDA $93DD,y                               ; $179299 |
  CLC                                       ; $17929C |
  ADC $10                                   ; $17929D |
  STA $0A                                   ; $17929F |
  CLC                                       ; $1792A1 |
  ADC #$0040                                ; $1792A2 |
  STA $0C                                   ; $1792A5 |
  CLC                                       ; $1792A7 |
  ADC #$0040                                ; $1792A8 |
  STA $0E                                   ; $1792AB |
  JSR CODE_179407                           ; $1792AD |
  INX                                       ; $1792B0 |
  INX                                       ; $1792B1 |
  TXA                                       ; $1792B2 |
  AND #$0002                                ; $1792B3 |
  BNE CODE_17928F                           ; $1792B6 |
  LDA $1106                                 ; $1792B8 |
  EOR #$0001                                ; $1792BB |
  AND #$0001                                ; $1792BE |
  STA $1106                                 ; $1792C1 |
  SEP #$30                                  ; $1792C4 |
  RTS                                       ; $1792C6 |

  dw $21BF, $21BF, $2186, $218F             ; $1792C7 |
  dw $218F, $218F, $218F, $218F             ; $1792CF |
  dw $218F, $218F, $218F, $218F             ; $1792D7 |
  dw $218F, $218F, $218F, $218F             ; $1792DF |
  dw $6186, $21BF, $21BF, $21BF             ; $1792E7 |
  dw $21BF, $21BF, $21BF, $21BF             ; $1792EF |

  dw $A199, $218F, $218E, $218E             ; $1792F7 |
  dw $218E, $218E, $218E, $218E             ; $1792FF |
  dw $218E, $218E, $218E, $218E             ; $179307 |
  dw $218E, $218E, $218E, $218E             ; $17930F |
  dw $218E, $218F, $218F, $218F             ; $179317 |
  dw $218F, $218F, $218F, $E199             ; $17931F |

  dw $2198, $218E, $218E, $218E             ; $179327 |
  dw $218E, $218E, $218E, $218E             ; $17932F |
  dw $218E, $218E, $218E, $218E             ; $179337 |
  dw $218E, $218E, $218E, $218E             ; $17933F |
  dw $218E, $218E, $218E, $218E             ; $179347 |
  dw $218E, $218E, $218E, $6198             ; $17934F |

  dw $21A1, $21AF, $21AF, $21AF             ; $179357 |
  dw $21AF, $21AF, $21AF, $21AF             ; $17935F |
  dw $21AF, $21AF, $21AF, $21AF             ; $179367 |
  dw $21AF, $21AF, $21AF, $21AF             ; $17936F |
  dw $21AF, $21AF, $21AF, $21AF             ; $179377 |
  dw $21AF, $21AF, $21AF, $61A1             ; $17937F |

  dw $399F, $398F, $398F, $398F             ; $179387 |
  dw $799F                                  ; $17938F |

  dw $3998, $398E, $398E, $398E             ; $179391 |
  dw $7998                                  ; $179399 |

  dw $B99F, $B98F, $B98F, $B98F             ; $17939B |
  dw $F99F                                  ; $1793A3 |

  dw $219A, $219B, $219C, $219D             ; $1793A5 |
  dw $219E                                  ; $1793AD |

  dw $219A, $219B, $219C, $21BB             ; $1793AF |
  dw $21BC                                  ; $1793B7 |

  dw $219A, $219B, $219C, $21BD             ; $1793B9 |
  dw $21BE                                  ; $1793C1 |

  dw $0C00, $1000, $1400, $1800             ; $1793C3 |

  dw $0B14, $0B1E, $0B28                    ; $1793CB |

  dw $2C51, $385A, $2C48, $385A             ; $1793D1 |
  dw $2C48, $2C51                           ; $1793D9 |

  dw $0AF4, $0BF4                           ; $1793DD |

  dw $2000, $2009, $2012, $201B             ; $1793E1 |
  dw $2024, $202D, $2036, $283F             ; $1793E9 |
  dw $2C48, $3451, $385A, $3863             ; $1793F1 |

  dw $1800, $1800, $1800, $1800             ; $1793F9 |
  dw $1800, $1800, $1800                    ; $179401 |

CODE_179407:
  LDY #$00                                  ; $179407 |

CODE_179409:
  TYA                                       ; $179409 |
  LSR A                                     ; $17940A |
  CLC                                       ; $17940B |
  ADC $00                                   ; $17940C |
  STA ($0A),y                               ; $17940E |
  INC A                                     ; $179410 |
  INC A                                     ; $179411 |
  INC A                                     ; $179412 |
  STA ($0C),y                               ; $179413 |
  INC A                                     ; $179415 |
  INC A                                     ; $179416 |
  INC A                                     ; $179417 |
  STA ($0E),y                               ; $179418 |
  INY                                       ; $17941A |
  INY                                       ; $17941B |
  CPY #$06                                  ; $17941C |
  BCC CODE_179409                           ; $17941E |
  RTS                                       ; $179420 |

  dw $7C02, $7C6A, $7CD2                    ; $179421 |

  dw $1123, $1125, $1127                    ; $179427 |

CODE_17942D:
  REP #$20                                  ; $17942D |
  LDA #$0000                                ; $17942F |
  STA $10                                   ; $179432 |
  PHB                                       ; $179434 |
  LDX #$70                                  ; $179435 |
  PHX                                       ; $179437 |
  PLB                                       ; $179438 |
  LDX #$00                                  ; $179439 |

CODE_17943B:
  LDA $179427,x                             ; $17943B |
  STA $0E                                   ; $17943F |
  LDA $179421,x                             ; $179441 |
  STA $04                                   ; $179445 |
  SEP #$20                                  ; $179447 |
  STZ $00                                   ; $179449 |
  LDA ($04)                                 ; $17944B |
  BMI CODE_179456                           ; $17944D |

CODE_17944F:
  INC $00                                   ; $17944F |
  SEC                                       ; $179451 |
  SBC #$0C                                  ; $179452 |
  BPL CODE_17944F                           ; $179454 |

CODE_179456:
  LDA $00                                   ; $179456 |
  STA [$0E]                                 ; $179458 |
  REP #$20                                  ; $17945A |
  INX                                       ; $17945C |
  INX                                       ; $17945D |
  CPX #$06                                  ; $17945E |
  BCC CODE_17943B                           ; $179460 |
  PLB                                       ; $179462 |
  SEP #$20                                  ; $179463 |
  RTS                                       ; $179465 |

CODE_179466:
  LDA #$17                                  ; $179466 |
  STA $6022                                 ; $179468 |
  REP #$20                                  ; $17946B |
  LDA #$94BE                                ; $17946D |
  STA $6020                                 ; $179470 |
  LDA #$000C                                ; $179473 |
  STA $6024                                 ; $179476 |
  LDA #$0008                                ; $179479 |
  STA $6026                                 ; $17947C |
  LDA #$0008                                ; $17947F |
  STA $6028                                 ; $179482 |
  LDA #$0007                                ; $179485 |
  STA $602A                                 ; $179488 |
  LDA #$0009                                ; $17948B |
  STA $602C                                 ; $17948E |
  LDX #$09                                  ; $179491 |
  LDA #$EB9E                                ; $179493 |
  JSL r_gsu_init_1                          ; $179496 | GSU init
  REP #$10                                  ; $17949A |
  LDA $1106                                 ; $17949C |
  AND #$0001                                ; $17949F |
  ASL A                                     ; $1794A2 |
  TAY                                       ; $1794A3 |
  LDA $94BA,y                               ; $1794A4 |
  TAY                                       ; $1794A7 |
  LDX #$2800                                ; $1794A8 |
  LDA #$0070                                ; $1794AB |
  STA $01                                   ; $1794AE |
  LDA #$0C00                                ; $1794B0 |
  JSL $00BEA6                               ; $1794B3 |
  SEP #$30                                  ; $1794B7 |
  RTS                                       ; $1794B9 |

  dw $4800, $4000                           ; $1794BA |

; gsu table
  db $FF, $13, $04, $AF, $B2, $B5, $AE, $D0 ; $1794BE |
  db $B6, $AE, $B7, $BE, $FF, $80, $FF, $0D ; $1794C6 |
  db $12, $B9, $B5, $AA, $C2, $D0, $C0, $B1 ; $1794CE |
  db $B2, $AC, $B1, $D0, $AF, $B2, $B5, $AE ; $1794D6 |
  db $C6, $FF, $FF                          ; $1794DE |

CODE_1794E1:
  STZ !s_oam_hi_table_mirror                ; $1794E1 |
  STZ $6C01                                 ; $1794E4 |
  STZ $112C                                 ; $1794E7 |
  STZ $112D                                 ; $1794EA |
  LDA #$B5                                  ; $1794ED |
  STA !r_reg_cgadsub_mirror                 ; $1794EF |
  LDA $1117                                 ; $1794F2 |
  BEQ CODE_1794FE                           ; $1794F5 |
  ASL A                                     ; $1794F7 |
  TAX                                       ; $1794F8 |
  JSR ($9563,x)                             ; $1794F9 |
  BRA CODE_179561                           ; $1794FC |

CODE_1794FE:
  LDA $112E                                 ; $1794FE |
  BEQ CODE_17950D                           ; $179501 |
  ASL A                                     ; $179503 |
  TAX                                       ; $179504 |
  JSR ($9569,x)                             ; $179505 |
  JSR CODE_17A390                           ; $179508 |
  BRA CODE_179561                           ; $17950B |

CODE_17950D:
  LDA $1119                                 ; $17950D |
  BEQ CODE_17952E                           ; $179510 |
  ASL A                                     ; $179512 |
  TAX                                       ; $179513 |
  JSR ($9573,x)                             ; $179514 |
  LDA $1119                                 ; $179517 |
  CMP #$05                                  ; $17951A |
  BCC CODE_179525                           ; $17951C |
  CMP #$17                                  ; $17951E |
  BCS CODE_179525                           ; $179520 |
  JSR CODE_17A3E2                           ; $179522 |

CODE_179525:
  LDA $1119                                 ; $179525 |
  CMP #$10                                  ; $179528 |
  BCC CODE_179561                           ; $17952A |
  BRA CODE_179564                           ; $17952C |

CODE_17952E:
  LDA $111B                                 ; $17952E |
  BEQ CODE_17954F                           ; $179531 |
  ASL A                                     ; $179533 |
  TAX                                       ; $179534 |
  JSR ($95AB,x)                             ; $179535 |
  LDA $111B                                 ; $179538 |
  CMP #$05                                  ; $17953B |
  BCC CODE_179546                           ; $17953D |
  CMP #$16                                  ; $17953F |
  BCS CODE_179546                           ; $179541 |
  JSR CODE_17A3E2                           ; $179543 |

CODE_179546:
  LDA $111B                                 ; $179546 |
  CMP #$06                                  ; $179549 |
  BCC CODE_179561                           ; $17954B |
  BRA CODE_179564                           ; $17954D |

CODE_17954F:
  LDA $1130                                 ; $17954F |
  BEQ CODE_179561                           ; $179552 |
  ASL A                                     ; $179554 |
  TAX                                       ; $179555 |
  JSR ($95E3,x)                             ; $179556 |
  LDA $1130                                 ; $179559 |
  BEQ CODE_179561                           ; $17955C |
  JSR CODE_17A390                           ; $17955E |

CODE_179561:
  JSR CODE_17A356                           ; $179561 |

CODE_179564:
  RTS                                       ; $179564 |

  dw $95F5                                  ; $179565 |
  dw $96C3                                  ; $179567 |
  dw $96F8                                  ; $179569 |
  dw $97B3                                  ; $17956B |

  dw $97E5                                  ; $17956D |
  dw $980C                                  ; $17956F |
  dw $9839                                  ; $179571 |
  dw $9845                                  ; $179573 |

  dw $963E                                  ; $179575 |
  dw $96C3                                  ; $179577 |
  dw $96F8                                  ; $179579 |
  dw $9D45                                  ; $17957B |
  dw $9D57                                  ; $17957D |
  dw $9DE0                                  ; $17957F |
  dw $9E2B                                  ; $179581 |
  dw $9E63                                  ; $179583 |
  dw $9EBE                                  ; $179585 |
  dw $96C3                                  ; $179587 |
  dw $9F22                                  ; $179589 |
  dw $9DE0                                  ; $17958B |
  dw $9F3B                                  ; $17958D |
  dw $9E63                                  ; $17958F |
  dw $9F53                                  ; $179591 |
  dw $9DE0                                  ; $179593 |
  dw $9F5E                                  ; $179595 |
  dw $9F7E                                  ; $179597 |
  dw $9FA8                                  ; $179599 |
  dw $9FBF                                  ; $17959B |
  dw $9FE7                                  ; $17959D |
  dw $A03A                                  ; $17959F |
  dw $9E63                                  ; $1795A1 |
  dw $A069                                  ; $1795A3 |
  dw $9DE0                                  ; $1795A5 |
  dw $A08B                                  ; $1795A7 |
  dw $9E63                                  ; $1795A9 |
  dw $A09C                                  ; $1795AB |
  dw $963E                                  ; $1795AD |

  dw $96C3                                  ; $1795AF |
  dw $96F8                                  ; $1795B1 |
  dw $9D45                                  ; $1795B3 |
  dw $9D57                                  ; $1795B5 |
  dw $9DE0                                  ; $1795B7 |
  dw $9E2B                                  ; $1795B9 |
  dw $9E63                                  ; $1795BB |
  dw $A0A7                                  ; $1795BD |
  dw $A105                                  ; $1795BF |
  dw $9F22                                  ; $1795C1 |
  dw $9DE0                                  ; $1795C3 |
  dw $9F3B                                  ; $1795C5 |
  dw $9E63                                  ; $1795C7 |
  dw $9F53                                  ; $1795C9 |
  dw $9DE0                                  ; $1795CB |
  dw $A14F                                  ; $1795CD |
  dw $A15E                                  ; $1795CF |
  dw $A1B0                                  ; $1795D1 |
  dw $A25C                                  ; $1795D3 |
  dw $A03A                                  ; $1795D5 |
  dw $A313                                  ; $1795D7 |
  dw $9E63                                  ; $1795D9 |
  dw $A069                                  ; $1795DB |
  dw $9DE0                                  ; $1795DD |
  dw $A345                                  ; $1795DF |
  dw $9E63                                  ; $1795E1 |
  dw $A09C                                  ; $1795E3 |
  dw $9A0A                                  ; $1795E5 |

  dw $9A50                                  ; $1795E7 |
  dw $9A6F                                  ; $1795E9 |
  dw $9A92                                  ; $1795EB |
  dw $9B67                                  ; $1795ED |
  dw $9CB7                                  ; $1795EF |
  dw $9CDE                                  ; $1795F1 |

  db $01, $FF                               ; $1795F3 |

  LDA $38                                   ; $1795F5 |
  AND #$03                                  ; $1795F7 |
  BEQ CODE_179626                           ; $1795F9 |
  TAY                                       ; $1795FB |
  LDA $111D                                 ; $1795FC |
  CLC                                       ; $1795FF |
  ADC $95F2,y                               ; $179600 |
  BMI CODE_179613                           ; $179603 |
  LDX #$57                                  ; $179605 |
  STX $53                                   ; $179607 |
  CMP #$03                                  ; $179609 |
  BCS CODE_179615                           ; $17960B |
  STA $111D                                 ; $17960D |
  INC $1117                                 ; $179610 |

CODE_179613:
  BRA CODE_17963D                           ; $179613 |

CODE_179615:
  LDA #$C4                                  ; $179615 |
  STA $1109                                 ; $179617 |
  LDA #$32                                  ; $17961A |
  STA $110A                                 ; $17961C |
  LDA #$03                                  ; $17961F |
  STA $1117                                 ; $179621 |
  BRA CODE_17963D                           ; $179624 |

CODE_179626:
  LDA $35                                   ; $179626 |
  AND #$C0                                  ; $179628 |
  ORA $36                                   ; $17962A |
  AND #$D0                                  ; $17962C |
  BEQ CODE_17963D                           ; $17962E |
  INC $112C                                 ; $179630 |
  STZ $1117                                 ; $179633 |
  INC $112E                                 ; $179636 |
  LDA #$09                                  ; $179639 |
  STA $53                                   ; $17963B |

CODE_17963D:
  RTS                                       ; $17963D |

  LDA $38                                   ; $17963E |
  AND #$03                                  ; $179640 |
  BEQ CODE_17969C                           ; $179642 |
  TAY                                       ; $179644 |
  LDA $111D                                 ; $179645 |
  STA $00                                   ; $179648 |
  CLC                                       ; $17964A |
  ADC $95F2,y                               ; $17964B |
  BMI CODE_179677                           ; $17964E |
  CMP #$03                                  ; $179650 |
  BCS CODE_179682                           ; $179652 |
  STA $111D                                 ; $179654 |
  LDA $1129                                 ; $179657 |
  ASL A                                     ; $17965A |
  TAX                                       ; $17965B |
  JSR ($96ED,x)                             ; $17965C |
  TXA                                       ; $17965F |
  BNE CODE_179677                           ; $179660 |
  LDA $111D                                 ; $179662 |
  CMP #$03                                  ; $179665 |
  BCS CODE_179682                           ; $179667 |
  LDA #$57                                  ; $179669 |
  STA $53                                   ; $17966B |
  LDA $1129                                 ; $17966D |
  ASL A                                     ; $179670 |
  TAX                                       ; $179671 |
  INC $1117,x                               ; $179672 |
  BRA CODE_1796BD                           ; $179675 |

CODE_179677:
  LDA $00                                   ; $179677 |
  STA $111D                                 ; $179679 |
  LDA #$57                                  ; $17967C |
  STA $53                                   ; $17967E |
  BRA CODE_1796BD                           ; $179680 |

CODE_179682:
  LDA #$C4                                  ; $179682 |
  STA $1109                                 ; $179684 |
  LDA #$32                                  ; $179687 |
  STA $110A                                 ; $179689 |
  LDA $1129                                 ; $17968C |
  ASL A                                     ; $17968F |
  TAX                                       ; $179690 |
  LDA #$03                                  ; $179691 |
  STA $1117,x                               ; $179693 |
  LDA #$57                                  ; $179696 |
  STA $53                                   ; $179698 |
  BRA CODE_1796BD                           ; $17969A |

CODE_17969C:
  LDA $36                                   ; $17969C |
  ORA $35                                   ; $17969E |
  AND #$D0                                  ; $1796A0 |
  BEQ CODE_1796BD                           ; $1796A2 |
  LDA $111D                                 ; $1796A4 |
  STA $1134                                 ; $1796A7 |
  INC $112C                                 ; $1796AA |
  LDA $1129                                 ; $1796AD |
  ASL A                                     ; $1796B0 |
  TAX                                       ; $1796B1 |
  LDA #$04                                  ; $1796B2 |
  STA $1117,x                               ; $1796B4 |
  LDA #$09                                  ; $1796B7 |
  STA $53                                   ; $1796B9 |
  BRA CODE_1796BD                           ; $1796BB |

CODE_1796BD:
  RTS                                       ; $1796BD |

  db $44, $6C, $94                          ; $1796BE |

  db $04, $FC                               ; $1796C1 |

  LDX $111D                                 ; $1796C3 |
  LDA $1109                                 ; $1796C6 |
  CMP $96BE,x                               ; $1796C9 |
  BEQ CODE_1796DE                           ; $1796CC |
  ROL A                                     ; $1796CE |
  AND #$01                                  ; $1796CF |
  TAX                                       ; $1796D1 |
  LDA $1109                                 ; $1796D2 |
  CLC                                       ; $1796D5 |
  ADC $96C1,x                               ; $1796D6 |
  STA $1109                                 ; $1796D9 |
  BRA CODE_1796E6                           ; $1796DC |

CODE_1796DE:
  LDA $1129                                 ; $1796DE |
  ASL A                                     ; $1796E1 |
  TAX                                       ; $1796E2 |
  DEC $1117,x                               ; $1796E3 |

CODE_1796E6:
  RTS                                       ; $1796E6 |

  db $01, $02, $00, $02, $00, $01           ; $1796E7 |

  dw $9774                                  ; $1796ED |
  dw $9777                                  ; $1796EF |
  dw $9791                                  ; $1796F1 |

  db $01, $01, $01, $32, $52                ; $1796F3 |

  LDA #$02                                  ; $1796F8 |
  STA $111D                                 ; $1796FA |
  LDA $38                                   ; $1796FD |
  AND #$0C                                  ; $1796FF |
  BEQ CODE_179716                           ; $179701 |
  LDA $112B                                 ; $179703 |
  EOR #$01                                  ; $179706 |
  AND #$01                                  ; $179708 |
  STA $112B                                 ; $17970A |
  TAX                                       ; $17970D |
  LDA $96F6,x                               ; $17970E |
  STA $110A                                 ; $179711 |
  BRA CODE_17976F                           ; $179714 |

CODE_179716:
  LDA $36                                   ; $179716 |
  ORA $35                                   ; $179718 |
  AND #$D0                                  ; $17971A |
  BEQ CODE_17973C                           ; $17971C |
  STZ $1117                                 ; $17971E |
  STZ $1119                                 ; $179721 |
  STZ $111B                                 ; $179724 |
  LDA $1129                                 ; $179727 |
  ASL A                                     ; $17972A |
  ADC $112B                                 ; $17972B |
  TAX                                       ; $17972E |
  LDA $96E7,x                               ; $17972F |
  STA $1129                                 ; $179732 |
  INC $1130                                 ; $179735 |
  LDA #$09                                  ; $179738 |
  BRA CODE_179771                           ; $17973A |

CODE_17973C:
  LDA $38                                   ; $17973C |
  AND #$03                                  ; $17973E |
  BEQ CODE_179773                           ; $179740 |
  TAY                                       ; $179742 |
  AND #$01                                  ; $179743 |
  BNE CODE_179773                           ; $179745 |
  LDA $1129                                 ; $179747 |
  ASL A                                     ; $17974A |
  TAX                                       ; $17974B |
  JSR ($96ED,x)                             ; $17974C |
  TXA                                       ; $17974F |
  BNE CODE_179773                           ; $179750 |
  LDX $111D                                 ; $179752 |
  LDA $96BE,x                               ; $179755 |
  STA $1109                                 ; $179758 |
  LDA #$3A                                  ; $17975B |
  STA $110A                                 ; $17975D |
  LDA $1129                                 ; $179760 |
  TAX                                       ; $179763 |
  ASL A                                     ; $179764 |
  TAY                                       ; $179765 |
  LDA $96F3,x                               ; $179766 |
  STA $1117,y                               ; $179769 |
  STZ $112B                                 ; $17976C |

CODE_17976F:
  LDA #$57                                  ; $17976F |

CODE_179771:
  STA $53                                   ; $179771 |

CODE_179773:
  RTS                                       ; $179773 |

  LDX #$6000                                ; $179774 |
  LDA $111D                                 ; $179777 |
  ASL A                                     ; $17977A |
  TAX                                       ; $17977B |

CODE_17977C:
  LDA $1123,x                               ; $17977C |
  BEQ CODE_179791                           ; $17977F |
  TXA                                       ; $179781 |
  CLC                                       ; $179782 |
  ADC $95F2,y                               ; $179783 |
  CLC                                       ; $179786 |
  ADC $95F2,y                               ; $179787 |
  TAX                                       ; $17978A |
  BMI CODE_179791                           ; $17978B |
  CMP #$06                                  ; $17978D |
  BCC CODE_17977C                           ; $17978F |

CODE_179791:
  LDA $111D                                 ; $179791 |
  ASL A                                     ; $179794 |
  TAX                                       ; $179795 |

CODE_179796:
  LDA $1123,x                               ; $179796 |
  BNE CODE_1797AB                           ; $179799 |
  TXA                                       ; $17979B |
  CLC                                       ; $17979C |
  ADC $95F2,y                               ; $17979D |
  CLC                                       ; $1797A0 |
  ADC $95F2,y                               ; $1797A1 |
  TAX                                       ; $1797A4 |
  BMI CODE_1797B2                           ; $1797A5 |
  CMP #$06                                  ; $1797A7 |
  BCC CODE_179796                           ; $1797A9 |

CODE_1797AB:
  TXA                                       ; $1797AB |
  LSR A                                     ; $1797AC |
  STA $111D                                 ; $1797AD |
  LDX #$00                                  ; $1797B0 |

CODE_1797B2:
  RTS                                       ; $1797B2 |

  INC $112C                                 ; $1797B3 |
  REP #$20                                  ; $1797B6 |
  LDA #$0100                                ; $1797B8 |
  STA $1110                                 ; $1797BB |
  LDA $1129                                 ; $1797BE |
  ASL A                                     ; $1797C1 |
  TAX                                       ; $1797C2 |
  LDA $111D                                 ; $1797C3 |
  AND #$0007                                ; $1797C6 |
  ASL A                                     ; $1797C9 |
  TAY                                       ; $1797CA |
  LDA $93CB,y                               ; $1797CB |
  JSR CODE_179960                           ; $1797CE |
  SEP #$20                                  ; $1797D1 |
  LDA $111D                                 ; $1797D3 |
  ASL A                                     ; $1797D6 |
  TAX                                       ; $1797D7 |
  LDA $1123,x                               ; $1797D8 |
  CLC                                       ; $1797DB |
  ADC #$54                                  ; $1797DC |
  JSR CODE_1799AB                           ; $1797DE |
  INC $112E                                 ; $1797E1 |
  RTS                                       ; $1797E4 |

  INC $112C                                 ; $1797E5 |
  REP #$20                                  ; $1797E8 |
  LDA $1110                                 ; $1797EA |
  SEC                                       ; $1797ED |
  SBC #$0008                                ; $1797EE |
  STA $1110                                 ; $1797F1 |
  SEP #$20                                  ; $1797F4 |
  CMP #$C0                                  ; $1797F6 |
  BCS CODE_1797FD                           ; $1797F8 |
  INC $112E                                 ; $1797FA |

CODE_1797FD:
  LDA $111D                                 ; $1797FD |
  ASL A                                     ; $179800 |
  TAX                                       ; $179801 |
  LDA $1123,x                               ; $179802 |
  CLC                                       ; $179805 |
  ADC #$54                                  ; $179806 |
  JSR CODE_1799AB                           ; $179808 |
  RTS                                       ; $17980B |

  INC $112C                                 ; $17980C |
  REP #$20                                  ; $17980F |
  LDA $1110                                 ; $179811 |
  CLC                                       ; $179814 |
  ADC #$0008                                ; $179815 |
  STA $1110                                 ; $179818 |
  SEP #$20                                  ; $17981B |
  LDA $111D                                 ; $17981D |
  ASL A                                     ; $179820 |
  TAX                                       ; $179821 |
  LDA $1123,x                               ; $179822 |
  CLC                                       ; $179825 |
  ADC #$54                                  ; $179826 |
  JSR CODE_1799AB                           ; $179828 |
  LDA $1111                                 ; $17982B |
  BEQ CODE_179838                           ; $17982E |
  LDA #$20                                  ; $179830 |
  STA $1110                                 ; $179832 |
  INC $112E                                 ; $179835 |

CODE_179838:
  RTS                                       ; $179838 |

  INC $112C                                 ; $179839 |
  DEC $1110                                 ; $17983C |
  BNE CODE_179844                           ; $17983F |
  INC $112E                                 ; $179841 |

CODE_179844:
  RTS                                       ; $179844 |

  LDA $111D                                 ; $179845 |
  STA $707E7C                               ; $179848 |
  ASL A                                     ; $17984C |
  STA !r_cur_save_file                      ; $17984D |
  REP #$20                                  ; $179850 |
  LDX #$0A                                  ; $179852 |
  LDA #$0000                                ; $179854 |

CODE_179857:
  STA !r_map_icon_gfx,x                     ; $179857 |
  STA $031B,x                               ; $17985A |
  STA $0327,x                               ; $17985D |
  STA $0333,x                               ; $179860 |
  STA $033F,x                               ; $179863 |
  STA $034B,x                               ; $179866 |
  DEX                                       ; $179869 |
  DEX                                       ; $17986A |
  BPL CODE_179857                           ; $17986B |
  LDA #$F0F0                                ; $17986D |
  STA $0317                                 ; $179870 |
  STA $0323                                 ; $179873 |
  STA $032F                                 ; $179876 |
  STA $033B                                 ; $179879 |
  STA $0347                                 ; $17987C |
  STA $0353                                 ; $17987F |
  SEP #$20                                  ; $179882 |
  JSL $10810A                               ; $179884 |
  STZ !r_last_world_unlocked                ; $179888 |
  LDA !r_cur_stage                          ; $17988B |\ branch if level >= $80
  BMI .debug_file_3                         ; $17988E |/ means selecting from title screen (??)
  CMP #$3C                                  ; $179890 |\ branch if level < $3C
  BCC .debug_file_3                         ; $179892 |/
  INC !r_last_world_unlocked                ; $179894 | unlock final world flag

.debug_file_3
  JMP CODE_179932                           ; $179897 | jump past debug code

; debug code: on file 3 select,
; grant 99 coins, unlock all stages
; and grant all pause menu items
; (maybe more)
  LDA $111D                                 ; $17989A |\
  CMP #$02                                  ; $17989D | | check if file 3
  BEQ CODE_1798A4                           ; $17989F |/
  JMP CODE_179932                           ; $1798A1 | jump past debug code if not

CODE_1798A4:
  LDA #$63                                  ; $1798A4 |\ change coins to 99
  STA !r_coins_collected                    ; $1798A6 |/
  LDA $35                                   ; $1798A9 |\  L or R being held?
  AND #$30                                  ; $1798AB | | branch if not
  BEQ CODE_1798B4                           ; $1798AD |/
  LDA #$63                                  ; $1798AF |\ if L or R are held,
  STA !r_extra_lives                        ; $1798B1 |/ change lives to 99

CODE_1798B4:
  LDX #$00                                  ; $1798B4 |
  TXA                                       ; $1798B6 |
  INC A                                     ; $1798B7 |

CODE_1798B8:
  STA !r_pause_items,x                      ; $1798B8 | fill items
  INC A                                     ; $1798BB |
  CMP #$0A                                  ; $1798BC |
  BCC CODE_1798C2                           ; $1798BE |
  LDA #$01                                  ; $1798C0 |

CODE_1798C2:
  INX                                       ; $1798C2 |
  CPX #$1B                                  ; $1798C3 |
  BCC CODE_1798B8                           ; $1798C5 |
  LDA #$00                                  ; $1798C7 |
  TAX                                       ; $1798C9 |
  TXY                                       ; $1798CA |
  INC A                                     ; $1798CB |

CODE_1798CC:
  STA !r_stages_unlocked,y                  ; $1798CC | mark all levels as beaten
  INY                                       ; $1798CF |
  CPY #$48                                  ; $1798D0 |
  BCC CODE_1798CC                           ; $1798D2 |
  LDA #$00                                  ; $1798D4 |
  TAX                                       ; $1798D6 |

CODE_1798D7:
  INC A                                     ; $1798D7 | set level tile graphic
  PHA                                       ; $1798D8 |
  REP #$20                                  ; $1798D9 |
  LDA $1081E9,x                             ; $1798DB |
  STA $00                                   ; $1798DF |
  LDA $108201,x                             ; $1798E1 |
  STA $02                                   ; $1798E5 |
  LDA $108219,x                             ; $1798E7 |
  STA $04                                   ; $1798EB |
  LDA $108231,x                             ; $1798ED |
  STA $06                                   ; $1798F1 |
  LDA $108249,x                             ; $1798F3 |
  STA $08                                   ; $1798F7 |
  LDA $108261,x                             ; $1798F9 |
  STA $0A                                   ; $1798FD |
  SEP #$20                                  ; $1798FF |
  PLA                                       ; $179901 |
  STA ($00)                                 ; $179902 |
  STA ($02)                                 ; $179904 |
  STA ($04)                                 ; $179906 |
  STA ($06)                                 ; $179908 |
  STA ($08)                                 ; $17990A |
  STA ($0A)                                 ; $17990C |
  INX                                       ; $17990E |
  INX                                       ; $17990F |
  CPX #$18                                  ; $179910 |
  BCC CODE_1798D7                           ; $179912 |
  REP #$20                                  ; $179914 |
  LDA #$0A09                                ; $179916 | Sets extra and bonus tile graphic again?
  STA $0317                                 ; $179919 |
  STA $0323                                 ; $17991C |
  STA $032F                                 ; $17991F |
  STA $033B                                 ; $179922 |
  STA $0347                                 ; $179925 |
  STA $0353                                 ; $179928 |
  SEP #$20                                  ; $17992B |
  LDA #$01                                  ; $17992D |\
  STA $1127                                 ; $17992F |/ Set starting world as 1
; END DEBUG CODE

CODE_179932:
  LDA #$03                                  ; $179932 |\ starting # of lives after file select
  STA !r_extra_lives                        ; $179934 |/
  LDA #$1F                                  ; $179937 |
  STA !r_game_mode                          ; $179939 |
  LDA #$F1                                  ; $17993C |
  STA $4D                                   ; $17993E |
  LDA #$01                                  ; $179940 |
  STA $0201                                 ; $179942 |
  STZ $1115                                 ; $179945 |
  STZ $1116                                 ; $179948 |
  LDX !r_cur_save_file                      ; $17994B |
  LDA $1123,x                               ; $17994E |
  BNE CODE_17995B                           ; $179951 |
  LDA #$37                                  ; $179953 |
  STA !r_game_mode                          ; $179955 |
  STZ !r_yoshi_color                        ; $179958 |

CODE_17995B:
  RTS                                       ; $17995B |

  STX $0D                                   ; $17995C |
  ASL $0A                                   ; $17995E |

CODE_179960:
  LDY $1106                                 ; $179960 |
  BNE CODE_179969                           ; $179963 |
  CLC                                       ; $179965 |
  ADC #$0380                                ; $179966 |

CODE_179969:
  STA $00                                   ; $179969 |
  CLC                                       ; $17996B |
  ADC #$0040                                ; $17996C |
  STA $02                                   ; $17996F |
  CLC                                       ; $179971 |
  ADC #$0040                                ; $179972 |
  STA $04                                   ; $179975 |
  LDY #$00                                  ; $179977 |
  LDA #$218E                                ; $179979 |
  ORA $93C3,x                               ; $17997C |

CODE_17997F:
  STA ($00),y                               ; $17997F |
  STA ($02),y                               ; $179981 |
  STA ($04),y                               ; $179983 |
  INY                                       ; $179985 |
  INY                                       ; $179986 |
  CPY #$06                                  ; $179987 |
  BCC CODE_17997F                           ; $179989 |

CODE_17998B:
  REP #$10                                  ; $17998B |
  LDA $1106                                 ; $17998D |
  AND #$0001                                ; $179990 |
  ASL A                                     ; $179993 |
  TAY                                       ; $179994 |
  LDA #$0000                                ; $179995 |
  STA $01                                   ; $179998 |
  LDA $995C,y                               ; $17999A |
  TAX                                       ; $17999D |
  LDY #$3020                                ; $17999E |
  LDA #$0300                                ; $1799A1 |
  JSL $00BEA6                               ; $1799A4 |
  SEP #$10                                  ; $1799A8 |
  RTS                                       ; $1799AA |

CODE_1799AB:
  REP #$20                                  ; $1799AB |
  AND #$00FF                                ; $1799AD |
  STA !gsu_r3                               ; $1799B0 |
  LDA #$0015                                ; $1799B3 |
  STA !gsu_r1                               ; $1799B6 |
  LDA $1110                                 ; $1799B9 |
  STA !gsu_r6                               ; $1799BC |
  LDX #$08                                  ; $1799BF |
  LDA #$DBDE                                ; $1799C1 |
  JSL r_gsu_init_1                          ; $1799C4 | GSU init
  REP #$10                                  ; $1799C8 |
  LDY #$7C80                                ; $1799CA |
  LDA #$0070                                ; $1799CD |
  STA $01                                   ; $1799D0 |
  LDX #$2800                                ; $1799D2 |
  LDA #$0080                                ; $1799D5 |
  JSL $00BEA6                               ; $1799D8 |
  LDY #$7D80                                ; $1799DC |
  LDX #$2A00                                ; $1799DF |
  LDA #$0080                                ; $1799E2 |
  JSL $00BEA6                               ; $1799E5 |
  LDY #$7E80                                ; $1799E9 |
  LDX #$2C00                                ; $1799EC |
  LDA #$0080                                ; $1799EF |
  JSL $00BEA6                               ; $1799F2 |
  LDY #$7F80                                ; $1799F6 |
  LDX #$2E00                                ; $1799F9 |
  LDA #$0080                                ; $1799FC |
  JSL $00BEA6                               ; $1799FF |
  SEP #$30                                  ; $179A03 |
  RTS                                       ; $179A05 |

  dw $0AF4, $0BF4                           ; $179A06 |

  INC $112C                                 ; $179A0A |
  REP #$20                                  ; $179A0D |
  LDA #$0100                                ; $179A0F |
  STA $1110                                 ; $179A12 |
  LDA $112B                                 ; $179A15 |
  ASL A                                     ; $179A18 |
  TAY                                       ; $179A19 |
  LDA $9A06,y                               ; $179A1A |
  LDX #$06                                  ; $179A1D |
  JSR CODE_179960                           ; $179A1F |
  SEP #$20                                  ; $179A22 |
  STZ $112B                                 ; $179A24 |
  JSR CODE_179A88                           ; $179A27 |
  JSR CODE_17912F                           ; $179A2A |
  REP #$30                                  ; $179A2D |
  LDA $1106                                 ; $179A2F |
  AND #$0001                                ; $179A32 |
  ASL A                                     ; $179A35 |
  TAY                                       ; $179A36 |
  LDA #$0000                                ; $179A37 |
  STA $01                                   ; $179A3A |
  LDA $995C,y                               ; $179A3C |
  TAX                                       ; $179A3F |
  LDY #$3220                                ; $179A40 |
  LDA #$0300                                ; $179A43 |
  JSL $00BEA6                               ; $179A46 |
  SEP #$30                                  ; $179A4A |
  INC $1130                                 ; $179A4C |
  RTS                                       ; $179A4F |

  INC $112C                                 ; $179A50 |
  REP #$20                                  ; $179A53 |
  LDA $1110                                 ; $179A55 |
  SEC                                       ; $179A58 |
  SBC #$0008                                ; $179A59 |
  STA $1110                                 ; $179A5C |
  SEP #$20                                  ; $179A5F |
  CMP #$C0                                  ; $179A61 |
  BCS CODE_179A68                           ; $179A63 |
  INC $1130                                 ; $179A65 |

CODE_179A68:
  JSR CODE_179A88                           ; $179A68 |
  RTS                                       ; $179A6B |

  db $5C, $5D, $5E                          ; $179A6C |

  INC $112C                                 ; $179A6F |
  REP #$20                                  ; $179A72 |
  LDA $1110                                 ; $179A74 |
  CLC                                       ; $179A77 |
  ADC #$0008                                ; $179A78 |
  STA $1110                                 ; $179A7B |
  SEP #$20                                  ; $179A7E |
  LDA $1111                                 ; $179A80 |
  BEQ CODE_179A88                           ; $179A83 |
  INC $1130                                 ; $179A85 |

CODE_179A88:
  LDX $1129                                 ; $179A88 |
  LDA $9A6C,x                               ; $179A8B |
  JSR CODE_1799AB                           ; $179A8E |
  RTS                                       ; $179A91 |

  LDA #$17                                  ; $179A92 |
  STA $6022                                 ; $179A94 |
  REP #$20                                  ; $179A97 |
  LDA $1129                                 ; $179A99 |
  ASL A                                     ; $179A9C |
  TAX                                       ; $179A9D |
  LDA $9AF0,x                               ; $179A9E |
  STA $6020                                 ; $179AA1 |
  LDA #$0008                                ; $179AA4 |
  STA $6028                                 ; $179AA7 |
  LDA #$0007                                ; $179AAA |
  STA $602A                                 ; $179AAD |
  LDA #$0009                                ; $179AB0 |
  STA $602C                                 ; $179AB3 |
  LDX #$09                                  ; $179AB6 |
  LDA #$EB9E                                ; $179AB8 |
  JSL r_gsu_init_1                          ; $179ABB | GSU init
  REP #$10                                  ; $179ABF |
  LDA $1106                                 ; $179AC1 |
  AND #$0001                                ; $179AC4 |
  ASL A                                     ; $179AC7 |
  TAY                                       ; $179AC8 |
  LDA $94BA,y                               ; $179AC9 |
  TAY                                       ; $179ACC |
  LDX #$2800                                ; $179ACD |
  LDA #$0070                                ; $179AD0 |
  STA $01                                   ; $179AD3 |
  LDA #$0400                                ; $179AD5 |
  JSL $00BEA6                               ; $179AD8 |
  LDA $1129                                 ; $179ADC |
  ASL A                                     ; $179ADF |
  TAX                                       ; $179AE0 |
  JSR ($9AEA,x)                             ; $179AE1 |
  SEP #$30                                  ; $179AE4 |
  INC $1130                                 ; $179AE6 |
  RTS                                       ; $179AE9 |

  dw $9B21                                  ; $179AEA |
  dw $9B30                                  ; $179AEC |
  dw $9B4F                                  ; $179AEE |

  dw $9AF6                                  ; $179AF0 |
  dw $9B04                                  ; $179AF2 |
  dw $9B12                                  ; $179AF4 |

  db $FF, $13, $04, $AF, $B2, $B5, $AE, $D0 ; $179AF6 |
  db $B6, $AE, $B7, $BE, $FF, $FF           ; $179AFE |

  db $FF, $13, $04, $AC, $B8, $B9, $C2, $D0 ; $179B04 |
  db $B6, $AE, $B7, $BE, $FF, $FF           ; $179B0C |

  db $FF, $10, $04, $AE, $BB, $AA, $BC, $AE ; $179B12 |
  db $D0, $B6, $AE, $B7, $BE, $FF, $FF      ; $179B1A |

  LDA #$0000                                ; $179B21 |
  STA $1132                                 ; $179B24 |
  RTS                                       ; $179B27 |

  dw $0004, $0002, $0002, $000A             ; $179B28 |

CODE_179B30:
  LDX #$0000                                ; $179B30 |
  LDA $1123                                 ; $179B33 |
  BEQ CODE_179B3A                           ; $179B36 |
  INX                                       ; $179B38 |
  INX                                       ; $179B39 |

CODE_179B3A:
  LDA $1125                                 ; $179B3A |
  BEQ CODE_179B41                           ; $179B3D |
  INX                                       ; $179B3F |
  INX                                       ; $179B40 |

CODE_179B41:
  LDA $1127                                 ; $179B41 |
  BEQ CODE_179B48                           ; $179B44 |
  INX                                       ; $179B46 |
  INX                                       ; $179B47 |

CODE_179B48:
  LDA $9B28,x                               ; $179B48 |
  STA $1132                                 ; $179B4B |
  RTS                                       ; $179B4E |

CODE_179B4F:
  LDA #$000C                                ; $179B4F |
  STA $1132                                 ; $179B52 |
  LDA $1123                                 ; $179B55 |
  ORA $1125                                 ; $179B58 |
  ORA $1127                                 ; $179B5B |
  BNE CODE_179B66                           ; $179B5E |
  INC $1132                                 ; $179B60 |
  INC $1132                                 ; $179B63 |

CODE_179B66:
  RTS                                       ; $179B66 |

  JSR CODE_179B6E                           ; $179B67 |
  INC $1130                                 ; $179B6A |
  RTS                                       ; $179B6D |

CODE_179B6E:
  LDA #$17                                  ; $179B6E |
  STA $6022                                 ; $179B70 |
  REP #$20                                  ; $179B73 |
  LDX $1132                                 ; $179B75 |
  LDA $9BB7,x                               ; $179B78 |
  STA $6020                                 ; $179B7B |
  LDA #$000C                                ; $179B7E |
  STA $6024                                 ; $179B81 |
  LDA #$0008                                ; $179B84 |
  STA $6026                                 ; $179B87 |
  LDX #$09                                  ; $179B8A |
  LDA #$EC41                                ; $179B8C |
  JSL r_gsu_init_1                          ; $179B8F | GSU init
  REP #$10                                  ; $179B93 |
  LDA $1106                                 ; $179B95 |
  AND #$0001                                ; $179B98 |
  ASL A                                     ; $179B9B |
  TAY                                       ; $179B9C |
  LDA $94BA,y                               ; $179B9D |
  CLC                                       ; $179BA0 |
  ADC #$0200                                ; $179BA1 |
  TAY                                       ; $179BA4 |
  LDX #$2C00                                ; $179BA5 |
  LDA #$0070                                ; $179BA8 |
  STA $01                                   ; $179BAB |
  LDA #$0800                                ; $179BAD |
  JSL $00BEA6                               ; $179BB0 |
  SEP #$30                                  ; $179BB4 |
  RTS                                       ; $179BB6 |

  dw $9BCF                                  ; $179BB7 |
  dw $9BE4                                  ; $179BB9 |
  dw $9BF9                                  ; $179BBB |
  dw $9C0B                                  ; $179BBD |
  dw $9C21                                  ; $179BBF |
  dw $9C37                                  ; $179BC1 |
  dw $9C4A                                  ; $179BC3 |
  dw $9BF9                                  ; $179BC5 |
  dw $9C60                                  ; $179BC7 |
  dw $9C75                                  ; $179BC9 |
  dw $9C8B                                  ; $179BCB |
  dw $9CA1                                  ; $179BCD |

; gsu tables
  db $FF, $0D, $12, $B9, $B5, $AA, $C2, $D0 ; $179BCF |
  db $C0, $B1, $B2, $AC, $B1, $D0, $AF, $B2 ; $179BD7 |
  db $B5, $AE, $C6, $FF, $FF                ; $179BDF |

  db $FF, $0D, $12, $AC, $B8, $B9, $C2, $D0 ; $179BE4 |
  db $C0, $B1, $B2, $AC, $B1, $D0, $AF, $B2 ; $179BEC |
  db $B5, $AE, $C6, $FF, $FF                ; $179BF4 |

  db $FF, $18, $12, $B7, $B8, $D0, $BC, $AA ; $179BF9 |
  db $BF, $AE, $AD, $D0, $AF, $B2, $B5, $AE ; $179C01 |
  db $FF, $FF                               ; $179C09 |

  db $FF, $02, $12, $AC, $B8, $B9, $C2, $B2 ; $179C0B |
  db $B7, $B0, $D0, $AC, $B8, $B6, $B9, $B5 ; $179C13 |
  db $AE, $BD, $AE, $AD, $FF, $FF           ; $179C1B |

  db $FF, $09, $12, $AC, $B8, $B9, $C2, $D0 ; $179C21 |
  db $B2, $BD, $D0, $BD, $B8, $D0, $C0, $B1 ; $179C29 |
  db $AE, $BB, $AE, $C6, $FF, $FF           ; $179C31 |

  db $FF, $0A, $12, $B7, $B8, $D0, $AE, $B6 ; $179C37 |
  db $B9, $BD, $C2, $D0, $AF, $B2, $B5, $AE ; $179C3F |
  db $C6, $FF, $FF                          ; $179C47 |

  db $FF, $0A, $12, $AE, $BB, $AA, $BC, $AE ; $179C4A |
  db $D0, $C0, $B1, $B2, $AC, $B1, $D0, $AF ; $179C52 |
  db $B2, $B5, $AE, $C6, $FF, $FF           ; $179C5A |

  db $FF, $0C, $12, $BC, $BE, $BB, $AE, $C6 ; $179C60 |
  db $D0, $D0, $D0, $C2, $AE, $BC, $D0, $D0 ; $179C68 |
  db $D0, $B7, $B8, $FF, $FF                ; $179C70 |

  db $FF, $09, $12, $AF, $B2, $B5, $AE, $D0 ; $179C75 |
  db $A1, $D0, $C0, $AA, $BC, $D0, $AE, $BB ; $179C7D |
  db $AA, $BC, $AE, $AD, $FF, $FF           ; $179C85 |

  db $FF, $09, $12, $AF, $B2, $B5, $AE, $D0 ; $179C8B |
  db $A2, $D0, $C0, $AA, $BC, $D0, $AE, $BB ; $179C93 |
  db $AA, $BC, $AE, $AD, $FF, $FF           ; $179C9B |

  db $FF, $09, $12, $AF, $B2, $B5, $AE, $D0 ; $179CA1 |
  db $A3, $D0, $C0, $AA, $BC, $D0, $AE, $BB ; $179CA9 |
  db $AA, $BC, $AE, $AD, $FF, $FF           ; $179CB1 |

  REP #$20                                  ; $179CB7 |
  PHB                                       ; $179CB9 |
  LDX #$7E                                  ; $179CBA |
  PHX                                       ; $179CBC |
  PLB                                       ; $179CBD |
  LDX #$00                                  ; $179CBE |
  LDA #$00FF                                ; $179CC0 |

CODE_179CC3:
  STA $55C0,x                               ; $179CC3 |
  DEX                                       ; $179CC6 |
  DEX                                       ; $179CC7 |
  BNE CODE_179CC3                           ; $179CC8 |
  PLB                                       ; $179CCA |
  SEP #$20                                  ; $179CCB |
  LDA #$13                                  ; $179CCD |
  STA !r_reg_tmw_mirror                     ; $179CCF |
  LDA #$02                                  ; $179CD2 |
  STA !r_reg_wobjsel_mirror                 ; $179CD4 |
  STZ $1107                                 ; $179CD7 |
  INC $1130                                 ; $179CDA |
  RTS                                       ; $179CDD |

  REP #$20                                  ; $179CDE |
  LDA $1107                                 ; $179CE0 |
  AND #$00FF                                ; $179CE3 |
  ASL A                                     ; $179CE6 |
  ASL A                                     ; $179CE7 |
  ASL A                                     ; $179CE8 |
  TAX                                       ; $179CE9 |
  LDA #$FF00                                ; $179CEA |
  STA $7E55C0,x                             ; $179CED |
  STA $7E55C2,x                             ; $179CF1 |
  STA $7E55C4,x                             ; $179CF5 |
  STA $7E55C6,x                             ; $179CF9 |
  SEP #$20                                  ; $179CFD |
  INC $1107                                 ; $179CFF |
  LDA $1107                                 ; $179D02 |
  CMP #$15                                  ; $179D05 |
  BCC CODE_179D44                           ; $179D07 |
  REP #$30                                  ; $179D09 |
  LDA $1106                                 ; $179D0B |
  AND #$0001                                ; $179D0E |
  ASL A                                     ; $179D11 |
  TAY                                       ; $179D12 |
  LDA #$0000                                ; $179D13 |
  STA $01                                   ; $179D16 |
  LDA $995C,y                               ; $179D18 |
  TAX                                       ; $179D1B |
  LDY #$3020                                ; $179D1C |
  LDA #$0300                                ; $179D1F |
  JSL $00BEA6                               ; $179D22 |
  SEP #$30                                  ; $179D26 |
  STZ !r_reg_tmw_mirror                     ; $179D28 |
  STZ !r_reg_wobjsel_mirror                 ; $179D2B |
  STZ $1130                                 ; $179D2E |
  STZ $112B                                 ; $179D31 |
  LDA $96F6                                 ; $179D34 |
  STA $110A                                 ; $179D37 |
  LDA $1129                                 ; $179D3A |
  ASL A                                     ; $179D3D |
  TAX                                       ; $179D3E |
  LDA #$03                                  ; $179D3F |
  STA $1117,x                               ; $179D41 |

CODE_179D44:
  RTS                                       ; $179D44 |

  LDA $1129                                 ; $179D45 |
  ASL A                                     ; $179D48 |
  TAX                                       ; $179D49 |
  INC $1117,x                               ; $179D4A |
  REP #$20                                  ; $179D4D |
  LDA #$0100                                ; $179D4F |
  STA $1110                                 ; $179D52 |
  SEP #$20                                  ; $179D55 |
  INC $112C                                 ; $179D57 |
  REP #$20                                  ; $179D5A |
  LDA $1110                                 ; $179D5C |
  CLC                                       ; $179D5F |
  ADC #$0004                                ; $179D60 |
  STA $1110                                 ; $179D63 |
  SEP #$20                                  ; $179D66 |
  LDA $1110                                 ; $179D68 |
  CMP #$50                                  ; $179D6B |
  BCC CODE_179D7A                           ; $179D6D |
  LDA $1129                                 ; $179D6F |
  ASL A                                     ; $179D72 |
  TAX                                       ; $179D73 |
  INC $1117,x                               ; $179D74 |
  STZ $1122                                 ; $179D77 |

CODE_179D7A:
  LDA $111D                                 ; $179D7A |
  ASL A                                     ; $179D7D |
  TAX                                       ; $179D7E |
  LDA $1123,x                               ; $179D7F |
  CLC                                       ; $179D82 |
  ADC #$54                                  ; $179D83 |
  REP #$20                                  ; $179D85 |
  AND #$00FF                                ; $179D87 |
  STA !gsu_r3                               ; $179D8A |
  LDA #$0015                                ; $179D8D |
  STA !gsu_r1                               ; $179D90 |
  LDA $1110                                 ; $179D93 |
  STA !gsu_r6                               ; $179D96 |
  LDX #$08                                  ; $179D99 |
  LDA #$DBDE                                ; $179D9B |
  JSL r_gsu_init_1                          ; $179D9E | GSU init

CODE_179DA2:
  REP #$10                                  ; $179DA2 |
  LDY #$7CC0                                ; $179DA4 |
  LDA #$0070                                ; $179DA7 |
  STA $01                                   ; $179DAA |
  LDX #$2800                                ; $179DAC |
  LDA #$0080                                ; $179DAF |
  JSL $00BEA6                               ; $179DB2 |
  LDY #$7DC0                                ; $179DB6 |
  LDX #$2A00                                ; $179DB9 |
  LDA #$0080                                ; $179DBC |
  JSL $00BEA6                               ; $179DBF |
  LDY #$7EC0                                ; $179DC3 |
  LDX #$2C00                                ; $179DC6 |
  LDA #$0080                                ; $179DC9 |
  JSL $00BEA6                               ; $179DCC |
  LDY #$7FC0                                ; $179DD0 |
  LDX #$2E00                                ; $179DD3 |
  LDA #$0080                                ; $179DD6 |
  JSL $00BEA6                               ; $179DD9 |
  SEP #$30                                  ; $179DDD |
  RTS                                       ; $179DDF |

  REP #$20                                  ; $179DE0 |
  LDA #$0C50                                ; $179DE2 |
  LDY $1106                                 ; $179DE5 |
  BNE CODE_179DEE                           ; $179DE8 |
  CLC                                       ; $179DEA |
  ADC #$0380                                ; $179DEB |

CODE_179DEE:
  STA $00                                   ; $179DEE |
  CLC                                       ; $179DF0 |
  ADC #$0040                                ; $179DF1 |
  STA $02                                   ; $179DF4 |
  REP #$10                                  ; $179DF6 |
  LDA $1129                                 ; $179DF8 |
  ASL A                                     ; $179DFB |
  TAX                                       ; $179DFC |
  LDA $1122                                 ; $179DFD |
  AND #$00FF                                ; $179E00 |
  ASL A                                     ; $179E03 |
  TAY                                       ; $179E04 |
  LDA #$218E                                ; $179E05 |
  ORA $93C3,x                               ; $179E08 |
  STA ($00),y                               ; $179E0B |
  STA ($02),y                               ; $179E0D |
  JSR CODE_17998B                           ; $179E0F |
  SEP #$30                                  ; $179E12 |
  INC $1122                                 ; $179E14 |
  LDA $1122                                 ; $179E17 |
  CMP #$11                                  ; $179E1A |
  BCC CODE_179E26                           ; $179E1C |
  LDA $1129                                 ; $179E1E |
  ASL A                                     ; $179E21 |
  TAX                                       ; $179E22 |
  INC $1117,x                               ; $179E23 |

CODE_179E26:
  RTS                                       ; $179E26 |

  dw $9E42                                  ; $179E27 |
  dw $9E5D                                  ; $179E29 |

  LDA $1129                                 ; $179E2B |
  ASL A                                     ; $179E2E |
  TAX                                       ; $179E2F |
  JSR ($9E25,x)                             ; $179E30 |
  JSR CODE_179B6E                           ; $179E33 |
  LDA $1129                                 ; $179E36 |
  ASL A                                     ; $179E39 |
  TAX                                       ; $179E3A |
  INC $1117,x                               ; $179E3B |
  STZ $1122                                 ; $179E3E |
  RTS                                       ; $179E41 |

  LDA #$08                                  ; $179E42 |
  STA $1132                                 ; $179E44 |
  LDA $1123                                 ; $179E47 |
  BEQ CODE_179E5C                           ; $179E4A |
  LDA $1125                                 ; $179E4C |
  BEQ CODE_179E5C                           ; $179E4F |
  LDA $1127                                 ; $179E51 |
  BEQ CODE_179E5C                           ; $179E54 |
  INC $1132                                 ; $179E56 |
  INC $1132                                 ; $179E59 |

CODE_179E5C:
  RTS                                       ; $179E5C |

  LDA #$10                                  ; $179E5D |
  STA $1132                                 ; $179E5F |
  RTS                                       ; $179E62 |

  REP #$20                                  ; $179E63 |
  LDA #$0C50                                ; $179E65 |
  LDY $1106                                 ; $179E68 |
  BNE CODE_179E71                           ; $179E6B |
  CLC                                       ; $179E6D |
  ADC #$0380                                ; $179E6E |

CODE_179E71:
  STA $00                                   ; $179E71 |
  CLC                                       ; $179E73 |
  ADC #$0040                                ; $179E74 |
  STA $02                                   ; $179E77 |
  LDA $1106                                 ; $179E79 |
  EOR #$0001                                ; $179E7C |
  AND #$0001                                ; $179E7F |
  XBA                                       ; $179E82 |
  LSR A                                     ; $179E83 |
  STA $0E                                   ; $179E84 |
  LDA $1129                                 ; $179E86 |
  ASL A                                     ; $179E89 |
  TAX                                       ; $179E8A |
  LDA $1122                                 ; $179E8B |
  AND #$00FF                                ; $179E8E |
  PHA                                       ; $179E91 |
  ASL A                                     ; $179E92 |
  TAY                                       ; $179E93 |
  PLA                                       ; $179E94 |
  ADC #$2220                                ; $179E95 |
  ORA $93C3,x                               ; $179E98 |
  ORA $0E                                   ; $179E9B |
  STA ($00),y                               ; $179E9D |
  ORA #$0010                                ; $179E9F |
  STA ($02),y                               ; $179EA2 |
  REP #$10                                  ; $179EA4 |
  JSR CODE_17998B                           ; $179EA6 |
  SEP #$30                                  ; $179EA9 |
  INC $1122                                 ; $179EAB |
  LDA $1122                                 ; $179EAE |
  CMP #$10                                  ; $179EB1 |
  BCC CODE_179EBD                           ; $179EB3 |
  LDA $1129                                 ; $179EB5 |
  ASL A                                     ; $179EB8 |
  TAX                                       ; $179EB9 |
  INC $1117,x                               ; $179EBA |

CODE_179EBD:
  RTS                                       ; $179EBD |

  LDA $38                                   ; $179EBE |
  AND #$03                                  ; $179EC0 |
  BEQ CODE_179F02                           ; $179EC2 |
  TAY                                       ; $179EC4 |
  LDA $111D                                 ; $179EC5 |
  CLC                                       ; $179EC8 |
  ADC $95F2,y                               ; $179EC9 |
  BMI CODE_179F00                           ; $179ECC |
  CMP #$03                                  ; $179ECE |
  BCS CODE_179F00                           ; $179ED0 |
  ASL A                                     ; $179ED2 |
  TAX                                       ; $179ED3 |

CODE_179ED4:
  LDA $1123,x                               ; $179ED4 |
  BEQ CODE_179EF2                           ; $179ED7 |
  TXA                                       ; $179ED9 |
  LSR A                                     ; $179EDA |
  CMP $1134                                 ; $179EDB |
  BEQ CODE_179EF2                           ; $179EDE |
  TXA                                       ; $179EE0 |
  CLC                                       ; $179EE1 |
  ADC $95F2,y                               ; $179EE2 |
  CLC                                       ; $179EE5 |
  ADC $95F2,y                               ; $179EE6 |
  TAX                                       ; $179EE9 |
  BMI CODE_179F00                           ; $179EEA |
  CMP #$06                                  ; $179EEC |
  BCS CODE_179F00                           ; $179EEE |
  BRA CODE_179ED4                           ; $179EF0 |

CODE_179EF2:
  TXA                                       ; $179EF2 |
  LSR A                                     ; $179EF3 |
  STA $111D                                 ; $179EF4 |
  LDA #$57                                  ; $179EF7 |
  STA $53                                   ; $179EF9 |
  INC $1119                                 ; $179EFB |
  BRA CODE_179F21                           ; $179EFE |

CODE_179F00:
  BRA CODE_179F21                           ; $179F00 |

CODE_179F02:
  LDA $36                                   ; $179F02 |
  ORA $35                                   ; $179F04 |
  AND #$D0                                  ; $179F06 |
  BEQ CODE_179F21                           ; $179F08 |
  STZ $1122                                 ; $179F0A |
  LDA $111D                                 ; $179F0D |
  CMP $1134                                 ; $179F10 |
  BEQ CODE_179F1C                           ; $179F13 |
  LDA #$10                                  ; $179F15 |
  STA $1119                                 ; $179F17 |
  BRA CODE_179F21                           ; $179F1A |

CODE_179F1C:
  LDA #$0B                                  ; $179F1C |
  STA $1119                                 ; $179F1E |

CODE_179F21:
  RTS                                       ; $179F21 |

  LDA $1110                                 ; $179F22 |
  SEC                                       ; $179F25 |
  SBC #$04                                  ; $179F26 |
  STA $1110                                 ; $179F28 |
  BNE CODE_179F35                           ; $179F2B |
  LDA $1129                                 ; $179F2D |
  ASL A                                     ; $179F30 |
  TAX                                       ; $179F31 |
  INC $1117,x                               ; $179F32 |

CODE_179F35:
  JSR CODE_179D7A                           ; $179F35 |
  RTS                                       ; $179F38 |

  db $02, $0C                               ; $179F39 |

  LDX $1129                                 ; $179F3B |
  LDA $9F38,x                               ; $179F3E |
  STA $1132                                 ; $179F41 |
  JSR CODE_179B6E                           ; $179F44 |
  LDA $1129                                 ; $179F47 |
  ASL A                                     ; $179F4A |
  TAX                                       ; $179F4B |
  INC $1117,x                               ; $179F4C |
  STZ $1122                                 ; $179F4F |
  RTS                                       ; $179F52 |

  LDA $1129                                 ; $179F53 |
  ASL A                                     ; $179F56 |
  TAX                                       ; $179F57 |
  LDA #$01                                  ; $179F58 |
  STA $1117,x                               ; $179F5A |
  RTS                                       ; $179F5D |

  REP #$20                                  ; $179F5E |
  LDA $1129                                 ; $179F60 |
  ASL A                                     ; $179F63 |
  TAX                                       ; $179F64 |
  LDA $111D                                 ; $179F65 |
  AND #$0007                                ; $179F68 |
  ASL A                                     ; $179F6B |
  TAY                                       ; $179F6C |
  LDA $93CB,y                               ; $179F6D |
  JSR CODE_179960                           ; $179F70 |
  LDA #$0100                                ; $179F73 |
  STA $1110                                 ; $179F76 |
  SEP #$20                                  ; $179F79 |
  INC $1119                                 ; $179F7B |
  LDA $111D                                 ; $179F7E |
  ASL A                                     ; $179F81 |
  TAX                                       ; $179F82 |
  LDA $1123,x                               ; $179F83 |
  CLC                                       ; $179F86 |
  ADC #$54                                  ; $179F87 |
  JSR CODE_1799AB                           ; $179F89 |
  REP #$20                                  ; $179F8C |
  LDA $1110                                 ; $179F8E |
  SEC                                       ; $179F91 |
  SBC #$0008                                ; $179F92 |
  STA $1110                                 ; $179F95 |
  SEP #$20                                  ; $179F98 |
  LDA $1110                                 ; $179F9A |
  CMP #$20                                  ; $179F9D |
  BCS CODE_179FA4                           ; $179F9F |
  INC $1119                                 ; $179FA1 |

CODE_179FA4:
  JSR CODE_17A390                           ; $179FA4 |
  RTS                                       ; $179FA7 |

  JSL $10832C                               ; $179FA8 |
  LDA $1134                                 ; $179FAC |
  ASL A                                     ; $179FAF |
  TAX                                       ; $179FB0 |
  LDA $111D                                 ; $179FB1 |
  ASL A                                     ; $179FB4 |
  TAY                                       ; $179FB5 |
  LDA $1123,x                               ; $179FB6 |
  STA $1123,y                               ; $179FB9 |
  INC $1119                                 ; $179FBC |
  LDA $111D                                 ; $179FBF |
  ASL A                                     ; $179FC2 |
  TAX                                       ; $179FC3 |
  LDA $1123,x                               ; $179FC4 |
  CLC                                       ; $179FC7 |
  ADC #$54                                  ; $179FC8 |
  JSR CODE_1799AB                           ; $179FCA |
  REP #$20                                  ; $179FCD |
  LDA $1110                                 ; $179FCF |
  CLC                                       ; $179FD2 |
  ADC #$0008                                ; $179FD3 |
  STA $1110                                 ; $179FD6 |
  SEP #$20                                  ; $179FD9 |
  LDA $1111                                 ; $179FDB |
  BEQ CODE_179FE3                           ; $179FDE |
  INC $1119                                 ; $179FE0 |

CODE_179FE3:
  JSR CODE_17A390                           ; $179FE3 |
  RTS                                       ; $179FE6 |

  JSR CODE_17A003                           ; $179FE7 |
  JSR CODE_17A390                           ; $179FEA |
  REP #$20                                  ; $179FED |
  LDA #$0150                                ; $179FEF |
  STA $1110                                 ; $179FF2 |
  SEP #$20                                  ; $179FF5 |
  LDA #$06                                  ; $179FF7 |
  STA $1132                                 ; $179FF9 |
  JSR CODE_179B6E                           ; $179FFC |
  INC $1119                                 ; $179FFF |
  RTS                                       ; $17A002 |

CODE_17A003:
  LDA $111D                                 ; $17A003 |
  ASL A                                     ; $17A006 |
  TAX                                       ; $17A007 |
  LDA $1123,x                               ; $17A008 |
  ASL A                                     ; $17A00B |
  TAY                                       ; $17A00C |
  REP #$20                                  ; $17A00D |
  LDA $93E1,y                               ; $17A00F |
  ORA $93F9,y                               ; $17A012 |
  STA $00                                   ; $17A015 |
  LDA $93CB,x                               ; $17A017 |
  LDY $1106                                 ; $17A01A |
  BNE CODE_17A023                           ; $17A01D |
  CLC                                       ; $17A01F |
  ADC #$0380                                ; $17A020 |

CODE_17A023:
  STA $0A                                   ; $17A023 |
  CLC                                       ; $17A025 |
  ADC #$0040                                ; $17A026 |
  STA $0C                                   ; $17A029 |
  CLC                                       ; $17A02B |
  ADC #$0040                                ; $17A02C |
  STA $0E                                   ; $17A02F |
  JSR CODE_179407                           ; $17A031 |
  JSR CODE_17998B                           ; $17A034 |
  SEP #$20                                  ; $17A037 |
  RTS                                       ; $17A039 |

  JSR CODE_179D7A                           ; $17A03A |
  REP #$20                                  ; $17A03D |
  LDA $1110                                 ; $17A03F |
  SEC                                       ; $17A042 |
  SBC #$0004                                ; $17A043 |
  STA $1110                                 ; $17A046 |
  SEP #$20                                  ; $17A049 |
  LDA $1110                                 ; $17A04B |
  BNE CODE_17A066                           ; $17A04E |
  LDA $1129                                 ; $17A050 |
  ASL A                                     ; $17A053 |
  TAX                                       ; $17A054 |
  INC $1117,x                               ; $17A055 |
  CPX #$02                                  ; $17A058 |
  BNE CODE_17A060                           ; $17A05A |
  LDA #$32                                  ; $17A05C |
  STA $53                                   ; $17A05E |

CODE_17A060:
  STZ $1122                                 ; $17A060 |
  STZ $1110                                 ; $17A063 |

CODE_17A066:
  RTS                                       ; $17A066 |

  db $20, $40                               ; $17A067 |

  INC $1110                                 ; $17A069 |
  LDA $1129                                 ; $17A06C |
  TAY                                       ; $17A06F |
  ASL A                                     ; $17A070 |
  TAX                                       ; $17A071 |
  LDA $1110                                 ; $17A072 |
  CMP $A066,y                               ; $17A075 |
  BCC CODE_17A08A                           ; $17A078 |
  INC $1117,x                               ; $17A07A |

CODE_17A07D:
  STZ $1122                                 ; $17A07D |
  REP #$20                                  ; $17A080 |
  LDA #$32C4                                ; $17A082 |
  STA $1109                                 ; $17A085 |
  SEP #$20                                  ; $17A088 |

CODE_17A08A:
  RTS                                       ; $17A08A |

  REP #$30                                  ; $17A08B |
  JSR CODE_179B30                           ; $17A08D |
  SEP #$30                                  ; $17A090 |
  JSR CODE_179B6E                           ; $17A092 |
  STZ $1122                                 ; $17A095 |
  INC $1119                                 ; $17A098 |
  RTS                                       ; $17A09B |

  LDA $1129                                 ; $17A09C |
  ASL A                                     ; $17A09F |
  TAX                                       ; $17A0A0 |
  LDA #$03                                  ; $17A0A1 |
  STA $1117,x                               ; $17A0A3 |
  RTS                                       ; $17A0A6 |

  LDA #$17                                  ; $17A0A7 |
  STA $6022                                 ; $17A0A9 |
  REP #$20                                  ; $17A0AC |
  LDA #$A0F6                                ; $17A0AE |
  STA $6020                                 ; $17A0B1 |
  LDA #$000C                                ; $17A0B4 |
  STA $6024                                 ; $17A0B7 |
  LDA #$0008                                ; $17A0BA |
  STA $6026                                 ; $17A0BD |
  LDX #$09                                  ; $17A0C0 |
  LDA #$EC41                                ; $17A0C2 |
  JSL r_gsu_init_1                          ; $17A0C5 | GSU init
  REP #$10                                  ; $17A0C9 |
  LDY #$7E00                                ; $17A0CB |
  LDA #$0070                                ; $17A0CE |
  STA $01                                   ; $17A0D1 |
  LDX #$2C00                                ; $17A0D3 |
  LDA #$0100                                ; $17A0D6 |
  JSL $00BEA6                               ; $17A0D9 |
  LDY #$7F00                                ; $17A0DD |
  LDX #$2E00                                ; $17A0E0 |
  LDA #$0100                                ; $17A0E3 |
  JSL $00BEA6                               ; $17A0E6 |
  SEP #$30                                  ; $17A0EA |
  STZ $1136                                 ; $17A0EC |
  JSR CODE_17A378                           ; $17A0EF |
  INC $111B                                 ; $17A0F2 |
  RTS                                       ; $17A0F5 |

  db $FF, $00, $12, $28, $01, $FF, $20, $12 ; $17A0F6 |
  db $01, $01, $03, $FF, $FF                ; $17A0FE |

  db $0B, $10                               ; $17A103 |

  LDA $38                                   ; $17A105 |
  AND #$03                                  ; $17A107 |
  BEQ CODE_17A124                           ; $17A109 |
  EOR #$03                                  ; $17A10B |
  TAY                                       ; $17A10D |
  LDA $1136                                 ; $17A10E |
  CLC                                       ; $17A111 |
  ADC $95F2,y                               ; $17A112 |
  BMI CODE_17A14B                           ; $17A115 |
  CMP #$02                                  ; $17A117 |
  BCS CODE_17A14B                           ; $17A119 |
  STA $1136                                 ; $17A11B |
  LDA #$57                                  ; $17A11E |
  STA $53                                   ; $17A120 |
  BRA CODE_17A14B                           ; $17A122 |

CODE_17A124:
  LDA $36                                   ; $17A124 |
  ORA $35                                   ; $17A126 |
  AND #$D0                                  ; $17A128 |
  BEQ CODE_17A14B                           ; $17A12A |
  LDX $1136                                 ; $17A12C |
  LDA $A103,x                               ; $17A12F |
  STA $111B                                 ; $17A132 |
  REP #$20                                  ; $17A135 |
  LDA #$0150                                ; $17A137 |
  STA $1110                                 ; $17A13A |
  SEP #$20                                  ; $17A13D |
  STZ $1122                                 ; $17A13F |
  TXA                                       ; $17A142 |
  BEQ CODE_17A14B                           ; $17A143 |
  LDA #$09                                  ; $17A145 |
  STA $53                                   ; $17A147 |
  BRA CODE_17A14B                           ; $17A149 |

CODE_17A14B:
  JSR CODE_17A378                           ; $17A14B |
  RTS                                       ; $17A14E |

  STZ $1137                                 ; $17A14F |
  STZ $1138                                 ; $17A152 |
  LDA #$54                                  ; $17A155 |
  JSR CODE_1799AB                           ; $17A157 |
  INC $111B                                 ; $17A15A |
  RTS                                       ; $17A15D |

  LDA $111D                                 ; $17A15E |
  ASL A                                     ; $17A161 |
  TAX                                       ; $17A162 |
  LDA $1123,x                               ; $17A163 |
  CLC                                       ; $17A166 |
  ADC #$54                                  ; $17A167 |
  REP #$20                                  ; $17A169 |
  AND #$00FF                                ; $17A16B |
  STA !gsu_r3                               ; $17A16E |
  LDA #$0015                                ; $17A171 |
  STA !gsu_r1                               ; $17A174 |
  LDA $1110                                 ; $17A177 |
  STA !gsu_r6                               ; $17A17A |
  LDX #$08                                  ; $17A17D |
  LDA #$DBDE                                ; $17A17F |
  JSL r_gsu_init_1                          ; $17A182 | GSU init
  SEP #$20                                  ; $17A186 |
  LDA $111D                                 ; $17A188 |
  ASL A                                     ; $17A18B |
  TAX                                       ; $17A18C |
  LDA $1123,x                               ; $17A18D |
  PHA                                       ; $17A190 |
  PHX                                       ; $17A191 |
  LDA #$00                                  ; $17A192 |
  STA $1123,x                               ; $17A194 |
  JSR CODE_17A003                           ; $17A197 |
  PLX                                       ; $17A19A |
  PLA                                       ; $17A19B |
  STA $1123,x                               ; $17A19C |
  STZ $1122                                 ; $17A19F |
  STZ $1137                                 ; $17A1A2 |
  STZ $1138                                 ; $17A1A5 |
  INC $111B                                 ; $17A1A8 |
  RTS                                       ; $17A1AB |

  dw $01FF, $FF01                           ; $17A1AC |

  JSR CODE_17A1FE                           ; $17A1B0 |
  JSR CODE_17A1FE                           ; $17A1B3 |
  REP #$20                                  ; $17A1B6 |
  JSR CODE_179DA2                           ; $17A1B8 |
  SEP #$20                                  ; $17A1BB |
  LDA $1122                                 ; $17A1BD |
  CMP #$0B                                  ; $17A1C0 |
  BCC CODE_17A1D6                           ; $17A1C2 |
  INC $111B                                 ; $17A1C4 |
  STZ $1122                                 ; $17A1C7 |
  REP #$20                                  ; $17A1CA |
  LDA #$1F1F                                ; $17A1CC |
  STA $1137                                 ; $17A1CF |
  SEP #$20                                  ; $17A1D2 |
  BRA CODE_17A1DA                           ; $17A1D4 |

CODE_17A1D6:
  LDA #$5A                                  ; $17A1D6 |
  STA $53                                   ; $17A1D8 |

CODE_17A1DA:
  REP #$20                                  ; $17A1DA |
  LDA $111D                                 ; $17A1DC |
  AND #$00FF                                ; $17A1DF |
  ASL A                                     ; $17A1E2 |
  TAX                                       ; $17A1E3 |
  LDA $A3DC,x                               ; $17A1E4 |
  AND #$FFF8                                ; $17A1E7 |
  CLC                                       ; $17A1EA |
  ADC #$0100                                ; $17A1EB |
  CLC                                       ; $17A1EE |
  ADC $1137                                 ; $17A1EF |
  STA $1109                                 ; $17A1F2 |
  SEP #$20                                  ; $17A1F5 |
  JSR CODE_17A356                           ; $17A1F7 |
  JSR CODE_17A409                           ; $17A1FA |
  RTS                                       ; $17A1FD |

CODE_17A1FE:
  REP #$20                                  ; $17A1FE |
  LDA #$0015                                ; $17A200 |
  STA !gsu_r0                               ; $17A203 |
  LDA $1137                                 ; $17A206 |
  AND #$00FF                                ; $17A209 |
  STA !gsu_r3                               ; $17A20C |
  LDA $1138                                 ; $17A20F |
  AND #$00FF                                ; $17A212 |
  STA !gsu_r4                               ; $17A215 |
  LDX #$08                                  ; $17A218 |
  LDA #$E0C1                                ; $17A21A |
  JSL r_gsu_init_1                          ; $17A21D | GSU init
  SEP #$20                                  ; $17A221 |
  LDA $1122                                 ; $17A223 |
  AND #$01                                  ; $17A226 |
  TAX                                       ; $17A228 |
  LDA $1137                                 ; $17A229 |
  CLC                                       ; $17A22C |
  ADC $A1AC,x                               ; $17A22D |
  BPL CODE_17A23F                           ; $17A230 |
  SEC                                       ; $17A232 |
  SBC $A1AC,x                               ; $17A233 |
  INC $1138                                 ; $17A236 |
  INC $1138                                 ; $17A239 |
  INC $1122                                 ; $17A23C |

CODE_17A23F:
  STA $1137                                 ; $17A23F |
  LDA $1138                                 ; $17A242 |
  CLC                                       ; $17A245 |
  ADC $A1AE,x                               ; $17A246 |
  BPL CODE_17A258                           ; $17A249 |
  SEC                                       ; $17A24B |
  SBC $A1AE,x                               ; $17A24C |
  INC $1137                                 ; $17A24F |
  INC $1137                                 ; $17A252 |
  INC $1122                                 ; $17A255 |

CODE_17A258:
  STA $1138                                 ; $17A258 |
  RTS                                       ; $17A25B |

  JSR CODE_17A2B1                           ; $17A25C |
  JSR CODE_17A2B1                           ; $17A25F |
  REP #$20                                  ; $17A262 |
  JSR CODE_179DA2                           ; $17A264 |
  SEP #$20                                  ; $17A267 |
  LDA $1122                                 ; $17A269 |
  CMP #$0B                                  ; $17A26C |
  BCC CODE_17A289                           ; $17A26E |
  INC $111B                                 ; $17A270 |
  REP #$20                                  ; $17A273 |
  LDA #$0150                                ; $17A275 |
  STA $1110                                 ; $17A278 |
  SEP #$20                                  ; $17A27B |
  LDA $111D                                 ; $17A27D |
  ASL A                                     ; $17A280 |
  TAX                                       ; $17A281 |
  LDA #$00                                  ; $17A282 |
  STA $1123,x                               ; $17A284 |
  BRA CODE_17A28D                           ; $17A287 |

CODE_17A289:
  LDA #$5A                                  ; $17A289 |
  STA $53                                   ; $17A28B |

CODE_17A28D:
  REP #$20                                  ; $17A28D |
  LDA $111D                                 ; $17A28F |
  AND #$00FF                                ; $17A292 |
  ASL A                                     ; $17A295 |
  TAX                                       ; $17A296 |
  LDA $A3DC,x                               ; $17A297 |
  AND #$FFF8                                ; $17A29A |
  CLC                                       ; $17A29D |
  ADC #$0100                                ; $17A29E |
  CLC                                       ; $17A2A1 |
  ADC $1137                                 ; $17A2A2 |
  STA $1109                                 ; $17A2A5 |
  SEP #$20                                  ; $17A2A8 |
  JSR CODE_17A356                           ; $17A2AA |
  JSR CODE_17A409                           ; $17A2AD |
  RTS                                       ; $17A2B0 |

CODE_17A2B1:
  REP #$20                                  ; $17A2B1 |
  LDA #$0015                                ; $17A2B3 |
  STA !gsu_r0                               ; $17A2B6 |
  LDA $1137                                 ; $17A2B9 |
  AND #$00FF                                ; $17A2BC |
  STA !gsu_r3                               ; $17A2BF |
  LDA $1138                                 ; $17A2C2 |
  AND #$00FF                                ; $17A2C5 |
  STA !gsu_r4                               ; $17A2C8 |
  LDX #$08                                  ; $17A2CB |
  LDA #$E0C1                                ; $17A2CD |
  JSL r_gsu_init_1                          ; $17A2D0 | GSU init
  SEP #$20                                  ; $17A2D4 |
  LDA $1122                                 ; $17A2D6 |
  AND #$01                                  ; $17A2D9 |
  TAX                                       ; $17A2DB |
  LDA $1137                                 ; $17A2DC |
  CLC                                       ; $17A2DF |
  ADC $A1AE,x                               ; $17A2E0 |
  CMP #$20                                  ; $17A2E3 |
  BCC CODE_17A2F4                           ; $17A2E5 |
  SEC                                       ; $17A2E7 |
  SBC $A1AE,x                               ; $17A2E8 |
  DEC $1138                                 ; $17A2EB |
  DEC $1138                                 ; $17A2EE |
  INC $1122                                 ; $17A2F1 |

CODE_17A2F4:
  STA $1137                                 ; $17A2F4 |
  LDA $1138                                 ; $17A2F7 |
  CLC                                       ; $17A2FA |
  ADC $A1AC,x                               ; $17A2FB |
  CMP #$20                                  ; $17A2FE |
  BCC CODE_17A30F                           ; $17A300 |
  SEC                                       ; $17A302 |
  SBC $A1AC,x                               ; $17A303 |
  DEC $1137                                 ; $17A306 |
  DEC $1137                                 ; $17A309 |
  INC $1122                                 ; $17A30C |

CODE_17A30F:
  STA $1138                                 ; $17A30F |
  RTS                                       ; $17A312 |

  LDA $111D                                 ; $17A313 |
  ASL A                                     ; $17A316 |
  CLC                                       ; $17A317 |
  ADC #$12                                  ; $17A318 |
  STA $1132                                 ; $17A31A |
  JSR CODE_179B6E                           ; $17A31D |
  STZ $1122                                 ; $17A320 |
  STZ $1110                                 ; $17A323 |
  REP #$20                                  ; $17A326 |
  LDA $111D                                 ; $17A328 |
  AND #$000F                                ; $17A32B |
  ASL A                                     ; $17A32E |
  TAX                                       ; $17A32F |
  LDA #$0000                                ; $17A330 |
  STA $707E70,x                             ; $17A333 |
  STA $707E76,x                             ; $17A337 |
  SEP #$20                                  ; $17A33B |
  JSL $108000                               ; $17A33D |
  INC $111B                                 ; $17A341 |
  RTS                                       ; $17A344 |

  REP #$30                                  ; $17A345 |
  JSR CODE_179B4F                           ; $17A347 |
  SEP #$30                                  ; $17A34A |
  JSR CODE_179B6E                           ; $17A34C |
  STZ $1122                                 ; $17A34F |
  INC $111B                                 ; $17A352 |
  RTS                                       ; $17A355 |

CODE_17A356:
  REP #$20                                  ; $17A356 |
  LDA $1109                                 ; $17A358 |
  STA !s_oam_lo_table_mirror                ; $17A35B |

CODE_17A35E:
  LDA #$39C0                                ; $17A35E |
  STA $6A02                                 ; $17A361 |
  LDA $112C                                 ; $17A364 |
  BEQ CODE_17A371                           ; $17A367 |
  LDA $6A02                                 ; $17A369 |
  INC A                                     ; $17A36C |
  INC A                                     ; $17A36D |
  STA $6A02                                 ; $17A36E |

CODE_17A371:
  SEP #$20                                  ; $17A371 |
  RTS                                       ; $17A373 |

  dw $5C8E, $5C6D                           ; $17A374 |

CODE_17A378:
  REP #$20                                  ; $17A378 |
  LDA $1136                                 ; $17A37A |
  AND #$0001                                ; $17A37D |
  ASL A                                     ; $17A380 |
  TAX                                       ; $17A381 |
  LDA $A374,x                               ; $17A382 |
  STA !s_oam_lo_table_mirror                ; $17A385 |
  BRA CODE_17A35E                           ; $17A388 |

  dw $37C8, $37C8, $3DC8                    ; $17A38A |

CODE_17A390:
  LDA $1109                                 ; $17A390 |
  SEC                                       ; $17A393 |
  SBC #$10                                  ; $17A394 |
  STA $6A08                                 ; $17A396 |
  LDA $110A                                 ; $17A399 |
  SEC                                       ; $17A39C |
  SBC #$17                                  ; $17A39D |
  STA $6A09                                 ; $17A39F |
  REP #$20                                  ; $17A3A2 |
  LDA $111D                                 ; $17A3A4 |
  AND #$00FF                                ; $17A3A7 |
  ASL A                                     ; $17A3AA |
  TAX                                       ; $17A3AB |
  LDA $1123,x                               ; $17A3AC |
  ASL A                                     ; $17A3AF |
  TAX                                       ; $17A3B0 |
  LDA $93F9,x                               ; $17A3B1 |
  LSR A                                     ; $17A3B4 |
  ORA #$31C8                                ; $17A3B5 |
  STA $6A0A                                 ; $17A3B8 |
  LDA $1130                                 ; $17A3BB |
  AND #$00FF                                ; $17A3BE |
  BEQ CODE_17A3D1                           ; $17A3C1 |
  LDA $1129                                 ; $17A3C3 |
  AND #$0003                                ; $17A3C6 |
  ASL A                                     ; $17A3C9 |
  TAX                                       ; $17A3CA |
  LDA $A38A,x                               ; $17A3CB |
  STA $6A0A                                 ; $17A3CE |

CODE_17A3D1:
  SEP #$20                                  ; $17A3D1 |
  LDA !s_oam_hi_table_mirror                ; $17A3D3 |
  ORA #$20                                  ; $17A3D6 |
  STA !s_oam_hi_table_mirror                ; $17A3D8 |
  RTS                                       ; $17A3DB |

  dw $2334, $235C, $2384                    ; $17A3DC |

CODE_17A3E2:
  REP #$20                                  ; $17A3E2 |
  LDA $1134                                 ; $17A3E4 |
  ASL A                                     ; $17A3E7 |
  TAX                                       ; $17A3E8 |
  LDA $A3DC,x                               ; $17A3E9 |
  STA $6A04                                 ; $17A3EC |
  LDA $1123,x                               ; $17A3EF |
  ASL A                                     ; $17A3F2 |
  TAX                                       ; $17A3F3 |
  LDA $93F9,x                               ; $17A3F4 |
  LSR A                                     ; $17A3F7 |
  ORA #$31CC                                ; $17A3F8 |
  STA $6A06                                 ; $17A3FB |
  SEP #$20                                  ; $17A3FE |
  LDA !s_oam_hi_table_mirror                ; $17A400 |
  ORA #$08                                  ; $17A403 |
  STA !s_oam_hi_table_mirror                ; $17A405 |
  RTS                                       ; $17A408 |

CODE_17A409:
  REP #$20                                  ; $17A409 |
  LDA $111D                                 ; $17A40B |
  AND #$00FF                                ; $17A40E |
  ASL A                                     ; $17A411 |
  TAX                                       ; $17A412 |
  LDA $A3DC,x                               ; $17A413 |
  STA $6A08                                 ; $17A416 |
  LDA $93F9                                 ; $17A419 |
  LSR A                                     ; $17A41C |
  ORA #$31C8                                ; $17A41D |
  STA $6A0A                                 ; $17A420 |
  SEP #$20                                  ; $17A423 |
  LDA !s_oam_hi_table_mirror                ; $17A425 |
  ORA #$20                                  ; $17A428 |
  STA !s_oam_hi_table_mirror                ; $17A42A |
  RTS                                       ; $17A42D |

  dw $0709, $5B18, $6C7E, $1C1C             ; $17A42E |
  dw $0174, $0009                           ; $17A436 |

  db $03, $0D, $58, $5B, $7E                ; $17A43A |

  db $6C, $00, $00, $00, $00, $74, $00, $00 ; $17A43F |
  db $00, $00, $00                          ; $17A447 |

  db $03, $0F, $98, $5B, $7E                ; $17A44A |

  db $6C, $00, $00, $00, $00, $74, $00, $00 ; $17A44F |
  db $00, $00, $00                          ; $17A457 |

  db $08, $23, $D8, $5B, $7E                ; $17A45A |

  db $6A, $32, $76, $33, $00                ; $17A45F |

  db $09, $24, $18, $5C, $7E                ; $17A464 |

  db $30, $00, $00, $3A, $03, $02, $76, $03 ; $17A469 |
  db $03, $00                               ; $17A471 |

  db $44, $26, $58, $5C, $7E                ; $17A473 |

  db $18, $C0, $55, $D2, $C4, $55, $76, $40 ; $17A478 |
  db $57, $00                               ; $17A480 |

  db $08, $31, $98, $5C, $7E                ; $17A482 |

  db $6A, $A6, $76, $B7, $00                ; $17A487 |

  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17A48C |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17A494 |
  db $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $17A49C |
  db $FE, $FE, $FE, $FE, $FD, $FD, $FD, $FD ; $17A4A4 |
  db $FD, $FD, $FD, $FD, $FC, $FC, $FC, $FC ; $17A4AC |
  db $FC, $FC, $FC, $FB, $FB, $FB, $FB, $FB ; $17A4B4 |
  db $FA, $FA, $FA, $FA, $FA, $F9, $F9, $F9 ; $17A4BC |
  db $F9, $F9, $F8, $F8, $F8, $F8, $F7, $F7 ; $17A4C4 |
  db $F7, $F7, $F6, $F6, $F6, $F5, $F5, $F5 ; $17A4CC |
  db $F5, $F4, $F4, $F4, $F3, $F3, $F3, $F2 ; $17A4D4 |
  db $F2, $F2, $F1, $F1, $F1, $F0, $F0, $F0 ; $17A4DC |
  db $EF, $EF, $EF, $EE, $EE, $ED, $ED, $ED ; $17A4E4 |
  db $EC, $EC, $EB, $EB, $EB, $EA, $EA, $E9 ; $17A4EC |
  db $E9, $E8, $E8, $E7, $E7, $E7, $E6, $E6 ; $17A4F4 |
  db $E5, $E5, $E4, $E4, $E3, $E3, $E2, $E2 ; $17A4FC |
  db $E1, $E0, $E0, $DF, $DF, $DE, $DE, $DD ; $17A504 |
  db $DD, $DC, $DB, $DB, $DA, $DA, $D9, $D8 ; $17A50C |
  db $D8, $D7, $D6, $D6, $D5, $D4, $D4, $D3 ; $17A514 |
  db $D2, $D2, $D1, $D0, $D0, $CF, $CE, $CD ; $17A51C |
  db $CD, $CC, $CB, $CA, $CA, $C9, $C8, $C7 ; $17A524 |
  db $C7, $C6, $C5, $C4, $C3, $C2, $C2, $C1 ; $17A52C |
  db $C0, $BF, $BE, $BD, $BC, $BB, $BA, $B9 ; $17A534 |
  db $B9, $B8, $B7, $B6, $B5, $B4, $B3, $B2 ; $17A53C |
  db $B1, $AF, $AE, $AD, $AC, $AB, $AA, $A9 ; $17A544 |
  db $A8, $A7, $A5, $A4, $A3, $A2, $A1, $9F ; $17A54C |
  db $9E, $9D, $9C, $9A, $99, $98, $96, $95 ; $17A554 |
  db $94, $92, $91, $8F, $8E, $8C, $8B, $89 ; $17A55C |
  db $88, $86, $84, $83, $81, $7F, $7D, $7C ; $17A564 |
  db $7A, $78, $76, $74, $72, $70, $6E, $6C ; $17A56C |
  db $6A, $68, $65, $63, $61, $5E, $5C, $59 ; $17A574 |
  db $56, $53, $50, $4D, $4A, $47, $43, $3F ; $17A57C |
  db $3B, $37, $32, $2D, $27, $20, $17, $00 ; $17A584 |

  db $BF, $01, $22, $77, $82, $00, $22, $1C ; $17A58C |
  db $83, $00                               ; $17A594 |

  LDA #$15                                  ; $17A596 |
  JSL $008279                               ; $17A598 |
  JSL copy_division_lookup_to_sram          ; $17A59C |
  JSL clear_all_sprites                     ; $17A5A0 |
  JSL $008259                               ; $17A5A4 |
  LDX #$28                                  ; $17A5A8 |\ play sound #$0028
  JSL init_scene_regs                       ; $17A5AA |/

gamemode20:
  LDA #$03                                  ; $17A5AE |
  STA !r_reg_obsel_mirror                   ; $17A5B0 |
  STA !reg_obsel                            ; $17A5B3 |
  STZ $0201                                 ; $17A5B6 |
  REP #$20                                  ; $17A5B9 |
  LDX #$00                                  ; $17A5BB |
  STX !reg_vmain                            ; $17A5BD |
  LDA #$1C00                                ; $17A5C0 |
  STA !reg_vmadd                            ; $17A5C3 |
  LDA #$1809                                ; $17A5C6 |
  STA $4300                                 ; $17A5C9 |
  LDA #$A58C                                ; $17A5CC |
  STA $4302                                 ; $17A5CF |
  LDX #$17                                  ; $17A5D2 |
  STX $4304                                 ; $17A5D4 |
  LDA #$0800                                ; $17A5D7 |
  STA $4305                                 ; $17A5DA |
  LDY #$01                                  ; $17A5DD |
  STY !reg_mdmaen                           ; $17A5DF |
  LDX #$80                                  ; $17A5E2 |
  STX !reg_vmain                            ; $17A5E4 |
  LDA #$1C00                                ; $17A5E7 |
  STA !reg_vmadd                            ; $17A5EA |
  LDA #$1909                                ; $17A5ED |
  STA $4300                                 ; $17A5F0 |
  LDA #$A58D                                ; $17A5F3 |
  STA $4302                                 ; $17A5F6 |
  LDA #$0800                                ; $17A5F9 |
  STA $4305                                 ; $17A5FC |
  STY !reg_mdmaen                           ; $17A5FF |
  SEP #$20                                  ; $17A602 |
  JSL $00B439                               ; $17A604 |
  REP #$30                                  ; $17A608 |
  STZ !r_yoshi_color                        ; $17A60A |
  JSL $00BB47                               ; $17A60D |
  REP #$20                                  ; $17A611 |
  JSL $17CD0B                               ; $17A613 |
  SEP #$20                                  ; $17A617 |
  LDX #$04                                  ; $17A619 |

CODE_17A61B:
  LDA $A42E,x                               ; $17A61B |
  STA $4370,x                               ; $17A61E |
  LDA $A43A,x                               ; $17A621 |
  STA $4360,x                               ; $17A624 |
  LDA $A44A,x                               ; $17A627 |
  STA $4350,x                               ; $17A62A |
  LDA $A45A,x                               ; $17A62D |
  STA $4340,x                               ; $17A630 |
  LDA $A464,x                               ; $17A633 |
  STA $4330,x                               ; $17A636 |
  LDA $A473,x                               ; $17A639 |
  STA $4320,x                               ; $17A63C |
  LDA $A482,x                               ; $17A63F |
  STA $4310,x                               ; $17A642 |
  DEX                                       ; $17A645 |
  BPL CODE_17A61B                           ; $17A646 |
  LDA #$7E                                  ; $17A648 |
  STA $4327                                 ; $17A64A |
  LDX #$09                                  ; $17A64D |

CODE_17A64F:
  LDA $A433,x                               ; $17A64F |
  STA $7E5B18,x                             ; $17A652 |
  LDA $A43F,x                               ; $17A656 |
  STA $7E5B58,x                             ; $17A659 |
  LDA $A44F,x                               ; $17A65D |
  STA $7E5B98,x                             ; $17A660 |

CODE_17A664:
  LDA $A45F,x                               ; $17A664 |
  STA $7E5BD8,x                             ; $17A667 |
  LDA $A469,x                               ; $17A66B |
  STA $7E5C18,x                             ; $17A66E |
  LDA $A478,x                               ; $17A672 |
  STA $7E5C58,x                             ; $17A675 |
  LDA $A487,x                               ; $17A679 |
  STA $7E5C98,x                             ; $17A67C |
  DEX                                       ; $17A680 |
  BPL CODE_17A64F                           ; $17A681 |
  LDA #$00                                  ; $17A683 |
  STA $1144                                 ; $17A685 |
  DEC A                                     ; $17A688 |
  STA $1145                                 ; $17A689 |
  LDX !r_cur_world                          ; $17A68C |
  LDA !r_cur_stage                          ; $17A68F |
  PHA                                       ; $17A692 |
  SEC                                       ; $17A693 |
  SBC $17E198,x                             ; $17A694 |
  CMP #$08                                  ; $17A698 |
  BCC CODE_17A6A6                           ; $17A69A |
  LDA $17E198,x                             ; $17A69C |
  STA !r_cur_stage                          ; $17A6A0 |
  LDA $0000                                 ; $17A6A3 |

CODE_17A6A6:
  STA $112E                                 ; $17A6A6 |
  JSL $17C74B                               ; $17A6A9 |
  PLA                                       ; $17A6AD |
  STA !r_cur_stage                          ; $17A6AE |
  JSR CODE_17A871                           ; $17A6B1 |
  LDA #$10                                  ; $17A6B4 |
  STA $02                                   ; $17A6B6 |
  REP #$20                                  ; $17A6B8 |
  LDA #$0C0B                                ; $17A6BA |
  STA $0319                                 ; $17A6BD |
  STA $0325                                 ; $17A6C0 |
  STA $0331                                 ; $17A6C3 |
  STA $033D                                 ; $17A6C6 |
  STA $0349                                 ; $17A6C9 |
  STA $0355                                 ; $17A6CC |
  LDX $1123                                 ; $17A6CF |
  CPX #$09                                  ; $17A6D2 |
  BCC CODE_17A6F6                           ; $17A6D4 |
  LDX !r_cur_world                          ; $17A6D6 |
  LDA $1081DD,x                             ; $17A6D9 |
  STA $00                                   ; $17A6DD |
  LDX #$00                                  ; $17A6DF |

CODE_17A6E1:
  LDA [$00]                                 ; $17A6E1 |
  STA $04                                   ; $17A6E3 |
  LDA ($04)                                 ; $17A6E5 |
  AND #$000F                                ; $17A6E7 |
  BEQ CODE_17A6F5                           ; $17A6EA |
  INC $00                                   ; $17A6EC |
  INC $00                                   ; $17A6EE |
  INX                                       ; $17A6F0 |
  CPX #$09                                  ; $17A6F1 |
  BCC CODE_17A6E1                           ; $17A6F3 |

CODE_17A6F5:
  DEX                                       ; $17A6F5 |

CODE_17A6F6:
  TXA                                       ; $17A6F6 |
  AND #$00FF                                ; $17A6F7 |
  STA $1123                                 ; $17A6FA |
  LDA !r_cur_stage                          ; $17A6FD |
  STA $112B                                 ; $17A700 |
  LDX !r_cur_world                          ; $17A703 |
  STZ $1148                                 ; $17A706 |
  LDA $17E198,x                             ; $17A709 |
  TAX                                       ; $17A70D |
  LDA $0317,x                               ; $17A70E |
  CMP #$0A09                                ; $17A711 |
  BEQ CODE_17A739                           ; $17A714 |
  LDA #$F0F0                                ; $17A716 |
  STA $0317,x                               ; $17A719 |
  LDY #$08                                  ; $17A71C |
  STZ $00                                   ; $17A71E |

CODE_17A720:
  LDA !r_stage_scores,x                     ; $17A720 |
  AND #$00FF                                ; $17A723 |
  CLC                                       ; $17A726 |
  ADC $00                                   ; $17A727 |
  STA $00                                   ; $17A729 |
  INX                                       ; $17A72B |
  DEY                                       ; $17A72C |
  BNE CODE_17A720                           ; $17A72D |
  LDA $00                                   ; $17A72F |
  CMP #$0320                                ; $17A731 |
  BCC CODE_17A739                           ; $17A734 |
  INC $1148                                 ; $17A736 |

CODE_17A739:
  SEP #$20                                  ; $17A739 |
  JSL $17C5FE                               ; $17A73B |
  REP #$20                                  ; $17A73F |
  LDA !r_cur_world                          ; $17A741 |
  STA $1125                                 ; $17A744 |
  REP #$10                                  ; $17A747 |
  LDA #$0009                                ; $17A749 |
  STA $7D                                   ; $17A74C |
  STZ $39                                   ; $17A74E |
  STZ $3B                                   ; $17A750 |
  STZ $3D                                   ; $17A752 |
  LDA #$0080                                ; $17A754 |
  STA $3F                                   ; $17A757 |
  STZ $43                                   ; $17A759 |
  LDA #$02D0                                ; $17A75B |
  STA $69                                   ; $17A75E |
  LDA #$0000                                ; $17A760 |
  STA $6B                                   ; $17A763 |
  STZ $6F                                   ; $17A765 |
  LDA $1125                                 ; $17A767 |
  ASL A                                     ; $17A76A |
  ASL A                                     ; $17A76B |
  ORA $1123                                 ; $17A76C |
  ASL A                                     ; $17A76F |
  ASL A                                     ; $17A770 |
  ASL A                                     ; $17A771 |
  STA $91                                   ; $17A772 |
  LDX #$0001                                ; $17A774 |
  LDA !r_game_mode                          ; $17A777 |
  CMP #$0023                                ; $17A77A |
  BEQ CODE_17A780                           ; $17A77D |
  DEX                                       ; $17A77F |

CODE_17A780:
  STX $97                                   ; $17A780 |
  LDA $1123                                 ; $17A782 |
  STA $B1                                   ; $17A785 |
  LDA $1125                                 ; $17A787 |
  ASL A                                     ; $17A78A |
  ASL A                                     ; $17A78B |
  ORA $1123                                 ; $17A78C |
  INC A                                     ; $17A78F |
  ASL A                                     ; $17A790 |
  TAY                                       ; $17A791 |
  LDA $BE0E,y                               ; $17A792 |
  SEC                                       ; $17A795 |
  SBC #$0004                                ; $17A796 |
  STA $AD                                   ; $17A799 |
  LDA $BDAE,y                               ; $17A79B |
  SEC                                       ; $17A79E |
  SBC #$0008                                ; $17A79F |
  STA $AF                                   ; $17A7A2 |
  JSR CODE_17A825                           ; $17A7A4 |
  REP #$20                                  ; $17A7A7 |
  LDX #$80                                  ; $17A7A9 |
  STX !reg_vmain                            ; $17A7AB |
  LDA #$1C20                                ; $17A7AE |
  STA !reg_vmadd                            ; $17A7B1 |
  LDA #$1801                                ; $17A7B4 |
  STA $4300                                 ; $17A7B7 |
  LDA #$0A06                                ; $17A7BA |
  STA $4302                                 ; $17A7BD |
  LDX #$00                                  ; $17A7C0 |
  STX $4304                                 ; $17A7C2 |
  LDA #$0380                                ; $17A7C5 |
  STA $4305                                 ; $17A7C8 |
  LDY #$01                                  ; $17A7CB |
  STY !reg_mdmaen                           ; $17A7CD |
  LDA #$2000                                ; $17A7D0 |
  STA !reg_vmadd                            ; $17A7D3 |
  LDA #$5800                                ; $17A7D6 |
  STA $4302                                 ; $17A7D9 |
  LDX #$70                                  ; $17A7DC |
  STX $4304                                 ; $17A7DE |
  LDA #$1000                                ; $17A7E1 |
  STA $4305                                 ; $17A7E4 |
  STY !reg_mdmaen                           ; $17A7E7 |
  SEP #$30                                  ; $17A7EA |
  JSL process_vram_dma_queue_l              ; $17A7EC |
  LDX #$12                                  ; $17A7F0 |
  JSL set_level_music                       ; $17A7F2 |
  LDA $0205                                 ; $17A7F6 |
  BNE CODE_17A810                           ; $17A7F9 |
  LDA #$08                                  ; $17A7FB |
  CLC                                       ; $17A7FD |
  ADC $1146                                 ; $17A7FE |
  STA $4D                                   ; $17A801 |
  CMP #$09                                  ; $17A803 |
  BEQ CODE_17A819                           ; $17A805 |
  LDA $0265                                 ; $17A807 |
  AND #$7F                                  ; $17A80A |
  BEQ CODE_17A810                           ; $17A80C |
  INC $4D                                   ; $17A80E |

CODE_17A810:
  LDA !r_game_mode                          ; $17A810 |
  CMP #$27                                  ; $17A813 |
  BCC CODE_17A819                           ; $17A815 |
  DEC $4D                                   ; $17A817 |

CODE_17A819:
  JSL $008245                               ; $17A819 |
  LDA #$FE                                  ; $17A81D |
  STA !r_reg_hdmaen_mirror                  ; $17A81F |
  JMP CODE_17B38A                           ; $17A822 |

CODE_17A825:
  LDX #$0000                                ; $17A825 |
  LDA $1125                                 ; $17A828 |
  ASL A                                     ; $17A82B |
  ASL A                                     ; $17A82C |
  ORA $1123                                 ; $17A82D |
  ASL A                                     ; $17A830 |
  STA $89                                   ; $17A831 |
  TAY                                       ; $17A833 |
  LDA $BE6E,y                               ; $17A834 |
  STA $83                                   ; $17A837 |
  LDA $BE0E,y                               ; $17A839 |
  SEC                                       ; $17A83C |
  SBC #$0004                                ; $17A83D |
  STA $72                                   ; $17A840 |
  STA $8D                                   ; $17A842 |
  LDA $BDAE,y                               ; $17A844 |
  SEC                                       ; $17A847 |
  SBC #$0008                                ; $17A848 |
  STA $76                                   ; $17A84B |
  STA $8F                                   ; $17A84D |
  SEC                                       ; $17A84F |
  SBC #$0074                                ; $17A850 |
  BMI CODE_17A85E                           ; $17A853 |
  TAX                                       ; $17A855 |
  CMP #$0100                                ; $17A856 |
  BCC CODE_17A85E                           ; $17A859 |
  LDX #$0100                                ; $17A85B |

CODE_17A85E:
  TXA                                       ; $17A85E |
  STA $69                                   ; $17A85F |
  STA !s_bg1_cam_x                          ; $17A861 |
  STA $6D                                   ; $17A864 |
  STA $79                                   ; $17A866 |
  STA $41                                   ; $17A868 |
  JMP CODE_17BF7C                           ; $17A86A |
  JSR CODE_17A825                           ; $17A86D |
  RTL                                       ; $17A870 |

CODE_17A871:
  STZ $1115                                 ; $17A871 |
  STZ $1135                                 ; $17A874 |
  LDA #$21                                  ; $17A877 |
  STA !r_game_mode                          ; $17A879 |
  STZ $1127                                 ; $17A87C |
  JSR CODE_17A908                           ; $17A87F |
  LDA $0220                                 ; $17A882 |
  BEQ CODE_17A8EF                           ; $17A885 |
  LDX !r_cur_stage                          ; $17A887 |
  LDA #$01                                  ; $17A88A |
  STA !r_stages_unlocked,x                  ; $17A88C |
  INC $1127                                 ; $17A88F |
  REP #$30                                  ; $17A892 |
  TXA                                       ; $17A894 |
  AND #$00FF                                ; $17A895 |
  ASL A                                     ; $17A898 |
  TAX                                       ; $17A899 |
  LDA.l level_entrance_indexes,x            ; $17A89A |
  TAX                                       ; $17A89E |
  LDA.l map_level_entrances+3,x             ; $17A89F |
  SEP #$30                                  ; $17A8A3 |
  TAY                                       ; $17A8A5 |
  LDA !r_stages_unlocked,y                  ; $17A8A6 |
  BNE CODE_17A8F1                           ; $17A8A9 |
  STY !r_cur_stage                          ; $17A8AB |
  LDX #$FF                                  ; $17A8AE |
  TYA                                       ; $17A8B0 |

CODE_17A8B1:
  INX                                       ; $17A8B1 |
  SEC                                       ; $17A8B2 |
  SBC #$0C                                  ; $17A8B3 |
  BPL CODE_17A8B1                           ; $17A8B5 |
  REP #$30                                  ; $17A8B7 |
  TXA                                       ; $17A8B9 |
  AND #$00FF                                ; $17A8BA |
  ASL A                                     ; $17A8BD |
  STA !r_cur_world                          ; $17A8BE |
  SEP #$30                                  ; $17A8C1 |
  JSL $108279                               ; $17A8C3 |
  LDA #$23                                  ; $17A8C7 |
  STA !r_game_mode                          ; $17A8C9 |
  LDA !r_cur_world                          ; $17A8CC |
  LSR A                                     ; $17A8CF |
  TAX                                       ; $17A8D0 |
  LDA !r_cur_stage                          ; $17A8D1 |
  CMP $E187,x                               ; $17A8D4 |
  BNE CODE_17A8F1                           ; $17A8D7 |
  STX $1115                                 ; $17A8D9 |
  DEC !r_cur_world                          ; $17A8DC |
  DEC !r_cur_world                          ; $17A8DF |
  JSR CODE_17A908                           ; $17A8E2 |
  LDA #$27                                  ; $17A8E5 |
  STA !r_game_mode                          ; $17A8E7 |
  LDA #$07                                  ; $17A8EA |
  STA $112E                                 ; $17A8EC |

CODE_17A8EF:
  BRA CODE_17A904                           ; $17A8EF |

CODE_17A8F1:
  LDA $0220                                 ; $17A8F1 |
  BPL CODE_17A904                           ; $17A8F4 |
  AND #$7F                                  ; $17A8F6 |
  STA $1135                                 ; $17A8F8 |
  JSL $108279                               ; $17A8FB |
  LDA #$25                                  ; $17A8FF |
  STA !r_game_mode                          ; $17A901 |

CODE_17A904:
  STZ $0220                                 ; $17A904 |
  RTS                                       ; $17A907 |

CODE_17A908:
  REP #$20                                  ; $17A908 |
  LDX !r_cur_world                          ; $17A90A |
  LDA !r_cur_stage                          ; $17A90D |
  SEC                                       ; $17A910 |
  SBC $E198,x                               ; $17A911 |
  STA $1123                                 ; $17A914 |
  SEP #$20                                  ; $17A917 |
  RTS                                       ; $17A919 |

  dw $AA7A                                  ; $17A91A |
  dw $A948                                  ; $17A91C |
  dw $A94C                                  ; $17A91E |
  dw $A950                                  ; $17A920 |
  dw $A954                                  ; $17A922 |
  dw $AB69                                  ; $17A924 |
  dw $A995                                  ; $17A926 |
  dw $A99C                                  ; $17A928 |
  dw $A9A0                                  ; $17A92A |
  dw $A9AF                                  ; $17A92C |
  dw $AA7A                                  ; $17A92E |
  dw $A9DE                                  ; $17A930 |

gamemode28:
  JSL $008259                               ; $17A932 |
  LDA $1127                                 ; $17A936 |
  BEQ CODE_17A943                           ; $17A939 |
  ASL A                                     ; $17A93B |
  TAX                                       ; $17A93C |
  JSR ($A918,x)                             ; $17A93D |
  STZ $1118                                 ; $17A940 |

CODE_17A943:
  REP #$30                                  ; $17A943 |
  JMP CODE_17B387                           ; $17A945 |
  LDX #$00                                  ; $17A948 |
  BRA CODE_17A9A2                           ; $17A94A |
  LDX #$02                                  ; $17A94C |
  BRA CODE_17A9A2                           ; $17A94E |
  LDX #$04                                  ; $17A950 |
  BRA CODE_17A9A2                           ; $17A952 |
  LDX #$06                                  ; $17A954 |
  JSL $17D87D                               ; $17A956 |
  LDA $1118                                 ; $17A95A |
  BEQ CODE_17A994                           ; $17A95D |
  LDA #$03                                  ; $17A95F |
  STA $1127                                 ; $17A961 |
  STZ $1120                                 ; $17A964 |
  STZ $1121                                 ; $17A967 |
  INC $111F                                 ; $17A96A |
  LDA $111F                                 ; $17A96D |
  CMP #$08                                  ; $17A970 |
  BCC CODE_17A994                           ; $17A972 |
  LDA #$06                                  ; $17A974 |
  STA $1127                                 ; $17A976 |
  STZ $111F                                 ; $17A979 |
  LDA $1148                                 ; $17A97C |
  BEQ CODE_17A98B                           ; $17A97F |
  LDA #$06                                  ; $17A981 |
  STA $1148                                 ; $17A983 |
  LDA #$14                                  ; $17A986 |
  STA $1133                                 ; $17A988 |

CODE_17A98B:
  LDX !r_cur_world                          ; $17A98B |
  LDA $E198,x                               ; $17A98E |
  TAX                                       ; $17A991 |
  LDY #$08                                  ; $17A992 |

CODE_17A994:
  RTS                                       ; $17A994 |

  LDX #$08                                  ; $17A995 |
  STX $1121                                 ; $17A997 |
  BRA CODE_17A9A2                           ; $17A99A |
  LDX #$0A                                  ; $17A99C |
  BRA CODE_17A9A2                           ; $17A99E |
  LDX #$0C                                  ; $17A9A0 |

CODE_17A9A2:
  JSL $17D87D                               ; $17A9A2 |
  LDA $1118                                 ; $17A9A6 |
  BEQ CODE_17A9AE                           ; $17A9A9 |
  INC $1127                                 ; $17A9AB |

CODE_17A9AE:
  RTS                                       ; $17A9AE |

  LDX #$0E                                  ; $17A9AF |
  JSL $17D87D                               ; $17A9B1 |
  LDA $1118                                 ; $17A9B5 |
  BEQ CODE_17A9DD                           ; $17A9B8 |
  LDA #$04                                  ; $17A9BA |
  STA $3D                                   ; $17A9BC |
  LDA #$84                                  ; $17A9BE |
  STA $3F                                   ; $17A9C0 |
  LDA #$07                                  ; $17A9C2 |
  STA $1127                                 ; $17A9C4 |
  INC $1121                                 ; $17A9C7 |
  JSL $17D3AC                               ; $17A9CA |
  INC $111F                                 ; $17A9CE |
  LDA $111F                                 ; $17A9D1 |
  CMP #$08                                  ; $17A9D4 |
  BCC CODE_17A9DD                           ; $17A9D6 |
  LDA #$0B                                  ; $17A9D8 |
  STA $1127                                 ; $17A9DA |

CODE_17A9DD:
  RTS                                       ; $17A9DD |

  INC !r_cur_world                          ; $17A9DE |
  INC !r_cur_world                          ; $17A9E1 |
  LDA !r_cur_world                          ; $17A9E4 |
  LSR A                                     ; $17A9E7 |
  TAY                                       ; $17A9E8 |
  LDX $E187,y                               ; $17A9E9 |
  LDA #$80                                  ; $17A9EC |
  STA !r_stages_unlocked,x                  ; $17A9EE |
  LDA #$FF                                  ; $17A9F1 |
  STA $011A                                 ; $17A9F3 |
  LDA #$08                                  ; $17A9F6 |
  STA !r_game_mode                          ; $17A9F8 |
  STZ !r_last_world_unlocked                ; $17A9FB |
  STZ $0217                                 ; $17A9FE |
  RTS                                       ; $17AA01 |

  dw $AA4B                                  ; $17AA02 |
  dw $B519                                  ; $17AA04 |
  dw $B519                                  ; $17AA06 |
  dw $B519                                  ; $17AA08 |
  dw $AA8B                                  ; $17AA0A |
  dw $AA9C                                  ; $17AA0C |
  dw $AAB1                                  ; $17AA0E |
  dw $AAE0                                  ; $17AA10 |
  dw $AB03                                  ; $17AA12 |
  dw $AB1C                                  ; $17AA14 |
  dw $AB69                                  ; $17AA16 |
  dw $AB24                                  ; $17AA18 |

gamemode26:
  JSL $008259                               ; $17AA1A | init OAM buffer
  LDA $1127                                 ; $17AA1E |
  BEQ CODE_17AA3E                           ; $17AA21 |
  ASL A                                     ; $17AA23 |
  TAX                                       ; $17AA24 |
  JSR ($AA00,x)                             ; $17AA25 |
  LDA $1127                                 ; $17AA28 |
  CMP #$07                                  ; $17AA2B |
  BCC CODE_17AA39                           ; $17AA2D |
  CMP #$0B                                  ; $17AA2F |
  BCS CODE_17AA39                           ; $17AA31 |
  STA $1121                                 ; $17AA33 |
  JSR CODE_17B687                           ; $17AA36 |

CODE_17AA39:
  STZ $1118                                 ; $17AA39 |
  BRA CODE_17AA46                           ; $17AA3C |

CODE_17AA3E:
  LDA $1131                                 ; $17AA3E |
  BEQ CODE_17AA46                           ; $17AA41 |
  JSR CODE_17B753                           ; $17AA43 |

CODE_17AA46:
  REP #$30                                  ; $17AA46 |
  JMP CODE_17B387                           ; $17AA48 |
  JSR CODE_17AA7A                           ; $17AA4B |
  LDA $1133                                 ; $17AA4E |
  BNE CODE_17AA79                           ; $17AA51 |
  LDY !r_cur_stage                          ; $17AA53 |
  LDA !r_stage_scores,y                     ; $17AA56 |
  PHA                                       ; $17AA59 |
  LDA $1135                                 ; $17AA5A |
  STA !r_stage_scores,y                     ; $17AA5D |
  PLA                                       ; $17AA60 |
  STA $1135                                 ; $17AA61 |
  LDA !r_cur_world                          ; $17AA64 |
  LSR A                                     ; $17AA67 |
  TAY                                       ; $17AA68 |
  LDA !r_cur_stage                          ; $17AA69 |
  SEC                                       ; $17AA6C |
  SBC $E187,y                               ; $17AA6D |
  STA $111F                                 ; $17AA70 |
  JSR CODE_17B509                           ; $17AA73 |
  DEC $1127                                 ; $17AA76 |

CODE_17AA79:
  RTS                                       ; $17AA79 |

CODE_17AA7A:
  INC $1133                                 ; $17AA7A |
  LDA $1133                                 ; $17AA7D |
  CMP #$14                                  ; $17AA80 |
  BCC CODE_17AA8A                           ; $17AA82 |
  INC $1127                                 ; $17AA84 |
  STZ $1133                                 ; $17AA87 |

CODE_17AA8A:
  RTS                                       ; $17AA8A |

CODE_17AA8B:
  INC $1133                                 ; $17AA8B |
  LDA $1133                                 ; $17AA8E |
  CMP #$50                                  ; $17AA91 |
  BCC CODE_17AA9B                           ; $17AA93 |
  INC $1127                                 ; $17AA95 |
  STZ $1133                                 ; $17AA98 |

CODE_17AA9B:
  RTS                                       ; $17AA9B |

  JSL $17D2B3                               ; $17AA9C |
  REP #$20                                  ; $17AAA0 |
  LDA #$0100                                ; $17AAA2 |
  STA $1110                                 ; $17AAA5 |
  SEP #$20                                  ; $17AAA8 |
  LDA #$15                                  ; $17AAAA |
  STA $53                                   ; $17AAAC |
  INC $1127                                 ; $17AAAE |
  REP #$20                                  ; $17AAB1 |
  LDA $1110                                 ; $17AAB3 |
  SEC                                       ; $17AAB6 |
  SBC #$0008                                ; $17AAB7 |
  STA $1110                                 ; $17AABA |
  SEP #$20                                  ; $17AABD |
  CMP #$20                                  ; $17AABF |
  BCS CODE_17AAD6                           ; $17AAC1 |
  INC $1127                                 ; $17AAC3 |
  LDX !r_cur_stage                          ; $17AAC6 |
  LDA $1135                                 ; $17AAC9 |
  STA !r_stage_scores,x                     ; $17AACC |
  STZ $1135                                 ; $17AACF |
  LDA #$05                                  ; $17AAD2 |
  STA $53                                   ; $17AAD4 |

CODE_17AAD6:
  REP #$20                                  ; $17AAD6 |
  LDX #$0B                                  ; $17AAD8 |
  JSR CODE_17B623                           ; $17AADA |
  SEP #$20                                  ; $17AADD |
  RTS                                       ; $17AADF |

  REP #$20                                  ; $17AAE0 |
  LDA $1110                                 ; $17AAE2 |
  CLC                                       ; $17AAE5 |
  ADC #$0008                                ; $17AAE6 |
  STA $1110                                 ; $17AAE9 |
  SEP #$20                                  ; $17AAEC |
  LDA $1111                                 ; $17AAEE |
  BEQ CODE_17AAF9                           ; $17AAF1 |
  STZ $1110                                 ; $17AAF3 |
  INC $1127                                 ; $17AAF6 |

CODE_17AAF9:
  REP #$20                                  ; $17AAF9 |
  LDX #$0B                                  ; $17AAFB |
  JSR CODE_17B623                           ; $17AAFD |
  SEP #$20                                  ; $17AB00 |
  RTS                                       ; $17AB02 |

  LDX #$00                                  ; $17AB03 |
  JSL $17D87D                               ; $17AB05 |
  LDA !r_cur_world                          ; $17AB09 |
  LSR A                                     ; $17AB0C |
  TAX                                       ; $17AB0D |
  LDA !r_cur_stage                          ; $17AB0E |
  SEC                                       ; $17AB11 |
  SBC $E187,x                               ; $17AB12 |
  STA $111F                                 ; $17AB15 |
  INC $1127                                 ; $17AB18 |
  RTS                                       ; $17AB1B |

  JSL $17D523                               ; $17AB1C |
  INC $1127                                 ; $17AB20 |
  RTS                                       ; $17AB23 |

  STZ $1127                                 ; $17AB24 |
  INC $1131                                 ; $17AB27 |
  RTS                                       ; $17AB2A |

  dw $AB9C                                  ; $17AB2B |
  dw $ABE6                                  ; $17AB2D |
  dw $ABF6                                  ; $17AB2F |
  dw $AC0A                                  ; $17AB31 |
  dw $AC19                                  ; $17AB33 |
  dw $AC44                                  ; $17AB35 |
  dw $AD09                                  ; $17AB37 |
  dw $B16B                                  ; $17AB39 |
  dw $B013                                  ; $17AB3B |
  dw $B03E                                  ; $17AB3D |
  dw $B060                                  ; $17AB3F |
  dw $B03E                                  ; $17AB41 |
  dw $B060                                  ; $17AB43 |
  dw $B03E                                  ; $17AB45 |
  dw $B097                                  ; $17AB47 |
  dw $B16B                                  ; $17AB49 |
  dw $B0BC                                  ; $17AB4B |
  dw $B03E                                  ; $17AB4D |
  dw $B060                                  ; $17AB4F |
  dw $B03E                                  ; $17AB51 |
  dw $B060                                  ; $17AB53 |
  dw $B03E                                  ; $17AB55 |
  dw $B0E7                                  ; $17AB57 |
  dw $B16B                                  ; $17AB59 |
  dw $B10C                                  ; $17AB5B |
  dw $B120                                  ; $17AB5D |
  dw $B12C                                  ; $17AB5F |
  dw $B138                                  ; $17AB61 |
  dw $B176                                  ; $17AB63 |
  dw $B194                                  ; $17AB65 |
  dw $B326                                  ; $17AB67 |

  STZ $1118                                 ; $17AB69 |
  LDA $1148                                 ; $17AB6C |
  BEQ CODE_17AB86                           ; $17AB6F |
  ASL A                                     ; $17AB71 |
  TAX                                       ; $17AB72 |
  JSR ($AB29,x)                             ; $17AB73 |
  LDA $1148                                 ; $17AB76 |
  CMP #$07                                  ; $17AB79 |
  BCC CODE_17AB89                           ; $17AB7B |
  CMP #$19                                  ; $17AB7D |
  BCS CODE_17AB89                           ; $17AB7F |
  JSR CODE_17AB8E                           ; $17AB81 |
  BRA CODE_17AB89                           ; $17AB84 |

CODE_17AB86:
  JSR CODE_17AA8B                           ; $17AB86 |

CODE_17AB89:
  RTS                                       ; $17AB89 |

  db $81, $22, $5D, $09                     ; $17AB8A |

CODE_17AB8E:
  LDA !r_frame_counter_global_dp            ; $17AB8E |
  AND #$04                                  ; $17AB90 |
  LSR A                                     ; $17AB92 |
  TAX                                       ; $17AB93 |

CODE_17AB94:
  LDA $AB8A,x                               ; $17AB94 |
  STA $702068                               ; $17AB97 |
  RTS                                       ; $17AB9B |

  LDA $111F                                 ; $17AB9C |
  STA $114A                                 ; $17AB9F |
  LDA #$3C                                  ; $17ABA2 |
  STA $1133                                 ; $17ABA4 |
  LDX #$00                                  ; $17ABA7 |
  JSR CODE_17AC0C                           ; $17ABA9 |
  REP #$20                                  ; $17ABAC |
  LDA $114A                                 ; $17ABAE |
  ASL A                                     ; $17ABB1 |
  TAX                                       ; $17ABB2 |
  LDA $DCEF,x                               ; $17ABB3 |
  LDX $1106                                 ; $17ABB6 |
  BEQ CODE_17ABBF                           ; $17ABB9 |
  CLC                                       ; $17ABBB |
  ADC #$0380                                ; $17ABBC |

CODE_17ABBF:
  CLC                                       ; $17ABBF |
  ADC #$0042                                ; $17ABC0 |
  STA $0A                                   ; $17ABC3 |
  CLC                                       ; $17ABC5 |
  ADC #$0040                                ; $17ABC6 |
  STA $0C                                   ; $17ABC9 |
  LDY #$00                                  ; $17ABCB |
  LDA #$2DA9                                ; $17ABCD |
  STA ($0A),y                               ; $17ABD0 |
  LDA #$2DB9                                ; $17ABD2 |
  STA ($0C),y                               ; $17ABD5 |
  INY                                       ; $17ABD7 |
  INY                                       ; $17ABD8 |
  LDA #$2DAA                                ; $17ABD9 |
  STA ($0A),y                               ; $17ABDC |
  LDA #$2DBA                                ; $17ABDE |
  STA ($0C),y                               ; $17ABE1 |
  SEP #$20                                  ; $17ABE3 |
  RTS                                       ; $17ABE5 |

CODE_17ABE6:
  REP #$20                                  ; $17ABE6 |
  DEC $1133                                 ; $17ABE8 |
  LDA $1133                                 ; $17ABEB |
  BNE CODE_17ABF3                           ; $17ABEE |
  INC $1148                                 ; $17ABF0 |

CODE_17ABF3:
  SEP #$20                                  ; $17ABF3 |
  RTS                                       ; $17ABF5 |

  LDA $111F                                 ; $17ABF6 |
  CMP $114A                                 ; $17ABF9 |
  BNE CODE_17AC06                           ; $17ABFC |
  INC A                                     ; $17ABFE |
  CMP #$08                                  ; $17ABFF |
  BCS CODE_17AC24                           ; $17AC01 |
  STA $111F                                 ; $17AC03 |

CODE_17AC06:
  LDX #$02                                  ; $17AC06 |
  BRA CODE_17AC0C                           ; $17AC08 |
  LDX #$04                                  ; $17AC0A |

CODE_17AC0C:
  JSL $17D87D                               ; $17AC0C |
  LDA $1118                                 ; $17AC10 |
  BEQ CODE_17AC18                           ; $17AC13 |
  INC $1148                                 ; $17AC15 |

CODE_17AC18:
  RTS                                       ; $17AC18 |

  LDX #$06                                  ; $17AC19 |
  JSL $17D87D                               ; $17AC1B |
  LDA $1118                                 ; $17AC1F |
  BEQ CODE_17AC43                           ; $17AC22 |

CODE_17AC24:
  STZ $1120                                 ; $17AC24 |
  STZ $1121                                 ; $17AC27 |
  LDX #$03                                  ; $17AC2A |
  INC $111F                                 ; $17AC2C |
  LDA $111F                                 ; $17AC2F |
  CMP #$08                                  ; $17AC32 |
  BCC CODE_17AC40                           ; $17AC34 |
  LDA #$14                                  ; $17AC36 |
  STA $1133                                 ; $17AC38 |
  STZ $111F                                 ; $17AC3B |
  LDX #$06                                  ; $17AC3E |

CODE_17AC40:
  STX $1148                                 ; $17AC40 |

CODE_17AC43:
  RTS                                       ; $17AC43 |

  LDA #$97                                  ; $17AC44 |\ play sound #$0097
  JSL push_sound_queue                      ; $17AC46 |/
  REP #$20                                  ; $17AC4A |
  JSR CODE_17AC94                           ; $17AC4C |
  REP #$10                                  ; $17AC4F |
  LDA #$0070                                ; $17AC51 |
  STA $01                                   ; $17AC54 |
  LDY #$6800                                ; $17AC56 |
  LDX #$5800                                ; $17AC59 |
  LDA #$1000                                ; $17AC5C |
  JSL $00BEA6                               ; $17AC5F |
  SEP #$10                                  ; $17AC63 |
  LDX #$0C                                  ; $17AC65 |
  STZ $00                                   ; $17AC67 |
  LDA #$0040                                ; $17AC69 |
  STA $02                                   ; $17AC6C |

CODE_17AC6E:
  STZ $1160,x                               ; $17AC6E |
  LDA $00                                   ; $17AC71 |
  STA $1152,x                               ; $17AC73 |
  CLC                                       ; $17AC76 |
  ADC #$000A                                ; $17AC77 |
  STA $00                                   ; $17AC7A |
  LDA $02                                   ; $17AC7C |
  STA $117C,x                               ; $17AC7E |
  CLC                                       ; $17AC81 |
  ADC #$0018                                ; $17AC82 |
  STA $02                                   ; $17AC85 |
  DEX                                       ; $17AC87 |
  DEX                                       ; $17AC88 |
  BPL CODE_17AC6E                           ; $17AC89 |
  INC $115E                                 ; $17AC8B |
  SEP #$30                                  ; $17AC8E |
  INC $1148                                 ; $17AC90 |
  RTS                                       ; $17AC93 |

CODE_17AC94:
  LDA #$5800                                ; $17AC94 |
  STA !gsu_r0                               ; $17AC97 |
  LDA #$0002                                ; $17AC9A |
  STA !gsu_r1                               ; $17AC9D |
  STZ !gsu_r2                               ; $17ACA0 |
  LDA #$0800                                ; $17ACA3 |
  STA !gsu_r12                              ; $17ACA6 |
  LDX #$08                                  ; $17ACA9 |
  LDA #$AA8B                                ; $17ACAB |
  JSL r_gsu_init_1                          ; $17ACAE | GSU init
  RTS                                       ; $17ACB2 |

  dw $0001, $0001, $0001, $0001             ; $17ACB3 |
  dw $0002, $0002, $0002, $0002             ; $17ACBB |
  dw $0002, $0003, $0003, $0003             ; $17ACC3 |
  dw $0003, $0003, $0002, $0002             ; $17ACCB |
  dw $0001                                  ; $17ACD3 |

  dw $0030, $0030, $0030, $0030             ; $17ACD5 |
  dw $0030, $FFD0, $FFD0, $FFD0             ; $17ACDD |
  dw $FFD0, $0000, $0030, $0030             ; $17ACE5 |

  dw $0030, $0003, $0003, $0002             ; $17ACED |
  dw $0002, $0002, $0002, $0002             ; $17ACF5 |
  dw $0002, $0001, $0001, $0001             ; $17ACFD |
  dw $0001, $0001                           ; $17AD05 |

  REP #$20                                  ; $17AD09 |
  LDY #$0C                                  ; $17AD0B |

CODE_17AD0D:
  LDA $1152,y                               ; $17AD0D |
  DEC A                                     ; $17AD10 |
  STA $1152,y                               ; $17AD11 |
  BNE CODE_17AD45                           ; $17AD14 |
  LDX $116E,y                               ; $17AD16 |
  LDA $ACB3,x                               ; $17AD19 |
  STA $1152,y                               ; $17AD1C |
  LDA $1160,y                               ; $17AD1F |
  CLC                                       ; $17AD22 |
  ADC $ACD5,x                               ; $17AD23 |
  STA $1160,y                               ; $17AD26 |
  INX                                       ; $17AD29 |
  INX                                       ; $17AD2A |
  CPX #$1A                                  ; $17AD2B |
  BCS CODE_17AD3F                           ; $17AD2D |
  TXA                                       ; $17AD2F |
  STA $116E,y                               ; $17AD30 |
  LDA $117C,y                               ; $17AD33 |
  SEC                                       ; $17AD36 |
  SBC $ACED,x                               ; $17AD37 |
  STA $117C,y                               ; $17AD3A |
  BRA CODE_17AD45                           ; $17AD3D |

CODE_17AD3F:
  LDA #$0100                                ; $17AD3F |
  STA $1160,y                               ; $17AD42 |

CODE_17AD45:
  DEY                                       ; $17AD45 |
  DEY                                       ; $17AD46 |
  BPL CODE_17AD0D                           ; $17AD47 |
  LDX #$0C                                  ; $17AD49 |
  LDA #$0000                                ; $17AD4B |

CODE_17AD4E:
  CLC                                       ; $17AD4E |
  ADC $1160,x                               ; $17AD4F |
  DEX                                       ; $17AD52 |
  DEX                                       ; $17AD53 |
  BPL CODE_17AD4E                           ; $17AD54 |
  CMP #$0700                                ; $17AD56 |
  BNE CODE_17AD64                           ; $17AD59 |
  INC $1148                                 ; $17AD5B |
  LDA #$0070                                ; $17AD5E |
  STA $1133                                 ; $17AD61 |

CODE_17AD64:
  JSR CODE_17AD93                           ; $17AD64 |
  JSR CODE_17AE1B                           ; $17AD67 |
  JSR CODE_17AF33                           ; $17AD6A |
  SEP #$20                                  ; $17AD6D |
  RTS                                       ; $17AD6F |

  dw $E081, $E0A1, $E0C1, $E0E1             ; $17AD70 |
  dw $E0A1, $C081, $A0C0                    ; $17AD78 |

  db $55, $55, $55, $55, $55, $55, $54      ; $17AD7E |

  db $00, $20, $40, $60, $00, $20, $40      ; $17AD85 |

  db $00, $00, $00, $00, $20, $20, $20      ; $17AD8C |

CODE_17AD93:
  JSR CODE_17AC94                           ; $17AD93 |
  REP #$10                                  ; $17AD96 |
  LDX #$000C                                ; $17AD98 |
  STX $00                                   ; $17AD9B |
  STZ $02                                   ; $17AD9D |

CODE_17AD9F:
  LDX $00                                   ; $17AD9F |
  LDY $02                                   ; $17ADA1 |
  LDA $1160,x                               ; $17ADA3 |
  BEQ CODE_17ADEE                           ; $17ADA6 |
  LDA #$0100                                ; $17ADA8 |
  STA !gsu_r6                               ; $17ADAB |
  LDA #$0010                                ; $17ADAE |
  STA !gsu_r8                               ; $17ADB1 |
  STA !gsu_r9                               ; $17ADB4 |
  LDA $1160,x                               ; $17ADB7 |
  STA !gsu_r11                              ; $17ADBA |
  LDA $AD70,y                               ; $17ADBD |
  STA !gsu_r12                              ; $17ADC0 |
  TYA                                       ; $17ADC3 |
  LSR A                                     ; $17ADC4 |
  TAY                                       ; $17ADC5 |
  LDA $AD8C,y                               ; $17ADC6 |
  AND #$00FF                                ; $17ADC9 |
  STA !gsu_r2                               ; $17ADCC |
  LDA $AD85,y                               ; $17ADCF |
  AND #$00FF                                ; $17ADD2 |
  STA !gsu_r3                               ; $17ADD5 |
  LDA $AD7E,y                               ; $17ADD8 |
  AND #$00FF                                ; $17ADDB |
  STA !gsu_r13                              ; $17ADDE |
  SEP #$10                                  ; $17ADE1 |
  LDX #$08                                  ; $17ADE3 |
  LDA #$8295                                ; $17ADE5 |
  JSL r_gsu_init_1                          ; $17ADE8 | GSU init
  REP #$10                                  ; $17ADEC |

CODE_17ADEE:
  INC $02                                   ; $17ADEE |
  INC $02                                   ; $17ADF0 |
  DEC $00                                   ; $17ADF2 |
  DEC $00                                   ; $17ADF4 |
  BPL CODE_17AD9F                           ; $17ADF6 |
  LDA #$0070                                ; $17ADF8 |
  STA $01                                   ; $17ADFB |
  LDY #$6800                                ; $17ADFD |
  LDX #$5800                                ; $17AE00 |
  LDA #$1000                                ; $17AE03 |
  JSL $00BEA6                               ; $17AE06 |
  SEP #$10                                  ; $17AE0A |
  RTS                                       ; $17AE0C |

  dw $3EC8, $3EC4, $3EC0, $3E8C             ; $17AE0D |
  dw $3E88, $3E84, $3E80                    ; $17AE15 |

CODE_17AE1B:
  REP #$10                                  ; $17AE1B |
  LDX #$000C                                ; $17AE1D |
  LDY !s_oam_next_free_slot_ptr             ; $17AE20 |

CODE_17AE23:
  LDA $1160,x                               ; $17AE23 |
  BNE CODE_17AE2B                           ; $17AE26 |
  JMP CODE_17AEEB                           ; $17AE28 |

CODE_17AE2B:
  LDA $117C,x                               ; $17AE2B |
  STA $6000,y                               ; $17AE2E |
  STA $6008,y                               ; $17AE31 |
  CLC                                       ; $17AE34 |
  ADC #$0010                                ; $17AE35 |
  STA $6010,y                               ; $17AE38 |
  STA $6018,y                               ; $17AE3B |
  STA $6020,y                               ; $17AE3E |
  STA $6028,y                               ; $17AE41 |
  LDA #$8000                                ; $17AE44 |
  STA $00                                   ; $17AE47 |
  LDA $116E,x                               ; $17AE49 |
  CMP #$0012                                ; $17AE4C |
  BCC CODE_17AE7C                           ; $17AE4F |
  STZ $00                                   ; $17AE51 |
  LDA #$0028                                ; $17AE53 |
  STA $6002,y                               ; $17AE56 |
  PHA                                       ; $17AE59 |
  CLC                                       ; $17AE5A |
  ADC #$0010                                ; $17AE5B |
  STA $600A,y                               ; $17AE5E |
  PLA                                       ; $17AE61 |
  STA $6012,y                               ; $17AE62 |
  CLC                                       ; $17AE65 |
  ADC #$0008                                ; $17AE66 |
  STA $601A,y                               ; $17AE69 |
  CLC                                       ; $17AE6C |
  ADC #$0008                                ; $17AE6D |
  STA $6022,y                               ; $17AE70 |
  CLC                                       ; $17AE73 |
  ADC #$0008                                ; $17AE74 |
  STA $602A,y                               ; $17AE77 |
  BRA CODE_17AEA3                           ; $17AE7A |

CODE_17AE7C:
  LDA #$0028                                ; $17AE7C |
  STA $600A,y                               ; $17AE7F |
  PHA                                       ; $17AE82 |
  CLC                                       ; $17AE83 |
  ADC #$0010                                ; $17AE84 |
  STA $6002,y                               ; $17AE87 |
  PLA                                       ; $17AE8A |
  STA $602A,y                               ; $17AE8B |
  CLC                                       ; $17AE8E |
  ADC #$0008                                ; $17AE8F |
  STA $6022,y                               ; $17AE92 |
  CLC                                       ; $17AE95 |
  ADC #$0008                                ; $17AE96 |
  STA $601A,y                               ; $17AE99 |
  CLC                                       ; $17AE9C |
  ADC #$0008                                ; $17AE9D |
  STA $6012,y                               ; $17AEA0 |

CODE_17AEA3:
  LDA $AE0D,x                               ; $17AEA3 |
  ORA $00                                   ; $17AEA6 |
  STA $6004,y                               ; $17AEA8 |
  PHA                                       ; $17AEAB |
  ORA #$0020                                ; $17AEAC |
  STA $600C,y                               ; $17AEAF |
  PLA                                       ; $17AEB2 |
  INC A                                     ; $17AEB3 |
  INC A                                     ; $17AEB4 |
  STA $6014,y                               ; $17AEB5 |
  CLC                                       ; $17AEB8 |
  ADC #$0010                                ; $17AEB9 |
  STA $601C,y                               ; $17AEBC |
  CLC                                       ; $17AEBF |
  ADC #$0010                                ; $17AEC0 |
  STA $6024,y                               ; $17AEC3 |
  CLC                                       ; $17AEC6 |
  ADC #$0010                                ; $17AEC7 |
  STA $602C,y                               ; $17AECA |
  LDA #$0002                                ; $17AECD |
  STA $6006,y                               ; $17AED0 |
  STA $600E,y                               ; $17AED3 |
  LDA #$0000                                ; $17AED6 |
  STA $6016,y                               ; $17AED9 |
  STA $601E,y                               ; $17AEDC |
  STA $6026,y                               ; $17AEDF |
  STA $602E,y                               ; $17AEE2 |
  TYA                                       ; $17AEE5 |
  CLC                                       ; $17AEE6 |
  ADC #$0030                                ; $17AEE7 |
  TAY                                       ; $17AEEA |

CODE_17AEEB:
  DEX                                       ; $17AEEB |
  DEX                                       ; $17AEEC |
  BMI CODE_17AEF2                           ; $17AEED |
  JMP CODE_17AE23                           ; $17AEEF |

CODE_17AEF2:
  STY !s_oam_next_free_slot_ptr             ; $17AEF2 |
  JSR CODE_17AFCC                           ; $17AEF5 |
  SEP #$10                                  ; $17AEF8 |
  RTS                                       ; $17AEFA |

  db $11, $12, $13, $14, $15, $80, $0F, $10 ; $17AEFB |
  db $11, $12, $13, $80, $80, $80           ; $17AF03 |

  db $80, $80, $80, $80, $11, $12, $13, $14 ; $17AF09 |
  db $80, $80, $80, $80, $80, $80           ; $17AF11 |

  dw $3FCB, $3FDB, $3FCB, $3FDA             ; $17AF17 |
  dw $3FCA, $3FCB, $3FCB, $3FDB             ; $17AF1F |
  dw $3FCB, $3FDA, $3FCA, $3FCB             ; $17AF27 |
  dw $3FCB, $3FCB                           ; $17AF2F |

CODE_17AF33:
  REP #$10                                  ; $17AF33 |
  LDX #$000C                                ; $17AF35 |
  LDA !s_oam_next_free_slot_ptr             ; $17AF38 |
  STA $00                                   ; $17AF3B |

CODE_17AF3D:
  LDA $116E,x                               ; $17AF3D |
  BEQ CODE_17AF7F                           ; $17AF40 |
  TAY                                       ; $17AF42 |
  PHA                                       ; $17AF43 |
  LDA $AF17,y                               ; $17AF44 |
  STA $04                                   ; $17AF47 |
  PLA                                       ; $17AF49 |
  LSR A                                     ; $17AF4A |
  TAY                                       ; $17AF4B |
  LDA $AEFB,y                               ; $17AF4C |
  AND #$00FF                                ; $17AF4F |
  CMP #$0080                                ; $17AF52 |
  BCS CODE_17AF5F                           ; $17AF55 |
  LDY #$0028                                ; $17AF57 |
  STY $02                                   ; $17AF5A |
  JSR CODE_17AF8B                           ; $17AF5C |

CODE_17AF5F:
  LDA $116E,x                               ; $17AF5F |
  TAY                                       ; $17AF62 |
  PHA                                       ; $17AF63 |
  LDA $AF17,y                               ; $17AF64 |
  STA $04                                   ; $17AF67 |
  PLA                                       ; $17AF69 |
  LSR A                                     ; $17AF6A |
  TAY                                       ; $17AF6B |
  LDA $AF09,y                               ; $17AF6C |
  AND #$00FF                                ; $17AF6F |
  CMP #$0080                                ; $17AF72 |
  BCS CODE_17AF7F                           ; $17AF75 |
  LDY #$0038                                ; $17AF77 |
  STY $02                                   ; $17AF7A |
  JSR CODE_17AF8B                           ; $17AF7C |

CODE_17AF7F:
  DEX                                       ; $17AF7F |
  DEX                                       ; $17AF80 |
  BPL CODE_17AF3D                           ; $17AF81 |
  LDA $00                                   ; $17AF83 |
  STA !s_oam_next_free_slot_ptr             ; $17AF85 |
  SEP #$10                                  ; $17AF88 |
  RTS                                       ; $17AF8A |

CODE_17AF8B:
  LDY $00                                   ; $17AF8B |
  ADC $117C,x                               ; $17AF8D |
  STA $6000,y                               ; $17AF90 |
  LDA $02                                   ; $17AF93 |
  STA $6002,y                               ; $17AF95 |
  LDA $04                                   ; $17AF98 |
  STA $6004,y                               ; $17AF9A |
  LDA #$4000                                ; $17AF9D |
  STA $6006,y                               ; $17AFA0 |
  LDA $00                                   ; $17AFA3 |
  CLC                                       ; $17AFA5 |
  ADC #$0008                                ; $17AFA6 |
  STA $00                                   ; $17AFA9 |
  RTS                                       ; $17AFAB |

  dw $DFC4, $DFCA, $DFD0, $DFD6             ; $17AFAC |
  dw $DFDC, $DFE2, $DFE8, $DFEE             ; $17AFB4 |

  dw $0010, $0006, $0006, $0006             ; $17AFBC |
  dw $0006, $0006, $0006, $0006             ; $17AFC4 |

CODE_17AFCC:
  LDA $1148                                 ; $17AFCC |
  CMP #$0008                                ; $17AFCF |
  BCC CODE_17B012                           ; $17AFD2 |
  CMP #$001D                                ; $17AFD4 |
  BCS CODE_17B012                           ; $17AFD7 |
  INC $118A                                 ; $17AFD9 |
  LDX $118C                                 ; $17AFDC |
  LDA $118A                                 ; $17AFDF |
  CMP $AFBC,x                               ; $17AFE2 |
  BCC CODE_17AFF7                           ; $17AFE5 |
  STZ $118A                                 ; $17AFE7 |
  INX                                       ; $17AFEA |
  INX                                       ; $17AFEB |
  CPX #$0010                                ; $17AFEC |
  BCC CODE_17AFF4                           ; $17AFEF |
  LDX #$0000                                ; $17AFF1 |

CODE_17AFF4:
  STX $118C                                 ; $17AFF4 |

CODE_17AFF7:
  LDA $AFAC,x                               ; $17AFF7 |
  STA $00                                   ; $17AFFA |
  LDA #$005F                                ; $17AFFC |
  STA $02                                   ; $17AFFF |
  LDY #$0000                                ; $17B001 |

CODE_17B004:
  TYX                                       ; $17B004 |
  LDA [$00],y                               ; $17B005 |
  STA $7021FA,x                             ; $17B007 |
  INY                                       ; $17B00B |
  INY                                       ; $17B00C |
  CPY #$0006                                ; $17B00D |
  BCC CODE_17B004                           ; $17B010 |

CODE_17B012:
  RTS                                       ; $17B012 |

  INC $1148                                 ; $17B013 |
  LDX !r_cur_world                          ; $17B016 |
  LDA $17E198,x                             ; $17B019 |
  CLC                                       ; $17B01D |
  ADC #$08                                  ; $17B01E |
  STA $114C                                 ; $17B020 |
  TAX                                       ; $17B023 |
  LDA #$01                                  ; $17B024 |
  STA !r_stages_unlocked,x                  ; $17B026 |
  REP #$20                                  ; $17B029 |
  JSR CODE_17AE1B                           ; $17B02B |
  LDA #$0010                                ; $17B02E |
  STA $1110                                 ; $17B031 |
  JSR CODE_17B623                           ; $17B034 |
  SEP #$20                                  ; $17B037 |
  LDA #$05                                  ; $17B039 |
  STA $53                                   ; $17B03B |
  RTS                                       ; $17B03D |

  REP #$20                                  ; $17B03E |
  JSR CODE_17AE1B                           ; $17B040 |
  LDX $1130                                 ; $17B043 |
  LDA $1110                                 ; $17B046 |
  CLC                                       ; $17B049 |
  ADC $B557,x                               ; $17B04A |
  CMP $B561,x                               ; $17B04D |
  BCC CODE_17B05E                           ; $17B050 |
  INC $1148                                 ; $17B052 |
  INC $1130                                 ; $17B055 |
  INC $1130                                 ; $17B058 |
  LDA $B561,x                               ; $17B05B |

CODE_17B05E:
  BRA CODE_17B07D                           ; $17B05E |
  REP #$20                                  ; $17B060 |
  JSR CODE_17AE1B                           ; $17B062 |
  LDX $1130                                 ; $17B065 |
  LDA $1110                                 ; $17B068 |
  SEC                                       ; $17B06B |
  SBC $B557,x                               ; $17B06C |
  CMP $B561,x                               ; $17B06F |
  BCS CODE_17B07D                           ; $17B072 |
  INC $1148                                 ; $17B074 |
  INC $1130                                 ; $17B077 |
  INC $1130                                 ; $17B07A |

CODE_17B07D:
  STA $1110                                 ; $17B07D |
  LDX $114C                                 ; $17B080 |
  JSR CODE_17B623                           ; $17B083 |
  SEP #$20                                  ; $17B086 |
  LDX !r_cur_world                          ; $17B088 |
  LDA $114C                                 ; $17B08B |
  SEC                                       ; $17B08E |
  SBC $17E198,x                             ; $17B08F |
  JSR CODE_17B693                           ; $17B093 |
  RTS                                       ; $17B096 |

  REP #$20                                  ; $17B097 |
  JSR CODE_17AE1B                           ; $17B099 |
  LDA #$001E                                ; $17B09C |
  STA $1133                                 ; $17B09F |
  INC $1148                                 ; $17B0A2 |
  LDY #$10                                  ; $17B0A5 |
  LDX !r_cur_world                          ; $17B0A7 |
  LDA $114C                                 ; $17B0AA |
  ASL A                                     ; $17B0AD |
  TAX                                       ; $17B0AE |
  LDA $17DC37                               ; $17B0AF |
  ORA $17DC4F,x                             ; $17B0B3 |
  STA $00                                   ; $17B0B7 |
  JMP CODE_17B662                           ; $17B0B9 |
  REP #$20                                  ; $17B0BC |
  JSR CODE_17AE1B                           ; $17B0BE |
  SEP #$20                                  ; $17B0C1 |
  INC $1148                                 ; $17B0C3 |
  INC $114C                                 ; $17B0C6 |
  LDA $114C                                 ; $17B0C9 |
  TAX                                       ; $17B0CC |
  LDA #$01                                  ; $17B0CD |
  STA !r_stages_unlocked,x                  ; $17B0CF |
  REP #$20                                  ; $17B0D2 |
  STZ $1130                                 ; $17B0D4 |
  LDA #$0010                                ; $17B0D7 |
  STA $1110                                 ; $17B0DA |
  JSR CODE_17B623                           ; $17B0DD |
  SEP #$20                                  ; $17B0E0 |
  LDA #$05                                  ; $17B0E2 |
  STA $53                                   ; $17B0E4 |
  RTS                                       ; $17B0E6 |

  REP #$20                                  ; $17B0E7 |
  JSR CODE_17AE1B                           ; $17B0E9 |
  LDA #$001E                                ; $17B0EC |
  STA $1133                                 ; $17B0EF |
  INC $1148                                 ; $17B0F2 |
  LDY #$12                                  ; $17B0F5 |
  LDX !r_cur_world                          ; $17B0F7 |
  LDA $114C                                 ; $17B0FA |
  ASL A                                     ; $17B0FD |
  TAX                                       ; $17B0FE |
  LDA $17DC39                               ; $17B0FF |
  ORA $17DC4F,x                             ; $17B103 |
  STA $00                                   ; $17B107 |
  JMP CODE_17B662                           ; $17B109 |
  LDX #$00                                  ; $17B10C |
  JSR CODE_17AB94                           ; $17B10E |
  REP #$20                                  ; $17B111 |
  JSR CODE_17AE1B                           ; $17B113 |
  SEP #$20                                  ; $17B116 |
  LDX #$08                                  ; $17B118 |
  STX $1121                                 ; $17B11A |
  JMP CODE_17AC0C                           ; $17B11D |
  REP #$20                                  ; $17B120 |
  JSR CODE_17AE1B                           ; $17B122 |
  SEP #$20                                  ; $17B125 |
  LDX #$0A                                  ; $17B127 |
  JMP CODE_17AC0C                           ; $17B129 |
  REP #$20                                  ; $17B12C |
  JSR CODE_17AE1B                           ; $17B12E |
  SEP #$20                                  ; $17B131 |
  LDX #$0C                                  ; $17B133 |
  JMP CODE_17AC0C                           ; $17B135 |
  REP #$20                                  ; $17B138 |
  JSR CODE_17AE1B                           ; $17B13A |
  SEP #$20                                  ; $17B13D |
  LDX #$0E                                  ; $17B13F |
  JSL $17D87D                               ; $17B141 |
  LDA $1118                                 ; $17B145 |
  BEQ CODE_17B16A                           ; $17B148 |
  LDA #$04                                  ; $17B14A |
  STA $3D                                   ; $17B14C |
  LDA #$84                                  ; $17B14E |
  STA $3F                                   ; $17B150 |
  INC $1121                                 ; $17B152 |
  JSL $17D3AC                               ; $17B155 |
  LDX #$19                                  ; $17B159 |
  INC $111F                                 ; $17B15B |
  LDA $111F                                 ; $17B15E |
  CMP #$08                                  ; $17B161 |
  BCC CODE_17B167                           ; $17B163 |
  LDX #$1D                                  ; $17B165 |

CODE_17B167:
  STX $1148                                 ; $17B167 |

CODE_17B16A:
  RTS                                       ; $17B16A |

  JSR CODE_17ABE6                           ; $17B16B |
  REP #$20                                  ; $17B16E |
  JSR CODE_17AE1B                           ; $17B170 |
  SEP #$20                                  ; $17B173 |
  RTS                                       ; $17B175 |

  REP #$20                                  ; $17B176 |
  JSR CODE_17AE1B                           ; $17B178 |
  INC $1148                                 ; $17B17B |
  LDX #$0C                                  ; $17B17E |
  LDA #$0000                                ; $17B180 |

CODE_17B183:
  STA $1152,x                               ; $17B183 |
  CLC                                       ; $17B186 |
  ADC #$000A                                ; $17B187 |
  DEX                                       ; $17B18A |
  DEX                                       ; $17B18B |
  BPL CODE_17B183                           ; $17B18C |
  INC $115E                                 ; $17B18E |
  SEP #$20                                  ; $17B191 |
  RTS                                       ; $17B193 |

  REP #$30                                  ; $17B194 |
  LDY #$000C                                ; $17B196 |

CODE_17B199:
  LDA $1160,y                               ; $17B199 |
  BEQ CODE_17B1D3                           ; $17B19C |
  LDA $1152,y                               ; $17B19E |
  DEC A                                     ; $17B1A1 |
  STA $1152,y                               ; $17B1A2 |
  BNE CODE_17B1D3                           ; $17B1A5 |
  LDX $116E,y                               ; $17B1A7 |
  LDA $ACB3,x                               ; $17B1AA |
  STA $1152,y                               ; $17B1AD |
  LDA $1160,y                               ; $17B1B0 |
  SEC                                       ; $17B1B3 |
  SBC #$0030                                ; $17B1B4 |
  STA $1160,y                               ; $17B1B7 |
  INX                                       ; $17B1BA |
  INX                                       ; $17B1BB |
  CPX #$0022                                ; $17B1BC |
  BCC CODE_17B1CF                           ; $17B1BF |
  LDA #$0000                                ; $17B1C1 |
  STA $1160,y                               ; $17B1C4 |
  STA $1152,y                               ; $17B1C7 |
  STA $116E,y                               ; $17B1CA |
  BRA CODE_17B1D3                           ; $17B1CD |

CODE_17B1CF:
  TXA                                       ; $17B1CF |
  STA $116E,y                               ; $17B1D0 |

CODE_17B1D3:
  DEY                                       ; $17B1D3 |
  DEY                                       ; $17B1D4 |
  BPL CODE_17B199                           ; $17B1D5 |
  LDA $1160                                 ; $17B1D7 |
  BNE CODE_17B1EB                           ; $17B1DA |
  LDA $116E                                 ; $17B1DC |
  CMP #$000C                                ; $17B1DF |
  BCC CODE_17B1EB                           ; $17B1E2 |
  INC $1148                                 ; $17B1E4 |
  SEP #$30                                  ; $17B1E7 |
  BRA CODE_17B20F                           ; $17B1E9 |

CODE_17B1EB:
  JSR CODE_17B24C                           ; $17B1EB |
  SEP #$10                                  ; $17B1EE |
  JSR CODE_17AD93                           ; $17B1F0 |
  JSR CODE_17AE1B                           ; $17B1F3 |
  SEP #$20                                  ; $17B1F6 |
  LDX #$0C                                  ; $17B1F8 |

CODE_17B1FA:
  LDA $116E,x                               ; $17B1FA |
  BNE CODE_17B20B                           ; $17B1FD |
  LDA $1152,x                               ; $17B1FF |
  DEC A                                     ; $17B202 |
  BNE CODE_17B20B                           ; $17B203 |
  LDA #$36                                  ; $17B205 |\ play sound #$0036
  JSL push_sound_queue                      ; $17B207 |/

CODE_17B20B:
  DEX                                       ; $17B20B |
  DEX                                       ; $17B20C |
  BPL CODE_17B1FA                           ; $17B20D |

CODE_17B20F:
  RTS                                       ; $17B20F |

  dw $0004, $0004, $0004, $0004             ; $17B210 |
  dw $0004, $0004                           ; $17B218 |

  db $04, $08, $10, $14, $14, $14           ; $17B21C |

  db $04, $01, $00, $FC, $FC, $FC           ; $17B222 |

  db $0C, $0D, $10, $14, $14, $14           ; $17B228 |

  db $14, $18, $20, $24, $24, $24           ; $17B22E |

  db $02, $04, $06, $0A, $0A, $0A           ; $17B234 |

  db $02, $04, $06, $0A, $0A, $0A           ; $17B23A |

  dw $3FCB, $3FDB, $3FCB, $3FDA             ; $17B240 |
  dw $3FCA, $3FCA                           ; $17B248 |

CODE_17B24C:
  LDX #$000C                                ; $17B24C |
  LDY !s_oam_next_free_slot_ptr             ; $17B24F |
  STY $00                                   ; $17B252 |

CODE_17B254:
  LDA $1160,x                               ; $17B254 |
  BEQ CODE_17B25C                           ; $17B257 |
  JMP CODE_17B319                           ; $17B259 |

CODE_17B25C:
  INC $1152,x                               ; $17B25C |
  LDA $116E,x                               ; $17B25F |
  TAY                                       ; $17B262 |
  CPY #$000C                                ; $17B263 |
  BCC CODE_17B26B                           ; $17B266 |
  JMP CODE_17B319                           ; $17B268 |

CODE_17B26B:
  LDA $1152,x                               ; $17B26B |
  CMP $B210,y                               ; $17B26E |
  BCC CODE_17B27F                           ; $17B271 |
  INC $116E,x                               ; $17B273 |
  INC $116E,x                               ; $17B276 |
  LDA #$0000                                ; $17B279 |
  STA $1152,x                               ; $17B27C |

CODE_17B27F:
  TYA                                       ; $17B27F |
  LSR A                                     ; $17B280 |
  TAY                                       ; $17B281 |
  LDA $B21C,y                               ; $17B282 |
  AND #$00FF                                ; $17B285 |
  STA $10                                   ; $17B288 |
  LDA $B222,y                               ; $17B28A |
  AND #$00FF                                ; $17B28D |
  STA $12                                   ; $17B290 |
  LDA $B228,y                               ; $17B292 |
  AND #$00FF                                ; $17B295 |
  STA $14                                   ; $17B298 |
  LDA $B22E,y                               ; $17B29A |
  AND #$00FF                                ; $17B29D |
  STA $16                                   ; $17B2A0 |
  LDA $B234,y                               ; $17B2A2 |
  AND #$00FF                                ; $17B2A5 |
  STA $18                                   ; $17B2A8 |
  LDA $B23A,y                               ; $17B2AA |
  AND #$00FF                                ; $17B2AD |
  STA $1A                                   ; $17B2B0 |
  TYA                                       ; $17B2B2 |
  ASL A                                     ; $17B2B3 |
  TAY                                       ; $17B2B4 |
  LDA $B240,y                               ; $17B2B5 |
  STA $0E                                   ; $17B2B8 |
  LDY $00                                   ; $17B2BA |
  LDA $117C,x                               ; $17B2BC |
  PHA                                       ; $17B2BF |
  SEC                                       ; $17B2C0 |
  SBC $10                                   ; $17B2C1 |
  STA $6000,y                               ; $17B2C3 |
  PLA                                       ; $17B2C6 |
  PHA                                       ; $17B2C7 |
  CLC                                       ; $17B2C8 |
  ADC $12                                   ; $17B2C9 |
  STA $6008,y                               ; $17B2CB |
  PLA                                       ; $17B2CE |
  PHA                                       ; $17B2CF |
  CLC                                       ; $17B2D0 |
  ADC $14                                   ; $17B2D1 |
  STA $6010,y                               ; $17B2D3 |
  PLA                                       ; $17B2D6 |
  CLC                                       ; $17B2D7 |
  ADC $16                                   ; $17B2D8 |
  STA $6018,y                               ; $17B2DA |
  LDA #$0028                                ; $17B2DD |
  STA $600A,y                               ; $17B2E0 |
  STA $6012,y                               ; $17B2E3 |
  CLC                                       ; $17B2E6 |
  ADC $18                                   ; $17B2E7 |
  STA $6002,y                               ; $17B2E9 |
  LDA #$0028                                ; $17B2EC |
  CLC                                       ; $17B2EF |
  ADC $1A                                   ; $17B2F0 |
  STA $601A,y                               ; $17B2F2 |
  LDA $0E                                   ; $17B2F5 |
  STA $6004,y                               ; $17B2F7 |
  STA $600C,y                               ; $17B2FA |
  STA $6014,y                               ; $17B2FD |
  STA $601C,y                               ; $17B300 |
  LDA #$4000                                ; $17B303 |
  STA $6006,y                               ; $17B306 |
  STA $600E,y                               ; $17B309 |
  STA $6016,y                               ; $17B30C |
  STA $601E,y                               ; $17B30F |
  TYA                                       ; $17B312 |
  CLC                                       ; $17B313 |
  ADC #$0020                                ; $17B314 |
  STA $00                                   ; $17B317 |

CODE_17B319:
  DEX                                       ; $17B319 |
  DEX                                       ; $17B31A |
  BMI CODE_17B320                           ; $17B31B |
  JMP CODE_17B254                           ; $17B31D |

CODE_17B320:
  LDA $00                                   ; $17B320 |
  STA !s_oam_next_free_slot_ptr             ; $17B322 |
  RTS                                       ; $17B325 |

  LDA #$08                                  ; $17B326 |
  STA $1112                                 ; $17B328 |
  ASL A                                     ; $17B32B |
  TAX                                       ; $17B32C |
  REP #$20                                  ; $17B32D |
  LDA $E257,x                               ; $17B32F |
  STA $1109                                 ; $17B332 |
  STZ $3D                                   ; $17B335 |
  LDA #$0080                                ; $17B337 |
  STA $3F                                   ; $17B33A |
  LDX !r_cur_world                          ; $17B33C |
  LDA $17E198,x                             ; $17B33F |
  TAY                                       ; $17B343 |
  LDA #$0A09                                ; $17B344 |
  STA $0317,y                               ; $17B347 |
  SEP #$20                                  ; $17B34A |
  JSL $108279                               ; $17B34C |
  LDX #$22                                  ; $17B350 |
  LDA !r_game_mode                          ; $17B352 |
  CMP #$28                                  ; $17B355 |
  BCC CODE_17B35F                           ; $17B357 |
  TAX                                       ; $17B359 |
  LDA #$0B                                  ; $17B35A |
  STA $1127                                 ; $17B35C |

CODE_17B35F:
  STX !r_game_mode                          ; $17B35F |
  RTS                                       ; $17B362 |

gamemode24:
  JSL $008259                               ; $17B363 | init OAM buffer
  LDA $1131                                 ; $17B367 |
  BNE CODE_17B373                           ; $17B36A |
  REP #$30                                  ; $17B36C |
  JSR CODE_17BC01                           ; $17B36E |
  BRA CODE_17B385                           ; $17B371 |

CODE_17B373:
  LDA $1127                                 ; $17B373 |
  BEQ CODE_17B37D                           ; $17B376 |
  JSR CODE_17B4E6                           ; $17B378 |
  BRA CODE_17B385                           ; $17B37B |

CODE_17B37D:
  LDA $1131                                 ; $17B37D |
  BEQ CODE_17B385                           ; $17B380 |
  JSR CODE_17B753                           ; $17B382 |

CODE_17B385:
  REP #$30                                  ; $17B385 |

CODE_17B387:
  JSR CODE_17BF7C                           ; $17B387 |

CODE_17B38A:
  REP #$20                                  ; $17B38A |
  LDA $6D                                   ; $17B38C |
  STA !s_bg1_cam_x                          ; $17B38E |
  LDX #$08                                  ; $17B391 |
  LDA #$B1EF                                ; $17B393 |
  JSL r_gsu_init_1                          ; $17B396 |
  SEP #$20                                  ; $17B39A |
  PLB                                       ; $17B39C |
  RTL                                       ; $17B39D |

CODE_17B39E:
  PHP                                       ; $17B39E |
  SEP #$30                                  ; $17B39F |
  PHB                                       ; $17B3A1 |
  LDA #$70                                  ; $17B3A2 |
  PHA                                       ; $17B3A4 |
  PLB                                       ; $17B3A5 |
  REP #$20                                  ; $17B3A6 |
  LDX #$00                                  ; $17B3A8 |

CODE_17B3AA:
  LDA $219A,x                               ; $17B3AA |
  STA $00                                   ; $17B3AD |
  LDA $21BA,x                               ; $17B3AF |
  STA $219A,x                               ; $17B3B2 |
  LDA $00                                   ; $17B3B5 |
  STA $21BA,x                               ; $17B3B7 |
  INX                                       ; $17B3BA |
  INX                                       ; $17B3BB |
  CPX #$06                                  ; $17B3BC |
  BCC CODE_17B3AA                           ; $17B3BE |
  SEP #$20                                  ; $17B3C0 |
  PLB                                       ; $17B3C2 |
  PLP                                       ; $17B3C3 |
  RTS                                       ; $17B3C4 |

  dw $BF63                                  ; $17B3C5 |
  dw $BF22                                  ; $17B3C7 |
  dw $C562                                  ; $17B3C9 |
  dw $C5C5                                  ; $17B3CB |

; map screen
gamemode22:
  JSL $008259                               ; $17B3CD |
  JSL $17C757                               ; $17B3D1 |
  JMP CODE_17B430                           ; $17B3D5 |

; Various debug code for world map
  LDA !r_cur_save_file                      ; $17B3D8 |
  CMP #$04                                  ; $17B3DB |
  BNE CODE_17B424                           ; $17B3DD |
  LDA !r_joy2_hi_press                      ; $17B3DF |\
  AND #$20                                  ; $17B3E2 | | If select button on controller 2
  BEQ CODE_17B3F8                           ; $17B3E4 |/
  LDA #$FF                                  ; $17B3E6 |
  STA $011A                                 ; $17B3E8 |
  INC !r_cur_world                          ; $17B3EB |
  INC !r_cur_world                          ; $17B3EE |
  LDA #$08                                  ; $17B3F1 |
  STA !r_game_mode                          ; $17B3F3 |
  BRA CODE_17B430                           ; $17B3F6 |

CODE_17B3F8:
  LDA !r_joy2_lo_press                      ; $17B3F8 |\
  CMP #$80                                  ; $17B3FB | | If A button on controller 2
  BNE CODE_17B424                           ; $17B3FD |/
  LDA #$1F                                  ; $17B3FF |
  STA !r_game_mode                          ; $17B401 |
  LDA #$E4                                  ; $17B404 |
  STA $0220                                 ; $17B406 |
  REP #$20                                  ; $17B409 |
  LDA #$6464                                ; $17B40B |
  STA !r_stage_scores                       ; $17B40E |
  STA $02BA                                 ; $17B411 |
  STA $02BC                                 ; $17B414 |
  STA $02BE                                 ; $17B417 |
  LDA #$F0F0                                ; $17B41A |
  STA $0317                                 ; $17B41D |
  SEP #$20                                  ; $17B420 |
  BRA CODE_17B430                           ; $17B422 |

CODE_17B424:
  LDA !r_joy2_lo_press                      ; $17B424 |\
  AND #$30                                  ; $17B427 | | If L/R buttons on controller 2
  BEQ CODE_17B430                           ; $17B429 |/
  LDA #$16                                  ; $17B42B |
  STA !r_game_mode                          ; $17B42D |
; END DEBUG CODE

CODE_17B430:
  LDX #$00                                  ; $17B430 |
  LDA $1118                                 ; $17B432 |
  BNE CODE_17B44F                           ; $17B435 |
  LDA $38                                   ; $17B437 |
  ORA $36                                   ; $17B439 |
  AND #$0F                                  ; $17B43B |
  BEQ CODE_17B44F                           ; $17B43D |
  LDA $1112                                 ; $17B43F |
  CMP #$08                                  ; $17B442 |
  BCS CODE_17B44F                           ; $17B444 |
  STA $112E                                 ; $17B446 |
  JSL $17C72B                               ; $17B449 |
  INX                                       ; $17B44D |
  INX                                       ; $17B44E |

CODE_17B44F:
  LDA $35                                   ; $17B44F |
  AND #$30                                  ; $17B451 |
  BEQ CODE_17B459                           ; $17B453 |
  LDX #$04                                  ; $17B455 |
  BRA CODE_17B45F                           ; $17B457 |

CODE_17B459:
  LDA $93                                   ; $17B459 |
  BEQ CODE_17B45F                           ; $17B45B |
  LDX #$06                                  ; $17B45D |

CODE_17B45F:
  JSR ($B3C5,x)                             ; $17B45F |
  LDA $098E                                 ; $17B462 |
  BEQ CODE_17B4BA                           ; $17B465 |
  DEC !r_reg_inidisp_mirror                 ; $17B467 |
  BNE CODE_17B4BA                           ; $17B46A |
  LDA $0201                                 ; $17B46C |
  EOR #$01                                  ; $17B46F |
  STA $0201                                 ; $17B471 |
  STZ !r_reg_inidisp_mirror                 ; $17B474 |
  STZ !r_reg_cgwsel_mirror                  ; $17B477 |
  LDA #$58                                  ; $17B47A |
  STA $0392                                 ; $17B47C |
  STZ !r_flowers_amount                     ; $17B47F |
  STZ $03B9                                 ; $17B482 |
  REP #$20                                  ; $17B485 |
  LDA !r_cur_stage                          ; $17B487 |
  CMP $112B                                 ; $17B48A |
  BEQ CODE_17B495                           ; $17B48D |
  STZ !r_death_count                        ; $17B48F |
  STZ !r_1ups_collected                     ; $17B492 |

CODE_17B495:
  SEP #$20                                  ; $17B495 |
  TAY                                       ; $17B497 |
  LDA !r_stage_scores,y                     ; $17B498 |
  STA $0381                                 ; $17B49B |
  LDY #$0C                                  ; $17B49E |\ level init gamemode
  STY !r_game_mode                          ; $17B4A0 |/ cause we have selected an icon
  LDA !r_cur_world                          ; $17B4A3 |\
  LSR A                                     ; $17B4A6 | | x = current world / 2 (so, regular world 0-5)
  TAX                                       ; $17B4A7 |/
  LDA !r_cur_stage                          ; $17B4A8 |\  if level icon loaded
  CMP map_bonus_icons,x                     ; $17B4AB | | doesn't match a bonus icon
  BNE CODE_17B4BA                           ; $17B4AE |/
  LDA #$2A                                  ; $17B4B0 |\ if we are bonus,
  STA !r_game_mode                          ; $17B4B2 |/ change gamemode to bonus init
  TXA                                       ; $17B4B5 |\
  ASL A                                     ; $17B4B6 | | and load bonus game ID from world value
  STA !r_bonus_game_type                    ; $17B4B7 |/

CODE_17B4BA:
  JMP CODE_17B38A                           ; $17B4BA |

map_bonus_icons:
  db $09, $15, $21, $2D, $39                ; $17B4BD | 9 worlds planned???? dang
  db $45, $51, $5D, $69                     ; $17B4C2 |

  dw $B509                                  ; $17B4C6 |
  dw $B519                                  ; $17B4C8 |
  dw $B519                                  ; $17B4CA |
  dw $B519                                  ; $17B4CC |
  dw $B538                                  ; $17B4CE |
  dw $B54C                                  ; $17B4D0 |
  dw $B56B                                  ; $17B4D2 |
  dw $B594                                  ; $17B4D4 |
  dw $B54C                                  ; $17B4D6 |
  dw $B56B                                  ; $17B4D8 |
  dw $B594                                  ; $17B4DA |
  dw $B56B                                  ; $17B4DC |
  dw $B5B9                                  ; $17B4DE |
  dw $B5FC                                  ; $17B4E0 |
  dw $B616                                  ; $17B4E2 |
  dw $B528                                  ; $17B4E4 |

CODE_17B4E6:
  LDA $1127                                 ; $17B4E6 |
  BEQ CODE_17B505                           ; $17B4E9 |
  ASL A                                     ; $17B4EB |
  TAX                                       ; $17B4EC |
  JSR ($B4C4,x)                             ; $17B4ED |
  LDA $1127                                 ; $17B4F0 |
  CMP #$06                                  ; $17B4F3 |
  BCC CODE_17B505                           ; $17B4F5 |
  LDA $1121                                 ; $17B4F7 |
  PHA                                       ; $17B4FA |
  STZ $1121                                 ; $17B4FB |
  JSR CODE_17B687                           ; $17B4FE |
  PLA                                       ; $17B501 |
  STA $1121                                 ; $17B502 |

CODE_17B505:
  STZ $1118                                 ; $17B505 |
  RTS                                       ; $17B508 |

CODE_17B509:
  DEX                                       ; $17B509 |
  DEX                                       ; $17B50A |
  JSL $17D87D                               ; $17B50B |
  LDA $1123                                 ; $17B50F |
  STA $111F                                 ; $17B512 |
  INC $1127                                 ; $17B515 |
  RTS                                       ; $17B518 |

  DEX                                       ; $17B519 |
  DEX                                       ; $17B51A |
  JSL $17D87D                               ; $17B51B |
  LDA $1118                                 ; $17B51F |
  BEQ CODE_17B527                           ; $17B522 |
  INC $1127                                 ; $17B524 |

CODE_17B527:
  RTS                                       ; $17B527 |

  LDA #$80                                  ; $17B528 |
  STA $3F                                   ; $17B52A |
  STZ $3D                                   ; $17B52C |
  LDA #$32                                  ; $17B52E |
  STA $7E5C19                               ; $17B530 |
  INC $1127                                 ; $17B534 |
  RTS                                       ; $17B537 |

  INC $1127                                 ; $17B538 |
  REP #$20                                  ; $17B53B |
  LDA #$0010                                ; $17B53D |
  STA $1110                                 ; $17B540 |
  JSR CODE_17B620                           ; $17B543 |
  SEP #$20                                  ; $17B546 |
  STZ $1130                                 ; $17B548 |
  RTS                                       ; $17B54B |

  LDA #$15                                  ; $17B54C |\ play sound #$0015
  JSL push_sound_queue                      ; $17B54E |/
  INC $1127                                 ; $17B552 |
  BRA CODE_17B56B                           ; $17B555 |

  dw $0008, $0006, $0006, $0004             ; $17B557 |
  dw $0004                                  ; $17B55F |

  dw $00F0, $00C0, $0150, $00F0             ; $17B561 |
  dw $0100                                  ; $17B569 |

CODE_17B56B:
  LDX $1130                                 ; $17B56B |
  REP #$20                                  ; $17B56E |
  LDA $1110                                 ; $17B570 |
  CLC                                       ; $17B573 |
  ADC $B557,x                               ; $17B574 |
  STA $1110                                 ; $17B577 |
  CMP $B561,x                               ; $17B57A |
  BCC CODE_17B58E                           ; $17B57D |
  LDA $B561,x                               ; $17B57F |
  STA $1110                                 ; $17B582 |
  INC $1127                                 ; $17B585 |
  INC $1130                                 ; $17B588 |
  INC $1130                                 ; $17B58B |

CODE_17B58E:
  JSR CODE_17B620                           ; $17B58E |
  SEP #$20                                  ; $17B591 |
  RTS                                       ; $17B593 |

  LDX $1130                                 ; $17B594 |
  REP #$20                                  ; $17B597 |
  LDA $1110                                 ; $17B599 |
  SEC                                       ; $17B59C |
  SBC $B557,x                               ; $17B59D |
  STA $1110                                 ; $17B5A0 |
  CMP $B561,x                               ; $17B5A3 |
  BCS CODE_17B5B3                           ; $17B5A6 |
  INC $1127                                 ; $17B5A8 |
  INC $1130                                 ; $17B5AB |
  INC $1130                                 ; $17B5AE |
  BRA CODE_17B5B6                           ; $17B5B1 |

CODE_17B5B3:
  JSR CODE_17B620                           ; $17B5B3 |

CODE_17B5B6:
  SEP #$20                                  ; $17B5B6 |
  RTS                                       ; $17B5B8 |

  REP #$20                                  ; $17B5B9 |
  LDA #$0100                                ; $17B5BB |
  STA $1110                                 ; $17B5BE |
  JSR CODE_17B620                           ; $17B5C1 |
  SEP #$20                                  ; $17B5C4 |
  JSR CODE_17B645                           ; $17B5C6 |
  LDA !r_cur_world                          ; $17B5C9 |
  LSR A                                     ; $17B5CC |
  TAX                                       ; $17B5CD |
  LDY !r_cur_stage                          ; $17B5CE |
  LDA #$80                                  ; $17B5D1 |
  STA !r_stages_unlocked,y                  ; $17B5D3 |
  PHY                                       ; $17B5D6 |
  TYA                                       ; $17B5D7 |
  INC A                                     ; $17B5D8 |
  SEC                                       ; $17B5D9 |
  SBC $E187,x                               ; $17B5DA |
  STA !r_map_icon_gfx,y                     ; $17B5DD |
  PLA                                       ; $17B5E0 |
  SEC                                       ; $17B5E1 |
  SBC $E187,x                               ; $17B5E2 |
  STA $1112                                 ; $17B5E5 |
  ASL A                                     ; $17B5E8 |
  TAX                                       ; $17B5E9 |
  LSR A                                     ; $17B5EA |
  STA $1123                                 ; $17B5EB |
  REP #$20                                  ; $17B5EE |
  LDA $E257,x                               ; $17B5F0 |
  STA $1109                                 ; $17B5F3 |
  SEP #$20                                  ; $17B5F6 |
  INC $1127                                 ; $17B5F8 |
  RTS                                       ; $17B5FB |

  INC $1127                                 ; $17B5FC |
  STZ $1128                                 ; $17B5FF |
  STZ $1128                                 ; $17B602 |
  STZ $1127                                 ; $17B605 |
  REP #$20                                  ; $17B608 |
  STZ $0990                                 ; $17B60A |
  STZ $0992                                 ; $17B60D |
  STZ $0994                                 ; $17B610 |
  SEP #$20                                  ; $17B613 |
  RTS                                       ; $17B615 |

  STZ $1110                                 ; $17B616 |
  STZ $1111                                 ; $17B619 |
  STZ $1127                                 ; $17B61C |
  RTS                                       ; $17B61F |

CODE_17B620:
  LDX !r_cur_stage                          ; $17B620 |

CODE_17B623:
  LDA $17DBAF,x                             ; $17B623 |
  STA !gsu_r1                               ; $17B627 |
  TXA                                       ; $17B62A |
  AND #$00FF                                ; $17B62B |
  STA !gsu_r3                               ; $17B62E |
  LDA $1110                                 ; $17B631 |
  STA !gsu_r6                               ; $17B634 |
  LDX #$08                                  ; $17B637 |
  LDA #$DBDE                                ; $17B639 |
  JSL r_gsu_init_1                          ; $17B63C | GSU init
  JSL $17D0C9                               ; $17B640 |
  RTS                                       ; $17B644 |

CODE_17B645:
  REP #$20                                  ; $17B645 |
  LDA !r_cur_stage                          ; $17B647 |
  ASL A                                     ; $17B64A |
  TAX                                       ; $17B64B |
  LDY !r_cur_world                          ; $17B64C |
  LDA !r_cur_stage                          ; $17B64F |
  SEC                                       ; $17B652 |
  SBC $E198,y                               ; $17B653 |
  STA $10                                   ; $17B656 |
  ASL A                                     ; $17B658 |
  TAY                                       ; $17B659 |
  LDA #$1400                                ; $17B65A |
  ORA $DC27,y                               ; $17B65D |
  STA $00                                   ; $17B660 |

CODE_17B662:
  LDA $DCEF,y                               ; $17B662 |
  LDY $1106                                 ; $17B665 |
  BNE CODE_17B66E                           ; $17B668 |
  CLC                                       ; $17B66A |
  ADC #$0380                                ; $17B66B |

CODE_17B66E:
  STA $0A                                   ; $17B66E |
  CLC                                       ; $17B670 |
  ADC #$0040                                ; $17B671 |
  STA $0C                                   ; $17B674 |
  CLC                                       ; $17B676 |
  ADC #$0040                                ; $17B677 |
  STA $0E                                   ; $17B67A |
  JSL $17DC23                               ; $17B67C |
  JSL $17E642                               ; $17B680 |
  SEP #$20                                  ; $17B684 |
  RTS                                       ; $17B686 |

CODE_17B687:
  LDA !r_cur_world                          ; $17B687 |
  LSR A                                     ; $17B68A |
  TAY                                       ; $17B68B |
  LDA !r_cur_stage                          ; $17B68C |
  SEC                                       ; $17B68F |
  SBC $E187,y                               ; $17B690 |

CODE_17B693:
  ASL A                                     ; $17B693 |
  TAX                                       ; $17B694 |
  LDA $E257,x                               ; $17B695 |
  STA $00                                   ; $17B698 |
  STZ $01                                   ; $17B69A |
  LDA $E258,x                               ; $17B69C |
  STA $02                                   ; $17B69F |
  STZ $03                                   ; $17B6A1 |
  REP #$30                                  ; $17B6A3 |
  LDX !r_cur_world                          ; $17B6A5 |
  LDA $17E198,x                             ; $17B6A8 |
  CLC                                       ; $17B6AC |
  ADC #$0008                                ; $17B6AD |
  STA $10                                   ; $17B6B0 |
  LDX !s_oam_next_free_slot_ptr             ; $17B6B2 |
  LDA $00                                   ; $17B6B5 |
  SEC                                       ; $17B6B7 |
  SBC #$0010                                ; $17B6B8 |
  STA $6000,x                               ; $17B6BB |
  STA $6010,x                               ; $17B6BE |
  CLC                                       ; $17B6C1 |
  ADC #$0010                                ; $17B6C2 |
  STA $6008,x                               ; $17B6C5 |
  STA $6018,x                               ; $17B6C8 |
  LDA $02                                   ; $17B6CB |
  SEC                                       ; $17B6CD |
  SBC #$0016                                ; $17B6CE |
  STA $6002,x                               ; $17B6D1 |
  STA $600A,x                               ; $17B6D4 |
  CLC                                       ; $17B6D7 |
  ADC #$0010                                ; $17B6D8 |
  STA $6012,x                               ; $17B6DB |
  STA $601A,x                               ; $17B6DE |
  LDA $1121                                 ; $17B6E1 |
  BEQ CODE_17B706                           ; $17B6E4 |
  STZ $00                                   ; $17B6E6 |
  LDY !r_cur_stage                          ; $17B6E8 |
  LDA !r_stage_scores,y                     ; $17B6EB |
  AND #$00FF                                ; $17B6EE |
  CMP #$001E                                ; $17B6F1 |
  BCS CODE_17B702                           ; $17B6F4 |
  CPY $10                                   ; $17B6F6 |
  BNE CODE_17B6FD                           ; $17B6F8 |
  TAY                                       ; $17B6FA |
  BEQ CODE_17B702                           ; $17B6FB |

CODE_17B6FD:
  LDA #$0200                                ; $17B6FD |
  STA $00                                   ; $17B700 |

CODE_17B702:
  LDA $00                                   ; $17B702 |
  BRA CODE_17B720                           ; $17B704 |

CODE_17B706:
  LDA $1148                                 ; $17B706 |
  BEQ CODE_17B71D                           ; $17B709 |
  LDY !r_cur_world                          ; $17B70B |
  LDA $114C                                 ; $17B70E |
  ASL A                                     ; $17B711 |
  TAY                                       ; $17B712 |
  LDA $DC4F,y                               ; $17B713 |
  LSR A                                     ; $17B716 |
  SEC                                       ; $17B717 |
  SBC #$0600                                ; $17B718 |
  BRA CODE_17B720                           ; $17B71B |

CODE_17B71D:
  LDA #$0400                                ; $17B71D |

CODE_17B720:
  ORA #$31CC                                ; $17B720 |
  PHA                                       ; $17B723 |
  STA $6004,x                               ; $17B724 |
  INC A                                     ; $17B727 |
  INC A                                     ; $17B728 |
  STA $600C,x                               ; $17B729 |
  PLA                                       ; $17B72C |
  CLC                                       ; $17B72D |
  ADC #$0020                                ; $17B72E |
  STA $6014,x                               ; $17B731 |
  INC A                                     ; $17B734 |
  INC A                                     ; $17B735 |
  STA $601C,x                               ; $17B736 |
  LDA #$4002                                ; $17B739 |
  STA $6006,x                               ; $17B73C |
  STA $600E,x                               ; $17B73F |
  STA $6016,x                               ; $17B742 |
  STA $601E,x                               ; $17B745 |
  TXA                                       ; $17B748 |
  CLC                                       ; $17B749 |
  ADC #$0020                                ; $17B74A |
  STA !s_oam_next_free_slot_ptr             ; $17B74D |
  SEP #$30                                  ; $17B750 |
  RTS                                       ; $17B752 |

CODE_17B753:
  LDA $1131                                 ; $17B753 |
  BEQ CODE_17B76F                           ; $17B756 |
  ASL A                                     ; $17B758 |
  CLC                                       ; $17B759 |
  ADC #$06                                  ; $17B75A |
  TAX                                       ; $17B75C |
  CMP #$10                                  ; $17B75D |
  BCS CODE_17B76F                           ; $17B75F |
  JSL $17D87D                               ; $17B761 |
  LDA $1118                                 ; $17B765 |
  BEQ CODE_17B77D                           ; $17B768 |
  INC $1131                                 ; $17B76A |
  BRA CODE_17B77D                           ; $17B76D |

CODE_17B76F:
  LDA #$22                                  ; $17B76F |
  STA !r_game_mode                          ; $17B771 |
  STZ $1131                                 ; $17B774 |
  LDA #$32                                  ; $17B777 |
  STA $7E5C19                               ; $17B779 |

CODE_17B77D:
  STZ $1118                                 ; $17B77D |
  RTS                                       ; $17B780 |

; X-coordinates for checkpoints along Yoshi's walking path after beating a level; 8 bytes per level
  dw $0038, $0000, $0000, $0000             ; $17B781 |
  dw $0070, $0076, $0000, $0000             ; $17B789 |
  dw $00A6, $0000, $0000, $0000             ; $17B791 |
  dw $00E0, $00EE, $0000, $0000             ; $17B799 |
  dw $0100, $0106, $0000, $0000             ; $17B7A1 |
  dw $0146, $0000, $0000, $0000             ; $17B7A9 |
  dw $0180, $0190, $0198, $0000             ; $17B7B1 |
  dw $0000, $0000, $0000, $0000             ; $17B7B9 |
  dw $003C, $0000, $0000, $0000             ; $17B7C1 |
  dw $0076, $0000, $0000, $0000             ; $17B7C9 |
  dw $00A8, $00AE, $0000, $0000             ; $17B7D1 |
  dw $00E0, $00EE, $0000, $0000             ; $17B7D9 |
  dw $012E, $0000, $0000, $0000             ; $17B7E1 |
  dw $0166, $0000, $0000, $0000             ; $17B7E9 |
  dw $019E, $0000, $0000, $0000             ; $17B7F1 |
  dw $0000, $0000, $0000, $0000             ; $17B7F9 |
  dw $0038, $004E, $0000, $0000             ; $17B801 |
  dw $0078, $007E, $0000, $0000             ; $17B809 |
  dw $00A4, $00A6, $0000, $0000             ; $17B811 |
  dw $00E8, $00F6, $0000, $0000             ; $17B819 |
  dw $0128, $0136, $0000, $0000             ; $17B821 |
  dw $0176, $0000, $0000, $0000             ; $17B829 |
  dw $01A8, $01AE, $0000, $0000             ; $17B831 |
  dw $0000, $0000, $0000, $0000             ; $17B839 |
  dw $0050, $0000, $0000, $0000             ; $17B841 |
  dw $007E, $0000, $0000, $0000             ; $17B849 |
  dw $00A6, $0000, $0000, $0000             ; $17B851 |
  dw $00F6, $0000, $0000, $0000             ; $17B859 |
  dw $0130, $0136, $0000, $0000             ; $17B861 |
  dw $0170, $0000, $0000, $0000             ; $17B869 |
  dw $01A8, $0000, $0000, $0000             ; $17B871 |
  dw $0000, $0000, $0000, $0000             ; $17B879 |
  dw $003E, $0000, $0000, $0000             ; $17B881 |
  dw $0070, $007E, $0000, $0000             ; $17B889 |
  dw $00AE, $0000, $0000, $0000             ; $17B891 |
  dw $00F6, $0000, $0000, $0000             ; $17B899 |
  dw $0128, $0136, $0000, $0000             ; $17B8A1 |
  dw $016E, $0000, $0000, $0000             ; $17B8A9 |
  dw $01A6, $0000, $0000, $0000             ; $17B8B1 |
  dw $0000, $0000, $0000, $0000             ; $17B8B9 |
  dw $0040, $0046, $0000, $0000             ; $17B8C1 |
  dw $0076, $0000, $0000, $0000             ; $17B8C9 |
  dw $00A6, $0000, $0000, $0000             ; $17B8D1 |
  dw $00F6, $0000, $0000, $0000             ; $17B8D9 |
  dw $0128, $012E, $0000, $0000             ; $17B8E1 |
  dw $015E, $0000, $0000, $0000             ; $17B8E9 |
  dw $0196, $0196, $0000, $0000             ; $17B8F1 |
  dw $0000, $0000, $0000, $0000             ; $17B8F9 |

; Y-coordinates for checkpoints along Yoshi's walking path after beating a level; 8 bytes per level
  dw $0078, $0000, $0000, $0000             ; $17B901 |
  dw $00A0, $00A0, $0000, $0000             ; $17B909 |
  dw $00A4, $0000, $0000, $0000             ; $17B911 |
  dw $00A4, $0090, $0000, $0000             ; $17B919 |
  dw $0084, $0070, $0000, $0000             ; $17B921 |
  dw $0088, $0000, $0000, $0000             ; $17B929 |
  dw $0088, $0088, $008C, $0000             ; $17B931 |
  dw $0000, $0000, $0000, $0000             ; $17B939 |
  dw $0090, $0000, $0000, $0000             ; $17B941 |
  dw $0098, $0000, $0000, $0000             ; $17B949 |
  dw $009C, $008C, $0000, $0000             ; $17B951 |
  dw $008C, $0098, $0000, $0000             ; $17B959 |
  dw $0098, $0000, $0000, $0000             ; $17B961 |
  dw $0088, $0000, $0000, $0000             ; $17B969 |
  dw $0084, $0000, $0000, $0000             ; $17B971 |
  dw $0000, $0000, $0000, $0000             ; $17B979 |
  dw $00A0, $0090, $0000, $0000             ; $17B981 |
  dw $0094, $0080, $0000, $0000             ; $17B989 |
  dw $0098, $00A0, $0000, $0000             ; $17B991 |
  dw $00AE, $00A0, $0000, $0000             ; $17B999 |
  dw $0098, $0080, $0000, $0000             ; $17B9A1 |
  dw $00A4, $0000, $0000, $0000             ; $17B9A9 |
  dw $00A0, $008E, $0000, $0000             ; $17B9B1 |
  dw $0000, $0000, $0000, $0000             ; $17B9B9 |
  dw $00A0, $0000, $0000, $0000             ; $17B9C1 |
  dw $0088, $0000, $0000, $0000             ; $17B9C9 |
  dw $00AE, $0000, $0000, $0000             ; $17B9D1 |
  dw $00A0, $0000, $0000, $0000             ; $17B9D9 |
  dw $009E, $00A2, $0000, $0000             ; $17B9E1 |
  dw $0098, $0000, $0000, $0000             ; $17B9E9 |
  dw $008A, $0000, $0000, $0000             ; $17B9F1 |
  dw $0000, $0000, $0000, $0000             ; $17B9F9 |
  dw $0078, $0000, $0000, $0000             ; $17BA01 |
  dw $0090, $0088, $0000, $0000             ; $17BA09 |
  dw $007C, $0000, $0000, $0000             ; $17BA11 |
  dw $0070, $0000, $0000, $0000             ; $17BA19 |
  dw $0088, $0088, $0000, $0000             ; $17BA21 |
  dw $0080, $0000, $0000, $0000             ; $17BA29 |
  dw $0078, $0000, $0000, $0000             ; $17BA31 |
  dw $0000, $0000, $0000, $0000             ; $17BA39 |
  dw $00A4, $00A0, $0000, $0000             ; $17BA41 |
  dw $0090, $0000, $0000, $0000             ; $17BA49 |
  dw $0090, $0000, $0000, $0000             ; $17BA51 |
  dw $0098, $0000, $0000, $0000             ; $17BA59 |
  dw $0094, $0098, $0000, $0000             ; $17BA61 |
  dw $0088, $0000, $0000, $0000             ; $17BA69 |
  dw $009C, $00A4, $0000, $0000             ; $17BA71 |
  dw $0000, $0000, $0000, $0000             ; $17BA79 |

  dw $0080, $0080, $0080, $0000             ; $17BA81 |
  dw $0080, $0080, $0080, $0080             ; $17BA89 |
  dw $0080, $0080, $0080, $0000             ; $17BA91 |
  dw $0080, $0080, $0000, $0000             ; $17BA99 |
  dw $0080, $0080, $0080, $0000             ; $17BAA1 |
  dw $0080, $8080, $0080, $0080             ; $17BAA9 |
  dw $8080, $0080, $0080, $0080             ; $17BAB1 |
  dw $0000, $0000, $0000, $0000             ; $17BAB9 |
  dw $0080, $0080, $0080, $0000             ; $17BAC1 |
  dw $0080, $0080, $0080, $0080             ; $17BAC9 |
  dw $0080, $0080, $0080, $0000             ; $17BAD1 |
  dw $0080, $0080, $0000, $0000             ; $17BAD9 |
  dw $0080, $0080, $0080, $0000             ; $17BAE1 |
  dw $0080, $8080, $0080, $0080             ; $17BAE9 |
  dw $8080, $0080, $0080, $0080             ; $17BAF1 |
  dw $0000, $0000, $0000, $0000             ; $17BAF9 |
  dw $0080, $0080, $0080, $0000             ; $17BB01 |
  dw $0080, $0080, $0080, $0080             ; $17BB09 |
  dw $0080, $0080, $0080, $0000             ; $17BB11 |
  dw $0080, $0080, $0000, $0000             ; $17BB19 |
  dw $0080, $0080, $0080, $0000             ; $17BB21 |
  dw $0080, $8080, $0080, $0080             ; $17BB29 |
  dw $8080, $0080, $0080, $0080             ; $17BB31 |
  dw $0000, $0000, $0000, $0000             ; $17BB39 |
  dw $0080, $0080, $0080, $0000             ; $17BB41 |
  dw $0080, $0080, $0080, $0080             ; $17BB49 |
  dw $0080, $0080, $0080, $0000             ; $17BB51 |
  dw $0080, $0080, $0000, $0000             ; $17BB59 |
  dw $0080, $0080, $0080, $0000             ; $17BB61 |
  dw $0080, $8080, $0080, $0080             ; $17BB69 |
  dw $8080, $0080, $0080, $0080             ; $17BB71 |
  dw $0000, $0000, $0000, $0000             ; $17BB79 |
  dw $0080, $0080, $0080, $0000             ; $17BB81 |
  dw $0080, $0080, $0080, $0080             ; $17BB89 |
  dw $0080, $0080, $0080, $0000             ; $17BB91 |
  dw $0080, $0080, $0000, $0000             ; $17BB99 |
  dw $0080, $0080, $0080, $0000             ; $17BBA1 |
  dw $0080, $8080, $0080, $0080             ; $17BBA9 |
  dw $8080, $0080, $0080, $0080             ; $17BBB1 |
  dw $0000, $0000, $0000, $0000             ; $17BBB9 |
  dw $0080, $0080, $0080, $0000             ; $17BBC1 |
  dw $0080, $0080, $0080, $0080             ; $17BBC9 |
  dw $0080, $0080, $0080, $0000             ; $17BBD1 |
  dw $0080, $0080, $0000, $0000             ; $17BBD9 |
  dw $0080, $0080, $0080, $0000             ; $17BBE1 |
  dw $0080, $8080, $0080, $0080             ; $17BBE9 |
  dw $8080, $0080, $0080, $0080             ; $17BBF1 |
  dw $0000, $0000, $0000, $0000             ; $17BBF9 |

CODE_17BC01:
  LDA $95                                   ; $17BC01 |
  ASL A                                     ; $17BC03 |
  TAX                                       ; $17BC04 |
  JMP ($BC10,x)                             ; $17BC05 |

CODE_17BC08:
  INC $1131                                 ; $17BC08 |
  INC $89                                   ; $17BC0B |
  INC $89                                   ; $17BC0D |
  RTS                                       ; $17BC0F |

  dw $BC18                                  ; $17BC10 |
  dw $BD13                                  ; $17BC12 |
  dw $BD42                                  ; $17BC14 |
  dw $BD9A                                  ; $17BC16 |

  LDY $91                                   ; $17BC18 |
  LDA $B781,y                               ; $17BC1A |
  STA !gsu_r1                               ; $17BC1D |
  LDA $B901,y                               ; $17BC20 |
  STA !gsu_r2                               ; $17BC23 |
  LDA $76                                   ; $17BC26 |
  STA !gsu_r3                               ; $17BC28 |
  LDA $72                                   ; $17BC2B |
  STA !gsu_r4                               ; $17BC2D |
  LDA $BA81,y                               ; $17BC30 |
  AND #$7FFF                                ; $17BC33 |
  STA !gsu_r6                               ; $17BC36 |
  PHY                                       ; $17BC39 |
  SEP #$10                                  ; $17BC3A |
  LDX #$09                                  ; $17BC3C |
  LDA #$907C                                ; $17BC3E |
  JSL r_gsu_init_1                          ; $17BC41 | GSU init
  REP #$10                                  ; $17BC45 |
  PLY                                       ; $17BC47 |
  LDX #$0000                                ; $17BC48 |
  LDA !gsu_r1                               ; $17BC4B |
  BPL CODE_17BC51                           ; $17BC4E |
  DEX                                       ; $17BC50 |

CODE_17BC51:
  CLC                                       ; $17BC51 |
  ADC !r_cam_moving_dir_y                   ; $17BC52 |
  STA $00                                   ; $17BC55 |
  TXA                                       ; $17BC57 |
  ADC !r_new_column_flag                    ; $17BC58 |
  STA $02                                   ; $17BC5B |
  LDX #$0000                                ; $17BC5D |
  LDA !gsu_r2                               ; $17BC60 |
  BPL CODE_17BC66                           ; $17BC63 |
  DEX                                       ; $17BC65 |

CODE_17BC66:
  CLC                                       ; $17BC66 |
  ADC $0071                                 ; $17BC67 |
  STA $04                                   ; $17BC6A |
  TXA                                       ; $17BC6C |
  ADC !r_cam_moving_dir_x                   ; $17BC6D |
  STA $06                                   ; $17BC70 |
  LDX #$0000                                ; $17BC72 |
  LDA $01                                   ; $17BC75 |
  SEC                                       ; $17BC77 |
  SBC $B781,y                               ; $17BC78 |
  BCC CODE_17BC95                           ; $17BC7B |
  EOR !gsu_r1                               ; $17BC7D |
  BMI CODE_17BC95                           ; $17BC80 |
  LDA $B781,y                               ; $17BC82 |
  XBA                                       ; $17BC85 |
  STA $08                                   ; $17BC86 |
  AND #$FF00                                ; $17BC88 |
  STA $00                                   ; $17BC8B |
  LDA $08                                   ; $17BC8D |
  AND #$00FF                                ; $17BC8F |
  STA $02                                   ; $17BC92 |
  INX                                       ; $17BC94 |

CODE_17BC95:
  LDA $00                                   ; $17BC95 |
  STA !r_cam_moving_dir_y                   ; $17BC97 |
  LDA $02                                   ; $17BC9A |
  STA !r_new_column_flag                    ; $17BC9C |
  LDA $05                                   ; $17BC9F |
  SEC                                       ; $17BCA1 |
  SBC $B901,y                               ; $17BCA2 |
  BCC CODE_17BCBF                           ; $17BCA5 |
  EOR !gsu_r2                               ; $17BCA7 |
  BMI CODE_17BCBF                           ; $17BCAA |
  LDA $B901,y                               ; $17BCAC |
  XBA                                       ; $17BCAF |
  STA $08                                   ; $17BCB0 |
  AND #$FF00                                ; $17BCB2 |
  STA $04                                   ; $17BCB5 |
  LDA $08                                   ; $17BCB7 |
  AND #$00FF                                ; $17BCB9 |
  STA $06                                   ; $17BCBC |
  INX                                       ; $17BCBE |

CODE_17BCBF:
  LDA $04                                   ; $17BCBF |
  STA $0071                                 ; $17BCC1 |
  LDA $06                                   ; $17BCC4 |
  STA !r_cam_moving_dir_x                   ; $17BCC6 |
  CPX #$0002                                ; $17BCC9 |
  BNE CODE_17BCEF                           ; $17BCCC |
  INY                                       ; $17BCCE |
  INY                                       ; $17BCCF |
  STY $91                                   ; $17BCD0 |
  TYA                                       ; $17BCD2 |
  AND #$0007                                ; $17BCD3 |
  BEQ CODE_17BCE0                           ; $17BCD6 |
  LDA $B781,y                               ; $17BCD8 |
  ORA $B901,y                               ; $17BCDB |
  BNE CODE_17BCEF                           ; $17BCDE |

CODE_17BCE0:
  LDA #$0001                                ; $17BCE0 |
  STA $95                                   ; $17BCE3 |
  LDA #$0002                                ; $17BCE5 |
  STA $97                                   ; $17BCE8 |
  LDA #$0008                                ; $17BCEA |
  STA $99                                   ; $17BCED |

CODE_17BCEF:
  LDA $76                                   ; $17BCEF |

CODE_17BCF1:
  LDX #$0000                                ; $17BCF1 |
  SEC                                       ; $17BCF4 |
  SBC #$0074                                ; $17BCF5 |
  BMI CODE_17BD03                           ; $17BCF8 |
  TAX                                       ; $17BCFA |
  CMP #$0100                                ; $17BCFB |
  BCC CODE_17BD03                           ; $17BCFE |
  LDX #$0100                                ; $17BD00 |

CODE_17BD03:
  TXA                                       ; $17BD03 |
  STA $69                                   ; $17BD04 |
  STA $6D                                   ; $17BD06 |
  STA $79                                   ; $17BD08 |
  STA $41                                   ; $17BD0A |
  RTS                                       ; $17BD0C |

  dw $0008, $0008, $0000                    ; $17BD0D |

  DEC $99                                   ; $17BD13 |
  BNE CODE_17BD41                           ; $17BD15 |
  INC $9B                                   ; $17BD17 |
  LDA $9B                                   ; $17BD19 |
  ASL A                                     ; $17BD1B |
  TAY                                       ; $17BD1C |
  LDA $BD0D,y                               ; $17BD1D |
  STA $99                                   ; $17BD20 |
  BNE CODE_17BD41                           ; $17BD22 |
  LDA $72                                   ; $17BD24 |
  STA $A3                                   ; $17BD26 |
  LDA $76                                   ; $17BD28 |
  STA $AB                                   ; $17BD2A |
  STZ $9D                                   ; $17BD2C |
  LDA #$FFFC                                ; $17BD2E |
  STA $9F                                   ; $17BD31 |
  LDA #$E000                                ; $17BD33 |
  STA $A5                                   ; $17BD36 |
  STZ $A7                                   ; $17BD38 |
  INC $95                                   ; $17BD3A |
  LDA #$0003                                ; $17BD3C |
  STA $97                                   ; $17BD3F |

CODE_17BD41:
  RTS                                       ; $17BD41 |

  LDA $A5                                   ; $17BD42 |
  CLC                                       ; $17BD44 |
  ADC $A9                                   ; $17BD45 |
  STA $A9                                   ; $17BD47 |
  LDA $AB                                   ; $17BD49 |
  ADC $A7                                   ; $17BD4B |
  STA $AB                                   ; $17BD4D |
  LDA $9D                                   ; $17BD4F |
  CLC                                       ; $17BD51 |
  ADC #$4000                                ; $17BD52 |
  STA $9D                                   ; $17BD55 |
  LDA $9F                                   ; $17BD57 |
  ADC #$0000                                ; $17BD59 |
  STA $9F                                   ; $17BD5C |
  LDA $9D                                   ; $17BD5E |
  CLC                                       ; $17BD60 |
  ADC $A1                                   ; $17BD61 |
  STA $A1                                   ; $17BD63 |
  LDA $A3                                   ; $17BD65 |
  ADC $9F                                   ; $17BD67 |
  STA $A3                                   ; $17BD69 |
  LDA $A3                                   ; $17BD6B |
  CMP $AD                                   ; $17BD6D |
  BCC CODE_17BD95                           ; $17BD6F |
  LDY $72                                   ; $17BD71 |
  LDX $76                                   ; $17BD73 |
  LDA $AD                                   ; $17BD75 |
  STA $72                                   ; $17BD77 |
  LDA $AF                                   ; $17BD79 |
  STA $76                                   ; $17BD7B |
  STY $AD                                   ; $17BD7D |
  STX $AF                                   ; $17BD7F |
  LDA #$0004                                ; $17BD81 |
  STA $97                                   ; $17BD84 |
  STZ $9B                                   ; $17BD86 |
  LDA #$0010                                ; $17BD88 |
  STA $99                                   ; $17BD8B |
  INC $95                                   ; $17BD8D |
  JSR CODE_17B39E                           ; $17BD8F |
  JMP CODE_17BCEF                           ; $17BD92 |

CODE_17BD95:
  LDA $AB                                   ; $17BD95 |
  JMP CODE_17BCF1                           ; $17BD97 |
  DEC $99                                   ; $17BD9A |
  BNE CODE_17BDAD                           ; $17BD9C |
  STZ $9B                                   ; $17BD9E |
  LDA #$0005                                ; $17BDA0 |
  STA $97                                   ; $17BDA3 |
  LDA #$0008                                ; $17BDA5 |
  STA $99                                   ; $17BDA8 |
  JMP CODE_17BC08                           ; $17BDAA |

CODE_17BDAD:
  RTS                                       ; $17BDAD |

; x-coordinate of each yoshi on the map (8 per world)
  dw $0030, $0058, $0098, $00C8, $0110, $0128, $0168, $01B8; $17BDAE |
  dw $0030, $0060, $0098, $00D0, $0110, $0150, $0188, $01C0; $17BDBE |
  dw $0030, $0070, $00A0, $00C8, $0118, $0158, $0198, $01D0; $17BDCE |
  dw $0030, $0070, $00A0, $00C8, $0118, $0158, $0190, $01C8; $17BDDE |
  dw $0030, $0060, $00A0, $00D0, $0118, $0158, $0190, $01C8; $17BDEE |
  dw $0030, $0068, $0098, $00C8, $0118, $0150, $0180, $01B8; $17BDFE |

; y-coordinate of each yoshi on the map (8 per world)
  dw $009C, $007C, $00A4, $00A8, $0094, $0074, $008C, $0090; $17BE0E |
  dw $00A4, $0094, $009C, $0090, $009C, $009C, $008C, $008C; $17BE1E |
  dw $00AC, $0094, $0084, $00A4, $00A4, $0084, $00AC, $0090; $17BE2E |
  dw $009C, $00A4, $008C, $00B0, $00A4, $00A4, $009C, $008C; $17BE3E |
  dw $00AC, $007C, $008C, $0080, $0074, $008C, $0084, $007C; $17BE4E |
  dw $00AC, $00A4, $0094, $0094, $009C, $009C, $008C, $00A8; $17BE5E |

  dw $0001, $0001, $0001, $0001             ; $17BE6E |
  dw $0001, $0001, $0000, $0001             ; $17BE76 |
  dw $0001, $0001, $0001, $0001             ; $17BE7E |
  dw $0001, $0001, $0000, $0001             ; $17BE86 |
  dw $0001, $0001, $0001, $0001             ; $17BE8E |
  dw $0001, $0001, $0000, $0001             ; $17BE96 |
  dw $0001, $0001, $0001, $0001             ; $17BE9E |
  dw $0001, $0001, $0000, $0001             ; $17BEA6 |
  dw $0001, $0001, $0001, $0001             ; $17BEAE |
  dw $0001, $0001, $0000, $0001             ; $17BEB6 |
  dw $0001, $0001, $0001, $0001             ; $17BEBE |
  dw $0001, $0001, $0000, $0001             ; $17BEC6 |
  dw $0002, $FFFE                           ; $17BECE |

; inactive yoshi tilemaps (worlds 1-5)
  dw $3D60, $3F66, $3960, $3F60             ; $17BED2 |
  dw $3966, $3D66, $3B66, $3B60             ; $17BEDA |

; inactive yoshi tilemaps (world 6)
  dw $3D60, $3F66, $3960, $3F60             ; $17BEE2 |
  dw $3966, $3D66, $3B66, $3D60             ; $17BEEA |

; inactive yoshi animation indices
  dw $0000, $0004, $0002, $0004             ; $17BEF2 |

  dw $390F, $391F, $392F, $393F             ; $17BEFA |
  dw $393B, $393C, $393D, $393E             ; $17BF02 |

  dw $0000, $0001, $0002, $0001             ; $17BF0A |

  dw $2900, $2903, $2906, $2903             ; $17BF12 |

; baby mario tilemap
  dw $2D4A, $2D4C, $2D4A, $2D4C             ; $17BF1A |

  REP #$30                                  ; $17BF22 |
  LDA $1125                                 ; $17BF24 |
  ASL A                                     ; $17BF27 |
  ASL A                                     ; $17BF28 |
  ORA $112E                                 ; $17BF29 |
  ASL A                                     ; $17BF2C |
  STA $89                                   ; $17BF2D |
  TAY                                       ; $17BF2F |
  LDX #$0000                                ; $17BF30 |
  LDA $BE0E,y                               ; $17BF33 |
  SEC                                       ; $17BF36 |
  SBC #$0004                                ; $17BF37 |
  STA $72                                   ; $17BF3A |
  LDA $BDAE,y                               ; $17BF3C |
  SEC                                       ; $17BF3F |
  SBC #$0008                                ; $17BF40 |
  STA $76                                   ; $17BF43 |
  SEC                                       ; $17BF45 |
  SBC #$0074                                ; $17BF46 |
  BMI CODE_17BF54                           ; $17BF49 |
  TAX                                       ; $17BF4B |
  CMP #$0100                                ; $17BF4C |
  BCC CODE_17BF54                           ; $17BF4F |
  LDX #$0100                                ; $17BF51 |

CODE_17BF54:
  STX $79                                   ; $17BF54 |
  LDA #$0000                                ; $17BF56 |
  CPX $6D                                   ; $17BF59 |
  BCS CODE_17BF5F                           ; $17BF5B |
  INC A                                     ; $17BF5D |
  INC A                                     ; $17BF5E |

CODE_17BF5F:
  STA $7B                                   ; $17BF5F |
  STZ $97                                   ; $17BF61 |
  REP #$30                                  ; $17BF63 |
  LDA $6D                                   ; $17BF65 |
  CMP $79                                   ; $17BF67 |
  BEQ CODE_17BF7C                           ; $17BF69 |
  LDX $7B                                   ; $17BF6B |
  LDA $6D                                   ; $17BF6D |
  CLC                                       ; $17BF6F |
  ADC $BECE,x                               ; $17BF70 |
  AND #$FFFE                                ; $17BF73 |
  STA $69                                   ; $17BF76 |
  STA $6D                                   ; $17BF78 |
  STA $41                                   ; $17BF7A |

CODE_17BF7C:
  JSL $17E309                               ; $17BF7C |
  LDA $97                                   ; $17BF80 |
  ASL A                                     ; $17BF82 |
  TAX                                       ; $17BF83 |
  JMP ($BF87,x)                             ; $17BF84 |

  dw $BF93                                  ; $17BF87 |
  dw $C0E7                                  ; $17BF89 |
  dw $C27C                                  ; $17BF8B |
  dw $C339                                  ; $17BF8D |
  dw $C3EB                                  ; $17BF8F |
  dw $C475                                  ; $17BF91 |

  DEC $7D                                   ; $17BF93 |
  BNE CODE_17BFA4                           ; $17BF95 |
  LDA #$0009                                ; $17BF97 |
  STA $7D                                   ; $17BF9A |
  LDA $81                                   ; $17BF9C |
  INC A                                     ; $17BF9E |
  AND #$0003                                ; $17BF9F |
  STA $81                                   ; $17BFA2 |

CODE_17BFA4:
  LDX !s_oam_next_free_slot_ptr             ; $17BFA4 |
  LDA $76                                   ; $17BFA7 |
  SEC                                       ; $17BFA9 |
  SBC $6D                                   ; $17BFAA |
  STA $6000,x                               ; $17BFAC |
  STA $6010,x                               ; $17BFAF |
  CLC                                       ; $17BFB2 |
  ADC #$0008                                ; $17BFB3 |
  STA $6008,x                               ; $17BFB6 |
  CLC                                       ; $17BFB9 |
  ADC #$0008                                ; $17BFBA |
  STA $6020,x                               ; $17BFBD |
  CLC                                       ; $17BFC0 |
  ADC #$0004                                ; $17BFC1 |
  STA $6018,x                               ; $17BFC4 |
  LDA $72                                   ; $17BFC7 |
  SEC                                       ; $17BFC9 |
  SBC $6F                                   ; $17BFCA |
  STA $600A,x                               ; $17BFCC |
  CLC                                       ; $17BFCF |
  ADC #$0001                                ; $17BFD0 |
  STA $6002,x                               ; $17BFD3 |
  CLC                                       ; $17BFD6 |
  ADC #$0003                                ; $17BFD7 |
  CLC                                       ; $17BFDA |
  ADC #$0002                                ; $17BFDB |
  STA $6022,x                               ; $17BFDE |
  CLC                                       ; $17BFE1 |
  ADC #$0002                                ; $17BFE2 |
  STA $6012,x                               ; $17BFE5 |
  CLC                                       ; $17BFE8 |
  ADC #$0001                                ; $17BFE9 |
  STA $601A,x                               ; $17BFEC |
  LDA $81                                   ; $17BFEF |
  ASL A                                     ; $17BFF1 |
  TAY                                       ; $17BFF2 |
  LDA $BF12,y                               ; $17BFF3 |
  STA $02                                   ; $17BFF6 |
  INC A                                     ; $17BFF8 |
  STA $600C,x                               ; $17BFF9 |
  LDA $02                                   ; $17BFFC |
  ORA #$0010                                ; $17BFFE |
  STA $6014,x                               ; $17C001 |
  LDA $BF1A,y                               ; $17C004 |
  STA $6004,x                               ; $17C007 |
  LDA $112E                                 ; $17C00A |
  ASL A                                     ; $17C00D |
  TAY                                       ; $17C00E |
  LDA $BEFA,y                               ; $17C00F |
  STA $601C,x                               ; $17C012 |
  LDA #$3D6E                                ; $17C015 |
  STA $6024,x                               ; $17C018 |
  LDA #$0400                                ; $17C01B |
  STA $601E,x                               ; $17C01E |
  INC A                                     ; $17C021 |
  INC A                                     ; $17C022 |
  STA $6006,x                               ; $17C023 |
  STA $600E,x                               ; $17C026 |
  STA $6016,x                               ; $17C029 |
  STA $6026,x                               ; $17C02C |
  LDA !r_frame_counter_global_dp            ; $17C02F |
  AND #$0018                                ; $17C031 |
  LSR A                                     ; $17C034 |
  LSR A                                     ; $17C035 |
  TAY                                       ; $17C036 |
  LDA $BEF2,y                               ; $17C037 |
  STA $04                                   ; $17C03A |
  LDA $BF0A,y                               ; $17C03C |
  STA $06                                   ; $17C03F |
  TXA                                       ; $17C041 |
  CLC                                       ; $17C042 |
  ADC #$0028                                ; $17C043 |
  TAX                                       ; $17C046 |
  LDA $1125                                 ; $17C047 |
  ASL A                                     ; $17C04A |
  ASL A                                     ; $17C04B |
  ASL A                                     ; $17C04C |
  TAY                                       ; $17C04D |
  STA $0E                                   ; $17C04E |
  STZ $02                                   ; $17C050 |

CODE_17C052:
  LDA $02                                   ; $17C052 |
  CMP $112E                                 ; $17C054 |
  BNE CODE_17C05C                           ; $17C057 |
  JMP CODE_17C0CF                           ; $17C059 |

CODE_17C05C:
  LDA $BDAE,y                               ; $17C05C |
  SEC                                       ; $17C05F |
  SBC $6D                                   ; $17C060 |
  SEC                                       ; $17C062 |
  SBC #$0008                                ; $17C063 |
  STA $6000,x                               ; $17C066 |
  CLC                                       ; $17C069 |
  ADC #$0005                                ; $17C06A |
  STA $6010,x                               ; $17C06D |
  CLC                                       ; $17C070 |
  ADC #$0004                                ; $17C071 |
  STA $6008,x                               ; $17C074 |
  LDA $BE0E,y                               ; $17C077 |
  SEC                                       ; $17C07A |
  SBC $6F                                   ; $17C07B |
  CLC                                       ; $17C07D |
  ADC #$0004                                ; $17C07E |
  STA $6002,x                               ; $17C081 |
  SEC                                       ; $17C084 |
  SBC $06                                   ; $17C085 |
  SEC                                       ; $17C087 |
  SBC #$000D                                ; $17C088 |
  STA $6012,x                               ; $17C08B |
  CLC                                       ; $17C08E |
  ADC #$0003                                ; $17C08F |
  STA $600A,x                               ; $17C092 |
  LDA $02                                   ; $17C095 |
  ASL A                                     ; $17C097 |
  TAY                                       ; $17C098 |
  LDA $BEFA,y                               ; $17C099 |
  STA $600C,x                               ; $17C09C |
  LDA #$3B6E                                ; $17C09F |
  STA $6014,x                               ; $17C0A2 |
  LDA !r_cur_world                          ; $17C0A5 |
  CMP #$000A                                ; $17C0A8 |
  BNE CODE_17C0B2                           ; $17C0AB |
  LDA $BEE2,y                               ; $17C0AD |
  BRA CODE_17C0B5                           ; $17C0B0 |

CODE_17C0B2:
  LDA $BED2,y                               ; $17C0B2 |

CODE_17C0B5:
  CLC                                       ; $17C0B5 |
  ADC $04                                   ; $17C0B6 |
  STA $6004,x                               ; $17C0B8 |
  LDA #$0000                                ; $17C0BB |
  STA $600E,x                               ; $17C0BE |
  INC A                                     ; $17C0C1 |
  INC A                                     ; $17C0C2 |
  STA $6006,x                               ; $17C0C3 |
  STA $6016,x                               ; $17C0C6 |
  TXA                                       ; $17C0C9 |
  CLC                                       ; $17C0CA |
  ADC #$0018                                ; $17C0CB |
  TAX                                       ; $17C0CE |

CODE_17C0CF:
  LDY $0E                                   ; $17C0CF |
  INY                                       ; $17C0D1 |
  INY                                       ; $17C0D2 |
  STY $0E                                   ; $17C0D3 |
  INC $02                                   ; $17C0D5 |
  LDA $02                                   ; $17C0D7 |
  CMP #$0008                                ; $17C0D9 |
  BEQ CODE_17C0E1                           ; $17C0DC |
  JMP CODE_17C052                           ; $17C0DE |

CODE_17C0E1:
  STX !s_oam_next_free_slot_ptr             ; $17C0E1 |
  SEP #$30                                  ; $17C0E4 |
  RTS                                       ; $17C0E6 |

  DEC $7D                                   ; $17C0E7 |
  BNE CODE_17C0F8                           ; $17C0E9 |
  LDA #$0009                                ; $17C0EB |
  STA $7D                                   ; $17C0EE |
  LDA $81                                   ; $17C0F0 |
  INC A                                     ; $17C0F2 |
  AND #$0003                                ; $17C0F3 |
  STA $81                                   ; $17C0F6 |

CODE_17C0F8:
  LDX !s_oam_next_free_slot_ptr             ; $17C0F8 |
  LDA $76                                   ; $17C0FB |
  SEC                                       ; $17C0FD |
  SBC $6D                                   ; $17C0FE |
  STA $6000,x                               ; $17C100 |
  STA $6010,x                               ; $17C103 |
  CLC                                       ; $17C106 |
  ADC #$0008                                ; $17C107 |
  STA $6008,x                               ; $17C10A |
  LDA $72                                   ; $17C10D |
  SEC                                       ; $17C10F |
  SBC $6F                                   ; $17C110 |
  STA $600A,x                               ; $17C112 |
  CLC                                       ; $17C115 |
  ADC #$0001                                ; $17C116 |
  STA $6002,x                               ; $17C119 |
  CLC                                       ; $17C11C |
  ADC #$0007                                ; $17C11D |
  STA $6012,x                               ; $17C120 |
  LDA $81                                   ; $17C123 |
  ASL A                                     ; $17C125 |
  TAY                                       ; $17C126 |
  LDA $BF12,y                               ; $17C127 |
  STA $02                                   ; $17C12A |
  INC A                                     ; $17C12C |
  STA $600C,x                               ; $17C12D |
  LDA $02                                   ; $17C130 |
  ORA #$0010                                ; $17C132 |
  STA $6014,x                               ; $17C135 |
  LDA $BF1A,y                               ; $17C138 |
  STA $6004,x                               ; $17C13B |
  LDA #$0402                                ; $17C13E |
  STA $6006,x                               ; $17C141 |
  STA $600E,x                               ; $17C144 |
  STA $6016,x                               ; $17C147 |
  LDA $AF                                   ; $17C14A |
  SEC                                       ; $17C14C |
  SBC $6D                                   ; $17C14D |
  STA $6018,x                               ; $17C14F |
  CLC                                       ; $17C152 |
  ADC #$0008                                ; $17C153 |
  STA $6020,x                               ; $17C156 |
  LDA $AD                                   ; $17C159 |
  SEC                                       ; $17C15B |
  SBC $6F                                   ; $17C15C |
  STA $601A,x                               ; $17C15E |
  CLC                                       ; $17C161 |
  ADC #$0008                                ; $17C162 |
  STA $6022,x                               ; $17C165 |
  LDA #$6B01                                ; $17C168 |
  STA $601C,x                               ; $17C16B |
  LDA #$6B10                                ; $17C16E |
  STA $6024,x                               ; $17C171 |
  LDA #$0402                                ; $17C174 |
  STA $601E,x                               ; $17C177 |
  STA $6026,x                               ; $17C17A |
  TXA                                       ; $17C17D |
  CLC                                       ; $17C17E |
  ADC #$0028                                ; $17C17F |
  TAX                                       ; $17C182 |

CODE_17C183:
  LDA !r_frame_counter_global_dp            ; $17C183 |
  AND #$0018                                ; $17C185 |
  LSR A                                     ; $17C188 |
  LSR A                                     ; $17C189 |
  TAY                                       ; $17C18A |
  LDA $BEF2,y                               ; $17C18B |
  STA $04                                   ; $17C18E |
  LDA $BF0A,y                               ; $17C190 |
  STA $06                                   ; $17C193 |
  LDA $1125                                 ; $17C195 |
  ASL A                                     ; $17C198 |
  ASL A                                     ; $17C199 |
  ASL A                                     ; $17C19A |
  TAY                                       ; $17C19B |
  STY $0E                                   ; $17C19C |
  STZ $02                                   ; $17C19E |

CODE_17C1A0:
  LDA $BDAE,y                               ; $17C1A0 |
  SEC                                       ; $17C1A3 |
  SBC $6D                                   ; $17C1A4 |
  STA $08                                   ; $17C1A6 |
  LDA $BE0E,y                               ; $17C1A8 |
  SEC                                       ; $17C1AB |
  SBC $6F                                   ; $17C1AC |
  STA $0A                                   ; $17C1AE |
  LDA $B1                                   ; $17C1B0 |
  CMP $02                                   ; $17C1B2 |
  BEQ CODE_17C1BB                           ; $17C1B4 |
  INC A                                     ; $17C1B6 |
  CMP $02                                   ; $17C1B7 |
  BNE CODE_17C1FD                           ; $17C1B9 |

CODE_17C1BB:
  ASL A                                     ; $17C1BB |
  TAY                                       ; $17C1BC |
  LDA $BEFA,y                               ; $17C1BD |
  STA $6004,x                               ; $17C1C0 |
  LDA #$3B6E                                ; $17C1C3 |
  STA $600C,x                               ; $17C1C6 |
  LDA $08                                   ; $17C1C9 |
  CLC                                       ; $17C1CB |
  ADC #$0008                                ; $17C1CC |
  STA $6008,x                               ; $17C1CF |
  CLC                                       ; $17C1D2 |
  ADC #$0004                                ; $17C1D3 |
  STA $6000,x                               ; $17C1D6 |
  LDA $0A                                   ; $17C1D9 |
  CLC                                       ; $17C1DB |
  ADC #$0002                                ; $17C1DC |
  STA $600A,x                               ; $17C1DF |
  CLC                                       ; $17C1E2 |
  ADC #$0003                                ; $17C1E3 |
  STA $6002,x                               ; $17C1E6 |
  LDA #$0000                                ; $17C1E9 |
  STA $6006,x                               ; $17C1EC |
  INC A                                     ; $17C1EF |
  INC A                                     ; $17C1F0 |
  STA $600E,x                               ; $17C1F1 |
  TXA                                       ; $17C1F4 |
  CLC                                       ; $17C1F5 |
  ADC #$0010                                ; $17C1F6 |
  TAX                                       ; $17C1F9 |
  JMP CODE_17C25B                           ; $17C1FA |

CODE_17C1FD:
  LDA $08                                   ; $17C1FD |
  SEC                                       ; $17C1FF |
  SBC #$0008                                ; $17C200 |
  STA $6000,x                               ; $17C203 |
  CLC                                       ; $17C206 |
  ADC #$0005                                ; $17C207 |
  STA $6010,x                               ; $17C20A |
  CLC                                       ; $17C20D |
  ADC #$0004                                ; $17C20E |
  STA $6008,x                               ; $17C211 |
  LDA $0A                                   ; $17C214 |
  CLC                                       ; $17C216 |
  ADC #$0004                                ; $17C217 |
  STA $6002,x                               ; $17C21A |
  SEC                                       ; $17C21D |
  SBC $06                                   ; $17C21E |
  SEC                                       ; $17C220 |
  SBC #$000E                                ; $17C221 |
  STA $6012,x                               ; $17C224 |
  CLC                                       ; $17C227 |
  ADC #$0003                                ; $17C228 |
  STA $600A,x                               ; $17C22B |
  LDA $02                                   ; $17C22E |
  ASL A                                     ; $17C230 |
  TAY                                       ; $17C231 |
  LDA $BEFA,y                               ; $17C232 |
  STA $600C,x                               ; $17C235 |
  LDA #$3B6E                                ; $17C238 |
  STA $6014,x                               ; $17C23B |
  LDA $BED2,y                               ; $17C23E |
  CLC                                       ; $17C241 |
  ADC $04                                   ; $17C242 |
  STA $6004,x                               ; $17C244 |
  LDA #$0000                                ; $17C247 |
  STA $600E,x                               ; $17C24A |
  INC A                                     ; $17C24D |
  INC A                                     ; $17C24E |
  STA $6006,x                               ; $17C24F |
  STA $6016,x                               ; $17C252 |
  TXA                                       ; $17C255 |
  CLC                                       ; $17C256 |
  ADC #$0018                                ; $17C257 |
  TAX                                       ; $17C25A |

CODE_17C25B:
  LDY $0E                                   ; $17C25B |
  INY                                       ; $17C25D |
  INY                                       ; $17C25E |
  STY $0E                                   ; $17C25F |
  INC $02                                   ; $17C261 |
  LDA $02                                   ; $17C263 |
  CMP #$0008                                ; $17C265 |
  BEQ CODE_17C26D                           ; $17C268 |
  JMP CODE_17C1A0                           ; $17C26A |

CODE_17C26D:
  JMP CODE_17C0E1                           ; $17C26D |

  dw $2930, $2930                           ; $17C270 |

  dw $2D4A, $2D4C                           ; $17C274 |

  dw $0004, $0008                           ; $17C278 |

  LDX !s_oam_next_free_slot_ptr             ; $17C27C |
  LDA $9B                                   ; $17C27F |
  ASL A                                     ; $17C281 |
  TAY                                       ; $17C282 |
  LDA $76                                   ; $17C283 |
  SEC                                       ; $17C285 |
  SBC $6D                                   ; $17C286 |
  STA $6008,x                               ; $17C288 |
  STA $6018,x                               ; $17C28B |
  CLC                                       ; $17C28E |
  ADC #$0002                                ; $17C28F |
  STA $6000,x                               ; $17C292 |
  CLC                                       ; $17C295 |
  ADC #$0006                                ; $17C296 |
  STA $6010,x                               ; $17C299 |
  STA $6020,x                               ; $17C29C |
  LDA $72                                   ; $17C29F |
  SEC                                       ; $17C2A1 |
  SBC $6F                                   ; $17C2A2 |
  STA $00                                   ; $17C2A4 |
  STA $600A,x                               ; $17C2A6 |
  STA $6012,x                               ; $17C2A9 |
  CLC                                       ; $17C2AC |
  ADC #$0008                                ; $17C2AD |
  STA $601A,x                               ; $17C2B0 |
  STA $6022,x                               ; $17C2B3 |
  LDA $00                                   ; $17C2B6 |
  CLC                                       ; $17C2B8 |
  ADC $C278,y                               ; $17C2B9 |
  STA $6002,x                               ; $17C2BC |
  LDA $C274,y                               ; $17C2BF |
  STA $6004,x                               ; $17C2C2 |
  LDA $C270,y                               ; $17C2C5 |
  STA $00                                   ; $17C2C8 |
  STA $600C,x                               ; $17C2CA |
  INC A                                     ; $17C2CD |
  STA $6014,x                               ; $17C2CE |
  LDA $00                                   ; $17C2D1 |
  CLC                                       ; $17C2D3 |
  ADC #$0010                                ; $17C2D4 |
  STA $601C,x                               ; $17C2D7 |
  INC A                                     ; $17C2DA |
  STA $6024,x                               ; $17C2DB |
  LDA $AF                                   ; $17C2DE |
  SEC                                       ; $17C2E0 |
  SBC $6D                                   ; $17C2E1 |
  STA $6028,x                               ; $17C2E3 |
  CLC                                       ; $17C2E6 |
  ADC #$0008                                ; $17C2E7 |
  STA $6030,x                               ; $17C2EA |
  LDA $AD                                   ; $17C2ED |
  SEC                                       ; $17C2EF |
  SBC $6F                                   ; $17C2F0 |
  STA $602A,x                               ; $17C2F2 |
  CLC                                       ; $17C2F5 |
  ADC #$0008                                ; $17C2F6 |
  STA $6032,x                               ; $17C2F9 |
  LDA #$6B01                                ; $17C2FC |
  STA $602C,x                               ; $17C2FF |
  LDA #$6B10                                ; $17C302 |
  STA $6034,x                               ; $17C305 |
  LDA #$0402                                ; $17C308 |
  STA $6006,x                               ; $17C30B |
  STA $600E,x                               ; $17C30E |
  STA $6016,x                               ; $17C311 |
  STA $601E,x                               ; $17C314 |
  STA $6026,x                               ; $17C317 |
  STA $602E,x                               ; $17C31A |
  STA $6036,x                               ; $17C31D |
  TXA                                       ; $17C320 |
  CLC                                       ; $17C321 |
  ADC #$0038                                ; $17C322 |
  TAX                                       ; $17C325 |
  JMP CODE_17C183                           ; $17C326 |

  dw $2903, $2933                           ; $17C329 |

  dw $2B36, $6B04                           ; $17C32D |

  dw $2B46, $6B13                           ; $17C331 |

  dw $0000, $0008                           ; $17C335 |

  LDX !s_oam_next_free_slot_ptr             ; $17C339 |
  LDA $AB                                   ; $17C33C |
  SEC                                       ; $17C33E |
  SBC $6D                                   ; $17C33F |
  STA $6000,x                               ; $17C341 |
  LDA $A3                                   ; $17C344 |
  SEC                                       ; $17C346 |
  SBC $6F                                   ; $17C347 |
  STA $6002,x                               ; $17C349 |
  LDA #$2D4A                                ; $17C34C |
  STA $6004,x                               ; $17C34F |
  LDY #$0000                                ; $17C352 |
  LDA $9F                                   ; $17C355 |
  BPL CODE_17C35B                           ; $17C357 |
  INY                                       ; $17C359 |
  INY                                       ; $17C35A |

CODE_17C35B:
  LDA $76                                   ; $17C35B |
  SEC                                       ; $17C35D |
  SBC $6D                                   ; $17C35E |
  STA $6008,x                               ; $17C360 |
  STA $6018,x                               ; $17C363 |
  CLC                                       ; $17C366 |
  ADC #$0008                                ; $17C367 |
  STA $6010,x                               ; $17C36A |
  STA $6020,x                               ; $17C36D |
  LDA $72                                   ; $17C370 |
  SEC                                       ; $17C372 |
  SBC $6F                                   ; $17C373 |
  STA $00                                   ; $17C375 |
  STA $600A,x                               ; $17C377 |
  STA $6012,x                               ; $17C37A |
  CLC                                       ; $17C37D |
  ADC #$0008                                ; $17C37E |
  STA $601A,x                               ; $17C381 |
  STA $6022,x                               ; $17C384 |
  LDA $C329,y                               ; $17C387 |
  STA $00                                   ; $17C38A |
  STA $600C,x                               ; $17C38C |
  INC A                                     ; $17C38F |
  STA $6014,x                               ; $17C390 |
  LDA $00                                   ; $17C393 |
  CLC                                       ; $17C395 |
  ADC #$0010                                ; $17C396 |
  STA $601C,x                               ; $17C399 |
  INC A                                     ; $17C39C |
  STA $6024,x                               ; $17C39D |
  LDA $AF                                   ; $17C3A0 |
  SEC                                       ; $17C3A2 |
  SBC $6D                                   ; $17C3A3 |
  STA $6028,x                               ; $17C3A5 |
  CLC                                       ; $17C3A8 |
  ADC $C335,y                               ; $17C3A9 |
  STA $6030,x                               ; $17C3AC |
  LDA $AD                                   ; $17C3AF |
  SEC                                       ; $17C3B1 |
  SBC $6F                                   ; $17C3B2 |
  STA $602A,x                               ; $17C3B4 |
  CLC                                       ; $17C3B7 |
  ADC #$0008                                ; $17C3B8 |
  STA $6032,x                               ; $17C3BB |
  LDA $C32D,y                               ; $17C3BE |
  STA $602C,x                               ; $17C3C1 |
  LDA $C331,y                               ; $17C3C4 |
  STA $6034,x                               ; $17C3C7 |
  LDA #$0402                                ; $17C3CA |
  STA $6006,x                               ; $17C3CD |
  STA $600E,x                               ; $17C3D0 |
  STA $6016,x                               ; $17C3D3 |
  STA $601E,x                               ; $17C3D6 |
  STA $6026,x                               ; $17C3D9 |
  STA $602E,x                               ; $17C3DC |
  STA $6036,x                               ; $17C3DF |
  TXA                                       ; $17C3E2 |
  CLC                                       ; $17C3E3 |
  ADC #$0038                                ; $17C3E4 |
  TAX                                       ; $17C3E7 |
  JMP CODE_17C183                           ; $17C3E8 |

  LDX !s_oam_next_free_slot_ptr             ; $17C3EB |
  LDA $76                                   ; $17C3EE |
  SEC                                       ; $17C3F0 |
  SBC $6D                                   ; $17C3F1 |
  STA $6010,x                               ; $17C3F3 |
  CLC                                       ; $17C3F6 |
  ADC #$0004                                ; $17C3F7 |
  STA $6000,x                               ; $17C3FA |
  CLC                                       ; $17C3FD |
  ADC #$0004                                ; $17C3FE |
  STA $6008,x                               ; $17C401 |
  LDA $72                                   ; $17C404 |
  SEC                                       ; $17C406 |
  SBC $6F                                   ; $17C407 |
  STA $6002,x                               ; $17C409 |
  STA $600A,x                               ; $17C40C |
  CLC                                       ; $17C40F |
  ADC #$0008                                ; $17C410 |
  STA $6012,x                               ; $17C413 |
  LDA #$2904                                ; $17C416 |
  STA $600C,x                               ; $17C419 |
  LDA #$2913                                ; $17C41C |
  STA $6014,x                               ; $17C41F |
  LDA #$2D4C                                ; $17C422 |
  STA $6004,x                               ; $17C425 |
  LDA $AF                                   ; $17C428 |
  SEC                                       ; $17C42A |
  SBC $6D                                   ; $17C42B |
  STA $6020,x                               ; $17C42D |
  CLC                                       ; $17C430 |
  ADC #$0008                                ; $17C431 |
  STA $6018,x                               ; $17C434 |
  LDA $AD                                   ; $17C437 |
  SEC                                       ; $17C439 |
  SBC $6F                                   ; $17C43A |
  STA $601A,x                               ; $17C43C |
  CLC                                       ; $17C43F |
  ADC #$0008                                ; $17C440 |
  STA $6022,x                               ; $17C443 |
  LDA #$2B04                                ; $17C446 |
  STA $601C,x                               ; $17C449 |
  LDA #$2B13                                ; $17C44C |
  STA $6024,x                               ; $17C44F |
  LDA #$0402                                ; $17C452 |
  STA $6006,x                               ; $17C455 |
  STA $600E,x                               ; $17C458 |
  STA $6016,x                               ; $17C45B |
  STA $601E,x                               ; $17C45E |
  STA $6026,x                               ; $17C461 |
  TXA                                       ; $17C464 |
  CLC                                       ; $17C465 |
  ADC #$0028                                ; $17C466 |
  TAX                                       ; $17C469 |
  JMP CODE_17C183                           ; $17C46A |

  dw $0007, $0009                           ; $17C46D |

  dw $2B38, $2B39                           ; $17C471 |

  DEC $7D                                   ; $17C475 |
  BNE CODE_17C486                           ; $17C477 |
  LDA #$0009                                ; $17C479 |
  STA $7D                                   ; $17C47C |
  LDA $81                                   ; $17C47E |
  INC A                                     ; $17C480 |
  AND #$0003                                ; $17C481 |
  STA $81                                   ; $17C484 |

CODE_17C486:
  LDX !s_oam_next_free_slot_ptr             ; $17C486 |
  LDA $76                                   ; $17C489 |
  SEC                                       ; $17C48B |
  SBC $6D                                   ; $17C48C |
  STA $6000,x                               ; $17C48E |
  STA $6010,x                               ; $17C491 |
  CLC                                       ; $17C494 |
  ADC #$0008                                ; $17C495 |
  STA $6008,x                               ; $17C498 |
  LDA $72                                   ; $17C49B |
  SEC                                       ; $17C49D |
  SBC $6F                                   ; $17C49E |
  STA $600A,x                               ; $17C4A0 |
  CLC                                       ; $17C4A3 |
  ADC #$0001                                ; $17C4A4 |
  STA $6002,x                               ; $17C4A7 |
  CLC                                       ; $17C4AA |
  ADC #$0007                                ; $17C4AB |
  STA $6012,x                               ; $17C4AE |
  LDA $81                                   ; $17C4B1 |
  ASL A                                     ; $17C4B3 |
  TAY                                       ; $17C4B4 |
  LDA $BF12,y                               ; $17C4B5 |
  STA $02                                   ; $17C4B8 |
  INC A                                     ; $17C4BA |
  STA $600C,x                               ; $17C4BB |
  LDA $02                                   ; $17C4BE |
  ORA #$0010                                ; $17C4C0 |
  STA $6014,x                               ; $17C4C3 |
  LDA $BF1A,y                               ; $17C4C6 |
  STA $6004,x                               ; $17C4C9 |
  DEC $99                                   ; $17C4CC |
  BNE CODE_17C4DC                           ; $17C4CE |
  LDA $9B                                   ; $17C4D0 |
  EOR #$0002                                ; $17C4D2 |
  STA $9B                                   ; $17C4D5 |
  LDA #$0008                                ; $17C4D7 |
  STA $99                                   ; $17C4DA |

CODE_17C4DC:
  LDY $9B                                   ; $17C4DC |
  LDA $AF                                   ; $17C4DE |
  SEC                                       ; $17C4E0 |
  SBC $6D                                   ; $17C4E1 |
  STA $6018,x                               ; $17C4E3 |
  STA $6028,x                               ; $17C4E6 |
  SEC                                       ; $17C4E9 |
  SBC #$0005                                ; $17C4EA |
  STA $6030,x                               ; $17C4ED |
  CLC                                       ; $17C4F0 |
  ADC #$000D                                ; $17C4F1 |
  STA $6020,x                               ; $17C4F4 |
  LDA $AD                                   ; $17C4F7 |
  SEC                                       ; $17C4F9 |
  SBC $6F                                   ; $17C4FA |
  STA $00                                   ; $17C4FC |
  INC A                                     ; $17C4FE |
  STA $601A,x                               ; $17C4FF |
  STA $6022,x                               ; $17C502 |
  CLC                                       ; $17C505 |
  ADC #$0007                                ; $17C506 |
  STA $602A,x                               ; $17C509 |
  LDA $00                                   ; $17C50C |
  CLC                                       ; $17C50E |
  ADC $C46D,y                               ; $17C50F |
  STA $6032,x                               ; $17C512 |
  LDA #$6B36                                ; $17C515 |
  STA $6024,x                               ; $17C518 |
  INC A                                     ; $17C51B |
  STA $601C,x                               ; $17C51C |
  LDA #$6B48                                ; $17C51F |
  STA $602C,x                               ; $17C522 |
  LDA $C471,y                               ; $17C525 |
  STA $6034,x                               ; $17C528 |
  LDA #$0400                                ; $17C52B |
  STA $601E,x                               ; $17C52E |
  STA $6026,x                               ; $17C531 |
  STA $6036,x                               ; $17C534 |
  INC A                                     ; $17C537 |
  INC A                                     ; $17C538 |
  STA $6006,x                               ; $17C539 |
  STA $600E,x                               ; $17C53C |
  STA $6016,x                               ; $17C53F |
  STA $602E,x                               ; $17C542 |
  TXA                                       ; $17C545 |
  CLC                                       ; $17C546 |
  ADC #$0038                                ; $17C547 |
  TAX                                       ; $17C54A |
  JMP CODE_17C183                           ; $17C54B |

  dw $FFFE, $0002, $0004, $FFFC             ; $17C54E |

  dw $0000, $0100, $0100, $0000             ; $17C556 |

  dw $796C, $396C                           ; $17C55E |

  REP #$30                                  ; $17C562 |
  LDA #$0004                                ; $17C564 |
  STA $93                                   ; $17C567 |
  LDA $35                                   ; $17C569 |
  AND #$0010                                ; $17C56B |
  LSR A                                     ; $17C56E |
  LSR A                                     ; $17C56F |
  LSR A                                     ; $17C570 |
  TAY                                       ; $17C571 |
  LDA $6D                                   ; $17C572 |
  CMP $C556,y                               ; $17C574 |
  BEQ CODE_17C597                           ; $17C577 |
  CLC                                       ; $17C579 |
  ADC $C54E,y                               ; $17C57A |
  STA $00                                   ; $17C57D |
  SEC                                       ; $17C57F |
  SBC $C556,y                               ; $17C580 |
  BEQ CODE_17C58A                           ; $17C583 |
  EOR $C54E,y                               ; $17C585 |
  BMI CODE_17C58F                           ; $17C588 |

CODE_17C58A:
  LDA $C556,y                               ; $17C58A |
  STA $00                                   ; $17C58D |

CODE_17C58F:
  LDA $00                                   ; $17C58F |
  STA $69                                   ; $17C591 |
  STA $6D                                   ; $17C593 |
  STA $41                                   ; $17C595 |

CODE_17C597:
  LDX !s_oam_next_free_slot_ptr             ; $17C597 |
  LDA #$00E8                                ; $17C59A |
  CPY #$0002                                ; $17C59D |
  BEQ CODE_17C5A5                           ; $17C5A0 |
  LDA #$0008                                ; $17C5A2 |

CODE_17C5A5:
  STA $6000,x                               ; $17C5A5 |
  LDA #$00A8                                ; $17C5A8 |
  STA $6002,x                               ; $17C5AB |
  LDA $C55E,y                               ; $17C5AE |
  STA $6004,x                               ; $17C5B1 |
  LDA #$0102                                ; $17C5B4 |
  STA $6006,x                               ; $17C5B7 |
  TXA                                       ; $17C5BA |
  CLC                                       ; $17C5BB |
  ADC #$0008                                ; $17C5BC |
  STA !s_oam_next_free_slot_ptr             ; $17C5BF |
  JMP CODE_17BF7C                           ; $17C5C2 |
  REP #$30                                  ; $17C5C5 |
  LDA #$0000                                ; $17C5C7 |
  LDX $6D                                   ; $17C5CA |
  CPX $79                                   ; $17C5CC |
  BCC CODE_17C5D2                           ; $17C5CE |
  INC A                                     ; $17C5D0 |
  INC A                                     ; $17C5D1 |

CODE_17C5D2:
  ORA $93                                   ; $17C5D2 |
  TAY                                       ; $17C5D4 |
  LDA $6D                                   ; $17C5D5 |
  CMP $79                                   ; $17C5D7 |
  BNE CODE_17C5DF                           ; $17C5D9 |
  STZ $93                                   ; $17C5DB |
  BRA CODE_17C5FB                           ; $17C5DD |

CODE_17C5DF:
  CLC                                       ; $17C5DF |
  ADC $C54E,y                               ; $17C5E0 |
  STA $00                                   ; $17C5E3 |
  SEC                                       ; $17C5E5 |
  SBC $79                                   ; $17C5E6 |
  BEQ CODE_17C5EF                           ; $17C5E8 |
  EOR $C54E,y                               ; $17C5EA |
  BMI CODE_17C5F3                           ; $17C5ED |

CODE_17C5EF:
  LDA $79                                   ; $17C5EF |
  STA $00                                   ; $17C5F1 |

CODE_17C5F3:
  LDA $00                                   ; $17C5F3 |
  STA $6D                                   ; $17C5F5 |
  STA $69                                   ; $17C5F7 |
  STA $41                                   ; $17C5F9 |

CODE_17C5FB:
  JMP CODE_17BF7C                           ; $17C5FB |
  REP #$20                                  ; $17C5FE |
  JSR CODE_17C672                           ; $17C600 |
  STZ $110C                                 ; $17C603 |
  SEP #$20                                  ; $17C606 |
  JSR CODE_17C8B3                           ; $17C608 |
  LDA !r_cur_world                          ; $17C60B |
  LSR A                                     ; $17C60E |
  TAX                                       ; $17C60F |
  LDA !r_cur_stage                          ; $17C610 |
  SEC                                       ; $17C613 |
  SBC $E187,x                               ; $17C614 |
  INC A                                     ; $17C617 |
  REP #$20                                  ; $17C618 |
  AND #$00FF                                ; $17C61A |
  STA $00                                   ; $17C61D |
  JSR CODE_17E7FB                           ; $17C61F |
  TYA                                       ; $17C622 |
  AND #$000F                                ; $17C623 |
  ASL A                                     ; $17C626 |
  TAX                                       ; $17C627 |
  LDA $1115                                 ; $17C628 |
  AND #$00FF                                ; $17C62B |
  BEQ CODE_17C637                           ; $17C62E |
  ASL A                                     ; $17C630 |
  TAX                                       ; $17C631 |
  LDA $E26F,x                               ; $17C632 |
  BRA CODE_17C63A                           ; $17C635 |

CODE_17C637:
  LDA $E257,x                               ; $17C637 |

CODE_17C63A:
  STA $1109                                 ; $17C63A |
  SEP #$20                                  ; $17C63D |
  STY $1112                                 ; $17C63F |
  STZ $1117                                 ; $17C642 |
  STZ $1118                                 ; $17C645 |
  STZ $1108                                 ; $17C648 |
  STZ $111A                                 ; $17C64B |
  STZ $111B                                 ; $17C64E |
  STZ $111C                                 ; $17C651 |
  STZ $1128                                 ; $17C654 |
  STZ $1129                                 ; $17C657 |
  STZ $112A                                 ; $17C65A |
  LDA #$01                                  ; $17C65D |
  STA $1106                                 ; $17C65F |
  INC $1118                                 ; $17C662 |
  STZ $1106                                 ; $17C665 |
  STZ $1118                                 ; $17C668 |
  JSR CODE_17D885                           ; $17C66B |
  STZ $1115                                 ; $17C66E |
  RTL                                       ; $17C671 |

CODE_17C672:
  LDX #$00                                  ; $17C672 |
  LDA #$19BF                                ; $17C674 |

CODE_17C677:
  STA $0A06,x                               ; $17C677 |
  STA $0D86,x                               ; $17C67A |
  STA $0B06,x                               ; $17C67D |
  STA $0E86,x                               ; $17C680 |
  STA $0C06,x                               ; $17C683 |
  STA $0F86,x                               ; $17C686 |
  STA $0C86,x                               ; $17C689 |
  STA $1006,x                               ; $17C68C |
  DEX                                       ; $17C68F |
  DEX                                       ; $17C690 |
  BNE CODE_17C677                           ; $17C691 |
  RTS                                       ; $17C693 |

  db $02, $05, $00, $04, $01, $03, $06, $07 ; $17C694 |
  db $00, $00, $00, $00, $02, $05, $00, $04 ; $17C69C |
  db $01, $03, $06, $07, $00, $00, $00, $00 ; $17C6A4 |
  db $02, $05, $00, $04, $01, $03, $06, $07 ; $17C6AC |
  db $00, $00, $00, $00, $02, $05, $00, $04 ; $17C6B4 |
  db $01, $03, $06, $07, $00, $00, $00, $00 ; $17C6BC |
  db $02, $05, $00, $04, $01, $03, $06, $07 ; $17C6C4 |
  db $00, $00, $00, $00, $02, $05, $00, $04 ; $17C6CC |
  db $01, $03, $06, $02                     ; $17C6D4 |

map_active_yoshi_color_ptr:
  dw $DF88                                  ; $17C6D8 | light blue
  dw $DF8E                                  ; $17C6DA | purple
  dw $DF94                                  ; $17C6DC | green
  dw $DF9A                                  ; $17C6DE | brown
  dw $DFA0                                  ; $17C6E0 | yellow
  dw $DFA6                                  ; $17C6E2 | red
  dw $DFAC                                  ; $17C6E4 | pink
  dw $DFB2                                  ; $17C6E6 | dark blue
  dw $DFB8                                  ; $17C6E8 | 9th and 10th Yoshi colors
  dw $DFBE                                  ; $17C6EA | unused (bright magenta)

CODE_17C6EC:
  LDA #$5F                                  ; $17C6EC |
  STA $02                                   ; $17C6EE |
  STA $05                                   ; $17C6F0 |
  REP #$30                                  ; $17C6F2 |
  LDX !r_cur_stage                          ; $17C6F4 |

CODE_17C6F7:
  LDA $C694,x                               ; $17C6F7 |
  AND #$00FF                                ; $17C6FA |
  ASL A                                     ; $17C6FD |
  TAY                                       ; $17C6FE |
  LDA $C6D8,y                               ; $17C6FF |
  STA $00                                   ; $17C702 |
  LDA $C695,x                               ; $17C704 |
  AND #$00FF                                ; $17C707 |
  ASL A                                     ; $17C70A |
  TAY                                       ; $17C70B |
  LDA $C6D8,y                               ; $17C70C |
  STA $03                                   ; $17C70F |
  LDX #$0000                                ; $17C711 |

CODE_17C714:
  TXY                                       ; $17C714 |
  LDA [$00],y                               ; $17C715 | set active yoshi palette
  STA $70219A,x                             ; $17C717 |
  LDA [$03],y                               ; $17C71B | set "next yoshi" palette
  STA $7021BA,x                             ; $17C71D |
  INX                                       ; $17C721 |
  INX                                       ; $17C722 |
  CPX #$0006                                ; $17C723 |
  BCC CODE_17C714                           ; $17C726 |
  SEP #$30                                  ; $17C728 |
  RTS                                       ; $17C72A |

  LDA #$5F                                  ; $17C72B |
  STA $02                                   ; $17C72D |
  STA $05                                   ; $17C72F |
  PHX                                       ; $17C731 |
  REP #$30                                  ; $17C732 |
  LDA $112E                                 ; $17C734 |
  AND #$00FF                                ; $17C737 |
  STA $00                                   ; $17C73A |
  LDX !r_cur_world                          ; $17C73C |
  LDA $E198,x                               ; $17C73F |
  CLC                                       ; $17C742 |
  ADC $00                                   ; $17C743 |
  TAX                                       ; $17C745 |
  JSR CODE_17C6F7                           ; $17C746 |
  PLX                                       ; $17C749 |
  RTL                                       ; $17C74A |

  PHP                                       ; $17C74B |
  PHB                                       ; $17C74C |
  PHK                                       ; $17C74D |
  PLB                                       ; $17C74E |
  SEP #$30                                  ; $17C74F |
  JSR CODE_17C6EC                           ; $17C751 |
  PLB                                       ; $17C754 |
  PLP                                       ; $17C755 |
  RTL                                       ; $17C756 |

  STZ $1122                                 ; $17C757 |
  LDA #$B7                                  ; $17C75A |
  STA !r_reg_cgadsub_mirror                 ; $17C75C |
  LDA $114E                                 ; $17C75F |
  BEQ CODE_17C76C                           ; $17C762 |
  ASL A                                     ; $17C764 |
  TAX                                       ; $17C765 |
  JSR ($C88B,x)                             ; $17C766 |
  JMP CODE_17C80C                           ; $17C769 |

CODE_17C76C:
  LDA $1118                                 ; $17C76C |
  CMP #$28                                  ; $17C76F |
  BCC CODE_17C77E                           ; $17C771 |
  ASL A                                     ; $17C773 |
  TAX                                       ; $17C774 |
  STA $1122                                 ; $17C775 |
  JSR ($C811,x)                             ; $17C778 |
  JMP CODE_17C80F                           ; $17C77B |

CODE_17C77E:
  LDA $0979                                 ; $17C77E |
  BNE CODE_17C795                           ; $17C781 |
  LDA $111C                                 ; $17C783 |
  AND #$F0                                  ; $17C786 |
  BNE CODE_17C7C5                           ; $17C788 |
  LDA $36                                   ; $17C78A |
  AND #$0F                                  ; $17C78C |
  BNE CODE_17C7C5                           ; $17C78E |
  STZ $111C                                 ; $17C790 |
  BRA CODE_17C7C5                           ; $17C793 |

CODE_17C795:
  LDA $111D                                 ; $17C795 |
  ASL A                                     ; $17C798 |
  TAX                                       ; $17C799 |
  JSR ($C887,x)                             ; $17C79A |
  LDA $1110                                 ; $17C79D |
  CMP #$20                                  ; $17C7A0 |
  BCS CODE_17C7B8                           ; $17C7A2 |
  LDA $1114                                 ; $17C7A4 |
  CMP #$0C                                  ; $17C7A7 |
  BCS CODE_17C7B0                           ; $17C7A9 |
  JSR CODE_17C9F6                           ; $17C7AB |
  BRA CODE_17C7B8                           ; $17C7AE |

CODE_17C7B0:
  LDA #$80                                  ; $17C7B0 |
  STA $0986                                 ; $17C7B2 |
  INC $098E                                 ; $17C7B5 |

CODE_17C7B8:
  LDA $1110                                 ; $17C7B8 |
  ORA $1111                                 ; $17C7BB |
  BEQ CODE_17C80F                           ; $17C7BE |
  JSR CODE_17E533                           ; $17C7C0 |
  BRA CODE_17C80F                           ; $17C7C3 |

CODE_17C7C5:
  LDA $1118                                 ; $17C7C5 |
  BEQ CODE_17C7D1                           ; $17C7C8 |
  ASL A                                     ; $17C7CA |
  TAX                                       ; $17C7CB |
  JSR ($C811,x)                             ; $17C7CC |
  BRA CODE_17C80F                           ; $17C7CF |

CODE_17C7D1:
  LDA $1117                                 ; $17C7D1 |
  BEQ CODE_17C7E3                           ; $17C7D4 |
  LDA $110C                                 ; $17C7D6 |
  ORA $110D                                 ; $17C7D9 |
  BNE CODE_17C7F9                           ; $17C7DC |
  JSR CODE_17E458                           ; $17C7DE |
  BRA CODE_17C7F6                           ; $17C7E1 |

CODE_17C7E3:
  LDA $111B                                 ; $17C7E3 |
  BEQ CODE_17C7EB                           ; $17C7E6 |
  JSR CODE_17E6C5                           ; $17C7E8 |

CODE_17C7EB:
  LDA $110C                                 ; $17C7EB |
  ORA $110D                                 ; $17C7EE |
  BNE CODE_17C7F9                           ; $17C7F1 |
  JSR CODE_17E00F                           ; $17C7F3 |

CODE_17C7F6:
  JSR CODE_17E1DF                           ; $17C7F6 |

CODE_17C7F9:
  LDA $110C                                 ; $17C7F9 |
  CMP #$2C                                  ; $17C7FC |
  BEQ CODE_17C804                           ; $17C7FE |
  CMP #$CC                                  ; $17C800 |
  BNE CODE_17C80C                           ; $17C802 |

CODE_17C804:
  LDA $111C                                 ; $17C804 |
  AND #$0F                                  ; $17C807 |
  STA $111C                                 ; $17C809 |

CODE_17C80C:
  JSR CODE_17E200                           ; $17C80C |

CODE_17C80F:
  JSR CODE_17E27B                           ; $17C80F |
  RTL                                       ; $17C812 |

  dw $CC69                                  ; $17C813 |
  dw $CC93                                  ; $17C815 |
  dw $CCBA                                  ; $17C817 |
  dw $CD0F                                  ; $17C819 |
  dw $CD63                                  ; $17C81B |
  dw $CD76                                  ; $17C81D |
  dw $CD97                                  ; $17C81F |
  dw $CDB7                                  ; $17C821 |
  dw $CDB7                                  ; $17C823 |
  dw $CE2C                                  ; $17C825 |
  dw $CDC1                                  ; $17C827 |
  dw $CE2C                                  ; $17C829 |
  dw $CDCB                                  ; $17C82B |
  dw $CE51                                  ; $17C82D |
  dw $CE5B                                  ; $17C82F |
  dw $CE65                                  ; $17C831 |
  dw $CE6F                                  ; $17C833 |
  dw $CE79                                  ; $17C835 |
  dw $CE83                                  ; $17C837 |
  dw $CE8D                                  ; $17C839 |
  dw $CE97                                  ; $17C83B |
  dw $CEFB                                  ; $17C83D |
  dw $0000                                  ; $17C83F |
  dw $CF18                                  ; $17C841 |
  dw $CF2F                                  ; $17C843 |
  dw $CF45                                  ; $17C845 |
  dw $D135                                  ; $17C847 |
  dw $D221                                  ; $17C849 |
  dw $D2BB                                  ; $17C84B |
  dw $D2D9                                  ; $17C84D |
  dw $D5E7                                  ; $17C84F |
  dw $CF18                                  ; $17C851 |
  dw $CF2F                                  ; $17C853 |
  dw $CF45                                  ; $17C855 |
  dw $CF5C                                  ; $17C857 |
  dw $D600                                  ; $17C859 |
  dw $D613                                  ; $17C85B |
  dw $D62E                                  ; $17C85D |
  dw $D648                                  ; $17C85F |
  dw $EB3F                                  ; $17C861 |
  dw $EB8B                                  ; $17C863 |
  dw $EBA9                                  ; $17C865 |
  dw $EBB8                                  ; $17C867 |
  dw $EBCB                                  ; $17C869 |
  dw $EBEC                                  ; $17C86B |
  dw $EC26                                  ; $17C86D |
  dw $ECA1                                  ; $17C86F |
  dw $ECC2                                  ; $17C871 |
  dw $ED02                                  ; $17C873 |
  dw $ED37                                  ; $17C875 |
  dw $ED3D                                  ; $17C877 |
  dw $ED52                                  ; $17C879 |
  dw $ED5F                                  ; $17C87B |
  dw $ED81                                  ; $17C87D |
  dw $ED94                                  ; $17C87F |
  dw $EDA3                                  ; $17C881 |
  dw $EE28                                  ; $17C883 |
  dw $EE47                                  ; $17C885 |

  dw $E729                                  ; $17C887 |
  dw $E744                                  ; $17C889 |
  dw $E7BF                                  ; $17C88B |
  dw $EF54                                  ; $17C88D |
  dw $F0CC                                  ; $17C88F |
  dw $F0D1                                  ; $17C891 |
  dw $F0E1                                  ; $17C893 |
  dw $F118                                  ; $17C895 |
  dw $F142                                  ; $17C897 |
  dw $F1C5                                  ; $17C899 |
  dw $F1DF                                  ; $17C89B |
  dw $F226                                  ; $17C89D |
  dw $F23F                                  ; $17C89F |
  dw $F259                                  ; $17C8A1 |
  dw $F0CC                                  ; $17C8A3 |
  dw $F0D1                                  ; $17C8A5 |
  dw $F0E1                                  ; $17C8A7 |
  dw $F266                                  ; $17C8A9 |
  dw $F28A                                  ; $17C8AB |
  dw $F2DF                                  ; $17C8AD |
  dw $F3BB                                  ; $17C8AF |
  dw $F3D0                                  ; $17C8B1 |

CODE_17C8B3:
  REP #$20                                  ; $17C8B3 |
  STZ $04                                   ; $17C8B5 |
  STZ $06                                   ; $17C8B7 |
  SEP #$20                                  ; $17C8B9 |
  LDA #$10                                  ; $17C8BB |
  STA $12                                   ; $17C8BD |
  LDA #$00                                  ; $17C8BF |
  STA $0F                                   ; $17C8C1 |

CODE_17C8C3:
  REP #$20                                  ; $17C8C3 |
  LDA $04                                   ; $17C8C5 |
  ASL A                                     ; $17C8C7 |
  TAX                                       ; $17C8C8 |
  LDA $1081DD,x                             ; $17C8C9 |
  STA $10                                   ; $17C8CD |
  LDA #$0001                                ; $17C8CF |
  STA $02                                   ; $17C8D2 |
  SEP #$20                                  ; $17C8D4 |

CODE_17C8D6:
  LDY $06                                   ; $17C8D6 |
  LDA !r_stages_unlocked,y                  ; $17C8D8 |
  BEQ CODE_17C91F                           ; $17C8DB |
  AND #$80                                  ; $17C8DD |
  ORA $02                                   ; $17C8DF |
  STA $00                                   ; $17C8E1 |
  LDY #$00                                  ; $17C8E3 |

CODE_17C8E5:
  REP #$20                                  ; $17C8E5 |
  LDA [$10],y                               ; $17C8E7 |
  STA $0D                                   ; $17C8E9 |
  SEP #$20                                  ; $17C8EB |
  LDA [$0D]                                 ; $17C8ED |
  AND #$7F                                  ; $17C8EF |
  CMP $02                                   ; $17C8F1 |
  BEQ CODE_17C915                           ; $17C8F3 |
  INY                                       ; $17C8F5 |
  INY                                       ; $17C8F6 |
  CPY #$10                                  ; $17C8F7 |
  BCC CODE_17C8E5                           ; $17C8F9 |
  LDY #$00                                  ; $17C8FB |

CODE_17C8FD:
  REP #$20                                  ; $17C8FD |
  LDA [$10],y                               ; $17C8FF |
  STA $0D                                   ; $17C901 |
  SEP #$20                                  ; $17C903 |
  LDA [$0D]                                 ; $17C905 |
  BEQ CODE_17C91B                           ; $17C907 |
  CMP #$FF                                  ; $17C909 |
  BEQ CODE_17C91F                           ; $17C90B |
  INY                                       ; $17C90D |
  INY                                       ; $17C90E |
  CPY #$10                                  ; $17C90F |
  BCC CODE_17C8FD                           ; $17C911 |
  BRA CODE_17C91F                           ; $17C913 |

CODE_17C915:
  LDA [$0D]                                 ; $17C915 |
  AND #$80                                  ; $17C917 |
  BEQ CODE_17C91F                           ; $17C919 |

CODE_17C91B:
  LDA $00                                   ; $17C91B |
  STA [$0D]                                 ; $17C91D |

CODE_17C91F:
  INC $06                                   ; $17C91F |
  INC $02                                   ; $17C921 |
  LDA $02                                   ; $17C923 |
  CMP #$09                                  ; $17C925 |
  BCC CODE_17C8D6                           ; $17C927 |
  INC $06                                   ; $17C929 |
  INC $06                                   ; $17C92B |
  INC $06                                   ; $17C92D |
  INC $06                                   ; $17C92F |
  INC $04                                   ; $17C931 |
  LDA $04                                   ; $17C933 |
  CMP #$06                                  ; $17C935 |
  BCC CODE_17C8C3                           ; $17C937 |
  RTS                                       ; $17C939 |

  dw $030F, $031B, $0327, $0333             ; $17C93A |
  dw $033F, $034B                           ; $17C942 |

CODE_17C946:
  REP #$30                                  ; $17C946 |
  LDX !r_cur_world                          ; $17C948 |
  LDA $C9EA,x                               ; $17C94B |
  STA $0E                                   ; $17C94E |
  STZ $08                                   ; $17C950 |
  LDX #$0000                                ; $17C952 |
  LDA $1106                                 ; $17C955 |
  AND #$00FF                                ; $17C958 |
  BEQ CODE_17C962                           ; $17C95B |
  LDA #$0380                                ; $17C95D |
  STA $08                                   ; $17C960 |

CODE_17C962:
  LDA #$C9C6                                ; $17C962 |
  STA $00                                   ; $17C965 |
  LDA #$C9CC                                ; $17C967 |
  STA $02                                   ; $17C96A |
  LDA #$C9D2                                ; $17C96C |
  STA $04                                   ; $17C96F |
  LDA $DCEF,x                               ; $17C971 |
  CLC                                       ; $17C974 |
  ADC $08                                   ; $17C975 |
  STA $10                                   ; $17C977 |
  CLC                                       ; $17C979 |
  ADC #$0040                                ; $17C97A |
  STA $12                                   ; $17C97D |
  CLC                                       ; $17C97F |
  ADC #$0040                                ; $17C980 |
  STA $14                                   ; $17C983 |
  INX                                       ; $17C985 |
  INX                                       ; $17C986 |
  CPX #$0012                                ; $17C987 |
  BCS CODE_17C9C3                           ; $17C98A |
  CPX #$0008                                ; $17C98C |
  BEQ CODE_17C996                           ; $17C98F |
  CPX #$0010                                ; $17C991 |
  BNE CODE_17C9A5                           ; $17C994 |

CODE_17C996:
  LDA #$C9D8                                ; $17C996 |
  STA $00                                   ; $17C999 |
  LDA #$C9DE                                ; $17C99B |
  STA $02                                   ; $17C99E |
  LDA #$C9E4                                ; $17C9A0 |
  STA $04                                   ; $17C9A3 |

CODE_17C9A5:
  LDY #$0000                                ; $17C9A5 |

CODE_17C9A8:
  LDA ($00),y                               ; $17C9A8 |
  ORA $0E                                   ; $17C9AA |
  STA ($10),y                               ; $17C9AC |
  LDA ($02),y                               ; $17C9AE |
  ORA $0E                                   ; $17C9B0 |
  STA ($12),y                               ; $17C9B2 |
  LDA ($04),y                               ; $17C9B4 |
  ORA $0E                                   ; $17C9B6 |
  STA ($14),y                               ; $17C9B8 |
  INY                                       ; $17C9BA |
  INY                                       ; $17C9BB |
  CPY #$0006                                ; $17C9BC |
  BCC CODE_17C9A8                           ; $17C9BF |
  BRA CODE_17C962                           ; $17C9C1 |

CODE_17C9C3:
  SEP #$30                                  ; $17C9C3 |
  RTS                                       ; $17C9C5 |

  dw $2187, $218F, $6187                    ; $17C9C6 |

  dw $2198, $218E, $6198                    ; $17C9CC |

  dw $A187, $A18F, $E187                    ; $17C9D2 |

  dw $21F5, $21F5, $21F5                    ; $17C9D8 |

  dw $21F7, $21F7, $21F7                    ; $17C9DE |

  dw $21F7, $21F6, $21F7                    ; $17C9E4 |

  dw $0C00, $1000, $1400, $0000             ; $17C9EA |
  dw $0400, $0800                           ; $17C9F2 |

CODE_17C9F6:
  DEC $1113                                 ; $17C9F6 |
  BNE CODE_17CA07                           ; $17C9F9 |
  LDX $1114                                 ; $17C9FB |
  LDA $CAF6,x                               ; $17C9FE |
  STA $1113                                 ; $17CA01 |
  INC $1114                                 ; $17CA04 |

CODE_17CA07:
  LDA $1114                                 ; $17CA07 |
  CMP #$0C                                  ; $17CA0A |
  BCC CODE_17CA11                           ; $17CA0C |

CODE_17CA0E:
  JMP CODE_17CAF5                           ; $17CA0E |

CODE_17CA11:
  CMP #$08                                  ; $17CA11 |
  BEQ CODE_17CA0E                           ; $17CA13 |
  ASL A                                     ; $17CA15 |
  REP #$30                                  ; $17CA16 |
  AND #$00FF                                ; $17CA18 |
  TAX                                       ; $17CA1B |
  LDA $CB01,x                               ; $17CA1C |
  STA $00                                   ; $17CA1F |
  LDY !s_oam_next_free_slot_ptr             ; $17CA21 |
  LDA $1109                                 ; $17CA24 |
  AND #$00FF                                ; $17CA27 |
  STA $02                                   ; $17CA2A |
  CLC                                       ; $17CA2C |
  ADC ($00)                                 ; $17CA2D |
  STA $6000,y                               ; $17CA2F |
  INC $00                                   ; $17CA32 |
  INC $00                                   ; $17CA34 |
  LDA $02                                   ; $17CA36 |
  CLC                                       ; $17CA38 |
  ADC ($00)                                 ; $17CA39 |
  STA $6008,y                               ; $17CA3B |
  INC $00                                   ; $17CA3E |
  INC $00                                   ; $17CA40 |
  LDA $02                                   ; $17CA42 |
  CLC                                       ; $17CA44 |
  ADC ($00)                                 ; $17CA45 |
  STA $6010,y                               ; $17CA47 |
  INC $00                                   ; $17CA4A |
  INC $00                                   ; $17CA4C |
  LDA $02                                   ; $17CA4E |
  CLC                                       ; $17CA50 |
  ADC ($00)                                 ; $17CA51 |
  STA $6018,y                               ; $17CA53 |
  INC $00                                   ; $17CA56 |
  INC $00                                   ; $17CA58 |
  LDA $02                                   ; $17CA5A |
  CLC                                       ; $17CA5C |
  ADC ($00)                                 ; $17CA5D |
  STA $6020,y                               ; $17CA5F |
  INC $00                                   ; $17CA62 |
  INC $00                                   ; $17CA64 |
  LDA $02                                   ; $17CA66 |
  CLC                                       ; $17CA68 |
  ADC ($00)                                 ; $17CA69 |
  STA $6028,y                               ; $17CA6B |
  LDA $CB19,x                               ; $17CA6E |
  STA $00                                   ; $17CA71 |
  LDA $110A                                 ; $17CA73 |
  AND #$00FF                                ; $17CA76 |
  SEC                                       ; $17CA79 |
  SBC #$0005                                ; $17CA7A |
  STA $02                                   ; $17CA7D |
  CLC                                       ; $17CA7F |
  ADC ($00)                                 ; $17CA80 |
  STA $6002,y                               ; $17CA82 |
  INC $00                                   ; $17CA85 |
  INC $00                                   ; $17CA87 |
  LDA $02                                   ; $17CA89 |
  CLC                                       ; $17CA8B |
  ADC ($00)                                 ; $17CA8C |
  STA $600A,y                               ; $17CA8E |
  INC $00                                   ; $17CA91 |
  INC $00                                   ; $17CA93 |
  LDA $02                                   ; $17CA95 |
  CLC                                       ; $17CA97 |
  ADC ($00)                                 ; $17CA98 |
  STA $6012,y                               ; $17CA9A |
  INC $00                                   ; $17CA9D |
  INC $00                                   ; $17CA9F |
  LDA $02                                   ; $17CAA1 |
  CLC                                       ; $17CAA3 |
  ADC ($00)                                 ; $17CAA4 |
  STA $601A,y                               ; $17CAA6 |
  INC $00                                   ; $17CAA9 |
  INC $00                                   ; $17CAAB |
  LDA $02                                   ; $17CAAD |
  CLC                                       ; $17CAAF |
  ADC ($00)                                 ; $17CAB0 |
  STA $6022,y                               ; $17CAB2 |
  INC $00                                   ; $17CAB5 |
  INC $00                                   ; $17CAB7 |
  LDA $02                                   ; $17CAB9 |
  CLC                                       ; $17CABB |
  ADC ($00)                                 ; $17CABC |
  STA $602A,y                               ; $17CABE |
  LDA $CB31,x                               ; $17CAC1 |
  STA $6004,y                               ; $17CAC4 |
  STA $600C,y                               ; $17CAC7 |
  STA $6014,y                               ; $17CACA |
  STA $601C,y                               ; $17CACD |
  STA $6024,y                               ; $17CAD0 |
  STA $602C,y                               ; $17CAD3 |
  LDA $CB49,x                               ; $17CAD6 |
  STA $6006,y                               ; $17CAD9 |
  STA $600E,y                               ; $17CADC |
  STA $6016,y                               ; $17CADF |
  STA $601E,y                               ; $17CAE2 |
  STA $6026,y                               ; $17CAE5 |
  STA $602E,y                               ; $17CAE8 |
  TYA                                       ; $17CAEB |
  CLC                                       ; $17CAEC |
  ADC #$0030                                ; $17CAED |
  STA !s_oam_next_free_slot_ptr             ; $17CAF0 |
  SEP #$30                                  ; $17CAF3 |

CODE_17CAF5:
  RTS                                       ; $17CAF5 |

  db $01, $02, $02, $03, $02, $03, $04, $08 ; $17CAF6 |
  db $04, $04, $04                          ; $17CAFE |

  dw $CB61                                  ; $17CB01 |
  dw $CB6D                                  ; $17CB03 |
  dw $CB79                                  ; $17CB05 |
  dw $CB85                                  ; $17CB07 |
  dw $CB91                                  ; $17CB09 |
  dw $CB9D                                  ; $17CB0B |
  dw $CBA9                                  ; $17CB0D |
  dw $CBB5                                  ; $17CB0F |
  dw $0000                                  ; $17CB11 |
  dw $CBC1                                  ; $17CB13 |
  dw $CBCD                                  ; $17CB15 |
  dw $CBD9                                  ; $17CB17 |
  dw $CBE5                                  ; $17CB19 |
  dw $CBF1                                  ; $17CB1B |
  dw $CBFD                                  ; $17CB1D |
  dw $CC09                                  ; $17CB1F |
  dw $CC15                                  ; $17CB21 |
  dw $CC21                                  ; $17CB23 |
  dw $CC2D                                  ; $17CB25 |
  dw $CC39                                  ; $17CB27 |
  dw $0000                                  ; $17CB29 |
  dw $CC45                                  ; $17CB2B |
  dw $CC51                                  ; $17CB2D |
  dw $CC5D                                  ; $17CB2F |

  dw $37C4, $31C5, $35C6, $33C8             ; $17CB31 |
  dw $33C8, $35C6, $31C5, $37C4             ; $17CB39 |
  dw $0000, $31D4, $31D5, $71D4             ; $17CB41 |

  dw $0000, $0000, $0002, $0002             ; $17CB49 |
  dw $0002, $0002, $0000, $0000             ; $17CB51 |
  dw $0000, $0000, $0000, $0000             ; $17CB59 |

  dw $0000, $0000, $FFFC, $FFF8             ; $17CB61 |
  dw $FFF8, $FFFC                           ; $17CB69 |

  dw $0004, $0004, $FFFC, $FFF4             ; $17CB6D |
  dw $FFF4, $FFFC                           ; $17CB75 |

  dw $FFF8, $FFF8, $FFED, $FFED             ; $17CB79 |
  dw $0003, $0003                           ; $17CB81 |

  dw $FFF8, $FFF8, $0006, $0006             ; $17CB85 |
  dw $FFEA, $FFEA                           ; $17CB8D |

  dw $FFE3, $FFE3, $000D, $000D             ; $17CB91 |
  dw $FFF8, $FFF8                           ; $17CB99 |

  dw $FFF8, $FFF8, $000D, $000D             ; $17CB9D |
  dw $FFE3, $FFE3                           ; $17CBA5 |

  dw $FFE7, $FFFC, $0011, $0011             ; $17CBA9 |
  dw $FFFC, $FFE7                           ; $17CBB1 |

  dw $FFFC, $0011, $0011, $FFFC             ; $17CBB5 |
  dw $FFE7, $FFE7                           ; $17CBBD |

  dw $FFFC, $0011, $FFE7, $FFE7             ; $17CBC1 |
  dw $0011, $FFFC                           ; $17CBC9 |

  dw $FFE7, $FFE7, $FFFC, $0011             ; $17CBCD |
  dw $0011, $FFFC                           ; $17CBD5 |

  dw $FFFC, $0011, $FFE7, $FFE7             ; $17CBD9 |
  dw $0011, $FFFC                           ; $17CBE1 |

  dw $FFFA, $FFFE, $0000, $FFFE             ; $17CBE5 |
  dw $FFFA, $FFF8                           ; $17CBED |

  dw $FFF8, $0000, $0004, $0000             ; $17CBF1 |
  dw $FFF8, $FFF4                           ; $17CBF9 |

  dw $0003, $FFED, $FFFE, $FFF2             ; $17CBFD |
  dw $FFFE, $FFF2                           ; $17CC05 |

  dw $FFE7, $0009, $0001, $FFEF             ; $17CC09 |
  dw $FFEF                                  ; $17CC11 |

  dw $0001, $0005, $FFEB, $FFEB             ; $17CC15 |
  dw $0005, $0010, $FFE0                    ; $17CC1D |

  dw $0010, $FFE0, $FFEB, $0005             ; $17CC21 |
  dw $0005, $FFEB                           ; $17CC29 |

  dw $0009, $0014, $0009, $FFEF             ; $17CC2D |
  dw $FFE4, $FFEF                           ; $17CC35 |

  dw $FFE4, $FFEF, $0009, $0014             ; $17CC39 |
  dw $0009, $FFEF                           ; $17CC41 |

  dw $0014, $0009, $0009, $FFEF             ; $17CC45 |
  dw $FFEF, $FFE4                           ; $17CC4D |

  dw $FFEF, $0009, $0014, $0009             ; $17CC51 |
  dw $FFEF, $FFE4                           ; $17CC59 |

  dw $0014, $0009, $0009, $FFEF             ; $17CC5D |
  dw $FFEF, $FFE4                           ; $17CC65 |

CODE_17CC69:
  JSR CODE_17D885                           ; $17CC69 |
  INC $1118                                 ; $17CC6C |

CODE_17CC6F:
  REP #$30                                  ; $17CC6F |
  LDA $1106                                 ; $17CC71 |
  AND #$0001                                ; $17CC74 |
  ASL A                                     ; $17CC77 |
  TAY                                       ; $17CC78 |
  LDA #$0000                                ; $17CC79 |
  STA $01                                   ; $17CC7C |
  LDA $CC8F,y                               ; $17CC7E |
  TAX                                       ; $17CC81 |
  LDY #$1E20                                ; $17CC82 |
  LDA #$0380                                ; $17CC85 |
  JSL $00BEA6                               ; $17CC88 |
  SEP #$30                                  ; $17CC8C |
  RTS                                       ; $17CC8E |

  dw $0D86, $0A06                           ; $17CC8F |

CODE_17CC93:
  REP #$30                                  ; $17CC93 |
  LDA $1106                                 ; $17CC95 |
  AND #$0001                                ; $17CC98 |
  ASL A                                     ; $17CC9B |
  TAY                                       ; $17CC9C |
  LDX #$5800                                ; $17CC9D |
  LDA #$0070                                ; $17CCA0 |
  STA $01                                   ; $17CCA3 |
  LDA $CCB6,y                               ; $17CCA5 |
  TAY                                       ; $17CCA8 |
  LDA #$0800                                ; $17CCA9 |
  JSL $00BEA6                               ; $17CCAC |
  SEP #$30                                  ; $17CCB0 |
  INC $1118                                 ; $17CCB2 |
  RTS                                       ; $17CCB5 |

  dw $2800, $2000                           ; $17CCB6 |

CODE_17CCBA:
  REP #$30                                  ; $17CCBA |
  LDA $1106                                 ; $17CCBC |
  AND #$0001                                ; $17CCBF |
  ASL A                                     ; $17CCC2 |
  TAY                                       ; $17CCC3 |
  LDX #$6000                                ; $17CCC4 |
  LDA #$0070                                ; $17CCC7 |
  STA $01                                   ; $17CCCA |
  LDA $CCF1,y                               ; $17CCCC |
  TAY                                       ; $17CCCF |
  LDA #$0800                                ; $17CCD0 |
  JSL $00BEA6                               ; $17CCD3 |
  SEP #$10                                  ; $17CCD7 |
  LDA #$FF00                                ; $17CCD9 |
  STA $7E55C0                               ; $17CCDC |
  STA $1144                                 ; $17CCE0 |
  STZ $1107                                 ; $17CCE3 |
  SEP #$20                                  ; $17CCE6 |
  LDA #$01                                  ; $17CCE8 |
  STA !r_reg_tmw_mirror                     ; $17CCEA |
  INC $1118                                 ; $17CCED |
  RTS                                       ; $17CCF0 |

  dw $2C00, $2400                           ; $17CCF1 |

CODE_17CCF5:
  PHB                                       ; $17CCF5 |
  LDY #$7E                                  ; $17CCF6 |
  PHY                                       ; $17CCF8 |
  PLB                                       ; $17CCF9 |
  LDY #$00                                  ; $17CCFA |
  LDA #$00FF                                ; $17CCFC |

CODE_17CCFF:
  STA $55C0,y                               ; $17CCFF |
  STA $5620,y                               ; $17CD02 |
  DEY                                       ; $17CD05 |
  DEY                                       ; $17CD06 |
  BNE CODE_17CCFF                           ; $17CD07 |
  PLB                                       ; $17CD09 |
  RTS                                       ; $17CD0A |

  JSR CODE_17CCF5                           ; $17CD0B |
  RTL                                       ; $17CD0E |

  JSR CODE_17E7BF                           ; $17CD0F |

CODE_17CD12:
  REP #$30                                  ; $17CD12 |
  LDA $1107                                 ; $17CD14 |
  AND #$00FF                                ; $17CD17 |
  ASL A                                     ; $17CD1A |
  ASL A                                     ; $17CD1B |
  TAX                                       ; $17CD1C |
  LDA #$EF10                                ; $17CD1D |
  LDY #$0000                                ; $17CD20 |

CODE_17CD23:
  STA $7E55C4,x                             ; $17CD23 |
  INX                                       ; $17CD27 |
  INX                                       ; $17CD28 |
  INX                                       ; $17CD29 |
  INX                                       ; $17CD2A |
  INY                                       ; $17CD2B |
  CPY #$0004                                ; $17CD2C |
  BCC CODE_17CD23                           ; $17CD2F |
  SEP #$30                                  ; $17CD31 |
  LDA $1107                                 ; $17CD33 |
  CLC                                       ; $17CD36 |
  ADC #$04                                  ; $17CD37 |
  STA $1107                                 ; $17CD39 |
  CMP #$54                                  ; $17CD3C |
  BCC CODE_17CD62                           ; $17CD3E |
  REP #$30                                  ; $17CD40 |
  LDA $1106                                 ; $17CD42 |
  AND #$0001                                ; $17CD45 |
  ASL A                                     ; $17CD48 |
  TAY                                       ; $17CD49 |
  LDA #$0000                                ; $17CD4A |
  STA $01                                   ; $17CD4D |
  LDA $CC8F,y                               ; $17CD4F |
  TAX                                       ; $17CD52 |
  LDY #$1C20                                ; $17CD53 |
  LDA #$0380                                ; $17CD56 |
  JSL $00BEA6                               ; $17CD59 |
  SEP #$30                                  ; $17CD5D |
  INC $1118                                 ; $17CD5F |

CODE_17CD62:
  RTS                                       ; $17CD62 |

CODE_17CD63:
  REP #$20                                  ; $17CD63 |
  JSR CODE_17CCF5                           ; $17CD65 |
  SEP #$20                                  ; $17CD68 |
  LDA #$17                                  ; $17CD6A |
  STA !r_reg_tmw_mirror                     ; $17CD6C |
  STZ !r_reg_cgwsel_mirror                  ; $17CD6F |
  INC $1118                                 ; $17CD72 |
  RTS                                       ; $17CD75 |

  INC $1142                                 ; $17CD76 |
  INC $0990                                 ; $17CD79 |
  INC $0992                                 ; $17CD7C |
  INC $0994                                 ; $17CD7F |
  LDA $0994                                 ; $17CD82 |
  CMP #$1F                                  ; $17CD85 |
  BCC CODE_17CD96                           ; $17CD87 |
  INC $1118                                 ; $17CD89 |
  REP #$20                                  ; $17CD8C |
  LDA !r_cur_world                          ; $17CD8E |
  STA $1125                                 ; $17CD91 |
  SEP #$20                                  ; $17CD94 |

CODE_17CD96:
  RTS                                       ; $17CD96 |

  JSL clear_all_sprites                     ; $17CD97 |
  JSL $008259                               ; $17CD9B |
  REP #$30                                  ; $17CD9F |
  STZ $112E                                 ; $17CDA1 |
  JSL $17A86D                               ; $17CDA4 |
  REP #$30                                  ; $17CDA8 |
  JSL $00BB47                               ; $17CDAA |
  SEP #$30                                  ; $17CDAE |
  JSR CODE_17C6EC                           ; $17CDB0 |
  INC $1118                                 ; $17CDB3 |
  RTS                                       ; $17CDB6 |

  REP #$30                                  ; $17CDB7 |
  LDA #$0000                                ; $17CDB9 |
  LDX #$0000                                ; $17CDBC |
  BRA CODE_17CDCF                           ; $17CDBF |
  REP #$30                                  ; $17CDC1 |
  LDA #$0800                                ; $17CDC3 |
  LDX #$0001                                ; $17CDC6 |
  BRA CODE_17CDCF                           ; $17CDC9 |
  INC $1118                                 ; $17CDCB |
  RTS                                       ; $17CDCE |

CODE_17CDCF:
  STA $0E                                   ; $17CDCF |
  STX $00                                   ; $17CDD1 |
  LDA !r_cur_world                          ; $17CDD3 |
  CLC                                       ; $17CDD6 |
  ADC $00                                   ; $17CDD7 |
  TAX                                       ; $17CDD9 |
  LDA $00B3F4,x                             ; $17CDDA |
  AND #$00FF                                ; $17CDDE |
  STA $0C                                   ; $17CDE1 |
  ASL A                                     ; $17CDE3 |
  ADC $0C                                   ; $17CDE4 |
  TAX                                       ; $17CDE6 |
  LDA $06F95E,x                             ; $17CDE7 |
  STA !gsu_r9                               ; $17CDEB |
  LDA $06F960,x                             ; $17CDEE |
  AND #$00FF                                ; $17CDF2 |
  STA !gsu_r4                               ; $17CDF5 |
  LDA #$5800                                ; $17CDF8 |
  STA !gsu_r10                              ; $17CDFB |
  SEP #$10                                  ; $17CDFE |
  LDX #$08                                  ; $17CE00 |
  LDA #$A980                                ; $17CE02 |
  JSL r_gsu_init_1                          ; $17CE05 | GSU init
  REP #$10                                  ; $17CE09 |
  JSR CODE_17CE11                           ; $17CE0B |
  SEP #$30                                  ; $17CE0E |
  RTS                                       ; $17CE10 |

CODE_17CE11:
  LDX #$5800                                ; $17CE11 |
  LDA #$0070                                ; $17CE14 |
  STA $01                                   ; $17CE17 |
  LDY $0E                                   ; $17CE19 |
  LDA #$0800                                ; $17CE1B |
  JSL $00BEA6                               ; $17CE1E |
  INC $1118                                 ; $17CE22 |
  RTS                                       ; $17CE25 |

  dw $0400, $0C00, $1800                    ; $17CE26 |

  LDA $1118                                 ; $17CE2C |
  SEC                                       ; $17CE2F |
  SBC #$09                                  ; $17CE30 |
  REP #$30                                  ; $17CE32 |
  AND #$00FF                                ; $17CE34 |
  TAY                                       ; $17CE37 |
  LDX #$6000                                ; $17CE38 |
  LDA #$0070                                ; $17CE3B |
  STA $01                                   ; $17CE3E |
  LDA $CE25,y                               ; $17CE40 |
  TAY                                       ; $17CE43 |
  LDA #$0800                                ; $17CE44 |
  JSL $00BEA6                               ; $17CE47 |
  SEP #$30                                  ; $17CE4B |
  INC $1118                                 ; $17CE4D |
  RTS                                       ; $17CE50 |

  REP #$30                                  ; $17CE51 |
  LDX #$4000                                ; $17CE53 |
  LDY #$0000                                ; $17CE56 |
  BRA CODE_17CE9F                           ; $17CE59 |
  REP #$30                                  ; $17CE5B |
  LDX #$4400                                ; $17CE5D |
  LDY #$0001                                ; $17CE60 |
  BRA CODE_17CE9F                           ; $17CE63 |
  REP #$30                                  ; $17CE65 |
  LDX #$4800                                ; $17CE67 |
  LDY #$0002                                ; $17CE6A |
  BRA CODE_17CE9F                           ; $17CE6D |
  REP #$30                                  ; $17CE6F |
  LDX #$4C00                                ; $17CE71 |
  LDY #$0003                                ; $17CE74 |
  BRA CODE_17CE9F                           ; $17CE77 |
  REP #$30                                  ; $17CE79 |
  LDX #$5000                                ; $17CE7B |
  LDY #$0004                                ; $17CE7E |
  BRA CODE_17CE9F                           ; $17CE81 |
  REP #$30                                  ; $17CE83 |
  LDX #$5400                                ; $17CE85 |
  LDY #$0005                                ; $17CE88 |
  BRA CODE_17CE9F                           ; $17CE8B |
  REP #$30                                  ; $17CE8D |
  LDX #$5800                                ; $17CE8F |
  LDY #$0006                                ; $17CE92 |
  BRA CODE_17CE9F                           ; $17CE95 |
  REP #$30                                  ; $17CE97 |
  LDX #$5C00                                ; $17CE99 |
  LDY #$0007                                ; $17CE9C |

CODE_17CE9F:
  STX $0E                                   ; $17CE9F |
  STY $00                                   ; $17CEA1 |
  LDA !r_cur_world                          ; $17CEA3 |
  ASL A                                     ; $17CEA6 |
  ASL A                                     ; $17CEA7 |
  ADC $00                                   ; $17CEA8 |
  TAX                                       ; $17CEAA |
  LDA $00B409,x                             ; $17CEAB |
  AND #$00FF                                ; $17CEAF |
  STA $0C                                   ; $17CEB2 |
  ASL A                                     ; $17CEB4 |
  ADC $0C                                   ; $17CEB5 |
  TAX                                       ; $17CEB7 |
  LDA #$0020                                ; $17CEB8 |
  JSR CODE_17CEC1                           ; $17CEBB |
  SEP #$30                                  ; $17CEBE |
  RTS                                       ; $17CEC0 |

CODE_17CEC1:
  STA !gsu_r3                               ; $17CEC1 |
  LDA $06FC79,x                             ; $17CEC4 |
  STA !gsu_r1                               ; $17CEC8 |
  LDA $06FC7B,x                             ; $17CECB |
  AND #$00FF                                ; $17CECF |
  STA !gsu_r0                               ; $17CED2 |
  SEP #$10                                  ; $17CED5 |
  LDX #$0A                                  ; $17CED7 |
  LDA #$8000                                ; $17CED9 |
  JSL r_gsu_init_1                          ; $17CEDC | GSU init
  REP #$10                                  ; $17CEE0 |
  JSR CODE_17CE11                           ; $17CEE2 |
  RTS                                       ; $17CEE5 |

  LDX #$6000                                ; $17CEE6 |
  LDA #$0070                                ; $17CEE9 |
  STA $01                                   ; $17CEEC |
  LDA #$0800                                ; $17CEEE |
  JSL $00BEA6                               ; $17CEF1 |
  INC $1118                                 ; $17CEF5 |
  SEP #$30                                  ; $17CEF8 |
  RTS                                       ; $17CEFA |

  DEC $1142                                 ; $17CEFB |
  DEC $0990                                 ; $17CEFE |
  DEC $0992                                 ; $17CF01 |
  DEC $0994                                 ; $17CF04 |
  BNE CODE_17CF17                           ; $17CF07 |
  STZ $1142                                 ; $17CF09 |
  STZ $1118                                 ; $17CF0C |
  LDA #$10                                  ; $17CF0F |
  STA !r_reg_cgwsel_mirror                  ; $17CF11 |
  STZ !r_reg_tmw_mirror                     ; $17CF14 |

CODE_17CF17:
  RTS                                       ; $17CF17 |

  LDX #$14                                  ; $17CF18 |
  JSR CODE_17CFA2                           ; $17CF1A |
  LDA #$36                                  ; $17CF1D |\ play sound #$0036
  JSL push_sound_queue                      ; $17CF1F |/
  STZ $1107                                 ; $17CF23 |
  LDA #$0A                                  ; $17CF26 |
  JSR CODE_17CFDA                           ; $17CF28 |
  INC $1118                                 ; $17CF2B |
  RTS                                       ; $17CF2E |

  LDA #$0A                                  ; $17CF2F |
  JSR CODE_17CFDA                           ; $17CF31 |
  LDA $1107                                 ; $17CF34 |
  CLC                                       ; $17CF37 |
  ADC #$08                                  ; $17CF38 |
  STA $1107                                 ; $17CF3A |
  CMP #$40                                  ; $17CF3D |
  BCC CODE_17CF44                           ; $17CF3F |
  INC $1118                                 ; $17CF41 |

CODE_17CF44:
  RTS                                       ; $17CF44 |

  LDA $1107                                 ; $17CF45 |
  SEC                                       ; $17CF48 |
  SBC #$08                                  ; $17CF49 |
  STA $1107                                 ; $17CF4B |
  BPL CODE_17CF56                           ; $17CF4E |
  STZ $1107                                 ; $17CF50 |
  INC $1118                                 ; $17CF53 |

CODE_17CF56:
  LDA #$0A                                  ; $17CF56 |
  JSR CODE_17CFDA                           ; $17CF58 |
  RTS                                       ; $17CF5B |

  JSR CODE_17D005                           ; $17CF5C |
  REP #$20                                  ; $17CF5F |
  LDA $DC3B                                 ; $17CF61 |
  ORA #$1800                                ; $17CF64 |
  STA $00                                   ; $17CF67 |
  LDX #$14                                  ; $17CF69 |
  LDA $DCEF,x                               ; $17CF6B |
  LDY $1106                                 ; $17CF6E |
  BNE CODE_17CF80                           ; $17CF71 |
  PHA                                       ; $17CF73 |
  LDA $00                                   ; $17CF74 |
  ORA #$0080                                ; $17CF76 |
  STA $00                                   ; $17CF79 |
  PLA                                       ; $17CF7B |
  CLC                                       ; $17CF7C |
  ADC #$0380                                ; $17CF7D |

CODE_17CF80:
  STA $0A                                   ; $17CF80 |
  CLC                                       ; $17CF82 |
  ADC #$0040                                ; $17CF83 |
  STA $0C                                   ; $17CF86 |
  CLC                                       ; $17CF88 |
  ADC #$0040                                ; $17CF89 |
  STA $0E                                   ; $17CF8C |
  JSR CODE_17DC09                           ; $17CF8E |
  LDA #$1C20                                ; $17CF91 |
  STA $04                                   ; $17CF94 |
  JSR CODE_17D52B                           ; $17CF96 |
  SEP #$20                                  ; $17CF99 |
  STZ $1107                                 ; $17CF9B |
  INC $1118                                 ; $17CF9E |
  RTS                                       ; $17CFA1 |

CODE_17CFA2:
  REP #$20                                  ; $17CFA2 |
  LDA $DCEF,x                               ; $17CFA4 |
  LDY $1106                                 ; $17CFA7 |
  BNE CODE_17CFB0                           ; $17CFAA |
  CLC                                       ; $17CFAC |
  ADC #$0380                                ; $17CFAD |

CODE_17CFB0:
  STA $00                                   ; $17CFB0 |
  CLC                                       ; $17CFB2 |
  ADC #$0040                                ; $17CFB3 |
  STA $02                                   ; $17CFB6 |
  CLC                                       ; $17CFB8 |
  ADC #$0040                                ; $17CFB9 |
  STA $04                                   ; $17CFBC |
  LDY #$00                                  ; $17CFBE |
  LDA #$398E                                ; $17CFC0 |

CODE_17CFC3:
  STA ($00),y                               ; $17CFC3 |
  STA ($02),y                               ; $17CFC5 |
  STA ($04),y                               ; $17CFC7 |
  INY                                       ; $17CFC9 |
  INY                                       ; $17CFCA |
  CPY #$06                                  ; $17CFCB |
  BCC CODE_17CFC3                           ; $17CFCD |
  LDA #$1C20                                ; $17CFCF |
  STA $04                                   ; $17CFD2 |
  JSR CODE_17D52B                           ; $17CFD4 |
  SEP #$20                                  ; $17CFD7 |
  RTS                                       ; $17CFD9 |

CODE_17CFDA:
  REP #$20                                  ; $17CFDA |
  AND #$00FF                                ; $17CFDC |
  STA !gsu_r3                               ; $17CFDF |
  LDA #$0015                                ; $17CFE2 |
  STA !gsu_r1                               ; $17CFE5 |
  LDA $1107                                 ; $17CFE8 |
  AND #$00FF                                ; $17CFEB |
  STA $00                                   ; $17CFEE |
  LDA #$0100                                ; $17CFF0 |
  SEC                                       ; $17CFF3 |
  SBC $00                                   ; $17CFF4 |
  STA !gsu_r6                               ; $17CFF6 |
  LDX #$08                                  ; $17CFF9 |
  LDA #$DBDE                                ; $17CFFB |
  JSL r_gsu_init_1                          ; $17CFFE | GSU init
  JSR CODE_17D08B                           ; $17D002 |

CODE_17D005:
  REP #$30                                  ; $17D005 |
  LDY !s_oam_next_free_slot_ptr             ; $17D007 |
  LDA $1109                                 ; $17D00A |
  AND #$00FF                                ; $17D00D |
  SEC                                       ; $17D010 |
  SBC #$0010                                ; $17D011 |
  STA $6000,y                               ; $17D014 |
  STA $6010,y                               ; $17D017 |
  CLC                                       ; $17D01A |
  ADC #$0010                                ; $17D01B |
  STA $6008,y                               ; $17D01E |
  STA $6018,y                               ; $17D021 |
  LDA $110A                                 ; $17D024 |
  AND #$00FF                                ; $17D027 |
  SEC                                       ; $17D02A |
  SBC #$0016                                ; $17D02B |
  STA $6002,y                               ; $17D02E |
  STA $600A,y                               ; $17D031 |
  CLC                                       ; $17D034 |
  ADC #$0010                                ; $17D035 |
  STA $6012,y                               ; $17D038 |
  STA $601A,y                               ; $17D03B |
  STZ $00                                   ; $17D03E |
  LDA $114E                                 ; $17D040 |
  BNE CODE_17D052                           ; $17D043 |
  LDA $1118                                 ; $17D045 |
  CMP #$0031                                ; $17D048 |
  BCS CODE_17D052                           ; $17D04B |
  LDA #$0600                                ; $17D04D |
  STA $00                                   ; $17D050 |

CODE_17D052:
  LDA #$31CC                                ; $17D052 |
  ORA $00                                   ; $17D055 |
  STA $6004,y                               ; $17D057 |
  INC A                                     ; $17D05A |
  INC A                                     ; $17D05B |
  STA $600C,y                               ; $17D05C |
  LDA #$31EC                                ; $17D05F |
  ORA $00                                   ; $17D062 |
  STA $6014,y                               ; $17D064 |
  INC A                                     ; $17D067 |
  INC A                                     ; $17D068 |
  STA $601C,y                               ; $17D069 |
  LDA #$4002                                ; $17D06C |
  STA $6006,y                               ; $17D06F |
  STA $600E,y                               ; $17D072 |
  STA $6016,y                               ; $17D075 |
  STA $601E,y                               ; $17D078 |
  TYA                                       ; $17D07B |
  CLC                                       ; $17D07C |
  ADC #$0020                                ; $17D07D |
  STA !s_oam_next_free_slot_ptr             ; $17D080 |
  SEP #$30                                  ; $17D083 |
  LDA #$20                                  ; $17D085 |
  STA $1122                                 ; $17D087 |
  RTS                                       ; $17D08A |

CODE_17D08B:
  REP #$30                                  ; $17D08B |
  LDA #$0070                                ; $17D08D |
  STA $01                                   ; $17D090 |
  LDY #$7CC0                                ; $17D092 |
  LDX #$5800                                ; $17D095 |
  LDA #$0080                                ; $17D098 |
  JSL $00BEA6                               ; $17D09B |
  LDY #$7DC0                                ; $17D09F |
  LDX #$5A00                                ; $17D0A2 |
  LDA #$0080                                ; $17D0A5 |
  JSL $00BEA6                               ; $17D0A8 |
  LDY #$7EC0                                ; $17D0AC |
  LDX #$5C00                                ; $17D0AF |
  LDA #$0080                                ; $17D0B2 |
  JSL $00BEA6                               ; $17D0B5 |
  LDY #$7FC0                                ; $17D0B9 |
  LDX #$5E00                                ; $17D0BC |
  LDA #$0080                                ; $17D0BF |
  JSL $00BEA6                               ; $17D0C2 |
  SEP #$30                                  ; $17D0C6 |
  RTS                                       ; $17D0C8 |

  JSR CODE_17D08B                           ; $17D0C9 |
  RTL                                       ; $17D0CC |

  dw $21AB, $21AC, $21AC, $61AB             ; $17D0CD |

  dw $21AD, $21AE, $21AE, $61AD             ; $17D0D5 |

  dw $21AD, $218A, $218B, $61AD             ; $17D0DD |

  dw $A1AB, $A1AC, $A1AC, $E1AB             ; $17D0E5 |

  dw $0ACE, $0AD6, $0ADE, $0AE6             ; $17D0ED |
  dw $0AEE, $0AF6, $0C0E, $0C16             ; $17D0F5 |
  dw $0C1E                                  ; $17D0FD |

  dw $0B0E, $0B16, $0B1E, $0B26             ; $17D0FF |
  dw $0B2E, $0B36, $0C4E, $0C56             ; $17D107 |
  dw $0C5E                                  ; $17D10F |

  dw $0B4E, $0B56, $0B5E, $0B66             ; $17D111 |
  dw $0B6E, $0B76, $0C8E, $0C96             ; $17D119 |
  dw $0C9E                                  ; $17D121 |

  dw $0B8E, $0B96, $0B9E, $0BA6             ; $17D123 |
  dw $0BAE, $0BB6, $0CCE, $0CD6             ; $17D12B |
  dw $0CDE                                  ; $17D133 |

  JSR CODE_17D005                           ; $17D135 |
  REP #$30                                  ; $17D138 |
  LDY #$0000                                ; $17D13A |
  LDA $1106                                 ; $17D13D |
  AND #$00FF                                ; $17D140 |
  TAX                                       ; $17D143 |
  BEQ CODE_17D149                           ; $17D144 |
  LDX #$0380                                ; $17D146 |

CODE_17D149:
  STX $0A                                   ; $17D149 |
  LDA #$19BF                                ; $17D14B |

CODE_17D14E:
  STA $0A06,x                               ; $17D14E |
  STA $0B06,x                               ; $17D151 |
  STA $0C06,x                               ; $17D154 |
  STA $0C86,x                               ; $17D157 |
  INX                                       ; $17D15A |
  INX                                       ; $17D15B |
  INY                                       ; $17D15C |
  CPY #$0080                                ; $17D15D |
  BCC CODE_17D14E                           ; $17D160 |
  STZ $0E                                   ; $17D162 |

CODE_17D164:
  LDY $0E                                   ; $17D164 |
  LDA $D0ED,y                               ; $17D166 |
  STA $00                                   ; $17D169 |
  LDA $D0FF,y                               ; $17D16B |
  STA $02                                   ; $17D16E |
  LDA $D111,y                               ; $17D170 |
  STA $04                                   ; $17D173 |
  LDA $D123,y                               ; $17D175 |
  STA $06                                   ; $17D178 |
  LDA #$0C00                                ; $17D17A |
  STA $0C                                   ; $17D17D |
  LDX !r_cur_world                          ; $17D17F |
  TYA                                       ; $17D182 |
  LSR A                                     ; $17D183 |
  CLC                                       ; $17D184 |
  ADC $E198,x                               ; $17D185 |
  TAY                                       ; $17D188 |
  LDA !r_stage_scores,y                     ; $17D189 |
  AND #$00FF                                ; $17D18C |
  CMP #$001E                                ; $17D18F |
  BCS CODE_17D1B0                           ; $17D192 |
  LDA $0E                                   ; $17D194 |
  CMP #$0010                                ; $17D196 |
  BNE CODE_17D1A3                           ; $17D199 |
  LDA !r_stage_scores,y                     ; $17D19B |
  AND #$00FF                                ; $17D19E |
  BEQ CODE_17D1B0                           ; $17D1A1 |

CODE_17D1A3:
  LDA !r_stages_unlocked,y                  ; $17D1A3 |
  AND #$007F                                ; $17D1A6 |
  BEQ CODE_17D1B0                           ; $17D1A9 |
  LDA #$1000                                ; $17D1AB |
  STA $0C                                   ; $17D1AE |

CODE_17D1B0:
  LDX #$0000                                ; $17D1B0 |
  LDY $0A                                   ; $17D1B3 |

CODE_17D1B5:
  LDA $D0CD,x                               ; $17D1B5 |
  ORA $0C                                   ; $17D1B8 |
  STA ($00),y                               ; $17D1BA |
  LDA $D0D5,x                               ; $17D1BC |
  ORA $0C                                   ; $17D1BF |
  STA ($02),y                               ; $17D1C1 |
  LDA $D0DD,x                               ; $17D1C3 |
  ORA $0C                                   ; $17D1C6 |
  STA ($04),y                               ; $17D1C8 |
  LDA $D0E5,x                               ; $17D1CA |
  ORA $0C                                   ; $17D1CD |
  STA ($06),y                               ; $17D1CF |
  INY                                       ; $17D1D1 |
  INY                                       ; $17D1D2 |
  INX                                       ; $17D1D3 |
  INX                                       ; $17D1D4 |
  CPX #$0008                                ; $17D1D5 |
  BCC CODE_17D1B5                           ; $17D1D8 |
  INC $0E                                   ; $17D1DA |
  INC $0E                                   ; $17D1DC |
  LDA $0E                                   ; $17D1DE |
  CMP #$0012                                ; $17D1E0 |
  BCS CODE_17D1E8                           ; $17D1E3 |
  JMP CODE_17D164                           ; $17D1E5 |

CODE_17D1E8:
  SEP #$10                                  ; $17D1E8 |
  LDA #$1E20                                ; $17D1EA |
  STA $04                                   ; $17D1ED |
  LDA $1106                                 ; $17D1EF |
  EOR #$0001                                ; $17D1F2 |
  STA $1106                                 ; $17D1F5 |
  JSR CODE_17D52B                           ; $17D1F8 |
  LDA $1106                                 ; $17D1FB |
  EOR #$0001                                ; $17D1FE |
  STA $1106                                 ; $17D201 |
  SEP #$20                                  ; $17D204 |
  LDA #$04                                  ; $17D206 |
  STA $3D                                   ; $17D208 |
  LDA #$84                                  ; $17D20A |
  STA $3F                                   ; $17D20C |
  STZ $111F                                 ; $17D20E |
  STZ $1120                                 ; $17D211 |
  STZ $1121                                 ; $17D214 |
  LDA #$00                                  ; $17D217 |
  STA $7E5C19                               ; $17D219 |
  INC $1118                                 ; $17D21D |
  RTS                                       ; $17D220 |

  JSR CODE_17D005                           ; $17D221 |
  JSR CODE_17D233                           ; $17D224 |
  LDA #$36                                  ; $17D227 |\ play sound #$0036
  JSL push_sound_queue                      ; $17D229 |/
  INC $1118                                 ; $17D22D |
  JMP CODE_17D2BE                           ; $17D230 |

CODE_17D233:
  LDA $111F                                 ; $17D233 |
  ASL A                                     ; $17D236 |
  TAX                                       ; $17D237 |
  REP #$20                                  ; $17D238 |
  LDA $DCEF,x                               ; $17D23A |
  LDY $1106                                 ; $17D23D |
  BNE CODE_17D246                           ; $17D240 |
  CLC                                       ; $17D242 |
  ADC #$0380                                ; $17D243 |

CODE_17D246:
  STA $00                                   ; $17D246 |
  CLC                                       ; $17D248 |
  ADC #$0040                                ; $17D249 |
  STA $02                                   ; $17D24C |
  CLC                                       ; $17D24E |
  ADC #$0040                                ; $17D24F |
  STA $04                                   ; $17D252 |
  LDY #$00                                  ; $17D254 |
  LDX !r_cur_world                          ; $17D256 |
  LDA $C9EA,x                               ; $17D259 |
  STA $06                                   ; $17D25C |

CODE_17D25E:
  LDA $111F                                 ; $17D25E |
  AND #$00FF                                ; $17D261 |
  CMP #$0003                                ; $17D264 |
  BEQ CODE_17D273                           ; $17D267 |
  CMP #$0007                                ; $17D269 |
  BEQ CODE_17D273                           ; $17D26C |
  JSR CODE_17D287                           ; $17D26E |
  BRA CODE_17D276                           ; $17D271 |

CODE_17D273:
  JSR CODE_17D29D                           ; $17D273 |

CODE_17D276:
  INY                                       ; $17D276 |
  INY                                       ; $17D277 |
  CPY #$06                                  ; $17D278 |
  BCC CODE_17D25E                           ; $17D27A |
  LDA #$1C20                                ; $17D27C |
  STA $04                                   ; $17D27F |
  JSR CODE_17D52B                           ; $17D281 |
  SEP #$20                                  ; $17D284 |
  RTS                                       ; $17D286 |

CODE_17D287:
  LDA $C9C6,y                               ; $17D287 |
  ORA $06                                   ; $17D28A |
  STA ($00),y                               ; $17D28C |
  LDA $C9CC,y                               ; $17D28E |
  ORA $06                                   ; $17D291 |
  STA ($02),y                               ; $17D293 |
  LDA $C9D2,y                               ; $17D295 |
  ORA $06                                   ; $17D298 |
  STA ($04),y                               ; $17D29A |
  RTS                                       ; $17D29C |

CODE_17D29D:
  LDA $C9D8,y                               ; $17D29D |
  ORA $06                                   ; $17D2A0 |
  STA ($00),y                               ; $17D2A2 |
  LDA $C9DE,y                               ; $17D2A4 |
  ORA $06                                   ; $17D2A7 |
  STA ($02),y                               ; $17D2A9 |
  LDA $C9E4,y                               ; $17D2AB |
  ORA $06                                   ; $17D2AE |
  STA ($04),y                               ; $17D2B0 |
  RTS                                       ; $17D2B2 |

  PHB                                       ; $17D2B3 |
  PHK                                       ; $17D2B4 |
  PLB                                       ; $17D2B5 |
  JSR CODE_17D233                           ; $17D2B6 |
  PLB                                       ; $17D2B9 |
  RTL                                       ; $17D2BA |

  JSR CODE_17D005                           ; $17D2BB |

CODE_17D2BE:
  JSR CODE_17D340                           ; $17D2BE |
  LDA $1120                                 ; $17D2C1 |
  CLC                                       ; $17D2C4 |
  ADC #$10                                  ; $17D2C5 |
  STA $1120                                 ; $17D2C7 |
  JSR CODE_17D780                           ; $17D2CA |
  LDA $1120                                 ; $17D2CD |
  BPL CODE_17D2D8                           ; $17D2D0 |
  INC $1121                                 ; $17D2D2 |
  INC $1118                                 ; $17D2D5 |

CODE_17D2D8:
  RTS                                       ; $17D2D8 |

  JSR CODE_17D005                           ; $17D2D9 |
  LDA $1120                                 ; $17D2DC |
  SEC                                       ; $17D2DF |
  SBC #$10                                  ; $17D2E0 |
  STA $1120                                 ; $17D2E2 |
  BMI CODE_17D2EC                           ; $17D2E5 |
  JSR CODE_17D340                           ; $17D2E7 |
  BRA CODE_17D322                           ; $17D2EA |

CODE_17D2EC:
  JSR CODE_17D3E4                           ; $17D2EC |
  STZ $1120                                 ; $17D2EF |
  LDA !r_cur_world                          ; $17D2F2 |
  LSR A                                     ; $17D2F5 |
  TAX                                       ; $17D2F6 |

CODE_17D2F7:
  INC $111F                                 ; $17D2F7 |
  LDA $111F                                 ; $17D2FA |
  CMP #$09                                  ; $17D2FD |
  BCS CODE_17D31A                           ; $17D2FF |
  CLC                                       ; $17D301 |
  ADC $E187,x                               ; $17D302 |
  TAY                                       ; $17D305 |
  LDA !r_map_icon_gfx,y                     ; $17D306 |
  BEQ CODE_17D2F7                           ; $17D309 |
  CMP #$F0                                  ; $17D30B |
  BEQ CODE_17D31A                           ; $17D30D |
  STZ $1121                                 ; $17D30F |
  DEC $1118                                 ; $17D312 |
  DEC $1118                                 ; $17D315 |
  BRA CODE_17D325                           ; $17D318 |

CODE_17D31A:
  DEC $111F                                 ; $17D31A |
  INC $1118                                 ; $17D31D |
  BRA CODE_17D325                           ; $17D320 |

CODE_17D322:
  JSR CODE_17D780                           ; $17D322 |

CODE_17D325:
  RTS                                       ; $17D325 |

  LDA $1120                                 ; $17D326 |
  SEC                                       ; $17D329 |
  SBC #$10                                  ; $17D32A |
  STA $1120                                 ; $17D32C |
  BMI CODE_17D336                           ; $17D32F |
  JSR CODE_17D340                           ; $17D331 |
  BRA CODE_17D33C                           ; $17D334 |

CODE_17D336:
  JSR CODE_17D3E4                           ; $17D336 |
  INC $1118                                 ; $17D339 |

CODE_17D33C:
  JSR CODE_17D780                           ; $17D33C |
  RTS                                       ; $17D33F |

CODE_17D340:
  REP #$20                                  ; $17D340 |
  LDY !r_cur_world                          ; $17D342 |
  LDA $DBA3,y                               ; $17D345 |
  STA $00                                   ; $17D348 |
  LDA !r_cur_world                          ; $17D34A |
  LSR A                                     ; $17D34D |
  TAY                                       ; $17D34E |
  PHY                                       ; $17D34F |
  LDA $E187,y                               ; $17D350 |
  CLC                                       ; $17D353 |
  ADC $111F                                 ; $17D354 |
  AND #$00FF                                ; $17D357 |
  TAX                                       ; $17D35A |
  LDA !r_map_icon_gfx,x                     ; $17D35B |
  DEC A                                     ; $17D35E |
  AND #$007F                                ; $17D35F |
  TAY                                       ; $17D362 |
  LDA ($00),y                               ; $17D363 |
  AND #$00FF                                ; $17D365 |
  STA !gsu_r1                               ; $17D368 |
  LDA $1121                                 ; $17D36B |
  AND #$00FF                                ; $17D36E |
  BEQ CODE_17D37C                           ; $17D371 |
  LDA #$0015                                ; $17D373 |
  STA !gsu_r1                               ; $17D376 |
  LDA #$6490                                ; $17D379 |

CODE_17D37C:
  STA $6000                                 ; $17D37C |
  LDA $1120                                 ; $17D37F |
  AND #$00FF                                ; $17D382 |
  STA !gsu_r2                               ; $17D385 |
  PLY                                       ; $17D388 |
  LDA !r_map_icon_gfx,x                     ; $17D389 |
  CLC                                       ; $17D38C |
  ADC $E187,y                               ; $17D38D |
  DEC A                                     ; $17D390 |
  AND #$007F                                ; $17D391 |
  STA !gsu_r3                               ; $17D394 |
  LDA #$0100                                ; $17D397 |
  STA !gsu_r11                              ; $17D39A |
  LDX #$08                                  ; $17D39D |
  LDA #$DE98                                ; $17D39F |
  JSL r_gsu_init_1                          ; $17D3A2 | GSU init
  JSR CODE_17E683                           ; $17D3A6 |
  SEP #$20                                  ; $17D3A9 |
  RTS                                       ; $17D3AB |

  PHB                                       ; $17D3AC |
  PHK                                       ; $17D3AD |
  PLB                                       ; $17D3AE |
  JSR CODE_17D340                           ; $17D3AF |
  PLB                                       ; $17D3B2 |
  RTL                                       ; $17D3B3 |

  dw $21A8, $21A0, $21A2, $21A2             ; $17D3B4 |
  dw $21A3, $21A4, $21A5, $21A6             ; $17D3BC |
  dw $21A7, $E1B5, $21A9, $21AA             ; $17D3C4 |
  dw $21B8, $21B0, $21B1, $21B2             ; $17D3CC |
  dw $21B3, $21B4, $21B5, $21B6             ; $17D3D4 |
  dw $21B7, $E1A5, $21B9, $21BA             ; $17D3DC |

CODE_17D3E4:
  LDY $111F                                 ; $17D3E4 |
  REP #$20                                  ; $17D3E7 |
  LDX !r_cur_world                          ; $17D3E9 |
  TYA                                       ; $17D3EC |
  CLC                                       ; $17D3ED |
  ADC $E198,x                               ; $17D3EE |
  AND #$00FF                                ; $17D3F1 |
  STA $10                                   ; $17D3F4 |
  TAY                                       ; $17D3F6 |
  LDA #$000A                                ; $17D3F7 |
  STA $00                                   ; $17D3FA |
  INC A                                     ; $17D3FC |
  STA $02                                   ; $17D3FD |
  LDA !r_stage_scores,y                     ; $17D3FF |
  AND #$00FF                                ; $17D402 |
  CMP #$0064                                ; $17D405 |
  BCS CODE_17D41A                           ; $17D408 |
  STZ $00                                   ; $17D40A |

CODE_17D40C:
  CMP #$000A                                ; $17D40C |
  BCC CODE_17D418                           ; $17D40F |
  SBC #$000A                                ; $17D411 |
  INC $00                                   ; $17D414 |
  BRA CODE_17D40C                           ; $17D416 |

CODE_17D418:
  STA $02                                   ; $17D418 |

CODE_17D41A:
  LDA $111F                                 ; $17D41A |
  AND #$00FF                                ; $17D41D |
  ASL A                                     ; $17D420 |
  TAY                                       ; $17D421 |
  LDA $DCEF,y                               ; $17D422 |
  PHA                                       ; $17D425 |
  LDX $1106                                 ; $17D426 |
  BEQ CODE_17D42F                           ; $17D429 |
  CLC                                       ; $17D42B |
  ADC #$0380                                ; $17D42C |

CODE_17D42F:
  CLC                                       ; $17D42F |
  ADC #$0042                                ; $17D430 |
  STA $0A                                   ; $17D433 |
  CLC                                       ; $17D435 |
  ADC #$0040                                ; $17D436 |
  STA $0C                                   ; $17D439 |
  LDA #$0C00                                ; $17D43B |
  STA $04                                   ; $17D43E |
  LDY $10                                   ; $17D440 |
  LDA !r_stage_scores,y                     ; $17D442 |
  AND #$00FF                                ; $17D445 |
  CMP #$001E                                ; $17D448 |
  BCS CODE_17D452                           ; $17D44B |
  LDA #$1000                                ; $17D44D |
  STA $04                                   ; $17D450 |

CODE_17D452:
  ASL $00                                   ; $17D452 |
  ASL $02                                   ; $17D454 |
  LDX !r_cur_world                          ; $17D456 |
  LDA $E198,x                               ; $17D459 |
  STA $08                                   ; $17D45C |
  LDY #$00                                  ; $17D45E |
  LDA $00                                   ; $17D460 |
  BNE CODE_17D49C                           ; $17D462 |
  LDA $111F                                 ; $17D464 |
  AND #$00FF                                ; $17D467 |
  CLC                                       ; $17D46A |
  ADC $08                                   ; $17D46B |
  TAX                                       ; $17D46D |
  LDA $111F                                 ; $17D46E |
  AND #$00FF                                ; $17D471 |
  CMP #$0008                                ; $17D474 |
  BNE CODE_17D481                           ; $17D477 |
  LDA !r_stage_scores,x                     ; $17D479 |
  AND #$00FF                                ; $17D47C |
  BEQ CODE_17D492                           ; $17D47F |

CODE_17D481:
  LDA !r_stages_unlocked,x                  ; $17D481 |
  AND #$007F                                ; $17D484 |
  BEQ CODE_17D492                           ; $17D487 |
  LDA #$21AE                                ; $17D489 |
  ORA $04                                   ; $17D48C |
  STA ($0A)                                 ; $17D48E |
  STA ($0C)                                 ; $17D490 |

CODE_17D492:
  INC $0A                                   ; $17D492 |
  INC $0A                                   ; $17D494 |
  INC $0C                                   ; $17D496 |
  INC $0C                                   ; $17D498 |
  INY                                       ; $17D49A |
  INY                                       ; $17D49B |

CODE_17D49C:
  LDA $111F                                 ; $17D49C |
  AND #$00FF                                ; $17D49F |
  CLC                                       ; $17D4A2 |
  ADC $08                                   ; $17D4A3 |
  TAX                                       ; $17D4A5 |
  LDA $111F                                 ; $17D4A6 |
  AND #$00FF                                ; $17D4A9 |
  CMP #$0008                                ; $17D4AC |
  BNE CODE_17D4B9                           ; $17D4AF |
  LDA !r_stage_scores,x                     ; $17D4B1 |
  AND #$00FF                                ; $17D4B4 |
  BEQ CODE_17D4D1                           ; $17D4B7 |

CODE_17D4B9:
  LDA !r_stages_unlocked,x                  ; $17D4B9 |
  AND #$007F                                ; $17D4BC |
  BEQ CODE_17D4D1                           ; $17D4BF |
  LDX $00,y                                 ; $17D4C1 |
  LDA $D3B4,x                               ; $17D4C3 |
  ORA $04                                   ; $17D4C6 |
  STA ($0A)                                 ; $17D4C8 |
  LDA $D3CC,x                               ; $17D4CA |
  ORA $04                                   ; $17D4CD |
  STA ($0C)                                 ; $17D4CF |

CODE_17D4D1:
  CPY #$02                                  ; $17D4D1 |
  BCC CODE_17D492                           ; $17D4D3 |
  LDA #$1E20                                ; $17D4D5 |
  STA $04                                   ; $17D4D8 |
  LDA $1106                                 ; $17D4DA |
  EOR #$0001                                ; $17D4DD |
  STA $1106                                 ; $17D4E0 |
  JSR CODE_17D52B                           ; $17D4E3 |
  LDA $1106                                 ; $17D4E6 |
  EOR #$0001                                ; $17D4E9 |
  STA $1106                                 ; $17D4EC |
  PLA                                       ; $17D4EF |
  LDX $1106                                 ; $17D4F0 |
  BNE CODE_17D4F9                           ; $17D4F3 |
  CLC                                       ; $17D4F5 |
  ADC #$0380                                ; $17D4F6 |

CODE_17D4F9:
  STA $00                                   ; $17D4F9 |
  CLC                                       ; $17D4FB |
  ADC #$0040                                ; $17D4FC |
  STA $02                                   ; $17D4FF |
  CLC                                       ; $17D501 |
  ADC #$0040                                ; $17D502 |
  STA $04                                   ; $17D505 |
  LDY #$00                                  ; $17D507 |
  LDA #$21BF                                ; $17D509 |

CODE_17D50C:
  STA ($00),y                               ; $17D50C |
  STA ($02),y                               ; $17D50E |
  STA ($04),y                               ; $17D510 |
  INY                                       ; $17D512 |
  INY                                       ; $17D513 |
  CPY #$06                                  ; $17D514 |
  BCC CODE_17D50C                           ; $17D516 |
  LDA #$1C20                                ; $17D518 |
  STA $04                                   ; $17D51B |
  JSR CODE_17D52B                           ; $17D51D |
  SEP #$20                                  ; $17D520 |
  RTS                                       ; $17D522 |

  PHB                                       ; $17D523 |
  PHK                                       ; $17D524 |
  PLB                                       ; $17D525 |
  JSR CODE_17D3E4                           ; $17D526 |
  PLB                                       ; $17D529 |
  RTL                                       ; $17D52A |

CODE_17D52B:
  REP #$10                                  ; $17D52B |
  LDA #$0000                                ; $17D52D |
  STA $01                                   ; $17D530 |
  LDA $1106                                 ; $17D532 |
  AND #$0001                                ; $17D535 |
  ASL A                                     ; $17D538 |
  TAY                                       ; $17D539 |
  LDA $CC8F,y                               ; $17D53A |
  TAX                                       ; $17D53D |
  LDY $04                                   ; $17D53E |
  LDA #$0380                                ; $17D540 |
  JSL $00BEA6                               ; $17D543 |
  SEP #$10                                  ; $17D547 |
  RTS                                       ; $17D549 |

  dw $0C00, $1000                           ; $17D54A |

CODE_17D54E:
  LDA !r_frame_counter_global_dp            ; $17D54E |
  AND #$04                                  ; $17D550 |
  LSR A                                     ; $17D552 |
  TAX                                       ; $17D553 |

CODE_17D554:
  REP #$20                                  ; $17D554 |
  STZ $0E                                   ; $17D556 |
  LDA $1106                                 ; $17D558 |
  EOR #$0001                                ; $17D55B |
  STA $1106                                 ; $17D55E |
  BNE CODE_17D568                           ; $17D561 |
  LDA #$0380                                ; $17D563 |
  STA $0E                                   ; $17D566 |

CODE_17D568:
  LDA $D54A,x                               ; $17D568 |
  STA $10                                   ; $17D56B |
  LDY !r_cur_world                          ; $17D56D |
  LDA $E198,y                               ; $17D570 |
  TAY                                       ; $17D573 |
  LDX #$00                                  ; $17D574 |

CODE_17D576:
  LDA !r_stage_scores,y                     ; $17D576 |
  AND #$00FF                                ; $17D579 |
  CMP #$0064                                ; $17D57C |
  BNE CODE_17D584                           ; $17D57F |
  JSR CODE_17D59E                           ; $17D581 |

CODE_17D584:
  INY                                       ; $17D584 |
  INX                                       ; $17D585 |
  INX                                       ; $17D586 |
  CPX #$12                                  ; $17D587 |
  BNE CODE_17D576                           ; $17D589 |
  LDA #$1E20                                ; $17D58B |
  STA $04                                   ; $17D58E |
  JSR CODE_17D52B                           ; $17D590 |
  SEP #$20                                  ; $17D593 |
  LDA $1106                                 ; $17D595 |
  EOR #$01                                  ; $17D598 |
  STA $1106                                 ; $17D59A |
  RTS                                       ; $17D59D |

CODE_17D59E:
  PHY                                       ; $17D59E |
  LDA $DCEF,x                               ; $17D59F |
  CLC                                       ; $17D5A2 |
  ADC $0E                                   ; $17D5A3 |
  STA $00                                   ; $17D5A5 |
  CLC                                       ; $17D5A7 |
  ADC #$0040                                ; $17D5A8 |
  STA $02                                   ; $17D5AB |
  CLC                                       ; $17D5AD |
  ADC #$0040                                ; $17D5AE |
  STA $04                                   ; $17D5B1 |
  CLC                                       ; $17D5B3 |
  ADC #$0040                                ; $17D5B4 |
  STA $06                                   ; $17D5B7 |
  LDY #$00                                  ; $17D5B9 |

CODE_17D5BB:
  LDA ($00),y                               ; $17D5BB |
  AND #$E3FF                                ; $17D5BD |
  ORA $10                                   ; $17D5C0 |
  STA ($00),y                               ; $17D5C2 |
  LDA ($02),y                               ; $17D5C4 |
  AND #$E3FF                                ; $17D5C6 |
  ORA $10                                   ; $17D5C9 |
  STA ($02),y                               ; $17D5CB |
  LDA ($04),y                               ; $17D5CD |
  AND #$E3FF                                ; $17D5CF |
  ORA $10                                   ; $17D5D2 |
  STA ($04),y                               ; $17D5D4 |
  LDA ($06),y                               ; $17D5D6 |
  AND #$E3FF                                ; $17D5D8 |
  ORA $10                                   ; $17D5DB |
  STA ($06),y                               ; $17D5DD |
  INY                                       ; $17D5DF |
  INY                                       ; $17D5E0 |
  CPY #$08                                  ; $17D5E1 |
  BCC CODE_17D5BB                           ; $17D5E3 |
  PLY                                       ; $17D5E5 |
  RTS                                       ; $17D5E6 |

  JSR CODE_17D005                           ; $17D5E7 |
  JSR CODE_17D54E                           ; $17D5EA |
  LDA $37                                   ; $17D5ED |
  AND #$05C0                                ; $17D5EF |
  SEC                                       ; $17D5F2 |
  AND #$F0D0                                ; $17D5F3 |
  PHP                                       ; $17D5F6 |
  INC $1118                                 ; $17D5F7 |
  LDX #$00                                  ; $17D5FA |
  JSR CODE_17D554                           ; $17D5FC |
  RTS                                       ; $17D5FF |

  JSR CODE_17D005                           ; $17D600 |
  STZ $111F                                 ; $17D603 |
  INC $1118                                 ; $17D606 |
  STZ $1120                                 ; $17D609 |
  JSR CODE_17D729                           ; $17D60C |
  JSR CODE_17D780                           ; $17D60F |
  RTS                                       ; $17D612 |

  JSR CODE_17D005                           ; $17D613 |
  JSR CODE_17D340                           ; $17D616 |
  JSR CODE_17D780                           ; $17D619 |
  LDA $1120                                 ; $17D61C |
  CLC                                       ; $17D61F |
  ADC #$10                                  ; $17D620 |
  STA $1120                                 ; $17D622 |
  BPL CODE_17D62D                           ; $17D625 |
  STZ $1121                                 ; $17D627 |
  INC $1118                                 ; $17D62A |

CODE_17D62D:
  RTS                                       ; $17D62D |

  JSR CODE_17D005                           ; $17D62E |
  JSR CODE_17D780                           ; $17D631 |
  LDA $1120                                 ; $17D634 |
  SEC                                       ; $17D637 |
  SBC #$10                                  ; $17D638 |
  STA $1120                                 ; $17D63A |
  BPL CODE_17D644                           ; $17D63D |
  INC $1118                                 ; $17D63F |
  BRA CODE_17D647                           ; $17D642 |

CODE_17D644:
  JSR CODE_17D340                           ; $17D644 |

CODE_17D647:
  RTS                                       ; $17D647 |

  JSR CODE_17D005                           ; $17D648 |
  JSR CODE_17D6C4                           ; $17D64B |
  STZ $1120                                 ; $17D64E |
  LDA !r_cur_world                          ; $17D651 |
  LSR A                                     ; $17D654 |
  TAX                                       ; $17D655 |

CODE_17D656:
  INC $111F                                 ; $17D656 |
  LDA $111F                                 ; $17D659 |
  CMP #$09                                  ; $17D65C |
  BCS CODE_17D682                           ; $17D65E |
  CLC                                       ; $17D660 |
  ADC $E187,x                               ; $17D661 |
  TAY                                       ; $17D664 |
  LDA !r_map_icon_gfx,y                     ; $17D665 |
  BEQ CODE_17D656                           ; $17D668 |
  CMP #$F0                                  ; $17D66A |
  BEQ CODE_17D682                           ; $17D66C |
  INC $1121                                 ; $17D66E |
  DEC $1118                                 ; $17D671 |
  DEC $1118                                 ; $17D674 |
  JSR CODE_17D340                           ; $17D677 |
  JSR CODE_17D729                           ; $17D67A |
  JSR CODE_17D780                           ; $17D67D |
  BRA CODE_17D691                           ; $17D680 |

CODE_17D682:
  LDA #$80                                  ; $17D682 |
  STA $3F                                   ; $17D684 |
  STZ $3D                                   ; $17D686 |
  STZ $1118                                 ; $17D688 |
  LDA #$32                                  ; $17D68B |
  STA $7E5C19                               ; $17D68D |

CODE_17D691:
  RTS                                       ; $17D691 |

  JSR CODE_17D6C4                           ; $17D692 |
  STZ $1120                                 ; $17D695 |
  LDA #$80                                  ; $17D698 |
  STA $3F                                   ; $17D69A |
  STZ $3D                                   ; $17D69C |
  INC $1118                                 ; $17D69E |
  RTS                                       ; $17D6A1 |

CODE_17D6A2:
  PHP                                       ; $17D6A2 |
  REP #$30                                  ; $17D6A3 |
  PHX                                       ; $17D6A5 |
  LDX !r_cur_world                          ; $17D6A6 |
  LDA $E198,x                               ; $17D6A9 |
  CLC                                       ; $17D6AC |
  ADC $10                                   ; $17D6AD |
  TAX                                       ; $17D6AF |
  LDA !r_stages_unlocked,x                  ; $17D6B0 |
  AND #$0080                                ; $17D6B3 |
  BEQ CODE_17D6BB                           ; $17D6B6 |
  LDA #$1400                                ; $17D6B8 |

CODE_17D6BB:
  STA $10                                   ; $17D6BB |
  PLX                                       ; $17D6BD |
  PLP                                       ; $17D6BE |
  RTS                                       ; $17D6BF |

  JSR CODE_17D6A2                           ; $17D6C0 |
  RTL                                       ; $17D6C3 |

CODE_17D6C4:
  REP #$20                                  ; $17D6C4 |
  LDX !r_cur_world                          ; $17D6C6 |
  LDA $DC43,x                               ; $17D6C9 |
  STA $02                                   ; $17D6CC |
  LDA $111F                                 ; $17D6CE |
  AND #$00FF                                ; $17D6D1 |
  CLC                                       ; $17D6D4 |
  ADC $E198,x                               ; $17D6D5 |
  TAY                                       ; $17D6D8 |
  LDA $111F                                 ; $17D6D9 |
  ASL A                                     ; $17D6DC |
  TAX                                       ; $17D6DD |
  PHX                                       ; $17D6DE |
  LDA !r_map_icon_gfx,y                     ; $17D6DF |
  DEC A                                     ; $17D6E2 |
  AND #$007F                                ; $17D6E3 |
  STA $10                                   ; $17D6E6 |
  ASL A                                     ; $17D6E8 |
  TAY                                       ; $17D6E9 |
  JSR CODE_17D6A2                           ; $17D6EA |
  LDA $10                                   ; $17D6ED |
  BNE CODE_17D6F3                           ; $17D6EF |
  LDA ($02),y                               ; $17D6F1 |

CODE_17D6F3:
  ORA $DC27,y                               ; $17D6F3 |
  LDX $1106                                 ; $17D6F6 |
  BNE CODE_17D6FE                           ; $17D6F9 |
  ORA #$0080                                ; $17D6FB |

CODE_17D6FE:
  STA $00                                   ; $17D6FE |
  PLX                                       ; $17D700 |
  LDA $DCEF,x                               ; $17D701 |
  LDX $1106                                 ; $17D704 |
  BNE CODE_17D70D                           ; $17D707 |
  CLC                                       ; $17D709 |
  ADC #$0380                                ; $17D70A |

CODE_17D70D:
  STA $0A                                   ; $17D70D |
  CLC                                       ; $17D70F |
  ADC #$0040                                ; $17D710 |
  STA $0C                                   ; $17D713 |
  CLC                                       ; $17D715 |
  ADC #$0040                                ; $17D716 |
  STA $0E                                   ; $17D719 |
  JSR CODE_17DC09                           ; $17D71B |
  LDA #$1C20                                ; $17D71E |
  STA $04                                   ; $17D721 |
  JSR CODE_17D52B                           ; $17D723 |
  SEP #$20                                  ; $17D726 |
  RTS                                       ; $17D728 |

CODE_17D729:
  REP #$20                                  ; $17D729 |
  LDA $111F                                 ; $17D72B |
  ASL A                                     ; $17D72E |
  TAY                                       ; $17D72F |
  LDA $DCEF,y                               ; $17D730 |
  LDX $1106                                 ; $17D733 |
  BNE CODE_17D73C                           ; $17D736 |
  CLC                                       ; $17D738 |
  ADC #$0380                                ; $17D739 |

CODE_17D73C:
  STA $00                                   ; $17D73C |
  CLC                                       ; $17D73E |
  ADC #$0040                                ; $17D73F |
  STA $02                                   ; $17D742 |
  CLC                                       ; $17D744 |
  ADC #$0040                                ; $17D745 |
  STA $04                                   ; $17D748 |
  LDX !r_cur_world                          ; $17D74A |
  LDA $C9EA,x                               ; $17D74D |
  STA $06                                   ; $17D750 |
  LDY #$00                                  ; $17D752 |

CODE_17D754:
  LDA $111F                                 ; $17D754 |
  CMP #$0003                                ; $17D757 |
  BEQ CODE_17D766                           ; $17D75A |
  CMP #$0007                                ; $17D75C |
  BEQ CODE_17D766                           ; $17D75F |
  JSR CODE_17D287                           ; $17D761 |
  BRA CODE_17D769                           ; $17D764 |

CODE_17D766:
  JSR CODE_17D29D                           ; $17D766 |

CODE_17D769:
  INY                                       ; $17D769 |
  INY                                       ; $17D76A |
  CPY #$06                                  ; $17D76B |
  BCC CODE_17D754                           ; $17D76D |
  LDA #$1C20                                ; $17D76F |
  STA $04                                   ; $17D772 |
  JSR CODE_17D52B                           ; $17D774 |
  SEP #$20                                  ; $17D777 |
  LDA #$36                                  ; $17D779 |\ play sound #$0036
  JSL push_sound_queue                      ; $17D77B |/
  RTS                                       ; $17D77F |

CODE_17D780:
  REP #$30                                  ; $17D780 |
  LDX !s_oam_next_free_slot_ptr             ; $17D782 |
  LDA $111F                                 ; $17D785 |
  AND #$00FF                                ; $17D788 |
  ASL A                                     ; $17D78B |
  TAY                                       ; $17D78C |
  LDA $E257,y                               ; $17D78D |
  AND #$00FF                                ; $17D790 |
  SEC                                       ; $17D793 |
  SBC #$0010                                ; $17D794 |
  STA $6000,x                               ; $17D797 |
  STA $6010,x                               ; $17D79A |
  CLC                                       ; $17D79D |
  ADC #$0010                                ; $17D79E |
  STA $6008,x                               ; $17D7A1 |
  STA $6018,x                               ; $17D7A4 |
  LDA $E258,y                               ; $17D7A7 |
  AND #$00FF                                ; $17D7AA |
  SEC                                       ; $17D7AD |
  SBC #$0016                                ; $17D7AE |
  STA $6002,x                               ; $17D7B1 |
  STA $600A,x                               ; $17D7B4 |
  CLC                                       ; $17D7B7 |
  ADC #$0010                                ; $17D7B8 |
  STA $6012,x                               ; $17D7BB |
  STA $601A,x                               ; $17D7BE |
  STZ $02                                   ; $17D7C1 |
  LDY !r_cur_world                          ; $17D7C3 |
  PHY                                       ; $17D7C6 |
  LDA $111F                                 ; $17D7C7 |
  AND #$00FF                                ; $17D7CA |
  CLC                                       ; $17D7CD |
  ADC $E198,y                               ; $17D7CE |
  TAY                                       ; $17D7D1 |
  LDA !r_stage_scores,y                     ; $17D7D2 |
  AND #$00FF                                ; $17D7D5 |
  CMP #$001E                                ; $17D7D8 |
  BCS CODE_17D7FA                           ; $17D7DB |
  LDA $111F                                 ; $17D7DD |
  AND #$00FF                                ; $17D7E0 |
  CMP #$0008                                ; $17D7E3 |
  BNE CODE_17D7F0                           ; $17D7E6 |
  LDA !r_stage_scores,y                     ; $17D7E8 |
  AND #$00FF                                ; $17D7EB |
  BEQ CODE_17D7FA                           ; $17D7EE |

CODE_17D7F0:
  LDA !r_stages_unlocked,y                  ; $17D7F0 |
  AND #$007F                                ; $17D7F3 |
  BEQ CODE_17D7FA                           ; $17D7F6 |
  INC $02                                   ; $17D7F8 |

CODE_17D7FA:
  PLY                                       ; $17D7FA |
  LDA $DC43,y                               ; $17D7FB |
  STA $00                                   ; $17D7FE |
  LDY !r_cur_world                          ; $17D800 |
  LDA $111F                                 ; $17D803 |
  AND #$00FF                                ; $17D806 |
  CLC                                       ; $17D809 |
  ADC $E198,y                               ; $17D80A |
  TAY                                       ; $17D80D |
  LDA !r_map_icon_gfx,y                     ; $17D80E |
  DEC A                                     ; $17D811 |
  AND #$007F                                ; $17D812 |
  STA $10                                   ; $17D815 |
  ASL A                                     ; $17D817 |
  TAY                                       ; $17D818 |
  LDA $1121                                 ; $17D819 |
  AND #$00FF                                ; $17D81C |
  BEQ CODE_17D830                           ; $17D81F |
  PHX                                       ; $17D821 |
  LDX #$31E0                                ; $17D822 |
  LDA $02                                   ; $17D825 |
  BEQ CODE_17D82C                           ; $17D827 |
  LDX #$33E0                                ; $17D829 |

CODE_17D82C:
  TXA                                       ; $17D82C |
  PLX                                       ; $17D82D |
  BRA CODE_17D841                           ; $17D82E |

CODE_17D830:
  JSR CODE_17D6A2                           ; $17D830 |
  LDA $10                                   ; $17D833 |
  BNE CODE_17D839                           ; $17D835 |
  LDA ($00),y                               ; $17D837 |

CODE_17D839:
  LSR A                                     ; $17D839 |
  SEC                                       ; $17D83A |
  SBC #$0600                                ; $17D83B |
  ORA #$31E0                                ; $17D83E |

CODE_17D841:
  STA $6004,x                               ; $17D841 |
  INC A                                     ; $17D844 |
  INC A                                     ; $17D845 |
  STA $600C,x                               ; $17D846 |
  INC A                                     ; $17D849 |
  INC A                                     ; $17D84A |
  STA $6014,x                               ; $17D84B |
  INC A                                     ; $17D84E |
  INC A                                     ; $17D84F |
  STA $601C,x                               ; $17D850 |
  LDA #$4002                                ; $17D853 |
  STA $6006,x                               ; $17D856 |
  STA $600E,x                               ; $17D859 |
  STA $6016,x                               ; $17D85C |
  STA $601E,x                               ; $17D85F |
  TXA                                       ; $17D862 |
  CLC                                       ; $17D863 |
  ADC #$0020                                ; $17D864 |
  STA !s_oam_next_free_slot_ptr             ; $17D867 |
  SEP #$30                                  ; $17D86A |
  RTS                                       ; $17D86C |

  dw $D138                                  ; $17D86D |
  dw $D224                                  ; $17D86F |
  dw $D2BE                                  ; $17D871 |
  dw $D326                                  ; $17D873 |
  dw $D606                                  ; $17D875 |
  dw $D616                                  ; $17D877 |
  dw $D631                                  ; $17D879 |
  dw $D692                                  ; $17D87B |

  PHB                                       ; $17D87D |
  PHK                                       ; $17D87E |
  PLB                                       ; $17D87F |
  JSR ($D86D,x)                             ; $17D880 |
  PLB                                       ; $17D883 |
  RTL                                       ; $17D884 |

CODE_17D885:
  LDX #$00                                  ; $17D885 |
  TXY                                       ; $17D887 |

CODE_17D888:
  REP #$20                                  ; $17D888 |
  LDA !r_stages_unlocked,y                  ; $17D88A |
  ORA $0224,y                               ; $17D88D |
  ORA $0226,y                               ; $17D890 |
  ORA $0228,y                               ; $17D893 |
  STA $00                                   ; $17D896 |
  SEP #$20                                  ; $17D898 |
  LDA $00                                   ; $17D89A |
  ORA $01                                   ; $17D89C |
  STA $0010,x                               ; $17D89E |
  TYA                                       ; $17D8A1 |
  CLC                                       ; $17D8A2 |
  ADC #$0C                                  ; $17D8A3 |
  TAY                                       ; $17D8A5 |
  INX                                       ; $17D8A6 |
  CPX #$07                                  ; $17D8A7 |
  BCC CODE_17D888                           ; $17D8A9 |
  LDX $1115                                 ; $17D8AB |
  INC $0010,x                               ; $17D8AE |
  REP #$30                                  ; $17D8B1 |
  LDX #$0000                                ; $17D8B3 |
  LDA #$19BF                                ; $17D8B6 |

CODE_17D8B9:
  STA $0A46,x                               ; $17D8B9 |
  STA $0DC6,x                               ; $17D8BC |
  INX                                       ; $17D8BF |
  INX                                       ; $17D8C0 |
  CPX #$0040                                ; $17D8C1 |
  BCC CODE_17D8B9                           ; $17D8C4 |
  STZ $1146                                 ; $17D8C6 |
  LDX #$0000                                ; $17D8C9 |
  TXY                                       ; $17D8CC |

CODE_17D8CD:
  LDA $0010,y                               ; $17D8CD |
  AND #$00FF                                ; $17D8D0 |
  BEQ CODE_17D8FC                           ; $17D8D3 |
  INC $1146                                 ; $17D8D5 |
  LDA $DD33,x                               ; $17D8D8 |
  STA $0A4E,x                               ; $17D8DB |
  STA $0DCE,x                               ; $17D8DE |
  LDA $DD35,x                               ; $17D8E1 |
  STA $0A50,x                               ; $17D8E4 |
  STA $0DD0,x                               ; $17D8E7 |
  LDA $DD37,x                               ; $17D8EA |
  STA $0A52,x                               ; $17D8ED |
  STA $0DD2,x                               ; $17D8F0 |
  LDA $DD39,x                               ; $17D8F3 |
  STA $0A54,x                               ; $17D8F6 |
  STA $0DD4,x                               ; $17D8F9 |

CODE_17D8FC:
  INY                                       ; $17D8FC |
  TXA                                       ; $17D8FD |
  CLC                                       ; $17D8FE |
  ADC #$0008                                ; $17D8FF |
  TAX                                       ; $17D902 |
  CPX #$0030                                ; $17D903 |
  BNE CODE_17D8CD                           ; $17D906 |
  LDX !r_cur_world                          ; $17D908 |
  LDA $DD27,x                               ; $17D90B |
  STA $00                                   ; $17D90E |
  LDA $C9EA,x                               ; $17D910 |
  STA $02                                   ; $17D913 |
  LDX #$0000                                ; $17D915 |
  TXY                                       ; $17D918 |
  LDA $1106                                 ; $17D919 |
  AND #$0001                                ; $17D91C |
  BEQ CODE_17D924                           ; $17D91F |
  LDX #$0380                                ; $17D921 |

CODE_17D924:
  STX $10                                   ; $17D924 |

CODE_17D926:
  LDA ($00),y                               ; $17D926 |
  STA $0A86,x                               ; $17D928 |
  LDA $DDE3,y                               ; $17D92B |
  ORA $02                                   ; $17D92E |
  STA $0D06,x                               ; $17D930 |
  INX                                       ; $17D933 |
  INX                                       ; $17D934 |
  INY                                       ; $17D935 |
  INY                                       ; $17D936 |
  CPY #$0040                                ; $17D937 |
  BCC CODE_17D926                           ; $17D93A |
  LDA #$0009                                ; $17D93C |
  STA $0E                                   ; $17D93F |

CODE_17D941:
  LDY #$0000                                ; $17D941 |

CODE_17D944:
  LDA $DDA3,y                               ; $17D944 |
  ORA $02                                   ; $17D947 |
  STA $0A86,x                               ; $17D949 |
  INX                                       ; $17D94C |
  INX                                       ; $17D94D |
  INY                                       ; $17D94E |
  INY                                       ; $17D94F |
  CPY #$0040                                ; $17D950 |
  BCC CODE_17D944                           ; $17D953 |
  DEC $0E                                   ; $17D955 |
  BNE CODE_17D941                           ; $17D957 |
  LDX $10                                   ; $17D959 |
  LDY #$0000                                ; $17D95B |

CODE_17D95E:
  LDA $DF63,y                               ; $17D95E |
  STA $0BEE,x                               ; $17D961 |
  LDA $DF75,y                               ; $17D964 |
  STA $0C2E,x                               ; $17D967 |
  STA $0C6E,x                               ; $17D96A |
  STA $0CAE,x                               ; $17D96D |
  LDA $DF87,y                               ; $17D970 |
  STA $0CEE,x                               ; $17D973 |
  INX                                       ; $17D976 |
  INX                                       ; $17D977 |
  INY                                       ; $17D978 |
  INY                                       ; $17D979 |
  CPY #$0012                                ; $17D97A |
  BCC CODE_17D95E                           ; $17D97D |
  LDA #$21F9                                ; $17D97F |
  ORA $02                                   ; $17D982 |
  STA $0B14                                 ; $17D984 |
  STA $0E94                                 ; $17D987 |
  STA $0B1C                                 ; $17D98A |
  STA $0E9C                                 ; $17D98D |
  STA $0B34                                 ; $17D990 |
  STA $0EB4                                 ; $17D993 |
  STA $0B3C                                 ; $17D996 |
  STA $0EBC                                 ; $17D999 |
  STA $0C4C                                 ; $17D99C |
  STA $0FCC                                 ; $17D99F |
  LDX #$0000                                ; $17D9A2 |
  LDY #$DD07                                ; $17D9A5 |
  LDA $1106                                 ; $17D9A8 |
  AND #$0001                                ; $17D9AB |
  BEQ CODE_17D9B3                           ; $17D9AE |
  LDY #$DD17                                ; $17D9B0 |

CODE_17D9B3:
  STY $00                                   ; $17D9B3 |
  LDY !r_cur_world                          ; $17D9B5 |

CODE_17D9B8:
  LDA ($00)                                 ; $17D9B8 |
  STA $04                                   ; $17D9BA |
  INC A                                     ; $17D9BC |
  INC A                                     ; $17D9BD |
  STA $06                                   ; $17D9BE |
  INC A                                     ; $17D9C0 |
  INC A                                     ; $17D9C1 |
  STA $08                                   ; $17D9C2 |
  LDA $DCDF,y                               ; $17D9C4 |
  ORA $02                                   ; $17D9C7 |
  STA ($04)                                 ; $17D9C9 |
  LDA #$218D                                ; $17D9CB |
  ORA $02                                   ; $17D9CE |
  STA ($06)                                 ; $17D9D0 |
  LDA $DCDF,x                               ; $17D9D2 |
  ORA $02                                   ; $17D9D5 |
  STA ($08)                                 ; $17D9D7 |
  INC $00                                   ; $17D9D9 |
  INC $00                                   ; $17D9DB |
  INX                                       ; $17D9DD |
  INX                                       ; $17D9DE |
  CPX #$0010                                ; $17D9DF |
  BCC CODE_17D9B8                           ; $17D9E2 |
  LDX $10                                   ; $17D9E4 |
  LDY #$0000                                ; $17D9E6 |

CODE_17D9E9:
  LDA !r_cur_world                          ; $17D9E9 |
  CMP #$0004                                ; $17D9EC |
  BEQ CODE_17D9FB                           ; $17D9EF |
  CMP #$0006                                ; $17D9F1 |
  BEQ CODE_17DA00                           ; $17D9F4 |
  LDA $DFAB,y                               ; $17D9F6 |
  BRA CODE_17DA03                           ; $17D9F9 |

CODE_17D9FB:
  LDA $DFBF,y                               ; $17D9FB |
  BRA CODE_17DA03                           ; $17D9FE |

CODE_17DA00:
  LDA $DFC9,y                               ; $17DA00 |

CODE_17DA03:
  ORA $02                                   ; $17DA03 |
  STA $0AA4,x                               ; $17DA05 |
  LDA $DFB5,y                               ; $17DA08 |
  ORA $02                                   ; $17DA0B |
  STA $0BD4,x                               ; $17DA0D |
  LDA $DFD3,y                               ; $17DA10 |
  ORA $02                                   ; $17DA13 |
  STA $0AE4,x                               ; $17DA15 |
  STA $0C14,x                               ; $17DA18 |
  LDA $DFDD,y                               ; $17DA1B |
  ORA $02                                   ; $17DA1E |
  STA $0B24,x                               ; $17DA20 |
  LDA $DFE7,y                               ; $17DA23 |
  ORA $02                                   ; $17DA26 |
  STA $0C54,x                               ; $17DA28 |
  LDA $DFF1,y                               ; $17DA2B |
  ORA $02                                   ; $17DA2E |
  STA $0B64,x                               ; $17DA30 |
  STA $0C94,x                               ; $17DA33 |
  LDA $DFFB,y                               ; $17DA36 |
  ORA $02                                   ; $17DA39 |
  STA $0BA4,x                               ; $17DA3B |
  LDA $E005,y                               ; $17DA3E |
  ORA $02                                   ; $17DA41 |
  STA $0CD4,x                               ; $17DA43 |
  INX                                       ; $17DA46 |
  INX                                       ; $17DA47 |
  INY                                       ; $17DA48 |
  INY                                       ; $17DA49 |
  CPY #$000A                                ; $17DA4A |
  BCC CODE_17D9E9                           ; $17DA4D |
  LDX $10                                   ; $17DA4F |
  LDA !r_cur_world                          ; $17DA51 |
  LSR A                                     ; $17DA54 |
  ORA #$21E0                                ; $17DA55 |
  ORA $02                                   ; $17DA58 |
  STA $0BA6,x                               ; $17DA5A |
  STA $0CD6,x                               ; $17DA5D |
  LDX $10                                   ; $17DA60 |
  LDY #$0000                                ; $17DA62 |

CODE_17DA65:
  LDA $DF99,y                               ; $17DA65 |
  ORA $02                                   ; $17DA68 |
  STA $0C1E,x                               ; $17DA6A |
  STA $0C26,x                               ; $17DA6D |
  LDA $DF9F,y                               ; $17DA70 |
  ORA $02                                   ; $17DA73 |
  STA $0C5E,x                               ; $17DA75 |
  STA $0C66,x                               ; $17DA78 |
  LDA $DFA5,y                               ; $17DA7B |
  ORA $02                                   ; $17DA7E |
  STA $0C9E,x                               ; $17DA80 |
  STA $0CA6,x                               ; $17DA83 |
  INX                                       ; $17DA86 |
  INX                                       ; $17DA87 |
  INY                                       ; $17DA88 |
  INY                                       ; $17DA89 |
  CPY #$0006                                ; $17DA8A |
  BCC CODE_17DA65                           ; $17DA8D |
  LDA !r_game_mode                          ; $17DA8F |
  CMP #$0023                                ; $17DA92 |
  BCS CODE_17DAD2                           ; $17DA95 |
  LDX !r_cur_world                          ; $17DA97 |
  LDA $17E198,x                             ; $17DA9A |
  TAX                                       ; $17DA9E |
  STA $02                                   ; $17DA9F |
  LDA $0317,x                               ; $17DAA1 |
  CMP #$0A09                                ; $17DAA4 |
  BEQ CODE_17DAD2                           ; $17DAA7 |
  LDY #$0008                                ; $17DAA9 |
  STZ $00                                   ; $17DAAC |

CODE_17DAAE:
  LDA !r_stage_scores,x                     ; $17DAAE |
  AND #$00FF                                ; $17DAB1 |
  CLC                                       ; $17DAB4 |
  ADC $00                                   ; $17DAB5 |
  STA $00                                   ; $17DAB7 |
  INX                                       ; $17DAB9 |
  DEY                                       ; $17DABA |
  BNE CODE_17DAAE                           ; $17DABB |
  LDA $00                                   ; $17DABD |
  CMP #$0320                                ; $17DABF |
  BCC CODE_17DAD2                           ; $17DAC2 |
  LDX $02                                   ; $17DAC4 |
  LDA #$0A09                                ; $17DAC6 |
  STA $0317,x                               ; $17DAC9 |
  LDA #$0101                                ; $17DACC |
  STA $022A,x                               ; $17DACF |

CODE_17DAD2:
  SEP #$10                                  ; $17DAD2 |
  LDA !r_cur_world                          ; $17DAD4 |
  STA !gsu_r9                               ; $17DAD7 |
  TAX                                       ; $17DADA |
  LDA #$0017                                ; $17DADB |
  STA $6000                                 ; $17DADE |
  LDA $DBA3,x                               ; $17DAE1 |
  STA $6002                                 ; $17DAE4 |
  LDX #$08                                  ; $17DAE7 |
  LDA #$D995                                ; $17DAE9 |
  JSL r_gsu_init_1                          ; $17DAEC | GSU init
  LDA #$0015                                ; $17DAF0 |
  STA !gsu_r0                               ; $17DAF3 |
  LDX !s_control_scheme                     ; $17DAF6 |
  LDA $DC03,x                               ; $17DAF9 |
  STA !gsu_r10                              ; $17DAFC |
  LDX #$08                                  ; $17DAFF |
  LDA #$E0FA                                ; $17DB01 |
  JSL r_gsu_init_1                          ; $17DB04 | GSU init
  SEP #$20                                  ; $17DB08 |
  JSR CODE_17C946                           ; $17DB0A |
  LDA !r_cur_world                          ; $17DB0D |
  LSR A                                     ; $17DB10 |
  TAX                                       ; $17DB11 |
  LDA $E187,x                               ; $17DB12 |
  TAY                                       ; $17DB15 |
  REP #$20                                  ; $17DB16 |
  LDA $0317,y                               ; $17DB18 |
  CMP #$0A09                                ; $17DB1B |
  BEQ CODE_17DB26                           ; $17DB1E |
  LDA #$F0F0                                ; $17DB20 |
  STA $0317,y                               ; $17DB23 |

CODE_17DB26:
  LDX !r_cur_world                          ; $17DB26 |
  LDA $DC43,x                               ; $17DB29 |
  STA $04                                   ; $17DB2C |
  LDA #$000C                                ; $17DB2E |
  STA $08                                   ; $17DB31 |
  STZ $06                                   ; $17DB33 |

CODE_17DB35:
  LDA !r_map_icon_gfx,y                     ; $17DB35 |
  AND #$00FF                                ; $17DB38 |
  CMP #$00F0                                ; $17DB3B |
  BEQ CODE_17DB8D                           ; $17DB3E |
  AND #$007F                                ; $17DB40 |
  BEQ CODE_17DB8D                           ; $17DB43 |
  DEC A                                     ; $17DB45 |
  STA $10                                   ; $17DB46 |
  ASL A                                     ; $17DB48 |
  TAX                                       ; $17DB49 |
  PHY                                       ; $17DB4A |
  LDA $DC27,x                               ; $17DB4B |
  LDY $1106                                 ; $17DB4E |
  BEQ CODE_17DB56                           ; $17DB51 |
  ORA #$0080                                ; $17DB53 |

CODE_17DB56:
  STA $00                                   ; $17DB56 |
  LDA $10                                   ; $17DB58 |
  CMP #$0008                                ; $17DB5A |
  BCS CODE_17DB66                           ; $17DB5D |
  JSR CODE_17D6A2                           ; $17DB5F |
  LDA $10                                   ; $17DB62 |
  BNE CODE_17DB69                           ; $17DB64 |

CODE_17DB66:
  TXY                                       ; $17DB66 |
  LDA ($04),y                               ; $17DB67 |

CODE_17DB69:
  ORA $00                                   ; $17DB69 |
  STA $00                                   ; $17DB6B |
  LDX $06                                   ; $17DB6D |
  LDA $DCEF,x                               ; $17DB6F |
  LDY $1106                                 ; $17DB72 |
  BEQ CODE_17DB7B                           ; $17DB75 |
  CLC                                       ; $17DB77 |
  ADC #$0380                                ; $17DB78 |

CODE_17DB7B:
  STA $0A                                   ; $17DB7B |
  CLC                                       ; $17DB7D |
  ADC #$0040                                ; $17DB7E |
  STA $0C                                   ; $17DB81 |
  CLC                                       ; $17DB83 |
  ADC #$0040                                ; $17DB84 |
  STA $0E                                   ; $17DB87 |
  JSR CODE_17DC09                           ; $17DB89 |
  PLY                                       ; $17DB8C |

CODE_17DB8D:
  INC $06                                   ; $17DB8D |
  INC $06                                   ; $17DB8F |
  INY                                       ; $17DB91 |
  DEC $08                                   ; $17DB92 |
  BNE CODE_17DB35                           ; $17DB94 |
  SEP #$20                                  ; $17DB96 |
  LDA $1106                                 ; $17DB98 |
  EOR #$01                                  ; $17DB9B |
  AND #$01                                  ; $17DB9D |
  STA $1106                                 ; $17DB9F |
  RTS                                       ; $17DBA2 |

; pointers to icon bitplanes used for each world
  dw $DBAF                                  ; $17DBA3 |
  dw $DBBB                                  ; $17DBA5 |
  dw $DBC7                                  ; $17DBA7 |
  dw $DBD3                                  ; $17DBA9 |
  dw $DBDF                                  ; $17DBAB |
  dw $DBEB                                  ; $17DBAD |

; bitplane used for each level icon (1 byte per level; $11=bitplane 1; $15=bitplane 2)
; bitplanes for world 1 icons
  db $11, $11, $11, $11, $11, $11, $11, $11 ; $17DBAF |
  db $11, $15, $15, $15                     ; $17DBB7 |

; bitplanes for world 2 icons
  db $11, $11, $11, $11, $11, $11, $11, $11 ; $17DBBB |
  db $11, $15, $15, $15                     ; $17DBC3 |

; bitplanes for world 3 icons
  db $11, $11, $11, $11, $11, $11, $11, $11 ; $17DBC7 |
  db $11, $15, $15, $15                     ; $17DBCF |

; bitplanes for world 4 icons
  db $11, $11, $11, $11, $11, $11, $11, $11 ; $17DBD3 |
  db $11, $15, $15, $15                     ; $17DBDB |

; bitplanes for world 5 icons
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $17DBDF |
  db $15, $15, $15, $15                     ; $17DBE7 |

; bitplanes for world 6 icons
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $17DBEB |
  db $15, $15, $15, $15                     ; $17DBF3 |

; bitplanes for ???
  db $11, $11, $11, $11, $11, $11, $11, $11 ; $17DBF7 |
  db $11, $11, $11, $15                     ; $17DBFF |

; pointers to controller setting icons
  dw $643C, $6458                           ; $17DC03 |

  STZ $64,x                                 ; $17DC07 |

CODE_17DC09:
  LDY #$00                                  ; $17DC09 |

CODE_17DC0B:
  TYA                                       ; $17DC0B |
  LSR A                                     ; $17DC0C |
  CLC                                       ; $17DC0D |
  ADC $00                                   ; $17DC0E |
  STA ($0A),y                               ; $17DC10 |
  INC A                                     ; $17DC12 |
  INC A                                     ; $17DC13 |
  INC A                                     ; $17DC14 |
  STA ($0C),y                               ; $17DC15 |
  INC A                                     ; $17DC17 |
  INC A                                     ; $17DC18 |
  INC A                                     ; $17DC19 |
  STA ($0E),y                               ; $17DC1A |
  INY                                       ; $17DC1C |
  INY                                       ; $17DC1D |
  CPY #$06                                  ; $17DC1E |
  BCC CODE_17DC0B                           ; $17DC20 |
  RTS                                       ; $17DC22 |

  JSR CODE_17DC09                           ; $17DC23 |
  RTL                                       ; $17DC26 |

  dw $2000, $2009, $2012, $201B             ; $17DC27 |
  dw $2024, $202D, $2036, $203F             ; $17DC2F |
  dw $2048, $2051, $205A, $2070             ; $17DC37 |
  dw $206C, $2075                           ; $17DC3F |

; pointers to icon palettes for each world
  dw $DC4F                                  ; $17DC43 |
  dw $DC67                                  ; $17DC45 |
  dw $DC7F                                  ; $17DC47 |
  dw $DC97                                  ; $17DC49 |
  dw $DCAF                                  ; $17DC4B |
  dw $DCC7                                  ; $17DC4D |

; palette used for each level icon
  dw $0C00, $1000, $1000, $0C00             ; $17DC4F |
  dw $0C00, $0C00, $1000, $1000             ; $17DC57 |
  dw $0C00, $0C00, $1800, $1800             ; $17DC5F |
  dw $0C00, $1000, $1000, $1000             ; $17DC67 |
  dw $0C00, $1000, $0C00, $0C00             ; $17DC6F |
  dw $0C00, $0C00, $1800, $1800             ; $17DC77 |
  dw $1000, $0C00, $0C00, $0C00             ; $17DC7F |
  dw $0C00, $0C00, $1000, $1000             ; $17DC87 |
  dw $0C00, $0C00, $1800, $1800             ; $17DC8F |
  dw $0C00, $1000, $0C00, $0C00             ; $17DC97 |
  dw $1000, $0C00, $0C00, $0C00             ; $17DC9F |
  dw $0C00, $0C00, $1800, $1800             ; $17DCA7 |
  dw $0C00, $1000, $0C00, $1000             ; $17DCAF |
  dw $0C00, $0C00, $1000, $0C00             ; $17DCB7 |
  dw $0C00, $0C00, $1800, $1800             ; $17DCBF |
  dw $0C00, $0C00, $1000, $1000             ; $17DCC7 |
  dw $0C00, $0C00, $1000, $0C00             ; $17DCCF |
  dw $0C00, $0C00, $1800, $1800             ; $17DCD7 |

  dw $2190, $2191, $2192, $2193             ; $17DCDF |
  dw $2194, $2195, $2196, $2197             ; $17DCE7 |

  dw $0ACE, $0AD6, $0ADE, $0AE6             ; $17DCEF |
  dw $0AEE, $0AF6, $0C0E, $0C16             ; $17DCF7 |
  dw $0C1E, $0C26, $0C30, $0C38             ; $17DCFF |
  dw $0B8E, $0B96, $0B9E, $0BA6             ; $17DD07 |
  dw $0BAE, $0BB6, $0CCE, $0CD6             ; $17DD0F |
  dw $0F0E, $0F16, $0F1E, $0F26             ; $17DD17 |
  dw $0F2E, $0F36, $104E, $1056             ; $17DD1F |

  dw $DD63                                  ; $17DD27 |
  dw $DE23                                  ; $17DD29 |
  dw $DE63                                  ; $17DD2B |
  dw $DEA3                                  ; $17DD2D |
  dw $DEE3                                  ; $17DD2F |
  dw $DF23                                  ; $17DD31 |

  dw $2D86, $2D8F, $2D80, $6D86             ; $17DD33 |
  dw $3186, $318F, $3181, $7186             ; $17DD3B |
  dw $3586, $358F, $3582, $7586             ; $17DD43 |
  dw $2186, $218F, $2183, $6186             ; $17DD4B |
  dw $2586, $258F, $2584, $6586             ; $17DD53 |
  dw $2986, $298F, $2985, $6986             ; $17DD5B |

  dw $39BF, $39BF, $AD99, $2D8F             ; $17DD63 |
  dw $2D8E, $2D8E, $2D8E, $2D8E             ; $17DD6B |
  dw $2D8F, $2D8F, $2D8F, $2D8F             ; $17DD73 |
  dw $2D8F, $2D8F, $2D8F, $2DE2             ; $17DD7B |
  dw $2DE3, $2DE3, $2DE3, $6DE2             ; $17DD83 |
  dw $2D8F, $2D8F, $2D8F, $2D8F             ; $17DD8B |
  dw $2D8F, $2D8F, $2D8F, $2D8F             ; $17DD93 |
  dw $2D8F, $ED99, $39BF, $39BF             ; $17DD9B |

  dw $39BF, $39BF, $2198, $218E             ; $17DDA3 |
  dw $218E, $218E, $218E, $218E             ; $17DDAB |
  dw $218E, $218E, $218E, $218E             ; $17DDB3 |
  dw $218E, $218E, $218E, $218E             ; $17DDBB |
  dw $218E, $218E, $218E, $218E             ; $17DDC3 |
  dw $218E, $218E, $218E, $218E             ; $17DDCB |
  dw $218E, $218E, $218E, $218E             ; $17DDD3 |
  dw $218E, $6198, $39BF, $39BF             ; $17DDDB |

  dw $39BF, $39BF, $21A1, $21AF             ; $17DDE3 |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DDEB |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DDF3 |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DDFB |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DE03 |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DE0B |
  dw $21AF, $21AF, $21AF, $21AF             ; $17DE13 |
  dw $21AF, $61A1, $39BF, $39BF             ; $17DE1B |

  dw $39BF, $39BF, $B199, $318F             ; $17DE23 |
  dw $318F, $318F, $318F, $318F             ; $17DE2B |
  dw $318E, $318E, $318E, $318E             ; $17DE33 |
  dw $318F, $318F, $318F, $31E2             ; $17DE3B |
  dw $31E3, $31E3, $31E3, $71E2             ; $17DE43 |
  dw $318F, $318F, $318F, $318F             ; $17DE4B |
  dw $318F, $318F, $318F, $318F             ; $17DE53 |
  dw $318F, $F199, $39BF, $39BF             ; $17DE5B |

  dw $39BF, $39BF, $B599, $358F             ; $17DE63 |
  dw $358F, $358F, $358F, $358F             ; $17DE6B |
  dw $358F, $358F, $358F, $358F             ; $17DE73 |
  dw $358E, $358E, $358E, $35E4             ; $17DE7B |
  dw $35E3, $35E3, $35E3, $75E2             ; $17DE83 |
  dw $358F, $358F, $358F, $358F             ; $17DE8B |
  dw $358F, $358F, $358F, $358F             ; $17DE93 |
  dw $358F, $F599, $39BF, $39BF             ; $17DE9B |

  dw $39BF, $39BF, $A199, $218F             ; $17DEA3 |
  dw $218F, $218F, $218F, $218F             ; $17DEAB |
  dw $218F, $218F, $218F, $218F             ; $17DEB3 |
  dw $218F, $218F, $218F, $21E2             ; $17DEBB |
  dw $21E5, $21E5, $21E5, $61E4             ; $17DEC3 |
  dw $218F, $218F, $218F, $218F             ; $17DECB |
  dw $218F, $218F, $218F, $218F             ; $17DED3 |
  dw $218F, $E199, $39BF, $39BF             ; $17DEDB |

  dw $39BF, $39BF, $A599, $258F             ; $17DEE3 |
  dw $258F, $258F, $258F, $258F             ; $17DEEB |
  dw $258F, $258F, $258F, $258F             ; $17DEF3 |
  dw $258F, $258F, $258F, $25E2             ; $17DEFB |
  dw $25E3, $25E3, $25E3, $65E2             ; $17DF03 |
  dw $258E, $258E, $258E, $258E             ; $17DF0B |
  dw $258F, $258F, $258F, $258F             ; $17DF13 |
  dw $258F, $E599, $39BF, $39BF             ; $17DF1B |

  dw $39BF, $39BF, $A999, $298F             ; $17DF23 |
  dw $298F, $298F, $298F, $298F             ; $17DF2B |
  dw $298F, $298F, $298F, $298F             ; $17DF33 |
  dw $298F, $298F, $298F, $29E2             ; $17DF3B |
  dw $29E3, $29E3, $29E3, $69E2             ; $17DF43 |
  dw $298F, $298F, $298F, $298F             ; $17DF4B |
  dw $298E, $298E, $298E, $298E             ; $17DF53 |
  dw $298F, $E999, $39BF, $39BF             ; $17DF5B |

  dw $399F, $398F, $398F, $398F             ; $17DF63 |
  dw $398F, $398F, $398F, $398F             ; $17DF6B |
  dw $799F                                  ; $17DF73 |

  dw $3998, $398E, $398E, $398E             ; $17DF75 |
  dw $398E, $398E, $398E, $398E             ; $17DF7D |
  dw $7998                                  ; $17DF85 |

  dw $B99F, $B98F, $B98F, $B98F             ; $17DF87 |
  dw $B98F, $B98F, $B98F, $B98F             ; $17DF8F |
  dw $F99F                                  ; $17DF97 |

  dw $2187, $21F0, $6187                    ; $17DF99 |

  dw $21F1, $21F2, $21F3                    ; $17DF9F |

  dw $A187, $21F4, $E187                    ; $17DFA5 |

  dw $21E8, $21E9, $21EA, $61E9             ; $17DFAB |
  dw $61E8                                  ; $17DFB3 |

  dw $21EB, $21EC, $21ED, $61EC             ; $17DFB5 |
  dw $61EB                                  ; $17DFBD |

  dw $21EB, $21E9, $21EA, $61E9             ; $17DFBF |
  dw $61E8                                  ; $17DFC7 |

  dw $21E8, $21FA, $21FB, $61FA             ; $17DFC9 |
  dw $61EB                                  ; $17DFD1 |

  dw $21EF, $21F5, $21F5, $21F5             ; $17DFD3 |
  dw $61EF                                  ; $17DFDB |

  dw $61F8, $21F7, $21F7, $21F7             ; $17DFDD |
  dw $21F8                                  ; $17DFE5 |

  dw $61F8, $21F7, $21F7, $21F7             ; $17DFE7 |
  dw $61EF                                  ; $17DFEF |

  dw $21EF, $21F7, $21F6, $21F7             ; $17DFF1 |
  dw $61EF                                  ; $17DFF9 |

  dw $21EE, $21E0, $21E6, $21E3             ; $17DFFB |
  dw $61EE                                  ; $17E003 |

  dw $21EE, $21E0, $21E6, $21E7             ; $17E005 |
  dw $61EE                                  ; $17E00D |

CODE_17E00F:
  LDA !r_joy1_hi                            ; $17E00F |
  AND #$20                                  ; $17E012 |
  BEQ CODE_17E019                           ; $17E014 |
  JMP CODE_17E14A                           ; $17E016 |

CODE_17E019:
  LDA $37                                   ; $17E019 |
  AND #$C0                                  ; $17E01B |
  ORA $38                                   ; $17E01D |
  AND #$D0                                  ; $17E01F |
  BEQ CODE_17E03E                           ; $17E021 |
  LDA $1112                                 ; $17E023 |
  CMP #$0A                                  ; $17E026 |
  BNE CODE_17E032                           ; $17E028 |
  LDA #$18                                  ; $17E02A |
  STA $1118                                 ; $17E02C |
  JMP CODE_17E17F                           ; $17E02F |

CODE_17E032:
  CMP #$0B                                  ; $17E032 |
  BNE CODE_17E03E                           ; $17E034 |
  LDA #$28                                  ; $17E036 |
  STA $1118                                 ; $17E038 |
  JMP CODE_17E17F                           ; $17E03B |

CODE_17E03E:
  LDA $37                                   ; $17E03E |\
  AND #$C0                                  ; $17E040 | | newpressing A, X, Y, B, or Start?
  ORA $38                                   ; $17E042 | | if not, branch
  AND #$D0                                  ; $17E044 | |
  BEQ CODE_17E07B                           ; $17E046 |/
  STA $0979                                 ; $17E048 | store a flag that "we have selected a stage"
  LDA !r_cur_world                          ; $17E04B |
  LSR A                                     ; $17E04E |
  TAX                                       ; $17E04F |
  LDA $E187,x                               ; $17E050 |
  CLC                                       ; $17E053 |
  ADC $1112                                 ; $17E054 |
  TAY                                       ; $17E057 |
  LDA !r_map_icon_gfx,y                     ; $17E058 |
  BEQ CODE_17E07B                           ; $17E05B |
  CMP #$FF                                  ; $17E05D |
  BEQ CODE_17E07B                           ; $17E05F |
  AND #$7F                                  ; $17E061 |
  DEC A                                     ; $17E063 |
  CLC                                       ; $17E064 |
  ADC $E187,x                               ; $17E065 |
  STA !r_cur_stage                          ; $17E068 |
  LDA #$02                                  ; $17E06B |
  STA $1113                                 ; $17E06D |
  STZ $1114                                 ; $17E070 |
  LDA #$5D                                  ; $17E073 |\ play sound #$005D
  JSL push_sound_queue                      ; $17E075 |/
  BRA CODE_17E0E3                           ; $17E079 |

CODE_17E07B:
  STZ $0979                                 ; $17E07B |
  LDA $93                                   ; $17E07E |
  BNE CODE_17E088                           ; $17E080 |
  LDA $37                                   ; $17E082 |
  AND #$30                                  ; $17E084 |
  BEQ CODE_17E08B                           ; $17E086 |

CODE_17E088:
  JMP CODE_17E14A                           ; $17E088 |

CODE_17E08B:
  LDA $111C                                 ; $17E08B |
  BEQ CODE_17E09D                           ; $17E08E |
  INC A                                     ; $17E090 |
  CMP #$10                                  ; $17E091 |
  BCC CODE_17E09D                           ; $17E093 |
  LDA $36                                   ; $17E095 |
  AND #$03                                  ; $17E097 |
  BEQ CODE_17E0E6                           ; $17E099 |
  BRA CODE_17E0A9                           ; $17E09B |

CODE_17E09D:
  STA $111C                                 ; $17E09D |
  LDA $38                                   ; $17E0A0 |
  AND #$03                                  ; $17E0A2 |
  BEQ CODE_17E0E6                           ; $17E0A4 |
  INC $111C                                 ; $17E0A6 |

CODE_17E0A9:
  TAX                                       ; $17E0A9 |
  LDA #$5C                                  ; $17E0AA |\ play sound #$005C
  JSL push_sound_queue                      ; $17E0AC |/
  LDA $1112                                 ; $17E0B0 |
  STA $00                                   ; $17E0B3 |
  CLC                                       ; $17E0B5 |
  ADC $E182,x                               ; $17E0B6 |
  BPL CODE_17E0BD                           ; $17E0B9 |
  LDA #$0B                                  ; $17E0BB |

CODE_17E0BD:
  CMP #$0C                                  ; $17E0BD |
  BCC CODE_17E0C3                           ; $17E0BF |
  LDA #$00                                  ; $17E0C1 |

CODE_17E0C3:
  TAX                                       ; $17E0C3 |
  CLC                                       ; $17E0C4 |
  ADC $00                                   ; $17E0C5 |
  CMP #$0B                                  ; $17E0C7 |
  BEQ CODE_17E0D1                           ; $17E0C9 |
  JSR CODE_17E1A6                           ; $17E0CB |
  JMP CODE_17E17F                           ; $17E0CE |

CODE_17E0D1:
  LDA $111C                                 ; $17E0D1 |
  INC A                                     ; $17E0D4 |
  AND #$1F                                  ; $17E0D5 |
  BEQ CODE_17E0E3                           ; $17E0D7 |
  LDA $36                                   ; $17E0D9 |
  AND #$03                                  ; $17E0DB |
  STA $111B                                 ; $17E0DD |
  STA $111C                                 ; $17E0E0 |

CODE_17E0E3:
  JMP CODE_17E17F                           ; $17E0E3 |

CODE_17E0E6:
  LDA $38                                   ; $17E0E6 |
  AND #$0C                                  ; $17E0E8 |
  BEQ CODE_17E14A                           ; $17E0EA |
  LSR A                                     ; $17E0EC |
  LSR A                                     ; $17E0ED |
  TAX                                       ; $17E0EE |
  LDA #$5C                                  ; $17E0EF |\ play sound #$005C
  JSL push_sound_queue                      ; $17E0F1 |/
  LDA $1112                                 ; $17E0F5 |
  CLC                                       ; $17E0F8 |
  ADC $E184,x                               ; $17E0F9 |
  BMI CODE_17E108                           ; $17E0FC |
  CMP #$00                                  ; $17E0FE |
  BCC CODE_17E108                           ; $17E100 |
  CMP #$0C                                  ; $17E102 |
  BCC CODE_17E123                           ; $17E104 |
  BRA CODE_17E13B                           ; $17E106 |

CODE_17E108:
  LDA !r_cur_world                          ; $17E108 |
  ASL A                                     ; $17E10B |
  ASL A                                     ; $17E10C |
  ORA $1112                                 ; $17E10D |
  TAX                                       ; $17E110 |
  LDA $E4FB,x                               ; $17E111 |
  EOR #$03                                  ; $17E114 |
  STA $111A                                 ; $17E116 |
  LDA !r_cur_world                          ; $17E119 |
  INC A                                     ; $17E11C |
  INC A                                     ; $17E11D |
  STA $1117                                 ; $17E11E |
  BRA CODE_17E17F                           ; $17E121 |

CODE_17E123:
  TAY                                       ; $17E123 |
  LDX !r_cur_world                          ; $17E124 |
  REP #$20                                  ; $17E127 |
  LDA $C93A,x                               ; $17E129 |
  STA $10                                   ; $17E12C |
  SEP #$20                                  ; $17E12E |
  LDA ($10),y                               ; $17E130 |
  AND #$0F                                  ; $17E132 |
  BEQ CODE_17E13B                           ; $17E134 |
  STY $1112                                 ; $17E136 |
  BRA CODE_17E17F                           ; $17E139 |

CODE_17E13B:
  LDA $38                                   ; $17E13B |
  AND #$0C                                  ; $17E13D |
  STA $111B                                 ; $17E13F |
  LDA #$42                                  ; $17E142 |\ play sound #$42
  JSL push_sound_queue                      ; $17E144 |/
  BRA CODE_17E17F                           ; $17E148 |

CODE_17E14A:
  LDA !r_joy1_hi                            ; $17E14A |
  AND #$20                                  ; $17E14D |
  BEQ CODE_17E17F                           ; $17E14F |
  LDX $118E                                 ; $17E151 |
  REP #$20                                  ; $17E154 |
  LDA $37                                   ; $17E156 |
  AND #$C0C0                                ; $17E158 |
  BEQ CODE_17E182                           ; $17E15B |
  CMP $E18E,x                               ; $17E15D |
  BNE CODE_17E179                           ; $17E160 |
  SEP #$20                                  ; $17E162 |
  LDA $118E                                 ; $17E164 |
  INC A                                     ; $17E167 |
  INC A                                     ; $17E168 |
  STA $118E                                 ; $17E169 |
  CMP #$0A                                  ; $17E16C |
  BCC CODE_17E182                           ; $17E16E |
  INC $114E                                 ; $17E170 |
  LDA #$95                                  ; $17E173 |
  STA $53                                   ; $17E175 |
  BRA CODE_17E182                           ; $17E177 |

CODE_17E179:
  SEP #$20                                  ; $17E179 |
  LDA #$90                                  ; $17E17B |
  STA $53                                   ; $17E17D |

CODE_17E17F:
  STZ $118E                                 ; $17E17F |

CODE_17E182:
  RTS                                       ; $17E182 |

  db $01, $FF, $06, $FA, $00, $0C, $18, $24 ; $17E183 |
  db $30, $3C, $48                          ; $17E18B |

; button sequence that unlocks the mini-battle menu (X, X, Y, B, A)
  dw $0040, $0040, $4000, $8000, $0080      ; $17E18E |

  dw $0000, $000C, $0018, $0024             ; $17E198 |
  dw $0030, $003C, $0048                    ; $17E1A0 |

CODE_17E1A6:
  STX $1112                                 ; $17E1A6 |
  LDY !r_cur_world                          ; $17E1A9 |
  REP #$20                                  ; $17E1AC |
  LDA $C93A,y                               ; $17E1AE |
  STA $10                                   ; $17E1B1 |
  SEP #$20                                  ; $17E1B3 |
  TXY                                       ; $17E1B5 |
  LDA $36                                   ; $17E1B6 |
  AND #$03                                  ; $17E1B8 |
  TAX                                       ; $17E1BA |

CODE_17E1BB:
  LDA ($10),y                               ; $17E1BB |
  AND #$0F                                  ; $17E1BD |
  BNE CODE_17E1C9                           ; $17E1BF |
  TYA                                       ; $17E1C1 |
  CLC                                       ; $17E1C2 |
  ADC $E182,x                               ; $17E1C3 |
  TAY                                       ; $17E1C6 |
  BRA CODE_17E1BB                           ; $17E1C7 |

CODE_17E1C9:
  CPY $1112                                 ; $17E1C9 |
  BEQ CODE_17E1DE                           ; $17E1CC |
  STY $1112                                 ; $17E1CE |
  TYA                                       ; $17E1D1 |
  ASL A                                     ; $17E1D2 |
  TAY                                       ; $17E1D3 |
  REP #$20                                  ; $17E1D4 |
  LDA $E257,y                               ; $17E1D6 |
  STA $1109                                 ; $17E1D9 |
  SEP #$20                                  ; $17E1DC |

CODE_17E1DE:
  RTS                                       ; $17E1DE |

CODE_17E1DF:
  LDA $1112                                 ; $17E1DF |
  ASL A                                     ; $17E1E2 |
  TAY                                       ; $17E1E3 |
  REP #$20                                  ; $17E1E4 |
  LDA $1117                                 ; $17E1E6 |
  AND #$00FF                                ; $17E1E9 |
  BEQ CODE_17E1F7                           ; $17E1EC |
  TAY                                       ; $17E1EE |
  LDA $E26D,y                               ; $17E1EF |
  STA $1109                                 ; $17E1F2 |
  BRA CODE_17E1FA                           ; $17E1F5 |

CODE_17E1F7:
  LDA $E257,y                               ; $17E1F7 |

CODE_17E1FA:
  STA $110C                                 ; $17E1FA |
  SEP #$20                                  ; $17E1FD |
  RTS                                       ; $17E1FF |

CODE_17E200:
  LDY #$00                                  ; $17E200 |
  LDA $110C                                 ; $17E202 |
  BEQ CODE_17E235                           ; $17E205 |
  CMP $1109                                 ; $17E207 |
  BEQ CODE_17E22F                           ; $17E20A |
  BPL CODE_17E20F                           ; $17E20C |
  INY                                       ; $17E20E |

CODE_17E20F:
  LDA $111A                                 ; $17E20F |
  BEQ CODE_17E223                           ; $17E212 |
  REP #$20                                  ; $17E214 |
  LDA $110C                                 ; $17E216 |
  STA $1109                                 ; $17E219 |
  STZ $110C                                 ; $17E21C |
  SEP #$20                                  ; $17E21F |
  BRA CODE_17E253                           ; $17E221 |

CODE_17E223:
  LDA $1109                                 ; $17E223 |
  CLC                                       ; $17E226 |
  ADC $E254,y                               ; $17E227 |
  STA $1109                                 ; $17E22A |
  BRA CODE_17E235                           ; $17E22D |

CODE_17E22F:
  STZ $110C                                 ; $17E22F |
  STZ $111A                                 ; $17E232 |

CODE_17E235:
  LDY #$00                                  ; $17E235 |
  LDA $110D                                 ; $17E237 |
  BEQ CODE_17E253                           ; $17E23A |
  CMP $110A                                 ; $17E23C |
  BEQ CODE_17E250                           ; $17E23F |
  BPL CODE_17E244                           ; $17E241 |
  INY                                       ; $17E243 |

CODE_17E244:
  LDA $110A                                 ; $17E244 |
  CLC                                       ; $17E247 |
  ADC $E254,y                               ; $17E248 |
  STA $110A                                 ; $17E24B |
  BRA CODE_17E253                           ; $17E24E |

CODE_17E250:
  STZ $110D                                 ; $17E250 |

CODE_17E253:
  RTS                                       ; $17E253 |

  db $04, $FC, $04                          ; $17E254 |

  dw $322C, $324C, $326C, $328C             ; $17E257 |
  dw $32AC, $32CC, $5A2C, $5A4C             ; $17E25F |
  dw $5A6C, $5A8C, $5AB4, $5AD4             ; $17E267 |

  dw $1634, $1654, $1674, $1694             ; $17E26F |
  dw $16B4, $16D4                           ; $17E277 |

CODE_17E27B:
  REP #$30                                  ; $17E27B |
  LDX !s_oam_next_free_slot_ptr             ; $17E27D |
  LDA $1109                                 ; $17E280 |
  AND #$00FF                                ; $17E283 |
  STA $6000,x                               ; $17E286 |
  LDA $110A                                 ; $17E289 |
  AND #$00FF                                ; $17E28C |
  STA $6002,x                               ; $17E28F |
  LDY #$33C0                                ; $17E292 |
  LDA $1118                                 ; $17E295 |
  AND #$00FF                                ; $17E298 |
  BNE CODE_17E2AD                           ; $17E29B |
  LDA $1108                                 ; $17E29D |
  AND #$000F                                ; $17E2A0 |
  BNE CODE_17E2AD                           ; $17E2A3 |
  LDA $0979                                 ; $17E2A5 |
  AND #$00FF                                ; $17E2A8 |
  BEQ CODE_17E2C4                           ; $17E2AB |

CODE_17E2AD:
  LDA $1122                                 ; $17E2AD |
  AND #$00FF                                ; $17E2B0 |
  BEQ CODE_17E2C2                           ; $17E2B3 |
  AND #$0080                                ; $17E2B5 |
  BNE CODE_17E2C4                           ; $17E2B8 |
  LDA $1107                                 ; $17E2BA |
  AND #$00FF                                ; $17E2BD |
  BEQ CODE_17E2C4                           ; $17E2C0 |

CODE_17E2C2:
  INY                                       ; $17E2C2 |
  INY                                       ; $17E2C3 |

CODE_17E2C4:
  TYA                                       ; $17E2C4 |
  STA $6004,x                               ; $17E2C5 |
  LDA #$0002                                ; $17E2C8 |
  STA $6006,x                               ; $17E2CB |
  TXA                                       ; $17E2CE |
  CLC                                       ; $17E2CF |
  ADC #$0008                                ; $17E2D0 |
  STA !s_oam_next_free_slot_ptr             ; $17E2D3 |
  SEP #$30                                  ; $17E2D6 |
  RTS                                       ; $17E2D8 |

  dw $0C00, $0C20, $0C40, $0C60             ; $17E2D9 |
  dw $2C24, $2C24, $2C44, $AC60             ; $17E2E1 |
  dw $AC40, $AC20, $2C04                    ; $17E2E9 |

  dw $0C08, $0C28, $0C48, $0C68             ; $17E2EF |
  dw $AC44, $AC44, $AC24, $AC68             ; $17E2F7 |
  dw $AC48, $AC28, $2C64                    ; $17E2FF |

  dw $E2D9                                  ; $17E305 |
  dw $E2EF                                  ; $17E307 |

  LDA $1142                                 ; $17E309 |
  CMP #$0018                                ; $17E30C |
  BCC CODE_17E314                           ; $17E30F |
  AND #$0018                                ; $17E311 |

CODE_17E314:
  PHA                                       ; $17E314 |
  ASL A                                     ; $17E315 |
  ASL A                                     ; $17E316 |
  STA $00                                   ; $17E317 |
  SEP #$20                                  ; $17E319 |
  LDA #$00                                  ; $17E31B |
  CLC                                       ; $17E31D |
  ADC $00                                   ; $17E31E |
  STA $1144                                 ; $17E320 |
  LDA #$FF                                  ; $17E323 |
  SEC                                       ; $17E325 |
  SBC $00                                   ; $17E326 |
  STA $1145                                 ; $17E328 |
  REP #$20                                  ; $17E32B |
  LDX !s_oam_next_free_slot_ptr             ; $17E32D |
  LDA #$0000                                ; $17E330 |
  CLC                                       ; $17E333 |
  ADC $00                                   ; $17E334 |
  JSR CODE_17E3FF                           ; $17E336 |
  LDA #$0010                                ; $17E339 |
  CLC                                       ; $17E33C |
  ADC $00                                   ; $17E33D |
  JSR CODE_17E3FF                           ; $17E33F |
  LDA #$00E0                                ; $17E342 |
  SEC                                       ; $17E345 |
  SBC $00                                   ; $17E346 |
  JSR CODE_17E3FF                           ; $17E348 |
  LDA #$00F0                                ; $17E34B |
  SEC                                       ; $17E34E |
  SBC $00                                   ; $17E34F |
  JSR CODE_17E3FF                           ; $17E351 |
  LDX !s_oam_next_free_slot_ptr             ; $17E354 |
  LDA #$0030                                ; $17E357 |
  JSR CODE_17E427                           ; $17E35A |
  LDA #$0040                                ; $17E35D |
  JSR CODE_17E427                           ; $17E360 |
  LDA #$0050                                ; $17E363 |
  JSR CODE_17E427                           ; $17E366 |
  LDA #$0060                                ; $17E369 |
  JSR CODE_17E427                           ; $17E36C |
  LDA #$0070                                ; $17E36F |
  JSR CODE_17E427                           ; $17E372 |
  LDA #$0080                                ; $17E375 |
  JSR CODE_17E427                           ; $17E378 |
  LDA #$0090                                ; $17E37B |
  JSR CODE_17E427                           ; $17E37E |
  LDA #$00A0                                ; $17E381 |
  JSR CODE_17E427                           ; $17E384 |
  LDA #$00B0                                ; $17E387 |
  JSR CODE_17E427                           ; $17E38A |
  LDA #$00C0                                ; $17E38D |
  JSR CODE_17E427                           ; $17E390 |
  LDA #$00D0                                ; $17E393 |
  JSR CODE_17E427                           ; $17E396 |
  PLA                                       ; $17E399 |
  BEQ CODE_17E3A1                           ; $17E39A |
  AND #$0004                                ; $17E39C |
  BRA CODE_17E3A7                           ; $17E39F |

CODE_17E3A1:
  LDA $41                                   ; $17E3A1 |
  AND #$0008                                ; $17E3A3 |
  LSR A                                     ; $17E3A6 |

CODE_17E3A7:
  LSR A                                     ; $17E3A7 |
  TAX                                       ; $17E3A8 |
  LDA $E305,x                               ; $17E3A9 |
  STA $00                                   ; $17E3AC |
  STZ $08                                   ; $17E3AE |
  LDX !s_oam_next_free_slot_ptr             ; $17E3B0 |
  LDY #$0000                                ; $17E3B3 |
  JSR CODE_17E43A                           ; $17E3B6 |
  INC $08                                   ; $17E3B9 |
  INC $08                                   ; $17E3BB |
  LDY #$0000                                ; $17E3BD |
  JSR CODE_17E43A                           ; $17E3C0 |
  LDA #$4002                                ; $17E3C3 |
  STA $08                                   ; $17E3C6 |
  LDY #$0000                                ; $17E3C8 |
  JSR CODE_17E43A                           ; $17E3CB |
  DEC $08                                   ; $17E3CE |
  DEC $08                                   ; $17E3D0 |
  LDY #$0000                                ; $17E3D2 |
  JSR CODE_17E43A                           ; $17E3D5 |
  LDX !s_oam_next_free_slot_ptr             ; $17E3D8 |
  INX                                       ; $17E3DB |
  INX                                       ; $17E3DC |
  INX                                       ; $17E3DD |
  INX                                       ; $17E3DE |
  INX                                       ; $17E3DF |
  INX                                       ; $17E3E0 |
  LDA #$0002                                ; $17E3E1 |
  TAY                                       ; $17E3E4 |
  JSR CODE_17E3FF                           ; $17E3E5 |
  TYA                                       ; $17E3E8 |
  JSR CODE_17E3FF                           ; $17E3E9 |
  TYA                                       ; $17E3EC |
  JSR CODE_17E3FF                           ; $17E3ED |
  TYA                                       ; $17E3F0 |
  JSR CODE_17E3FF                           ; $17E3F1 |
  LDA !s_oam_next_free_slot_ptr             ; $17E3F4 |
  CLC                                       ; $17E3F7 |
  ADC #$0160                                ; $17E3F8 |
  STA !s_oam_next_free_slot_ptr             ; $17E3FB |
  RTL                                       ; $17E3FE |

CODE_17E3FF:
  STA $6000,x                               ; $17E3FF |
  STA $6008,x                               ; $17E402 |
  STA $6010,x                               ; $17E405 |
  STA $6018,x                               ; $17E408 |
  STA $6020,x                               ; $17E40B |
  STA $6028,x                               ; $17E40E |
  STA $6030,x                               ; $17E411 |
  STA $6038,x                               ; $17E414 |
  STA $6040,x                               ; $17E417 |
  STA $6048,x                               ; $17E41A |
  STA $6050,x                               ; $17E41D |
  TXA                                       ; $17E420 |
  CLC                                       ; $17E421 |
  ADC #$0058                                ; $17E422 |
  TAX                                       ; $17E425 |
  RTS                                       ; $17E426 |

CODE_17E427:
  STA $6002,x                               ; $17E427 |
  STA $605A,x                               ; $17E42A |
  STA $60B2,x                               ; $17E42D |
  STA $610A,x                               ; $17E430 |
  TXA                                       ; $17E433 |
  CLC                                       ; $17E434 |
  ADC #$0008                                ; $17E435 |
  TAX                                       ; $17E438 |
  RTS                                       ; $17E439 |

CODE_17E43A:
  STX $02                                   ; $17E43A |

CODE_17E43C:
  LDA ($00),y                               ; $17E43C |
  ORA $08                                   ; $17E43E |
  STA $6004,x                               ; $17E440 |
  TXA                                       ; $17E443 |
  CLC                                       ; $17E444 |
  ADC #$0008                                ; $17E445 |
  TAX                                       ; $17E448 |
  INY                                       ; $17E449 |
  INY                                       ; $17E44A |
  CPY #$0016                                ; $17E44B |
  BCC CODE_17E43C                           ; $17E44E |
  LDA $02                                   ; $17E450 |
  CLC                                       ; $17E452 |
  ADC #$0058                                ; $17E453 |
  TAX                                       ; $17E456 |
  RTS                                       ; $17E457 |

CODE_17E458:
  LDA $38                                   ; $17E458 |
  AND #$03                                  ; $17E45A |
  BEQ CODE_17E4A6                           ; $17E45C |
  TAX                                       ; $17E45E |
  LDA $1117                                 ; $17E45F |

CODE_17E462:
  CLC                                       ; $17E462 |
  ADC $E182,x                               ; $17E463 |
  CLC                                       ; $17E466 |
  ADC $E182,x                               ; $17E467 |
  TAY                                       ; $17E46A |
  BEQ CODE_17E49E                           ; $17E46B |
  CMP #$B010                                ; $17E46D |
  AND $0085                                 ; $17E470 |
  LSR A                                     ; $17E473 |
  TAY                                       ; $17E474 |
  LDA $E186,y                               ; $17E475 |
  TAY                                       ; $17E478 |
  REP #$20                                  ; $17E479 |
  LDA !r_stages_unlocked,y                  ; $17E47B |
  ORA $0224,y                               ; $17E47E |
  ORA $0226,y                               ; $17E481 |
  ORA $0228,y                               ; $17E484 |
  STA $02                                   ; $17E487 |
  SEP #$20                                  ; $17E489 |
  LDA $02                                   ; $17E48B |
  ORA $03                                   ; $17E48D |
  BNE CODE_17E495                           ; $17E48F |
  LDA $00                                   ; $17E491 |
  BRA CODE_17E462                           ; $17E493 |

CODE_17E495:
  LDA $00                                   ; $17E495 |
  STA $1117                                 ; $17E497 |
  LDA #$5C                                  ; $17E49A |
  BRA CODE_17E4A0                           ; $17E49C |

CODE_17E49E:
  LDA #$42                                  ; $17E49E |\ play sound #$0042

CODE_17E4A0:
  JSL push_sound_queue                      ; $17E4A0 |/
  BRA CODE_17E4FA                           ; $17E4A4 |

CODE_17E4A6:
  LDA $38                                   ; $17E4A6 |
  AND #$04                                  ; $17E4A8 |
  BEQ CODE_17E4CB                           ; $17E4AA |
  LDA $1117                                 ; $17E4AC |
  DEC A                                     ; $17E4AF |
  DEC A                                     ; $17E4B0 |
  ASL A                                     ; $17E4B1 |
  ASL A                                     ; $17E4B2 |
  ORA $1112                                 ; $17E4B3 |
  TAX                                       ; $17E4B6 |
  LDA $E4FB,x                               ; $17E4B7 |
  STA $111A                                 ; $17E4BA |
  STZ $1117                                 ; $17E4BD |
  STZ $1118                                 ; $17E4C0 |
  LDA #$5C                                  ; $17E4C3 |\ play sound #$005C
  JSL push_sound_queue                      ; $17E4C5 |/
  BRA CODE_17E4FA                           ; $17E4C9 |

CODE_17E4CB:
  LDA $37                                   ; $17E4CB |
  ORA $38                                   ; $17E4CD |
  AND #$C0                                  ; $17E4CF |
  BEQ CODE_17E4FA                           ; $17E4D1 |
  LDA $1117                                 ; $17E4D3 |
  DEC A                                     ; $17E4D6 |
  DEC A                                     ; $17E4D7 |
  CMP !r_cur_world                          ; $17E4D8 |
  BEQ CODE_17E4FA                           ; $17E4DB |
  STA !r_cur_world                          ; $17E4DD |
  LSR A                                     ; $17E4E0 |
  TAX                                       ; $17E4E1 |
  LDA $E187,x                               ; $17E4E2 |
  STA !r_cur_stage                          ; $17E4E5 |
  STZ $1112                                 ; $17E4E8 |
  STZ $110B                                 ; $17E4EB |
  STZ $1123                                 ; $17E4EE |
  INC $1118                                 ; $17E4F1 |
  LDA #$19                                  ; $17E4F4 |\ play sound #$0019
  JSL push_sound_queue                      ; $17E4F6 |/

CODE_17E4FA:
  RTS                                       ; $17E4FA |

  db $02, $02, $02, $02, $02, $02, $00, $00 ; $17E4FB |
  db $01, $02, $02, $02, $02, $02, $00, $00 ; $17E503 |
  db $01, $01, $02, $02, $02, $02, $00, $00 ; $17E50B |
  db $01, $01, $01, $02, $02, $02, $00, $00 ; $17E513 |
  db $01, $01, $01, $02, $02, $02, $00, $00 ; $17E51B |
  db $01, $01, $01, $01, $02, $02, $00, $00 ; $17E523 |
  db $01, $01, $01, $01, $01, $02, $00, $00 ; $17E52B |

CODE_17E533:
  REP #$30                                  ; $17E533 |
  LDX !s_oam_next_free_slot_ptr             ; $17E535 |
  LDA $1109                                 ; $17E538 |
  AND #$00FF                                ; $17E53B |
  SEC                                       ; $17E53E |
  SBC #$0010                                ; $17E53F |
  STA $6000,x                               ; $17E542 |
  STA $6010,x                               ; $17E545 |
  CLC                                       ; $17E548 |
  ADC #$0010                                ; $17E549 |
  STA $6008,x                               ; $17E54C |
  STA $6018,x                               ; $17E54F |
  LDA $110A                                 ; $17E552 |
  AND #$00FF                                ; $17E555 |
  SEC                                       ; $17E558 |
  SBC #$0016                                ; $17E559 |
  STA $6002,x                               ; $17E55C |
  STA $600A,x                               ; $17E55F |
  CLC                                       ; $17E562 |
  ADC #$0010                                ; $17E563 |
  STA $6012,x                               ; $17E566 |
  STA $601A,x                               ; $17E569 |
  LDY !r_cur_world                          ; $17E56C |
  LDA $DC43,y                               ; $17E56F |
  STA $04                                   ; $17E572 |
  LDA $1119                                 ; $17E574 |
  AND #$00FF                                ; $17E577 |
  BNE CODE_17E58D                           ; $17E57A |
  LDA $E198,y                               ; $17E57C |
  CLC                                       ; $17E57F |
  ADC $1112                                 ; $17E580 |
  AND #$00FF                                ; $17E583 |
  TAY                                       ; $17E586 |
  LDA !r_map_icon_gfx,y                     ; $17E587 |
  AND #$007F                                ; $17E58A |

CODE_17E58D:
  DEC A                                     ; $17E58D |
  STA $10                                   ; $17E58E |
  AND #$000F                                ; $17E590 |
  ASL A                                     ; $17E593 |
  TAY                                       ; $17E594 |
  JSR CODE_17D6A2                           ; $17E595 |
  LDA $10                                   ; $17E598 |
  BNE CODE_17E59E                           ; $17E59A |
  LDA ($04),y                               ; $17E59C |

CODE_17E59E:
  LSR A                                     ; $17E59E |
  SEC                                       ; $17E59F |
  SBC #$0600                                ; $17E5A0 |
  ORA #$31E0                                ; $17E5A3 |
  STA $6004,x                               ; $17E5A6 |
  INC A                                     ; $17E5A9 |
  INC A                                     ; $17E5AA |
  STA $600C,x                               ; $17E5AB |
  INC A                                     ; $17E5AE |
  INC A                                     ; $17E5AF |
  STA $6014,x                               ; $17E5B0 |
  INC A                                     ; $17E5B3 |
  INC A                                     ; $17E5B4 |
  STA $601C,x                               ; $17E5B5 |
  LDA #$4002                                ; $17E5B8 |
  STA $6006,x                               ; $17E5BB |
  STA $600E,x                               ; $17E5BE |
  STA $6016,x                               ; $17E5C1 |
  STA $601E,x                               ; $17E5C4 |
  TXA                                       ; $17E5C7 |
  CLC                                       ; $17E5C8 |
  ADC #$0020                                ; $17E5C9 |
  STA !s_oam_next_free_slot_ptr             ; $17E5CC |
  SEP #$30                                  ; $17E5CF |
  RTS                                       ; $17E5D1 |

CODE_17E5D2:
  LDA $1112                                 ; $17E5D2 |
  STA $110B                                 ; $17E5D5 |
  ASL A                                     ; $17E5D8 |
  TAX                                       ; $17E5D9 |
  REP #$20                                  ; $17E5DA |
  LDA $DCEF,x                               ; $17E5DC |
  LDY $1106                                 ; $17E5DF |
  BNE CODE_17E5E8                           ; $17E5E2 |
  CLC                                       ; $17E5E4 |
  ADC #$0380                                ; $17E5E5 |

CODE_17E5E8:
  STA $00                                   ; $17E5E8 |
  CLC                                       ; $17E5EA |
  ADC #$0040                                ; $17E5EB |
  STA $02                                   ; $17E5EE |
  CLC                                       ; $17E5F0 |
  ADC #$0040                                ; $17E5F1 |
  STA $04                                   ; $17E5F4 |
  LDY !r_cur_world                          ; $17E5F6 |
  LDA $C9EA,y                               ; $17E5F9 |
  STA $06                                   ; $17E5FC |
  LDY #$00                                  ; $17E5FE |

CODE_17E600:
  LDA $1112                                 ; $17E600 |
  AND #$00FF                                ; $17E603 |
  CMP #$0003                                ; $17E606 |
  BEQ CODE_17E615                           ; $17E609 |
  CMP #$0007                                ; $17E60B |
  BEQ CODE_17E615                           ; $17E60E |
  JSR CODE_17D287                           ; $17E610 |
  BRA CODE_17E618                           ; $17E613 |

CODE_17E615:
  JSR CODE_17D29D                           ; $17E615 |

CODE_17E618:
  INY                                       ; $17E618 |
  INY                                       ; $17E619 |
  CPY #$06                                  ; $17E61A |
  BCC CODE_17E600                           ; $17E61C |

CODE_17E61E:
  REP #$30                                  ; $17E61E |
  LDA $1106                                 ; $17E620 |
  AND #$0001                                ; $17E623 |
  ASL A                                     ; $17E626 |
  TAY                                       ; $17E627 |
  LDA #$0000                                ; $17E628 |
  STA $01                                   ; $17E62B |
  LDA $CC8F,y                               ; $17E62D |
  CLC                                       ; $17E630 |
  ADC #$00C0                                ; $17E631 |
  TAX                                       ; $17E634 |
  LDY #$1C80                                ; $17E635 |
  LDA #$0200                                ; $17E638 |
  JSL $00BEA6                               ; $17E63B |
  SEP #$30                                  ; $17E63F |
  RTS                                       ; $17E641 |

  JSR CODE_17E61E                           ; $17E642 |
  RTL                                       ; $17E645 |

  REP #$20                                  ; $17E646 |
  LDX !r_cur_world                          ; $17E648 |
  LDA $DBA3,x                               ; $17E64B |
  STA $00                                   ; $17E64E |
  LDA $1112                                 ; $17E650 |
  AND #$00FF                                ; $17E653 |
  TAY                                       ; $17E656 |
  LDA ($00),y                               ; $17E657 |
  AND #$00FF                                ; $17E659 |
  STA !gsu_r1                               ; $17E65C |
  LDA $1119                                 ; $17E65F |
  AND #$007F                                ; $17E662 |
  DEC A                                     ; $17E665 |
  CLC                                       ; $17E666 |
  ADC $E198,x                               ; $17E667 |
  STA !gsu_r3                               ; $17E66A |
  LDA $1107                                 ; $17E66D |
  AND #$00FF                                ; $17E670 |
  CLC                                       ; $17E673 |
  ADC #$0100                                ; $17E674 |
  STA !gsu_r6                               ; $17E677 |
  LDX #$08                                  ; $17E67A |
  LDA #$DBDE                                ; $17E67C |
  JSL r_gsu_init_1                          ; $17E67F | GSU init

CODE_17E683:
  REP #$10                                  ; $17E683 |
  LDA #$0070                                ; $17E685 |
  STA $01                                   ; $17E688 |
  LDY #$7E00                                ; $17E68A |
  LDX #$5800                                ; $17E68D |
  LDA #$0080                                ; $17E690 |
  JSL $00BEA6                               ; $17E693 |
  LDY #$7F00                                ; $17E697 |
  LDX #$5A00                                ; $17E69A |
  LDA #$0080                                ; $17E69D |
  JSL $00BEA6                               ; $17E6A0 |
  LDY #$7E40                                ; $17E6A4 |
  LDX #$5C00                                ; $17E6A7 |
  LDA #$0080                                ; $17E6AA |
  JSL $00BEA6                               ; $17E6AD |
  LDY #$7F40                                ; $17E6B1 |
  LDX #$5E00                                ; $17E6B4 |
  LDA #$0080                                ; $17E6B7 |
  JSL $00BEA6                               ; $17E6BA |
  SEP #$30                                  ; $17E6BE |
  RTS                                       ; $17E6C0 |

  dw $E6DE                                  ; $17E6C1 |
  dw $E71E                                  ; $17E6C3 |

CODE_17E6C5:
  LDX #$00                                  ; $17E6C5 |
  LDA $111B                                 ; $17E6C7 |
  AND #$0F                                  ; $17E6CA |
  BEQ CODE_17E6DA                           ; $17E6CC |
  AND #$0C                                  ; $17E6CE |
  BEQ CODE_17E6D7                           ; $17E6D0 |
  LSR A                                     ; $17E6D2 |
  LSR A                                     ; $17E6D3 |
  TAY                                       ; $17E6D4 |
  INX                                       ; $17E6D5 |
  INX                                       ; $17E6D6 |

CODE_17E6D7:
  JSR ($E6C1,x)                             ; $17E6D7 |

CODE_17E6DA:
  STZ $111B                                 ; $17E6DA |
  RTS                                       ; $17E6DD |

  LDA #$0B                                  ; $17E6DE |
  LDY $1108                                 ; $17E6E0 |
  BNE CODE_17E708                           ; $17E6E3 |
  SEC                                       ; $17E6E5 |
  SBC $1112                                 ; $17E6E6 |
  STA $1112                                 ; $17E6E9 |
  TAY                                       ; $17E6EC |
  LDX !r_cur_world                          ; $17E6ED |
  REP #$20                                  ; $17E6F0 |
  LDA $C93A,x                               ; $17E6F2 |
  STA $00                                   ; $17E6F5 |
  SEP #$20                                  ; $17E6F7 |

CODE_17E6F9:
  LDA ($00),y                               ; $17E6F9 |
  AND #$0F                                  ; $17E6FB |
  BNE CODE_17E702                           ; $17E6FD |
  INY                                       ; $17E6FF |
  BRA CODE_17E6F9                           ; $17E700 |

CODE_17E702:
  TYA                                       ; $17E702 |
  STA $1112                                 ; $17E703 |
  BRA CODE_17E70F                           ; $17E706 |

CODE_17E708:
  SEC                                       ; $17E708 |
  SBC $110B                                 ; $17E709 |
  STA $110B                                 ; $17E70C |

CODE_17E70F:
  ASL A                                     ; $17E70F |
  TAY                                       ; $17E710 |
  REP #$20                                  ; $17E711 |
  LDA $E257,y                               ; $17E713 |
  STA $1109                                 ; $17E716 |
  SEP #$20                                  ; $17E719 |
  RTS                                       ; $17E71B |

  db $08, $F8                               ; $17E71C |

  LDA $110A                                 ; $17E71E |
  CLC                                       ; $17E721 |
  ADC $E71B,y                               ; $17E722 |
  STA $110D                                 ; $17E725 |
  RTS                                       ; $17E728 |

  LDX !r_cur_stage                          ; $17E729 |\  x = current level #
  LDA yoshi_level_colors,x                  ; $17E72C | | pull Yoshi color from level table
  STA !r_yoshi_color                        ; $17E730 |/  set Yoshi color
  JSR CODE_17E5D2                           ; $17E733 |
  INC $111D                                 ; $17E736 |
  REP #$20                                  ; $17E739 |
  STZ $110E                                 ; $17E73B |
  LDA #$0100                                ; $17E73E |
  STA $1110                                 ; $17E741 |
  LDX !r_cur_world                          ; $17E744 |
  REP #$20                                  ; $17E747 |
  LDA $DBA3,x                               ; $17E749 |
  STA $00                                   ; $17E74C |
  LDX !r_cur_world                          ; $17E74E |
  LDA $E198,x                               ; $17E751 |
  CLC                                       ; $17E754 |
  ADC $1112                                 ; $17E755 |
  AND #$00FF                                ; $17E758 |
  TAY                                       ; $17E75B |
  LDA !r_map_icon_gfx,y                     ; $17E75C |
  AND #$007F                                ; $17E75F |
  DEC A                                     ; $17E762 |
  TAY                                       ; $17E763 |
  CLC                                       ; $17E764 |
  ADC $E198,x                               ; $17E765 |
  STA !gsu_r3                               ; $17E768 |
  LDA ($00),y                               ; $17E76B |
  AND #$00FF                                ; $17E76D |
  STA !gsu_r1                               ; $17E770 |
  LDA $110E                                 ; $17E773 |
  AND #$00FF                                ; $17E776 |
  STA !gsu_r5                               ; $17E779 |
  LDA $1110                                 ; $17E77C |
  BEQ CODE_17E7BC                           ; $17E77F |
  STA !gsu_r6                               ; $17E781 |
  LDX #$08                                  ; $17E784 |
  LDA #$DC05                                ; $17E786 |
  JSL r_gsu_init_1                          ; $17E789 | GSU init
  JSR CODE_17E683                           ; $17E78D |
  REP #$20                                  ; $17E790 |
  LDA $110E                                 ; $17E792 |
  CLC                                       ; $17E795 |
  ADC #$0008                                ; $17E796 |
  STA $110E                                 ; $17E799 |
  LDA $1110                                 ; $17E79C |
  SEC                                       ; $17E79F |
  SBC #$0002                                ; $17E7A0 |
  CMP #$0014                                ; $17E7A3 |
  BCS CODE_17E7B9                           ; $17E7A6 |
  SEP #$20                                  ; $17E7A8 |
  LDA #$F1                                  ; $17E7AA |
  STA $4D                                   ; $17E7AC |
  LDA #$43                                  ; $17E7AE |\ play sound #$0043
  JSL push_sound_queue                      ; $17E7B0 |/
  REP #$20                                  ; $17E7B4 |
  LDA #$0000                                ; $17E7B6 |

CODE_17E7B9:
  STA $1110                                 ; $17E7B9 |

CODE_17E7BC:
  SEP #$20                                  ; $17E7BC |
  RTS                                       ; $17E7BE |

CODE_17E7BF:
  LDA $1128                                 ; $17E7BF |
  BEQ CODE_17E7FA                           ; $17E7C2 |
  LDA $0990                                 ; $17E7C4 |
  DEC A                                     ; $17E7C7 |
  BPL CODE_17E7CC                           ; $17E7C8 |
  LDA #$00                                  ; $17E7CA |

CODE_17E7CC:
  STA $0990                                 ; $17E7CC |
  LDA $0992                                 ; $17E7CF |
  DEC A                                     ; $17E7D2 |
  BPL CODE_17E7D7                           ; $17E7D3 |
  LDA #$00                                  ; $17E7D5 |

CODE_17E7D7:
  STA $0992                                 ; $17E7D7 |
  LDA $0994                                 ; $17E7DA |
  DEC A                                     ; $17E7DD |
  DEC A                                     ; $17E7DE |
  BPL CODE_17E7E3                           ; $17E7DF |
  LDA #$00                                  ; $17E7E1 |

CODE_17E7E3:
  STA $0994                                 ; $17E7E3 |
  LDA $0990                                 ; $17E7E6 |
  ORA $0992                                 ; $17E7E9 |
  ORA $0994                                 ; $17E7EC |
  BNE CODE_17E7FA                           ; $17E7EF |
  STZ $1128                                 ; $17E7F1 |
  STZ $1110                                 ; $17E7F4 |
  STZ $1111                                 ; $17E7F7 |

CODE_17E7FA:
  RTS                                       ; $17E7FA |

CODE_17E7FB:
  LDY !r_cur_world                          ; $17E7FB |
  LDA $C93A,y                               ; $17E7FE |
  STA $0A                                   ; $17E801 |
  LDY #$00                                  ; $17E803 |
  SEP #$20                                  ; $17E805 |

CODE_17E807:
  LDA ($0A),y                               ; $17E807 |
  AND #$0F                                  ; $17E809 |
  CMP $00                                   ; $17E80B |
  BEQ CODE_17E816                           ; $17E80D |
  INY                                       ; $17E80F |
  CPY #$0C                                  ; $17E810 |
  BCC CODE_17E807                           ; $17E812 |
  LDY #$00                                  ; $17E814 |

CODE_17E816:
  REP #$20                                  ; $17E816 |
  RTS                                       ; $17E818 |

  dw $2D86, $2D65, $2D66, $2D67             ; $17E819 |
  dw $2D68, $2D75, $2D76, $2D77             ; $17E821 |
  dw $6D86                                  ; $17E829 |

  dw $3186, $3165, $317F, $3158             ; $17E82B |
  dw $3178, $3125, $3126, $3127             ; $17E833 |
  dw $7186                                  ; $17E83B |

  dw $0C00, $1000, $0008, $001A             ; $17E83D |

  dw $3920, $3921, $3922, $3923             ; $17E845 |
  dw $3924                                  ; $17E84D |

  dw $3905, $3906, $3907, $3908             ; $17E84F |
  dw $3928                                  ; $17E857 |

  dw $E845                                  ; $17E859 |
  dw $E84F                                  ; $17E85B |

CODE_17E85D:
  REP #$30                                  ; $17E85D |
  LDX #$00FE                                ; $17E85F |
  LDA #$21BF                                ; $17E862 |

CODE_17E865:
  STA $0A06,x                               ; $17E865 |
  STA $0D86,x                               ; $17E868 |
  STA $0B06,x                               ; $17E86B |
  STA $0E86,x                               ; $17E86E |
  STA $0C06,x                               ; $17E871 |
  STA $0F86,x                               ; $17E874 |
  STA $0C86,x                               ; $17E877 |
  STA $1006,x                               ; $17E87A |
  DEX                                       ; $17E87D |
  DEX                                       ; $17E87E |
  BPL CODE_17E865                           ; $17E87F |
  LDA $112D                                 ; $17E881 |
  AND #$0001                                ; $17E884 |
  ASL A                                     ; $17E887 |
  TAX                                       ; $17E888 |
  LDA $E83D,x                               ; $17E889 |
  STA $00                                   ; $17E88C |
  LDX #$0000                                ; $17E88E |
  TXY                                       ; $17E891 |
  LDA $1106                                 ; $17E892 |
  AND #$0001                                ; $17E895 |
  BEQ CODE_17E89D                           ; $17E898 |
  LDX #$0380                                ; $17E89A |

CODE_17E89D:
  STX $0E                                   ; $17E89D |

CODE_17E89F:
  LDA $E819,y                               ; $17E89F |
  STA $0A4E,x                               ; $17E8A2 |
  LDA $E82B,y                               ; $17E8A5 |
  STA $0A60,x                               ; $17E8A8 |
  INX                                       ; $17E8AB |
  INX                                       ; $17E8AC |
  INY                                       ; $17E8AD |
  INY                                       ; $17E8AE |
  CPY #$0012                                ; $17E8AF |
  BCC CODE_17E89F                           ; $17E8B2 |
  LDY #$0000                                ; $17E8B4 |
  LDX $0E                                   ; $17E8B7 |

CODE_17E8B9:
  LDA $DDA3,y                               ; $17E8B9 |
  ORA $00                                   ; $17E8BC |
  STA $0AC6,x                               ; $17E8BE |
  STA $0B06,x                               ; $17E8C1 |
  STA $0B46,x                               ; $17E8C4 |
  STA $0B86,x                               ; $17E8C7 |
  STA $0BC6,x                               ; $17E8CA |
  STA $0C06,x                               ; $17E8CD |
  STA $0C46,x                               ; $17E8D0 |
  STA $0C86,x                               ; $17E8D3 |
  STA $0CC6,x                               ; $17E8D6 |
  STA $0D06,x                               ; $17E8D9 |
  LDA $DDE3,y                               ; $17E8DC |
  ORA $00                                   ; $17E8DF |
  STA $0D06,x                               ; $17E8E1 |
  INX                                       ; $17E8E4 |
  INX                                       ; $17E8E5 |
  INY                                       ; $17E8E6 |
  INY                                       ; $17E8E7 |
  CPY #$0040                                ; $17E8E8 |
  BCC CODE_17E8B9                           ; $17E8EB |
  LDX $0E                                   ; $17E8ED |
  LDY #$0000                                ; $17E8EF |
  LDA #$A199                                ; $17E8F2 |
  ORA $00                                   ; $17E8F5 |
  STA $0A8A,x                               ; $17E8F7 |
  ORA #$4000                                ; $17E8FA |
  STA $0AC0,x                               ; $17E8FD |
  LDA #$218F                                ; $17E900 |
  ORA $00                                   ; $17E903 |

CODE_17E905:
  STA $0A8C,x                               ; $17E905 |
  INX                                       ; $17E908 |
  INX                                       ; $17E909 |
  INY                                       ; $17E90A |
  CPY #$001A                                ; $17E90B |
  BCC CODE_17E905                           ; $17E90E |
  LDA $112D                                 ; $17E910 |
  AND #$000F                                ; $17E913 |
  ASL A                                     ; $17E916 |
  TAY                                       ; $17E917 |
  LDA $E841,y                               ; $17E918 |
  CLC                                       ; $17E91B |
  ADC $0E                                   ; $17E91C |
  TAX                                       ; $17E91E |
  LDY #$0009                                ; $17E91F |
  LDA #$218E                                ; $17E922 |
  ORA $00                                   ; $17E925 |

CODE_17E927:
  STA $0A86,x                               ; $17E927 |
  INX                                       ; $17E92A |
  INX                                       ; $17E92B |
  DEY                                       ; $17E92C |
  BNE CODE_17E927                           ; $17E92D |
  LDY #$0000                                ; $17E92F |
  LDX $0E                                   ; $17E932 |
  LDA #$3909                                ; $17E934 |

CODE_17E937:
  PHA                                       ; $17E937 |
  STA $0ADA,x                               ; $17E938 |
  CLC                                       ; $17E93B |
  ADC #$0010                                ; $17E93C |
  STA $0B1A,x                               ; $17E93F |
  CLC                                       ; $17E942 |
  ADC #$0010                                ; $17E943 |
  STA $0B5A,x                               ; $17E946 |
  CLC                                       ; $17E949 |
  ADC #$0010                                ; $17E94A |
  STA $0B9A,x                               ; $17E94D |
  CLC                                       ; $17E950 |
  ADC #$0010                                ; $17E951 |
  STA $0BDA,x                               ; $17E954 |
  CLC                                       ; $17E957 |
  ADC #$0010                                ; $17E958 |
  STA $0C1A,x                               ; $17E95B |
  CLC                                       ; $17E95E |
  ADC #$0010                                ; $17E95F |
  STA $0C5A,x                               ; $17E962 |
  CLC                                       ; $17E965 |
  ADC #$0010                                ; $17E966 |
  STA $0C9A,x                               ; $17E969 |
  PLA                                       ; $17E96C |
  INC A                                     ; $17E96D |
  INX                                       ; $17E96E |
  INX                                       ; $17E96F |
  INY                                       ; $17E970 |
  CPY #$0007                                ; $17E971 |
  BCC CODE_17E937                           ; $17E974 |
  LDA #$B90F                                ; $17E976 |
  STA $0C98,x                               ; $17E979 |
  LDX $0E                                   ; $17E97C |
  LDY #$0000                                ; $17E97E |

CODE_17E981:
  LDA #$2135                                ; $17E981 |
  ORA $00                                   ; $17E984 |
  STA $0ACE,x                               ; $17E986 |
  STA $0BCE,x                               ; $17E989 |
  STA $0BEA,x                               ; $17E98C |
  ORA #$8000                                ; $17E98F |
  STA $0B8E,x                               ; $17E992 |
  STA $0C8E,x                               ; $17E995 |
  STA $0CAA,x                               ; $17E998 |
  LDA #$2145                                ; $17E99B |
  ORA $00                                   ; $17E99E |
  STA $0AEA,x                               ; $17E9A0 |
  LDA #$2155                                ; $17E9A3 |
  ORA $00                                   ; $17E9A6 |
  STA $0BAA,x                               ; $17E9A8 |
  INX                                       ; $17E9AB |
  INX                                       ; $17E9AC |
  INY                                       ; $17E9AD |
  CPY #$0005                                ; $17E9AE |
  BCC CODE_17E981                           ; $17E9B1 |
  LDA #$2148                                ; $17E9B3 |
  ORA $00                                   ; $17E9B6 |
  STA $0AEA,x                               ; $17E9B8 |
  LDA #$2156                                ; $17E9BB |
  ORA $00                                   ; $17E9BE |
  STA $0BAA,x                               ; $17E9C0 |
  LDX $0E                                   ; $17E9C3 |
  LDA #$2137                                ; $17E9C5 |
  ORA $00                                   ; $17E9C8 |
  STA $0B0C,x                               ; $17E9CA |
  STA $0B4C,x                               ; $17E9CD |
  STA $0C0C,x                               ; $17E9D0 |
  STA $0C4C,x                               ; $17E9D3 |
  STA $0C28,x                               ; $17E9D6 |
  ORA #$4000                                ; $17E9D9 |
  STA $0B58,x                               ; $17E9DC |
  STA $0C58,x                               ; $17E9DF |
  STA $0C34,x                               ; $17E9E2 |
  STA $0C74,x                               ; $17E9E5 |
  LDA #$6136                                ; $17E9E8 |
  ORA $00                                   ; $17E9EB |
  STA $0B18,x                               ; $17E9ED |
  STA $0C18,x                               ; $17E9F0 |
  EOR #$C000                                ; $17E9F3 |
  STA $0C68,x                               ; $17E9F6 |
  LDA #$2146                                ; $17E9F9 |
  ORA $00                                   ; $17E9FC |
  STA $0B28,x                               ; $17E9FE |
  LDA #$A147                                ; $17EA01 |
  ORA $00                                   ; $17EA04 |
  STA $0B68,x                               ; $17EA06 |
  LDA #$2157                                ; $17EA09 |
  ORA $00                                   ; $17EA0C |
  STA $0B34,x                               ; $17EA0E |
  STA $0B74,x                               ; $17EA11 |
  LDA #$2148                                ; $17EA14 |
  ORA $00                                   ; $17EA17 |
  STA $0AF4,x                               ; $17EA19 |
  ORA #$4000                                ; $17EA1C |
  STA $0AE8,x                               ; $17EA1F |
  ORA #$8000                                ; $17EA22 |
  STA $0BA8,x                               ; $17EA25 |
  LDA #$3960                                ; $17EA28 |
  STA $10                                   ; $17EA2B |
  LDA #$3140                                ; $17EA2D |
  STA $12                                   ; $17EA30 |
  LDA #$2D00                                ; $17EA32 |
  STA $14                                   ; $17EA35 |
  LDX $0E                                   ; $17EA37 |
  LDY #$0005                                ; $17EA39 |

CODE_17EA3C:
  LDA $10                                   ; $17EA3C |
  STA $0B0E,x                               ; $17EA3E |
  ORA #$0010                                ; $17EA41 |
  STA $0B4E,x                               ; $17EA44 |
  LDA $12                                   ; $17EA47 |
  STA $0C2A,x                               ; $17EA49 |
  ORA #$0010                                ; $17EA4C |
  STA $0C6A,x                               ; $17EA4F |
  LDA $14                                   ; $17EA52 |
  STA $0C0E,x                               ; $17EA54 |
  ORA #$0010                                ; $17EA57 |
  STA $0C4E,x                               ; $17EA5A |
  INC $10                                   ; $17EA5D |
  INC $12                                   ; $17EA5F |
  INC $14                                   ; $17EA61 |
  INX                                       ; $17EA63 |
  INX                                       ; $17EA64 |
  DEY                                       ; $17EA65 |
  BNE CODE_17EA3C                           ; $17EA66 |
  LDX $0E                                   ; $17EA68 |
  LDA #$399F                                ; $17EA6A |
  STA $0B76,x                               ; $17EA6D |
  PHA                                       ; $17EA70 |
  ORA #$8000                                ; $17EA71 |
  STA $0C76,x                               ; $17EA74 |
  PLA                                       ; $17EA77 |
  ORA #$4000                                ; $17EA78 |
  STA $0B7E,x                               ; $17EA7B |
  ORA #$8000                                ; $17EA7E |
  STA $0C7E,x                               ; $17EA81 |
  LDA #$398F                                ; $17EA84 |
  STA $0B78,x                               ; $17EA87 |
  STA $0B7A,x                               ; $17EA8A |
  STA $0B7C,x                               ; $17EA8D |
  ORA #$8000                                ; $17EA90 |
  STA $0C78,x                               ; $17EA93 |
  STA $0C7A,x                               ; $17EA96 |
  STA $0C7C,x                               ; $17EA99 |
  LDA #$3998                                ; $17EA9C |
  STA $0BB6,x                               ; $17EA9F |
  STA $0BF6,x                               ; $17EAA2 |
  STA $0C36,x                               ; $17EAA5 |
  ORA #$4000                                ; $17EAA8 |
  STA $0BBE,x                               ; $17EAAB |
  STA $0BFE,x                               ; $17EAAE |
  STA $0C3E,x                               ; $17EAB1 |
  LDA $1106                                 ; $17EAB4 |
  AND #$0001                                ; $17EAB7 |
  XBA                                       ; $17EABA |
  LSR A                                     ; $17EABB |
  STA $1E                                   ; $17EABC |
  LDA #$2C63                                ; $17EABE |
  ORA $1E                                   ; $17EAC1 |
  STA $10                                   ; $17EAC3 |
  LDA #$2C66                                ; $17EAC5 |
  ORA $1E                                   ; $17EAC8 |
  STA $12                                   ; $17EACA |
  LDA #$2C69                                ; $17EACC |
  ORA $1E                                   ; $17EACF |
  STA $14                                   ; $17EAD1 |
  LDX $0E                                   ; $17EAD3 |
  LDY #$0003                                ; $17EAD5 |

CODE_17EAD8:
  LDA $10                                   ; $17EAD8 |
  STA $0BB8,x                               ; $17EADA |
  LDA $12                                   ; $17EADD |
  STA $0BF8,x                               ; $17EADF |
  LDA $14                                   ; $17EAE2 |
  STA $0C38,x                               ; $17EAE4 |
  INC $10                                   ; $17EAE7 |
  INC $12                                   ; $17EAE9 |
  INC $14                                   ; $17EAEB |
  INX                                       ; $17EAED |
  INX                                       ; $17EAEE |
  DEY                                       ; $17EAEF |
  BNE CODE_17EAD8                           ; $17EAF0 |
  LDX $0E                                   ; $17EAF2 |
  LDA $112D                                 ; $17EAF4 |
  AND #$00FF                                ; $17EAF7 |
  ASL A                                     ; $17EAFA |
  TAY                                       ; $17EAFB |
  LDA $E859,y                               ; $17EAFC |
  STA $00                                   ; $17EAFF |
  LDY #$0000                                ; $17EB01 |

CODE_17EB04:
  LDA ($00),y                               ; $17EB04 |
  STA $0B2A,x                               ; $17EB06 |
  ORA #$0010                                ; $17EB09 |
  STA $0B6A,x                               ; $17EB0C |
  INX                                       ; $17EB0F |
  INX                                       ; $17EB10 |
  INY                                       ; $17EB11 |
  INY                                       ; $17EB12 |
  CPY #$000A                                ; $17EB13 |
  BCC CODE_17EB04                           ; $17EB16 |
  SEP #$30                                  ; $17EB18 |
  RTS                                       ; $17EB1A |

  dw $0A06, $0D86                           ; $17EB1B |

CODE_17EB1F:
  REP #$30                                  ; $17EB1F |
  LDA $1106                                 ; $17EB21 |
  AND #$0001                                ; $17EB24 |
  ASL A                                     ; $17EB27 |
  TAY                                       ; $17EB28 |
  LDA #$0000                                ; $17EB29 |
  STA $01                                   ; $17EB2C |
  LDA $EB1B,y                               ; $17EB2E |
  TAX                                       ; $17EB31 |
  LDY #$1E20                                ; $17EB32 |
  LDA #$0380                                ; $17EB35 |
  JSL $00BEA6                               ; $17EB38 |
  SEP #$30                                  ; $17EB3C |
  RTS                                       ; $17EB3E |

  STZ $1122                                 ; $17EB3F |

CODE_17EB42:
  REP #$20                                  ; $17EB42 |
  LDA #$000E                                ; $17EB44 |
  STA !gsu_r9                               ; $17EB47 |
  LDA #$0017                                ; $17EB4A |
  STA $6000                                 ; $17EB4D |
  LDA #$DBF7                                ; $17EB50 |
  STA $6002                                 ; $17EB53 |
  LDX #$08                                  ; $17EB56 |
  LDA #$D995                                ; $17EB58 |
  JSL r_gsu_init_1                          ; $17EB5B | GSU init

CODE_17EB5F:
  REP #$10                                  ; $17EB5F |
  LDA $1106                                 ; $17EB61 |
  AND #$0001                                ; $17EB64 |
  EOR #$0001                                ; $17EB67 |
  ASL A                                     ; $17EB6A |
  TAY                                       ; $17EB6B |
  LDX #$6000                                ; $17EB6C |
  LDA #$0070                                ; $17EB6F |
  STA $01                                   ; $17EB72 |
  LDA $CCF1,y                               ; $17EB74 |
  TAY                                       ; $17EB77 |
  LDA #$0800                                ; $17EB78 |
  JSL $00BEA6                               ; $17EB7B |
  SEP #$30                                  ; $17EB7F |
  INC $1118                                 ; $17EB81 |
  RTS                                       ; $17EB84 |

  dw $0048, $0049, $004A                    ; $17EB85 |

  LDX #$16                                  ; $17EB8B |
  JSR CODE_17CFA2                           ; $17EB8D |
  LDA #$32                                  ; $17EB90 |\ play sound #$0032
  JSL push_sound_queue                      ; $17EB92 |/
  STZ $1107                                 ; $17EB96 |
  LDX !s_control_scheme                     ; $17EB99 |
  LDA $EB85,x                               ; $17EB9C |
  JSR CODE_17CFDA                           ; $17EB9F |
  STZ $1122                                 ; $17EBA2 |
  INC $1118                                 ; $17EBA5 |
  RTS                                       ; $17EBA8 |

  JSR CODE_17ECA1                           ; $17EBA9 |
  STZ $6083                                 ; $17EBAC |
  LDA !s_control_scheme                     ; $17EBAF |
  LSR A                                     ; $17EBB2 |
  STA $112D                                 ; $17EBB3 |
  BRA CODE_17EBCB                           ; $17EBB6 |
  JSR CODE_17E85D                           ; $17EBB8 |
  INC $1118                                 ; $17EBBB |
  JSR CODE_17EB1F                           ; $17EBBE |
  LDA $1106                                 ; $17EBC1 |
  EOR #$01                                  ; $17EBC4 |
  AND #$01                                  ; $17EBC6 |
  STA $1106                                 ; $17EBC8 |

CODE_17EBCB:
  LDX !s_control_scheme                     ; $17EBCB |
  LDA $EB85,x                               ; $17EBCE |
  TAX                                       ; $17EBD1 |

CODE_17EBD2:
  REP #$20                                  ; $17EBD2 |
  LDA $1107                                 ; $17EBD4 |
  CLC                                       ; $17EBD7 |
  ADC #$0008                                ; $17EBD8 |
  STA $1107                                 ; $17EBDB |
  SEP #$20                                  ; $17EBDE |
  CMP #$40                                  ; $17EBE0 |
  BCC CODE_17EBE7                           ; $17EBE2 |
  INC $1118                                 ; $17EBE4 |

CODE_17EBE7:
  TXA                                       ; $17EBE7 |
  JSR CODE_17CFDA                           ; $17EBE8 |
  RTS                                       ; $17EBEB |

  LDX !s_control_scheme                     ; $17EBEC |
  LDA $EB85,x                               ; $17EBEF |
  TAX                                       ; $17EBF2 |

CODE_17EBF3:
  REP #$20                                  ; $17EBF3 |
  LDA $1107                                 ; $17EBF5 |
  SEC                                       ; $17EBF8 |
  SBC #$0008                                ; $17EBF9 |
  STA $1107                                 ; $17EBFC |
  SEP #$20                                  ; $17EBFF |
  LDA $1107                                 ; $17EC01 |
  BPL CODE_17EC21                           ; $17EC04 |
  INC $1118                                 ; $17EC06 |
  LDA #$13                                  ; $17EC09 |
  STA !r_reg_tmw_mirror                     ; $17EC0B |
  LDA #$82                                  ; $17EC0E |
  STA !r_reg_wobjsel_mirror                 ; $17EC10 |
  STZ $1107                                 ; $17EC13 |
  REP #$20                                  ; $17EC16 |
  LDA #$FF00                                ; $17EC18 |
  STA $7E55C0                               ; $17EC1B |
  SEP #$20                                  ; $17EC1F |

CODE_17EC21:
  TXA                                       ; $17EC21 |
  JSR CODE_17CFDA                           ; $17EC22 |
  RTS                                       ; $17EC25 |

CODE_17EC26:
  REP #$30                                  ; $17EC26 |
  LDA $1107                                 ; $17EC28 |
  AND #$00FF                                ; $17EC2B |
  ASL A                                     ; $17EC2E |
  ASL A                                     ; $17EC2F |
  TAX                                       ; $17EC30 |
  LDA #$EF11                                ; $17EC31 |
  STA $7E55C4,x                             ; $17EC34 |
  STA $7E55C8,x                             ; $17EC38 |
  STA $7E55CC,x                             ; $17EC3C |
  STA $7E55D0,x                             ; $17EC40 |
  SEP #$30                                  ; $17EC44 |
  LDA $1107                                 ; $17EC46 |
  CLC                                       ; $17EC49 |
  ADC #$04                                  ; $17EC4A |
  STA $1107                                 ; $17EC4C |
  CMP #$50                                  ; $17EC4F |
  BCC CODE_17EC91                           ; $17EC51 |
  INC $1118                                 ; $17EC53 |
  STZ $1107                                 ; $17EC56 |
  LDA #$00                                  ; $17EC59 |
  STA !r_reg_tmw_mirror                     ; $17EC5B |
  LDA #$80                                  ; $17EC5E |
  STA !r_reg_wobjsel_mirror                 ; $17EC60 |
  REP #$20                                  ; $17EC63 |
  LDA #$4AD4                                ; $17EC65 |
  STA $1109                                 ; $17EC68 |
  SEP #$20                                  ; $17EC6B |

CODE_17EC6D:
  REP #$30                                  ; $17EC6D |
  LDA $1106                                 ; $17EC6F |
  EOR #$0001                                ; $17EC72 |
  AND #$0001                                ; $17EC75 |
  ASL A                                     ; $17EC78 |
  TAY                                       ; $17EC79 |
  LDA #$0000                                ; $17EC7A |
  STA $01                                   ; $17EC7D |
  LDA $EB1B,y                               ; $17EC7F |
  TAX                                       ; $17EC82 |
  LDY #$1C20                                ; $17EC83 |
  LDA #$0380                                ; $17EC86 |
  JSL $00BEA6                               ; $17EC89 |
  SEP #$30                                  ; $17EC8D |
  BRA CODE_17ECA0                           ; $17EC8F |

CODE_17EC91:
  LDA $1118                                 ; $17EC91 |
  CMP #$38                                  ; $17EC94 |
  BCS CODE_17ECA0                           ; $17EC96 |
  JSR CODE_17D005                           ; $17EC98 |
  LDA #$80                                  ; $17EC9B |
  STA $1122                                 ; $17EC9D |

CODE_17ECA0:
  RTS                                       ; $17ECA0 |

CODE_17ECA1:
  PHB                                       ; $17ECA1 |
  LDA #$7E                                  ; $17ECA2 |
  PHA                                       ; $17ECA4 |
  PLB                                       ; $17ECA5 |
  LDY #$00                                  ; $17ECA6 |
  REP #$20                                  ; $17ECA8 |
  LDA #$00FF                                ; $17ECAA |

CODE_17ECAD:
  STA $55C0,y                               ; $17ECAD |
  STA $5640,y                               ; $17ECB0 |
  DEY                                       ; $17ECB3 |
  DEY                                       ; $17ECB4 |
  BNE CODE_17ECAD                           ; $17ECB5 |
  SEP #$20                                  ; $17ECB7 |
  PLB                                       ; $17ECB9 |
  INC $1118                                 ; $17ECBA |
  RTS                                       ; $17ECBD |

  dw $175B, $17A3                           ; $17ECBE |

  LDA $37                                   ; $17ECC2 |
  AND #$80                                  ; $17ECC4 |
  ORA $38                                   ; $17ECC6 |
  AND #$90                                  ; $17ECC8 |
  BEQ CODE_17ECDE                           ; $17ECCA |
  LDA #$08                                  ; $17ECCC |\ play sound #$0008
  JSL push_sound_queue                      ; $17ECCE |/
  LDA #$5F                                  ; $17ECD2 |
  JSR CODE_17CFDA                           ; $17ECD4 |
  LDA #$31                                  ; $17ECD7 |
  STA $1118                                 ; $17ECD9 |
  BRA CODE_17ED01                           ; $17ECDC |

CODE_17ECDE:
  LDA $38                                   ; $17ECDE |
  AND #$08                                  ; $17ECE0 |
  BEQ CODE_17ED01                           ; $17ECE2 |
  LDA !s_control_scheme                     ; $17ECE4 |
  TAX                                       ; $17ECE7 |
  LSR A                                     ; $17ECE8 |
  STA $112D                                 ; $17ECE9 |
  REP #$20                                  ; $17ECEC |
  LDA $ECBE,x                               ; $17ECEE |
  STA $1109                                 ; $17ECF1 |
  SEP #$20                                  ; $17ECF4 |
  LDA #$38                                  ; $17ECF6 |
  STA $1118                                 ; $17ECF8 |
  LDA #$5C                                  ; $17ECFB |\ play sound #$005C
  JSL push_sound_queue                      ; $17ECFD |/

CODE_17ED01:
  RTS                                       ; $17ED01 |

  REP #$30                                  ; $17ED02 |
  LDX #$0000                                ; $17ED04 |
  LDA $1106                                 ; $17ED07 |
  AND #$0001                                ; $17ED0A |
  BNE CODE_17ED12                           ; $17ED0D |
  LDX #$0380                                ; $17ED0F |

CODE_17ED12:
  LDA #$398E                                ; $17ED12 |
  LDY #$0000                                ; $17ED15 |

CODE_17ED18:
  STA $0BB8,x                               ; $17ED18 |
  STA $0BF8,x                               ; $17ED1B |
  STA $0C38,x                               ; $17ED1E |
  INX                                       ; $17ED21 |
  INX                                       ; $17ED22 |
  INY                                       ; $17ED23 |
  CPY #$0003                                ; $17ED24 |
  BCC CODE_17ED18                           ; $17ED27 |
  LDA #$0100                                ; $17ED29 |
  STA $1107                                 ; $17ED2C |
  JSR CODE_17EC6D                           ; $17ED2F |
  SEP #$30                                  ; $17ED32 |
  INC $1118                                 ; $17ED34 |
  LDX #$5F                                  ; $17ED37 |
  JSR CODE_17EBD2                           ; $17ED39 |
  RTS                                       ; $17ED3C |

  LDX #$5F                                  ; $17ED3D |
  JSR CODE_17EBF3                           ; $17ED3F |
  LDA $1107                                 ; $17ED42 |
  BPL CODE_17ED51                           ; $17ED45 |
  REP #$20                                  ; $17ED47 |
  LDA #$4AD4                                ; $17ED49 |
  STA $1109                                 ; $17ED4C |
  SEP #$20                                  ; $17ED4F |

CODE_17ED51:
  RTS                                       ; $17ED51 |

  JSR CODE_17CC69                           ; $17ED52 |
  JSR CODE_17CC93                           ; $17ED55 |
  DEC $1118                                 ; $17ED58 |
  JSR CODE_17D005                           ; $17ED5B |
  RTS                                       ; $17ED5E |

  LDA $1106                                 ; $17ED5F |
  AND #$01                                  ; $17ED62 |
  EOR #$01                                  ; $17ED64 |
  STA $1106                                 ; $17ED66 |
  REP #$20                                  ; $17ED69 |
  JSR CODE_17EB5F                           ; $17ED6B |
  LDA $1106                                 ; $17ED6E |
  AND #$01                                  ; $17ED71 |
  EOR #$01                                  ; $17ED73 |
  STA $1106                                 ; $17ED75 |
  JSR CODE_17D005                           ; $17ED78 |
  LDA #$13                                  ; $17ED7B |
  STA !r_reg_tmw_mirror                     ; $17ED7D |
  RTS                                       ; $17ED80 |

  JSR CODE_17EC26                           ; $17ED81 |
  LDA $1107                                 ; $17ED84 |
  BNE CODE_17ED93                           ; $17ED87 |
  REP #$20                                  ; $17ED89 |
  LDA $E26D                                 ; $17ED8B |
  STA $1109                                 ; $17ED8E |
  SEP #$20                                  ; $17ED91 |

CODE_17ED93:
  RTS                                       ; $17ED93 |

  JSR CODE_17ECA1                           ; $17ED94 |
  LDA #$00                                  ; $17ED97 |
  STA !r_reg_tmw_mirror                     ; $17ED99 |
  STZ $1118                                 ; $17ED9C |
  STZ $112D                                 ; $17ED9F |
  RTS                                       ; $17EDA2 |

  LDA $38                                   ; $17EDA3 |
  AND #$04                                  ; $17EDA5 |
  BEQ CODE_17EDBA                           ; $17EDA7 |
  LDA #$30                                  ; $17EDA9 |
  STA $1118                                 ; $17EDAB |
  REP #$20                                  ; $17EDAE |
  LDA #$4AD4                                ; $17EDB0 |
  STA $1109                                 ; $17EDB3 |
  SEP #$20                                  ; $17EDB6 |
  BRA CODE_17EE21                           ; $17EDB8 |

CODE_17EDBA:
  LDA $38                                   ; $17EDBA |
  AND #$03                                  ; $17EDBC |
  BEQ CODE_17EDDF                           ; $17EDBE |
  TAX                                       ; $17EDC0 |
  LDA $112D                                 ; $17EDC1 |
  CLC                                       ; $17EDC4 |
  ADC $E182,x                               ; $17EDC5 |
  BMI CODE_17EDDF                           ; $17EDC8 |
  CMP #$02                                  ; $17EDCA |
  BCS CODE_17EDDF                           ; $17EDCC |
  STA $112D                                 ; $17EDCE |
  ASL A                                     ; $17EDD1 |
  TAX                                       ; $17EDD2 |
  REP #$20                                  ; $17EDD3 |
  LDA $ECBE,x                               ; $17EDD5 |
  STA $1109                                 ; $17EDD8 |
  SEP #$20                                  ; $17EDDB |
  BRA CODE_17EE21                           ; $17EDDD |

CODE_17EDDF:
  LDA $37                                   ; $17EDDF |
  ORA $38                                   ; $17EDE1 |
  AND #$C0                                  ; $17EDE3 |
  BEQ CODE_17EE27                           ; $17EDE5 |
  LDA $112D                                 ; $17EDE7 |
  ASL A                                     ; $17EDEA |
  CMP !s_control_scheme                     ; $17EDEB |
  BEQ CODE_17EE27                           ; $17EDEE |
  STA !s_control_scheme                     ; $17EDF0 |
  JSR CODE_17E85D                           ; $17EDF3 |
  JSR CODE_17EB1F                           ; $17EDF6 |
  JSR CODE_17EB42                           ; $17EDF9 |
  LDA $1106                                 ; $17EDFC |
  EOR #$01                                  ; $17EDFF |
  AND #$01                                  ; $17EE01 |
  STA $1106                                 ; $17EE03 |
  STZ $1107                                 ; $17EE06 |
  LDA #$04                                  ; $17EE09 |\ play sound #$0004
  JSL push_sound_queue                      ; $17EE0B |/
  REP #$20                                  ; $17EE0F |
  LDA #$FF00                                ; $17EE11 |
  STA $7E55C0                               ; $17EE14 |
  SEP #$20                                  ; $17EE18 |
  LDA #$01                                  ; $17EE1A |
  STA !r_reg_tmw_mirror                     ; $17EE1C |
  BRA CODE_17EE27                           ; $17EE1F |

CODE_17EE21:
  LDA #$5C                                  ; $17EE21 |\ play sound #$5C
  JSL push_sound_queue                      ; $17EE23 |/

CODE_17EE27:
  RTS                                       ; $17EE27 |

  JSR CODE_17EC26                           ; $17EE28 |
  LDA $1107                                 ; $17EE2B |
  BNE CODE_17EE41                           ; $17EE2E |
  LDA $112D                                 ; $17EE30 |
  ASL A                                     ; $17EE33 |
  TAX                                       ; $17EE34 |
  REP #$20                                  ; $17EE35 |
  LDA $ECBE,x                               ; $17EE37 |
  STA $1109                                 ; $17EE3A |
  SEP #$20                                  ; $17EE3D |
  BRA CODE_17EE46                           ; $17EE3F |

CODE_17EE41:
  LDA #$20                                  ; $17EE41 |
  STA $1122                                 ; $17EE43 |

CODE_17EE46:
  RTS                                       ; $17EE46 |

  JSR CODE_17ECA1                           ; $17EE47 |
  LDA #$38                                  ; $17EE4A |
  STA $1118                                 ; $17EE4C |
  RTS                                       ; $17EE4F |

  dw $2D86, $2D8F, $2DDB, $2DDC             ; $17EE50 |
  dw $2DDD, $2DDE, $2DCB, $2DCC             ; $17EE58 |
  dw $2DCA, $2D8F, $6D86                    ; $17EE60 |

  dw $2DBF, $2DBF, $AD99, $2D8F             ; $17EE66 |
  dw $2D8E, $2D8E, $2D8E, $2D8E             ; $17EE6E |
  dw $2D8E, $2D8E, $2D8E, $2D8E             ; $17EE76 |
  dw $2D8E, $2D8E, $2D8E, $2D8F             ; $17EE7E |
  dw $2D8F, $2D8F, $2D8F, $2D8F             ; $17EE86 |
  dw $2D8F, $2D8F, $2D8F, $2D8F             ; $17EE8E |
  dw $0D8F, $2D8F, $2D8F, $2D8F             ; $17EE96 |
  dw $2D8F, $ED99, $2DBF, $2DBF             ; $17EE9E |

  dw $2DC0, $2DC1, $2DC2, $2DC3             ; $17EEA6 |
  dw $2DC4                                  ; $17EEAE |

  dw $2DC0, $2DC1, $2DC2, $2DC8             ; $17EEB0 |
  dw $2DC9                                  ; $17EEB8 |

  dw $2DC5, $2DC6, $2DC7, $2DD5             ; $17EEBA |
  dw $2D8C                                  ; $17EEC2 |

  dw $2DD0, $2DD1, $2DD2, $2DD3             ; $17EEC4 |
  dw $2DD4                                  ; $17EECC |

  dw $2D8E, $2DD6, $2DD7, $2DD8             ; $17EECE |
  dw $2DD9                                  ; $17EED6 |

  dw $2DC0, $2DC1, $2DC2, $2DC3             ; $17EED8 |
  dw $2DC4                                  ; $17EEE0 |

  dw $2DD0, $2DD1, $2DD2, $2DD3             ; $17EEE2 |
  dw $2DD4                                  ; $17EEEA |

  dw $2DFC, $2DFD, $2DFD, $2DFD             ; $17EEEC |
  dw $2DFD, $2DDF, $2DCD, $2DCE             ; $17EEF4 |
  dw $2DCF, $6DDF, $2DFD, $2DFD             ; $17EEFC |
  dw $2DFD, $2DFD, $6DFC                    ; $17EF04 |

  dw $399F, $398F, $398F, $398F             ; $17EF0A |
  dw $799F                                  ; $17EF12 |

  dw $3998, $398E, $398E, $398E             ; $17EF14 |
  dw $7998                                  ; $17EF1C |

  dw $B99F, $B98F, $B98F, $B98F             ; $17EF1E |
  dw $F99F                                  ; $17EF26 |

  dw $0AD0, $0ADC, $0AE8, $0AF4             ; $17EF28 |
  dw $0C10, $0C1C, $0C28, $0C36             ; $17EF30 |

  dw $0C00, $0C00, $0C00, $0C00             ; $17EF38 |
  dw $1000, $0C00, $0C00, $0C00             ; $17EF40 |

; gsu table
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $17EF48 |
  db $15, $15, $15, $15                     ; $17EF50 |

  REP #$30                                  ; $17EF54 |
  STZ $118E                                 ; $17EF56 |
  LDX #$0000                                ; $17EF59 |
  LDA $1106                                 ; $17EF5C |
  AND #$0001                                ; $17EF5F |
  BEQ CODE_17EF67                           ; $17EF62 |
  LDX #$0380                                ; $17EF64 |

CODE_17EF67:
  STX $20                                   ; $17EF67 |
  LDY #$0020                                ; $17EF69 |
  LDA #$01BF                                ; $17EF6C |

CODE_17EF6F:
  STA $0A46,x                               ; $17EF6F |
  INX                                       ; $17EF72 |
  INX                                       ; $17EF73 |
  DEY                                       ; $17EF74 |
  BNE CODE_17EF6F                           ; $17EF75 |
  LDX $20                                   ; $17EF77 |
  LDY #$0000                                ; $17EF79 |

CODE_17EF7C:
  LDA $EE50,y                               ; $17EF7C |
  STA $0A4E,x                               ; $17EF7F |
  INX                                       ; $17EF82 |
  INX                                       ; $17EF83 |
  INY                                       ; $17EF84 |
  INY                                       ; $17EF85 |
  CPY #$0016                                ; $17EF86 |
  BCC CODE_17EF7C                           ; $17EF89 |
  LDY #$0000                                ; $17EF8B |
  LDX $20                                   ; $17EF8E |

CODE_17EF90:
  LDA $EE66,y                               ; $17EF90 |
  STA $0A86,x                               ; $17EF93 |
  LDA $DDA3,y                               ; $17EF96 |
  ORA #$0C00                                ; $17EF99 |
  STA $0AC6,x                               ; $17EF9C |
  STA $0B06,x                               ; $17EF9F |
  STA $0B46,x                               ; $17EFA2 |
  STA $0B86,x                               ; $17EFA5 |
  STA $0BC6,x                               ; $17EFA8 |
  STA $0C06,x                               ; $17EFAB |
  STA $0C46,x                               ; $17EFAE |
  STA $0C86,x                               ; $17EFB1 |
  STA $0CC6,x                               ; $17EFB4 |
  LDA $DDE3,y                               ; $17EFB7 |
  ORA #$0C00                                ; $17EFBA |
  STA $0D06,x                               ; $17EFBD |
  INX                                       ; $17EFC0 |
  INX                                       ; $17EFC1 |
  INY                                       ; $17EFC2 |
  INY                                       ; $17EFC3 |
  CPY #$0040                                ; $17EFC4 |
  BCC CODE_17EF90                           ; $17EFC7 |
  LDY #$0000                                ; $17EFC9 |
  LDX $20                                   ; $17EFCC |

CODE_17EFCE:
  LDA $EEA6,y                               ; $17EFCE |
  STA $0B8E,x                               ; $17EFD1 |
  LDA $EEB0,y                               ; $17EFD4 |
  STA $0B9A,x                               ; $17EFD7 |
  LDA $EEBA,y                               ; $17EFDA |
  STA $0BA6,x                               ; $17EFDD |
  LDA $EEC4,y                               ; $17EFE0 |
  STA $0BB2,x                               ; $17EFE3 |
  LDA $EECE,y                               ; $17EFE6 |
  STA $0CCE,x                               ; $17EFE9 |
  LDA $EED8,y                               ; $17EFEC |
  STA $0CDA,x                               ; $17EFEF |
  LDA $EEE2,y                               ; $17EFF2 |
  STA $0CE6,x                               ; $17EFF5 |
  INX                                       ; $17EFF8 |
  INX                                       ; $17EFF9 |
  INY                                       ; $17EFFA |
  INY                                       ; $17EFFB |
  CPY #$000A                                ; $17EFFC |
  BCC CODE_17EFCE                           ; $17EFFF |
  LDY #$0000                                ; $17F001 |
  LDX $20                                   ; $17F004 |

CODE_17F006:
  LDA $EEEC,y                               ; $17F006 |
  STA $0BD6,x                               ; $17F009 |
  INX                                       ; $17F00C |
  INX                                       ; $17F00D |
  INY                                       ; $17F00E |
  INY                                       ; $17F00F |
  CPY #$001E                                ; $17F010 |
  BCC CODE_17F006                           ; $17F013 |
  LDX $20                                   ; $17F015 |
  LDA #$2DFE                                ; $17F017 |
  STA $0C16,x                               ; $17F01A |
  STA $0C56,x                               ; $17F01D |
  STA $0C96,x                               ; $17F020 |
  ORA #$4000                                ; $17F023 |
  STA $0C32,x                               ; $17F026 |
  STA $0C72,x                               ; $17F029 |
  STA $0CB2,x                               ; $17F02C |
  LDA #$2DDA                                ; $17F02F |
  STA $0CD8,x                               ; $17F032 |
  ORA #$4000                                ; $17F035 |
  STA $0CF0,x                               ; $17F038 |
  LDA #$EDFC                                ; $17F03B |
  STA $0CF2,x                               ; $17F03E |
  LDY #$0000                                ; $17F041 |
  LDX $20                                   ; $17F044 |

CODE_17F046:
  LDA $EF0A,y                               ; $17F046 |
  STA $0BF4,x                               ; $17F049 |
  LDA $EF14,y                               ; $17F04C |
  STA $0C34,x                               ; $17F04F |
  STA $0C74,x                               ; $17F052 |
  STA $0CB4,x                               ; $17F055 |
  LDA $EF1E,y                               ; $17F058 |
  STA $0CF4,x                               ; $17F05B |
  INX                                       ; $17F05E |
  INX                                       ; $17F05F |
  INY                                       ; $17F060 |
  INY                                       ; $17F061 |
  CPY #$000A                                ; $17F062 |
  BCC CODE_17F046                           ; $17F065 |
  SEP #$10                                  ; $17F067 |
  STZ $10                                   ; $17F069 |
  LDX $1106                                 ; $17F06B |
  BEQ CODE_17F075                           ; $17F06E |
  LDA #$0080                                ; $17F070 |
  STA $10                                   ; $17F073 |

CODE_17F075:
  LDX #$00                                  ; $17F075 |

CODE_17F077:
  LDA $DC27,x                               ; $17F077 |
  ORA $10                                   ; $17F07A |
  ORA $EF38,x                               ; $17F07C |
  STA $00                                   ; $17F07F |
  LDA $EF28,x                               ; $17F081 |
  CLC                                       ; $17F084 |
  ADC $20                                   ; $17F085 |
  STA $0A                                   ; $17F087 |
  CLC                                       ; $17F089 |
  ADC #$0040                                ; $17F08A |
  STA $0C                                   ; $17F08D |
  CLC                                       ; $17F08F |
  ADC #$0040                                ; $17F090 |
  STA $0E                                   ; $17F093 |
  JSR CODE_17DC09                           ; $17F095 |
  INX                                       ; $17F098 |
  INX                                       ; $17F099 |
  CPX #$10                                  ; $17F09A |
  BCC CODE_17F077                           ; $17F09C |
  LDA #$0010                                ; $17F09E |
  STA !gsu_r9                               ; $17F0A1 |
  LDA #$0017                                ; $17F0A4 |
  STA $6000                                 ; $17F0A7 |
  LDA #$EF48                                ; $17F0AA |
  STA $6002                                 ; $17F0AD |
  LDX #$08                                  ; $17F0B0 |
  LDA #$D995                                ; $17F0B2 |
  JSL r_gsu_init_1                          ; $17F0B5 | GSU init
  SEP #$20                                  ; $17F0B9 |
  LDA $1106                                 ; $17F0BB |
  EOR #$01                                  ; $17F0BE |
  AND #$01                                  ; $17F0C0 |
  STA $1106                                 ; $17F0C2 |
  JSR CODE_17CC6F                           ; $17F0C5 |
  INC $114E                                 ; $17F0C8 |
  RTS                                       ; $17F0CB |

  JSR CODE_17CC93                           ; $17F0CC |
  BRA CODE_17F0D9                           ; $17F0CF |
  JSR CODE_17CCBA                           ; $17F0D1 |
  LDA #$11                                  ; $17F0D4 |
  STA !r_reg_tmw_mirror                     ; $17F0D6 |

CODE_17F0D9:
  STZ $1118                                 ; $17F0D9 |
  INC $114E                                 ; $17F0DC |
  BRA CODE_17F10D                           ; $17F0DF |
  JSR CODE_17CD12                           ; $17F0E1 |
  LDA $1118                                 ; $17F0E4 |
  BEQ CODE_17F10D                           ; $17F0E7 |
  INC $114E                                 ; $17F0E9 |
  REP #$20                                  ; $17F0EC |
  LDA $114E                                 ; $17F0EE |
  CMP #$000B                                ; $17F0F1 |
  BCC CODE_17F100                           ; $17F0F4 |
  LDA $1112                                 ; $17F0F6 |
  ASL A                                     ; $17F0F9 |
  TAX                                       ; $17F0FA |
  LDA $E257,x                               ; $17F0FB |
  BRA CODE_17F106                           ; $17F0FE |

CODE_17F100:
  LDA #$5ACC                                ; $17F100 |
  STA $110C                                 ; $17F103 |

CODE_17F106:
  STA $1109                                 ; $17F106 |
  SEP #$20                                  ; $17F109 |
  BRA CODE_17F117                           ; $17F10B |

CODE_17F10D:
  LDA $114E                                 ; $17F10D |
  CMP #$0B                                  ; $17F110 |
  BCC CODE_17F117                           ; $17F112 |
  JSR CODE_17D005                           ; $17F114 |

CODE_17F117:
  RTS                                       ; $17F117 |

  JSR CODE_17CD63                           ; $17F118 |
  STZ $1118                                 ; $17F11B |
  INC $114E                                 ; $17F11E |
  REP #$20                                  ; $17F121 |
  LDA #$0007                                ; $17F123 |
  STA $1150                                 ; $17F126 |
  SEP #$20                                  ; $17F129 |
  RTS                                       ; $17F12B |

  db $34, $32, $64, $32, $94, $32, $C4, $32 ; $17F12C |
  db $34, $5A, $64, $5A, $94, $5A, $CC      ; $17F134 |

  db $5A, $08                               ; $17F13B |

  db $0E, $00                               ; $17F13D |

  db $06, $04, $FC                          ; $17F13F |

  LDA $110C                                 ; $17F142 |
  ORA $110D                                 ; $17F145 |
  BNE CODE_17F1C4                           ; $17F148 |
  LDA $38                                   ; $17F14A |
  AND #$03                                  ; $17F14C |
  BEQ CODE_17F188                           ; $17F14E |
  TAX                                       ; $17F150 |
  LDA $1150                                 ; $17F151 |
  CLC                                       ; $17F154 |
  ADC $E182,x                               ; $17F155 |
  BPL CODE_17F15C                           ; $17F158 |
  LDA #$07                                  ; $17F15A |

CODE_17F15C:
  CMP #$08                                  ; $17F15C |
  BCC CODE_17F162                           ; $17F15E |
  LDA #$00                                  ; $17F160 |

CODE_17F162:
  STA $1150                                 ; $17F162 |
  ASL A                                     ; $17F165 |
  TAY                                       ; $17F166 |
  REP #$20                                  ; $17F167 |
  LDA $F12C,y                               ; $17F169 |
  STA $110C                                 ; $17F16C |
  SEP #$20                                  ; $17F16F |
  TYA                                       ; $17F171 |
  CMP $F13B,x                               ; $17F172 |
  BEQ CODE_17F17C                           ; $17F175 |
  CMP $F13D,x                               ; $17F177 |
  BNE CODE_17F186                           ; $17F17A |

CODE_17F17C:
  REP #$20                                  ; $17F17C |
  LDA $110C                                 ; $17F17E |
  STA $1109                                 ; $17F181 |
  SEP #$20                                  ; $17F184 |

CODE_17F186:
  BRA CODE_17F1AD                           ; $17F186 |

CODE_17F188:
  LDA $38                                   ; $17F188 |
  AND #$0C                                  ; $17F18A |
  BEQ CODE_17F1B5                           ; $17F18C |
  LSR A                                     ; $17F18E |
  LSR A                                     ; $17F18F |
  TAX                                       ; $17F190 |
  LDA $1150                                 ; $17F191 |
  CLC                                       ; $17F194 |
  ADC $F13F,x                               ; $17F195 |
  BMI CODE_17F1B5                           ; $17F198 |
  CMP #$08                                  ; $17F19A |
  BCS CODE_17F1B5                           ; $17F19C |
  STA $1150                                 ; $17F19E |
  ASL A                                     ; $17F1A1 |
  TAX                                       ; $17F1A2 |
  REP #$20                                  ; $17F1A3 |
  LDA $F12C,x                               ; $17F1A5 |
  STA $110C                                 ; $17F1A8 |
  SEP #$20                                  ; $17F1AB |

CODE_17F1AD:
  LDA #$5C                                  ; $17F1AD |\ play sound #$005C
  JSL push_sound_queue                      ; $17F1AF |/
  BRA CODE_17F1C4                           ; $17F1B3 |

CODE_17F1B5:
  LDA $37                                   ; $17F1B5 |
  AND #$C0                                  ; $17F1B7 |
  ORA $38                                   ; $17F1B9 |
  AND #$D0                                  ; $17F1BB |
  BEQ CODE_17F1C4                           ; $17F1BD |
  INC $114E                                 ; $17F1BF |
  BRA CODE_17F1C4                           ; $17F1C2 |

CODE_17F1C4:
  RTS                                       ; $17F1C4 |

  LDA $1150                                 ; $17F1C5 |
  CMP #$07                                  ; $17F1C8 |
  BNE CODE_17F1D3                           ; $17F1CA |
  INC $114E                                 ; $17F1CC |
  LDA #$08                                  ; $17F1CF |
  BRA CODE_17F1DA                           ; $17F1D1 |

CODE_17F1D3:
  LDA #$10                                  ; $17F1D3 |
  STA $114E                                 ; $17F1D5 |
  LDA #$5D                                  ; $17F1D8 |\ play sound #$005D

CODE_17F1DA:
  JSL push_sound_queue                      ; $17F1DA |/
  RTS                                       ; $17F1DE |

  REP #$20                                  ; $17F1DF |
  LDA #$0C36                                ; $17F1E1 |
  LDX $1106                                 ; $17F1E4 |
  BNE CODE_17F1ED                           ; $17F1E7 |
  CLC                                       ; $17F1E9 |
  ADC #$0380                                ; $17F1EA |

CODE_17F1ED:
  STA $00                                   ; $17F1ED |
  CLC                                       ; $17F1EF |
  ADC #$0040                                ; $17F1F0 |
  STA $02                                   ; $17F1F3 |
  CLC                                       ; $17F1F5 |
  ADC #$0040                                ; $17F1F6 |
  STA $04                                   ; $17F1F9 |
  LDY #$00                                  ; $17F1FB |
  LDA #$398E                                ; $17F1FD |

CODE_17F200:
  STA ($00),y                               ; $17F200 |
  STA ($02),y                               ; $17F202 |
  STA ($04),y                               ; $17F204 |
  INY                                       ; $17F206 |
  INY                                       ; $17F207 |
  CPY #$06                                  ; $17F208 |
  BCC CODE_17F200                           ; $17F20A |
  LDA #$1C20                                ; $17F20C |
  STA $04                                   ; $17F20F |
  JSR CODE_17D52B                           ; $17F211 |
  STZ $1107                                 ; $17F214 |
  LDA #$0067                                ; $17F217 |
  JSR CODE_17CFDA                           ; $17F21A |
  INC $114E                                 ; $17F21D |
  SEP #$20                                  ; $17F220 |
  JSR CODE_17D005                           ; $17F222 |
  RTS                                       ; $17F225 |

  LDA #$67                                  ; $17F226 |
  JSR CODE_17CFDA                           ; $17F228 |
  LDA $1107                                 ; $17F22B |
  CLC                                       ; $17F22E |
  ADC #$08                                  ; $17F22F |
  STA $1107                                 ; $17F231 |
  CMP #$40                                  ; $17F234 |
  BCC CODE_17F23B                           ; $17F236 |
  INC $114E                                 ; $17F238 |

CODE_17F23B:
  JSR CODE_17D005                           ; $17F23B |
  RTS                                       ; $17F23E |

  LDA $1107                                 ; $17F23F |
  SEC                                       ; $17F242 |
  SBC #$08                                  ; $17F243 |
  STA $1107                                 ; $17F245 |
  BPL CODE_17F250                           ; $17F248 |
  STZ $1107                                 ; $17F24A |
  INC $114E                                 ; $17F24D |

CODE_17F250:
  LDA #$67                                  ; $17F250 |
  JSR CODE_17CFDA                           ; $17F252 |
  JSR CODE_17D005                           ; $17F255 |
  RTS                                       ; $17F258 |

  JSR CODE_17CC69                           ; $17F259 |
  STZ $1118                                 ; $17F25C |
  INC $114E                                 ; $17F25F |
  JSR CODE_17D005                           ; $17F262 |
  RTS                                       ; $17F265 |

  JSR CODE_17CD63                           ; $17F266 |
  STZ $1118                                 ; $17F269 |
  STZ $114E                                 ; $17F26C |
  LDA #$10                                  ; $17F26F |
  STA !r_reg_cgwsel_mirror                  ; $17F271 |
  STZ !r_reg_tmw_mirror                     ; $17F274 |
  REP #$20                                  ; $17F277 |
  STZ $110C                                 ; $17F279 |
  LDA $1112                                 ; $17F27C |
  ASL A                                     ; $17F27F |
  TAX                                       ; $17F280 |
  LDA $E257,x                               ; $17F281 |
  STA $1109                                 ; $17F284 |
  SEP #$20                                  ; $17F287 |
  RTS                                       ; $17F289 |

  INC $114E                                 ; $17F28A |
  LDA $1150                                 ; $17F28D |
  ASL A                                     ; $17F290 |
  TAX                                       ; $17F291 |
  REP #$20                                  ; $17F292 |
  LDA $EF28,x                               ; $17F294 |
  LDX $1106                                 ; $17F297 |
  BNE CODE_17F2A0                           ; $17F29A |
  CLC                                       ; $17F29C |
  ADC #$0380                                ; $17F29D |

CODE_17F2A0:
  STA $00                                   ; $17F2A0 |
  CLC                                       ; $17F2A2 |
  ADC #$0040                                ; $17F2A3 |
  STA $02                                   ; $17F2A6 |
  CLC                                       ; $17F2A8 |
  ADC #$0040                                ; $17F2A9 |
  STA $04                                   ; $17F2AC |
  LDY #$00                                  ; $17F2AE |

CODE_17F2B0:
  LDA $C9C6,y                               ; $17F2B0 |
  ORA #$0C00                                ; $17F2B3 |
  STA ($00),y                               ; $17F2B6 |
  LDA $C9CC,y                               ; $17F2B8 |
  ORA #$0C00                                ; $17F2BB |
  STA ($02),y                               ; $17F2BE |
  LDA $C9D2,y                               ; $17F2C0 |
  ORA #$0C00                                ; $17F2C3 |
  STA ($04),y                               ; $17F2C6 |
  INY                                       ; $17F2C8 |
  INY                                       ; $17F2C9 |
  CPY #$06                                  ; $17F2CA |
  BCC CODE_17F2B0                           ; $17F2CC |
  LDA #$1C20                                ; $17F2CE |
  STA $04                                   ; $17F2D1 |
  JSR CODE_17D52B                           ; $17F2D3 |
  STZ $110E                                 ; $17F2D6 |
  LDA #$0100                                ; $17F2D9 |
  STA $1110                                 ; $17F2DC |
  REP #$20                                  ; $17F2DF |
  LDX $1150                                 ; $17F2E1 |
  LDA $EF48,x                               ; $17F2E4 |
  AND #$00FF                                ; $17F2E7 |
  STA !gsu_r1                               ; $17F2EA |
  TXA                                       ; $17F2ED |
  AND #$00FF                                ; $17F2EE |
  CLC                                       ; $17F2F1 |
  ADC #$0060                                ; $17F2F2 |
  STA !gsu_r3                               ; $17F2F5 |
  LDA $110E                                 ; $17F2F8 |
  AND #$00FF                                ; $17F2FB |
  STA !gsu_r5                               ; $17F2FE |
  LDA $1110                                 ; $17F301 |
  STA !gsu_r6                               ; $17F304 |
  LDX #$08                                  ; $17F307 |
  LDA #$DC05                                ; $17F309 |
  JSL r_gsu_init_1                          ; $17F30C | GSU init
  JSR CODE_17E683                           ; $17F310 |
  REP #$20                                  ; $17F313 |
  LDA $110E                                 ; $17F315 |
  CLC                                       ; $17F318 |
  ADC #$0008                                ; $17F319 |
  STA $110E                                 ; $17F31C |
  LDA $1110                                 ; $17F31F |
  DEC A                                     ; $17F322 |
  DEC A                                     ; $17F323 |
  STA $1110                                 ; $17F324 |
  CMP #$0014                                ; $17F327 |
  BCS CODE_17F346                           ; $17F32A |
  SEP #$20                                  ; $17F32C |
  LDA #$F1                                  ; $17F32E |
  STA $4D                                   ; $17F330 |
  LDA #$43                                  ; $17F332 |\ play sound #$0043
  JSL push_sound_queue                      ; $17F334 |/
  REP #$20                                  ; $17F338 |
  STZ $1110                                 ; $17F33A |
  INC $114E                                 ; $17F33D |
  LDA #$0002                                ; $17F340 |
  STA $1113                                 ; $17F343 |

CODE_17F346:
  REP #$10                                  ; $17F346 |
  LDX !s_oam_next_free_slot_ptr             ; $17F348 |
  LDA $1109                                 ; $17F34B |
  AND #$00FF                                ; $17F34E |
  SEC                                       ; $17F351 |
  SBC #$0010                                ; $17F352 |
  STA $6000,x                               ; $17F355 |
  STA $6010,x                               ; $17F358 |
  CLC                                       ; $17F35B |
  ADC #$0010                                ; $17F35C |
  STA $6008,x                               ; $17F35F |
  STA $6018,x                               ; $17F362 |
  LDA $110A                                 ; $17F365 |
  AND #$00FF                                ; $17F368 |
  SEC                                       ; $17F36B |
  SBC #$0016                                ; $17F36C |
  STA $6002,x                               ; $17F36F |
  STA $600A,x                               ; $17F372 |
  CLC                                       ; $17F375 |
  ADC #$0010                                ; $17F376 |
  STA $6012,x                               ; $17F379 |
  STA $601A,x                               ; $17F37C |
  LDA $1150                                 ; $17F37F |
  ASL A                                     ; $17F382 |
  TAY                                       ; $17F383 |
  LDA $EF38,y                               ; $17F384 |
  LSR A                                     ; $17F387 |
  SEC                                       ; $17F388 |
  SBC #$0600                                ; $17F389 |
  ORA #$31E0                                ; $17F38C |
  STA $6004,x                               ; $17F38F |
  INC A                                     ; $17F392 |
  INC A                                     ; $17F393 |
  STA $600C,x                               ; $17F394 |
  INC A                                     ; $17F397 |
  INC A                                     ; $17F398 |
  STA $6014,x                               ; $17F399 |
  INC A                                     ; $17F39C |
  INC A                                     ; $17F39D |
  STA $601C,x                               ; $17F39E |
  LDA #$4002                                ; $17F3A1 |
  STA $6006,x                               ; $17F3A4 |
  STA $600E,x                               ; $17F3A7 |
  STA $6016,x                               ; $17F3AA |
  STA $601E,x                               ; $17F3AD |
  TXA                                       ; $17F3B0 |
  CLC                                       ; $17F3B1 |
  ADC #$0020                                ; $17F3B2 |
  STA !s_oam_next_free_slot_ptr             ; $17F3B5 |
  SEP #$30                                  ; $17F3B8 |
  RTS                                       ; $17F3BA |

  JSR CODE_17C9F6                           ; $17F3BB |
  LDA $1114                                 ; $17F3BE |
  CMP #$0B                                  ; $17F3C1 |
  BCC CODE_17F3C8                           ; $17F3C3 |
  INC $114E                                 ; $17F3C5 |

CODE_17F3C8:
  RTS                                       ; $17F3C8 |

  db $00, $04, $0C, $12, $08, $16, $14      ; $17F3C9 |

  STZ $114E                                 ; $17F3D0 |
  LDX $1150                                 ; $17F3D3 |
  LDA $F3C9,x                               ; $17F3D6 |
  STA $03A7                                 ; $17F3D9 |
  LDA #$2D                                  ; $17F3DC |
  STA !r_game_mode                          ; $17F3DE |
  LDA #$FF                                  ; $17F3E1 |
  STA $0374                                 ; $17F3E3 |
  RTS                                       ; $17F3E6 |

; pointers to level entrances
; Maps World Map tiles to an index into map_level_entrances
; This includes Bonus, score and controller tiles making each world 12 tiles
level_entrance_indexes:
  dw $0000                                  ; $17F3E7 |
  dw $0004                                  ; $17F3E9 |
  dw $0008                                  ; $17F3EB |
  dw $000C                                  ; $17F3ED |
  dw $0010                                  ; $17F3EF |
  dw $0014                                  ; $17F3F1 |
  dw $0018                                  ; $17F3F3 |
  dw $001C                                  ; $17F3F5 |
  dw $0020                                  ; $17F3F7 |
  dw $0000                                  ; $17F3F9 |
  dw $00D8                                  ; $17F3FB |
  dw $00DC                                  ; $17F3FD |
  dw $0024                                  ; $17F3FF |
  dw $0028                                  ; $17F401 |
  dw $002C                                  ; $17F403 |
  dw $0030                                  ; $17F405 |
  dw $0034                                  ; $17F407 |
  dw $0038                                  ; $17F409 |
  dw $003C                                  ; $17F40B |
  dw $0040                                  ; $17F40D |
  dw $0044                                  ; $17F40F |
  dw $0000                                  ; $17F411 |
  dw $0000                                  ; $17F413 |
  dw $0000                                  ; $17F415 |
  dw $0048                                  ; $17F417 |
  dw $004C                                  ; $17F419 |
  dw $0050                                  ; $17F41B |
  dw $0054                                  ; $17F41D |
  dw $0058                                  ; $17F41F |
  dw $005C                                  ; $17F421 |
  dw $0060                                  ; $17F423 |
  dw $0064                                  ; $17F425 |
  dw $0068                                  ; $17F427 |
  dw $0000                                  ; $17F429 |
  dw $0000                                  ; $17F42B |
  dw $0000                                  ; $17F42D |
  dw $006C                                  ; $17F42F |
  dw $0070                                  ; $17F431 |
  dw $0074                                  ; $17F433 |
  dw $0078                                  ; $17F435 |
  dw $007C                                  ; $17F437 |
  dw $0080                                  ; $17F439 |
  dw $0084                                  ; $17F43B |
  dw $0088                                  ; $17F43D |
  dw $008C                                  ; $17F43F |
  dw $0000                                  ; $17F441 |
  dw $0000                                  ; $17F443 |
  dw $0000                                  ; $17F445 |
  dw $0090                                  ; $17F447 |
  dw $0094                                  ; $17F449 |
  dw $0098                                  ; $17F44B |
  dw $009C                                  ; $17F44D |
  dw $00A0                                  ; $17F44F |
  dw $00A4                                  ; $17F451 |
  dw $00A8                                  ; $17F453 |
  dw $00AC                                  ; $17F455 |
  dw $00B0                                  ; $17F457 |
  dw $0000                                  ; $17F459 |
  dw $0000                                  ; $17F45B |
  dw $0000                                  ; $17F45D |
  dw $00B4                                  ; $17F45F |
  dw $00B8                                  ; $17F461 |
  dw $00BC                                  ; $17F463 |
  dw $00C0                                  ; $17F465 |
  dw $00C4                                  ; $17F467 |
  dw $00C8                                  ; $17F469 |
  dw $00CC                                  ; $17F46B |
  dw $00D0                                  ; $17F46D |
  dw $00D4                                  ; $17F46F |

; level entrances (4 bytes per level)
; byte 1 is level number
; byte 2 is X position
; byte 3 is Y position
; byte 4 is the map icon to unlock after completing the level
map_level_entrances:
  db $00, $07, $77, $01                     ; $17F471 |
  db $01, $07, $7A, $02                     ; $17F475 |
  db $02, $03, $7A, $03                     ; $17F479 |
  db $03, $07, $7A, $04                     ; $17F47D |
  db $04, $77, $6A, $05                     ; $17F481 |
  db $05, $07, $7A, $06                     ; $17F485 |
  db $06, $07, $7A, $07                     ; $17F489 |
  db $9B, $68, $4A, $0C                     ; $17F48D |
  db $08, $09, $7A, $09                     ; $17F491 |
  db $09, $07, $5A, $0D                     ; $17F495 |
  db $0A, $07, $7A, $0E                     ; $17F499 |
  db $0B, $07, $7A, $0F                     ; $17F49D |
  db $0C, $07, $7A, $10                     ; $17F4A1 |
  db $0D, $07, $7A, $11                     ; $17F4A5 |
  db $0E, $07, $18, $12                     ; $17F4A9 |
  db $0F, $F8, $2A, $13                     ; $17F4AD |
  db $10, $04, $2A, $18                     ; $17F4B1 |
  db $11, $0E, $7A, $14                     ; $17F4B5 |
  db $12, $07, $7A, $19                     ; $17F4B9 |
  db $13, $07, $7A, $1A                     ; $17F4BD |
  db $14, $04, $6A, $1B                     ; $17F4C1 |
  db $15, $07, $3A, $1C                     ; $17F4C5 |
  db $16, $07, $7A, $1D                     ; $17F4C9 |
  db $17, $07, $4A, $1E                     ; $17F4CD |
  db $18, $48, $7A, $1F                     ; $17F4D1 |
  db $19, $05, $7A, $24                     ; $17F4D5 |
  db $1A, $07, $7A, $20                     ; $17F4D9 |
  db $1B, $07, $7A, $25                     ; $17F4DD |
  db $1C, $08, $7A, $26                     ; $17F4E1 |
  db $1D, $07, $5A, $27                     ; $17F4E5 |
  db $1E, $07, $7A, $28                     ; $17F4E9 |
  db $1F, $06, $1A, $29                     ; $17F4ED |
  db $20, $07, $6A, $2A                     ; $17F4F1 |
  db $21, $07, $6A, $2B                     ; $17F4F5 |
  db $22, $07, $6A, $30                     ; $17F4F9 |
  db $5A, $7D, $1A, $2C                     ; $17F4FD |
  db $24, $07, $7A, $31                     ; $17F501 |
  db $25, $07, $6A, $32                     ; $17F505 |
  db $26, $07, $3A, $33                     ; $17F509 |
  db $27, $07, $7A, $34                     ; $17F50D |
  db $28, $07, $5A, $35                     ; $17F511 |
  db $29, $05, $5A, $36                     ; $17F515 |
  db $2A, $97, $6A, $37                     ; $17F519 |
  db $2B, $38, $5A, $3C                     ; $17F51D |
  db $2C, $07, $4A, $38                     ; $17F521 |
  db $2D, $07, $7A, $3D                     ; $17F525 |
  db $2E, $07, $5A, $3E                     ; $17F529 |
  db $2F, $07, $4A, $3F                     ; $17F52D |
  db $30, $07, $7A, $40                     ; $17F531 |
  db $31, $07, $39, $41                     ; $17F535 |
  db $32, $07, $4A, $42                     ; $17F539 |
  db $33, $05, $7A, $43                     ; $17F53D |
  db $34, $03, $7A, $42                     ; $17F541 |
  db $35, $07, $7A, $44                     ; $17F545 |
  db $38, $08, $7A, $00                     ; $17F549 |
  db $39, $08, $76, $00                     ; $17F54D |

; pointers to midway entrances
level_midway_entrance_indexes:
  dw $0000                                  ; $17F551 |
  dw $0004                                  ; $17F553 |
  dw $000C                                  ; $17F555 |
  dw $0014                                  ; $17F557 |
  dw $001C                                  ; $17F559 |
  dw $0020                                  ; $17F55B |
  dw $0024                                  ; $17F55D |
  dw $0028                                  ; $17F55F |
  dw $0000                                  ; $17F561 |
  dw $0000                                  ; $17F563 |
  dw $0000                                  ; $17F565 |
  dw $0000                                  ; $17F567 |
  dw $0038                                  ; $17F569 |
  dw $003C                                  ; $17F56B |
  dw $0044                                  ; $17F56D |
  dw $004C                                  ; $17F56F |
  dw $005C                                  ; $17F571 |
  dw $0064                                  ; $17F573 |
  dw $0074                                  ; $17F575 |
  dw $0084                                  ; $17F577 |
  dw $0000                                  ; $17F579 |
  dw $0000                                  ; $17F57B |
  dw $0000                                  ; $17F57D |
  dw $0000                                  ; $17F57F |
  dw $0094                                  ; $17F581 |
  dw $009C                                  ; $17F583 |
  dw $00A0                                  ; $17F585 |
  dw $00AC                                  ; $17F587 |
  dw $00B8                                  ; $17F589 |
  dw $00BC                                  ; $17F58B |
  dw $00C0                                  ; $17F58D |
  dw $00C8                                  ; $17F58F |
  dw $0000                                  ; $17F591 |
  dw $0000                                  ; $17F593 |
  dw $0000                                  ; $17F595 |
  dw $0000                                  ; $17F597 |
  dw $00D0                                  ; $17F599 |
  dw $00DC                                  ; $17F59B |
  dw $00E4                                  ; $17F59D |
  dw $00EC                                  ; $17F59F |
  dw $00FC                                  ; $17F5A1 |
  dw $0100                                  ; $17F5A3 |
  dw $0108                                  ; $17F5A5 |
  dw $0110                                  ; $17F5A7 |
  dw $0000                                  ; $17F5A9 |
  dw $0000                                  ; $17F5AB |
  dw $0000                                  ; $17F5AD |
  dw $0000                                  ; $17F5AF |
  dw $011C                                  ; $17F5B1 |
  dw $0124                                  ; $17F5B3 |
  dw $0130                                  ; $17F5B5 |
  dw $0140                                  ; $17F5B7 |
  dw $014C                                  ; $17F5B9 |
  dw $0158                                  ; $17F5BB |
  dw $0160                                  ; $17F5BD |
  dw $0168                                  ; $17F5BF |
  dw $0178                                  ; $17F5C1 |
  dw $0000                                  ; $17F5C3 |
  dw $0000                                  ; $17F5C5 |
  dw $0000                                  ; $17F5C7 |
  dw $0188                                  ; $17F5C9 |
  dw $0194                                  ; $17F5CB |
  dw $01A0                                  ; $17F5CD |
  dw $01A8                                  ; $17F5CF |
  dw $01B8                                  ; $17F5D1 |
  dw $01C4                                  ; $17F5D3 |
  dw $01C8                                  ; $17F5D5 |
  dw $01D0                                  ; $17F5D7 |
  dw $01E0                                  ; $17F5D9 |

; midway entrances (4 bytes per entrance)
; byte 1 is level number
; byte 2 is X position
; byte 3 is Y position
; byte 4 is the entrance type
map_level_midway_entrances:
  db $00, $78, $76, $00                     ; $17F5DB |
  db $01, $82, $7B, $00                     ; $17F5DF |
  db $3B, $09, $49, $00                     ; $17F5E3 |
  db $00, $00, $00, $00                     ; $17F5E7 |
  db $3C, $75, $68, $00                     ; $17F5EB |
  db $03, $F7, $78, $00                     ; $17F5EF |
  db $6E, $EC, $68, $00                     ; $17F5F3 |
  db $04, $0E, $5B, $00                     ; $17F5F7 |
  db $05, $61, $70, $00                     ; $17F5FB |
  db $06, $70, $75, $00                     ; $17F5FF |
  db $07, $09, $37, $00                     ; $17F603 |
  db $00, $00, $00, $00                     ; $17F607 |
  db $00, $00, $00, $00                     ; $17F60B |
  db $9B, $E9, $3F, $00                     ; $17F60F |
  db $09, $78, $53, $00                     ; $17F613 |
  db $0A, $AD, $4B, $00                     ; $17F617 |
  db $42, $0C, $29, $00                     ; $17F61B |
  db $00, $00, $00, $00                     ; $17F61F |
  db $43, $0B, $2A, $00                     ; $17F623 |
  db $44, $5A, $61, $00                     ; $17F627 |
  db $00, $00, $00, $00                     ; $17F62B |
  db $00, $00, $00, $00                     ; $17F62F |
  db $CE, $06, $76, $00                     ; $17F633 |
  db $00, $00, $00, $00                     ; $17F637 |
  db $45, $0B, $7A, $00                     ; $17F63B |
  db $00, $00, $00, $00                     ; $17F63F |
  db $46, $32, $6C, $00                     ; $17F643 |
  db $00, $00, $00, $00                     ; $17F647 |
  db $BD, $08, $7A, $00                     ; $17F64B |
  db $0F, $9E, $24, $00                     ; $17F64F |
  db $00, $00, $00, $00                     ; $17F653 |
  db $00, $00, $00, $00                     ; $17F657 |
  db $77, $03, $5A, $00                     ; $17F65B |
  db $48, $A4, $77, $00                     ; $17F65F |
  db $78, $04, $27, $00                     ; $17F663 |
  db $C8, $0C, $39, $00                     ; $17F667 |
  db $BE, $1F, $34, $00                     ; $17F66B |
  db $00, $00, $00, $00                     ; $17F66F |
  db $4A, $3A, $58, $00                     ; $17F673 |
  db $13, $AB, $7A, $00                     ; $17F677 |
  db $14, $F2, $78, $00                     ; $17F67B |
  db $4C, $86, $78, $00                     ; $17F67F |
  db $7A, $05, $6B, $00                     ; $17F683 |
  db $4D, $ED, $38, $00                     ; $17F687 |
  db $00, $00, $00, $00                     ; $17F68B |
  db $A3, $09, $7A, $00                     ; $17F68F |
  db $4E, $3D, $6A, $00                     ; $17F693 |
  db $4F, $62, $59, $00                     ; $17F697 |
  db $00, $00, $00, $00                     ; $17F69B |
  db $50, $F1, $6B, $00                     ; $17F69F |
  db $00, $00, $00, $00                     ; $17F6A3 |
  db $51, $71, $6B, $00                     ; $17F6A7 |
  db $00, $00, $00, $00                     ; $17F6AB |
  db $52, $0F, $67, $00                     ; $17F6AF |
  db $80, $1D, $6E, $00                     ; $17F6B3 |
  db $00, $00, $00, $00                     ; $17F6B7 |
  db $81, $3D, $4A, $00                     ; $17F6BB |
  db $1D, $6B, $3F, $00                     ; $17F6BF |
  db $54, $03, $3A, $00                     ; $17F6C3 |
  db $00, $00, $00, $00                     ; $17F6C7 |
  db $55, $78, $61, $00                     ; $17F6CB |
  db $AA, $73, $7A, $00                     ; $17F6CF |
  db $C1, $76, $79, $00                     ; $17F6D3 |
  db $1F, $41, $52, $00                     ; $17F6D7 |
  db $00, $00, $00, $00                     ; $17F6DB |
  db $57, $14, $73, $00                     ; $17F6DF |
  db $00, $00, $00, $00                     ; $17F6E3 |
  db $58, $03, $3A, $00                     ; $17F6E7 |
  db $00, $00, $00, $00                     ; $17F6EB |
  db $59, $CB, $70, $00                     ; $17F6EF |
  db $86, $2C, $59, $00                     ; $17F6F3 |
  db $00, $00, $00, $00                     ; $17F6F7 |
  db $5B, $30, $40, $00                     ; $17F6FB |
  db $88, $58, $44, $00                     ; $17F6FF |
  db $5C, $93, $38, $00                     ; $17F703 |
  db $25, $8A, $5E, $00                     ; $17F707 |
  db $00, $00, $00, $00                     ; $17F70B |
  db $5D, $1A, $34, $00                     ; $17F70F |
  db $00, $00, $00, $00                     ; $17F713 |
  db $AF, $04, $0A, $00                     ; $17F717 |
  db $27, $B6, $49, $00                     ; $17F71B |
  db $5E, $08, $4A, $00                     ; $17F71F |
  db $B0, $44, $7A, $00                     ; $17F723 |
  db $00, $00, $00, $00                     ; $17F727 |
  db $5F, $0B, $4A, $00                     ; $17F72B |
  db $8B, $14, $46, $00                     ; $17F72F |
  db $00, $00, $00, $00                     ; $17F733 |
  db $60, $02, $6A, $00                     ; $17F737 |
  db $00, $00, $00, $00                     ; $17F73B |
  db $8D, $09, $39, $00                     ; $17F73F |
  db $00, $00, $00, $00                     ; $17F743 |
  db $62, $37, $15, $00                     ; $17F747 |
  db $00, $00, $00, $00                     ; $17F74B |
  db $B3, $4F, $6B, $00                     ; $17F74F |
  db $00, $00, $00, $00                     ; $17F753 |
  db $00, $00, $00, $00                     ; $17F757 |
  db $00, $00, $00, $00                     ; $17F75B |
  db $63, $05, $2A, $00                     ; $17F75F |
  db $00, $00, $00, $00                     ; $17F763 |
  db $64, $12, $79, $00                     ; $17F767 |
  db $90, $0A, $7A, $00                     ; $17F76B |
  db $00, $00, $00, $00                     ; $17F76F |
  db $65, $0E, $7A, $00                     ; $17F773 |
  db $91, $08, $78, $00                     ; $17F777 |
  db $00, $00, $00, $00                     ; $17F77B |
  db $66, $07, $4A, $00                     ; $17F77F |
  db $00, $00, $00, $00                     ; $17F783 |
  db $93, $55, $27, $00                     ; $17F787 |
  db $B6, $52, $27, $00                     ; $17F78B |
  db $C5, $C8, $71, $00                     ; $17F78F |
  db $00, $00, $00, $00                     ; $17F793 |
  db $68, $05, $68, $00                     ; $17F797 |
  db $94, $0A, $76, $00                     ; $17F79B |
  db $32, $4E, $55, $00                     ; $17F79F |
  db $33, $E1, $0A, $00                     ; $17F7A3 |
  db $6A, $43, $1E, $00                     ; $17F7A7 |
  db $34, $F7, $7A, $00                     ; $17F7AB |
  db $6B, $75, $0A, $00                     ; $17F7AF |
  db $00, $00, $00, $00                     ; $17F7B3 |
  db $DD, $04, $7A, $00                     ; $17F7B7 |
  db $35, $D7, $1C, $00                     ; $17F7BB |
  db $6C, $67, $4B, $00                     ; $17F7BF |

; level object and sprite data pointers (two pointers per level)
level_object_pointers:
  dl $1681C7                                ; $17F7C3 | 00 object data
level_sprite_pointers:
  dl $168583                                ; $17F7C6 | 00 sprite data

  dl $4CE0A2, $4CE976                       ; $17F7C9 | 01  $19E0A2, $19E976
  dl $168671, $1690B5                       ; $17F7CF | 02
  dl $148000, $14869D                       ; $17F7D5 | 03
  dl $10F262, $10F4FA                       ; $17F7DB | 04
  dl $11CA15, $11D2BB                       ; $17F7E1 | 05
  dl $12C709, $12CF07                       ; $17F7E7 | 06
  dl $158000, $15866B                       ; $17F7ED | 07
  dl $1691D5, $1694A5                       ; $17F7F3 | 08
  dl $12D00A, $12D8E2                       ; $17F7F9 | 09
  dl $1487D4, $1493BF                       ; $17F7FF | 0A
  dl $15876C, $159245                       ; $17F805 | 0B
  dl $1593F5, $159D95                       ; $17F80B | 0C
  dl $159F1A, $15AB8E                       ; $17F811 | 0D
  dl $15AD93, $15B8F5                       ; $17F817 | 0E
  dl $14960E, $14A39B                       ; $17F81D | 0F
  dl $00EBD4, $00F614                       ; $17F823 | 10
  dl $12DA6C, $12DD4A                       ; $17F829 | 11
  dl $14A5BC, $14AD4A                       ; $17F82F | 12
  dl $14AEA8, $14B123                       ; $17F835 | 13
  dl $14B23B, $14BAE3                       ; $17F83B | 14
  dl $11D3EF, $11DE77                       ; $17F841 | 15
  dl $15BA64, $15C19A                       ; $17F847 | 16
  dl $16953D, $169E75                       ; $17F84D | 17
  dl $169F7F, $16A7C0                       ; $17F853 | 18
  dl $14BD23, $14C6C6                       ; $17F859 | 19
  dl $15C307, $15C4E2                       ; $17F85F | 1A
  dl $14C711, $14D2C1                       ; $17F865 | 1B
  dl $14D488, $14DE8F                       ; $17F86B | 1C
  dl $15C59E, $15CA77                       ; $17F871 | 1D
  dl $12DDE1, $12E8A7                       ; $17F877 | 1E
  dl $14E035, $14E794                       ; $17F87D | 1F
  dl $16A998, $16B3C1                       ; $17F883 | 20
  dl $11E01E, $11E767                       ; $17F889 | 21
  dl $16B582, $16C01C                       ; $17F88F | 22
  dl $4CEACA, $4CF3D9                       ; $17F895 | 23  $19EACA, $19F3D9
  dl $15CC16, $15D759                       ; $17F89B | 24
  dl $14E920, $14EFF2                       ; $17F8A1 | 25
  dl $15D90D, $15E689                       ; $17F8A7 | 26
  dl $16C17D, $16CBDA                       ; $17F8AD | 27
  dl $16CDF5, $16DD21                       ; $17F8B3 | 28
  dl $12EB8A, $12EEC2                       ; $17F8B9 | 29
  dl $4CF4D9, $4CFD2F                       ; $17F8BF | 2A  $19F4D9, $19FD2F
  dl $16DF78, $16EF27                       ; $17F8C5 | 2B
  dl $12F04E, $12F77D                       ; $17F8CB | 2C
  dl $11E8B1, $11F1E1                       ; $17F8D1 | 2D
  dl $15E8E3, $15F013                       ; $17F8D7 | 2E
  dl $12F8B1, $12FE33                       ; $17F8DD | 2F
  dl $10F595, $10FCE5                       ; $17F8E3 | 30
  dl $16F0FE, $16FEC6                       ; $17F8E9 | 31
  dl $510000, $510EEC                       ; $17F8EF | 32  $228000, $228EEC
  dl $14F13E, $14FCB8                       ; $17F8F5 | 33
  dl $15F196, $15FD47                       ; $17F8FB | 34
  dl $11F3DE, $11FB9F                       ; $17F901 | 35
  dl $14FEC4, $14FF83                       ; $17F907 | 36
  dl $14FF1F, $14FF91                       ; $17F90D | 37
  dl $168000, $16855E                       ; $17F913 | 38
  dl $168042, $168560                       ; $17F919 | 39
  dl $1684C5, $168642                       ; $17F91F | 3A
  dl $4CE25E, $4CEA17                       ; $17F925 | 3B  $19E25E, $19EA17
  dl $16873E, $1690D5                       ; $17F92B | 3C
  dl $1484B6, $14878F                       ; $17F931 | 3D
  dl $11CC89, $11D34D                       ; $17F937 | 3E
  dl $12CE48, $12CFBD                       ; $17F93D | 3F
  dl $158250, $1586C7                       ; $17F943 | 40
  dl $12D150, $12D91D                       ; $17F949 | 41
  dl $148D0D, $1494B7                       ; $17F94F | 42
  dl $1589F7, $1592B0                       ; $17F955 | 43
  dl $159527, $159DC4                       ; $17F95B | 44
  dl $15A301, $15AC4A                       ; $17F961 | 45
  dl $15AFDD, $15B981                       ; $17F967 | 46
  dl $149D38, $14A4C3                       ; $17F96D | 47
  dl $00ECA1, $00F625                       ; $17F973 | 48
  dl $12DC3F, $12DDCA                       ; $17F979 | 49
  dl $14A716, $14AD7C                       ; $17F97F | 4A
  dl $14B0CA, $14B233                       ; $17F985 | 4B
  dl $14B56B, $14BB57                       ; $17F98B | 4C
  dl $11D547, $11DEB5                       ; $17F991 | 4D
  dl $15BBE8, $15C1F0                       ; $17F997 | 4E
  dl $1695D4, $169E92                       ; $17F99D | 4F
  dl $16A148, $16A80A                       ; $17F9A3 | 50
  dl $14BD91, $14C5D9                       ; $17F9A9 | 51
  dl $14CA56, $14D377                       ; $17F9AF | 52
  dl $14D4CA, $14DEA0                       ; $17F9B5 | 53
  dl $15C7F8, $15CB51                       ; $17F9BB | 54
  dl $12DF5D, $12E915                       ; $17F9C1 | 55
  dl $14E5E9, $14E88F                       ; $17F9C7 | 56
  dl $16AD52, $16B480                       ; $17F9CD | 57
  dl $11E511, $11E802                       ; $17F9D3 | 58
  dl $16BAE9, $16C0BD                       ; $17F9D9 | 59
  dl $4CF046, $4CF43B                       ; $17F9DF | 5A  $19F046, $19F43B
  dl $15D16B, $15D7D6                       ; $17F9E5 | 5B
  dl $14EA82, $14F030                       ; $17F9EB | 5C
  dl $15DAEC, $15E6FA                       ; $17F9F1 | 5D
  dl $16C6CD, $16CCD5                       ; $17F9F7 | 5E
  dl $16D3C7, $16DDA7                       ; $17F9FD | 5F
  dl $12ED05, $12EF99                       ; $17FA03 | 60
  dl $4CF9FC, $4CFE27                       ; $17FA09 | 61  $19F9FC, $19FE27
  dl $16E0B6, $16EF62                       ; $17FA0F | 62
  dl $12F1CB, $12F7E8                       ; $17FA15 | 63
  dl $11EA84, $11F288                       ; $17FA1B | 64
  dl $15EB1B, $15F096                       ; $17FA21 | 65
  dl $12FAD5, $12FEC2                       ; $17FA27 | 66
  dl $10F6EF, $10FD92                       ; $17FA2D | 67
  dl $16F93D, $16FF4C                       ; $17FA33 | 68
  dl $510691, $510FDB                       ; $17FA39 | 69  $228691, $228FDB
  dl $14F40E, $14FD17                       ; $17FA3F | 6A
  dl $15F222, $15FDA0                       ; $17FA45 | 6B
  dl $11F774, $11FC22                       ; $17FA4B | 6C
  dl $168F5C, $1691B5                       ; $17FA51 | 6D
  dl $14856D, $14879A                       ; $17FA57 | 6E
  dl $11CE64, $11D39A                       ; $17FA5D | 6F
  dl $1582E6, $1586DE                       ; $17FA63 | 70
  dl $12D53C, $12D9E8                       ; $17FA69 | 71
  dl $148FF0, $14951C                       ; $17FA6F | 72
  dl $159182, $1593C9                       ; $17FA75 | 73
  dl $1598BE, $159E3E                       ; $17FA7B | 74
  dl $15A51B, $15ACD3                       ; $17FA81 | 75
  dl $15B666, $15BA16                       ; $17FA87 | 76
  dl $149F1F, $14A52E                       ; $17FA8D | 77
  dl $00EE40, $00F678                       ; $17FA93 | 78
  dl $14AB69, $14AE44                       ; $17FA99 | 79
  dl $14B9A1, $14BC5E                       ; $17FA9F | 7A
  dl $11D8B1, $11DF32                       ; $17FAA5 | 7B
  dl $15BEA6, $15C258                       ; $17FAAB | 7C
  dl $169D23, $169F63                       ; $17FAB1 | 7D
  dl $16A400, $16A8A2                       ; $17FAB7 | 7E
  dl $14C445, $14C6C8                       ; $17FABD | 7F
  dl $14CD2E, $14D3B8                       ; $17FAC3 | 80
  dl $14D9A0, $14DF5C                       ; $17FAC9 | 81
  dl $12E347, $12EA22                       ; $17FACF | 82
  dl $14E743, $14E909                       ; $17FAD5 | 83
  dl $16AF66, $16B4F1                       ; $17FADB | 84
  dl $11E6F7, $11E876                       ; $17FAE1 | 85
  dl $16BE15, $16C167                       ; $17FAE7 | 86
  dl $15D4BA, $15D868                       ; $17FAED | 87
  dl $14EBEC, $14F095                       ; $17FAF3 | 88
  dl $15DD93, $15E7A4                       ; $17FAF9 | 89
  dl $16CAA6, $16CD9D                       ; $17FAFF | 8A
  dl $16D8B4, $16DEAE                       ; $17FB05 | 8B
  dl $12EE6E, $12F043                       ; $17FB0B | 8C
  dl $4CFA82, $4CFE3B                       ; $17FB11 | 8D  $19FA82, $19FE3B
  dl $16E763, $16EFF4                       ; $17FB17 | 8E
  dl $12F3EF, $12F80B                       ; $17FB1D | 8F
  dl $11ED0B, $11F2F9                       ; $17FB23 | 90
  dl $15EE89, $15F137                       ; $17FB29 | 91
  dl $12FC74, $12FF39                       ; $17FB2F | 92
  dl $10F8DF, $10FDA3                       ; $17FB35 | 93
  dl $16FC58, $16FF96                       ; $17FB3B | 94
  dl $510B51, $51106A                       ; $17FB41 | 95  $228B51, $22906A
  dl $14F9E1, $14FDF7                       ; $17FB47 | 96
  dl $15F2E7, $15FDC3                       ; $17FB4D | 97
  dl $11F92E, $11FC93                       ; $17FB53 | 98
  dl $14861B, $1487C3                       ; $17FB59 | 99
  dl $11CF8C, $11D3B4                       ; $17FB5F | 9A
  dl $15839D, $1586E6                       ; $17FB65 | 9B
  dl $12D623, $12DA1A                       ; $17FB6B | 9C
  dl $159917, $159E43                       ; $17FB71 | 9D
  dl $15A7E4, $15AD50                       ; $17FB77 | 9E
  dl $15B7EC, $15BA30                       ; $17FB7D | 9F
  dl $14A318, $14A5A5                       ; $17FB83 | A0
  dl $00EFFE, $00F6B3                       ; $17FB89 | A1
  dl $14ACFD, $14AE76                       ; $17FB8F | A2
  dl $11DB2E, $11DFA3                       ; $17FB95 | A3
  dl $15C0FA, $15C2C9                       ; $17FB9B | A4
  dl $169E04, $169F74                       ; $17FBA1 | A5
  dl $16A5DE, $16A916                       ; $17FBA7 | A6
  dl $14C528, $14C6CD                       ; $17FBAD | A7
  dl $14D10A, $14D45F                       ; $17FBB3 | A8
  dl $14DD7D, $14E015                       ; $17FBB9 | A9
  dl $12E3E1, $12EA2A                       ; $17FBBF | AA
  dl $16B272, $16B559                       ; $17FBC5 | AB
  dl $16BFAA, $16C172                       ; $17FBCB | AC
  dl $15D6BD, $15D8D6                       ; $17FBD1 | AD
  dl $14EEAB, $14F127                       ; $17FBD7 | AE
  dl $15DFDF, $15E83C                       ; $17FBDD | AF
  dl $16CB5D, $16CDA8                       ; $17FBE3 | B0
  dl $16DCF4, $16DF61                       ; $17FBE9 | B1
  dl $4CFC7A, $4CFE9A                       ; $17FBEF | B2  $19FC7A, $19FE9A
  dl $16E842, $16F017                       ; $17FBF5 | B3
  dl $12F4D1, $12F81F                       ; $17FBFB | B4
  dl $11F048, $11F373                       ; $17FC01 | B5
  dl $10F9D3, $10FE9E                       ; $17FC07 | B6
  dl $14FBC0, $14FE86                       ; $17FC0D | B7
  dl $15F3A1, $15FDCE                       ; $17FC13 | B8
  dl $11FAA9, $11FD6A                       ; $17FC19 | B9
  dl $12D89C, $12DA55                       ; $17FC1F | BA
  dl $159BF5, $159EBD                       ; $17FC25 | BB
  dl $15AA78, $15AD64                       ; $17FC2B | BC
  dl $15B881, $15BA4A                       ; $17FC31 | BD
  dl $00F2C3, $00F71E                       ; $17FC37 | BE
  dl $11DC0F, $11DFBA                       ; $17FC3D | BF
  dl $16A6D9, $16A963                       ; $17FC43 | C0
  dl $12E7C7, $12EB37                       ; $17FC49 | C1
  dl $15D6DF, $15D8E7                       ; $17FC4F | C2
  dl $15E2C8, $15E886                       ; $17FC55 | C3
  dl $16EBC4, $16F091                       ; $17FC5B | C4
  dl $10FB77, $10FF39                       ; $17FC61 | C5
  dl $15F51C, $15FE39                       ; $17FC67 | C6
  dl $159C5F, $159ED1                       ; $17FC6D | C7
  dl $00F40A, $00F750                       ; $17FC73 | C8
  dl $11DC87, $11DFBF                       ; $17FC79 | C9
  dl $15E43D, $15E8A6                       ; $17FC7F | CA
  dl $16EC2C, $16F097                       ; $17FC85 | CB
  dl $10FBF2, $10FF8F                       ; $17FC8B | CC
  dl $15F83A, $15FEF3                       ; $17FC91 | CD
  dl $159CFA, $159F06                       ; $17FC97 | CE
  dl $00F4EF, $00F773                       ; $17FC9D | CF
  dl $11DC0F, $11DFC4                       ; $17FCA3 | D0
  dl $15E663, $15E8DE                       ; $17FCA9 | D1
  dl $16EC55, $16F099                       ; $17FCAF | D2
  dl $15F8F7, $15FF28                       ; $17FCB5 | D3
  dl $00F50A, $00F77B                       ; $17FCBB | D4
  dl $11DC9C, $11DFC9                       ; $17FCC1 | D5
  dl $15F9B2, $15FF69                       ; $17FCC7 | D6
  dl $11DDF6, $11DFF2                       ; $17FCCD | D7
  dl $15F6BC, $15FE9E                       ; $17FCD3 | D8
  dl $15F7F4, $15FEE8                       ; $17FCD9 | D9
  dl $15FCEA, $15FFD5                       ; $17FCDF | DA
  dl $15FCEA, $15FFD5                       ; $17FCE5 | DB
  dl $15FBA2, $15FF7D                       ; $17FCEB | DC
  dl $15FCBE, $15FFD0                       ; $17FCF1 | DD


; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF           ; $17FCF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FCFD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD05 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD0D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD15 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD1D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD25 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD2D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD35 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD3D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD45 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD4D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD55 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD5D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD65 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD6D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD75 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD7D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD85 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD8D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD95 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FD9D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDA5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDAD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDB5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDBD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDC5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDCD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDD5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDDD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDE5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDED |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDF5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FDFD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE05 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE0D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE15 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE1D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE25 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE2D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE35 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE3D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE45 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE4D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE55 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE5D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE65 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE6D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE75 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE7D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE85 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE8D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE95 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FE9D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEA5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEAD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEB5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEBD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEC5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FECD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FED5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEDD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEE5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEED |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEF5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FEFD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF05 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF0D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF15 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF1D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF25 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF2D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF35 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF3D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF45 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF4D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF55 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF5D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF65 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF6D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF75 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF7D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF85 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF8D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF95 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FF9D |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFA5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFAD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFB5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFBD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFC5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFCD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFD5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFDD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFE5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFED |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $17FFF5 |
  db $FF, $FF, $FF                          ; $17FFFD |
