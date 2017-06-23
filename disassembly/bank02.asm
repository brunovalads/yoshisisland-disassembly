org $028000

; yoshi color assignment for each level (12 bytes per world; levels 1-8, extra, bonus, and 2 unused)
yoshi_level_colors:
  db $00, $01, $03, $02, $04, $05, $06, $07 ; $028000 |
  db $00, $00, $00, $00, $00, $01, $03, $02 ; $028008 |
  db $04, $05, $06, $07, $00, $00, $00, $00 ; $028010 |
  db $00, $01, $03, $02, $04, $05, $06, $07 ; $028018 |
  db $00, $00, $00, $00, $00, $01, $03, $02 ; $028020 |
  db $04, $05, $06, $07, $00, $00, $00, $00 ; $028028 |
  db $00, $01, $03, $02, $04, $05, $06, $07 ; $028030 |
  db $00, $00, $00, $00, $00, $01, $03, $02 ; $028038 |
  db $04, $05, $06, $00, $00, $00, $00, $00 ; $028040 |

  LDA #$0100                                ; $028048 |
  STA !gsu_r6                               ; $02804B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02804E |
  STA !gsu_r11                              ; $028050 |
  LDY !s_spr_dyntile_index,x                ; $028053 |
  TYX                                       ; $028056 |
  LDA $03A9EE,x                             ; $028057 |
  STA !gsu_r2                               ; $02805B |
  LDA $03A9CE,x                             ; $02805E |
  STA !gsu_r3                               ; $028062 |
  LDA #$0010                                ; $028065 |
  STA !gsu_r8                               ; $028068 |
  LDA #$001F                                ; $02806B |
  STA !gsu_r9                               ; $02806E |
  LDA #$8040                                ; $028071 |
  STA !gsu_r12                              ; $028074 |
  LDA #$0054                                ; $028077 |
  STA !gsu_r13                              ; $02807A |
  LDX #$08                                  ; $02807D |
  LDA #$8295                                ; $02807F |
  JSL r_gsu_init_1                          ; $028082 | GSU init
  INC $0CF9                                 ; $028086 |
  LDX $12                                   ; $028089 |
  RTL                                       ; $02808B |

  LDA #$01D4                                ; $02808C |
  JSL spawn_ambient_sprite                  ; $02808F |
  LDA #$000B                                ; $028093 |
  STA $7E4C,y                               ; $028096 |
  LDA #$0006                                ; $028099 |
  STA $7782,y                               ; $02809C |
  LDA !s_spr_x_pixel_pos,x                  ; $02809F |
  STA $70A2,y                               ; $0280A2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0280A5 |
  STA $7142,y                               ; $0280A8 |
  RTL                                       ; $0280AB |

  JSL $02808C                               ; $0280AC |
  LDA #$0001                                ; $0280B0 |
  STA $7E4E,y                               ; $0280B3 |
  RTL                                       ; $0280B6 |

; falling wall tables
  db $22, $00, $46, $00, $6A, $00           ; $0280B7 |

  db $02, $04, $06, $02, $04, $06           ; $0280BD |
  db $00, $00, $00, $02, $04, $06           ; $0280C3 |
  db $02, $04, $06, $00, $00, $00           ; $0280C9 |
  db $0F, $10, $11, $0D, $07, $05           ; $0280CF |
  db $0C, $0A, $0A, $0F, $10, $11           ; $0280D5 |
  db $0D, $07, $05, $0C, $0A, $0A           ; $0280DB |
  db $0C, $10, $16, $0D, $07, $05           ; $0280E1 |
  db $0C, $0A, $0A, $0C, $10, $16           ; $0280E7 |
  db $0D, $07, $05, $0C, $0A, $0A           ; $0280ED |
  db $0C, $10, $16, $0D, $07, $05           ; $0280F3 |
  db $0C, $0A, $0A, $0C, $10, $16           ; $0280F9 |
  db $0D, $07, $05, $0C, $0A, $0A           ; $0280FF |
  db $01, $03, $05, $01, $03, $05           ; $028105 |
  db $00, $00, $00, $01, $03, $05           ; $02810B |
  db $01, $03, $05, $00, $00, $00           ; $028111 |
  db $07, $0C, $11, $03, $05, $08           ; $028117 |
  db $05, $09, $0D, $07, $0C, $11           ; $02811D |
  db $03, $05, $08, $05, $09, $0D           ; $028123 |

  dw $0028, $FFD8                           ; $028129 |

init_falling_wall:
  LDA !r_header_bg1_tileset                 ; $02812D |
  CMP #$000A                                ; $028130 |
  BNE CODE_02813E                           ; $028133 |
  LDA !s_spr_oam_yxppccct,x                 ; $028135 |
  ORA #$0004                                ; $028138 |
  STA !s_spr_oam_yxppccct,x                 ; $02813B |

CODE_02813E:
  JSR CODE_028183                           ; $02813E |
  STZ !r_header_bg3_tileset                 ; $028141 |
  PHB                                       ; $028144 |
  PHK                                       ; $028145 |
  PLB                                       ; $028146 |
  LDY !r_cam_moving_dir_x                   ; $028147 |
  LDA !s_spr_x_pixel_pos,x                  ; $02814A |
  CLC                                       ; $02814D |
  ADC $8129,y                               ; $02814E |
  STA !s_spr_x_pixel_pos,x                  ; $028151 |
  ORA #$0008                                ; $028154 |
  STA $7E42                                 ; $028157 |
  LDA #$0104                                ; $02815A |
  STA $0CB8                                 ; $02815D |
  STZ $7E40                                 ; $028160 |
  STZ $0CB4                                 ; $028163 |
  LDA !s_spr_oam_yxppccct,x                 ; $028166 |
  AND #$000E                                ; $028169 |
  TAX                                       ; $02816C |
  LDY $80B7,x                               ; $02816D |
  LDX #$22                                  ; $028170 |

CODE_028172:
  LDA $80BD,y                               ; $028172 |
  STA $70404A,x                             ; $028175 |
  DEY                                       ; $028179 |
  DEY                                       ; $02817A |
  DEX                                       ; $02817B |
  DEX                                       ; $02817C |
  BPL CODE_028172                           ; $02817D |
  LDX $12                                   ; $02817F |
  PLB                                       ; $028181 |
  RTL                                       ; $028182 |

; falling wall sub
CODE_028183:
  LDA $0CB2                                 ; $028183 |
  BEQ CODE_02818D                           ; $028186 |
  PLA                                       ; $028188 |
  JML $03A31E                               ; $028189 |

CODE_02818D:
  INC $0CB2                                 ; $02818D |
  RTS                                       ; $028190 |

; falling wall table
  dw $8197                                  ; $028191 |
  dw $81B1                                  ; $028193 |
  dw $81CB                                  ; $028195 |
  dw $1004                                  ; $028197 |
  dw $608E                                  ; $028199 |
  dw $8E00                                  ; $02819B |
  dw $0060                                  ; $02819D |
  dw $6000                                  ; $02819F |
  dw $0010                                  ; $0281A1 |
  dw $0460                                  ; $0281A3 |
  dw $0000                                  ; $0281A5 |
  dw $4201                                  ; $0281A7 |
  dw $0201                                  ; $0281A9 |
  dw $0280                                  ; $0281AB |
  dw $C203                                  ; $0281AD |
  dw $0003                                  ; $0281AF |
  dw $0804                                  ; $0281B1 |
  dw $50E0                                  ; $0281B3 |
  dw $E0F8                                  ; $0281B5 |
  dw $F850                                  ; $0281B7 |
  dw $5020                                  ; $0281B9 |
  dw $2008                                  ; $0281BB |
  dw $0450                                  ; $0281BD |
  dw $0060                                  ; $0281BF |
  dw $A201                                  ; $0281C1 |
  dw $0201                                  ; $0281C3 |
  dw $02E0                                  ; $0281C5 |
  dw $2203                                  ; $0281C7 |
  dw $0003                                  ; $0281C9 |
  dw $0008                                  ; $0281CB |
  dw $60C8                                  ; $0281CD |
  dw $D9D9                                  ; $0281CF |
  dw $C860                                  ; $0281D1 |
  dw $6000                                  ; $0281D3 |
  dw $27D9                                  ; $0281D5 |
  dw $0060                                  ; $0281D7 |
  dw $6038                                  ; $0281D9 |
  dw $2727                                  ; $0281DB |
  dw $3860                                  ; $0281DD |
  dw $6000                                  ; $0281DF |
  dw $D927                                  ; $0281E1 |
  dw $0860                                  ; $0281E3 |
  dw $00E0                                  ; $0281E5 |
  dw $C201                                  ; $0281E7 |
  dw $0201                                  ; $0281E9 |
  dw $02A1                                  ; $0281EB |
  dw $8303                                  ; $0281ED |
  dw $0403                                  ; $0281EF |
  dw $0460                                  ; $0281F1 |
  dw $4205                                  ; $0281F3 |
  dw $0605                                  ; $0281F5 |
  dw $0621                                  ; $0281F7 |
  dw $0307                                  ; $0281F9 |
  dw $0007                                  ; $0281FB |
  dw $FFFC                                  ; $0281FD |
  dw $0004                                  ; $0281FF |
  dw $F000                                  ; $028201 |
  dw $0800                                  ; $028203 |
  dw $FFC0                                  ; $028205 |
  dw $0000                                  ; $028207 |

main_falling_wall:
  JSL $02841A                               ; $028209 |
  LDA !s_spr_x_player_delta,x               ; $02820D |
  CLC                                       ; $028210 |
  ADC #$0070                                ; $028211 |
  CMP #$00E1                                ; $028214 |
  LDA #$0215                                ; $028217 |
  BCS CODE_02822A                           ; $02821A |
  LDA #$0710                                ; $02821C |
  LDY $7E40                                 ; $02821F |
  DEY                                       ; $028222 |
  CPY #$BF                                  ; $028223 |
  BCS CODE_02822A                           ; $028225 |
  LDA #$0714                                ; $028227 |

CODE_02822A:
  STA !r_reg_tm_mirror                      ; $02822A |
  JSL $03AF23                               ; $02822D |
  LDA !s_spr_timer_1,x                      ; $028231 |
  BNE CODE_02825F                           ; $028234 |
  LDY $0CB4                                 ; $028236 |
  BNE CODE_028262                           ; $028239 |
  LDA !s_spr_x_player_delta,x               ; $02823B |
  CLC                                       ; $02823E |
  ADC #$0030                                ; $02823F |
  CMP #$0061                                ; $028242 |
  BCS CODE_02825F                           ; $028245 |
  LDA !s_spr_y_player_delta,x               ; $028247 |
  CLC                                       ; $02824A |
  ADC #$0030                                ; $02824B |
  CMP #$0061                                ; $02824E |
  BCS CODE_02825F                           ; $028251 |
  LDA !s_player_state                       ; $028253 |
  CMP #$0000                                ; $028256 |
  BNE CODE_02825F                           ; $028259 |
  INC $0CB4                                 ; $02825B |
  INY                                       ; $02825E |

CODE_02825F:
  JMP CODE_028417                           ; $02825F |

CODE_028262:
  LDA !s_spr_gsu_morph_1_lo,x               ; $028262 |
  CLC                                       ; $028265 |
  ADC $81FC,y                               ; $028266 |
  CMP $8200,y                               ; $028269 |
  BNE CODE_028271                           ; $02826C |
  LDA $8200,y                               ; $02826E |

CODE_028271:
  STA !s_spr_gsu_morph_1_lo,x               ; $028271 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $028274 |
  AND #$00FF                                ; $028277 |
  CLC                                       ; $02827A |
  ADC !s_spr_gsu_morph_1_lo,x               ; $02827B |
  STA !s_spr_gsu_morph_2_lo,x               ; $02827E |
  AND #$FF00                                ; $028281 |
  BPL CODE_028289                           ; $028284 |
  ORA #$00FF                                ; $028286 |

CODE_028289:
  XBA                                       ; $028289 |
  CLC                                       ; $02828A |
  ADC $7E40                                 ; $02828B |
  STA $7E40                                 ; $02828E |
  SEC                                       ; $028291 |
  SBC $8204,y                               ; $028292 |
  EOR $8200,y                               ; $028295 |
  BMI CODE_0282D5                           ; $028298 |
  LDA #$0040                                ; $02829A |
  CPY #$01                                  ; $02829D |
  BEQ CODE_0282AD                           ; $02829F |
  LDX !s_player_state                       ; $0282A1 |
  CPX #$12                                  ; $0282A4 |
  BNE CODE_0282AB                           ; $0282A6 |
  LDA #$0100                                ; $0282A8 |

CODE_0282AB:
  LDX $12                                   ; $0282AB |

CODE_0282AD:
  STA !s_spr_timer_1,x                      ; $0282AD |
  LDA $8204,y                               ; $0282B0 |
  STA $7E40                                 ; $0282B3 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0282B6 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $0282B9 |
  LDA #$0000                                ; $0282BC |
  DEY                                       ; $0282BF |
  BNE CODE_0282D2                           ; $0282C0 |
  LDA #$0047                                ; $0282C2 |\ play sound #$0047
  JSL push_sound_queue                      ; $0282C5 |/
  LDA #$0060                                ; $0282C9 |
  STA !s_cam_y_small_shaking_timer          ; $0282CC |
  LDA #$0003                                ; $0282CF |

CODE_0282D2:
  STA $0CB4                                 ; $0282D2 |

CODE_0282D5:
  TXY                                       ; $0282D5 |
  REP #$10                                  ; $0282D6 |
  LDA $7E40                                 ; $0282D8 |
  BIT #$0040                                ; $0282DB |
  PHP                                       ; $0282DE |
  BEQ CODE_0282E5                           ; $0282DF |
  EOR #$003F                                ; $0282E1 |
  INC A                                     ; $0282E4 |

CODE_0282E5:
  EOR #$00FF                                ; $0282E5 |
  INC A                                     ; $0282E8 |
  AND #$003F                                ; $0282E9 |
  ASL A                                     ; $0282EC |
  TAX                                       ; $0282ED |
  LDA $0BBA12,x                             ; $0282EE |
  LSR A                                     ; $0282F2 |
  PLP                                       ; $0282F3 |
  BNE CODE_0282FA                           ; $0282F4 |
  EOR #$FFFF                                ; $0282F6 |
  INC A                                     ; $0282F9 |

CODE_0282FA:
  SEP #$20                                  ; $0282FA |
  STA !reg_m7a                              ; $0282FC |
  XBA                                       ; $0282FF |
  STA !reg_m7a                              ; $028300 |
  LDA #$60                                  ; $028303 |
  STA !reg_m7b                              ; $028305 |
  LDA !reg_mpyl                             ; $028308 |
  ASL A                                     ; $02830B |
  REP #$20                                  ; $02830C |
  LDA !reg_mpym                             ; $02830E |
  ROL A                                     ; $028311 |
  STA $0CBA                                 ; $028312 |
  LDA !s_player_state                       ; $028315 |
  CMP #$0012                                ; $028318 |
  BNE CODE_028322                           ; $02831B |
  STY $61B6                                 ; $02831D |
  BRA CODE_028365                           ; $028320 |

CODE_028322:
  LDA $0CB4                                 ; $028322 |
  DEC A                                     ; $028325 |
  BNE CODE_028365                           ; $028326 |
  LDA $0CB8                                 ; $028328 |
  SEC                                       ; $02832B |
  SBC #$0060                                ; $02832C |
  ASL A                                     ; $02832F |
  TAX                                       ; $028330 |
  LDA $702200,x                             ; $028331 |
  STA $08                                   ; $028335 |
  SEP #$20                                  ; $028337 |
  STA !reg_m7a                              ; $028339 |
  XBA                                       ; $02833C |
  STA !reg_m7a                              ; $02833D |
  LDA #$30                                  ; $028340 |
  STA !reg_m7b                              ; $028342 |
  REP #$20                                  ; $028345 |
  LDA !reg_mpym                             ; $028347 |
  STA $06                                   ; $02834A |
  LDA !s_player_x                           ; $02834C |
  SEC                                       ; $02834F |
  SBC !s_spr_x_pixel_pos,y                  ; $028350 |
  STA $02                                   ; $028353 |
  BPL CODE_02835B                           ; $028355 |
  EOR #$FFFF                                ; $028357 |
  INC A                                     ; $02835A |

CODE_02835B:
  CLC                                       ; $02835B |
  ADC #$0008                                ; $02835C |
  STA $04                                   ; $02835F |
  CMP $06                                   ; $028361 |
  BCC CODE_028368                           ; $028363 |

CODE_028365:
  JMP CODE_028415                           ; $028365 |

CODE_028368:
  LDA $7E40                                 ; $028368 |
  AND #$00FF                                ; $02836B |
  ASL A                                     ; $02836E |
  TAX                                       ; $02836F |
  LDA $00E9D4,x                             ; $028370 |
  SEP #$20                                  ; $028374 |
  STA !reg_m7a                              ; $028376 |
  XBA                                       ; $028379 |
  STA !reg_m7a                              ; $02837A |
  LDA #$70                                  ; $02837D |
  STA !reg_m7b                              ; $02837F |
  LDA !reg_mpym                             ; $028382 |
  CMP #$60                                  ; $028385 |
  REP #$20                                  ; $028387 |
  BCC CODE_028365                           ; $028389 |
  LDA #$000B                                ; $02838B |
  LDX !s_player_duck_state                  ; $02838E |
  BEQ CODE_028396                           ; $028391 |
  LDA #$0005                                ; $028393 |

CODE_028396:
  CLC                                       ; $028396 |
  ADC !s_spr_cam_y_pos,y                    ; $028397 |
  SEC                                       ; $02839A |
  SBC !s_player_y_cam_rel                   ; $02839B |
  BMI CODE_028415                           ; $02839E |
  SEC                                       ; $0283A0 |
  SBC $0CBA                                 ; $0283A1 |
  BMI CODE_028415                           ; $0283A4 |
  CMP #$0030                                ; $0283A6 |
  BCS CODE_028415                           ; $0283A9 |
  LDX !s_player_jump_state                  ; $0283AB |
  BEQ CODE_0283D3                           ; $0283AE |
  LDX !s_player_y_speed                     ; $0283B0 |
  BPL CODE_0283B8                           ; $0283B3 |
  STZ !s_player_y_speed                     ; $0283B5 |

CODE_0283B8:
  CLC                                       ; $0283B8 |
  ADC !s_player_y                           ; $0283B9 |
  STA !s_player_y                           ; $0283BC |
  CLC                                       ; $0283BF |
  ADC #$0010                                ; $0283C0 |
  SEC                                       ; $0283C3 |
  SBC !s_spr_y_pixel_pos,y                  ; $0283C4 |
  BMI CODE_028415                           ; $0283C7 |
  EOR #$FFFF                                ; $0283C9 |
  SEC                                       ; $0283CC |
  ADC !s_player_y                           ; $0283CD |
  STA !s_player_y                           ; $0283D0 |

CODE_0283D3:
  LDA #$0012                                ; $0283D3 |
  STA !s_player_state                       ; $0283D6 |
  STZ !s_player_x_speed                     ; $0283D9 |
  STZ !s_player_x_speed_prev                ; $0283DC |
  STZ !s_player_y_speed                     ; $0283DF |
  JSL $04F74A                               ; $0283E2 |
  JSL $03BFF7                               ; $0283E6 |
  INC $0D94                                 ; $0283EA |
  LDA $08                                   ; $0283ED |
  ASL A                                     ; $0283EF |
  TAX                                       ; $0283F0 |
  LDA $702200,x                             ; $0283F1 |
  SEP #$20                                  ; $0283F5 |
  STA !reg_m7a                              ; $0283F7 |
  XBA                                       ; $0283FA |
  STA !reg_m7a                              ; $0283FB |
  LDA $04                                   ; $0283FE |
  STA !reg_m7b                              ; $028400 |
  REP #$20                                  ; $028403 |
  LDA !reg_mpym                             ; $028405 |
  LDX $02                                   ; $028408 |
  BPL CODE_028410                           ; $02840A |
  EOR #$FFFF                                ; $02840C |
  INC A                                     ; $02840F |

CODE_028410:
  STA $7E46                                 ; $028410 |
  REP #$20                                  ; $028413 |

CODE_028415:
  SEP #$10                                  ; $028415 |

CODE_028417:
  LDX $12                                   ; $028417 |
  RTL                                       ; $028419 |

; falling wall sub
  LDY #$00                                  ; $02841A |
  PHY                                       ; $02841C |
  PHB                                       ; $02841D |
  PHK                                       ; $02841E |
  PLB                                       ; $02841F |
  LDA $8191,y                               ; $028420 |
  STA !gsu_r13                              ; $028423 |
  LDA #$0078                                ; $028426 |
  SEC                                       ; $028429 |
  SBC !s_spr_cam_x_pos,x                    ; $02842A |
  STA !r_bg3_cam_x                          ; $02842D |
  STA !gsu_r1                               ; $028430 |
  LDA !s_spr_cam_y_pos,x                    ; $028433 |
  CLC                                       ; $028436 |
  ADC #$000F                                ; $028437 |
  STA !gsu_r2                               ; $02843A |
  CLC                                       ; $02843D |
  ADC !r_bg1_cam_y                          ; $02843E |
  STA $0CB6                                 ; $028441 |
  LDA $0CB8                                 ; $028444 |
  STA !gsu_r3                               ; $028447 |
  LDA $7E40                                 ; $02844A |
  AND #$00FF                                ; $02844D |
  STA !gsu_r4                               ; $028450 |
  LDA #$0002                                ; $028453 |
  STA !gsu_r12                              ; $028456 |
  LDX #$08                                  ; $028459 |
  LDA #$BE9F                                ; $02845B |
  JSL r_gsu_init_1                          ; $02845E | GSU init
  JSL $00BE39                               ; $028462 |

; args to $00BE39
  dw $5040, $727E, $7033, $01A4             ; $028466 |

  LDA !r_reg_hdmaen_mirror                  ; $02846E |
  AND #$00E7                                ; $028471 |
  ORA #$0010                                ; $028474 |
  STA !r_reg_hdmaen_mirror                  ; $028477 |
  PLB                                       ; $02847A |
  LDX $12                                   ; $02847B |
  PLY                                       ; $02847D |
  CPY #$04                                  ; $02847E |
  BEQ CODE_02848B                           ; $028480 |
  JSL $03A2DE                               ; $028482 |
  BCC CODE_02848B                           ; $028486 |
  STZ $0CB2                                 ; $028488 |

CODE_02848B:
  RTL                                       ; $02848B |

init_roger:
  LDA #$0035                                ; $02848C |
  JSL spawn_sprite_active                   ; $02848F |
  BCS CODE_028499                           ; $028493 |
  JML $03A31E                               ; $028495 |

CODE_028499:
  LDA #$0006                                ; $028499 |
  STA !s_spr_wildcard_4_lo,y                ; $02849C |
  STA $7860,y                               ; $02849F |
  TYA                                       ; $0284A2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0284A3 |
  JSR CODE_0284E1                           ; $0284A5 |
  LDY #$2D                                  ; $0284A8 |
  JSL $0CE5D6                               ; $0284AA |
  LDA #$0047                                ; $0284AE |
  TXY                                       ; $0284B1 |
  JSL $03A34E                               ; $0284B2 |
  BCC CODE_0284CC                           ; $0284B6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0284B8 |
  CLC                                       ; $0284BB |
  ADC #$0040                                ; $0284BC |
  STA !s_spr_x_pixel_pos,y                  ; $0284BF |
  LDA !s_spr_y_pixel_pos,x                  ; $0284C2 |
  STA !s_spr_y_pixel_pos,y                  ; $0284C5 |
  TXA                                       ; $0284C8 |
  STA !s_spr_wildcard_4_lo,y                ; $0284C9 |

CODE_0284CC:
  LDX #$3C                                  ; $0284CC |

CODE_0284CE:
  LDA $5FE67E,x                             ; $0284CE |
  STA $702E2E,x                             ; $0284D2 |
  STA $7020C2,x                             ; $0284D6 |
  DEX                                       ; $0284DA |
  DEX                                       ; $0284DB |
  BPL CODE_0284CE                           ; $0284DC |
  LDX $12                                   ; $0284DE |
  RTL                                       ; $0284E0 |

; roger sub
CODE_0284E1:
  LDA !s_spr_x_pixel_pos,x                  ; $0284E1 |
  STA !s_spr_x_pixel_pos,y                  ; $0284E4 |
  LDA !s_spr_y_pixel_pos,x                  ; $0284E7 |
  STA !s_spr_y_pixel_pos,y                  ; $0284EA |
  RTS                                       ; $0284ED |

  dw $0100                                  ; $0284EE |
  dw $FF00                                  ; $0284F0 |
  dw $006C                                  ; $0284F2 |
  dw $FFA0                                  ; $0284F4 |

main_roger:
  JSL $03AF23                               ; $0284F6 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0284F9 |
  JSR CODE_0284E1                           ; $0284FC |
  LDA !s_spr_x_speed_lo,x                   ; $0284FF |
  STA !s_spr_x_speed_lo,y                   ; $028502 |
  LDA !s_spr_x_speed_lo,x                   ; $028505 |
  STA !s_spr_wildcard_2_lo,x                ; $028508 |
  STZ !s_spr_x_speed_lo,x                   ; $02850B |
  LDA !s_on_sprite_platform_flag            ; $02850E |
  BNE CODE_02854F                           ; $028511 |
  LDY !s_spr_collision_id,x                 ; $028513 |
  BPL CODE_02854F                           ; $028516 |
  LDA !s_player_x_speed                     ; $028518 |
  PHA                                       ; $02851B |
  JSL $03D130                               ; $02851C |
  PLA                                       ; $028520 |
  BCS CODE_02854F                           ; $028521 |
  CMP !s_player_x_speed                     ; $028523 |
  BEQ CODE_02854F                           ; $028526 |
  PHA                                       ; $028528 |
  CLC                                       ; $028529 |
  ADC #$0100                                ; $02852A |
  CMP #$0201                                ; $02852D |
  LDY #$00                                  ; $028530 |
  PLA                                       ; $028532 |
  BCC CODE_028542                           ; $028533 |
  BPL CODE_028539                           ; $028535 |
  LDY #$02                                  ; $028537 |

CODE_028539:
  LDA $84F2,y                               ; $028539 |
  STA !s_spr_x_speed_lo,x                   ; $02853C |
  LDA $84EE,y                               ; $02853F |

CODE_028542:
  STA !s_player_x_speed                     ; $028542 |
  INC $61C2                                 ; $028545 |
  INC !s_player_pushing_counter             ; $028548 |
  JSL $0D90A1                               ; $02854B |

CODE_02854F:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02854F |
  LDA !s_spr_wildcard_4_lo,y                ; $028551 |
  CMP #$0006                                ; $028554 |
  BNE CODE_028592                           ; $028557 |
  LDA !s_player_state                       ; $028559 |
  CMP #$0002                                ; $02855C |
  BNE CODE_0285DB                           ; $02855F |
  LDA $1015                                 ; $028561 |
  BNE CODE_028579                           ; $028564 |
  LDA !s_player_jump_state                  ; $028566 |
  BEQ CODE_028571                           ; $028569 |
  LDA #$0040                                ; $02856B |
  STA !s_spr_timer_1,x                      ; $02856E |

CODE_028571:
  LDA !s_spr_timer_1,x                      ; $028571 |
  BNE CODE_0285DB                           ; $028574 |
  INC $1015                                 ; $028576 |

CODE_028579:
  BPL CODE_0285DB                           ; $028579 |
  STZ $1015                                 ; $02857B |
  LDA #$0000                                ; $02857E |
  STA !s_spr_wildcard_4_lo,y                ; $028581 |
  LDA #$0180                                ; $028584 |
  STA !s_spr_timer_2,y                      ; $028587 |
  LDA #$0100                                ; $02858A |
  STA !s_spr_timer_3,y                      ; $02858D |
  BRA CODE_0285DB                           ; $028590 |

CODE_028592:
  CMP #$0004                                ; $028592 |
  BNE CODE_0285DB                           ; $028595 |
  LDA !s_spr_y_accel,x                      ; $028597 |
  CMP #$0040                                ; $02859A |
  BCS CODE_0285A2                           ; $02859D |
  INC !s_spr_y_accel,x                      ; $02859F |

CODE_0285A2:
  LDA !s_spr_cam_y_pos,x                    ; $0285A2 |
  CMP #$0300                                ; $0285A5 |
  BCC CODE_0285DB                           ; $0285A8 |
  LDA #$0005                                ; $0285AA |
  STA !s_spr_wildcard_4_lo,y                ; $0285AD |
  LDA #$0040                                ; $0285B0 |
  STA !s_spr_timer_4,y                      ; $0285B3 |
  LDA #$00FF                                ; $0285B6 |
  STA !s_spr_draw_priority,y                ; $0285B9 |
  LDA #$0047                                ; $0285BC |\ play sound #$0047
  JSL push_sound_queue                      ; $0285BF |/
  LDA #$0060                                ; $0285C3 |
  STA !s_cam_y_small_shaking_timer          ; $0285C6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0285C9 |
  STA $00                                   ; $0285CC |
  LDA !s_spr_y_pixel_pos,x                  ; $0285CE |
  STA $02                                   ; $0285D1 |
  JSL $02E1A3                               ; $0285D3 |
  JML $03A32E                               ; $0285D7 |

CODE_0285DB:
  LDA $7860,x                               ; $0285DB |
  AND #$0001                                ; $0285DE |
  STA $7860,y                               ; $0285E1 |
  BEQ CODE_0285E9                           ; $0285E4 |
  STZ !s_spr_y_speed_lo,x                   ; $0285E6 |

CODE_0285E9:
  RTL                                       ; $0285E9 |

init_roger_2:
  RTL                                       ; $0285EA |

main_roger_2:
  JSR CODE_02893E                           ; $0285EB |
  JSL $03AF23                               ; $0285EE |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0285F2 |
  ASL A                                     ; $0285F4 |
  TXY                                       ; $0285F5 |
  TAX                                       ; $0285F6 |
  JSR ($8661,x)                             ; $0285F7 | state
  TXA                                       ; $0285FA |
  STA $6012                                 ; $0285FB |
  LDA !s_player_x_cam_rel                   ; $0285FE |
  STA $6014                                 ; $028601 |
  LDA !s_player_y_cam_rel                   ; $028604 |
  STA $6016                                 ; $028607 |
  LDA !s_player_duck_state                  ; $02860A |
  STA $6018                                 ; $02860D |
  LDX #$0A                                  ; $028610 |
  LDA #$8390                                ; $028612 |
  JSL r_gsu_init_1                          ; $028615 | GSU init
  LDX $12                                   ; $028619 |
  LDA $601A                                 ; $02861B |
  BEQ CODE_028639                           ; $02861E |
  LDA #$0013                                ; $028620 |\ play sound #$0013
  JSL push_sound_queue                      ; $028623 |/
  LDA !s_player_x_speed                     ; $028627 |
  CLC                                       ; $02862A |
  ADC #$FF80                                ; $02862B |
  CMP #$FC00                                ; $02862E |
  BPL CODE_028636                           ; $028631 |
  LDA #$FC00                                ; $028633 |

CODE_028636:
  STA !s_player_x_speed                     ; $028636 |

CODE_028639:
  LDA $6014                                 ; $028639 |
  BEQ CODE_028650                           ; $02863C |
  LDA !s_spr_x_speed_lo                     ; $02863E |
  CLC                                       ; $028641 |
  ADC #$FF80                                ; $028642 |
  CMP #$FE00                                ; $028645 |
  BPL CODE_02864D                           ; $028648 |
  LDA #$FE00                                ; $02864A |

CODE_02864D:
  STA !s_spr_x_speed_lo                     ; $02864D |

CODE_028650:
  LDY !s_spr_collision_id,x                 ; $028650 |
  DEY                                       ; $028653 |
  BMI CODE_028660                           ; $028654 |
  LDA !s_spr_collision_state,y              ; $028656 |
  BEQ CODE_028660                           ; $028659 |
  TYX                                       ; $02865B |
  JSL $03B25B                               ; $02865C |

CODE_028660:
  RTL                                       ; $028660 |

roger_state_ptr:
  dw $8687                                  ; $028661 | state $00
  dw $879B                                  ; $028663 | state $01
  dw $8827                                  ; $028665 | state $02
  dw $8874                                  ; $028667 | state $03
  dw $88AA                                  ; $028669 | state $04
  dw $88FF                                  ; $02866B | state $05
  dw $866F                                  ; $02866D | state $06

; state $06
  TYX                                       ; $02866F |
  RTS                                       ; $028670 |

  db $00, $01                               ; $028671 |
  db $02, $03                               ; $028673 |
  db $04, $05                               ; $028675 |
  db $06, $07                               ; $028677 |
  db $08, $09                               ; $028679 |

  db $08, $01                               ; $02867B |
  db $01, $01                               ; $02867D |
  db $02, $02                               ; $02867F |
  db $03, $04                               ; $028681 |
  db $08, $04                               ; $028683 |
  db $08, $04                               ; $028685 |

; state $00
  TYX                                       ; $028687 |
  LDY !s_spr_oam_count,x                    ; $028688 |
  CPY #$20                                  ; $02868B |
  BCC CODE_02870B                           ; $02868D |
  LDA !s_spr_timer_4,x                      ; $02868F |
  BNE CODE_0286B5                           ; $028692 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $028694 |
  INY                                       ; $028696 |
  CPY #$0C                                  ; $028697 |
  BCC CODE_0286A0                           ; $028699 |
  STZ !s_player_state                       ; $02869B |
  LDY #$08                                  ; $02869E |

CODE_0286A0:
  TYA                                       ; $0286A0 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0286A1 |
  LDA $8670,y                               ; $0286A3 |
  AND #$00FF                                ; $0286A6 |
  STA !s_spr_anim_frame,x                   ; $0286A9 |
  LDA $867B,y                               ; $0286AC |
  AND #$00FF                                ; $0286AF |
  STA !s_spr_timer_4,x                      ; $0286B2 |

CODE_0286B5:
  LDA !s_spr_timer_2,x                      ; $0286B5 |
  BNE CODE_0286CC                           ; $0286B8 |
  LDA #$0001                                ; $0286BA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0286BD |
  LDA #$000F                                ; $0286BF |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0286C2 |
  LDA #$0003                                ; $0286C4 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0286C7 |
  BRA CODE_02870B                           ; $0286CA |

CODE_0286CC:
  LDA !s_spr_timer_3,x                      ; $0286CC |
  BNE CODE_0286F9                           ; $0286CF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0286D1 |
  CMP #$0007                                ; $0286D3 |
  BCC CODE_0286F9                           ; $0286D6 |
  LDA !s_spr_x_player_delta,x               ; $0286D8 |
  CMP #$0030                                ; $0286DB |
  BCS CODE_0286F9                           ; $0286DE |
  LDA !s_spr_y_player_delta,x               ; $0286E0 |
  CMP #$0030                                ; $0286E3 |
  BCS CODE_0286F9                           ; $0286E6 |
  LDA #$0002                                ; $0286E8 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0286EB |
  LDA #$000A                                ; $0286ED |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0286F0 |
  STZ !s_spr_timer_4,x                      ; $0286F2 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0286F5 |
  BRA CODE_02870B                           ; $0286F7 |

CODE_0286F9:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0286F9 |
  CMP #$0800                                ; $0286FC |
  BCC CODE_02870B                           ; $0286FF |
  LDA #$0003                                ; $028701 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $028704 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $028706 |
  STZ !s_spr_timer_4,x                      ; $028708 |

CODE_02870B:
  LDA $7860,x                               ; $02870B |
  BNE CODE_028739                           ; $02870E |
  LDA #$0082                                ; $028710 |\ play sound #$0082
  JSL push_sound_queue                      ; $028713 |/
  LDA #$0004                                ; $028717 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02871A |
  LDA #$000E                                ; $02871C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02871F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $028721 |
  LDA !s_spr_y_pixel_pos,x                  ; $028723 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $028726 |
  LDA #$0013                                ; $028728 |
  STA !s_spr_anim_frame,x                   ; $02872B |
  LDA #$0004                                ; $02872E |
  STA !s_spr_timer_4,x                      ; $028731 |
  JSL $02A982                               ; $028734 |
  RTS                                       ; $028738 |

CODE_028739:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $028739 |
  CLC                                       ; $02873B |
  ADC #$0008                                ; $02873C |
  CMP #$0101                                ; $02873F |
  BCC CODE_028768                           ; $028742 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $028744 |
  INC A                                     ; $028746 |
  CMP #$0009                                ; $028747 |
  BCC CODE_028763                           ; $02874A |
  LDY !s_spr_oam_count,x                    ; $02874C |
  CPY #$20                                  ; $02874F |
  BCS CODE_028760                           ; $028751 |
  LDA !s_spr_oam_1,x                        ; $028753 |
  CLC                                       ; $028756 |
  ADC #$6000                                ; $028757 |
  STA !s_spr_oam_1,x                        ; $02875A |
  STZ !s_player_state                       ; $02875D |

CODE_028760:
  LDA #$0007                                ; $028760 |

CODE_028763:
  STA !s_spr_wildcard_5_lo_dp,x             ; $028763 |
  LDA #$0000                                ; $028765 |

CODE_028768:
  STA !s_spr_wildcard_3_lo_dp,x             ; $028768 |
  LDA !s_spr_x_speed_lo,x                   ; $02876A |
  DEC A                                     ; $02876D |
  BPL CODE_028775                           ; $02876E |
  STZ !s_spr_gsu_morph_1_lo,x               ; $028770 |
  BRA CODE_02877C                           ; $028773 |

CODE_028775:
  CLC                                       ; $028775 |
  ADC !s_spr_gsu_morph_1_lo,x               ; $028776 |
  STA !s_spr_gsu_morph_1_lo,x               ; $028779 |

CODE_02877C:
  RTS                                       ; $02877C |

  db $06, $05, $04                          ; $02877D |
  db $03, $02, $01                          ; $028780 |
  db $0A, $0B, $0A                          ; $028783 |
  db $02, $03, $04                          ; $028786 |
  db $05, $06, $07                          ; $028789 |

  db $01, $01, $01                          ; $02878C |
  db $01, $01, $01                          ; $02878F |
  db $02, $10, $02                          ; $028792 |
  db $01, $01, $01                          ; $028795 |
  db $01, $01, $10                          ; $028798 |

; state $01
  TYX                                       ; $02879B |
  LDA !s_spr_timer_2,x                      ; $02879C |
  BNE CODE_0287B7                           ; $02879F |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0287A1 |
  BNE CODE_0287BB                           ; $0287A3 |
  DEC !s_spr_gsu_morph_2_lo,x               ; $0287A5 |
  BNE CODE_0287B9                           ; $0287A8 |
  LDA #$01C0                                ; $0287AA |
  STA !s_spr_timer_2,x                      ; $0287AD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0287B0 |
  LDA #$0008                                ; $0287B2 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0287B5 |

CODE_0287B7:
  BRA CODE_028824                           ; $0287B7 |

CODE_0287B9:
  LDY #$0F                                  ; $0287B9 |

CODE_0287BB:
  DEY                                       ; $0287BB |
  TYA                                       ; $0287BC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0287BD |
  LDA $878C,y                               ; $0287BF |
  AND #$00FF                                ; $0287C2 |
  STA !s_spr_timer_2,x                      ; $0287C5 |
  LDA $877D,y                               ; $0287C8 |
  AND #$00FF                                ; $0287CB |
  STA !s_spr_anim_frame,x                   ; $0287CE |
  CMP #$000B                                ; $0287D1 |
  BNE CODE_028824                           ; $0287D4 |
  LDA #$0038                                ; $0287D6 |
  JSL spawn_sprite_active                   ; $0287D9 |
  BCC CODE_028824                           ; $0287DD |
  PHY                                       ; $0287DF |
  LDA #$0004                                ; $0287E0 |\ play sound #$0004
  JSL push_sound_queue                      ; $0287E3 |/
  PLY                                       ; $0287E7 |
  LDA !s_spr_x_pixel_pos,x                  ; $0287E8 |
  CLC                                       ; $0287EB |
  ADC $6000                                 ; $0287EC |
  SEC                                       ; $0287EF |
  SBC #$0008                                ; $0287F0 |
  STA !s_spr_x_pixel_pos,y                  ; $0287F3 |
  LDA !s_spr_y_pixel_pos,x                  ; $0287F6 |
  CLC                                       ; $0287F9 |
  ADC $6002                                 ; $0287FA |
  CLC                                       ; $0287FD |
  ADC #$0006                                ; $0287FE |
  STA !s_spr_y_pixel_pos,y                  ; $028801 |
  LDA #$FE80                                ; $028804 |
  STA !s_spr_x_speed_lo,y                   ; $028807 |
  LDA #$0010                                ; $02880A |
  STA !s_spr_x_accel,y                      ; $02880D |
  LDA #$0120                                ; $028810 |
  STA !s_spr_timer_1,y                      ; $028813 |
  LDA #$0002                                ; $028816 |
  STA !s_spr_timer_2,y                      ; $028819 |
  LDA #$0020                                ; $02881C |
  STA !s_spr_timer_3,y                      ; $02881F |
  LDX $12                                   ; $028822 |

CODE_028824:
  JMP CODE_02870B                           ; $028824 |

; state $02
  TYX                                       ; $028827 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $028828 |
  ASL A                                     ; $02882A |
  TAY                                       ; $02882B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02882C |
  CLC                                       ; $02882E |
  ADC $8A41,y                               ; $02882F |
  CMP #$0101                                ; $028832 |
  BCC CODE_02885B                           ; $028835 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $028837 |
  INC A                                     ; $028839 |
  CMP #$000D                                ; $02883A |
  BCC CODE_02884A                           ; $02883D |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02883F |
  LDA #$0080                                ; $028841 |
  STA !s_spr_timer_3,x                      ; $028844 |
  LDA #$0007                                ; $028847 |

CODE_02884A:
  STA !s_spr_wildcard_5_lo_dp,x             ; $02884A |
  CMP #$000B                                ; $02884C |
  BNE CODE_028858                           ; $02884F |
  LDA #$0083                                ; $028851 |\ play sound #$0083
  JSL push_sound_queue                      ; $028854 |/

CODE_028858:
  LDA #$0000                                ; $028858 |

CODE_02885B:
  STA !s_spr_wildcard_3_lo_dp,x             ; $02885B |
  RTS                                       ; $02885D |

  db $07, $06                               ; $02885E |
  db $05, $0C                               ; $028860 |
  db $0D, $0E                               ; $028862 |
  db $0F, $10                               ; $028864 |
  db $11, $10                               ; $028866 |
  db $0F, $10                               ; $028868 |
  db $01, $01                               ; $02886A |
  db $01, $01                               ; $02886C |
  db $01, $10                               ; $02886E |
  db $02, $20                               ; $028870 |
  db $02, $10                               ; $028872 |

; state $03
  TYX                                       ; $028874 |
  LDA !s_spr_timer_4,x                      ; $028875 |
  BNE CODE_0288A5                           ; $028878 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02887A |
  INY                                       ; $02887C |
  CPY #$0C                                  ; $02887D |
  BCC CODE_028890                           ; $02887F |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $028881 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $028883 |
  LDA #$0008                                ; $028886 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $028889 |
  STZ !s_spr_timer_3,x                      ; $02888B |
  BRA CODE_0288A5                           ; $02888E |

CODE_028890:
  TYA                                       ; $028890 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $028891 |
  LDA $885D,y                               ; $028893 |
  AND #$00FF                                ; $028896 |
  STA !s_spr_anim_frame,x                   ; $028899 |
  LDA $8868,y                               ; $02889C |
  AND #$00FF                                ; $02889F |
  STA !s_spr_timer_4,x                      ; $0288A2 |

CODE_0288A5:
  JMP CODE_02870B                           ; $0288A5 |

  db $02, $FF                               ; $0288A8 |

; state $04
  TYX                                       ; $0288AA |
  LDA !s_spr_y_pixel_pos,x                  ; $0288AB |
  SEC                                       ; $0288AE |
  SBC !s_spr_wildcard_6_lo_dp,x             ; $0288AF |
  CMP #$007E                                ; $0288B1 |
  BCS CODE_0288E7                           ; $0288B4 |
  XBA                                       ; $0288B6 |
  STA !reg_wrdivl                           ; $0288B7 |
  LDY #$7E                                  ; $0288BA |
  STY !reg_wrdivb                           ; $0288BC |
  LDA !s_spr_timer_4,x                      ; $0288BF |
  BNE CODE_0288DB                           ; $0288C2 |
  LDY !s_spr_anim_frame,x                   ; $0288C4 |
  CPY #$14                                  ; $0288C7 |
  BEQ CODE_0288CC                           ; $0288C9 |
  INY                                       ; $0288CB |

CODE_0288CC:
  TYA                                       ; $0288CC |
  STA !s_spr_anim_frame,x                   ; $0288CD |
  LDA $8895,y                               ; $0288D0 |
  AND #$00FF                                ; $0288D3 |
  STA !s_spr_timer_4,x                      ; $0288D6 |
  BRA CODE_0288E1                           ; $0288D9 |

CODE_0288DB:
  NOP                                       ; $0288DB |
  NOP                                       ; $0288DC |
  NOP                                       ; $0288DD |
  NOP                                       ; $0288DE |
  NOP                                       ; $0288DF |
  NOP                                       ; $0288E0 |

CODE_0288E1:
  LDA !reg_rddivl                           ; $0288E1 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0288E4 |
  RTS                                       ; $0288E6 |

CODE_0288E7:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0288E7 |
  CMP #$000E                                ; $0288E9 |
  BNE CODE_0288F2                           ; $0288EC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0288EE |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0288F0 |

CODE_0288F2:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0288F2 |
  CMP #$0100                                ; $0288F4 |
  BCS CODE_0288FE                           ; $0288F7 |
  ADC #$0010                                ; $0288F9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0288FC |

CODE_0288FE:
  RTS                                       ; $0288FE |

; state $05
  TYX                                       ; $0288FF |
  LDA !s_spr_timer_4,x                      ; $028900 |
  BEQ CODE_028906                           ; $028903 |
  RTS                                       ; $028905 |

CODE_028906:
  LDA !r_bg1_cam_x                          ; $028906 |
  CLC                                       ; $028909 |
  ADC #$0078                                ; $02890A |
  STA $00                                   ; $02890D |
  LDA !r_bg1_cam_y                          ; $02890F |
  CLC                                       ; $028912 |
  ADC #$00C0                                ; $028913 |
  STA $02                                   ; $028916 |
  JSL $0D8ED7                               ; $028918 |
  JSL $03A32E                               ; $02891C |
  PLA                                       ; $028920 |
  RTL                                       ; $028921 | back out of sprite

; boss explosion sub
  STZ !s_player_x_speed                     ; $028922 |
  LDA #$0002                                ; $028925 |
  STA !s_player_state                       ; $028928 |
  STZ $617A                                 ; $02892B |
  STZ $617C                                 ; $02892E |
  STZ !s_player_invincibility_timer         ; $028931 |
  STZ !s_egg_throw_state                    ; $028934 |
  STZ !s_egg_cursor_locked_flag             ; $028937 |
  STZ !s_egg_cursor_radius                  ; $02893A |
  RTL                                       ; $02893D |

; roger sub
CODE_02893E:
  LDY !s_spr_draw_priority,x                ; $02893E |
  BPL CODE_028944                           ; $028941 |
  RTS                                       ; $028943 |

CODE_028944:
  LDA !s_spr_wildcard_4_lo,x                ; $028944 |
  CMP #$0006                                ; $028947 |
  BNE CODE_028958                           ; $02894A |
  LDA #$0008                                ; $02894C |
  STA $00                                   ; $02894F |
  STZ $02                                   ; $028951 |
  JSR CODE_0289CB                           ; $028953 |
  PLA                                       ; $028956 |
  RTL                                       ; $028957 | back out of sprite

CODE_028958:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $028958 |
  ASL A                                     ; $02895A |
  TAY                                       ; $02895B |
  LDA $8A33,y                               ; $02895C |
  STA !gsu_r1                               ; $02895F |
  LDA $8A35,y                               ; $028962 |
  STA !gsu_r2                               ; $028965 |
  LDA #$0002                                ; $028968 |
  STA !gsu_r0                               ; $02896B |
  LDA #$0042                                ; $02896E |
  STA !gsu_r3                               ; $028971 |
  STZ !gsu_r4                               ; $028974 |
  LDA #$449E                                ; $028977 |
  STA !gsu_r5                               ; $02897A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02897D |
  STA !gsu_r6                               ; $02897F |
  LDA !s_spr_cam_x_pos,x                    ; $028982 |
  CLC                                       ; $028985 |
  ADC #$0002                                ; $028986 |
  STA $6040                                 ; $028989 |
  LDA !s_spr_cam_y_pos,x                    ; $02898C |
  SEC                                       ; $02898F |
  SBC #$0008                                ; $028990 |
  STA $6042                                 ; $028993 |
  LDX #$08                                  ; $028996 |
  LDA #$E93B                                ; $028998 |
  JSL r_gsu_init_1                          ; $02899B | GSU init
  JSL $00BE39                               ; $02899F |

; args to $00BE39
  dw $5040, $727E                           ; $0289A3 |
  dw $7033, $0348                           ; $0289A7 |

  LDX $12                                   ; $0289AB |
  LDA #$0002                                ; $0289AD |
  STA !r_reg_ts_mirror                      ; $0289B0 |
  LDA #$0065                                ; $0289B3 |
  STA !r_reg_cgadsub_mirror                 ; $0289B6 |
  LDA #$0018                                ; $0289B9 |
  TSB !r_reg_hdmaen_mirror                  ; $0289BC |
  LDA $7045A2                               ; $0289BF |
  STA $00                                   ; $0289C3 |
  LDA $7045A4                               ; $0289C5 |
  STA $02                                   ; $0289C9 |

CODE_0289CB:
  REP #$10                                  ; $0289CB |
  LDY !s_spr_oam_pointer,x                  ; $0289CD |
  LDX #$0003                                ; $0289D0 |

CODE_0289D3:
  LDA $6000,y                               ; $0289D3 |
  CLC                                       ; $0289D6 |
  ADC $00                                   ; $0289D7 |
  STA $6000,y                               ; $0289D9 |
  LDA $6002,y                               ; $0289DC |
  CLC                                       ; $0289DF |
  ADC $02                                   ; $0289E0 |
  STA $6002,y                               ; $0289E2 |
  TYA                                       ; $0289E5 |
  CLC                                       ; $0289E6 |
  ADC #$0008                                ; $0289E7 |
  TAY                                       ; $0289EA |
  DEX                                       ; $0289EB |
  BNE CODE_0289D3                           ; $0289EC |
  LDX $12                                   ; $0289EE |
  LDA !s_spr_oam_1,x                        ; $0289F0 |
  CMP #$2000                                ; $0289F3 |
  BCC CODE_028A2E                           ; $0289F6 |
  LDA $70459E                               ; $0289F8 |
  SEC                                       ; $0289FC |
  SBC #$0010                                ; $0289FD |
  STA $6000                                 ; $028A00 |
  LDA $7045A0                               ; $028A03 |
  SEC                                       ; $028A07 |
  SBC #$0004                                ; $028A08 |
  STA $6002                                 ; $028A0B |
  LDX #$000C                                ; $028A0E |

CODE_028A11:
  LDA $6000,y                               ; $028A11 |
  CLC                                       ; $028A14 |
  ADC $6000                                 ; $028A15 |
  STA $6000,y                               ; $028A18 |
  LDA $6002,y                               ; $028A1B |
  CLC                                       ; $028A1E |
  ADC $6002                                 ; $028A1F |
  STA $6002,y                               ; $028A22 |
  TYA                                       ; $028A25 |
  CLC                                       ; $028A26 |
  ADC #$0008                                ; $028A27 |
  TAY                                       ; $028A2A |
  DEX                                       ; $028A2B |
  BNE CODE_028A11                           ; $028A2C |

CODE_028A2E:
  SEP #$10                                  ; $028A2E |
  LDX $12                                   ; $028A30 |
  RTS                                       ; $028A32 |

; roger gsu table pointers
  dw $8A5D                                  ; $028A33 | $00
  dw $8AE1                                  ; $028A35 | $01
  dw $8B65                                  ; $028A37 | $02
  dw $8BE9                                  ; $028A39 | $03
  dw $8C6D                                  ; $028A3B | $04
  dw $8CF1                                  ; $028A3D | $05
  dw $8D75                                  ; $028A3F | $06
  dw $8DF9                                  ; $028A41 | $07
  dw $8E7D                                  ; $028A43 | $08
  dw $8DF9                                  ; $028A45 | $09
  dw $8DF9                                  ; $028A47 | $0A
  dw $8F01                                  ; $028A49 | $0B
  dw $8F85                                  ; $028A4B | $0C
  dw $8DF9                                  ; $028A4D | $0D
  dw $8DF9                                  ; $028A4F | $0E
  dw $9009                                  ; $028A51 | $0F
  dw $8BE9                                  ; $028A53 | $10

; roger gsu tables
  dw $0008, $0010, $0008, $0008             ; $028A55 |

  dw $0000, $0000, $0000, $0000             ; $028A5D |
  dw $0000, $0000, $0001, $0001             ; $028A65 |
  dw $0001, $0001, $0001, $0001             ; $028A6D |
  dw $0001, $0001, $0002, $0002             ; $028A75 |
  dw $0002, $0002, $0003, $0003             ; $028A7D |
  dw $0003, $0003, $0004, $0004             ; $028A85 |
  dw $0004, $0004, $0006, $0006             ; $028A8D |
  dw $0006, $0006, $0008, $0008             ; $028A95 |
  dw $0008, $0008, $000A, $000A             ; $028A9D |
  dw $000A, $000A, $000B, $000B             ; $028AA5 |
  dw $000B, $000B, $000C, $000C             ; $028AAD |
  dw $000C, $000C, $000D, $000D             ; $028AB5 |
  dw $000D, $000D, $000D, $000D             ; $028ABD |
  dw $000D, $000D, $000E, $000E             ; $028AC5 |
  dw $000E, $000E, $000E, $000E             ; $028ACD |
  dw $000E, $000E, $000E, $000F             ; $028AD5 |
  dw $000F, $0008                           ; $028ADD |

  dw $0000, $0000, $0000, $0000             ; $028AE1 |
  dw $0000, $0000, $0001, $0001             ; $028AE9 |
  dw $0001, $0001, $0001, $0001             ; $028AF1 |
  dw $0001, $0001, $FF02, $FF02             ; $028AF9 |
  dw $FF02, $FF02, $FF03, $FF03             ; $028B01 |
  dw $FF03, $FF03, $FE04, $FE04             ; $028B09 |
  dw $FE04, $FE04, $FE06, $FE06             ; $028B11 |
  dw $FE06, $FE06, $FE08, $FE08             ; $028B19 |
  dw $FE08, $FE08, $FE0A, $FE0A             ; $028B21 |
  dw $FE0A, $FE0A, $FE0B, $FE0B             ; $028B29 |
  dw $FE0B, $FE0B, $FF0C, $FF0C             ; $028B31 |
  dw $FF0C, $FF0C, $FF0D, $FF0D             ; $028B39 |
  dw $FF0D, $FF0D, $FF0D, $FF0D             ; $028B41 |
  dw $FF0D, $FF0D, $000E, $000E             ; $028B49 |
  dw $000E, $000E, $000E, $000E             ; $028B51 |
  dw $000E, $000E, $000E, $000F             ; $028B59 |
  dw $000F, $0008                           ; $028B61 |

  dw $0000, $0000, $0000, $FF02             ; $028B65 |
  dw $FF02, $FF02, $FD03, $FD03             ; $028B6D |
  dw $FD03, $FD03, $FB04, $FB04             ; $028B75 |
  dw $FB04, $FB04, $F805, $F805             ; $028B7D |
  dw $F805, $F805, $F505, $F505             ; $028B85 |
  dw $F505, $F505, $F206, $F206             ; $028B8D |
  dw $F206, $F206, $F108, $F108             ; $028B95 |
  dw $F108, $F108, $F10B, $F10B             ; $028B9D |
  dw $F10B, $F10B, $F10F, $F10F             ; $028BA5 |
  dw $F10F, $F10F, $F210, $F210             ; $028BAD |
  dw $F210, $F210, $F312, $F312             ; $028BB5 |
  dw $F312, $F312, $F613, $F613             ; $028BBD |
  dw $F613, $F613, $F912, $F912             ; $028BC5 |
  dw $F912, $F912, $FB12, $FB12             ; $028BCD |
  dw $FB12, $FB12, $FE0F, $FE0F             ; $028BD5 |
  dw $FE0F, $FE0F, $FE0F, $000F             ; $028BDD |
  dw $000F, $F50B                           ; $028BE5 |

  dw $0000, $FF00, $FEFF, $FDFF             ; $028BE9 |
  dw $FCFE, $FBFE, $FAFE, $F9FE             ; $028BF1 |
  dw $F8FF, $F6FF, $F500, $F300             ; $028BF9 |
  dw $F100, $F000, $EFFF, $EEFE             ; $028C01 |
  dw $EDFD, $EBFC, $EAFB, $E9FB             ; $028C09 |
  dw $E8FA, $E7FA, $E5FA, $E4FB             ; $028C11 |
  dw $E3FC, $E2FD, $E1FF, $E100             ; $028C19 |
  dw $E102, $E103, $E105, $E107             ; $028C21 |
  dw $E109, $E10A, $E20C, $E30D             ; $028C29 |
  dw $E30F, $E310, $E411, $E412             ; $028C31 |
  dw $E514, $E615, $E716, $E816             ; $028C39 |
  dw $E917, $EB17, $ED17, $EF16             ; $028C41 |
  dw $F015, $F113, $F211, $F310             ; $028C49 |
  dw $F40F, $F50E, $F60D, $F70C             ; $028C51 |
  dw $F90C, $FA0C, $FB0C, $FC0C             ; $028C59 |
  dw $FD0C, $FE0D, $FF0E, $000F             ; $028C61 |
  dw $000F, $E505                           ; $028C69 |

  dw $0000, $FE01, $FD02, $FC02             ; $028C6D |
  dw $FB03, $FA03, $F703, $F602             ; $028C75 |
  dw $F401, $F300, $F2FF, $F1FE             ; $028C7D |
  dw $EFFC, $EDFB, $EBFA, $E9FA             ; $028C85 |
  dw $E7F8, $E6F5, $E4F2, $E2F1             ; $028C8D |
  dw $E0F0, $DEF0, $DBF0, $D9F2             ; $028C95 |
  dw $D7F4, $D5F7, $D4F9, $D2FB             ; $028C9D |
  dw $D1FD, $D1FF, $D101, $D103             ; $028CA5 |
  dw $D105, $D207, $D309, $D40A             ; $028CAD |
  dw $D50C, $D50E, $D610, $D712             ; $028CB5 |
  dw $D913, $DA14, $DC14, $DE14             ; $028CBD |
  dw $E015, $E116, $E318, $E519             ; $028CC5 |
  dw $E71A, $E91A, $EB1B, $ED1B             ; $028CCD |
  dw $EF1A, $F118, $F316, $F515             ; $028CD5 |
  dw $F716, $F917, $FB17, $FD16             ; $028CDD |
  dw $FE14, $FF12, $FF10, $000F             ; $028CE5 |
  dw $000F, $D501                           ; $028CED |

  dw $0000, $FFFF, $FFFD, $FDFB             ; $028CF1 |
  dw $FBFA, $F9F9, $F7F8, $F5F8             ; $028CF9 |
  dw $F3F8, $F1F9, $EFF9, $ECF9             ; $028D01 |
  dw $E9F9, $E7F7, $E6F5, $E4F3             ; $028D09 |
  dw $E1F2, $DDF3, $D9F2, $D6EF             ; $028D11 |
  dw $D3EE, $CEED, $CAEE, $C6EF             ; $028D19 |
  dw $C3F1, $C0F4, $BEF6, $BBF8             ; $028D21 |
  dw $BAFC, $B900, $B904, $B907             ; $028D29 |
  dw $BA0B, $BA0E, $BB10, $BC12             ; $028D31 |
  dw $BD14, $BF16, $C118, $C318             ; $028D39 |
  dw $C617, $C818, $CA1C, $CC1F             ; $028D41 |
  dw $D020, $D221, $D622, $DB20             ; $028D49 |
  dw $DE1D, $E21A, $E518, $E716             ; $028D51 |
  dw $E914, $EB13, $ED11, $EF10             ; $028D59 |
  dw $F10F, $F40E, $F60D, $F90D             ; $028D61 |
  dw $FB0E, $FD0E, $FF0F, $000F             ; $028D69 |
  dw $000F, $BD04                           ; $028D71 |

  dw $0000, $FEFF, $FBFF, $F8FE             ; $028D75 |
  dw $F5FE, $F2FC, $EFFA, $ECF9             ; $028D7D |
  dw $E9F8, $E6F8, $E3F9, $E0F8             ; $028D85 |
  dw $DCF7, $D7F5, $D4F4, $D3F1             ; $028D8D |
  dw $D0EE, $CCED, $C8ED, $C3EE             ; $028D95 |
  dw $C0EA, $BAE9, $B5E9, $B0EA             ; $028D9D |
  dw $ABEC, $A7EF, $A3F3, $9EFA             ; $028DA5 |
  dw $9C00, $9A05, $990F, $9A15             ; $028DAD |
  dw $9C1A, $9E1E, $A021, $A323             ; $028DB5 |
  dw $A525, $A826, $AC26, $B027             ; $028DBD |
  dw $B526, $BA24, $BD20, $C01C             ; $028DC5 |
  dw $C518, $CA16, $D015, $D517             ; $028DCD |
  dw $D91A, $DD1C, $E01C, $E31C             ; $028DD5 |
  dw $E61C, $E91C, $EB1B, $ED1A             ; $028DDD |
  dw $F019, $F318, $F617, $F915             ; $028DE5 |
  dw $FB13, $FD12, $FF10, $000F             ; $028DED |
  dw $000F, $9D0F                           ; $028DF5 |

  dw $0000, $FD00, $FAFF, $F7FF             ; $028DF9 |
  dw $F4FF, $F100, $EEFF, $EBFE             ; $028E01 |
  dw $E8FE, $E5FB, $E1FA, $DDF7             ; $028E09 |
  dw $D7F2, $D1EE, $CCEC, $C7EA             ; $028E11 |
  dw $C0EB, $BAEB, $B5E9, $B0E8             ; $028E19 |
  dw $AAE6, $A4E6, $9EE7, $98EA             ; $028E21 |
  dw $92EC, $8CEE, $88F2, $85F6             ; $028E29 |
  dw $83FA, $82FF, $8205, $830A             ; $028E31 |
  dw $840F, $8613, $8817, $8A19             ; $028E39 |
  dw $8D1C, $901F, $9321, $9623             ; $028E41 |
  dw $9C24, $A125, $A724, $AC22             ; $028E49 |
  dw $B01E, $B81C, $BE1D, $C420             ; $028E51 |
  dw $CA23, $D024, $D623, $DA23             ; $028E59 |
  dw $DE21, $E21F, $E51C, $E919             ; $028E61 |
  dw $EC17, $F016, $F415, $F714             ; $028E69 |
  dw $F912, $FC0F, $FE0C, $000B             ; $028E71 |
  dw $98FE, $8605                           ; $028E79 |

  dw $0000, $FD01, $FA00, $F7FF             ; $028E7D |
  dw $F4FC, $F1FA, $EEF8, $EBF6             ; $028E85 |
  dw $E8F5, $E4F5, $DFF4, $DAF4             ; $028E8D |
  dw $D5F3, $D0F3, $CBF2, $C6F1             ; $028E95 |
  dw $C0ED, $BAEA, $B6E8, $B0E6             ; $028E9D |
  dw $AAE7, $A4E8, $9DE8, $97EB             ; $028EA5 |
  dw $91EE, $8CF1, $88F6, $85FA             ; $028EAD |
  dw $83FE, $8201, $8206, $820B             ; $028EB5 |
  dw $830F, $8413, $8617, $881B             ; $028EBD |
  dw $8A1E, $8D21, $9123, $9624             ; $028EC5 |
  dw $9C24, $A124, $A722, $AB22             ; $028ECD |
  dw $B124, $B824, $BF21, $C51E             ; $028ED5 |
  dw $CC1E, $D01F, $D620, $DB21             ; $028EDD |
  dw $DF22, $E322, $E622, $EA22             ; $028EE5 |
  dw $ED20, $F01E, $F41B, $F717             ; $028EED |
  dw $F914, $FC10, $FE0D, $000B             ; $028EF5 |
  dw $9CF9, $8606                           ; $028EFD |

  dw $0000, $FE00, $FB01, $F902             ; $028F01 |
  dw $F703, $F405, $F106, $EE06             ; $028F09 |
  dw $EA05, $E604, $E203, $DF02             ; $028F11 |
  dw $DB01, $D7FF, $D3FD, $CFFB             ; $028F19 |
  dw $CCFA, $C8F9, $C4F8, $BDF8             ; $028F21 |
  dw $B6F8, $B0F9, $ABFB, $A7FD             ; $028F29 |
  dw $A300, $A003, $9E07, $9D0A             ; $028F31 |
  dw $9C0E, $9B12, $9B16, $9B1A             ; $028F39 |
  dw $9C1E, $9D22, $9E26, $A02A             ; $028F41 |
  dw $A22E, $A432, $A635, $A938             ; $028F49 |
  dw $AD3C, $B240, $B744, $BB47             ; $028F51 |
  dw $C14A, $C74D, $CE4F, $D351             ; $028F59 |
  dw $D752, $DC53, $E053, $E453             ; $028F61 |
  dw $E852, $EC50, $F14D, $F44A             ; $028F69 |
  dw $F747, $F943, $FB3E, $FD37             ; $028F71 |
  dw $FF30, $0027, $001A, $000F             ; $028F79 |
  dw $E037, $9F16                           ; $028F81 |

  dw $0000, $00E8, $00CF, $00B8             ; $028F85 |
  dw $00AA, $FF9E, $FE97, $F992             ; $028F8D |
  dw $F390, $ED90, $E991, $E495             ; $028F95 |
  dw $E09A, $DEA2, $DDA9, $DCB1             ; $028F9D |
  dw $DBB8, $D8BE, $D5C2, $D1C6             ; $028FA5 |
  dw $CEC9, $CACC, $C6CF, $C2D2             ; $028FAD |
  dw $BED6, $BAD9, $B7DC, $B4E0             ; $028FB5 |
  dw $B2E4, $B0E9, $B0ED, $B0F1             ; $028FBD |
  dw $B1F6, $B2FA, $B4FE, $B602             ; $028FC5 |
  dw $B805, $BA07, $BD09, $C20B             ; $028FCD |
  dw $C60C, $CB0C, $CF0B, $D30A             ; $028FD5 |
  dw $D707, $DA04, $DC01, $DFFE             ; $028FDD |
  dw $E2FB, $E5F7, $E6F4, $E8F1             ; $028FE5 |
  dw $EDEE, $F1EF, $F4F2, $F5F5             ; $028FED |
  dw $F7FA, $F800, $F804, $F908             ; $028FF5 |
  dw $FA0B, $FB0D, $FE0F, $000F             ; $028FFD |
  dw $F09F, $B4ED                           ; $029005 |

  dw $0000, $FA00, $F400, $EE00             ; $029009 |
  dw $E800, $E200, $DC00, $D6FF             ; $029011 |
  dw $D0FF, $CAFC, $C2FC, $BAF9             ; $029019 |
  dw $AEF5, $A2F2, $98F0, $8EEF             ; $029021 |
  dw $80F0, $74F0, $6AEE, $60ED             ; $029029 |
  dw $54EC, $48EC, $3CEC, $30EF             ; $029031 |
  dw $24F0, $18F2, $10F5, $0AF8             ; $029039 |
  dw $06FC, $0400, $0404, $0608             ; $029041 |
  dw $080C, $0C0F, $1012, $1414             ; $029049 |
  dw $1A16, $2018, $261A, $2C1C             ; $029051 |
  dw $381C, $421D, $4E1C, $581B             ; $029059 |
  dw $6018, $7016, $7C17, $8819             ; $029061 |
  dw $941C, $A01C, $AC1C, $B41C             ; $029069 |
  dw $BC1A, $C418, $CA16, $D214             ; $029071 |
  dw $D812, $E011, $E810, $EE10             ; $029079 |
  dw $F20E, $F80C, $FC09, $0008             ; $029081 |
  dw $30FF, $0804                           ; $029089 |

init_roger_flame:
  RTL                                       ; $02908D |

  dw $0010, $0018                           ; $02908E |

  dw $0008, $0016                           ; $029092 |

  dw $0000, $0001, $0002, $0003             ; $029096 |
  dw $0004, $0005, $0004, $0005             ; $02909E |
  dw $0003, $0002, $0001, $0000             ; $0290A6 |

  dw $0000, $0000, $0000, $0000             ; $0290AE |
  dw $0000, $0000, $0040, $0040             ; $0290B6 |
  dw $0000, $0000, $0000, $0000             ; $0290BE |

  dw $0002, $0002, $0002, $0002             ; $0290C6 |
  dw $0008, $0008, $0008, $0008             ; $0290CE |
  dw $0006, $0006, $0006, $0006             ; $0290D6 |

  dw $FF80, $0080, $FF00, $0100             ; $0290DE |

main_roger_flame:
  JSL $03AF23                               ; $0290E6 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0290EA |
  LDA !s_spr_timer_1,x                      ; $0290EC |
  BNE CODE_02910A                           ; $0290EF |
  LDA #$0008                                ; $0290F1 |
  STA !s_spr_x_accel,x                      ; $0290F4 |
  STZ !s_spr_x_accel_ceiling,x              ; $0290F7 |
  LDA #$0040                                ; $0290FA |
  STA !s_spr_y_accel,x                      ; $0290FD |
  LDA #$FF80                                ; $029100 |
  STA !s_spr_y_accel_ceiling,x              ; $029103 |
  LDY #$02                                  ; $029106 |
  BRA CODE_029161                           ; $029108 |

CODE_02910A:
  LDY !s_spr_collision_id,x                 ; $02910A |
  BPL CODE_029113                           ; $02910D |
  JSL player_hit_sprite                     ; $02910F |

CODE_029113:
  LDA !s_spr_x_accel_ceiling,x              ; $029113 |
  BNE CODE_029127                           ; $029116 |
  LDA !s_spr_x_speed_lo,x                   ; $029118 |
  BNE CODE_02915F                           ; $02911B |
  STZ !s_spr_x_accel,x                      ; $02911D |
  LDA !s_spr_timer_3,x                      ; $029120 |
  BNE CODE_02915F                           ; $029123 |
  BRA CODE_029133                           ; $029125 |

CODE_029127:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $029127 |
  BIT #$001F                                ; $029129 |
  BNE CODE_02915F                           ; $02912C |
  AND #$0040                                ; $02912E |
  BNE CODE_02914A                           ; $029131 |

CODE_029133:
  LDY #$00                                  ; $029133 |
  LDA !s_spr_x_player_delta,x               ; $029135 |
  BPL CODE_02913C                           ; $029138 |
  LDY #$02                                  ; $02913A |

CODE_02913C:
  LDA $90DE,y                               ; $02913C |
  STA !s_spr_x_accel_ceiling,x              ; $02913F |
  LDA #$0002                                ; $029142 |
  STA !s_spr_x_accel,x                      ; $029145 |
  BRA CODE_02915F                           ; $029148 |

CODE_02914A:
  LDY #$00                                  ; $02914A |
  LDA !s_spr_y_player_delta,x               ; $02914C |
  BPL CODE_029153                           ; $02914F |
  LDY #$02                                  ; $029151 |

CODE_029153:
  LDA $90DE,y                               ; $029153 |
  STA !s_spr_y_accel_ceiling,x              ; $029156 |
  LDA #$0002                                ; $029159 |
  STA !s_spr_y_accel,x                      ; $02915C |

CODE_02915F:
  LDY #$00                                  ; $02915F |

CODE_029161:
  LDA !s_spr_timer_2,x                      ; $029161 |
  BNE CODE_029195                           ; $029164 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $029166 |
  INC A                                     ; $029168 |
  INC A                                     ; $029169 |
  CMP $908E,y                               ; $02916A |
  BNE CODE_02917A                           ; $02916D |
  CPY #$00                                  ; $02916F |
  BEQ CODE_029177                           ; $029171 |
  JML $03A31E                               ; $029173 |

CODE_029177:
  LDA $9092,y                               ; $029177 |

CODE_02917A:
  STA !s_spr_wildcard_4_lo_dp,x             ; $02917A |
  TAY                                       ; $02917C |
  LDA $9096,y                               ; $02917D |
  STA !s_spr_anim_frame,x                   ; $029180 |
  LDA !s_spr_oam_yxppccct,x                 ; $029183 |
  AND #$00BF                                ; $029186 |
  ORA $90AE,y                               ; $029189 |
  STA !s_spr_oam_yxppccct,x                 ; $02918C |
  LDA $90C6,y                               ; $02918F |
  STA !s_spr_timer_2,x                      ; $029192 |

CODE_029195:
  RTL                                       ; $029195 |

  db $40, $21, $18, $5C, $7E                ; $029196 |

  db $E9, $8C, $52, $E9, $8C, $52, $00      ; $02919B |

  db $02, $22, $FC, $51, $7E                ; $0291A2 |

  db $02, $22, $44, $52, $7E                ; $0291A7 |

  db $02, $11, $E4, $51, $7E                ; $0291AC |

  dw $150B, $121B, $1F1A, $1D18             ; $0291B1 |
  dw $031F, $0805, $0A03, $0811             ; $0291B9 |
  dw $170F                                  ; $0291C1 |

init_spinning_wooden_platform:
  SEP #$20                                  ; $0291C3 |
  LDX #$04                                  ; $0291C5 |

CODE_0291C7:
  LDA $9196,x                               ; $0291C7 |
  STA $4310,x                               ; $0291CA |
  LDA $91A2,x                               ; $0291CD |
  STA $4320,x                               ; $0291D0 |
  LDA $91AC,x                               ; $0291D3 |
  STA $4330,x                               ; $0291D6 |
  LDA $91A7,x                               ; $0291D9 |
  STA $4360,x                               ; $0291DC |
  DEX                                       ; $0291DF |
  BPL CODE_0291C7                           ; $0291E0 |
  LDA #$7E                                  ; $0291E2 |
  STA $4317                                 ; $0291E4 |
  STA $4327                                 ; $0291E7 |
  STA $4337                                 ; $0291EA |
  STA $4367                                 ; $0291ED |
  LDX #$06                                  ; $0291F0 |

CODE_0291F2:
  LDA $919B,x                               ; $0291F2 |
  STA $7E5C18,x                             ; $0291F5 |
  DEX                                       ; $0291F9 |
  BPL CODE_0291F2                           ; $0291FA |
  LDX #$6F                                  ; $0291FC |
  LDA #$09                                  ; $0291FE |

CODE_029200:
  STA $7E528C,x                             ; $029200 |
  DEX                                       ; $029204 |
  BPL CODE_029200                           ; $029205 |
  REP #$20                                  ; $029207 |
  LDX #$10                                  ; $029209 |

CODE_02920B:
  LDA $91B1,x                               ; $02920B |
  STA $70404A,x                             ; $02920E |
  DEX                                       ; $029212 |
  DEX                                       ; $029213 |
  BPL CODE_02920B                           ; $029214 |
  LDA #$0000                                ; $029216 |
  STA $702016                               ; $029219 |
  STA $702D82                               ; $02921D |
  LDX $12                                   ; $029221 |
  LDA !s_spr_x_pixel_pos,x                  ; $029223 |
  ORA #$0008                                ; $029226 |
  STA !s_spr_x_pixel_pos,x                  ; $029229 |
  DEC !s_spr_y_pixel_pos,x                  ; $02922C |
  LDA #$0040                                ; $02922F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $029232 |
  RTL                                       ; $029234 |

main_spinning_wooden_platform:
  JSR CODE_029316                           ; $029235 |
  LDY $7E3E                                 ; $029238 |
  BEQ CODE_02924A                           ; $02923B |
  LDA $7E46                                 ; $02923D |
  STA $00                                   ; $029240 |
  DEY                                       ; $029242 |
  CPY $12                                   ; $029243 |
  BEQ CODE_029298                           ; $029245 |
  JMP CODE_029306                           ; $029247 |

CODE_02924A:
  LDA !s_player_x                           ; $02924A |
  SEC                                       ; $02924D |
  SBC !s_spr_x_pixel_pos,x                  ; $02924E |
  STA $00                                   ; $029251 |
  CLC                                       ; $029253 |
  ADC #$007F                                ; $029254 |
  CMP #$00FF                                ; $029257 |
  BCC CODE_02925F                           ; $02925A |
  JMP CODE_029306                           ; $02925C |

CODE_02925F:
  REP #$10                                  ; $02925F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $029261 |
  ASL A                                     ; $029263 |
  TAX                                       ; $029264 |
  LDA $00E954,x                             ; $029265 |
  STA $02                                   ; $029269 |
  BPL CODE_029271                           ; $02926B |
  EOR #$FFFF                                ; $02926D |
  INC A                                     ; $029270 |

CODE_029271:
  ASL A                                     ; $029271 |
  TAX                                       ; $029272 |
  LDA $702200,x                             ; $029273 |
  LSR A                                     ; $029277 |
  SEP #$30                                  ; $029278 |
  STA !reg_m7a                              ; $02927A |
  XBA                                       ; $02927D |
  STA !reg_m7a                              ; $02927E |
  LDA $00                                   ; $029281 |
  STA !reg_m7b                              ; $029283 |
  REP #$20                                  ; $029286 |
  LDA !reg_mpym                             ; $029288 |
  ASL A                                     ; $02928B |
  LDY $03                                   ; $02928C |
  BPL CODE_029294                           ; $02928E |
  EOR #$FFFF                                ; $029290 |
  INC A                                     ; $029293 |

CODE_029294:
  STA $00                                   ; $029294 |
  LDX $12                                   ; $029296 |

CODE_029298:
  STZ $7E3E                                 ; $029298 |
  LDA !s_player_y_speed                     ; $02929B |
  BMI CODE_029306                           ; $02929E |
  LDA $00                                   ; $0292A0 |
  CLC                                       ; $0292A2 |
  ADC #$0070                                ; $0292A3 |
  CMP #$00E1                                ; $0292A6 |
  BCS CODE_029306                           ; $0292A9 |
  LDA !s_spr_y_pixel_pos,x                  ; $0292AB |
  SEC                                       ; $0292AE |
  SBC !s_player_y                           ; $0292AF |
  SEC                                       ; $0292B2 |
  SBC #$0020                                ; $0292B3 |
  CMP #$FFF6                                ; $0292B6 |
  BCC CODE_029306                           ; $0292B9 |
  ADC !s_player_y                           ; $0292BB |
  STA !s_player_y                           ; $0292BE |
  STZ !s_player_y_speed                     ; $0292C1 |
  TXA                                       ; $0292C4 |
  INC A                                     ; $0292C5 |
  STA $7E3E                                 ; $0292C6 |
  INC !s_on_sprite_platform_flag            ; $0292C9 |
  LDA $00                                   ; $0292CC |
  STA $7E46                                 ; $0292CE |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0292D1 |
  STA $7E40                                 ; $0292D3 |
  LDA !s_spr_x_pixel_pos,x                  ; $0292D6 |
  STA $7E42                                 ; $0292D9 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0292DC |
  ASL A                                     ; $0292DE |
  REP #$10                                  ; $0292DF |
  TAX                                       ; $0292E1 |
  LDA $00E9D4,x                             ; $0292E2 |
  ASL A                                     ; $0292E6 |
  ASL A                                     ; $0292E7 |
  ASL A                                     ; $0292E8 |
  SEP #$30                                  ; $0292E9 |
  STA !reg_m7a                              ; $0292EB |
  XBA                                       ; $0292EE |
  STA !reg_m7a                              ; $0292EF |
  LDA $7E46                                 ; $0292F2 |
  STA !reg_m7b                              ; $0292F5 |
  REP #$20                                  ; $0292F8 |
  LDA !reg_mpym                             ; $0292FA |
  EOR #$FFFF                                ; $0292FD |
  INC A                                     ; $029300 |
  STA $61BA                                 ; $029301 |
  LDX $12                                   ; $029304 |

CODE_029306:
  JSL $03AF23                               ; $029306 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02930A |
  CLC                                       ; $02930C |
  ADC #$FFFF                                ; $02930D |
  AND #$00FF                                ; $029310 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $029313 |
  RTL                                       ; $029315 |

CODE_029316:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $029316 |
  STA !gsu_r3                               ; $029318 |
  LDA #$00D4                                ; $02931B |
  STA !gsu_r1                               ; $02931E |
  LDA #$0020                                ; $029321 |
  STA !gsu_r2                               ; $029324 |
  LDA !s_spr_cam_y_pos,x                    ; $029327 |
  STA !gsu_r5                               ; $02932A |
  LDA #$0030                                ; $02932D |
  STA !gsu_r7                               ; $029330 |
  LDA #$0078                                ; $029333 |
  SEC                                       ; $029336 |
  SBC !s_spr_cam_x_pos,x                    ; $029337 |
  STA !gsu_r8                               ; $02933A |
  LDA $0CC2                                 ; $02933D |
  BEQ CODE_02934E                           ; $029340 |
  LDX #$08                                  ; $029342 |
  LDA #$C470                                ; $029344 |
  JSL r_gsu_init_1                          ; $029347 | GSU init
  JMP CODE_02937E                           ; $02934B |

CODE_02934E:
  INC $0CC2                                 ; $02934E |
  LDX #$08                                  ; $029351 |
  LDA #$C450                                ; $029353 |
  JSL r_gsu_init_1                          ; $029356 | GSU init
  JSL $00BE39                               ; $02935A |

  dw $51E4, $167E, $7035, $00A8             ; $02935E |

  JSL $00BE39                               ; $029366 |

  dw $5040, $727E, $7033, $01A4             ; $02936A |

  LDA #$0004                                ; $029372 |
  TSB !r_reg_ts_mirror                      ; $029375 |
  LDA #$005E                                ; $029378 |
  TSB !r_reg_hdmaen_mirror                  ; $02937B |

CODE_02937E:
  LDX $12                                   ; $02937E |
  RTS                                       ; $029380 |

init_unused_4D:
  RTL                                       ; $029381 |

main_unused_4D:
  RTL                                       ; $029382 |

init_middle_ring:
  JSL $03D406                               ; $029383 |
  LDA #$0020                                ; $029387 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02938A |
  RTL                                       ; $02938D |

main_middle_ring:
  LDA !s_spr_oam_pointer,x                  ; $02938E |
  STA !gsu_r3                               ; $029391 |
  TXA                                       ; $029394 |
  STA !gsu_r1                               ; $029395 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029398 |
  AND #$00FF                                ; $02939A |
  STA !gsu_r2                               ; $02939D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0293A0 |
  STA !gsu_r4                               ; $0293A2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0293A5 |
  STA !gsu_r6                               ; $0293A8 |
  SEP #$10                                  ; $0293AB |
  LDX #$08                                  ; $0293AD |
  LDA #$D3F9                                ; $0293AF |
  JSL r_gsu_init_1                          ; $0293B2 | GSU init
  LDX $12                                   ; $0293B6 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0293B8 |
  LDA !r_frame_counter_global               ; $0293BA |
  AND #$0003                                ; $0293BD |
  BNE CODE_0293CF                           ; $0293C0 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0293C2 |
  INC A                                     ; $0293C4 |
  CMP #$0006                                ; $0293C5 |
  BCC CODE_0293CD                           ; $0293C8 |
  LDA #$0000                                ; $0293CA |

CODE_0293CD:
  STA !s_spr_wildcard_6_lo_dp,x             ; $0293CD |

CODE_0293CF:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0293CF |
  BEQ CODE_0293D6                           ; $0293D1 |
  JMP CODE_029461                           ; $0293D3 |-- continue below

CODE_0293D6:
  JSL $03AF23                               ; $0293D6 |
  LDA !s_spr_x_player_delta,x               ; $0293DA |
  CLC                                       ; $0293DD |
  ADC #$0020                                ; $0293DE |
  CMP #$0041                                ; $0293E1 |
  BCS CODE_0293F2                           ; $0293E4 |
  LDA !s_spr_y_player_delta,x               ; $0293E6 |
  CLC                                       ; $0293E9 |
  ADC #$0038                                ; $0293EA |
  CMP #$0089                                ; $0293ED |
  BCC CODE_0293FC                           ; $0293F0 |

CODE_0293F2:
  LDA !s_spr_x_player_dir,x                 ; $0293F2 |
  AND #$00FF                                ; $0293F5 |
  STA !s_spr_facing_dir,x                   ; $0293F8 |

CODE_0293FB:
  RTL                                       ; $0293FB |

CODE_0293FC:
  LDA !s_spr_y_player_delta,x               ; $0293FC |
  CLC                                       ; $0293FF |
  ADC #$0028                                ; $029400 |
  CMP #$0046                                ; $029403 |
  BCS CODE_0293FB                           ; $029406 |
  LDA !s_spr_x_player_dir,x                 ; $029408 |
  AND #$00FF                                ; $02940B |
  CMP !s_spr_facing_dir,x                   ; $02940E |
  BEQ CODE_0293FB                           ; $029411 |
  LDA !r_tutorial_msg_flags                 ; $029413 |
  AND #$0020                                ; $029416 |
  BNE CODE_029434                           ; $029419 |
  LDA !r_cur_stage                          ; $02941B |
  DEC A                                     ; $02941E |
  BNE CODE_029434                           ; $02941F |
  LDA !r_tutorial_msg_flags                 ; $029421 |
  ORA #$0020                                ; $029424 |
  STA !r_tutorial_msg_flags                 ; $029427 |
  LDA #$0027                                ; $02942A |
  STA $704070                               ; $02942D |
  INC !r_msg_box_state                      ; $029431 |

CODE_029434:
  INC $0B65                                 ; $029434 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $029437 |
  LDA #$0001                                ; $029439 |
  STA !s_player_disable_flag                ; $02943C |
  STA !s_sprite_disable_flag                ; $02943F |
  LDA #$0008                                ; $029442 |
  STA !s_spr_timer_2,x                      ; $029445 |
  LDA !r_star_autoincrease                  ; $029448 |
  CLC                                       ; $02944B |
  ADC #$0064                                ; $02944C |\ number of stars the midring gives yoshi * 10
  STA !r_star_autoincrease                  ; $02944F |/
  LDA #$00DC                                ; $029452 |
  STA !r_starcounter_timer                  ; $029455 |
  RTL                                       ; $029458 |

  dw $0013                                  ; $029459 |
  dw $0021                                  ; $02945B |
  dw $002F                                  ; $02945D |
  dw $003D                                  ; $02945F |

; continuing main_middle_ring
CODE_029461:
  LDA !r_msg_box_state                      ; $029461 |
  BNE CODE_02946E                           ; $029464 |
  LDA !s_spr_timer_2,x                      ; $029466 |
  BEQ CODE_02946F                           ; $029469 |
  DEC !s_spr_timer_2,x                      ; $02946B |

CODE_02946E:
  RTL                                       ; $02946E |

CODE_02946F:
  LDA !r_star_autoincrease                  ; $02946F |
  BNE CODE_02946E                           ; $029472 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $029474 |
  CMP #$0020                                ; $029477 |
  BNE CODE_029485                           ; $02947A |
  PHA                                       ; $02947C |
  LDA #$0027                                ; $02947D |\ play sound #$0027
  JSL push_sound_queue                      ; $029480 |/
  PLA                                       ; $029484 |

CODE_029485:
  CLC                                       ; $029485 |
  ADC #$0002                                ; $029486 |
  CMP #$0060                                ; $029489 |
  BCS transform_enemies                     ; $02948C |
  STA !s_spr_gsu_morph_1_lo,x               ; $02948E |
  LSR A                                     ; $029491 |
  LSR A                                     ; $029492 |
  LSR A                                     ; $029493 |
  LSR A                                     ; $029494 |
  ASL A                                     ; $029495 |
  TAY                                       ; $029496 |
  LDA $9455,y                               ; $029497 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02949A |
  RTL                                       ; $02949C |

; Turn enemies into stars
; Used by Big Eggs, POW, goal ring etc. etc.
transform_enemies:
  STZ $0B65                                 ; $02949D |
  STZ !s_player_disable_flag                ; $0294A0 |
  STZ !s_sprite_disable_flag                ; $0294A3 |
  JSL $03D3EB                               ; $0294A6 |
  JSL $029507                               ; $0294AA |
  LDX $12                                   ; $0294AE |
  JSL $03A32E                               ; $0294B0 |
; transform_enemies_stars
.stars
  LDA #$01A2                                ; $0294B4 | entry for stars
; transform_enemies_arg_a
.arg_a
  STA $0E                                   ; $0294B7 | entry for argument in A (goal ring enters here)
  LDY #$5C                                  ; $0294B9 | All sprites

; check sprite states, only transform if sprite is state $0E, $10, $12 or $08 (tongued)
; However if state $08 and a sprite is in yoshi mouth, don't transform
.check_states
  LDA !s_spr_state,y                        ; $0294BB |
  CMP #$000E                                ; $0294BE |\ Continue if sprite => $0E
  BCS .check_valid_type                     ; $0294C1 |/
  CMP #$0008                                ; $0294C3 |\ If it's not in mouth and < $0E
  BNE .next_sprite                          ; $0294C6 |/ Go to next sprite
  LDA $6162                                 ; $0294C8 |\ If sprite is being tongued and
  BNE .next_sprite                          ; $0294CB |/ Yoshi has sprite in mouth, go to next sprite

.check_valid_type
  LDA !s_spr_bitwise_settings_3,y           ; $0294CD |\  
  AND #%0110000000000000                    ; $0294D0 | | Continue if terrain collision flags are off
  BEQ .clear_platform_flag                  ; $0294D3 |/  To check if valid enemy
  LDA !s_spr_id,y                           ; $0294D5 |\
  CMP #$00CD                                ; $0294D8 | | However continue if it's either
  BEQ .clear_platform_flag                  ; $0294DB | | Baron Von Zeppelin, Giant Egg 
  CMP #$00CE                                ; $0294DD | | or Bowser's flame  
  BEQ .clear_platform_flag                  ; $0294E0 |/
  CMP #$0026                                ; $0294E2 |\  Go to next sprite if
  BNE .next_sprite                          ; $0294E5 |/  Bowser Fight Giant Egg
  LDA !s_spr_collision_state,y              ; $0294E7 |
  BNE .next_sprite                          ; $0294EA |

.clear_platform_flag
  CPY $61B6                                 ; $0294EC |\
  BNE .transform                            ; $0294EF | | If standing on sprite we're tranforming
  STZ $61B6                                 ; $0294F1 |/  Then clear that flag

.transform
  LDA #$0006                                ; $0294F4 |\ Set sprite state to transform
  STA !s_spr_state,y                        ; $0294F7 |/ 
  LDA $0E                                   ; $0294FA |\ Set what sprite to transform into
  STA $0B91,y                               ; $0294FC |/

.next_sprite
  DEY                                       ; $0294FF |\
  DEY                                       ; $029500 | | sprite slot - 4
  DEY                                       ; $029501 | | Return if negative (after last sprite)
  DEY                                       ; $029502 | |
  BPL .check_states                         ; $029503 |/
  RTL                                       ; $029505 |

; the loneliest RTL
  RTL                                       ; $029506 |

; middle ring sub
  INC $03AC                                 ; $029507 |
  REP #$10                                  ; $02950A |
  LDX #$020C                                ; $02950C |

CODE_02950F:
  LDA $03B2,x                               ; $02950F |
  STA $7E79A6,x                             ; $029512 |
  DEX                                       ; $029516 |
  DEX                                       ; $029517 |
  BPL CODE_02950F                           ; $029518 |
  SEP #$10                                  ; $02951A |
  LDA !s_cur_egg_inv_size                   ; $02951C |
  STA $7E7BB0                               ; $02951F |
  BEQ CODE_029534                           ; $029523 |
  TAX                                       ; $029525 |

CODE_029526:
  LDY $7DF6,x                               ; $029526 |
  LDA !s_spr_id,y                           ; $029529 |
  STA $7E7BB0,x                             ; $02952C |
  DEX                                       ; $029530 |
  DEX                                       ; $029531 |
  BNE CODE_029526                           ; $029532 |

CODE_029534:
  LDX $12                                   ; $029534 |
  RTL                                       ; $029536 |

; "invisible slime platform" gsu table
  dw $0000, $A000, $0000, $0000             ; $029537 |
  dw $0000, $0000, $0000, $A010             ; $02953F |
  dw $0000, $0000, $0000, $0000             ; $029547 |
  dw $0000, $0000, $0000, $0000             ; $02954F |
  dw $0000, $0000, $0000, $0000             ; $029557 |
  dw $0000, $0000, $0000, $0000             ; $02955F |
  dw $0000, $0000, $0000, $0000             ; $029567 |
  dw $0000, $0000, $0000, $A020             ; $02956F |
  dw $A060, $0000, $0000, $0000             ; $029577 |
  dw $0000, $0000, $0000, $0000             ; $02957F |
  dw $0000, $0000, $0000, $0000             ; $029587 |
  dw $0000, $0000, $0000, $0000             ; $02958F |
  dw $0000, $0000, $0000, $0000             ; $029597 |
  dw $0000, $0000, $0000, $0000             ; $02959F |
  dw $A050, $0000, $0000, $0000             ; $0295A7 |
  dw $0000, $0000, $A040, $A030             ; $0295AF |
  dw $FFF0, $0010                           ; $0295B7 |

; golden egg calls it "dent of castella" (what)
init_invisible_slime_platform:
  JSR CODE_0297F3                           ; $0295BB |
  LDA $0020                                 ; $0295BE |
  STA !s_spr_gsu_morph_2_lo,x               ; $0295C1 |
  LDA $0022                                 ; $0295C4 |
  STA !s_spr_wildcard_1_lo,x                ; $0295C7 |
  LDA $0024                                 ; $0295CA |
  STA !s_spr_wildcard_2_lo,x                ; $0295CD |
  JSR CODE_02984B                           ; $0295D0 |

; golden egg calls it "dent of castella" (what)
main_invisible_slime_platform:
  JSL $03AF23                               ; $0295D3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0295D7 |
  STA !gsu_r6                               ; $0295D9 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0295DC |
  BEQ CODE_029627                           ; $0295DE |
  LDY #$00                                  ; $0295E0 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0295E2 |
  BPL CODE_0295E8                           ; $0295E4 |
  LDY #$02                                  ; $0295E6 |

CODE_0295E8:
  CLC                                       ; $0295E8 |
  ADC $95B7,y                               ; $0295E9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0295EC |
  BEQ CODE_0295F8                           ; $0295EE |
  EOR $95B7,y                               ; $0295F0 |
  BPL CODE_0295F8                           ; $0295F3 |
  JMP CODE_0297A3                           ; $0295F5 |

CODE_0295F8:
  LDY #$00                                  ; $0295F8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0295FA |
  JSR CODE_029818                           ; $0295FD |
  LDY #$02                                  ; $029600 |
  LDA !s_spr_wildcard_1_lo,x                ; $029602 |
  JSR CODE_029818                           ; $029605 |
  LDY #$04                                  ; $029608 |
  LDA !s_spr_wildcard_2_lo,x                ; $02960A |
  JSR CODE_029818                           ; $02960D |
  STZ $61BE                                 ; $029610 |
  JML $03A31E                               ; $029613 |

  dw $0008, $0004, $0000, $0000             ; $029617 |
  dw $0000, $0000                           ; $02961F |

  dw $FFD0, $0030                           ; $029623 |

CODE_029627:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029627 |
  BPL CODE_02969E                           ; $029629 |
  LDA !s_player_duck_state                  ; $02962B |
  ASL A                                     ; $02962E |
  TAY                                       ; $02962F |
  LDA !s_spr_y_pixel_pos,x                  ; $029630 |
  SEC                                       ; $029633 |
  SBC !s_player_y                           ; $029634 |
  CLC                                       ; $029637 |
  ADC $9617,y                               ; $029638 |
  BMI CODE_0296AF                           ; $02963B |
  CMP #$0008                                ; $02963D |
  BMI CODE_02964B                           ; $029640 |
  LDA !s_spr_y_pixel_pos,x                  ; $029642 |
  STA !s_player_y                           ; $029645 |
  LDA #$0008                                ; $029648 |

CODE_02964B:
  XBA                                       ; $02964B |
  LSR A                                     ; $02964C |
  LSR A                                     ; $02964D |
  LSR A                                     ; $02964E |
  EOR #$FFFF                                ; $02964F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $029652 |
  LDA !s_player_y_speed                     ; $029654 |
  CLC                                       ; $029657 |
  ADC #$0030                                ; $029658 |
  CMP #$0010                                ; $02965B |
  BMI CODE_029663                           ; $02965E |
  LDA #$0010                                ; $029660 |

CODE_029663:
  STA !s_player_y_speed                     ; $029663 |
  LDA #$0002                                ; $029666 |
  STA $61DC                                 ; $029669 |
  LDA $61F0                                 ; $02966C |
  CMP #$0002                                ; $02966F |
  BCS CODE_029681                           ; $029672 |
  LDA #$0006                                ; $029674 |
  STA $61F0                                 ; $029677 |
  LDA #$009B                                ; $02967A |\ play sound #$009B
  JSL push_sound_queue                      ; $02967D |/

CODE_029681:
  LDY #$00                                  ; $029681 |
  LDA !s_player_x_speed                     ; $029683 |
  BEQ CODE_02969B                           ; $029686 |
  BPL CODE_02968C                           ; $029688 |
  INY                                       ; $02968A |
  INY                                       ; $02968B |

CODE_02968C:
  CLC                                       ; $02968C |
  ADC $9623,y                               ; $02968D |
  STA !s_player_x_speed                     ; $029690 |
  EOR $9623,y                               ; $029693 |
  BMI CODE_02969B                           ; $029696 |
  STZ !s_player_x_speed                     ; $029698 |

CODE_02969B:
  JMP CODE_029744                           ; $02969B |

CODE_02969E:
  LDA !s_player_y                           ; $02969E |
  CLC                                       ; $0296A1 |
  ADC !s_car_wheel_ext_height               ; $0296A2 |
  CLC                                       ; $0296A5 |
  ADC #$0020                                ; $0296A6 |
  SEC                                       ; $0296A9 |
  SBC !s_spr_y_pixel_pos,x                  ; $0296AA |
  BPL CODE_0296B4                           ; $0296AD |

CODE_0296AF:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0296AF |
  JMP CODE_0297A3                           ; $0296B1 |

CODE_0296B4:
  CMP #$000A                                ; $0296B4 |
  BMI CODE_0296CA                           ; $0296B7 |
  LDA !s_spr_y_pixel_pos,x                  ; $0296B9 |
  SEC                                       ; $0296BC |
  SBC #$0016                                ; $0296BD |
  SEC                                       ; $0296C0 |
  SBC !s_car_wheel_ext_height               ; $0296C1 |
  STA !s_player_y                           ; $0296C4 |
  LDA #$000A                                ; $0296C7 |

CODE_0296CA:
  STA $00                                   ; $0296CA |
  LDA !s_player_jump_state                  ; $0296CC |
  BEQ CODE_0296E8                           ; $0296CF |
  LDA !s_player_y_speed                     ; $0296D1 |
  BPL CODE_0296E8                           ; $0296D4 |
  LDA #$0013                                ; $0296D6 |\ play sound #$0013
  JSL push_sound_queue                      ; $0296D9 |/
  LDA $00                                   ; $0296DD |
  ASL A                                     ; $0296DF |
  ASL A                                     ; $0296E0 |
  ASL A                                     ; $0296E1 |
  ASL A                                     ; $0296E2 |
  ADC !s_player_y_speed                     ; $0296E3 |
  BRA CODE_029739                           ; $0296E6 |

CODE_0296E8:
  INC !s_on_sprite_platform_flag            ; $0296E8 |
  LDY $00                                   ; $0296EB |
  CPY #$02                                  ; $0296ED |
  BCS CODE_0296FB                           ; $0296EF |
  INC $00                                   ; $0296F1 |
  INC !s_player_y                           ; $0296F3 |
  LDA #$0000                                ; $0296F6 |
  BRA CODE_029739                           ; $0296F9 |

CODE_0296FB:
  LDA #$0000                                ; $0296FB |
  CPY #$05                                  ; $0296FE |
  BCC CODE_029705                           ; $029700 |
  LDA #$0000                                ; $029702 |

CODE_029705:
  STA !s_player_ground_type                 ; $029705 |
  LDA !s_player_running_anim_state          ; $029708 |
  BNE CODE_029714                           ; $02970B |
  LDA #$009B                                ; $02970D |\ play sound #$009B
  JSL push_sound_queue                      ; $029710 |/

CODE_029714:
  LDA !s_player_x_speed_prev                ; $029714 |
  BPL CODE_02971D                           ; $029717 |
  EOR #$FFFF                                ; $029719 |
  INC A                                     ; $02971C |

CODE_02971D:
  LSR A                                     ; $02971D |
  EOR #$FFFF                                ; $02971E |
  INC A                                     ; $029721 |
  STA $02                                   ; $029722 |
  LDA #$0008                                ; $029724 |
  SEC                                       ; $029727 |
  SBC $00                                   ; $029728 |
  ASL A                                     ; $02972A |
  ASL A                                     ; $02972B |
  ASL A                                     ; $02972C |
  ASL A                                     ; $02972D |
  CLC                                       ; $02972E |
  ADC $02                                   ; $02972F |
  CMP #$FF00                                ; $029731 |
  BPL CODE_029739                           ; $029734 |
  LDA #$FF00                                ; $029736 |

CODE_029739:
  STA !s_player_y_speed                     ; $029739 |
  LDA $00                                   ; $02973C |
  XBA                                       ; $02973E |
  LSR A                                     ; $02973F |
  LSR A                                     ; $029740 |
  LSR A                                     ; $029741 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $029742 |

CODE_029744:
  LDA !s_spr_x_pixel_pos,x                  ; $029744 |
  AND #$FFF0                                ; $029747 |
  STA $00                                   ; $02974A |
  LDA !s_player_x                           ; $02974C |
  SEC                                       ; $02974F |
  SBC #$0008                                ; $029750 |
  STA !s_spr_x_pixel_pos,x                  ; $029753 |
  AND #$FFF0                                ; $029756 |
  SEC                                       ; $029759 |
  SBC $00                                   ; $02975A |
  BEQ CODE_0297A3                           ; $02975C |
  BMI CODE_029775                           ; $02975E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $029760 |
  PHA                                       ; $029763 |
  LDA !s_spr_wildcard_1_lo,x                ; $029764 |
  STA !s_spr_gsu_morph_2_lo,x               ; $029767 |
  LDA !s_spr_wildcard_2_lo,x                ; $02976A |
  STA !s_spr_wildcard_1_lo,x                ; $02976D |
  PLA                                       ; $029770 |
  LDY #$00                                  ; $029771 |
  BRA CODE_029788                           ; $029773 |

CODE_029775:
  LDA !s_spr_wildcard_2_lo,x                ; $029775 |
  PHA                                       ; $029778 |
  LDA !s_spr_wildcard_1_lo,x                ; $029779 |
  STA !s_spr_wildcard_2_lo,x                ; $02977C |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02977F |
  STA !s_spr_wildcard_1_lo,x                ; $029782 |
  PLA                                       ; $029785 |
  LDY #$04                                  ; $029786 |

CODE_029788:
  PHY                                       ; $029788 |
  JSR CODE_029818                           ; $029789 |
  JSR CODE_0297F3                           ; $02978C |
  PLY                                       ; $02978F |
  BNE CODE_02979A                           ; $029790 |
  LDA $0024                                 ; $029792 |
  STA !s_spr_wildcard_2_lo,x                ; $029795 |
  BRA CODE_0297A0                           ; $029798 |

CODE_02979A:
  LDA $0020                                 ; $02979A |
  STA !s_spr_gsu_morph_2_lo,x               ; $02979D |

CODE_0297A0:
  JSR CODE_02984B                           ; $0297A0 |

CODE_0297A3:
  LDA #$0020                                ; $0297A3 |
  STA !gsu_r2                               ; $0297A6 |
  LDA #$0030                                ; $0297A9 |
  STA !gsu_r3                               ; $0297AC |
  LDA !s_spr_x_pixel_pos,x                  ; $0297AF |
  AND #$000F                                ; $0297B2 |
  STA !gsu_r11                              ; $0297B5 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0297B8 |
  CPY #$02                                  ; $0297BA |
  BNE CODE_0297C5                           ; $0297BC |
  CMP #$000D                                ; $0297BE |
  BCS CODE_0297D0                           ; $0297C1 |
  BRA CODE_0297CE                           ; $0297C3 |

CODE_0297C5:
  CPY #$40                                  ; $0297C5 |
  BNE CODE_0297D0                           ; $0297C7 |
  CMP #$0004                                ; $0297C9 |
  BCC CODE_0297D0                           ; $0297CC |

CODE_0297CE:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0297CE |

CODE_0297D0:
  LDA $9537,y                               ; $0297D0 |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0297D3 |
  BPL CODE_0297DB                           ; $0297D5 |
  CLC                                       ; $0297D7 |
  ADC #$0800                                ; $0297D8 |

CODE_0297DB:
  STA !gsu_r12                              ; $0297DB |
  LDA #$0054                                ; $0297DE |
  STA !gsu_r13                              ; $0297E1 |
  LDX #$08                                  ; $0297E4 |
  LDA #$8CDB                                ; $0297E6 |
  JSL r_gsu_init_1                          ; $0297E9 | GSU init
  INC $0CFB                                 ; $0297ED |
  LDX $12                                   ; $0297F0 |
  RTL                                       ; $0297F2 |

CODE_0297F3:
  LDA #$0002                                ; $0297F3 |
  STA $008F                                 ; $0297F6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0297F9 |
  STA $0091                                 ; $0297FC |
  LDA !s_spr_y_pixel_pos,x                  ; $0297FF |
  STA $0093                                 ; $029802 |
  LDA #$6200                                ; $029805 |
  STA $0095                                 ; $029808 |
  JSL $109295                               ; $02980B |
  LDX $12                                   ; $02980F |
  RTS                                       ; $029811 |

  dw $0000, $0010, $0020                    ; $029812 |

CODE_029818:
  CMP #$6106                                ; $029818 |
  BEQ CODE_02983C                           ; $02981B |
  STA $0095                                 ; $02981D |
  LDA #$0001                                ; $029820 |
  STA $008F                                 ; $029823 |
  LDA !s_cur_spr_x_prev                     ; $029826 |
  CLC                                       ; $029829 |
  ADC $9812,y                               ; $02982A |
  STA $0091                                 ; $02982D |
  LDA !s_spr_y_pixel_pos,x                  ; $029830 |
  STA $0093                                 ; $029833 |
  JSL $109295                               ; $029836 |
  LDX $12                                   ; $02983A |

CODE_02983C:
  RTS                                       ; $02983C |

  dw $0001, $0003, $0002, $0001             ; $02983D |
  dw $0003, $0002, $0000                    ; $029845 |

CODE_02984B:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02984B |
  AND #$00FF                                ; $02984E |
  ASL A                                     ; $029851 |
  TAY                                       ; $029852 |
  LDA $983D,y                               ; $029853 |
  ASL A                                     ; $029856 |
  ASL A                                     ; $029857 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $029858 |
  LDA !s_spr_wildcard_1_lo,x                ; $02985A |
  AND #$00FF                                ; $02985D |
  ASL A                                     ; $029860 |
  TAY                                       ; $029861 |
  LDA $983D,y                               ; $029862 |
  ORA !s_spr_wildcard_6_lo_dp,x             ; $029865 |
  ASL A                                     ; $029867 |
  ASL A                                     ; $029868 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $029869 |
  LDA !s_spr_wildcard_2_lo,x                ; $02986B |
  AND #$00FF                                ; $02986E |
  ASL A                                     ; $029871 |
  TAY                                       ; $029872 |
  LDA $983D,y                               ; $029873 |
  ORA !s_spr_wildcard_6_lo_dp,x             ; $029876 |
  ASL A                                     ; $029878 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $029879 |
  RTS                                       ; $02987B |

  dw $FF80, $0080                           ; $02987C |

init_super_star_continuous:
  LDA !s_player_form                        ; $029880 |
  CMP #$0010                                ; $029883 |
  BEQ CODE_02989E                           ; $029886 |

CODE_029888:
  LDA #$0002                                ; $029888 |
  STA !s_spr_state,x                        ; $02988B |
  LDA #$00FF                                ; $02988E |
  STA !s_spr_draw_priority,x                ; $029891 |
  RTL                                       ; $029894 |

init_super_star:
  LDY !s_spr_facing_dir,x                   ; $029895 |
  LDA $987C,y                               ; $029898 |
  STA !s_spr_x_speed_lo,x                   ; $02989B |

CODE_02989E:
  JSL $03AE60                               ; $02989E |
  LDA #$0100                                ; $0298A2 |
  STA !gsu_r6                               ; $0298A5 |
  LDY !s_spr_dyntile_index,x                ; $0298A8 |
  TYX                                       ; $0298AB |
  LDA $03A9CE,x                             ; $0298AC |
  STA !gsu_r3                               ; $0298B0 |
  LDA $03A9EE,x                             ; $0298B3 |
  STA !gsu_r2                               ; $0298B7 |
  LDA #$0008                                ; $0298BA |
  STA !gsu_r8                               ; $0298BD |
  STA !gsu_r9                               ; $0298C0 |
  LDA #$60F0                                ; $0298C3 |
  STA !gsu_r12                              ; $0298C6 |
  LDA #$0055                                ; $0298C9 |
  STA !gsu_r13                              ; $0298CC |
  LDX #$08                                  ; $0298CF |
  LDA #$8619                                ; $0298D1 |
  JSL r_gsu_init_1                          ; $0298D4 | GSU init
  INC $0CF9                                 ; $0298D8 |
  LDX $12                                   ; $0298DB |
  LDY !s_spr_draw_priority,x                ; $0298DD |
  BPL CODE_0298F3                           ; $0298E0 |
  LDA #$0005                                ; $0298E2 |
  STA !s_spr_draw_priority,x                ; $0298E5 |
  LDA #$0030                                ; $0298E8 |\ play sound #$0030
  JSL push_sound_queue                      ; $0298EB |/
  JSL $04849E                               ; $0298EF |

CODE_0298F3:
  RTL                                       ; $0298F3 |

; both regular and continuous
main_super_star:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0298F4 |
  ASL A                                     ; $0298F6 |
  TXY                                       ; $0298F7 |
  TAX                                       ; $0298F8 |
  JMP ($98FC,x)                             ; $0298F9 |

  dw $9900                                  ; $0298FC |
  dw $999F                                  ; $0298FE |

  TYX                                       ; $029900 |
  JSL $03AA2E                               ; $029901 |
  JSL $03AF23                               ; $029905 |
  LDA !s_spr_y_accel,x                      ; $029909 |
  BNE CODE_02991D                           ; $02990C |
  LDA !s_player_form                        ; $02990E |
  CMP #$0010                                ; $029911 |
  BEQ CODE_02991D                           ; $029914 |
  JSL $0298E8                               ; $029916 |
  JMP CODE_029888                           ; $02991A |

CODE_02991D:
  JSL $029BCA                               ; $02991D |
  LDY !s_spr_collision_id,x                 ; $029921 |
  BPL CODE_02998C                           ; $029924 |
  LDA !s_spr_cam_x_pos,x                    ; $029926 |
  CLC                                       ; $029929 |
  ADC #$0020                                ; $02992A |
  CMP #$0120                                ; $02992D |
  BCS CODE_02998C                           ; $029930 |
  LDA !s_spr_cam_y_pos,x                    ; $029932 |
  CLC                                       ; $029935 |
  ADC #$0020                                ; $029936 |
  CMP #$0100                                ; $029939 |
  BCS CODE_02998C                           ; $02993C |
  LDA !s_player_form                        ; $02993E |
  BEQ CODE_029951                           ; $029941 |
  LDA #$0027                                ; $029943 |\ play sound #$0027
  JSL push_sound_queue                      ; $029946 |/
  JSL $03A31E                               ; $02994A |
  JMP CODE_029A50                           ; $02994E |

CODE_029951:
  LDA !s_baby_mario_state                   ; $029951 |
  BPL CODE_02998C                           ; $029954 |
  LDA !s_player_mouth_state                 ; $029956 |
  BEQ CODE_02996D                           ; $029959 |
  LDA $6162                                 ; $02995B |
  BEQ CODE_02996D                           ; $02995E |
  LDA !s_mouth_ammo                         ; $029960 |
  CMP #$0001                                ; $029963 |
  BEQ CODE_02998C                           ; $029966 |
  CMP #$0004                                ; $029968 |
  BEQ CODE_02998C                           ; $02996B |

CODE_02996D:
  INC !s_spr_wildcard_4_lo,x                ; $02996D |
  LDA #$00FF                                ; $029970 |
  STA !s_spr_draw_priority,x                ; $029973 |
  LDA !s_spr_oam_1,x                        ; $029976 |
  AND #$FFF3                                ; $029979 |
  STA !s_spr_oam_1,x                        ; $02997C |
  LDA #$0020                                ; $02997F |
  STA !s_spr_timer_1,x                      ; $029982 |
  STA !s_player_disable_flag                ; $029985 |
  STA !s_sprite_disable_flag                ; $029988 |
  RTL                                       ; $02998B |

CODE_02998C:
  LDA $7860,x                               ; $02998C |
  AND #$0001                                ; $02998F |
  BEQ CODE_02999A                           ; $029992 |
  LDA #$FD00                                ; $029994 |
  STA !s_spr_y_speed_lo,x                   ; $029997 |

CODE_02999A:
  RTL                                       ; $02999A |

  dw $0100, $FF00                           ; $02999B |

  TYX                                       ; $02999F |
  LDA !s_spr_timer_1,x                      ; $0299A0 |
  BEQ CODE_0299C6                           ; $0299A3 |
  DEC !s_spr_timer_1,x                      ; $0299A5 |
  CMP #$0010                                ; $0299A8 |
  BNE CODE_0299C5                           ; $0299AB |
  LDA #$0005                                ; $0299AD |\ play sound #$0005
  JSL push_sound_queue                      ; $0299B0 |/
  LDA !s_spr_x_hitbox_center                ; $0299B4 |
  STA $00                                   ; $0299B7 |
  LDA !s_spr_y_hitbox_center                ; $0299B9 |
  STA $02                                   ; $0299BC |
  LDA #$01E7                                ; $0299BE |
  JSL $03B577                               ; $0299C1 |

CODE_0299C5:
  RTL                                       ; $0299C5 |

CODE_0299C6:
  LDA #$2000                                ; $0299C6 |
  STA !s_baby_mario_state                   ; $0299C9 |
  LDA #$FFFF                                ; $0299CC |
  STA $7E48                                 ; $0299CF |
  JSL $04F74A                               ; $0299D2 |
  LDA #$0010                                ; $0299D6 |
  STA !s_player_form                        ; $0299D9 |
  LDA #$0010                                ; $0299DC |
  TSB !s_switch_state                       ; $0299DF |
  LDA #$0116                                ; $0299E2 |
  STA !s_player_cur_anim_frame              ; $0299E5 |
  LDA #$0008                                ; $0299E8 |
  STA !s_player_jump_state                  ; $0299EB |
  LDA #$FC00                                ; $0299EE |
  STA !s_player_y_speed                     ; $0299F1 |
  LDA !s_player_direction                   ; $0299F4 |
  EOR #$0002                                ; $0299F7 |
  STA !s_player_direction                   ; $0299FA |
  STA !s_spr_facing_dir                     ; $0299FD |
  TAY                                       ; $029A00 |
  LDA $999B,y                               ; $029A01 |
  STA !s_player_x_speed                     ; $029A04 |
  STZ !s_player_flutter_state               ; $029A07 |
  STZ $61DC                                 ; $029A0A |
  REP #$10                                  ; $029A0D |
  JSL $04EF27                               ; $029A0F |
  SEP #$10                                  ; $029A13 |
  JSL $03A31E                               ; $029A15 |
  PHX                                       ; $029A19 |
  LDA #$0029                                ; $029A1A |
  LDY #$00                                  ; $029A1D |
  TYX                                       ; $029A1F |
  STX $12                                   ; $029A20 |
  JSL $03A377                               ; $029A22 |
  LDA #$0010                                ; $029A26 |
  STA !s_spr_state                          ; $029A29 |
  LDA !s_spr_y_pixel_pos                    ; $029A2C |
  SEC                                       ; $029A2F |
  SBC #$0008                                ; $029A30 |
  STA !s_spr_y_pixel_pos                    ; $029A33 |
  JSL $03BEB9                               ; $029A36 |
  PLX                                       ; $029A3A |
  LDA #$B600                                ; $029A3B |
  STA $6114                                 ; $029A3E |
  STZ !s_player_disable_flag                ; $029A41 |
  STZ !s_sprite_disable_flag                ; $029A44 |
  LDA #$0002                                ; $029A47 |
  STA !r_apu_io_0_mirror                    ; $029A4A |
  STZ $0205                                 ; $029A4D |

CODE_029A50:
  LDA #$0200                                ; $029A50 |
  STA !s_super_mario_timer                  ; $029A53 |
  RTL                                       ; $029A56 |

init_full_eggs:
  RTL                                       ; $029A57 |

main_full_eggs:
  JSL $03B69D                               ; $029A58 |
  LDA !s_spr_y_accel,x                      ; $029A5C |
  BNE CODE_029A6E                           ; $029A5F |
  LDA #$003A                                ; $029A61 |\ play sound #$003A
  JSL push_sound_queue                      ; $029A64 |/
  LDA #$0040                                ; $029A68 |
  STA !s_spr_y_accel,x                      ; $029A6B |

CODE_029A6E:
  LDA !s_spr_y_pixel_pos,x                  ; $029A6E |
  SEC                                       ; $029A71 |
  SBC !s_player_y                           ; $029A72 |
  CMP #$0010                                ; $029A75 |
  BMI CODE_029AC5                           ; $029A78 |
  LDA #$0025                                ; $029A7A |
  JSL spawn_sprite_active                   ; $029A7D |
  BCS CODE_029A9B                           ; $029A81 |
  LDA #$0025                                ; $029A83 |
  TXY                                       ; $029A86 |
  JSL $03A377                               ; $029A87 |
  LDA !s_player_y                           ; $029A8B |
  CLC                                       ; $029A8E |
  ADC #$0010                                ; $029A8F |
  STA !s_spr_y_pixel_pos,x                  ; $029A92 |
  JSL $03BEB9                               ; $029A95 |
  BRA CODE_029AC2                           ; $029A99 |

CODE_029A9B:
  LDA !s_spr_x_pixel_pos,x                  ; $029A9B |
  STA !s_spr_x_pixel_pos,y                  ; $029A9E |
  LDA !s_player_y                           ; $029AA1 |
  CLC                                       ; $029AA4 |
  ADC #$0010                                ; $029AA5 |
  STA !s_spr_y_pixel_pos,y                  ; $029AA8 |
  PHX                                       ; $029AAB |
  TYX                                       ; $029AAC |
  STX $12                                   ; $029AAD |
  JSL $03BEB9                               ; $029AAF |
  PLX                                       ; $029AB3 |
  STX $12                                   ; $029AB4 |
  LDA !s_cur_egg_inv_size                   ; $029AB6 |
  CMP #$000C                                ; $029AB9 |
  BCC CODE_029AC6                           ; $029ABC |
  JSL $03A31E                               ; $029ABE |

CODE_029AC2:
  STZ !r_cur_item_used                      ; $029AC2 |

CODE_029AC5:
  RTL                                       ; $029AC5 |

; called by full egg pause item
; sets position
CODE_029AC6:
  LDA !s_player_x                           ; $029AC6 |
  STA !s_spr_x_pixel_pos,x                  ; $029AC9 |
  LDA !s_player_y                           ; $029ACC |
  SEC                                       ; $029ACF |
  SBC #$0020                                ; $029AD0 |
  STA !s_spr_y_pixel_pos,x                  ; $029AD3 |
  LDA #$FD00                                ; $029AD6 |
  STA !s_spr_y_speed_lo,x                   ; $029AD9 |
  STZ !s_spr_y_accel,x                      ; $029ADC |
  JML $0280AC                               ; $029ADF |

  db $0F, $00, $03, $00, $0F, $00, $05, $04 ; $029AE3 |
  db $0F, $00, $07, $0A, $0F, $01, $0B, $0E ; $029AEB |
  db $0F, $02, $03, $02, $0F, $02, $05, $06 ; $029AF3 |
  db $0F, $02, $07, $0C, $0F, $04, $05, $08 ; $029AFB |
  db $0F, $05, $01, $0E, $0F, $06, $06, $0E ; $029B03 |
  db $0F, $0B, $0A, $08, $0F, $0C, $00, $0E ; $029B0B |
  db $0F, $10, $09, $00, $0F, $10, $0B, $04 ; $029B13 |
  db $0F, $10, $0D, $0A, $0F, $11, $06, $0E ; $029B1B |
  db $0F, $12, $09, $02, $0F, $12, $0B, $06 ; $029B23 |
  db $0F, $12, $0D, $0C, $0F, $17, $02, $08 ; $029B2B |
  db $0F, $19, $09, $08, $0F, $1D, $05, $0E ; $029B33 |
  db $FF                                    ; $029B3B |

init_hookbill_background:
  RTL                                       ; $029B3C |

  dw $7FFF, $7FFF, $7FFF, $7FFF             ; $029B3D |

main_hookbill_background:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $029B45 |
  BNE CODE_029B85                           ; $029B47 |
  LDA !r_bg1_cam_x                          ; $029B49 |
  LSR A                                     ; $029B4C |
  STA !gsu_r1                               ; $029B4D |
  LDA #$9AE3                                ; $029B50 |
  STA !gsu_r13                              ; $029B53 |
  STZ !gsu_r2                               ; $029B56 |
  LDA #$0100                                ; $029B59 |
  STA !gsu_r3                               ; $029B5C |
  STA !gsu_r4                               ; $029B5F |
  LDA !s_oam_next_free_slot_ptr             ; $029B62 |
  STA !gsu_r10                              ; $029B65 |
  LDA #$0002                                ; $029B68 |
  STA !gsu_r0                               ; $029B6B |
  LDA !s_spr_obj_tile_index,x               ; $029B6E |
  AND #$00FF                                ; $029B71 |
  ASL A                                     ; $029B74 |
  ASL A                                     ; $029B75 |
  ASL A                                     ; $029B76 |
  STA !gsu_r11                              ; $029B77 |
  LDX #$08                                  ; $029B7A |
  LDA #$9183                                ; $029B7C |
  JSL r_gsu_init_1                          ; $029B7F | GSU init
  LDX $12                                   ; $029B83 |

CODE_029B85:
  JSL $03AF23                               ; $029B85 |
  LDA $0B59                                 ; $029B89 |
  LSR A                                     ; $029B8C |
  BEQ CODE_029BC9                           ; $029B8D |
  LDA #$9B3D                                ; $029B8F |
  STA !gsu_r14                              ; $029B92 |
  LDA #$0002                                ; $029B95 |
  STA !gsu_r0                               ; $029B98 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029B9B |
  CLC                                       ; $029B9D |
  ADC #$0008                                ; $029B9E |
  CMP #$0100                                ; $029BA1 |
  BCC CODE_029BAD                           ; $029BA4 |
  JSL $03A31E                               ; $029BA6 |
  LDA #$0100                                ; $029BAA |

CODE_029BAD:
  STA !s_spr_wildcard_5_lo_dp,x             ; $029BAD |
  STA !gsu_r6                               ; $029BAF |
  LDA #$00FC                                ; $029BB2 |
  STA !gsu_r8                               ; $029BB5 |
  LDA #$0004                                ; $029BB8 |
  STA !gsu_r12                              ; $029BBB |
  LDX #$08                                  ; $029BBE |
  LDA #$E167                                ; $029BC0 |
  JSL r_gsu_init_1                          ; $029BC3 | GSU init
  LDX $12                                   ; $029BC7 |

CODE_029BC9:
  RTL                                       ; $029BC9 |

  LDA !s_spr_timer_1,x                      ; $029BCA |
  BEQ CODE_029BD0                           ; $029BCD |
  RTL                                       ; $029BCF |

CODE_029BD0:
  LDA #$0005                                ; $029BD0 |
  STA !s_spr_timer_1,x                      ; $029BD3 |
  LDA #$0808                                ; $029BD6 |
  PHA                                       ; $029BD9 | entry
  AND #$00FF                                ; $029BDA |
  STA $00                                   ; $029BDD |
  JSL random_number_gen                     ; $029BDF |
  LDA $0F                                   ; $029BE3 |
  AND #$FF00                                ; $029BE5 |
  ORA $00                                   ; $029BE8 |
  STA !reg_wrmpya                           ; $029BEA |
  PLA                                       ; $029BED |
  AND #$FF00                                ; $029BEE |
  STA $02                                   ; $029BF1 |
  LDA $11                                   ; $029BF3 |
  LSR A                                     ; $029BF5 |
  LDA !reg_rdmpyh                           ; $029BF6 |
  AND #$00FF                                ; $029BF9 |
  BCC CODE_029C01                           ; $029BFC |
  EOR #$FFFF                                ; $029BFE |

CODE_029C01:
  ADC !s_spr_x_pixel_pos,x                  ; $029C01 |
  STA $00                                   ; $029C04 |
  JSL random_number_gen                     ; $029C06 |
  LDA $10                                   ; $029C0A |
  AND #$00FF                                ; $029C0C |
  ORA $02                                   ; $029C0F |
  STA !reg_wrmpya                           ; $029C11 |
  NOP                                       ; $029C14 |
  NOP                                       ; $029C15 |
  LDA $11                                   ; $029C16 |
  LSR A                                     ; $029C18 |
  LDA !reg_rdmpyh                           ; $029C19 |
  AND #$00FF                                ; $029C1C |
  BCC CODE_029C24                           ; $029C1F |
  EOR #$FFFF                                ; $029C21 |

CODE_029C24:
  ADC !s_spr_y_pixel_pos,x                  ; $029C24 |
  STA $02                                   ; $029C27 |
  LDA #$01DD                                ; $029C29 |
  JSL spawn_ambient_sprite                  ; $029C2C |
  LDA $00                                   ; $029C30 |
  STA $70A2,y                               ; $029C32 |
  LDA $02                                   ; $029C35 |
  STA $7142,y                               ; $029C37 |
  LDA #$0004                                ; $029C3A |
  STA $7E4C,y                               ; $029C3D |
  LDA #$0006                                ; $029C40 |
  STA $7782,y                               ; $029C43 |
  RTL                                       ; $029C46 |

init_chomp_signboard:
  JSL $03AE60                               ; $029C47 |
  LDA #$0100                                ; $029C4B |
  STA !gsu_r6                               ; $029C4E |
  LDY !s_spr_dyntile_index,x                ; $029C51 |
  TYX                                       ; $029C54 |
  LDA $03A9CE,x                             ; $029C55 |
  STA !gsu_r3                               ; $029C59 |
  LDA $03A9EE,x                             ; $029C5C |
  STA !gsu_r2                               ; $029C60 |
  LDA #$0010                                ; $029C63 |
  STA !gsu_r8                               ; $029C66 |
  STA !gsu_r9                               ; $029C69 |
  LDA #$80C1                                ; $029C6C |
  STA !gsu_r12                              ; $029C6F |
  LDA #$0054                                ; $029C72 |
  STA !gsu_r13                              ; $029C75 |
  LDX #$08                                  ; $029C78 |
  LDA #$8293                                ; $029C7A |
  JSL r_gsu_init_1                          ; $029C7D | GSU init
  INC $0CF9                                 ; $029C81 |
  LDX $12                                   ; $029C84 |
  RTL                                       ; $029C86 |

main_chomp_signboard:
  JML $03AA52                               ; $029C87 |

init_falling_rock:
  LDA !s_spr_x_pixel_pos,x                  ; $029C8B |
  STA !gsu_r1                               ; $029C8E |
  LDA !s_spr_y_pixel_pos,x                  ; $029C91 |
  STA !gsu_r2                               ; $029C94 |
  LDX #$0A                                  ; $029C97 |
  LDA #$CD1E                                ; $029C99 |
  JSL r_gsu_init_3                          ; $029C9C | GSU init
  LDX $12                                   ; $029CA0 |
  LDA !gsu_r9                               ; $029CA2 |
  BNE CODE_029CAE                           ; $029CA5 |
  STZ $61C0                                 ; $029CA7 |
  JML $03A31E                               ; $029CAA |

CODE_029CAE:
  LDA !gsu_r1                               ; $029CAE |
  STA !s_spr_x_pixel_pos,x                  ; $029CB1 |
  LDA !gsu_r2                               ; $029CB4 |
  INC A                                     ; $029CB7 |
  STA !s_spr_y_pixel_pos,x                  ; $029CB8 |
  LDA !gsu_r9                               ; $029CBB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $029CBE |
  LSR A                                     ; $029CC0 |
  STA !s_spr_hitbox_width,x                 ; $029CC1 |
  LDA !gsu_r10                              ; $029CC4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $029CC7 |
  LSR A                                     ; $029CC9 |
  INC A                                     ; $029CCA |
  STA !s_spr_hitbox_height,x                ; $029CCB |
  LDA #$0008                                ; $029CCE |
  STA !s_spr_x_hitbox_offset,x              ; $029CD1 |
  STA !s_spr_y_hitbox_offset,x              ; $029CD4 |
  LDA !gsu_r3                               ; $029CD7 |
  ASL A                                     ; $029CDA |
  ASL A                                     ; $029CDB |
  ASL A                                     ; $029CDC |
  XBA                                       ; $029CDD |
  ORA !s_spr_oam_1,x                        ; $029CDE |
  STA !s_spr_oam_1,x                        ; $029CE1 |
  LDA #$0070                                ; $029CE4 |
  STA !s_spr_timer_1,x                      ; $029CE7 |
  RTL                                       ; $029CEA |

  JSR CODE_029DF6                           ; $029CEB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $029CEE |
  BNE CODE_029D54                           ; $029CF0 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029CF2 |
  SEC                                       ; $029CF4 |
  SBC #$0010                                ; $029CF5 |
  LSR A                                     ; $029CF8 |
  EOR #$FFFF                                ; $029CF9 |
  SEC                                       ; $029CFC |
  ADC !s_spr_x_pixel_pos,x                  ; $029CFD |
  CLC                                       ; $029D00 |
  ADC !s_spr_gsu_morph_1_lo,x               ; $029D01 |
  STA $0091                                 ; $029D04 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $029D07 |
  SEC                                       ; $029D09 |
  SBC #$0010                                ; $029D0A |
  LSR A                                     ; $029D0D |
  EOR #$FFFF                                ; $029D0E |
  SEC                                       ; $029D11 |
  ADC !s_spr_y_pixel_pos,x                  ; $029D12 |
  CLC                                       ; $029D15 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $029D16 |
  STA $0093                                 ; $029D19 |
  LDA #$0001                                ; $029D1C |
  STA $008F                                 ; $029D1F |
  LDA #$0000                                ; $029D22 |
  STA $0095                                 ; $029D25 |
  JSL $109295                               ; $029D28 |
  LDX $12                                   ; $029D2C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $029D2E |
  CLC                                       ; $029D31 |
  ADC #$0010                                ; $029D32 |
  CMP !s_spr_wildcard_5_lo,x                ; $029D35 |
  BCC CODE_029D51                           ; $029D38 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $029D3A |
  CLC                                       ; $029D3D |
  ADC #$0010                                ; $029D3E |
  CMP !s_spr_wildcard_6_lo,x                ; $029D41 |
  BCC CODE_029D4B                           ; $029D44 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $029D46 |
  STZ $61C0                                 ; $029D48 |

CODE_029D4B:
  STA !s_spr_gsu_morph_2_lo,x               ; $029D4B |
  LDA #$0000                                ; $029D4E |

CODE_029D51:
  STA !s_spr_gsu_morph_1_lo,x               ; $029D51 |

CODE_029D54:
  JSL $03AF23                               ; $029D54 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $029D58 |
  BEQ CODE_029DC6                           ; $029D5A |
  LDA !s_cam_event_flag                     ; $029D5C |
  BEQ CODE_029D6D                           ; $029D5F |
  TXA                                       ; $029D61 |
  LSR A                                     ; $029D62 |
  LSR A                                     ; $029D63 |
  TAY                                       ; $029D64 |
  LDA $0C98,y                               ; $029D65 |
  AND #$00FF                                ; $029D68 |
  BNE CODE_029D9B                           ; $029D6B |

CODE_029D6D:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029D6D |
  LSR A                                     ; $029D6F |
  ADC #$0018                                ; $029D70 |
  ADC !s_spr_cam_x_pos,x                    ; $029D73 |
  BMI CODE_029D97                           ; $029D76 |
  SEC                                       ; $029D78 |
  SBC !s_spr_wildcard_5_lo_dp,x             ; $029D79 |
  BCC CODE_029D9B                           ; $029D7B |
  CMP #$0120                                ; $029D7D |
  BCS CODE_029D97                           ; $029D80 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $029D82 |
  LSR A                                     ; $029D84 |
  ADC #$0018                                ; $029D85 |
  ADC !s_spr_cam_y_pos,x                    ; $029D88 |
  BMI CODE_029D97                           ; $029D8B |
  SEC                                       ; $029D8D |
  SBC !s_spr_wildcard_6_lo_dp,x             ; $029D8E |
  BCC CODE_029D9B                           ; $029D90 |
  CMP #$0100                                ; $029D92 |
  BCC CODE_029D9B                           ; $029D95 |

CODE_029D97:
  JML $03A31E                               ; $029D97 |

CODE_029D9B:
  LDA !s_spr_timer_1,x                      ; $029D9B |
  DEC A                                     ; $029D9E |
  CMP #$0050                                ; $029D9F |
  BCS CODE_029DC6                           ; $029DA2 |
  CMP #$0040                                ; $029DA4 |
  BNE CODE_029DAF                           ; $029DA7 |
  LDA #$0004                                ; $029DA9 |
  STA !s_spr_y_accel,x                      ; $029DAC |

CODE_029DAF:
  LDA $14                                   ; $029DAF |
  LSR A                                     ; $029DB1 |
  BCC CODE_029DC6                           ; $029DB2 |
  LDA !s_spr_x_pixel_pos,x                  ; $029DB4 |
  EOR #$0001                                ; $029DB7 |
  PHA                                       ; $029DBA |
  SEC                                       ; $029DBB |
  SBC !s_spr_x_pixel_pos,x                  ; $029DBC |
  STA !s_spr_x_delta_lo,x                   ; $029DBF |
  PLA                                       ; $029DC2 |
  STA !s_spr_x_pixel_pos,x                  ; $029DC3 |

CODE_029DC6:
  JML $03D05D                               ; $029DC6 |

  dw $7900, $7901, $7902, $7909             ; $029DCA |
  dw $790A, $790B, $7903, $7904             ; $029DD2 |
  dw $7905, $0000, $0000, $0000             ; $029DDA |
  dw $0000, $0000, $0000, $0000             ; $029DE2 |
  dw $7906, $7907, $7908, $0000             ; $029DEA |
  dw $0000, $0000                           ; $029DF2 |

CODE_029DF6:
  LDA !s_spr_oam_pointer,x                  ; $029DF6 |
  BMI CODE_029E34                           ; $029DF9 |
  STA !gsu_r1                               ; $029DFB |
  LDA !s_spr_cam_x_pos,x                    ; $029DFE |
  STA !gsu_r2                               ; $029E01 |
  LDA !s_spr_cam_y_pos,x                    ; $029E04 |
  DEC A                                     ; $029E07 |
  STA !gsu_r3                               ; $029E08 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029E0B |
  STA !gsu_r4                               ; $029E0D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $029E10 |
  STA !gsu_r5                               ; $029E12 |
  LDA !s_spr_obj_tile_index,x               ; $029E15 |
  AND #$00FF                                ; $029E18 |
  ASL A                                     ; $029E1B |
  ASL A                                     ; $029E1C |
  ASL A                                     ; $029E1D |
  XBA                                       ; $029E1E |
  ORA !s_spr_oam_yxppccct,x                 ; $029E1F |
  XBA                                       ; $029E22 |
  STA !gsu_r6                               ; $029E23 |
  STA !s_spr_wildcard_2_lo,x                ; $029E26 |
  LDX #$09                                  ; $029E29 |
  LDA #$9126                                ; $029E2B |
  JSL r_gsu_init_1                          ; $029E2E | GSU init
  LDX $12                                   ; $029E32 |

CODE_029E34:
  RTS                                       ; $029E34 |

  dw $0000, $0000, $0000, $0008             ; $029E35 |

  dw $FFD8, $FFF0, $FFC0, $FFF0             ; $029E3D |

  dw $0030, $0030, $0030, $0060             ; $029E45 |

  dw $0060, $0030, $0090, $0030             ; $029E4D |

; 3x6, 3x3, 3x9, 6x3 falling rock
init_falling_rock_common:
  LDA !s_spr_id,x                           ; $029E55 |
  SEC                                       ; $029E58 |
  SBC #$0137                                ; $029E59 |
  ASL A                                     ; $029E5C |
  TAY                                       ; $029E5D |
  LDA !s_spr_x_pixel_pos,x                  ; $029E5E |
  CLC                                       ; $029E61 |
  ADC $9E35,y                               ; $029E62 |
  STA !s_spr_x_pixel_pos,x                  ; $029E65 |
  LDA !s_spr_y_pixel_pos,x                  ; $029E68 |
  CLC                                       ; $029E6B |
  ADC $9E3D,y                               ; $029E6C |
  STA !s_spr_y_pixel_pos,x                  ; $029E6F |
  LDA $9E45,y                               ; $029E72 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $029E75 |
  LSR A                                     ; $029E77 |
  STA !s_spr_hitbox_width,x                 ; $029E78 |
  LDA $9E4D,y                               ; $029E7B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $029E7E |
  LSR A                                     ; $029E80 |
  INC A                                     ; $029E81 |
  STA !s_spr_hitbox_height,x                ; $029E82 |
  LDA #$0008                                ; $029E85 |
  STA !s_spr_x_hitbox_offset,x              ; $029E88 |
  STA !s_spr_y_hitbox_offset,x              ; $029E8B |
  RTL                                       ; $029E8E |

; 3x6, 3x3, 3x9, 6x3 falling rock
main_falling_rock_common:
  JSR CODE_029DF6                           ; $029E8F |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $029E92 |
  BEQ CODE_029E99                           ; $029E94 |
  JMP CODE_029F33                           ; $029E96 |

CODE_029E99:
  JSL $03AF23                               ; $029E99 |
  LDA $7CD7,x                               ; $029E9D |
  AND #$000F                                ; $029EA0 |
  STA $00                                   ; $029EA3 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $029EA5 |
  LSR A                                     ; $029EA7 |
  STA $02                                   ; $029EA8 |
  LDA !s_spr_y_hitbox_center,x              ; $029EAA |
  SEC                                       ; $029EAD |
  SBC $02                                   ; $029EAE |
  CMP #$0800                                ; $029EB0 |
  BCS CODE_029EC4                           ; $029EB3 |
  AND #$0700                                ; $029EB5 |
  LSR A                                     ; $029EB8 |
  LSR A                                     ; $029EB9 |
  LSR A                                     ; $029EBA |
  LSR A                                     ; $029EBB |
  ORA $00                                   ; $029EBC |
  TAY                                       ; $029EBE |
  LDA $6CA9,y                               ; $029EBF |
  BPL CODE_029EC8                           ; $029EC2 |

CODE_029EC4:
  JML $03A32E                               ; $029EC4 |

CODE_029EC8:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029EC8 |
  LSR A                                     ; $029ECA |
  PHA                                       ; $029ECB |
  EOR #$FFFF                                ; $029ECC |
  SEC                                       ; $029ECF |
  ADC !s_spr_x_hitbox_center,x              ; $029ED0 |
  CLC                                       ; $029ED3 |
  ADC #$0008                                ; $029ED4 |
  STA $00                                   ; $029ED7 |
  LDA $02                                   ; $029ED9 |
  CLC                                       ; $029EDB |
  ADC !s_spr_y_hitbox_center,x              ; $029EDC |
  STA $02                                   ; $029EDF |
  PLA                                       ; $029EE1 |
  LSR A                                     ; $029EE2 |
  LSR A                                     ; $029EE3 |
  LSR A                                     ; $029EE4 |
  STA $04                                   ; $029EE5 |

CODE_029EE7:
  LDA $00                                   ; $029EE7 |
  STA !gsu_r8                               ; $029EE9 |
  LDA $02                                   ; $029EEC |
  STA !gsu_r0                               ; $029EEE |
  LDX #$0A                                  ; $029EF1 |
  LDA #$CE2F                                ; $029EF3 |
  JSL r_gsu_init_3                          ; $029EF6 | GSU init
  LDA !gsu_r7                               ; $029EFA |
  AND #$0003                                ; $029EFD |
  BNE CODE_029F13                           ; $029F00 |
  LDA $00                                   ; $029F02 |
  CLC                                       ; $029F04 |
  ADC #$0010                                ; $029F05 |
  STA $00                                   ; $029F08 |
  DEC $04                                   ; $029F0A |
  BNE CODE_029EE7                           ; $029F0C |
  LDX $12                                   ; $029F0E |
  JMP CODE_029FD0                           ; $029F10 |

CODE_029F13:
  LDA #$0048                                ; $029F13 |\ play sound #$0048
  JSL push_sound_queue                      ; $029F16 |/
  LDX $12                                   ; $029F1A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $029F1C |
  LDA !s_spr_y_pixel_pos,x                  ; $029F1E |
  AND #$FFF8                                ; $029F21 |
  STA !s_spr_y_pixel_pos,x                  ; $029F24 |
  STZ !s_spr_y_speed_lo,x                   ; $029F27 |
  LDA #$0020                                ; $029F2A |
  STA !s_cam_y_small_shaking_timer          ; $029F2D |
  JMP CODE_029FD0                           ; $029F30 |

CODE_029F33:
  LDA !s_spr_wildcard_5_lo,x                ; $029F33 |
  LSR A                                     ; $029F36 |
  STA !reg_wrmpya                           ; $029F37 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $029F3A |
  LSR A                                     ; $029F3D |
  LSR A                                     ; $029F3E |
  LSR A                                     ; $029F3F |
  LSR A                                     ; $029F40 |
  STA !reg_wrmpyb                           ; $029F41 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $029F44 |
  LSR A                                     ; $029F46 |
  EOR #$FFFF                                ; $029F47 |
  SEC                                       ; $029F4A |
  ADC !s_spr_x_hitbox_center,x              ; $029F4B |
  CLC                                       ; $029F4E |
  ADC !s_spr_gsu_morph_1_lo,x               ; $029F4F |
  STA $0091                                 ; $029F52 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $029F55 |
  LSR A                                     ; $029F57 |
  EOR #$FFFF                                ; $029F58 |
  SEC                                       ; $029F5B |
  ADC !s_spr_y_hitbox_center,x              ; $029F5C |
  CLC                                       ; $029F5F |
  ADC !s_spr_gsu_morph_2_lo,x               ; $029F60 |
  STA $0093                                 ; $029F63 |
  LDA #$0001                                ; $029F66 |
  STA $008F                                 ; $029F69 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $029F6C |
  LSR A                                     ; $029F6F |
  ADC !reg_rdmpyl                           ; $029F70 |
  CLC                                       ; $029F73 |
  ADC !s_spr_oam_pointer,x                  ; $029F74 |
  REP #$10                                  ; $029F77 |
  TAY                                       ; $029F79 |
  LDA $6004,y                               ; $029F7A |
  SEP #$10                                  ; $029F7D |
  SEC                                       ; $029F7F |
  SBC !s_spr_wildcard_2_lo,x                ; $029F80 |
  BPL CODE_029F96                           ; $029F83 |
  AND #$7FFF                                ; $029F85 |
  CMP #$0020                                ; $029F88 |
  BCC CODE_029F90                           ; $029F8B |
  SBC #$0010                                ; $029F8D |

CODE_029F90:
  CLC                                       ; $029F90 |
  ADC #$0014                                ; $029F91 |
  BRA CODE_029F9E                           ; $029F94 |

CODE_029F96:
  CMP #$0020                                ; $029F96 |
  BCC CODE_029F9E                           ; $029F99 |
  SBC #$0010                                ; $029F9B |

CODE_029F9E:
  TAY                                       ; $029F9E |
  LDA $9DCA,y                               ; $029F9F |
  STA $0095                                 ; $029FA2 |
  JSL $109295                               ; $029FA5 |
  LDX $12                                   ; $029FA9 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $029FAB |
  CLC                                       ; $029FAE |
  ADC #$0010                                ; $029FAF |
  CMP !s_spr_wildcard_5_lo,x                ; $029FB2 |
  BCC CODE_029FCD                           ; $029FB5 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $029FB7 |
  CLC                                       ; $029FBA |
  ADC #$0010                                ; $029FBB |
  CMP !s_spr_wildcard_6_lo,x                ; $029FBE |
  BCC CODE_029FC7                           ; $029FC1 |
  JML $03A32E                               ; $029FC3 |

CODE_029FC7:
  STA !s_spr_gsu_morph_2_lo,x               ; $029FC7 |
  LDA #$0000                                ; $029FCA |

CODE_029FCD:
  STA !s_spr_gsu_morph_1_lo,x               ; $029FCD |

CODE_029FD0:
  JSL $03D05D                               ; $029FD0 |
  LDY !s_spr_collision_id,x                 ; $029FD4 |
  DEY                                       ; $029FD7 |
  BMI CODE_029FE3                           ; $029FD8 |
  BEQ CODE_029FE3                           ; $029FDA |
  TYX                                       ; $029FDC |
  JSL $039F91                               ; $029FDD |
  LDX $12                                   ; $029FE1 |

CODE_029FE3:
  RTL                                       ; $029FE3 |

init_key:
  LDA !s_spr_wildcard_1_lo,x                ; $029FE4 |
  ORA !s_spr_wildcard_2_lo,x                ; $029FE7 |
  BNE CODE_02A006                           ; $029FEA |
  JSL $03D3F8                               ; $029FEC |
  BEQ CODE_029FF6                           ; $029FF0 |
  JML $03A32E                               ; $029FF2 |

CODE_029FF6:
  JSL $02A007                               ; $029FF6 |
  LDA !s_spr_x_pixel_pos,x                  ; $029FFA |
  STA !s_spr_wildcard_1_lo,x                ; $029FFD |
  LDA !s_spr_y_pixel_pos,x                  ; $02A000 |
  STA !s_spr_wildcard_2_lo,x                ; $02A003 |

CODE_02A006:
  RTL                                       ; $02A006 |

; long subroutine
  LDA !s_spr_x_pixel_pos,x                  ; $02A007 |
  AND #$FFF0                                ; $02A00A |
  ORA #$0008                                ; $02A00D |
  STA !gsu_r8                               ; $02A010 |
  LDA !s_spr_y_pixel_pos,x                  ; $02A013 |
  AND #$FFF0                                ; $02A016 |
  ORA #$0008                                ; $02A019 |
  STA !gsu_r0                               ; $02A01C |
  LDX #$0A                                  ; $02A01F |
  LDA #$CE2F                                ; $02A021 |
  JSL r_gsu_init_3                          ; $02A024 | GSU init
  LDX $12                                   ; $02A028 |
  LDA !gsu_r7                               ; $02A02A |
  AND #$F800                                ; $02A02D |
  CMP #$B800                                ; $02A030 |
  BNE CODE_02A049                           ; $02A033 |
  LDA #$0002                                ; $02A035 |
  STA !s_spr_state,x                        ; $02A038 |
  LDA $6000                                 ; $02A03B |
  STA !s_spr_x_pixel_pos,x                  ; $02A03E |
  LDA $6002                                 ; $02A041 |
  STA !s_spr_y_pixel_pos,x                  ; $02A044 |
  PLA                                       ; $02A047 |\
  PLY                                       ; $02A048 | | go back two longs in stack

CODE_02A049:
  RTL                                       ; $02A049 |/

main_key:
  LDA !s_spr_collision_state,x              ; $02A04A |
  BEQ CODE_02A059                           ; $02A04D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02A04F |
  CMP #$0002                                ; $02A051 |
  BCC CODE_02A059                           ; $02A054 |
  STZ !s_spr_collision_state,x              ; $02A056 |

CODE_02A059:
  JSL $03B9DD                               ; $02A059 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02A05D |
  BEQ CODE_02A064                           ; $02A05F |
  JMP CODE_02A099                           ; $02A061 |

CODE_02A064:
  LDA $7860,x                               ; $02A064 |
  AND #$0001                                ; $02A067 |
  BEQ CODE_02A070                           ; $02A06A |
  JSL $03A58B                               ; $02A06C |

CODE_02A070:
  LDY !s_spr_collision_id,x                 ; $02A070 |
  BPL CODE_02A08C                           ; $02A073 |
  LDA !s_player_form                        ; $02A075 |
  BNE CODE_02A08C                           ; $02A078 |
  JSL $03C640                               ; $02A07A |
  JSL $03BEB9                               ; $02A07E |
  DEC !r_sound_queue_size                   ; $02A082 |
  LDA #$001E                                ; $02A085 |
  JML $0085D2                               ; $02A088 |

CODE_02A08C:
  LDA !s_spr_y_pixel_pos,x                  ; $02A08C |
  CMP #$0800                                ; $02A08F |
  BMI CODE_02A098                           ; $02A092 |
  JML $03A31E                               ; $02A094 |

CODE_02A098:
  RTL                                       ; $02A098 |

CODE_02A099:
  JSL $03BB1D                               ; $02A099 |
  RTL                                       ; $02A09D |

init_boss_door_bowser:
  JSL $03AEBE                               ; $02A09E |
  JSL $02A153                               ; $02A0A2 |
  LDA !s_spr_x_pixel_pos,x                  ; $02A0A6 |
  ORA #$0008                                ; $02A0A9 |
  STA !s_spr_x_pixel_pos,x                  ; $02A0AC |
  LDA #$001C                                ; $02A0AF |
  STA !s_spr_hitbox_width,x                 ; $02A0B2 |
  LDA #$0039                                ; $02A0B5 |
  STA !s_spr_hitbox_height,x                ; $02A0B8 |
  RTL                                       ; $02A0BB |

init_locked_door:
  JSL $03D3F8                               ; $02A0BC |
  BEQ init_locked_door_2                    ; $02A0C0 |
  LDA #$0001                                ; $02A0C2 |
  STA !s_spr_id,x                           ; $02A0C5 |
  LDA !s_spr_y_pixel_pos,x                  ; $02A0C8 |
  CLC                                       ; $02A0CB |
  ADC #$0010                                ; $02A0CC |
  STA !s_spr_y_pixel_pos,x                  ; $02A0CF |
  BRA init_closed_door                      ; $02A0D2 |

init_locked_door_2:
  JSL $03D3F8                               ; $02A0D4 |
  BNE CODE_02A0DF                           ; $02A0D8 |
  INC !s_spr_gsu_morph_1_lo,x               ; $02A0DA |
  BRA CODE_02A134                           ; $02A0DD |

CODE_02A0DF:
  LDA #$0093                                ; $02A0DF |
  STA !s_spr_id,x                           ; $02A0E2 |
  BRA CODE_02A134                           ; $02A0E5 |

init_closed_door:
  LDA #$0003                                ; $02A0E7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02A0EA |
  LDA !r_game_mode                          ; $02A0EC |
  CMP #$000D                                ; $02A0EF |
  BNE init_door                             ; $02A0F2 |
  LDA !s_player_x                           ; $02A0F4 |
  CMP !s_spr_x_pixel_pos,x                  ; $02A0F7 |
  BNE init_door                             ; $02A0FA |
  LDA !s_player_y                           ; $02A0FC |
  ADC #$000F                                ; $02A0FF |
  CMP !s_spr_y_pixel_pos,x                  ; $02A102 |
  BNE init_door                             ; $02A105 |
  LDA #$7005                                ; $02A107 |
  STA !s_spr_oam_1,x                        ; $02A10A |
  LDA #$0002                                ; $02A10D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02A110 |
  INC !s_spr_anim_frame,x                   ; $02A112 |
  LDA #$0020                                ; $02A115 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02A118 |
  LDA #$0004                                ; $02A11A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02A11D |
  LDA #$0040                                ; $02A11F |
  STA !s_spr_timer_1,x                      ; $02A122 |

; both regular and boss door
init_door:
  LDA !s_spr_dyntile_index,x                ; $02A125 |
  BPL CODE_02A13E                           ; $02A128 |
  LDA !s_spr_y_pixel_pos,x                  ; $02A12A |
  SEC                                       ; $02A12D |
  SBC #$0010                                ; $02A12E |
  STA !s_spr_y_pixel_pos,x                  ; $02A131 |

CODE_02A134:
  JSL $03AE60                               ; $02A134 |
  JSL $02A153                               ; $02A138 |
  BRA CODE_02A142                           ; $02A13C |

CODE_02A13E:
  JSL $02A1FD                               ; $02A13E |

CODE_02A142:
  JSL $02A007                               ; $02A142 |
  LDA #$000C                                ; $02A146 |
  STA !s_spr_hitbox_width,x                 ; $02A149 |
  LDA #$0019                                ; $02A14C |
  STA !s_spr_hitbox_height,x                ; $02A14F |
  RTL                                       ; $02A152 |

  LDA !s_spr_id,x                           ; $02A153 |
  CMP #$004E                                ; $02A156 |
  BEQ CODE_02A190                           ; $02A159 |
  CMP #$0131                                ; $02A15B |
  BEQ CODE_02A190                           ; $02A15E |
  CMP #$0093                                ; $02A160 |
  BEQ CODE_02A185                           ; $02A163 |
  CMP #$00CA                                ; $02A165 |
  BEQ CODE_02A1C2                           ; $02A168 |
  CMP #$0012                                ; $02A16A |
  BNE CODE_02A17A                           ; $02A16D |
  LDA #$60C0                                ; $02A16F |
  STA !gsu_r9                               ; $02A172 |
  LDA #$0055                                ; $02A175 |
  BRA CODE_02A199                           ; $02A178 |

CODE_02A17A:
  LDA #$0021                                ; $02A17A |
  STA !gsu_r9                               ; $02A17D |
  LDA #$0055                                ; $02A180 |
  BRA CODE_02A199                           ; $02A183 |

CODE_02A185:
  LDA #$00F1                                ; $02A185 |
  STA !gsu_r9                               ; $02A188 |
  LDA #$0054                                ; $02A18B |
  BRA CODE_02A199                           ; $02A18E |

CODE_02A190:
  LDA #$6000                                ; $02A190 |
  STA !gsu_r9                               ; $02A193 |
  LDA #$0055                                ; $02A196 |

CODE_02A199:
  STA !gsu_r11                              ; $02A199 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02A19C |
  STA !gsu_r10                              ; $02A19E |
  LDY !s_spr_dyntile_index,x                ; $02A1A1 |
  TYX                                       ; $02A1A4 |
  LDA $03A9CE,x                             ; $02A1A5 |
  STA $6000                                 ; $02A1A9 |
  LDA $03A9EE,x                             ; $02A1AC |
  STA $6002                                 ; $02A1B0 |
  LDX #$08                                  ; $02A1B3 |
  LDA #$D317                                ; $02A1B5 |
  JSL r_gsu_init_1                          ; $02A1B8 | GSU init
  INC $0CF9                                 ; $02A1BC |
  LDX $12                                   ; $02A1BF |
  RTL                                       ; $02A1C1 |

CODE_02A1C2:
  LDA #$60C0                                ; $02A1C2 |
  STA !gsu_r9                               ; $02A1C5 |
  LDA #$0055                                ; $02A1C8 |
  STA !gsu_r11                              ; $02A1CB |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02A1CE |
  STA !gsu_r10                              ; $02A1D0 |
  LDY !s_spr_dyntile_index,x                ; $02A1D3 |
  TYX                                       ; $02A1D6 |
  LDA $03A9CE,x                             ; $02A1D7 |
  STA $6000                                 ; $02A1DB |
  LDA $03A9EE,x                             ; $02A1DE |
  STA $6002                                 ; $02A1E2 |
  LDX #$08                                  ; $02A1E5 |
  LDA #$D317                                ; $02A1E7 |
  JSL r_gsu_init_1                          ; $02A1EA | GSU init
  LDX #$09                                  ; $02A1EE |
  LDA #$F897                                ; $02A1F0 |
  JSL r_gsu_init_1                          ; $02A1F3 | GSU init
  INC $0CF9                                 ; $02A1F7 |
  LDX $12                                   ; $02A1FA |
  RTL                                       ; $02A1FC |

  REP #$10                                  ; $02A1FD |
  LDY !s_spr_oam_pointer,x                  ; $02A1FF |
  LDA !s_spr_id,x                           ; $02A202 |
  CMP #$00CA                                ; $02A205 |
  BEQ CODE_02A247                           ; $02A208 |
  LDA !s_spr_dyntile_index,x                ; $02A20A |
  TAX                                       ; $02A20D |
  LDA $6004,y                               ; $02A20E |
  AND #$FE00                                ; $02A211 |
  ORA $03AA0E,x                             ; $02A214 |
  STA $6004,y                               ; $02A218 |
  LDA $600C,y                               ; $02A21B |
  AND #$FE00                                ; $02A21E |
  ORA $03AA0E,x                             ; $02A221 |
  STA $600C,y                               ; $02A225 |
  LDA $6014,y                               ; $02A228 |
  AND #$FE00                                ; $02A22B |
  ORA $03AA12,x                             ; $02A22E |
  STA $6014,y                               ; $02A232 |
  LDA $601C,y                               ; $02A235 |
  AND #$FE00                                ; $02A238 |
  ORA $03AA12,x                             ; $02A23B |
  STA $601C,y                               ; $02A23F |
  SEP #$10                                  ; $02A242 |
  LDX $12                                   ; $02A244 |
  RTL                                       ; $02A246 |

CODE_02A247:
  LDA !s_spr_dyntile_index,x                ; $02A247 |
  TAX                                       ; $02A24A |
  LDA $6004,y                               ; $02A24B |
  AND #$FE00                                ; $02A24E |
  ORA $03AA0E,x                             ; $02A251 |
  STA $6004,y                               ; $02A255 |
  LDA $600C,y                               ; $02A258 |
  AND #$FE00                                ; $02A25B |
  ORA $03AA10,x                             ; $02A25E |
  STA $600C,y                               ; $02A262 |
  LDA $6014,y                               ; $02A265 |
  AND #$FE00                                ; $02A268 |
  ORA $03AA12,x                             ; $02A26B |
  STA $6014,y                               ; $02A26F |
  LDA $601C,y                               ; $02A272 |
  AND #$FE00                                ; $02A275 |
  ORA $03AA14,x                             ; $02A278 |
  STA $601C,y                               ; $02A27C |
  LDA $6024,y                               ; $02A27F |
  AND #$FE00                                ; $02A282 |
  ORA $03AA16,x                             ; $02A285 |
  STA $6024,y                               ; $02A289 |
  LDA $602C,y                               ; $02A28C |
  AND #$FE00                                ; $02A28F |
  ORA $03AA18,x                             ; $02A292 |
  STA $602C,y                               ; $02A296 |
  LDA $6034,y                               ; $02A299 |
  AND #$FE00                                ; $02A29C |
  ORA $03AA1A,x                             ; $02A29F |
  STA $6034,y                               ; $02A2A3 |
  LDA $603C,y                               ; $02A2A6 |
  AND #$FE00                                ; $02A2A9 |
  ORA $03AA1C,x                             ; $02A2AC |
  STA $603C,y                               ; $02A2B0 |
  LDA $6044,y                               ; $02A2B3 |
  AND #$FE00                                ; $02A2B6 |
  ORA $03AA0E,x                             ; $02A2B9 |
  STA $6044,y                               ; $02A2BD |
  LDA $604C,y                               ; $02A2C0 |
  AND #$FE00                                ; $02A2C3 |
  ORA $03AA10,x                             ; $02A2C6 |
  STA $604C,y                               ; $02A2CA |
  LDA $6054,y                               ; $02A2CD |
  AND #$FE00                                ; $02A2D0 |
  ORA $03AA12,x                             ; $02A2D3 |
  STA $6054,y                               ; $02A2D7 |
  LDA $605C,y                               ; $02A2DA |
  AND #$FE00                                ; $02A2DD |
  ORA $03AA14,x                             ; $02A2E0 |
  STA $605C,y                               ; $02A2E4 |
  LDA $6064,y                               ; $02A2E7 |
  AND #$FE00                                ; $02A2EA |
  ORA $03AA16,x                             ; $02A2ED |
  STA $6064,y                               ; $02A2F1 |
  LDA $606C,y                               ; $02A2F4 |
  AND #$FE00                                ; $02A2F7 |
  ORA $03AA18,x                             ; $02A2FA |
  STA $606C,y                               ; $02A2FE |
  LDA $6074,y                               ; $02A301 |
  AND #$FE00                                ; $02A304 |
  ORA $03AA1A,x                             ; $02A307 |
  STA $6074,y                               ; $02A30B |
  LDA $607C,y                               ; $02A30E |
  AND #$FE00                                ; $02A311 |
  ORA $03AA1C,x                             ; $02A314 |
  STA $607C,y                               ; $02A318 |
  SEP #$10                                  ; $02A31B |
  LDX $12                                   ; $02A31D |
  RTL                                       ; $02A31F |

  dw $0001                                  ; $02A320 |
  dw $FFFF                                  ; $02A322 |
  dw $0008                                  ; $02A324 |
  dw $FFF8                                  ; $02A326 |

  dw $0040                                  ; $02A328 |
  dw $0020                                  ; $02A32A |
  dw $0040                                  ; $02A32C |
  dw $0000                                  ; $02A32E |

; all doors
main_door:
  JSL $02A1FD                               ; $02A330 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02A334 |
  BEQ CODE_02A33B                           ; $02A336 |
  JMP CODE_02A3F0                           ; $02A338 |

CODE_02A33B:
  JSL $03AF23                               ; $02A33B |
  LDA !s_player_jump_state                  ; $02A33F |
  BNE CODE_02A34C                           ; $02A342 |
  LDA !s_spr_y_pixel_pos,x                  ; $02A344 |
  CMP !s_player_y                           ; $02A347 |
  BEQ CODE_02A34D                           ; $02A34A |

CODE_02A34C:
  RTL                                       ; $02A34C |

CODE_02A34D:
  LDA !s_spr_x_player_delta,x               ; $02A34D |
  CLC                                       ; $02A350 |
  ADC !s_spr_hitbox_width,x                 ; $02A351 |
  CMP !s_spr_hitbox_height,x                ; $02A354 |
  BCS CODE_02A34C                           ; $02A357 |
  LDA !r_joy1_hi_press_mirror               ; $02A359 |
  AND #$0008                                ; $02A35C |
  BEQ CODE_02A34C                           ; $02A35F |
  LDA !s_baby_mario_state                   ; $02A361 |
  BPL CODE_02A34C                           ; $02A364 |
  LDA !s_player_mouth_state                 ; $02A366 |
  BNE CODE_02A34C                           ; $02A369 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02A36B |
  BEQ CODE_02A3A7                           ; $02A36E |
  LDY !s_cur_egg_inv_size                   ; $02A370 |
  BEQ CODE_02A34C                           ; $02A373 |
  LDA $7DF6,y                               ; $02A375 |
  TAY                                       ; $02A378 |
  LDA !s_spr_id,y                           ; $02A379 |
  CMP #$0027                                ; $02A37C |
  BEQ CODE_02A388                           ; $02A37F |
  LDA #$0038                                ; $02A381 |\ play sound #$0038
  JML $0085D2                               ; $02A384 |/

CODE_02A388:
  TYX                                       ; $02A388 |
  JSL $03BF87                               ; $02A389 |
  JSL $03A31E                               ; $02A38D |
  LDA #$0064                                ; $02A391 |\ play sound #$0064
  JSL push_sound_queue                      ; $02A394 |/
  LDX $12                                   ; $02A398 |
  JSL $03D3EB                               ; $02A39A |
  JSL $02A4F4                               ; $02A39E |
  LDA #$0040                                ; $02A3A2 |
  BRA CODE_02A3AA                           ; $02A3A5 |

CODE_02A3A7:
  LDA #$0002                                ; $02A3A7 |

CODE_02A3AA:
  STA !s_spr_timer_1,x                      ; $02A3AA |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02A3AD |
  LDA !s_spr_id,x                           ; $02A3AF |
  CMP #$00CA                                ; $02A3B2 |
  BEQ CODE_02A3BD                           ; $02A3B5 |
  LDA #$7005                                ; $02A3B7 |
  STA !s_spr_oam_1,x                        ; $02A3BA |

CODE_02A3BD:
  LDA #$000A                                ; $02A3BD |
  STA !s_player_state                       ; $02A3C0 |
  STZ $0C8C                                 ; $02A3C3 |
  STZ !s_door_exit_type                     ; $02A3C6 |
  INC $0C8E                                 ; $02A3C9 |
  LDA !s_spr_id,x                           ; $02A3CC |
  CMP #$004E                                ; $02A3CF |
  BNE CODE_02A3D7                           ; $02A3D2 |
  DEC !s_door_exit_type                     ; $02A3D4 |

CODE_02A3D7:
  LDA #$0001                                ; $02A3D7 |
  STA !s_player_disable_flag                ; $02A3DA |
  STA !s_sprite_disable_flag                ; $02A3DD |
  STZ !s_player_running_anim_state          ; $02A3E0 |
  LDA #$0006                                ; $02A3E3 |
  STA $61D2                                 ; $02A3E6 |
  LDA #$0008                                ; $02A3E9 |
  STA $6116                                 ; $02A3EC |

CODE_02A3EF:
  RTL                                       ; $02A3EF |

CODE_02A3F0:
  LDA !r_msg_box_state                      ; $02A3F0 |
  BNE CODE_02A3EF                           ; $02A3F3 |
  CPY #$03                                  ; $02A3F5 |
  BEQ CODE_02A3EF                           ; $02A3F7 |
  LDA !s_spr_timer_1,x                      ; $02A3F9 |
  BEQ CODE_02A40F                           ; $02A3FC |
  DEC !s_spr_timer_1,x                      ; $02A3FE |
  BNE CODE_02A40E                           ; $02A401 |
  CPY #$02                                  ; $02A403 |
  BEQ CODE_02A40E                           ; $02A405 |
  LDA #$0040                                ; $02A407 |\ play sound #$0040
  JSL push_sound_queue                      ; $02A40A |/

CODE_02A40E:
  RTL                                       ; $02A40E |

CODE_02A40F:
  JSL $02A153                               ; $02A40F |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02A413 |
  CPY #$02                                  ; $02A415 |
  BCC CODE_02A43B                           ; $02A417 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02A419 |
  LSR A                                     ; $02A41B |
  BNE CODE_02A43B                           ; $02A41C |
  STZ !s_player_disable_flag                ; $02A41E |
  LDA !s_spr_x_player_delta,x               ; $02A421 |
  BEQ CODE_02A436                           ; $02A424 |
  ASL A                                     ; $02A426 |
  LDA #$FFFF                                ; $02A427 |
  BCS CODE_02A42F                           ; $02A42A |
  LDA #$0001                                ; $02A42C |

CODE_02A42F:
  CLC                                       ; $02A42F |
  ADC !s_player_x                           ; $02A430 |
  STA !s_player_x                           ; $02A433 |

CODE_02A436:
  LDA !s_spr_anim_frame,x                   ; $02A436 |
  BEQ CODE_02A43E                           ; $02A439 |

CODE_02A43B:
  LDA #$0007                                ; $02A43B |

CODE_02A43E:
  PHY                                       ; $02A43E |
  LDY $0C8C                                 ; $02A43F |
  BEQ CODE_02A447                           ; $02A442 |
  EOR #$0007                                ; $02A444 |

CODE_02A447:
  STA !s_spr_draw_priority,x                ; $02A447 |
  PLY                                       ; $02A44A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02A44B |
  CLC                                       ; $02A44D |
  ADC $A320,y                               ; $02A44E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02A451 |
  SEC                                       ; $02A453 |
  SBC $A328,y                               ; $02A454 |
  EOR $A320,y                               ; $02A457 |
  BMI CODE_02A4B4                           ; $02A45A |
  TYA                                       ; $02A45C |
  LSR A                                     ; $02A45D |
  LSR A                                     ; $02A45E |
  BCS CODE_02A47B                           ; $02A45F |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02A461 |
  SEC                                       ; $02A463 |
  SBC #$003F                                ; $02A464 |
  EOR #$FFFF                                ; $02A467 |
  SEC                                       ; $02A46A |
  ADC #$0040                                ; $02A46B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02A46E |
  LDA !s_spr_anim_frame,x                   ; $02A470 |
  EOR #$0001                                ; $02A473 |
  STA !s_spr_anim_frame,x                   ; $02A476 |
  BRA CODE_02A480                           ; $02A479 |

CODE_02A47B:
  LDA $A328,y                               ; $02A47B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02A47E |

CODE_02A480:
  INY                                       ; $02A480 |
  INY                                       ; $02A481 |
  CPY #$08                                  ; $02A482 |
  BCC CODE_02A4F0                           ; $02A484 |
  LDA #$0041                                ; $02A486 |\ play sound #$0041
  JSL push_sound_queue                      ; $02A489 |/
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02A48D |
  LSR A                                     ; $02A48F |
  BNE CODE_02A4E7                           ; $02A490 |
  LDA !s_player_form                        ; $02A492 |
  BEQ CODE_02A4A2                           ; $02A495 |
  STZ $0C8E                                 ; $02A497 |
  STZ !s_sprite_disable_flag                ; $02A49A |
  STZ $0C8C                                 ; $02A49D |
  BRA CODE_02A4E7                           ; $02A4A0 |

CODE_02A4A2:
  LDA !s_door_exit_type                     ; $02A4A2 |
  BEQ CODE_02A4B5                           ; $02A4A5 |
  STA !s_player_disable_flag                ; $02A4A7 |
  INC $0C8C                                 ; $02A4AA |
  LDA #$0001                                ; $02A4AD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02A4B0 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02A4B2 |

CODE_02A4B4:
  RTL                                       ; $02A4B4 |

CODE_02A4B5:
  LDA $608D                                 ; $02A4B5 |
  AND #$000F                                ; $02A4B8 |
  ASL A                                     ; $02A4BB |
  ASL A                                     ; $02A4BC |
  STA $0000                                 ; $02A4BD |
  LDA !s_player_y                           ; $02A4C0 |
  AND #$0F00                                ; $02A4C3 |
  LSR A                                     ; $02A4C6 |
  LSR A                                     ; $02A4C7 |
  ORA $0000                                 ; $02A4C8 |
  STA !r_cur_screen_exit                    ; $02A4CB |
  LDA #$0022                                ; $02A4CE |
  STA !r_apu_io_2_mirror                    ; $02A4D1 |
  LDA #$0001                                ; $02A4D4 |
  STA !r_level_load_type                    ; $02A4D7 |
  LDA #$000B                                ; $02A4DA |
  STA !r_game_mode                          ; $02A4DD |
  JSL $01B2B7                               ; $02A4E0 |
  LDX $12                                   ; $02A4E4 |
  RTL                                       ; $02A4E6 |

CODE_02A4E7:
  INC !s_spr_wildcard_4_lo_dp,x             ; $02A4E7 |
  LDA #$2005                                ; $02A4E9 |
  STA !s_spr_oam_1,x                        ; $02A4EC |
  RTL                                       ; $02A4EF |

CODE_02A4F0:
  TYA                                       ; $02A4F0 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02A4F1 |
  RTL                                       ; $02A4F3 |

  LDA #$01CD                                ; $02A4F4 |
  JSL spawn_ambient_sprite                  ; $02A4F7 |
  LDA !s_spr_x_pixel_pos,x                  ; $02A4FB |
  STA $70A2,y                               ; $02A4FE |
  LDA !s_spr_y_pixel_pos,x                  ; $02A501 |
  STA $7142,y                               ; $02A504 |
  LDA #$000B                                ; $02A507 |
  STA $7E4C,y                               ; $02A50A |
  STA $7E4E,y                               ; $02A50D |
  LDA #$0004                                ; $02A510 |
  STA $7782,y                               ; $02A513 |
  RTL                                       ; $02A516 |

init_teleport_sprite:
  RTL                                       ; $02A517 |

main_teleport_sprite:
  JSL $03AF23                               ; $02A518 |
  LDY !s_spr_collision_id,x                 ; $02A51C |
  BPL CODE_02A52B                           ; $02A51F |
  LDA !s_player_form                        ; $02A521 |
  BNE CODE_02A4B5                           ; $02A524 |
  LDA !s_baby_mario_state                   ; $02A526 |
  BMI CODE_02A4B5                           ; $02A529 |

CODE_02A52B:
  RTL                                       ; $02A52B |

init_goal:
  JSL $03AEBE                               ; $02A52C |
  STZ !s_spr_facing_dir,x                   ; $02A530 |
  LDA #$4010                                ; $02A533 |
  STA !gsu_r12                              ; $02A536 |
  LDA #$0054                                ; $02A539 |
  STA !gsu_r13                              ; $02A53C |
  LDY !s_spr_dyntile_index,x                ; $02A53F |
  TYX                                       ; $02A542 |
  LDA $03A9CE,x                             ; $02A543 |
  STA !gsu_r3                               ; $02A547 |
  LDA $03A9EE,x                             ; $02A54A |
  STA !gsu_r2                               ; $02A54E |
  LDA #$0099                                ; $02A551 |
  STA !gsu_r6                               ; $02A554 |
  LDA #$0008                                ; $02A557 |
  STA !gsu_r8                               ; $02A55A |
  STA !gsu_r9                               ; $02A55D |
  LDX #$08                                  ; $02A560 |
  LDA #$8619                                ; $02A562 |
  JSL r_gsu_init_1                          ; $02A565 | GSU init
  LDX $12                                   ; $02A569 |
  LDA #$60E0                                ; $02A56B |
  STA !gsu_r12                              ; $02A56E |
  LDA #$0055                                ; $02A571 |
  STA !gsu_r13                              ; $02A574 |
  LDY !s_spr_dyntile_index,x                ; $02A577 |
  TYX                                       ; $02A57A |
  LDA $03A9CE,x                             ; $02A57B |
  CLC                                       ; $02A57F |
  ADC #$0010                                ; $02A580 |
  STA !gsu_r3                               ; $02A583 |
  LDA $03A9EE,x                             ; $02A586 |
  STA !gsu_r2                               ; $02A58A |
  LDA #$0100                                ; $02A58D |
  STA !gsu_r6                               ; $02A590 |
  LDA #$0008                                ; $02A593 |
  STA !gsu_r8                               ; $02A596 |
  STA !gsu_r9                               ; $02A599 |
  LDX #$08                                  ; $02A59C |
  LDA #$8619                                ; $02A59E |
  JSL r_gsu_init_1                          ; $02A5A1 | GSU init
  LDX $12                                   ; $02A5A5 |
  LDA #$3040                                ; $02A5A7 |
  STA !gsu_r12                              ; $02A5AA |
  LDA #$0054                                ; $02A5AD |
  STA !gsu_r13                              ; $02A5B0 |
  LDY !s_spr_dyntile_index,x                ; $02A5B3 |
  TYX                                       ; $02A5B6 |
  LDA $03A9CE,x                             ; $02A5B7 |
  STA !gsu_r3                               ; $02A5BB |
  LDA $03A9EE,x                             ; $02A5BE |
  CLC                                       ; $02A5C2 |
  ADC #$0010                                ; $02A5C3 |
  STA !gsu_r2                               ; $02A5C6 |
  LDA #$0099                                ; $02A5C9 |
  STA !gsu_r6                               ; $02A5CC |
  LDA #$0008                                ; $02A5CF |
  STA !gsu_r8                               ; $02A5D2 |
  STA !gsu_r9                               ; $02A5D5 |
  LDX #$08                                  ; $02A5D8 |
  LDA #$8619                                ; $02A5DA |
  JSL r_gsu_init_1                          ; $02A5DD | GSU init
  INC $0CF9                                 ; $02A5E1 |
  LDX $12                                   ; $02A5E4 |
  LDA #$6000                                ; $02A5E6 | Time spent on end-level flower select
  STA !s_spr_gsu_morph_2_lo,x               ; $02A5E9 |
  RTL                                       ; $02A5EC |

  dw $0001                                  ; $02A5ED |
  dw $0002                                  ; $02A5EF |
  dw $0004                                  ; $02A5F1 |
  dw $0008                                  ; $02A5F3 |
  dw $0010                                  ; $02A5F5 |
  dw $0020                                  ; $02A5F7 |
  dw $0040                                  ; $02A5F9 |
  dw $0080                                  ; $02A5FB |
  dw $0100                                  ; $02A5FD |
  dw $0200                                  ; $02A5FF |

  dw $0000                                  ; $02A601 |
  dw $0200                                  ; $02A603 |
  dw $0280                                  ; $02A605 |
  dw $02A0                                  ; $02A607 |
  dw $02A8                                  ; $02A609 |
  dw $02AA                                  ; $02A60B |

goal_sounds:
  db $51, $52, $53, $54                     ; $02A60D |
  db $55, $56, $55, $54                     ; $02A611 |
  db $53, $52                               ; $02A615 |

main_goal:
  LDA !r_msg_box_state                      ; $02A617 |
  BNE CODE_02A663                           ; $02A61A |
  LDA $0B57                                 ; $02A61C |
  CMP #$0003                                ; $02A61F |
  BNE CODE_02A63F                           ; $02A622 |
  INC $0B57                                 ; $02A624 |
  INC $0B57                                 ; $02A627 |
  REP #$10                                  ; $02A62A |
  LDA #$0020                                ; $02A62C |
  JSL decompress_lc_lz1_l                   ; $02A62F |
  SEP #$10                                  ; $02A633 |
  LDA #$D800                                ; $02A635 |
  STA $0CF9                                 ; $02A638 |
  LDX $12                                   ; $02A63B |
  BRA CODE_02A663                           ; $02A63D |

CODE_02A63F:
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02A63F |
  TYA                                       ; $02A641 |
  EOR #$FFFF                                ; $02A642 |
  SEC                                       ; $02A645 |
  ADC #$000A                                ; $02A646 |
  STA $0B91,x                               ; $02A649 |
  STA !gsu_r7                               ; $02A64C |
  CMP !s_spr_wildcard_3_lo,x                ; $02A64F |
  BEQ CODE_02A65D                           ; $02A652 |
  STA !s_spr_wildcard_3_lo,x                ; $02A654 |
  LDA #$0002                                ; $02A657 |
  STA !s_spr_timer_4,x                      ; $02A65A |

CODE_02A65D:
  LDA !s_spr_timer_4,x                      ; $02A65D |
  STA $0B93,x                               ; $02A660 |

CODE_02A663:
  LDA $0B91,x                               ; $02A663 |
  STA !gsu_r7                               ; $02A666 |
  LDA $0B93,x                               ; $02A669 |
  STA $600C                                 ; $02A66C |
  LDA !s_spr_oam_pointer,x                  ; $02A66F |
  STA !gsu_r1                               ; $02A672 |
  LDA !s_spr_cam_x_pos,x                    ; $02A675 |
  CLC                                       ; $02A678 |
  ADC #$0018                                ; $02A679 |
  STA !gsu_r2                               ; $02A67C |
  LDA !s_spr_cam_y_pos,x                    ; $02A67F |
  SEC                                       ; $02A682 |
  SBC #$0040                                ; $02A683 |
  STA !gsu_r3                               ; $02A686 |
  LDA #$3000                                ; $02A689 |
  STA !gsu_r6                               ; $02A68C |
  LDA !s_spr_wildcard_2_lo,x                ; $02A68F |
  STA !gsu_r8                               ; $02A692 |
  LDA !r_flowers_amount                     ; $02A695 |
  ASL A                                     ; $02A698 |
  TAY                                       ; $02A699 |
  LDA $A601,y                               ; $02A69A |
  STA !gsu_r9                               ; $02A69D |
  LDA !s_spr_dyntile_index,x                ; $02A6A0 |
  TAX                                       ; $02A6A3 |
  LDA $03AA0E,x                             ; $02A6A4 |
  STA !gsu_r4                               ; $02A6A8 |
  LDX #$08                                  ; $02A6AB |
  LDA #$E1BE                                ; $02A6AD |
  JSL r_gsu_init_1                          ; $02A6B0 | GSU init
  LDX $12                                   ; $02A6B4 |
  LDA !r_msg_box_state                      ; $02A6B6 |
  BEQ CODE_02A6BE                           ; $02A6B9 |
  JMP CODE_02A761                           ; $02A6BB |

CODE_02A6BE:
  LDA $6002                                 ; $02A6BE |
  STA !gsu_r6                               ; $02A6C1 |
  LDA $6004                                 ; $02A6C4 |
  STA !gsu_r12                              ; $02A6C7 |
  LDA #$0054                                ; $02A6CA |
  STA !gsu_r13                              ; $02A6CD |
  LDY !s_spr_dyntile_index,x                ; $02A6D0 |
  TYX                                       ; $02A6D3 |
  LDA $03A9CE,x                             ; $02A6D4 |
  CLC                                       ; $02A6D8 |
  ADC #$0020                                ; $02A6D9 |
  STA !gsu_r3                               ; $02A6DC |
  LDA $600A                                 ; $02A6DF |
  BMI CODE_02A6FF                           ; $02A6E2 |
  LDA $03A9EE,x                             ; $02A6E4 |
  STA !gsu_r2                               ; $02A6E8 |
  LDA #$0010                                ; $02A6EB |
  STA !gsu_r8                               ; $02A6EE |
  STA !gsu_r9                               ; $02A6F1 |
  LDX #$08                                  ; $02A6F4 |
  LDA #$8293                                ; $02A6F6 |
  JSL r_gsu_init_1                          ; $02A6F9 | GSU init
  BRA CODE_02A71C                           ; $02A6FD |

CODE_02A6FF:
  LDA $03A9EE,x                             ; $02A6FF |
  CLC                                       ; $02A703 |
  ADC #$0010                                ; $02A704 |
  STA !gsu_r2                               ; $02A707 |
  LDA #$0008                                ; $02A70A |
  STA !gsu_r8                               ; $02A70D |
  STA !gsu_r9                               ; $02A710 |
  LDX #$08                                  ; $02A713 |
  LDA #$8619                                ; $02A715 |
  JSL r_gsu_init_1                          ; $02A718 | GSU init

CODE_02A71C:
  LDX $12                                   ; $02A71C |
  LDA $6008                                 ; $02A71E |
  STA !gsu_r12                              ; $02A721 |
  LDA #$0054                                ; $02A724 |
  STA !gsu_r13                              ; $02A727 |
  LDY !s_spr_dyntile_index,x                ; $02A72A |
  TYX                                       ; $02A72D |
  LDA $03A9CE,x                             ; $02A72E |
  CLC                                       ; $02A732 |
  ADC #$0010                                ; $02A733 |
  STA !gsu_r3                               ; $02A736 |
  LDA $03A9EE,x                             ; $02A739 |
  CLC                                       ; $02A73D |
  ADC #$0010                                ; $02A73E |
  STA !gsu_r2                               ; $02A741 |
  LDA $6006                                 ; $02A744 |
  STA !gsu_r6                               ; $02A747 |
  LDA #$0008                                ; $02A74A |
  STA !gsu_r8                               ; $02A74D |
  STA !gsu_r9                               ; $02A750 |
  LDX #$08                                  ; $02A753 |
  LDA #$8619                                ; $02A755 |
  JSL r_gsu_init_1                          ; $02A758 | GSU init
  INC $0CF9                                 ; $02A75C |
  LDX $12                                   ; $02A75F |

CODE_02A761:
  JSL $03AF23                               ; $02A761 |
  LDA $0B57                                 ; $02A765 |
  BNE CODE_02A786                           ; $02A768 |
  LDA !s_spr_cam_x_pos,x                    ; $02A76A |
  CLC                                       ; $02A76D |
  ADC #$0060                                ; $02A76E |
  CMP #$01C0                                ; $02A771 |
  BCS CODE_02A782                           ; $02A774 |
  LDA !s_spr_cam_y_pos,x                    ; $02A776 |
  CLC                                       ; $02A779 |
  ADC #$0060                                ; $02A77A |
  CMP #$01D0                                ; $02A77D |
  BCC CODE_02A786                           ; $02A780 |

CODE_02A782:
  JML $03A31E                               ; $02A782 |

CODE_02A786:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02A786 |
  ASL A                                     ; $02A788 |
  TXY                                       ; $02A789 |
  TAX                                       ; $02A78A |
  JSR ($A8E0,x)                             ; $02A78B | goal_ptr
  LDY !s_spr_gsu_morph_2_hi,x               ; $02A78E |
  TYA                                       ; $02A791 |
  STA $02                                   ; $02A792 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02A794 |
  STA $00                                   ; $02A796 |
  CLC                                       ; $02A798 |
  ADC $02                                   ; $02A799 |
  CMP #$0A00                                ; $02A79B |
  BCC CODE_02A7A3                           ; $02A79E |
  SBC #$0A00                                ; $02A7A0 |

CODE_02A7A3:
  STA !s_spr_wildcard_6_lo_dp,x             ; $02A7A3 |
  ORA #$00FF                                ; $02A7A5 |
  SEC                                       ; $02A7A8 |
  SBC $00                                   ; $02A7A9 |
  AND #$FF00                                ; $02A7AB |
  BEQ CODE_02A7BE                           ; $02A7AE |
  LDA $0B57                                 ; $02A7B0 |
  BEQ CODE_02A7BE                           ; $02A7B3 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02A7B5 |
  LDA $A60D,y                               ; $02A7B7 | goal_sounds
  JSL push_sound_queue                      ; $02A7BA |

CODE_02A7BE:
  LDY !s_spr_wildcard_1_lo,x                ; $02A7BE |
  BNE CODE_02A7C4                           ; $02A7C1 |

CODE_02A7C3:
  RTL                                       ; $02A7C3 |

CODE_02A7C4:
  CPY #$0B                                  ; $02A7C4 |
  BCS CODE_02A7C3                           ; $02A7C6 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02A7C8 |
  BEQ CODE_02A83F                           ; $02A7CB |
  SEC                                       ; $02A7CD |
  SBC #$0046                                ; $02A7CE | Decrement timer for flower select. Initialized at 02A5E6
  BCC CODE_02A7ED                           ; $02A7D1 | If below 0, branch.
  CMP #$0300                                ; $02A7D3 |
  BCS CODE_02A7F0                           ; $02A7D6 |
  LDY !r_cur_stage                          ; $02A7D8 |
  CPY #$08                                  ; $02A7DB |
  BNE CODE_02A7F0                           ; $02A7DD |
  REP #$10                                  ; $02A7DF |
  LDY $6000                                 ; $02A7E1 |
  SEP #$10                                  ; $02A7E4 |
  BEQ CODE_02A7ED                           ; $02A7E6 |
  LDA #$0300                                ; $02A7E8 |
  BRA CODE_02A7F0                           ; $02A7EB |

CODE_02A7ED:
  LDA #$0000                                ; $02A7ED | Timer went below 0, so force to 0.

CODE_02A7F0:
  STA !s_spr_gsu_morph_2_lo,x               ; $02A7F0 |
  CMP #$0000                                ; $02A7F3 |
  BNE CODE_02A7C3                           ; $02A7F6 | RTL unless flower select has stopped spinning at end level
  LDY !s_spr_gsu_morph_1_lo,x               ; $02A7F8 |
  LDA #$0040                                ; $02A7FB |
  STA $7541,y                               ; $02A7FE |
  LDA $79D5,y                               ; $02A801 |
  STA $721F,y                               ; $02A804 |
  LDA !s_spr_wildcard_5_hi,y                ; $02A807 |
  STA !s_spr_x_speed_hi,y                   ; $02A80A |
  LDA #$0060                                ; $02A80D |
  STA !s_spr_timer_2,x                      ; $02A810 |
  LDY #$2E                                  ; $02A813 | Set default end level sound (used after branch)
  LDA $6000                                 ; $02A815 | 2 if flower was landed on, 0 if nothing.
  BEQ CODE_02A838                           ; $02A818 |\ If a flower was landed on...
  DEC $0385                                 ; $02A81A || Set bonus game flag to FF (DEC from 0)
  LDA #$0024                                ; $02A81D || Loading bonus sprite and friends?
  STA !s_player_state                       ; $02A820 ||
  LDA #$0002                                ; $02A823 ||
  STA $617E                                 ; $02A826 ||
  LDA #$0030                                ; $02A829 ||
  STA !s_player_transform_misc              ; $02A82C ||
  LDA #$000F                                ; $02A82F ||
  JSL spawn_sprite_init                     ; $02A832 || Jump to spawn_sprite_init
  LDY #$08                                  ; $02A836 |/ Load bonus sound to replace default sound.

CODE_02A838:
  TYA                                       ; $02A838 | Sound to play has been stored in Y, so move to A
  JSL push_sound_queue                      ; $02A839 | Play sound
  BRA CODE_02A7C3                           ; $02A83D | RTL

CODE_02A83F:
  LDA !s_spr_timer_2,x                      ; $02A83F |
  BEQ CODE_02A845                           ; $02A842 |
  RTL                                       ; $02A844 |

CODE_02A845:
  LDA $0385                                 ; $02A845 |
  BMI CODE_02A853                           ; $02A848 |
  PHY                                       ; $02A84A |
  LDA #$0009                                ; $02A84B |\ play sound #$0009
  JSL push_sound_queue                      ; $02A84E |/
  PLY                                       ; $02A852 |

CODE_02A853:
  LDA #$0004                                ; $02A853 |
  STA !s_spr_timer_2,x                      ; $02A856 |
  TYA                                       ; $02A859 |
  CLC                                       ; $02A85A |
  ADC !s_spr_wildcard_6_hi_dp,x             ; $02A85B |
  AND #$00FF                                ; $02A85D |
  CMP #$000A                                ; $02A860 |
  BCC CODE_02A868                           ; $02A863 |
  SBC #$000A                                ; $02A865 |

CODE_02A868:
  ASL A                                     ; $02A868 |
  TAY                                       ; $02A869 |
  LDA !s_spr_wildcard_2_lo,x                ; $02A86A |
  ORA $A5ED,y                               ; $02A86D |
  STA !s_spr_wildcard_2_lo,x                ; $02A870 |
  TYA                                       ; $02A873 |
  ASL A                                     ; $02A874 |
  REP #$10                                  ; $02A875 |
  TAY                                       ; $02A877 |
  LDA $600E,y                               ; $02A878 |
  CLC                                       ; $02A87B |
  ADC !s_bg1_cam_x                          ; $02A87C |
  STA $0000                                 ; $02A87F |
  LDA $6010,y                               ; $02A882 |
  CLC                                       ; $02A885 |
  ADC !s_bg1_cam_y                          ; $02A886 |
  STA $0002                                 ; $02A889 |
  SEP #$10                                  ; $02A88C |
  INC !s_spr_wildcard_1_lo,x                ; $02A88E |
  LDY !s_spr_wildcard_1_lo,x                ; $02A891 |
  CPY #$0B                                  ; $02A894 |
  BCC CODE_02A8C0                           ; $02A896 |
  LDA $6000                                 ; $02A898 |
  BEQ CODE_02A8BD                           ; $02A89B |
  LDA #$01CD                                ; $02A89D |
  JSL spawn_ambient_sprite                  ; $02A8A0 |
  LDA $0000                                 ; $02A8A4 |
  STA $70A2,y                               ; $02A8A7 |
  LDA $0002                                 ; $02A8AA |
  STA $7142,y                               ; $02A8AD |
  LDA #$000B                                ; $02A8B0 |
  STA $7E4C,y                               ; $02A8B3 |
  LDA #$0004                                ; $02A8B6 |
  STA $7782,y                               ; $02A8B9 |
  RTL                                       ; $02A8BC |

CODE_02A8BD:
  INC $0385                                 ; $02A8BD |

CODE_02A8C0:
  LDA #$01E4                                ; $02A8C0 |
  JSL spawn_ambient_sprite                  ; $02A8C3 |
  LDA $0000                                 ; $02A8C7 |
  STA $70A2,y                               ; $02A8CA |
  LDA $0002                                 ; $02A8CD |
  STA $7142,y                               ; $02A8D0 |
  LDA #$000C                                ; $02A8D3 |
  STA $73C2,y                               ; $02A8D6 |
  LDA #$0008                                ; $02A8D9 |
  STA $7782,y                               ; $02A8DC |
  RTL                                       ; $02A8DF |

goal_ptr:
  dw $A8E8                                  ; $02A8E0 |
  dw $AA86                                  ; $02A8E2 |
  dw $AB65                                  ; $02A8E4 |
  dw $ABAA                                  ; $02A8E6 |

; goal_ptr sub
  TYX                                       ; $02A8E8 |
  LDA !s_spr_x_pixel_pos,x                  ; $02A8E9 |
  SEC                                       ; $02A8EC |
  SBC #$0080                                ; $02A8ED |
  CMP !r_bg1_cam_x                          ; $02A8F0 |
  BMI CODE_02A8F8                           ; $02A8F3 |
  LDA #$0EE0                                ; $02A8F5 |

CODE_02A8F8:
  CLC                                       ; $02A8F8 |
  ADC #$0020                                ; $02A8F9 |
  STA !s_cam_x_right_boundary               ; $02A8FC |
  LDA !s_player_x                           ; $02A8FF |
  SEC                                       ; $02A902 |
  SBC !s_spr_x_pixel_pos,x                  ; $02A903 |
  SEC                                       ; $02A906 |
  SBC #$0018                                ; $02A907 |
  PHA                                       ; $02A90A |
  EOR !s_spr_wildcard_5_lo_dp,x             ; $02A90B |
  ASL A                                     ; $02A90D |
  PLA                                       ; $02A90E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02A90F |
  BCC CODE_02A915                           ; $02A911 |
  BPL CODE_02A916                           ; $02A913 |

CODE_02A915:
  RTS                                       ; $02A915 |

CODE_02A916:
  LDA !s_baby_mario_state                   ; $02A916 |
  BPL CODE_02A915                           ; $02A919 |
  LDA !s_player_y                           ; $02A91B |
  SEC                                       ; $02A91E |
  SBC !s_spr_y_pixel_pos,x                  ; $02A91F |
  CLC                                       ; $02A922 |
  ADC #$0070                                ; $02A923 |
  CMP #$0050                                ; $02A926 |
  BCS CODE_02A915                           ; $02A929 |
  LDA #$0005                                ; $02A92B |
  STA !r_apu_io_0_mirror                    ; $02A92E |
  LDA #$003B                                ; $02A931 |\ play sound #$003B
  JSL push_sound_queue                      ; $02A934 |/
  INC !s_spr_wildcard_1_lo,x                ; $02A938 |
  INC !r_game_mode                          ; $02A93B |
  INC $0B57                                 ; $02A93E |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02A941 |
  LDA #$0014                                ; $02A943 |
  STA !s_player_state                       ; $02A946 |
  LDA #$0006                                ; $02A949 |
  STA !s_egg_throw_state                    ; $02A94C |
  STZ !s_egg_cursor_enable_flag             ; $02A94F |
  STZ !s_player_direction                   ; $02A952 |
  STZ !s_egg_cursor_locked_flag             ; $02A955 |
  STZ !s_egg_cursor_radius                  ; $02A958 |
  STZ !s_player_ground_pound_state          ; $02A95B |
  STZ $60D8                                 ; $02A95E |
  STZ !r_cur_autoscr                        ; $02A961 |
  STZ !r_autoscr_y_active                   ; $02A964 |
  LDA #$0001                                ; $02A967 |
  STA !r_autoscr_x_active                   ; $02A96A |
  LDA !r_bg1_cam_x                          ; $02A96D |
  STA $0C23                                 ; $02A970 |
  LDA !s_spr_x_pixel_pos,x                  ; $02A973 |
  SEC                                       ; $02A976 |
  SBC #$0010                                ; $02A977 |
  STA !s_cam_x_right_boundary               ; $02A97A |
  JSL $02A98E                               ; $02A97D |
  RTS                                       ; $02A981 |

  LDA #$00F0                                ; $02A982 |
  STA !r_apu_io_0_mirror                    ; $02A985 |
  INC $0B59                                 ; $02A988 |
  INC $0B7B                                 ; $02A98B |
  JSL $04F74D                               ; $02A98E | entry
  LDX !s_cur_egg_inv_size                   ; $02A992 |

CODE_02A995:
  DEX                                       ; $02A995 |
  DEX                                       ; $02A996 |
  BMI CODE_02A9AE                           ; $02A997 |
  STX $0E                                   ; $02A999 |
  LDY !s_cur_egg_inv_slots,x                ; $02A99B |
  LDA !s_spr_id,y                           ; $02A99E |
  SEC                                       ; $02A9A1 |
  SBC #$0022                                ; $02A9A2 |
  ASL A                                     ; $02A9A5 |
  TAX                                       ; $02A9A6 |
  JSR ($A9B7,x)                             ; $02A9A7 |
  LDX $0E                                   ; $02A9AA |
  BRA CODE_02A995                           ; $02A9AC |

CODE_02A9AE:
  LDX $12                                   ; $02A9AE |
  LDA #$FFFF                                ; $02A9B0 |
  JML $0294B7                               ; $02A9B3 |

; pointer table
  dw $A9CB                                  ; $02A9B7 |
  dw $A981                                  ; $02A9B9 | RTS
  dw $A981                                  ; $02A9BB | RTS
  dw $A981                                  ; $02A9BD | RTS
  dw $AA36                                  ; $02A9BF |
  dw $AA20                                  ; $02A9C1 |
  dw $AA2A                                  ; $02A9C3 |
  dw $A981                                  ; $02A9C5 | RTS
  dw $AA36                                  ; $02A9C7 |
  dw $AA36                                  ; $02A9C9 |

; $A9B7 table pointer
  TYX                                       ; $02A9CB |
  LDA !s_spr_x_pixel_pos,x                  ; $02A9CC |
  STA $0000                                 ; $02A9CF |
  LDA !s_spr_y_pixel_pos,x                  ; $02A9D2 |
  STA $0002                                 ; $02A9D5 |
  LDA !s_spr_oam_yxppccct,x                 ; $02A9D8 |
  STA $0004                                 ; $02A9DB |
  PHX                                       ; $02A9DE |
  JSL $04F88E                               ; $02A9DF |
  PLX                                       ; $02A9E3 |
  LDA #$0006                                ; $02A9E4 |

CODE_02A9E7:
  PHA                                       ; $02A9E7 |
  JSL $03BF87                               ; $02A9E8 |
  LDA #$0115                                ; $02A9EC |
  TXY                                       ; $02A9EF |
  JSL $03A377                               ; $02A9F0 |
  PLA                                       ; $02A9F4 |
  EOR !s_spr_oam_yxppccct,x                 ; $02A9F5 |
  STA !s_spr_oam_yxppccct,x                 ; $02A9F8 |
  LDA #$0030                                ; $02A9FB |
  STA !s_spr_timer_1,x                      ; $02A9FE |
  STA !s_spr_timer_2,x                      ; $02AA01 |
  STA !s_spr_timer_3,x                      ; $02AA04 |
  STA !s_spr_wildcard_6_lo,x                ; $02AA07 |
  LDA #$FE80                                ; $02AA0A |
  STA !s_spr_y_speed_lo,x                   ; $02AA0D |
  LDA #$0008                                ; $02AA10 |
  STA !s_spr_y_accel,x                      ; $02AA13 |
  LDA !s_spr_bitwise_settings_3,x           ; $02AA16 |
  AND #$FFE0                                ; $02AA19 |
  STA !s_spr_bitwise_settings_3,x           ; $02AA1C |
  RTS                                       ; $02AA1F |

; $A9B7 table pointer
  TYX                                       ; $02AA20 |

CODE_02AA21:
  JSL $02A4F4                               ; $02AA21 |
  LDA #$0000                                ; $02AA25 |
  BRA CODE_02A9E7                           ; $02AA28 |

; $A9B7 table pointer
  TYX                                       ; $02AA2A |
  JSL $03BF87                               ; $02AA2B |
  LDA #$FB00                                ; $02AA2F |
  STA !s_spr_y_speed_lo,x                   ; $02AA32 |
  RTS                                       ; $02AA35 |

; $A9B7 table pointer
  TYX                                       ; $02AA36 |
  LDA !s_spr_y_pixel_pos,x                  ; $02AA37 |
  STA $00                                   ; $02AA3A |
  LDA #$0003                                ; $02AA3C |
  STA $02                                   ; $02AA3F |

CODE_02AA41:
  LDA #$0115                                ; $02AA41 |
  JSL spawn_sprite_active                   ; $02AA44 |
  BCC CODE_02AA21                           ; $02AA48 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AA4A |
  STA !s_spr_x_pixel_pos,y                  ; $02AA4D |
  LDA $00                                   ; $02AA50 |
  SEC                                       ; $02AA52 |
  SBC #$0010                                ; $02AA53 |
  STA !s_spr_y_pixel_pos,y                  ; $02AA56 |
  STA $00                                   ; $02AA59 |
  LDA #$0030                                ; $02AA5B |
  STA !s_spr_timer_1,y                      ; $02AA5E |
  STA !s_spr_timer_2,y                      ; $02AA61 |
  STA !s_spr_timer_3,y                      ; $02AA64 |
  STA !s_spr_wildcard_6_lo,y                ; $02AA67 |
  LDA #$FE80                                ; $02AA6A |
  STA !s_spr_y_speed_lo,y                   ; $02AA6D |
  LDA #$0008                                ; $02AA70 |
  STA !s_spr_y_accel,y                      ; $02AA73 |
  LDA !s_spr_bitwise_settings_3,y           ; $02AA76 |
  AND #$FFE0                                ; $02AA79 |
  STA !s_spr_bitwise_settings_3,y           ; $02AA7C |
  DEC $02                                   ; $02AA7F |
  BNE CODE_02AA41                           ; $02AA81 |
  JMP CODE_02AA21                           ; $02AA83 |

; goal_ptr sub
  TYX                                       ; $02AA86 |
  LDA !s_egg_throw_state                    ; $02AA87 |
  BNE CODE_02AB09                           ; $02AA8A |
  LDA #$0002                                ; $02AA8C |
  STA !s_player_state                       ; $02AA8F |
  STZ $617A                                 ; $02AA92 |
  STZ $617C                                 ; $02AA95 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02AA98 |
  LDA #$0054                                ; $02AA9A |
  STA !s_spr_timer_1,x                      ; $02AA9D |
  LDY #$04                                  ; $02AAA0 |
  LDA #$008C                                ; $02AAA2 |
  JSL $03A34E                               ; $02AAA5 |
  TYA                                       ; $02AAA9 |
  INC A                                     ; $02AAAA |
  STA !s_spr_gsu_morph_1_lo,x               ; $02AAAB |
  LDA !s_player_x                           ; $02AAAE |
  STA !s_spr_x_pixel_pos,y                  ; $02AAB1 |
  LDA !s_player_y                           ; $02AAB4 |
  CLC                                       ; $02AAB7 |
  ADC #$0008                                ; $02AAB8 |
  STA !s_spr_y_pixel_pos,y                  ; $02AABB |
  LDA #$0002                                ; $02AABE |
  STA !s_spr_facing_dir,y                   ; $02AAC1 |
  LDA !s_player_x_speed_prev                ; $02AAC4 |
  STA !s_spr_wildcard_5_lo,y                ; $02AAC7 |
  LDA !s_player_y_speed                     ; $02AACA |
  STA !s_spr_wildcard_6_lo,y                ; $02AACD |
  LDA !r_yoshi_color                        ; $02AAD0 |
  ASL A                                     ; $02AAD3 |
  TAX                                       ; $02AAD4 |
  JSR CODE_02AC4F                           ; $02AAD5 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AAD8 |
  CLC                                       ; $02AADB |
  ADC #$0144                                ; $02AADC |
  STA !s_player_x                           ; $02AADF |
  LDA !s_spr_y_pixel_pos,x                  ; $02AAE2 |
  SEC                                       ; $02AAE5 |
  SBC #$0010                                ; $02AAE6 |
  STA !s_player_y                           ; $02AAE9 |
  STZ !s_player_x_speed                     ; $02AAEC |
  STZ !s_player_jump_state                  ; $02AAEF |
  STZ $6162                                 ; $02AAF2 |
  STZ !s_tongued_sprite_slot                ; $02AAF5 |
  LDX !r_cur_stage                          ; $02AAF8 |\
  LDA.l yoshi_level_colors+1,x              ; $02AAFB | | index into next
  AND #$00FF                                ; $02AAFF | | yoshi color in tables
  STA !r_yoshi_color                        ; $02AB02 |/
  LDX $12                                   ; $02AB05 |
  BRA CODE_02AB56                           ; $02AB07 |

CODE_02AB09:
  CMP #$0002                                ; $02AB09 |
  BNE CODE_02AB56                           ; $02AB0C |
  LDA #$004A                                ; $02AB0E |\ play sound #$004A
  JSL push_sound_queue                      ; $02AB11 |/
  LDA #$0010                                ; $02AB15 |
  STA !s_spr_state                          ; $02AB18 |
  LDY #$00                                  ; $02AB1B |
  STY $7862                                 ; $02AB1D |
  LDA !s_baby_mario_state                   ; $02AB20 |
  AND #$0FFF                                ; $02AB23 |
  STA !s_baby_mario_state                   ; $02AB26 |
  STZ $76                                   ; $02AB29 |
  LDA !s_player_y                           ; $02AB2B |
  SEC                                       ; $02AB2E |
  SBC !s_spr_y_pixel_pos,x                  ; $02AB2F |
  ASL A                                     ; $02AB32 |
  ADC #$0200                                ; $02AB33 |
  STA !s_spr_x_speed_lo                     ; $02AB36 |
  LDA #$FD40                                ; $02AB39 |
  STA !s_spr_y_speed_lo                     ; $02AB3C |
  LDA #$0010                                ; $02AB3F |
  STA !s_spr_y_accel                        ; $02AB42 |
  LDA #$0010                                ; $02AB45 |
  STA !s_spr_timer_4                        ; $02AB48 |
  STZ $16                                   ; $02AB4B |
  STZ !s_spr_wildcard_2_lo                  ; $02AB4D |
  LDA #$FFFF                                ; $02AB50 |
  STA $7E48                                 ; $02AB53 |

CODE_02AB56:
  LDA $0C23                                 ; $02AB56 |
  CMP !s_cam_x_right_boundary               ; $02AB59 |
  BCS CODE_02AB64                           ; $02AB5C |
  ADC #$0002                                ; $02AB5E |
  STA $0C23                                 ; $02AB61 |

CODE_02AB64:
  RTS                                       ; $02AB64 |

; goal_ptr sub
  TYX                                       ; $02AB65 |
  LDA !s_spr_timer_1,x                      ; $02AB66 |
  BNE CODE_02AB78                           ; $02AB69 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02AB6B |
  LDA #$0180                                ; $02AB6D |
  STA !s_spr_timer_1,x                      ; $02AB70 |
  STZ $617A                                 ; $02AB73 |
  BRA CODE_02AB91                           ; $02AB76 |

CODE_02AB78:
  CMP #$0050                                ; $02AB78 |
  BNE CODE_02AB86                           ; $02AB7B |
  LDA #$000E                                ; $02AB7D |
  JSL spawn_sprite_init                     ; $02AB80 |
  BRA CODE_02AB91                           ; $02AB84 |

CODE_02AB86:
  CMP #$0040                                ; $02AB86 |
  BCS CODE_02AB91                           ; $02AB89 |
  LDA #$0200                                ; $02AB8B |
  STA $617A                                 ; $02AB8E |

CODE_02AB91:
  LDA !s_spr_timer_3,x                      ; $02AB91 |
  BNE CODE_02ABA7                           ; $02AB94 |
  LDA #$0008                                ; $02AB96 |
  STA !s_spr_timer_3,x                      ; $02AB99 |
  LDA #$0808                                ; $02AB9C |
  LDX #$00                                  ; $02AB9F |
  JSL $029BD9                               ; $02ABA1 |
  LDX $12                                   ; $02ABA5 |

CODE_02ABA7:
  JMP CODE_02AB56                           ; $02ABA7 |

; goal_ptr sub
  TYX                                       ; $02ABAA |
  LDA !s_baby_mario_state                   ; $02ABAB |
  BMI CODE_02ABF8                           ; $02ABAE |
  LDA $14                                   ; $02ABB0 |
  AND #$0003                                ; $02ABB2 |
  BNE CODE_02ABEA                           ; $02ABB5 |
  LDA #$01DF                                ; $02ABB7 |
  JSL spawn_ambient_sprite                  ; $02ABBA |
  LDA !s_player_x                           ; $02ABBE |
  CLC                                       ; $02ABC1 |
  ADC #$0006                                ; $02ABC2 |
  STA $70A2,y                               ; $02ABC5 |
  LDA !s_player_y                           ; $02ABC8 |
  CLC                                       ; $02ABCB |
  ADC #$0018                                ; $02ABCC |
  STA $7142,y                               ; $02ABCF |
  LDA #$0080                                ; $02ABD2 |
  STA $71E0,y                               ; $02ABD5 |
  LDA #$FFF0                                ; $02ABD8 |
  STA $71E2,y                               ; $02ABDB |
  LDA #$0003                                ; $02ABDE |
  STA $7E4C,y                               ; $02ABE1 |
  LDA #$0004                                ; $02ABE4 |
  STA $7782,y                               ; $02ABE7 |

CODE_02ABEA:
  LDA #$004C                                ; $02ABEA |
  STA !s_player_cur_anim_frame              ; $02ABED |
  LDA #$0180                                ; $02ABF0 | Keep resetting this timer until mario lands on yoshi.
  STA !s_spr_timer_1,x                      ; $02ABF3 | This value is decremented each loop, and yoshi exits screen when it is 0.
  BRA CODE_02AB91                           ; $02ABF6 |

CODE_02ABF8:
  LDA !s_spr_timer_1,x                      ; $02ABF8 |
  LSR A                                     ; $02ABFB |
  BNE CODE_02AC4E                           ; $02ABFC |
  BCC CODE_02AC07                           ; $02ABFE |
  LDA #$0006                                ; $02AC00 |
  STA $00004D                               ; $02AC03 |

CODE_02AC07:
  STZ !s_player_direction                   ; $02AC07 |
  LDA #$0100                                ; $02AC0A |
  STA $617A                                 ; $02AC0D |
  STZ !r_autoscr_x_active                   ; $02AC10 |
  LDA #$0030                                ; $02AC13 |
  STA !s_cam_x_window_min                   ; $02AC16 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AC19 |
  CLC                                       ; $02AC1C |
  ADC #$0060                                ; $02AC1D |
  STA !s_cam_x_right_boundary               ; $02AC20 |
  LDA !s_player_x_speed                     ; $02AC23 |
  CMP #$0180                                ; $02AC26 |
  BMI CODE_02AC31                           ; $02AC29 |
  LDA #$0180                                ; $02AC2B |
  STA !s_player_x_speed                     ; $02AC2E |

CODE_02AC31:
  LDA !s_player_x_cam_rel                   ; $02AC31 |
  CMP #$00F0                                ; $02AC34 |
  BMI CODE_02AC4E                           ; $02AC37 |
  INC $0B57                                 ; $02AC39 |
  INC $0B57                                 ; $02AC3C |
  LDY !s_spr_gsu_morph_1_lo,x               ; $02AC3F |
  DEY                                       ; $02AC42 |
  TYX                                       ; $02AC43 |
  JSL $03A31E                               ; $02AC44 |
  LDX $12                                   ; $02AC48 |
  JSL $03A31E                               ; $02AC4A |

CODE_02AC4E:
  RTS                                       ; $02AC4E |

; goal sub
CODE_02AC4F:
  REP #$10                                  ; $02AC4F |
  PHB                                       ; $02AC51 |
  PEA $7020                                 ; $02AC52 |
  PLB                                       ; $02AC55 |
  PLB                                       ; $02AC56 |
  LDA $04FB23,x                             ; $02AC57 |
  TAX                                       ; $02AC5B |
  LDY #$001C                                ; $02AC5C |

CODE_02AC5F:
  LDA $5FA000,x                             ; $02AC5F |
  STA $21E2,y                               ; $02AC63 |
  STA $2F4E,y                               ; $02AC66 |
  DEX                                       ; $02AC69 |
  DEX                                       ; $02AC6A |
  DEY                                       ; $02AC6B |
  DEY                                       ; $02AC6C |
  BPL CODE_02AC5F                           ; $02AC6D |
  PLB                                       ; $02AC6F |
  SEP #$10                                  ; $02AC70 |
  LDX $12                                   ; $02AC72 |
  RTS                                       ; $02AC74 |

init_yoshi_at_goal:
  JSL $03AD74                               ; $02AC75 |
  BCS CODE_02AC9D                           ; $02AC79 |

CODE_02AC7B:
  LDA #$0002                                ; $02AC7B |
  STA !s_spr_state,x                        ; $02AC7E |
  RTL                                       ; $02AC81 |

  dw $6080, $60A0                           ; $02AC82 |

main_yoshi_at_goal:
  LDA !r_yoshi_color                        ; $02AC86 |
  ASL A                                     ; $02AC89 |
  STA $6116                                 ; $02AC8A |
  JSL $04FB41                               ; $02AC8D |
  JSL $03AA52                               ; $02AC91 |
  JSL $03AF23                               ; $02AC95 |
  JSL $03A590                               ; $02AC99 |

CODE_02AC9D:
  LDY #$00                                  ; $02AC9D |
  LDA $7860,x                               ; $02AC9F |
  AND #$0001                                ; $02ACA2 |
  BEQ CODE_02ACBD                           ; $02ACA5 |
  STZ !s_spr_x_speed_lo,x                   ; $02ACA7 |
  LDY #$02                                  ; $02ACAA |
  LDA !s_spr_timer_1,x                      ; $02ACAC |
  BNE CODE_02ACBD                           ; $02ACAF |
  LDA #$FD80                                ; $02ACB1 |
  STA !s_spr_y_speed_lo,x                   ; $02ACB4 |
  LDA #$0018                                ; $02ACB7 |
  STA !s_spr_timer_1,x                      ; $02ACBA |

CODE_02ACBD:
  TYA                                       ; $02ACBD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02ACBE |
  LDA $AC82,y                               ; $02ACC0 |
  STA !gsu_r12                              ; $02ACC3 |
  LDA #$0055                                ; $02ACC6 |
  STA !gsu_r13                              ; $02ACC9 |
  LDY !s_spr_dyntile_index,x                ; $02ACCC |
  TYX                                       ; $02ACCF |
  LDA $03A9CE,x                             ; $02ACD0 |
  STA !gsu_r3                               ; $02ACD4 |
  LDA $03A9EE,x                             ; $02ACD7 |
  STA !gsu_r2                               ; $02ACDB |
  LDA #$0100                                ; $02ACDE |
  STA !gsu_r6                               ; $02ACE1 |
  LDA #$0010                                ; $02ACE4 |
  STA !gsu_r8                               ; $02ACE7 |
  STA !gsu_r9                               ; $02ACEA |
  LDX #$08                                  ; $02ACED |
  LDA #$8293                                ; $02ACEF |
  JSL r_gsu_init_1                          ; $02ACF2 | GSU init
  INC $0CF9                                 ; $02ACF6 |
  LDX $12                                   ; $02ACF9 |
  RTL                                       ; $02ACFB |

init_star_item:
  LDA !s_spr_y_pixel_pos,x                  ; $02ACFC |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02ACFF |
  LDA #$FD80                                ; $02AD01 |
  STA !s_spr_y_speed_lo,x                   ; $02AD04 |
  RTL                                       ; $02AD07 |

  db $88, $00                               ; $02AD08 |

main_star_item:
  JSL $03AF23                               ; $02AD0A |
  JSL $03D127                               ; $02AD0E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02AD12 |
  BNE CODE_02AD57                           ; $02AD14 |
  LDA !s_spr_y_speed_lo,x                   ; $02AD16 |
  BMI CODE_02AD57                           ; $02AD19 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02AD1B |
  LDA !r_stars_amount                       ; $02AD1D |
  CMP #$012C                                ; $02AD20 |
  BCS CODE_02AD48                           ; $02AD23 |
  LDA $10                                   ; $02AD25 |
  AND #$0007                                ; $02AD27 |
  BNE CODE_02AD48                           ; $02AD2A |
  LDA #$01A2                                ; $02AD2C |
  JSL spawn_sprite_init                     ; $02AD2F |
  BCC CODE_02AD8B                           ; $02AD33 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AD35 |
  STA !s_spr_x_pixel_pos,y                  ; $02AD38 |
  LDA !s_spr_y_pixel_pos,x                  ; $02AD3B |
  STA !s_spr_y_pixel_pos,y                  ; $02AD3E |
  LDA #$FD00                                ; $02AD41 |
  STA !s_spr_y_speed_lo,y                   ; $02AD44 |
  RTL                                       ; $02AD47 |

CODE_02AD48:
  LDA #$0004                                ; $02AD48 |
  JSL $03A4E9                               ; $02AD4B |
  LDA #$0009                                ; $02AD4F |\ play sound #$0009
  JSL push_sound_queue                      ; $02AD52 |/
  RTL                                       ; $02AD56 |

CODE_02AD57:
  LDA !s_spr_y_pixel_pos,x                  ; $02AD57 |
  SEC                                       ; $02AD5A |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $02AD5B |
  BMI CODE_02AD8B                           ; $02AD5D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02AD5F |
  LDA !s_spr_x_pixel_pos,x                  ; $02AD61 |
  STA $0091                                 ; $02AD64 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02AD67 |
  STA $0093                                 ; $02AD69 |
  STA !s_spr_y_pixel_pos,x                  ; $02AD6C |
  STZ !s_spr_y_speed_lo,x                   ; $02AD6F |
  STZ !s_spr_y_accel,x                      ; $02AD72 |
  LDA #$0001                                ; $02AD75 |
  STA $008F                                 ; $02AD78 |
  LDA #$8A00                                ; $02AD7B |
  STA $0095                                 ; $02AD7E |
  JSL $109295                               ; $02AD81 |
  LDX $12                                   ; $02AD85 |
  JML $03A31E                               ; $02AD87 |

CODE_02AD8B:
  RTL                                       ; $02AD8B |

  dw $FFF7, $0008                           ; $02AD8C |

init_grinder_runs_away:
  LDA #$0002                                ; $02AD90 |
  JSR CODE_02AE77                           ; $02AD93 |
  LDA $10                                   ; $02AD96 |
  AND #$0002                                ; $02AD98 |
  TAY                                       ; $02AD9B |
  JSR CODE_02ADC1                           ; $02AD9C |
  BCS CODE_02ADAB                           ; $02AD9F |
  TYA                                       ; $02ADA1 |
  EOR #$0002                                ; $02ADA2 |
  TAY                                       ; $02ADA5 |
  JSR CODE_02ADC1                           ; $02ADA6 |
  BCC CODE_02ADBC                           ; $02ADA9 |

CODE_02ADAB:
  TYA                                       ; $02ADAB |
  STA !s_spr_facing_dir,x                   ; $02ADAC |
  LDA !s_spr_x_pixel_pos,x                  ; $02ADAF |
  CLC                                       ; $02ADB2 |
  ADC $AD8C,y                               ; $02ADB3 |
  STA !s_spr_x_pixel_pos,x                  ; $02ADB6 |
  JSR CODE_02B348                           ; $02ADB9 |

CODE_02ADBC:
  RTL                                       ; $02ADBC |

  dw $FFFF, $0010                           ; $02ADBD |

CODE_02ADC1:
  LDA !s_spr_y_pixel_pos,x                  ; $02ADC1 |

CODE_02ADC4:
  STA !gsu_r0                               ; $02ADC4 |
  LDA !s_spr_x_pixel_pos,x                  ; $02ADC7 |
  CLC                                       ; $02ADCA |
  ADC $ADBD,y                               ; $02ADCB |
  STA !gsu_r8                               ; $02ADCE |
  PHY                                       ; $02ADD1 |
  LDX #$0A                                  ; $02ADD2 |
  LDA #$CE2F                                ; $02ADD4 |
  JSL r_gsu_init_3                          ; $02ADD7 | GSU init
  PLY                                       ; $02ADDB |
  LDX $12                                   ; $02ADDC |
  LDA !gsu_r7                               ; $02ADDE |
  AND #$0002                                ; $02ADE1 |
  BNE CODE_02ADF5                           ; $02ADE4 |
  LDA $300D                                 ; $02ADE6 |
  AND #$00FF                                ; $02ADE9 |
  SEC                                       ; $02ADEC |
  SBC #$0099                                ; $02ADED |
  LSR A                                     ; $02ADF0 |
  BEQ CODE_02ADF5                           ; $02ADF1 |
  CLC                                       ; $02ADF3 |
  RTS                                       ; $02ADF4 |

CODE_02ADF5:
  SEC                                       ; $02ADF5 |
  RTS                                       ; $02ADF6 |

init_grinder_spits_seeds:
  LDA #$0004                                ; $02ADF7 |
  JSR CODE_02AE77                           ; $02ADFA |

CODE_02ADFD:
  JSR CODE_02AEA0                           ; $02ADFD |
  BCS CODE_02AE06                           ; $02AE00 |
  JML $03A31E                               ; $02AE02 |

CODE_02AE06:
  RTL                                       ; $02AE06 |

init_grinder_spits_seeds_climbing:
  LDA #$000A                                ; $02AE07 |
  JSR CODE_02AE77                           ; $02AE0A |
  LDA !s_spr_bitwise_settings_3,x           ; $02AE0D |
  AND #$FFE0                                ; $02AE10 |
  STA !s_spr_bitwise_settings_3,x           ; $02AE13 |
  LDA !s_spr_oam_yxppccct,x                 ; $02AE16 |
  ORA #$0030                                ; $02AE19 |
  STA !s_spr_oam_yxppccct,x                 ; $02AE1C |
  LDA !s_spr_facing_dir,x                   ; $02AE1F |
  EOR #$0002                                ; $02AE22 |
  JSL $02AE3F                               ; $02AE25 |
  BRA CODE_02ADFD                           ; $02AE29 |

; the monkey that throws needlenoses
init_seedy_sally:
  LDA #$0006                                ; $02AE2B |
  JSR CODE_02AE77                           ; $02AE2E |
  LDA !s_spr_bitwise_settings_3,x           ; $02AE31 |
  AND #$FFE0                                ; $02AE34 |
  STA !s_spr_bitwise_settings_3,x           ; $02AE37 |
  LDA $10                                   ; $02AE3A |
  AND #$0002                                ; $02AE3C |
  TAY                                       ; $02AE3F |
  JSR CODE_02ADC1                           ; $02AE40 |
  BCS CODE_02AE61                           ; $02AE43 |
  LDA !gsu_r6                               ; $02AE45 |
  CMP #$3D3B                                ; $02AE48 |
  BEQ CODE_02AE61                           ; $02AE4B |
  CMP #$3D3C                                ; $02AE4D |
  BEQ CODE_02AE61                           ; $02AE50 |
  CMP #$3D49                                ; $02AE52 |
  BEQ CODE_02AE61                           ; $02AE55 |
  CMP #$3D4A                                ; $02AE57 |
  BEQ CODE_02AE61                           ; $02AE5A |
  TYA                                       ; $02AE5C |
  EOR #$0002                                ; $02AE5D |
  TAY                                       ; $02AE60 |

CODE_02AE61:
  TYA                                       ; $02AE61 |
  STA !s_spr_facing_dir,x                   ; $02AE62 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AE65 |
  CLC                                       ; $02AE68 |
  ADC $AD8C,y                               ; $02AE69 |
  STA !s_spr_x_pixel_pos,x                  ; $02AE6C |
  RTL                                       ; $02AE6F |

init_grinder_grabs_baby_mario:
  LDA #$0008                                ; $02AE70 |
  JSR CODE_02AE77                           ; $02AE73 |
  RTL                                       ; $02AE76 |

CODE_02AE77:
  LDY !s_spr_wildcard_1_lo,x                ; $02AE77 |
  BEQ CODE_02AE9C                           ; $02AE7A |
  PLA                                       ; $02AE7C |
  LDA !s_spr_oam_yxppccct,x                 ; $02AE7D |
  ORA #$0008                                ; $02AE80 |
  STA !s_spr_oam_yxppccct,x                 ; $02AE83 |
  SEP #$20                                  ; $02AE86 |
  LDA #$FF                                  ; $02AE88 |
  STA !s_spr_stage_id,x                     ; $02AE8A |
  REP #$20                                  ; $02AE8D |
  LDA #$0010                                ; $02AE8F |
  STA !s_spr_gsu_morph_2_lo,x               ; $02AE92 |
  LDA #$000C                                ; $02AE95 |
  JSR CODE_02B6B2                           ; $02AE98 |
  RTL                                       ; $02AE9B |

CODE_02AE9C:
  STA !s_spr_wildcard_1_lo,x                ; $02AE9C |
  RTS                                       ; $02AE9F |

CODE_02AEA0:
  LDA #$0007                                ; $02AEA0 |
  JSL spawn_sprite_active                   ; $02AEA3 |

CODE_02AEA7:
  BCC CODE_02AF10                           ; $02AEA7 |
  LDA !s_spr_x_pixel_pos,x                  ; $02AEA9 |
  STA !s_spr_x_pixel_pos,y                  ; $02AEAC |
  LDA !s_spr_y_pixel_pos,x                  ; $02AEAF |
  STA !s_spr_y_pixel_pos,y                  ; $02AEB2 |
  LDA !s_spr_draw_priority,x                ; $02AEB5 |
  AND #$0080                                ; $02AEB8 |
  ORA #$0005                                ; $02AEBB |
  STA !s_spr_draw_priority,y                ; $02AEBE |
  LDA !s_spr_oam_1,y                        ; $02AEC1 |
  AND #$FFF3                                ; $02AEC4 |
  STA !s_spr_oam_1,y                        ; $02AEC7 |
  LDA !s_spr_facing_dir,x                   ; $02AECA |
  STA !s_spr_facing_dir,y                   ; $02AECD |
  LDA !s_spr_oam_yxppccct,x                 ; $02AED0 |
  STA !s_spr_oam_yxppccct,y                 ; $02AED3 |
  TYA                                       ; $02AED6 |
  INC A                                     ; $02AED7 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02AED8 |
  LDA !s_spr_oam_1,x                        ; $02AEDA |
  AND #$FFF3                                ; $02AEDD |
  STA !s_spr_oam_1,x                        ; $02AEE0 |
  LDA !s_spr_id,y                           ; $02AEE3 |
  CMP #$0007                                ; $02AEE6 |
  BEQ CODE_02AEFA                           ; $02AEE9 |
  TXA                                       ; $02AEEB |
  STA !s_spr_wildcard_4_lo,y                ; $02AEEC |
  LDA #$0400                                ; $02AEEF |
  STA !s_spr_y_accel_ceiling,y              ; $02AEF2 |
  STA !s_spr_gsu_morph_2_lo,y               ; $02AEF5 |
  BRA CODE_02AF0F                           ; $02AEF8 |

CODE_02AEFA:
  TXA                                       ; $02AEFA |
  STA !s_spr_wildcard_4_lo,y                ; $02AEFB |
  LDA #$0001                                ; $02AEFE |
  STA !s_spr_anim_frame,y                   ; $02AF01 |
  TYX                                       ; $02AF04 |
  LDY #$64                                  ; $02AF05 |
  JSL $03C878                               ; $02AF07 |
  LDX $12                                   ; $02AF0B |
  REP #$20                                  ; $02AF0D |

CODE_02AF0F:
  SEC                                       ; $02AF0F |

CODE_02AF10:
  RTS                                       ; $02AF10 |

; all the monkeys
main_grinder_common:
  SEP #$20                                  ; $02AF11 |
  LDA !s_spr_bitwise_settings_3,x           ; $02AF13 |
  AND #$10                                  ; $02AF16 |
  STA $77C0,x                               ; $02AF18 |
  REP #$20                                  ; $02AF1B |
  LDA !s_spr_timer_frozen,x                 ; $02AF1D |
  BNE CODE_02AF3B                           ; $02AF20 |
  LDA !s_spr_state,x                        ; $02AF22 |
  CMP #$0010                                ; $02AF25 |
  BEQ CODE_02AF4A                           ; $02AF28 |
  CMP #$000E                                ; $02AF2A |
  BEQ CODE_02AF3B                           ; $02AF2D |
  LDA !s_spr_oam_yxppccct,x                 ; $02AF2F |
  AND #$00CF                                ; $02AF32 |
  ORA #$0020                                ; $02AF35 |
  STA !s_spr_oam_yxppccct,x                 ; $02AF38 |

CODE_02AF3B:
  JSR CODE_02B657                           ; $02AF3B |
  LDA !s_spr_bitwise_settings_3,x           ; $02AF3E |
  AND #$FFE0                                ; $02AF41 |
  ORA #$0018                                ; $02AF44 |
  STA !s_spr_bitwise_settings_3,x           ; $02AF47 |

CODE_02AF4A:
  LDA #$C200                                ; $02AF4A |
  LDY !s_spr_collision_state,x              ; $02AF4D |
  BEQ CODE_02AF68                           ; $02AF50 |
  LDY $7862,x                               ; $02AF52 |
  DEY                                       ; $02AF55 |
  BMI CODE_02AF5F                           ; $02AF56 |
  STZ !s_spr_collision_state,x              ; $02AF58 |
  JSL $02AE7D                               ; $02AF5B |

CODE_02AF5F:
  LDA #$0011                                ; $02AF5F |
  STA !s_spr_anim_frame,x                   ; $02AF62 |
  LDA #$C600                                ; $02AF65 |

CODE_02AF68:
  LDY !s_spr_timer_2,x                      ; $02AF68 |
  BEQ CODE_02AF70                           ; $02AF6B |
  LDA #$C000                                ; $02AF6D |

CODE_02AF70:
  STA !s_spr_bitwise_settings_1,x           ; $02AF70 |
  JSL $03AF23                               ; $02AF73 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02AF77 |
  JSR CODE_02B276                           ; $02AF79 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02AF7C |
  BEQ CODE_02AFC8                           ; $02AF7E |
  LDA #$FFC0                                ; $02AF80 |
  LDY $7862,x                               ; $02AF83 |
  DEY                                       ; $02AF86 |
  BPL CODE_02AF94                           ; $02AF87 |
  LDA $7860,x                               ; $02AF89 |
  AND #$0001                                ; $02AF8C |
  BNE CODE_02AFB4                           ; $02AF8F |
  LDA #$0100                                ; $02AF91 |

CODE_02AF94:
  STA !s_spr_y_accel_ceiling,x              ; $02AF94 |
  LDA !s_spr_y_speed_lo,x                   ; $02AF97 |
  CMP #$FFC0                                ; $02AF9A |
  BCC CODE_02AFA5                           ; $02AF9D |
  LDA #$0004                                ; $02AF9F |
  STA !s_spr_y_accel,x                      ; $02AFA2 |

CODE_02AFA5:
  LDA #$0000                                ; $02AFA5 |
  STA !s_spr_anim_frame,x                   ; $02AFA8 |
  TXY                                       ; $02AFAB |
  LDX !s_spr_wildcard_1_lo,y                ; $02AFAC |
  JSR ($B022,x)                             ; $02AFAF |
  BRA CODE_02AFEA                           ; $02AFB2 |

CODE_02AFB4:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02AFB4 |
  STZ !s_spr_x_accel_ceiling,x              ; $02AFB6 |
  STZ !s_spr_x_accel,x                      ; $02AFB9 |
  LDA #$0040                                ; $02AFBC |
  STA !s_spr_y_accel,x                      ; $02AFBF |
  LDA #$0400                                ; $02AFC2 |
  STA !s_spr_y_accel_ceiling,x              ; $02AFC5 |

CODE_02AFC8:
  TXY                                       ; $02AFC8 |
  LDX !s_spr_wildcard_1_lo,y                ; $02AFC9 |
  JSR ($B016,x)                             ; $02AFCC |
  LDY $7862,x                               ; $02AFCF |
  DEY                                       ; $02AFD2 |
  BMI CODE_02AFEA                           ; $02AFD3 |
  LDA $7860,x                               ; $02AFD5 |
  AND #$0001                                ; $02AFD8 |
  BNE CODE_02AFEA                           ; $02AFDB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02AFDD |
  LDA #$0100                                ; $02AFDF |
  CMP !s_spr_y_speed_lo,x                   ; $02AFE2 |
  BPL CODE_02AFEA                           ; $02AFE5 |
  STA !s_spr_y_speed_lo,x                   ; $02AFE7 |

CODE_02AFEA:
  JSR CODE_02B8C7                           ; $02AFEA |
  LDY $77C0,x                               ; $02AFED |
  BEQ CODE_02B00B                           ; $02AFF0 |
  LDA $7860,x                               ; $02AFF2 |
  AND #$0001                                ; $02AFF5 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02AFF8 |
  LDA !s_spr_y_speed_lo,x                   ; $02AFFB |
  BMI CODE_02B017                           ; $02AFFE |
  LDA !s_spr_oam_yxppccct,x                 ; $02B000 |
  AND #$00CF                                ; $02B003 |
  ORA #$0020                                ; $02B006 |
  BRA CODE_02B014                           ; $02B009 |

CODE_02B00B:
  STZ !s_spr_gsu_morph_1_lo,x               ; $02B00B |
  LDA !s_spr_oam_yxppccct,x                 ; $02B00E |
  ORA #$0030                                ; $02B011 |

CODE_02B014:
  STA !s_spr_oam_yxppccct,x                 ; $02B014 |

CODE_02B017:
  RTL                                       ; $02B017 |

  dw $B16B                                  ; $02B018 |
  dw $B476                                  ; $02B01A |
  dw $B996                                  ; $02B01C |
  dw $BA81                                  ; $02B01E |
  dw $BC66                                  ; $02B020 |

  dw $B05A                                  ; $02B022 |
  dw $BE02                                  ; $02B024 |
  dw $BE80                                  ; $02B026 |
  dw $BE87                                  ; $02B028 |
  dw $BE89                                  ; $02B02A |
  dw $BE87                                  ; $02B02C |
  dw $BEC9                                  ; $02B02E |

  db $02, $01, $02, $01, $00, $16, $15, $14 ; $02B030 |
  db $15, $14, $13, $14, $13, $12, $11      ; $02B038 |

  db $08, $08, $08, $08, $20, $06, $10, $04 ; $02B03F |
  db $04, $40, $04, $04, $04, $04, $04      ; $02B047 |

  dw $FFFE, $FFFE, $FFFD                    ; $02B04E |

  dw $0003, $0002, $0002                    ; $02B054 |

  TYX                                       ; $02B05A |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02B05B |
  BEQ CODE_02B098                           ; $02B05E |
  JSR CODE_02B2BF                           ; $02B060 |
  LDA !s_spr_timer_4,x                      ; $02B063 |
  BNE CODE_02B082                           ; $02B066 |
  DEC !s_spr_gsu_morph_2_lo,x               ; $02B068 |
  BEQ CODE_02B082                           ; $02B06B |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02B06D |
  LDA $B02F,y                               ; $02B070 |
  AND #$00FF                                ; $02B073 |
  STA !s_spr_anim_frame,x                   ; $02B076 |
  LDA $B03E,y                               ; $02B079 |
  AND #$00FF                                ; $02B07C |
  STA !s_spr_timer_4,x                      ; $02B07F |

CODE_02B082:
  LDA $7860,x                               ; $02B082 |
  AND #$0001                                ; $02B085 |
  BEQ CODE_02B093                           ; $02B088 |
  LDA !s_spr_x_speed_lo,x                   ; $02B08A |
  BEQ CODE_02B097                           ; $02B08D |
  JSL $03A590                               ; $02B08F |

CODE_02B093:
  JSL $02AE7D                               ; $02B093 |

CODE_02B097:
  RTS                                       ; $02B097 |

CODE_02B098:
  JSR CODE_02B6E4                           ; $02B098 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02B09B |
  BNE CODE_02B0D7                           ; $02B09D |
  JSR CODE_02B342                           ; $02B09F |
  LDA $7860,x                               ; $02B0A2 |
  AND #$0001                                ; $02B0A5 |
  BNE CODE_02B0AD                           ; $02B0A8 |
  JMP CODE_02B426                           ; $02B0AA |

CODE_02B0AD:
  LDA !s_spr_x_player_delta,x               ; $02B0AD |
  CLC                                       ; $02B0B0 |
  ADC #$0020                                ; $02B0B1 |
  CMP #$0041                                ; $02B0B4 |
  BCC CODE_02B0C8                           ; $02B0B7 |
  LDA !s_spr_x_player_dir,x                 ; $02B0B9 |
  EOR #$0002                                ; $02B0BC |
  AND #$00FF                                ; $02B0BF |
  STA !s_spr_facing_dir,x                   ; $02B0C2 |
  JMP CODE_02B3D9                           ; $02B0C5 |

CODE_02B0C8:
  LDA !s_spr_x_player_dir,x                 ; $02B0C8 |
  AND #$00FF                                ; $02B0CB |
  STA !s_spr_facing_dir,x                   ; $02B0CE |
  LDA #$FB00                                ; $02B0D1 |
  JMP CODE_02B423                           ; $02B0D4 |

CODE_02B0D7:
  DEY                                       ; $02B0D7 |
  BNE CODE_02B10F                           ; $02B0D8 |
  JSR CODE_02B316                           ; $02B0DA |
  BCC CODE_02B0E4                           ; $02B0DD |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02B0DF |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02B0E1 |
  RTS                                       ; $02B0E3 |

CODE_02B0E4:
  LDA !s_spr_timer_4,x                      ; $02B0E4 |
  BNE CODE_02B10A                           ; $02B0E7 |
  LDA #$0004                                ; $02B0E9 |
  STA !s_spr_timer_4,x                      ; $02B0EC |
  LDA !s_spr_anim_frame,x                   ; $02B0EF |
  INC A                                     ; $02B0F2 |
  CMP #$001A                                ; $02B0F3 |
  BCC CODE_02B0FB                           ; $02B0F6 |
  LDA #$0017                                ; $02B0F8 |

CODE_02B0FB:
  STA !s_spr_anim_frame,x                   ; $02B0FB |
  ASL A                                     ; $02B0FE |
  TAY                                       ; $02B0FF |
  LDA !s_spr_y_pixel_pos,x                  ; $02B100 |
  CLC                                       ; $02B103 |
  ADC $B020,y                               ; $02B104 |
  STA !s_spr_y_pixel_pos,x                  ; $02B107 |

CODE_02B10A:
  RTS                                       ; $02B10A |

  dw $0008, $0004                           ; $02B10B |

CODE_02B10F:
  JSR CODE_02B259                           ; $02B10F |
  BCS CODE_02B156                           ; $02B112 |
  LDA $00                                   ; $02B114 |
  CMP #$0020                                ; $02B116 |
  BCS CODE_02B156                           ; $02B119 |
  LDA #$0010                                ; $02B11B |
  STA !s_spr_timer_1,x                      ; $02B11E |
  LDY !s_spr_facing_dir,x                   ; $02B121 |
  LDA $7860,x                               ; $02B124 |
  AND $B10B,y                               ; $02B127 |
  BNE CODE_02B131                           ; $02B12A |
  LDA $10                                   ; $02B12C |
  LSR A                                     ; $02B12E |
  BCC CODE_02B138                           ; $02B12F |

CODE_02B131:
  TYA                                       ; $02B131 |
  EOR #$0002                                ; $02B132 |
  STA !s_spr_facing_dir,x                   ; $02B135 |

CODE_02B138:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02B138 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02B13A |

CODE_02B13D:
  LDA !s_spr_bitwise_settings_3,x           ; $02B13D |
  AND #$FFE0                                ; $02B140 |
  ORA #$0018                                ; $02B143 |
  STA !s_spr_bitwise_settings_3,x           ; $02B146 |
  LDA #$0040                                ; $02B149 |
  STA !s_spr_y_accel,x                      ; $02B14C |
  LDA #$0400                                ; $02B14F |
  STA !s_spr_y_accel_ceiling,x              ; $02B152 |
  RTS                                       ; $02B155 |

CODE_02B156:
  JSR CODE_02B316                           ; $02B156 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02B159 |
  AND #$0010                                ; $02B15B |
  BEQ CODE_02B163                           ; $02B15E |
  LDA #$0001                                ; $02B160 |

CODE_02B163:
  CLC                                       ; $02B163 |
  ADC #$001A                                ; $02B164 |
  STA !s_spr_anim_frame,x                   ; $02B167 |
  RTS                                       ; $02B16A |

  TYX                                       ; $02B16B |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02B16C |
  BEQ CODE_02B173                           ; $02B16E |
  JMP CODE_02B213                           ; $02B170 |

CODE_02B173:
  JSR CODE_02B342                           ; $02B173 |
  LDA $7860,x                               ; $02B176 |
  AND #$0001                                ; $02B179 |
  BNE CODE_02B189                           ; $02B17C |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02B17E |
  BNE CODE_02B186                           ; $02B181 |
  JMP CODE_02B426                           ; $02B183 |

CODE_02B186:
  JMP CODE_02B42F                           ; $02B186 |

CODE_02B189:
  LDY !s_spr_collision_id,x                 ; $02B189 |
  DEY                                       ; $02B18C |
  BMI CODE_02B1DC                           ; $02B18D |
  LDA !s_spr_state,y                        ; $02B18F |
  CMP #$0010                                ; $02B192 |
  BNE CODE_02B1DC                           ; $02B195 |
  LDA !s_spr_id,y                           ; $02B197 |
  CMP #$0007                                ; $02B19A |
  BNE CODE_02B1DC                           ; $02B19D |
  LDA !s_spr_wildcard_4_lo,y                ; $02B19F |
  ORA !s_spr_wildcard_5_lo,y                ; $02B1A2 |
  BNE CODE_02B1DC                           ; $02B1A5 |
  TXA                                       ; $02B1A7 |
  STA !s_spr_wildcard_4_lo,y                ; $02B1A8 |
  LDA #$0000                                ; $02B1AB |
  STA !s_spr_y_accel,y                      ; $02B1AE |
  LDA !s_spr_bitwise_settings_3,y           ; $02B1B1 |
  AND #$FFE0                                ; $02B1B4 |
  STA !s_spr_bitwise_settings_3,y           ; $02B1B7 |
  LDA !s_spr_oam_1,y                        ; $02B1BA |
  AND #$FFF3                                ; $02B1BD |
  STA !s_spr_oam_1,y                        ; $02B1C0 |
  TYA                                       ; $02B1C3 |
  INC A                                     ; $02B1C4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02B1C5 |
  LDA !s_spr_oam_1,x                        ; $02B1C7 |
  AND #$FFF3                                ; $02B1CA |
  STA !s_spr_oam_1,x                        ; $02B1CD |
  LDA #$0004                                ; $02B1D0 |
  STA !s_spr_wildcard_1_lo,x                ; $02B1D3 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02B1D6 |
  STZ !s_spr_timer_4,x                      ; $02B1D9 |

CODE_02B1DC:
  JSR CODE_02B259                           ; $02B1DC |
  BCS CODE_02B203                           ; $02B1DF |
  JSR CODE_02B6E4                           ; $02B1E1 |
  LDA $00                                   ; $02B1E4 |
  CMP #$0020                                ; $02B1E6 |
  BCS CODE_02B1F1                           ; $02B1E9 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02B1EB |
  JMP CODE_02B0C8                           ; $02B1EE |

CODE_02B1F1:
  LDA !s_spr_x_player_dir,x                 ; $02B1F1 |
  EOR #$0002                                ; $02B1F4 |

CODE_02B1F7:
  AND #$00FF                                ; $02B1F7 |
  STA !s_spr_facing_dir,x                   ; $02B1FA |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02B1FD |
  JMP CODE_02B3D9                           ; $02B200 |

CODE_02B203:
  LDA !s_spr_x_player_dir,x                 ; $02B203 |
  JSR CODE_02B1F7                           ; $02B206 |
  STZ !s_spr_x_speed_lo,x                   ; $02B209 |
  LDA #$0001                                ; $02B20C |
  STA !s_spr_gsu_morph_2_lo,x               ; $02B20F |
  RTS                                       ; $02B212 |

CODE_02B213:
  DEY                                       ; $02B213 |
  BNE CODE_02B239                           ; $02B214 |
  JSR CODE_02B316                           ; $02B216 |
  LDA #$0003                                ; $02B219 |
  BCS CODE_02B22E                           ; $02B21C |
  LDA !s_player_jump_state                  ; $02B21E |
  BEQ CODE_02B22B                           ; $02B221 |
  LDA !s_spr_y_player_delta,x               ; $02B223 |
  CMP #$FFC0                                ; $02B226 |
  BPL CODE_02B233                           ; $02B229 |

CODE_02B22B:
  LDA #$0002                                ; $02B22B |

CODE_02B22E:
  STA !s_spr_wildcard_4_lo_dp,x             ; $02B22E |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02B230 |
  RTS                                       ; $02B232 |

CODE_02B233:
  JSR CODE_02B6E4                           ; $02B233 |
  JMP CODE_02B0E4                           ; $02B236 |

CODE_02B239:
  DEY                                       ; $02B239 |
  BNE CODE_02B256                           ; $02B23A |
  JSR CODE_02B259                           ; $02B23C |
  BCS CODE_02B253                           ; $02B23F |
  LDA !s_player_jump_state                  ; $02B241 |
  BNE CODE_02B24E                           ; $02B244 |
  LDA !s_spr_y_player_delta,x               ; $02B246 |
  CMP #$FFC0                                ; $02B249 |
  BMI CODE_02B253                           ; $02B24C |

CODE_02B24E:
  DEC !s_spr_wildcard_4_lo_dp,x             ; $02B24E |
  JMP CODE_02B35F                           ; $02B250 |

CODE_02B253:
  JMP CODE_02B156                           ; $02B253 |

CODE_02B256:
  JMP CODE_02B10F                           ; $02B256 |

CODE_02B259:
  LDA !s_spr_x_player_delta,x               ; $02B259 |
  BPL CODE_02B262                           ; $02B25C |
  EOR #$FFFF                                ; $02B25E |
  INC A                                     ; $02B261 |

CODE_02B262:
  STA $00                                   ; $02B262 |
  LDA !s_spr_y_player_delta,x               ; $02B264 |
  BPL CODE_02B26D                           ; $02B267 |
  EOR #$FFFF                                ; $02B269 |
  INC A                                     ; $02B26C |

CODE_02B26D:
  STA $02                                   ; $02B26D |
  CLC                                       ; $02B26F |
  ADC $00                                   ; $02B270 |
  CMP #$0080                                ; $02B272 |

CODE_02B275:
  RTS                                       ; $02B275 |

CODE_02B276:
  LDY !s_spr_collision_id,x                 ; $02B276 |
  BPL CODE_02B275                           ; $02B279 |
  LDA !s_spr_timer_2,x                      ; $02B27B |
  BNE CODE_02B275                           ; $02B27E |
  JSL $03D35D                               ; $02B280 |
  CPY #$06                                  ; $02B284 |
  BNE CODE_02B275                           ; $02B286 |
  LDA !s_player_y_speed                     ; $02B288 |
  BMI CODE_02B275                           ; $02B28B |
  LDA #$0020                                ; $02B28D |
  STA !s_spr_timer_2,x                      ; $02B290 |
  LDA #$FC00                                ; $02B293 |
  STA !s_player_y_speed                     ; $02B296 |
  LDA #$8001                                ; $02B299 |
  STA !s_player_flutter_state               ; $02B29C |
  STZ !s_spr_x_speed_lo,x                   ; $02B29F |
  LDA !s_spr_y_speed_lo,x                   ; $02B2A2 |
  BPL CODE_02B2AA                           ; $02B2A5 |
  STZ !s_spr_y_speed_lo,x                   ; $02B2A7 |

CODE_02B2AA:
  JSL $03A0E5                               ; $02B2AA |

CODE_02B2AE:
  JSR CODE_02B13D                           ; $02B2AE |
  JSR CODE_02B657                           ; $02B2B1 |
  JSL $02AE7D                               ; $02B2B4 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02B2B8 |
  RTS                                       ; $02B2BA |

  JSR CODE_02B2AE                           ; $02B2BB |
  RTL                                       ; $02B2BE |

CODE_02B2BF:
  LDY !s_spr_collision_id,x                 ; $02B2BF |
  BPL CODE_02B2D1                           ; $02B2C2 |
  LDA !s_spr_timer_2,x                      ; $02B2C4 |
  BNE CODE_02B2D1                           ; $02B2C7 |
  JSL $03D35D                               ; $02B2C9 |
  CPY #$04                                  ; $02B2CD |
  BCC CODE_02B2D2                           ; $02B2CF |

CODE_02B2D1:
  RTS                                       ; $02B2D1 |

CODE_02B2D2:
  LDA #$FFF0                                ; $02B2D2 |
  CPY #$00                                  ; $02B2D5 |
  BEQ CODE_02B2DC                           ; $02B2D7 |
  LDA #$0010                                ; $02B2D9 |

CODE_02B2DC:
  SEC                                       ; $02B2DC |
  SBC !s_spr_x_player_delta,x               ; $02B2DD |
  PHA                                       ; $02B2E0 |
  CLC                                       ; $02B2E1 |
  ADC !s_player_x_speed_prev                ; $02B2E2 |
  STA !s_spr_x_speed_lo,x                   ; $02B2E5 |
  PLA                                       ; $02B2E8 |
  BMI CODE_02B2EF                           ; $02B2E9 |
  EOR #$FFFF                                ; $02B2EB |
  INC A                                     ; $02B2EE |

CODE_02B2EF:
  CLC                                       ; $02B2EF |
  ADC #$FC00                                ; $02B2F0 |
  STA !s_spr_y_speed_lo,x                   ; $02B2F3 |
  LDA !s_player_x_speed_prev                ; $02B2F6 |
  CMP #$8000                                ; $02B2F9 |
  ROR A                                     ; $02B2FC |
  STA !s_player_x_speed_prev                ; $02B2FD |
  JSR CODE_02B2AA                           ; $02B300 |
  LDA #$000E                                ; $02B303 |
  STA !s_spr_state,x                        ; $02B306 |
  LDA !s_spr_oam_yxppccct,x                 ; $02B309 |
  ORA #$0030                                ; $02B30C |
  STA !s_spr_oam_yxppccct,x                 ; $02B30F |
  PLA                                       ; $02B312 |
  RTS                                       ; $02B313 |

  TAX                                       ; $02B314 |
  RTS                                       ; $02B315 |

CODE_02B316:
  JSR CODE_02B37F                           ; $02B316 |
  BCS CODE_02B325                           ; $02B319 |
  LDA #$FC00                                ; $02B31B |
  STA !s_spr_y_speed_lo,x                   ; $02B31E |
  PLA                                       ; $02B321 |
  JMP CODE_02B138                           ; $02B322 |

CODE_02B325:
  LDA $7860,x                               ; $02B325 |
  AND #$0002                                ; $02B328 |
  BNE CODE_02B341                           ; $02B32B |
  LDA !s_spr_wildcard_2_lo,x                ; $02B32D |
  REP #$10                                  ; $02B330 |
  TAX                                       ; $02B332 |
  LDA $70001F,x                             ; $02B333 |
  SEP #$10                                  ; $02B337 |
  TAY                                       ; $02B339 |
  LDX $12                                   ; $02B33A |
  CPY #$9B                                  ; $02B33C |
  BEQ CODE_02B341                           ; $02B33E |
  CLC                                       ; $02B340 |

CODE_02B341:
  RTS                                       ; $02B341 |

CODE_02B342:
  JSR CODE_02B37A                           ; $02B342 |
  BCC CODE_02B36B                           ; $02B345 |
  PLA                                       ; $02B347 |

CODE_02B348:
  INC !s_spr_wildcard_4_lo_dp,x             ; $02B348 |
  LDA !s_spr_bitwise_settings_3,x           ; $02B34A |
  AND #$FFE0                                ; $02B34D |
  ORA #$0006                                ; $02B350 |
  STA !s_spr_bitwise_settings_3,x           ; $02B353 |
  STZ !s_spr_x_speed_lo,x                   ; $02B356 |
  STZ !s_spr_y_speed_lo,x                   ; $02B359 |
  STZ !s_spr_y_accel,x                      ; $02B35C |

CODE_02B35F:
  LDA #$0019                                ; $02B35F |
  STA !s_spr_anim_frame,x                   ; $02B362 |
  LDA #$0006                                ; $02B365 |
  STA !s_spr_timer_4,x                      ; $02B368 |

CODE_02B36B:
  RTS                                       ; $02B36B |

  dw $0008, $0004, $0007, $0008             ; $02B36C |

  dw $0001, $FFFF, $0001                    ; $02B374 |

CODE_02B37A:
  LDA !s_spr_timer_1,x                      ; $02B37A |
  BNE CODE_02B3BB                           ; $02B37D |

CODE_02B37F:
  LDY !s_spr_facing_dir,x                   ; $02B37F |

CODE_02B382:
  LDA $7860,x                               ; $02B382 |
  AND $B36C,y                               ; $02B385 |
  BNE CODE_02B3C7                           ; $02B388 |
  LDA !s_spr_wildcard_2_lo,x                ; $02B38A |
  CPY #$00                                  ; $02B38D |
  BEQ CODE_02B395                           ; $02B38F |
  CLC                                       ; $02B391 |
  ADC #$0008                                ; $02B392 |

CODE_02B395:
  REP #$10                                  ; $02B395 |
  TAX                                       ; $02B397 |
  LDA $70000F,x                             ; $02B398 |
  AND #$00FF                                ; $02B39C |
  SEP #$10                                  ; $02B39F |
  LDX $12                                   ; $02B3A1 |
  SEC                                       ; $02B3A3 |
  SBC #$0099                                ; $02B3A4 |
  LSR A                                     ; $02B3A7 |
  BNE CODE_02B3BB                           ; $02B3A8 |
  LDA !s_spr_x_pixel_pos,x                  ; $02B3AA |
  AND #$000F                                ; $02B3AD |
  SEC                                       ; $02B3B0 |
  SBC $B370,y                               ; $02B3B1 |
  BEQ CODE_02B3C7                           ; $02B3B4 |
  EOR $B374,y                               ; $02B3B6 |
  BMI CODE_02B3BD                           ; $02B3B9 |

CODE_02B3BB:
  CLC                                       ; $02B3BB |
  RTS                                       ; $02B3BC |

CODE_02B3BD:
  LDA !s_spr_x_pixel_pos,x                  ; $02B3BD |
  CLC                                       ; $02B3C0 |
  ADC $B374,y                               ; $02B3C1 |
  STA !s_spr_x_pixel_pos,x                  ; $02B3C4 |

CODE_02B3C7:
  SEC                                       ; $02B3C7 |
  RTS                                       ; $02B3C8 |

  dw $FFE0, $0020                           ; $02B3C9 |
  dw $FE00, $0200                           ; $02B3CD |

  LDA $7860,x                               ; $02B3D1 |
  AND #$0001                                ; $02B3D4 |
  BEQ CODE_02B42F                           ; $02B3D7 |

CODE_02B3D9:
  LDA !s_spr_timer_4,x                      ; $02B3D9 |
  BEQ CODE_02B3E8                           ; $02B3DC |

CODE_02B3DE:
  STZ !s_spr_x_speed_lo,x                   ; $02B3DE |
  LDA #$0003                                ; $02B3E1 |
  STA !s_spr_anim_frame,x                   ; $02B3E4 |
  RTS                                       ; $02B3E7 |

CODE_02B3E8:
  LDY !s_spr_facing_dir,x                   ; $02B3E8 |
  LDA !s_spr_x_hitbox_center,x              ; $02B3EB |
  CLC                                       ; $02B3EE |
  ADC $B3C9,y                               ; $02B3EF |
  STA !gsu_r8                               ; $02B3F2 |
  LDA !s_spr_y_pixel_pos,x                  ; $02B3F5 |
  SEC                                       ; $02B3F8 |
  SBC #$0030                                ; $02B3F9 |
  STA !gsu_r0                               ; $02B3FC |
  LDX #$0A                                  ; $02B3FF |
  LDA #$CE2F                                ; $02B401 |
  JSL r_gsu_init_3                          ; $02B404 | GSU init
  LDX $12                                   ; $02B408 |
  LDA !gsu_r7                               ; $02B40A |
  AND #$0002                                ; $02B40D |
  BNE CODE_02B420                           ; $02B410 |
  LDA #$FD00                                ; $02B412 |
  LDY $300D                                 ; $02B415 |
  CPY #$99                                  ; $02B418 |
  BCC CODE_02B423                           ; $02B41A |
  CPY #$9B                                  ; $02B41C |
  BCS CODE_02B423                           ; $02B41E |

CODE_02B420:
  LDA #$FA00                                ; $02B420 |

CODE_02B423:
  STA !s_spr_y_speed_lo,x                   ; $02B423 |

CODE_02B426:
  LDY !s_spr_facing_dir,x                   ; $02B426 |
  LDA $B3CD,y                               ; $02B429 |
  STA !s_spr_x_speed_lo,x                   ; $02B42C |

CODE_02B42F:
  LDA #$0005                                ; $02B42F |
  STA !s_spr_timer_4,x                      ; $02B432 |
  LDA #$0004                                ; $02B435 |
  STA !s_spr_anim_frame,x                   ; $02B438 |
  RTS                                       ; $02B43B |

  db $24, $23, $24, $23, $24, $23, $24, $23 ; $02B43C |
  db $1E, $22, $1E, $22, $1E, $22, $1E, $22 ; $02B444 |
  db $1E, $21, $20                          ; $02B44C |

  db $03, $03, $03, $03, $03, $03, $03, $03 ; $02B44F |
  db $10, $04, $04, $04, $04, $04, $04, $04 ; $02B457 |
  db $04, $08, $10                          ; $02B45F |

  dw $FE80, $0180, $FFF8, $0008             ; $02B462 |
  dw $FE00                                  ; $02B46A |

  dw $0200, $0010, $0020, $0008             ; $02B46C |
  dw $0018                                  ; $02B474 |

  TYX                                       ; $02B476 |
  JSR CODE_02B7D1                           ; $02B477 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02B47A |
  CPY #$03                                  ; $02B47C |
  BCC CODE_02B483                           ; $02B47E |
  JMP CODE_02BB6B                           ; $02B480 |

CODE_02B483:
  JSR CODE_02B728                           ; $02B483 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02B486 |
  BEQ CODE_02B48D                           ; $02B488 |
  JMP CODE_02B55C                           ; $02B48A |

CODE_02B48D:
  LDY !s_spr_gsu_morph_2_lo,x               ; $02B48D |
  BNE CODE_02B495                           ; $02B490 |
  JMP CODE_02B52E                           ; $02B492 |

CODE_02B495:
  LDA !s_spr_timer_4,x                      ; $02B495 |
  BNE CODE_02B4AD                           ; $02B498 |
  DEY                                       ; $02B49A |
  TYA                                       ; $02B49B |
  STA !s_spr_gsu_morph_2_lo,x               ; $02B49C |
  BNE CODE_02B4AE                           ; $02B49F |
  LDA #$0080                                ; $02B4A1 |
  STA !s_spr_timer_4,x                      ; $02B4A4 |
  LDA #$001E                                ; $02B4A7 |
  STA !s_spr_anim_frame,x                   ; $02B4AA |

CODE_02B4AD:
  RTS                                       ; $02B4AD |

CODE_02B4AE:
  LDA $B44E,y                               ; $02B4AE |
  AND #$00FF                                ; $02B4B1 |
  STA !s_spr_timer_4,x                      ; $02B4B4 |
  LDA $B43B,y                               ; $02B4B7 |
  AND #$00FF                                ; $02B4BA |
  STA !s_spr_anim_frame,x                   ; $02B4BD |
  CMP #$0022                                ; $02B4C0 |
  BNE CODE_02B4CE                           ; $02B4C3 |
  PHA                                       ; $02B4C5 |
  LDA #$0014                                ; $02B4C6 |\ play sound #$0014
  JSL push_sound_queue                      ; $02B4C9 |/
  PLA                                       ; $02B4CD |

CODE_02B4CE:
  CMP #$0023                                ; $02B4CE |
  BNE CODE_02B52D                           ; $02B4D1 |
  LDA !s_spr_x_player_dir,x                 ; $02B4D3 |
  EOR #$0002                                ; $02B4D6 |
  AND #$00FF                                ; $02B4D9 |
  STA !s_spr_facing_dir,x                   ; $02B4DC |
  LDA #$0107                                ; $02B4DF |
  JSL spawn_sprite_active                   ; $02B4E2 |
  BCC CODE_02B52D                           ; $02B4E6 |
  LDA !s_spr_facing_dir,x                   ; $02B4E8 |
  EOR #$0002                                ; $02B4EB |
  STA !s_spr_facing_dir,y                   ; $02B4EE |
  TAX                                       ; $02B4F1 |
  LDA !s_cur_spr_x_prev                     ; $02B4F2 |
  CLC                                       ; $02B4F5 |
  ADC $B466,x                               ; $02B4F6 |
  STA !s_spr_x_pixel_pos,y                  ; $02B4F9 |
  LDA !s_cur_spr_y_prev                     ; $02B4FC |
  SEC                                       ; $02B4FF |
  SBC #$0003                                ; $02B500 |
  STA !s_spr_y_pixel_pos,y                  ; $02B503 |
  LDA $B46A,x                               ; $02B506 |
  STA !s_spr_x_speed_lo,y                   ; $02B509 |
  LDA #$0001                                ; $02B50C |
  STA !s_spr_collision_state,y              ; $02B50F |
  STA !s_spr_gsu_morph_2_lo,y               ; $02B512 |
  LDA !s_spr_bitwise_settings_1,y           ; $02B515 |
  AND #$F9FF                                ; $02B518 |
  STA !s_spr_bitwise_settings_1,y           ; $02B51B |
  LDA #$FFFF                                ; $02B51E |
  STA $7862,y                               ; $02B521 |
  LDA #$0045                                ; $02B524 |\ play sound #$0045
  JSL push_sound_queue                      ; $02B527 |/
  LDX $12                                   ; $02B52B |

CODE_02B52D:
  RTS                                       ; $02B52D |

CODE_02B52E:
  JSR CODE_02B259                           ; $02B52E |
  BCS CODE_02B53C                           ; $02B531 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02B533 |
  LDA #$0020                                ; $02B535 |
  STA !s_spr_timer_3,x                      ; $02B538 |
  RTS                                       ; $02B53B |

CODE_02B53C:
  STZ !s_spr_x_speed_lo,x                   ; $02B53C |
  LDA !s_spr_timer_4,x                      ; $02B53F |
  BNE CODE_02B559                           ; $02B542 |
  LDA !s_spr_cam_x_pos,x                    ; $02B544 |
  CMP #$00F0                                ; $02B547 |
  BCS CODE_02B559                           ; $02B54A |
  LDA $02                                   ; $02B54C |
  CMP #$0020                                ; $02B54E |
  BCS CODE_02B559                           ; $02B551 |
  LDA #$0014                                ; $02B553 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02B556 |

CODE_02B559:
  JMP CODE_02B62F                           ; $02B559 |

CODE_02B55C:
  DEY                                       ; $02B55C |
  BNE CODE_02B5A9                           ; $02B55D |
  JSR CODE_02B259                           ; $02B55F |
  BCC CODE_02B569                           ; $02B562 |
  LDA !s_spr_timer_3,x                      ; $02B564 |
  BEQ CODE_02B5B9                           ; $02B567 |

CODE_02B569:
  LDA $00                                   ; $02B569 |
  CMP #$0020                                ; $02B56B |
  BCS CODE_02B573                           ; $02B56E |
  JMP CODE_02B60D                           ; $02B570 |

CODE_02B573:
  LDA !s_spr_x_player_dir,x                 ; $02B573 |
  EOR #$0002                                ; $02B576 |
  AND #$00FF                                ; $02B579 |
  STA !s_spr_facing_dir,x                   ; $02B57C |
  TAY                                       ; $02B57F |
  LDA $B462,y                               ; $02B580 |
  STA !s_spr_x_speed_lo,x                   ; $02B583 |
  LDA $7860,x                               ; $02B586 |
  AND $B36C,y                               ; $02B589 |
  BEQ CODE_02B591                           ; $02B58C |
  STZ !s_spr_x_speed_lo,x                   ; $02B58E |

CODE_02B591:
  LDA $7860,x                               ; $02B591 |
  AND #$0001                                ; $02B594 |
  BEQ CODE_02B5A6                           ; $02B597 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02B599 |
  AND #$0002                                ; $02B59B |
  LSR A                                     ; $02B59E |
  ADC #$001C                                ; $02B59F |
  STA !s_spr_anim_frame,x                   ; $02B5A2 |
  RTS                                       ; $02B5A5 |

CODE_02B5A6:
  JMP CODE_02BB55                           ; $02B5A6 |

CODE_02B5A9:
  JSR CODE_02B259                           ; $02B5A9 |
  BCS CODE_02B5B9                           ; $02B5AC |
  LDA !s_spr_x_player_dir,x                 ; $02B5AE |
  AND #$00FF                                ; $02B5B1 |
  CMP !s_spr_facing_dir,x                   ; $02B5B4 |
  BEQ CODE_02B5CB                           ; $02B5B7 |

CODE_02B5B9:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02B5B9 |
  STZ !s_spr_x_speed_lo,x                   ; $02B5BB |
  LDA #$001E                                ; $02B5BE |
  STA !s_spr_anim_frame,x                   ; $02B5C1 |
  LDA #$0020                                ; $02B5C4 |
  STA !s_spr_timer_3,x                      ; $02B5C7 |

CODE_02B5CA:
  RTS                                       ; $02B5CA |

CODE_02B5CB:
  STZ !s_spr_x_speed_lo,x                   ; $02B5CB |
  LDA !s_player_x_speed_prev                ; $02B5CE |
  BPL CODE_02B5D7                           ; $02B5D1 |
  EOR #$FFFF                                ; $02B5D3 |
  INC A                                     ; $02B5D6 |

CODE_02B5D7:
  LSR A                                     ; $02B5D7 |
  LSR A                                     ; $02B5D8 |
  LSR A                                     ; $02B5D9 |
  CLC                                       ; $02B5DA |
  ADC #$0018                                ; $02B5DB |
  CMP $00                                   ; $02B5DE |
  BCS CODE_02B5E5                           ; $02B5E0 |
  JMP CODE_02B620                           ; $02B5E2 |

CODE_02B5E5:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02B5E5 |
  BEQ CODE_02B5CA                           ; $02B5E7 |
  LDA !s_spr_x_player_dir,x                 ; $02B5E9 |
  EOR #$0002                                ; $02B5EC |
  TAY                                       ; $02B5EF |
  JSR CODE_02B382                           ; $02B5F0 |
  BCC CODE_02B60D                           ; $02B5F3 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02B5F5 |

CODE_02B5F7:
  LDA !s_spr_bitwise_settings_3,x           ; $02B5F7 |
  AND #$FFE0                                ; $02B5FA |
  ORA #$0006                                ; $02B5FD |
  STA !s_spr_bitwise_settings_3,x           ; $02B600 |
  STZ !s_spr_x_speed_lo,x                   ; $02B603 |
  STZ !s_spr_y_speed_lo,x                   ; $02B606 |
  STZ !s_spr_y_accel,x                      ; $02B609 |
  RTS                                       ; $02B60C |

CODE_02B60D:
  STZ !s_spr_wildcard_4_lo,x                ; $02B60D |
  LDA #$FB00                                ; $02B610 |
  JSR CODE_02BB43                           ; $02B613 |
  LDY !s_spr_facing_dir,x                   ; $02B616 |
  LDA $B3CD,y                               ; $02B619 |
  STA !s_spr_x_speed_lo,x                   ; $02B61C |
  RTS                                       ; $02B61F |

CODE_02B620:
  LDA #$0007                                ; $02B620 |
  LDY $00                                   ; $02B623 |
  CPY #$40                                  ; $02B625 |
  BCC CODE_02B62C                           ; $02B627 |
  LDA #$000F                                ; $02B629 |

CODE_02B62C:
  JSR CODE_02B6E7                           ; $02B62C |

CODE_02B62F:
  LDA !s_spr_timer_4,x                      ; $02B62F |
  BNE CODE_02B656                           ; $02B632 |
  LDA $10                                   ; $02B634 |
  AND #$0006                                ; $02B636 |
  TAY                                       ; $02B639 |
  LDA $B46E,y                               ; $02B63A |
  LDY $00                                   ; $02B63D |
  CPY #$40                                  ; $02B63F |
  BCS CODE_02B644                           ; $02B641 |
  LSR A                                     ; $02B643 |

CODE_02B644:
  STA !s_spr_timer_4,x                      ; $02B644 |
  LDA !s_spr_anim_frame,x                   ; $02B647 |
  INC A                                     ; $02B64A |
  CMP #$0020                                ; $02B64B |
  BCC CODE_02B653                           ; $02B64E |
  LDA #$001E                                ; $02B650 |

CODE_02B653:
  STA !s_spr_anim_frame,x                   ; $02B653 |

CODE_02B656:
  RTS                                       ; $02B656 |

CODE_02B657:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02B657 |
  BEQ CODE_02B656                           ; $02B659 |
  DEY                                       ; $02B65B |
  BNE CODE_02B679                           ; $02B65C |
  JSL $06C0BB                               ; $02B65E |
  LDA !s_spr_x_pixel_pos,x                  ; $02B662 |
  STA !s_spr_x_pixel_pos                    ; $02B665 |
  LDA !s_spr_y_pixel_pos,x                  ; $02B668 |
  STA !s_spr_y_pixel_pos                    ; $02B66B |
  STZ !s_spr_x_speed_lo                     ; $02B66E |
  LDA #$FE80                                ; $02B671 |
  STA !s_spr_y_speed_lo                     ; $02B674 |
  BRA CODE_02B6AA                           ; $02B677 |

CODE_02B679:
  LDA !s_spr_x_pixel_pos,x                  ; $02B679 |
  STA !s_spr_x_pixel_pos,y                  ; $02B67C |
  LDA !s_spr_y_pixel_pos,x                  ; $02B67F |
  CLC                                       ; $02B682 |
  ADC #$000A                                ; $02B683 |
  STA !s_spr_y_pixel_pos,y                  ; $02B686 |
  PHX                                       ; $02B689 |
  TYX                                       ; $02B68A |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02B68B |
  JSL $048066                               ; $02B68D |
  TXY                                       ; $02B691 |
  PLX                                       ; $02B692 |
  LDA !s_spr_x_pixel_pos,x                  ; $02B693 |
  CMP !s_spr_x_pixel_pos,y                  ; $02B696 |
  LDA #$0100                                ; $02B699 |
  BCC CODE_02B6A1                           ; $02B69C |
  LDA #$FF00                                ; $02B69E |

CODE_02B6A1:
  STA !s_spr_x_speed_lo,y                   ; $02B6A1 |
  LDA #$FC00                                ; $02B6A4 |
  STA !s_spr_y_speed_lo,y                   ; $02B6A7 |

CODE_02B6AA:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02B6AA |

CODE_02B6AC:
  STZ !s_spr_gsu_morph_2_lo,x               ; $02B6AC |
  LDA #$0002                                ; $02B6AF |

CODE_02B6B2:
  STA !s_spr_wildcard_1_lo,x                ; $02B6B2 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02B6B5 |
  STZ !s_spr_timer_4,x                      ; $02B6B7 |
  LDA !s_spr_bitwise_settings_3,x           ; $02B6BA |
  AND #$FFE0                                ; $02B6BD |
  ORA #$0018                                ; $02B6C0 |
  STA !s_spr_bitwise_settings_3,x           ; $02B6C3 |
  LDA !s_spr_oam_1,x                        ; $02B6C6 |
  ORA #$0004                                ; $02B6C9 |
  STA !s_spr_oam_1,x                        ; $02B6CC |
  LDA #$0004                                ; $02B6CF |
  STA !s_spr_draw_priority,x                ; $02B6D2 |
  LDA #$0040                                ; $02B6D5 |
  STA !s_spr_y_accel,x                      ; $02B6D8 |
  RTS                                       ; $02B6DB |

  dw $0004, $FFFC                           ; $02B6DC |

  dw $0080, $FF80                           ; $02B6E0 |

CODE_02B6E4:
  LDA #$000F                                ; $02B6E4 |

CODE_02B6E7:
  AND !s_spr_wildcard_3_lo_dp,x             ; $02B6E7 |
  BNE CODE_02B723                           ; $02B6E9 |
  LDY !s_spr_facing_dir,x                   ; $02B6EB |
  LDA $B6E0,y                               ; $02B6EE |
  PHA                                       ; $02B6F1 |
  LDA $B6DC,y                               ; $02B6F2 |
  PHA                                       ; $02B6F5 |
  LDA #$01D7                                ; $02B6F6 |
  JSL spawn_ambient_sprite                  ; $02B6F9 |
  PLA                                       ; $02B6FD |
  CLC                                       ; $02B6FE |
  ADC !s_spr_x_pixel_pos,x                  ; $02B6FF |
  STA $70A2,y                               ; $02B702 |
  PLA                                       ; $02B705 |
  CLC                                       ; $02B706 |
  ADC !s_spr_x_speed_lo,x                   ; $02B707 |
  STA $71E0,y                               ; $02B70A |
  LDA !s_spr_y_pixel_pos,x                  ; $02B70D |
  SEC                                       ; $02B710 |
  SBC #$0009                                ; $02B711 |
  STA $7142,y                               ; $02B714 |
  LDA !s_spr_facing_dir,x                   ; $02B717 |
  STA $73C0,y                               ; $02B71A |
  LDA #$0010                                ; $02B71D |
  STA $7782,y                               ; $02B720 |

CODE_02B723:
  RTS                                       ; $02B723 |

  dw $0008, $0004                           ; $02B724 |

CODE_02B728:
  JSR CODE_02B37A                           ; $02B728 |
  BCC CODE_02B74F                           ; $02B72B |
  LDA #$0003                                ; $02B72D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02B730 |
  LDA #$0020                                ; $02B732 |
  STA !s_spr_timer_3,x                      ; $02B735 |
  LDA #$0018                                ; $02B738 |
  STA !s_spr_anim_frame,x                   ; $02B73B |
  LDY !s_spr_facing_dir,x                   ; $02B73E |
  LDA !s_spr_x_pixel_pos,x                  ; $02B741 |
  CLC                                       ; $02B744 |
  ADC $B376,y                               ; $02B745 |
  STA !s_spr_x_pixel_pos,x                  ; $02B748 |
  PLA                                       ; $02B74B |
  JMP CODE_02B5F7                           ; $02B74C |

CODE_02B74F:
  LDA $7860,x                               ; $02B74F |
  BIT #$0001                                ; $02B752 |
  BEQ CODE_02B760                           ; $02B755 |
  LDY !s_spr_facing_dir,x                   ; $02B757 |
  AND $B724,y                               ; $02B75A |
  BNE CODE_02B77B                           ; $02B75D |
  RTS                                       ; $02B75F |

CODE_02B760:
  LDA !s_spr_gsu_morph_1_lo,x               ; $02B760 |
  BNE CODE_02B767                           ; $02B763 |
  PLA                                       ; $02B765 |
  RTS                                       ; $02B766 |

CODE_02B767:
  LDA $70276E,x                             ; $02B767 |
  STA !s_spr_x_pixel_pos,x                  ; $02B76B |
  LDA $702770,x                             ; $02B76E |
  STA !s_spr_y_pixel_pos,x                  ; $02B772 |
  STZ !s_spr_timer_3,x                      ; $02B775 |
  STZ !s_spr_x_speed_lo,x                   ; $02B778 |

CODE_02B77B:
  JSR CODE_02B259                           ; $02B77B |
  BCS CODE_02B79D                           ; $02B77E |
  LDA !s_spr_x_player_dir,x                 ; $02B780 |
  AND #$00FF                                ; $02B783 |
  CMP !s_spr_facing_dir,x                   ; $02B786 |
  BEQ CODE_02B79D                           ; $02B789 |
  STA !s_spr_facing_dir,x                   ; $02B78B |
  LDA #$0002                                ; $02B78E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02B791 |
  LDA #$001E                                ; $02B793 |
  STA !s_spr_anim_frame,x                   ; $02B796 |
  STZ !s_spr_timer_4,x                      ; $02B799 |
  RTS                                       ; $02B79C |

CODE_02B79D:
  LDA !s_spr_facing_dir,x                   ; $02B79D |
  EOR #$0002                                ; $02B7A0 |
  STA !s_spr_facing_dir,x                   ; $02B7A3 |
  RTS                                       ; $02B7A6 |

CODE_02B7A7:
  LDY #$08                                  ; $02B7A7 |
  LDA !s_spr_x_pixel_pos,x                  ; $02B7A9 |
  SEC                                       ; $02B7AC |
  SBC #$0010                                ; $02B7AD |
  BMI CODE_02B7BA                           ; $02B7B0 |
  SEC                                       ; $02B7B2 |
  SBC #$0FD0                                ; $02B7B3 |
  BMI CODE_02B7C4                           ; $02B7B6 |
  LDY #$04                                  ; $02B7B8 |

CODE_02B7BA:
  EOR #$FFFF                                ; $02B7BA |
  SEC                                       ; $02B7BD |
  ADC !s_spr_x_pixel_pos,x                  ; $02B7BE |
  STA !s_spr_x_pixel_pos,x                  ; $02B7C1 |

CODE_02B7C4:
  LDA !s_spr_cam_x_pos,x                    ; $02B7C4 |
  CLC                                       ; $02B7C7 |
  ADC #$0020                                ; $02B7C8 |
  CMP #$0130                                ; $02B7CB |
  BCS CODE_02B821                           ; $02B7CE |
  RTS                                       ; $02B7D0 |

CODE_02B7D1:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02B7D1 |
  BNE CODE_02B7D8                           ; $02B7D3 |
  JMP CODE_02B867                           ; $02B7D5 |

CODE_02B7D8:
  LDA $6EFF,y                               ; $02B7D8 |
  CMP #$0010                                ; $02B7DB |
  BNE CODE_02B85C                           ; $02B7DE |
  DEY                                       ; $02B7E0 |
  BNE CODE_02B83B                           ; $02B7E1 |
  LDA !s_spr_cam_x_pos,x                    ; $02B7E3 |
  CLC                                       ; $02B7E6 |
  ADC #$0040                                ; $02B7E7 |
  CMP #$0170                                ; $02B7EA |
  BCS CODE_02B821                           ; $02B7ED |
  LDA !s_spr_cam_y_pos,x                    ; $02B7EF |
  CLC                                       ; $02B7F2 |
  ADC #$0040                                ; $02B7F3 |
  CMP #$0120                                ; $02B7F6 |
  BCC CODE_02B83B                           ; $02B7F9 |
  LDA !s_spr_x_screen_pos,x                 ; $02B7FB |
  AND #$000F                                ; $02B7FE |
  STA $00                                   ; $02B801 |
  LDA !s_spr_y_pixel_pos,x                  ; $02B803 |
  CLC                                       ; $02B806 |
  ADC #$0030                                ; $02B807 |
  CMP #$0800                                ; $02B80A |
  BCS CODE_02B81E                           ; $02B80D |
  AND #$0700                                ; $02B80F |
  LSR A                                     ; $02B812 |
  LSR A                                     ; $02B813 |
  LSR A                                     ; $02B814 |
  LSR A                                     ; $02B815 |
  ORA $00                                   ; $02B816 |
  TAY                                       ; $02B818 |
  LDA $6CA9,y                               ; $02B819 |
  BPL CODE_02B821                           ; $02B81C |

CODE_02B81E:
  JMP CODE_02B657                           ; $02B81E |

CODE_02B821:
  LDA !s_spr_x_pixel_pos,x                  ; $02B821 |
  SEC                                       ; $02B824 |
  SBC !s_spr_x_delta_lo,x                   ; $02B825 |
  STA !s_spr_x_pixel_pos,x                  ; $02B828 |
  LDA !s_spr_y_pixel_pos,x                  ; $02B82B |
  SEC                                       ; $02B82E |
  SBC $72C2,x                               ; $02B82F |
  STA !s_spr_y_pixel_pos,x                  ; $02B832 |
  JSR CODE_02B8C7                           ; $02B835 |
  PLA                                       ; $02B838 |
  PLA                                       ; $02B839 |
  RTL                                       ; $02B83A |

CODE_02B83B:
  PHY                                       ; $02B83B |
  JSL $03A2F8                               ; $02B83C |
  PLY                                       ; $02B840 |
  BCS CODE_02B852                           ; $02B841 |
  LDA !s_spr_y_accel,y                      ; $02B843 |
  CMP #$0040                                ; $02B846 |
  BPL CODE_02B85C                           ; $02B849 |
  LDA !s_spr_facing_dir,x                   ; $02B84B |
  STA !s_spr_facing_dir,y                   ; $02B84E |
  RTS                                       ; $02B851 |

CODE_02B852:
  TYX                                       ; $02B852 |
  JSL $03A31E                               ; $02B853 |
  LDX $12                                   ; $02B857 |
  PLA                                       ; $02B859 |
  PLA                                       ; $02B85A |
  RTL                                       ; $02B85B |

CODE_02B85C:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02B85C |
  LDA !s_spr_oam_1,x                        ; $02B85E |
  ORA #$0004                                ; $02B861 |
  STA !s_spr_oam_1,x                        ; $02B864 |

CODE_02B867:
  PLA                                       ; $02B867 |
  JMP CODE_02B6AC                           ; $02B868 |

  dw $0000, $0000, $0000, $0000             ; $02B86B |
  dw $0000, $FFF6, $FFF6, $FFF4             ; $02B873 |
  dw $FFF4, $FFF4, $FFF3, $FFF4             ; $02B87B |
  dw $FFF8, $FFF8, $0000, $0000             ; $02B883 |
  dw $FFF6, $FFF5, $FFF6, $FFFA             ; $02B88B |
  dw $FFFA, $FFF6, $FFF6, $FFEE             ; $02B893 |
  dw $FFEF, $FFF0, $FFF0, $FFF0             ; $02B89B |
  dw $FFFB, $FFFA, $FFFC, $FFFC             ; $02B8A3 |
  dw $FFFC, $FFFD, $FFFC, $0000             ; $02B8AB |
  dw $0000, $FFF0, $FFE5, $FFFC             ; $02B8B3 |
  dw $FFFD, $FFFC, $0000, $0000             ; $02B8BB |
  dw $FFFC, $FFFC                           ; $02B8C3 |

CODE_02B8C7:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02B8C7 |
  BEQ CODE_02B90F                           ; $02B8C9 |
  LDA !s_spr_wildcard_1_lo,x                ; $02B8CB |
  CMP #$0006                                ; $02B8CE |
  BEQ CODE_02B90F                           ; $02B8D1 |
  LDA !s_spr_anim_frame,x                   ; $02B8D3 |
  CMP #$0017                                ; $02B8D6 |
  BCS CODE_02B8E1                           ; $02B8D9 |
  LDA #$001E                                ; $02B8DB |
  STA !s_spr_anim_frame,x                   ; $02B8DE |

CODE_02B8E1:
  ASL A                                     ; $02B8E1 |
  TAY                                       ; $02B8E2 |
  LDA !s_spr_facing_dir,x                   ; $02B8E3 |
  LSR A                                     ; $02B8E6 |
  LSR A                                     ; $02B8E7 |
  LDA $B83D,y                               ; $02B8E8 |
  BCC CODE_02B8F1                           ; $02B8EB |
  EOR #$FFFF                                ; $02B8ED |
  INC A                                     ; $02B8F0 |

CODE_02B8F1:
  PHA                                       ; $02B8F1 |
  LDA $B86B,y                               ; $02B8F2 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02B8F5 |
  CLC                                       ; $02B8F7 |
  ADC !s_spr_y_pixel_pos,x                  ; $02B8F8 |
  STA !s_spr_y_subpixel_pos,y               ; $02B8FB |
  PLA                                       ; $02B8FE |
  CLC                                       ; $02B8FF |
  ADC !s_spr_x_pixel_pos,x                  ; $02B900 |
  STA !s_spr_x_subpixel_pos,y               ; $02B903 |
  SEP #$20                                  ; $02B906 |
  LDA #$FF                                  ; $02B908 |
  STA $7861,y                               ; $02B90A |
  REP #$20                                  ; $02B90D |

CODE_02B90F:
  RTS                                       ; $02B90F |

  db $05, $06, $05, $06, $05, $06, $05, $06 ; $02B910 |
  db $05, $06, $06, $07, $07, $08, $09, $0A ; $02B918 |
  db $09, $08, $09, $0B, $0A, $0B, $0C, $0D ; $02B920 |
  db $0E, $0F, $10, $1A, $1B, $1A, $1B, $1A ; $02B928 |
  db $1B, $1A, $1B                          ; $02B930 |

  db $08, $08, $08, $08, $08, $08, $08, $08 ; $02B933 |
  db $10, $02, $02, $02, $02, $02, $02, $04 ; $02B93B |

  dw $0402, $2020, $0108, $0101             ; $02B943 |
  dw $0401, $1020, $1010, $1010             ; $02B94B |
  dw $1010, $0010, $0000, $0000             ; $02B953 |
  dw $0000, $0000, $0000, $0000             ; $02B95B |

  db $00, $00, $00, $00, $00, $00, $00, $05 ; $02B963 |
  db $00, $00, $00, $05, $00, $0C, $00, $0F ; $02B96B |
  db $00, $0F, $00, $FB, $FF, $F5, $FF, $F0 ; $02B973 |
  db $FF, $EC, $FF, $E9, $FF, $E7, $FF, $E6 ; $02B97B |
  db $FF, $E7, $FF, $E9, $FF, $E7, $FF, $EA ; $02B983 |
  db $FF, $E6, $FF, $EA, $FF, $EF, $FF, $FF ; $02B98B |
  db $FF, $0B, $00                          ; $02B993 |

  TYX                                       ; $02B996 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02B997 |
  CPY #$0A                                  ; $02B99A |
  BCC CODE_02B9A5                           ; $02B99C |
  CPY #$1A                                  ; $02B99E |
  BCS CODE_02B9A5                           ; $02B9A0 |
  JSR CODE_02B7D1                           ; $02B9A2 |

CODE_02B9A5:
  LDA !s_spr_timer_4,x                      ; $02B9A5 |
  BEQ CODE_02B9AD                           ; $02B9A8 |
  JMP CODE_02BA4B                           ; $02B9AA |

CODE_02B9AD:
  LDY !s_spr_gsu_morph_2_lo,x               ; $02B9AD |
  INY                                       ; $02B9B0 |
  CPY #$0A                                  ; $02B9B1 |
  BCS CODE_02B9B8                           ; $02B9B3 |
  JMP CODE_02BA21                           ; $02B9B5 |

CODE_02B9B8:
  BNE CODE_02B9D8                           ; $02B9B8 |
  PHY                                       ; $02B9BA |
  LDA !s_spr_y_pixel_pos,x                  ; $02B9BB |
  AND #$0010                                ; $02B9BE |
  BNE CODE_02B9C8                           ; $02B9C1 |
  LDA #$0060                                ; $02B9C3 |
  BRA CODE_02B9CB                           ; $02B9C6 |

CODE_02B9C8:
  LDA #$00F9                                ; $02B9C8 |

CODE_02B9CB:
  JSL spawn_sprite_init                     ; $02B9CB |
  JSR CODE_02AEA7                           ; $02B9CF |
  PLY                                       ; $02B9D2 |
  BCS CODE_02B9D8                           ; $02B9D3 |
  JMP CODE_02BA4B                           ; $02B9D5 |

CODE_02B9D8:
  CPY #$15                                  ; $02B9D8 |
  BCC CODE_02BA21                           ; $02B9DA |
  BNE CODE_02B9F4                           ; $02B9DC |
  LDA !s_spr_cam_x_pos,x                    ; $02B9DE |
  CMP #$00F0                                ; $02B9E1 |
  BCS CODE_02B9F2                           ; $02B9E4 |
  LDA !s_spr_cam_y_pos,x                    ; $02B9E6 |
  SEC                                       ; $02B9E9 |
  SBC #$0008                                ; $02B9EA |
  CMP #$00B0                                ; $02B9ED |
  BCC CODE_02B9F4                           ; $02B9F0 |

CODE_02B9F2:
  LDY #$12                                  ; $02B9F2 |

CODE_02B9F4:
  CPY #$1A                                  ; $02B9F4 |
  BNE CODE_02BA21                           ; $02B9F6 |
  PHY                                       ; $02B9F8 |
  LDA #$0075                                ; $02B9F9 |\ play sound #$0075
  JSL push_sound_queue                      ; $02B9FC |/
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BA00 |
  DEY                                       ; $02BA02 |
  TYX                                       ; $02BA03 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02BA04 |
  LDA !s_spr_y_pixel_pos,x                  ; $02BA06 |
  CLC                                       ; $02BA09 |
  ADC #$0002                                ; $02BA0A |
  STA !s_spr_y_pixel_pos,x                  ; $02BA0D |
  LDA #$0400                                ; $02BA10 |
  STA !s_spr_y_speed_lo,x                   ; $02BA13 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02BA16 |
  JSL $048072                               ; $02BA18 |
  LDX $12                                   ; $02BA1C |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02BA1E |
  PLY                                       ; $02BA20 |

CODE_02BA21:
  CPY #$0D                                  ; $02BA21 |
  BNE CODE_02BA2F                           ; $02BA23 |
  PHY                                       ; $02BA25 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BA26 |
  LDA #$0002                                ; $02BA28 |
  STA !s_spr_bg_layer,y                     ; $02BA2B |
  PLY                                       ; $02BA2E |

CODE_02BA2F:
  LDA $B90F,y                               ; $02BA2F |
  AND #$00FF                                ; $02BA32 |
  STA !s_spr_anim_frame,x                   ; $02BA35 |
  LDA $B932,y                               ; $02BA38 |
  AND #$00FF                                ; $02BA3B |
  STA !s_spr_timer_4,x                      ; $02BA3E |
  CPY #$24                                  ; $02BA41 |
  BCC CODE_02BA47                           ; $02BA43 |
  LDY #$00                                  ; $02BA45 |

CODE_02BA47:
  TYA                                       ; $02BA47 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02BA48 |

CODE_02BA4B:
  LDY !s_spr_gsu_morph_2_lo,x               ; $02BA4B |
  CPY #$0A                                  ; $02BA4E |
  BCC CODE_02BA7C                           ; $02BA50 |
  CPY #$1A                                  ; $02BA52 |
  BCS CODE_02BA7C                           ; $02BA54 |
  TYA                                       ; $02BA56 |
  ASL A                                     ; $02BA57 |
  TAY                                       ; $02BA58 |
  LDA !s_spr_facing_dir,x                   ; $02BA59 |
  LSR A                                     ; $02BA5C |
  LSR A                                     ; $02BA5D |
  LDA $B942,y                               ; $02BA5E |
  BCC CODE_02BA67                           ; $02BA61 |
  EOR #$FFFF                                ; $02BA63 |
  INC A                                     ; $02BA66 |

CODE_02BA67:
  PHA                                       ; $02BA67 |
  LDA $B962,y                               ; $02BA68 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BA6B |
  CLC                                       ; $02BA6D |
  ADC !s_spr_y_pixel_pos,x                  ; $02BA6E |
  STA !s_spr_y_subpixel_pos,y               ; $02BA71 |
  PLA                                       ; $02BA74 |
  CLC                                       ; $02BA75 |
  ADC !s_spr_x_pixel_pos,x                  ; $02BA76 |
  STA !s_spr_x_subpixel_pos,y               ; $02BA79 |

CODE_02BA7C:
  RTS                                       ; $02BA7C |

  dw $FE80, $0180                           ; $02BA7D |

  TYX                                       ; $02BA81 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BA82 |
  BEQ CODE_02BA89                           ; $02BA84 |
  JMP CODE_02BAE9                           ; $02BA86 |

CODE_02BA89:
  LDA #$0004                                ; $02BA89 |
  STA !s_spr_draw_priority,x                ; $02BA8C |
  JSR CODE_02BBCE                           ; $02BA8F |
  LDA $7860,x                               ; $02BA92 |
  ORA !s_spr_gsu_morph_1_lo,x               ; $02BA95 |
  AND #$0001                                ; $02BA98 |
  BEQ CODE_02BAD0                           ; $02BA9B |
  LDA !s_spr_timer_4,x                      ; $02BA9D |
  BEQ CODE_02BAA5                           ; $02BAA0 |
  JMP CODE_02B3DE                           ; $02BAA2 |

CODE_02BAA5:
  LDA !s_rng                                ; $02BAA5 |
  AND #$0001                                ; $02BAA8 |
  BEQ CODE_02BAB1                           ; $02BAAB |
  TYA                                       ; $02BAAD |
  STA !s_spr_facing_dir,x                   ; $02BAAE |

CODE_02BAB1:
  LDA #$FD00                                ; $02BAB1 |
  STA !s_spr_y_speed_lo,x                   ; $02BAB4 |
  LDA $10                                   ; $02BAB7 |
  AND #$0008                                ; $02BAB9 |
  BNE CODE_02BAD0                           ; $02BABC |
  LDA !s_spr_x_player_delta,x               ; $02BABE |
  CLC                                       ; $02BAC1 |
  ADC #$0060                                ; $02BAC2 |
  CMP #$00C1                                ; $02BAC5 |
  BCS CODE_02BAD0                           ; $02BAC8 |
  LDA #$FC00                                ; $02BACA |
  STA !s_spr_y_speed_lo,x                   ; $02BACD |

CODE_02BAD0:
  JSR CODE_02B42F                           ; $02BAD0 |
  LDY !s_spr_facing_dir,x                   ; $02BAD3 |
  LDA $7860,x                               ; $02BAD6 |
  AND $B36C,y                               ; $02BAD9 |
  BEQ CODE_02BAE2                           ; $02BADC |
  STZ !s_spr_x_speed_lo,x                   ; $02BADE |
  RTS                                       ; $02BAE1 |

CODE_02BAE2:
  LDA $BA7D,y                               ; $02BAE2 |
  STA !s_spr_x_speed_lo,x                   ; $02BAE5 |
  RTS                                       ; $02BAE8 |

CODE_02BAE9:
  LDA #$0003                                ; $02BAE9 |
  STA !s_spr_draw_priority,x                ; $02BAEC |
  JSR CODE_02B7D1                           ; $02BAEF |
  JSR CODE_02B7A7                           ; $02BAF2 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02BAF5 |
  CPY #$03                                  ; $02BAF7 |
  BCC CODE_02BAFE                           ; $02BAF9 |
  JMP CODE_02BB65                           ; $02BAFB |

CODE_02BAFE:
  JSR CODE_02B728                           ; $02BAFE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02BB01 |
  BNE CODE_02BB18                           ; $02BB03 |
  JSR CODE_02B259                           ; $02BB05 |
  BCC CODE_02BB15                           ; $02BB08 |
  LDA !s_spr_timer_3,x                      ; $02BB0A |
  BNE CODE_02BB15                           ; $02BB0D |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02BB0F |
  STZ !s_spr_timer_4,x                      ; $02BB11 |
  RTS                                       ; $02BB14 |

CODE_02BB15:
  JMP CODE_02B573                           ; $02BB15 |

CODE_02BB18:
  DEY                                       ; $02BB18 |
  BNE CODE_02BB62                           ; $02BB19 |
  STZ !s_spr_x_speed_lo,x                   ; $02BB1B |
  LDA $7860,x                               ; $02BB1E |
  AND #$0001                                ; $02BB21 |
  BEQ CODE_02BB55                           ; $02BB24 |
  JSR CODE_02B259                           ; $02BB26 |
  BCS CODE_02BB34                           ; $02BB29 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $02BB2B |
  LDA #$0020                                ; $02BB2D |
  STA !s_spr_timer_3,x                      ; $02BB30 |
  RTS                                       ; $02BB33 |

CODE_02BB34:
  LDA !s_spr_timer_4,x                      ; $02BB34 |
  BEQ CODE_02BB40                           ; $02BB37 |
  LDA #$0025                                ; $02BB39 |
  STA !s_spr_anim_frame,x                   ; $02BB3C |
  RTS                                       ; $02BB3F |

CODE_02BB40:
  LDA #$FC00                                ; $02BB40 |

CODE_02BB43:
  STA !s_spr_y_speed_lo,x                   ; $02BB43 |
  LDA !s_spr_x_player_dir,x                 ; $02BB46 |
  AND #$00FF                                ; $02BB49 |
  STA !s_spr_facing_dir,x                   ; $02BB4C |
  STZ $7860,x                               ; $02BB4F |
  STZ !s_spr_gsu_morph_1_lo,x               ; $02BB52 |

CODE_02BB55:
  LDA #$0010                                ; $02BB55 |
  STA !s_spr_timer_4,x                      ; $02BB58 |
  LDA #$0026                                ; $02BB5B |
  STA !s_spr_anim_frame,x                   ; $02BB5E |
  RTS                                       ; $02BB61 |

CODE_02BB62:
  JMP CODE_02B5A9                           ; $02BB62 |

CODE_02BB65:
  LDA #$0004                                ; $02BB65 |
  STA !s_spr_draw_priority,x                ; $02BB68 |

CODE_02BB6B:
  CPY #$03                                  ; $02BB6B |
  BNE CODE_02BBAE                           ; $02BB6D |
  JSR CODE_02B37F                           ; $02BB6F |
  BCS CODE_02BB8F                           ; $02BB72 |
  JSR CODE_02B13D                           ; $02BB74 |

CODE_02BB77:
  LDA #$0002                                ; $02BB77 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02BB7A |
  LDA #$FC00                                ; $02BB7C |
  JSR CODE_02BB43                           ; $02BB7F |
  LDA !s_spr_facing_dir,x                   ; $02BB82 |
  EOR #$0002                                ; $02BB85 |
  STA !s_spr_facing_dir,x                   ; $02BB88 |
  TAY                                       ; $02BB8B |
  JMP CODE_02BAE2                           ; $02BB8C |

CODE_02BB8F:
  JSR CODE_02B325                           ; $02BB8F |
  BCS CODE_02BBA6                           ; $02BB92 |
  LDA !s_spr_timer_3,x                      ; $02BB94 |
  BNE CODE_02BBAB                           ; $02BB97 |
  LDA !s_player_jump_state                  ; $02BB99 |
  BNE CODE_02BBA6                           ; $02BB9C |
  LDA !s_spr_y_player_delta,x               ; $02BB9E |
  CMP #$FFC0                                ; $02BBA1 |
  BPL CODE_02BBAB                           ; $02BBA4 |

CODE_02BBA6:
  INC !s_spr_wildcard_4_lo_dp,x             ; $02BBA6 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02BBA8 |
  RTS                                       ; $02BBAA |

CODE_02BBAB:
  JMP CODE_02B0E4                           ; $02BBAB |

CODE_02BBAE:
  LDA !s_player_jump_state                  ; $02BBAE |
  BNE CODE_02BBBD                           ; $02BBB1 |
  LDA !s_spr_y_player_delta,x               ; $02BBB3 |
  CMP #$FFC0                                ; $02BBB6 |
  BMI CODE_02BBBD                           ; $02BBB9 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $02BBBB |

CODE_02BBBD:
  JSR CODE_02B10F                           ; $02BBBD |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02BBC0 |
  BNE CODE_02BBCD                           ; $02BBC2 |
  JSR CODE_02BB55                           ; $02BBC4 |
  LDY !s_spr_facing_dir,x                   ; $02BBC7 |
  JMP CODE_02BAE2                           ; $02BBCA |

CODE_02BBCD:
  RTS                                       ; $02BBCD |

CODE_02BBCE:
  LDA $61CC                                 ; $02BBCE |
  BNE CODE_02BBDB                           ; $02BBD1 |
  LDA !s_baby_mario_state                   ; $02BBD3 |
  AND #$6000                                ; $02BBD6 |
  BEQ CODE_02BBE0                           ; $02BBD9 |

CODE_02BBDB:
  LDY !s_spr_facing_dir,x                   ; $02BBDB |
  SEC                                       ; $02BBDE |
  RTS                                       ; $02BBDF |

CODE_02BBE0:
  LDY #$02                                  ; $02BBE0 |
  LDA !s_spr_x_hitbox_center                ; $02BBE2 |
  SEC                                       ; $02BBE5 |
  SBC !s_spr_x_hitbox_center,x              ; $02BBE6 |
  BPL CODE_02BBF1                           ; $02BBE9 |
  LDY #$00                                  ; $02BBEB |
  EOR #$FFFF                                ; $02BBED |
  INC A                                     ; $02BBF0 |

CODE_02BBF1:
  CMP #$0008                                ; $02BBF1 |
  BCS CODE_02BC21                           ; $02BBF4 |
  LDA !s_spr_y_hitbox_center                ; $02BBF6 |
  SEC                                       ; $02BBF9 |
  SBC !s_spr_y_hitbox_center,x              ; $02BBFA |
  CLC                                       ; $02BBFD |
  ADC #$0008                                ; $02BBFE |
  CMP #$0011                                ; $02BC01 |
  BCS CODE_02BC21                           ; $02BC04 |

CODE_02BC06:
  LDA #$0001                                ; $02BC06 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02BC09 |
  LDA !s_spr_oam_1,x                        ; $02BC0B |
  AND #$FFF3                                ; $02BC0E |
  STA !s_spr_oam_1,x                        ; $02BC11 |
  LDA !s_spr_wildcard_2_lo,x                ; $02BC14 |
  PHA                                       ; $02BC17 |
  JSL $06BE72                               ; $02BC18 |
  PLA                                       ; $02BC1C |
  STA !s_spr_wildcard_2_lo,x                ; $02BC1D |
  CLC                                       ; $02BC20 |

CODE_02BC21:
  RTS                                       ; $02BC21 |

  JSR CODE_02BC06                           ; $02BC22 |
  RTL                                       ; $02BC25 |

  db $2B, $2A, $2B, $2A, $2B, $2A, $2B, $2A ; $02BC26 |
  db $2C, $29, $2C, $29, $2C, $29, $2C, $29 ; $02BC2E |
  db $2C, $28, $27                          ; $02BC36 |

  db $03, $03, $03, $03, $03, $03, $03, $03 ; $02BC39 |
  db $10, $04, $04, $04, $04, $04, $04, $04 ; $02BC41 |
  db $04, $08, $10                          ; $02BC49 |

  dw $FFF4, $000C, $FFFF, $FFFF             ; $02BC4C |
  dw $FFFE, $FFFE, $FFFD, $0002             ; $02BC54 |
  dw $0002, $0001, $0001                    ; $02BC5C |

  dw $FFF0, $0010                           ; $02BC62 |

  TYX                                       ; $02BC66 |
  JSR CODE_02B7D1                           ; $02BC67 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02BC6A |
  BEQ CODE_02BC71                           ; $02BC6C |
  JMP CODE_02BD79                           ; $02BC6E |

CODE_02BC71:
  LDY !s_spr_gsu_morph_2_lo,x               ; $02BC71 |
  BNE CODE_02BC79                           ; $02BC74 |
  JMP CODE_02BD01                           ; $02BC76 |

CODE_02BC79:
  LDA !s_spr_timer_4,x                      ; $02BC79 |
  BEQ CODE_02BC7F                           ; $02BC7C |
  RTS                                       ; $02BC7E |

CODE_02BC7F:
  DEY                                       ; $02BC7F |
  TYA                                       ; $02BC80 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02BC81 |
  BNE CODE_02BC8D                           ; $02BC84 |
  LDA #$0040                                ; $02BC86 |
  STA !s_spr_timer_4,x                      ; $02BC89 |
  RTS                                       ; $02BC8C |

CODE_02BC8D:
  LDA $BC38,y                               ; $02BC8D |
  AND #$00FF                                ; $02BC90 |
  STA !s_spr_timer_4,x                      ; $02BC93 |
  LDA $BC25,y                               ; $02BC96 |
  AND #$00FF                                ; $02BC99 |
  STA !s_spr_anim_frame,x                   ; $02BC9C |
  CMP #$0019                                ; $02BC9F |
  BNE CODE_02BCAD                           ; $02BCA2 |
  PHA                                       ; $02BCA4 |
  LDA #$0014                                ; $02BCA5 |\ play sound #$0014
  JSL push_sound_queue                      ; $02BCA8 |/
  PLA                                       ; $02BCAC |

CODE_02BCAD:
  CMP #$002A                                ; $02BCAD |
  BNE CODE_02BD00                           ; $02BCB0 |
  LDA #$0107                                ; $02BCB2 |
  JSL spawn_sprite_active                   ; $02BCB5 |
  BCC CODE_02BD00                           ; $02BCB9 |
  LDA !s_spr_facing_dir,x                   ; $02BCBB |
  EOR #$0002                                ; $02BCBE |
  STA !s_spr_facing_dir,y                   ; $02BCC1 |
  TAX                                       ; $02BCC4 |
  LDA !s_cur_spr_x_prev                     ; $02BCC5 |
  CLC                                       ; $02BCC8 |
  ADC $BC4C,x                               ; $02BCC9 |
  STA !s_spr_x_pixel_pos,y                  ; $02BCCC |
  LDA !s_cur_spr_y_prev                     ; $02BCCF |
  SEC                                       ; $02BCD2 |
  SBC #$0001                                ; $02BCD3 |
  STA !s_spr_y_pixel_pos,y                  ; $02BCD6 |
  LDA $B46A,x                               ; $02BCD9 |
  STA !s_spr_x_speed_lo,y                   ; $02BCDC |
  LDA #$0001                                ; $02BCDF |
  STA !s_spr_collision_state,y              ; $02BCE2 |
  STA !s_spr_gsu_morph_2_lo,y               ; $02BCE5 |
  LDA !s_spr_bitwise_settings_1,y           ; $02BCE8 |
  AND #$F9FF                                ; $02BCEB |
  STA !s_spr_bitwise_settings_1,y           ; $02BCEE |
  LDA #$FFFF                                ; $02BCF1 |
  STA $7862,y                               ; $02BCF4 |
  LDA #$0045                                ; $02BCF7 |\ play sound #$0045
  JSL push_sound_queue                      ; $02BCFA |/
  LDX $12                                   ; $02BCFE |

CODE_02BD00:
  RTS                                       ; $02BD00 |

CODE_02BD01:
  LDA !s_spr_timer_4,x                      ; $02BD01 |
  BEQ CODE_02BD1F                           ; $02BD04 |
  LDY #$2C                                  ; $02BD06 |
  CMP #$0020                                ; $02BD08 |
  BCS CODE_02BD1A                           ; $02BD0B |
  LDA !s_spr_x_player_dir,x                 ; $02BD0D |
  AND #$00FF                                ; $02BD10 |
  CMP !s_spr_facing_dir,x                   ; $02BD13 |
  BEQ CODE_02BD1A                           ; $02BD16 |
  LDY #$2D                                  ; $02BD18 |

CODE_02BD1A:
  TYA                                       ; $02BD1A |
  STA !s_spr_anim_frame,x                   ; $02BD1B |
  RTS                                       ; $02BD1E |

CODE_02BD1F:
  LDA !s_spr_x_player_dir,x                 ; $02BD1F |
  AND #$00FF                                ; $02BD22 |
  CMP !s_spr_facing_dir,x                   ; $02BD25 |
  BNE CODE_02BD3F                           ; $02BD28 |
  LDY !s_spr_facing_dir,x                   ; $02BD2A |
  LDA $7860,x                               ; $02BD2D |
  AND $B36C,y                               ; $02BD30 |
  BNE CODE_02BD72                           ; $02BD33 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02BD35 |
  LDA #$0009                                ; $02BD37 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02BD3A |
  BRA CODE_02BD6B                           ; $02BD3D |

CODE_02BD3F:
  JSR CODE_02B259                           ; $02BD3F |
  BCS CODE_02BD72                           ; $02BD42 |
  LDA !s_spr_y_player_delta,x               ; $02BD44 |
  CLC                                       ; $02BD47 |
  ADC #$0008                                ; $02BD48 |
  CMP #$0011                                ; $02BD4B |
  BCC CODE_02BD72                           ; $02BD4E |
  LDY !s_spr_y_player_dir,x                 ; $02BD50 |
  LDA !s_spr_y_pixel_pos,x                  ; $02BD53 |
  CLC                                       ; $02BD56 |
  ADC $BC62,y                               ; $02BD57 |
  LDY !s_spr_facing_dir,x                   ; $02BD5A |
  JSR CODE_02ADC4                           ; $02BD5D |
  BCC CODE_02BD72                           ; $02BD60 |
  LDA !s_spr_y_player_dir,x                 ; $02BD62 |
  CLC                                       ; $02BD65 |
  ADC #$0002                                ; $02BD66 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02BD69 |

CODE_02BD6B:
  LDA #$0019                                ; $02BD6B |
  STA !s_spr_anim_frame,x                   ; $02BD6E |
  RTS                                       ; $02BD71 |

CODE_02BD72:
  LDA #$0014                                ; $02BD72 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02BD75 |
  RTS                                       ; $02BD78 |

CODE_02BD79:
  DEY                                       ; $02BD79 |
  BNE CODE_02BDAB                           ; $02BD7A |
  DEC !s_spr_gsu_morph_2_lo,x               ; $02BD7C |
  BNE CODE_02BD85                           ; $02BD7F |

CODE_02BD81:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02BD81 |
  BRA CODE_02BD72                           ; $02BD83 |

CODE_02BD85:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02BD85 |
  ASL A                                     ; $02BD88 |
  TAY                                       ; $02BD89 |
  CPY #$08                                  ; $02BD8A |
  BNE CODE_02BD97                           ; $02BD8C |
  LDA !s_spr_facing_dir,x                   ; $02BD8E |
  EOR #$0002                                ; $02BD91 |
  STA !s_spr_facing_dir,x                   ; $02BD94 |

CODE_02BD97:
  LDA $BC50,y                               ; $02BD97 |
  LDY !s_spr_facing_dir,x                   ; $02BD9A |
  BNE CODE_02BDA3                           ; $02BD9D |
  EOR #$FFFF                                ; $02BD9F |
  INC A                                     ; $02BDA2 |

CODE_02BDA3:
  CLC                                       ; $02BDA3 |
  ADC !s_spr_x_pixel_pos,x                  ; $02BDA4 |
  STA !s_spr_x_pixel_pos,x                  ; $02BDA7 |
  RTS                                       ; $02BDAA |

CODE_02BDAB:
  DEY                                       ; $02BDAB |
  BNE CODE_02BDB3                           ; $02BDAC |
  JSR CODE_02B0E4                           ; $02BDAE |
  BRA CODE_02BDD9                           ; $02BDB1 |

CODE_02BDB3:
  LDA !s_spr_timer_4,x                      ; $02BDB3 |
  BNE CODE_02BDD9                           ; $02BDB6 |
  LDA #$0004                                ; $02BDB8 |

CODE_02BDBB:
  STA !s_spr_timer_4,x                      ; $02BDBB |
  LDA !s_spr_anim_frame,x                   ; $02BDBE |
  DEC A                                     ; $02BDC1 |
  CMP #$0017                                ; $02BDC2 |
  BCS CODE_02BDCA                           ; $02BDC5 |
  LDA #$0019                                ; $02BDC7 |

CODE_02BDCA:
  STA !s_spr_anim_frame,x                   ; $02BDCA |
  ASL A                                     ; $02BDCD |
  TAY                                       ; $02BDCE |
  LDA !s_spr_y_pixel_pos,x                  ; $02BDCF |
  CLC                                       ; $02BDD2 |
  ADC $B026,y                               ; $02BDD3 |
  STA !s_spr_y_pixel_pos,x                  ; $02BDD6 |

CODE_02BDD9:
  LDY !s_spr_facing_dir,x                   ; $02BDD9 |
  JSR CODE_02ADC1                           ; $02BDDC |
  BCS CODE_02BDEA                           ; $02BDDF |
  LDA !s_cur_spr_y_prev                     ; $02BDE1 |
  STA !s_spr_y_pixel_pos,x                  ; $02BDE4 |

CODE_02BDE7:
  JMP CODE_02BD81                           ; $02BDE7 |

CODE_02BDEA:
  JSR CODE_02B259                           ; $02BDEA |
  BCS CODE_02BDE7                           ; $02BDED |
  LDA !s_spr_y_player_dir,x                 ; $02BDEF |
  AND #$00FF                                ; $02BDF2 |
  CLC                                       ; $02BDF5 |
  ADC #$0002                                ; $02BDF6 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $02BDF9 |
  BNE CODE_02BDE7                           ; $02BDFB |
  RTS                                       ; $02BDFD |

  dw $FF80, $0080                           ; $02BDFE |

  TYX                                       ; $02BE02 |

CODE_02BE03:
  JSR CODE_02B259                           ; $02BE03 |
  BCS CODE_02BE69                           ; $02BE06 |

CODE_02BE08:
  JSR CODE_02B6E4                           ; $02BE08 |
  SEP #$20                                  ; $02BE0B |
  LDA #$FF                                  ; $02BE0D |
  STA $7862,x                               ; $02BE0F |
  REP #$20                                  ; $02BE12 |
  LDY !s_spr_facing_dir,x                   ; $02BE14 |
  LDA $7860,x                               ; $02BE17 |
  AND $B36C,y                               ; $02BE1A |
  BEQ CODE_02BE40                           ; $02BE1D |

CODE_02BE1F:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02BE1F |
  STZ !s_spr_x_accel_ceiling,x              ; $02BE21 |
  STZ !s_spr_x_accel,x                      ; $02BE24 |
  LDA #$0040                                ; $02BE27 |
  STA !s_spr_y_accel,x                      ; $02BE2A |
  LDA #$0400                                ; $02BE2D |
  STA !s_spr_y_accel_ceiling,x              ; $02BE30 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BE33 |
  BNE CODE_02BE3D                           ; $02BE35 |
  LDA #$FC00                                ; $02BE37 |
  JMP CODE_02B423                           ; $02BE3A |

CODE_02BE3D:
  JMP CODE_02BB77                           ; $02BE3D |

CODE_02BE40:
  LDA !s_spr_x_player_dir,x                 ; $02BE40 |
  AND #$00FF                                ; $02BE43 |
  EOR #$0002                                ; $02BE46 |
  STA !s_spr_facing_dir,x                   ; $02BE49 |
  TAY                                       ; $02BE4C |

CODE_02BE4D:
  LDA $BDFE,y                               ; $02BE4D |
  STA !s_spr_x_accel_ceiling,x              ; $02BE50 |

CODE_02BE53:
  LDA !s_spr_x_speed_lo,x                   ; $02BE53 |
  CLC                                       ; $02BE56 |
  ADC #$0080                                ; $02BE57 |
  CMP #$0101                                ; $02BE5A |
  LDA #$0004                                ; $02BE5D |
  BCC CODE_02BE65                           ; $02BE60 |
  LDA #$0020                                ; $02BE62 |

CODE_02BE65:
  STA !s_spr_x_accel,x                      ; $02BE65 |
  RTS                                       ; $02BE68 |

CODE_02BE69:
  SEP #$20                                  ; $02BE69 |
  LDA #$FF                                  ; $02BE6B |
  STA $7862,x                               ; $02BE6D |
  REP #$20                                  ; $02BE70 |
  LDA !s_spr_x_player_dir,x                 ; $02BE72 |
  AND #$00FF                                ; $02BE75 |
  STA !s_spr_facing_dir,x                   ; $02BE78 |
  STZ !s_spr_x_accel_ceiling,x              ; $02BE7B |
  BRA CODE_02BE53                           ; $02BE7E |
  TYX                                       ; $02BE80 |
  JSR CODE_02B7D1                           ; $02BE81 |
  JMP CODE_02BE03                           ; $02BE84 |
  TYX                                       ; $02BE87 |
  RTS                                       ; $02BE88 |

  TYX                                       ; $02BE89 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02BE8A |
  BNE CODE_02BEB2                           ; $02BE8C |
  LDA #$0004                                ; $02BE8E |
  STA !s_spr_draw_priority,x                ; $02BE91 |
  SEP #$20                                  ; $02BE94 |
  LDA #$FF                                  ; $02BE96 |
  STA $7862,x                               ; $02BE98 |
  REP #$20                                  ; $02BE9B |
  JSR CODE_02BBCE                           ; $02BE9D |
  TYA                                       ; $02BEA0 |
  STA !s_spr_facing_dir,x                   ; $02BEA1 |
  LDA $7860,x                               ; $02BEA4 |
  AND $B36C,y                               ; $02BEA7 |
  BEQ CODE_02BEAF                           ; $02BEAA |
  JMP CODE_02BE1F                           ; $02BEAC |

CODE_02BEAF:
  JMP CODE_02BE4D                           ; $02BEAF |

CODE_02BEB2:
  LDA #$0003                                ; $02BEB2 |
  STA !s_spr_draw_priority,x                ; $02BEB5 |
  JSR CODE_02B7D1                           ; $02BEB8 |
  JSR CODE_02B7A7                           ; $02BEBB |
  JSR CODE_02B259                           ; $02BEBE |
  BCS CODE_02BEC6                           ; $02BEC1 |
  JMP CODE_02BE08                           ; $02BEC3 |

CODE_02BEC6:
  JMP CODE_02BE69                           ; $02BEC6 |
  TYX                                       ; $02BEC9 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02BECA |
  BEQ CODE_02BEFD                           ; $02BECD |
  CPY #$04                                  ; $02BECF |
  BCS CODE_02BED9                           ; $02BED1 |
  LDA #$0080                                ; $02BED3 |
  STA !s_spr_y_accel_ceiling,x              ; $02BED6 |

CODE_02BED9:
  LDA !s_spr_timer_4,x                      ; $02BED9 |
  BNE CODE_02BEE7                           ; $02BEDC |
  DEC !s_spr_gsu_morph_2_lo,x               ; $02BEDE |
  LDA #$0010                                ; $02BEE1 |
  STA !s_spr_timer_4,x                      ; $02BEE4 |

CODE_02BEE7:
  JSR CODE_02B6E4                           ; $02BEE7 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02BEEA |
  AND #$0008                                ; $02BEEC |
  BEQ CODE_02BEF7                           ; $02BEEF |
  LDA #$0020                                ; $02BEF1 |
  STA !s_spr_anim_frame,x                   ; $02BEF4 |

CODE_02BEF7:
  STZ !s_spr_x_accel_ceiling,x              ; $02BEF7 |
  JMP CODE_02BE53                           ; $02BEFA |

CODE_02BEFD:
  JMP CODE_02BE08                           ; $02BEFD |

init_nep_enut:
  LDA !s_spr_x_pixel_pos,x                  ; $02BF00 |
  AND #$0010                                ; $02BF03 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02BF06 |
  RTL                                       ; $02BF08 |

  dw $7D8F, $7D8F, $7D8F, $7D8F             ; $02BF09 |
  dw $7D8F, $7D8F, $7D8F, $7D8F             ; $02BF11 |
  dw $001F, $001E, $001D, $001C             ; $02BF19 |
  dw $001B, $001C, $001D, $001E             ; $02BF21 |
  dw $7FFF                                  ; $02BF29 |

  dw $6CAA, $6CAA, $6CAA, $6CAA             ; $02BF2B |
  dw $6CAA, $6CAA, $6CAA, $6CAA             ; $02BF33 |
  dw $0015, $0016, $0017, $0018             ; $02BF3B |
  dw $0019, $0018, $0017, $0016             ; $02BF43 |
  dw $7FFF                                  ; $02BF4B |

  dw $7F2F, $7F2F, $7F2F, $7F2F             ; $02BF4D |
  dw $7F2F, $7F2F, $7F2F, $7F2F             ; $02BF55 |
  dw $01DF, $01DF, $01DF, $01DF             ; $02BF5D |
  dw $01DF, $01DF, $01DF, $01DF             ; $02BF65 |
  dw $7FFF                                  ; $02BF6D |

  dw $0000, $0001, $0002, $0002             ; $02BF6F |
  dw $0001, $0000, $0000, $0001             ; $02BF77 |
  dw $0002, $0002, $0001, $000A             ; $02BF7F |
  dw $0016                                  ; $02BF87 |

  dw $FFC0, $0040                           ; $02BF89 |

  dw $0001, $FFFF                           ; $02BF8D |

main_nep_enut:
  JSR CODE_02C1F4                           ; $02BF91 |
  JSL $03AF23                               ; $02BF94 |
  LDY #$02                                  ; $02BF98 |
  LDA !s_spr_cam_x_pos,x                    ; $02BF9A |
  CLC                                       ; $02BF9D |
  ADC #$0050                                ; $02BF9E |
  BMI CODE_02BFAB                           ; $02BFA1 |
  SEC                                       ; $02BFA3 |
  SBC #$01A0                                ; $02BFA4 |
  BMI CODE_02BFB9                           ; $02BFA7 |
  LDY #$00                                  ; $02BFA9 |

CODE_02BFAB:
  EOR #$FFFF                                ; $02BFAB |
  INC A                                     ; $02BFAE |
  STA $02                                   ; $02BFAF |
  STZ !s_spr_x_speed_lo,x                   ; $02BFB1 |
  STZ !s_spr_x_accel,x                      ; $02BFB4 |
  BRA CODE_02BFC4                           ; $02BFB7 |

CODE_02BFB9:
  STZ $02                                   ; $02BFB9 |
  LDY #$00                                  ; $02BFBB |
  LDA !s_spr_x_speed_lo,x                   ; $02BFBD |
  BMI CODE_02BFC4                           ; $02BFC0 |
  LDY #$02                                  ; $02BFC2 |

CODE_02BFC4:
  STY $00                                   ; $02BFC4 |
  LDA !s_spr_x_hitbox_center,x              ; $02BFC6 |
  CLC                                       ; $02BFC9 |
  ADC $BF89,y                               ; $02BFCA |
  STA !gsu_r8                               ; $02BFCD |
  LDA !s_spr_y_hitbox_center,x              ; $02BFD0 |
  STA !gsu_r0                               ; $02BFD3 |
  LDX #$0A                                  ; $02BFD6 |
  LDA #$CE2F                                ; $02BFD8 |
  JSL r_gsu_init_3                          ; $02BFDB | GSU init
  LDX $12                                   ; $02BFDF |
  LDA !gsu_r5                               ; $02BFE1 |
  BEQ CODE_02BFF0                           ; $02BFE4 |
  STZ !s_spr_x_speed_lo,x                   ; $02BFE6 |
  LDY $00                                   ; $02BFE9 |
  LDA $BF8D,y                               ; $02BFEB |
  STA $02                                   ; $02BFEE |

CODE_02BFF0:
  LDA !s_spr_x_pixel_pos,x                  ; $02BFF0 |
  CLC                                       ; $02BFF3 |
  ADC $02                                   ; $02BFF4 |
  STA !s_spr_x_pixel_pos,x                  ; $02BFF6 |
  TXY                                       ; $02BFF9 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02BFFA |
  ASL A                                     ; $02BFFC |
  TAX                                       ; $02BFFD |
  JSR ($C0A0,x)                             ; $02BFFE |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02C001 |
  LDA !s_spr_timer_4,x                      ; $02C004 |
  BEQ CODE_02C015                           ; $02C007 |
  AND #$FFFE                                ; $02C009 |
  TAY                                       ; $02C00C |
  LDA $BF6F,y                               ; $02C00D |
  STA !s_spr_anim_frame,x                   ; $02C010 |
  BRA CODE_02C028                           ; $02C013 |

CODE_02C015:
  LDA $10                                   ; $02C015 |
  AND #$003F                                ; $02C017 |
  BNE CODE_02C028                           ; $02C01A |
  LDA $14                                   ; $02C01C |
  AND #$0002                                ; $02C01E |
  TAY                                       ; $02C021 |
  LDA $BF85,y                               ; $02C022 |
  STA !s_spr_timer_4,x                      ; $02C025 |

CODE_02C028:
  TXA                                       ; $02C028 |
  STA $6012                                 ; $02C029 |
  LDA !s_player_x_cam_rel                   ; $02C02C |
  STA $6014                                 ; $02C02F |
  LDA !s_player_y_cam_rel                   ; $02C032 |
  STA $6016                                 ; $02C035 |
  LDA !s_player_duck_state                  ; $02C038 |
  STA $6018                                 ; $02C03B |
  LDX #$0A                                  ; $02C03E |
  LDA #$8390                                ; $02C040 |
  JSL r_gsu_init_1                          ; $02C043 | GSU init
  LDX $12                                   ; $02C047 |
  LDA $601A                                 ; $02C049 |
  BEQ CODE_02C055                           ; $02C04C |
  INC !s_spr_gsu_morph_2_lo,x               ; $02C04E |
  JSL player_hit_sprite                     ; $02C051 |

CODE_02C055:
  LDY !s_spr_collision_id,x                 ; $02C055 |
  DEY                                       ; $02C058 |
  BMI CODE_02C06B                           ; $02C059 |
  LDA !s_spr_collision_state,y              ; $02C05B |
  BEQ CODE_02C06B                           ; $02C05E |
  LDA #$FFFF                                ; $02C060 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02C063 |
  TYX                                       ; $02C066 |
  JSL $03B25B                               ; $02C067 |

CODE_02C06B:
  LDY #$20                                  ; $02C06B |
  LDA !s_spr_timer_3,x                      ; $02C06D |
  AND #$0004                                ; $02C070 |
  BNE CODE_02C07E                           ; $02C073 |
  LDA $14                                   ; $02C075 |
  LSR A                                     ; $02C077 |
  AND #$000E                                ; $02C078 |
  ORA !s_spr_wildcard_6_lo_dp,x             ; $02C07B |
  TAY                                       ; $02C07D |

CODE_02C07E:
  LDA $BF09,y                               ; $02C07E |
  STA $702002                               ; $02C081 |
  STA $702D6E                               ; $02C085 |
  LDA $BF2B,y                               ; $02C089 |
  STA $702004                               ; $02C08C |
  STA $702D70                               ; $02C090 |
  LDA $BF4D,y                               ; $02C094 |
  STA $702006                               ; $02C097 |
  STA $702D72                               ; $02C09B |
  RTL                                       ; $02C09F |

  dw $C0A8                                  ; $02C0A0 |
  dw $C141                                  ; $02C0A2 |

  dw $FE00, $0200                           ; $02C0A4 |

  TYX                                       ; $02C0A8 |
  LDA !s_spr_timer_2,x                      ; $02C0A9 |
  BNE CODE_02C0C3                           ; $02C0AC |
  LDY !s_spr_x_player_dir,x                 ; $02C0AE |
  LDA $C0A4,y                               ; $02C0B1 |
  STA !s_spr_x_accel_ceiling,x              ; $02C0B4 |
  LDA #$0020                                ; $02C0B7 |
  STA !s_spr_x_accel,x                      ; $02C0BA |
  LDA #$0040                                ; $02C0BD |
  STA !s_spr_timer_2,x                      ; $02C0C0 |

CODE_02C0C3:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02C0C3 |
  BNE CODE_02C0DC                           ; $02C0C5 |
  LDA !s_spr_wildcard_3_lo,x                ; $02C0C7 |
  CLC                                       ; $02C0CA |
  ADC #$0004                                ; $02C0CB |
  CMP #$0101                                ; $02C0CE |
  BCC CODE_02C0D8                           ; $02C0D1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02C0D3 |
  LDA #$0000                                ; $02C0D5 |

CODE_02C0D8:
  STA !s_spr_wildcard_3_lo,x                ; $02C0D8 |
  RTS                                       ; $02C0DB |

CODE_02C0DC:
  LDY $00                                   ; $02C0DC |
  TYA                                       ; $02C0DE |
  CMP !s_spr_facing_dir,x                   ; $02C0DF |
  BEQ CODE_02C0F5                           ; $02C0E2 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02C0E4 |
  CLC                                       ; $02C0E6 |
  ADC #$0008                                ; $02C0E7 |
  CMP #$0101                                ; $02C0EA |
  BCC CODE_02C102                           ; $02C0ED |
  TYA                                       ; $02C0EF |
  STA !s_spr_facing_dir,x                   ; $02C0F0 |
  BRA CODE_02C0FF                           ; $02C0F3 |

CODE_02C0F5:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02C0F5 |
  BEQ CODE_02C105                           ; $02C0F7 |
  SEC                                       ; $02C0F9 |
  SBC #$0004                                ; $02C0FA |
  BPL CODE_02C102                           ; $02C0FD |

CODE_02C0FF:
  LDA #$0000                                ; $02C0FF |

CODE_02C102:
  STA !s_spr_wildcard_3_lo_dp,x             ; $02C102 |
  RTS                                       ; $02C104 |

CODE_02C105:
  LDA !s_spr_timer_1,x                      ; $02C105 |
  BNE CODE_02C13C                           ; $02C108 |
  LDY !s_spr_x_player_dir,x                 ; $02C10A |
  TYA                                       ; $02C10D |
  CMP !s_spr_facing_dir,x                   ; $02C10E |
  BNE CODE_02C13C                           ; $02C111 |
  LDA !s_spr_x_player_delta,x               ; $02C113 |
  CLC                                       ; $02C116 |
  ADC #$0090                                ; $02C117 |
  CMP #$0121                                ; $02C11A |
  BCS CODE_02C13C                           ; $02C11D |
  LDA #$0048                                ; $02C11F |\ play sound #$0048
  JSL push_sound_queue                      ; $02C122 |/
  INC !s_spr_wildcard_4_lo_dp,x             ; $02C126 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $02C128 |
  LDA #$0003                                ; $02C12B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02C12E |
  STZ !s_spr_x_speed_lo,x                   ; $02C130 |
  STZ !s_spr_x_accel,x                      ; $02C133 |
  LDA #$0080                                ; $02C136 |
  STA !s_spr_timer_2,x                      ; $02C139 |

CODE_02C13C:
  RTS                                       ; $02C13C |

  dw $FF00, $0100                           ; $02C13D |

  TYX                                       ; $02C141 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02C142 |
  CPY #$04                                  ; $02C144 |
  BCC CODE_02C16C                           ; $02C146 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02C148 |
  BNE CODE_02C16C                           ; $02C14B |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02C14D |
  BEQ CODE_02C16C                           ; $02C150 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02C152 |
  BPL CODE_02C166                           ; $02C155 |
  PHY                                       ; $02C157 |
  LDA #$007A                                ; $02C158 |\ play sound #$007A
  JSL push_sound_queue                      ; $02C15B |/
  PLY                                       ; $02C15F |
  LDA #$0040                                ; $02C160 |
  STA !s_spr_timer_3,x                      ; $02C163 |

CODE_02C166:
  STZ !s_spr_x_speed_lo,x                   ; $02C166 |
  STZ !s_spr_x_accel,x                      ; $02C169 |

CODE_02C16C:
  CPY #$07                                  ; $02C16C |
  BCS CODE_02C178                           ; $02C16E |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02C170 |
  BPL CODE_02C178                           ; $02C173 |
  LDA #$0020                                ; $02C175 |

CODE_02C178:
  CLC                                       ; $02C178 |
  ADC #$0008                                ; $02C179 |
  CLC                                       ; $02C17C |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $02C17D |
  CMP #$0101                                ; $02C17F |
  BCC CODE_02C1E9                           ; $02C182 |
  INY                                       ; $02C184 |
  CPY #$09                                  ; $02C185 |
  BCS CODE_02C1C7                           ; $02C187 |
  CPY #$05                                  ; $02C189 |
  BCC CODE_02C1E3                           ; $02C18B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02C18D |
  BNE CODE_02C1BF                           ; $02C190 |
  LDA !s_spr_timer_2,x                      ; $02C192 |
  BNE CODE_02C1B7                           ; $02C195 |
  LDA !s_spr_x_player_dir,x                 ; $02C197 |
  AND #$00FF                                ; $02C19A |
  CMP !s_spr_facing_dir,x                   ; $02C19D |
  BNE CODE_02C1BF                           ; $02C1A0 |
  PHY                                       ; $02C1A2 |
  TAY                                       ; $02C1A3 |
  LDA $C13D,y                               ; $02C1A4 |
  STA !s_spr_x_accel_ceiling,x              ; $02C1A7 |
  LDA #$0010                                ; $02C1AA |
  STA !s_spr_x_accel,x                      ; $02C1AD |
  LDA #$0040                                ; $02C1B0 |
  STA !s_spr_timer_2,x                      ; $02C1B3 |
  PLY                                       ; $02C1B6 |

CODE_02C1B7:
  CPY #$07                                  ; $02C1B7 |
  BNE CODE_02C1E3                           ; $02C1B9 |
  LDY #$05                                  ; $02C1BB |
  BRA CODE_02C1E3                           ; $02C1BD |

CODE_02C1BF:
  CPY #$05                                  ; $02C1BF |
  BNE CODE_02C1E3                           ; $02C1C1 |
  LDY #$07                                  ; $02C1C3 |
  BRA CODE_02C1E3                           ; $02C1C5 |

CODE_02C1C7:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02C1C7 |
  LDA #$0020                                ; $02C1C9 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $02C1CC |
  BEQ CODE_02C1DE                           ; $02C1CF |
  LDA #$00A0                                ; $02C1D1 |
  LDY !r_cur_world                          ; $02C1D4 |
  CPY #$06                                  ; $02C1D7 |
  BCS CODE_02C1DE                           ; $02C1D9 |
  LDA #$0100                                ; $02C1DB |

CODE_02C1DE:
  STA !s_spr_timer_1,x                      ; $02C1DE |
  LDY #$01                                  ; $02C1E1 |

CODE_02C1E3:
  TYA                                       ; $02C1E3 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02C1E4 |
  LDA #$0000                                ; $02C1E6 |

CODE_02C1E9:
  STA !s_spr_wildcard_3_lo_dp,x             ; $02C1E9 |
  RTS                                       ; $02C1EB |

  dw $0048, $00B0                           ; $02C1EC |

  dw $0040, $00B8                           ; $02C1F0 |

CODE_02C1F4:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02C1F4 |
  ASL A                                     ; $02C1F6 |
  ASL A                                     ; $02C1F7 |
  ORA !s_spr_facing_dir,x                   ; $02C1F8 |
  TAY                                       ; $02C1FB |
  LDA $C2DC,y                               ; $02C1FC |
  STA !gsu_r1                               ; $02C1FF |
  LDA $C2E0,y                               ; $02C202 |
  STA !gsu_r2                               ; $02C205 |
  LDA #$0002                                ; $02C208 |
  STA !gsu_r0                               ; $02C20B |
  LDA #$003E                                ; $02C20E |
  STA !gsu_r3                               ; $02C211 |
  STZ !gsu_r4                               ; $02C214 |
  LDA #$449E                                ; $02C217 |
  STA !gsu_r5                               ; $02C21A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02C21D |
  STA !gsu_r6                               ; $02C21F |
  LDA !s_spr_cam_x_pos,x                    ; $02C222 |
  CLC                                       ; $02C225 |
  ADC #$0008                                ; $02C226 |
  STA $6040                                 ; $02C229 |
  LDA !s_spr_cam_y_pos,x                    ; $02C22C |
  SEC                                       ; $02C22F |
  SBC #$0008                                ; $02C230 |
  STA $6042                                 ; $02C233 |
  LDX #$08                                  ; $02C236 |
  LDA #$E93B                                ; $02C238 |
  JSL r_gsu_init_1                          ; $02C23B | GSU init
  JSL $00BE39                               ; $02C23F |

  dw $5040, $727E, $7033, $0348             ; $02C243 |

  LDX $12                                   ; $02C24B |
  LDA #$0004                                ; $02C24D |
  TSB !r_reg_tm_mirror                      ; $02C250 |
  LDA #$0008                                ; $02C253 |
  TRB !r_reg_bgmode_mirror                  ; $02C256 |
  LDA #$0018                                ; $02C259 |
  TSB !r_reg_hdmaen_mirror                  ; $02C25C |
  LDY !s_spr_facing_dir,x                   ; $02C25F |
  LDX #$7C                                  ; $02C262 |
  LDA $70449E,x                             ; $02C264 |
  STA $00                                   ; $02C268 |
  LDA $7044A0,x                             ; $02C26A |
  STA $02                                   ; $02C26E |
  LDX $C1EC,y                               ; $02C270 |
  LDA $70449E,x                             ; $02C273 |
  STA $04                                   ; $02C277 |
  LDA $7044A0,x                             ; $02C279 |
  STA $06                                   ; $02C27D |
  LDX $C1F0,y                               ; $02C27F |
  LDA $70449E,x                             ; $02C282 |
  STA $08                                   ; $02C286 |
  LDA $7044A0,x                             ; $02C288 |
  STA $0A                                   ; $02C28C |
  LDX $12                                   ; $02C28E |
  REP #$10                                  ; $02C290 |
  LDY !s_spr_oam_pointer,x                  ; $02C292 |
  LDX #$000A                                ; $02C295 |

CODE_02C298:
  LDA $6000,y                               ; $02C298 |
  CLC                                       ; $02C29B |
  ADC $00                                   ; $02C29C |
  STA $6000,y                               ; $02C29E |
  LDA $6002,y                               ; $02C2A1 |
  CLC                                       ; $02C2A4 |
  ADC $02                                   ; $02C2A5 |
  STA $6002,y                               ; $02C2A7 |
  TYA                                       ; $02C2AA |
  CLC                                       ; $02C2AB |
  ADC #$0008                                ; $02C2AC |
  TAY                                       ; $02C2AF |
  DEX                                       ; $02C2B0 |
  BNE CODE_02C298                           ; $02C2B1 |
  LDA $6000,y                               ; $02C2B3 |
  CLC                                       ; $02C2B6 |
  ADC $04                                   ; $02C2B7 |
  STA $6000,y                               ; $02C2B9 |
  LDA $6002,y                               ; $02C2BC |
  CLC                                       ; $02C2BF |
  ADC $06                                   ; $02C2C0 |
  STA $6002,y                               ; $02C2C2 |
  LDA $6008,y                               ; $02C2C5 |
  CLC                                       ; $02C2C8 |
  ADC $08                                   ; $02C2C9 |
  STA $6008,y                               ; $02C2CB |
  LDA $600A,y                               ; $02C2CE |
  CLC                                       ; $02C2D1 |
  ADC $0A                                   ; $02C2D2 |
  STA $600A,y                               ; $02C2D4 |
  SEP #$10                                  ; $02C2D7 |
  LDX $12                                   ; $02C2D9 |
  RTS                                       ; $02C2DB |

; gsu table pointers
  dw $C304                                  ; $02C2DC |
  dw $C304                                  ; $02C2DE |

; gsu table pointers
  dw $C380                                  ; $02C2E0 |
  dw $C570                                  ; $02C2E2 |
  dw $C570                                  ; $02C2E4 |
  dw $C380                                  ; $02C2E6 |
  dw $C380                                  ; $02C2E8 |
  dw $C570                                  ; $02C2EA |
  dw $C3FC                                  ; $02C2EC |
  dw $C5EC                                  ; $02C2EE |
  dw $C4F4                                  ; $02C2F0 |
  dw $C6E4                                  ; $02C2F2 |
  dw $C478                                  ; $02C2F4 |
  dw $C668                                  ; $02C2F6 |
  dw $C4F4                                  ; $02C2F8 |
  dw $C6E4                                  ; $02C2FA |
  dw $C3FC                                  ; $02C2FC |
  dw $C5EC                                  ; $02C2FE |
  dw $C380                                  ; $02C300 |
  dw $C570                                  ; $02C302 |

  dw $0000, $00C0, $00C6, $00C9             ; $02C304 |
  dw $00CB, $00CD, $00CE, $00E8             ; $02C30C |
  dw $0002, $000B, $0013, $0016             ; $02C314 |
  dw $0018, $0015, $0012, $000C             ; $02C31C |
  dw $0001, $00EF, $00DC, $00D7             ; $02C324 |
  dw $00D3, $00CF, $00CF, $00D0             ; $02C32C |
  dw $00D0, $00D1, $00D3, $00D8             ; $02C334 |
  dw $00DF, $00E7, $00F1, $00F1             ; $02C33C |
  dw $00FC, $0008, $0013, $001D             ; $02C344 |
  dw $0024, $0028, $0029, $002A             ; $02C34C |
  dw $002B, $002D, $002E, $002E             ; $02C354 |
  dw $002E, $002E, $002E, $002E             ; $02C35C |
  dw $002E, $002E, $002E, $002E             ; $02C364 |
  dw $002E, $002E, $002E, $002E             ; $02C36C |
  dw $002E, $0030, $0034, $0037             ; $02C374 |
  dw $003B, $003F                           ; $02C37C |

  dw $0000, $00C0, $FFC6, $FEC9             ; $02C380 |
  dw $FDCB, $FBCD, $FACE, $FAE8             ; $02C388 |
  dw $FA02, $FA0B, $FA13, $FA16             ; $02C390 |
  dw $FA18, $FA15, $FA12, $FA0C             ; $02C398 |
  dw $FA01, $FAEF, $FADC, $FAD7             ; $02C3A0 |
  dw $FAD3, $FACF, $F9CF, $F8D0             ; $02C3A8 |
  dw $F8D0, $F7D1, $F6D3, $F4D8             ; $02C3B0 |
  dw $F2DF, $F1E7, $F1F1, $F1F1             ; $02C3B8 |
  dw $F1FC, $F108, $F213, $F41D             ; $02C3C0 |
  dw $F624, $F728, $F829, $F82A             ; $02C3C8 |
  dw $F92B, $FA2D, $FA2E, $FA2E             ; $02C3D0 |
  dw $FA2E, $FA2E, $FA2E, $FA2E             ; $02C3D8 |
  dw $FA2E, $FA2E, $FA2E, $FA2E             ; $02C3E0 |
  dw $FA2E, $FA2E, $FA2E, $FA2E             ; $02C3E8 |
  dw $FA2E, $FB30, $FD34, $FE37             ; $02C3F0 |
  dw $003B, $003F                           ; $02C3F8 |

  dw $0000, $00C0, $FCC6, $F8C9             ; $02C3FC |
  dw $F3CB, $ECCD, $E7CE, $E7E8             ; $02C404 |
  dw $E702, $E70B, $E713, $E716             ; $02C40C |
  dw $E718, $E715, $E712, $E70C             ; $02C414 |
  dw $E701, $E7EF, $E7DC, $E7D7             ; $02C41C |
  dw $E7D3, $E6CF, $E2CF, $E0D0             ; $02C424 |
  dw $DED0, $DBD1, $D6D3, $CED8             ; $02C42C |
  dw $C7DF, $C3E7, $C1F1, $C1F1             ; $02C434 |
  dw $C1FC, $C308, $C713, $CE1D             ; $02C43C |
  dw $D624, $DB28, $DE29, $E02A             ; $02C444 |
  dw $E22B, $E62D, $E72E, $E72E             ; $02C44C |
  dw $E72E, $E72E, $E72E, $E72E             ; $02C454 |
  dw $E72E, $E72E, $E72E, $E72E             ; $02C45C |
  dw $E72E, $E72E, $E72E, $E72E             ; $02C464 |
  dw $E72E, $EC30, $F334, $F837             ; $02C46C |
  dw $FD3B, $003F                           ; $02C474 |

  dw $0000, $00C0, $FAC5, $F5C8             ; $02C478 |
  dw $E9CB, $DCCD, $C8D0, $C6E8             ; $02C480 |
  dw $C202, $BF0B, $BC13, $B916             ; $02C488 |
  dw $B518, $B015, $AD12, $A90C             ; $02C490 |
  dw $A501, $A1EF, $9EDC, $9DD7             ; $02C498 |
  dw $9DD3, $9BD0, $97D0, $95D2             ; $02C4A0 |
  dw $93D6, $92DA, $8DDD, $89E1             ; $02C4A8 |
  dw $86E5, $84EA, $82F1, $82F1             ; $02C4B0 |
  dw $82FC, $8301, $8508, $890F             ; $02C4B8 |
  dw $8E15, $9219, $931A, $951B             ; $02C4C0 |
  dw $971C, $9B1E, $9D1F, $9D1F             ; $02C4C8 |
  dw $9E20, $A121, $A523, $A924             ; $02C4D0 |
  dw $AC25, $B027, $B528, $B929             ; $02C4D8 |
  dw $BC2A, $C02A, $C22B, $C62C             ; $02C4E0 |
  dw $C82C, $DC31, $E934, $F538             ; $02C4E8 |
  dw $FA3B, $003F                           ; $02C4F0 |

  dw $0000, $00C0, $FCC3, $F9C5             ; $02C4F4 |
  dw $F1C8, $E8CA, $DCCA, $DAE8             ; $02C4FC |
  dw $D701, $D00F, $CB14, $C117             ; $02C504 |
  dw $BA18, $B417, $AF15, $A911             ; $02C50C |
  dw $A40B, $9BFA, $97E6, $96DE             ; $02C514 |
  dw $95D8, $92D4, $8DD3, $8BD5             ; $02C51C |
  dw $8AD7, $8AE1, $88E4, $86E7             ; $02C524 |
  dw $84EC, $83F0, $82F5, $8200             ; $02C52C |
  dw $8206, $840C, $8610, $8916             ; $02C534 |
  dw $8D1B, $9220, $9321, $9523             ; $02C53C |
  dw $9724, $9B26, $9D27, $9E27             ; $02C544 |
  dw $9F27, $A128, $A529, $A92A             ; $02C54C |
  dw $AC2B, $B02C, $B32D, $BA2D             ; $02C554 |
  dw $C12E, $CB2F, $D02F, $D730             ; $02C55C |
  dw $DA31, $E834, $F137, $F93B             ; $02C564 |
  dw $FC3D, $003F                           ; $02C56C |

  dw $0000, $00C1, $00C5, $FEC9             ; $02C570 |
  dw $FDCC, $FBD0, $FAD2, $FAD2             ; $02C578 |
  dw $FAD2, $FAD2, $FAD2, $FAD2             ; $02C580 |
  dw $FAD2, $FAD2, $FAD2, $FAD2             ; $02C588 |
  dw $FAD2, $FAD2, $FAD2, $FAD2             ; $02C590 |
  dw $FAD2, $FAD3, $F9D5, $F8D6             ; $02C598 |
  dw $F8D7, $F7D8, $F6DC, $F4E3             ; $02C5A0 |
  dw $F2ED, $F1F8, $F104, $F10F             ; $02C5A8 |
  dw $F10F, $F119, $F221, $F428             ; $02C5B0 |
  dw $F62D, $F72F, $F830, $F830             ; $02C5B8 |
  dw $F931, $FA31, $FA2D, $FA29             ; $02C5C0 |
  dw $FA24, $FA11, $FAFF, $FAF4             ; $02C5C8 |
  dw $FAEE, $FAEB, $FAE8, $FAEA             ; $02C5D0 |
  dw $FAED, $FAF5, $FAFE, $FA18             ; $02C5D8 |
  dw $FA32, $FB33, $FD35, $FE37             ; $02C5E0 |
  dw $FF3A, $0040                           ; $02C5E8 |

  dw $0000, $00C1, $FDC5, $F8C9             ; $02C5EC |
  dw $F3CC, $ECD0, $E7D2, $E7D2             ; $02C5F4 |
  dw $E7D2, $E7D2, $E7D2, $E7D2             ; $02C5FC |
  dw $E7D2, $E7D2, $E7D2, $E7D2             ; $02C604 |
  dw $E7D2, $E7D2, $E7D2, $E7D2             ; $02C60C |
  dw $E7D2, $E6D3, $E2D5, $E0D6             ; $02C614 |
  dw $DED7, $DBD8, $D6DC, $CEE3             ; $02C61C |
  dw $C7ED, $C3F8, $C104, $C10F             ; $02C624 |
  dw $C10F, $C319, $C721, $CE28             ; $02C62C |
  dw $D62D, $DB2F, $DE30, $E030             ; $02C634 |
  dw $E231, $E631, $E72D, $E729             ; $02C63C |
  dw $E724, $E711, $E7FF, $E7F4             ; $02C644 |
  dw $E7EE, $E7EB, $E7E8, $E7EA             ; $02C64C |
  dw $E7ED, $E7F5, $E7FE, $E718             ; $02C654 |
  dw $E732, $EC33, $F335, $F837             ; $02C65C |
  dw $FC3A, $0040                           ; $02C664 |

  dw $0000, $00C1, $FAC5, $F5C8             ; $02C668 |
  dw $E9CC, $DCCF, $C8D4, $C6D4             ; $02C670 |
  dw $C2D5, $C0D6, $BCD6, $B9D7             ; $02C678 |
  dw $B5D8, $B0D9, $ACDB, $A9DC             ; $02C680 |
  dw $A5DD, $A1DF, $9EE0, $9DE1             ; $02C688 |
  dw $9DE1, $9BE2, $97E4, $95E5             ; $02C690 |
  dw $93E6, $92E7, $8EEB, $89F1             ; $02C698 |
  dw $85F8, $83FF, $8204, $820F             ; $02C6A0 |
  dw $820F, $8416, $861B, $891F             ; $02C6A8 |
  dw $8D23, $9226, $932A, $952E             ; $02C6B0 |
  dw $9730, $9B30, $9D2D, $9D29             ; $02C6B8 |
  dw $9E24, $A111, $A5FF, $A9F4             ; $02C6C0 |
  dw $ADEE, $B0EB, $B5E8, $B9EA             ; $02C6C8 |
  dw $BCED, $BFF5, $C2FE, $C618             ; $02C6D0 |
  dw $C830, $DC33, $E935, $F538             ; $02C6D8 |
  dw $FA3B, $0040                           ; $02C6E0 |

  dw $0000, $00C1, $FCC3, $F9C5             ; $02C6E4 |
  dw $F1C9, $E8CC, $DACF, $D7D0             ; $02C6EC |
  dw $D0D1, $CBD1, $C1D2, $BAD3             ; $02C6F4 |
  dw $B3D3, $B0D4, $ACD5, $A9D6             ; $02C6FC |
  dw $A5D7, $A1D8, $9FD9, $9ED9             ; $02C704 |
  dw $9DD9, $9BDA, $97DC, $95DD             ; $02C70C |
  dw $93DF, $92E0, $8DE5, $89EA             ; $02C714 |
  dw $86F0, $84F4, $82FA, $8200             ; $02C71C |
  dw $820B, $8310, $8414, $8619             ; $02C724 |
  dw $881C, $8A1F, $8A29, $8B2B             ; $02C72C |
  dw $8D2D, $922C, $9528, $9622             ; $02C734 |
  dw $971A, $9B06, $A4F5, $A9EF             ; $02C73C |
  dw $AFEB, $B4E9, $BAE8, $C1E9             ; $02C744 |
  dw $CBEC, $D0F1, $D7FF, $DA18             ; $02C74C |
  dw $DC36, $E836, $F138, $F93B             ; $02C754 |
  dw $FC3D, $0040                           ; $02C75C |

  db $43, $0F, $18, $5D, $7E                ; $02C760 |

  db $D9, $88, $53, $D9, $EC, $54, $00      ; $02C765 |

; pointers to gsu tables
  dw $C774                                  ; $02C76C |
  dw $C794                                  ; $02C76E |
  dw $C7B4                                  ; $02C770 |
  dw $C7D4                                  ; $02C772 |

  dw $0050, $1E48, $3939, $481E             ; $02C774 |
  dw $5000, $48E3, $39C8, $1EB9             ; $02C77C |
  dw $00B1, $E3B9, $C8C8, $B9E3             ; $02C784 |
  dw $B100, $B91E, $C839, $E348             ; $02C78C |

  dw $004E, $1F4A, $3737, $4A1F             ; $02C794 |
  dw $4E00, $4AE2, $37CA, $1FB7             ; $02C79C |
  dw $00B3, $E2B7, $CACA, $B7E2             ; $02C7A4 |
  dw $B300, $B71F, $CA37, $E24A             ; $02C7AC |

  dw $0040, $1534, $2D2D, $3415             ; $02C7B4 |
  dw $4000, $34EC, $2DD4, $15CD             ; $02C7BC |
  dw $00C1, $ECCD, $D4D4, $CDEC             ; $02C7C4 |
  dw $C100, $CD15, $D42D, $EC34             ; $02C7CC |

  dw $0038, $183B, $2828, $3B18             ; $02C7D4 |
  dw $3800, $3BE9, $28D9, $18C6             ; $02C7DC |
  dw $00C9, $E9C6, $D9D9, $C6E9             ; $02C7E4 |
  dw $C900, $C618, $D928, $E93B             ; $02C7EC |

init_prince_froggy:
  LDA !s_spr_x_pixel_pos,x                  ; $02C7F4 |
  AND #$0010                                ; $02C7F7 |
  BNE CODE_02C7FF                           ; $02C7FA |
  JMP CODE_02C8A1                           ; $02C7FC |

CODE_02C7FF:
  AND !s_spr_y_pixel_pos,x                  ; $02C7FF |
  BEQ CODE_02C873                           ; $02C802 |
  INC $0B59                                 ; $02C804 |
  LDA #$0017                                ; $02C807 |
  JSL spawn_sprite_active                   ; $02C80A |
  BCS CODE_02C814                           ; $02C80E |
  JML $03A31E                               ; $02C810 |

CODE_02C814:
  LDA #$000E                                ; $02C814 |
  STA !s_spr_state,y                        ; $02C817 |
  LDA !s_spr_x_pixel_pos,x                  ; $02C81A |
  SEC                                       ; $02C81D |
  SBC #$0058                                ; $02C81E |
  STA !s_spr_x_pixel_pos,y                  ; $02C821 |
  SEC                                       ; $02C824 |
  SBC #$0010                                ; $02C825 |
  STA !s_player_x                           ; $02C828 |
  LDA !s_spr_y_pixel_pos,x                  ; $02C82B |
  SEC                                       ; $02C82E |
  SBC #$0028                                ; $02C82F |
  STA !s_spr_y_pixel_pos,y                  ; $02C832 |
  SEC                                       ; $02C835 |
  SBC #$0008                                ; $02C836 |
  STA !s_player_y                           ; $02C839 |
  LDA !s_spr_bitwise_settings_3,y           ; $02C83C |
  AND #$FFE0                                ; $02C83F |
  ORA #$2000                                ; $02C842 |
  STA !s_spr_bitwise_settings_3,y           ; $02C845 |
  LDA #$0000                                ; $02C848 |
  STA !s_spr_y_accel,y                      ; $02C84B |
  LDA #$0080                                ; $02C84E |
  STA !s_spr_timer_1,y                      ; $02C851 |
  LDA #$0060                                ; $02C854 |
  STA $105C                                 ; $02C857 |
  JSR CODE_02C92C                           ; $02C85A |
  LDX #$1C                                  ; $02C85D |

CODE_02C85F:
  LDA $7021A2,x                             ; $02C85F |
  STA $7021C2,x                             ; $02C863 |
  STA $702F2E,x                             ; $02C867 |
  DEX                                       ; $02C86B |
  DEX                                       ; $02C86C |
  BPL CODE_02C85F                           ; $02C86D |
  LDX $12                                   ; $02C86F |
  BRA CODE_02C89D                           ; $02C871 |

CODE_02C873:
  LDA #$0017                                ; $02C873 |
  JSL spawn_sprite_active                   ; $02C876 |
  BCC CODE_02C89D                           ; $02C87A |
  LDA !s_spr_x_pixel_pos,x                  ; $02C87C |
  STA !s_spr_x_pixel_pos,y                  ; $02C87F |
  LDA !s_spr_y_pixel_pos,x                  ; $02C882 |
  STA !s_spr_y_pixel_pos,y                  ; $02C885 |
  LDA #$000D                                ; $02C888 |
  STA !s_spr_wildcard_5_lo,y                ; $02C88B |
  LDA !s_spr_bitwise_settings_3,y           ; $02C88E |
  ORA #$2000                                ; $02C891 |
  STA !s_spr_bitwise_settings_3,y           ; $02C894 |
  LDY #$36                                  ; $02C897 |
  JSL $0CE5D6                               ; $02C899 |

CODE_02C89D:
  JML $03A31E                               ; $02C89D |

CODE_02C8A1:
  JSL $03AD74                               ; $02C8A1 |
  BCS CODE_02C8AA                           ; $02C8A5 |
  JMP $A31E                                 ; $02C8A7 | seems to be erroneous code

CODE_02C8AA:
  JSR CODE_02C92C                           ; $02C8AA |
  LDA #$0010                                ; $02C8AD |
  STA $7049C6                               ; $02C8B0 |
  DEC A                                     ; $02C8B4 |
  ASL A                                     ; $02C8B5 |
  TAX                                       ; $02C8B6 |

CODE_02C8B7:
  LDA $C774,x                               ; $02C8B7 |
  STA $7049C7,x                             ; $02C8BA |
  DEX                                       ; $02C8BE |
  DEX                                       ; $02C8BF |
  BPL CODE_02C8B7                           ; $02C8C0 |
  LDX #$3C                                  ; $02C8C2 |

CODE_02C8C4:
  LDA $5FE802,x                             ; $02C8C4 |
  STA $702E2E,x                             ; $02C8C8 |
  STA $7020C2,x                             ; $02C8CC |
  DEX                                       ; $02C8D0 |
  DEX                                       ; $02C8D1 |
  BPL CODE_02C8C4                           ; $02C8D2 |
  LDY #$0D                                  ; $02C8D4 |
  STY $4331                                 ; $02C8D6 |
  LDY #$0E                                  ; $02C8D9 |
  STY $4341                                 ; $02C8DB |
  SEP #$20                                  ; $02C8DE |
  LDX #$04                                  ; $02C8E0 |

CODE_02C8E2:
  LDA $C760,x                               ; $02C8E2 |
  STA $4370,x                               ; $02C8E5 |
  DEX                                       ; $02C8E8 |
  BPL CODE_02C8E2                           ; $02C8E9 |
  LDA #$7E                                  ; $02C8EB |
  STA $4377                                 ; $02C8ED |
  LDX #$06                                  ; $02C8F0 |

CODE_02C8F2:
  LDA $C765,x                               ; $02C8F2 |
  STA $7E5D18,x                             ; $02C8F5 |
  DEX                                       ; $02C8F9 |
  BPL CODE_02C8F2                           ; $02C8FA |
  REP #$20                                  ; $02C8FC |
  LDX $12                                   ; $02C8FE |
  LDA !s_spr_y_pixel_pos,x                  ; $02C900 |
  CLC                                       ; $02C903 |
  ADC #$0008                                ; $02C904 |
  STA !s_spr_y_pixel_pos,x                  ; $02C907 |
  LDA #$0180                                ; $02C90A |
  STA !s_spr_timer_4,x                      ; $02C90D |
  LDA #$0100                                ; $02C910 |
  STA !s_spr_timer_3,x                      ; $02C913 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02C916 |
  INC !r_autoscr_x_active                   ; $02C919 |
  STZ $0C23                                 ; $02C91C |
  INC !r_autoscr_y_active                   ; $02C91F |
  LDA #$070C                                ; $02C922 |
  STA $0C27                                 ; $02C925 |
  JML $0CDB4D                               ; $02C928 |

; prince froggy sub
CODE_02C92C:
  LDY !s_cur_egg_inv_size                   ; $02C92C |
  BEQ CODE_02C943                           ; $02C92F |

CODE_02C931:
  PHY                                       ; $02C931 |
  LDX $7DF6,y                               ; $02C932 |
  JSL $03A32E                               ; $02C935 |
  PLY                                       ; $02C939 |
  DEY                                       ; $02C93A |
  DEY                                       ; $02C93B |
  BNE CODE_02C931                           ; $02C93C |
  STZ !s_cur_egg_inv_size                   ; $02C93E |
  LDX $12                                   ; $02C941 |

CODE_02C943:
  RTS                                       ; $02C943 |

  dw $FFFF                                  ; $02C944 |
  dw $0001                                  ; $02C946 |
  dw $FFC0                                  ; $02C948 |
  dw $0040                                  ; $02C94A |
  dw $FE00                                  ; $02C94C |
  dw $0200                                  ; $02C94E |

main_prince_froggy:
  JSR CODE_02CDFA                           ; $02C950 |
  JSL $03AF23                               ; $02C953 |
  LDA !r_y_cam_offset                       ; $02C957 |
  STA !r_bg3_cam_y                          ; $02C95A |
  STA !s_bg3_cam_y                          ; $02C95D |
  TXY                                       ; $02C960 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02C961 |
  ASL A                                     ; $02C963 |
  TAX                                       ; $02C964 |
  JSR ($CAF0,x)                             ; $02C965 |
  LDA #$FC00                                ; $02C968 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02C96B |
  BPL CODE_02C972                           ; $02C96D |
  LDA #$0400                                ; $02C96F |

CODE_02C972:
  LDY #$00                                  ; $02C972 |
  CLC                                       ; $02C974 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $02C975 |
  BPL CODE_02C97B                           ; $02C977 |
  LDY #$02                                  ; $02C979 |

CODE_02C97B:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02C97B |
  PHA                                       ; $02C97D |
  SEC                                       ; $02C97E |
  SBC $C94C,y                               ; $02C97F |
  EOR $C948,y                               ; $02C982 |
  ASL A                                     ; $02C985 |
  PLA                                       ; $02C986 |
  BCC CODE_02C98F                           ; $02C987 |
  CLC                                       ; $02C989 |
  ADC $C948,y                               ; $02C98A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02C98D |

CODE_02C98F:
  CLC                                       ; $02C98F |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $02C990 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02C992 |
  CLC                                       ; $02C994 |
  ADC #$3000                                ; $02C995 |
  CMP #$6001                                ; $02C998 |
  BCC CODE_02C9AB                           ; $02C99B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02C99D |
  EOR !s_spr_wildcard_6_lo_dp,x             ; $02C99F |
  BMI CODE_02C9AB                           ; $02C9A1 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02C9A3 |
  EOR #$FFFF                                ; $02C9A5 |
  INC A                                     ; $02C9A8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02C9A9 |

CODE_02C9AB:
  TXA                                       ; $02C9AB |
  STA $6012                                 ; $02C9AC |
  LDA !s_player_x_cam_rel                   ; $02C9AF |
  STA $6014                                 ; $02C9B2 |
  LDA !s_player_y_cam_rel                   ; $02C9B5 |
  STA $6016                                 ; $02C9B8 |
  LDA !s_player_duck_state                  ; $02C9BB |
  STA $6018                                 ; $02C9BE |
  LDX #$0A                                  ; $02C9C1 |
  LDA #$8AD0                                ; $02C9C3 |
  JSL r_gsu_init_1                          ; $02C9C6 | GSU init
  LDX $12                                   ; $02C9CA |
  LDA $601A                                 ; $02C9CC |
  AND #$001E                                ; $02C9CF |
  BEQ CODE_02CA03                           ; $02C9D2 |
  ASL A                                     ; $02C9D4 |
  AND $601A                                 ; $02C9D5 |
  AND #$0014                                ; $02C9D8 |
  BEQ CODE_02C9E2                           ; $02C9DB |
  CMP #$0014                                ; $02C9DD |
  BEQ CODE_02CA00                           ; $02C9E0 |

CODE_02C9E2:
  EOR #$0014                                ; $02C9E2 |
  LDY #$00                                  ; $02C9E5 |
  AND $601A                                 ; $02C9E7 |
  BEQ CODE_02C9EE                           ; $02C9EA |
  LDY #$02                                  ; $02C9EC |

CODE_02C9EE:
  LDA !s_player_x                           ; $02C9EE |
  CLC                                       ; $02C9F1 |
  ADC $C944,y                               ; $02C9F2 |
  STA !s_player_x                           ; $02C9F5 |
  LDA !s_player_x_speed                     ; $02C9F8 |
  EOR $C944,y                               ; $02C9FB |
  BPL CODE_02CA03                           ; $02C9FE |

CODE_02CA00:
  STZ !s_player_x_speed                     ; $02CA00 |

CODE_02CA03:
  LDA $601A                                 ; $02CA03 |
  AND #$0001                                ; $02CA06 |
  BEQ CODE_02CA67                           ; $02CA09 |
  LDA !s_player_y                           ; $02CA0B |
  CMP !s_cur_spr_y_prev                     ; $02CA0E |
  BMI CODE_02CA67                           ; $02CA11 |
  LDA !s_player_jump_state                  ; $02CA13 |
  BEQ CODE_02CA1D                           ; $02CA16 |
  LDA !s_player_y_speed                     ; $02CA18 |
  BMI CODE_02CA67                           ; $02CA1B |

CODE_02CA1D:
  LDA !s_player_x                           ; $02CA1D |
  CLC                                       ; $02CA20 |
  ADC #$0008                                ; $02CA21 |
  SEC                                       ; $02CA24 |
  SBC !s_cur_spr_x_prev                     ; $02CA25 |
  STA !gsu_r1                               ; $02CA28 |
  LDA !s_player_y                           ; $02CA2B |
  CLC                                       ; $02CA2E |
  ADC #$0020                                ; $02CA2F |
  SEC                                       ; $02CA32 |
  SBC !s_cur_spr_y_prev                     ; $02CA33 |
  CMP #$0080                                ; $02CA36 |
  BCC CODE_02CA3E                           ; $02CA39 |
  LDA #$007F                                ; $02CA3B |

CODE_02CA3E:
  STA !gsu_r2                               ; $02CA3E |
  LDA #$0060                                ; $02CA41 |
  STA $6004                                 ; $02CA44 |
  LDX #$0A                                  ; $02CA47 |
  LDA #$8DC8                                ; $02CA49 |
  JSL r_gsu_init_1                          ; $02CA4C | GSU init
  LDX $12                                   ; $02CA50 |
  LDA !s_player_state                       ; $02CA52 |
  CMP #$0006                                ; $02CA55 |
  BEQ CODE_02CA67                           ; $02CA58 |
  INC !s_on_sprite_platform_flag            ; $02CA5A |
  LDA !s_player_y                           ; $02CA5D |
  CLC                                       ; $02CA60 |
  ADC $601C                                 ; $02CA61 |
  STA !s_player_y                           ; $02CA64 |

CODE_02CA67:
  LDY !s_spr_collision_id,x                 ; $02CA67 |
  DEY                                       ; $02CA6A |
  BPL CODE_02CA70                           ; $02CA6B |
  JMP CODE_02CAEF                           ; $02CA6D |

CODE_02CA70:
  LDA !s_cur_spr_x_prev                     ; $02CA70 |
  SEC                                       ; $02CA73 |
  SBC !s_spr_x_hitbox_center,y              ; $02CA74 |
  STA $0C                                   ; $02CA77 |
  ASL A                                     ; $02CA79 |
  CLC                                       ; $02CA7A |
  ADC $0C                                   ; $02CA7B |
  STA $0C                                   ; $02CA7D |
  CLC                                       ; $02CA7F |
  ADC !s_spr_x_speed_lo,y                   ; $02CA80 |
  STA !s_spr_x_speed_lo,y                   ; $02CA83 |
  EOR $0C                                   ; $02CA86 |
  STA $00                                   ; $02CA88 |
  LDA !s_cur_spr_y_prev                     ; $02CA8A |
  SEC                                       ; $02CA8D |
  SBC !s_spr_y_hitbox_center,y              ; $02CA8E |
  STA $0E                                   ; $02CA91 |
  ASL A                                     ; $02CA93 |
  CLC                                       ; $02CA94 |
  ADC $0E                                   ; $02CA95 |
  STA $0E                                   ; $02CA97 |
  CLC                                       ; $02CA99 |
  ADC !s_spr_y_speed_lo,y                   ; $02CA9A |
  STA !s_spr_y_speed_lo,y                   ; $02CA9D |
  EOR $0E                                   ; $02CAA0 |
  ORA $00                                   ; $02CAA2 |
  BPL CODE_02CAC4                           ; $02CAA4 |
  LDA !s_spr_y_accel,y                      ; $02CAA6 |
  CMP #$0040                                ; $02CAA9 |
  BCC CODE_02CACA                           ; $02CAAC |
  PHB                                       ; $02CAAE |
  TYX                                       ; $02CAAF |
  JSL $03B078                               ; $02CAB0 |
  TXY                                       ; $02CAB4 |
  PLB                                       ; $02CAB5 |
  LDA $0C                                   ; $02CAB6 |
  ASL A                                     ; $02CAB8 |
  STA !s_spr_x_speed_lo,x                   ; $02CAB9 |
  LDA $0E                                   ; $02CABC |
  ASL A                                     ; $02CABE |
  STA !s_spr_y_speed_lo,x                   ; $02CABF |
  BRA CODE_02CACA                           ; $02CAC2 |

CODE_02CAC4:
  LDA #$0040                                ; $02CAC4 |
  STA !s_spr_y_accel,y                      ; $02CAC7 |

CODE_02CACA:
  LDA !s_spr_x_hitbox_center,y              ; $02CACA |
  SEC                                       ; $02CACD |
  SBC !s_cur_spr_x_prev                     ; $02CACE |
  STA !gsu_r1                               ; $02CAD1 |
  LDA !s_spr_y_hitbox_center,y              ; $02CAD4 |
  SEC                                       ; $02CAD7 |
  SBC !s_cur_spr_y_prev                     ; $02CAD8 |
  STA !gsu_r2                               ; $02CADB |
  LDA #$0078                                ; $02CADE |
  STA $6004                                 ; $02CAE1 |
  LDX #$0A                                  ; $02CAE4 |
  LDA #$8DC8                                ; $02CAE6 |
  JSL r_gsu_init_1                          ; $02CAE9 | GSU init
  LDX $12                                   ; $02CAED |

CODE_02CAEF:
  RTL                                       ; $02CAEF |

prince_froggy_state_ptr:
  dw $CAF6                                  ; $02CAF0 | state $00
  dw $CD2A                                  ; $02CAF2 | state $01
  dw $CDF4                                  ; $02CAF4 | state $02

; state $00
  TYX                                       ; $02CAF6 |
  LDA !s_spr_timer_3,x                      ; $02CAF7 |
  BNE CODE_02CB47                           ; $02CAFA |
  LDA $10                                   ; $02CAFC |
  AND #$003C                                ; $02CAFE |
  CLC                                       ; $02CB01 |
  ADC #$00C4                                ; $02CB02 |
  CMP #$00D8                                ; $02CB05 |
  BCC CODE_02CB0F                           ; $02CB08 |
  CMP #$00F4                                ; $02CB0A |
  BCC CODE_02CB47                           ; $02CB0D |

CODE_02CB0F:
  PHA                                       ; $02CB0F |
  LDA !s_spr_gsu_morph_2_hi,x               ; $02CB10 |
  AND #$00FF                                ; $02CB13 |
  STA $00                                   ; $02CB16 |
  LSR A                                     ; $02CB18 |
  LSR A                                     ; $02CB19 |
  ADC $00                                   ; $02CB1A |
  LSR A                                     ; $02CB1C |
  LSR A                                     ; $02CB1D |
  EOR #$FFFF                                ; $02CB1E |
  ADC #$0070                                ; $02CB21 |
  STA !s_spr_timer_3,x                      ; $02CB24 |
  LDA #$013B                                ; $02CB27 |
  JSL spawn_sprite_active                   ; $02CB2A |
  PLA                                       ; $02CB2E |
  BCC CODE_02CB47                           ; $02CB2F |
  STA !s_spr_wildcard_5_lo,y                ; $02CB31 |
  TXA                                       ; $02CB34 |
  STA !s_spr_wildcard_4_lo,y                ; $02CB35 |
  PHY                                       ; $02CB38 |
  JSR CODE_02D0D9                           ; $02CB39 |
  PLY                                       ; $02CB3C |
  LDA $00                                   ; $02CB3D |
  STA !s_spr_x_pixel_pos,y                  ; $02CB3F |
  LDA $02                                   ; $02CB42 |
  STA !s_spr_y_pixel_pos,y                  ; $02CB44 |

CODE_02CB47:
  LDA !s_spr_timer_4,x                      ; $02CB47 |
  BNE CODE_02CBB0                           ; $02CB4A |
  LDA #$0100                                ; $02CB4C |
  STA !s_spr_timer_4,x                      ; $02CB4F |
  LDA #$002A                                ; $02CB52 |
  STA !gsu_r4                               ; $02CB55 |
  LDA #$002C                                ; $02CB58 |
  STA !gsu_r5                               ; $02CB5B |
  LDX #$09                                  ; $02CB5E |
  LDA #$91DB                                ; $02CB60 |
  JSL r_gsu_init_1                          ; $02CB63 | GSU init
  LDX $12                                   ; $02CB67 |
  LDA !gsu_r6                               ; $02CB69 |
  CMP #$0002                                ; $02CB6C |
  BCS CODE_02CBB0                           ; $02CB6F |
  LDA #$0043                                ; $02CB71 |
  STA !gsu_r4                               ; $02CB74 |
  LDA #$0045                                ; $02CB77 |
  STA !gsu_r5                               ; $02CB7A |
  LDX #$09                                  ; $02CB7D |
  LDA #$91DB                                ; $02CB7F |
  JSL r_gsu_init_1                          ; $02CB82 | GSU init
  LDX $12                                   ; $02CB86 |
  LDA !gsu_r6                               ; $02CB88 |
  BNE CODE_02CBB0                           ; $02CB8B |
  LDA $10                                   ; $02CB8D |
  AND #$0001                                ; $02CB8F |
  CLC                                       ; $02CB92 |
  ADC #$0043                                ; $02CB93 |
  JSL spawn_sprite_init                     ; $02CB96 |
  BCC CODE_02CBB0                           ; $02CB9A |
  LDA !s_spr_x_pixel_pos,x                  ; $02CB9C |
  SEC                                       ; $02CB9F |
  SBC #$0008                                ; $02CBA0 |
  STA !s_spr_x_pixel_pos,y                  ; $02CBA3 |
  LDA !s_spr_y_pixel_pos,x                  ; $02CBA6 |
  SEC                                       ; $02CBA9 |
  SBC #$0074                                ; $02CBAA |
  STA !s_spr_y_pixel_pos,y                  ; $02CBAD |

CODE_02CBB0:
  LDA !s_spr_timer_1,x                      ; $02CBB0 |
  BEQ CODE_02CBF1                           ; $02CBB3 |
  LDA !s_spr_timer_2,x                      ; $02CBB5 |
  AND #$000F                                ; $02CBB8 |
  CMP #$0001                                ; $02CBBB |
  BNE CODE_02CBC7                           ; $02CBBE |
  LDA #$003F                                ; $02CBC0 |\ play sound #$003F
  JSL push_sound_queue                      ; $02CBC3 |/

CODE_02CBC7:
  LDA !s_spr_timer_2,x                      ; $02CBC7 |
  AND #$0004                                ; $02CBCA |
  BEQ CODE_02CBE6                           ; $02CBCD |
  LDX #$3C                                  ; $02CBCF |
  LDA #$7FFF                                ; $02CBD1 |

CODE_02CBD4:
  STA $7020C2,x                             ; $02CBD4 |
  DEX                                       ; $02CBD8 |
  DEX                                       ; $02CBD9 |
  BPL CODE_02CBD4                           ; $02CBDA |
  LDX $12                                   ; $02CBDC |
  LDY #$05                                  ; $02CBDE |
  STY !r_reg_cgadsub_mirror                 ; $02CBE0 |

CODE_02CBE3:
  JMP CODE_02CCD3                           ; $02CBE3 |

CODE_02CBE6:
  LDY #$45                                  ; $02CBE6 |
  STY !r_reg_cgadsub_mirror                 ; $02CBE8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02CBEB |
  JMP CODE_02CC88                           ; $02CBEE |

CODE_02CBF1:
  LDY !s_spr_collision_id,x                 ; $02CBF1 |
  DEY                                       ; $02CBF4 |
  BMI CODE_02CBE3                           ; $02CBF5 |
  LDA !s_spr_collision_state,y              ; $02CBF7 |
  BEQ CODE_02CBE3                           ; $02CBFA |
  LDA !s_spr_x_collision_delta,x            ; $02CBFC |  x distance from egg
  EOR #$FFFF                                ; $02CBFF |\ negative
  INC A                                     ; $02CC02 |/
  AND #$00FF                                ; $02CC03 |\ low byte of (-egg x dist)
  XBA                                       ; $02CC06 |/ switched to high position
  CMP #$FFFF                                ; $02CC07 |\ pointless compare
  BNE .sign_extend                          ; $02CC0A |/ (will always branch)
  INC A                                     ; $02CC0C |\ dead code
  BRA .check_egg_X_vel                      ; $02CC0D |/

.sign_extend
  CMP #$8000                                ; $02CC0F |\ sign extend
  ROR A                                     ; $02CC12 |/ shift 1 right

.check_egg_X_vel
  STA $00                                   ; $02CC13 |
  EOR !s_spr_x_speed_lo,y                   ; $02CC15 |\  load and check sign of
  ASL A                                     ; $02CC18 | | egg x velocity against dist
  LDA !s_spr_x_speed_lo,y                   ; $02CC19 | | if egg moving same direction as
  BCC .check_egg_Y_vel                      ; $02CC1C | | egg dist, zero out this piece
  LDA #$0000                                ; $02CC1E |/  otherwise, add on velocity of egg

.check_egg_Y_vel
  CLC                                       ; $02CC21 |\
  ADC $00                                   ; $02CC22 | | add either 0 or x velocity of egg
  STA $00                                   ; $02CC24 |/
  LDA !s_spr_y_speed_lo,y                   ; $02CC26 |\  if egg y velocity and
  EOR !s_spr_x_collision_delta,x            ; $02CC29 | | egg x distance are different signs
  ASL A                                     ; $02CC2C | | (egg moving up, hit on right
  LDA !s_spr_y_speed_lo,y                   ; $02CC2D | | or egg moving down, hit on left)
  BCS .add_egg_Y_vel                        ; $02CC30 | | then simply add egg y velocity
  EOR #$FFFF                                ; $02CC32 | | otherwise add negative egg y velocity
  INC A                                     ; $02CC35 |/

.add_egg_Y_vel
  CLC                                       ; $02CC36 |\ add either egg y velocity
  ADC $00                                   ; $02CC37 |/ or negative egg y velocity
  STA !s_spr_wildcard_6_lo_dp,x             ; $02CC39 |
  BPL .push_damage                          ; $02CC3B |\
  EOR #$FFFF                                ; $02CC3D | | make positive if not already
  INC A                                     ; $02CC40 |/

.push_damage
  PHA                                       ; $02CC41 | push final damage computed
  ASL A                                     ; $02CC42 |
  ASL A                                     ; $02CC43 |
  ASL A                                     ; $02CC44 |
  AND #$FF00                                ; $02CC45 |
  XBA                                       ; $02CC48 |
  CMP #$0020                                ; $02CC49 |
  BCS CODE_02CC51                           ; $02CC4C |
  LDA #$0020                                ; $02CC4E |

CODE_02CC51:
  STA !s_spr_timer_1,x                      ; $02CC51 |
  LDA #$0020                                ; $02CC54 |
  STA !s_spr_timer_2,x                      ; $02CC57 |
  STA !s_cam_y_large_shaking_timer          ; $02CC5A |
  TYX                                       ; $02CC5D |
  JSL $03B25B                               ; $02CC5E |
  PLA                                       ; $02CC62 |\
  ASL A                                     ; $02CC63 | | pull computed damage
  CLC                                       ; $02CC64 | | times two
  ADC !s_spr_gsu_morph_2_lo,x               ; $02CC65 | | add to damage counter
  STA !s_spr_gsu_morph_2_lo,x               ; $02CC68 |/
  BCC CODE_02CC88                           ; $02CC6B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02CC6D |
  LDA #$0140                                ; $02CC6F |
  STA !s_spr_timer_1,x                      ; $02CC72 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $02CC75 |
  LDA #$0800                                ; $02CC78 |
  STA !s_cam_y_large_shaking_timer          ; $02CC7B |
  JSL $028925                               ; $02CC7E |
  JSL $02A982                               ; $02CC82 |
  BRA CODE_02CCD3                           ; $02CC86 |

CODE_02CC88:
  AND #$FF00                                ; $02CC88 |
  XBA                                       ; $02CC8B |
  STA !gsu_r6                               ; $02CC8C |
  LDA #$D94C                                ; $02CC8F |
  STA !gsu_r14                              ; $02CC92 |
  LDA #$005F                                ; $02CC95 |
  STA !gsu_r0                               ; $02CC98 |
  LDA #$0001                                ; $02CC9B |
  STA !gsu_r8                               ; $02CC9E |
  LDA #$0007                                ; $02CCA1 |
  STA !gsu_r12                              ; $02CCA4 |
  LDX #$08                                  ; $02CCA7 |
  LDA #$E167                                ; $02CCA9 |
  JSL r_gsu_init_1                          ; $02CCAC | GSU init
  LDA #$E8B0                                ; $02CCB0 |
  STA !gsu_r14                              ; $02CCB3 |
  LDA #$005F                                ; $02CCB6 |
  STA !gsu_r0                               ; $02CCB9 |
  LDA #$0061                                ; $02CCBC |
  STA !gsu_r8                               ; $02CCBF |
  LDA #$001F                                ; $02CCC2 |
  STA !gsu_r12                              ; $02CCC5 |
  LDX #$08                                  ; $02CCC8 |
  LDA #$E167                                ; $02CCCA |
  JSL r_gsu_init_1                          ; $02CCCD | GSU init
  LDX $12                                   ; $02CCD1 |

CODE_02CCD3:
  LDA #$0002                                ; $02CCD3 |
  STA !gsu_r0                               ; $02CCD6 |
  LDA $14                                   ; $02CCD9 |
  AND #$0008                                ; $02CCDB |
  TAY                                       ; $02CCDE |
  BEQ CODE_02CCF4                           ; $02CCDF |
  LDY #$02                                  ; $02CCE1 |
  LDA !s_spr_timer_1,x                      ; $02CCE3 |
  BEQ CODE_02CCF4                           ; $02CCE6 |
  LDA $14                                   ; $02CCE8 |
  AND #$0010                                ; $02CCEA |
  LSR A                                     ; $02CCED |
  LSR A                                     ; $02CCEE |
  LSR A                                     ; $02CCEF |
  ADC #$0004                                ; $02CCF0 |
  TAY                                       ; $02CCF3 |

CODE_02CCF4:
  LDA $C76C,y                               ; $02CCF4 |
  STA !gsu_r14                              ; $02CCF7 |
  LDX #$0A                                  ; $02CCFA |
  LDA #$8D8B                                ; $02CCFC |
  JSL r_gsu_init_1                          ; $02CCFF | GSU init
  LDX $12                                   ; $02CD03 |
  RTS                                       ; $02CD05 |

  dw $0002                                  ; $02CD06 |
  dw $0000                                  ; $02CD08 |
  dw $FFFE                                  ; $02CD0A |
  dw $0000                                  ; $02CD0C |
  dw $0002                                  ; $02CD0E |
  dw $0000                                  ; $02CD10 |
  dw $FFFE                                  ; $02CD12 |
  dw $0000                                  ; $02CD14 |

  dw $FFFF                                  ; $02CD16 |
  dw $0001                                  ; $02CD18 |

  dw $48EC                                  ; $02CD1A |
  dw $492A                                  ; $02CD1C |
  dw $4968                                  ; $02CD1E |
  dw $49A6                                  ; $02CD20 |

  dw $3958                                  ; $02CD22 |
  dw $3966                                  ; $02CD24 |
  dw $3974                                  ; $02CD26 |
  dw $3982                                  ; $02CD28 |

; state $01
  TYX                                       ; $02CD2A |
  LDY #$00                                  ; $02CD2B |
  LDA !s_spr_x_pixel_pos,x                  ; $02CD2D |
  SEC                                       ; $02CD30 |
  SBC #$0008                                ; $02CD31 |
  CMP !s_player_x                           ; $02CD34 |
  BEQ CODE_02CD47                           ; $02CD37 |
  BMI CODE_02CD3D                           ; $02CD39 |
  LDY #$02                                  ; $02CD3B |

CODE_02CD3D:
  LDA !s_player_x                           ; $02CD3D |
  CLC                                       ; $02CD40 |
  ADC $CD16,y                               ; $02CD41 |
  STA !s_player_x                           ; $02CD44 |

CODE_02CD47:
  PHB                                       ; $02CD47 |
  LDA $14                                   ; $02CD48 |
  AND #$000C                                ; $02CD4A |
  LSR A                                     ; $02CD4D |
  TAY                                       ; $02CD4E |
  REP #$10                                  ; $02CD4F |
  LDX $CD22,y                               ; $02CD51 |
  PHX                                       ; $02CD54 |
  LDX $CD1A,y                               ; $02CD55 |
  PEA $7020                                 ; $02CD58 |
  PLB                                       ; $02CD5B |
  PLB                                       ; $02CD5C |
  LDY #$003C                                ; $02CD5D |

CODE_02CD60:
  LDA $5FA000,x                             ; $02CD60 |
  STA $20C2,y                               ; $02CD64 |
  DEX                                       ; $02CD67 |
  DEX                                       ; $02CD68 |
  DEY                                       ; $02CD69 |
  DEY                                       ; $02CD6A |
  BPL CODE_02CD60                           ; $02CD6B |
  PLX                                       ; $02CD6D |
  LDY #$000C                                ; $02CD6E |

CODE_02CD71:
  LDA $5FA000,x                             ; $02CD71 |
  STA $2002,y                               ; $02CD75 |
  DEX                                       ; $02CD78 |
  DEX                                       ; $02CD79 |
  DEY                                       ; $02CD7A |
  DEY                                       ; $02CD7B |
  BPL CODE_02CD71                           ; $02CD7C |
  PLB                                       ; $02CD7E |
  SEP #$10                                  ; $02CD7F |
  LDA #$0002                                ; $02CD81 |
  STA !gsu_r0                               ; $02CD84 |
  LDA $14                                   ; $02CD87 |
  AND #$0008                                ; $02CD89 |
  TAY                                       ; $02CD8C |
  BEQ CODE_02CD91                           ; $02CD8D |
  LDY #$02                                  ; $02CD8F |

CODE_02CD91:
  LDA $C770,y                               ; $02CD91 |
  STA !gsu_r14                              ; $02CD94 |
  LDX #$0A                                  ; $02CD97 |
  LDA #$8D8B                                ; $02CD99 |
  JSL r_gsu_init_1                          ; $02CD9C | GSU init
  LDX $12                                   ; $02CDA0 |
  LDA !s_spr_timer_1,x                      ; $02CDA2 |
  BNE CODE_02CDB1                           ; $02CDA5 |
  LDA #$003B                                ; $02CDA7 |\ play sound #$003B
  JSL push_sound_queue                      ; $02CDAA |/
  INC !s_spr_wildcard_4_lo_dp,x             ; $02CDAE |
  RTS                                       ; $02CDB0 |

CODE_02CDB1:
  CMP #$0028                                ; $02CDB1 |
  BNE CODE_02CDDB                           ; $02CDB4 |
  LDA #$8006                                ; $02CDB6 |

CODE_02CDB9:
  STA !s_pipe_transition_type_lo            ; $02CDB9 |
  LDA #$0006                                ; $02CDBC |
  STA !s_player_state                       ; $02CDBF |
  STZ !s_pipe_transition_dist_moved         ; $02CDC2 |
  STZ !s_player_pipe_anim_state             ; $02CDC5 |
  STZ $61F6                                 ; $02CDC8 |
  LDA #$0001                                ; $02CDCB |
  STA !s_player_pipe_enter_accel            ; $02CDCE |
  STZ !s_player_x_speed_prev                ; $02CDD1 |
  STZ !s_player_y_speed                     ; $02CDD4 |
  STZ !s_egg_throw_state                    ; $02CDD7 |
  RTS                                       ; $02CDDA |

CODE_02CDDB:
  BCS CODE_02CDE1                           ; $02CDDB |
  LSR !s_pipe_transition_dist_moved         ; $02CDDD |
  RTS                                       ; $02CDE0 |

CODE_02CDE1:
  AND #$003F                                ; $02CDE1 |
  BNE CODE_02CDF3                           ; $02CDE4 |
  LDA $10                                   ; $02CDE6 |
  AND #$0001                                ; $02CDE8 |
  CLC                                       ; $02CDEB |
  ADC #$0047                                ; $02CDEC |
  JSL push_sound_queue                      ; $02CDEF |

CODE_02CDF3:
  RTS                                       ; $02CDF3 |

; prince froggy state $02
  TYX                                       ; $02CDF4 |
  RTS                                       ; $02CDF5 |

  dw $0004                                  ; $02CDF6 |
  dw $0006                                  ; $02CDF8 |

; prince froggy sub
CODE_02CDFA:
  LDA !s_spr_cam_x_pos,x                    ; $02CDFA |
  STA $6040                                 ; $02CDFD |
  LDA !s_spr_cam_y_pos,x                    ; $02CE00 |
  STA $6042                                 ; $02CE03 |
  LDX #$08                                  ; $02CE06 |
  LDA #$E4BD                                ; $02CE08 |
  JSL r_gsu_init_1                          ; $02CE0B | GSU init
  LDX $12                                   ; $02CE0F |
  LDA #$36BA                                ; $02CE11 |
  STA !gsu_r5                               ; $02CE14 |
  LDA $14                                   ; $02CE17 |
  LDY !s_spr_timer_1,x                      ; $02CE19 |
  BEQ CODE_02CE23                           ; $02CE1C |
  ASL A                                     ; $02CE1E |
  ASL A                                     ; $02CE1F |
  ASL A                                     ; $02CE20 |
  LDY #$02                                  ; $02CE21 |

CODE_02CE23:
  STA !gsu_r1                               ; $02CE23 |
  STA !gsu_r7                               ; $02CE26 |
  LDA $CDF6,y                               ; $02CE29 |
  STA !gsu_r8                               ; $02CE2C |
  ASL A                                     ; $02CE2F |
  ASL A                                     ; $02CE30 |
  STA !gsu_r2                               ; $02CE31 |
  LDA #$0004                                ; $02CE34 |
  STA !gsu_r3                               ; $02CE37 |
  STA !gsu_r9                               ; $02CE3A |
  LDA !r_bg3_cam_x                          ; $02CE3D |
  STA !gsu_r10                              ; $02CE40 |
  LDA $14                                   ; $02CE43 |
  EOR #$FFFF                                ; $02CE45 |
  LSR A                                     ; $02CE48 |
  LSR A                                     ; $02CE49 |
  LSR A                                     ; $02CE4A |
  CLC                                       ; $02CE4B |
  ADC !r_bg1_cam_y                          ; $02CE4C |
  STA !gsu_r11                              ; $02CE4F |
  LDX #$0A                                  ; $02CE52 |
  LDA #$8F10                                ; $02CE54 |
  JSL r_gsu_init_1                          ; $02CE57 | GSU init
  JSL $00BE39                               ; $02CE5B |

; args to $00BE39
  dw $5040, $727E, $7033, $0690             ; $02CE5F |

  LDX #$0A                                  ; $02CE67 |
  LDA #$8C48                                ; $02CE69 |
  JSL r_gsu_init_1                          ; $02CE6C | GSU init
  LDA #$0098                                ; $02CE70 |
  TSB !r_reg_hdmaen_mirror                  ; $02CE73 |
  LDX $12                                   ; $02CE76 |
  JSL $03AA52                               ; $02CE78 |
  REP #$10                                  ; $02CE7C |
  LDY !s_spr_oam_pointer,x                  ; $02CE7E |
  LDA $704582                               ; $02CE81 |
  SEC                                       ; $02CE85 |
  SBC #$0005                                ; $02CE86 |
  STA $00                                   ; $02CE89 |
  CLC                                       ; $02CE8B |
  ADC $6020,y                               ; $02CE8C |
  STA $6020,y                               ; $02CE8F |
  LDA $704584                               ; $02CE92 |
  STA $02                                   ; $02CE96 |
  CLC                                       ; $02CE98 |
  ADC $6022,y                               ; $02CE99 |
  STA $6022,y                               ; $02CE9C |
  LDA $6028,y                               ; $02CE9F |
  CLC                                       ; $02CEA2 |
  ADC $00                                   ; $02CEA3 |
  STA $6028,y                               ; $02CEA5 |
  LDA $602A,y                               ; $02CEA8 |
  CLC                                       ; $02CEAB |
  ADC $02                                   ; $02CEAC |
  STA $602A,y                               ; $02CEAE |
  LDX $12                                   ; $02CEB1 |
  LDA !s_spr_wildcard_5_hi_dp,x             ; $02CEB3 |
  AND #$00FF                                ; $02CEB5 |
  ASL A                                     ; $02CEB8 |
  TAX                                       ; $02CEB9 |
  LDA $00E9D4,x                             ; $02CEBA |
  ASL A                                     ; $02CEBE |
  ASL A                                     ; $02CEBF |
  ASL A                                     ; $02CEC0 |
  ASL A                                     ; $02CEC1 |
  AND #$FF00                                ; $02CEC2 |
  BPL CODE_02CECA                           ; $02CEC5 |
  ORA #$00FF                                ; $02CEC7 |

CODE_02CECA:
  XBA                                       ; $02CECA |
  EOR #$FFFF                                ; $02CECB |
  SEC                                       ; $02CECE |
  ADC $00                                   ; $02CECF |
  STA $00                                   ; $02CED1 |
  LDA $00E954,x                             ; $02CED3 |
  ASL A                                     ; $02CED7 |
  ASL A                                     ; $02CED8 |
  ASL A                                     ; $02CED9 |
  ASL A                                     ; $02CEDA |
  AND #$FF00                                ; $02CEDB |
  BPL CODE_02CEE3                           ; $02CEDE |
  ORA #$00FF                                ; $02CEE0 |

CODE_02CEE3:
  XBA                                       ; $02CEE3 |
  CLC                                       ; $02CEE4 |
  ADC $02                                   ; $02CEE5 |
  STA $02                                   ; $02CEE7 |
  LDX #$0004                                ; $02CEE9 |

CODE_02CEEC:
  LDA $6000,y                               ; $02CEEC |
  CLC                                       ; $02CEEF |
  ADC $00                                   ; $02CEF0 |
  STA $6000,y                               ; $02CEF2 |
  LDA $6002,y                               ; $02CEF5 |
  CLC                                       ; $02CEF8 |
  ADC $02                                   ; $02CEF9 |
  STA $6002,y                               ; $02CEFB |
  TYA                                       ; $02CEFE |
  CLC                                       ; $02CEFF |
  ADC #$0008                                ; $02CF00 |
  TAY                                       ; $02CF03 |
  DEX                                       ; $02CF04 |
  BNE CODE_02CEEC                           ; $02CF05 |
  SEP #$10                                  ; $02CF07 |
  LDX $12                                   ; $02CF09 |
  LDA $00                                   ; $02CF0B |
  CLC                                       ; $02CF0D |
  ADC #$0008                                ; $02CF0E |
  STA !s_spr_x_hitbox_offset,x              ; $02CF11 |
  LDA $02                                   ; $02CF14 |
  CLC                                       ; $02CF16 |
  ADC #$0004                                ; $02CF17 |
  STA !s_spr_y_hitbox_offset,x              ; $02CF1A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02CF1D |
  CMP !s_spr_gsu_morph_1_lo,x               ; $02CF1F |
  BEQ CODE_02CF6D                           ; $02CF22 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02CF24 |
  LDY #$00                                  ; $02CF27 |
  AND #$FF00                                ; $02CF29 |
  BMI CODE_02CF33                           ; $02CF2C |
  EOR #$FF00                                ; $02CF2E |
  LDY #$02                                  ; $02CF31 |

CODE_02CF33:
  XBA                                       ; $02CF33 |
  STA !gsu_r5                               ; $02CF34 |
  TYA                                       ; $02CF37 |
  STA !s_spr_facing_dir,x                   ; $02CF38 |
  LDA #$0100                                ; $02CF3B |
  STA !gsu_r6                               ; $02CF3E |
  LDY !s_spr_dyntile_index,x                ; $02CF41 |
  TYX                                       ; $02CF44 |
  LDA $03A9CE,x                             ; $02CF45 |
  STA !gsu_r3                               ; $02CF49 |
  LDA $03A9EE,x                             ; $02CF4C |
  STA !gsu_r2                               ; $02CF50 |
  LDA #$6041                                ; $02CF53 |
  STA !gsu_r12                              ; $02CF56 |
  LDA #$0056                                ; $02CF59 |
  STA !gsu_r13                              ; $02CF5C |
  LDX #$08                                  ; $02CF5F |
  LDA #$8205                                ; $02CF61 |
  JSL r_gsu_init_1                          ; $02CF64 | GSU init
  INC $0CF9                                 ; $02CF68 |
  LDX $12                                   ; $02CF6B |

CODE_02CF6D:
  RTS                                       ; $02CF6D |

  dw $FFA0                                  ; $02CF6E |
  dw $0060                                  ; $02CF70 |

init_giant_shyguy:
  LDA !s_spr_wildcard_2_lo,x                ; $02CF72 |
  BNE CODE_02CF8F                           ; $02CF75 |
  LDA !s_spr_bitwise_settings_1,x           ; $02CF77 |
  AND #$F9FF                                ; $02CF7A |
  STA !s_spr_bitwise_settings_1,x           ; $02CF7D |
  LDA !s_spr_bitwise_settings_3,x           ; $02CF80 |
  AND #$FFE0                                ; $02CF83 |
  STA !s_spr_bitwise_settings_3,x           ; $02CF86 |
  LDA #$0100                                ; $02CF89 |
  STA !s_spr_y_accel_ceiling,x              ; $02CF8C |

CODE_02CF8F:
  LDA $10                                   ; $02CF8F |
  AND #$0002                                ; $02CF91 |
  STA !s_spr_facing_dir,x                   ; $02CF94 |
  TAY                                       ; $02CF97 |
  LDA $CF6E,y                               ; $02CF98 |
  STA !s_spr_x_accel_ceiling,x              ; $02CF9B |
  RTL                                       ; $02CF9E |

  db $00, $01, $02, $03                     ; $02CF9F |
  db $04, $03, $02                          ; $02CFA3 |

main_giant_shyguy:
  LDA !s_spr_state,x                        ; $02CFA6 |
  CMP #$0008                                ; $02CFA9 |
  BNE CODE_02CFC9                           ; $02CFAC |
  STA !s_spr_wildcard_2_lo,x                ; $02CFAE |
  LDA #$0400                                ; $02CFB1 |
  STA !s_spr_y_accel_ceiling,x              ; $02CFB4 |
  LDA !s_spr_bitwise_settings_1,x           ; $02CFB7 |
  ORA #$0600                                ; $02CFBA |
  STA !s_spr_bitwise_settings_1,x           ; $02CFBD |
  LDA !s_spr_bitwise_settings_3,x           ; $02CFC0 |
  ORA #$0017                                ; $02CFC3 |
  STA !s_spr_bitwise_settings_3,x           ; $02CFC6 |

CODE_02CFC9:
  JSL $03AF23                               ; $02CFC9 |
  LDA !s_spr_wildcard_2_lo,x                ; $02CFCD |
  BNE CODE_02CFED                           ; $02CFD0 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02CFD2 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02CFD4 |
  CMP #$0028                                ; $02CFD6 |
  BCC CODE_02D03C                           ; $02CFD9 |
  INC !s_spr_wildcard_2_lo,x                ; $02CFDB |
  LDA #$0300                                ; $02CFDE |
  STA !s_spr_y_accel_ceiling,x              ; $02CFE1 |
  LDA !s_spr_bitwise_settings_3,x           ; $02CFE4 |
  ORA #$0017                                ; $02CFE7 |
  STA !s_spr_bitwise_settings_3,x           ; $02CFEA |

CODE_02CFED:
  LDA $7860,x                               ; $02CFED |
  AND #$0001                                ; $02CFF0 |
  BEQ CODE_02D02D                           ; $02CFF3 |
  LDA #$0400                                ; $02CFF5 |
  STA !s_spr_y_accel_ceiling,x              ; $02CFF8 |
  LDA !s_spr_bitwise_settings_1,x           ; $02CFFB |
  ORA #$0600                                ; $02CFFE |
  STA !s_spr_bitwise_settings_1,x           ; $02D001 |
  LDA !s_spr_x_speed_lo,x                   ; $02D004 |
  ASL A                                     ; $02D007 |
  ADC !s_spr_x_speed_lo,x                   ; $02D008 |
  BPL CODE_02D011                           ; $02D00B |
  EOR #$FFFF                                ; $02D00D |
  INC A                                     ; $02D010 |

CODE_02D011:
  LSR A                                     ; $02D011 |
  LSR A                                     ; $02D012 |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $02D013 |
  CMP #$0700                                ; $02D015 |
  BCC CODE_02D01D                           ; $02D018 |
  SBC #$0700                                ; $02D01A |

CODE_02D01D:
  STA !s_spr_wildcard_3_lo_dp,x             ; $02D01D |
  XBA                                       ; $02D01F |
  TAY                                       ; $02D020 |
  LDA $CF9F,y                               ; $02D021 |
  AND #$00FF                                ; $02D024 |
  STA !s_spr_anim_frame,x                   ; $02D027 |
  LDA #$0020                                ; $02D02A |

CODE_02D02D:
  STA !s_spr_x_accel,x                      ; $02D02D |
  LDA !s_spr_y_accel_ceiling,x              ; $02D030 |
  CMP #$0400                                ; $02D033 |
  BNE CODE_02D03C                           ; $02D036 |
  JSL $03A5B7                               ; $02D038 |

CODE_02D03C:
  RTL                                       ; $02D03C |

; unknown
  RTL                                       ; $02D03D |

; unknown
  RTL                                       ; $02D03E |

init_froggy_stomach_acid:
  RTL                                       ; $02D03F |

main_froggy_stomach_acid:
  JSL $03AF23                               ; $02D040 |
  LDA !s_spr_y_accel_ceiling,x              ; $02D044 |
  BEQ CODE_02D04C                           ; $02D047 |
  JMP CODE_02D09D                           ; $02D049 |

CODE_02D04C:
  TXY                                       ; $02D04C |
  JSR CODE_02D0D9                           ; $02D04D |
  LDA $00                                   ; $02D050 |
  SEC                                       ; $02D052 |
  SBC !s_spr_x_pixel_pos,x                  ; $02D053 |
  CLC                                       ; $02D056 |
  ADC #$0008                                ; $02D057 |
  CMP #$0011                                ; $02D05A |
  BCS CODE_02D087                           ; $02D05D |
  LDA $02                                   ; $02D05F |
  SEC                                       ; $02D061 |
  SBC !s_spr_y_pixel_pos,x                  ; $02D062 |
  CLC                                       ; $02D065 |
  ADC #$0008                                ; $02D066 |
  CMP #$0011                                ; $02D069 |
  BCS CODE_02D087                           ; $02D06C |
  LDA $02                                   ; $02D06E |
  STA !s_spr_y_pixel_pos,x                  ; $02D070 |
  LDA $00                                   ; $02D073 |
  STA !s_spr_x_pixel_pos,x                  ; $02D075 |
  LDA #$0006                                ; $02D078 |
  STA !s_spr_draw_priority,x                ; $02D07B |
  INC !s_spr_wildcard_6_lo_dp,x             ; $02D07E |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02D080 |
  CMP #$0010                                ; $02D082 |
  BCC CODE_02D09C                           ; $02D085 |

CODE_02D087:
  LDA #$0100                                ; $02D087 |
  STA !s_spr_y_speed_lo,x                   ; $02D08A |
  STA !s_spr_y_accel_ceiling,x              ; $02D08D |
  LDA !s_spr_bitwise_settings_3,x           ; $02D090 |
  ORA #$0001                                ; $02D093 |
  STA !s_spr_bitwise_settings_3,x           ; $02D096 |
  INC !s_spr_anim_frame,x                   ; $02D099 |

CODE_02D09C:
  RTL                                       ; $02D09C |

CODE_02D09D:
  LDY !s_spr_collision_id,x                 ; $02D09D |
  BEQ CODE_02D0A8                           ; $02D0A0 |
  JSL player_hit_sprite                     ; $02D0A2 |
  BRA CODE_02D0AE                           ; $02D0A6 |

CODE_02D0A8:
  LDA $7860,x                               ; $02D0A8 |
  LSR A                                     ; $02D0AB |
  BCC CODE_02D0D8                           ; $02D0AC |

CODE_02D0AE:
  LDA #$0045                                ; $02D0AE |\ play sound #$0045
  JSL push_sound_queue                      ; $02D0B1 |/
  LDA #$0221                                ; $02D0B5 |
  JSL spawn_ambient_sprite                  ; $02D0B8 |
  LDA !s_spr_x_pixel_pos,x                  ; $02D0BC |
  STA $70A2,y                               ; $02D0BF |
  LDA !s_spr_y_pixel_pos,x                  ; $02D0C2 |
  STA $7142,y                               ; $02D0C5 |
  LDA #$0007                                ; $02D0C8 |
  STA $73C2,y                               ; $02D0CB |
  LDA #$0002                                ; $02D0CE |
  STA $7782,y                               ; $02D0D1 |
  JML $03A31E                               ; $02D0D4 |

CODE_02D0D8:
  RTL                                       ; $02D0D8 |

; prince froggy sub
CODE_02D0D9:
  REP #$10                                  ; $02D0D9 |
  LDX !s_spr_wildcard_5_lo_dp,y             ; $02D0DB |
  LDA $70449E,x                             ; $02D0DD |
  SEC                                       ; $02D0E1 |
  SBC #$0008                                ; $02D0E2 |
  LDX !s_spr_wildcard_4_lo_dp,y             ; $02D0E5 |
  CLC                                       ; $02D0E7 |
  ADC !s_spr_x_pixel_pos,x                  ; $02D0E8 |
  STA $00                                   ; $02D0EB |
  LDA !s_spr_wildcard_6_lo,y                ; $02D0ED |
  LSR A                                     ; $02D0F0 |
  LDX !s_spr_wildcard_5_lo_dp,y             ; $02D0F1 |
  CLC                                       ; $02D0F3 |
  ADC $7044A0,x                             ; $02D0F4 |
  SEC                                       ; $02D0F8 |
  SBC #$000C                                ; $02D0F9 |
  LDX !s_spr_wildcard_4_lo_dp,y             ; $02D0FC |
  CLC                                       ; $02D0FE |
  ADC !s_spr_y_pixel_pos,x                  ; $02D0FF |
  STA $02                                   ; $02D102 |
  SEP #$10                                  ; $02D104 |
  LDX $12                                   ; $02D106 |
  RTS                                       ; $02D108 |

  dw $3898, $3898, $28A3, $18A7             ; $02D109 |
  dw $08AA, $F8AC, $E8AD, $D8B0             ; $02D111 |
  dw $C8B2, $B8B8, $A0C8, $95E6             ; $02D119 |
  dw $A41C, $0C40, $3870, $3870             ; $02D121 |
  dw $3800, $38F8, $3898, $3898             ; $02D129 |
  dw $28A3, $18A9, $D8B0, $C8B2             ; $02D131 |
  dw $B8B8, $A0C8, $95E6, $A41C             ; $02D139 |
  dw $0C40, $3870, $3870, $3808             ; $02D141 |

init_sluggy_unshaven:
  JSL $03AEEB                               ; $02D149 |
  LDY #$3C                                  ; $02D14D |
  JSL $0CE5D6                               ; $02D14F |
  LDA #$0010                                ; $02D153 |
  STA $7049C6                               ; $02D156 |
  DEC A                                     ; $02D15A |
  ASL A                                     ; $02D15B |
  TAX                                       ; $02D15C |

CODE_02D15D:
  LDA $D109,x                               ; $02D15D |
  STA $7049C7,x                             ; $02D160 |
  DEX                                       ; $02D164 |
  DEX                                       ; $02D165 |
  BPL CODE_02D15D                           ; $02D166 |
  LDX #$3C                                  ; $02D168 |

CODE_02D16A:
  LDA $5FE54E,x                             ; $02D16A |
  STA $702E2E,x                             ; $02D16E |
  STA $7020C2,x                             ; $02D172 |
  DEX                                       ; $02D176 |
  DEX                                       ; $02D177 |
  BPL CODE_02D16A                           ; $02D178 |
  LDX $12                                   ; $02D17A |
  STZ !s_spr_x_hitbox_offset,x              ; $02D17C |
  STZ !s_spr_y_hitbox_offset,x              ; $02D17F |
  LDA #$000B                                ; $02D182 |
  STA !s_spr_anim_frame,x                   ; $02D185 |
  RTL                                       ; $02D188 |

  dw $FF60                                  ; $02D189 |
  dw $FF5C                                  ; $02D18B |
  dw $FF58                                  ; $02D18D |
  dw $FF54                                  ; $02D18F |
  dw $FF00                                  ; $02D191 |
  dw $0100                                  ; $02D193 |

main_sluggy_unshaven:
  JSR CODE_02D7D6                           ; $02D195 |
  JSL $03AF23                               ; $02D198 |
  TXY                                       ; $02D19C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02D19D |\
  ASL A                                     ; $02D19F | | run state routine
  TAX                                       ; $02D1A0 | |
  JSR (sluggy_state_ptr,x)                  ; $02D1A1 |/
  TXA                                       ; $02D1A4 |
  STA $6012                                 ; $02D1A5 |
  LDA !s_player_x_cam_rel                   ; $02D1A8 |
  STA $6014                                 ; $02D1AB |
  LDA !s_player_y_cam_rel                   ; $02D1AE |
  STA $6016                                 ; $02D1B1 |
  LDA !s_player_duck_state                  ; $02D1B4 |
  STA $6018                                 ; $02D1B7 |
  LDX #$0A                                  ; $02D1BA |
  LDA #$8390                                ; $02D1BC |
  JSL r_gsu_init_1                          ; $02D1BF | GSU init
  LDX $12                                   ; $02D1C3 |
  LDA $601A                                 ; $02D1C5 |
  BEQ CODE_02D1DF                           ; $02D1C8 |
  DEC !s_player_x                           ; $02D1CA |
  LDA $093A                                 ; $02D1CD |
  CLC                                       ; $02D1D0 |
  ADC #$0100                                ; $02D1D1 |
  STA $093A                                 ; $02D1D4 |
  LDA !s_player_x_speed                     ; $02D1D7 |
  BMI CODE_02D1DF                           ; $02D1DA |
  STZ !s_player_x_speed                     ; $02D1DC |

CODE_02D1DF:
  LDA $6014                                 ; $02D1DF |
  BEQ CODE_02D1F6                           ; $02D1E2 |
  LDA !s_spr_x_speed_lo                     ; $02D1E4 |
  CLC                                       ; $02D1E7 |
  ADC #$FF80                                ; $02D1E8 |
  CMP #$FF00                                ; $02D1EB |
  BPL CODE_02D1F3                           ; $02D1EE |
  LDA #$FF00                                ; $02D1F0 |

CODE_02D1F3:
  STA !s_spr_x_speed_lo                     ; $02D1F3 |

CODE_02D1F6:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02D1F6 |
  CMP #$0003                                ; $02D1F8 |
  BCS CODE_02D210                           ; $02D1FB |
  LDY !s_spr_collision_id,x                 ; $02D1FD |
  DEY                                       ; $02D200 |
  BMI CODE_02D210                           ; $02D201 |
  LDA !s_spr_state,y                        ; $02D203 |
  CMP #$0010                                ; $02D206 |
  BNE CODE_02D210                           ; $02D209 |
  LDA !s_spr_collision_state,y              ; $02D20B |
  BNE CODE_02D213                           ; $02D20E |

CODE_02D210:
  JMP CODE_02D2F3                           ; $02D210 |

CODE_02D213:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02D213 |
  ASL A                                     ; $02D216 |
  TAX                                       ; $02D217 |
  LDA $D189,x                               ; $02D218 |
  LDX $12                                   ; $02D21B |
  CLC                                       ; $02D21D |
  ADC !s_spr_x_pixel_pos,x                  ; $02D21E |
  SEC                                       ; $02D221 |
  SBC !s_spr_x_hitbox_center,y              ; $02D222 |
  ASL A                                     ; $02D225 |
  CLC                                       ; $02D226 |
  ADC !s_spr_x_speed_lo,y                   ; $02D227 |
  STA !s_spr_x_speed_lo,y                   ; $02D22A |
  BPL CODE_02D235                           ; $02D22D |
  LDA #$0040                                ; $02D22F |
  STA !s_spr_y_accel,y                      ; $02D232 |

CODE_02D235:
  LDX #$00                                  ; $02D235 |
  LDA !s_spr_y_speed_lo,y                   ; $02D237 |
  BEQ CODE_02D252                           ; $02D23A |
  BPL CODE_02D240                           ; $02D23C |
  LDX #$02                                  ; $02D23E |

CODE_02D240:
  CLC                                       ; $02D240 |
  ADC $D191,x                               ; $02D241 |
  STA !s_spr_y_speed_lo,y                   ; $02D244 |
  EOR $D191,x                               ; $02D247 |
  BMI CODE_02D252                           ; $02D24A |
  LDA #$0000                                ; $02D24C |
  STA !s_spr_y_speed_lo,y                   ; $02D24F |

CODE_02D252:
  LDX $12                                   ; $02D252 |
  LDA !s_spr_x_hitbox_center,y              ; $02D254 |
  SEC                                       ; $02D257 |
  SBC !s_spr_x_pixel_pos,x                  ; $02D258 |
  CLC                                       ; $02D25B |
  ADC #$0004                                ; $02D25C |
  STA $00                                   ; $02D25F |
  LDA $7049CA                               ; $02D261 |
  AND #$00FF                                ; $02D265 |
  CLC                                       ; $02D268 |
  ADC !s_spr_y_pixel_pos,x                  ; $02D269 |
  SEC                                       ; $02D26C |
  SBC !s_spr_y_hitbox_center,y              ; $02D26D |
  BPL CODE_02D275                           ; $02D270 |
  LDA #$0000                                ; $02D272 |

CODE_02D275:
  TAY                                       ; $02D275 |
  AND #$00F0                                ; $02D276 |
  LSR A                                     ; $02D279 |
  LSR A                                     ; $02D27A |
  LSR A                                     ; $02D27B |
  TAX                                       ; $02D27C |
  BEQ CODE_02D2B5                           ; $02D27D |
  PHX                                       ; $02D27F |
  TYA                                       ; $02D280 |
  AND #$000F                                ; $02D281 |
  ASL A                                     ; $02D284 |
  EOR #$FFFF                                ; $02D285 |
  SEC                                       ; $02D288 |
  ADC $00                                   ; $02D289 |
  STA $02                                   ; $02D28B |

CODE_02D28D:
  LDA $7049C8,x                             ; $02D28D |
  AND #$FF00                                ; $02D291 |
  BPL CODE_02D299                           ; $02D294 |
  ORA #$00FF                                ; $02D296 |

CODE_02D299:
  XBA                                       ; $02D299 |
  CMP $02                                   ; $02D29A |
  BPL CODE_02D2A8                           ; $02D29C |
  SEP #$20                                  ; $02D29E |
  LDA $02                                   ; $02D2A0 |
  STA $7049C9,x                             ; $02D2A2 |
  REP #$20                                  ; $02D2A6 |

CODE_02D2A8:
  LDA $02                                   ; $02D2A8 |
  SEC                                       ; $02D2AA |
  SBC #$0020                                ; $02D2AB |
  STA $02                                   ; $02D2AE |
  DEX                                       ; $02D2B0 |
  DEX                                       ; $02D2B1 |
  BNE CODE_02D28D                           ; $02D2B2 |
  PLX                                       ; $02D2B4 |

CODE_02D2B5:
  INX                                       ; $02D2B5 |
  INX                                       ; $02D2B6 |
  TYA                                       ; $02D2B7 |
  EOR #$000F                                ; $02D2B8 |
  INC A                                     ; $02D2BB |
  AND #$000F                                ; $02D2BC |
  ASL A                                     ; $02D2BF |
  EOR #$FFFF                                ; $02D2C0 |
  SEC                                       ; $02D2C3 |
  ADC $00                                   ; $02D2C4 |
  STA $02                                   ; $02D2C6 |

CODE_02D2C8:
  LDA $7049C8,x                             ; $02D2C8 |
  AND #$FF00                                ; $02D2CC |
  BPL CODE_02D2D4                           ; $02D2CF |
  ORA #$00FF                                ; $02D2D1 |

CODE_02D2D4:
  XBA                                       ; $02D2D4 |
  CMP $02                                   ; $02D2D5 |
  BPL CODE_02D2E3                           ; $02D2D7 |
  SEP #$20                                  ; $02D2D9 |
  LDA $02                                   ; $02D2DB |
  STA $7049C9,x                             ; $02D2DD |
  REP #$20                                  ; $02D2E1 |

CODE_02D2E3:
  LDA $02                                   ; $02D2E3 |
  SEC                                       ; $02D2E5 |
  SBC #$0020                                ; $02D2E6 |
  STA $02                                   ; $02D2E9 |
  INX                                       ; $02D2EB |
  INX                                       ; $02D2EC |
  CPX #$12                                  ; $02D2ED |
  BCC CODE_02D2C8                           ; $02D2EF |
  LDX $12                                   ; $02D2F1 |

CODE_02D2F3:
  RTL                                       ; $02D2F3 |

sluggy_state_ptr:
  dw sluggy_kamek                           ; $02D2F4 | $00: kamek
  dw $D439                                  ; $02D2F6 | $01:
  dw sluggy_forward                         ; $02D2F8 | $02: inching forward
  dw $D614                                  ; $02D2FA | $03:
  dw $D6CE                                  ; $02D2FC | $04:

  db $0B, $0C, $0D, $0C                     ; $02D2FE |
  db $0D, $0C, $0B, $0C                     ; $02D302 |
  db $0D, $20, $04, $04                     ; $02D306 |
  db $01, $01                               ; $02D30A |

sluggy_kamek:
  TYX                                       ; $02D30C |
  LDA !s_spr_bitwise_settings_3,x           ; $02D30D |
  AND #$001F                                ; $02D310 |
  BNE CODE_02D38B                           ; $02D313 |
  LDA !s_player_state                       ; $02D315 |
  CMP #$0002                                ; $02D318 |
  BEQ CODE_02D35A                           ; $02D31B |
  LDA !s_spr_x_player_delta,x               ; $02D31D |
  CMP #$0070                                ; $02D320 |
  BPL CODE_02D346                           ; $02D323 |
  LDA #$00F1                                ; $02D325 |
  STA !r_apu_io_0_mirror                    ; $02D328 |
  LDA #$0080                                ; $02D32B |
  STA !s_spr_timer_1,x                      ; $02D32E |
  LDA #$0048                                ; $02D331 |\
  JSL spawn_sprite_init                     ; $02D334 | |
  BCC CODE_02D346                           ; $02D338 | |
  LDA !s_spr_x_pixel_pos,x                  ; $02D33A | | spawn kamek at sluggy's position
  STA !s_spr_x_pixel_pos,y                  ; $02D33D | |
  LDA !s_spr_y_pixel_pos,x                  ; $02D340 | |
  STA !s_spr_y_pixel_pos,y                  ; $02D343 |/

CODE_02D346:
  LDA $14                                   ; $02D346 |
  AND #$0018                                ; $02D348 |
  LSR A                                     ; $02D34B |
  LSR A                                     ; $02D34C |
  LSR A                                     ; $02D34D |
  TAY                                       ; $02D34E |
  LDA $D2FE,y                               ; $02D34F |
  AND #$00FF                                ; $02D352 |
  STA !s_spr_anim_frame,x                   ; $02D355 |
  PLA                                       ; $02D358 |
  RTL                                       ; $02D359 |

CODE_02D35A:
  LDA !s_spr_timer_1,x                      ; $02D35A |
  BEQ CODE_02D368                           ; $02D35D |
  LSR A                                     ; $02D35F |
  BNE CODE_02D346                           ; $02D360 |
  LDA #$0009                                ; $02D362 |
  STA !r_apu_io_0_mirror                    ; $02D365 |

CODE_02D368:
  LDA $14                                   ; $02D368 |
  AND #$0003                                ; $02D36A |
  BNE CODE_02D389                           ; $02D36D |
  INC !s_spr_anim_frame,x                   ; $02D36F |
  LDA !s_spr_anim_frame,x                   ; $02D372 |
  CMP #$0010                                ; $02D375 |
  BCC CODE_02D389                           ; $02D378 |
  LDA !s_spr_bitwise_settings_3,x           ; $02D37A |
  ORA #$0001                                ; $02D37D |
  STA !s_spr_bitwise_settings_3,x           ; $02D380 |
  LDA #$0040                                ; $02D383 |
  STA !s_spr_y_accel,x                      ; $02D386 |

CODE_02D389:
  PLA                                       ; $02D389 |
  RTL                                       ; $02D38A |

CODE_02D38B:
  LDA $7860,x                               ; $02D38B |
  LSR A                                     ; $02D38E |
  BCC CODE_02D389                           ; $02D38F |
  LDA !s_spr_y_accel,x                      ; $02D391 |
  BEQ CODE_02D3B1                           ; $02D394 |
  LDA #$0060                                ; $02D396 |\ play sound #$0060
  JSL push_sound_queue                      ; $02D399 |/
  STZ !s_spr_y_accel,x                      ; $02D39D |
  LDA !s_spr_oam_yxppccct,x                 ; $02D3A0 |
  ORA #$0080                                ; $02D3A3 |
  STA !s_spr_oam_yxppccct,x                 ; $02D3A6 |
  LDA #$0005                                ; $02D3A9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D3AC |
  STZ !s_spr_timer_1,x                      ; $02D3AE |

CODE_02D3B1:
  LDA !s_spr_timer_1,x                      ; $02D3B1 |
  BNE CODE_02D433                           ; $02D3B4 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02D3B6 |
  BNE CODE_02D41D                           ; $02D3B8 |
  LDA $1015                                 ; $02D3BA |
  BNE CODE_02D3C2                           ; $02D3BD |
  INC $1015                                 ; $02D3BF |

CODE_02D3C2:
  BPL CODE_02D433                           ; $02D3C2 |
  STZ $1015                                 ; $02D3C4 |
  LDA #$0087                                ; $02D3C7 |\ play sound #$0087
  JSL push_sound_queue                      ; $02D3CA |/
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D3CE |
  STZ !s_spr_anim_frame,x                   ; $02D3D0 |
  LDA !s_spr_y_pixel_pos,x                  ; $02D3D3 |
  CLC                                       ; $02D3D6 |
  ADC #$000F                                ; $02D3D7 |
  STA !s_spr_wildcard_2_lo,x                ; $02D3DA |
  LDA #$FE80                                ; $02D3DD |
  STA !s_spr_x_accel_ceiling,x              ; $02D3E0 |
  LDA !s_spr_oam_yxppccct,x                 ; $02D3E3 |
  AND #$FF3F                                ; $02D3E6 |
  STA !s_spr_oam_yxppccct,x                 ; $02D3E9 |
  LDA !s_spr_bitwise_settings_3,x           ; $02D3EC |
  AND #$FFE0                                ; $02D3EF |
  STA !s_spr_bitwise_settings_3,x           ; $02D3F2 |
  LDA !s_spr_oam_1,x                        ; $02D3F5 |
  CLC                                       ; $02D3F8 |
  ADC #$E000                                ; $02D3F9 |
  STA !s_spr_oam_1,x                        ; $02D3FC |
  STZ !s_spr_y_speed_lo,x                   ; $02D3FF |
  SEP #$20                                  ; $02D402 |
  STZ !s_spr_obj_tile_index,x               ; $02D404 |
  REP #$20                                  ; $02D407 |
  LDA #$0018                                ; $02D409 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D40C |
  JSR CODE_02D44C                           ; $02D40E |
  LDA !s_spr_x_pixel_pos,x                  ; $02D411 |
  CLC                                       ; $02D414 |
  ADC #$000A                                ; $02D415 |
  STA !s_spr_x_pixel_pos,x                  ; $02D418 |
  PLA                                       ; $02D41B |
  RTL                                       ; $02D41C |

CODE_02D41D:
  DEC !s_spr_wildcard_5_lo_dp,x             ; $02D41D |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02D41F |
  LDA $D302,y                               ; $02D421 |
  AND #$00FF                                ; $02D424 |
  STA !s_spr_anim_frame,x                   ; $02D427 |
  LDA $D307,y                               ; $02D42A |
  AND #$00FF                                ; $02D42D |
  STA !s_spr_timer_1,x                      ; $02D430 |

CODE_02D433:
  PLA                                       ; $02D433 |
  RTL                                       ; $02D434 |

sluggy_wait_times:
  db $80, $64, $48, $2C                     ; $02D435 |

; sluggy state $01
  TYX                                       ; $02D439 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02D43A |
  CMP #$0100                                ; $02D43C |
  BCS CODE_02D47A                           ; $02D43F |
  ADC #$0001                                ; $02D441 |
  CMP #$0100                                ; $02D444 |
  BCC CODE_02D44C                           ; $02D447 |
  LDA #$0100                                ; $02D449 |

CODE_02D44C:
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D44C |
  STA !gsu_r6                               ; $02D44E |
  LDA #$0002                                ; $02D451 |
  STA !gsu_r0                               ; $02D454 |
  LDA #$D109                                ; $02D457 |
  STA !gsu_r14                              ; $02D45A |
  LDX #$0A                                  ; $02D45D |
  LDA #$8F57                                ; $02D45F |
  JSL r_gsu_init_1                          ; $02D462 | GSU init
  LDX $12                                   ; $02D466 |
  LDA $7049C8                               ; $02D468 |
  AND #$00FF                                ; $02D46C |
  EOR #$FFFF                                ; $02D46F |
  SEC                                       ; $02D472 |
  ADC !s_spr_wildcard_2_lo,x                ; $02D473 |
  STA !s_spr_y_pixel_pos,x                  ; $02D476 |
  RTS                                       ; $02D479 |

CODE_02D47A:
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D47A |
  STZ !s_player_state                       ; $02D47C |

CODE_02D47F:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02D47F |
  STZ !s_spr_x_accel,x                      ; $02D481 |
  STZ !s_spr_x_speed_lo,x                   ; $02D484 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02D487 |\
  LDA sluggy_wait_times,y                   ; $02D48A | | set wait time (non-moving)
  AND #$00FF                                ; $02D48D | |
  STA !s_spr_timer_1,x                      ; $02D490 |/
  LDX #$1E                                  ; $02D493 |
  LDA #$0000                                ; $02D495 |

CODE_02D498:
  STA $704C96,x                             ; $02D498 |
  DEX                                       ; $02D49C |
  DEX                                       ; $02D49D |
  BPL CODE_02D498                           ; $02D49E |
  LDX $12                                   ; $02D4A0 |
  RTS                                       ; $02D4A2 |

sluggy_X_acceleration:
  dw $0020, $0000                           ; $02D4A3 |

  dw $0004, $FFFE                           ; $02D4A7 |

  dw $0040, $0000, $0006, $000A             ; $02D4AB |
  dw $000E, $0012, $0200, $01C0             ; $02D4B3 |
  dw $0180, $0140, $00C0, $00D0             ; $02D4BB |
  dw $00E0, $00F0, $0060, $0068             ; $02D4C3 |
  dw $0070, $0078, $0040, $0030             ; $02D4CB |
  dw $0020, $0010                           ; $02D4D3 |

; sluggy state $02: inching forward
sluggy_forward:
  TYX                                       ; $02D4D7 |
  LDA !s_spr_timer_1,x                      ; $02D4D8 |\ timer for waiting / not moving
  BEQ .move                                 ; $02D4DB |/
  LSR A                                     ; $02D4DD |\
  BNE CODE_02D536                           ; $02D4DE | | play Yoshi tongue noise
  LDA #$003E                                ; $02D4E0 | | on frame before timer runs out
  JSL push_sound_queue                      ; $02D4E3 |/
  BRA CODE_02D536                           ; $02D4E7 |

.move
  LDY !s_spr_wildcard_1_lo,x                ; $02D4E9 |
  LDA !s_spr_x_pixel_pos,x                  ; $02D4EC |\  if X coord < $C5
  CMP #$00C5                                ; $02D4EF | | do not move (reached the edge)
  BMI .zero_velocity                        ; $02D4F2 |/
  LDA sluggy_X_acceleration,y               ; $02D4F4 |\  X acceleration table
  STA !s_spr_x_accel,x                      ; $02D4F7 | | this causes movement
  BNE CODE_02D502                           ; $02D4FA |/  inching forward and retracting back

.zero_velocity
  STZ !s_spr_x_accel,x                      ; $02D4FC |\ on zero X acceleration
  STZ !s_spr_x_speed_lo,x                   ; $02D4FF |/ zero out velocity too

CODE_02D502:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02D502 |
  CLC                                       ; $02D504 |
  ADC $D4A7,y                               ; $02D505 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02D508 |
  STA !gsu_r6                               ; $02D50A |
  CMP $D4AB,y                               ; $02D50D |
  BNE CODE_02D51B                           ; $02D510 |
  TYA                                       ; $02D512 |
  EOR #$0002                                ; $02D513 |
  STA !s_spr_wildcard_1_lo,x                ; $02D516 |
  BEQ CODE_02D528                           ; $02D519 |

CODE_02D51B:
  LDX #$0A                                  ; $02D51B |
  LDA #$8FE2                                ; $02D51D |
  JSL r_gsu_init_1                          ; $02D520 | GSU init
  LDX $12                                   ; $02D524 |
  BRA CODE_02D536                           ; $02D526 |

CODE_02D528:
  LDX #$0A                                  ; $02D528 |
  LDA #$8FE2                                ; $02D52A |
  JSL r_gsu_init_1                          ; $02D52D | GSU init
  LDX $12                                   ; $02D531 |
  JSR CODE_02D47F                           ; $02D533 |

CODE_02D536:
  LDA !s_spr_timer_2,x                      ; $02D536 |
  BNE CODE_02D542                           ; $02D539 |
  LDA $14                                   ; $02D53B |
  AND #$0007                                ; $02D53D |
  BNE CODE_02D54D                           ; $02D540 |

CODE_02D542:
  LDX #$0A                                  ; $02D542 |
  LDA #$8FBB                                ; $02D544 |
  JSL r_gsu_init_1                          ; $02D547 | GSU init
  LDX $12                                   ; $02D54B |

CODE_02D54D:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02D54D |
  ASL A                                     ; $02D550 |
  TAY                                       ; $02D551 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02D552 |
  SEC                                       ; $02D554 |
  SBC $D4AF,y                               ; $02D555 |
  BPL CODE_02D566                           ; $02D558 |
  PHY                                       ; $02D55A |
  LDA #$0014                                ; $02D55B |\ play sound #$0014
  JSL push_sound_queue                      ; $02D55E |/
  PLY                                       ; $02D562 |
  LDA $D4B7,y                               ; $02D563 |

CODE_02D566:
  STA !s_spr_wildcard_3_lo_dp,x             ; $02D566 |
  CMP $D4BF,y                               ; $02D568 |
  BCC CODE_02D570                           ; $02D56B |
  LDA $D4BF,y                               ; $02D56D |

CODE_02D570:
  CMP $D4C7,y                               ; $02D570 |
  BCS CODE_02D57A                           ; $02D573 |
  LDA $D4BF,y                               ; $02D575 |
  SBC !s_spr_wildcard_3_lo_dp,x             ; $02D578 |

CODE_02D57A:
  CLC                                       ; $02D57A |
  ADC $D4CF,y                               ; $02D57B |
  JSR CODE_02D69A                           ; $02D57E |
  LDA !s_spr_timer_2,x                      ; $02D581 |
  BEQ CODE_02D58E                           ; $02D584 |
  CMP #$0040                                ; $02D586 |
  BCC CODE_02D5ED                           ; $02D589 |
  JMP CODE_02D5EE                           ; $02D58B |

CODE_02D58E:
  LDY !s_spr_collision_id,x                 ; $02D58E |
  DEY                                       ; $02D591 |
  BMI CODE_02D5ED                           ; $02D592 |
  LDA !s_spr_cam_x_pos,x                    ; $02D594 |
  CLC                                       ; $02D597 |
  ADC #$0080                                ; $02D598 |
  CMP #$0201                                ; $02D59B |
  BCS CODE_02D5ED                           ; $02D59E |
  LDA !s_spr_collision_state,y              ; $02D5A0 |
  BEQ CODE_02D5ED                           ; $02D5A3 |
  TYX                                       ; $02D5A5 |
  JSL $03B25B                               ; $02D5A6 |
  LDA #$0078                                ; $02D5AA |\ play sound #$0078
  JSL push_sound_queue                      ; $02D5AD |/ boss hit noise
  INC !s_spr_gsu_morph_2_lo,x               ; $02D5B1 |\
  LDA !s_spr_gsu_morph_2_lo,x               ; $02D5B4 | | increase boss damage
  CMP #$0004                                ; $02D5B7 | | if <= 4, skip dying
  BCC CODE_02D5E7                           ; $02D5BA |/
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D5BC | > 4, change to death state
  STZ !s_spr_x_accel,x                      ; $02D5BE |\ zero velocity & acceleration
  STZ !s_spr_x_speed_lo,x                   ; $02D5C1 |/
  LDA #$0100                                ; $02D5C4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02D5C7 |
  LDA #$0080                                ; $02D5C9 |
  STA !s_spr_timer_1,x                      ; $02D5CC |
  JSL $02A982                               ; $02D5CF |
  LDA $7049C6                               ; $02D5D3 |
  DEC A                                     ; $02D5D7 |
  ASL A                                     ; $02D5D8 |
  TAX                                       ; $02D5D9 |

CODE_02D5DA:
  LDA $D109,x                               ; $02D5DA |
  STA $704C76,x                             ; $02D5DD |
  DEX                                       ; $02D5E1 |
  DEX                                       ; $02D5E2 |
  BPL CODE_02D5DA                           ; $02D5E3 |
  LDX $12                                   ; $02D5E5 |

CODE_02D5E7:
  LDA #$0060                                ; $02D5E7 |
  STA !s_spr_timer_2,x                      ; $02D5EA |

CODE_02D5ED:
  RTS                                       ; $02D5ED |

CODE_02D5EE:
  AND #$0004                                ; $02D5EE |
  BEQ CODE_02D603                           ; $02D5F1 |
  LDX #$3C                                  ; $02D5F3 |
  LDA #$7FFF                                ; $02D5F5 |

CODE_02D5F8:
  STA $7020C2,x                             ; $02D5F8 |
  DEX                                       ; $02D5FC |
  DEX                                       ; $02D5FD |
  BPL CODE_02D5F8                           ; $02D5FE |
  LDX $12                                   ; $02D600 |
  RTS                                       ; $02D602 |

CODE_02D603:
  LDX #$3C                                  ; $02D603 |

CODE_02D605:
  LDA $702E2E,x                             ; $02D605 |
  STA $7020C2,x                             ; $02D609 |
  DEX                                       ; $02D60D |
  DEX                                       ; $02D60E |
  BPL CODE_02D605                           ; $02D60F |
  LDX $12                                   ; $02D611 |
  RTS                                       ; $02D613 |

; sluggy state $03
  TYX                                       ; $02D614 |
  LDA #$0001                                ; $02D615 |
  STA !s_player_disable_flag                ; $02D618 |
  LDA !s_spr_timer_1,x                      ; $02D61B |
  BEQ CODE_02D640                           ; $02D61E |
  LSR A                                     ; $02D620 |
  BNE CODE_02D62A                           ; $02D621 |
  LDA #$0015                                ; $02D623 |\ play sound #$0015
  JSL push_sound_queue                      ; $02D626 |/

CODE_02D62A:
  LDA !s_spr_timer_1,x                      ; $02D62A |
  JSR CODE_02D5EE                           ; $02D62D |
  LDX #$0A                                  ; $02D630 |
  LDA #$8FBB                                ; $02D632 |
  JSL r_gsu_init_1                          ; $02D635 | GSU init
  LDX $12                                   ; $02D639 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02D63B |
  JMP CODE_02D69A                           ; $02D63D |

CODE_02D640:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02D640 |
  SEC                                       ; $02D642 |
  SBC #$0004                                ; $02D643 |
  CMP #$0010                                ; $02D646 |
  BCS CODE_02D698                           ; $02D649 |
  LDA #$003B                                ; $02D64B |\ play sound #$003B
  JSL push_sound_queue                      ; $02D64E |/
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D652 |
  LDA #$FFFF                                ; $02D654 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02D657 |
  LDA !s_spr_oam_1,x                        ; $02D65A |
  SEC                                       ; $02D65D |
  SBC #$2000                                ; $02D65E |
  STA !s_spr_oam_1,x                        ; $02D661 |
  LDA #$0040                                ; $02D664 |
  STA !s_spr_timer_1,x                      ; $02D667 |
  LDA #$01C0                                ; $02D66A |
  JSL spawn_ambient_sprite                  ; $02D66D |
  LDA !s_spr_x_pixel_pos,x                  ; $02D671 |
  CLC                                       ; $02D674 |
  ADC $6000                                 ; $02D675 |
  SEC                                       ; $02D678 |
  SBC #$0008                                ; $02D679 |
  STA $70A2,y                               ; $02D67C |
  LDA !s_spr_y_pixel_pos,x                  ; $02D67F |
  SEC                                       ; $02D682 |
  SBC #$0008                                ; $02D683 |
  STA $7142,y                               ; $02D686 |
  LDA #$0004                                ; $02D689 |
  STA $7E4C,y                               ; $02D68C |
  LDA #$0006                                ; $02D68F |
  STA $7782,y                               ; $02D692 |
  LDA #$0010                                ; $02D695 |

CODE_02D698:
  STA !s_spr_wildcard_6_lo_dp,x             ; $02D698 |

CODE_02D69A:
  STA !gsu_r6                               ; $02D69A |
  LDY !s_spr_dyntile_index,x                ; $02D69D |
  TYX                                       ; $02D6A0 |
  LDA #$0040                                ; $02D6A1 |
  STA !gsu_r3                               ; $02D6A4 |
  STZ !gsu_r2                               ; $02D6A7 |
  LDA #$0010                                ; $02D6AA |
  STA !gsu_r8                               ; $02D6AD |
  STA !gsu_r9                               ; $02D6B0 |
  LDA #$60C1                                ; $02D6B3 |
  STA !gsu_r12                              ; $02D6B6 |
  LDA #$0056                                ; $02D6B9 |
  STA !gsu_r13                              ; $02D6BC |
  LDX #$08                                  ; $02D6BF |
  LDA #$8293                                ; $02D6C1 |
  JSL r_gsu_init_1                          ; $02D6C4 | GSU init
  INC $0CF9                                 ; $02D6C8 |
  LDX $12                                   ; $02D6CB |
  RTS                                       ; $02D6CD |

; sluggy state $04
  TYX                                       ; $02D6CE |
  LDA !s_spr_timer_1,x                      ; $02D6CF |
  BEQ CODE_02D709                           ; $02D6D2 |
  LDA !s_spr_timer_1,x                      ; $02D6D4 |
  LSR A                                     ; $02D6D7 |
  BNE CODE_02D708                           ; $02D6D8 |
  LDA #$0082                                ; $02D6DA |\ play sound #$0082
  JSL push_sound_queue                      ; $02D6DD |/
  LDA #$1000                                ; $02D6E1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02D6E4 |
  STZ !s_spr_x_accel_ceiling,x              ; $02D6E6 |
  LDA #$0100                                ; $02D6E9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D6EC |
  STA !gsu_r6                               ; $02D6EE |
  LDA #$0002                                ; $02D6F1 |
  STA !gsu_r0                               ; $02D6F4 |
  LDA #$D129                                ; $02D6F7 |
  STA !gsu_r14                              ; $02D6FA |
  LDX #$0A                                  ; $02D6FD |
  LDA #$8F57                                ; $02D6FF |
  JSL r_gsu_init_1                          ; $02D702 | GSU init
  LDX $12                                   ; $02D706 |

CODE_02D708:
  RTS                                       ; $02D708 |

CODE_02D709:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02D709 |
  BEQ CODE_02D756                           ; $02D70B |
  CMP #$0100                                ; $02D70D |
  LDA #$FFF8                                ; $02D710 |
  BCC CODE_02D720                           ; $02D713 |
  LDA !s_spr_x_accel_ceiling,x              ; $02D715 |
  CMP #$FFD0                                ; $02D718 |
  BMI CODE_02D720                           ; $02D71B |
  DEC !s_spr_x_accel_ceiling,x              ; $02D71D |

CODE_02D720:
  CLC                                       ; $02D720 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $02D721 |
  BPL CODE_02D728                           ; $02D723 |
  LDA #$0000                                ; $02D725 |

CODE_02D728:
  STA !s_spr_wildcard_6_lo_dp,x             ; $02D728 |
  STA !gsu_r7                               ; $02D72A |
  LSR A                                     ; $02D72D |
  LSR A                                     ; $02D72E |
  LSR A                                     ; $02D72F |
  LSR A                                     ; $02D730 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D731 |
  CMP #$0020                                ; $02D733 |
  BCS CODE_02D73E                           ; $02D736 |
  LDA #$00FF                                ; $02D738 |
  STA !s_spr_draw_priority,x                ; $02D73B |

CODE_02D73E:
  LDA #$0002                                ; $02D73E |
  STA !gsu_r0                               ; $02D741 |
  LDA #$D129                                ; $02D744 |
  STA !gsu_r14                              ; $02D747 |
  LDX #$0A                                  ; $02D74A |
  LDA #$90FF                                ; $02D74C |
  JSL r_gsu_init_1                          ; $02D74F | GSU init
  LDX $12                                   ; $02D753 |
  RTS                                       ; $02D755 |

CODE_02D756:
  LDA !s_spr_cam_y_pos,x                    ; $02D756 |
  CMP #$00E0                                ; $02D759 |
  BPL CODE_02D765                           ; $02D75C |
  LDA #$0200                                ; $02D75E |
  STA !s_spr_y_speed_lo,x                   ; $02D761 |
  RTS                                       ; $02D764 |

CODE_02D765:
  LDA !s_spr_x_pixel_pos,x                  ; $02D765 |
  STA $00                                   ; $02D768 |
  LDA !s_spr_y_pixel_pos,x                  ; $02D76A |
  STA $02                                   ; $02D76D |
  JSL $02E19C                               ; $02D76F |
  JSL $03A32E                               ; $02D773 |
  STZ !r_reg_ts_mirror                      ; $02D777 |
  LDA #$0018                                ; $02D77A |
  TRB !r_reg_hdmaen_mirror                  ; $02D77D |
  PLA                                       ; $02D780 |\
  RTL                                       ; $02D781 |/ back out of sprite

  dw $0008                                  ; $02D782 |
  dw $0008                                  ; $02D784 |
  dw $0008                                  ; $02D786 |
  dw $0008                                  ; $02D788 |
  dw $0010                                  ; $02D78A |
  dw $0006                                  ; $02D78C |
  dw $0010                                  ; $02D78E |

  dw $0008                                  ; $02D790 |
  dw $000F                                  ; $02D792 |
  dw $000F                                  ; $02D794 |
  dw $0008                                  ; $02D796 |
  dw $001F                                  ; $02D798 |
  dw $001C                                  ; $02D79A |
  dw $0010                                  ; $02D79C |

  dw $6081                                  ; $02D79E |
  dw $7081                                  ; $02D7A0 |
  dw $6091                                  ; $02D7A2 |
  dw $7091                                  ; $02D7A4 |
  dw $60A1                                  ; $02D7A6 |
  dw $60E1                                  ; $02D7A8 |
  dw $60C1                                  ; $02D7AA |

  dw $0000                                  ; $02D7AC |
  dw $0000                                  ; $02D7AE |
  dw $0010                                  ; $02D7B0 |
  dw $0010                                  ; $02D7B2 |
  dw $0020                                  ; $02D7B4 |
  dw $0060                                  ; $02D7B6 |
  dw $0040                                  ; $02D7B8 |

  dw $0000                                  ; $02D7BA |
  dw $0010                                  ; $02D7BC |
  dw $0000                                  ; $02D7BE |
  dw $0010                                  ; $02D7C0 |
  dw $0000                                  ; $02D7C2 |
  dw $0000                                  ; $02D7C4 |
  dw $0000                                  ; $02D7C6 |

  dw $8619                                  ; $02D7C8 |
  dw $8619                                  ; $02D7CA |
  dw $8619                                  ; $02D7CC |
  dw $8619                                  ; $02D7CE |
  dw $8293                                  ; $02D7D0 |
  dw $8293                                  ; $02D7D2 |
  dw $8293                                  ; $02D7D4 |

; sluggy sub
CODE_02D7D6:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02D7D6 |
  BNE CODE_02D7DD                           ; $02D7D8 |
  JMP CODE_02D863                           ; $02D7DA |

CODE_02D7DD:
  LDA !s_spr_cam_x_pos,x                    ; $02D7DD |
  STA $6040                                 ; $02D7E0 |
  LDA !s_spr_cam_y_pos,x                    ; $02D7E3 |
  STA $6042                                 ; $02D7E6 |
  LDX #$08                                  ; $02D7E9 |
  LDA #$E4BD                                ; $02D7EB |
  JSL r_gsu_init_1                          ; $02D7EE | GSU init
  JSL $00BE39                               ; $02D7F2 |

; args to $00BE39
  dw $5040, $727E, $7033, $0348             ; $02D7F6 |

  LDA #$0215                                ; $02D7FE |
  STA !r_reg_tm_mirror                      ; $02D801 |
  LDY #$75                                  ; $02D804 |
  STY !r_reg_cgadsub_mirror                 ; $02D806 |
  LDA #$0018                                ; $02D809 |
  TSB !r_reg_hdmaen_mirror                  ; $02D80C |
  LDX $12                                   ; $02D80F |
  LDA !s_spr_oam_pointer,x                  ; $02D811 |
  BPL CODE_02D817                           ; $02D814 |
  RTS                                       ; $02D816 |

CODE_02D817:
  STA !gsu_r5                               ; $02D817 |
  LDA !s_spr_cam_x_pos,x                    ; $02D81A |
  STA !gsu_r1                               ; $02D81D |
  LDA !s_spr_cam_y_pos,x                    ; $02D820 |
  STA !gsu_r2                               ; $02D823 |
  LDA $7049DE                               ; $02D826 |
  STA !gsu_r3                               ; $02D82A |
  LDA $7049C8                               ; $02D82D |
  STA !gsu_r4                               ; $02D831 |
  LDA $7049C8                               ; $02D834 |
  SEC                                       ; $02D838 |
  SBC $7049CA                               ; $02D839 |
  AND #$00FF                                ; $02D83D |
  STA !gsu_r6                               ; $02D840 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02D843 |
  STA $6000                                 ; $02D846 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02D849 |
  STA $6002                                 ; $02D84B |
  LDX #$0A                                  ; $02D84E |
  LDA #$9039                                ; $02D850 |
  JSL r_gsu_init_1                          ; $02D853 | GSU init
  LDX $12                                   ; $02D857 |
  LDA $6000                                 ; $02D859 |
  CLC                                       ; $02D85C |
  ADC #$0010                                ; $02D85D |
  STA !s_spr_x_hitbox_offset,x              ; $02D860 |

CODE_02D863:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02D863 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $02D865 |
  BEQ CODE_02D8C7                           ; $02D868 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02D86A |
  CMP #$0020                                ; $02D86D |
  BCS CODE_02D875                           ; $02D870 |
  LDA #$0020                                ; $02D872 |

CODE_02D875:
  STA $00                                   ; $02D875 |
  LDY #$0C                                  ; $02D877 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02D879 |
  BPL CODE_02D880                           ; $02D87C |
  DEY                                       ; $02D87E |
  DEY                                       ; $02D87F |

CODE_02D880:
  LDA !r_frame_counter_global               ; $02D880 |
  LSR A                                     ; $02D883 |
  BCC CODE_02D888                           ; $02D884 |
  DEY                                       ; $02D886 |
  DEY                                       ; $02D887 |

CODE_02D888:
  LDA $D782,y                               ; $02D888 |
  STA !gsu_r8                               ; $02D88B |
  LDA $D790,y                               ; $02D88E |
  STA !gsu_r9                               ; $02D891 |
  LDA $00                                   ; $02D894 |
  STA !gsu_r6                               ; $02D896 |
  LDA $D79E,y                               ; $02D899 |
  STA !gsu_r12                              ; $02D89C |
  LDA #$0056                                ; $02D89F |
  STA !gsu_r13                              ; $02D8A2 |
  LDA $D7BA,y                               ; $02D8A5 |
  STA !gsu_r2                               ; $02D8A8 |
  LDA $D7AC,y                               ; $02D8AB |
  STA !gsu_r3                               ; $02D8AE |
  LDX #$08                                  ; $02D8B1 |
  LDA $D7C8,y                               ; $02D8B3 |
  PHY                                       ; $02D8B6 |
  JSL r_gsu_init_1                          ; $02D8B7 | GSU init
  PLY                                       ; $02D8BB |
  DEY                                       ; $02D8BC |
  DEY                                       ; $02D8BD |
  DEY                                       ; $02D8BE |
  DEY                                       ; $02D8BF |
  BPL CODE_02D888                           ; $02D8C0 |
  INC $0CF9                                 ; $02D8C2 |
  LDX $12                                   ; $02D8C5 |

CODE_02D8C7:
  RTS                                       ; $02D8C7 |

; both the normal vertical entrance and the hidden one
init_vertical_entrance:
  LDA !s_spr_x_pixel_pos,x                  ; $02D8C8 |
  ORA #$0008                                ; $02D8CB |
  STA !s_spr_x_pixel_pos,x                  ; $02D8CE |
  LDA #$0001                                ; $02D8D1 |
  STA !s_spr_hitbox_width,x                 ; $02D8D4 |
  STA !s_spr_hitbox_height,x                ; $02D8D7 |
  STZ !s_spr_y_hitbox_offset,x              ; $02D8DA |
  RTL                                       ; $02D8DD |

main_hidden_vertical_entrance:
  LDY #$02                                  ; $02D8DE |
  JSL $02D985                               ; $02D8E0 |
  BCS main_vertical_entrance                ; $02D8E4 |
  RTL                                       ; $02D8E6 |

main_vertical_entrance:
  JSL $03AF23                               ; $02D8E7 |
  JSR CODE_02D908                           ; $02D8EB |
  BCC CODE_02D907                           ; $02D8EE |
  LDA !r_joy1_hi_mirror                     ; $02D8F0 |
  AND #$0004                                ; $02D8F3 |
  BEQ CODE_02D907                           ; $02D8F6 |
  LDA #$0006                                ; $02D8F8 |
  STA !s_sprite_disable_flag                ; $02D8FB |
  JSR CODE_02CDB9                           ; $02D8FE |
  LDA !s_player_x                           ; $02D901 |
  STA !s_player_pipe_x_pos_rel              ; $02D904 |

CODE_02D907:
  RTL                                       ; $02D907 |

CODE_02D908:
  LDY !s_spr_collision_id,x                 ; $02D908 |
  BPL CODE_02D91C                           ; $02D90B |
  LDA !s_baby_mario_state                   ; $02D90D |
  BPL CODE_02D91C                           ; $02D910 |
  LDA !s_player_jump_state                  ; $02D912 |
  ORA !s_player_mouth_state                 ; $02D915 |
  BNE CODE_02D91C                           ; $02D918 |
  SEC                                       ; $02D91A |
  RTS                                       ; $02D91B |

CODE_02D91C:
  CLC                                       ; $02D91C |
  RTS                                       ; $02D91D |

  dw $0008, $FFF8                           ; $02D91E |

init_horizontal_entrance_left:
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D922 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02D924 |

init_horizontal_entrance_right:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02D926 |
  LDA !s_spr_x_pixel_pos,x                  ; $02D928 |
  CLC                                       ; $02D92B |
  ADC $D91E,y                               ; $02D92C |
  STA !gsu_r8                               ; $02D92F |
  LDA !s_spr_y_pixel_pos,x                  ; $02D932 |
  SEC                                       ; $02D935 |
  SBC #$0008                                ; $02D936 |
  STA !s_spr_y_pixel_pos,x                  ; $02D939 |
  STA !gsu_r0                               ; $02D93C |
  LDX #$0A                                  ; $02D93F |
  LDA #$CE2F                                ; $02D941 |
  JSL r_gsu_init_3                          ; $02D944 | GSU init
  LDX $12                                   ; $02D948 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02D94A |
  LDY !gsu_r5                               ; $02D94C |
  BEQ CODE_02D954                           ; $02D94F |
  EOR #$0002                                ; $02D951 |

CODE_02D954:
  STA !s_spr_facing_dir,x                   ; $02D954 |
  RTL                                       ; $02D957 |

  dw $0001, $0002                           ; $02D958 |

; both left and right
main_horizontal_entrance:
  JSL $03AF23                               ; $02D95C |
  JSR CODE_02D908                           ; $02D960 |
  BCC CODE_02D984                           ; $02D963 |
  LDA !s_spr_x_player_dir,x                 ; $02D965 |
  AND #$00FF                                ; $02D968 |
  CMP !s_spr_facing_dir,x                   ; $02D96B |
  BNE CODE_02D984                           ; $02D96E |
  TAY                                       ; $02D970 |
  LDA !r_joy1_hi_mirror                     ; $02D971 |
  AND $D958,y                               ; $02D974 |
  BEQ CODE_02D984                           ; $02D977 |
  TYA                                       ; $02D979 |
  CLC                                       ; $02D97A |
  ADC #$8002                                ; $02D97B |
  STA !s_sprite_disable_flag                ; $02D97E |
  JSR CODE_02CDB9                           ; $02D981 |

CODE_02D984:
  RTL                                       ; $02D984 |

  LDA !s_switch_state                       ; $02D985 |
  AND #$0008                                ; $02D988 |
  BEQ CODE_02D9B6                           ; $02D98B |
  LDA !r_frame_counter_global               ; $02D98D |
  AND #$0018                                ; $02D990 |
  BEQ CODE_02D9B4                           ; $02D993 |
  TYA                                       ; $02D995 |
  PHA                                       ; $02D996 |
  LDA #$0224                                ; $02D997 |
  JSL spawn_ambient_sprite                  ; $02D99A |
  PLA                                       ; $02D99E |
  STA $73C2,y                               ; $02D99F |
  LDA !s_spr_x_pixel_pos,x                  ; $02D9A2 |
  STA $70A2,y                               ; $02D9A5 |
  LDA !s_spr_y_pixel_pos,x                  ; $02D9A8 |
  STA $7142,y                               ; $02D9AB |
  LDA #$0001                                ; $02D9AE |
  STA $7782,y                               ; $02D9B1 |

CODE_02D9B4:
  SEC                                       ; $02D9B4 |
  RTL                                       ; $02D9B5 |

CODE_02D9B6:
  CLC                                       ; $02D9B6 |
  RTL                                       ; $02D9B7 |

init_boss_key:
  LDA !s_baby_mario_state                   ; $02D9B8 |
  BPL CODE_02D9C3                           ; $02D9BB |
  JSL $03AD74                               ; $02D9BD |
  BCS CODE_02D9C6                           ; $02D9C1 |

CODE_02D9C3:
  JMP CODE_02AC7B                           ; $02D9C3 |

CODE_02D9C6:
  JSL $04F74A                               ; $02D9C6 |
  LDA #$001A                                ; $02D9CA |
  STA !s_player_state                       ; $02D9CD |
  STZ !s_player_disable_flag                ; $02D9D0 |
  STZ !s_player_direction                   ; $02D9D3 |
  LDA !s_player_x                           ; $02D9D6 |
  STA !s_spr_x_pixel_pos,x                  ; $02D9D9 |
  LDA !s_player_y                           ; $02D9DC |
  SEC                                       ; $02D9DF |
  SBC #$0028                                ; $02D9E0 |
  STA !s_spr_y_pixel_pos,x                  ; $02D9E3 |
  LDA #$0002                                ; $02D9E6 |
  STA !s_spr_draw_priority,x                ; $02D9E9 |
  LDA #$0020                                ; $02D9EC |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02D9EF |
  JSR CODE_02DB37                           ; $02D9F1 |
  JSL $02A4F4                               ; $02D9F4 |
  LDA !r_bg1_cam_x                          ; $02D9F8 |
  STA $0C23                                 ; $02D9FB |
  LDA !r_bg1_cam_y                          ; $02D9FE |
  STA $0C27                                 ; $02DA01 |
  LDA #$0001                                ; $02DA04 |
  STA !r_autoscr_x_active                   ; $02DA07 |
  STA !r_autoscr_y_active                   ; $02DA0A |
  RTL                                       ; $02DA0D |

main_boss_key:
  JSL $03AA52                               ; $02DA0E |
  TXY                                       ; $02DA12 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02DA13 |
  ASL A                                     ; $02DA15 |
  TAX                                       ; $02DA16 |
  JSR ($DA1B,x)                             ; $02DA17 |
  RTL                                       ; $02DA1A |

boss_key_ptr:
  dw $DAC9                                  ; $02DA1B |
  dw $DB02                                  ; $02DA1D |
  dw $DB7E                                  ; $02DA1F |
  dw $DDAD                                  ; $02DA21 |
  dw $DEDD                                  ; $02DA23 |

; data tables
  dw $0004                                  ; $02DA25 |
  dw $0004                                  ; $02DA27 |
  dw $0004                                  ; $02DA29 |
  dw $0024                                  ; $02DA2B |
  dw $0014                                  ; $02DA2D |
  dw $0014                                  ; $02DA2F |
  dw $0004                                  ; $02DA31 |
  dw $0005                                  ; $02DA33 |
  dw $00C0                                  ; $02DA35 |
  dw $0020                                  ; $02DA37 |
  dw $0040                                  ; $02DA39 |
  dw $0004                                  ; $02DA3B |
  dw $0034                                  ; $02DA3D |
  dw $0004                                  ; $02DA3F |
  dw $0004                                  ; $02DA41 |
  dw $0004                                  ; $02DA43 |
  dw $0001                                  ; $02DA45 |

  dw $0125                                  ; $02DA47 |
  dw $0126                                  ; $02DA49 |
  dw $0127                                  ; $02DA4B |
  dw $0128                                  ; $02DA4D |
  dw $0129                                  ; $02DA4F |
  dw $012A                                  ; $02DA51 |
  dw $012B                                  ; $02DA53 |
  dw $012C                                  ; $02DA55 |
  dw $012C                                  ; $02DA57 |
  dw $012C                                  ; $02DA59 |
  dw $012C                                  ; $02DA5B |
  dw $012D                                  ; $02DA5D |
  dw $012E                                  ; $02DA5F |
  dw $012F                                  ; $02DA61 |
  dw $0130                                  ; $02DA63 |
  dw $0000                                  ; $02DA65 |
  dw $0000                                  ; $02DA67 |

  dw $002B                                  ; $02DA69 |
  dw $002C                                  ; $02DA6B |
  dw $002D                                  ; $02DA6D |
  dw $002E                                  ; $02DA6F |
  dw $002F                                  ; $02DA71 |
  dw $0030                                  ; $02DA73 |
  dw $0031                                  ; $02DA75 |
  dw $0031                                  ; $02DA77 |
  dw $0031                                  ; $02DA79 |
  dw $0031                                  ; $02DA7B |
  dw $0031                                  ; $02DA7D |
  dw $0032                                  ; $02DA7F |
  dw $0032                                  ; $02DA81 |
  dw $0033                                  ; $02DA83 |
  dw $0034                                  ; $02DA85 |
  dw $000D                                  ; $02DA87 |
  dw $000D                                  ; $02DA89 |

; boss key sub
CODE_02DA8B:
  JSL $06C9D7                               ; $02DA8B |
  LDA !s_spr_timer_2,x                      ; $02DA8F |
  BNE CODE_02DAB9                           ; $02DA92 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02DA94 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $02DA96 |
  ASL A                                     ; $02DA98 |
  TAY                                       ; $02DA99 |
  CPY #$18                                  ; $02DA9A |
  BNE CODE_02DAA7                           ; $02DA9C |
  PHY                                       ; $02DA9E |
  LDA #$0043                                ; $02DA9F |\ play sound #$0043
  JSL push_sound_queue                      ; $02DAA2 |/
  PLY                                       ; $02DAA6 |

CODE_02DAA7:
  LDA $DA25,y                               ; $02DAA7 |
  STA !s_spr_timer_2,x                      ; $02DAAA |
  LDA $DA47,y                               ; $02DAAD |
  STA !s_player_cur_anim_frame              ; $02DAB0 |
  LDA $DA69,y                               ; $02DAB3 |
  STA !s_spr_anim_frame                     ; $02DAB6 |

CODE_02DAB9:
  RTS                                       ; $02DAB9 |

; boss key sub
  LDA $14                                   ; $02DABA |
  AND #$0007                                ; $02DABC |
  BNE CODE_02DAC8                           ; $02DABF |
  LDA #$1010                                ; $02DAC1 |
  JSL $029BD9                               ; $02DAC4 |

CODE_02DAC8:
  RTL                                       ; $02DAC8 |

; boss_key_ptr sub
  TYX                                       ; $02DAC9 |
  LDY !r_header_level_mode                  ; $02DACA | if level mode is not
  CPY #$09                                  ; $02DACD | $09, branch
  BNE CODE_02DADF                           ; $02DACF |
  LDA $0C27                                 ; $02DAD1 | if autoscroll Y
  CMP #$0080                                ; $02DAD4 | < $80, branch
  BMI CODE_02DADF                           ; $02DAD7 |
  DEC $0C27                                 ; $02DAD9 | otherwise decrement autoscroll Y
  DEC !s_bg3_cam_y                          ; $02DADC | and layer 3 camera Y

CODE_02DADF:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DADF |
  CPY #$04                                  ; $02DAE1 |
  BCS CODE_02DAE8                           ; $02DAE3 |
  JSR CODE_02DA8B                           ; $02DAE5 |

CODE_02DAE8:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DAE8 | timer
  CLC                                       ; $02DAEA |
  ADC #$0002                                ; $02DAEB | increment timer by 2
  CMP #$0100                                ; $02DAEE | 256 frame count
  BCC CODE_02DAFE                           ; $02DAF1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02DAF3 | once time is up, load 256 into timer
  LDA #$0001                                ; $02DAF5 | and 1 into ??
  STA !s_spr_y_accel,x                      ; $02DAF8 |
  LDA #$0100                                ; $02DAFB |

CODE_02DAFE:
  STA !s_spr_wildcard_5_lo_dp,x             ; $02DAFE |
  BRA CODE_02DB37                           ; $02DB00 |

; boss_key_ptr sub
  TYX                                       ; $02DB02 |
  JSL $02DABA                               ; $02DB03 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DB07 |
  CPY #$05                                  ; $02DB09 |
  BCS CODE_02DB10                           ; $02DB0B |
  JSR CODE_02DA8B                           ; $02DB0D |

CODE_02DB10:
  LDA !s_spr_y_player_delta,x               ; $02DB10 |
  SEC                                       ; $02DB13 |
  SBC #$FFE4                                ; $02DB14 |
  BMI CODE_02DB37                           ; $02DB17 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02DB19 |
  EOR #$FFFF                                ; $02DB1B |
  SEC                                       ; $02DB1E |
  ADC !s_spr_y_pixel_pos,x                  ; $02DB1F |
  STA !s_spr_y_pixel_pos,x                  ; $02DB22 |
  STZ !s_spr_y_speed_lo,x                   ; $02DB25 |
  STZ !s_spr_y_accel,x                      ; $02DB28 |
  LDA #$0100                                ; $02DB2B |
  STA !s_spr_gsu_morph_1_lo,x               ; $02DB2E |
  LDA #$00E0                                ; $02DB31 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02DB34 |

CODE_02DB37:
  LDA $14                                   ; $02DB37 |
  ASL A                                     ; $02DB39 |
  AND #$00FF                                ; $02DB3A |
  STA !gsu_r5                               ; $02DB3D |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DB40 |
  STA !gsu_r6                               ; $02DB42 |
  LDY !s_spr_dyntile_index,x                ; $02DB45 |
  TYX                                       ; $02DB48 |
  LDA $03A9CE,x                             ; $02DB49 |
  STA !gsu_r3                               ; $02DB4D |
  LDA $03A9EE,x                             ; $02DB50 |
  STA !gsu_r2                               ; $02DB54 |
  LDA #$C0E0                                ; $02DB57 | key graphic address
  STA !gsu_r12                              ; $02DB5A |
  LDA #$0054                                ; $02DB5D | key graphic bank ($29)
  STA !gsu_r13                              ; $02DB60 |
  LDX #$08                                  ; $02DB63 |
  LDA #$8205                                ; $02DB65 |
  JSL r_gsu_init_1                          ; $02DB68 | GSU draw
  INC $0CF9                                 ; $02DB6C |
  LDX $12                                   ; $02DB6F |
  RTS                                       ; $02DB71 |

  dw $0010                                  ; $02DB72 |
  dw $FFF0                                  ; $02DB74 |
  dw $0010                                  ; $02DB76 |
  dw $0120                                  ; $02DB78 |
  dw $FFE0                                  ; $02DB7A |
  dw $00F0                                  ; $02DB7C |

; boss_key_ptr sub
  TYX                                       ; $02DB7E |
  JSL $02DABA                               ; $02DB7F |
  JSR CODE_02DA8B                           ; $02DB83 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DB86 |
  CPY #$08                                  ; $02DB88 |
  BNE CODE_02DB92                           ; $02DB8A |
  DEC !s_spr_x_pixel_pos,x                  ; $02DB8C |
  DEC !s_spr_y_pixel_pos,x                  ; $02DB8F |

CODE_02DB92:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DB92 |
  CPY #$0A                                  ; $02DB94 |
  BCC CODE_02DC03                           ; $02DB96 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02DB98 |
  LDA #$0006                                ; $02DB9A |
  STA !r_apu_io_0_mirror                    ; $02DB9D |
  LDA #$00FF                                ; $02DBA0 |
  STA !s_spr_draw_priority,x                ; $02DBA3 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02DBA6 |
  LDY #$02                                  ; $02DBA8 |
  STY !r_interrupt_mode                     ; $02DBAA |
  STZ !r_header_anim_tileset                ; $02DBAD |
  STZ !r_header_anim_palette                ; $02DBB0 |
  LDY #$0F                                  ; $02DBB3 |
  STY !r_header_bg_scrolling                ; $02DBB5 |
  STZ !r_header_level_mode                  ; $02DBB8 |
  LDA #$1014                                ; $02DBBB |
  STA !r_reg_tm_mirror                      ; $02DBBE |
  LDY #$69                                  ; $02DBC1 |
  STY !r_reg_bgmode_mirror                  ; $02DBC3 |
  LDY #$02                                  ; $02DBC6 |
  STY !r_reg_bg34nba_mirror                 ; $02DBC8 |
  LDY #$34                                  ; $02DBCB |
  STY !r_reg_bg3sc_mirror                   ; $02DBCD |
  STZ !r_reg_coldata_mirror                 ; $02DBD0 |
  LDA #$0064                                ; $02DBD3 |\ play sound #$0064
  JSL push_sound_queue                      ; $02DBD6 |/
  JSL $02A4F4                               ; $02DBDA |
  REP #$10                                  ; $02DBDE |
  LDA #$00B0                                ; $02DBE0 |
  JSL decompress_lc_lz1_l                   ; $02DBE3 |
  SEP #$10                                  ; $02DBE7 |
  LDA #$B400                                ; $02DBE9 |
  STA $0CF9                                 ; $02DBEC |
  LDX #$24                                  ; $02DBEF |

CODE_02DBF1:
  LDA $5FFA5E,x                             ; $02DBF1 |
  STA $702002,x                             ; $02DBF5 |
  STA $702D6E,x                             ; $02DBF9 |
  DEX                                       ; $02DBFD |
  DEX                                       ; $02DBFE |
  BPL CODE_02DBF1                           ; $02DBFF |
  LDX $12                                   ; $02DC01 |

CODE_02DC03:
  LDA !s_spr_wildcard_2_lo,x                ; $02DC03 |
  BEQ CODE_02DC0B                           ; $02DC06 |
  JMP CODE_02DCDE                           ; $02DC08 |

CODE_02DC0B:
  LDA !s_spr_wildcard_1_lo,x                ; $02DC0B |
  STA !gsu_r0                               ; $02DC0E |
  TAY                                       ; $02DC11 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02DC12 |
  STA !gsu_r1                               ; $02DC15 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02DC18 |
  STA !gsu_r2                               ; $02DC1B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02DC1E |
  SEC                                       ; $02DC21 |
  SBC $DB78,y                               ; $02DC22 |
  EOR $DB72,y                               ; $02DC25 |
  STA $00                                   ; $02DC28 |
  BMI CODE_02DC3B                           ; $02DC2A |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02DC2C |
  SEC                                       ; $02DC2F |
  SBC #$002C                                ; $02DC30 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02DC33 |
  TYA                                       ; $02DC36 |
  EOR #$0002                                ; $02DC37 |
  TAY                                       ; $02DC3A |

CODE_02DC3B:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02DC3B |
  SEC                                       ; $02DC3E |
  SBC $DB7A,y                               ; $02DC3F |
  EOR $DB74,y                               ; $02DC42 |
  STA $02                                   ; $02DC45 |
  BMI CODE_02DC58                           ; $02DC47 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02DC49 |
  SEC                                       ; $02DC4C |
  SBC #$002C                                ; $02DC4D |
  STA !s_spr_gsu_morph_1_lo,x               ; $02DC50 |
  TYA                                       ; $02DC53 |
  EOR #$0002                                ; $02DC54 |
  TAY                                       ; $02DC57 |

CODE_02DC58:
  TYA                                       ; $02DC58 |
  STA !s_spr_wildcard_1_lo,x                ; $02DC59 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02DC5C |
  CLC                                       ; $02DC5F |
  ADC $DB72,y                               ; $02DC60 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02DC63 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02DC66 |
  CLC                                       ; $02DC69 |
  ADC $DB74,y                               ; $02DC6A |
  STA !s_spr_gsu_morph_2_lo,x               ; $02DC6D |
  LDA $00                                   ; $02DC70 |
  EOR $02                                   ; $02DC72 |
  BMI CODE_02DC7D                           ; $02DC74 |
  LDA $00                                   ; $02DC76 |
  BMI CODE_02DC7D                           ; $02DC78 |
  INC !s_spr_wildcard_2_lo,x                ; $02DC7A |

CODE_02DC7D:
  LDX #$09                                  ; $02DC7D |
  LDA #$A82C                                ; $02DC7F |
  JSL r_gsu_init_1                          ; $02DC82 | GSU init
  JSL $00BE39                               ; $02DC86 |

  db $D0, $56, $7E, $02                     ; $02DC8A |
  db $3A, $70, $48, $03                     ; $02DC8E |

; execution continues here
  LDA #$AAAA                                ; $02DC92 |
  STA !r_reg_w12sel_mirror                  ; $02DC95 |
  LDA !r_reg_tm_mirror                      ; $02DC98 |
  STA !r_reg_tmw_mirror                     ; $02DC9B |
  STZ !r_reg_wbglog_mirror                  ; $02DC9E |
  LDY #$A0                                  ; $02DCA1 |
  STY !r_reg_wobjsel_mirror                 ; $02DCA3 |
  LDY #$22                                  ; $02DCA6 |
  STY !r_reg_cgwsel_mirror                  ; $02DCA8 |
  LDA #$0020                                ; $02DCAB |
  TSB !r_reg_hdmaen_mirror                  ; $02DCAE |
  LDA !s_cgram_mirror                       ; $02DCB1 |
  BEQ CODE_02DCC6                           ; $02DCB5 |
  STA !r_reg_coldata_mirror                 ; $02DCB7 |
  LDA #$0000                                ; $02DCBA |
  STA !s_cgram_mirror                       ; $02DCBD |
  LDX #$20                                  ; $02DCC1 |
  STX !r_reg_cgadsub_mirror                 ; $02DCC3 |

CODE_02DCC6:
  LDX $12                                   ; $02DCC6 |
  LDA !s_spr_wildcard_2_lo,x                ; $02DCC8 |
  BEQ CODE_02DD4B                           ; $02DCCB |
  REP #$10                                  ; $02DCCD |
  LDA #$0056                                ; $02DCCF |
  JSL decompress_lc_lz1_l                   ; $02DCD2 |
  SEP #$10                                  ; $02DCD6 |
  LDA #$A800                                ; $02DCD8 |
  STA $0CF9                                 ; $02DCDB |

CODE_02DCDE:
  LDA !s_player_x                           ; $02DCDE |
  SEC                                       ; $02DCE1 |
  SBC #$0078                                ; $02DCE2 |
  STA $00                                   ; $02DCE5 |
  STA !gsu_r1                               ; $02DCE7 |
  LDA !s_player_y                           ; $02DCEA |
  SEC                                       ; $02DCED |
  SBC #$0080                                ; $02DCEE |
  STA $02                                   ; $02DCF1 |
  STA !gsu_r2                               ; $02DCF3 |
  LDA $0C23                                 ; $02DCF6 |
  STA !gsu_r3                               ; $02DCF9 |
  LDA $0C27                                 ; $02DCFC |
  STA !gsu_r4                               ; $02DCFF |
  LDA #$0200                                ; $02DD02 |
  STA !gsu_r6                               ; $02DD05 |
  LDX #$09                                  ; $02DD08 |
  LDA #$907C                                ; $02DD0A |
  JSL r_gsu_init_1                          ; $02DD0D | GSU init
  LDA !gsu_r1                               ; $02DD11 |
  STA !r_autoscr_x_speed                    ; $02DD14 |
  LDA !gsu_r2                               ; $02DD17 |
  STA !r_autoscr_y_speed                    ; $02DD1A |
  REP #$10                                  ; $02DD1D |
  JSL $03D9C6                               ; $02DD1F |
  SEP #$10                                  ; $02DD23 |
  LDA $00                                   ; $02DD25 |
  SEC                                       ; $02DD27 |
  SBC $0C23                                 ; $02DD28 |
  BEQ CODE_02DD37                           ; $02DD2B |
  EOR !r_autoscr_x_speed                    ; $02DD2D |
  BPL CODE_02DD37                           ; $02DD30 |
  LDA $00                                   ; $02DD32 |
  STA $0C23                                 ; $02DD34 |

CODE_02DD37:
  LDA $02                                   ; $02DD37 |
  SEC                                       ; $02DD39 |
  SBC $0C27                                 ; $02DD3A |
  BEQ CODE_02DD49                           ; $02DD3D |
  EOR !r_autoscr_y_speed                    ; $02DD3F |
  BPL CODE_02DD49                           ; $02DD42 |
  LDA $02                                   ; $02DD44 |
  STA $0C27                                 ; $02DD46 |

CODE_02DD49:
  LDX $12                                   ; $02DD49 |

CODE_02DD4B:
  RTS                                       ; $02DD4B |

  RTS                                       ; $02DD4C |

  db $06, $0A, $0D, $0F                     ; $02DD4D |
  db $11, $12, $13, $15                     ; $02DD51 |
  db $16, $17, $18, $19                     ; $02DD55 |
  db $19, $1A, $1B, $1C                     ; $02DD59 |
  db $1C, $1D, $1D, $1E                     ; $02DD5D |
  db $1E, $1E, $1F, $1F                     ; $02DD61 |
  db $1F, $1F, $20, $20                     ; $02DD65 |
  db $20, $20, $20, $20                     ; $02DD69 |
  db $20, $20, $20, $20                     ; $02DD6D |
  db $20, $20, $1F, $1F                     ; $02DD71 |
  db $1F, $1F, $1E, $1E                     ; $02DD75 |
  db $1E, $1D, $1D, $1C                     ; $02DD79 |
  db $1C, $1B, $1A, $19                     ; $02DD7D |
  db $19, $18, $17, $16                     ; $02DD81 |
  db $15, $13, $12, $11                     ; $02DD85 |
  db $11, $11, $11, $12                     ; $02DD89 |
  db $12, $12, $13, $13                     ; $02DD8D |
  db $13, $14, $14, $14                     ; $02DD91 |
  db $15, $15, $15, $16                     ; $02DD95 |
  db $16, $16, $17, $17                     ; $02DD99 |
  db $17, $18, $18, $18                     ; $02DD9D |
  db $19, $19, $19, $1A                     ; $02DDA1 |
  db $1A, $1A, $1B, $1B                     ; $02DDA5 |
  db $1B, $1C, $1C, $1C                     ; $02DDA9 |

; boss_key_ptr sub
  TYX                                       ; $02DDAD |
  JSR CODE_02DA8B                           ; $02DDAE |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DDB1 |
  CPY #$0B                                  ; $02DDB3 |
  BCS CODE_02DDB8                           ; $02DDB5 |
  RTS                                       ; $02DDB7 |

CODE_02DDB8:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DDB8 |
  BNE CODE_02DDC5                           ; $02DDBA |
  LDA #$0027                                ; $02DDBC |\ play sound #$0027
  JSL push_sound_queue                      ; $02DDBF |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DDC3 |

CODE_02DDC5:
  CMP #$0100                                ; $02DDC5 |
  BCC CODE_02DDDF                           ; $02DDC8 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02DDCA |
  CPY #$10                                  ; $02DDCC |
  BCC CODE_02DDE4                           ; $02DDCE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02DDD0 |
  LDA #$0022                                ; $02DDD2 |
  STA !s_player_state                       ; $02DDD5 |
  STZ !s_player_jump_state                  ; $02DDD8 |
  STZ $60C6                                 ; $02DDDB |
  RTS                                       ; $02DDDE |

CODE_02DDDF:
  ADC #$0010                                ; $02DDDF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02DDE2 |

CODE_02DDE4:
  LDA #$0030                                ; $02DDE4 |
  STA !gsu_r0                               ; $02DDE7 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DDEA | camera adder
  STA !gsu_r6                               ; $02DDEC |
  LDX #$0B                                  ; $02DDEF |
  LDA #$86B6                                ; $02DDF1 |
  JSL r_gsu_init_1                          ; $02DDF4 | GSU multiply
  LDA #$FFD8                                ; $02DDF8 |
  CLC                                       ; $02DDFB |
  ADC !gsu_r0                               ; $02DDFC |
  STA !s_bg3_cam_y                          ; $02DDFF |
  STA !r_bg3_cam_y                          ; $02DE02 |
  STZ !s_bg3_cam_x                          ; $02DE05 |
  STZ !r_bg3_cam_x                          ; $02DE08 |
  LDA #$0260                                ; $02DE0B |
  STA !gsu_r0                               ; $02DE0E |
  LDA !gsu_r6                               ; $02DE11 |
  AND #$FFF0                                ; $02DE14 |
  STA !gsu_r6                               ; $02DE17 |
  LDX #$0B                                  ; $02DE1A |
  LDA #$86B6                                ; $02DE1C |
  JSL r_gsu_init_1                          ; $02DE1F | GSU init
  PHB                                       ; $02DE23 |
  LDY #$70                                  ; $02DE24 |
  PHY                                       ; $02DE26 |
  PLB                                       ; $02DE27 |
  REP #$10                                  ; $02DE28 |
  LDA $003000                               ; $02DE2A |
  TAX                                       ; $02DE2E |
  LDY #$0000                                ; $02DE2F |

CODE_02DE32:
  LDA $5FFA5E,x                             ; $02DE32 |
  STA $2002,y                               ; $02DE36 |
  STA $2D6E,y                               ; $02DE39 |
  INX                                       ; $02DE3C |
  INX                                       ; $02DE3D |
  INY                                       ; $02DE3E |
  INY                                       ; $02DE3F |
  CPY #$0026                                ; $02DE40 |
  BCC CODE_02DE32                           ; $02DE43 |
  SEP #$10                                  ; $02DE45 |
  PLB                                       ; $02DE47 |
  LDA #$0002                                ; $02DE48 |
  STA !gsu_r0                               ; $02DE4B |
  LDA #$DD4C                                ; $02DE4E |
  STA !gsu_r14                              ; $02DE51 |
  STZ !gsu_r7                               ; $02DE54 |
  LDA #$005F                                ; $02DE57 |
  STA !gsu_r8                               ; $02DE5A |
  LDA #$0080                                ; $02DE5D |
  STA !gsu_r1                               ; $02DE60 |
  LDA #$0096                                ; $02DE63 |
  STA !gsu_r2                               ; $02DE66 |
  LDX #$08                                  ; $02DE69 |
  LDA #$F05F                                ; $02DE6B |
  JSL r_gsu_init_1                          ; $02DE6E | GSU init
  JSL $00BE39                               ; $02DE72 |

  db $D0, $56, $7E, $02                     ; $02DE76 |
  db $3A, $70, $48, $03                     ; $02DE7A |

; execution continues here
  LDA #$FFFF                                ; $02DE7E |
  STA !r_reg_w12sel_mirror                  ; $02DE81 |
  LDA !r_reg_tm_mirror                      ; $02DE84 |
  STA !r_reg_tmw_mirror                     ; $02DE87 |
  LDA #$0155                                ; $02DE8A |
  STA !r_reg_wbglog_mirror                  ; $02DE8D |
  LDA #$0000                                ; $02DE90 |
  STA !s_cgram_mirror                       ; $02DE93 |
  LDA #$7FFF                                ; $02DE97 |
  STA !r_reg_coldata_mirror                 ; $02DE9A |
  LDY #$A0                                  ; $02DE9D |
  LDA !s_player_x_cam_rel                   ; $02DE9F |
  CMP #$0079                                ; $02DEA2 |
  BMI CODE_02DEA9                           ; $02DEA5 |
  LDY #$A8                                  ; $02DEA7 |

CODE_02DEA9:
  STY !r_reg_wobjsel_mirror                 ; $02DEA9 |
  LDY #$22                                  ; $02DEAC |
  STY !r_reg_cgwsel_mirror                  ; $02DEAE |
  LDY #$34                                  ; $02DEB1 |
  STY !r_reg_cgadsub_mirror                 ; $02DEB3 |
  LDA #$0020                                ; $02DEB6 |
  STA !r_reg_hdmaen_mirror                  ; $02DEB9 |
  LDX $12                                   ; $02DEBC |
  RTS                                       ; $02DEBE |

  dw $7FFF                                  ; $02DEBF |
  dw $7FFF                                  ; $02DEC1 |
  dw $7FFF                                  ; $02DEC3 |
  dw $7FFF                                  ; $02DEC5 |
  dw $7FFF                                  ; $02DEC7 |
  dw $7FFF                                  ; $02DEC9 |
  dw $7FFF                                  ; $02DECB |
  dw $7FFF                                  ; $02DECD |
  dw $7FFF                                  ; $02DECF |
  dw $7FFF                                  ; $02DED1 |
  dw $7FFF                                  ; $02DED3 |
  dw $7FFF                                  ; $02DED5 |
  dw $7FFF                                  ; $02DED7 |
  dw $7FFF                                  ; $02DED9 |
  dw $7FFF                                  ; $02DEDB |

; boss_key_ptr sub
  LDA !s_player_x_cam_rel                   ; $02DEDD |
  SEC                                       ; $02DEE0 |
  SBC #$0078                                ; $02DEE1 |
  BPL CODE_02DEE9                           ; $02DEE4 |
  LDA #$0000                                ; $02DEE6 |

CODE_02DEE9:
  ASL A                                     ; $02DEE9 |
  ASL A                                     ; $02DEEA |
  STA !gsu_r6                               ; $02DEEB |
  LDA #$00D1                                ; $02DEEE |
  STA !gsu_r8                               ; $02DEF1 |
  LDA #$000F                                ; $02DEF4 |
  STA !gsu_r12                              ; $02DEF7 |
  LDA #$DEBF                                ; $02DEFA |
  STA !gsu_r14                              ; $02DEFD |
  LDA #$0002                                ; $02DF00 |
  STA !gsu_r0                               ; $02DF03 |
  LDX #$08                                  ; $02DF06 |
  LDA #$E167                                ; $02DF08 |
  JSL r_gsu_init_1                          ; $02DF0B | GSU init
  LDX $12                                   ; $02DF0F |
  LDA !s_player_y_cam_rel                   ; $02DF11 |
  CMP #$0088                                ; $02DF14 |
  BMI CODE_02DF52                           ; $02DF17 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DF19 |
  CMP #$0100                                ; $02DF1B |
  BNE CODE_02DF29                           ; $02DF1E |
  LDA #$0050                                ; $02DF20 |\ play sound #$0050
  JSL push_sound_queue                      ; $02DF23 |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DF27 |

CODE_02DF29:
  SEC                                       ; $02DF29 |
  SBC #$0010                                ; $02DF2A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02DF2D |
  BNE CODE_02DF52                           ; $02DF2F |
  LDX #$08                                  ; $02DF31 |
  LDA #$B3D9                                ; $02DF33 | sfx
  JSL r_gsu_init_1                          ; $02DF36 | GSU init
  LDX $12                                   ; $02DF3A |
  LDA #$0031                                ; $02DF3C |
  STA !r_game_mode                          ; $02DF3F |
  LDA #$0004                                ; $02DF42 |
  STA !r_reg_tm_mirror                      ; $02DF45 |
  STA !r_reg_tmw_mirror                     ; $02DF48 |
  STZ !r_reg_coldata_mirror                 ; $02DF4B |
  JSL $03A31E                               ; $02DF4E |

CODE_02DF52:
  JMP CODE_02DDE4                           ; $02DF52 |

init_boss_explosion:
  LDA #$0002                                ; $02DF55 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02DF58 |

CODE_02DF5A:
  LDA #$0074                                ; $02DF5A |\ play sound #$0074
  JSL push_sound_queue                      ; $02DF5D |/
  LDA #$0800                                ; $02DF61 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02DF64 |
  RTL                                       ; $02DF67 |

  dw $0000                                  ; $02DF68 |
  dw $7F00                                  ; $02DF6A |
  dw $23EC                                  ; $02DF6C |
  dw $22DF                                  ; $02DF6E |

  dw $0002                                  ; $02DF70 |
  dw $0004                                  ; $02DF72 |
  dw $0004                                  ; $02DF74 |
  dw $0004                                  ; $02DF76 |
  dw $0004                                  ; $02DF78 |

main_boss_explosion:
  LDA !s_spr_anim_frame                     ; $02DF7A |
  CMP #$0032                                ; $02DF7D |
  BNE CODE_02DF86                           ; $02DF80 |
  JSL $06C9D7                               ; $02DF82 |

CODE_02DF86:
  LDA !s_spr_wildcard_3_lo,x                ; $02DF86 |
  BPL CODE_02DF8E                           ; $02DF89 |
  JMP CODE_02E04E                           ; $02DF8B |

CODE_02DF8E:
  LDA #$0017                                ; $02DF8E |
  STA !gsu_r0                               ; $02DF91 |
  LDA #$A48C                                ; $02DF94 |
  STA !gsu_r4                               ; $02DF97 |
  LDA !s_spr_cam_x_pos,x                    ; $02DF9A |
  BPL CODE_02DFA2                           ; $02DF9D |
  LDA #$0000                                ; $02DF9F |

CODE_02DFA2:
  CMP #$0100                                ; $02DFA2 |
  BCC CODE_02DFAA                           ; $02DFA5 |
  LDA #$00FF                                ; $02DFA7 |

CODE_02DFAA:
  STA !gsu_r1                               ; $02DFAA |
  CLC                                       ; $02DFAD |
  ADC !r_bg1_cam_x                          ; $02DFAE |
  STA !s_spr_x_pixel_pos,x                  ; $02DFB1 |
  LDA !s_spr_cam_y_pos,x                    ; $02DFB4 |
  BPL CODE_02DFBC                           ; $02DFB7 |
  LDA #$0000                                ; $02DFB9 |

CODE_02DFBC:
  CMP #$00D2                                ; $02DFBC |
  BCC CODE_02DFC4                           ; $02DFBF |
  LDA #$00D1                                ; $02DFC1 |

CODE_02DFC4:
  STA !gsu_r2                               ; $02DFC4 |
  CLC                                       ; $02DFC7 |
  ADC !r_bg1_cam_y                          ; $02DFC8 |
  STA !s_spr_y_pixel_pos,x                  ; $02DFCB |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $02DFCE |
  AND #$00FF                                ; $02DFD0 |
  STA !gsu_r12                              ; $02DFD3 |
  LDX #$08                                  ; $02DFD6 |
  LDA #$B2B6                                ; $02DFD8 |
  JSL r_gsu_init_1                          ; $02DFDB | GSU init
  JSL $00BE39                               ; $02DFDF |

  db $D0, $56, $7E, $02                     ; $02DFE3 |
  db $3A, $70, $48, $03                     ; $02DFE7 |

; execution continues here
  LDX $12                                   ; $02DFEB |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02DFED |
  STA !gsu_r6                               ; $02DFEF |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02DFF2 |
  STA !gsu_r1                               ; $02DFF4 |
  LDA !s_spr_wildcard_1_lo,x                ; $02DFF7 |
  STA !gsu_r2                               ; $02DFFA |
  LDX #gsu_lerp_two_colors>>16              ; $02DFFD |
  LDA #gsu_lerp_two_colors                  ; $02DFFF |
  JSL r_gsu_init_1                          ; $02E002 | GSU init
  LDX $12                                   ; $02E006 |
  LDA !s_cgram_mirror                       ; $02E008 |
  BNE CODE_02E02A                           ; $02E00C |
  LDY !r_reg_ts_mirror                      ; $02E00E |
  BEQ CODE_02E02A                           ; $02E011 |
  SEP #$20                                  ; $02E013 |
  LDA !r_reg_tm_mirror                      ; $02E015 |
  ORA !r_reg_ts_mirror                      ; $02E018 |
  STA !r_reg_tm_mirror                      ; $02E01B |
  STZ !r_reg_ts_mirror                      ; $02E01E |
  REP #$20                                  ; $02E021 |
  LDA !r_reg_coldata_mirror                 ; $02E023 |
  STA !s_cgram_mirror                       ; $02E026 |

CODE_02E02A:
  LDA !gsu_r3                               ; $02E02A |
  STA !r_reg_coldata_mirror                 ; $02E02D |
  LDA !r_reg_tm_mirror                      ; $02E030 |
  STA !r_reg_tmw_mirror                     ; $02E033 |
  STZ !r_reg_w12sel_mirror                  ; $02E036 |
  LDY #$20                                  ; $02E039 |
  STY !r_reg_wobjsel_mirror                 ; $02E03B |
  LDY #$10                                  ; $02E03E |
  STY !r_reg_cgwsel_mirror                  ; $02E040 |
  LDY #$37                                  ; $02E043 |
  STY !r_reg_cgadsub_mirror                 ; $02E045 |
  LDA #$0020                                ; $02E048 |
  TSB !r_reg_hdmaen_mirror                  ; $02E04B |

CODE_02E04E:
  JSL $03AF23                               ; $02E04E |
  LDA !s_spr_timer_1,x                      ; $02E052 |
  CMP #$0140                                ; $02E055 |
  BNE CODE_02E06C                           ; $02E058 |
  LDA #$0005                                ; $02E05A |
  STA $00004D                               ; $02E05D |
  LDA !s_spr_wildcard_1_lo,x                ; $02E061 |
  BEQ CODE_02E08D                           ; $02E064 |
  JSL $02E195                               ; $02E066 |
  BRA CODE_02E08D                           ; $02E06A |

CODE_02E06C:
  CMP #$00C0                                ; $02E06C |
  BNE CODE_02E08D                           ; $02E06F |
  LDA !s_spr_wildcard_1_lo,x                ; $02E071 |
  BNE CODE_02E08D                           ; $02E074 |
  LDA #$0043                                ; $02E076 |\ play sound #$0043
  JSL push_sound_queue                      ; $02E079 |/
  JSL $04F74A                               ; $02E07D |
  LDA #$012E                                ; $02E081 |
  STA !s_player_cur_anim_frame              ; $02E084 |
  LDA #$0032                                ; $02E087 |
  STA !s_spr_anim_frame                     ; $02E08A |

CODE_02E08D:
  LDA !s_spr_wildcard_3_lo,x                ; $02E08D |
  BPL CODE_02E0C8                           ; $02E090 |
  LDA !s_spr_timer_1,x                      ; $02E092 |
  BMI CODE_02E0C4                           ; $02E095 |
  BEQ CODE_02E09A                           ; $02E097 |
  RTL                                       ; $02E099 |

CODE_02E09A:
  LDA !s_spr_wildcard_1_lo,x                ; $02E09A |
  BNE CODE_02E0C4                           ; $02E09D |
  LDA #$0006                                ; $02E09F |
  STA $00004D                               ; $02E0A2 |
  LDA #$0031                                ; $02E0A6 |
  STA !r_game_mode                          ; $02E0A9 |
  STZ !r_reg_tmw_mirror                     ; $02E0AC |
  LDY #$00                                  ; $02E0AF |
  STY !r_reg_wobjsel_mirror                 ; $02E0B1 |
  LDY #$22                                  ; $02E0B4 |
  STY !r_reg_cgwsel_mirror                  ; $02E0B6 |
  LDY #$20                                  ; $02E0B9 |
  STY !r_reg_cgadsub_mirror                 ; $02E0BB |
  LDA #$0020                                ; $02E0BE |
  TRB !r_reg_hdmaen_mirror                  ; $02E0C1 |

CODE_02E0C4:
  JML $03A31E                               ; $02E0C4 |

CODE_02E0C8:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02E0C8 |
  SEC                                       ; $02E0CB |
  SBC #$0040                                ; $02E0CC |
  CMP #$0100                                ; $02E0CF |
  BCS CODE_02E0D7                           ; $02E0D2 |
  LDA #$0100                                ; $02E0D4 |

CODE_02E0D7:
  STA !s_spr_gsu_morph_2_lo,x               ; $02E0D7 |
  CLC                                       ; $02E0DA |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $02E0DB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02E0DD |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02E0DF |
  CMP #$0100                                ; $02E0E1 |
  BCC CODE_02E114                           ; $02E0E4 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02E0E6 |
  BNE CODE_02E0ED                           ; $02E0E8 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $02E0EA |
  RTL                                       ; $02E0EC |

CODE_02E0ED:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $02E0ED |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $02E0EF |
  BNE CODE_02E0FE                           ; $02E0F1 |
  LDY $61CE                                 ; $02E0F3 |
  BEQ CODE_02E0FE                           ; $02E0F6 |
  LDA #$7FFF                                ; $02E0F8 |
  STA !s_spr_wildcard_1_lo,x                ; $02E0FB |

CODE_02E0FE:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $02E0FE |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02E100 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02E102 |
  LDY $61CE                                 ; $02E105 |
  BEQ CODE_02E10F                           ; $02E108 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02E10A |
  LDA $DF68,y                               ; $02E10C |

CODE_02E10F:
  STA !s_spr_wildcard_6_lo_dp,x             ; $02E10F |
  JMP CODE_02DF5A                           ; $02E111 |

CODE_02E114:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02E114 |
  CLC                                       ; $02E116 |
  ADC $DF70,y                               ; $02E117 |
  CMP #$0100                                ; $02E11A |
  BCC CODE_02E122                           ; $02E11D |
  LDA #$0100                                ; $02E11F |

CODE_02E122:
  STA !s_spr_wildcard_5_lo_dp,x             ; $02E122 |
  CPY #$00                                  ; $02E124 |
  BEQ CODE_02E12D                           ; $02E126 |
  CMP #$00C0                                ; $02E128 |
  BCS CODE_02E190                           ; $02E12B |

CODE_02E12D:
  LDA $14                                   ; $02E12D |
  AND #$0001                                ; $02E12F |
  BNE CODE_02E190                           ; $02E132 |
  LDA $10                                   ; $02E134 |
  STA !gsu_r1                               ; $02E136 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $02E139 |
  AND #$00FF                                ; $02E13B |
  LSR A                                     ; $02E13E |
  NOP                                       ; $02E13F |
  NOP                                       ; $02E140 |
  STA !gsu_r2                               ; $02E141 |
  LDA #$0500                                ; $02E144 |
  STA !gsu_r5                               ; $02E147 |
  LDX #$0A                                  ; $02E14A |
  LDA #$91E0                                ; $02E14C |
  JSL r_gsu_init_1                          ; $02E14F | GSU init
  LDX $12                                   ; $02E153 |
  LDA #$01DD                                ; $02E155 |
  JSL spawn_ambient_sprite                  ; $02E158 |
  LDA !s_spr_x_pixel_pos,x                  ; $02E15C |
  SEC                                       ; $02E15F |
  SBC #$0008                                ; $02E160 |
  CLC                                       ; $02E163 |
  ADC !gsu_r1                               ; $02E164 |
  STA $70A2,y                               ; $02E167 |
  LDA !s_spr_y_pixel_pos,x                  ; $02E16A |
  SEC                                       ; $02E16D |
  SBC #$0008                                ; $02E16E |
  CLC                                       ; $02E171 |
  ADC !gsu_r2                               ; $02E172 |
  STA $7142,y                               ; $02E175 |
  LDA !gsu_r3                               ; $02E178 |
  STA $71E0,y                               ; $02E17B |
  LDA !gsu_r4                               ; $02E17E |
  STA $71E2,y                               ; $02E181 |
  LDA #$0004                                ; $02E184 |
  STA $7E4C,y                               ; $02E187 |
  LDA #$0006                                ; $02E18A |
  STA $7782,y                               ; $02E18D |

CODE_02E190:
  RTL                                       ; $02E190 |

; boss explosion sub
  JSL $03A32E                               ; $02E191 |
  LDA #$0014                                ; $02E195 |
  JML spawn_sprite_init                     ; $02E198 |
  LDA #$0200                                ; $02E19C |
  LDX #$00                                  ; $02E19F |
  BRA CODE_02E1A8                           ; $02E1A1 |
  LDA #$0200                                ; $02E1A3 |
  LDX #$01                                  ; $02E1A6 |

CODE_02E1A8:
  PHA                                       ; $02E1A8 |
  LDA #$0013                                ; $02E1A9 |
  JSL spawn_sprite_init                     ; $02E1AC |
  PLA                                       ; $02E1B0 |
  BCC CODE_02E1DF                           ; $02E1B1 |
  STA !s_spr_timer_1,y                      ; $02E1B3 |
  LDA $00                                   ; $02E1B6 |
  CLC                                       ; $02E1B8 |
  ADC #$0008                                ; $02E1B9 |
  STA !s_spr_x_pixel_pos,y                  ; $02E1BC |
  LDA $02                                   ; $02E1BF |
  CLC                                       ; $02E1C1 |
  ADC #$0008                                ; $02E1C2 |
  STA !s_spr_y_pixel_pos,y                  ; $02E1C5 |
  TXA                                       ; $02E1C8 |
  STA !s_spr_wildcard_1_lo,y                ; $02E1C9 |
  ORA !r_cur_world                          ; $02E1CC |
  ASL A                                     ; $02E1CF |
  TAX                                       ; $02E1D0 |
  LDA $0CDACA,x                             ; $02E1D1 |
  STA !s_spr_wildcard_6_lo,y                ; $02E1D5 |
  LDA $0CDAE2,x                             ; $02E1D8 |
  STA !s_spr_gsu_morph_1_lo,y               ; $02E1DC |

CODE_02E1DF:
  LDX $12                                   ; $02E1DF |
  LDA #$0001                                ; $02E1E1 |
  STA !s_player_disable_flag                ; $02E1E4 |
  JML $028922                               ; $02E1E7 |

init_log:
  JSL $03AE60                               ; $02E1EB |
  STZ !s_spr_facing_dir,x                   ; $02E1EF |
  SEP #$20                                  ; $02E1F2 |
  LDA #$FF                                  ; $02E1F4 |
  STA $7863,x                               ; $02E1F6 |
  REP #$20                                  ; $02E1F9 |
  RTL                                       ; $02E1FB |

; log data
  dw $0002                                  ; $02E1FC |
  dw $FFFE                                  ; $02E1FE |
  dw $01E0                                  ; $02E200 |
  dw $01E0                                  ; $02E202 |
  dw $01E0                                  ; $02E204 |
  dw $01E0                                  ; $02E206 |
  dw $01E0                                  ; $02E208 |
  dw $01E0                                  ; $02E20A |
  dw $01E0                                  ; $02E20C |
  dw $01E0                                  ; $02E20E |
  dw $01E0                                  ; $02E210 |
  dw $01E0                                  ; $02E212 |
  dw $01E4                                  ; $02E214 |
  dw $01E8                                  ; $02E216 |
  dw $01EC                                  ; $02E218 |
  dw $01F0                                  ; $02E21A |
  dw $01F4                                  ; $02E21C |
  dw $01F8                                  ; $02E21E |
  dw $01FC                                  ; $02E220 |
  dw $01FE                                  ; $02E222 |
  dw $0000                                  ; $02E224 |
  dw $0000                                  ; $02E226 |
  dw $0000                                  ; $02E228 |
  dw $0000                                  ; $02E22A |
  dw $0002                                  ; $02E22C |
  dw $0004                                  ; $02E22E |
  dw $0008                                  ; $02E230 |
  dw $000C                                  ; $02E232 |
  dw $0010                                  ; $02E234 |
  dw $0014                                  ; $02E236 |
  dw $0018                                  ; $02E238 |
  dw $001C                                  ; $02E23A |
  dw $0020                                  ; $02E23C |
  dw $0020                                  ; $02E23E |
  dw $0020                                  ; $02E240 |
  dw $0020                                  ; $02E242 |
  dw $0020                                  ; $02E244 |
  dw $0020                                  ; $02E246 |
  dw $0020                                  ; $02E248 |
  dw $0020                                  ; $02E24A |
  dw $0020                                  ; $02E24C |
  dw $0020                                  ; $02E24E |
  dw $0004                                  ; $02E250 |
  dw $0000                                  ; $02E252 |
  dw $0006                                  ; $02E254 |
  dw $FFFF                                  ; $02E256 |

; log data
  dw $0080                                  ; $02E258 |
  dw $0030                                  ; $02E25A |
  dw $0018                                  ; $02E25C |
  dw $0010                                  ; $02E25E |
  dw $000C                                  ; $02E260 |
  dw $0008                                  ; $02E262 |
  dw $0008                                  ; $02E264 |
  dw $0008                                  ; $02E266 |
  dw $0008                                  ; $02E268 |

main_log:
  JSL $03AA52                               ; $02E26A |
  JSL $03AF23                               ; $02E26E |
  REP #$10                                  ; $02E272 |
  LDA !s_spr_wildcard_2_lo,x                ; $02E274 |
  TAX                                       ; $02E277 |
  LDA $70000C,x                             ; $02E278 |
  AND #$0008                                ; $02E27C |
  STA $04                                   ; $02E27F |
  LDA $700014,x                             ; $02E281 |
  AND #$0008                                ; $02E285 |
  STA $08                                   ; $02E288 |
  SEP #$10                                  ; $02E28A |
  LDX $12                                   ; $02E28C |
  LDA $7860,x                               ; $02E28E |
  AND #$0001                                ; $02E291 |
  BEQ CODE_02E299                           ; $02E294 |
  JMP CODE_02E2D1                           ; $02E296 |

CODE_02E299:
  LDA $7862,x                               ; $02E299 |
  AND #$00FF                                ; $02E29C |
  STA $06                                   ; $02E29F |
  BNE CODE_02E2A6                           ; $02E2A1 |
  JMP CODE_02E3BE                           ; $02E2A3 |

CODE_02E2A6:
  LDA !s_spr_timer_3,x                      ; $02E2A6 |
  BNE CODE_02E2D1                           ; $02E2A9 |
  LDY #$0E                                  ; $02E2AB |
  LDA !s_spr_y_speed_lo,x                   ; $02E2AD |
  CMP #$00E0                                ; $02E2B0 |
  BPL CODE_02E2CB                           ; $02E2B3 |
  LDA !s_spr_x_speed_lo,x                   ; $02E2B5 |
  BPL CODE_02E2BE                           ; $02E2B8 |
  EOR #$FFFF                                ; $02E2BA |
  INC A                                     ; $02E2BD |

CODE_02E2BE:
  CMP #$0040                                ; $02E2BE |
  BCC CODE_02E2D1                           ; $02E2C1 |
  ASL A                                     ; $02E2C3 |
  ASL A                                     ; $02E2C4 |
  ASL A                                     ; $02E2C5 |
  XBA                                       ; $02E2C6 |
  AND #$000E                                ; $02E2C7 |
  TAY                                       ; $02E2CA |

CODE_02E2CB:
  LDA $E258,y                               ; $02E2CB |
  STA !s_spr_timer_3,x                      ; $02E2CE |

CODE_02E2D1:
  LDA !s_spr_y_speed_lo,x                   ; $02E2D1 |
  SEC                                       ; $02E2D4 |
  SBC #$0020                                ; $02E2D5 |
  CMP #$FF80                                ; $02E2D8 |
  BPL CODE_02E2E0                           ; $02E2DB |
  LDA #$FF80                                ; $02E2DD |

CODE_02E2E0:
  STA !s_spr_y_speed_lo,x                   ; $02E2E0 |
  REP #$10                                  ; $02E2E3 |
  LDA !s_spr_wildcard_2_lo,x                ; $02E2E5 |
  TAX                                       ; $02E2E8 |
  LDA $700002,x                             ; $02E2E9 |
  SEC                                       ; $02E2ED |
  SBC $700012,x                             ; $02E2EE |
  STA $02                                   ; $02E2F2 |
  LDA $700002,x                             ; $02E2F4 |
  SEC                                       ; $02E2F8 |
  SBC $70000A,x                             ; $02E2F9 |
  PHP                                       ; $02E2FD |
  BPL CODE_02E304                           ; $02E2FE |
  EOR #$FFFF                                ; $02E300 |
  INC A                                     ; $02E303 |

CODE_02E304:
  ASL A                                     ; $02E304 |
  ASL A                                     ; $02E305 |
  ASL A                                     ; $02E306 |
  ASL A                                     ; $02E307 |
  ASL A                                     ; $02E308 |
  TAX                                       ; $02E309 |
  LDA $0BB810,x                             ; $02E30A |
  PLP                                       ; $02E30E |
  BPL CODE_02E315                           ; $02E30F |
  EOR #$FFFF                                ; $02E311 |
  INC A                                     ; $02E314 |

CODE_02E315:
  STA $00                                   ; $02E315 |
  LDA $02                                   ; $02E317 |
  PHP                                       ; $02E319 |
  BPL CODE_02E320                           ; $02E31A |
  EOR #$FFFF                                ; $02E31C |
  INC A                                     ; $02E31F |

CODE_02E320:
  ASL A                                     ; $02E320 |
  ASL A                                     ; $02E321 |
  ASL A                                     ; $02E322 |
  ASL A                                     ; $02E323 |
  ASL A                                     ; $02E324 |
  TAX                                       ; $02E325 |
  LDA $0BB810,x                             ; $02E326 |
  PLP                                       ; $02E32A |
  BMI CODE_02E331                           ; $02E32B |
  EOR #$FFFF                                ; $02E32D |
  INC A                                     ; $02E330 |

CODE_02E331:
  CLC                                       ; $02E331 |
  ADC $00                                   ; $02E332 |
  LSR A                                     ; $02E334 |
  AND #$01FE                                ; $02E335 |
  STA $00                                   ; $02E338 |
  LDX $12                                   ; $02E33A |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02E33C |
  BEQ CODE_02E34E                           ; $02E33E |
  TYA                                       ; $02E340 |
  CLC                                       ; $02E341 |
  ADC #$0008                                ; $02E342 |
  CMP #$0010                                ; $02E345 |
  BCS CODE_02E34D                           ; $02E348 |
  LDY #$0000                                ; $02E34A |

CODE_02E34D:
  TYA                                       ; $02E34D |

CODE_02E34E:
  SEP #$10                                  ; $02E34E |
  STA $02                                   ; $02E350 |
  SEC                                       ; $02E352 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $02E353 |
  LDY #$00                                  ; $02E356 |
  AND #$0100                                ; $02E358 |
  BEQ CODE_02E35F                           ; $02E35B |
  LDY #$02                                  ; $02E35D |

CODE_02E35F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $02E35F |
  CLC                                       ; $02E362 |
  ADC $E1FC,y                               ; $02E363 |
  AND #$01FE                                ; $02E366 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02E369 |
  SEC                                       ; $02E36C |
  SBC $02                                   ; $02E36D |
  EOR $E1FC,y                               ; $02E36F |
  BMI CODE_02E379                           ; $02E372 |
  LDA $02                                   ; $02E374 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02E376 |

CODE_02E379:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02E379 |
  BEQ CODE_02E39F                           ; $02E37B |
  CLC                                       ; $02E37D |
  ADC #$0030                                ; $02E37E |
  LSR A                                     ; $02E381 |
  LSR A                                     ; $02E382 |
  LSR A                                     ; $02E383 |
  LSR A                                     ; $02E384 |
  AND #$0006                                ; $02E385 |
  TAY                                       ; $02E388 |
  LDA $7964,y                               ; $02E389 |
  BEQ CODE_02E394                           ; $02E38C |
  LDY #$00                                  ; $02E38E |
  LDA $02                                   ; $02E390 |
  BRA CODE_02E398                           ; $02E392 |

CODE_02E394:
  LDA $00                                   ; $02E394 |
  ASL A                                     ; $02E396 |
  ASL A                                     ; $02E397 |

CODE_02E398:
  SEC                                       ; $02E398 |
  SBC #$0010                                ; $02E399 |
  AND #$01FE                                ; $02E39C |

CODE_02E39F:
  LDY #$04                                  ; $02E39F |
  REP #$10                                  ; $02E3A1 |
  TAX                                       ; $02E3A3 |
  LDA $00E9D4,x                             ; $02E3A4 |
  ASL A                                     ; $02E3A8 |
  SEP #$10                                  ; $02E3A9 |
  LDX $12                                   ; $02E3AB |
  CMP !s_spr_x_speed_lo,x                   ; $02E3AD |
  BPL CODE_02E3B4                           ; $02E3B0 |
  INY                                       ; $02E3B2 |
  INY                                       ; $02E3B3 |

CODE_02E3B4:
  LDA !s_spr_x_speed_lo,x                   ; $02E3B4 |
  CLC                                       ; $02E3B7 |
  ADC $E250,y                               ; $02E3B8 |
  STA !s_spr_x_speed_lo,x                   ; $02E3BB |

CODE_02E3BE:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02E3BE |
  BEQ CODE_02E3D8                           ; $02E3C0 |
  LDA !s_spr_x_delta_lo,x                   ; $02E3C2 |
  CLC                                       ; $02E3C5 |
  ADC !s_player_x                           ; $02E3C6 |
  STA !s_player_x                           ; $02E3C9 |
  LDA !s_spr_x_player_delta,x               ; $02E3CC |
  SEC                                       ; $02E3CF |
  SBC !s_spr_x_delta_lo,x                   ; $02E3D0 |
  STA !s_spr_x_player_delta,x               ; $02E3D3 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02E3D6 |

CODE_02E3D8:
  LDA !s_player_y_speed                     ; $02E3D8 |
  BMI CODE_02E440                           ; $02E3DB |
  LDA !s_spr_x_player_delta,x               ; $02E3DD |
  CLC                                       ; $02E3E0 |
  ADC #$0014                                ; $02E3E1 |
  CMP #$0028                                ; $02E3E4 |
  BCS CODE_02E440                           ; $02E3E7 |
  TXY                                       ; $02E3E9 |
  REP #$10                                  ; $02E3EA |
  LDX !s_spr_gsu_morph_1_lo,y               ; $02E3EC |
  LDA $0BBA12,x                             ; $02E3EF |
  SEP #$20                                  ; $02E3F3 |
  STA !reg_m7a                              ; $02E3F5 |
  XBA                                       ; $02E3F8 |
  STA !reg_m7a                              ; $02E3F9 |
  TYX                                       ; $02E3FC |
  LDA !s_spr_x_player_delta,x               ; $02E3FD |
  STA !reg_m7b                              ; $02E400 |
  REP #$20                                  ; $02E403 |
  SEP #$10                                  ; $02E405 |
  LDA !reg_mpym                             ; $02E407 |
  CLC                                       ; $02E40A |
  ADC !s_spr_y_pixel_pos,x                  ; $02E40B |
  SEC                                       ; $02E40E |
  SBC !s_player_y                           ; $02E40F |
  SEC                                       ; $02E412 |
  SBC #$0020                                ; $02E413 |
  CMP #$FFF8                                ; $02E416 |
  BCC CODE_02E440                           ; $02E419 |
  INC A                                     ; $02E41B |
  ADC !s_player_y                           ; $02E41C |
  STA !s_player_y                           ; $02E41F |
  LDA #$0100                                ; $02E422 |
  STA !s_player_y_speed                     ; $02E425 |
  INC !s_on_sprite_platform_flag            ; $02E428 |
  STZ !s_player_ground_type                 ; $02E42B |
  LDA #$0010                                ; $02E42E |
  STA $0CCA                                 ; $02E431 |
  LDA !s_spr_x_player_delta,x               ; $02E434 |
  BNE CODE_02E43A                           ; $02E437 |
  INC A                                     ; $02E439 |

CODE_02E43A:
  ASL A                                     ; $02E43A |
  AND #$01FE                                ; $02E43B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02E43E |

CODE_02E440:
  LDA !s_spr_dyntile_index,x                ; $02E440 |
  LSR A                                     ; $02E443 |
  LSR A                                     ; $02E444 |
  LSR A                                     ; $02E445 |
  SEC                                       ; $02E446 |
  SBC !r_frame_counter_global               ; $02E447 |
  AND #$0003                                ; $02E44A |
  BEQ CODE_02E452                           ; $02E44D |
  JMP CODE_02E48D                           ; $02E44F |

CODE_02E452:
  LDA !s_spr_gsu_morph_1_lo,x               ; $02E452 |
  LSR A                                     ; $02E455 |
  STA !gsu_r5                               ; $02E456 |
  LDY !s_spr_dyntile_index,x                ; $02E459 |
  TYX                                       ; $02E45C |
  LDA $03A9CE,x                             ; $02E45D |
  STA !gsu_r3                               ; $02E461 |
  LDA $03A9EE,x                             ; $02E464 |
  STA !gsu_r2                               ; $02E468 |
  LDA #$0100                                ; $02E46B |
  STA !gsu_r6                               ; $02E46E |
  LDA #$4060                                ; $02E471 |
  STA !gsu_r12                              ; $02E474 |
  LDA #$0054                                ; $02E477 |
  STA !gsu_r13                              ; $02E47A |
  SEP #$10                                  ; $02E47D |
  LDX #$08                                  ; $02E47F |
  LDA #$8205                                ; $02E481 |
  JSL r_gsu_init_1                          ; $02E484 | GSU init
  INC $0CF9                                 ; $02E488 |
  LDX $12                                   ; $02E48B |

CODE_02E48D:
  RTL                                       ; $02E48D |

; naval stalk table sub
  TYX                                       ; $02E48E |
  RTS                                       ; $02E48F |

  dw $FFE0, $0020                           ; $02E490 |

init_naval_piranha:
  STX $1072                                 ; $02E494 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $02E497 |
  LDA #$01FF                                ; $02E499 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02E49C |
  STA !s_spr_wildcard_1_lo,x                ; $02E49F |
  LDA #$001C                                ; $02E4A2 |
  STA $1068                                 ; $02E4A5 |
  LDA #$0006                                ; $02E4A8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02E4AB |
  DEC $106E                                 ; $02E4AD |
  LDY #$01                                  ; $02E4B0 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E4B2 |
  LDA #$0003                                ; $02E4B4 |
  STA $1082                                 ; $02E4B7 |
  LDA #$0388                                ; $02E4BA |
  STA !s_spr_x_pixel_pos,x                  ; $02E4BD |
  LDA !s_spr_y_pixel_pos,x                  ; $02E4C0 |
  STA $1074                                 ; $02E4C3 |
  CLC                                       ; $02E4C6 |
  ADC #$0060                                ; $02E4C7 |
  STA !s_spr_y_pixel_pos,x                  ; $02E4CA |
  LDA #$0070                                ; $02E4CD |
  STA !s_spr_gsu_morph_2_lo,x               ; $02E4D0 |
  LDA #$FFC0                                ; $02E4D3 |
  STA $1070                                 ; $02E4D6 |
  LDA #$0066                                ; $02E4D9 |
  TXY                                       ; $02E4DC |
  JSL spawn_sprite_active_y                 ; $02E4DD |
  LDA #$0388                                ; $02E4E1 |
  STA !s_spr_x_pixel_pos,y                  ; $02E4E4 |
  LDA #$0780                                ; $02E4E7 |
  STA !s_spr_y_pixel_pos,y                  ; $02E4EA |
  LDA #$BC00                                ; $02E4ED |
  STA !s_spr_bitwise_settings_1,y           ; $02E4F0 |
  LDA !s_spr_bitwise_settings_3,y           ; $02E4F3 |
  ORA #$2000                                ; $02E4F6 |
  STA !s_spr_bitwise_settings_3,y           ; $02E4F9 |
  LDA #$2C01                                ; $02E4FC |
  STA !s_spr_oam_1,y                        ; $02E4FF |
  LDA #$0001                                ; $02E502 |
  STA !s_spr_anim_frame,y                   ; $02E505 |
  SEP #$20                                  ; $02E508 |
  LDA #$2C                                  ; $02E50A |
  STA !s_spr_oam_yxppccct,y                 ; $02E50C |
  STY $108A                                 ; $02E50F |
  STZ !r_header_bg1_tileset                 ; $02E512 |
  LDA #$08                                  ; $02E515 |
  STA !s_spr_wildcard_5_lo,y                ; $02E517 |
  LDA #$FF                                  ; $02E51A |
  STA $7863,y                               ; $02E51C |
  REP #$20                                  ; $02E51F |
  STZ $105A                                 ; $02E521 |
  LDX #$1E                                  ; $02E524 |

CODE_02E526:
  LDA $702E8C,x                             ; $02E526 |
  STA $7021C0,x                             ; $02E52A |
  DEX                                       ; $02E52E |
  DEX                                       ; $02E52F |
  BPL CODE_02E526                           ; $02E530 |
  RTL                                       ; $02E532 |

  dw $E905                                  ; $02E533 |
  dw $EA2C                                  ; $02E535 |
  dw $EB2D                                  ; $02E537 |
  dw $EB54                                  ; $02E539 |
  dw $EC46                                  ; $02E53B |
  dw $EE2C                                  ; $02E53D |
  dw $EB54                                  ; $02E53F |
  dw $EC41                                  ; $02E541 |
  dw $ECAB                                  ; $02E543 |
  dw $ECD3                                  ; $02E545 |
  dw $ED71                                  ; $02E547 |
  dw $EB54                                  ; $02E549 |
  dw $ED84                                  ; $02E54B |
  dw $EE7A                                  ; $02E54D |
  dw $EF86                                  ; $02E54F |
  dw $EDB5                                  ; $02E551 |
  dw $EDE1                                  ; $02E553 |
  dw $EB54                                  ; $02E555 |
  dw $EC46                                  ; $02E557 |
  dw $EE2C                                  ; $02E559 |
  dw $EB54                                  ; $02E55B |
  dw $EE7A                                  ; $02E55D |
  dw $EF86                                  ; $02E55F |
  dw $F02D                                  ; $02E561 |
  dw $F074                                  ; $02E563 |
  dw $EB54                                  ; $02E565 |
  dw $F09C                                  ; $02E567 |
  dw $F10E                                  ; $02E569 |
  dw $EC46                                  ; $02E56B |
  dw $EE2C                                  ; $02E56D |
  dw $F156                                  ; $02E56F |
  dw $EE7A                                  ; $02E571 |
  dw $EC46                                  ; $02E573 |
  dw $EE2C                                  ; $02E575 |
  dw $F1DF                                  ; $02E577 |
  dw $F205                                  ; $02E579 |
  dw $F273                                  ; $02E57B |
  dw $F310                                  ; $02E57D |

  JSR CODE_02E5E4                           ; $02E57F |
  JSL $03AF23                               ; $02E582 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02E586 |
  BMI CODE_02E5AB                           ; $02E588 |
  TXY                                       ; $02E58A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02E58B |
  ASL A                                     ; $02E58D |
  TAX                                       ; $02E58E |
  JSR ($E533,x)                             ; $02E58F |
  LDY !s_spr_draw_priority,x                ; $02E592 |
  BMI CODE_02E5C1                           ; $02E595 |
  LDY $1084                                 ; $02E597 |
  BNE CODE_02E5C1                           ; $02E59A |
  JSR CODE_02E68E                           ; $02E59C |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02E59F |
  CPY #$20                                  ; $02E5A1 |
  BPL CODE_02E5AB                           ; $02E5A3 |
  JSR CODE_02E761                           ; $02E5A5 |
  JSR CODE_02E8A5                           ; $02E5A8 |

CODE_02E5AB:
  JSR CODE_02E6C3                           ; $02E5AB |
  LDA !s_spr_timer_4,x                      ; $02E5AE |
  BEQ CODE_02E5C1                           ; $02E5B1 |
  AND #$0003                                ; $02E5B3 |
  BNE CODE_02E5C1                           ; $02E5B6 |
  LDA !s_spr_oam_yxppccct,x                 ; $02E5B8 |
  EOR #$0002                                ; $02E5BB |
  STA !s_spr_oam_yxppccct,x                 ; $02E5BE |

CODE_02E5C1:
  LDA !s_spr_x_speed_lo,x                   ; $02E5C1 |
  BPL CODE_02E5CA                           ; $02E5C4 |
  EOR #$FFFF                                ; $02E5C6 |
  INC A                                     ; $02E5C9 |

CODE_02E5CA:
  CLC                                       ; $02E5CA |
  ADC $1088                                 ; $02E5CB |
  CMP #$2000                                ; $02E5CE |
  BMI CODE_02E5E0                           ; $02E5D1 |
  SEC                                       ; $02E5D3 |
  SBC #$2000                                ; $02E5D4 |
  PHA                                       ; $02E5D7 |
  LDA #$005F                                ; $02E5D8 |\ play sound #$005F
  JSL push_sound_queue                      ; $02E5DB |/
  PLA                                       ; $02E5DF |

CODE_02E5E0:
  STA $1088                                 ; $02E5E0 |
  RTL                                       ; $02E5E3 |

CODE_02E5E4:
  LDY !s_spr_draw_priority,x                ; $02E5E4 |
  BMI CODE_02E65D                           ; $02E5E7 |
  JSL $03AB1C                               ; $02E5E9 |
  LDA $1068                                 ; $02E5ED |
  STA $6000                                 ; $02E5F0 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02E5F3 |
  STA $6002                                 ; $02E5F6 |
  LDA $106A                                 ; $02E5F9 |
  STA $6004                                 ; $02E5FC |
  LDA $106C                                 ; $02E5FF |
  STA $6006                                 ; $02E602 |
  LDA $1070                                 ; $02E605 |
  STA $6008                                 ; $02E608 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02E60B |
  LSR A                                     ; $02E60E |
  STA $600A                                 ; $02E60F |
  LDA !s_spr_wildcard_1_lo,x                ; $02E612 |
  LSR A                                     ; $02E615 |
  STA $600C                                 ; $02E616 |
  LDA $1084                                 ; $02E619 |
  STA $601E                                 ; $02E61C |
  LDA !s_spr_cam_x_pos,x                    ; $02E61F |
  STA !gsu_r1                               ; $02E622 |
  LDA !s_spr_cam_y_pos,x                    ; $02E625 |
  STA !gsu_r2                               ; $02E628 |
  LDA !s_spr_facing_dir,x                   ; $02E62B |
  STA !gsu_r8                               ; $02E62E |
  TXA                                       ; $02E631 |
  STA !gsu_r10                              ; $02E632 |
  LDA #$0002                                ; $02E635 |
  STA !gsu_r0                               ; $02E638 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02E63B |
  TYA                                       ; $02E63D |
  ASL A                                     ; $02E63E |
  STA !gsu_r5                               ; $02E63F |
  LDA #$FC39                                ; $02E642 |
  STA !gsu_r14                              ; $02E645 |
  LDX #$08                                  ; $02E648 |
  LDA #$A062                                ; $02E64A |
  JSL r_gsu_init_1                          ; $02E64D | GSU init
  LDX $12                                   ; $02E651 |
  LDA !gsu_r1                               ; $02E653 |
  STA $0C                                   ; $02E656 |
  LDA !gsu_r2                               ; $02E658 |
  STA $0E                                   ; $02E65B |

CODE_02E65D:
  RTS                                       ; $02E65D |

  dw $0009, $0008, $0007, $0008             ; $02E65E |
  dw $000C, $000C, $0010, $000F             ; $02E666 |
  dw $000E, $0010, $000F, $000E             ; $02E66E |

  dw $FFDA, $FFD1, $FFD7, $FFD8             ; $02E676 |
  dw $FFD7, $FFD6, $FFDA, $FFD9             ; $02E67E |
  dw $FFD7, $FFDA, $FFD9, $FFD7             ; $02E686 |

CODE_02E68E:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02E68E |
  AND #$00FF                                ; $02E690 |
  ASL A                                     ; $02E693 |
  TAY                                       ; $02E694 |
  LDA $E676,y                               ; $02E695 |
  CLC                                       ; $02E698 |
  ADC $106C                                 ; $02E699 |
  CMP #$8000                                ; $02E69C |
  ROR A                                     ; $02E69F |
  STA $106C                                 ; $02E6A0 |
  LDA $E65E,y                               ; $02E6A3 |
  LDY !s_spr_facing_dir,x                   ; $02E6A6 |
  BEQ CODE_02E6AF                           ; $02E6A9 |
  EOR #$FFFF                                ; $02E6AB |
  INC A                                     ; $02E6AE |

CODE_02E6AF:
  CLC                                       ; $02E6AF |
  ADC $106A                                 ; $02E6B0 |
  CMP #$8000                                ; $02E6B3 |
  ROR A                                     ; $02E6B6 |
  STA $106A                                 ; $02E6B7 |
  RTS                                       ; $02E6BA |

; gsu table
  db $E1, $60, $A1, $20, $C1, $60, $C1, $20 ; $02E6BB |

CODE_02E6C3:
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02E6C3 |
  LDA #$0054                                ; $02E6C5 |
  STA !gsu_r13                              ; $02E6C8 |
  LDA $E6BB,y                               ; $02E6CB |
  STA !gsu_r12                              ; $02E6CE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02E6D1 |
  BMI CODE_02E71E                           ; $02E6D3 |
  LDA !s_spr_wildcard_1_lo,x                ; $02E6D5 |
  STA !gsu_r6                               ; $02E6D8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02E6DB |
  STA !gsu_r11                              ; $02E6DE |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02E6E1 |
  STA !gsu_r5                               ; $02E6E4 |
  STZ !gsu_r3                               ; $02E6E7 |
  STZ !gsu_r2                               ; $02E6EA |
  LDX #$08                                  ; $02E6ED |
  LDA #$8A81                                ; $02E6EF |
  JSL r_gsu_init_1                          ; $02E6F2 | GSU init
  LDX $12                                   ; $02E6F6 |
  LDA !gsu_r10                              ; $02E6F8 |
  STA $105C                                 ; $02E6FB |
  LDA !gsu_r11                              ; $02E6FE |
  STA $105E                                 ; $02E701 |
  LDA $6000                                 ; $02E704 |
  STA $1060                                 ; $02E707 |
  LDA $6002                                 ; $02E70A |
  STA $1062                                 ; $02E70D |
  LDA $6004                                 ; $02E710 |
  STA $1064                                 ; $02E713 |
  LDA $6006                                 ; $02E716 |
  STA $1066                                 ; $02E719 |
  BRA CODE_02E759                           ; $02E71C |

CODE_02E71E:
  LDA $105C                                 ; $02E71E |
  STA !gsu_r10                              ; $02E721 |
  LDA $105E                                 ; $02E724 |
  STA !gsu_r11                              ; $02E727 |
  LDA $1060                                 ; $02E72A |
  STA $6000                                 ; $02E72D |
  LDA $1062                                 ; $02E730 |
  STA $6002                                 ; $02E733 |
  LDA $1064                                 ; $02E736 |
  STA $6004                                 ; $02E739 |
  LDA $1066                                 ; $02E73C |
  STA $6006                                 ; $02E73F |
  LDA #$0040                                ; $02E742 |
  STA !gsu_r3                               ; $02E745 |
  STZ !gsu_r2                               ; $02E748 |
  LDX #$08                                  ; $02E74B |
  LDA #$8AF5                                ; $02E74D |
  JSL r_gsu_init_1                          ; $02E750 | GSU init
  LDX $12                                   ; $02E754 |
  INC $0CF9                                 ; $02E756 |

CODE_02E759:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $02E759 |
  EOR #$00FF                                ; $02E75B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $02E75E |

CODE_02E760:
  RTS                                       ; $02E760 |

CODE_02E761:
  LDA !s_spr_oam_pointer,x                  ; $02E761 |
  BMI CODE_02E760                           ; $02E764 |
  LDY !s_spr_collision_id,x                 ; $02E766 |
  DEY                                       ; $02E769 |
  BMI CODE_02E779                           ; $02E76A |
  LDA !s_spr_state,y                        ; $02E76C |
  CMP #$0010                                ; $02E76F |
  BNE CODE_02E779                           ; $02E772 |
  LDA !s_spr_collision_state,y              ; $02E774 |
  BNE CODE_02E77C                           ; $02E777 |

CODE_02E779:
  JMP CODE_02E82B                           ; $02E779 |

CODE_02E77C:
  LDA !s_spr_timer_4,x                      ; $02E77C |
  BEQ CODE_02E784                           ; $02E77F |

CODE_02E781:
  JMP CODE_02E81A                           ; $02E781 |

CODE_02E784:
  LDA !s_spr_x_hitbox_center,y              ; $02E784 |
  SEC                                       ; $02E787 |
  SBC !s_spr_x_hitbox_center,x              ; $02E788 |
  EOR $106E                                 ; $02E78B |
  BMI CODE_02E781                           ; $02E78E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02E790 |
  CPY #$0E                                  ; $02E792 |
  BMI CODE_02E7A2                           ; $02E794 |
  CPY #$11                                  ; $02E796 |
  BMI CODE_02E781                           ; $02E798 |
  CPY #$16                                  ; $02E79A |
  BMI CODE_02E7A2                           ; $02E79C |
  CPY #$19                                  ; $02E79E |
  BMI CODE_02E781                           ; $02E7A0 |

CODE_02E7A2:
  LDA #$0409                                ; $02E7A2 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02E7A5 |
  STZ !s_spr_x_speed_lo,x                   ; $02E7A7 |
  STZ !s_spr_x_accel,x                      ; $02E7AA |
  STZ !s_spr_y_speed_lo,x                   ; $02E7AD |
  LDA #$FFFF                                ; $02E7B0 |
  STA !s_spr_timer_4,x                      ; $02E7B3 |
  LDA $1082                                 ; $02E7B6 |
  DEC A                                     ; $02E7B9 |
  ASL A                                     ; $02E7BA |
  TAY                                       ; $02E7BB |
  LDA $E8FD,y                               ; $02E7BC |
  STA $1086                                 ; $02E7BF |
  STZ $0CE8                                 ; $02E7C2 |
  DEC $1082                                 ; $02E7C5 |
  BNE CODE_02E7D9                           ; $02E7C8 |
  JSL $02A982                               ; $02E7CA |
  LDA #$0080                                ; $02E7CE |
  PHA                                       ; $02E7D1 |
  LDA #$000F                                ; $02E7D2 |
  LDY #$20                                  ; $02E7D5 |
  BRA CODE_02E7E2                           ; $02E7D7 |

CODE_02E7D9:
  LDA #$0078                                ; $02E7D9 |
  PHA                                       ; $02E7DC |
  LDA #$000E                                ; $02E7DD |
  LDY #$1C                                  ; $02E7E0 |

CODE_02E7E2:
  STA $00                                   ; $02E7E2 |
  STY $02                                   ; $02E7E4 |
  PLA                                       ; $02E7E6 |
  JSL push_sound_queue                      ; $02E7E7 |
  LDX #$00                                  ; $02E7EB |
  LDY $1076                                 ; $02E7ED |

CODE_02E7F0:
  LDA !s_spr_wildcard_5_lo,y                ; $02E7F0 |
  STA $107C,x                               ; $02E7F3 |
  LDA $00                                   ; $02E7F6 |
  STA !s_spr_wildcard_5_lo,y                ; $02E7F8 |
  CPY $1076                                 ; $02E7FB |
  BNE CODE_02E807                           ; $02E7FE |
  INX                                       ; $02E800 |
  INX                                       ; $02E801 |
  LDY $1078                                 ; $02E802 |
  BRA CODE_02E7F0                           ; $02E805 |

CODE_02E807:
  LDX !s_cur_sprite_slot                    ; $02E807 |
  LDY $02                                   ; $02E80A |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E80C |
  STZ !s_spr_timer_1,x                      ; $02E80E |
  LDA #$01FF                                ; $02E811 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02E814 |
  STA !s_spr_wildcard_1_lo,x                ; $02E817 |

CODE_02E81A:
  LDY !s_spr_collision_id,x                 ; $02E81A |
  TYX                                       ; $02E81D |
  DEX                                       ; $02E81E |
  JSL $03B24B                               ; $02E81F |
  LDA #$000B                                ; $02E823 |\ play sound #$000B
  JSL push_sound_queue                      ; $02E826 |/
  RTS                                       ; $02E82A |

CODE_02E82B:
  TXA                                       ; $02E82B |
  STA !gsu_r1                               ; $02E82C |
  LDX #$09                                  ; $02E82F |
  LDA #$8F33                                ; $02E831 |
  JSL r_gsu_init_1                          ; $02E834 | GSU init
  LDX $12                                   ; $02E838 |
  LDY !gsu_r1                               ; $02E83A |
  BMI CODE_02E84C                           ; $02E83D |
  LDA !s_spr_state,y                        ; $02E83F |
  CMP #$0010                                ; $02E842 |
  BNE CODE_02E84C                           ; $02E845 |
  LDA !s_spr_collision_state,y              ; $02E847 |
  BNE CODE_02E84D                           ; $02E84A |

CODE_02E84C:
  RTS                                       ; $02E84C |

CODE_02E84D:
  LDA !s_spr_y_pixel_pos,x                  ; $02E84D |
  CLC                                       ; $02E850 |
  ADC #$0008                                ; $02E851 |
  SEC                                       ; $02E854 |
  SBC !s_spr_y_hitbox_center,y              ; $02E855 |
  STA $0A                                   ; $02E858 |
  LDA !s_spr_x_pixel_pos,x                  ; $02E85A |
  CLC                                       ; $02E85D |
  ADC #$0008                                ; $02E85E |
  SEC                                       ; $02E861 |
  SBC !s_spr_x_hitbox_center,y              ; $02E862 |
  STA $08                                   ; $02E865 |
  CLC                                       ; $02E867 |
  ADC $0C                                   ; $02E868 |
  CLC                                       ; $02E86A |
  ADC #$0018                                ; $02E86B |
  CMP #$0030                                ; $02E86E |
  BCS CODE_02E88E                           ; $02E871 |
  LDA $0A                                   ; $02E873 |
  CLC                                       ; $02E875 |
  ADC $0E                                   ; $02E876 |
  CLC                                       ; $02E878 |
  ADC #$0018                                ; $02E879 |
  CMP #$0030                                ; $02E87C |
  BCS CODE_02E88E                           ; $02E87F |

CODE_02E881:
  TYX                                       ; $02E881 |
  JSL $03B24B                               ; $02E882 |
  LDA #$000B                                ; $02E886 |\ play sound #$000B
  JSL push_sound_queue                      ; $02E889 |/
  RTS                                       ; $02E88D |

CODE_02E88E:
  LDA $08                                   ; $02E88E |
  CLC                                       ; $02E890 |
  ADC #$0008                                ; $02E891 |
  CMP #$0010                                ; $02E894 |
  BCS CODE_02E8A4                           ; $02E897 |
  LDA $0A                                   ; $02E899 |
  SEC                                       ; $02E89B |
  SBC #$FFF8                                ; $02E89C |
  CMP #$0050                                ; $02E89F |
  BCC CODE_02E881                           ; $02E8A2 |

CODE_02E8A4:
  RTS                                       ; $02E8A4 |

CODE_02E8A5:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02E8A5 |
  CPY #$1C                                  ; $02E8A7 |
  BPL CODE_02E8FA                           ; $02E8A9 |
  LDA !s_spr_y_pixel_pos,x                  ; $02E8AB |
  CLC                                       ; $02E8AE |
  ADC #$0008                                ; $02E8AF |
  SEC                                       ; $02E8B2 |
  SBC !s_player_center_y                    ; $02E8B3 |
  STA $0A                                   ; $02E8B6 |
  LDA !s_spr_x_pixel_pos,x                  ; $02E8B8 |
  CLC                                       ; $02E8BB |
  ADC #$0008                                ; $02E8BC |
  SEC                                       ; $02E8BF |
  SBC !s_player_center_x                    ; $02E8C0 |
  STA $08                                   ; $02E8C3 |
  CLC                                       ; $02E8C5 |
  ADC $0C                                   ; $02E8C6 |
  CLC                                       ; $02E8C8 |
  ADC #$0018                                ; $02E8C9 |
  CMP #$0030                                ; $02E8CC |
  BCS CODE_02E8E4                           ; $02E8CF |
  LDA $0A                                   ; $02E8D1 |
  CLC                                       ; $02E8D3 |
  ADC $0E                                   ; $02E8D4 |
  CLC                                       ; $02E8D6 |
  ADC #$0018                                ; $02E8D7 |
  CMP #$0030                                ; $02E8DA |
  BCS CODE_02E8E4                           ; $02E8DD |

CODE_02E8DF:
  JSL player_hit_sprite                     ; $02E8DF |
  RTS                                       ; $02E8E3 |

CODE_02E8E4:
  LDA $08                                   ; $02E8E4 |
  CLC                                       ; $02E8E6 |
  ADC #$0008                                ; $02E8E7 |
  CMP #$0010                                ; $02E8EA |
  BCS CODE_02E8FA                           ; $02E8ED |
  LDA $0A                                   ; $02E8EF |
  SEC                                       ; $02E8F1 |
  SBC #$FFF8                                ; $02E8F2 |
  CMP #$0050                                ; $02E8F5 |
  BCC CODE_02E8DF                           ; $02E8F8 |

CODE_02E8FA:
  RTS                                       ; $02E8FA |

  dw $0080, $FF80                           ; $02E8FB |

  dw $6D65, $D8ED, $62D9                    ; $02E8FF |

  TYX                                       ; $02E905 |
  LDA !s_spr_timer_1,x                      ; $02E906 |
  BNE CODE_02E8FA                           ; $02E909 |
  LDA !s_spr_timer_2,x                      ; $02E90B |
  BEQ CODE_02E913                           ; $02E90E |
  JMP CODE_02E9C9                           ; $02E910 |

CODE_02E913:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02E913 |
  BNE CODE_02E91F                           ; $02E915 |
  LDY !s_spr_wildcard_2_lo,x                ; $02E917 |
  BEQ CODE_02E922                           ; $02E91A |
  DEC !s_spr_wildcard_2_lo,x                ; $02E91C |

CODE_02E91F:
  JMP CODE_02E9C6                           ; $02E91F |

CODE_02E922:
  LDY $1076                                 ; $02E922 |
  LDA !s_spr_wildcard_5_lo,y                ; $02E925 |
  LDY $1078                                 ; $02E928 |
  ORA !s_spr_wildcard_5_lo,y                ; $02E92B |
  BNE CODE_02E91F                           ; $02E92E |
  LDA $1086                                 ; $02E930 |
  INC A                                     ; $02E933 |
  BNE CODE_02E941                           ; $02E934 |
  LDA $1082                                 ; $02E936 |
  ASL A                                     ; $02E939 |
  TAY                                       ; $02E93A |
  LDA $E8FD,y                               ; $02E93B |
  STA $1086                                 ; $02E93E |

CODE_02E941:
  LDA $1086                                 ; $02E941 |
  SEC                                       ; $02E944 |
  ROR A                                     ; $02E945 |
  BCC CODE_02E985                           ; $02E946 |
  LDY #$0D                                  ; $02E948 |
  SEC                                       ; $02E94A |
  ROR A                                     ; $02E94B |
  BCS CODE_02E950                           ; $02E94C |
  LDY #$15                                  ; $02E94E |

CODE_02E950:
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E950 |
  STA $1086                                 ; $02E952 |
  LDY !s_spr_facing_dir,x                   ; $02E955 |
  LDA $E8FB,y                               ; $02E958 |
  STA !s_spr_x_speed_lo,x                   ; $02E95B |
  LDA #$0006                                ; $02E95E |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02E961 |
  LDA #$0040                                ; $02E963 |
  STA !s_spr_y_speed_lo,x                   ; $02E966 |

CODE_02E969:
  LDY $1076                                 ; $02E969 |
  LDA #$FFFF                                ; $02E96C |
  STA !s_spr_wildcard_3_lo,y                ; $02E96F |
  LDA #$0002                                ; $02E972 |
  STA !s_spr_wildcard_5_lo,y                ; $02E975 |
  LDY $1078                                 ; $02E978 |
  STA !s_spr_wildcard_5_lo,y                ; $02E97B |
  LDA #$FFFF                                ; $02E97E |
  STA !s_spr_wildcard_3_lo,y                ; $02E981 |
  RTS                                       ; $02E984 |

CODE_02E985:
  SEC                                       ; $02E985 |
  ROR A                                     ; $02E986 |
  BCS CODE_02E9B4                           ; $02E987 |
  STA $1086                                 ; $02E989 |
  LDA #$04C0                                ; $02E98C |
  STA $0CE8                                 ; $02E98F |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02E992 |
  LDY #$0C                                  ; $02E994 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E996 |
  LDY $1076                                 ; $02E998 |
  LDA #$0040                                ; $02E99B |
  STA !s_spr_timer_1,y                      ; $02E99E |
  LDA #$0004                                ; $02E9A1 |
  STA !s_spr_wildcard_5_lo,y                ; $02E9A4 |
  LDY $1078                                 ; $02E9A7 |
  STA !s_spr_wildcard_5_lo,y                ; $02E9AA |
  LDA #$00C0                                ; $02E9AD |
  STA !s_spr_timer_1,y                      ; $02E9B0 |
  RTS                                       ; $02E9B3 |

CODE_02E9B4:
  STA $1086                                 ; $02E9B4 |
  LDY #$00                                  ; $02E9B7 |
  STY !s_spr_wildcard_6_hi_dp,x             ; $02E9B9 |
  LDA #$0010                                ; $02E9BB |
  STA !s_spr_timer_1,x                      ; $02E9BE |
  LDY #$07                                  ; $02E9C1 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E9C3 |
  RTS                                       ; $02E9C5 |

CODE_02E9C6:
  JSR CODE_02E9E1                           ; $02E9C6 |

CODE_02E9C9:
  JSR CODE_02EA00                           ; $02E9C9 |
  LDY !s_spr_x_player_dir,x                 ; $02E9CC |
  TYA                                       ; $02E9CF |
  CMP !s_spr_facing_dir,x                   ; $02E9D0 |
  BEQ CODE_02E9DC                           ; $02E9D3 |
  STZ $107A                                 ; $02E9D5 |
  LDY #$1A                                  ; $02E9D8 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02E9DA |

CODE_02E9DC:
  RTS                                       ; $02E9DC |

  dw $0100, $0102                           ; $02E9DD |

CODE_02E9E1:
  LDA !s_spr_timer_2,x                      ; $02E9E1 |
  BNE CODE_02E9FB                           ; $02E9E4 |
  LDA !s_spr_wildcard_3_hi_dp,x             ; $02E9E6 |
  INC A                                     ; $02E9E8 |
  AND #$FF03                                ; $02E9E9 |
  STA !s_spr_wildcard_3_hi_dp,x             ; $02E9EC |
  TAY                                       ; $02E9EE |
  LDA $E9DD,y                               ; $02E9EF |
  TAY                                       ; $02E9F2 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $02E9F3 |
  LDA #$0008                                ; $02E9F5 |
  STA !s_spr_timer_2,x                      ; $02E9F8 |

CODE_02E9FB:
  RTS                                       ; $02E9FB |

  dw $0200, $0204                           ; $02E9FC |

CODE_02EA00:
  LDA !s_spr_timer_3,x                      ; $02EA00 |
  BNE CODE_02EA2B                           ; $02EA03 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02EA05 |
  INC A                                     ; $02EA07 |
  AND #$FF03                                ; $02EA08 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02EA0B |
  TAY                                       ; $02EA0D |
  LDA $E9FC,y                               ; $02EA0E |
  TAY                                       ; $02EA11 |
  STY !s_spr_wildcard_6_hi_dp,x             ; $02EA12 |
  CPY #$04                                  ; $02EA14 |
  BNE CODE_02EA1F                           ; $02EA16 |
  LDA #$007B                                ; $02EA18 |\ play sound #$007B
  JSL push_sound_queue                      ; $02EA1B |/

CODE_02EA1F:
  LDA $10                                   ; $02EA1F |
  AND #$0006                                ; $02EA21 |
  CLC                                       ; $02EA24 |
  ADC #$0004                                ; $02EA25 |
  STA !s_spr_timer_3,x                      ; $02EA28 |

CODE_02EA2B:
  RTS                                       ; $02EA2B |

  TYX                                       ; $02EA2C |
  LDY $105A                                 ; $02EA2D |
  CPY #$02                                  ; $02EA30 |
  BPL CODE_02EA95                           ; $02EA32 |
  LDY $108A                                 ; $02EA34 |
  LDA !s_spr_wildcard_5_lo,y                ; $02EA37 |
  CMP #$0010                                ; $02EA3A |
  BNE CODE_02EA82                           ; $02EA3D |
  LDA #$0002                                ; $02EA3F |
  STA !s_player_state                       ; $02EA42 |
  LDA !s_spr_x_pixel_pos,y                  ; $02EA45 |
  STA $00                                   ; $02EA48 |
  LDA #$0053                                ; $02EA4A |
  JSL spawn_sprite_active                   ; $02EA4D |
  LDA !s_bg1_cam_x                          ; $02EA51 |
  CLC                                       ; $02EA54 |
  ADC #$0140                                ; $02EA55 |
  STA !s_spr_x_pixel_pos,y                  ; $02EA58 |
  LDA !s_bg1_cam_y                          ; $02EA5B |
  CLC                                       ; $02EA5E |
  ADC #$0040                                ; $02EA5F |
  STA !s_spr_y_pixel_pos,y                  ; $02EA62 |
  LDA #$FC00                                ; $02EA65 |
  STA !s_spr_x_speed_lo,y                   ; $02EA68 |
  LDA #$0010                                ; $02EA6B |
  STA !s_spr_x_accel,y                      ; $02EA6E |
  LDA $00                                   ; $02EA71 |
  STA !s_spr_wildcard_6_lo,y                ; $02EA73 |
  JSL $02A982                               ; $02EA76 |
  STZ $7ECC                                 ; $02EA7A |
  PLA                                       ; $02EA7D |
  JML $03A32E                               ; $02EA7E |

CODE_02EA82:
  STZ !r_autoscr_x_active                   ; $02EA82 |
  LDA #$02B0                                ; $02EA85 |
  CMP !r_bg1_cam_x                          ; $02EA88 |
  BPL CODE_02EA94                           ; $02EA8B |
  INC A                                     ; $02EA8D |
  STA $0C23                                 ; $02EA8E |
  INC !r_autoscr_x_active                   ; $02EA91 |

CODE_02EA94:
  RTS                                       ; $02EA94 |

CODE_02EA95:
  JSL $03D5E4                               ; $02EA95 |
  STZ !s_spr_dyntile_index,x                ; $02EA99 |
  JSR CODE_02EABD                           ; $02EA9C |
  STZ !s_spr_facing_dir,x                   ; $02EA9F |
  LDA #$00C0                                ; $02EAA2 |
  STA !s_spr_timer_1,x                      ; $02EAA5 |
  LDA #$0002                                ; $02EAA8 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $02EAAB |
  LDA #$62D9                                ; $02EAAD |
  STA $1086                                 ; $02EAB0 |
  LDA #$0001                                ; $02EAB3 |
  STA !s_spr_wildcard_2_lo,x                ; $02EAB6 |
  STA !s_spr_draw_priority,x                ; $02EAB9 |
  RTS                                       ; $02EABC |

CODE_02EABD:
  LDA #$0002                                ; $02EABD |
  STA $00                                   ; $02EAC0 |
  LDA #$E490                                ; $02EAC2 |
  STA $02                                   ; $02EAC5 |
  LDA #$1076                                ; $02EAC7 |
  STA $04                                   ; $02EACA |

CODE_02EACC:
  LDA #$0172                                ; $02EACC |
  JSL spawn_sprite_active                   ; $02EACF |
  LDA ($02)                                 ; $02EAD3 |
  CLC                                       ; $02EAD5 |
  ADC !s_spr_x_pixel_pos,x                  ; $02EAD6 |
  STA !s_spr_x_pixel_pos,y                  ; $02EAD9 |
  LDA !s_spr_y_pixel_pos,x                  ; $02EADC |
  STA !s_spr_y_pixel_pos,y                  ; $02EADF |
  LDA #$0000                                ; $02EAE2 |
  STA !s_spr_anim_frame,y                   ; $02EAE5 |
  STA !s_spr_x_speed_lo,y                   ; $02EAE8 |
  LDA #$FF80                                ; $02EAEB |
  STA !s_spr_y_speed_lo,y                   ; $02EAEE |
  LDA #$0001                                ; $02EAF1 |
  STA !s_spr_wildcard_5_lo,y                ; $02EAF4 |
  TYA                                       ; $02EAF7 |
  STA ($04)                                 ; $02EAF8 |
  JSR CODE_02EB0A                           ; $02EAFA |
  INC $02                                   ; $02EAFD |
  INC $02                                   ; $02EAFF |
  INC $04                                   ; $02EB01 |
  INC $04                                   ; $02EB03 |
  DEC $00                                   ; $02EB05 |
  BNE CODE_02EACC                           ; $02EB07 |
  RTS                                       ; $02EB09 |

CODE_02EB0A:
  LDA #$0002                                ; $02EB0A |
  JSL spawn_sprite_active                   ; $02EB0D |
  LDA !s_spr_x_pixel_pos,x                  ; $02EB11 |
  STA !s_spr_x_pixel_pos,y                  ; $02EB14 |
  LDA !s_spr_y_pixel_pos,x                  ; $02EB17 |
  CLC                                       ; $02EB1A |
  ADC #$FFB0                                ; $02EB1B |
  STA !s_spr_y_pixel_pos,y                  ; $02EB1E |
  LDA #$0005                                ; $02EB21 |
  STA !s_spr_wildcard_5_lo,y                ; $02EB24 |
  LDA ($04)                                 ; $02EB27 |
  STA !s_spr_wildcard_4_lo,y                ; $02EB29 |
  RTS                                       ; $02EB2C |

  TYX                                       ; $02EB2D |
  LDA !s_spr_timer_1,x                      ; $02EB2E |
  BNE CODE_02EB4B                           ; $02EB31 |
  LDA #$FFC0                                ; $02EB33 |
  STA !s_spr_y_speed_lo,x                   ; $02EB36 |
  LDA $1074                                 ; $02EB39 |
  CMP !s_spr_y_pixel_pos,x                  ; $02EB3C |
  BMI CODE_02EB4B                           ; $02EB3F |
  STA !s_spr_y_pixel_pos,x                  ; $02EB41 |
  STZ !s_spr_y_speed_lo,x                   ; $02EB44 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02EB47 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EB49 |

CODE_02EB4B:
  RTS                                       ; $02EB4B |

  dw $FFFC, $0004                           ; $02EB4C |

  dw $FFFF, $0001                           ; $02EB50 |

  TYX                                       ; $02EB54 |
  LDA !s_spr_timer_1,x                      ; $02EB55 |
  BEQ CODE_02EB5D                           ; $02EB58 |
  JMP CODE_02EC28                           ; $02EB5A |

CODE_02EB5D:
  LDA !s_spr_timer_3,x                      ; $02EB5D |
  BNE CODE_02EB73                           ; $02EB60 |
  SEP #$20                                  ; $02EB62 |
  LDA !s_spr_wildcard_6_hi_dp,x             ; $02EB64 |
  LSR A                                     ; $02EB66 |
  AND #$FE                                  ; $02EB67 |
  STA !s_spr_wildcard_6_hi_dp,x             ; $02EB69 |
  REP #$20                                  ; $02EB6B |
  LDA #$0004                                ; $02EB6D |
  STA !s_spr_timer_3,x                      ; $02EB70 |

CODE_02EB73:
  LDY #$04                                  ; $02EB73 |
  STY $00                                   ; $02EB75 |
  LDY #$00                                  ; $02EB77 |
  LDA $1070                                 ; $02EB79 |
  SEC                                       ; $02EB7C |
  SBC #$FFBC                                ; $02EB7D |
  CMP #$0008                                ; $02EB80 |
  BCS CODE_02EB8C                           ; $02EB83 |
  DEC $00                                   ; $02EB85 |
  LDA #$FFC0                                ; $02EB87 |
  BRA CODE_02EB97                           ; $02EB8A |

CODE_02EB8C:
  BPL CODE_02EB90                           ; $02EB8C |
  INY                                       ; $02EB8E |
  INY                                       ; $02EB8F |

CODE_02EB90:
  LDA $1070                                 ; $02EB90 |
  CLC                                       ; $02EB93 |
  ADC $EB4C,y                               ; $02EB94 |

CODE_02EB97:
  STA $1070                                 ; $02EB97 |
  LDY #$00                                  ; $02EB9A |
  LDA $1068                                 ; $02EB9C |
  SEC                                       ; $02EB9F |
  SBC #$0023                                ; $02EBA0 |
  CMP #$0002                                ; $02EBA3 |
  BCS CODE_02EBAF                           ; $02EBA6 |
  DEC $00                                   ; $02EBA8 |
  LDA #$0024                                ; $02EBAA |
  BRA CODE_02EBBA                           ; $02EBAD |

CODE_02EBAF:
  BPL CODE_02EBB3                           ; $02EBAF |
  INY                                       ; $02EBB1 |
  INY                                       ; $02EBB2 |

CODE_02EBB3:
  LDA $1068                                 ; $02EBB3 |
  CLC                                       ; $02EBB6 |
  ADC $EB50,y                               ; $02EBB7 |

CODE_02EBBA:
  STA $1068                                 ; $02EBBA |
  LDY #$00                                  ; $02EBBD |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02EBBF |
  CLC                                       ; $02EBC2 |
  ADC #$0004                                ; $02EBC3 |
  CMP #$0008                                ; $02EBC6 |
  BCS CODE_02EBD2                           ; $02EBC9 |
  DEC $00                                   ; $02EBCB |
  LDA #$0000                                ; $02EBCD |
  BRA CODE_02EBE3                           ; $02EBD0 |

CODE_02EBD2:
  CMP #$00FC                                ; $02EBD2 |
  BMI CODE_02EBD9                           ; $02EBD5 |
  INY                                       ; $02EBD7 |
  INY                                       ; $02EBD8 |

CODE_02EBD9:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02EBD9 |
  CLC                                       ; $02EBDC |
  ADC $EB4C,y                               ; $02EBDD |
  AND #$01FE                                ; $02EBE0 |

CODE_02EBE3:
  STA !s_spr_gsu_morph_2_lo,x               ; $02EBE3 |
  LDA #$FFC0                                ; $02EBE6 |
  STA !s_spr_y_speed_lo,x                   ; $02EBE9 |
  LDA $1074                                 ; $02EBEC |
  CMP !s_spr_y_pixel_pos,x                  ; $02EBEF |
  BMI CODE_02EBFC                           ; $02EBF2 |
  STA !s_spr_y_pixel_pos,x                  ; $02EBF4 |
  STZ !s_spr_y_speed_lo,x                   ; $02EBF7 |
  DEC $00                                   ; $02EBFA |

CODE_02EBFC:
  LDY $00                                   ; $02EBFC |
  BNE CODE_02EC28                           ; $02EBFE |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EC00 |
  CPY #$11                                  ; $02EC02 |
  BEQ CODE_02EC25                           ; $02EC04 |
  CPY #$03                                  ; $02EC06 |
  BEQ CODE_02EC1F                           ; $02EC08 |
  CPY #$06                                  ; $02EC0A |
  BNE CODE_02EC14                           ; $02EC0C |
  STZ !r_autoscr_x_active                   ; $02EC0E |
  STZ !s_player_state                       ; $02EC11 |

CODE_02EC14:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02EC14 |
  LDA #$0003                                ; $02EC16 |
  STA !s_spr_wildcard_2_lo,x                ; $02EC19 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02EC1C |
  RTS                                       ; $02EC1E |

CODE_02EC1F:
  LDA #$0040                                ; $02EC1F |
  STA !s_spr_timer_1,x                      ; $02EC22 |

CODE_02EC25:
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EC25 |
  RTS                                       ; $02EC27 |

CODE_02EC28:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EC28 |
  CPY #$19                                  ; $02EC2A |
  BNE CODE_02EC40                           ; $02EC2C |
  LDA !s_spr_x_speed_lo,x                   ; $02EC2E |
  CLC                                       ; $02EC31 |
  ADC #$0040                                ; $02EC32 |
  CMP #$0080                                ; $02EC35 |
  BCS CODE_02EC40                           ; $02EC38 |
  STZ !s_spr_x_speed_lo,x                   ; $02EC3A |
  STZ !s_spr_x_accel,x                      ; $02EC3D |

CODE_02EC40:
  RTS                                       ; $02EC40 |

  LDA #$01A0                                ; $02EC41 |
  BRA CODE_02EC49                           ; $02EC44 |
  LDA #$01C0                                ; $02EC46 |

CODE_02EC49:
  STA $02                                   ; $02EC49 |
  TYX                                       ; $02EC4B |
  LDA !s_spr_timer_1,x                      ; $02EC4C |
  BNE CODE_02ECAA                           ; $02EC4F |
  LDY #$02                                  ; $02EC51 |
  STY $00                                   ; $02EC53 |
  LDA $1070                                 ; $02EC55 |
  CLC                                       ; $02EC58 |
  ADC #$0008                                ; $02EC59 |
  CMP #$FFE0                                ; $02EC5C |
  BMI CODE_02EC66                           ; $02EC5F |
  DEC $00                                   ; $02EC61 |
  LDA #$FFE0                                ; $02EC63 |

CODE_02EC66:
  STA $1070                                 ; $02EC66 |
  LDA $1068                                 ; $02EC69 |
  CLC                                       ; $02EC6C |
  ADC #$0026                                ; $02EC6D |
  INC A                                     ; $02EC70 |
  LSR A                                     ; $02EC71 |
  STA $1068                                 ; $02EC72 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02EC75 |
  SEC                                       ; $02EC78 |
  SBC #$0010                                ; $02EC79 |
  AND #$01FE                                ; $02EC7C |
  CMP $02                                   ; $02EC7F |
  BPL CODE_02EC87                           ; $02EC81 |
  DEC $00                                   ; $02EC83 |
  LDA $02                                   ; $02EC85 |

CODE_02EC87:
  STA !s_spr_gsu_morph_2_lo,x               ; $02EC87 |
  LDY $00                                   ; $02EC8A |
  BNE CODE_02ECAA                           ; $02EC8C |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02EC8E |
  LDA #$0004                                ; $02EC90 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EC93 |
  CPY #$20                                  ; $02EC95 |
  BNE CODE_02EC9E                           ; $02EC97 |
  LDA #$0001                                ; $02EC99 |
  BRA CODE_02ECA5                           ; $02EC9C |

CODE_02EC9E:
  CPY #$04                                  ; $02EC9E |
  BNE CODE_02ECA5                           ; $02ECA0 |
  LDA #$000C                                ; $02ECA2 |

CODE_02ECA5:
  STA !s_spr_wildcard_2_lo,x                ; $02ECA5 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02ECA8 |

CODE_02ECAA:
  RTS                                       ; $02ECAA |

  TYX                                       ; $02ECAB |
  LDA !s_spr_wildcard_1_lo,x                ; $02ECAC |
  SEC                                       ; $02ECAF |
  SBC #$0010                                ; $02ECB0 |
  CMP #$0180                                ; $02ECB3 |
  BPL CODE_02ECC3                           ; $02ECB6 |
  LDA #$0008                                ; $02ECB8 |
  STA !s_spr_timer_1,x                      ; $02ECBB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02ECBE |
  LDA #$017F                                ; $02ECC0 |

CODE_02ECC3:
  STA !s_spr_wildcard_1_lo,x                ; $02ECC3 |

CODE_02ECC6:
  RTS                                       ; $02ECC6 |

  dw $FF38, $FE78, $FDC8                    ; $02ECC7 |

  dw $FC14, $FC4C, $FCAC                    ; $02ECCD |

  TYX                                       ; $02ECD3 |
  LDA !s_spr_timer_1,x                      ; $02ECD4 |
  BNE CODE_02ECC6                           ; $02ECD7 |
  LDA !s_spr_wildcard_1_lo,x                ; $02ECD9 |
  CLC                                       ; $02ECDC |
  ADC #$0010                                ; $02ECDD |
  CMP #$01FF                                ; $02ECE0 |
  BMI CODE_02ED5B                           ; $02ECE3 |
  LDA !s_spr_x_pixel_pos,x                  ; $02ECE5 |
  CLC                                       ; $02ECE8 |
  ADC $0C                                   ; $02ECE9 |
  STA $00                                   ; $02ECEB |
  LDA !s_spr_y_pixel_pos,x                  ; $02ECED |
  CLC                                       ; $02ECF0 |
  ADC $0E                                   ; $02ECF1 |
  STA $02                                   ; $02ECF3 |
  LDA #$0083                                ; $02ECF5 |\ play sound #$0083
  JSL push_sound_queue                      ; $02ECF8 |/
  LDA #$0006                                ; $02ECFC |
  STA $0A                                   ; $02ECFF |

CODE_02ED01:
  LDY $0A                                   ; $02ED01 |
  LDA $ECCB,y                               ; $02ED03 |
  STA $08                                   ; $02ED06 |
  LDA $ECC5,y                               ; $02ED08 |
  LDY !s_spr_facing_dir,x                   ; $02ED0B |
  BEQ CODE_02ED14                           ; $02ED0E |
  EOR #$FFFF                                ; $02ED10 |
  INC A                                     ; $02ED13 |

CODE_02ED14:
  STA $06                                   ; $02ED14 |
  LDA #$0165                                ; $02ED16 |
  JSL spawn_sprite_active                   ; $02ED19 |
  BCC CODE_02ED50                           ; $02ED1D |
  LDA $00                                   ; $02ED1F |
  STA !s_spr_x_pixel_pos,y                  ; $02ED21 |
  LDA $02                                   ; $02ED24 |
  STA !s_spr_y_pixel_pos,y                  ; $02ED26 |
  LDA $06                                   ; $02ED29 |
  STA !s_spr_x_speed_lo,y                   ; $02ED2B |
  LDA $08                                   ; $02ED2E |
  STA !s_spr_y_speed_lo,y                   ; $02ED30 |
  LDA #$0001                                ; $02ED33 |
  STA !s_spr_gsu_morph_1_lo,y               ; $02ED36 |
  ASL A                                     ; $02ED39 |
  ASL A                                     ; $02ED3A |
  STA !s_spr_wildcard_3_lo,y                ; $02ED3B |
  STA !s_spr_x_accel,y                      ; $02ED3E |
  LDA !s_spr_oam_1,y                        ; $02ED41 |
  AND #$FFF3                                ; $02ED44 |
  STA !s_spr_oam_1,y                        ; $02ED47 |
  DEC $0A                                   ; $02ED4A |
  DEC $0A                                   ; $02ED4C |
  BNE CODE_02ED01                           ; $02ED4E |

CODE_02ED50:
  LDA #$0010                                ; $02ED50 |
  STA !s_spr_timer_1,x                      ; $02ED53 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02ED56 |
  LDA #$01FF                                ; $02ED58 |

CODE_02ED5B:
  STA !s_spr_wildcard_1_lo,x                ; $02ED5B |
  LDY #$00                                  ; $02ED5E |
  CMP #$01B0                                ; $02ED60 |
  BMI CODE_02ED6E                           ; $02ED63 |
  LDY #$02                                  ; $02ED65 |
  CMP #$01E0                                ; $02ED67 |
  BMI CODE_02ED6E                           ; $02ED6A |
  LDY #$04                                  ; $02ED6C |

CODE_02ED6E:
  STY !s_spr_wildcard_6_hi_dp,x             ; $02ED6E |
  RTS                                       ; $02ED70 |

  TYX                                       ; $02ED71 |
  LDA !s_spr_timer_1,x                      ; $02ED72 |
  BNE CODE_02ED83                           ; $02ED75 |
  LDY #$00                                  ; $02ED77 |
  STY !s_spr_wildcard_6_hi_dp,x             ; $02ED79 |
  LDA #$0100                                ; $02ED7B |
  STA !s_spr_timer_1,x                      ; $02ED7E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02ED81 |

CODE_02ED83:
  RTS                                       ; $02ED83 |

  TYX                                       ; $02ED84 |
  LDY $1076                                 ; $02ED85 |
  LDA !s_spr_wildcard_5_lo,y                ; $02ED88 |
  LDY $1078                                 ; $02ED8B |
  ORA !s_spr_wildcard_5_lo,y                ; $02ED8E |
  BNE CODE_02ED9C                           ; $02ED91 |
  LDA #$0003                                ; $02ED93 |
  STA !s_spr_wildcard_2_lo,x                ; $02ED96 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02ED99 |
  RTS                                       ; $02ED9B |

CODE_02ED9C:
  JSR CODE_02E9E1                           ; $02ED9C |
  JSR CODE_02EA00                           ; $02ED9F |
  LDY !s_spr_x_player_dir,x                 ; $02EDA2 |
  TYA                                       ; $02EDA5 |
  CMP !s_spr_facing_dir,x                   ; $02EDA6 |
  BEQ CODE_02EDB4                           ; $02EDA9 |
  LDY #$0C                                  ; $02EDAB |
  STY $107A                                 ; $02EDAD |
  LDY #$1A                                  ; $02EDB0 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02EDB2 |

CODE_02EDB4:
  RTS                                       ; $02EDB4 |

  TYX                                       ; $02EDB5 |
  LDA !s_spr_x_speed_lo,x                   ; $02EDB6 |
  CLC                                       ; $02EDB9 |
  ADC #$0018                                ; $02EDBA |
  CMP #$0030                                ; $02EDBD |
  BCS CODE_02EDD1                           ; $02EDC0 |
  STZ !s_spr_x_accel,x                      ; $02EDC2 |
  STZ !s_spr_x_speed_lo,x                   ; $02EDC5 |
  LDA #$0040                                ; $02EDC8 |
  STA !s_spr_timer_1,x                      ; $02EDCB |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EDCE |
  RTS                                       ; $02EDD0 |

CODE_02EDD1:
  JSR CODE_02EFD3                           ; $02EDD1 |
  RTS                                       ; $02EDD4 |

  dw $0100, $FF00                           ; $02EDD5 |

  dw $0200, $FE00                           ; $02EDD9 |

  dw $03B0, $02E0                           ; $02EDDD |

  TYX                                       ; $02EDE1 |
  LDA !s_spr_timer_1,x                      ; $02EDE2 |
  BNE CODE_02EE23                           ; $02EDE5 |
  LDY !s_spr_facing_dir,x                   ; $02EDE7 |
  TYA                                       ; $02EDEA |
  DEC A                                     ; $02EDEB |
  EOR !s_spr_x_player_delta,x               ; $02EDEC |
  BMI CODE_02EDF7                           ; $02EDEF |
  TYA                                       ; $02EDF1 |
  CLC                                       ; $02EDF2 |
  ADC #$0004                                ; $02EDF3 |
  TAY                                       ; $02EDF6 |

CODE_02EDF7:
  LDA $EDD5,y                               ; $02EDF7 |
  STA !s_spr_x_accel_ceiling,x              ; $02EDFA |
  LDA #$0008                                ; $02EDFD |
  STA !s_spr_x_accel,x                      ; $02EE00 |
  LDY !s_spr_facing_dir,x                   ; $02EE03 |
  LDA !s_spr_x_pixel_pos,x                  ; $02EE06 |
  SEC                                       ; $02EE09 |
  SBC $EDDD,y                               ; $02EE0A |
  STA $02                                   ; $02EE0D |
  TYA                                       ; $02EE0F |
  DEC A                                     ; $02EE10 |
  EOR $02                                   ; $02EE11 |
  BPL CODE_02EE23                           ; $02EE13 |
  LDA $EDDD,y                               ; $02EE15 |
  STA !s_spr_x_pixel_pos,x                  ; $02EE18 |
  STZ !s_spr_x_speed_lo,x                   ; $02EE1B |
  STZ !s_spr_x_accel,x                      ; $02EE1E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EE21 |

CODE_02EE23:
  RTS                                       ; $02EE23 |

  dw $0009, $020A, $040B, $020A             ; $02EE24 |

  TYX                                       ; $02EE2C |
  LDA !s_spr_timer_2,x                      ; $02EE2D |
  BNE CODE_02EE75                           ; $02EE30 |
  LDA #$0004                                ; $02EE32 |
  STA !s_spr_timer_2,x                      ; $02EE35 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02EE38 |
  INC A                                     ; $02EE3A |
  INC A                                     ; $02EE3B |
  AND #$0006                                ; $02EE3C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02EE3F |
  TAY                                       ; $02EE41 |
  LDA $EE24,y                               ; $02EE42 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02EE45 |
  CPY #$04                                  ; $02EE47 |
  BNE CODE_02EE75                           ; $02EE49 |
  LDA #$007B                                ; $02EE4B |\ play sound #$007B
  JSL push_sound_queue                      ; $02EE4E |/
  DEC !s_spr_wildcard_2_lo,x                ; $02EE52 |
  BNE CODE_02EE75                           ; $02EE55 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EE57 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EE59 |
  CPY #$14                                  ; $02EE5B |
  BEQ CODE_02EE75                           ; $02EE5D |
  LDA #$0080                                ; $02EE5F |
  CPY #$06                                  ; $02EE62 |
  BEQ CODE_02EE72                           ; $02EE64 |
  CPY #$22                                  ; $02EE66 |
  BNE CODE_02EE6F                           ; $02EE68 |
  LDA #$001B                                ; $02EE6A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02EE6D |

CODE_02EE6F:
  LDA #$0040                                ; $02EE6F |

CODE_02EE72:
  STA !s_spr_timer_1,x                      ; $02EE72 |

CODE_02EE75:
  RTS                                       ; $02EE75 |

  dw $03B0, $02E0                           ; $02EE76 |

  TYX                                       ; $02EE7A |
  LDY #$05                                  ; $02EE7B |
  STY $00                                   ; $02EE7D |
  LDA $1070                                 ; $02EE7F |
  SEC                                       ; $02EE82 |
  SBC #$0004                                ; $02EE83 |
  CMP #$FF81                                ; $02EE86 |
  BPL CODE_02EE90                           ; $02EE89 |
  DEC $00                                   ; $02EE8B |
  LDA #$FF80                                ; $02EE8D |

CODE_02EE90:
  STA $1070                                 ; $02EE90 |
  LDA $1068                                 ; $02EE93 |
  DEC A                                     ; $02EE96 |
  CMP #$001D                                ; $02EE97 |
  BPL CODE_02EEA1                           ; $02EE9A |
  DEC $00                                   ; $02EE9C |
  LDA #$001C                                ; $02EE9E |

CODE_02EEA1:
  STA $1068                                 ; $02EEA1 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02EEA4 |
  CLC                                       ; $02EEA7 |
  ADC #$0004                                ; $02EEA8 |
  CMP #$0070                                ; $02EEAB |
  BMI CODE_02EEB5                           ; $02EEAE |
  DEC $00                                   ; $02EEB0 |
  LDA #$0070                                ; $02EEB2 |

CODE_02EEB5:
  STA !s_spr_gsu_morph_2_lo,x               ; $02EEB5 |
  LDY !s_spr_facing_dir,x                   ; $02EEB8 |
  LDA !s_spr_x_speed_lo,x                   ; $02EEBB |
  BEQ CODE_02EECF                           ; $02EEBE |
  LDA !s_spr_x_pixel_pos,x                  ; $02EEC0 |
  SEC                                       ; $02EEC3 |
  SBC $EE76,y                               ; $02EEC4 |
  STA $02                                   ; $02EEC7 |
  TYA                                       ; $02EEC9 |
  DEC A                                     ; $02EECA |
  EOR $02                                   ; $02EECB |
  BPL CODE_02EEDA                           ; $02EECD |

CODE_02EECF:
  DEC $00                                   ; $02EECF |
  LDA $EE76,y                               ; $02EED1 |
  STA !s_spr_x_pixel_pos,x                  ; $02EED4 |
  STZ !s_spr_x_speed_lo,x                   ; $02EED7 |

CODE_02EEDA:
  LDA $1074                                 ; $02EEDA |
  CLC                                       ; $02EEDD |
  ADC #$0010                                ; $02EEDE |
  CMP !s_spr_y_pixel_pos,x                  ; $02EEE1 |
  BPL CODE_02EEEF                           ; $02EEE4 |
  INC A                                     ; $02EEE6 |
  STA !s_spr_y_pixel_pos,x                  ; $02EEE7 |
  STZ !s_spr_y_speed_lo,x                   ; $02EEEA |
  DEC $00                                   ; $02EEED |

CODE_02EEEF:
  LDY $00                                   ; $02EEEF |
  BNE CODE_02EF06                           ; $02EEF1 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EEF3 |
  CPY #$1F                                  ; $02EEF5 |
  BEQ CODE_02EF07                           ; $02EEF7 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EEF9 |

CODE_02EEFB:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02EEFB |
  STZ !s_spr_wildcard_2_lo,x                ; $02EEFD |
  LDA #$0020                                ; $02EF00 |
  STA !s_spr_timer_1,x                      ; $02EF03 |

CODE_02EF06:
  RTS                                       ; $02EF06 |

CODE_02EF07:
  LDA !s_spr_oam_yxppccct,x                 ; $02EF07 |
  AND #$FFF0                                ; $02EF0A |
  ORA #$000C                                ; $02EF0D |
  STA !s_spr_oam_yxppccct,x                 ; $02EF10 |
  STZ !s_spr_timer_4,x                      ; $02EF13 |
  LDY $1076                                 ; $02EF16 |
  LDA !s_spr_wildcard_5_lo,y                ; $02EF19 |
  LDY $1078                                 ; $02EF1C |
  ORA !s_spr_wildcard_5_lo,y                ; $02EF1F |
  BNE CODE_02EF06                           ; $02EF22 |
  LDY #$16                                  ; $02EF24 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02EF26 |
  JSR CODE_02EEFB                           ; $02EF28 |
  JMP CODE_02E969                           ; $02EF2B |

  dw $FD00, $0300                           ; $02EF2E |

  dw $0706, $0708                           ; $02EF32 |

  dw $02E8, $03A4, $EF42, $EF52             ; $02EF36 |
  dw $EF62, $EF72, $0010, $0040             ; $02EF3E |
  dw $0080, $00B0, $FFF0, $FFE0             ; $02EF46 |
  dw $FFE8, $FFD0, $0010, $0040             ; $02EF4E |
  dw $0080, $00B0, $FFF0, $FFE0             ; $02EF56 |
  dw $FFE8, $FFD0, $0010, $0040             ; $02EF5E |
  dw $0080, $00B0, $FFF0, $FFE0             ; $02EF66 |
  dw $FFE8, $FFD0, $0010, $0040             ; $02EF6E |
  dw $0080, $00B0, $FFF0, $FFE0             ; $02EF76 |
  dw $FFE8, $FFD0                           ; $02EF7E |

  dw $0100, $FF00                           ; $02EF82 |

  TYX                                       ; $02EF86 |
  LDA !s_spr_timer_1,x                      ; $02EF87 |
  BNE CODE_02EFB5                           ; $02EF8A |
  LDY !s_spr_facing_dir,x                   ; $02EF8C |
  LDA $EF2E,y                               ; $02EF8F |
  STA !s_spr_x_accel_ceiling,x              ; $02EF92 |
  LDA #$0010                                ; $02EF95 |
  STA !s_spr_x_accel,x                      ; $02EF98 |
  LDA !s_spr_timer_2,x                      ; $02EF9B |
  BNE CODE_02EFB5                           ; $02EF9E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02EFA0 |
  INC A                                     ; $02EFA2 |
  AND #$0003                                ; $02EFA3 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02EFA6 |
  TAY                                       ; $02EFA8 |
  LDA $EF32,y                               ; $02EFA9 |
  TAY                                       ; $02EFAC |
  STY !s_spr_wildcard_6_lo_dp,x             ; $02EFAD |
  LDA #$0008                                ; $02EFAF |
  STA !s_spr_timer_2,x                      ; $02EFB2 |

CODE_02EFB5:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02EFB5 |
  CPY #$16                                  ; $02EFB7 |
  BEQ CODE_02EFD3                           ; $02EFB9 |
  LDA !s_spr_x_pixel_pos,x                  ; $02EFBB |
  SEC                                       ; $02EFBE |
  SBC #$0320                                ; $02EFBF |
  CMP #$0060                                ; $02EFC2 |
  BCS CODE_02EFD3                           ; $02EFC5 |
  STZ !s_spr_x_accel_ceiling,x              ; $02EFC7 |
  LDA #$0018                                ; $02EFCA |
  STA !s_spr_x_accel,x                      ; $02EFCD |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02EFD0 |
  RTS                                       ; $02EFD2 |

CODE_02EFD3:
  LDY !s_spr_facing_dir,x                   ; $02EFD3 |
  LDA !s_spr_x_pixel_pos,x                  ; $02EFD6 |
  SEC                                       ; $02EFD9 |
  SBC $EF36,y                               ; $02EFDA |
  STA $02                                   ; $02EFDD |
  TYA                                       ; $02EFDF |
  DEC A                                     ; $02EFE0 |
  EOR $02                                   ; $02EFE1 |
  BMI CODE_02F014                           ; $02EFE3 |
  LDA $EF36,y                               ; $02EFE5 |
  STA !s_spr_x_pixel_pos,x                  ; $02EFE8 |
  LDY #$06                                  ; $02EFEB |
  STY !s_spr_wildcard_6_lo_dp,x             ; $02EFED |
  LDA !s_spr_x_speed_lo,x                   ; $02EFEF |
  CLC                                       ; $02EFF2 |
  ADC #$0100                                ; $02EFF3 |
  CMP #$0200                                ; $02EFF6 |
  BCS CODE_02F015                           ; $02EFF9 |
  LDA #$0040                                ; $02EFFB |
  STA !s_spr_timer_1,x                      ; $02EFFE |
  LDY !s_spr_facing_dir,x                   ; $02F001 |
  LDA $EF82,y                               ; $02F004 |
  STA !s_spr_x_speed_lo,x                   ; $02F007 |
  LDA #$0008                                ; $02F00A |
  STA !s_spr_x_accel,x                      ; $02F00D |
  LDY #$19                                  ; $02F010 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F012 |

CODE_02F014:
  RTS                                       ; $02F014 |

CODE_02F015:
  STZ !s_spr_x_accel,x                      ; $02F015 |
  STZ !s_spr_x_speed_lo,x                   ; $02F018 |
  LDA #$0047                                ; $02F01B |\ play sound #$0047
  JSL push_sound_queue                      ; $02F01E |/
  LDA #$0020                                ; $02F022 |
  STA !s_cam_y_large_shaking_timer          ; $02F025 |
  LDY #$17                                  ; $02F028 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F02A |
  RTS                                       ; $02F02C |

  TYX                                       ; $02F02D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02F02E |
  SEC                                       ; $02F031 |
  SBC #$0060                                ; $02F032 |
  CMP #$0140                                ; $02F035 |
  BPL CODE_02F03F                           ; $02F038 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F03A |
  LDA #$0140                                ; $02F03C |

CODE_02F03F:
  STA !s_spr_gsu_morph_1_lo,x               ; $02F03F |
  LSR A                                     ; $02F042 |
  STA !gsu_r6                               ; $02F043 |
  LDA #$0018                                ; $02F046 |
  STA !gsu_r0                               ; $02F049 |
  LDX #$0B                                  ; $02F04C |
  LDA #$86B6                                ; $02F04E |
  JSL r_gsu_init_1                          ; $02F051 | GSU init
  LDX $12                                   ; $02F055 |
  LDA #$0018                                ; $02F057 |
  SEC                                       ; $02F05A |
  SBC !gsu_r0                               ; $02F05B |
  LDY !s_spr_facing_dir,x                   ; $02F05E |
  BNE CODE_02F067                           ; $02F061 |
  EOR #$FFFF                                ; $02F063 |
  INC A                                     ; $02F066 |

CODE_02F067:
  ASL A                                     ; $02F067 |
  CLC                                       ; $02F068 |
  ADC $EF36,y                               ; $02F069 |
  STA !s_spr_x_pixel_pos,x                  ; $02F06C |
  RTS                                       ; $02F06F |

  dw $0200, $FE00                           ; $02F070 |

  TYX                                       ; $02F074 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02F075 |
  CLC                                       ; $02F078 |
  ADC #$0040                                ; $02F079 |
  CMP #$01FF                                ; $02F07C |
  BMI CODE_02F03F                           ; $02F07F |
  LDY !s_spr_facing_dir,x                   ; $02F081 |
  LDA $F070,y                               ; $02F084 |
  STA !s_spr_x_speed_lo,x                   ; $02F087 |
  LDA #$0010                                ; $02F08A |
  STA !s_spr_x_accel,x                      ; $02F08D |
  ASL A                                     ; $02F090 |
  ASL A                                     ; $02F091 |
  STA !s_spr_timer_1,x                      ; $02F092 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F095 |
  LDA #$01FF                                ; $02F097 |
  BRA CODE_02F03F                           ; $02F09A |
  TYX                                       ; $02F09C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02F09D |
  BNE CODE_02F0AF                           ; $02F09F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02F0A1 |
  LDA #$0003                                ; $02F0A3 |
  STA !s_spr_timer_2,x                      ; $02F0A6 |
  INC A                                     ; $02F0A9 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02F0AA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F0AC |
  RTS                                       ; $02F0AE |

CODE_02F0AF:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02F0AF |
  BEQ CODE_02F0C6                           ; $02F0B1 |
  LDA !s_spr_timer_2,x                      ; $02F0B3 |
  BNE CODE_02F0C6                           ; $02F0B6 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02F0B8 |
  INC A                                     ; $02F0BA |
  AND #$FF03                                ; $02F0BB |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02F0BE |
  LDA #$0004                                ; $02F0C0 |
  STA !s_spr_timer_2,x                      ; $02F0C3 |

CODE_02F0C6:
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02F0C6 |
  BEQ CODE_02F0EF                           ; $02F0C8 |
  LDA !s_spr_timer_3,x                      ; $02F0CA |
  BNE CODE_02F0EF                           ; $02F0CD |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02F0CF |
  INC A                                     ; $02F0D1 |
  AND #$0003                                ; $02F0D2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F0D5 |
  TAY                                       ; $02F0D7 |
  LDA $E9FC,y                               ; $02F0D8 |
  TAY                                       ; $02F0DB |
  STY !s_spr_wildcard_6_hi_dp,x             ; $02F0DC |
  CPY #$04                                  ; $02F0DE |
  BNE CODE_02F0E9                           ; $02F0E0 |
  LDA #$007B                                ; $02F0E2 |\ play sound #$007B
  JSL push_sound_queue                      ; $02F0E5 |/

CODE_02F0E9:
  LDA #$0004                                ; $02F0E9 |
  STA !s_spr_timer_3,x                      ; $02F0EC |

CODE_02F0EF:
  RTS                                       ; $02F0EF |

  dw $0604, $0605, $0605, $0604             ; $02F0F0 |

  dw $0003, $FFB0, $FFA8, $FFA8             ; $02F0F8 |

  dw $FFB0, $FFC0, $0024, $0020             ; $02F100 |
  dw $0020, $0024, $0024                    ; $02F108 |

  TYX                                       ; $02F10E |
  LDA !s_spr_timer_2,x                      ; $02F10F |
  BNE CODE_02F155                           ; $02F112 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02F114 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02F116 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02F118 |
  CPY #$0C                                  ; $02F11A |
  BMI CODE_02F131                           ; $02F11C |
  LDA $106E                                 ; $02F11E |
  EOR #$FFFF                                ; $02F121 |
  STA $106E                                 ; $02F124 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02F127 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02F129 |
  LDY $107A                                 ; $02F12B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F12E |
  RTS                                       ; $02F130 |

CODE_02F131:
  LDA $F0EE,y                               ; $02F131 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02F134 |
  LDA $F0F8,y                               ; $02F136 |
  STA $1070                                 ; $02F139 |
  LDA $F102,y                               ; $02F13C |
  STA $1068                                 ; $02F13F |
  CPY #$06                                  ; $02F142 |
  BNE CODE_02F14F                           ; $02F144 |
  LDA !s_spr_facing_dir,x                   ; $02F146 |
  EOR #$0002                                ; $02F149 |
  STA !s_spr_facing_dir,x                   ; $02F14C |

CODE_02F14F:
  LDA #$0004                                ; $02F14F |
  STA !s_spr_timer_2,x                      ; $02F152 |

CODE_02F155:
  RTS                                       ; $02F155 |

  TYX                                       ; $02F156 |
  LDA !s_spr_timer_1,x                      ; $02F157 |
  BNE CODE_02F155                           ; $02F15A |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $02F15C |
  TYA                                       ; $02F15E |
  LSR A                                     ; $02F15F |
  AND #$00FE                                ; $02F160 |
  STA $00                                   ; $02F163 |
  LDA !s_spr_wildcard_6_hi_dp,x             ; $02F165 |
  AND #$FF00                                ; $02F167 |
  ORA $00                                   ; $02F16A |
  STA !s_spr_wildcard_6_hi_dp,x             ; $02F16C |
  LDY #$02                                  ; $02F16E |
  STY $00                                   ; $02F170 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02F172 |
  CMP #$0010                                ; $02F175 |
  BPL CODE_02F17E                           ; $02F178 |
  DEC $00                                   ; $02F17A |
  BRA CODE_02F188                           ; $02F17C |

CODE_02F17E:
  CLC                                       ; $02F17E |
  ADC #$0004                                ; $02F17F |
  AND #$01FE                                ; $02F182 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02F185 |

CODE_02F188:
  LDY #$00                                  ; $02F188 |
  LDA $1070                                 ; $02F18A |
  SEC                                       ; $02F18D |
  SBC #$FFBC                                ; $02F18E |
  CMP #$0008                                ; $02F191 |
  BCS CODE_02F19D                           ; $02F194 |
  DEC $00                                   ; $02F196 |
  LDA #$FFC0                                ; $02F198 |
  BRA CODE_02F1A8                           ; $02F19B |

CODE_02F19D:
  BPL CODE_02F1A1                           ; $02F19D |
  INY                                       ; $02F19F |
  INY                                       ; $02F1A0 |

CODE_02F1A1:
  LDA $1070                                 ; $02F1A1 |
  CLC                                       ; $02F1A4 |
  ADC $EB4C,y                               ; $02F1A5 |

CODE_02F1A8:
  STA $1070                                 ; $02F1A8 |
  LDY $00                                   ; $02F1AB |
  BNE CODE_02F1DE                           ; $02F1AD |
  LDX #$00                                  ; $02F1AF |
  LDY $1076                                 ; $02F1B1 |

CODE_02F1B4:
  LDA $107C,x                               ; $02F1B4 |
  STA !s_spr_wildcard_5_lo,y                ; $02F1B7 |
  INX                                       ; $02F1BA |
  INX                                       ; $02F1BB |
  CPY $1076                                 ; $02F1BC |
  BNE CODE_02F1C6                           ; $02F1BF |
  LDY $1078                                 ; $02F1C1 |
  BRA CODE_02F1B4                           ; $02F1C4 |

CODE_02F1C6:
  LDX $12                                   ; $02F1C6 |
  LDY !s_spr_facing_dir,x                   ; $02F1C8 |
  LDA $E8FB,y                               ; $02F1CB |
  STA !s_spr_x_speed_lo,x                   ; $02F1CE |
  LDA #$0006                                ; $02F1D1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02F1D4 |
  LDA #$0040                                ; $02F1D6 |
  STA !s_spr_y_speed_lo,x                   ; $02F1D9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F1DC |

CODE_02F1DE:
  RTS                                       ; $02F1DE |

  TYX                                       ; $02F1DF |
  LDA !s_spr_timer_1,x                      ; $02F1E0 |
  BNE CODE_02F204                           ; $02F1E3 |
  LDA $0C                                   ; $02F1E5 |
  CLC                                       ; $02F1E7 |
  ADC !s_spr_x_pixel_pos,x                  ; $02F1E8 |
  STA $00                                   ; $02F1EB |
  LDA $0E                                   ; $02F1ED |
  CLC                                       ; $02F1EF |
  ADC !s_spr_y_pixel_pos,x                  ; $02F1F0 |
  STA $02                                   ; $02F1F3 |
  LDA #$0340                                ; $02F1F5 |
  JSL $02E1A6                               ; $02F1F8 |
  LDA #$0080                                ; $02F1FC |
  STA !s_spr_timer_1,x                      ; $02F1FF |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F202 |

CODE_02F204:
  RTS                                       ; $02F204 |

  TYX                                       ; $02F205 |
  LDA !s_spr_timer_1,x                      ; $02F206 |
  BNE CODE_02F26D                           ; $02F209 |
  LDA !s_spr_timer_4,x                      ; $02F20B |
  BEQ CODE_02F216                           ; $02F20E |
  LDA #$0001                                ; $02F210 |
  STA !s_spr_timer_4,x                      ; $02F213 |

CODE_02F216:
  LDA !s_spr_oam_yxppccct,x                 ; $02F216 |
  AND #$FFF0                                ; $02F219 |
  ORA #$000C                                ; $02F21C |
  STA !s_spr_oam_yxppccct,x                 ; $02F21F |
  LDA $1070                                 ; $02F222 |
  BEQ CODE_02F235                           ; $02F225 |
  LDA !s_spr_timer_3,x                      ; $02F227 |
  BNE CODE_02F235                           ; $02F22A |
  INC $1070                                 ; $02F22C |
  LDA #$0004                                ; $02F22F |
  STA !s_spr_timer_3,x                      ; $02F232 |

CODE_02F235:
  LDA !s_spr_gsu_morph_1_lo,x               ; $02F235 |
  SEC                                       ; $02F238 |
  SBC #$0008                                ; $02F239 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02F23C |
  STA !s_spr_wildcard_1_lo,x                ; $02F23F |
  CMP #$00C0                                ; $02F242 |
  BPL CODE_02F24F                           ; $02F245 |
  LDA #$0030                                ; $02F247 |
  STA !s_spr_timer_1,x                      ; $02F24A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F24D |

CODE_02F24F:
  LDA #$0180                                ; $02F24F |
  SEC                                       ; $02F252 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $02F253 |
  BMI CODE_02F26D                           ; $02F256 |
  AND #$01E0                                ; $02F258 |
  ASL A                                     ; $02F25B |
  ASL A                                     ; $02F25C |
  ASL A                                     ; $02F25D |
  XBA                                       ; $02F25E |
  STA $1080                                 ; $02F25F |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $02F262 |
  BEQ CODE_02F26D                           ; $02F264 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F266 |
  JSR CODE_02F357                           ; $02F268 |
  LDX $12                                   ; $02F26B |

CODE_02F26D:
  RTS                                       ; $02F26D |

  dw $1810, $0800                           ; $02F26E |

  JSR CODE_02BDBB                           ; $02F272 |
  STX $7A,y                                 ; $02F275 |
  BNE CODE_02F2CD                           ; $02F277 |
  LDY $1084                                 ; $02F279 |
  BNE CODE_02F2C1                           ; $02F27C |
  LDA !s_spr_x_pixel_pos,x                  ; $02F27E |
  CLC                                       ; $02F281 |
  ADC $0C                                   ; $02F282 |
  CLC                                       ; $02F284 |
  ADC #$0008                                ; $02F285 |
  STA $00                                   ; $02F288 |
  LDA !s_spr_y_pixel_pos,x                  ; $02F28A |
  CLC                                       ; $02F28D |
  ADC $0E                                   ; $02F28E |
  CLC                                       ; $02F290 |
  ADC #$0008                                ; $02F291 |
  STA $02                                   ; $02F294 |
  LDA #$01E6                                ; $02F296 |
  JSL spawn_ambient_sprite                  ; $02F299 |
  LDA $00                                   ; $02F29D |
  STA $70A2,y                               ; $02F29F |
  LDA $02                                   ; $02F2A2 |
  STA $7142,y                               ; $02F2A4 |
  LDA #$0004                                ; $02F2A7 |
  STA $7782,y                               ; $02F2AA |
  ASL A                                     ; $02F2AD |
  DEC A                                     ; $02F2AE |
  STA $73C2,y                               ; $02F2AF |
  STA $7E4C,y                               ; $02F2B2 |
  LDY #$10                                  ; $02F2B5 |
  STY $1084                                 ; $02F2B7 |
  LDA #$0020                                ; $02F2BA |
  STA !s_spr_timer_1,x                      ; $02F2BD |
  RTS                                       ; $02F2C0 |

CODE_02F2C1:
  CPY #$15                                  ; $02F2C1 |
  BMI CODE_02F2CE                           ; $02F2C3 |
  LDA #$0040                                ; $02F2C5 |
  STA !s_spr_timer_1,x                      ; $02F2C8 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F2CB |

CODE_02F2CD:
  RTS                                       ; $02F2CD |

CODE_02F2CE:
  INC $1084                                 ; $02F2CE |
  LDA $1084                                 ; $02F2D1 |
  SEC                                       ; $02F2D4 |
  SBC #$0010                                ; $02F2D5 |
  TAY                                       ; $02F2D8 |
  REP #$10                                  ; $02F2D9 |
  LDA $F26D,y                               ; $02F2DB |
  AND #$00FF                                ; $02F2DE |
  CLC                                       ; $02F2E1 |
  ADC !s_spr_oam_pointer,x                  ; $02F2E2 |
  CLC                                       ; $02F2E5 |
  ADC #$0080                                ; $02F2E6 |
  TAY                                       ; $02F2E9 |
  LDA $6000,y                               ; $02F2EA |
  CLC                                       ; $02F2ED |
  ADC !s_bg1_cam_x                          ; $02F2EE |
  CLC                                       ; $02F2F1 |
  ADC #$0008                                ; $02F2F2 |
  STA $00                                   ; $02F2F5 |
  LDA $6002,y                               ; $02F2F7 |
  CLC                                       ; $02F2FA |
  ADC !s_bg1_cam_y                          ; $02F2FB |
  CLC                                       ; $02F2FE |
  ADC #$0008                                ; $02F2FF |
  STA $02                                   ; $02F302 |
  SEP #$10                                  ; $02F304 |
  JSR CODE_02F31E                           ; $02F306 |
  LDA #$0008                                ; $02F309 |
  STA !s_spr_timer_1,x                      ; $02F30C |

CODE_02F30F:
  RTS                                       ; $02F30F |

  TYX                                       ; $02F310 |
  LDA !s_spr_timer_1,x                      ; $02F311 |
  BNE CODE_02F30F                           ; $02F314 |
  STZ $7ECC                                 ; $02F316 |
  PLA                                       ; $02F319 |
  JML $03A32E                               ; $02F31A |

CODE_02F31E:
  LDA #$0222                                ; $02F31E |
  JSL spawn_ambient_sprite                  ; $02F321 |
  LDA $00                                   ; $02F325 |
  AND #$FFF0                                ; $02F327 |
  STA $70A2,y                               ; $02F32A |
  LDA $02                                   ; $02F32D |
  AND #$FFF0                                ; $02F32F |
  STA $7142,y                               ; $02F332 |
  LDA #$000F                                ; $02F335 |
  STA $73C2,y                               ; $02F338 |
  LDA #$0004                                ; $02F33B |
  STA $7782,y                               ; $02F33E |
  LDA #$000A                                ; $02F341 |\ play sound #$000A
  JSL push_sound_queue                      ; $02F344 |/
  RTS                                       ; $02F348 |

  dw $E48A                                  ; $02F349 |
  dw $E4A6                                  ; $02F34B |
  dw $E4C2                                  ; $02F34D |
  dw $E4DE                                  ; $02F34F |
  dw $E4FA                                  ; $02F351 |
  dw $E516                                  ; $02F353 |
  dw $E532                                  ; $02F355 |

CODE_02F357:
  PHD                                       ; $02F357 |
  LDA #$0000                                ; $02F358 |
  TCD                                       ; $02F35B |
  LDA $1080                                 ; $02F35C |
  ASL A                                     ; $02F35F |
  TAX                                       ; $02F360 |
  LDA $F349,x                               ; $02F361 |
  STA $00                                   ; $02F364 |
  PHB                                       ; $02F366 |
  LDX #$70                                  ; $02F367 |
  PHX                                       ; $02F369 |
  PLB                                       ; $02F36A |
  LDX #$5F                                  ; $02F36B |
  STX $02                                   ; $02F36D |
  LDY #$00                                  ; $02F36F |

CODE_02F371:
  LDA [$00],y                               ; $02F371 |
  STA $21C4,y                               ; $02F373 |
  INY                                       ; $02F376 |
  INY                                       ; $02F377 |
  CPY #$1C                                  ; $02F378 |
  BCC CODE_02F371                           ; $02F37A |
  PLB                                       ; $02F37C |
  PLD                                       ; $02F37D |
  RTS                                       ; $02F37E |

init_naval_bud:
  RTL                                       ; $02F37F |

  dw $F4AD                                  ; $02F380 |
  dw $F4E4                                  ; $02F382 |
  dw $F56B                                  ; $02F384 |
  dw $F633                                  ; $02F386 |
  dw $F655                                  ; $02F388 |
  dw $F6D2                                  ; $02F38A |
  dw $F71A                                  ; $02F38C |
  dw $F78E                                  ; $02F38E |
  dw $F7D0                                  ; $02F390 |
  dw $F4E4                                  ; $02F392 |
  dw $F655                                  ; $02F394 |
  dw $F800                                  ; $02F396 |
  dw $F4AD                                  ; $02F398 |
  dw $F655                                  ; $02F39A |
  dw $E48E                                  ; $02F39C |
  dw $F848                                  ; $02F39E |
  dw $F8AA                                  ; $02F3A0 |
  dw $E48E                                  ; $02F3A2 |

main_naval_bud:
  JSR CODE_02F3E1                           ; $02F3A4 |
  LDY $1072                                 ; $02F3A7 |
  LDA !s_spr_oam_yxppccct,y                 ; $02F3AA |
  STA !s_spr_oam_yxppccct,x                 ; $02F3AD |
  JSL $03AF23                               ; $02F3B0 |
  TXY                                       ; $02F3B4 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02F3B5 |
  ASL A                                     ; $02F3B7 |
  TAX                                       ; $02F3B8 |
  JSR ($F380,x)                             ; $02F3B9 |
  JSR CODE_02F438                           ; $02F3BC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F3BF |
  CPY #$0E                                  ; $02F3C1 |
  BNE CODE_02F3DA                           ; $02F3C3 |
  LDA !s_spr_x_pixel_pos,x                  ; $02F3C5 |
  SEC                                       ; $02F3C8 |
  SBC !s_spr_x_delta_lo,x                   ; $02F3C9 |
  STA !s_spr_x_pixel_pos,x                  ; $02F3CC |
  LDA !s_spr_y_pixel_pos,x                  ; $02F3CF |
  SEC                                       ; $02F3D2 |
  SBC $72C2,x                               ; $02F3D3 |
  STA !s_spr_y_pixel_pos,x                  ; $02F3D6 |
  RTL                                       ; $02F3D9 |

CODE_02F3DA:
  JSR CODE_02F497                           ; $02F3DA |
  JSR CODE_02F4C1                           ; $02F3DD |
  RTL                                       ; $02F3E0 |

CODE_02F3E1:
  TXA                                       ; $02F3E1 |
  STA !gsu_r10                              ; $02F3E2 |
  LDA #$0002                                ; $02F3E5 |
  STA !gsu_r0                               ; $02F3E8 |
  LDA #$FD7D                                ; $02F3EB |
  STA !gsu_r14                              ; $02F3EE |
  LDY !s_spr_oam_count,x                    ; $02F3F1 |
  TYA                                       ; $02F3F4 |
  LSR A                                     ; $02F3F5 |
  LSR A                                     ; $02F3F6 |
  LSR A                                     ; $02F3F7 |
  STA !gsu_r12                              ; $02F3F8 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02F3FB |
  STA $601E                                 ; $02F3FD |
  LDA !s_spr_cam_x_pos,x                    ; $02F400 |
  STA !gsu_r1                               ; $02F403 |
  LDA !s_spr_cam_y_pos,x                    ; $02F406 |
  STA !gsu_r2                               ; $02F409 |
  LDA !s_spr_facing_dir,x                   ; $02F40C |
  STA !gsu_r8                               ; $02F40F |
  LDX #$08                                  ; $02F412 |
  LDA #$A201                                ; $02F414 |
  JSL r_gsu_init_1                          ; $02F417 | GSU init
  LDX $12                                   ; $02F41B |
  RTS                                       ; $02F41D |

  dw $0100, $0503, $0907, $0B0A             ; $02F41E |
  dw $0D0C, $0F0E, $1211, $1514             ; $02F426 |
  dw $1817, $1919, $1B1B, $1B1B             ; $02F42E |
  dw $191A                                  ; $02F436 |

CODE_02F438:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F438 |
  CPY #$0E                                  ; $02F43A |
  BPL CODE_02F47C                           ; $02F43C |
  LDA !s_spr_oam_pointer,x                  ; $02F43E |
  BMI CODE_02F47C                           ; $02F441 |
  LDA !s_player_hitbox_half_width           ; $02F443 |
  CLC                                       ; $02F446 |
  ADC #$0006                                ; $02F447 |
  ASL A                                     ; $02F44A |
  STA $00                                   ; $02F44B |
  LSR A                                     ; $02F44D |
  CLC                                       ; $02F44E |
  ADC !s_spr_x_player_delta,x               ; $02F44F |
  CMP $00                                   ; $02F452 |
  BCS CODE_02F47C                           ; $02F454 |
  LDY !s_spr_anim_frame,x                   ; $02F456 |
  LDA $F41E,y                               ; $02F459 |
  AND #$00FF                                ; $02F45C |
  STA $00                                   ; $02F45F |
  CLC                                       ; $02F461 |
  ADC #$0006                                ; $02F462 |
  CLC                                       ; $02F465 |
  ADC !s_player_hitbox_half_height          ; $02F466 |
  ASL A                                     ; $02F469 |
  STA $02                                   ; $02F46A |
  LSR A                                     ; $02F46C |
  CLC                                       ; $02F46D |
  ADC !s_spr_y_player_delta,x               ; $02F46E |
  SEC                                       ; $02F471 |
  SBC $00                                   ; $02F472 |
  CMP $02                                   ; $02F474 |
  BCS CODE_02F47C                           ; $02F476 |
  JSL player_hit_sprite                     ; $02F478 |

CODE_02F47C:
  RTS                                       ; $02F47C |

  dw $1818, $1010, $2020, $1818             ; $02F47D |
  dw $2820, $2028, $2020, $2828             ; $02F485 |
  dw $2828, $2828, $2828, $2828             ; $02F48D |
  dw $2828                                  ; $02F495 |

CODE_02F497:
  LDY !s_spr_anim_frame,x                   ; $02F497 |
  LDA $F47D,y                               ; $02F49A |
  TAY                                       ; $02F49D |
  TYA                                       ; $02F49E |
  STA $00                                   ; $02F49F |
  LDA !s_spr_oam_count,x                    ; $02F4A1 |
  AND #$FF07                                ; $02F4A4 |
  ORA $00                                   ; $02F4A7 |
  STA !s_spr_oam_count,x                    ; $02F4A9 |
  RTS                                       ; $02F4AC |

  TYX                                       ; $02F4AD |
  LDA $1074                                 ; $02F4AE |
  CMP !s_spr_y_pixel_pos,x                  ; $02F4B1 |
  BMI CODE_02F4BE                           ; $02F4B4 |
  STA !s_spr_y_pixel_pos,x                  ; $02F4B6 |
  STZ !s_spr_y_speed_lo,x                   ; $02F4B9 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02F4BC |

CODE_02F4BE:
  JMP CODE_02F52F                           ; $02F4BE |

CODE_02F4C1:
  LDA !s_spr_x_pixel_pos,x                  ; $02F4C1 |
  CMP #$03B0                                ; $02F4C4 |
  BMI CODE_02F4CE                           ; $02F4C7 |
  LDA #$03AF                                ; $02F4C9 |
  BRA CODE_02F4D6                           ; $02F4CC |

CODE_02F4CE:
  CMP #$02D0                                ; $02F4CE |
  BPL CODE_02F4E3                           ; $02F4D1 |
  LDA #$02D0                                ; $02F4D3 |

CODE_02F4D6:
  STA !s_spr_x_pixel_pos,x                  ; $02F4D6 |
  LDA !s_spr_x_speed_lo,x                   ; $02F4D9 |
  EOR #$FFFF                                ; $02F4DC |
  INC A                                     ; $02F4DF |
  STA !s_spr_x_speed_lo,x                   ; $02F4E0 |

CODE_02F4E3:
  RTS                                       ; $02F4E3 |

  TYX                                       ; $02F4E4 |
  LDA $1074                                 ; $02F4E5 |
  CMP !s_spr_y_pixel_pos,x                  ; $02F4E8 |
  BMI CODE_02F4F3                           ; $02F4EB |
  STA !s_spr_y_pixel_pos,x                  ; $02F4ED |
  STZ !s_spr_y_speed_lo,x                   ; $02F4F0 |

CODE_02F4F3:
  JSR CODE_02F52F                           ; $02F4F3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F4F6 |
  CPY #$01                                  ; $02F4F8 |
  BNE CODE_02F507                           ; $02F4FA |
  LDY $1072                                 ; $02F4FC |
  LDA !s_spr_wildcard_5_lo,y                ; $02F4FF |
  BNE CODE_02F506                           ; $02F502 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02F504 |

CODE_02F506:
  RTS                                       ; $02F506 |

CODE_02F507:
  LDY !s_spr_anim_frame,x                   ; $02F507 |
  CPY #$12                                  ; $02F50A |
  BNE CODE_02F51E                           ; $02F50C |
  LDA !s_spr_timer_2,x                      ; $02F50E |
  BNE CODE_02F51E                           ; $02F511 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F513 |
  LDA $0CE8                                 ; $02F515 |
  BEQ CODE_02F51E                           ; $02F518 |
  LDY #$0D                                  ; $02F51A |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F51C |

CODE_02F51E:
  RTS                                       ; $02F51E |

  dw $1312, $1514, $1716, $1918             ; $02F51F |
  dw $1819, $1617, $1415, $1213             ; $02F527 |

CODE_02F52F:
  LDA !s_spr_timer_3,x                      ; $02F52F |
  BNE CODE_02F55E                           ; $02F532 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02F534 |
  INC A                                     ; $02F536 |
  AND #$000F                                ; $02F537 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F53A |
  TAY                                       ; $02F53C |
  LDA $F51F,y                               ; $02F53D |
  TAY                                       ; $02F540 |
  TYA                                       ; $02F541 |
  STA !s_spr_anim_frame,x                   ; $02F542 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F545 |
  CPY #$09                                  ; $02F547 |
  BEQ CODE_02F54F                           ; $02F549 |
  CPY #$0E                                  ; $02F54B |
  BMI CODE_02F556                           ; $02F54D |

CODE_02F54F:
  LDA #$0002                                ; $02F54F |
  STA !s_spr_timer_3,x                      ; $02F552 |
  RTS                                       ; $02F555 |

CODE_02F556:
  LDA $10                                   ; $02F556 |
  AND #$0005                                ; $02F558 |
  STA !s_spr_timer_3,x                      ; $02F55B |

CODE_02F55E:
  RTS                                       ; $02F55E |

  dw $0020, $FFE0                           ; $02F55F |

  dw $0001, $FFFF                           ; $02F563 |

  dw $03B0, $02D0                           ; $02F567 |

  TYX                                       ; $02F56B |
  LDA !s_spr_timer_3,x                      ; $02F56C |
  BNE CODE_02F59B                           ; $02F56F |
  LDY #$00                                  ; $02F571 |
  LDA !s_spr_anim_frame,x                   ; $02F573 |
  CLC                                       ; $02F576 |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $02F577 |
  CMP #$0001                                ; $02F579 |
  BMI CODE_02F585                           ; $02F57C |
  INY                                       ; $02F57E |
  INY                                       ; $02F57F |
  CMP #$0004                                ; $02F580 |
  BMI CODE_02F58C                           ; $02F583 |

CODE_02F585:
  PHA                                       ; $02F585 |
  LDA $F563,y                               ; $02F586 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F589 |
  PLA                                       ; $02F58B |

CODE_02F58C:
  STA !s_spr_anim_frame,x                   ; $02F58C |
  LDA $10                                   ; $02F58F |
  AND #$0003                                ; $02F591 |
  CLC                                       ; $02F594 |
  ADC #$0004                                ; $02F595 |
  STA !s_spr_timer_3,x                      ; $02F598 |

CODE_02F59B:
  LDY #$00                                  ; $02F59B |
  CPX $1076                                 ; $02F59D |
  BNE CODE_02F5A4                           ; $02F5A0 |
  INY                                       ; $02F5A2 |
  INY                                       ; $02F5A3 |

CODE_02F5A4:
  TYA                                       ; $02F5A4 |
  DEC A                                     ; $02F5A5 |
  STA $06                                   ; $02F5A6 |
  LDA $F567,y                               ; $02F5A8 |
  STA $04                                   ; $02F5AB |
  LDA $F55F,y                               ; $02F5AD |
  LDY $1072                                 ; $02F5B0 |
  CLC                                       ; $02F5B3 |
  ADC !s_spr_x_pixel_pos,y                  ; $02F5B4 |
  STA $02                                   ; $02F5B7 |
  SEC                                       ; $02F5B9 |
  SBC !s_spr_x_pixel_pos,x                  ; $02F5BA |
  STA $00                                   ; $02F5BD |
  ASL A                                     ; $02F5BF |
  ASL A                                     ; $02F5C0 |
  ASL A                                     ; $02F5C1 |
  ASL A                                     ; $02F5C2 |
  PHP                                       ; $02F5C3 |
  CMP #$0300                                ; $02F5C4 |
  BMI CODE_02F5CC                           ; $02F5C7 |
  LDA #$0300                                ; $02F5C9 |

CODE_02F5CC:
  CMP #$FD00                                ; $02F5CC |
  BPL CODE_02F5D4                           ; $02F5CF |
  LDA #$FD00                                ; $02F5D1 |

CODE_02F5D4:
  STA !s_spr_x_accel_ceiling,x              ; $02F5D4 |
  PLP                                       ; $02F5D7 |
  BPL CODE_02F5DE                           ; $02F5D8 |
  EOR #$FFFF                                ; $02F5DA |
  INC A                                     ; $02F5DD |

CODE_02F5DE:
  LSR A                                     ; $02F5DE |
  LSR A                                     ; $02F5DF |
  LSR A                                     ; $02F5E0 |
  LSR A                                     ; $02F5E1 |
  STA !s_spr_x_accel,x                      ; $02F5E2 |
  LDY $1072                                 ; $02F5E5 |
  LDA !s_spr_wildcard_5_lo,y                ; $02F5E8 |
  CMP #$000D                                ; $02F5EB |
  BMI CODE_02F5FF                           ; $02F5EE |
  CMP #$0012                                ; $02F5F0 |
  BMI CODE_02F632                           ; $02F5F3 |
  CMP #$0015                                ; $02F5F5 |
  BMI CODE_02F5FF                           ; $02F5F8 |
  CMP #$001A                                ; $02F5FA |
  BMI CODE_02F632                           ; $02F5FD |

CODE_02F5FF:
  LDA $02                                   ; $02F5FF |
  SEC                                       ; $02F601 |
  SBC $04                                   ; $02F602 |
  EOR $06                                   ; $02F604 |
  BPL CODE_02F60C                           ; $02F606 |
  LDA $04                                   ; $02F608 |
  BRA CODE_02F627                           ; $02F60A |

CODE_02F60C:
  LDA $00                                   ; $02F60C |
  CLC                                       ; $02F60E |
  ADC #$0004                                ; $02F60F |
  CMP #$0008                                ; $02F612 |
  BCS CODE_02F632                           ; $02F615 |
  LDA !s_spr_x_pixel_pos,y                  ; $02F617 |
  LDY #$00                                  ; $02F61A |
  CPX $1076                                 ; $02F61C |
  BNE CODE_02F623                           ; $02F61F |
  INY                                       ; $02F621 |
  INY                                       ; $02F622 |

CODE_02F623:
  CLC                                       ; $02F623 |
  ADC $F55F,y                               ; $02F624 |

CODE_02F627:
  STA !s_spr_x_pixel_pos,x                  ; $02F627 |
  STZ !s_spr_x_speed_lo,x                   ; $02F62A |
  STZ !s_spr_x_accel,x                      ; $02F62D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F630 |

CODE_02F632:
  RTS                                       ; $02F632 |

  TYX                                       ; $02F633 |
  LDA !s_spr_timer_3,x                      ; $02F634 |
  BNE CODE_02F654                           ; $02F637 |
  LDA !s_spr_anim_frame,x                   ; $02F639 |
  INC A                                     ; $02F63C |
  CMP #$0012                                ; $02F63D |
  BMI CODE_02F647                           ; $02F640 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02F642 |
  LDA #$0012                                ; $02F644 |

CODE_02F647:
  STA !s_spr_anim_frame,x                   ; $02F647 |
  LDA $10                                   ; $02F64A |
  AND #$0001                                ; $02F64C |
  INC A                                     ; $02F64F |
  INC A                                     ; $02F650 |
  STA !s_spr_timer_3,x                      ; $02F651 |

CODE_02F654:
  RTS                                       ; $02F654 |

  TYX                                       ; $02F655 |
  LDA $0CE8                                 ; $02F656 |
  BNE CODE_02F661                           ; $02F659 |
  LDY #$0A                                  ; $02F65B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F65D |
  BRA CODE_02F666                           ; $02F65F |

CODE_02F661:
  LDA !s_spr_timer_1,x                      ; $02F661 |
  BNE CODE_02F6CF                           ; $02F664 |

CODE_02F666:
  LDY !s_spr_anim_frame,x                   ; $02F666 |
  CPY #$13                                  ; $02F669 |
  BPL CODE_02F6CF                           ; $02F66B |
  LDA !s_spr_timer_3,x                      ; $02F66D |
  BNE CODE_02F6CF                           ; $02F670 |
  LDA !s_spr_anim_frame,x                   ; $02F672 |
  DEC A                                     ; $02F675 |
  BPL CODE_02F694                           ; $02F676 |
  LDA $1074                                 ; $02F678 |
  CLC                                       ; $02F67B |
  ADC #$0010                                ; $02F67C |
  STA !s_spr_y_pixel_pos,x                  ; $02F67F |
  LDA #$0040                                ; $02F682 |
  STA !s_spr_timer_1,x                      ; $02F685 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F688 |
  STZ !s_spr_y_speed_lo,x                   ; $02F68A |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02F68D |
  LDA #$0000                                ; $02F68F |
  BRA CODE_02F6C5                           ; $02F692 |

CODE_02F694:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F694 |
  CPY #$0D                                  ; $02F696 |
  BNE CODE_02F6B8                           ; $02F698 |
  CMP #$0005                                ; $02F69A |
  BPL CODE_02F6C5                           ; $02F69D |
  STA !s_spr_anim_frame,x                   ; $02F69F |
  LDA $10                                   ; $02F6A2 |
  AND #$003F                                ; $02F6A4 |
  CLC                                       ; $02F6A7 |
  ADC #$0080                                ; $02F6A8 |
  STA !s_spr_timer_1,x                      ; $02F6AB |
  LDA #$0001                                ; $02F6AE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F6B1 |
  LDY #$06                                  ; $02F6B3 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F6B5 |
  RTS                                       ; $02F6B7 |

CODE_02F6B8:
  CMP #$0006                                ; $02F6B8 |
  BPL CODE_02F6C5                           ; $02F6BB |
  PHA                                       ; $02F6BD |
  LDA #$0040                                ; $02F6BE |
  STA !s_spr_y_speed_lo,x                   ; $02F6C1 |
  PLA                                       ; $02F6C4 |

CODE_02F6C5:
  STA !s_spr_anim_frame,x                   ; $02F6C5 |
  LDA #$0002                                ; $02F6C8 |
  STA !s_spr_timer_3,x                      ; $02F6CB |
  RTS                                       ; $02F6CE |

CODE_02F6CF:
  JMP CODE_02F52F                           ; $02F6CF |
  TYX                                       ; $02F6D2 |
  LDA $0CE8                                 ; $02F6D3 |
  BNE CODE_02F6DD                           ; $02F6D6 |
  LDY #$0A                                  ; $02F6D8 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F6DA |
  RTS                                       ; $02F6DC |

CODE_02F6DD:
  LDA !s_spr_timer_1,x                      ; $02F6DD |
  BNE CODE_02F711                           ; $02F6E0 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02F6E2 |
  BNE CODE_02F6EE                           ; $02F6E4 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02F6E6 |
  LDA !s_player_x                           ; $02F6E8 |
  STA !s_spr_x_pixel_pos,x                  ; $02F6EB |

CODE_02F6EE:
  LDA !s_spr_timer_3,x                      ; $02F6EE |
  BNE CODE_02F711                           ; $02F6F1 |
  INC !s_spr_anim_frame,x                   ; $02F6F3 |
  LDY !s_spr_anim_frame,x                   ; $02F6F6 |
  CPY #$03                                  ; $02F6F9 |
  BMI CODE_02F70B                           ; $02F6FB |
  LDA $10                                   ; $02F6FD |
  AND #$001F                                ; $02F6FF |
  CLC                                       ; $02F702 |
  ADC #$0040                                ; $02F703 |
  STA !s_spr_timer_1,x                      ; $02F706 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F709 |

CODE_02F70B:
  LDA #$0003                                ; $02F70B |
  STA !s_spr_timer_3,x                      ; $02F70E |

CODE_02F711:
  RTS                                       ; $02F711 |

  dw $0004, $FFFC                           ; $02F712 |

  dw $FFC0, $0040                           ; $02F716 |

  TYX                                       ; $02F71A |
  LDA $0CE8                                 ; $02F71B |
  BNE CODE_02F72B                           ; $02F71E |
  STZ !s_spr_x_accel,x                      ; $02F720 |
  STZ !s_spr_x_speed_lo,x                   ; $02F723 |
  LDY #$0A                                  ; $02F726 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F728 |
  RTS                                       ; $02F72A |

CODE_02F72B:
  LDA !s_spr_timer_1,x                      ; $02F72B |
  BNE CODE_02F745                           ; $02F72E |
  LDA !s_spr_x_player_delta,x               ; $02F730 |
  CLC                                       ; $02F733 |
  ADC #$0008                                ; $02F734 |
  CMP #$0010                                ; $02F737 |
  BCS CODE_02F745                           ; $02F73A |
  STZ !s_spr_x_speed_lo,x                   ; $02F73C |
  STZ !s_spr_x_accel,x                      ; $02F73F |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F742 |
  RTS                                       ; $02F744 |

CODE_02F745:
  LDY #$00                                  ; $02F745 |
  CPX $1076                                 ; $02F747 |
  BEQ CODE_02F74E                           ; $02F74A |
  INY                                       ; $02F74C |
  INY                                       ; $02F74D |

CODE_02F74E:
  LDA $F712,y                               ; $02F74E |
  LDY #$00                                  ; $02F751 |
  CLC                                       ; $02F753 |
  ADC !s_spr_x_player_delta,x               ; $02F754 |
  BPL CODE_02F75B                           ; $02F757 |
  INY                                       ; $02F759 |
  INY                                       ; $02F75A |

CODE_02F75B:
  LDA $F716,y                               ; $02F75B |
  STA !s_spr_x_accel_ceiling,x              ; $02F75E |
  LDA #$0010                                ; $02F761 |
  STA !s_spr_x_accel,x                      ; $02F764 |
  LDA !s_spr_timer_3,x                      ; $02F767 |
  BNE CODE_02F78D                           ; $02F76A |
  LDA !s_spr_anim_frame,x                   ; $02F76C |
  CLC                                       ; $02F76F |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $02F770 |
  STA !s_spr_anim_frame,x                   ; $02F772 |
  CMP #$0003                                ; $02F775 |
  BEQ CODE_02F77F                           ; $02F778 |
  CMP #$0005                                ; $02F77A |
  BMI CODE_02F787                           ; $02F77D |

CODE_02F77F:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $02F77F |
  EOR #$FFFF                                ; $02F781 |
  INC A                                     ; $02F784 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $02F785 |

CODE_02F787:
  LDA #$0008                                ; $02F787 |
  STA !s_spr_timer_3,x                      ; $02F78A |

CODE_02F78D:
  RTS                                       ; $02F78D |

  TYX                                       ; $02F78E |
  LDA $0CE8                                 ; $02F78F |
  BNE CODE_02F799                           ; $02F792 |
  LDY #$0A                                  ; $02F794 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F796 |
  RTS                                       ; $02F798 |

CODE_02F799:
  LDY !s_spr_anim_frame,x                   ; $02F799 |
  BNE CODE_02F7CC                           ; $02F79C |
  LDA #$0020                                ; $02F79E |
  STA !s_spr_timer_1,x                      ; $02F7A1 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $02F7A4 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F7A6 |

CODE_02F7A8:
  LDA #$01BA                                ; $02F7A8 |
  JSL spawn_ambient_sprite                  ; $02F7AB |
  LDA !s_spr_x_pixel_pos,x                  ; $02F7AF |
  STA $70A2,y                               ; $02F7B2 |
  LDA $1074                                 ; $02F7B5 |
  STA $7142,y                               ; $02F7B8 |
  LDA #$001A                                ; $02F7BB |
  STA $7E4C,y                               ; $02F7BE |
  LDA #$0003                                ; $02F7C1 |
  STA $7782,y                               ; $02F7C4 |
  JSL push_sound_queue                      ; $02F7C7 |
  RTS                                       ; $02F7CB |

CODE_02F7CC:
  DEC !s_spr_anim_frame,x                   ; $02F7CC |
  RTS                                       ; $02F7CF |

  TYX                                       ; $02F7D0 |
  LDA $0CE8                                 ; $02F7D1 |
  BNE CODE_02F7DB                           ; $02F7D4 |
  LDY #$0A                                  ; $02F7D6 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F7D8 |
  RTS                                       ; $02F7DA |

CODE_02F7DB:
  LDA !s_spr_timer_1,x                      ; $02F7DB |
  BNE CODE_02F7FB                           ; $02F7DE |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02F7E0 |
  BNE CODE_02F7E9                           ; $02F7E2 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02F7E4 |
  JSR CODE_02F7A8                           ; $02F7E6 |

CODE_02F7E9:
  INC !s_spr_anim_frame,x                   ; $02F7E9 |
  LDY !s_spr_anim_frame,x                   ; $02F7EC |
  CPY #$12                                  ; $02F7EF |
  BMI CODE_02F7FB                           ; $02F7F1 |
  LDA #$0040                                ; $02F7F3 |
  STA !s_spr_timer_2,x                      ; $02F7F6 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F7F9 |

CODE_02F7FB:
  RTS                                       ; $02F7FB |

  dw $0020, $FFE0                           ; $02F7FC |

  TYX                                       ; $02F800 |
  LDA !s_spr_timer_1,x                      ; $02F801 |
  BNE CODE_02F843                           ; $02F804 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $02F806 |
  BNE CODE_02F826                           ; $02F808 |
  LDA #$FFC0                                ; $02F80A |
  STA !s_spr_y_speed_lo,x                   ; $02F80D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $02F810 |
  CPX $1076                                 ; $02F812 |
  BNE CODE_02F819                           ; $02F815 |
  INY                                       ; $02F817 |
  INY                                       ; $02F818 |

CODE_02F819:
  LDA $F7FC,y                               ; $02F819 |
  LDY $1072                                 ; $02F81C |
  CLC                                       ; $02F81F |
  ADC !s_spr_x_pixel_pos,y                  ; $02F820 |
  STA !s_spr_x_pixel_pos,x                  ; $02F823 |

CODE_02F826:
  LDA !s_spr_timer_3,x                      ; $02F826 |
  BNE CODE_02F843                           ; $02F829 |
  INC !s_spr_anim_frame,x                   ; $02F82B |
  LDY !s_spr_anim_frame,x                   ; $02F82E |
  CPY #$12                                  ; $02F831 |
  BMI CODE_02F83D                           ; $02F833 |
  LDA #$FF80                                ; $02F835 |
  STA !s_spr_y_speed_lo,x                   ; $02F838 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F83B |

CODE_02F83D:
  LDA #$0004                                ; $02F83D |
  STA !s_spr_timer_3,x                      ; $02F840 |

CODE_02F843:
  RTS                                       ; $02F843 |

  dw $0040, $FFC0                           ; $02F844 |

  TYX                                       ; $02F848 |
  STZ !s_spr_x_speed_lo,x                   ; $02F849 |
  STZ !s_spr_x_accel,x                      ; $02F84C |
  STZ !s_spr_y_speed_lo,x                   ; $02F84F |
  STZ !s_spr_y_accel,x                      ; $02F852 |
  LDA !s_spr_timer_3,x                      ; $02F855 |
  BNE CODE_02F8A4                           ; $02F858 |
  LDY !s_spr_anim_frame,x                   ; $02F85A |
  CPY #$12                                  ; $02F85D |
  BEQ CODE_02F872                           ; $02F85F |
  BPL CODE_02F868                           ; $02F861 |
  INC !s_spr_anim_frame,x                   ; $02F863 |
  BRA CODE_02F86B                           ; $02F866 |

CODE_02F868:
  DEC !s_spr_anim_frame,x                   ; $02F868 |

CODE_02F86B:
  LDA #$0004                                ; $02F86B |
  STA !s_spr_timer_3,x                      ; $02F86E |
  RTS                                       ; $02F871 |

CODE_02F872:
  LDY #$00                                  ; $02F872 |
  LDA $1074                                 ; $02F874 |
  CMP !s_spr_y_pixel_pos,x                  ; $02F877 |
  BEQ CODE_02F887                           ; $02F87A |
  BPL CODE_02F880                           ; $02F87C |
  INY                                       ; $02F87E |
  INY                                       ; $02F87F |

CODE_02F880:
  LDA $F844,y                               ; $02F880 |
  STA !s_spr_y_speed_lo,x                   ; $02F883 |
  RTS                                       ; $02F886 |

CODE_02F887:
  LDY $1072                                 ; $02F887 |
  LDA !s_spr_wildcard_5_lo,y                ; $02F88A |
  CMP #$0025                                ; $02F88D |
  BNE CODE_02F8A4                           ; $02F890 |
  LDA #$0010                                ; $02F892 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02F895 |

CODE_02F898:
  DEC A                                     ; $02F898 |
  AND $10                                   ; $02F899 |
  CLC                                       ; $02F89B |
  ADC #$0018                                ; $02F89C |
  STA !s_spr_timer_1,x                      ; $02F89F |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F8A2 |

CODE_02F8A4:
  RTS                                       ; $02F8A4 |

  db $20, $00, $18, $10, $08                ; $02F8A5 |

  TYX                                       ; $02F8AA |
  LDA !s_spr_timer_1,x                      ; $02F8AB |
  BNE CODE_02F8FC                           ; $02F8AE |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02F8B0 |
  CPY #$05                                  ; $02F8B2 |
  BNE CODE_02F8B9                           ; $02F8B4 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02F8B6 |
  RTS                                       ; $02F8B8 |

CODE_02F8B9:
  INC !s_spr_wildcard_6_lo_dp,x             ; $02F8B9 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $02F8BB |
  REP #$10                                  ; $02F8BD |
  LDA $F8A4,y                               ; $02F8BF |
  AND #$00FF                                ; $02F8C2 |
  CLC                                       ; $02F8C5 |
  ADC !s_spr_oam_pointer,x                  ; $02F8C6 |
  TAY                                       ; $02F8C9 |
  LDA $6000,y                               ; $02F8CA |
  CLC                                       ; $02F8CD |
  ADC !s_bg1_cam_x                          ; $02F8CE |
  CLC                                       ; $02F8D1 |
  ADC #$0008                                ; $02F8D2 |
  STA $00                                   ; $02F8D5 |
  LDA $6002,y                               ; $02F8D7 |
  CLC                                       ; $02F8DA |
  ADC !s_bg1_cam_y                          ; $02F8DB |
  CLC                                       ; $02F8DE |
  ADC #$0008                                ; $02F8DF |
  STA $02                                   ; $02F8E2 |
  SEP #$10                                  ; $02F8E4 |
  JSR CODE_02F31E                           ; $02F8E6 |
  LDA $10                                   ; $02F8E9 |
  AND #$0007                                ; $02F8EB |
  CLC                                       ; $02F8EE |
  ADC !s_spr_gsu_morph_2_lo,x               ; $02F8EF |
  STA !s_spr_timer_1,x                      ; $02F8F2 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $02F8F5 |
  LSR A                                     ; $02F8F8 |
  STA !s_spr_gsu_morph_2_lo,x               ; $02F8F9 |

CODE_02F8FC:
  RTS                                       ; $02F8FC |

init_naval_piranha_stalk:
  RTL                                       ; $02F8FD |

; sub table
  dw $FA5E                                  ; $02F8FE |
  dw $FB78                                  ; $02F900 |
  dw $FBB8                                  ; $02F902 |
  dw $FBE3                                  ; $02F904 |
  dw $E48E                                  ; $02F906 |
  dw $FA5E                                  ; $02F908 |
  dw $FB78                                  ; $02F90A |

; data table
  dw $0000                                  ; $02F90C |
  dw $0040                                  ; $02F90E |
  dw $FFC0                                  ; $02F910 |

main_naval_piranha_stalk:
  LDY $1072                                 ; $02F912 |
  LDA !s_spr_oam_yxppccct,y                 ; $02F915 |
  STA !s_spr_oam_yxppccct,x                 ; $02F918 |
  JSR CODE_02F9CC                           ; $02F91B |
  JSL $03AF23                               ; $02F91E |
  LDY $1072                                 ; $02F922 |
  LDA !s_spr_wildcard_5_lo,y                ; $02F925 |
  CMP #$001C                                ; $02F928 |
  BMI CODE_02F986                           ; $02F92B |
  CMP #$001F                                ; $02F92D |
  BNE CODE_02F942                           ; $02F930 |
  LDY $1076                                 ; $02F932 |
  LDA !s_spr_wildcard_5_lo,y                ; $02F935 |
  LDY $1078                                 ; $02F938 |
  ORA !s_spr_wildcard_5_lo,y                ; $02F93B |
  BEQ CODE_02F974                           ; $02F93E |
  BRA CODE_02F986                           ; $02F940 |

CODE_02F942:
  CMP #$0020                                ; $02F942 |
  BMI CODE_02F974                           ; $02F945 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02F947 |
  CPY #$02                                  ; $02F949 |
  BPL CODE_02F98F                           ; $02F94B |
  LDY #$02                                  ; $02F94D |
  STY !s_spr_wildcard_5_lo_dp,x             ; $02F94F |
  LDY #$00                                  ; $02F951 |
  LDA $1074                                 ; $02F953 |
  CMP !s_spr_y_pixel_pos,x                  ; $02F956 |
  BEQ CODE_02F963                           ; $02F959 |
  PHP                                       ; $02F95B |
  INY                                       ; $02F95C |
  INY                                       ; $02F95D |
  PLP                                       ; $02F95E |
  BPL CODE_02F963                           ; $02F95F |
  INY                                       ; $02F961 |
  INY                                       ; $02F962 |

CODE_02F963:
  LDA $F90C,y                               ; $02F963 |
  STA !s_spr_y_speed_lo,x                   ; $02F966 |
  STZ !s_spr_y_accel,x                      ; $02F969 |
  LDA #$0004                                ; $02F96C |
  STA !s_spr_gsu_morph_1_lo,x               ; $02F96F |
  BRA CODE_02F98F                           ; $02F972 |

CODE_02F974:
  LDA !s_spr_y_accel,x                      ; $02F974 |
  BEQ CODE_02F97B                           ; $02F977 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $02F979 |

CODE_02F97B:
  STZ !s_spr_x_speed_lo,x                   ; $02F97B |
  STZ !s_spr_y_speed_lo,x                   ; $02F97E |
  STZ !s_spr_y_accel,x                      ; $02F981 |
  BRA CODE_02F9C7                           ; $02F984 |

CODE_02F986:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $02F986 |
  BEQ CODE_02F98F                           ; $02F988 |
  STA !s_spr_y_accel,x                      ; $02F98A |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $02F98D |

CODE_02F98F:
  TXY                                       ; $02F98F |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $02F990 |
  ASL A                                     ; $02F992 |
  TAX                                       ; $02F993 |
  JSR ($F8FE,x)                             ; $02F994 |
  JSR CODE_02F9F3                           ; $02F997 |
  JSR CODE_02FA09                           ; $02F99A |
  JSR CODE_02FA19                           ; $02F99D |
  LDY $1072                                 ; $02F9A0 |
  LDA !s_spr_wildcard_5_lo,y                ; $02F9A3 |
  CMP #$000E                                ; $02F9A6 |
  BEQ CODE_02F9B5                           ; $02F9A9 |
  CMP #$0016                                ; $02F9AB |
  BMI CODE_02F9C7                           ; $02F9AE |
  CMP #$0019                                ; $02F9B0 |
  BPL CODE_02F9C7                           ; $02F9B3 |

CODE_02F9B5:
  LDA #$0100                                ; $02F9B5 |
  STA !s_spr_y_accel_ceiling,x              ; $02F9B8 |
  LDA $10                                   ; $02F9BB |
  AND #$000F                                ; $02F9BD |
  CLC                                       ; $02F9C0 |
  ADC #$0010                                ; $02F9C1 |
  STA !s_spr_y_accel,x                      ; $02F9C4 |

CODE_02F9C7:
  RTL                                       ; $02F9C7 |

  db $18, $08, $00, $10                     ; $02F9C8 |

; naval stalk sub
CODE_02F9CC:
  LDA !s_spr_gsu_morph_2_lo,x               ; $02F9CC |
  BEQ CODE_02F9F2                           ; $02F9CF |
  STA $02                                   ; $02F9D1 |
  REP #$10                                  ; $02F9D3 |
  LDA !s_spr_oam_pointer,x                  ; $02F9D5 |
  STA $00                                   ; $02F9D8 |

CODE_02F9DA:
  LDY $02                                   ; $02F9DA |
  LDA $F9C7,y                               ; $02F9DC |
  AND #$00FF                                ; $02F9DF |
  CLC                                       ; $02F9E2 |
  ADC $00                                   ; $02F9E3 |
  TAY                                       ; $02F9E5 |
  LDA #$8000                                ; $02F9E6 |
  STA $6000,y                               ; $02F9E9 |
  DEC $02                                   ; $02F9EC |
  BNE CODE_02F9DA                           ; $02F9EE |
  SEP #$10                                  ; $02F9F0 |

CODE_02F9F2:
  RTS                                       ; $02F9F2 |

; naval stalk sub
CODE_02F9F3:
  LDA !s_spr_timer_2,x                      ; $02F9F3 |
  BNE CODE_02FA08                           ; $02F9F6 |
  LDA !s_spr_anim_frame,x                   ; $02F9F8 |
  INC A                                     ; $02F9FB |
  AND #$0003                                ; $02F9FC |
  STA !s_spr_anim_frame,x                   ; $02F9FF |
  LDA !s_spr_gsu_morph_1_lo,x               ; $02FA02 |
  STA !s_spr_timer_2,x                      ; $02FA05 |

CODE_02FA08:
  RTS                                       ; $02FA08 |

; naval stalk sub
CODE_02FA09:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02FA09 |
  CPY #$02                                  ; $02FA0B |
  BPL CODE_02FA18                           ; $02FA0D |
  LDY !s_spr_collision_id,x                 ; $02FA0F |
  BPL CODE_02FA18                           ; $02FA12 |
  JSL player_hit_sprite                     ; $02FA14 |

CODE_02FA18:
  RTS                                       ; $02FA18 |

; naval stalk sub
CODE_02FA19:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $02FA19 |
  CPY #$05                                  ; $02FA1B |
  BPL CODE_02FA41                           ; $02FA1D |
  LDA !s_spr_x_pixel_pos,x                  ; $02FA1F |
  CMP #$03A0                                ; $02FA22 |
  BMI CODE_02FA2C                           ; $02FA25 |
  LDA #$039F                                ; $02FA27 |
  BRA CODE_02FA34                           ; $02FA2A |

CODE_02FA2C:
  CMP #$02F0                                ; $02FA2C |
  BPL CODE_02FA41                           ; $02FA2F |
  LDA #$02F0                                ; $02FA31 |

CODE_02FA34:
  STA !s_spr_x_pixel_pos,x                  ; $02FA34 |
  LDA !s_spr_x_speed_lo,x                   ; $02FA37 |
  EOR #$FFFF                                ; $02FA3A |
  INC A                                     ; $02FA3D |
  STA !s_spr_x_speed_lo,x                   ; $02FA3E |

CODE_02FA41:
  RTS                                       ; $02FA41 |

; sub table
  dw $FA70                                  ; $02FA42 |
  dw $FA70                                  ; $02FA44 |
  dw $FAC7                                  ; $02FA46 |
  dw $FAC7                                  ; $02FA48 |
  dw $FAC7                                  ; $02FA4A |
  dw $FAC7                                  ; $02FA4C |
  dw $FAC7                                  ; $02FA4E |
  dw $FAC7                                  ; $02FA50 |
  dw $FAC7                                  ; $02FA52 |
  dw $FAC7                                  ; $02FA54 |
  dw $FAC7                                  ; $02FA56 |
  dw $FAC7                                  ; $02FA58 |
  dw $FAC7                                  ; $02FA5A |
  dw $FAC7                                  ; $02FA5C |

; naval stalk table sub
  TYX                                       ; $02FA5E |
  LDA !s_spr_timer_1,x                      ; $02FA5F |
  BNE CODE_02FA6F                           ; $02FA62 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02FA64 |
  LDA !s_spr_wildcard_5_lo,y                ; $02FA66 |
  ASL A                                     ; $02FA69 |
  TXY                                       ; $02FA6A |
  TAX                                       ; $02FA6B |
  JSR ($FA42,x)                             ; $02FA6C |

CODE_02FA6F:
  RTS                                       ; $02FA6F |

; naval stalk table sub
  CPX #$02                                  ; $02FA70 |
  BMI CODE_02FA78                           ; $02FA72 |
  CPX #$0A                                  ; $02FA74 |
  BMI CODE_02FA7B                           ; $02FA76 |

CODE_02FA78:
  TYX                                       ; $02FA78 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02FA79 |

CODE_02FA7B:
  TYX                                       ; $02FA7B |
  STZ !s_spr_facing_dir,x                   ; $02FA7C |
  LDY $1072                                 ; $02FA7F |
  LDA $10                                   ; $02FA82 |
  PHA                                       ; $02FA84 |
  AND #$007F                                ; $02FA85 |
  SEC                                       ; $02FA88 |
  SBC #$0040                                ; $02FA89 |
  BPL CODE_02FA94                           ; $02FA8C |
  INC !s_spr_facing_dir,x                   ; $02FA8E |
  INC !s_spr_facing_dir,x                   ; $02FA91 |

CODE_02FA94:
  CLC                                       ; $02FA94 |
  ADC !s_spr_x_pixel_pos,y                  ; $02FA95 |
  STA !s_spr_x_pixel_pos,x                  ; $02FA98 |
  PLA                                       ; $02FA9B |
  PHA                                       ; $02FA9C |
  XBA                                       ; $02FA9D |
  AND #$001F                                ; $02FA9E |
  CLC                                       ; $02FAA1 |
  ADC #$FF70                                ; $02FAA2 |
  STA !s_spr_y_speed_lo,x                   ; $02FAA5 |
  LDA #$0080                                ; $02FAA8 |
  STA !s_spr_y_accel_ceiling,x              ; $02FAAB |
  LDA #$0002                                ; $02FAAE |
  STA !s_spr_y_accel,x                      ; $02FAB1 |
  PLA                                       ; $02FAB4 |
  XBA                                       ; $02FAB5 |
  AND #$0003                                ; $02FAB6 |
  CLC                                       ; $02FAB9 |
  ADC #$0004                                ; $02FABA |
  STA !s_spr_gsu_morph_1_lo,x               ; $02FABD |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02FAC0 |
  RTS                                       ; $02FAC2 |

  dw $0010                                  ; $02FAC3 |
  dw $0030                                  ; $02FAC5 |

; naval stalk table sub
  TYX                                       ; $02FAC7 |
  STZ !s_spr_facing_dir,x                   ; $02FAC8 |
  LDA $10                                   ; $02FACB |
  AND #$003F                                ; $02FACD |
  CLC                                       ; $02FAD0 |
  ADC #$0040                                ; $02FAD1 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02FAD4 |
  LDA !s_spr_x_speed_lo,y                   ; $02FAD6 |
  STA !gsu_r0                               ; $02FAD9 |
  LDX #$0B                                  ; $02FADC |
  LDA #$86B6                                ; $02FADE |
  JSL r_gsu_init_1                          ; $02FAE1 | GSU init
  LDX $12                                   ; $02FAE5 |
  LDA !gsu_r0                               ; $02FAE7 |
  CMP #$0400                                ; $02FAEA |
  BMI CODE_02FAF2                           ; $02FAED |
  LDA #$0400                                ; $02FAEF |

CODE_02FAF2:
  CMP #$FC00                                ; $02FAF2 |
  BPL CODE_02FAFA                           ; $02FAF5 |
  LDA #$FC00                                ; $02FAF7 |

CODE_02FAFA:
  STA !s_spr_x_speed_lo,x                   ; $02FAFA |
  BMI CODE_02FB05                           ; $02FAFD |
  LDA #$0002                                ; $02FAFF |
  STA !s_spr_facing_dir,x                   ; $02FB02 |

CODE_02FB05:
  LDX #$00                                  ; $02FB05 |
  LDA !s_spr_x_pixel_pos,y                  ; $02FB07 |
  LDY $1072                                 ; $02FB0A |
  SEC                                       ; $02FB0D |
  SBC !s_spr_x_pixel_pos,y                  ; $02FB0E |
  BPL CODE_02FB15                           ; $02FB11 |
  INX                                       ; $02FB13 |
  INX                                       ; $02FB14 |

CODE_02FB15:
  LDA $10                                   ; $02FB15 |
  PHA                                       ; $02FB17 |
  AND #$003F                                ; $02FB18 |
  SEC                                       ; $02FB1B |
  SBC $FAC3,x                               ; $02FB1C |
  LDX $12                                   ; $02FB1F |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $02FB21 |
  CLC                                       ; $02FB23 |
  ADC !s_spr_x_pixel_pos,y                  ; $02FB24 |
  STA !s_spr_x_pixel_pos,x                  ; $02FB27 |
  LDY $1072                                 ; $02FB2A |
  LDA !s_spr_wildcard_5_lo,y                ; $02FB2D |
  CMP #$000E                                ; $02FB30 |
  BEQ CODE_02FB3F                           ; $02FB33 |
  CMP #$0016                                ; $02FB35 |
  BMI CODE_02FB53                           ; $02FB38 |
  CMP #$0019                                ; $02FB3A |
  BPL CODE_02FB53                           ; $02FB3D |

CODE_02FB3F:
  PLA                                       ; $02FB3F |
  LDA #$FE80                                ; $02FB40 |
  STA !s_spr_y_speed_lo,x                   ; $02FB43 |
  LDA #$0003                                ; $02FB46 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02FB49 |
  LSR A                                     ; $02FB4C |
  STA !s_spr_x_accel,x                      ; $02FB4D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02FB50 |
  RTS                                       ; $02FB52 |

CODE_02FB53:
  PLA                                       ; $02FB53 |
  PHA                                       ; $02FB54 |
  XBA                                       ; $02FB55 |
  AND #$003F                                ; $02FB56 |
  CLC                                       ; $02FB59 |
  ADC #$FF20                                ; $02FB5A |
  STA !s_spr_y_speed_lo,x                   ; $02FB5D |
  LDA #$0100                                ; $02FB60 |
  STA !s_spr_y_accel_ceiling,x              ; $02FB63 |
  LDA #$0004                                ; $02FB66 |
  STA !s_spr_y_accel,x                      ; $02FB69 |
  PLA                                       ; $02FB6C |
  AND #$0003                                ; $02FB6D |
  INC A                                     ; $02FB70 |
  INC A                                     ; $02FB71 |
  STA !s_spr_gsu_morph_1_lo,x               ; $02FB72 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02FB75 |
  RTS                                       ; $02FB77 |

; naval stalk table sub
  TYX                                       ; $02FB78 |
  LDY !s_spr_y_speed_hi,x                   ; $02FB79 |
  BMI CODE_02FBB7                           ; $02FB7C |
  LDA $1074                                 ; $02FB7E |
  CLC                                       ; $02FB81 |
  ADC #$0018                                ; $02FB82 |
  CMP !s_spr_y_pixel_pos,x                  ; $02FB85 |
  BPL CODE_02FBB7                           ; $02FB88 |
  STA !s_spr_y_pixel_pos,x                  ; $02FB8A |
  LDA !s_spr_y_accel,x                      ; $02FB8D |
  CMP #$0010                                ; $02FB90 |
  BPL CODE_02FBA9                           ; $02FB93 |
  LDA $10                                   ; $02FB95 |
  AND #$007F                                ; $02FB97 |
  CLC                                       ; $02FB9A |
  ADC #$0020                                ; $02FB9B |
  CMP #$0060                                ; $02FB9E |
  BMI CODE_02FBA6                           ; $02FBA1 |
  LDA #$0060                                ; $02FBA3 |

CODE_02FBA6:
  STA !s_spr_timer_1,x                      ; $02FBA6 |

CODE_02FBA9:
  STZ !s_spr_y_speed_lo,x                   ; $02FBA9 |
  STZ !s_spr_y_accel,x                      ; $02FBAC |
  STZ !s_spr_x_speed_lo,x                   ; $02FBAF |
  STZ !s_spr_x_accel,x                      ; $02FBB2 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $02FBB5 |

CODE_02FBB7:
  RTS                                       ; $02FBB7 |

; naval stalk table sub
  TYX                                       ; $02FBB8 |
  LDA $1074                                 ; $02FBB9 |
  CMP !s_spr_y_pixel_pos,x                  ; $02FBBC |
  BNE CODE_02FBB7                           ; $02FBBF |
  STZ !s_spr_y_speed_lo,x                   ; $02FBC1 |
  LDY !s_spr_anim_frame,x                   ; $02FBC4 |
  BNE CODE_02FBB7                           ; $02FBC7 |
  LDA #$FFFF                                ; $02FBC9 |
  STA !s_spr_timer_2,x                      ; $02FBCC |
  LDY $1072                                 ; $02FBCF |
  LDA !s_spr_wildcard_5_lo,y                ; $02FBD2 |
  CMP #$0025                                ; $02FBD5 |
  BMI CODE_02FBB7                           ; $02FBD8 |
  LDA #$0010                                ; $02FBDA |
  STA !s_spr_wildcard_1_lo,x                ; $02FBDD |
  JMP CODE_02F898                           ; $02FBE0 |

; naval stalk table sub
  TYX                                       ; $02FBE3 |
  LDA !s_spr_timer_1,x                      ; $02FBE4 |
  BNE CODE_02FC38                           ; $02FBE7 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02FBE9 |
  CPY #$04                                  ; $02FBEC |
  BNE CODE_02FBF3                           ; $02FBEE |
  INC !s_spr_wildcard_5_lo_dp,x             ; $02FBF0 |
  RTS                                       ; $02FBF2 |

CODE_02FBF3:
  INC !s_spr_gsu_morph_2_lo,x               ; $02FBF3 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $02FBF6 |
  REP #$10                                  ; $02FBF9 |
  LDA $F9C7,y                               ; $02FBFB |
  AND #$00FF                                ; $02FBFE |
  CLC                                       ; $02FC01 |
  ADC !s_spr_oam_pointer,x                  ; $02FC02 |
  TAY                                       ; $02FC05 |
  LDA $6000,y                               ; $02FC06 |
  CLC                                       ; $02FC09 |
  ADC !s_bg1_cam_x                          ; $02FC0A |
  CLC                                       ; $02FC0D |
  ADC #$0008                                ; $02FC0E |
  STA $00                                   ; $02FC11 |
  LDA $6002,y                               ; $02FC13 |
  CLC                                       ; $02FC16 |
  ADC !s_bg1_cam_y                          ; $02FC17 |
  CLC                                       ; $02FC1A |
  ADC #$0008                                ; $02FC1B |
  STA $02                                   ; $02FC1E |
  SEP #$10                                  ; $02FC20 |
  JSR CODE_02F31E                           ; $02FC22 |
  LDA $10                                   ; $02FC25 |
  AND #$0007                                ; $02FC27 |
  CLC                                       ; $02FC2A |
  ADC !s_spr_wildcard_1_lo,x                ; $02FC2B |
  STA !s_spr_timer_1,x                      ; $02FC2E |
  LDA !s_spr_wildcard_1_lo,x                ; $02FC31 |
  LSR A                                     ; $02FC34 |
  STA !s_spr_wildcard_1_lo,x                ; $02FC35 |

CODE_02FC38:
  RTS                                       ; $02FC38 |

; gsu table
  dw $FC51, $FC6A, $FC83, $FC9C             ; $02FC39 |
  dw $FCB5, $FCCE, $FCE7, $FD00             ; $02FC41 |
  dw $FD19, $FD32, $FD4B, $FD64             ; $02FC49 |
  dw $FCF6, $0020, $0002, $0804             ; $02FC51 |
  dw $02C0, $F400, $4008, $0902             ; $02FC59 |
  dw $08EA, $0280, $DA09, $0008             ; $02FC61 |
  dw $F702, $0EFB, $0200, $F401             ; $02FC69 |
  dw $C028, $0802, $28D9, $0280             ; $02FC71 |
  dw $E908, $0028, $0102, $2804             ; $02FC79 |
  dw $0240, $FAF8, $002C, $0202             ; $02FC81 |
  dw $22F4, $0240, $D707, $0022             ; $02FC89 |
  dw $0702, $22E7, $0280, $0402             ; $02FC91 |
  dw $C022, $F802, $20FB, $0200             ; $02FC99 |
  dw $F401, $C028, $0802, $28D9             ; $02FCA1 |
  dw $0280, $E908, $0028, $0102             ; $02FCA9 |
  dw $2804, $0240, $FAFC, $002E             ; $02FCB1 |
  dw $0202, $22F4, $0240, $D707             ; $02FCB9 |
  dw $0022, $0702, $22E7, $0280             ; $02FCC1 |
  dw $0402, $C022, $0102, $2EFA             ; $02FCC9 |
  dw $0200, $F404, $4024, $0502             ; $02FCD1 |
  dw $24D6, $0200, $E605, $8024             ; $02FCD9 |
  dw $0402, $2404, $02C0, $FCF5             ; $02FCE1 |
  dw $0020, $FF02, $0804, $02C0             ; $02FCE9 |
  dw $F4FF, $4008, $0802, $08EA             ; $02FCF1 |
  dw $0280, $DA08, $0008, $F602             ; $02FCF9 |
  dw $0EFB, $0200, $F400, $C028             ; $02FD01 |
  dw $0702, $28D9, $0280, $E907             ; $02FD09 |
  dw $0028, $0002, $2804, $0240             ; $02FD11 |
  dw $FAF7, $002C, $0102, $22F4             ; $02FD19 |
  dw $0240, $D706, $0022, $0602             ; $02FD21 |
  dw $22E7, $0280, $0401, $C022             ; $02FD29 |
  dw $F502, $20FC, $0200, $04FF             ; $02FD31 |
  dw $C008, $FF02, $08F4, $0240             ; $02FD39 |
  dw $EA08, $8008, $0802, $08DA             ; $02FD41 |
  dw $0200, $FBF6, $000E, $0002             ; $02FD49 |
  dw $28F4, $02C0, $D907, $8028             ; $02FD51 |
  dw $0702, $28E9, $0200, $0400             ; $02FD59 |
  dw $4028, $F702, $2CFA, $0200             ; $02FD61 |
  dw $F401, $4022, $0602, $22D7             ; $02FD69 |
  dw $0200, $E706, $8022, $0102             ; $02FD71 |
  dw $2204, $02C0, $FDB1, $FDC0             ; $02FD79 |
  dw $FDCF, $FDD9, $FDE3, $FDF7             ; $02FD81 |
  dw $FE0B, $FE1A, $FE29, $FE3D             ; $02FD89 |
  dw $FE56, $FE6F, $FE83, $FE97             ; $02FD91 |
  dw $FEAB, $FEC4, $FEDD, $FEF6             ; $02FD99 |
  dw $FF0F, $FF28, $FF41, $FF5A             ; $02FDA1 |
  dw $FF73, $FF8C, $FFA5, $FFBE             ; $02FDA9 |
  dw $0001, $0026, $0002, $3B0C             ; $02FDB1 |
  dw $0040, $0C08, $403A, $0000             ; $02FDB9 |
  dw $26FE, $0200, $0C00, $C00D             ; $02FDC1 |
  dw $0800, $0C0C, $00C0, $FB00             ; $02FDC9 |
  dw $0026, $0002, $0A04, $02C0             ; $02FDD1 |
  dw $F6FF, $0026, $0002, $2A04             ; $02FDD9 |
  dw $0240, $F2FF, $0026, $0002             ; $02FDE1 |
  dw $1DFC, $0040, $FC08, $401C             ; $02FDE9 |
  dw $0000, $0C04, $02C0, $EEFF             ; $02FDF1 |
  dw $0026, $0802, $2AFC, $00C0             ; $02FDF9 |
  dw $FC00, $C02B, $0000, $0A04             ; $02FE01 |
  dw $02C0, $EC00, $0026, $0002             ; $02FE09 |
  dw $0804, $02C0, $F400, $4008             ; $02FE11 |
  dw $0202, $26E9, $0200, $0400             ; $02FE19 |
  dw $402A, $0002, $0AF4, $0240             ; $02FE21 |
  dw $E705, $0026, $0002, $0CF4             ; $02FE29 |
  dw $0240, $F30F, $800B, $0000             ; $02FE31 |
  dw $0C04, $02C0, $E506, $0026             ; $02FE39 |
  dw $1102, $0BF2, $0080, $F209             ; $02FE41 |
  dw $800A, $0000, $0A04, $02C0             ; $02FE49 |
  dw $F400, $C02A, $0802, $26E3             ; $02FE51 |
  dw $0200, $0400, $C008, $0002             ; $02FE59 |
  dw $08F4, $0240, $F211, $8009             ; $02FE61 |
  dw $0900, $08F2, $0080, $F400             ; $02FE69 |
  dw $400A, $0902, $26E1, $0200             ; $02FE71 |
  dw $EA09, $002A, $0002, $2A04             ; $02FE79 |
  dw $0240, $DE0A, $0026, $0902             ; $02FE81 |
  dw $0CEA, $0280, $0400, $C00C             ; $02FE89 |
  dw $0002, $0CF4, $0240, $DB0A             ; $02FE91 |
  dw $0026, $0902, $0AEA, $0280             ; $02FE99 |
  dw $0400, $C00A, $0002, $2AF4             ; $02FEA1 |
  dw $02C0, $D80A, $0026, $0902             ; $02FEA9 |
  dw $08EA, $0280, $E209, $0018             ; $02FEB1 |
  dw $0002, $0804, $02C0, $F400             ; $02FEB9 |
  dw $4008, $0902, $26D5, $0200             ; $02FEC1 |
  dw $EA09, $002A, $0902, $1AE2             ; $02FEC9 |
  dw $0200, $0400, $402A, $0002             ; $02FED1 |
  dw $0AF4, $0240, $EA09, $800C             ; $02FED9 |
  dw $0802, $26D2, $0200, $0400             ; $02FEE1 |
  dw $C00C, $0002, $0CF4, $0240             ; $02FEE9 |
  dw $DA09, $000C, $0902, $0AEA             ; $02FEF1 |
  dw $0280, $CF06, $0026, $0002             ; $02FEF9 |
  dw $0A04, $02C0, $F400, $C02A             ; $02FF01 |
  dw $0902, $2ADA, $0280, $F400             ; $02FF09 |
  dw $4008, $0402, $26CD, $0200             ; $02FF11 |
  dw $DA09, $0008, $0902, $08EA             ; $02FF19 |
  dw $0280, $0400, $C008, $0402             ; $02FF21 |
  dw $26CC, $0200, $0401, $4028             ; $02FF29 |
  dw $0102, $28F4, $02C0, $D908             ; $02FF31 |
  dw $8028, $0802, $28E9, $0200             ; $02FF39 |
  dw $CA04, $0026, $0202, $2204             ; $02FF41 |
  dw $02C0, $F402, $4022, $0702             ; $02FF49 |
  dw $22D7, $0200, $E707, $8022             ; $02FF51 |
  dw $0402, $26C9, $0200, $0404             ; $02FF59 |
  dw $C024, $0402, $24F4, $0240             ; $02FF61 |
  dw $D605, $0024, $0502, $24E6             ; $02FF69 |
  dw $0280, $C904, $4026, $0402             ; $02FF71 |
  dw $2404, $0280, $F404, $0024             ; $02FF79 |
  dw $0302, $24D6, $0240, $E603             ; $02FF81 |
  dw $C024, $0402, $26CA, $0240             ; $02FF89 |
  dw $0406, $8022, $0602, $22F4             ; $02FF91 |
  dw $0200, $D701, $4022, $0102             ; $02FF99 |
  dw $22E7, $02C0, $CC04, $4026             ; $02FFA1 |
  dw $0702, $2804, $0200, $F407             ; $02FFA9 |
  dw $8028, $0002, $28D9, $02C0             ; $02FFB1 |
  dw $E900, $4028, $FF02, $08EA             ; $02FFB9 |
  dw $02C0, $CD04, $4026, $0802             ; $02FFC1 |
  dw $0804, $0280, $F408, $0008             ; $02FFC9 |
  dw $FF02, $08DA, $0240                    ; $02FFD1 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $02FFD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $02FFDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $02FFE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $02FFEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $02FFF7 |
  db $FF                                    ; $02FFFF |
