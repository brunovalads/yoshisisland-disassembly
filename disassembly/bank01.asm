org $018000

; one of the several routines at table $AE89
  TYX                                       ; $018000 |
  RTS                                       ; $018001 |

init_hookbill:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $018002 | init state
  TYX                                       ; $018004 |
  JSR (.state_ptr,x)                        ; $018005 |
  LDA !r_bg1_cam_x                          ; $018008 |
  STA !s_cam_x_left_boundary                ; $01800B |
  LDA #$0002                                ; $01800E |
  STA !s_spr_state,x                        ; $018011 |
  RTL                                       ; $018014 |

; this table contains each state of the fog opening
; to hookbill
.state_ptr
  dw $8025                                  ; $018015 | 02: start fog sequence
  dw $8041                                  ; $018017 | 04: fog moving left to cover whole screen
  dw $8103                                  ; $018019 | 06: stays foggy for a time
  dw $8174                                  ; $01801B | 08: fog fades away
  dw $81A8                                  ; $01801D | 0A: graphics loading
  dw $81B2                                  ; $01801F | 0C: more graphics loading
  dw $81C5                                  ; $018021 | 0E: prepares sprites like kamek etc.
  dw $8236                                  ; $018023 | 10: does init on the boss sprite himself

hookbill_init_fog:
  LDX $12                                   ; $018025 |
  STZ !s_bg3_cam_x                          ; $018027 |
  STZ !r_bg3_cam_x                          ; $01802A |
  STZ !s_bg3_cam_y                          ; $01802D |
  STZ !r_bg3_cam_y                          ; $018030 |
  LDA #$1304                                ; $018033 |
  STA !r_reg_tm_mirror                      ; $018036 |
  LDY #$24                                  ; $018039 |
  STY !r_reg_cgadsub_mirror                 ; $01803B |
  JMP CODE_01819F                           ; $01803E |

hookbill_init_fog_left:
  LDX $12                                   ; $018041 |
  LDA !s_spr_timer_1,x                      ; $018043 |
  BNE CODE_018051                           ; $018046 |
  LDA #$0004                                ; $018048 |
  STA !s_spr_timer_1,x                      ; $01804B |
  DEC !s_spr_x_pixel_pos,x                  ; $01804E |

CODE_018051:
  REP #$10                                  ; $018051 |
  LDY #$0000                                ; $018053 |
  LDA !s_spr_cam_x_pos,x                    ; $018056 |
  SEC                                       ; $018059 |
  SBC #$0120                                ; $01805A |
  EOR #$FFFF                                ; $01805D |
  INC A                                     ; $018060 |
  BPL CODE_018066                           ; $018061 |
  LDA #$0000                                ; $018063 |

CODE_018066:
  CMP #$00E0                                ; $018066 |
  BCC CODE_0180B9                           ; $018069 |
  LDY #$0100                                ; $01806B |
  SBC #$00E0                                ; $01806E |
  CMP #$00E0                                ; $018071 |
  BCC CODE_0180B9                           ; $018074 |
  PHY                                       ; $018076 |
  LDA #$2000                                ; $018077 |
  STA !gsu_r1                               ; $01807A |
  LDA #$2F6C                                ; $01807D |
  STA !gsu_r2                               ; $018080 |
  LDA #$0200                                ; $018083 |
  STA !gsu_r12                              ; $018086 |
  SEP #$10                                  ; $018089 |
  LDX #$08                                  ; $01808B |
  LDA #$AA7F                                ; $01808D |
  JSL r_gsu_init_1                          ; $018090 | GSU
  LDA #$7FFF                                ; $018094 |
  STA $702F8C                               ; $018097 |
  LDX #$1C                                  ; $01809B |

CODE_01809D:
  STA $70302E,x                             ; $01809D |
  STA $70304E,x                             ; $0180A1 |
  DEX                                       ; $0180A5 |
  DEX                                       ; $0180A6 |
  BPL CODE_01809D                           ; $0180A7 |
  LDA #$0000                                ; $0180A9 |
  STA $70336C                               ; $0180AC |
  JSR CODE_01819F                           ; $0180B0 |
  REP #$10                                  ; $0180B3 |
  PLY                                       ; $0180B5 |
  LDA #$00E0                                ; $0180B6 |

CODE_0180B9:
  STY !s_bg3_cam_y                          ; $0180B9 |
  STY !r_bg3_cam_y                          ; $0180BC |
  STA !s_bg3_cam_x                          ; $0180BF |
  STA !r_bg3_cam_x                          ; $0180C2 |
  STA !gsu_r1                               ; $0180C5 |
  LDA $14                                   ; $0180C8 |
  LSR A                                     ; $0180CA |
  STA !gsu_r2                               ; $0180CB |
  LDA #$0070                                ; $0180CE |
  STA !gsu_r3                               ; $0180D1 |
  LDA #$000F                                ; $0180D4 |
  STA !gsu_r4                               ; $0180D7 |
  STZ !gsu_r5                               ; $0180DA |
  LDA #$36BA                                ; $0180DD |
  STA !gsu_r6                               ; $0180E0 |
  SEP #$10                                  ; $0180E3 |
  LDX #$08                                  ; $0180E5 |
  LDA #$9208                                ; $0180E7 |
  JSL r_gsu_init_1                          ; $0180EA | GSU
  JSL $00BE39                               ; $0180EE |

; DMA args
  dl $7E51E4, $7036BA                       ; $0180F2 |
  dw $0348                                  ; $0180F8 |

  LDA #$0008                                ; $0180FA |
  TSB !r_reg_hdmaen_mirror                  ; $0180FD |
  LDX $12                                   ; $018100 |
  RTS                                       ; $018102 |

hookbill_init_fog_stay:
  LDA $14                                   ; $018103 |
  AND #$0007                                ; $018105 |
  BNE CODE_018131                           ; $018108 |
  LDA $70336C                               ; $01810A |
  CMP #$0020                                ; $01810E |
  BCS CODE_018134                           ; $018111 |

CODE_018113:
  LDA #$2D6C                                ; $018113 |
  STA $70336E                               ; $018116 |
  LDA #$2F6C                                ; $01811A |
  STA $703370                               ; $01811D |
  LDX #$08                                  ; $018121 |
  LDA #$B4A9                                ; $018123 |
  JSL r_gsu_init_1                          ; $018126 | GSU init
  LDA $702020                               ; $01812A |
  STA !r_reg_coldata_mirror                 ; $01812E |

CODE_018131:
  LDX $12                                   ; $018131 |
  RTS                                       ; $018133 |

CODE_018134:
  LDA #$0008                                ; $018134 |
  TRB !r_reg_hdmaen_mirror                  ; $018137 |
  LDA #$0002                                ; $01813A |
  TRB !r_reg_ts_mirror                      ; $01813D |
  LDA #$0000                                ; $018140 |
  STA $702F6E                               ; $018143 |
  STA $702F70                               ; $018147 |
  STA $702F72                               ; $01814B |
  STA $70336C                               ; $01814F |
  LDX #$1C                                  ; $018153 |

CODE_018155:
  LDA $5FDAC0,x                             ; $018155 |
  STA $70314E,x                             ; $018159 |
  DEX                                       ; $01815D |
  DEX                                       ; $01815E |
  BPL CODE_018155                           ; $01815F |
  LDA $5FDABE                               ; $018161 |
  STA $70314C                               ; $018165 |
  JSR CODE_01819F                           ; $018169 |
  LDA #$00D5                                ; $01816C |
  JSL spawn_sprite_init                     ; $01816F |
  RTS                                       ; $018173 |

hookbill_init_fog_fade:
  LDA $14                                   ; $018174 |
  AND #$0007                                ; $018176 |
  BNE CODE_018131                           ; $018179 |
  LDA $70336C                               ; $01817B |
  CMP #$0020                                ; $01817F |
  BCC CODE_018113                           ; $018182 |
  LDX $12                                   ; $018184 |
  JSL $03D5E4                               ; $018186 |
  STZ $0C14                                 ; $01818A |
  STZ $0C16                                 ; $01818D |
  LDA #$0004                                ; $018190 |
  STA !r_header_anim_tileset                ; $018193 |
  STZ !r_header_anim_palette                ; $018196 |
  STZ $0D2B                                 ; $018199 |
  STZ $0D3B                                 ; $01819C |

CODE_01819F:
  SEP #$10                                  ; $01819F | entry point
  LDX $12                                   ; $0181A1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0181A3 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0181A5 |
  RTS                                       ; $0181A7 |

hookbill_init_graphics:
  LDA #$004D                                ; $0181A8 | compressed file index
  REP #$10                                  ; $0181AB |
  LDY #$2800                                ; $0181AD | VRAM destination
  BRA CODE_0181BA                           ; $0181B0 |

hookbill_init_graphics_2:
  LDA #$004E                                ; $0181B2 | comp. file index
  REP #$10                                  ; $0181B5 |
  LDY #$2C00                                ; $0181B7 | VRAM dest.

CODE_0181BA:
  JSR hookbill_decompress_gfx               ; $0181BA |
  LDA #$0404                                ; $0181BD |
  TRB !r_reg_tm_mirror                      ; $0181C0 |
  BRA CODE_01819F                           ; $0181C3 |

hookbill_init_sprites:
  JSL $0181FB                               ; $0181C5 |
  LDA #$00F1                                ; $0181C9 |
  STA !r_apu_io_0_mirror                    ; $0181CC |
  LDA #$00DD                                ; $0181CF |
  JSL spawn_sprite_active                   ; $0181D2 | init "closer" sprite
  LDA #$0042                                ; $0181D6 |
  STA !s_spr_wildcard_4_lo,y                ; $0181D9 |
  LDA #$0074                                ; $0181DC |
  STA !s_spr_wildcard_2_lo,y                ; $0181DF |
  STZ $105A                                 ; $0181E2 |
  INC $0B7B                                 ; $0181E5 |
  LDA #$0048                                ; $0181E8 |
  JSL spawn_sprite_init                     ; $0181EB | init kamek sprite
  LDA #$0010                                ; $0181EF |
  STA !s_spr_x_pixel_pos,y                  ; $0181F2 |
  JSL $04F74A                               ; $0181F5 |
  BRA CODE_01819F                           ; $0181F9 |

; l sub
  REP #$10                                  ; $0181FB |
  LDA #$00F8                                ; $0181FD | comp. file index
  LDY #$3400                                ; $018200 | VRAM dest. (BG3 tilemap)
  JSR hookbill_decompress_gfx               ; $018203 |
  LDX #$0C                                  ; $018206 |

CODE_018208:
  LDA $5FC13A,x                             ; $018208 |
  STA $702D7E,x                             ; $01820C |
  STA $702012,x                             ; $018210 |
  STA $702F7E,x                             ; $018214 |
  DEX                                       ; $018218 |
  DEX                                       ; $018219 |
  BPL CODE_018208                           ; $01821A |
  RTL                                       ; $01821C |

hookbill_decompress_gfx:
  PHY                                       ; $01821D |
  LDX #$6800                                ; $01821E |
  JSL decompress_lc_lz1_l_x                 ; $018221 |
  PLY                                       ; $018225 |
  LDX #$0070                                ; $018226 |
  STX $0001                                 ; $018229 |
  LDX #$6800                                ; $01822C |
  JSL $00BEA6                               ; $01822F |
  SEP #$10                                  ; $018233 |

CODE_018235:
  RTS                                       ; $018235 |

hookbill_init_boss:
  LDX $12                                   ; $018236 |
  STZ !s_player_direction                   ; $018238 |
  LDY $105A                                 ; $01823B |
  BEQ CODE_018235                           ; $01823E |
  STZ $7ECC                                 ; $018240 |
  LDA !r_bg1_cam_x                          ; $018243 |
  CLC                                       ; $018246 |
  ADC #$0120                                ; $018247 |
  STA !s_spr_x_pixel_pos,x                  ; $01824A |
  LDA !s_player_y                           ; $01824D |
  STA !s_spr_y_pixel_pos,x                  ; $018250 |
  STZ !r_autoscr_x_active                   ; $018253 |
  LDA !r_bg1_cam_x                          ; $018256 |
  STA !s_cam_x_left_boundary                ; $018259 |
  CLC                                       ; $01825C |
  ADC #$0100                                ; $01825D |
  STA $1082                                 ; $018260 |
  STA !s_cam_x_right_boundary               ; $018263 |
  LDA #$0040                                ; $018266 |
  STA !s_spr_y_accel,x                      ; $018269 |
  LDA #$0400                                ; $01826C |
  STA !s_spr_y_accel_ceiling,x              ; $01826F |
  STA $106E                                 ; $018272 |
  XBA                                       ; $018275 |
  STA !s_spr_draw_priority,x                ; $018276 |
  LDA #$FF80                                ; $018279 |
  STA !s_spr_x_speed_lo,x                   ; $01827C |
  STZ $1080                                 ; $01827F |
  STZ !s_bg3_cam_y                          ; $018282 |
  LDA #$0015                                ; $018285 |
  STA !r_reg_tm_mirror                      ; $018288 |
  LDA #$0009                                ; $01828B |
  STA !r_apu_io_0_mirror                    ; $01828E |
  LDY #$2B                                  ; $018291 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $018293 |
  PLA                                       ; $018295 |\ skips the RTS
  RTL                                       ; $018296 |/ and goes back one in stack

; hookbill table (used by gsu)
; each separate chunk represents one of hookbill's
; frames, contains info about them
; the chunks are divided into 7 5-byte subchunks
; each one represents a different part of his body:
; first subchunk:   near leg
; second subchunk:  near arm
; third subchunk:   tail
; fourth subchunk:  head
; fifth subchunk:   far arm
; sixth subchunk:   far leg
; seventh subchunk: shell
; the subchunks are as follows:
; first byte: index into $8B46 tables
; second byte: angle 1
; third byte: radius 1
; fourth byte: angle 2
; fifth byte: radius 2
; the angles & radii are used to determine
; positional information for the body part
; relative to an "origin" in the center of him
  db $02, $DF, $14, $B9, $06                ; $018297 |
  db $00, $B4, $0E, $D8, $09                ; $01829C |
  db $00, $FF, $20, $DF, $07                ; $0182A1 |
  db $00, $90, $16, $7A, $0C                ; $0182A6 |
  db $01, $9B, $15, $BC, $07                ; $0182AB |
  db $00, $EA, $1A, $D3, $08                ; $0182B0 |
  db $00, $F3, $06, $00, $00                ; $0182B5 |

  db $02, $E5, $17, $B9, $06                ; $0182BA |
  db $00, $A4, $0C, $D9, $08                ; $0182BF |
  db $00, $FD, $1F, $E2, $07                ; $0182C4 |
  db $00, $8A, $15, $79, $0C                ; $0182C9 |
  db $01, $A0, $13, $B9, $07                ; $0182CE |
  db $00, $EC, $14, $D7, $08                ; $0182D3 |
  db $00, $02, $06, $00, $00                ; $0182D8 |

  db $02, $E8, $1A, $BC, $06                ; $0182DD |
  db $01, $A2, $0C, $B0, $08                ; $0182E2 |
  db $00, $FC, $1E, $E1, $07                ; $0182E7 |
  db $00, $85, $14, $7B, $0D                ; $0182EC |
  db $01, $A6, $10, $BD, $07                ; $0182F1 |
  db $02, $F0, $14, $B6, $06                ; $0182F6 |
  db $00, $0C, $06, $00, $00                ; $0182FB |

  db $02, $EC, $1D, $BA, $06                ; $018300 |
  db $02, $A4, $0C, $AD, $06                ; $018305 |
  db $00, $FC, $1D, $DD, $07                ; $01830A |
  db $00, $89, $17, $7A, $0C                ; $01830F |
  db $01, $B0, $0E, $B9, $07                ; $018314 |
  db $01, $EF, $14, $AF, $09                ; $018319 |
  db $00, $02, $06, $00, $00                ; $01831E |

  db $00, $EC, $1D, $D5, $07                ; $018323 |
  db $01, $9F, $13, $B8, $07                ; $018328 |
  db $00, $FB, $1C, $E1, $07                ; $01832D |
  db $00, $8E, $17, $7A, $0C                ; $018332 |
  db $00, $AE, $0E, $D4, $08                ; $018337 |
  db $02, $DE, $12, $BB, $06                ; $01833C |
  db $00, $F3, $06, $00, $00                ; $018341 |

  db $00, $EF, $18, $D0, $07                ; $018346 |
  db $01, $A5, $11, $BC, $07                ; $01834B |
  db $00, $FC, $1D, $E3, $07                ; $018350 |
  db $00, $89, $17, $79, $0C                ; $018355 |
  db $01, $9E, $0E, $CC, $07                ; $01835A |
  db $02, $E1, $15, $B4, $05                ; $01835F |
  db $00, $02, $06, $00, $00                ; $018364 |

  db $02, $F2, $17, $BA, $06                ; $018369 |
  db $01, $AF, $0E, $B9, $07                ; $01836E |
  db $00, $FC, $1E, $DE, $07                ; $018373 |
  db $00, $84, $15, $79, $0C                ; $018378 |
  db $01, $9C, $0B, $BC, $07                ; $01837D |
  db $02, $E6, $18, $BA, $06                ; $018382 |
  db $00, $0C, $06, $00, $00                ; $018387 |

  db $01, $F0, $18, $A8, $08                ; $01838C |
  db $01, $B9, $0D, $BC, $07                ; $018391 |
  db $00, $FD, $1F, $DF, $07                ; $018396 |
  db $00, $8A, $15, $79, $0C                ; $01839B |
  db $02, $9D, $0E, $AF, $08                ; $0183A0 |
  db $02, $EA, $1B, $B7, $06                ; $0183A5 |
  db $00, $02, $06, $00, $00                ; $0183AA |

  db $02, $AD, $0E, $BA, $07                ; $0183AF |
  db $03, $63, $0F, $B2, $06                ; $0183B4 |
  db $00, $E2, $0F, $DF, $08                ; $0183B9 |
  db $00, $57, $1C, $78, $0C                ; $0183BE |
  db $05, $76, $14, $A6, $09                ; $0183C3 |
  db $00, $C9, $0E, $D5, $07                ; $0183C8 |
  db $00, $24, $07, $00, $00                ; $0183CD |

  db $02, $B9, $0D, $BA, $07                ; $0183D2 |
  db $04, $64, $0E, $AA, $08                ; $0183D7 |
  db $00, $E1, $10, $E0, $08                ; $0183DC |
  db $00, $53, $1D, $78, $0C                ; $0183E1 |
  db $04, $73, $13, $A9, $08                ; $0183E6 |
  db $00, $BC, $0A, $D2, $07                ; $0183EB |
  db $00, $27, $09, $00, $00                ; $0183F0 |

  db $02, $C5, $0D, $B7, $07                ; $0183F5 |
  db $04, $6D, $0F, $AB, $08                ; $0183FA |
  db $00, $E4, $11, $E0, $09                ; $0183FF |
  db $00, $50, $1E, $78, $0C                ; $018404 |
  db $04, $70, $11, $AA, $08                ; $018409 |
  db $02, $BC, $07, $BC, $07                ; $01840E |
  db $00, $2A, $0B, $00, $00                ; $018413 |

  db $02, $D1, $0E, $BB, $07                ; $018418 |
  db $05, $6D, $0F, $A5, $0A                ; $01841D |
  db $00, $E6, $12, $E1, $08                ; $018422 |
  db $00, $53, $1D, $7A, $0C                ; $018427 |
  db $03, $6F, $13, $BB, $07                ; $01842C |
  db $01, $B9, $04, $AA, $09                ; $018431 |
  db $00, $27, $09, $00, $00                ; $018436 |

  db $00, $D0, $0F, $D4, $07                ; $01843B |
  db $05, $70, $10, $A6, $0A                ; $018440 |
  db $00, $E8, $12, $E1, $08                ; $018445 |
  db $00, $57, $1C, $7A, $0C                ; $01844A |
  db $03, $6A, $11, $B8, $07                ; $01844F |
  db $02, $A8, $10, $B9, $07                ; $018454 |
  db $00, $24, $07, $00, $00                ; $018459 |

  db $00, $CA, $0A, $D4, $07                ; $01845E |
  db $04, $70, $10, $AB, $08                ; $018463 |
  db $00, $E6, $12, $DF, $08                ; $018468 |
  db $00, $53, $1D, $79, $0C                ; $01846D |
  db $04, $6C, $10, $AA, $08                ; $018472 |
  db $02, $B2, $0E, $BB, $07                ; $018477 |
  db $00, $27, $09, $00, $00                ; $01847C |

  db $02, $CE, $07, $B9, $07                ; $018481 |
  db $04, $6B, $0F, $AB, $08                ; $018486 |
  db $00, $E4, $11, $E1, $08                ; $01848B |
  db $00, $4F, $1E, $78, $0C                ; $018490 |
  db $04, $70, $11, $A8, $08                ; $018495 |
  db $02, $BC, $0D, $BB, $07                ; $01849A |
  db $00, $2A, $0B, $00, $00                ; $01849F |

  db $01, $DD, $05, $A6, $0A                ; $0184A4 |
  db $03, $6B, $0F, $B2, $06                ; $0184A9 |
  db $00, $E1, $10, $E1, $08                ; $0184AE |
  db $00, $53, $1D, $79, $0C                ; $0184B3 |
  db $05, $72, $12, $A8, $09                ; $0184B8 |
  db $02, $CB, $0D, $BC, $07                ; $0184BD |
  db $00, $27, $09, $00, $00                ; $0184C2 |

  db $01, $C7, $10, $A5, $0A                ; $0184C7 |
  db $05, $B8, $0A, $A6, $0A                ; $0184CC |
  db $00, $F4, $1C, $D7, $07                ; $0184D1 |
  db $00, $6E, $15, $78, $0C                ; $0184D6 |
  db $03, $81, $0F, $B3, $06                ; $0184DB |
  db $00, $E9, $1B, $D2, $07                ; $0184E0 |
  db $00, $13, $07, $00, $00                ; $0184E5 |

  db $02, $CE, $12, $B8, $07                ; $0184EA |
  db $04, $A5, $0A, $AD, $08                ; $0184EF |
  db $00, $F2, $1B, $D6, $07                ; $0184F4 |
  db $00, $6D, $15, $7A, $0C                ; $0184F9 |
  db $04, $87, $0C, $AC, $08                ; $0184FE |
  db $00, $E8, $12, $D3, $07                ; $018503 |
  db $00, $14, $09, $00, $00                ; $018508 |

  db $02, $DD, $16, $BA, $07                ; $01850D |
  db $04, $98, $09, $AC, $08                ; $018512 |
  db $00, $EF, $19, $D9, $07                ; $018517 |
  db $00, $69, $14, $7A, $0C                ; $01851C |
  db $04, $92, $0B, $A9, $08                ; $018521 |
  db $02, $E0, $10, $BA, $07                ; $018526 |
  db $00, $13, $0B, $00, $00                ; $01852B |

  db $00, $E1, $19, $D0, $08                ; $018530 |
  db $03, $89, $0C, $B5, $06                ; $018535 |
  db $00, $ED, $17, $D7, $07                ; $01853A |
  db $00, $65, $14, $78, $0C                ; $01853F |
  db $05, $A3, $09, $A8, $0A                ; $018544 |
  db $01, $D8, $0E, $A4, $0A                ; $018549 |
  db $00, $13, $0D, $00, $00                ; $01854E |

  db $00, $ED, $1D, $D1, $08                ; $018553 |
  db $03, $92, $0F, $B5, $06                ; $018558 |
  db $00, $EF, $15, $D6, $07                ; $01855D |
  db $00, $6F, $15, $78, $0C                ; $018562 |
  db $05, $AD, $0B, $A5, $0A                ; $018567 |
  db $01, $C0, $10, $A7, $0A                ; $01856C |
  db $00, $13, $07, $00, $00                ; $018571 |

  db $00, $EC, $14, $D1, $08                ; $018576 |
  db $04, $89, $09, $A8, $08                ; $01857B |
  db $00, $ED, $17, $DA, $07                ; $018580 |
  db $00, $6B, $15, $79, $0C                ; $018585 |
  db $04, $9D, $0C, $AA, $08                ; $01858A |
  db $02, $C8, $11, $BD, $07                ; $01858F |
  db $00, $14, $09, $00, $00                ; $018594 |

  db $02, $E9, $10, $BA, $07                ; $018599 |
  db $04, $98, $09, $AB, $08                ; $01859E |
  db $00, $F0, $19, $D6, $07                ; $0185A3 |
  db $00, $68, $14, $79, $0C                ; $0185A8 |
  db $04, $93, $0B, $A9, $08                ; $0185AD |
  db $02, $D7, $14, $BD, $07                ; $0185B2 |
  db $00, $13, $0B, $00, $00                ; $0185B7 |

  db $01, $DE, $10, $A4, $0A                ; $0185BC |
  db $05, $B1, $07, $A7, $0A                ; $0185C1 |
  db $00, $F2, $1B, $D7, $07                ; $0185C6 |
  db $00, $66, $14, $7A, $0C                ; $0185CB |
  db $03, $88, $0F, $B3, $06                ; $0185D0 |
  db $00, $DC, $17, $D1, $07                ; $0185D5 |
  db $00, $13, $0D, $00, $00                ; $0185DA |

  db $02, $C0, $0C, $00, $00                ; $0185DF |
  db $05, $60, $08, $00, $00                ; $0185E4 |
  db $00, $80, $08, $00, $00                ; $0185E9 |
  db $00, $00, $00, $00, $00                ; $0185EE |
  db $05, $60, $08, $00, $00                ; $0185F3 |
  db $02, $C0, $0C, $00, $00                ; $0185F8 |
  db $00, $00, $00, $00, $00                ; $0185FD |

  db $02, $00, $00, $00, $00                ; $018602 |
  db $05, $00, $00, $00, $00                ; $018607 |
  db $00, $00, $00, $00, $00                ; $01860C |
  db $00, $80, $05, $00, $00                ; $018611 |
  db $05, $00, $00, $00, $00                ; $018616 |
  db $02, $00, $00, $00, $00                ; $01861B |
  db $00, $00, $00, $00, $00                ; $018620 |

  db $02, $F2, $24, $00, $00                ; $018625 |
  db $05, $8C, $24, $00, $00                ; $01862A |
  db $00, $0C, $22, $00, $00                ; $01862F |
  db $00, $84, $2B, $00, $00                ; $018634 |
  db $05, $86, $15, $00, $00                ; $018639 |
  db $02, $01, $22, $00, $00                ; $01863E |
  db $00, $00, $00, $00, $00                ; $018643 |

  db $02, $FC, $22, $00, $00                ; $018648 |
  db $05, $8B, $1E, $00, $00                ; $01864D |
  db $00, $04, $1B, $00, $00                ; $018652 |
  db $00, $83, $28, $00, $00                ; $018657 |
  db $05, $87, $24, $00, $00                ; $01865C |
  db $02, $01, $21, $00, $00                ; $018661 |
  db $00, $00, $00, $00, $00                ; $018666 |

  db $02, $06, $22, $00, $00                ; $01866B |
  db $05, $8A, $23, $00, $00                ; $018670 |
  db $00, $14, $22, $00, $00                ; $018675 |
  db $00, $82, $27, $00, $00                ; $01867A |
  db $05, $84, $20, $00, $00                ; $01867F |
  db $02, $0F, $1D, $00, $00                ; $018684 |
  db $00, $00, $00, $00, $00                ; $018689 |

  db $02, $BD, $1F, $B9, $04                ; $01868E |
  db $05, $64, $1F, $43, $05                ; $018693 |
  db $00, $CE, $20, $B4, $00                ; $018698 |
  db $00, $53, $28, $2A, $06                ; $01869D |
  db $05, $5A, $21, $50, $09                ; $0186A2 |
  db $01, $9A, $20, $C6, $03                ; $0186A7 |
  db $00, $00, $00, $00, $00                ; $0186AC |

  db $02, $BD, $1F, $A8, $04                ; $0186B1 |
  db $05, $64, $1F, $9D, $05                ; $0186B6 |
  db $00, $CE, $20, $01, $04                ; $0186BB |
  db $00, $53, $28, $1A, $08                ; $0186C0 |
  db $05, $5A, $21, $BF, $09                ; $0186C5 |
  db $01, $9A, $20, $BF, $06                ; $0186CA |
  db $00, $00, $00, $00, $00                ; $0186CF |

  db $02, $AF, $23, $9A, $04                ; $0186D4 |
  db $05, $54, $20, $37, $05                ; $0186D9 |
  db $00, $C3, $1D, $D2, $04                ; $0186DE |
  db $00, $40, $28, $3E, $02                ; $0186E3 |
  db $05, $4C, $22, $4E, $07                ; $0186E8 |
  db $01, $9B, $23, $64, $07                ; $0186ED |
  db $00, $00, $00, $00, $00                ; $0186F2 |

  db $02, $AF, $23, $6B, $03                ; $0186F7 |
  db $05, $54, $20, $90, $08                ; $0186FC |
  db $00, $C3, $1D, $99, $04                ; $018701 |
  db $00, $40, $28, $F7, $04                ; $018706 |
  db $05, $4C, $22, $93, $08                ; $01870B |
  db $01, $9B, $23, $60, $0A                ; $018710 |
  db $00, $00, $00, $00, $00                ; $018715 |

  db $02, $75, $23, $4F, $04                ; $01871A |
  db $05, $0D, $1D, $17, $06                ; $01871F |
  db $00, $7B, $22, $98, $04                ; $018724 |
  db $00, $0A, $22, $07, $03                ; $018729 |
  db $05, $11, $20, $1B, $08                ; $01872E |
  db $02, $6B, $1C, $50, $0B                ; $018733 |
  db $00, $00, $00, $00, $00                ; $018738 |

  db $02, $75, $23, $A9, $04                ; $01873D |
  db $05, $0D, $1D, $EC, $0A                ; $018742 |
  db $00, $7B, $22, $C0, $0A                ; $018747 |
  db $00, $0A, $22, $EB, $08                ; $01874C |
  db $05, $11, $20, $F0, $08                ; $018751 |
  db $02, $6B, $1C, $AB, $0A                ; $018756 |
  db $00, $00, $00, $00, $00                ; $01875B |

  db $02, $5F, $1B, $29, $08                ; $018760 |
  db $05, $F6, $23, $F7, $04                ; $018765 |
  db $00, $65, $1A, $73, $07                ; $01876A |
  db $00, $EF, $21, $16, $07                ; $01876F |
  db $05, $F5, $25, $35, $07                ; $018774 |
  db $02, $4E, $1A, $3E, $04                ; $018779 |
  db $00, $00, $00, $00, $00                ; $01877E |

  db $02, $67, $1D, $3B, $04                ; $018783 |
  db $05, $16, $1D, $3C, $07                ; $018788 |
  db $00, $77, $1D, $5F, $04                ; $01878D |
  db $00, $16, $25, $5D, $04                ; $018792 |
  db $05, $12, $1E, $3C, $07                ; $018797 |
  db $02, $58, $1D, $74, $04                ; $01879C |
  db $00, $00, $00, $00, $00                ; $0187A1 |

  db $02, $00, $00, $00, $00                ; $0187A6 |
  db $05, $00, $00, $00, $00                ; $0187AB |
  db $00, $00, $00, $00, $00                ; $0187B0 |
  db $00, $00, $00, $00, $00                ; $0187B5 |
  db $05, $00, $00, $00, $00                ; $0187BA |
  db $02, $00, $00, $00, $00                ; $0187BF |
  db $00, $00, $00, $00, $00                ; $0187C4 |

  db $02, $C0, $0C, $00, $00                ; $0187C9 |
  db $05, $60, $08, $00, $00                ; $0187CE |
  db $00, $80, $08, $00, $00                ; $0187D3 |
  db $00, $00, $00, $00, $00                ; $0187D8 |
  db $05, $60, $08, $00, $00                ; $0187DD |
  db $02, $C0, $0C, $00, $00                ; $0187E2 |
  db $00, $00, $00, $00, $00                ; $0187E7 |

  db $02, $80, $08, $00, $00                ; $0187EC |
  db $05, $80, $08, $00, $00                ; $0187F1 |
  db $00, $00, $00, $00, $00                ; $0187F6 |
  db $00, $80, $08, $00, $00                ; $0187FB |
  db $05, $80, $08, $00, $00                ; $018800 |
  db $02, $80, $08, $00, $00                ; $018805 |
  db $00, $00, $00, $00, $00                ; $01880A |

  db $02, $DF, $14, $B9, $06                ; $01880F |
  db $00, $B4, $0E, $D8, $09                ; $018814 |
  db $00, $F2, $20, $DF, $07                ; $018819 |
  db $00, $A0, $16, $7A, $0C                ; $01881E |
  db $01, $9B, $15, $BC, $07                ; $018823 |
  db $00, $EA, $1A, $D3, $08                ; $018828 |
  db $00, $E0, $08, $00, $00                ; $01882D |

  db $02, $E5, $17, $B9, $06                ; $018832 |
  db $00, $A4, $0C, $D9, $08                ; $018837 |
  db $00, $F0, $1F, $E2, $07                ; $01883C |
  db $00, $9A, $15, $79, $0C                ; $018841 |
  db $01, $A0, $13, $B9, $07                ; $018846 |
  db $00, $EC, $14, $D7, $08                ; $01884B |
  db $00, $EF, $08, $00, $00                ; $018850 |

  db $02, $E8, $1A, $BC, $06                ; $018855 |
  db $01, $A2, $0C, $B0, $08                ; $01885A |
  db $00, $EF, $1E, $E1, $07                ; $01885F |
  db $00, $95, $14, $7B, $0D                ; $018864 |
  db $01, $A6, $10, $BD, $07                ; $018869 |
  db $02, $F0, $14, $B6, $06                ; $01886E |
  db $00, $F9, $08, $00, $00                ; $018873 |

  db $02, $EC, $1D, $BA, $06                ; $018878 |
  db $02, $A4, $0C, $AD, $06                ; $01887D |
  db $00, $EF, $1D, $DD, $07                ; $018882 |
  db $00, $99, $17, $7A, $0C                ; $018887 |
  db $01, $B0, $0E, $B9, $07                ; $01888C |
  db $01, $EF, $14, $AF, $09                ; $018891 |
  db $00, $EF, $08, $00, $00                ; $018896 |

  db $00, $EC, $1D, $D5, $07                ; $01889B |
  db $01, $9F, $13, $B8, $07                ; $0188A0 |
  db $00, $EE, $1C, $E1, $07                ; $0188A5 |
  db $00, $9E, $17, $7A, $0C                ; $0188AA |
  db $00, $AE, $0E, $D4, $08                ; $0188AF |
  db $02, $DE, $12, $BB, $06                ; $0188B4 |
  db $00, $E0, $08, $00, $00                ; $0188B9 |

  db $00, $EF, $18, $D0, $07                ; $0188BE |
  db $01, $A5, $11, $BC, $07                ; $0188C3 |
  db $00, $EF, $1D, $E3, $07                ; $0188C8 |
  db $00, $99, $17, $79, $0C                ; $0188CD |
  db $01, $9E, $0E, $CC, $07                ; $0188D2 |
  db $02, $E1, $15, $B4, $05                ; $0188D7 |
  db $00, $EF, $08, $00, $00                ; $0188DC |

  db $02, $F2, $17, $BA, $06                ; $0188E1 |
  db $01, $AF, $0E, $B9, $07                ; $0188E6 |
  db $00, $EF, $1E, $DE, $07                ; $0188EB |
  db $00, $94, $15, $79, $0C                ; $0188F0 |
  db $01, $9C, $0B, $BC, $07                ; $0188F5 |
  db $02, $E6, $18, $BA, $06                ; $0188FA |
  db $00, $F9, $08, $00, $00                ; $0188FF |

  db $01, $F0, $18, $A8, $08                ; $018904 |
  db $01, $B9, $0D, $BC, $07                ; $018909 |
  db $00, $F0, $1F, $DF, $07                ; $01890E |
  db $00, $9A, $15, $79, $0C                ; $018913 |
  db $02, $9D, $0E, $AF, $08                ; $018918 |
  db $02, $EA, $1B, $B7, $06                ; $01891D |
  db $00, $EF, $08, $00, $00                ; $018922 |
; end body part frames table

; hookbill rotational values for body parts
; each chunk of 5 bytes is one frame
; each byte is an angle (how rotated it is)
; this is used by GSU when drawing
; the 5 bytes are laid out as follows:
; byte 1: legs
; byte 2: arms
; byte 3: tail
; byte 4: head
; byte 5: shell
  db $00, $00, $00, $00, $F6                ; $018927 |
  db $00, $00, $00, $00, $D5                ; $01892C |
  db $00, $00, $00, $00, $EC                ; $018931 |
  db $C0, $40, $C0, $20, $00                ; $018936 |
  db $95, $15, $95, $20, $D5                ; $01893B |
  db $60, $F0, $40, $E0, $00                ; $018940 |
  db $70, $E0, $00, $10, $00                ; $018945 |
  db $60, $D0, $40, $E8, $0C                ; $01894A |
  db $00, $A0, $00, $C0, $C8                ; $01894F |
  db $FC, $E0, $10, $C0, $C4                ; $018954 |
  db $00, $A0, $00, $B0, $B0                ; $018959 |
  db $F0, $C0, $10, $B0, $A8                ; $01895E |
  db $AC, $5C, $AC, $7C, $7C                ; $018963 |
  db $E4, $54, $C4, $64, $84                ; $018968 |
  db $78, $50, $70, $88, $70                ; $01896D |
  db $88, $80, $80, $98, $80                ; $018972 |
  db $40, $C0, $40, $A0, $80                ; $018977 |
  db $30, $B0, $30, $90, $70                ; $01897C |
  db $C0, $40, $A0, $60, $00                ; $018981 |
  db $00, $00, $00, $00, $E0                ; $018986 |
  db $00, $00, $00, $00, $20                ; $01898B |
  db $40, $C0, $40, $D0, $80                ; $018990 |
  db $00, $00, $00, $00, $80                ; $018995 |
  db $00, $00, $00, $10, $F6                ; $01899A |
  db $00, $00, $04, $10, $F6                ; $01899F |

hookbill_state_ptr:
; crawl sequence:
  dw $9312                                  ; $0189A4 | 00: restart crawl sequence - check if run needed (if yoshi is close)
  dw $9367                                  ; $0189A6 | 01: crawling a little bit on all fours

; jumping on head sequence:
  dw $9400                                  ; $0189A8 | 02: spit egg (head goes down a bit)
  dw $9417                                  ; $0189AA | 03: head nudge back up
  dw $9428                                  ; $0189AC | 04: head go back to normal, stay frozen a bit, go back to 01

; jumping on shell sequence:
  dw $9439                                  ; $0189AE | 05: spit egg (head goes down a bit)
  dw $9459                                  ; $0189B0 | 06: head nudge back up
  dw $9428                                  ; $0189B2 | 07: head go back to normal, stay frozen a bit, go back to 01

; run sequence:
  dw $946A                                  ; $0189B4 | 08: bob head slightly up (from the crawl)
  dw $9473                                  ; $0189B6 | 09: stare forward not moving for a few
  dw $946A                                  ; $0189B8 | 0A: stand up
  dw $9494                                  ; $0189BA | 0B: walk forward until yoshi close
  dw $9529                                  ; $0189BC | 0C: hunch forward
  dw $9540                                  ; $0189BE | 0D: (hit with egg while in the midst of standing up, closes eyes for a bit and skips to 0A afterward)
  dw $9563                                  ; $0189C0 | 0E: run forward until yoshi close
  dw $96AE                                  ; $0189C2 | 0F: dives at yoshi
  dw $96EC                                  ; $0189C4 | 10: landing on ground, bobbing a bit
  dw $9709                                  ; $0189C6 | 11: more landing/bobbing
  dw $973D                                  ; $0189C8 | 12: more landing/bobbing
  dw $9772                                  ; $0189CA | 13: more landing/bobbing
  dw $9780                                  ; $0189CC | 14: blinking after landing
  dw $97B8                                  ; $0189CE | 15: gets up back to a crawl

; turn around on all fours sequence:
  dw $97C9                                  ; $0189D0 | 16: body into shell
  dw $97E3                                  ; $0189D2 | 17: jump up and turn around

; turn around while standing sequence:
  dw $981D                                  ; $0189D4 | 18: jump up and retract body into shell
  dw $983D                                  ; $0189D6 | 19: rotate slightly
  dw $983D                                  ; $0189D8 | 1A: rotate again, turning fully around
  dw $9876                                  ; $0189DA | 1B: fall back down and body comes back out, switch to 09

; getting egged sequence:
  dw $9898                                  ; $0189DC | 1C: first two egg hits (init & jump to 1D immediately)
  dw $98A6                                  ; $0189DE | 1D: angle backward, cry & wobble arms, ready for the next hit
  dw $98E8                                  ; $0189E0 | 1E: if not egged again, retract back to standing, switch to 09
  dw $9903                                  ; $0189E2 | 1F: third egg hit (init & jump to 20 immediately)
  dw $9931                                  ; $0189E4 | 20: hop up in the air from the third egg hit
  dw $994A                                  ; $0189E6 | 21: fall back down while leaning backward
  dw $9991                                  ; $0189E8 | 22: lean back to center
  dw $99AE                                  ; $0189EA | 23: wobbling on back helpless
  dw $99FB                                  ; $0189EC | 24: frozen on back

; hopping in shell sequence:
  dw $9A31                                  ; $0189EE | 25: wobbling back and forth after getting hit
  dw $9A92                                  ; $0189F0 | 26: one hop toward yoshi, turning around 180 degrees
  dw $9B23                                  ; $0189F2 | 27: two hops toward yoshi in the same fashion
  dw $9BA4                                  ; $0189F4 | 28: pound onto ground, wait a bit, body come out of shell

; ground pounded sequence:
  dw $9BF9                                  ; $0189F6 | 29: initial hit, squishes & turns yellow
  dw $9C51                                  ; $0189F8 | 2A: flashes yellow then stretches back to normal

; beginning cinematic sequence:
  dw $9CC9                                  ; $0189FA | 2B: small hookbill walking over
  dw $9CF7                                  ; $0189FC | 2C: waits on kamek routine to finish (via a flag)
  dw $9D0F                                  ; $0189FE | 2D: init/prep for growing
  dw $9DE7                                  ; $018A00 | 2E: init/prep for growing
  dw $9EB6                                  ; $018A02 | 2F: small hookbill crouching down ready to grow
  dw $9F57                                  ; $018A04 | 30: turns into real hookbill shell
  dw $9F7A                                  ; $018A06 | 31: shell growing (and bobbing back and forth)
  dw $9BA4                                  ; $018A08 | 32: body comes out of shell, fight begin prep

; death sequence:
  dw $9BF9                                  ; $018A0A | 33: initially dead, turn yellow
  dw $9FE5                                  ; $018A0C | 34: flashes yellow and squishes down a bit
  dw $A099                                  ; $018A0E | 35: squishes down and down into a pancake
  dw $A1DC                                  ; $018A10 | 36: shell break, small koopa goes up then down middle
  dw $A226                                  ; $018A12 | 37: dead, final state, do boss key bullshit etc.

main_hookbill:
  LDY $1080                                 ; $018A14 |
  BEQ CODE_018A24                           ; $018A17 |
  DEY                                       ; $018A19 |
  BNE CODE_018A29                           ; $018A1A |
  JSR CODE_018D1C                           ; $018A1C |
  JSR CODE_018A50                           ; $018A1F |
  BRA CODE_018A2C                           ; $018A22 |

CODE_018A24:
  JSR CODE_018CD8                           ; $018A24 |
  BRA CODE_018A2C                           ; $018A27 |

CODE_018A29:
  JSR CODE_018CC7                           ; $018A29 |

CODE_018A2C:
  JSL $03AF23                               ; $018A2C |
  TXY                                       ; $018A30 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $018A31 |
  ASL A                                     ; $018A33 |
  TAX                                       ; $018A34 |
  JSR (hookbill_state_ptr,x)                ; $018A35 | read state pointer
  LDY $1080                                 ; $018A38 |
  BEQ CODE_018A4F                           ; $018A3B |
  DEY                                       ; $018A3D |
  BNE CODE_018A4F                           ; $018A3E |
  JSR CODE_0191BB                           ; $018A40 |
  JSR CODE_01922A                           ; $018A43 |
  JSR CODE_018A95                           ; $018A46 |
  JSR CODE_01924D                           ; $018A49 |
  JSR CODE_0192DA                           ; $018A4C |

CODE_018A4F:
  RTL                                       ; $018A4F |

; hookbill s sub
CODE_018A50:
  LDA $1060                                 ; $018A50 |
  ASL A                                     ; $018A53 |
  LDY !s_spr_facing_dir,x                   ; $018A54 |
  BEQ CODE_018A60                           ; $018A57 |
  EOR #$FFFF                                ; $018A59 |
  INC A                                     ; $018A5C |
  AND #$01FE                                ; $018A5D |

CODE_018A60:
  STA !gsu_r1                               ; $018A60 |
  LDA $1076                                 ; $018A63 |
  ASL A                                     ; $018A66 |
  STA !gsu_r6                               ; $018A67 |
  LDA $1078                                 ; $018A6A |
  ASL A                                     ; $018A6D |
  STA !gsu_r2                               ; $018A6E |
  LDX #$08                                  ; $018A71 |
  LDA #$A000                                ; $018A73 |
  JSL r_gsu_init_1                          ; $018A76 | GSU init
  LDA !gsu_r3                               ; $018A7A |
  STA !r_reg_m7b_mirror                     ; $018A7D |
  LDA !gsu_r5                               ; $018A80 |
  STA !r_reg_m7a_mirror                     ; $018A83 |
  LDA !gsu_r7                               ; $018A86 |
  STA !r_reg_m7c_mirror                     ; $018A89 |
  LDA !gsu_r8                               ; $018A8C |
  STA !r_reg_m7d_mirror                     ; $018A8F |
  LDX $12                                   ; $018A92 |
  RTS                                       ; $018A94 |

; hookbill s sub
CODE_018A95:
  LDY $1070                                 ; $018A95 |
  BEQ CODE_018AB5                           ; $018A98 |
  LDA $7974                                 ; $018A9A |
  AND #$0001                                ; $018A9D |
  BEQ CODE_018AAA                           ; $018AA0 |
  JSR CODE_018AC9                           ; $018AA2 |
  JSR CODE_018AE1                           ; $018AA5 |
  BRA CODE_018AB0                           ; $018AA8 |

CODE_018AAA:
  JSR CODE_018AB6                           ; $018AAA |
  JSR CODE_018B15                           ; $018AAD |

CODE_018AB0:
  INC $0CF9                                 ; $018AB0 |
  LDX $12                                   ; $018AB3 |

CODE_018AB5:
  RTS                                       ; $018AB5 |

; hookbill routine: draw arm
CODE_018AB6:
  LDA #$E0E1                                ; $018AB6 | arm graphic
  STA !gsu_r12                              ; $018AB9 |
  LDY #$54                                  ; $018ABC |
  LDA #$0060                                ; $018ABE |
  STA !gsu_r3                               ; $018AC1 |
  LDA $1062                                 ; $018AC4 |
  BRA CODE_018AF5                           ; $018AC7 |

; hookbill routine: draw leg
CODE_018AC9:
  LDA #$E081                                ; $018AC9 | leg graphic
  STA !gsu_r12                              ; $018ACC |
  LDY #$54                                  ; $018ACF |
  STZ !gsu_r3                               ; $018AD1 |
  LDA $1064                                 ; $018AD4 |
  BRA CODE_018AF5                           ; $018AD7 |

; hookbill: different head animation frames
; these are addresses of bank $29
  dw $E0C1                                  ; $018AD9 | default head
  dw $C0C1                                  ; $018ADB | spitting egg
  dw $C081                                  ; $018ADD | crying
  dw $C0A1                                  ; $018ADF | closing his eyes

; hookbill routine: draw head
CODE_018AE1:
  LDY $1074                                 ; $018AE1 | head animation frame
  LDA $8AD9,y                               ; $018AE4 |
  STA !gsu_r12                              ; $018AE7 |
  LDY #$54                                  ; $018AEA | rom bank
  LDA #$0040                                ; $018AEC |
  STA !gsu_r3                               ; $018AEF |
  LDA $1068                                 ; $018AF2 |

CODE_018AF5:
  STA !gsu_r5                               ; $018AF5 |
  TYA                                       ; $018AF8 |
  STA !gsu_r13                              ; $018AF9 |
  LDA $1076                                 ; $018AFC |
  STA !gsu_r6                               ; $018AFF |
  LDA $1078                                 ; $018B02 |
  STA !gsu_r11                              ; $018B05 |
  STZ !gsu_r2                               ; $018B08 |
  LDX #$08                                  ; $018B0B |
  LDA #$84A5                                ; $018B0D |
  JSL r_gsu_init_1                          ; $018B10 | gsu drawing routine
  RTS                                       ; $018B14 |

; hookbill routine: draw tail
CODE_018B15:
  LDA #$E0A1                                ; $018B15 | tail graphic
  STA !gsu_r12                              ; $018B18 |
  LDA #$0054                                ; $018B1B |
  STA !gsu_r13                              ; $018B1E |
  LDA $1066                                 ; $018B21 |
  STA !gsu_r5                               ; $018B24 |
  LDA $1076                                 ; $018B27 |
  STA !gsu_r6                               ; $018B2A |
  LDA $1078                                 ; $018B2D |
  STA !gsu_r11                              ; $018B30 |
  LDA #$0020                                ; $018B33 |
  STA !gsu_r3                               ; $018B36 |
  STZ !gsu_r2                               ; $018B39 |
  LDX #$08                                  ; $018B3C |
  LDA #$855F                                ; $018B3E |
  JSL r_gsu_init_1                          ; $018B41 | gsu drawing routine
  RTS                                       ; $018B45 |

; hookbill OAM stuff used by gsu
; split up into hookbill's body parts
; each body part is made up of 4 OAM
; entries, except tail has only 1
; each body part is split up into one or more frames
; each frame contains information for
; each individual OAM entry that composes
; the full body part
; each frame consists of:
; byte  1: OAM x offset relative to body part
; byte  2: OAM y offset relative to body part
; bytes 3 & 4: same as OAM bytes 3 & 4
; byte  5: OAM size (00 or 02)

; near leg
  db $FC, $FC, $20, $0D, $00                ; $018B46 |
  db $0C, $0C, $1E, $0D, $00                ; $018B4B |
  db $FC, $04, $0C, $0D, $02                ; $018B50 |
  db $04, $FC, $0E, $0D, $02                ; $018B55 |

  db $FC, $FC, $3A, $0D, $00                ; $018B5A |
  db $0C, $0C, $1A, $0D, $00                ; $018B5F |
  db $FC, $04, $08, $0D, $02                ; $018B64 |
  db $04, $FC, $0A, $0D, $02                ; $018B69 |

  db $F8, $F8, $C0, $0D, $02                ; $018B6E |
  db $08, $F8, $C2, $0D, $02                ; $018B73 |
  db $F8, $08, $E0, $0D, $02                ; $018B78 |
  db $08, $08, $E2, $0D, $02                ; $018B7D |

; near arm
  db $FC, $0C, $35, $0D, $00                ; $018B82 |
  db $04, $04, $26, $0D, $02                ; $018B87 |
  db $FC, $FC, $24, $0D, $02                ; $018B8C |
  db $FC, $FC, $24, $0D, $00                ; $018B91 |

  db $04, $FC, $22, $0D, $02                ; $018B96 |
  db $FC, $0C, $2C, $0D, $00                ; $018B9B |
  db $04, $04, $20, $0D, $02                ; $018BA0 |
  db $04, $04, $20, $0D, $00                ; $018BA5 |

  db $0C, $0C, $21, $0D, $00                ; $018BAA |
  db $FC, $04, $28, $0D, $02                ; $018BAF |
  db $04, $FC, $2A, $0D, $02                ; $018BB4 |
  db $04, $FC, $2A, $0D, $00                ; $018BB9 |

  db $FC, $04, $00, $0D, $02                ; $018BBE |
  db $0C, $0C, $12, $0D, $00                ; $018BC3 |
  db $04, $FC, $02, $0D, $02                ; $018BC8 |
  db $04, $FC, $02, $0D, $00                ; $018BCD |

  db $0C, $0C, $16, $0D, $00                ; $018BD2 |
  db $FC, $04, $04, $0D, $02                ; $018BD7 |
  db $04, $FC, $06, $0D, $02                ; $018BDC |
  db $04, $FC, $06, $0D, $00                ; $018BE1 |

  db $F8, $F8, $CC, $0D, $02                ; $018BE6 |
  db $08, $F8, $CE, $0D, $02                ; $018BEB |
  db $F8, $08, $EC, $0D, $02                ; $018BF0 |
  db $08, $08, $EE, $0D, $02                ; $018BF5 |

; tail
  db $00, $00, $D5, $0D, $02                ; $018BFA |

; head
  db $F8, $F8, $C8, $0D, $02                ; $018BFF |
  db $08, $F8, $CA, $0D, $02                ; $018C04 |
  db $F8, $08, $E8, $0D, $02                ; $018C09 |
  db $08, $08, $EA, $0D, $02                ; $018C0E |

; far arm
  db $FC, $0C, $35, $0F, $00                ; $018C13 |
  db $04, $04, $26, $0F, $02                ; $018C18 |
  db $FC, $FC, $24, $0F, $02                ; $018C1D |
  db $FC, $FC, $24, $0F, $00                ; $018C22 |

  db $04, $FC, $22, $0F, $02                ; $018C27 |
  db $FC, $0C, $2C, $0F, $00                ; $018C2C |
  db $04, $04, $20, $0F, $02                ; $018C31 |
  db $04, $04, $20, $0F, $00                ; $018C36 |

  db $0C, $0C, $21, $0F, $00                ; $018C3B |
  db $FC, $04, $28, $0F, $02                ; $018C40 |
  db $04, $FC, $2A, $0F, $02                ; $018C45 |
  db $04, $FC, $2A, $0F, $00                ; $018C4A |

  db $FC, $04, $00, $0F, $02                ; $018C4F |
  db $0C, $0C, $12, $0F, $00                ; $018C54 |
  db $04, $FC, $02, $0F, $02                ; $018C59 |
  db $04, $FC, $02, $0F, $00                ; $018C5E |

  db $0C, $0C, $16, $0F, $00                ; $018C63 |
  db $FC, $04, $04, $0F, $02                ; $018C68 |
  db $04, $FC, $06, $0F, $02                ; $018C6D |
  db $04, $FC, $06, $0F, $00                ; $018C72 |

  db $F8, $F8, $CC, $0F, $02                ; $018C77 |
  db $08, $F8, $CE, $0F, $02                ; $018C7C |
  db $F8, $08, $EC, $0F, $02                ; $018C81 |
  db $08, $08, $EE, $0F, $02                ; $018C86 |

; far leg
  db $FC, $FC, $20, $0F, $00                ; $018C8B |
  db $0C, $0C, $1E, $0F, $00                ; $018C90 |
  db $FC, $04, $0C, $0F, $02                ; $018C95 |
  db $04, $FC, $0E, $0F, $02                ; $018C9A |

  db $FC, $FC, $3A, $0F, $00                ; $018C9F |
  db $0C, $0C, $1A, $0F, $00                ; $018CA4 |
  db $FC, $04, $08, $0F, $02                ; $018CA9 |
  db $04, $FC, $0A, $0F, $02                ; $018CAE |

  db $F8, $F8, $C0, $0F, $02                ; $018CB3 |
  db $08, $F8, $C2, $0F, $02                ; $018CB8 |
  db $F8, $08, $E0, $0F, $02                ; $018CBD |
  db $08, $08, $E2, $0F, $02                ; $018CC2 |

; hookbill s sub
CODE_018CC7:
  REP #$10                                  ; $018CC7 |
  LDY !s_spr_oam_pointer,x                  ; $018CC9 |
  LDA $6024,y                               ; $018CCC |
  AND #$FFF0                                ; $018CCF |
  ORA #$0004                                ; $018CD2 |
  STA $6024,y                               ; $018CD5 |

CODE_018CD8:
  REP #$10                                  ; $018CD8 | entry point
  LDA #$0006                                ; $018CDA |
  STA $00                                   ; $018CDD |
  LDY !s_spr_oam_pointer,x                  ; $018CDF |
  LDA $1015                                 ; $018CE2 |
  CMP #$0002                                ; $018CE5 |
  BEQ CODE_018D03                           ; $018CE8 |

CODE_018CEA:
  LDA $6004,y                               ; $018CEA |
  AND #$F1FF                                ; $018CED |
  ORA #$0200                                ; $018CF0 |
  STA $6004,y                               ; $018CF3 |
  TYA                                       ; $018CF6 |
  CLC                                       ; $018CF7 |
  ADC #$0008                                ; $018CF8 |
  TAY                                       ; $018CFB |
  DEC $00                                   ; $018CFC |
  BNE CODE_018CEA                           ; $018CFE |
  SEP #$10                                  ; $018D00 |
  RTS                                       ; $018D02 |

CODE_018D03:
  LDA $6004,y                               ; $018D03 |
  AND #$F1FF                                ; $018D06 |
  ORA #$0C00                                ; $018D09 |
  STA $6004,y                               ; $018D0C |
  TYA                                       ; $018D0F |
  CLC                                       ; $018D10 |
  ADC #$0008                                ; $018D11 |
  TAY                                       ; $018D14 |
  DEC $00                                   ; $018D15 |
  BNE CODE_018D03                           ; $018D17 |
  SEP #$10                                  ; $018D19 |
  RTS                                       ; $018D1B |

; hookbill s sub
CODE_018D1C:
  TXA                                       ; $018D1C |
  STA !gsu_r10                              ; $018D1D |
  LDA #$0001                                ; $018D20 |\
  STA $6000                                 ; $018D23 |/ pass in rom bank
  LDA !s_spr_anim_frame,x                   ; $018D26 |
  STA $6002                                 ; $018D29 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $018D2C |
  TYA                                       ; $018D2E |
  STA $6004                                 ; $018D2F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $018D32 |
  STA $6006                                 ; $018D35 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $018D38 |
  STA $6008                                 ; $018D3B |
  LDA !s_spr_wildcard_1_lo,x                ; $018D3E |
  STA $600A                                 ; $018D41 |
  LDA !s_spr_cam_x_pos,x                    ; $018D44 |
  CLC                                       ; $018D47 |
  ADC #$0008                                ; $018D48 |
  STA $600E                                 ; $018D4B |
  LDA !s_spr_cam_y_pos,x                    ; $018D4E |
  CLC                                       ; $018D51 |
  ADC #$0008                                ; $018D52 |
  STA $6010                                 ; $018D55 |
  LDA #$8B46                                ; $018D58 |
  STA $6012                                 ; $018D5B |
  LDA #$8B82                                ; $018D5E |
  STA $6014                                 ; $018D61 |
  LDA #$8BFA                                ; $018D64 |
  STA $6016                                 ; $018D67 |
  LDA #$8BFF                                ; $018D6A |
  STA $6018                                 ; $018D6D |
  LDA #$8C13                                ; $018D70 |
  STA $601A                                 ; $018D73 |
  LDA #$8C8B                                ; $018D76 |
  STA $601C                                 ; $018D79 |
  LDA #$8297                                ; $018D7C |
  STA $601E                                 ; $018D7F |
  LDA $106A                                 ; $018D82 |
  STA $6026                                 ; $018D85 |
  LDA $106C                                 ; $018D88 |
  STA $6028                                 ; $018D8B |
  LDA $105C                                 ; $018D8E |
  STA $602A                                 ; $018D91 |
  LDA $105E                                 ; $018D94 |
  STA $602C                                 ; $018D97 |
  LDA #$8927                                ; $018D9A |
  STA $602E                                 ; $018D9D |
  LDA !s_spr_wildcard_2_lo,x                ; $018DA0 |
  STA $6030                                 ; $018DA3 |
  LDA $106E                                 ; $018DA6 |
  STA $6032                                 ; $018DA9 |
  LDA $107A                                 ; $018DAC |
  STA $6046                                 ; $018DAF |
  LDA $1076                                 ; $018DB2 |
  STA $6050                                 ; $018DB5 |
  LDA $1078                                 ; $018DB8 |
  STA $6052                                 ; $018DBB |
  LDX #$08                                  ; $018DBE |
  LDA #$A3BA                                ; $018DC0 |
  JSL r_gsu_init_1                          ; $018DC3 | GSU init
  LDX $12                                   ; $018DC7 |
  LDA $6026                                 ; $018DC9 |
  STA $106A                                 ; $018DCC |
  LDA $6028                                 ; $018DCF |
  STA $106C                                 ; $018DD2 |
  LDA $6034                                 ; $018DD5 |
  STA $1064                                 ; $018DD8 |
  LDA $6036                                 ; $018DDB |
  STA $1062                                 ; $018DDE |
  LDA $6038                                 ; $018DE1 |
  STA $1066                                 ; $018DE4 |
  LDA $603A                                 ; $018DE7 |
  STA $1068                                 ; $018DEA |
  LDA $603C                                 ; $018DED |
  STA $1060                                 ; $018DF0 |
  JSR CODE_01909B                           ; $018DF3 |
  LDY $1072                                 ; $018DF6 |
  BNE CODE_018E25                           ; $018DF9 |
  LDA !s_spr_y_terrain_offset,x             ; $018DFB |
  STA $00                                   ; $018DFE |
  LDA $603E                                 ; $018E00 |
  SEC                                       ; $018E03 |
  SBC !s_spr_cam_y_pos,x                    ; $018E04 |
  CLC                                       ; $018E07 |
  ADC #$FFFB                                ; $018E08 |
  STA !s_spr_y_terrain_offset,x             ; $018E0B |
  SEC                                       ; $018E0E |
  SBC $00                                   ; $018E0F |
  STA $00                                   ; $018E11 |
  CLC                                       ; $018E13 |
  ADC #$0004                                ; $018E14 |
  CMP #$0008                                ; $018E17 |
  BCC CODE_018E25                           ; $018E1A |
  LDA !s_spr_y_pixel_pos,x                  ; $018E1C |
  SEC                                       ; $018E1F |
  SBC $00                                   ; $018E20 |
  STA !s_spr_y_pixel_pos,x                  ; $018E22 |

CODE_018E25:
  LDA $6022                                 ; $018E25 |
  STA $0A                                   ; $018E28 |
  LDA $6024                                 ; $018E2A |
  STA $0C                                   ; $018E2D |
  LDA !s_spr_cam_x_pos,x                    ; $018E2F |
  CLC                                       ; $018E32 |
  ADC #$0060                                ; $018E33 |
  CMP #$01C0                                ; $018E36 |
  BCC CODE_018E43                           ; $018E39 |
  LDA #$0160                                ; $018E3B |
  STA !r_bg3_cam_x                          ; $018E3E |
  BRA CODE_018E55                           ; $018E41 |

CODE_018E43:
  LDA #$0020                                ; $018E43 |
  SEC                                       ; $018E46 |
  SBC $0A                                   ; $018E47 |
  STA !r_bg3_cam_x                          ; $018E49 |
  LDA #$001C                                ; $018E4C |
  SEC                                       ; $018E4F |
  SBC $0C                                   ; $018E50 |
  STA !r_bg3_cam_y                          ; $018E52 |

CODE_018E55:
  LDA $0A                                   ; $018E55 |
  SEC                                       ; $018E57 |
  SBC !s_spr_cam_x_pos,x                    ; $018E58 |
  STA !s_spr_x_hitbox_offset,x              ; $018E5B |
  LDA $0C                                   ; $018E5E |
  SEC                                       ; $018E60 |
  SBC !s_spr_cam_y_pos,x                    ; $018E61 |
  STA !s_spr_y_hitbox_offset,x              ; $018E64 |
  LDA #$0011                                ; $018E67 |
  STA $0B83                                 ; $018E6A |
  LDA $106E                                 ; $018E6D |
  AND #$FF00                                ; $018E70 |
  BEQ CODE_018E78                           ; $018E73 |
  STZ $106E                                 ; $018E75 |

CODE_018E78:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $018E78 |
  CPY #$33                                  ; $018E7A |
  BMI CODE_018E8B                           ; $018E7C |
  LDA $6058                                 ; $018E7E |
  SEC                                       ; $018E81 |
  SBC $6056                                 ; $018E82 |
  SEC                                       ; $018E85 |
  SBC !s_player_hitbox_half_height          ; $018E86 |
  BRA CODE_018EBE                           ; $018E89 |

CODE_018E8B:
  LDA $605A                                 ; $018E8B |
  BIT #$0001                                ; $018E8E |
  BEQ CODE_018E94                           ; $018E91 |

CODE_018E93:
  RTS                                       ; $018E93 |

CODE_018E94:
  CMP #$0008                                ; $018E94 |
  BNE CODE_018E9E                           ; $018E97 |
  LDA $6058                                 ; $018E99 |
  BPL CODE_018EA1                           ; $018E9C |

CODE_018E9E:
  JMP CODE_018F72                           ; $018E9E |

CODE_018EA1:
  SEC                                       ; $018EA1 |
  SBC $6056                                 ; $018EA2 |
  SEC                                       ; $018EA5 |
  SBC !s_player_hitbox_half_height          ; $018EA6 |
  CMP #$FFF4                                ; $018EA9 |
  BCC CODE_018E9E                           ; $018EAC |
  LDY $60AB                                 ; $018EAE |
  BMI CODE_018E93                           ; $018EB1 |
  LDY !s_spr_anim_frame,x                   ; $018EB3 |
  CPY #$28                                  ; $018EB6 |
  BPL CODE_018F38                           ; $018EB8 |
  CPY #$21                                  ; $018EBA |
  BMI CODE_018F38                           ; $018EBC |

CODE_018EBE:
  CLC                                       ; $018EBE |
  ADC #$0003                                ; $018EBF |
  CLC                                       ; $018EC2 |
  ADC !s_player_y                           ; $018EC3 |
  STA !s_player_y                           ; $018EC6 |
  STZ !s_player_y_speed                     ; $018EC9 |
  STZ !s_player_jump_state                  ; $018ECC |
  INC !s_on_sprite_platform_flag            ; $018ECF |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $018ED2 |
  CPY #$29                                  ; $018ED4 |
  BEQ CODE_018EE0                           ; $018ED6 |
  CPY #$2A                                  ; $018ED8 |
  BEQ CODE_018EE0                           ; $018EDA |
  CPY #$33                                  ; $018EDC |
  BMI CODE_018EE7                           ; $018EDE |

CODE_018EE0:
  LDA #$0029                                ; $018EE0 |
  STA !s_player_cur_anim_frame              ; $018EE3 |
  RTS                                       ; $018EE6 |

CODE_018EE7:
  LDY !s_player_ground_pound_state          ; $018EE7 |
  BEQ CODE_018F37                           ; $018EEA |
  LDY $107E                                 ; $018EEC |
  CPY $107C                                 ; $018EEF |
  BNE CODE_018F37                           ; $018EF2 |
  LDA #$0060                                ; $018EF4 |
  STA !s_spr_timer_3,x                      ; $018EF7 |
  LDA #$0002                                ; $018EFA |
  STA !s_player_state                       ; $018EFD |
  LDA #$0029                                ; $018F00 |
  INC $107C                                 ; $018F03 |
  INC $107C                                 ; $018F06 |
  LDY $107C                                 ; $018F09 |
  CPY #$06                                  ; $018F0C |
  BNE CODE_018F1A                           ; $018F0E |
  JSL $02A982                               ; $018F10 |
  INC $0B7B                                 ; $018F14 |
  LDA #$0033                                ; $018F17 |

CODE_018F1A:
  STA !s_spr_wildcard_5_lo_dp,x             ; $018F1A |
  LDA #$0001                                ; $018F1C |
  STA !s_spr_gsu_morph_1_lo,x               ; $018F1F |
  LDY #$24                                  ; $018F22 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $018F24 |
  LDY #$0F                                  ; $018F26 |
  STY $105E                                 ; $018F28 |
  LDA #$0030                                ; $018F2B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $018F2E |
  LDA #$0080                                ; $018F30 |\ play sound #$0080
  JSL push_sound_queue                      ; $018F33 |/

CODE_018F37:
  RTS                                       ; $018F37 |

CODE_018F38:
  LDA #$001C                                ; $018F38 |\ play sound #$001C
  JSL push_sound_queue                      ; $018F3B |/
  LDY !s_spr_wildcard_5_lo_dp,x             ; $018F3F |
  CPY #$0A                                  ; $018F41 |
  BMI CODE_018F5B                           ; $018F43 |
  LDA #$FC00                                ; $018F45 |
  STA !s_player_y_speed                     ; $018F48 |
  LDA #$0006                                ; $018F4B |
  STA !s_player_jump_state                  ; $018F4E |
  LDA #$8001                                ; $018F51 |
  STA !s_player_flutter_state               ; $018F54 |
  STZ !s_player_ground_pound_state          ; $018F57 |
  RTS                                       ; $018F5A |

CODE_018F5B:
  JSR CODE_018FE3                           ; $018F5B |
  LDA !s_spr_anim_frame,x                   ; $018F5E |
  AND #$0007                                ; $018F61 |
  CLC                                       ; $018F64 |
  ADC #$0028                                ; $018F65 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $018F68 |
  LDY #$05                                  ; $018F6A |
  STY !s_spr_wildcard_5_lo_dp,x             ; $018F6C |
  LDY #$18                                  ; $018F6E |
  BRA CODE_018FBD                           ; $018F70 |

CODE_018F72:
  CMP #$0006                                ; $018F72 |
  BNE CODE_018F7C                           ; $018F75 |
  LDA $6058                                 ; $018F77 |
  BPL CODE_018F7F                           ; $018F7A |

CODE_018F7C:
  JMP CODE_018FD4                           ; $018F7C |

CODE_018F7F:
  SEC                                       ; $018F7F |
  SBC $6056                                 ; $018F80 |
  SEC                                       ; $018F83 |
  SBC !s_player_hitbox_half_height          ; $018F84 |
  CMP #$FFF4                                ; $018F87 |
  BCC CODE_018F7C                           ; $018F8A |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $018F8C |
  CPY #$0A                                  ; $018F8E |
  BMI CODE_018FA8                           ; $018F90 |
  LDA #$FB00                                ; $018F92 |
  STA !s_player_y_speed                     ; $018F95 |
  LDA #$0006                                ; $018F98 |
  STA !s_player_jump_state                  ; $018F9B |
  LDA #$8001                                ; $018F9E |
  STA !s_player_flutter_state               ; $018FA1 |
  STZ !s_player_ground_pound_state          ; $018FA4 |
  RTS                                       ; $018FA7 |

CODE_018FA8:
  LDY $60AB                                 ; $018FA8 |
  BMI CODE_018F37                           ; $018FAB |
  JSR CODE_018FE3                           ; $018FAD |
  LDA #$0039                                ; $018FB0 |\ play sound #$0039
  JSL push_sound_queue                      ; $018FB3 |/
  LDY #$02                                  ; $018FB7 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $018FB9 |
  LDY #$17                                  ; $018FBB |

CODE_018FBD:
  STY $105E                                 ; $018FBD |
  LDA #$0001                                ; $018FC0 |
  STA !s_spr_gsu_morph_1_lo,x               ; $018FC3 |
  INC $1070                                 ; $018FC6 |
  LDY #$02                                  ; $018FC9 |
  STY $1074                                 ; $018FCB |
  LDA #$0040                                ; $018FCE |
  STA !s_spr_wildcard_4_lo_dp,x             ; $018FD1 |
  RTS                                       ; $018FD3 |

CODE_018FD4:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $018FD4 |
  CPY #$1C                                  ; $018FD6 |
  BMI CODE_018FDE                           ; $018FD8 |
  CPY #$27                                  ; $018FDA |
  BMI CODE_018FE2                           ; $018FDC |

CODE_018FDE:
  JSL player_hit_sprite                     ; $018FDE |

CODE_018FE2:
  RTS                                       ; $018FE2 |

; hookbill s sub
CODE_018FE3:
  LDA #$FB00                                ; $018FE3 |
  STA !s_player_y_speed                     ; $018FE6 |
  LDA #$0006                                ; $018FE9 |
  STA !s_player_jump_state                  ; $018FEC |
  LDA #$8001                                ; $018FEF |
  STA !s_player_flutter_state               ; $018FF2 |
  STZ !s_player_ground_pound_state          ; $018FF5 |
  LDA $10                                   ; $018FF8 |
  AND #$003E                                ; $018FFA |
  STA !gsu_r1                               ; $018FFD |
  LDA #$FD00                                ; $019000 |
  STA !gsu_r6                               ; $019003 |
  LDX #$0B                                  ; $019006 |
  LDA #$8595                                ; $019008 |
  JSL r_gsu_init_1                          ; $01900B | GSU init
  LDX $12                                   ; $01900F |
  LDA !gsu_r0                               ; $019011 |
  LDY !s_spr_facing_dir,x                   ; $019014 |
  BEQ CODE_01901D                           ; $019017 |
  EOR #$FFFF                                ; $019019 |
  INC A                                     ; $01901C |

CODE_01901D:
  STA $00                                   ; $01901D |
  LDA !gsu_r1                               ; $01901F |
  STA $04                                   ; $019022 |
  LDA !s_spr_x_hitbox_center,x              ; $019024 |
  CLC                                       ; $019027 |
  ADC $6040                                 ; $019028 |
  SEC                                       ; $01902B |
  SBC #$0008                                ; $01902C |
  STA $0A                                   ; $01902F |
  LDA !s_spr_y_hitbox_center,x              ; $019031 |
  CLC                                       ; $019034 |
  ADC $6054                                 ; $019035 |
  SEC                                       ; $019038 |
  SBC #$0004                                ; $019039 |
  STA $0C                                   ; $01903C |
  LDX #$09                                  ; $01903E |
  LDA #$91D5                                ; $019040 |
  JSL r_gsu_init_1                          ; $019043 | GSU init
  LDX $12                                   ; $019047 |
  LDY !gsu_r6                               ; $019049 |
  CPY #$06                                  ; $01904C |
  BMI CODE_019077                           ; $01904E |

CODE_019050:
  STZ $02                                   ; $019050 |
  JSL $0EEBFA                               ; $019052 |
  LDA $04                                   ; $019056 |
  STA $71E2,y                               ; $019058 |
  LDA #$0028                                ; $01905B |
  STA $7002,y                               ; $01905E |
  LDA #$0005                                ; $019061 |
  STA $7462,y                               ; $019064 |
  LDA #$0000                                ; $019067 |
  STA $75A2,y                               ; $01906A |
  LDA #$0008                                ; $01906D |
  STA $7502,y                               ; $019070 |
  STA $7500,y                               ; $019073 |
  RTS                                       ; $019076 |

CODE_019077:
  LDA #$0025                                ; $019077 |
  JSL spawn_sprite_active                   ; $01907A | spawn egg
  BCC CODE_019050                           ; $01907E |
  LDA $0A                                   ; $019080 |
  STA !s_spr_x_pixel_pos,y                  ; $019082 |
  LDA $0C                                   ; $019085 |
  STA !s_spr_y_pixel_pos,y                  ; $019087 |
  LDA $00                                   ; $01908A |
  STA !s_spr_x_speed_lo,y                   ; $01908C |
  LDA $04                                   ; $01908F |
  STA !s_spr_y_speed_lo,y                   ; $019091 |
  LDA #$0040                                ; $019094 |
  STA !s_spr_y_accel,y                      ; $019097 |
  RTS                                       ; $01909A |

; hookbill s sub
CODE_01909B:
  LDA !s_spr_x_hitbox_center,x              ; $01909B |
  PHA                                       ; $01909E |
  CLC                                       ; $01909F |
  ADC $6040                                 ; $0190A0 |
  STA !s_spr_x_hitbox_center,x              ; $0190A3 |
  LDA !s_spr_y_hitbox_center,x              ; $0190A6 |
  PHA                                       ; $0190A9 |
  CLC                                       ; $0190AA |
  ADC $6054                                 ; $0190AB |
  STA !s_spr_y_hitbox_center,x              ; $0190AE |
  LDA !s_spr_hitbox_width,x                 ; $0190B1 |
  PHA                                       ; $0190B4 |
  LDA !s_spr_hitbox_height,x                ; $0190B5 |
  PHA                                       ; $0190B8 |
  LDA #$000C                                ; $0190B9 |
  STA !s_spr_hitbox_width,x                 ; $0190BC |
  STA !s_spr_hitbox_height,x                ; $0190BF |
  TXA                                       ; $0190C2 |
  STA !gsu_r1                               ; $0190C3 |
  LDX #$09                                  ; $0190C6 |
  LDA #$9011                                ; $0190C8 |
  JSL r_gsu_init_1                          ; $0190CB | GSU init
  BRA CODE_0190DA                           ; $0190CF |

CODE_0190D1:
  LDX #$09                                  ; $0190D1 |
  LDA !gsu_r15                              ; $0190D3 |
  JSL r_gsu_init_1                          ; $0190D6 | GSU init

CODE_0190DA:
  LDX $12                                   ; $0190DA |
  LDY !gsu_r14                              ; $0190DC |
  BMI CODE_019123                           ; $0190DF |
  BEQ CODE_019123                           ; $0190E1 |
  LDA !s_spr_collision_state,y              ; $0190E3 |
  BEQ CODE_0190D1                           ; $0190E6 |
  LDA !s_spr_x_speed_lo,y                   ; $0190E8 |
  STA $00                                   ; $0190EB |
  LDA !s_spr_y_accel,y                      ; $0190ED |
  STA $02                                   ; $0190F0 |
  TYX                                       ; $0190F2 |
  JSL $03B24B                               ; $0190F3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0190F7 |
  CPY #$0B                                  ; $0190F9 |
  BPL CODE_019120                           ; $0190FB |
  INC $1070                                 ; $0190FD |
  LDY #$06                                  ; $019100 |
  STY $1074                                 ; $019102 |
  LDY #$17                                  ; $019105 |
  STY $105E                                 ; $019107 |
  LDA #$0020                                ; $01910A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01910D |
  LSR A                                     ; $01910F |
  STA !s_spr_timer_1,x                      ; $019110 |
  LDY #$0D                                  ; $019113 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019115 |
  LDA #$003F                                ; $019117 |\ play sound #$003F
  JSL push_sound_queue                      ; $01911A |/
  BRA CODE_019123                           ; $01911E |

CODE_019120:
  JSR CODE_01913C                           ; $019120 |

CODE_019123:
  PLA                                       ; $019123 |
  STA !s_spr_hitbox_height,x                ; $019124 |
  PLA                                       ; $019127 |
  STA !s_spr_hitbox_width,x                 ; $019128 |
  PLA                                       ; $01912B |
  STA !s_spr_y_hitbox_center,x              ; $01912C |
  PLA                                       ; $01912F |
  STA !s_spr_x_hitbox_center,x              ; $019130 |

CODE_019133:
  RTS                                       ; $019133 |

; hookbill animation frames
  db $1D, $1F                               ; $019134 |

; hookbill second set of frames
  db $08, $0A                               ; $019136 |

; data table
  dw $0200                                  ; $019138 |
  dw $FE00                                  ; $01913A |

; hookbill s sub
CODE_01913C:
  LDA $02                                   ; $01913C |
  BNE CODE_019133                           ; $01913E |
  LDA !s_spr_facing_dir,x                   ; $019140 |
  DEC A                                     ; $019143 |
  EOR $00                                   ; $019144 |
  BPL CODE_019133                           ; $019146 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $019148 |
  CPY #$0F                                  ; $01914A |
  BMI CODE_019156                           ; $01914C |
  CPY #$1C                                  ; $01914E |
  BMI CODE_0191BA                           ; $019150 |
  CPY #$1F                                  ; $019152 |
  BPL CODE_0191BA                           ; $019154 |

CODE_019156:
  INC $1070                                 ; $019156 | entry point
  LDA #$FE00                                ; $019159 |
  STA !s_spr_wildcard_1_lo,x                ; $01915C |
  STZ !s_spr_gsu_morph_2_lo,x               ; $01915F |
  STZ !s_spr_gsu_morph_1_lo,x               ; $019162 |
  INC $107A                                 ; $019165 |
  LDY $107A                                 ; $019168 |
  CPY #$03                                  ; $01916B |
  BMI CODE_01919D                           ; $01916D |
  LDY !s_spr_facing_dir,x                   ; $01916F |
  LDA $9138,y                               ; $019172 |
  STA !s_spr_x_speed_lo,x                   ; $019175 |
  INC $106E                                 ; $019178 |
  INC $1072                                 ; $01917B |
  LDA #$0012                                ; $01917E |
  STA !s_spr_y_terrain_offset,x             ; $019181 |
  LDY #$21                                  ; $019184 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019186 |
  LDY #$0C                                  ; $019188 |
  STY $105E                                 ; $01918A |
  LDA #$FC00                                ; $01918D |
  STA !s_spr_y_speed_lo,x                   ; $019190 |
  LDA #$0020                                ; $019193 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019196 |
  LDY #$1F                                  ; $019198 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $01919A |
  RTS                                       ; $01919C |

CODE_01919D:
  SEP #$20                                  ; $01919D |
  LDA $9133,y                               ; $01919F |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0191A2 |
  LDA $9135,y                               ; $0191A4 |
  STA $105E                                 ; $0191A7 |
  REP #$20                                  ; $0191AA |
  LDA #$0020                                ; $0191AC |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0191AF |
  LDY #$04                                  ; $0191B1 |
  STY $1074                                 ; $0191B3 |
  LDY #$1C                                  ; $0191B6 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0191B8 |

CODE_0191BA:
  RTS                                       ; $0191BA |

; hookbill s sub
CODE_0191BB:
  TXA                                       ; $0191BB |
  STA !gsu_r1                               ; $0191BC |
  LDX #$09                                  ; $0191BF |
  LDA #$9011                                ; $0191C1 |
  JSL r_gsu_init_1                          ; $0191C4 | GSU init
  BRA CODE_0191D3                           ; $0191C8 |

CODE_0191CA:
  LDX #$09                                  ; $0191CA |
  LDA !gsu_r15                              ; $0191CC |
  JSL r_gsu_init_1                          ; $0191CF | gsu : picking up where left off?

CODE_0191D3:
  LDX $12                                   ; $0191D3 |
  LDY !gsu_r14                              ; $0191D5 |
  BMI CODE_0191BA                           ; $0191D8 |
  BEQ CODE_0191BA                           ; $0191DA |
  LDA !s_spr_state,y                        ; $0191DC |
  CMP #$0010                                ; $0191DF |
  BNE CODE_0191CA                           ; $0191E2 |
  LDA !s_spr_collision_state,y              ; $0191E4 |
  BEQ CODE_0191CA                           ; $0191E7 |
  LDA !s_spr_y_accel,y                      ; $0191E9 |
  STA $00                                   ; $0191EC |
  LDA !s_spr_x_speed_lo,y                   ; $0191EE |
  STA $02                                   ; $0191F1 |
  TYX                                       ; $0191F3 |
  PHY                                       ; $0191F4 |
  JSL $03B24B                               ; $0191F5 |
  PLY                                       ; $0191F9 |
  LDA $00                                   ; $0191FA |
  BNE CODE_0191CA                           ; $0191FC |
  LDA !s_spr_facing_dir,x                   ; $0191FE |
  DEC A                                     ; $019201 |
  EOR $02                                   ; $019202 |
  BPL CODE_0191CA                           ; $019204 |
  LDA !s_spr_y_hitbox_center,y              ; $019206 |
  SEC                                       ; $019209 |
  SBC !s_spr_y_hitbox_center,x              ; $01920A |
  BPL CODE_0191CA                           ; $01920D |
  LDA #$003F                                ; $01920F |\ play sound #$003F
  JSL push_sound_queue                      ; $019212 |/
  LDY $107A                                 ; $019216 |
  CPY #$02                                  ; $019219 |
  BMI CODE_0191CA                           ; $01921B |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01921D |
  CPY #$1C                                  ; $01921F |
  BMI CODE_0191CA                           ; $019221 |
  CPY #$1F                                  ; $019223 |
  BPL CODE_0191CA                           ; $019225 |
  JMP CODE_019156                           ; $019227 |

; hookbill s sub
CODE_01922A:
  LDA !s_spr_gsu_morph_1_lo,x               ; $01922A |
  CLC                                       ; $01922D |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $01922E |
  CMP #$0100                                ; $019230 |
  BMI CODE_019249                           ; $019233 |
  SEP #$20                                  ; $019235 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $019237 |
  STA !s_spr_anim_frame,x                   ; $019239 | previous animation frame into 7402,x
  REP #$20                                  ; $01923C |
  LDA $105E                                 ; $01923E |
  STA $105C                                 ; $019241 | loads previous 105E frame value into 105C
  LDA #$0000                                ; $019244 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019247 |

CODE_019249:
  STA !s_spr_gsu_morph_1_lo,x               ; $019249 |

CODE_01924C:
  RTS                                       ; $01924C |

; hookbill s sub
CODE_01924D:
  LDA !s_spr_timer_3,x                      ; $01924D |
  BEQ CODE_01924C                           ; $019250 |
  DEC A                                     ; $019252 |
  BEQ CODE_019291                           ; $019253 |
  AND #$0004                                ; $019255 |
  BNE CODE_019291                           ; $019258 |
  LDX #$14                                  ; $01925A |

CODE_01925C:
  LDA $5FA570,x                             ; $01925C |
  STA $702D6E,x                             ; $019260 |
  STA $702002,x                             ; $019264 |
  STA $702F2E,x                             ; $019268 |
  STA $7021C2,x                             ; $01926C |
  STA $702F4E,x                             ; $019270 |
  STA $7021E2,x                             ; $019274 |
  DEX                                       ; $019278 |
  DEX                                       ; $019279 |
  BPL CODE_01925C                           ; $01927A |
  LDX #$06                                  ; $01927C |

CODE_01927E:
  LDA $5FA586,x                             ; $01927E |
  STA $702D84,x                             ; $019282 |
  STA $702018,x                             ; $019286 |
  DEX                                       ; $01928A |
  DEX                                       ; $01928B |
  BPL CODE_01927E                           ; $01928C |
  LDX $12                                   ; $01928E |
  RTS                                       ; $019290 |

CODE_019291:
  LDX #$1C                                  ; $019291 |

CODE_019293:
  LDA $5FDA80,x                             ; $019293 |
  STA $702D6E,x                             ; $019297 |
  STA $702002,x                             ; $01929B |
  LDA $5FDAA0,x                             ; $01929F |
  STA $702F2E,x                             ; $0192A3 |
  STA $7021C2,x                             ; $0192A7 |
  LDA $5FDAC0,x                             ; $0192AB |
  STA $702F4E,x                             ; $0192AF |
  STA $7021E2,x                             ; $0192B3 |
  DEX                                       ; $0192B7 |
  DEX                                       ; $0192B8 |
  BPL CODE_019293                           ; $0192B9 |
  LDA $5FDA9E                               ; $0192BB |
  STA $702F2C                               ; $0192BF |
  STA $7021C0                               ; $0192C3 |
  LDA $5FDABE                               ; $0192C7 |
  STA $702F4C                               ; $0192CB |
  STA $7021E0                               ; $0192CF |
  LDX $12                                   ; $0192D3 |
  RTS                                       ; $0192D5 |

; data table
  dw $FF20                                  ; $0192D6 |
  dw $00E0                                  ; $0192D8 |

; hookbill s sub
CODE_0192DA:
  LDA !s_spr_x_pixel_pos,x                  ; $0192DA |
  SEC                                       ; $0192DD |
  SBC $1082                                 ; $0192DE |
  CLC                                       ; $0192E1 |
  ADC #$00E0                                ; $0192E2 |
  CMP #$01C0                                ; $0192E5 |
  BCC CODE_019311                           ; $0192E8 |
  STA $00                                   ; $0192EA |
  LDA !s_spr_x_speed_lo,x                   ; $0192EC |
  BNE CODE_0192F5                           ; $0192EF |
  LDA !s_spr_facing_dir,x                   ; $0192F1 |
  DEC A                                     ; $0192F4 |

CODE_0192F5:
  EOR $00                                   ; $0192F5 |
  BMI CODE_019311                           ; $0192F7 |
  LDY #$00                                  ; $0192F9 |
  LDA $00                                   ; $0192FB |
  BMI CODE_019301                           ; $0192FD |
  INY                                       ; $0192FF |
  INY                                       ; $019300 |

CODE_019301:
  LDA $1082                                 ; $019301 |
  CLC                                       ; $019304 |
  ADC $92D6,y                               ; $019305 |
  STA !s_spr_x_pixel_pos,x                  ; $019308 |
  STZ !s_spr_x_speed_lo,x                   ; $01930B |
  STZ !s_spr_x_accel,x                      ; $01930E |

CODE_019311:
  RTS                                       ; $019311 |

hookbill_start_crawl:
  TYX                                       ; $019312 |
  LDY #$01                                  ; $019313 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019315 |
  LDA #$0040                                ; $019317 |
  STA !s_spr_timer_2,x                      ; $01931A |
  LDA $10                                   ; $01931D |
  AND #$0001                                ; $01931F |
  BEQ CODE_019366                           ; $019322 |
  LDA !s_spr_x_pixel_pos,x                  ; $019324 |
  SEC                                       ; $019327 |
  SBC $1082                                 ; $019328 |
  CLC                                       ; $01932B |
  ADC #$00A0                                ; $01932C |
  CMP #$0140                                ; $01932F |
  BCC CODE_01933E                           ; $019332 |
  STA $00                                   ; $019334 |
  LDA !s_spr_facing_dir,x                   ; $019336 |
  DEC A                                     ; $019339 |
  EOR $00                                   ; $01933A |
  BPL CODE_019366                           ; $01933C |

CODE_01933E:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01933E |
  AND #$0007                                ; $019340 |
  CLC                                       ; $019343 |
  ADC #$0028                                ; $019344 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019347 |
  LDY #$18                                  ; $019349 |
  STY $105E                                 ; $01934B |
  LDA #$0001                                ; $01934E |
  STA !s_spr_gsu_morph_1_lo,x               ; $019351 |
  INC $1070                                 ; $019354 |
  LDA #$0020                                ; $019357 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01935A |
  LDA #$0040                                ; $01935C |
  STA !s_spr_timer_1,x                      ; $01935F |
  LDY #$08                                  ; $019362 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019364 |

CODE_019366:
  RTS                                       ; $019366 |

hookbill_crawl_forward:
  TYX                                       ; $019367 |
  STZ $105C                                 ; $019368 |
  STZ $105E                                 ; $01936B |
  STZ $1070                                 ; $01936E |
  LDA #$FE00                                ; $019371 |
  STA !s_spr_wildcard_1_lo,x                ; $019374 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $019377 |
  LDA !s_spr_timer_1,x                      ; $01937A |
  BNE CODE_0193B6                           ; $01937D |
  LDA #$0020                                ; $01937F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019382 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019384 |
  BNE CODE_0193B6                           ; $019387 |
  LDA !s_spr_timer_2,x                      ; $019389 |
  BNE CODE_019391                           ; $01938C |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $01938E |
  RTS                                       ; $019390 |

CODE_019391:
  SEP #$20                                  ; $019391 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $019393 |
  INC A                                     ; $019395 |
  AND #$07                                  ; $019396 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019398 |
  REP #$20                                  ; $01939A |
  LDA !s_spr_anim_frame,x                   ; $01939C |
  AND #$0003                                ; $01939F |
  BNE CODE_0193B6                           ; $0193A2 |
  LDA #$0008                                ; $0193A4 |
  STA !s_spr_timer_1,x                      ; $0193A7 |
  LDA #$0056                                ; $0193AA |\ play sound #$0056
  JSL push_sound_queue                      ; $0193AD |/
  INC !s_spr_gsu_morph_1_lo,x               ; $0193B1 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0193B4 |

CODE_0193B6:
  JSR CODE_0193BA                           ; $0193B6 |
  RTS                                       ; $0193B9 |

; hookbill s sub
CODE_0193BA:
  LDA !s_spr_x_player_dir,x                 ; $0193BA |
  AND #$00FF                                ; $0193BD |
  CMP !s_spr_facing_dir,x                   ; $0193C0 |
  BEQ CODE_0193FF                           ; $0193C3 |
  INC $1070                                 ; $0193C5 |
  INC $106E                                 ; $0193C8 |
  LDA #$FE00                                ; $0193CB |
  STA !s_spr_wildcard_1_lo,x                ; $0193CE |
  STZ !s_spr_gsu_morph_2_lo,x               ; $0193D1 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0193D4 |
  LDY #$18                                  ; $0193D7 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0193D9 |
  LDY #$03                                  ; $0193DB |
  STY $105E                                 ; $0193DD |
  LDA #$0010                                ; $0193E0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0193E3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0193E5 |
  CPY #$01                                  ; $0193E7 |
  BNE CODE_0193F0                           ; $0193E9 |
  LDY #$16                                  ; $0193EB |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0193ED |
  RTS                                       ; $0193EF |

CODE_0193F0:
  LDA #$FC00                                ; $0193F0 |
  STA !s_spr_y_speed_lo,x                   ; $0193F3 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $0193F6 |
  INC $105E                                 ; $0193F8 |
  LDY #$18                                  ; $0193FB |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0193FD |

CODE_0193FF:
  RTS                                       ; $0193FF |

; when jumping on his head as opposed to shell
hookbill_head_spit_egg:
  TYX                                       ; $019400 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019401 |
  BNE CODE_019416                           ; $019404 |
  STZ $105E                                 ; $019406 |
  LDA #$0040                                ; $019409 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01940C |
  LDA #$0030                                ; $01940E |
  STA !s_spr_timer_1,x                      ; $019411 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019414 |

CODE_019416:
  RTS                                       ; $019416 |

hookbill_head_nudge_up:
  TYX                                       ; $019417 |
  LDA !s_spr_timer_1,x                      ; $019418 |
  BNE CODE_019427                           ; $01941B |
  STZ $1074                                 ; $01941D |
  LDA #$0080                                ; $019420 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019423 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019425 |

CODE_019427:
  RTS                                       ; $019427 |

hookbill_head_back:
  TYX                                       ; $019428 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019429 |
  BNE CODE_019438                           ; $01942C |
  LDA #$0040                                ; $01942E |
  STA !s_spr_timer_2,x                      ; $019431 |
  LDY #$01                                  ; $019434 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019436 |

CODE_019438:
  RTS                                       ; $019438 |

; when jumping on his shell as opposed to head
hookbill_shell_spit_egg:
  TYX                                       ; $019439 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01943A |
  BNE CODE_019458                           ; $01943D |
  LDA !s_spr_anim_frame,x                   ; $01943F |
  SEC                                       ; $019442 |
  SBC #$0028                                ; $019443 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019446 |
  STZ $105E                                 ; $019448 |
  LDA #$0040                                ; $01944B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01944E |
  LDA #$0030                                ; $019450 |
  STA !s_spr_timer_1,x                      ; $019453 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019456 |

CODE_019458:
  RTS                                       ; $019458 |

hookbill_shell_nudge_up:
  TYX                                       ; $019459 |
  LDA !s_spr_timer_1,x                      ; $01945A |
  BNE CODE_019469                           ; $01945D |
  STZ $1074                                 ; $01945F |
  LDA #$0080                                ; $019462 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019465 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019467 |

CODE_019469:
  RTS                                       ; $019469 |

hookbill_stand_up:
  TYX                                       ; $01946A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01946B |
  BNE CODE_019472                           ; $01946E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019470 |

CODE_019472:
  RTS                                       ; $019472 |

hookbill_stare_forward:
  TYX                                       ; $019473 |
  LDA !s_spr_timer_1,x                      ; $019474 |
  BNE CODE_019493                           ; $019477 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019479 |

CODE_01947B:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01947B | entry point
  SEC                                       ; $01947D |
  SBC #$0029                                ; $01947E |
  AND #$0007                                ; $019481 |
  ORA #$0008                                ; $019484 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019487 |
  LDY #$01                                  ; $019489 |
  STY $105E                                 ; $01948B |
  LDA #$0008                                ; $01948E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019491 |

CODE_019493:
  RTS                                       ; $019493 |

hookbill_walk_forward:
  TYX                                       ; $019494 |
  LDA #$0001                                ; $019495 |
  STA $105C                                 ; $019498 |
  STA $105E                                 ; $01949B |
  STZ $106E                                 ; $01949E |
  LDA $7974                                 ; $0194A1 |
  AND #$0001                                ; $0194A4 |
  BNE CODE_0194AC                           ; $0194A7 |
  STZ $1070                                 ; $0194A9 |

CODE_0194AC:
  LDA #$FE00                                ; $0194AC |
  STA !s_spr_wildcard_1_lo,x                ; $0194AF |
  STZ !s_spr_gsu_morph_2_lo,x               ; $0194B2 |
  LDA !s_spr_timer_1,x                      ; $0194B5 |
  BEQ CODE_0194BD                           ; $0194B8 |
  JMP CODE_019525                           ; $0194BA |

CODE_0194BD:
  LDA #$0020                                ; $0194BD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0194C0 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0194C2 |
  BNE CODE_019525                           ; $0194C5 |
  LDA !s_spr_timer_2,x                      ; $0194C7 |
  BNE CODE_0194FE                           ; $0194CA |
  LDY !s_spr_x_player_dir,x                 ; $0194CC |
  TYA                                       ; $0194CF |
  CMP !s_spr_facing_dir,x                   ; $0194D0 |
  BNE CODE_0194FE                           ; $0194D3 |
  LDA !s_spr_x_player_delta,x               ; $0194D5 |
  CLC                                       ; $0194D8 |
  ADC #$0070                                ; $0194D9 |
  CMP #$00E0                                ; $0194DC |
  BCS CODE_0194FE                           ; $0194DF |
  SEP #$20                                  ; $0194E1 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0194E3 |
  INC A                                     ; $0194E5 |
  AND #$07                                  ; $0194E6 |
  ORA #$10                                  ; $0194E8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0194EA |
  REP #$20                                  ; $0194EC |
  LDY #$02                                  ; $0194EE |
  STY $105E                                 ; $0194F0 |
  STY $1074                                 ; $0194F3 |
  LDA #$0020                                ; $0194F6 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0194F9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0194FB |
  RTS                                       ; $0194FD |

CODE_0194FE:
  SEP #$20                                  ; $0194FE |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $019500 |
  INC A                                     ; $019502 |
  AND #$07                                  ; $019503 |
  ORA #$08                                  ; $019505 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019507 |
  REP #$20                                  ; $019509 |
  LDA !s_spr_anim_frame,x                   ; $01950B |
  AND #$0003                                ; $01950E |
  BNE CODE_019525                           ; $019511 |
  LDA #$0008                                ; $019513 |
  STA !s_spr_timer_1,x                      ; $019516 |
  LDA #$0056                                ; $019519 |\ play sound #$0056
  JSL push_sound_queue                      ; $01951C |/
  INC !s_spr_gsu_morph_1_lo,x               ; $019520 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $019523 |

CODE_019525:
  JSR CODE_0193BA                           ; $019525 |
  RTS                                       ; $019528 |

hookbill_hunch_forward:
  TYX                                       ; $019529 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01952A |
  BNE CODE_01953F                           ; $01952D |
  LDA #$0040                                ; $01952F |
  STA !s_spr_timer_1,x                      ; $019532 |
  LDA #$00C0                                ; $019535 |
  STA !s_spr_timer_2,x                      ; $019538 |
  LDY #$0E                                  ; $01953B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $01953D |

CODE_01953F:
  RTS                                       ; $01953F |

hookbill_egg_hit_while_running:
  TYX                                       ; $019540 |
  LDA !s_spr_timer_1,x                      ; $019541 |
  BNE CODE_01953F                           ; $019544 |
  INC $1070                                 ; $019546 |
  STZ $1074                                 ; $019549 |
  LDY #$0A                                  ; $01954C |
  STY !s_spr_wildcard_5_lo_dp,x             ; $01954E |
  JMP CODE_01947B                           ; $019550 |

; data table
  dw $0500                                  ; $019553 |
  dw $0060                                  ; $019555 |

; data table
  dw $FD80                                  ; $019557 |
  dw $0280                                  ; $019559 |
  dw $FF40                                  ; $01955B |
  dw $00C0                                  ; $01955D |
  dw $FF00                                  ; $01955F |
  dw $0100                                  ; $019561 |

hookbill_run_forward:
  TYX                                       ; $019563 |
  LDA #$0002                                ; $019564 |
  STA $105C                                 ; $019567 |
  STA $105E                                 ; $01956A |
  LDA #$FE00                                ; $01956D |
  STA !s_spr_wildcard_1_lo,x                ; $019570 |
  LDA #$0040                                ; $019573 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019576 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019578 |
  BNE CODE_01953F                           ; $01957B |
  SEP #$20                                  ; $01957D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01957F |
  INC A                                     ; $019581 |
  AND #$07                                  ; $019582 |
  ORA #$10                                  ; $019584 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $019586 |
  REP #$20                                  ; $019588 |
  LDA !s_spr_anim_frame,x                   ; $01958A |
  AND #$0003                                ; $01958D |
  BNE CODE_019599                           ; $019590 |
  LDA #$0056                                ; $019592 |\ play sound #$0056
  JSL push_sound_queue                      ; $019595 |/

CODE_019599:
  LDY #$08                                  ; $019599 |
  LDA !s_spr_facing_dir,x                   ; $01959B |
  BEQ CODE_0195AD                           ; $01959E |
  INY                                       ; $0195A0 |
  INY                                       ; $0195A1 |
  SEC                                       ; $0195A2 |
  SBC #$0020                                ; $0195A3 |
  CMP !s_cam_x_right_boundary               ; $0195A6 |
  BPL CODE_0195D6                           ; $0195A9 |
  BRA CODE_0195BB                           ; $0195AB |

CODE_0195AD:
  LDY #$08                                  ; $0195AD |
  LDA !s_spr_x_pixel_pos,x                  ; $0195AF |
  SEC                                       ; $0195B2 |
  SBC #$0070                                ; $0195B3 |
  CMP !s_cam_x_left_boundary                ; $0195B6 |
  BMI CODE_0195D6                           ; $0195B9 |

CODE_0195BB:
  LDA !s_spr_timer_1,x                      ; $0195BB |
  BNE CODE_0195E8                           ; $0195BE |
  LDY !s_spr_x_player_dir,x                 ; $0195C0 |
  TYA                                       ; $0195C3 |
  CMP !s_spr_facing_dir,x                   ; $0195C4 |
  BEQ CODE_0195D9                           ; $0195C7 |
  LDA !s_spr_timer_2,x                      ; $0195C9 |
  BNE CODE_0195E8                           ; $0195CC |
  LDA !s_spr_facing_dir,x                   ; $0195CE |
  CLC                                       ; $0195D1 |
  ADC #$0004                                ; $0195D2 |
  TAY                                       ; $0195D5 |

CODE_0195D6:
  JMP CODE_019669                           ; $0195D6 |

CODE_0195D9:
  LDA !s_spr_x_player_delta,x               ; $0195D9 |
  STA !gsu_r1                               ; $0195DC |
  CLC                                       ; $0195DF |
  ADC #$0050                                ; $0195E0 |
  CMP #$00A0                                ; $0195E3 |
  BCC CODE_0195E9                           ; $0195E6 |

CODE_0195E8:
  RTS                                       ; $0195E8 |

CODE_0195E9:
  CLC                                       ; $0195E9 |
  ADC #$FFD0                                ; $0195EA |
  CMP #$0040                                ; $0195ED |
  BCC CODE_0195E8                           ; $0195F0 |
  LDA !s_player_x_speed_prev                ; $0195F2 |
  BMI CODE_0195FB                           ; $0195F5 |
  EOR #$FFFF                                ; $0195F7 |
  INC A                                     ; $0195FA |

CODE_0195FB:
  STA !gsu_r6                               ; $0195FB |
  LDY #$00                                  ; $0195FE |
  LDA !s_player_x_speed_prev                ; $019600 |
  EOR !gsu_r1                               ; $019603 |
  BMI CODE_01960A                           ; $019606 |
  INY                                       ; $019608 |
  INY                                       ; $019609 |

CODE_01960A:
  LDA $9553,y                               ; $01960A |
  STA !gsu_r0                               ; $01960D |
  LDX #$0B                                  ; $019610 |
  LDA #$86B6                                ; $019612 |
  JSL r_gsu_init_1                          ; $019615 | GSU init
  LDA !gsu_r1                               ; $019619 |
  STA !gsu_r6                               ; $01961C |
  LDA !gsu_r0                               ; $01961F |
  SEC                                       ; $019622 |
  SBC #$0100                                ; $019623 |
  STA !gsu_r0                               ; $019626 |
  LDX #$0B                                  ; $019629 |
  LDA #$86B6                                ; $01962B |
  JSL r_gsu_init_1                          ; $01962E | GSU init
  LDX $12                                   ; $019632 |
  LDA !gsu_r0                               ; $019634 |
  STA !s_spr_x_speed_lo,x                   ; $019637 |
  BNE CODE_019646                           ; $01963A |
  LDA !s_spr_facing_dir,x                   ; $01963C |
  CLC                                       ; $01963F |
  ADC #$0004                                ; $019640 |
  TAY                                       ; $019643 |
  BRA CODE_019669                           ; $019644 |

CODE_019646:
  LDY #$00                                  ; $019646 |
  CLC                                       ; $019648 |
  ADC #$0400                                ; $019649 |
  CMP #$0800                                ; $01964C |
  BCC CODE_019657                           ; $01964F |
  BMI CODE_019669                           ; $019651 |
  INY                                       ; $019653 |
  INY                                       ; $019654 |
  BRA CODE_019669                           ; $019655 |

CODE_019657:
  CLC                                       ; $019657 |
  ADC #$FCC0                                ; $019658 |
  CMP #$0180                                ; $01965B |
  BCS CODE_01966F                           ; $01965E |
  LDY #$04                                  ; $019660 |
  CMP #$00C0                                ; $019662 |
  BMI CODE_019669                           ; $019665 |
  INY                                       ; $019667 |
  INY                                       ; $019668 |

CODE_019669:
  LDA $9557,y                               ; $019669 |
  STA !s_spr_x_speed_lo,x                   ; $01966C |

CODE_01966F:
  INC $1070                                 ; $01966F |
  INC $106E                                 ; $019672 |
  INC $1072                                 ; $019675 |
  LDA #$000A                                ; $019678 |
  STA !s_spr_y_terrain_offset,x             ; $01967B |
  LDA #$FE00                                ; $01967E |
  STA !s_spr_wildcard_1_lo,x                ; $019681 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $019684 |
  LDY #$1A                                  ; $019687 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019689 |
  LDA #$FB00                                ; $01968B |
  STA !s_spr_y_speed_lo,x                   ; $01968E |
  LDA #$0280                                ; $019691 |
  STA !s_spr_y_accel_ceiling,x              ; $019694 |
  LDA #$0028                                ; $019697 |
  STA !s_spr_y_accel,x                      ; $01969A |
  LDY #$05                                  ; $01969D |
  STY $105E                                 ; $01969F |
  LDA #$0010                                ; $0196A2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0196A5 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0196A7 |
  RTS                                       ; $0196A9 |

; data table
  dw $FF00                                  ; $0196AA |
  dw $0100                                  ; $0196AC |

hookbill_dive:
  TYX                                       ; $0196AE |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0196AF |
  BNE CODE_0196EB                           ; $0196B2 |
  LDA $7860,x                               ; $0196B4 |
  AND #$0001                                ; $0196B7 |
  BEQ CODE_0196EB                           ; $0196BA |
  LDY !s_spr_facing_dir,x                   ; $0196BC |
  LDA $96AA,y                               ; $0196BF |
  STA !s_spr_x_speed_lo,x                   ; $0196C2 |
  LDA #$0400                                ; $0196C5 |
  STA !s_spr_y_accel_ceiling,x              ; $0196C8 |
  LDA #$0040                                ; $0196CB |
  STA !s_spr_y_accel,x                      ; $0196CE |
  LDY #$1B                                  ; $0196D1 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0196D3 |
  LDY #$06                                  ; $0196D5 |
  STY $105E                                 ; $0196D7 |
  LDA #$0020                                ; $0196DA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0196DD |
  STA !s_cam_y_small_shaking_timer          ; $0196DF |
  LDA #$0047                                ; $0196E2 |\ play sound #$0047
  JSL push_sound_queue                      ; $0196E5 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $0196E9 |

CODE_0196EB:
  RTS                                       ; $0196EB |

hookbill_dive_land:
  TYX                                       ; $0196EC |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0196ED |
  BNE CODE_019708                           ; $0196F0 |
  LDY #$1A                                  ; $0196F2 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0196F4 |
  LDY #$05                                  ; $0196F6 |
  STY $105E                                 ; $0196F8 |
  LDA #$0010                                ; $0196FB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0196FE |
  LDA #$FE00                                ; $019700 |
  STA !s_spr_y_speed_lo,x                   ; $019703 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019706 |

CODE_019708:
  RTS                                       ; $019708 |

hookbill_dive_land_2:
  TYX                                       ; $019709 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01970A |
  BNE CODE_01973C                           ; $01970D |
  LDA $7860,x                               ; $01970F |
  AND #$0001                                ; $019712 |
  BEQ CODE_01973C                           ; $019715 |
  LDY #$06                                  ; $019717 |
  STY $1074                                 ; $019719 |
  LDA #$0008                                ; $01971C |
  STA !s_spr_x_accel,x                      ; $01971F |
  LDY #$1C                                  ; $019722 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019724 |
  LDY #$07                                  ; $019726 |
  STY $105E                                 ; $019728 |
  LDA #$0020                                ; $01972B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01972E |
  STA !s_cam_y_small_shaking_timer          ; $019730 |
  LDA #$0047                                ; $019733 |\ play sound #$0047
  JSL push_sound_queue                      ; $019736 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $01973A |

CODE_01973C:
  RTS                                       ; $01973C |

hookbill_dive_land_3:
  TYX                                       ; $01973D |
  LDY #$02                                  ; $01973E |
  STY $00                                   ; $019740 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019742 |
  BNE CODE_019749                           ; $019745 |
  DEC $00                                   ; $019747 |

CODE_019749:
  LDA !s_spr_x_speed_lo,x                   ; $019749 |
  CLC                                       ; $01974C |
  ADC #$0008                                ; $01974D |
  CMP #$0010                                ; $019750 |
  BCS CODE_01975D                           ; $019753 |
  STZ !s_spr_x_accel,x                      ; $019755 |
  STZ !s_spr_x_speed_lo,x                   ; $019758 |
  DEC $00                                   ; $01975B |

CODE_01975D:
  LDY $00                                   ; $01975D |
  BNE CODE_019771                           ; $01975F |
  LDY #$1A                                  ; $019761 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019763 |
  LDY #$05                                  ; $019765 |
  STY $105E                                 ; $019767 |
  LDA #$0008                                ; $01976A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01976D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01976F |

CODE_019771:
  RTS                                       ; $019771 |

hookbill_dive_land_4:
  TYX                                       ; $019772 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019773 |
  BNE CODE_01977F                           ; $019776 |
  LDA #$0008                                ; $019778 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $01977B |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01977D |

CODE_01977F:
  RTS                                       ; $01977F |

hookbill_dive_blink:
  TYX                                       ; $019780 |
  LDA !s_spr_timer_1,x                      ; $019781 |
  BNE CODE_0197B7                           ; $019784 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019786 |
  BPL CODE_0197A8                           ; $019788 |
  LDY #$03                                  ; $01978A |
  STY !s_spr_wildcard_6_lo_dp,x             ; $01978C |
  STZ $105E                                 ; $01978E |
  LDA #$0010                                ; $019791 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019794 |
  LDA $106E                                 ; $019796 |
  ORA #$FF00                                ; $019799 |
  STA $106E                                 ; $01979C |
  STZ $1072                                 ; $01979F |
  STZ $1074                                 ; $0197A2 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0197A5 |
  RTS                                       ; $0197A7 |

CODE_0197A8:
  LDA $1074                                 ; $0197A8 |
  EOR #$0006                                ; $0197AB |
  STA $1074                                 ; $0197AE |
  LDA #$0008                                ; $0197B1 |
  STA !s_spr_timer_1,x                      ; $0197B4 |

CODE_0197B7:
  RTS                                       ; $0197B7 |

hookbill_dive_get_up:
  TYX                                       ; $0197B8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0197B9 |
  BNE CODE_0197C8                           ; $0197BC |
  LDA #$0040                                ; $0197BE |
  STA !s_spr_timer_2,x                      ; $0197C1 |
  LDY #$01                                  ; $0197C4 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0197C6 |

CODE_0197C8:
  RTS                                       ; $0197C8 |

hookbill_turnaround_retract:
  TYX                                       ; $0197C9 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0197CA |
  BNE CODE_0197E2                           ; $0197CD |
  LDA !s_spr_facing_dir,x                   ; $0197CF |
  EOR #$0002                                ; $0197D2 |
  STA !s_spr_facing_dir,x                   ; $0197D5 |
  LDA #$FC00                                ; $0197D8 |
  STA !s_spr_y_speed_lo,x                   ; $0197DB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0197DE |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0197E0 |

CODE_0197E2:
  RTS                                       ; $0197E2 |

hookbill_turnaround_jump:
  TYX                                       ; $0197E3 |
  LDY !s_spr_y_speed_hi,x                   ; $0197E4 |
  BMI CODE_01981C                           ; $0197E7 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0197E9 |
  BEQ CODE_0197FC                           ; $0197EB |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0197ED |
  LDY #$02                                  ; $0197EF |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0197F1 |
  STZ $105E                                 ; $0197F3 |
  LDA #$0010                                ; $0197F6 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0197F9 |
  RTS                                       ; $0197FB |

CODE_0197FC:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0197FC |
  BNE CODE_01981C                           ; $0197FF |
  LDA $7860,x                               ; $019801 |
  AND #$0001                                ; $019804 |
  BEQ CODE_01981C                           ; $019807 |
  LDA $106E                                 ; $019809 |
  ORA #$FF00                                ; $01980C |
  STA $106E                                 ; $01980F |
  LDA #$0040                                ; $019812 |
  STA !s_spr_timer_2,x                      ; $019815 |
  LDY #$01                                  ; $019818 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $01981A |

CODE_01981C:
  RTS                                       ; $01981C |

hookbill_turnaround_stand_retract:
  TYX                                       ; $01981D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01981E |
  BNE CODE_01983C                           ; $019821 |
  LDY !s_spr_y_speed_hi,x                   ; $019823 |
  BMI CODE_01983C                           ; $019826 |
  STZ !s_spr_y_speed_lo,x                   ; $019828 |
  STZ !s_spr_y_accel,x                      ; $01982B |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $01982E |
  LDY #$03                                  ; $019830 |
  STY $105E                                 ; $019832 |
  LDA #$0020                                ; $019835 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019838 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01983A |

CODE_01983C:
  RTS                                       ; $01983C |

hookbill_turnaround_stand_rotate:
  TYX                                       ; $01983D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01983E |
  BNE CODE_019875                           ; $019841 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $019843 |
  CPY #$19                                  ; $019845 |
  BEQ CODE_01985D                           ; $019847 |
  LDY #$0A                                  ; $019849 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $01984B |
  LDA #$0040                                ; $01984D |
  STA !s_spr_y_accel,x                      ; $019850 |
  LDA #$0010                                ; $019853 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019856 |
  LDA #$0001                                ; $019858 |
  BRA CODE_019870                           ; $01985B |

CODE_01985D:
  INC !s_spr_wildcard_6_lo_dp,x             ; $01985D |
  LDA !s_spr_facing_dir,x                   ; $01985F |
  EOR #$0002                                ; $019862 |
  STA !s_spr_facing_dir,x                   ; $019865 |
  LDA #$0020                                ; $019868 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01986B |
  LDA #$0004                                ; $01986D |

CODE_019870:
  STA $105E                                 ; $019870 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019873 |

CODE_019875:
  RTS                                       ; $019875 |

hookbill_turnaround_fall:
  TYX                                       ; $019876 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019877 |
  BNE CODE_019897                           ; $01987A |
  LDA $7860,x                               ; $01987C |
  AND #$0001                                ; $01987F |
  BEQ CODE_019897                           ; $019882 |
  LDA $106E                                 ; $019884 |
  ORA #$FF00                                ; $019887 |
  STA $106E                                 ; $01988A |
  LDA #$0040                                ; $01988D |
  STA !s_spr_timer_2,x                      ; $019890 |
  LDY #$09                                  ; $019893 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019895 |

CODE_019897:
  RTS                                       ; $019897 |

hookbill_egg_hit_init:
  TYX                                       ; $019898 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019899 |
  BNE CODE_0198A5                           ; $01989C |
  LDA #$0014                                ; $01989E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0198A1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0198A3 |

CODE_0198A5:
  RTS                                       ; $0198A5 |

hookbill_egg_hit_cry:
  TYX                                       ; $0198A6 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0198A7 |
  BNE CODE_0198E7                           ; $0198AA |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0198AC |
  BPL CODE_0198C7                           ; $0198AE |
  LDY #$06                                  ; $0198B0 |
  STY $1074                                 ; $0198B2 |
  LDY #$0A                                  ; $0198B5 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0198B7 |
  LDA #$0001                                ; $0198B9 |
  STA $105E                                 ; $0198BC |
  LDA #$0010                                ; $0198BF |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0198C2 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0198C4 |
  RTS                                       ; $0198C6 |

CODE_0198C7:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0198C7 |
  AND #$0001                                ; $0198C9 |
  ASL A                                     ; $0198CC |
  DEC A                                     ; $0198CD |
  STA $00                                   ; $0198CE |
  CLC                                       ; $0198D0 |
  ADC $105E                                 ; $0198D1 |
  STA $105E                                 ; $0198D4 |
  SEP #$20                                  ; $0198D7 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0198D9 |
  CLC                                       ; $0198DB |
  ADC $00                                   ; $0198DC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0198DE |
  REP #$20                                  ; $0198E0 |
  LDA #$0020                                ; $0198E2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0198E5 |

CODE_0198E7:
  RTS                                       ; $0198E7 |

hookbill_egg_hit_not_egged_again:
  TYX                                       ; $0198E8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0198E9 |
  BNE CODE_0198FE                           ; $0198EC |
  STZ $1074                                 ; $0198EE |
  STZ $107A                                 ; $0198F1 |
  LDA #$0040                                ; $0198F4 |
  STA !s_spr_timer_2,x                      ; $0198F7 |
  LDY #$09                                  ; $0198FA |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0198FC |

CODE_0198FE:
  RTS                                       ; $0198FE |

; data table
  dw $0100                                  ; $0198FF |
  dw $FF00                                  ; $019901 |

hookbill_egg_hit_final_init:
  TYX                                       ; $019903 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019904 |
  BNE CODE_019930                           ; $019907 |
  LDA $7860,x                               ; $019909 |
  AND #$0001                                ; $01990C |
  BEQ CODE_019930                           ; $01990F |
  LDY !s_spr_facing_dir,x                   ; $019911 |
  LDA $98FF,y                               ; $019914 |
  STA !s_spr_x_speed_lo,x                   ; $019917 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $01991A |
  INC $105E                                 ; $01991C |
  LDA #$0020                                ; $01991F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019922 |
  STA !s_cam_y_small_shaking_timer          ; $019924 |
  LDA #$0047                                ; $019927 |\ play sound #$0047
  JSL push_sound_queue                      ; $01992A |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $01992E |

CODE_019930:
  RTS                                       ; $019930 |

hookbill_egg_hit_final_hop:
  TYX                                       ; $019931 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019932 |
  BNE CODE_019949                           ; $019935 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $019937 |
  INC $105E                                 ; $019939 |
  LDA #$0010                                ; $01993C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01993F |
  LDA #$FE00                                ; $019941 |
  STA !s_spr_y_speed_lo,x                   ; $019944 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019947 |

CODE_019949:
  RTS                                       ; $019949 |

hookbill_egg_hit_final_fall:
  TYX                                       ; $01994A |
  LDA $7860,x                               ; $01994B |
  AND #$0001                                ; $01994E |
  BEQ CODE_019990                           ; $019951 |
  LDY #$06                                  ; $019953 |
  CPY $1074                                 ; $019955 |
  BEQ CODE_019964                           ; $019958 |
  STY $1074                                 ; $01995A |
  LDA #$0047                                ; $01995D |\ play sound #$0047
  JSL push_sound_queue                      ; $019960 |/

CODE_019964:
  LDA #$0008                                ; $019964 |
  STA !s_spr_x_accel,x                      ; $019967 |
  CLC                                       ; $01996A |
  ADC !s_spr_x_speed_lo,x                   ; $01996B |
  CMP #$0010                                ; $01996E |
  BCS CODE_019990                           ; $019971 |
  STZ !s_spr_x_accel,x                      ; $019973 |
  STZ !s_spr_x_speed_lo,x                   ; $019976 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019979 |
  BNE CODE_019990                           ; $01997C |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $01997E |
  DEC $105E                                 ; $019980 |
  LDA #$0008                                ; $019983 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019986 |
  LDA #$0020                                ; $019988 |
  STA !s_cam_y_small_shaking_timer          ; $01998B |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01998E |

CODE_019990:
  RTS                                       ; $019990 |

hookbill_egg_hit_final_lean:
  TYX                                       ; $019991 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019992 |
  BNE CODE_0199AD                           ; $019995 |
  LDA #$0014                                ; $019997 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $01999A |
  LDY #$04                                  ; $01999C |
  STY $1074                                 ; $01999E |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0199A1 |
  DEC $105E                                 ; $0199A3 |
  LDA #$0020                                ; $0199A6 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0199A9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0199AB |

CODE_0199AD:
  RTS                                       ; $0199AD |

hookbill_egg_hit_final_wobble:
  TYX                                       ; $0199AE |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0199AF |
  BNE CODE_0199EF                           ; $0199B2 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0199B4 |
  BPL CODE_0199CF                           ; $0199B6 |
  LDY #$02                                  ; $0199B8 |
  STY $1074                                 ; $0199BA |
  LDA #$0040                                ; $0199BD |
  STA !s_spr_timer_1,x                      ; $0199C0 |
  LDY #$18                                  ; $0199C3 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0199C5 |
  LDY #$10                                  ; $0199C7 |
  STY $105E                                 ; $0199C9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0199CC |
  RTS                                       ; $0199CE |

CODE_0199CF:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0199CF |
  AND #$0001                                ; $0199D1 |
  ASL A                                     ; $0199D4 |
  DEC A                                     ; $0199D5 |
  STA $00                                   ; $0199D6 |
  CLC                                       ; $0199D8 |
  ADC $105E                                 ; $0199D9 |
  STA $105E                                 ; $0199DC |
  SEP #$20                                  ; $0199DF |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0199E1 |
  CLC                                       ; $0199E3 |
  ADC $00                                   ; $0199E4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0199E6 |
  REP #$20                                  ; $0199E8 |
  LDA #$0020                                ; $0199EA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0199ED |

CODE_0199EF:
  LDA !s_spr_timer_2,x                      ; $0199EF |
  BNE CODE_0199FA                           ; $0199F2 |
  LDA #$0008                                ; $0199F4 |
  STA !s_spr_timer_2,x                      ; $0199F7 |

CODE_0199FA:
  RTS                                       ; $0199FA |

hookbill_egg_hit_final_freeze:
  TYX                                       ; $0199FB |
  LDA !s_spr_timer_1,x                      ; $0199FC |
  BNE CODE_019A2C                           ; $0199FF |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019A01 |
  BEQ CODE_019A0D                           ; $019A03 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $019A05 |
  LDA #$0020                                ; $019A07 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019A0A |
  RTS                                       ; $019A0C |

CODE_019A0D:
  LDA !s_spr_gsu_morph_1_lo,x               ; $019A0D |
  BNE CODE_019A2C                           ; $019A10 |
  LDA #$000C                                ; $019A12 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $019A15 |
  LDA $1060                                 ; $019A17 |
  SEC                                       ; $019A1A |
  SBC #$0080                                ; $019A1B |
  LDY !s_spr_facing_dir,x                   ; $019A1E |
  BNE CODE_019A27                           ; $019A21 |
  EOR #$FFFF                                ; $019A23 |
  INC A                                     ; $019A26 |

CODE_019A27:
  STA $1088                                 ; $019A27 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019A2A |

CODE_019A2C:
  RTS                                       ; $019A2C |

; data table
  dw $FE00                                  ; $019A2D |
  dw $0200                                  ; $019A2F |

hookbill_hop_wobble:
  TYX                                       ; $019A31 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019A32 |
  BNE CODE_019A64                           ; $019A35 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019A37 |
  BPL CODE_019A44                           ; $019A39 |
  LDA #$0008                                ; $019A3B |
  STA !s_spr_timer_1,x                      ; $019A3E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019A41 |
  RTS                                       ; $019A43 |

CODE_019A44:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019A44 |
  AND #$0001                                ; $019A46 |
  PHP                                       ; $019A49 |
  ASL A                                     ; $019A4A |
  DEC A                                     ; $019A4B |
  CLC                                       ; $019A4C |
  ADC $105E                                 ; $019A4D |
  STA $105E                                 ; $019A50 |
  LDA #$0030                                ; $019A53 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019A56 |
  PLP                                       ; $019A58 |
  BEQ CODE_019A64                           ; $019A59 |
  LDA !s_spr_facing_dir,x                   ; $019A5B |
  EOR #$0002                                ; $019A5E |
  STA !s_spr_facing_dir,x                   ; $019A61 |

CODE_019A64:
  LDA $1060                                 ; $019A64 |
  STA !gsu_r1                               ; $019A67 |
  LDA $1088                                 ; $019A6A |
  STA !gsu_r2                               ; $019A6D |
  LDA #$0080                                ; $019A70 |
  STA !gsu_r3                               ; $019A73 |
  LDA #$0048                                ; $019A76 |
  STA !gsu_r6                               ; $019A79 |
  TXA                                       ; $019A7C |
  STA !gsu_r10                              ; $019A7D |
  LDX #$08                                  ; $019A80 |
  LDA #$A929                                ; $019A82 |
  JSL r_gsu_init_1                          ; $019A85 | GSU init
  LDX $12                                   ; $019A89 |
  LDA !gsu_r1                               ; $019A8B |
  STA $1088                                 ; $019A8E |

CODE_019A91:
  RTS                                       ; $019A91 |

hookbill_hop_one:
  TYX                                       ; $019A92 |
  LDA !s_spr_timer_1,x                      ; $019A93 |
  BNE CODE_019A91                           ; $019A96 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $019A98 |
  BEQ CODE_019ABE                           ; $019A9A |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $019A9C |
  LDY !s_spr_x_player_dir,x                 ; $019A9E |
  LDA $9A2D,y                               ; $019AA1 |
  STA !s_spr_x_speed_lo,x                   ; $019AA4 |
  LDA #$FA00                                ; $019AA7 |
  STA !s_spr_y_speed_lo,x                   ; $019AAA |
  LDY #$03                                  ; $019AAD |
  STY $105E                                 ; $019AAF |
  LDA #$0008                                ; $019AB2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019AB5 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $019AB7 |
  STZ !s_spr_wildcard_2_lo,x                ; $019ABA |
  RTS                                       ; $019ABD |

CODE_019ABE:
  LDA !s_spr_gsu_morph_1_lo,x               ; $019ABE |
  BNE CODE_019B18                           ; $019AC1 |
  STZ !s_spr_x_speed_lo,x                   ; $019AC3 |
  STZ !s_spr_y_speed_lo,x                   ; $019AC6 |
  STZ !s_spr_y_accel,x                      ; $019AC9 |
  LDA !s_spr_x_accel_ceiling,x              ; $019ACC |
  BNE CODE_019AE1                           ; $019ACF |
  LDA #$0020                                ; $019AD1 |
  STA !s_spr_timer_1,x                      ; $019AD4 |
  STA !s_spr_x_accel_ceiling,x              ; $019AD7 |
  LDA #$000C                                ; $019ADA |
  STA !s_spr_y_terrain_offset,x             ; $019ADD |
  RTS                                       ; $019AE0 |

CODE_019AE1:
  LDA #$0060                                ; $019AE1 |
  STA !s_spr_y_accel,x                      ; $019AE4 |
  LDA #$0800                                ; $019AE7 |
  STA !s_spr_y_speed_lo,x                   ; $019AEA |
  STA !s_spr_y_accel_ceiling,x              ; $019AED |
  LDA $7860,x                               ; $019AF0 |
  AND #$0001                                ; $019AF3 |
  BEQ CODE_019B18                           ; $019AF6 |
  LDA #$0003                                ; $019AF8 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $019AFB |
  STZ !s_spr_x_accel_ceiling,x              ; $019AFD |
  LDA #$0020                                ; $019B00 |
  STA !s_cam_y_large_shaking_timer          ; $019B03 |
  LDA #$0004                                ; $019B06 |
  STA !s_spr_timer_1,x                      ; $019B09 |
  STZ $1074                                 ; $019B0C |
  LDA #$0047                                ; $019B0F |\ play sound #$0047
  JSL push_sound_queue                      ; $019B12 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $019B16 |

CODE_019B18:
  RTS                                       ; $019B18 |

; data table
  dw $FE00                                  ; $019B19 |
  dw $0200                                  ; $019B1B |

; data table
  db $03, $10                               ; $019B1D |
  db $00, $00                               ; $019B1F |
  db $00, $FC                               ; $019B21 |

hookbill_hop_two:
  TYX                                       ; $019B23 |
  LDA $7860,x                               ; $019B24 |
  AND #$0001                                ; $019B27 |
  BEQ CODE_019BA3                           ; $019B2A |
  LDA !s_spr_timer_1,x                      ; $019B2C |
  BNE CODE_019BA3                           ; $019B2F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019B31 |
  AND #$0001                                ; $019B33 |
  BNE CODE_019B70                           ; $019B36 |
  STZ !s_spr_x_speed_lo,x                   ; $019B38 |
  LDA #$0020                                ; $019B3B |
  STA !s_cam_y_large_shaking_timer          ; $019B3E |
  LDA #$0004                                ; $019B41 |
  STA !s_spr_timer_1,x                      ; $019B44 |
  LDA #$0047                                ; $019B47 |\ play sound #$0047
  JSL push_sound_queue                      ; $019B4A |/
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019B4E |
  BPL CODE_019BA3                           ; $019B50 |
  LDA #$0080                                ; $019B52 |
  STA !s_spr_timer_1,x                      ; $019B55 |
  STZ $1072                                 ; $019B58 |
  LDA #$0040                                ; $019B5B |
  STA !s_spr_y_accel,x                      ; $019B5E |
  LDA #$0400                                ; $019B61 |
  STA !s_spr_y_accel_ceiling,x              ; $019B64 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $019B67 |
  STZ !s_spr_wildcard_2_lo,x                ; $019B6A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019B6D |
  RTS                                       ; $019B6F |

CODE_019B70:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019B70 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019B72 |
  LSR A                                     ; $019B74 |
  TAY                                       ; $019B75 |
  SEP #$20                                  ; $019B76 |
  LDA $9B1D,y                               ; $019B78 |
  STA $105E                                 ; $019B7B |
  REP #$20                                  ; $019B7E |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $019B80 |
  LDA $9B1F,y                               ; $019B82 |
  STA !s_spr_gsu_morph_2_lo,x               ; $019B85 |
  STA !s_spr_wildcard_2_lo,x                ; $019B88 |
  LDA #$0008                                ; $019B8B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019B8E |
  LDA #$F800                                ; $019B90 |
  STA !s_spr_y_speed_lo,x                   ; $019B93 |
  LDY !s_spr_x_player_dir,x                 ; $019B96 |
  LDA $9B19,y                               ; $019B99 |
  STA !s_spr_x_speed_lo,x                   ; $019B9C |
  TYA                                       ; $019B9F |
  STA !s_spr_facing_dir,x                   ; $019BA0 |

CODE_019BA3:
  RTS                                       ; $019BA3 |

hookbill_ground_pound_and_body_out:
  TYX                                       ; $019BA4 |
  LDA !s_spr_timer_1,x                      ; $019BA5 |
  BNE CODE_019BF8                           ; $019BA8 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019BAA |
  BEQ CODE_019BBD                           ; $019BAC |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $019BAE |
  LDY #$02                                  ; $019BB0 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019BB2 |
  STZ $105E                                 ; $019BB4 |
  LDA #$0008                                ; $019BB7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019BBA |
  RTS                                       ; $019BBC |

CODE_019BBD:
  LDA !s_spr_gsu_morph_1_lo,x               ; $019BBD |
  BNE CODE_019BF8                           ; $019BC0 |
  LDA $7860,x                               ; $019BC2 |
  AND #$0001                                ; $019BC5 |
  BEQ CODE_019BF8                           ; $019BC8 |
  LDA $106E                                 ; $019BCA |
  ORA #$FF00                                ; $019BCD |
  STA $106E                                 ; $019BD0 |
  STZ $107A                                 ; $019BD3 |
  LDY $107C                                 ; $019BD6 |
  STY $107E                                 ; $019BD9 |
  LDA #$0040                                ; $019BDC |
  STA !s_spr_timer_1,x                      ; $019BDF |
  LDA #$0080                                ; $019BE2 |
  STA !s_spr_timer_2,x                      ; $019BE5 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $019BE8 |
  CPY #$28                                  ; $019BEA |
  BEQ CODE_019BF4                           ; $019BEC |
  STZ !s_player_state                       ; $019BEE |
  STZ $0B7B                                 ; $019BF1 |

CODE_019BF4:
  LDY #$01                                  ; $019BF4 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019BF6 |

CODE_019BF8:
  RTS                                       ; $019BF8 |

hookbill_ground_pounded_init:
  TYX                                       ; $019BF9 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019BFA |
  BNE CODE_019C23                           ; $019BFD |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $019BFF |
  CPY #$29                                  ; $019C01 |
  BEQ CODE_019C19                           ; $019C03 |
  LDY #$27                                  ; $019C05 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019C07 |
  LDY #$15                                  ; $019C09 |
  STY $105E                                 ; $019C0B |
  LDA #$0001                                ; $019C0E |
  STA !s_spr_gsu_morph_1_lo,x               ; $019C11 |
  LDA #$0040                                ; $019C14 |
  BRA CODE_019C1E                           ; $019C17 |

CODE_019C19:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $019C19 |
  LDA #$0020                                ; $019C1B |

CODE_019C1E:
  STA !s_spr_timer_1,x                      ; $019C1E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019C21 |

CODE_019C23:
  LDA $1078                                 ; $019C23 |
  SEC                                       ; $019C26 |
  SBC #$0008                                ; $019C27 |
  CMP #$00C0                                ; $019C2A |
  BMI CODE_019C4C                           ; $019C2D |
  STA $1078                                 ; $019C2F |
  STA !gsu_r0                               ; $019C32 |
  LDA #$0012                                ; $019C35 |
  STA !gsu_r6                               ; $019C38 |
  LDX #$0B                                  ; $019C3B |
  LDA #$86B6                                ; $019C3D |
  JSL r_gsu_init_1                          ; $019C40 | GSU init
  LDX $12                                   ; $019C44 |
  LDA !gsu_r0                               ; $019C46 |
  STA !s_spr_y_terrain_offset,x             ; $019C49 |

CODE_019C4C:
  RTS                                       ; $019C4C |

; data table
  dw $FC00                                  ; $019C4D |
  dw $0400                                  ; $019C4F |

hookbill_ground_pounded_flash:
  TYX                                       ; $019C51 |
  LDA !s_spr_timer_1,x                      ; $019C52 |
  BNE CODE_019CC8                           ; $019C55 |
  LDA $1078                                 ; $019C57 |
  CLC                                       ; $019C5A |
  ADC #$0008                                ; $019C5B |
  CMP #$0101                                ; $019C5E |
  BMI CODE_019CAB                           ; $019C61 |
  STZ !s_player_state                       ; $019C63 |
  LDY #$00                                  ; $019C66 |
  LDA !s_spr_cam_x_pos,x                    ; $019C68 |
  CMP #$0080                                ; $019C6B |
  BPL CODE_019C72                           ; $019C6E |
  INY                                       ; $019C70 |
  INY                                       ; $019C71 |

CODE_019C72:
  LDA $9C4D,y                               ; $019C72 |
  STA !s_player_x_speed_prev                ; $019C75 |
  STA !s_player_x_speed                     ; $019C78 |
  LDA #$FA00                                ; $019C7B |
  STA !s_player_y_speed                     ; $019C7E |
  LDA #$0006                                ; $019C81 |
  STA !s_player_jump_state                  ; $019C84 |
  LDA #$8001                                ; $019C87 |
  STA !s_player_flutter_state               ; $019C8A |
  STZ !s_on_sprite_platform_flag            ; $019C8D |
  LDY #$02                                  ; $019C90 |
  STY $1074                                 ; $019C92 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $019C95 |
  LDA #$0020                                ; $019C97 |
  STA !s_spr_timer_1,x                      ; $019C9A |
  LDY #$18                                  ; $019C9D |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019C9F |
  LDY #$10                                  ; $019CA1 |
  STY $105E                                 ; $019CA3 |
  LDY #$24                                  ; $019CA6 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $019CA8 |
  RTS                                       ; $019CAA |

CODE_019CAB:
  STA $1078                                 ; $019CAB |
  STA !gsu_r0                               ; $019CAE |
  LDA #$0012                                ; $019CB1 |
  STA !gsu_r6                               ; $019CB4 |
  LDX #$0B                                  ; $019CB7 |
  LDA #$86B6                                ; $019CB9 |
  JSL r_gsu_init_1                          ; $019CBC | GSU init
  LDX $12                                   ; $019CC0 |
  LDA !gsu_r0                               ; $019CC2 |
  STA !s_spr_y_terrain_offset,x             ; $019CC5 |

CODE_019CC8:
  RTS                                       ; $019CC8 |

hookbill_begin_koopa_walking:
  TYX                                       ; $019CC9 |
  LDA !s_spr_x_player_delta,x               ; $019CCA |
  CMP #$00A0                                ; $019CCD |
  BPL CODE_019CE1                           ; $019CD0 |
  LDA #$0008                                ; $019CD2 |
  STA !s_spr_anim_frame,x                   ; $019CD5 |
  STZ !s_spr_x_speed_lo,x                   ; $019CD8 |
  INC $1015                                 ; $019CDB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019CDE |
  RTS                                       ; $019CE0 |

CODE_019CE1:
  LDA !s_spr_timer_2,x                      ; $019CE1 |
  BNE CODE_019CF6                           ; $019CE4 |
  LDA #$0005                                ; $019CE6 |
  STA !s_spr_timer_2,x                      ; $019CE9 |
  LDA !s_spr_anim_frame,x                   ; $019CEC |
  INC A                                     ; $019CEF | continue walking over
  AND #$0007                                ; $019CF0 |
  STA !s_spr_anim_frame,x                   ; $019CF3 |

CODE_019CF6:
  RTS                                       ; $019CF6 |

hookbill_begin_kamek:
  TYX                                       ; $019CF7 |
  LDA $1015                                 ; $019CF8 |
  BPL CODE_019D02                           ; $019CFB |
  STZ $1015                                 ; $019CFD |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019D00 |

CODE_019D02:
  RTS                                       ; $019D02 |

; data table
  dw $0000                                  ; $019D03 |
  dw $1000                                  ; $019D05 |

; data table
  db $00, $70, $00, $70                     ; $019D07 |

; data table
  dw $00B7                                  ; $019D0B |
  dw $00B8                                  ; $019D0D |

hookbill_begin_init1:
  REP #$10                                  ; $019D0F |
  LDA #$0800                                ; $019D11 |
  STA $00                                   ; $019D14 |
  LDA $0C16                                 ; $019D16 |
  BNE CODE_019D61                           ; $019D19 |
  LDA $0C14                                 ; $019D1B |
  CMP #$0002                                ; $019D1E |
  BCC CODE_019D2D                           ; $019D21 |
  STZ $0C18                                 ; $019D23 |
  SEP #$10                                  ; $019D26 |
  LDX $12                                   ; $019D28 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019D2A |
  RTS                                       ; $019D2C |

CODE_019D2D:
  ASL A                                     ; $019D2D |
  TAY                                       ; $019D2E |
  LDA $9D03,y                               ; $019D2F |
  STA $0C18                                 ; $019D32 |
  LDA #$6800                                ; $019D35 |
  STA $0C1A                                 ; $019D38 |
  LDX $9D07,y                               ; $019D3B |
  LDA $9D0B,y                               ; $019D3E |
  JSL decompress_lc_lz1_l_x                 ; $019D41 |
  STA $0C16                                 ; $019D45 |
  INC $0C14                                 ; $019D48 |
  PHA                                       ; $019D4B |
  SEP #$10                                  ; $019D4C |
  STA !gsu_r12                              ; $019D4E |
  LDX #$08                                  ; $019D51 |
  LDA #$AA5F                                ; $019D53 |
  JSL r_gsu_init_1                          ; $019D56 | GSU init
  REP #$10                                  ; $019D5A |
  PLA                                       ; $019D5C |
  ASL A                                     ; $019D5D |
  STA $0C16                                 ; $019D5E |

CODE_019D61:
  SEC                                       ; $019D61 |
  SBC #$0800                                ; $019D62 |
  BCS CODE_019D6F                           ; $019D65 |
  ADC #$0800                                ; $019D67 |
  STA $00                                   ; $019D6A |
  LDA #$0000                                ; $019D6C |

CODE_019D6F:
  STA $0C16                                 ; $019D6F |
  LDX $0C1A                                 ; $019D72 |
  TXA                                       ; $019D75 |
  CLC                                       ; $019D76 |
  ADC $00                                   ; $019D77 |
  STA $0C1A                                 ; $019D79 |
  LDA #$0070                                ; $019D7C |
  STA $0001                                 ; $019D7F |
  LDY $0C18                                 ; $019D82 |
  LDA $00                                   ; $019D85 |
  JSL $00BF86                               ; $019D87 |
  LDA $00                                   ; $019D8B |
  CLC                                       ; $019D8D |
  ADC $0C18                                 ; $019D8E |
  STA $0C18                                 ; $019D91 |
  SEP #$10                                  ; $019D94 |
  LDX $12                                   ; $019D96 |
  RTS                                       ; $019D98 |

; hookbill: gets DMA'd to VRAM
  db $00, $01, $02, $03, $04, $05, $06, $00 ; $019D99 |
  db $10, $11, $12, $13, $14, $15, $16, $17 ; $019DA1 |
  db $20, $21, $22, $23, $24, $25, $26, $27 ; $019DA9 |
  db $30, $31, $32, $33, $34, $35, $36, $37 ; $019DB1 |
  db $40, $41, $42, $43, $44, $45, $46, $47 ; $019DB9 |
  db $00, $51, $52, $53, $54, $55, $56, $00 ; $019DC1 |
  db $00, $00, $62, $63, $64, $65, $00, $00 ; $019DC9 |

; data table
  db $00                                    ; $019DD1 |
  db $05                                    ; $019DD2 |
  db $40                                    ; $019DD3 |
  db $50                                    ; $019DD4 |
  db $7E                                    ; $019DD5 |

; data table
  db $70                                    ; $019DD6 |
  db $07                                    ; $019DD7 |
  db $2B                                    ; $019DD8 |
  db $07                                    ; $019DD9 |
  db $01                                    ; $019DDA |
  db $49                                    ; $019DDB |
  db $00                                    ; $019DDC |

; data table
  db $70                                    ; $019DDD |
  db $11                                    ; $019DDE |
  db $00                                    ; $019DDF |
  db $2B                                    ; $019DE0 |
  db $11                                    ; $019DE1 |
  db $00                                    ; $019DE2 |
  db $01                                    ; $019DE3 |
  db $12                                    ; $019DE4 |
  db $00                                    ; $019DE5 |
  db $00                                    ; $019DE6 |

hookbill_begin_init2:
  REP #$10                                  ; $019DE7 |
  LDA $0C18                                 ; $019DE9 |
  CMP #$4000                                ; $019DEC |
  BCS CODE_019E07                           ; $019DEF |
  TAY                                       ; $019DF1 |
  ADC #$0800                                ; $019DF2 |
  STA $0C18                                 ; $019DF5 |
  LDA #$0800                                ; $019DF8 |
  LDX #$0000                                ; $019DFB |
  JSL $00BF4A                               ; $019DFE |
  SEP #$10                                  ; $019E02 |
  LDX $12                                   ; $019E04 |
  RTS                                       ; $019E06 |

CODE_019E07:
  LDA #$0000                                ; $019E07 |
  STA $00                                   ; $019E0A |
  LDA #$9D99                                ; $019E0C | table...?
  STA $02                                   ; $019E0F |
  LDA #$0001                                ; $019E11 |
  STA $0001                                 ; $019E14 |
  LDA #$0007                                ; $019E17 |
  STA $04                                   ; $019E1A |

CODE_019E1C:
  LDY $00                                   ; $019E1C |
  TYA                                       ; $019E1E |
  CLC                                       ; $019E1F |
  ADC #$0080                                ; $019E20 |
  STA $00                                   ; $019E23 |
  LDX $02                                   ; $019E25 |
  TXA                                       ; $019E27 |
  CLC                                       ; $019E28 |
  ADC #$0008                                ; $019E29 |
  STA $02                                   ; $019E2C |
  LDA #$0008                                ; $019E2E |
  JSL $00BF16                               ; $019E31 |
  DEC $04                                   ; $019E35 |
  BNE CODE_019E1C                           ; $019E37 |
  SEP #$10                                  ; $019E39 |
  JSR CODE_019291                           ; $019E3B |
  REP #$10                                  ; $019E3E |
  SEP #$20                                  ; $019E40 |
  LDX #$0004                                ; $019E42 |

CODE_019E45:
  LDA $9DD1,x                               ; $019E45 |
  STA $4370,x                               ; $019E48 |
  DEX                                       ; $019E4B |
  BPL CODE_019E45                           ; $019E4C |
  LDX #$0009                                ; $019E4E |

CODE_019E51:
  LDA $9DD6,x                               ; $019E51 |
  STA $7E5040,x                             ; $019E54 |
  LDA $9DDD,x                               ; $019E58 |
  STA $7E51E4,x                             ; $019E5B |
  DEX                                       ; $019E5F |
  BPL CODE_019E51                           ; $019E60 |
  LDA #$C0                                  ; $019E62 |
  TSB !r_reg_hdmaen_mirror                  ; $019E64 |
  LDA #$0A                                  ; $019E67 |
  STA !r_interrupt_mode                     ; $019E69 |
  LDA #$69                                  ; $019E6C |
  STA !r_reg_bg2sc_mirror                   ; $019E6E |
  REP #$20                                  ; $019E71 |
  LDA #$0012                                ; $019E73 |
  STA !r_reg_tm_mirror                      ; $019E76 |
  LDA #$0100                                ; $019E79 |
  STA !r_reg_m7a_mirror                     ; $019E7C |
  STA !r_reg_m7d_mirror                     ; $019E7F |
  STZ !r_reg_m7b_mirror                     ; $019E82 |
  STZ !r_reg_m7c_mirror                     ; $019E85 |
  LDA #$0020                                ; $019E88 |
  STA !r_reg_m7x_mirror                     ; $019E8B |
  LDA #$001C                                ; $019E8E |
  STA !r_reg_m7y_mirror                     ; $019E91 |
  LDA #$0080                                ; $019E94 |
  STA !r_bg3_cam_y                          ; $019E97 |
  SEP #$10                                  ; $019E9A |
  LDX $12                                   ; $019E9C |
  LDA #$0004                                ; $019E9E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $019EA1 |
  LDA #$FD00                                ; $019EA3 |
  STA !s_spr_y_speed_lo,x                   ; $019EA6 |
  LDA #$000A                                ; $019EA9 |
  STA !s_spr_timer_2,x                      ; $019EAC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019EAF |

CODE_019EB1:
  RTS                                       ; $019EB1 |

; data table
  dw $0B0F                                  ; $019EB2 |
  dw $0D0C                                  ; $019EB4 |

hookbill_begin_koopa_crouch:
  TYX                                       ; $019EB6 |
  LDA !s_spr_timer_2,x                      ; $019EB7 |
  BNE CODE_019EB1                           ; $019EBA |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019EBC |
  BMI CODE_019ED2                           ; $019EBE |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $019EC0 |
  LDA $9EB2,y                               ; $019EC2 |
  AND #$00FF                                ; $019EC5 |
  STA !s_spr_anim_frame,x                   ; $019EC8 |
  LDA #$0004                                ; $019ECB |
  STA !s_spr_timer_2,x                      ; $019ECE |

CODE_019ED1:
  RTS                                       ; $019ED1 |

CODE_019ED2:
  LDA $7860,x                               ; $019ED2 |
  BEQ CODE_019ED1                           ; $019ED5 |
  LDA #$6E6C                                ; $019ED7 |
  STA !s_spr_bitwise_settings_1,x           ; $019EDA |
  LDA #$2041                                ; $019EDD |
  STA !s_spr_bitwise_settings_3,x           ; $019EE0 |
  LDA #$A902                                ; $019EE3 |
  STA !s_spr_oam_1,x                        ; $019EE6 |
  INC $1080                                 ; $019EE9 |
  LDA !s_spr_x_pixel_pos,x                  ; $019EEC |
  SEC                                       ; $019EEF |
  SBC #$0002                                ; $019EF0 |
  STA !s_spr_x_pixel_pos,x                  ; $019EF3 |
  LDA !s_spr_y_pixel_pos,x                  ; $019EF6 |
  CLC                                       ; $019EF9 |
  ADC #$0004                                ; $019EFA |
  STA !s_spr_y_pixel_pos,x                  ; $019EFD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $019F00 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $019F02 |
  STZ !s_spr_oam_yxppccct,x                 ; $019F05 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $019F08 |
  LDA #$0050                                ; $019F0A |
  STA $1076                                 ; $019F0D |
  STA $1078                                 ; $019F10 |
  JSR CODE_018AC9                           ; $019F13 |
  JSR CODE_018AB6                           ; $019F16 |
  JSR CODE_018AE1                           ; $019F19 |
  JSR CODE_018B15                           ; $019F1C |
  INC $0CF9                                 ; $019F1F |
  LDX $12                                   ; $019F22 |
  INC $1070                                 ; $019F24 |
  LDA #$0001                                ; $019F27 |
  STA $106E                                 ; $019F2A |
  INC $1072                                 ; $019F2D |
  LDA #$FFFE                                ; $019F30 |
  STA !s_spr_y_terrain_offset,x             ; $019F33 |
  LDA #$FE00                                ; $019F36 |
  STA !s_spr_wildcard_1_lo,x                ; $019F39 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $019F3C |
  STZ !s_spr_gsu_morph_1_lo,x               ; $019F3F |
  LDA #$0025                                ; $019F42 |
  STA !s_spr_anim_frame,x                   ; $019F45 |
  TAY                                       ; $019F48 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $019F49 |
  LDY #$12                                  ; $019F4B |
  STY $105C                                 ; $019F4D |
  STY $105E                                 ; $019F50 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019F53 |
  PLA                                       ; $019F55 |\ skips the RTS
  RTL                                       ; $019F56 |/ and goes back one in stack

hookbill_begin_shell_init:
  TYX                                       ; $019F57 |
  LDA $7860,x                               ; $019F58 |
  AND #$0001                                ; $019F5B |
  BEQ CODE_019F79                           ; $019F5E |
  LDA #$0010                                ; $019F60 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $019F63 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $019F65 |
  INC $105E                                 ; $019F68 |
  LDA #$0018                                ; $019F6B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019F6E |
  LDA #$0087                                ; $019F70 |\ play sound #$0087
  JSL push_sound_queue                      ; $019F73 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $019F77 |

CODE_019F79:
  RTS                                       ; $019F79 |

hookbill_begin_shell_grow:
  TYX                                       ; $019F7A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019F7B |
  BNE CODE_019FB1                           ; $019F7E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019F80 |
  BPL CODE_019F90                           ; $019F82 |
  STZ $1072                                 ; $019F84 |
  LDA #$0080                                ; $019F87 |
  STA !s_spr_timer_1,x                      ; $019F8A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019F8D |
  RTS                                       ; $019F8F |

CODE_019F90:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $019F90 |
  BPL CODE_019F9B                           ; $019F92 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $019F94 |
  LDA #$0012                                ; $019F96 |
  BRA CODE_019FA6                           ; $019F99 |

CODE_019F9B:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $019F9B |
  AND #$0001                                ; $019F9D |
  ASL A                                     ; $019FA0 |
  DEC A                                     ; $019FA1 |
  CLC                                       ; $019FA2 |
  ADC $105E                                 ; $019FA3 |

CODE_019FA6:
  STA $105E                                 ; $019FA6 |
  LDA #$0018                                ; $019FA9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $019FAC |
  STZ !s_spr_gsu_morph_1_lo,x               ; $019FAE |

CODE_019FB1:
  LDA $1076                                 ; $019FB1 |
  CLC                                       ; $019FB4 |
  ADC #$0001                                ; $019FB5 |
  CMP #$0100                                ; $019FB8 |
  BMI CODE_019FC0                           ; $019FBB |
  LDA #$0100                                ; $019FBD |

CODE_019FC0:
  STA $1076                                 ; $019FC0 |
  STA $1078                                 ; $019FC3 |
  STA !gsu_r6                               ; $019FC6 |
  LDA #$0016                                ; $019FC9 |
  STA !gsu_r0                               ; $019FCC |
  LDX #$0B                                  ; $019FCF |
  LDA #$86B6                                ; $019FD1 |
  JSL r_gsu_init_1                          ; $019FD4 | GSU init
  LDX $12                                   ; $019FD8 |
  LDA !gsu_r0                               ; $019FDA |
  SEC                                       ; $019FDD |
  SBC #$0008                                ; $019FDE |
  STA !s_spr_y_terrain_offset,x             ; $019FE1 |
  RTS                                       ; $019FE4 |

hookbill_dead_squish_down:
  TYX                                       ; $019FE5 |
  LDA !s_spr_timer_1,x                      ; $019FE6 |
  BNE CODE_01A014                           ; $019FE9 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $019FEB |
  BNE CODE_01A00F                           ; $019FEE |
  LDA #$000A                                ; $019FF0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $019FF3 |
  INC $0B59                                 ; $019FF5 |
  INC $105C                                 ; $019FF8 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $019FFB |
  LDA !s_spr_x_pixel_pos,x                  ; $019FFD |
  STA $00                                   ; $01A000 |
  LDA !s_spr_y_pixel_pos,x                  ; $01A002 |
  STA $02                                   ; $01A005 |
  LDA #$0340                                ; $01A007 |
  JSL $02E1A6                               ; $01A00A |
  RTS                                       ; $01A00E |

CODE_01A00F:
  LDA #$0008                                ; $01A00F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01A012 |

CODE_01A014:
  RTS                                       ; $01A014 |

; data table
  dw $0003                                  ; $01A015 |
  dw $FFFE                                  ; $01A017 |
  dw $0002                                  ; $01A019 |
  dw $FFFF                                  ; $01A01B |
  dw $0001                                  ; $01A01D |
  dw $FFFD                                  ; $01A01F |
  dw $0002                                  ; $01A021 |
  dw $FFFE                                  ; $01A023 |
  dw $0001                                  ; $01A025 |
  dw $FFFF                                  ; $01A027 |

; data table
  dw $0004                                  ; $01A029 |
  dw $0008                                  ; $01A02B |
  dw $000E                                  ; $01A02D |
  dw $0014                                  ; $01A02F |
  dw $001C                                  ; $01A031 |
  dw $0020                                  ; $01A033 |
  dw $0028                                  ; $01A035 |
  dw $002C                                  ; $01A037 |

; data table
  dw $FFFC                                  ; $01A039 |
  dw $FFF8                                  ; $01A03B |
  dw $0000                                  ; $01A03D |
  dw $FFF0                                  ; $01A03F |
  dw $FFF4                                  ; $01A041 |
  dw $0008                                  ; $01A043 |
  dw $0002                                  ; $01A045 |
  dw $FFFC                                  ; $01A047 |

; data table
  dw $0000                                  ; $01A049 |
  dw $0001                                  ; $01A04B |
  dw $0002                                  ; $01A04D |
  dw $0001                                  ; $01A04F |
  dw $0000                                  ; $01A051 |
  dw $0001                                  ; $01A053 |
  dw $0000                                  ; $01A055 |
  dw $0002                                  ; $01A057 |

; data table
  dw $0100                                  ; $01A059 |
  dw $0480                                  ; $01A05B |
  dw $0180                                  ; $01A05D |
  dw $0300                                  ; $01A05F |
  dw $01C0                                  ; $01A061 |
  dw $0240                                  ; $01A063 |
  dw $0080                                  ; $01A065 |
  dw $0200                                  ; $01A067 |
  dw $FD00                                  ; $01A069 |
  dw $FF00                                  ; $01A06B |
  dw $FE00                                  ; $01A06D |
  dw $F840                                  ; $01A06F |
  dw $FD80                                  ; $01A071 |
  dw $FF80                                  ; $01A073 |
  dw $FAC0                                  ; $01A075 |
  dw $FE80                                  ; $01A077 |

; data table
  dw $FA00                                  ; $01A079 |
  dw $FD80                                  ; $01A07B |
  dw $FC00                                  ; $01A07D |
  dw $FF80                                  ; $01A07F |
  dw $FC80                                  ; $01A081 |
  dw $FB00                                  ; $01A083 |
  dw $F780                                  ; $01A085 |
  dw $FE00                                  ; $01A087 |
  dw $FB80                                  ; $01A089 |
  dw $FF00                                  ; $01A08B |
  dw $F800                                  ; $01A08D |
  dw $FB00                                  ; $01A08F |
  dw $FE80                                  ; $01A091 |
  dw $FD00                                  ; $01A093 |
  dw $FB80                                  ; $01A095 |
  dw $FA80                                  ; $01A097 |

; flatten this mothafucka to a pancake
hookbill_dead_pancake:
  TYX                                       ; $01A099 |
  LDA !s_spr_timer_1,x                      ; $01A09A |
  BNE CODE_01A0FD                           ; $01A09D |
  LDA !s_spr_timer_2,x                      ; $01A09F |
  BNE CODE_01A0B7                           ; $01A0A2 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $01A0A4 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $01A0A6 |
  BMI CODE_01A0FE                           ; $01A0A8 |
  BNE CODE_01A0B1                           ; $01A0AA |
  LDA #$0040                                ; $01A0AC |
  BRA CODE_01A0B4                           ; $01A0AF |

CODE_01A0B1:
  LDA #$0020                                ; $01A0B1 |

CODE_01A0B4:
  STA !s_spr_timer_2,x                      ; $01A0B4 |

CODE_01A0B7:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $01A0B7 |
  BNE CODE_01A0C7                           ; $01A0B9 |
  LDA $7974                                 ; $01A0BB |
  AND #$0001                                ; $01A0BE |
  BNE CODE_01A0FD                           ; $01A0C1 |
  LDY #$04                                  ; $01A0C3 |
  BRA CODE_01A0CB                           ; $01A0C5 |

CODE_01A0C7:
  AND #$0002                                ; $01A0C7 |
  TAY                                       ; $01A0CA |

CODE_01A0CB:
  LDA $A015,y                               ; $01A0CB |
  CLC                                       ; $01A0CE |
  ADC $1076                                 ; $01A0CF |
  STA $1076                                 ; $01A0D2 |
  LDA $A01F,y                               ; $01A0D5 |
  CLC                                       ; $01A0D8 |
  ADC $1078                                 ; $01A0D9 |
  STA $1078                                 ; $01A0DC |
  STA !gsu_r0                               ; $01A0DF |
  LDA #$0016                                ; $01A0E2 |
  STA !gsu_r6                               ; $01A0E5 |
  LDX #$0B                                  ; $01A0E8 |
  LDA #$86B6                                ; $01A0EA |
  JSL r_gsu_init_1                          ; $01A0ED | GSU init
  LDX $12                                   ; $01A0F1 |
  LDA !gsu_r0                               ; $01A0F3 |
  SEC                                       ; $01A0F6 |
  SBC #$0008                                ; $01A0F7 |
  STA !s_spr_y_terrain_offset,x             ; $01A0FA |

CODE_01A0FD:
  RTS                                       ; $01A0FD |

CODE_01A0FE:
  LDA !s_spr_x_pixel_pos,x                  ; $01A0FE |
  STA $1084                                 ; $01A101 |
  LDA !s_spr_y_pixel_pos,x                  ; $01A104 |
  STA $1086                                 ; $01A107 |
  INC $1080                                 ; $01A10A |
  LDA #$E0A1                                ; $01A10D |
  STA !gsu_r12                              ; $01A110 |
  LDA #$0054                                ; $01A113 |
  STA !gsu_r13                              ; $01A116 |
  LDA #$0010                                ; $01A119 |
  STA !gsu_r8                               ; $01A11C |
  STA !gsu_r9                               ; $01A11F |
  LDA #$0100                                ; $01A122 |
  STA !gsu_r6                               ; $01A125 |
  STZ !gsu_r3                               ; $01A128 |
  STZ !gsu_r2                               ; $01A12B |
  LDX #$08                                  ; $01A12E |
  LDA #$8293                                ; $01A130 |
  JSL r_gsu_init_1                          ; $01A133 | GSU init
  INC $0CF9                                 ; $01A137 |
  LDX $12                                   ; $01A13A |
  LDA #$6E6C                                ; $01A13C |
  STA !s_spr_bitwise_settings_1,x           ; $01A13F |
  LDA #$2040                                ; $01A142 |
  STA !s_spr_bitwise_settings_3,x           ; $01A145 |
  LDA #$3101                                ; $01A148 |
  STA !s_spr_oam_1,x                        ; $01A14B |
  LDA #$000C                                ; $01A14E |
  STA !s_spr_anim_frame,x                   ; $01A151 |
  LDA #$FB00                                ; $01A154 |
  STA !s_spr_y_speed_lo,x                   ; $01A157 |
  LDA #$000A                                ; $01A15A |
  STA !s_spr_y_accel,x                      ; $01A15D |
  LDA #$0020                                ; $01A160 |
  STA !s_spr_oam_yxppccct,x                 ; $01A163 |
  LDA #$001E                                ; $01A166 |

CODE_01A169:
  STA $00                                   ; $01A169 |
  TAY                                       ; $01A16B |
  LDA $A059,y                               ; $01A16C |
  STA $04                                   ; $01A16F |
  LDA $A079,y                               ; $01A171 |
  STA $08                                   ; $01A174 |
  TYA                                       ; $01A176 |
  BIT #$0010                                ; $01A177 |
  BNE CODE_01A181                           ; $01A17A |
  LDA $A029,y                               ; $01A17C |
  BRA CODE_01A18C                           ; $01A17F |

CODE_01A181:
  AND #$000E                                ; $01A181 |
  TAY                                       ; $01A184 |
  LDA $A029,y                               ; $01A185 |
  EOR #$FFFF                                ; $01A188 |
  INC A                                     ; $01A18B |

CODE_01A18C:
  STA $02                                   ; $01A18C |
  LDA $A039,y                               ; $01A18E |
  STA $06                                   ; $01A191 |
  LDA $A049,y                               ; $01A193 |
  STA $0A                                   ; $01A196 |
  LDA #$0223                                ; $01A198 |
  JSL spawn_ambient_sprite                  ; $01A19B |
  LDA $1084                                 ; $01A19F |
  CLC                                       ; $01A1A2 |
  ADC $02                                   ; $01A1A3 |
  STA $70A2,y                               ; $01A1A5 |
  LDA $1086                                 ; $01A1A8 |
  CLC                                       ; $01A1AB |
  ADC $06                                   ; $01A1AC |
  STA $7142,y                               ; $01A1AE |
  LDA #$0080                                ; $01A1B1 |
  STA $7782,y                               ; $01A1B4 |
  LDA $04                                   ; $01A1B7 |
  STA $71E0,y                               ; $01A1B9 |
  LDA $08                                   ; $01A1BC |
  STA $71E2,y                               ; $01A1BE |
  LDA #$0004                                ; $01A1C1 |
  STA $7500,y                               ; $01A1C4 |
  LDA $0A                                   ; $01A1C7 |
  STA $73C2,y                               ; $01A1C9 |
  LDA $00                                   ; $01A1CC |
  DEC A                                     ; $01A1CE |
  DEC A                                     ; $01A1CF |
  BPL CODE_01A169                           ; $01A1D0 |
  LDA #$0047                                ; $01A1D2 |\ play sound #$0047
  JSL push_sound_queue                      ; $01A1D5 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $01A1D9 |
  RTS                                       ; $01A1DB |

hookbill_dead_shell_break:
  TYX                                       ; $01A1DC |
  LDY !s_spr_y_speed_hi,x                   ; $01A1DD |
  BMI CODE_01A225                           ; $01A1E0 |
  LDA !s_spr_oam_yxppccct,x                 ; $01A1E2 |
  BIT #$0080                                ; $01A1E5 |
  BNE CODE_01A217                           ; $01A1E8 |
  ORA #$0080                                ; $01A1EA |
  STA !s_spr_oam_yxppccct,x                 ; $01A1ED |
  LDA #$0010                                ; $01A1F0 |
  STA !s_spr_y_accel,x                      ; $01A1F3 |
  LDA !s_bg1_cam_x                          ; $01A1F6 |
  CLC                                       ; $01A1F9 |
  ADC #$0080                                ; $01A1FA |
  STA !s_spr_x_pixel_pos,x                  ; $01A1FD |
  LDA !s_bg1_cam_y                          ; $01A200 |
  SEC                                       ; $01A203 |
  SBC #$0018                                ; $01A204 |
  STA !s_spr_y_pixel_pos,x                  ; $01A207 |
  LDA #$0400                                ; $01A20A |
  STA !s_spr_y_speed_lo,x                   ; $01A20D |
  LDA #$0082                                ; $01A210 |\ play sound #$0082
  JSL push_sound_queue                      ; $01A213 |/

CODE_01A217:
  LDY $7683,x                               ; $01A217 |
  DEY                                       ; $01A21A |
  BMI CODE_01A225                           ; $01A21B |
  LDA #$0060                                ; $01A21D |
  STA !s_spr_timer_1,x                      ; $01A220 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01A223 |

CODE_01A225:
  RTS                                       ; $01A225 |

hookbill_final:
  TYX                                       ; $01A226 |
  LDA !s_spr_timer_1,x                      ; $01A227 |
  BNE CODE_01A225                           ; $01A22A |
  SEP #$20                                  ; $01A22C |
  LDA #$C0                                  ; $01A22E |
  TRB !r_reg_hdmaen_mirror                  ; $01A230 |
  REP #$20                                  ; $01A233 |
  LDY #$02                                  ; $01A235 |
  STY !r_interrupt_mode                     ; $01A237 |
  LDA #$0011                                ; $01A23A |
  STA !r_reg_tm_mirror                      ; $01A23D |
  STZ $7ECC                                 ; $01A240 |
  PLA                                       ; $01A243 |
  JML $03A32E                               ; $01A244 |

init_naval_closer:
  RTL                                       ; $01A248 |

; sub table
  dw $A32D                                  ; $01A249 |
  dw $A337                                  ; $01A24B |
  dw $A35D                                  ; $01A24D |
  dw $A39C                                  ; $01A24F |
  dw $A3A9                                  ; $01A251 |
  dw $A3E4                                  ; $01A253 |
  dw $A494                                  ; $01A255 |
  dw $A51F                                  ; $01A257 |

; data table
  dw $0005                                  ; $01A259 |
  dw $FFFF                                  ; $01A25B |
  dw $01A0                                  ; $01A25D |
  dw $0760                                  ; $01A25F |
  dw $0000                                  ; $01A261 |
  dw $0000                                  ; $01A263 |
  dw $0020                                  ; $01A265 |
  dw $0000                                  ; $01A267 |
  dw $0002                                  ; $01A269 |
  dw $FFFF                                  ; $01A26B |
  dw $00C0                                  ; $01A26D |
  dw $01A0                                  ; $01A26F |
  dw $0001                                  ; $01A271 |
  dw $0003                                  ; $01A273 |
  dw $0001                                  ; $01A275 |
  dw $01A0                                  ; $01A277 |
  dw $7FFF                                  ; $01A279 |
  dw $0004                                  ; $01A27B |
  dw $0001                                  ; $01A27D |
  dw $0006                                  ; $01A27F |
  dw $FFFF                                  ; $01A281 |
  dw $02B0                                  ; $01A283 |
  dw $07D0                                  ; $01A285 |
  dw $0005                                  ; $01A287 |
  dw $0002                                  ; $01A289 |
  dw $FFFF                                  ; $01A28B |
  dw $00C0                                  ; $01A28D |
  dw $02B0                                  ; $01A28F |
  dw $0001                                  ; $01A291 |
  dw $0003                                  ; $01A293 |
  dw $0001                                  ; $01A295 |
  dw $02B0                                  ; $01A297 |
  dw $02F0                                  ; $01A299 |
  dw $0000                                  ; $01A29B |
  dw $0002                                  ; $01A29D |
  dw $0000                                  ; $01A29F |
  dw $0001                                  ; $01A2A1 |
  dw $FFFF                                  ; $01A2A3 |
  dw $0080                                  ; $01A2A5 |
  dw $0000                                  ; $01A2A7 |
  dw $0020                                  ; $01A2A9 |
  dw $0000                                  ; $01A2AB |
  dw $0007                                  ; $01A2AD |
  dw $FFFF                                  ; $01A2AF |
  dw $0000                                  ; $01A2B1 |
  dw $0000                                  ; $01A2B3 |
  dw $0001                                  ; $01A2B5 |
  dw $0100                                  ; $01A2B7 |
  dw $0000                                  ; $01A2B9 |
  dw $0020                                  ; $01A2BB |
  dw $0000                                  ; $01A2BD |
  dw $0001                                  ; $01A2BF |
  dw $FFFF                                  ; $01A2C1 |
  dw $0020                                  ; $01A2C3 |
  dw $0004                                  ; $01A2C5 |
  dw $0001                                  ; $01A2C7 |
  dw $0020                                  ; $01A2C9 |
  dw $00B0                                  ; $01A2CB |

; data table
  dw $0606                                  ; $01A2CD |
  dw $080A                                  ; $01A2CF |
  dw $0A04                                  ; $01A2D1 |
  dw $060A                                  ; $01A2D3 |

main_naval_closer:
  JSL $03AF23                               ; $01A2D5 |
  LDA !s_spr_timer_1,x                      ; $01A2D9 |
  BNE CODE_01A324                           ; $01A2DC |
  STZ $617A                                 ; $01A2DE |
  STZ $617C                                 ; $01A2E1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $01A2E4 |
  CMP !s_spr_wildcard_2_lo,x                ; $01A2E6 |
  BNE CODE_01A2F5                           ; $01A2E9 |
  LDA #$0000                                ; $01A2EB |
  STA !s_player_state                       ; $01A2EE |
  JML $03A31E                               ; $01A2F1 |

CODE_01A2F5:
  REP #$10                                  ; $01A2F5 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $01A2F7 |
  LDA $A259,y                               ; $01A2F9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $01A2FC |
  LDA $A25D,y                               ; $01A2FE |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01A301 |
  LDA $A25F,y                               ; $01A303 |
  STA !s_spr_gsu_morph_1_lo,x               ; $01A306 |
  LDA $A261,y                               ; $01A309 |
  STA !s_spr_gsu_morph_2_lo,x               ; $01A30C |
  LDA $A25B,y                               ; $01A30F |
  STA !s_spr_timer_1,x                      ; $01A312 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01A315 |
  LDA $A2CD,y                               ; $01A317 |
  AND #$00FF                                ; $01A31A |
  CLC                                       ; $01A31D |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $01A31E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01A320 |
  SEP #$10                                  ; $01A322 |

CODE_01A324:
  TXY                                       ; $01A324 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $01A325 |
  ASL A                                     ; $01A327 |
  TAX                                       ; $01A328 |
  JSR ($A249,x)                             ; $01A329 | sub table
  RTL                                       ; $01A32C |

; ; ; $A249 table sub
  TYX                                       ; $01A32D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A32E |
  STA $617A                                 ; $01A330 |
  STA $617C                                 ; $01A333 |
  RTS                                       ; $01A336 |

; ; ; $A249 table sub
  TYX                                       ; $01A337 |
  STY !r_autoscr_x_active                   ; $01A338 |
  LDA #$0002                                ; $01A33B |
  STA !s_player_state                       ; $01A33E |
  LDA !s_player_x_cam_rel                   ; $01A341 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $01A344 |
  BNE CODE_01A34C                           ; $01A346 |
  STZ !s_spr_timer_1,x                      ; $01A348 |
  RTS                                       ; $01A34B |

CODE_01A34C:
  BPL CODE_01A353                           ; $01A34C |
  DEC !r_bg1_cam_x                          ; $01A34E |
  BRA CODE_01A356                           ; $01A351 |

CODE_01A353:
  INC !r_bg1_cam_x                          ; $01A353 |

CODE_01A356:
  LDA !r_bg1_cam_x                          ; $01A356 |
  STA $0C23                                 ; $01A359 |
  RTS                                       ; $01A35C |

; $A249 table sub
  TYX                                       ; $01A35D |
  STY !r_autoscr_x_active                   ; $01A35E |
  LDA !s_spr_wildcard_1_lo,x                ; $01A361 |
  CLC                                       ; $01A364 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $01A365 |

CODE_01A367:
  CMP #$0100                                ; $01A367 |
  BMI CODE_01A392                           ; $01A36A |
  SEC                                       ; $01A36C |
  SBC #$0100                                ; $01A36D |
  PHA                                       ; $01A370 |
  LDA !r_bg1_cam_x                          ; $01A371 |
  SEC                                       ; $01A374 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $01A375 |
  EOR !s_spr_gsu_morph_2_lo,x               ; $01A378 |
  BMI CODE_01A385                           ; $01A37B |
  PLA                                       ; $01A37D |
  STZ !s_spr_timer_1,x                      ; $01A37E |
  STZ !r_autoscr_x_active                   ; $01A381 |
  RTS                                       ; $01A384 |

CODE_01A385:
  LDA !r_bg1_cam_x                          ; $01A385 |
  CLC                                       ; $01A388 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $01A389 |
  STA !r_bg1_cam_x                          ; $01A38C |
  PLA                                       ; $01A38F |
  BRA CODE_01A367                           ; $01A390 |

CODE_01A392:
  STA !s_spr_wildcard_1_lo,x                ; $01A392 |
  LDA !r_bg1_cam_x                          ; $01A395 |
  STA $0C23                                 ; $01A398 |
  RTS                                       ; $01A39B |

; $A249 table sub
  TYX                                       ; $01A39C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A39D |
  STA !s_cam_x_left_boundary                ; $01A39F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A3A2 |
  STA !s_cam_x_right_boundary               ; $01A3A5 |

CODE_01A3A8:
  RTS                                       ; $01A3A8 |

; $A249 table sub
  TYX                                       ; $01A3A9 |
  INC $105A                                 ; $01A3AA |
  PLA                                       ; $01A3AD |
  JML $03A31E                               ; $01A3AE |

; data table
  dw $0020                                  ; $01A3B2 |
  dw $0000                                  ; $01A3B4 |
  dw $001F                                  ; $01A3B6 |
  dw $0020                                  ; $01A3B8 |
  dw $0020                                  ; $01A3BA |

; data table
  dw $015C                                  ; $01A3BC |
  dw $015A                                  ; $01A3BE |
  dw $015B                                  ; $01A3C0 |
  dw $015C                                  ; $01A3C2 |
  dw $015C                                  ; $01A3C4 |

; data table
  dw $0000                                  ; $01A3C6 |
  dw $0010                                  ; $01A3C8 |
  dw $FFF0                                  ; $01A3CA |
  dw $0010                                  ; $01A3CC |
  dw $FFF0                                  ; $01A3CE |

; data table
  dw $0000                                  ; $01A3D0 |
  dw $0000                                  ; $01A3D2 |
  dw $0010                                  ; $01A3D4 |
  dw $0000                                  ; $01A3D6 |
  dw $0010                                  ; $01A3D8 |

; data table
  dw $0001                                  ; $01A3DA |
  dw $0000                                  ; $01A3DC |
  dw $0001                                  ; $01A3DE |
  dw $0001                                  ; $01A3E0 |
  dw $0001                                  ; $01A3E2 |

; $A249 table sub
  TYX                                       ; $01A3E4 |
  LDA !s_spr_timer_2,x                      ; $01A3E5 |
  BNE CODE_01A3A8                           ; $01A3E8 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $01A3EA |
  LDA $A3B2,y                               ; $01A3ED |
  STA !s_spr_timer_2,x                      ; $01A3F0 |
  LDA $A3DA,y                               ; $01A3F3 |
  PHP                                       ; $01A3F6 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A3F7 |
  STA $0093                                 ; $01A3FA |
  CLC                                       ; $01A3FD |
  ADC $A3D0,y                               ; $01A3FE |
  STA !s_spr_gsu_morph_1_lo,x               ; $01A401 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A404 |
  STA $0091                                 ; $01A406 |
  CLC                                       ; $01A409 |
  ADC $A3C6,y                               ; $01A40A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01A40D |
  LDA $A3BC,y                               ; $01A40F |
  STA $0095                                 ; $01A412 |
  LDA #$0001                                ; $01A415 |
  STA $008F                                 ; $01A418 |
  JSL $109295                               ; $01A41B |
  LDX $12                                   ; $01A41F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A421 |
  CMP #$07B0                                ; $01A424 |
  BNE CODE_01A433                           ; $01A427 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A429 |
  CMP #$01A0                                ; $01A42B |
  BNE CODE_01A433                           ; $01A42E |
  STZ !s_spr_timer_1,x                      ; $01A430 |

CODE_01A433:
  LDA !s_spr_gsu_morph_2_lo,x               ; $01A433 |
  INC A                                     ; $01A436 |
  INC A                                     ; $01A437 |
  CMP #$000A                                ; $01A438 |
  BMI CODE_01A440                           ; $01A43B |
  LDA #$0000                                ; $01A43D |

CODE_01A440:
  STA !s_spr_gsu_morph_2_lo,x               ; $01A440 |
  PLP                                       ; $01A443 |
  BEQ CODE_01A477                           ; $01A444 |
  LDA #$0047                                ; $01A446 |\ play sound #$0047
  JSL push_sound_queue                      ; $01A449 |/
  LDA #$01E6                                ; $01A44D |
  JSL spawn_ambient_sprite                  ; $01A450 |
  LDA $0091                                 ; $01A454 |
  CLC                                       ; $01A457 |
  ADC #$0008                                ; $01A458 |
  STA $70A2,y                               ; $01A45B |
  LDA $0093                                 ; $01A45E |
  CLC                                       ; $01A461 |
  ADC #$0008                                ; $01A462 |
  STA $7142,y                               ; $01A465 |
  LDA #$0004                                ; $01A468 |
  STA $7782,y                               ; $01A46B |
  LDA #$0006                                ; $01A46E |
  STA $73C2,y                               ; $01A471 |
  STA $7E4C,y                               ; $01A474 |

CODE_01A477:
  RTS                                       ; $01A477 |

; data (address?) table
  dw $7978                                  ; $01A478 |
  dw $7979                                  ; $01A47A |
  dw $797A                                  ; $01A47C |
  dw $797B                                  ; $01A47E |
  dw $0000                                  ; $01A480 |
  dw $793C                                  ; $01A482 |
  dw $793D                                  ; $01A484 |
  dw $793E                                  ; $01A486 |
  dw $793F                                  ; $01A488 |
  dw $7940                                  ; $01A48A |
  dw $7942                                  ; $01A48C |
  dw $7943                                  ; $01A48E |
  dw $0000                                  ; $01A490 |
  dw $793C                                  ; $01A492 |

; $A249 table sub
  TYX                                       ; $01A494 |
  LDA !s_spr_timer_4,x                      ; $01A495 |
  BNE CODE_01A477                           ; $01A498 |
  LDA #$0020                                ; $01A49A |
  STA !s_spr_timer_4,x                      ; $01A49D |
  LDA #$0047                                ; $01A4A0 |\ play sound #$0047
  JSL push_sound_queue                      ; $01A4A3 |/
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A4A7 |
  STA $0091                                 ; $01A4A9 |
  STA $04                                   ; $01A4AC |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A4AE |
  STA $0093                                 ; $01A4B1 |
  LDA #$0001                                ; $01A4B4 |
  STA $008F                                 ; $01A4B7 |
  LDA #$0006                                ; $01A4BA |
  SEC                                       ; $01A4BD |
  SBC !s_spr_gsu_morph_2_lo,x               ; $01A4BE |
  ASL A                                     ; $01A4C1 |
  ASL A                                     ; $01A4C2 |
  CLC                                       ; $01A4C3 |
  ADC #$0008                                ; $01A4C4 |
  STA $00                                   ; $01A4C7 |
  STA $02                                   ; $01A4C9 |

CODE_01A4CB:
  LDA $02                                   ; $01A4CB |
  SEC                                       ; $01A4CD |
  SBC $00                                   ; $01A4CE |
  TAY                                       ; $01A4D0 |
  LDA $A478,y                               ; $01A4D1 |
  STA $0095                                 ; $01A4D4 |
  JSL $109295                               ; $01A4D7 |
  LDA $0091                                 ; $01A4DB |
  CLC                                       ; $01A4DE |
  ADC #$0010                                ; $01A4DF |
  STA $0091                                 ; $01A4E2 |
  LDA $00                                   ; $01A4E5 |
  AND #$0002                                ; $01A4E7 |
  BEQ CODE_01A4FB                           ; $01A4EA |
  LDA $04                                   ; $01A4EC |
  STA $0091                                 ; $01A4EE |
  LDA $0093                                 ; $01A4F1 |
  CLC                                       ; $01A4F4 |
  ADC #$0010                                ; $01A4F5 |
  STA $0093                                 ; $01A4F8 |

CODE_01A4FB:
  DEC $00                                   ; $01A4FB |
  DEC $00                                   ; $01A4FD |
  BNE CODE_01A4CB                           ; $01A4FF |
  LDX $12                                   ; $01A501 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A503 |
  SEC                                       ; $01A506 |
  SBC #$0010                                ; $01A507 |
  STA !s_spr_gsu_morph_1_lo,x               ; $01A50A |
  DEC !s_spr_gsu_morph_2_lo,x               ; $01A50D |
  BNE CODE_01A51E                           ; $01A510 |
  STZ !s_player_x_speed_prev                ; $01A512 |
  STZ !s_player_x_speed                     ; $01A515 |
  STZ !s_spr_timer_1,x                      ; $01A518 |
  INC $105A                                 ; $01A51B |

CODE_01A51E:
  RTS                                       ; $01A51E |

; $A249 table sub
  TYX                                       ; $01A51F |
  LDA !s_spr_timer_2,x                      ; $01A520 |
  BNE CODE_01A51E                           ; $01A523 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A525 |
  BNE CODE_01A541                           ; $01A527 |
  LDA #$0003                                ; $01A529 |
  STA !s_spr_wildcard_1_lo,x                ; $01A52C |
  LDA !r_bg1_cam_x                          ; $01A52F |
  AND #$FFE0                                ; $01A532 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01A535 |
  LDA !r_bg1_cam_y                          ; $01A537 |
  CLC                                       ; $01A53A |
  ADC #$00B0                                ; $01A53B |
  STA !s_spr_gsu_morph_1_lo,x               ; $01A53E |

CODE_01A541:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A541 |
  STA $0091                                 ; $01A543 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A546 |
  STA $0093                                 ; $01A549 |
  LDA #$0001                                ; $01A54C |
  STA $008F                                 ; $01A54F |
  LDA #$0000                                ; $01A552 |
  STA $0095                                 ; $01A555 |
  JSL $109295                               ; $01A558 |
  LDA $0093                                 ; $01A55C |
  CLC                                       ; $01A55F |
  ADC #$0010                                ; $01A560 |
  STA $0093                                 ; $01A563 |
  JSL $109295                               ; $01A566 |
  LDA $0091                                 ; $01A56A |
  CLC                                       ; $01A56D |
  ADC #$0010                                ; $01A56E |
  STA $0091                                 ; $01A571 |
  JSL $109295                               ; $01A574 |
  LDA $0093                                 ; $01A578 |
  SEC                                       ; $01A57B |
  SBC #$0010                                ; $01A57C |
  STA $0093                                 ; $01A57F |
  JSL $109295                               ; $01A582 |
  LDX $12                                   ; $01A586 |
  LDA #$020C                                ; $01A588 |
  JSL spawn_ambient_sprite                  ; $01A58B |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $01A58F |
  STA $70A2,y                               ; $01A591 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A594 |
  STA $7142,y                               ; $01A597 |
  LDA #$0002                                ; $01A59A |
  STA $7782,y                               ; $01A59D |
  LDA #$000D                                ; $01A5A0 |
  STA $73C2,y                               ; $01A5A3 |
  LDA #$0036                                ; $01A5A6 |
  STA $7002,y                               ; $01A5A9 |
  LDA #$0047                                ; $01A5AC |\ play sound #$0047
  JSL push_sound_queue                      ; $01A5AF |/
  DEC !s_spr_wildcard_1_lo,x                ; $01A5B3 |
  BNE CODE_01A5BC                           ; $01A5B6 |
  STZ !s_spr_timer_1,x                      ; $01A5B8 |
  RTS                                       ; $01A5BB |

CODE_01A5BC:
  LDA #$0010                                ; $01A5BC |
  STA !s_spr_timer_2,x                      ; $01A5BF |
  ASL A                                     ; $01A5C2 |
  CLC                                       ; $01A5C3 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $01A5C4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01A5C6 |
  RTS                                       ; $01A5C8 |

init_flan:
  LDA !s_spr_wildcard_1_lo,x                ; $01A5C9 |
  CMP !s_spr_wildcard_2_lo,x                ; $01A5CC |
  BNE CODE_01A5DF                           ; $01A5CF |
  DEC !s_spr_wildcard_1_lo,x                ; $01A5D1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $01A5D4 |
  LDA #$0002                                ; $01A5D6 |
  STA !s_spr_timer_2,x                      ; $01A5D9 |
  INC !s_spr_anim_frame,x                   ; $01A5DC |

CODE_01A5DF:
  RTL                                       ; $01A5DF |

; flan pointer table
  dw $A830                                  ; $01A5E0 |
  dw $A889                                  ; $01A5E2 |
  dw $A8C0                                  ; $01A5E4 |
  dw $A8F2                                  ; $01A5E6 |
  dw $AA1F                                  ; $01A5E8 |
  dw $AA6B                                  ; $01A5EA |

main_flan:
  JSL $01A60B                               ; $01A5EC |
  JSR CODE_01A740                           ; $01A5F0 |
  TXY                                       ; $01A5F3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $01A5F4 |
  ASL A                                     ; $01A5F6 |
  TAX                                       ; $01A5F7 |
  JSR ($A5E0,x)                             ; $01A5F8 | flan table
  LDA #$0620                                ; $01A5FB |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01A5FE |
  CPY #$02                                  ; $01A600 |
  BMI CODE_01A607                           ; $01A602 |
  LDA #$0660                                ; $01A604 |

CODE_01A607:
  STA !s_spr_bitwise_settings_1,x           ; $01A607 |
  RTL                                       ; $01A60A |

; flan l sub
  LDA !s_sprite_disable_flag                ; $01A60B |
  ORA $0B55                                 ; $01A60E |
  ORA !r_cur_item_used                      ; $01A611 |
  BEQ CODE_01A619                           ; $01A614 |
  PLY                                       ; $01A616 |\
  PLA                                       ; $01A617 | | skips the RTL
  RTL                                       ; $01A618 |/  and goes back one long in stack

CODE_01A619:
  LDA !s_spr_bitwise_settings_3,x           ; $01A619 |
  AND #$FFE1                                ; $01A61C |
  LDY !s_spr_collision_state,x              ; $01A61F |
  BNE CODE_01A62D                           ; $01A622 |
  ORA #$0008                                ; $01A624 |
  STA !s_spr_bitwise_settings_3,x           ; $01A627 |
  JMP CODE_01A715                           ; $01A62A |

CODE_01A62D:
  STA !s_spr_bitwise_settings_3,x           ; $01A62D |
  STZ $0E                                   ; $01A630 |
  TXA                                       ; $01A632 |
  STA !gsu_r1                               ; $01A633 |
  LDX #$09                                  ; $01A636 |
  LDA #$9011                                ; $01A638 |
  JSL r_gsu_init_1                          ; $01A63B | GSU init

CODE_01A63F:
  LDX $12                                   ; $01A63F |
  LDY !gsu_r14                              ; $01A641 |
  BMI CODE_01A6A0                           ; $01A644 |
  BEQ CODE_01A6A0                           ; $01A646 |
  LDA !s_spr_state,y                        ; $01A648 |
  CMP #$0010                                ; $01A64B |
  BNE CODE_01A6B9                           ; $01A64E |
  LDA !s_spr_bitwise_settings_3,y           ; $01A650 |
  AND #$0800                                ; $01A653 |
  BEQ CODE_01A6A0                           ; $01A656 |
  LDA !s_spr_id,y                           ; $01A658 |
  CMP #$0109                                ; $01A65B |
  BEQ CODE_01A6A0                           ; $01A65E |
  CMP #$010A                                ; $01A660 |
  BEQ CODE_01A6A0                           ; $01A663 |
  CMP #$010B                                ; $01A665 |
  BEQ CODE_01A6A0                           ; $01A668 |
  PHY                                       ; $01A66A |
  TYX                                       ; $01A66B |
  JSL $03B24B                               ; $01A66C |
  PLY                                       ; $01A670 |
  LDA #$0000                                ; $01A671 |
  STA !s_spr_x_accel,y                      ; $01A674 |
  LDA #$FE00                                ; $01A677 |
  STA !s_spr_y_speed_lo,y                   ; $01A67A |
  INC $0E                                   ; $01A67D |
  LDX $12                                   ; $01A67F |
  LDA #$0040                                ; $01A681 |
  STA !s_spr_y_accel,y                      ; $01A684 |
  LDA !s_spr_x_speed_lo,x                   ; $01A687 |
  CMP #$8000                                ; $01A68A |
  ROR A                                     ; $01A68D |
  STA !s_spr_x_speed_lo,y                   ; $01A68E |
  JSL $03B53D                               ; $01A691 |
  LDX #$09                                  ; $01A695 |
  LDA !gsu_r15                              ; $01A697 |
  JSL r_gsu_init_1                          ; $01A69A | gsu (continue from previous?)
  BRA CODE_01A63F                           ; $01A69E |

CODE_01A6A0:
  LDY $0E                                   ; $01A6A0 |
  BEQ CODE_01A6B9                           ; $01A6A2 |

CODE_01A6A4:
  TXY                                       ; $01A6A4 |
  LDA !s_spr_id,x                           ; $01A6A5 |
  JSL $03A377                               ; $01A6A8 |
  LDA #$9A6C                                ; $01A6AC |
  STA $00                                   ; $01A6AF |
  LDA #$0003                                ; $01A6B1 |
  STA $02                                   ; $01A6B4 |
  JML [$7960]                               ; $01A6B6 |

CODE_01A6B9:
  LDA $7860,x                               ; $01A6B9 |
  AND #$000C                                ; $01A6BC |
  BEQ CODE_01A6C9                           ; $01A6BF |
  INC !s_spr_wildcard_1_lo,x                ; $01A6C1 |
  INC !s_spr_wildcard_2_lo,x                ; $01A6C4 |
  BRA CODE_01A6A4                           ; $01A6C7 |

CODE_01A6C9:
  LDA $7860,x                               ; $01A6C9 |
  AND #$0001                                ; $01A6CC |
  BEQ CODE_01A6F7                           ; $01A6CF |
  JSL $03A590                               ; $01A6D1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $01A6D5 |
  CMP #$0002                                ; $01A6D7 |
  BCC CODE_01A6E9                           ; $01A6DA |
  LDA !s_spr_x_speed_lo,x                   ; $01A6DC |
  BNE CODE_01A6EB                           ; $01A6DF |
  LDA !s_spr_timer_1,x                      ; $01A6E1 |
  BEQ CODE_01A6A4                           ; $01A6E4 |
  PLY                                       ; $01A6E6 |\
  PLA                                       ; $01A6E7 | | skips the RTL
  RTL                                       ; $01A6E8 |/  and goes back one long in stack

CODE_01A6E9:
  INC !s_spr_wildcard_4_lo_dp,x             ; $01A6E9 |

CODE_01A6EB:
  LDA #$FD80                                ; $01A6EB |
  STA !s_spr_y_speed_lo,x                   ; $01A6EE |
  LDA #$0040                                ; $01A6F1 |
  STA !s_spr_y_accel,x                      ; $01A6F4 |

CODE_01A6F7:
  LDA !s_spr_timer_2,x                      ; $01A6F7 |
  AND #$0003                                ; $01A6FA |
  BNE CODE_01A712                           ; $01A6FD |
  LDA #$0004                                ; $01A6FF |
  STA !s_spr_timer_2,x                      ; $01A702 |
  LDA !s_spr_anim_frame,x                   ; $01A705 |
  INC A                                     ; $01A708 |
  AND #$0003                                ; $01A709 |
  ORA #$0004                                ; $01A70C |
  STA !s_spr_anim_frame,x                   ; $01A70F |

CODE_01A712:
  PLY                                       ; $01A712 |\
  PLA                                       ; $01A713 | | skips the RTL

CODE_01A714:
  RTL                                       ; $01A714 |/  and goes back one long in stack

CODE_01A715:
  LDA !s_spr_state,x                        ; $01A715 |
  CMP #$0010                                ; $01A718 |
  BEQ CODE_01A714                           ; $01A71B |
  CMP #$0008                                ; $01A71D |
  BNE CODE_01A73D                           ; $01A720 |
  LDY !s_spr_draw_priority,x                ; $01A722 |
  BPL CODE_01A73D                           ; $01A725 |
  LDA !s_spr_bitwise_settings_3,x           ; $01A727 |
  AND #$FCFF                                ; $01A72A |
  STA !s_spr_bitwise_settings_3,x           ; $01A72D |
  LDA #$0002                                ; $01A730 |
  STA !s_spr_wildcard_1_lo,x                ; $01A733 |
  STA !s_spr_wildcard_2_lo,x                ; $01A736 |
  ASL A                                     ; $01A739 |
  STA !s_spr_anim_frame,x                   ; $01A73A |

CODE_01A73D:
  PLY                                       ; $01A73D |
  PLA                                       ; $01A73E |
  RTL                                       ; $01A73F |

; flan s sub
CODE_01A740:
  LDY !s_spr_anim_frame,x                   ; $01A740 |
  CPY #$04                                  ; $01A743 |
  BPL CODE_01A7A0                           ; $01A745 |
  LDY !s_spr_collision_id,x                 ; $01A747 |
  BPL CODE_01A7A1                           ; $01A74A |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01A74C |
  CPY #$03                                  ; $01A74E |
  BPL CODE_01A7A0                           ; $01A750 |
  LDA !s_spr_y_player_delta,x               ; $01A752 |
  SEC                                       ; $01A755 |
  SBC !s_player_hitbox_half_height          ; $01A756 |
  SEC                                       ; $01A759 |
  SBC !s_spr_hitbox_height,x                ; $01A75A |
  CMP #$FFF8                                ; $01A75D |
  BCC CODE_01A79C                           ; $01A760 |
  LDY !s_player_jump_state                  ; $01A762 |
  BEQ CODE_01A7A0                           ; $01A765 |
  LDY $60AB                                 ; $01A767 |
  BMI CODE_01A7A0                           ; $01A76A |
  STZ !s_player_x_speed_prev                ; $01A76C |
  STZ !s_player_x_speed                     ; $01A76F |
  STZ !s_player_y_speed                     ; $01A772 |
  STZ !s_player_ground_pound_state          ; $01A775 |
  INC !s_on_sprite_platform_flag            ; $01A778 |
  LDA !s_spr_y_pixel_pos,x                  ; $01A77B |
  CLC                                       ; $01A77E |
  ADC #$FFE8                                ; $01A77F |
  STA !s_player_y                           ; $01A782 |
  INC !s_spr_gsu_morph_1_lo,x               ; $01A785 |

CODE_01A788:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01A788 |
  STZ !s_spr_x_speed_lo,x                   ; $01A78A |
  STZ !s_spr_timer_2,x                      ; $01A78D |
  LDY #$03                                  ; $01A790 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $01A792 |
  LDA #$005F                                ; $01A794 |\ play sound #$005F
  JSL push_sound_queue                      ; $01A797 |/
  RTS                                       ; $01A79B |

CODE_01A79C:
  JSL player_hit_sprite                     ; $01A79C |

CODE_01A7A0:
  RTS                                       ; $01A7A0 |

CODE_01A7A1:
  BEQ CODE_01A7A0                           ; $01A7A1 |
  LDA !s_spr_timer_3,x                      ; $01A7A3 |
  BNE CODE_01A7A0                           ; $01A7A6 |
  LDA $7D37,y                               ; $01A7A8 |
  BEQ CODE_01A7A0                           ; $01A7AB |
  LDA $7541,y                               ; $01A7AD |
  CMP #$0040                                ; $01A7B0 |
  BMI CODE_01A788                           ; $01A7B3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $01A7B5 |
  CMP #$0001                                ; $01A7B7 |
  BEQ CODE_01A7DA                           ; $01A7BA |
  CMP #$0003                                ; $01A7BC |
  BEQ CODE_01A7DA                           ; $01A7BF |
  LDA #$0001                                ; $01A7C1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $01A7C4 |
  STZ !s_spr_anim_frame,x                   ; $01A7C6 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01A7C9 |
  LDA #$0003                                ; $01A7CB |
  STA !s_spr_timer_2,x                      ; $01A7CE |
  PHY                                       ; $01A7D1 |
  LDA #$0013                                ; $01A7D2 |\ play sound #$0013
  JSL push_sound_queue                      ; $01A7D5 |/
  PLY                                       ; $01A7D9 |

CODE_01A7DA:
  LDA #$0040                                ; $01A7DA |
  STA !s_spr_timer_1,x                      ; $01A7DD |
  LDA #$FE00                                ; $01A7E0 |
  STA !s_spr_x_speed_hi,y                   ; $01A7E3 |
  LDA $721F,y                               ; $01A7E6 |
  CLC                                       ; $01A7E9 |
  ADC #$0080                                ; $01A7EA |
  CMP #$0100                                ; $01A7ED |
  BCS CODE_01A812                           ; $01A7F0 |
  LDA #$0010                                ; $01A7F2 |
  STA !s_spr_timer_1,x                      ; $01A7F5 |
  ASL A                                     ; $01A7F8 |
  STA !s_spr_timer_3,x                      ; $01A7F9 |
  LDA #$FC00                                ; $01A7FC |
  STA !s_spr_x_speed_hi,y                   ; $01A7FF |
  LDA !s_spr_facing_dir,x                   ; $01A802 |
  DEC A                                     ; $01A805 |
  PHP                                       ; $01A806 |
  LDA #$FE00                                ; $01A807 |
  PLP                                       ; $01A80A |
  BPL CODE_01A819                           ; $01A80B |
  LDA #$0200                                ; $01A80D |
  BRA CODE_01A819                           ; $01A810 |

CODE_01A812:
  LDA $721F,y                               ; $01A812 |
  EOR #$FFFF                                ; $01A815 |
  INC A                                     ; $01A818 |

CODE_01A819:
  STA $721F,y                               ; $01A819 |
  STZ !s_spr_x_speed_lo,x                   ; $01A81C |
  RTS                                       ; $01A81F |

; data table
  dw $FFC0                                  ; $01A820 |
  dw $0040                                  ; $01A822 |

; data table
  db $00                                    ; $01A824 |
  db $01                                    ; $01A825 |
  db $02                                    ; $01A826 |
  db $03                                    ; $01A827 |
  db $02                                    ; $01A828 |
  db $01                                    ; $01A829 |

; data table
  db $08                                    ; $01A82A |
  db $06                                    ; $01A82B |
  db $06                                    ; $01A82C |
  db $08                                    ; $01A82D |
  db $06                                    ; $01A82E |
  db $06                                    ; $01A82F |

; flan table sub
  TYX                                       ; $01A830 |
  LDA !s_spr_timer_1,x                      ; $01A831 |
  BNE CODE_01A862                           ; $01A834 |
  LDY !s_spr_facing_dir,x                   ; $01A836 |
  LDA $A820,y                               ; $01A839 |
  STA !s_spr_x_speed_lo,x                   ; $01A83C |
  LDA !s_spr_timer_2,x                      ; $01A83F |
  BNE CODE_01A862                           ; $01A842 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $01A844 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A846 |
  CPY #$06                                  ; $01A848 |
  BMI CODE_01A850                           ; $01A84A |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01A84C |
  LDY #$00                                  ; $01A84E |

CODE_01A850:
  LDA $A824,y                               ; $01A850 |
  AND #$00FF                                ; $01A853 |
  STA !s_spr_anim_frame,x                   ; $01A856 |
  LDA $A82A,y                               ; $01A859 |
  AND #$00FF                                ; $01A85C |
  STA !s_spr_timer_2,x                      ; $01A85F |

CODE_01A862:
  RTS                                       ; $01A862 |

; data table (starts from $A862 in code)
  db $01                                    ; $01A863 |
  db $02                                    ; $01A864 |
  db $03                                    ; $01A865 |
  db $02                                    ; $01A866 |
  db $01                                    ; $01A867 |
  db $00                                    ; $01A868 |
  db $01                                    ; $01A869 |
  db $02                                    ; $01A86A |
  db $03                                    ; $01A86B |
  db $02                                    ; $01A86C |
  db $01                                    ; $01A86D |
  db $02                                    ; $01A86E |
  db $03                                    ; $01A86F |
  db $02                                    ; $01A870 |
  db $01                                    ; $01A871 |
  db $02                                    ; $01A872 |
  db $03                                    ; $01A873 |
  db $02                                    ; $01A874 |
  db $01                                    ; $01A875 |

; data table (starts from $A875 in code)
  db $03                                    ; $01A876 |
  db $03                                    ; $01A877 |
  db $03                                    ; $01A878 |
  db $03                                    ; $01A879 |
  db $03                                    ; $01A87A |
  db $03                                    ; $01A87B |
  db $03                                    ; $01A87C |
  db $03                                    ; $01A87D |
  db $04                                    ; $01A87E |
  db $04                                    ; $01A87F |
  db $04                                    ; $01A880 |
  db $04                                    ; $01A881 |
  db $04                                    ; $01A882 |
  db $06                                    ; $01A883 |
  db $06                                    ; $01A884 |
  db $06                                    ; $01A885 |
  db $10                                    ; $01A886 |
  db $06                                    ; $01A887 |
  db $06                                    ; $01A888 |

; flan table sub
  TYX                                       ; $01A889 |
  LDA !s_spr_timer_2,x                      ; $01A88A |
  BNE CODE_01A8B7                           ; $01A88D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $01A88F |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A891 |
  CPY #$14                                  ; $01A893 |
  BMI CODE_01A8A5                           ; $01A895 |

CODE_01A897:
  STZ !s_spr_anim_frame,x                   ; $01A897 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01A89A |
  LDA #$0008                                ; $01A89C |
  STA !s_spr_timer_2,x                      ; $01A89F |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $01A8A2 |
  RTS                                       ; $01A8A4 |

CODE_01A8A5:
  LDA $A862,y                               ; $01A8A5 |
  AND #$00FF                                ; $01A8A8 |
  STA !s_spr_anim_frame,x                   ; $01A8AB |
  LDA $A875,y                               ; $01A8AE |
  AND #$00FF                                ; $01A8B1 |
  STA !s_spr_timer_2,x                      ; $01A8B4 |

CODE_01A8B7:
  RTS                                       ; $01A8B7 |

; data table (starts from $A8B7 in code)
  db $02, $03                               ; $01A8B8 |
  db $02, $01                               ; $01A8BA |

; data table (starts from $A8BB in code)
  db $02, $10                               ; $01A8BC |
  db $06, $06                               ; $01A8BE |

; flan table sub
  TYX                                       ; $01A8C0 |
  LDA !s_spr_timer_2,x                      ; $01A8C1 |
  BNE CODE_01A8E0                           ; $01A8C4 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $01A8C6 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A8C8 |
  CPY #$05                                  ; $01A8CA |
  BPL CODE_01A897                           ; $01A8CC |
  LDA $A8B7,y                               ; $01A8CE |
  AND #$00FF                                ; $01A8D1 |
  STA !s_spr_anim_frame,x                   ; $01A8D4 |
  LDA $A8BB,y                               ; $01A8D7 |
  AND #$00FF                                ; $01A8DA |
  STA !s_spr_timer_2,x                      ; $01A8DD |

CODE_01A8E0:
  RTS                                       ; $01A8E0 |

; data table (starts from $A8E0 in code)
  db $0C                                    ; $01A8E1 |
  db $0B                                    ; $01A8E2 |
  db $08                                    ; $01A8E3 |
  db $09                                    ; $01A8E4 |
  db $0A                                    ; $01A8E5 |
  db $09                                    ; $01A8E6 |
  db $08                                    ; $01A8E7 |

; data table (starts from $A8E7 in code)
  db $04                                    ; $01A8E8 |
  db $02                                    ; $01A8E9 |
  db $04                                    ; $01A8EA |
  db $04                                    ; $01A8EB |
  db $04                                    ; $01A8EC |
  db $04                                    ; $01A8ED |
  db $60                                    ; $01A8EE |

; data table
  db $08                                    ; $01A8EF |
  db $0A                                    ; $01A8F0 |
  db $0C                                    ; $01A8F1 |

; flan table sub
  TYX                                       ; $01A8F2 |
  LDA !s_spr_timer_2,x                      ; $01A8F3 |
  BEQ CODE_01A8FB                           ; $01A8F6 |
  JMP CODE_01A9F2                           ; $01A8F8 |

CODE_01A8FB:
  INC !s_spr_wildcard_3_lo_dp,x             ; $01A8FB |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A8FD |
  CPY #$03                                  ; $01A8FF |
  BEQ CODE_01A906                           ; $01A901 |
  JMP CODE_01A9C8                           ; $01A903 |

CODE_01A906:
  LDA #$01F4                                ; $01A906 |
  JSL spawn_ambient_sprite                  ; $01A909 |
  LDA #$0008                                ; $01A90D |
  STA $73C2,y                               ; $01A910 |
  CLC                                       ; $01A913 |
  ADC !s_spr_x_pixel_pos,x                  ; $01A914 |
  STA $70A2,y                               ; $01A917 |
  LDA !s_spr_y_pixel_pos,x                  ; $01A91A |
  CLC                                       ; $01A91D |
  ADC #$0004                                ; $01A91E |
  STA $7142,y                               ; $01A921 |
  LDA #$0002                                ; $01A924 |
  STA $7782,y                               ; $01A927 |
  LDA $10                                   ; $01A92A |
  STA $06                                   ; $01A92C |
  XBA                                       ; $01A92E |
  STA $08                                   ; $01A92F |
  LDA !s_spr_x_pixel_pos,x                  ; $01A931 |
  STA $0A                                   ; $01A934 |
  LDA !s_spr_y_pixel_pos,x                  ; $01A936 |
  STA $0C                                   ; $01A939 |
  LDY #$03                                  ; $01A93B |

CODE_01A93D:
  PHY                                       ; $01A93D |
  LDA #$0112                                ; $01A93E |
  JSL spawn_sprite_active                   ; $01A941 |
  BCC CODE_01A9C3                           ; $01A945 |
  LDA $06                                   ; $01A947 |
  AND #$003F                                ; $01A949 |
  SEC                                       ; $01A94C |
  SBC #$001C                                ; $01A94D |
  STA $04                                   ; $01A950 |
  CLC                                       ; $01A952 |
  ADC $0A                                   ; $01A953 |
  STA !s_spr_x_pixel_pos,y                  ; $01A955 |
  CLC                                       ; $01A958 |
  ADC #$0008                                ; $01A959 |
  STA !gsu_r8                               ; $01A95C |
  LDA $08                                   ; $01A95F |
  AND #$001F                                ; $01A961 |
  EOR #$FFFF                                ; $01A964 |
  SEC                                       ; $01A967 |
  SBC #$0003                                ; $01A968 |
  STA $02                                   ; $01A96B |
  CLC                                       ; $01A96D |
  ADC $0C                                   ; $01A96E |
  STA !s_spr_y_pixel_pos,y                  ; $01A970 |
  CLC                                       ; $01A973 |
  ADC #$0008                                ; $01A974 |
  STA !gsu_r0                               ; $01A977 |
  PHY                                       ; $01A97A |
  LDX #$0A                                  ; $01A97B |
  LDA #$CE2F                                ; $01A97D |
  JSL r_gsu_init_3                          ; $01A980 | GSU init
  LDX $12                                   ; $01A984 |
  PLY                                       ; $01A986 |
  LDA !gsu_r6                               ; $01A987 |
  CMP #$0000                                ; $01A98A |
  BNE CODE_01A998                           ; $01A98D |
  TYX                                       ; $01A98F |
  JSL $03A31E                               ; $01A990 |
  LDX $12                                   ; $01A994 |
  BRA CODE_01A9A5                           ; $01A996 |

CODE_01A998:
  LDA $06                                   ; $01A998 |
  XBA                                       ; $01A99A |
  AND #$001F                                ; $01A99B |
  CLC                                       ; $01A99E |
  ADC #$0050                                ; $01A99F |
  STA !s_spr_timer_1,y                      ; $01A9A2 |

CODE_01A9A5:
  LDA $06                                   ; $01A9A5 |
  EOR #$FFFF                                ; $01A9A7 |
  ROR A                                     ; $01A9AA |
  ROR A                                     ; $01A9AB |
  ROR A                                     ; $01A9AC |
  ROR A                                     ; $01A9AD |
  INC A                                     ; $01A9AE |
  STA $06                                   ; $01A9AF |
  LDA $08                                   ; $01A9B1 |
  ROR A                                     ; $01A9B3 |
  ROR A                                     ; $01A9B4 |
  ROR A                                     ; $01A9B5 |
  EOR #$FFFF                                ; $01A9B6 |
  DEC A                                     ; $01A9B9 |
  STA $08                                   ; $01A9BA |
  PLY                                       ; $01A9BC |
  DEY                                       ; $01A9BD |
  BEQ CODE_01A9C4                           ; $01A9BE |
  JMP CODE_01A93D                           ; $01A9C0 |

CODE_01A9C3:
  PLY                                       ; $01A9C3 |

CODE_01A9C4:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A9C4 |
  BRA CODE_01A9E0                           ; $01A9C6 |

CODE_01A9C8:
  CPY #$08                                  ; $01A9C8 |
  BMI CODE_01A9E0                           ; $01A9CA |
  LDA #$0009                                ; $01A9CC |
  STA !s_spr_anim_frame,x                   ; $01A9CF |
  LDA #$0004                                ; $01A9D2 |
  STA !s_spr_timer_2,x                      ; $01A9D5 |
  INC A                                     ; $01A9D8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01A9D9 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01A9DB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01A9DD |
  RTS                                       ; $01A9DF |

CODE_01A9E0:
  LDA $A8E0,y                               ; $01A9E0 |
  AND #$00FF                                ; $01A9E3 |
  STA !s_spr_anim_frame,x                   ; $01A9E6 |
  LDA $A8E7,y                               ; $01A9E9 |
  AND #$00FF                                ; $01A9EC |
  STA !s_spr_timer_2,x                      ; $01A9EF |

CODE_01A9F2:
  LDA !s_spr_gsu_morph_1_lo,x               ; $01A9F2 |
  BEQ CODE_01AA1A                           ; $01A9F5 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01A9F7 |
  CPY #$03                                  ; $01A9F9 |
  BPL CODE_01AA1A                           ; $01A9FB |
  LDA $A8EF,y                               ; $01A9FD |
  AND #$00FF                                ; $01AA00 |
  SEC                                       ; $01AA03 |
  SBC #$0020                                ; $01AA04 |
  CLC                                       ; $01AA07 |
  ADC !s_spr_y_pixel_pos,x                  ; $01AA08 |
  STA !s_player_y                           ; $01AA0B |
  STZ !s_player_x_speed_prev                ; $01AA0E |
  STZ !s_player_x_speed                     ; $01AA11 |
  STZ !s_player_y_speed                     ; $01AA14 |
  INC !s_on_sprite_platform_flag            ; $01AA17 |

CODE_01AA1A:
  RTS                                       ; $01AA1A |

; data table
  db $09, $0A, $09, $08                     ; $01AA1B |

; flan table sub
  TYX                                       ; $01AA1F |
  LDA !s_spr_timer_2,x                      ; $01AA20 |
  BNE CODE_01AA5C                           ; $01AA23 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $01AA25 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01AA27 |
  CPY #$04                                  ; $01AA29 |
  BMI CODE_01AA4D                           ; $01AA2B |
  LDA #$0003                                ; $01AA2D |\ play sound #$0003
  JSL push_sound_queue                      ; $01AA30 |/
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01AA34 |
  LDY #$00                                  ; $01AA36 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $01AA38 |
  BNE CODE_01AA4D                           ; $01AA3A |
  LDA #$000B                                ; $01AA3C |
  STA !s_spr_anim_frame,x                   ; $01AA3F |
  LDA #$0003                                ; $01AA42 |
  STA !s_spr_timer_2,x                      ; $01AA45 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $01AA48 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01AA4A |
  RTS                                       ; $01AA4C |

CODE_01AA4D:
  LDA $AA1B,y                               ; $01AA4D |
  AND #$00FF                                ; $01AA50 |
  STA !s_spr_anim_frame,x                   ; $01AA53 |
  LDA #$0004                                ; $01AA56 |
  STA !s_spr_timer_2,x                      ; $01AA59 |

CODE_01AA5C:
  RTS                                       ; $01AA5C |

; data table (starts from $AA5C in code)
  db $0C, $00, $0D, $0E                     ; $01AA5D |
  db $0F, $10, $0F, $0E                     ; $01AA61 |
  db $0D, $00, $02, $03                     ; $01AA65 |
  db $02, $01                               ; $01AA69 |

; flan table sub
  TYX                                       ; $01AA6B |
  LDA !s_spr_timer_2,x                      ; $01AA6C |
  BNE CODE_01AA9C                           ; $01AA6F |
  INC !s_spr_wildcard_3_lo_dp,x             ; $01AA71 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01AA73 |
  CPY #$0F                                  ; $01AA75 |
  BMI CODE_01AA8D                           ; $01AA77 |
  STZ !s_spr_anim_frame,x                   ; $01AA79 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $01AA7C |
  LDA #$0040                                ; $01AA7E |
  STA !s_spr_timer_1,x                      ; $01AA81 |
  LDA #$0043                                ; $01AA84 |
  STA !s_spr_timer_2,x                      ; $01AA87 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $01AA8A |
  RTS                                       ; $01AA8C |

CODE_01AA8D:
  LDA $AA5C,y                               ; $01AA8D |
  AND #$00FF                                ; $01AA90 |
  STA !s_spr_anim_frame,x                   ; $01AA93 |
  LDA #$0003                                ; $01AA96 |
  STA !s_spr_timer_2,x                      ; $01AA99 |

CODE_01AA9C:
  RTS                                       ; $01AA9C |

; do nothing
  RTL                                       ; $01AA9D |

main_splashed_flan:
  JSL $03AF23                               ; $01AA9E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01AAA2 |
  BNE CODE_01AAA9                           ; $01AAA4 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01AAA6 |

CODE_01AAA8:
  RTL                                       ; $01AAA8 |

CODE_01AAA9:
  LDA !s_spr_timer_1,x                      ; $01AAA9 |
  BNE CODE_01AAD5                           ; $01AAAC |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $01AAAE |
  BNE CODE_01AAC0                           ; $01AAB0 |
  LDA #$0020                                ; $01AAB2 |
  STA !s_spr_y_accel,x                      ; $01AAB5 |
  LDA #$0008                                ; $01AAB8 |
  STA !s_spr_timer_2,x                      ; $01AABB |
  INC !s_spr_wildcard_4_lo_dp,x             ; $01AABE |

CODE_01AAC0:
  LDA !s_spr_timer_2,x                      ; $01AAC0 |
  BNE CODE_01AAD5                           ; $01AAC3 |
  LDA #$0008                                ; $01AAC5 |
  STA !s_spr_timer_2,x                      ; $01AAC8 |
  LDY !s_spr_anim_frame,x                   ; $01AACB |
  CPY #$02                                  ; $01AACE |
  BPL CODE_01AAD5                           ; $01AAD0 |
  INC !s_spr_anim_frame,x                   ; $01AAD2 |

CODE_01AAD5:
  LDA #$0006                                ; $01AAD5 |
  STA !s_spr_draw_priority,x                ; $01AAD8 |
  LDA $7860,x                               ; $01AADB |
  AND #$0001                                ; $01AADE |
  BEQ CODE_01AAA8                           ; $01AAE1 |
  JML $03A31E                               ; $01AAE3 |

init_hedgehog:
  RTL                                       ; $01AAE7 |

; hedgehog pointer table
  dw $AB6A                                  ; $01AAE8 |
  dw $AC06                                  ; $01AAEA |

main_hedgehog:
  LDA !s_spr_oam_1,x                        ; $01AAEC |
  LSR A                                     ; $01AAEF |
  BCC CODE_01AAF6                           ; $01AAF0 |
  JSL $03AA52                               ; $01AAF2 |

CODE_01AAF6:
  JSL $03AF23                               ; $01AAF6 |
  TXY                                       ; $01AAFA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $01AAFB |
  ASL A                                     ; $01AAFD |
  TAX                                       ; $01AAFE |
  JSR ($AAE8,x)                             ; $01AAFF | pointer table
  JSR CODE_01AB13                           ; $01AB02 |
  LDY !s_spr_collision_id,x                 ; $01AB05 |
  BPL CODE_01AB0E                           ; $01AB08 |
  JSL player_hit_sprite                     ; $01AB0A |

CODE_01AB0E:
  RTL                                       ; $01AB0E |

; data table
  dw $E000                                  ; $01AB0F |
  dw $E020                                  ; $01AB11 |

; hedgehog s sub
CODE_01AB13:
  LDA !s_spr_oam_1,x                        ; $01AB13 |
  LSR A                                     ; $01AB16 |
  BCC CODE_01AB61                           ; $01AB17 |
  TXA                                       ; $01AB19 |
  STA !gsu_r10                              ; $01AB1A |
  LDA #$0C00                                ; $01AB1D |
  STA !gsu_r0                               ; $01AB20 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01AB23 |
  STA !gsu_r6                               ; $01AB26 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $01AB29 |
  LDA $AB0F,y                               ; $01AB2B |
  STA !gsu_r12                              ; $01AB2E |
  LDA #$0054                                ; $01AB31 |
  STA !gsu_r13                              ; $01AB34 |
  LDA #$0010                                ; $01AB37 |
  STA !gsu_r8                               ; $01AB3A |
  ASL A                                     ; $01AB3D |
  STA !gsu_r9                               ; $01AB3E |
  LDY !s_spr_dyntile_index,x                ; $01AB41 |
  TYX                                       ; $01AB44 |
  LDA $03A9CE,x                             ; $01AB45 | f table
  STA !gsu_r3                               ; $01AB49 |
  LDA $03A9EE,x                             ; $01AB4C | f table
  STA !gsu_r2                               ; $01AB50 |
  LDX #$08                                  ; $01AB53 |
  LDA #$D964                                ; $01AB55 |
  JSL r_gsu_init_1                          ; $01AB58 | GSU init
  LDX $12                                   ; $01AB5C |
  INC $0CF9                                 ; $01AB5E |

CODE_01AB61:
  RTS                                       ; $01AB61 |

  dw $FE80, $0180                           ; $01AB62 |
  dw $0010, $FFF8                           ; $01AB66 |

; hedgehog table sub
  TYX                                       ; $01AB6A |
  LDY !s_spr_facing_dir,x                   ; $01AB6B |
  LDA $AB62,y                               ; $01AB6E |
  STA !s_spr_x_accel_ceiling,x              ; $01AB71 |
  LDA #$0020                                ; $01AB74 |
  STA !s_spr_x_accel,x                      ; $01AB77 |
  LDY !s_spr_timer_4,x                      ; $01AB7A |
  BNE CODE_01ABC1                           ; $01AB7D |
  LDA !s_spr_x_player_delta,x               ; $01AB7F |
  CLC                                       ; $01AB82 |
  ADC #$0020                                ; $01AB83 |
  CMP #$0040                                ; $01AB86 |
  BCS CODE_01ABC1                           ; $01AB89 |
  LDA !s_spr_y_player_delta,x               ; $01AB8B |
  CLC                                       ; $01AB8E |
  ADC #$0040                                ; $01AB8F |
  CMP #$0080                                ; $01AB92 |
  BCS CODE_01ABC1                           ; $01AB95 |
  JSL $03AD74                               ; $01AB97 |
  BCC CODE_01ABC1                           ; $01AB9B |
  LDA #$7C60                                ; $01AB9D |
  STA !s_spr_bitwise_settings_1,x           ; $01ABA0 |
  LDA #$2175                                ; $01ABA3 |
  STA !s_spr_oam_1,x                        ; $01ABA6 |
  STZ !s_spr_anim_frame,x                   ; $01ABA9 |
  LDA #$0080                                ; $01ABAC |
  STA !s_spr_gsu_morph_1_lo,x               ; $01ABAF |
  STZ !s_spr_x_speed_lo,x                   ; $01ABB2 |
  STZ !s_spr_x_accel,x                      ; $01ABB5 |
  LDA #$0040                                ; $01ABB8 |
  STA !s_spr_timer_1,x                      ; $01ABBB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01ABBE |
  RTS                                       ; $01ABC0 |

CODE_01ABC1:
  LDY !s_spr_timer_2,x                      ; $01ABC1 |
  BNE CODE_01ABD5                           ; $01ABC4 |
  LDA #$0004                                ; $01ABC6 |
  STA !s_spr_timer_2,x                      ; $01ABC9 |
  LDA !s_spr_anim_frame,x                   ; $01ABCC |
  EOR #$0001                                ; $01ABCF |
  STA !s_spr_anim_frame,x                   ; $01ABD2 |

CODE_01ABD5:
  LDY !s_spr_timer_3,x                      ; $01ABD5 |
  BNE CODE_01AC05                           ; $01ABD8 |
  LDA #$0004                                ; $01ABDA |
  STA !s_spr_timer_3,x                      ; $01ABDD |
  LDA #$01D8                                ; $01ABE0 |
  JSL spawn_ambient_sprite                  ; $01ABE3 |
  LDA !s_spr_facing_dir,x                   ; $01ABE7 |
  STA $73C0,y                               ; $01ABEA |
  LDA !s_spr_x_pixel_pos,x                  ; $01ABED |
  STA $70A2,y                               ; $01ABF0 |
  LDA #$0002                                ; $01ABF3 |
  STA $7782,y                               ; $01ABF6 |
  INC A                                     ; $01ABF9 |
  STA $7E4C,y                               ; $01ABFA |
  ASL A                                     ; $01ABFD |
  CLC                                       ; $01ABFE |
  ADC !s_spr_y_pixel_pos,x                  ; $01ABFF |
  STA $7142,y                               ; $01AC02 |

CODE_01AC05:
  RTS                                       ; $01AC05 |

; hedgehog table sub
  TYX                                       ; $01AC06 |
  LDY !s_spr_x_player_dir,x                 ; $01AC07 |
  TYA                                       ; $01AC0A |
  STA !s_spr_facing_dir,x                   ; $01AC0B |
  LDY !s_spr_collision_id,x                 ; $01AC0E |
  DEY                                       ; $01AC11 |
  BMI CODE_01AC29                           ; $01AC12 |
  LDA !s_spr_state,y                        ; $01AC14 |
  CMP #$0010                                ; $01AC17 |
  BNE CODE_01AC29                           ; $01AC1A |
  LDA !s_spr_collision_state,y              ; $01AC1C |
  BEQ CODE_01AC29                           ; $01AC1F |
  TYX                                       ; $01AC21 |
  JSL $03B25B                               ; $01AC22 |
  STZ !s_spr_timer_1,x                      ; $01AC26 |

CODE_01AC29:
  LDY !s_spr_timer_1,x                      ; $01AC29 |
  BEQ CODE_01AC3F                           ; $01AC2C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $01AC2E |
  CLC                                       ; $01AC31 |
  ADC #$0010                                ; $01AC32 |
  CMP #$0100                                ; $01AC35 |
  BMI CODE_01AC66                           ; $01AC38 |
  LDA #$0100                                ; $01AC3A |
  BRA CODE_01AC66                           ; $01AC3D |

CODE_01AC3F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $01AC3F |
  SEC                                       ; $01AC42 |
  SBC #$0010                                ; $01AC43 |
  CMP #$0080                                ; $01AC46 |
  BPL CODE_01AC66                           ; $01AC49 |
  LDA #$0040                                ; $01AC4B |
  STA !s_spr_timer_4,x                      ; $01AC4E |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $01AC51 |
  LDA #$7E00                                ; $01AC53 |
  STA !s_spr_bitwise_settings_1,x           ; $01AC56 |
  LDA #$0974                                ; $01AC59 |
  STA !s_spr_oam_1,x                        ; $01AC5C |
  JSL $03AEFD                               ; $01AC5F |
  LDA #$0080                                ; $01AC63 |

CODE_01AC66:
  STA !s_spr_gsu_morph_1_lo,x               ; $01AC66 |
  LDY !s_spr_timer_2,x                      ; $01AC69 |
  BNE CODE_01AC79                           ; $01AC6C |
  LDA #$0004                                ; $01AC6E |
  STA !s_spr_timer_2,x                      ; $01AC71 |
  LSR A                                     ; $01AC74 |
  EOR !s_spr_wildcard_4_lo_dp,x             ; $01AC75 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $01AC77 |

CODE_01AC79:
  RTS                                       ; $01AC79 |

; data table
  dw $FE00                                  ; $01AC7A |
  dw $0200                                  ; $01AC7C |
  dw $FD00                                  ; $01AC7E |
  dw $0300                                  ; $01AC80 |

; data table
  dw $0004                                  ; $01AC82 |
  dw $0006                                  ; $01AC84 |
  dw $0008                                  ; $01AC86 |
  dw $000C                                  ; $01AC88 |

; data table
  dw $FFD0                                  ; $01AC8A |
  dw $0120                                  ; $01AC8C |

init_gusty:
  LDA !s_spr_y_pixel_pos,x                  ; $01AC8E |
  BIT #$0010                                ; $01AC91 |
  BEQ CODE_01ACCF                           ; $01AC94 |
  AND #$FFE0                                ; $01AC96 |
  STA !s_spr_wildcard_2_lo,x                ; $01AC99 |
  LDA !s_spr_x_pixel_pos,x                  ; $01AC9C |
  AND #$0010                                ; $01AC9F |
  LSR A                                     ; $01ACA2 |
  LSR A                                     ; $01ACA3 |
  LSR A                                     ; $01ACA4 |
  TAY                                       ; $01ACA5 |
  LDA $AC8A,y                               ; $01ACA6 |
  STA !s_spr_wildcard_1_lo,x                ; $01ACA9 |
  LDA #$00FF                                ; $01ACAC |
  STA !s_spr_draw_priority,x                ; $01ACAF |
  LDA #$0060                                ; $01ACB2 |
  STA !s_spr_bitwise_settings_1,x           ; $01ACB5 |
  LDA #$4000                                ; $01ACB8 |
  STA !s_spr_bitwise_settings_3,x           ; $01ACBB |
  LDA #$0002                                ; $01ACBE |
  STA !s_spr_oam_1,x                        ; $01ACC1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01ACC4 |
  LDY !r_gusty_gen_flag                     ; $01ACC6 |
  BNE CODE_01ACCE                           ; $01ACC9 |
  INC !r_gusty_gen_flag                     ; $01ACCB |

CODE_01ACCE:
  RTL                                       ; $01ACCE |

CODE_01ACCF:
  LDA !s_spr_x_pixel_pos,x                  ; $01ACCF |
  PHA                                       ; $01ACD2 |
  SEC                                       ; $01ACD3 |
  SBC !s_bg1_cam_x                          ; $01ACD4 |
  STA $00                                   ; $01ACD7 |
  PLA                                       ; $01ACD9 |
  AND #$0010                                ; $01ACDA |
  DEC A                                     ; $01ACDD |
  EOR $00                                   ; $01ACDE |
  BMI CODE_01ACE6                           ; $01ACE0 |
  JML $03A31E                               ; $01ACE2 |

CODE_01ACE6:
  LDA $10                                   ; $01ACE6 |
  AND #$0004                                ; $01ACE8 |
  STA $00                                   ; $01ACEB |
  LDA !s_spr_x_pixel_pos,x                  ; $01ACED |
  AND #$0010                                ; $01ACF0 |
  LSR A                                     ; $01ACF3 |
  LSR A                                     ; $01ACF4 |
  LSR A                                     ; $01ACF5 |
  STA !s_spr_facing_dir,x                   ; $01ACF6 |
  ORA $00                                   ; $01ACF9 | entry point
  TAY                                       ; $01ACFB |
  LDA $AC7A,y                               ; $01ACFC |
  STA !s_spr_x_accel_ceiling,x              ; $01ACFF |
  LDA $00                                   ; $01AD02 |
  LSR A                                     ; $01AD04 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $01AD05 |
  TAY                                       ; $01AD07 |
  LDA $AC82,y                               ; $01AD08 |
  STA !s_spr_x_accel,x                      ; $01AD0B |
  RTL                                       ; $01AD0E |

; data table
  dw $FE00                                  ; $01AD0F |
  dw $0200                                  ; $01AD11 |
  dw $FE00                                  ; $01AD13 |
  dw $0200                                  ; $01AD15 |

main_gusty:
  LDY !s_spr_collision_state,x              ; $01AD17 | if gusty is being spat out
  BEQ CODE_01AD30                           ; $01AD1A | branch past this
  LDA $10                                   ; $01AD1C | rng address
  AND #$0004                                ; $01AD1E | random #: 0 or 4
  STA $00                                   ; $01AD21 |
  LDA !s_spr_facing_dir,x                   ; $01AD23 | this will be 0 or 2
  JSL $01ACF9                               ; $01AD26 | together, our set of random values is 0, 2, 4, or 6
  STZ !s_spr_collision_state,x              ; $01AD2A |
  STZ !s_spr_y_accel_ceiling,x              ; $01AD2D |

CODE_01AD30:
  JSL $03AF23                               ; $01AD30 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01AD34 |
  BEQ CODE_01AD3B                           ; $01AD36 |
  JMP CODE_01ADC2                           ; $01AD38 |

CODE_01AD3B:
  LDA !s_spr_timer_1,x                      ; $01AD3B |
  BNE CODE_01AD92                           ; $01AD3E |
  LDY !s_spr_collision_id,x                 ; $01AD40 |
  BPL CODE_01AD92                           ; $01AD43 |
  LDA !s_spr_y_player_delta,x               ; $01AD45 |
  SEC                                       ; $01AD48 |
  SBC !s_player_hitbox_half_height          ; $01AD49 |
  SEC                                       ; $01AD4C |
  SBC !s_spr_hitbox_height,x                ; $01AD4D |
  CMP #$FFF6                                ; $01AD50 |
  BCC CODE_01AD64                           ; $01AD53 |
  LDY $60AB                                 ; $01AD55 |
  BMI CODE_01AD92                           ; $01AD58 |
  LDY !s_player_jump_state                  ; $01AD5A |
  BEQ CODE_01AD64                           ; $01AD5D |
  JSL $03A5B7                               ; $01AD5F |
  RTL                                       ; $01AD63 |

CODE_01AD64:
  JSL player_hit_sprite                     ; $01AD64 |
  LDA !s_baby_mario_state                   ; $01AD68 |
  BPL CODE_01AD92                           ; $01AD6B |
  AND #$0FFF                                ; $01AD6D |
  STA !s_baby_mario_state                   ; $01AD70 |
  LDA #$0040                                ; $01AD73 |
  STA !s_spr_timer_1,x                      ; $01AD76 |
  ASL A                                     ; $01AD79 |
  ASL A                                     ; $01AD7A |
  STA $614A                                 ; $01AD7B |
  LDY !s_spr_facing_dir,x                   ; $01AD7E |
  LDA $AD13,y                               ; $01AD81 |
  CLC                                       ; $01AD84 |
  ADC !s_player_x_speed_prev                ; $01AD85 |
  STA !s_player_x_speed_prev                ; $01AD88 |
  STA !s_player_x_speed                     ; $01AD8B |
  JSL $06BEC1                               ; $01AD8E |

CODE_01AD92:
  LDA !s_spr_timer_2,x                      ; $01AD92 |
  BNE CODE_01ADA7                           ; $01AD95 |
  LDA #$0006                                ; $01AD97 |
  STA !s_spr_timer_2,x                      ; $01AD9A |
  LDA !s_spr_anim_frame,x                   ; $01AD9D |
  INC A                                     ; $01ADA0 |
  AND #$0003                                ; $01ADA1 |
  STA !s_spr_anim_frame,x                   ; $01ADA4 |

CODE_01ADA7:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $01ADA7 |
  LDA !s_spr_cam_x_pos,x                    ; $01ADA9 |
  SEC                                       ; $01ADAC |
  SBC #$0040                                ; $01ADAD |
  CMP #$0080                                ; $01ADB0 |
  BCS CODE_01ADBB                           ; $01ADB3 |
  TYA                                       ; $01ADB5 |
  CLC                                       ; $01ADB6 |
  ADC #$0004                                ; $01ADB7 |
  TAY                                       ; $01ADBA |

CODE_01ADBB:
  LDA $AC82,y                               ; $01ADBB |
  STA !s_spr_x_accel,x                      ; $01ADBE |
  RTL                                       ; $01ADC1 |

CODE_01ADC2:
  LDY !r_gusty_gen_flag                     ; $01ADC2 |
  BEQ CODE_01ADD6                           ; $01ADC5 |
  LDA !s_spr_cam_y_pos,x                    ; $01ADC7 |
  CLC                                       ; $01ADCA |
  ADC #$0040                                ; $01ADCB |
  CMP #$0180                                ; $01ADCE |
  BCC CODE_01ADDA                           ; $01ADD1 |
  STZ !r_gusty_gen_flag                     ; $01ADD3 |

CODE_01ADD6:
  JML $03A31E                               ; $01ADD6 |

CODE_01ADDA:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $01ADDA |
  BEQ CODE_01ADEE                           ; $01ADDC |
  LDA !s_spr_state,y                        ; $01ADDE |
  CMP #$0010                                ; $01ADE1 |
  BNE CODE_01ADF3                           ; $01ADE4 |
  LDA !s_spr_id,y                           ; $01ADE6 |
  CMP #$00E6                                ; $01ADE9 |
  BNE CODE_01ADF3                           ; $01ADEC |

CODE_01ADEE:
  LDA !s_spr_timer_1,x                      ; $01ADEE |
  BNE CODE_01AE17                           ; $01ADF1 |

CODE_01ADF3:
  LDA #$00E6                                ; $01ADF3 |
  JSL spawn_sprite_init                     ; $01ADF6 |
  BCC CODE_01AE17                           ; $01ADFA |
  LDA !s_bg1_cam_x                          ; $01ADFC |
  AND #$FFEF                                ; $01ADFF |
  CLC                                       ; $01AE02 |
  ADC !s_spr_wildcard_1_lo,x                ; $01AE03 |
  STA !s_spr_x_pixel_pos,y                  ; $01AE06 |
  LDA !s_spr_wildcard_2_lo,x                ; $01AE09 |
  STA !s_spr_y_pixel_pos,y                  ; $01AE0C |
  STY !s_spr_wildcard_4_lo_dp,x             ; $01AE0F |
  LDA #$0100                                ; $01AE11 |
  STA !s_spr_timer_1,x                      ; $01AE14 |

CODE_01AE17:
  RTL                                       ; $01AE17 |

  RTL                                       ; $01AE18 |

main_seed:
  LDY $7860,x                               ; $01AE19 |
  BEQ CODE_01AE54                           ; $01AE1C |
  LDA #$0229                                ; $01AE1E |
  JSL spawn_ambient_sprite                  ; $01AE21 |
  LDA !s_spr_x_pixel_pos,x                  ; $01AE25 |
  STA $70A2,y                               ; $01AE28 |
  LDA !s_spr_y_pixel_pos,x                  ; $01AE2B |
  STA $7142,y                               ; $01AE2E |
  LDA !s_spr_x_speed_lo,x                   ; $01AE31 |
  STA $71E0,y                               ; $01AE34 |
  BEQ CODE_01AE47                           ; $01AE37 |
  CMP #$8000                                ; $01AE39 |
  ROR A                                     ; $01AE3C |
  EOR #$FFFF                                ; $01AE3D |
  INC A                                     ; $01AE40 |
  STA $71E0,y                               ; $01AE41 |
  LDA #$FD80                                ; $01AE44 |

CODE_01AE47:
  STA $71E2,y                               ; $01AE47 |
  LDA #$FFFF                                ; $01AE4A |
  STA $7782,y                               ; $01AE4D |
  JML $03A31E                               ; $01AE50 |

CODE_01AE54:
  LDA !s_spr_gsu_morph_2_lo,x               ; $01AE54 |
  BEQ CODE_01AE71                           ; $01AE57 |
  LDY !s_spr_collision_id,x                 ; $01AE59 |
  BPL CODE_01AE71                           ; $01AE5C |
  LDA !s_player_invincibility_timer         ; $01AE5E |
  BNE CODE_01AE71                           ; $01AE61 |
  JSL player_hit_sprite                     ; $01AE63 |
  JSL $03B25B                               ; $01AE67 |
  LDA #$0001                                ; $01AE6B |
  STA $03BC                                 ; $01AE6E |

CODE_01AE71:
  JSL $03AF23                               ; $01AE71 |
  RTL                                       ; $01AE75 |

init_pulley_guy:
  LDA !s_spr_x_pixel_pos,x                  ; $01AE76 |
  AND #$0010                                ; $01AE79 |
  LSR A                                     ; $01AE7C |
  LSR A                                     ; $01AE7D |
  LSR A                                     ; $01AE7E |
  STA !s_spr_facing_dir,x                   ; $01AE7F |
  LDA #$1885                                ; $01AE82 |
  STA !s_spr_oam_1,x                        ; $01AE85 |
  RTL                                       ; $01AE88 |

; pulley guy pointer table
  dw $AEB9, $AEDA, $AEFD, $8000             ; $01AE89 |
  dw $AF10, $AF49                           ; $01AE91 |

main_pulley_guy:
  JSL $03AF23                               ; $01AE95 |
  TXY                                       ; $01AE99 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $01AE9A |
  ASL A                                     ; $01AE9C |
  TAX                                       ; $01AE9D |
  JSR ($AE89,x)                             ; $01AE9E | table sub
  LDY !s_spr_wildcard_5_lo_dp,x             ; $01AEA1 |
  BEQ CODE_01AEA9                           ; $01AEA3 |
  CPY #$05                                  ; $01AEA5 |
  BMI CODE_01AEB8                           ; $01AEA7 |

CODE_01AEA9:
  LDA $7974                                 ; $01AEA9 |
  AND #$0003                                ; $01AEAC |
  BNE CODE_01AEB8                           ; $01AEAF |
  LDA #$005A                                ; $01AEB1 |\ play sound #$005A
  JSL push_sound_queue                      ; $01AEB4 |/

CODE_01AEB8:
  RTL                                       ; $01AEB8 |

; pulley guy table sub
  TYX                                       ; $01AEB9 |
  LDA !s_spr_timer_2,x                      ; $01AEBA |
  BNE CODE_01AED2                           ; $01AEBD |
  LDA #$0004                                ; $01AEBF |
  STA !s_spr_timer_2,x                      ; $01AEC2 |
  INC !s_spr_anim_frame,x                   ; $01AEC5 |
  LDY !s_spr_anim_frame,x                   ; $01AEC8 |
  CPY #$0C                                  ; $01AECB |
  BNE CODE_01AED2                           ; $01AECD |
  STZ !s_spr_anim_frame,x                   ; $01AECF |

CODE_01AED2:
  RTS                                       ; $01AED2 |

; data table - starts from $AEC6 in code
  db $04, $03, $02, $01, $01, $01, $01      ; $01AED3 |

; pulley guy table sub
  TYX                                       ; $01AEDA |
  LDA !s_spr_timer_2,x                      ; $01AEDB |
  BNE CODE_01AEFC                           ; $01AEDE |
  INC !s_spr_anim_frame,x                   ; $01AEE0 |
  LDY !s_spr_anim_frame,x                   ; $01AEE3 |
  CPY #$14                                  ; $01AEE6 |
  BNE CODE_01AEF3                           ; $01AEE8 |
  LDA #$0010                                ; $01AEEA |
  STA !s_spr_anim_frame,x                   ; $01AEED |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01AEF0 |
  RTS                                       ; $01AEF2 |

CODE_01AEF3:
  LDA $AEC6,y                               ; $01AEF3 |
  AND #$00FF                                ; $01AEF6 |
  STA !s_spr_timer_2,x                      ; $01AEF9 |

CODE_01AEFC:
  RTS                                       ; $01AEFC |

; pulley guy table sub
  TYX                                       ; $01AEFD |
  LDA !s_spr_anim_frame,x                   ; $01AEFE |
  INC A                                     ; $01AF01 |
  AND #$0003                                ; $01AF02 |
  ORA #$0010                                ; $01AF05 |
  STA !s_spr_anim_frame,x                   ; $01AF08 |
  RTS                                       ; $01AF0B |

; data table - starts from $AF0B in code
  db $20, $04, $04, $04                     ; $01AF0C |

; pulley guy table sub
  TYX                                       ; $01AF10 |
  LDA !s_spr_timer_2,x                      ; $01AF11 |
  BNE CODE_01AF3E                           ; $01AF14 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $01AF16 |
  BNE CODE_01AF2A                           ; $01AF18 |
  LDA #$0008                                ; $01AF1A |
  STA !s_spr_timer_2,x                      ; $01AF1D |
  LDY #$0B                                  ; $01AF20 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $01AF22 |
  STZ !s_spr_anim_frame,x                   ; $01AF24 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $01AF27 |
  RTS                                       ; $01AF29 |

CODE_01AF2A:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01AF2A |
  LDA $AF0B,y                               ; $01AF2C |
  AND #$00FF                                ; $01AF2F |
  STA !s_spr_timer_2,x                      ; $01AF32 |
  LDA !s_spr_anim_frame,x                   ; $01AF35 |
  EOR #$0007                                ; $01AF38 |
  STA !s_spr_anim_frame,x                   ; $01AF3B |

CODE_01AF3E:
  RTS                                       ; $01AF3E |

; data table - starts from $AF3E in code
  db $04, $05, $06, $07, $08                ; $01AF3F |
  db $08, $08, $08, $08, $08                ; $01AF44 |

; pulley guy table sub
  TYX                                       ; $01AF49 |
  LDA !s_spr_timer_2,x                      ; $01AF4A |
  BNE CODE_01AF6D                           ; $01AF4D |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $01AF4F |
  BNE CODE_01AF5F                           ; $01AF51 |
  LDA #$0004                                ; $01AF53 |
  STA !s_spr_timer_2,x                      ; $01AF56 |
  STZ !s_spr_anim_frame,x                   ; $01AF59 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $01AF5C |
  RTS                                       ; $01AF5E |

CODE_01AF5F:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $01AF5F |
  LDA $AF3E,y                               ; $01AF61 |
  AND #$00FF                                ; $01AF64 |
  STA !s_spr_timer_2,x                      ; $01AF67 |
  INC !s_spr_anim_frame,x                   ; $01AF6A |

CODE_01AF6D:
  RTS                                       ; $01AF6D |

; l sub
; prepare
prepare_in_level_states:
  JSL clear_basic_states                    ; $01AF6E |
  REP #$20                                  ; $01AF72 |
  LDA #$4000                                ; $01AF74 |
  STA $61BC                                 ; $01AF77 |
  STZ !s_super_mario_timer                  ; $01AF7A |
  SEP #$20                                  ; $01AF7D |
  RTL                                       ; $01AF7F |

levelmode_index:
  db $04, $06, $08, $0A                     ; $01AF80 |
  db $0C, $0E, $10, $12                     ; $01AF84 |
  db $14, $16, $18, $1A                     ; $01AF88 |
  db $1C, $1E, $20, $22                     ; $01AF8C |

; Main loading game mode
; $038C controls load type (Map stage or just new sublevel)
gamemode0C:
  JSL init_oam_and_bg3_tilemap              ; $01AF90 | Disable screen, clear OAM and init BG3 tilemap
  JSL prepare_in_level_states               ; $01AF94 | Clear out memory states
  JSL clear_all_sprites                     ; $01AF98 |
  LDA !r_level_load_type                    ; $01AF9C | this tests if we're loading stage intro
  BEQ .stage_intro_init                     ; $01AF9F | or just screen exit
  JMP .screen_exit_init                     ; $01AFA1 |

.stage_intro_init
  REP #$20                                  ; $01AFA4 | This is Stage Intro (from map/retry)
  LDY #$00                                  ; $01AFA6 |\
  STZ $21                                   ; $01AFA8 | |
  LDA #$0392                                ; $01AFAA | | Clear out
  STA $20                                   ; $01AFAD | | $7E0392 -> $7E05C0
  LDA #$022E                                ; $01AFAF | | (Current stage state like coins)
  JSL dma_init_gen_purpose                  ; $01AFB2 |/
  SEP #$20                                  ; $01AFB6 |\  Miyamoto being silly
  REP #$30                                  ; $01AFB8 |/
  STZ !s_magnify_glass_flag                 ; $01AFBA |   Clear show hidden item flag
  LDX #$003E                                ; $01AFBD |

.clear_item_memory
  STZ !r_item_mem_page0,x                   ; $01AFC0 |\
  STZ $0400,x                               ; $01AFC3 | | Clear out all
  STZ !r_item_mem_page1,x                   ; $01AFC6 | | pages of item memory
  STZ $0480,x                               ; $01AFC9 | |
  STZ !r_item_mem_page2,x                   ; $01AFCC | |
  STZ $0500,x                               ; $01AFCF | |
  STZ !r_item_mem_page3,x                   ; $01AFD2 | |
  STZ $0580,x                               ; $01AFD5 | |
  DEX                                       ; $01AFD8 | |
  DEX                                       ; $01AFD9 | |
  BPL .clear_item_memory                    ; $01AFDA |/
  LDA #$0064                                ; $01AFDC |\
  STA !r_stars_amount                       ; $01AFDF |/  Init star count
  STZ $03A5                                 ; $01AFE2 |\  Clear Star Display
  STZ $03A3                                 ; $01AFE5 |/
  LDA #$0001                                ; $01AFE8 |\
  STA $03A1                                 ; $01AFEB |/  First star display digit
  LDA !r_cur_stage                          ; $01AFEE |\
  ASL A                                     ; $01AFF1 | | Current level number * 2
  TAX                                       ; $01AFF2 |/
  LDA.l level_entrance_indexes,x            ; $01AFF3 |
  TAX                                       ; $01AFF7 |
  LDA.l map_level_entrances+1,x             ; $01AFF8 |\
  AND #$00FF                                ; $01AFFC | |
  ASL A                                     ; $01AFFF | |
  ASL A                                     ; $01B000 | | Set intro X position in a level
  ASL A                                     ; $01B001 | |
  ASL A                                     ; $01B002 | |
  STA !s_player_x                           ; $01B003 |/
  LDA.l map_level_entrances+2,x             ; $01B006 |\
  AND #$00FF                                ; $01B00A | |
  ASL A                                     ; $01B00D | |
  ASL A                                     ; $01B00E | | Set intro Y position in a level
  ASL A                                     ; $01B00F | |
  ASL A                                     ; $01B010 | |
  STA !s_player_y                           ; $01B011 |/
  LDA.l map_level_entrances,x               ; $01B014 | Load level number
  JMP .set_level_pointers                   ; $01B018 |

.screen_exit_init
  REP #$30                                  ; $01B01B | this code is for screen exit warp
  STZ !r_star_autoincrease                  ; $01B01D | Zero star auto-increase
  LDA !r_level_load_type                    ; $01B020 |\
  DEC A                                     ; $01B023 | |
  BEQ .handle_level_type                    ; $01B024 | | If load type is > 1, skip ahead (no level load)
  JMP .handle_level_header                  ; $01B026 |/

.handle_level_type
  LDX !r_cur_screen_exit                    ; $01B029 |\
  LDA $7F7E00,x                             ; $01B02C | | Read level destination
  AND #$00FF                                ; $01B030 |/
  CMP #$00DE                                ; $01B033 |   If sublevel < $DE (Regular level)
  BCC .set_entrance_data                    ; $01B036 |   Then it's a Bandit Minigame
  SBC #$00DE                                ; $01B038 |\
  ASL A                                     ; $01B03B | | Handles Bandit Minigames
  STA $03A7                                 ; $01B03C | | Bandit minigame type
  LDA $7F7E03,x                             ; $01B03F | |
  AND #$00FF                                ; $01B043 | |
  STA $0374                                 ; $01B046 | | Set return level
  LDA $7F7E01,x                             ; $01B049 | |
  STA $0375                                 ; $01B04D | | Set return X/Y
  LDA !r_stars_amount                       ; $01B050 | |
  STA $0377                                 ; $01B053 | | Save current star count
  JML $118000                               ; $01B056 |/  Jump to bandit minigame

.set_entrance_data
  LDA $7F7E01,x                             ; $01B05A |\
  AND #$00FF                                ; $01B05E | |
  ASL A                                     ; $01B061 | |
  ASL A                                     ; $01B062 | | Set X entrance position in a level
  ASL A                                     ; $01B063 | |
  ASL A                                     ; $01B064 | |
  STA !s_player_x                           ; $01B065 |/
  LDA $7F7E02,x                             ; $01B068 |\
  AND #$00FF                                ; $01B06C | |
  ASL A                                     ; $01B06F | |
  ASL A                                     ; $01B070 | | Set Y entrance position in a level
  ASL A                                     ; $01B071 | |
  ASL A                                     ; $01B072 | |
  STA !s_player_y                           ; $01B073 |/
  LDA $7F7E03,x                             ; $01B076 |\
  AND #$00FF                                ; $01B07A | | Set entrance type as Yoshi's State
  STA !s_player_state                       ; $01B07D |/
  LDA $7F7E00,x                             ; $01B080 |   Level destination

.set_level_pointers
  AND #$00FF                                ; $01B084 |\
  ASL A                                     ; $01B087 | |
  STA $00                                   ; $01B088 | | Sets the level number as an index for object and sprite data
  ASL A                                     ; $01B08A | |
  ADC $00                                   ; $01B08B | |
  TAX                                       ; $01B08D |/
  LDA level_object_pointers,x               ; $01B08E |\
  STA $32                                   ; $01B092 | | Set up the pointer for level's Object data
  LDA level_object_pointers+1,x             ; $01B094 | |
  STA $33                                   ; $01B098 |/
  LDA level_sprite_pointers,x               ; $01B09A |\
  STA $702600                               ; $01B09E | |
  LDA level_sprite_pointers+2,x             ; $01B0A2 | | Set up the pointer for level's Sprite data
  AND #$00FF                                ; $01B0A6 | |
  STA $702602                               ; $01B0A9 |/

.handle_level_header
  STZ $0385                                 ; $01B0AD | Clear bonus game flag
  SEP #$30                                  ; $01B0B0 |
  JSL unpack_level_header                   ; $01B0B2 | unpack header info
  REP #$20                                  ; $01B0B6 |
  LDA #$07B0                                ; $01B0B8 |\
  LDX !r_header_bg3_tileset                 ; $01B0BB | |
  CPX #$13                                  ; $01B0BE | | Set Y position of where the water starts
  BEQ .set_water_line                       ; $01B0C0 | | For certain BG3 tilesets
  CPX #$1D                                  ; $01B0C2 | | BG3 $13 = #$07B0
  BNE .check_tutorial_level                 ; $01B0C4 | | BG3 $1D = #$0700
  LDA #$0700                                ; $01B0C6 | | This doesn't effect regular water objects

.set_water_line
  STA $61BC                                 ; $01B0C9 |/

.check_tutorial_level
  SEP #$20                                  ; $01B0CC |
  LDA !r_cur_stage                          ; $01B0CE |\
  CMP #$0B                                  ; $01B0D1 | |
  BNE .level_mode_checks                    ; $01B0D3 | | If we're in tutorial level
  LDA #$11                                  ; $01B0D5 | | Set music level header to #$11
  STA !r_header_music                       ; $01B0D7 |/

.level_mode_checks
  JSL upload_music_data                     ; $01B0DA |
  LDA !r_header_level_mode                  ; $01B0DE | level mode
  CMP #$09                                  ; $01B0E1 |
  BNE .kamek_autoscroll_check               ; $01B0E3 |
  JSR load_levelmode_09_settings            ; $01B0E5 | Raphael Boss level mode
  BRA .load_bg_tilemaps                     ; $01B0E8 |

.kamek_autoscroll_check
  CMP #$0A                                  ; $01B0EA |
  BNE .load_tilesets                        ; $01B0EC |
  JSL load_levelmode_0A_gfx                 ; $01B0EE |\ Kamek Autoscroll
  JSL load_levelmode_0A_palettes            ; $01B0F2 |/ Special Case graphics
  BRA .load_bg_tilemaps                     ; $01B0F6 |

.load_tilesets
  JSL load_level_gfx                        ; $01B0F8 | Load all graphics files
  JSL init_tileset_animation                ; $01B0FC | init tileset animation
  LDA !r_header_bg1_tileset                 ; $01B100 |
  CMP #$03                                  ; $01B103 |\
  BNE .load_palette                         ; $01B105 | | If 3D stone tileset
  JSR load_3d_sprite_graphic                ; $01B107 |/

.load_palette
  JSL load_level_palettes                   ; $01B10A | palettes from headers
  LDY !r_header_level_mode                  ; $01B10E |\
  LDX levelmode_index,y                     ; $01B111 | | level mode screenmodes setup
  JSL init_scene_regs                       ; $01B114 |/

.load_bg_tilemaps
  JSL hdma_and_gradient_init                ; $01B118 | Set up gradients and HDMA channels
  LDA !r_header_level_mode                  ; $01B11C |
  CMP #$09                                  ; $01B11F |\
  BEQ .handle_load_type                     ; $01B121 | | Branch past if Kamek autoscroll or
  CMP #$0A                                  ; $01B123 | | Raphael boss level modes
  BEQ .handle_load_type                     ; $01B125 |/
  JSR load_bg2_tilemap                      ; $01B127 |\ BG2 tilemap
  JSR load_bg3_tilemap                      ; $01B12A |/ BG3 tilemap

.handle_load_type
  JSL copy_division_lookup_to_sram          ; $01B12D |
  LDA !r_level_load_type                    ; $01B131 |\
  BEQ .stage_intro_main                     ; $01B134 | | Jump past if load type > 0
  JMP CODE_01B1F3                           ; $01B136 |/

; Stage Intro Start
.stage_intro_main
  LDA #$0F                                  ; $01B139 |\
  STA !r_reg_inidisp_mirror                 ; $01B13B |/ Turn off F-blank
  LDA #$01                                  ; $01B13E |\
  STA $0201                                 ; $01B140 |/ Set Fade Out mode
  JSL $108FD6                               ; $01B143 |
  LDX #$7F                                  ; $01B147 |

CODE_01B149:
  STZ !s_screen_num_to_id,x                 ; $01B149 |\
  DEX                                       ; $01B14C | | Clear out screen IDs
  BPL CODE_01B149                           ; $01B14D |/
  REP #$20                                  ; $01B14F |
  LDA !s_player_x                           ; $01B151 |\
  SEC                                       ; $01B154 | | player's x-position -= #$0090
  SBC #$0090                                ; $01B155 | |
  STA !s_player_x                           ; $01B158 |/
  CLC                                       ; $01B15B |\
  ADC #$0018                                ; $01B15C | | camera = player x-pos + $0018
  STA !s_bg1_cam_x                          ; $01B15F |/
  LDA !s_player_y                           ; $01B162 |\
  SEC                                       ; $01B165 | | camera = player y-pos - $0094
  SBC #$0094                                ; $01B166 | |
  STA !s_bg1_cam_y                          ; $01B169 |/
  INC !s_player_jump_state                  ; $01B16C | ???
  JSL $04DC28                               ; $01B16F | Init baby mario ?
  REP #$20                                  ; $01B173 |
  LDA #$0006                                ; $01B175 |
  STA !s_player_jump_state                  ; $01B178 |
  LDA #$0280                                ; $01B17B |
  STA !s_player_x_speed                     ; $01B17E |
  LDA #$FC00                                ; $01B181 |
  STA !s_player_y_speed                     ; $01B184 |
  LDA #$0016                                ; $01B187 |
  STA !s_player_state                       ; $01B18A |
  SEP #$20                                  ; $01B18D |
  JSL $01B27B                               ; $01B18F |
  LDA #$01                                  ; $01B193 |
  STA $0B54                                 ; $01B195 |
  REP #$20                                  ; $01B198 |
  LDA #$0002                                ; $01B19A |
  STA !r_stage_intro_flag                   ; $01B19D |
  LDA #$0120                                ; $01B1A0 |
  STA $0B4C                                 ; $01B1A3 |
  JSL $108F49                               ; $01B1A6 |
  LDA #$03                                  ; $01B1AA |
  STA $4D                                   ; $01B1AC |
  LDA #$02                                  ; $01B1AE |
  STA !r_irq_count                          ; $01B1B0 |
  LDA #$50                                  ; $01B1B3 |\ set h-timer low byte
  STA !reg_htimel                           ; $01B1B5 |/
  LDA #$D8                                  ; $01B1B8 |\ set v-timer low byte
  STA !reg_vtimel                           ; $01B1BA |/
  LDA #$B1                                  ; $01B1BD |\ set all IRQ flags
  STA !reg_nmitimen                         ; $01B1BF |/
  JSL $108B61                               ; $01B1C2 |
  REP #$20                                  ; $01B1C6 |

CODE_01B1C8:
  LDA $0D23                                 ; $01B1C8 |
  CMP #$00C0                                ; $01B1CB |
  BCC CODE_01B1C8                           ; $01B1CE |
  LDA #$7FFF                                ; $01B1D0 |
  STA $702104                               ; $01B1D3 |
  SEP #$20                                  ; $01B1D7 |
  STZ !r_stage_intro_flag                   ; $01B1D9 |
  REP #$20                                  ; $01B1DC |
  LDA $3B                                   ; $01B1DE |
  STA !s_uppermost_tile_y                   ; $01B1E0 |
  LDA $39                                   ; $01B1E3 |
  SEC                                       ; $01B1E5 |
  SBC #$0100                                ; $01B1E6 |
  STA !s_leftmost_tile_x                    ; $01B1E9 |
  SEP #$20                                  ; $01B1EC |
  INC !r_game_mode                          ; $01B1EE | change game mode
  BRA CODE_01B22F                           ; $01B1F1 |
; Stage Intro stuff End

; Screen Exit Load Start
CODE_01B1F3:
  DEC A                                     ; $01B1F3 |\
  BNE CODE_01B1FA                           ; $01B1F4 | | build MAP16 table
  JSL $108B61                               ; $01B1F6 |/  if loadtype < 2

CODE_01B1FA:
  JSL $04DB68                               ; $01B1FA |
  JSL $03954E                               ; $01B1FE |
  LDA !s_cam_x_right_boundary               ; $01B202 |
  CMP #$0F                                  ; $01B205 |
  BEQ CODE_01B211                           ; $01B207 |
  JSL $04DCC4                               ; $01B209 |
  JSL $03954E                               ; $01B20D |

CODE_01B211:
  JSL $108FD6                               ; $01B211 |
  STZ !r_level_load_type                    ; $01B215 |
  STZ !r_stage_intro_flag                   ; $01B218 |
  LDA #$02                                  ; $01B21B |
  STA !r_irq_count                          ; $01B21D |
  LDA #$50                                  ; $01B220 |\ set h-timer low byte
  STA !reg_htimel                           ; $01B222 |/
  LDA #$D8                                  ; $01B225 |\ set v-timer low byte
  STA !reg_vtimel                           ; $01B227 |/
  LDA #$B1                                  ; $01B22A |\ set all IRQ flags
  STA !reg_nmitimen                         ; $01B22C |/
; Screen Exit Load End

CODE_01B22F:
  REP #$30                                  ; $01B22F |
  JSL $04DCF9                               ; $01B231 |
  SEP #$30                                  ; $01B235 |
  LDA !r_reg_bgmode_mirror                  ; $01B237 |
  AND #$07                                  ; $01B23A |
  CMP #$02                                  ; $01B23C |
  BNE CODE_01B243                           ; $01B23E |
  INC !s_opt_mode                           ; $01B240 |

CODE_01B243:
  JSL $01B25E                               ; $01B243 |
  JML $1083E2                               ; $01B247 |

; table of music values to use for each level music setting
  db $01, $01, $01, $01                     ; $01B24B |
  db $01, $09, $01, $01                     ; $01B24F |
  db $09, $0C, $01, $02                     ; $01B253 |
  db $00, $01, $00, $00                     ; $01B257 |
  db $00, $02, $01                          ; $01B25B |

; l sub
  PHP                                       ; $01B25E |
  SEP #$30                                  ; $01B25F |
  LDA $0205                                 ; $01B261 |
  BNE CODE_01B273                           ; $01B264 |
  LDX !r_spc_block_set                      ; $01B266 |
  LDA $01B24A,x                             ; $01B269 |
  STA !r_apu_io_0_mirror                    ; $01B26D |
  STA $0205                                 ; $01B270 |

CODE_01B273:
  STZ !r_apu_io_2_mirror                    ; $01B273 |
  STZ !r_sound_queue_size                   ; $01B276 |
  PLP                                       ; $01B279 |
  RTL                                       ; $01B27A |

  LDA #$70                                  ; $01B27B |
  STA $22                                   ; $01B27D |
  REP #$20                                  ; $01B27F |
  LDA #$5800                                ; $01B281 |
  STA $20                                   ; $01B284 |
  LDA #$0800                                ; $01B286 |
  LDY #$00                                  ; $01B289 |
  JSL dma_init_gen_purpose                  ; $01B28B |
  SEP #$20                                  ; $01B28F |
  RTL                                       ; $01B291 |

CODE_01B292:
  REP #$30                                  ; $01B292 |
  LDX #$020C                                ; $01B294 |

CODE_01B297:
  LDA $7E79A6,x                             ; $01B297 |
  STA $03B2,x                               ; $01B29B |
  DEX                                       ; $01B29E |
  DEX                                       ; $01B29F |
  BPL CODE_01B297                           ; $01B2A0 |
  STZ !s_cur_egg_inv_size                   ; $01B2A2 |
  LDX #$000C                                ; $01B2A5 |

CODE_01B2A8:
  LDA $7E7BB0,x                             ; $01B2A8 |
  STA $7E5D98,x                             ; $01B2AC |
  DEX                                       ; $01B2B0 |
  DEX                                       ; $01B2B1 |
  BPL CODE_01B2A8                           ; $01B2B2 |
  SEP #$30                                  ; $01B2B4 |
  RTS                                       ; $01B2B6 |

; Saves egg inventory in RAM
; for between levels
save_egg_inventory:
  PHP                                       ; $01B2B7 |
  REP #$20                                  ; $01B2B8 |
  SEP #$10                                  ; $01B2BA |
  LDA !s_cur_egg_inv_size                   ; $01B2BC |\ store egg count
  STA $7E5D98                               ; $01B2BF |/
  BEQ .ret                                  ; $01B2C3 | nothing to save? get out
  TAX                                       ; $01B2C5 |

.egg_loop
  LDY $7DF6,x                               ; $01B2C6 |\  save sprite ID of egg
  LDA !s_spr_id,y                           ; $01B2C9 | | inventory sprite
  STA $7E5D98,x                             ; $01B2CC |/
  DEX                                       ; $01B2D0 |\
  DEX                                       ; $01B2D1 | | next egg
  BNE .egg_loop                             ; $01B2D2 |/

.ret
  PLP                                       ; $01B2D4 |
  RTL                                       ; $01B2D5 |

  PHP                                       ; $01B2D6 |
  REP #$20                                  ; $01B2D7 |
  SEP #$10                                  ; $01B2D9 |
  STZ !s_cur_egg_inv_size                   ; $01B2DB |
  LDA $7E5D98                               ; $01B2DE |
  BEQ CODE_01B333                           ; $01B2E2 |
  STA $00                                   ; $01B2E4 |
  PHD                                       ; $01B2E6 |
  LDA #$7960                                ; $01B2E7 |
  TCD                                       ; $01B2EA |
  LDX #$00                                  ; $01B2EB |

CODE_01B2ED:
  PHX                                       ; $01B2ED |
  LDA $7E5D9A,x                             ; $01B2EE |
  CMP #$0029                                ; $01B2F2 |
  BEQ CODE_01B323                           ; $01B2F5 |
  JSL spawn_sprite_active                   ; $01B2F7 |
  BCC CODE_01B323                           ; $01B2FB |
  TYX                                       ; $01B2FD |
  LDA !s_player_x                           ; $01B2FE |
  STA !s_spr_x_pixel_pos,x                  ; $01B301 |
  LDA !s_player_y                           ; $01B304 |
  CLC                                       ; $01B307 |
  ADC #$0010                                ; $01B308 |
  STA !s_spr_y_pixel_pos,x                  ; $01B30B |
  LDA !s_spr_oam_yxppccct,x                 ; $01B30E |
  AND #$00CF                                ; $01B311 |
  ORA $6126                                 ; $01B314 |
  STA !s_spr_oam_yxppccct,x                 ; $01B317 |
  STX $12                                   ; $01B31A |
  JSL $03BEB9                               ; $01B31C |
  STZ !r_sound_queue_size                   ; $01B320 |

CODE_01B323:
  PLX                                       ; $01B323 |
  INX                                       ; $01B324 |
  INX                                       ; $01B325 |
  CPX $0000                                 ; $01B326 |
  BCC CODE_01B2ED                           ; $01B329 |
  PLD                                       ; $01B32B |
  LDA #$0000                                ; $01B32C |
  STA $7E5D98                               ; $01B32F |

CODE_01B333:
  PLP                                       ; $01B333 |
  RTL                                       ; $01B334 |

; Raphael Boss Level Mode stuff
; Sets custom palettes/graphics/registers
load_levelmode_09_settings:
  JSL load_level_palettes                   ; $01B335 | Load default palettes
  LDA #$B9                                  ; $01B339 |\
  STA $10                                   ; $01B33B | |
  LDA #$BA                                  ; $01B33D | |
  STA $11                                   ; $01B33F | |
  LDA #$BB                                  ; $01B341 | | Set up graphics files 
  STA $12                                   ; $01B343 | | to load
  LDA #$BC                                  ; $01B345 | | see table at $00AEC1
  STA $13                                   ; $01B347 | |
  LDA #$BD                                  ; $01B349 | |
  STA $14                                   ; $01B34B |/
  REP #$30                                  ; $01B34D |
  LDX #$0000                                ; $01B34F |

.transfer_palette
  LDA $5FE3EA,x                             ; $01B352 |\
  STA !s_cgram_mirror,x                     ; $01B356 | | Copy everything from
  STA $702D6C,x                             ; $01B35A | | $3FE3EA-$3FE48A
  LDA $5FE40A,x                             ; $01B35E | | to first half of CGRAM mirrors
  STA !s_cgram_mirror+$20,x                 ; $01B362 | |
  STA $702D8C,x                             ; $01B366 | |
  LDA $5FE42A,x                             ; $01B36A | | 
  STA !s_cgram_mirror+$40,x                 ; $01B36E | |
  STA $702DAC,x                             ; $01B372 | |
  LDA $5FE44A,x                             ; $01B376 | |
  STA !s_cgram_mirror+$60,x                 ; $01B37A | |
  STA $702DCC,x                             ; $01B37E | |
  LDA $5FE46A,x                             ; $01B382 | |
  STA !s_cgram_mirror+$80,x                 ; $01B386 | |
  STA $702DEC,x                             ; $01B38A | |
  INX                                       ; $01B38E | |
  INX                                       ; $01B38F | |
  CPX #$0020                                ; $01B390 | | Write loop $20 times
  BCC .transfer_palette                     ; $01B393 |/
  SEP #$20                                  ; $01B395 |
  LDA #$2D                                  ; $01B397 |\
  STA !s_sprset_1_index                     ; $01B399 | |
  STA $15                                   ; $01B39C | | Set sprite set graphics files
  LDA #$1B                                  ; $01B39E | | 
  STA !s_sprset_2_index                     ; $01B3A0 | |
  STA $16                                   ; $01B3A3 | |
  LDA #$1C                                  ; $01B3A5 | |
  STA !s_sprset_3_index                     ; $01B3A7 | |
  STA $17                                   ; $01B3AA | |
  LDA #$34                                  ; $01B3AC | |
  STA !s_sprset_4_index                     ; $01B3AE | |
  STA $18                                   ; $01B3B1 | |
  STA $19                                   ; $01B3B3 | |
  STA $1A                                   ; $01B3B5 |/
  LDA #$FF                                  ; $01B3B7 |\
  STA !s_sprset_5_index                     ; $01B3B9 | | empty sprite sets
  STA !s_sprset_6_index                     ; $01B3BC |/
  LDY #$0154                                ; $01B3BF |\
  JSL load_compressed_gfx_files_l           ; $01B3C2 |/  Load Raphael Scene graphics
  SEP #$10                                  ; $01B3C6 |
  LDY !r_header_level_mode                  ; $01B3C8 |\
  LDX levelmode_index,y                     ; $01B3CB | | Setup all registers for scene
  JSL init_scene_regs                       ; $01B3CE |/
  REP #$20                                  ; $01B3D2 |\
  LDA #$0080                                ; $01B3D4 | |
  STA !r_bg3_cam_x                          ; $01B3D7 | | Hardcode BG3 pos to $0080
  STA !s_bg3_cam_x                          ; $01B3DA | |
  STA !r_bg3_cam_y                          ; $01B3DD | |
  STA !s_bg3_cam_y                          ; $01B3E0 |/
  LDA #$0100                                ; $01B3E3 |\
  STA !r_reg_m7x_mirror                     ; $01B3E6 | |
  LDA #$00F8                                ; $01B3E9 | | Mode 7 magic
  STA !r_reg_m7y_mirror                     ; $01B3EC |/
  INC !r_autoscr_x_active                   ; $01B3EF |\  Set autoscroll X/Y
  INC !r_autoscr_y_active                   ; $01B3F2 |/  to freeze screen in place
  JSL raphael_set_rotation_player_pos       ; $01B3F5 |
  LDA #$000C                                ; $01B3F9 |\
  JSL spawn_sprite_init                     ; $01B3FC |/  Spawn Raphael boss sprite
  SEP #$20                                  ; $01B400 |
  RTS                                       ; $01B402 | Back to level loading

raphael_set_rotation_player_pos:
  JSL raphael_set_mode7_rotation            ; $01B403 |
  LDA !s_player_state                       ; $01B407 |\
  CMP #$0020                                ; $01B40A | | If state entering boss room
  BEQ .ret                                  ; $01B40D |/
  LDA !s_player_x                           ; $01B40F |\
  CMP #$0120                                ; $01B412 | |
  BPL .check_right_limit                    ; $01B415 | | If player position < $0120
  CLC                                       ; $01B417 | | Add $0140 to his position
  ADC #$0140                                ; $01B418 |/  (Wrap around going to left)

.check_right_limit
  CMP #$0260                                ; $01B41B |\
  BMI .set_positions                        ; $01B41E | | If player position > $0260
  SEC                                       ; $01B420 | | Subtract $0140 to his position
  SBC #$0140                                ; $01B421 |/  (Wrap around  going to right)

.set_positions
  STA !s_player_x                           ; $01B424 | Store possible new position
  SEC                                       ; $01B427 |
  SBC #$0120                                ; $01B428 |
  SEP #$20                                  ; $01B42B |
  STA !reg_wrmpya                           ; $01B42D |
  LDY #$CD                                  ; $01B430 |
  STY !reg_wrmpyb                           ; $01B432 |
  NOP                                       ; $01B435 |
  NOP                                       ; $01B436 |
  LDA #$A0                                  ; $01B437 |
  CLC                                       ; $01B439 |
  ADC !reg_rdmpyl                           ; $01B43A |
  LDA !reg_rdmpyh                           ; $01B43D |
  ADC #$00                                  ; $01B440 |
  PHA                                       ; $01B442 |
  XBA                                       ; $01B443 |
  STA !reg_wrmpya                           ; $01B444 |
  STY !reg_wrmpyb                           ; $01B447 |
  NOP                                       ; $01B44A |
  NOP                                       ; $01B44B |
  PLA                                       ; $01B44C |
  CLC                                       ; $01B44D |
  ADC !reg_rdmpyl                           ; $01B44E |
  SEC                                       ; $01B451 |
  SBC #$1A                                  ; $01B452 |
  AND #$FF                                  ; $01B454 |
  STA $0D05                                 ; $01B456 | rotation value
  REP #$20                                  ; $01B459 |
  LDA !s_player_x                           ; $01B45B |
  SEC                                       ; $01B45E |
  SBC #$0078                                ; $01B45F |
  STA $0C23                                 ; $01B462 |
  STA !r_bg1_cam_x                          ; $01B465 |
  STA !s_bg1_cam_x                          ; $01B468 |
  LDA !s_bg3_cam_y                          ; $01B46B |
  CLC                                       ; $01B46E |
  ADC #$0026                                ; $01B46F |
  STA $0C27                                 ; $01B472 |
  STA !r_bg1_cam_y                          ; $01B475 |
  STA !s_bg1_cam_y                          ; $01B478 |

.ret
  RTL                                       ; $01B47B |

raphael_set_mode7_rotation:
  PHX                                       ; $01B47C |
  LDA $0D05                                 ; $01B47D |\
  AND #$00FF                                ; $01B480 | |
  ASL A                                     ; $01B483 | | current rotation value
  REP #$10                                  ; $01B484 | | as index
  TAX                                       ; $01B486 |/
  LDA raphael_mode7_matrix_a_d,x            ; $01B487 |\
  STA !r_reg_m7a_mirror                     ; $01B48B | | $00E954
  STA !r_reg_m7d_mirror                     ; $01B48E | | Mode 7 magic table
  LDA raphael_mode7_matrix_b_c,x            ; $01B491 | |
  STA !r_reg_m7b_mirror                     ; $01B495 | |
  EOR #$FFFF                                ; $01B498 | | Signed value
  INC A                                     ; $01B49B | |
  STA !r_reg_m7c_mirror                     ; $01B49C | |
  SEP #$10                                  ; $01B49F |/
  PLX                                       ; $01B4A1 |
  RTL                                       ; $01B4A2 |

; hardcoded for 3D stone tileset
; Changes flatbed ferry graphic to a 3D version
; $521D80 ($249D80) to $4280 VRAM
; $521F80 ($249F80) to $4380 VRAM
load_3d_sprite_graphic:
  REP #$20                                  ; $01B4A3 |
  LDX #$80                                  ; $01B4A5 |\
  STX !reg_vmain                            ; $01B4A7 |/ Store words
  LDA #$1801                                ; $01B4AA |\ $01 DMA control
  STA $4300                                 ; $01B4AD |/ $2118 VRAM dest
  LDX #$52                                  ; $01B4B0 |\
  STX $4304                                 ; $01B4B2 |/ $52 bank ($24-$25)
  LDY #$01                                  ; $01B4B5 |
  LDA #$4280                                ; $01B4B7 |\
  STA !reg_vmadd                            ; $01B4BA |/ $4280 VRAM address
  LDA #$1D80                                ; $01B4BD |\
  STA $4302                                 ; $01B4C0 |/ $521D80 as source
  LDA #$0080                                ; $01B4C3 |\ 
  STA $4305                                 ; $01B4C6 |/ $0080 as size
  STY !reg_mdmaen                           ; $01B4C9 |  Enable DMA
  STA $4305                                 ; $01B4CC |  Same size
  LDA #$4380                                ; $01B4CF |\ 
  STA !reg_vmadd                            ; $01B4D2 |/ $4380 VRAM address (lower row)
  LDA #$1F80                                ; $01B4D5 |\
  STA $4302                                 ; $01B4D8 |/ $521F80 as source
  STY !reg_mdmaen                           ; $01B4DB |  Enable transfer
  SEP #$20                                  ; $01B4DE |
  RTS                                       ; $01B4E0 |


gamemode0D:
  LDA #$01                                  ; $01B4E1 |
  STA !s_player_disable_flag                ; $01B4E3 |
  STA !s_sprite_disable_flag                ; $01B4E6 |
  JSL $01C0CE                               ; $01B4E9 |
  REP #$20                                  ; $01B4ED |
  LDA $0B4A                                 ; $01B4EF |
  STA !gsu_r1                               ; $01B4F2 |
  INC A                                     ; $01B4F5 |
  STA !gsu_r2                               ; $01B4F6 |
  LDA $0B4C                                 ; $01B4F9 |
  STA !gsu_r6                               ; $01B4FC |
  LDX #$08                                  ; $01B4FF |
  LDA #$8E48                                ; $01B501 |
  JSL r_gsu_init_1                          ; $01B504 | GSU init
  LDA $0B4C                                 ; $01B508 |
  CLC                                       ; $01B50B |
  ADC #$0008                                ; $01B50C |
  STA $0B4C                                 ; $01B50F |
  CMP #$0101                                ; $01B512 |
  BCC CODE_01B548                           ; $01B515 |
  STZ $0B4C                                 ; $01B517 |
  INC $0B4A                                 ; $01B51A |
  LDA $0B4A                                 ; $01B51D |
  CMP #$0002                                ; $01B520 |
  BCC CODE_01B548                           ; $01B523 |
  SEP #$20                                  ; $01B525 |
  STZ !r_reg_tmw_mirror                     ; $01B527 |
  STZ !r_reg_tsw_mirror                     ; $01B52A |
  STZ !r_reg_w12sel_mirror                  ; $01B52D |
  STZ !r_reg_w34sel_mirror                  ; $01B530 |
  STZ !r_reg_wobjsel_mirror                 ; $01B533 |
  LDA #$20                                  ; $01B536 |
  TRB !r_reg_hdmaen_mirror                  ; $01B538 |
  STZ !s_player_disable_flag                ; $01B53B |
  STZ !s_sprite_disable_flag                ; $01B53E |
  INC !r_game_mode                          ; $01B541 |
  JML $1083E2                               ; $01B544 |

CODE_01B548:
  JSL $00BE39                               ; $01B548 |

; DMA args
  dl $7E56D0, $703A02                       ; $01B54C |
  dw $0348                                  ; $01B552 |

  SEP #$20                                  ; $01B554 |
  LDA #$1F                                  ; $01B556 |
  STA !r_reg_tmw_mirror                     ; $01B558 |
  STA !r_reg_tsw_mirror                     ; $01B55B |
  LDA #$33                                  ; $01B55E |
  STA !r_reg_w12sel_mirror                  ; $01B560 |
  STA !r_reg_w34sel_mirror                  ; $01B563 |
  STA !r_reg_wobjsel_mirror                 ; $01B566 |
  STZ !r_reg_wbglog_mirror                  ; $01B569 |
  STZ !reg_wobjlog                          ; $01B56C |
  LDA #$20                                  ; $01B56F |
  TSB !r_reg_hdmaen_mirror                  ; $01B571 |
  LDA #$0F                                  ; $01B574 |
  STA !r_reg_inidisp_mirror                 ; $01B576 |
  LDA #$01                                  ; $01B579 |
  STA $0201                                 ; $01B57B |
  PLB                                       ; $01B57E |
  RTL                                       ; $01B57F |

gamemode10:
  LDX $0B57                                 ; $01B580 |
  CPX #$0D                                  ; $01B583 |
  BCS CODE_01B58E                           ; $01B585 |
  JSL $01C0CE                               ; $01B587 |
  LDX $0B57                                 ; $01B58B |

CODE_01B58E:
  JSR ($B592,x)                             ; $01B58E |
  PLB                                       ; $01B591 |
  RTL                                       ; $01B592 |

  dw $E2BF                                  ; $01B593 |
  dw $B5D7                                  ; $01B595 |
  dw $B5D7                                  ; $01B597 |
  dw $B5D8                                  ; $01B599 |
  dw $E378                                  ; $01B59B |
  dw $E442                                  ; $01B59D |
  dw $B5E4                                  ; $01B59F |
  dw $B6B9                                  ; $01B5A1 |
  dw $B6C9                                  ; $01B5A3 |
  dw $B95B                                  ; $01B5A5 |
  dw $B9BA                                  ; $01B5A7 |
  dw $E4A0                                  ; $01B5A9 |
  dw $BA1C                                  ; $01B5AB |
  dw $BA2F                                  ; $01B5AD |
  dw $BA1C                                  ; $01B5AF |
  dw $BAD0                                  ; $01B5B1 |
  dw $BA1C                                  ; $01B5B3 |
  dw $BB5D                                  ; $01B5B5 |
  dw $BA1C                                  ; $01B5B7 |
  dw $BCBD                                  ; $01B5B9 |
  dw $BA1C                                  ; $01B5BB |
  dw $BCF8                                  ; $01B5BD |
  dw $BA1C                                  ; $01B5BF |
  dw $BD50                                  ; $01B5C1 |
  dw $BA1C                                  ; $01B5C3 |
  dw $BDC3                                  ; $01B5C5 |
  dw $BDCA                                  ; $01B5C7 |
  dw $BA1C                                  ; $01B5C9 |
  dw $BE00                                  ; $01B5CB |
  dw $BE63                                  ; $01B5CD |
  dw $BE9D                                  ; $01B5CF |

CODE_01B5D1:
  INC $0B57                                 ; $01B5D1 |
  INC $0B57                                 ; $01B5D4 |
  RTS                                       ; $01B5D7 |

  LDA !r_reg_hdmaen_mirror                  ; $01B5D8 |
  PHA                                       ; $01B5DB |
  JSR CODE_01E2F0                           ; $01B5DC |
  PLA                                       ; $01B5DF |
  TSB !r_reg_hdmaen_mirror                  ; $01B5E0 |
  RTS                                       ; $01B5E3 |

  REP #$20                                  ; $01B5E4 |
  PHB                                       ; $01B5E6 |
  LDX #$7E                                  ; $01B5E7 |
  PHX                                       ; $01B5E9 |
  PLB                                       ; $01B5EA |
  LDX #$00                                  ; $01B5EB |
  LDA #$017F                                ; $01B5ED |

CODE_01B5F0:
  STA $5DA6,x                               ; $01B5F0 |
  STA $5EA6,x                               ; $01B5F3 |
  STA $5FA6,x                               ; $01B5F6 |
  STA $60A6,x                               ; $01B5F9 |
  STA $6126,x                               ; $01B5FC |
  DEX                                       ; $01B5FF |
  DEX                                       ; $01B600 |
  BNE CODE_01B5F0                           ; $01B601 |
  PLB                                       ; $01B603 |
  LDX #$00                                  ; $01B604 |

CODE_01B606:
  LDA $B659,x                               ; $01B606 |
  STA $7E5E2E,x                             ; $01B609 |
  LDA $B689,x                               ; $01B60D |
  STA $7E60EE,x                             ; $01B610 |
  INX                                       ; $01B614 |
  INX                                       ; $01B615 |
  CPX #$30                                  ; $01B616 |
  BCC CODE_01B606                           ; $01B618 |
  LDA #$0004                                ; $01B61A |
  STA !r_header_anim_tileset                ; $01B61D |
  STZ !r_header_anim_palette                ; $01B620 |
  SEP #$20                                  ; $01B623 |
  LDA #$0C                                  ; $01B625 |
  STA $0127                                 ; $01B627 |
  JMP CODE_01B5D1                           ; $01B62A |

; tilemap init queue entries
; Score screen BG1 tilemap
  dw $6800, $40BF, $18EE                    ; $01B62D |
  dw $68A0, $447F, $1A11                    ; $01B633 |
  dw $6860, $C029, $18EE                    ; $01B639 |
  dw $6861, $C029, $18EE                    ; $01B63F |
  dw $687E, $C029, $18EE                    ; $01B645 |
  dw $687F, $C029, $18EE                    ; $01B64B |
  dw $6B00, $413F, $18EE                    ; $01B651 |
; end marker
  dw $FFFF                                  ; $01B657 |

  dw $0145, $0146, $8145, $C146             ; $01B659 |
  dw $4145, $4146, $0145, $0146             ; $01B661 |
  dw $8145, $8146, $4145, $0146             ; $01B669 |
  dw $0145, $8146, $0145, $0146             ; $01B671 |
  dw $0145, $0146, $8145, $C146             ; $01B679 |
  dw $0145, $0146, $8145, $0146             ; $01B681 |

  dw $0145, $0146, $8145, $8146             ; $01B689 |
  dw $0145, $0146, $0145, $0146             ; $01B691 |
  dw $8145, $8146, $0145, $8146             ; $01B699 |
  dw $0145, $8146, $8145, $0146             ; $01B6A1 |
  dw $4145, $0146, $8145, $0146             ; $01B6A9 |
  dw $0145, $8146, $0145, $0146             ; $01B6B1 |

  LDA #$18                                  ; $01B6B9 |
  STA $0127                                 ; $01B6BB |
  JMP CODE_01B5D1                           ; $01B6BE |

; tilemap init queue entries
; Score Screen BG3
  dw $3400, $47FF, $117F                    ; $01B6C1 |
; End marker
  dw $FFFF

  REP #$30                                  ; $01B6C9 |
  LDX #$000A                                ; $01B6CB |
  LDY #$0000                                ; $01B6CE |
  STZ $00                                   ; $01B6D1 |

CODE_01B6D3:
  LDA $B7D7,y                               ; $01B6D3 |
  JSR CODE_01B785                           ; $01B6D6 |
  CPY #$0016                                ; $01B6D9 |
  BCC CODE_01B6D3                           ; $01B6DC |
  JSR CODE_01B7A1                           ; $01B6DE |
  JSR CODE_01B7B3                           ; $01B6E1 |
  JSR CODE_01B7C5                           ; $01B6E4 |
  LDX #$03CE                                ; $01B6E7 |
  LDY #$0000                                ; $01B6EA |
  STZ $00                                   ; $01B6ED |

CODE_01B6EF:
  LDA $B835,y                               ; $01B6EF |
  JSR CODE_01B785                           ; $01B6F2 |
  CPY #$0015                                ; $01B6F5 |
  BCC CODE_01B6EF                           ; $01B6F8 |
  SEP #$30                                  ; $01B6FA |
  LDX !r_cur_stage                          ; $01B6FC |
  LDA !r_stage_scores,x                     ; $01B6FF |
  REP #$30                                  ; $01B702 |
  AND #$00FF                                ; $01B704 |
  STA $030C                                 ; $01B707 |
  STZ $00                                   ; $01B70A |
  LDA $030C                                 ; $01B70C |
  CMP #$0064                                ; $01B70F |
  BCC CODE_01B71C                           ; $01B712 |
  LDA #$000B                                ; $01B714 |
  STA $00                                   ; $01B717 |
  DEC A                                     ; $01B719 |
  BRA CODE_01B728                           ; $01B71A |

CODE_01B71C:
  CMP #$000A                                ; $01B71C |
  BCC CODE_01B728                           ; $01B71F |
  INC $00                                   ; $01B721 |
  SBC #$000A                                ; $01B723 |
  BRA CODE_01B71C                           ; $01B726 |

CODE_01B728:
  ASL A                                     ; $01B728 |
  TAY                                       ; $01B729 |
  LDA $B8AF,y                               ; $01B72A |
  STA $7E5DD4                               ; $01B72D |
  LDA $B92D,y                               ; $01B731 |
  STA $7E5E14                               ; $01B734 |
  LDA $00                                   ; $01B738 |
  ASL A                                     ; $01B73A |
  TAY                                       ; $01B73B |
  LDA $B8AF,y                               ; $01B73C |
  STA $7E5DD2                               ; $01B73F |
  LDA $B92D,y                               ; $01B743 |
  STA $7E5E12                               ; $01B746 |
  LDA #$0056                                ; $01B74A |
  STA $01                                   ; $01B74D |
  LDY #$2800                                ; $01B74F |
  LDX #$D000                                ; $01B752 |
  LDA #$0800                                ; $01B755 |
  JSL $00BEA6                               ; $01B758 |
  LDA #$0052                                ; $01B75C |
  STA $01                                   ; $01B75F |
  LDY #$1000                                ; $01B761 |
  LDX #$1E00                                ; $01B764 |
  LDA #$0100                                ; $01B767 |
  JSL $00BEA6                               ; $01B76A |
  LDA #$0052                                ; $01B76E |
  STA $01                                   ; $01B771 |
  LDY #$1100                                ; $01B773 |
  LDX #$1EC0                                ; $01B776 |
  LDA #$0100                                ; $01B779 |
  JSL $00BEA6                               ; $01B77C |
  SEP #$30                                  ; $01B780 |
  JMP CODE_01B5D1                           ; $01B782 |

CODE_01B785:
  PHY                                       ; $01B785 |
  AND #$00FF                                ; $01B786 |
  TAY                                       ; $01B789 |
  LDA $B85F,y                               ; $01B78A |
  ORA $00                                   ; $01B78D |
  STA $7E5DA6,x                             ; $01B78F |
  LDA $B8DD,y                               ; $01B793 |
  ORA $00                                   ; $01B796 |
  STA $7E5DE6,x                             ; $01B798 |
  INX                                       ; $01B79C |
  INX                                       ; $01B79D |
  PLY                                       ; $01B79E |
  INY                                       ; $01B79F |
  RTS                                       ; $01B7A0 |

CODE_01B7A1:
  LDX #$0108                                ; $01B7A1 |
  LDY #$0000                                ; $01B7A4 |

CODE_01B7A7:
  LDA $B7ED,y                               ; $01B7A7 |
  JSR CODE_01B785                           ; $01B7AA |
  CPY #$0018                                ; $01B7AD |
  BCC CODE_01B7A7                           ; $01B7B0 |
  RTS                                       ; $01B7B2 |

CODE_01B7B3:
  LDX #$01C8                                ; $01B7B3 |
  LDY #$0000                                ; $01B7B6 |

CODE_01B7B9:
  LDA $B805,y                               ; $01B7B9 |
  JSR CODE_01B785                           ; $01B7BC |
  CPY #$0018                                ; $01B7BF |
  BCC CODE_01B7B9                           ; $01B7C2 |
  RTS                                       ; $01B7C4 |

CODE_01B7C5:
  LDX #$0288                                ; $01B7C5 |
  LDY #$0000                                ; $01B7C8 |

CODE_01B7CB:
  LDA $B81D,y                               ; $01B7CB |
  JSR CODE_01B785                           ; $01B7CE |
  CPY #$0018                                ; $01B7D1 |
  BCC CODE_01B7CB                           ; $01B7D4 |
  RTS                                       ; $01B7D6 |

  db $3A, $3C, $4E, $0E, $10, $0C, $0E, $4E ; $01B7D7 |
  db $24, $04, $1C, $22, $08, $36, $36, $36 ; $01B7DF |
  db $36, $54, $5C, $4E, $3A, $3C           ; $01B7E7 |

  db $3E, $40, $4E, $24, $26, $00, $22, $24 ; $01B7ED |
  db $36, $36, $36, $36, $36, $36, $50, $34 ; $01B7F5 |
  db $56, $50, $68, $6A, $4E, $50, $6C, $6E ; $01B7FD |

  db $46, $48, $4E, $04, $1C, $10, $1A, $24 ; $01B805 |
  db $36, $36, $36, $36, $36, $36, $50, $34 ; $01B80D |
  db $54, $50, $68, $6A, $4E, $50, $6C, $6E ; $01B815 |

  db $42, $44, $4E, $0A, $16, $1C, $2C, $08 ; $01B81D |
  db $22, $24, $36, $36, $36, $36, $36, $50 ; $01B825 |
  db $34, $5A, $68, $6A, $4E, $50, $6C, $6E ; $01B82D |

  db $26, $1C, $26, $00, $16, $4E, $1E, $1C ; $01B835 |
  db $10, $1A, $26, $24, $36, $36, $36, $36 ; $01B83D |
  db $36, $36, $50, $6C, $6E                ; $01B845 |

  db $4E, $0E, $10, $0C, $0E, $4E, $24, $04 ; $01B84A |
  db $1C, $22, $08, $36, $36, $36, $36, $36 ; $01B852 |
  db $36, $36, $50, $6C, $6E                ; $01B85A |

  dw $010A, $010B, $010C, $010D             ; $01B85F |
  dw $010E, $4106, $0120, $0121             ; $01B867 |
  dw $0122, $0123, $0124, $C116             ; $01B86F |
  dw $0126, $0127, $0109, $0128             ; $01B877 |
  dw $0129, $0128, $4102, $012C             ; $01B87F |
  dw $012D, $012E, $8136, $0101             ; $01B887 |
  dw $0101, $0142, $0144, $0143             ; $01B88F |
  dw $017F, $012A, $012B, $0548             ; $01B897 |
  dw $0549, $054A, $054B, $054C             ; $01B89F |
  dw $054D, $054E, $054F, $017F             ; $01B8A7 |

  dw $0109, $0100, $0102, $0102             ; $01B8AF |
  dw $0103, $0104, $0105, $0106             ; $01B8B7 |
  dw $0107, $C115, $0168, $0167             ; $01B8BF |
  dw $0175, $0176, $017F, $017F             ; $01B8C7 |
  dw $01C4, $010F, $01D6, $0164             ; $01B8CF |
  dw $0174, $016E, $017F                    ; $01B8D7 |

  dw $011A, $011B, $011C, $011D             ; $01B8DD |
  dw $011E, $011F, $0130, $0131             ; $01B8E5 |
  dw $0132, $0133, $0134, $C106             ; $01B8ED |
  dw $0136, $0137, $0119, $0138             ; $01B8F5 |
  dw $0139, $0140, $0112, $013C             ; $01B8FD |
  dw $013D, $013E, $8126, $0111             ; $01B905 |
  dw $013C, $C142, $C144, $017F             ; $01B90D |
  dw $0141, $013A, $013B, $0508             ; $01B915 |
  dw $0518, $0525, $0535, $052F             ; $01B91D |
  dw $053F, $050F, $0547, $017F             ; $01B925 |

  dw $0119, $0110, $C142, $0112             ; $01B92D |
  dw $0113, $0114, $0115, $0116             ; $01B935 |
  dw $0117, $C105, $0178, $0177             ; $01B93D |
  dw $0179, $017A, $015F, $017B             ; $01B945 |
  dw $01D4, $013D, $01D7, $011E             ; $01B94D |
  dw $011E, $017E, $0158                    ; $01B955 |

  REP #$20                                  ; $01B95B |
  STZ $0392                                 ; $01B95D |
  STZ $0B5F                                 ; $01B960 |
  STZ $0B61                                 ; $01B963 |
  STZ $0B63                                 ; $01B966 |
  STZ $0381                                 ; $01B969 |
  SEP #$20                                  ; $01B96C |
  LDA #$0F                                  ; $01B96E |
  STA $0127                                 ; $01B970 |
  JMP CODE_01B5D1                           ; $01B973 |

; Score Screen BG3 tilemap DMA entries
  dw $6862, $0001, $1A02, $6863             ; $01B976 |
  dw $4033, $1A03, $687D, $0001             ; $01B97E |
  dw $1A04, $6882, $C025, $1A05             ; $01B986 |
  dw $6883, $0001, $1A00, $6884             ; $01B98E |
  dw $4031, $1A01, $689D, $C025             ; $01B996 |
  dw $1A15, $68A3, $C023, $1A10             ; $01B99E |
  dw $6AE2, $0001, $1A12, $6AE3             ; $01B9A6 |
  dw $4033, $1A13, $6AFD, $0001             ; $01B9AE |
  dw $1A14                                  ; $01B9B6 |
; End Marker
  dw $FFFF                                  ; $01B9B8 |

  REP #$30                                  ; $01B9BA |
  LDA #$007E                                ; $01B9BC |
  STA $01                                   ; $01B9BF |
  LDY #$34A0                                ; $01B9C1 |
  LDX #$5DA6                                ; $01B9C4 |
  LDA #$0480                                ; $01B9C7 |
  JSL $00BEA6                               ; $01B9CA |
  LDX #$001C                                ; $01B9CE |

CODE_01B9D1:
  LDA $5FC094,x                             ; $01B9D1 |
  STA $702002,x                             ; $01B9D5 |
  LDA $5FB31A,x                             ; $01B9D9 |
  STA $7020C2,x                             ; $01B9DD |
  LDA $5FB33A,x                             ; $01B9E1 |
  STA $7020E2,x                             ; $01B9E5 |
  DEX                                       ; $01B9E9 |
  DEX                                       ; $01B9EA |
  BPL CODE_01B9D1                           ; $01B9EB |
  STZ $39                                   ; $01B9ED |
  STZ $3B                                   ; $01B9EF |
  STZ $41                                   ; $01B9F1 |
  STZ $43                                   ; $01B9F3 |
  STZ !r_reg_coldata_mirror                 ; $01B9F5 |
  LDA #$0000                                ; $01B9F8 |
  STA !s_cgram_mirror                       ; $01B9FB |
  STZ $0B5B                                 ; $01B9FF |
  STZ $0B5D                                 ; $01BA02 |
  SEP #$30                                  ; $01BA05 |
  LDA !r_reg_bgmode_mirror                  ; $01BA07 |
  AND #$0F                                  ; $01BA0A |
  STA !r_reg_bgmode_mirror                  ; $01BA0C |
  LDA #$04                                  ; $01BA0F |
  STA !r_reg_tm_mirror                      ; $01BA11 |
  LDA #$01                                  ; $01BA14 |
  STA !r_reg_ts_mirror                      ; $01BA16 |
  JMP CODE_01B5D1                           ; $01BA19 |
  JSR CODE_01BEE4                           ; $01BA1C |
  DEC $038B                                 ; $01BA1F |
  BNE CODE_01BA2E                           ; $01BA22 |
  JSR CODE_01B5D1                           ; $01BA24 |
  LDA $0B57                                 ; $01BA27 |
  CMP #$29                                  ; $01BA2A |
  BCS CODE_01BA2E                           ; $01BA2C |

CODE_01BA2E:
  RTS                                       ; $01BA2E |

  JSR CODE_01BEE4                           ; $01BA2F |
  REP #$30                                  ; $01BA32 |
  LDA !r_stars_amount                       ; $01BA34 |
  SEC                                       ; $01BA37 |
  SBC #$000A                                ; $01BA38 |
  STA !r_stars_amount                       ; $01BA3B |
  BPL CODE_01BA69                           ; $01BA3E |
  STZ !r_stars_amount                       ; $01BA40 |
  SEP #$30                                  ; $01BA43 |
  LDA #$20                                  ; $01BA45 |
  STA $038B                                 ; $01BA47 |
  LDA !r_red_coins_amount                   ; $01BA4A |
  ORA $03B5                                 ; $01BA4D |
  BNE CODE_01BA66                           ; $01BA50 |
  JSR CODE_01B5D1                           ; $01BA52 |
  JSR CODE_01B5D1                           ; $01BA55 |
  LDA !r_flowers_amount                     ; $01BA58 |
  ORA $03B9                                 ; $01BA5B |
  BNE CODE_01BA66                           ; $01BA5E |
  JSR CODE_01B5D1                           ; $01BA60 |
  JSR CODE_01B5D1                           ; $01BA63 |

CODE_01BA66:
  JMP CODE_01B5D1                           ; $01BA66 |

CODE_01BA69:
  STZ $02                                   ; $01BA69 |
  INC $0392                                 ; $01BA6B |
  STZ $0392                                 ; $01BA6E |
  LDA $0B5F                                 ; $01BA71 |
  INC A                                     ; $01BA74 |
  CMP #$001E                                ; $01BA75 |
  BCC CODE_01BA89                           ; $01BA78 |
  LDA #$0400                                ; $01BA7A |
  STA $00                                   ; $01BA7D |
  STA $02                                   ; $01BA7F |
  JSR CODE_01B7A1                           ; $01BA81 |
  LDA #$001E                                ; $01BA84 |
  BRA CODE_01BA95                           ; $01BA87 |

CODE_01BA89:
  PHA                                       ; $01BA89 |
  SEP #$30                                  ; $01BA8A |
  LDA #$5A                                  ; $01BA8C |\ play sound #$005A
  JSL push_sound_queue                      ; $01BA8E |/
  REP #$30                                  ; $01BA92 |
  PLA                                       ; $01BA94 |

CODE_01BA95:
  STA $0B5F                                 ; $01BA95 |
  LDX #$0000                                ; $01BA98 |

CODE_01BA9B:
  CMP #$000A                                ; $01BA9B |
  BCC CODE_01BAA6                           ; $01BA9E |
  INX                                       ; $01BAA0 |
  SBC #$000A                                ; $01BAA1 |
  BRA CODE_01BA9B                           ; $01BAA4 |

CODE_01BAA6:
  STA $00                                   ; $01BAA6 |
  LDA #$007E                                ; $01BAA8 |
  STA $06                                   ; $01BAAB |
  STA $09                                   ; $01BAAD |
  STA $12                                   ; $01BAAF |
  STA $15                                   ; $01BAB1 |
  LDA #$5EC8                                ; $01BAB3 |
  STA $04                                   ; $01BAB6 |
  CLC                                       ; $01BAB8 |
  ADC #$000E                                ; $01BAB9 |
  STA $0010                                 ; $01BABC |
  LDA #$5F08                                ; $01BABF |
  STA $07                                   ; $01BAC2 |
  CLC                                       ; $01BAC4 |
  ADC #$000E                                ; $01BAC5 |
  STA $13                                   ; $01BAC8 |
  JSR CODE_01BBD4                           ; $01BACA |
  SEP #$30                                  ; $01BACD |
  RTS                                       ; $01BACF |

  JSR CODE_01BEE4                           ; $01BAD0 |
  REP #$30                                  ; $01BAD3 |
  LDA $0B61                                 ; $01BAD5 |
  CMP #$0014                                ; $01BAD8 |
  BCS CODE_01BAE5                           ; $01BADB |
  DEC !r_red_coins_amount                   ; $01BADD |
  LDA !r_red_coins_amount                   ; $01BAE0 |
  BPL CODE_01BAFD                           ; $01BAE3 |

CODE_01BAE5:
  SEP #$30                                  ; $01BAE5 |
  LDA #$20                                  ; $01BAE7 |
  STA $038B                                 ; $01BAE9 |
  LDA !r_flowers_amount                     ; $01BAEC |
  ORA $03B9                                 ; $01BAEF |
  BNE CODE_01BAFA                           ; $01BAF2 |
  JSR CODE_01B5D1                           ; $01BAF4 |
  JSR CODE_01B5D1                           ; $01BAF7 |

CODE_01BAFA:
  JMP CODE_01B5D1                           ; $01BAFA |

CODE_01BAFD:
  STZ $02                                   ; $01BAFD |
  LDA $0B61                                 ; $01BAFF |
  INC A                                     ; $01BB02 |
  CMP #$0014                                ; $01BB03 |
  BCC CODE_01BB17                           ; $01BB06 |
  LDA #$0400                                ; $01BB08 |
  STA $00                                   ; $01BB0B |
  STA $02                                   ; $01BB0D |
  JSR CODE_01B7B3                           ; $01BB0F |
  LDA #$0014                                ; $01BB12 |
  BRA CODE_01BB23                           ; $01BB15 |

CODE_01BB17:
  PHA                                       ; $01BB17 |
  SEP #$30                                  ; $01BB18 |
  LDA #$5A                                  ; $01BB1A |\ play sound #$005A
  JSL push_sound_queue                      ; $01BB1C |/
  REP #$30                                  ; $01BB20 |
  PLA                                       ; $01BB22 |

CODE_01BB23:
  STA $0B61                                 ; $01BB23 |
  LDX #$0000                                ; $01BB26 |

CODE_01BB29:
  CMP #$000A                                ; $01BB29 |
  BCC CODE_01BB34                           ; $01BB2C |
  INX                                       ; $01BB2E |
  SBC #$000A                                ; $01BB2F |
  BRA CODE_01BB29                           ; $01BB32 |

CODE_01BB34:
  STA $00                                   ; $01BB34 |
  LDA #$007E                                ; $01BB36 |
  STA $06                                   ; $01BB39 |
  STA $09                                   ; $01BB3B |
  STA $12                                   ; $01BB3D |
  STA $15                                   ; $01BB3F |
  LDA #$5F88                                ; $01BB41 |
  STA $04                                   ; $01BB44 |
  CLC                                       ; $01BB46 |
  ADC #$000E                                ; $01BB47 |
  STA $10                                   ; $01BB4A |
  LDA #$5FC8                                ; $01BB4C |
  STA $07                                   ; $01BB4F |
  CLC                                       ; $01BB51 |
  ADC #$000E                                ; $01BB52 |
  STA $13                                   ; $01BB55 |
  JSR CODE_01BBD4                           ; $01BB57 |
  SEP #$30                                  ; $01BB5A |
  RTS                                       ; $01BB5C |

  JSR CODE_01BEE4                           ; $01BB5D |
  REP #$30                                  ; $01BB60 |
  DEC !r_flowers_amount                     ; $01BB62 |
  LDA !r_flowers_amount                     ; $01BB65 |
  BPL CODE_01BB77                           ; $01BB68 |
  STZ !r_flowers_amount                     ; $01BB6A |
  SEP #$30                                  ; $01BB6D |
  LDA #$20                                  ; $01BB6F |
  STA $038B                                 ; $01BB71 |
  JMP CODE_01B5D1                           ; $01BB74 |

CODE_01BB77:
  STZ $02                                   ; $01BB77 |
  LDA $0B63                                 ; $01BB79 |
  CLC                                       ; $01BB7C |
  ADC #$000A                                ; $01BB7D |
  STA $0B63                                 ; $01BB80 |
  LDX #$0000                                ; $01BB83 |

CODE_01BB86:
  CMP #$000A                                ; $01BB86 |
  BCC CODE_01BB91                           ; $01BB89 |
  INX                                       ; $01BB8B |
  SBC #$000A                                ; $01BB8C |
  BRA CODE_01BB86                           ; $01BB8F |

CODE_01BB91:
  CPX #$0005                                ; $01BB91 |
  BCC CODE_01BBA2                           ; $01BB94 |
  PHX                                       ; $01BB96 |
  LDA #$0400                                ; $01BB97 |
  STA $00                                   ; $01BB9A |
  STA $02                                   ; $01BB9C |
  JSR CODE_01B7C5                           ; $01BB9E |
  PLX                                       ; $01BBA1 |

CODE_01BBA2:
  LDA #$FFFF                                ; $01BBA2 |
  STA $00                                   ; $01BBA5 |
  LDA #$007E                                ; $01BBA7 |
  STA $06                                   ; $01BBAA |
  STA $09                                   ; $01BBAC |
  STA $12                                   ; $01BBAE |
  STA $15                                   ; $01BBB0 |
  LDA #$604C                                ; $01BBB2 |
  STA $04                                   ; $01BBB5 |
  CLC                                       ; $01BBB7 |
  ADC #$000A                                ; $01BBB8 |
  STA $10                                   ; $01BBBB |
  LDA #$608C                                ; $01BBBD |
  STA $07                                   ; $01BBC0 |
  CLC                                       ; $01BBC2 |
  ADC #$000A                                ; $01BBC3 |
  STA $13                                   ; $01BBC6 |
  JSR CODE_01BBD4                           ; $01BBC8 |
  SEP #$30                                  ; $01BBCB |
  LDA #$5A                                  ; $01BBCD |\ play sound #$005A
  JSL push_sound_queue                      ; $01BBCF |/
  RTS                                       ; $01BBD3 |

CODE_01BBD4:
  PHX                                       ; $01BBD4 |
  TXA                                       ; $01BBD5 |
  BEQ CODE_01BBEC                           ; $01BBD6 |
  ASL A                                     ; $01BBD8 |
  TAX                                       ; $01BBD9 |
  LDA $B8AF,x                               ; $01BBDA |
  ORA $02                                   ; $01BBDD |
  STA [$04]                                 ; $01BBDF |
  STA [$10]                                 ; $01BBE1 |
  LDA $B92D,x                               ; $01BBE3 |
  ORA $02                                   ; $01BBE6 |
  STA [$07]                                 ; $01BBE8 |
  STA [$13]                                 ; $01BBEA |

CODE_01BBEC:
  LDY #$0002                                ; $01BBEC |
  LDA $00                                   ; $01BBEF |
  BMI CODE_01BC07                           ; $01BBF1 |
  ASL A                                     ; $01BBF3 |
  TAX                                       ; $01BBF4 |
  LDA $B8AF,x                               ; $01BBF5 |
  ORA $02                                   ; $01BBF8 |
  STA [$04],y                               ; $01BBFA |
  STA [$10],y                               ; $01BBFC |
  LDA $B92D,x                               ; $01BBFE |
  ORA $02                                   ; $01BC01 |
  STA [$07],y                               ; $01BC03 |
  STA [$13],y                               ; $01BC05 |

CODE_01BC07:
  PLX                                       ; $01BC07 |
  LDA $00                                   ; $01BC08 |
  BPL CODE_01BC0E                           ; $01BC0A |
  STZ $00                                   ; $01BC0C |

CODE_01BC0E:
  INC $00                                   ; $01BC0E |
  LDA $13                                   ; $01BC10 |
  CLC                                       ; $01BC12 |
  ADC #$0006                                ; $01BC13 |
  STA $13                                   ; $01BC16 |
  JSR CODE_01BCAA                           ; $01BC18 |
  STZ $00                                   ; $01BC1B |
  STZ $02                                   ; $01BC1D |
  LDX #$0004                                ; $01BC1F |
  LDA $0B5F                                 ; $01BC22 |
  CLC                                       ; $01BC25 |
  ADC $0B61                                 ; $01BC26 |
  CLC                                       ; $01BC29 |
  ADC $0B63                                 ; $01BC2A |
  CMP #$0064                                ; $01BC2D |
  BCC CODE_01BC35                           ; $01BC30 |
  LDA #$0064                                ; $01BC32 |

CODE_01BC35:
  STA $0381                                 ; $01BC35 |
  CMP #$0064                                ; $01BC38 |
  BCC CODE_01BC45                           ; $01BC3B |
  LDA #$000B                                ; $01BC3D |
  STA $00                                   ; $01BC40 |
  DEC A                                     ; $01BC42 |
  BRA CODE_01BC51                           ; $01BC43 |

CODE_01BC45:
  CMP #$000A                                ; $01BC45 |
  BCC CODE_01BC51                           ; $01BC48 |
  INC $00                                   ; $01BC4A |
  SBC #$000A                                ; $01BC4C |
  BRA CODE_01BC45                           ; $01BC4F |

CODE_01BC51:
  ASL A                                     ; $01BC51 |
  TAX                                       ; $01BC52 |
  LDA $B8AF,x                               ; $01BC53 |
  STA $7E6198                               ; $01BC56 |
  LDA $B92D,x                               ; $01BC5A |
  STA $7E61D8                               ; $01BC5D |
  LDA $00                                   ; $01BC61 |
  BEQ CODE_01BC75                           ; $01BC63 |
  ASL A                                     ; $01BC65 |
  TAY                                       ; $01BC66 |
  LDA $B8AF,y                               ; $01BC67 |
  STA $7E6196                               ; $01BC6A |
  LDA $B92D,y                               ; $01BC6E |
  STA $7E61D6                               ; $01BC71 |

CODE_01BC75:
  LDA $02                                   ; $01BC75 |
  ASL A                                     ; $01BC77 |
  TAY                                       ; $01BC78 |
  BEQ CODE_01BC89                           ; $01BC79 |
  LDA $B8AF,y                               ; $01BC7B |
  STA $7E6194                               ; $01BC7E |
  LDA $B92D,y                               ; $01BC82 |
  STA $7E61D4                               ; $01BC85 |

CODE_01BC89:
  TXA                                       ; $01BC89 |
  ORA $02                                   ; $01BC8A |
  TAX                                       ; $01BC8C |
  STZ $02                                   ; $01BC8D |
  LDA #$61DC                                ; $01BC8F |
  STA $13                                   ; $01BC92 |
  JSR CODE_01BCAA                           ; $01BC94 |
  LDA #$007E                                ; $01BC97 |
  STA $01                                   ; $01BC9A |
  LDY #$34A0                                ; $01BC9C |
  LDX #$5DA6                                ; $01BC9F |
  LDA #$0480                                ; $01BCA2 |
  JSL $00BEA6                               ; $01BCA5 |
  RTS                                       ; $01BCA9 |

CODE_01BCAA:
  TXA                                       ; $01BCAA |
  BNE CODE_01BCB5                           ; $01BCAB |
  LDA $00                                   ; $01BCAD |
  BEQ CODE_01BCBC                           ; $01BCAF |
  DEC A                                     ; $01BCB1 |
  DEC A                                     ; $01BCB2 |
  BEQ CODE_01BCBC                           ; $01BCB3 |

CODE_01BCB5:
  LDA #$016F                                ; $01BCB5 |
  ORA $02                                   ; $01BCB8 |
  STA [$13]                                 ; $01BCBA |

CODE_01BCBC:
  RTS                                       ; $01BCBC |

  JSR CODE_01BEE4                           ; $01BCBD |
  LDA #$30                                  ; $01BCC0 |
  STA $038B                                 ; $01BCC2 |
  REP #$30                                  ; $01BCC5 |
  STZ $03BA                                 ; $01BCC7 |
  LDX #$0029                                ; $01BCCA |
  LDA $0381                                 ; $01BCCD |
  BMI CODE_01BCDA                           ; $01BCD0 |
  CMP $030C                                 ; $01BCD2 |
  BCC CODE_01BCDA                           ; $01BCD5 |
  LDX #$002D                                ; $01BCD7 |

CODE_01BCDA:
  STX $0B57                                 ; $01BCDA |
  SEP #$30                                  ; $01BCDD |
  RTS                                       ; $01BCDF |

  dw $6218, $621A, $621C, $61DA             ; $01BCE0 |
  dw $621A, $621C                           ; $01BCE8 |

  dw $0555, $0556, $0557, $015F             ; $01BCEC |
  dw $0565, $0566                           ; $01BCF4 |

  JSR CODE_01BEE4                           ; $01BCF8 |
  LDA #$7E                                  ; $01BCFB |
  STA $02                                   ; $01BCFD |
  REP #$30                                  ; $01BCFF |
  LDA $03BA                                 ; $01BD01 |
  AND #$00FE                                ; $01BD04 |
  TAX                                       ; $01BD07 |
  CPX #$000C                                ; $01BD08 |
  BCC CODE_01BD15                           ; $01BD0B |
  LDA #$003D                                ; $01BD0D |
  STA $0B57                                 ; $01BD10 |
  BRA CODE_01BD25                           ; $01BD13 |

CODE_01BD15:
  LDA $BCE0,x                               ; $01BD15 |
  STA $00                                   ; $01BD18 |
  LDA $BCEC,x                               ; $01BD1A |
  STA [$00]                                 ; $01BD1D |
  INC $03BA                                 ; $01BD1F |
  JSR CODE_01BC89                           ; $01BD22 |

CODE_01BD25:
  SEP #$30                                  ; $01BD25 |
  RTS                                       ; $01BD27 |

  dw $6218, $6216, $6214, $61D4             ; $01BD28 |
  dw $6194, $6156, $6158, $615A             ; $01BD30 |
  dw $619A, $61DA                           ; $01BD38 |

  dw $0562, $0561, $0560, $0563             ; $01BD3C |
  dw $0553, $0550, $0551, $0552             ; $01BD44 |
  dw $0554, $015F                           ; $01BD4C |

  JSR CODE_01BEE4                           ; $01BD50 |
  LDA #$7E                                  ; $01BD53 |
  STA $02                                   ; $01BD55 |
  LDA #$30                                  ; $01BD57 |
  STA $038B                                 ; $01BD59 |
  REP #$30                                  ; $01BD5C |
  LDA $03BA                                 ; $01BD5E |
  AND #$00FE                                ; $01BD61 |
  TAX                                       ; $01BD64 |
  CPX #$0014                                ; $01BD65 |
  BCC CODE_01BD80                           ; $01BD68 |
  LDX #$0037                                ; $01BD6A |
  LDA $0381                                 ; $01BD6D |
  CMP #$0064                                ; $01BD70 |
  BNE CODE_01BD7B                           ; $01BD73 |
  STZ $03BA                                 ; $01BD75 |
  LDX #$0031                                ; $01BD78 |

CODE_01BD7B:
  STX $0B57                                 ; $01BD7B |
  BRA CODE_01BD90                           ; $01BD7E |

CODE_01BD80:
  LDA $BD28,x                               ; $01BD80 |
  STA $00                                   ; $01BD83 |
  LDA $BD3C,x                               ; $01BD85 |
  STA [$00]                                 ; $01BD88 |
  INC $03BA                                 ; $01BD8A |
  JSR CODE_01BC89                           ; $01BD8D |

CODE_01BD90:
  SEP #$30                                  ; $01BD90 |
  RTS                                       ; $01BD92 |

  dw $6218, $6216, $6214, $61D4             ; $01BD93 |
  dw $6194, $6154, $6156, $6158             ; $01BD9B |
  dw $615A, $619A, $61DA, $621A             ; $01BDA3 |

  dw $056B, $056A, $0569, $056D             ; $01BDAB |
  dw $055D, $0559, $055A, $055B             ; $01BDB3 |
  dw $055C, $055E, $015F, $056C             ; $01BDBB |

  LDA #$95                                  ; $01BDC3 |
  STA $53                                   ; $01BDC5 |
  JSR CODE_01B5D1                           ; $01BDC7 |
  JSR CODE_01BEE4                           ; $01BDCA |
  LDA #$7E                                  ; $01BDCD |
  STA $02                                   ; $01BDCF |
  REP #$30                                  ; $01BDD1 |
  LDA $03BA                                 ; $01BDD3 |
  AND #$00FE                                ; $01BDD6 |
  TAX                                       ; $01BDD9 |
  CPX #$0018                                ; $01BDDA |
  BCC CODE_01BDED                           ; $01BDDD |
  LDA #$0037                                ; $01BDDF |
  STA $0B57                                 ; $01BDE2 |
  LDA #$0030                                ; $01BDE5 |
  STA $038B                                 ; $01BDE8 |
  BRA CODE_01BDFD                           ; $01BDEB |

CODE_01BDED:
  LDA $BD93,x                               ; $01BDED |
  STA $00                                   ; $01BDF0 |
  LDA $BDAB,x                               ; $01BDF2 |
  STA [$00]                                 ; $01BDF5 |
  INC $03BA                                 ; $01BDF7 |
  JSR CODE_01BC89                           ; $01BDFA |

CODE_01BDFD:
  SEP #$30                                  ; $01BDFD |
  RTS                                       ; $01BDFF |

  JSR CODE_01BEE4                           ; $01BE00 |
  REP #$30                                  ; $01BE03 |
  LDA $0381                                 ; $01BE05 |
  CMP $030C                                 ; $01BE08 |
  BCS CODE_01BE15                           ; $01BE0B |
  LDA #$003D                                ; $01BE0D |
  STA $0B57                                 ; $01BE10 |
  BRA CODE_01BE60                           ; $01BE13 |

CODE_01BE15:
  STA $030C                                 ; $01BE15 |
  STZ $00                                   ; $01BE18 |
  CMP #$0064                                ; $01BE1A |
  BCC CODE_01BE27                           ; $01BE1D |
  LDA #$000B                                ; $01BE1F |
  STA $00                                   ; $01BE22 |
  DEC A                                     ; $01BE24 |
  BRA CODE_01BE33                           ; $01BE25 |

CODE_01BE27:
  CMP #$000A                                ; $01BE27 |
  BCC CODE_01BE33                           ; $01BE2A |
  INC $00                                   ; $01BE2C |
  SBC #$000A                                ; $01BE2E |
  BRA CODE_01BE27                           ; $01BE31 |

CODE_01BE33:
  ASL A                                     ; $01BE33 |
  TAY                                       ; $01BE34 |
  LDA $B8AF,y                               ; $01BE35 |
  STA $7E5DD4                               ; $01BE38 |
  LDA $B92D,y                               ; $01BE3C |
  STA $7E5E14                               ; $01BE3F |
  LDA $00                                   ; $01BE43 |
  ASL A                                     ; $01BE45 |
  TAY                                       ; $01BE46 |
  BEQ CODE_01BE5A                           ; $01BE47 |
  LDA $B8AF,y                               ; $01BE49 |
  STA $7E5DD2                               ; $01BE4C |
  LDA $B92D,y                               ; $01BE50 |
  STA $7E5E12                               ; $01BE53 |
  JSR CODE_01BC89                           ; $01BE57 |

CODE_01BE5A:
  INC $0B57                                 ; $01BE5A |
  INC $0B57                                 ; $01BE5D |

CODE_01BE60:
  SEP #$30                                  ; $01BE60 |
  RTS                                       ; $01BE62 |

  REP #$30                                  ; $01BE63 |
  LDA #$0570                                ; $01BE65 |
  STA $7E5DB0                               ; $01BE68 |
  STA $7E5DD8                               ; $01BE6C |
  LDA #$0572                                ; $01BE70 |
  STA $7E5DF0                               ; $01BE73 |
  STA $7E5E18                               ; $01BE77 |
  LDA #$0571                                ; $01BE7B |
  STA $7E5DB2                               ; $01BE7E |
  STA $7E5DDA                               ; $01BE82 |
  LDA #$0573                                ; $01BE86 |
  STA $7E5DF2                               ; $01BE89 |
  STA $7E5E1A                               ; $01BE8D |
  JSR CODE_01BC89                           ; $01BE91 |
  INC $0B57                                 ; $01BE94 |
  INC $0B57                                 ; $01BE97 |
  SEP #$30                                  ; $01BE9A |
  RTS                                       ; $01BE9C |

; save high score loop
  JSR CODE_01BEE4                           ; $01BE9D |
  LDA $36                                   ; $01BEA0 |
  ORA $35                                   ; $01BEA2 |
  AND #$F0                                  ; $01BEA4 |
  BEQ CODE_01BEE3                           ; $01BEA6 |
  JSL $01B2B7                               ; $01BEA8 |
  LDX #$1F                                  ; $01BEAC |
  LDA $0385                                 ; $01BEAE |\
  BPL CODE_01BEB8                           ; $01BEB1 | |
  JSR CODE_01BF38                           ; $01BEB3 | | if bonus, go to bonus game
  LDX #$29                                  ; $01BEB6 | |

CODE_01BEB8:
  STX !r_game_mode                          ; $01BEB8 |/
  LDA #$F1                                  ; $01BEBB |
  STA $4D                                   ; $01BEBD |
  INC $0220                                 ; $01BEBF |
  LDX !r_cur_stage                          ; $01BEC2 | load level ID
  LDA $030C                                 ; $01BEC5 | load current or high score (whichever is higher)
  CMP !r_stage_scores,x                     ; $01BEC8 |\ compare to high score
  BEQ CODE_01BEE0                           ; $01BECB | | branch if you didn't get a high score
  BCC CODE_01BEE0                           ; $01BECD |/
  PHA                                       ; $01BECF | push high score
  LDA !r_stages_unlocked,x                  ; $01BED0 |\
  AND #$7F                                  ; $01BED3 | | branch if you have beat the level before
  BEQ CODE_01BEDF                           ; $01BED5 |/
  LDA !r_stage_scores,x                     ; $01BED7 |\
  ORA #$80                                  ; $01BEDA | | store old score for the overworld score change (when you get a new high score)
  STA $0220                                 ; $01BEDC |/

CODE_01BEDF:
  PLA                                       ; $01BEDF | pull high score

CODE_01BEE0:
  STA !r_stage_scores,x                     ; $01BEE0 | store new high score

CODE_01BEE3:
  RTS                                       ; $01BEE3 | return

CODE_01BEE4:
  LDA $0B57                                 ; $01BEE4 |
  CMP #$3D                                  ; $01BEE7 |
  BCC CODE_01BF22                           ; $01BEE9 |
  DEC $0B5D                                 ; $01BEEB |
  BPL CODE_01BF22                           ; $01BEEE |
  LDA #$05                                  ; $01BEF0 |
  STA $0B5D                                 ; $01BEF2 |
  REP #$30                                  ; $01BEF5 |
  LDA $0B5B                                 ; $01BEF7 |
  TAX                                       ; $01BEFA |
  LDA $BF25,x                               ; $01BEFB |
  AND #$00FF                                ; $01BEFE |
  STA $01                                   ; $01BF01 |
  LDY #$2800                                ; $01BF03 |
  LDA $BF23,x                               ; $01BF06 |
  TAX                                       ; $01BF09 |
  LDA #$0800                                ; $01BF0A |
  JSL $00BEA6                               ; $01BF0D |
  SEP #$30                                  ; $01BF11 |
  LDA $0B5B                                 ; $01BF13 |
  INC A                                     ; $01BF16 |
  INC A                                     ; $01BF17 |
  INC A                                     ; $01BF18 |
  CMP #$09                                  ; $01BF19 |
  BCC CODE_01BF1F                           ; $01BF1B |
  LDA #$00                                  ; $01BF1D |

CODE_01BF1F:
  STA $0B5B                                 ; $01BF1F |

CODE_01BF22:
  RTS                                       ; $01BF22 |

  dl $56D000                                ; $01BF23 |
  dl $56D800                                ; $01BF26 |
  dl $56E000                                ; $01BF29 |

; Table of available bonus games
  db $00, $02                               ; $01BF2C | World 1: Flip Cards / Scratch & Match
  db $04, $0A                               ; $01BF2E | World 2: Drawing Lots / Slot Machine
  db $06, $08                               ; $01BF30 | World 3: Match Cards / Roulette
  db $04, $02                               ; $01BF32 | World 4: Drawing Lots / Scratch & Match
  db $00, $08                               ; $01BF34 | World 5: Flip Cards / Roulette
  db $06, $0A                               ; $01BF36 | World 6: Match Cards / Slot Machine

; Bonus game routine arrives here after high score screen
CODE_01BF38:
  JSL random_number_gen                     ; $01BF38 | RNG
  AND #$01                                  ; $01BF3C | Mask it to one or zero
  STA $00                                   ; $01BF3E |
  LDA !r_cur_world                          ; $01BF40 | World # determines which pair of games to choose between
  CLC                                       ; $01BF43 |
  ADC $00                                   ; $01BF44 | Add that random bit to A and put it in X
  TAX                                       ; $01BF46 |
  LDA $BF2C,x                               ; $01BF47 | Select a game ID
  STA !r_bonus_game_type                    ; $01BF4A |
  CMP #$08                                  ; $01BF4D |\  If roulette was selected...
  BNE CODE_01BF5D                           ; $01BF4F | |
  LDA !r_extra_lives                        ; $01BF51 | |
  DEC A                                     ; $01BF54 | | and we only have one life left...
  BNE CODE_01BF5D                           ; $01BF55 | |
  LDA $BF2B,x                               ; $01BF57 | | then load the game before it in the table.
  STA !r_bonus_game_type                    ; $01BF5A |/

CODE_01BF5D:
  RTS                                       ; $01BF5D |

  dw $4000, $4040, $4080, $40C0             ; $01BF5E |
  dw $4100, $4140, $4180, $41C0             ; $01BF66 |
  dw $4400, $4440                           ; $01BF6E |

  dw $1600, $1620, $1640, $1660             ; $01BF72 |
  dw $1A00, $1A20, $1A40, $1A60             ; $01BF7A |
  dw $1A80, $1AA0                           ; $01BF82 |

  db $12, $26                               ; $01BF86 |

; star counter, left side of the screen
  db $28, $28, $0C, $32                     ; $01BF88 |
  db $20, $20, $C8, $32                     ; $01BF8C |
  db $30, $20, $C8, $72                     ; $01BF90 |
  db $20, $30, $C8, $B2                     ; $01BF94 |
  db $30, $30, $C8, $F2                     ; $01BF98 |

; star counter, right side of the screen
  db $C8, $28, $0C, $32                     ; $01BF9C |
  db $C0, $20, $C8, $32                     ; $01BFA0 |
  db $D0, $20, $C8, $72                     ; $01BFA4 |
  db $C0, $30, $C8, $B2                     ; $01BFA8 |
  db $D0, $30, $C8, $F2                     ; $01BFAC |

  db $F0, $FF, $10, $00                     ; $01BFB0 |
  db $00, $00, $00, $00                     ; $01BFB4 |
  db $EA, $FF, $10, $00                     ; $01BFB8 |

; OAM slots 5-8
  db $00, $03, $C4, $30                     ; $01BFBC |
  db $08, $00, $D5, $30                     ; $01BFC0 |
  db $00, $05, $C4, $B0                     ; $01BFC4 |
  db $08, $08, $D5, $B0                     ; $01BFC8 |

  db $00, $00, $D5, $70                     ; $01BFCC |
  db $08, $03, $C4, $70                     ; $01BFD0 |
  db $00, $08, $D5, $F0                     ; $01BFD4 |
  db $08, $05, $C4, $F0                     ; $01BFD8 |
  db $03, $00, $C4, $30                     ; $01BFDC |
  db $05, $00, $C4, $70                     ; $01BFE0 |
  db $00, $08, $C5, $F0                     ; $01BFE4 |
  db $08, $08, $C5, $B0                     ; $01BFE8 |
  db $00, $00, $C5, $70                     ; $01BFEC |
  db $08, $00, $C5, $30                     ; $01BFF0 |
  db $03, $08, $C4, $B0                     ; $01BFF4 |
  db $05, $08, $C4, $F0                     ; $01BFF8 |
  db $FF, $03, $3F, $02                     ; $01BFFC |
  db $1F, $00, $10, $40                     ; $01C000 |
  db $00, $7C, $00, $7E                     ; $01C004 |
  db $E0, $47, $F4, $03                     ; $01C008 |
  db $FF, $03, $3F, $02                     ; $01C00C |
  db $1F, $00, $93, $7D                     ; $01C010 |
  db $FF, $7F, $FF, $7F                     ; $01C014 |
  db $FF, $7F, $F5, $7D                     ; $01C018 |
  db $F7, $7F, $F9, $7F                     ; $01C01C |
  db $F5, $7D, $F9, $7F                     ; $01C020 |
  db $FF, $7F, $00, $00                     ; $01C024 |
  db $00, $00, $00, $00                     ; $01C028 |
  db $00, $00, $00, $00                     ; $01C02C |
  db $00, $00, $93, $7D                     ; $01C030 |
  db $FF, $7F, $FF, $7F                     ; $01C034 |
  db $BA, $7E, $17, $7E                     ; $01C038 |
  db $F7, $7F, $18, $7F                     ; $01C03C |
  db $76, $7E, $FB, $7F                     ; $01C040 |
  db $FD, $7F, $00, $00                     ; $01C044 |
  db $00, $00, $00, $00                     ; $01C048 |
  db $00, $00, $00, $00                     ; $01C04C |
  db $00, $00, $93, $7D                     ; $01C050 |
  db $FF, $7F, $FF, $7F                     ; $01C054 |
  db $17, $7E, $BA, $7E                     ; $01C058 |
  db $F7, $7F, $76, $7E                     ; $01C05C |
  db $18, $7F, $FD, $7F                     ; $01C060 |
  db $FB, $7F, $00, $00                     ; $01C064 |
  db $00, $00, $00, $00                     ; $01C068 |
  db $00, $00, $00, $00                     ; $01C06C |
  db $00, $00, $93, $7D                     ; $01C070 |
  db $FF, $7F, $FF, $7F                     ; $01C074 |
  db $F5, $7D, $FF, $7F                     ; $01C078 |
  db $F7, $7F, $F5, $7D                     ; $01C07C |
  db $F9, $7F, $FF, $7F                     ; $01C080 |
  db $F9, $7F, $00, $00                     ; $01C084 |
  db $00, $00, $00, $00                     ; $01C088 |
  db $00, $00, $00, $00                     ; $01C08C |
  db $00, $00, $1D, $3B                     ; $01C090 |
  db $59, $77, $59, $3B                     ; $01C094 |

; camera Y offset values for small camera shake
small_shake_offsets:
  dw $0001, $0000                           ; $01C098 |
  dw $FFFF, $0000                           ; $01C09C |
  dw $FFFE, $0000                           ; $01C0A0 |
  dw $FFFF, $0000                           ; $01C0A4 |

; camera Y offset values for large camera shake
large_shake_offsets:
  dw $FFFE, $0000                           ; $01C0A8 |
  dw $0002, $0000                           ; $01C0AC |
  dw $FFFE, $0000                           ; $01C0B0 |
  dw $FFFC, $0000                           ; $01C0B4 |

  dw $0707, $1717                           ; $01C0B8 |
  dw $2727, $3737                           ; $01C0BC |
  dw $4747, $5757                           ; $01C0C0 |
  dw $6767, $7777                           ; $01C0C4 |

  dw $01FF, $02FE, $2800                    ; $01C0C8 |

  PHB                                       ; $01C0CE |
  PHK                                       ; $01C0CF |
  PLB                                       ; $01C0D0 |
  STZ $36                                   ; $01C0D1 |
  STZ $35                                   ; $01C0D3 |
  STZ $38                                   ; $01C0D5 |
  STZ $37                                   ; $01C0D7 |

gamemode0F:
  LDA #$10                                  ; $01C0D9 |
  STA $0B83                                 ; $01C0DB |
  STZ $0B84                                 ; $01C0DE |
  LDA !r_msg_box_state                      ; $01C0E1 |\ are we in a message box?
  BEQ .check_pause                          ; $01C0E4 |/ if not, continue onto pause
  JSL $01DE5A                               ; $01C0E6 | message box handler
  JMP .check_item                           ; $01C0EA |

.item_use_ptr
  dw ten_star_item                          ; $01C0ED | $01: +10 star
  dw twenty_star_item                       ; $01C0EF | $02: +20 star
  dw pow_block_item                         ; $01C0F1 | $03: POW
  dw full_egg_item                          ; $01C0F3 | $04: full egg
  dw magnifying_glass_item                  ; $01C0F5 | $05: magnifying glass
  dw enemies_to_cloud_item                  ; $01C0F7 | $06: enemies to clouds
  dw green_melon_item                       ; $01C0F9 | $07: Green melon
  dw ice_melon_item                         ; $01C0FB | $08: Ice melon
  dw fire_melon_item                        ; $01C0FD | $09: Fire melon

.check_pause
  LDA !r_pause_menu_state                   ; $01C0FF | are we paused now?
  BNE .check_start_select                   ; $01C102 |
  LDA $38                                   ; $01C104 |\
  AND #$10                                  ; $01C106 | | if not, check start button
  BEQ .check_item_s                         ; $01C108 | | for whether to init
  LDA $7FEA                                 ; $01C10A | | pausing
  ORA $0B65                                 ; $01C10D | |
  ORA $0B59                                 ; $01C110 | | also various different flags
  ORA !r_cur_item_used                      ; $01C113 | | for "active" / player control
  ORA !s_player_disable_flag                ; $01C116 | | if any of them are on, don't
  ORA !s_sprite_disable_flag                ; $01C119 | | init pause
  BNE .check_item_s                         ; $01C11C |/
  LDA !s_player_state                       ; $01C11E | also make sure yoshi's state is < 6
  CMP #$06                                  ; $01C121 | else don't pause
  BCC .init_pause                           ; $01C123 |

.check_item_s
  JMP .check_item                           ; $01C125 | continues on with item processing

.init_pause
  LDA !r_pause_menu_flag                    ; $01C128 |\
  EOR #$01                                  ; $01C12B | | inverts pause flag
  AND #$01                                  ; $01C12D | |
  STA !r_pause_menu_flag                    ; $01C12F |/
  LDA #$01                                  ; $01C132 | start off pause state
  STA !r_pause_menu_state                   ; $01C134 | at $01

.check_start_select
  LDA $38                                   ; $01C137 |\ if select is pressed
  AND #$20                                  ; $01C139 |/ while paused
  BEQ .main_pause_s                         ; $01C13B | if not, branch to main pause routine
  BRA .start_select                         ; $01C13D | if so, handle start+select

; debug code
  LDA !r_cur_save_file                      ; $01C13F |
  CMP #$02                                  ; $01C142 | debug code: if file is #2
  BNE .start_select                         ; $01C144 | start+select just works regardless
  INC $0220                                 ; $01C146 |
  BRA .start_select_exit                    ; $01C149 |

.start_select
  LDX !r_cur_stage                          ; $01C14B | read level #
  LDA !r_stages_unlocked,x                  ; $01C14E | index into levels beaten table
  AND #$7F                                  ; $01C151 | $00 or $80 indicates not beaten
  BEQ .main_pause_s                         ; $01C153 | therefore do not exit upon select

..exit
  LDA #$F0                                  ; $01C155 |\
  STA $4D                                   ; $01C157 | | fade out music
  LDA #$01                                  ; $01C159 | | and play sound $0001
  STA $53                                   ; $01C15B |/
  CPX #$0B                                  ; $01C15D |\  on intro stage,
  BNE ..ret                                 ; $01C15F | | set up map level # as 0
  STZ !r_cur_stage                          ; $01C161 |/  otherwise just preserve $021A

..ret
  LDA #$1E                                  ; $01C164 |
  STA !r_game_mode                          ; $01C166 | finally, change gamemode
  PLB                                       ; $01C169 | and just return
  RTL                                       ; $01C16A |

.main_pause_s
  JMP main_pause                            ; $01C16B | do pause menu processing

.check_item
  LDA !r_cur_item_used                      ; $01C16E |\  is item being used?
  BEQ main_gamemode_0F                      ; $01C171 |/  (this also loads ID)
  LDX !r_item_use_counter                   ; $01C173 |\  is item use counter 0?
  BEQ .item_used                            ; $01C176 | | set up item use
  DEC !r_item_use_counter                   ; $01C178 |/  else decrease counter
  BRA main_gamemode_0F                      ; $01C17B |

.item_used
  ASL A                                     ; $01C17D |
  TAX                                       ; $01C17E |
  REP #$20                                  ; $01C17F | jump into item use pointer table
  JSR (.item_use_ptr-2,x)                   ; $01C181 | with item ID * 2 as index
  SEP #$20                                  ; $01C184 |
  BRA main_gamemode_0F                      ; $01C186 |

; by this point we finally get to stuff that is not edge cases
; this shall be considered the "main loop" of gamemode 0F
main_gamemode_0F_l:
  PHB                                       ; $01C188 |
  PHK                                       ; $01C189 |
  PLB                                       ; $01C18A |

main_gamemode_0F:
  JSL init_oam_buffer                       ; $01C18B |
  JSL main_camera                           ; $01C18F |
  JSL check_new_row_column                  ; $01C193 |
  JSL check_cross_section_spawn             ; $01C197 |
  REP #$20                                  ; $01C19B |\
  LDA $3B                                   ; $01C19D | | push layer 1 camera Y
  PHA                                       ; $01C19F |/
  LDA !s_sprite_disable_flag                ; $01C1A0 |\
  ORA $0B55                                 ; $01C1A3 | | are any of these pause flags on?
  ORA !r_cur_item_used                      ; $01C1A6 | | skip camera shakes if so
  BNE .handle_offset_per_tile               ; $01C1A9 |/
  LDA !s_cam_y_large_shaking_timer          ; $01C1AB |\  large camera shake?
  BEQ .small_camera_shake                   ; $01C1AE | | if so, push timer
  PHA                                       ; $01C1B0 |/  if not, check small
  LDA !s_cam_y_small_shaking_timer          ; $01C1B1 |\  both large and small shakes simultaneously?
  BEQ .large_camera_shake                   ; $01C1B4 | | if so, decrement timer for small but don't
  DEC !s_cam_y_small_shaking_timer          ; $01C1B6 |/  use it - large shake takes priority

.large_camera_shake
  PLA                                       ; $01C1B9 |\
  DEC !s_cam_y_large_shaking_timer          ; $01C1BA | | pull and decrement timer
  AND #$0007                                ; $01C1BD | | timer mod 8 is used as index into
  ASL A                                     ; $01C1C0 | | camera Y offset table
  TAY                                       ; $01C1C1 | | giving 0-7 index; wraps around
  LDA large_shake_offsets,y                 ; $01C1C2 |/
  BRA .shake_camera_Y                       ; $01C1C5 |

.small_camera_shake
  LDA !s_cam_y_small_shaking_timer          ; $01C1C7 |\
  BEQ .handle_offset_per_tile               ; $01C1CA | | decrement timer for small shake
  DEC !s_cam_y_small_shaking_timer          ; $01C1CC | | timer mod 8 is used as index into
  AND #$0007                                ; $01C1CF | | camera Y offset table
  ASL A                                     ; $01C1D2 | | giving 0-7 index; wraps around
  TAY                                       ; $01C1D3 | |
  LDA small_shake_offsets,y                 ; $01C1D4 |/

.shake_camera_Y
  STA !r_y_cam_offset                       ; $01C1D7 | whichever offset, store into memory
  CLC                                       ; $01C1DA |\
  ADC $3B                                   ; $01C1DB | | update layer 1 camera Y with offset
  STA $3B                                   ; $01C1DD | |
  STA !s_bg1_cam_y                          ; $01C1DF |/
  LDY !r_header_bg3_tileset                 ; $01C1E2 |\
  CPY #$09                                  ; $01C1E5 | | if BG3 tileset is $09 or $0A
  BEQ .layer_3_shake                        ; $01C1E7 | | then also shake layer 3 Y
  CPY #$0A                                  ; $01C1E9 | |
  BNE .handle_offset_per_tile               ; $01C1EB |/

.layer_3_shake
  LDA !r_y_cam_offset                       ; $01C1ED |\
  CLC                                       ; $01C1F0 | |
  ADC $43                                   ; $01C1F1 | | update layer 3 camera Y with offset
  STA $43                                   ; $01C1F3 | |
  STA !s_bg3_cam_y                          ; $01C1F5 |/

.handle_offset_per_tile
  SEP #$20                                  ; $01C1F8 |
  LDX !s_opt_mode                           ; $01C1FA |\ if offset per tile disabled
  BEQ .sprite_processing                    ; $01C1FD |/ skip OPT processing
  JSR (offset_per_tile_mode_ptr-1,x)        ; $01C1FF | call current OPT mode

.sprite_processing
  JSL spr_edge_despawn_draw_check_warp      ; $01C202 | screen edge, despawn & draw sprites
  JSL draw_player                           ; $01C206 | yoshi drawing (OAM placing)
  JSL $04DD9E                               ; $01C20A |
  JSL $0397DF                               ; $01C20E |
  JSR CODE_01D6B1                           ; $01C212 |
  LDA !r_header_level_mode                  ; $01C215 |
  CMP #$09                                  ; $01C218 |\
  BEQ CODE_01C224                           ; $01C21A |/  If Raphael Boss Level Mode
  LDA !r_header_anim_palette                ; $01C21C |\
  ASL A                                     ; $01C21F | | animation palette
  TAX                                       ; $01C220 | | indexing into ptr table
  JSR (animation_palette_ptr,x)             ; $01C221 |/

CODE_01C224:
  LDA $0B55                                 ; $01C224 |
  BEQ CODE_01C232                           ; $01C227 |
  DEC $0B55                                 ; $01C229 |\
  AND #$0F                                  ; $01C22C | | Decrease Mosaic pause timer
  TAX                                       ; $01C22E | | and set Mosaic effect
  LDA $C0B8,x                               ; $01C22F | |

CODE_01C232:
  STA !r_reg_mosaic_mirror                  ; $01C232 |/
  REP #$20                                  ; $01C235 |
  PLA                                       ; $01C237 |\
  STA $3B                                   ; $01C238 | | Pull & Restore true layer 1 Y-position
  STA !s_bg1_cam_y                          ; $01C23A |/
  LDA !s_baby_mario_state                   ; $01C23D |\
  AND #$A000                                ; $01C240 | | Super Baby & Riding yoshi flags
  STA $0387                                 ; $01C243 |/
  LDA $0C8A                                 ; $01C246 |
  ORA !s_player_transforming_flag           ; $01C249 |
  ORA $0B4C                                 ; $01C24C |
  ORA !s_sprite_disable_flag                ; $01C24F |
  ORA $0B57                                 ; $01C252 |
  ORA $0B59                                 ; $01C255 |
  ORA !r_cur_item_used                      ; $01C258 |
  BEQ CODE_01C260                           ; $01C25B |
  LDA #$0001                                ; $01C25D |

CODE_01C260:
  ORA $0387                                 ; $01C260 |
  STA $0387                                 ; $01C263 |
  BNE CODE_01C29D                           ; $01C266 |
  LDA $0389                                 ; $01C268 |
  BEQ CODE_01C29D                           ; $01C26B |
  LDA !r_stars_amount                       ; $01C26D |\ if new star count >= 110
  CMP #$006E                                ; $01C270 |/ (11 stars)
  LDA #$0057                                ; $01C273 | play over 10 star sound
  BCS .lose_star_sound                      ; $01C276 |
  LDA #$0058                                ; $01C278 | else play under 10 star sound

.lose_star_sound
  JSL push_sound_queue                      ; $01C27B |
  LDY !r_tutorial_msg_flags                 ; $01C27F |
  BMI CODE_01C29D                           ; $01C282 |
  LDY !r_cur_stage                          ; $01C284 |
  BEQ CODE_01C28D                           ; $01C287 |
  CPY #$0B                                  ; $01C289 |
  BNE CODE_01C29D                           ; $01C28B |

CODE_01C28D:
  LDA #$0080                                ; $01C28D |\
  TSB !r_tutorial_msg_flags                 ; $01C290 | |
  INC !r_msg_box_state                      ; $01C293 | | In 1-1 or tutorial level
  LDA #$002C                                ; $01C296 | | Setup loss of baby tutorial message
  STA $704070                               ; $01C299 |/

CODE_01C29D:
  LDX #$08                                  ; $01C29D |
  LDA #$B1EF                                ; $01C29F |
  JSL r_gsu_init_2                          ; $01C2A2 | copy OAM buffer
  LDA !r_starcounter_timer                  ; $01C2A6 |
  BEQ CODE_01C2AE                           ; $01C2A9 |
  DEC !r_starcounter_timer                  ; $01C2AB |

CODE_01C2AE:
  LDA $0B4C                                 ; $01C2AE |
  ORA $0B57                                 ; $01C2B1 |
  ORA $0B59                                 ; $01C2B4 |
  BNE CODE_01C2E2                           ; $01C2B7 |\
  LDA !r_stars_amount                       ; $01C2B9 | | if star counter < 109
  CMP #$006D                                ; $01C2BC |/  (10 stars)
  BCC CODE_01C2F2                           ; $01C2BF |
  LDA $0387                                 ; $01C2C1 |
  BEQ CODE_01C2FA                           ; $01C2C4 |
  LDA !r_starcounter_timer                  ; $01C2C6 |
  BNE CODE_01C2EF                           ; $01C2C9 |
  LDA $35                                   ; $01C2CB |
  ORA !s_player_state                       ; $01C2CD |
  ORA !r_msg_box_state                      ; $01C2D0 |
  BNE CODE_01C2E2                           ; $01C2D3 |
  LDA !r_idle_frame_counter                 ; $01C2D5 |\  test idle timer
  CMP #$0060                                ; $01C2D8 | | >= $60 frames
  BCS CODE_01C2EF                           ; $01C2DB |/  jump to star counter drawing if so
  INC !r_idle_frame_counter                 ; $01C2DD |\  increment idle timer if not
  BRA CODE_01C2E5                           ; $01C2E0 |/

CODE_01C2E2:
  STZ !r_idle_frame_counter                 ; $01C2E2 |

CODE_01C2E5:
  LDY !r_header_level_mode                  ; $01C2E5 |
  CPY #$0D                                  ; $01C2E8 |
  BEQ CODE_01C2EF                           ; $01C2EA |
  JMP CODE_01C450                           ; $01C2EC |

CODE_01C2EF:
  JMP CODE_01C3C7                           ; $01C2EF |

CODE_01C2F2:
  STZ !r_idle_frame_counter                 ; $01C2F2 |
  LDA $0387                                 ; $01C2F5 |
  BNE CODE_01C2EF                           ; $01C2F8 |

CODE_01C2FA:
  LDX #$04                                  ; $01C2FA |
  LDA !s_spr_cam_x_pos                      ; $01C2FC |
  SEC                                       ; $01C2FF |
  SBC #$0008                                ; $01C300 |
  CMP #$00E0                                ; $01C303 |
  BCS CODE_01C314                           ; $01C306 |
  LDA !s_spr_cam_y_pos                      ; $01C308 |
  SEC                                       ; $01C30B |
  SBC #$0010                                ; $01C30C |
  CMP #$00C1                                ; $01C30F |
  BCC CODE_01C342                           ; $01C312 |

CODE_01C314:
  LDA !s_spr_cam_y_pos                      ; $01C314 |
  SEC                                       ; $01C317 |
  SBC #$0064                                ; $01C318 |
  STA $04                                   ; $01C31B |
  BPL CODE_01C323                           ; $01C31D |
  EOR #$FFFF                                ; $01C31F |
  INC A                                     ; $01C322 |

CODE_01C323:
  STA $06                                   ; $01C323 |
  LDA !s_spr_cam_x_pos                      ; $01C325 |
  SEC                                       ; $01C328 |
  SBC #$0078                                ; $01C329 |
  STA $00                                   ; $01C32C |
  BPL CODE_01C334                           ; $01C32E |
  EOR #$FFFF                                ; $01C330 |
  INC A                                     ; $01C333 |

CODE_01C334:
  STA $02                                   ; $01C334 |
  CMP $06                                   ; $01C336 |
  BCC CODE_01C33C                           ; $01C338 |
  LDX #$00                                  ; $01C33A |

CODE_01C33C:
  LDA $00,x                                 ; $01C33C |
  BPL CODE_01C342                           ; $01C33E |
  INX                                       ; $01C340 |
  INX                                       ; $01C341 |

CODE_01C342:
  LDA !s_spr_cam_x_pos                      ; $01C342 |
  CLC                                       ; $01C345 |
  ADC $BFB0,x                               ; $01C346 |
  CMP #$0002                                ; $01C349 |
  BPL CODE_01C351                           ; $01C34C |
  LDA #$0002                                ; $01C34E |

CODE_01C351:
  CMP #$00EF                                ; $01C351 |
  BMI CODE_01C359                           ; $01C354 |
  LDA #$00EE                                ; $01C356 |

CODE_01C359:
  STA $02                                   ; $01C359 |
  LDA !s_spr_cam_y_pos                      ; $01C35B |
  CLC                                       ; $01C35E |
  ADC $BFB4,x                               ; $01C35F |
  CMP #$000A                                ; $01C362 |
  BPL CODE_01C36A                           ; $01C365 |
  LDA #$000A                                ; $01C367 |

CODE_01C36A:
  CMP #$00C8                                ; $01C36A |
  BMI CODE_01C372                           ; $01C36D |
  LDA #$00C7                                ; $01C36F |

CODE_01C372:
  STA $03                                   ; $01C372 |
  TXA                                       ; $01C374 |
  ASL A                                     ; $01C375 |
  ASL A                                     ; $01C376 |
  ASL A                                     ; $01C377 |
  TAX                                       ; $01C378 |
  LDA $7974                                 ; $01C379 |
  AND #$0004                                ; $01C37C |
  LSR A                                     ; $01C37F |
  ADC #$0002                                ; $01C380 |
  XBA                                       ; $01C383 |
  STA $00                                   ; $01C384 |
  CLC                                       ; $01C386 |
  LDA $02                                   ; $01C387 |
  ADC $BFBC,x                               ; $01C389 |
  STA $6A14                                 ; $01C38C |
  LDA $BFBE,x                               ; $01C38F |
  ORA $00                                   ; $01C392 |
  STA $6A16                                 ; $01C394 |
  LDA $02                                   ; $01C397 |
  ADC $BFC0,x                               ; $01C399 |
  STA $6A18                                 ; $01C39C |
  LDA $BFC2,x                               ; $01C39F |
  ORA $00                                   ; $01C3A2 |
  STA $6A1A                                 ; $01C3A4 |
  LDA $02                                   ; $01C3A7 |
  ADC $BFC4,x                               ; $01C3A9 |
  STA $6A1C                                 ; $01C3AC |
  LDA $BFC6,x                               ; $01C3AF |
  ORA $00                                   ; $01C3B2 |
  STA $6A1E                                 ; $01C3B4 |
  LDA $02                                   ; $01C3B7 |
  ADC $BFC8,x                               ; $01C3B9 |
  STA $6A20                                 ; $01C3BC |
  LDA $BFCA,x                               ; $01C3BF |
  ORA $00                                   ; $01C3C2 |
  STA $6A22                                 ; $01C3C4 |

CODE_01C3C7:
  LDA $03A1                                 ; $01C3C7 |
  BEQ CODE_01C3EC                           ; $01C3CA |
  ASL A                                     ; $01C3CC |
  TAX                                       ; $01C3CD |
  LDA $BF72,x                               ; $01C3CE |
  STA $6140                                 ; $01C3D1 |
  XBA                                       ; $01C3D4 |
  TAX                                       ; $01C3D5 |
  INX                                       ; $01C3D6 |
  INX                                       ; $01C3D7 |
  STX $6143                                 ; $01C3D8 |
  LDA $03A3                                 ; $01C3DB |
  ASL A                                     ; $01C3DE |
  TAX                                       ; $01C3DF |
  LDA $BF72,x                               ; $01C3E0 |
  STA $6144                                 ; $01C3E3 |
  XBA                                       ; $01C3E6 |
  TAX                                       ; $01C3E7 |
  INX                                       ; $01C3E8 |
  INX                                       ; $01C3E9 |
  BRA CODE_01C405                           ; $01C3EA |

CODE_01C3EC:
  LDA $03A3                                 ; $01C3EC |
  ASL A                                     ; $01C3EF |
  TAX                                       ; $01C3F0 |
  LDA $BF5E,x                               ; $01C3F1 |
  STA $6140                                 ; $01C3F4 |
  CLC                                       ; $01C3F7 |
  ADC #$0020                                ; $01C3F8 |
  STA $6144                                 ; $01C3FB |
  XBA                                       ; $01C3FE |
  TAX                                       ; $01C3FF |
  INX                                       ; $01C400 |
  INX                                       ; $01C401 |
  STX $6143                                 ; $01C402 |

CODE_01C405:
  STX $6147                                 ; $01C405 |
  LDX #$52                                  ; $01C408 |
  STX $6142                                 ; $01C40A |
  STX $6146                                 ; $01C40D |
  LDA #$02AA                                ; $01C410 |
  STA !s_oam_hi_table_mirror                ; $01C413 |
  STZ $6C02                                 ; $01C416 |
  LDY !r_header_level_mode                  ; $01C419 |
  CPY #$0D                                  ; $01C41C |
  BEQ CODE_01C437                           ; $01C41E |
  LDA !s_player_x_cam_rel                   ; $01C420 |
  SEC                                       ; $01C423 |
  SBC #$0058                                ; $01C424 |
  CMP #$0040                                ; $01C427 |
  BCC CODE_01C43C                           ; $01C42A |
  LDX #$00                                  ; $01C42C |
  LDA !s_player_x_cam_rel                   ; $01C42E |
  SEC                                       ; $01C431 |
  SBC #$0078                                ; $01C432 |
  BPL CODE_01C439                           ; $01C435 |

CODE_01C437:
  LDX #$01                                  ; $01C437 |

CODE_01C439:
  STX !r_starcounter_side                   ; $01C439 |

CODE_01C43C:
  LDX !r_starcounter_side                   ; $01C43C |\
  LDY $BF86,x                               ; $01C43F | |
  LDX #$12                                  ; $01C442 | |

CODE_01C444:
  LDA $BF88,y                               ; $01C444 | |
  STA !s_oam_lo_table_mirror,x              ; $01C447 | | star counter OAM slots
  DEY                                       ; $01C44A | |
  DEY                                       ; $01C44B | |
  DEX                                       ; $01C44C | |
  DEX                                       ; $01C44D | |
  BPL CODE_01C444                           ; $01C44E |/

CODE_01C450:
  SEP #$20                                  ; $01C450 |
  PLB                                       ; $01C452 |
  RTL                                       ; $01C453 |

animation_palette_ptr:
  dw $C47E                                  ; $01C454 |
  dw $C493                                  ; $01C456 |
  dw $C4D9                                  ; $01C458 |
  dw $C54D                                  ; $01C45A |
  dw $C584                                  ; $01C45C |
  dw $C5BE                                  ; $01C45E |
  dw $C5F2                                  ; $01C460 |
  dw $C62D                                  ; $01C462 |
  dw $C682                                  ; $01C464 |
  dw $C6BB                                  ; $01C466 |
  dw $C702                                  ; $01C468 |
  dw $C728                                  ; $01C46A |
  dw $C783                                  ; $01C46C |
  dw $C7F2                                  ; $01C46E |
  dw $C84E                                  ; $01C470 |
  dw $C897                                  ; $01C472 |
  dw $C8CB                                  ; $01C474 |
  dw $C906                                  ; $01C476 |
  dw $C955                                  ; $01C478 |
  dw $C968                                  ; $01C47A |
  dw $C968                                  ; $01C47C |

  RTS                                       ; $01C47E |

  dw $EB4A, $EB64, $EB7E, $EB98             ; $01C47F |
  dw $EBB2, $EBCC, $EBE6, $EC00             ; $01C487 |

  db $30, $10, $50, $10                     ; $01C48F |

  REP #$20                                  ; $01C493 |
  DEC $0B75                                 ; $01C495 |
  LDA $0B75                                 ; $01C498 |
  BPL CODE_01C4C0                           ; $01C49B |
  LDA $0B73                                 ; $01C49D |
  INC A                                     ; $01C4A0 |
  INC A                                     ; $01C4A1 |
  AND #$000E                                ; $01C4A2 |
  STA $0B73                                 ; $01C4A5 |
  BNE CODE_01C4BA                           ; $01C4A8 |
  JSL $128875                               ; $01C4AA |
  AND #$0003                                ; $01C4AE |
  TAX                                       ; $01C4B1 |
  LDA $C48F,x                               ; $01C4B2 |
  AND #$00FF                                ; $01C4B5 |
  BRA CODE_01C4BD                           ; $01C4B8 |

CODE_01C4BA:
  LDA #$0004                                ; $01C4BA |

CODE_01C4BD:
  STA $0B75                                 ; $01C4BD |

CODE_01C4C0:
  LDX $0B73                                 ; $01C4C0 |
  LDA $C47F,x                               ; $01C4C3 |
  STA $00                                   ; $01C4C6 |
  LDA #$001A                                ; $01C4C8 |
  STA $0E                                   ; $01C4CB |
  LDX #$86                                  ; $01C4CD |
  JSR CODE_01C9CF                           ; $01C4CF |
  SEP #$20                                  ; $01C4D2 |
  RTS                                       ; $01C4D4 |

  db $00, $40, $40, $40                     ; $01C4D5 |

CODE_01C4D9:
  REP #$10                                  ; $01C4D9 |
  LDA !s_player_x                           ; $01C4DB |
  SEC                                       ; $01C4DE |
  SBC !s_player_x_prev                      ; $01C4DF |
  BMI CODE_01C4FB                           ; $01C4E2 |
  BNE CODE_01C4F8                           ; $01C4E4 |
  LDY !s_player_x_speed_prev                ; $01C4E6 |
  BNE CODE_01C4F6                           ; $01C4E9 |
  LDX $0B73                                 ; $01C4EB |
  CPX #$0001                                ; $01C4EE |
  BEQ CODE_01C4FE                           ; $01C4F1 |
  STZ $0B75                                 ; $01C4F3 |

CODE_01C4F6:
  LDA #$01                                  ; $01C4F6 |

CODE_01C4F8:
  EOR #$FF                                  ; $01C4F8 |
  INC A                                     ; $01C4FA |

CODE_01C4FB:
  SEC                                       ; $01C4FB |
  SBC #$06                                  ; $01C4FC |

CODE_01C4FE:
  SEP #$10                                  ; $01C4FE |
  CLC                                       ; $01C500 |
  ADC $0B75                                 ; $01C501 |
  STA $0B75                                 ; $01C504 |
  BPL CODE_01C54C                           ; $01C507 |
  LDX $0B73                                 ; $01C509 |
  INX                                       ; $01C50C |
  CPX #$04                                  ; $01C50D |
  BCC CODE_01C513                           ; $01C50F |
  LDX #$00                                  ; $01C511 |

CODE_01C513:
  STX $0B73                                 ; $01C513 |
  LDA $01C4D5,x                             ; $01C516 |
  BNE CODE_01C524                           ; $01C51A |
  LDA !s_rng                                ; $01C51C |
  AND #$E0                                  ; $01C51F |
  CLC                                       ; $01C521 |
  ADC #$20                                  ; $01C522 |

CODE_01C524:
  STA $0B75                                 ; $01C524 |
  TXA                                       ; $01C527 |
  ASL A                                     ; $01C528 |
  ADC $0B73                                 ; $01C529 |
  ASL A                                     ; $01C52C |
  TAX                                       ; $01C52D |
  PHB                                       ; $01C52E |
  LDA #$70                                  ; $01C52F |
  PHA                                       ; $01C531 |
  PLB                                       ; $01C532 |
  REP #$20                                  ; $01C533 |
  LDY #$00                                  ; $01C535 |

CODE_01C537:
  LDA $5FA190,x                             ; $01C537 |
  STA $2D76,y                               ; $01C53B |
  STA $200A,y                               ; $01C53E |
  INX                                       ; $01C541 |
  INX                                       ; $01C542 |
  INY                                       ; $01C543 |
  INY                                       ; $01C544 |
  CPY #$06                                  ; $01C545 |
  BCC CODE_01C537                           ; $01C547 |
  SEP #$20                                  ; $01C549 |
  PLB                                       ; $01C54B |

CODE_01C54C:
  RTS                                       ; $01C54C |

  LDA $7974                                 ; $01C54D |
  AND #$18                                  ; $01C550 |
  ASL A                                     ; $01C552 |
  ASL A                                     ; $01C553 |
  ADC #$1E                                  ; $01C554 |
  TAX                                       ; $01C556 |
  PHB                                       ; $01C557 |
  LDA #$70                                  ; $01C558 |
  PHA                                       ; $01C55A |
  PLB                                       ; $01C55B |
  REP #$20                                  ; $01C55C |
  LDY #$1E                                  ; $01C55E |

CODE_01C560:
  LDA $5FCCEA,x                             ; $01C560 |
  STA $2E4C,y                               ; $01C564 |
  STA $20E0,y                               ; $01C567 |
  DEX                                       ; $01C56A |
  DEX                                       ; $01C56B |
  DEY                                       ; $01C56C |
  DEY                                       ; $01C56D |
  BPL CODE_01C560                           ; $01C56E |
  SEP #$20                                  ; $01C570 |
  PLB                                       ; $01C572 |
  RTS                                       ; $01C573 |

  dw $EA5A, $EA78, $EA96, $EAB4             ; $01C574 |
  dw $EAD2, $EAF0, $EB0E, $EB2C             ; $01C57C |

  LDA $7974                                 ; $01C584 |
  AND #$1C                                  ; $01C587 |
  LSR A                                     ; $01C589 |
  TAX                                       ; $01C58A |
  LDA #$5F                                  ; $01C58B |
  STA $02                                   ; $01C58D |
  REP #$20                                  ; $01C58F |
  LDA $7FE4                                 ; $01C591 |
  CLC                                       ; $01C594 |
  ADC #$0000                                ; $01C595 |
  STA $7FE4                                 ; $01C598 |
  LDA $C574,x                               ; $01C59B |
  STA $00                                   ; $01C59E |
  PHB                                       ; $01C5A0 |
  LDY #$70                                  ; $01C5A1 |
  PHY                                       ; $01C5A3 |
  PLB                                       ; $01C5A4 |
  LDY #$00                                  ; $01C5A5 |

CODE_01C5A7:
  LDA [$00],y                               ; $01C5A7 |
  STA $2E4E,y                               ; $01C5A9 |
  STA $20E2,y                               ; $01C5AC |
  INY                                       ; $01C5AF |
  INY                                       ; $01C5B0 |
  CPY #$1E                                  ; $01C5B1 |
  BCC CODE_01C5A7                           ; $01C5B3 |
  SEP #$20                                  ; $01C5B5 |
  PLB                                       ; $01C5B7 |
  LDA #$10                                  ; $01C5B8 |
  STA $0D43                                 ; $01C5BA |
  RTS                                       ; $01C5BD |

  JSR CODE_01C644                           ; $01C5BE |

CODE_01C5C1:
  INC $0B73                                 ; $01C5C1 |
  LDA $0B73                                 ; $01C5C4 |
  AND #$38                                  ; $01C5C7 |
  ASL A                                     ; $01C5C9 |
  TAX                                       ; $01C5CA |
  PHB                                       ; $01C5CB |
  LDA #$70                                  ; $01C5CC |
  PHA                                       ; $01C5CE |
  PLB                                       ; $01C5CF |
  REP #$20                                  ; $01C5D0 |
  LDY #$00                                  ; $01C5D2 |

CODE_01C5D4:
  LDA $5FDA00,x                             ; $01C5D4 |
  STA $2E4E,y                               ; $01C5D8 |
  STA $20E2,y                               ; $01C5DB |
  INX                                       ; $01C5DE |
  INX                                       ; $01C5DF |
  INY                                       ; $01C5E0 |
  INY                                       ; $01C5E1 |
  CPY #$10                                  ; $01C5E2 |
  BCC CODE_01C5D4                           ; $01C5E4 |
  SEP #$20                                  ; $01C5E6 |
  PLB                                       ; $01C5E8 |
  RTS                                       ; $01C5E9 |

  dw $A150, $A158, $A160, $A168             ; $01C5EA |

CODE_01C5F2:
  JSR CODE_01C5C1                           ; $01C5F2 |
  REP #$20                                  ; $01C5F5 |
  LDA $7974                                 ; $01C5F7 |
  AND #$0038                                ; $01C5FA |
  LSR A                                     ; $01C5FD |
  LSR A                                     ; $01C5FE |
  TAX                                       ; $01C5FF |
  LDA $C634,x                               ; $01C600 |
  STA $00                                   ; $01C603 |
  LDX #$86                                  ; $01C605 |
  LDA #$001A                                ; $01C607 |
  STA $0E                                   ; $01C60A |
  JSR CODE_01C9CF                           ; $01C60C |
  SEP #$20                                  ; $01C60F |

CODE_01C611:
  LDA $7974                                 ; $01C611 |
  AND #$18                                  ; $01C614 |
  LSR A                                     ; $01C616 |
  LSR A                                     ; $01C617 |
  TAX                                       ; $01C618 |
  REP #$20                                  ; $01C619 |
  LDA $C5EA,x                               ; $01C61B |
  STA $00                                   ; $01C61E |
  LDX #$A6                                  ; $01C620 |
  LDA #$0008                                ; $01C622 |
  STA $0E                                   ; $01C625 |
  JSR CODE_01C9CF                           ; $01C627 |
  SEP #$20                                  ; $01C62A |
  RTS                                       ; $01C62C |

  JSR CODE_01C5C1                           ; $01C62D |
  JSR CODE_01C5F2                           ; $01C630 |
  RTS                                       ; $01C633 |

  dw $F5CE, $F5F4, $F61A, $F640             ; $01C634 |
  dw $F666, $F68C, $F6B2, $F6D8             ; $01C63C |

CODE_01C644:
  LDA !r_header_bg1_tileset                 ; $01C644 |
  AND #$07                                  ; $01C647 |
  BNE CODE_01C679                           ; $01C649 |
  REP #$20                                  ; $01C64B |
  LDA $7974                                 ; $01C64D |
  AND #$0038                                ; $01C650 |
  LSR A                                     ; $01C653 |
  LSR A                                     ; $01C654 |
  TAX                                       ; $01C655 |
  LDA $C634,x                               ; $01C656 |
  STA $00                                   ; $01C659 |
  LDX #$86                                  ; $01C65B |
  LDA #$001A                                ; $01C65D |
  STA $0E                                   ; $01C660 |
  JSR CODE_01C9CF                           ; $01C662 |
  LDA $00                                   ; $01C665 |
  CLC                                       ; $01C667 |
  ADC #$001A                                ; $01C668 |
  STA $00                                   ; $01C66B |
  LDX #$04                                  ; $01C66D |
  LDA #$000C                                ; $01C66F |
  STA $0E                                   ; $01C672 |
  JSR CODE_01C9CF                           ; $01C674 |
  SEP #$20                                  ; $01C677 |

CODE_01C679:
  RTS                                       ; $01C679 |

  dw $A170, $A178, $A180, $A188             ; $01C67A |

  LDA $7974                                 ; $01C682 |
  AND #$0C                                  ; $01C685 |
  LSR A                                     ; $01C687 |
  TAX                                       ; $01C688 |
  REP #$20                                  ; $01C689 |
  LDA $C67A,x                               ; $01C68B |
  STA $00                                   ; $01C68E |

CODE_01C690:
  LDX #$A6                                  ; $01C690 |
  LDA #$0008                                ; $01C692 |
  STA $0E                                   ; $01C695 |
  JSR CODE_01C9CF                           ; $01C697 |
  LDA !r_header_bg1_tileset                 ; $01C69A |
  CMP #$000B                                ; $01C69D |
  BNE CODE_01C6A8                           ; $01C6A0 |
  LDA #$0024                                ; $01C6A2 |
  STA !r_apu_io_1_mirror                    ; $01C6A5 |

CODE_01C6A8:
  SEP #$20                                  ; $01C6A8 |
  RTS                                       ; $01C6AA |

  dw $C932, $C934, $C936, $C938             ; $01C6AB |
  dw $C93A, $C938, $C936, $C934             ; $01C6B3 |

  LDA #$5F                                  ; $01C6BB |
  STA $02                                   ; $01C6BD |
  LDA $0B75                                 ; $01C6BF |
  INC A                                     ; $01C6C2 |
  STA $0B75                                 ; $01C6C3 |
  CMP #$06                                  ; $01C6C6 |
  BCC CODE_01C6D7                           ; $01C6C8 |
  STZ $0B75                                 ; $01C6CA |
  LDA $0B73                                 ; $01C6CD |
  INC A                                     ; $01C6D0 |
  INC A                                     ; $01C6D1 |
  AND #$0E                                  ; $01C6D2 |
  STA $0B73                                 ; $01C6D4 |

CODE_01C6D7:
  LDX $0B73                                 ; $01C6D7 |
  LDA #$5F                                  ; $01C6DA |
  STA $02                                   ; $01C6DC |
  REP #$20                                  ; $01C6DE |
  LDA $C6AB,x                               ; $01C6E0 |
  STA $00                                   ; $01C6E3 |
  LDA [$00]                                 ; $01C6E5 |
  STA $702D6E                               ; $01C6E7 |
  STA $702002                               ; $01C6EB |
  STA $702D7E                               ; $01C6EF |
  STA $702012                               ; $01C6F3 |
  SEP #$20                                  ; $01C6F7 |
  RTS                                       ; $01C6F9 |

  dw $E2EC, $E2F4, $E2FC, $E304             ; $01C6FA |

CODE_01C702:
  LDA $7974                                 ; $01C702 |
  AND #$18                                  ; $01C705 |
  LSR A                                     ; $01C707 |
  LSR A                                     ; $01C708 |
  TAX                                       ; $01C709 |
  LDA #$5F                                  ; $01C70A |
  STA $02                                   ; $01C70C |
  REP #$20                                  ; $01C70E |
  LDA $C6FA,x                               ; $01C710 |
  STA $00                                   ; $01C713 |
  JMP CODE_01C690                           ; $01C715 |

  dw $E336, $E330, $E32A, $E324             ; $01C718 |
  dw $E31E, $E318, $E312, $E30C             ; $01C720 |

  REP #$20                                  ; $01C728 |
  LDA $0B75                                 ; $01C72A |
  INC A                                     ; $01C72D |
  CMP #$0070                                ; $01C72E |
  BCS CODE_01C738                           ; $01C731 |
  STA $0B75                                 ; $01C733 |
  BRA CODE_01C770                           ; $01C736 |

CODE_01C738:
  LDA $7974                                 ; $01C738 |
  AND #$007F                                ; $01C73B |
  BNE CODE_01C770                           ; $01C73E |
  SEP #$20                                  ; $01C740 |
  LDA #$04                                  ; $01C742 |
  STA !r_reg_tm_mirror                      ; $01C744 |
  LDA #$13                                  ; $01C747 |
  STA !r_reg_ts_mirror                      ; $01C749 |
  LDA #$24                                  ; $01C74C |
  STA !r_reg_cgadsub_mirror                 ; $01C74E |
  REP #$20                                  ; $01C751 |
  LDA $0B73                                 ; $01C753 |
  INC A                                     ; $01C756 |
  CMP #$0008                                ; $01C757 |
  BCS CODE_01C770                           ; $01C75A |
  STA $0B73                                 ; $01C75C |
  ASL A                                     ; $01C75F |
  TAY                                       ; $01C760 |
  LDA $C718,y                               ; $01C761 |
  STA $00                                   ; $01C764 |
  LDX #$02                                  ; $01C766 |
  LDA #$0006                                ; $01C768 |
  STA $0E                                   ; $01C76B |
  JSR CODE_01C9CF                           ; $01C76D |

CODE_01C770:
  SEP #$20                                  ; $01C770 |
  RTS                                       ; $01C772 |

  dw $E30C, $E312, $E318, $E31E             ; $01C773 |
  dw $E324, $E32A, $E330, $E336             ; $01C77B |

  REP #$20                                  ; $01C783 |
  LDA $0B75                                 ; $01C785 |
  INC A                                     ; $01C788 |
  CMP #$01A0                                ; $01C789 |
  BCS CODE_01C793                           ; $01C78C |
  STA $0B75                                 ; $01C78E |
  BRA CODE_01C7CF                           ; $01C791 |

CODE_01C793:
  LDA $7974                                 ; $01C793 |
  AND #$003F                                ; $01C796 |
  BNE CODE_01C770                           ; $01C799 |
  LDA $0B73                                 ; $01C79B |
  INC A                                     ; $01C79E |
  CMP #$0008                                ; $01C79F |
  BCS CODE_01C7BA                           ; $01C7A2 |
  STA $0B73                                 ; $01C7A4 |
  ASL A                                     ; $01C7A7 |
  TAY                                       ; $01C7A8 |
  LDA $C773,y                               ; $01C7A9 |
  STA $00                                   ; $01C7AC |
  LDX #$02                                  ; $01C7AE |
  LDA #$0006                                ; $01C7B0 |
  STA $0E                                   ; $01C7B3 |
  JSR CODE_01C9CF                           ; $01C7B5 |
  BRA CODE_01C7CF                           ; $01C7B8 |

CODE_01C7BA:
  LDA !r_reg_tm_mirror                      ; $01C7BA |
  EOR #$0004                                ; $01C7BD |
  STA !r_reg_tm_mirror                      ; $01C7C0 |
  LDA !r_reg_cgadsub_mirror                 ; $01C7C3 |
  EOR #$0004                                ; $01C7C6 |
  STA !r_reg_cgadsub_mirror                 ; $01C7C9 |
  STZ !r_header_anim_palette                ; $01C7CC |

CODE_01C7CF:
  SEP #$20                                  ; $01C7CF |
  RTS                                       ; $01C7D1 |

  dw $EC1A, $EC20, $EC26, $EC2C             ; $01C7D2 |
  dw $EC2C, $EC26, $EC20, $EC1A             ; $01C7DA |

  dw $EC32, $EC38, $EC3E, $EC44             ; $01C7E2 |
  dw $EC44, $EC3E, $EC38, $EC32             ; $01C7EA |

  LDA $0B75                                 ; $01C7F2 |
  INC A                                     ; $01C7F5 |
  CMP #$0C                                  ; $01C7F6 |
  BCC CODE_01C7FF                           ; $01C7F8 |
  INC $0B73                                 ; $01C7FA |
  LDA #$00                                  ; $01C7FD |

CODE_01C7FF:
  STA $0B75                                 ; $01C7FF |
  LDA $0B73                                 ; $01C802 |
  AND #$07                                  ; $01C805 |
  ASL A                                     ; $01C807 |
  TAY                                       ; $01C808 |
  REP #$20                                  ; $01C809 |
  LDA !r_header_bg3_palette                 ; $01C80B |
  AND #$0001                                ; $01C80E |
  BNE CODE_01C818                           ; $01C811 |
  LDA $C7D2,y                               ; $01C813 |
  BRA CODE_01C81B                           ; $01C816 |

CODE_01C818:
  LDA $C7E2,y                               ; $01C818 |

CODE_01C81B:
  STA $00                                   ; $01C81B |
  LDX #$02                                  ; $01C81D |
  LDA #$0006                                ; $01C81F |
  STA $0E                                   ; $01C822 |
  JSR CODE_01C9CF                           ; $01C824 |
  LDA #$0002                                ; $01C827 |
  STA $0D43                                 ; $01C82A |
  LDA #$0002                                ; $01C82D |
  STA $0D4B                                 ; $01C830 |
  SEP #$20                                  ; $01C833 |
  RTS                                       ; $01C835 |

  dw $F76E, $F78E, $F7AE, $F7CE             ; $01C836 |
  dw $F7EE, $F80E, $F82E, $F84E             ; $01C83E |

  dw $00D0, $00C8                           ; $01C846 |

  dw $001C, $0038                           ; $01C84A |

CODE_01C84E:
  LDA !r_header_bg1_tileset                 ; $01C84E |
  CMP #$08                                  ; $01C851 |
  BNE CODE_01C85A                           ; $01C853 |
  JSR CODE_01C702                           ; $01C855 |
  BRA CODE_01C85D                           ; $01C858 |

CODE_01C85A:
  JSR CODE_01C611                           ; $01C85A |

CODE_01C85D:
  REP #$20                                  ; $01C85D |
  LDA !r_header_bg2_palette                 ; $01C85F |
  AND #$0001                                ; $01C862 |
  ASL A                                     ; $01C865 |
  TAY                                       ; $01C866 |
  ASL A                                     ; $01C867 |
  ASL A                                     ; $01C868 |
  ASL A                                     ; $01C869 |
  STA $00                                   ; $01C86A |
  LDA $C846,y                               ; $01C86C |
  TAX                                       ; $01C86F |
  LDA $C84A,y                               ; $01C870 |
  AND $7974                                 ; $01C873 |
  DEY                                       ; $01C876 |
  BMI CODE_01C87A                           ; $01C877 |
  LSR A                                     ; $01C879 |

CODE_01C87A:
  LSR A                                     ; $01C87A |
  TAY                                       ; $01C87B |
  LDA $C836,y                               ; $01C87C |
  CLC                                       ; $01C87F |
  ADC $00                                   ; $01C880 |
  STA $00                                   ; $01C882 |
  LDA #$0010                                ; $01C884 |
  STA $0E                                   ; $01C887 |
  JSR CODE_01C9CF                           ; $01C889 |
  SEP #$20                                  ; $01C88C |
  RTS                                       ; $01C88E |

  dw $F46A, $F470, $F476, $F47C             ; $01C88F |

  REP #$20                                  ; $01C897 |
  LDA $7974                                 ; $01C899 |
  AND #$000C                                ; $01C89C |
  LSR A                                     ; $01C89F |
  TAX                                       ; $01C8A0 |
  LDA $C88F,x                               ; $01C8A1 |
  STA $00                                   ; $01C8A4 |
  LDA #$0006                                ; $01C8A6 |
  STA $0E                                   ; $01C8A9 |
  LDX #$0A                                  ; $01C8AB |
  JSR CODE_01C9CF                           ; $01C8AD |
  SEP #$20                                  ; $01C8B0 |
  RTS                                       ; $01C8B2 |

  dw $F760, $F752, $F744, $F736             ; $01C8B3 |
  dw $F728, $F71A, $F70C, $F6FE             ; $01C8BB |

  dw $00C0, $00A0, $00E0, $00A0             ; $01C8C3 |

CODE_01C8CB:
  REP #$20                                  ; $01C8CB |
  LDA $0B77                                 ; $01C8CD |
  CMP #$0080                                ; $01C8D0 |
  BCS CODE_01C8EA                           ; $01C8D3 |
  LSR A                                     ; $01C8D5 |
  LSR A                                     ; $01C8D6 |
  AND #$000E                                ; $01C8D7 |
  TAX                                       ; $01C8DA |
  LDA $C8B3,x                               ; $01C8DB |
  STA $00                                   ; $01C8DE |
  LDA #$000E                                ; $01C8E0 |
  STA $0E                                   ; $01C8E3 |
  LDX #$92                                  ; $01C8E5 |
  JSR CODE_01C9CF                           ; $01C8E7 |

CODE_01C8EA:
  DEC $0B77                                 ; $01C8EA |
  BPL CODE_01C900                           ; $01C8ED |
  JSL $128875                               ; $01C8EF |
  ADC !r_frame_counter_global_dp            ; $01C8F3 |
  AND #$0003                                ; $01C8F5 |
  ASL A                                     ; $01C8F8 |
  TAX                                       ; $01C8F9 |
  LDA $C8C3,x                               ; $01C8FA |
  STA $0B77                                 ; $01C8FD |

CODE_01C900:
  SEP #$20                                  ; $01C900 |
  JSR CODE_01C5C1                           ; $01C902 |
  RTS                                       ; $01C905 |

  JSR CODE_01C84E                           ; $01C906 |
  REP #$20                                  ; $01C909 |
  LDA #$F95E                                ; $01C90B |
  STA $00                                   ; $01C90E |
  SEP #$20                                  ; $01C910 |

CODE_01C912:
  REP #$20                                  ; $01C912 |
  LDA $0B79                                 ; $01C914 |
  CMP #$0320                                ; $01C917 |
  BCC CODE_01C946                           ; $01C91A |
  CMP #$0520                                ; $01C91C |
  BCS CODE_01C952                           ; $01C91F |
  SBC #$031F                                ; $01C921 |
  AND #$FFE0                                ; $01C924 |
  LSR A                                     ; $01C927 |
  LSR A                                     ; $01C928 |
  ADC $00                                   ; $01C929 |
  STA $00                                   ; $01C92B |
  LDA #$0008                                ; $01C92D |
  STA $0E                                   ; $01C930 |
  LDX #$00                                  ; $01C932 |
  JSR CODE_01C9CF                           ; $01C934 |
  LDA #$1304                                ; $01C937 |
  STA !r_reg_tm_mirror                      ; $01C93A |
  LDA !r_reg_cgadsub_mirror                 ; $01C93D |
  ORA #$0004                                ; $01C940 |
  STA !r_reg_cgadsub_mirror                 ; $01C943 |

CODE_01C946:
  CLC                                       ; $01C946 |
  SED                                       ; $01C947 |
  LDA $0B79                                 ; $01C948 |
  ADC #$0001                                ; $01C94B |
  STA $0B79                                 ; $01C94E |
  CLD                                       ; $01C951 |

CODE_01C952:
  SEP #$20                                  ; $01C952 |
  RTS                                       ; $01C954 |

  JSR CODE_01C702                           ; $01C955 |
  JSR CODE_01C8CB                           ; $01C958 |
  REP #$20                                  ; $01C95B |
  LDA #$F9DE                                ; $01C95D |
  STA $00                                   ; $01C960 |
  SEP #$20                                  ; $01C962 |
  JSR CODE_01C912                           ; $01C964 |
  RTS                                       ; $01C967 |

  JSR CODE_01C4D9                           ; $01C968 |
  JSR CODE_01C85D                           ; $01C96B |
  REP #$20                                  ; $01C96E |
  LDA $7974                                 ; $01C970 |
  AND #$0038                                ; $01C973 |
  LSR A                                     ; $01C976 |
  LSR A                                     ; $01C977 |
  TAX                                       ; $01C978 |
  LDA $C634,x                               ; $01C979 |
  STA $00                                   ; $01C97C |
  LDX #$86                                  ; $01C97E |
  LDA #$001A                                ; $01C980 |
  STA $0E                                   ; $01C983 |
  JSR CODE_01C9CF                           ; $01C985 |
  SEP #$20                                  ; $01C988 |
  RTS                                       ; $01C98A |

  REP #$20                                  ; $01C98B |
  LDA $0B79                                 ; $01C98D |
  CMP #$0320                                ; $01C990 |
  BCC CODE_01C9C0                           ; $01C993 |
  CMP #$0520                                ; $01C995 |
  BCS CODE_01C9CC                           ; $01C998 |
  SBC #$031F                                ; $01C99A |
  AND #$FFE0                                ; $01C99D |
  LSR A                                     ; $01C9A0 |
  LSR A                                     ; $01C9A1 |
  ADC #$F9DE                                ; $01C9A2 |
  STA $00                                   ; $01C9A5 |
  LDA #$0008                                ; $01C9A7 |
  STA $0E                                   ; $01C9AA |
  LDX #$00                                  ; $01C9AC |
  JSR CODE_01C9CF                           ; $01C9AE |
  LDA #$1304                                ; $01C9B1 |
  STA !r_reg_tm_mirror                      ; $01C9B4 |
  LDA !r_reg_cgadsub_mirror                 ; $01C9B7 |
  ORA #$0004                                ; $01C9BA |
  STA !r_reg_cgadsub_mirror                 ; $01C9BD |

CODE_01C9C0:
  CLC                                       ; $01C9C0 |
  SED                                       ; $01C9C1 |
  LDA $0B79                                 ; $01C9C2 |
  ADC #$0001                                ; $01C9C5 |
  STA $0B79                                 ; $01C9C8 |
  CLD                                       ; $01C9CB |

CODE_01C9CC:
  SEP #$20                                  ; $01C9CC |
  RTS                                       ; $01C9CE |

CODE_01C9CF:
  LDA #$005F                                ; $01C9CF |
  STA $02                                   ; $01C9D2 |
  PHB                                       ; $01C9D4 |
  LDY #$70                                  ; $01C9D5 |
  PHY                                       ; $01C9D7 |
  PLB                                       ; $01C9D8 |
  LDY #$00                                  ; $01C9D9 |

CODE_01C9DB:
  LDA [$00],y                               ; $01C9DB |
  STA $2D6C,x                               ; $01C9DD |
  STA $2000,x                               ; $01C9E0 |
  INX                                       ; $01C9E3 |
  INX                                       ; $01C9E4 |
  INY                                       ; $01C9E5 |
  INY                                       ; $01C9E6 |
  CPY $0E                                   ; $01C9E7 |
  BCC CODE_01C9DB                           ; $01C9E9 |
  PLB                                       ; $01C9EB |
  RTS                                       ; $01C9EC |

  db $2A, $14, $E0, $30                     ; $01C9ED |
  db $3A, $14, $E2, $30                     ; $01C9F1 |
  db $2A, $24, $00, $31                     ; $01C9F5 |
  db $3A, $24, $02, $31                     ; $01C9F9 |
  db $46, $14, $E4, $30                     ; $01C9FD |
  db $56, $14, $E6, $30                     ; $01CA01 |
  db $46, $24, $04, $31                     ; $01CA05 |
  db $56, $24, $06, $31                     ; $01CA09 |
  db $62, $14, $E8, $30                     ; $01CA0D |
  db $72, $14, $EA, $30                     ; $01CA11 |
  db $62, $24, $08, $31                     ; $01CA15 |
  db $72, $24, $0A, $31                     ; $01CA19 |
  db $7E, $14, $EC, $30                     ; $01CA1D |
  db $8E, $14, $EE, $30                     ; $01CA21 |
  db $7E, $24, $0C, $31                     ; $01CA25 |
  db $8E, $24, $0E, $31                     ; $01CA29 |
  db $9A, $14, $20, $31                     ; $01CA2D |
  db $AA, $14, $22, $31                     ; $01CA31 |
  db $9A, $24, $28, $31                     ; $01CA35 |
  db $AA, $24, $2A, $31                     ; $01CA39 |

  dw $0400, $0C08, $FC10, $FC04             ; $01CA3D |
  dw $FC04, $FC04, $FC04, $FC04             ; $01CA45 |
  dw $0001, $3420, $3420, $3420             ; $01CA4D |
  dw $3420, $3420, $3420, $0400             ; $01CA55 |
  dw $40FF, $0010, $0201, $0403             ; $01CA5D |
  dw $3010, $7050, $5010, $5050             ; $01CA65 |
  dw $7050, $0001, $0002                    ; $01CA6D |

pause_state_ptr:
  dw $CAF7                                  ; $01CA73 |
  dw $CB2F                                  ; $01CA75 |
  dw $CB60                                  ; $01CA77 |
  dw $CB7C                                  ; $01CA79 |
  dw $CBA9                                  ; $01CA7B |
  dw $CBBF                                  ; $01CA7D |
  dw $CC0B                                  ; $01CA7F |
  dw $CC2F                                  ; $01CA81 |
  dw $CC5C                                  ; $01CA83 |
  dw $CC8E                                  ; $01CA85 |
  dw $CAEE                                  ; $01CA87 |
  dw $CC98                                  ; $01CA89 |
  dw $CC98                                  ; $01CA8B |
  dw $CC98                                  ; $01CA8D |
  dw $CC98                                  ; $01CA8F |
  dw $CC98                                  ; $01CA91 |
  dw $CC98                                  ; $01CA93 |
  dw $CC98                                  ; $01CA95 |
  dw $CCB1                                  ; $01CA97 |
  dw $CE34                                  ; $01CA99 |

main_pause:
  REP #$30                                  ; $01CA9B |
  LDA !r_pause_menu_state                   ; $01CA9D |
  AND #$00FF                                ; $01CAA0 |
  ASL A                                     ; $01CAA3 |
  TAX                                       ; $01CAA4 |
  LDA !r_pause_menu_flag                    ; $01CAA5 |
  AND #$00FF                                ; $01CAA8 |
  ASL A                                     ; $01CAAB |
  TAY                                       ; $01CAAC |
  JSR ($CA71,x)                             ; $01CAAD |
  SEP #$30                                  ; $01CAB0 |
  LDA !r_pause_menu_state                   ; $01CAB2 |
  CMP #$0B                                  ; $01CAB5 |
  BCC CODE_01CAC4                           ; $01CAB7 |
  LDA $0CF6                                 ; $01CAB9 |
  BEQ CODE_01CAC4                           ; $01CABC |
  JSR CODE_01DE0A                           ; $01CABE |
  JSR CODE_01CAD6                           ; $01CAC1 |

CODE_01CAC4:
  PLB                                       ; $01CAC4 |
  RTL                                       ; $01CAC5 |

  dw $7C00, $7C1F, $001F, $03FF             ; $01CAC6 |
  dw $03E0, $03FF, $001F, $7C1F             ; $01CACE |

CODE_01CAD6:
  REP #$20                                  ; $01CAD6 |
  LDA !r_frame_counter_global_dp            ; $01CAD8 |
  AND #$0038                                ; $01CADA |
  LSR A                                     ; $01CADD |
  LSR A                                     ; $01CADE |
  TAX                                       ; $01CADF |
  LDA $CAC6,x                               ; $01CAE0 |
  STA $70203C                               ; $01CAE3 |
  SEP #$20                                  ; $01CAE7 |
  RTS                                       ; $01CAE9 |

  dw $CB1E, $CB13                           ; $01CAEA |

  SEP #$30                                  ; $01CAEE |
  LDA !r_pause_menu_flag                    ; $01CAF0 |
  EOR #$01                                  ; $01CAF3 |
  BRA CODE_01CAFC                           ; $01CAF5 |
  SEP #$30                                  ; $01CAF7 |
  LDA !r_pause_menu_flag                    ; $01CAF9 |

CODE_01CAFC:
  PHA                                       ; $01CAFC |
  ASL A                                     ; $01CAFD |
  TAX                                       ; $01CAFE |
  LDA !r_reg_inidisp_mirror                 ; $01CAFF |
  JSR ($CAEA,x)                             ; $01CB02 |
  PLA                                       ; $01CB05 |
  EOR !r_pause_menu_flag                    ; $01CB06 |
  BEQ CODE_01CB0C                           ; $01CB09 |
  RTS                                       ; $01CB0B |

CODE_01CB0C:
  REP #$20                                  ; $01CB0C |
  PLA                                       ; $01CB0E |
  JML $01C2E2                               ; $01CB0F |
  DEC A                                     ; $01CB13 |
  DEC A                                     ; $01CB14 |
  BPL CODE_01CB2B                           ; $01CB15 |
  JSR CODE_01CE5D                           ; $01CB17 |
  LDA #$80                                  ; $01CB1A |
  BRA CODE_01CB2B                           ; $01CB1C |
  AND #$0F                                  ; $01CB1E |
  INC A                                     ; $01CB20 |
  INC A                                     ; $01CB21 |
  CMP #$0F                                  ; $01CB22 |
  BCC CODE_01CB2B                           ; $01CB24 |
  JSR CODE_01CE5D                           ; $01CB26 |
  LDA #$0F                                  ; $01CB29 |

CODE_01CB2B:
  STA !r_reg_inidisp_mirror                 ; $01CB2B |
  RTS                                       ; $01CB2E |

  SEP #$30                                  ; $01CB2F |
  JSL init_oam                              ; $01CB31 |
  REP #$30                                  ; $01CB35 |
  LDA !r_pause_menu_flag                    ; $01CB37 |
  BNE CODE_01CB54                           ; $01CB3A |
  STZ !r_joy1_lo                            ; $01CB3C |
  STZ !r_joy1_lo_press                      ; $01CB3F |
  STZ !r_joy2_lo                            ; $01CB42 |
  STZ !r_joy2_lo_press                      ; $01CB45 |
  STZ $35                                   ; $01CB48 |
  STZ $37                                   ; $01CB4A |
  SEP #$30                                  ; $01CB4C |
  JSL main_gamemode_0F_l                    ; $01CB4E |
  REP #$30                                  ; $01CB52 |

CODE_01CB54:
  JSR CODE_01CE5D                           ; $01CB54 |
  RTS                                       ; $01CB57 |

  dw $5400, $D400                           ; $01CB58 |

  dw $1000, $1002                           ; $01CB5C |

  TYX                                       ; $01CB60 |
  LDA $CA6F,x                               ; $01CB61 |
  STA $53                                   ; $01CB64 |
  LDA #$7BBE                                ; $01CB66 |
  STA $00                                   ; $01CB69 |
  LDY $CB5C,x                               ; $01CB6B |
  LDA $CB58,x                               ; $01CB6E |
  JMP CODE_01CBCB                           ; $01CB71 |

  dw $4E00, $CE00                           ; $01CB74 |

  dw $0C00, $0C02                           ; $01CB78 |

  SEP #$30                                  ; $01CB7C |
  LDX #$35                                  ; $01CB7E |

CODE_01CB80:
  STZ $0B12,x                               ; $01CB80 |
  DEX                                       ; $01CB83 |
  BPL CODE_01CB80                           ; $01CB84 |
  LDX #$04                                  ; $01CB86 |

CODE_01CB88:
  LDA $CA3D,x                               ; $01CB88 |
  STA $0B42,x                               ; $01CB8B |
  DEX                                       ; $01CB8E |
  BPL CODE_01CB88                           ; $01CB8F |
  REP #$30                                  ; $01CB91 |
  TYX                                       ; $01CB93 |
  LDA #$7BBE                                ; $01CB94 |
  CLC                                       ; $01CB97 |
  ADC $CB5E                                 ; $01CB98 |
  STA $00                                   ; $01CB9B |
  LDY $CB78,x                               ; $01CB9D |
  LDA $CB74,x                               ; $01CBA0 |
  BRA CODE_01CBCB                           ; $01CBA3 |

  dw $2800, $A800                           ; $01CBA5 |

  TYX                                       ; $01CBA9 |
  LDA #$97C4                                ; $01CBAA |
  STA $00                                   ; $01CBAD |
  LDY $CB5C,x                               ; $01CBAF |
  LDA $CBA5,x                               ; $01CBB2 |
  BRA CODE_01CBCB                           ; $01CBB5 |

  dw $3400, $B400                           ; $01CBB7 |

  dw $0800, $0802                           ; $01CBBB |

  TYX                                       ; $01CBBF |
  LDA #$A7C6                                ; $01CBC0 |
  STA $00                                   ; $01CBC3 |
  LDY $CBBB,x                               ; $01CBC5 |
  LDA $CBB7,x                               ; $01CBC8 |

CODE_01CBCB:
  PHB                                       ; $01CBCB |
  PEA $7E48                                 ; $01CBCC |
  PLB                                       ; $01CBCF |
  PLB                                       ; $01CBD0 |
  LDX $4800                                 ; $01CBD1 |
  STA $0000,x                               ; $01CBD4 |
  ASL A                                     ; $01CBD7 |
  LDA #$0080                                ; $01CBD8 |
  STA $0002,x                               ; $01CBDB |
  LDA #$007E                                ; $01CBDE |
  STA $0007,x                               ; $01CBE1 |
  TYA                                       ; $01CBE4 |
  STA $0008,x                               ; $01CBE5 |
  LDA #$3981                                ; $01CBE8 |
  LDY $00                                   ; $01CBEB |
  BCS CODE_01CBF4                           ; $01CBED |
  LDA #$1801                                ; $01CBEF |
  INY                                       ; $01CBF2 |
  INY                                       ; $01CBF3 |

CODE_01CBF4:
  STA $0003,x                               ; $01CBF4 |
  TYA                                       ; $01CBF7 |
  STA $0005,x                               ; $01CBF8 |
  TXA                                       ; $01CBFB |
  CLC                                       ; $01CBFC |
  ADC #$000C                                ; $01CBFD |
  STA $000A,x                               ; $01CC00 |
  STA $4800                                 ; $01CC03 |
  PLB                                       ; $01CC06 |
  JSR CODE_01CE5D                           ; $01CC07 |
  RTS                                       ; $01CC0A |

  TYA                                       ; $01CC0B |
  BEQ CODE_01CC2B                           ; $01CC0C |
  LDX #$E800                                ; $01CC0E |
  LDA #$0056                                ; $01CC11 |
  LDY !r_pause_item_disable                 ; $01CC14 |
  BEQ CODE_01CC1F                           ; $01CC17 |
  LDX #$B000                                ; $01CC19 |
  LDA #$0052                                ; $01CC1C |

CODE_01CC1F:
  STA $01                                   ; $01CC1F |
  LDY #$5400                                ; $01CC21 |
  LDA #$0400                                ; $01CC24 |
  JSL $00BEA6                               ; $01CC27 |

CODE_01CC2B:
  JSR CODE_01CE5D                           ; $01CC2B |
  RTS                                       ; $01CC2E |

  TYA                                       ; $01CC2F |
  BEQ CODE_01CC48                           ; $01CC30 |
  LDA #$004F                                ; $01CC32 |
  JSL decompress_lc_lz1_l                   ; $01CC35 |
  LDX #$0070                                ; $01CC39 |
  STX $01                                   ; $01CC3C |
  LDX #$6800                                ; $01CC3E |
  LDY #$2C00                                ; $01CC41 |
  JSL $00BEA6                               ; $01CC44 |

CODE_01CC48:
  JSR CODE_01CE5D                           ; $01CC48 |
  RTS                                       ; $01CC4B |

  dw $007E, $0000, $007E                    ; $01CC4C |

  dw $AFC8, $095E, $AFC8, $CE83             ; $01CC52 |
  dw $CEB7, $5D20, $BBCE, $58FC             ; $01CC5A |
  dw $B9CC, $CC4C, $0285                    ; $01CC62 |

  LDA $CC52,y                               ; $01CC68 |
  STA $00                                   ; $01CC6B |
  INY                                       ; $01CC6D |
  INY                                       ; $01CC6E |
  LDA $CC4C,y                               ; $01CC6F |
  STA $05                                   ; $01CC72 |
  LDA $CC52,y                               ; $01CC74 |
  STA $03                                   ; $01CC77 |
  LDY #$0000                                ; $01CC79 |
  TYX                                       ; $01CC7C |
  SEP #$20                                  ; $01CC7D |

CODE_01CC7F:
  LDA [$00],y                               ; $01CC7F |
  STA [$03],y                               ; $01CC81 |
  INY                                       ; $01CC83 |
  CPY #$000E                                ; $01CC84 |
  BCC CODE_01CC7F                           ; $01CC87 |
  RTS                                       ; $01CC89 |

  dw $CF07                                  ; $01CC8A |
  dw $CF1F                                  ; $01CC8C |

  JSR CODE_01CE5D                           ; $01CC8E |
  PHB                                       ; $01CC91 |
  SEP #$10                                  ; $01CC92 |
  TYX                                       ; $01CC94 |
  JMP ($CC8A,x)                             ; $01CC95 |
  JSR CODE_01CE5D                           ; $01CC98 |
  SEP #$30                                  ; $01CC9B |
  LDA !r_pause_menu_state                   ; $01CC9D |
  SEC                                       ; $01CCA0 |
  SBC #$0C                                  ; $01CCA1 |
  ASL A                                     ; $01CCA3 |
  ASL A                                     ; $01CCA4 |
  ASL A                                     ; $01CCA5 |
  LDX #$04                                  ; $01CCA6 |

CODE_01CCA8:
  STA $0B36,x                               ; $01CCA8 |
  DEX                                       ; $01CCAB |
  BPL CODE_01CCA8                           ; $01CCAC |
  JMP CODE_01CD56                           ; $01CCAE |
  SEP #$30                                  ; $01CCB1 |
  LDA !r_pause_items                        ; $01CCB3 |
  BEQ CODE_01CCBB                           ; $01CCB6 |
  JSR CODE_01DBD5                           ; $01CCB8 |

CODE_01CCBB:
  LDA !r_cur_item_used                      ; $01CCBB |
  BEQ CODE_01CCC6                           ; $01CCBE |
  LDA $37                                   ; $01CCC0 |
  AND #$80                                  ; $01CCC2 |
  BNE CODE_01CCCC                           ; $01CCC4 |

CODE_01CCC6:
  ORA $38                                   ; $01CCC6 |
  AND #$90                                  ; $01CCC8 |
  BEQ CODE_01CCCF                           ; $01CCCA |

CODE_01CCCC:
  JSR CODE_01CE5D                           ; $01CCCC |

CODE_01CCCF:
  LDX #$04                                  ; $01CCCF |

CODE_01CCD1:
  LDA $0B42,x                               ; $01CCD1 |
  BEQ CODE_01CCE1                           ; $01CCD4 |
  LDA !r_frame_counter_global_dp            ; $01CCD6 |
  AND #$03                                  ; $01CCD8 |
  BNE CODE_01CD50                           ; $01CCDA |
  DEC $0B42,x                               ; $01CCDC |
  BRA CODE_01CD50                           ; $01CCDF |

CODE_01CCE1:
  LDY $0B3C,x                               ; $01CCE1 |
  LDA !r_frame_counter_global_dp            ; $01CCE4 |
  AND #$03                                  ; $01CCE6 |
  BNE CODE_01CCFC                           ; $01CCE8 |
  LDA $0B36,x                               ; $01CCEA |
  CLC                                       ; $01CCED |
  ADC $CA42,y                               ; $01CCEE |
  STA $0B36,x                               ; $01CCF1 |
  CMP $CA4F,y                               ; $01CCF4 |
  BNE CODE_01CCFC                           ; $01CCF7 |
  INC $0B3C,x                               ; $01CCF9 |

CODE_01CCFC:
  CPY #$0B                                  ; $01CCFC |
  BCC CODE_01CD50                           ; $01CCFE |
  LDA $0B1E,x                               ; $01CD00 |
  CMP $CA53,y                               ; $01CD03 |
  BNE CODE_01CD21                           ; $01CD06 |
  CPY #$0B                                  ; $01CD08 |
  BEQ CODE_01CD30                           ; $01CD0A |
  LDA $0B12,x                               ; $01CD0C |
  BNE CODE_01CD30                           ; $01CD0F |
  STZ $0B3C,x                               ; $01CD11 |
  STZ $0B1E,x                               ; $01CD14 |
  STZ $0B2A,x                               ; $01CD17 |
  LDA #$20                                  ; $01CD1A |
  STA $0B42,x                               ; $01CD1C |
  BRA CODE_01CD56                           ; $01CD1F |

CODE_01CD21:
  LDA !r_frame_counter_global_dp            ; $01CD21 |
  LSR A                                     ; $01CD23 |
  BCS CODE_01CD30                           ; $01CD24 |
  LDA $0B1E,x                               ; $01CD26 |
  CLC                                       ; $01CD29 |
  ADC $CA51,y                               ; $01CD2A |
  STA $0B1E,x                               ; $01CD2D |

CODE_01CD30:
  LDA $0B1E,x                               ; $01CD30 |
  TAY                                       ; $01CD33 |
  ASL A                                     ; $01CD34 |
  ASL A                                     ; $01CD35 |
  ASL A                                     ; $01CD36 |
  ASL A                                     ; $01CD37 |
  CLC                                       ; $01CD38 |
  ADC $0B2A,x                               ; $01CD39 |
  STA $0B2A,x                               ; $01CD3C |
  TYA                                       ; $01CD3F |
  PHP                                       ; $01CD40 |
  LSR A                                     ; $01CD41 |
  LSR A                                     ; $01CD42 |
  LSR A                                     ; $01CD43 |
  LSR A                                     ; $01CD44 |
  PLP                                       ; $01CD45 |
  BPL CODE_01CD4A                           ; $01CD46 |
  ORA #$F0                                  ; $01CD48 |

CODE_01CD4A:
  ADC $0B12,x                               ; $01CD4A |
  STA $0B12,x                               ; $01CD4D |

CODE_01CD50:
  DEX                                       ; $01CD50 |
  BMI CODE_01CD56                           ; $01CD51 |
  JMP CODE_01CCD1                           ; $01CD53 |

CODE_01CD56:
  REP #$20                                  ; $01CD56 |
  LDA #$6800                                ; $01CD58 |
  STA !gsu_r1                               ; $01CD5B |
  LDA #$0800                                ; $01CD5E |
  STA !gsu_r12                              ; $01CD61 |
  LDX #$08                                  ; $01CD64 |
  LDA #$D2F1                                ; $01CD66 |
  JSL r_gsu_init_1                          ; $01CD69 | GSU init
  LDX #$04                                  ; $01CD6D |

CODE_01CD6F:
  LDA $CA60,x                               ; $01CD6F |
  AND #$00FF                                ; $01CD72 |
  STA !gsu_r1                               ; $01CD75 |
  LDA $0B12,x                               ; $01CD78 |
  AND #$00FF                                ; $01CD7B |
  STA !gsu_r2                               ; $01CD7E |
  STA !gsu_r3                               ; $01CD81 |
  LDA $CA65,x                               ; $01CD84 |
  AND #$00FF                                ; $01CD87 |
  STA !gsu_r4                               ; $01CD8A |
  LDA $CA6A,x                               ; $01CD8D |
  AND #$00FF                                ; $01CD90 |
  STA !gsu_r5                               ; $01CD93 |
  LDA $0B36,x                               ; $01CD96 |
  AND #$00FF                                ; $01CD99 |
  STA !gsu_r6                               ; $01CD9C |
  PHX                                       ; $01CD9F |
  LDX #$08                                  ; $01CDA0 |
  LDA #$F165                                ; $01CDA2 |
  JSL r_gsu_init_1                          ; $01CDA5 | GSU init
  PLX                                       ; $01CDA9 |
  DEX                                       ; $01CDAA |
  BPL CODE_01CD6F                           ; $01CDAB |
  LDA #$7400                                ; $01CDAD |
  STA !gsu_r1                               ; $01CDB0 |
  LDA #$7100                                ; $01CDB3 |
  STA !gsu_r2                               ; $01CDB6 |
  LDA #$0080                                ; $01CDB9 |
  STA !gsu_r3                               ; $01CDBC |
  LDA #$0001                                ; $01CDBF |
  STA !gsu_r4                               ; $01CDC2 |
  LDX #$08                                  ; $01CDC5 |
  LDA #$D2FB                                ; $01CDC7 |
  JSL r_gsu_init_1                          ; $01CDCA | GSU init
  LDA #$7600                                ; $01CDCE |
  STA !gsu_r1                               ; $01CDD1 |
  LDA #$7300                                ; $01CDD4 |
  STA !gsu_r2                               ; $01CDD7 |
  LDA #$0080                                ; $01CDDA |
  STA !gsu_r3                               ; $01CDDD |
  LDA #$0001                                ; $01CDE0 |
  STA !gsu_r4                               ; $01CDE3 |
  LDX #$08                                  ; $01CDE6 |
  LDA #$D2FB                                ; $01CDE8 |
  JSL r_gsu_init_1                          ; $01CDEB | GSU init
  LDA #$AAAA                                ; $01CDEF |
  STA $006C00                               ; $01CDF2 |
  STA $006C02                               ; $01CDF6 |
  STA $006C04                               ; $01CDFA |
  STA $006C06                               ; $01CDFE |
  SEP #$20                                  ; $01CE02 |
  STZ $00                                   ; $01CE04 |
  LDA #$10                                  ; $01CE06 |
  STA $00                                   ; $01CE08 |
  LDX #$00                                  ; $01CE0A |

CODE_01CE0C:
  LDA $C9ED,x                               ; $01CE0C |
  CLC                                       ; $01CE0F |
  ADC $00                                   ; $01CE10 |
  STA $006A00,x                             ; $01CE12 |
  LDA $C9EE,x                               ; $01CE16 |
  STA $006A01,x                             ; $01CE19 |
  LDA $C9EF,x                               ; $01CE1D |
  STA $006A02,x                             ; $01CE20 |
  LDA $C9F0,x                               ; $01CE24 |
  STA $006A03,x                             ; $01CE27 |
  INX                                       ; $01CE2B |
  INX                                       ; $01CE2C |
  INX                                       ; $01CE2D |
  INX                                       ; $01CE2E |
  CPX #$50                                  ; $01CE2F |
  BCC CODE_01CE0C                           ; $01CE31 |
  RTS                                       ; $01CE33 |

  SEP #$30                                  ; $01CE34 |
  LDA !r_cur_item_used                      ; $01CE36 |
  BEQ CODE_01CE48                           ; $01CE39 |
  INC $0B11                                 ; $01CE3B |
  LDA $0B11                                 ; $01CE3E |
  CMP #$20                                  ; $01CE41 |
  BCC CODE_01CE58                           ; $01CE43 |
  STZ $0B11                                 ; $01CE45 |

CODE_01CE48:
  LDA !r_pause_menu_flag                    ; $01CE48 |\
  EOR #$01                                  ; $01CE4B | | inverts pause flag
  AND #$01                                  ; $01CE4D | |
  STA !r_pause_menu_flag                    ; $01CE4F |/
  JSR CODE_01CE5D                           ; $01CE52 |
  JSR CODE_01CE5D                           ; $01CE55 | 2x speed for unpause transition

CODE_01CE58:
  JMP CODE_01CD56                           ; $01CE58 |

  db $FF, $01                               ; $01CE5B |

CODE_01CE5D:
  PHY                                       ; $01CE5D |
  PHP                                       ; $01CE5E |
  SEP #$20                                  ; $01CE5F |
  LDY !r_pause_menu_flag                    ; $01CE61 |
  LDA !r_pause_menu_state                   ; $01CE64 |
  CLC                                       ; $01CE67 |
  ADC $CE5B,y                               ; $01CE68 | increment or decrement
  STA !r_pause_menu_state                   ; $01CE6B | if unpaused or paused
  BNE CODE_01CE80                           ; $01CE6E |
  LDA !r_cur_item_used                      ; $01CE70 | unpausing finished
  BEQ CODE_01CE80                           ; $01CE73 | check for item being used
  LDA #$27                                  ; $01CE75 |\ play sound #$0027
  JSL push_sound_queue                      ; $01CE77 |/
  LDA #$40                                  ; $01CE7B | 64 frame item use
  STA !r_item_use_counter                   ; $01CE7D | transition

CODE_01CE80:
  PLP                                       ; $01CE80 |
  PLY                                       ; $01CE81 |
  RTS                                       ; $01CE82 |

  LDA $7EAFD7                               ; $01CE83 |
  STA $41                                   ; $01CE87 |
  LDA $7EAFD9                               ; $01CE89 |
  STA $43                                   ; $01CE8D |
  LDA $7EAFDB                               ; $01CE8F |
  STA !r_reg_hdmaen_mirror                  ; $01CE93 |
  LDA $7EAFDD                               ; $01CE96 |
  STA !r_reg_coldata_mirror                 ; $01CE9A |
  SEP #$20                                  ; $01CE9D |
  LDA $7EB6DF                               ; $01CE9F |
  STA !r_interrupt_mode                     ; $01CEA3 |
  LDA $7EB8E0                               ; $01CEA6 |
  STA !r_reg_mosaic_mirror                  ; $01CEAA |
  LDA $7EB8E1                               ; $01CEAD |
  STA !r_reg_cgadsub_mirror                 ; $01CEB1 |
  REP #$20                                  ; $01CEB4 |
  RTS                                       ; $01CEB6 |

  LDA $41                                   ; $01CEB7 |
  STA $7EAFD7                               ; $01CEB9 |
  LDA $43                                   ; $01CEBD |
  STA $7EAFD9                               ; $01CEBF |
  LDA !r_reg_hdmaen_mirror                  ; $01CEC3 |
  STA $7EAFDB                               ; $01CEC6 |
  LDA !r_reg_coldata_mirror                 ; $01CECA |
  STA $7EAFDD                               ; $01CECD |
  SEP #$20                                  ; $01CED1 |
  LDA !r_interrupt_mode                     ; $01CED3 |
  STA $7EB6DF                               ; $01CED6 |
  LDA !r_reg_mosaic_mirror                  ; $01CEDA |
  STA $7EB8E0                               ; $01CEDD |
  STZ !r_reg_mosaic_mirror                  ; $01CEE1 |
  LDA !r_reg_cgadsub_mirror                 ; $01CEE4 |
  STA $7EB8E1                               ; $01CEE7 |
  LDA #$20                                  ; $01CEEB |
  STA !r_reg_cgadsub_mirror                 ; $01CEED |
  REP #$20                                  ; $01CEF0 |
  PHY                                       ; $01CEF2 |
  LDA #$0056                                ; $01CEF3 |
  STA $01                                   ; $01CEF6 |
  LDY #$2800                                ; $01CEF8 |
  LDX #$D000                                ; $01CEFB |
  LDA #$0800                                ; $01CEFE |
  JSL $00BEA6                               ; $01CF01 |
  PLY                                       ; $01CF05 |
  RTS                                       ; $01CF06 |

  LDX #$00                                  ; $01CF07 |

CODE_01CF09:
  LDA $7EB6E0,x                             ; $01CF09 |
  STA !s_cgram_mirror,x                     ; $01CF0D |
  LDA $7EB7E0,x                             ; $01CF11 |
  STA $702100,x                             ; $01CF15 |
  INX                                       ; $01CF19 |
  INX                                       ; $01CF1A |
  BNE CODE_01CF09                           ; $01CF1B |
  PLB                                       ; $01CF1D |
  RTS                                       ; $01CF1E |

  LDA #$0000                                ; $01CF1F |
  STA $41                                   ; $01CF22 |
  STA $43                                   ; $01CF24 |
  STA !r_reg_coldata_mirror                 ; $01CF26 |
  TAX                                       ; $01CF29 |
  STX !r_reg_hdmaen_mirror                  ; $01CF2A |
  LDY #$70                                  ; $01CF2D |
  PHY                                       ; $01CF2F |
  PLB                                       ; $01CF30 |

CODE_01CF31:
  LDA $2000,x                               ; $01CF31 |
  STA $7EB6E0,x                             ; $01CF34 |
  LDA $2100,x                               ; $01CF38 |
  STA $7EB7E0,x                             ; $01CF3B |
  INX                                       ; $01CF3F |
  INX                                       ; $01CF40 |
  BNE CODE_01CF31                           ; $01CF41 |
  LDA #$0000                                ; $01CF43 |
  TAX                                       ; $01CF46 |
  TXY                                       ; $01CF47 |

CODE_01CF48:
  STA $2000,x                               ; $01CF48 |
  STA $2100,x                               ; $01CF4B |
  INX                                       ; $01CF4E |
  INX                                       ; $01CF4F |
  BNE CODE_01CF48                           ; $01CF50 |
  TYX                                       ; $01CF52 |

CODE_01CF53:
  LDA $5FA002,x                             ; $01CF53 |
  STA $2002,x                               ; $01CF57 |
  LDA $5FA022,x                             ; $01CF5A |
  STA $2022,x                               ; $01CF5E |
  LDA $5FA1C8,x                             ; $01CF61 |
  STA $2102,x                               ; $01CF65 |
  LDA $5FA1E6,x                             ; $01CF68 |
  STA $2122,x                               ; $01CF6C |
  LDA $5FA204,x                             ; $01CF6F |
  STA $2142,x                               ; $01CF73 |
  INX                                       ; $01CF76 |
  INX                                       ; $01CF77 |
  CPX #$1E                                  ; $01CF78 |
  BCC CODE_01CF53                           ; $01CF7A |
  LDX #$7E                                  ; $01CF7C |
  PHX                                       ; $01CF7E |
  PLB                                       ; $01CF7F |
  LDX #$00                                  ; $01CF80 |
  LDA #$217F                                ; $01CF82 |

CODE_01CF85:
  STA $AFDF,x                               ; $01CF85 |
  STA $B0DF,x                               ; $01CF88 |
  STA $B1DF,x                               ; $01CF8B |
  STA $B2DF,x                               ; $01CF8E |
  STA $B3DF,x                               ; $01CF91 |
  STA $B4DF,x                               ; $01CF94 |
  STA $B5DF,x                               ; $01CF97 |
  INX                                       ; $01CF9A |
  INX                                       ; $01CF9B |
  BNE CODE_01CF85                           ; $01CF9C |
  LDX #$00                                  ; $01CF9E |
  STX $00                                   ; $01CFA0 |
  TXY                                       ; $01CFA2 |

CODE_01CFA3:
  LDA $00                                   ; $01CFA3 |
  ASL A                                     ; $01CFA5 |
  TAX                                       ; $01CFA6 |
  LDA $01B689,x                             ; $01CFA7 |
  STA $B3E7,y                               ; $01CFAB |
  LDX $00                                   ; $01CFAE |
  CPX #$15                                  ; $01CFB0 |
  BCS CODE_01CFCA                           ; $01CFB2 |
  LDA $01B835,x                             ; $01CFB4 |
  AND #$00FF                                ; $01CFB8 |
  TAX                                       ; $01CFBB |
  LDA $01B85F,x                             ; $01CFBC |
  STA $B42D,y                               ; $01CFC0 |
  LDA $01B8DD,x                             ; $01CFC3 |
  STA $B46D,y                               ; $01CFC7 |

CODE_01CFCA:
  LDX $00                                   ; $01CFCA |
  CPX #$15                                  ; $01CFCC |
  BCS CODE_01CFE6                           ; $01CFCE |
  LDA $01B84A,x                             ; $01CFD0 |
  AND #$00FF                                ; $01CFD4 |
  TAX                                       ; $01CFD7 |
  LDA $01B85F,x                             ; $01CFD8 |
  STA $B4ED,y                               ; $01CFDC |
  LDA $01B8DD,x                             ; $01CFDF |
  STA $B52D,y                               ; $01CFE3 |

CODE_01CFE6:
  INY                                       ; $01CFE6 |
  INY                                       ; $01CFE7 |
  INC $00                                   ; $01CFE8 |
  LDX $00                                   ; $01CFEA |
  CPX #$18                                  ; $01CFEC |
  BCC CODE_01CFA3                           ; $01CFEE |
  JSR CODE_01D035                           ; $01CFF0 |
  JSR CODE_01D0DE                           ; $01CFF3 |
  JSR CODE_01D17A                           ; $01CFF6 |
  JSR CODE_01D203                           ; $01CFF9 |
  JSR CODE_01D275                           ; $01CFFC |
  JSR CODE_01D35B                           ; $01CFFF |
  JSR CODE_01D2E0                           ; $01D002 |
  REP #$10                                  ; $01D005 |
  LDY #$007E                                ; $01D007 |
  STY $01                                   ; $01D00A |
  LDY #$3400                                ; $01D00C |
  LDX #$AFDF                                ; $01D00F |
  LDA #$0700                                ; $01D012 |
  JSL $00BEA6                               ; $01D015 |
  SEP #$10                                  ; $01D019 |
  PLB                                       ; $01D01B |
  LDX #$09                                  ; $01D01C |
  STX !r_reg_bgmode_mirror                  ; $01D01E |
  LDX #$34                                  ; $01D021 |
  STX !r_reg_bg3sc_mirror                   ; $01D023 |
  LDX #$02                                  ; $01D026 |
  STX !r_reg_bg34nba_mirror                 ; $01D028 |
  STX !r_interrupt_mode                     ; $01D02B |
  LDA #$0014                                ; $01D02E |
  STA !r_reg_tm_mirror                      ; $01D031 |
  RTS                                       ; $01D034 |

CODE_01D035:
  STZ $18                                   ; $01D035 |
  LDY #$00                                  ; $01D037 |
  STZ $00                                   ; $01D039 |
  LDA $0003B6                               ; $01D03B |
  BEQ CODE_01D05D                           ; $01D03F |

CODE_01D041:
  CMP #$000A                                ; $01D041 |
  BCC CODE_01D04E                           ; $01D044 |
  SEC                                       ; $01D046 |
  SBC #$000A                                ; $01D047 |
  INC $00                                   ; $01D04A |
  BRA CODE_01D041                           ; $01D04C |

CODE_01D04E:
  LDA $00                                   ; $01D04E |
  CMP #$001E                                ; $01D050 |
  BCC CODE_01D05D                           ; $01D053 |
  LDA #$0400                                ; $01D055 |
  STA $18                                   ; $01D058 |
  LDA #$001E                                ; $01D05A |

CODE_01D05D:
  STA $00                                   ; $01D05D |

CODE_01D05F:
  CMP #$000A                                ; $01D05F |
  BCC CODE_01D06A                           ; $01D062 |
  SBC #$000A                                ; $01D064 |
  INY                                       ; $01D067 |
  BRA CODE_01D05F                           ; $01D068 |

CODE_01D06A:
  ASL A                                     ; $01D06A |
  TAX                                       ; $01D06B |
  PHX                                       ; $01D06C |
  PHY                                       ; $01D06D |
  LDX #$00                                  ; $01D06E |
  TXY                                       ; $01D070 |

CODE_01D071:
  PHX                                       ; $01D071 |
  LDA $01B7ED,x                             ; $01D072 |
  AND #$00FF                                ; $01D076 |
  TAX                                       ; $01D079 |
  LDA $01B85F,x                             ; $01D07A |
  ORA $18                                   ; $01D07E |
  STA $B1A7,y                               ; $01D080 |
  LDA $01B8DD,x                             ; $01D083 |
  ORA $18                                   ; $01D087 |
  STA $B1E7,y                               ; $01D089 |
  PLX                                       ; $01D08C |
  INY                                       ; $01D08D |
  INY                                       ; $01D08E |
  INX                                       ; $01D08F |
  CPX #$18                                  ; $01D090 |
  BCC CODE_01D071                           ; $01D092 |
  PLY                                       ; $01D094 |
  PLX                                       ; $01D095 |
  LDA $00                                   ; $01D096 |
  PHA                                       ; $01D098 |
  REP #$10                                  ; $01D099 |
  PHX                                       ; $01D09B |
  PHY                                       ; $01D09C |
  SEP #$10                                  ; $01D09D |
  LDA #$B1C1                                ; $01D09F |
  STA $10                                   ; $01D0A2 |
  LDA #$B1CF                                ; $01D0A4 |
  STA $12                                   ; $01D0A7 |
  LDA #$B201                                ; $01D0A9 |
  STA $14                                   ; $01D0AC |
  LDA #$B20F                                ; $01D0AE |
  STA $16                                   ; $01D0B1 |
  JSR CODE_01D45E                           ; $01D0B3 |
  REP #$10                                  ; $01D0B6 |
  PLA                                       ; $01D0B8 |
  AND #$00FF                                ; $01D0B9 |
  TAX                                       ; $01D0BC |
  PLA                                       ; $01D0BD |
  AND #$00FF                                ; $01D0BE |
  STA $00                                   ; $01D0C1 |
  LDA $18                                   ; $01D0C3 |
  STA $02                                   ; $01D0C5 |
  LDA #$007E                                ; $01D0C7 |
  STA $15                                   ; $01D0CA |
  LDA #$B215                                ; $01D0CC |
  STA $13                                   ; $01D0CF |
  PHB                                       ; $01D0D1 |
  PHK                                       ; $01D0D2 |
  PLB                                       ; $01D0D3 |
  JSR CODE_01BCAA                           ; $01D0D4 |
  PLB                                       ; $01D0D7 |
  SEP #$10                                  ; $01D0D8 |
  PLA                                       ; $01D0DA |
  STA $00                                   ; $01D0DB |
  RTS                                       ; $01D0DD |

CODE_01D0DE:
  STZ $18                                   ; $01D0DE |
  LDY #$00                                  ; $01D0E0 |
  LDA $0003B4                               ; $01D0E2 |
  CMP #$0014                                ; $01D0E6 |
  BCC CODE_01D0F3                           ; $01D0E9 |
  LDA #$0400                                ; $01D0EB |
  STA $18                                   ; $01D0EE |
  LDA #$0014                                ; $01D0F0 |

CODE_01D0F3:
  STA $02                                   ; $01D0F3 |

CODE_01D0F5:
  CMP #$000A                                ; $01D0F5 |
  BCC CODE_01D100                           ; $01D0F8 |
  SBC #$000A                                ; $01D0FA |
  INY                                       ; $01D0FD |
  BRA CODE_01D0F5                           ; $01D0FE |

CODE_01D100:
  ASL A                                     ; $01D100 |
  TAX                                       ; $01D101 |
  PHX                                       ; $01D102 |
  PHY                                       ; $01D103 |
  LDX #$00                                  ; $01D104 |
  TXY                                       ; $01D106 |

CODE_01D107:
  PHX                                       ; $01D107 |
  LDA $01B805,x                             ; $01D108 |
  AND #$00FF                                ; $01D10C |
  TAX                                       ; $01D10F |
  LDA $01B85F,x                             ; $01D110 |
  ORA $18                                   ; $01D114 |
  STA $B267,y                               ; $01D116 |
  LDA $01B8DD,x                             ; $01D119 |
  ORA $18                                   ; $01D11D |
  STA $B2A7,y                               ; $01D11F |
  PLX                                       ; $01D122 |
  INY                                       ; $01D123 |
  INY                                       ; $01D124 |
  INX                                       ; $01D125 |
  CPX #$18                                  ; $01D126 |
  BCC CODE_01D107                           ; $01D128 |
  PLY                                       ; $01D12A |
  PLX                                       ; $01D12B |
  LDA $00                                   ; $01D12C |
  PHA                                       ; $01D12E |
  LDA $02                                   ; $01D12F |
  PHA                                       ; $01D131 |
  REP #$10                                  ; $01D132 |
  PHX                                       ; $01D134 |
  PHY                                       ; $01D135 |
  SEP #$10                                  ; $01D136 |
  LDA #$B281                                ; $01D138 |
  STA $10                                   ; $01D13B |
  LDA #$B28F                                ; $01D13D |
  STA $12                                   ; $01D140 |
  LDA #$B2C1                                ; $01D142 |
  STA $14                                   ; $01D145 |
  LDA #$B2CF                                ; $01D147 |
  STA $16                                   ; $01D14A |
  JSR CODE_01D45E                           ; $01D14C |
  REP #$10                                  ; $01D14F |
  PLA                                       ; $01D151 |
  AND #$00FF                                ; $01D152 |
  TAX                                       ; $01D155 |
  PLA                                       ; $01D156 |
  AND #$00FF                                ; $01D157 |
  STA $00                                   ; $01D15A |
  LDA $18                                   ; $01D15C |
  STA $02                                   ; $01D15E |
  LDA #$007E                                ; $01D160 |
  STA $15                                   ; $01D163 |
  LDA #$B2D5                                ; $01D165 |
  STA $13                                   ; $01D168 |
  PHB                                       ; $01D16A |
  PHK                                       ; $01D16B |
  PLB                                       ; $01D16C |
  JSR CODE_01BCAA                           ; $01D16D |
  PLB                                       ; $01D170 |
  SEP #$10                                  ; $01D171 |
  PLA                                       ; $01D173 |
  STA $02                                   ; $01D174 |
  PLA                                       ; $01D176 |
  STA $00                                   ; $01D177 |
  RTS                                       ; $01D179 |

CODE_01D17A:
  STZ $18                                   ; $01D17A |
  LDA $0003B8                               ; $01D17C |
  ASL A                                     ; $01D180 |
  TAX                                       ; $01D181 |
  CPX #$0A                                  ; $01D182 |
  BCC CODE_01D18B                           ; $01D184 |
  LDA #$0400                                ; $01D186 |
  STA $18                                   ; $01D189 |

CODE_01D18B:
  PHX                                       ; $01D18B |
  LDX #$00                                  ; $01D18C |
  TXY                                       ; $01D18E |

CODE_01D18F:
  PHX                                       ; $01D18F |
  LDA $01B81D,x                             ; $01D190 |
  AND #$00FF                                ; $01D194 |
  TAX                                       ; $01D197 |
  LDA $01B85F,x                             ; $01D198 |
  ORA $18                                   ; $01D19C |
  STA $B327,y                               ; $01D19E |
  LDA $01B8DD,x                             ; $01D1A1 |
  ORA $18                                   ; $01D1A5 |
  STA $B367,y                               ; $01D1A7 |
  PLX                                       ; $01D1AA |
  INY                                       ; $01D1AB |
  INY                                       ; $01D1AC |
  INX                                       ; $01D1AD |
  CPX #$18                                  ; $01D1AE |
  BCC CODE_01D18F                           ; $01D1B0 |
  PLX                                       ; $01D1B2 |
  LDA $00                                   ; $01D1B3 |
  PHA                                       ; $01D1B5 |
  LDA $02                                   ; $01D1B6 |
  PHA                                       ; $01D1B8 |
  REP #$10                                  ; $01D1B9 |
  PHX                                       ; $01D1BB |
  SEP #$10                                  ; $01D1BC |
  LDA $01B8AF,x                             ; $01D1BE |
  ORA $18                                   ; $01D1C2 |
  STA $B345                                 ; $01D1C4 |
  TXY                                       ; $01D1C7 |
  BEQ CODE_01D1CD                           ; $01D1C8 |
  STA $B34F                                 ; $01D1CA |

CODE_01D1CD:
  LDA $01B92D,x                             ; $01D1CD |
  ORA $18                                   ; $01D1D1 |
  STA $B385                                 ; $01D1D3 |
  TXY                                       ; $01D1D6 |
  BEQ CODE_01D1DC                           ; $01D1D7 |
  STA $B38F                                 ; $01D1D9 |

CODE_01D1DC:
  REP #$10                                  ; $01D1DC |
  PLA                                       ; $01D1DE |
  AND #$00FF                                ; $01D1DF |
  TAX                                       ; $01D1E2 |
  STX $00                                   ; $01D1E3 |
  LDA $18                                   ; $01D1E5 |
  STA $02                                   ; $01D1E7 |
  LDA #$007E                                ; $01D1E9 |
  STA $15                                   ; $01D1EC |
  LDA #$B395                                ; $01D1EE |
  STA $13                                   ; $01D1F1 |
  PHB                                       ; $01D1F3 |
  PHK                                       ; $01D1F4 |
  PLB                                       ; $01D1F5 |
  JSR CODE_01BCAA                           ; $01D1F6 |
  PLB                                       ; $01D1F9 |
  SEP #$10                                  ; $01D1FA |
  PLA                                       ; $01D1FC |
  STA $02                                   ; $01D1FD |
  PLA                                       ; $01D1FF |
  STA $00                                   ; $01D200 |
  RTS                                       ; $01D202 |

CODE_01D203:
  STZ $18                                   ; $01D203 |
  LDY #$00                                  ; $01D205 |
  LDA $0003B8                               ; $01D207 |
  ASL A                                     ; $01D20B |
  STA $0E                                   ; $01D20C |
  ASL A                                     ; $01D20E |
  ASL A                                     ; $01D20F |
  ADC $0E                                   ; $01D210 |
  CLC                                       ; $01D212 |
  ADC $00                                   ; $01D213 |
  CLC                                       ; $01D215 |
  ADC $02                                   ; $01D216 |
  STA $00                                   ; $01D218 |
  CMP #$0064                                ; $01D21A |
  BCC CODE_01D226                           ; $01D21D |
  LDA #$000A                                ; $01D21F |
  TAY                                       ; $01D222 |
  INY                                       ; $01D223 |
  BRA CODE_01D231                           ; $01D224 |

CODE_01D226:
  CMP #$000A                                ; $01D226 |
  BCC CODE_01D231                           ; $01D229 |
  SBC #$000A                                ; $01D22B |
  INY                                       ; $01D22E |
  BRA CODE_01D226                           ; $01D22F |

CODE_01D231:
  ASL A                                     ; $01D231 |
  TAX                                       ; $01D232 |
  LDA $00                                   ; $01D233 |
  PHA                                       ; $01D235 |
  REP #$10                                  ; $01D236 |
  PHX                                       ; $01D238 |
  PHY                                       ; $01D239 |
  SEP #$10                                  ; $01D23A |
  LDA #$B44F                                ; $01D23C |
  STA $10                                   ; $01D23F |
  STA $12                                   ; $01D241 |
  LDA #$B48F                                ; $01D243 |
  STA $14                                   ; $01D246 |
  STA $16                                   ; $01D248 |
  JSR CODE_01D45E                           ; $01D24A |
  REP #$10                                  ; $01D24D |
  PLA                                       ; $01D24F |
  AND #$00FF                                ; $01D250 |
  TAX                                       ; $01D253 |
  PLA                                       ; $01D254 |
  AND #$00FF                                ; $01D255 |
  STA $00                                   ; $01D258 |
  LDA $18                                   ; $01D25A |
  STA $02                                   ; $01D25C |
  LDA #$007E                                ; $01D25E |
  STA $15                                   ; $01D261 |
  LDA #$B495                                ; $01D263 |
  STA $13                                   ; $01D266 |
  PHB                                       ; $01D268 |
  PHK                                       ; $01D269 |
  PLB                                       ; $01D26A |
  JSR CODE_01BCAA                           ; $01D26B |
  PLB                                       ; $01D26E |
  SEP #$10                                  ; $01D26F |
  PLA                                       ; $01D271 |
  STA $00                                   ; $01D272 |
  RTS                                       ; $01D274 |

CODE_01D275:
  LDY #$00                                  ; $01D275 |
  LDA $00021A                               ; $01D277 |
  TAX                                       ; $01D27B |
  LDA $0002B8,x                             ; $01D27C |
  AND #$00FF                                ; $01D280 |
  CMP $00                                   ; $01D283 |
  BCS CODE_01D289                           ; $01D285 |
  LDA $00                                   ; $01D287 |

CODE_01D289:
  CMP #$0064                                ; $01D289 |
  BCC CODE_01D295                           ; $01D28C |
  LDA #$000A                                ; $01D28E |
  TAY                                       ; $01D291 |
  INY                                       ; $01D292 |
  BRA CODE_01D2A0                           ; $01D293 |

CODE_01D295:
  CMP #$000A                                ; $01D295 |
  BCC CODE_01D2A0                           ; $01D298 |
  SBC #$000A                                ; $01D29A |
  INY                                       ; $01D29D |
  BRA CODE_01D295                           ; $01D29E |

CODE_01D2A0:
  ASL A                                     ; $01D2A0 |
  TAX                                       ; $01D2A1 |
  REP #$10                                  ; $01D2A2 |
  PHX                                       ; $01D2A4 |
  PHY                                       ; $01D2A5 |
  SEP #$10                                  ; $01D2A6 |
  LDA #$B50F                                ; $01D2A8 |
  STA $10                                   ; $01D2AB |
  STA $12                                   ; $01D2AD |
  LDA #$B54F                                ; $01D2AF |
  STA $14                                   ; $01D2B2 |
  STA $16                                   ; $01D2B4 |
  STZ $18                                   ; $01D2B6 |
  JSR CODE_01D45E                           ; $01D2B8 |
  REP #$10                                  ; $01D2BB |
  PLA                                       ; $01D2BD |
  AND #$00FF                                ; $01D2BE |
  TAX                                       ; $01D2C1 |
  PLA                                       ; $01D2C2 |
  AND #$00FF                                ; $01D2C3 |
  STA $00                                   ; $01D2C6 |
  LDA $18                                   ; $01D2C8 |
  STA $02                                   ; $01D2CA |
  LDA #$007E                                ; $01D2CC |
  STA $15                                   ; $01D2CF |
  LDA #$B555                                ; $01D2D1 |
  STA $13                                   ; $01D2D4 |
  PHB                                       ; $01D2D6 |
  PHK                                       ; $01D2D7 |
  PLB                                       ; $01D2D8 |
  JSR CODE_01BCAA                           ; $01D2D9 |
  PLB                                       ; $01D2DC |
  SEP #$10                                  ; $01D2DD |
  RTS                                       ; $01D2DF |

CODE_01D2E0:
  PHB                                       ; $01D2E0 |
  PHK                                       ; $01D2E1 |
  PLB                                       ; $01D2E2 |
  STZ $0CF6                                 ; $01D2E3 |
  STZ $0CF7                                 ; $01D2E6 |
  SEP #$20                                  ; $01D2E9 |
  LDX #$00                                  ; $01D2EB |
  TXY                                       ; $01D2ED |

CODE_01D2EE:
  LDA !r_pause_items,x                      ; $01D2EE |
  AND #$0F                                  ; $01D2F1 |
  BEQ CODE_01D2F9                           ; $01D2F3 |
  STA !r_pause_items,y                      ; $01D2F5 |
  INY                                       ; $01D2F8 |

CODE_01D2F9:
  INX                                       ; $01D2F9 |
  CPX #$1B                                  ; $01D2FA |
  BCC CODE_01D2EE                           ; $01D2FC |
  TYX                                       ; $01D2FE |

CODE_01D2FF:
  CPX #$1B                                  ; $01D2FF |
  BCS CODE_01D309                           ; $01D301 |
  STZ !r_pause_items,x                      ; $01D303 |
  INX                                       ; $01D306 |
  BRA CODE_01D2FF                           ; $01D307 |

CODE_01D309:
  LDA !r_pause_items                        ; $01D309 |
  BEQ CODE_01D32F                           ; $01D30C |
  LDY #$00                                  ; $01D30E |
  LDA $0CF4                                 ; $01D310 |
  BNE CODE_01D31B                           ; $01D313 |
  STZ $0CF5                                 ; $01D315 |
  INC $0CF4                                 ; $01D318 |

CODE_01D31B:
  LDX $0CF5                                 ; $01D31B |

CODE_01D31E:
  LDA !r_pause_items,x                      ; $01D31E |
  STA $0CF6,y                               ; $01D321 |
  INX                                       ; $01D324 |
  INY                                       ; $01D325 |
  CPY #$03                                  ; $01D326 |
  BCC CODE_01D31E                           ; $01D328 |
  REP #$20                                  ; $01D32A |
  JSR CODE_01DDB0                           ; $01D32C |

CODE_01D32F:
  REP #$20                                  ; $01D32F |
  PLB                                       ; $01D331 |
  RTS                                       ; $01D332 |

  dw $1DA8, $1D80, $1D82, $1D84             ; $01D333 |
  dw $1D86, $1D88, $1DA0, $1DA2             ; $01D33B |
  dw $1DA4, $1DA6                           ; $01D343 |

  dw $1DB8, $1D90, $1D92, $1D94             ; $01D347 |
  dw $1D96, $1D98, $1DB0, $1DB2             ; $01D34F |
  dw $1DB4, $1DB6                           ; $01D357 |

CODE_01D35B:
  LDX #$00                                  ; $01D35B |

CODE_01D35D:
  LDA #$9D8B                                ; $01D35D |
  STA $B59F,x                               ; $01D360 |
  LDA #$1D8B                                ; $01D363 |
  STA $B65F,x                               ; $01D366 |
  LDA #$09AF                                ; $01D369 |
  STA $B5DF,x                               ; $01D36C |
  STA $B61F,x                               ; $01D36F |
  INX                                       ; $01D372 |
  INX                                       ; $01D373 |
  CPX #$40                                  ; $01D374 |
  BCC CODE_01D35D                           ; $01D376 |
  LDA #$098C                                ; $01D378 |
  STA $B5E1                                 ; $01D37B |
  INC A                                     ; $01D37E |
  STA $B5E3                                 ; $01D37F |
  INC A                                     ; $01D382 |
  STA $B621                                 ; $01D383 |
  INC A                                     ; $01D386 |
  STA $B623                                 ; $01D387 |
  LDX #$00                                  ; $01D38A |
  TXY                                       ; $01D38C |
  LDA $000379                               ; $01D38D |

CODE_01D391:
  CMP #$0064                                ; $01D391 |
  BCC CODE_01D39C                           ; $01D394 |
  SBC #$0064                                ; $01D396 |
  INY                                       ; $01D399 |
  BRA CODE_01D391                           ; $01D39A |

CODE_01D39C:
  CMP #$000A                                ; $01D39C |
  BCC CODE_01D3A7                           ; $01D39F |
  SBC #$000A                                ; $01D3A1 |
  INX                                       ; $01D3A4 |
  BRA CODE_01D39C                           ; $01D3A5 |

CODE_01D3A7:
  CPY #$00                                  ; $01D3A7 |
  BNE CODE_01D3B9                           ; $01D3A9 |
  TXY                                       ; $01D3AB |
  TAX                                       ; $01D3AC |
  LDA #$000A                                ; $01D3AD |
  CPY #$00                                  ; $01D3B0 |
  BNE CODE_01D3B9                           ; $01D3B2 |
  TXY                                       ; $01D3B4 |
  TAX                                       ; $01D3B5 |
  LDA #$000A                                ; $01D3B6 |

CODE_01D3B9:
  ORA #$0DC0                                ; $01D3B9 |
  STA $B629                                 ; $01D3BC |
  TXA                                       ; $01D3BF |
  ORA #$0DC0                                ; $01D3C0 |
  STA $B627                                 ; $01D3C3 |
  TYA                                       ; $01D3C6 |
  ORA #$0DC0                                ; $01D3C7 |
  STA $B625                                 ; $01D3CA |
  LDA #$0DD2                                ; $01D3CD |
  STA $B5EB                                 ; $01D3D0 |
  INC A                                     ; $01D3D3 |
  STA $B5ED                                 ; $01D3D4 |
  INC A                                     ; $01D3D7 |
  STA $B62B                                 ; $01D3D8 |
  INC A                                     ; $01D3DB |
  STA $B62D                                 ; $01D3DC |
  LDX #$00                                  ; $01D3DF |
  LDA $00037B                               ; $01D3E1 |

CODE_01D3E5:
  CMP #$000A                                ; $01D3E5 |
  BCC CODE_01D3F0                           ; $01D3E8 |
  SBC #$000A                                ; $01D3EA |
  INX                                       ; $01D3ED |
  BRA CODE_01D3E5                           ; $01D3EE |

CODE_01D3F0:
  CPX #$00                                  ; $01D3F0 |
  BNE CODE_01D3F8                           ; $01D3F2 |
  TAX                                       ; $01D3F4 |
  LDA #$000A                                ; $01D3F5 |

CODE_01D3F8:
  ORA #$0DC0                                ; $01D3F8 |
  STA $B631                                 ; $01D3FB |
  TXA                                       ; $01D3FE |
  ORA #$0DC0                                ; $01D3FF |
  STA $B62F                                 ; $01D402 |
  LDA #$0DCB                                ; $01D405 |
  STA $B5F5                                 ; $01D408 |
  INC A                                     ; $01D40B |
  STA $B5F7                                 ; $01D40C |
  INC A                                     ; $01D40F |
  STA $B635                                 ; $01D410 |
  INC A                                     ; $01D413 |
  STA $B637                                 ; $01D414 |
  LDA $0003A1                               ; $01D417 |
  ASL A                                     ; $01D41B |
  TAX                                       ; $01D41C |
  LDA $01D333,x                             ; $01D41D |
  STA $B5F9                                 ; $01D421 |
  INC A                                     ; $01D424 |
  STA $B5FB                                 ; $01D425 |
  LDA $01D347,x                             ; $01D428 |
  STA $B639                                 ; $01D42C |
  INC A                                     ; $01D42F |
  STA $B63B                                 ; $01D430 |
  LDA $0003A3                               ; $01D433 |
  ASL A                                     ; $01D437 |
  TAX                                       ; $01D438 |
  LDA $01D333,x                             ; $01D439 |
  STA $B5FD                                 ; $01D43D |
  INC A                                     ; $01D440 |
  STA $B5FF                                 ; $01D441 |
  LDA $01D347,x                             ; $01D444 |
  STA $B63D                                 ; $01D448 |
  INC A                                     ; $01D44B |
  STA $B63F                                 ; $01D44C |
  JSR CODE_01D490                           ; $01D44F |
  SEP #$20                                  ; $01D452 |
  PHB                                       ; $01D454 |
  PHK                                       ; $01D455 |
  PLB                                       ; $01D456 |
  JSR CODE_01DCE0                           ; $01D457 |
  PLB                                       ; $01D45A |
  REP #$20                                  ; $01D45B |
  RTS                                       ; $01D45D |

CODE_01D45E:
  PHY                                       ; $01D45E |
  LDY #$02                                  ; $01D45F |
  LDA $01B8AF,x                             ; $01D461 |
  ORA $18                                   ; $01D465 |
  STA ($10),y                               ; $01D467 |
  STA ($12),y                               ; $01D469 |
  LDA $01B92D,x                             ; $01D46B |
  ORA $18                                   ; $01D46F |
  STA ($14),y                               ; $01D471 |
  STA ($16),y                               ; $01D473 |
  PLY                                       ; $01D475 |
  BEQ CODE_01D48F                           ; $01D476 |
  TYA                                       ; $01D478 |
  ASL A                                     ; $01D479 |
  TAX                                       ; $01D47A |
  LDA $01B8AF,x                             ; $01D47B |
  ORA $18                                   ; $01D47F |
  STA ($10)                                 ; $01D481 |
  STA ($12)                                 ; $01D483 |
  LDA $01B92D,x                             ; $01D485 |
  ORA $18                                   ; $01D489 |
  STA ($14)                                 ; $01D48B |
  STA ($16)                                 ; $01D48D |

CODE_01D48F:
  RTS                                       ; $01D48F |

CODE_01D490:
  LDA #$1DAC                                ; $01D490 |
  STA $B5C7                                 ; $01D493 |
  LDA #$1D9C                                ; $01D496 |
  STA $B607                                 ; $01D499 |
  STA $B647                                 ; $01D49C |
  LDA #$9DAC                                ; $01D49F |
  STA $B687                                 ; $01D4A2 |
  LDA #$1DAD                                ; $01D4A5 |
  STA $B5C9                                 ; $01D4A8 |
  STA $B5CF                                 ; $01D4AB |
  STA $B5D5                                 ; $01D4AE |
  LDA #$5DAD                                ; $01D4B1 |
  STA $B5CB                                 ; $01D4B4 |
  STA $B5D1                                 ; $01D4B7 |
  STA $B5D7                                 ; $01D4BA |
  LDA #$9DAD                                ; $01D4BD |
  STA $B689                                 ; $01D4C0 |
  STA $B68F                                 ; $01D4C3 |
  STA $B695                                 ; $01D4C6 |
  LDA #$DDAD                                ; $01D4C9 |
  STA $B68B                                 ; $01D4CC |
  STA $B691                                 ; $01D4CF |
  STA $B697                                 ; $01D4D2 |
  LDA #$1DAE                                ; $01D4D5 |
  STA $B5CD                                 ; $01D4D8 |
  STA $B5D3                                 ; $01D4DB |
  LDA #$9DAE                                ; $01D4DE |
  STA $B68D                                 ; $01D4E1 |
  STA $B693                                 ; $01D4E4 |
  LDA #$1D9E                                ; $01D4E7 |
  STA $B60D                                 ; $01D4EA |
  STA $B613                                 ; $01D4ED |
  STA $B64D                                 ; $01D4F0 |
  STA $B653                                 ; $01D4F3 |
  LDA #$5DAC                                ; $01D4F6 |
  STA $B5D9                                 ; $01D4F9 |
  LDA #$5D9C                                ; $01D4FC |
  STA $B619                                 ; $01D4FF |
  STA $B659                                 ; $01D502 |
  LDA #$DDAC                                ; $01D505 |
  STA $B699                                 ; $01D508 |
  LDA #$117F                                ; $01D50B |
  STA $B609                                 ; $01D50E |
  STA $B649                                 ; $01D511 |
  STA $B60B                                 ; $01D514 |
  STA $B64B                                 ; $01D517 |
  STA $B60F                                 ; $01D51A |
  STA $B64F                                 ; $01D51D |
  STA $B611                                 ; $01D520 |
  STA $B651                                 ; $01D523 |
  STA $B615                                 ; $01D526 |
  STA $B655                                 ; $01D529 |
  STA $B617                                 ; $01D52C |
  STA $B657                                 ; $01D52F |
  RTS                                       ; $01D532 |

CODE_01D533:
  PHB                                       ; $01D533 |
  PEA $7E48                                 ; $01D534 |
  PLB                                       ; $01D537 |
  PLB                                       ; $01D538 |
  LDX $4800                                 ; $01D539 |
  STA $0000,x                               ; $01D53C |
  ASL A                                     ; $01D53F |
  LDA #$0080                                ; $01D540 |
  STA $0002,x                               ; $01D543 |
  LDA #$007E                                ; $01D546 |
  STA $0007,x                               ; $01D549 |
  TYA                                       ; $01D54C |
  STA $0008,x                               ; $01D54D |
  LDA #$3981                                ; $01D550 |
  LDY #$BE                                  ; $01D553 |
  TDC                                       ; $01D555 |
  BCS CODE_01D55D                           ; $01D556 |
  LDA #$1801                                ; $01D558 |
  INY                                       ; $01D55B |
  INY                                       ; $01D55C |

CODE_01D55D:
  STA $0003,x                               ; $01D55D |
  TYA                                       ; $01D560 |
  STA $0005,x                               ; $01D561 |
  TXA                                       ; $01D564 |
  CLC                                       ; $01D565 |
  ADC #$000C                                ; $01D566 |
  STA $000A,x                               ; $01D569 |
  STA $4800                                 ; $01D56C |
  SEP #$30                                  ; $01D56F |
  PLB                                       ; $01D571 |
  RTS                                       ; $01D572 |

; BG gradient pointer table
; Table starts at $10 for BG color header
; Word 1: Bank
; Word 2: Address
bg_gradient_ptrs:
  dw $005F, $D64C                           ; $01D573 | header $10
  dw $005F, $D67C                           ; $01D577 | header $11
  dw $005F, $D6AC                           ; $01D57B | header $12
  dw $005F, $D6DC                           ; $01D57F | header $13
  dw $005F, $D70C                           ; $01D583 | header $14
  dw $005F, $D73C                           ; $01D587 | header $15
  dw $005F, $D76C                           ; $01D58B | header $16
  dw $005F, $D79C                           ; $01D58F | header $17
  dw $005F, $D7CC                           ; $01D593 | header $18
  dw $005F, $D7FC                           ; $01D597 | header $19
  dw $005F, $D82C                           ; $01D59B | header $1A
  dw $005F, $D85C                           ; $01D59F | header $1B
  dw $005F, $D88C                           ; $01D5A3 | header $1C
  dw $005F, $D8BC                           ; $01D5A7 | header $1D
  dw $005F, $D8EC                           ; $01D5AB | header $1E
  dw $005F, $D91C                           ; $01D5AF | header $1F

; TODO: document
; Inits HDMA channels and draws the BG color gradients
hdma_and_gradient_init:
  PHB                                       ; $01D5B3 |
  PHK                                       ; $01D5B4 |
  PLB                                       ; $01D5B5 |
  LDX #$04                                  ; $01D5B6 |

; Init 5 first bytes of each HDMA channel
.init_hdma_channels
  LDA hdma_channel_6_init,x                 ; $01D5B8 |
  STA $4360,x                               ; $01D5BB | HDMA CH6:
  LDA hdma_channel_7_init,x                 ; $01D5BE |
  STA $4370,x                               ; $01D5C1 | HDMA CH7:
  LDA hdma_channel_5_init,x                 ; $01D5C4 |
  STA $4350,x                               ; $01D5C7 | HDMA CH5: 
  LDA hdma_channel_4_init,x                 ; $01D5CA |
  STA $4340,x                               ; $01D5CD | HDMA CH4:
  LDA hdma_channel_3_init,x                 ; $01D5D0 |
  STA $4330,x                               ; $01D5D3 | HDMA CH3:
  LDA hdma_channel_2_init,x                 ; $01D5D6 |
  STA $4320,x                               ; $01D5D9 | HDMA CH2:
  LDA hdma_channel_1_init,x                 ; $01D5DC |
  STA $4310,x                               ; $01D5DF | HDMA CH1:
  DEX                                       ; $01D5E2 |
  BPL .init_hdma_channels                   ; $01D5E3 |
  LDA #$7E                                  ; $01D5E5 |\
  STA $4367                                 ; $01D5E7 | |
  STA $4377                                 ; $01D5EA | | Set Bank $7E
  STA $4357                                 ; $01D5ED | | for HDMA Channels 3-7
  STA $4347                                 ; $01D5F0 | |
  STA $4337                                 ; $01D5F3 |/
  LDA #$7F                                  ; $01D5F6 |\
  STA $4327                                 ; $01D5F8 | | Set Bank $7F
  STA $4317                                 ; $01D5FB |/  for Channels 1-2
  LDX #$06                                  ; $01D5FE |\

.prepare_tables
  LDA hdma_indirect_table_1,x               ; $01D600 | | Setup HDMA indirect tables
  STA $7E5B18,x                             ; $01D603 | | two entries per table
  LDA hdma_indirect_table_2,x               ; $01D607 | | one pointer for each half screen
  STA $7E5B98,x                             ; $01D60A | |
  LDA hdma_indirect_table_3,x               ; $01D60E | |
  STA $7E5C18,x                             ; $01D611 | |
  LDA hdma_indirect_table_4,x               ; $01D615 | |
  STA $7E5C98,x                             ; $01D618 | |
  LDA hdma_indirect_table_5,x               ; $01D61C | |
  STA $7E5D18,x                             ; $01D61F | |
  DEX                                       ; $01D623 | |
  BPL .prepare_tables                       ; $01D624 |/
  LDX #$00                                  ; $01D626 |\  [HDMA channel enable]
  LDA !r_header_bg_color                    ; $01D628 | | If header < $10 then skip drawing
  CMP #$10                                  ; $01D62B | | and disable BG color HDMA
  BCC .ret                                  ; $01D62D |/
  ASL A                                     ; $01D62F |\
  ASL A                                     ; $01D630 | |
  TAY                                       ; $01D631 | |
  REP #$20                                  ; $01D632 | |  -$40 from table because the 
  LDA bg_gradient_ptrs-$40,y                ; $01D634 | |  10 first entries has no gradient
  STA !gsu_r0                               ; $01D637 | |  and therefore no table entries
  LDA bg_gradient_ptrs-$3E,y                ; $01D63A | |
  STA !gsu_r1                               ; $01D63D |/
  LDX #gsu_draw_bg_gradient>>16             ; $01D640 |\
  LDA #gsu_draw_bg_gradient                 ; $01D642 | | Draw bg gradient to buffer
  JSL r_gsu_init_1                          ; $01D645 |/  $0890E7
  LDA #$56DE                                ; $01D649 |\
  STA $20                                   ; $01D64C | |
  LDY #$7F                                  ; $01D64E | | DMA 1314 bytes
  STY $22                                   ; $01D650 | | from $705800
  LDA #$5800                                ; $01D652 | | to $7F56DE
  STA $23                                   ; $01D655 | | (gradient tables)
  LDY #$70                                  ; $01D657 | |
  STY $25                                   ; $01D659 | |
  LDA #$0522                                ; $01D65B | |
  JSL dma_wram_gen_purpose                  ; $01D65E |/
  SEP #$20                                  ; $01D662 |
  LDX #$06                                  ; $01D664 | Enable gradient

.ret
  STX !r_reg_hdmaen_mirror                  ; $01D666 | Set HDMA
  PLB                                       ; $01D669 |
  RTL                                       ; $01D66A |

; HDMA Channel Inits
; Byte 1: DMA Control Register
; Byte 2: DMA Designation Register
; long word: table address

; HDMA Indirect Table 0, native SNES HDMA Indirect format, 3-byte entries:
; Byte: rccccccc r = repeat, c = scanline count
; Word: Source pointer
hdma_channel_6_init:
  db $01, $2C                               ; $01D66D |
  dl $7E51E4                                ; $01D66B |

hdma_channel_7_init:
  db $03, $11                               ; $01D670 |
  dl $7E552C                                ; $01D672 |

hdma_channel_5_init:
  db $44, $26                               ; $01D675 |
  dl $7E5B18                                ; $01D677 |

hdma_indirect_table_1:
  db $E9, $D0, $56, $E9, $74, $58, $00      ; $01D67A |

hdma_channel_4_init:
  db $42, $12                               ; $01D681 |
  dl $7E5B98                                ; $01D66B |

hdma_indirect_table_2:
  db $E9, $40, $50, $E9, $12, $51, $00      ; $01D686 |

hdma_channel_3_init:
  db $42, $11                               ; $01D68D |
  dl $7E5C18                                ; $01D66B |

hdma_indirect_table_3:
  db $E9, $E4, $51, $E9, $B6, $52, $00      ; $01D692 |

hdma_channel_2_init:
  db $42, $32                               ; $01D699 |
  dl $7E5C98                                ; $01D66B |

hdma_indirect_table_4:
  db $E9, $94, $58, $E9, $66, $59, $00      ; $01D69E |

hdma_channel_1_init:
  db $40, $32                               ; $01D6A5 |
  dl $7E5D18                                ; $01D66B |

hdma_indirect_table_5:
  db $E9, $DE, $56, $E9, $47, $57, $00      ; $01D6AA |

CODE_01D6B1:
  LDA $0D2D                                 ; $01D6B1 |
  BEQ CODE_01D6BB                           ; $01D6B4 |
  JSR CODE_01D7CD                           ; $01D6B6 |
  BRA CODE_01D6C3                           ; $01D6B9 |

CODE_01D6BB:
  LDA $0D3D                                 ; $01D6BB |
  BEQ CODE_01D6C3                           ; $01D6BE |
  JSR CODE_01D86D                           ; $01D6C0 |

CODE_01D6C3:
  LDX $0D27                                 ; $01D6C3 |
  BEQ CODE_01D6CD                           ; $01D6C6 |
  JSR CODE_01D795                           ; $01D6C8 |
  BRA CODE_01D6DF                           ; $01D6CB |

CODE_01D6CD:
  LDA $0D2B                                 ; $01D6CD |
  BEQ CODE_01D6D7                           ; $01D6D0 |
  JSR CODE_01D81D                           ; $01D6D2 |
  BRA CODE_01D6DF                           ; $01D6D5 |

CODE_01D6D7:
  LDA $0D45                                 ; $01D6D7 |
  BEQ CODE_01D6DF                           ; $01D6DA |
  JSR CODE_01D8C6                           ; $01D6DC |

CODE_01D6DF:
  LDX $0D3B                                 ; $01D6DF |
  BNE CODE_01D6E5                           ; $01D6E2 |
  RTS                                       ; $01D6E4 |

CODE_01D6E5:
  REP #$20                                  ; $01D6E5 |
  LDA $609A,x                               ; $01D6E7 |\
  STA !gsu_r2                               ; $01D6EA |/ Which Layer camera X 
  LDX #$08                                  ; $01D6ED |
  LDA #$BE12                                ; $01D6EF |
  JSL r_gsu_init_1                          ; $01D6F2 | GSU init
  LDA !gsu_r1                               ; $01D6F6 |
  SEC                                       ; $01D6F9 |
  SBC #$385E                                ; $01D6FA |
  JSL $00BE71                               ; $01D6FD |

  dw $552C, $5E7E, $7038                    ; $01D701 |

  LDA !r_header_bg3_tileset                 ; $01D707 |
  CMP #$0001                                ; $01D70A |
  BEQ CODE_01D715                           ; $01D70D |
  SEP #$20                                  ; $01D70F |
  LDA #$80                                  ; $01D711 |
  BRA CODE_01D791                           ; $01D713 |

CODE_01D715:
  LDA #$06FF                                ; $01D715 |
  SEC                                       ; $01D718 |
  SBC $3B                                   ; $01D719 |
  BCS CODE_01D724                           ; $01D71B |
  SEP #$20                                  ; $01D71D |
  LDA !r_reg_tm_mirror                      ; $01D71F |
  BRA CODE_01D72D                           ; $01D722 |

CODE_01D724:
  CMP #$00D2                                ; $01D724 |
  SEP #$20                                  ; $01D727 |
  BCC CODE_01D747                           ; $01D729 |
  LDA #$17                                  ; $01D72B |

CODE_01D72D:
  STA $7E51E5                               ; $01D72D |
  EOR #$04                                  ; $01D731 |
  AND #$04                                  ; $01D733 |
  STA $7E51E6                               ; $01D735 |
  LDA #$01                                  ; $01D739 |
  STA $7E51E4                               ; $01D73B |
  LDA #$00                                  ; $01D73F |
  STA $7E51E7                               ; $01D741 |
  BRA CODE_01D78F                           ; $01D745 |

CODE_01D747:
  LDX #$00                                  ; $01D747 |
  CMP #$80                                  ; $01D749 |
  BCC CODE_01D766                           ; $01D74B |
  SBC #$7F                                  ; $01D74D |
  PHA                                       ; $01D74F |
  LDA #$7F                                  ; $01D750 |
  STA $7E51E4,x                             ; $01D752 |
  LDA #$17                                  ; $01D756 |
  STA $7E51E5,x                             ; $01D758 |
  LDA #$00                                  ; $01D75C |
  STA $7E51E6,x                             ; $01D75E |
  PLA                                       ; $01D762 |
  INX                                       ; $01D763 |
  INX                                       ; $01D764 |
  INX                                       ; $01D765 |

CODE_01D766:
  STA $7E51E4,x                             ; $01D766 |
  LDA #$01                                  ; $01D76A |
  STA $7E51E7,x                             ; $01D76C |
  LDA !r_reg_tm_mirror                      ; $01D770 |
  STA $7E51E8,x                             ; $01D773 |
  LDA #$04                                  ; $01D777 |
  STA $7E51E9,x                             ; $01D779 |
  LDA #$17                                  ; $01D77D |
  STA $7E51E5,x                             ; $01D77F |
  LDA #$00                                  ; $01D783 |
  STA $7E51E6,x                             ; $01D785 |
  LDA #$00                                  ; $01D789 |
  STA $7E51EA,x                             ; $01D78B |

CODE_01D78F:
  LDA #$C0                                  ; $01D78F |

CODE_01D791:
  TSB !r_reg_hdmaen_mirror                  ; $01D791 |
  RTS                                       ; $01D794 |

CODE_01D795:
  REP #$20                                  ; $01D795 |
  DEX                                       ; $01D797 |
  LDA $3B,x                                 ; $01D798 |
  STA !gsu_r2                               ; $01D79A |
  LDA #$0001                                ; $01D79D |
  STA !gsu_r0                               ; $01D7A0 |
  LDA $0D28                                 ; $01D7A3 |
  STA !gsu_r9                               ; $01D7A6 |
  LDA #$3372                                ; $01D7A9 |
  STA !gsu_r10                              ; $01D7AC |
  LDX #$08                                  ; $01D7AF |
  LDA #$DC26                                ; $01D7B1 |
  JSL r_gsu_init_1                          ; $01D7B4 | GSU init
  LDA #$01A4                                ; $01D7B8 |
  JSL $00BE71                               ; $01D7BB |

  dw $5040, $727E, $7033                    ; $01D7BF |

  SEP #$20                                  ; $01D7C5 |
  LDA #$10                                  ; $01D7C7 |
  TSB !r_reg_hdmaen_mirror                  ; $01D7C9 |
  RTS                                       ; $01D7CC |

CODE_01D7CD:
  REP #$20                                  ; $01D7CD |
  LDA $0D2D                                 ; $01D7CF |
  AND #$0002                                ; $01D7D2 |
  STA !gsu_r1                               ; $01D7D5 |
  LDA !s_bg2_cam_y                          ; $01D7D8 |
  STA !gsu_r2                               ; $01D7DB |
  LDA $0D39                                 ; $01D7DE |
  STA !gsu_r3                               ; $01D7E1 |
  LDA $0D31                                 ; $01D7E4 |
  STA !gsu_r7                               ; $01D7E7 |
  LDA #$0001                                ; $01D7EA |
  STA !gsu_r8                               ; $01D7ED |
  LDA #$36BA                                ; $01D7F0 |
  STA !gsu_r10                              ; $01D7F3 |
  LDA !s_sprite_disable_flag                ; $01D7F6 |
  AND #$00FF                                ; $01D7F9 |
  STA !gsu_r11                              ; $01D7FC |
  LDX #$08                                  ; $01D7FF |
  LDA #$DD23                                ; $01D801 |
  JSL r_gsu_init_1                          ; $01D804 | GSU init
  LDA #$01A4                                ; $01D808 |
  JSL $00BE71                               ; $01D80B |

  dw $51E4, $BA7E, $7036                    ; $01D80F |

  SEP #$20                                  ; $01D815 |
  LDA #$08                                  ; $01D817 |
  TSB !r_reg_hdmaen_mirror                  ; $01D819 |
  RTS                                       ; $01D81C |

CODE_01D81D:
  REP #$20                                  ; $01D81D |
  LDA $0D2B                                 ; $01D81F |
  AND #$0002                                ; $01D822 |
  STA !gsu_r1                               ; $01D825 |
  LDA $0D37                                 ; $01D828 |
  STA $6000                                 ; $01D82B |
  LDA !s_bg2_cam_y                          ; $01D82E |
  STA !gsu_r2                               ; $01D831 |
  LDA $0D2F                                 ; $01D834 |
  STA !gsu_r3                               ; $01D837 |
  LDA #$0001                                ; $01D83A |
  STA !gsu_r4                               ; $01D83D |
  LDA #$3372                                ; $01D840 |
  STA !gsu_r10                              ; $01D843 |
  LDA !s_sprite_disable_flag                ; $01D846 |
  AND #$00FF                                ; $01D849 |
  STA !gsu_r11                              ; $01D84C |
  LDX #$08                                  ; $01D84F |
  LDA #$DC4D                                ; $01D851 |
  JSL r_gsu_init_1                          ; $01D854 | GSU init
  LDA #$01A4                                ; $01D858 |
  JSL $00BE71                               ; $01D85B |

  dw $5040, $727E, $7033                    ; $01D85F |

  SEP #$20                                  ; $01D865 |
  LDA #$10                                  ; $01D867 |
  TSB !r_reg_hdmaen_mirror                  ; $01D869 |
  RTS                                       ; $01D86C |

CODE_01D86D:
  REP #$20                                  ; $01D86D |
  LDA $0D3D                                 ; $01D86F |
  AND #$0002                                ; $01D872 |
  STA !gsu_r1                               ; $01D875 |
  LDA $0D43                                 ; $01D878 |
  STA $6000                                 ; $01D87B |
  LDA !s_bg3_cam_y                          ; $01D87E | bg3 camera y
  STA !gsu_r2                               ; $01D881 |
  LDA $0D3F                                 ; $01D884 |
  STA !gsu_r3                               ; $01D887 |
  LDA #$0001                                ; $01D88A |
  STA !gsu_r4                               ; $01D88D |
  LDA #$36BA                                ; $01D890 |
  STA !gsu_r10                              ; $01D893 |
  LDA !s_sprite_disable_flag                ; $01D896 |
  AND #$00FF                                ; $01D899 |
  STA !gsu_r11                              ; $01D89C |
  LDX #$08                                  ; $01D89F |
  LDA #$DC4D                                ; $01D8A1 |
  JSL r_gsu_init_1                          ; $01D8A4 | GSU init
  LDA #$01A4                                ; $01D8A8 |
  JSL $00BE71                               ; $01D8AB |

  dw $51E4, $BA7E, $7036                    ; $01D8AF |

  LDA $7036BA                               ; $01D8B5 |
  STA !s_bg3_cam_x                          ; $01D8B9 |
  STA $41                                   ; $01D8BC |
  SEP #$20                                  ; $01D8BE |
  LDA #$08                                  ; $01D8C0 |
  TSB !r_reg_hdmaen_mirror                  ; $01D8C2 |
  RTS                                       ; $01D8C5 |

CODE_01D8C6:
  REP #$20                                  ; $01D8C6 |
  LDA $0D45                                 ; $01D8C8 |
  AND #$0002                                ; $01D8CB |
  STA !gsu_r1                               ; $01D8CE |
  LDA !s_bg3_cam_y                          ; $01D8D1 |
  STA !gsu_r2                               ; $01D8D4 |
  LDA $0D4B                                 ; $01D8D7 |
  STA !gsu_r3                               ; $01D8DA |
  LDA $0D47                                 ; $01D8DD |
  STA !gsu_r7                               ; $01D8E0 |
  LDA #$0001                                ; $01D8E3 |
  STA !gsu_r8                               ; $01D8E6 |
  LDA #$3372                                ; $01D8E9 |
  STA !gsu_r10                              ; $01D8EC |
  LDA !s_sprite_disable_flag                ; $01D8EF |
  AND #$00FF                                ; $01D8F2 |
  STA !gsu_r11                              ; $01D8F5 |
  LDX #$08                                  ; $01D8F8 |
  LDA #$DD23                                ; $01D8FA |
  JSL r_gsu_init_1                          ; $01D8FD | GSU init
  LDA #$01A4                                ; $01D901 |
  JSL $00BE71                               ; $01D904 |

  dw $5040, $727E, $7033                    ; $01D908 |

  SEP #$20                                  ; $01D90E |
  LDA #$10                                  ; $01D910 |
  TSB !r_reg_hdmaen_mirror                  ; $01D912 |
  RTS                                       ; $01D915 |

offset_per_tile_mode_ptr:
  dw opt_moving_platforms                   ; $01D916 | $01: moving 6-4 platforms
  dw opt_fuzzied                            ; $01D918 | $03: fuzzied
  dw opt_unused                             ; $01D91A | $05: unused?

; color keyframe values for screen tint during fuzzy dizzy
fuzzy_tint_colors:
  dw $1402, $2000, $00E0, $00C3             ; $01D91C |
  dw $00A5, $0008, $0804, $1004             ; $01D924 |

; offset per tile mode $03: fuzzied dizzy effect
opt_fuzzied:
  STZ !r_reg_tm_mirror                      ; $01D92C | clear main screen
  LDA #$13                                  ; $01D92F |\ BG1, BG2, OBJ
  STA !r_reg_ts_mirror                      ; $01D931 |/ on subscreen
  REP #$20                                  ; $01D934 |
  LDA !s_sprite_disable_flag                ; $01D936 |\
  ORA $0B55                                 ; $01D939 | | check for sprites being paused,
  ORA !r_cur_item_used                      ; $01D93C | | item being used (pause flags)
  BNE .check_bg2                            ; $01D93F |/
  LDA !s_fuzzy_timer                        ; $01D941 |\ do we have time on the fuzzy
  BNE .check_timer_up                       ; $01D944 |/ dizzy effect timer?

.check_bg2
  LDA $0D37                                 ; $01D946 |\
  ORA $0D39                                 ; $01D949 | | is BG2 fuzzy effect happening?
  BNE .skip_BG1_update                      ; $01D94C |/
  STZ $0D2B                                 ; $01D94E |\
  STZ $0D2D                                 ; $01D951 | | if not, clear offsets
  LDA !r_reg_hdmaen_mirror                  ; $01D954 | | &
  AND #$FFE7                                ; $01D957 | | turn off HDMA on channels 3 & 4
  STA !r_reg_hdmaen_mirror                  ; $01D95A |/

.skip_BG1_update
  JMP .compute_BG1                          ; $01D95D | skip past BG1 updating

.check_timer_up
  DEC A                                     ; $01D960 |\  > 1 frame left on fuzzy timer?
  BNE .increase_amplitude_BG1               ; $01D961 |/  (if not, start decaying amplitude)
  LDA !r_fuzzy_opt_wave_amp                 ; $01D963 |\  if amplitude is already zero
  BEQ .check_tint_done                      ; $01D966 |/  meaning BG1 has finished decaying
  SEC                                       ; $01D968 |\
  SBC #$0100                                ; $01D969 | | smoothly decay amplitude
  STA !r_fuzzy_opt_wave_amp                 ; $01D96C | | by $100 until reaching 0
  BPL .check_tint_done                      ; $01D96F | | clamp at 0 minimum
  STZ !r_fuzzy_opt_wave_amp                 ; $01D971 |/

.check_tint_done
  LDA !r_fuzzy_tint_time                    ; $01D974 |\
  AND #$00FF                                ; $01D977 | | check tint cycle for $00 or $100
  BEQ .check_fuzzy_done                     ; $01D97A | | effectively, is tint done?
  JMP .morph_tint                           ; $01D97C |/

.check_fuzzy_done
  LDA $702F6C                               ; $01D97F |\ if we still have screen tint
  BNE .clear_tint                           ; $01D983 |/ left in sram, clear it first
  LDA !r_fuzzy_opt_wave_amp                 ; $01D985 |\ is BG1 still wavy?
  BNE .decay_BG2_horizontal                 ; $01D988 |/
  LDA #$0022                                ; $01D98A |\ if not, everything is done
  JSL push_sound_queue                      ; $01D98D |/ so set music back to normal
  STZ !s_fuzzy_timer                        ; $01D991 |\
  STZ $0D37                                 ; $01D994 | | clear fuzzy values
  STZ $0D39                                 ; $01D997 |/
  BRA .jmp_sine_offset_BG1                  ; $01D99A |

.decay_BG2_horizontal
  AND #$0100                                ; $01D99C |\ every other frame
  BNE .jmp_sine_offset_BG1                  ; $01D99F |/ during BG1 amplitude decay
  DEC $0D37                                 ; $01D9A1 |\  also decay BG2
  BPL .decay_BG2_vertical                   ; $01D9A4 | | horizontal effect
  STZ $0D37                                 ; $01D9A6 |/  (clamp min 0)

.decay_BG2_vertical
  DEC $0D39                                 ; $01D9A9 |\  and decay BG2
  BPL .jmp_sine_offset_BG1                  ; $01D9AC | | vertical effect
  STZ $0D39                                 ; $01D9AE |/  (clamp min 0)

.jmp_sine_offset_BG1
  JMP .sine_offset_BG1                      ; $01D9B1 |

.clear_tint
  LDA #$0000                                ; $01D9B4 |\ no tint (black)
  STA $702F6C                               ; $01D9B7 |/
  BRA .reset_tint_cycle                     ; $01D9BB |

.increase_amplitude_BG1
  DEC !s_fuzzy_timer                        ; $01D9BD | decrement timer
  LDA !r_fuzzy_opt_wave_amp                 ; $01D9C0 |\
  CLC                                       ; $01D9C3 | | smoothly increase amplitude
  ADC #$0080                                ; $01D9C4 | | until reaching max $6000
  CMP #$6000                                ; $01D9C7 | | clamp at max
  BCC .increase_BG2_horizontal              ; $01D9CA | |
  LDA #$6000                                ; $01D9CC |/

.increase_BG2_horizontal
  STA !r_fuzzy_opt_wave_amp                 ; $01D9CF |
  AND #$0380                                ; $01D9D2 |\ every 8 frames while amp
  BNE .handle_tint                          ; $01D9D5 |/ increases, below code runs
  LDA $0D37                                 ; $01D9D7 |\
  INC A                                     ; $01D9DA | | smoothly increase BG2 effect
  CMP #$0018                                ; $01D9DB | | until max $18
  BCS .increase_BG2_vertical                ; $01D9DE | |
  STA $0D37                                 ; $01D9E0 |/

.increase_BG2_vertical
  LDA $0D39                                 ; $01D9E3 |\
  INC A                                     ; $01D9E6 | | also smoothly increase
  CMP #$000C                                ; $01D9E7 | | the other BG2 effect (??)
  BCS .handle_tint                          ; $01D9EA | | until max $C
  STA $0D39                                 ; $01D9EC |/

.handle_tint
  LDA #$0003                                ; $01D9EF |
  STA $0D2B                                 ; $01D9F2 |
  LDA #$0001                                ; $01D9F5 |
  STA $0D2D                                 ; $01D9F8 |
  LDA !r_fuzzy_tint_time                    ; $01D9FB |\
  AND #$00FF                                ; $01D9FE | | is tint not on a new cycle?
  BNE .morph_tint                           ; $01DA01 |/  $00 or $100
  LDA !s_rng                                ; $01DA03 |\
  AND #$000E                                ; $01DA06 | | if new cycle,
  TAX                                       ; $01DA09 | | grab random color
  LDA fuzzy_tint_colors,x                   ; $01DA0A | | from table
  STA $702F6C                               ; $01DA0D |/  and store as tint overlay

.reset_tint_cycle
  STZ !r_fuzzy_tint_time                    ; $01DA11 | 00 -> 100 -> 00 ..
  LDA !s_cgram_mirror                       ; $01DA14 |
  STA $702D6C                               ; $01DA18 |

.morph_tint
  LDA !r_fuzzy_tint_time                    ; $01DA1C |\
  CLC                                       ; $01DA1F | | increment time by 8
  ADC #$0008                                ; $01DA20 | | store back in time ram
  STA !r_fuzzy_tint_time                    ; $01DA23 | | as well as GSU r6
  STA !gsu_r6                               ; $01DA26 |/
  LDA $702D6C                               ; $01DA29 |\
  STA !gsu_r1                               ; $01DA2D | | store current tint overlay colors
  LDA $702F6C                               ; $01DA30 | | in r1 & r2
  STA !gsu_r2                               ; $01DA34 |/
  LDX #gsu_lerp_two_colors>>16              ; $01DA37 |\
  LDA #gsu_lerp_two_colors                  ; $01DA39 | | GSU call to lerp between
  JSL r_gsu_init_1                          ; $01DA3C |/  the two colors
  LDA !gsu_r3                               ; $01DA40 |\  store lerp'd result in
  STA !s_cgram_mirror                       ; $01DA43 |/  first palette slot

.sine_offset_BG1
  LDA !r_fuzzy_opt_wave_offset              ; $01DA47 |\
  CLC                                       ; $01DA4A | | add 32 to positional
  ADC #$0020                                ; $01DA4B | | sinewave offset
  STA !r_fuzzy_opt_wave_offset              ; $01DA4E |/

.compute_BG1
  LDA !r_fuzzy_opt_wave_amp                 ; $01DA51 |\ amplitude of wave
  STA !gsu_r1                               ; $01DA54 |/ -> r1
  LDA !r_fuzzy_opt_wave_offset              ; $01DA57 |\ positional offset of wave
  STA !gsu_r2                               ; $01DA5A |/ -> r2
  LDX #gsu_compute_fuzzy_BG1_offsets>>16    ; $01DA5D |\
  LDA #gsu_compute_fuzzy_BG1_offsets        ; $01DA5F | | GSU: compute BG1 fuzzy offsets
  JSL r_gsu_init_1                          ; $01DA62 |/  ($701EF2~$701F71)
  SEP #$20                                  ; $01DA66 |
  RTS                                       ; $01DA68 |

; offset per tile mode $01: moving platforms & wavy lava effect
opt_moving_platforms:
  REP #$20                                  ; $01DA69 |
  LDA !s_sprite_disable_flag                ; $01DA6B |\  these pause flags on means
  ORA !r_cur_item_used                      ; $01DA6E | | don't update offset timer
  BNE .compute_OPT_offsets                  ; $01DA71 |/
  DEC $0CFD                                 ; $01DA73 |\ offset timer
  DEC $0CFD                                 ; $01DA76 |/ decrease by 2

.compute_OPT_offsets
  LDA $0CFD                                 ; $01DA79 |\ current Y offset timer
  STA !gsu_r7                               ; $01DA7C |/ -> r7
  LDA $39                                   ; $01DA7F |\  camera X
  STA !s_opt_cam_x                          ; $01DA81 | | -> OPT cam X
  STA !gsu_r8                               ; $01DA84 |/  and r8
  LDA $3B                                   ; $01DA87 |\ camera Y
  STA !gsu_r9                               ; $01DA89 |/ -> r9
  LDX #gsu_opt_moving_platforms>>16         ; $01DA8C |
  LDA #gsu_opt_moving_platforms             ; $01DA8E |
  JSL r_gsu_init_1                          ; $01DA91 |
  SEP #$20                                  ; $01DA95 |
  RTS                                       ; $01DA97 |

; offset per tile mode $05: unused?
opt_unused:
  REP #$20                                  ; $01DA98 |
  INC $0CFD                                 ; $01DA9A |\
  LDA $0CFD                                 ; $01DA9D | | increment timer
  CMP #$0060                                ; $01DAA0 | | with wraparound
  BCC .call_gsu                             ; $01DAA3 | | to $0000 once we reach
  LDA #$0000                                ; $01DAA5 | | $0060
  STA $0CFD                                 ; $01DAA8 |/

.call_gsu
  LSR A                                     ; $01DAAB |\
  LSR A                                     ; $01DAAC | | timer value >> 3
  LSR A                                     ; $01DAAD | | -> r7
  STA !gsu_r7                               ; $01DAAE |/
  LDA !s_player_x_cam_rel                   ; $01DAB1 |\ camera relative Yoshi X
  STA !gsu_r9                               ; $01DAB4 |/ -> r9
  LDX #gsu_opt_unused>>16                   ; $01DAB7 |
  LDA #gsu_opt_unused                       ; $01DAB9 |
  JSL r_gsu_init_1                          ; $01DABC |
  SEP #$20                                  ; $01DAC0 |
  RTS                                       ; $01DAC2 |

; 10+ star pause item entry
ten_star_item:
  LDA #$0064                                ; $01DAC3 | Star amount increase
; Star Pause item routine
star_item_main:
  LDY $039A                                 ; $01DAC6 |  Check if item is in use
  BNE .wait                                 ; $01DAC9 |
  CLC                                       ; $01DACB |\
  ADC !r_star_autoincrease                  ; $01DACC | |Set Star increase
  STA !r_star_autoincrease                  ; $01DACF | |
  CLC                                       ; $01DAD2 |/
  ADC #$0078                                ; $01DAD3 |\ Display star counter for
  STA !r_starcounter_timer                  ; $01DAD6 |/ 120+ frames
  INC $039A                                 ; $01DAD9 |  Set item in use flag
  RTS                                       ; $01DADC |
.wait
  LDA !r_star_autoincrease                  ; $01DADD |\  Keep game paused and
  BNE .ret                                  ; $01DAE0 | | Wait until increase is done
  STZ !r_cur_item_used                      ; $01DAE2 |/
.ret
  RTS                                       ; $01DAE5 |

; 20+ star pause item entry
twenty_star_item:
  LDA #$00C8                                ; $01DAE6 | Star amount increase
  BRA star_item_main                        ; $01DAE9 |

; POW block pause item main
pow_block_item:
  JSL transform_enemies_stars               ; $01DAEB |  Pop all sprites to stars
  LDA #$0047                                ; $01DAEF |\ play sound #$0047
  JSL push_sound_queue                      ; $01DAF2 |/
  LDA #$0020                                ; $01DAF6 |\ Set camera shake for
  STA !s_cam_y_small_shaking_timer          ; $01DAF9 |/ 32 frames
  STZ !r_cur_item_used                      ; $01DAFC |  Clear item use
  RTS                                       ; $01DAFF |

magnifying_glass_item:
  INC !s_magnify_glass_flag                 ; $01DB00 |  Set magnify glass mode on
  LDA #$0004                                ; $01DB03 |\ play sound #$0004
  JSL push_sound_queue                      ; $01DB06 |/
  STZ !r_cur_item_used                      ; $01DB0A |\ turn off item use
  RTS                                       ; $01DB0D |/ and return

; Full Egg Pause item
full_egg_item:
  LDY $039A                                 ; $01DB0E |\ return if item in use
  BNE .ret                                  ; $01DB11 |/
  LDA #$00AB                                ; $01DB13 |\
  JSL spawn_sprite_active                   ; $01DB16 |/ Spawn fill eggs item
  BCC .ret                                  ; $01DB1A |  Return if failed to spawn
  TYX                                       ; $01DB1C |  Sprite slot to X
  JSL $029AC6                               ; $01DB1D |  Setup sprite position
  INC $039A                                 ; $01DB21 |  Set item in use flag
.ret
  RTS                                       ; $01DB24 |

; Cloud Pause Item
; Turns all valid enemies into clouds (with random content)
enemies_to_cloud_item:
  LDX #$5C                                  ; $01DB25 | All sprites

.check_valid_type
  LDA !s_spr_state,x                        ; $01DB27 |\
  CMP #$000E                                ; $01DB2A | | next sprite if state < $0E
  BCC .next_sprite                          ; $01DB2D |/
  LDA !s_spr_bitwise_settings_3,x           ; $01DB2F |\
  AND #%0110000000000000                    ; $01DB32 | | check terrain collision flag
  BNE .next_sprite                          ; $01DB35 |/  to see if enemy
  CPX $61B6                                 ; $01DB37 |\
  BNE .transform                            ; $01DB3A | | if same sprite as standing on
  STZ $61B6                                 ; $01DB3C |/  then clear that flag

.transform
  LDA #$0006                                ; $01DB3F |\ Set sprite state to transform state
  STA !s_spr_state,x                        ; $01DB42 |/
  LDA #$00CB                                ; $01DB45 |\ Set sprite ID to transform to Winged Cloud
  STA $0B91,x                               ; $01DB48 |/

.next_sprite
  DEX                                       ; $01DB4B |\
  DEX                                       ; $01DB4C | |
  DEX                                       ; $01DB4D | | Decrease slot by 4 to get to next entry
  DEX                                       ; $01DB4E | | Leave when slot is negative (after $00)
  BPL .check_valid_type                     ; $01DB4F |/
  LDA #$003B                                ; $01DB51 |\ play sound #$003B
  JSL push_sound_queue                      ; $01DB54 |/
  STZ !r_cur_item_used                      ; $01DB58 |  Clear item being used
  RTS                                       ; $01DB5B |

; Green Melon Pause Item
green_melon_item:
  LDA #$0003                                ; $01DB5C | Seed melon type

; main for all melon pause items
; takes type in register A and gives player that melon
melon_item_main:
  STA !s_mouth_ammo                         ; $01DB5F |  ammo type
  INC $6162                                 ; $01DB62 |  Set flag for having something in mouth
  INC !s_tongued_sprite_slot                ; $01DB65 |  Also set for sprite being tongued
  LDA #$005A                                ; $01DB68 |\ Set ammo count to 90
  STA !s_ammo_counter                       ; $01DB6B |/ 9 shots for ice/flame/bubble
  LDA #$0014                                ; $01DB6E |\ play sound #$0014
  JSL push_sound_queue                      ; $01DB71 |/
  STZ !r_cur_item_used                      ; $01DB75 |
  RTS                                       ; $01DB78 |
; ice melon pause item
ice_melon_item:
  LDA #$0004                                ; $01DB79 | Ice melon type
  BRA melon_item_main                       ; $01DB7C |
; fire melon pause item
fire_melon_item:
  LDA #$0001                                ; $01DB7E | Fire melon type
  BRA melon_item_main                       ; $01DB81 |


CODE_01DB83:
  LDA $0CF4                                 ; $01DB83 |
  CLC                                       ; $01DB86 |
  ADC $0CF5                                 ; $01DB87 |
  TAX                                       ; $01DB8A |
  BEQ CODE_01DBB9                           ; $01DB8B |
  STZ $0356,x                               ; $01DB8D |
  TXY                                       ; $01DB90 |
  DEY                                       ; $01DB91 |

CODE_01DB92:
  CPX #$1B                                  ; $01DB92 |
  BCS CODE_01DBA7                           ; $01DB94 |
  LDA !r_pause_items,x                      ; $01DB96 |
  AND #$0F                                  ; $01DB99 |
  BEQ CODE_01DBA4                           ; $01DB9B |
  STA !r_pause_items,y                      ; $01DB9D |
  STZ !r_pause_items,x                      ; $01DBA0 |
  INY                                       ; $01DBA3 |

CODE_01DBA4:
  INX                                       ; $01DBA4 |
  BRA CODE_01DB92                           ; $01DBA5 |

CODE_01DBA7:
  LDA $0CF5                                 ; $01DBA7 |
  BEQ CODE_01DBB1                           ; $01DBAA |
  DEC $0CF5                                 ; $01DBAC |
  BRA CODE_01DBB9                           ; $01DBAF |

CODE_01DBB1:
  DEC $0CF4                                 ; $01DBB1 |
  BNE CODE_01DBB9                           ; $01DBB4 |
  INC $0CF4                                 ; $01DBB6 |

CODE_01DBB9:
  RTS                                       ; $01DBB9 |

  dw $DC8B                                  ; $01DBBA |
  dw $DC8B                                  ; $01DBBC |
  dw $DCA0                                  ; $01DBBE |
  dw $DCA1                                  ; $01DBC0 |
  dw $DC97                                  ; $01DBC2 |
  dw $DCA0                                  ; $01DBC4 |
  dw $DCB2                                  ; $01DBC6 |
  dw $DCB2                                  ; $01DBC8 |
  dw $DCB2                                  ; $01DBCA |

  db $01, $FF, $FF, $03, $FF, $FF, $1B, $FF ; $01DBCC |
  db $FF                                    ; $01DBD4 |

CODE_01DBD5:
  LDA $38                                   ; $01DBD5 |
  AND #$03                                  ; $01DBD7 |
  BEQ CODE_01DC4B                           ; $01DBD9 |
  TAX                                       ; $01DBDB |
  LDA $0CF4                                 ; $01DBDC |
  BNE CODE_01DBE4                           ; $01DBDF |
  JMP CODE_01DC8A                           ; $01DBE1 |

CODE_01DBE4:
  DEC A                                     ; $01DBE4 |
  STA $00                                   ; $01DBE5 |
  CLC                                       ; $01DBE7 |
  ADC $DBCB,x                               ; $01DBE8 |
  CMP $DBCE,x                               ; $01DBEB |
  BEQ CODE_01DBFA                           ; $01DBEE |
  INC A                                     ; $01DBF0 |
  STA $0CF4                                 ; $01DBF1 |
  LDA #$5C                                  ; $01DBF4 |
  STA $53                                   ; $01DBF6 |
  BRA CODE_01DC1C                           ; $01DBF8 |

CODE_01DBFA:
  LDA $00                                   ; $01DBFA |
  CLC                                       ; $01DBFC |
  ADC $0CF5                                 ; $01DBFD |
  CLC                                       ; $01DC00 |
  ADC $DBCB,x                               ; $01DC01 |
  CMP $DBD1,x                               ; $01DC04 |
  BNE CODE_01DC0E                           ; $01DC07 |
  LDA $0CF5                                 ; $01DC09 |
  BRA CODE_01DC1C                           ; $01DC0C |

CODE_01DC0E:
  LDA #$5C                                  ; $01DC0E |
  STA $53                                   ; $01DC10 |
  LDA $0CF5                                 ; $01DC12 |
  CLC                                       ; $01DC15 |
  ADC $DBCB,x                               ; $01DC16 |
  STA $0CF5                                 ; $01DC19 |

CODE_01DC1C:
  LDA $0CF4                                 ; $01DC1C |
  CLC                                       ; $01DC1F |
  ADC $0CF5                                 ; $01DC20 |
  TAX                                       ; $01DC23 |
  CPX #$1B                                  ; $01DC24 |
  BCS CODE_01DC42                           ; $01DC26 |
  DEX                                       ; $01DC28 |
  LDA !r_pause_items,x                      ; $01DC29 |
  BNE CODE_01DC42                           ; $01DC2C |
  DEC $0CF5                                 ; $01DC2E |
  BPL CODE_01DC40                           ; $01DC31 |
  STZ $0CF5                                 ; $01DC33 |
  DEC $0CF4                                 ; $01DC36 |
  BPL CODE_01DC40                           ; $01DC39 |
  STZ $0CF4                                 ; $01DC3B |
  BRA CODE_01DC42                           ; $01DC3E |

CODE_01DC40:
  STZ $53                                   ; $01DC40 |

CODE_01DC42:
  JSR CODE_01DCC6                           ; $01DC42 |
  JSR CODE_01DD8B                           ; $01DC45 |
  JSR CODE_01DCE0                           ; $01DC48 |

CODE_01DC4B:
  LDA !r_cur_item_used                      ; $01DC4B |
  BNE CODE_01DC8A                           ; $01DC4E |
  LDA $37                                   ; $01DC50 |
  AND #$80                                  ; $01DC52 |
  BEQ CODE_01DC8A                           ; $01DC54 |
  LDA !r_pause_item_disable                 ; $01DC56 |
  BNE CODE_01DC74                           ; $01DC59 |
  LDA $0CF5                                 ; $01DC5B |
  CLC                                       ; $01DC5E |
  ADC $0CF4                                 ; $01DC5F |
  TAX                                       ; $01DC62 |
  LDA $0356,x                               ; $01DC63 |
  STA !r_cur_item_used                      ; $01DC66 |
  BEQ CODE_01DC74                           ; $01DC69 |
  ASL A                                     ; $01DC6B |
  TAX                                       ; $01DC6C |
  REP #$20                                  ; $01DC6D |
  JSR ($DBB8,x)                             ; $01DC6F |
  SEP #$20                                  ; $01DC72 |

CODE_01DC74:
  LDA !r_cur_item_used                      ; $01DC74 |
  BEQ CODE_01DC86                           ; $01DC77 |
  LDA #$43                                  ; $01DC79 |
  STA $53                                   ; $01DC7B |
  STZ $039A                                 ; $01DC7D |
  STZ $039B                                 ; $01DC80 |
  JMP CODE_01DB83                           ; $01DC83 |

CODE_01DC86:
  LDA #$90                                  ; $01DC86 |
  STA $53                                   ; $01DC88 |

CODE_01DC8A:
  RTS                                       ; $01DC8A |

  LDA !r_stars_amount                       ; $01DC8B |
  CMP #$012C                                ; $01DC8E |
  BCC CODE_01DC96                           ; $01DC91 |
  STZ !r_cur_item_used                      ; $01DC93 |

CODE_01DC96:
  RTS                                       ; $01DC96 |

  LDA !s_magnify_glass_flag                 ; $01DC97 |
  BEQ CODE_01DC9F                           ; $01DC9A |
  STZ !r_cur_item_used                      ; $01DC9C |

CODE_01DC9F:
  RTS                                       ; $01DC9F |

  RTS                                       ; $01DCA0 |

  LDA !s_player_form                        ; $01DCA1 |
  BNE CODE_01DCAE                           ; $01DCA4 |
  LDA !s_cur_egg_inv_size                   ; $01DCA6 |
  CMP #$000C                                ; $01DCA9 |
  BCC CODE_01DCB1                           ; $01DCAC |

CODE_01DCAE:
  STZ !r_cur_item_used                      ; $01DCAE |

CODE_01DCB1:
  RTS                                       ; $01DCB1 |

  LDA !s_player_form                        ; $01DCB2 |
  ORA $6162                                 ; $01DCB5 |
  ORA !s_tongued_sprite_slot                ; $01DCB8 |
  BEQ CODE_01DCC1                           ; $01DCBB |
  STZ !r_cur_item_used                      ; $01DCBD |
  RTS                                       ; $01DCC0 |

CODE_01DCC1:
  JSL $04F74A                               ; $01DCC1 |
  RTS                                       ; $01DCC5 |

CODE_01DCC6:
  LDX #$00                                  ; $01DCC6 |
  LDY $0CF5                                 ; $01DCC8 |

CODE_01DCCB:
  LDA !r_pause_items,y                      ; $01DCCB |
  STA $0CF6,x                               ; $01DCCE |
  INY                                       ; $01DCD1 |
  INX                                       ; $01DCD2 |
  CPX #$03                                  ; $01DCD3 |
  BCC CODE_01DCCB                           ; $01DCD5 |
  RTS                                       ; $01DCD7 |

  dw $09AF, $499D                           ; $01DCD8 |

  dw $09AF, $099D                           ; $01DCDC |

CODE_01DCE0:
  LDX #$00                                  ; $01DCE0 |
  LDA $0CF5                                 ; $01DCE2 |
  BEQ CODE_01DCE9                           ; $01DCE5 |
  INX                                       ; $01DCE7 |
  INX                                       ; $01DCE8 |

CODE_01DCE9:
  REP #$20                                  ; $01DCE9 |
  LDA $DCD8,x                               ; $01DCEB |
  STA $7EB605                               ; $01DCEE |
  ORA #$8000                                ; $01DCF2 |
  STA $7EB645                               ; $01DCF5 |
  SEP #$20                                  ; $01DCF9 |
  LDX #$00                                  ; $01DCFB |
  LDA $0CF5                                 ; $01DCFD |
  CLC                                       ; $01DD00 |
  ADC #$03                                  ; $01DD01 |
  CMP #$1B                                  ; $01DD03 |
  BCS CODE_01DD0F                           ; $01DD05 |
  TAY                                       ; $01DD07 |
  LDA !r_pause_items,y                      ; $01DD08 |
  BEQ CODE_01DD0F                           ; $01DD0B |
  INX                                       ; $01DD0D |
  INX                                       ; $01DD0E |

CODE_01DD0F:
  REP #$20                                  ; $01DD0F |
  LDA $DCDC,x                               ; $01DD11 |
  STA $7EB61B                               ; $01DD14 |
  ORA #$8000                                ; $01DD18 |
  STA $7EB65B                               ; $01DD1B |
  SEP #$20                                  ; $01DD1F |
  RTS                                       ; $01DD21 |

  dw $1DBB, $1DBC, $1DBC, $1DBE             ; $01DD22 |
  dw $1DD1, $417F, $417F, $1DBF             ; $01DD2A |
  dw $1DD1, $417F, $417F, $1DBF             ; $01DD32 |
  dw $9DBB, $9DBC, $9DBC, $9DBE             ; $01DD3A |
  dw $5DBE, $1DBC, $1DBC, $1DBE             ; $01DD42 |
  dw $5DBF, $417F, $417F, $1DBF             ; $01DD4A |
  dw $5DBF, $417F, $417F, $1DBF             ; $01DD52 |
  dw $DDBE, $9DBC, $9DBC, $9DBE             ; $01DD5A |
  dw $5DBE, $1DBC, $1DBC, $5DBB             ; $01DD62 |
  dw $5DBF, $417F, $417F, $5DD1             ; $01DD6A |
  dw $5DBF, $417F, $417F, $5DD1             ; $01DD72 |
  dw $DDBE, $9DBC, $9DBC                    ; $01DD7A |

  db $BB, $DD, $22, $DD, $42, $DD, $62      ; $01DD80 |

  db $DD, $00, $06, $0C                     ; $01DD87 |

CODE_01DD8B:
  REP #$20                                  ; $01DD8B |
  PHB                                       ; $01DD8D |
  LDX #$7E                                  ; $01DD8E |
  PHX                                       ; $01DD90 |
  PLB                                       ; $01DD91 |
  JSR CODE_01D490                           ; $01DD92 |
  PLB                                       ; $01DD95 |
  JSR CODE_01DDB0                           ; $01DD96 |
  REP #$10                                  ; $01DD99 |
  LDY #$007E                                ; $01DD9B |
  STY $01                                   ; $01DD9E |
  LDY #$36E0                                ; $01DDA0 |
  LDX #$B59F                                ; $01DDA3 |
  LDA #$0100                                ; $01DDA6 |
  JSL $00BEA6                               ; $01DDA9 |
  SEP #$30                                  ; $01DDAD |
  RTS                                       ; $01DDAF |

CODE_01DDB0:
  LDA $0CF4                                 ; $01DDB0 |
  AND #$00FF                                ; $01DDB3 |
  TAY                                       ; $01DDB6 |
  ASL A                                     ; $01DDB7 |
  TAX                                       ; $01DDB8 |
  LDA $DD87,y                               ; $01DDB9 |
  TAY                                       ; $01DDBC |
  LDA $DD80,x                               ; $01DDBD |
  STA $00                                   ; $01DDC0 |
  CLC                                       ; $01DDC2 |
  ADC #$0008                                ; $01DDC3 |
  STA $02                                   ; $01DDC6 |
  CLC                                       ; $01DDC8 |
  ADC #$0008                                ; $01DDC9 |
  STA $04                                   ; $01DDCC |
  CLC                                       ; $01DDCE |
  ADC #$0008                                ; $01DDCF |
  STA $06                                   ; $01DDD2 |
  TYX                                       ; $01DDD4 |
  LDY #$00                                  ; $01DDD5 |

CODE_01DDD7:
  LDA ($00),y                               ; $01DDD7 |
  STA $7EB5C7,x                             ; $01DDD9 |
  LDA ($02),y                               ; $01DDDD |
  STA $7EB607,x                             ; $01DDDF |
  LDA ($04),y                               ; $01DDE3 |
  STA $7EB647,x                             ; $01DDE5 |
  LDA ($06),y                               ; $01DDE9 |
  STA $7EB687,x                             ; $01DDEB |
  INX                                       ; $01DDEF |
  INX                                       ; $01DDF0 |
  INY                                       ; $01DDF1 |
  INY                                       ; $01DDF2 |
  CPY #$08                                  ; $01DDF3 |
  BCC CODE_01DDD7                           ; $01DDF5 |
  RTS                                       ; $01DDF7 |

  dw $3540, $3542, $3144, $3146             ; $01DDF8 |
  dw $3148, $314A, $314C, $314E             ; $01DE00 |
  dw $334C                                  ; $01DE08 |

CODE_01DE0A:
  REP #$20                                  ; $01DE0A |
  LDA #$BFA8                                ; $01DE0C |
  STA $00                                   ; $01DE0F |
  LDX #$00                                  ; $01DE11 |
  TXY                                       ; $01DE13 |

CODE_01DE14:
  LDA $0CF6,y                               ; $01DE14 |
  AND #$00FF                                ; $01DE17 |
  BEQ CODE_01DE3C                           ; $01DE1A |
  PHY                                       ; $01DE1C |
  ASL A                                     ; $01DE1D |
  TAY                                       ; $01DE1E |
  LDA $DDF6,y                               ; $01DE1F |
  STA $006A82,x                             ; $01DE22 |
  PLY                                       ; $01DE26 |
  LDA $00                                   ; $01DE27 |
  STA $006A80,x                             ; $01DE29 |
  CLC                                       ; $01DE2D |
  ADC #$0018                                ; $01DE2E |
  STA $00                                   ; $01DE31 |
  INX                                       ; $01DE33 |
  INX                                       ; $01DE34 |
  INX                                       ; $01DE35 |
  INX                                       ; $01DE36 |
  INY                                       ; $01DE37 |
  CPY #$03                                  ; $01DE38 |
  BCC CODE_01DE14                           ; $01DE3A |

CODE_01DE3C:
  LDA #$AAAA                                ; $01DE3C |
  STA $006C08                               ; $01DE3F |
  SEP #$20                                  ; $01DE43 |
  RTS                                       ; $01DE45 |

window_mask_settings_bg1_2:
  db $00, $02, $02, $0B, $0B, $0B, $02      ; $01DE46 |

window_mask_settings_bg3_4_obj:
  db $00, $22, $22, $88, $88, $88, $22      ; $01DE4D |

message_box_handler:
  LDA #$01                                  ; $01DE54 |
  STA $10                                   ; $01DE56 |
  BRA CODE_01DE5C                           ; $01DE58 |
  STZ $10                                   ; $01DE5A |

CODE_01DE5C:
  PHB                                       ; $01DE5C |
  PHK                                       ; $01DE5D |
  PLB                                       ; $01DE5E |
  LDX !r_msg_box_state                      ; $01DE5F | message box state
  LDA $10                                   ; $01DE62 |
  BNE CODE_01DE80                           ; $01DE64 |
  TXA                                       ; $01DE66 |
  LSR A                                     ; $01DE67 |
  TAY                                       ; $01DE68 |
  LDA $DE46,y                               ; $01DE69 |\
  STA !r_reg_w34sel_mirror                  ; $01DE6C | | set up window mask settings
  LDA $DE4D,y                               ; $01DE6F | | (hardware reg's $2123, $2124, $2125)
  STA !r_reg_w12sel_mirror                  ; $01DE72 | |
  STA !r_reg_wobjsel_mirror                 ; $01DE75 |/
  LDA #$01                                  ; $01DE78 |\
  STA !s_player_disable_flag                ; $01DE7A | | disable control of yoshi
  STA !s_sprite_disable_flag                ; $01DE7D |/

CODE_01DE80:
  JSR ($DE84,x)                             ; $01DE80 |
  PLB                                       ; $01DE83 |
  RTL                                       ; $01DE84 |

message_box_state_ptr:
  dw $DE93                                  ; $01DE85 | $01: init
  dw $DEA9                                  ; $01DE87 | $03: black box growing (opening)
  dw $DED0                                  ; $01DE89 | $05: init message
  dw $DEA9                                  ; $01DE8B | $07: message fading in (from black)
  dw $DEE0                                  ; $01DE8D | $09: opened, player reading
  dw $DEB9                                  ; $01DE8F | $0B: message fading out (to black)
  dw $DEB9                                  ; $01DE91 | $0D: black box shrinking (closing)

; initialization
message_box_01:
  LDA #$50                                  ; $01DE93 |\ play sound #$0050
  JSL push_sound_queue                      ; $01DE95 |/
  STZ !r_msg_box_mask_size                  ; $01DE99 |\
  STZ $0D1A                                 ; $01DE9C | | initializing
  STZ $0D1B                                 ; $01DE9F |/

CODE_01DEA2:
  INC !r_msg_box_state                      ; $01DEA2 |\ next message box
  INC !r_msg_box_state                      ; $01DEA5 |/ state
  RTS                                       ; $01DEA8 |

; opening / closing
message_box_03_07:
  LDY #$00                                  ; $01DEA9 |
  CPX #$03                                  ; $01DEAB |\ if not
  BNE CODE_01DEB3                           ; $01DEAD |/ state $03 (opening)
  LDA $10                                   ; $01DEAF |
  BNE CODE_01DEC3                           ; $01DEB1 |

CODE_01DEB3:
  LDX $0D11                                 ; $01DEB3 |
  JMP ($DEF5,x)                             ; $01DEB6 |

message_box_0B_0D:
  LDY #$02                                  ; $01DEB9 |
  CPX #$0D                                  ; $01DEBB |
  BNE CODE_01DEB3                           ; $01DEBD |
  LDA $10                                   ; $01DEBF |
  BEQ CODE_01DEB3                           ; $01DEC1 |

CODE_01DEC3:
  REP #$20                                  ; $01DEC3 |
  LDA !r_msg_box_mask_size                  ; $01DEC5 |
  STA !gsu_r4                               ; $01DEC8 |
  SEP #$20                                  ; $01DECB |
  JMP CODE_01DF18                           ; $01DECD |

message_box_05:
  REP #$20                                  ; $01DED0 |
  LDA #$0000                                ; $01DED2 |
  STA $70406E                               ; $01DED5 |
  SEP #$20                                  ; $01DED9 |
  JSR CODE_01E180                           ; $01DEDB |
  BRA CODE_01DEA2                           ; $01DEDE |

message_box_09:
  JSR CODE_01E180                           ; $01DEE0 |
  LDA $70406E                               ; $01DEE3 |
  CMP #$02                                  ; $01DEE7 |
  BCC CODE_01DEF4                           ; $01DEE9 |
  LDA #$56                                  ; $01DEEB |\ play sound #$0056
  JSL push_sound_queue                      ; $01DEED |/
  JSR CODE_01DEA2                           ; $01DEF1 |

CODE_01DEF4:
  RTS                                       ; $01DEF4 |

  dw $DEFF                                  ; $01DEF5 |

  dw $0100, $0000                           ; $01DEF7 |

  dw $0010, $FFF0                           ; $01DEFB |

  REP #$20                                  ; $01DEFF |
  LDA !r_msg_box_mask_size                  ; $01DF01 |\
  CLC                                       ; $01DF04 | | either grow or shrink
  ADC $DEFB,y                               ; $01DF05 | | black square
  STA !r_msg_box_mask_size                  ; $01DF08 |/
  STA !gsu_r4                               ; $01DF0B |
  CMP $DEF7,y                               ; $01DF0E |
  SEP #$20                                  ; $01DF11 |
  BEQ CODE_01DF18                           ; $01DF13 |
  JMP CODE_01E048                           ; $01DF15 |

CODE_01DF18:
  JSR CODE_01DEA2                           ; $01DF18 |
  LDA !r_msg_box_state                      ; $01DF1B |
  CMP #$0F                                  ; $01DF1E |
  BNE CODE_01DF45                           ; $01DF20 |
  STZ !r_msg_box_state                      ; $01DF22 |
  LDA $10                                   ; $01DF25 |
  BNE CODE_01DF44                           ; $01DF27 |
  STZ !r_reg_w12sel_mirror                  ; $01DF29 |
  STZ !r_reg_w34sel_mirror                  ; $01DF2C |
  STZ !r_reg_wobjsel_mirror                 ; $01DF2F |
  STZ !s_sprite_disable_flag                ; $01DF32 |
  LDA !r_level_load_type                    ; $01DF35 |
  BEQ CODE_01DF41                           ; $01DF38 |
  BIT $35                                   ; $01DF3A |
  BVS CODE_01DF44                           ; $01DF3C |
  STZ !r_level_load_type                    ; $01DF3E |

CODE_01DF41:
  STZ !s_player_disable_flag                ; $01DF41 |

CODE_01DF44:
  RTS                                       ; $01DF44 |

CODE_01DF45:
  CMP #$0D                                  ; $01DF45 |
  BNE CODE_01DF8E                           ; $01DF47 |
  REP #$30                                  ; $01DF49 |
  LDA #$0100                                ; $01DF4B |
  STA !r_msg_box_mask_size                  ; $01DF4E |
  LDY #$0180                                ; $01DF51 |
  LDA $0D17                                 ; $01DF54 |
  CLC                                       ; $01DF57 |
  ADC #$00C0                                ; $01DF58 |
  CMP #$3800                                ; $01DF5B |
  BEQ CODE_01DF6A                           ; $01DF5E |
  BCC CODE_01DF6A                           ; $01DF60 |
  LDA #$3800                                ; $01DF62 |
  SBC $0D17                                 ; $01DF65 |
  ASL A                                     ; $01DF68 |
  TAY                                       ; $01DF69 |

CODE_01DF6A:
  LDA $0D17                                 ; $01DF6A |
  JSR CODE_01D533                           ; $01DF6D |
  REP #$30                                  ; $01DF70 |
  LDA $0D17                                 ; $01DF72 |
  CLC                                       ; $01DF75 |
  ADC #$00C0                                ; $01DF76 |
  SEC                                       ; $01DF79 |
  SBC #$3800                                ; $01DF7A |
  BEQ CODE_01DF89                           ; $01DF7D |
  BMI CODE_01DF89                           ; $01DF7F |
  ASL A                                     ; $01DF81 |
  TAY                                       ; $01DF82 |
  LDA #$3400                                ; $01DF83 |
  JSR CODE_01D533                           ; $01DF86 |

CODE_01DF89:
  SEP #$30                                  ; $01DF89 |

CODE_01DF8B:
  JMP CODE_01E048                           ; $01DF8B |

CODE_01DF8E:
  CMP #$05                                  ; $01DF8E |
  BNE CODE_01DF8B                           ; $01DF90 |
  REP #$30                                  ; $01DF92 |
  STZ !r_msg_box_mask_size                  ; $01DF94 |
  LDY #$0182                                ; $01DF97 |
  LDA $43                                   ; $01DF9A |
  CLC                                       ; $01DF9C |
  ADC #$0018                                ; $01DF9D |
  AND #$01F0                                ; $01DFA0 |
  ASL A                                     ; $01DFA3 |
  ORA #$3400                                ; $01DFA4 |
  STA $0D17                                 ; $01DFA7 |
  CLC                                       ; $01DFAA |
  ADC #$00C0                                ; $01DFAB |
  CMP #$3800                                ; $01DFAE |
  BEQ CODE_01DFBF                           ; $01DFB1 |
  BCC CODE_01DFBF                           ; $01DFB3 |
  LDA #$3800                                ; $01DFB5 |
  SBC $0D17                                 ; $01DFB8 |
  ASL A                                     ; $01DFBB |
  INC A                                     ; $01DFBC |
  INC A                                     ; $01DFBD |
  TAY                                       ; $01DFBE |

CODE_01DFBF:
  LDA $0D17                                 ; $01DFBF |
  ORA #$8000                                ; $01DFC2 |
  JSR CODE_01D533                           ; $01DFC5 |
  REP #$30                                  ; $01DFC8 |
  LDA $0D17                                 ; $01DFCA |
  CLC                                       ; $01DFCD |
  ADC #$00C0                                ; $01DFCE |
  SEC                                       ; $01DFD1 |
  SBC #$3800                                ; $01DFD2 |
  BEQ CODE_01DFE3                           ; $01DFD5 |
  BMI CODE_01DFE3                           ; $01DFD7 |
  ASL A                                     ; $01DFD9 |
  INC A                                     ; $01DFDA |
  INC A                                     ; $01DFDB |
  TAY                                       ; $01DFDC |
  LDA #$B400                                ; $01DFDD |
  JSR CODE_01D533                           ; $01DFE0 |

CODE_01DFE3:
  SEP #$30                                  ; $01DFE3 |
  PHB                                       ; $01DFE5 |
  LDA #$7E                                  ; $01DFE6 |
  PHA                                       ; $01DFE8 |
  PLB                                       ; $01DFE9 |
  REP #$30                                  ; $01DFEA |
  LDA $41                                   ; $01DFEC |
  CLC                                       ; $01DFEE |
  ADC #$0038                                ; $01DFEF |
  AND #$01F0                                ; $01DFF2 |
  LSR A                                     ; $01DFF5 |
  LSR A                                     ; $01DFF6 |
  LSR A                                     ; $01DFF7 |
  LSR A                                     ; $01DFF8 |
  STA $02                                   ; $01DFF9 |
  EOR #$001F                                ; $01DFFB |
  INC A                                     ; $01DFFE |
  CMP #$000A                                ; $01DFFF |
  BCC CODE_01E007                           ; $01E002 |
  LDA #$000A                                ; $01E004 |

CODE_01E007:
  STA $04                                   ; $01E007 |
  STZ $08                                   ; $01E009 |
  LDA #$2A00                                ; $01E00B |
  STA $06                                   ; $01E00E |
  LDA $000D17                               ; $01E010 |
  CLC                                       ; $01E014 |
  ADC $02                                   ; $01E015 |
  STA $02                                   ; $01E017 |
  JSR CODE_01E0BF                           ; $01E019 |
  INC $08                                   ; $01E01C |
  LDA $04                                   ; $01E01E |
  CMP #$000A                                ; $01E020 |
  BCS CODE_01E03F                           ; $01E023 |
  DEC A                                     ; $01E025 |
  ASL A                                     ; $01E026 |
  CLC                                       ; $01E027 |
  ADC #$2A00                                ; $01E028 |
  STA $06                                   ; $01E02B |
  LDA #$000A                                ; $01E02D |
  SEC                                       ; $01E030 |
  SBC $04                                   ; $01E031 |
  STA $04                                   ; $01E033 |
  LDA $02                                   ; $01E035 |
  AND #$FFE0                                ; $01E037 |
  STA $02                                   ; $01E03A |
  JSR CODE_01E0BF                           ; $01E03C |

CODE_01E03F:
  LDA #$FFFF                                ; $01E03F |
  STA $4002,x                               ; $01E042 |
  SEP #$30                                  ; $01E045 |
  PLB                                       ; $01E047 |

CODE_01E048:
  REP #$20                                  ; $01E048 |
  STZ !gsu_r1                               ; $01E04A |
  STZ !gsu_r2                               ; $01E04D |
  STZ !gsu_r3                               ; $01E050 |
  LDA $41                                   ; $01E053 |
  AND #$000F                                ; $01E055 |
  CMP #$0008                                ; $01E058 |
  BCS CODE_01E060                           ; $01E05B |
  ORA #$0010                                ; $01E05D |

CODE_01E060:
  EOR #$FFFF                                ; $01E060 |
  INC A                                     ; $01E063 |
  CLC                                       ; $01E064 |
  ADC #$0090                                ; $01E065 |
  STA !gsu_r5                               ; $01E068 |
  LDA $43                                   ; $01E06B |
  AND #$000F                                ; $01E06D |
  CMP #$0008                                ; $01E070 |
  BCS CODE_01E078                           ; $01E073 |
  ORA #$0010                                ; $01E075 |

CODE_01E078:
  EOR #$FFFF                                ; $01E078 |
  INC A                                     ; $01E07B |
  CLC                                       ; $01E07C |
  ADC #$0047                                ; $01E07D |
  STA !gsu_r6                               ; $01E080 |
  LDA #$8002                                ; $01E083 |
  LDX $10                                   ; $01E086 |
  BEQ CODE_01E08D                           ; $01E088 |
  LDA #$8040                                ; $01E08A |

CODE_01E08D:
  LDX #$08                                  ; $01E08D |
  JSL r_gsu_init_1                          ; $01E08F | GSU init
  SEP #$20                                  ; $01E093 |
  LDA $10                                   ; $01E095 |
  BNE CODE_01E0BE                           ; $01E097 |
  JSL $00BE39                               ; $01E099 |

; DMA args
  dl $7E56D0, $703A02                       ; $01E09D |
  dw $0348                                  ; $01E0A3 |

  LDA !r_reg_tm_mirror                      ; $01E0A5 |
  STA !r_reg_tmw_mirror                     ; $01E0A8 |
  LDA !r_reg_ts_mirror                      ; $01E0AB |
  STA !r_reg_tsw_mirror                     ; $01E0AE |
  LDA #$30                                  ; $01E0B1 |
  STA !r_reg_wbglog_mirror                  ; $01E0B3 |
  STZ !reg_wobjlog                          ; $01E0B6 |
  LDA #$20                                  ; $01E0B9 |
  TSB !r_reg_hdmaen_mirror                  ; $01E0BB |

CODE_01E0BE:
  RTS                                       ; $01E0BE |

CODE_01E0BF:
  LDA #$0006                                ; $01E0BF |
  STA $00                                   ; $01E0C2 |
  LDX $4000                                 ; $01E0C4 |
  LDA $02                                   ; $01E0C7 |

CODE_01E0C9:
  STA $4002,x                               ; $01E0C9 |
  PHA                                       ; $01E0CC |
  LDA $04                                   ; $01E0CD |
  ASL A                                     ; $01E0CF |
  DEC A                                     ; $01E0D0 |
  STA $4004,x                               ; $01E0D1 |
  LDA $00                                   ; $01E0D4 |
  DEC A                                     ; $01E0D6 |
  BEQ CODE_01E0EB                           ; $01E0D7 |
  CMP #$0005                                ; $01E0D9 |
  BCS CODE_01E0EB                           ; $01E0DC |
  JSR CODE_01E107                           ; $01E0DE |
  LDA $06                                   ; $01E0E1 |
  CLC                                       ; $01E0E3 |
  ADC #$0020                                ; $01E0E4 |
  STA $06                                   ; $01E0E7 |
  BRA CODE_01E0EE                           ; $01E0E9 |

CODE_01E0EB:
  JSR CODE_01E136                           ; $01E0EB |

CODE_01E0EE:
  TXA                                       ; $01E0EE |
  CLC                                       ; $01E0EF |
  ADC #$0004                                ; $01E0F0 |
  TAX                                       ; $01E0F3 |
  PLA                                       ; $01E0F4 |
  CLC                                       ; $01E0F5 |
  ADC #$0020                                ; $01E0F6 |
  AND #$F7FF                                ; $01E0F9 |
  ORA #$0400                                ; $01E0FC |
  DEC $00                                   ; $01E0FF |
  BNE CODE_01E0C9                           ; $01E101 |
  STX $4000                                 ; $01E103 |
  RTS                                       ; $01E106 |

CODE_01E107:
  LDY $04                                   ; $01E107 |
  LDA $08                                   ; $01E109 |
  BNE CODE_01E118                           ; $01E10B |
  LDA #$2DC3                                ; $01E10D |
  STA $4006,x                               ; $01E110 |
  INX                                       ; $01E113 |
  INX                                       ; $01E114 |
  DEY                                       ; $01E115 |
  BEQ CODE_01E135                           ; $01E116 |

CODE_01E118:
  LDA $06                                   ; $01E118 |

CODE_01E11A:
  STA $4006,x                               ; $01E11A |
  INC A                                     ; $01E11D |
  INC A                                     ; $01E11E |
  INX                                       ; $01E11F |
  INX                                       ; $01E120 |
  DEY                                       ; $01E121 |
  BNE CODE_01E11A                           ; $01E122 |
  LDA $08                                   ; $01E124 |
  BNE CODE_01E12F                           ; $01E126 |
  LDA $04                                   ; $01E128 |
  CMP #$000A                                ; $01E12A |
  BCC CODE_01E135                           ; $01E12D |

CODE_01E12F:
  LDA #$6DC3                                ; $01E12F |
  STA $4004,x                               ; $01E132 |

CODE_01E135:
  RTS                                       ; $01E135 |

CODE_01E136:
  LDY $04                                   ; $01E136 |
  LDA $08                                   ; $01E138 |
  BNE CODE_01E151                           ; $01E13A |
  LDA $00                                   ; $01E13C |
  DEC A                                     ; $01E13E |
  BNE CODE_01E146                           ; $01E13F |
  LDA #$ADC0                                ; $01E141 |
  BRA CODE_01E149                           ; $01E144 |

CODE_01E146:
  LDA #$2DC0                                ; $01E146 |

CODE_01E149:
  STA $4006,x                               ; $01E149 |
  INX                                       ; $01E14C |
  INX                                       ; $01E14D |
  DEY                                       ; $01E14E |
  BEQ CODE_01E17F                           ; $01E14F |

CODE_01E151:
  LDA $00                                   ; $01E151 |
  DEC A                                     ; $01E153 |
  BNE CODE_01E15B                           ; $01E154 |
  LDA #$ADC1                                ; $01E156 |
  BRA CODE_01E15E                           ; $01E159 |

CODE_01E15B:
  LDA #$2DC1                                ; $01E15B |

CODE_01E15E:
  STA $4006,x                               ; $01E15E |
  INX                                       ; $01E161 |
  INX                                       ; $01E162 |
  DEY                                       ; $01E163 |
  BNE CODE_01E15E                           ; $01E164 |
  LDA $08                                   ; $01E166 |
  BNE CODE_01E171                           ; $01E168 |
  LDA $04                                   ; $01E16A |
  CMP #$000A                                ; $01E16C |
  BCC CODE_01E17F                           ; $01E16F |

CODE_01E171:
  LDA #$6DC0                                ; $01E171 |
  LDY $00                                   ; $01E174 |
  DEY                                       ; $01E176 |
  BNE CODE_01E17C                           ; $01E177 |
  LDA #$EDC0                                ; $01E179 |

CODE_01E17C:
  STA $4004,x                               ; $01E17C |

CODE_01E17F:
  RTS                                       ; $01E17F |

CODE_01E180:
  LDA $012D                                 ; $01E180 |
  PHA                                       ; $01E183 |
  LDA $012E                                 ; $01E184 |
  PHA                                       ; $01E187 |
  LDA #$13                                  ; $01E188 |
  STA $012D                                 ; $01E18A |
  LDA #$3C                                  ; $01E18D |
  STA $012E                                 ; $01E18F |
  REP #$30                                  ; $01E192 |
  LDA $704070                               ; $01E194 | message box index
  ASL A                                     ; $01E198 |
  TAX                                       ; $01E199 |
  LDA $5110DB,x                             ; $01E19A | reads message box data pointer
  STA $704096                               ; $01E19E |
  LDA #$0051                                ; $01E1A2 |
  STA $704098                               ; $01E1A5 |
  LDA !r_extra_lives                        ; $01E1A9 |
  STA $70409A                               ; $01E1AC |
  SEP #$10                                  ; $01E1B0 |
  LDA #$0000                                ; $01E1B2 |
  STA $704074                               ; $01E1B5 |
  STA $704076                               ; $01E1B9 |
  LDA $0071                                 ; $01E1BD |
  BNE CODE_01E1D6                           ; $01E1C0 |
  LDA !r_joy1_lo                            ; $01E1C2 |
  AND #$0F80                                ; $01E1C5 |
  STA $704074                               ; $01E1C8 |
  LDA !r_joy1_lo_press                      ; $01E1CC |
  AND #$0F80                                ; $01E1CF |
  STA $704076                               ; $01E1D2 |

CODE_01E1D6:
  LDX #$09                                  ; $01E1D6 |
  LDA #$B03E                                ; $01E1D8 |
  JSL r_gsu_init_1                          ; $01E1DB | GSU init
  SEP #$20                                  ; $01E1DF |
  PLA                                       ; $01E1E1 |
  STA $012E                                 ; $01E1E2 |
  PLA                                       ; $01E1E5 |
  STA $012D                                 ; $01E1E6 |
  LDA $607A                                 ; $01E1E9 |
  BEQ CODE_01E1F2                           ; $01E1EC |
  JSL push_sound_queue                      ; $01E1EE |

CODE_01E1F2:
  INC $0D15                                 ; $01E1F2 |
  JSR CODE_01E1F9                           ; $01E1F5 |
  RTS                                       ; $01E1F8 |

CODE_01E1F9:
  PHB                                       ; $01E1F9 |
  LDA #$7E                                  ; $01E1FA |
  PHA                                       ; $01E1FC |
  PLB                                       ; $01E1FD |
  REP #$30                                  ; $01E1FE |
  LDX $4000                                 ; $01E200 |
  LDA $43                                   ; $01E203 |
  CLC                                       ; $01E205 |
  ADC #$0068                                ; $01E206 |
  AND #$01F0                                ; $01E209 |
  ASL A                                     ; $01E20C |
  ORA #$3400                                ; $01E20D |
  STA $00                                   ; $01E210 |
  LDA $41                                   ; $01E212 |
  CLC                                       ; $01E214 |
  ADC #$00B8                                ; $01E215 |
  AND #$01F0                                ; $01E218 |
  LSR A                                     ; $01E21B |
  LSR A                                     ; $01E21C |
  LSR A                                     ; $01E21D |
  LSR A                                     ; $01E21E |
  ADC $00                                   ; $01E21F |
  STA $4002,x                               ; $01E221 |
  LDA #$0001                                ; $01E224 |
  STA $4004,x                               ; $01E227 |
  LDA $704073                               ; $01E22A |
  AND #$00FF                                ; $01E22E |
  CMP #$000F                                ; $01E231 |
  BEQ CODE_01E250                           ; $01E234 |
  CMP #$0051                                ; $01E236 |
  BEQ CODE_01E250                           ; $01E239 |
  CMP #$00FF                                ; $01E23B |
  BEQ CODE_01E250                           ; $01E23E |
  LDA $70406E                               ; $01E240 |
  CMP #$0002                                ; $01E244 |
  BCS CODE_01E250                           ; $01E247 |
  LDA !r_frame_counter_global_dp            ; $01E249 |
  AND #$0010                                ; $01E24B |
  BEQ CODE_01E255                           ; $01E24E |

CODE_01E250:
  LDA #$ADC1                                ; $01E250 |
  BRA CODE_01E258                           ; $01E253 |

CODE_01E255:
  LDA #$2DC5                                ; $01E255 |

CODE_01E258:
  STA $4006,x                               ; $01E258 |
  LDA #$FFFF                                ; $01E25B |
  STA $4008,x                               ; $01E25E |
  TXA                                       ; $01E261 |
  CLC                                       ; $01E262 |
  ADC #$0006                                ; $01E263 |
  STA $4000                                 ; $01E266 |
  SEP #$30                                  ; $01E269 |
  PLB                                       ; $01E26B |
  RTS                                       ; $01E26C |

gamemode31:
  LDX $0B57                                 ; $01E26D |
  JSR ($E291,x)                             ; $01E270 |
  LDA $0B57                                 ; $01E273 |
  CMP #$16                                  ; $01E276 |
  BCC CODE_01E284                           ; $01E278 |
  LDA #$19                                  ; $01E27A |
  STA $0B57                                 ; $01E27C |
  LDA #$10                                  ; $01E27F |
  STA !r_game_mode                          ; $01E281 |

CODE_01E284:
  LDA $0B57                                 ; $01E284 |
  CMP #$08                                  ; $01E287 |
  BCS CODE_01E28F                           ; $01E289 |
  JSL $01C0CE                               ; $01E28B |

CODE_01E28F:
  PLB                                       ; $01E28F |
  RTL                                       ; $01E290 |

  dw $E2A7                                  ; $01E291 |
  dw $E2F0                                  ; $01E293 |
  dw $E378                                  ; $01E295 |
  dw $E442                                  ; $01E297 |
  dw $B5E4                                  ; $01E299 |
  dw $B6B9                                  ; $01E29B |
  dw $B6C9                                  ; $01E29D |
  dw $B95B                                  ; $01E29F |
  dw $B9BA                                  ; $01E2A1 |
  dw $E2F0                                  ; $01E2A3 |
  dw $E4A0                                  ; $01E2A5 |

  REP #$30                                  ; $01E2A7 |
  LDA !r_header_level_mode                  ; $01E2A9 |
  CMP #$0009                                ; $01E2AC |
  BEQ CODE_01E2C1                           ; $01E2AF |
  LDA !s_cgram_mirror                       ; $01E2B1 |
  STA !r_reg_coldata_mirror                 ; $01E2B5 |
  LDA #$0000                                ; $01E2B8 |
  STA !s_cgram_mirror                       ; $01E2BB |
  REP #$30                                  ; $01E2BF |

CODE_01E2C1:
  LDX #$0000                                ; $01E2C1 |
  LDA #$FF00                                ; $01E2C4 |

CODE_01E2C7:
  STA $703A02,x                             ; $01E2C7 |
  INX                                       ; $01E2CB |
  INX                                       ; $01E2CC |
  INX                                       ; $01E2CD |
  INX                                       ; $01E2CE |
  CPX #$0348                                ; $01E2CF |
  BCC CODE_01E2C7                           ; $01E2D2 |
  SEP #$30                                  ; $01E2D4 |
  INC $0B57                                 ; $01E2D6 |
  INC $0B57                                 ; $01E2D9 |
  STZ $0D1F                                 ; $01E2DC |
  RTS                                       ; $01E2DF |

  dw $1F1F, $0104                           ; $01E2E0 |
  dw $0000, $018C                           ; $01E2E4 |
  dw $0350, $018C                           ; $01E2E8 |
  dw $FF00, $9F60                           ; $01E2EC |

CODE_01E2F0:
  INC $0D1F                                 ; $01E2F0 |
  LDA $0D1F                                 ; $01E2F3 |
  CMP #$0A                                  ; $01E2F6 |
  BCC CODE_01E338                           ; $01E2F8 |
  INC $0B57                                 ; $01E2FA |
  INC $0B57                                 ; $01E2FD |
  REP #$20                                  ; $01E300 |
  STZ $0D1F                                 ; $01E302 |
  LDX $0B4E                                 ; $01E305 |
  LDA $E2E0,x                               ; $01E308 |
  STA !r_reg_tmw_mirror                     ; $01E30B |
  LDA $E2E4,x                               ; $01E30E |
  STA $0D23                                 ; $01E311 |
  LDA $E2E8,x                               ; $01E314 |
  STA $0D25                                 ; $01E317 |
  LDA $E2EC,x                               ; $01E31A |
  STA $0D21                                 ; $01E31D |
  SEP #$20                                  ; $01E320 |
  LDA #$33                                  ; $01E322 |
  STA !r_reg_w12sel_mirror                  ; $01E324 |
  STA !r_reg_w34sel_mirror                  ; $01E327 |
  STA !r_reg_wobjsel_mirror                 ; $01E32A |
  LDA #$22                                  ; $01E32D |
  STA !r_reg_cgwsel_mirror                  ; $01E32F |
  LDA #$20                                  ; $01E332 |
  STA !r_reg_hdmaen_mirror                  ; $01E334 |
  RTS                                       ; $01E337 |

CODE_01E338:
  DEC A                                     ; $01E338 |
  BNE CODE_01E348                           ; $01E339 |
  JSL $00BE39                               ; $01E33B |

  dw $56D0, $027E, $703A, $00D2             ; $01E33F |

  RTS                                       ; $01E347 |

CODE_01E348:
  DEC A                                     ; $01E348 |
  BNE CODE_01E358                           ; $01E349 |
  JSL $00BE39                               ; $01E34B |

  dw $57A2, $D47E, $703A, $00D2             ; $01E34F |

  RTS                                       ; $01E357 |

CODE_01E358:
  DEC A                                     ; $01E358 |
  BNE CODE_01E368                           ; $01E359 |
  JSL $00BE39                               ; $01E35B |

  dw $5874, $A67E, $703B, $00D2             ; $01E35F |

  RTS                                       ; $01E367 |

CODE_01E368:
  DEC A                                     ; $01E368 |
  BNE CODE_01E377                           ; $01E369 |
  JSL $00BE39                               ; $01E36B |

  dw $5946, $787E, $703C, $00D2             ; $01E36F |

CODE_01E377:
  RTS                                       ; $01E377 |

  JSR CODE_01E3AF                           ; $01E378 |
  REP #$20                                  ; $01E37B |
  LDA $0D25                                 ; $01E37D |
  SEC                                       ; $01E380 |
  SBC $0D23                                 ; $01E381 |
  CMP #$0008                                ; $01E384 |
  BCS CODE_01E3A4                           ; $01E387 |
  INC $0B4E                                 ; $01E389 |
  INC $0B4E                                 ; $01E38C |
  INC $0B57                                 ; $01E38F |
  INC $0B57                                 ; $01E392 |
  JSL clear_all_sprites                     ; $01E395 |
  JSL $008259                               ; $01E399 |
  SEP #$20                                  ; $01E39D |
  LDA #$20                                  ; $01E39F |
  STA !r_reg_hdmaen_mirror                  ; $01E3A1 |

CODE_01E3A4:
  SEP #$20                                  ; $01E3A4 |
  RTS                                       ; $01E3A6 |

  dw $0008, $FFF8                           ; $01E3A7 |

  dw $0002, $FFFE                           ; $01E3AB |

CODE_01E3AF:
  REP #$30                                  ; $01E3AF |
  LDA $0B4E                                 ; $01E3B1 |
  AND #$0002                                ; $01E3B4 |
  TAY                                       ; $01E3B7 |
  LDX #$0000                                ; $01E3B8 |
  LDA #$00FF                                ; $01E3BB |

CODE_01E3BE:
  CPX $0D23                                 ; $01E3BE |
  BCS CODE_01E3CD                           ; $01E3C1 |
  STA $703A02,x                             ; $01E3C3 |
  INX                                       ; $01E3C7 |
  INX                                       ; $01E3C8 |
  INX                                       ; $01E3C9 |
  INX                                       ; $01E3CA |
  BRA CODE_01E3BE                           ; $01E3CB |

CODE_01E3CD:
  LDA $0D21                                 ; $01E3CD |

CODE_01E3D0:
  CPX $0D25                                 ; $01E3D0 |
  BCS CODE_01E3DF                           ; $01E3D3 |
  STA $703A02,x                             ; $01E3D5 |
  INX                                       ; $01E3D9 |
  INX                                       ; $01E3DA |
  INX                                       ; $01E3DB |
  INX                                       ; $01E3DC |
  BRA CODE_01E3D0                           ; $01E3DD |

CODE_01E3DF:
  LDA #$00FF                                ; $01E3DF |

CODE_01E3E2:
  CPX #$0348                                ; $01E3E2 |
  BCS CODE_01E3F1                           ; $01E3E5 |
  STA $703A02,x                             ; $01E3E7 |
  INX                                       ; $01E3EB |
  INX                                       ; $01E3EC |
  INX                                       ; $01E3ED |
  INX                                       ; $01E3EE |
  BRA CODE_01E3E2                           ; $01E3EF |

CODE_01E3F1:
  LDA #$FF00                                ; $01E3F1 |

CODE_01E3F4:
  CPX #$0348                                ; $01E3F4 |
  BCS CODE_01E403                           ; $01E3F7 |
  STA $703A02,x                             ; $01E3F9 |
  INX                                       ; $01E3FD |
  INX                                       ; $01E3FE |
  INX                                       ; $01E3FF |
  INX                                       ; $01E400 |
  BRA CODE_01E3F4                           ; $01E401 |

CODE_01E403:
  LDA $0D23                                 ; $01E403 |
  CLC                                       ; $01E406 |
  ADC $E3A7,y                               ; $01E407 |
  STA $0D23                                 ; $01E40A |
  LDA $0D25                                 ; $01E40D |
  SEC                                       ; $01E410 |
  SBC $E3A7,y                               ; $01E411 |
  STA $0D25                                 ; $01E414 |
  SEP #$30                                  ; $01E417 |
  LDA $0D21                                 ; $01E419 |
  CLC                                       ; $01E41C |
  ADC $E3AB,y                               ; $01E41D |
  STA $0D21                                 ; $01E420 |
  LDA $0D22                                 ; $01E423 |
  SEC                                       ; $01E426 |
  SBC $E3AB,y                               ; $01E427 |
  STA $0D22                                 ; $01E42A |
  JSL $00BE39                               ; $01E42D |

  dw $56D0, $027E, $703A, $0348             ; $01E431 |

  LDA !r_reg_hdmaen_mirror                  ; $01E439 |
  ORA #$20                                  ; $01E43C |
  STA !r_reg_hdmaen_mirror                  ; $01E43E |
  RTS                                       ; $01E441 |

  REP #$30                                  ; $01E442 |
  LDX #$0000                                ; $01E444 |
  LDA #$00FF                                ; $01E447 |

CODE_01E44A:
  STA $703A02,x                             ; $01E44A |
  INX                                       ; $01E44E |
  INX                                       ; $01E44F |
  INX                                       ; $01E450 |
  INX                                       ; $01E451 |
  CPX #$0348                                ; $01E452 |
  BCC CODE_01E44A                           ; $01E455 |
  SEP #$30                                  ; $01E457 |
  JSL $00BE39                               ; $01E459 |

  dw $56D0, $027E, $703A, $0348             ; $01E45D |

  LDA #$09                                  ; $01E465 |
  STA !r_reg_bgmode_mirror                  ; $01E467 |
  LDA #$69                                  ; $01E46A |
  STA !r_reg_bg1sc_mirror                   ; $01E46C |
  LDA #$34                                  ; $01E46F |
  STA !r_reg_bg3sc_mirror                   ; $01E471 |
  LDA #$02                                  ; $01E474 |
  STA !r_interrupt_mode                     ; $01E476 |
  LDA #$20                                  ; $01E479 |
  STA !r_reg_cgadsub_mirror                 ; $01E47B |
  REP #$20                                  ; $01E47E |
  STZ $0D2D                                 ; $01E480 |
  STZ $0D2B                                 ; $01E483 |
  STZ !s_opt_mode                           ; $01E486 |
  LDA #$0277                                ; $01E489 |
  STA !r_reg_bg12nba_mirror                 ; $01E48C |
  STZ $39                                   ; $01E48F |
  STZ $3B                                   ; $01E491 |
  STZ $41                                   ; $01E493 |
  STZ $43                                   ; $01E495 |
  SEP #$20                                  ; $01E497 |
  INC $0B57                                 ; $01E499 |
  INC $0B57                                 ; $01E49C |
  RTS                                       ; $01E49F |

  JSR CODE_01E3AF                           ; $01E4A0 |
  REP #$20                                  ; $01E4A3 |
  LDA $0D23                                 ; $01E4A5 |
  BPL CODE_01E4D1                           ; $01E4A8 |
  INC $0B57                                 ; $01E4AA |
  INC $0B57                                 ; $01E4AD |
  STZ $0392                                 ; $01E4B0 |
  STZ $0B5F                                 ; $01E4B3 |
  STZ $0B61                                 ; $01E4B6 |
  STZ $0B63                                 ; $01E4B9 |
  STZ $0381                                 ; $01E4BC |
  STZ !r_reg_tmw_mirror                     ; $01E4BF |
  STZ !r_reg_w12sel_mirror                  ; $01E4C2 |
  STZ !r_reg_w34sel_mirror                  ; $01E4C5 |
  SEP #$20                                  ; $01E4C8 |
  LDA #$30                                  ; $01E4CA |
  STA $038B                                 ; $01E4CC |
  REP #$20                                  ; $01E4CF |

CODE_01E4D1:
  SEP #$20                                  ; $01E4D1 |
  LDA #$20                                  ; $01E4D3 |
  STA !r_reg_hdmaen_mirror                  ; $01E4D5 |
  RTS                                       ; $01E4D8 |

; item memory page pointers
  dw $03C0, $0440, $04C0, $0540             ; $01E4D9 |

  dw $8000, $4000, $2000, $1000             ; $01E4E1 |
  dw $0800, $0400, $0200, $0100             ; $01E4E9 |
  dw $0080, $0040, $0020, $0010             ; $01E4F1 |
  dw $0008, $0004, $0002, $0001             ; $01E4F9 |

  PHX                                       ; $01E501 |
  TXA                                       ; $01E502 |
  AND #$001E                                ; $01E503 |
  TAX                                       ; $01E506 |
  LDA $01E4E1,x                             ; $01E507 |
  STA $02                                   ; $01E50B |
  LDA !r_header_item_memory                 ; $01E50D |
  ASL A                                     ; $01E510 |
  TAX                                       ; $01E511 |
  LDA $01E4D9,x                             ; $01E512 |
  STA $00                                   ; $01E516 |
  PLX                                       ; $01E518 |
  LDA $1B                                   ; $01E519 |
  XBA                                       ; $01E51B |
  AND #$00FF                                ; $01E51C |
  TAY                                       ; $01E51F |
  LDA !s_screen_num_to_id,y                 ; $01E520 |
  AND #$003F                                ; $01E523 |
  ASL A                                     ; $01E526 |
  TAY                                       ; $01E527 |
  LDA ($00),y                               ; $01E528 |
  AND $02                                   ; $01E52A |
  RTL                                       ; $01E52C |

gamemode33:
  JSL init_oam_and_bg3_tilemap              ; $01E52D |
  JSL clear_basic_states                    ; $01E531 |
  LDA #$2E                                  ; $01E535 |
  STA $704070                               ; $01E537 |
  JSR CODE_01E59A                           ; $01E53B |
  JML $1083E2                               ; $01E53E |

; Retry screen tilemap queue entries
; init entry
  dw $3400, $47FF, $2A6E                    ; $01E542 |

; tilemap transfer entry
; to VRAM address $3485 (one row)
  dw $3485, $000F                           ; $01E548 |
; data to transfer
  dw $2A00, $2A02, $2A04, $2A06             ; $01E54C |
  dw $2A08, $2A0A, $2A0C, $2A0E             ; $01E554 |

; tilemap transfer entry
; to VRAM address $34A5 (one row)
  dw $34A5, $000F                           ; $01E55C |
; data to transfer
  dw $2A20, $2A22, $2A24, $2A26             ; $01E560 |
  dw $2A28, $2A2A, $2A2C, $2A2E             ; $01E568 |

; tilemap transfer entry
; to VRAM address $34C5 (one row)
  dw $34C5, $000F                           ; $01E570 |
; data to transfer
  dw $2A40, $2A42, $2A44, $2A46             ; $01E574 |
  dw $2A48, $2A4A, $2A4C, $2A4E             ; $01E57C |

; tilemap transfer entry
; to VRAM address $34E5 (one row)
  dw $34E5, $000F                           ; $01E584 |
; data to transfer
  dw $2A60, $2A62, $2A64, $2A66             ; $01E588 |
  dw $2A68, $2A6A, $2A6C, $2A6E             ; $01E590 |

; end marker
  dw $FFFF                                  ; $01E598 |


CODE_01E59A:
  JSL clear_all_sprites                     ; $01E59A |
  JSL $008259                               ; $01E59E | init OAM buffer
  LDX levelmode_index                       ; $01E5A2 |
  JSL init_scene_regs                       ; $01E5A5 |
  LDX #$70                                  ; $01E5A9 |
  PHX                                       ; $01E5AB |
  PLB                                       ; $01E5AC |
  REP #$20                                  ; $01E5AD |
  LDX #$7E                                  ; $01E5AF |

CODE_01E5B1:
  STZ $2000,x                               ; $01E5B1 |
  STZ $2080,x                               ; $01E5B4 |
  STZ $2100,x                               ; $01E5B7 |
  STZ $2180,x                               ; $01E5BA |
  DEX                                       ; $01E5BD |
  DEX                                       ; $01E5BE |
  BPL CODE_01E5B1                           ; $01E5BF |
  LDA #$7FFF                                ; $01E5C1 |
  STA $2016                                 ; $01E5C4 |
  SEP #$20                                  ; $01E5C7 |
  PHK                                       ; $01E5C9 |
  PLB                                       ; $01E5CA |
  LDA #$1E                                  ; $01E5CB |
  STA $0127                                 ; $01E5CD |
  JSL prepare_tilemap_dma_queue_l           ; $01E5D0 |
  JSR CODE_01E689                           ; $01E5D4 |
  LDA #$02                                  ; $01E5D7 |
  STA !r_irq_count                          ; $01E5D9 |
  LDA #$50                                  ; $01E5DC |
  STA !reg_htimel                           ; $01E5DE |
  LDA #$D8                                  ; $01E5E1 |
  LDA #$B1                                  ; $01E5E3 |
  STA !reg_nmitimen                         ; $01E5E5 |
  RTS                                       ; $01E5E8 |

gamemode35:
  LDA #$2E                                  ; $01E5E9 |
  STA $704070                               ; $01E5EB |
  JSR CODE_01E689                           ; $01E5EF |
  LDA !r_joy1_lo_press_mirror               ; $01E5F2 |
  AND #$80                                  ; $01E5F5 |
  ORA !r_joy1_hi_press_mirror               ; $01E5F7 |
  AND #$90                                  ; $01E5FA |
  BNE CODE_01E601                           ; $01E5FC |
  JMP CODE_01E687                           ; $01E5FE |

CODE_01E601:
  LDA !r_joy1_lo_press_mirror               ; $01E601 |
  AND #$80                                  ; $01E604 |
  BNE CODE_01E612                           ; $01E606 |
  LDA $704094                               ; $01E608 |
  TAX                                       ; $01E60C |
  LDA $E6B7,x                               ; $01E60D |
  STA $53                                   ; $01E610 |

CODE_01E612:
  LDA #$10                                  ; $01E612 |
  STA $8F                                   ; $01E614 |
  INC !r_game_mode                          ; $01E616 |
  STZ !r_level_load_type                    ; $01E619 |
  TXA                                       ; $01E61C |
  BNE CODE_01E687                           ; $01E61D |
  LDA #$01                                  ; $01E61F |
  STA !r_level_load_type                    ; $01E621 |
  JSR CODE_01B292                           ; $01E624 |
  REP #$20                                  ; $01E627 |
  STZ !s_magnify_glass_flag                 ; $01E629 |
  STZ $03A1                                 ; $01E62C |
  STZ $03A3                                 ; $01E62F |
  STZ $03A5                                 ; $01E632 |
  LDA !r_stars_amount                       ; $01E635 |

CODE_01E638:
  CMP #$0064                                ; $01E638 |
  BCC CODE_01E645                           ; $01E63B |
  SBC #$0064                                ; $01E63D |
  INC $03A1                                 ; $01E640 |
  BRA CODE_01E638                           ; $01E643 |

CODE_01E645:
  CMP #$000A                                ; $01E645 |
  BCC .middlering_entrance                  ; $01E648 |
  SBC #$000A                                ; $01E64A |
  INC $03A3                                 ; $01E64D |
  BRA CODE_01E645                           ; $01E650 |

.middlering_entrance
  STA $03A5                                 ; $01E652 |
  PHB                                       ; $01E655 |\
  LDY #$17                                  ; $01E656 | | bank 17 data bank
  PHY                                       ; $01E658 | | (for midring tables)
  PLB                                       ; $01E659 |/
  REP #$30                                  ; $01E65A |\ set hardcoded screen exit to 0
  STZ !r_cur_screen_exit                    ; $01E65C |/ to be used for midring "exit"
  LDA !r_cur_stage                          ; $01E65F |\
  ASL A                                     ; $01E662 | | y = level # * 2
  TAY                                       ; $01E663 |/
  LDA !r_cur_item_mem_page                  ; $01E664 |\
  ASL A                                     ; $01E667 | | read from midring pointer table
  ASL A                                     ; $01E668 | | at level * 2 + item page * 4
  ADC $F551,y                               ; $01E669 | | -> y
  TAY                                       ; $01E66C |/
  LDA $F5DC,y                               ; $01E66D |\ midring X, Y coordinates
  STA $7F7E01                               ; $01E670 |/ -> screen exit 0 X, Y
  SEP #$20                                  ; $01E674 |\
  LDA $F5DB,y                               ; $01E676 | | midring sublevel #
  STA $7F7E00                               ; $01E679 |/  -> screen exit 0 sublevel
  LDA $F5DE,y                               ; $01E67D |\ midring entrance type
  STA $7F7E03                               ; $01E680 |/ -> screen exit 0 entrance type
  SEP #$10                                  ; $01E684 |
  PLB                                       ; $01E686 |

CODE_01E687:
  PLB                                       ; $01E687 |
  RTL                                       ; $01E688 |

CODE_01E689:
  JSR CODE_01E180                           ; $01E689 |
  LDA $704094                               ; $01E68C |
  TAX                                       ; $01E690 |
  REP #$30                                  ; $01E691 |
  LDA #$0000                                ; $01E693 |
  STA $7E4000                               ; $01E696 |
  DEC A                                     ; $01E69A |
  STA $7E4002                               ; $01E69B |
  SEP #$30                                  ; $01E69F |
  RTS                                       ; $01E6A1 |

gamemode3B:
  JSL init_oam_and_bg3_tilemap              ; $01E6A2 |
  JSL clear_basic_states                    ; $01E6A6 |
  LDA #$21                                  ; $01E6AA |
  STA $704070                               ; $01E6AC |
  JSR CODE_01E59A                           ; $01E6B0 |
  JML $1083E2                               ; $01E6B3 |

  db $43, $2E                               ; $01E6B7 |

gamemode3D:
  LDA #$21                                  ; $01E6B9 |
  STA $704070                               ; $01E6BB |
  JSR CODE_01E689                           ; $01E6BF |
  LDA !r_joy1_lo_press_mirror               ; $01E6C2 |
  AND #$80                                  ; $01E6C5 |
  ORA !r_joy1_hi_press_mirror               ; $01E6C7 |
  AND #$90                                  ; $01E6CA |
  BEQ CODE_01E6EC                           ; $01E6CC |
  LDA !r_joy1_lo_press_mirror               ; $01E6CE |
  AND #$80                                  ; $01E6D1 |
  BNE CODE_01E6DF                           ; $01E6D3 |
  LDA $704094                               ; $01E6D5 |
  TAX                                       ; $01E6D9 |
  LDA $E6B7,x                               ; $01E6DA |
  STA $53                                   ; $01E6DD |

CODE_01E6DF:
  INC !r_game_mode                          ; $01E6DF |
  LDA #$10                                  ; $01E6E2 |
  STA $8F                                   ; $01E6E4 |
  TXA                                       ; $01E6E6 |
  BNE CODE_01E6EC                           ; $01E6E7 |
  STZ !r_level_load_type                    ; $01E6E9 |

CODE_01E6EC:
  PLB                                       ; $01E6EC |
  RTL                                       ; $01E6ED |

  db $0B, $1F                               ; $01E6EE |

gamemode36:
  DEC $8F                                   ; $01E6F0 |
  BNE CODE_01E70F                           ; $01E6F2 |
  LDA $704094                               ; $01E6F4 |
  TAX                                       ; $01E6F8 |
  LDA $E6EE,x                               ; $01E6F9 |
  STA !r_game_mode                          ; $01E6FC |
  DEX                                       ; $01E6FF |
  BMI CODE_01E70C                           ; $01E700 |
  LDA !r_cur_stage                          ; $01E702 |
  CMP #$0B                                  ; $01E705 |
  BNE CODE_01E70C                           ; $01E707 |
  STZ !r_cur_stage                          ; $01E709 |

CODE_01E70C:
  STZ !r_spc_block_set                      ; $01E70C |

CODE_01E70F:
  PLB                                       ; $01E70F |
  RTL                                       ; $01E710 |

; BG2 tilemap indices
; indexed by level header * 2
; indexes into $01E751 table
bg2_tilemap_indices:
  dw $0000, $0002, $0004, $0006             ; $01E711 |
  dw $0008, $000A, $003D, $003F             ; $01E719 |
  dw $0041, $0043, $0045, $0047             ; $01E721 |
  dw $0049, $004B, $004D, $004F             ; $01E729 |
  dw $0087, $0089, $008B, $008D             ; $01E731 |
  dw $0099, $009B, $009D, $009F             ; $01E739 |
  dw $009F, $00A1, $00A3, $00A5             ; $01E741 |
  dw $00A7, $00AB, $00AD, $00AF             ; $01E749 |

; BG2 tilemap table
; if type of entry is $00 then just two bytes, else if $04 it's 6 bytes ($02 is unimplemented)
; byte [1]   : type of entry ($04 is parallax)
; byte [2]   : gfx file to transfer
; byte [3]   : BG2 HDMA enable ($7E0D2B)
; byte [4]   : unused
; byte [5:6] : pointer to table ($7E0D2F)
bg2_tilemap_gfx_entries:
  db $00,$BE                                ; $01E751 | header: $00
  db $00,$BF                                ; $01E753 | header: $01
  db $00,$C0                                ; $01E755 | header: $02
  db $00,$C1                                ; $01E757 | header: $03
  db $00,$C2                                ; $01E759 | header: $04
  db $04,$C3,$01,$00,$61,$E7                ; $01E75B | header: $05

  db $00, $B0, $00, $F7, $02, $00, $A0, $00 ; $01E761 | bg2 parallax hdma data?
  db $07, $03, $00, $90, $00, $17, $03, $00 ; $01E769 | for BG2 header $05
  db $80, $00, $27, $03, $00, $70, $00, $37 ; $01E771 | 
  db $03, $00, $60, $00, $47, $03, $00, $50 ; $01E779 | 
  db $00, $57, $03, $00, $40, $00, $67, $03 ; $01E781 | 
  db $00, $C0, $00, $00, $08                ; $01E789 | 

  db $00,$C4                                ; $01E78E | header: $06
  db $00,$C5                                ; $01E790 | header: $07
  db $00,$C6                                ; $01E792 | header: $08
  db $00,$CD                                ; $01E794 | header: $09
  db $00,$C7                                ; $01E796 | header: $0A
  db $00,$C8                                ; $01E798 | header: $0B
  db $00,$C9                                ; $01E79A | header: $0C
  db $00,$CA                                ; $01E79C | header: $0D
  db $00,$CB                                ; $01E79E | header: $0E
  db $04,$CC,$01,$00,$A6,$E7                ; $01E7A0 | header: $0F

  db $00,$28,$00,$97,$01,$00,$16,$00        ; $01E7A6 | bg2 parallax hdma data?
  db $B7,$01,$00,$28,$00,$D7,$01,$00        ; $01E7AE | for header $0F
  db $16,$00,$F7,$01,$00,$28,$00,$17        ; $01E7B6 | 
  db $02,$00,$16,$00,$37,$02,$00,$28        ; $01E7BE | 
  db $00,$57,$02,$00,$28,$00,$77,$02        ; $01E7C6 | 
  db $00,$40,$00,$B7,$02,$00,$80,$00        ; $01E7CE | 
  db $00,$04                                ; $01E7D6 | 

  db $00,$CD                                ; $01E7D8 | header: $10
  db $00,$CC                                ; $01E7DA | header: $11
  db $00,$CE                                ; $01E7DC | header: $12
  db $00,$CF                                ; $01E7DE | header: $13

; unused ??
  db $01,$02,$C7,$02,$04,$57,$03,$02        ; $01E7E0 | unused?
  db $00,$04                                ; $01E7E8 | unused?

  db $00,$D0                                ; $01E7EA | header: $14
  db $00,$D1                                ; $01E7EC | header: $15
  db $00,$D7                                ; $01E7EE | header: $16
  db $00,$D2                                ; $01E7F0 | header: $17 & $18
  db $00,$D3                                ; $01E7F2 | header: $19
  db $00,$D4                                ; $01E7F4 | header: $1A
  db $00,$D5                                ; $01E7F6 | header: $1B
  db $04,$D6,$00,$00                        ; $01E7F8 | header: $1C
  db $00,$D9                                ; $01E7FC | header: $1D (part of $1C)
  db $00,$DA                                ; $01E7FE | header: $1E
  db $00,$DB                                ; $01E800 | header: $1F

; unused ??
  db $00,$76,$00,$6E,$00,$66,$00,$5E        ; $01E802 | unused?

; TODO: document
; Loads BG2 tilemap for current level header
load_bg2_tilemap:
  LDA !r_header_level_mode                  ; $01E80A |
  CMP #$0A                                  ; $01E80D |\
  BNE .setup                                ; $01E80F | | Check for kamek autoscroll mode
  JMP .level_mode_0A_tilemap                ; $01E811 |/  Even though this is not called during it

.setup
  STZ $0D2B                                 ; $01E814 |\ Clear BG2 HDMA flags
  STZ $0D2D                                 ; $01E817 |/
  STZ $0D37                                 ; $01E81A |\ Clear BG2 fuzzy wave amplitude
  STZ $0D39                                 ; $01E81D |/
  REP #$30                                  ; $01E820 |\
  LDA !r_header_bg2_tileset                 ; $01E822 | |
  ASL A                                     ; $01E825 | | bg2 header as index 
  TAX                                       ; $01E826 |/
  LDY bg2_tilemap_indices,x                 ; $01E827 |  get index for gfx table
  LDA bg2_tilemap_gfx_entries,y             ; $01E82A |\ get type of entry
  AND #$00FF                                ; $01E82D |/
  TAX                                       ; $01E830 |\
  JMP (.entry_ptr,x)                        ; $01E831 |/ first byte determines entry point

.entry_ptr
  dw .transfer_tilemap                      ; $01E834 |
  dw $0000                                  ; $01E836 |
  dw .setup_parallax                        ; $01E838 |

.setup_parallax
  SEP #$20                                  ; $01E83A |
  LDA #$0F                                  ; $01E83C |\
  STA $4341                                 ; $01E83E |/ Set BG2 scroll HDMA ch 4
  LDA $E753,y                               ; $01E841 |\
  STA $0D2B                                 ; $01E844 |/ BG2 HDMA parallax enable
  REP #$20                                  ; $01E847 | 
  LDA $E755,y                               ; $01E849 |\
  STA $0D2F                                 ; $01E84C |/ BG2 HDMA parallax data table
.transfer_tilemap
  LDA $E752,y                               ; $01E84F |\ file # from
  AND #$00FF                                ; $01E852 |/ second byte of entry 
  LDX #$5800                                ; $01E855 | SRAM destination
  JSL decompress_lc_lz1_l_x                 ; $01E858 |
  STA $4305                                 ; $01E85C | Size of file
  SEP #$10                                  ; $01E85F |
  LDX #$80                                  ; $01E861 |
  STX !reg_vmain                            ; $01E863 |
  LDA #$3800                                ; $01E866 |\
  STA !reg_vmadd                            ; $01E869 |/  BG2 tilemap destination
  LDA #$1801                                ; $01E86C |\  VRAM register dest and
  STA $4300                                 ; $01E86F |/  2 registers write once
  LDA #$5800                                ; $01E872 |\
  STA $4302                                 ; $01E875 | |
  LDX #$70                                  ; $01E878 | | Set source as $705800
  STX $4304                                 ; $01E87A |/
  LDX #$01                                  ; $01E87D |\
  STX !reg_mdmaen                           ; $01E87F |/  Enable transfer
  SEP #$20                                  ; $01E882 |
  LDA !r_header_level_mode                  ; $01E884 |\
  CMP #$03                                  ; $01E887 | | If OPT level mode
  BNE .ret                                  ; $01E889 | | Else leave
  JSR .opt_mode                             ; $01E88B |/

.ret
  RTS                                       ; $01E88E |

; kamek autoscroll (level mode $0A) code
; should be dead code as BG2 tilemap transfer is never executed during mode $0A
.level_mode_0A_tilemap
  REP #$30                                  ; $01E88F |
  LDA #$00F2                                ; $01E891 |\
  AND #$00FF                                ; $01E894 | | decompress graphics file $F2
  LDX #$5800                                ; $01E897 | | to $705800
  JSL decompress_lc_lz1_l_x                 ; $01E89A |/
  STA $4305                                 ; $01E89E | Set size
  SEP #$10                                  ; $01E8A1 |
  LDX #$80                                  ; $01E8A3 |
  STX !reg_vmain                            ; $01E8A5 |
  LDA #$3800                                ; $01E8A8 |\
  STA !reg_vmadd                            ; $01E8AB |/ BG2 tilemap VRAM destination
  LDA #$1801                                ; $01E8AE |\ VRAM register dest and
  STA $4300                                 ; $01E8B1 |/ 2 registers write once
  LDA #$5800                                ; $01E8B4 |\
  STA $4302                                 ; $01E8B7 | |
  LDX #$70                                  ; $01E8BA | | Set source as $705800
  STX $4304                                 ; $01E8BC |/
  LDX #$01                                  ; $01E8BF |\
  STX !reg_mdmaen                           ; $01E8C1 |/  Enable transfer
  SEP #$20                                  ; $01E8C4 |
  RTS                                       ; $01E8C6 |

  dw $8000, $0000, $0208, $0001             ; $01E8C7 | BG2 HDMA table for fuzzy
  dw $FF08                                  ; $01E8CF |

; Special hardcoded settings for OPT levels'
; No BG2 parallax effects (in case of fuzzy effect)
.opt_mode
  LDA #$0F                                  ; $01E8D1 |\
  STA $4341                                 ; $01E8D3 | | set HDMA channel 3 & 4
  LDA #$10                                  ; $01E8D6 | | to BG2 horiz./vert. scroll
  STA $4331                                 ; $01E8D8 |/
  STZ $0D2B                                 ; $01E8DB |\ Clear out any parallax enables
  STZ $0D2D                                 ; $01E8DE |/
  REP #$20                                  ; $01E8E1 |
  LDA #$E8C7                                ; $01E8E3 |\
  STA $0D2F                                 ; $01E8E6 |/ Hardcode table to $E8C7
  LDA #$E8CD                                ; $01E8E9 |\
  STA $0D31                                 ; $01E8EC |/ Hardcode table to $E8CD
  SEP #$20                                  ; $01E8EF |
  RTS                                       ; $01E8F1 |

; BG3 tilemap init queue entries
; $800 bytes to $3400 (VRAM)
; third entry what to init with
  dw $3400, $47FF, $01CE, $FFFF             ; $01E8F2 | empty tileset
  dw $3400, $47FF, $0111, $FFFF             ; $01E8FA | Shark Chomp
  dw $3400, $47FF, $01CE, $FFFF             ; $01E902 | Water (low)

; bg3 tilemap table
; format is (word, byte)
; word is LC_LZ1 graphics file
; third byte is for either:
;   $00 = do nothing
;   Special routine if $80-$88
;   Otherwise disable BG3 on main/subscreen if negative
;   Otherwise read settings from $01E9AE ($01-$7F) and unpack HDMA table
bg3_tilemap_table:
  db $DC, $00, $01                          ; $01E90A | header: $01
  db $DD, $00, $FF                          ; $01E90D | header: $02
  db $E5, $00, $00                          ; $01E910 | header: $03
  db $E5, $00, $00                          ; $01E913 | header: $04
  db $DE, $00, $FF                          ; $01E916 | header: $05
  db $DF, $00, $FF                          ; $01E919 | header: $06
  db $E0, $00, $FF                          ; $01E91C | header: $07
  db $E4, $00, $FF                          ; $01E91F | header: $08
  db $00, $00, $00                          ; $01E922 | header: $09
  db $00, $00, $00                          ; $01E925 | header: $0A
  db $E1, $00, $FF                          ; $01E928 | header: $0B
  db $E6, $00, $00                          ; $01E92B | header: $0C
  db $E7, $00, $00                          ; $01E92E | header: $0D
  db $E8, $00, $1B                          ; $01E931 | header: $0E
  db $E9, $00, $26                          ; $01E934 | header: $0F
  db $EA, $00, $00                          ; $01E937 | header: $10
  db $EB, $00, $FF                          ; $01E93A | header: $11
  db $EC, $00, $00                          ; $01E93D | header: $12
  db $ED, $00, $80                          ; $01E940 | header: $13
  db $EE, $00, $31                          ; $01E943 | header: $14
  db $EF, $00, $00                          ; $01E946 | header: $15
  db $F0, $00, $00                          ; $01E949 | header: $16
  db $F1, $00, $00                          ; $01E94C | header: $17
  db $F2, $00, $00                          ; $01E94F | header: $18
  db $F3, $00, $00                          ; $01E952 | header: $19
  db $F4, $00, $00                          ; $01E955 | header: $1A
  db $F5, $00, $00                          ; $01E958 | header: $1B
  db $F6, $00, $00                          ; $01E95B | header: $1C
  db $ED, $00, $3C                          ; $01E95E | header: $1D
  db $F7, $00, $81                          ; $01E961 | header: $1E
  db $F8, $00, $00                          ; $01E964 | header: $1F
  db $F9, $00, $82                          ; $01E967 | header: $20
  db $FB, $00, $00                          ; $01E96A | header: $21
  db $FC, $00, $83                          ; $01E96D | header: $22
  db $FD, $00, $84                          ; $01E970 | header: $23
  db $FE, $00, $85                          ; $01E973 | header: $24
  db $FF, $00, $00                          ; $01E976 | header: $25
  db $00, $01, $00                          ; $01E979 | header: $26
  db $01, $01, $00                          ; $01E97C | header: $27
  db $02, $01, $00                          ; $01E97F | header: $28
  db $03, $01, $00                          ; $01E982 | header: $29
  db $04, $01, $86                          ; $01E985 | header: $2A
  db $05, $01, $00                          ; $01E988 | header: $2B
  db $06, $01, $87                          ; $01E98B | header: $2C
  db $06, $01, $00                          ; $01E98E | header: $2D
  db $07, $01, $00                          ; $01E991 | header: $2E
  db $08, $01, $00                          ; $01E994 | header: $2F

; unused data?
  db $00, $00, $00                          ; $01E997 | 
  db $00, $00, $00                          ; $01E99A |
  db $00, $00, $00                          ; $01E99D |
  db $00, $00, $00                          ; $01E9A0 |
  db $00, $00, $00                          ; $01E9A3 |
  db $00, $00, $00                          ; $01E9A6 |
  db $00, $00, $00                          ; $01E9A9 |
  db $00, $00, $00                          ; $01E9AC |

; header: $01
  db $02, $10, $00                          ; $01E9AF |
  db $04, $10, $00                          ; $01E9B2 |
  db $04, $10, $00                          ; $01E9B5 |
  db $04, $10, $00                          ; $01E9B8 |
  db $04, $10, $00                          ; $01E9BB |
  db $04, $10, $00                          ; $01E9BE |
  db $04, $10, $00                          ; $01E9C1 |
  db $04, $12, $10                          ; $01E9C4 |
  db $00, $00                               ; $01E9C7 |

; header: $0E
  db $06                                    ; $01E9C9 |
  db $8A, $00, $04                          ; $01E9CA |
  db $0A, $00, $04                          ; $01E9CD |
  db $16, $0A, $06                          ; $01E9D0 |
  db $00                                    ; $01E9D3 |
; header: $0F
  db $06, $8A                               ; $01E9D4 |
  db $00, $04, $09                          ; $01E9D6 |
  db $00, $04, $17                          ; $01E9D9 |
  db $09, $06, $00                          ; $01E9DC |
; header: $14
  db $06, $90, $00                          ; $01E9DF |
  db $04, $06, $0D                          ; $01E9E2 |
  db $04, $0C, $13                          ; $01E9E5 |
  db $06, $00                               ; $01E9E8 |
; header: $1D
  db $06                                    ; $01E9EA |
  db $F5, $00, $04                          ; $01E9EB |
  db $81, $01, $04                          ; $01E9EE |
  db $89, $02, $04                          ; $01E9F1 |
  db $00                                    ; $01E9F4 |

; Load BG3 tilemap based on BG3 header
; check for special settings for HDMA tables or adjusting tilemap
load_bg3_tilemap:
  LDY #$09                                  ; $01E9F5 |\  Y = tilemap init data of $01E8F2
  LDA !r_header_bg3_tileset                 ; $01E9F7 | | If no BG3 tileset ($00)
  BEQ .init_tilemap                         ; $01E9FA |/  Branch and init a tilemap
  ASL A                                     ; $01E9FC |\
  ADC !r_header_bg3_tileset                 ; $01E9FD | | BG3 header * 3 as index
  TAY                                       ; $01EA00 |/
  REP #$20                                  ; $01EA01 |\
  LDA bg3_tilemap_table-3,y                 ; $01EA03 | | get graphics file
  BEQ .ret                                  ; $01EA06 |/  if file is $00 then just return
  REP #$10                                  ; $01EA08 |
  LDX #$5800                                ; $01EA0A | SRAM destination
  PHY                                       ; $01EA0D | Push and save index
  JSL decompress_lc_lz1_l_x                 ; $01EA0E | decompress bg3 graphics file
  PLY                                       ; $01EA12 | Pull and restore index
  LDX !r_header_bg3_tileset                 ; $01EA13 |\
  CPX #$0016                                ; $01EA16 | | If not Shark Chomp branch past
  BNE .transfer_tilemap                     ; $01EA19 |/
  LDX #$5DA6                                ; $01EA1B |\
  STX $20                                   ; $01EA1E | | Shark Chomp BG3 tilemap copy from SRAM to RAM
  LDX #$007E                                ; $01EA20 | | 
  STX $22                                   ; $01EA23 | | $7E5DA6 destination
  LDX #$5800                                ; $01EA25 | | 
  STX $23                                   ; $01EA28 | |
  LDX #$0070                                ; $01EA2A | | $705800 source
  STX $25                                   ; $01EA2D | |
  SEP #$10                                  ; $01EA2F | |
  JSL dma_wram_gen_purpose                  ; $01EA31 | | Size from decompress
  SEP #$20                                  ; $01EA35 |/
  LDY #$1B                                  ; $01EA37 |\  Init from $01E8FA

.init_tilemap
  STY $0127                                 ; $01EA39 | | Init a BG3 tilemap
  JSL prepare_tilemap_dma_queue_l           ; $01EA3C |/

.ret
  SEP #$20                                  ; $01EA40 | LEAVE WHILE SHIGERU DOESN'T SEE YOU
  RTS                                       ; $01EA42 | HOLY SHIT HERE HE COMES LEAVE QUICKLY

.transfer_tilemap
  SEP #$10                                  ; $01EA43 |
  STA $4305                                 ; $01EA45 | decompressed size of tilemap
  STA $00                                   ; $01EA48 | Save size to $00
  LDX #$80                                  ; $01EA4A |
  STX !reg_vmain                            ; $01EA4C |
  LDA #$3400                                ; $01EA4F |\
  STA !reg_vmadd                            ; $01EA52 |/  VRAM destination $3400
  LDA #$1801                                ; $01EA55 |\
  STA $4300                                 ; $01EA58 |/  VRAM write destination
  LDA #$5800                                ; $01EA5B |\
  STA $4302                                 ; $01EA5E | |
  LDX #$70                                  ; $01EA61 | | Source $705800
  STX $4304                                 ; $01EA63 |/
  LDX #$01                                  ; $01EA66 |\
  STX !reg_mdmaen                           ; $01EA68 |/  Enable transfer
  LDA !r_header_level_mode                  ; $01EA6B |
  CMP #$000A                                ; $01EA6E |\  If level mode is Kamek Autoscroll 
  BNE .check_special_setting                ; $01EA71 | | else branch past
; dead code intended for level mode $0A
; as load_bg3_tilemap is branched past in gamemode $0C
  LDA $00                                   ; $01EA73 | | 
  STA $4305                                 ; $01EA75 | | Transfer size
  LDA #$0000                                ; $01EA78 | |
  STA !reg_vmadd                            ; $01EA7B | | VRAM destination $0000
  LDA #$5800                                ; $01EA7E | |
  STA $4302                                 ; $01EA81 | | Source $705800
  STX !reg_mdmaen                           ; $01EA84 |/  Enable transfer

.check_special_setting
  SEP #$20                                  ; $01EA87 |
  LDX bg3_tilemap_table-1,y                 ; $01EA89 |  Read byte 3 of table
  BEQ .ret                                  ; $01EA8C |  If zero do nothing and return
  CPX #$FF                                  ; $01EA8E |\
  BEQ .disable_layer                        ; $01EA90 |/ If $FF disable BG3 on screens
  TXA                                       ; $01EA92 |
  BPL .CODE_01EAA9                          ; $01EA93 |\  Branch If $01-$7F
  ASL A                                     ; $01EA95 | |  
  CMP #$10                                  ; $01EA96 | | If entry $80-$88 then execute special routine
  BCS .disable_layer                        ; $01EA98 | | otherwise disable BG3 layer
  TAX                                       ; $01EA9A | |
  JSR (bg3_special_routine,x)               ; $01EA9B | |
  BRA .ret                                  ; $01EA9E |/

.disable_layer
  LDA #$04                                  ; $01EAA0 |\
  TRB !r_reg_tm_mirror                      ; $01EAA2 | | Disable BG3 on main & subscreen 
  TRB !r_reg_ts_mirror                      ; $01EAA5 | | For BG3 meant to be toggled in level
  RTS                                       ; $01EAA8 |/ 

; some special HDMA table unpacking
; which sets screen designation and what registers to mirror scroll with
; Used by pond and 3-5 jungle BG3
; TODO
.CODE_01EAA9
  LDA $01E9AE,x                             ; $01EAA9 |\  Header byte
  STA $0D3B                                 ; $01EAAD |/  Set screen designation HDMA?
  PHB                                       ; $01EAB0 |\
  LDA #$70                                  ; $01EAB1 | |
  PHA                                       ; $01EAB3 | | Set data bank as $70
  PLB                                       ; $01EAB4 |/
  REP #$10                                  ; $01EAB5 |
  LDY #$0000                                ; $01EAB7 | table index
  STZ $08                                   ; $01EABA | clear $08 [loop counter]

.CODE_01EABC
  LDA $01E9AF,x                             ; $01EABC |\
  BEQ .CODE_01EB25                          ; $01EAC0 |/ If first byte $00, end of data
  STA $01                                   ; $01EAC2 | $01 = byte 1
  REP #$20                                  ; $01EAC4 |
  AND #$007F                                ; $01EAC6 |
  ASL A                                     ; $01EAC9 |
  ASL A                                     ; $01EACA |
  ASL A                                     ; $01EACB |
  ASL A                                     ; $01EACC |
  STA $02                                   ; $01EACD | $02 = byte 1 << 4
  LDA $01E9B0,x                             ; $01EACF | 
  AND #$00FF                                ; $01EAD3 |
  ASL A                                     ; $01EAD6 |\
  ASL A                                     ; $01EAD7 | |
  ASL A                                     ; $01EAD8 | | 
  ASL A                                     ; $01EAD9 | |
  STA $04                                   ; $01EADA |/ $04 = byte 2 << 4
  LDA $01E9B1,x                             ; $01EADC |
  AND #$00FF                                ; $01EAE0 |
  STA $06                                   ; $01EAE3 | $06 = byte 3

.CODE_01EAE5
  LDA $04                                   ; $01EAE5 |\
  SEC                                       ; $01EAE7 | |
  SBC $08                                   ; $01EAE8 | | Second entry = $04 - loop counter
  STA $3D4C,y                               ; $01EAEA |/
  LDA #$0010                                ; $01EAED |\
  BIT $00                                   ; $01EAF0 | | If first byte has sign bit on, branch
  BMI .CODE_01EAFE                          ; $01EAF2 |/
  LDA $04                                   ; $01EAF4 |\
  CLC                                       ; $01EAF6 | |
  ADC #$0010                                ; $01EAF7 | | $04 += $10
  STA $04                                   ; $01EAFA |/
  LDA $02                                   ; $01EAFC |

.CODE_01EAFE
  STA $3D4A,y                               ; $01EAFE | First entry = #$0010 transfer size signed, else $02
  LDA $08                                   ; $01EB01 |\
  CLC                                       ; $01EB03 | |
  ADC #$0010                                ; $01EB04 | | $08 += $10
  STA $08                                   ; $01EB07 |/
  LDA $06                                   ; $01EB09 |\
  STA $3D4E,y                               ; $01EB0B |/ Third entry = third byte
  TYA                                       ; $01EB0E |\
  CLC                                       ; $01EB0F | |
  ADC #$0006                                ; $01EB10 | | Add 6 to index
  TAY                                       ; $01EB13 |/
  LDA $02                                   ; $01EB14 |\
  SEC                                       ; $01EB16 | |
  SBC #$0010                                ; $01EB17 | | decrement $02 by one entry
  STA $02                                   ; $01EB1A |/
  BNE .CODE_01EAE5                          ; $01EB1C | if non-zero, keep unpacking
  SEP #$20                                  ; $01EB1E |\
  INX                                       ; $01EB20 | |
  INX                                       ; $01EB21 | | Increase X by 3
  INX                                       ; $01EB22 | | And start unpacking next entry
  BRA .CODE_01EABC                          ; $01EB23 |/

.CODE_01EB25
  PLB                                       ; $01EB25 |
  SEP #$10                                  ; $01EB26 |
  RTS                                       ; $01EB28 |

bg3_special_routine:
  dw bg3_low_water_adjust                   ; $01EB29 | BG3 header: $13
  dw setup_bg3_horiz_scroll_hdma            ; $01EB2B | BG3 header: $1E
  dw setup_bg3_screen_des_hdma              ; $01EB2D | BG3 header: $20
  dw setup_bg3_clouds_mist_hdma             ; $01EB2F | BG3 header: $22
  dw setup_bg3_sun_hdma                     ; $01EB31 | BG3 header: $23
  dw setup_bg3_transparency                 ; $01EB33 | BG3 header: $24
  dw setup_bg3_horiz_scroll_hdma            ; $01EB35 | BG3 header: $2A
  dw setup_bg3_wavy_mist_hdma               ; $01EB37 | BG3 header: $2C

; change these tables up or down to change water position
bg3_low_water_vram_ptr:
  dw $3740                                  ; $01EB39 |
bg3_low_water_vram_size:
  dw $0680                                  ; $01EB3B |
; Water (low) BG3 tilemap routine
; Clears up the whole tilemap and retransfers it aligned further down
bg3_low_water_adjust:
  PHX                                       ; $01EB3D | Save routine index
  LDY #$21                                  ; $01EB3E |\
  STY $0127                                 ; $01EB40 | | Init a clean tilemap ($01E902)
  JSL prepare_tilemap_dma_queue_l           ; $01EB43 |/
  PLA                                       ; $01EB47 | Pull routine index
  REP #$20                                  ; $01EB48 |
  AND #$00FF                                ; $01EB4A |\
  ASL A                                     ; $01EB4D | | Use as table index
  TAX                                       ; $01EB4E |/
  LDA bg3_low_water_vram_ptr,x              ; $01EB4F |\  Get VRAM address ($3740)
  STA !reg_vmadd                            ; $01EB52 |/ 
  LDA #$0800                                ; $01EB55 |\
  SEC                                       ; $01EB58 | | Transfer size from table
  SBC bg3_low_water_vram_size,x             ; $01EB59 | | ($0800 - $0680 = $0180)
  STA $4305                                 ; $01EB5C |/
  LDX #$80                                  ; $01EB5F |
  STX !reg_vmain                            ; $01EB61 |
  LDA #$1801                                ; $01EB64 |
  STA $4300                                 ; $01EB67 |
  LDX #$70                                  ; $01EB6A |\
  STX $4304                                 ; $01EB6C | | Set source as $705800
  LDA #$5800                                ; $01EB6F | |
  STA $4302                                 ; $01EB72 |/
  LDX #$01                                  ; $01EB75 |\
  STX !reg_mdmaen                           ; $01EB77 |/  Enable transfer
  SEP #$20                                  ; $01EB7A |
  RTS                                       ; $01EB7C |

  db $00, $20, $00, $07, $00, $00, $30, $00 ; $01EB7D | HDMA table generation data
  db $27, $00, $00, $20, $00, $37, $00, $00 ; $01EB85 |
  db $2E, $00, $57, $00, $00, $20, $00, $67 ; $01EB8D |
  db $00, $00, $2C, $00, $87, $00, $00, $20 ; $01EB95 |
  db $00, $97, $00, $00, $2A, $00, $B7, $00 ; $01EB9D |
  db $00, $10, $00, $37, $01, $00, $28, $00 ; $01EBA5 |
  db $57, $01, $00, $20, $00, $67, $01, $00 ; $01EBAD |
  db $40, $00, $00, $08                     ; $01EBB5 |

  db $00, $1A, $00, $17, $06, $00, $2E, $00 ; $01EBB9 | HDMA table generation data
  db $57, $06, $00, $19, $00, $77, $06, $00 ; $01EBC1 |
  db $2C, $00, $C7, $06, $00, $18, $00, $D7 ; $01EBC9 |
  db $06, $00, $2A, $00, $07, $07, $00, $17 ; $01EBD1 |
  db $00, $17, $07, $00, $28, $00, $57, $07 ; $01EBD9 |
  db $00, $16, $00, $67, $07, $00, $C0, $00 ; $01EBE1 |
  db $B7, $07, $00, $40, $01, $00, $08      ; $01EBE9 |

  db $00, $16, $00, $77, $07, $82, $00, $90 ; $01EBF0 | HDMA table generation data
  db $00, $00, $08, $A0                     ; $01EBF8 |

  db $00, $2A, $00, $27, $00, $00, $1A, $00 ; $01EBFC | HDMA table generation data
  db $57, $00, $00, $28, $00, $87, $00, $00 ; $01EC04 |
  db $18, $00, $B7, $00, $00, $26, $00, $E7 ; $01EC0C |
  db $00, $00, $16, $00, $07, $01, $00, $12 ; $01EC14 |
  db $00, $27, $01, $82, $00, $10, $00, $67 ; $01EC1C |
  db $01, $10, $80, $00, $20, $00, $87, $01 ; $01EC24 |
  db $00, $30, $00, $00, $08                ; $01EC2C |

  db $00, $00, $00, $17, $00, $00, $20, $00 ; $01EC31 | HDMA table generation data
  db $37, $00, $00, $00, $00, $47, $00, $00 ; $01EC39 |
  db $00, $00, $67, $00, $00, $1C, $00, $97 ; $01EC41 |
  db $00, $00, $1A, $00, $C7, $00, $00, $00 ; $01EC49 |
  db $00, $C7, $00, $00, $18, $00, $E7, $00 ; $01EC51 |
  db $00, $00, $00, $67, $01, $00, $40, $00 ; $01EC59 |
  db $00, $08                               ; $01EC61 |

  db $82, $00, $00, $01, $00                ; $01EC63 | HDMA table generation data

; table of pointers for BG3 horizontal scroll HDMA (bank $01)
; Indexed by third byte of bg3_tilemap_table
bg3_horiz_scroll_hdma_ptr:
  dw $0808, $EB7D, $EBB9, $EBF0             ; $01EC68 |
  dw $EBFC, $0000, $EC31, $EC63             ; $01EC70 |

setup_bg3_wavy_mist_hdma:
  LDA #$04                                  ; $01EC78 |\
  STA $0D43                                 ; $01EC7A |/ Setup wavy amplitude
  BRA setup_bg3_horiz_scroll_hdma           ; $01EC7D |

; sets up screen desgination HDMA
setup_bg3_screen_des_hdma:
  PHX                                       ; $01EC7F |
  LDX #$00                                  ; $01EC80 |
  JSR setup_special_hdma                    ; $01EC82 |
  PLX                                       ; $01EC85 |

setup_bg3_horiz_scroll_hdma:
  LDA #$01                                  ; $01EC86 |\ Enable BG3 Horizontal HDMA
  STA $0D3D                                 ; $01EC88 |/
  REP #$20                                  ; $01EC8B |
  LDA bg3_horiz_scroll_hdma_ptr,x           ; $01EC8D |\ Setup pointer for HDMA routine
  STA $0D3F                                 ; $01EC90 |/
  SEP #$30                                  ; $01EC93 |
  RTS                                       ; $01EC95 |

  dw $0611, $07B7, $0215, $0800             ; $01EC96 |

  dw $2022, $0787, $6222, $0800             ; $01EC9E |

special_hdma_enable_flag:
  db $08, $08                               ; $01ECA6 |

special_hdma_data_ptr:
  dw $EC96, $EC9E                           ; $01ECA8 |

special_hdma_regs:
  db $2C, $30                               ; $01ECAC |

; Sets up some special HDMA
; Only entries are for Subscreen designation and a color math HDMA
; Takes what kind of HDMA in X
setup_special_hdma:
  LDA special_hdma_enable_flag,x            ; $01ECAE |\
  INC A                                     ; $01ECB1 | | Enable screen designation HDMA
  STA $0D27                                 ; $01ECB2 |/
  REP #$20                                  ; $01ECB5 |\
  TXA                                       ; $01ECB7 | |
  AND #$00FF                                ; $01ECB8 | |
  TAY                                       ; $01ECBB | | Y = Index low byte
  ASL A                                     ; $01ECBC | |
  TAX                                       ; $01ECBD |/  X = Index * 2
  LDA special_hdma_data_ptr,x               ; $01ECBE |\
  STA $0D28                                 ; $01ECC1 |/  Set ROM pointer for HDMA routine
  SEP #$20                                  ; $01ECC4 |
  LDA #$41                                  ; $01ECC6 |\  Set HDMA channel 4 settings to:
  STA $4340                                 ; $01ECC8 |/  2 regs, write once & direct pointer
  LDA special_hdma_regs,y                   ; $01ECCB |\
  STA $4341                                 ; $01ECCE |/  Set what registers HDMA ch. 4 will write to
  RTS                                       ; $01ECD1 |

  dw $2900, $0107, $0765, $0000             ; $01ECD2 |
  dw $FF08                                  ; $01ECDA |

  dw $000C, $000C, $00E0, $0019             ; $01ECDC | Sun BG3 palette gradient stuff
  dw $121F, $0040, $121F, $0019             ; $01ECE4 |
  dw $0040, $000C, $000C, $0050             ; $01ECEC |
  dw $FFFF                                  ; $01ECF4 |

  dw $5E2C, $5E2C, $00E0, $6EEE             ; $01ECF6 | Sun BG3 palette gradient stuff
  dw $6EF8, $0040, $6EF8, $6EEE             ; $01ECFE |
  dw $0040, $5E2C, $5E2C, $0050             ; $01ED06 |
  dw $FFFF                                  ; $01ED0E |

  dw $ECDC, $ECF6                           ; $01ED10 |

setup_bg3_sun_hdma:
  JSR setup_bg3_horiz_scroll_hdma           ; $01ED14 |
  LDY #$00                                  ; $01ED17 |\
  LDA !r_header_bg3_palette                 ; $01ED19 | | If BG3 palette is
  AND #$01                                  ; $01ED1C | | even, Y = $02
  BEQ .setup_special_palette                ; $01ED1E | | odd,  Y = $00
  LDY #$02                                  ; $01ED20 |/

.setup_special_palette
  REP #$20                                  ; $01ED22 |
  LDA #$0001                                ; $01ED24 |
  STA !gsu_r0                               ; $01ED27 |
  LDA $ED10,y                               ; $01ED2A |\
  STA !gsu_r9                               ; $01ED2D |/ Setup data table for GSU routine
  LDX #$08                                  ; $01ED30 |
  LDA #$EBB5                                ; $01ED32 |
  JSL r_gsu_init_1                          ; $01ED35 | GSU init
  LDA #$56DE                                ; $01ED39 |\
  STA $20                                   ; $01ED3C | |
  LDY #$7F                                  ; $01ED3E | | Transfer 1314 bytes
  STY $22                                   ; $01ED40 | | $705800 -> $7F56DE
  LDA #$5800                                ; $01ED42 | | (background gradient )
  STA $23                                   ; $01ED45 | |
  LDY #$70                                  ; $01ED47 | |
  STY $25                                   ; $01ED49 | |
  LDA #$0522                                ; $01ED4B | |
  JSL dma_wram_gen_purpose                  ; $01ED4E |/
  LDA #$ECD2                                ; $01ED52 |\
  STA $0D47                                 ; $01ED55 |/ Setup data table for GSU routine
  STZ $0D4B                                 ; $01ED58 |\
  STZ $0D2B                                 ; $01ED5B | | Fuck the other HDMA modes
  STZ $0D2D                                 ; $01ED5E |/

.setup_hdma
  SEP #$20                                  ; $01ED61 |
  LDA #$12                                  ; $01ED63 |\ HDMA channel 4
  STA $4341                                 ; $01ED65 |/ Write to BG3 horiz scroll register
  INC $0D0D                                 ; $01ED68 |  Set flag for gradient to scroll with BG3
  LDA !r_reg_hdmaen_mirror                  ; $01ED6B |\
  ORA #$06                                  ; $01ED6E | | Enable HDMA channel 1 & 2
  STA !r_reg_hdmaen_mirror                  ; $01ED70 |/  (gradient HDMA)
  INC $0D45                                 ; $01ED73 |  Enable special BG3 Sun HDMA
  RTS                                       ; $01ED76 |

setup_bg3_clouds_mist_hdma:
  LDA #$17                                  ; $01ED77 |\
  STA !r_reg_tm_mirror                      ; $01ED79 |/ Enable BG1/2/3 and OBJ on main screen 
  LDA #$04                                  ; $01ED7C |\
  STA !r_reg_ts_mirror                      ; $01ED7E |/ Enable BG3 on subscreen
  LDX #$01                                  ; $01ED81 |\
  JSR setup_special_hdma                    ; $01ED83 |/ Setup Color math HDMA
  LDX #$06                                  ; $01ED86 |\
  JSR setup_bg3_horiz_scroll_hdma           ; $01ED88 |/ Setup BG3 horizontal scroll HDMA
  RTS                                       ; $01ED8B |

setup_bg3_transparency:
  LDA #$A0                                  ; $01ED8C |\ Set prevent color math and clip to black
  STA !r_reg_cgwsel_mirror                  ; $01ED8E |/ Inside Color Window only
  LDA #$64                                  ; $01ED91 |\ Half color math Add for
  STA !r_reg_cgadsub_mirror                 ; $01ED93 |/ Backdrop and BG3
  RTS                                       ; $01ED96 |

  dw $ED9B, $EDA5                           ; $01ED97 |

  db $FF, $20, $BD, $B2                     ; $01ED9B |
  db $B6, $AE, $D0, $BE                     ; $01ED9F |
  db $B9, $FD                               ; $01EDA3 |

  db $FF, $20, $C2, $B8                     ; $01EDA5 |
  db $BE, $D0, $B5, $B8                     ; $01EDA9 |
  db $BC, $BD, $FD                          ; $01EDAD |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EDF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EE98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EED0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EED8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EEF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EF98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01EFF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F000 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F008 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F010 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F018 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F020 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F028 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F030 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F038 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F040 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F048 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F050 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F058 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F060 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F068 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F070 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F078 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F080 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F088 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F090 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F098 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F0F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F100 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F108 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F110 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F118 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F120 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F128 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F130 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F138 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F140 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F148 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F150 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F158 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F160 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F168 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F170 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F178 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F180 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F188 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F190 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F198 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F1F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F200 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F208 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F210 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F218 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F220 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F228 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F230 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F238 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F240 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F248 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F250 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F258 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F260 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F268 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F270 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F278 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F280 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F288 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F290 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F298 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F2F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F300 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F308 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F310 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F318 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F320 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F328 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F330 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F338 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F340 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F348 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F350 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F358 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F360 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F368 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F370 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F378 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F380 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F388 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F390 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F398 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F3F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F400 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F408 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F410 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F418 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F420 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F428 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F430 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F438 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F440 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F448 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F450 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F458 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F460 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F468 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F470 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F478 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F480 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F488 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F490 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F498 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F4F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F500 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F508 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F510 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F518 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F520 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F528 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F530 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F538 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F540 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F548 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F550 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F558 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F560 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F568 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F570 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F578 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F580 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F588 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F590 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F598 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F5F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F600 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F608 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F610 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F618 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F620 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F628 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F630 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F638 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F640 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F648 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F650 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F658 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F660 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F668 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F670 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F678 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F680 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F688 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F690 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F698 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F6F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F700 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F708 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F710 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F718 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F720 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F728 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F730 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F738 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F740 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F748 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F750 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F758 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F760 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F768 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F770 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F778 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F780 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F788 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F790 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F798 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F7F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F800 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F808 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F810 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F818 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F820 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F828 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F830 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F838 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F840 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F848 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F850 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F858 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F860 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F868 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F870 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F878 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F880 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F888 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F890 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F898 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F8F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F900 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F908 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F910 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F918 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F920 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F928 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F930 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F938 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F940 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F948 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F950 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F958 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F960 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F968 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F970 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F978 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F980 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F988 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F990 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F998 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9A0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9A8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9B0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9B8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9C0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9C8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9D0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9D8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9E0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9E8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9F0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01F9F8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FA98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FAF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FB98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FBF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FC98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FCF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FD98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FDF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FE98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FED0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FED8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FEF8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF00 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF08 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF10 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF18 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF20 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF28 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF30 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF38 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF40 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF48 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF50 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF58 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF60 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF68 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF70 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF78 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF80 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF88 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF90 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FF98 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFA0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFA8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFB0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFB8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFC0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFC8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFD0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFD8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFE0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFE8 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFF0 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $01FFF8 |
