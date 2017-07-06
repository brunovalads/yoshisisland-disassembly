org $118000
; handles bandit minigame
; 7E03A7 has bandit minigame type
main_bandit_minigame:
  SEP #$30                                  ; $118000 |
  JSL $119D5A                               ; $118002 |
  JSL init_oam_and_bg3_tilemap              ; $118006 |
  JSL prepare_in_level_states               ; $11800A |
  JSL clear_all_sprites                     ; $11800E |
  JSL $008259                               ; $118012 |
  REP #$20                                  ; $118016 |
  LDX #$1C                                  ; $118018 |

CODE_11801A:
  STZ $0134,x                               ; $11801A |
  DEX                                       ; $11801D |
  DEX                                       ; $11801E |
  BPL CODE_11801A                           ; $11801F |
  STZ !r_cur_item_used                      ; $118021 |
  SEP #$20                                  ; $118024 |
  LDA $03A7                                 ; $118026 |
  LSR A                                     ; $118029 |
  TAY                                       ; $11802A |
  JSL $00B49E                               ; $11802B |
  LDX #$2A                                  ; $11802F |
  JSL init_scene_regs                       ; $118031 |
  JSL hdma_and_gradient_init                ; $118035 |
  REP #$30                                  ; $118039 |
  LDA #$0020                                ; $11803B |
  STA $6126                                 ; $11803E |
  LDA #$4000                                ; $118041 |
  STA !s_leftmost_tile_x                    ; $118044 |
  STA !s_uppermost_tile_y                   ; $118047 |
  LDY #$005C                                ; $11804A |
  LDA #$0000                                ; $11804D |

CODE_118050:
  STA !s_spr_id,y                           ; $118050 |
  DEY                                       ; $118053 |
  DEY                                       ; $118054 |
  DEY                                       ; $118055 |
  DEY                                       ; $118056 |
  BPL CODE_118050                           ; $118057 |
  LDY $03A7                                 ; $118059 |
  JSL $00BB70                               ; $11805C | load palette
  LDA #$09                                  ; $118060 |
  STA $0127                                 ; $118062 |
  JSL prepare_tilemap_dma_queue_l           ; $118065 |
  LDA #$02                                  ; $118069 |
  STA !r_apu_io_0_mirror                    ; $11806B |
  STZ $0205                                 ; $11806E |
  LDX $03A7                                 ; $118071 |
  JSR ($80CD,x)                             ; $118074 |
  REP #$20                                  ; $118077 |
  LDA #$8000                                ; $118079 |
  STA !s_baby_mario_state                   ; $11807C |
  STZ !s_cur_egg_inv_size                   ; $11807F |
  INC $7FEE                                 ; $118082 |
  LDX #$08                                  ; $118085 |
  LDA #$B1EF                                ; $118087 |
  JSL r_gsu_init_1                          ; $11808A | GSU init
  LDA $03A7                                 ; $11808E |
  LSR A                                     ; $118091 |
  CLC                                       ; $118092 |
  ADC #$0120                                ; $118093 |
  STA $704070                               ; $118096 |
  SEP #$20                                  ; $11809A |
  STZ !r_level_load_type                    ; $11809C |
  LDA #$2F                                  ; $11809F |
  STA !r_game_mode                          ; $1180A1 |
  INC !r_msg_box_state                      ; $1180A4 |
  LDA !r_reg_bgmode_mirror                  ; $1180A7 |
  ORA #$40                                  ; $1180AA |
  STA !r_reg_bgmode_mirror                  ; $1180AC |
  LDA #$04                                  ; $1180AF |
  STA !r_header_anim_tileset                ; $1180B1 |
  STZ !r_stage_intro_flag                   ; $1180B4 |
  LDA #$04                                  ; $1180B7 |
  STA !r_irq_count                          ; $1180B9 |
  LDA #$50                                  ; $1180BC |
  STA !reg_htimel                           ; $1180BE |
  LDA #$D8                                  ; $1180C1 |
  STA !reg_vtimel                           ; $1180C3 |
  LDA #$B1                                  ; $1180C6 |
  STA !reg_nmitimen                         ; $1180C8 |
  PLB                                       ; $1180CB |
  RTL                                       ; $1180CC |

;
  dw $80E8                                  ; $1180CD |
  dw $80EE                                  ; $1180CF |
  dw $80F4                                  ; $1180D1 |
  dw $B6DC                                  ; $1180D3 |
  dw $AD79                                  ; $1180D5 |
  dw $9D91                                  ; $1180D7 |
  dw $9D98                                  ; $1180D9 |
  dw $B764                                  ; $1180DB |
  dw $80E5                                  ; $1180DD |
  dw $B76E                                  ; $1180DF |
  dw $C506                                  ; $1180E1 |
  dw $80FA                                  ; $1180E3 |

  SEP #$30                                  ; $1180E5 |
  RTS                                       ; $1180E7 |

  LDY #$03                                  ; $1180E8 |
  LDX #$00                                  ; $1180EA |
  BRA CODE_11810A                           ; $1180EC |
  LDY #$04                                  ; $1180EE |
  LDX #$00                                  ; $1180F0 |
  BRA CODE_11810A                           ; $1180F2 |
  LDY #$05                                  ; $1180F4 |
  LDX #$00                                  ; $1180F6 |
  BRA CODE_11810A                           ; $1180F8 |
  LDY #$03                                  ; $1180FA |
  LDX #$01                                  ; $1180FC |
  BRA CODE_11810A                           ; $1180FE |
  LDY #$04                                  ; $118100 |
  LDX #$01                                  ; $118102 |
  BRA CODE_11810A                           ; $118104 |
  LDY #$05                                  ; $118106 |
  LDX #$01                                  ; $118108 |

CODE_11810A:
  STY $1170                                 ; $11810A |
  STX $10F2                                 ; $11810D |
  LDA !r_reg_bg1sc_mirror                   ; $118110 |
  EOR #$03                                  ; $118113 |
  STA !r_reg_bg1sc_mirror                   ; $118115 |
  STA !reg_bg1sc                            ; $118118 |
  LDA !r_reg_bg2sc_mirror                   ; $11811B |
  EOR #$03                                  ; $11811E |
  STA !r_reg_bg2sc_mirror                   ; $118120 |
  STA !reg_bg2sc                            ; $118123 |
  REP #$20                                  ; $118126 |
  STZ $39                                   ; $118128 |
  STZ $3B                                   ; $11812A |
  STZ $3D                                   ; $11812C |
  LDA #$0017                                ; $11812E |
  STA $3F                                   ; $118131 |
  STZ $41                                   ; $118133 |
  STZ $43                                   ; $118135 |
  LDA #$0030                                ; $118137 |
  STA !s_spr_x_pixel_pos                    ; $11813A |
  STA !s_player_x                           ; $11813D |
  LDA #$00B0                                ; $118140 |
  STA !s_spr_y_pixel_pos                    ; $118143 |
  LDA #$00E0                                ; $118146 |
  STA $70E4                                 ; $118149 |
  LDA #$00D8                                ; $11814C |
  STA $7184                                 ; $11814F |
  LDA #$0061                                ; $118152 |
  STA $70E6                                 ; $118155 |
  LDA #$0035                                ; $118158 |
  STA $7186                                 ; $11815B |
  LDA #$00C0                                ; $11815E |
  STA $10FE                                 ; $118161 |
  LDA #$00C0                                ; $118164 |
  STA $1100                                 ; $118167 |
  STA $1164                                 ; $11816A |
  STZ $1102                                 ; $11816D |
  STZ !s_spr_wildcard_4_lo                  ; $118170 |
  LDA #$0001                                ; $118173 |
  STA $797C                                 ; $118176 |
  STZ $1108                                 ; $118179 |
  STZ $1128                                 ; $11817C |
  STZ $1138                                 ; $11817F |
  JSL random_number_gen                     ; $118182 |
  LDA !s_rng                                ; $118186 |
  LSR A                                     ; $118189 |
  BCC CODE_118191                           ; $11818A |
  LDA #$FFF0                                ; $11818C |
  BRA CODE_118194                           ; $11818F |

CODE_118191:
  LDA #$0010                                ; $118191 |

CODE_118194:
  STA $7224                                 ; $118194 |
  STZ $797A                                 ; $118197 |
  LDA #$0001                                ; $11819A |
  STA $10F6                                 ; $11819D |
  LDA #$301F                                ; $1181A0 |
  STA $70218A                               ; $1181A3 |
  SEP #$20                                  ; $1181A7 |
  LDA #$B4                                  ; $1181A9 |
  STA $118C                                 ; $1181AB |
  STZ !reg_wrdivl                           ; $1181AE |
  STA !reg_wrdivh                           ; $1181B1 |
  LDA #$48                                  ; $1181B4 |
  STA !reg_wrdivb                           ; $1181B6 |
  NOP                                       ; $1181B9 |
  NOP                                       ; $1181BA |
  NOP                                       ; $1181BB |
  NOP                                       ; $1181BC |
  NOP                                       ; $1181BD |
  NOP                                       ; $1181BE |
  NOP                                       ; $1181BF |
  NOP                                       ; $1181C0 |
  LDA !reg_rddivl                           ; $1181C1 |
  STA $118E                                 ; $1181C4 |
  LDA !reg_rddivh                           ; $1181C7 |
  STA $118F                                 ; $1181CA |
  LDA #$09                                  ; $1181CD |
  STA !r_reg_bgmode_mirror                  ; $1181CF |
  STZ !r_reg_cgadsub_mirror                 ; $1181D2 |
  JSR CODE_119134                           ; $1181D5 |
  RTS                                       ; $1181D8 |

  LDA !r_msg_box_state                      ; $1181D9 |
  BEQ CODE_1181EA                           ; $1181DC |
  JSL $01DE5A                               ; $1181DE |
  LDA !r_msg_box_state                      ; $1181E2 |
  BNE CODE_1181EA                           ; $1181E5 |
  JSR CODE_118216                           ; $1181E7 |

CODE_1181EA:
  LDX $03A7                                 ; $1181EA |
  JSR ($81F2,x)                             ; $1181ED |
  PLB                                       ; $1181F0 |
  RTL                                       ; $1181F1 |

  dw $825E                                  ; $1181F2 |
  dw $825E                                  ; $1181F4 |
  dw $825E                                  ; $1181F6 |
  dw $B6DD                                  ; $1181F8 |
  dw $AE1A                                  ; $1181FA |
  dw $9E88                                  ; $1181FC |
  dw $9E88                                  ; $1181FE |
  dw $B765                                  ; $118200 |
  dw $80E5                                  ; $118202 |
  dw $B85C                                  ; $118204 |
  dw $C5FA                                  ; $118206 |
  dw $825E                                  ; $118208 |

  db $A2, $A2, $A2, $A3                     ; $11820A |
  db $A3, $A4, $A4, $A6                     ; $11820E |
  db $A7, $A5, $A5, $A2                     ; $118212 |

CODE_118216:
  LDA $03A7                                 ; $118216 |
  LSR A                                     ; $118219 |
  REP #$30                                  ; $11821A |
  AND #$00FF                                ; $11821C |
  TAY                                       ; $11821F |
  LDA $820A,y                               ; $118220 |
  AND #$00FF                                ; $118223 |
  JSL decompress_lc_lz1_l                   ; $118226 |
  LDX #$0070                                ; $11822A |
  STX $01                                   ; $11822D |
  LDX #$6800                                ; $11822F |
  LDY #$3400                                ; $118232 |
  JSL $00BEA6                               ; $118235 |
  LDX #$0000                                ; $118239 |

CODE_11823C:
  LDA $5FE3CC,x                             ; $11823C |
  STA $702002,x                             ; $118240 |
  INX                                       ; $118244 |
  INX                                       ; $118245 |
  CPX #$001E                                ; $118246 |
  BCC CODE_11823C                           ; $118249 |
  SEP #$30                                  ; $11824B |
  LDA !r_reg_hdmaen_mirror                  ; $11824D |
  EOR #$20                                  ; $118250 |
  STA !r_reg_hdmaen_mirror                  ; $118252 |
  LDA !r_reg_bgmode_mirror                  ; $118255 |
  EOR #$40                                  ; $118258 |
  STA !r_reg_bgmode_mirror                  ; $11825A |
  RTS                                       ; $11825D |

  REP #$20                                  ; $11825E |
  LDY $1194                                 ; $118260 |
  LDA $093C,y                               ; $118263 |
  STA !r_joy1_lo_mirror                     ; $118266 |
  LDA $093E,y                               ; $118269 |
  STA !r_joy1_lo_press_mirror               ; $11826C |
  JSL $008259                               ; $11826F |
  JSL spr_edge_despawn_draw                 ; $118273 |
  JSR CODE_118D8D                           ; $118277 |
  JSR CODE_1187FD                           ; $11827A |
  LDA !r_msg_box_state                      ; $11827D |
  BNE CODE_118293                           ; $118280 |
  LDA !r_reg_hdmaen_mirror                  ; $118282 |
  BIT #$08                                  ; $118285 |
  BNE CODE_118290                           ; $118287 |
  JSR CODE_11942C                           ; $118289 |
  JSL $119C27                               ; $11828C |

CODE_118290:
  JSR CODE_1182BB                           ; $118290 |

CODE_118293:
  JSR CODE_118D73                           ; $118293 |
  REP #$20                                  ; $118296 |
  LDA $7E4000                               ; $118298 |
  CMP #$0020                                ; $11829C |
  BCS CODE_1182A4                           ; $11829F |
  JSR CODE_11912F                           ; $1182A1 |

CODE_1182A4:
  LDA $10F8                                 ; $1182A4 |
  BEQ CODE_1182AD                           ; $1182A7 |
  JSL $0397D3                               ; $1182A9 |

CODE_1182AD:
  REP #$20                                  ; $1182AD |
  LDX #$08                                  ; $1182AF |
  LDA #$B1EF                                ; $1182B1 |
  JSL r_gsu_init_1                          ; $1182B4 | GSU init
  SEP #$20                                  ; $1182B8 |
  RTS                                       ; $1182BA |

CODE_1182BB:
  LDA $797C                                 ; $1182BB |
  ASL A                                     ; $1182BE |
  TAY                                       ; $1182BF |
  LDA $82CD,y                               ; $1182C0 |
  STA $00                                   ; $1182C3 |
  LDA $82CE,y                               ; $1182C5 |
  STA $01                                   ; $1182C8 |
  JMP ($0000)                               ; $1182CA |

  dw $82D3                                  ; $1182CD |
  dw $8443                                  ; $1182CF |
  dw $84EC                                  ; $1182D1 |

  REP #$30                                  ; $1182D3 |
  LDA !r_frame_counter_global_dp            ; $1182D5 |
  AND #$0003                                ; $1182D7 |
  BEQ CODE_1182DF                           ; $1182DA |
  JMP CODE_11836D                           ; $1182DC |

CODE_1182DF:
  LDA $1164                                 ; $1182DF |
  AND #$01F0                                ; $1182E2 |
  ASL A                                     ; $1182E5 |
  ASL A                                     ; $1182E6 |
  ASL A                                     ; $1182E7 |
  ASL A                                     ; $1182E8 |
  ASL A                                     ; $1182E9 |
  ASL A                                     ; $1182EA |
  ORA #$001F                                ; $1182EB |
  STA $70218A                               ; $1182EE |
  LDA $1164                                 ; $1182F2 |
  INC A                                     ; $1182F5 |
  STA $1164                                 ; $1182F6 |
  CMP #$01FF                                ; $1182F9 |
  BCC CODE_11836D                           ; $1182FC |
  LDA #$0002                                ; $1182FE |
  STA $797C                                 ; $118301 |
  LDA !s_spr_wildcard_4_lo                  ; $118304 |
  BNE CODE_11833C                           ; $118307 |
  LDA #$0003                                ; $118309 |
  STA $797A                                 ; $11830C |
  LDA #$0004                                ; $11830F |
  STA !s_spr_wildcard_4_lo                  ; $118312 |
  LDA #$00C0                                ; $118315 |
  STA !s_spr_wildcard_6_lo                  ; $118318 |
  STZ !s_spr_wildcard_5_lo                  ; $11831B |
  LDA #$009D                                ; $11831E |
  STA $00                                   ; $118321 |
  SEP #$20                                  ; $118323 |
  LDA #$FE                                  ; $118325 |
  STA $1107                                 ; $118327 |
  LDA #$08                                  ; $11832A |
  STA !s_spr_y_speed_lo                     ; $11832C |
  STZ $1106                                 ; $11832F |
  STZ $1126                                 ; $118332 |
  STZ $1136                                 ; $118335 |
  REP #$20                                  ; $118338 |
  BRA CODE_11834D                           ; $11833A |

CODE_11833C:
  LDA #$0004                                ; $11833C |
  STA $797A                                 ; $11833F |
  LDA #$0003                                ; $118342 |
  STA !s_spr_wildcard_4_lo                  ; $118345 |
  LDA #$009E                                ; $118348 |
  STA $00                                   ; $11834B |

CODE_11834D:
  REP #$30                                  ; $11834D |
  LDA #$01FF                                ; $11834F |
  STA $1164                                 ; $118352 |
  LDA $1154                                 ; $118355 |
  LDA $1156                                 ; $118358 |
  LDA $1144                                 ; $11835B |
  LDA $1146                                 ; $11835E |
  STZ $114A                                 ; $118361 |
  STZ $115A                                 ; $118364 |
  STZ $116A                                 ; $118367 |
  STZ $1168                                 ; $11836A |

CODE_11836D:
  LDA $1168                                 ; $11836D |
  BEQ CODE_11839D                           ; $118370 |
  DEC $1168                                 ; $118372 |
  LDA $1100                                 ; $118375 |
  SEC                                       ; $118378 |
  SBC #$0003                                ; $118379 |
  STA $1100                                 ; $11837C |
  LDA $10FE                                 ; $11837F |
  CLC                                       ; $118382 |
  ADC #$0003                                ; $118383 |
  CMP #$01FF                                ; $118386 |
  BCC CODE_11838E                           ; $118389 |
  LDA #$01FF                                ; $11838B |

CODE_11838E:
  STA $10FE                                 ; $11838E |
  LDA !r_frame_counter_global_dp            ; $118391 |
  AND #$0003                                ; $118393 |
  BNE CODE_1183D0                           ; $118396 |
  INC $7186                                 ; $118398 |
  BRA CODE_1183D0                           ; $11839B |

CODE_11839D:
  LDA $1100                                 ; $11839D |
  CLC                                       ; $1183A0 |
  ADC #$0003                                ; $1183A1 |
  CMP $1164                                 ; $1183A4 |
  BCC CODE_1183AC                           ; $1183A7 |
  LDA $1164                                 ; $1183A9 |

CODE_1183AC:
  STA $1100                                 ; $1183AC |
  LDA $10FE                                 ; $1183AF |
  SEC                                       ; $1183B2 |
  SBC #$0003                                ; $1183B3 |
  CMP $1164                                 ; $1183B6 |
  BCS CODE_1183BE                           ; $1183B9 |
  LDA $1164                                 ; $1183BB |

CODE_1183BE:
  STA $10FE                                 ; $1183BE |
  LDA $7186                                 ; $1183C1 |
  DEC A                                     ; $1183C4 |
  CMP #$0090                                ; $1183C5 |
  BCS CODE_1183CD                           ; $1183C8 |
  LDA #$0090                                ; $1183CA |

CODE_1183CD:
  STA $7186                                 ; $1183CD |

CODE_1183D0:
  JSR CODE_1183D6                           ; $1183D0 |
  SEP #$30                                  ; $1183D3 |
  RTS                                       ; $1183D5 |

CODE_1183D6:
  REP #$30                                  ; $1183D6 |
  LDY !s_oam_next_free_slot_ptr             ; $1183D8 |
  LDX #$0000                                ; $1183DB |
  STZ $02                                   ; $1183DE |

CODE_1183E0:
  STZ $00                                   ; $1183E0 |

CODE_1183E2:
  LDA $70E6                                 ; $1183E2 |
  CLC                                       ; $1183E5 |
  ADC $00                                   ; $1183E6 |
  STA $6000,y                               ; $1183E8 |
  LDA $7186                                 ; $1183EB |
  CLC                                       ; $1183EE |
  ADC $02                                   ; $1183EF |
  STA $6002,y                               ; $1183F1 |
  LDA $8433,x                               ; $1183F4 |
  AND #$00FF                                ; $1183F7 |
  ORA #$2900                                ; $1183FA |
  STA $6004,y                               ; $1183FD |
  LDA #$0002                                ; $118400 |
  STA $6006,y                               ; $118403 |
  TYA                                       ; $118406 |
  CLC                                       ; $118407 |
  ADC #$0008                                ; $118408 |
  TAY                                       ; $11840B |
  INX                                       ; $11840C |
  INC $04                                   ; $11840D |
  INC $04                                   ; $11840F |
  LDA $00                                   ; $118411 |
  CLC                                       ; $118413 |
  ADC #$0010                                ; $118414 |
  STA $00                                   ; $118417 |
  CMP #$0040                                ; $118419 |
  BCC CODE_1183E2                           ; $11841C |
  STZ $00                                   ; $11841E |
  LDA $02                                   ; $118420 |
  CLC                                       ; $118422 |
  ADC #$0010                                ; $118423 |
  STA $02                                   ; $118426 |
  CMP #$0040                                ; $118428 |
  BCC CODE_1183E0                           ; $11842B |
  STY !s_oam_next_free_slot_ptr             ; $11842D |
  SEP #$30                                  ; $118430 |
  RTS                                       ; $118432 |

  db $C0, $C2, $C4, $C6, $E0, $E2, $E4, $E6 ; $118433 |
  db $C8, $CA, $CC, $CE, $E8, $EA, $EC, $EE ; $11843B |

  LDY #$00                                  ; $118443 |
  LDX #$04                                  ; $118445 |
  LDA !s_spr_wildcard_4_lo                  ; $118447 |
  CMP #$02                                  ; $11844A |
  BEQ CODE_118457                           ; $11844C |
  LDA $797A                                 ; $11844E |
  CMP #$02                                  ; $118451 |
  BNE CODE_11845E                           ; $118453 |
  LDY #$02                                  ; $118455 |

CODE_118457:
  LDA $1105,y                               ; $118457 |
  CMP #$FD                                  ; $11845A |
  BEQ CODE_11846E                           ; $11845C |

CODE_11845E:
  LDA #$0D                                  ; $11845E |
  STA $00                                   ; $118460 |
  LDA #$03                                  ; $118462 |
  STA $02                                   ; $118464 |
  LDA #$00                                  ; $118466 |
  JSR CODE_119073                           ; $118468 |
  JSR CODE_1190EB                           ; $11846B |

CODE_11846E:
  JSR CODE_118FDE                           ; $11846E |
  LDA !s_spr_x_pixel_pos,x                  ; $118471 |
  CMP #$26                                  ; $118474 |
  BCS CODE_1184A9                           ; $118476 |
  LDA #$26                                  ; $118478 |
  STA !s_spr_x_pixel_pos,x                  ; $11847A |
  LDA #$90                                  ; $11847D |
  STA !s_spr_y_pixel_pos,x                  ; $11847F |
  STZ !s_spr_wildcard_4_lo,x                ; $118482 |
  LDA #$01                                  ; $118485 |
  STA !s_spr_wildcard_4_lo                  ; $118487 |
  STZ $1154                                 ; $11848A |
  STZ $1144                                 ; $11848D |
  STZ $116E                                 ; $118490 |
  LDA #$08                                  ; $118493 |
  STA $1168                                 ; $118495 |
  LDA #$13                                  ; $118498 |\ play sound #$0013
  JSL push_sound_queue                      ; $11849A |/
  STZ $1194                                 ; $11849E |
  JSR CODE_1195A7                           ; $1184A1 |
  JSR CODE_1195E8                           ; $1184A4 |
  BRA CODE_1184E8                           ; $1184A7 |

CODE_1184A9:
  CMP #$9D                                  ; $1184A9 |
  BCC CODE_1184E8                           ; $1184AB |
  LDA #$9C                                  ; $1184AD |
  STA !s_spr_x_pixel_pos,x                  ; $1184AF |
  LDA #$90                                  ; $1184B2 |
  STA !s_spr_y_pixel_pos,x                  ; $1184B4 |
  STZ !s_spr_wildcard_4_lo,x                ; $1184B7 |
  LDA #$01                                  ; $1184BA |
  STA $797A                                 ; $1184BC |
  STZ $1156                                 ; $1184BF |
  STZ $1146                                 ; $1184C2 |
  STZ $116E                                 ; $1184C5 |
  LDA #$08                                  ; $1184C8 |
  STA $1168                                 ; $1184CA |
  LDA #$13                                  ; $1184CD |\ play sound #$0013
  JSL push_sound_queue                      ; $1184CF |/
  LDA $10F2                                 ; $1184D3 |
  BEQ CODE_1184E5                           ; $1184D6 |
  LDA #$04                                  ; $1184D8 |
  STA $1194                                 ; $1184DA |
  JSR CODE_1195A7                           ; $1184DD |
  JSR CODE_1195E8                           ; $1184E0 |
  BRA CODE_1184E8                           ; $1184E3 |

CODE_1184E5:
  JSR CODE_118C58                           ; $1184E5 |

CODE_1184E8:
  JSR CODE_1183D6                           ; $1184E8 |
  RTS                                       ; $1184EB |

  LDA $116A                                 ; $1184EC |
  ASL A                                     ; $1184EF |
  TAY                                       ; $1184F0 |
  LDA $84FE,y                               ; $1184F1 |
  STA $00                                   ; $1184F4 |
  LDA $84FF,y                               ; $1184F6 |
  STA $01                                   ; $1184F9 |
  JMP ($0000)                               ; $1184FB |

  dw $850E                                  ; $1184FE |
  dw $8532                                  ; $118500 |
  dw $8557                                  ; $118502 |
  dw $85A8                                  ; $118504 |
  dw $85CC                                  ; $118506 |
  dw $85F0                                  ; $118508 |
  dw $8614                                  ; $11850A |
  dw $867E                                  ; $11850C |

  REP #$30                                  ; $11850E |
  LDA #$0004                                ; $118510 |
  STA $00                                   ; $118513 |
  LDA #$0002                                ; $118515 |
  STA $0A                                   ; $118518 |
  LDA #$006A                                ; $11851A |
  STA $0C                                   ; $11851D |
  LDX #$0000                                ; $11851F |
  JSR CODE_118682                           ; $118522 |
  JSR CODE_1183D6                           ; $118525 |
  INC $116A                                 ; $118528 |
  LDA #$86                                  ; $11852B |\ play sound #$0086
  JSL push_sound_queue                      ; $11852D |/
  RTS                                       ; $118531 |

  REP #$30                                  ; $118532 |
  LDA #$0001                                ; $118534 |
  STA $00                                   ; $118537 |
  LDA #$0002                                ; $118539 |
  STA $0A                                   ; $11853C |
  LDA #$0040                                ; $11853E |
  STA $0C                                   ; $118541 |
  LDX #$0004                                ; $118543 |
  JSR CODE_118682                           ; $118546 |
  JSR CODE_1183D6                           ; $118549 |
  SEP #$30                                  ; $11854C |
  INC $116A                                 ; $11854E |
  LDA #$10                                  ; $118551 |
  STA $1168                                 ; $118553 |
  RTS                                       ; $118556 |

  REP #$30                                  ; $118557 |
  LDA #$0004                                ; $118559 |
  STA $00                                   ; $11855C |
  LDA #$0002                                ; $11855E |
  STA $0A                                   ; $118561 |
  LDA #$0042                                ; $118563 |
  STA $0C                                   ; $118566 |
  LDX #$0005                                ; $118568 |
  JSR CODE_118682                           ; $11856B |
  SEP #$30                                  ; $11856E |
  LDA !r_frame_counter_global_dp            ; $118570 |
  LSR A                                     ; $118572 |
  BCS CODE_118578                           ; $118573 |
  JSR CODE_1183D6                           ; $118575 |

CODE_118578:
  DEC $1168                                 ; $118578 |
  BNE CODE_118585                           ; $11857B |
  INC $116A                                 ; $11857D |
  LDA #$02                                  ; $118580 |
  STA $1168                                 ; $118582 |

CODE_118585:
  REP #$30                                  ; $118585 |
  LDA $10FE                                 ; $118587 |
  SEC                                       ; $11858A |
  SBC #$0010                                ; $11858B |
  BPL CODE_118593                           ; $11858E |
  LDA #$0001                                ; $118590 |

CODE_118593:
  STA $10FE                                 ; $118593 |
  LDA $1100                                 ; $118596 |
  SEC                                       ; $118599 |
  SBC #$0010                                ; $11859A |
  BPL CODE_1185A2                           ; $11859D |
  LDA #$0001                                ; $11859F |

CODE_1185A2:
  STA $1100                                 ; $1185A2 |
  SEP #$30                                  ; $1185A5 |
  RTS                                       ; $1185A7 |

  REP #$30                                  ; $1185A8 |
  LDA #$0010                                ; $1185AA |
  STA $00                                   ; $1185AD |
  STZ $0A                                   ; $1185AF |
  LDA #$00E3                                ; $1185B1 |
  STA $0C                                   ; $1185B4 |
  LDX #$0009                                ; $1185B6 |
  JSR CODE_118682                           ; $1185B9 |
  SEP #$30                                  ; $1185BC |
  DEC $1168                                 ; $1185BE |
  BNE CODE_1185CB                           ; $1185C1 |
  INC $116A                                 ; $1185C3 |
  LDA #$02                                  ; $1185C6 |
  STA $1168                                 ; $1185C8 |

CODE_1185CB:
  RTS                                       ; $1185CB |

  REP #$30                                  ; $1185CC |
  LDA #$0020                                ; $1185CE |
  STA $00                                   ; $1185D1 |
  STZ $0A                                   ; $1185D3 |
  LDA #$00E3                                ; $1185D5 |
  STA $0C                                   ; $1185D8 |
  LDX #$0019                                ; $1185DA |
  JSR CODE_118682                           ; $1185DD |
  SEP #$30                                  ; $1185E0 |
  DEC $1168                                 ; $1185E2 |
  BNE CODE_1185EF                           ; $1185E5 |
  INC $116A                                 ; $1185E7 |
  LDA #$02                                  ; $1185EA |
  STA $1168                                 ; $1185EC |

CODE_1185EF:
  RTS                                       ; $1185EF |

  REP #$30                                  ; $1185F0 |
  LDA #$0020                                ; $1185F2 |
  STA $00                                   ; $1185F5 |
  STZ $0A                                   ; $1185F7 |
  LDA #$00E3                                ; $1185F9 |
  STA $0C                                   ; $1185FC |
  LDX #$0039                                ; $1185FE |
  JSR CODE_118682                           ; $118601 |
  SEP #$30                                  ; $118604 |
  DEC $1168                                 ; $118606 |
  BNE CODE_118613                           ; $118609 |
  INC $116A                                 ; $11860B |
  LDA #$02                                  ; $11860E |
  STA $1168                                 ; $118610 |

CODE_118613:
  RTS                                       ; $118613 |

  REP #$30                                  ; $118614 |
  LDA #$0008                                ; $118616 |
  STA $00                                   ; $118619 |
  LDA #$0002                                ; $11861B |
  STA $0A                                   ; $11861E |
  LDA #$00E5                                ; $118620 |
  STA $0C                                   ; $118623 |
  LDX #$0059                                ; $118625 |
  JSR CODE_118682                           ; $118628 |
  SEP #$30                                  ; $11862B |
  DEC $1168                                 ; $11862D |
  BNE CODE_11867D                           ; $118630 |
  INC $116A                                 ; $118632 |
  INC $10E2                                 ; $118635 |
  LDA !s_spr_wildcard_4_lo                  ; $118638 |
  CMP #$04                                  ; $11863B |
  BEQ CODE_118644                           ; $11863D |
  INC $10E6                                 ; $11863F |
  BRA CODE_11867A                           ; $118642 |

CODE_118644:
  LDA $10F2                                 ; $118644 |
  BEQ CODE_11864E                           ; $118647 |
  INC $10FA                                 ; $118649 |
  BRA CODE_11867A                           ; $11864C |

CODE_11864E:
  REP #$20                                  ; $11864E |
  LDA #$0011                                ; $118650 |
  JSL spawn_sprite_init                     ; $118653 |
  BCC CODE_11867A                           ; $118657 |
  PHX                                       ; $118659 |
  LDA $1170                                 ; $11865A |
  SEC                                       ; $11865D |
  SBC #$0003                                ; $11865E |
  CLC                                       ; $118661 |
  ADC #$000A                                ; $118662 |
  STA !s_spr_wildcard_4_lo,y                ; $118665 |
  LDA #$0080                                ; $118668 |
  STA !s_spr_y_pixel_pos,y                  ; $11866B |
  LDA #$0038                                ; $11866E |
  STA !s_spr_x_pixel_pos,y                  ; $118671 |
  PLX                                       ; $118674 |
  INC $10F8                                 ; $118675 |
  SEP #$20                                  ; $118678 |

CODE_11867A:
  JSR CODE_1191C4                           ; $11867A |

CODE_11867D:
  RTS                                       ; $11867D |

  JSR CODE_1191C4                           ; $11867E |
  RTS                                       ; $118681 |

CODE_118682:
  REP #$30                                  ; $118682 |
  LDY !s_oam_next_free_slot_ptr             ; $118684 |

CODE_118687:
  LDA $873B,x                               ; $118687 |
  CLC                                       ; $11868A |
  ADC #$0020                                ; $11868B |
  AND #$00FF                                ; $11868E |
  CMP #$0080                                ; $118691 |
  BCC CODE_118699                           ; $118694 |
  ORA #$FF00                                ; $118696 |

CODE_118699:
  CLC                                       ; $118699 |
  ADC $70E6                                 ; $11869A |
  STA $6000,y                               ; $11869D |
  LDA $86DA,x                               ; $1186A0 |
  CLC                                       ; $1186A3 |
  ADC #$0020                                ; $1186A4 |
  AND #$00FF                                ; $1186A7 |
  CMP #$0080                                ; $1186AA |
  BCC CODE_1186B2                           ; $1186AD |
  ORA #$FF00                                ; $1186AF |

CODE_1186B2:
  CLC                                       ; $1186B2 |
  ADC $7186                                 ; $1186B3 |
  STA $6002,y                               ; $1186B6 |
  LDA $879B,x                               ; $1186B9 |
  AND #$FF00                                ; $1186BC |
  ORA $0C                                   ; $1186BF |
  STA $6004,y                               ; $1186C1 |
  LDA $0A                                   ; $1186C4 |
  STA $6006,y                               ; $1186C6 |
  INX                                       ; $1186C9 |
  TYA                                       ; $1186CA |
  CLC                                       ; $1186CB |
  ADC #$0008                                ; $1186CC |
  TAY                                       ; $1186CF |
  DEC $00                                   ; $1186D0 |
  BNE CODE_118687                           ; $1186D2 |
  STY !s_oam_next_free_slot_ptr             ; $1186D4 |
  SEP #$30                                  ; $1186D7 |
  RTS                                       ; $1186D9 |

  db $00, $00, $F0, $F0, $F8, $00, $00, $F0 ; $1186DA |
  db $F0, $08, $08, $00, $00, $F8, $F0, $F0 ; $1186E2 |
  db $F8, $08, $F0, $08, $F0, $00, $00, $F8 ; $1186EA |
  db $F8, $F4, $F4, $EC, $EC, $F4, $F4, $EC ; $1186F2 |
  db $EC, $0C, $0C, $04, $04, $0C, $0C, $04 ; $1186FA |
  db $04, $10, $10, $08, $08, $F0, $F0, $E8 ; $118702 |
  db $E8, $00, $00, $F8, $F8, $00, $00, $F8 ; $11870A |
  db $F8, $F0, $F0, $E8, $E8, $00, $00, $F8 ; $118712 |
  db $F8, $10, $10, $08, $08, $18, $18, $10 ; $11871A |
  db $10, $10, $10, $08, $08, $00, $00, $F8 ; $118722 |
  db $F8, $F0, $F0, $E8, $E8, $E8, $E8, $E0 ; $11872A |
  db $E0, $F8, $10, $18, $10, $F8, $E0, $D8 ; $118732 |
  db $E0                                    ; $11873A |

  db $00, $F0, $00, $F0, $F8, $F0, $00, $00 ; $11873B |
  db $F0, $00, $F8, $F0, $08, $08, $00, $F8 ; $118743 |
  db $F0, $08, $08, $F0, $F0, $00, $F8, $00 ; $11874B |
  db $F8, $F4, $EC, $F4, $EC, $0C, $04, $0C ; $118753 |
  db $04, $0C, $04, $0C, $04, $F4, $EC, $F4 ; $11875B |
  db $EC, $00, $F8, $00, $F8, $00, $F8, $00 ; $118763 |
  db $F8, $10, $08, $10, $08, $F0, $E8, $F0 ; $11876B |
  db $E8, $F0, $E8, $E8, $F0, $E8, $E0, $E0 ; $118773 |
  db $E8, $F0, $E8, $E8, $F0, $00, $F8, $F8 ; $11877B |
  db $00, $10, $08, $08, $10, $18, $10, $10 ; $118783 |
  db $18, $10, $08, $08, $10, $00, $F8, $F8 ; $11878B |
  db $00, $D8, $E0, $F8, $10, $18, $10, $F8 ; $118793 |

  db $E0, $F0, $B0, $70, $30, $30, $B2, $F2 ; $11879B |
  db $72, $32, $B0, $F0, $30, $70, $F0, $30 ; $1187A3 |
  db $70, $B0, $F0, $70, $B0, $30, $30, $70 ; $1187AB |
  db $B0, $F0, $F0, $B0, $70, $30, $F0, $B0 ; $1187B3 |
  db $70, $30, $F0, $B0, $70, $30, $F0, $B0 ; $1187BB |
  db $70, $30, $F0, $B0, $70, $30, $F0, $B0 ; $1187C3 |
  db $70, $30, $F0, $B0, $70, $30, $F0, $B0 ; $1187CB |
  db $70, $30, $F0, $B0, $30, $70, $F0, $B0 ; $1187D3 |
  db $30, $70, $F0, $B0, $30, $70, $F0, $B0 ; $1187DB |
  db $30, $70, $F0, $B0, $30, $70, $F0, $B0 ; $1187E3 |
  db $30, $70, $F0, $B0, $30, $70, $F0, $B0 ; $1187EB |
  db $30, $70, $30, $30, $30, $70, $70, $70 ; $1187F3 |
  db $70, $30                               ; $1187FB |

CODE_1187FD:
  LDA $797A                                 ; $1187FD |
  ASL A                                     ; $118800 |
  TAY                                       ; $118801 |
  LDA $880F,y                               ; $118802 |
  STA $00                                   ; $118805 |
  LDA $8810,y                               ; $118807 |
  STA $01                                   ; $11880A |
  JMP ($0000)                               ; $11880C |

  dw $8819                                  ; $11880F |
  dw $88FB                                  ; $118811 |
  dw $8A1F                                  ; $118813 |
  dw $8B0E                                  ; $118815 |
  dw $8C54                                  ; $118817 |

CODE_118819:
  LDY $1156                                 ; $118819 |
  LDA $1146                                 ; $11881C |
  BEQ CODE_118826                           ; $11881F |
  DEC $1146                                 ; $118821 |
  BRA CODE_118835                           ; $118824 |

CODE_118826:
  INY                                       ; $118826 |
  CPY #$04                                  ; $118827 |
  BCC CODE_11882D                           ; $118829 |
  LDY #$00                                  ; $11882B |

CODE_11882D:
  STY $1156                                 ; $11882D |
  LDA #$10                                  ; $118830 |
  STA $1146                                 ; $118832 |

CODE_118835:
  REP #$30                                  ; $118835 |
  TYA                                       ; $118837 |
  ASL A                                     ; $118838 |
  ASL A                                     ; $118839 |
  CLC                                       ; $11883A |
  ADC $1156                                 ; $11883B |
  ASL A                                     ; $11883E |
  TAX                                       ; $11883F |
  LDY !s_oam_next_free_slot_ptr             ; $118840 |
  LDA #$0005                                ; $118843 |
  STA $00                                   ; $118846 |

CODE_118848:
  LDA $88AB,x                               ; $118848 |
  CLC                                       ; $11884B |
  ADC $70E4                                 ; $11884C |
  STA $6000,y                               ; $11884F |
  LDA $88D3,x                               ; $118852 |
  CLC                                       ; $118855 |
  ADC $7184                                 ; $118856 |
  STA $6002,y                               ; $118859 |
  LDA $8883,x                               ; $11885C |
  STA $6004,y                               ; $11885F |
  AND #$FF00                                ; $118862 |
  SEC                                       ; $118865 |
  SBC #$3100                                ; $118866 |
  BEQ CODE_11886E                           ; $118869 |
  LDA #$0002                                ; $11886B |

CODE_11886E:
  STA $6006,y                               ; $11886E |
  INX                                       ; $118871 |
  INX                                       ; $118872 |
  TYA                                       ; $118873 |
  CLC                                       ; $118874 |
  ADC #$0008                                ; $118875 |
  TAY                                       ; $118878 |
  DEC $00                                   ; $118879 |
  BNE CODE_118848                           ; $11887B |
  STY !s_oam_next_free_slot_ptr             ; $11887D |
  SEP #$30                                  ; $118880 |
  RTS                                       ; $118882 |

  db $9E, $31, $9E, $31, $8B, $31, $8A, $31 ; $118883 |
  db $88, $33, $9E, $31, $9E, $31, $8B, $31 ; $11888B |
  db $8A, $31, $88, $33, $88, $33, $9E, $31 ; $118893 |
  db $9E, $31, $8B, $31, $8A, $31, $9E, $31 ; $11889B |
  db $9E, $31, $8B, $31, $8A, $31, $88, $33 ; $1188A3 |

  dw $FFEB, $FFE0, $FFE8, $FFE0             ; $1188AB |
  dw $FFE0, $FFEB, $FFE0, $FFE8             ; $1188B3 |
  dw $FFE0, $FFDF, $FFDE, $FFEB             ; $1188BB |
  dw $FFE0, $FFE8, $FFE0, $FFEB             ; $1188C3 |
  dw $FFE0, $FFE8, $FFE0, $FFDF             ; $1188CB |

ATA_1188D3:         dw $FFF0, $FFF0, $FFED, $FFED
ATA_1188DB:         dw $FFDE, $FFF0, $FFF0, $FFED
ATA_1188E3:         dw $FFED, $FFDE, $FFDF, $FFF0
ATA_1188EB:         dw $FFF0, $FFED, $FFED, $FFF0
ATA_1188F3:         dw $FFF0, $FFED, $FFED, $FFDE
  LDA $10F2                                 ; $1188FB |
  BEQ CODE_118903                           ; $1188FE |
  JMP CODE_1189A5                           ; $118900 |

CODE_118903:
  LDA $118A                                 ; $118903 |
  BEQ CODE_118919                           ; $118906 |
  JSR CODE_119B79                           ; $118908 |
  DEC $118A                                 ; $11890B |
  BEQ CODE_118913                           ; $11890E |
  JMP CODE_1189A1                           ; $118910 |

CODE_118913:
  STZ $116E                                 ; $118913 |
  JSR CODE_118C58                           ; $118916 |

CODE_118919:
  LDA $116E                                 ; $118919 |
  ASL A                                     ; $11891C |
  TAX                                       ; $11891D |
  LDA $1172,x                               ; $11891E |
  DEC A                                     ; $118921 |
  STA $1172,x                               ; $118922 |
  BNE CODE_11894B                           ; $118925 |
  JSL random_number_gen                     ; $118927 |
  LDA !s_rng                                ; $11892B |
  CMP #$02                                  ; $11892E |
  BCS CODE_11893F                           ; $118930 |
  LDA #$20                                  ; $118932 |
  STA $118A                                 ; $118934 |
  LDA #$90                                  ; $118937 |\ play sound #$0090
  JSL push_sound_queue                      ; $118939 |/
  BRA CODE_1189A1                           ; $11893D |

CODE_11893F:
  INC $116E                                 ; $11893F |
  LDA #$8F                                  ; $118942 |\ play sound #$008F
  JSL push_sound_queue                      ; $118944 |/
  JSR CODE_1199F8                           ; $118948 |

CODE_11894B:
  DEC $1166                                 ; $11894B |
  BEQ CODE_118958                           ; $11894E |
  JSR CODE_119AC6                           ; $118950 |
  JSR CODE_119B99                           ; $118953 |
  BRA CODE_1189A1                           ; $118956 |

CODE_118958:
  LDA #$13                                  ; $118958 |\ play sound #$0013
  JSL push_sound_queue                      ; $11895A |/
  LDA #$08                                  ; $11895E |\ play sound #$0008
  JSL push_sound_queue                      ; $118960 |/
  LDA #$38                                  ; $118964 |\ play sound #$0038
  JSL push_sound_queue                      ; $118966 |/
  LDA #$02                                  ; $11896A |
  STA $797A                                 ; $11896C |
  LDA #$01                                  ; $11896F |
  STA $797C                                 ; $118971 |
  STZ $1146                                 ; $118974 |
  STZ $1156                                 ; $118977 |
  LDA #$FD                                  ; $11897A |
  STA $1107                                 ; $11897C |
  LDA #$FD                                  ; $11897F |
  STA $1109                                 ; $118981 |
  STZ $1106                                 ; $118984 |
  STZ $1108                                 ; $118987 |
  STZ $1126                                 ; $11898A |
  STZ $1128                                 ; $11898D |
  LDA #$F0                                  ; $118990 |
  STA $7224                                 ; $118992 |
  STZ $1138                                 ; $118995 |
  STZ $1168                                 ; $118998 |
  STZ $116A                                 ; $11899B |
  JSR CODE_11942C                           ; $11899E |

CODE_1189A1:
  JSR CODE_118819                           ; $1189A1 |
  RTS                                       ; $1189A4 |

CODE_1189A5:
  LDA $118A                                 ; $1189A5 |
  BEQ CODE_1189BC                           ; $1189A8 |
  DEC $118A                                 ; $1189AA |
  BNE CODE_1189B5                           ; $1189AD |
  STZ $116E                                 ; $1189AF |
  JSR CODE_1195E8                           ; $1189B2 |

CODE_1189B5:
  JSR CODE_118819                           ; $1189B5 |
  JSR CODE_119B79                           ; $1189B8 |
  RTS                                       ; $1189BB |

CODE_1189BC:
  JSR CODE_119B99                           ; $1189BC |
  REP #$20                                  ; $1189BF |
  DEC $116C                                 ; $1189C1 |
  BNE CODE_1189EA                           ; $1189C4 |

CODE_1189C6:
  LDA #$0090                                ; $1189C6 |\ play sound #$0090
  JSL push_sound_queue                      ; $1189C9 |/
  LDA #$0020                                ; $1189CD |
  STA $118A                                 ; $1189D0 |
  LDA $118C                                 ; $1189D3 |
  STA $116C                                 ; $1189D6 |
  REP #$20                                  ; $1189D9 |
  LDA #$0048                                ; $1189DB |
  STA $1192                                 ; $1189DE |
  STZ $1190                                 ; $1189E1 |
  JSR CODE_119BF4                           ; $1189E4 |
  JMP CODE_118A19                           ; $1189E7 |

CODE_1189EA:
  JSR CODE_119AC6                           ; $1189EA |
  REP #$20                                  ; $1189ED |
  LDA $116E                                 ; $1189EF |
  ASL A                                     ; $1189F2 |
  TAX                                       ; $1189F3 |
  LDA $37                                   ; $1189F4 |
  BEQ CODE_118A19                           ; $1189F6 |
  CMP $1172,x                               ; $1189F8 |
  BNE CODE_1189C6                           ; $1189FB |
  LDA #$008F                                ; $1189FD |\ play sound #$008F
  JSL push_sound_queue                      ; $118A00 |/
  INC $116E                                 ; $118A04 |
  LDA $1170                                 ; $118A07 |
  CMP $116E                                 ; $118A0A |
  BCC CODE_118A14                           ; $118A0D |
  JSR CODE_119902                           ; $118A0F |
  BRA CODE_118A19                           ; $118A12 |

CODE_118A14:
  SEP #$20                                  ; $118A14 |
  JMP CODE_118958                           ; $118A16 |

CODE_118A19:
  SEP #$20                                  ; $118A19 |
  JSR CODE_118819                           ; $118A1B |
  RTS                                       ; $118A1E |

  LDA #$20                                  ; $118A1F |
  STA $00                                   ; $118A21 |
  LDA #$04                                  ; $118A23 |
  STA $02                                   ; $118A25 |
  LDX #$02                                  ; $118A27 |
  LDA #$00                                  ; $118A29 |
  JSR CODE_119073                           ; $118A2B |
  LDA $7184                                 ; $118A2E |
  CMP #$D8                                  ; $118A31 |
  BCC CODE_118A43                           ; $118A33 |
  LDA #$D8                                  ; $118A35 |
  STA $7184                                 ; $118A37 |
  STZ $797A                                 ; $118A3A |
  STZ $1146                                 ; $118A3D |
  STZ $1156                                 ; $118A40 |

CODE_118A43:
  LDA $1107                                 ; $118A43 |
  CLC                                       ; $118A46 |
  ADC #$03                                  ; $118A47 |
  TAY                                       ; $118A49 |
  LDA $8A8F,y                               ; $118A4A |
  TAX                                       ; $118A4D |
  REP #$30                                  ; $118A4E |
  LDA #$0005                                ; $118A50 |
  STA $00                                   ; $118A53 |
  LDY !s_oam_next_free_slot_ptr             ; $118A55 |

CODE_118A58:
  LDA $70E4                                 ; $118A58 |
  CLC                                       ; $118A5B |
  ADC $8ABE,x                               ; $118A5C |
  STA $6000,y                               ; $118A5F |
  LDA $7184                                 ; $118A62 |
  CLC                                       ; $118A65 |
  ADC $8A96,x                               ; $118A66 |
  STA $6002,y                               ; $118A69 |
  LDA $8AE6,x                               ; $118A6C |
  STA $6004,y                               ; $118A6F |
  AND #$0200                                ; $118A72 |
  BEQ CODE_118A7A                           ; $118A75 |
  LDA #$0002                                ; $118A77 |

CODE_118A7A:
  STA $6006,y                               ; $118A7A |
  INX                                       ; $118A7D |
  INX                                       ; $118A7E |
  TYA                                       ; $118A7F |
  CLC                                       ; $118A80 |
  ADC #$0008                                ; $118A81 |
  TAY                                       ; $118A84 |
  DEC $00                                   ; $118A85 |
  BNE CODE_118A58                           ; $118A87 |
  STY !s_oam_next_free_slot_ptr             ; $118A89 |
  SEP #$30                                  ; $118A8C |
  RTS                                       ; $118A8E |

  db $00, $0A, $0A, $14, $14, $14, $1E      ; $118A8F |

  dw $FFE2, $FFEF, $FFF0, $FFED             ; $118A96 |
  dw $FFED, $FFEF, $FFF0, $FFE8             ; $118A9E |
  dw $FFE8, $FFD9, $FFF0, $FFF0             ; $118AA6 |
  dw $FFDA, $FFE8, $FFE8, $FFF1             ; $118AAE |
  dw $FFF1, $FFE2, $FFEF, $FFEF             ; $118AB6 |

  dw $FFDE, $FFEA, $FFE3, $FFE8             ; $118ABE |
  dw $FFE0, $FFE3, $FFE8, $FFE8             ; $118AC6 |
  dw $FFE0, $FFE2, $FFE8, $FFE3             ; $118ACE |
  dw $FFE0, $FFE8, $FFE0, $FFE5             ; $118AD6 |
  dw $FFE0, $FFDF, $FFE8, $FFE0             ; $118ADE |

  dw $3388, $319A, $319E, $318B             ; $118AE6 |
  dw $318A, $719A, $719A, $318B             ; $118AEE |
  dw $318A, $3388, $B19B, $B19B             ; $118AF6 |
  dw $3388, $318B, $318A, $319E             ; $118AFE |
  dw $319E, $3388, $318B, $318A             ; $118B06 |

  LDX #$02                                  ; $118B0E |
  LDA #$20                                  ; $118B10 |
  STA $00                                   ; $118B12 |
  LDA #$04                                  ; $118B14 |
  STA $02                                   ; $118B16 |
  LDA #$00                                  ; $118B18 |
  JSR CODE_119073                           ; $118B1A |
  LDA !s_spr_y_pixel_pos,x                  ; $118B1D |
  CMP #$D8                                  ; $118B20 |
  BCC CODE_118B4D                           ; $118B22 |
  LDA #$D8                                  ; $118B24 |
  STA !s_spr_y_pixel_pos,x                  ; $118B26 |
  LDA !s_spr_x_pixel_pos,x                  ; $118B29 |
  CLC                                       ; $118B2C |
  ADC #$F6                                  ; $118B2D |
  STA $70EA                                 ; $118B2F |
  LDA !s_spr_y_pixel_pos,x                  ; $118B32 |
  CLC                                       ; $118B35 |
  ADC #$F8                                  ; $118B36 |
  STA $718A                                 ; $118B38 |
  JSR CODE_118F1F                           ; $118B3B |
  LDA !r_frame_counter_global_dp            ; $118B3E |
  AND #$30                                  ; $118B40 |
  LSR A                                     ; $118B42 |
  LSR A                                     ; $118B43 |
  LSR A                                     ; $118B44 |
  LSR A                                     ; $118B45 |
  TAY                                       ; $118B46 |
  LDA $8B96,y                               ; $118B47 |
  TAX                                       ; $118B4A |
  BRA CODE_118B59                           ; $118B4B |

CODE_118B4D:
  JSR CODE_1190EB                           ; $118B4D |
  LDA $1105,x                               ; $118B50 |
  INC A                                     ; $118B53 |
  INC A                                     ; $118B54 |
  TAY                                       ; $118B55 |
  LDX $8B9A,y                               ; $118B56 |

CODE_118B59:
  REP #$30                                  ; $118B59 |
  LDY !s_oam_next_free_slot_ptr             ; $118B5B |
  LDA #$0005                                ; $118B5E |
  STA $00                                   ; $118B61 |

CODE_118B63:
  LDA $70E4                                 ; $118B63 |
  CLC                                       ; $118B66 |
  ADC $8BDC,x                               ; $118B67 |
  STA $6000,y                               ; $118B6A |
  LDA $7184                                 ; $118B6D |
  CLC                                       ; $118B70 |
  ADC $8BA0,x                               ; $118B71 |
  STA $6002,y                               ; $118B74 |
  LDA $8C18,x                               ; $118B77 |
  STA $6004,y                               ; $118B7A |
  AND #$0200                                ; $118B7D |
  XBA                                       ; $118B80 |
  STA $6006,y                               ; $118B81 |
  INX                                       ; $118B84 |
  INX                                       ; $118B85 |
  TYA                                       ; $118B86 |
  CLC                                       ; $118B87 |
  ADC #$0008                                ; $118B88 |
  TAY                                       ; $118B8B |
  DEC $00                                   ; $118B8C |
  BNE CODE_118B63                           ; $118B8E |
  STY !s_oam_next_free_slot_ptr             ; $118B90 |
  SEP #$30                                  ; $118B93 |
  RTS                                       ; $118B95 |

  db $1E, $28, $32, $28                     ; $118B96 |

  dw $0A00, $1E14, $3228                    ; $118B9A |

  dw $FFF1, $FFF1, $FFE2, $FFEF             ; $118BA0 |
  dw $FFEF, $FFE4, $FFF2, $FFF2             ; $118BA8 |
  dw $FFF1, $FFF1, $FFF3, $FFF3             ; $118BB0 |
  dw $FFE6, $FFF3, $FFF3, $FFF3             ; $118BB8 |
  dw $FFF3, $FFE5, $FFF2, $FFF2             ; $118BC0 |
  dw $FFF3, $FFF3, $FFE4, $FFF2             ; $118BC8 |
  dw $FFF2, $FFF3, $FFF3, $FFE4             ; $118BD0 |
  dw $FFF2, $FFF2                           ; $118BD8 |

  dw $FFE5, $FFE0, $FFDF, $FFE8             ; $118BDC |
  dw $FFE0, $FFDF, $FFE4, $FFDF             ; $118BE4 |
  dw $FFE9, $FFE1, $FFDC, $FFE1             ; $118BEC |
  dw $FFDF, $FFE9, $FFE1, $FFDC             ; $118BF4 |
  dw $FFE1, $FFDF, $FFE9, $FFE1             ; $118BFC |
  dw $FFDC, $FFE1, $FFE0, $FFE9             ; $118C04 |
  dw $FFE1, $FFDC, $FFE1, $FFE1             ; $118C0C |
  dw $FFE9, $FFE1                           ; $118C14 |

  dw $319E, $319E, $3388, $318B             ; $118C18 |
  dw $318A, $3388, $319A, $319A             ; $118C20 |
  dw $318B, $318A, $319B, $319B             ; $118C28 |
  dw $3388, $318B, $318A, $319B             ; $118C30 |
  dw $319B, $3388, $318B, $318A             ; $118C38 |
  dw $319B, $319B, $3388, $318B             ; $118C40 |
  dw $318A, $319B, $319B, $3388             ; $118C48 |
  dw $318B, $318A                           ; $118C50 |

  JMP CODE_118819                           ; $118C54 |
  RTS                                       ; $118C57 |

CODE_118C58:
  JSR CODE_119BF4                           ; $118C58 |
  LDX #$0B                                  ; $118C5B |

CODE_118C5D:
  STZ $1172,x                               ; $118C5D |
  DEX                                       ; $118C60 |
  BPL CODE_118C5D                           ; $118C61 |
  LDA $1165                                 ; $118C63 |
  BEQ CODE_118C78                           ; $118C66 |
  LDA $1164                                 ; $118C68 |
  CMP #$80                                  ; $118C6B |
  BCC CODE_118C78                           ; $118C6D |
  JSL random_number_gen                     ; $118C6F |
  LDA !s_rng                                ; $118C73 |
  BMI CODE_118CB6                           ; $118C76 |

CODE_118C78:
  LDA $1170                                 ; $118C78 |
  ASL A                                     ; $118C7B |
  TAX                                       ; $118C7C |
  STZ $00                                   ; $118C7D |

CODE_118C7F:
  JSL random_number_gen                     ; $118C7F |
  LDA !s_rng                                ; $118C83 |
  AND #$1F                                  ; $118C86 |
  CMP #$18                                  ; $118C88 |
  BCC CODE_118C98                           ; $118C8A |
  CMP #$1C                                  ; $118C8C |
  BCS CODE_118C95                           ; $118C8E |
  SEC                                       ; $118C90 |
  SBC #$18                                  ; $118C91 |
  BRA CODE_118C98                           ; $118C93 |

CODE_118C95:
  SEC                                       ; $118C95 |
  SBC #$08                                  ; $118C96 |

CODE_118C98:
  CLC                                       ; $118C98 |
  ADC #$08                                  ; $118C99 |
  STA $1172,x                               ; $118C9B |
  CLC                                       ; $118C9E |
  ADC $00                                   ; $118C9F |
  STA $00                                   ; $118CA1 |
  DEX                                       ; $118CA3 |
  DEX                                       ; $118CA4 |
  BPL CODE_118C7F                           ; $118CA5 |
  LDA $00                                   ; $118CA7 |
  CMP #$B4                                  ; $118CA9 |
  BCC CODE_118CAF                           ; $118CAB |
  LDA #$B4                                  ; $118CAD |

CODE_118CAF:
  STA $1166                                 ; $118CAF |
  JSR CODE_11976D                           ; $118CB2 |
  RTS                                       ; $118CB5 |

CODE_118CB6:
  JSL random_number_gen                     ; $118CB6 |
  LDA !s_rng                                ; $118CBA |
  AND #$7F                                  ; $118CBD |
  CLC                                       ; $118CBF |
  ADC #$30                                  ; $118CC0 |
  STA $1166                                 ; $118CC2 |
  STA !reg_wrdivl                           ; $118CC5 |
  STZ !reg_wrdivh                           ; $118CC8 |
  LDA $1170                                 ; $118CCB |
  INC A                                     ; $118CCE |
  STA !reg_wrdivb                           ; $118CCF |
  NOP                                       ; $118CD2 |
  NOP                                       ; $118CD3 |
  NOP                                       ; $118CD4 |
  NOP                                       ; $118CD5 |
  NOP                                       ; $118CD6 |
  NOP                                       ; $118CD7 |
  NOP                                       ; $118CD8 |
  NOP                                       ; $118CD9 |
  LDA !reg_rddivl                           ; $118CDA |
  STA $00                                   ; $118CDD |
  LDA $1170                                 ; $118CDF |
  ASL A                                     ; $118CE2 |
  STA $0A                                   ; $118CE3 |
  LDX #$00                                  ; $118CE5 |
  STZ $02                                   ; $118CE7 |

CODE_118CE9:
  LDA $00                                   ; $118CE9 |
  STA $1172,x                               ; $118CEB |
  CLC                                       ; $118CEE |
  ADC $02                                   ; $118CEF |
  STA $02                                   ; $118CF1 |
  INX                                       ; $118CF3 |
  INX                                       ; $118CF4 |
  CPX $0A                                   ; $118CF5 |
  BNE CODE_118CE9                           ; $118CF7 |
  LDA $1166                                 ; $118CF9 |
  SEC                                       ; $118CFC |
  SBC $02                                   ; $118CFD |
  STA $1172,x                               ; $118CFF |
  JSL random_number_gen                     ; $118D02 |
  LDA !s_rng                                ; $118D06 |
  AND #$06                                  ; $118D09 |
  TAX                                       ; $118D0B |
  JSR ($8D16,x)                             ; $118D0C |
  JSR CODE_11976D                           ; $118D0F |
  STZ $116E                                 ; $118D12 |
  RTS                                       ; $118D15 |

  dw $8D1F                                  ; $118D16 |
  dw $8D1F                                  ; $118D18 |
  dw $8D4B                                  ; $118D1A |
  dw $8D4B                                  ; $118D1C |

  RTS                                       ; $118D1E |

  LDA $1170                                 ; $118D1F |
  ASL A                                     ; $118D22 |
  TAY                                       ; $118D23 |
  STZ $00                                   ; $118D24 |

CODE_118D26:
  LDA $1172,y                               ; $118D26 |
  SEC                                       ; $118D29 |
  SBC #$08                                  ; $118D2A |
  CLC                                       ; $118D2C |
  ADC $00                                   ; $118D2D |
  STA $00                                   ; $118D2F |
  LDA #$08                                  ; $118D31 |
  STA $1172,y                               ; $118D33 |
  DEY                                       ; $118D36 |
  DEY                                       ; $118D37 |
  CPY #$02                                  ; $118D38 |
  BNE CODE_118D26                           ; $118D3A |
  LDA $00                                   ; $118D3C |
  LSR A                                     ; $118D3E |
  CLC                                       ; $118D3F |
  ADC $1172                                 ; $118D40 |
  STA $1172                                 ; $118D43 |
  INC A                                     ; $118D46 |
  STA $1174                                 ; $118D47 |
  RTS                                       ; $118D4A |

  LDA $1170                                 ; $118D4B |
  DEC A                                     ; $118D4E |
  ASL A                                     ; $118D4F |
  TAY                                       ; $118D50 |
  PHY                                       ; $118D51 |
  STZ $00                                   ; $118D52 |

CODE_118D54:
  LDA $1172,y                               ; $118D54 |
  SEC                                       ; $118D57 |
  SBC #$08                                  ; $118D58 |
  CLC                                       ; $118D5A |
  ADC $00                                   ; $118D5B |
  STA $00                                   ; $118D5D |
  LDA #$08                                  ; $118D5F |
  STA $1172,y                               ; $118D61 |
  DEY                                       ; $118D64 |
  DEY                                       ; $118D65 |
  BPL CODE_118D54                           ; $118D66 |
  PLY                                       ; $118D68 |
  LDA $1174,y                               ; $118D69 |
  CLC                                       ; $118D6C |
  ADC $00                                   ; $118D6D |
  STA $1174,y                               ; $118D6F |
  RTS                                       ; $118D72 |

CODE_118D73:
  LDA !r_level_load_type                    ; $118D73 |
  BNE CODE_118D88                           ; $118D76 |
  REP #$20                                  ; $118D78 |
  LDA !s_spr_x_pixel_pos                    ; $118D7A |
  STA !s_player_x                           ; $118D7D |
  LDA !s_spr_y_pixel_pos                    ; $118D80 |
  STA !s_player_y                           ; $118D83 |
  SEP #$20                                  ; $118D86 |

CODE_118D88:
  JSL draw_player                           ; $118D88 |
  RTS                                       ; $118D8C |

CODE_118D8D:
  LDA !s_spr_wildcard_4_lo                  ; $118D8D |
  ASL A                                     ; $118D90 |
  TAY                                       ; $118D91 |
  LDA $8D9F,y                               ; $118D92 |
  STA $00                                   ; $118D95 |
  LDA $8DA0,y                               ; $118D97 |
  STA $01                                   ; $118D9A |
  JMP ($0000)                               ; $118D9C |

  dw $8DA9                                  ; $118D9F |
  dw $8DBB                                  ; $118DA1 |
  dw $8DEA                                  ; $118DA3 |
  dw $8E1C                                  ; $118DA5 |
  dw $8E7C                                  ; $118DA7 |

  JSL random_number_gen                     ; $118DA9 |
  REP #$20                                  ; $118DAD |
  LDX #$0B                                  ; $118DAF |
  LDA #$C6C5                                ; $118DB1 |
  JSL r_gsu_init_4                          ; $118DB4 | GSU init
  SEP #$20                                  ; $118DB8 |
  RTS                                       ; $118DBA |

  JSR CODE_119845                           ; $118DBB |
  LDY $1154                                 ; $118DBE |
  LDA $1144                                 ; $118DC1 |
  BEQ CODE_118DCB                           ; $118DC4 |
  DEC $1144                                 ; $118DC6 |
  BRA CODE_118DDB                           ; $118DC9 |

CODE_118DCB:
  INY                                       ; $118DCB |
  CPY #$04                                  ; $118DCC |
  BCC CODE_118DD2                           ; $118DCE |
  LDY #$00                                  ; $118DD0 |

CODE_118DD2:
  STY $1154                                 ; $118DD2 |
  LDA $8DE6,y                               ; $118DD5 |
  STA $1144                                 ; $118DD8 |

CODE_118DDB:
  LDA $8DE2,y                               ; $118DDB |
  STA !s_player_cur_anim_frame              ; $118DDE |
  RTS                                       ; $118DE1 |

  db $0D, $00, $4D, $00                     ; $118DE2 |

  db $20, $06, $06, $06                     ; $118DE6 |

  LDA #$20                                  ; $118DEA |
  STA $00                                   ; $118DEC |
  LDA #$04                                  ; $118DEE |
  STA $02                                   ; $118DF0 |
  LDX #$00                                  ; $118DF2 |
  TXA                                       ; $118DF4 |
  JSR CODE_119073                           ; $118DF5 |
  LDA !s_spr_y_pixel_pos                    ; $118DF8 |
  CMP #$B0                                  ; $118DFB |
  BCC CODE_118E0D                           ; $118DFD |
  LDA #$B0                                  ; $118DFF |
  STA !s_spr_y_pixel_pos                    ; $118E01 |
  STZ !s_spr_wildcard_4_lo                  ; $118E04 |
  STZ $1154                                 ; $118E07 |
  STZ $1144                                 ; $118E0A |

CODE_118E0D:
  LDA $1105                                 ; $118E0D |
  BPL CODE_118E16                           ; $118E10 |
  LDA #$06                                  ; $118E12 |
  BRA CODE_118E18                           ; $118E14 |

CODE_118E16:
  LDA #$07                                  ; $118E16 |

CODE_118E18:
  STA !s_player_cur_anim_frame              ; $118E18 |
  RTS                                       ; $118E1B |

  LDY $1154                                 ; $118E1C |
  LDA $1144                                 ; $118E1F |
  BEQ CODE_118E29                           ; $118E22 |
  DEC $1144                                 ; $118E24 |
  BRA CODE_118E39                           ; $118E27 |

CODE_118E29:
  INY                                       ; $118E29 |
  CPY #$11                                  ; $118E2A |
  BCC CODE_118E30                           ; $118E2C |
  LDY #$10                                  ; $118E2E |

CODE_118E30:
  STY $1154                                 ; $118E30 |
  LDA $8E6A,y                               ; $118E33 |
  STA $1144                                 ; $118E36 |

CODE_118E39:
  LDA $8E59,y                               ; $118E39 |
  STA !s_player_cur_anim_frame              ; $118E3C |
  CPY #$10                                  ; $118E3F |
  BNE CODE_118E58                           ; $118E41 |
  LDA !s_spr_x_pixel_pos                    ; $118E43 |
  CLC                                       ; $118E46 |
  ADC #$28                                  ; $118E47 |
  STA $70EA                                 ; $118E49 |
  LDA !s_spr_y_pixel_pos                    ; $118E4C |
  CLC                                       ; $118E4F |
  ADC #$24                                  ; $118E50 |
  STA $718A                                 ; $118E52 |
  JSR CODE_118F1F                           ; $118E55 |

CODE_118E58:
  RTS                                       ; $118E58 |

  db $74, $73, $72, $71, $70, $6F, $74, $73 ; $118E59 |
  db $72, $71, $70, $6F, $6C, $6D, $6E, $6D ; $118E61 |
  db $6E                                    ; $118E69 |

  db $03, $03, $03, $03, $03, $03, $03, $03 ; $118E6A |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $118E72 |
  db $03, $60                               ; $118E7A |

  LDA $10F2                                 ; $118E7C |
  BEQ CODE_118E85                           ; $118E7F |
  LDY #$00                                  ; $118E81 |
  BRA CODE_118EE4                           ; $118E83 |

CODE_118E85:
  DEC !s_spr_wildcard_6_lo                  ; $118E85 |
  LDA !s_spr_wildcard_6_lo                  ; $118E88 |
  BNE CODE_118EB2                           ; $118E8B |
  LDA !s_spr_wildcard_5_lo                  ; $118E8D |
  INC A                                     ; $118E90 |
  INC A                                     ; $118E91 |
  CMP #$1E                                  ; $118E92 |
  BCC CODE_118E98                           ; $118E94 |
  LDA #$1E                                  ; $118E96 |

CODE_118E98:
  STA !s_spr_wildcard_5_lo                  ; $118E98 |
  LSR A                                     ; $118E9B |
  TAY                                       ; $118E9C |
  LDA $8F0F,y                               ; $118E9D |
  STA !s_spr_wildcard_6_lo                  ; $118EA0 |
  CPY #$04                                  ; $118EA3 |
  BNE CODE_118EB2                           ; $118EA5 |
  LDA #$FC                                  ; $118EA7 |
  STA $1105                                 ; $118EA9 |
  STZ $1104                                 ; $118EAC |
  STZ $1124                                 ; $118EAF |

CODE_118EB2:
  LDA $1105                                 ; $118EB2 |
  BNE CODE_118EBE                           ; $118EB5 |
  LDA !s_spr_y_pixel_pos                    ; $118EB7 |
  CMP #$B0                                  ; $118EBA |
  BEQ CODE_118EE1                           ; $118EBC |

CODE_118EBE:
  LDA #$20                                  ; $118EBE |
  STA $00                                   ; $118EC0 |
  LDA #$04                                  ; $118EC2 |
  STA $02                                   ; $118EC4 |
  LDX #$00                                  ; $118EC6 |
  TXA                                       ; $118EC8 |
  JSR CODE_119073                           ; $118EC9 |
  LDA !s_spr_y_pixel_pos                    ; $118ECC |
  CMP #$B0                                  ; $118ECF |
  BCC CODE_118EE1                           ; $118ED1 |
  LDA #$B0                                  ; $118ED3 |
  STA !s_spr_y_pixel_pos                    ; $118ED5 |
  STZ $1105                                 ; $118ED8 |
  STZ $1104                                 ; $118EDB |
  STZ $1124                                 ; $118EDE |

CODE_118EE1:
  LDY !s_spr_wildcard_5_lo                  ; $118EE1 |

CODE_118EE4:
  REP #$20                                  ; $118EE4 |
  LDA $8EEF,y                               ; $118EE6 |
  STA !s_player_cur_anim_frame              ; $118EE9 |
  SEP #$20                                  ; $118EEC |
  RTS                                       ; $118EEE |

  dw $0000, $01AA, $01AC, $01AD             ; $118EEF |
  dw $01AB, $0021, $0022, $0023             ; $118EF7 |
  dw $0024, $0025, $0026, $0027             ; $118EFF |
  dw $01AC, $01AD, $01AC, $0000             ; $118F07 |

  dw $2030, $0802, $030C, $0303             ; $118F0F |
  dw $0303, $2203, $0402, $FF02             ; $118F17 |

CODE_118F1F:
  LDA $114C                                 ; $118F1F |
  BEQ CODE_118F29                           ; $118F22 |
  DEC $114C                                 ; $118F24 |
  BRA CODE_118F3B                           ; $118F27 |

CODE_118F29:
  INC $115C                                 ; $118F29 |
  LDA #$03                                  ; $118F2C |
  STA $114C                                 ; $118F2E |
  LDA $115C                                 ; $118F31 |
  CMP #$06                                  ; $118F34 |
  BNE CODE_118F3B                           ; $118F36 |
  STZ $115C                                 ; $118F38 |

CODE_118F3B:
  LDA $115C                                 ; $118F3B |
  ASL A                                     ; $118F3E |
  ASL A                                     ; $118F3F |
  ASL A                                     ; $118F40 |
  TAX                                       ; $118F41 |
  REP #$30                                  ; $118F42 |
  LDA #$0004                                ; $118F44 |
  STA $00                                   ; $118F47 |
  LDY !s_oam_next_free_slot_ptr             ; $118F49 |

CODE_118F4C:
  LDA $8F7E,x                               ; $118F4C |
  CLC                                       ; $118F4F |
  ADC $70EA                                 ; $118F50 |
  STA $6000,y                               ; $118F53 |
  LDA #$FFE0                                ; $118F56 |
  CLC                                       ; $118F59 |
  ADC $718A                                 ; $118F5A |
  STA $6002,y                               ; $118F5D |
  LDA $8FAE,x                               ; $118F60 |
  STA $6004,y                               ; $118F63 |
  LDA #$0000                                ; $118F66 |
  STA $6006,y                               ; $118F69 |
  INX                                       ; $118F6C |
  INX                                       ; $118F6D |
  TYA                                       ; $118F6E |
  CLC                                       ; $118F6F |
  ADC #$0008                                ; $118F70 |
  TAY                                       ; $118F73 |
  DEC $00                                   ; $118F74 |
  BNE CODE_118F4C                           ; $118F76 |
  STY !s_oam_next_free_slot_ptr             ; $118F78 |
  SEP #$30                                  ; $118F7B |
  RTS                                       ; $118F7D |

  dw $FFEC, $FFEC, $FFF8, $FFE0             ; $118F7E |
  dw $FFEF, $FFE9, $FFF7, $FFE1             ; $118F86 |
  dw $FFE2, $FFF2, $FFE6, $FFF6             ; $118F8E |
  dw $FFE4, $FFF4, $FFE4, $FFF4             ; $118F96 |
  dw $FFE6, $FFF6, $FFE2, $FFF2             ; $118F9E |
  dw $FFE9, $FFF7, $FFE1, $FFEF             ; $118FA6 |

  dw $351A, $350A, $350A, $351A             ; $118FAE |
  dw $351A, $350A, $350A, $351A             ; $118FB6 |
  dw $351A, $351A, $350A, $350A             ; $118FBE |
  dw $351A, $351A, $350A, $350A             ; $118FC6 |
  dw $351A, $351A, $350A, $350A             ; $118FCE |
  dw $351A, $351A, $350A, $350A             ; $118FD6 |

CODE_118FDE:
  LDY $116A                                 ; $118FDE |
  INC $1168                                 ; $118FE1 |
  LDA $1168                                 ; $118FE4 |
  CMP $9055,y                               ; $118FE7 |
  BCC CODE_118FF2                           ; $118FEA |
  STZ $1168                                 ; $118FEC |
  INC $116A                                 ; $118FEF |

CODE_118FF2:
  TYA                                       ; $118FF2 |
  ASL A                                     ; $118FF3 |
  TAY                                       ; $118FF4 |
  LDA $9002,y                               ; $118FF5 |
  STA $00                                   ; $118FF8 |
  LDA $9003,y                               ; $118FFA |
  STA $01                                   ; $118FFD |
  JMP ($0000)                               ; $118FFF |

  dw $9014                                  ; $119002 |
  dw $9034                                  ; $119004 |
  dw $9034                                  ; $119006 |
  dw $9014                                  ; $119008 |
  dw $9014                                  ; $11900A |
  dw $9034                                  ; $11900C |
  dw $9034                                  ; $11900E |
  dw $9014                                  ; $119010 |
  dw $9014                                  ; $119012 |

  REP #$20                                  ; $119014 |
  LDA $1100                                 ; $119016 |
  SEC                                       ; $119019 |
  SBC $905F,y                               ; $11901A |
  STA $1100                                 ; $11901D |
  LDA $10FE                                 ; $119020 |
  CLC                                       ; $119023 |
  ADC $905F,y                               ; $119024 |
  CMP #$01FF                                ; $119027 |
  BCC CODE_11902F                           ; $11902A |
  LDA #$01FF                                ; $11902C |

CODE_11902F:
  STA $10FE                                 ; $11902F |
  BRA CODE_119052                           ; $119032 |
  REP #$20                                  ; $119034 |
  LDA $10FE                                 ; $119036 |
  SEC                                       ; $119039 |
  SBC $905F,y                               ; $11903A |
  STA $10FE                                 ; $11903D |
  LDA $1100                                 ; $119040 |
  CLC                                       ; $119043 |
  ADC $905F,y                               ; $119044 |
  CMP #$01FF                                ; $119047 |
  BCC CODE_11904F                           ; $11904A |
  LDA #$01FF                                ; $11904C |

CODE_11904F:
  STA $1100                                 ; $11904F |

CODE_119052:
  SEP #$20                                  ; $119052 |
  RTS                                       ; $119054 |

  dw $1310, $1010, $0E0E, $0E0E             ; $119055 |
  dw $0E0E, $0006, $0005, $0004             ; $11905D |
  dw $0004, $0004, $0004, $0004             ; $119065 |
  dw $0003, $0003, $0003                    ; $11906D |

CODE_119073:
  PHA                                       ; $119073 |
  LDA $1124,x                               ; $119074 |
  CLC                                       ; $119077 |
  ADC $1104,x                               ; $119078 |
  STA $1124,x                               ; $11907B |
  LDY #$00                                  ; $11907E |
  LDA $1105,x                               ; $119080 |
  BPL CODE_119086                           ; $119083 |
  DEY                                       ; $119085 |

CODE_119086:
  STY $07                                   ; $119086 |
  ADC !s_spr_y_pixel_pos,x                  ; $119088 |
  STA !s_spr_y_pixel_pos,x                  ; $11908B |
  LDA !s_spr_y_screen_pos,x                 ; $11908E |
  ADC $07                                   ; $119091 |
  STA !s_spr_y_screen_pos,x                 ; $119093 |
  LDA $1104,x                               ; $119096 |
  CLC                                       ; $119099 |
  ADC $00                                   ; $11909A |
  STA $1104,x                               ; $11909C |
  LDA $1105,x                               ; $11909F |
  ADC #$00                                  ; $1190A2 |
  STA $1105,x                               ; $1190A4 |
  CMP $02                                   ; $1190A7 |
  BMI CODE_1190BA                           ; $1190A9 |
  LDA $1104,x                               ; $1190AB |
  CMP #$80                                  ; $1190AE |
  BCC CODE_1190BA                           ; $1190B0 |
  LDA $02                                   ; $1190B2 |
  STA $1105,x                               ; $1190B4 |
  STZ $1104,x                               ; $1190B7 |

CODE_1190BA:
  PLA                                       ; $1190BA |
  BEQ CODE_1190EA                           ; $1190BB |
  LDA $02                                   ; $1190BD |
  EOR #$FF                                  ; $1190BF |
  INC A                                     ; $1190C1 |
  STA $07                                   ; $1190C2 |
  LDA $1104,x                               ; $1190C4 |
  SEC                                       ; $1190C7 |
  SBC $01                                   ; $1190C8 |
  STA $1104,x                               ; $1190CA |
  LDA $1105,x                               ; $1190CD |
  SBC #$00                                  ; $1190D0 |
  STA $1105,x                               ; $1190D2 |
  CMP $07                                   ; $1190D5 |
  BPL CODE_1190EA                           ; $1190D7 |
  LDA $1104,x                               ; $1190D9 |
  CMP #$80                                  ; $1190DC |
  BCS CODE_1190EA                           ; $1190DE |
  LDA $07                                   ; $1190E0 |
  STA $1105,x                               ; $1190E2 |
  LDA #$FF                                  ; $1190E5 |
  STA $1104,x                               ; $1190E7 |

CODE_1190EA:
  RTS                                       ; $1190EA |

CODE_1190EB:
  LDA !s_spr_x_speed_lo,x                   ; $1190EB |
  ASL A                                     ; $1190EE |
  ASL A                                     ; $1190EF |
  ASL A                                     ; $1190F0 |
  ASL A                                     ; $1190F1 |
  STA $01                                   ; $1190F2 |
  LDA !s_spr_x_speed_lo,x                   ; $1190F4 |
  LSR A                                     ; $1190F7 |
  LSR A                                     ; $1190F8 |
  LSR A                                     ; $1190F9 |
  LSR A                                     ; $1190FA |
  CMP #$08                                  ; $1190FB |
  BCC CODE_119101                           ; $1190FD |
  ORA #$F0                                  ; $1190FF |

CODE_119101:
  STA $00                                   ; $119101 |
  LDY #$00                                  ; $119103 |
  CMP #$00                                  ; $119105 |
  BPL CODE_11910A                           ; $119107 |
  DEY                                       ; $119109 |

CODE_11910A:
  STY $02                                   ; $11910A |
  LDA $1134,x                               ; $11910C |
  CLC                                       ; $11910F |
  ADC $01                                   ; $119110 |
  STA $1134,x                               ; $119112 |
  LDA #$00                                  ; $119115 |
  ROL A                                     ; $119117 |
  PHA                                       ; $119118 |
  ROR A                                     ; $119119 |
  LDA !s_spr_x_pixel_pos,x                  ; $11911A |
  ADC $00                                   ; $11911D |
  STA !s_spr_x_pixel_pos,x                  ; $11911F |
  LDA !s_spr_x_screen_pos,x                 ; $119122 |
  ADC $02                                   ; $119125 |
  STA !s_spr_x_screen_pos,x                 ; $119127 |
  PLA                                       ; $11912A |
  CLC                                       ; $11912B |
  ADC $00                                   ; $11912C |
  RTS                                       ; $11912E |

CODE_11912F:
  LDA !r_msg_box_state                      ; $11912F |
  BNE CODE_119168                           ; $119132 |

CODE_119134:
  REP #$20                                  ; $119134 |
  LDA $1100                                 ; $119136 |
  STA !gsu_r11                              ; $119139 |
  LDA $10FE                                 ; $11913C |
  STA !gsu_r6                               ; $11913F |
  LDA $1102                                 ; $119142 |
  STA !gsu_r5                               ; $119145 |
  LDA #$0054                                ; $119148 |
  STA !gsu_r13                              ; $11914B |
  LDA #$C0E1                                ; $11914E |
  STA !gsu_r12                              ; $119151 |
  STZ !gsu_r3                               ; $119154 |
  STZ !gsu_r2                               ; $119157 |
  LDX #$08                                  ; $11915A |
  LDA #$8945                                ; $11915C |
  JSL r_gsu_init_1                          ; $11915F | GSU init
  INC $0CF9                                 ; $119163 |
  SEP #$30                                  ; $119166 |

CODE_119168:
  RTS                                       ; $119168 |

CODE_119169:
  REP #$30                                  ; $119169 |
  LDA $10E6                                 ; $11916B |
  BEQ CODE_119175                           ; $11916E |
  LDA #$009E                                ; $119170 |
  BRA CODE_119178                           ; $119173 |

CODE_119175:
  LDA #$009D                                ; $119175 |

CODE_119178:
  STA $00                                   ; $119178 |
  ASL A                                     ; $11917A |
  CLC                                       ; $11917B |
  ADC $00                                   ; $11917C |
  TAX                                       ; $11917E |
  LDA $06F95E,x                             ; $11917F |
  STA !gsu_r9                               ; $119183 |
  LDA $06F960,x                             ; $119186 |
  AND #$00FF                                ; $11918A |
  STA !gsu_r4                               ; $11918D |
  LDA #$4E00                                ; $119190 |
  STA !gsu_r10                              ; $119193 |
  SEP #$10                                  ; $119196 |
  LDX #$08                                  ; $119198 |
  LDA #$A980                                ; $11919A |
  JSL r_gsu_init_1                          ; $11919D | GSU init
  REP #$30                                  ; $1191A1 |
  LDX #$4E00                                ; $1191A3 |
  LDA #$0070                                ; $1191A6 |
  STA $01                                   ; $1191A9 |
  LDY #$3C00                                ; $1191AB |
  LDA #$0800                                ; $1191AE |
  JSL $00BEA6                               ; $1191B1 |
  SEP #$30                                  ; $1191B5 |
  RTS                                       ; $1191B7 |

  SEP #$20                                  ; $1191B8 |
  PHB                                       ; $1191BA |
  LDA #$11                                  ; $1191BB |
  PHA                                       ; $1191BD |
  PLB                                       ; $1191BE |
  JSR CODE_1191C4                           ; $1191BF |
  PLB                                       ; $1191C2 |
  RTL                                       ; $1191C3 |

CODE_1191C4:
  SEP #$20                                  ; $1191C4 |
  LDA $10E2                                 ; $1191C6 |
  DEC A                                     ; $1191C9 |
  ASL A                                     ; $1191CA |
  TAY                                       ; $1191CB |
  LDA $91D9,y                               ; $1191CC |
  STA $00                                   ; $1191CF |
  LDA $91DA,y                               ; $1191D1 |
  STA $01                                   ; $1191D4 |
  JMP ($0000)                               ; $1191D6 |

  dw $922A                                  ; $1191D9 |
  dw $92B6                                  ; $1191DB |
  dw $91DF                                  ; $1191DD |

  REP #$20                                  ; $1191DF |
  DEC !r_bg2_cam_y                          ; $1191E1 |
  INC !r_bg2_cam_x                          ; $1191E4 |
  LDA $10E6                                 ; $1191E7 |
  BNE CODE_1191FE                           ; $1191EA |
  LDA $10FA                                 ; $1191EC |
  BEQ CODE_11920D                           ; $1191EF |
  LDA $03A7                                 ; $1191F1 |
  CMP #$0014                                ; $1191F4 |
  BEQ CODE_1191FE                           ; $1191F7 |
  LDA !s_player_jump_state                  ; $1191F9 |
  BNE CODE_11920D                           ; $1191FC |

CODE_1191FE:
  LDA #$0001                                ; $1191FE |
  STA $10F4                                 ; $119201 |
  DEC $10E4                                 ; $119204 |
  BNE CODE_11920D                           ; $119207 |
  JSL $11AD2A                               ; $119209 |

CODE_11920D:
  SEP #$20                                  ; $11920D |
  LDA $10FC                                 ; $11920F |
  BEQ CODE_119229                           ; $119212 |
  DEC $10FC                                 ; $119214 |
  BNE CODE_119229                           ; $119217 |
  LDA $03A7                                 ; $119219 |
  CMP #$06                                  ; $11921C |
  BCC CODE_119229                           ; $11921E |
  CMP #$14                                  ; $119220 |
  BCS CODE_119229                           ; $119222 |
  LDA #$06                                  ; $119224 |
  STA !r_apu_io_0_mirror                    ; $119226 |

CODE_119229:
  RTS                                       ; $119229 |

  JSR CODE_119169                           ; $11922A |
  SEP #$20                                  ; $11922D |
  LDA #$42                                  ; $11922F |
  STA $4350                                 ; $119231 |
  LDA #$0F                                  ; $119234 |
  STA $4351                                 ; $119236 |
  LDA #$98                                  ; $119239 |
  STA $4352                                 ; $11923B |
  LDA #$5B                                  ; $11923E |
  STA $4353                                 ; $119240 |
  LDA #$7E                                  ; $119243 |
  STA $4354                                 ; $119245 |
  LDA #$7E                                  ; $119248 |
  STA $4357                                 ; $11924A |
  PHB                                       ; $11924D |
  LDA #$7E                                  ; $11924E |
  PHA                                       ; $119250 |
  PLB                                       ; $119251 |
  STZ $5040                                 ; $119252 |
  STZ $5042                                 ; $119255 |
  STZ $5BAD                                 ; $119258 |
  LDA #$20                                  ; $11925B |
  STA $5B98                                 ; $11925D |
  STA $5B9B                                 ; $119260 |
  STA $5B9E                                 ; $119263 |
  STA $5BA1                                 ; $119266 |
  STA $5BA4                                 ; $119269 |
  STA $5BA7                                 ; $11926C |
  STA $5BAA                                 ; $11926F |
  REP #$20                                  ; $119272 |
  LDA #$5040                                ; $119274 |
  STA $5B99                                 ; $119277 |
  STA $5B9F                                 ; $11927A |
  STA $5BA5                                 ; $11927D |
  STA $5BAB                                 ; $119280 |
  LDA #$5042                                ; $119283 |
  STA $5B9C                                 ; $119286 |
  STA $5BA2                                 ; $119289 |
  STA $5BA8                                 ; $11928C |
  SEP #$20                                  ; $11928F |
  PLB                                       ; $119291 |
  LDX $10E6                                 ; $119292 |
  LDA $92B3,x                               ; $119295 |
  STA !r_apu_io_0_mirror                    ; $119298 |
  LDA #$20                                  ; $11929B |
  TSB !r_reg_hdmaen_mirror                  ; $11929D |
  INC $10E2                                 ; $1192A0 |
  LDA $10F6                                 ; $1192A3 |
  BEQ CODE_1192AB                           ; $1192A6 |
  JSR CODE_11942C                           ; $1192A8 |

CODE_1192AB:
  JSR CODE_119305                           ; $1192AB |
  JSL $119CCB                               ; $1192AE |
  RTS                                       ; $1192B2 |

  db $05, $07, $06                          ; $1192B3 |

  REP #$20                                  ; $1192B6 |
  LDA $10E0                                 ; $1192B8 |
  CLC                                       ; $1192BB |
  ADC #$0008                                ; $1192BC |
  STA $10E0                                 ; $1192BF |
  CMP #$0100                                ; $1192C2 |
  BCC CODE_119302                           ; $1192C5 |
  SEP #$20                                  ; $1192C7 |
  LDA !r_reg_hdmaen_mirror                  ; $1192C9 |
  EOR #$20                                  ; $1192CC |
  STA !r_reg_hdmaen_mirror                  ; $1192CE |
  LDA #$01                                  ; $1192D1 |
  STA $003E                                 ; $1192D3 |
  STZ !r_bg2_cam_x                          ; $1192D6 |
  LDA #$3C                                  ; $1192D9 |
  STA !r_reg_bg2sc_mirror                   ; $1192DB |
  STA !reg_bg2sc                            ; $1192DE |
  INC $10E2                                 ; $1192E1 |
  LDA $10E6                                 ; $1192E4 |
  BNE CODE_1192F4                           ; $1192E7 |
  LDA $03A7                                 ; $1192E9 |
  CMP #$06                                  ; $1192EC |
  BCC CODE_1192F4                           ; $1192EE |
  CMP #$14                                  ; $1192F0 |
  BCC CODE_1192F8                           ; $1192F2 |

CODE_1192F4:
  LDA #$E0                                  ; $1192F4 |
  BRA CODE_1192FA                           ; $1192F6 |

CODE_1192F8:
  LDA #$01                                  ; $1192F8 |

CODE_1192FA:
  STA $10E4                                 ; $1192FA |
  LDA #$FF                                  ; $1192FD |
  STA $10FC                                 ; $1192FF |

CODE_119302:
  SEP #$20                                  ; $119302 |
  RTS                                       ; $119304 |

CODE_119305:
  REP #$30                                  ; $119305 |
  LDA $7E4000                               ; $119307 |
  TAX                                       ; $11930B |
  LDA $10F2                                 ; $11930C |
  BEQ CODE_119314                           ; $11930F |
  LDA #$0003                                ; $119311 |

CODE_119314:
  CLC                                       ; $119314 |
  ADC $10E6                                 ; $119315 |
  ASL A                                     ; $119318 |
  TAY                                       ; $119319 |
  LDA $9336,y                               ; $11931A |
  TAY                                       ; $11931D |

CODE_11931E:
  LDA $9340,y                               ; $11931E |
  STA $7E4002,x                             ; $119321 |
  INX                                       ; $119325 |
  INX                                       ; $119326 |
  INY                                       ; $119327 |
  INY                                       ; $119328 |
  INC A                                     ; $119329 |
  BNE CODE_11931E                           ; $11932A |
  DEX                                       ; $11932C |
  DEX                                       ; $11932D |
  TXA                                       ; $11932E |
  STA $7E4000                               ; $11932F |
  SEP #$30                                  ; $119333 |
  RTS                                       ; $119335 |

  db $00, $00, $BA, $00, $EC, $00, $2E, $00 ; $119336 |
  db $74, $00                               ; $11933E |

  dw $35AC, $0011, $2520, $2521             ; $119340 |
  dw $2522, $217F, $2523, $2524             ; $119348 |
  dw $E532, $257F, $A530, $35CC             ; $119350 |
  dw $0011, $2530, $A521, $A521             ; $119358 |
  dw $217F, $2533, $2534, $2532             ; $119360 |
  dw $257F, $2529, $FFFF, $35A9             ; $119368 |
  dw $001D, $2527, $2525, $2521             ; $119370 |
  dw $2520, $2526, $2527, $217F             ; $119378 |
  dw $254E, $217F, $2523, $2524             ; $119380 |
  dw $E532, $E531, $217F, $A530             ; $119388 |
  dw $35C9, $001D, $2539, $2535             ; $119390 |
  dw $2536, $2530, $2535, $2537             ; $119398 |
  dw $217F, $255E, $217F, $2533             ; $1193A0 |
  dw $2534, $2532, $2531, $217F             ; $1193A8 |
  dw $2529, $FFFF, $35AA, $001D             ; $1193B0 |
  dw $2D27, $2D25, $2D21, $2D20             ; $1193B8 |
  dw $2D26, $2D27, $217F, $2D4F             ; $1193C0 |
  dw $217F, $2D23, $2D24, $ED32             ; $1193C8 |
  dw $ED31, $217F, $AD30, $35CA             ; $1193D0 |
  dw $001D, $2D39, $2D35, $2D36             ; $1193D8 |
  dw $2D30, $2D35, $2D37, $217F             ; $1193E0 |
  dw $2D5F, $217F, $2D33, $2D34             ; $1193E8 |
  dw $2D32, $2D31, $217F, $2D29             ; $1193F0 |
  dw $FFFF, $35AC, $0013, $2D20             ; $1193F8 |
  dw $2D21, $2D22, $217F, $2D25             ; $119400 |
  dw $2D21, $ED31, $2D26, $217F             ; $119408 |
  dw $AD30, $35CC, $0013, $2D30             ; $119410 |
  dw $AD21, $AD21, $217F, $2D35             ; $119418 |
  dw $AD21, $2D31, $2D35, $217F             ; $119420 |
  dw $2D29, $FFFF                           ; $119428 |

CODE_11942C:
  LDA $1170                                 ; $11942C |
  SEC                                       ; $11942F |
  SBC #$03                                  ; $119430 |
  ASL A                                     ; $119432 |
  TAX                                       ; $119433 |
  REP #$30                                  ; $119434 |
  LDA $9457,x                               ; $119436 |
  TAY                                       ; $119439 |
  LDA $7E4000                               ; $11943A |
  TAX                                       ; $11943E |

CODE_11943F:
  LDA $945D,y                               ; $11943F |
  STA $7E4002,x                             ; $119442 |
  INX                                       ; $119446 |
  INX                                       ; $119447 |
  INY                                       ; $119448 |
  INY                                       ; $119449 |
  INC A                                     ; $11944A |
  BNE CODE_11943F                           ; $11944B |
  DEX                                       ; $11944D |
  DEX                                       ; $11944E |
  TXA                                       ; $11944F |
  STA $7E4000                               ; $119450 |
  SEP #$30                                  ; $119454 |
  RTS                                       ; $119456 |

  db $00, $00, $5E, $00, $CC, $00           ; $119457 |

  dw $34C5, $8007, $A555, $2545             ; $11945D |
  dw $2545, $2545, $34DA, $8007             ; $119465 |
  dw $E555, $6545, $6545, $6545             ; $11946D |
  dw $34C6, $4027, $A556, $3547             ; $119475 |
  dw $4023, $2560, $3567, $4023             ; $11947D |
  dw $2560, $68E7, $4023, $00FF             ; $119485 |
  dw $6907, $4023, $00FF, $6927             ; $11948D |
  dw $4023, $00FF, $3545, $0003             ; $119495 |
  dw $2565, $2566, $3565, $0003             ; $11949D |
  dw $2555, $2576, $3559, $0003             ; $1194A5 |
  dw $6572, $6570, $3579, $0003             ; $1194AD |
  dw $6574, $6573, $FFFF, $34C3             ; $1194B5 |
  dw $8007, $A555, $2545, $2545             ; $1194BD |
  dw $2545, $34DC, $8007, $E555             ; $1194C5 |
  dw $6545, $6545, $6545, $34C4             ; $1194CD |
  dw $402F, $A556, $3545, $4027             ; $1194D5 |
  dw $2560, $3565, $4027, $2560             ; $1194DD |
  dw $68E5, $402B, $00FF, $6905             ; $1194E5 |
  dw $402B, $00FF, $6925, $402B             ; $1194ED |
  dw $00FF, $3543, $0007, $2570             ; $1194F5 |
  dw $2571, $2567, $2566, $3563             ; $1194FD |
  dw $0007, $2573, $2574, $2575             ; $119505 |
  dw $2576, $3559, $0007, $6572             ; $11950D |
  dw $2571, $2571, $6570, $3579             ; $119515 |
  dw $0007, $6574, $2574, $2574             ; $11951D |
  dw $6573, $FFFF, $34C1, $8007             ; $119525 |
  dw $A555, $2545, $2545, $2545             ; $11952D |
  dw $34DE, $8007, $E555, $6545             ; $119535 |
  dw $6545, $6545, $34C2, $4037             ; $11953D |
  dw $A556, $3543, $402B, $2560             ; $119545 |
  dw $3563, $402B, $2560, $68E3             ; $11954D |
  dw $4033, $00FF, $6903, $4033             ; $119555 |
  dw $00FF, $6923, $4033, $00FF             ; $11955D |
  dw $3541, $000B, $2570, $2571             ; $119565 |
  dw $2571, $2571, $2567, $2566             ; $11956D |
  dw $3561, $000B, $2573, $2574             ; $119575 |
  dw $2574, $2574, $2575, $2576             ; $11957D |
  dw $3559, $000B, $6572, $2571             ; $119585 |
  dw $2571, $2571, $2571, $6570             ; $11958D |
  dw $3579, $000B, $6574, $2574             ; $119595 |
  dw $2574, $2574, $2574, $6573             ; $11959D |
  dw $FFFF                                  ; $1195A5 |

CODE_1195A7:
  REP #$20                                  ; $1195A7 |
  LDA $118C                                 ; $1195A9 |
  STA $116C                                 ; $1195AC |
  STZ $1190                                 ; $1195AF |
  LDA #$0048                                ; $1195B2 |
  STA $1192                                 ; $1195B5 |
  STZ $116E                                 ; $1195B8 |
  JSR CODE_119BF4                           ; $1195BB |
  REP #$20                                  ; $1195BE |
  LDA $1170                                 ; $1195C0 |
  ASL A                                     ; $1195C3 |
  TAX                                       ; $1195C4 |

CODE_1195C5:
  JSL random_number_gen                     ; $1195C5 |
  LDA !s_rng                                ; $1195C9 |
  AND #$000E                                ; $1195CC |
  TAY                                       ; $1195CF |
  LDA $96B7,y                               ; $1195D0 |
  CMP $1174,x                               ; $1195D3 |
  BEQ CODE_1195C5                           ; $1195D6 |
  STA $1172,x                               ; $1195D8 |
  LDA $96C7,y                               ; $1195DB |
  STA $117E,x                               ; $1195DE |
  DEX                                       ; $1195E1 |
  DEX                                       ; $1195E2 |
  BPL CODE_1195C5                           ; $1195E3 |
  SEP #$20                                  ; $1195E5 |
  RTS                                       ; $1195E7 |

CODE_1195E8:
  REP #$30                                  ; $1195E8 |
  LDX $1170                                 ; $1195EA |
  LDA $9767,x                               ; $1195ED |
  AND #$00FF                                ; $1195F0 |
  STA $0A                                   ; $1195F3 |
  LDA $7E4000                               ; $1195F5 |
  TAX                                       ; $1195F9 |
  LDA #$68A4                                ; $1195FA |
  CLC                                       ; $1195FD |
  ADC $0A                                   ; $1195FE |
  STA $7E4002,x                             ; $119600 |
  LDA $1170                                 ; $119604 |
  INC A                                     ; $119607 |
  ASL A                                     ; $119608 |
  ASL A                                     ; $119609 |
  DEC A                                     ; $11960A |
  ASL A                                     ; $11960B |
  DEC A                                     ; $11960C |
  ORA #$4000                                ; $11960D |
  STA $7E4004,x                             ; $119610 |
  LDA #$31DF                                ; $119614 |
  STA $7E4006,x                             ; $119617 |
  TXA                                       ; $11961B |
  CLC                                       ; $11961C |
  ADC #$0006                                ; $11961D |
  TAX                                       ; $119620 |
  LDY #$0000                                ; $119621 |

CODE_119624:
  TYA                                       ; $119624 |
  ASL A                                     ; $119625 |
  ASL A                                     ; $119626 |
  CLC                                       ; $119627 |
  ADC #$6884                                ; $119628 |
  CLC                                       ; $11962B |
  ADC $0A                                   ; $11962C |
  STA $7E4002,x                             ; $11962E |
  CLC                                       ; $119632 |
  ADC #$0020                                ; $119633 |
  STA $7E400C,x                             ; $119636 |
  CLC                                       ; $11963A |
  ADC #$0020                                ; $11963B |
  STA $7E4016,x                             ; $11963E |
  LDA #$0005                                ; $119642 |
  STA $7E4004,x                             ; $119645 |
  STA $7E400E,x                             ; $119649 |
  STA $7E4018,x                             ; $11964D |
  PHY                                       ; $119651 |
  TYA                                       ; $119652 |
  ASL A                                     ; $119653 |
  TAY                                       ; $119654 |
  LDA $117E,y                               ; $119655 |
  TAY                                       ; $119658 |
  LDA $96D7,y                               ; $119659 |
  STA $7E4006,x                             ; $11965C |
  LDA $96D9,y                               ; $119660 |
  STA $7E4008,x                             ; $119663 |
  LDA $96DB,y                               ; $119667 |
  STA $7E400A,x                             ; $11966A |
  LDA $96DD,y                               ; $11966E |
  STA $7E4010,x                             ; $119671 |
  LDA $96DF,y                               ; $119675 |
  STA $7E4012,x                             ; $119678 |
  LDA $96E1,y                               ; $11967C |
  STA $7E4014,x                             ; $11967F |
  LDA $96E3,y                               ; $119683 |
  STA $7E401A,x                             ; $119686 |
  LDA $96E5,y                               ; $11968A |
  STA $7E401C,x                             ; $11968D |
  LDA $96E7,y                               ; $119691 |
  STA $7E401E,x                             ; $119694 |
  PLY                                       ; $119698 |
  TXA                                       ; $119699 |
  CLC                                       ; $11969A |
  ADC #$001E                                ; $11969B |
  TAX                                       ; $11969E |
  CPY $1170                                 ; $11969F |
  BEQ CODE_1196A8                           ; $1196A2 |
  INY                                       ; $1196A4 |
  JMP CODE_119624                           ; $1196A5 |

CODE_1196A8:
  LDA #$FFFF                                ; $1196A8 |
  STA $7E4002,x                             ; $1196AB |
  TXA                                       ; $1196AF |
  STA $7E4000                               ; $1196B0 |
  SEP #$30                                  ; $1196B4 |
  RTS                                       ; $1196B6 |

  dw $0100, $0200, $0400, $0800             ; $1196B7 |
  dw $8000, $4000, $0080, $0040             ; $1196BF |

  dw $0000, $0012, $0024, $0036             ; $1196C7 |
  dw $0048, $005A, $006C, $007E             ; $1196CF |

  dw $3DCC, $3DCD, $75CC, $3DDC             ; $1196D7 |
  dw $3DDD, $75DC, $BDCC, $BDCD             ; $1196DF |
  dw $F5CC, $35CC, $3DCD, $7DCC             ; $1196E7 |
  dw $35DC, $3DDD, $7DDC, $B5CC             ; $1196EF |
  dw $BDCD, $FDCC, $3DCC, $3DCD             ; $1196F7 |
  dw $7DCC, $3DDC, $3DDD, $7DDC             ; $1196FF |
  dw $B5CC, $B5CD, $F5CC, $35CC             ; $119707 |
  dw $35CD, $75CC, $3DDC, $3DDD             ; $11970F |
  dw $7DDC, $BDCC, $BDCD, $FDCC             ; $119717 |
  dw $29CE, $29CF, $69CE, $29DE             ; $11971F |
  dw $29EF, $69DE, $A9CE, $A9CF             ; $119727 |
  dw $E9CE, $2DCE, $2DCF, $6DCE             ; $11972F |
  dw $2DDE, $2DFE, $6DDE, $ADCE             ; $119737 |
  dw $ADCF, $EDCE, $35CE, $35CF             ; $11973F |
  dw $75CE, $35DE, $35EE, $75DE             ; $119747 |
  dw $B5CE, $B5CF, $F5CE, $31CE             ; $11974F |
  dw $31CF, $71CE, $31DE, $31FF             ; $119757 |
  dw $71DE, $B1CE, $B1CF, $F1CE             ; $11975F |
  dw $0000, $6400, $6062                    ; $119767 |

CODE_11976D:
  REP #$30                                  ; $11976D |
  LDX $1170                                 ; $11976F |
  LDA $9767,x                               ; $119772 |
  AND #$00FF                                ; $119775 |
  STA $0A                                   ; $119778 |
  LDA $7E4000                               ; $11977A |
  TAX                                       ; $11977E |
  LDA #$68A4                                ; $11977F |
  CLC                                       ; $119782 |
  ADC $0A                                   ; $119783 |
  STA $7E4002,x                             ; $119785 |
  LDA $1170                                 ; $119789 |
  INC A                                     ; $11978C |
  ASL A                                     ; $11978D |
  ASL A                                     ; $11978E |
  DEC A                                     ; $11978F |
  ASL A                                     ; $119790 |
  DEC A                                     ; $119791 |
  ORA #$4000                                ; $119792 |
  STA $7E4004,x                             ; $119795 |
  LDA #$31DF                                ; $119799 |
  STA $7E4006,x                             ; $11979C |
  TXA                                       ; $1197A0 |
  CLC                                       ; $1197A1 |
  ADC #$0006                                ; $1197A2 |
  TAX                                       ; $1197A5 |
  LDY #$0000                                ; $1197A6 |

CODE_1197A9:
  TYA                                       ; $1197A9 |
  ASL A                                     ; $1197AA |
  ASL A                                     ; $1197AB |
  CLC                                       ; $1197AC |
  ADC #$6884                                ; $1197AD |
  CLC                                       ; $1197B0 |
  ADC $0A                                   ; $1197B1 |
  STA $7E4002,x                             ; $1197B3 |
  CLC                                       ; $1197B7 |
  ADC #$0020                                ; $1197B8 |
  STA $7E400C,x                             ; $1197BB |
  CLC                                       ; $1197BF |
  ADC #$0020                                ; $1197C0 |
  STA $7E4016,x                             ; $1197C3 |
  LDA #$0005                                ; $1197C7 |
  STA $7E4004,x                             ; $1197CA |
  STA $7E400E,x                             ; $1197CE |
  STA $7E4018,x                             ; $1197D2 |
  LDA $9833                                 ; $1197D6 |
  STA $7E4006,x                             ; $1197D9 |
  LDA $9835                                 ; $1197DD |
  STA $7E4008,x                             ; $1197E0 |
  LDA $9837                                 ; $1197E4 |
  STA $7E400A,x                             ; $1197E7 |
  LDA $9839                                 ; $1197EB |
  STA $7E4010,x                             ; $1197EE |
  LDA $983B                                 ; $1197F2 |
  STA $7E4012,x                             ; $1197F5 |
  LDA $983D                                 ; $1197F9 |
  STA $7E4014,x                             ; $1197FC |
  LDA $983F                                 ; $119800 |
  STA $7E401A,x                             ; $119803 |
  LDA $9841                                 ; $119807 |
  STA $7E401C,x                             ; $11980A |
  LDA $9843                                 ; $11980E |
  STA $7E401E,x                             ; $119811 |
  TXA                                       ; $119815 |
  CLC                                       ; $119816 |
  ADC #$001E                                ; $119817 |
  TAX                                       ; $11981A |
  CPY $1170                                 ; $11981B |
  BEQ CODE_119824                           ; $11981E |
  INY                                       ; $119820 |
  JMP CODE_1197A9                           ; $119821 |

CODE_119824:
  LDA #$FFFF                                ; $119824 |
  STA $7E4002,x                             ; $119827 |
  TXA                                       ; $11982B |
  STA $7E4000                               ; $11982C |
  SEP #$30                                  ; $119830 |
  RTS                                       ; $119832 |

  dw $75ED, $35EC, $35ED, $35FB             ; $119833 |
  dw $35FC, $35FD, $34FF, $35EB             ; $11983B |
  dw $34FF                                  ; $119843 |

CODE_119845:
  LDA $118A                                 ; $119845 |
  BEQ CODE_119859                           ; $119848 |
  DEC $118A                                 ; $11984A |
  BNE CODE_119855                           ; $11984D |
  STZ $116E                                 ; $11984F |
  JSR CODE_1195E8                           ; $119852 |

CODE_119855:
  JSR CODE_119B79                           ; $119855 |
  RTS                                       ; $119858 |

CODE_119859:
  JSR CODE_119B99                           ; $119859 |
  REP #$20                                  ; $11985C |
  DEC $116C                                 ; $11985E |
  BNE CODE_119887                           ; $119861 |

CODE_119863:
  LDA #$0090                                ; $119863 |\ play sound #$0090
  JSL push_sound_queue                      ; $119866 |/
  LDA #$0020                                ; $11986A |
  STA $118A                                 ; $11986D |
  LDA $118C                                 ; $119870 |
  STA $116C                                 ; $119873 |
  REP #$20                                  ; $119876 |
  LDA #$0048                                ; $119878 |
  STA $1192                                 ; $11987B |
  STZ $1190                                 ; $11987E |
  JSR CODE_119BF4                           ; $119881 |
  JMP CODE_1198FF                           ; $119884 |

CODE_119887:
  JSR CODE_119AC6                           ; $119887 |
  REP #$20                                  ; $11988A |
  LDA $116E                                 ; $11988C |
  ASL A                                     ; $11988F |
  TAX                                       ; $119890 |
  LDA $37                                   ; $119891 |
  BEQ CODE_1198FF                           ; $119893 |
  CMP $1172,x                               ; $119895 |
  BNE CODE_119863                           ; $119898 |
  LDA #$008F                                ; $11989A |\ play sound #$008F
  JSL push_sound_queue                      ; $11989D |/
  INC $116E                                 ; $1198A1 |
  LDA $1170                                 ; $1198A4 |
  CMP $116E                                 ; $1198A7 |
  BCC CODE_1198B1                           ; $1198AA |
  JSR CODE_119902                           ; $1198AC |
  BRA CODE_1198FF                           ; $1198AF |

CODE_1198B1:
  LDA #$0013                                ; $1198B1 |\ play sound #$0013
  JSL push_sound_queue                      ; $1198B4 |/
  LDA #$0008                                ; $1198B8 |\ play sound #$0008
  JSL push_sound_queue                      ; $1198BB |/
  LDA #$0034                                ; $1198BF |\ play sound #$0034
  JSL push_sound_queue                      ; $1198C2 |/
  SEP #$20                                  ; $1198C6 |
  LDA #$02                                  ; $1198C8 |
  STA !s_spr_wildcard_4_lo                  ; $1198CA |
  LDA #$01                                  ; $1198CD |
  STA $797C                                 ; $1198CF |
  STZ $1144                                 ; $1198D2 |
  STZ $1154                                 ; $1198D5 |
  LDA #$FD                                  ; $1198D8 |
  STA $1105                                 ; $1198DA |
  LDA #$FD                                  ; $1198DD |
  STA $1109                                 ; $1198DF |
  STZ $1104                                 ; $1198E2 |
  STZ $1108                                 ; $1198E5 |
  STZ $1124                                 ; $1198E8 |
  STZ $1128                                 ; $1198EB |
  LDA #$10                                  ; $1198EE |
  STA $7224                                 ; $1198F0 |
  STZ $1138                                 ; $1198F3 |
  STZ $1168                                 ; $1198F6 |
  STZ $116A                                 ; $1198F9 |
  JSR CODE_11942C                           ; $1198FC |

CODE_1198FF:
  SEP #$20                                  ; $1198FF |
  RTS                                       ; $119901 |

CODE_119902:
  REP #$30                                  ; $119902 |
  LDA $1170                                 ; $119904 |
  DEC A                                     ; $119907 |
  DEC A                                     ; $119908 |
  DEC A                                     ; $119909 |
  ASL A                                     ; $11990A |
  STA $00                                   ; $11990B |
  ASL A                                     ; $11990D |
  ASL A                                     ; $11990E |
  CLC                                       ; $11990F |
  ADC $00                                   ; $119910 |
  STA $00                                   ; $119912 |
  LDA $116E                                 ; $119914 |
  DEC A                                     ; $119917 |
  ASL A                                     ; $119918 |
  CLC                                       ; $119919 |
  ADC $00                                   ; $11991A |
  TAY                                       ; $11991C |
  LDA $7E4000                               ; $11991D |
  TAX                                       ; $119921 |
  LDA $99DA,y                               ; $119922 |
  STA $7E4002,x                             ; $119925 |
  CLC                                       ; $119929 |
  ADC #$0020                                ; $11992A |
  STA $7E400C,x                             ; $11992D |
  CLC                                       ; $119931 |
  ADC #$0020                                ; $119932 |
  STA $7E4016,x                             ; $119935 |
  LDA #$0005                                ; $119939 |
  STA $7E4004,x                             ; $11993C |
  STA $7E400E,x                             ; $119940 |
  STA $7E4018,x                             ; $119944 |
  LDA $116E                                 ; $119948 |
  DEC A                                     ; $11994B |
  ASL A                                     ; $11994C |
  TAY                                       ; $11994D |
  LDA $117E,y                               ; $11994E |
  TAY                                       ; $119951 |
  LDA $96D7,y                               ; $119952 |
  AND #$E3FF                                ; $119955 |
  ORA #$1800                                ; $119958 |
  STA $7E4006,x                             ; $11995B |
  LDA $96D9,y                               ; $11995F |
  AND #$E3FF                                ; $119962 |
  ORA #$1800                                ; $119965 |
  STA $7E4008,x                             ; $119968 |
  LDA $96DB,y                               ; $11996C |
  AND #$E3FF                                ; $11996F |
  ORA #$1800                                ; $119972 |
  STA $7E400A,x                             ; $119975 |
  LDA $96DD,y                               ; $119979 |
  AND #$E3FF                                ; $11997C |
  ORA #$1800                                ; $11997F |
  STA $7E4010,x                             ; $119982 |
  LDA $96DF,y                               ; $119986 |
  AND #$E3FF                                ; $119989 |
  ORA #$1800                                ; $11998C |
  STA $7E4012,x                             ; $11998F |
  LDA $96E1,y                               ; $119993 |
  AND #$E3FF                                ; $119996 |
  ORA #$1800                                ; $119999 |
  STA $7E4014,x                             ; $11999C |
  LDA $96E3,y                               ; $1199A0 |
  AND #$E3FF                                ; $1199A3 |
  ORA #$1800                                ; $1199A6 |
  STA $7E401A,x                             ; $1199A9 |
  LDA $96E5,y                               ; $1199AD |
  AND #$E3FF                                ; $1199B0 |
  ORA #$1800                                ; $1199B3 |
  STA $7E401C,x                             ; $1199B6 |
  LDA $96E7,y                               ; $1199BA |
  AND #$E3FF                                ; $1199BD |
  ORA #$1800                                ; $1199C0 |
  STA $7E401E,x                             ; $1199C3 |
  LDA #$FFFF                                ; $1199C7 |
  STA $7E4020,x                             ; $1199CA |
  TXA                                       ; $1199CE |
  CLC                                       ; $1199CF |
  ADC #$001E                                ; $1199D0 |
  STA $7E4000                               ; $1199D3 |
  SEP #$30                                  ; $1199D7 |
  RTS                                       ; $1199D9 |

  dw $68E8, $68EC, $68F0, $0000             ; $1199DA |
  dw $0000, $68E6, $68EA, $68EE             ; $1199E2 |
  dw $68F2, $0000, $68E4, $68E8             ; $1199EA |
  dw $68EC, $68F0, $68F4                    ; $1199F2 |

CODE_1199F8:
  REP #$30                                  ; $1199F8 |
  LDA $1170                                 ; $1199FA |
  DEC A                                     ; $1199FD |
  DEC A                                     ; $1199FE |
  DEC A                                     ; $1199FF |
  ASL A                                     ; $119A00 |
  STA $00                                   ; $119A01 |
  ASL A                                     ; $119A03 |
  ASL A                                     ; $119A04 |
  CLC                                       ; $119A05 |
  ADC $00                                   ; $119A06 |
  STA $00                                   ; $119A08 |
  LDA $116E                                 ; $119A0A |
  DEC A                                     ; $119A0D |
  ASL A                                     ; $119A0E |
  CLC                                       ; $119A0F |
  ADC $00                                   ; $119A10 |
  TAY                                       ; $119A12 |
  LDA $7E4000                               ; $119A13 |
  TAX                                       ; $119A17 |
  LDA $99DA,y                               ; $119A18 |
  STA $7E4002,x                             ; $119A1B |
  CLC                                       ; $119A1F |
  ADC #$0020                                ; $119A20 |
  STA $7E400C,x                             ; $119A23 |
  CLC                                       ; $119A27 |
  ADC #$0020                                ; $119A28 |
  STA $7E4016,x                             ; $119A2B |
  LDA #$0005                                ; $119A2F |
  STA $7E4004,x                             ; $119A32 |
  STA $7E400E,x                             ; $119A36 |
  STA $7E4018,x                             ; $119A3A |
  LDA $9833                                 ; $119A3E |
  AND #$E3FF                                ; $119A41 |
  ORA #$1800                                ; $119A44 |
  STA $7E4006,x                             ; $119A47 |
  LDA $9835                                 ; $119A4B |
  AND #$E3FF                                ; $119A4E |
  ORA #$1800                                ; $119A51 |
  STA $7E4008,x                             ; $119A54 |
  LDA $9837                                 ; $119A58 |
  AND #$E3FF                                ; $119A5B |
  ORA #$1800                                ; $119A5E |
  STA $7E400A,x                             ; $119A61 |
  LDA $9839                                 ; $119A65 |
  AND #$E3FF                                ; $119A68 |
  ORA #$1800                                ; $119A6B |
  STA $7E4010,x                             ; $119A6E |
  LDA $983B                                 ; $119A72 |
  AND #$E3FF                                ; $119A75 |
  ORA #$1800                                ; $119A78 |
  STA $7E4012,x                             ; $119A7B |
  LDA $983D                                 ; $119A7F |
  AND #$E3FF                                ; $119A82 |
  ORA #$1800                                ; $119A85 |
  STA $7E4014,x                             ; $119A88 |
  LDA $983F                                 ; $119A8C |
  AND #$E3FF                                ; $119A8F |
  ORA #$1800                                ; $119A92 |
  STA $7E401A,x                             ; $119A95 |
  LDA $9841                                 ; $119A99 |
  AND #$E3FF                                ; $119A9C |
  ORA #$1800                                ; $119A9F |
  STA $7E401C,x                             ; $119AA2 |
  LDA $9843                                 ; $119AA6 |
  AND #$E3FF                                ; $119AA9 |
  ORA #$1800                                ; $119AAC |
  STA $7E401E,x                             ; $119AAF |
  LDA #$FFFF                                ; $119AB3 |
  STA $7E4020,x                             ; $119AB6 |
  TXA                                       ; $119ABA |
  CLC                                       ; $119ABB |
  ADC #$001E                                ; $119ABC |
  STA $7E4000                               ; $119ABF |
  SEP #$30                                  ; $119AC3 |
  RTS                                       ; $119AC5 |

CODE_119AC6:
  JSR CODE_119ACC                           ; $119AC6 |
  JMP CODE_119B1E                           ; $119AC9 |

CODE_119ACC:
  REP #$30                                  ; $119ACC |
  LDY !s_oam_next_free_slot_ptr             ; $119ACE |
  LDA $1170                                 ; $119AD1 |
  DEC A                                     ; $119AD4 |
  DEC A                                     ; $119AD5 |
  DEC A                                     ; $119AD6 |
  ASL A                                     ; $119AD7 |
  TAX                                       ; $119AD8 |
  LDA $9B73,x                               ; $119AD9 |
  STA $00                                   ; $119ADC |
  LDA $116E                                 ; $119ADE |
  ASL A                                     ; $119AE1 |
  ASL A                                     ; $119AE2 |
  ASL A                                     ; $119AE3 |
  ASL A                                     ; $119AE4 |
  ASL A                                     ; $119AE5 |
  CLC                                       ; $119AE6 |
  ADC $00                                   ; $119AE7 |
  STA $6000,y                               ; $119AE9 |
  STA $6010,y                               ; $119AEC |
  CLC                                       ; $119AEF |
  ADC #$0008                                ; $119AF0 |
  STA $6008,y                               ; $119AF3 |
  STA $6018,y                               ; $119AF6 |
  LDA $118A                                 ; $119AF9 |
  BNE CODE_119B0A                           ; $119AFC |
  LDA !r_frame_counter_global_dp            ; $119AFE |
  AND #$0010                                ; $119B00 |
  BEQ CODE_119B0A                           ; $119B03 |
  LDA #$0026                                ; $119B05 |
  BRA CODE_119B0D                           ; $119B08 |

CODE_119B0A:
  LDA #$0024                                ; $119B0A |

CODE_119B0D:
  STA $6002,y                               ; $119B0D |
  STA $600A,y                               ; $119B10 |
  CLC                                       ; $119B13 |
  ADC #$0008                                ; $119B14 |
  STA $6012,y                               ; $119B17 |
  STA $601A,y                               ; $119B1A |
  RTS                                       ; $119B1D |

CODE_119B1E:
  LDA !r_frame_counter_global_dp            ; $119B1E |
  AND #$0010                                ; $119B20 |
  BNE CODE_119B3F                           ; $119B23 |
  LDA #$3300                                ; $119B25 |
  STA $6004,y                               ; $119B28 |
  ORA #$0010                                ; $119B2B |
  STA $6014,y                               ; $119B2E |
  LDA #$7300                                ; $119B31 |
  STA $600C,y                               ; $119B34 |
  ORA #$0010                                ; $119B37 |
  STA $601C,y                               ; $119B3A |
  BRA CODE_119B57                           ; $119B3D |

CODE_119B3F:
  LDA #$3300                                ; $119B3F |
  STA $6004,y                               ; $119B42 |
  ORA #$0011                                ; $119B45 |
  STA $6014,y                               ; $119B48 |
  LDA #$7300                                ; $119B4B |
  STA $600C,y                               ; $119B4E |
  ORA #$0011                                ; $119B51 |
  STA $601C,y                               ; $119B54 |

CODE_119B57:
  REP #$30                                  ; $119B57 |
  LDA #$0000                                ; $119B59 |
  STA $6006,y                               ; $119B5C |
  STA $600E,y                               ; $119B5F |
  STA $6016,y                               ; $119B62 |
  STA $601E,y                               ; $119B65 |
  TYA                                       ; $119B68 |
  CLC                                       ; $119B69 |
  ADC #$0020                                ; $119B6A |
  STA !s_oam_next_free_slot_ptr             ; $119B6D |
  SEP #$30                                  ; $119B70 |
  RTS                                       ; $119B72 |

  dw $0044, $0034, $0024                    ; $119B73 |

CODE_119B79:
  JSR CODE_119ACC                           ; $119B79 |
  REP #$30                                  ; $119B7C |
  LDA #$3901                                ; $119B7E |
  STA $6004,y                               ; $119B81 |
  LDA #$7901                                ; $119B84 |
  STA $600C,y                               ; $119B87 |
  LDA #$B901                                ; $119B8A |
  STA $6014,y                               ; $119B8D |
  LDA #$01                                  ; $119B90 |
  SBC $1C99,y                               ; $119B92 |
  RTS                                       ; $119B95 |

  JMP CODE_119B57                           ; $119B96 |

CODE_119B99:
  INC $1191                                 ; $119B99 |
  REP #$30                                  ; $119B9C |
  LDA $1190                                 ; $119B9E |
  SEC                                       ; $119BA1 |
  SBC $118E                                 ; $119BA2 |
  BMI CODE_119BE9                           ; $119BA5 |
  STA $1190                                 ; $119BA7 |
  DEC $1192                                 ; $119BAA |
  LDA $7E4000                               ; $119BAD |
  TAX                                       ; $119BB1 |
  LDA #$0047                                ; $119BB2 |
  SEC                                       ; $119BB5 |
  SBC $1192                                 ; $119BB6 |
  LSR A                                     ; $119BB9 |
  LSR A                                     ; $119BBA |
  CLC                                       ; $119BBB |
  ADC #$3547                                ; $119BBC |
  STA $7E4002,x                             ; $119BBF |
  LDA #$0001                                ; $119BC3 |
  STA $7E4004,x                             ; $119BC6 |
  LDA $1192                                 ; $119BCA |
  AND #$0003                                ; $119BCD |
  ASL A                                     ; $119BD0 |
  TAY                                       ; $119BD1 |
  LDA $9BEC,y                               ; $119BD2 |
  STA $7E4006,x                             ; $119BD5 |
  LDA #$FFFF                                ; $119BD9 |
  STA $7E4008,x                             ; $119BDC |
  TXA                                       ; $119BE0 |
  CLC                                       ; $119BE1 |
  ADC #$0006                                ; $119BE2 |
  STA $7E4000                               ; $119BE5 |

CODE_119BE9:
  SEP #$30                                  ; $119BE9 |
  RTS                                       ; $119BEB |

  dw $2564, $2563, $2562, $2561             ; $119BEC |

CODE_119BF4:
  REP #$30                                  ; $119BF4 |
  LDY #$0000                                ; $119BF6 |
  LDA $7E4000                               ; $119BF9 |
  TAX                                       ; $119BFD |

CODE_119BFE:
  LDA $9C1F,y                               ; $119BFE |
  STA $7E4002,x                             ; $119C01 |
  INX                                       ; $119C05 |
  INX                                       ; $119C06 |
  INY                                       ; $119C07 |
  INY                                       ; $119C08 |
  INC A                                     ; $119C09 |
  BNE CODE_119BFE                           ; $119C0A |
  DEX                                       ; $119C0C |
  DEX                                       ; $119C0D |
  TXA                                       ; $119C0E |
  STA $7E4000                               ; $119C0F |
  LDA #$0048                                ; $119C13 |
  STA $1192                                 ; $119C16 |
  STZ $1190                                 ; $119C19 |
  SEP #$30                                  ; $119C1C |
  RTS                                       ; $119C1E |

  dw $3547, $4023, $2556, $FFFF             ; $119C1F |

CODE_119C27:
  LDX #$00                                  ; $119C27 |

CODE_119C29:
  LDA $9CC4,x                               ; $119C29 |
  STA $7E5B18,x                             ; $119C2C |
  BEQ CODE_119C35                           ; $119C30 |
  INX                                       ; $119C32 |
  BRA CODE_119C29                           ; $119C33 |

CODE_119C35:
  REP #$30                                  ; $119C35 |
  LDX #$007E                                ; $119C37 |
  LDA #$00FF                                ; $119C3A |

CODE_119C3D:
  STA $7E552C,x                             ; $119C3D |
  STA $7E55AC,x                             ; $119C41 |
  STA $7E562C,x                             ; $119C45 |
  STA $7E56AC,x                             ; $119C49 |
  DEX                                       ; $119C4D |
  DEX                                       ; $119C4E |
  BPL CODE_119C3D                           ; $119C4F |
  SEP #$20                                  ; $119C51 |
  LDX #$2641                                ; $119C53 |
  STX $4330                                 ; $119C56 |
  LDX #$5B18                                ; $119C59 |
  STX $4332                                 ; $119C5C |
  LDA #$7E                                  ; $119C5F |
  STA $4334                                 ; $119C61 |
  LDA #$7E                                  ; $119C64 |
  STA $4337                                 ; $119C66 |
  LDA #$30                                  ; $119C69 |
  STA !r_reg_w12sel_mirror                  ; $119C6B |
  LDA #$30                                  ; $119C6E |
  STA !r_reg_w34sel_mirror                  ; $119C70 |
  LDA #$20                                  ; $119C73 |
  STA !r_reg_wobjsel_mirror                 ; $119C75 |
  LDA #$00                                  ; $119C78 |
  STA !r_reg_tmw_mirror                     ; $119C7A |
  LDA #$00                                  ; $119C7D |
  STA !r_reg_tsw_mirror                     ; $119C7F |
  LDA #$17                                  ; $119C82 |
  STA !r_reg_tm_mirror                      ; $119C84 |
  LDA #$02                                  ; $119C87 |
  STA !r_reg_ts_mirror                      ; $119C89 |
  LDA #$10                                  ; $119C8C |
  STA !r_reg_cgwsel_mirror                  ; $119C8E |
  LDA #$72                                  ; $119C91 |
  STA !r_reg_cgadsub_mirror                 ; $119C93 |
  REP #$20                                  ; $119C96 |
  LDA $1170                                 ; $119C98 |
  SEC                                       ; $119C9B |
  SBC #$0003                                ; $119C9C |
  ASL A                                     ; $119C9F |
  TAX                                       ; $119CA0 |
  LDA $9CBE,x                               ; $119CA1 |
  LDX #$0058                                ; $119CA4 |

CODE_119CA7:
  STA $7E552C,x                             ; $119CA7 |
  INX                                       ; $119CAB |
  INX                                       ; $119CAC |
  CPX #$00A0                                ; $119CAD |
  BNE CODE_119CA7                           ; $119CB0 |
  LDA !r_reg_hdmaen_mirror                  ; $119CB2 |
  ORA #$0008                                ; $119CB5 |
  STA !r_reg_hdmaen_mirror                  ; $119CB8 |
  SEP #$30                                  ; $119CBB |
  RTL                                       ; $119CBD |

  dw $D030, $E020, $F010                    ; $119CBE |

  db $F8, $2C, $55, $F8, $1C, $56, $00      ; $119CC4 |

  LDX #$00                                  ; $119CCB |

CODE_119CCD:
  LDA $9CC4,x                               ; $119CCD |
  STA $7E5B18,x                             ; $119CD0 |
  BEQ CODE_119CD9                           ; $119CD4 |
  INX                                       ; $119CD6 |
  BRA CODE_119CCD                           ; $119CD7 |

CODE_119CD9:
  REP #$30                                  ; $119CD9 |
  LDX #$007E                                ; $119CDB |
  LDA #$00FF                                ; $119CDE |

CODE_119CE1:
  STA $7E552C,x                             ; $119CE1 |
  STA $7E55AC,x                             ; $119CE5 |
  STA $7E562C,x                             ; $119CE9 |
  STA $7E56AC,x                             ; $119CED |
  DEX                                       ; $119CF1 |
  DEX                                       ; $119CF2 |
  BPL CODE_119CE1                           ; $119CF3 |
  SEP #$20                                  ; $119CF5 |
  LDX #$2641                                ; $119CF7 |
  STX $4330                                 ; $119CFA |
  LDX #$5B18                                ; $119CFD |
  STX $4332                                 ; $119D00 |
  LDA #$7E                                  ; $119D03 |
  STA $4334                                 ; $119D05 |
  LDA #$7E                                  ; $119D08 |
  STA $4337                                 ; $119D0A |
  LDA #$30                                  ; $119D0D |
  STA !r_reg_w12sel_mirror                  ; $119D0F |
  LDA #$30                                  ; $119D12 |
  STA !r_reg_w34sel_mirror                  ; $119D14 |
  LDA #$20                                  ; $119D17 |
  STA !r_reg_wobjsel_mirror                 ; $119D19 |
  LDA #$00                                  ; $119D1C |
  STA !r_reg_tmw_mirror                     ; $119D1E |
  LDA #$00                                  ; $119D21 |
  STA !r_reg_tsw_mirror                     ; $119D23 |
  LDA #$17                                  ; $119D26 |
  STA !r_reg_tm_mirror                      ; $119D28 |
  LDA #$02                                  ; $119D2B |
  STA !r_reg_ts_mirror                      ; $119D2D |
  LDA #$10                                  ; $119D30 |
  STA !r_reg_cgwsel_mirror                  ; $119D32 |
  STZ !r_reg_cgadsub_mirror                 ; $119D35 |
  REP #$20                                  ; $119D38 |
  LDA #$7F94                                ; $119D3A |
  STA !r_reg_coldata_mirror                 ; $119D3D |
  LDA #$FF00                                ; $119D40 |
  LDX #$0000                                ; $119D43 |

CODE_119D46:
  STA $7E552C,x                             ; $119D46 |
  INX                                       ; $119D4A |
  INX                                       ; $119D4B |
  CPX #$01C0                                ; $119D4C |
  BNE CODE_119D46                           ; $119D4F |
  LDA #$0028                                ; $119D51 |
  STA !r_reg_hdmaen_mirror                  ; $119D54 |
  SEP #$30                                  ; $119D57 |
  RTL                                       ; $119D59 |

  REP #$30                                  ; $119D5A |
  LDX #$007E                                ; $119D5C |
  LDA #$00FF                                ; $119D5F |

CODE_119D62:
  STA $7E552C,x                             ; $119D62 |
  STA $7E55AC,x                             ; $119D66 |
  STA $7E562C,x                             ; $119D6A |
  STA $7E56AC,x                             ; $119D6E |
  DEX                                       ; $119D72 |
  DEX                                       ; $119D73 |
  BPL CODE_119D62                           ; $119D74 |
  SEP #$30                                  ; $119D76 |
  LDA !r_reg_wobjsel_mirror                 ; $119D78 |
  EOR #$03                                  ; $119D7B |
  STA !r_reg_wobjsel_mirror                 ; $119D7D |
  LDA !r_reg_tmw_mirror                     ; $119D80 |
  EOR #$10                                  ; $119D83 |
  STA !r_reg_tmw_mirror                     ; $119D85 |
  LDA !r_reg_hdmaen_mirror                  ; $119D88 |
  AND #$F7                                  ; $119D8B |
  STA !r_reg_hdmaen_mirror                  ; $119D8D |
  RTL                                       ; $119D90 |

  REP #$20                                  ; $119D91 |
  LDA #$0000                                ; $119D93 |
  BRA CODE_119D9D                           ; $119D96 |
  REP #$20                                  ; $119D98 |
  LDA #$0001                                ; $119D9A |

CODE_119D9D:
  STA $113C                                 ; $119D9D |
  REP #$20                                  ; $119DA0 |
  STZ $39                                   ; $119DA2 |
  STZ $3B                                   ; $119DA4 |
  STZ $3D                                   ; $119DA6 |
  LDA #$0017                                ; $119DA8 |
  STA $3F                                   ; $119DAB |
  STZ $41                                   ; $119DAD |
  STZ $43                                   ; $119DAF |
  SEP #$20                                  ; $119DB1 |
  LDA !r_reg_bg1sc_mirror                   ; $119DB3 |
  EOR #$03                                  ; $119DB6 |
  STA !r_reg_bg1sc_mirror                   ; $119DB8 |
  STA !reg_bg1sc                            ; $119DBB |
  LDA !r_reg_bg2sc_mirror                   ; $119DBE |
  EOR #$03                                  ; $119DC1 |
  STA !r_reg_bg2sc_mirror                   ; $119DC3 |
  STA !reg_bg2sc                            ; $119DC6 |
  REP #$30                                  ; $119DC9 |
  LDA #$00B0                                ; $119DCB |
  STA !s_player_y                           ; $119DCE |
  STA $1144                                 ; $119DD1 |
  LDA #$0020                                ; $119DD4 |
  STA !s_player_x                           ; $119DD7 |
  STA $1142                                 ; $119DDA |
  STZ !s_screen_num_to_id                   ; $119DDD |
  STA !r_stars_amount                       ; $119DE0 |
  LDX #$01FE                                ; $119DE3 |
  LDA #$0000                                ; $119DE6 |

CODE_119DE9:
  STA $7F8000,x                             ; $119DE9 |
  DEX                                       ; $119DED |
  DEX                                       ; $119DEE |
  BPL CODE_119DE9                           ; $119DEF |
  LDX #$001E                                ; $119DF1 |
  LDA #$0100                                ; $119DF4 |

CODE_119DF7:
  STA $7F81A0,x                             ; $119DF7 |
  DEX                                       ; $119DFB |
  DEX                                       ; $119DFC |
  BPL CODE_119DF7                           ; $119DFD |
  LDX #$0160                                ; $119DFF |

CODE_119E02:
  LDA #$0100                                ; $119E02 |
  STA $7F8000,x                             ; $119E05 |
  STA $7F801E,x                             ; $119E09 |
  TXA                                       ; $119E0D |
  SEC                                       ; $119E0E |
  SBC #$0020                                ; $119E0F |
  TAX                                       ; $119E12 |
  BNE CODE_119E02                           ; $119E13 |
  LDX #$0018                                ; $119E15 |
  LDA #$3800                                ; $119E18 |

CODE_119E1B:
  STA $7F80A0,x                             ; $119E1B |
  DEX                                       ; $119E1F |
  DEX                                       ; $119E20 |
  CPX #$0006                                ; $119E21 |
  BCS CODE_119E1B                           ; $119E24 |
  LDA #$0100                                ; $119E26 |
  STA $7F8002                               ; $119E29 |
  STA $7F8004                               ; $119E2D |
  STA $7F801A                               ; $119E31 |
  STA $7F801C                               ; $119E35 |
  STZ !r_reg_cgadsub_mirror                 ; $119E39 |
  SEP #$10                                  ; $119E3C |
  LDA #$01B4                                ; $119E3E |
  JSL spawn_sprite_init                     ; $119E41 |
  LDA #$01B4                                ; $119E45 |
  JSL spawn_sprite_init                     ; $119E48 |
  LDX #$0A                                  ; $119E4C |

CODE_119E4E:
  LDA #$01B6                                ; $119E4E |
  JSL spawn_sprite_init                     ; $119E51 |
  DEX                                       ; $119E55 |
  BNE CODE_119E4E                           ; $119E56 |
  LDA #$01B5                                ; $119E58 |
  JSL spawn_sprite_init                     ; $119E5B |
  STZ $1132                                 ; $119E5F |
  LDA #$0100                                ; $119E62 |
  STA $1134                                 ; $119E65 |
  STA $1136                                 ; $119E68 |
  LDX #$00                                  ; $119E6B |
  LDA #$F000                                ; $119E6D |
  STA $7ECE                                 ; $119E70 |
  STA $7ECC                                 ; $119E73 |
  JSR CODE_11A008                           ; $119E76 |
  SEP #$30                                  ; $119E79 |
  JSL $0397D3                               ; $119E7B |
  LDA #$09                                  ; $119E7F |
  STA !r_reg_bgmode_mirror                  ; $119E81 |
  STZ !r_reg_cgadsub_mirror                 ; $119E84 |
  RTS                                       ; $119E87 |

  JSL $008259                               ; $119E88 |
  REP #$20                                  ; $119E8C |
  LDA !s_player_x                           ; $119E8E |
  STA $1142                                 ; $119E91 |
  LDA !s_player_y                           ; $119E94 |
  STA $1144                                 ; $119E97 |
  LDA $1104                                 ; $119E9A |
  BEQ CODE_119ED0                           ; $119E9D |
  LDA !s_player_tile_collision              ; $119E9F |
  AND #$0001                                ; $119EA2 |
  EOR #$0001                                ; $119EA5 |
  ORA !s_player_y_speed                     ; $119EA8 |
  BEQ CODE_119EC1                           ; $119EAB |
  STZ !r_joy1_lo_mirror                     ; $119EAD |
  STZ !r_joy1_hi_mirror                     ; $119EB0 |
  STZ !r_joy1_lo_press_mirror               ; $119EB3 |
  STZ !r_joy1_hi_press_mirror               ; $119EB6 |
  LDA #$006B                                ; $119EB9 |
  STA !s_player_cur_anim_frame              ; $119EBC |
  BRA CODE_119ED0                           ; $119EBF |

CODE_119EC1:
  STZ $1104                                 ; $119EC1 |
  LDA #$0096                                ; $119EC4 |
  STA !s_player_invincibility_timer         ; $119EC7 |
  STZ !s_player_x_speed_prev                ; $119ECA |
  STZ !s_player_x_speed                     ; $119ECD |

CODE_119ED0:
  LDA !s_player_invincibility_timer         ; $119ED0 |
  CMP #$0080                                ; $119ED3 |
  BCS CODE_119EDB                           ; $119ED6 |
  STZ !s_player_invincibility_timer         ; $119ED8 |

CODE_119EDB:
  SEP #$20                                  ; $119EDB |
  JSL spr_edge_despawn_draw                 ; $119EDD |
  JSL draw_player                           ; $119EE1 |
  LDA $10F4                                 ; $119EE5 |
  BNE CODE_119EF1                           ; $119EE8 |
  JSR CODE_119F13                           ; $119EEA |
  JSL $04DD9E                               ; $119EED |

CODE_119EF1:
  LDA $1104                                 ; $119EF1 |
  BNE CODE_119EF9                           ; $119EF4 |
  JSR CODE_119F89                           ; $119EF6 |

CODE_119EF9:
  LDA !r_msg_box_state                      ; $119EF9 |
  BNE CODE_119F05                           ; $119EFC |
  JSL $0397D3                               ; $119EFE |
  JSR CODE_119F40                           ; $119F02 |

CODE_119F05:
  REP #$20                                  ; $119F05 |
  LDX #$08                                  ; $119F07 |
  LDA #$B1EF                                ; $119F09 |
  JSL r_gsu_init_1                          ; $119F0C | GSU init
  SEP #$20                                  ; $119F10 |
  RTS                                       ; $119F12 |

CODE_119F13:
  REP #$20                                  ; $119F13 |
  LDA !s_player_y                           ; $119F15 |
  BPL CODE_119F3D                           ; $119F18 |
  CMP #$FFF0                                ; $119F1A |
  BCS CODE_119F3D                           ; $119F1D |
  LDA !s_player_x                           ; $119F1F |
  CMP #$0030                                ; $119F22 |
  BCS CODE_119F2F                           ; $119F25 |
  STZ !s_player_x_speed_prev                ; $119F27 |
  LDA #$0030                                ; $119F2A |
  BRA CODE_119F3A                           ; $119F2D |

CODE_119F2F:
  CMP #$00C1                                ; $119F2F |
  BCC CODE_119F3A                           ; $119F32 |
  STZ !s_player_x_speed_prev                ; $119F34 |
  LDA #$00C0                                ; $119F37 |

CODE_119F3A:
  STA !s_player_x                           ; $119F3A |

CODE_119F3D:
  SEP #$20                                  ; $119F3D |
  RTS                                       ; $119F3F |

CODE_119F40:
  REP #$20                                  ; $119F40 |
  LDA $10F4                                 ; $119F42 |
  BEQ CODE_119F48                           ; $119F45 |
  RTS                                       ; $119F47 |

CODE_119F48:
  LDA !r_frame_counter_global               ; $119F48 |
  AND #$000F                                ; $119F4B |
  BNE CODE_119F85                           ; $119F4E |
  LDA $113A                                 ; $119F50 |
  BNE CODE_119F6E                           ; $119F53 |
  DEC $1134                                 ; $119F55 |
  INC $1136                                 ; $119F58 |
  LDA $1136                                 ; $119F5B |
  CMP #$0101                                ; $119F5E |
  BCC CODE_119F85                           ; $119F61 |
  LDA $113A                                 ; $119F63 |
  EOR #$0001                                ; $119F66 |
  STA $113A                                 ; $119F69 |
  BRA CODE_119F85                           ; $119F6C |

CODE_119F6E:
  INC $1134                                 ; $119F6E |
  DEC $1136                                 ; $119F71 |
  LDA $1134                                 ; $119F74 |
  CMP #$0101                                ; $119F77 |
  BCC CODE_119F85                           ; $119F7A |
  LDA $113A                                 ; $119F7C |
  EOR #$0001                                ; $119F7F |
  STA $113A                                 ; $119F82 |

CODE_119F85:
  JSR CODE_11A008                           ; $119F85 |
  RTS                                       ; $119F88 |

CODE_119F89:
  REP #$20                                  ; $119F89 |
  LDA !s_player_y_speed                     ; $119F8B |
  BMI CODE_119FCF                           ; $119F8E |
  LDA !s_player_ground_pound_state          ; $119F90 |
  BNE CODE_119FA3                           ; $119F93 |
  LDA #$0004                                ; $119F95 |
  STA $00                                   ; $119F98 |
  JSR CODE_119FD2                           ; $119F9A |
  CPY #$00                                  ; $119F9D |
  BEQ CODE_119FCF                           ; $119F9F |
  BRA CODE_119FAF                           ; $119FA1 |

CODE_119FA3:
  LDA #$0008                                ; $119FA3 |
  STA $00                                   ; $119FA6 |
  JSR CODE_119FD2                           ; $119FA8 |
  CPY #$00                                  ; $119FAB |
  BEQ CODE_119FCF                           ; $119FAD |

CODE_119FAF:
  LDA !s_spr_y_pixel_pos,y                  ; $119FAF |
  SEC                                       ; $119FB2 |
  SBC #$0020                                ; $119FB3 |
  STA !s_player_y                           ; $119FB6 |
  LDA !s_spr_x_delta_lo,y                   ; $119FB9 |
  CLC                                       ; $119FBC |
  ADC !s_player_x                           ; $119FBD |
  STA !s_player_x                           ; $119FC0 |
  LDA #$0001                                ; $119FC3 |
  STA !s_on_sprite_platform_flag            ; $119FC6 |
  LDA #$0400                                ; $119FC9 |
  STA !s_player_y_speed                     ; $119FCC |

CODE_119FCF:
  SEP #$20                                  ; $119FCF |
  RTS                                       ; $119FD1 |

CODE_119FD2:
  LDY #$00                                  ; $119FD2 |
  LDX $1100                                 ; $119FD4 |
  JSR CODE_119FDD                           ; $119FD7 |
  LDX $1102                                 ; $119FDA |

CODE_119FDD:
  LDA !s_spr_x_pixel_pos,x                  ; $119FDD |
  SEC                                       ; $119FE0 |
  SBC #$000C                                ; $119FE1 |
  CMP !s_player_x                           ; $119FE4 |
  BCS CODE_11A007                           ; $119FE7 |
  CLC                                       ; $119FE9 |
  ADC #$0028                                ; $119FEA |
  CMP !s_player_x                           ; $119FED |
  BCC CODE_11A007                           ; $119FF0 |
  LDA !s_spr_y_pixel_pos,x                  ; $119FF2 |
  SEC                                       ; $119FF5 |
  SBC #$0020                                ; $119FF6 |
  CMP !s_player_y                           ; $119FF9 |
  BCS CODE_11A007                           ; $119FFC |
  CLC                                       ; $119FFE |
  ADC $00                                   ; $119FFF |
  CMP !s_player_y                           ; $11A001 |
  BCC CODE_11A007                           ; $11A004 |
  TXY                                       ; $11A006 |

CODE_11A007:
  RTS                                       ; $11A007 |

CODE_11A008:
  LDA $1132                                 ; $11A008 |
  STA !gsu_r5                               ; $11A00B |
  LDA $1134                                 ; $11A00E |
  STA !gsu_r6                               ; $11A011 |
  LDA $1136                                 ; $11A014 |
  STA !gsu_r11                              ; $11A017 |
  LDA $03A9CE                               ; $11A01A |
  STA !gsu_r3                               ; $11A01E |
  LDA $03A9EE                               ; $11A021 |
  STA !gsu_r2                               ; $11A025 |
  LDA #$C0E1                                ; $11A028 |
  STA !gsu_r12                              ; $11A02B |
  LDA #$0054                                ; $11A02E |
  STA !gsu_r13                              ; $11A031 |
  LDX #$08                                  ; $11A034 |
  LDA #$84A5                                ; $11A036 |
  JSL r_gsu_init_1                          ; $11A039 | GSU init
  INC $0CF9                                 ; $11A03D |
  RTS                                       ; $11A040 |

CODE_11A041:
  LDA $03A9D6                               ; $11A041 |
  STA !gsu_r3                               ; $11A045 |
  LDA $03A9F6                               ; $11A048 |
  STA !gsu_r2                               ; $11A04C |
  BRA CODE_11A05F                           ; $11A04F |

CODE_11A051:
  LDA $03A9DE                               ; $11A051 |
  STA !gsu_r3                               ; $11A055 |
  LDA $03A9FE                               ; $11A058 |
  STA !gsu_r2                               ; $11A05C |

CODE_11A05F:
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A05F |
  STA !gsu_r5                               ; $11A062 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A065 |
  STA !gsu_r6                               ; $11A068 |
  LDA !s_spr_wildcard_2_lo,x                ; $11A06B |
  STA !gsu_r11                              ; $11A06E |
  LDA #$C0E1                                ; $11A071 |
  STA !gsu_r12                              ; $11A074 |
  LDA #$0054                                ; $11A077 |
  STA !gsu_r13                              ; $11A07A |
  LDX #$08                                  ; $11A07D |
  LDA #$84A5                                ; $11A07F |
  JSL r_gsu_init_1                          ; $11A082 | GSU init
  INC $0CF9                                 ; $11A086 |
  LDX !s_cur_sprite_slot                    ; $11A089 |
  RTS                                       ; $11A08C |

init_mini_battle_checkered_platform:
  LDY $10FE                                 ; $11A08D |
  LDA $A0B2,y                               ; $11A090 |
  STA !s_spr_x_pixel_pos,x                  ; $11A093 |
  LDA $A0CA,y                               ; $11A096 |
  STA !s_spr_y_pixel_pos,x                  ; $11A099 |
  TXA                                       ; $11A09C |
  STA $1100,y                               ; $11A09D |
  LDA $113C                                 ; $11A0A0 |
  BEQ CODE_11A0A8                           ; $11A0A3 |
  LDA $A0E2,y                               ; $11A0A5 |

CODE_11A0A8:
  STA !s_spr_x_speed_lo,x                   ; $11A0A8 |
  INC $10FE                                 ; $11A0AB |
  INC $10FE                                 ; $11A0AE |
  RTL                                       ; $11A0B1 |

  dw $0010, $00D8, $0010, $00D0             ; $11A0B2 |
  dw $0028, $0058, $0088, $00B8             ; $11A0BA |
  dw $0010, $0050, $0090, $00D0             ; $11A0C2 |

  dw $0090, $0090, $0073, $0073             ; $11A0CA |
  dw $0033, $0033, $0033, $0033             ; $11A0D2 |
  dw $00B3, $00B3, $00B3, $00B3             ; $11A0DA |
  dw $0080, $FF80                           ; $11A0E2 |

init_mini_battle_red_balloon:
  LDY $10FE                                 ; $11A0E6 |
  LDA $A0B2,y                               ; $11A0E9 |
  STA !s_spr_x_pixel_pos,x                  ; $11A0EC |
  LDA $A0CA,y                               ; $11A0EF |
  STA !s_spr_y_pixel_pos,x                  ; $11A0F2 |
  INC $10FE                                 ; $11A0F5 |
  INC $10FE                                 ; $11A0F8 |
  CPY #$04                                  ; $11A0FB |
  BEQ CODE_11A108                           ; $11A0FD |
  CPY #$06                                  ; $11A0FF |
  BNE CODE_11A10D                           ; $11A101 |
  LDA $1102                                 ; $11A103 |
  BRA CODE_11A10B                           ; $11A106 |

CODE_11A108:
  LDA $1100                                 ; $11A108 |

CODE_11A10B:
  STA !s_spr_wildcard_6_lo_dp,x             ; $11A10B |

CODE_11A10D:
  STZ !s_spr_dyntile_index,x                ; $11A10D |
  RTL                                       ; $11A110 |

main_mini_battle_checkered_platform:
  LDA $10F4                                 ; $11A111 |
  BEQ CODE_11A11A                           ; $11A114 |
  STZ !s_spr_x_speed_lo,x                   ; $11A116 |
  RTL                                       ; $11A119 |

CODE_11A11A:
  LDA !s_spr_x_pixel_pos,x                  ; $11A11A |
  CMP #$0080                                ; $11A11D |
  BCS CODE_11A14C                           ; $11A120 |
  LDA !s_spr_x_pixel_pos,x                  ; $11A122 |
  CMP #$0050                                ; $11A125 |
  BCC CODE_11A132                           ; $11A128 |
  LDA #$0050                                ; $11A12A |
  STA !s_spr_x_pixel_pos,x                  ; $11A12D |
  BRA CODE_11A140                           ; $11A130 |

CODE_11A132:
  CMP #$0010                                ; $11A132 |
  BCS CODE_11A174                           ; $11A135 |
  LDA #$0010                                ; $11A137 |
  STA !s_spr_x_pixel_pos,x                  ; $11A13A |
  STZ !s_spr_x_delta_lo,x                   ; $11A13D |

CODE_11A140:
  LDA !s_spr_x_speed_lo,x                   ; $11A140 |
  EOR #$FFFF                                ; $11A143 |
  INC A                                     ; $11A146 |
  STA !s_spr_x_speed_lo,x                   ; $11A147 |
  BRA CODE_11A174                           ; $11A14A |

CODE_11A14C:
  LDA !s_spr_x_pixel_pos,x                  ; $11A14C |
  CMP #$00D0                                ; $11A14F |
  BCC CODE_11A15C                           ; $11A152 |
  LDA #$00D0                                ; $11A154 |
  STA !s_spr_x_pixel_pos,x                  ; $11A157 |
  BRA CODE_11A16A                           ; $11A15A |

CODE_11A15C:
  CMP #$0090                                ; $11A15C |
  BCS CODE_11A174                           ; $11A15F |
  LDA #$0090                                ; $11A161 |
  STA !s_spr_x_pixel_pos,x                  ; $11A164 |
  STZ !s_spr_x_delta_lo,x                   ; $11A167 |

CODE_11A16A:
  LDA !s_spr_x_speed_lo,x                   ; $11A16A |
  EOR #$FFFF                                ; $11A16D |
  INC A                                     ; $11A170 |
  STA !s_spr_x_speed_lo,x                   ; $11A171 |

CODE_11A174:
  RTL                                       ; $11A174 |

main_mini_battle_red_balloon:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11A175 |
  BEQ CODE_11A180                           ; $11A177 |
  TAY                                       ; $11A179 |
  LDA !s_spr_x_pixel_pos,y                  ; $11A17A |
  STA !s_spr_x_pixel_pos,x                  ; $11A17D |

CODE_11A180:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11A180 |
  ASL A                                     ; $11A182 |
  TAY                                       ; $11A183 |
  LDA $A193,y                               ; $11A184 |
  STA $0000                                 ; $11A187 |
  LDA $A194,y                               ; $11A18A |
  STA $0001                                 ; $11A18D |
  JMP ($0000)                               ; $11A190 |

  dw $A661                                  ; $11A193 |
  dw $A392                                  ; $11A195 |
  dw $A3CF                                  ; $11A197 |
  dw $A40F                                  ; $11A199 |
  dw $A44E                                  ; $11A19B |
  dw $A490                                  ; $11A19D |
  dw $A514                                  ; $11A19F |
  dw $A333                                  ; $11A1A1 |
  dw $A1A9                                  ; $11A1A3 |
  dw $A1E9                                  ; $11A1A5 |
  dw $A22B                                  ; $11A1A7 |

  JSL $03AA52                               ; $11A1A9 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A1AD |
  CMP #$0020                                ; $11A1B0 |
  BCC CODE_11A1BC                           ; $11A1B3 |
  LDA #$0007                                ; $11A1B5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A1B8 |
  BRA CODE_11A1C6                           ; $11A1BA |

CODE_11A1BC:
  CLC                                       ; $11A1BC |
  ADC #$0008                                ; $11A1BD |
  AND #$00FF                                ; $11A1C0 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A1C3 |

CODE_11A1C6:
  LDA !s_spr_wildcard_2_lo,x                ; $11A1C6 |
  CMP #$00C0                                ; $11A1C9 |
  BCC CODE_11A1E5                           ; $11A1CC |
  SEC                                       ; $11A1CE |
  SBC #$0020                                ; $11A1CF |
  STA !s_spr_wildcard_2_lo,x                ; $11A1D2 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A1D5 |
  CLC                                       ; $11A1D8 |
  ADC #$000C                                ; $11A1D9 |
  STA !s_spr_wildcard_1_lo,x                ; $11A1DC |
  INC !s_spr_y_pixel_pos,x                  ; $11A1DF |
  INC !s_spr_y_pixel_pos,x                  ; $11A1E2 |

CODE_11A1E5:
  JSR CODE_11A4F4                           ; $11A1E5 |
  RTL                                       ; $11A1E8 |

  JSL $03AA52                               ; $11A1E9 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A1ED |
  BEQ CODE_11A1BC                           ; $11A1F0 |
  CMP #$00E0                                ; $11A1F2 |
  BCS CODE_11A1BC                           ; $11A1F5 |
  LDA #$0007                                ; $11A1F7 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A1FA |
  BRA CODE_11A208                           ; $11A1FC |
  SEC                                       ; $11A1FE |
  SBC #$0008                                ; $11A1FF |
  AND #$00FF                                ; $11A202 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A205 |

CODE_11A208:
  LDA !s_spr_wildcard_2_lo,x                ; $11A208 |
  CMP #$00C0                                ; $11A20B |
  BCC CODE_11A227                           ; $11A20E |
  SEC                                       ; $11A210 |
  SBC #$0020                                ; $11A211 |
  STA !s_spr_wildcard_2_lo,x                ; $11A214 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A217 |
  CLC                                       ; $11A21A |
  ADC #$000C                                ; $11A21B |
  STA !s_spr_wildcard_1_lo,x                ; $11A21E |
  INC !s_spr_y_pixel_pos,x                  ; $11A221 |
  INC !s_spr_y_pixel_pos,x                  ; $11A224 |

CODE_11A227:
  JSR CODE_11A4F4                           ; $11A227 |
  RTL                                       ; $11A22A |

  JSL $03AA52                               ; $11A22B |
  LDA !s_spr_wildcard_2_lo,x                ; $11A22F |
  SEC                                       ; $11A232 |
  SBC #$0020                                ; $11A233 |
  CMP #$0060                                ; $11A236 |
  BCS CODE_11A2B5                           ; $11A239 |
  JSL $03A31E                               ; $11A23B |
  JSR CODE_11A61A                           ; $11A23F |
  CMP #$022B                                ; $11A242 |
  BNE CODE_11A256                           ; $11A245 |
  INC $10F4                                 ; $11A247 |
  LDA #$0001                                ; $11A24A |
  STA $10E6                                 ; $11A24D |
  STA $10E2                                 ; $11A250 |
  LDA #$022B                                ; $11A253 |

CODE_11A256:
  PHA                                       ; $11A256 |
  JSL spawn_ambient_sprite                  ; $11A257 |
  LDA !s_spr_x_pixel_pos,x                  ; $11A25B |
  CLC                                       ; $11A25E |
  ADC #$0020                                ; $11A25F |
  STA $70A2,y                               ; $11A262 |
  LDA !s_spr_y_pixel_pos,x                  ; $11A265 |
  CLC                                       ; $11A268 |
  ADC #$0010                                ; $11A269 |
  STA $7142,y                               ; $11A26C |
  PLA                                       ; $11A26F |
  PHX                                       ; $11A270 |
  TYX                                       ; $11A271 |
  CMP #$022B                                ; $11A272 |
  BNE CODE_11A280                           ; $11A275 |
  JSL $11A30D                               ; $11A277 |
  JSR CODE_11A2CC                           ; $11A27B |
  BRA CODE_11A284                           ; $11A27E |

CODE_11A280:
  JSL $11A2E1                               ; $11A280 |

CODE_11A284:
  PLX                                       ; $11A284 |
  LDA #$01DC                                ; $11A285 |
  JSL spawn_ambient_sprite                  ; $11A288 |
  PHX                                       ; $11A28C |
  LDX $112E                                 ; $11A28D |
  LDA !s_spr_x_pixel_pos,x                  ; $11A290 |
  STA $70A2,y                               ; $11A293 |
  LDA !s_spr_y_pixel_pos,x                  ; $11A296 |
  CLC                                       ; $11A299 |
  ADC #$0008                                ; $11A29A |
  STA $7142,y                               ; $11A29D |
  LDA #$000B                                ; $11A2A0 |
  STA $7E4C,y                               ; $11A2A3 |
  LDA #$0002                                ; $11A2A6 |
  STA $7782,y                               ; $11A2A9 |
  PLX                                       ; $11A2AC |
  LDA #$0046                                ; $11A2AD |\ play sound #$0046
  JSL push_sound_queue                      ; $11A2B0 |/
  RTL                                       ; $11A2B4 |

CODE_11A2B5:
  STA !s_spr_wildcard_2_lo,x                ; $11A2B5 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A2B8 |
  CLC                                       ; $11A2BB |
  ADC #$0006                                ; $11A2BC |
  STA !s_spr_wildcard_1_lo,x                ; $11A2BF |
  INC !s_spr_y_pixel_pos,x                  ; $11A2C2 |
  INC !s_spr_y_pixel_pos,x                  ; $11A2C5 |
  JSR CODE_11A4F4                           ; $11A2C8 |
  RTL                                       ; $11A2CB |

CODE_11A2CC:
  LDA $70A2,x                               ; $11A2CC |
  CLC                                       ; $11A2CF |
  ADC #$FFF4                                ; $11A2D0 |
  STA $70A2,x                               ; $11A2D3 |
  LDA $7142,x                               ; $11A2D6 |
  CLC                                       ; $11A2D9 |
  ADC #$FFE0                                ; $11A2DA |
  STA $7142,x                               ; $11A2DD |
  RTS                                       ; $11A2E0 |

  LDA #$0003                                ; $11A2E1 |
  STA $7782,x                               ; $11A2E4 |
  STZ $7E4E,x                               ; $11A2E7 |
  LDA #$FD00                                ; $11A2EA |
  STA $71E2,x                               ; $11A2ED |
  STZ $71E0,x                               ; $11A2F0 |
  LDA #$0028                                ; $11A2F3 |
  STA $7502,x                               ; $11A2F6 |
  LDA #$0001                                ; $11A2F9 |
  STA $7462,x                               ; $11A2FC |
  LDA #$0086                                ; $11A2FF |\ play sound #$0086
  JSL push_sound_queue                      ; $11A302 |/
  LDA #$00FF                                ; $11A306 |
  STA $7462,x                               ; $11A309 |
  RTL                                       ; $11A30C |

  LDA #$0002                                ; $11A30D |
  STA $7782,x                               ; $11A310 |
  STA $7E4C,x                               ; $11A313 |
  STZ $7E4E,x                               ; $11A316 |
  STZ $7E8C,x                               ; $11A319 |
  STZ $71E2,x                               ; $11A31C |
  STZ $71E0,x                               ; $11A31F |
  STZ $7502,x                               ; $11A322 |
  LDA #$0001                                ; $11A325 |
  STA $7462,x                               ; $11A328 |
  LDA #$0086                                ; $11A32B |\ play sound #$0086
  JSL push_sound_queue                      ; $11A32E |/
  RTL                                       ; $11A332 |

  JSL $03AA52                               ; $11A333 |
  STZ $0000                                 ; $11A337 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A33A |
  BEQ CODE_11A35D                           ; $11A33D |
  INC $0000                                 ; $11A33F |
  CMP #$0080                                ; $11A342 |
  BCS CODE_11A353                           ; $11A345 |
  SEC                                       ; $11A347 |
  SBC #$0004                                ; $11A348 |
  AND #$00FF                                ; $11A34B |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A34E |
  BRA CODE_11A35D                           ; $11A351 |

CODE_11A353:
  CLC                                       ; $11A353 |
  ADC #$0004                                ; $11A354 |
  AND #$00FF                                ; $11A357 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A35A |

CODE_11A35D:
  LDA !s_spr_wildcard_2_lo,x                ; $11A35D |
  CMP #$0100                                ; $11A360 |
  BEQ CODE_11A384                           ; $11A363 |
  INC $0000                                 ; $11A365 |
  CLC                                       ; $11A368 |
  ADC #$0010                                ; $11A369 |
  CMP #$0100                                ; $11A36C |
  BCC CODE_11A374                           ; $11A36F |
  LDA #$0100                                ; $11A371 |

CODE_11A374:
  STA !s_spr_wildcard_2_lo,x                ; $11A374 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A377 |
  SEC                                       ; $11A37A |
  SBC #$0006                                ; $11A37B |
  STA !s_spr_wildcard_1_lo,x                ; $11A37E |
  DEC !s_spr_y_pixel_pos,x                  ; $11A381 |

CODE_11A384:
  LDA $0000                                 ; $11A384 |
  BNE CODE_11A38E                           ; $11A387 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $11A389 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11A38B |

CODE_11A38E:
  JSR CODE_11A4F4                           ; $11A38E |
  RTL                                       ; $11A391 |

  JSL $03AA52                               ; $11A392 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A396 |
  CMP #$0020                                ; $11A399 |
  BCC CODE_11A3A5                           ; $11A39C |
  LDA #$0007                                ; $11A39E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A3A1 |
  BRA CODE_11A3AF                           ; $11A3A3 |

CODE_11A3A5:
  CLC                                       ; $11A3A5 |
  ADC #$0004                                ; $11A3A6 |
  AND #$00FF                                ; $11A3A9 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A3AC |

CODE_11A3AF:
  LDA !s_spr_wildcard_2_lo,x                ; $11A3AF |
  CMP #$00C0                                ; $11A3B2 |
  BCC CODE_11A3CB                           ; $11A3B5 |
  SEC                                       ; $11A3B7 |
  SBC #$0010                                ; $11A3B8 |
  STA !s_spr_wildcard_2_lo,x                ; $11A3BB |
  LDA !s_spr_wildcard_1_lo,x                ; $11A3BE |
  CLC                                       ; $11A3C1 |
  ADC #$0006                                ; $11A3C2 |
  STA !s_spr_wildcard_1_lo,x                ; $11A3C5 |
  INC !s_spr_y_pixel_pos,x                  ; $11A3C8 |

CODE_11A3CB:
  JSR CODE_11A4F4                           ; $11A3CB |
  RTL                                       ; $11A3CE |

  JSL $03AA52                               ; $11A3CF |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A3D3 |
  CMP #$0020                                ; $11A3D6 |
  BCC CODE_11A3E2                           ; $11A3D9 |
  LDA #$0007                                ; $11A3DB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A3DE |
  BRA CODE_11A3EC                           ; $11A3E0 |

CODE_11A3E2:
  CLC                                       ; $11A3E2 |
  ADC #$0008                                ; $11A3E3 |
  AND #$00FF                                ; $11A3E6 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A3E9 |

CODE_11A3EC:
  LDA !s_spr_wildcard_2_lo,x                ; $11A3EC |
  CMP #$00C0                                ; $11A3EF |
  BCC CODE_11A40B                           ; $11A3F2 |
  SEC                                       ; $11A3F4 |
  SBC #$0020                                ; $11A3F5 |
  STA !s_spr_wildcard_2_lo,x                ; $11A3F8 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A3FB |
  CLC                                       ; $11A3FE |
  ADC #$000C                                ; $11A3FF |
  STA !s_spr_wildcard_1_lo,x                ; $11A402 |
  INC !s_spr_y_pixel_pos,x                  ; $11A405 |
  INC !s_spr_y_pixel_pos,x                  ; $11A408 |

CODE_11A40B:
  JSR CODE_11A4F4                           ; $11A40B |
  RTL                                       ; $11A40E |

  JSL $03AA52                               ; $11A40F |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A413 |
  BEQ CODE_11A424                           ; $11A416 |
  CMP #$00E0                                ; $11A418 |
  BCS CODE_11A424                           ; $11A41B |
  LDA #$0007                                ; $11A41D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A420 |
  BRA CODE_11A42E                           ; $11A422 |

CODE_11A424:
  SEC                                       ; $11A424 |
  SBC #$0004                                ; $11A425 |
  AND #$00FF                                ; $11A428 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A42B |

CODE_11A42E:
  LDA !s_spr_wildcard_2_lo,x                ; $11A42E |
  CMP #$00C0                                ; $11A431 |
  BCC CODE_11A44A                           ; $11A434 |
  SEC                                       ; $11A436 |
  SBC #$0010                                ; $11A437 |
  STA !s_spr_wildcard_2_lo,x                ; $11A43A |
  LDA !s_spr_wildcard_1_lo,x                ; $11A43D |
  CLC                                       ; $11A440 |
  ADC #$0006                                ; $11A441 |
  STA !s_spr_wildcard_1_lo,x                ; $11A444 |
  INC !s_spr_y_pixel_pos,x                  ; $11A447 |

CODE_11A44A:
  JSR CODE_11A4F4                           ; $11A44A |
  RTL                                       ; $11A44D |

  JSL $03AA52                               ; $11A44E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A452 |
  BEQ CODE_11A463                           ; $11A455 |
  CMP #$00E0                                ; $11A457 |
  BCS CODE_11A463                           ; $11A45A |
  LDA #$0007                                ; $11A45C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A45F |
  BRA CODE_11A42E                           ; $11A461 |

CODE_11A463:
  SEC                                       ; $11A463 |
  SBC #$0008                                ; $11A464 |
  AND #$00FF                                ; $11A467 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A46A |
  LDA !s_spr_wildcard_2_lo,x                ; $11A46D |
  CMP #$00C0                                ; $11A470 |
  BCC CODE_11A48C                           ; $11A473 |
  SEC                                       ; $11A475 |
  SBC #$0020                                ; $11A476 |
  STA !s_spr_wildcard_2_lo,x                ; $11A479 |
  LDA !s_spr_wildcard_1_lo,x                ; $11A47C |
  CLC                                       ; $11A47F |
  ADC #$000C                                ; $11A480 |
  STA !s_spr_wildcard_1_lo,x                ; $11A483 |
  INC !s_spr_y_pixel_pos,x                  ; $11A486 |
  INC !s_spr_y_pixel_pos,x                  ; $11A489 |

CODE_11A48C:
  JSR CODE_11A4F4                           ; $11A48C |
  RTL                                       ; $11A48F |

  JSL $03AA52                               ; $11A490 |
  LDA !s_spr_wildcard_2_lo,x                ; $11A494 |
  CMP #$00C0                                ; $11A497 |
  BCC CODE_11A4AF                           ; $11A49A |
  SBC #$0010                                ; $11A49C |
  STA !s_spr_wildcard_2_lo,x                ; $11A49F |
  LDA !s_spr_wildcard_1_lo,x                ; $11A4A2 |
  CLC                                       ; $11A4A5 |
  ADC #$0006                                ; $11A4A6 |
  STA !s_spr_wildcard_1_lo,x                ; $11A4A9 |
  INC !s_spr_y_pixel_pos,x                  ; $11A4AC |

CODE_11A4AF:
  LDA !s_player_jump_state                  ; $11A4AF |
  BNE CODE_11A4EB                           ; $11A4B2 |
  INC !s_on_sprite_platform_flag            ; $11A4B4 |
  LDA #$0100                                ; $11A4B7 |
  SEC                                       ; $11A4BA |
  SBC !s_spr_wildcard_2_lo,x                ; $11A4BB |
  LSR A                                     ; $11A4BE |
  LSR A                                     ; $11A4BF |
  LSR A                                     ; $11A4C0 |
  LSR A                                     ; $11A4C1 |
  STA $0000                                 ; $11A4C2 |
  LDA #$001C                                ; $11A4C5 |
  SEC                                       ; $11A4C8 |
  SBC $0000                                 ; $11A4C9 |
  STA $0000                                 ; $11A4CC |
  LDA !s_spr_y_pixel_pos,x                  ; $11A4CF |
  SEC                                       ; $11A4D2 |
  SBC $0000                                 ; $11A4D3 |
  STA !s_player_y                           ; $11A4D6 |
  JSR CODE_11A741                           ; $11A4D9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A4DC |
  CMP #$0001                                ; $11A4DE |
  BEQ CODE_11A4E8                           ; $11A4E1 |
  CMP #$0003                                ; $11A4E3 |
  BNE CODE_11A4F0                           ; $11A4E6 |

CODE_11A4E8:
  JSR CODE_11A6F0                           ; $11A4E8 |

CODE_11A4EB:
  LDA #$0007                                ; $11A4EB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A4EE |

CODE_11A4F0:
  JSR CODE_11A4F4                           ; $11A4F0 |
  RTL                                       ; $11A4F3 |

CODE_11A4F4:
  LDA !s_spr_gsu_morph_1_lo,x               ; $11A4F4 |
  BPL CODE_11A4FD                           ; $11A4F7 |
  JSR CODE_11A051                           ; $11A4F9 |
  RTS                                       ; $11A4FC |

CODE_11A4FD:
  JSR CODE_11A041                           ; $11A4FD |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11A500 |
  BEQ CODE_11A50F                           ; $11A502 |
  TAY                                       ; $11A504 |
  LDA !s_spr_x_delta_lo,y                   ; $11A505 |
  CLC                                       ; $11A508 |
  ADC !s_player_x                           ; $11A509 |
  STA !s_player_x                           ; $11A50C |

CODE_11A50F:
  RTS                                       ; $11A50F |

  dw $0001, $0002                           ; $11A510 |

  JSL $03AA52                               ; $11A514 |
  LDA !s_spr_wildcard_2_lo,x                ; $11A518 |
  SEC                                       ; $11A51B |
  SBC #$0020                                ; $11A51C |
  CMP #$0060                                ; $11A51F |
  BCC CODE_11A527                           ; $11A522 |
  JMP CODE_11A5FA                           ; $11A524 |

CODE_11A527:
  JSL $03A31E                               ; $11A527 |
  JSR CODE_11A61A                           ; $11A52B |
  NOP                                       ; $11A52E |
  CMP #$022B                                ; $11A52F |
  BNE CODE_11A5B3                           ; $11A532 |
  LDA $10E2                                 ; $11A534 |
  BEQ CODE_11A53E                           ; $11A537 |
  LDA #$022C                                ; $11A539 |
  BRA CODE_11A5B3                           ; $11A53C |

CODE_11A53E:
  LDA #$F0F0                                ; $11A53E |
  STA $1130                                 ; $11A541 |
  STZ $10E6                                 ; $11A544 |
  LDA #$0001                                ; $11A547 |
  STA $10E2                                 ; $11A54A |
  LDX $112E                                 ; $11A54D |
  LDA #$0004                                ; $11A550 |
  STA !s_spr_wildcard_4_lo,x                ; $11A553 |
  LDA #$0011                                ; $11A556 |
  LDY #$5C                                  ; $11A559 |

CODE_11A55B:
  LDA !s_spr_id,y                           ; $11A55B |
  BEQ CODE_11A566                           ; $11A55E |
  DEY                                       ; $11A560 |
  DEY                                       ; $11A561 |
  DEY                                       ; $11A562 |
  DEY                                       ; $11A563 |
  BRA CODE_11A55B                           ; $11A564 |

CODE_11A566:
  LDA #$0011                                ; $11A566 |
  JSL $03A34E                               ; $11A569 |
  BCC CODE_11A5AD                           ; $11A56D |
  LDA $113C                                 ; $11A56F |
  ASL A                                     ; $11A572 |
  TAX                                       ; $11A573 |
  LDA $A510,x                               ; $11A574 |
  STA !s_spr_wildcard_4_lo,y                ; $11A577 |
  LDA #$0080                                ; $11A57A |
  STA !s_spr_y_pixel_pos,y                  ; $11A57D |
  LDA #$0078                                ; $11A580 |
  STA !s_spr_x_pixel_pos,y                  ; $11A583 |
  TYX                                       ; $11A586 |
  LDA #$022E                                ; $11A587 |
  JSL spawn_ambient_sprite                  ; $11A58A |
  LDA !s_spr_x_pixel_pos,x                  ; $11A58E |
  CLC                                       ; $11A591 |
  ADC #$FFF0                                ; $11A592 |
  STA $70A2,y                               ; $11A595 |
  LDA !s_spr_y_pixel_pos,x                  ; $11A598 |
  CLC                                       ; $11A59B |
  ADC #$FFF0                                ; $11A59C |
  STA $7142,y                               ; $11A59F |
  LDA #$0003                                ; $11A5A2 |
  STA $7782,y                               ; $11A5A5 |
  TYX                                       ; $11A5A8 |
  JSL $009ABF                               ; $11A5A9 |

CODE_11A5AD:
  LDX !s_cur_sprite_slot                    ; $11A5AD |
  LDA #$022B                                ; $11A5B0 |

CODE_11A5B3:
  PHA                                       ; $11A5B3 |
  JSL spawn_ambient_sprite                  ; $11A5B4 |
  LDA !s_spr_x_pixel_pos,x                  ; $11A5B8 |
  CLC                                       ; $11A5BB |
  ADC #$0020                                ; $11A5BC |
  STA $70A2,y                               ; $11A5BF |
  LDA !s_spr_y_pixel_pos,x                  ; $11A5C2 |
  CLC                                       ; $11A5C5 |
  ADC #$0010                                ; $11A5C6 |
  STA $7142,y                               ; $11A5C9 |
  LDA #$0002                                ; $11A5CC |
  STA $7782,y                               ; $11A5CF |
  PLA                                       ; $11A5D2 |
  PHX                                       ; $11A5D3 |
  TYX                                       ; $11A5D4 |
  CMP #$022B                                ; $11A5D5 |
  BNE CODE_11A5F4                           ; $11A5D8 |
  JSL $11A30D                               ; $11A5DA |
  LDA $70A2,x                               ; $11A5DE |
  CLC                                       ; $11A5E1 |
  ADC #$FFF4                                ; $11A5E2 |
  STA $70A2,x                               ; $11A5E5 |
  LDA $7142,x                               ; $11A5E8 |
  CLC                                       ; $11A5EB |
  ADC #$FFE0                                ; $11A5EC |
  STA $7142,x                               ; $11A5EF |
  BRA CODE_11A5F8                           ; $11A5F2 |

CODE_11A5F4:
  JSL $11A2E1                               ; $11A5F4 |

CODE_11A5F8:
  PLX                                       ; $11A5F8 |
  RTL                                       ; $11A5F9 |

CODE_11A5FA:
  STA !s_spr_wildcard_2_lo,x                ; $11A5FA |
  LDA !s_spr_wildcard_1_lo,x                ; $11A5FD |
  CLC                                       ; $11A600 |
  ADC #$0006                                ; $11A601 |
  STA !s_spr_wildcard_1_lo,x                ; $11A604 |
  INC !s_spr_y_pixel_pos,x                  ; $11A607 |
  INC !s_spr_y_pixel_pos,x                  ; $11A60A |
  LDA #$0200                                ; $11A60D |
  STA !s_player_y_speed                     ; $11A610 |
  STZ !s_player_jump_state                  ; $11A613 |
  JSR CODE_11A4F4                           ; $11A616 |
  RTL                                       ; $11A619 |

CODE_11A61A:
  PHY                                       ; $11A61A |
  JSL random_number_gen                     ; $11A61B |
  LDY $1130                                 ; $11A61F |
  BMI CODE_11A62F                           ; $11A622 |
  SEP #$20                                  ; $11A624 |
  LDA $10                                   ; $11A626 |
  AND #$1F                                  ; $11A628 |
  CMP $A657,y                               ; $11A62A |
  BCC CODE_11A636                           ; $11A62D |

CODE_11A62F:
  REP #$20                                  ; $11A62F |
  LDA #$022C                                ; $11A631 |
  BRA CODE_11A652                           ; $11A634 |

CODE_11A636:
  REP #$20                                  ; $11A636 |
  LDA #$F0F0                                ; $11A638 |
  STA $1130                                 ; $11A63B |
  LDY #$3C                                  ; $11A63E |
  LDA #$0000                                ; $11A640 |

CODE_11A643:
  STA $6EC0,y                               ; $11A643 |
  STA $7782,y                               ; $11A646 |
  DEY                                       ; $11A649 |
  DEY                                       ; $11A64A |
  DEY                                       ; $11A64B |
  DEY                                       ; $11A64C |
  BPL CODE_11A643                           ; $11A64D |
  LDA #$022B                                ; $11A64F |

CODE_11A652:
  INC $1130                                 ; $11A652 |
  PLY                                       ; $11A655 |
  RTS                                       ; $11A656 |

  db $01, $01, $03, $03, $03, $07, $07, $0F ; $11A657 |
  db $0F, $FF                               ; $11A65F |

  JSR CODE_11A665                           ; $11A661 |
  RTL                                       ; $11A664 |

CODE_11A665:
  LDA !s_player_y_speed                     ; $11A665 |
  BPL CODE_11A66D                           ; $11A668 |
  JMP CODE_11A6EF                           ; $11A66A |

CODE_11A66D:
  LDA $60AB                                 ; $11A66D |
  AND #$00FF                                ; $11A670 |
  INC A                                     ; $11A673 |
  STA $0000                                 ; $11A674 |
  LDA !s_spr_x_pixel_pos,x                  ; $11A677 |
  SEC                                       ; $11A67A |
  SBC #$0008                                ; $11A67B |
  CMP !s_player_x                           ; $11A67E |
  BCS CODE_11A6EF                           ; $11A681 |
  CLC                                       ; $11A683 |
  ADC #$0020                                ; $11A684 |
  CMP !s_player_x                           ; $11A687 |
  BCC CODE_11A6EF                           ; $11A68A |
  LDA !s_spr_y_pixel_pos,x                  ; $11A68C |
  SEC                                       ; $11A68F |
  SBC #$001C                                ; $11A690 |
  CMP !s_player_y                           ; $11A693 |
  BCS CODE_11A6EF                           ; $11A696 |
  CLC                                       ; $11A698 |
  ADC $0000                                 ; $11A699 |
  CMP !s_player_y                           ; $11A69C |
  BCC CODE_11A6EF                           ; $11A69F |
  LDA !s_spr_y_pixel_pos,x                  ; $11A6A1 |
  SEC                                       ; $11A6A4 |
  SBC #$001C                                ; $11A6A5 |
  STA !s_player_y                           ; $11A6A8 |
  INC !s_on_sprite_platform_flag            ; $11A6AB |
  LDA #$0001                                ; $11A6AE |
  STA !s_spr_gsu_morph_1_lo,x               ; $11A6B1 |
  STZ $1104                                 ; $11A6B4 |
  JSR CODE_11A741                           ; $11A6B7 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A6BA |
  JSR CODE_11A6F0                           ; $11A6BC |
  LDA #$FF00                                ; $11A6BF |
  STA $7ECE                                 ; $11A6C2 |
  STA $7ECC                                 ; $11A6C5 |
  LDA #$0008                                ; $11A6C8 |
  STA !s_spr_dyntile_index,x                ; $11A6CB |
  LDA #$0100                                ; $11A6CE |
  STA !s_spr_wildcard_1_lo,x                ; $11A6D1 |
  STA !s_spr_wildcard_2_lo,x                ; $11A6D4 |
  LDA #$0000                                ; $11A6D7 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11A6DA |
  JSR CODE_11A041                           ; $11A6DD |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11A6E0 |
  BEQ CODE_11A6EF                           ; $11A6E2 |
  TAY                                       ; $11A6E4 |
  LDA !s_spr_x_delta_lo,y                   ; $11A6E5 |
  CLC                                       ; $11A6E8 |
  ADC !s_player_x                           ; $11A6E9 |
  STA !s_player_x                           ; $11A6EC |

CODE_11A6EF:
  RTS                                       ; $11A6EF |

CODE_11A6F0:
  CMP #$0005                                ; $11A6F0 |
  BCS CODE_11A72C                           ; $11A6F3 |
  ASL A                                     ; $11A6F5 |
  TAY                                       ; $11A6F6 |
  LDA $10FA                                 ; $11A6F7 |
  BNE CODE_11A702                           ; $11A6FA |
  LDA #$0008                                ; $11A6FC |
  STA !s_player_jump_state                  ; $11A6FF |

CODE_11A702:
  LDA $A737,y                               ; $11A702 |
  STA !s_player_y_speed                     ; $11A705 |
  LDA $A72D,y                               ; $11A708 |
  STA !s_player_x_speed_prev                ; $11A70B |
  STA !s_player_x_speed                     ; $11A70E |
  STZ !s_player_ground_pound_state          ; $11A711 |
  LDA #$0013                                ; $11A714 |\ play sound #$0013
  JSL push_sound_queue                      ; $11A717 |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11A71B |
  LSR A                                     ; $11A71D |
  BCS CODE_11A72C                           ; $11A71E |
  STZ !s_on_sprite_platform_flag            ; $11A720 |
  LDA #$006B                                ; $11A723 |
  STA !s_player_cur_anim_frame              ; $11A726 |
  INC $1104                                 ; $11A729 |

CODE_11A72C:
  RTS                                       ; $11A72C |

  dw $0000, $FF00, $FE80, $0100             ; $11A72D |
  dw $0180                                  ; $11A735 |

  dw $0000, $0000, $FC00, $0000             ; $11A737 |
  dw $FC00                                  ; $11A73F |

CODE_11A741:
  STZ $0002                                 ; $11A741 |
  LDA $60AB                                 ; $11A744 |
  AND #$00FF                                ; $11A747 |
  INC A                                     ; $11A74A |
  CMP #$0008                                ; $11A74B |
  BCC CODE_11A753                           ; $11A74E |
  INC $0002                                 ; $11A750 |

CODE_11A753:
  LDA !s_spr_x_pixel_pos,x                  ; $11A753 |
  SEC                                       ; $11A756 |
  SBC #$0004                                ; $11A757 |
  CMP !s_player_x                           ; $11A75A |
  BCS CODE_11A772                           ; $11A75D |
  CLC                                       ; $11A75F |
  ADC #$0018                                ; $11A760 |
  CMP !s_player_x                           ; $11A763 |
  BCC CODE_11A76D                           ; $11A766 |
  LDA #$0005                                ; $11A768 |
  BRA CODE_11A775                           ; $11A76B |

CODE_11A76D:
  LDA #$0003                                ; $11A76D |
  BRA CODE_11A775                           ; $11A770 |

CODE_11A772:
  LDA #$0001                                ; $11A772 |

CODE_11A775:
  CLC                                       ; $11A775 |
  ADC $0002                                 ; $11A776 |
  RTS                                       ; $11A779 |

init_mini_battle_bandit_2:
  LDA #$00C0                                ; $11A77A |
  STA !s_spr_x_pixel_pos,x                  ; $11A77D |
  LDA #$00C0                                ; $11A780 |
  STA !s_spr_y_pixel_pos,x                  ; $11A783 |
  LDA #$0009                                ; $11A786 |
  STA !s_spr_anim_frame,x                   ; $11A789 |
  STX $112E                                 ; $11A78C |
  RTL                                       ; $11A78F |

main_mini_battle_bandit_2:
  LDA $10F4                                 ; $11A790 |
  BEQ CODE_11A79E                           ; $11A793 |
  STZ !s_spr_x_speed_lo,x                   ; $11A795 |
  STZ !s_spr_y_speed_lo,x                   ; $11A798 |
  STZ !s_spr_y_accel,x                      ; $11A79B |

CODE_11A79E:
  JSR CODE_11AA97                           ; $11A79E |
  JSR CODE_11ABB2                           ; $11A7A1 |
  STX $112E                                 ; $11A7A4 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11A7A7 |
  ASL A                                     ; $11A7A9 |
  TAX                                       ; $11A7AA |
  JSR ($A80A,x)                             ; $11A7AB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11A7AE |
  CMP #$0002                                ; $11A7B0 |
  BEQ CODE_11A7C1                           ; $11A7B3 |
  JSR CODE_11AA00                           ; $11A7B5 |
  JSR CODE_11AA47                           ; $11A7B8 |
  JSR CODE_11A96A                           ; $11A7BB |
  JSR CODE_11A89B                           ; $11A7BE |

CODE_11A7C1:
  LDA $10F4                                 ; $11A7C1 |
  BEQ CODE_11A7D9                           ; $11A7C4 |
  STZ !s_spr_x_speed_lo,x                   ; $11A7C6 |
  STZ !s_spr_y_speed_lo,x                   ; $11A7C9 |
  STZ !s_spr_y_accel,x                      ; $11A7CC |
  LDA #$0009                                ; $11A7CF |
  STA !s_spr_anim_frame,x                   ; $11A7D2 |
  STZ !s_spr_draw_priority,x                ; $11A7D5 |
  RTL                                       ; $11A7D8 |

CODE_11A7D9:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11A7D9 |
  CMP #$0002                                ; $11A7DB |
  BEQ CODE_11A7FD                           ; $11A7DE |
  LDA !s_spr_x_speed_lo,x                   ; $11A7E0 |
  BPL CODE_11A7E9                           ; $11A7E3 |
  EOR #$FFFF                                ; $11A7E5 |
  INC A                                     ; $11A7E8 |

CODE_11A7E9:
  CMP #$0040                                ; $11A7E9 |
  BCC CODE_11A7FD                           ; $11A7EC |
  LDA !s_spr_x_speed_lo,x                   ; $11A7EE |
  ROL A                                     ; $11A7F1 |
  ROL A                                     ; $11A7F2 |
  ROL A                                     ; $11A7F3 |
  AND #$0002                                ; $11A7F4 |
  EOR #$0002                                ; $11A7F7 |
  STA !s_spr_facing_dir,x                   ; $11A7FA |

CODE_11A7FD:
  LDA !s_spr_x_pixel_pos,x                  ; $11A7FD |
  STA $113E                                 ; $11A800 |
  LDA !s_spr_y_pixel_pos,x                  ; $11A803 |
  STA $1140                                 ; $11A806 |
  RTL                                       ; $11A809 |

  dw $AAD8                                  ; $11A80A |
  dw $ABAB                                  ; $11A80C |
  dw $A859                                  ; $11A80E |
  dw $A82B                                  ; $11A810 |
  dw $A814                                  ; $11A812 |

  LDX $112E                                 ; $11A814 |
  STZ !s_spr_x_speed_lo,x                   ; $11A817 |
  STZ !s_spr_y_speed_lo,x                   ; $11A81A |
  STZ !s_spr_y_accel,x                      ; $11A81D |
  LDA #$0009                                ; $11A820 |
  STA !s_spr_anim_frame,x                   ; $11A823 |
  STZ !s_spr_draw_priority,x                ; $11A826 |
  PLA                                       ; $11A829 |
  RTL                                       ; $11A82A |

  LDX $112E                                 ; $11A82B |
  LDA $110A                                 ; $11A82E |
  ROL A                                     ; $11A831 |
  ROL A                                     ; $11A832 |
  ROL A                                     ; $11A833 |
  AND #$0002                                ; $11A834 |
  TAY                                       ; $11A837 |
  LDA $A855,y                               ; $11A838 |
  CLC                                       ; $11A83B |
  ADC !s_spr_x_speed_lo,x                   ; $11A83C |
  STA !s_spr_x_speed_lo,x                   ; $11A83F |
  LDA $1116                                 ; $11A842 |
  CMP #$0004                                ; $11A845 |
  BCS CODE_11A854                           ; $11A848 |
  LDA #$FA00                                ; $11A84A |
  STA !s_spr_y_speed_lo,x                   ; $11A84D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $11A850 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11A852 |

CODE_11A854:
  RTS                                       ; $11A854 |

  dw $0008, $FFF8                           ; $11A855 |

  LDX $112E                                 ; $11A859 |
  LDA $7860,x                               ; $11A85C |
  LSR A                                     ; $11A85F |
  BCS CODE_11A869                           ; $11A860 |
  LDA #$001A                                ; $11A862 |
  STA !s_spr_anim_frame,x                   ; $11A865 |
  RTS                                       ; $11A868 |

CODE_11A869:
  STZ !s_spr_x_speed_lo,x                   ; $11A869 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A86C |
  TAY                                       ; $11A86F |
  LDA $A892,y                               ; $11A870 |
  AND #$00FF                                ; $11A873 |
  STA !s_spr_anim_frame,x                   ; $11A876 |
  LDA !s_spr_timer_1,x                      ; $11A879 |
  BNE CODE_11A891                           ; $11A87C |
  LDA #$0004                                ; $11A87E |
  STA !s_spr_timer_1,x                      ; $11A881 |
  INC !s_spr_gsu_morph_2_lo,x               ; $11A884 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11A887 |
  CMP #$0008                                ; $11A88A |
  BCC CODE_11A891                           ; $11A88D |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11A88F |

CODE_11A891:
  RTS                                       ; $11A891 |

  db $16, $15, $16, $15, $16, $15, $16, $15 ; $11A892 |

CODE_11A89A:
  RTS                                       ; $11A89A |

CODE_11A89B:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11A89B |
  CMP #$0002                                ; $11A89D |
  BEQ CODE_11A89A                           ; $11A8A0 |
  LDA $1104                                 ; $11A8A2 |
  BNE CODE_11A89A                           ; $11A8A5 |
  LDA $1112                                 ; $11A8A7 |
  CMP #$0010                                ; $11A8AA |
  BCS CODE_11A89A                           ; $11A8AD |
  LDA $1118                                 ; $11A8AF |
  CMP #$0010                                ; $11A8B2 |
  BCS CODE_11A89A                           ; $11A8B5 |
  CMP #$0006                                ; $11A8B7 |
  BCC CODE_11A8FB                           ; $11A8BA |
  JSR CODE_11A94D                           ; $11A8BC |
  LDA $110C                                 ; $11A8BF |
  BPL CODE_11A8E2                           ; $11A8C2 |
  LDA #$0002                                ; $11A8C4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11A8C7 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $11A8C9 |
  LDA !s_spr_x_hitbox_center,x              ; $11A8CC |
  STA $00                                   ; $11A8CF |
  LDA !s_spr_y_pixel_pos,x                  ; $11A8D1 |
  SEC                                       ; $11A8D4 |
  SBC #$0010                                ; $11A8D5 |
  STA $02                                   ; $11A8D8 |
  LDY #$3A                                  ; $11A8DA |
  JSL $03A0E7                               ; $11A8DC |
  BRA CODE_11A8FB                           ; $11A8E0 |

CODE_11A8E2:
  LDA !s_player_center_x                    ; $11A8E2 |
  STA $00                                   ; $11A8E5 |
  LDA !s_player_y                           ; $11A8E7 |
  STA $02                                   ; $11A8EA |
  LDY #$3A                                  ; $11A8EC |
  JSL $03A0E7                               ; $11A8EE |
  LDA #$006B                                ; $11A8F2 |
  STA !s_player_cur_anim_frame              ; $11A8F5 |
  INC $1104                                 ; $11A8F8 |

CODE_11A8FB:
  LDA !s_spr_x_speed_lo,x                   ; $11A8FB |
  ROL A                                     ; $11A8FE |
  ROL A                                     ; $11A8FF |
  ROL A                                     ; $11A900 |
  AND #$0002                                ; $11A901 |
  TAY                                       ; $11A904 |
  LDA $A966,y                               ; $11A905 |
  STA !s_spr_x_speed_lo,x                   ; $11A908 |
  EOR #$FFFF                                ; $11A90B |
  INC A                                     ; $11A90E |
  STA !s_player_x_speed_prev                ; $11A90F |
  STA !s_player_x_speed                     ; $11A912 |
  STZ !s_player_ground_pound_state          ; $11A915 |
  LDA !s_player_jump_state                  ; $11A918 |
  BEQ CODE_11A927                           ; $11A91B |
  LDA $110C                                 ; $11A91D |
  BMI CODE_11A927                           ; $11A920 |
  STZ !s_player_y_speed                     ; $11A922 |
  BRA CODE_11A933                           ; $11A925 |

CODE_11A927:
  LDA #$0008                                ; $11A927 |
  STA !s_player_jump_state                  ; $11A92A |
  LDA #$FA00                                ; $11A92D |
  STA !s_player_y_speed                     ; $11A930 |

CODE_11A933:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11A933 |
  BEQ CODE_11A941                           ; $11A935 |
  LDA $110C                                 ; $11A937 |
  BMI CODE_11A941                           ; $11A93A |
  STA !s_spr_y_speed_lo,x                   ; $11A93C |
  BRA CODE_11A94C                           ; $11A93F |

CODE_11A941:
  LDA #$0001                                ; $11A941 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11A944 |
  LDA #$FB00                                ; $11A946 |
  STA !s_spr_y_speed_lo,x                   ; $11A949 |

CODE_11A94C:
  RTS                                       ; $11A94C |

CODE_11A94D:
  LDA $1142                                 ; $11A94D |
  STA !s_player_x                           ; $11A950 |
  LDA $1144                                 ; $11A953 |
  STA !s_player_y                           ; $11A956 |
  LDA $113E                                 ; $11A959 |
  STA !s_spr_x_pixel_pos,x                  ; $11A95C |
  LDA $1140                                 ; $11A95F |
  STA !s_spr_y_pixel_pos,x                  ; $11A962 |
  RTS                                       ; $11A965 |

  dw $FE00, $0200                           ; $11A966 |

CODE_11A96A:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11A96A |
  BEQ CODE_11A9B1                           ; $11A96C |
  LDA !s_spr_y_speed_lo,x                   ; $11A96E |
  BMI CODE_11A9B1                           ; $11A971 |
  LDY #$5C                                  ; $11A973 |

CODE_11A975:
  LDA !s_spr_gsu_morph_1_lo,y               ; $11A975 |
  BNE CODE_11A9AB                           ; $11A978 |
  LDA !s_spr_id,y                           ; $11A97A |
  CMP #$01B6                                ; $11A97D |
  BNE CODE_11A9AB                           ; $11A980 |
  LDA !s_spr_x_pixel_pos,y                  ; $11A982 |
  CMP !s_spr_x_hitbox_center,x              ; $11A985 |
  BCS CODE_11A9AB                           ; $11A988 |
  CLC                                       ; $11A98A |
  ADC #$0020                                ; $11A98B |
  CMP !s_spr_x_hitbox_center,x              ; $11A98E |
  BCC CODE_11A9AB                           ; $11A991 |
  LDA !s_spr_y_pixel_pos,y                  ; $11A993 |
  SEC                                       ; $11A996 |
  SBC #$0010                                ; $11A997 |
  CMP !s_spr_y_pixel_pos,x                  ; $11A99A |
  BCS CODE_11A9AB                           ; $11A99D |
  CLC                                       ; $11A99F |
  ADC #$0004                                ; $11A9A0 |
  CMP !s_spr_y_pixel_pos,x                  ; $11A9A3 |
  BCC CODE_11A9AB                           ; $11A9A6 |
  JMP CODE_11A9B2                           ; $11A9A8 |

CODE_11A9AB:
  DEY                                       ; $11A9AB |
  DEY                                       ; $11A9AC |
  DEY                                       ; $11A9AD |
  DEY                                       ; $11A9AE |
  BPL CODE_11A975                           ; $11A9AF |

CODE_11A9B1:
  RTS                                       ; $11A9B1 |

CODE_11A9B2:
  LDA !s_spr_x_pixel_pos,y                  ; $11A9B2 |
  CLC                                       ; $11A9B5 |
  ADC #$0008                                ; $11A9B6 |
  CMP !s_spr_x_hitbox_center,x              ; $11A9B9 |
  BCS CODE_11A9CC                           ; $11A9BC |
  CLC                                       ; $11A9BE |
  ADC #$0010                                ; $11A9BF |
  CMP !s_spr_x_hitbox_center,x              ; $11A9C2 |
  BCC CODE_11A9D1                           ; $11A9C5 |
  LDA #$000A                                ; $11A9C7 |
  BRA CODE_11A9D4                           ; $11A9CA |

CODE_11A9CC:
  LDA #$0008                                ; $11A9CC |
  BRA CODE_11A9D4                           ; $11A9CF |

CODE_11A9D1:
  LDA #$0009                                ; $11A9D1 |

CODE_11A9D4:
  STA !s_spr_wildcard_5_lo,y                ; $11A9D4 |
  LDA #$FFFF                                ; $11A9D7 |
  STA !s_spr_gsu_morph_1_lo,y               ; $11A9DA |
  LDA #$FFF0                                ; $11A9DD |
  STA $7ECE                                 ; $11A9E0 |
  STA $7ECC                                 ; $11A9E3 |
  LDA #$0010                                ; $11A9E6 |
  STA !s_spr_dyntile_index,y                ; $11A9E9 |
  LDA #$0100                                ; $11A9EC |
  STA !s_spr_wildcard_1_lo,y                ; $11A9EF |
  STA !s_spr_wildcard_2_lo,y                ; $11A9F2 |
  LDA #$0000                                ; $11A9F5 |
  STA !s_spr_gsu_morph_2_lo,y               ; $11A9F8 |
  TYX                                       ; $11A9FB |
  JSR CODE_11A051                           ; $11A9FC |
  RTS                                       ; $11A9FF |

CODE_11AA00:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11AA00 |
  BNE CODE_11AA1A                           ; $11AA02 |
  LDA !s_spr_timer_1,x                      ; $11AA04 |
  BNE CODE_11AA12                           ; $11AA07 |
  LDA #$0003                                ; $11AA09 |
  STA !s_spr_timer_1,x                      ; $11AA0C |
  INC !s_spr_wildcard_3_lo,x                ; $11AA0F |

CODE_11AA12:
  LDA !s_spr_wildcard_3_lo,x                ; $11AA12 |
  AND #$0001                                ; $11AA15 |
  BRA CODE_11AA43                           ; $11AA18 |

CODE_11AA1A:
  LDA !s_spr_y_speed_lo,x                   ; $11AA1A |
  BPL CODE_11AA24                           ; $11AA1D |
  LDA #$0018                                ; $11AA1F |
  BRA CODE_11AA43                           ; $11AA22 |

CODE_11AA24:
  LDA $1114                                 ; $11AA24 |
  CMP #$0010                                ; $11AA27 |
  BCS CODE_11AA40                           ; $11AA2A |
  JSL random_number_gen                     ; $11AA2C |
  LDA $10                                   ; $11AA30 |
  AND #$0007                                ; $11AA32 |
  BNE CODE_11AA3B                           ; $11AA35 |
  JSL $029BD9                               ; $11AA37 |

CODE_11AA3B:
  LDA #$001A                                ; $11AA3B |
  BRA CODE_11AA43                           ; $11AA3E |

CODE_11AA40:
  LDA #$0017                                ; $11AA40 |

CODE_11AA43:
  STA !s_spr_anim_frame,x                   ; $11AA43 |
  RTS                                       ; $11AA46 |

CODE_11AA47:
  LDY $1100                                 ; $11AA47 |
  JSR CODE_11AA54                           ; $11AA4A |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11AA4D |
  BNE CODE_11AA96                           ; $11AA4F |
  LDY $1102                                 ; $11AA51 |

CODE_11AA54:
  LDA !s_spr_y_speed_lo,x                   ; $11AA54 |
  BMI CODE_11AA94                           ; $11AA57 |
  LDA !s_spr_x_pixel_pos,y                  ; $11AA59 |
  CMP !s_spr_x_hitbox_center,x              ; $11AA5C |
  BCS CODE_11AA94                           ; $11AA5F |
  CLC                                       ; $11AA61 |
  ADC #$0020                                ; $11AA62 |
  CMP !s_spr_x_hitbox_center,x              ; $11AA65 |
  BCC CODE_11AA94                           ; $11AA68 |
  LDA !s_spr_y_pixel_pos,y                  ; $11AA6A |
  SEC                                       ; $11AA6D |
  SBC #$0010                                ; $11AA6E |
  CMP !s_spr_y_pixel_pos,x                  ; $11AA71 |
  BCS CODE_11AA94                           ; $11AA74 |
  CLC                                       ; $11AA76 |
  ADC #$0008                                ; $11AA77 |
  CMP !s_spr_y_pixel_pos,x                  ; $11AA7A |
  BCC CODE_11AA94                           ; $11AA7D |
  LDY $1122                                 ; $11AA7F |
  LDA !s_spr_y_pixel_pos,y                  ; $11AA82 |
  SEC                                       ; $11AA85 |
  SBC #$0010                                ; $11AA86 |
  STA !s_spr_y_pixel_pos,x                  ; $11AA89 |
  LDA #$0001                                ; $11AA8C |
  STA !s_spr_wildcard_6_lo_dp,x             ; $11AA8F |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $11AA91 |
  RTS                                       ; $11AA93 |

CODE_11AA94:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11AA94 |

CODE_11AA96:
  RTS                                       ; $11AA96 |

CODE_11AA97:
  LDA !s_spr_y_pixel_pos,x                  ; $11AA97 |
  BPL CODE_11AAB9                           ; $11AA9A |
  LDA !s_spr_x_pixel_pos,x                  ; $11AA9C |
  CMP #$0030                                ; $11AA9F |
  BCS CODE_11AAAC                           ; $11AAA2 |
  STZ !s_spr_x_speed_lo,x                   ; $11AAA4 |
  LDA #$0030                                ; $11AAA7 |
  BRA CODE_11AAD4                           ; $11AAAA |

CODE_11AAAC:
  CMP #$00C1                                ; $11AAAC |
  BCC CODE_11AAD4                           ; $11AAAF |
  STZ !s_spr_x_speed_lo,x                   ; $11AAB1 |
  LDA #$00C0                                ; $11AAB4 |
  BRA CODE_11AAD4                           ; $11AAB7 |

CODE_11AAB9:
  LDA !s_spr_x_pixel_pos,x                  ; $11AAB9 |
  CMP #$0010                                ; $11AABC |
  BCS CODE_11AAC9                           ; $11AABF |
  STZ !s_spr_x_speed_lo,x                   ; $11AAC1 |
  LDA #$0010                                ; $11AAC4 |
  BRA CODE_11AAD4                           ; $11AAC7 |

CODE_11AAC9:
  CMP #$00E1                                ; $11AAC9 |
  BCC CODE_11AAD4                           ; $11AACC |
  STZ !s_spr_x_speed_lo,x                   ; $11AACE |
  LDA #$00E0                                ; $11AAD1 |

CODE_11AAD4:
  STA !s_spr_x_pixel_pos,x                  ; $11AAD4 |
  RTS                                       ; $11AAD7 |

  LDX $112E                                 ; $11AAD8 |
  LDA $7860,x                               ; $11AADB |
  LSR A                                     ; $11AADE |
  BCS CODE_11AAEC                           ; $11AADF |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11AAE1 |
  BNE CODE_11AAEC                           ; $11AAE3 |
  LDA #$0001                                ; $11AAE5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11AAE8 |
  BRA CODE_11AAEE                           ; $11AAEA |

CODE_11AAEC:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $11AAEC |

CODE_11AAEE:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11AAEE |
  CMP #$0001                                ; $11AAF0 |
  BNE CODE_11AB3C                           ; $11AAF3 |
  LDA $111A                                 ; $11AAF5 |
  CMP #$0004                                ; $11AAF8 |
  BNE CODE_11AB0A                           ; $11AAFB |
  LDA $1114                                 ; $11AAFD |
  CMP #$0002                                ; $11AB00 |
  BCS CODE_11AB72                           ; $11AB03 |
  LDA #$FB80                                ; $11AB05 |
  BRA CODE_11AB61                           ; $11AB08 |

CODE_11AB0A:
  LDY $1122                                 ; $11AB0A |
  LDA !s_spr_x_delta_lo,y                   ; $11AB0D |
  CLC                                       ; $11AB10 |
  ADC !s_spr_x_pixel_pos,x                  ; $11AB11 |
  STA !s_spr_x_pixel_pos,x                  ; $11AB14 |
  LDA !s_spr_x_pixel_pos,x                  ; $11AB17 |
  CMP #$0020                                ; $11AB1A |
  BCC CODE_11AB37                           ; $11AB1D |
  CMP #$00D0                                ; $11AB1F |
  BCS CODE_11AB37                           ; $11AB22 |
  LDA $110A                                 ; $11AB24 |
  ROL A                                     ; $11AB27 |
  ROL A                                     ; $11AB28 |
  ROL A                                     ; $11AB29 |
  AND #$0002                                ; $11AB2A |
  STA $00                                   ; $11AB2D |
  LDA $110A                                 ; $11AB2F |
  EOR !s_spr_x_speed_lo,x                   ; $11AB32 |
  BRA CODE_11AB83                           ; $11AB35 |

CODE_11AB37:
  LDA #$FA00                                ; $11AB37 |
  BRA CODE_11AB61                           ; $11AB3A |

CODE_11AB3C:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11AB3C |
  BNE CODE_11AB72                           ; $11AB3E |
  LDA $1114                                 ; $11AB40 |
  CMP #$0004                                ; $11AB43 |
  BCS CODE_11AB72                           ; $11AB46 |
  LDA $111A                                 ; $11AB48 |
  BEQ CODE_11AB5E                           ; $11AB4B |
  CMP #$0070                                ; $11AB4D |
  BCC CODE_11AB59                           ; $11AB50 |
  LDA #$0003                                ; $11AB52 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11AB55 |
  BRA CODE_11AB72                           ; $11AB57 |

CODE_11AB59:
  LDA #$FA00                                ; $11AB59 |
  BRA CODE_11AB61                           ; $11AB5C |

CODE_11AB5E:
  LDA #$FB00                                ; $11AB5E |

CODE_11AB61:
  STA !s_spr_y_speed_lo,x                   ; $11AB61 |
  LDA #$0001                                ; $11AB64 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11AB67 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11AB69 |
  LDA #$0038                                ; $11AB6B |\ play sound #$0038
  JSL push_sound_queue                      ; $11AB6E |/

CODE_11AB72:
  LDA $1108                                 ; $11AB72 |
  ROL A                                     ; $11AB75 |
  ROL A                                     ; $11AB76 |
  ROL A                                     ; $11AB77 |
  AND #$0002                                ; $11AB78 |
  STA $00                                   ; $11AB7B |
  LDA $1108                                 ; $11AB7D |
  EOR !s_spr_x_speed_lo,x                   ; $11AB80 |

CODE_11AB83:
  AND #$8000                                ; $11AB83 |
  BEQ CODE_11AB94                           ; $11AB86 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11AB88 |
  BNE CODE_11AB91                           ; $11AB8A |
  LDA #$0000                                ; $11AB8C |
  BRA CODE_11AB94                           ; $11AB8F |

CODE_11AB91:
  LDA #$0004                                ; $11AB91 |

CODE_11AB94:
  CLC                                       ; $11AB94 |
  ADC $00                                   ; $11AB95 |
  TAY                                       ; $11AB97 |
  LDA $ABA3,y                               ; $11AB98 |
  CLC                                       ; $11AB9B |
  ADC !s_spr_x_speed_lo,x                   ; $11AB9C |
  STA !s_spr_x_speed_lo,x                   ; $11AB9F |
  RTS                                       ; $11ABA2 |

  dw $0008, $FFF8, $0038, $FFC8             ; $11ABA3 |

CODE_11ABAB:
  LDX $112E                                 ; $11ABAB |\
  JMP CODE_11ABAB                           ; $11ABAE | | what the fuck
  RTS                                       ; $11ABB1 |/

CODE_11ABB2:
  LDA !s_player_center_x                    ; $11ABB2 |
  SEC                                       ; $11ABB5 |
  SBC !s_spr_x_hitbox_center,x              ; $11ABB6 |
  STA $1106                                 ; $11ABB9 |
  BPL CODE_11ABC2                           ; $11ABBC |
  EOR #$FFFF                                ; $11ABBE |
  INC A                                     ; $11ABC1 |

CODE_11ABC2:
  STA $1112                                 ; $11ABC2 |
  LDA !s_player_center_y                    ; $11ABC5 |
  SEC                                       ; $11ABC8 |
  SBC !s_spr_y_pixel_pos,x                  ; $11ABC9 |
  STA $110C                                 ; $11ABCC |
  BPL CODE_11ABD5                           ; $11ABCF |
  EOR #$FFFF                                ; $11ABD1 |
  INC A                                     ; $11ABD4 |

CODE_11ABD5:
  STA $1118                                 ; $11ABD5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11ABD8 |
  BEQ CODE_11ABEF                           ; $11ABDA |
  LDY $1120                                 ; $11ABDC |
  LDA !s_spr_id,y                           ; $11ABDF |
  CMP #$01B6                                ; $11ABE2 |
  BNE CODE_11ABEF                           ; $11ABE5 |
  LDA !s_spr_state,y                        ; $11ABE7 |
  BEQ CODE_11ABEF                           ; $11ABEA |
  JMP CODE_11AC87                           ; $11ABEC |

CODE_11ABEF:
  STZ $1120                                 ; $11ABEF |
  STZ $1122                                 ; $11ABF2 |
  LDY #$5C                                  ; $11ABF5 |

CODE_11ABF7:
  LDA !s_spr_state,y                        ; $11ABF7 |
  BEQ CODE_11AC4C                           ; $11ABFA |
  LDA !s_spr_id,y                           ; $11ABFC |
  CMP #$01B6                                ; $11ABFF |
  BNE CODE_11AC29                           ; $11AC02 |
  LDA !s_spr_gsu_morph_1_lo,y               ; $11AC04 |
  BNE CODE_11AC4C                           ; $11AC07 |
  LDA !s_spr_x_hitbox_center,y              ; $11AC09 |
  CLC                                       ; $11AC0C |
  ADC #$0008                                ; $11AC0D |
  STA !s_spr_x_hitbox_center,y              ; $11AC10 |
  LDA !s_spr_y_hitbox_center,y              ; $11AC13 |
  CLC                                       ; $11AC16 |
  ADC #$0005                                ; $11AC17 |
  STA !s_spr_y_hitbox_center,y              ; $11AC1A |
  LDA #$0002                                ; $11AC1D |
  STA $08                                   ; $11AC20 |
  PHY                                       ; $11AC22 |
  JSR CODE_11ACD0                           ; $11AC23 |
  PLY                                       ; $11AC26 |
  BRA CODE_11AC4C                           ; $11AC27 |

CODE_11AC29:
  CMP #$01B4                                ; $11AC29 |
  BNE CODE_11AC4C                           ; $11AC2C |
  LDA !s_spr_x_hitbox_center,y              ; $11AC2E |
  CLC                                       ; $11AC31 |
  ADC #$0008                                ; $11AC32 |
  STA !s_spr_x_hitbox_center,y              ; $11AC35 |
  LDA !s_spr_y_hitbox_center,y              ; $11AC38 |
  CLC                                       ; $11AC3B |
  ADC #$FFF8                                ; $11AC3C |
  STA !s_spr_y_hitbox_center,y              ; $11AC3F |
  LDA #$0004                                ; $11AC42 |
  STA $08                                   ; $11AC45 |
  PHY                                       ; $11AC47 |
  JSR CODE_11ACD0                           ; $11AC48 |
  PLY                                       ; $11AC4B |

CODE_11AC4C:
  DEY                                       ; $11AC4C |
  DEY                                       ; $11AC4D |
  DEY                                       ; $11AC4E |
  DEY                                       ; $11AC4F |
  BPL CODE_11ABF7                           ; $11AC50 |
  LDY #$02                                  ; $11AC52 |
  LDA $1118                                 ; $11AC54 |
  CMP $111A                                 ; $11AC57 |
  BCS CODE_11AC68                           ; $11AC5A |
  CMP #$0010                                ; $11AC5C |
  BCS CODE_11AC68                           ; $11AC5F |
  LDA !s_player_invincibility_timer         ; $11AC61 |
  BNE CODE_11AC68                           ; $11AC64 |
  LDY #$00                                  ; $11AC66 |

CODE_11AC68:
  LDA $1106,y                               ; $11AC68 |
  STA $1124                                 ; $11AC6B |
  LDA $110C,y                               ; $11AC6E |
  STA $1126                                 ; $11AC71 |
  LDA $1112,y                               ; $11AC74 |
  STA $1128                                 ; $11AC77 |
  LDA $1118,y                               ; $11AC7A |
  STA $112A                                 ; $11AC7D |
  LDA $111E,y                               ; $11AC80 |
  STA $112C                                 ; $11AC83 |
  RTS                                       ; $11AC86 |

CODE_11AC87:
  LDY $1120                                 ; $11AC87 |
  LDA !s_spr_x_hitbox_center,y              ; $11AC8A |
  CLC                                       ; $11AC8D |
  ADC #$0008                                ; $11AC8E |
  STA !s_spr_x_hitbox_center,y              ; $11AC91 |
  LDA !s_spr_y_hitbox_center,y              ; $11AC94 |
  CLC                                       ; $11AC97 |
  ADC #$0005                                ; $11AC98 |
  STA !s_spr_y_hitbox_center,y              ; $11AC9B |
  LDA #$0002                                ; $11AC9E |
  STA $08                                   ; $11ACA1 |
  STZ $1120                                 ; $11ACA3 |
  JSR CODE_11ACD0                           ; $11ACA6 |
  LDY $1122                                 ; $11ACA9 |
  LDA !s_spr_x_hitbox_center,y              ; $11ACAC |
  CLC                                       ; $11ACAF |
  ADC #$0008                                ; $11ACB0 |
  STA !s_spr_x_hitbox_center,y              ; $11ACB3 |
  LDA !s_spr_y_hitbox_center,y              ; $11ACB6 |
  CLC                                       ; $11ACB9 |
  ADC #$FFF8                                ; $11ACBA |
  STA !s_spr_y_hitbox_center,y              ; $11ACBD |
  LDA #$0004                                ; $11ACC0 |
  STA $08                                   ; $11ACC3 |
  STZ $1122                                 ; $11ACC5 |
  JSR CODE_11ACD0                           ; $11ACC8 |
  LDY #$00                                  ; $11ACCB |
  JMP CODE_11AC4C                           ; $11ACCD |

CODE_11ACD0:
  LDA !s_spr_x_hitbox_center,y              ; $11ACD0 |
  SEC                                       ; $11ACD3 |
  SBC !s_spr_x_hitbox_center,x              ; $11ACD4 |
  STA $00                                   ; $11ACD7 |
  BPL CODE_11ACDF                           ; $11ACD9 |
  EOR #$FFFF                                ; $11ACDB |
  INC A                                     ; $11ACDE |

CODE_11ACDF:
  STA $04                                   ; $11ACDF |
  LDA !s_spr_y_hitbox_center,y              ; $11ACE1 |
  CLC                                       ; $11ACE4 |
  ADC #$0008                                ; $11ACE5 |
  SEC                                       ; $11ACE8 |
  SBC !s_spr_y_hitbox_center,x              ; $11ACE9 |
  STA $02                                   ; $11ACEC |
  BPL CODE_11ACF4                           ; $11ACEE |
  EOR #$FFFF                                ; $11ACF0 |
  INC A                                     ; $11ACF3 |

CODE_11ACF4:
  STA $06                                   ; $11ACF4 |
  STY $0A                                   ; $11ACF6 |
  LDY $08                                   ; $11ACF8 |
  LDA $111E,y                               ; $11ACFA |
  BEQ CODE_11AD0F                           ; $11ACFD |
  LDA $1118,y                               ; $11ACFF |
  CMP $06                                   ; $11AD02 |
  BCC CODE_11AD29                           ; $11AD04 |
  BNE CODE_11AD0F                           ; $11AD06 |
  LDA $1112,y                               ; $11AD08 |
  CMP $04                                   ; $11AD0B |
  BCC CODE_11AD29                           ; $11AD0D |

CODE_11AD0F:
  LDA $00                                   ; $11AD0F |
  STA $1106,y                               ; $11AD11 |
  LDA $02                                   ; $11AD14 |
  STA $110C,y                               ; $11AD16 |
  LDA $04                                   ; $11AD19 |
  STA $1112,y                               ; $11AD1B |
  LDA $06                                   ; $11AD1E |
  STA $1118,y                               ; $11AD20 |
  LDA $0A                                   ; $11AD23 |
  STA $111E,y                               ; $11AD25 |
  TAY                                       ; $11AD28 |

CODE_11AD29:
  RTS                                       ; $11AD29 |

  PHP                                       ; $11AD2A |
  SEP #$30                                  ; $11AD2B |
  LDA $1135                                 ; $11AD2D |
  PHA                                       ; $11AD30 |
  LDA #$7F                                  ; $11AD31 |
  STA $1135                                 ; $11AD33 |
  JSL $108279                               ; $11AD36 |
  PLA                                       ; $11AD3A |
  STA $1135                                 ; $11AD3B |
  LDA $0374                                 ; $11AD3E |
  CMP #$FF                                  ; $11AD41 |
  BNE CODE_11AD4C                           ; $11AD43 |
  LDA #$1F                                  ; $11AD45 |
  STA !r_game_mode                          ; $11AD47 |
  BRA CODE_11AD77                           ; $11AD4A |

CODE_11AD4C:
  LDA $0376                                 ; $11AD4C |
  STA $7F7FC2                               ; $11AD4F |
  LDA #$00                                  ; $11AD53 |
  STA $7F7FC3                               ; $11AD55 |
  INC A                                     ; $11AD59 |
  STA !r_level_load_type                    ; $11AD5A |
  LDA #$0B                                  ; $11AD5D |
  STA !r_game_mode                          ; $11AD5F |
  REP #$20                                  ; $11AD62 |
  LDA $0374                                 ; $11AD64 |
  STA $7F7FC0                               ; $11AD67 |
  LDA #$01C0                                ; $11AD6B |
  STA !r_cur_screen_exit                    ; $11AD6E |
  LDA $0377                                 ; $11AD71 |
  STA !r_stars_amount                       ; $11AD74 |

CODE_11AD77:
  PLP                                       ; $11AD77 |
  RTL                                       ; $11AD78 |

  REP #$20                                  ; $11AD79 |
  STZ $39                                   ; $11AD7B |
  STZ $3B                                   ; $11AD7D |
  STZ $3D                                   ; $11AD7F |
  STZ $3F                                   ; $11AD81 |
  STZ $41                                   ; $11AD83 |
  STZ $43                                   ; $11AD85 |
  SEP #$20                                  ; $11AD87 |
  LDA #$69                                  ; $11AD89 |
  STA !r_reg_bg1sc_mirror                   ; $11AD8B |
  STA !reg_bg1sc                            ; $11AD8E |
  LDA #$39                                  ; $11AD91 |
  STA !r_reg_bg2sc_mirror                   ; $11AD93 |
  STA !reg_bg2sc                            ; $11AD96 |
  LDA #$09                                  ; $11AD99 |
  STA !r_reg_bgmode_mirror                  ; $11AD9B |
  STA !reg_bgmode                           ; $11AD9E |
  STZ !r_reg_hdmaen_mirror                  ; $11ADA1 |
  STZ !r_reg_cgadsub_mirror                 ; $11ADA4 |
  REP #$30                                  ; $11ADA7 |
  LDA #$00B0                                ; $11ADA9 |
  STA !s_player_y                           ; $11ADAC |
  LDA #$0030                                ; $11ADAF |
  STA !s_player_x                           ; $11ADB2 |
  STZ !s_screen_num_to_id                   ; $11ADB5 |
  STA !r_stars_amount                       ; $11ADB8 |
  LDA #$0030                                ; $11ADBB |
  STA $10EC                                 ; $11ADBE |
  LDA #$0001                                ; $11ADC1 |
  STA $10EE                                 ; $11ADC4 |
  STZ $10E8                                 ; $11ADC7 |
  STZ $10EA                                 ; $11ADCA |
  LDX #$01FE                                ; $11ADCD |
  LDA #$0000                                ; $11ADD0 |

CODE_11ADD3:
  STA $7F8000,x                             ; $11ADD3 |
  DEX                                       ; $11ADD7 |
  DEX                                       ; $11ADD8 |
  BPL CODE_11ADD3                           ; $11ADD9 |
  LDX #$001E                                ; $11ADDB |
  LDA #$0100                                ; $11ADDE |

CODE_11ADE1:
  STA $7F8000,x                             ; $11ADE1 |
  STA $7F81A0,x                             ; $11ADE5 |
  DEX                                       ; $11ADE9 |
  DEX                                       ; $11ADEA |
  BPL CODE_11ADE1                           ; $11ADEB |
  LDX #$0160                                ; $11ADED |

CODE_11ADF0:
  LDA #$0100                                ; $11ADF0 |
  STA $7F8000,x                             ; $11ADF3 |
  STA $7F801E,x                             ; $11ADF7 |
  TXA                                       ; $11ADFB |
  SEC                                       ; $11ADFC |
  SBC #$0020                                ; $11ADFD |
  TAX                                       ; $11AE00 |
  BNE CODE_11ADF0                           ; $11AE01 |
  SEP #$10                                  ; $11AE03 |
  LDA #$01B1                                ; $11AE05 |
  JSL spawn_sprite_init                     ; $11AE08 |
  LDA #$01B3                                ; $11AE0C |
  JSL spawn_sprite_init                     ; $11AE0F |
  SEP #$30                                  ; $11AE13 |
  JSL $0397D3                               ; $11AE15 |
  RTS                                       ; $11AE19 |

  JSL $008259                               ; $11AE1A |
  JSL spr_edge_despawn_draw                 ; $11AE1E |
  JSL draw_player                           ; $11AE22 |
  STZ $03BA                                 ; $11AE26 |
  LDA $10F8                                 ; $11AE29 |
  ASL A                                     ; $11AE2C |
  TAX                                       ; $11AE2D |
  JSR ($AE3F,x)                             ; $11AE2E |
  REP #$20                                  ; $11AE31 |
  LDX #$08                                  ; $11AE33 |
  LDA #$B1EF                                ; $11AE35 |
  JSL r_gsu_init_1                          ; $11AE38 | GSU init
  SEP #$20                                  ; $11AE3C |
  RTS                                       ; $11AE3E |

  dw $AE47                                  ; $11AE3F |
  dw $AEAC                                  ; $11AE41 |
  dw $AEC9                                  ; $11AE43 |

  db $06, $04                               ; $11AE45 |

  JSL $04DD9E                               ; $11AE47 |
  LDA !r_msg_box_state                      ; $11AE4B |
  BNE CODE_11AEA9                           ; $11AE4E |
  JSL $0397D3                               ; $11AE50 |
  REP #$30                                  ; $11AE54 |
  JSR CODE_11AEDC                           ; $11AE56 |
  SEP #$10                                  ; $11AE59 |
  LDA $10F8                                 ; $11AE5B |
  BEQ CODE_11AEA9                           ; $11AE5E |
  LDX #$5C                                  ; $11AE60 |

CODE_11AE62:
  LDA !s_spr_state,x                        ; $11AE62 |
  BEQ CODE_11AE73                           ; $11AE65 |
  STZ !s_spr_x_speed_lo,x                   ; $11AE67 |
  STZ !s_spr_y_speed_lo,x                   ; $11AE6A |
  STZ !s_spr_y_accel,x                      ; $11AE6D |
  STZ !s_spr_x_accel,x                      ; $11AE70 |

CODE_11AE73:
  DEX                                       ; $11AE73 |
  DEX                                       ; $11AE74 |
  DEX                                       ; $11AE75 |
  DEX                                       ; $11AE76 |
  BPL CODE_11AE62                           ; $11AE77 |
  LDA $10EC                                 ; $11AE79 |
  BNE CODE_11AEA9                           ; $11AE7C |
  LDA $10E6                                 ; $11AE7E |
  BNE CODE_11AEA9                           ; $11AE81 |
  LDA #$0011                                ; $11AE83 |
  JSL spawn_sprite_init                     ; $11AE86 |
  BCC CODE_11AEA9                           ; $11AE8A |
  JSL random_number_gen                     ; $11AE8C |
  AND #$0001                                ; $11AE90 |
  TAX                                       ; $11AE93 |
  LDA $AE45,x                               ; $11AE94 |
  AND #$00FF                                ; $11AE97 |
  STA !s_spr_wildcard_4_lo,y                ; $11AE9A |
  LDA #$0080                                ; $11AE9D |
  STA !s_spr_y_pixel_pos,y                  ; $11AEA0 |
  LDA #$0070                                ; $11AEA3 |
  STA !s_spr_x_pixel_pos,y                  ; $11AEA6 |

CODE_11AEA9:
  SEP #$20                                  ; $11AEA9 |
  RTS                                       ; $11AEAB |

  JSL $04DD9E                               ; $11AEAC |
  JSL $0397D3                               ; $11AEB0 |
  LDA $10FA                                 ; $11AEB4 |
  BEQ CODE_11AEC4                           ; $11AEB7 |
  LDA !s_player_jump_state                  ; $11AEB9 |
  BNE CODE_11AEC4                           ; $11AEBC |
  INC $10F8                                 ; $11AEBE |
  INC !s_player_disable_flag                ; $11AEC1 |

CODE_11AEC4:
  JSL $1191B8                               ; $11AEC4 |
  RTS                                       ; $11AEC8 |

  JSL $04DD9E                               ; $11AEC9 |
  JSL $0397D3                               ; $11AECD |
  LDA #$01                                  ; $11AED1 |
  STA !s_player_disable_flag                ; $11AED3 |
  STA $10FA                                 ; $11AED6 |
  JMP CODE_11AEC4                           ; $11AED9 |

CODE_11AEDC:
  CLC                                       ; $11AEDC |
  SED                                       ; $11AEDD |
  LDA $10E8                                 ; $11AEDE |
  ADC $03BA                                 ; $11AEE1 |
  STA $10E8                                 ; $11AEE4 |
  CLD                                       ; $11AEE7 |
  DEC $10EE                                 ; $11AEE8 |
  BNE CODE_11AF2B                           ; $11AEEB |
  SEC                                       ; $11AEED |
  SED                                       ; $11AEEE |
  LDA $10EC                                 ; $11AEEF |
  SBC #$0001                                ; $11AEF2 |
  STA $10EC                                 ; $11AEF5 |
  CLD                                       ; $11AEF8 |
  BNE CODE_11AF16                           ; $11AEF9 |
  LDY #$0000                                ; $11AEFB |
  LDA $10E8                                 ; $11AEFE |
  CMP $10EA                                 ; $11AF01 |
  BCS CODE_11AF07                           ; $11AF04 |
  INY                                       ; $11AF06 |

CODE_11AF07:
  STY $10E6                                 ; $11AF07 |
  INY                                       ; $11AF0A |
  STY $10F8                                 ; $11AF0B |
  LDA #$0001                                ; $11AF0E |
  STA $10E2                                 ; $11AF11 |
  BRA CODE_11AF2B                           ; $11AF14 |

CODE_11AF16:
  LDA $10EC                                 ; $11AF16 |
  CMP #$0006                                ; $11AF19 |
  BCS CODE_11AF25                           ; $11AF1C |
  LDA #$007F                                ; $11AF1E |\ play sound #$7F
  JSL push_sound_queue                      ; $11AF21 |/

CODE_11AF25:
  LDA #$003F                                ; $11AF25 |
  STA $10EE                                 ; $11AF28 |

CODE_11AF2B:
  PHB                                       ; $11AF2B |
  LDA #$007E                                ; $11AF2C |
  PHA                                       ; $11AF2F |
  PLB                                       ; $11AF30 |
  LDX $4800                                 ; $11AF31 |
  LDA #$3484                                ; $11AF34 |
  STA $0000,x                               ; $11AF37 |
  CLC                                       ; $11AF3A |
  ADC #$0020                                ; $11AF3B |
  STA $0010,x                               ; $11AF3E |
  LDA #$348F                                ; $11AF41 |
  STA $0020,x                               ; $11AF44 |
  ADC #$0020                                ; $11AF47 |
  STA $0030,x                               ; $11AF4A |
  LDA #$349A                                ; $11AF4D |
  STA $0040,x                               ; $11AF50 |
  ADC #$0020                                ; $11AF53 |
  STA $0050,x                               ; $11AF56 |
  LDA #$0180                                ; $11AF59 |
  STA $0002,x                               ; $11AF5C |
  STA $0012,x                               ; $11AF5F |
  STA $0022,x                               ; $11AF62 |
  STA $0032,x                               ; $11AF65 |
  STA $0042,x                               ; $11AF68 |
  STA $0052,x                               ; $11AF6B |
  LDA #$0018                                ; $11AF6E |
  STA $0004,x                               ; $11AF71 |
  STA $0014,x                               ; $11AF74 |
  STA $0024,x                               ; $11AF77 |
  STA $0034,x                               ; $11AF7A |
  STA $0044,x                               ; $11AF7D |
  STA $0054,x                               ; $11AF80 |
  TXA                                       ; $11AF83 |
  ADC #$000C                                ; $11AF84 |
  STA $0005,x                               ; $11AF87 |
  ADC #$0010                                ; $11AF8A |
  STA $0015,x                               ; $11AF8D |
  ADC #$0010                                ; $11AF90 |
  STA $0025,x                               ; $11AF93 |
  ADC #$0010                                ; $11AF96 |
  STA $0035,x                               ; $11AF99 |
  ADC #$0010                                ; $11AF9C |
  STA $0045,x                               ; $11AF9F |
  ADC #$0010                                ; $11AFA2 |
  STA $0055,x                               ; $11AFA5 |
  LDA #$007E                                ; $11AFA8 |
  STA $0007,x                               ; $11AFAB |
  STA $0017,x                               ; $11AFAE |
  STA $0027,x                               ; $11AFB1 |
  STA $0037,x                               ; $11AFB4 |
  STA $0047,x                               ; $11AFB7 |
  STA $0057,x                               ; $11AFBA |
  LDA #$0004                                ; $11AFBD |
  STA $0008,x                               ; $11AFC0 |
  STA $0018,x                               ; $11AFC3 |
  STA $0028,x                               ; $11AFC6 |
  STA $0038,x                               ; $11AFC9 |
  STA $0048,x                               ; $11AFCC |
  STA $0058,x                               ; $11AFCF |
  TXA                                       ; $11AFD2 |
  ADC #$0010                                ; $11AFD3 |
  STA $000A,x                               ; $11AFD6 |
  ADC #$0010                                ; $11AFD9 |
  STA $001A,x                               ; $11AFDC |
  ADC #$0010                                ; $11AFDF |
  STA $002A,x                               ; $11AFE2 |
  ADC #$0010                                ; $11AFE5 |
  STA $003A,x                               ; $11AFE8 |
  ADC #$0010                                ; $11AFEB |
  STA $004A,x                               ; $11AFEE |
  ADC #$0010                                ; $11AFF1 |
  STA $005A,x                               ; $11AFF4 |
  STA $4800                                 ; $11AFF7 |
  PLB                                       ; $11AFFA |
  PLB                                       ; $11AFFB |
  TXA                                       ; $11AFFC |
  SEC                                       ; $11AFFD |
  SBC #$4802                                ; $11AFFE |
  TAX                                       ; $11B001 |
  LDA $10E8                                 ; $11B002 |
  TAY                                       ; $11B005 |
  AND #$00F0                                ; $11B006 |
  LSR A                                     ; $11B009 |
  LSR A                                     ; $11B00A |
  LSR A                                     ; $11B00B |
  LSR A                                     ; $11B00C |
  ORA #$2900                                ; $11B00D |
  STA $7E480E,x                             ; $11B010 |
  ORA #$0010                                ; $11B014 |
  STA $7E481E,x                             ; $11B017 |
  TYA                                       ; $11B01B |
  AND #$000F                                ; $11B01C |
  ORA #$2900                                ; $11B01F |
  STA $7E4810,x                             ; $11B022 |
  ORA #$0010                                ; $11B026 |
  STA $7E4820,x                             ; $11B029 |
  LDA $10EC                                 ; $11B02D |
  TAY                                       ; $11B030 |
  AND #$00F0                                ; $11B031 |
  LSR A                                     ; $11B034 |
  LSR A                                     ; $11B035 |
  LSR A                                     ; $11B036 |
  LSR A                                     ; $11B037 |
  ORA #$2900                                ; $11B038 |
  STA $7E482E,x                             ; $11B03B |
  ORA #$0010                                ; $11B03F |
  STA $7E483E,x                             ; $11B042 |
  TYA                                       ; $11B046 |
  AND #$000F                                ; $11B047 |
  ORA #$2900                                ; $11B04A |
  STA $7E4830,x                             ; $11B04D |
  ORA #$0010                                ; $11B051 |
  STA $7E4840,x                             ; $11B054 |
  LDA $10EA                                 ; $11B058 |
  TAY                                       ; $11B05B |
  AND #$00F0                                ; $11B05C |
  LSR A                                     ; $11B05F |
  LSR A                                     ; $11B060 |
  LSR A                                     ; $11B061 |
  LSR A                                     ; $11B062 |
  ORA #$2900                                ; $11B063 |
  STA $7E484E,x                             ; $11B066 |
  ORA #$0010                                ; $11B06A |
  STA $7E485E,x                             ; $11B06D |
  TYA                                       ; $11B071 |
  AND #$000F                                ; $11B072 |
  ORA #$2900                                ; $11B075 |
  STA $7E4850,x                             ; $11B078 |
  ORA #$0010                                ; $11B07C |
  STA $7E4860,x                             ; $11B07F |
  RTS                                       ; $11B083 |

  dw $FF00, $0100                           ; $11B084 |

init_coin_cannon:
  LDA #$0038                                ; $11B088 |
  STA !s_spr_y_pixel_pos,x                  ; $11B08B |
  LDA #$0070                                ; $11B08E |
  STA !s_spr_x_pixel_pos,x                  ; $11B091 |
  STZ !s_spr_wildcard_2_lo,x                ; $11B094 |
  LDY !s_spr_wildcard_2_lo,x                ; $11B097 |
  LDA $B084,y                               ; $11B09A |
  STA !s_spr_x_speed_lo,x                   ; $11B09D |
  LDA #$0040                                ; $11B0A0 |
  STA !s_spr_timer_1,x                      ; $11B0A3 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11B0A6 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11B0A8 |
  LDA #$0100                                ; $11B0AB |
  STA !s_spr_gsu_morph_2_lo,x               ; $11B0AE |
  LDA #$0100                                ; $11B0B1 |
  STA !s_spr_wildcard_1_lo,x                ; $11B0B4 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $11B0B7 |
  STZ !s_spr_dyntile_index,x                ; $11B0B9 |
  LDA #$0080                                ; $11B0BC |
  STA !gsu_r12                              ; $11B0BF |
  LDA #$0055                                ; $11B0C2 |
  STA !gsu_r13                              ; $11B0C5 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B0C8 |
  STA !gsu_r5                               ; $11B0CB |
  LDA !s_spr_gsu_morph_2_lo,x               ; $11B0CE |
  STA !gsu_r6                               ; $11B0D1 |
  LDA !s_spr_wildcard_1_lo,x                ; $11B0D4 |
  STA !gsu_r11                              ; $11B0D7 |
  LDY !s_spr_dyntile_index,x                ; $11B0DA |
  TYX                                       ; $11B0DD |
  LDA $03A9CE,x                             ; $11B0DE |
  STA !gsu_r3                               ; $11B0E2 |
  LDA $03A9EE,x                             ; $11B0E5 |
  STA !gsu_r2                               ; $11B0E9 |
  LDX #$08                                  ; $11B0EC |
  LDA #$84A5                                ; $11B0EE |
  JSL r_gsu_init_1                          ; $11B0F1 | GSU init
  INC $0CF9                                 ; $11B0F5 |
  LDX $12                                   ; $11B0F8 |

CODE_11B0FA:
  RTL                                       ; $11B0FA |

; cannon rotation distances
  dw $0020, $00E0                           ; $11B0FB |

; cannon white track distances
  dw $0018, $00C8                           ; $11B0FF |

; cannon rotation speeds
  dw $0002, $FFFE                           ; $11B103 |

  dw $0133, $014D, $0166, $0133, $0100      ; $11B107 |

  dw $00CD, $00B3, $009A, $0100, $0100      ; $11B111 |

  dw $000A, $000A, $0010, $0004, $0000      ; $11B11B |

main_coin_cannon:
  LDA $10F8                                 ; $11B125 |
  BNE CODE_11B0FA                           ; $11B128 |
  LDA !s_spr_timer_1,x                      ; $11B12A |
  BEQ CODE_11B15B                           ; $11B12D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $11B12F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $11B131 |
  AND #$0003                                ; $11B133 |
  BEQ CODE_11B13B                           ; $11B136 |

CODE_11B138:
  JMP CODE_11B218                           ; $11B138 |

CODE_11B13B:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $11B13B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B13D |
  CLC                                       ; $11B140 |
  ADC $B103,y                               ; $11B141 |
  AND #$00FF                                ; $11B144 |
  STA !s_spr_gsu_morph_1_lo,x               ; $11B147 |
  CMP $B0FB,y                               ; $11B14A |
  BNE CODE_11B158                           ; $11B14D |
  TYA                                       ; $11B14F |
  AND #$00FF                                ; $11B150 |
  EOR #$0002                                ; $11B153 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $11B156 |

CODE_11B158:
  JMP CODE_11B214                           ; $11B158 |

CODE_11B15B:
  LDA !s_spr_timer_3,x                      ; $11B15B |
  BNE CODE_11B138                           ; $11B15E |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11B160 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11B162 |
  ASL A                                     ; $11B164 |
  TAY                                       ; $11B165 |
  CPY #$08                                  ; $11B166 |
  BEQ CODE_11B16D                           ; $11B168 |

CODE_11B16A:
  JMP CODE_11B1F3                           ; $11B16A |

CODE_11B16D:
  PHY                                       ; $11B16D |
  LDA #$01B2                                ; $11B16E |
  JSL spawn_sprite_init                     ; $11B171 |
  BCC CODE_11B16A                           ; $11B175 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B177 |
  CLC                                       ; $11B17A |
  ADC #$0008                                ; $11B17B |
  STA !s_spr_x_pixel_pos,y                  ; $11B17E |
  LDA !s_spr_y_pixel_pos,x                  ; $11B181 |
  CLC                                       ; $11B184 |
  ADC #$0008                                ; $11B185 |
  STA !s_spr_y_pixel_pos,y                  ; $11B188 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B18B |
  CLC                                       ; $11B18E |
  ADC #$0040                                ; $11B18F |
  AND #$00FF                                ; $11B192 |
  ASL A                                     ; $11B195 |
  TAX                                       ; $11B196 |
  LDA $00E9D4,x                             ; $11B197 |
  ASL A                                     ; $11B19B |
  ASL A                                     ; $11B19C |
  STA !s_spr_y_speed_lo,y                   ; $11B19D |
  LDA $00E954,x                             ; $11B1A0 |
  ASL A                                     ; $11B1A4 |
  STA !s_spr_x_speed_lo,y                   ; $11B1A5 |
  LDX $12                                   ; $11B1A8 |
  LDA #$022A                                ; $11B1AA |
  JSL spawn_ambient_sprite                  ; $11B1AD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B1B1 |
  STA $7E8C,y                               ; $11B1B4 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B1B7 |
  CLC                                       ; $11B1BA |
  ADC #$0008                                ; $11B1BB |
  STA $70A2,y                               ; $11B1BE |
  LDA !s_spr_y_pixel_pos,x                  ; $11B1C1 |
  STA $7142,y                               ; $11B1C4 |
  LDA #$002C                                ; $11B1C7 |
  STA $78C0,y                               ; $11B1CA |
  LDA #$000C                                ; $11B1CD |
  STA $78C2,y                               ; $11B1D0 |
  LDA #$0000                                ; $11B1D3 |
  STA $73C2,y                               ; $11B1D6 |
  LDA #$0003                                ; $11B1D9 |
  STA $7782,y                               ; $11B1DC |
  LDA #$0004                                ; $11B1DF |
  STA $7E8E,y                               ; $11B1E2 |
  LDA #$0024                                ; $11B1E5 |
  STA $7002,y                               ; $11B1E8 |
  LDA #$0047                                ; $11B1EB |\ play sound #$0047
  JSL push_sound_queue                      ; $11B1EE |/
  PLY                                       ; $11B1F2 |

CODE_11B1F3:
  LDA $B107,y                               ; $11B1F3 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11B1F6 |
  LDA $B111,y                               ; $11B1F9 |
  STA !s_spr_wildcard_1_lo,x                ; $11B1FC |
  LDA $B11B,y                               ; $11B1FF |
  STA !s_spr_timer_3,x                      ; $11B202 |
  BNE CODE_11B214                           ; $11B205 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11B207 |
  LDA $10                                   ; $11B209 |
  AND #$003F                                ; $11B20B |
  ADC #$0040                                ; $11B20E |
  STA !s_spr_timer_1,x                      ; $11B211 |

CODE_11B214:
  JSL $11B0BC                               ; $11B214 |

CODE_11B218:
  LDY !s_spr_wildcard_2_lo,x                ; $11B218 |
  LDA !s_spr_cam_x_pos,x                    ; $11B21B |
  CMP $B0FF,y                               ; $11B21E |
  BNE CODE_11B23A                           ; $11B221 |
  STZ !s_spr_x_subpixel_pos,x               ; $11B223 |
  LDA $B0FF,y                               ; $11B226 |
  STA !s_spr_x_pixel_pos,x                  ; $11B229 |
  TYA                                       ; $11B22C |
  EOR #$0002                                ; $11B22D |
  TAY                                       ; $11B230 |
  STA !s_spr_wildcard_2_lo,x                ; $11B231 |
  LDA $B084,y                               ; $11B234 |
  STA !s_spr_x_speed_lo,x                   ; $11B237 |

CODE_11B23A:
  RTL                                       ; $11B23A |

init_mini_battle_coin:
  LDY #$00                                  ; $11B23B |
  LDA !s_spr_x_speed_lo,x                   ; $11B23D |
  BPL CODE_11B244                           ; $11B240 |
  INY                                       ; $11B242 |
  INY                                       ; $11B243 |

CODE_11B244:
  TYA                                       ; $11B244 |
  STA !s_spr_facing_dir,x                   ; $11B245 |
  RTL                                       ; $11B248 |

  dw $0006, $0000                           ; $11B249 |

main_mini_battle_coin:
  LDA $10F8                                 ; $11B24D |
  BEQ CODE_11B255                           ; $11B250 |
  JMP CODE_11B30A                           ; $11B252 |

CODE_11B255:
  LDY !s_spr_collision_id,x                 ; $11B255 |
  BEQ CODE_11B2C4                           ; $11B258 |
  BMI CODE_11B284                           ; $11B25A |
  DEY                                       ; $11B25C |
  LDA !s_spr_gsu_morph_1_lo,y               ; $11B25D |
  BNE CODE_11B2C4                           ; $11B260 |
  CLC                                       ; $11B262 |
  SED                                       ; $11B263 |
  LDA $10EA                                 ; $11B264 |
  ADC #$0001                                ; $11B267 |
  STA $10EA                                 ; $11B26A |
  CLD                                       ; $11B26D |
  STZ !s_spr_wildcard_2_lo,x                ; $11B26E |
  DEC $03BA                                 ; $11B271 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B274 |
  STA $00                                   ; $11B277 |
  LDA !s_spr_y_pixel_pos,x                  ; $11B279 |
  SEC                                       ; $11B27C |
  SBC #$0004                                ; $11B27D |
  STA $02                                   ; $11B280 |
  BRA CODE_11B2A0                           ; $11B282 |

CODE_11B284:
  LDA !s_player_invincibility_timer         ; $11B284 |
  CMP #$0081                                ; $11B287 |
  BCS CODE_11B2C4                           ; $11B28A |
  LDA #$0002                                ; $11B28C |
  STA !s_spr_wildcard_2_lo,x                ; $11B28F |
  LDA !s_player_x                           ; $11B292 |
  STA $00                                   ; $11B295 |
  LDA !s_player_y                           ; $11B297 |
  SEC                                       ; $11B29A |
  SBC #$0004                                ; $11B29B |
  STA $02                                   ; $11B29E |

CODE_11B2A0:
  LDA #$0003                                ; $11B2A0 |
  JSL $03B481                               ; $11B2A3 |
  LDA !s_spr_wildcard_2_lo,x                ; $11B2A7 |
  TAX                                       ; $11B2AA |
  LDA $7002,y                               ; $11B2AB |
  AND #$FFF0                                ; $11B2AE |
  ORA $B249,x                               ; $11B2B1 |
  STA $7002,y                               ; $11B2B4 |
  LDX $12                                   ; $11B2B7 |
  LDA #$0009                                ; $11B2B9 |\ play sound #$0009
  JSL push_sound_queue                      ; $11B2BC |/
  JML $03A31E                               ; $11B2C0 |

CODE_11B2C4:
  LDA $7860,x                               ; $11B2C4 |
  LSR A                                     ; $11B2C7 |
  BCC CODE_11B2F9                           ; $11B2C8 |
  LDA !s_spr_y_speed_lo,x                   ; $11B2CA |
  BMI CODE_11B2F9                           ; $11B2CD |
  LSR A                                     ; $11B2CF |
  EOR #$FFFF                                ; $11B2D0 |
  INC A                                     ; $11B2D3 |
  STA !s_spr_y_speed_lo,x                   ; $11B2D4 |
  CMP #$FFF0                                ; $11B2D7 |
  BCS CODE_11B2E5                           ; $11B2DA |
  LDA #$002C                                ; $11B2DC |\ play sound #$002C
  JSL push_sound_queue                      ; $11B2DF |/
  BRA CODE_11B2F9                           ; $11B2E3 |

CODE_11B2E5:
  STZ !s_spr_y_speed_lo,x                   ; $11B2E5 |
  LDA !s_spr_x_speed_lo,x                   ; $11B2E8 |
  BPL CODE_11B2F1                           ; $11B2EB |
  EOR #$FFFF                                ; $11B2ED |
  INC A                                     ; $11B2F0 |

CODE_11B2F1:
  CMP #$0010                                ; $11B2F1 |
  BCS CODE_11B2F9                           ; $11B2F4 |
  STZ !s_spr_x_speed_lo,x                   ; $11B2F6 |

CODE_11B2F9:
  LDA !s_spr_y_speed_lo,x                   ; $11B2F9 |
  BMI CODE_11B30A                           ; $11B2FC |
  LDA #$0034                                ; $11B2FE |
  STA !s_spr_oam_yxppccct,x                 ; $11B301 |
  LDA #$0003                                ; $11B304 |
  STA !s_spr_draw_priority,x                ; $11B307 |

CODE_11B30A:
  LDA !r_frame_counter_global               ; $11B30A |
  LSR A                                     ; $11B30D |
  LSR A                                     ; $11B30E |
  LSR A                                     ; $11B30F |
  AND #$0003                                ; $11B310 |
  STA !s_spr_anim_frame,x                   ; $11B313 |
  RTL                                       ; $11B316 |

init_mini_battle_bandit:
  LDA #$00C0                                ; $11B317 |
  STA !s_spr_y_pixel_pos,x                  ; $11B31A |
  LDA #$00C0                                ; $11B31D |
  STA !s_spr_x_pixel_pos,x                  ; $11B320 |
  LDA #$0009                                ; $11B323 |
  STA !s_spr_anim_frame,x                   ; $11B326 |

CODE_11B329:
  RTL                                       ; $11B329 |

main_mini_battle_bandit:
  LDA $10F8                                 ; $11B32A |
  BNE CODE_11B329                           ; $11B32D |
  LDA !s_player_invincibility_timer         ; $11B32F |
  CMP #$0081                                ; $11B332 |
  BCS CODE_11B33A                           ; $11B335 |
  STZ !s_player_invincibility_timer         ; $11B337 |

CODE_11B33A:
  LDA !s_spr_cam_x_pos,x                    ; $11B33A |
  CMP #$0010                                ; $11B33D |
  BCS CODE_11B352                           ; $11B340 |
  LDA #$0010                                ; $11B342 |
  SEC                                       ; $11B345 |
  SBC !s_spr_cam_x_pos,x                    ; $11B346 |
  CLC                                       ; $11B349 |
  ADC !s_spr_x_pixel_pos,x                  ; $11B34A |
  STA !s_spr_x_pixel_pos,x                  ; $11B34D |
  BRA CODE_11B36B                           ; $11B350 |

CODE_11B352:
  LDA !s_spr_cam_x_pos,x                    ; $11B352 |
  SEC                                       ; $11B355 |
  SBC #$00E0                                ; $11B356 |
  BMI CODE_11B375                           ; $11B359 |
  CMP #$0020                                ; $11B35B |
  BCC CODE_11B36B                           ; $11B35E |
  STA $00                                   ; $11B360 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B362 |
  SEC                                       ; $11B365 |
  SBC $00                                   ; $11B366 |
  STA !s_spr_x_pixel_pos,x                  ; $11B368 |

CODE_11B36B:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11B36B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B36D |
  BEQ CODE_11B375                           ; $11B370 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11B372 |

CODE_11B375:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11B375 |
  ASL A                                     ; $11B377 |
  TAY                                       ; $11B378 |
  LDA $B381,y                               ; $11B379 |
  STA $00                                   ; $11B37C |
  JMP ($7960)                               ; $11B37E |

  dw $B38B                                  ; $11B381 |
  dw $B41A                                  ; $11B383 |
  dw $B4CB                                  ; $11B385 |
  dw $B632                                  ; $11B387 |
  dw $B6BD                                  ; $11B389 |

  LDA !s_player_invincibility_timer         ; $11B38B |
  BNE CODE_11B39A                           ; $11B38E |
  LDA $10                                   ; $11B390 |
  AND #$00FF                                ; $11B392 |
  CMP #$00A0                                ; $11B395 |
  BCC CODE_11B3C2                           ; $11B398 |

CODE_11B39A:
  TXA                                       ; $11B39A |
  AND #$00FF                                ; $11B39B |
  STA !gsu_r1                               ; $11B39E |
  LDX #$09                                  ; $11B3A1 |
  LDA #$8DDA                                ; $11B3A3 |
  JSL r_gsu_init_1                          ; $11B3A6 | GSU init
  LDX $12                                   ; $11B3AA |
  LDA !gsu_r1                               ; $11B3AC |
  BMI CODE_11B3C2                           ; $11B3AF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11B3B1 |
  TAY                                       ; $11B3B3 |
  LDA !s_spr_x_pixel_pos,y                  ; $11B3B4 |
  STA $00                                   ; $11B3B7 |
  LDA #$0200                                ; $11B3B9 |
  STA $02                                   ; $11B3BC |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11B3BE |
  BRA CODE_11B3D7                           ; $11B3C0 |

CODE_11B3C2:
  LDA !s_player_x                           ; $11B3C2 |
  STA $00                                   ; $11B3C5 |
  LDA #$0200                                ; $11B3C7 |
  STA $02                                   ; $11B3CA |
  LDA #$0002                                ; $11B3CC |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11B3CF |
  LDA #$0050                                ; $11B3D1 |
  STA !s_spr_timer_1,x                      ; $11B3D4 |

CODE_11B3D7:
  LDA $00                                   ; $11B3D7 |
  STA !gsu_r1                               ; $11B3D9 |
  LDA !s_spr_y_pixel_pos,x                  ; $11B3DC |
  STA !gsu_r2                               ; $11B3DF |
  STA !gsu_r4                               ; $11B3E2 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B3E5 |
  STA !gsu_r3                               ; $11B3E8 |
  LDA $02                                   ; $11B3EB |
  STA !gsu_r6                               ; $11B3ED |
  LDX #$09                                  ; $11B3F0 |
  LDA #$907C                                ; $11B3F2 |
  JSL r_gsu_init_1                          ; $11B3F5 | GSU init
  LDX $12                                   ; $11B3F9 |
  LDY #$02                                  ; $11B3FB |
  LDA !gsu_r1                               ; $11B3FD |
  STA !s_spr_x_speed_lo,x                   ; $11B400 |
  BPL CODE_11B407                           ; $11B403 |
  DEY                                       ; $11B405 |
  DEY                                       ; $11B406 |

CODE_11B407:
  TYA                                       ; $11B407 |
  STA !s_spr_facing_dir,x                   ; $11B408 |
  LDA #$0001                                ; $11B40B |
  STA !s_spr_anim_frame,x                   ; $11B40E |
  LDA #$0003                                ; $11B411 |
  STA !s_spr_timer_2,x                      ; $11B414 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11B417 |
  RTL                                       ; $11B419 |

  LDY !s_spr_wildcard_5_lo_dp,x             ; $11B41A |
  LDA !s_spr_x_pixel_pos,y                  ; $11B41C |
  STA !gsu_r1                               ; $11B41F |
  LDA !s_spr_y_pixel_pos,x                  ; $11B422 |
  STA !gsu_r2                               ; $11B425 |
  STA !gsu_r4                               ; $11B428 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B42B |
  STA !gsu_r3                               ; $11B42E |
  LDA #$0300                                ; $11B431 |
  STA !gsu_r6                               ; $11B434 |
  LDX #$09                                  ; $11B437 |
  LDA #$907C                                ; $11B439 |
  JSL r_gsu_init_1                          ; $11B43C | GSU init
  LDX $12                                   ; $11B440 |
  LDA !gsu_r1                               ; $11B442 |
  STA !s_spr_x_speed_lo,x                   ; $11B445 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11B448 |
  LDA !s_spr_x_pixel_pos,x                  ; $11B44A |
  SEC                                       ; $11B44D |
  SBC !s_spr_x_pixel_pos,y                  ; $11B44E |
  BEQ CODE_11B458                           ; $11B451 |
  EOR !gsu_r1                               ; $11B453 |
  BMI CODE_11B45E                           ; $11B456 |

CODE_11B458:
  LDA !s_spr_x_pixel_pos,y                  ; $11B458 |
  STA !s_spr_x_pixel_pos,x                  ; $11B45B |

CODE_11B45E:
  LDA $7860,y                               ; $11B45E |
  LSR A                                     ; $11B461 |
  BCS CODE_11B495                           ; $11B462 |
  LDA !s_spr_y_pixel_pos,y                  ; $11B464 |
  CMP #$00A0                                ; $11B467 |
  BCS CODE_11B495                           ; $11B46A |
  LDA $7860,x                               ; $11B46C |
  LSR A                                     ; $11B46F |
  BCC CODE_11B495                           ; $11B470 |
  LDA !s_spr_x_pixel_pos,y                  ; $11B472 |
  SEC                                       ; $11B475 |
  SBC !s_spr_x_pixel_pos,x                  ; $11B476 |
  CLC                                       ; $11B479 |
  ADC #$0038                                ; $11B47A |
  CMP #$0070                                ; $11B47D |
  BCS CODE_11B495                           ; $11B480 |
  LDA $7860,x                               ; $11B482 |
  LSR A                                     ; $11B485 |
  BCC CODE_11B495                           ; $11B486 |
  LDA #$FA00                                ; $11B488 |
  STA !s_spr_y_speed_lo,x                   ; $11B48B |
  LDA #$0038                                ; $11B48E |\ play sound #$0038
  JSL push_sound_queue                      ; $11B491 |/

CODE_11B495:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11B495 |
  LDA !s_spr_state,y                        ; $11B497 |
  BNE CODE_11B4A4                           ; $11B49A |
  STZ !s_spr_x_speed_lo,x                   ; $11B49C |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11B49F |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11B4A1 |

CODE_11B4A4:
  LDY #$09                                  ; $11B4A4 |
  LDA !s_spr_x_speed_lo,x                   ; $11B4A6 |
  BEQ CODE_11B4BE                           ; $11B4A9 |
  LDA !s_spr_timer_2,x                      ; $11B4AB |
  BNE CODE_11B4C2                           ; $11B4AE |
  LDA #$0003                                ; $11B4B0 |
  STA !s_spr_timer_2,x                      ; $11B4B3 |
  LDY !s_spr_anim_frame,x                   ; $11B4B6 |
  DEY                                       ; $11B4B9 |
  BPL CODE_11B4BE                           ; $11B4BA |
  LDY #$01                                  ; $11B4BC |

CODE_11B4BE:
  TYA                                       ; $11B4BE |
  STA !s_spr_anim_frame,x                   ; $11B4BF |

CODE_11B4C2:
  RTL                                       ; $11B4C2 |

  dw $FD00, $0300                           ; $11B4C3 |

  dw $0300, $FD00                           ; $11B4C7 |

  LDY !s_spr_collision_id,x                 ; $11B4CB |
  BPL CODE_11B4D3                           ; $11B4CE |
  JMP CODE_11B570                           ; $11B4D0 |

CODE_11B4D3:
  LDA $7860,x                               ; $11B4D3 |
  LSR A                                     ; $11B4D6 |
  BCC CODE_11B502                           ; $11B4D7 |
  LDA !s_player_x                           ; $11B4D9 |
  SEC                                       ; $11B4DC |
  SBC !s_spr_x_pixel_pos,x                  ; $11B4DD |
  CLC                                       ; $11B4E0 |
  ADC #$0038                                ; $11B4E1 |
  CMP #$0070                                ; $11B4E4 |
  BCS CODE_11B502                           ; $11B4E7 |
  LDA #$FC00                                ; $11B4E9 |
  STA !s_spr_y_speed_lo,x                   ; $11B4EC |
  LDA #$0017                                ; $11B4EF |
  STA !s_spr_anim_frame,x                   ; $11B4F2 |
  LDA #$0003                                ; $11B4F5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11B4F8 |
  LDA #$0038                                ; $11B4FA |\ play sound #$0038
  JSL push_sound_queue                      ; $11B4FD |/
  RTL                                       ; $11B501 |

CODE_11B502:
  LDA !s_player_x                           ; $11B502 |
  STA !gsu_r1                               ; $11B505 |
  LDA !s_spr_y_pixel_pos,x                  ; $11B508 |
  STA !gsu_r2                               ; $11B50B |
  STA !gsu_r4                               ; $11B50E |
  LDA !s_spr_x_pixel_pos,x                  ; $11B511 |
  STA !gsu_r3                               ; $11B514 |
  LDA #$0200                                ; $11B517 |
  STA !gsu_r6                               ; $11B51A |
  LDX #$09                                  ; $11B51D |
  LDA #$907C                                ; $11B51F |
  JSL r_gsu_init_1                          ; $11B522 | GSU init
  LDX $12                                   ; $11B526 |
  LDA !gsu_r1                               ; $11B528 |
  STA !s_spr_x_speed_lo,x                   ; $11B52B |
  LDA !s_spr_x_pixel_pos,x                  ; $11B52E |
  SEC                                       ; $11B531 |
  SBC !s_player_x                           ; $11B532 |
  BEQ CODE_11B53C                           ; $11B535 |
  EOR !gsu_r1                               ; $11B537 |
  BMI CODE_11B542                           ; $11B53A |

CODE_11B53C:
  LDA !s_player_x                           ; $11B53C |
  STA !s_spr_x_pixel_pos,x                  ; $11B53F |

CODE_11B542:
  LDA !s_spr_timer_1,x                      ; $11B542 |
  BEQ CODE_11B567                           ; $11B545 |
  LDY #$09                                  ; $11B547 |
  LDA !s_spr_x_speed_lo,x                   ; $11B549 |
  BEQ CODE_11B561                           ; $11B54C |
  LDA !s_spr_timer_2,x                      ; $11B54E |
  BNE CODE_11B56F                           ; $11B551 |
  LDA #$0003                                ; $11B553 |
  STA !s_spr_timer_2,x                      ; $11B556 |
  LDY !s_spr_anim_frame,x                   ; $11B559 |
  DEY                                       ; $11B55C |
  BPL CODE_11B561                           ; $11B55D |
  LDY #$01                                  ; $11B55F |

CODE_11B561:
  TYA                                       ; $11B561 |
  STA !s_spr_anim_frame,x                   ; $11B562 |
  BRA CODE_11B56F                           ; $11B565 |

CODE_11B567:
  LDA #$0009                                ; $11B567 |
  STA !s_spr_anim_frame,x                   ; $11B56A |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11B56D |

CODE_11B56F:
  RTL                                       ; $11B56F |

CODE_11B570:
  LDA !s_spr_y_player_delta,x               ; $11B570 |
  SEC                                       ; $11B573 |
  SBC !s_player_hitbox_half_height          ; $11B574 |
  SEC                                       ; $11B577 |
  SBC !s_spr_hitbox_height,x                ; $11B578 |
  CMP #$FFF8                                ; $11B57B |
  BCC CODE_11B5D7                           ; $11B57E |
  LDY #$3A                                  ; $11B580 |
  JSL $03A0E7                               ; $11B582 |
  LDA #$001C                                ; $11B586 |\ play sound #$001C
  JSL push_sound_queue                      ; $11B589 |/
  LDA #$0001                                ; $11B58D |
  STA !s_spr_gsu_morph_1_lo,x               ; $11B590 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11B593 |
  CMP #$0003                                ; $11B595 |
  BNE CODE_11B5BD                           ; $11B598 |
  LDA !s_spr_y_speed_lo,x                   ; $11B59A |
  BPL CODE_11B5A8                           ; $11B59D |
  EOR #$FFFF                                ; $11B59F |
  INC A                                     ; $11B5A2 |
  STA !s_spr_y_speed_lo,x                   ; $11B5A3 |
  BRA CODE_11B5BD                           ; $11B5A6 |

CODE_11B5A8:
  LDA #$FC00                                ; $11B5A8 |
  STA !s_spr_y_speed_lo,x                   ; $11B5AB |
  LDY !s_spr_x_player_dir,x                 ; $11B5AE |
  LDA $B4C7,y                               ; $11B5B1 |
  STA !s_spr_x_speed_lo,x                   ; $11B5B4 |
  LDA #$0017                                ; $11B5B7 |
  STA !s_spr_anim_frame,x                   ; $11B5BA |

CODE_11B5BD:
  LDA #$0008                                ; $11B5BD |
  STA !s_player_jump_state                  ; $11B5C0 |
  LDA #$FA00                                ; $11B5C3 |
  STA !s_player_y_speed                     ; $11B5C6 |
  LDY !s_spr_x_player_dir,x                 ; $11B5C9 |
  LDA $B4C3,y                               ; $11B5CC |
  STA !s_player_x_speed_prev                ; $11B5CF |
  STA !s_player_x_speed                     ; $11B5D2 |
  BRA CODE_11B62C                           ; $11B5D5 |

CODE_11B5D7:
  LDA !s_spr_y_player_delta,x               ; $11B5D7 |
  CLC                                       ; $11B5DA |
  ADC !s_player_hitbox_half_height          ; $11B5DB |
  CLC                                       ; $11B5DE |
  ADC !s_spr_hitbox_height,x                ; $11B5DF |
  CMP #$0008                                ; $11B5E2 |
  BCC CODE_11B5F0                           ; $11B5E5 |
  LDA #$0034                                ; $11B5E7 |\ play sound #$0034
  JSL push_sound_queue                      ; $11B5EA |/
  BRA CODE_11B5A8                           ; $11B5EE |

CODE_11B5F0:
  LDA #$0017                                ; $11B5F0 |\ play sound #$0017
  JSL push_sound_queue                      ; $11B5F3 |/
  JSL $04F74A                               ; $11B5F7 |
  LDA #$00C0                                ; $11B5FB |
  STA !s_player_invincibility_timer         ; $11B5FE |
  STZ !s_player_ground_pound_state          ; $11B601 |
  LDA !s_player_jump_state                  ; $11B604 |
  BNE CODE_11B617                           ; $11B607 |
  LDA !s_player_y_speed                     ; $11B609 |
  BPL CODE_11B5A8                           ; $11B60C |
  EOR #$FFFF                                ; $11B60E |
  INC A                                     ; $11B611 |
  STA !s_player_y_speed                     ; $11B612 |
  BRA CODE_11B617                           ; $11B615 |

CODE_11B617:
  LDA #$FC00                                ; $11B617 |
  STA !s_spr_y_speed_lo,x                   ; $11B61A |
  LDY !s_spr_x_player_dir,x                 ; $11B61D |
  LDA $B4C7,y                               ; $11B620 |
  STA !s_spr_x_speed_lo,x                   ; $11B623 |
  LDA #$0017                                ; $11B626 |
  STA !s_spr_anim_frame,x                   ; $11B629 |

CODE_11B62C:
  LDA #$0003                                ; $11B62C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11B62F |
  RTL                                       ; $11B631 |

  LDA !s_spr_gsu_morph_1_lo,x               ; $11B632 |
  BNE CODE_11B640                           ; $11B635 |
  LDY !s_spr_collision_id,x                 ; $11B637 |
  BPL CODE_11B640                           ; $11B63A |
  JSL $11B570                               ; $11B63C |

CODE_11B640:
  LDY #$BD18                                ; $11B640 |
  JSL $011072                               ; $11B643 |
  DEY                                       ; $11B647 |
  TYA                                       ; $11B648 |
  STA !s_spr_anim_frame,x                   ; $11B649 |
  LDA $7860,x                               ; $11B64C |
  LSR A                                     ; $11B64F |
  BCC CODE_11B678                           ; $11B650 |
  STZ !s_spr_x_speed_lo,x                   ; $11B652 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11B655 |
  LDA #$0019                                ; $11B657 |
  STA !s_spr_anim_frame,x                   ; $11B65A |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11B65D |
  LDA #$0004                                ; $11B65F |
  STA !s_spr_timer_2,x                      ; $11B662 |
  STZ !s_spr_y_subpixel_pos,x               ; $11B665 |
  LDA #$00C0                                ; $11B668 |
  STA !s_spr_y_pixel_pos,x                  ; $11B66B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11B66E |
  BEQ CODE_11B678                           ; $11B671 |
  LDA #$0006                                ; $11B673 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $11B676 |

CODE_11B678:
  RTL                                       ; $11B678 |

  dw $0019, $001A, $001B, $001C             ; $11B679 |
  dw $001D, $0009, $0012, $0013             ; $11B681 |
  dw $0014, $0015, $0016, $0015             ; $11B689 |
  dw $0016, $0015, $0016, $0015             ; $11B691 |
  dw $0009                                  ; $11B699 |

  dw $0004, $0004, $0008, $0002             ; $11B69B |
  dw $0002, $0000, $0004, $0004             ; $11B6A3 |
  dw $0004, $0014, $0002, $0002             ; $11B6AB |
  dw $0002, $0002, $0002, $0014             ; $11B6B3 |
  dw $0000                                  ; $11B6BB |

  LDA !s_spr_timer_2,x                      ; $11B6BD |
  BNE CODE_11B6DB                           ; $11B6C0 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $11B6C2 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11B6C4 |
  ASL A                                     ; $11B6C6 |
  TAY                                       ; $11B6C7 |
  LDA $B679,y                               ; $11B6C8 |
  STA !s_spr_anim_frame,x                   ; $11B6CB |
  LDA $B69B,y                               ; $11B6CE |
  STA !s_spr_timer_2,x                      ; $11B6D1 |
  BNE CODE_11B6DB                           ; $11B6D4 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11B6D6 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11B6D8 |

CODE_11B6DB:
  RTL                                       ; $11B6DB |

  dw $6060, $2520, $2521, $2522             ; $11B6DC |
  dw $257F, $2523, $2524, $E532             ; $11B6E4 |
  dw $A530, $2530, $A521, $A521             ; $11B6EC |
  dw $257F, $2533, $2534, $2532             ; $11B6F4 |
  dw $2529, $2D20, $2D21, $2D22             ; $11B6FC |
  dw $2D7F, $2D25, $2D21, $ED31             ; $11B704 |
  dw $2D26, $AD30, $2D30, $AD21             ; $11B70C |
  dw $AD21, $2D7F, $2D35, $AD21             ; $11B714 |
  dw $2D31, $2D35, $2D29, $0003             ; $11B71C |
  dw $0006, $0005, $0007, $B744             ; $11B724 |
  dw $35AC, $0180, $DE18, $11B6             ; $11B72C |
  dw $0010, $B738, $35CC, $0180             ; $11B734 |
  dw $EE18, $11B6, $0010, $B744             ; $11B73C |
  dw $B75E, $35AC, $0180, $FE18             ; $11B744 |
  dw $11B6, $0012, $B752, $35CC             ; $11B74C |
  dw $0180, $1018, $11B7, $0012             ; $11B754 |
  dw $B75E, $6B6B, $6B6B, $6B6B             ; $11B75C |
  dw $6060, $6B6B, $6B6B, $6B6B             ; $11B764 |
  dw $6B6B                                  ; $11B76C |

  REP #$20                                  ; $11B76E |
  STZ $39                                   ; $11B770 |
  STZ $3B                                   ; $11B772 |
  STZ $3D                                   ; $11B774 |
  STZ $3F                                   ; $11B776 |
  STZ $41                                   ; $11B778 |
  STZ $43                                   ; $11B77A |
  LDY #$69                                  ; $11B77C |
  STY !r_reg_bg1sc_mirror                   ; $11B77E |
  STY !reg_bg1sc                            ; $11B781 |
  LDY #$39                                  ; $11B784 |
  STY !r_reg_bg2sc_mirror                   ; $11B786 |
  STY !reg_bg2sc                            ; $11B789 |
  LDY #$09                                  ; $11B78C |
  STY !r_reg_bgmode_mirror                  ; $11B78E |
  STY !reg_bgmode                           ; $11B791 |
  LDY #$00                                  ; $11B794 |
  STY !r_reg_hdmaen_mirror                  ; $11B796 |
  STY !r_reg_cgadsub_mirror                 ; $11B799 |
  REP #$20                                  ; $11B79C |
  LDA #$00B0                                ; $11B79E |
  STA !s_player_y                           ; $11B7A1 |
  LDA #$0030                                ; $11B7A4 |
  STA !s_player_x                           ; $11B7A7 |
  STZ !s_screen_num_to_id                   ; $11B7AA |
  STA !r_stars_amount                       ; $11B7AD |
  STZ $03BC                                 ; $11B7B0 |
  LDA #$0008                                ; $11B7B3 |
  STA $1100                                 ; $11B7B6 |
  STA $1102                                 ; $11B7B9 |
  LDA #$FFFF                                ; $11B7BC |
  STA !s_sprset_1_index                     ; $11B7BF |
  STA !s_sprset_3_index                     ; $11B7C2 |
  STA !s_sprset_5_index                     ; $11B7C5 |
  STZ !s_screen_num_to_id                   ; $11B7C8 |
  LDA #$FCEB                                ; $11B7CB |
  STA $32                                   ; $11B7CE |
  LDA #$0001                                ; $11B7D0 |
  STA !r_header_bg1_tileset                 ; $11B7D3 |
  LDA #$01B7                                ; $11B7D6 |
  JSL spawn_sprite_init                     ; $11B7D9 |
  LDA #$01B8                                ; $11B7DD |
  JSL spawn_sprite_init                     ; $11B7E0 |
  LDA #$0030                                ; $11B7E4 |
  STA !s_spr_x_pixel_pos,y                  ; $11B7E7 |
  LDA #$0050                                ; $11B7EA |
  STA !s_spr_y_pixel_pos,y                  ; $11B7ED |
  LDA #$01B8                                ; $11B7F0 |
  JSL spawn_sprite_init                     ; $11B7F3 |
  LDA #$00B0                                ; $11B7F7 |
  STA !s_spr_x_pixel_pos,y                  ; $11B7FA |
  LDA #$0040                                ; $11B7FD |
  STA !s_spr_y_pixel_pos,y                  ; $11B800 |
  LDA #$01B8                                ; $11B803 |
  JSL spawn_sprite_init                     ; $11B806 |
  LDA #$0020                                ; $11B80A |
  STA !s_spr_x_pixel_pos,y                  ; $11B80D |
  LDA #$0090                                ; $11B810 |
  STA !s_spr_y_pixel_pos,y                  ; $11B813 |
  LDA #$01B8                                ; $11B816 |
  JSL spawn_sprite_init                     ; $11B819 |
  LDA #$00A0                                ; $11B81D |
  STA !s_spr_x_pixel_pos,y                  ; $11B820 |
  LDA #$0080                                ; $11B823 |
  STA !s_spr_y_pixel_pos,y                  ; $11B826 |
  LDA #$01B8                                ; $11B829 |
  JSL spawn_sprite_init                     ; $11B82C |
  LDA #$0090                                ; $11B830 |
  STA !s_spr_x_pixel_pos,y                  ; $11B833 |
  LDA #$00C0                                ; $11B836 |
  STA !s_spr_y_pixel_pos,y                  ; $11B839 |
  LDA #$01B8                                ; $11B83C |
  JSL spawn_sprite_init                     ; $11B83F |
  LDA #$00E0                                ; $11B843 |
  STA !s_spr_x_pixel_pos,y                  ; $11B846 |
  LDA #$00C0                                ; $11B849 |
  STA !s_spr_y_pixel_pos,y                  ; $11B84C |
  JSL $0397D3                               ; $11B84F |
  LDA #$15                                  ; $11B853 |
  STA $34                                   ; $11B855 |
  JSL $108B61                               ; $11B857 |
  RTS                                       ; $11B85B |

  JSL $008259                               ; $11B85C |
  LDA #$30                                  ; $11B860 |
  STA $6126                                 ; $11B862 |
  JSL spr_edge_despawn_draw                 ; $11B865 |
  JSL draw_player                           ; $11B869 |
  STZ $03BA                                 ; $11B86D |
  LDA $10F8                                 ; $11B870 |
  ASL A                                     ; $11B873 |
  TAX                                       ; $11B874 |
  JSR ($B886,x)                             ; $11B875 |
  REP #$20                                  ; $11B878 |
  LDX #$08                                  ; $11B87A |
  LDA #$B1EF                                ; $11B87C |
  JSL r_gsu_init_1                          ; $11B87F | GSU init
  SEP #$20                                  ; $11B883 |
  RTS                                       ; $11B885 |

  dw $B88C                                  ; $11B886 |
  dw $B89D                                  ; $11B888 |
  dw $B8C2                                  ; $11B88A |

  JSL $04DD9E                               ; $11B88C |
  LDA !r_msg_box_state                      ; $11B890 |
  BNE CODE_11B89C                           ; $11B893 |
  JSL $0397D3                               ; $11B895 |
  JSR CODE_11B8E2                           ; $11B899 |

CODE_11B89C:
  RTS                                       ; $11B89C |

  JSL $04DD9E                               ; $11B89D |
  JSL $0397D3                               ; $11B8A1 |
  LDA $10FA                                 ; $11B8A5 |
  BEQ CODE_11B8BF                           ; $11B8A8 |
  LDA !s_player_jump_state                  ; $11B8AA |
  BNE CODE_11B8BF                           ; $11B8AD |
  REP #$20                                  ; $11B8AF |
  LDA #$0080                                ; $11B8B1 |
  STA $10F0                                 ; $11B8B4 |
  SEP #$20                                  ; $11B8B7 |
  INC $10F8                                 ; $11B8B9 |
  INC !s_player_disable_flag                ; $11B8BC |

CODE_11B8BF:
  JMP CODE_11AEC4                           ; $11B8BF |
  JSL $04DD9E                               ; $11B8C2 |
  JSL $0397D3                               ; $11B8C6 |
  REP #$20                                  ; $11B8CA |
  DEC $10F0                                 ; $11B8CC |
  BNE CODE_11B8D5                           ; $11B8CF |
  JSL $11AD2A                               ; $11B8D1 |

CODE_11B8D5:
  LDA #$0001                                ; $11B8D5 |
  STA !s_player_disable_flag                ; $11B8D8 |
  JMP CODE_11AEC4                           ; $11B8DB |

  dw $0001, $0002                           ; $11B8DE |

CODE_11B8E2:
  LDA $03BC                                 ; $11B8E2 |
  BEQ CODE_11B8FD                           ; $11B8E5 |
  LDA $03BC                                 ; $11B8E7 |
  ASL A                                     ; $11B8EA |
  STA $04                                   ; $11B8EB |
  LDA $1100                                 ; $11B8ED |
  SEC                                       ; $11B8F0 |
  SBC $04                                   ; $11B8F1 |
  BPL CODE_11B8F7                           ; $11B8F3 |
  LDA #$00                                  ; $11B8F5 |

CODE_11B8F7:
  STA $1100                                 ; $11B8F7 |
  STZ $03BC                                 ; $11B8FA |

CODE_11B8FD:
  PHB                                       ; $11B8FD |
  LDA #$7E                                  ; $11B8FE |
  PHA                                       ; $11B900 |
  PLB                                       ; $11B901 |
  REP #$30                                  ; $11B902 |
  LDX $4800                                 ; $11B904 |
  LDA #$3483                                ; $11B907 |
  STA $0000,x                               ; $11B90A |
  LDA #$3495                                ; $11B90D |
  STA $001C,x                               ; $11B910 |
  LDA #$0180                                ; $11B913 |
  STA $0002,x                               ; $11B916 |
  STA $001E,x                               ; $11B919 |
  LDA #$0018                                ; $11B91C |
  STA $0004,x                               ; $11B91F |
  STA $0020,x                               ; $11B922 |
  TXA                                       ; $11B925 |
  CLC                                       ; $11B926 |
  ADC #$000C                                ; $11B927 |
  STA $0005,x                               ; $11B92A |
  ADC #$001C                                ; $11B92D |
  STA $0021,x                               ; $11B930 |
  LDA #$007E                                ; $11B933 |
  STA $0007,x                               ; $11B936 |
  STA $0023,x                               ; $11B939 |
  LDA #$0010                                ; $11B93C |
  STA $0008,x                               ; $11B93F |
  STA $0024,x                               ; $11B942 |
  TXA                                       ; $11B945 |
  ADC #$001C                                ; $11B946 |
  STA $000A,x                               ; $11B949 |
  ADC #$001C                                ; $11B94C |
  STA $0026,x                               ; $11B94F |
  STA $4800                                 ; $11B952 |
  PLB                                       ; $11B955 |
  TXA                                       ; $11B956 |
  SEC                                       ; $11B957 |
  SBC #$4802                                ; $11B958 |
  STA $04                                   ; $11B95B |
  TAX                                       ; $11B95D |
  LDY $1100                                 ; $11B95E |
  LDA #$0008                                ; $11B961 |
  SEC                                       ; $11B964 |
  SBC $1100                                 ; $11B965 |
  STA $06                                   ; $11B968 |
  CMP #$0008                                ; $11B96A |
  BEQ CODE_11B986                           ; $11B96D |
  LDA #$2948                                ; $11B96F |

CODE_11B972:
  STA $7E480E,x                             ; $11B972 |
  INX                                       ; $11B976 |
  INX                                       ; $11B977 |
  DEY                                       ; $11B978 |
  BNE CODE_11B972                           ; $11B979 |
  LDA #$2949                                ; $11B97B |
  STA $7E480C,x                             ; $11B97E |
  LDA $06                                   ; $11B982 |
  BEQ CODE_11B993                           ; $11B984 |

CODE_11B986:
  LDA #$2946                                ; $11B986 |

CODE_11B989:
  STA $7E480E,x                             ; $11B989 |
  INX                                       ; $11B98D |
  INX                                       ; $11B98E |
  DEC $06                                   ; $11B98F |
  BNE CODE_11B989                           ; $11B991 |

CODE_11B993:
  LDX $04                                   ; $11B993 |
  LDY $1102                                 ; $11B995 |
  LDA #$0008                                ; $11B998 |
  SEC                                       ; $11B99B |
  SBC $1102                                 ; $11B99C |
  STA $06                                   ; $11B99F |
  CMP #$0008                                ; $11B9A1 |
  BEQ CODE_11B9BD                           ; $11B9A4 |
  LDA #$2948                                ; $11B9A6 |

CODE_11B9A9:
  STA $7E482A,x                             ; $11B9A9 |
  INX                                       ; $11B9AD |
  INX                                       ; $11B9AE |
  DEY                                       ; $11B9AF |
  BNE CODE_11B9A9                           ; $11B9B0 |
  LDA #$2949                                ; $11B9B2 |
  STA $7E4828,x                             ; $11B9B5 |
  LDA $06                                   ; $11B9B9 |
  BEQ CODE_11B9CA                           ; $11B9BB |

CODE_11B9BD:
  LDA #$2946                                ; $11B9BD |

CODE_11B9C0:
  STA $7E482A,x                             ; $11B9C0 |
  INX                                       ; $11B9C4 |
  INX                                       ; $11B9C5 |
  DEC $06                                   ; $11B9C6 |
  BNE CODE_11B9C0                           ; $11B9C8 |

CODE_11B9CA:
  LDY #$0002                                ; $11B9CA |
  LDA $1100                                 ; $11B9CD |
  BEQ CODE_11B9DA                           ; $11B9D0 |
  LDA $1102                                 ; $11B9D2 |
  BNE CODE_11B9F9                           ; $11B9D5 |
  LDY #$0000                                ; $11B9D7 |

CODE_11B9DA:
  TYA                                       ; $11B9DA |
  LSR A                                     ; $11B9DB |
  STA $10E6                                 ; $11B9DC |
  LDA $B726,y                               ; $11B9DF |
  STA $4D                                   ; $11B9E2 |
  LDA $B8DE,y                               ; $11B9E4 |
  STA $10F8                                 ; $11B9E7 |
  LDA #$0200                                ; $11B9EA |
  STA $10F0                                 ; $11B9ED |
  JSR CODE_11B9FC                           ; $11B9F0 |
  LDA #$0001                                ; $11B9F3 |
  STA $10E2                                 ; $11B9F6 |

CODE_11B9F9:
  SEP #$30                                  ; $11B9F9 |
  RTS                                       ; $11B9FB |

CODE_11B9FC:
  LDX #$005C                                ; $11B9FC |

CODE_11B9FF:
  LDA !s_spr_state,x                        ; $11B9FF |
  BEQ CODE_11BA28                           ; $11BA02 |
  LDA !s_spr_id,x                           ; $11BA04 |
  CMP #$01B7                                ; $11BA07 |
  BNE CODE_11BA17                           ; $11BA0A |
  CPY #$0000                                ; $11BA0C |
  BNE CODE_11BA17                           ; $11BA0F |
  LDA #$000E                                ; $11BA11 |
  STA !s_spr_state,x                        ; $11BA14 |

CODE_11BA17:
  LDA !s_spr_bitwise_settings_3,x           ; $11BA17 |
  AND #$6000                                ; $11BA1A |
  BNE CODE_11BA28                           ; $11BA1D |
  STZ !s_spr_x_speed_lo,x                   ; $11BA1F |
  STZ !s_spr_y_accel,x                      ; $11BA22 |
  STZ !s_spr_x_accel,x                      ; $11BA25 |

CODE_11BA28:
  STZ !s_spr_gsu_morph_2_lo,x               ; $11BA28 |
  DEX                                       ; $11BA2B |
  DEX                                       ; $11BA2C |
  DEX                                       ; $11BA2D |
  DEX                                       ; $11BA2E |
  BPL CODE_11B9FF                           ; $11BA2F |
  CPY #$0000                                ; $11BA31 |
  BNE CODE_11BA68                           ; $11BA34 |
  LDA $10F2                                 ; $11BA36 |
  BNE CODE_11BA68                           ; $11BA39 |
  SEP #$10                                  ; $11BA3B |
  LDA #$0011                                ; $11BA3D |
  LDY #$04                                  ; $11BA40 |
  JSL $03A34E                               ; $11BA42 |
  JSL random_number_gen                     ; $11BA46 |
  AND #$0003                                ; $11BA4A |
  CMP #$0003                                ; $11BA4D |
  BNE CODE_11BA55                           ; $11BA50 |
  LDA #$0000                                ; $11BA52 |

CODE_11BA55:
  CLC                                       ; $11BA55 |
  ADC #$0007                                ; $11BA56 |
  STA !s_spr_wildcard_4_lo,y                ; $11BA59 |
  LDA #$0098                                ; $11BA5C |
  STA !s_spr_y_pixel_pos,y                  ; $11BA5F |
  LDA #$0078                                ; $11BA62 |
  STA !s_spr_x_pixel_pos,y                  ; $11BA65 |

CODE_11BA68:
  RTS                                       ; $11BA68 |

init_mini_battle_bandit_3:
  LDA #$00C0                                ; $11BA69 |
  STA !s_spr_y_pixel_pos,x                  ; $11BA6C |
  LDA #$00C0                                ; $11BA6F |
  STA !s_spr_x_pixel_pos,x                  ; $11BA72 |
  LDA #$0004                                ; $11BA75 |
  STA !s_spr_timer_1,x                      ; $11BA78 |
  RTL                                       ; $11BA7B |

  dw $0002, $0003, $0004, $0005             ; $11BA7C |
  dw $0006, $0007, $0000, $0001             ; $11BA84 |
  dw $0008, $0009, $000A, $000B             ; $11BA8C |
  dw $000C, $000D, $000E, $000F             ; $11BA94 |
  dw $0010, $0011, $0012, $0013             ; $11BA9C |
  dw $0014, $0015, $0016, $0017             ; $11BAA4 |
  dw $0018, $0019, $001A, $001B             ; $11BAAC |
  dw $001A                                  ; $11BAB4 |

  dw $0004, $0004, $0004, $0004             ; $11BAB6 |
  dw $0004, $0004, $0000, $0000             ; $11BABE |
  dw $0002, $0002, $0008, $0008             ; $11BAC6 |
  dw $0000, $0000, $0000, $0000             ; $11BACE |
  dw $0000, $0002, $0002, $0002             ; $11BAD6 |
  dw $0002, $0002, $0002, $0002             ; $11BADE |
  dw $0002, $0000, $0000, $0000             ; $11BAE6 |
  dw $0000                                  ; $11BAEE |

  dw $0000, $0006, $0008, $000A             ; $11BAF0 |
  dw $000C, $0013, $0019                    ; $11BAF8 |

  dw $0006, $0008, $000A, $000C             ; $11BAFE |
  dw $0013, $0019, $001D                    ; $11BB06 |

  dw $0008, $0000                           ; $11BB0C |

main_mini_battle_bandit_3:
  LDA $10F8                                 ; $11BB10 |
  BEQ CODE_11BB1E                           ; $11BB13 |
  LDA #$0005                                ; $11BB15 |
  STA !s_spr_wildcard_4_lo,x                ; $11BB18 |
  JMP CODE_11BC1B                           ; $11BB1B |

CODE_11BB1E:
  LDY !s_spr_facing_dir,x                   ; $11BB1E |
  LDA !s_spr_x_pixel_pos,x                  ; $11BB21 |
  CLC                                       ; $11BB24 |
  ADC $BB0C,y                               ; $11BB25 |
  STA !gsu_r8                               ; $11BB28 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BB2B |
  STA !gsu_r0                               ; $11BB2E |
  LDX #$0A                                  ; $11BB31 |
  LDA #$CE2F                                ; $11BB33 |
  JSL r_gsu_init_3                          ; $11BB36 | GSU init
  LDX $12                                   ; $11BB3A |
  REP #$10                                  ; $11BB3C |
  LDA #$0010                                ; $11BB3E |
  STA $00                                   ; $11BB41 |
  LDA #$0600                                ; $11BB43 |
  LDY !gsu_r6                               ; $11BB46 |
  BEQ CODE_11BB55                           ; $11BB49 |
  LDY !gsu_r5                               ; $11BB4B |
  BNE CODE_11BB55                           ; $11BB4E |
  STZ $00                                   ; $11BB50 |
  LDA #$0000                                ; $11BB52 |

CODE_11BB55:
  STA $02                                   ; $11BB55 |
  SEP #$10                                  ; $11BB57 |
  LDA !s_spr_bitwise_settings_1,x           ; $11BB59 |
  AND #$F9FF                                ; $11BB5C |
  ORA $02                                   ; $11BB5F |
  STA !s_spr_bitwise_settings_1,x           ; $11BB61 |
  LDA !s_spr_oam_1,x                        ; $11BB64 |
  AND #$FFEF                                ; $11BB67 |
  ORA $00                                   ; $11BB6A |
  STA !s_spr_oam_1,x                        ; $11BB6C |
  LDA !s_spr_state,x                        ; $11BB6F |
  CMP #$0010                                ; $11BB72 |
  BNE CODE_11BB98                           ; $11BB75 |
  LDY !s_spr_collision_id,x                 ; $11BB77 |
  BEQ CODE_11BBD9                           ; $11BB7A |
  BMI CODE_11BBD9                           ; $11BB7C |
  DEY                                       ; $11BB7E |
  LDA !s_spr_id,y                           ; $11BB7F |
  CMP #$0107                                ; $11BB82 |
  BNE CODE_11BBD9                           ; $11BB85 |
  LDA !s_spr_gsu_morph_2_lo,y               ; $11BB87 |
  BNE CODE_11BBD9                           ; $11BB8A |
  LDA !s_spr_timer_3,x                      ; $11BB8C |
  BNE CODE_11BBD9                           ; $11BB8F |
  TYX                                       ; $11BB91 |
  JSL $03B24B                               ; $11BB92 |
  BRA CODE_11BBB0                           ; $11BB96 |

CODE_11BB98:
  PLA                                       ; $11BB98 |
  PLY                                       ; $11BB99 |
  LDA #$0010                                ; $11BB9A |
  STA !s_spr_state,x                        ; $11BB9D |
  LDA !s_spr_timer_3,x                      ; $11BBA0 |
  BNE CODE_11BBD9                           ; $11BBA3 |
  LDA $1102                                 ; $11BBA5 |
  BEQ CODE_11BBB0                           ; $11BBA8 |
  DEC $1102                                 ; $11BBAA |
  DEC $1102                                 ; $11BBAD |

CODE_11BBB0:
  LDA #$FD00                                ; $11BBB0 |
  STA !s_spr_y_speed_lo,x                   ; $11BBB3 |
  LDA #$0004                                ; $11BBB6 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11BBB9 |
  LDA #$0080                                ; $11BBBB |
  STA !s_spr_timer_3,x                      ; $11BBBE |
  LDA #$0020                                ; $11BBC1 |
  STA !s_spr_oam_yxppccct,x                 ; $11BBC4 |
  LDA #$0075                                ; $11BBC7 |\ play sound #$0075
  JSL push_sound_queue                      ; $11BBCA |/
  LDA $1102                                 ; $11BBCE |
  BEQ CODE_11BBD9                           ; $11BBD1 |
  DEC $1102                                 ; $11BBD3 |
  DEC $1102                                 ; $11BBD6 |

CODE_11BBD9:
  SEP #$20                                  ; $11BBD9 |
  LDY #$04                                  ; $11BBDB |
  LDA !s_spr_timer_3,x                      ; $11BBDD |
  AND #$04                                  ; $11BBE0 |
  BEQ CODE_11BBE6                           ; $11BBE2 |
  LDY #$FF                                  ; $11BBE4 |

CODE_11BBE6:
  TYA                                       ; $11BBE6 |
  STA !s_spr_draw_priority,x                ; $11BBE7 |
  REP #$20                                  ; $11BBEA |
  LDA !s_spr_cam_x_pos,x                    ; $11BBEC |
  CMP #$0010                                ; $11BBEF |
  BCS CODE_11BC04                           ; $11BBF2 |
  LDA #$0010                                ; $11BBF4 |
  SEC                                       ; $11BBF7 |
  SBC !s_spr_cam_x_pos,x                    ; $11BBF8 |
  CLC                                       ; $11BBFB |
  ADC !s_spr_x_pixel_pos,x                  ; $11BBFC |
  STA !s_spr_x_pixel_pos,x                  ; $11BBFF |
  BRA CODE_11BC18                           ; $11BC02 |

CODE_11BC04:
  LDA !s_spr_cam_x_pos,x                    ; $11BC04 |
  SEC                                       ; $11BC07 |
  SBC #$00E0                                ; $11BC08 |
  BMI CODE_11BC1B                           ; $11BC0B |
  STA $00                                   ; $11BC0D |
  LDA !s_spr_x_pixel_pos,x                  ; $11BC0F |
  SEC                                       ; $11BC12 |
  SBC $00                                   ; $11BC13 |
  STA !s_spr_x_pixel_pos,x                  ; $11BC15 |

CODE_11BC18:
  STZ !s_spr_x_speed_lo,x                   ; $11BC18 |

CODE_11BC1B:
  PEA $BC29                                 ; $11BC1B |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11BC1E |
  ASL A                                     ; $11BC20 |
  TAY                                       ; $11BC21 |
  LDA $BCE7,y                               ; $11BC22 |
  STA $00                                   ; $11BC25 |
  JMP ($7960)                               ; $11BC27 |
  LDA $110A                                 ; $11BC2A |
  BEQ CODE_11BC30                           ; $11BC2D |

CODE_11BC2F:
  RTL                                       ; $11BC2F |

CODE_11BC30:
  LDA !s_spr_timer_2,x                      ; $11BC30 |
  BNE CODE_11BC2F                           ; $11BC33 |
  LDA !s_spr_x_speed_lo,x                   ; $11BC35 |
  BNE CODE_11BC41                           ; $11BC38 |
  LDA #$0013                                ; $11BC3A |
  STA !s_spr_anim_frame,x                   ; $11BC3D |
  RTL                                       ; $11BC40 |

CODE_11BC41:
  BPL CODE_11BC47                           ; $11BC41 |
  EOR #$FFFF                                ; $11BC43 |
  INC A                                     ; $11BC46 |

CODE_11BC47:
  CMP #$0100                                ; $11BC47 |
  BCS CODE_11BC5B                           ; $11BC4A |
  LDA #$0005                                ; $11BC4C |
  CMP $110E                                 ; $11BC4F |
  BEQ CODE_11BC67                           ; $11BC52 |
  STA $110E                                 ; $11BC54 |
  ASL A                                     ; $11BC57 |
  TAY                                       ; $11BC58 |
  BRA CODE_11BC83                           ; $11BC59 |

CODE_11BC5B:
  LDA $110E                                 ; $11BC5B |
  BEQ CODE_11BC67                           ; $11BC5E |
  STZ $110E                                 ; $11BC60 |
  LDY #$00                                  ; $11BC63 |
  BRA CODE_11BC83                           ; $11BC65 |

CODE_11BC67:
  LDA $7860,x                               ; $11BC67 |
  LSR A                                     ; $11BC6A |
  BCS CODE_11BC73                           ; $11BC6B |
  LDA #$0001                                ; $11BC6D |
  STA $110C                                 ; $11BC70 |

CODE_11BC73:
  LDA $110E                                 ; $11BC73 |
  ASL A                                     ; $11BC76 |
  TAY                                       ; $11BC77 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $11BC78 |
  INC A                                     ; $11BC7A |
  CMP $BAFE,y                               ; $11BC7B |
  BNE CODE_11BC86                           ; $11BC7E |
  STZ $110C                                 ; $11BC80 |

CODE_11BC83:
  LDA $BAF0,y                               ; $11BC83 |

CODE_11BC86:
  STA !s_spr_wildcard_3_lo_dp,x             ; $11BC86 |
  ASL A                                     ; $11BC88 |
  TAY                                       ; $11BC89 |
  LDA $BA7C,y                               ; $11BC8A |
  STA !s_spr_anim_frame,x                   ; $11BC8D |
  LDA $BAB6,y                               ; $11BC90 |
  STA !s_spr_timer_2,x                      ; $11BC93 |
  LDA $110C                                 ; $11BC96 |
  BEQ CODE_11BCE6                           ; $11BC99 |
  LDA $7860,x                               ; $11BC9B |
  LSR A                                     ; $11BC9E |
  BCC CODE_11BCBC                           ; $11BC9F |
  STZ $110C                                 ; $11BCA1 |
  STZ $110E                                 ; $11BCA4 |
  LDY #$00                                  ; $11BCA7 |
  LDA $BAF0,y                               ; $11BCA9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $11BCAC |
  LDA $BA7C,y                               ; $11BCAE |
  STA !s_spr_anim_frame,x                   ; $11BCB1 |
  LDA $BAB6,y                               ; $11BCB4 |
  STA !s_spr_timer_2,x                      ; $11BCB7 |
  BRA CODE_11BCE6                           ; $11BCBA |

CODE_11BCBC:
  LDY #$00                                  ; $11BCBC |
  LDA !s_spr_y_pixel_pos,x                  ; $11BCBE |
  CMP #$FD00                                ; $11BCC1 |
  BCC CODE_11BCDE                           ; $11BCC4 |
  INY                                       ; $11BCC6 |
  CMP #$FF00                                ; $11BCC7 |
  BCC CODE_11BCDE                           ; $11BCCA |
  INY                                       ; $11BCCC |
  CMP #$0000                                ; $11BCCD |
  BCC CODE_11BCDE                           ; $11BCD0 |
  CMP #$0100                                ; $11BCD2 |
  BCC CODE_11BCDE                           ; $11BCD5 |
  INY                                       ; $11BCD7 |
  CMP #$0300                                ; $11BCD8 |
  BCC CODE_11BCDE                           ; $11BCDB |
  INY                                       ; $11BCDD |

CODE_11BCDE:
  TYA                                       ; $11BCDE |
  CLC                                       ; $11BCDF |
  ADC #$000C                                ; $11BCE0 |
  STA !s_spr_anim_frame,x                   ; $11BCE3 |

CODE_11BCE6:
  RTL                                       ; $11BCE6 |

  dw $BCF3                                  ; $11BCE7 |
  dw $BD7C                                  ; $11BCE9 |
  dw $C013                                  ; $11BCEB |
  dw $C2CF                                  ; $11BCED |
  dw $C3E1                                  ; $11BCEF |
  dw $BCFD                                  ; $11BCF1 |

  LDA $1104                                 ; $11BCF3 |
  BEQ CODE_11BCFE                           ; $11BCF6 |
  LDA #$0002                                ; $11BCF8 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11BCFB |
  RTS                                       ; $11BCFD |

CODE_11BCFE:
  TXA                                       ; $11BCFE |
  STA !gsu_r1                               ; $11BCFF |
  LDX #$09                                  ; $11BD02 |
  LDA #$8DDA                                ; $11BD04 |
  JSL r_gsu_init_1                          ; $11BD07 | GSU init
  LDX $12                                   ; $11BD0B |
  LDA !gsu_r1                               ; $11BD0D |
  BMI CODE_11BD7B                           ; $11BD10 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11BD12 |
  TAY                                       ; $11BD14 |
  LDA $7860,x                               ; $11BD15 |
  LSR A                                     ; $11BD18 |
  BCC CODE_11BD7B                           ; $11BD19 |
  LDA !s_spr_x_pixel_pos,y                  ; $11BD1B |
  STA !gsu_r1                               ; $11BD1E |
  LDA !s_spr_y_pixel_pos,y                  ; $11BD21 |
  STA !gsu_r2                               ; $11BD24 |
  LDA !s_spr_x_pixel_pos,x                  ; $11BD27 |
  STA !gsu_r3                               ; $11BD2A |
  LDA !s_spr_y_pixel_pos,x                  ; $11BD2D |
  STA !gsu_r4                               ; $11BD30 |
  LDA #$0200                                ; $11BD33 |
  STA !gsu_r6                               ; $11BD36 |
  LDX #$09                                  ; $11BD39 |
  LDA #$907C                                ; $11BD3B |
  JSL r_gsu_init_1                          ; $11BD3E | GSU init
  LDX $12                                   ; $11BD42 |
  LDA !gsu_r2                               ; $11BD44 |
  BPL CODE_11BD69                           ; $11BD47 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11BD49 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BD4B |
  SEC                                       ; $11BD4E |
  SBC !s_spr_y_pixel_pos,y                  ; $11BD4F |
  CMP #$0020                                ; $11BD52 |
  BCS CODE_11BD5C                           ; $11BD55 |
  LDA #$FC00                                ; $11BD57 |
  BRA CODE_11BD5F                           ; $11BD5A |

CODE_11BD5C:
  LDA #$FA80                                ; $11BD5C |

CODE_11BD5F:
  STA !s_spr_y_speed_lo,x                   ; $11BD5F |
  LDA #$0038                                ; $11BD62 |\ play sound #$0038
  JSL push_sound_queue                      ; $11BD65 |/

CODE_11BD69:
  LDY #$02                                  ; $11BD69 |
  LDA !gsu_r1                               ; $11BD6B |
  STA !s_spr_x_speed_lo,x                   ; $11BD6E |
  BPL CODE_11BD75                           ; $11BD71 |
  LDY #$00                                  ; $11BD73 |

CODE_11BD75:
  TYA                                       ; $11BD75 |
  STA !s_spr_facing_dir,x                   ; $11BD76 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11BD79 |

CODE_11BD7B:
  RTS                                       ; $11BD7B |

  LDA !s_player_mouth_state                 ; $11BD7C |
  BEQ CODE_11BDAE                           ; $11BD7F |
  LDA !s_mouth_ammo                         ; $11BD81 |
  BEQ CODE_11BDAE                           ; $11BD84 |
  LDA $02                                   ; $11BD86 |
  BEQ CODE_11BDAE                           ; $11BD88 |
  LDA $7860,x                               ; $11BD8A |
  LSR A                                     ; $11BD8D |
  BCC CODE_11BDAE                           ; $11BD8E |
  LDA !s_spr_y_pixel_pos,x                  ; $11BD90 |
  SEC                                       ; $11BD93 |
  SBC !s_player_y                           ; $11BD94 |
  CLC                                       ; $11BD97 |
  ADC #$0010                                ; $11BD98 |
  CMP #$0031                                ; $11BD9B |
  BCS CODE_11BDAE                           ; $11BD9E |
  LDA #$FA80                                ; $11BDA0 |
  STA !s_spr_y_speed_lo,x                   ; $11BDA3 |
  LDA #$0038                                ; $11BDA6 |\ play sound #$0038
  JSL push_sound_queue                      ; $11BDA9 |/
  RTS                                       ; $11BDAD |

CODE_11BDAE:
  LDY !s_spr_collision_id,x                 ; $11BDAE |
  BEQ CODE_11BDEE                           ; $11BDB1 |
  BMI CODE_11BDEE                           ; $11BDB3 |
  DEY                                       ; $11BDB5 |
  LDA !s_spr_state,y                        ; $11BDB6 |
  CMP #$0010                                ; $11BDB9 |
  BNE CODE_11BDEE                           ; $11BDBC |
  LDA !s_spr_id,y                           ; $11BDBE |
  CMP #$0007                                ; $11BDC1 |
  BEQ CODE_11BDCB                           ; $11BDC4 |
  CMP #$0009                                ; $11BDC6 |
  BNE CODE_11BDEE                           ; $11BDC9 |

CODE_11BDCB:
  STA $1104                                 ; $11BDCB |
  LDA #$0003                                ; $11BDCE |
  STA $1106                                 ; $11BDD1 |
  TYX                                       ; $11BDD4 |
  JSL $03A31E                               ; $11BDD5 |
  LDX $12                                   ; $11BDD9 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11BDDB |
  RTS                                       ; $11BDDD |

CODE_11BDDE:
  LDA !r_frame_counter_global               ; $11BDDE |
  AND #$0008                                ; $11BDE1 |
  LSR A                                     ; $11BDE4 |
  LSR A                                     ; $11BDE5 |
  LSR A                                     ; $11BDE6 |
  ORA #$000A                                ; $11BDE7 |
  STA !s_spr_anim_frame,x                   ; $11BDEA |
  RTS                                       ; $11BDED |

CODE_11BDEE:
  TXA                                       ; $11BDEE |
  STA !gsu_r1                               ; $11BDEF |
  LDX #$09                                  ; $11BDF2 |
  LDA #$8DDA                                ; $11BDF4 |
  JSL r_gsu_init_1                          ; $11BDF7 | GSU init
  LDX $12                                   ; $11BDFB |
  LDA !gsu_r1                               ; $11BDFD |
  BMI CODE_11BDDE                           ; $11BE00 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11BE02 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11BE04 |
  BEQ CODE_11BE31                           ; $11BE06 |
  LDY !s_spr_wildcard_1_lo,x                ; $11BE08 |
  BNE CODE_11BE20                           ; $11BE0B |
  LDA !s_spr_x_pixel_pos,x                  ; $11BE0D |
  CMP #$0010                                ; $11BE10 |
  BCS CODE_11BE2E                           ; $11BE13 |
  LDA #$0002                                ; $11BE15 |
  STA !s_spr_wildcard_1_lo,x                ; $11BE18 |
  STA !s_spr_facing_dir,x                   ; $11BE1B |
  BRA CODE_11BE2E                           ; $11BE1E |

CODE_11BE20:
  LDA !s_spr_x_pixel_pos,x                  ; $11BE20 |
  CMP #$00E0                                ; $11BE23 |
  BCC CODE_11BE2E                           ; $11BE26 |
  STZ !s_spr_wildcard_1_lo,x                ; $11BE28 |
  STZ !s_spr_facing_dir,x                   ; $11BE2B |

CODE_11BE2E:
  JMP CODE_11BEC4                           ; $11BE2E |

CODE_11BE31:
  LDA $7860,x                               ; $11BE31 |
  LSR A                                     ; $11BE34 |
  BCS CODE_11BE3A                           ; $11BE35 |
  JMP CODE_11BED0                           ; $11BE37 |

CODE_11BE3A:
  LDY #$00                                  ; $11BE3A |
  LDA !s_spr_x_pixel_pos,x                  ; $11BE3C |
  SEC                                       ; $11BE3F |
  SBC #$0080                                ; $11BE40 |
  BPL CODE_11BE47                           ; $11BE43 |
  LDY #$02                                  ; $11BE45 |

CODE_11BE47:
  TYA                                       ; $11BE47 |
  STA !s_spr_wildcard_1_lo,x                ; $11BE48 |
  STA !s_spr_facing_dir,x                   ; $11BE4B |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11BE4E |
  LDA !s_spr_x_pixel_pos,x                  ; $11BE50 |
  SEC                                       ; $11BE53 |
  SBC !s_spr_x_pixel_pos,y                  ; $11BE54 |
  CLC                                       ; $11BE57 |
  ADC #$0010                                ; $11BE58 |
  CMP #$0021                                ; $11BE5B |
  BCS CODE_11BED0                           ; $11BE5E |
  LDA !s_spr_y_pixel_pos,x                  ; $11BE60 |
  STA !s_spr_wildcard_2_lo,x                ; $11BE63 |
  SEC                                       ; $11BE66 |
  SBC !s_spr_y_pixel_pos,y                  ; $11BE67 |
  CLC                                       ; $11BE6A |
  ADC #$0020                                ; $11BE6B |
  LDY #$01                                  ; $11BE6E |
  CMP #$0031                                ; $11BE70 |
  BCC CODE_11BED0                           ; $11BE73 |
  BMI CODE_11BEC1                           ; $11BE75 |
  CMP #$00A1                                ; $11BE77 |
  BCS CODE_11BED0                           ; $11BE7A |
  LDA #$FE00                                ; $11BE7C |
  LDY !s_spr_x_pixel_pos,x                  ; $11BE7F |
  CPY #$31                                  ; $11BE82 |
  BCS CODE_11BE89                           ; $11BE84 |
  LDA #$0200                                ; $11BE86 |

CODE_11BE89:
  STA !s_spr_wildcard_2_lo,x                ; $11BE89 |
  LDA !s_spr_x_pixel_pos,x                  ; $11BE8C |
  SEC                                       ; $11BE8F |
  SBC #$0010                                ; $11BE90 |
  CLC                                       ; $11BE93 |
  ADC #$0008                                ; $11BE94 |
  STA !gsu_r8                               ; $11BE97 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BE9A |
  STA !gsu_r0                               ; $11BE9D |
  LDX #$0A                                  ; $11BEA0 |
  LDA #$CE2F                                ; $11BEA2 |
  JSL r_gsu_init_3                          ; $11BEA5 | GSU init
  LDX $12                                   ; $11BEA9 |
  LDY #$02                                  ; $11BEAB |
  LDA !gsu_r5                               ; $11BEAD |
  BEQ CODE_11BEC1                           ; $11BEB0 |
  LDA #$FC00                                ; $11BEB2 |
  STA !s_spr_y_speed_lo,x                   ; $11BEB5 |
  PHY                                       ; $11BEB8 |
  LDA #$0038                                ; $11BEB9 |\ play sound #$0038
  JSL push_sound_queue                      ; $11BEBC |/
  PLY                                       ; $11BEC0 |

CODE_11BEC1:
  TYA                                       ; $11BEC1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $11BEC2 |

CODE_11BEC4:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11BEC4 |
  ASL A                                     ; $11BEC6 |
  TAY                                       ; $11BEC7 |
  LDA $BF45,y                               ; $11BEC8 |
  STA $00                                   ; $11BECB |
  JMP ($7960)                               ; $11BECD |

CODE_11BED0:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11BED0 |
  LDA !s_spr_x_pixel_pos,y                  ; $11BED2 |
  STA !gsu_r1                               ; $11BED5 |
  LDA !s_spr_y_pixel_pos,y                  ; $11BED8 |
  STA !gsu_r2                               ; $11BEDB |
  LDA !s_spr_x_pixel_pos,x                  ; $11BEDE |
  STA !gsu_r3                               ; $11BEE1 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BEE4 |
  STA !gsu_r4                               ; $11BEE7 |
  LDA #$0200                                ; $11BEEA |
  STA !gsu_r6                               ; $11BEED |
  LDX #$09                                  ; $11BEF0 |
  LDA #$907C                                ; $11BEF2 |
  JSL r_gsu_init_1                          ; $11BEF5 | GSU init
  LDX $12                                   ; $11BEF9 |
  LDY #$02                                  ; $11BEFB |
  LDA !gsu_r1                               ; $11BEFD |
  STA !s_spr_x_speed_lo,x                   ; $11BF00 |
  BPL CODE_11BF07                           ; $11BF03 |
  LDY #$00                                  ; $11BF05 |

CODE_11BF07:
  TYA                                       ; $11BF07 |
  STA !s_spr_facing_dir,x                   ; $11BF08 |
  LDA $7860,x                               ; $11BF0B |
  LSR A                                     ; $11BF0E |
  BCC CODE_11BF46                           ; $11BF0F |
  LDA $7860,x                               ; $11BF11 |
  AND $C00B,y                               ; $11BF14 |
  BEQ CODE_11BF26                           ; $11BF17 |
  LDA #$FC00                                ; $11BF19 |
  STA !s_spr_y_speed_lo,x                   ; $11BF1C |
  LDA #$0038                                ; $11BF1F |\ play sound #$0038
  JSL push_sound_queue                      ; $11BF22 |/

CODE_11BF26:
  LDA !gsu_r2                               ; $11BF26 |
  BPL CODE_11BF46                           ; $11BF29 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11BF2B |
  LDA !s_spr_y_pixel_pos,x                  ; $11BF2D |
  SEC                                       ; $11BF30 |
  SBC !s_spr_y_pixel_pos,y                  ; $11BF31 |
  CMP #$0020                                ; $11BF34 |
  BCC CODE_11BF46                           ; $11BF37 |
  LDA #$FA80                                ; $11BF39 |
  STA !s_spr_y_speed_lo,x                   ; $11BF3C |
  LDA #$0038                                ; $11BF3F |\ play sound #$0038
  JSL push_sound_queue                      ; $11BF42 |/

CODE_11BF46:
  RTS                                       ; $11BF46 |

  dw $BF53                                  ; $11BF47 |
  dw $BF9E                                  ; $11BF49 |

  dw $FE00, $0200                           ; $11BF4B |

  dw $FFF0, $0010                           ; $11BF4F |

  LDY !s_spr_wildcard_1_lo,x                ; $11BF53 |
  LDA $BF4B,y                               ; $11BF56 |
  STA !s_spr_x_speed_lo,x                   ; $11BF59 |
  LDA $7860,x                               ; $11BF5C |
  LSR A                                     ; $11BF5F |
  BCC CODE_11BF8F                           ; $11BF60 |
  LDA !s_spr_x_pixel_pos,x                  ; $11BF62 |
  CLC                                       ; $11BF65 |
  ADC $BF4F,y                               ; $11BF66 |
  STA !gsu_r8                               ; $11BF69 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BF6C |
  STA !gsu_r0                               ; $11BF6F |
  LDX #$0A                                  ; $11BF72 |
  LDA #$CE2F                                ; $11BF74 |
  JSL r_gsu_init_3                          ; $11BF77 | GSU init
  LDX $12                                   ; $11BF7B |
  LDA !gsu_r5                               ; $11BF7D |
  BEQ CODE_11BF8F                           ; $11BF80 |
  LDA #$FC00                                ; $11BF82 |
  STA !s_spr_y_speed_lo,x                   ; $11BF85 |
  LDA #$0038                                ; $11BF88 |\ play sound #$0038
  JSL push_sound_queue                      ; $11BF8B |/

CODE_11BF8F:
  LDA !s_spr_y_pixel_pos,x                  ; $11BF8F |
  SEC                                       ; $11BF92 |
  SBC !s_spr_wildcard_2_lo,x                ; $11BF93 |
  CMP #$0028                                ; $11BF96 |
  BCC CODE_11BF9D                           ; $11BF99 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11BF9B |

CODE_11BF9D:
  RTS                                       ; $11BF9D |

  LDA !s_spr_wildcard_2_lo,x                ; $11BF9E |
  STA !s_spr_x_speed_lo,x                   ; $11BFA1 |
  STZ !s_spr_facing_dir,x                   ; $11BFA4 |
  LDY !s_spr_facing_dir,x                   ; $11BFA7 |
  LDA $7860,x                               ; $11BFAA |
  LSR A                                     ; $11BFAD |
  BCC CODE_11BFDD                           ; $11BFAE |
  LDA !s_spr_x_pixel_pos,x                  ; $11BFB0 |
  CLC                                       ; $11BFB3 |
  ADC $BF4F,y                               ; $11BFB4 |
  STA !gsu_r8                               ; $11BFB7 |
  LDA !s_spr_y_pixel_pos,x                  ; $11BFBA |
  STA !gsu_r0                               ; $11BFBD |
  LDX #$0A                                  ; $11BFC0 |
  LDA #$CE2F                                ; $11BFC2 |
  JSL r_gsu_init_3                          ; $11BFC5 | GSU init
  LDX $12                                   ; $11BFC9 |
  LDA !gsu_r5                               ; $11BFCB |
  BEQ CODE_11BFDD                           ; $11BFCE |
  LDA #$FA80                                ; $11BFD0 |
  STA !s_spr_y_speed_lo,x                   ; $11BFD3 |
  LDA #$0038                                ; $11BFD6 |\ play sound #$0038
  JSL push_sound_queue                      ; $11BFD9 |/

CODE_11BFDD:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $11BFDD |
  LDA !s_spr_x_pixel_pos,x                  ; $11BFDF |
  SEC                                       ; $11BFE2 |
  SBC !s_spr_x_pixel_pos,y                  ; $11BFE3 |
  CLC                                       ; $11BFE6 |
  ADC #$0010                                ; $11BFE7 |
  CMP #$0021                                ; $11BFEA |
  BCC CODE_11BFFA                           ; $11BFED |
  STZ !s_spr_x_speed_lo,x                   ; $11BFEF |
  LDA #$0002                                ; $11BFF2 |
  STA !s_spr_facing_dir,x                   ; $11BFF5 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $11BFF8 |

CODE_11BFFA:
  RTS                                       ; $11BFFA |

  dw $FFEC, $0014, $FFF7, $0009             ; $11BFFB |
  dw $FFF0, $0010, $0000, $0000             ; $11C003 |
  dw $0008, $0004, $FF00, $0100             ; $11C00B |

  LDA !s_spr_gsu_morph_1_lo,x               ; $11C013 |
  BNE CODE_11C04E                           ; $11C016 |
  LDY #$02                                  ; $11C018 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C01A |
  SEC                                       ; $11C01D |
  SBC !s_player_y                           ; $11C01E |
  CLC                                       ; $11C021 |
  ADC #$0010                                ; $11C022 |
  BMI CODE_11C030                           ; $11C025 |
  LDY #$04                                  ; $11C027 |
  CMP #$0031                                ; $11C029 |
  BCS CODE_11C030                           ; $11C02C |
  LDY #$06                                  ; $11C02E |

CODE_11C030:
  TYA                                       ; $11C030 |
  STA !s_spr_gsu_morph_1_lo,x               ; $11C031 |
  LDY #$02                                  ; $11C034 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C036 |
  CMP #$0020                                ; $11C039 |
  BCC CODE_11C048                           ; $11C03C |
  LDY #$00                                  ; $11C03E |
  CMP #$00D0                                ; $11C040 |
  BCS CODE_11C048                           ; $11C043 |
  LDY !s_player_direction                   ; $11C045 |

CODE_11C048:
  TYA                                       ; $11C048 |
  STA !s_spr_gsu_morph_2_lo,x               ; $11C049 |
  BRA CODE_11C064                           ; $11C04C |

CODE_11C04E:
  LDA !s_spr_x_pixel_pos,x                  ; $11C04E |
  CMP #$00E0                                ; $11C051 |
  BCS CODE_11C05B                           ; $11C054 |
  CMP #$0012                                ; $11C056 |
  BCS CODE_11C064                           ; $11C059 |

CODE_11C05B:
  LDA !s_spr_gsu_morph_2_lo,x               ; $11C05B |
  EOR #$0002                                ; $11C05E |
  STA !s_spr_gsu_morph_2_lo,x               ; $11C061 |

CODE_11C064:
  PEA $C071                                 ; $11C064 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $11C067 |
  LDA $C083,y                               ; $11C06A |
  STA $00                                   ; $11C06D |
  JMP ($7960)                               ; $11C06F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $11C072 |
  BEQ CODE_11C084                           ; $11C075 |
  LDY #$00                                  ; $11C077 |
  LDA !s_spr_x_speed_lo,x                   ; $11C079 |
  BMI CODE_11C080                           ; $11C07C |
  LDY #$02                                  ; $11C07E |

CODE_11C080:
  TYA                                       ; $11C080 |
  STA !s_spr_facing_dir,x                   ; $11C081 |

CODE_11C084:
  RTS                                       ; $11C084 |

  dw $C08B                                  ; $11C085 |
  dw $C0EF                                  ; $11C087 |
  dw $C1D2                                  ; $11C089 |

  LDY !s_spr_gsu_morph_2_lo,x               ; $11C08B |
  LDA $7860,x                               ; $11C08E |
  AND $C00B,y                               ; $11C091 |
  BNE CODE_11C09C                           ; $11C094 |
  LDA $C00F,y                               ; $11C096 |
  STA !s_spr_x_speed_lo,x                   ; $11C099 |

CODE_11C09C:
  LDA $7860,x                               ; $11C09C |
  LSR A                                     ; $11C09F |
  BCC CODE_11C0EE                           ; $11C0A0 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C0A2 |
  CLC                                       ; $11C0A5 |
  ADC $BF4F,y                               ; $11C0A6 |
  CLC                                       ; $11C0A9 |
  ADC #$0008                                ; $11C0AA |
  STA !gsu_r8                               ; $11C0AD |
  LDA !s_spr_y_pixel_pos,x                  ; $11C0B0 |
  STA !gsu_r0                               ; $11C0B3 |
  LDX #$0A                                  ; $11C0B6 |
  LDA #$CE2F                                ; $11C0B8 |
  JSL r_gsu_init_3                          ; $11C0BB | GSU init
  LDX $12                                   ; $11C0BF |
  LDA !gsu_r5                               ; $11C0C1 |
  BEQ CODE_11C0D3                           ; $11C0C4 |
  LDA #$FC00                                ; $11C0C6 |
  STA !s_spr_y_speed_lo,x                   ; $11C0C9 |
  LDA #$0038                                ; $11C0CC |\ play sound #$0038
  JSL push_sound_queue                      ; $11C0CF |/

CODE_11C0D3:
  LDA !s_spr_y_pixel_pos,x                  ; $11C0D3 |
  SEC                                       ; $11C0D6 |
  SBC !s_player_y                           ; $11C0D7 |
  CLC                                       ; $11C0DA |
  ADC #$0010                                ; $11C0DB |
  CMP #$0031                                ; $11C0DE |
  BCC CODE_11C0E5                           ; $11C0E1 |
  BMI CODE_11C0EE                           ; $11C0E3 |

CODE_11C0E5:
  STZ !s_spr_gsu_morph_1_lo,x               ; $11C0E5 |
  STZ !s_spr_y_speed_lo,x                   ; $11C0E8 |
  STZ !s_spr_x_speed_lo,x                   ; $11C0EB |

CODE_11C0EE:
  RTS                                       ; $11C0EE |

  LDY !s_spr_gsu_morph_2_lo,x               ; $11C0EF |
  LDA $7860,x                               ; $11C0F2 |
  AND $C00B,y                               ; $11C0F5 |
  BNE CODE_11C100                           ; $11C0F8 |
  LDA $C00F,y                               ; $11C0FA |
  STA !s_spr_x_speed_lo,x                   ; $11C0FD |

CODE_11C100:
  LDA $7860,x                               ; $11C100 |
  LSR A                                     ; $11C103 |
  BCC CODE_11C121                           ; $11C104 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C106 |
  SEC                                       ; $11C109 |
  SBC !s_player_y                           ; $11C10A |
  CLC                                       ; $11C10D |
  ADC #$0010                                ; $11C10E |
  BMI CODE_11C118                           ; $11C111 |
  CMP #$0031                                ; $11C113 |
  BCS CODE_11C122                           ; $11C116 |

CODE_11C118:
  STZ !s_spr_gsu_morph_1_lo,x               ; $11C118 |
  STZ !s_spr_y_speed_lo,x                   ; $11C11B |
  STZ !s_spr_x_speed_lo,x                   ; $11C11E |

CODE_11C121:
  RTS                                       ; $11C121 |

CODE_11C122:
  LDA !s_spr_x_pixel_pos,x                  ; $11C122 |
  CLC                                       ; $11C125 |
  ADC #$0008                                ; $11C126 |
  STA $04                                   ; $11C129 |
  STA !gsu_r8                               ; $11C12B |
  LDA !s_spr_y_pixel_pos,x                  ; $11C12E |
  SEC                                       ; $11C131 |
  SBC #$0040                                ; $11C132 |
  STA $06                                   ; $11C135 |
  STA !gsu_r0                               ; $11C137 |
  LDX #$0A                                  ; $11C13A |
  LDA #$CE2F                                ; $11C13C |
  JSL r_gsu_init_3                          ; $11C13F | GSU init
  LDX $12                                   ; $11C143 |
  LDA !gsu_r5                               ; $11C145 |
  BNE CODE_11C19D                           ; $11C148 |
  LDA $04                                   ; $11C14A |
  STA !gsu_r8                               ; $11C14C |
  LDA $06                                   ; $11C14F |
  CLC                                       ; $11C151 |
  ADC #$0010                                ; $11C152 |
  STA !gsu_r0                               ; $11C155 |
  LDX #$0A                                  ; $11C158 |
  LDA #$CE2F                                ; $11C15A |
  JSL r_gsu_init_3                          ; $11C15D | GSU init
  LDX $12                                   ; $11C161 |
  LDA !gsu_r7                               ; $11C163 |
  AND #$0001                                ; $11C166 |
  BNE CODE_11C18C                           ; $11C169 |
  LDA $04                                   ; $11C16B |
  STA !gsu_r8                               ; $11C16D |
  LDA $06                                   ; $11C170 |
  CLC                                       ; $11C172 |
  ADC #$0020                                ; $11C173 |
  STA !gsu_r0                               ; $11C176 |
  LDX #$0A                                  ; $11C179 |
  LDA #$CE2F                                ; $11C17B |
  JSL r_gsu_init_3                          ; $11C17E | GSU init
  LDX $12                                   ; $11C182 |
  LDA !gsu_r7                               ; $11C184 |
  AND #$0001                                ; $11C187 |
  BEQ CODE_11C19D                           ; $11C18A |

CODE_11C18C:
  LDA #$FA80                                ; $11C18C |
  STA !s_spr_y_speed_lo,x                   ; $11C18F |
  LDA #$0038                                ; $11C192 |\ play sound #$0038
  JSL push_sound_queue                      ; $11C195 |/
  STZ !s_spr_x_speed_lo,x                   ; $11C199 |
  RTS                                       ; $11C19C |

CODE_11C19D:
  LDY !s_spr_gsu_morph_2_lo,x               ; $11C19D |
  LDA !s_spr_x_pixel_pos,x                  ; $11C1A0 |
  CLC                                       ; $11C1A3 |
  ADC $BF4F,y                               ; $11C1A4 |
  CLC                                       ; $11C1A7 |
  ADC #$0008                                ; $11C1A8 |
  STA !gsu_r8                               ; $11C1AB |
  LDA !s_spr_y_pixel_pos,x                  ; $11C1AE |
  STA !gsu_r0                               ; $11C1B1 |
  LDX #$0A                                  ; $11C1B4 |
  LDA #$CE2F                                ; $11C1B6 |
  JSL r_gsu_init_3                          ; $11C1B9 | GSU init
  LDX $12                                   ; $11C1BD |
  LDA !gsu_r5                               ; $11C1BF |
  BEQ CODE_11C1D1                           ; $11C1C2 |
  LDA #$FC00                                ; $11C1C4 |
  STA !s_spr_y_speed_lo,x                   ; $11C1C7 |
  LDA #$0038                                ; $11C1CA |\ play sound #$0038
  JSL push_sound_queue                      ; $11C1CD |/

CODE_11C1D1:
  RTS                                       ; $11C1D1 |

  LDA !s_spr_timer_1,x                      ; $11C1D2 |
  BNE CODE_11C21F                           ; $11C1D5 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $11C1D7 |
  LDA $7860,x                               ; $11C1DA |
  AND $C00B,y                               ; $11C1DD |
  BNE CODE_11C1E8                           ; $11C1E0 |
  LDA $C00F,y                               ; $11C1E2 |
  STA !s_spr_x_speed_lo,x                   ; $11C1E5 |

CODE_11C1E8:
  LDA $7860,x                               ; $11C1E8 |
  LSR A                                     ; $11C1EB |
  BCC CODE_11C21F                           ; $11C1EC |
  LDA !s_spr_x_pixel_pos,x                  ; $11C1EE |
  CLC                                       ; $11C1F1 |
  ADC $BF4F,y                               ; $11C1F2 |
  CLC                                       ; $11C1F5 |
  ADC #$0008                                ; $11C1F6 |
  STA !gsu_r8                               ; $11C1F9 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C1FC |
  STA !gsu_r0                               ; $11C1FF |
  LDX #$0A                                  ; $11C202 |
  LDA #$CE2F                                ; $11C204 |
  JSL r_gsu_init_3                          ; $11C207 | GSU init
  LDX $12                                   ; $11C20B |
  LDA !gsu_r5                               ; $11C20D |
  BEQ CODE_11C220                           ; $11C210 |
  LDA #$FC00                                ; $11C212 |
  STA !s_spr_y_speed_lo,x                   ; $11C215 |
  LDA #$0038                                ; $11C218 |\ play sound #$0038
  JSL push_sound_queue                      ; $11C21B |/

CODE_11C21F:
  RTS                                       ; $11C21F |

CODE_11C220:
  LDA !s_spr_y_pixel_pos,x                  ; $11C220 |
  SEC                                       ; $11C223 |
  SBC !s_player_y                           ; $11C224 |
  CLC                                       ; $11C227 |
  ADC #$0010                                ; $11C228 |
  CMP #$0031                                ; $11C22B |
  BCS CODE_11C2AA                           ; $11C22E |
  LDA !s_player_invincibility_timer         ; $11C230 |
  BNE CODE_11C21F                           ; $11C233 |
  STZ !s_spr_y_speed_lo,x                   ; $11C235 |
  LDA !s_player_x                           ; $11C238 |
  SEC                                       ; $11C23B |
  SBC !s_spr_x_pixel_pos,x                  ; $11C23C |
  CLC                                       ; $11C23F |
  ADC #$0060                                ; $11C240 |
  CMP #$00C1                                ; $11C243 |
  BCS CODE_11C21F                           ; $11C246 |
  STZ !s_spr_x_speed_lo,x                   ; $11C248 |
  LDA $02                                   ; $11C24B |
  BEQ CODE_11C2B4                           ; $11C24D |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11C24F |
  LDY #$02                                  ; $11C251 |
  LDA !s_player_x                           ; $11C253 |
  CMP !s_spr_x_pixel_pos,x                  ; $11C256 |
  BCS CODE_11C25D                           ; $11C259 |
  LDY #$00                                  ; $11C25B |

CODE_11C25D:
  TYA                                       ; $11C25D |
  STA !s_spr_facing_dir,x                   ; $11C25E |
  LDA #$001E                                ; $11C261 |
  STA !s_spr_timer_1,x                      ; $11C264 |

CODE_11C267:
  STZ !s_spr_anim_frame,x                   ; $11C267 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C26A |
  CLC                                       ; $11C26D |
  ADC #$0002                                ; $11C26E |
  STA !s_spr_wildcard_1_lo,x                ; $11C271 |
  LDY #$00                                  ; $11C274 |
  LDA $1104                                 ; $11C276 |
  CMP #$0009                                ; $11C279 |
  BEQ CODE_11C280                           ; $11C27C |
  LDY #$04                                  ; $11C27E |

CODE_11C280:
  TYA                                       ; $11C280 |
  ORA !s_spr_facing_dir,x                   ; $11C281 |
  TAY                                       ; $11C284 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C285 |
  CLC                                       ; $11C288 |
  ADC $BFFB,y                               ; $11C289 |
  STA !s_spr_wildcard_2_lo,x                ; $11C28C |
  LDA $C003,y                               ; $11C28F |
  STA !s_spr_gsu_morph_2_lo,x               ; $11C292 |
  LDA #$0030                                ; $11C295 |
  STA !s_spr_oam_yxppccct,x                 ; $11C298 |
  LDY #$06                                  ; $11C29B |
  STY $1108                                 ; $11C29D |
  LDA #$0001                                ; $11C2A0 |
  STA $110A                                 ; $11C2A3 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $11C2A6 |
  RTS                                       ; $11C2A9 |

CODE_11C2AA:
  STZ !s_spr_gsu_morph_1_lo,x               ; $11C2AA |
  STZ !s_spr_y_speed_lo,x                   ; $11C2AD |
  STZ !s_spr_x_speed_lo,x                   ; $11C2B0 |
  RTS                                       ; $11C2B3 |

CODE_11C2B4:
  LDY !s_player_direction                   ; $11C2B4 |
  LDA $C00F,y                               ; $11C2B7 |
  STA !s_spr_x_speed_lo,x                   ; $11C2BA |
  LDA $10                                   ; $11C2BD |
  TAY                                       ; $11C2BF |
  CPY #$F8                                  ; $11C2C0 |
  BCC CODE_11C2CE                           ; $11C2C2 |
  TYA                                       ; $11C2C4 |
  AND #$003F                                ; $11C2C5 |
  STA !s_spr_timer_1,x                      ; $11C2C8 |
  STZ !s_spr_x_speed_lo,x                   ; $11C2CB |

CODE_11C2CE:
  RTS                                       ; $11C2CE |

CODE_11C2CF:
  LDA !s_spr_timer_1,x                      ; $11C2CF |
  BNE CODE_11C308                           ; $11C2D2 |
  LDA $1108                                 ; $11C2D4 |
  BNE CODE_11C309                           ; $11C2D7 |
  LDA #$0002                                ; $11C2D9 |
  DEC $1106                                 ; $11C2DC |
  BNE CODE_11C2E7                           ; $11C2DF |
  STZ $1104                                 ; $11C2E1 |
  LDA #$0000                                ; $11C2E4 |

CODE_11C2E7:
  STA !s_spr_wildcard_4_lo_dp,x             ; $11C2E7 |
  STZ $110E                                 ; $11C2E9 |
  LDY #$00                                  ; $11C2EC |
  LDA $BAF0,y                               ; $11C2EE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $11C2F1 |
  LDA $BA7C,y                               ; $11C2F3 |
  STA !s_spr_anim_frame,x                   ; $11C2F6 |
  LDA $BAB6,y                               ; $11C2F9 |
  STA !s_spr_timer_2,x                      ; $11C2FC |
  LDA #$0020                                ; $11C2FF |
  STA !s_spr_oam_yxppccct,x                 ; $11C302 |
  STZ $110A                                 ; $11C305 |

CODE_11C308:
  RTS                                       ; $11C308 |

CODE_11C309:
  LDA #$0001                                ; $11C309 |
  STA !s_spr_anim_frame,x                   ; $11C30C |
  LDA $1104                                 ; $11C30F |
  CMP #$0007                                ; $11C312 |
  BNE CODE_11C371                           ; $11C315 |
  LDY !s_spr_facing_dir,x                   ; $11C317 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C31A |
  CLC                                       ; $11C31D |
  ADC #$0002                                ; $11C31E |
  STA !s_spr_wildcard_1_lo,x                ; $11C321 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C324 |
  CLC                                       ; $11C327 |
  ADC $BFFF,y                               ; $11C328 |
  STA !s_spr_wildcard_2_lo,x                ; $11C32B |
  LDA #$0006                                ; $11C32E |
  STA !s_spr_timer_1,x                      ; $11C331 |
  LDA #$0107                                ; $11C334 |
  JSL spawn_sprite_init                     ; $11C337 |
  BCC CODE_11C36F                           ; $11C33B |
  LDA !s_spr_wildcard_1_lo,x                ; $11C33D |
  STA !s_spr_y_pixel_pos,y                  ; $11C340 |
  LDA !s_spr_wildcard_2_lo,x                ; $11C343 |
  STA !s_spr_x_pixel_pos,y                  ; $11C346 |
  LDA #$0001                                ; $11C349 |
  STA !s_spr_collision_state,y              ; $11C34C |
  STA !s_spr_gsu_morph_2_lo,y               ; $11C34F |
  LDA !s_spr_facing_dir,x                   ; $11C352 |
  STA !s_spr_facing_dir,y                   ; $11C355 |
  TAX                                       ; $11C358 |
  LDA #$FC00                                ; $11C359 |
  CPX #$00                                  ; $11C35C |
  BEQ CODE_11C363                           ; $11C35E |
  LDA #$0400                                ; $11C360 |

CODE_11C363:
  STA !s_spr_x_speed_lo,y                   ; $11C363 |
  LDA #$0045                                ; $11C366 |\ play sound #$0045
  JSL push_sound_queue                      ; $11C369 |/
  LDX $12                                   ; $11C36D |

CODE_11C36F:
  BRA CODE_11C3DD                           ; $11C36F |

CODE_11C371:
  LDA #$0018                                ; $11C371 |
  JSL spawn_sprite_init                     ; $11C374 |
  BCC CODE_11C3DD                           ; $11C378 |
  LDA !s_spr_wildcard_1_lo,x                ; $11C37A |
  STA !s_spr_y_pixel_pos,y                  ; $11C37D |
  LDA !s_spr_wildcard_2_lo,x                ; $11C380 |
  STA !s_spr_x_pixel_pos,y                  ; $11C383 |
  LDA #$0001                                ; $11C386 |
  STA !s_spr_gsu_morph_2_lo,y               ; $11C389 |
  LDA !s_spr_facing_dir,x                   ; $11C38C |
  STA !s_spr_facing_dir,y                   ; $11C38F |
  LDA #$0010                                ; $11C392 |
  STA !s_spr_timer_1,y                      ; $11C395 |
  LDA !s_spr_oam_yxppccct,y                 ; $11C398 |
  AND #$00F1                                ; $11C39B |
  ORA #$0006                                ; $11C39E |
  STA !s_spr_oam_yxppccct,y                 ; $11C3A1 |
  SEP #$20                                  ; $11C3A4 |
  LDA #$29                                  ; $11C3A6 |
  STA !s_spr_obj_tile_index,y               ; $11C3A8 |
  REP #$20                                  ; $11C3AB |
  LDA #$0002                                ; $11C3AD |
  STA !s_spr_timer_1,x                      ; $11C3B0 |
  LDA !s_spr_wildcard_2_lo,x                ; $11C3B3 |
  STA !gsu_r8                               ; $11C3B6 |
  LDA !s_spr_wildcard_1_lo,x                ; $11C3B9 |
  STA !gsu_r0                               ; $11C3BC |
  LDX #$0A                                  ; $11C3BF |
  LDA #$CE2F                                ; $11C3C1 |
  JSL r_gsu_init_3                          ; $11C3C4 | GSU init
  LDX $12                                   ; $11C3C8 |
  LDA !gsu_r5                               ; $11C3CA |
  BEQ CODE_11C3D3                           ; $11C3CD |
  STZ $1108                                 ; $11C3CF |
  RTS                                       ; $11C3D2 |

CODE_11C3D3:
  LDA !s_spr_wildcard_2_lo,x                ; $11C3D3 |
  CLC                                       ; $11C3D6 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $11C3D7 |
  STA !s_spr_wildcard_2_lo,x                ; $11C3DA |

CODE_11C3DD:
  DEC $1108                                 ; $11C3DD |
  RTS                                       ; $11C3E0 |

  LDA $7860,x                               ; $11C3E1 |
  LSR A                                     ; $11C3E4 |
  BCC CODE_11C44A                           ; $11C3E5 |
  LDA !s_spr_timer_4,x                      ; $11C3E7 |
  BNE CODE_11C3F5                           ; $11C3EA |
  STZ !s_spr_x_speed_lo,x                   ; $11C3EC |
  LDA #$0020                                ; $11C3EF |
  STA !s_spr_timer_4,x                      ; $11C3F2 |

CODE_11C3F5:
  AND #$0008                                ; $11C3F5 |
  LSR A                                     ; $11C3F8 |
  LSR A                                     ; $11C3F9 |
  LSR A                                     ; $11C3FA |
  ORA #$0008                                ; $11C3FB |
  STA !s_spr_anim_frame,x                   ; $11C3FE |
  LDA !s_spr_timer_4,x                      ; $11C401 |
  CMP #$0001                                ; $11C404 |
  BNE CODE_11C44A                           ; $11C407 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11C409 |
  LDA #$0002                                ; $11C40B |
  STA !s_spr_anim_frame,x                   ; $11C40E |
  LDA $110A                                 ; $11C411 |
  BEQ CODE_11C44A                           ; $11C414 |
  LDA $1108                                 ; $11C416 |
  BEQ CODE_11C43A                           ; $11C419 |
  CMP #$0006                                ; $11C41B |
  BEQ CODE_11C428                           ; $11C41E |
  LDA $1104                                 ; $11C420 |
  CMP #$0009                                ; $11C423 |
  BEQ CODE_11C43A                           ; $11C426 |

CODE_11C428:
  LDA #$0003                                ; $11C428 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $11C42B |
  LDA #$0030                                ; $11C42D |
  STA !s_spr_oam_yxppccct,x                 ; $11C430 |
  LDA #$0001                                ; $11C433 |
  STA !s_spr_anim_frame,x                   ; $11C436 |
  RTS                                       ; $11C439 |

CODE_11C43A:
  STZ $110A                                 ; $11C43A |
  LDA $1106                                 ; $11C43D |
  BEQ CODE_11C44A                           ; $11C440 |
  DEC $1106                                 ; $11C442 |
  BNE CODE_11C44A                           ; $11C445 |
  STZ $1104                                 ; $11C447 |

CODE_11C44A:
  RTS                                       ; $11C44A |

  LDY !reg_slhv                             ; $11C44B |
  LDY !reg_stat78                           ; $11C44E |
  LDA !reg_ophct                            ; $11C451 |
  CLC                                       ; $11C454 |
  ADC $10                                   ; $11C455 |
  STA $10                                   ; $11C457 |
  AND #$00FF                                ; $11C459 |
  STA !s_spr_timer_1,x                      ; $11C45C |
  RTL                                       ; $11C45F |

init_mini_battle_watermelon_pot:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11C460 |
  ASL A                                     ; $11C462 |
  TAY                                       ; $11C463 |
  LDA $C46C,y                               ; $11C464 |
  STA $00                                   ; $11C467 |
  JMP ($7960)                               ; $11C469 |

  dw $C482                                  ; $11C46C |
  dw $C4E3                                  ; $11C46E |
  dw $C4F3                                  ; $11C470 |

  dw $0007, $0007, $0009, $0007             ; $11C472 |
  dw $0007, $0009, $0007, $0007             ; $11C47A |

  LDA !s_spr_timer_1,x                      ; $11C482 |
  BNE CODE_11C4E2                           ; $11C485 |
  LDA $10FE                                 ; $11C487 |
  CMP #$0002                                ; $11C48A |
  BEQ CODE_11C4DC                           ; $11C48D |
  INC $1110                                 ; $11C48F |
  LDA !s_rng                                ; $11C492 |
  AND #$0007                                ; $11C495 |
  ASL A                                     ; $11C498 |
  TAY                                       ; $11C499 |
  LDA $C472,y                               ; $11C49A |
  TAY                                       ; $11C49D |
  CMP #$0007                                ; $11C49E |
  BEQ CODE_11C4B2                           ; $11C4A1 |
  LDA $1110                                 ; $11C4A3 |
  CMP #$0004                                ; $11C4A6 |
  BCC CODE_11C4B0                           ; $11C4A9 |
  STZ $1110                                 ; $11C4AB |
  BRA CODE_11C4B2                           ; $11C4AE |

CODE_11C4B0:
  LDY #$07                                  ; $11C4B0 |

CODE_11C4B2:
  TYA                                       ; $11C4B2 |
  JSL spawn_sprite_active                   ; $11C4B3 |
  LDA !s_spr_bitwise_settings_1,y           ; $11C4B7 |
  AND #$F9FF                                ; $11C4BA |
  ORA #$0200                                ; $11C4BD |
  STA !s_spr_bitwise_settings_1,y           ; $11C4C0 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C4C3 |
  STA !s_spr_x_pixel_pos,y                  ; $11C4C6 |
  LDA !s_spr_y_pixel_pos,x                  ; $11C4C9 |
  STA !s_spr_y_pixel_pos,y                  ; $11C4CC |
  TYA                                       ; $11C4CF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11C4D0 |
  LDA #$0010                                ; $11C4D2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $11C4D5 |
  INC $10FE                                 ; $11C4D7 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11C4DA |

CODE_11C4DC:
  LDA #$0100                                ; $11C4DC |
  STA !s_spr_timer_1,x                      ; $11C4DF |

CODE_11C4E2:
  RTL                                       ; $11C4E2 |

  LDY !s_spr_wildcard_5_lo_dp,x             ; $11C4E3 |
  LDA !s_spr_y_pixel_pos,y                  ; $11C4E5 |
  DEC A                                     ; $11C4E8 |
  STA !s_spr_y_pixel_pos,y                  ; $11C4E9 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $11C4EC |
  BNE CODE_11C4F2                           ; $11C4EE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $11C4F0 |

CODE_11C4F2:
  RTL                                       ; $11C4F2 |

  LDY !s_spr_wildcard_5_lo_dp,x             ; $11C4F3 |
  LDA !s_spr_state,y                        ; $11C4F5 |
  BNE CODE_11C505                           ; $11C4F8 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $11C4FA |
  LDA #$0100                                ; $11C4FC |
  STA !s_spr_timer_1,x                      ; $11C4FF |
  DEC $10FE                                 ; $11C502 |

CODE_11C505:
  RTL                                       ; $11C505 |

  REP #$20                                  ; $11C506 |
  STZ $39                                   ; $11C508 |
  STZ $3B                                   ; $11C50A |
  STZ $3D                                   ; $11C50C |
  STZ $3F                                   ; $11C50E |
  STZ $41                                   ; $11C510 |
  STZ $43                                   ; $11C512 |
  LDY #$69                                  ; $11C514 |
  STY !r_reg_bg1sc_mirror                   ; $11C516 |
  STY !reg_bg1sc                            ; $11C519 |
  LDY #$39                                  ; $11C51C |
  STY !r_reg_bg2sc_mirror                   ; $11C51E |
  STY !reg_bg2sc                            ; $11C521 |
  LDY #$09                                  ; $11C524 |
  STY !r_reg_bgmode_mirror                  ; $11C526 |
  STY !reg_bgmode                           ; $11C529 |
  LDY #$00                                  ; $11C52C |
  STY !r_reg_hdmaen_mirror                  ; $11C52E |
  STY !r_reg_cgadsub_mirror                 ; $11C531 |
  REP #$20                                  ; $11C534 |
  LDA #$00B0                                ; $11C536 |
  STA !s_player_y                           ; $11C539 |
  LDA #$0030                                ; $11C53C |
  STA !s_player_x                           ; $11C53F |
  STZ !s_screen_num_to_id                   ; $11C542 |
  STA !r_stars_amount                       ; $11C545 |
  STZ $03BC                                 ; $11C548 |
  LDA #$0008                                ; $11C54B |
  STA $1100                                 ; $11C54E |
  STA $1102                                 ; $11C551 |
  LDA #$0001                                ; $11C554 |
  STA $10F2                                 ; $11C557 |
  LDA #$FFFF                                ; $11C55A |
  STA !s_sprset_1_index                     ; $11C55D |
  STA !s_sprset_3_index                     ; $11C560 |
  STA !s_sprset_5_index                     ; $11C563 |
  STZ !s_screen_num_to_id                   ; $11C566 |
  LDA #$FCEB                                ; $11C569 |
  STA $32                                   ; $11C56C |
  LDA #$0001                                ; $11C56E |
  STA !r_header_bg1_tileset                 ; $11C571 |
  LDA #$01B9                                ; $11C574 |
  JSL spawn_sprite_init                     ; $11C577 |
  LDA #$01B8                                ; $11C57B |
  JSL spawn_sprite_init                     ; $11C57E |
  LDA #$0030                                ; $11C582 |
  STA !s_spr_x_pixel_pos,y                  ; $11C585 |
  LDA #$0050                                ; $11C588 |
  STA !s_spr_y_pixel_pos,y                  ; $11C58B |
  LDA #$01B8                                ; $11C58E |
  JSL spawn_sprite_init                     ; $11C591 |
  LDA #$00B0                                ; $11C595 |
  STA !s_spr_x_pixel_pos,y                  ; $11C598 |
  LDA #$0040                                ; $11C59B |
  STA !s_spr_y_pixel_pos,y                  ; $11C59E |
  LDA #$01B8                                ; $11C5A1 |
  JSL spawn_sprite_init                     ; $11C5A4 |
  LDA #$0020                                ; $11C5A8 |
  STA !s_spr_x_pixel_pos,y                  ; $11C5AB |
  LDA #$0090                                ; $11C5AE |
  STA !s_spr_y_pixel_pos,y                  ; $11C5B1 |
  LDA #$01B8                                ; $11C5B4 |
  JSL spawn_sprite_init                     ; $11C5B7 |
  LDA #$00A0                                ; $11C5BB |
  STA !s_spr_x_pixel_pos,y                  ; $11C5BE |
  LDA #$0080                                ; $11C5C1 |
  STA !s_spr_y_pixel_pos,y                  ; $11C5C4 |
  LDA #$01B8                                ; $11C5C7 |
  JSL spawn_sprite_init                     ; $11C5CA |
  LDA #$0090                                ; $11C5CE |
  STA !s_spr_x_pixel_pos,y                  ; $11C5D1 |
  LDA #$00C0                                ; $11C5D4 |
  STA !s_spr_y_pixel_pos,y                  ; $11C5D7 |
  LDA #$01B8                                ; $11C5DA |
  JSL spawn_sprite_init                     ; $11C5DD |
  LDA #$00E0                                ; $11C5E1 |
  STA !s_spr_x_pixel_pos,y                  ; $11C5E4 |
  LDA #$00C0                                ; $11C5E7 |
  STA !s_spr_y_pixel_pos,y                  ; $11C5EA |
  JSL $0397D3                               ; $11C5ED |
  LDA #$15                                  ; $11C5F1 |
  STA $34                                   ; $11C5F3 |
  JSL $108B61                               ; $11C5F5 |
  RTS                                       ; $11C5F9 |

  JSL $008259                               ; $11C5FA |
  LDA #$30                                  ; $11C5FE |
  STA $6126                                 ; $11C600 |
  JSL spr_edge_despawn_draw                 ; $11C603 |
  JSL draw_player                           ; $11C607 |
  STZ $03BA                                 ; $11C60B |
  LDA $1100                                 ; $11C60E |
  BEQ CODE_11C618                           ; $11C611 |
  LDA $1102                                 ; $11C613 |
  BNE CODE_11C622                           ; $11C616 |

CODE_11C618:
  LDA #$01                                  ; $11C618 |
  STA $10FA                                 ; $11C61A |
  JSR CODE_11AEC4                           ; $11C61D |
  BRA CODE_11C632                           ; $11C620 |

CODE_11C622:
  JSL $04DD9E                               ; $11C622 |
  LDA !r_msg_box_state                      ; $11C626 |
  BNE CODE_11C632                           ; $11C629 |
  JSL $0397D3                               ; $11C62B |
  JSR CODE_11B8E2                           ; $11C62F |

CODE_11C632:
  REP #$20                                  ; $11C632 |
  LDX #$08                                  ; $11C634 |
  LDA #$B1EF                                ; $11C636 |
  JSL r_gsu_init_1                          ; $11C639 | GSU init
  SEP #$20                                  ; $11C63D |
  RTS                                       ; $11C63F |

init_mini_battle_bandit_4:
  LDA #$00C0                                ; $11C640 |
  STA !s_spr_y_pixel_pos,x                  ; $11C643 |
  LDA #$00C0                                ; $11C646 |
  STA !s_spr_x_pixel_pos,x                  ; $11C649 |
  LDA #$0004                                ; $11C64C |
  STA !s_spr_timer_1,x                      ; $11C64F |
  LDA #$0030                                ; $11C652 |
  STA !s_spr_oam_yxppccct,x                 ; $11C655 |
  RTL                                       ; $11C658 |

  dw $FFF0, $0010, $FF00, $0100             ; $11C659 |

  dw $0040, $FFC0, $FDC0, $0240             ; $11C661 |

  dw $FDC0, $0240, $0010, $00E0             ; $11C669 |

  dw $0010, $00E0, $0011, $0012             ; $11C671 |

main_mini_battle_bandit_4:
  LDA !s_spr_state,x                        ; $11C679 |
  CMP #$0010                                ; $11C67C |
  BNE CODE_11C6A2                           ; $11C67F |
  LDY !s_spr_collision_id,x                 ; $11C681 |
  BEQ CODE_11C6D8                           ; $11C684 |
  BMI CODE_11C6D8                           ; $11C686 |
  DEY                                       ; $11C688 |
  LDA !s_spr_timer_3,x                      ; $11C689 |
  BNE CODE_11C6D8                           ; $11C68C |
  LDA !s_spr_id,y                           ; $11C68E |
  CMP #$0107                                ; $11C691 |
  BNE CODE_11C6D8                           ; $11C694 |
  LDA !s_spr_gsu_morph_2_lo,y               ; $11C696 |
  BNE CODE_11C6D8                           ; $11C699 |
  TYX                                       ; $11C69B |
  JSL $03B24B                               ; $11C69C |
  BRA CODE_11C6BA                           ; $11C6A0 |

CODE_11C6A2:
  PLA                                       ; $11C6A2 |
  PLY                                       ; $11C6A3 |
  LDA #$0010                                ; $11C6A4 |
  STA !s_spr_state,x                        ; $11C6A7 |
  LDA !s_spr_timer_3,x                      ; $11C6AA |
  BNE CODE_11C6D8                           ; $11C6AD |
  LDA $1102                                 ; $11C6AF |
  BEQ CODE_11C6BA                           ; $11C6B2 |
  DEC $1102                                 ; $11C6B4 |
  DEC $1102                                 ; $11C6B7 |

CODE_11C6BA:
  LDA #$FD00                                ; $11C6BA |
  STA !s_spr_y_speed_lo,x                   ; $11C6BD |
  LDA #$0080                                ; $11C6C0 |
  STA !s_spr_timer_3,x                      ; $11C6C3 |
  LDA #$0075                                ; $11C6C6 |\ play sound #$0075
  JSL push_sound_queue                      ; $11C6C9 |/
  LDA $1102                                 ; $11C6CD |
  BEQ CODE_11C6D8                           ; $11C6D0 |
  DEC $1102                                 ; $11C6D2 |
  DEC $1102                                 ; $11C6D5 |

CODE_11C6D8:
  LDA #$0010                                ; $11C6D8 |
  LDY !s_spr_timer_3,x                      ; $11C6DB |
  BEQ CODE_11C6E3                           ; $11C6DE |
  LDA #$0000                                ; $11C6E0 |

CODE_11C6E3:
  STA $00                                   ; $11C6E3 |
  LDA !s_spr_oam_1,x                        ; $11C6E5 |
  AND #$FFEF                                ; $11C6E8 |
  ORA $00                                   ; $11C6EB |
  STA !s_spr_oam_1,x                        ; $11C6ED |
  SEP #$20                                  ; $11C6F0 |
  LDY #$04                                  ; $11C6F2 |
  LDA !s_spr_timer_3,x                      ; $11C6F4 |
  AND #$04                                  ; $11C6F7 |
  BEQ CODE_11C6FD                           ; $11C6F9 |
  LDY #$FF                                  ; $11C6FB |

CODE_11C6FD:
  TYA                                       ; $11C6FD |
  STA !s_spr_draw_priority,x                ; $11C6FE |
  REP #$20                                  ; $11C701 |
  LDY !s_spr_facing_dir,x                   ; $11C703 |
  BNE CODE_11C720                           ; $11C706 |
  LDA !s_spr_cam_x_pos,x                    ; $11C708 |
  CMP #$0010                                ; $11C70B |
  BCS CODE_11C737                           ; $11C70E |
  LDA #$0010                                ; $11C710 |
  SEC                                       ; $11C713 |
  SBC !s_spr_cam_x_pos,x                    ; $11C714 |
  CLC                                       ; $11C717 |
  ADC !s_spr_x_pixel_pos,x                  ; $11C718 |
  STA !s_spr_x_pixel_pos,x                  ; $11C71B |
  BRA CODE_11C734                           ; $11C71E |

CODE_11C720:
  LDA !s_spr_cam_x_pos,x                    ; $11C720 |
  SEC                                       ; $11C723 |
  SBC #$00E0                                ; $11C724 |
  BMI CODE_11C737                           ; $11C727 |
  STA $00                                   ; $11C729 |
  LDA !s_spr_x_pixel_pos,x                  ; $11C72B |
  SEC                                       ; $11C72E |
  SBC $00                                   ; $11C72F |
  STA !s_spr_x_pixel_pos,x                  ; $11C731 |

CODE_11C734:
  STZ !s_spr_x_speed_lo,x                   ; $11C734 |

CODE_11C737:
  LDA $1104                                 ; $11C737 |
  BNE CODE_11C767                           ; $11C73A |
  LDY !s_spr_collision_id,x                 ; $11C73C |
  BEQ CODE_11C780                           ; $11C73F |
  BMI CODE_11C780                           ; $11C741 |
  DEY                                       ; $11C743 |
  LDA !s_spr_state,y                        ; $11C744 |
  CMP #$0010                                ; $11C747 |
  BNE CODE_11C767                           ; $11C74A |
  LDA !s_spr_id,y                           ; $11C74C |
  CMP #$0007                                ; $11C74F |
  BEQ CODE_11C759                           ; $11C752 |
  CMP #$0009                                ; $11C754 |
  BNE CODE_11C780                           ; $11C757 |

CODE_11C759:
  STA $1104                                 ; $11C759 |
  LDA #$0003                                ; $11C75C |
  STA $1106                                 ; $11C75F |
  TYX                                       ; $11C762 |
  JSL $03A31E                               ; $11C763 |

CODE_11C767:
  LDA $110A                                 ; $11C767 |
  BNE CODE_11C775                           ; $11C76A |
  LDA !r_joy2_lo_press                      ; $11C76C |
  ASL A                                     ; $11C76F |
  BPL CODE_11C780                           ; $11C770 |
  JSR CODE_11C267                           ; $11C772 |

CODE_11C775:
  JSR CODE_11C2CF                           ; $11C775 |
  LDA #$0030                                ; $11C778 |
  STA !s_spr_oam_yxppccct,x                 ; $11C77B |
  BRA CODE_11C79E                           ; $11C77E |

CODE_11C780:
  LDA $110C                                 ; $11C780 |
  BNE CODE_11C79E                           ; $11C783 |
  LDA !r_joy2_hi                            ; $11C785 |
  AND #$0004                                ; $11C788 |
  BEQ CODE_11C79E                           ; $11C78B |
  LDA $1112                                 ; $11C78D |
  BNE CODE_11C79B                           ; $11C790 |
  LDA #$0004                                ; $11C792 |
  STA !s_spr_hitbox_height,x                ; $11C795 |
  STA $1112                                 ; $11C798 |

CODE_11C79B:
  JMP CODE_11C82B                           ; $11C79B |

CODE_11C79E:
  LDA #$0006                                ; $11C79E |
  STA !s_spr_hitbox_height,x                ; $11C7A1 |
  STZ $1112                                 ; $11C7A4 |
  LDY #$C0                                  ; $11C7A7 |
  LDA !r_joy2_lo                            ; $11C7A9 |
  BPL CODE_11C7D8                           ; $11C7AC |
  LDY #$20                                  ; $11C7AE |
  LDA $110C                                 ; $11C7B0 |
  BNE CODE_11C7D8                           ; $11C7B3 |
  LDA $7860,x                               ; $11C7B5 |
  LSR A                                     ; $11C7B8 |
  BCC CODE_11C7D8                           ; $11C7B9 |
  LDA !r_joy2_lo_press                      ; $11C7BB |
  BPL CODE_11C7D8                           ; $11C7BE |
  LDA #$FC00                                ; $11C7C0 |
  STA !s_spr_y_speed_lo,x                   ; $11C7C3 |
  PHY                                       ; $11C7C6 |
  LDA #$0038                                ; $11C7C7 |\ play sound #$0038
  JSL push_sound_queue                      ; $11C7CA |/
  PLY                                       ; $11C7CE |
  LDA #$0001                                ; $11C7CF |
  STA $110C                                 ; $11C7D2 |
  STA !s_spr_timer_1,x                      ; $11C7D5 |

CODE_11C7D8:
  TYA                                       ; $11C7D8 |
  STA !s_spr_y_accel,x                      ; $11C7D9 |
  LDA !r_joy2_hi                            ; $11C7DC |
  AND #$0003                                ; $11C7DF |
  BEQ CODE_11C82B                           ; $11C7E2 |
  AND #$0001                                ; $11C7E4 |
  ASL A                                     ; $11C7E7 |
  TAY                                       ; $11C7E8 |
  EOR !s_spr_facing_dir,x                   ; $11C7E9 |
  BEQ CODE_11C803                           ; $11C7EC |
  LDA !s_spr_x_speed_lo,x                   ; $11C7EE |
  CPY #$02                                  ; $11C7F1 |
  BEQ CODE_11C7F9                           ; $11C7F3 |
  EOR #$FFFF                                ; $11C7F5 |
  INC A                                     ; $11C7F8 |

CODE_11C7F9:
  CMP #$00C0                                ; $11C7F9 |
  BPL CODE_11C803                           ; $11C7FC |
  TYA                                       ; $11C7FE |
  ORA #$0004                                ; $11C7FF |
  TAY                                       ; $11C802 |

CODE_11C803:
  LDA !s_spr_x_pixel_pos,x                  ; $11C803 |
  CMP $C66D,y                               ; $11C806 |
  BEQ CODE_11C82B                           ; $11C809 |
  LDA !s_spr_x_speed_lo,x                   ; $11C80B |
  CLC                                       ; $11C80E |
  ADC $C659,y                               ; $11C80F |
  CMP $C665,y                               ; $11C812 |
  BEQ CODE_11C81A                           ; $11C815 |
  STA !s_spr_x_speed_lo,x                   ; $11C817 |

CODE_11C81A:
  LDY #$00                                  ; $11C81A |
  LDA !s_spr_x_speed_lo,x                   ; $11C81C |
  BEQ CODE_11C84A                           ; $11C81F |
  BMI CODE_11C825                           ; $11C821 |
  LDY #$02                                  ; $11C823 |

CODE_11C825:
  TYA                                       ; $11C825 |
  STA !s_spr_facing_dir,x                   ; $11C826 |
  BRA CODE_11C84A                           ; $11C829 |

CODE_11C82B:
  LDA $110C                                 ; $11C82B |
  BNE CODE_11C84A                           ; $11C82E |
  LDY !s_spr_facing_dir,x                   ; $11C830 |
  LDA !s_spr_x_speed_lo,x                   ; $11C833 |
  BEQ CODE_11C84A                           ; $11C836 |
  CLC                                       ; $11C838 |
  ADC $C661,y                               ; $11C839 |
  STA $00                                   ; $11C83C |
  EOR !s_spr_x_speed_lo,x                   ; $11C83E |
  BPL CODE_11C845                           ; $11C841 |
  STZ $00                                   ; $11C843 |

CODE_11C845:
  LDA $00                                   ; $11C845 |
  STA !s_spr_x_speed_lo,x                   ; $11C847 |

CODE_11C84A:
  LDA $110A                                 ; $11C84A |
  BNE CODE_11C8BF                           ; $11C84D |
  LDA $110C                                 ; $11C84F |
  BEQ CODE_11C88E                           ; $11C852 |
  LDA $7860,x                               ; $11C854 |
  LSR A                                     ; $11C857 |
  BCC CODE_11C875                           ; $11C858 |
  LDA !s_spr_timer_1,x                      ; $11C85A |
  BNE CODE_11C8BF                           ; $11C85D |
  LDY #$00                                  ; $11C85F |
  LDA $110C                                 ; $11C861 |
  INC A                                     ; $11C864 |
  AND #$0003                                ; $11C865 |
  STA $110C                                 ; $11C868 |
  BEQ CODE_11C88C                           ; $11C86B |
  ASL A                                     ; $11C86D |
  TAY                                       ; $11C86E |
  LDA $C671,y                               ; $11C86F |
  TAY                                       ; $11C872 |
  BRA CODE_11C8BB                           ; $11C873 |

CODE_11C875:
  LDY #$0E                                  ; $11C875 |
  LDA !s_spr_y_speed_lo,x                   ; $11C877 |
  CLC                                       ; $11C87A |
  ADC #$0100                                ; $11C87B |
  CMP #$0200                                ; $11C87E |
  BCC CODE_11C88C                           ; $11C881 |
  LDY #$0C                                  ; $11C883 |
  LDA !s_spr_y_speed_lo,x                   ; $11C885 |
  BMI CODE_11C88C                           ; $11C888 |
  LDY #$10                                  ; $11C88A |

CODE_11C88C:
  BRA CODE_11C8BB                           ; $11C88C |

CODE_11C88E:
  LDA $1112                                 ; $11C88E |
  BEQ CODE_11C897                           ; $11C891 |
  LDY #$1B                                  ; $11C893 |
  BRA CODE_11C8BB                           ; $11C895 |

CODE_11C897:
  LDY #$00                                  ; $11C897 |
  LDA !s_spr_x_speed_lo,x                   ; $11C899 |
  BEQ CODE_11C8BB                           ; $11C89C |
  LDA !s_spr_timer_1,x                      ; $11C89E |
  BNE CODE_11C8BF                           ; $11C8A1 |
  LDA #$0004                                ; $11C8A3 |
  STA !s_spr_timer_1,x                      ; $11C8A6 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $11C8A9 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $11C8AB |
  ASL A                                     ; $11C8AD |
  TAY                                       ; $11C8AE |
  CPY #$0C                                  ; $11C8AF |
  BNE CODE_11C8B7                           ; $11C8B1 |
  LDY #$00                                  ; $11C8B3 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $11C8B5 |

CODE_11C8B7:
  LDA $BA7C,y                               ; $11C8B7 |
  TAY                                       ; $11C8BA |

CODE_11C8BB:
  TYA                                       ; $11C8BB |
  STA !s_spr_anim_frame,x                   ; $11C8BC |

CODE_11C8BF:
  RTL                                       ; $11C8BF |

; item card table ptr
  dw $8070                                  ; $11C8C0 |
  dw $A070                                  ; $11C8C2 |
  dw $808C                                  ; $11C8C4 |
  dw $8054                                  ; $11C8C6 |
  dw $80A8                                  ; $11C8C8 |
  dw $801C                                  ; $11C8CA |
  dw $A08C                                  ; $11C8CC |
  dw $A08C                                  ; $11C8CE |
  dw $A0A8                                  ; $11C8D0 |
  dw $A000                                  ; $11C8D2 |
  dw $A01C                                  ; $11C8D4 |
  dw $A038                                  ; $11C8D6 |

; item card table ptr
  dw $C860                                  ; $11C8D8 |
  dw $DFFC                                  ; $11C8DA |
  dw $C860                                  ; $11C8DC |
  dw $C860                                  ; $11C8DE |
  dw $C860                                  ; $11C8E0 |
  dw $C860                                  ; $11C8E2 |
  dw $C87E                                  ; $11C8E4 |
  dw $C860                                  ; $11C8E6 |
  dw $DFFC                                  ; $11C8E8 |
  dw $C860                                  ; $11C8EA |
  dw $C860                                  ; $11C8EC |
  dw $C860                                  ; $11C8EE |

init_item_card:
  JSL $03AE60                               ; $11C8F0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11C8F4 |
  ASL A                                     ; $11C8F6 |
  TAY                                       ; $11C8F7 |
  LDA $C8D6,y                               ; $11C8F8 |
  STA $00                                   ; $11C8FB |
  PHB                                       ; $11C8FD |
  LDY #$5F                                  ; $11C8FE |
  PHY                                       ; $11C900 |
  PLB                                       ; $11C901 |
  LDX #$1C                                  ; $11C902 |
  TXY                                       ; $11C904 |

CODE_11C905:
  LDA ($00),y                               ; $11C905 |\
  STA $7021C2,x                             ; $11C907 | | loop through table at
  DEY                                       ; $11C90B | | $3Fxxxx where xxxx is
  DEY                                       ; $11C90C | | loaded from above table
  DEX                                       ; $11C90D | | item_card_table_ptr
  DEX                                       ; $11C90E | | $1C is table size
  BPL CODE_11C905                           ; $11C90F |/
  PLB                                       ; $11C911 |
  LDX !s_cur_sprite_slot                    ; $11C912 |
  LDA #$0020                                ; $11C915 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11C918 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11C91A |
  STA !gsu_r3                               ; $11C91C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11C91F |
  STA !gsu_r2                               ; $11C921 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11C924 |
  ASL A                                     ; $11C926 |
  TAY                                       ; $11C927 |
  LDA $C8BE,y                               ; $11C928 |
  STA !gsu_r14                              ; $11C92B |
  LDA #$0053                                ; $11C92E |
  STA !gsu_r13                              ; $11C931 |
  LDY !s_spr_dyntile_index,x                ; $11C934 |
  TYX                                       ; $11C937 |
  LDA $03A9CE,x                             ; $11C938 |
  STA !gsu_r0                               ; $11C93C |
  LDA $03A9EE,x                             ; $11C93F |
  STA !gsu_r1                               ; $11C943 |
  LDX #$08                                  ; $11C946 |
  LDA #$9BE1                                ; $11C948 |
  JSL r_gsu_init_1                          ; $11C94B | GSU init
  INC $0CF9                                 ; $11C94F |
  BRA CODE_11C99D                           ; $11C952 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11C954 |
  LDA #$0100                                ; $11C956 |
  STA !gsu_r11                              ; $11C959 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11C95C |
  LDA #$0000                                ; $11C95E |
  STA !gsu_r14                              ; $11C961 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $11C964 |
  ASL A                                     ; $11C966 |
  TAY                                       ; $11C967 |
  LDA $C8BE,y                               ; $11C968 |
  STA !gsu_r12                              ; $11C96B |
  LDA #$0053                                ; $11C96E |
  STA !gsu_r13                              ; $11C971 |
  LDY !s_spr_dyntile_index,x                ; $11C974 |
  TYX                                       ; $11C977 |
  LDA $03A9CE,x                             ; $11C978 |
  STA !gsu_r3                               ; $11C97C |
  LDA $03A9EE,x                             ; $11C97F |
  STA !gsu_r2                               ; $11C983 |
  LDA #$0010                                ; $11C986 |
  STA !gsu_r8                               ; $11C989 |
  STA !gsu_r9                               ; $11C98C |
  LDX #$08                                  ; $11C98F |
  LDA #$9BC5                                ; $11C991 |
  JSL r_gsu_init_1                          ; $11C994 | GSU init
  INC $0CF9                                 ; $11C998 |
  LDX $12                                   ; $11C99B |

CODE_11C99D:
  LDX $12                                   ; $11C99D |
  RTL                                       ; $11C99F |

main_item_card:
  PEA $C9AF                                 ; $11C9A0 | push return address
  LDA !s_spr_wildcard_3_lo,x                ; $11C9A3 |
  ASL A                                     ; $11C9A6 |
  TAY                                       ; $11C9A7 |
  LDA $C9BD,y                               ; $11C9A8 |
  STA $00                                   ; $11C9AB |
  JMP ($7960)                               ; $11C9AD |
  JSL $11C91A                               ; $11C9B0 | return here after JMP
  JSL $02DABA                               ; $11C9B4 |
  JSL $03AA52                               ; $11C9B8 |
  RTL                                       ; $11C9BC |

item_card_ptr:
  dw $C9C1                                  ; $11C9BD |
  dw $C9DD                                  ; $11C9BF |

; item_card_ptr routine
  LDA !s_spr_wildcard_5_lo_dp,x             ; $11C9C1 |
  CLC                                       ; $11C9C3 |
  ADC #$0002                                ; $11C9C4 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $11C9C7 |
  CMP #$0100                                ; $11C9C9 |
  BNE CODE_11C9D1                           ; $11C9CC |
  INC !s_spr_wildcard_3_lo,x                ; $11C9CE |

CODE_11C9D1:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $11C9D1 |
  CLC                                       ; $11C9D3 |
  ADC #$0003                                ; $11C9D4 |
  AND #$00FF                                ; $11C9D7 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $11C9DA |
  RTS                                       ; $11C9DC |

; item_card_ptr routine
  LDY !s_spr_collision_id,x                 ; $11C9DD |
  BEQ CODE_11CA04                           ; $11C9E0 |
  BPL CODE_11CA04                           ; $11C9E2 |
  LDA #$0036                                ; $11C9E4 |\ play sound #$0036
  JSL push_sound_queue                      ; $11C9E7 |/
  JSL $02A4F4                               ; $11C9EB |
  JSL $03A31E                               ; $11C9EF |
  INC $10FA                                 ; $11C9F3 |
  LDA !s_spr_wildcard_4_lo,x                ; $11C9F6 |
  CMP #$000A                                ; $11C9F9 |
  BCS CODE_11CA07                           ; $11C9FC |
  JSL $109CA6                               ; $11C9FE |
  LDX $12                                   ; $11CA02 |

CODE_11CA04:
  JMP CODE_11C9D1                           ; $11CA04 |

CODE_11CA07:
  SBC #$000A                                ; $11CA07 |
  INC A                                     ; $11CA0A |
  CLC                                       ; $11CA0B |
  ADC !r_extra_lives                        ; $11CA0C |
  STA !r_extra_lives                        ; $11CA0F |
  JMP CODE_11C9D1                           ; $11CA12 |

; level object data
  incbin level/level-05-obj.bin             ; $11CA15 |
  incbin level/level-3E-obj.bin             ; $11CC89 |
  incbin level/level-6F-obj.bin             ; $11CE64 |
  incbin level/level-9A-obj.bin             ; $11CF8C |

; level sprite data
  incbin level/level-05-spr.bin             ; $11D2BB |
  incbin level/level-3E-spr.bin             ; $11D34D |
  incbin level/level-6F-spr.bin             ; $11D39A |
  incbin level/level-9A-spr.bin             ; $11D3B4 |

; level object data
  incbin level/level-15-obj.bin             ; $11D3EF |
  incbin level/level-4D-obj.bin             ; $11D547 |
  incbin level/level-7B-obj.bin             ; $11D8B1 |
  incbin level/level-A3-obj.bin             ; $11DB2E |
  incbin level/level-BF-obj.bin             ; $11DC0F | also D0
  incbin level/level-C9-obj.bin             ; $11DC87 |
  incbin level/level-D5-obj.bin             ; $11DC9C |
  incbin level/level-D7-obj.bin             ; $11DDF6 |

; level sprite data
  incbin level/level-15-spr.bin             ; $11DE77 |
  incbin level/level-4D-spr.bin             ; $11DEB5 |
  incbin level/level-7B-spr.bin             ; $11DF32 |
  incbin level/level-A3-spr.bin             ; $11DFA3 |
  incbin level/level-BF-spr.bin             ; $11DFBA |
  incbin level/level-C9-spr.bin             ; $11DFBF |
  incbin level/level-D0-spr.bin             ; $11DFC4 |
  incbin level/level-D5-spr.bin             ; $11DFC9 |
  incbin level/level-D7-spr.bin             ; $11DFF2 |

; level object data
  incbin level/level-21-obj.bin             ; $11E01E |
  incbin level/level-58-obj.bin             ; $11E511 |
  incbin level/level-85-obj.bin             ; $11E6F7 |

; level sprite data
  incbin level/level-21-spr.bin             ; $11E767 |
  incbin level/level-58-spr.bin             ; $11E802 |
  incbin level/level-85-spr.bin             ; $11E876 |

; level object data
  incbin level/level-2D-obj.bin             ; $11E8B1 |
  incbin level/level-64-obj.bin             ; $11EA84 |
  incbin level/level-90-obj.bin             ; $11ED0B |
  incbin level/level-B5-obj.bin             ; $11F048 |

; level sprite data
  incbin level/level-2D-spr.bin             ; $11F1E1 |
  incbin level/level-64-spr.bin             ; $11F288 |
  incbin level/level-90-spr.bin             ; $11F2F9 |
  incbin level/level-B5-spr.bin             ; $11F373 |

; level object data
  incbin level/level-35-obj.bin             ; $11F3DE |
  incbin level/level-6C-obj.bin             ; $11F774 |
  incbin level/level-98-obj.bin             ; $11F92E |
  incbin level/level-B9-obj.bin             ; $11FAA9 |

; level sprite data
  incbin level/level-35-spr.bin             ; $11FB9F |
  incbin level/level-6C-spr.bin             ; $11FC22 |
  incbin level/level-98-spr.bin             ; $11FC93 |
  incbin level/level-B9-spr.bin             ; $11FD6A |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FD87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FD8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FD97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FD9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FDFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FE9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FECF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FED7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FEFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FF9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $11FFF7 |
  db $FF                                    ; $11FFFF |
