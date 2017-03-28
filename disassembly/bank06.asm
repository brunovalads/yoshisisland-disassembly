org $068000

init_slime:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $068000 |
  BNE CODE_068064                           ; $068002 |
  JSL $03D406                               ; $068004 |
  REP #$10                                  ; $068008 |
  LDA !s_spr_y_pixel_pos,x                  ; $06800A |
  STA $1094                                 ; $06800D |
  SEC                                       ; $068010 |
  SBC #$0038                                ; $068011 |
  PHA                                       ; $068014 |
  AND #$FF00                                ; $068015 |
  LSR A                                     ; $068018 |
  LSR A                                     ; $068019 |
  LSR A                                     ; $06801A |
  LSR A                                     ; $06801B |
  STA $00                                   ; $06801C |
  LDA !s_spr_x_pixel_pos,x                  ; $06801E |
  STA $1092                                 ; $068021 |
  SEC                                       ; $068024 |
  SBC #$0018                                ; $068025 |
  PHA                                       ; $068028 |
  AND #$FF00                                ; $068029 |
  XBA                                       ; $06802C |
  ORA $00                                   ; $06802D |
  TAX                                       ; $06802F |
  PLA                                       ; $068030 |
  AND #$00F0                                ; $068031 |
  LSR A                                     ; $068034 |
  LSR A                                     ; $068035 |
  LSR A                                     ; $068036 |
  STA $00                                   ; $068037 |
  PLA                                       ; $068039 |
  AND #$00F0                                ; $06803A |
  ASL A                                     ; $06803D |
  ORA $00                                   ; $06803E |
  STA $00                                   ; $068040 |
  LDA $6CA9,x                               ; $068042 |
  AND #$3F00                                ; $068045 |
  ASL A                                     ; $068048 |
  CLC                                       ; $068049 |
  ADC $00                                   ; $06804A |
  STA $00                                   ; $06804C |
  TAX                                       ; $06804E |
  LDA $7F8000,x                             ; $06804F |
  SEP #$10                                  ; $068053 |
  LDX $12                                   ; $068055 |
  CMP #$0174                                ; $068057 |
  BEQ CODE_068060                           ; $06805A |

CODE_06805C:
  JML $03A31E                               ; $06805C |

CODE_068060:
  LDA $00                                   ; $068060 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $068062 |

CODE_068064:
  LDA $0CB2                                 ; $068064 |
  BNE CODE_06805C                           ; $068067 |
  LDA !s_player_hitbox_half_width           ; $068069 |
  CLC                                       ; $06806C |
  ADC #$0030                                ; $06806D |
  ASL A                                     ; $068070 |
  STA $00                                   ; $068071 |
  LSR A                                     ; $068073 |
  CLC                                       ; $068074 |
  ADC !s_spr_x_pixel_pos,x                  ; $068075 |
  CLC                                       ; $068078 |
  ADC #$0010                                ; $068079 |
  SEC                                       ; $06807C |
  SBC !s_player_center_x                    ; $06807D |
  CMP $00                                   ; $068080 |
  BCS CODE_06809D                           ; $068082 |
  LDA !s_spr_y_pixel_pos,x                  ; $068084 |
  SEC                                       ; $068087 |
  SBC !s_player_center_y                    ; $068088 |
  SEC                                       ; $06808B |
  SBC !s_player_hitbox_half_height          ; $06808C |
  SEC                                       ; $06808F |
  SBC #$0041                                ; $068090 |
  BPL CODE_06809D                           ; $068093 |
  LDA !s_player_tile_collision              ; $068095 |
  AND #$0007                                ; $068098 |
  BNE CODE_0680A4                           ; $06809B |

CODE_06809D:
  LDA #$0002                                ; $06809D |
  STA !s_spr_state,x                        ; $0680A0 |
  RTL                                       ; $0680A3 |

CODE_0680A4:
  INC $0CB2                                 ; $0680A4 |
  LDA #$0174                                ; $0680A7 |
  JSL $0681A6                               ; $0680AA |
  LDA $04                                   ; $0680AE |
  XBA                                       ; $0680B0 |
  AND #$00E3                                ; $0680B1 |
  STA $107E                                 ; $0680B4 |
  ORA #$0080                                ; $0680B7 |
  STA $1080                                 ; $0680BA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0680BD |
  STA $1090                                 ; $0680BF |
  LDA !s_spr_x_pixel_pos,x                  ; $0680C2 |
  CLC                                       ; $0680C5 |
  ADC #$0008                                ; $0680C6 |
  STA !s_spr_x_pixel_pos,x                  ; $0680C9 |
  STZ $107C                                 ; $0680CC |
  LDA #$0008                                ; $0680CF |
  STA $02                                   ; $0680D2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0680D4 |
  CLC                                       ; $0680D7 |
  ADC #$FFC8                                ; $0680D8 |
  AND #$00F0                                ; $0680DB |
  ASL A                                     ; $0680DE |
  ASL A                                     ; $0680DF |
  STA $00                                   ; $0680E0 |
  LDA !s_spr_x_pixel_pos,x                  ; $0680E2 |
  CLC                                       ; $0680E5 |
  ADC #$FFE0                                ; $0680E6 |
  AND #$01F0                                ; $0680E9 |
  LSR A                                     ; $0680EC |
  LSR A                                     ; $0680ED |
  LSR A                                     ; $0680EE |
  BIT #$0020                                ; $0680EF |
  BEQ CODE_0680F7                           ; $0680F2 |
  EOR #$0420                                ; $0680F4 |

CODE_0680F7:
  TSB $00                                   ; $0680F7 |
  LDA $00                                   ; $0680F9 |
  CLC                                       ; $0680FB |
  ADC #$6800                                ; $0680FC |
  STA $00                                   ; $0680FF |
  STA $108E                                 ; $068101 |
  LDA #$0006                                ; $068104 |
  STA $0E                                   ; $068107 |
  PHB                                       ; $068109 |
  SEP #$20                                  ; $06810A |
  LDA #$7E                                  ; $06810C |
  PHA                                       ; $06810E |
  PLB                                       ; $06810F |
  REP #$30                                  ; $068110 |
  LDX $4800                                 ; $068112 |

CODE_068115:
  LDA $00                                   ; $068115 |
  STA $0000,x                               ; $068117 |
  LDA #$0880                                ; $06811A |
  STA $0002,x                               ; $06811D |
  LDA #$0019                                ; $068120 |
  STA $0004,x                               ; $068123 |
  LDA #$107E                                ; $068126 |
  STA $0005,x                               ; $068129 |
  LDA #$0000                                ; $06812C |
  STA $0007,x                               ; $06812F |
  LDA #$000C                                ; $068132 |
  STA $0008,x                               ; $068135 |
  TXA                                       ; $068138 |
  CLC                                       ; $068139 |
  ADC #$000C                                ; $06813A |
  STA $000A,x                               ; $06813D |
  TAX                                       ; $068140 |
  DEC $02                                   ; $068141 |
  BEQ CODE_06814F                           ; $068143 |
  LDA $00                                   ; $068145 |
  CLC                                       ; $068147 |
  ADC #$0020                                ; $068148 |
  STA $00                                   ; $06814B |
  BRA CODE_068115                           ; $06814D |

CODE_06814F:
  LDA $00                                   ; $06814F |
  INC A                                     ; $068151 |
  STA $0000,x                               ; $068152 |
  LDA #$0880                                ; $068155 |
  STA $0002,x                               ; $068158 |
  LDA #$0019                                ; $06815B |
  STA $0004,x                               ; $06815E |
  LDA #$1080                                ; $068161 |
  STA $0005,x                               ; $068164 |
  LDA #$0000                                ; $068167 |
  STA $0007,x                               ; $06816A |
  LDA #$000A                                ; $06816D |
  STA $0008,x                               ; $068170 |
  TXA                                       ; $068173 |
  CLC                                       ; $068174 |
  ADC #$000C                                ; $068175 |
  STA $000A,x                               ; $068178 |
  STA $4800                                 ; $06817B |
  JSR CODE_0690D2                           ; $06817E |
  PLB                                       ; $068181 |
  LDA #$0008                                ; $068182 |
  STA !s_spr_timer_1,x                      ; $068185 |
  LSR A                                     ; $068188 |
  STA $105E                                 ; $068189 |
  LDA #$E000                                ; $06818C |
  STA $1078                                 ; $06818F |
  STZ $1070                                 ; $068192 |
  LDA #$0001                                ; $068195 |
  STA $10B6                                 ; $068198 |
  LDA #$883A                                ; $06819B |
  STA $108C                                 ; $06819E |
  LDY #$940C                                ; $0681A1 |
  ROR $6B,x                                 ; $0681A4 |
  PHY                                       ; $0681A6 |
  REP #$10                                  ; $0681A7 |
  TAY                                       ; $0681A9 |
  AND #$FF00                                ; $0681AA |
  XBA                                       ; $0681AD |
  ASL A                                     ; $0681AE |
  TAX                                       ; $0681AF |
  LDA $4C32A4,x                             ; $0681B0 |
  STA $00                                   ; $0681B4 |
  TYA                                       ; $0681B6 |
  AND #$00FF                                ; $0681B7 |
  ASL A                                     ; $0681BA |
  ASL A                                     ; $0681BB |
  ASL A                                     ; $0681BC |
  CLC                                       ; $0681BD |
  ADC $00                                   ; $0681BE |
  TAX                                       ; $0681C0 |
  LDA $4C33F2,x                             ; $0681C1 |
  STA $04                                   ; $0681C5 |
  LDA $4C33F4,x                             ; $0681C7 |
  STA $06                                   ; $0681CB |
  LDA $4C33F6,x                             ; $0681CD |
  STA $08                                   ; $0681D1 |
  LDA $4C33F8,x                             ; $0681D3 |
  STA $0A                                   ; $0681D7 |
  SEP #$10                                  ; $0681D9 |
  PLY                                       ; $0681DB |
  LDX $12                                   ; $0681DC |
  RTL                                       ; $0681DE |

salvo_init_state_ptr:
  dw $81FE                                  ; $0681DF | $00: salvo spawn
  dw $823D                                  ; $0681E1 | $01: door closing
  dw $8292                                  ; $0681E3 | $02: small slime falling to the ground, idle
  dw $833D                                  ; $0681E5 | $03: ??
  dw $8347                                  ; $0681E7 | $04: ??
  dw $8362                                  ; $0681E9 | $05: salvo dripping from ceiling
  dw $82A2                                  ; $0681EB | $06: salvo bouncing back after spawning
  dw $8384                                  ; $0681ED | $07: salvo growing

init_salvo:
  TXY                                       ; $0681EF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0681F0 |
  ASL A                                     ; $0681F2 |
  TAX                                       ; $0681F3 |
  JSR ($81DF,x)                             ; $0681F4 |
  LDA #$0002                                ; $0681F7 |
  STA !s_spr_state,x                        ; $0681FA |
  RTL                                       ; $0681FD |

; $00: salvo spawn
  TYX                                       ; $0681FE |
  LDA !s_player_x                           ; $0681FF |
  CMP #$01E0                                ; $068202 |
  BMI CODE_06823C                           ; $068205 |
  STZ !s_player_x_speed_prev                ; $068207 |
  STZ !s_player_x_speed                     ; $06820A |
  JSL $04F74A                               ; $06820D |
  LDA #$0048                                ; $068211 |
  JSL spawn_sprite_init                     ; $068214 |
  LDA #$0010                                ; $068218 |
  STA !s_spr_x_pixel_pos,y                  ; $06821B |
  LDA #$00F1                                ; $06821E |
  STA !r_apu_io_0_mirror                    ; $068221 |
  LDA #$00DD                                ; $068224 |
  JSL spawn_sprite_active                   ; $068227 |
  LDA #$0000                                ; $06822B |
  STA !s_spr_wildcard_4_lo,y                ; $06822E |
  LDA #$0026                                ; $068231 |
  STA !s_spr_wildcard_2_lo,y                ; $068234 |
  STZ $105A                                 ; $068237 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $06823A |

CODE_06823C:
  RTS                                       ; $06823C |

; $01: door closing
  TYX                                       ; $06823D |
  STZ !s_player_direction                   ; $06823E |
  LDY $105A                                 ; $068241 |
  BEQ CODE_068291                           ; $068244 |
  LDA #$0132                                ; $068246 |
  JSL spawn_sprite_active                   ; $068249 |
  LDA #$0240                                ; $06824D |
  STA !s_spr_x_pixel_pos,y                  ; $068250 |
  LDA #$0730                                ; $068253 |
  STA !s_spr_y_pixel_pos,y                  ; $068256 |
  LDA #$0006                                ; $068259 |
  STA !s_spr_wildcard_5_lo,y                ; $06825C |
  LDA !s_spr_bitwise_settings_3,y           ; $06825F |
  ORA #$2000                                ; $068262 |
  STA !s_spr_bitwise_settings_3,y           ; $068265 |
  SEP #$20                                  ; $068268 |
  LDA #$01                                  ; $06826A |
  STA !s_spr_draw_priority,y                ; $06826C |
  LDA #$2E                                  ; $06826F |
  STA !s_spr_oam_yxppccct,y                 ; $068271 |
  REP #$20                                  ; $068274 |
  LDA #$0009                                ; $068276 |
  STA !r_apu_io_0_mirror                    ; $068279 |
  LDX #$20                                  ; $06827C |

CODE_06827E:
  LDA $702E8A,x                             ; $06827E |
  STA $7021BE,x                             ; $068282 |
  DEX                                       ; $068286 |
  DEX                                       ; $068287 |
  BNE CODE_06827E                           ; $068288 |
  LDX $12                                   ; $06828A |
  STZ $105A                                 ; $06828C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $06828F |

CODE_068291:
  RTS                                       ; $068291 |

; $02: small slime falling to the ground, idle
  TYX                                       ; $068292 |
  LDY $105A                                 ; $068293 |
  BEQ CODE_0682A1                           ; $068296 |
  STZ $10B6                                 ; $068298 |
  LDY #$06                                  ; $06829B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $06829D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $06829F |

CODE_0682A1:
  RTS                                       ; $0682A1 |

; $06: salvo bouncing back after spawning
  TYX                                       ; $0682A2 |
  JSL $03D5E4                               ; $0682A3 |
  STZ $7ECC                                 ; $0682A7 |
  LDA !r_bg1_cam_x                          ; $0682AA |
  CLC                                       ; $0682AD |
  ADC #$00A8                                ; $0682AE |
  STA !s_spr_x_pixel_pos,x                  ; $0682B1 |
  LDA #$0728                                ; $0682B4 |
  STA !s_spr_y_pixel_pos,x                  ; $0682B7 |
  STA $1076                                 ; $0682BA |
  LDA #$07B0                                ; $0682BD |
  STA $108A                                 ; $0682C0 |
  INC $0CB2                                 ; $0682C3 |
  LDY #$05                                  ; $0682C6 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0682C8 |
  LDA #$01D1                                ; $0682CA |
  JSL spawn_ambient_sprite                  ; $0682CD |
  LDA !s_spr_x_pixel_pos,x                  ; $0682D1 |
  STA $70A2,y                               ; $0682D4 |
  LDA !s_spr_y_pixel_pos,x                  ; $0682D7 |
  CLC                                       ; $0682DA |
  ADC #$0006                                ; $0682DB |
  STA !s_spr_y_pixel_pos,x                  ; $0682DE |
  STA $7142,y                               ; $0682E1 |
  LDA !s_spr_y_pixel_pos,x                  ; $0682E4 |
  SEC                                       ; $0682E7 |
  SBC !s_bg1_cam_y                          ; $0682E8 |
  CLC                                       ; $0682EB |
  ADC #$0016                                ; $0682EC |
  STA $1062                                 ; $0682EF |
  LDA #$FFFF                                ; $0682F2 |
  STA $7782,y                               ; $0682F5 |
  TYA                                       ; $0682F8 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0682F9 |
  TXA                                       ; $0682FC |
  STA $7E4C,y                               ; $0682FD |
  STZ $105C                                 ; $068300 |
  STZ $105E                                 ; $068303 |
  STZ $1060                                 ; $068306 |
  STZ $1064                                 ; $068309 |
  STZ $1066                                 ; $06830C |
  LDA #$0100                                ; $06830F |
  STA $1068                                 ; $068312 |
  STZ $106C                                 ; $068315 |
  STZ $1084                                 ; $068318 |
  STZ $1086                                 ; $06831B |
  LDA #$B000                                ; $06831E |
  STA $1078                                 ; $068321 |
  STZ $106A                                 ; $068324 |
  LDA #$00E0                                ; $068327 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06832A |
  STZ !s_spr_wildcard_1_lo,x                ; $06832C |
  STZ $1070                                 ; $06832F |
  LDA #$0001                                ; $068332 |
  STA $1082                                 ; $068335 |
  STZ $1088                                 ; $068338 |
  PLA                                       ; $06833B |
  RTL                                       ; $06833C |

; $03: ??
  LDA #$0016                                ; $06833D |
  REP #$10                                  ; $068340 |
  LDY #$2800                                ; $068342 |
  BRA CODE_06834F                           ; $068345 |

; $04: ??
  LDA #$0015                                ; $068347 |
  REP #$10                                  ; $06834A |
  LDY #$2C00                                ; $06834C |

CODE_06834F:
  PHA                                       ; $06834F |
  PHY                                       ; $068350 |
  SEP #$10                                  ; $068351 |
  LDA #$0404                                ; $068353 |
  TRB !r_reg_tm_mirror                      ; $068356 |
  REP #$10                                  ; $068359 |
  PLY                                       ; $06835B |
  PLA                                       ; $06835C |
  JSR CODE_068395                           ; $06835D |
  BRA CODE_06837F                           ; $068360 |

; $05: salvo dripping from ceiling
  REP #$10                                  ; $068362 |
  LDA #$00DD                                ; $068364 |
  LDY #$3400                                ; $068367 |
  JSR CODE_068395                           ; $06836A |
  LDX #$06                                  ; $06836D |

CODE_06836F:
  LDA $5FE344,x                             ; $06836F |
  STA $702D74,x                             ; $068373 |
  STA $702008,x                             ; $068377 |
  DEX                                       ; $06837B |
  DEX                                       ; $06837C |
  BPL CODE_06836F                           ; $06837D |

CODE_06837F:
  LDX $12                                   ; $06837F |
  INC !s_spr_wildcard_5_lo_dp,x             ; $068381 |
  RTS                                       ; $068383 |

; $07: salvo growing
  JSR CODE_068603                           ; $068384 |
  LDY #$0F                                  ; $068387 |
  STY $4331                                 ; $068389 |
  INY                                       ; $06838C |
  STY $4341                                 ; $06838D |
  LDX $12                                   ; $068390 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $068392 |
  RTS                                       ; $068394 |

; salvo sub
CODE_068395:
  PHY                                       ; $068395 |
  LDX #$6800                                ; $068396 |
  JSL decompress_lc_lz1_l_x                 ; $068399 |
  PLY                                       ; $06839D |
  LDX #$0070                                ; $06839E |
  STX $0001                                 ; $0683A1 |
  LDX #$6800                                ; $0683A4 |
  JSL $00BEA6                               ; $0683A7 |
  SEP #$10                                  ; $0683AB |
  RTS                                       ; $0683AD |

salvo_main_state_ptr:
  dw $8999                                  ; $0683AE | $00
  dw $89B1                                  ; $0683B0 | $01
  dw $8A95                                  ; $0683B2 | $02
  dw $8B08                                  ; $0683B4 | $03
  dw $8999                                  ; $0683B6 | $04
  dw $8B59                                  ; $0683B8 | $05
  dw $8999                                  ; $0683BA | $06
  dw $8B94                                  ; $0683BC | $07
  dw $8BAD                                  ; $0683BE | $08
  dw $8BC6                                  ; $0683C0 | $09
  dw $8C0B                                  ; $0683C2 | $0A
  dw $8C8A                                  ; $0683C4 | $0B
  dw $8D65                                  ; $0683C6 | $0C
  dw $8E80                                  ; $0683C8 | $0D

main_salvo:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0683CA |
  STA !gsu_r0                               ; $0683CC |
  LDY $1079                                 ; $0683CF |
  TYA                                       ; $0683D2 |
  STA !gsu_r6                               ; $0683D3 |
  LDX #$0B                                  ; $0683D6 |
  LDA #$86B6                                ; $0683D8 |
  JSL r_gsu_init_1                          ; $0683DB | GSU init
  LDA #$0180                                ; $0683DF |
  STA !gsu_r6                               ; $0683E2 |
  LDX #$0B                                  ; $0683E5 |
  LDA #$86B6                                ; $0683E7 |
  JSL r_gsu_init_1                          ; $0683EA | GSU init
  LDX $12                                   ; $0683EE |
  LDA !gsu_r0                               ; $0683F0 |
  STA $107A                                 ; $0683F3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0683F6 |
  CPY #$0C                                  ; $0683F8 |
  BPL CODE_068402                           ; $0683FA |
  JSR CODE_068442                           ; $0683FC |
  JSR CODE_068722                           ; $0683FF |

CODE_068402:
  JSR CODE_068622                           ; $068402 |
  LDY $10B6                                 ; $068405 |
  BEQ CODE_068417                           ; $068408 |
  LDY !s_player_state                       ; $06840A |
  CPY #$06                                  ; $06840D |
  BNE CODE_068417                           ; $06840F |
  LDA #$0215                                ; $068411 |
  STA !r_reg_tm_mirror                      ; $068414 |

CODE_068417:
  JSL $03AF23                               ; $068417 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06841B |
  CPY #$0C                                  ; $06841D |
  BEQ CODE_06842B                           ; $06841F |
  CPY #$0D                                  ; $068421 |
  BEQ CODE_068428                           ; $068423 |
  JSR CODE_0687A5                           ; $068425 |

CODE_068428:
  JSR CODE_068909                           ; $068428 |

CODE_06842B:
  JSR CODE_06866E                           ; $06842B |
  TXY                                       ; $06842E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06842F |
  ASL A                                     ; $068431 |
  TAX                                       ; $068432 |
  JSR ($83AE,x)                             ; $068433 | main state
  LDA $106A                                 ; $068436 |
  BEQ CODE_06843E                           ; $068439 |
  DEC $106A                                 ; $06843B |

CODE_06843E:
  JSR CODE_0686C1                           ; $06843E |
  RTL                                       ; $068441 |

; salvo sub
CODE_068442:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $068442 |
  CPY #$05                                  ; $068444 |
  BEQ CODE_068452                           ; $068446 |
  CPY #$0B                                  ; $068448 |
  BNE CODE_068464                           ; $06844A |
  LDY $1088                                 ; $06844C |
  BEQ CODE_068464                           ; $06844F |
  RTS                                       ; $068451 |

CODE_068452:
  STZ $600E                                 ; $068452 |
  STZ $6010                                 ; $068455 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $068458 |
  LDA $7142,y                               ; $06845B |
  SEC                                       ; $06845E |
  SBC !r_bg1_cam_y                          ; $06845F |
  BRA CODE_0684AA                           ; $068462 |

CODE_068464:
  LDY !s_spr_gsu_morph_2_lo,x               ; $068464 |
  LDA !s_spr_wildcard_6_lo,y                ; $068467 |
  PHA                                       ; $06846A |
  AND #$00FF                                ; $06846B |
  TAY                                       ; $06846E |
  BPL CODE_068474                           ; $06846F |
  ORA #$FF00                                ; $068471 |

CODE_068474:
  STA $600E                                 ; $068474 |
  PLA                                       ; $068477 |
  AND #$FF00                                ; $068478 |
  BPL CODE_068480                           ; $06847B |
  ORA #$00FF                                ; $06847D |

CODE_068480:
  XBA                                       ; $068480 |
  STA $00                                   ; $068481 |
  LDA #$0028                                ; $068483 |
  STA !gsu_r0                               ; $068486 |
  LDA $107A                                 ; $068489 |
  STA !gsu_r6                               ; $06848C |
  LDX #$0B                                  ; $06848F |
  LDA #$86B6                                ; $068491 |
  JSL r_gsu_init_1                          ; $068494 | GSU init
  LDX $12                                   ; $068498 |
  LDA $00                                   ; $06849A |
  SEC                                       ; $06849C |
  SBC !gsu_r0                               ; $06849D |
  SEC                                       ; $0684A0 |
  SBC #$0008                                ; $0684A1 |
  STA $6010                                 ; $0684A4 |
  LDA #$0000                                ; $0684A7 |

CODE_0684AA:
  STA !gsu_r2                               ; $0684AA |
  LDA $1062                                 ; $0684AD |
  STA !gsu_r3                               ; $0684B0 |
  LDA !s_spr_cam_x_pos,x                    ; $0684B3 |
  CLC                                       ; $0684B6 |
  ADC #$0008                                ; $0684B7 |
  STA $6000                                 ; $0684BA |
  LDA !s_spr_cam_y_pos,x                    ; $0684BD |
  STA $6002                                 ; $0684C0 |
  LDA $107A                                 ; $0684C3 |
  STA $6006                                 ; $0684C6 |
  TXA                                       ; $0684C9 |
  STA $6012                                 ; $0684CA |
  LDA #$02C0                                ; $0684CD |
  SEC                                       ; $0684D0 |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $0684D1 |
  STA !gsu_r0                               ; $0684D3 |
  LDY $1079                                 ; $0684D6 |
  TYA                                       ; $0684D9 |
  STA !gsu_r6                               ; $0684DA |
  LDX #$0B                                  ; $0684DD |
  LDA #$86B6                                ; $0684DF |
  JSL r_gsu_init_1                          ; $0684E2 | GSU init
  LDA !gsu_r0                               ; $0684E6 |
  STA $6004                                 ; $0684E9 |
  LDA $1064                                 ; $0684EC |
  STA $6008                                 ; $0684EF |
  LDA $1066                                 ; $0684F2 |
  STA $600A                                 ; $0684F5 |
  LDA $1068                                 ; $0684F8 |
  STA $600C                                 ; $0684FB |
  LDA !s_player_x_cam_rel                   ; $0684FE |
  STA $6014                                 ; $068501 |
  LDA !s_player_y_cam_rel                   ; $068504 |
  STA $6016                                 ; $068507 |
  LDA !s_player_duck_state                  ; $06850A |
  STA $6018                                 ; $06850D |
  LDX #$0A                                  ; $068510 |
  LDA #$81C9                                ; $068512 |
  JSL r_gsu_init_3                          ; $068515 |
  REP #$10                                  ; $068519 |
  JSL $00BE39                               ; $06851B |

; args to $00BE39
  dw $5040, $727E, $7033, $0348             ; $06851F |

  SEP #$30                                  ; $068527 |
  LDA $1076                                 ; $068529 |
  ORA $1077                                 ; $06852C |
  BEQ CODE_06853C                           ; $06852F |
  LDA #$08                                  ; $068531 |
  TRB !r_reg_bgmode_mirror                  ; $068533 |
  LDY #$13                                  ; $068536 |
  LDA #$04                                  ; $068538 |
  BRA CODE_06854B                           ; $06853A |

CODE_06853C:
  LDY $10B6                                 ; $06853C |
  BEQ CODE_068547                           ; $06853F |
  LDY #$10                                  ; $068541 |
  LDA #$07                                  ; $068543 |
  BRA CODE_06854B                           ; $068545 |

CODE_068547:
  LDY #$12                                  ; $068547 |
  LDA #$05                                  ; $068549 |

CODE_06854B:
  STY !r_reg_tm_mirror                      ; $06854B |
  STA !r_reg_ts_mirror                      ; $06854E |
  LDA #$02                                  ; $068551 |
  STA !r_reg_cgwsel_mirror                  ; $068553 |
  LDA #$20                                  ; $068556 |
  STA !r_reg_cgadsub_mirror                 ; $068558 |
  LDA #$18                                  ; $06855B |
  TSB !r_reg_hdmaen_mirror                  ; $06855D |
  REP #$20                                  ; $068560 |
  LDX $12                                   ; $068562 |
  JSR CODE_068591                           ; $068564 |
  LDX $12                                   ; $068567 |
  LDA $6020                                 ; $068569 |
  STA !s_spr_wildcard_1_lo,x                ; $06856C |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06856F |
  CPY #$05                                  ; $068571 |
  BEQ CODE_068590                           ; $068573 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $068575 |
  LDA $600E                                 ; $068578 |
  CLC                                       ; $06857B |
  ADC !s_spr_x_pixel_pos,x                  ; $06857C |
  STA !s_spr_x_pixel_pos,y                  ; $06857F |
  LDA $6010                                 ; $068582 |
  CLC                                       ; $068585 |
  ADC !s_spr_y_pixel_pos,x                  ; $068586 |
  SEC                                       ; $068589 |
  SBC #$0010                                ; $06858A |
  STA !s_spr_y_pixel_pos,y                  ; $06858D |

CODE_068590:
  RTS                                       ; $068590 |

; salvo sub
CODE_068591:
  LDY $10B6                                 ; $068591 |
  BEQ CODE_0685E0                           ; $068594 |
  LDY $106A                                 ; $068596 |
  BEQ CODE_0685BE                           ; $068599 |
  LDA !s_spr_timer_3,x                      ; $06859B |
  BNE CODE_0685DF                           ; $06859E |
  LDA #$0004                                ; $0685A0 |
  STA !s_spr_timer_3,x                      ; $0685A3 |
  LDA $702002                               ; $0685A6 |
  EOR #$FFFF                                ; $0685AA |
  STA $702002                               ; $0685AD |
  STA $702D6E                               ; $0685B1 |
  LDA $702004                               ; $0685B5 |
  EOR #$FFFF                                ; $0685B9 |
  BRA CODE_0685CC                           ; $0685BC |

CODE_0685BE:
  LDA #$637D                                ; $0685BE |
  STA $702002                               ; $0685C1 |
  STA $702D6E                               ; $0685C5 |
  LDA #$4A75                                ; $0685C9 |

CODE_0685CC:
  STA $702004                               ; $0685CC |
  STA $702D70                               ; $0685D0 |
  LDA #$0000                                ; $0685D4 |
  STA $702006                               ; $0685D7 |
  STA $702D72                               ; $0685DB |

CODE_0685DF:
  RTS                                       ; $0685DF |

CODE_0685E0:
  LDY $106A                                 ; $0685E0 |
  BEQ CODE_068603                           ; $0685E3 |
  LDA !s_spr_timer_3,x                      ; $0685E5 |
  BNE CODE_068603                           ; $0685E8 |
  LDA #$0004                                ; $0685EA |
  STA !s_spr_timer_3,x                      ; $0685ED |
  LDX #$1C                                  ; $0685F0 |

CODE_0685F2:
  LDA $5FA56E,x                             ; $0685F2 |
  STA $7020C0,x                             ; $0685F6 |
  STA $7020E0,x                             ; $0685FA |
  DEX                                       ; $0685FE |
  DEX                                       ; $0685FF |
  BNE CODE_0685F2                           ; $068600 |
  RTS                                       ; $068602 |

CODE_068603:
  LDX #$1C                                  ; $068603 |

CODE_068605:
  LDA $5FE9C6,x                             ; $068605 |
  STA $702E2C,x                             ; $068609 |
  STA $7020C0,x                             ; $06860D |
  LDA $5FE9E2,x                             ; $068611 |
  STA $702E4C,x                             ; $068615 |
  STA $7020E0,x                             ; $068619 |
  DEX                                       ; $06861D |
  DEX                                       ; $06861E |
  BNE CODE_068605                           ; $06861F |
  RTS                                       ; $068621 |

; salvo sub
CODE_068622:
  LDY $1082                                 ; $068622 |
  BNE CODE_068631                           ; $068625 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $068627 |
  CPY #$04                                  ; $068629 |
  BEQ CODE_068631                           ; $06862B |
  CPY #$03                                  ; $06862D |
  BPL CODE_06866D                           ; $06862F |

CODE_068631:
  LDA $7860,x                               ; $068631 |
  AND #$000C                                ; $068634 |
  BEQ CODE_06866D                           ; $068637 |
  CMP #$000C                                ; $068639 |
  BEQ CODE_06866D                           ; $06863C |
  AND #$0008                                ; $06863E |
  LSR A                                     ; $068641 |
  LSR A                                     ; $068642 |
  DEC A                                     ; $068643 |
  CLC                                       ; $068644 |
  ADC !s_spr_x_pixel_pos,x                  ; $068645 |
  SEC                                       ; $068648 |
  SBC !s_spr_x_delta_lo,x                   ; $068649 |
  STA !s_spr_x_pixel_pos,x                  ; $06864C |
  LDA $10BC                                 ; $06864F |
  EOR #$FFFF                                ; $068652 |
  INC A                                     ; $068655 |
  STA $10BC                                 ; $068656 |
  LDA !s_spr_x_speed_lo,x                   ; $068659 |
  EOR #$FFFF                                ; $06865C |
  INC A                                     ; $06865F |
  STA !s_spr_x_speed_lo,x                   ; $068660 |
  LDA !s_spr_x_accel_ceiling,x              ; $068663 |
  EOR #$FFFF                                ; $068666 |
  INC A                                     ; $068669 |
  STA !s_spr_x_accel_ceiling,x              ; $06866A |

CODE_06866D:
  RTS                                       ; $06866D |

; salvo sub
CODE_06866E:
  LDY $1079                                 ; $06866E |
  CPY #$4C                                  ; $068671 |
  BCS CODE_0686C0                           ; $068673 |
  LDY $10B6                                 ; $068675 |
  BNE CODE_068683                           ; $068678 |
  LDY $0B59                                 ; $06867A |
  BNE CODE_068683                           ; $06867D |
  JSL $02A982                               ; $06867F |

CODE_068683:
  LDA $7860,x                               ; $068683 |
  AND #$0001                                ; $068686 |
  BEQ CODE_0686C0                           ; $068689 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06868B |
  CPY #$09                                  ; $06868D |
  BEQ CODE_0686C0                           ; $06868F |
  CPY #$0A                                  ; $068691 |
  BEQ CODE_0686C0                           ; $068693 |
  CPY #$0B                                  ; $068695 |
  BEQ CODE_0686C0                           ; $068697 |
  STZ !s_spr_x_speed_lo,x                   ; $068699 |
  STZ !s_spr_x_accel,x                      ; $06869C |
  LDA #$0040                                ; $06869F |
  STA !s_spr_timer_1,x                      ; $0686A2 |
  LDA #$000A                                ; $0686A5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0686A8 |
  LDA #$FFFF                                ; $0686AA |
  STA !s_spr_timer_4,x                      ; $0686AD |
  STA $0B7B                                 ; $0686B0 |
  LDY $10B6                                 ; $0686B3 |
  BNE CODE_0686C0                           ; $0686B6 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0686B8 |
  LDA #$0002                                ; $0686BA |
  STA !s_player_state                       ; $0686BD |

CODE_0686C0:
  RTS                                       ; $0686C0 |

; salvo sub
CODE_0686C1:
  LDA $10B6                                 ; $0686C1 |
  ORA $1082                                 ; $0686C4 |
  ORA $0B59                                 ; $0686C7 |
  BNE CODE_06871D                           ; $0686CA |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0686CC |
  CPY #$09                                  ; $0686CE |
  BPL CODE_06871D                           ; $0686D0 |
  LDA #$0132                                ; $0686D2 |
  STA !gsu_r4                               ; $0686D5 |
  INC A                                     ; $0686D8 |
  STA !gsu_r5                               ; $0686D9 |
  LDX #$09                                  ; $0686DC |
  LDA #$91DB                                ; $0686DE |
  JSL r_gsu_init_1                          ; $0686E1 | GSU init
  LDX $12                                   ; $0686E5 |
  LDY !gsu_r6                               ; $0686E7 |
  BNE CODE_06871D                           ; $0686EA |
  LDX #$09                                  ; $0686EC |
  LDA #$91D5                                ; $0686EE |
  JSL r_gsu_init_1                          ; $0686F1 | GSU init
  LDX $12                                   ; $0686F5 |
  LDY !gsu_r6                               ; $0686F7 |
  BNE CODE_06871D                           ; $0686FA |
  LDA #$0132                                ; $0686FC |
  JSL spawn_sprite_active                   ; $0686FF |
  BCC CODE_06871D                           ; $068703 |
  LDA $10                                   ; $068705 |
  AND #$00FF                                ; $068707 |
  CLC                                       ; $06870A |
  ADC #$01C8                                ; $06870B |
  STA !s_spr_x_pixel_pos,y                  ; $06870E |
  LDA #$0730                                ; $068711 |
  STA !s_spr_y_pixel_pos,y                  ; $068714 |
  LDA #$0001                                ; $068717 |
  STA !s_spr_draw_priority,y                ; $06871A |

CODE_06871D:
  RTS                                       ; $06871D |

  dw $FFFD, $FFFE                           ; $06871E |

; salvo sub
CODE_068722:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $068722 |
  CPY #$05                                  ; $068724 |
  BNE CODE_06872C                           ; $068726 |
  STZ $7860,x                               ; $068728 |
  RTS                                       ; $06872B |

CODE_06872C:
  LDY !s_spr_y_speed_hi,x                   ; $06872C |
  BMI CODE_068747                           ; $06872F |
  LDA $108A                                 ; $068731 |
  BMI CODE_068747                           ; $068734 |
  CMP !s_spr_y_pixel_pos,x                  ; $068736 |
  BPL CODE_068747                           ; $068739 |
  STA !s_spr_y_pixel_pos,x                  ; $06873B |
  LDA $7860,x                               ; $06873E |
  ORA #$0001                                ; $068741 |
  STA $7860,x                               ; $068744 |

CODE_068747:
  LDY $1070                                 ; $068747 |
  BNE CODE_06877D                           ; $06874A |
  LDY #$BD00                                ; $06874C |
  JSL $021072                               ; $06874F |
  INY                                       ; $068753 |
  INY                                       ; $068754 |
  LDA $871E,y                               ; $068755 |
  AND $7860,x                               ; $068758 |
  STA $7860,x                               ; $06875B |
  AND #$0003                                ; $06875E |
  BEQ CODE_068796                           ; $068761 |
  AND #$0002                                ; $068763 |
  BEQ CODE_06878A                           ; $068766 |
  LDA !s_spr_wildcard_1_lo,x                ; $068768 |
  SEC                                       ; $06876B |
  SBC #$0004                                ; $06876C |
  STA $1072                                 ; $06876F |
  STZ !s_spr_y_speed_lo,x                   ; $068772 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $068775 |
  STZ !s_spr_y_accel,x                      ; $068777 |
  INC $1070                                 ; $06877A |

CODE_06877D:
  LDA $1072                                 ; $06877D |
  CLC                                       ; $068780 |
  ADC !s_spr_y_pixel_pos,x                  ; $068781 |
  SEC                                       ; $068784 |
  SBC !s_spr_wildcard_1_lo,x                ; $068785 |
  BRA CODE_068793                           ; $068788 |

CODE_06878A:
  LDA !s_spr_y_pixel_pos,x                  ; $06878A |
  AND #$FFF0                                ; $06878D |
  ORA #$0001                                ; $068790 |

CODE_068793:
  STA !s_spr_y_pixel_pos,x                  ; $068793 |

CODE_068796:
  LDA $7860,x                               ; $068796 |
  AND #$0030                                ; $068799 |
  LSR A                                     ; $06879C |
  LSR A                                     ; $06879D |
  ORA $7860,x                               ; $06879E |
  STA $7860,x                               ; $0687A1 |
  RTS                                       ; $0687A4 |

; salvo sub
CODE_0687A5:
  LDY !s_spr_collision_id,x                 ; $0687A5 |
  DEY                                       ; $0687A8 |
  BMI CODE_0687E8                           ; $0687A9 |
  BEQ CODE_0687E8                           ; $0687AB |
  LDA !s_spr_state,y                        ; $0687AD |
  CMP #$0010                                ; $0687B0 |
  BNE CODE_0687E8                           ; $0687B3 |
  LDA !s_spr_collision_state,y              ; $0687B5 |
  BEQ CODE_0687E8                           ; $0687B8 |
  CPY $10BA                                 ; $0687BA |
  BEQ CODE_0687C5                           ; $0687BD |
  STY $10BA                                 ; $0687BF |
  STZ $10B8                                 ; $0687C2 |

CODE_0687C5:
  LDA $1078                                 ; $0687C5 |
  CMP #$4C00                                ; $0687C8 |
  BCC CODE_0687E3                           ; $0687CB |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0687CD |
  CMP #$0003                                ; $0687CF |
  BEQ CODE_0687E3                           ; $0687D2 |
  CMP #$0009                                ; $0687D4 |
  BEQ CODE_0687E3                           ; $0687D7 |
  CMP #$000A                                ; $0687D9 |
  BEQ CODE_0687E3                           ; $0687DC |
  CMP #$000B                                ; $0687DE |
  BNE CODE_0687EE                           ; $0687E1 |

CODE_0687E3:
  TYX                                       ; $0687E3 |
  JSL $03B24B                               ; $0687E4 |

CODE_0687E8:
  LDY #$FF                                  ; $0687E8 |
  STY $10BA                                 ; $0687EA |
  RTS                                       ; $0687ED |

CODE_0687EE:
  LDA #$0020                                ; $0687EE |
  STA $106A                                 ; $0687F1 |
  LDA !s_spr_timer_2,x                      ; $0687F4 |
  BNE CODE_0687E8                           ; $0687F7 |
  LDA !s_spr_x_pixel_pos,y                  ; $0687F9 |\
  STA $00                                   ; $0687FC | | store colliding sprite's location for later
  LDA !s_spr_y_pixel_pos,y                  ; $0687FE | |
  STA $02                                   ; $068801 |/
  LDA !s_spr_y_accel,y                      ; $068803 |
  STA $04                                   ; $068806 |
  LDA #$003B                                ; $068808 |\ play sound #$003B
  JSL push_sound_queue                      ; $06880B |/
  LDA $10B8                                 ; $06880F | slime generation timer
  AND #$0003                                ; $068812 | every 4 frames a slime spawns
  ORA $10B6                                 ; $068815 |
  BNE CODE_06886C                           ; $068818 |
  LDA #$0132                                ; $06881A |
  STA !gsu_r4                               ; $06881D |
  INC A                                     ; $068820 |
  STA !gsu_r5                               ; $068821 |
  LDX #$09                                  ; $068824 |
  LDA #$91DB                                ; $068826 |
  JSL r_gsu_init_1                          ; $068829 | GSU init
  LDX $12                                   ; $06882D |
  LDY !gsu_r6                               ; $06882F |
  CPY #$06                                  ; $068832 |
  BPL CODE_06886C                           ; $068834 |
  LDA #$0132                                ; $068836 |
  JSL spawn_sprite_active                   ; $068839 |
  BCC CODE_06886C                           ; $06883D |
  SEP #$20                                  ; $06883F |
  LDA #$02                                  ; $068841 |
  STA !s_spr_wildcard_5_lo,y                ; $068843 |
  LDA #$10                                  ; $068846 |
  STA !s_spr_timer_3,y                      ; $068848 |
  LDA !s_spr_bitwise_settings_2,y           ; $06884B |
  AND #$F9                                  ; $06884E |
  STA !s_spr_bitwise_settings_2,y           ; $068850 |
  LDA #$01                                  ; $068853 |
  STA !s_spr_draw_priority,y                ; $068855 |
  LDA #$2E                                  ; $068858 |
  STA !s_spr_oam_yxppccct,y                 ; $06885A |
  LDA #$40                                  ; $06885D |
  STA !s_spr_y_accel,y                      ; $06885F |
  REP #$20                                  ; $068862 |
  TYA                                       ; $068864 |
  CLC                                       ; $068865 |
  ADC #$0040                                ; $068866 |
  TAY                                       ; $068869 |
  BRA CODE_068879                           ; $06886A |

CODE_06886C:
  LDA #$0217                                ; $06886C |
  JSL spawn_ambient_sprite                  ; $06886F |
  LDA #$FFFF                                ; $068873 |
  STA $7782,y                               ; $068876 |

CODE_068879:
  LDA $00                                   ; $068879 |\
  STA $70A2,y                               ; $06887B | | set slime's location to colliding sprite's
  LDA $02                                   ; $06887E | |
  STA $7142,y                               ; $068880 |/
  SEP #$20                                  ; $068883 |
  LDA #$FF                                  ; $068885 |
  STA $7823,y                               ; $068887 |
  REP #$20                                  ; $06888A |
  LDA $10                                   ; $06888C | rng
  PHA                                       ; $06888E |
  AND #$01FF                                ; $06888F |
  SEC                                       ; $068892 |
  SBC #$0100                                ; $068893 | rand [-256, 256)
  STA $71E0,y                               ; $068896 | -> x velocity
  BMI CODE_0688A1                           ; $068899 |
  LDA #$0002                                ; $06889B | face right if velocity positive
  STA $73C0,y                               ; $06889E |

CODE_0688A1:
  PLA                                       ; $0688A1 |\
  XBA                                       ; $0688A2 | |
  AND #$03FF                                ; $0688A3 | | -rand [0, 1024)
  EOR #$FFFF                                ; $0688A6 | | -> y velocity
  INC A                                     ; $0688A9 | |
  STA $71E2,y                               ; $0688AA |/
  INC $10B8                                 ; $0688AD |
  LDY $1084                                 ; $0688B0 |
  BNE CODE_0688E3                           ; $0688B3 |
  INC $1084                                 ; $0688B5 |
  LDY #$02                                  ; $0688B8 |
  STY $1086                                 ; $0688BA |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0688BD |
  CPY #$02                                  ; $0688BF |
  BNE CODE_0688CF                           ; $0688C1 |
  LDA #$0003                                ; $0688C3 |
  STA $106C                                 ; $0688C6 |
  STZ !s_spr_x_speed_lo,x                   ; $0688C9 |
  STZ !s_spr_x_accel,x                      ; $0688CC |

CODE_0688CF:
  LDA !s_spr_x_speed_lo,x                   ; $0688CF |
  EOR #$FFFF                                ; $0688D2 |
  INC A                                     ; $0688D5 |
  STA !s_spr_x_speed_lo,x                   ; $0688D6 |
  LDA !s_spr_x_accel_ceiling,x              ; $0688D9 |
  EOR #$FFFF                                ; $0688DC |
  INC A                                     ; $0688DF |
  STA !s_spr_x_accel_ceiling,x              ; $0688E0 |

CODE_0688E3:
  LDA $1078                                 ; $0688E3 |
  SEC                                       ; $0688E6 |
  SBC #$0300                                ; $0688E7 |
  CMP #$4C00                                ; $0688EA |
  BCS CODE_0688F2                           ; $0688ED |
  LDA #$4BFF                                ; $0688EF |

CODE_0688F2:
  STA $1078                                 ; $0688F2 |
  LDY #$02                                  ; $0688F5 |
  LDA $04                                   ; $0688F7 |
  CMP #$0040                                ; $0688F9 |
  BPL CODE_068900                           ; $0688FC |
  LDY #$01                                  ; $0688FE |

CODE_068900:
  TYA                                       ; $068900 |
  STA !s_spr_timer_2,x                      ; $068901 |

CODE_068904:
  RTS                                       ; $068904 |

  dw $0080, $FF80                           ; $068905 |

; salvo sub
CODE_068909:
  LDA $601A                                 ; $068909 |
  BEQ CODE_068904                           ; $06890C |
  STZ !s_player_ground_pound_state          ; $06890E |
  BIT #$0001                                ; $068911 |
  BEQ CODE_06891B                           ; $068914 |
  BIT #$000E                                ; $068916 |
  BEQ CODE_068953                           ; $068919 |

CODE_06891B:
  LDY !s_spr_x_player_dir,x                 ; $06891B |
  LDA $8905,y                               ; $06891E |
  SEC                                       ; $068921 |
  SBC !s_spr_x_player_delta,x               ; $068922 |
  CMP #$8000                                ; $068925 |
  ROR A                                     ; $068928 |
  STA $00                                   ; $068929 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06892B |
  CPY #$09                                  ; $06892D |
  BEQ CODE_068953                           ; $06892F |
  CPY #$0A                                  ; $068931 |
  BEQ CODE_068953                           ; $068933 |
  CPY #$0B                                  ; $068935 |
  BEQ CODE_068953                           ; $068937 |
  LDA !s_player_x_speed_prev                ; $068939 |
  PHA                                       ; $06893C |
  CLC                                       ; $06893D |
  ADC #$0400                                ; $06893E |
  CMP #$0800                                ; $068941 |
  BCS CODE_068952                           ; $068944 |
  PLA                                       ; $068946 |
  SEC                                       ; $068947 |
  SBC $00                                   ; $068948 |
  STA !s_player_x_speed_prev                ; $06894A |
  STA !s_player_x_speed                     ; $06894D |
  BRA CODE_068953                           ; $068950 |

CODE_068952:
  PLA                                       ; $068952 |

CODE_068953:
  LDA $601A                                 ; $068953 |
  BIT #$0001                                ; $068956 |
  BEQ CODE_068964                           ; $068959 |
  LDA !s_player_y_speed                     ; $06895B |
  BMI CODE_068964                           ; $06895E |
  LSR A                                     ; $068960 |
  STA !s_player_y_speed                     ; $068961 |

CODE_068964:
  LDY !s_spr_y_player_dir,x                 ; $068964 |
  LDA $8905,y                               ; $068967 |
  SEC                                       ; $06896A |
  SBC !s_spr_y_player_delta,x               ; $06896B |
  STA $00                                   ; $06896E |
  LDA !s_player_y_speed                     ; $068970 |
  PHA                                       ; $068973 |
  CLC                                       ; $068974 |
  ADC #$0200                                ; $068975 |
  CMP #$0400                                ; $068978 |
  BCS CODE_068997                           ; $06897B |
  PLA                                       ; $06897D |
  SEC                                       ; $06897E |
  SBC $00                                   ; $06897F |
  SEC                                       ; $068981 |
  SBC #$0080                                ; $068982 |
  STA !s_player_y_speed                     ; $068985 |
  BPL CODE_068998                           ; $068988 |
  LDA #$0006                                ; $06898A |
  STA !s_player_jump_state                  ; $06898D |
  LDA #$8001                                ; $068990 |
  STA !s_player_flutter_state               ; $068993 |
  RTS                                       ; $068996 |

CODE_068997:
  PLA                                       ; $068997 |

CODE_068998:
  RTS                                       ; $068998 |

; salvo main $00, $04, $06
  TYX                                       ; $068999 |
  JSR CODE_069114                           ; $06899A |
  LDA $1066                                 ; $06899D |
  BEQ CODE_0689AC                           ; $0689A0 |
  BMI CODE_0689A9                           ; $0689A2 |
  DEC $1066                                 ; $0689A4 |
  BRA CODE_0689AC                           ; $0689A7 |

CODE_0689A9:
  INC $1066                                 ; $0689A9 |

CODE_0689AC:
  RTS                                       ; $0689AC |

  dw $0100                                  ; $0689AD |
  dw $FF00                                  ; $0689AF |

; salvo main $01
  TYX                                       ; $0689B1 |
  LDY $1082                                 ; $0689B2 |
  BNE CODE_0689D8                           ; $0689B5 |
  LDA $1086                                 ; $0689B7 |
  BEQ CODE_0689E5                           ; $0689BA |
  LDY $1079                                 ; $0689BC |
  CPY #$4C                                  ; $0689BF |
  BCC CODE_0689D8                           ; $0689C1 |
  BIT #$0001                                ; $0689C3 |
  BNE CODE_0689D9                           ; $0689C6 |
  STZ !s_spr_x_speed_lo,x                   ; $0689C8 |
  STZ !s_spr_x_accel,x                      ; $0689CB |
  LDA #$0002                                ; $0689CE |
  STA $106C                                 ; $0689D1 |
  LDY #$03                                  ; $0689D4 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0689D6 |

CODE_0689D8:
  RTS                                       ; $0689D8 |

CODE_0689D9:
  LDA $1086                                 ; $0689D9 |
  AND #$0002                                ; $0689DC |
  TAY                                       ; $0689DF |
  LDA $89AD,y                               ; $0689E0 |
  BRA CODE_068A1E                           ; $0689E3 |

CODE_0689E5:
  LDA #$00C0                                ; $0689E5 |
  LDY !s_spr_x_player_dir,x                 ; $0689E8 |
  BNE CODE_0689F1                           ; $0689EB |
  EOR #$FFFF                                ; $0689ED |
  INC A                                     ; $0689F0 |

CODE_0689F1:
  STA $00                                   ; $0689F1 |
  LDA !s_spr_x_player_delta,x               ; $0689F3 |
  STA $02                                   ; $0689F6 |
  LDA $7860,x                               ; $0689F8 |
  AND #$000C                                ; $0689FB |
  BEQ CODE_068A10                           ; $0689FE |
  SEC                                       ; $068A00 |
  SBC #$0006                                ; $068A01 |
  EOR $02                                   ; $068A04 |
  BMI CODE_068A10                           ; $068A06 |
  LDA $00                                   ; $068A08 |
  EOR #$FFFF                                ; $068A0A |
  INC A                                     ; $068A0D |
  STA $00                                   ; $068A0E |

CODE_068A10:
  LDA $00                                   ; $068A10 |
  LDY $1084                                 ; $068A12 |
  BEQ CODE_068A1E                           ; $068A15 |
  STZ $1084                                 ; $068A17 |
  EOR #$FFFF                                ; $068A1A |
  INC A                                     ; $068A1D |

CODE_068A1E:
  STA !gsu_r0                               ; $068A1E |
  LDY $1079                                 ; $068A21 |
  TYA                                       ; $068A24 |
  STA $00                                   ; $068A25 |
  LDA #$0200                                ; $068A27 |
  SEC                                       ; $068A2A |
  SBC $00                                   ; $068A2B |
  STA !gsu_r6                               ; $068A2D |
  LDX #$0B                                  ; $068A30 |
  LDA #$86B6                                ; $068A32 |
  JSL r_gsu_init_1                          ; $068A35 | gsu
  LDX $12                                   ; $068A39 |
  LDA !gsu_r0                               ; $068A3B |
  STA !s_spr_x_accel_ceiling,x              ; $068A3E |
  LDY $1086                                 ; $068A41 |
  BEQ CODE_068A4F                           ; $068A44 |
  STZ $1086                                 ; $068A46 |
  LDY #$04                                  ; $068A49 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $068A4B |
  BRA CODE_068A7D                           ; $068A4D |

CODE_068A4F:
  LDA !s_spr_x_player_delta,x               ; $068A4F |
  CLC                                       ; $068A52 |
  ADC #$0080                                ; $068A53 |
  CMP #$0100                                ; $068A56 |
  BCS CODE_068A7B                           ; $068A59 |
  LDA $10                                   ; $068A5B |
  BIT #$0003                                ; $068A5D |
  BEQ CODE_068A7B                           ; $068A60 |
  STZ $106C                                 ; $068A62 |
  STZ $1066                                 ; $068A65 |
  LDA #$0010                                ; $068A68 |
  STA !s_spr_x_accel,x                      ; $068A6B |
  LDA #$0100                                ; $068A6E |
  STA $105C                                 ; $068A71 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $068A74 |
  LDY #$02                                  ; $068A76 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $068A78 |
  RTS                                       ; $068A7A |

CODE_068A7B:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $068A7B |

CODE_068A7D:
  LDA #$0400                                ; $068A7D |
  STA $105C                                 ; $068A80 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $068A83 |
  LDA #$FCE0                                ; $068A85 |
  STA $105E                                 ; $068A88 |
  LDA !s_spr_x_accel_ceiling,x              ; $068A8B |
  STA $10BC                                 ; $068A8E |
  STZ !s_spr_x_accel,x                      ; $068A91 |
  RTS                                       ; $068A94 |

; salvo main $02
  TYX                                       ; $068A95 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $068A96 |
  CMP $105C                                 ; $068A98 |
  BNE CODE_068AA7                           ; $068A9B |
  LDA !s_spr_x_accel_ceiling,x              ; $068A9D |
  BMI CODE_068AAC                           ; $068AA0 |

CODE_068AA2:
  INC $1066                                 ; $068AA2 |
  BRA CODE_068AAF                           ; $068AA5 |

CODE_068AA7:
  LDA !s_spr_x_accel_ceiling,x              ; $068AA7 |
  BMI CODE_068AA2                           ; $068AAA |

CODE_068AAC:
  DEC $1066                                 ; $068AAC |

CODE_068AAF:
  JSR CODE_06914C                           ; $068AAF |
  LDY $1079                                 ; $068AB2 |
  CPY #$4C                                  ; $068AB5 |
  BCC CODE_068AF9                           ; $068AB7 |
  TXA                                       ; $068AB9 |
  STA !gsu_r1                               ; $068ABA |
  LDX #$09                                  ; $068ABD |
  LDA #$8F33                                ; $068ABF |
  JSL r_gsu_init_1                          ; $068AC2 | gsu
  LDX $12                                   ; $068AC6 |
  LDY !gsu_r1                               ; $068AC8 |
  BMI CODE_068AF9                           ; $068ACB |
  LDA !s_spr_x_hitbox_center,y              ; $068ACD |
  SEC                                       ; $068AD0 |
  SBC !s_spr_x_hitbox_center,x              ; $068AD1 |
  STA $00                                   ; $068AD4 |
  CLC                                       ; $068AD6 |
  ADC #$0080                                ; $068AD7 |
  CMP #$0100                                ; $068ADA |
  BCS CODE_068AF9                           ; $068ADD |
  LDA $00                                   ; $068ADF |
  EOR !s_spr_x_speed_lo,y                   ; $068AE1 |
  BPL CODE_068AF9                           ; $068AE4 |
  LDA #$0001                                ; $068AE6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $068AE9 |
  STA $1086                                 ; $068AEB |
  LDA $00                                   ; $068AEE |
  BMI CODE_068AF9                           ; $068AF0 |
  LDA #$0003                                ; $068AF2 |
  STA $1086                                 ; $068AF5 |
  RTS                                       ; $068AF8 |

CODE_068AF9:
  LDA $7860,x                               ; $068AF9 |
  BIT #$000C                                ; $068AFC |
  BEQ CODE_068B07                           ; $068AFF |
  LDA #$0003                                ; $068B01 |
  STA $106C                                 ; $068B04 |

CODE_068B07:
  RTS                                       ; $068B07 |

; salvo main $03
  TYX                                       ; $068B08 |
  LDA $106C                                 ; $068B09 |
  BNE CODE_068B22                           ; $068B0C |
  LDA $1066                                 ; $068B0E |
  BMI CODE_068B17                           ; $068B11 |
  DEC $1066                                 ; $068B13 |
  RTS                                       ; $068B16 |

CODE_068B17:
  LDY #$01                                  ; $068B17 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $068B19 |
  STZ $1066                                 ; $068B1B |
  STZ $1086                                 ; $068B1E |
  RTS                                       ; $068B21 |

CODE_068B22:
  LDA $106C                                 ; $068B22 |
  BIT #$0001                                ; $068B25 |
  BNE CODE_068B3B                           ; $068B28 |
  LDA $1068                                 ; $068B2A |
  CLC                                       ; $068B2D |
  ADC #$0040                                ; $068B2E |
  STA $1068                                 ; $068B31 |
  CMP #$0800                                ; $068B34 |
  BNE CODE_068B4D                           ; $068B37 |
  BRA CODE_068B4A                           ; $068B39 |

CODE_068B3B:
  LDA $1068                                 ; $068B3B |
  SEC                                       ; $068B3E |
  SBC #$0040                                ; $068B3F |
  STA $1068                                 ; $068B42 |
  CMP #$0100                                ; $068B45 |
  BNE CODE_068B4D                           ; $068B48 |

CODE_068B4A:
  DEC $106C                                 ; $068B4A |

CODE_068B4D:
  LDA $1066                                 ; $068B4D |
  CMP #$0008                                ; $068B50 |
  BCS CODE_068B58                           ; $068B53 |
  INC $1066                                 ; $068B55 |

CODE_068B58:
  RTS                                       ; $068B58 |

; salvo main $05
  TYX                                       ; $068B59 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $068B5A |
  LDA !s_spr_y_pixel_pos,x                  ; $068B5D |
  SEC                                       ; $068B60 |
  SBC $7142,y                               ; $068B61 |
  CMP #$004A                                ; $068B64 |
  BMI CODE_068B90                           ; $068B67 |
  CMP #$004E                                ; $068B69 |
  BPL CODE_068B7C                           ; $068B6C |
  LDA #$0018                                ; $068B6E |
  STA !s_spr_y_accel,x                      ; $068B71 |
  LDA #$0080                                ; $068B74 |
  STA !s_spr_y_accel_ceiling,x              ; $068B77 |
  BRA CODE_068B90                           ; $068B7A |

CODE_068B7C:
  STZ $1076                                 ; $068B7C |
  LDA #$000C                                ; $068B7F |
  STA !s_spr_y_accel,x                      ; $068B82 |
  LDA #$0400                                ; $068B85 |
  STA !s_spr_y_accel_ceiling,x              ; $068B88 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $068B8B |
  JSR CODE_0690AA                           ; $068B8D |

CODE_068B90:
  JSR CODE_069114                           ; $068B90 |
  RTS                                       ; $068B93 |

; salvo main $07
  TYX                                       ; $068B94 |
  LDA !s_spr_timer_1,x                      ; $068B95 |
  BNE CODE_068BAC                           ; $068B98 |
  LDA $1078                                 ; $068B9A |
  CLC                                       ; $068B9D |
  ADC #$0240                                ; $068B9E |
  BMI CODE_068BA6                           ; $068BA1 |
  LDA #$FFFF                                ; $068BA3 |

CODE_068BA6:
  STA $1078                                 ; $068BA6 |
  JSR CODE_069114                           ; $068BA9 |

CODE_068BAC:
  RTS                                       ; $068BAC |

; salvo main $08
  TYX                                       ; $068BAD |
  LDA !s_spr_timer_1,x                      ; $068BAE |
  BNE CODE_068BBD                           ; $068BB1 |
  STZ $1082                                 ; $068BB3 |
  STZ !s_player_state                       ; $068BB6 |
  LDY #$01                                  ; $068BB9 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $068BBB |

CODE_068BBD:
  RTS                                       ; $068BBD |

  dw $0100                                  ; $068BBE |
  dw $0200                                  ; $068BC0 |
  dw $0100                                  ; $068BC2 |
  dw $FF00                                  ; $068BC4 |

; salvo main $09
  TYX                                       ; $068BC6 |
  LDY #$00                                  ; $068BC7 |
  LDA !s_spr_x_player_delta,x               ; $068BC9 |
  CLC                                       ; $068BCC |
  ADC #$0050                                ; $068BCD |
  CMP #$00A0                                ; $068BD0 |
  BCS CODE_068BDB                           ; $068BD3 |
  STZ $617A                                 ; $068BD5 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $068BD8 |
  RTS                                       ; $068BDA |

CODE_068BDB:
  BPL CODE_068BDF                           ; $068BDB |
  INY                                       ; $068BDD |
  INY                                       ; $068BDE |

CODE_068BDF:
  LDA $8BBE,y                               ; $068BDF |
  STA $617A                                 ; $068BE2 |
  LDA !s_player_x_speed_prev                ; $068BE5 |
  SEC                                       ; $068BE8 |
  SBC $8BC2,y                               ; $068BE9 |
  EOR $8BC2,y                               ; $068BEC |
  BMI CODE_068BFA                           ; $068BEF |
  LDA $8BC2,y                               ; $068BF1 |
  STA !s_player_x_speed_prev                ; $068BF4 |
  STA !s_player_x_speed                     ; $068BF7 |

CODE_068BFA:
  RTS                                       ; $068BFA |

  dw $0080                                  ; $068BFB |
  dw $0100                                  ; $068BFD |
  dw $0200                                  ; $068BFF |
  dw $0400                                  ; $068C01 |

  dw $FF80                                  ; $068C03 |
  dw $FF00                                  ; $068C05 |
  dw $FE00                                  ; $068C07 |
  dw $FC00                                  ; $068C09 |

; salvo main $0A
  TYX                                       ; $068C0B |
  LDA !s_spr_timer_1,x                      ; $068C0C |
  BNE CODE_068C72                           ; $068C0F |
  LDA #$0002                                ; $068C11 |
  STA !s_spr_timer_1,x                      ; $068C14 |
  LDA $10                                   ; $068C17 |
  AND #$000E                                ; $068C19 |
  TAY                                       ; $068C1C |
  LDA $8BFB,y                               ; $068C1D |
  STA $00                                   ; $068C20 |
  LDA $11                                   ; $068C22 |
  AND #$0006                                ; $068C24 |
  TAY                                       ; $068C27 |
  LDA $8C03,y                               ; $068C28 |
  STA $02                                   ; $068C2B |
  LDA $10                                   ; $068C2D |
  AND #$000F                                ; $068C2F |
  SEC                                       ; $068C32 |
  SBC #$0008                                ; $068C33 |
  STA $04                                   ; $068C36 |
  LDA #$003B                                ; $068C38 |
  JSL push_sound_queue                      ; $068C3B |
  LDA #$0217                                ; $068C3F |
  JSL spawn_ambient_sprite                  ; $068C42 |
  LDA !s_spr_x_pixel_pos,x                  ; $068C46 |
  CLC                                       ; $068C49 |
  ADC $04                                   ; $068C4A |
  STA $70A2,y                               ; $068C4C |
  LDA !s_spr_y_pixel_pos,x                  ; $068C4F |
  SEC                                       ; $068C52 |
  SBC #$0004                                ; $068C53 |
  STA $7142,y                               ; $068C56 |
  LDA #$FFFF                                ; $068C59 |
  STA $7782,y                               ; $068C5C |
  LDA $00                                   ; $068C5F |
  STA $71E0,y                               ; $068C61 |
  LDA $02                                   ; $068C64 |
  STA $71E2,y                               ; $068C66 |
  SEP #$20                                  ; $068C69 |
  LDA #$FF                                  ; $068C6B |
  STA $7823,y                               ; $068C6D |
  REP #$20                                  ; $068C70 |

CODE_068C72:
  LDA $1078                                 ; $068C72 |
  SEC                                       ; $068C75 |
  SBC #$0020                                ; $068C76 |
  STA $1078                                 ; $068C79 |
  CMP #$2000                                ; $068C7C |
  BCS CODE_068C89                           ; $068C7F |
  LDA #$0040                                ; $068C81 |
  STA !s_spr_timer_1,x                      ; $068C84 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $068C87 |

CODE_068C89:
  RTS                                       ; $068C89 |

; salvo main $0B
  TYX                                       ; $068C8A |
  LDA !s_spr_timer_1,x                      ; $068C8B |
  BNE CODE_068C89                           ; $068C8E |
  INC $1088                                 ; $068C90 |
  LDY $1088                                 ; $068C93 |
  CPY #$01                                  ; $068C96 |
  BEQ CODE_068CBF                           ; $068C98 |
  CPY #$02                                  ; $068C9A |
  BEQ CODE_068CA6                           ; $068C9C |
  STZ $7ECC                                 ; $068C9E |
  PLA                                       ; $068CA1 |
  JML $03A32E                               ; $068CA2 |

CODE_068CA6:
  LDA !s_spr_x_pixel_pos,x                  ; $068CA6 |
  STA $00                                   ; $068CA9 |
  LDA !s_spr_y_pixel_pos,x                  ; $068CAB |
  SEC                                       ; $068CAE |
  SBC #$0010                                ; $068CAF |
  STA $02                                   ; $068CB2 |
  JSL $02E1A3                               ; $068CB4 |
  LDA #$00C0                                ; $068CB8 |
  STA !s_spr_timer_1,x                      ; $068CBB |
  RTS                                       ; $068CBE |

CODE_068CBF:
  LDA !s_spr_gsu_morph_2_lo,x               ; $068CBF |
  TAX                                       ; $068CC2 |
  LDA #$01C0                                ; $068CC3 |
  JSL spawn_ambient_sprite                  ; $068CC6 |
  LDA !s_spr_x_pixel_pos,x                  ; $068CCA |
  STA $70A2,y                               ; $068CCD |
  LDA !s_spr_y_pixel_pos,x                  ; $068CD0 |
  STA $7142,y                               ; $068CD3 |
  LDA #$0000                                ; $068CD6 |
  STA $71E0,y                               ; $068CD9 |
  LDA $7000,y                               ; $068CDC |
  AND #$FFFC                                ; $068CDF |
  STA $7000,y                               ; $068CE2 |
  LDA #$FFC0                                ; $068CE5 |
  STA $71E2,y                               ; $068CE8 |
  LDA #$0002                                ; $068CEB |
  STA $7E4C,y                               ; $068CEE |
  LDA #$0006                                ; $068CF1 |
  STA $7782,y                               ; $068CF4 |
  JSL $03A31E                               ; $068CF7 |
  LDA #$001C                                ; $068CFB |
  JSL push_sound_queue                      ; $068CFE |
  LDX #$08                                  ; $068D02 |
  LDA #$D46A                                ; $068D04 |
  JSL r_gsu_init_1                          ; $068D07 | gsu
  REP #$10                                  ; $068D0B |
  JSL $00BE39                               ; $068D0D |

; args to $00BE39
  dw $5040, $727E, $7033, $0348             ; $068D11 |

  SEP #$10                                  ; $068D19 |
  LDX $12                                   ; $068D1B |
  LDA #$0002                                ; $068D1D |
  STA !s_spr_timer_1,x                      ; $068D20 |
  LDY $10B6                                 ; $068D23 |
  BEQ CODE_068D64                           ; $068D26 |
  LDA #$0027                                ; $068D28 |
  JSL spawn_sprite_init                     ; $068D2B |
  LDA !s_spr_gsu_morph_2_lo,x               ; $068D2F |
  TAX                                       ; $068D32 |
  LDA !s_spr_x_pixel_pos,x                  ; $068D33 |
  STA !s_spr_x_pixel_pos,y                  ; $068D36 |
  LDA !s_spr_y_pixel_pos,x                  ; $068D39 |
  STA !s_spr_y_pixel_pos,y                  ; $068D3C |
  LDA #$FB00                                ; $068D3F |
  STA !s_spr_y_speed_lo,y                   ; $068D42 |
  LDA #$0001                                ; $068D45 |
  STA !s_spr_collision_state,y              ; $068D48 |
  LDA $1092                                 ; $068D4B |
  STA !s_spr_wildcard_1_lo,y                ; $068D4E |
  LDA $1094                                 ; $068D51 |
  STA !s_spr_wildcard_2_lo,y                ; $068D54 |
  LDA #$0215                                ; $068D57 |
  STA !r_reg_tm_mirror                      ; $068D5A |
  LDX $12                                   ; $068D5D |
  PLA                                       ; $068D5F |
  JML $03A32E                               ; $068D60 |

CODE_068D64:
  RTS                                       ; $068D64 |

; salvo main $0C
  TYX                                       ; $068D65 |
  LDA !s_spr_timer_1,x                      ; $068D66 |
  BNE CODE_068D7F                           ; $068D69 |
  DEC $105E                                 ; $068D6B |
  BEQ CODE_068D7A                           ; $068D6E |
  LDA #$0008                                ; $068D70 |
  STA !s_spr_timer_1,x                      ; $068D73 |
  JSR CODE_0690D2                           ; $068D76 |
  RTS                                       ; $068D79 |

CODE_068D7A:
  STZ $106E                                 ; $068D7A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $068D7D |

CODE_068D7F:
  RTS                                       ; $068D7F |

; gsu table
  dw $B200                                  ; $068D80 |
  dw $B20A                                  ; $068D82 |
  dw $B30F                                  ; $068D84 |
  dw $B412                                  ; $068D86 |
  dw $B517                                  ; $068D88 |
  dw $B71B                                  ; $068D8A |
  dw $BA21                                  ; $068D8C |
  dw $BF28                                  ; $068D8E |
  dw $C52F                                  ; $068D90 |
  dw $C932                                  ; $068D92 |
  dw $CC33                                  ; $068D94 |
  dw $CF35                                  ; $068D96 |
  dw $D438                                  ; $068D98 |
  dw $D838                                  ; $068D9A |
  dw $DB39                                  ; $068D9C |
  dw $DC3A                                  ; $068D9E |
  dw $E03A                                  ; $068DA0 |
  dw $E13B                                  ; $068DA2 |
  dw $E83B                                  ; $068DA4 |
  dw $EA3A                                  ; $068DA6 |
  dw $EC39                                  ; $068DA8 |
  dw $EF38                                  ; $068DAA |
  dw $F136                                  ; $068DAC |
  dw $F531                                  ; $068DAE |
  dw $F72D                                  ; $068DB0 |
  dw $FA27                                  ; $068DB2 |
  dw $FB25                                  ; $068DB4 |
  dw $FC1F                                  ; $068DB6 |
  dw $FE19                                  ; $068DB8 |
  dw $FF15                                  ; $068DBA |
  dw $FF0E                                  ; $068DBC |
  dw $000E                                  ; $068DBE |
  dw $0000                                  ; $068DC0 |
  dw $00F1                                  ; $068DC2 |
  dw $FFF1                                  ; $068DC4 |
  dw $FFEB                                  ; $068DC6 |
  dw $FEE7                                  ; $068DC8 |
  dw $FCE0                                  ; $068DCA |
  dw $FBDB                                  ; $068DCC |
  dw $FAD9                                  ; $068DCE |
  dw $F7D3                                  ; $068DD0 |
  dw $F5CF                                  ; $068DD2 |
  dw $F1CA                                  ; $068DD4 |
  dw $EFC8                                  ; $068DD6 |
  dw $ECC7                                  ; $068DD8 |
  dw $EAC6                                  ; $068DDA |
  dw $E8C5                                  ; $068DDC |
  dw $E1C5                                  ; $068DDE |
  dw $E0C6                                  ; $068DE0 |
  dw $DCC6                                  ; $068DE2 |
  dw $DBC7                                  ; $068DE4 |
  dw $D8C8                                  ; $068DE6 |
  dw $D4C8                                  ; $068DE8 |
  dw $CFCB                                  ; $068DEA |
  dw $CCCD                                  ; $068DEC |
  dw $C9CE                                  ; $068DEE |
  dw $C5D2                                  ; $068DF0 |
  dw $BFD8                                  ; $068DF2 |
  dw $BADF                                  ; $068DF4 |
  dw $B7E5                                  ; $068DF6 |
  dw $B5E9                                  ; $068DF8 |
  dw $B4EE                                  ; $068DFA |
  dw $B3F1                                  ; $068DFC |
  dw $B2F6                                  ; $068DFE |

; gsu table
  dw $C100                                  ; $068E00 |
  dw $C106                                  ; $068E02 |
  dw $C10C                                  ; $068E04 |
  dw $C112                                  ; $068E06 |
  dw $C118                                  ; $068E08 |
  dw $C11E                                  ; $068E0A |
  dw $C124                                  ; $068E0C |
  dw $C12A                                  ; $068E0E |
  dw $C12F                                  ; $068E10 |
  dw $C52F                                  ; $068E12 |
  dw $C92F                                  ; $068E14 |
  dw $CD2F                                  ; $068E16 |
  dw $D12F                                  ; $068E18 |
  dw $D52F                                  ; $068E1A |
  dw $D92F                                  ; $068E1C |
  dw $DD2F                                  ; $068E1E |
  dw $E12F                                  ; $068E20 |
  dw $E52F                                  ; $068E22 |
  dw $E92F                                  ; $068E24 |
  dw $ED2F                                  ; $068E26 |
  dw $F12F                                  ; $068E28 |
  dw $F52F                                  ; $068E2A |
  dw $F92F                                  ; $068E2C |
  dw $FD2F                                  ; $068E2E |
  dw $002F                                  ; $068E30 |
  dw $002A                                  ; $068E32 |
  dw $0024                                  ; $068E34 |
  dw $001E                                  ; $068E36 |
  dw $0018                                  ; $068E38 |
  dw $0012                                  ; $068E3A |
  dw $000C                                  ; $068E3C |
  dw $0006                                  ; $068E3E |
  dw $0000                                  ; $068E40 |
  dw $00FA                                  ; $068E42 |
  dw $00F4                                  ; $068E44 |
  dw $00EE                                  ; $068E46 |
  dw $00E8                                  ; $068E48 |
  dw $00E2                                  ; $068E4A |
  dw $00DC                                  ; $068E4C |
  dw $00D6                                  ; $068E4E |
  dw $00D0                                  ; $068E50 |
  dw $FDD0                                  ; $068E52 |
  dw $F9D0                                  ; $068E54 |
  dw $F5D0                                  ; $068E56 |
  dw $F1D0                                  ; $068E58 |
  dw $EDD0                                  ; $068E5A |
  dw $E9D0                                  ; $068E5C |
  dw $E5D0                                  ; $068E5E |
  dw $E1D0                                  ; $068E60 |
  dw $DDD0                                  ; $068E62 |
  dw $D9D0                                  ; $068E64 |
  dw $D5D0                                  ; $068E66 |
  dw $D1D0                                  ; $068E68 |
  dw $CDD0                                  ; $068E6A |
  dw $C9D0                                  ; $068E6C |
  dw $C5D0                                  ; $068E6E |
  dw $C1D0                                  ; $068E70 |
  dw $C1D6                                  ; $068E72 |
  dw $C1DC                                  ; $068E74 |
  dw $C1E2                                  ; $068E76 |
  dw $C1E8                                  ; $068E78 |
  dw $C1EE                                  ; $068E7A |
  dw $C1F4                                  ; $068E7C |
  dw $C1FA                                  ; $068E7E |

; salvo main $0D
  TYX                                       ; $068E80 |
  LDA $106E                                 ; $068E81 |
  BEQ CODE_068E89                           ; $068E84 |
  JMP CODE_068F82                           ; $068E86 |

CODE_068E89:
  PHA                                       ; $068E89 |
  LDA #$0000                                ; $068E8A |
  JSL $0681A6                               ; $068E8D |
  LDA $04                                   ; $068E91 |
  LDX #$00                                  ; $068E93 |

CODE_068E95:
  STA $1096,x                               ; $068E95 |
  INX                                       ; $068E98 |
  INX                                       ; $068E99 |
  CPX #$20                                  ; $068E9A |
  BNE CODE_068E95                           ; $068E9C |
  LDA $108E                                 ; $068E9E |
  STA $00                                   ; $068EA1 |
  LDA #$0008                                ; $068EA3 |
  STA $02                                   ; $068EA6 |
  PHB                                       ; $068EA8 |
  SEP #$20                                  ; $068EA9 |
  LDA #$7E                                  ; $068EAB |
  PHA                                       ; $068EAD |
  PLB                                       ; $068EAE |
  REP #$30                                  ; $068EAF |
  LDX #$4800                                ; $068EB1 |
  INX                                       ; $068EB4 |
  INX                                       ; $068EB5 |

CODE_068EB6:
  LDA $00                                   ; $068EB6 |
  STA $0000,x                               ; $068EB8 |
  LDA #$0180                                ; $068EBB |
  STA $0002,x                               ; $068EBE |
  LDA #$0018                                ; $068EC1 |
  STA $0004,x                               ; $068EC4 |
  LDA #$1096                                ; $068EC7 |
  STA $0005,x                               ; $068ECA |
  LDA #$0000                                ; $068ECD |
  STA $0007,x                               ; $068ED0 |
  LDA #$0018                                ; $068ED3 |
  STA $0008,x                               ; $068ED6 |
  TXA                                       ; $068ED9 |
  CLC                                       ; $068EDA |
  ADC #$000C                                ; $068EDB |
  STA $000A,x                               ; $068EDE |
  TAX                                       ; $068EE1 |
  DEC $02                                   ; $068EE2 |
  BEQ CODE_068EF0                           ; $068EE4 |
  LDA $00                                   ; $068EE6 |
  CLC                                       ; $068EE8 |
  ADC #$0020                                ; $068EE9 |
  STA $00                                   ; $068EEC |
  BRA CODE_068EB6                           ; $068EEE |

CODE_068EF0:
  TXA                                       ; $068EF0 |
  STA $4800                                 ; $068EF1 |
  PLB                                       ; $068EF4 |
  LDX $12                                   ; $068EF5 |
  LDA #$0004                                ; $068EF7 |
  STA $0A                                   ; $068EFA |
  LDA $108E                                 ; $068EFC |
  SEC                                       ; $068EFF |
  SBC #$6800                                ; $068F00 |
  STA $00                                   ; $068F03 |
  STA $08                                   ; $068F05 |
  LDA !s_spr_cam_y_pos,x                    ; $068F07 |
  SEC                                       ; $068F0A |
  SBC #$0040                                ; $068F0B |

CODE_068F0E:
  STA $0E                                   ; $068F0E |
  CMP #$0100                                ; $068F10 |
  BCS CODE_068F47                           ; $068F13 |
  LDY #$0006                                ; $068F15 |
  LDX $12                                   ; $068F18 |
  LDA !s_spr_cam_x_pos,x                    ; $068F1A |
  SEC                                       ; $068F1D |
  SBC #$0028                                ; $068F1E |

CODE_068F21:
  STA $0C                                   ; $068F21 |
  CMP #$0130                                ; $068F23 |
  BCS CODE_068F3A                           ; $068F26 |
  LDA $00                                   ; $068F28 |
  BIT #$0400                                ; $068F2A |
  BEQ CODE_068F32                           ; $068F2D |
  EOR #$0420                                ; $068F2F |

CODE_068F32:
  TAX                                       ; $068F32 |
  LDA #$0000                                ; $068F33 |
  STA $70409E,x                             ; $068F36 |

CODE_068F3A:
  LDA $0C                                   ; $068F3A |
  CLC                                       ; $068F3C |
  ADC #$0010                                ; $068F3D |
  INC $00                                   ; $068F40 |
  INC $00                                   ; $068F42 |
  DEY                                       ; $068F44 |
  BNE CODE_068F21                           ; $068F45 |

CODE_068F47:
  LDA $08                                   ; $068F47 |
  CLC                                       ; $068F49 |
  ADC #$0040                                ; $068F4A |
  STA $00                                   ; $068F4D |
  STA $08                                   ; $068F4F |
  LDA $0E                                   ; $068F51 |
  CLC                                       ; $068F53 |
  ADC #$0010                                ; $068F54 |
  DEC $0A                                   ; $068F57 |
  BNE CODE_068F0E                           ; $068F59 |
  LDA #$0004                                ; $068F5B |
  STA $00                                   ; $068F5E |
  LDX $1090                                 ; $068F60 |

CODE_068F63:
  PHX                                       ; $068F63 |
  LDY #$0006                                ; $068F64 |

CODE_068F67:
  LDA #$0000                                ; $068F67 |
  STA $7F8000,x                             ; $068F6A |
  INX                                       ; $068F6E |
  INX                                       ; $068F6F |
  DEY                                       ; $068F70 |
  BNE CODE_068F67                           ; $068F71 |
  PLA                                       ; $068F73 |
  CLC                                       ; $068F74 |
  ADC #$0020                                ; $068F75 |
  TAX                                       ; $068F78 |
  DEC $00                                   ; $068F79 |
  BNE CODE_068F63                           ; $068F7B |
  SEP #$10                                  ; $068F7D |
  LDX $12                                   ; $068F7F |
  PLA                                       ; $068F81 |

CODE_068F82:
  CMP #$0100                                ; $068F82 |
  BMI CODE_068FF0                           ; $068F85 |
  LDA #$0010                                ; $068F87 |
  STA !s_spr_y_accel,x                      ; $068F8A |
  LDA #$0400                                ; $068F8D |
  STA !s_spr_y_accel_ceiling,x              ; $068F90 |
  INC $0CB2                                 ; $068F93 |
  LDA #$00A0                                ; $068F96 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $068F99 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $068F9B |
  STZ !s_spr_wildcard_6_lo,x                ; $068F9E |
  STZ !s_spr_wildcard_2_lo,x                ; $068FA1 |
  LDY #$01                                  ; $068FA4 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $068FA6 |
  STZ $105C                                 ; $068FA8 |
  STZ $105E                                 ; $068FAB |
  STZ $1060                                 ; $068FAE |
  STZ $1064                                 ; $068FB1 |
  STZ $1066                                 ; $068FB4 |
  LDA #$0100                                ; $068FB7 |
  STA $1068                                 ; $068FBA |
  STZ $106C                                 ; $068FBD |
  STZ $1084                                 ; $068FC0 |
  STZ $1086                                 ; $068FC3 |
  LDA #$E000                                ; $068FC6 |
  STA $1078                                 ; $068FC9 |
  STZ $106A                                 ; $068FCC |
  STZ $1062                                 ; $068FCF |
  LDA #$FFFF                                ; $068FD2 |
  STA $108A                                 ; $068FD5 |
  STZ !s_spr_wildcard_1_lo,x                ; $068FD8 |
  STZ $1070                                 ; $068FDB |
  STZ $1082                                 ; $068FDE |
  STZ $1088                                 ; $068FE1 |
  STZ $1076                                 ; $068FE4 |
  STZ $106E                                 ; $068FE7 |
  STZ $1076                                 ; $068FEA |
  JMP CODE_0690AA                           ; $068FED |

CODE_068FF0:
  LDA #$8E00                                ; $068FF0 |
  STA !gsu_r1                               ; $068FF3 |
  LDA #$8D80                                ; $068FF6 |
  STA !gsu_r2                               ; $068FF9 |
  LDA #$0006                                ; $068FFC |
  STA !gsu_r0                               ; $068FFF |
  LDA #$0040                                ; $069002 |
  STA !gsu_r3                               ; $069005 |
  LDA #$0021                                ; $069008 |
  STA !gsu_r4                               ; $06900B |
  LDA #$449E                                ; $06900E |
  STA !gsu_r5                               ; $069011 |
  LDA $106E                                 ; $069014 |
  STA !gsu_r6                               ; $069017 |
  LDA !s_spr_cam_x_pos,x                    ; $06901A |
  CLC                                       ; $06901D |
  ADC #$0008                                ; $06901E |
  STA $6040                                 ; $069021 |
  LDA !s_spr_cam_y_pos,x                    ; $069024 |
  STA $6042                                 ; $069027 |
  LDX #$08                                  ; $06902A |
  LDA #$E93B                                ; $06902C |
  JSL r_gsu_init_1                          ; $06902F |
  JSL $00BE39                               ; $069033 |

; args to $00BE39
  dw $5040, $727E, $7033, $0348             ; $069037 |

  LDA $12                                   ; $06903F |
  STA $6012                                 ; $069041 |
  LDA !s_player_x_cam_rel                   ; $069044 |
  STA $6014                                 ; $069047 |
  LDA !s_player_y_cam_rel                   ; $06904A |
  STA $6016                                 ; $06904D |
  LDA !s_player_duck_state                  ; $069050 |
  STA $6018                                 ; $069053 |
  LDX #$0A                                  ; $069056 |
  LDA #$8390                                ; $069058 |
  JSL r_gsu_init_1                          ; $06905B | gsu
  SEP #$30                                  ; $06905F |
  LDY #$10                                  ; $069061 |
  LDA #$07                                  ; $069063 |
  STY !r_reg_tm_mirror                      ; $069065 |
  STA !r_reg_ts_mirror                      ; $069068 |
  LDA #$02                                  ; $06906B |
  STA !r_reg_cgwsel_mirror                  ; $06906D |
  LDA #$20                                  ; $069070 |
  STA !r_reg_cgadsub_mirror                 ; $069072 |
  LDA #$18                                  ; $069075 |
  TSB !r_reg_hdmaen_mirror                  ; $069077 |
  REP #$20                                  ; $06907A |
  LDX $12                                   ; $06907C |
  LDA #$637D                                ; $06907E |
  STA $702002                               ; $069081 |
  STA $702D6E                               ; $069085 |
  LDA #$4A75                                ; $069089 |
  STA $702004                               ; $06908C |
  STA $702D70                               ; $069090 |
  LDA #$0000                                ; $069094 |
  STA $702006                               ; $069097 |
  STA $702D72                               ; $06909B |
  LDA $106E                                 ; $06909F |
  CLC                                       ; $0690A2 |
  ADC #$0008                                ; $0690A3 |
  STA $106E                                 ; $0690A6 |
  RTS                                       ; $0690A9 |

; salvo sub
CODE_0690AA:
  LDA #$002E                                ; $0690AA |
  JSL spawn_sprite_active                   ; $0690AD |
  BCC CODE_0690D1                           ; $0690B1 |
  TXA                                       ; $0690B3 |
  STA !s_spr_wildcard_4_lo,y                ; $0690B4 |
  TYA                                       ; $0690B7 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0690B8 |
  LDA #$0002                                ; $0690BB |
  STA !s_spr_anim_frame,y                   ; $0690BE |
  LDA !s_spr_x_pixel_pos,x                  ; $0690C1 |
  STA !s_spr_x_pixel_pos,y                  ; $0690C4 |
  LDA !s_spr_y_pixel_pos,x                  ; $0690C7 |
  SEC                                       ; $0690CA |
  SBC #$0038                                ; $0690CB |
  STA !s_spr_y_pixel_pos,y                  ; $0690CE |

CODE_0690D1:
  RTS                                       ; $0690D1 |

; salvo sub
CODE_0690D2:
  REP #$10                                  ; $0690D2 |
  LDX $107C                                 ; $0690D4 |
  LDA $5FA1A8,x                             ; $0690D7 |
  STA $702018                               ; $0690DB |
  STA $702D84                               ; $0690DF |
  LDA $5FA1AA,x                             ; $0690E3 |
  STA $70201A                               ; $0690E7 |
  STA $702D86                               ; $0690EB |
  LDA $5FA1AC,x                             ; $0690EF |
  STA $70201C                               ; $0690F3 |
  STA $702D88                               ; $0690F7 |
  LDA $5FA1AE,x                             ; $0690FB |
  STA $70201E                               ; $0690FF |
  STA $702D8A                               ; $069103 |
  TXA                                       ; $069107 |
  CLC                                       ; $069108 |
  ADC #$0008                                ; $069109 |
  STA $107C                                 ; $06910C |
  SEP #$10                                  ; $06910F |
  LDX $12                                   ; $069111 |
  RTS                                       ; $069113 |

; salvo sub
CODE_069114:
  LDY $1070                                 ; $069114 |
  BEQ CODE_06911E                           ; $069117 |
  LDA #$0002                                ; $069119 |
  BRA CODE_069129                           ; $06911C |

CODE_06911E:
  LDA $7860,x                               ; $06911E |
  AND #$0003                                ; $069121 |
  BEQ CODE_06915A                           ; $069124 |
  AND #$0002                                ; $069126 |

CODE_069129:
  STA !s_spr_wildcard_2_lo,x                ; $069129 |
  LDY $1060                                 ; $06912C |
  BNE CODE_06914C                           ; $06912F |
  INC $1060                                 ; $069131 |
  LDA !s_spr_x_speed_lo,x                   ; $069134 |
  STA $10BC                                 ; $069137 |
  STZ !s_spr_x_speed_lo,x                   ; $06913A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06913D |
  BMI CODE_069146                           ; $069140 |
  EOR #$FFFF                                ; $069142 |
  INC A                                     ; $069145 |

CODE_069146:
  STA !s_spr_gsu_morph_1_lo,x               ; $069146 |
  JSR CODE_069176                           ; $069149 |

CODE_06914C:
  JSR CODE_06919E                           ; $06914C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06914F |
  BPL CODE_06916C                           ; $069152 |
  EOR #$FFFF                                ; $069154 |
  INC A                                     ; $069157 |
  BRA CODE_06916C                           ; $069158 |

CODE_06915A:
  STZ !s_spr_wildcard_2_lo,x                ; $06915A |
  STZ $1060                                 ; $06915D |
  LDA !s_spr_y_speed_lo,x                   ; $069160 |
  STA !s_spr_gsu_morph_1_lo,x               ; $069163 |
  BPL CODE_06916C                           ; $069166 |
  EOR #$FFFF                                ; $069168 |
  INC A                                     ; $06916B |

CODE_06916C:
  LSR A                                     ; $06916C |
  LSR A                                     ; $06916D |
  LSR A                                     ; $06916E |
  CLC                                       ; $06916F |
  ADC #$00A0                                ; $069170 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069173 |
  RTS                                       ; $069175 |

; salvo sub
CODE_069176:
  STA !gsu_r6                               ; $069176 |
  LDA #$FF50                                ; $069179 |
  STA !gsu_r0                               ; $06917C |
  LDX #$0B                                  ; $06917F |
  LDA #$86B6                                ; $069181 |
  JSL r_gsu_init_1                          ; $069184 |
  LDX $12                                   ; $069188 |
  LDA !gsu_r0                               ; $06918A |
  STA $105C                                 ; $06918D |
  STA !s_spr_wildcard_6_lo_dp,x             ; $069190 |
  EOR #$FFFF                                ; $069192 |
  INC A                                     ; $069195 |
  STA $105E                                 ; $069196 |
  RTS                                       ; $069199 |

  dw $00C0                                  ; $06919A |
  dw $FF40                                  ; $06919C |

; salvo sub
CODE_06919E:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06919E |
  CPY #$02                                  ; $0691A0 |
  BEQ CODE_0691AD                           ; $0691A2 |
  CPY #$04                                  ; $0691A4 |
  BNE CODE_0691B2                           ; $0691A6 |
  LDA #$4000                                ; $0691A8 |
  BRA CODE_0691DD                           ; $0691AB |

CODE_0691AD:
  LDA #$0A00                                ; $0691AD |
  BRA CODE_0691DD                           ; $0691B0 |

CODE_0691B2:
  LDA #$D000                                ; $0691B2 |
  LDY $1086                                 ; $0691B5 |
  BEQ CODE_0691BD                           ; $0691B8 |
  LDA #$CC00                                ; $0691BA |

CODE_0691BD:
  STA !gsu_r6                               ; $0691BD |
  LDY $1079                                 ; $0691C0 |
  TYA                                       ; $0691C3 |
  SEC                                       ; $0691C4 |
  SBC #$0100                                ; $0691C5 |
  STA !gsu_r0                               ; $0691C8 |
  LDX #$0B                                  ; $0691CB |
  LDA #$86B6                                ; $0691CD |
  JSL r_gsu_init_1                          ; $0691D0 | gsu
  LDX $12                                   ; $0691D4 |
  LDA !gsu_r0                               ; $0691D6 |
  CLC                                       ; $0691D9 |
  ADC #$2000                                ; $0691DA |

CODE_0691DD:
  STA $00                                   ; $0691DD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0691DF |
  BPL CODE_0691E8                           ; $0691E2 |
  EOR #$FFFF                                ; $0691E4 |
  INC A                                     ; $0691E7 |

CODE_0691E8:
  CLC                                       ; $0691E8 |
  ADC $00                                   ; $0691E9 |
  ASL A                                     ; $0691EB |
  AND #$FF00                                ; $0691EC |
  XBA                                       ; $0691EF |
  STA $0E                                   ; $0691F0 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0691F2 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $0691F4 |
  BMI CODE_069237                           ; $0691F7 |
  CMP $105C                                 ; $0691F9 |
  BEQ CODE_06922E                           ; $0691FC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0691FE |
  CPY #$02                                  ; $069200 |
  BEQ CODE_069218                           ; $069202 |
  LDA $105E                                 ; $069204 |
  BEQ CODE_069213                           ; $069207 |
  SEC                                       ; $069209 |
  ROR A                                     ; $06920A |
  CMP #$FFE0                                ; $06920B |
  BCC CODE_069213                           ; $06920E |
  LDA #$0000                                ; $069210 |

CODE_069213:
  STA $105E                                 ; $069213 |
  BRA CODE_069229                           ; $069216 |

CODE_069218:
  INC $106C                                 ; $069218 |
  LDA $106C                                 ; $06921B |
  CMP #$0004                                ; $06921E |
  BNE CODE_069229                           ; $069221 |
  STZ !s_spr_x_accel,x                      ; $069223 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $069226 |
  RTS                                       ; $069228 |

CODE_069229:
  LDA $105C                                 ; $069229 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06922C |

CODE_06922E:
  LDA !s_spr_gsu_morph_1_lo,x               ; $06922E |
  CLC                                       ; $069231 |
  ADC $0E                                   ; $069232 |
  JMP CODE_0692B3                           ; $069234 |

CODE_069237:
  CMP $105C                                 ; $069237 |
  BEQ CODE_06923F                           ; $06923A |
  JMP CODE_0692AD                           ; $06923C |

CODE_06923F:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06923F |
  CPY #$02                                  ; $069241 |
  BEQ CODE_06925B                           ; $069243 |
  LDA $105C                                 ; $069245 |
  BEQ CODE_06925B                           ; $069248 |
  LSR A                                     ; $06924A |
  CMP #$0020                                ; $06924B |
  BCS CODE_069253                           ; $06924E |
  LDA #$0000                                ; $069250 |

CODE_069253:
  STA $105C                                 ; $069253 |
  LDA #$01D0                                ; $069256 |
  BRA CODE_06925E                           ; $069259 |

CODE_06925B:
  LDA #$0600                                ; $06925B |

CODE_06925E:
  STA $00                                   ; $06925E |
  LDA !s_spr_gsu_morph_1_lo,x               ; $069260 |
  BMI CODE_0692A8                           ; $069263 |
  LDY !s_spr_wildcard_2_lo,x                ; $069265 |
  BNE CODE_069284                           ; $069268 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06926A |
  CPY #$07                                  ; $06926C |
  BEQ CODE_0692A8                           ; $06926E |
  LDY $1082                                 ; $069270 |
  BEQ CODE_06927C                           ; $069273 |
  DEY                                       ; $069275 |
  BNE CODE_06927C                           ; $069276 |
  INC $1082                                 ; $069278 |
  ASL A                                     ; $06927B |

CODE_06927C:
  CMP $00                                   ; $06927C |
  BCC CODE_0692A8                           ; $06927E |
  EOR #$FFFF                                ; $069280 |
  INC A                                     ; $069283 |

CODE_069284:
  STA !s_spr_y_speed_lo,x                   ; $069284 |
  LDA #$0034                                ; $069287 |
  JSL push_sound_queue                      ; $06928A |
  LDA $10BC                                 ; $06928E |
  STA !s_spr_x_speed_lo,x                   ; $069291 |
  STZ $1070                                 ; $069294 |
  LDA #$0010                                ; $069297 |
  STA !s_spr_y_accel,x                      ; $06929A |
  LDY $1082                                 ; $06929D |
  BEQ CODE_0692E4                           ; $0692A0 |
  LDA #$00C0                                ; $0692A2 |
  STA !s_spr_x_speed_lo,x                   ; $0692A5 |

CODE_0692A8:
  LDA $105E                                 ; $0692A8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0692AB |

CODE_0692AD:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0692AD |
  SEC                                       ; $0692B0 |
  SBC $0E                                   ; $0692B1 |

CODE_0692B3:
  STA !s_spr_gsu_morph_1_lo,x               ; $0692B3 |
  LDA $105C                                 ; $0692B6 |
  ORA $105E                                 ; $0692B9 |
  BNE CODE_0692E4                           ; $0692BC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0692BE |
  CPY #$06                                  ; $0692C0 |
  BNE CODE_0692D3                           ; $0692C2 |
  LDA #$FE00                                ; $0692C4 |
  JSR CODE_069176                           ; $0692C7 |
  LDA #$0020                                ; $0692CA |
  STA !s_spr_timer_1,x                      ; $0692CD |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0692D0 |
  RTS                                       ; $0692D2 |

CODE_0692D3:
  CPY #$07                                  ; $0692D3 |
  BNE CODE_0692E0                           ; $0692D5 |
  LDA #$0040                                ; $0692D7 |
  STA !s_spr_timer_1,x                      ; $0692DA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0692DD |
  RTS                                       ; $0692DF |

CODE_0692E0:
  LDY #$01                                  ; $0692E0 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0692E2 |

CODE_0692E4:
  RTS                                       ; $0692E4 |

init_salvo_eyes:
  RTL                                       ; $0692E5 |

main_salvo_eyes:
  JSL $03AF23                               ; $0692E6 |
  JSR CODE_069329                           ; $0692EA |
  LDA !s_spr_timer_1,x                      ; $0692ED |
  BNE CODE_069326                           ; $0692F0 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0692F2 |
  BEQ CODE_06931A                           ; $0692F4 |
  BIT #$0001                                ; $0692F6 |
  BNE CODE_069305                           ; $0692F9 |
  DEC !s_spr_anim_frame,x                   ; $0692FB |
  LDA !s_spr_anim_frame,x                   ; $0692FE |
  BNE CODE_069312                           ; $069301 |
  BRA CODE_069310                           ; $069303 |

CODE_069305:
  INC !s_spr_anim_frame,x                   ; $069305 |
  LDA !s_spr_anim_frame,x                   ; $069308 |
  CMP #$0002                                ; $06930B |
  BNE CODE_069312                           ; $06930E |

CODE_069310:
  DEC !s_spr_wildcard_5_lo_dp,x             ; $069310 |

CODE_069312:
  LDA #$0004                                ; $069312 |
  STA !s_spr_timer_1,x                      ; $069315 |
  BRA CODE_069326                           ; $069318 |

CODE_06931A:
  LDA $10                                   ; $06931A |
  BIT #$001F                                ; $06931C |
  BNE CODE_069326                           ; $06931F |
  LDA #$0004                                ; $069321 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069324 |

CODE_069326:
  INC !s_spr_wildcard_3_lo_dp,x             ; $069326 |
  RTL                                       ; $069328 |

; salvo eyes sub
CODE_069329:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $069329 |
  STA $0E                                   ; $06932B |
  LDA !s_spr_x_player_delta,x               ; $06932D |
  STA !gsu_r1                               ; $069330 |
  LDA !s_spr_y_player_delta,x               ; $069333 |
  STA !gsu_r2                               ; $069336 |
  LDX #$0B                                  ; $069339 |
  LDA #$BCF8                                ; $06933B |
  JSL r_gsu_init_1                          ; $06933E | gsu
  REP #$10                                  ; $069342 |
  LDA !gsu_r1                               ; $069344 |
  JSR CODE_069395                           ; $069347 |
  SEP #$20                                  ; $06934A |
  LDA $0E                                   ; $06934C |
  CMP $02                                   ; $06934E |
  BEQ CODE_06936C                           ; $069350 |
  LDA $0E                                   ; $069352 |
  BMI CODE_069362                           ; $069354 |
  LDA $02                                   ; $069356 |
  BMI CODE_06936A                           ; $069358 |
  CMP $0E                                   ; $06935A |
  BCC CODE_06936A                           ; $06935C |

CODE_06935E:
  INC $0E                                   ; $06935E |
  BRA CODE_06936C                           ; $069360 |

CODE_069362:
  LDA $02                                   ; $069362 |
  BPL CODE_06935E                           ; $069364 |
  CMP $0E                                   ; $069366 |
  BCS CODE_06935E                           ; $069368 |

CODE_06936A:
  DEC $0E                                   ; $06936A |

CODE_06936C:
  LDA $0F                                   ; $06936C |
  CMP $04                                   ; $06936E |
  BEQ CODE_06938E                           ; $069370 |
  LDA $0F                                   ; $069372 |
  BMI CODE_069382                           ; $069374 |
  LDA $04                                   ; $069376 |
  BMI CODE_06938C                           ; $069378 |
  CMP $0F                                   ; $06937A |
  BCC CODE_06938C                           ; $06937C |

CODE_06937E:
  INC $0F                                   ; $06937E |
  BRA CODE_06938E                           ; $069380 |

CODE_069382:
  LDA $04                                   ; $069382 |
  BEQ CODE_06938E                           ; $069384 |
  BPL CODE_06937E                           ; $069386 |
  CMP $0F                                   ; $069388 |
  BCS CODE_06937E                           ; $06938A |

CODE_06938C:
  DEC $0F                                   ; $06938C |

CODE_06938E:
  REP #$20                                  ; $06938E |
  LDA $0E                                   ; $069390 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $069392 |
  RTS                                       ; $069394 |

; salvo eyes sub
CODE_069395:
  REP #$10                                  ; $069395 |
  ASL A                                     ; $069397 |
  TAX                                       ; $069398 |
  PHX                                       ; $069399 |
  LDA $00E954,x                             ; $06939A |
  SEP #$20                                  ; $06939E |
  STA !reg_m7a                              ; $0693A0 |
  XBA                                       ; $0693A3 |
  STA !reg_m7a                              ; $0693A4 |
  LDA #$10                                  ; $0693A7 |
  STA !reg_m7b                              ; $0693A9 |
  LDA !reg_mpym                             ; $0693AC |
  STA $02                                   ; $0693AF |
  BPL CODE_0693B7                           ; $0693B1 |
  LDA #$FF                                  ; $0693B3 |
  BRA CODE_0693B9                           ; $0693B5 |

CODE_0693B7:
  LDA #$00                                  ; $0693B7 |

CODE_0693B9:
  STA $03                                   ; $0693B9 |
  REP #$20                                  ; $0693BB |
  PLX                                       ; $0693BD |
  LDA $00E9D4,x                             ; $0693BE |
  SEP #$20                                  ; $0693C2 |
  STA !reg_m7a                              ; $0693C4 |
  XBA                                       ; $0693C7 |
  STA !reg_m7a                              ; $0693C8 |
  LDA #$10                                  ; $0693CB |
  STA !reg_m7b                              ; $0693CD |
  LDA !reg_mpym                             ; $0693D0 |
  STA $04                                   ; $0693D3 |
  BPL CODE_0693DB                           ; $0693D5 |
  LDA #$FF                                  ; $0693D7 |
  BRA CODE_0693DD                           ; $0693D9 |

CODE_0693DB:
  LDA #$00                                  ; $0693DB |

CODE_0693DD:
  STA $05                                   ; $0693DD |
  REP #$20                                  ; $0693DF |
  SEP #$10                                  ; $0693E1 |
  LDX $12                                   ; $0693E3 |
  RTS                                       ; $0693E5 |

init_lemon_drop:
  LDY #$05                                  ; $0693E6 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0693E8 |
  RTL                                       ; $0693EA |

  dw $94F0                                  ; $0693EB |
  dw $9531                                  ; $0693ED |
  dw $9587                                  ; $0693EF |
  dw $95BC                                  ; $0693F1 |
  dw $9625                                  ; $0693F3 |
  dw $966D                                  ; $0693F5 |
  dw $94F0                                  ; $0693F7 |
  dw $9531                                  ; $0693F9 |
  dw $96C0                                  ; $0693FB |
  dw $9703                                  ; $0693FD |
  dw $974F                                  ; $0693FF |

main_lemon_drop:
  LDA !s_spr_state,x                        ; $069401 |
  CMP #$0010                                ; $069404 |
  BEQ CODE_06941D                           ; $069407 |

CODE_069409:
  LDA !s_player_state                       ; $069409 |
  CMP #$0002                                ; $06940C |
  BNE CODE_06943E                           ; $06940F |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $069411 |
  BNE CODE_06943E                           ; $069413 |
  LDA #$0000                                ; $069415 |
  STA !s_player_state                       ; $069418 |
  BRA CODE_06943E                           ; $06941B |

CODE_06941D:
  LDA !s_spr_timer_frozen,x                 ; $06941D |
  BEQ CODE_069427                           ; $069420 |
  STZ !s_spr_bitwise_settings_3,x           ; $069422 |
  BRA CODE_069409                           ; $069425 |

CODE_069427:
  LDY !s_spr_collision_state,x              ; $069427 |
  BEQ CODE_06943E                           ; $06942A |
  LDA #$0002                                ; $06942C |
  STA !s_spr_draw_priority,x                ; $06942F |
  STZ !s_spr_anim_frame,x                   ; $069432 |
  LDA #$FFFF                                ; $069435 |
  STA !s_spr_wildcard_1_lo,x                ; $069438 |
  STA !s_spr_wildcard_2_lo,x                ; $06943B |

CODE_06943E:
  JSL $03AF23                               ; $06943E |
  TXY                                       ; $069442 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069443 |
  ASL A                                     ; $069445 |
  TAX                                       ; $069446 |
  JSR ($93EB,x)                             ; $069447 |
  JSR CODE_06945F                           ; $06944A |
  LDA !s_spr_timer_3,x                      ; $06944D |
  BNE CODE_06945B                           ; $069450 |
  LDA !s_spr_bitwise_settings_1,x           ; $069452 |
  ORA #$0600                                ; $069455 |
  STA !s_spr_bitwise_settings_1,x           ; $069458 |

CODE_06945B:
  JML $0DC0F0                               ; $06945B |

CODE_06945F:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06945F |
  BNE CODE_069486                           ; $069461 |
  LDY !s_spr_collision_id,x                 ; $069463 |
  BPL CODE_0694E3                           ; $069466 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $069468 |
  CPY #$03                                  ; $06946A |
  BEQ CODE_0694E7                           ; $06946C |
  CPY #$04                                  ; $06946E |
  BEQ CODE_0694E7                           ; $069470 |
  LDA !s_spr_y_player_delta,x               ; $069472 |
  SEC                                       ; $069475 |
  SBC !s_player_hitbox_half_height          ; $069476 |
  SEC                                       ; $069479 |
  SBC !s_spr_hitbox_height,x                ; $06947A |
  CMP #$FFF8                                ; $06947D |
  BCS CODE_069487                           ; $069480 |

CODE_069482:
  JSL player_hit_sprite                     ; $069482 |

CODE_069486:
  RTS                                       ; $069486 |

CODE_069487:
  LDY $60AB                                 ; $069487 |
  BMI CODE_0694E7                           ; $06948A |
  LDY !s_player_jump_state                  ; $06948C |
  BEQ CODE_069482                           ; $06948F |
  LDA $7860,x                               ; $069491 |
  AND #$0001                                ; $069494 |
  BEQ CODE_0694E7                           ; $069497 |
  LDA #$0020                                ; $069499 |
  CMP !s_player_invincibility_timer         ; $06949C |
  BMI CODE_0694A4                           ; $06949F |
  STA !s_player_invincibility_timer         ; $0694A1 |

CODE_0694A4:
  LDA $6086                                 ; $0694A4 |
  AND !r_joy1_lo_mirror                     ; $0694A7 |
  STA $617A                                 ; $0694AA |
  LDA !r_joy1_lo_press_mirror               ; $0694AD |
  AND $6086                                 ; $0694B0 |
  STA $617C                                 ; $0694B3 |
  STZ !s_player_ground_pound_state          ; $0694B6 |
  LDA #$0002                                ; $0694B9 |
  STA !s_player_state                       ; $0694BC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0694BF |
  LDA #$7C60                                ; $0694C1 |
  STA !s_spr_bitwise_settings_1,x           ; $0694C4 |
  STZ !s_player_x_speed_prev                ; $0694C7 |
  STZ !s_player_x_speed                     ; $0694CA |
  STZ !s_player_y_speed                     ; $0694CD |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0694D0 |
  STZ !s_spr_x_speed_lo,x                   ; $0694D2 |
  LDA #$0004                                ; $0694D5 |
  STA !s_spr_timer_2,x                      ; $0694D8 |
  STA !s_spr_anim_frame,x                   ; $0694DB |
  LDY #$03                                  ; $0694DE |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0694E0 |
  RTS                                       ; $0694E2 |

CODE_0694E3:
  JSL $03A5B7                               ; $0694E3 |

CODE_0694E7:
  RTS                                       ; $0694E7 |

  db $08, $09, $00, $01                     ; $0694E8 |

  db $10, $06, $05, $04                     ; $0694EC |

  TYX                                       ; $0694F0 |
  LDA !s_spr_timer_2,x                      ; $0694F1 |
  BNE CODE_06951E                           ; $0694F4 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0694F6 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0694F8 |
  CPY #$05                                  ; $0694FA |
  BNE CODE_06950C                           ; $0694FC |
  LDA #$0040                                ; $0694FE |
  STA !s_spr_y_accel,x                      ; $069501 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $069504 |
  STZ !s_spr_anim_frame,x                   ; $069506 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $069509 |
  RTS                                       ; $06950B |

CODE_06950C:
  LDA $94E7,y                               ; $06950C |
  AND #$00FF                                ; $06950F |
  STA !s_spr_anim_frame,x                   ; $069512 |
  LDA $94EB,y                               ; $069515 |
  AND #$00FF                                ; $069518 |
  STA !s_spr_timer_2,x                      ; $06951B |

CODE_06951E:
  RTS                                       ; $06951E |

  db $01, $04, $05, $06, $01, $00, $02, $00 ; $06951F |
  db $01                                    ; $069527 |

  db $02, $02, $02, $02, $02, $02, $04, $02 ; $069528 |
  db $30                                    ; $069530 |

  TYX                                       ; $069531 |
  LDA $7860,x                               ; $069532 |
  AND #$0001                                ; $069535 |
  BEQ CODE_069582                           ; $069538 |
  LDA !s_spr_timer_2,x                      ; $06953A |
  BNE CODE_069582                           ; $06953D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $06953F |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $069541 |
  LDA $951E,y                               ; $069543 |
  AND #$00FF                                ; $069546 |
  STA !s_spr_anim_frame,x                   ; $069549 |
  LDA $9527,y                               ; $06954C |
  AND #$00FF                                ; $06954F |
  STA !s_spr_timer_2,x                      ; $069552 |
  CPY #$02                                  ; $069555 |
  BNE CODE_069561                           ; $069557 |
  LDA #$0060                                ; $069559 |\ play sound #$0060
  JSL push_sound_queue                      ; $06955C |/
  RTS                                       ; $069560 |

CODE_069561:
  CPY #$09                                  ; $069561 |
  BMI CODE_069582                           ; $069563 |
  LDA !s_spr_timer_2,x                      ; $069565 |
  STA !s_spr_timer_1,x                      ; $069568 |
  LDY !s_spr_x_player_dir,x                 ; $06956B |
  TYA                                       ; $06956E |
  STA !s_spr_facing_dir,x                   ; $06956F |
  INC !s_spr_wildcard_5_lo_dp,x             ; $069572 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $069574 |
  CPY #$08                                  ; $069576 |
  BNE CODE_069582                           ; $069578 |
  LDA #$0007                                ; $06957A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06957D |
  INC $1015                                 ; $06957F |

CODE_069582:
  RTS                                       ; $069582 |

  dw $FFC0, $0040                           ; $069583 |

  TYX                                       ; $069587 |
  LDA !s_spr_timer_1,x                      ; $069588 |
  BNE CODE_0695B5                           ; $06958B |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $06958D |
  LDA $7860,x                               ; $06958F |
  AND #$0001                                ; $069592 |
  BEQ CODE_0695B5                           ; $069595 |
  LDY !s_spr_facing_dir,x                   ; $069597 |
  LDA $9583,y                               ; $06959A |
  STA !s_spr_x_speed_lo,x                   ; $06959D |
  LDA !s_spr_timer_2,x                      ; $0695A0 |
  BNE CODE_0695B5                           ; $0695A3 |
  LDA #$0004                                ; $0695A5 |
  STA !s_spr_timer_2,x                      ; $0695A8 |
  LDA !s_spr_anim_frame,x                   ; $0695AB |
  INC A                                     ; $0695AE |
  AND #$0003                                ; $0695AF |
  STA !s_spr_anim_frame,x                   ; $0695B2 |

CODE_0695B5:
  RTS                                       ; $0695B5 |

  dw $001A, $0018, $0014                    ; $0695B6 |

  TYX                                       ; $0695BC |
  LDA !s_spr_timer_2,x                      ; $0695BD |
  BNE CODE_069606                           ; $0695C0 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0695C2 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0695C4 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0695C6 |
  CPY #$06                                  ; $0695C8 |
  BMI CODE_0695FD                           ; $0695CA |
  LDA #$0003                                ; $0695CC |
  STA !s_spr_timer_1,x                      ; $0695CF |
  LDA #$01D2                                ; $0695D2 |
  JSL spawn_ambient_sprite                  ; $0695D5 |
  LDA !s_spr_x_hitbox_center,x              ; $0695D9 |
  STA $70A2,y                               ; $0695DC |
  LDA !s_spr_y_hitbox_center,x              ; $0695DF |
  STA $7142,y                               ; $0695E2 |
  LDA #$0005                                ; $0695E5 |
  STA $73C2,y                               ; $0695E8 |
  LDA #$0002                                ; $0695EB |
  STA $7782,y                               ; $0695EE |
  SEP #$20                                  ; $0695F1 |
  LDA #$FF                                  ; $0695F3 |
  STA $7823,y                               ; $0695F5 |
  REP #$20                                  ; $0695F8 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0695FA |
  RTS                                       ; $0695FC |

CODE_0695FD:
  LDA #$0004                                ; $0695FD |
  STA !s_spr_timer_2,x                      ; $069600 |
  INC !s_spr_anim_frame,x                   ; $069603 |

CODE_069606:
  LDA !s_player_tile_collision              ; $069606 |
  AND #$0007                                ; $069609 |
  BNE CODE_069624                           ; $06960C |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06960E |
  LDA !s_spr_y_pixel_pos,x                  ; $069610 |
  SEC                                       ; $069613 |
  SBC $95B6,y                               ; $069614 |
  SEC                                       ; $069617 |
  SBC !s_car_wheel_ext_height               ; $069618 |
  STA !s_player_y                           ; $06961B |
  STZ !s_player_y_speed                     ; $06961E |
  INC !s_on_sprite_platform_flag            ; $069621 |

CODE_069624:
  RTS                                       ; $069624 |

  TYX                                       ; $069625 |
  LDA !s_spr_timer_1,x                      ; $069626 |
  BNE CODE_069643                           ; $069629 |
  LDA #$003B                                ; $06962B |\ play sound #$003B
  JSL push_sound_queue                      ; $06962E |/
  LDA #$0000                                ; $069632 |
  STA !s_player_state                       ; $069635 |
  STZ $617A                                 ; $069638 |
  STZ $617C                                 ; $06963B |
  PLA                                       ; $06963E |
  JML $03A32E                               ; $06963F |

CODE_069643:
  LDA !s_spr_x_hitbox_center,x              ; $069643 |
  STA !gsu_r1                               ; $069646 |
  LDA !s_spr_y_hitbox_center,x              ; $069649 |
  STA !gsu_r2                               ; $06964C |
  LDA #$0040                                ; $06964F |
  STA !gsu_r10                              ; $069652 |
  LDA #$0200                                ; $069655 |
  STA $6000                                 ; $069658 |
  LDA #$FE00                                ; $06965B |
  STA $6002                                 ; $06965E |
  LDX #$09                                  ; $069661 |
  LDA #$9253                                ; $069663 |
  JSL r_gsu_init_1                          ; $069666 | GSU init
  LDX $12                                   ; $06966A |
  RTS                                       ; $06966C |

  TYX                                       ; $06966D |
  LDA !s_spr_wildcard_1_lo,x                ; $06966E |
  CMP !s_spr_wildcard_2_lo,x                ; $069671 |
  BNE CODE_069691                           ; $069674 |
  INC A                                     ; $069676 |
  BNE CODE_069691                           ; $069677 |
  INC A                                     ; $069679 |
  STA !s_spr_anim_frame,x                   ; $06967A |
  INC A                                     ; $06967D |
  STA !s_spr_draw_priority,x                ; $06967E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069681 |
  LDA #$0030                                ; $069683 |
  STA !s_spr_timer_1,x                      ; $069686 |
  LDY !s_spr_x_player_dir,x                 ; $069689 |
  TYA                                       ; $06968C |
  STA !s_spr_facing_dir,x                   ; $06968D |
  RTS                                       ; $069690 |

CODE_069691:
  LDA !s_spr_x_player_delta,x               ; $069691 |
  CLC                                       ; $069694 |
  ADC #$0030                                ; $069695 |
  CMP #$0060                                ; $069698 |
  BCS CODE_0696B8                           ; $06969B |
  LDA #$FFFF                                ; $06969D |
  STA !s_spr_wildcard_1_lo,x                ; $0696A0 |
  STA !s_spr_wildcard_2_lo,x                ; $0696A3 |
  LDA #$0007                                ; $0696A6 |
  STA !s_spr_anim_frame,x                   ; $0696A9 |
  INC A                                     ; $0696AC |
  STA !s_spr_timer_2,x                      ; $0696AD |
  LDA #$0002                                ; $0696B0 |
  STA !s_spr_draw_priority,x                ; $0696B3 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0696B6 |

CODE_0696B8:
  RTS                                       ; $0696B8 |

  db $04, $05, $06, $05, $04, $00, $02      ; $0696B9 |

  TYX                                       ; $0696C0 |
  LDA $1015                                 ; $0696C1 |
  BPL CODE_0696FE                           ; $0696C4 |
  LDA !s_spr_timer_2,x                      ; $0696C6 |
  BNE CODE_0696FE                           ; $0696C9 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0696CB |
  BPL CODE_0696ED                           ; $0696CD |
  LDA #$0002                                ; $0696CF |
  STA !s_spr_anim_frame,x                   ; $0696D2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0696D5 |
  LDA #$FA00                                ; $0696D7 |
  STA !s_spr_y_speed_lo,x                   ; $0696DA |
  STZ !s_spr_y_accel,x                      ; $0696DD |
  STZ $7860,x                               ; $0696E0 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0696E3 |
  LDA #$0013                                ; $0696E5 |\ play sound #$0013
  JSL push_sound_queue                      ; $0696E8 |/
  RTS                                       ; $0696EC |

CODE_0696ED:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0696ED |
  LDA $96B9,y                               ; $0696EF |
  AND #$00FF                                ; $0696F2 |
  STA !s_spr_anim_frame,x                   ; $0696F5 |
  LDA #$0002                                ; $0696F8 |
  STA !s_spr_timer_2,x                      ; $0696FB |

CODE_0696FE:
  RTS                                       ; $0696FE |

  db $07, $08                               ; $0696FF |

  db $08, $10                               ; $069701 |

  TYX                                       ; $069703 |
  LDA !s_spr_y_speed_lo,x                   ; $069704 |
  BEQ CODE_069722                           ; $069707 |
  LDA $7860,x                               ; $069709 |
  AND #$0002                                ; $06970C |
  BEQ CODE_06974E                           ; $06970F |
  LDA !s_spr_y_pixel_pos,x                  ; $069711 |
  CLC                                       ; $069714 |
  ADC #$0008                                ; $069715 |
  AND #$FFF0                                ; $069718 |
  STA !s_spr_y_pixel_pos,x                  ; $06971B |
  STZ !s_spr_y_speed_lo,x                   ; $06971E |
  RTS                                       ; $069721 |

CODE_069722:
  LDA !s_spr_timer_2,x                      ; $069722 |
  BNE CODE_06974E                           ; $069725 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $069727 |
  BPL CODE_06973A                           ; $069729 |
  LDA #$0020                                ; $06972B |
  STA !s_spr_timer_1,x                      ; $06972E |
  LDA #$00FF                                ; $069731 |
  STA !s_spr_draw_priority,x                ; $069734 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $069737 |
  RTS                                       ; $069739 |

CODE_06973A:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06973A |
  LDA $96FF,y                               ; $06973C |
  AND #$00FF                                ; $06973F |
  STA !s_spr_anim_frame,x                   ; $069742 |
  LDA $9701,y                               ; $069745 |
  AND #$00FF                                ; $069748 |
  STA !s_spr_timer_2,x                      ; $06974B |

CODE_06974E:
  RTS                                       ; $06974E |

  TYX                                       ; $06974F |
  LDA !s_spr_timer_1,x                      ; $069750 |
  BNE CODE_06975F                           ; $069753 |
  STZ $1015                                 ; $069755 |
  INC $105A                                 ; $069758 |
  JSL $03A31E                               ; $06975B |

CODE_06975F:
  RTS                                       ; $06975F |

init_burt:
  JSL $03AEEB                               ; $069760 |
  LDY #$24                                  ; $069764 |
  JSL $0CE5D6                               ; $069766 |
  LDA #$0080                                ; $06976A |
  STA !s_cam_x_right_boundary               ; $06976D |
  LDA !s_spr_y_pixel_pos,x                  ; $069770 |
  CLC                                       ; $069773 |
  ADC #$000F                                ; $069774 |
  STA !s_spr_y_pixel_pos,x                  ; $069777 |
  LDA #$FFF8                                ; $06977A |
  STA !s_spr_gsu_morph_2_lo,x               ; $06977D |
  LDA #$0100                                ; $069780 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069783 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069785 |
  LDA !s_spr_bitwise_settings_3,x           ; $069787 |
  ORA #$0001                                ; $06978A |
  STA !s_spr_bitwise_settings_3,x           ; $06978D |
  LDA #$0200                                ; $069790 |
  STA !s_spr_timer_2,x                      ; $069793 |
  LDA #$FFF4                                ; $069796 |
  STA !s_spr_y_terrain_offset,x             ; $069799 |
  LDA #$0010                                ; $06979C |
  STA $1066                                 ; $06979F |
  LDA #$0010                                ; $0697A2 |
  STA $1064                                 ; $0697A5 |
  LDA #$0040                                ; $0697A8 |
  STA !s_spr_y_accel,x                      ; $0697AB |
  SEP #$20                                  ; $0697AE |
  LDA #$04                                  ; $0697B0 |
  STA !s_spr_gsu_morph_1_hi,x               ; $0697B2 |
  LDA #$40                                  ; $0697B5 |
  STA !s_spr_wildcard_1_lo,x                ; $0697B7 |
  LDA #$0A                                  ; $0697BA |
  STA !s_spr_wildcard_2_lo,x                ; $0697BC |
  LDA #$01                                  ; $0697BF |
  STA !s_spr_wildcard_2_hi,x                ; $0697C1 |
  REP #$20                                  ; $0697C4 |
  LDA !s_spr_anim_frame,x                   ; $0697C6 |
  ASL A                                     ; $0697C9 |
  TAY                                       ; $0697CA |
  LDA $A421,y                               ; $0697CB |
  STA !gsu_r6                               ; $0697CE |
  LDA #$0100                                ; $0697D1 |
  STA !gsu_r11                              ; $0697D4 |
  LDA #$001C                                ; $0697D7 |
  STA !gsu_r8                               ; $0697DA |
  LDA #$0010                                ; $0697DD |
  STA !gsu_r9                               ; $0697E0 |
  LDA #$0020                                ; $0697E3 |
  STA !gsu_r3                               ; $0697E6 |
  LDA #$0000                                ; $0697E9 |
  STA !gsu_r2                               ; $0697EC |
  LDA #$6000                                ; $0697EF |
  STA !gsu_r12                              ; $0697F2 |
  LDA #$0056                                ; $0697F5 |
  STA !gsu_r13                              ; $0697F8 |
  LDX #$08                                  ; $0697FB |
  LDA #$8295                                ; $0697FD |
  JSL r_gsu_init_1                          ; $069800 |  GSU init
  LDX $12                                   ; $069804 |
  REP #$10                                  ; $069806 |
  LDA #$0008                                ; $069808 |
  STA !gsu_r8                               ; $06980B |
  LDA #$000F                                ; $06980E |
  STA !gsu_r9                               ; $069811 |
  LDA #$0040                                ; $069814 |
  STA !gsu_r3                               ; $069817 |
  LDA #$0000                                ; $06981A |
  STA !gsu_r2                               ; $06981D |
  LDA #$0100                                ; $069820 |
  STA !gsu_r6                               ; $069823 |
  LDA #$0100                                ; $069826 |
  STA !gsu_r11                              ; $069829 |
  LDA #$6020                                ; $06982C |
  STA !gsu_r12                              ; $06982F |
  LDA #$0056                                ; $069832 |
  STA !gsu_r13                              ; $069835 |
  SEP #$10                                  ; $069838 |
  LDX #$08                                  ; $06983A |
  LDA #$861B                                ; $06983C |
  JSL r_gsu_init_1                          ; $06983F |  GSU init
  LDX $12                                   ; $069843 |
  REP #$10                                  ; $069845 |
  LDA #$0001                                ; $069847 |
  STA !gsu_r8                               ; $06984A |
  LDA #$000E                                ; $06984D |
  STA !gsu_r9                               ; $069850 |
  LDA #$0040                                ; $069853 |
  STA !gsu_r3                               ; $069856 |
  LDA #$0010                                ; $069859 |
  STA !gsu_r2                               ; $06985C |
  LDA #$0100                                ; $06985F |
  STA !gsu_r6                               ; $069862 |
  LDA #$0100                                ; $069865 |
  STA !gsu_r11                              ; $069868 |
  LDA #$6030                                ; $06986B |
  STA !gsu_r12                              ; $06986E |
  LDA #$0056                                ; $069871 |
  STA !gsu_r13                              ; $069874 |
  SEP #$10                                  ; $069877 |
  LDX #$08                                  ; $069879 |
  LDA #$861B                                ; $06987B |
  JSL r_gsu_init_1                          ; $06987E |  GSU init
  LDX $12                                   ; $069882 |
  LDA !s_spr_anim_frame,x                   ; $069884 |
  ASL A                                     ; $069887 |
  ASL A                                     ; $069888 |
  TAY                                       ; $069889 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06988A |
  STA !gsu_r0                               ; $06988C |
  LDA $A409,y                               ; $06988F |
  STA !gsu_r6                               ; $069892 |
  PHX                                       ; $069895 |
  PHY                                       ; $069896 |
  LDX #$0B                                  ; $069897 |
  LDA #$86B6                                ; $069899 |
  JSL r_gsu_init_1                          ; $06989C |  GSU init
  PLY                                       ; $0698A0 |
  PLX                                       ; $0698A1 |
  LDA !s_spr_wildcard_5_lo,x                ; $0698A2 |
  CMP !gsu_r0                               ; $0698A5 |
  BPL CODE_0698BB                           ; $0698A8 |
  LDA $A40B,y                               ; $0698AA |
  BEQ CODE_0698BE                           ; $0698AD |
  LDA $A40B,y                               ; $0698AF |
  EOR #$FFFF                                ; $0698B2 |
  INC A                                     ; $0698B5 |
  AND #$00FF                                ; $0698B6 |
  BRA CODE_0698BE                           ; $0698B9 |

CODE_0698BB:
  LDA $A40B,y                               ; $0698BB |

CODE_0698BE:
  STA !gsu_r5                               ; $0698BE |
  LDA !gsu_r0                               ; $0698C1 |
  STA !gsu_r6                               ; $0698C4 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0698C7 |
  STA !gsu_r11                              ; $0698C9 |
  LDA #$0060                                ; $0698CC |
  STA !gsu_r3                               ; $0698CF |
  LDA #$0000                                ; $0698D2 |
  STA !gsu_r2                               ; $0698D5 |
  LDA #$6040                                ; $0698D8 |
  STA !gsu_r12                              ; $0698DB |
  LDA #$0056                                ; $0698DE |
  STA !gsu_r13                              ; $0698E1 |
  LDX #$08                                  ; $0698E4 |
  LDA #$84A5                                ; $0698E6 |
  JSL r_gsu_init_1                          ; $0698E9 |  GSU init
  LDX $12                                   ; $0698ED |
  LDA !s_spr_anim_frame,x                   ; $0698EF |
  ASL A                                     ; $0698F2 |
  TAY                                       ; $0698F3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0698F4 |
  STA !gsu_r0                               ; $0698F6 |
  LDA $A419,y                               ; $0698F9 |
  STA !gsu_r6                               ; $0698FC |
  PHX                                       ; $0698FF |
  PHY                                       ; $069900 |
  LDX #$0B                                  ; $069901 |
  LDA #$86B6                                ; $069903 |
  JSL r_gsu_init_1                          ; $069906 |  GSU init
  PLY                                       ; $06990A |
  PLX                                       ; $06990B |
  LDA !gsu_r0                               ; $06990C |
  STA !gsu_r6                               ; $06990F |
  STA $00                                   ; $069912 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069914 |
  STA !gsu_r11                              ; $069916 |
  LDA #$000F                                ; $069919 |
  STA !gsu_r8                               ; $06991C |
  LDA #$000F                                ; $06991F |
  STA !gsu_r9                               ; $069922 |
  LDA #$0050                                ; $069925 |
  STA !gsu_r3                               ; $069928 |
  LDA #$0000                                ; $06992B |
  STA !gsu_r2                               ; $06992E |
  LDA #$7030                                ; $069931 |
  STA !gsu_r12                              ; $069934 |
  LDA #$0056                                ; $069937 |
  STA !gsu_r13                              ; $06993A |
  LDX #$08                                  ; $06993D |
  LDA #$861B                                ; $06993F |
  JSL r_gsu_init_1                          ; $069942 |  GSU init
  LDX $12                                   ; $069946 |
  LDA $00                                   ; $069948 |
  STA !gsu_r6                               ; $06994A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06994D |
  STA !gsu_r11                              ; $06994F |
  LDA #$000F                                ; $069952 |
  STA !gsu_r8                               ; $069955 |
  LDA #$0000                                ; $069958 |
  STA !gsu_r9                               ; $06995B |
  LDA #$0050                                ; $06995E |
  STA !gsu_r3                               ; $069961 |
  LDA #$0010                                ; $069964 |
  STA !gsu_r2                               ; $069967 |
  LDA #$7020                                ; $06996A |
  STA !gsu_r12                              ; $06996D |
  LDA #$0056                                ; $069970 |
  STA !gsu_r13                              ; $069973 |
  LDX #$08                                  ; $069976 |
  LDA #$861B                                ; $069978 |
  JSL r_gsu_init_1                          ; $06997B |  GSU init
  INC $0CF9                                 ; $06997F |
  LDX $12                                   ; $069982 |
  JSR CODE_06A740                           ; $069984 |
  RTL                                       ; $069987 |

  dw $A429, $A5A6, $A740                    ; $069988 |

  dw $A36F, $A36F, $A3EF                    ; $06998E |

  dw $00E0, $00D0, $00C0, $00C0             ; $069994 |
  dw $00C0, $00C0                           ; $06999C |

  dw $FA00, $FA40, $FA80, $FAC0             ; $0699A0 |
  dw $FB00, $FB40, $F600, $F680             ; $0699A8 |
  dw $F700, $F780, $F800, $F880             ; $0699B0 |

  dw $E7A6, $E640, $E640, $E640             ; $0699B8 |
  dw $E640, $E640, $E7DA, $A5D8             ; $0699C0 |
  dw $A5D8, $A5D8, $A5D8, $A5D8             ; $0699C8 |
  dw $E7FA, $A5F6, $A5F6, $A5F6             ; $0699D0 |
  dw $A5F6, $A5F6                           ; $0699D8 |

main_burt:
  LDY !s_spr_gsu_morph_1_hi,x               ; $0699DC |
  TYX                                       ; $0699DF |
  JSR ($998E,x)                             ; $0699E0 |
  LDY !s_spr_gsu_morph_1_hi,x               ; $0699E3 |
  CPY #$04                                  ; $0699E6 |
  BCS CODE_0699ED                           ; $0699E8 |
  JSR CODE_06A77F                           ; $0699EA |

CODE_0699ED:
  LDA !r_msg_box_state                      ; $0699ED |
  BNE CODE_0699F9                           ; $0699F0 |
  LDY !s_spr_gsu_morph_1_hi,x               ; $0699F2 |
  TYX                                       ; $0699F5 |
  JSR ($9988,x)                             ; $0699F6 |

CODE_0699F9:
  JSL $03AF23                               ; $0699F9 |
  LDA !s_player_state                       ; $0699FD |
  BNE CODE_069A19                           ; $069A00 |
  LDY !s_spr_gsu_morph_1_hi,x               ; $069A02 |
  CPY #$04                                  ; $069A05 |
  BCS CODE_069A19                           ; $069A07 |
  LDY !s_spr_wildcard_1_lo,x                ; $069A09 |
  CPY #$7F                                  ; $069A0C |
  BCS CODE_069A19                           ; $069A0E |
  LDA $601A                                 ; $069A10 |
  BEQ CODE_069A19                           ; $069A13 |
  JSL player_hit_sprite                     ; $069A15 |

CODE_069A19:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $069A19 |
  BEQ CODE_069A21                           ; $069A1B |
  TYX                                       ; $069A1D |
  JSR ($9A28,x)                             ; $069A1E |

CODE_069A21:
  LDY !s_spr_gsu_morph_1_lo,x               ; $069A21 |
  TYX                                       ; $069A24 |
  JMP ($9A2E,x)                             ; $069A25 |

  dw $A31F, $A322, $A34D                    ; $069A28 |

  dw $9A7A                                  ; $069A2E |
  dw $9AD3                                  ; $069A30 |
  dw $9B36                                  ; $069A32 |
  dw $9BAD                                  ; $069A34 |
  dw $9BC0                                  ; $069A36 |
  dw $9C22                                  ; $069A38 |
  dw $9C56                                  ; $069A3A |
  dw $9C8E                                  ; $069A3C |
  dw $9CC6                                  ; $069A3E |
  dw $9CF5                                  ; $069A40 |
  dw $9D20                                  ; $069A42 |
  dw $9D65                                  ; $069A44 |
  dw $9DB7                                  ; $069A46 |
  dw $9DE4                                  ; $069A48 |
  dw $9E6A                                  ; $069A4A |
  dw $9EA9                                  ; $069A4C |
  dw $9F2D                                  ; $069A4E |
  dw $9F6A                                  ; $069A50 |
  dw $9FF4                                  ; $069A52 |
  dw $9FD5                                  ; $069A54 |
  dw $9FF4                                  ; $069A56 |
  dw $9FD5                                  ; $069A58 |
  dw $9FF4                                  ; $069A5A |
  dw $9FD5                                  ; $069A5C |
  dw $9FF4                                  ; $069A5E |
  dw $9FD5                                  ; $069A60 |
  dw $9FF4                                  ; $069A62 |
  dw $9FD5                                  ; $069A64 |
  dw $9FF4                                  ; $069A66 |
  dw $9FD5                                  ; $069A68 |
  dw $9FC4                                  ; $069A6A |
  dw $A029                                  ; $069A6C |
  dw $A044                                  ; $069A6E |
  dw $A089                                  ; $069A70 |
  dw $A0AF                                  ; $069A72 |
  dw $A18F                                  ; $069A74 |
  dw $A1DA                                  ; $069A76 |
  dw $A305                                  ; $069A78 |

  LDX $12                                   ; $069A7A |
  LDA !s_player_jump_state                  ; $069A7C |
  BNE CODE_069AD2                           ; $069A7F |
  LDA !s_spr_timer_1,x                      ; $069A81 |
  BNE CODE_069AD2                           ; $069A84 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069A86 |
  CLC                                       ; $069A88 |
  ADC $1064                                 ; $069A89 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069A8C |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069A8E |
  SEC                                       ; $069A90 |
  SBC $1066                                 ; $069A91 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069A94 |
  CMP #$00C0                                ; $069A96 |
  BCS CODE_069AB0                           ; $069A99 |
  LDA $1066                                 ; $069A9B |
  EOR #$FFFF                                ; $069A9E |
  INC A                                     ; $069AA1 |
  STA $1066                                 ; $069AA2 |
  LDA $1064                                 ; $069AA5 |
  EOR #$FFFF                                ; $069AA8 |
  INC A                                     ; $069AAB |
  STA $1064                                 ; $069AAC |
  RTL                                       ; $069AAF |

CODE_069AB0:
  CMP #$0100                                ; $069AB0 |
  BCC CODE_069AD2                           ; $069AB3 |
  LDA #$FC00                                ; $069AB5 |
  STA !s_spr_y_speed_lo,x                   ; $069AB8 |
  LDA #$FE00                                ; $069ABB |
  STA !s_spr_x_speed_lo,x                   ; $069ABE |
  LDA #$0013                                ; $069AC1 |
  JSL push_sound_queue                      ; $069AC4 |
  SEP #$20                                  ; $069AC8 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069ACA |
  INC !s_spr_gsu_morph_1_lo,x               ; $069ACD |
  REP #$20                                  ; $069AD0 |

CODE_069AD2:
  RTL                                       ; $069AD2 |

  LDX $12                                   ; $069AD3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069AD5 |
  CMP #$0140                                ; $069AD7 |
  BCS CODE_069AEA                           ; $069ADA |
  SEC                                       ; $069ADC |
  SBC $1066                                 ; $069ADD |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069AE0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069AE2 |
  CLC                                       ; $069AE4 |
  ADC $1064                                 ; $069AE5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069AE8 |

CODE_069AEA:
  LDA $7860,x                               ; $069AEA |
  BIT #$0001                                ; $069AED |
  BEQ CODE_069B17                           ; $069AF0 |
  STZ !s_spr_anim_frame,x                   ; $069AF2 |
  STZ !s_spr_x_speed_lo,x                   ; $069AF5 |
  LDA $1066                                 ; $069AF8 |
  EOR #$FFFF                                ; $069AFB |
  INC A                                     ; $069AFE |
  STA $1066                                 ; $069AFF |
  LDA $1064                                 ; $069B02 |
  EOR #$FFFF                                ; $069B05 |
  INC A                                     ; $069B08 |
  STA $1064                                 ; $069B09 |
  SEP #$20                                  ; $069B0C |
  INC !s_spr_gsu_morph_1_lo,x               ; $069B0E |
  INC !s_spr_gsu_morph_1_lo,x               ; $069B11 |
  REP #$20                                  ; $069B14 |
  RTL                                       ; $069B16 |

CODE_069B17:
  LDY #$00                                  ; $069B17 |
  LDA !s_spr_y_speed_lo,x                   ; $069B19 |
  BPL CODE_069B2B                           ; $069B1C |
  INY                                       ; $069B1E |
  EOR #$FFFF                                ; $069B1F |
  INC A                                     ; $069B22 |
  CMP #$0300                                ; $069B23 |
  BCS CODE_069B31                           ; $069B26 |
  INY                                       ; $069B28 |
  BRA CODE_069B31                           ; $069B29 |

CODE_069B2B:
  CMP #$0200                                ; $069B2B |
  BCS CODE_069B31                           ; $069B2E |
  INY                                       ; $069B30 |

CODE_069B31:
  TYA                                       ; $069B31 |
  STA !s_spr_anim_frame,x                   ; $069B32 |
  RTL                                       ; $069B35 |

  LDX $12                                   ; $069B36 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069B38 |
  CLC                                       ; $069B3A |
  ADC $1064                                 ; $069B3B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069B3E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069B40 |
  SEC                                       ; $069B42 |
  SBC $1066                                 ; $069B43 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069B46 |
  LDY $1067                                 ; $069B48 |
  BMI CODE_069B67                           ; $069B4B |
  CMP #$00C0                                ; $069B4D |
  BCS CODE_069B66                           ; $069B50 |
  LDA $1066                                 ; $069B52 |
  EOR #$FFFF                                ; $069B55 |
  INC A                                     ; $069B58 |
  STA $1066                                 ; $069B59 |
  LDA $1064                                 ; $069B5C |
  EOR #$FFFF                                ; $069B5F |
  INC A                                     ; $069B62 |
  STA $1064                                 ; $069B63 |

CODE_069B66:
  RTL                                       ; $069B66 |

CODE_069B67:
  CMP #$0100                                ; $069B67 |
  BCC CODE_069BA1                           ; $069B6A |
  LDA #$0100                                ; $069B6C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069B6F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069B71 |
  LDA !s_spr_x_pixel_pos,x                  ; $069B73 |
  CMP #$00B0                                ; $069B76 |
  BCC CODE_069BA2                           ; $069B79 |
  LDA $1066                                 ; $069B7B |
  EOR #$FFFF                                ; $069B7E |
  INC A                                     ; $069B81 |
  STA $1066                                 ; $069B82 |
  LDA $1064                                 ; $069B85 |
  EOR #$FFFF                                ; $069B88 |
  INC A                                     ; $069B8B |
  STA $1064                                 ; $069B8C |
  SEP #$20                                  ; $069B8F |
  LDA #$10                                  ; $069B91 |
  STA !s_spr_timer_1,x                      ; $069B93 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $069B96 |
  SEC                                       ; $069B99 |
  SBC #$04                                  ; $069B9A |
  STA !s_spr_gsu_morph_1_lo,x               ; $069B9C |
  REP #$20                                  ; $069B9F |

CODE_069BA1:
  RTL                                       ; $069BA1 |

CODE_069BA2:
  SEP #$20                                  ; $069BA2 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069BA4 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069BA7 |
  REP #$20                                  ; $069BAA |
  RTL                                       ; $069BAC |

  LDX $12                                   ; $069BAD |
  LDA #$0001                                ; $069BAF |
  STA $1015                                 ; $069BB2 |
  SEP #$20                                  ; $069BB5 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069BB7 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069BBA |
  REP #$20                                  ; $069BBD |
  RTL                                       ; $069BBF |

  LDX $12                                   ; $069BC0 |
  LDA $1015                                 ; $069BC2 |
  BMI CODE_069BC8                           ; $069BC5 |
  RTL                                       ; $069BC7 |

CODE_069BC8:
  LDA #$0008                                ; $069BC8 |
  STA $1066                                 ; $069BCB |
  LDA #$0008                                ; $069BCE |
  STA $1064                                 ; $069BD1 |
  LDX #$3C                                  ; $069BD4 |

CODE_069BD6:
  LDA $5FE640,x                             ; $069BD6 |
  STA $702E2E,x                             ; $069BDA |
  STA $7020C2,x                             ; $069BDE |
  DEX                                       ; $069BE2 |
  DEX                                       ; $069BE3 |
  BPL CODE_069BD6                           ; $069BE4 |
  LDX $12                                   ; $069BE6 |
  SEP #$20                                  ; $069BE8 |
  LDA #$0F                                  ; $069BEA |
  STA $4331                                 ; $069BEC |
  LDA #$10                                  ; $069BEF |
  STA $4341                                 ; $069BF1 |
  REP #$20                                  ; $069BF4 |
  LDA #$0030                                ; $069BF6 |
  STA $6126                                 ; $069BF9 |
  LDA !s_spr_oam_yxppccct                   ; $069BFC |
  AND #$FFCF                                ; $069BFF |
  ORA #$0030                                ; $069C02 |
  STA !s_spr_oam_yxppccct                   ; $069C05 |
  LDA #$0510                                ; $069C08 |
  STA !r_reg_tm_mirror                      ; $069C0B |
  LDA #$FC00                                ; $069C0E |
  STA !s_spr_y_speed_lo,x                   ; $069C11 |
  STZ !s_spr_y_terrain_offset,x             ; $069C14 |
  SEP #$20                                  ; $069C17 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C19 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C1C |
  REP #$20                                  ; $069C1F |
  RTL                                       ; $069C21 |

  LDX $12                                   ; $069C22 |
  LDA !s_spr_y_speed_lo,x                   ; $069C24 |
  CLC                                       ; $069C27 |
  ADC #$0400                                ; $069C28 |
  BMI CODE_069C55                           ; $069C2B |
  LDA #$0030                                ; $069C2D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069C30 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069C32 |
  STZ $1015                                 ; $069C34 |
  SEP #$20                                  ; $069C37 |
  LDA #$02                                  ; $069C39 |
  STA !s_spr_gsu_morph_1_hi,x               ; $069C3B |
  LDA !s_spr_bitwise_settings_3,x           ; $069C3E |
  AND #$E0                                  ; $069C41 |
  STA !s_spr_bitwise_settings_3,x           ; $069C43 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C46 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C49 |
  REP #$20                                  ; $069C4C |
  LDA #$0020                                ; $069C4E |
  JSL push_sound_queue                      ; $069C51 |

CODE_069C55:
  RTL                                       ; $069C55 |

  LDX $12                                   ; $069C56 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069C58 |
  CLC                                       ; $069C5A |
  ADC $1066                                 ; $069C5B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069C5E |
  CMP #$0030                                ; $069C60 |
  BCC CODE_069C71                           ; $069C63 |
  CMP #$0100                                ; $069C65 |
  BCC CODE_069C70                           ; $069C68 |
  LDA #$FFE0                                ; $069C6A |
  STA $1066                                 ; $069C6D |

CODE_069C70:
  RTL                                       ; $069C70 |

CODE_069C71:
  LDA #$0030                                ; $069C71 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069C74 |
  LDA #$0010                                ; $069C76 |
  STA $1066                                 ; $069C79 |
  SEP #$20                                  ; $069C7C |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C7E |
  INC !s_spr_gsu_morph_1_lo,x               ; $069C81 |
  REP #$20                                  ; $069C84 |
  LDA #$0020                                ; $069C86 |
  JSL push_sound_queue                      ; $069C89 |
  RTL                                       ; $069C8D |

  LDX $12                                   ; $069C8E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069C90 |
  CLC                                       ; $069C92 |
  ADC $1064                                 ; $069C93 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069C96 |
  CMP #$0030                                ; $069C98 |
  BCC CODE_069CA9                           ; $069C9B |
  CMP #$0100                                ; $069C9D |
  BCC CODE_069CA8                           ; $069CA0 |
  LDA #$FFE0                                ; $069CA2 |
  STA $1064                                 ; $069CA5 |

CODE_069CA8:
  RTL                                       ; $069CA8 |

CODE_069CA9:
  LDA #$0030                                ; $069CA9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069CAC |
  LDA #$0010                                ; $069CAE |
  STA $1064                                 ; $069CB1 |
  SEP #$20                                  ; $069CB4 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069CB6 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069CB9 |
  REP #$20                                  ; $069CBC |
  LDA #$0020                                ; $069CBE |
  JSL push_sound_queue                      ; $069CC1 |
  RTL                                       ; $069CC5 |

  LDX $12                                   ; $069CC6 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069CC8 |
  CLC                                       ; $069CCA |
  ADC $1066                                 ; $069CCB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069CCE |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069CD0 |
  CLC                                       ; $069CD2 |
  ADC $1064                                 ; $069CD3 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069CD6 |
  CMP #$0100                                ; $069CD8 |
  BMI CODE_069CF4                           ; $069CDB |
  LDA #$0100                                ; $069CDD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069CE0 |
  LDA #$0100                                ; $069CE2 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069CE5 |
  SEP #$20                                  ; $069CE7 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069CE9 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069CEC |
  STZ !s_spr_gsu_morph_1_hi,x               ; $069CEF |
  REP #$20                                  ; $069CF2 |

CODE_069CF4:
  RTL                                       ; $069CF4 |

  LDX $12                                   ; $069CF5 |
  LDA $7860,x                               ; $069CF7 |
  BIT #$0001                                ; $069CFA |
  BNE CODE_069D00                           ; $069CFD |
  RTL                                       ; $069CFF |

CODE_069D00:
  LDA #$0020                                ; $069D00 |
  STA !s_spr_y_accel,x                      ; $069D03 |
  LDA #$0300                                ; $069D06 |
  STA !s_spr_y_accel_ceiling,x              ; $069D09 |
  LDA #$0040                                ; $069D0C |
  STA !s_cam_y_small_shaking_timer          ; $069D0F |
  STZ $1062                                 ; $069D12 |
  SEP #$20                                  ; $069D15 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069D17 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069D1A |
  REP #$20                                  ; $069D1D |
  RTL                                       ; $069D1F |

  LDX $12                                   ; $069D20 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069D22 |
  SEC                                       ; $069D24 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069D25 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069D28 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069D2A |
  CLC                                       ; $069D2C |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069D2D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069D30 |
  CMP #$00C0                                ; $069D32 |
  BCS CODE_069D43                           ; $069D35 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $069D37 |
  EOR #$FFFF                                ; $069D3A |
  INC A                                     ; $069D3D |
  STA !s_spr_gsu_morph_2_lo,x               ; $069D3E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069D41 |

CODE_069D43:
  CMP #$0100                                ; $069D43 |
  BCC CODE_069D64                           ; $069D46 |
  LDA #$0100                                ; $069D48 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069D4B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069D4D |
  LDA #$FFF8                                ; $069D4F |
  STA !s_spr_gsu_morph_2_lo,x               ; $069D52 |
  SEP #$20                                  ; $069D55 |
  LDA #$40                                  ; $069D57 |
  STA !s_spr_timer_2,x                      ; $069D59 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069D5C |
  INC !s_spr_gsu_morph_1_lo,x               ; $069D5F |
  REP #$20                                  ; $069D62 |

CODE_069D64:
  RTL                                       ; $069D64 |

  LDX $12                                   ; $069D65 |
  LDA !s_spr_timer_2,x                      ; $069D67 |
  BNE CODE_069D9F                           ; $069D6A |
  SEP #$20                                  ; $069D6C |
  LDA $14                                   ; $069D6E |
  BIT #$01                                  ; $069D70 |
  BEQ CODE_069D81                           ; $069D72 |
  LDA !s_spr_wildcard_1_lo,x                ; $069D74 |
  SEC                                       ; $069D77 |
  SBC #$01                                  ; $069D78 |
  CMP #$20                                  ; $069D7A |
  BCC CODE_069DA0                           ; $069D7C |
  STA !s_spr_wildcard_1_lo,x                ; $069D7E |

CODE_069D81:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $069D81 |
  BNE CODE_069D9D                           ; $069D83 |
  LDA !s_spr_wildcard_1_lo,x                ; $069D85 |
  CMP #$20                                  ; $069D88 |
  BEQ CODE_069DA0                           ; $069D8A |
  BCC CODE_069DA0                           ; $069D8C |
  LDA #$04                                  ; $069D8E |
  STA !s_spr_wildcard_6_lo,x                ; $069D90 |
  LDA #$07                                  ; $069D93 |
  STA !s_spr_wildcard_6_hi,x                ; $069D95 |
  LDA #$02                                  ; $069D98 |
  STA !s_spr_timer_1,x                      ; $069D9A |

CODE_069D9D:
  REP #$20                                  ; $069D9D |

CODE_069D9F:
  RTL                                       ; $069D9F |

CODE_069DA0:
  LDA #$20                                  ; $069DA0 |
  STA !s_spr_wildcard_1_lo,x                ; $069DA2 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $069DA5 |
  BNE CODE_069DB4                           ; $069DA7 |
  LDA #$20                                  ; $069DA9 |
  STA !s_spr_timer_2,x                      ; $069DAB |
  INC !s_spr_gsu_morph_1_lo,x               ; $069DAE |
  INC !s_spr_gsu_morph_1_lo,x               ; $069DB1 |

CODE_069DB4:
  REP #$20                                  ; $069DB4 |
  RTL                                       ; $069DB6 |

  LDX $12                                   ; $069DB7 |
  LDA !s_spr_timer_2,x                      ; $069DB9 |
  BNE CODE_069DCB                           ; $069DBC |
  SEP #$20                                  ; $069DBE |
  INC !s_spr_gsu_morph_1_lo,x               ; $069DC0 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069DC3 |
  REP #$20                                  ; $069DC6 |
  STZ !s_player_state                       ; $069DC8 |

CODE_069DCB:
  RTL                                       ; $069DCB |

  db $C0, $FE, $40, $01, $F0, $FE, $10, $01 ; $069DCC |
  db $40, $FF, $C0, $00, $58, $FF, $A8, $00 ; $069DD4 |
  db $70, $FF, $90, $00, $80, $FF, $80, $00 ; $069DDC |

  LDX $12                                   ; $069DE4 |
  JSL $06A860                               ; $069DE6 |
  LDA $7860,x                               ; $069DEA |
  BIT #$0001                                ; $069DED |
  BEQ CODE_069E4A                           ; $069DF0 |
  LDA $1062                                 ; $069DF2 |
  BEQ CODE_069E07                           ; $069DF5 |
  LDA #$0023                                ; $069DF7 |
  JSL push_sound_queue                      ; $069DFA |
  LDA #$0020                                ; $069DFE |
  STA !s_cam_y_small_shaking_timer          ; $069E01 |
  STZ $1062                                 ; $069E04 |

CODE_069E07:
  LDA !s_spr_gsu_morph_2_lo,x               ; $069E07 |
  BMI CODE_069E4B                           ; $069E0A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069E0C |
  CMP #$0110                                ; $069E0E |
  BMI CODE_069E4B                           ; $069E11 |
  LDA $7860,x                               ; $069E13 |
  AND #$FFFE                                ; $069E16 |
  STA $7860,x                               ; $069E19 |
  LDY !s_spr_wildcard_2_lo,x                ; $069E1C |
  LDA $99A0,y                               ; $069E1F |
  STA !s_spr_y_speed_lo,x                   ; $069E22 |
  LDA !s_spr_wildcard_2_lo,x                ; $069E25 |
  AND #$00FF                                ; $069E28 |
  ASL A                                     ; $069E2B |
  ORA !s_spr_facing_dir,x                   ; $069E2C |
  TAY                                       ; $069E2F |
  LDA $9DCC,y                               ; $069E30 |
  STA !s_spr_x_speed_lo,x                   ; $069E33 |
  LDA #$0013                                ; $069E36 |
  JSL push_sound_queue                      ; $069E39 |
  INC $1062                                 ; $069E3D |
  SEP #$20                                  ; $069E40 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069E42 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069E45 |
  REP #$20                                  ; $069E48 |

CODE_069E4A:
  RTL                                       ; $069E4A |

CODE_069E4B:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069E4B |
  SEC                                       ; $069E4D |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069E4E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069E51 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069E53 |
  CLC                                       ; $069E55 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069E56 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069E59 |
  LDY !s_spr_wildcard_2_lo,x                ; $069E5B |
  CMP $9994,y                               ; $069E5E |
  BPL CODE_069E69                           ; $069E61 |
  LDA #$0008                                ; $069E63 |
  STA !s_spr_gsu_morph_2_lo,x               ; $069E66 |

CODE_069E69:
  RTL                                       ; $069E69 |

  LDX $12                                   ; $069E6A |
  JSL $06A860                               ; $069E6C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069E70 |
  CMP #$00A0                                ; $069E72 |
  BCC CODE_069E85                           ; $069E75 |
  SEC                                       ; $069E77 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069E78 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069E7B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069E7D |
  CLC                                       ; $069E7F |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069E80 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069E83 |

CODE_069E85:
  LDY !s_spr_y_speed_hi,x                   ; $069E85 |
  BPL CODE_069E98                           ; $069E88 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $069E8A |
  CMP #$3000                                ; $069E8C |
  BPL CODE_069E98                           ; $069E8F |
  CLC                                       ; $069E91 |
  ADC #$0800                                ; $069E92 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $069E95 |
  RTL                                       ; $069E97 |

CODE_069E98:
  LDA #$0400                                ; $069E98 |
  STA $105C                                 ; $069E9B |
  SEP #$20                                  ; $069E9E |
  INC !s_spr_gsu_morph_1_lo,x               ; $069EA0 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069EA3 |
  REP #$20                                  ; $069EA6 |
  RTL                                       ; $069EA8 |

  LDX $12                                   ; $069EA9 |
  JSL $06A860                               ; $069EAB |
  LDA !s_spr_y_speed_lo,x                   ; $069EAF |
  CLC                                       ; $069EB2 |
  ADC #$0100                                ; $069EB3 |
  BMI CODE_069EBE                           ; $069EB6 |
  LDA #$FFF8                                ; $069EB8 |
  STA !s_spr_gsu_morph_2_lo,x               ; $069EBB |

CODE_069EBE:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069EBE |
  CMP #$00A0                                ; $069EC0 |
  BCS CODE_069ECA                           ; $069EC3 |
  LDY !s_spr_gsu_morph_2_hi,x               ; $069EC5 |
  BPL CODE_069EDD                           ; $069EC8 |

CODE_069ECA:
  CMP #$0100                                ; $069ECA |
  BCS CODE_069EDD                           ; $069ECD |
  SEC                                       ; $069ECF |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069ED0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069ED3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069ED5 |
  CLC                                       ; $069ED7 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069ED8 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069EDB |

CODE_069EDD:
  LDA $7860,x                               ; $069EDD |
  BIT #$0001                                ; $069EE0 |
  BNE CODE_069F1A                           ; $069EE3 |

CODE_069EE5:
  LDY !s_spr_y_speed_hi,x                   ; $069EE5 |
  BMI CODE_069EFB                           ; $069EE8 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $069EEA |
  BEQ CODE_069F19                           ; $069EEC |
  BPL CODE_069EF5                           ; $069EEE |
  LDA #$0000                                ; $069EF0 |
  BRA CODE_069F17                           ; $069EF3 |

CODE_069EF5:
  CLC                                       ; $069EF5 |
  ADC #$FE00                                ; $069EF6 |
  BRA CODE_069F17                           ; $069EF9 |

CODE_069EFB:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $069EFB |
  CMP #$2800                                ; $069EFD |
  BCC CODE_069F07                           ; $069F00 |
  CMP #$3000                                ; $069F02 |
  BCC CODE_069F13                           ; $069F05 |

CODE_069F07:
  LDA $105C                                 ; $069F07 |
  EOR #$FFFF                                ; $069F0A |
  INC A                                     ; $069F0D |
  STA $105C                                 ; $069F0E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $069F11 |

CODE_069F13:
  CLC                                       ; $069F13 |
  ADC $105C                                 ; $069F14 |

CODE_069F17:
  STA !s_spr_wildcard_3_lo_dp,x             ; $069F17 |

CODE_069F19:
  RTL                                       ; $069F19 |

CODE_069F1A:
  STZ !s_spr_x_speed_lo,x                   ; $069F1A |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $069F1D |
  SEP #$20                                  ; $069F1F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $069F21 |
  SEC                                       ; $069F24 |
  SBC #$04                                  ; $069F25 |
  STA !s_spr_gsu_morph_1_lo,x               ; $069F27 |
  REP #$20                                  ; $069F2A |
  RTL                                       ; $069F2C |

  LDX $12                                   ; $069F2D |
  JSR CODE_06A978                           ; $069F2F |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069F32 |
  CMP #$0080                                ; $069F34 |
  BCC CODE_069F4B                           ; $069F37 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069F39 |
  SEC                                       ; $069F3B |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069F3C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069F3F |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069F41 |
  CLC                                       ; $069F43 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069F44 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069F47 |
  BRA CODE_069EE5                           ; $069F49 |

CODE_069F4B:
  LDA #$0080                                ; $069F4B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069F4E |
  LDA #$0180                                ; $069F50 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069F53 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $069F55 |
  EOR #$FFFF                                ; $069F58 |
  INC A                                     ; $069F5B |
  STA !s_spr_gsu_morph_2_lo,x               ; $069F5C |
  SEP #$20                                  ; $069F5F |
  INC !s_spr_gsu_morph_1_lo,x               ; $069F61 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069F64 |
  REP #$20                                  ; $069F67 |
  RTL                                       ; $069F69 |

  LDX $12                                   ; $069F6A |
  JSR CODE_06A978                           ; $069F6C |
  LDA $7860,x                               ; $069F6F |
  AND #$0001                                ; $069F72 |
  BNE CODE_069FA0                           ; $069F75 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069F77 |
  CMP #$0080                                ; $069F79 |
  BCC CODE_069F83                           ; $069F7C |
  CMP #$00C0                                ; $069F7E |
  BCC CODE_069F8D                           ; $069F81 |

CODE_069F83:
  LDA !s_spr_gsu_morph_2_lo,x               ; $069F83 |
  EOR #$FFFF                                ; $069F86 |
  INC A                                     ; $069F89 |
  STA !s_spr_gsu_morph_2_lo,x               ; $069F8A |

CODE_069F8D:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069F8D |
  SEC                                       ; $069F8F |
  SBC !s_spr_gsu_morph_2_lo,x               ; $069F90 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $069F93 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $069F95 |
  CLC                                       ; $069F97 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $069F98 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $069F9B |
  JMP CODE_069EE5                           ; $069F9D |

CODE_069FA0:
  LDA #$0023                                ; $069FA0 |
  JSL push_sound_queue                      ; $069FA3 |
  LDA #$0060                                ; $069FA7 |
  STA !s_cam_y_small_shaking_timer          ; $069FAA |
  STZ $1062                                 ; $069FAD |
  STZ !s_spr_x_speed_lo,x                   ; $069FB0 |
  LDA #$FFF0                                ; $069FB3 |
  STA !s_spr_gsu_morph_2_lo,x               ; $069FB6 |
  SEP #$20                                  ; $069FB9 |
  INC !s_spr_gsu_morph_1_lo,x               ; $069FBB |
  INC !s_spr_gsu_morph_1_lo,x               ; $069FBE |
  REP #$20                                  ; $069FC1 |
  RTL                                       ; $069FC3 |

  LDX $12                                   ; $069FC4 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069FC6 |
  CMP #$0100                                ; $069FC8 |
  BMI CODE_06A015                           ; $069FCB |
  LDA #$0010                                ; $069FCD |
  STA !s_spr_timer_2,x                      ; $069FD0 |
  BRA CODE_069FFD                           ; $069FD3 |
  LDX $12                                   ; $069FD5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069FD7 |
  CMP $1060                                 ; $069FD9 |
  BPL CODE_06A015                           ; $069FDC |
  LDA $105E                                 ; $069FDE |
  SEC                                       ; $069FE1 |
  SBC #$0010                                ; $069FE2 |
  STA $105E                                 ; $069FE5 |
  LDA $1060                                 ; $069FE8 |
  CLC                                       ; $069FEB |
  ADC #$0010                                ; $069FEC |
  STA $1060                                 ; $069FEF |
  BRA CODE_069FFD                           ; $069FF2 |
  LDX $12                                   ; $069FF4 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $069FF6 |
  CMP $105E                                 ; $069FF8 |
  BMI CODE_06A015                           ; $069FFB |

CODE_069FFD:
  LDA !s_spr_gsu_morph_2_lo,x               ; $069FFD |
  EOR #$FFFF                                ; $06A000 |
  INC A                                     ; $06A003 |
  STA !s_spr_gsu_morph_2_lo,x               ; $06A004 |
  SEP #$20                                  ; $06A007 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A009 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A00C |
  REP #$20                                  ; $06A00F |
  JSR CODE_06A978                           ; $06A011 |
  RTL                                       ; $06A014 |

CODE_06A015:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A015 |
  SEC                                       ; $06A017 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $06A018 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06A01B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A01D |
  CLC                                       ; $06A01F |
  ADC !s_spr_gsu_morph_2_lo,x               ; $06A020 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06A023 |
  JSR CODE_06A978                           ; $06A025 |
  RTL                                       ; $06A028 |

  LDX $12                                   ; $06A029 |
  LDA !s_spr_timer_2,x                      ; $06A02B |
  BNE CODE_06A040                           ; $06A02E |
  SEP #$20                                  ; $06A030 |
  LDA #$08                                  ; $06A032 |
  STA !s_spr_timer_2,x                      ; $06A034 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A037 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A03A |
  REP #$20                                  ; $06A03D |
  RTL                                       ; $06A03F |

CODE_06A040:
  JSR CODE_06A978                           ; $06A040 |
  RTL                                       ; $06A043 |

  LDX $12                                   ; $06A044 |
  LDY !s_spr_wildcard_2_lo,x                ; $06A046 |
  BEQ CODE_06A050                           ; $06A049 |
  LDA !s_spr_timer_2,x                      ; $06A04B |
  BEQ CODE_06A065                           ; $06A04E |

CODE_06A050:
  JSR CODE_06A978                           ; $06A050 |
  LDY !s_spr_wildcard_1_lo,x                ; $06A053 |
  CPY #$7F                                  ; $06A056 |
  BCS CODE_06A065                           ; $06A058 |
  SEP #$20                                  ; $06A05A |
  INC !s_spr_wildcard_1_lo,x                ; $06A05C |
  INC !s_spr_wildcard_1_lo,x                ; $06A05F |
  REP #$20                                  ; $06A062 |
  RTL                                       ; $06A064 |

CODE_06A065:
  LDX #$03                                  ; $06A065 |
  JSR CODE_06A984                           ; $06A067 |
  JSR CODE_06A849                           ; $06A06A |
  SEP #$20                                  ; $06A06D |
  LDA #$20                                  ; $06A06F |
  STA !s_spr_timer_2,x                      ; $06A071 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A074 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A077 |
  REP #$20                                  ; $06A07A |
  LDY !s_spr_wildcard_2_lo,x                ; $06A07C |
  BNE CODE_06A088                           ; $06A07F |
  JSL $028925                               ; $06A081 |
  JSR CODE_06A920                           ; $06A085 |

CODE_06A088:
  RTL                                       ; $06A088 |

  LDX $12                                   ; $06A089 |
  LDY !s_spr_wildcard_2_lo,x                ; $06A08B |
  BNE CODE_06A097                           ; $06A08E |
  JSL $02A982                               ; $06A090 |
  JSR CODE_06A934                           ; $06A094 |

CODE_06A097:
  JSR CODE_06A9FB                           ; $06A097 |
  LDA !s_spr_timer_2,x                      ; $06A09A |
  BNE CODE_06A0AE                           ; $06A09D |
  SEP #$20                                  ; $06A09F |
  LDA #$01                                  ; $06A0A1 |
  STA !s_spr_wildcard_2_hi,x                ; $06A0A3 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A0A6 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A0A9 |
  REP #$20                                  ; $06A0AC |

CODE_06A0AE:
  RTL                                       ; $06A0AE |

  LDX $12                                   ; $06A0AF |
  JSR CODE_06A9FB                           ; $06A0B1 |
  LDY !s_spr_wildcard_2_lo,x                ; $06A0B4 |
  BNE CODE_06A0BC                           ; $06A0B7 |
  JSR CODE_06A934                           ; $06A0B9 |

CODE_06A0BC:
  LDY !s_spr_wildcard_2_lo,x                ; $06A0BC |
  LDA $99B8,y                               ; $06A0BF |
  STA !gsu_r14                              ; $06A0C2 |
  LDA #$005F                                ; $06A0C5 |
  STA !gsu_r0                               ; $06A0C8 |
  LDA !s_spr_wildcard_2_hi,x                ; $06A0CB |
  AND #$00FF                                ; $06A0CE |
  STA !gsu_r6                               ; $06A0D1 |
  LDA #$0061                                ; $06A0D4 |
  STA !gsu_r8                               ; $06A0D7 |
  LDA #$000E                                ; $06A0DA |
  STA !gsu_r12                              ; $06A0DD |
  PHY                                       ; $06A0E0 |
  LDX #$08                                  ; $06A0E1 |
  LDA #$E167                                ; $06A0E3 |
  JSL r_gsu_init_1                          ; $06A0E6 |
  PLY                                       ; $06A0EA |
  LDX $12                                   ; $06A0EB |
  LDA $99C4,y                               ; $06A0ED |
  STA !gsu_r14                              ; $06A0F0 |
  LDA #$005F                                ; $06A0F3 |
  STA !gsu_r0                               ; $06A0F6 |
  LDA !s_spr_wildcard_2_hi,x                ; $06A0F9 |
  AND #$00FF                                ; $06A0FC |
  STA !gsu_r6                               ; $06A0FF |
  LDA #$00E8                                ; $06A102 |
  STA !gsu_r8                               ; $06A105 |
  LDA #$0004                                ; $06A108 |
  STA !gsu_r12                              ; $06A10B |
  PHY                                       ; $06A10E |
  LDX #$08                                  ; $06A10F |
  LDA #$E167                                ; $06A111 |
  JSL r_gsu_init_1                          ; $06A114 |
  PLY                                       ; $06A118 |
  LDX $12                                   ; $06A119 |
  LDA $99D0,y                               ; $06A11B |
  STA !gsu_r14                              ; $06A11E |
  LDA #$005F                                ; $06A121 |
  STA !gsu_r0                               ; $06A124 |
  LDA !s_spr_wildcard_2_hi,x                ; $06A127 |
  AND #$00FF                                ; $06A12A |
  STA !gsu_r6                               ; $06A12D |
  LDA #$00F8                                ; $06A130 |
  STA !gsu_r8                               ; $06A133 |
  LDA #$0004                                ; $06A136 |
  STA !gsu_r12                              ; $06A139 |
  LDX #$08                                  ; $06A13C |
  LDA #$E167                                ; $06A13E |
  JSL r_gsu_init_1                          ; $06A141 |
  LDX $12                                   ; $06A145 |
  SEP #$20                                  ; $06A147 |
  LDA !s_spr_wildcard_2_hi,x                ; $06A149 |
  CLC                                       ; $06A14C |
  ADC #$04                                  ; $06A14D |
  STA !s_spr_wildcard_2_hi,x                ; $06A14F |
  BCC CODE_06A171                           ; $06A152 |
  JSR CODE_06A8C8                           ; $06A154 |
  LDA #$05                                  ; $06A157 |
  STA !s_spr_draw_priority,x                ; $06A159 |
  DEC !s_spr_wildcard_2_lo,x                ; $06A15C |
  DEC !s_spr_wildcard_2_lo,x                ; $06A15F |
  BMI CODE_06A174                           ; $06A162 |
  LDA #$1A                                  ; $06A164 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06A166 |
  REP #$20                                  ; $06A169 |
  LDA #$FFF8                                ; $06A16B |
  STA !s_spr_gsu_morph_2_lo,x               ; $06A16E |

CODE_06A171:
  REP #$20                                  ; $06A171 |
  RTL                                       ; $06A173 |

CODE_06A174:
  INC !s_spr_gsu_morph_1_lo,x               ; $06A174 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A177 |
  LDA #$9D02                                ; $06A17A |
  AND [$7A],y                               ; $06A17D |
  REP #$20                                  ; $06A17F |
  LDA #$0020                                ; $06A181 |
  STA !s_spr_timer_1,x                      ; $06A184 |
  LDA #$0100                                ; $06A187 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06A18A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06A18C |
  RTL                                       ; $06A18E |

  LDX $12                                   ; $06A18F |
  JSR CODE_06A934                           ; $06A191 |
  LDA !s_spr_timer_1,x                      ; $06A194 |
  BNE CODE_06A1D1                           ; $06A197 |
  LDA #$00A0                                ; $06A199 |
  STA !s_spr_timer_1,x                      ; $06A19C |
  STZ !s_spr_y_accel,x                      ; $06A19F |
  TXY                                       ; $06A1A2 |
  LDA $10                                   ; $06A1A3 |
  AND #$007E                                ; $06A1A5 |
  TAX                                       ; $06A1A8 |
  LDA $00E9D4,x                             ; $06A1A9 |
  ASL A                                     ; $06A1AD |
  ASL A                                     ; $06A1AE |
  ASL A                                     ; $06A1AF |
  ASL A                                     ; $06A1B0 |
  STA !s_spr_y_speed_lo,y                   ; $06A1B1 |
  LDA $00E954,x                             ; $06A1B4 |
  ASL A                                     ; $06A1B8 |
  ASL A                                     ; $06A1B9 |
  ASL A                                     ; $06A1BA |
  ASL A                                     ; $06A1BB |
  STA !s_spr_x_speed_lo,y                   ; $06A1BC |
  TYX                                       ; $06A1BF |
  LDA #$0020                                ; $06A1C0 |
  JSL push_sound_queue                      ; $06A1C3 |
  SEP #$20                                  ; $06A1C7 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A1C9 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A1CC |
  REP #$20                                  ; $06A1CF |

CODE_06A1D1:
  RTL                                       ; $06A1D1 |

  db $40, $00, $00, $00, $80, $00, $C0, $00 ; $06A1D2 |

  LDX $12                                   ; $06A1DA |
  JSR CODE_06A934                           ; $06A1DC |
  LDA !s_spr_timer_2,x                      ; $06A1DF |
  BNE CODE_06A215                           ; $06A1E2 |
  LDA #$01DF                                ; $06A1E4 |
  JSL spawn_ambient_sprite                  ; $06A1E7 |
  LDA !s_spr_x_pixel_pos,x                  ; $06A1EB |
  STA $70A2,y                               ; $06A1EE |
  LDA !s_spr_y_pixel_pos,x                  ; $06A1F1 |
  STA $7142,y                               ; $06A1F4 |
  LDA #$0005                                ; $06A1F7 |
  STA $7E4C,y                               ; $06A1FA |
  LDA #$0005                                ; $06A1FD |
  STA $73C2,y                               ; $06A200 |
  LDA #$0004                                ; $06A203 |
  STA $7782,y                               ; $06A206 |
  LDA #$0006                                ; $06A209 |
  STA $7462,y                               ; $06A20C |
  LDA #$0002                                ; $06A20F |
  STA !s_spr_timer_2,x                      ; $06A212 |

CODE_06A215:
  LDY #$00                                  ; $06A215 |
  LDA !s_spr_cam_x_pos,x                    ; $06A217 |
  AND #$FF00                                ; $06A21A |
  BEQ CODE_06A22F                           ; $06A21D |
  BPL CODE_06A223                           ; $06A21F |
  INY                                       ; $06A221 |
  INY                                       ; $06A222 |

CODE_06A223:
  LDA !s_spr_y_speed_lo,x                   ; $06A223 |
  BMI CODE_06A24D                           ; $06A226 |
  TYA                                       ; $06A228 |
  ORA #$0004                                ; $06A229 |
  TAY                                       ; $06A22C |
  BRA CODE_06A24D                           ; $06A22D |

CODE_06A22F:
  LDA !s_spr_cam_y_pos,x                    ; $06A22F |
  BMI CODE_06A23F                           ; $06A232 |
  CLC                                       ; $06A234 |
  ADC #$0040                                ; $06A235 |
  AND #$FF00                                ; $06A238 |
  BEQ CODE_06A27E                           ; $06A23B |
  BPL CODE_06A243                           ; $06A23D |

CODE_06A23F:
  INY                                       ; $06A23F |
  INY                                       ; $06A240 |
  INY                                       ; $06A241 |
  INY                                       ; $06A242 |

CODE_06A243:
  LDA !s_spr_x_speed_lo,x                   ; $06A243 |
  BMI CODE_06A24D                           ; $06A246 |
  TYA                                       ; $06A248 |
  ORA #$0002                                ; $06A249 |
  TAY                                       ; $06A24C |

CODE_06A24D:
  LDA $10                                   ; $06A24D |
  AND #$003F                                ; $06A24F |
  CLC                                       ; $06A252 |
  ADC $A1D2,y                               ; $06A253 |
  REP #$10                                  ; $06A256 |
  AND #$00FF                                ; $06A258 |
  ASL A                                     ; $06A25B |
  TXY                                       ; $06A25C |
  TAX                                       ; $06A25D |
  LDA $00E9D4,x                             ; $06A25E |
  ASL A                                     ; $06A262 |
  ASL A                                     ; $06A263 |
  ASL A                                     ; $06A264 |
  ASL A                                     ; $06A265 |
  STA !s_spr_y_speed_lo,y                   ; $06A266 |
  LDA $00E954,x                             ; $06A269 |
  ASL A                                     ; $06A26D |
  ASL A                                     ; $06A26E |
  ASL A                                     ; $06A26F |
  ASL A                                     ; $06A270 |
  STA !s_spr_x_speed_lo,y                   ; $06A271 |
  SEP #$10                                  ; $06A274 |
  TYX                                       ; $06A276 |
  LDA #$0020                                ; $06A277 |
  JSL push_sound_queue                      ; $06A27A |

CODE_06A27E:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A27E |
  CMP #$0020                                ; $06A280 |
  BCC CODE_06A294                           ; $06A283 |
  SEC                                       ; $06A285 |
  SBC #$0002                                ; $06A286 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06A289 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A28B |
  SEC                                       ; $06A28D |
  SBC #$0002                                ; $06A28E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06A291 |
  RTL                                       ; $06A293 |

CODE_06A294:
  LDA !s_spr_timer_1,x                      ; $06A294 |
  BNE CODE_06A304                           ; $06A297 |
  LDA !s_spr_cam_x_pos,x                    ; $06A299 |
  CMP #$0040                                ; $06A29C |
  BCC CODE_06A304                           ; $06A29F |
  CMP #$00C0                                ; $06A2A1 |
  BCS CODE_06A304                           ; $06A2A4 |
  LDA !s_spr_cam_y_pos,x                    ; $06A2A6 |
  CMP #$0040                                ; $06A2A9 |
  BCC CODE_06A304                           ; $06A2AC |
  CMP #$0080                                ; $06A2AE |
  BCS CODE_06A304                           ; $06A2B1 |
  LDA #$01E6                                ; $06A2B3 |
  JSL spawn_ambient_sprite                  ; $06A2B6 |
  LDA !s_spr_x_pixel_pos,x                  ; $06A2BA |
  STA $70A2,y                               ; $06A2BD |
  LDA !s_spr_y_pixel_pos,x                  ; $06A2C0 |
  SEC                                       ; $06A2C3 |
  SBC #$0008                                ; $06A2C4 |
  STA $7142,y                               ; $06A2C7 |
  LDA #$0006                                ; $06A2CA |
  STA $73C2,y                               ; $06A2CD |
  STA $7E4C,y                               ; $06A2D0 |
  LDA #$0004                                ; $06A2D3 |
  STA $7782,y                               ; $06A2D6 |
  LDA !s_spr_x_pixel_pos,x                  ; $06A2D9 |
  STA $00                                   ; $06A2DC |
  LDA !s_spr_y_pixel_pos,x                  ; $06A2DE |
  SEC                                       ; $06A2E1 |
  SBC #$0008                                ; $06A2E2 |
  STA $02                                   ; $06A2E5 |
  JSL $02E19C                               ; $06A2E7 |
  SEP #$20                                  ; $06A2EB |
  LDA #$02                                  ; $06A2ED |
  TRB !r_reg_tm_mirror                      ; $06A2EF |
  LDA #$FF                                  ; $06A2F2 |
  STA !s_spr_draw_priority,x                ; $06A2F4 |
  LDA #$04                                  ; $06A2F7 |
  STA !s_spr_gsu_morph_1_hi,x               ; $06A2F9 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A2FC |
  INC !s_spr_gsu_morph_1_lo,x               ; $06A2FF |
  REP #$20                                  ; $06A302 |

CODE_06A304:
  RTL                                       ; $06A304 |

  LDX $12                                   ; $06A305 |
  JSR CODE_06A934                           ; $06A307 |
  JML $03A32E                               ; $06A30A |
  RTL                                       ; $06A30E |

  db $00, $01, $02, $03                     ; $06A30F |
  db $03, $02, $01, $00                     ; $06A313 |
  db $00, $00, $00, $02                     ; $06A317 |
  db $00, $00, $00, $00                     ; $06A31B |

; burt sub
  LDX $12                                   ; $06A31F |
  RTS                                       ; $06A321 |

; burt sub
  LDX $12                                   ; $06A322 |
  LDA !s_spr_timer_1,x                      ; $06A324 |
  BNE CODE_06A347                           ; $06A327 |
  SEP #$20                                  ; $06A329 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $06A32B |
  BMI CODE_06A348                           ; $06A32D |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $06A32F |
  LDA #$04                                  ; $06A331 |
  STA !s_spr_timer_1,x                      ; $06A333 |
  LDA $A30F,y                               ; $06A336 |
  STA !s_spr_anim_frame,x                   ; $06A339 |
  LDA !s_spr_facing_dir,x                   ; $06A33C |
  EOR $A317,y                               ; $06A33F |
  STA !s_spr_facing_dir,x                   ; $06A342 |
  REP #$20                                  ; $06A345 |

CODE_06A347:
  RTS                                       ; $06A347 |

CODE_06A348:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $06A348 |
  REP #$20                                  ; $06A34A |
  RTS                                       ; $06A34C |

; burt sub
  LDX $12                                   ; $06A34D |
  LDA !s_spr_timer_1,x                      ; $06A34F |
  BNE CODE_06A369                           ; $06A352 |
  SEP #$20                                  ; $06A354 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $06A356 |
  BMI CODE_06A36A                           ; $06A358 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $06A35A |
  LDA #$02                                  ; $06A35C |
  STA !s_spr_timer_1,x                      ; $06A35E |
  LDA $A30F,y                               ; $06A361 |
  STA !s_spr_anim_frame,x                   ; $06A364 |
  REP #$20                                  ; $06A367 |

CODE_06A369:
  RTS                                       ; $06A369 |

CODE_06A36A:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $06A36A |
  REP #$20                                  ; $06A36C |
  RTS                                       ; $06A36E |

; burt sub
  LDX $12                                   ; $06A36F |
  LDY !s_spr_draw_priority,x                ; $06A371 |
  CPY #$FF                                  ; $06A374 |
  BEQ CODE_06A3EC                           ; $06A376 |
  LDA !s_spr_oam_pointer,x                  ; $06A378 |
  BMI CODE_06A3EC                           ; $06A37B |
  LDA #$01C0                                ; $06A37D |
  STA $6000                                 ; $06A380 |
  LDA #$01C2                                ; $06A383 |
  STA $6002                                 ; $06A386 |
  LDA #$01E0                                ; $06A389 |
  STA $6004                                 ; $06A38C |
  LDA #$01E2                                ; $06A38F |
  STA $6006                                 ; $06A392 |
  LDA #$01C4                                ; $06A395 |
  STA $6008                                 ; $06A398 |
  LDA #$01C6                                ; $06A39B |
  STA $600A                                 ; $06A39E |
  LDA #$01E4                                ; $06A3A1 |
  STA $600C                                 ; $06A3A4 |
  LDA #$01E6                                ; $06A3A7 |
  STA $600E                                 ; $06A3AA |
  LDA #$01C8                                ; $06A3AD |
  STA $6010                                 ; $06A3B0 |
  LDA #$01E8                                ; $06A3B3 |
  STA $6012                                 ; $06A3B6 |
  LDA #$01CC                                ; $06A3B9 |
  STA $6014                                 ; $06A3BC |
  LDA #$01CE                                ; $06A3BF |
  STA $6016                                 ; $06A3C2 |
  LDA #$01EC                                ; $06A3C5 |
  STA $6018                                 ; $06A3C8 |
  LDA #$01EE                                ; $06A3CB |
  STA $601A                                 ; $06A3CE |
  LDA #$01CA                                ; $06A3D1 |
  STA $601C                                 ; $06A3D4 |
  STA $601E                                 ; $06A3D7 |
  LDA #$01EA                                ; $06A3DA |
  STA $6020                                 ; $06A3DD |
  STA $6022                                 ; $06A3E0 |
  LDX #$09                                  ; $06A3E3 |
  LDA #$A122                                ; $06A3E5 |
  JSL r_gsu_init_1                          ; $06A3E8 |

CODE_06A3EC:
  LDX $12                                   ; $06A3EC |
  RTS                                       ; $06A3EE |

; burt sub
  LDX $12                                   ; $06A3EF |
  LDY !s_spr_draw_priority,x                ; $06A3F1 |
  CPY #$FF                                  ; $06A3F4 |
  BEQ CODE_06A406                           ; $06A3F6 |
  LDA !s_spr_oam_pointer,x                  ; $06A3F8 |
  BMI CODE_06A406                           ; $06A3FB |
  LDX #$09                                  ; $06A3FD |
  LDA #$A511                                ; $06A3FF |
  JSL r_gsu_init_1                          ; $06A402 |

CODE_06A406:
  LDX $12                                   ; $06A406 |
  RTS                                       ; $06A408 |

  dw $0100                                  ; $06A409 |
  dw $0000                                  ; $06A40B |
  dw $00E6                                  ; $06A40D |
  dw $0007                                  ; $06A40F |
  dw $00B3                                  ; $06A411 |
  dw $000E                                  ; $06A413 |
  dw $0066                                  ; $06A415 |
  dw $0015                                  ; $06A417 |

  dw $0100                                  ; $06A419 |
  dw $00CC                                  ; $06A41B |
  dw $0099                                  ; $06A41D |
  dw $0066                                  ; $06A41F |

  dw $0100                                  ; $06A421 |
  dw $00E6                                  ; $06A423 |
  dw $00CC                                  ; $06A425 |
  dw $00B3                                  ; $06A427 |

; burt sub
  LDX $12                                   ; $06A429 |
  REP #$10                                  ; $06A42B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06A42D |
  EOR #$FFFF                                ; $06A42F |
  INC A                                     ; $06A432 |
  XBA                                       ; $06A433 |
  AND #$00FF                                ; $06A434 |
  STA !gsu_r5                               ; $06A437 |
  LDA #$0000                                ; $06A43A |
  STA !gsu_r3                               ; $06A43D |
  LDA #$0000                                ; $06A440 |
  STA !gsu_r2                               ; $06A443 |
  LDA #$0100                                ; $06A446 |
  STA !gsu_r6                               ; $06A449 |
  LDA #$6000                                ; $06A44C |
  STA !gsu_r12                              ; $06A44F |
  LDA #$0056                                ; $06A452 |
  STA !gsu_r13                              ; $06A455 |
  SEP #$10                                  ; $06A458 |
  LDX #$08                                  ; $06A45A |
  LDA #$8205                                ; $06A45C |
  JSL r_gsu_init_1                          ; $06A45F |
  LDX $12                                   ; $06A463 |
  LDA !s_spr_anim_frame,x                   ; $06A465 |
  ASL A                                     ; $06A468 |
  TAY                                       ; $06A469 |
  LDA $A421,y                               ; $06A46A |
  STA !gsu_r6                               ; $06A46D |
  LDA #$0100                                ; $06A470 |
  STA !gsu_r11                              ; $06A473 |
  LDA #$001C                                ; $06A476 |
  STA !gsu_r8                               ; $06A479 |
  LDA #$0010                                ; $06A47C |
  STA !gsu_r9                               ; $06A47F |
  LDA #$0020                                ; $06A482 |
  STA !gsu_r3                               ; $06A485 |
  LDA #$0000                                ; $06A488 |
  STA !gsu_r2                               ; $06A48B |
  LDA #$6000                                ; $06A48E |
  STA !gsu_r12                              ; $06A491 |
  LDA #$0056                                ; $06A494 |
  STA !gsu_r13                              ; $06A497 |
  LDX #$08                                  ; $06A49A |
  LDA #$8295                                ; $06A49C |
  JSL r_gsu_init_1                          ; $06A49F |
  LDX $12                                   ; $06A4A3 |
  LDA !s_spr_anim_frame,x                   ; $06A4A5 |
  ASL A                                     ; $06A4A8 |
  ASL A                                     ; $06A4A9 |
  TAY                                       ; $06A4AA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A4AB |
  STA !gsu_r0                               ; $06A4AD |
  LDA $A409,y                               ; $06A4B0 |
  STA !gsu_r6                               ; $06A4B3 |
  PHX                                       ; $06A4B6 |
  PHY                                       ; $06A4B7 |
  LDX #$0B                                  ; $06A4B8 |
  LDA #$86B6                                ; $06A4BA |
  JSL r_gsu_init_1                          ; $06A4BD |
  PLY                                       ; $06A4C1 |
  PLX                                       ; $06A4C2 |
  LDA !s_spr_wildcard_5_lo,x                ; $06A4C3 |
  CMP !gsu_r0                               ; $06A4C6 |
  BPL CODE_06A4DC                           ; $06A4C9 |
  LDA $A40B,y                               ; $06A4CB |
  BEQ CODE_06A4DF                           ; $06A4CE |
  LDA $A40B,y                               ; $06A4D0 |
  EOR #$FFFF                                ; $06A4D3 |
  INC A                                     ; $06A4D6 |
  AND #$00FF                                ; $06A4D7 |
  BRA CODE_06A4DF                           ; $06A4DA |

CODE_06A4DC:
  LDA $A40B,y                               ; $06A4DC |

CODE_06A4DF:
  STA !gsu_r5                               ; $06A4DF |
  LDA !gsu_r0                               ; $06A4E2 |
  STA !gsu_r6                               ; $06A4E5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A4E8 |
  STA !gsu_r11                              ; $06A4EA |
  LDA #$0060                                ; $06A4ED |
  STA !gsu_r3                               ; $06A4F0 |
  LDA #$0000                                ; $06A4F3 |
  STA !gsu_r2                               ; $06A4F6 |
  LDA #$6040                                ; $06A4F9 |
  STA !gsu_r12                              ; $06A4FC |
  LDA #$0056                                ; $06A4FF |
  STA !gsu_r13                              ; $06A502 |
  LDX #$08                                  ; $06A505 |
  LDA #$84A5                                ; $06A507 |
  JSL r_gsu_init_1                          ; $06A50A |
  LDX $12                                   ; $06A50E |
  LDA !s_spr_anim_frame,x                   ; $06A510 |
  ASL A                                     ; $06A513 |
  TAY                                       ; $06A514 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A515 |
  STA !gsu_r0                               ; $06A517 |
  LDA $A419,y                               ; $06A51A |
  STA !gsu_r6                               ; $06A51D |
  PHX                                       ; $06A520 |
  PHY                                       ; $06A521 |
  LDX #$0B                                  ; $06A522 |
  LDA #$86B6                                ; $06A524 |
  JSL r_gsu_init_1                          ; $06A527 |
  PLY                                       ; $06A52B |
  PLX                                       ; $06A52C |
  LDA !gsu_r0                               ; $06A52D |
  STA !gsu_r6                               ; $06A530 |
  STA $00                                   ; $06A533 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A535 |
  STA !gsu_r11                              ; $06A537 |
  LDA #$000F                                ; $06A53A |
  STA !gsu_r8                               ; $06A53D |
  LDA #$000F                                ; $06A540 |
  STA !gsu_r9                               ; $06A543 |
  LDA #$0050                                ; $06A546 |
  STA !gsu_r3                               ; $06A549 |
  LDA #$0000                                ; $06A54C |
  STA !gsu_r2                               ; $06A54F |
  LDA #$7030                                ; $06A552 |
  STA !gsu_r12                              ; $06A555 |
  LDA #$0056                                ; $06A558 |
  STA !gsu_r13                              ; $06A55B |
  LDX #$08                                  ; $06A55E |
  LDA #$861B                                ; $06A560 |
  JSL r_gsu_init_1                          ; $06A563 |
  LDX $12                                   ; $06A567 |
  LDA $00                                   ; $06A569 |
  STA !gsu_r6                               ; $06A56B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A56E |
  STA !gsu_r11                              ; $06A570 |
  LDA #$000F                                ; $06A573 |
  STA !gsu_r8                               ; $06A576 |
  LDA #$0000                                ; $06A579 |
  STA !gsu_r9                               ; $06A57C |
  LDA #$0050                                ; $06A57F |
  STA !gsu_r3                               ; $06A582 |
  LDA #$0010                                ; $06A585 |
  STA !gsu_r2                               ; $06A588 |
  LDA #$7020                                ; $06A58B |
  STA !gsu_r12                              ; $06A58E |
  LDA #$0056                                ; $06A591 |
  STA !gsu_r13                              ; $06A594 |
  LDX #$08                                  ; $06A597 |
  LDA #$861B                                ; $06A599 |
  JSL r_gsu_init_1                          ; $06A59C |
  INC $0CF9                                 ; $06A5A0 |
  LDX $12                                   ; $06A5A3 |
  RTS                                       ; $06A5A5 |

; burt sub
  LDX $12                                   ; $06A5A6 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A5A8 |
  STA !gsu_r6                               ; $06A5AA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A5AD |
  STA !gsu_r11                              ; $06A5AF |
  LDA #$0010                                ; $06A5B2 |
  STA !gsu_r8                               ; $06A5B5 |
  LDA #$0010                                ; $06A5B8 |
  STA !gsu_r9                               ; $06A5BB |
  LDA #$0000                                ; $06A5BE |
  STA !gsu_r3                               ; $06A5C1 |
  LDA #$0000                                ; $06A5C4 |
  STA !gsu_r2                               ; $06A5C7 |
  LDA #$6000                                ; $06A5CA |
  STA !gsu_r12                              ; $06A5CD |
  LDA #$0056                                ; $06A5D0 |
  STA !gsu_r13                              ; $06A5D3 |
  LDX #$08                                  ; $06A5D6 |
  LDA #$8295                                ; $06A5D8 |
  JSL r_gsu_init_1                          ; $06A5DB |
  LDX $12                                   ; $06A5DF |
  LDA !s_spr_anim_frame,x                   ; $06A5E1 |
  ASL A                                     ; $06A5E4 |
  TAY                                       ; $06A5E5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A5E6 |
  STA !gsu_r6                               ; $06A5E8 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A5EB |
  STA !gsu_r11                              ; $06A5ED |
  LDA #$001C                                ; $06A5F0 |
  STA !gsu_r8                               ; $06A5F3 |
  LDA #$0010                                ; $06A5F6 |
  STA !gsu_r9                               ; $06A5F9 |
  LDA #$0020                                ; $06A5FC |
  STA !gsu_r3                               ; $06A5FF |
  LDA #$0000                                ; $06A602 |
  STA !gsu_r2                               ; $06A605 |
  LDA #$6000                                ; $06A608 |
  STA !gsu_r12                              ; $06A60B |
  LDA #$0056                                ; $06A60E |
  STA !gsu_r13                              ; $06A611 |
  LDX #$08                                  ; $06A614 |
  LDA #$8295                                ; $06A616 |
  JSL r_gsu_init_1                          ; $06A619 |
  LDX $12                                   ; $06A61D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A61F |
  STA !gsu_r6                               ; $06A621 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A624 |
  STA !gsu_r11                              ; $06A626 |
  LDA #$0008                                ; $06A629 |
  STA !gsu_r8                               ; $06A62C |
  LDA #$000F                                ; $06A62F |
  STA !gsu_r9                               ; $06A632 |
  LDA #$0040                                ; $06A635 |
  STA !gsu_r3                               ; $06A638 |
  LDA #$0000                                ; $06A63B |
  STA !gsu_r2                               ; $06A63E |
  LDA #$6020                                ; $06A641 |
  STA !gsu_r12                              ; $06A644 |
  LDA #$0056                                ; $06A647 |
  STA !gsu_r13                              ; $06A64A |
  LDX #$08                                  ; $06A64D |
  LDA #$861B                                ; $06A64F |
  JSL r_gsu_init_1                          ; $06A652 |
  LDX $12                                   ; $06A656 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A658 |
  STA !gsu_r6                               ; $06A65A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A65D |
  STA !gsu_r11                              ; $06A65F |
  LDA #$0001                                ; $06A662 |
  STA !gsu_r8                               ; $06A665 |
  LDA #$000E                                ; $06A668 |
  STA !gsu_r9                               ; $06A66B |
  LDA #$0040                                ; $06A66E |
  STA !gsu_r3                               ; $06A671 |
  LDA #$0010                                ; $06A674 |
  STA !gsu_r2                               ; $06A677 |
  LDA #$6030                                ; $06A67A |
  STA !gsu_r12                              ; $06A67D |
  LDA #$0056                                ; $06A680 |
  STA !gsu_r13                              ; $06A683 |
  LDX #$08                                  ; $06A686 |
  LDA #$861B                                ; $06A688 |
  JSL r_gsu_init_1                          ; $06A68B |
  LDX $12                                   ; $06A68F |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A691 |
  STA !gsu_r6                               ; $06A693 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A696 |
  STA !gsu_r11                              ; $06A698 |
  LDA #$0010                                ; $06A69B |
  STA !gsu_r8                               ; $06A69E |
  LDA #$0010                                ; $06A6A1 |
  STA !gsu_r9                               ; $06A6A4 |
  LDA #$0060                                ; $06A6A7 |
  STA !gsu_r3                               ; $06A6AA |
  LDA #$0000                                ; $06A6AD |
  STA !gsu_r2                               ; $06A6B0 |
  LDA #$6040                                ; $06A6B3 |
  STA !gsu_r12                              ; $06A6B6 |
  LDA #$0056                                ; $06A6B9 |
  STA !gsu_r13                              ; $06A6BC |
  LDX #$08                                  ; $06A6BF |
  LDA #$8295                                ; $06A6C1 |
  JSL r_gsu_init_1                          ; $06A6C4 |
  LDX $12                                   ; $06A6C8 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A6CA |
  STA !gsu_r6                               ; $06A6CC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A6CF |
  STA !gsu_r11                              ; $06A6D1 |
  LDA #$000F                                ; $06A6D4 |
  STA !gsu_r8                               ; $06A6D7 |
  LDA #$000F                                ; $06A6DA |
  STA !gsu_r9                               ; $06A6DD |
  LDA #$0050                                ; $06A6E0 |
  STA !gsu_r3                               ; $06A6E3 |
  LDA #$0000                                ; $06A6E6 |
  STA !gsu_r2                               ; $06A6E9 |
  LDA #$7030                                ; $06A6EC |
  STA !gsu_r12                              ; $06A6EF |
  LDA #$0056                                ; $06A6F2 |
  STA !gsu_r13                              ; $06A6F5 |
  LDX #$08                                  ; $06A6F8 |
  LDA #$861B                                ; $06A6FA |
  JSL r_gsu_init_1                          ; $06A6FD |
  LDX $12                                   ; $06A701 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A703 |
  STA !gsu_r6                               ; $06A705 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A708 |
  STA !gsu_r11                              ; $06A70A |
  LDA #$000F                                ; $06A70D |
  STA !gsu_r8                               ; $06A710 |
  LDA #$0000                                ; $06A713 |
  STA !gsu_r9                               ; $06A716 |
  LDA #$0050                                ; $06A719 |
  STA !gsu_r3                               ; $06A71C |
  LDA #$0010                                ; $06A71F |
  STA !gsu_r2                               ; $06A722 |
  LDA #$7020                                ; $06A725 |
  STA !gsu_r12                              ; $06A728 |
  LDA #$0056                                ; $06A72B |
  STA !gsu_r13                              ; $06A72E |
  LDX #$08                                  ; $06A731 |
  LDA #$861B                                ; $06A733 |
  JSL r_gsu_init_1                          ; $06A736 |
  INC $0CF9                                 ; $06A73A |
  LDX $12                                   ; $06A73D |
  RTS                                       ; $06A73F |

; burt sub
CODE_06A740:
  LDX $12                                   ; $06A740 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A742 |
  STA !gsu_r6                               ; $06A744 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A747 |
  STA !gsu_r11                              ; $06A749 |
  LDA #$0010                                ; $06A74C |
  STA !gsu_r8                               ; $06A74F |
  LDA #$001B                                ; $06A752 |
  STA !gsu_r9                               ; $06A755 |
  LDA #$0000                                ; $06A758 |
  STA !gsu_r3                               ; $06A75B |
  LDA #$0000                                ; $06A75E |
  STA !gsu_r2                               ; $06A761 |
  LDA #$80E1                                ; $06A764 |
  STA !gsu_r12                              ; $06A767 |
  LDA #$0054                                ; $06A76A |
  STA !gsu_r13                              ; $06A76D |
  LDX #$08                                  ; $06A770 |
  LDA #$8295                                ; $06A772 |
  JSL r_gsu_init_1                          ; $06A775 |
  INC $0CF9                                 ; $06A779 |
  LDX $12                                   ; $06A77C |
  RTS                                       ; $06A77E |

; burt sub
CODE_06A77F:
  LDA !s_spr_wildcard_1_lo,x                ; $06A77F |
  AND #$00FF                                ; $06A782 |
  STA !gsu_r1                               ; $06A785 |
  LDA !s_spr_cam_x_pos,x                    ; $06A788 |
  STA !gsu_r2                               ; $06A78B |
  LDA !s_spr_cam_y_pos,x                    ; $06A78E |
  STA !gsu_r3                               ; $06A791 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06A794 |
  STA !gsu_r5                               ; $06A796 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06A799 |
  STA !gsu_r7                               ; $06A79B |
  TXA                                       ; $06A79E |
  STA $6012                                 ; $06A79F |
  LDA !s_player_x_cam_rel                   ; $06A7A2 |
  STA $6014                                 ; $06A7A5 |
  LDA !s_player_y_cam_rel                   ; $06A7A8 |
  STA $6016                                 ; $06A7AB |
  LDA !s_player_duck_state                  ; $06A7AE |
  STA $6018                                 ; $06A7B1 |
  LDX #$0A                                  ; $06A7B4 |
  LDA #$897A                                ; $06A7B6 |
  JSL r_gsu_init_3                          ; $06A7B9 |
  JSL $00BE39                               ; $06A7BD |

; DMA args
  dl $7E5040, $703372                       ; $06A7C1 |
  dw $0348                                  ; $06A7C7 |

  LDX $12                                   ; $06A7C9 |
  LDA #$0002                                ; $06A7CB |
  TSB !r_reg_tm_mirror                      ; $06A7CE |
  LDA #$0018                                ; $06A7D1 |
  TSB !r_reg_hdmaen_mirror                  ; $06A7D4 |
  LDX $12                                   ; $06A7D7 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $06A7D9 |
  CPY #$48                                  ; $06A7DC |
  BCS CODE_06A848                           ; $06A7DE |
  LDA $7860,x                               ; $06A7E0 |
  BIT #$0001                                ; $06A7E3 |
  BEQ CODE_06A80B                           ; $06A7E6 |
  LDA !s_spr_y_speed_lo,x                   ; $06A7E8 |
  BMI CODE_06A80B                           ; $06A7EB |
  LDA $6002                                 ; $06A7ED |
  AND #$000F                                ; $06A7F0 |
  STA $00                                   ; $06A7F3 |
  LDA !s_spr_y_pixel_pos,x                  ; $06A7F5 |
  SEC                                       ; $06A7F8 |
  SBC $00                                   ; $06A7F9 |
  STA !s_spr_y_pixel_pos,x                  ; $06A7FB |
  SEP #$20                                  ; $06A7FE |
  STZ !s_spr_y_subpixel_pos,x               ; $06A800 |
  REP #$20                                  ; $06A803 |
  LDA #$0100                                ; $06A805 |
  STA !s_spr_y_speed_lo,x                   ; $06A808 |

CODE_06A80B:
  LDA $7860,x                               ; $06A80B |
  LDY !s_spr_x_speed_hi,x                   ; $06A80E |
  BMI CODE_06A821                           ; $06A811 |
  BNE CODE_06A81A                           ; $06A813 |
  LDY !s_spr_x_speed_lo,x                   ; $06A815 |
  BEQ CODE_06A848                           ; $06A818 |

CODE_06A81A:
  BIT #$0014                                ; $06A81A |
  BEQ CODE_06A848                           ; $06A81D |
  BRA CODE_06A826                           ; $06A81F |

CODE_06A821:
  BIT #$0028                                ; $06A821 |
  BEQ CODE_06A848                           ; $06A824 |

CODE_06A826:
  LDA !s_spr_x_speed_lo,x                   ; $06A826 |
  EOR #$FFFF                                ; $06A829 |
  INC A                                     ; $06A82C |
  STA !s_spr_x_speed_lo,x                   ; $06A82D |
  LDY !s_spr_wildcard_6_lo,x                ; $06A830 |
  BNE CODE_06A848                           ; $06A833 |

CODE_06A835:
  SEP #$20                                  ; $06A835 |
  LDA #$02                                  ; $06A837 |
  STA !s_spr_wildcard_6_lo,x                ; $06A839 |
  LDA #$07                                  ; $06A83C |
  STA !s_spr_wildcard_6_hi,x                ; $06A83E |
  LDA #$04                                  ; $06A841 |
  STA !s_spr_timer_1,x                      ; $06A843 |
  REP #$20                                  ; $06A846 |

CODE_06A848:
  RTS                                       ; $06A848 |

; burt sub
CODE_06A849:
  LDY !s_spr_wildcard_6_lo,x                ; $06A849 |
  BNE CODE_06A85F                           ; $06A84C |
  LDA !s_spr_x_pixel_pos,x                  ; $06A84E |
  SEC                                       ; $06A851 |
  SBC !s_player_center_x                    ; $06A852 |
  STA $00                                   ; $06A855 |
  LDA !s_spr_facing_dir,x                   ; $06A857 |
  DEC A                                     ; $06A85A |
  EOR $00                                   ; $06A85B |
  BPL CODE_06A835                           ; $06A85D |

CODE_06A85F:
  RTS                                       ; $06A85F |

; burt sub
  LDY !s_spr_collision_id,x                 ; $06A860 |
  DEY                                       ; $06A863 |
  BMI CODE_06A8C7                           ; $06A864 |
  BEQ CODE_06A8C7                           ; $06A866 |
  LDA !s_spr_state,y                        ; $06A868 |
  CMP #$0010                                ; $06A86B |
  BNE CODE_06A8C7                           ; $06A86E |
  LDA !s_spr_collision_state,y              ; $06A870 |
  BEQ CODE_06A8C7                           ; $06A873 |
  LDA !s_spr_x_pixel_pos,x                  ; $06A875 |
  SEC                                       ; $06A878 |
  SBC !s_spr_x_hitbox_center,y              ; $06A879 |
  STA $00                                   ; $06A87C |
  EOR #$FFFF                                ; $06A87E |
  INC A                                     ; $06A881 |
  STA !s_spr_x_collision_delta,y            ; $06A882 |
  PHX                                       ; $06A885 |
  TYX                                       ; $06A886 |
  JSL $03B24B                               ; $06A887 |
  PLX                                       ; $06A88B |
  LDA #$0200                                ; $06A88C |
  LDY $01                                   ; $06A88F |
  BPL CODE_06A897                           ; $06A891 |
  EOR #$FFFF                                ; $06A893 |
  INC A                                     ; $06A896 |

CODE_06A897:
  STA !s_spr_x_speed_lo,x                   ; $06A897 |
  LDA #$FE00                                ; $06A89A |
  STA !s_spr_y_speed_lo,x                   ; $06A89D |
  LDA #$0010                                ; $06A8A0 |
  STA !s_spr_gsu_morph_2_lo,x               ; $06A8A3 |
  LDA #$0140                                ; $06A8A6 |
  STA $105E                                 ; $06A8A9 |
  LDA #$00C0                                ; $06A8AC |
  STA $1060                                 ; $06A8AF |
  INC $1062                                 ; $06A8B2 |
  LDA #$0078                                ; $06A8B5 |
  JSL push_sound_queue                      ; $06A8B8 |
  SEP #$20                                  ; $06A8BC |
  LDA #$20                                  ; $06A8BE |
  STA !s_spr_gsu_morph_1_lo,x               ; $06A8C0 |
  REP #$20                                  ; $06A8C3 |
  PLY                                       ; $06A8C5 |
  PLA                                       ; $06A8C6 |

CODE_06A8C7:
  RTL                                       ; $06A8C7 |

; burt sub
CODE_06A8C8:
  LDA #$5F                                  ; $06A8C8 |
  STA $02                                   ; $06A8CA |
  REP #$20                                  ; $06A8CC |
  LDY !s_spr_wildcard_2_lo,x                ; $06A8CE |
  LDA $99B8,y                               ; $06A8D1 |
  STA $00                                   ; $06A8D4 |
  PHY                                       ; $06A8D6 |
  LDX #$1A                                  ; $06A8D7 |

CODE_06A8D9:
  TXY                                       ; $06A8D9 |
  LDA [$00],y                               ; $06A8DA |
  STA $702E2E,x                             ; $06A8DC |
  STA $7020C2,x                             ; $06A8E0 |
  DEX                                       ; $06A8E4 |
  DEX                                       ; $06A8E5 |
  BPL CODE_06A8D9                           ; $06A8E6 |
  PLY                                       ; $06A8E8 |
  LDA $99C4,y                               ; $06A8E9 |
  STA $00                                   ; $06A8EC |
  PHY                                       ; $06A8EE |
  LDX #$06                                  ; $06A8EF |

CODE_06A8F1:
  TXY                                       ; $06A8F1 |
  LDA [$00],y                               ; $06A8F2 |
  STA $702F3C,x                             ; $06A8F4 |
  STA $7021D0,x                             ; $06A8F8 |
  DEX                                       ; $06A8FC |
  DEX                                       ; $06A8FD |
  BPL CODE_06A8F1                           ; $06A8FE |
  PLY                                       ; $06A900 |
  LDA $99D0,y                               ; $06A901 |
  STA $00                                   ; $06A904 |
  LDX #$06                                  ; $06A906 |

CODE_06A908:
  TXY                                       ; $06A908 |
  LDA [$00],y                               ; $06A909 |
  STA $702F5C,x                             ; $06A90B |
  STA $7021F0,x                             ; $06A90F |
  DEX                                       ; $06A913 |
  DEX                                       ; $06A914 |
  BPL CODE_06A908                           ; $06A915 |
  SEP #$20                                  ; $06A917 |
  LDX $12                                   ; $06A919 |
  RTS                                       ; $06A91B |

  dw $0200                                  ; $06A91C |
  dw $0100                                  ; $06A91E |

; burt sub
CODE_06A920:
  LDY #$00                                  ; $06A920 |
  LDA !s_spr_x_pixel_pos,x                  ; $06A922 |
  SEC                                       ; $06A925 |
  SBC !s_player_x                           ; $06A926 |
  BMI CODE_06A92D                           ; $06A929 |
  INY                                       ; $06A92B |
  INY                                       ; $06A92C |

CODE_06A92D:
  LDA $A91C,y                               ; $06A92D |
  STA $617A                                 ; $06A930 |
  RTS                                       ; $06A933 |

; burt sub
CODE_06A934:
  LDA !s_spr_x_pixel_pos,x                  ; $06A934 |
  SEC                                       ; $06A937 |
  SBC !s_player_x                           ; $06A938 |
  CLC                                       ; $06A93B |
  ADC #$0060                                ; $06A93C |
  CMP #$00C0                                ; $06A93F |
  BCS CODE_06A947                           ; $06A942 |
  STZ $617A                                 ; $06A944 |

CODE_06A947:
  RTS                                       ; $06A947 |

  dl $5FA570                                ; $06A948 |
  dl $702E2E                                ; $06A94B |
  dl $702E2E                                ; $06A94E |
  dl $702E2E                                ; $06A951 |
  dl $5FA570                                ; $06A954 |
  dl $702E4E                                ; $06A957 |
  dl $702E4E                                ; $06A95A |
  dl $702E4E                                ; $06A95D |
  dl $5FA570                                ; $06A960 |
  dl $702F2E                                ; $06A963 |
  dl $702F2E                                ; $06A966 |
  dl $702F2E                                ; $06A969 |
  dl $5FA570                                ; $06A96C |
  dl $702F4E                                ; $06A96F |
  dl $702F4E                                ; $06A972 |
  dl $702F4E                                ; $06A975 |

; burt sub
CODE_06A978:
  LDA $14                                   ; $06A978 |
  AND #$0003                                ; $06A97A |
  STA $00                                   ; $06A97D |
  ASL A                                     ; $06A97F |
  CLC                                       ; $06A980 |
  ADC $00                                   ; $06A981 |
  TAX                                       ; $06A983 |

CODE_06A984:
  LDA $A948,x                               ; $06A984 |
  STA $00                                   ; $06A987 |
  LDY $A94A,x                               ; $06A989 |
  STY $02                                   ; $06A98C |
  LDA #$20C2                                ; $06A98E |
  STA $04                                   ; $06A991 |
  LDY #$70                                  ; $06A993 |
  STY $06                                   ; $06A995 |
  LDY #$1C                                  ; $06A997 |

CODE_06A999:
  LDA [$00],y                               ; $06A999 |
  STA [$04],y                               ; $06A99B |
  DEY                                       ; $06A99D |
  DEY                                       ; $06A99E |
  BPL CODE_06A999                           ; $06A99F |
  LDA $A954,x                               ; $06A9A1 |
  STA $00                                   ; $06A9A4 |
  LDY $A956,x                               ; $06A9A6 |
  STY $02                                   ; $06A9A9 |
  LDA #$20E2                                ; $06A9AB |
  STA $04                                   ; $06A9AE |
  LDY #$70                                  ; $06A9B0 |
  STY $06                                   ; $06A9B2 |
  LDY #$1C                                  ; $06A9B4 |

CODE_06A9B6:
  LDA [$00],y                               ; $06A9B6 |
  STA [$04],y                               ; $06A9B8 |
  DEY                                       ; $06A9BA |
  DEY                                       ; $06A9BB |
  BPL CODE_06A9B6                           ; $06A9BC |
  LDA $A960,x                               ; $06A9BE |
  STA $00                                   ; $06A9C1 |
  LDY $A962,x                               ; $06A9C3 |
  STY $02                                   ; $06A9C6 |
  LDA #$21C2                                ; $06A9C8 |
  STA $04                                   ; $06A9CB |
  LDY #$70                                  ; $06A9CD |
  STY $06                                   ; $06A9CF |
  LDY #$1C                                  ; $06A9D1 |

CODE_06A9D3:
  LDA [$00],y                               ; $06A9D3 |
  STA [$04],y                               ; $06A9D5 |
  DEY                                       ; $06A9D7 |
  DEY                                       ; $06A9D8 |
  BPL CODE_06A9D3                           ; $06A9D9 |
  LDA $A96C,x                               ; $06A9DB |
  STA $00                                   ; $06A9DE |
  LDY $A96E,x                               ; $06A9E0 |
  STY $02                                   ; $06A9E3 |
  LDA #$21E2                                ; $06A9E5 |
  STA $04                                   ; $06A9E8 |
  LDY #$70                                  ; $06A9EA |
  STY $06                                   ; $06A9EC |
  LDY #$1C                                  ; $06A9EE |

CODE_06A9F0:
  LDA [$00],y                               ; $06A9F0 |
  STA [$04],y                               ; $06A9F2 |
  DEY                                       ; $06A9F4 |
  DEY                                       ; $06A9F5 |
  BPL CODE_06A9F0                           ; $06A9F6 |
  LDX $12                                   ; $06A9F8 |
  RTS                                       ; $06A9FA |

; burt sub
CODE_06A9FB:
  LDY !s_spr_wildcard_2_lo,x                ; $06A9FB |
  BEQ CODE_06AA24                           ; $06A9FE |
  LDA !r_frame_counter_global               ; $06AA00 |
  AND #$0003                                ; $06AA03 |
  CMP #$0002                                ; $06AA06 |
  BCS CODE_06AA11                           ; $06AA09 |
  LDA #$0002                                ; $06AA0B |
  TRB !r_reg_tm_mirror                      ; $06AA0E |

CODE_06AA11:
  LDA !r_reg_tm_mirror                      ; $06AA11 |
  BIT #$0002                                ; $06AA14 |
  BEQ CODE_06AA1E                           ; $06AA17 |
  LDA #$0005                                ; $06AA19 |
  BRA CODE_06AA21                           ; $06AA1C |

CODE_06AA1E:
  LDA #$FFFF                                ; $06AA1E |

CODE_06AA21:
  STA !s_spr_draw_priority,x                ; $06AA21 |

CODE_06AA24:
  RTS                                       ; $06AA24 |

  dw $FF80, $0080                           ; $06AA25 |

init_marching_milde:
  LDA #$00D2                                ; $06AA29 |
  LDY #$04                                  ; $06AA2C |
  JSL spawn_sprite_active_y                 ; $06AA2E |
  LDA #$0080                                ; $06AA32 |
  STA !s_cam_x_right_boundary               ; $06AA35 |
  LDA !s_spr_x_pixel_pos,x                  ; $06AA38 |
  STA !s_spr_x_pixel_pos,y                  ; $06AA3B |
  LDA !s_spr_y_pixel_pos,x                  ; $06AA3E |
  STA !s_spr_y_pixel_pos,y                  ; $06AA41 |
  TYX                                       ; $06AA44 |
  LDA #$FFF0                                ; $06AA45 |
  STA $1013                                 ; $06AA48 |
  JSL $03AEEB                               ; $06AA4B |
  LDY #$2A                                  ; $06AA4F |
  JSL $0CE5D6                               ; $06AA51 |
  LDX $12                                   ; $06AA55 |
  JML $03A32E                               ; $06AA57 |

  dw $FFF9, $FFFA                           ; $06AA5B |
  dw $FFFB, $FFFC                           ; $06AA5F |
  dw $FFFD, $FFFE                           ; $06AA63 |
  dw $FFFF, $0000                           ; $06AA67 |
  dw $0000, $FFFF                           ; $06AA6B |
  dw $FFFE, $FFFD                           ; $06AA6F |
  dw $FFFC, $FFFB                           ; $06AA73 |
  dw $FFFA, $FFF9                           ; $06AA77 |

  dw $AA91                                  ; $06AA7B |
  dw $AABB                                  ; $06AA7D |
  dw $AB08                                  ; $06AA7F |
  dw $AB1A                                  ; $06AA81 |
  dw $AB67                                  ; $06AA83 |
  dw $AC4C                                  ; $06AA85 |
  dw $AD12                                  ; $06AA87 |
  dw $AB2B                                  ; $06AA89 |

main_marching_milde:
  LDX $105C                                 ; $06AA8B |
  JMP ($AA7B,x)                             ; $06AA8E |

; milde sub
  LDX $12                                   ; $06AA91 |
  LDA #$FFC0                                ; $06AA93 |
  STA !s_spr_x_speed_lo,x                   ; $06AA96 |
  LDY #$07                                  ; $06AA99 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $06AA9B |
  SEP #$20                                  ; $06AA9D |
  LDA $AAB3,y                               ; $06AA9F |
  STA !s_spr_anim_frame,x                   ; $06AAA2 |
  LDA #$08                                  ; $06AAA5 |
  STA !s_spr_timer_1,x                      ; $06AAA7 |
  REP #$20                                  ; $06AAAA |
  INC $105C                                 ; $06AAAC |
  INC $105C                                 ; $06AAAF |
  RTL                                       ; $06AAB2 |

  db $01, $02, $03, $04                     ; $06AAB3 |
  db $03, $02, $01, $00                     ; $06AAB7 |

; milde sub
  LDX $12                                   ; $06AABB |
  JSL $03AF23                               ; $06AABD |
  LDA !s_spr_x_pixel_pos,x                  ; $06AAC1 |
  CMP #$00C0                                ; $06AAC4 |
  BCC CODE_06AAE7                           ; $06AAC7 |
  LDA !s_spr_timer_1,x                      ; $06AAC9 |
  BNE CODE_06AAE6                           ; $06AACC |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $06AACE |
  DEY                                       ; $06AAD0 |
  BPL CODE_06AAD5                           ; $06AAD1 |
  LDY #$07                                  ; $06AAD3 |

CODE_06AAD5:
  STY !s_spr_wildcard_4_lo_dp,x             ; $06AAD5 |
  SEP #$20                                  ; $06AAD7 |
  LDA $AAB3,y                               ; $06AAD9 |
  STA !s_spr_anim_frame,x                   ; $06AADC |
  LDA #$08                                  ; $06AADF |
  STA !s_spr_timer_1,x                      ; $06AAE1 |
  REP #$20                                  ; $06AAE4 |

CODE_06AAE6:
  RTL                                       ; $06AAE6 |

CODE_06AAE7:
  STZ !s_spr_x_speed_lo,x                   ; $06AAE7 |
  LDA #$0001                                ; $06AAEA |
  STA !s_spr_anim_frame,x                   ; $06AAED |
  LDA #$0001                                ; $06AAF0 |
  STA $1015                                 ; $06AAF3 |
  LDX $12                                   ; $06AAF6 |
  LDA #$0080                                ; $06AAF8 |
  STA !s_spr_timer_1,x                      ; $06AAFB |
  INC $1015                                 ; $06AAFE |
  INC $105C                                 ; $06AB01 |
  INC $105C                                 ; $06AB04 |
  RTL                                       ; $06AB07 |

; milde sub
  LDX $12                                   ; $06AB08 |
  JSL $03AF23                               ; $06AB0A |
  LDA $1015                                 ; $06AB0E |
  BPL CODE_06AB19                           ; $06AB11 |
  INC $105C                                 ; $06AB13 |
  INC $105C                                 ; $06AB16 |

CODE_06AB19:
  RTL                                       ; $06AB19 |

; milde sub
  LDX $12                                   ; $06AB1A |
  LDA !s_spr_timer_1,x                      ; $06AB1C |
  BNE CODE_06AB2A                           ; $06AB1F |
  STZ $1015                                 ; $06AB21 |
  INC $105C                                 ; $06AB24 |
  INC $105C                                 ; $06AB27 |

CODE_06AB2A:
  RTL                                       ; $06AB2A |

; milde sub
  LDX $12                                   ; $06AB2B |
  JSL $03AF23                               ; $06AB2D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AB31 |
  BNE CODE_06AB63                           ; $06AB33 |
  LDA $1013                                 ; $06AB35 |
  BEQ CODE_06AB5C                           ; $06AB38 |
  LDX #$09                                  ; $06AB3A |
  LDA #$AF4A                                ; $06AB3C |
  JSL r_gsu_init_1                          ; $06AB3F |
  LDX $12                                   ; $06AB43 |
  LDA !gsu_r11                              ; $06AB45 |
  BPL CODE_06AB62                           ; $06AB48 |
  LDA !s_spr_x_pixel_pos,x                  ; $06AB4A |
  STA $00                                   ; $06AB4D |
  LDA !s_spr_y_pixel_pos,x                  ; $06AB4F |
  SEC                                       ; $06AB52 |
  SBC #$0008                                ; $06AB53 |
  STA $02                                   ; $06AB56 |
  JSL $02E19C                               ; $06AB58 |

CODE_06AB5C:
  JSL $02A982                               ; $06AB5C |
  INC !s_spr_wildcard_4_lo_dp,x             ; $06AB60 |

CODE_06AB62:
  RTL                                       ; $06AB62 |

CODE_06AB63:
  JML $03A32E                               ; $06AB63 |

; milde sub
  LDX $12                                   ; $06AB67 |
  LDA !s_spr_oam_1,x                        ; $06AB69 |
  AND #$07FC                                ; $06AB6C |
  ORA #$0002                                ; $06AB6F |
  STA !s_spr_oam_1,x                        ; $06AB72 |
  LDY #$1E                                  ; $06AB75 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $06AB77 |
  LDY #$00                                  ; $06AB79 |
  STA !s_spr_wildcard_6_hi_dp,x             ; $06AB7B |
  LDA #$0020                                ; $06AB7D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AB80 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AB82 |
  LSR A                                     ; $06AB84 |
  LSR A                                     ; $06AB85 |
  LSR A                                     ; $06AB86 |
  LSR A                                     ; $06AB87 |
  AND #$001E                                ; $06AB88 |
  TAY                                       ; $06AB8B |
  LDA $AC3A,y                               ; $06AB8C |
  STA !s_spr_y_terrain_offset,x             ; $06AB8F |
  LDA !s_spr_y_pixel_pos,x                  ; $06AB92 |
  SEC                                       ; $06AB95 |
  SBC !s_spr_y_terrain_offset,x             ; $06AB96 |
  STA !s_spr_y_pixel_pos,x                  ; $06AB99 |
  LDA #$0FFF                                ; $06AB9C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06AB9F |
  CLC                                       ; $06ABA1 |
  ADC #$2000                                ; $06ABA2 |
  XBA                                       ; $06ABA5 |
  LSR A                                     ; $06ABA6 |
  LSR A                                     ; $06ABA7 |
  LSR A                                     ; $06ABA8 |
  AND #$0007                                ; $06ABA9 |
  STA !s_spr_anim_frame,x                   ; $06ABAC |
  LDX #$1E                                  ; $06ABAF |

CODE_06ABB1:
  LDA $5FE6BC,x                             ; $06ABB1 |
  STA $702E4E,x                             ; $06ABB5 |
  STA $7020E2,x                             ; $06ABB9 |
  DEX                                       ; $06ABBD |
  DEX                                       ; $06ABBE |
  BPL CODE_06ABB1                           ; $06ABBF |
  LDX $12                                   ; $06ABC1 |
  SEP #$20                                  ; $06ABC3 |
  LDA #$0F                                  ; $06ABC5 |
  STA $4331                                 ; $06ABC7 |
  LDA #$10                                  ; $06ABCA |
  STA $4341                                 ; $06ABCC |
  REP #$20                                  ; $06ABCF |
  LDA #$0030                                ; $06ABD1 |
  STA $6126                                 ; $06ABD4 |
  LDA !s_spr_oam_yxppccct                   ; $06ABD7 |
  AND #$FFCF                                ; $06ABDA |
  ORA #$0030                                ; $06ABDD |
  STA !s_spr_oam_yxppccct                   ; $06ABE0 |
  LDA #$0510                                ; $06ABE3 |
  STA !r_reg_tm_mirror                      ; $06ABE6 |
  JSR CODE_06B223                           ; $06ABE9 |
  LDA #$0087                                ; $06ABEC |
  JSL push_sound_queue                      ; $06ABEF |
  INC $105C                                 ; $06ABF3 |
  INC $105C                                 ; $06ABF6 |
  RTL                                       ; $06ABF9 |

  dw $0110, $0100                           ; $06ABFA |
  dw $00F0, $00E0                           ; $06ABFE |
  dw $00D0, $00C0                           ; $06AC02 |
  dw $00B0, $00A0                           ; $06AC06 |
  dw $0090, $0080                           ; $06AC0A |
  dw $0070, $0060                           ; $06AC0E |
  dw $0050, $0040                           ; $06AC12 |
  dw $0030, $0020                           ; $06AC16 |

  dw $0100, $00F0                           ; $06AC1A |
  dw $00E0, $00D0                           ; $06AC1E |
  dw $00C0, $00B0                           ; $06AC22 |
  dw $00A0, $0090                           ; $06AC26 |
  dw $0080, $0070                           ; $06AC2A |
  dw $0060, $0050                           ; $06AC2E |
  dw $0040, $0030                           ; $06AC32 |
  dw $0020, $0050                           ; $06AC36 |

  dw $FFF6, $FFF6                           ; $06AC3A |
  dw $FFF8, $FFF9                           ; $06AC3E |
  dw $FFFA, $FFFB                           ; $06AC42 |
  dw $FFFC, $FFFD                           ; $06AC46 |
  dw $FFFE                                  ; $06AC4A |

; milde sub
  LDX $12                                   ; $06AC4C |
  LDA #$0001                                ; $06AC4F |
  JSR CODE_06B072                           ; $06AC51 |
  JSR CODE_06B2DC                           ; $06AC54 |
  LDA !r_msg_box_state                      ; $06AC57 |
  BNE CODE_06AC5F                           ; $06AC5A |
  JSR CODE_06B223                           ; $06AC5C |

CODE_06AC5F:
  JSL $03AF23                               ; $06AC5F |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $06AC63 |
  TYX                                       ; $06AC65 |
  JMP ($AC69,x)                             ; $06AC66 |

  dw $AC6F                                  ; $06AC69 |
  dw $AC9A                                  ; $06AC6B |
  dw $ACF5                                  ; $06AC6D |

; milde sub
  LDX $12                                   ; $06AC6F |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $06AC71 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AC73 |
  CLC                                       ; $06AC75 |
  ADC #$0004                                ; $06AC76 |
  CMP $ABFA,y                               ; $06AC79 |
  BCS CODE_06AC91                           ; $06AC7C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AC7E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AC80 |
  LSR A                                     ; $06AC82 |
  LSR A                                     ; $06AC83 |
  LSR A                                     ; $06AC84 |
  LSR A                                     ; $06AC85 |
  AND #$001E                                ; $06AC86 |
  TAY                                       ; $06AC89 |
  LDA $AC3A,y                               ; $06AC8A |
  STA !s_spr_y_terrain_offset,x             ; $06AC8D |
  RTL                                       ; $06AC90 |

CODE_06AC91:
  SEP #$20                                  ; $06AC91 |
  INC !s_spr_wildcard_6_hi_dp,x             ; $06AC93 |
  INC !s_spr_wildcard_6_hi_dp,x             ; $06AC95 |
  REP #$20                                  ; $06AC97 |
  RTL                                       ; $06AC99 |

; milde sub
  LDX $12                                   ; $06AC9A |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $06AC9C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AC9E |
  SEC                                       ; $06ACA0 |
  SBC #$0004                                ; $06ACA1 |
  CMP $AC1A,y                               ; $06ACA4 |
  BCC CODE_06ACBC                           ; $06ACA7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06ACA9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06ACAB |
  LSR A                                     ; $06ACAD |
  LSR A                                     ; $06ACAE |
  LSR A                                     ; $06ACAF |
  LSR A                                     ; $06ACB0 |
  AND #$001E                                ; $06ACB1 |
  TAY                                       ; $06ACB4 |
  LDA $AC3A,y                               ; $06ACB5 |
  STA !s_spr_y_terrain_offset,x             ; $06ACB8 |
  RTL                                       ; $06ACBB |

CODE_06ACBC:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $06ACBC |
  DEY                                       ; $06ACBE |
  DEY                                       ; $06ACBF |
  BMI CODE_06ACCD                           ; $06ACC0 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $06ACC2 |
  SEP #$20                                  ; $06ACC4 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $06ACC6 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $06ACC8 |
  REP #$20                                  ; $06ACCA |
  RTL                                       ; $06ACCC |

CODE_06ACCD:
  LDA #$0080                                ; $06ACCD |
  STA !s_spr_timer_1,x                      ; $06ACD0 |
  LDA #$0100                                ; $06ACD3 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06ACD6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06ACD8 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06ACDA |
  CLC                                       ; $06ACDC |
  ADC #$2000                                ; $06ACDD |
  XBA                                       ; $06ACE0 |
  LSR A                                     ; $06ACE1 |
  AND #$001E                                ; $06ACE2 |
  TAY                                       ; $06ACE5 |
  LDA $AA5B,y                               ; $06ACE6 |
  STA !s_spr_y_terrain_offset,x             ; $06ACE9 |
  SEP #$20                                  ; $06ACEC |
  INC !s_spr_wildcard_6_hi_dp,x             ; $06ACEE |
  INC !s_spr_wildcard_6_hi_dp,x             ; $06ACF0 |
  REP #$20                                  ; $06ACF2 |
  RTL                                       ; $06ACF4 |

; milde sub
  LDA !s_spr_timer_1,x                      ; $06ACF5 |
  BNE CODE_06AD11                           ; $06ACF8 |
  LDA #$0100                                ; $06ACFA |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06ACFD |
  LDY !s_spr_facing_dir,x                   ; $06ACFF |
  LDA $AA25,y                               ; $06AD02 |
  STA !s_spr_x_speed_lo,x                   ; $06AD05 |
  STZ !s_player_state                       ; $06AD08 |
  INC $105C                                 ; $06AD0B |
  INC $105C                                 ; $06AD0E |

CODE_06AD11:
  RTL                                       ; $06AD11 |

; milde sub
  LDX $12                                   ; $06AD12 |
  LDA #$0000                                ; $06AD14 |
  JSR CODE_06B072                           ; $06AD17 |
  JSR CODE_06B2DC                           ; $06AD1A |
  LDA !r_msg_box_state                      ; $06AD1D |
  BNE CODE_06AD25                           ; $06AD20 |
  JSR CODE_06B0FD                           ; $06AD22 |

CODE_06AD25:
  JSL $03AF23                               ; $06AD25 |
  JSR CODE_06AFA7                           ; $06AD29 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $06AD2C |
  TYX                                       ; $06AD2F |
  JMP ($AD33,x)                             ; $06AD30 |

  dw $AD47                                  ; $06AD33 |
  dw $ADA5                                  ; $06AD35 |
  dw $ADCC                                  ; $06AD37 |
  dw $AE08                                  ; $06AD39 |
  dw $AE44                                  ; $06AD3B |
  dw $AEA0                                  ; $06AD3D |
  dw $AEDD                                  ; $06AD3F |
  dw $AF09                                  ; $06AD41 |

  dw $0028                                  ; $06AD43 |
  dw $0014                                  ; $06AD45 |

; milde sub
  LDX $12                                   ; $06AD47 |
  LDY !s_spr_facing_dir,x                   ; $06AD49 |
  LDA $7860,x                               ; $06AD4C |
  AND $AD43,y                               ; $06AD4F |
  BEQ CODE_06AD5E                           ; $06AD52 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06AD54 |
  XBA                                       ; $06AD57 |
  ORA #$0002                                ; $06AD58 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06AD5B |

CODE_06AD5E:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06AD5E |
  SEC                                       ; $06AD60 |
  SBC !s_spr_wildcard_6_lo_dp,x             ; $06AD61 |
  STA $00                                   ; $06AD63 |
  CLC                                       ; $06AD65 |
  ADC #$2000                                ; $06AD66 |
  CMP #$4000                                ; $06AD69 |
  BCC CODE_06AD7A                           ; $06AD6C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06AD6E |
  EOR #$FFFF                                ; $06AD70 |
  INC A                                     ; $06AD73 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06AD74 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06AD76 |
  BRA CODE_06AD7E                           ; $06AD78 |

CODE_06AD7A:
  LDA $00                                   ; $06AD7A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06AD7C |

CODE_06AD7E:
  CLC                                       ; $06AD7E |
  ADC #$2000                                ; $06AD7F |
  XBA                                       ; $06AD82 |
  LSR A                                     ; $06AD83 |
  PHA                                       ; $06AD84 |
  LSR A                                     ; $06AD85 |
  LSR A                                     ; $06AD86 |
  AND #$0007                                ; $06AD87 |
  STA !s_spr_anim_frame,x                   ; $06AD8A |
  PLA                                       ; $06AD8D |
  AND #$001E                                ; $06AD8E |
  TAY                                       ; $06AD91 |
  LDA $AA5B,y                               ; $06AD92 |
  STA !s_spr_y_terrain_offset,x             ; $06AD95 |
  RTL                                       ; $06AD98 |

  db $03, $06, $08, $08                     ; $06AD99 |
  db $06, $03, $00, $00                     ; $06AD9D |
  db $02, $00, $00, $00                     ; $06ADA1 |

; milde sub
  LDX $12                                   ; $06ADA5 |
  LDY !s_spr_anim_frame,x                   ; $06ADA7 |
  CPY #$03                                  ; $06ADAA |
  BEQ CODE_06ADB0                           ; $06ADAC |
  BRA CODE_06AD5E                           ; $06ADAE |

CODE_06ADB0:
  SEP #$20                                  ; $06ADB0 |
  LDA #$05                                  ; $06ADB2 |
  STA !s_spr_gsu_morph_2_lo,x               ; $06ADB4 |
  TAY                                       ; $06ADB7 |
  LDA $AD99,y                               ; $06ADB8 |
  STA !s_spr_anim_frame,x                   ; $06ADBB |
  LDA #$04                                  ; $06ADBE |
  STA !s_spr_timer_1,x                      ; $06ADC0 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06ADC3 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06ADC6 |
  REP #$20                                  ; $06ADC9 |
  RTL                                       ; $06ADCB |

; milde sub
  LDX $12                                   ; $06ADCC |
  LDA !s_spr_timer_1,x                      ; $06ADCE |
  BNE CODE_06ADF3                           ; $06ADD1 |
  SEP #$20                                  ; $06ADD3 |
  DEC !s_spr_gsu_morph_2_lo,x               ; $06ADD5 |
  BMI CODE_06ADF4                           ; $06ADD8 |
  LDA #$04                                  ; $06ADDA |
  STA !s_spr_timer_1,x                      ; $06ADDC |
  LDY !s_spr_gsu_morph_2_lo,x               ; $06ADDF |
  LDA $AD99,y                               ; $06ADE2 |
  STA !s_spr_anim_frame,x                   ; $06ADE5 |
  LDA !s_spr_facing_dir,x                   ; $06ADE8 |
  EOR $AD9F,y                               ; $06ADEB |
  STA !s_spr_facing_dir,x                   ; $06ADEE |
  REP #$20                                  ; $06ADF1 |

CODE_06ADF3:
  RTL                                       ; $06ADF3 |

CODE_06ADF4:
  STZ !s_spr_gsu_morph_1_lo,x               ; $06ADF4 |
  LDA #$03                                  ; $06ADF7 |
  STA !s_spr_anim_frame,x                   ; $06ADF9 |
  REP #$20                                  ; $06ADFC |
  LDY !s_spr_facing_dir,x                   ; $06ADFE |
  LDA $AA25,y                               ; $06AE01 |
  STA !s_spr_x_speed_lo,x                   ; $06AE04 |
  RTL                                       ; $06AE07 |

; milde sub
  LDX $12                                   ; $06AE08 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06AE0A |
  SEC                                       ; $06AE0C |
  SBC !s_spr_wildcard_1_lo,x                ; $06AE0D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AE10 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AE12 |
  CLC                                       ; $06AE14 |
  ADC !s_spr_wildcard_1_lo,x                ; $06AE15 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AE18 |
  CMP #$00FC                                ; $06AE1A |
  BCS CODE_06AE26                           ; $06AE1D |
  LDA #$0004                                ; $06AE1F |
  STA !s_spr_wildcard_1_lo,x                ; $06AE22 |
  RTL                                       ; $06AE25 |

CODE_06AE26:
  CMP #$0100                                ; $06AE26 |
  BCS CODE_06AE2C                           ; $06AE29 |
  RTL                                       ; $06AE2B |

CODE_06AE2C:
  LDA #$0100                                ; $06AE2C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AE2F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AE31 |
  LDA #$FFFC                                ; $06AE33 |
  STA !s_spr_wildcard_1_lo,x                ; $06AE36 |
  SEP #$20                                  ; $06AE39 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AE3B |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AE3E |
  REP #$20                                  ; $06AE41 |
  RTL                                       ; $06AE43 |

; milde sub
  LDX $12                                   ; $06AE44 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AE46 |
  SEC                                       ; $06AE48 |
  SBC !s_spr_wildcard_1_lo,x                ; $06AE49 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AE4C |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06AE4E |
  CLC                                       ; $06AE50 |
  ADC !s_spr_wildcard_1_lo,x                ; $06AE51 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AE54 |
  CMP #$00FC                                ; $06AE56 |
  BCS CODE_06AE62                           ; $06AE59 |
  LDA #$0004                                ; $06AE5B |
  STA !s_spr_wildcard_1_lo,x                ; $06AE5E |
  RTL                                       ; $06AE61 |

CODE_06AE62:
  CMP #$0100                                ; $06AE62 |
  BCS CODE_06AE68                           ; $06AE65 |
  RTL                                       ; $06AE67 |

CODE_06AE68:
  LDA #$0100                                ; $06AE68 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AE6B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AE6D |
  LDA #$FFFC                                ; $06AE6F |
  STA !s_spr_wildcard_1_lo,x                ; $06AE72 |
  SEP #$20                                  ; $06AE75 |
  DEC !s_spr_wildcard_2_lo,x                ; $06AE77 |
  BMI CODE_06AE85                           ; $06AE7A |
  DEC !s_spr_gsu_morph_1_lo,x               ; $06AE7C |
  DEC !s_spr_gsu_morph_1_lo,x               ; $06AE7F |
  REP #$20                                  ; $06AE82 |
  RTL                                       ; $06AE84 |

CODE_06AE85:
  STZ !s_spr_gsu_morph_1_lo,x               ; $06AE85 |
  REP #$20                                  ; $06AE88 |
  LDY !s_spr_facing_dir,x                   ; $06AE8A |
  LDA $AA25,y                               ; $06AE8D |
  STA !s_spr_x_speed_lo,x                   ; $06AE90 |
  RTL                                       ; $06AE93 |

  dw $FF00, $0100                           ; $06AE94 |
  dw $0000, $0002                           ; $06AE98 |
  dw $FFEC, $001C                           ; $06AE9C |

; milde sub
  LDX $12                                   ; $06AEA0 |
  STZ !s_player_y_speed                     ; $06AEA2 |
  LDA $105E                                 ; $06AEA5 |
  BIT #$0001                                ; $06AEA8 |
  BEQ CODE_06AEB7                           ; $06AEAB |
  LDA !s_player_y                           ; $06AEAD |
  CLC                                       ; $06AEB0 |
  ADC $1060                                 ; $06AEB1 |
  STA !s_player_y                           ; $06AEB4 |

CODE_06AEB7:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06AEB7 |
  SEC                                       ; $06AEB9 |
  SBC #$0010                                ; $06AEBA |
  CMP #$0030                                ; $06AEBD |
  BCC CODE_06AECD                           ; $06AEC0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06AEC2 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06AEC4 |
  CLC                                       ; $06AEC6 |
  ADC #$0010                                ; $06AEC7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AECA |
  RTL                                       ; $06AECC |

CODE_06AECD:
  SEP #$20                                  ; $06AECD |
  LDA #$08                                  ; $06AECF |
  STA !s_spr_timer_1,x                      ; $06AED1 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AED4 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AED7 |
  REP #$20                                  ; $06AEDA |
  RTL                                       ; $06AEDC |

; milde sub
  LDX $12                                   ; $06AEDD |
  STZ !s_player_y_speed                     ; $06AEDF |
  LDA $105E                                 ; $06AEE2 |
  BIT #$0001                                ; $06AEE5 |
  BEQ CODE_06AEF4                           ; $06AEE8 |
  LDA !s_player_y                           ; $06AEEA |
  CLC                                       ; $06AEED |
  ADC $1060                                 ; $06AEEE |
  STA !s_player_y                           ; $06AEF1 |

CODE_06AEF4:
  LDA !s_spr_timer_1,x                      ; $06AEF4 |
  BNE CODE_06AF08                           ; $06AEF7 |
  SEP #$20                                  ; $06AEF9 |
  LDA #$FF                                  ; $06AEFB |
  STA !s_spr_draw_priority,x                ; $06AEFD |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AF00 |
  INC !s_spr_gsu_morph_1_lo,x               ; $06AF03 |
  REP #$20                                  ; $06AF06 |

CODE_06AF08:
  RTL                                       ; $06AF08 |

; milde sub
  LDX $12                                   ; $06AF09 |
  JSL $03AEFD                               ; $06AF0B |
  LDA #$0085                                ; $06AF0F |
  JSL push_sound_queue                      ; $06AF12 |
  LDA #$012E                                ; $06AF16 |
  JSL spawn_sprite_active                   ; $06AF19 |
  LDA !s_spr_x_pixel_pos,x                  ; $06AF1D |
  STA !s_spr_x_pixel_pos,y                  ; $06AF20 |
  LDA !s_spr_y_pixel_pos,x                  ; $06AF23 |
  STA !s_spr_y_pixel_pos,y                  ; $06AF26 |
  LDA #$0002                                ; $06AF29 |
  STA !s_spr_wildcard_5_lo,y                ; $06AF2C |
  LDA #$0001                                ; $06AF2F |
  STA $00                                   ; $06AF32 |

CODE_06AF34:
  LDA #$00D3                                ; $06AF34 |
  JSL spawn_sprite_init                     ; $06AF37 |
  LDA #$0020                                ; $06AF3B |
  STA !s_spr_timer_3,y                      ; $06AF3E |
  LDA #$0030                                ; $06AF41 |
  STA !s_spr_timer_1,y                      ; $06AF44 |
  LDA #$0002                                ; $06AF47 |
  STA !s_spr_wildcard_5_lo,y                ; $06AF4A |
  LDA #$FC00                                ; $06AF4D |
  STA !s_spr_y_speed_lo,y                   ; $06AF50 |
  LDA $7860,y                               ; $06AF53 |
  AND #$FFFE                                ; $06AF56 |
  STA $7860,y                               ; $06AF59 |
  LDA !s_spr_y_pixel_pos,x                  ; $06AF5C |
  SEC                                       ; $06AF5F |
  SBC #$0030                                ; $06AF60 |
  STA !s_spr_y_pixel_pos,y                  ; $06AF63 |
  LDA !s_spr_oam_1,y                        ; $06AF66 |
  AND #$FFF3                                ; $06AF69 |
  STA !s_spr_oam_1,y                        ; $06AF6C |
  PHX                                       ; $06AF6F |
  LDA $00                                   ; $06AF70 |
  ASL A                                     ; $06AF72 |
  TAX                                       ; $06AF73 |
  LDA $AE94,x                               ; $06AF74 |
  STA !s_spr_x_speed_lo,y                   ; $06AF77 |
  LDA $AE98,x                               ; $06AF7A |
  STA !s_spr_facing_dir,y                   ; $06AF7D |
  LDA $AE9C,x                               ; $06AF80 |
  PLX                                       ; $06AF83 |
  CLC                                       ; $06AF84 |
  ADC !s_spr_x_pixel_pos,x                  ; $06AF85 |
  STA !s_spr_x_pixel_pos,y                  ; $06AF88 |
  DEC $00                                   ; $06AF8B |
  BPL CODE_06AF34                           ; $06AF8D |
  STZ !s_player_state                       ; $06AF8F |
  LDA #$0002                                ; $06AF92 |
  TRB !r_reg_tm_mirror                      ; $06AF95 |
  TRB !r_reg_ts_mirror                      ; $06AF98 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $06AF9B |
  STZ !s_spr_timer_1,x                      ; $06AF9D |
  INC $105C                                 ; $06AFA0 |
  INC $105C                                 ; $06AFA3 |
  RTL                                       ; $06AFA6 |

; milde sub
CODE_06AFA7:
  LDY !s_spr_draw_priority,x                ; $06AFA7 |
  CPY #$FF                                  ; $06AFAA |
  BEQ CODE_06B029                           ; $06AFAC |
  LDY !s_spr_collision_id,x                 ; $06AFAE |
  DEY                                       ; $06AFB1 |
  BMI CODE_06B016                           ; $06AFB2 |
  BEQ CODE_06B016                           ; $06AFB4 |
  LDA !s_spr_state,y                        ; $06AFB6 |
  CMP #$0010                                ; $06AFB9 |
  BNE CODE_06B016                           ; $06AFBC |
  LDA !s_spr_collision_state,y              ; $06AFBE |
  BEQ CODE_06B016                           ; $06AFC1 |
  LDA !s_spr_x_pixel_pos,x                  ; $06AFC3 |
  CLC                                       ; $06AFC6 |
  ADC #$0008                                ; $06AFC7 |
  SEC                                       ; $06AFCA |
  SBC !s_spr_x_hitbox_center,y              ; $06AFCB |
  STA $00                                   ; $06AFCE |
  LDA !s_spr_x_speed_lo,y                   ; $06AFD0 |
  BEQ CODE_06AFD9                           ; $06AFD3 |
  EOR $00                                   ; $06AFD5 |
  BMI CODE_06B016                           ; $06AFD7 |

CODE_06AFD9:
  LDA $00                                   ; $06AFD9 |
  EOR #$FFFF                                ; $06AFDB |
  INC A                                     ; $06AFDE |
  STA !s_spr_x_collision_delta,x            ; $06AFDF |
  PHX                                       ; $06AFE2 |
  TYX                                       ; $06AFE3 |
  JSL $03B24B                               ; $06AFE4 |
  PLX                                       ; $06AFE8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06AFE9 |
  CMP #$0006                                ; $06AFEC |
  BCS CODE_06B016                           ; $06AFEF |

CODE_06AFF1:
  STZ !s_spr_x_speed_lo,x                   ; $06AFF1 |
  LDA #$FFFC                                ; $06AFF4 |
  STA !s_spr_wildcard_1_lo,x                ; $06AFF7 |
  CLC                                       ; $06AFFA |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06AFFB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06AFFD |
  SEP #$20                                  ; $06AFFF |
  LDA #$06                                  ; $06B001 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06B003 |
  LDA #$03                                  ; $06B006 |
  STA !s_spr_wildcard_2_lo,x                ; $06B008 |
  REP #$20                                  ; $06B00B |
  LDA #$0034                                ; $06B00D |
  JSL push_sound_queue                      ; $06B010 |
  PLA                                       ; $06B014 |
  RTL                                       ; $06B015 | back out of sprite

CODE_06B016:
  LDA !s_player_state                       ; $06B016 |
  BNE CODE_06B029                           ; $06B019 |
  LDA $105E                                 ; $06B01B |
  BEQ CODE_06B029                           ; $06B01E |
  CMP #$0001                                ; $06B020 |
  BEQ CODE_06B02A                           ; $06B023 |
  JSL player_hit_sprite                     ; $06B025 |

CODE_06B029:
  RTS                                       ; $06B029 |

CODE_06B02A:
  LDA !s_player_y_speed                     ; $06B02A |
  BMI CODE_06B029                           ; $06B02D |
  LDA #$0100                                ; $06B02F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06B032 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06B034 |
  LDA !s_player_ground_pound_state          ; $06B036 |
  BNE CODE_06B048                           ; $06B039 |
  JSL $03B20B                               ; $06B03B |
  LDA #$0034                                ; $06B03F |
  JSL push_sound_queue                      ; $06B042 |
  BRA CODE_06AFF1                           ; $06B046 |

CODE_06B048:
  LDA !s_player_y_speed                     ; $06B048 |
  BEQ CODE_06B029                           ; $06B04B |
  STZ !s_player_y_speed                     ; $06B04D |
  LDA !s_player_y                           ; $06B050 |
  SEC                                       ; $06B053 |
  SBC $1060                                 ; $06B054 |
  STA !s_player_y                           ; $06B057 |
  JSL $028925                               ; $06B05A |
  LDA #$E000                                ; $06B05E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06B061 |
  SEP #$20                                  ; $06B063 |
  LDA #$09                                  ; $06B065 |
  STA !s_spr_anim_frame,x                   ; $06B067 |
  LDA #$0A                                  ; $06B06A |
  STA !s_spr_gsu_morph_1_lo,x               ; $06B06C |
  REP #$20                                  ; $06B06F |
  RTS                                       ; $06B071 |

; milde sub
CODE_06B072:
  STA $6004                                 ; $06B072 |
  LDY !s_spr_draw_priority,x                ; $06B075 |
  CPY #$FF                                  ; $06B078 |
  BEQ CODE_06B0CC                           ; $06B07A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06B07C |
  XBA                                       ; $06B07E |
  AND #$00FF                                ; $06B07F |
  STA !gsu_r1                               ; $06B082 |
  LDA #$0006                                ; $06B085 |
  STA !gsu_r4                               ; $06B088 |
  LDA #$B36D                                ; $06B08B |
  STA !gsu_r5                               ; $06B08E |
  LDA !s_spr_anim_frame,x                   ; $06B091 |
  STA !gsu_r6                               ; $06B094 |
  LDA #$0092                                ; $06B097 |
  STA !gsu_r7                               ; $06B09A |
  LDA #$4000                                ; $06B09D |
  STA !gsu_r8                               ; $06B0A0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B0A3 |
  STA $6000                                 ; $06B0A5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B0A8 |
  STA $6002                                 ; $06B0AA |
  LDA !s_spr_cam_x_pos,x                    ; $06B0AD |
  CLC                                       ; $06B0B0 |
  ADC #$0008                                ; $06B0B1 |
  STA $6010                                 ; $06B0B4 |
  LDA !s_spr_cam_y_pos,x                    ; $06B0B7 |
  CLC                                       ; $06B0BA |
  ADC #$0004                                ; $06B0BB |
  STA $6012                                 ; $06B0BE |
  LDX #$09                                  ; $06B0C1 |
  LDA #$A578                                ; $06B0C3 |
  JSL r_gsu_init_1                          ; $06B0C6 |
  LDX $12                                   ; $06B0CA |

CODE_06B0CC:
  RTS                                       ; $06B0CC |

  dw $0100, $0000                           ; $06B0CD |
  dw $0100, $0000                           ; $06B0D1 |
  dw $0100, $0000                           ; $06B0D5 |
  dw $0100, $0000                           ; $06B0D9 |
  dw $0100, $0000                           ; $06B0DD |
  dw $00F3, $00E4                           ; $06B0E1 |
  dw $00E6, $00E4                           ; $06B0E5 |
  dw $00D9, $00E4                           ; $06B0E9 |
  dw $0100, $0000                           ; $06B0ED |
  dw $00E6, $00E4                           ; $06B0F1 |
  dw $00CC, $00E4                           ; $06B0F5 |
  dw $0100, $0000                           ; $06B0F9 |

; milde sub
CODE_06B0FD:
  LDY !s_spr_draw_priority,x                ; $06B0FD |
  CPY #$FF                                  ; $06B100 |
  BNE CODE_06B105                           ; $06B102 |
  RTS                                       ; $06B104 |

CODE_06B105:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06B105 |
  XBA                                       ; $06B107 |
  AND #$00FF                                ; $06B108 |
  STA !gsu_r5                               ; $06B10B |
  LDA #$0000                                ; $06B10E |
  STA !gsu_r3                               ; $06B111 |
  LDA #$0000                                ; $06B114 |
  STA !gsu_r2                               ; $06B117 |
  LDA #$0100                                ; $06B11A |
  STA !gsu_r6                               ; $06B11D |
  LDA #$6060                                ; $06B120 |
  STA !gsu_r12                              ; $06B123 |
  LDA #$0056                                ; $06B126 |
  STA !gsu_r13                              ; $06B129 |
  LDX #$08                                  ; $06B12C |
  LDA #$8205                                ; $06B12E |
  JSL r_gsu_init_1                          ; $06B131 |
  LDX $12                                   ; $06B135 |
  LDA !s_spr_anim_frame,x                   ; $06B137 |
  CMP #$0009                                ; $06B13A |
  BCC CODE_06B17C                           ; $06B13D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B13F |
  STA !gsu_r6                               ; $06B141 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B144 |
  STA !gsu_r11                              ; $06B146 |
  LDA #$003F                                ; $06B149 |
  STA !gsu_r8                               ; $06B14C |
  LDA #$001F                                ; $06B14F |
  STA !gsu_r9                               ; $06B152 |
  LDA #$0020                                ; $06B155 |
  STA !gsu_r3                               ; $06B158 |
  LDA #$0000                                ; $06B15B |
  STA !gsu_r2                               ; $06B15E |
  LDA #$6001                                ; $06B161 |
  STA !gsu_r12                              ; $06B164 |
  LDA #$0056                                ; $06B167 |
  STA !gsu_r13                              ; $06B16A |
  LDX #$08                                  ; $06B16D |
  LDA #$8C78                                ; $06B16F |
  JSL r_gsu_init_1                          ; $06B172 |
  LDX $12                                   ; $06B176 |
  INC $0CF9                                 ; $06B178 |
  RTS                                       ; $06B17B |

CODE_06B17C:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B17C |
  STA !gsu_r6                               ; $06B17E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B181 |
  STA !gsu_r11                              ; $06B183 |
  LDA #$001F                                ; $06B186 |
  STA !gsu_r8                               ; $06B189 |
  LDA #$0010                                ; $06B18C |
  STA !gsu_r9                               ; $06B18F |
  LDA #$0040                                ; $06B192 |
  STA !gsu_r3                               ; $06B195 |
  LDA #$0000                                ; $06B198 |
  STA !gsu_r2                               ; $06B19B |
  LDA #$6080                                ; $06B19E |
  STA !gsu_r12                              ; $06B1A1 |
  LDA #$0056                                ; $06B1A4 |
  STA !gsu_r13                              ; $06B1A7 |
  LDX #$08                                  ; $06B1AA |
  LDA #$8295                                ; $06B1AC |
  JSL r_gsu_init_1                          ; $06B1AF |
  LDX $12                                   ; $06B1B3 |
  LDA !s_spr_anim_frame,x                   ; $06B1B5 |
  ASL A                                     ; $06B1B8 |
  ASL A                                     ; $06B1B9 |
  TAY                                       ; $06B1BA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B1BB |
  STA !gsu_r0                               ; $06B1BD |
  LDA $B0CD,y                               ; $06B1C0 |
  STA !gsu_r6                               ; $06B1C3 |
  PHX                                       ; $06B1C6 |
  PHY                                       ; $06B1C7 |
  LDX #$0B                                  ; $06B1C8 |
  LDA #$86B6                                ; $06B1CA |
  JSL r_gsu_init_1                          ; $06B1CD |
  PLY                                       ; $06B1D1 |
  PLX                                       ; $06B1D2 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B1D3 |
  CMP !gsu_r0                               ; $06B1D5 |
  BPL CODE_06B1EB                           ; $06B1D8 |
  LDA $B0CF,y                               ; $06B1DA |
  BEQ CODE_06B1EE                           ; $06B1DD |
  LDA $B0CF,y                               ; $06B1DF |
  EOR #$FFFF                                ; $06B1E2 |
  INC A                                     ; $06B1E5 |
  AND #$00FF                                ; $06B1E6 |
  BRA CODE_06B1EE                           ; $06B1E9 |

CODE_06B1EB:
  LDA $B0CF,y                               ; $06B1EB |

CODE_06B1EE:
  STA !gsu_r5                               ; $06B1EE |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B1F1 |
  STA !gsu_r6                               ; $06B1F3 |
  LDA !gsu_r0                               ; $06B1F6 |
  STA !gsu_r11                              ; $06B1F9 |
  LDA #$0020                                ; $06B1FC |
  STA !gsu_r3                               ; $06B1FF |
  LDA #$0000                                ; $06B202 |
  STA !gsu_r2                               ; $06B205 |
  LDA #$6040                                ; $06B208 |
  STA !gsu_r12                              ; $06B20B |
  LDA #$0056                                ; $06B20E |
  STA !gsu_r13                              ; $06B211 |
  LDX #$08                                  ; $06B214 |
  LDA #$84A5                                ; $06B216 |
  JSL r_gsu_init_1                          ; $06B219 |
  LDX $12                                   ; $06B21D |
  INC $0CF9                                 ; $06B21F |

CODE_06B222:
  RTS                                       ; $06B222 |

; milde sub
CODE_06B223:
  LDY !s_spr_draw_priority,x                ; $06B223 |
  CPY #$FF                                  ; $06B226 |
  BEQ CODE_06B222                           ; $06B228 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06B22A |
  XBA                                       ; $06B22C |
  AND #$00FF                                ; $06B22D |
  STA !gsu_r5                               ; $06B230 |
  LDA #$0000                                ; $06B233 |
  STA !gsu_r3                               ; $06B236 |
  LDA #$0000                                ; $06B239 |
  STA !gsu_r2                               ; $06B23C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B23F |
  STA !gsu_r6                               ; $06B241 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B244 |
  STA !gsu_r11                              ; $06B246 |
  LDA #$6060                                ; $06B249 |
  STA !gsu_r12                              ; $06B24C |
  LDA #$0056                                ; $06B24F |
  STA !gsu_r13                              ; $06B252 |
  LDX #$08                                  ; $06B255 |
  LDA #$84A5                                ; $06B257 |
  JSL r_gsu_init_1                          ; $06B25A |
  LDX $12                                   ; $06B25E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B260 |
  STA !gsu_r6                               ; $06B262 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B265 |
  STA !gsu_r11                              ; $06B267 |
  LDA #$001F                                ; $06B26A |
  STA !gsu_r8                               ; $06B26D |
  LDA #$0010                                ; $06B270 |
  STA !gsu_r9                               ; $06B273 |
  LDA #$0040                                ; $06B276 |
  STA !gsu_r3                               ; $06B279 |
  LDA #$0000                                ; $06B27C |
  STA !gsu_r2                               ; $06B27F |
  LDA #$6080                                ; $06B282 |
  STA !gsu_r12                              ; $06B285 |
  LDA #$0056                                ; $06B288 |
  STA !gsu_r13                              ; $06B28B |
  LDX #$08                                  ; $06B28E |
  LDA #$8295                                ; $06B290 |
  JSL r_gsu_init_1                          ; $06B293 |
  LDX $12                                   ; $06B297 |
  LDA #$0000                                ; $06B299 |
  STA !gsu_r5                               ; $06B29C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B29F |
  STA !gsu_r6                               ; $06B2A1 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B2A4 |
  STA !gsu_r11                              ; $06B2A6 |
  LDA #$0010                                ; $06B2A9 |
  STA !gsu_r8                               ; $06B2AC |
  LDA #$0010                                ; $06B2AF |
  STA !gsu_r9                               ; $06B2B2 |
  LDA #$0020                                ; $06B2B5 |
  STA !gsu_r3                               ; $06B2B8 |
  LDA #$0000                                ; $06B2BB |
  STA !gsu_r2                               ; $06B2BE |
  LDA #$6040                                ; $06B2C1 |
  STA !gsu_r12                              ; $06B2C4 |
  LDA #$0056                                ; $06B2C7 |
  STA !gsu_r13                              ; $06B2CA |
  LDX #$08                                  ; $06B2CD |
  LDA #$8295                                ; $06B2CF |
  JSL r_gsu_init_1                          ; $06B2D2 |
  LDX $12                                   ; $06B2D6 |
  INC $0CF9                                 ; $06B2D8 |

CODE_06B2DB:
  RTS                                       ; $06B2DB |

; milde sub
CODE_06B2DC:
  LDY !s_spr_draw_priority,x                ; $06B2DC |
  CPY #$FF                                  ; $06B2DF |
  BEQ CODE_06B2DB                           ; $06B2E1 |
  LDA #$0000                                ; $06B2E3 |
  STA !gsu_r1                               ; $06B2E6 |
  LDA !s_spr_cam_x_pos,x                    ; $06B2E9 |
  CLC                                       ; $06B2EC |
  ADC #$0008                                ; $06B2ED |
  STA !gsu_r2                               ; $06B2F0 |
  LDA !s_spr_cam_y_pos,x                    ; $06B2F3 |
  CLC                                       ; $06B2F6 |
  ADC #$0004                                ; $06B2F7 |
  STA !gsu_r3                               ; $06B2FA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06B2FD |
  STA !gsu_r5                               ; $06B2FF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06B302 |
  STA !gsu_r7                               ; $06B304 |
  TXA                                       ; $06B307 |
  STA $6012                                 ; $06B308 |
  LDA !s_player_x_cam_rel                   ; $06B30B |
  STA $6014                                 ; $06B30E |
  LDA !s_player_y_cam_rel                   ; $06B311 |
  STA $6016                                 ; $06B314 |
  LDA !s_player_duck_state                  ; $06B317 |
  STA $6018                                 ; $06B31A |
  LDX #$0A                                  ; $06B31D |
  LDA #$8974                                ; $06B31F |
  JSL r_gsu_init_3                          ; $06B322 |
  LDA $601A                                 ; $06B326 |
  STA $105E                                 ; $06B329 |
  LDA $601C                                 ; $06B32C |
  STA $1060                                 ; $06B32F |
  JSL $00BE39                               ; $06B332 |

; DMA args
  dl $7E5040, $703372                       ; $06B336 |
  dw $0348                                  ; $06B33C |

  LDX $12                                   ; $06B33E |
  LDA #$0002                                ; $06B340 |
  TSB !r_reg_tm_mirror                      ; $06B343 |
  LDA #$0018                                ; $06B346 |
  TSB !r_reg_hdmaen_mirror                  ; $06B349 |
  LDX $12                                   ; $06B34C |
  LDA $7860,x                               ; $06B34E |
  LDY !s_spr_x_speed_hi,x                   ; $06B351 |
  BMI CODE_06B364                           ; $06B354 |
  BNE CODE_06B35D                           ; $06B356 |
  LDY !s_spr_x_speed_lo,x                   ; $06B358 |
  BEQ CODE_06B36C                           ; $06B35B |

CODE_06B35D:
  BIT #$0014                                ; $06B35D |
  BEQ CODE_06B36C                           ; $06B360 |
  BRA CODE_06B369                           ; $06B362 |

CODE_06B364:
  BIT #$0028                                ; $06B364 |
  BEQ CODE_06B36C                           ; $06B367 |

CODE_06B369:
  STZ !s_spr_x_speed_lo,x                   ; $06B369 |

CODE_06B36C:
  RTS                                       ; $06B36C |

; gsu tables: milde OAM per anim frame
; each animation frame is 146 bytes (except $09 is 164 bytes)
; format of each frame:
; 1 byte: ??
; 4 5-byte OAM entries (size, X, Y, bytes 3 & 4 in OAM)
; 1 byte: ??
; 4 5-byte OAM entries
; 4 5-byte OAM entries
; 4 5-byte OAM entries
; 2 bytes: ??
; 8 5-byte OAM entries
; 2 bytes: ??
; 4 5-byte OAM entries

; frame $09 is similar except has 16 5-byte OAM entries
; after the first 2-byte ??

; milde frame $00
  db $F8, $02, $F0, $F0, $C0                ; $06B36D |
  db $3D, $02, $00, $F0, $C2                ; $06B372 |
  db $3D, $02, $F0, $00, $E0                ; $06B377 |
  db $3D, $02, $00, $00, $E2                ; $06B37C |
  db $3D, $09, $02, $F0, $F0                ; $06B381 |
  db $E2, $FF, $02, $00, $F0                ; $06B386 |
  db $E0, $FF, $02, $F0, $00                ; $06B38B |
  db $C2, $FF, $02, $00, $00                ; $06B390 |
  db $C0, $FF, $02, $F0, $F0                ; $06B395 |
  db $C2, $6F, $02, $00, $F0                ; $06B39A |
  db $C0, $6F, $02, $F0, $00                ; $06B39F |
  db $E2, $6F, $02, $00, $00                ; $06B3A4 |
  db $E0, $6F, $02, $F0, $F0                ; $06B3A9 |
  db $E0, $AD, $02, $00, $F0                ; $06B3AE |
  db $E2, $AD, $02, $F0, $00                ; $06B3B3 |
  db $C0, $AD, $02, $00, $00                ; $06B3B8 |
  db $C2, $AD, $DB, $9D, $02                ; $06B3BD |
  db $FA, $F0, $CA, $7D, $02                ; $06B3C2 |
  db $0A, $F0, $C8, $7D, $02                ; $06B3C7 |
  db $FA, $00, $EA, $7D, $02                ; $06B3CC |
  db $0A, $00, $E8, $7D, $02                ; $06B3D1 |
  db $E7, $F0, $C8, $3F, $02                ; $06B3D6 |
  db $F7, $F0, $CA, $3F, $02                ; $06B3DB |
  db $E7, $00, $E8, $3F, $02                ; $06B3E0 |
  db $F7, $00, $EA, $3F, $00                ; $06B3E5 |
  db $9F, $02, $F0, $F0, $C4                ; $06B3EA |
  db $3F, $02, $00, $F0, $C6                ; $06B3EF |
  db $3F, $02, $F0, $00, $E4                ; $06B3F4 |
  db $3F, $02, $00, $00, $E6                ; $06B3F9 |
  db $3F                                    ; $06B3FE |

; milde frame $01
  db $F8, $02, $F0, $F0                     ; $06B3FF |
  db $C0, $3D, $02, $00, $F0                ; $06B403 |
  db $C2, $3D, $02, $F0, $00                ; $06B408 |
  db $E0, $3D, $02, $00, $00                ; $06B40D |
  db $E2, $3D, $09, $02, $F0                ; $06B412 |
  db $F0, $E2, $FF, $02, $00                ; $06B417 |
  db $F0, $E0, $FF, $02, $F0                ; $06B41C |
  db $00, $C2, $FF, $02, $00                ; $06B421 |
  db $00, $C0, $FF, $02, $F0                ; $06B426 |
  db $F0, $C2, $6F, $02, $00                ; $06B42B |
  db $F0, $C0, $6F, $02, $F0                ; $06B430 |
  db $00, $E2, $6F, $02, $00                ; $06B435 |
  db $00, $E0, $6F, $02, $F0                ; $06B43A |
  db $F0, $E0, $AD, $02, $00                ; $06B43F |
  db $F0, $E2, $AD, $02, $F0                ; $06B444 |
  db $00, $C0, $AD, $02, $00                ; $06B449 |
  db $00, $C2, $AD, $DD, $9D                ; $06B44E |
  db $02, $FA, $F0, $CA, $7D                ; $06B453 |
  db $02, $0A, $F0, $C8, $7D                ; $06B458 |
  db $02, $FA, $00, $EA, $7D                ; $06B45D |
  db $02, $0A, $00, $E8, $7D                ; $06B462 |
  db $02, $E6, $F0, $C8, $3F                ; $06B467 |
  db $02, $F6, $F0, $CA, $3F                ; $06B46C |
  db $02, $E6, $00, $E8, $3F                ; $06B471 |
  db $02, $F6, $00, $EA, $3F                ; $06B476 |
  db $02, $9F, $02, $F0, $F0                ; $06B47B |
  db $C4, $3F, $02, $00, $F0                ; $06B480 |
  db $C6, $3F, $02, $F0, $00                ; $06B485 |
  db $E4, $3F, $02, $00, $00                ; $06B48A |
  db $E6, $3F                               ; $06B48F |

; milde frame $02
  db $F8, $02, $F0                          ; $06B491 |
  db $F0, $C0, $3D, $02, $00                ; $06B494 |
  db $F0, $C2, $3D, $02, $F0                ; $06B499 |
  db $00, $E0, $3D, $02, $00                ; $06B49E |
  db $00, $E2, $3D, $09, $02                ; $06B4A3 |
  db $F0, $F0, $E2, $FF, $02                ; $06B4A8 |
  db $00, $F0, $E0, $FF, $02                ; $06B4AD |
  db $F0, $00, $C2, $FF, $02                ; $06B4B2 |
  db $00, $00, $C0, $FF, $02                ; $06B4B7 |
  db $F0, $F0, $C2, $6F, $02                ; $06B4BC |
  db $00, $F0, $C0, $6F, $02                ; $06B4C1 |
  db $F0, $00, $E2, $6F, $02                ; $06B4C6 |
  db $00, $00, $E0, $6F, $02                ; $06B4CB |
  db $F0, $F0, $E0, $AD, $02                ; $06B4D0 |
  db $00, $F0, $E2, $AD, $02                ; $06B4D5 |
  db $F0, $00, $C0, $AD, $02                ; $06B4DA |
  db $00, $00, $C2, $AD, $DF                ; $06B4DF |
  db $9D, $02, $FB, $F0, $CA                ; $06B4E4 |
  db $7D, $02, $0B, $F0, $C8                ; $06B4E9 |
  db $7D, $02, $FB, $00, $EA                ; $06B4EE |
  db $7D, $02, $0B, $00, $E8                ; $06B4F3 |
  db $7D, $02, $E5, $F0, $C8                ; $06B4F8 |
  db $3F, $02, $F5, $F0, $CA                ; $06B4FD |
  db $3F, $02, $E5, $00, $E8                ; $06B502 |
  db $3F, $02, $F5, $00, $EA                ; $06B507 |
  db $3F, $05, $9F, $02, $F0                ; $06B50C |
  db $F0, $C4, $3F, $02, $00                ; $06B511 |
  db $F0, $C6, $3F, $02, $F0                ; $06B516 |
  db $00, $E4, $3F, $02, $00                ; $06B51B |
  db $00, $E6, $3F                          ; $06B520 |

; milde frame $03
  db $F8, $02                               ; $06B523 |
  db $F0, $F0, $C0, $3D, $02                ; $06B525 |
  db $00, $F0, $C2, $3D, $02                ; $06B52A |
  db $F0, $00, $E0, $3D, $02                ; $06B52F |
  db $00, $00, $E2, $3D, $09                ; $06B534 |
  db $02, $F0, $F0, $E2, $FF                ; $06B539 |
  db $02, $00, $F0, $E0, $FF                ; $06B53E |
  db $02, $F0, $00, $C2, $FF                ; $06B543 |
  db $02, $00, $00, $C0, $FF                ; $06B548 |
  db $02, $F0, $F0, $C2, $6F                ; $06B54D |
  db $02, $00, $F0, $C0, $6F                ; $06B552 |
  db $02, $F0, $00, $E2, $6F                ; $06B557 |
  db $02, $00, $00, $E0, $6F                ; $06B55C |
  db $02, $F0, $F0, $E0, $AD                ; $06B561 |
  db $02, $00, $F0, $E2, $AD                ; $06B566 |
  db $02, $F0, $00, $C0, $AD                ; $06B56B |
  db $02, $00, $00, $C2, $AD                ; $06B570 |
  db $E2, $9D, $02, $FD, $F0                ; $06B575 |
  db $CA, $7D, $02, $0D, $F0                ; $06B57A |
  db $C8, $7D, $02, $FD, $00                ; $06B57F |
  db $EA, $7D, $02, $0D, $00                ; $06B584 |
  db $E8, $7D, $02, $E4, $F0                ; $06B589 |
  db $C8, $3F, $02, $F4, $F0                ; $06B58E |
  db $CA, $3F, $02, $E4, $00                ; $06B593 |
  db $E8, $3F, $02, $F4, $00                ; $06B598 |
  db $EA, $3F, $0A, $9F, $02                ; $06B59D |
  db $F0, $F0, $C4, $3F, $02                ; $06B5A2 |
  db $00, $F0, $C6, $3F, $02                ; $06B5A7 |
  db $F0, $00, $E4, $3F, $02                ; $06B5AC |
  db $00, $00, $E6, $3F                     ; $06B5B1 |

; milde frame $04
  db $F8                                    ; $06B5B5 |
  db $02, $F0, $F0, $C0, $3D                ; $06B5B6 |
  db $02, $00, $F0, $C2, $3D                ; $06B5BB |
  db $02, $F0, $00, $E0, $3D                ; $06B5C0 |
  db $02, $00, $00, $E2, $3D                ; $06B5C5 |
  db $09, $02, $F0, $F0, $E2                ; $06B5CA |
  db $FF, $02, $00, $F0, $E0                ; $06B5CF |
  db $FF, $02, $F0, $00, $C2                ; $06B5D4 |
  db $FF, $02, $00, $00, $C0                ; $06B5D9 |
  db $FF, $02, $F0, $F0, $C2                ; $06B5DE |
  db $6F, $02, $00, $F0, $C0                ; $06B5E3 |
  db $6F, $02, $F0, $00, $E2                ; $06B5E8 |
  db $6F, $02, $00, $00, $E0                ; $06B5ED |
  db $6F, $02, $F0, $F0, $E0                ; $06B5F2 |
  db $AD, $02, $00, $F0, $E2                ; $06B5F7 |
  db $AD, $02, $F0, $00, $C0                ; $06B5FC |
  db $AD, $02, $00, $00, $C2                ; $06B601 |
  db $AD, $E7, $9D, $02, $FE                ; $06B606 |
  db $F0, $CA, $7D, $02, $0E                ; $06B60B |
  db $F0, $C8, $7D, $02, $FE                ; $06B610 |
  db $00, $EA, $7D, $02, $0E                ; $06B615 |
  db $00, $E8, $7D, $02, $E2                ; $06B61A |
  db $F0, $C8, $3F, $02, $F2                ; $06B61F |
  db $F0, $CA, $3F, $02, $E2                ; $06B624 |
  db $00, $E8, $3F, $02, $F2                ; $06B629 |
  db $00, $EA, $3F, $10, $9F                ; $06B62E |
  db $02, $F0, $F0, $C4, $3F                ; $06B633 |
  db $02, $00, $F0, $C6, $3F                ; $06B638 |
  db $02, $F0, $00, $E4, $3F                ; $06B63D |
  db $02, $00, $00, $E6, $3F                ; $06B642 |

; milde frame $05
  db $F8, $02, $F0, $F0, $C0                ; $06B647 |
  db $3D, $02, $00, $F0, $C2                ; $06B64C |
  db $3D, $02, $F0, $00, $E0                ; $06B651 |
  db $3D, $02, $00, $00, $E2                ; $06B656 |
  db $3D, $09, $02, $F0, $F0                ; $06B65B |
  db $E2, $FF, $02, $00, $F0                ; $06B660 |
  db $E0, $FF, $02, $F0, $00                ; $06B665 |
  db $C2, $FF, $02, $00, $00                ; $06B66A |
  db $C0, $FF, $02, $F0, $F0                ; $06B66F |
  db $C2, $6F, $02, $00, $F0                ; $06B674 |
  db $C0, $6F, $02, $F0, $00                ; $06B679 |
  db $E2, $6F, $02, $00, $00                ; $06B67E |
  db $E0, $6F, $02, $F0, $F0                ; $06B683 |
  db $E0, $AD, $02, $00, $F0                ; $06B688 |
  db $E2, $AD, $02, $F0, $00                ; $06B68D |
  db $C0, $AD, $02, $00, $00                ; $06B692 |
  db $C2, $AD, $EC, $9D, $02                ; $06B697 |
  db $FF, $F0, $CA, $7D, $02                ; $06B69C |
  db $0F, $F0, $C8, $7D, $02                ; $06B6A1 |
  db $FF, $00, $EA, $7D, $02                ; $06B6A6 |
  db $0F, $00, $E8, $7D, $02                ; $06B6AB |
  db $E1, $F0, $C8, $3F, $02                ; $06B6B0 |
  db $F1, $F0, $CA, $3F, $02                ; $06B6B5 |
  db $E1, $00, $E8, $3F, $02                ; $06B6BA |
  db $F1, $00, $EA, $3F, $15                ; $06B6BF |
  db $9F, $02, $F0, $F0, $C4                ; $06B6C4 |
  db $3F, $02, $00, $F0, $C6                ; $06B6C9 |
  db $3F, $02, $F0, $00, $E4                ; $06B6CE |
  db $3F, $02, $00, $00, $E6                ; $06B6D3 |
  db $3F                                    ; $06B6D8 |

; milde frame $06
  db $F8, $02, $F0, $F0                     ; $06B6D9 |
  db $C0, $3D, $02, $00, $F0                ; $06B6DD |
  db $C2, $3D, $02, $F0, $00                ; $06B6E2 |
  db $E0, $3D, $02, $00, $00                ; $06B6E7 |
  db $E2, $3D, $09, $02, $F0                ; $06B6EC |
  db $F0, $E2, $FF, $02, $00                ; $06B6F1 |
  db $F0, $E0, $FF, $02, $F0                ; $06B6F6 |
  db $00, $C2, $FF, $02, $00                ; $06B6FB |
  db $00, $C0, $FF, $02, $F0                ; $06B700 |
  db $F0, $C2, $6F, $02, $00                ; $06B705 |
  db $F0, $C0, $6F, $02, $F0                ; $06B70A |
  db $00, $E2, $6F, $02, $00                ; $06B70F |
  db $00, $E0, $6F, $02, $F0                ; $06B714 |
  db $F0, $E0, $AD, $02, $00                ; $06B719 |
  db $F0, $E2, $AD, $02, $F0                ; $06B71E |
  db $00, $C0, $AD, $02, $00                ; $06B723 |
  db $00, $C2, $AD, $EF, $9D                ; $06B728 |
  db $02, $00, $F0, $CA, $7D                ; $06B72D |
  db $02, $10, $F0, $C8, $7D                ; $06B732 |
  db $02, $00, $00, $EA, $7D                ; $06B737 |
  db $02, $10, $00, $E8, $7D                ; $06B73C |
  db $02, $E1, $F0, $C8, $3F                ; $06B741 |
  db $02, $F1, $F0, $CA, $3F                ; $06B746 |
  db $02, $E1, $00, $E8, $3F                ; $06B74B |
  db $02, $F1, $00, $EA, $3F                ; $06B750 |
  db $19, $9F, $02, $F0, $F0                ; $06B755 |
  db $C4, $3F, $02, $00, $F0                ; $06B75A |
  db $C6, $3F, $02, $F0, $00                ; $06B75F |
  db $E4, $3F, $02, $00, $00                ; $06B764 |
  db $E6, $3F                               ; $06B769 |

; milde frame $07
  db $F8, $02, $F0                          ; $06B76B |
  db $F0, $C0, $3D, $02, $00                ; $06B76E |
  db $F0, $C2, $3D, $02, $F0                ; $06B773 |
  db $00, $E0, $3D, $02, $00                ; $06B778 |
  db $00, $E2, $3D, $09, $02                ; $06B77D |
  db $F0, $F0, $E2, $FF, $02                ; $06B782 |
  db $00, $F0, $E0, $FF, $02                ; $06B787 |
  db $F0, $00, $C2, $FF, $02                ; $06B78C |
  db $00, $00, $C0, $FF, $02                ; $06B791 |
  db $F0, $F0, $C2, $6F, $02                ; $06B796 |
  db $00, $F0, $C0, $6F, $02                ; $06B79B |
  db $F0, $00, $E2, $6F, $02                ; $06B7A0 |
  db $00, $00, $E0, $6F, $02                ; $06B7A5 |
  db $F0, $F0, $E0, $AD, $02                ; $06B7AA |
  db $00, $F0, $E2, $AD, $02                ; $06B7AF |
  db $F0, $00, $C0, $AD, $02                ; $06B7B4 |
  db $00, $00, $C2, $AD, $F2                ; $06B7B9 |
  db $9D, $02, $00, $F0, $CA                ; $06B7BE |
  db $7D, $02, $10, $F0, $C8                ; $06B7C3 |
  db $7D, $02, $00, $00, $EA                ; $06B7C8 |
  db $7D, $02, $10, $00, $E8                ; $06B7CD |
  db $7D, $02, $E0, $F0, $C8                ; $06B7D2 |
  db $3F, $02, $F0, $F0, $CA                ; $06B7D7 |
  db $3F, $02, $E0, $00, $E8                ; $06B7DC |
  db $3F, $02, $F0, $00, $EA                ; $06B7E1 |
  db $3F, $1C, $9F, $02, $F0                ; $06B7E6 |
  db $F0, $C4, $3F, $02, $00                ; $06B7EB |
  db $F0, $C6, $3F, $02, $F0                ; $06B7F0 |
  db $00, $E4, $3F, $02, $00                ; $06B7F5 |
  db $00, $E6, $3F                          ; $06B7FA |

; milde frame $08
  db $F8, $02                               ; $06B7FD |
  db $F0, $F0, $C0, $3D, $02                ; $06B7FF |
  db $00, $F0, $C2, $3D, $02                ; $06B804 |
  db $F0, $00, $E0, $3D, $02                ; $06B809 |
  db $00, $00, $E2, $3D, $09                ; $06B80E |
  db $02, $F0, $F0, $E2, $FF                ; $06B813 |
  db $02, $00, $F0, $E0, $FF                ; $06B818 |
  db $02, $F0, $00, $C2, $FF                ; $06B81D |
  db $02, $00, $00, $C0, $FF                ; $06B822 |
  db $02, $F0, $F0, $C2, $6F                ; $06B827 |
  db $02, $00, $F0, $C0, $6F                ; $06B82C |
  db $02, $F0, $00, $E2, $6F                ; $06B831 |
  db $02, $00, $00, $E0, $6F                ; $06B836 |
  db $02, $F0, $F0, $E0, $AD                ; $06B83B |
  db $02, $00, $F0, $E2, $AD                ; $06B840 |
  db $02, $F0, $00, $C0, $AD                ; $06B845 |
  db $02, $00, $00, $C2, $AD                ; $06B84A |
  db $F6, $9D, $02, $00, $F0                ; $06B84F |
  db $CA, $7D, $02, $10, $F0                ; $06B854 |
  db $C8, $7D, $02, $00, $00                ; $06B859 |
  db $EA, $7D, $02, $10, $00                ; $06B85E |
  db $E8, $7D, $02, $E0, $F0                ; $06B863 |
  db $C8, $3F, $02, $F0, $F0                ; $06B868 |
  db $CA, $3F, $02, $E0, $00                ; $06B86D |
  db $E8, $3F, $02, $F0, $00                ; $06B872 |
  db $EA, $3F, $20, $9F, $02                ; $06B877 |
  db $F0, $F0, $C4, $3F, $02                ; $06B87C |
  db $00, $F0, $C6, $3F, $02                ; $06B881 |
  db $F0, $00, $E4, $3F, $02                ; $06B886 |
  db $00, $00, $E6, $3F                     ; $06B88B |

; milde frame $09
  db $F8                                    ; $06B88F |
  db $02, $F0, $F0, $C0, $3D                ; $06B890 |
  db $02, $00, $F0, $C2, $3D                ; $06B895 |
  db $02, $F0, $00, $E0, $3D                ; $06B89A |
  db $02, $00, $00, $E2, $3D                ; $06B89F |
  db $09, $02, $F0, $F0, $E2                ; $06B8A4 |
  db $FF, $02, $00, $F0, $E0                ; $06B8A9 |
  db $FF, $02, $F0, $00, $C2                ; $06B8AE |
  db $FF, $02, $00, $00, $C0                ; $06B8B3 |
  db $FF, $02, $F0, $F0, $C2                ; $06B8B8 |
  db $7D, $02, $00, $F0, $C0                ; $06B8BD |
  db $7D, $02, $F0, $00, $E2                ; $06B8C2 |
  db $7D, $02, $00, $00, $E0                ; $06B8C7 |
  db $7D, $02, $F0, $F0, $E0                ; $06B8CC |
  db $BF, $02, $00, $F0, $E2                ; $06B8D1 |
  db $BF, $02, $F0, $00, $C0                ; $06B8D6 |
  db $BF, $02, $00, $00, $C2                ; $06B8DB |
  db $BF, $00, $98, $02, $E0                ; $06B8E0 |
  db $F0, $C8, $3D, $02, $F0                ; $06B8E5 |
  db $F0, $CA, $3D, $02, $E0                ; $06B8EA |
  db $00, $E8, $3D, $02, $F0                ; $06B8EF |
  db $00, $EA, $3D, $02, $C0                ; $06B8F4 |
  db $F0, $C4, $3F, $02, $D0                ; $06B8F9 |
  db $F0, $C6, $3F, $02, $C0                ; $06B8FE |
  db $00, $E4, $3F, $02, $D0                ; $06B903 |
  db $00, $E6, $3F, $02, $00                ; $06B908 |
  db $F0, $CA, $7F, $02, $10                ; $06B90D |
  db $F0, $C8, $7F, $02, $00                ; $06B912 |
  db $00, $EA, $7F, $02, $10                ; $06B917 |
  db $00, $E8, $7F, $02, $20                ; $06B91C |
  db $F0, $C6, $7F, $02, $30                ; $06B921 |
  db $F0, $C4, $7F, $02, $20                ; $06B926 |
  db $00, $E6, $7F, $02, $30                ; $06B92B |
  db $00, $E4, $7F                          ; $06B930 |

init_12E:
  RTL                                       ; $06B933 |

  dl $5FD98A                                ; $06B934 |
  dl $5FD984                                ; $06B937 |
  dl $5FD986                                ; $06B93A |
  dl $5FD988                                ; $06B93D |

; indices into $B934
  db $00, $06, $03, $06, $03, $06           ; $06B940 |

; indices into $B934
  db $00, $09, $06, $09, $06, $09           ; $06B946 |

  dw $B940                                  ; $06B94C |
  dw $B946                                  ; $06B94E |

main_12E:
  LDA #$0180                                ; $06B950 |
  SEC                                       ; $06B953 |
  SBC !s_spr_cam_x_pos,x                    ; $06B954 |
  STA !r_bg3_cam_x                          ; $06B957 |
  LDA #$0180                                ; $06B95A |
  SEC                                       ; $06B95D |
  SBC !s_spr_cam_y_pos,x                    ; $06B95E |
  STA !r_bg3_cam_y                          ; $06B961 |
  JSL $03AF23                               ; $06B964 |
  LDA !r_reg_tm_mirror                      ; $06B968 |
  ORA !r_reg_ts_mirror                      ; $06B96B |
  AND #$001B                                ; $06B96E |
  ORA #$0400                                ; $06B971 |
  STA !r_reg_tm_mirror                      ; $06B974 |
  LDY #$33                                  ; $06B977 |
  STY !r_reg_cgadsub_mirror                 ; $06B979 |
  LDA !s_spr_timer_1,x                      ; $06B97C |
  BNE CODE_06B9B7                           ; $06B97F |
  LDA #$0002                                ; $06B981 |
  STA !s_spr_timer_1,x                      ; $06B984 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06B987 |
  LDA $B94C,y                               ; $06B989 |
  STA $00                                   ; $06B98C |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $06B98E |
  DEY                                       ; $06B990 |
  BPL CODE_06B999                           ; $06B991 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06B993 |
  BMI CODE_06B9B8                           ; $06B995 |
  LDY #$05                                  ; $06B997 |

CODE_06B999:
  STY !s_spr_wildcard_4_lo_dp,x             ; $06B999 |
  LDA ($00),y                               ; $06B99B |
  TAY                                       ; $06B99D |
  LDA $B934,y                               ; $06B99E |
  STA $00                                   ; $06B9A1 |
  LDX $B936,y                               ; $06B9A3 |
  STX $02                                   ; $06B9A6 |
  LDX #$04                                  ; $06B9A8 |

CODE_06B9AA:
  TXY                                       ; $06B9AA |
  LDA [$00],y                               ; $06B9AB |
  STA $702002,x                             ; $06B9AD |
  DEX                                       ; $06B9B1 |
  DEX                                       ; $06B9B2 |
  BPL CODE_06B9AA                           ; $06B9B3 |
  LDX $12                                   ; $06B9B5 |

CODE_06B9B7:
  RTL                                       ; $06B9B7 |

CODE_06B9B8:
  STZ !s_bg3_cam_x                          ; $06B9B8 |
  STZ !s_bg3_cam_y                          ; $06B9BB |
  JML $03A31E                               ; $06B9BE |

  db $08, $08, $08, $08                     ; $06B9C2 |
  db $08, $0C, $10, $10                     ; $06B9C6 |
  db $10, $10, $10, $10                     ; $06B9CA |
  db $0C, $08, $10, $10                     ; $06B9CE |
  db $10, $10, $10, $10                     ; $06B9D2 |
  db $10, $10, $00, $03                     ; $06B9D6 |

init_cloud_drop_vertical:
  LDA !s_spr_y_pixel_pos,x                  ; $06B9DA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06B9DD |
  LDA !s_spr_x_pixel_pos,x                  ; $06B9DF |
  AND #$0010                                ; $06B9E2 |
  BEQ CODE_06BA05                           ; $06B9E5 |
  LDA $BA2F                                 ; $06B9E7 |
  STA !s_spr_y_accel_ceiling,x              ; $06B9EA |
  LDA #$FE70                                ; $06B9ED |
  STA !s_spr_y_speed_lo,x                   ; $06B9F0 |
  LDA #$0006                                ; $06B9F3 |
  STA !s_spr_anim_frame,x                   ; $06B9F6 |
  TAY                                       ; $06B9F9 |
  LDA $B9C2,y                               ; $06B9FA |
  AND #$00FF                                ; $06B9FD |
  STA !s_spr_y_hitbox_offset,x              ; $06BA00 |
  BRA CODE_06BA21                           ; $06BA03 |

CODE_06BA05:
  LDA $BA31                                 ; $06BA05 |
  STA !s_spr_y_accel_ceiling,x              ; $06BA08 |
  LDA #$0180                                ; $06BA0B |
  STA !s_spr_y_speed_lo,x                   ; $06BA0E |
  LDA #$000D                                ; $06BA11 |
  STA !s_spr_anim_frame,x                   ; $06BA14 |
  TAY                                       ; $06BA17 |
  LDA $B9C2,y                               ; $06BA18 |
  AND #$00FF                                ; $06BA1B |
  STA !s_spr_y_hitbox_offset,x              ; $06BA1E |

CODE_06BA21:
  STZ !s_spr_timer_1,x                      ; $06BA21 |
  RTL                                       ; $06BA24 |

  db $05, $04, $03, $02                     ; $06BA25 |
  db $01, $0C, $0B, $0A                     ; $06BA29 |
  db $09, $08                               ; $06BA2D |

  dw $0800, $F800                           ; $06BA2F |

main_cloud_drop_vertical:
  LDA !s_spr_collision_state,x              ; $06BA33 |
  BEQ CODE_06BA50                           ; $06BA36 |
  LDA !s_sprite_disable_flag                ; $06BA38 |
  ORA $0B55                                 ; $06BA3B |
  ORA !r_cur_item_used                      ; $06BA3E |
  BNE CODE_06BA50                           ; $06BA41 |
  LDA !s_spr_bitwise_settings_1,x           ; $06BA43 |
  ORA #$0200                                ; $06BA46 |
  STA !s_spr_bitwise_settings_1,x           ; $06BA49 |
  JSL $06BB4D                               ; $06BA4C |

CODE_06BA50:
  JSL $03AF23                               ; $06BA50 |
  JSL $06BAF3                               ; $06BA54 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06BA58 |
  BNE CODE_06BAAE                           ; $06BA5A |
  LDA #$0010                                ; $06BA5C |
  STA !s_spr_y_accel,x                      ; $06BA5F |
  LDY #$00                                  ; $06BA62 |
  LDA !s_spr_y_pixel_pos,x                  ; $06BA64 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $06BA67 |
  BCC CODE_06BA6D                           ; $06BA69 |
  LDY #$02                                  ; $06BA6B |

CODE_06BA6D:
  LDA $BA2F,y                               ; $06BA6D |
  STA !s_spr_y_accel_ceiling,x              ; $06BA70 |
  LDA !s_spr_y_speed_lo,x                   ; $06BA73 |
  BNE CODE_06BA88                           ; $06BA76 |
  LDA #$0005                                ; $06BA78 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06BA7B |
  LDA #$0004                                ; $06BA7D |
  STA !s_spr_timer_1,x                      ; $06BA80 |
  STZ !s_spr_y_accel,x                      ; $06BA83 |
  BRA CODE_06BAEE                           ; $06BA86 |

CODE_06BA88:
  BPL CODE_06BA9C                           ; $06BA88 |
  LDA #$000D                                ; $06BA8A |
  STA !s_spr_anim_frame,x                   ; $06BA8D |
  TAY                                       ; $06BA90 |
  LDA $B9C2,y                               ; $06BA91 |
  AND #$00FF                                ; $06BA94 |
  STA !s_spr_y_hitbox_offset,x              ; $06BA97 |
  BRA CODE_06BAEE                           ; $06BA9A |

CODE_06BA9C:
  LDA #$0006                                ; $06BA9C |
  STA !s_spr_anim_frame,x                   ; $06BA9F |
  TAY                                       ; $06BAA2 |
  LDA $B9C2,y                               ; $06BAA3 |
  AND #$00FF                                ; $06BAA6 |
  STA !s_spr_y_hitbox_offset,x              ; $06BAA9 |
  BRA CODE_06BAEE                           ; $06BAAC |

CODE_06BAAE:
  LDA #$BA25                                ; $06BAAE |
  LDY $75E3,x                               ; $06BAB1 |
  BPL CODE_06BAB9                           ; $06BAB4 |
  LDA #$BA2A                                ; $06BAB6 |

CODE_06BAB9:
  STA $00                                   ; $06BAB9 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06BABB |
  LSR A                                     ; $06BABD |
  BNE CODE_06BACC                           ; $06BABE |
  LDA !s_spr_timer_1,x                      ; $06BAC0 |
  LSR A                                     ; $06BAC3 |
  BNE CODE_06BACC                           ; $06BAC4 |
  LDA #$0010                                ; $06BAC6 |
  STA !s_spr_y_accel,x                      ; $06BAC9 |

CODE_06BACC:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06BACC |
  DEY                                       ; $06BACE |
  LDA ($00),y                               ; $06BACF |
  AND #$00FF                                ; $06BAD1 |
  STA !s_spr_anim_frame,x                   ; $06BAD4 |
  TAY                                       ; $06BAD7 |
  LDA $B9C2,y                               ; $06BAD8 |
  AND #$00FF                                ; $06BADB |
  STA !s_spr_y_hitbox_offset,x              ; $06BADE |
  LDA !s_spr_timer_1,x                      ; $06BAE1 |
  BNE CODE_06BAEE                           ; $06BAE4 |
  LDA #$0004                                ; $06BAE6 |
  STA !s_spr_timer_1,x                      ; $06BAE9 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $06BAEC |

CODE_06BAEE:
  JSL $03A5B7                               ; $06BAEE |
  RTL                                       ; $06BAF2 |

; cloud drop sub
  LDY !s_spr_collision_id,x                 ; $06BAF3 |
  DEY                                       ; $06BAF6 |
  BMI CODE_06BB35                           ; $06BAF7 |
  BEQ CODE_06BB35                           ; $06BAF9 |
  LDA !s_spr_state,y                        ; $06BAFB |
  CMP #$0010                                ; $06BAFE |
  BNE CODE_06BB35                           ; $06BB01 |
  LDA !s_spr_collision_state,y              ; $06BB03 |
  BEQ CODE_06BB35                           ; $06BB06 |
  JSL $0CFF61                               ; $06BB08 |
  LDA #$000E                                ; $06BB0C |
  STA !s_spr_state,x                        ; $06BB0F |
  STZ !s_spr_y_speed_lo,x                   ; $06BB12 |
  STZ !s_spr_x_speed_lo,x                   ; $06BB15 |
  STZ !s_spr_x_accel,x                      ; $06BB18 |
  STZ !s_spr_x_accel_ceiling,x              ; $06BB1B |
  LDA #$0040                                ; $06BB1E |
  STA !s_spr_y_accel,x                      ; $06BB21 |
  LDA #$0400                                ; $06BB24 |
  STA !s_spr_y_accel_ceiling,x              ; $06BB27 |
  SEP #$20                                  ; $06BB2A |
  LDA #$FF                                  ; $06BB2C |
  STA !s_spr_stage_id,x                     ; $06BB2E |
  REP #$20                                  ; $06BB31 |
  PLY                                       ; $06BB33 |
  PLA                                       ; $06BB34 |

CODE_06BB35:
  RTL                                       ; $06BB35 |

  db $0E, $0F, $10, $11, $12, $13, $14, $15 ; $06BB36 |

head_bop_cloud_drop_vertical:
  LDA #$0180                                ; $06BB3E |
  STA !s_spr_y_accel_ceiling,x              ; $06BB41 |
  LDA #$0010                                ; $06BB44 |
  STA !s_spr_y_accel,x                      ; $06BB47 |
  STZ !s_spr_x_speed_lo,x                   ; $06BB4A |
  LDA !s_spr_timer_2,x                      ; $06BB4D |
  BNE CODE_06BB69                           ; $06BB50 |
  SEP #$20                                  ; $06BB52 |
  LDA #$04                                  ; $06BB54 |
  STA !s_spr_timer_2,x                      ; $06BB56 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06BB59 |
  LDA $BB36,y                               ; $06BB5B |
  STA !s_spr_anim_frame,x                   ; $06BB5E |
  TYA                                       ; $06BB61 |
  INC A                                     ; $06BB62 |
  AND #$07                                  ; $06BB63 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06BB65 |
  REP #$20                                  ; $06BB67 |

CODE_06BB69:
  RTL                                       ; $06BB69 |

  db $04, $04, $04, $04                     ; $06BB6A |
  db $08, $0C, $08, $08                     ; $06BB6E |
  db $08, $08, $0C, $0C                     ; $06BB72 |
  db $0C, $0C, $08, $04                     ; $06BB76 |

init_cloud_drop_horizontal:
  LDA !s_spr_x_pixel_pos,x                  ; $06BB7A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06BB7D |
  LDA !s_spr_x_pixel_pos,x                  ; $06BB7F |
  AND #$0010                                ; $06BB82 |
  BEQ CODE_06BBA5                           ; $06BB85 |
  LDA $BA2F                                 ; $06BB87 |
  STA !s_spr_x_accel_ceiling,x              ; $06BB8A |
  LDA #$FE70                                ; $06BB8D |
  STA !s_spr_x_speed_lo,x                   ; $06BB90 |
  LDA #$000F                                ; $06BB93 |
  STA !s_spr_anim_frame,x                   ; $06BB96 |
  TAY                                       ; $06BB99 |
  LDA $BB6A,y                               ; $06BB9A |
  AND #$00FF                                ; $06BB9D |
  STA !s_spr_x_hitbox_offset,x              ; $06BBA0 |
  BRA CODE_06BBC1                           ; $06BBA3 |

CODE_06BBA5:
  LDA $BA31                                 ; $06BBA5 |
  STA !s_spr_y_accel_ceiling,x              ; $06BBA8 |
  LDA #$0180                                ; $06BBAB |
  STA !s_spr_x_speed_lo,x                   ; $06BBAE |
  LDA #$0005                                ; $06BBB1 |
  STA !s_spr_anim_frame,x                   ; $06BBB4 |
  TAY                                       ; $06BBB7 |
  LDA $BB6A,y                               ; $06BBB8 |
  AND #$00FF                                ; $06BBBB |
  STA !s_spr_x_hitbox_offset,x              ; $06BBBE |

CODE_06BBC1:
  STZ !s_spr_timer_1,x                      ; $06BBC1 |
  LDA #$0010                                ; $06BBC4 |
  STA !s_spr_x_accel,x                      ; $06BBC7 |
  RTL                                       ; $06BBCA |

  db $04, $03, $02, $01                     ; $06BBCB |
  db $0E, $0D, $0C, $0B                     ; $06BBCF |

main_cloud_drop_horizontal:
  LDA !s_spr_collision_state,x              ; $06BBD3 |
  BEQ CODE_06BBF0                           ; $06BBD6 |
  LDA !s_sprite_disable_flag                ; $06BBD8 |
  ORA $0B55                                 ; $06BBDB |
  ORA !r_cur_item_used                      ; $06BBDE |
  BNE CODE_06BBF0                           ; $06BBE1 |
  LDA !s_spr_bitwise_settings_1,x           ; $06BBE3 |
  ORA #$0200                                ; $06BBE6 |
  STA !s_spr_bitwise_settings_1,x           ; $06BBE9 |
  JSL $06BCA9                               ; $06BBEC |

CODE_06BBF0:
  JSL $03AF23                               ; $06BBF0 |
  JSL $06BAF3                               ; $06BBF4 |
  STZ !s_spr_facing_dir,x                   ; $06BBF8 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06BBFB |
  BNE CODE_06BC51                           ; $06BBFD |
  LDA #$0010                                ; $06BBFF |
  STA !s_spr_x_accel,x                      ; $06BC02 |
  LDY #$00                                  ; $06BC05 |
  LDA !s_spr_x_pixel_pos,x                  ; $06BC07 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $06BC0A |
  BCC CODE_06BC10                           ; $06BC0C |
  LDY #$02                                  ; $06BC0E |

CODE_06BC10:
  LDA $BA2F,y                               ; $06BC10 |
  STA !s_spr_x_accel_ceiling,x              ; $06BC13 |
  LDA !s_spr_x_speed_lo,x                   ; $06BC16 |
  BNE CODE_06BC2B                           ; $06BC19 |
  LDA #$0004                                ; $06BC1B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06BC1E |
  LDA #$0005                                ; $06BC20 |
  STA !s_spr_timer_1,x                      ; $06BC23 |
  STZ !s_spr_x_accel,x                      ; $06BC26 |
  BRA CODE_06BC91                           ; $06BC29 |

CODE_06BC2B:
  BPL CODE_06BC3F                           ; $06BC2B |
  LDA #$000F                                ; $06BC2D |
  STA !s_spr_anim_frame,x                   ; $06BC30 |
  TAY                                       ; $06BC33 |
  LDA $BB6A,y                               ; $06BC34 |
  AND #$00FF                                ; $06BC37 |
  STA !s_spr_x_hitbox_offset,x              ; $06BC3A |
  BRA CODE_06BC91                           ; $06BC3D |

CODE_06BC3F:
  LDA #$0005                                ; $06BC3F |
  STA !s_spr_anim_frame,x                   ; $06BC42 |
  TAY                                       ; $06BC45 |
  LDA $BB6A,y                               ; $06BC46 |
  AND #$00FF                                ; $06BC49 |
  STA !s_spr_x_hitbox_offset,x              ; $06BC4C |
  BRA CODE_06BC91                           ; $06BC4F |

CODE_06BC51:
  LDA #$BBCB                                ; $06BC51 |
  LDY $75E1,x                               ; $06BC54 |
  BPL CODE_06BC5C                           ; $06BC57 |
  LDA #$BBCF                                ; $06BC59 |

CODE_06BC5C:
  STA $00                                   ; $06BC5C |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06BC5E |
  LSR A                                     ; $06BC60 |
  BNE CODE_06BC6F                           ; $06BC61 |
  LDA !s_spr_timer_1,x                      ; $06BC63 |
  LSR A                                     ; $06BC66 |
  BNE CODE_06BC6F                           ; $06BC67 |
  LDA #$0010                                ; $06BC69 |
  STA !s_spr_x_accel,x                      ; $06BC6C |

CODE_06BC6F:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06BC6F |
  DEY                                       ; $06BC71 |
  LDA ($00),y                               ; $06BC72 |
  AND #$00FF                                ; $06BC74 |
  STA !s_spr_anim_frame,x                   ; $06BC77 |
  TAY                                       ; $06BC7A |
  LDA $BB6A,y                               ; $06BC7B |
  AND #$00FF                                ; $06BC7E |
  STA !s_spr_x_hitbox_offset,x              ; $06BC81 |
  LDA !s_spr_timer_1,x                      ; $06BC84 |
  BNE CODE_06BC91                           ; $06BC87 |
  LDA #$0005                                ; $06BC89 |
  STA !s_spr_timer_1,x                      ; $06BC8C |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $06BC8F |

CODE_06BC91:
  JSL $03A5B7                               ; $06BC91 |
  RTL                                       ; $06BC95 |

  db $06, $07, $08, $09                     ; $06BC96 |

head_bop_cloud_drop_horizontal:
  LDA #$0180                                ; $06BC9A |
  STA !s_spr_y_accel_ceiling,x              ; $06BC9D |
  LDA #$0010                                ; $06BCA0 |
  STA !s_spr_y_accel,x                      ; $06BCA3 |
  STZ !s_spr_x_speed_lo,x                   ; $06BCA6 |
  LDA !s_spr_timer_2,x                      ; $06BCA9 |
  BNE CODE_06BCC5                           ; $06BCAC |
  SEP #$20                                  ; $06BCAE |
  LDA #$05                                  ; $06BCB0 |
  STA !s_spr_timer_2,x                      ; $06BCB2 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06BCB5 |
  LDA $BC96,y                               ; $06BCB7 |
  STA !s_spr_anim_frame,x                   ; $06BCBA |
  TYA                                       ; $06BCBD |
  INC A                                     ; $06BCBE |
  AND #$03                                  ; $06BCBF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06BCC1 |
  REP #$20                                  ; $06BCC3 |

CODE_06BCC5:
  RTL                                       ; $06BCC5 |

  TYX                                       ; $06BCC6 |
  RTS                                       ; $06BCC7 |

init_baby_mario:
  LDY #$C0                                  ; $06BCC8 |
  STY $7863                                 ; $06BCCA |
  RTL                                       ; $06BCCD |

  dw $C32B                                  ; $06BCCE |
  dw $C383                                  ; $06BCD0 |
  dw $BCC6                                  ; $06BCD2 |
  dw $C48E                                  ; $06BCD4 |
  dw $BCC6                                  ; $06BCD6 |
  dw $C4BD                                  ; $06BCD8 |
  dw $C591                                  ; $06BCDA |
  dw $C6D1                                  ; $06BCDC |
  dw $C4C4                                  ; $06BCDE |
  dw $C61F                                  ; $06BCE0 |
  dw $C4C4                                  ; $06BCE2 |
  dw $C6EC                                  ; $06BCE4 |
  dw $C812                                  ; $06BCE6 |
  dw $C4C4                                  ; $06BCE8 |
  dw $C61F                                  ; $06BCEA |

main_baby_mario:
  LDY #$06                                  ; $06BCEC |
  LDA !s_spr_oam_1                          ; $06BCEE |
  AND #$E000                                ; $06BCF1 |
  BEQ CODE_06BCF8                           ; $06BCF4 |
  LDY #$0C                                  ; $06BCF6 |

CODE_06BCF8:
  STY $7BB6                                 ; $06BCF8 |
  STY $7BB8                                 ; $06BCFB |
  LDY $0B59                                 ; $06BCFE |
  BEQ CODE_06BD2E                           ; $06BD01 |
  LDA #$0006                                ; $06BD03 |
  CLC                                       ; $06BD06 |
  ADC !s_player_hitbox_half_width           ; $06BD07 |
  ASL A                                     ; $06BD0A |
  STA $00                                   ; $06BD0B |
  LSR A                                     ; $06BD0D |
  CLC                                       ; $06BD0E |
  ADC !s_spr_x_player_delta                 ; $06BD0F |
  CMP $00                                   ; $06BD12 |
  BCS CODE_06BD2E                           ; $06BD14 |
  LDA #$0006                                ; $06BD16 |
  CLC                                       ; $06BD19 |
  ADC !s_player_hitbox_half_height          ; $06BD1A |
  ASL A                                     ; $06BD1D |
  STA $00                                   ; $06BD1E |
  LSR A                                     ; $06BD20 |
  CLC                                       ; $06BD21 |
  ADC !s_spr_y_player_delta                 ; $06BD22 |
  CMP $00                                   ; $06BD25 |
  BCS CODE_06BD2E                           ; $06BD27 |
  LDY #$FF                                  ; $06BD29 |
  STY !s_spr_collision_id                   ; $06BD2B |

CODE_06BD2E:
  LDA !r_header_level_mode                  ; $06BD2E |
  CMP #$0009                                ; $06BD31 |
  BNE CODE_06BD39                           ; $06BD34 |
  JMP CODE_06CA2D                           ; $06BD36 |

CODE_06BD39:
  JSR CODE_06BD81                           ; $06BD39 |
  LDA $7860                                 ; $06BD3C |
  ORA $0DB6                                 ; $06BD3F |
  STA $7860                                 ; $06BD42 |
  LDY $0B57                                 ; $06BD45 |
  BEQ CODE_06BD50                           ; $06BD48 |
  LDA #$0030                                ; $06BD4A |
  TSB !s_spr_oam_yxppccct                   ; $06BD4D |

CODE_06BD50:
  JSR CODE_06C281                           ; $06BD50 |
  JSR CODE_06BFDC                           ; $06BD53 |
  LDA $76                                   ; $06BD56 |
  ASL A                                     ; $06BD58 |
  TAX                                       ; $06BD59 |
  JSR ($BCCE,x)                             ; $06BD5A |
  LDX $12                                   ; $06BD5D |
  JSR CODE_06C1EF                           ; $06BD5F |
  JSR CODE_06C2FA                           ; $06BD62 |
  JSR CODE_06C26A                           ; $06BD65 |
  LDA !s_baby_mario_state                   ; $06BD68 |
  AND #$C000                                ; $06BD6B |
  BEQ CODE_06BD75                           ; $06BD6E |
  LDY #$FF                                  ; $06BD70 |
  STY $7862                                 ; $06BD72 |

CODE_06BD75:
  STZ $0DB6                                 ; $06BD75 |
  RTL                                       ; $06BD78 |

  dw $0008, $0004                           ; $06BD79 |
  dw $0002, $0001                           ; $06BD7D |

CODE_06BD81:
  LDY $61CC                                 ; $06BD81 |
  BNE CODE_06BDCD                           ; $06BD84 |
  LDY #$00                                  ; $06BD86 |
  LDA !s_spr_x_pixel_pos                    ; $06BD88 |
  CMP !s_cam_x_left_boundary                ; $06BD8B |
  BPL CODE_06BD95                           ; $06BD8E |
  LDA !s_cam_x_left_boundary                ; $06BD90 |
  BRA CODE_06BDA7                           ; $06BD93 |

CODE_06BD95:
  SEC                                       ; $06BD95 |
  SBC #$00F0                                ; $06BD96 |
  CMP !s_cam_x_right_boundary               ; $06BD99 |
  BMI CODE_06BDCE                           ; $06BD9C |
  INY                                       ; $06BD9E |
  INY                                       ; $06BD9F |
  LDA !s_cam_x_right_boundary               ; $06BDA0 |
  CLC                                       ; $06BDA3 |
  ADC #$00EF                                ; $06BDA4 |

CODE_06BDA7:
  STA !s_spr_x_pixel_pos                    ; $06BDA7 |
  LDA $BD79,y                               ; $06BDAA |
  TSB $7860                                 ; $06BDAD |
  LDA !s_spr_x_accel_ceiling                ; $06BDB0 |
  EOR #$FFFF                                ; $06BDB3 |
  INC A                                     ; $06BDB6 |
  STA !s_spr_x_accel_ceiling                ; $06BDB7 |
  LDA !s_spr_x_speed_lo                     ; $06BDBA |
  EOR #$FFFF                                ; $06BDBD |
  INC A                                     ; $06BDC0 |
  STA !s_spr_x_speed_lo                     ; $06BDC1 |
  LDA !s_spr_facing_dir                     ; $06BDC4 |
  EOR #$0002                                ; $06BDC7 |
  STA !s_spr_facing_dir                     ; $06BDCA |

CODE_06BDCD:
  RTS                                       ; $06BDCD |

CODE_06BDCE:
  LDA !r_cur_autoscr                        ; $06BDCE |
  BEQ CODE_06BDCD                           ; $06BDD1 |
  LDY $76                                   ; $06BDD3 |
  CPY #$01                                  ; $06BDD5 |
  BEQ CODE_06BDCD                           ; $06BDD7 |
  LDA !s_spr_oam_1                          ; $06BDD9 |
  AND #$E000                                ; $06BDDC |
  BEQ CODE_06BDCD                           ; $06BDDF |
  LDY #$00                                  ; $06BDE1 |
  LDA !s_spr_cam_x_pos                      ; $06BDE3 |
  SEC                                       ; $06BDE6 |
  SBC #$0008                                ; $06BDE7 |
  BMI CODE_06BDFF                           ; $06BDEA |
  SEC                                       ; $06BDEC |
  SBC #$00E0                                ; $06BDED |
  BMI CODE_06BE29                           ; $06BDF0 |
  STA $00                                   ; $06BDF2 |
  INY                                       ; $06BDF4 |
  INY                                       ; $06BDF5 |
  LDA !r_bg1_cam_x                          ; $06BDF6 |
  CLC                                       ; $06BDF9 |
  ADC #$00E7                                ; $06BDFA |
  BRA CODE_06BE08                           ; $06BDFD |

CODE_06BDFF:
  STA $00                                   ; $06BDFF |
  LDA !r_bg1_cam_x                          ; $06BE01 |
  CLC                                       ; $06BE04 |
  ADC #$0008                                ; $06BE05 |

CODE_06BE08:
  STA !s_spr_x_pixel_pos                    ; $06BE08 |
  LDA $00                                   ; $06BE0B |
  EOR !s_spr_x_accel_ceiling                ; $06BE0D |
  BMI CODE_06BE22                           ; $06BE10 |
  LDA $BD79,y                               ; $06BE12 |
  TSB $7860                                 ; $06BE15 |
  LDA !s_spr_x_accel_ceiling                ; $06BE18 |
  EOR #$FFFF                                ; $06BE1B |
  INC A                                     ; $06BE1E |
  STA !s_spr_x_accel_ceiling                ; $06BE1F |

CODE_06BE22:
  LDA !s_spr_x_accel_ceiling                ; $06BE22 |
  ASL A                                     ; $06BE25 |
  STA !s_spr_x_speed_lo                     ; $06BE26 |

CODE_06BE29:
  LDY #$04                                  ; $06BE29 |
  LDA !s_spr_cam_y_pos                      ; $06BE2B |
  SEC                                       ; $06BE2E |
  SBC #$0008                                ; $06BE2F |
  BMI CODE_06BE47                           ; $06BE32 |
  SEC                                       ; $06BE34 |
  SBC #$00C0                                ; $06BE35 |
  BMI CODE_06BE71                           ; $06BE38 |
  STA $00                                   ; $06BE3A |
  INY                                       ; $06BE3C |
  INY                                       ; $06BE3D |
  LDA !r_bg1_cam_y                          ; $06BE3E |
  CLC                                       ; $06BE41 |
  ADC #$00C7                                ; $06BE42 |
  BRA CODE_06BE50                           ; $06BE45 |

CODE_06BE47:
  STA $00                                   ; $06BE47 |
  LDA !r_bg1_cam_y                          ; $06BE49 |
  CLC                                       ; $06BE4C |
  ADC #$0008                                ; $06BE4D |

CODE_06BE50:
  STA !s_spr_y_pixel_pos                    ; $06BE50 |
  LDA $00                                   ; $06BE53 |
  EOR !s_spr_y_accel_ceiling                ; $06BE55 |
  BMI CODE_06BE6A                           ; $06BE58 |
  LDA $BD79,y                               ; $06BE5A |
  TSB $7860                                 ; $06BE5D |
  LDA !s_spr_y_accel_ceiling                ; $06BE60 |
  EOR #$FFFF                                ; $06BE63 |
  INC A                                     ; $06BE66 |
  STA !s_spr_y_accel_ceiling                ; $06BE67 |

CODE_06BE6A:
  LDA !s_spr_y_accel_ceiling                ; $06BE6A |
  ASL A                                     ; $06BE6D |
  STA !s_spr_y_speed_lo                     ; $06BE6E |

CODE_06BE71:
  RTS                                       ; $06BE71 |

  LDA !s_spr_oam_1                          ; $06BE72 |
  AND #$E000                                ; $06BE75 |
  BEQ CODE_06BE8A                           ; $06BE78 |
  STZ !s_spr_x_accel                        ; $06BE7A |
  STZ !s_spr_y_accel                        ; $06BE7D |
  STZ !s_spr_x_speed_lo                     ; $06BE80 |
  STZ !s_spr_y_speed_lo                     ; $06BE83 |
  LDY #$09                                  ; $06BE86 |
  BRA CODE_06BE8F                           ; $06BE88 |

CODE_06BE8A:
  JSR CODE_06BF1E                           ; $06BE8A |
  LDY #$08                                  ; $06BE8D |

CODE_06BE8F:
  STY $76                                   ; $06BE8F |
  LDA #$6040                                ; $06BE91 |
  STA $6FA2                                 ; $06BE94 |
  LDA #$0002                                ; $06BE97 |
  STA !s_spr_wildcard_2_lo                  ; $06BE9A |
  STA !s_spr_wildcard_2_lo,x                ; $06BE9D |
  ASL A                                     ; $06BEA0 |
  STA !s_spr_draw_priority                  ; $06BEA1 |
  STX $18                                   ; $06BEA4 |
  LDA !s_baby_mario_state                   ; $06BEA6 |
  ORA #$4000                                ; $06BEA9 |
  STA !s_baby_mario_state                   ; $06BEAC |
  STZ $0D9C                                 ; $06BEAF |
  LDA #$003D                                ; $06BEB2 |
  JSL push_sound_queue                      ; $06BEB5 |
  RTL                                       ; $06BEB9 |

  LDA #$003D                                ; $06BEBA |
  JSL push_sound_queue                      ; $06BEBD |
  JSR CODE_06BF1E                           ; $06BEC1 |
  LDA #$0020                                ; $06BEC4 |
  STA !s_spr_y_accel                        ; $06BEC7 |
  LDA #$0008                                ; $06BECA |
  STA !s_spr_x_accel                        ; $06BECD |
  STZ !s_spr_y_accel_ceiling                ; $06BED0 |
  STZ !s_spr_x_accel_ceiling                ; $06BED3 |
  LDY #$0A                                  ; $06BED6 |
  STY $76                                   ; $06BED8 |

CODE_06BEDA:
  LDA !s_player_y                           ; $06BEDA |
  SEC                                       ; $06BEDD |
  SBC #$0030                                ; $06BEDE |
  CLC                                       ; $06BEE1 |
  ADC !s_bg1_cam_y                          ; $06BEE2 |
  CLC                                       ; $06BEE5 |
  ADC #$0030                                ; $06BEE6 |
  CMP #$8000                                ; $06BEE9 |
  ROR A                                     ; $06BEEC |
  STA $0DB2                                 ; $06BEED |
  RTL                                       ; $06BEF0 |

  JSR CODE_06BF1E                           ; $06BEF1 |
  LDA #$0020                                ; $06BEF4 |
  STA !s_spr_y_accel                        ; $06BEF7 |
  LDA #$0008                                ; $06BEFA |
  STA !s_spr_x_accel                        ; $06BEFD |
  STZ !s_spr_y_accel_ceiling                ; $06BF00 |
  STZ !s_spr_x_accel_ceiling                ; $06BF03 |
  LDY #$0D                                  ; $06BF06 |
  STY $76                                   ; $06BF08 |
  LDA #$003D                                ; $06BF0A |
  JSL push_sound_queue                      ; $06BF0D |
  RTL                                       ; $06BF11 |

  JSL $06C114                               ; $06BF12 |
  JSL $06BF73                               ; $06BF16 |
  JSR CODE_06C070                           ; $06BF1A |
  RTL                                       ; $06BF1D |

CODE_06BF1E:
  LDA #$001B                                ; $06BF1E |
  STA !s_spr_anim_frame                     ; $06BF21 |
  STZ !s_spr_x_speed_lo                     ; $06BF24 |
  STZ !s_spr_y_speed_lo                     ; $06BF27 |
  STZ !s_spr_x_accel                        ; $06BF2A |
  STZ !s_spr_y_accel                        ; $06BF2D |
  LDA #$F620                                ; $06BF30 |
  STA $6FA0                                 ; $06BF33 |
  LDA #$604F                                ; $06BF36 |
  STA $6FA2                                 ; $06BF39 |
  LDA #$3001                                ; $06BF3C |
  STA !s_spr_oam_1                          ; $06BF3F |
  LDA !s_baby_mario_state                   ; $06BF42 |
  BPL CODE_06BF5F                           ; $06BF45 |
  AND #$7FFF                                ; $06BF47 |
  STA !s_baby_mario_state                   ; $06BF4A |
  LDA #$0040                                ; $06BF4D |
  STA !s_spr_timer_4                        ; $06BF50 |
  LDA #$FFFF                                ; $06BF53 |
  STA $7E48                                 ; $06BF56 |
  LDA #$0000                                ; $06BF59 |
  STA $0D92                                 ; $06BF5C |

CODE_06BF5F:
  LDA #$0010                                ; $06BF5F |
  STA !s_spr_state                          ; $06BF62 |
  STZ $16                                   ; $06BF65 |
  STZ !s_spr_wildcard_2_lo                  ; $06BF67 |
  STZ $7860                                 ; $06BF6A |
  LDY #$00                                  ; $06BF6D |
  STY $7862                                 ; $06BF6F |
  RTS                                       ; $06BF72 |

  LDA !s_spr_oam_1                          ; $06BF73 |
  AND #$E000                                ; $06BF76 |
  BEQ CODE_06BFDB                           ; $06BF79 |
  LDA #$000D                                ; $06BF7B |
  STA !s_spr_anim_frame                     ; $06BF7E |
  LDA #$0040                                ; $06BF81 |
  STA !s_spr_y_accel                        ; $06BF84 |
  LDA #$0400                                ; $06BF87 |
  STA !s_spr_y_accel_ceiling                ; $06BF8A |
  STZ !s_spr_x_accel                        ; $06BF8D |
  LDA #$604F                                ; $06BF90 |
  STA $6FA2                                 ; $06BF93 |
  LDA #$1801                                ; $06BF96 |
  STA !s_spr_oam_1                          ; $06BF99 |
  STZ !s_spr_timer_4                        ; $06BF9C |
  LDY #$00                                  ; $06BF9F |
  STY $7862                                 ; $06BFA1 |
  LDA #$01E1                                ; $06BFA4 |
  JSL spawn_ambient_sprite                  ; $06BFA7 |
  LDA !s_spr_x_pixel_pos                    ; $06BFAB |
  CLC                                       ; $06BFAE |
  ADC #$0008                                ; $06BFAF |
  STA $70A2,y                               ; $06BFB2 |
  LDA !s_spr_y_pixel_pos                    ; $06BFB5 |
  CLC                                       ; $06BFB8 |
  ADC #$0008                                ; $06BFB9 |
  STA $7142,y                               ; $06BFBC |
  LDA #$000A                                ; $06BFBF |
  STA $73C2,y                               ; $06BFC2 |
  STA $7E4E,y                               ; $06BFC5 |
  LDA #$000C                                ; $06BFC8 |
  STA $7E4C,y                               ; $06BFCB |
  LDA #$0001                                ; $06BFCE |

CODE_06BFD1:
  STA $7782,y                               ; $06BFD1 |
  LDA #$003B                                ; $06BFD4 |
  JSL push_sound_queue                      ; $06BFD7 |

CODE_06BFDB:
  RTL                                       ; $06BFDB |

CODE_06BFDC:
  LDA $0B59                                 ; $06BFDC |
  BEQ CODE_06BFE9                           ; $06BFDF |
  LDA !s_spr_state                          ; $06BFE1 |
  CMP #$000A                                ; $06BFE4 |
  BEQ CODE_06BFEC                           ; $06BFE7 |

CODE_06BFE9:
  JSR CODE_06C9E1                           ; $06BFE9 |

CODE_06BFEC:
  LDA !s_spr_state                          ; $06BFEC |
  CMP #$000A                                ; $06BFEF |
  BEQ CODE_06C065                           ; $06BFF2 |
  LDY $0D9A                                 ; $06BFF4 |
  BEQ CODE_06C00A                           ; $06BFF7 |
  JSL $03B69D                               ; $06BFF9 |

CODE_06BFFD:
  JSL $03B716                               ; $06BFFD |
  LDA !s_spr_state                          ; $06C001 |
  CMP #$0008                                ; $06C004 |
  BEQ CODE_06C028                           ; $06C007 |
  RTS                                       ; $06C009 |

CODE_06C00A:
  LDY $76                                   ; $06C00A |
  CPY #$3005                                ; $06C00C |
  BPL CODE_06BFD1                           ; $06C00F |
  PHP                                       ; $06C011 |
  BPL CODE_06C020                           ; $06C012 |
  LDA !s_sprite_disable_flag                ; $06C014 |
  ORA $0B55                                 ; $06C017 |
  ORA !r_cur_item_used                      ; $06C01A |
  BNE CODE_06BFFD                           ; $06C01D |
  RTS                                       ; $06C01F |

CODE_06C020:
  LDA !s_spr_state                          ; $06C020 |
  CMP #$0008                                ; $06C023 |
  BNE CODE_06C065                           ; $06C026 |

CODE_06C028:
  STA $0D9A                                 ; $06C028 |
  STA !s_sprite_disable_flag                ; $06C02B |
  LDA #$8000                                ; $06C02E |
  TSB !s_player_disable_flag                ; $06C031 |
  LDY $76                                   ; $06C034 |
  CPY #$3008                                ; $06C036 |
  PHP                                       ; $06C039 |
  JSL $06C114                               ; $06C03A |
  JSL $06BF73                               ; $06C03E |
  LDY !s_player_mouth_state                 ; $06C042 |
  CPY #$D004                                ; $06C045 |
  ASL A                                     ; $06C048 |
  LDA !s_player_tongue_y_rel                ; $06C049 |
  CMP #$FFF0                                ; $06C04C |
  BMI CODE_06C065                           ; $06C04F |
  BRA CODE_06C05F                           ; $06C051 |
  LDA !s_player_tongue_x_rel                ; $06C053 |
  CLC                                       ; $06C056 |
  ADC #$0010                                ; $06C057 |
  CMP #$0020                                ; $06C05A |
  BCS CODE_06C065                           ; $06C05D |

CODE_06C05F:
  STZ !s_tongued_sprite_slot                ; $06C05F |
  JSR CODE_06C070                           ; $06C062 |

CODE_06C065:
  PLA                                       ; $06C065 |
  STA $00                                   ; $06C066 |
  JSL $03AF23                               ; $06C068 |
  LDA $00                                   ; $06C06C |
  PHA                                       ; $06C06E |
  RTS                                       ; $06C06F |

CODE_06C070:
  LDA #$0010                                ; $06C070 |
  STA !s_spr_state                          ; $06C073 |
  LDY #$00                                  ; $06C076 |
  STY $7862                                 ; $06C078 |
  LDA #$0040                                ; $06C07B |
  STA !s_spr_y_accel                        ; $06C07E |
  LDY #$01                                  ; $06C081 |
  STY $76                                   ; $06C083 |
  STZ $0D9C                                 ; $06C085 |
  LDY $0B57                                 ; $06C088 |
  BNE CODE_06C099                           ; $06C08B |
  INC $0D9A                                 ; $06C08D |
  LDA #$0001                                ; $06C090 |
  STA !s_player_disable_flag                ; $06C093 |
  INC !s_sprite_disable_flag                ; $06C096 |

CODE_06C099:
  RTS                                       ; $06C099 |

  LDA #$0400                                ; $06C09A |
  STA !s_spr_y_accel_ceiling                ; $06C09D |
  LDA #$0040                                ; $06C0A0 |
  STA !s_spr_y_accel                        ; $06C0A3 |
  LDY #$0A                                  ; $06C0A6 |
  LDA !s_spr_oam_1                          ; $06C0A8 |
  AND #$E000                                ; $06C0AB |
  BEQ CODE_06C0CF                           ; $06C0AE |
  INY                                       ; $06C0B0 |
  BRA CODE_06C0CF                           ; $06C0B1 |
  LDA $76                                   ; $06C0B3 |
  SEC                                       ; $06C0B5 |
  SBC #$000D                                ; $06C0B6 |
  BRA CODE_06C0CB                           ; $06C0B9 |
  LDA $76                                   ; $06C0BB |
  CMP #$0008                                ; $06C0BD |
  BEQ CODE_06C0C7                           ; $06C0C0 |
  CMP #$0009                                ; $06C0C2 |
  BNE CODE_06C0FD                           ; $06C0C5 |

CODE_06C0C7:
  SEC                                       ; $06C0C7 |
  SBC #$0008                                ; $06C0C8 |

CODE_06C0CB:
  CLC                                       ; $06C0CB |
  ADC #$000A                                ; $06C0CC |

CODE_06C0CF:
  STA $76                                   ; $06C0CF |
  CMP #$000B                                ; $06C0D1 |
  BNE CODE_06C0FD                           ; $06C0D4 |
  LDA #$FF00                                ; $06C0D6 |
  STA !s_spr_y_speed_lo                     ; $06C0D9 |
  LDA #$0002                                ; $06C0DC |
  STA !s_spr_x_accel                        ; $06C0DF |
  ASL A                                     ; $06C0E2 |
  STA !s_spr_y_accel                        ; $06C0E3 |
  LDA #$FF00                                ; $06C0E6 |
  STA !s_spr_y_accel_ceiling                ; $06C0E9 |
  LDX !s_spr_facing_dir                     ; $06C0EC |
  LDA $06C4B9,x                             ; $06C0EF |
  STA !s_spr_x_accel_ceiling                ; $06C0F3 |
  LDX $12                                   ; $06C0F6 |
  STZ !s_spr_timer_3                        ; $06C0F8 |
  STZ $16                                   ; $06C0FB |

CODE_06C0FD:
  STZ $18                                   ; $06C0FD |
  STZ !s_spr_wildcard_2_lo                  ; $06C0FF |
  LDA !s_baby_mario_state                   ; $06C102 |
  AND #$BFFF                                ; $06C105 |
  STA !s_baby_mario_state                   ; $06C108 |
  LDA #$604F                                ; $06C10B |
  STA $6FA2                                 ; $06C10E |
  JMP CODE_06BEDA                           ; $06C111 |
  LDY $18                                   ; $06C114 |
  BNE CODE_06C119                           ; $06C116 |
  RTL                                       ; $06C118 |

CODE_06C119:
  JSL $06C0BB                               ; $06C119 |
  LDA !s_spr_id,y                           ; $06C11D |
  CMP #$00D9                                ; $06C120 |
  BNE CODE_06C12A                           ; $06C123 |
  LDA $100F                                 ; $06C125 |
  BNE CODE_06C136                           ; $06C128 |

CODE_06C12A:
  LDA !s_spr_x_pixel_pos,y                  ; $06C12A |
  STA !s_spr_x_pixel_pos                    ; $06C12D |
  LDA !s_spr_y_pixel_pos,y                  ; $06C130 |
  STA !s_spr_y_pixel_pos                    ; $06C133 |

CODE_06C136:
  LDA !s_spr_id,y                           ; $06C136 |
  CMP #$0058                                ; $06C139 |
  BEQ CODE_06C16E                           ; $06C13C |
  CMP #$005C                                ; $06C13E |
  BEQ CODE_06C173                           ; $06C141 |
  CMP #$0184                                ; $06C143 |
  BEQ CODE_06C16D                           ; $06C146 |
  CMP #$00D9                                ; $06C148 |
  BEQ CODE_06C1B4                           ; $06C14B |
  CMP #$0119                                ; $06C14D |
  BEQ CODE_06C16D                           ; $06C150 |
  CMP #$0017                                ; $06C152 |
  BNE CODE_06C15A                           ; $06C155 |
  JMP CODE_06C1DF                           ; $06C157 |

CODE_06C15A:
  CMP #$01A5                                ; $06C15A |
  BCC CODE_06C189                           ; $06C15D |
  CMP #$01AA                                ; $06C15F |
  BCS CODE_06C189                           ; $06C162 |
  TYX                                       ; $06C164 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $06C165 |
  JSL $02B2BB                               ; $06C167 |
  LDX $12                                   ; $06C16B |

CODE_06C16D:
  RTL                                       ; $06C16D |

CODE_06C16E:
  LDA #$0000                                ; $06C16E |
  BRA CODE_06C176                           ; $06C171 |

CODE_06C173:
  LDA #$0005                                ; $06C173 |

CODE_06C176:
  STA !s_spr_wildcard_5_lo,y                ; $06C176 |
  LDA #$0040                                ; $06C179 |
  STA !s_spr_timer_4,y                      ; $06C17C |
  LDA #$0000                                ; $06C17F |
  STA !s_spr_gsu_morph_2_lo,y               ; $06C182 |
  STA !s_spr_wildcard_2_lo,y                ; $06C185 |
  RTL                                       ; $06C188 |

CODE_06C189:
  SEP #$20                                  ; $06C189 |
  LDA #$12                                  ; $06C18B |
  STA !s_spr_wildcard_5_lo,y                ; $06C18D |
  REP #$20                                  ; $06C190 |
  LDA #$000A                                ; $06C192 |
  STA !s_spr_gsu_morph_1_lo,y               ; $06C195 |
  LDA #$0012                                ; $06C198 |
  STA !s_spr_anim_frame,y                   ; $06C19B |
  LDA #$0040                                ; $06C19E |
  STA $7A98,y                               ; $06C1A1 |
  LDA #$0000                                ; $06C1A4 |
  STA !s_spr_gsu_morph_2_lo,y               ; $06C1A7 |
  STA !s_spr_wildcard_2_lo,y                ; $06C1AA |
  STA !s_spr_x_speed_lo,y                   ; $06C1AD |
  STA !s_spr_x_accel,y                      ; $06C1B0 |
  RTL                                       ; $06C1B3 |

CODE_06C1B4:
  LDA #$0001                                ; $06C1B4 |
  STA !s_spr_wildcard_5_lo,y                ; $06C1B7 |
  LDA #$0100                                ; $06C1BA |
  STA !s_spr_y_accel_ceiling,y              ; $06C1BD |
  LDA #$0008                                ; $06C1C0 |
  STA !s_spr_y_accel,y                      ; $06C1C3 |
  LDA #$0000                                ; $06C1C6 |
  STA !s_spr_gsu_morph_2_lo,y               ; $06C1C9 |
  STA !s_spr_wildcard_2_lo,y                ; $06C1CC |
  STA !s_spr_anim_frame,y                   ; $06C1CF |
  LDA #$0060                                ; $06C1D2 |
  STA !s_spr_timer_4,y                      ; $06C1D5 |
  LDA #$0200                                ; $06C1D8 |
  STA !s_spr_wildcard_1_lo,y                ; $06C1DB |
  RTL                                       ; $06C1DE |

CODE_06C1DF:
  SEP #$20                                  ; $06C1DF |
  LDA #$00                                  ; $06C1E1 |
  STA !s_spr_wildcard_2_lo,y                ; $06C1E3 |
  REP #$20                                  ; $06C1E6 |
  LDA #$0080                                ; $06C1E8 |
  STA !s_spr_timer_4,y                      ; $06C1EB |
  RTL                                       ; $06C1EE |

CODE_06C1EF:
  LDA $0D94                                 ; $06C1EF |
  ORA $614A                                 ; $06C1F2 |
  ORA $0D9C                                 ; $06C1F5 |
  BEQ CODE_06C1FB                           ; $06C1F8 |

CODE_06C1FA:
  RTS                                       ; $06C1FA |

CODE_06C1FB:
  LDY !s_spr_collision_id                   ; $06C1FB |
  BPL CODE_06C1FA                           ; $06C1FE |
  LDA !s_player_invincibility_timer         ; $06C200 |
  CMP #$0050                                ; $06C203 |
  BPL CODE_06C1FA                           ; $06C206 |
  LDY $76                                   ; $06C208 |
  CPY #$04                                  ; $06C20A |
  BMI CODE_06C212                           ; $06C20C |
  CPY #$08                                  ; $06C20E |
  BMI CODE_06C1FA                           ; $06C210 |

CODE_06C212:
  LDA !s_spr_timer_4                        ; $06C212 |
  BEQ CODE_06C25F                           ; $06C215 |
  CMP #$0020                                ; $06C217 |
  BCS CODE_06C1FA                           ; $06C21A |
  LDY $18                                   ; $06C21C |
  BEQ CODE_06C1FA                           ; $06C21E |
  LDA !s_spr_id,y                           ; $06C220 |
  CMP #$0020                                ; $06C223 |
  BEQ CODE_06C237                           ; $06C226 |
  CMP #$00A3                                ; $06C228 |
  BEQ CODE_06C237                           ; $06C22B |
  CMP #$00A4                                ; $06C22D |
  BEQ CODE_06C237                           ; $06C230 |
  CMP #$005B                                ; $06C232 |
  BNE CODE_06C25F                           ; $06C235 |

CODE_06C237:
  SEP #$20                                  ; $06C237 |
  LDA #$18                                  ; $06C239 |
  STA !s_spr_wildcard_5_lo,y                ; $06C23B |
  REP #$20                                  ; $06C23E |
  LDA #$0017                                ; $06C240 |
  STA !s_spr_anim_frame,y                   ; $06C243 |
  LDA #$0007                                ; $06C246 |
  STA !s_spr_gsu_morph_1_lo,y               ; $06C249 |
  LDA #$FC00                                ; $06C24C |
  STA !s_spr_y_speed_lo,y                   ; $06C24F |
  LDA #$0000                                ; $06C252 |
  STA !s_spr_wildcard_3_lo,y                ; $06C255 |
  LDA #$0020                                ; $06C258 |
  STA !s_spr_timer_4                        ; $06C25B |
  RTS                                       ; $06C25E |

CODE_06C25F:
  JSL $06C114                               ; $06C25F |
  JSL $06BF73                               ; $06C263 |
  JMP CODE_06C070                           ; $06C267 |

CODE_06C26A:
  LDA $6FA2                                 ; $06C26A |
  AND #$9FFF                                ; $06C26D |
  LDY $0CC8                                 ; $06C270 |
  BNE CODE_06C27A                           ; $06C273 |
  ORA #$6000                                ; $06C275 |
  BRA CODE_06C27D                           ; $06C278 |

CODE_06C27A:
  ORA #$4000                                ; $06C27A |

CODE_06C27D:
  STA $6FA2                                 ; $06C27D |
  RTS                                       ; $06C280 |

CODE_06C281:
  LDA !r_stars_amount                       ; $06C281 |
  CMP #$0009                                ; $06C284 |
  BPL CODE_06C2B4                           ; $06C287 |
  JSR CODE_06C2B5                           ; $06C289 |
  BPL CODE_06C2B1                           ; $06C28C |
  LDA !s_baby_mario_state                   ; $06C28E |
  BIT #$4000                                ; $06C291 |
  BEQ CODE_06C2A2                           ; $06C294 |
  LDX $18                                   ; $06C296 |
  JSL $03A31E                               ; $06C298 |
  LDX $12                                   ; $06C29C |
  JSL $06C114                               ; $06C29E |

CODE_06C2A2:
  LDA #$FFFF                                ; $06C2A2 |
  STA !s_spr_timer_4                        ; $06C2A5 |
  STZ !s_spr_x_speed_lo                     ; $06C2A8 |
  STZ !s_spr_y_speed_lo                     ; $06C2AB |
  STZ !s_spr_y_accel                        ; $06C2AE |

CODE_06C2B1:
  JSR CODE_06C876                           ; $06C2B1 |

CODE_06C2B4:
  RTS                                       ; $06C2B4 |

CODE_06C2B5:
  LDA #$0800                                ; $06C2B5 |
  CMP !s_spr_y_pixel_pos                    ; $06C2B8 |
  BMI CODE_06C2F5                           ; $06C2BB |
  LDA !s_spr_cam_x_pos,x                    ; $06C2BD |
  CLC                                       ; $06C2C0 |
  ADC #$0010                                ; $06C2C1 |
  CMP #$0120                                ; $06C2C4 |
  BCC CODE_06C2F6                           ; $06C2C7 |
  LDA !s_spr_cam_y_pos,x                    ; $06C2C9 |
  CLC                                       ; $06C2CC |
  ADC #$0010                                ; $06C2CD |
  CMP #$0120                                ; $06C2D0 |
  BCC CODE_06C2F6                           ; $06C2D3 |
  PHX                                       ; $06C2D5 |
  REP #$10                                  ; $06C2D6 |
  LDA !s_spr_y_hitbox_center                ; $06C2D8 |
  AND #$FF00                                ; $06C2DB |
  LSR A                                     ; $06C2DE |
  LSR A                                     ; $06C2DF |
  LSR A                                     ; $06C2E0 |
  LSR A                                     ; $06C2E1 |
  STA $00                                   ; $06C2E2 |
  LDA !s_spr_x_hitbox_center                ; $06C2E4 |
  AND #$FF00                                ; $06C2E7 |
  XBA                                       ; $06C2EA |
  ORA $00                                   ; $06C2EB |
  TAX                                       ; $06C2ED |
  LDA !s_screen_num_to_id,x                 ; $06C2EE |
  SEP #$10                                  ; $06C2F1 |
  PLX                                       ; $06C2F3 |
  TAY                                       ; $06C2F4 |

CODE_06C2F5:
  RTS                                       ; $06C2F5 |

CODE_06C2F6:
  LDA #$0000                                ; $06C2F6 |
  RTS                                       ; $06C2F9 |

CODE_06C2FA:
  LDY $0B59                                 ; $06C2FA |
  BEQ CODE_06C326                           ; $06C2FD |
  LDY $76                                   ; $06C2FF |
  CPY #$01                                  ; $06C301 |
  BEQ CODE_06C326                           ; $06C303 |
  CPY #$02                                  ; $06C305 |
  BEQ CODE_06C326                           ; $06C307 |
  LDA !s_spr_oam_1                          ; $06C309 |
  AND #$E000                                ; $06C30C |
  BEQ CODE_06C326                           ; $06C30F |
  LDY !s_spr_anim_frame                     ; $06C311 |
  CPY #$1F                                  ; $06C314 |
  BMI CODE_06C326                           ; $06C316 |
  JSL $06C114                               ; $06C318 |
  LDA #$001F                                ; $06C31C |
  TRB $6FA2                                 ; $06C31F |
  LDY #$0C                                  ; $06C322 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $06C324 |

CODE_06C326:
  RTS                                       ; $06C326 |

  dw $1615, $1715                           ; $06C327 |

  LDA $7860                                 ; $06C32B |
  AND #$0001                                ; $06C32E |
  BNE CODE_06C33D                           ; $06C331 |
  LDY $7862                                 ; $06C333 |
  BEQ CODE_06C352                           ; $06C336 |
  LDY !s_spr_y_speed_hi                     ; $06C338 |
  BMI CODE_06C37E                           ; $06C33B |

CODE_06C33D:
  LDA !s_spr_x_speed_lo                     ; $06C33D |
  PHA                                       ; $06C340 |
  LDA !s_spr_y_speed_lo                     ; $06C341 |
  PHA                                       ; $06C344 |
  JSL $06BEC1                               ; $06C345 |
  PLA                                       ; $06C349 |
  STA !s_spr_y_speed_lo                     ; $06C34A |
  PLA                                       ; $06C34D |
  STA !s_spr_x_speed_lo                     ; $06C34E |
  RTS                                       ; $06C351 |

CODE_06C352:
  LDY !s_spr_y_speed_hi                     ; $06C352 |
  BMI CODE_06C37E                           ; $06C355 |
  LDA $0B57                                 ; $06C357 |
  BNE CODE_06C364                           ; $06C35A |
  LDA $0DB2                                 ; $06C35C |
  CMP !s_spr_y_pixel_pos                    ; $06C35F |
  BMI CODE_06C33D                           ; $06C362 |

CODE_06C364:
  LDY !s_spr_timer_2                        ; $06C364 |
  BNE CODE_06C37E                           ; $06C367 |
  LDY #$08                                  ; $06C369 |
  STY !s_spr_timer_2                        ; $06C36B |
  LDA $16                                   ; $06C36E |
  DEC A                                     ; $06C370 |
  AND #$0003                                ; $06C371 |
  TAY                                       ; $06C374 |
  STY $16                                   ; $06C375 |
  LDA $C327,y                               ; $06C377 |
  TAY                                       ; $06C37A |
  STY !s_spr_anim_frame                     ; $06C37B |

CODE_06C37E:
  RTS                                       ; $06C37E |

  dw $0100, $FF00                           ; $06C37F |

  LDY $0B57                                 ; $06C383 |
  BEQ CODE_06C38B                           ; $06C386 |
  JMP CODE_06C414                           ; $06C388 |

CODE_06C38B:
  SEP #$20                                  ; $06C38B |
  LDA #$04                                  ; $06C38D |
  STA !s_spr_draw_priority                  ; $06C38F |
  REP #$20                                  ; $06C392 |
  LDA !s_spr_state                          ; $06C394 |
  CMP #$0008                                ; $06C397 |
  BNE CODE_06C3AA                           ; $06C39A |
  LDA #$0010                                ; $06C39C |
  STA !s_spr_state                          ; $06C39F |
  STZ !s_tongued_sprite_slot                ; $06C3A2 |
  LDY #$00                                  ; $06C3A5 |
  STY $7862                                 ; $06C3A7 |

CODE_06C3AA:
  LDY $0D9C                                 ; $06C3AA |
  BNE CODE_06C400                           ; $06C3AD |
  LDA !s_spr_x_player_delta                 ; $06C3AF |
  STA !gsu_r0                               ; $06C3B2 |
  LDA #$F800                                ; $06C3B5 |
  STA !gsu_r6                               ; $06C3B8 |
  LDX #$0B                                  ; $06C3BB |
  LDA #$86B6                                ; $06C3BD |
  JSL r_gsu_init_1                          ; $06C3C0 | GSU init
  LDA !gsu_r0                               ; $06C3C4 |
  STA !s_spr_x_speed_lo                     ; $06C3C7 |
  STZ !gsu_r0                               ; $06C3CA |
  LDA !s_spr_y_player_delta                 ; $06C3CD |
  BMI CODE_06C3E4                           ; $06C3D0 |
  STA !gsu_r0                               ; $06C3D2 |
  LDA #$F800                                ; $06C3D5 |
  STA !gsu_r6                               ; $06C3D8 |
  LDX #$0B                                  ; $06C3DB |
  LDA #$86B6                                ; $06C3DD |
  JSL r_gsu_init_1                          ; $06C3E0 | GSU init

CODE_06C3E4:
  LDA !gsu_r0                               ; $06C3E4 |
  CLC                                       ; $06C3E7 |
  ADC #$FC00                                ; $06C3E8 |
  STA !s_spr_y_speed_lo                     ; $06C3EB |
  STZ $7860                                 ; $06C3EE |
  LDY #$0D                                  ; $06C3F1 |
  STY !s_spr_anim_frame                     ; $06C3F3 |
  LDA #$6040                                ; $06C3F6 |
  STA $6FA2                                 ; $06C3F9 |
  INC $0D9C                                 ; $06C3FC |
  RTS                                       ; $06C3FF |

CODE_06C400:
  LDY !s_spr_y_speed_hi                     ; $06C400 |
  BMI CODE_06C463                           ; $06C403 |
  LDA !s_spr_y_player_delta                 ; $06C405 |
  CMP #$0008                                ; $06C408 |
  BCS CODE_06C453                           ; $06C40B |
  LDA #$0043                                ; $06C40D |
  JSL push_sound_queue                      ; $06C410 |

CODE_06C414:
  LDA #$0001                                ; $06C414 |
  STA !s_spr_wildcard_2_lo                  ; $06C417 |
  LDA #$000A                                ; $06C41A |
  STA !s_spr_state                          ; $06C41D |
  STZ !s_spr_gsu_morph_1_lo                 ; $06C420 |
  STZ !s_spr_gsu_morph_2_lo                 ; $06C423 |
  STZ $16                                   ; $06C426 |
  STZ $76                                   ; $06C428 |
  STZ $18                                   ; $06C42A |
  LDA #$604F                                ; $06C42C |
  STA $6FA2                                 ; $06C42F |
  LDY #$00                                  ; $06C432 |
  STY $7862                                 ; $06C434 |
  LDA !s_baby_mario_state                   ; $06C437 |
  AND #$0FFF                                ; $06C43A |
  ORA #$8000                                ; $06C43D |
  STA !s_baby_mario_state                   ; $06C440 |
  STZ $0D9C                                 ; $06C443 |
  STZ $0D9A                                 ; $06C446 |
  STZ !s_player_disable_flag                ; $06C449 |
  STZ !s_sprite_disable_flag                ; $06C44C |
  LDX $12                                   ; $06C44F |
  PLA                                       ; $06C451 |
  RTL                                       ; $06C452 |

CODE_06C453:
  LDA $7860                                 ; $06C453 |
  AND #$0001                                ; $06C456 |
  BEQ CODE_06C463                           ; $06C459 |
  LDA #$0006                                ; $06C45B |
  STA $16                                   ; $06C45E |
  STZ $0D9C                                 ; $06C460 |

CODE_06C463:
  RTS                                       ; $06C463 |

  db $24, $25, $26, $27, $23, $22, $21, $20 ; $06C464 |
  db $22, $23, $27, $26, $25, $24, $20, $21 ; $06C46C |
  db $22, $23, $22, $21, $20                ; $06C474 |

  db $20, $04, $04, $20, $20, $04, $04, $20 ; $06C479 |
  db $04, $20, $20, $04, $04, $20, $20, $04 ; $06C481 |
  db $04, $20, $04, $04, $20                ; $06C489 |

  LDY !s_spr_timer_2                        ; $06C48E |
  BNE CODE_06C4AE                           ; $06C491 |
  DEC $16                                   ; $06C493 |
  BPL CODE_06C49C                           ; $06C495 |
  LDA #$0014                                ; $06C497 |
  STA $16                                   ; $06C49A |

CODE_06C49C:
  LDY $16                                   ; $06C49C |
  LDA $C464,y                               ; $06C49E |
  AND #$00FF                                ; $06C4A1 |
  STA !s_spr_anim_frame                     ; $06C4A4 |
  LDA $C479,y                               ; $06C4A7 |
  TAY                                       ; $06C4AA |
  STY !s_spr_timer_2                        ; $06C4AB |

CODE_06C4AE:
  RTS                                       ; $06C4AE |

  dw $1C1B, $1F1D, $1F1E, $1F1D             ; $06C4AF |
  dw $1F1E                                  ; $06C4B7 |

  dw $FF80, $0080                           ; $06C4B9 |

  LDY !s_player_transforming_flag           ; $06C4BD |
  CPY #$03                                  ; $06C4C0 |
  BNE CODE_06C51B                           ; $06C4C2 |
  LDY !s_spr_timer_2                        ; $06C4C4 |
  BNE CODE_06C51B                           ; $06C4C7 |
  LDY #$02                                  ; $06C4C9 |
  STY !s_spr_timer_2                        ; $06C4CB |
  INC $16                                   ; $06C4CE |
  LDY $16                                   ; $06C4D0 |
  CPY #$09                                  ; $06C4D2 |
  BMI CODE_06C514                           ; $06C4D4 |
  PHY                                       ; $06C4D6 |
  LDY $76                                   ; $06C4D7 |
  CPY #$08                                  ; $06C4D9 |
  BEQ CODE_06C50F                           ; $06C4DB |
  LDA #$FF00                                ; $06C4DD |
  STA !s_spr_y_speed_lo                     ; $06C4E0 |
  LDA #$FF80                                ; $06C4E3 |
  STA !s_spr_y_accel_ceiling                ; $06C4E6 |
  STZ !s_spr_y_accel                        ; $06C4E9 |
  LDA #$0002                                ; $06C4EC |
  STA !s_spr_y_accel                        ; $06C4EF |
  CPY #$0A                                  ; $06C4F2 |
  BNE CODE_06C50F                           ; $06C4F4 |
  STA !s_spr_x_accel                        ; $06C4F6 |
  ASL A                                     ; $06C4F9 |
  STA !s_spr_y_accel                        ; $06C4FA |
  LDA #$FF00                                ; $06C4FD |
  STA !s_spr_y_accel_ceiling                ; $06C500 |
  LDY !s_spr_facing_dir                     ; $06C503 |
  LDA $C4B9,y                               ; $06C506 |
  STA !s_spr_x_accel_ceiling                ; $06C509 |
  STZ !s_spr_timer_3                        ; $06C50C |

CODE_06C50F:
  PLY                                       ; $06C50F |
  STZ $16                                   ; $06C510 |
  INC $76                                   ; $06C512 |

CODE_06C514:
  LDA $C4AE,y                               ; $06C514 |
  TAY                                       ; $06C517 |
  STY !s_spr_anim_frame                     ; $06C518 |

CODE_06C51B:
  LDY $76                                   ; $06C51B |
  CPY #$08                                  ; $06C51D |
  BEQ CODE_06C525                           ; $06C51F |
  CPY #$09                                  ; $06C521 |
  BNE CODE_06C528                           ; $06C523 |

CODE_06C525:
  JSR CODE_06C529                           ; $06C525 |

CODE_06C528:
  RTS                                       ; $06C528 |

CODE_06C529:
  LDY $18                                   ; $06C529 |
  BEQ CODE_06C574                           ; $06C52B |
  LDA !s_spr_state,y                        ; $06C52D |
  CMP #$0002                                ; $06C530 |
  BNE CODE_06C53A                           ; $06C533 |
  JSL $06C0BB                               ; $06C535 |
  RTS                                       ; $06C539 |

CODE_06C53A:
  CMP #$0010                                ; $06C53A |
  BNE CODE_06C574                           ; $06C53D |
  LDA !s_spr_id,y                           ; $06C53F |
  CMP #$01A2                                ; $06C542 |
  BEQ CODE_06C574                           ; $06C545 |
  CMP #$0115                                ; $06C547 |
  BEQ CODE_06C574                           ; $06C54A |
  LDA !s_spr_id,y                           ; $06C54C |
  CMP #$00D9                                ; $06C54F |
  BEQ CODE_06C578                           ; $06C552 |
  LDA !s_spr_x_pixel_pos,y                  ; $06C554 |
  SEC                                       ; $06C557 |
  SBC !s_spr_x_pixel_pos                    ; $06C558 |
  CLC                                       ; $06C55B |
  ADC #$0018                                ; $06C55C |
  CMP #$0030                                ; $06C55F |
  BCS CODE_06C574                           ; $06C562 |
  LDA !s_spr_y_pixel_pos,y                  ; $06C564 |
  SEC                                       ; $06C567 |
  SBC !s_spr_y_pixel_pos                    ; $06C568 |
  CLC                                       ; $06C56B |
  ADC #$0020                                ; $06C56C |
  CMP #$0040                                ; $06C56F |
  BCC CODE_06C578                           ; $06C572 |

CODE_06C574:
  JSL $06C114                               ; $06C574 |

CODE_06C578:
  RTS                                       ; $06C578 |

  db $1F, $20, $1F, $21, $23, $22, $23, $24 ; $06C579 |

  db $04, $08, $04, $08, $08, $10, $08, $10 ; $06C581 |
  db $20, $18, $10, $0A, $E0, $00, $20, $00 ; $06C589 |

  LDX $12                                   ; $06C591 |
  LDA !s_sprite_disable_flag                ; $06C593 |
  ORA $0B55                                 ; $06C596 |
  ORA !r_cur_item_used                      ; $06C599 |
  BEQ CODE_06C5A2                           ; $06C59C |
  JSL $03B69D                               ; $06C59E |

CODE_06C5A2:
  LDA $0C8A                                 ; $06C5A2 |
  ORA !s_player_transforming_flag           ; $06C5A5 |
  BNE CODE_06C5CE                           ; $06C5A8 |
  JSL $06BF73                               ; $06C5AA |
  LDA #$000A                                ; $06C5AE |
  STA !s_spr_state                          ; $06C5B1 |
  LDA !s_baby_mario_state                   ; $06C5B4 |
  AND #$0FFF                                ; $06C5B7 |
  ORA #$8000                                ; $06C5BA |
  STA !s_baby_mario_state                   ; $06C5BD |
  TXA                                       ; $06C5C0 |
  STA $7E48                                 ; $06C5C1 |
  LDA #$FFFF                                ; $06C5C4 |
  STA $0D92                                 ; $06C5C7 |
  STZ $76                                   ; $06C5CA |
  PLA                                       ; $06C5CC |
  RTL                                       ; $06C5CD |

CODE_06C5CE:
  LDA $7860                                 ; $06C5CE |
  AND #$0003                                ; $06C5D1 |
  BEQ CODE_06C607                           ; $06C5D4 |
  PHA                                       ; $06C5D6 |
  STZ $7860                                 ; $06C5D7 |
  LDA !s_spr_y_pixel_pos                    ; $06C5DA |
  SEC                                       ; $06C5DD |
  SBC !s_spr_y_delta_lo                     ; $06C5DE |
  STA !s_spr_y_pixel_pos                    ; $06C5E1 |
  PLA                                       ; $06C5E4 |
  AND #$0002                                ; $06C5E5 |
  DEC A                                     ; $06C5E8 |
  EOR !s_spr_y_accel_ceiling                ; $06C5E9 |
  BMI CODE_06C5F3                           ; $06C5EC |
  LDA !s_spr_y_accel_ceiling                ; $06C5EE |
  BRA CODE_06C5FA                           ; $06C5F1 |

CODE_06C5F3:
  LDA !s_spr_y_accel_ceiling                ; $06C5F3 |
  EOR #$FFFF                                ; $06C5F6 |
  INC A                                     ; $06C5F9 |

CODE_06C5FA:
  CMP #$8000                                ; $06C5FA |
  ROR A                                     ; $06C5FD |
  CMP #$8000                                ; $06C5FE |
  ROR A                                     ; $06C601 |
  STA !s_spr_y_speed_lo                     ; $06C602 |
  BRA CODE_06C60F                           ; $06C605 |

CODE_06C607:
  LDA !s_spr_y_accel_ceiling                ; $06C607 |
  CMP !s_spr_y_speed_lo                     ; $06C60A |
  BNE CODE_06C61F                           ; $06C60D |

CODE_06C60F:
  LDA #$0080                                ; $06C60F |
  STA !s_spr_timer_1                        ; $06C612 |
  LDA !s_spr_y_accel_ceiling                ; $06C615 |
  EOR #$FFFF                                ; $06C618 |
  INC A                                     ; $06C61B |
  STA !s_spr_y_accel_ceiling                ; $06C61C |

CODE_06C61F:
  LDY !s_spr_timer_2                        ; $06C61F |
  BEQ CODE_06C627                           ; $06C622 |
  JMP CODE_06C6CE                           ; $06C624 |

CODE_06C627:
  LDA $16                                   ; $06C627 |
  INC A                                     ; $06C629 |
  AND #$0003                                ; $06C62A |
  STA $16                                   ; $06C62D |
  LDY $76                                   ; $06C62F |
  CPY #$06                                  ; $06C631 |
  BEQ CODE_06C639                           ; $06C633 |
  CLC                                       ; $06C635 |
  ADC #$0004                                ; $06C636 |

CODE_06C639:
  TAY                                       ; $06C639 |
  LDA $C581,y                               ; $06C63A |
  AND #$00FF                                ; $06C63D |
  STA !s_spr_timer_2                        ; $06C640 |
  LDA $C579,y                               ; $06C643 |
  TAY                                       ; $06C646 |
  STY !s_spr_anim_frame                     ; $06C647 |
  CPY #$24                                  ; $06C64A |
  BNE CODE_06C657                           ; $06C64C |
  LDA #$0044                                ; $06C64E |
  JSL push_sound_queue                      ; $06C651 |
  BRA CODE_06C6CE                           ; $06C655 |

CODE_06C657:
  CPY #$22                                  ; $06C657 |
  BNE CODE_06C6CE                           ; $06C659 |
  LDA !r_stars_amount                       ; $06C65B |
  CMP #$006E                                ; $06C65E |
  BMI CODE_06C6A7                           ; $06C661 |
  LDA $10                                   ; $06C663 |
  AND #$0003                                ; $06C665 |
  ASL A                                     ; $06C668 |
  ASL A                                     ; $06C669 |
  INC A                                     ; $06C66A |
  LDY $0DBA                                 ; $06C66B |
  BNE CODE_06C674                           ; $06C66E |
  EOR #$FFFF                                ; $06C670 |
  INC A                                     ; $06C673 |

CODE_06C674:
  CLC                                       ; $06C674 |
  ADC $0DB8                                 ; $06C675 |
  STA $0DB8                                 ; $06C678 |
  CMP #$000C                                ; $06C67B |
  BPL CODE_06C68A                           ; $06C67E |
  SEC                                       ; $06C680 |
  SBC #$0018                                ; $06C681 |
  EOR #$FFFF                                ; $06C684 |
  INC A                                     ; $06C687 |
  BRA CODE_06C696                           ; $06C688 |

CODE_06C68A:
  CMP #$0029                                ; $06C68A |
  BMI CODE_06C6A2                           ; $06C68D |
  LDA #$0050                                ; $06C68F |
  SEC                                       ; $06C692 |
  SBC $0DB8                                 ; $06C693 |

CODE_06C696:
  STA $0DB8                                 ; $06C696 |
  LDA $0DBA                                 ; $06C699 |
  EOR #$0001                                ; $06C69C |
  STA $0DBA                                 ; $06C69F |

CODE_06C6A2:
  LDA $0DB8                                 ; $06C6A2 |
  BRA CODE_06C6CB                           ; $06C6A5 |

CODE_06C6A7:
  STA !gsu_r0                               ; $06C6A7 |
  LDA #$0200                                ; $06C6AA |
  STA !gsu_r6                               ; $06C6AD |
  LDX #$0B                                  ; $06C6B0 |
  LDA #$86B6                                ; $06C6B2 |
  JSL r_gsu_init_1                          ; $06C6B5 | GSU init
  LDA !s_spr_timer_2                        ; $06C6B9 |
  STA !gsu_r6                               ; $06C6BC |
  LDX #$0B                                  ; $06C6BF |
  LDA #$86B6                                ; $06C6C1 |
  JSL r_gsu_init_1                          ; $06C6C4 | GSU init
  LDA !gsu_r0                               ; $06C6C8 |

CODE_06C6CB:
  STA !s_spr_timer_2                        ; $06C6CB |

CODE_06C6CE:
  JMP CODE_06C51B                           ; $06C6CE |
  LDY !s_spr_y_speed_hi                     ; $06C6D1 |
  BMI CODE_06C6E7                           ; $06C6D4 |
  STZ !s_player_disable_flag                ; $06C6D6 |
  STZ !s_sprite_disable_flag                ; $06C6D9 |
  LDA #$0020                                ; $06C6DC |
  STA !s_transform_timer                    ; $06C6DF |
  STZ $0C88                                 ; $06C6E2 |
  DEC $76                                   ; $06C6E5 |

CODE_06C6E7:
  RTS                                       ; $06C6E7 |

  dw $00F0, $00D0                           ; $06C6E8 |

  LDY #$00                                  ; $06C6EC |
  LDA !s_spr_x_speed_lo                     ; $06C6EE |
  BMI CODE_06C6F5                           ; $06C6F1 |
  INY                                       ; $06C6F3 |
  INY                                       ; $06C6F4 |

CODE_06C6F5:
  STY !s_spr_facing_dir                     ; $06C6F5 |
  LDY !s_spr_timer_3                        ; $06C6F8 |
  BEQ CODE_06C72D                           ; $06C6FB |
  INC !s_spr_timer_3                        ; $06C6FD |
  LDA $0DB2                                 ; $06C700 |
  CMP !s_spr_y_pixel_pos                    ; $06C703 |
  BMI CODE_06C715                           ; $06C706 |
  LDA $7860                                 ; $06C708 |
  AND #$0001                                ; $06C70B |
  BNE CODE_06C715                           ; $06C70E |
  LDY $7862                                 ; $06C710 |
  BEQ CODE_06C72A                           ; $06C713 |

CODE_06C715:
  LDA #$FF40                                ; $06C715 |
  STA !s_spr_y_speed_lo                     ; $06C718 |
  LDA #$0080                                ; $06C71B |
  STA !s_spr_y_accel_ceiling                ; $06C71E |
  LDA #$0002                                ; $06C721 |
  STA !s_spr_y_accel                        ; $06C724 |
  STZ !s_spr_timer_3                        ; $06C727 |

CODE_06C72A:
  JMP CODE_06C61F                           ; $06C72A |

CODE_06C72D:
  LDA #$0004                                ; $06C72D |
  LDY $7683                                 ; $06C730 |
  BEQ CODE_06C741                           ; $06C733 |
  LDA !s_spr_y_speed_lo                     ; $06C735 |
  AND #$FFF0                                ; $06C738 |
  STA !s_spr_y_speed_lo                     ; $06C73B |
  LDA #$0010                                ; $06C73E |

CODE_06C741:
  STA !s_spr_y_accel                        ; $06C741 |
  LDY !s_spr_collision_id                   ; $06C744 |
  DEY                                       ; $06C747 |
  BMI CODE_06C784                           ; $06C748 |
  LDA !s_spr_state,y                        ; $06C74A |
  CMP #$0010                                ; $06C74D |
  BNE CODE_06C784                           ; $06C750 |
  LDA !s_spr_collision_state,y              ; $06C752 |
  BEQ CODE_06C784                           ; $06C755 |
  TYX                                       ; $06C757 |
  JSL $03B25B                               ; $06C758 |
  LDY #$02                                  ; $06C75C |
  STY !s_spr_timer_3                        ; $06C75E |
  LDA #$0400                                ; $06C761 |
  STA !s_spr_y_accel_ceiling                ; $06C764 |
  LDA #$0040                                ; $06C767 |
  STA !s_spr_y_accel                        ; $06C76A |
  STZ !s_spr_x_accel_ceiling                ; $06C76D |
  LDA !s_player_y                           ; $06C770 |
  CLC                                       ; $06C773 |
  ADC #$0030                                ; $06C774 |
  CMP #$07E0                                ; $06C777 |
  BMI CODE_06C77F                           ; $06C77A |
  LDA #$07E0                                ; $06C77C |

CODE_06C77F:
  STA $0DB2                                 ; $06C77F |
  BRA CODE_06C72A                           ; $06C782 |

CODE_06C784:
  LDY #$00                                  ; $06C784 |
  LDA !s_spr_x_speed_lo                     ; $06C786 |
  BPL CODE_06C78D                           ; $06C789 |
  INY                                       ; $06C78B |
  INY                                       ; $06C78C |

CODE_06C78D:
  LDA $C6E8,y                               ; $06C78D |
  LDY #$00                                  ; $06C790 |
  CMP !s_spr_cam_x_pos                      ; $06C792 |
  BMI CODE_06C799                           ; $06C795 |
  INY                                       ; $06C797 |
  INY                                       ; $06C798 |

CODE_06C799:
  LDA $C4B9,y                               ; $06C799 |
  STA !s_spr_x_accel_ceiling                ; $06C79C |
  LDY $7862                                 ; $06C79F |
  BEQ CODE_06C7AB                           ; $06C7A2 |
  LDY $75E3                                 ; $06C7A4 |
  BMI CODE_06C80F                           ; $06C7A7 |
  BRA CODE_06C7CF                           ; $06C7A9 |

CODE_06C7AB:
  LDA $7860                                 ; $06C7AB |
  AND #$0003                                ; $06C7AE |
  BEQ CODE_06C7ED                           ; $06C7B1 |
  STZ $7860                                 ; $06C7B3 |
  AND #$0002                                ; $06C7B6 |
  DEC A                                     ; $06C7B9 |
  EOR !s_spr_y_accel_ceiling                ; $06C7BA |
  BMI CODE_06C7CF                           ; $06C7BD |
  LDA !s_spr_y_accel_ceiling                ; $06C7BF |
  CMP #$8000                                ; $06C7C2 |
  ROR A                                     ; $06C7C5 |
  CMP #$8000                                ; $06C7C6 |
  ROR A                                     ; $06C7C9 |
  STA !s_spr_y_speed_lo                     ; $06C7CA |
  BRA CODE_06C80F                           ; $06C7CD |

CODE_06C7CF:
  LDA !s_spr_y_pixel_pos                    ; $06C7CF |
  SEC                                       ; $06C7D2 |
  SBC !s_spr_y_delta_lo                     ; $06C7D3 |
  STA !s_spr_y_pixel_pos                    ; $06C7D6 |
  LDA !s_spr_y_accel_ceiling                ; $06C7D9 |
  EOR #$FFFF                                ; $06C7DC |
  INC A                                     ; $06C7DF |
  CMP #$8000                                ; $06C7E0 |
  ROR A                                     ; $06C7E3 |
  CMP #$8000                                ; $06C7E4 |
  ROR A                                     ; $06C7E7 |
  STA !s_spr_y_speed_lo                     ; $06C7E8 |
  BRA CODE_06C805                           ; $06C7EB |

CODE_06C7ED:
  LDA !s_spr_y_accel_ceiling                ; $06C7ED |
  CMP !s_spr_y_speed_lo                     ; $06C7F0 |
  BNE CODE_06C80F                           ; $06C7F3 |
  LDA $0DB2                                 ; $06C7F5 |
  SEC                                       ; $06C7F8 |
  SBC !s_spr_y_pixel_pos                    ; $06C7F9 |
  EOR !s_spr_y_speed_lo                     ; $06C7FC |
  BPL CODE_06C80F                           ; $06C7FF |
  JSL $06BEDA                               ; $06C801 |

CODE_06C805:
  LDA !s_spr_y_accel_ceiling                ; $06C805 |
  EOR #$FFFF                                ; $06C808 |
  INC A                                     ; $06C80B |
  STA !s_spr_y_accel_ceiling                ; $06C80C |

CODE_06C80F:
  JMP CODE_06C61F                           ; $06C80F |
  LDA #$0002                                ; $06C812 |
  STA !s_spr_facing_dir                     ; $06C815 |
  LDA !s_spr_x_player_delta                 ; $06C818 |
  PHP                                       ; $06C81B |
  BPL CODE_06C822                           ; $06C81C |
  EOR #$FFFF                                ; $06C81E |
  INC A                                     ; $06C821 |

CODE_06C822:
  LSR A                                     ; $06C822 |
  CMP #$0018                                ; $06C823 |
  BMI CODE_06C82B                           ; $06C826 |
  LDA #$0018                                ; $06C828 |

CODE_06C82B:
  CLC                                       ; $06C82B |
  ADC #$0018                                ; $06C82C |
  STA !s_spr_x_accel                        ; $06C82F |
  ASL A                                     ; $06C832 |
  ASL A                                     ; $06C833 |
  ASL A                                     ; $06C834 |
  ASL A                                     ; $06C835 |
  PLP                                       ; $06C836 |
  BMI CODE_06C840                           ; $06C837 |
  EOR #$FFFF                                ; $06C839 |
  INC A                                     ; $06C83C |
  STZ !s_spr_facing_dir                     ; $06C83D |

CODE_06C840:
  STA !s_spr_x_accel_ceiling                ; $06C840 |
  LDA !s_spr_y_player_delta                 ; $06C843 |
  PHP                                       ; $06C846 |
  BPL CODE_06C84D                           ; $06C847 |
  EOR #$FFFF                                ; $06C849 |
  INC A                                     ; $06C84C |

CODE_06C84D:
  LSR A                                     ; $06C84D |
  CMP #$0018                                ; $06C84E |
  BMI CODE_06C856                           ; $06C851 |
  LDA #$0018                                ; $06C853 |

CODE_06C856:
  CLC                                       ; $06C856 |
  ADC #$0018                                ; $06C857 |
  STA !s_spr_y_accel                        ; $06C85A |
  ASL A                                     ; $06C85D |
  ASL A                                     ; $06C85E |
  ASL A                                     ; $06C85F |
  ASL A                                     ; $06C860 |
  PLP                                       ; $06C861 |
  BMI CODE_06C868                           ; $06C862 |
  EOR #$FFFF                                ; $06C864 |
  INC A                                     ; $06C867 |

CODE_06C868:
  STA !s_spr_y_accel_ceiling                ; $06C868 |
  JMP CODE_06C61F                           ; $06C86B |

  dw $FFC0, $FFF0, $0000, $0020             ; $06C86E |

CODE_06C876:
  LDX $12                                   ; $06C876 |
  LDA $0E35                                 ; $06C878 |
  BEQ CODE_06C886                           ; $06C87B |
  LDA $03A1                                 ; $06C87D |
  ORA $03A3                                 ; $06C880 |
  BEQ CODE_06C886                           ; $06C883 |

CODE_06C885:
  RTS                                       ; $06C885 |

CODE_06C886:
  LDA $0E33                                 ; $06C886 |
  BNE CODE_06C885                           ; $06C889 |
  INC $0E33                                 ; $06C88B |
  STZ $61CC                                 ; $06C88E |
  STZ $0E2F                                 ; $06C891 |
  STZ $0E2D                                 ; $06C894 |
  LDA #$0004                                ; $06C897 |
  STA $0E31                                 ; $06C89A |
  LDA !s_bg1_cam_x                          ; $06C89D |
  STA $0A                                   ; $06C8A0 |
  LDA !s_bg1_cam_y                          ; $06C8A2 |
  STA $0C                                   ; $06C8A5 |
  STZ $0E                                   ; $06C8A7 |
  LDA !r_header_level_mode                  ; $06C8A9 |
  CMP #$0009                                ; $06C8AC |
  BNE CODE_06C8BF                           ; $06C8AF |
  LDA !s_bg4_cam_x                          ; $06C8B1 |
  STA $0A                                   ; $06C8B4 |
  LDA !s_bg4_cam_y                          ; $06C8B6 |
  STA $0C                                   ; $06C8B9 |
  LDY #$06                                  ; $06C8BB |
  STY $0E                                   ; $06C8BD |

CODE_06C8BF:
  LDY #$08                                  ; $06C8BF |
  LDA #$0091                                ; $06C8C1 |
  JSL spawn_sprite_active_y                 ; $06C8C4 |
  LDA $0A                                   ; $06C8C8 |
  CLC                                       ; $06C8CA |
  ADC #$0080                                ; $06C8CB |
  STA !s_spr_x_pixel_pos,y                  ; $06C8CE |
  LDA $0C                                   ; $06C8D1 |
  SEC                                       ; $06C8D3 |
  SBC #$0010                                ; $06C8D4 |
  STA !s_spr_y_pixel_pos,y                  ; $06C8D7 |
  LDA !s_spr_bg_layer,y                     ; $06C8DA |
  ORA $0E                                   ; $06C8DD |
  STA !s_spr_bg_layer,y                     ; $06C8DF |
  LDY #$00                                  ; $06C8E2 |
  LDX #$0C                                  ; $06C8E4 |

CODE_06C8E6:
  STZ $0E37,x                               ; $06C8E6 |
  STZ $0E39,x                               ; $06C8E9 |
  STZ $0E49,x                               ; $06C8EC |
  STZ $0E4B,x                               ; $06C8EF |
  LDA $C86E,y                               ; $06C8F2 |
  STA $0E38,x                               ; $06C8F5 |
  STZ $0E9B,x                               ; $06C8F8 |
  STZ $0EC9,x                               ; $06C8FB |
  STZ $0E69,x                               ; $06C8FE |
  STZ $0E6B,x                               ; $06C901 |
  STZ $0E89,x                               ; $06C904 |
  STZ $0E8B,x                               ; $06C907 |
  STZ $0E79,x                               ; $06C90A |
  STZ $0E7B,x                               ; $06C90D |
  STZ $0EAB,x                               ; $06C910 |
  STZ $0EB9,x                               ; $06C913 |
  STZ $0EBB,x                               ; $06C916 |
  STZ $0EA9,x                               ; $06C919 |
  STZ $0E59,x                               ; $06C91C |
  STZ $0E5B,x                               ; $06C91F |
  STZ $0E99,x                               ; $06C922 |
  INY                                       ; $06C925 |
  INY                                       ; $06C926 |
  DEX                                       ; $06C927 |
  DEX                                       ; $06C928 |
  DEX                                       ; $06C929 |
  DEX                                       ; $06C92A |
  BPL CODE_06C8E6                           ; $06C92B |
  LDX $12                                   ; $06C92D |
  RTS                                       ; $06C92F |

; baby mario boss key cinematic tables
  db $00, $01, $00, $02                     ; $06C930 |
  db $03, $03, $03, $03                     ; $06C934 |
  db $03, $03, $03, $03                     ; $06C938 |
  db $03, $03, $03, $04                     ; $06C93C |
  db $03, $05, $06, $07                     ; $06C940 |
  db $07, $08, $09, $0A                     ; $06C944 |
  db $0B, $0C, $0D, $0E                     ; $06C948 |
  db $0F, $10, $10, $11                     ; $06C94C |
  db $06, $12, $12, $06                     ; $06C950 |
  db $03, $13, $13, $03                     ; $06C954 |
  db $14, $14, $15, $10                     ; $06C958 |
  db $16, $17, $17, $16                     ; $06C95C |
  db $0F, $18, $19, $08                     ; $06C960 |
  db $10                                    ; $06C964 |

  dw $5C00, $5C40, $5C00, $5CC0             ; $06C965 |
  dw $5C00, $5D00, $5C00, $5C80             ; $06C96D |
  dw $58C0, $5C80, $5900, $5C80             ; $06C975 |
  dw $5800, $5C80, $5000, $5040             ; $06C97D |
  dw $5480, $54C0, $5500, $5540             ; $06C985 |
  dw $5580, $55C0, $4800, $4C00             ; $06C98D |
  dw $4840, $4C40, $4880, $4C80             ; $06C995 |
  dw $5900, $5D80, $5C00, $5D80             ; $06C99D |
  dw $58C0, $5D80, $5080, $50C0             ; $06C9A5 |
  dw $4900, $5C80, $4D00, $5C80             ; $06C9AD |
  dw $5C00, $5980, $5DC0, $59C0             ; $06C9B5 |
  dw $5800, $5D80, $4900, $5D80             ; $06C9BD |
  dw $4980, $4D80, $48C0, $4CC0             ; $06C9C5 |

  db $03, $03, $03, $03                     ; $06C9CD |
  db $03, $03, $03, $0D                     ; $06C9D1 |
  db $0C, $0B                               ; $06C9D5 |

; baby mario boss key cinematic sub
  PHB                                       ; $06C9D7 |
  PHK                                       ; $06C9D8 |
  PLB                                       ; $06C9D9 |
  JSR CODE_06C9E1                           ; $06C9DA |
  PLB                                       ; $06C9DD |
  LDX $12                                   ; $06C9DE |
  RTL                                       ; $06C9E0 |

; baby mario boss key cinematic sub
CODE_06C9E1:
  LDA !s_spr_anim_frame                     ; $06C9E1 |
  CMP $78                                   ; $06C9E4 |
  BEQ CODE_06CA22                           ; $06C9E6 |
  STA $78                                   ; $06C9E8 |
  TAY                                       ; $06C9EA |
  LDA !s_spr_oam_1                          ; $06C9EB |
  AND #$F800                                ; $06C9EE |
  CMP #$3000                                ; $06C9F1 |
  BNE CODE_06C9FB                           ; $06C9F4 |
  LDA $C9B2,y                               ; $06C9F6 |
  BRA CODE_06C9FE                           ; $06C9F9 |

CODE_06C9FB:
  LDA $C930,y                               ; $06C9FB |

CODE_06C9FE:
  AND #$00FF                                ; $06C9FE |
  ASL A                                     ; $06CA01 |
  ASL A                                     ; $06CA02 |
  TAY                                       ; $06CA03 |
  PHX                                       ; $06CA04 |
  LDX #$00                                  ; $06CA05 |

CODE_06CA07:
  LDA $C965,y                               ; $06CA07 |
  STA $0B87,x                               ; $06CA0A |
  CLC                                       ; $06CA0D |
  ADC #$0200                                ; $06CA0E |
  STA $0B89,x                               ; $06CA11 |
  INY                                       ; $06CA14 |
  INY                                       ; $06CA15 |
  INX                                       ; $06CA16 |
  INX                                       ; $06CA17 |
  INX                                       ; $06CA18 |
  INX                                       ; $06CA19 |
  CPX #$08                                  ; $06CA1A |
  BMI CODE_06CA07                           ; $06CA1C |
  INC $0B85                                 ; $06CA1E |
  PLX                                       ; $06CA21 |

CODE_06CA22:
  RTS                                       ; $06CA22 |

; baby mario routine table
  dw $CDAB                                  ; $06CA23 |
  dw $CDEF                                  ; $06CA25 |
  dw $CE2F                                  ; $06CA27 |
  dw $CE2E                                  ; $06CA29 |
  dw $CEFB                                  ; $06CA2B |

; baby mario sub
CODE_06CA2D:
  LDA $03A1                                 ; $06CA2D |
  ORA $03A3                                 ; $06CA30 |
  BNE CODE_06CA38                           ; $06CA33 |
  JSR CODE_06C876                           ; $06CA35 |

CODE_06CA38:
  JSR CODE_06CB27                           ; $06CA38 |
  LDA !s_spr_state                          ; $06CA3B |
  CMP #$000A                                ; $06CA3E |
  BNE CODE_06CA4A                           ; $06CA41 |
  JSR CODE_06C9E1                           ; $06CA43 |
  JSL $03AF23                               ; $06CA46 |

CODE_06CA4A:
  JSR CODE_06CCF8                           ; $06CA4A |
  LDA !s_sprite_disable_flag                ; $06CA4D |
  ORA $0B55                                 ; $06CA50 |
  ORA !r_cur_item_used                      ; $06CA53 |
  BEQ CODE_06CA60                           ; $06CA56 |
  JSL $03B716                               ; $06CA58 |
  JSL $03B69D                               ; $06CA5C |

CODE_06CA60:
  LDA !s_spr_cam_x_pos                      ; $06CA60 |
  CLC                                       ; $06CA63 |
  ADC #$0008                                ; $06CA64 |
  SEC                                       ; $06CA67 |
  SBC !s_player_center_x                    ; $06CA68 |
  CLC                                       ; $06CA6B |
  ADC !r_bg1_cam_x                          ; $06CA6C |
  STA !s_spr_x_player_delta                 ; $06CA6F |
  LDA !s_spr_cam_y_pos                      ; $06CA72 |
  CLC                                       ; $06CA75 |
  ADC #$0008                                ; $06CA76 |
  SEC                                       ; $06CA79 |
  SBC !s_player_center_y                    ; $06CA7A |
  CLC                                       ; $06CA7D |
  ADC !r_bg1_cam_y                          ; $06CA7E |
  STA !s_spr_y_player_delta                 ; $06CA81 |
  JSR CODE_06CAA4                           ; $06CA84 |
  LDA $76                                   ; $06CA87 |
  ASL A                                     ; $06CA89 |
  TAX                                       ; $06CA8A |
  JSR ($CA23,x)                             ; $06CA8B |
  JSR CODE_06CB05                           ; $06CA8E |
  LDY $76                                   ; $06CA91 |
  CPY #$03                                  ; $06CA93 |
  BEQ CODE_06CAA1                           ; $06CA95 |
  CPY #$02                                  ; $06CA97 |
  BEQ CODE_06CAA1                           ; $06CA99 |
  JSR CODE_06CC9E                           ; $06CA9B |
  JSR CODE_06CB15                           ; $06CA9E |

CODE_06CAA1:
  LDX $12                                   ; $06CAA1 |
  RTL                                       ; $06CAA3 |

CODE_06CAA4:
  LDA !s_spr_state                          ; $06CAA4 |
  CMP #$0008                                ; $06CAA7 |
  BNE CODE_06CB04                           ; $06CAAA |
  LDY $76                                   ; $06CAAC |
  CPY #$02                                  ; $06CAAE |
  BEQ CODE_06CB04                           ; $06CAB0 |
  LDA #$0001                                ; $06CAB2 |
  STA !s_sprite_disable_flag                ; $06CAB5 |
  STA $0D9A                                 ; $06CAB8 |
  LDA #$8000                                ; $06CABB |
  TSB !s_player_disable_flag                ; $06CABE |
  LDY !s_player_mouth_state                 ; $06CAC1 |
  CPY #$04                                  ; $06CAC4 |
  BNE CODE_06CAD2                           ; $06CAC6 |
  LDA !s_player_tongue_y_rel                ; $06CAC8 |
  CMP #$FFF0                                ; $06CACB |
  BMI CODE_06CB04                           ; $06CACE |
  BRA CODE_06CADE                           ; $06CAD0 |

CODE_06CAD2:
  LDA !s_player_tongue_x_rel                ; $06CAD2 |
  CLC                                       ; $06CAD5 |
  ADC #$0010                                ; $06CAD6 |
  CMP #$0020                                ; $06CAD9 |
  BCS CODE_06CB04                           ; $06CADC |

CODE_06CADE:
  STZ !s_tongued_sprite_slot                ; $06CADE |

CODE_06CAE1:
  LDA #$0010                                ; $06CAE1 |
  STA !s_spr_state                          ; $06CAE4 |
  LDY #$00                                  ; $06CAE7 |
  STY $7862                                 ; $06CAE9 |
  LDY #$07                                  ; $06CAEC |
  STY $0DB4                                 ; $06CAEE |
  LDY #$02                                  ; $06CAF1 |
  STY $76                                   ; $06CAF3 |
  STZ $0D9C                                 ; $06CAF5 |
  INC $0D9A                                 ; $06CAF8 |
  LDA #$0001                                ; $06CAFB |
  STA !s_player_disable_flag                ; $06CAFE |
  INC !s_sprite_disable_flag                ; $06CB01 |

CODE_06CB04:
  RTS                                       ; $06CB04 |

; baby mario sub
CODE_06CB05:
  LDA !s_spr_timer_4                        ; $06CB05 |
  BNE CODE_06CB14                           ; $06CB08 |
  LDY !s_spr_collision_id                   ; $06CB0A |
  BPL CODE_06CB14                           ; $06CB0D |
  LDY $0D9C                                 ; $06CB0F |
  BEQ CODE_06CAE1                           ; $06CB12 |

CODE_06CB14:
  RTS                                       ; $06CB14 |

; baby mario sub
CODE_06CB15:
  LDY $0B59                                 ; $06CB15 |
  BEQ CODE_06CB26                           ; $06CB18 |
  LDA !s_spr_oam_1                          ; $06CB1A |
  AND #$E000                                ; $06CB1D |
  BEQ CODE_06CB26                           ; $06CB20 |
  LDY #$04                                  ; $06CB22 |
  STY $76                                   ; $06CB24 |

CODE_06CB26:
  RTS                                       ; $06CB26 |

; baby mario sub
CODE_06CB27:
  LDA !s_spr_state                          ; $06CB27 |
  CMP #$000A                                ; $06CB2A |
  BEQ CODE_06CB14                           ; $06CB2D |
  LDA $0DB4                                 ; $06CB2F |
  CMP #$0007                                ; $06CB32 |
  BPL CODE_06CB75                           ; $06CB35 |
  STA !gsu_r3                               ; $06CB37 |
  LDA !s_spr_oam_pointer                    ; $06CB3A |
  STA !gsu_r4                               ; $06CB3D |
  TXA                                       ; $06CB40 |
  STA !gsu_r10                              ; $06CB41 |
  LDA #$0006                                ; $06CB44 |
  STA !gsu_r0                               ; $06CB47 |
  LDA #$CC0A                                ; $06CB4A |
  STA !gsu_r14                              ; $06CB4D |
  LDA !s_spr_cam_x_pos                      ; $06CB50 |
  STA !gsu_r1                               ; $06CB53 |
  LDA !s_spr_cam_y_pos                      ; $06CB56 |
  STA !gsu_r2                               ; $06CB59 |
  LDA !s_spr_facing_dir                     ; $06CB5C |
  STA !gsu_r8                               ; $06CB5F |
  LDA #$0004                                ; $06CB62 |
  STA !gsu_r12                              ; $06CB65 |
  LDX #$08                                  ; $06CB68 |
  LDA #$A16C                                ; $06CB6A |
  JSL r_gsu_init_1                          ; $06CB6D |
  LDX $12                                   ; $06CB71 |
  BRA CODE_06CB8B                           ; $06CB73 |

CODE_06CB75:
  REP #$10                                  ; $06CB75 |
  LDY !s_spr_oam_pointer                    ; $06CB77 |
  LDA #$8000                                ; $06CB7A |
  STA $6000,y                               ; $06CB7D |
  STA $6008,y                               ; $06CB80 |
  STA $6010,y                               ; $06CB83 |
  STA $6018,y                               ; $06CB86 |
  SEP #$10                                  ; $06CB89 |

CODE_06CB8B:
  LDY !s_spr_facing_dir                     ; $06CB8B |
  LDA !s_spr_cam_x_pos                      ; $06CB8E |
  CLC                                       ; $06CB91 |
  ADC #$FFF8                                ; $06CB92 |
  STA $00                                   ; $06CB95 |
  LDA !s_spr_cam_y_pos                      ; $06CB97 |
  SEC                                       ; $06CB9A |
  SBC #$0008                                ; $06CB9B |
  STA $02                                   ; $06CB9E |
  LDA !s_spr_facing_dir                     ; $06CBA0 |
  AND #$FF00                                ; $06CBA3 |
  LSR A                                     ; $06CBA6 |
  LSR A                                     ; $06CBA7 |
  LSR A                                     ; $06CBA8 |
  ORA !s_spr_oam_yxppccct                   ; $06CBA9 |
  XBA                                       ; $06CBAC |
  STA $06                                   ; $06CBAD |
  REP #$10                                  ; $06CBAF |
  LDY !s_spr_oam_pointer                    ; $06CBB1 |
  LDA $00                                   ; $06CBB4 |
  STA $6020,y                               ; $06CBB6 |
  STA $6030,y                               ; $06CBB9 |
  CLC                                       ; $06CBBC |
  ADC #$0010                                ; $06CBBD |
  STA $6028,y                               ; $06CBC0 |
  STA $6038,y                               ; $06CBC3 |
  LDA $02                                   ; $06CBC6 |
  STA $6022,y                               ; $06CBC8 |
  STA $602A,y                               ; $06CBCB |
  CLC                                       ; $06CBCE |
  ADC #$0010                                ; $06CBCF |
  STA $6032,y                               ; $06CBD2 |
  STA $603A,y                               ; $06CBD5 |
  LDA $06                                   ; $06CBD8 |
  ORA #$0062                                ; $06CBDA |
  STA $6024,y                               ; $06CBDD |
  LDA $06                                   ; $06CBE0 |
  ORA #$0064                                ; $06CBE2 |
  STA $602C,y                               ; $06CBE5 |
  LDA $06                                   ; $06CBE8 |
  ORA #$0082                                ; $06CBEA |
  STA $6034,y                               ; $06CBED |
  LDA $06                                   ; $06CBF0 |
  ORA #$0084                                ; $06CBF2 |
  STA $603C,y                               ; $06CBF5 |
  LDA #$0202                                ; $06CBF8 |
  STA $6026,y                               ; $06CBFB |
  STA $602E,y                               ; $06CBFE |
  STA $6036,y                               ; $06CC01 |
  STA $603E,y                               ; $06CC04 |
  SEP #$10                                  ; $06CC07 |
  RTS                                       ; $06CC09 |

; baby mario gsu OAM stuff
  db $00, $03, $A2, $0A, $00                ; $06CC0A |
  db $08, $03, $A3, $0A, $00                ; $06CC0F |
  db $00, $0B, $B2, $0A, $00                ; $06CC14 |
  db $08, $0B, $B3, $0A, $00                ; $06CC19 |
  db $FA, $FA, $9C, $0A, $02                ; $06CC1E |
  db $FA, $06, $7E, $CA, $02                ; $06CC23 |
  db $05, $06, $7E, $8A, $02                ; $06CC28 |
  db $05, $FA, $7E, $0A, $02                ; $06CC2D |
  db $FA, $F5, $9C, $0A, $02                ; $06CC32 |
  db $FB, $05, $7E, $CA, $02                ; $06CC37 |
  db $05, $05, $7E, $8A, $02                ; $06CC3C |
  db $06, $F5, $7E, $0A, $02                ; $06CC41 |
  db $F8, $F8, $9C, $0A, $02                ; $06CC46 |
  db $F8, $04, $7E, $CA, $02                ; $06CC4B |
  db $08, $04, $7E, $8A, $02                ; $06CC50 |
  db $08, $F8, $7E, $0A, $02                ; $06CC55 |
  db $F9, $F7, $9C, $0A, $02                ; $06CC5A |
  db $F9, $05, $7E, $CA, $02                ; $06CC5F |
  db $07, $05, $7E, $8A, $02                ; $06CC64 |
  db $07, $F7, $7E, $0A, $02                ; $06CC69 |
  db $FA, $F6, $9C, $0A, $02                ; $06CC6E |
  db $FA, $06, $7E, $CA, $02                ; $06CC73 |
  db $06, $06, $7E, $8A, $02                ; $06CC78 |
  db $06, $F6, $7E, $0A, $02                ; $06CC7D |
  db $F8, $F8, $9C, $0A, $02                ; $06CC82 |
  db $F8, $04, $7E, $CA, $02                ; $06CC87 |
  db $08, $04, $7E, $8A, $02                ; $06CC8C |
  db $08, $F8, $7E, $0A, $02                ; $06CC91 |

  dw $FE80, $0180                           ; $06CC96 |
  dw $FF80, $0080                           ; $06CC9A |

; baby mario sub
CODE_06CC9E:
  LDA !s_spr_x_pixel_pos                    ; $06CC9E |
  SEC                                       ; $06CCA1 |
  SBC !s_spr_x_delta_lo                     ; $06CCA2 |
  STA !s_spr_x_pixel_pos                    ; $06CCA5 |
  LDA !s_spr_y_pixel_pos                    ; $06CCA8 |
  SEC                                       ; $06CCAB |
  SBC !s_spr_y_delta_lo                     ; $06CCAC |
  STA !s_spr_y_pixel_pos                    ; $06CCAF |
  LDA !s_spr_y_speed_lo                     ; $06CCB2 |
  EOR #$FFFF                                ; $06CCB5 |
  SEC                                       ; $06CCB8 |
  ADC $0DAA                                 ; $06CCB9 |
  BPL CODE_06CCC1                           ; $06CCBC |
  LDA #$7FFF                                ; $06CCBE |

CODE_06CCC1:
  CMP #$3800                                ; $06CCC1 |
  BPL CODE_06CCD3                           ; $06CCC4 |
  LDA !s_spr_y_speed_lo                     ; $06CCC6 |
  EOR #$FFFF                                ; $06CCC9 |
  INC A                                     ; $06CCCC |
  STA !s_spr_y_speed_lo                     ; $06CCCD |
  LDA #$3800                                ; $06CCD0 |

CODE_06CCD3:
  STA $0DAA                                 ; $06CCD3 |
  LDA !s_spr_x_speed_lo                     ; $06CCD6 |
  BEQ CODE_06CCE5                           ; $06CCD9 |
  EOR #$FFFF                                ; $06CCDB |
  SEC                                       ; $06CCDE |
  ADC $0DAC                                 ; $06CCDF |
  STA $0DAC                                 ; $06CCE2 |

CODE_06CCE5:
  SEP #$20                                  ; $06CCE5 |
  LDA $0DAB                                 ; $06CCE7 |
  STA $0E                                   ; $06CCEA |
  LDA $0DAD                                 ; $06CCEC |
  STA $00                                   ; $06CCEF |
  JSL $0FB8F0                               ; $06CCF1 |
  REP #$20                                  ; $06CCF5 |
  RTS                                       ; $06CCF7 |

; baby mario sub
CODE_06CCF8:
  LDA #$0055                                ; $06CCF8 |
  STA !gsu_r13                              ; $06CCFB |
  LDA #$60E1                                ; $06CCFE |
  STA !gsu_r12                              ; $06CD01 |
  LDY $76                                   ; $06CD04 |
  CPY #$03                                  ; $06CD06 |
  BNE CODE_06CD0F                           ; $06CD08 |
  STZ !gsu_r5                               ; $06CD0A |
  BRA CODE_06CD22                           ; $06CD0D |

CODE_06CD0F:
  LDY $0D05                                 ; $06CD0F |
  TYA                                       ; $06CD12 |
  STA $00                                   ; $06CD13 |
  LDY $0DAD                                 ; $06CD15 |
  TYA                                       ; $06CD18 |
  CLC                                       ; $06CD19 |
  ADC $00                                   ; $06CD1A |
  AND #$00FF                                ; $06CD1C |
  STA !gsu_r5                               ; $06CD1F |

CODE_06CD22:
  LDA #$0100                                ; $06CD22 |
  STA !gsu_r6                               ; $06CD25 |
  STZ !gsu_r3                               ; $06CD28 |
  LDA #$0020                                ; $06CD2B |
  STA !gsu_r2                               ; $06CD2E |
  LDX #$08                                  ; $06CD31 |
  LDA #$8205                                ; $06CD33 |
  JSL r_gsu_init_1                          ; $06CD36 |
  LDA #$4620                                ; $06CD3A |
  STA $00                                   ; $06CD3D |
  LDA #$6000                                ; $06CD3F |
  STA $02                                   ; $06CD42 |
  LDA #$0004                                ; $06CD44 |
  STA $04                                   ; $06CD47 |
  PHB                                       ; $06CD49 |
  SEP #$20                                  ; $06CD4A |
  LDA #$7E                                  ; $06CD4C |
  PHA                                       ; $06CD4E |
  PLB                                       ; $06CD4F |
  REP #$30                                  ; $06CD50 |
  LDX $4800                                 ; $06CD52 |

CODE_06CD55:
  LDA $00                                   ; $06CD55 |
  STA $0000,x                               ; $06CD57 |
  LDA #$0180                                ; $06CD5A |
  STA $0002,x                               ; $06CD5D |
  LDA #$0018                                ; $06CD60 |
  STA $0004,x                               ; $06CD63 |
  LDA $02                                   ; $06CD66 |
  STA $0005,x                               ; $06CD68 |
  LDA #$0070                                ; $06CD6B |
  STA $0007,x                               ; $06CD6E |
  LDA #$0080                                ; $06CD71 |
  STA $0008,x                               ; $06CD74 |
  LDA $00                                   ; $06CD77 |
  CLC                                       ; $06CD79 |
  ADC #$0100                                ; $06CD7A |
  STA $00                                   ; $06CD7D |
  LDA $02                                   ; $06CD7F |
  CLC                                       ; $06CD81 |
  ADC #$0200                                ; $06CD82 |
  STA $02                                   ; $06CD85 |
  TXA                                       ; $06CD87 |
  CLC                                       ; $06CD88 |
  ADC #$000C                                ; $06CD89 |
  STA $000A,x                               ; $06CD8C |
  TAX                                       ; $06CD8F |
  DEC $04                                   ; $06CD90 |
  BNE CODE_06CD55                           ; $06CD92 |
  STX $4800                                 ; $06CD94 |
  SEP #$10                                  ; $06CD97 |
  PLB                                       ; $06CD99 |
  LDX $12                                   ; $06CD9A |
  RTS                                       ; $06CD9C |

  db $00, $01, $02, $04                     ; $06CD9D |
  db $03, $04, $02, $04                     ; $06CDA1 |
  db $03, $04                               ; $06CDA5 |

  dw $FFC0, $0040                           ; $06CDA7 |

; baby mario sub
  LDA !s_spr_timer_1                        ; $06CDAB |
  BNE CODE_06CDE6                           ; $06CDAE |
  LDY !s_spr_timer_2                        ; $06CDB0 |
  BNE CODE_06CDE6                           ; $06CDB3 |
  INC $16                                   ; $06CDB5 |
  LDY $16                                   ; $06CDB7 |
  CPY #$09                                  ; $06CDB9 |
  BMI CODE_06CDDA                           ; $06CDBB |
  LDY !s_spr_facing_dir                     ; $06CDBD |
  LDA $CDA7,y                               ; $06CDC0 |
  STA !s_spr_x_accel_ceiling                ; $06CDC3 |
  LDA #$0004                                ; $06CDC6 |
  STA !s_spr_x_accel                        ; $06CDC9 |
  LDA #$0004                                ; $06CDCC |
  STA !s_spr_y_accel                        ; $06CDCF |
  STZ !s_spr_y_accel_ceiling                ; $06CDD2 |
  STZ $18                                   ; $06CDD5 |
  INC $76                                   ; $06CDD7 |
  RTS                                       ; $06CDD9 |

CODE_06CDDA:
  LDA $CD9C,y                               ; $06CDDA |
  TAY                                       ; $06CDDD |
  STY $0DB4                                 ; $06CDDE |
  LDY #$02                                  ; $06CDE1 |
  STY !s_spr_timer_2                        ; $06CDE3 |

CODE_06CDE6:
  RTS                                       ; $06CDE6 |

  db $04, $05, $04, $06                     ; $06CDE7 |

  dw $0080, $FF80                           ; $06CDEB |

; baby mario sub
CODE_06CDEF:
  LDY !s_spr_timer_2                        ; $06CDEF |
  BNE CODE_06CE10                           ; $06CDF2 |
  LDA $16                                   ; $06CDF4 |
  INC A                                     ; $06CDF6 |
  AND #$0003                                ; $06CDF7 |
  TAY                                       ; $06CDFA |
  STY $16                                   ; $06CDFB |
  AND #$0001                                ; $06CDFD |
  ASL A                                     ; $06CE00 |
  ASL A                                     ; $06CE01 |
  CLC                                       ; $06CE02 |
  ADC #$0004                                ; $06CE03 |
  STA !s_spr_timer_2                        ; $06CE06 |
  LDA $CDE7,y                               ; $06CE09 |
  TAY                                       ; $06CE0C |
  STY $0DB4                                 ; $06CE0D |

CODE_06CE10:
  LDY !s_spr_timer_1                        ; $06CE10 |
  BNE CODE_06CE2E                           ; $06CE13 |
  LDY #$60                                  ; $06CE15 |
  STY !s_spr_timer_1                        ; $06CE17 |
  LDA #$0008                                ; $06CE1A |
  STA !s_spr_y_accel                        ; $06CE1D |
  LDA $18                                   ; $06CE20 |
  EOR #$0002                                ; $06CE22 |
  STA $18                                   ; $06CE25 |
  TAY                                       ; $06CE27 |
  LDA $CDEB,y                               ; $06CE28 |
  STA !s_spr_y_accel_ceiling                ; $06CE2B |

CODE_06CE2E:
  RTS                                       ; $06CE2E |

; baby mario sub
  LDY $0D9C                                 ; $06CE2F |
  BNE CODE_06CE9E                           ; $06CE32 |
  LDA !s_spr_x_player_delta                 ; $06CE34 |
  STA !gsu_r0                               ; $06CE37 |
  LDA #$F800                                ; $06CE3A |
  STA !gsu_r6                               ; $06CE3D |
  LDX #$0B                                  ; $06CE40 |
  LDA #$86B6                                ; $06CE42 |
  JSL r_gsu_init_1                          ; $06CE45 |
  LDA !gsu_r0                               ; $06CE49 |
  STA !s_spr_x_speed_lo                     ; $06CE4C |
  STZ !gsu_r0                               ; $06CE4F |
  LDA !s_spr_y_player_delta                 ; $06CE52 |
  BMI CODE_06CE69                           ; $06CE55 |
  STA !gsu_r0                               ; $06CE57 |
  LDA #$F800                                ; $06CE5A |
  STA !gsu_r6                               ; $06CE5D |
  LDX #$0B                                  ; $06CE60 |
  LDA #$86B6                                ; $06CE62 |
  JSL r_gsu_init_1                          ; $06CE65 |

CODE_06CE69:
  LDA !gsu_r0                               ; $06CE69 |
  CLC                                       ; $06CE6C |
  ADC #$FC00                                ; $06CE6D |
  STA !s_spr_y_speed_lo                     ; $06CE70 |
  STZ !s_spr_x_accel                        ; $06CE73 |
  LDA #$0040                                ; $06CE76 |
  STA !s_spr_y_accel                        ; $06CE79 |
  LDA #$0400                                ; $06CE7C |
  STA !s_spr_y_accel_ceiling                ; $06CE7F |
  STZ $7860                                 ; $06CE82 |
  INC $0D9C                                 ; $06CE85 |
  LDY $0DB4                                 ; $06CE88 |
  CPY #$07                                  ; $06CE8B |
  BPL CODE_06CE93                           ; $06CE8D |
  JSL $06BFA4                               ; $06CE8F |

CODE_06CE93:
  LDA $0DAC                                 ; $06CE93 |
  SEC                                       ; $06CE96 |
  SBC !s_spr_x_speed_lo                     ; $06CE97 |
  STA $0DAC                                 ; $06CE9A |
  RTS                                       ; $06CE9D |

CODE_06CE9E:
  LDY !s_spr_y_speed_hi                     ; $06CE9E |
  BMI CODE_06CE93                           ; $06CEA1 |
  LDA !s_spr_y_player_delta                 ; $06CEA3 |
  CMP #$0008                                ; $06CEA6 |
  BCS CODE_06CE93                           ; $06CEA9 |
  LDA #$0001                                ; $06CEAB |
  STA !s_spr_wildcard_2_lo                  ; $06CEAE |
  LDA #$0043                                ; $06CEB1 |
  JSL push_sound_queue                      ; $06CEB4 |
  LDA #$000A                                ; $06CEB8 |
  STA !s_spr_state                          ; $06CEBB |
  STZ !s_spr_gsu_morph_1_lo                 ; $06CEBE |
  STZ !s_spr_gsu_morph_2_lo                 ; $06CEC1 |
  STZ $16                                   ; $06CEC4 |
  STZ $76                                   ; $06CEC6 |
  STZ $18                                   ; $06CEC8 |
  LDY #$00                                  ; $06CECA |
  STY $7862                                 ; $06CECC |
  LDA #$000D                                ; $06CECF |
  STA !s_spr_anim_frame                     ; $06CED2 |
  STZ !s_spr_wildcard_6_lo                  ; $06CED5 |
  LDA #$1801                                ; $06CED8 |
  STA !s_spr_oam_1                          ; $06CEDB |
  LDA !s_baby_mario_state                   ; $06CEDE |
  AND #$0FFF                                ; $06CEE1 |
  ORA #$8000                                ; $06CEE4 |
  STA !s_baby_mario_state                   ; $06CEE7 |
  STZ $0D9C                                 ; $06CEEA |
  STZ !s_player_disable_flag                ; $06CEED |
  STZ !s_sprite_disable_flag                ; $06CEF0 |
  LDX $12                                   ; $06CEF3 |
  PLA                                       ; $06CEF5 |
  RTL                                       ; $06CEF6 |

  dw $0200, $FE00                           ; $06CEF7 |

; baby mario sub
  LDY $0D05                                 ; $06CEFB |
  TYA                                       ; $06CEFE |
  STA $00                                   ; $06CEFF |
  LDY $0DAD                                 ; $06CF01 |
  TYA                                       ; $06CF04 |
  CLC                                       ; $06CF05 |
  ADC $00                                   ; $06CF06 |
  TAY                                       ; $06CF08 |
  PHP                                       ; $06CF09 |
  LDY #$00                                  ; $06CF0A |
  PLP                                       ; $06CF0C |
  BPL CODE_06CF11                           ; $06CF0D |
  INY                                       ; $06CF0F |
  INY                                       ; $06CF10 |

CODE_06CF11:
  LDA $CEF7,y                               ; $06CF11 |
  STA !s_spr_x_speed_lo                     ; $06CF14 |
  JMP CODE_06CDEF                           ; $06CF17 |

riding_baby_mario:
  LDY #$00                                  ; $06CF1A |
  STY $7862                                 ; $06CF1C |
  LDA $0B59                                 ; $06CF1F |
  BEQ CODE_06CF34                           ; $06CF22 |
  LDY #$FF                                  ; $06CF24 |
  LDA !s_player_cur_anim_frame              ; $06CF26 |
  CMP #$0166                                ; $06CF29 |
  BEQ CODE_06CF30                           ; $06CF2C |
  LDY #$04                                  ; $06CF2E |

CODE_06CF30:
  STY !s_spr_draw_priority                  ; $06CF30 |
  RTL                                       ; $06CF33 |

CODE_06CF34:
  LDA $0B57                                 ; $06CF34 |
  BEQ CODE_06CF42                           ; $06CF37 |
  LDA !s_egg_throw_state                    ; $06CF39 |
  BEQ CODE_06CF42                           ; $06CF3C |
  JSL $03BD40                               ; $06CF3E |

CODE_06CF42:
  TXA                                       ; $06CF42 |
  STA $7E48                                 ; $06CF43 |
  LDA !s_sprite_disable_flag                ; $06CF46 |
  ORA $0B55                                 ; $06CF49 |
  ORA !r_cur_item_used                      ; $06CF4C |
  BEQ CODE_06CF55                           ; $06CF4F |
  JSL $03B716                               ; $06CF51 |

CODE_06CF55:
  JSR CODE_06CF66                           ; $06CF55 |
  JSR CODE_06CFA5                           ; $06CF58 |
  JSR CODE_06CFC4                           ; $06CF5B |
  JSR CODE_06D019                           ; $06CF5E |
  RTL                                       ; $06CF61 |

  dw $0003, $FFFB                           ; $06CF62 |

CODE_06CF66:
  LDA !s_player_transforming_flag           ; $06CF66 |
  CMP #$0001                                ; $06CF69 |
  BEQ CODE_06CF74                           ; $06CF6C |
  LDY $0C8A                                 ; $06CF6E |
  BNE CODE_06CF74                           ; $06CF71 |
  RTS                                       ; $06CF73 |

CODE_06CF74:
  LDY #$00                                  ; $06CF74 |
  STY $74A3                                 ; $06CF76 |
  LDY !s_player_direction                   ; $06CF79 |
  LDA !s_player_x                           ; $06CF7C |
  CLC                                       ; $06CF7F |
  ADC $CF62,y                               ; $06CF80 |
  STA !s_spr_x_pixel_pos                    ; $06CF83 |
  LDA !s_player_y                           ; $06CF86 |
  CLC                                       ; $06CF89 |
  ADC #$000A                                ; $06CF8A |
  STA !s_spr_y_pixel_pos                    ; $06CF8D |
  LDA !s_spr_facing_dir                     ; $06CF90 |
  EOR #$0002                                ; $06CF93 |
  STA !s_spr_facing_dir                     ; $06CF96 |
  INC !s_player_transforming_flag           ; $06CF99 |
  JSR CODE_06BF1E                           ; $06CF9C |
  LDY #$05                                  ; $06CF9F |
  STY $76                                   ; $06CFA1 |
  PLA                                       ; $06CFA3 |
  RTL                                       ; $06CFA4 |

CODE_06CFA5:
  LDA !s_player_state                       ; $06CFA5 |
  CMP #$0012                                ; $06CFA8 |
  BEQ CODE_06CFB6                           ; $06CFAB |
  LDA !s_player_invincibility_timer         ; $06CFAD |
  SEC                                       ; $06CFB0 |
  SBC #$009F                                ; $06CFB1 |
  BNE CODE_06CFC3                           ; $06CFB4 |

CODE_06CFB6:
  JSR CODE_06D110                           ; $06CFB6 |
  LDA !s_spr_y_pixel_pos                    ; $06CFB9 |
  CLC                                       ; $06CFBC |
  ADC #$0004                                ; $06CFBD |
  STA !s_spr_y_pixel_pos                    ; $06CFC0 |

CODE_06CFC3:
  RTS                                       ; $06CFC3 |

CODE_06CFC4:
  LDA #$FFFF                                ; $06CFC4 |
  LDY !s_spr_draw_priority                  ; $06CFC7 |
  BMI CODE_06CFF2                           ; $06CFCA |
  REP #$10                                  ; $06CFCC |
  LDY !s_player_form                        ; $06CFCE |
  CPY #$000E                                ; $06CFD1 |
  BEQ CODE_06CFED                           ; $06CFD4 |
  LDY !s_player_cur_anim_frame              ; $06CFD6 |
  CPY #$0166                                ; $06CFD9 |
  BEQ CODE_06CFED                           ; $06CFDC |
  LDA #$0002                                ; $06CFDE |
  LDY $0E15                                 ; $06CFE1 |
  BNE CODE_06CFED                           ; $06CFE4 |
  LDY $61CE                                 ; $06CFE6 |
  BNE CODE_06CFED                           ; $06CFE9 |
  INC A                                     ; $06CFEB |
  INC A                                     ; $06CFEC |

CODE_06CFED:
  STA !s_spr_draw_priority                  ; $06CFED |
  SEP #$10                                  ; $06CFF0 |

CODE_06CFF2:
  RTS                                       ; $06CFF2 |

  LDY $0E15                                 ; $06CFF3 |
  BEQ CODE_06D012                           ; $06CFF6 |
  LDY #$1B                                  ; $06CFF8 |
  STY !s_spr_anim_frame                     ; $06CFFA |
  LDY #$12                                  ; $06CFFD |
  STY !s_spr_timer_2                        ; $06CFFF |
  LDA #$0004                                ; $06D002 |
  STA $16                                   ; $06D005 |
  LDA #$000C                                ; $06D007 |
  STA !s_spr_gsu_morph_1_lo                 ; $06D00A |
  STZ !s_spr_facing_dir                     ; $06D00D |
  INC $76                                   ; $06D010 |

CODE_06D012:
  RTS                                       ; $06D012 |

  dw $000D, $0010, $0012                    ; $06D013 |

CODE_06D019:
  LDY $1078                                 ; $06D019 |
  BEQ CODE_06D023                           ; $06D01C |
  LDY #$02                                  ; $06D01E |
  JMP CODE_06D07C                           ; $06D020 |

CODE_06D023:
  LDA !s_player_state                       ; $06D023 |
  CMP #$0006                                ; $06D026 |
  BNE CODE_06D03E                           ; $06D029 |
  LDA !s_pipe_transition_type_lo            ; $06D02B |
  AND #$00FF                                ; $06D02E |
  CMP #$0002                                ; $06D031 |
  BEQ CODE_06D03B                           ; $06D034 |
  CMP #$0004                                ; $06D036 |
  BNE CODE_06D03E                           ; $06D039 |

CODE_06D03B:
  JMP CODE_06D0DE                           ; $06D03B |

CODE_06D03E:
  LDA !s_sprite_disable_flag                ; $06D03E |
  ORA !s_player_disable_flag                ; $06D041 |
  ORA $0B55                                 ; $06D044 |
  ORA !r_cur_item_used                      ; $06D047 |
  BEQ CODE_06D057                           ; $06D04A |
  LDY $0E15                                 ; $06D04C |
  BEQ CODE_06D056                           ; $06D04F |
  LDY #$1F                                  ; $06D051 |
  STY !s_spr_anim_frame                     ; $06D053 |

CODE_06D056:
  RTS                                       ; $06D056 |

CODE_06D057:
  LDA !r_stars_amount                       ; $06D057 |
  CMP #$0032                                ; $06D05A |
  BPL CODE_06D060                           ; $06D05D |
  RTS                                       ; $06D05F |

CODE_06D060:
  LDY #$02                                  ; $06D060 |
  LDA !s_player_jump_state                  ; $06D062 |
  BEQ CODE_06D06C                           ; $06D065 |
  LDA !s_player_y_speed                     ; $06D067 |
  BRA CODE_06D07F                           ; $06D06A |

CODE_06D06C:
  LDA !s_player_x_speed_prev                ; $06D06C |
  BEQ CODE_06D0AD                           ; $06D06F |
  CLC                                       ; $06D071 |
  ADC #$0270                                ; $06D072 |
  CMP #$04E0                                ; $06D075 |
  BCS CODE_06D07C                           ; $06D078 |
  DEY                                       ; $06D07A |
  DEY                                       ; $06D07B |

CODE_06D07C:
  LDA !s_player_x_speed_prev                ; $06D07C |

CODE_06D07F:
  BPL CODE_06D085                           ; $06D07F |
  EOR #$FFFF                                ; $06D081 |
  INC A                                     ; $06D084 |

CODE_06D085:
  CLC                                       ; $06D085 |
  ADC !s_spr_gsu_morph_1_lo                 ; $06D086 |
  CMP #$0F00                                ; $06D089 |
  BMI CODE_06D0A9                           ; $06D08C |
  SEC                                       ; $06D08E |
  SBC #$0F00                                ; $06D08F |
  PHA                                       ; $06D092 |
  INC $16                                   ; $06D093 |
  LDA $16                                   ; $06D095 |
  CLC                                       ; $06D097 |
  ADC $D013,y                               ; $06D098 |
  CMP $D015,y                               ; $06D09B |
  BMI CODE_06D0A5                           ; $06D09E |
  STZ $16                                   ; $06D0A0 |
  LDA $D013,y                               ; $06D0A2 |

CODE_06D0A5:
  STA !s_spr_anim_frame                     ; $06D0A5 |
  PLA                                       ; $06D0A8 |

CODE_06D0A9:
  STA !s_spr_gsu_morph_1_lo                 ; $06D0A9 |
  RTS                                       ; $06D0AC |

CODE_06D0AD:
  LDY #$0D                                  ; $06D0AD |
  LDA !s_player_looking_up_flag             ; $06D0AF |
  BEQ CODE_06D0CD                           ; $06D0B2 |
  LDA $0DAE                                 ; $06D0B4 |
  INC A                                     ; $06D0B7 |
  INC A                                     ; $06D0B8 |
  STA $0DAE                                 ; $06D0B9 |
  BPL CODE_06D0C4                           ; $06D0BC |
  LDA #$7FFF                                ; $06D0BE |
  STA $0DAE                                 ; $06D0C1 |

CODE_06D0C4:
  CMP #$0020                                ; $06D0C4 |
  BCC CODE_06D104                           ; $06D0C7 |
  LDY #$12                                  ; $06D0C9 |
  BRA CODE_06D104                           ; $06D0CB |

CODE_06D0CD:
  LDA $0DAE                                 ; $06D0CD |
  LSR A                                     ; $06D0D0 |
  STA $0DAE                                 ; $06D0D1 |
  CPX $0D96                                 ; $06D0D4 |
  BEQ CODE_06D104                           ; $06D0D7 |
  LDA !s_player_duck_state                  ; $06D0D9 |
  BEQ CODE_06D0FD                           ; $06D0DC |

CODE_06D0DE:
  LDA $0DB0                                 ; $06D0DE |
  INC A                                     ; $06D0E1 |
  INC A                                     ; $06D0E2 |
  STA $0DB0                                 ; $06D0E3 |
  BPL CODE_06D0EE                           ; $06D0E6 |
  LDA #$7FFF                                ; $06D0E8 |
  STA $0DB0                                 ; $06D0EB |

CODE_06D0EE:
  CMP #$0020                                ; $06D0EE |
  BCC CODE_06D104                           ; $06D0F1 |
  LDY #$13                                  ; $06D0F3 |
  CMP #$0024                                ; $06D0F5 |
  BMI CODE_06D104                           ; $06D0F8 |
  INY                                       ; $06D0FA |
  BRA CODE_06D104                           ; $06D0FB |

CODE_06D0FD:
  LDA $0DB0                                 ; $06D0FD |
  LSR A                                     ; $06D100 |
  STA $0DB0                                 ; $06D101 |

CODE_06D104:
  STY !s_spr_anim_frame                     ; $06D104 |

CODE_06D107:
  RTS                                       ; $06D107 |

  dw $0180, $FE80                           ; $06D108 |

  PHA                                       ; $06D10C |
  PHA                                       ; $06D10D |
  BRA CODE_06D117                           ; $06D10E |

CODE_06D110:
  LDX $12                                   ; $06D110 |
  CPX $0D96                                 ; $06D112 |
  BEQ CODE_06D107                           ; $06D115 |

CODE_06D117:
  PHX                                       ; $06D117 |
  LDA !s_player_direction                   ; $06D118 |
  STA !s_spr_facing_dir                     ; $06D11B |
  EOR #$0002                                ; $06D11E |
  TAX                                       ; $06D121 |
  LDA $06D108,x                             ; $06D122 |
  STA !s_spr_x_speed_lo                     ; $06D126 |
  PLX                                       ; $06D129 |
  LDA !s_baby_mario_state                   ; $06D12A |
  AND #$7FFF                                ; $06D12D |
  STA !s_baby_mario_state                   ; $06D130 |
  LDA #$0010                                ; $06D133 |
  STA !s_spr_state                          ; $06D136 |
  LDY #$00                                  ; $06D139 |
  STY $7862                                 ; $06D13B |
  STZ $16                                   ; $06D13E |
  STZ !s_spr_wildcard_2_lo                  ; $06D140 |
  LDA #$FC00                                ; $06D143 |
  STA !s_spr_y_speed_lo                     ; $06D146 |
  STZ $76                                   ; $06D149 |
  LDA #$F629                                ; $06D14B |
  STA $6FA0                                 ; $06D14E |
  LDA !r_header_level_mode                  ; $06D151 |
  CMP #$0009                                ; $06D154 |
  BNE CODE_06D185                           ; $06D157 |
  LDA #$0005                                ; $06D159 |
  STA !s_spr_timer_1                        ; $06D15C |
  LDA #$4001                                ; $06D15F |
  STA !s_spr_oam_1                          ; $06D162 |
  LDA #$6040                                ; $06D165 |
  STA $6FA2                                 ; $06D168 |
  STZ $0DB4                                 ; $06D16B |
  LDA $0D04                                 ; $06D16E |
  EOR #$FFFF                                ; $06D171 |
  INC A                                     ; $06D174 |
  AND #$FF00                                ; $06D175 |
  STA $0DAC                                 ; $06D178 |
  LDA #$5000                                ; $06D17B |
  STA $0DAA                                 ; $06D17E |
  LDY #$10                                  ; $06D181 |
  BRA CODE_06D191                           ; $06D183 |

CODE_06D185:
  LDA !s_player_y                           ; $06D185 |
  SEC                                       ; $06D188 |
  SBC #$0014                                ; $06D189 |
  STA $0DB2                                 ; $06D18C |
  LDY #$20                                  ; $06D18F |

CODE_06D191:
  STY !s_spr_timer_4                        ; $06D191 |
  LDA #$FFFF                                ; $06D194 |
  STA $7E48                                 ; $06D197 |
  PLA                                       ; $06D19A |
  PLA                                       ; $06D19B |
  RTL                                       ; $06D19C |

  dw $0400, $FC00                           ; $06D19D |

init_dangling_ghost:
  LDA #$4000                                ; $06D1A1 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06D1A4 |
  LDA #$2000                                ; $06D1A6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06D1A9 |
  LDY #$00                                  ; $06D1AB |
  LDA !s_spr_x_pixel_pos,x                  ; $06D1AD |
  SEC                                       ; $06D1B0 |
  SBC !s_player_center_x                    ; $06D1B1 |
  BMI CODE_06D1B8                           ; $06D1B4 |
  LDY #$02                                  ; $06D1B6 |

CODE_06D1B8:
  LDA $D19D,y                               ; $06D1B8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06D1BB |
  STZ !s_spr_gsu_morph_1_lo,x               ; $06D1BD |
  STZ !s_spr_wildcard_2_lo,x                ; $06D1C0 |
  STZ !s_spr_timer_3,x                      ; $06D1C3 |
  RTL                                       ; $06D1C6 |

main_dangling_ghost:
  LDA !s_spr_wildcard_2_lo,x                ; $06D1C7 |
  STA $0E                                   ; $06D1CA |
  JSR CODE_06D2AC                           ; $06D1CC |
  JSR CODE_06D307                           ; $06D1CF |
  JSR CODE_06D484                           ; $06D1D2 |
  JSR CODE_06D4FB                           ; $06D1D5 |
  JSL $03AF23                               ; $06D1D8 |
  LDA !s_spr_cam_x_pos,x                    ; $06D1DC |
  CLC                                       ; $06D1DF |
  ADC #$0090                                ; $06D1E0 |
  CMP #$0220                                ; $06D1E3 |
  BCS CODE_06D1F4                           ; $06D1E6 |
  LDA !s_spr_cam_y_pos,x                    ; $06D1E8 |
  CLC                                       ; $06D1EB |
  ADC #$00C8                                ; $06D1EC |
  CMP #$019A                                ; $06D1EF |
  BCC CODE_06D218                           ; $06D1F2 |

CODE_06D1F4:
  JSL $03A31E                               ; $06D1F4 |
  LDA $0E                                   ; $06D1F8 |
  BIT #$0010                                ; $06D1FA |
  BEQ CODE_06D216                           ; $06D1FD |
  LDA !s_spr_wildcard_5_lo                  ; $06D1FF |
  CMP #$000D                                ; $06D202 |
  BEQ CODE_06D20C                           ; $06D205 |
  CMP #$000E                                ; $06D207 |
  BNE CODE_06D216                           ; $06D20A |

CODE_06D20C:
  JSL $06C0B3                               ; $06D20C |
  LDA #$0400                                ; $06D210 |
  STA !s_spr_y_speed_lo                     ; $06D213 |

CODE_06D216:
  BRA CODE_06D226                           ; $06D216 |

CODE_06D218:
  LDA #$0C00                                ; $06D218 |
  TRB $0E                                   ; $06D21B |
  JSR CODE_06D888                           ; $06D21D |
  JSR CODE_06D234                           ; $06D220 |
  JSR CODE_06D537                           ; $06D223 |

CODE_06D226:
  LDX $12                                   ; $06D226 |
  LDA $0E                                   ; $06D228 |
  STA !s_spr_wildcard_2_lo,x                ; $06D22A |
  LDX $12                                   ; $06D22D |
  RTL                                       ; $06D22F |

  dw $FFE0, $0000                           ; $06D230 |

; dangling ghost sub
CODE_06D234:
  LDA !s_baby_mario_state                   ; $06D234 |
  BMI CODE_06D265                           ; $06D237 |
  LDA $0E                                   ; $06D239 |
  BIT #$0010                                ; $06D23B |
  BEQ CODE_06D26C                           ; $06D23E |
  LDA !s_spr_facing_dir,x                   ; $06D240 |
  AND #$0002                                ; $06D243 |
  TAY                                       ; $06D246 |
  LDA $7049EA                               ; $06D247 |
  CLC                                       ; $06D24B |
  ADC $D230,y                               ; $06D24C |
  CLC                                       ; $06D24F |
  ADC !s_spr_x_pixel_pos,x                  ; $06D250 |
  STA !s_spr_x_pixel_pos                    ; $06D253 |
  LDA $7049E8                               ; $06D256 |
  CLC                                       ; $06D25A |
  ADC #$0070                                ; $06D25B |
  CLC                                       ; $06D25E |
  ADC !s_spr_y_pixel_pos,x                  ; $06D25F |
  STA !s_spr_y_pixel_pos                    ; $06D262 |

CODE_06D265:
  LDA $0E                                   ; $06D265 |
  BIT #$0010                                ; $06D267 |
  BNE CODE_06D297                           ; $06D26A |

CODE_06D26C:
  LDA $0E                                   ; $06D26C |
  AND #$000F                                ; $06D26E |
  CMP #$0001                                ; $06D271 |
  BNE CODE_06D2AB                           ; $06D274 |
  LDA $0E                                   ; $06D276 |
  BIT #$0400                                ; $06D278 |
  BEQ CODE_06D2AB                           ; $06D27B |
  LDA !s_baby_mario_state                   ; $06D27D |
  BPL CODE_06D2AB                           ; $06D280 |
  LDA $0E                                   ; $06D282 |
  PHA                                       ; $06D284 |
  JSL $06BEF1                               ; $06D285 |
  PLA                                       ; $06D289 |
  ORA #$0010                                ; $06D28A |
  STA $0E                                   ; $06D28D |
  LDA #$003D                                ; $06D28F |
  JSL push_sound_queue                      ; $06D292 |
  RTS                                       ; $06D296 |

CODE_06D297:
  LDA !r_stars_amount                       ; $06D297 |
  BEQ CODE_06D2A1                           ; $06D29A |
  LDA !s_baby_mario_state                   ; $06D29C |
  BPL CODE_06D2AB                           ; $06D29F |

CODE_06D2A1:
  LDA #$0800                                ; $06D2A1 |
  TSB $0E                                   ; $06D2A4 |
  LDA #$0410                                ; $06D2A6 |
  TRB $0E                                   ; $06D2A9 |

CODE_06D2AB:
  RTS                                       ; $06D2AB |

; dangling ghost sub
CODE_06D2AC:
  LDA #$0011                                ; $06D2AC |
  ASL A                                     ; $06D2AF |
  TAY                                       ; $06D2B0 |

CODE_06D2B1:
  TYA                                       ; $06D2B1 |
  ASL A                                     ; $06D2B2 |
  TAX                                       ; $06D2B3 |
  LDA $D2E3,y                               ; $06D2B4 |
  AND #$00FF                                ; $06D2B7 |
  CMP #$0080                                ; $06D2BA |
  BCC CODE_06D2C2                           ; $06D2BD |
  ORA #$FF00                                ; $06D2BF |

CODE_06D2C2:
  STA $7049C6,x                             ; $06D2C2 |
  LDA $D2E4,y                               ; $06D2C6 |
  AND #$00FF                                ; $06D2C9 |
  CMP #$0080                                ; $06D2CC |
  BCC CODE_06D2D4                           ; $06D2CF |
  ORA #$FF00                                ; $06D2D1 |

CODE_06D2D4:
  SEC                                       ; $06D2D4 |
  SBC #$0070                                ; $06D2D5 |
  STA $7049C8,x                             ; $06D2D8 |
  DEY                                       ; $06D2DC |
  DEY                                       ; $06D2DD |
  BPL CODE_06D2B1                           ; $06D2DE |
  LDX $12                                   ; $06D2E0 |
  RTS                                       ; $06D2E2 |

  db $00, $00, $10, $00                     ; $06D2E3 |
  db $10, $00, $08, $07                     ; $06D2E7 |
  db $08, $07, $08, $07                     ; $06D2EB |
  db $08, $07, $08, $07                     ; $06D2EF |
  db $16, $18, $00, $2E                     ; $06D2F3 |
  db $EA, $18, $F7, $07                     ; $06D2F7 |
  db $F7, $07, $F7, $07                     ; $06D2FB |
  db $F7, $07, $F7, $07                     ; $06D2FF |
  db $F0, $00, $F0, $00                     ; $06D303 |

; dangling ghost sub
CODE_06D307:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06D307 |
  XBA                                       ; $06D309 |
  ASL A                                     ; $06D30A |
  AND #$00FE                                ; $06D30B |
  CLC                                       ; $06D30E |
  ADC #$0100                                ; $06D30F |
  STA !gsu_r1                               ; $06D312 |
  STA $00                                   ; $06D315 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06D317 |
  STA $02                                   ; $06D319 |
  ASL A                                     ; $06D31B |
  XBA                                       ; $06D31C |
  AND #$00FF                                ; $06D31D |
  STA !gsu_r6                               ; $06D320 |
  LDX #$0B                                  ; $06D323 |
  LDA #$8595                                ; $06D325 |
  JSL r_gsu_init_1                          ; $06D328 |
  LDA !gsu_r0                               ; $06D32C |
  LSR A                                     ; $06D32F |
  STA $04                                   ; $06D330 |
  LDA !gsu_r1                               ; $06D332 |
  LSR A                                     ; $06D335 |
  STA $06                                   ; $06D336 |
  LDY #$04                                  ; $06D338 |

CODE_06D33A:
  LDX $D47F,y                               ; $06D33A |
  LDA $7049C6,x                             ; $06D33D |
  CLC                                       ; $06D341 |
  ADC !gsu_r0                               ; $06D342 |
  STA $7049C6,x                             ; $06D345 |
  LDA $7049C8,x                             ; $06D349 |
  CLC                                       ; $06D34D |
  ADC !gsu_r1                               ; $06D34E |
  STA $7049C8,x                             ; $06D351 |
  DEY                                       ; $06D355 |
  BPL CODE_06D33A                           ; $06D356 |
  LDX $12                                   ; $06D358 |
  LDA $0E                                   ; $06D35A |
  AND #$000F                                ; $06D35C |
  CMP #$0001                                ; $06D35F |
  BEQ CODE_06D36A                           ; $06D362 |
  CMP #$0002                                ; $06D364 |
  BEQ CODE_06D36A                           ; $06D367 |
  RTS                                       ; $06D369 |

CODE_06D36A:
  LDA $04                                   ; $06D36A |
  CLC                                       ; $06D36C |
  ADC $7049DA                               ; $06D36D |
  STA $7049DA                               ; $06D371 |
  LDA $04                                   ; $06D375 |
  CLC                                       ; $06D377 |
  ADC $7049FA                               ; $06D378 |
  STA $7049FA                               ; $06D37C |
  LDA $06                                   ; $06D380 |
  CLC                                       ; $06D382 |
  ADC $7049DC                               ; $06D383 |
  STA $7049DC                               ; $06D387 |
  LDA $06                                   ; $06D38B |
  CLC                                       ; $06D38D |
  ADC $7049FC                               ; $06D38E |
  STA $7049FC                               ; $06D392 |
  LDA $14                                   ; $06D396 |
  ASL A                                     ; $06D398 |
  ASL A                                     ; $06D399 |
  ASL A                                     ; $06D39A |
  ASL A                                     ; $06D39B |
  AND #$01FE                                ; $06D39C |
  STA !gsu_r1                               ; $06D39F |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06D3A2 |
  XBA                                       ; $06D3A4 |
  AND #$00FF                                ; $06D3A5 |
  LSR A                                     ; $06D3A8 |
  LSR A                                     ; $06D3A9 |
  STA !gsu_r6                               ; $06D3AA |
  LDX #$0B                                  ; $06D3AD |
  LDA #$8595                                ; $06D3AF |
  JSL r_gsu_init_1                          ; $06D3B2 |
  LDX $12                                   ; $06D3B6 |
  LDA !gsu_r1                               ; $06D3B8 |
  CLC                                       ; $06D3BB |
  ADC $00                                   ; $06D3BC |
  AND #$01FE                                ; $06D3BE |
  STA !gsu_r1                               ; $06D3C1 |
  LDA $02                                   ; $06D3C4 |
  LSR A                                     ; $06D3C6 |
  XBA                                       ; $06D3C7 |
  AND #$00FF                                ; $06D3C8 |
  STA !gsu_r6                               ; $06D3CB |
  LDX #$0B                                  ; $06D3CE |
  LDA #$8595                                ; $06D3D0 |
  JSL r_gsu_init_1                          ; $06D3D3 |
  LDX $12                                   ; $06D3D7 |
  LDA !gsu_r0                               ; $06D3D9 |
  CLC                                       ; $06D3DC |
  ADC $7049D6                               ; $06D3DD |
  STA $7049D6                               ; $06D3E1 |
  LDA !gsu_r0                               ; $06D3E5 |
  CLC                                       ; $06D3E8 |
  ADC $7049FE                               ; $06D3E9 |
  STA $7049FE                               ; $06D3ED |
  LDA !gsu_r1                               ; $06D3F1 |
  PHA                                       ; $06D3F4 |
  CLC                                       ; $06D3F5 |
  ADC $7049D8                               ; $06D3F6 |
  STA $7049D8                               ; $06D3FA |
  PLA                                       ; $06D3FE |
  ADC $704A00                               ; $06D3FF |
  STA $704A00                               ; $06D403 |
  LDA $14                                   ; $06D407 |
  ASL A                                     ; $06D409 |
  ASL A                                     ; $06D40A |
  ASL A                                     ; $06D40B |
  ASL A                                     ; $06D40C |
  AND #$01FE                                ; $06D40D |
  STA !gsu_r1                               ; $06D410 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06D413 |
  XBA                                       ; $06D415 |
  AND #$00FF                                ; $06D416 |
  LSR A                                     ; $06D419 |
  LSR A                                     ; $06D41A |
  LSR A                                     ; $06D41B |
  STA !gsu_r6                               ; $06D41C |
  LDX #$0B                                  ; $06D41F |
  LDA #$8595                                ; $06D421 |
  JSL r_gsu_init_1                          ; $06D424 |
  LDX $12                                   ; $06D428 |
  LDA $00                                   ; $06D42A |
  SEC                                       ; $06D42C |
  SBC !gsu_r1                               ; $06D42D |
  AND #$01FE                                ; $06D430 |
  STA !gsu_r1                               ; $06D433 |
  LDA $02                                   ; $06D436 |
  LSR A                                     ; $06D438 |
  CLC                                       ; $06D439 |
  ADC $02                                   ; $06D43A |
  XBA                                       ; $06D43C |
  AND #$00FF                                ; $06D43D |
  STA !gsu_r6                               ; $06D440 |
  LDX #$0B                                  ; $06D443 |
  LDA #$8595                                ; $06D445 |
  JSL r_gsu_init_1                          ; $06D448 |
  LDX $12                                   ; $06D44C |
  LDA !gsu_r0                               ; $06D44E |
  CLC                                       ; $06D451 |
  ADC $7049DE                               ; $06D452 |
  STA $7049DE                               ; $06D456 |
  LDA !gsu_r0                               ; $06D45A |
  CLC                                       ; $06D45D |
  ADC $7049F6                               ; $06D45E |
  STA $7049F6                               ; $06D462 |
  LDA !gsu_r1                               ; $06D466 |
  PHA                                       ; $06D469 |
  CLC                                       ; $06D46A |
  ADC $7049E0                               ; $06D46B |
  STA $7049E0                               ; $06D46F |
  PLA                                       ; $06D473 |
  ADC $7049F8                               ; $06D474 |
  STA $7049F8                               ; $06D478 |
  LDX $12                                   ; $06D47C |
  RTS                                       ; $06D47E |

  db $1C, $20, $24, $28                     ; $06D47F |
  db $2C                                    ; $06D483 |

; dangling ghost sub
CODE_06D484:
  LDA !s_spr_cam_x_pos,x                    ; $06D484 |
  CLC                                       ; $06D486 |
  ADC #$0090                                ; $06D488 |
  CMP #$0220                                ; $06D48B |
  BCS CODE_06D49C                           ; $06D48E |
  LDA !s_spr_cam_y_pos,x                    ; $06D490 |
  CLC                                       ; $06D493 |
  ADC #$00C8                                ; $06D494 |
  CMP #$019A                                ; $06D497 |
  BCC CODE_06D4AC                           ; $06D49A |

CODE_06D49C:
  LDY #$11                                  ; $06D49C |
  STY !r_reg_tm_mirror                      ; $06D49E |
  LDY #$02                                  ; $06D4A1 |
  STY !r_reg_ts_mirror                      ; $06D4A3 |
  LDY #$20                                  ; $06D4A6 |
  STY !r_reg_cgadsub_mirror                 ; $06D4A8 |
  RTS                                       ; $06D4AB |

CODE_06D4AC:
  LDA #$0000                                ; $06D4AC |
  CLC                                       ; $06D4AF |
  ADC !s_spr_cam_x_pos,x                    ; $06D4B0 |
  STA $6040                                 ; $06D4B3 |
  LDA #$0070                                ; $06D4B6 |
  CLC                                       ; $06D4B9 |
  ADC !s_spr_cam_y_pos,x                    ; $06D4BA |
  STA $6042                                 ; $06D4BD |
  LDA #$0012                                ; $06D4C0 |
  STA !gsu_r2                               ; $06D4C3 |
  LDX #$08                                  ; $06D4C6 |
  LDA #$E64B                                ; $06D4C8 |
  JSL r_gsu_init_1                          ; $06D4CB |
  JSL $00BE39                               ; $06D4CF |

; DMA args
  dl $7E5040, $703372                       ; $06D4D3 |
  dw $0348                                  ; $06D4D9 |

  SEP #$30                                  ; $06D4DB |
  LDA #$13                                  ; $06D4DD |
  STA !r_reg_tm_mirror                      ; $06D4DF |
  LDA #$04                                  ; $06D4E2 |
  STA !r_reg_ts_mirror                      ; $06D4E4 |
  LDA #$22                                  ; $06D4E7 |
  STA !r_reg_cgwsel_mirror                  ; $06D4E9 |
  LDA #$63                                  ; $06D4EC |
  STA !r_reg_cgadsub_mirror                 ; $06D4EE |
  LDA #$18                                  ; $06D4F1 |
  TSB !r_reg_hdmaen_mirror                  ; $06D4F3 |
  REP #$20                                  ; $06D4F6 |
  LDX $12                                   ; $06D4F8 |
  RTS                                       ; $06D4FA |

; dangling ghost sub
CODE_06D4FB:
  REP #$10                                  ; $06D4FB |
  LDA $7049EA                               ; $06D4FD |
  SEC                                       ; $06D501 |
  SBC #$0008                                ; $06D502 |
  STA $00                                   ; $06D505 |
  LDA $7049E8                               ; $06D507 |
  CLC                                       ; $06D50B |
  ADC #$0070                                ; $06D50C |
  STA $02                                   ; $06D50F |
  LDY !s_spr_oam_pointer,x                  ; $06D511 |
  LDX #$000C                                ; $06D514 |

CODE_06D517:
  LDA $6000,y                               ; $06D517 |
  CLC                                       ; $06D51A |
  ADC $00                                   ; $06D51B |
  STA $6000,y                               ; $06D51D |
  LDA $6002,y                               ; $06D520 |
  CLC                                       ; $06D523 |
  ADC $02                                   ; $06D524 |
  STA $6002,y                               ; $06D526 |
  TYA                                       ; $06D529 |
  CLC                                       ; $06D52A |
  ADC #$0008                                ; $06D52B |
  TAY                                       ; $06D52E |
  DEX                                       ; $06D52F |
  BNE CODE_06D517                           ; $06D530 |
  SEP #$10                                  ; $06D532 |
  LDX $12                                   ; $06D534 |
  RTS                                       ; $06D536 |

; dangling ghost sub
CODE_06D537:
  LDA $0E                                   ; $06D537 |
  BIT #$0800                                ; $06D539 |
  BEQ CODE_06D564                           ; $06D53C |
  LDA $0E                                   ; $06D53E |
  AND #$FFE0                                ; $06D540 |
  ORA #$8022                                ; $06D543 |
  STA $0E                                   ; $06D546 |
  LDA !r_stars_amount                       ; $06D548 |
  BEQ CODE_06D564                           ; $06D54B |
  LDA !s_spr_wildcard_5_lo                  ; $06D54D |
  CMP #$000D                                ; $06D550 |
  BEQ CODE_06D55A                           ; $06D553 |
  CMP #$000E                                ; $06D555 |
  BNE CODE_06D564                           ; $06D558 |

CODE_06D55A:
  JSL $06C0B3                               ; $06D55A |
  LDA #$0400                                ; $06D55E |
  STA !s_spr_y_speed_lo                     ; $06D561 |

CODE_06D564:
  LDA $0E                                   ; $06D564 |
  AND #$000F                                ; $06D566 |
  ASL A                                     ; $06D569 |
  TAY                                       ; $06D56A |
  LDA $D577,y                               ; $06D56B |
  STA $00                                   ; $06D56E |
  PER $0002                                 ; $06D570 |
  JMP ($7960)                               ; $06D573 | sub
  RTS                                       ; $06D576 |

; dangling ghost routine table
  dw $D589                                  ; $06D577 |
  dw $D6F3                                  ; $06D579 |
  dw $D7B6                                  ; $06D57B |
  dw $D842                                  ; $06D57D |

  dw $1000, $7000                           ; $06D57F |
  dw $0000, $FFFF                           ; $06D583 |
  dw $0200                                  ; $06D587 |

  LDA !s_spr_facing_dir,x                   ; $06D589 |
  AND #$FFFD                                ; $06D58C |
  STA !s_spr_facing_dir,x                   ; $06D58F |
  LDY #$01                                  ; $06D592 |
  LDA !s_player_x                           ; $06D594 |
  SEC                                       ; $06D597 |
  SBC !s_spr_x_pixel_pos,x                  ; $06D598 |
  BPL CODE_06D59F                           ; $06D59B |
  LDY #$00                                  ; $06D59D |

CODE_06D59F:
  LDA $D587,y                               ; $06D59F |
  AND #$00FF                                ; $06D5A2 |
  ORA !s_spr_facing_dir,x                   ; $06D5A5 |
  STA !s_spr_facing_dir,x                   ; $06D5A8 |
  STZ !s_spr_anim_frame,x                   ; $06D5AB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06D5AE |
  SEC                                       ; $06D5B0 |
  SBC #$4000                                ; $06D5B1 |
  STA $00                                   ; $06D5B4 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06D5B6 |
  CLC                                       ; $06D5B8 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06D5B9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06D5BB |
  SEC                                       ; $06D5BD |
  SBC #$4000                                ; $06D5BE |
  EOR $00                                   ; $06D5C1 |
  BPL CODE_06D5CC                           ; $06D5C3 |
  LDA #$0034                                ; $06D5C5 |
  JSL push_sound_queue                      ; $06D5C8 |

CODE_06D5CC:
  LDY #$02                                  ; $06D5CC |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06D5CE |
  SEC                                       ; $06D5D0 |
  SBC #$4000                                ; $06D5D1 |
  BPL CODE_06D5DB                           ; $06D5D4 |
  LDY #$00                                  ; $06D5D6 |
  EOR #$FFFF                                ; $06D5D8 |

CODE_06D5DB:
  CMP #$3000                                ; $06D5DB |
  BCC CODE_06D5E5                           ; $06D5DE |
  LDA $D57F,y                               ; $06D5E0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06D5E3 |

CODE_06D5E5:
  LDY #$02                                  ; $06D5E5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06D5E7 |
  SEC                                       ; $06D5E9 |
  SBC #$4000                                ; $06D5EA |
  BPL CODE_06D5F5                           ; $06D5ED |
  LDY #$00                                  ; $06D5EF |
  EOR #$FFFF                                ; $06D5F1 |
  INC A                                     ; $06D5F4 |

CODE_06D5F5:
  XBA                                       ; $06D5F5 |
  AND #$00FF                                ; $06D5F6 |
  EOR $D583,y                               ; $06D5F9 |
  CLC                                       ; $06D5FC |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $06D5FD |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06D5FF |
  LDA $796E                                 ; $06D601 |
  BIT #$0010                                ; $06D604 |
  BEQ CODE_06D60C                           ; $06D607 |
  JMP CODE_06D6E2                           ; $06D609 |

CODE_06D60C:
  LDA !s_player_center_x                    ; $06D60C |
  SEC                                       ; $06D60F |
  SBC !s_spr_x_pixel_pos,x                  ; $06D610 |
  CLC                                       ; $06D613 |
  ADC #$0060                                ; $06D614 |
  CMP #$00C0                                ; $06D617 |
  BCC CODE_06D621                           ; $06D61A |

CODE_06D61C:
  RTS                                       ; $06D61C |

  dw $0042, $0062                           ; $06D61D |

; dangling ghost sub
CODE_06D621:
  LDA !s_player_invincibility_timer         ; $06D621 |
  BNE CODE_06D61C                           ; $06D624 |
  LDA !s_spr_timer_3,x                      ; $06D626 |
  BNE CODE_06D61C                           ; $06D629 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06D62B |
  CMP #$0003                                ; $06D62E |
  BCC CODE_06D63E                           ; $06D631 |
  LDA #$0050                                ; $06D633 |
  STA !s_spr_timer_3,x                      ; $06D636 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $06D639 |
  BRA CODE_06D61C                           ; $06D63C |

CODE_06D63E:
  LDY #$00                                  ; $06D63E |
  LDA !s_spr_x_pixel_pos,x                  ; $06D640 |
  BIT #$0010                                ; $06D643 |
  BEQ CODE_06D64A                           ; $06D646 |
  LDY #$02                                  ; $06D648 |

CODE_06D64A:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06D64A |
  XBA                                       ; $06D64C |
  AND #$00FF                                ; $06D64D |
  ASL A                                     ; $06D650 |
  STA $00                                   ; $06D651 |
  LDA !s_spr_x_pixel_pos,x                  ; $06D653 |
  SEC                                       ; $06D656 |
  SBC !s_player_center_x                    ; $06D657 |
  STA !gsu_r1                               ; $06D65A |
  LDA !s_player_center_y                    ; $06D65D |
  SEC                                       ; $06D660 |
  SBC !s_spr_y_pixel_pos,x                  ; $06D661 |
  SEC                                       ; $06D664 |
  SBC #$0018                                ; $06D665 |
  SEC                                       ; $06D668 |
  SBC $00                                   ; $06D669 |
  CMP #$0010                                ; $06D66B |
  BMI CODE_06D6E2                           ; $06D66E |
  CLC                                       ; $06D670 |
  ADC $00                                   ; $06D671 |
  CMP #$00C0                                ; $06D673 |
  BPL CODE_06D6E2                           ; $06D676 |
  CMP $D61D,y                               ; $06D678 |
  BMI CODE_06D680                           ; $06D67B |
  LDA $D61D,y                               ; $06D67D |

CODE_06D680:
  STA $00                                   ; $06D680 |
  EOR #$FFFF                                ; $06D682 |
  INC A                                     ; $06D685 |
  STA !gsu_r2                               ; $06D686 |
  LDX #$0B                                  ; $06D689 |
  LDA #$BCF8                                ; $06D68B |
  JSL r_gsu_init_1                          ; $06D68E |
  LDX $12                                   ; $06D692 |
  LDA !gsu_r1                               ; $06D694 |
  SEC                                       ; $06D697 |
  SBC #$0080                                ; $06D698 |
  AND #$00FF                                ; $06D69B |
  XBA                                       ; $06D69E |
  STA !s_spr_gsu_morph_2_lo,x               ; $06D69F |
  REP #$10                                  ; $06D6A2 |
  LDA !gsu_r1                               ; $06D6A4 |
  ASL A                                     ; $06D6A7 |
  TAX                                       ; $06D6A8 |
  LDA $00E9D4,x                             ; $06D6A9 |
  ASL A                                     ; $06D6AD |
  TAX                                       ; $06D6AE |
  LDA $702200,x                             ; $06D6AF |
  STA $02                                   ; $06D6B3 |
  SEP #$30                                  ; $06D6B5 |
  LDX $02                                   ; $06D6B7 |
  STX !reg_m7a                              ; $06D6B9 |
  LDX $03                                   ; $06D6BC |
  STX !reg_m7a                              ; $06D6BE |
  LDA $00                                   ; $06D6C1 |
  LSR A                                     ; $06D6C3 |
  STA !reg_m7b                              ; $06D6C4 |
  REP #$20                                  ; $06D6C7 |
  LDX $12                                   ; $06D6C9 |
  LDA !reg_mpym                             ; $06D6CB |
  AND #$00FF                                ; $06D6CE |
  XBA                                       ; $06D6D1 |
  STA !s_spr_wildcard_1_lo,x                ; $06D6D2 |
  LDA $0E                                   ; $06D6D5 |
  AND #$FFF0                                ; $06D6D7 |
  ORA #$8001                                ; $06D6DA |
  STA $0E                                   ; $06D6DD |
  INC !s_spr_gsu_morph_1_lo,x               ; $06D6DF |

CODE_06D6E2:
  RTS                                       ; $06D6E2 |

  db $07, $06, $05, $04                     ; $06D6E3 |
  db $03, $02, $01, $00                     ; $06D6E7 |
  db $40, $04, $03, $02                     ; $06D6EB |
  db $02, $02, $01, $01                     ; $06D6EF |

; dangling ghost sub
  LDA $0E                                   ; $06D6F3 |
  BPL CODE_06D704                           ; $06D6F5 |
  AND #$7FFF                                ; $06D6F7 |
  STA $0E                                   ; $06D6FA |
  LDA #$0006                                ; $06D6FC |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D6FF |
  STZ !s_spr_timer_1,x                      ; $06D701 |

CODE_06D704:
  LDA !s_spr_timer_1,x                      ; $06D704 |
  BNE CODE_06D723                           ; $06D707 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06D709 |
  BEQ CODE_06D723                           ; $06D70B |
  DEC A                                     ; $06D70D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D70E |
  TAY                                       ; $06D710 |
  LDA $D6E3,y                               ; $06D711 |
  AND #$00FF                                ; $06D714 |
  STA !s_spr_anim_frame,x                   ; $06D717 |
  LDA $D6EB,y                               ; $06D71A |
  AND #$00FF                                ; $06D71D |
  STA !s_spr_timer_1,x                      ; $06D720 |

CODE_06D723:
  LDA $0E                                   ; $06D723 |
  BIT #$0010                                ; $06D725 |
  BNE CODE_06D73F                           ; $06D728 |
  LDA !s_player_center_x                    ; $06D72A |
  SEC                                       ; $06D72D |
  SBC !s_spr_x_pixel_pos,x                  ; $06D72E |
  CLC                                       ; $06D731 |
  ADC #$0060                                ; $06D732 |
  CMP #$00C0                                ; $06D735 |
  BCC CODE_06D74E                           ; $06D738 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $06D73A |
  STZ !s_spr_gsu_morph_1_lo,x               ; $06D73C |

CODE_06D73F:
  LDA $0E                                   ; $06D73F |
  AND #$FFF0                                ; $06D741 |
  ORA #$8002                                ; $06D744 |
  STA $0E                                   ; $06D747 |
  RTS                                       ; $06D749 |

  dw $FE00, $0200                           ; $06D74A |

; dangling ghost sub
CODE_06D74E:
  LDY #$00                                  ; $06D74E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $06D750 |
  SEC                                       ; $06D753 |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $06D754 |
  STA $00                                   ; $06D756 |
  BEQ CODE_06D76F                           ; $06D758 |
  BMI CODE_06D75E                           ; $06D75A |
  LDY #$02                                  ; $06D75C |

CODE_06D75E:
  LDA $D74A,y                               ; $06D75E |
  CLC                                       ; $06D761 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06D762 |
  PHA                                       ; $06D764 |
  SEC                                       ; $06D765 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $06D766 |
  EOR $00                                   ; $06D769 |
  ASL A                                     ; $06D76B |
  PLA                                       ; $06D76C |
  BCS CODE_06D772                           ; $06D76D |

CODE_06D76F:
  LDA !s_spr_gsu_morph_2_lo,x               ; $06D76F |

CODE_06D772:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06D772 |
  LDA !s_spr_wildcard_1_lo,x                ; $06D774 |
  SEC                                       ; $06D777 |
  SBC !s_spr_wildcard_5_lo_dp,x             ; $06D778 |
  BMI CODE_06D790                           ; $06D77A |
  ASL A                                     ; $06D77C |
  XBA                                       ; $06D77D |
  AND #$00FF                                ; $06D77E |
  ASL A                                     ; $06D781 |
  ASL A                                     ; $06D782 |
  ASL A                                     ; $06D783 |
  CLC                                       ; $06D784 |
  ADC #$0010                                ; $06D785 |
  CLC                                       ; $06D788 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $06D789 |
  CMP !s_spr_wildcard_1_lo,x                ; $06D78B |
  BCC CODE_06D79D                           ; $06D78E |

CODE_06D790:
  LDA $0E                                   ; $06D790 |
  AND #$FFF0                                ; $06D792 |
  ORA #$8002                                ; $06D795 |
  STA $0E                                   ; $06D798 |
  LDA !s_spr_wildcard_1_lo,x                ; $06D79A |

CODE_06D79D:
  STA !s_spr_wildcard_5_lo_dp,x             ; $06D79D |
  LDX $12                                   ; $06D79F |
  RTS                                       ; $06D7A1 |

  dw $1800, $1800                           ; $06D7A2 |

  dw $0000, $8003                           ; $06D7A6 |

  db $0E, $0D, $0C, $05                     ; $06D7AA |
  db $06, $07, $01, $01                     ; $06D7AE |
  db $01, $01, $01, $01                     ; $06D7B2 |

; dangling ghost sub
  LDA $0E                                   ; $06D7B6 |
  BPL CODE_06D7C7                           ; $06D7B8 |
  AND #$7FFF                                ; $06D7BA |
  STA $0E                                   ; $06D7BD |
  LDA #$0006                                ; $06D7BF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D7C2 |
  STZ !s_spr_timer_1,x                      ; $06D7C4 |

CODE_06D7C7:
  LDA !s_spr_timer_1,x                      ; $06D7C7 |
  BNE CODE_06D7E6                           ; $06D7CA |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06D7CC |
  BEQ CODE_06D7E6                           ; $06D7CE |
  DEC A                                     ; $06D7D0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D7D1 |
  TAY                                       ; $06D7D3 |
  LDA $D7AA,y                               ; $06D7D4 |
  AND #$00FF                                ; $06D7D7 |
  STA !s_spr_anim_frame,x                   ; $06D7DA |
  LDA $D7B0,y                               ; $06D7DD |
  AND #$00FF                                ; $06D7E0 |
  STA !s_spr_timer_1,x                      ; $06D7E3 |

CODE_06D7E6:
  LDY #$00                                  ; $06D7E6 |
  LDA $0E                                   ; $06D7E8 |
  BIT #$0020                                ; $06D7EA |
  BEQ CODE_06D7F1                           ; $06D7ED |
  LDY #$02                                  ; $06D7EF |

CODE_06D7F1:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06D7F1 |
  SEC                                       ; $06D7F3 |
  SBC #$0400                                ; $06D7F4 |
  CMP $D7A2,y                               ; $06D7F7 |
  BCS CODE_06D835                           ; $06D7FA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06D7FC |
  SEC                                       ; $06D7FE |
  SBC #$4000                                ; $06D7FF |
  XBA                                       ; $06D802 |
  AND #$00FF                                ; $06D803 |
  EOR #$FFFF                                ; $06D806 |
  INC A                                     ; $06D809 |
  CLC                                       ; $06D80A |
  ADC #$0400                                ; $06D80B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06D80E |
  PHY                                       ; $06D810 |
  LDY #$00                                  ; $06D811 |
  LDA $0E                                   ; $06D813 |
  BIT #$0020                                ; $06D815 |
  BEQ CODE_06D822                           ; $06D818 |
  LDA #$0100                                ; $06D81A |
  STA !s_spr_timer_2,x                      ; $06D81D |
  LDY #$02                                  ; $06D820 |

CODE_06D822:
  LDA $0E                                   ; $06D822 |
  AND #$FFD0                                ; $06D824 |
  ORA $D7A6,y                               ; $06D827 |
  STA $0E                                   ; $06D82A |
  PLY                                       ; $06D82C |
  ORA #$0000                                ; $06D82D |
  BMI CODE_06D842                           ; $06D830 |
  LDA $D7A2,y                               ; $06D832 |

CODE_06D835:
  STA !s_spr_wildcard_5_lo_dp,x             ; $06D835 |
  LDX $12                                   ; $06D837 |
  RTS                                       ; $06D839 |

  db $10, $11, $10, $0F                     ; $06D83A |

  db $02, $20, $02, $10                     ; $06D83E |

; dangling ghost sub
CODE_06D842:
  LDA $0E                                   ; $06D842 |
  BPL CODE_06D859                           ; $06D844 |
  AND #$7FFF                                ; $06D846 |
  STA $0E                                   ; $06D849 |
  LDA #$0004                                ; $06D84B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D84E |
  STZ !s_spr_timer_1,x                      ; $06D850 |
  LDA #$0100                                ; $06D853 |
  STA !s_spr_timer_2,x                      ; $06D856 |

CODE_06D859:
  LDA !s_spr_timer_1,x                      ; $06D859 |
  BNE CODE_06D887                           ; $06D85C |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $06D85E |
  BPL CODE_06D867                           ; $06D860 |
  LDA #$0003                                ; $06D862 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06D865 |

CODE_06D867:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $06D867 |
  LDA $D83A,y                               ; $06D869 |
  AND #$00FF                                ; $06D86C |
  STA !s_spr_anim_frame,x                   ; $06D86F |
  LDA $D83E,y                               ; $06D872 |
  AND #$00FF                                ; $06D875 |
  STA !s_spr_timer_1,x                      ; $06D878 |
  LDA !s_spr_timer_2,x                      ; $06D87B |
  BNE CODE_06D887                           ; $06D87E |
  LDA $0E                                   ; $06D880 |
  AND #$FFF0                                ; $06D882 |
  STA $0E                                   ; $06D885 |

CODE_06D887:
  RTS                                       ; $06D887 |

; dangling ghost sub
CODE_06D888:
  LDA !s_spr_cam_x_pos,x                    ; $06D888 |
  CLC                                       ; $06D88B |
  ADC #$0050                                ; $06D88C |
  CMP #$01A0                                ; $06D88F |
  BCS CODE_06D90F                           ; $06D892 |
  TXA                                       ; $06D894 |
  STA $6012                                 ; $06D895 |
  LDA !s_player_x_cam_rel                   ; $06D898 |
  STA $6014                                 ; $06D89B |
  LDA !s_player_y_cam_rel                   ; $06D89E |
  STA $6016                                 ; $06D8A1 |
  LDA !s_player_duck_state                  ; $06D8A4 |
  STA $6018                                 ; $06D8A7 |
  LDX #$0A                                  ; $06D8AA |
  LDA #$8390                                ; $06D8AC |
  JSL r_gsu_init_1                          ; $06D8AF |
  LDA $601A                                 ; $06D8B3 |
  BEQ CODE_06D8F4                           ; $06D8B6 |
  LDX $12                                   ; $06D8B8 |
  LDY #$00                                  ; $06D8BA |
  LDA !s_spr_x_pixel_pos,x                  ; $06D8BC |
  CMP !s_player_x                           ; $06D8BF |
  BMI CODE_06D8C6                           ; $06D8C2 |
  LDY #$02                                  ; $06D8C4 |

CODE_06D8C6:
  LDA $D912,y                               ; $06D8C6 |
  CLC                                       ; $06D8C9 |
  ADC !s_player_x_speed                     ; $06D8CA |
  PHA                                       ; $06D8CD |
  SEC                                       ; $06D8CE |
  SBC $D916,y                               ; $06D8CF |
  EOR $D912,y                               ; $06D8D2 |
  ASL A                                     ; $06D8D5 |
  PLA                                       ; $06D8D6 |
  BCS CODE_06D8DC                           ; $06D8D7 |
  LDA $D916,y                               ; $06D8D9 |

CODE_06D8DC:
  STA !s_player_x_speed                     ; $06D8DC |
  LDA $0E                                   ; $06D8DF |
  LDA $0E                                   ; $06D8E1 |
  PHA                                       ; $06D8E3 |
  LDX $12                                   ; $06D8E4 |
  JSL player_hit_sprite                     ; $06D8E6 |
  PLA                                       ; $06D8EA |
  STA $0E                                   ; $06D8EB |
  LDA #$0400                                ; $06D8ED |
  TSB $0E                                   ; $06D8F0 |
  LDX $12                                   ; $06D8F2 |

CODE_06D8F4:
  LDX $12                                   ; $06D8F4 |
  LDY !s_spr_collision_id,x                 ; $06D8F6 |
  DEY                                       ; $06D8F9 |
  BMI CODE_06D90F                           ; $06D8FA |
  LDA !s_spr_collision_state,y              ; $06D8FC |
  BEQ CODE_06D90F                           ; $06D8FF |
  LDA $0E                                   ; $06D901 |
  PHA                                       ; $06D903 |
  TYX                                       ; $06D904 |
  JSL $03B25B                               ; $06D905 |
  PLA                                       ; $06D909 |
  ORA #$0800                                ; $06D90A |
  STA $0E                                   ; $06D90D |

CODE_06D90F:
  LDX $12                                   ; $06D90F |
  RTS                                       ; $06D911 |

  dw $0100                                  ; $06D912 |
  dw $FF00                                  ; $06D914 |

  dw $0200                                  ; $06D916 |
  dw $FE00                                  ; $06D918 |

; caged ghost sub
CODE_06D91A:
  TXA                                       ; $06D91A |
  STA $6012                                 ; $06D91B |
  LDA !s_player_x_cam_rel                   ; $06D91E |
  STA $6014                                 ; $06D921 |
  LDA !s_player_y_cam_rel                   ; $06D924 |
  STA $6016                                 ; $06D927 |
  LDA !s_player_duck_state                  ; $06D92A |
  STA $6018                                 ; $06D92D |
  LDX #$0A                                  ; $06D930 |
  LDA #$8390                                ; $06D932 |
  JSL r_gsu_init_1                          ; $06D935 | sfx
  LDA $601A                                 ; $06D939 |
  BEQ CODE_06D976                           ; $06D93C |
  LDX $12                                   ; $06D93E |
  LDY #$00                                  ; $06D940 |
  LDA !s_spr_x_pixel_pos,x                  ; $06D942 |
  CMP !s_player_x                           ; $06D945 |
  BMI CODE_06D94C                           ; $06D948 |
  LDY #$02                                  ; $06D94A |

CODE_06D94C:
  LDA $D912,y                               ; $06D94C |
  CLC                                       ; $06D94F |
  ADC !s_player_x_speed                     ; $06D950 |
  PHA                                       ; $06D953 |
  SEC                                       ; $06D954 |
  SBC $D916,y                               ; $06D955 |
  EOR $D912,y                               ; $06D958 |
  ASL A                                     ; $06D95B |
  PLA                                       ; $06D95C |
  BCS CODE_06D962                           ; $06D95D |
  LDA $D916,y                               ; $06D95F |

CODE_06D962:
  STA !s_player_x_speed                     ; $06D962 |
  LDA $0E                                   ; $06D965 |
  PHA                                       ; $06D967 |
  LDX $12                                   ; $06D968 |
  JSL player_hit_sprite                     ; $06D96A |
  PLA                                       ; $06D96E |
  ORA #$0400                                ; $06D96F |
  STA $0E                                   ; $06D972 |
  LDX $12                                   ; $06D974 |

CODE_06D976:
  LDA $6014                                 ; $06D976 |
  BEQ CODE_06D9A2                           ; $06D979 |
  LDX $12                                   ; $06D97B |
  LDY #$00                                  ; $06D97D |
  LDA !s_spr_x_pixel_pos,x                  ; $06D97F |
  CMP !s_spr_x_pixel_pos                    ; $06D982 |
  BMI CODE_06D989                           ; $06D985 |
  LDY #$02                                  ; $06D987 |

CODE_06D989:
  LDA $D912,y                               ; $06D989 |
  CLC                                       ; $06D98C |
  ADC !s_spr_x_speed_lo                     ; $06D98D |
  PHA                                       ; $06D990 |
  SEC                                       ; $06D991 |
  SBC $D916,y                               ; $06D992 |
  EOR $D912,y                               ; $06D995 |
  ASL A                                     ; $06D998 |
  PLA                                       ; $06D999 |
  BCS CODE_06D99F                           ; $06D99A |
  LDA $D916,y                               ; $06D99C |

CODE_06D99F:
  STA !s_spr_x_speed_lo                     ; $06D99F |

CODE_06D9A2:
  LDX $12                                   ; $06D9A2 |
  LDY !s_spr_collision_id,x                 ; $06D9A4 |
  DEY                                       ; $06D9A7 |
  BMI CODE_06D9BD                           ; $06D9A8 |
  LDA !s_spr_collision_state,y              ; $06D9AA |
  BEQ CODE_06D9BD                           ; $06D9AD |
  LDA $0E                                   ; $06D9AF |
  PHA                                       ; $06D9B1 |
  TYX                                       ; $06D9B2 |
  JSL $03B25B                               ; $06D9B3 |
  PLA                                       ; $06D9B7 |
  ORA #$0800                                ; $06D9B8 |
  STA $0E                                   ; $06D9BB |

CODE_06D9BD:
  LDX $12                                   ; $06D9BD |
  RTS                                       ; $06D9BF |

init_caged_ghost_sewer:
  LDA #$0000                                ; $06D9C0 |
  STA $6040                                 ; $06D9C3 |
  LDA #$0000                                ; $06D9C6 |
  STA $6042                                 ; $06D9C9 |
  RTL                                       ; $06D9CC |

main_caged_ghost_sewer:
  JSR CODE_06DA01                           ; $06D9CD |
  JSR CODE_06DBA5                           ; $06D9D0 |
  JSR CODE_06DC4D                           ; $06D9D3 |
  JSL $03AF23                               ; $06D9D6 |
  LDA !s_spr_cam_x_pos,x                    ; $06D9DA |
  CLC                                       ; $06D9DD |
  ADC #$0200                                ; $06D9DE |
  CMP #$0400                                ; $06D9E1 |
  BCS CODE_06D9F2                           ; $06D9E4 |
  LDA !s_spr_cam_y_pos,x                    ; $06D9E6 |
  CLC                                       ; $06D9E9 |
  ADC #$01A0                                ; $06D9EA |
  CMP #$0300                                ; $06D9ED |
  BCC CODE_06D9F8                           ; $06D9F0 |

CODE_06D9F2:
  JSL $03A31E                               ; $06D9F2 |
  BRA CODE_06D9FE                           ; $06D9F6 |

CODE_06D9F8:
  JSR CODE_06DC84                           ; $06D9F8 |
  JSR CODE_06DD53                           ; $06D9FB |

CODE_06D9FE:
  LDX $12                                   ; $06D9FE |
  RTL                                       ; $06DA00 |

; caged ghost sewer sub
CODE_06DA01:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06DA01 |
  XBA                                       ; $06DA03 |
  AND #$00FF                                ; $06DA04 |
  ASL A                                     ; $06DA07 |
  TAX                                       ; $06DA08 |
  LDA $DA55,x                               ; $06DA09 |
  STA $00                                   ; $06DA0C |
  LDA $DA57,x                               ; $06DA0E |
  STA $02                                   ; $06DA11 |
  LDY #$34                                  ; $06DA13 |

CODE_06DA15:
  TYA                                       ; $06DA15 |
  ASL A                                     ; $06DA16 |
  TAX                                       ; $06DA17 |
  LDA ($00),y                               ; $06DA18 |
  AND #$00FF                                ; $06DA1A |
  SEC                                       ; $06DA1D |
  SBC #$00E0                                ; $06DA1E |
  STA $7049F6,x                             ; $06DA21 |
  LDA ($02),y                               ; $06DA25 |
  AND #$00FF                                ; $06DA27 |
  SEC                                       ; $06DA2A |
  SBC #$00E0                                ; $06DA2B |
  STA $704B36,x                             ; $06DA2E |
  LDA ($00),y                               ; $06DA32 |
  AND #$FF00                                ; $06DA34 |
  XBA                                       ; $06DA37 |
  SEC                                       ; $06DA38 |
  SBC #$0050                                ; $06DA39 |
  STA $7049F8,x                             ; $06DA3C |
  LDA ($02),y                               ; $06DA40 |
  AND #$FF00                                ; $06DA42 |
  XBA                                       ; $06DA45 |
  SEC                                       ; $06DA46 |
  SBC #$0050                                ; $06DA47 |
  STA $704B38,x                             ; $06DA4A |
  DEY                                       ; $06DA4E |
  DEY                                       ; $06DA4F |
  BPL CODE_06DA15                           ; $06DA50 |
  LDX $12                                   ; $06DA52 |
  RTS                                       ; $06DA54 |

; caged ghost sewer data pointers
  dw $DA61                                  ; $06DA55 |
  dw $DA97                                  ; $06DA57 |
  dw $DACD                                  ; $06DA59 |
  dw $DB03                                  ; $06DA5B |
  dw $DB39                                  ; $06DA5D |
  dw $DB6F                                  ; $06DA5F |

; caged ghost sewer data
  dw $50E0, $5FE0, $5F80, $5F72             ; $06DA61 |
  dw $5D6E, $4152, $3F4E, $2F10             ; $06DA69 |
  dw $3F10, $3D08, $3802, $3301             ; $06DA71 |
  dw $2C01, $2702, $2208, $2010             ; $06DA79 |
  dw $2050, $205E, $2262, $3E7E             ; $06DA81 |
  dw $4082, $43E0, $47EF, $4CF7             ; $06DA89 |
  dw $56FF, $5BFF, $5FFC, $50E0             ; $06DA91 |
  dw $5FE0, $5F80, $5F72, $5D6E             ; $06DA99 |
  dw $4152, $3F50, $2F4F, $3F4F             ; $06DAA1 |
  dw $3D48, $3842, $3341, $2C41             ; $06DAA9 |
  dw $2742, $2248, $2050, $2050             ; $06DAB1 |
  dw $205E, $2262, $3E7E, $4082             ; $06DAB9 |
  dw $43E0, $47EF, $4CF7, $56FF             ; $06DAC1 |
  dw $5BFF, $5FFC, $50E0, $5FE0             ; $06DAC9 |
  dw $5F80, $5F72, $5D6E, $3E50             ; $06DAD1 |
  dw $3E50, $345B, $3E4F, $394C             ; $06DAD9 |
  dw $304B, $2B4D, $2553, $235D             ; $06DAE1 |
  dw $2462, $2868, $2868, $2868             ; $06DAE9 |
  dw $2868, $2868, $4082, $43E0             ; $06DAF1 |
  dw $47EF, $4CF7, $56FF, $5BFF             ; $06DAF9 |
  dw $5FFC, $50E0, $5FE0, $5F80             ; $06DB01 |
  dw $5F80, $5869, $5869, $5869             ; $06DB09 |
  dw $4C73, $5868, $5164, $4863             ; $06DB11 |
  dw $4365, $3D6B, $3B75, $3C7A             ; $06DB19 |
  dw $407F, $407F, $407F, $407F             ; $06DB21 |
  dw $407F, $4082, $43E0, $47EF             ; $06DB29 |
  dw $4CF7, $56FF, $5BFF, $5FFC             ; $06DB31 |
  dw $50E0, $5FE0, $5F80, $5F80             ; $06DB39 |
  dw $5F80, $5F80, $5F80, $4F7F             ; $06DB41 |
  dw $5F7F, $5D78, $5872, $5371             ; $06DB49 |
  dw $4C71, $4772, $4278, $4080             ; $06DB51 |
  dw $4080, $4080, $4080, $4080             ; $06DB59 |
  dw $4080, $43E0, $47EF, $4CF7             ; $06DB61 |
  dw $56FF, $5BFF, $5FFC, $50E0             ; $06DB69 |
  dw $60E0, $60E0, $60E0, $60E0             ; $06DB71 |
  dw $60E0, $60E0, $51E0, $60DF             ; $06DB79 |
  dw $5ED8, $59D2, $54D1, $4DD1             ; $06DB81 |
  dw $48D2, $43D8, $41E0, $41E0             ; $06DB89 |
  dw $41E0, $41E0, $41E0, $41E0             ; $06DB91 |
  dw $41E0, $48EF, $4DF7, $57FF             ; $06DB99 |
  dw $5CFF, $60FC                           ; $06DBA1 |

; caged ghost sewer sub
CODE_06DBA5:
  LDA !s_spr_wildcard_2_lo,x                ; $06DBA5 |
  STA $0E                                   ; $06DBA8 |
  LDA !s_spr_cam_x_pos,x                    ; $06DBAA |
  CMP #$0100                                ; $06DBAD |
  BCC CODE_06DBBA                           ; $06DBB0 |
  CMP #$FF00                                ; $06DBB2 |
  BCS CODE_06DBBA                           ; $06DBB5 |
  JMP CODE_06DC37                           ; $06DBB7 |

CODE_06DBBA:
  CLC                                       ; $06DBBA |
  ADC #$00E0                                ; $06DBBB |
  STA $6040                                 ; $06DBBE |
  LDA !s_spr_cam_y_pos,x                    ; $06DBC1 |
  CMP #$0200                                ; $06DBC4 |
  BCC CODE_06DBCE                           ; $06DBC7 |
  CMP #$FF00                                ; $06DBC9 |
  BCC CODE_06DC37                           ; $06DBCC |

CODE_06DBCE:
  CLC                                       ; $06DBCE |
  ADC #$0020                                ; $06DBCF |
  STA $6042                                 ; $06DBD2 |
  LDA #$49F6                                ; $06DBD5 |
  STA !gsu_r1                               ; $06DBD8 |
  LDA #$4B36                                ; $06DBDB |
  STA !gsu_r2                               ; $06DBDE |
  LDA #$001B                                ; $06DBE1 |
  STA !gsu_r3                               ; $06DBE4 |
  STZ !gsu_r4                               ; $06DBE7 |
  LDA #$449E                                ; $06DBEA |
  STA !gsu_r5                               ; $06DBED |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06DBF0 |
  AND #$00FF                                ; $06DBF2 |
  STA !gsu_r6                               ; $06DBF5 |
  LDA #$0000                                ; $06DBF8 |
  STA $605E                                 ; $06DBFB |
  LDX #$08                                  ; $06DBFE |
  LDA #$E8CA                                ; $06DC00 |
  JSL r_gsu_init_1                          ; $06DC03 |
  JSL $00BE39                               ; $06DC07 |

; DMA args
  dl $7E5040, $703372                       ; $06DC0B |
  dw $0348                                  ; $06DC11 |

  SEP #$30                                  ; $06DC13 |
  LDA #$13                                  ; $06DC15 |
  STA !r_reg_tm_mirror                      ; $06DC17 |
  LDA #$04                                  ; $06DC1A |
  STA !r_reg_ts_mirror                      ; $06DC1C |
  LDA #$22                                  ; $06DC1F |
  STA !r_reg_cgwsel_mirror                  ; $06DC21 |
  LDA #$63                                  ; $06DC24 |
  STA !r_reg_cgadsub_mirror                 ; $06DC26 |
  LDA #$18                                  ; $06DC29 |
  TSB !r_reg_hdmaen_mirror                  ; $06DC2B |
  REP #$20                                  ; $06DC2E |
  LDA #$0008                                ; $06DC30 |
  TSB $0E                                   ; $06DC33 |
  BRA CODE_06DC45                           ; $06DC35 |

CODE_06DC37:
  SEP #$20                                  ; $06DC37 |
  LDA #$04                                  ; $06DC39 |
  TRB !r_reg_ts_mirror                      ; $06DC3B |
  REP #$20                                  ; $06DC3E |
  LDA #$0008                                ; $06DC40 |
  TRB $0E                                   ; $06DC43 |

CODE_06DC45:
  LDX $12                                   ; $06DC45 |
  LDA $0E                                   ; $06DC47 |
  STA !s_spr_wildcard_2_lo,x                ; $06DC49 |
  RTS                                       ; $06DC4C |

; caged ghost sewer sub
CODE_06DC4D:
  STZ !s_spr_facing_dir,x                   ; $06DC4D |
  REP #$10                                  ; $06DC50 |
  LDY !s_spr_oam_pointer,x                  ; $06DC52 |
  LDX #$000C                                ; $06DC55 |

CODE_06DC58:
  LDA $6000,y                               ; $06DC58 |
  CLC                                       ; $06DC5B |
  ADC $7044BA                               ; $06DC5C |
  CLC                                       ; $06DC60 |
  ADC #$00DE                                ; $06DC61 |
  STA $6000,y                               ; $06DC64 |
  LDA $6002,y                               ; $06DC67 |
  CLC                                       ; $06DC6A |
  ADC $7044BC                               ; $06DC6B |
  CLC                                       ; $06DC6F |
  ADC #$0018                                ; $06DC70 |
  STA $6002,y                               ; $06DC73 |
  TYA                                       ; $06DC76 |
  CLC                                       ; $06DC77 |
  ADC #$0008                                ; $06DC78 |
  TAY                                       ; $06DC7B |
  DEX                                       ; $06DC7C |
  BNE CODE_06DC58                           ; $06DC7D |
  SEP #$10                                  ; $06DC7F |
  LDX $12                                   ; $06DC81 |
  RTS                                       ; $06DC83 |

; caged ghost sewer sub
CODE_06DC84:
  LDA !s_spr_wildcard_2_lo,x                ; $06DC84 |
  BIT #$0008                                ; $06DC87 |
  BNE CODE_06DC8F                           ; $06DC8A |
  JMP CODE_06DD48                           ; $06DC8C |

CODE_06DC8F:
  LDA !s_spr_wildcard_2_lo,x                ; $06DC8F |
  AND #$F7FF                                ; $06DC92 |
  STA !s_spr_wildcard_2_lo,x                ; $06DC95 |
  TXA                                       ; $06DC98 |
  STA $6012                                 ; $06DC99 |
  LDA !s_player_x_cam_rel                   ; $06DC9C |
  STA $6014                                 ; $06DC9F |
  LDA !s_player_y_cam_rel                   ; $06DCA2 |
  STA $6016                                 ; $06DCA5 |
  LDA !s_player_duck_state                  ; $06DCA8 |
  STA $6018                                 ; $06DCAB |
  LDX #$0A                                  ; $06DCAE |
  LDA #$8390                                ; $06DCB0 |
  JSL r_gsu_init_1                          ; $06DCB3 |
  LDX $12                                   ; $06DCB7 |
  LDA $601A                                 ; $06DCB9 |
  BEQ CODE_06DCF4                           ; $06DCBC |
  LDY #$00                                  ; $06DCBE |
  LDA !s_spr_x_pixel_pos,x                  ; $06DCC0 |
  CLC                                       ; $06DCC3 |
  ADC #$00E0                                ; $06DCC4 |
  ASL A                                     ; $06DCC7 |
  CLC                                       ; $06DCC8 |
  ADC $7044BA                               ; $06DCC9 |
  LSR A                                     ; $06DCCD |
  CMP !s_player_x                           ; $06DCCE |
  BMI CODE_06DCD5                           ; $06DCD1 |
  LDY #$02                                  ; $06DCD3 |

CODE_06DCD5:
  LDA $DD4B,y                               ; $06DCD5 |
  CLC                                       ; $06DCD8 |
  ADC !s_player_x_speed                     ; $06DCD9 |
  PHA                                       ; $06DCDC |
  SEC                                       ; $06DCDD |
  SBC $DD4F,y                               ; $06DCDE |
  EOR $DD4B,y                               ; $06DCE1 |
  ASL A                                     ; $06DCE4 |
  PLA                                       ; $06DCE5 |
  BCS CODE_06DCEB                           ; $06DCE6 |
  LDA $DD4F,y                               ; $06DCE8 |

CODE_06DCEB:
  STA !s_player_x_speed                     ; $06DCEB |
  LDX $12                                   ; $06DCEE |
  JSL player_hit_sprite                     ; $06DCF0 |

CODE_06DCF4:
  LDA $6014                                 ; $06DCF4 |
  BEQ CODE_06DD2B                           ; $06DCF7 |
  LDX $12                                   ; $06DCF9 |
  LDY #$00                                  ; $06DCFB |
  LDA !s_spr_x_pixel_pos,x                  ; $06DCFD |
  CLC                                       ; $06DD00 |
  ADC #$00E0                                ; $06DD01 |
  ASL A                                     ; $06DD04 |
  CLC                                       ; $06DD05 |
  ADC $7044BA                               ; $06DD06 |
  LSR A                                     ; $06DD0A |
  CMP !s_spr_x_pixel_pos                    ; $06DD0B |
  BMI CODE_06DD12                           ; $06DD0E |
  LDY #$02                                  ; $06DD10 |

CODE_06DD12:
  LDA $DD4B,y                               ; $06DD12 |
  CLC                                       ; $06DD15 |
  ADC !s_spr_x_speed_lo                     ; $06DD16 |
  PHA                                       ; $06DD19 |
  SEC                                       ; $06DD1A |
  SBC $DD4F,y                               ; $06DD1B |
  EOR $DD4B,y                               ; $06DD1E |
  ASL A                                     ; $06DD21 |
  PLA                                       ; $06DD22 |
  BCS CODE_06DD28                           ; $06DD23 |
  LDA $DD4F,y                               ; $06DD25 |

CODE_06DD28:
  STA !s_spr_x_speed_lo                     ; $06DD28 |

CODE_06DD2B:
  LDX $12                                   ; $06DD2B |
  LDY !s_spr_collision_id,x                 ; $06DD2D |
  DEY                                       ; $06DD30 |
  BMI CODE_06DD48                           ; $06DD31 |
  LDA !s_spr_collision_state,y              ; $06DD33 |
  BEQ CODE_06DD48                           ; $06DD36 |
  TYX                                       ; $06DD38 |
  JSL $03B24B                               ; $06DD39 |
  LDX $12                                   ; $06DD3D |
  LDA !s_spr_wildcard_2_lo,x                ; $06DD3F |
  ORA #$0800                                ; $06DD42 |
  STA !s_spr_wildcard_2_lo,x                ; $06DD45 |

CODE_06DD48:
  LDX $12                                   ; $06DD48 |
  RTS                                       ; $06DD4A |

  dw $0100, $FF00                           ; $06DD4B |

  dw $0200, $FE00                           ; $06DD4F |

; caged ghost sewer sub
CODE_06DD53:
  LDA !s_spr_wildcard_2_lo,x                ; $06DD53 |
  STA $0E                                   ; $06DD56 |
  BIT #$0800                                ; $06DD58 |
  BEQ CODE_06DD74                           ; $06DD5B |
  LDA #$0010                                ; $06DD5D |
  STA !s_spr_timer_1,x                      ; $06DD60 |
  LDA $0E                                   ; $06DD63 |
  AND #$FFF8                                ; $06DD65 |
  ORA #$0401                                ; $06DD68 |
  STA $0E                                   ; $06DD6B |
  LDA #$0079                                ; $06DD6D |
  JSL push_sound_queue                      ; $06DD70 |

CODE_06DD74:
  AND #$0007                                ; $06DD74 |
  ASL A                                     ; $06DD77 |
  TAY                                       ; $06DD78 |
  LDA $DD98,y                               ; $06DD79 |
  STA $00                                   ; $06DD7C |
  PER $0002                                 ; $06DD7E |
  JMP ($7960)                               ; $06DD81 | sub
  LDA $0E                                   ; $06DD84 |
  AND #$7FFF                                ; $06DD86 |
  BIT #$4000                                ; $06DD89 |
  BEQ CODE_06DD94                           ; $06DD8C |
  AND #$BFFF                                ; $06DD8E |
  ORA #$8000                                ; $06DD91 |

CODE_06DD94:
  STA !s_spr_wildcard_2_lo,x                ; $06DD94 |
  RTS                                       ; $06DD97 |

; caged ghost sewer routine table
  dw $DDA2                                  ; $06DD98 |
  dw $DE59                                  ; $06DD9A |
  dw $DE9F                                  ; $06DD9C |
  dw $DF02                                  ; $06DD9E |
  dw $DFB2                                  ; $06DDA0 |

; caged ghost sewer sub
  LDA !s_spr_timer_4,x                      ; $06DDA2 |
  BEQ CODE_06DDA8                           ; $06DDA5 |
  RTS                                       ; $06DDA7 |

CODE_06DDA8:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06DDA8 |
  BEQ CODE_06DDCE                           ; $06DDAA |
  JSL random_number_gen                     ; $06DDAC |
  LDA $10                                   ; $06DDB0 |
  BIT #$001F                                ; $06DDB2 |
  BNE CODE_06DDCE                           ; $06DDB5 |
  AND #$0001                                ; $06DDB7 |
  CLC                                       ; $06DDBA |
  ADC #$001C                                ; $06DDBB |
  STA !s_spr_timer_1,x                      ; $06DDBE |
  LDA $0E                                   ; $06DDC1 |
  AND #$FFF8                                ; $06DDC3 |
  ORA #$0002                                ; $06DDC6 |
  STA $0E                                   ; $06DDC9 |
  JMP CODE_06DE9F                           ; $06DDCB |

CODE_06DDCE:
  LDA !s_spr_timer_2,x                      ; $06DDCE |
  BNE CODE_06DE29                           ; $06DDD1 |
  LDA #$00F3                                ; $06DDD3 |
  STA !gsu_r4                               ; $06DDD6 |
  INC A                                     ; $06DDD9 |
  STA !gsu_r5                               ; $06DDDA |
  LDX #$09                                  ; $06DDDD |
  LDA #$91DB                                ; $06DDDF |
  JSL r_gsu_init_1                          ; $06DDE2 |
  LDX $12                                   ; $06DDE6 |
  LDA !gsu_r6                               ; $06DDE8 |
  CMP #$0003                                ; $06DDEB |
  BCS CODE_06DE29                           ; $06DDEE |
  STA $00                                   ; $06DDF0 |
  LDX #$09                                  ; $06DDF2 |
  LDA #$91D5                                ; $06DDF4 |
  JSL r_gsu_init_1                          ; $06DDF7 |
  LDX $12                                   ; $06DDFB |
  LDA !gsu_r6                               ; $06DDFD |
  CLC                                       ; $06DE00 |
  ADC $00                                   ; $06DE01 |
  CMP #$0006                                ; $06DE03 |
  BCS CODE_06DE2B                           ; $06DE06 |
  PHA                                       ; $06DE08 |
  LDA $0E                                   ; $06DE09 |
  AND #$FFF8                                ; $06DE0B |
  ORA #$8003                                ; $06DE0E |
  STA $0E                                   ; $06DE11 |
  PLA                                       ; $06DE13 |
  LDY #$00                                  ; $06DE14 |
  CMP #$0005                                ; $06DE16 |
  BCC CODE_06DE1D                           ; $06DE19 |
  LDY #$02                                  ; $06DE1B |

CODE_06DE1D:
  LDA $DE25,y                               ; $06DE1D |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06DE20 |
  JMP CODE_06DF02                           ; $06DE22 |

  dw $0002, $0001                           ; $06DE25 |

CODE_06DE29:
  LDX $12                                   ; $06DE29 |

CODE_06DE2B:
  LDA $0E                                   ; $06DE2B |
  BPL CODE_06DE34                           ; $06DE2D |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $06DE2F |
  STZ !s_spr_timer_1,x                      ; $06DE31 |

CODE_06DE34:
  LDA !s_spr_timer_1,x                      ; $06DE34 |
  BNE CODE_06DE53                           ; $06DE37 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06DE39 |
  BNE CODE_06DE42                           ; $06DE3B |
  LDA #$0006                                ; $06DE3D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06DE40 |

CODE_06DE42:
  TAY                                       ; $06DE42 |
  LDA $DFF3,y                               ; $06DE43 |
  STA !s_spr_anim_frame,x                   ; $06DE46 |
  LDA $DFFB,y                               ; $06DE49 |
  STA !s_spr_timer_1,x                      ; $06DE4C |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06DE4F |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06DE51 |

CODE_06DE53:
  RTS                                       ; $06DE53 |

  db $0C, $30, $18, $30                     ; $06DE54 |
  db $0C                                    ; $06DE58 |

; caged ghost sewer sub
  LDA #$000E                                ; $06DE59 |
  STA !s_spr_anim_frame,x                   ; $06DE5C |
  LDA !s_spr_timer_1,x                      ; $06DE5F |
  BNE CODE_06DE7A                           ; $06DE62 |
  LDA #$0407                                ; $06DE64 |
  TRB $0E                                   ; $06DE67 |
  LDA #$0020                                ; $06DE69 |
  STA !s_spr_timer_4,x                      ; $06DE6C |
  LDA #$0180                                ; $06DE6F |
  STA !s_spr_timer_2,x                      ; $06DE72 |
  STZ !s_spr_timer_1,x                      ; $06DE75 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $06DE78 |

CODE_06DE7A:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06DE7A |
  XBA                                       ; $06DE7C |
  AND #$00FF                                ; $06DE7D |
  TAY                                       ; $06DE80 |
  LDA $DE54,y                               ; $06DE81 |
  AND #$00FF                                ; $06DE84 |
  CLC                                       ; $06DE87 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06DE88 |
  CMP #$0500                                ; $06DE8A |
  BCC CODE_06DE9C                           ; $06DE8D |
  LDA $0E                                   ; $06DE8F |
  AND #$FFF8                                ; $06DE91 |
  ORA #$4004                                ; $06DE94 |
  STA $0E                                   ; $06DE97 |
  LDA #$04FF                                ; $06DE99 |

CODE_06DE9C:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06DE9C |
  RTS                                       ; $06DE9E |

; caged ghost sewer sub
CODE_06DE9F:
  LDA !s_spr_timer_1,x                      ; $06DE9F |
  BNE CODE_06DEAE                           ; $06DEA2 |
  LDA $0E                                   ; $06DEA4 |
  AND #$FFF8                                ; $06DEA6 |
  ORA #$4000                                ; $06DEA9 |
  STA $0E                                   ; $06DEAC |

CODE_06DEAE:
  LDA #$0005                                ; $06DEAE |
  STA !s_spr_anim_frame,x                   ; $06DEB1 |
  LDA #$00C0                                ; $06DEB4 |
  STA !r_apu_io_1_mirror                    ; $06DEB7 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06DEBA |
  XBA                                       ; $06DEBC |
  AND #$00FF                                ; $06DEBD |
  ASL A                                     ; $06DEC0 |
  TAY                                       ; $06DEC1 |
  LDA $DEDA,y                               ; $06DEC2 |
  CLC                                       ; $06DEC5 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06DEC6 |
  BPL CODE_06DED7                           ; $06DEC8 |
  LDA $0E                                   ; $06DECA |
  AND #$FFF8                                ; $06DECC |
  ORA #$4000                                ; $06DECF |
  STA $0E                                   ; $06DED2 |
  LDA #$0000                                ; $06DED4 |

CODE_06DED7:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06DED7 |
  RTS                                       ; $06DED9 |

  dw $FFFE, $FFF8                           ; $06DEDA |
  dw $FFFC, $FFF8                           ; $06DEDE |
  dw $FFFE                                  ; $06DEE2 |

  db $07, $06, $05, $04                     ; $06DEE4 |
  db $03, $02, $0A, $0B                     ; $06DEE8 |
  db $0A, $01, $02, $03                     ; $06DEEC |
  db $04, $05, $06, $01                     ; $06DEF0 |
  db $01, $01, $01, $01                     ; $06DEF4 |
  db $01, $02, $0A, $02                     ; $06DEF8 |
  db $01, $01, $01, $01                     ; $06DEFC |
  db $01, $01                               ; $06DF00 |

; caged ghost sewer sub
CODE_06DF02:
  LDA $0E                                   ; $06DF02 |
  BPL CODE_06DF0B                           ; $06DF04 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $06DF06 |
  STZ !s_spr_timer_1,x                      ; $06DF08 |

CODE_06DF0B:
  LDA !s_spr_timer_1,x                      ; $06DF0B |
  BEQ CODE_06DF13                           ; $06DF0E |
  JMP CODE_06DFB1                           ; $06DF10 |

CODE_06DF13:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $06DF13 |
  CPY #$0F                                  ; $06DF15 |
  BCC CODE_06DF37                           ; $06DF17 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $06DF19 |
  BEQ CODE_06DF25                           ; $06DF1B |
  LDA #$4000                                ; $06DF1D |
  TSB $0E                                   ; $06DF20 |
  JMP CODE_06DFB1                           ; $06DF22 |

CODE_06DF25:
  LDA #$0060                                ; $06DF25 |
  STA !s_spr_timer_2,x                      ; $06DF28 |
  LDA $0E                                   ; $06DF2B |
  AND #$BFF8                                ; $06DF2D |
  ORA #$4000                                ; $06DF30 |
  STA $0E                                   ; $06DF33 |
  BRA CODE_06DFB1                           ; $06DF35 |

CODE_06DF37:
  LDA $DEF3,y                               ; $06DF37 |
  AND #$00FF                                ; $06DF3A |
  STA !s_spr_timer_1,x                      ; $06DF3D |
  CPY #$0E                                  ; $06DF40 |
  BNE CODE_06DF55                           ; $06DF42 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06DF44 |
  CMP #$0001                                ; $06DF46 |
  BEQ CODE_06DF55                           ; $06DF49 |
  LDA !s_spr_timer_1,x                      ; $06DF4B |
  CLC                                       ; $06DF4E |
  ADC #$0040                                ; $06DF4F |
  STA !s_spr_timer_1,x                      ; $06DF52 |

CODE_06DF55:
  LDA $DEE4,y                               ; $06DF55 |
  AND #$00FF                                ; $06DF58 |
  STA !s_spr_anim_frame,x                   ; $06DF5B |
  CPY #$07                                  ; $06DF5E |
  BNE CODE_06DFAF                           ; $06DF60 |
  LDA #$0077                                ; $06DF62 |
  JSL push_sound_queue                      ; $06DF65 |
  LDA #$00F3                                ; $06DF69 |
  JSL spawn_sprite_init                     ; $06DF6C |
  LDA !s_spr_x_pixel_pos,x                  ; $06DF70 |
  CLC                                       ; $06DF73 |
  ADC $7044BA                               ; $06DF74 |
  CLC                                       ; $06DF78 |
  ADC #$00CC                                ; $06DF79 |
  STA !s_spr_x_pixel_pos,y                  ; $06DF7C |
  LDA !s_spr_y_pixel_pos,x                  ; $06DF7F |
  CLC                                       ; $06DF82 |
  ADC $7044BC                               ; $06DF83 |
  CLC                                       ; $06DF87 |
  ADC #$001E                                ; $06DF88 |
  STA !s_spr_y_pixel_pos,y                  ; $06DF8B |
  LDA #$FE00                                ; $06DF8E |
  STA !s_spr_x_speed_lo,y                   ; $06DF91 |
  LDA #$FD80                                ; $06DF94 |
  STA !s_spr_y_speed_lo,y                   ; $06DF97 |
  SEP #$20                                  ; $06DF9A |
  LDA #$01                                  ; $06DF9C |
  STA !s_spr_wildcard_1_lo,y                ; $06DF9E |
  LDX #$04                                  ; $06DFA1 |
  STX !s_spr_wildcard_5_lo_dp,y             ; $06DFA3 |
  REP #$20                                  ; $06DFA5 |
  LDA #$0000                                ; $06DFA7 |
  STA !s_spr_facing_dir,y                   ; $06DFAA |
  LDX $12                                   ; $06DFAD |

CODE_06DFAF:
  INC !s_spr_wildcard_5_lo_dp,x             ; $06DFAF |

CODE_06DFB1:
  RTS                                       ; $06DFB1 |

; caged ghost sewer sub
  LDA $0E                                   ; $06DFB2 |
  BPL CODE_06DFBB                           ; $06DFB4 |
  STZ !s_spr_timer_1,x                      ; $06DFB6 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $06DFB9 |

CODE_06DFBB:
  LDA !s_spr_timer_1,x                      ; $06DFBB |
  BNE CODE_06DFF2                           ; $06DFBE |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06DFC0 |
  BNE CODE_06DFC9                           ; $06DFC2 |
  LDA #$0012                                ; $06DFC4 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06DFC7 |

CODE_06DFC9:
  TAY                                       ; $06DFC9 |
  LDA $E017,y                               ; $06DFCA |
  STA !s_spr_timer_1,x                      ; $06DFCD |
  LDA $E003,y                               ; $06DFD0 |
  STA !s_spr_anim_frame,x                   ; $06DFD3 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06DFD6 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06DFD8 |
  BNE CODE_06DFF2                           ; $06DFDA |
  LDA $0E                                   ; $06DFDC |
  AND #$FFF8                                ; $06DFDE |
  ORA #$4000                                ; $06DFE1 |
  STA $0E                                   ; $06DFE4 |
  LDA #$0100                                ; $06DFE6 |
  STA !s_spr_timer_4,x                      ; $06DFE9 |
  LDA #$0180                                ; $06DFEC |
  STA !s_spr_timer_2,x                      ; $06DFEF |

CODE_06DFF2:
  RTS                                       ; $06DFF2 |

  dw $0008, $0009                           ; $06DFF3 |
  dw $0008, $0007                           ; $06DFF7 |

  dw $0004, $0008                           ; $06DFFB |
  dw $0004, $000A                           ; $06DFFF |

  dw $000F, $0010                           ; $06E003 |
  dw $0011, $0010                           ; $06E007 |
  dw $000F, $000F                           ; $06E00B |
  dw $0010, $0011                           ; $06E00F |
  dw $0010, $000F                           ; $06E013 |
  dw $000A, $0002                           ; $06E017 |
  dw $0014, $0002                           ; $06E01B |
  dw $000A, $000A                           ; $06E01F |
  dw $0002, $0014                           ; $06E023 |
  dw $0002, $000A                           ; $06E027 |

init_caged_ghost_round:
  LDA #$0020                                ; $06E02B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E02E |
  LDA #$0118                                ; $06E030 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E033 |
  LDA #$0003                                ; $06E035 |
  STA !s_spr_wildcard_2_lo,x                ; $06E038 |
  LDA #$0008                                ; $06E03B |
  STA !s_spr_timer_1,x                      ; $06E03E |
  LDA #$0008                                ; $06E041 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06E044 |
  RTL                                       ; $06E046 |

main_caged_ghost_round:
  LDA !s_spr_wildcard_2_lo,x                ; $06E047 |
  STA $0E                                   ; $06E04A |
  LDA #$0000                                ; $06E04C |
  STA $0C                                   ; $06E04F |
  JSR CODE_06E42F                           ; $06E051 |
  JSR CODE_06E48B                           ; $06E054 |
  JSR CODE_06E0A5                           ; $06E057 |
  LDA $0E                                   ; $06E05A |
  STA !s_spr_wildcard_2_lo,x                ; $06E05C |
  JSL $03AF23                               ; $06E05F |
  LDA !s_spr_wildcard_2_lo,x                ; $06E063 |
  STA $0E                                   ; $06E066 |
  LDA !s_spr_cam_x_pos,x                    ; $06E068 |
  CLC                                       ; $06E06B |
  ADC #$0090                                ; $06E06C |
  CMP #$0220                                ; $06E06F |
  BCS CODE_06E080                           ; $06E072 |
  LDA !s_spr_cam_y_pos,x                    ; $06E074 |
  CLC                                       ; $06E077 |
  ADC #$0100                                ; $06E078 |
  CMP #$0300                                ; $06E07B |
  BCC CODE_06E086                           ; $06E07E |

CODE_06E080:
  JSL $03A31E                               ; $06E080 |
  BRA CODE_06E093                           ; $06E084 |

CODE_06E086:
  LDA $0E                                   ; $06E086 |
  BIT #$0400                                ; $06E088 |
  BEQ CODE_06E090                           ; $06E08B |
  JSR CODE_06D91A                           ; $06E08D |

CODE_06E090:
  JSR CODE_06E123                           ; $06E090 |

CODE_06E093:
  LDX $12                                   ; $06E093 |
  LDA $0E                                   ; $06E095 |
  STA !s_spr_wildcard_2_lo,x                ; $06E097 |
  RTL                                       ; $06E09A |

  dw $0078                                  ; $06E09B |
  dw $0000                                  ; $06E09D |
  dw $0078                                  ; $06E09F |
  dw $0028                                  ; $06E0A1 |
  dw $0078                                  ; $06E0A3 |

; caged_ghost_round sub
CODE_06E0A5:
  LDA !s_spr_anim_frame,x                   ; $06E0A5 |
  CMP #$0015                                ; $06E0A8 |
  BCS CODE_06E102                           ; $06E0AB |
  LDA $0E                                   ; $06E0AD |
  AND #$000F                                ; $06E0AF |
  ASL A                                     ; $06E0B2 |
  TAY                                       ; $06E0B3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E0B4 |
  CMP $E09B,y                               ; $06E0B6 |
  BCC CODE_06E102                           ; $06E0B9 |
  CPY #$02                                  ; $06E0BB |
  BNE CODE_06E0C6                           ; $06E0BD |
  LDA $0E                                   ; $06E0BF |
  BIT #$0200                                ; $06E0C1 |
  BEQ CODE_06E102                           ; $06E0C4 |

CODE_06E0C6:
  REP #$10                                  ; $06E0C6 |
  LDA #$FFF8                                ; $06E0C8 |
  STA $00                                   ; $06E0CB |
  LDA $7044C8                               ; $06E0CD |
  CLC                                       ; $06E0D1 |
  ADC #$0010                                ; $06E0D2 |
  STA $02                                   ; $06E0D5 |
  LDY !s_spr_oam_pointer,x                  ; $06E0D7 |
  LDX #$000C                                ; $06E0DA |

CODE_06E0DD:
  LDA $6000,y                               ; $06E0DD |
  CLC                                       ; $06E0E0 |
  ADC $00                                   ; $06E0E1 |
  STA $6000,y                               ; $06E0E3 |
  LDA $6002,y                               ; $06E0E6 |
  CLC                                       ; $06E0E9 |
  ADC $02                                   ; $06E0EA |
  STA $6002,y                               ; $06E0EC |
  TYA                                       ; $06E0EF |
  CLC                                       ; $06E0F0 |
  ADC #$0008                                ; $06E0F1 |
  TAY                                       ; $06E0F4 |
  DEX                                       ; $06E0F5 |
  BNE CODE_06E0DD                           ; $06E0F6 |
  SEP #$10                                  ; $06E0F8 |
  LDA #$0200                                ; $06E0FA |
  TSB $0E                                   ; $06E0FD |
  LDX $12                                   ; $06E0FF |
  RTS                                       ; $06E101 |

CODE_06E102:
  REP #$10                                  ; $06E102 |
  LDY !s_spr_oam_pointer,x                  ; $06E104 |
  LDX #$000C                                ; $06E107 |

CODE_06E10A:
  LDA #$00E8                                ; $06E10A |
  STA $6002,y                               ; $06E10D |
  TYA                                       ; $06E110 |
  CLC                                       ; $06E111 |
  ADC #$0008                                ; $06E112 |
  TAY                                       ; $06E115 |
  DEX                                       ; $06E116 |
  BNE CODE_06E10A                           ; $06E117 |
  SEP #$10                                  ; $06E119 |
  LDA #$0200                                ; $06E11B |
  TRB $0E                                   ; $06E11E |
  LDX $12                                   ; $06E120 |
  RTS                                       ; $06E122 |

; caged_ghost_round sub
CODE_06E123:
  JSR CODE_06E147                           ; $06E123 |
  LDA $0E                                   ; $06E126 |
  AND #$000F                                ; $06E128 |
  ASL A                                     ; $06E12B |
  TAY                                       ; $06E12C |
  LDA $E13B,y                               ; $06E12D | caged_ghost_round_ptr table
  STA $00                                   ; $06E130 | assumes $7960 is DP
  PER $0002                                 ; $06E132 |
  JMP ($7960)                               ; $06E135 | caged_ghost_round_ptr jump

; returned back to after caged_ghost_round_ptr sub
  LDX $12                                   ; $06E138 |
  RTS                                       ; $06E13A |

caged_ghost_round_ptr:
  dw $E195                                  ; $06E13B |
  dw $E225                                  ; $06E13D |
  dw $E258                                  ; $06E13F |
  dw $E274                                  ; $06E141 |
  dw $E2A2                                  ; $06E143 |

; table
  db $00, $02                               ; $06E145 |

; caged_ghost_round sub
CODE_06E147:
  LDY #$01                                  ; $06E147 |
  LDA !s_player_x                           ; $06E149 |
  SEC                                       ; $06E14C |
  SBC !s_spr_x_pixel_pos,x                  ; $06E14D |
  BPL CODE_06E154                           ; $06E150 |
  LDY #$00                                  ; $06E152 |

CODE_06E154:
  LDA $E145,y                               ; $06E154 |
  AND #$00FF                                ; $06E157 |
  STA !s_spr_facing_dir,x                   ; $06E15A |
  LDA $0E                                   ; $06E15D |
  BIT #$0800                                ; $06E15F |
  BEQ CODE_06E194                           ; $06E162 |
  LDA #$0079                                ; $06E164 |
  JSL push_sound_queue                      ; $06E167 |
  LDA $0E                                   ; $06E16B |
  AND #$000F                                ; $06E16D |
  CMP #$0001                                ; $06E170 |
  BEQ CODE_06E194                           ; $06E173 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E175 |
  SEC                                       ; $06E177 |
  SBC #$0020                                ; $06E178 |
  CMP #$0030                                ; $06E17B |
  BCS CODE_06E183                           ; $06E17E |
  LDA #$0030                                ; $06E180 |

CODE_06E183:
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E183 |
  LDA #$0008                                ; $06E185 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06E188 |
  LDA $0E                                   ; $06E18A |
  AND #$F7F0                                ; $06E18C |
  ORA #$8001                                ; $06E18F |
  STA $0E                                   ; $06E192 |

CODE_06E194:
  RTS                                       ; $06E194 |

; caged_ghost_round_ptr sub
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E195 |
  CMP #$0118                                ; $06E197 |
  BCS CODE_06E1CD                           ; $06E19A |
  LDA !s_spr_timer_1,x                      ; $06E19C |
  BEQ CODE_06E1A2                           ; $06E19F |
  RTS                                       ; $06E1A1 |

CODE_06E1A2:
  JSL random_number_gen                     ; $06E1A2 |
  LDA $10                                   ; $06E1A6 |
  BIT #$F800                                ; $06E1A8 |
  BNE CODE_06E1CD                           ; $06E1AB |
  AND #$0003                                ; $06E1AD |
  ASL A                                     ; $06E1B0 |
  ASL A                                     ; $06E1B1 |
  CLC                                       ; $06E1B2 |
  ADC #$0004                                ; $06E1B3 |
  CLC                                       ; $06E1B6 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06E1B7 |
  CMP #$0118                                ; $06E1B9 |
  BCC CODE_06E1C1                           ; $06E1BC |
  LDA #$0118                                ; $06E1BE |

CODE_06E1C1:
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E1C1 |
  LDA $0E                                   ; $06E1C3 |
  AND #$FFF0                                ; $06E1C5 |
  ORA #$8002                                ; $06E1C8 |
  STA $0E                                   ; $06E1CB |

CODE_06E1CD:
  LDA !s_spr_timer_4,x                      ; $06E1CD |
  BNE CODE_06E21F                           ; $06E1D0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E1D2 |
  CMP #$0078                                ; $06E1D4 |
  BCC CODE_06E21F                           ; $06E1D7 |
  LDA #$001E                                ; $06E1D9 |
  STA !gsu_r4                               ; $06E1DC |
  INC A                                     ; $06E1DF |
  STA !gsu_r5                               ; $06E1E0 |
  LDX #$09                                  ; $06E1E3 |
  LDA #$91DB                                ; $06E1E5 |
  JSL r_gsu_init_1                          ; $06E1E8 | sfx
  LDA !gsu_r6                               ; $06E1EC |
  CMP #$0003                                ; $06E1EF |
  BCS CODE_06E21F                           ; $06E1F2 |
  STA $00                                   ; $06E1F4 |
  LDX #$09                                  ; $06E1F6 |
  LDA #$91D5                                ; $06E1F8 |
  JSL r_gsu_init_1                          ; $06E1FB | sfx
  LDA !gsu_r6                               ; $06E1FF |
  CLC                                       ; $06E202 |
  ADC $00                                   ; $06E203 |
  CMP #$0006                                ; $06E205 |
  BCS CODE_06E21F                           ; $06E208 |
  JSL random_number_gen                     ; $06E20A |
  LDA $10                                   ; $06E20E |
  BIT #$0007                                ; $06E210 |
  BNE CODE_06E21F                           ; $06E213 |
  LDA $0E                                   ; $06E215 |
  AND #$FFF0                                ; $06E217 |
  ORA #$8004                                ; $06E21A |
  STA $0E                                   ; $06E21D |

CODE_06E21F:
  LDX $12                                   ; $06E21F |
  JSR CODE_06E321                           ; $06E221 |
  RTS                                       ; $06E224 |

; caged_ghost_round_ptr sub
  JSR CODE_06E321                           ; $06E225 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06E228 |
  SEC                                       ; $06E22A |
  SBC #$0001                                ; $06E22B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06E22E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E230 |
  CLC                                       ; $06E232 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $06E233 |
  CMP !s_spr_wildcard_5_lo_dp,x             ; $06E235 |
  BCS CODE_06E255                           ; $06E237 |
  CMP #$0030                                ; $06E239 |
  BCS CODE_06E243                           ; $06E23C |
  LDA #$0180                                ; $06E23E |
  BRA CODE_06E246                           ; $06E241 |

CODE_06E243:
  LDA #$0080                                ; $06E243 |

CODE_06E246:
  STA !s_spr_timer_1,x                      ; $06E246 |
  LDA $0E                                   ; $06E249 |
  AND #$FFF0                                ; $06E24B |
  ORA #$8000                                ; $06E24E |
  STA $0E                                   ; $06E251 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E253 |

CODE_06E255:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E255 |
  RTS                                       ; $06E257 |

; caged_ghost_round_ptr sub
  JSR CODE_06E321                           ; $06E258 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E25B |
  CLC                                       ; $06E25D |
  ADC #$0002                                ; $06E25E |
  CMP !s_spr_wildcard_5_lo_dp,x             ; $06E261 |
  BCC CODE_06E271                           ; $06E263 |
  LDA $0E                                   ; $06E265 |
  AND #$FFF0                                ; $06E267 |
  ORA #$8000                                ; $06E26A |
  STA $0E                                   ; $06E26D |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E26F |

CODE_06E271:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E271 |
  RTS                                       ; $06E273 |

; caged_ghost_round_ptr sub
  LDA !s_spr_timer_1,x                      ; $06E274 |
  BNE CODE_06E299                           ; $06E277 |
  JSR CODE_06E321                           ; $06E279 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E27C |
  SEC                                       ; $06E27E |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $06E27F |
  BCC CODE_06E28B                           ; $06E281 |
  LSR A                                     ; $06E283 |
  LSR A                                     ; $06E284 |
  BEQ CODE_06E28B                           ; $06E285 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $06E287 |
  BRA CODE_06E297                           ; $06E289 |

CODE_06E28B:
  LDA $0E                                   ; $06E28B |
  AND #$FFF0                                ; $06E28D |
  ORA #$8000                                ; $06E290 |
  STA $0E                                   ; $06E293 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E295 |

CODE_06E297:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E297 |

CODE_06E299:
  RTS                                       ; $06E299 |

; table
  dw $FFDE                                  ; $06E29A |
  dw $0012                                  ; $06E29C |
  dw $FE00                                  ; $06E29E |
  dw $0200                                  ; $06E2A0 |

; caged_ghost_round_ptr sub
  LDA !s_spr_timer_2,x                      ; $06E2A2 |
  BNE CODE_06E31D                           ; $06E2A5 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06E2A7 |
  BNE CODE_06E2B7                           ; $06E2A9 |
  LDA $0E                                   ; $06E2AB |
  AND #$FFF0                                ; $06E2AD |
  ORA #$8000                                ; $06E2B0 |
  STA $0E                                   ; $06E2B3 |
  BRA CODE_06E31D                           ; $06E2B5 |

CODE_06E2B7:
  CMP #$0008                                ; $06E2B7 |
  BNE CODE_06E31D                           ; $06E2BA |
  LDA #$0077                                ; $06E2BC |
  JSL push_sound_queue                      ; $06E2BF |
  LDA #$001E                                ; $06E2C3 |
  JSL spawn_sprite_active                   ; $06E2C6 |
  BCC CODE_06E31D                           ; $06E2CA |
  LDA $7044C8                               ; $06E2CC |
  CLC                                       ; $06E2D0 |
  ADC !s_spr_y_pixel_pos,x                  ; $06E2D1 |
  CLC                                       ; $06E2D4 |
  ADC #$0010                                ; $06E2D5 |
  STA !s_spr_y_pixel_pos,y                  ; $06E2D8 |
  LDA !s_spr_x_pixel_pos,x                  ; $06E2DB |
  SEC                                       ; $06E2DE |
  SBC #$0008                                ; $06E2DF |
  STA $00                                   ; $06E2E2 |
  LDA !s_spr_facing_dir,x                   ; $06E2E4 |
  AND #$0002                                ; $06E2E7 |
  STA !s_spr_facing_dir,y                   ; $06E2EA |
  TAX                                       ; $06E2ED |
  LDA $E29A,x                               ; $06E2EE |
  CLC                                       ; $06E2F1 |
  ADC $00                                   ; $06E2F2 |
  STA !s_spr_x_pixel_pos,y                  ; $06E2F4 |
  LDA $E29E,x                               ; $06E2F7 |
  STA !s_spr_x_speed_lo,y                   ; $06E2FA |
  LDA #$FD80                                ; $06E2FD |
  STA !s_spr_y_speed_lo,y                   ; $06E300 |
  LDA #$0018                                ; $06E303 |
  STA !s_spr_timer_1,y                      ; $06E306 |
  LDA #$0004                                ; $06E309 |
  STA !s_spr_wildcard_3_lo,y                ; $06E30C |
  LDA #$0001                                ; $06E30F |
  STA !s_spr_wildcard_2_lo,y                ; $06E312 |
  LDX $12                                   ; $06E315 |
  LDA #$0048                                ; $06E317 |
  STA !s_spr_timer_4,x                      ; $06E31A |

CODE_06E31D:
  JSR CODE_06E321                           ; $06E31D |
  RTS                                       ; $06E320 |

; caged_ghost_round sub
CODE_06E321:
  LDA $0E                                   ; $06E321 |
  BPL CODE_06E32F                           ; $06E323 |
  STZ !s_spr_timer_2,x                      ; $06E325 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $06E328 |
  LDA #$8000                                ; $06E32A |
  TRB $0E                                   ; $06E32D |

CODE_06E32F:
  CLC                                       ; $06E32F |
  LDA !s_spr_timer_2,x                      ; $06E330 |
  BNE CODE_06E366                           ; $06E333 |
  REP #$10                                  ; $06E335 |
  LDA $0E                                   ; $06E337 |
  AND #$000F                                ; $06E339 |
  ASL A                                     ; $06E33C |
  TAY                                       ; $06E33D |
  LDA $E371,y                               ; $06E33E | address table
  STA $00                                   ; $06E341 |
  LDA $E37B,y                               ; $06E343 | address table
  STA $02                                   ; $06E346 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $06E348 |
  BNE CODE_06E34F                           ; $06E34A |
  LDA $E367,y                               ; $06E34C |

CODE_06E34F:
  DEC A                                     ; $06E34F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06E350 |
  TAY                                       ; $06E352 |
  LDA ($00),y                               ; $06E353 | load from table in $E371
  AND #$00FF                                ; $06E355 |
  STA !s_spr_timer_2,x                      ; $06E358 |
  LDA ($02),y                               ; $06E35B | load from table in $E37B
  AND #$00FF                                ; $06E35D |
  STA !s_spr_anim_frame,x                   ; $06E360 |
  SEP #$10                                  ; $06E363 |
  SEC                                       ; $06E365 |

CODE_06E366:
  RTS                                       ; $06E366 |

; data table
  dw $0004                                  ; $06E367 |
  dw $0009                                  ; $06E369 |
  dw $0004                                  ; $06E36B |
  dw $0008                                  ; $06E36D |
  dw $000F                                  ; $06E36F |

; address table: each address is a frame timing table
  dw $E385                                  ; $06E371 |
  dw $E38D                                  ; $06E373 |
  dw $E39F                                  ; $06E375 |
  dw $E3A7                                  ; $06E377 |
  dw $E3B7                                  ; $06E379 |

; address table: each address is an animation frame (?) table
  dw $E389                                  ; $06E37B |
  dw $E396                                  ; $06E37D |
  dw $E3A3                                  ; $06E37F |
  dw $E3AF                                  ; $06E381 |
  dw $E3C6                                  ; $06E383 |

; caged_ghost_round animation tables
; split into pairs of tables, each pair is an AI state
; first table in pair is how many frames to wait
; second table is the animation frame to display (?)
  db $04, $08, $04, $08                     ; $06E385 |

  db $08, $09, $08, $07                     ; $06E389 |

  db $40, $02, $04, $01                     ; $06E38D |
  db $01, $01, $01, $01                     ; $06E391 |
  db $02                                    ; $06E395 |

  db $14, $13, $12, $0E                     ; $06E396 |
  db $0D, $0C, $05, $06                     ; $06E39A |
  db $07                                    ; $06E39E |

  db $04, $08, $04, $08                     ; $06E39F |

  db $08, $09, $08, $07                     ; $06E3A3 |

  db $40, $04, $03, $02                     ; $06E3A7 |
  db $02, $01, $01, $01                     ; $06E3AB |

  db $07, $06, $05, $04                     ; $06E3AF |
  db $03, $02, $01, $00                     ; $06E3B3 |

; spitting shyguy state
  db $01, $01, $01, $01                     ; $06E3B7 |
  db $01, $01, $02, $10                     ; $06E3BB |
  db $02, $01, $01, $01                     ; $06E3BF |
  db $01, $01, $10                          ; $06E3C3 |

  db $06, $05, $04, $03                     ; $06E3C6 |
  db $02, $01, $0A, $0B                     ; $06E3CA |
  db $0A, $02, $03, $04                     ; $06E3CE |
  db $05, $06, $07                          ; $06E3D2 |

; useless RTL's?
  RTL                                       ; $06E3D5 |

  RTL                                       ; $06E3D6 |

; address table
  dw $E3D9                                  ; $06E3D7 |
  dw $E3DF                                  ; $06E3D9 |
  dw $E407                                  ; $06E3DB |

; data table
  db $14, $0E                               ; $06E3DD |

; data table
  db $00, $00, $00, $00                     ; $06E3DF |
  db $00, $00, $00, $00                     ; $06E3E3 |
  db $00, $00, $00, $00                     ; $06E3E7 |
  db $00, $00, $00, $00                     ; $06E3EB |
  db $00, $00, $00, $00                     ; $06E3EF |
  db $00, $00, $00, $00                     ; $06E3F3 |
  db $00, $00, $00, $00                     ; $06E3F7 |
  db $00, $00, $00, $00                     ; $06E3FB |
  db $00, $00, $00, $00                     ; $06E3FF |
  db $00, $00, $00, $00                     ; $06E403 |

; data table
  db $00, $00, $C8, $00                     ; $06E407 |
  db $C5, $FF, $C4, $FE                     ; $06E40B |
  db $C3, $FA, $C5, $D9                     ; $06E40F |
  db $C9, $C1, $D1, $A9                     ; $06E413 |
  db $D8, $A1, $E0, $9D                     ; $06E417 |
  db $00, $99, $21, $9D                     ; $06E41B |
  db $29, $A1, $30, $A9                     ; $06E41F |
  db $38, $C1, $3C, $D9                     ; $06E423 |
  db $3E, $FA, $3D, $FE                     ; $06E427 |
  db $3C, $FF, $39, $00                     ; $06E42B |

; caged_ghost_round sub
CODE_06E42F:
  LDY $0C                                   ; $06E42F |
  LDA $E3DD,y                               ; $06E431 |
  AND #$00FF                                ; $06E434 |
  STA $06                                   ; $06E437 |
  TYA                                       ; $06E439 |
  ASL A                                     ; $06E43A |
  TAY                                       ; $06E43B |
  LDA $E3D7,y                               ; $06E43C |
  STA $00                                   ; $06E43F |
  LDY #$00                                  ; $06E441 |
  LDA ($00),y                               ; $06E443 |
  STA $02                                   ; $06E445 |
  LDY #$02                                  ; $06E447 |
  LDA ($00),y                               ; $06E449 |
  STA $04                                   ; $06E44B |
  LDA $06                                   ; $06E44D |
  DEC A                                     ; $06E44F |
  ASL A                                     ; $06E450 |
  TAY                                       ; $06E451 |

CODE_06E452:
  TYA                                       ; $06E452 |
  ASL A                                     ; $06E453 |
  TAX                                       ; $06E454 |
  LDA #$0000                                ; $06E455 |
  STA $7049F6,x                             ; $06E458 |
  LDA #$0000                                ; $06E45C |
  STA $7049F8,x                             ; $06E45F |
  LDA $E407,y                               ; $06E463 |
  AND #$00FF                                ; $06E466 |
  CMP #$0080                                ; $06E469 |
  BCC CODE_06E471                           ; $06E46C |
  ORA #$FF00                                ; $06E46E |

CODE_06E471:
  STA $704B36,x                             ; $06E471 |
  LDA $E407,y                               ; $06E475 |
  AND #$FF00                                ; $06E478 |
  BPL CODE_06E480                           ; $06E47B |
  ORA #$00FF                                ; $06E47D |

CODE_06E480:
  XBA                                       ; $06E480 |
  STA $704B38,x                             ; $06E481 |
  DEY                                       ; $06E485 |
  BPL CODE_06E452                           ; $06E486 |
  LDX $12                                   ; $06E488 |
  RTS                                       ; $06E48A |

; caged_ghost_round sub
CODE_06E48B:
  LDA #$0004                                ; $06E48B |
  TRB !r_reg_ts_mirror                      ; $06E48E |
  LDA #$0400                                ; $06E491 |
  TRB $0E                                   ; $06E494 |
  LDA !s_spr_cam_x_pos,x                    ; $06E496 |
  CLC                                       ; $06E499 |
  ADC #$0080                                ; $06E49A |
  CMP #$0200                                ; $06E49D |
  BCS CODE_06E514                           ; $06E4A0 |
  LDA !s_spr_cam_y_pos,x                    ; $06E4A2 |
  CLC                                       ; $06E4A5 |
  ADC #$0080                                ; $06E4A6 |
  CMP #$0200                                ; $06E4A9 |
  BCS CODE_06E514                           ; $06E4AC |
  LDA !s_spr_cam_x_pos,x                    ; $06E4AE |
  STA $6040                                 ; $06E4B1 |
  LDA !s_spr_cam_y_pos,x                    ; $06E4B4 |
  STA $6042                                 ; $06E4B7 |
  LDA #$49F6                                ; $06E4BA |
  STA !gsu_r1                               ; $06E4BD |
  LDA #$4B36                                ; $06E4C0 |
  STA !gsu_r2                               ; $06E4C3 |
  LDA $06                                   ; $06E4C6 |
  STA !gsu_r3                               ; $06E4C8 |
  STZ !gsu_r4                               ; $06E4CB |
  LDA #$449E                                ; $06E4CE |
  STA !gsu_r5                               ; $06E4D1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E4D4 |
  AND #$03FF                                ; $06E4D6 |
  STA !gsu_r6                               ; $06E4D9 |
  LDA #$0000                                ; $06E4DC |
  STA $605E                                 ; $06E4DF |
  LDX #$08                                  ; $06E4E2 |
  LDA #$E8CA                                ; $06E4E4 |
  JSL r_gsu_init_1                          ; $06E4E7 |
  JSL $00BE39                               ; $06E4EB | continues 8 bytes later

; DMA args
  db $40, $50, $7E, $72                     ; $06E4EF |
  db $33, $70, $48, $03                     ; $06E4F3 |

  SEP #$30                                  ; $06E4F7 |
  LDA #$04                                  ; $06E4F9 |
  TSB !r_reg_ts_mirror                      ; $06E4FB |
  LDA #$02                                  ; $06E4FE |
  TSB !r_reg_cgwsel_mirror                  ; $06E500 |
  LDA #$63                                  ; $06E503 |
  STA !r_reg_cgadsub_mirror                 ; $06E505 |
  LDA #$18                                  ; $06E508 |
  TSB !r_reg_hdmaen_mirror                  ; $06E50A |
  REP #$20                                  ; $06E50D |
  LDA #$0400                                ; $06E50F |
  TSB $0E                                   ; $06E512 |

CODE_06E514:
  LDX $12                                   ; $06E514 |
  RTS                                       ; $06E516 |

; 5-4 ghost
init_platform_ghost:
  LDA #$0100                                ; $06E517 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E51A |
  LDA #$0040                                ; $06E51C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E51F |
  STA !s_spr_wildcard_1_lo,x                ; $06E521 |
  STZ !s_spr_wildcard_6_lo,x                ; $06E524 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $06E527 |
  LDA #$8000                                ; $06E529 |
  STA !s_spr_wildcard_2_lo,x                ; $06E52C |
  RTL                                       ; $06E52F |

; 5-4 ghost
main_platform_ghost:
  LDA !s_spr_wildcard_2_lo,x                ; $06E530 |
  STA $0E                                   ; $06E533 |
  JSR CODE_06E562                           ; $06E535 |
  JSR platform_ghost_run_state              ; $06E538 |
  JSR CODE_06E58E                           ; $06E53B |
  JSR CODE_06E7E0                           ; $06E53E |
  JSR CODE_06E85A                           ; $06E541 |
  LDA $0E                                   ; $06E544 |
  STA !s_spr_wildcard_2_lo,x                ; $06E546 |
  JSL $03AF23                               ; $06E549 |
  LDA !s_spr_wildcard_2_lo,x                ; $06E54D |
  STA $0E                                   ; $06E550 |
  LDA !s_spr_wildcard_1_lo,x                ; $06E552 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E555 |
  JSR CODE_06E894                           ; $06E557 |
  LDX $12                                   ; $06E55A |
  LDA $0E                                   ; $06E55C |
  STA !s_spr_wildcard_2_lo,x                ; $06E55E |
  RTL                                       ; $06E561 |

; platform ghost sub
CODE_06E562:
  LDA $7044DA                               ; $06E562 |\
  CLC                                       ; $06E566 | | r8 = X coord + offset(?)
  ADC !s_spr_x_pixel_pos,x                  ; $06E567 | |
  STA !gsu_r8                               ; $06E56A |/
  LDA $7044DC                               ; $06E56D |\
  CLC                                       ; $06E571 | | r0 = Y coord + offset(?)
  ADC !s_spr_y_pixel_pos,x                  ; $06E572 | |
  STA !gsu_r0                               ; $06E575 |/
  LDX #$0A                                  ; $06E578 |
  LDA #$CE2F                                ; $06E57A |
  JSL r_gsu_init_3                          ; $06E57D |
  LDX $12                                   ; $06E581 |
  LDA !gsu_r5                               ; $06E583 |
  BEQ .ret                                  ; $06E586 |
  LDA #$0002                                ; $06E588 |
  TSB $0E                                   ; $06E58B |

.ret
  RTS                                       ; $06E58D |

; platform ghost sub
CODE_06E58E:
  LDA !s_spr_cam_x_pos,x                    ; $06E58E |\
  CLC                                       ; $06E591 | | if screen relative X coordinate
  ADC #$0028                                ; $06E592 | | > -$28 and < $128
  CMP #$0150                                ; $06E595 | | on screen check
  BCC .onscreen                             ; $06E598 |/
  LDY #$11                                  ; $06E59A |\
  STY !r_reg_tm_mirror                      ; $06E59C | | if not onscreen,
  LDY #$02                                  ; $06E59F | | enable BG1 and OBJ for main
  STY !r_reg_ts_mirror                      ; $06E5A1 | | and BG2 for subscreen
  LDY #$20                                  ; $06E5A4 | | turn off all else (BG3)
  STY !r_reg_cgadsub_mirror                 ; $06E5A6 | | color math enabled for background
  RTS                                       ; $06E5A9 |/  using HW reg mirrors

.onscreen
  LDA #$0006                                ; $06E5AA |\ r0 = ROM bank, this bank
  STA !gsu_r0                               ; $06E5AD |/ for data tables
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E5B0 |\
  AND #$00FF                                ; $06E5B2 | | low byte of second word of state ptr table
  ASL A                                     ; $06E5B5 | | used as index to get an address
  TAY                                       ; $06E5B6 | | r1 = address of data table 1
  LDA $E623,y                               ; $06E5B7 | |
  STA !gsu_r1                               ; $06E5BA |/
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E5BD |\
  XBA                                       ; $06E5BF | | high byte of second word of state ptr table
  AND #$00FF                                ; $06E5C0 | | used as index to get an address
  ASL A                                     ; $06E5C3 | | r2 = address of data table 2
  TAY                                       ; $06E5C4 | |
  LDA $E623,y                               ; $06E5C5 | |
  STA !gsu_r2                               ; $06E5C8 |/
  LDA #$0010                                ; $06E5CB |\
  STA !gsu_r3                               ; $06E5CE | |
  LDA #$0000                                ; $06E5D1 | | load r3, r4, r5
  STA !gsu_r4                               ; $06E5D4 | | with constants
  LDA #$449E                                ; $06E5D7 | |
  STA !gsu_r5                               ; $06E5DA |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E5DD |\ r6 = platform ghost height
  STA !gsu_r6                               ; $06E5DF |/
  LDA !s_spr_cam_x_pos,x                    ; $06E5E2 |\ ($0040) = screen relative X coordinate
  STA $6040                                 ; $06E5E5 |/
  LDA !s_spr_cam_y_pos,x                    ; $06E5E8 |\ ($0042) = screen relative Y coordinate
  STA $6042                                 ; $06E5EB |/
  LDX #$08                                  ; $06E5EE |\
  LDA #$E93B                                ; $06E5F0 | | gsu
  JSL r_gsu_init_1                          ; $06E5F3 |/
  JSL $00BE39                               ; $06E5F7 |

; DMA args
  dl $7E5040, $703372                       ; $06E5FB |
  dw $0348                                  ; $06E601 |

  SEP #$30                                  ; $06E603 |
  LDA #$13                                  ; $06E605 |
  STA !r_reg_tm_mirror                      ; $06E607 |
  LDA #$04                                  ; $06E60A |
  STA !r_reg_ts_mirror                      ; $06E60C |
  LDA #$22                                  ; $06E60F |
  STA !r_reg_cgwsel_mirror                  ; $06E611 |
  LDA #$63                                  ; $06E614 |
  STA !r_reg_cgadsub_mirror                 ; $06E616 |
  LDA #$18                                  ; $06E619 |
  TSB !r_reg_hdmaen_mirror                  ; $06E61B |
  REP #$20                                  ; $06E61E |
  LDX $12                                   ; $06E620 |
  RTS                                       ; $06E622 |

; platform ghost data pointers
  dw $E8FC                                  ; $06E623 |
  dw $E91C                                  ; $06E625 |

; word 1 is state routine pointer ($0000: restart cycle)
; word 2 is ???
platform_ghost_state_ptr:
  dw platform_ghost_waiting_1,  $0001       ; $06E627 | $00
  dw platform_ghost_move_right, $0001       ; $06E62B | $01
  dw platform_ghost_rise,       $0001       ; $06E62F | $02
  dw platform_ghost_waiting_2,  $0001       ; $06E633 | $03
  dw platform_ghost_fall,       $0001       ; $06E637 | $04
  dw platform_ghost_move_right, $0001       ; $06E63B | $05
  dw platform_ghost_rise,       $0001       ; $06E63F | $06
  dw platform_ghost_waiting_2,  $0001       ; $06E643 | $07
  dw platform_ghost_fall,       $0001       ; $06E647 | $08
  dw platform_ghost_move_right, $0001       ; $06E64B | $09
  dw platform_ghost_rise_high,  $0001       ; $06E64F | $0A
  dw platform_ghost_waiting_2,  $0001       ; $06E653 | $0B
  dw platform_ghost_fall,       $0001       ; $06E657 | $0C
  dw $0000                                  ; $06E65B | $0D

; platform ghost sub
platform_ghost_run_state:
  JSR platform_ghost_animate_eyes_check     ; $06E65D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06E660 |\
  ASL A                                     ; $06E662 | | load AI state
  ASL A                                     ; $06E663 |/

.load_routine
  TAY                                       ; $06E664 |\ load AI routine from state
  LDA platform_ghost_state_ptr,y            ; $06E665 |/
  BNE .call_routine                         ; $06E668 | if non-$0000
  STA !s_spr_wildcard_6_lo_dp,x             ; $06E66A |\
  LDA #$8000                                ; $06E66C | | on $0000, we reached end of list
  TSB $0E                                   ; $06E66F | | so restart list at $00
  BRA .load_routine                         ; $06E671 |/  and turn on "state init" flag

.call_routine
  STA $00                                   ; $06E673 | store routine at $7960
  LDA platform_ghost_state_ptr+2,y          ; $06E675 |\ load second word of state table
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E678 |/ into wildcard table
  PER $0002                                 ; $06E67A | push return address just after this JMP
  JMP ($7960)                               ; $06E67D | jump to state routine
  LDA $0E                                   ; $06E680 |\  turn off "state init" flag
  AND #$7FFF                                ; $06E682 | | $4000 bit of $0E on tells us
  BIT #$4000                                ; $06E685 | | the state is done
  BEQ .ret                                  ; $06E688 |/
  EOR #$C000                                ; $06E68A |\ if done, flag $4000 off, state init
  INC !s_spr_wildcard_6_lo_dp,x             ; $06E68D |/ back on and increment state

.ret
  STA $0E                                   ; $06E68F | store new bitflags
  RTS                                       ; $06E691 |

; indexed by time, 2 frames per anim entry in this table
; 11 entries means 22 frames total of the sequence
platform_ghost_anim_eye_frames:
  dw $0000, $0001                           ; $06E692 |
  dw $0002, $0001                           ; $06E696 |
  dw $0002, $0000                           ; $06E69A |
  dw $0000, $0001                           ; $06E69E |
  dw $0002, $0001                           ; $06E6A2 |
  dw $0002                                  ; $06E6A6 |

platform_ghost_animate_eyes:
  LDA #$0015                                ; $06E6A8 |\ init timer
  STA !s_spr_timer_2,x                      ; $06E6AB |/ 22 frames of animation
  LDA #$0004                                ; $06E6AE |\ start off animating
  TSB $0E                                   ; $06E6B1 |/ by setting $0004 (eye animate) bit

.check
  LDA $0E                                   ; $06E6B3 |\
  BIT #$0004                                ; $06E6B5 | | $0004 bit tells us
  BEQ .ret                                  ; $06E6B8 |/  we should be animating or not
  LDA !s_spr_timer_2,x                      ; $06E6BA |\
  PHA                                       ; $06E6BD | | do we still have time left?
  BNE .store_anim_frame                     ; $06E6BE |/
  LDA #$0004                                ; $06E6C0 |\ if not, reset eye animate bit
  TRB $0E                                   ; $06E6C3 |/

.store_anim_frame
  PLA                                       ; $06E6C5 |\  time % 2 is index
  AND #$FFFE                                ; $06E6C6 | | meaning 2 frames per anim entry
  TAY                                       ; $06E6C9 |/
  LDA platform_ghost_anim_eye_frames,y      ; $06E6CA |\ store the eye anim frame
  STA !s_spr_anim_frame,x                   ; $06E6CD |/

.ret
  RTS                                       ; $06E6D0 |

; state $00: one of the doing nothing/waiting states
; animates eyes, that's really it
platform_ghost_waiting_1:
  LDA $0E                                   ; $06E6D1 |\ state init?
  BPL .animate_eyes                         ; $06E6D3 |/ (because sign bit is $8000)
  LDA #$00F0                                ; $06E6D5 |\ if so, set state timer
  STA !s_spr_timer_1,x                      ; $06E6D8 |/ 240 frames

.animate_eyes
  LDA $0E                                   ; $06E6DB |\  $0004 bit means eye is animating
  BIT #$0004                                ; $06E6DD | | already, no need to fire off again
  BNE .ret                                  ; $06E6E0 |/  so return
  LDA #$0002                                ; $06E6E2 |\ eyes open anim frame
  STA !s_spr_anim_frame,x                   ; $06E6E5 |/
  LDA !s_spr_timer_1,x                      ; $06E6E8 |\ if time left on eye anim timer
  BNE .check_state_done                     ; $06E6EB |/ skip animating
  LDA #$00F0                                ; $06E6ED |\  otherwise, reset eye animation
  STA !s_spr_timer_1,x                      ; $06E6F0 | | timer and animate
  JSR platform_ghost_animate_eyes           ; $06E6F3 |/

.check_state_done
  LDA $0E                                   ; $06E6F6 |\
  BIT #$0001                                ; $06E6F8 | | if $0001 flag is off
  BEQ .ret                                  ; $06E6FB |/
  LDA $0E                                   ; $06E6FD |\
  AND #$FFFB                                ; $06E6FF | | otherwise, flag off eye animate
  ORA #$4000                                ; $06E702 | | and flag on state done
  STA $0E                                   ; $06E705 |/

.ret
  RTS                                       ; $06E707 |

; state $01: one of the moving right states
platform_ghost_move_right:
  LDA $0E                                   ; $06E708 |\ state init?
  BPL .play_noise                           ; $06E70A |/ (because sign bit is $8000)
  LDA #$0180                                ; $06E70C |\ if so, set X velocity
  STA !s_spr_x_speed_lo,x                   ; $06E70F |/ (move right)
  LDA #$0080                                ; $06E712 |\ 128 frame timer
  STA !s_spr_timer_1,x                      ; $06E715 |/ for state
  LDA #$0002                                ; $06E718 |\ face right
  STA !s_spr_facing_dir,x                   ; $06E71B |/
  LDA #$0002                                ; $06E71E |\ eyes open anim frame
  STA !s_spr_anim_frame,x                   ; $06E721 |/

.play_noise
  LDA $0E                                   ; $06E724 |\
  BIT #$0002                                ; $06E726 | | is $0002 flag on?
  BNE .ret_zero_velocity                    ; $06E729 |/  return
  LDA !s_spr_cam_x_pos,x                    ; $06E72B |\
  CLC                                       ; $06E72E | | if screen X coord
  ADC #$0080                                ; $06E72F | | >= $0180
  CMP #$0200                                ; $06E732 | | (indicates far offscreen)
  BCS .check_state_done                     ; $06E735 |/
  LDA #$00C0                                ; $06E737 |\ if X onscreen, play noise
  STA !r_apu_io_1_mirror                    ; $06E73A |/

.check_state_done
  LDA !s_spr_timer_1,x                      ; $06E73D |\ still time left for state?
  BNE .animate_eyes                         ; $06E740 |/
  STZ !s_spr_x_speed_lo,x                   ; $06E742 | if not, zero X velocity
  LDA #$4000                                ; $06E745 |\ and flag state done
  TSB $0E                                   ; $06E748 |/
  RTS                                       ; $06E74A |

.animate_eyes
  CMP #$0017                                ; $06E74B |\ if timer is at $0017
  BNE .ret                                  ; $06E74E |/ don't animate eyes
  JSR platform_ghost_animate_eyes           ; $06E750 |

.ret
  RTS                                       ; $06E753 |

.ret_zero_velocity
  STZ !s_spr_x_speed_lo,x                   ; $06E754 | zero X velocity
  RTS                                       ; $06E757 | and return

; speed of height gains
platform_ghost_height_speeds:
  dw $0003, $0006                           ; $06E758 | short, high

; destination heights
platform_ghost_heights:
  dw $0090, $0120                           ; $06E75C | short, high

; state $02: short rise upward
platform_ghost_rise:
  LDY #$00                                  ; $06E760 | shorter rise
  BRA .init                                 ; $06E762 |

; state $
.high
  LDY #$02                                  ; $06E764 | much higher rise

.init
  STZ !s_spr_anim_frame,x                   ; $06E766 | eyes closed anim frame
  LDA $0E                                   ; $06E769 |\ state init?
  BPL .check_state_done                     ; $06E76B |/ (because sign bit is $8000)
  LDA #$001E                                ; $06E76D | if so, set wait timer
  STA !s_spr_timer_1,x                      ; $06E770 | 30 frames

.check_state_done
  LDA !s_spr_timer_1,x                      ; $06E773 |\ time left on wait timer?
  BNE .ret                                  ; $06E776 |/ return
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E778 |\  otherwise rise:
  CLC                                       ; $06E77A | | add to height value from
  ADC platform_ghost_height_speeds,y        ; $06E77B | | velocity table
  STA !s_spr_wildcard_1_lo,x                ; $06E77E |/
  CMP platform_ghost_heights,y              ; $06E781 |\ have we reached height
  BCC .ret                                  ; $06E784 |/ destination?
  LDA #$4000                                ; $06E786 |\ if so, flag state as done
  TSB $0E                                   ; $06E789 |/

.ret
  RTS                                       ; $06E78B |

; state $04: falling back to ground level
platform_ghost_fall:
  LDA $0E                                   ; $06E78C |\ state init?
  BPL .check_state_done                     ; $06E78E |/ (because sign bit is $8000)
  LDA #$0002                                ; $06E790 |\ if so, eyes open
  STA !s_spr_anim_frame,x                   ; $06E793 |/ animation frame
  STZ !s_spr_timer_1,x                      ; $06E796 | and clear state timer

.check_state_done
  LDA !s_spr_timer_1,x                      ; $06E799 |\ time left on timer?
  BNE .ret                                  ; $06E79C |/ return
  LDA #$0002                                ; $06E79E |\ 2 frames in timer
  STA !s_spr_timer_1,x                      ; $06E7A1 |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E7A4 |\
  SEC                                       ; $06E7A6 | | fall velocity is -3
  SBC #$0003                                ; $06E7A7 |/
  CMP #$0040                                ; $06E7AA |\ $40 is destination height
  BPL .store_height                         ; $06E7AD |/ (default/ground level)
  LDA #$4000                                ; $06E7AF |\ if dest reached,
  TSB $0E                                   ; $06E7B2 |/ flag on state done
  LDA #$0040                                ; $06E7B4 | and set height to $40

.store_height
  STA !s_spr_wildcard_1_lo,x                ; $06E7B7 |

.ret
  RTS                                       ; $06E7BA |

; state $03: another waiting state, different timing
; just animates eyes like #1
platform_ghost_waiting_2:
  LDA $0E                                   ; $06E7BB |\ state init?
  BPL .animate_eyes                         ; $06E7BD |/ (because sign bit is $8000)
  LDA #$00C6                                ; $06E7BF |\ if so, wait for
  STA !s_spr_timer_1,x                      ; $06E7C2 |/ 198 frames

.animate_eyes
  LDA !s_spr_timer_1,x                      ; $06E7C5 |\  if timer is at $0017
  CMP #$0017                                ; $06E7C8 | | don't animate eyes
  BNE .check_state_done                     ; $06E7CB |/
  JSR platform_ghost_animate_eyes           ; $06E7CD |

.check_state_done
  LDA !s_spr_timer_1,x                      ; $06E7D0 |\ time left on timer?
  BNE .ret                                  ; $06E7D3 |/
  LDA $0E                                   ; $06E7D5 |\  if not,
  AND #$FFFB                                ; $06E7D7 | | flag off eye animate
  ORA #$4000                                ; $06E7DA | | and flag on state done
  STA $0E                                   ; $06E7DD |/

.ret
  RTS                                       ; $06E7DF |

; platform ghost sub
CODE_06E7E0:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E7E0 |\
  AND #$00FF                                ; $06E7E2 | | low byte of second word of state ptr table
  ASL A                                     ; $06E7E5 | | used as index into ROM table
  TAY                                       ; $06E7E6 | | contains an address of data table
  LDA $E623,y                               ; $06E7E7 | |
  STA $00                                   ; $06E7EA |/
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E7EC |\
  XBA                                       ; $06E7EE | | high byte of second word of state ptr table
  AND #$00FF                                ; $06E7EF | | used as index into same ROM table
  ASL A                                     ; $06E7F2 | | contains an address of data table
  TAY                                       ; $06E7F3 | |
  LDA $E623,y                               ; $06E7F4 | |
  STA $02                                   ; $06E7F7 |/
  LDY #$12                                  ; $06E7F9 |
  LDA ($00),y                               ; $06E7FB |
  AND #$00FF                                ; $06E7FD |
  BIT #$0080                                ; $06E800 |
  BEQ CODE_06E808                           ; $06E803 |
  ORA #$FF00                                ; $06E805 |

CODE_06E808:
  STA !gsu_r1                               ; $06E808 |
  LDA ($02),y                               ; $06E80B |
  AND #$00FF                                ; $06E80D |
  BIT #$0080                                ; $06E810 |
  BEQ CODE_06E818                           ; $06E813 |
  ORA #$FF00                                ; $06E815 |

CODE_06E818:
  STA !gsu_r3                               ; $06E818 |
  INY                                       ; $06E81B |
  LDA ($00),y                               ; $06E81C |
  AND #$00FF                                ; $06E81E |
  BIT #$0080                                ; $06E821 |
  BEQ CODE_06E829                           ; $06E824 |
  ORA #$FF00                                ; $06E826 |

CODE_06E829:
  STA !gsu_r2                               ; $06E829 |
  LDA ($02),y                               ; $06E82C |
  AND #$00FF                                ; $06E82E |
  BIT #$0080                                ; $06E831 |
  BEQ CODE_06E839                           ; $06E834 |
  ORA #$FF00                                ; $06E836 |

CODE_06E839:
  STA !gsu_r5                               ; $06E839 |
  LDA !s_spr_wildcard_1_lo,x                ; $06E83C |
  STA !gsu_r6                               ; $06E83F |
  LDX #$08                                  ; $06E842 |
  LDA #$EB9D                                ; $06E844 |
  JSL r_gsu_init_1                          ; $06E847 |
  LDX $12                                   ; $06E84B |
  LDA !gsu_r7                               ; $06E84D |
  STA $0A                                   ; $06E850 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $06E852 |
  LDA !gsu_r8                               ; $06E854 |
  STA $0C                                   ; $06E857 |
  RTS                                       ; $06E859 |

; platform ghost sub
CODE_06E85A:
  REP #$10                                  ; $06E85A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06E85C |
  SEC                                       ; $06E85F |
  SBC #$0008                                ; $06E860 |
  STA $00                                   ; $06E863 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $06E865 |
  CLC                                       ; $06E868 |
  ADC #$0010                                ; $06E869 |
  STA $02                                   ; $06E86C |
  LDY !s_spr_oam_pointer,x                  ; $06E86E |
  LDX #$000D                                ; $06E871 |

CODE_06E874:
  LDA $6000,y                               ; $06E874 |
  CLC                                       ; $06E877 |
  ADC $00                                   ; $06E878 |
  STA $6000,y                               ; $06E87A |
  LDA $6002,y                               ; $06E87D |
  CLC                                       ; $06E880 |
  ADC $02                                   ; $06E881 |
  STA $6002,y                               ; $06E883 |
  TYA                                       ; $06E886 |
  CLC                                       ; $06E887 |
  ADC #$0008                                ; $06E888 |
  TAY                                       ; $06E88B |
  DEX                                       ; $06E88C |
  BNE CODE_06E874                           ; $06E88D |
  SEP #$10                                  ; $06E88F |
  LDX $12                                   ; $06E891 |
  RTS                                       ; $06E893 |

; platform ghost sub
CODE_06E894:
  LDA !s_player_y_speed                     ; $06E894 |
  BMI CODE_06E8F1                           ; $06E897 |
  LDA !s_player_center_x                    ; $06E899 |
  SEC                                       ; $06E89C |
  SBC !s_spr_x_pixel_pos,x                  ; $06E89D |
  CLC                                       ; $06E8A0 |
  ADC $0A                                   ; $06E8A1 |
  STA $00                                   ; $06E8A3 |
  ASL A                                     ; $06E8A5 |
  LDA !s_player_hitbox_half_width           ; $06E8A6 |
  BCS CODE_06E8AF                           ; $06E8A9 |
  EOR #$FFFF                                ; $06E8AB |
  INC A                                     ; $06E8AE |

CODE_06E8AF:
  CLC                                       ; $06E8AF |
  ADC $00                                   ; $06E8B0 |
  CLC                                       ; $06E8B2 |
  ADC #$0018                                ; $06E8B3 |
  CMP #$0030                                ; $06E8B6 |
  BCS CODE_06E8F1                           ; $06E8B9 |
  LDA !s_spr_y_pixel_pos,x                  ; $06E8BB |
  CLC                                       ; $06E8BE |
  ADC $0C                                   ; $06E8BF |
  SEC                                       ; $06E8C1 |
  SBC #$0008                                ; $06E8C2 |
  STA $00                                   ; $06E8C5 |
  SEC                                       ; $06E8C7 |
  SBC !s_player_y                           ; $06E8C8 |
  CLC                                       ; $06E8CB |
  CMP #$000A                                ; $06E8CC |
  BMI CODE_06E8F1                           ; $06E8CF |
  CMP #$0020                                ; $06E8D1 |
  BCS CODE_06E8F1                           ; $06E8D4 |
  LDA $00                                   ; $06E8D6 |
  SEC                                       ; $06E8D8 |
  SBC #$0020                                ; $06E8D9 |
  STA !s_player_y                           ; $06E8DC |
  INC !s_on_sprite_platform_flag            ; $06E8DF |
  LDA #$0001                                ; $06E8E2 |
  TSB $0E                                   ; $06E8E5 |
  LDA !s_spr_x_delta_lo,x                   ; $06E8E7 |
  CLC                                       ; $06E8EA |
  ADC !s_player_x                           ; $06E8EB |
  STA !s_player_x                           ; $06E8EE |

CODE_06E8F1:
  LDA $0A                                   ; $06E8F1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06E8F3 |
  LDA $0C                                   ; $06E8F6 |
  STA !s_spr_gsu_morph_2_lo,x               ; $06E8F8 |
  RTS                                       ; $06E8FB |

; platform ghost data
  dw $0000, $00C1                           ; $06E8FC |
  dw $F4C8, $E5D0                           ; $06E900 |
  dw $D0D8, $ACE0                           ; $06E904 |
  dw $91E8, $86F0                           ; $06E908 |
  dw $82F8, $8100                           ; $06E90C |
  dw $8101, $8209                           ; $06E910 |
  dw $8A11, $9819                           ; $06E914 |
  dw $DE20, $0028                           ; $06E918 |

; platform ghost data
  dw $0000, $00C1                           ; $06E91C |
  dw $00C8, $00D0                           ; $06E920 |
  dw $00D8, $00E0                           ; $06E924 |
  dw $00E8, $00F0                           ; $06E928 |
  dw $00F8, $0000                           ; $06E92C |
  dw $0001, $0009                           ; $06E930 |
  dw $0011, $0019                           ; $06E934 |
  dw $0020, $0028                           ; $06E938 |
  dw $0040, $0040                           ; $06E93C |
  dw $0030, $0030                           ; $06E940 |

init_soft_thing:
  LDY #$00                                  ; $06E944 |
  LDA !s_spr_x_pixel_pos,x                  ; $06E946 |
  BIT #$0010                                ; $06E949 |
  BEQ CODE_06E950                           ; $06E94C |
  LDY #$02                                  ; $06E94E |

CODE_06E950:
  LDA $E93C,y                               ; $06E950 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06E953 |
  LDA $E940,y                               ; $06E955 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06E958 |
  STZ !s_spr_x_hitbox_offset,x              ; $06E95A |
  STZ !s_spr_y_hitbox_offset,x              ; $06E95D |
  RTL                                       ; $06E960 |

main_soft_thing:
  LDA #$F880                                ; $06E961 |
  AND !s_spr_wildcard_4_lo_dp,x             ; $06E964 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E966 |
  JSR CODE_06EA0A                           ; $06E968 |
  JSL $03AF23                               ; $06E96B |
  LDA !s_spr_cam_x_pos,x                    ; $06E96F |
  CLC                                       ; $06E972 |
  ADC #$0078                                ; $06E973 |
  CMP #$01F0                                ; $06E976 |
  BCS CODE_06E987                           ; $06E979 |
  LDA !s_spr_cam_y_pos,x                    ; $06E97B |
  CLC                                       ; $06E97E |
  ADC #$0078                                ; $06E97F |
  CMP #$01C2                                ; $06E982 |
  BCC CODE_06E98C                           ; $06E985 |

CODE_06E987:
  JSL $03A31E                               ; $06E987 |
  RTL                                       ; $06E98B |

CODE_06E98C:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E98C |
  CMP #$8000                                ; $06E98E |
  ROR A                                     ; $06E991 |
  STA !s_spr_hitbox_width,x                 ; $06E992 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06E995 |
  CMP #$8000                                ; $06E997 |
  ROR A                                     ; $06E99A |
  STA !s_spr_hitbox_height,x                ; $06E99B |
  JSR CODE_06EB2C                           ; $06E99E |
  JSR CODE_06EBF8                           ; $06E9A1 |
  JSR CODE_06EEFE                           ; $06E9A4 |
  REP #$10                                  ; $06E9A7 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06E9A9 |
  AND #$07FF                                ; $06E9AB |
  LDY !s_player_ground_pound_state          ; $06E9AE |
  BEQ CODE_06E9C6                           ; $06E9B1 |
  BIT #$0010                                ; $06E9B3 |
  BEQ CODE_06E9C6                           ; $06E9B6 |
  ORA #$0800                                ; $06E9B8 |
  BIT #$0400                                ; $06E9BB |
  BEQ CODE_06E9C6                           ; $06E9BE |
  LDY #$0000                                ; $06E9C0 |
  STY !s_player_ground_pound_state          ; $06E9C3 |

CODE_06E9C6:
  LDY !s_player_jump_state                  ; $06E9C6 |
  BNE CODE_06E9CE                           ; $06E9C9 |
  ORA #$4000                                ; $06E9CB |

CODE_06E9CE:
  BIT #$0010                                ; $06E9CE |
  BEQ CODE_06E9D6                           ; $06E9D1 |
  ORA #$1000                                ; $06E9D3 |

CODE_06E9D6:
  BIT #$0020                                ; $06E9D6 |
  BEQ CODE_06E9DE                           ; $06E9D9 |
  ORA #$2000                                ; $06E9DB |

CODE_06E9DE:
  BIT #$0100                                ; $06E9DE |
  BEQ CODE_06E9E6                           ; $06E9E1 |
  ORA #$8000                                ; $06E9E3 |

CODE_06E9E6:
  STA !s_spr_wildcard_4_lo_dp,x             ; $06E9E6 |
  SEP #$10                                  ; $06E9E8 |
  LDX $12                                   ; $06E9EA |
  RTL                                       ; $06E9EC |

; soft thing sub
CODE_06E9ED:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06E9ED |
  LSR A                                     ; $06E9EF |
  BCS CODE_06E9F3                           ; $06E9F0 |
  DEC A                                     ; $06E9F2 |

CODE_06E9F3:
  STA $02                                   ; $06E9F3 |
  SEC                                       ; $06E9F5 |
  SBC !s_spr_wildcard_5_lo_dp,x             ; $06E9F6 |
  INC A                                     ; $06E9F8 |
  STA $00                                   ; $06E9F9 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06E9FB |
  LSR A                                     ; $06E9FD |
  BCS CODE_06EA01                           ; $06E9FE |
  DEC A                                     ; $06EA00 |

CODE_06EA01:
  STA $06                                   ; $06EA01 |
  SEC                                       ; $06EA03 |
  SBC !s_spr_wildcard_6_lo_dp,x             ; $06EA04 |
  INC A                                     ; $06EA06 |
  STA $04                                   ; $06EA07 |
  RTS                                       ; $06EA09 |

; soft thing sub
CODE_06EA0A:
  LDA !s_spr_cam_x_pos,x                    ; $06EA0A |
  ADC #$0078                                ; $06EA0D |
  CMP #$01F0                                ; $06EA10 |
  BCC CODE_06EA21                           ; $06EA13 |
  SEP #$20                                  ; $06EA15 |
  LDA #$04                                  ; $06EA17 |
  TRB !r_reg_tm_mirror                      ; $06EA19 |
  REP #$20                                  ; $06EA1C |
  LDX $12                                   ; $06EA1E |
  RTS                                       ; $06EA20 |

CODE_06EA21:
  JSR CODE_06E9ED                           ; $06EA21 |
  LDA $00                                   ; $06EA24 |
  SEC                                       ; $06EA26 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $06EA27 |
  STA $70449E                               ; $06EA2A |
  STA $7044DA                               ; $06EA2E |
  CLC                                       ; $06EA32 |
  ADC #$0001                                ; $06EA33 |
  STA $7044A2                               ; $06EA36 |
  STA $7044D6                               ; $06EA3A |
  CLC                                       ; $06EA3E |
  ADC #$0001                                ; $06EA3F |
  STA $7044A6                               ; $06EA42 |
  STA $7044D2                               ; $06EA46 |
  CLC                                       ; $06EA4A |
  ADC #$0002                                ; $06EA4B |
  STA $7044AA                               ; $06EA4E |
  STA $7044CE                               ; $06EA52 |
  LDA $02                                   ; $06EA56 |
  CLC                                       ; $06EA58 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $06EA59 |
  STA $7044BA                               ; $06EA5C |
  STA $7044BE                               ; $06EA60 |
  SEC                                       ; $06EA64 |
  SBC #$0001                                ; $06EA65 |
  STA $7044B6                               ; $06EA68 |
  STA $7044C2                               ; $06EA6C |
  SEC                                       ; $06EA70 |
  SBC #$0001                                ; $06EA71 |
  STA $7044B2                               ; $06EA74 |
  STA $7044C6                               ; $06EA78 |
  SEC                                       ; $06EA7C |
  SBC #$0002                                ; $06EA7D |
  STA $7044AE                               ; $06EA80 |
  STA $7044CA                               ; $06EA84 |
  LDA $04                                   ; $06EA88 |
  CLC                                       ; $06EA8A |
  ADC !s_spr_gsu_morph_2_lo,x               ; $06EA8B |
  STA $7044AC                               ; $06EA8E |
  STA $7044B0                               ; $06EA92 |
  CLC                                       ; $06EA96 |
  ADC #$0001                                ; $06EA97 |
  STA $7044A8                               ; $06EA9A |
  STA $7044B4                               ; $06EA9E |
  CLC                                       ; $06EAA2 |
  ADC #$0001                                ; $06EAA3 |
  STA $7044A4                               ; $06EAA6 |
  STA $7044B8                               ; $06EAAA |
  CLC                                       ; $06EAAE |
  ADC #$0002                                ; $06EAAF |
  STA $7044A0                               ; $06EAB2 |
  STA $7044BC                               ; $06EAB6 |
  LDA $06                                   ; $06EABA |
  STA $7044D0                               ; $06EABC |
  STA $7044CC                               ; $06EAC0 |
  SEC                                       ; $06EAC4 |
  SBC #$0001                                ; $06EAC5 |
  STA $7044D4                               ; $06EAC8 |
  STA $7044C8                               ; $06EACC |
  SEC                                       ; $06EAD0 |
  SBC #$0001                                ; $06EAD1 |
  STA $7044D8                               ; $06EAD4 |
  STA $7044C4                               ; $06EAD8 |
  SEC                                       ; $06EADC |
  SBC #$0002                                ; $06EADD |
  STA $7044DC                               ; $06EAE0 |
  STA $7044C0                               ; $06EAE4 |
  LDA !s_spr_cam_x_pos,x                    ; $06EAE8 |
  STA $6040                                 ; $06EAEB |
  LDA !s_spr_cam_y_pos,x                    ; $06EAEE |
  STA $6042                                 ; $06EAF1 |
  LDA #$0010                                ; $06EAF4 |
  STA !gsu_r1                               ; $06EAF7 |
  LDA #$449E                                ; $06EAFA |
  STA $6048                                 ; $06EAFD |
  LDA #$44DA                                ; $06EB00 |
  STA $604A                                 ; $06EB03 |
  LDX #$08                                  ; $06EB06 |
  LDA #$E9E2                                ; $06EB08 |
  JSL r_gsu_init_1                          ; $06EB0B |
  JSL $00BE39                               ; $06EB0F |

; DMA args
  dl $7E5040, $703372                       ; $06EB13 |
  dw $0348                                  ; $06EB19 |

  SEP #$30                                  ; $06EB1B |
  LDA #$04                                  ; $06EB1D |
  TSB !r_reg_tm_mirror                      ; $06EB1F |
  LDA #$18                                  ; $06EB22 |
  TSB !r_reg_hdmaen_mirror                  ; $06EB24 |
  REP #$20                                  ; $06EB27 |
  LDX $12                                   ; $06EB29 |
  RTS                                       ; $06EB2B |

; soft thing sub
CODE_06EB2C:
  JSR CODE_06E9ED                           ; $06EB2C |
  LDA $00                                   ; $06EB2F |
  CLC                                       ; $06EB31 |
  ADC !s_spr_x_pixel_pos,x                  ; $06EB32 |
  STA $00                                   ; $06EB35 |
  LDA $02                                   ; $06EB37 |
  CLC                                       ; $06EB39 |
  ADC !s_spr_x_pixel_pos,x                  ; $06EB3A |
  STA $02                                   ; $06EB3D |
  LDA $04                                   ; $06EB3F |
  CLC                                       ; $06EB41 |
  ADC !s_spr_y_pixel_pos,x                  ; $06EB42 |
  STA $04                                   ; $06EB45 |
  LDA $06                                   ; $06EB47 |
  CLC                                       ; $06EB49 |
  ADC !s_spr_y_pixel_pos,x                  ; $06EB4A |
  STA $06                                   ; $06EB4D |
  LDA #$0007                                ; $06EB4F |
  STA $08                                   ; $06EB52 |
  JSR CODE_06EFC9                           ; $06EB54 |
  LDX $12                                   ; $06EB57 |
  LDA $0E                                   ; $06EB59 |
  ORA !s_spr_wildcard_4_lo_dp,x             ; $06EB5B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06EB5D |
  LDA $0E                                   ; $06EB5F |
  AND #$0003                                ; $06EB61 |
  BEQ CODE_06EBA7                           ; $06EB64 |
  LDA $0E                                   ; $06EB66 |
  BIT #$0001                                ; $06EB68 |
  BNE CODE_06EB87                           ; $06EB6B |
  LDA $04                                   ; $06EB6D |
  EOR #$000F                                ; $06EB6F |
  BEQ CODE_06EB9E                           ; $06EB72 |
  INC A                                     ; $06EB74 |
  AND #$000F                                ; $06EB75 |
  STA $0A                                   ; $06EB78 |
  LDA !s_spr_y_speed_lo,x                   ; $06EB7A |
  BPL CODE_06EB9E                           ; $06EB7D |
  STZ !s_spr_y_speed_lo,x                   ; $06EB7F |
  STZ !s_spr_y_delta_lo,x                   ; $06EB82 |
  BRA CODE_06EB9E                           ; $06EB85 |

CODE_06EB87:
  LDA $06                                   ; $06EB87 |
  INC A                                     ; $06EB89 |
  AND #$000F                                ; $06EB8A |
  EOR #$FFFF                                ; $06EB8D |
  INC A                                     ; $06EB90 |
  STA $0A                                   ; $06EB91 |
  LDA !s_spr_y_speed_lo,x                   ; $06EB93 |
  BMI CODE_06EB9E                           ; $06EB96 |
  STZ !s_spr_y_speed_lo,x                   ; $06EB98 |
  STZ !s_spr_y_delta_lo,x                   ; $06EB9B |

CODE_06EB9E:
  LDA !s_spr_y_pixel_pos,x                  ; $06EB9E |
  CLC                                       ; $06EBA1 |
  ADC $0A                                   ; $06EBA2 |
  STA !s_spr_y_pixel_pos,x                  ; $06EBA4 |

CODE_06EBA7:
  LDA $0E                                   ; $06EBA7 |
  AND #$000C                                ; $06EBA9 |
  BEQ CODE_06EBF3                           ; $06EBAC |
  CMP #$000C                                ; $06EBAE |
  BEQ CODE_06EBF3                           ; $06EBB1 |
  BIT #$0008                                ; $06EBB3 |
  BEQ CODE_06EBD3                           ; $06EBB6 |
  LDA $00                                   ; $06EBB8 |
  AND #$000F                                ; $06EBBA |
  EOR #$000F                                ; $06EBBD |
  INC A                                     ; $06EBC0 |
  AND #$000F                                ; $06EBC1 |
  STA $08                                   ; $06EBC4 |
  LDA !s_spr_x_speed_lo,x                   ; $06EBC6 |
  BPL CODE_06EBEA                           ; $06EBC9 |
  STZ !s_spr_x_speed_lo,x                   ; $06EBCB |
  STZ !s_spr_y_delta_lo,x                   ; $06EBCE |
  BRA CODE_06EBEA                           ; $06EBD1 |

CODE_06EBD3:
  LDA $02                                   ; $06EBD3 |
  INC A                                     ; $06EBD5 |
  AND #$000F                                ; $06EBD6 |
  EOR #$FFFF                                ; $06EBD9 |
  INC A                                     ; $06EBDC |
  STA $08                                   ; $06EBDD |
  LDA !s_spr_x_speed_lo,x                   ; $06EBDF |
  BMI CODE_06EBEA                           ; $06EBE2 |
  STZ !s_spr_x_speed_lo,x                   ; $06EBE4 |
  STZ !s_spr_x_delta_lo,x                   ; $06EBE7 |

CODE_06EBEA:
  LDA !s_spr_x_pixel_pos,x                  ; $06EBEA |
  CLC                                       ; $06EBED |
  ADC $08                                   ; $06EBEE |
  STA !s_spr_x_pixel_pos,x                  ; $06EBF0 |

CODE_06EBF3:
  RTS                                       ; $06EBF3 |

  dw $0001, $FFFF                           ; $06EBF4 |

; soft thing sub
CODE_06EBF8:
  STZ $0E                                   ; $06EBF8 |
  LDX $12                                   ; $06EBFA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06EBFC |
  CMP #$8000                                ; $06EBFE |
  ROR A                                     ; $06EC01 |
  STA !s_spr_hitbox_width,x                 ; $06EC02 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06EC05 |
  CMP #$8000                                ; $06EC07 |
  ROR A                                     ; $06EC0A |
  STA !s_spr_hitbox_height,x                ; $06EC0B |
  LDA !s_player_x_speed                     ; $06EC0E |
  PHA                                       ; $06EC11 |
  JSR CODE_06EDF6                           ; $06EC12 |
  PLA                                       ; $06EC15 |
  BCS CODE_06EC1B                           ; $06EC16 |
  JMP CODE_06ECAF                           ; $06EC18 |

CODE_06EC1B:
  CPY #$01                                  ; $06EC1B |
  BNE CODE_06EC8F                           ; $06EC1D |
  LDA $0E                                   ; $06EC1F |
  BEQ CODE_06EC92                           ; $06EC21 |
  LDA !s_player_ground_pound_state          ; $06EC23 |
  BEQ CODE_06EC88                           ; $06EC26 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EC28 |
  AND #$000C                                ; $06EC2A |
  CMP #$000C                                ; $06EC2D |
  BEQ CODE_06EC88                           ; $06EC30 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06EC32 |
  CMP #$000E                                ; $06EC34 |
  BCC CODE_06EC81                           ; $06EC37 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06EC39 |
  PHA                                       ; $06EC3B |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06EC3C |
  DEC A                                     ; $06EC3E |
  TAY                                       ; $06EC3F |
  LDA #$0C00                                ; $06EC40 |
  JSR CODE_06EFB7                           ; $06EC43 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06EC46 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $06EC48 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06EC4A |
  LSR A                                     ; $06EC4C |
  BCS CODE_06EC55                           ; $06EC4D |
  INC !s_player_y                           ; $06EC4F |
  INC !s_spr_y_pixel_pos,x                  ; $06EC52 |

CODE_06EC55:
  PLA                                       ; $06EC55 |
  EOR #$FFFF                                ; $06EC56 |
  SEC                                       ; $06EC59 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $06EC5A |
  LSR A                                     ; $06EC5C |
  STA $00                                   ; $06EC5D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EC5F |
  BIT #$000C                                ; $06EC61 |
  BEQ CODE_06EC88                           ; $06EC64 |
  BIT #$0008                                ; $06EC66 |
  BEQ CODE_06EC76                           ; $06EC69 |
  LDA !s_spr_x_pixel_pos,x                  ; $06EC6B |
  CLC                                       ; $06EC6E |
  ADC $00                                   ; $06EC6F |
  STA !s_spr_x_pixel_pos,x                  ; $06EC71 |
  BRA CODE_06EC88                           ; $06EC74 |

CODE_06EC76:
  LDA !s_spr_x_pixel_pos,x                  ; $06EC76 |
  SEC                                       ; $06EC79 |
  SBC $00                                   ; $06EC7A |
  STA !s_spr_x_pixel_pos,x                  ; $06EC7C |
  BRA CODE_06EC88                           ; $06EC7F |

CODE_06EC81:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EC81 |
  ORA #$0400                                ; $06EC83 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06EC86 |

CODE_06EC88:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EC88 |
  ORA #$0110                                ; $06EC8A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06EC8D |

CODE_06EC8F:
  JMP CODE_06EDF1                           ; $06EC8F |

CODE_06EC92:
  LDA !s_player_jump_state                  ; $06EC92 |
  BNE CODE_06ECA5                           ; $06EC95 |
  LDY $06                                   ; $06EC97 |
  LDA !s_player_x                           ; $06EC99 |
  CLC                                       ; $06EC9C |
  ADC $7962,y                               ; $06EC9D |
  STA !s_player_x                           ; $06ECA0 |
  BRA CODE_06ECAC                           ; $06ECA3 |

CODE_06ECA5:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ECA5 |
  ORA #$0100                                ; $06ECA7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06ECAA |

CODE_06ECAC:
  JMP CODE_06EDF1                           ; $06ECAC |

CODE_06ECAF:
  CMP !s_player_x_speed                     ; $06ECAF |
  BNE CODE_06ECB7                           ; $06ECB2 |
  JMP CODE_06EDF1                           ; $06ECB4 |

CODE_06ECB7:
  STA $08                                   ; $06ECB7 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ECB9 |
  ORA #$0020                                ; $06ECBB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06ECBE |
  LDY $06                                   ; $06ECC0 |
  LDA $7962,y                               ; $06ECC2 |
  STA $0A                                   ; $06ECC5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ECC7 |
  PHA                                       ; $06ECC9 |
  AND #$BFFF                                ; $06ECCA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06ECCD |
  PLA                                       ; $06ECCF |
  BIT #$4000                                ; $06ECD0 |
  BNE CODE_06ECDC                           ; $06ECD3 |
  LDY #$01                                  ; $06ECD5 |
  LDA !s_player_jump_state                  ; $06ECD7 |
  BNE CODE_06ED48                           ; $06ECDA |

CODE_06ECDC:
  LDA !s_egg_throw_state                    ; $06ECDC |
  BNE CODE_06ED48                           ; $06ECDF |
  LDA !s_player_mouth_state                 ; $06ECE1 |
  BNE CODE_06ED48                           ; $06ECE4 |
  LDY $06                                   ; $06ECE6 |
  LDA $7962,y                               ; $06ECE8 |
  BPL CODE_06ECF6                           ; $06ECEB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ECED |
  BIT #$0004                                ; $06ECEF |
  BNE CODE_06ED69                           ; $06ECF2 |
  BRA CODE_06ECFD                           ; $06ECF4 |

CODE_06ECF6:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ECF6 |
  BIT #$0008                                ; $06ECF8 |
  BNE CODE_06ED69                           ; $06ECFB |

CODE_06ECFD:
  LDY !s_player_y_speed                     ; $06ECFD |
  BMI CODE_06ED48                           ; $06ED00 |
  LDA !s_spr_x_pixel_pos,x                  ; $06ED02 |
  SEC                                       ; $06ED05 |
  LDX $06                                   ; $06ED06 |
  SBC $EFA7,x                               ; $06ED08 |
  LDX $12                                   ; $06ED0B |
  SEC                                       ; $06ED0D |
  SBC $0A                                   ; $06ED0E |
  STA !s_spr_x_pixel_pos,x                  ; $06ED10 |
  LDA $08                                   ; $06ED13 |
  PHA                                       ; $06ED15 |
  CLC                                       ; $06ED16 |
  ADC #$00C0                                ; $06ED17 |
  CMP #$0181                                ; $06ED1A |
  PLA                                       ; $06ED1D |
  BCC CODE_06ED2A                           ; $06ED1E |
  LDA #$00E0                                ; $06ED20 |
  LDX $06                                   ; $06ED23 |
  BNE CODE_06ED2A                           ; $06ED25 |
  LDA #$FF20                                ; $06ED27 |

CODE_06ED2A:
  STA !s_player_x_speed                     ; $06ED2A |
  LDA #$0000                                ; $06ED2D |
  STA !s_player_x_speed_prev                ; $06ED30 |
  LDA !s_spr_timer_1,x                      ; $06ED33 |
  BNE CODE_06ED45                           ; $06ED36 |
  LDA #$0059                                ; $06ED38 |
  JSL push_sound_queue                      ; $06ED3B |
  LDA #$000A                                ; $06ED3F |
  STA !s_spr_timer_1,x                      ; $06ED42 |

CODE_06ED45:
  JMP CODE_06EDEB                           ; $06ED45 |

CODE_06ED48:
  LDA !s_player_x                           ; $06ED48 |
  CLC                                       ; $06ED4B |
  LDX $06                                   ; $06ED4C |
  ADC $EFA7,x                               ; $06ED4E |
  LDX $12                                   ; $06ED51 |
  CLC                                       ; $06ED53 |
  ADC $0A                                   ; $06ED54 |
  STA !s_player_x                           ; $06ED56 |
  CPY #$00                                  ; $06ED59 |
  BNE CODE_06ED60                           ; $06ED5B |
  JMP CODE_06EDEB                           ; $06ED5D |

CODE_06ED60:
  STZ !s_player_x_speed_prev                ; $06ED60 |
  STZ !s_player_x_speed                     ; $06ED63 |
  JMP CODE_06EDF1                           ; $06ED66 |

CODE_06ED69:
  LDA $08                                   ; $06ED69 |
  PHA                                       ; $06ED6B |
  CLC                                       ; $06ED6C |
  ADC #$00C0                                ; $06ED6D |
  CMP #$0181                                ; $06ED70 |
  PLA                                       ; $06ED73 |
  BCC CODE_06ED80                           ; $06ED74 |
  LDA #$00C0                                ; $06ED76 |
  LDX $06                                   ; $06ED79 |
  BNE CODE_06ED80                           ; $06ED7B |
  LDA #$FF40                                ; $06ED7D |

CODE_06ED80:
  STA !s_player_x_speed                     ; $06ED80 |
  LDA #$0000                                ; $06ED83 |
  STA !s_player_x_speed_prev                ; $06ED86 |
  LDX $12                                   ; $06ED89 |
  LDY #$00                                  ; $06ED8B |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06ED8D |
  AND #$0003                                ; $06ED8F |
  CMP #$0003                                ; $06ED92 |
  BEQ CODE_06ED48                           ; $06ED95 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06ED97 |
  DEC A                                     ; $06ED99 |
  TAY                                       ; $06ED9A |
  LDA #$0C00                                ; $06ED9B |
  JSR CODE_06EFB7                           ; $06ED9E |
  LDY #$00                                  ; $06EDA1 |
  CMP #$0041                                ; $06EDA3 |
  BCS CODE_06ED48                           ; $06EDA6 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06EDA8 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $06EDAA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06EDAC |
  AND #$0001                                ; $06EDAE |
  ASL A                                     ; $06EDB1 |
  ASL A                                     ; $06EDB2 |
  CLC                                       ; $06EDB3 |
  ADC $06                                   ; $06EDB4 |
  TAY                                       ; $06EDB6 |
  LDA $EFAF,y                               ; $06EDB7 |
  CLC                                       ; $06EDBA |
  ADC !s_spr_x_pixel_pos,x                  ; $06EDBB |
  STA !s_spr_x_pixel_pos,x                  ; $06EDBE |
  LDX $06                                   ; $06EDC1 |
  LDA $EFA7,x                               ; $06EDC3 |
  LDX !s_cur_sprite_slot                    ; $06EDC6 |
  CLC                                       ; $06EDC9 |
  ADC $0A                                   ; $06EDCA |
  CLC                                       ; $06EDCC |
  ADC !s_player_x                           ; $06EDCD |
  CLC                                       ; $06EDD0 |
  ADC $EFAF,y                               ; $06EDD1 |
  STA !s_player_x                           ; $06EDD4 |
  LDA !s_spr_timer_1,x                      ; $06EDD7 |
  BNE CODE_06EDE9                           ; $06EDDA |
  LDA #$0059                                ; $06EDDC |
  JSL push_sound_queue                      ; $06EDDF |
  LDA #$000A                                ; $06EDE3 |
  STA !s_spr_timer_1,x                      ; $06EDE6 |

CODE_06EDE9:
  LDX $12                                   ; $06EDE9 |

CODE_06EDEB:
  INC $61C2                                 ; $06EDEB |
  INC !s_player_pushing_counter             ; $06EDEE |

CODE_06EDF1:
  RTS                                       ; $06EDF1 |

  dw $0001, $FFFF                           ; $06EDF2 |

; soft thing sub
CODE_06EDF6:
  STZ $0E                                   ; $06EDF6 |
  BRA CODE_06EDFE                           ; $06EDF8 |

CODE_06EDFA:
  LDY #$00                                  ; $06EDFA |
  SEC                                       ; $06EDFC |
  RTS                                       ; $06EDFD |

CODE_06EDFE:
  LDA !s_player_hitbox_half_height          ; $06EDFE |
  CLC                                       ; $06EE01 |
  ADC !s_spr_hitbox_height,x                ; $06EE02 |
  STA $00                                   ; $06EE05 |
  LDA !s_spr_y_player_delta,x               ; $06EE07 |
  SEC                                       ; $06EE0A |
  SBC $00                                   ; $06EE0B |
  CLC                                       ; $06EE0D |
  ADC !s_spr_gsu_morph_2_lo,x               ; $06EE0E |
  BPL CODE_06EDFA                           ; $06EE11 |
  STA $0A                                   ; $06EE13 |
  LDA $00                                   ; $06EE15 |
  SEC                                       ; $06EE17 |
  ADC !s_spr_y_player_delta,x               ; $06EE18 |
  BEQ CODE_06EDFA                           ; $06EE1B |
  BMI CODE_06EDFA                           ; $06EE1D |
  STA $08                                   ; $06EE1F |
  LDY #$00                                  ; $06EE21 |
  LDA !s_spr_y_player_delta,x               ; $06EE23 |
  BMI CODE_06EE2A                           ; $06EE26 |
  LDY #$02                                  ; $06EE28 |

CODE_06EE2A:
  STY $0C                                   ; $06EE2A |
  LDA !s_player_hitbox_half_width           ; $06EE2C |
  CLC                                       ; $06EE2F |
  ADC !s_spr_hitbox_width,x                 ; $06EE30 |
  STA $00                                   ; $06EE33 |
  LDA !s_spr_x_player_delta,x               ; $06EE35 |
  SEC                                       ; $06EE38 |
  SBC $00                                   ; $06EE39 |
  BPL CODE_06EDFA                           ; $06EE3B |
  STA $04                                   ; $06EE3D |
  LDA $00                                   ; $06EE3F |
  CLC                                       ; $06EE41 |
  ADC !s_spr_x_player_delta,x               ; $06EE42 |
  BEQ CODE_06EDFA                           ; $06EE45 |
  BMI CODE_06EDFA                           ; $06EE47 |
  STA $02                                   ; $06EE49 |
  LDY #$00                                  ; $06EE4B |
  LDA !s_spr_x_player_delta,x               ; $06EE4D |
  BMI CODE_06EE54                           ; $06EE50 |
  LDY #$02                                  ; $06EE52 |

CODE_06EE54:
  STY $06                                   ; $06EE54 |
  LDA $7962,y                               ; $06EE56 |
  BPL CODE_06EE5F                           ; $06EE59 |
  EOR #$FFFF                                ; $06EE5B |
  INC A                                     ; $06EE5E |

CODE_06EE5F:
  STA $00                                   ; $06EE5F |
  LDY $0C                                   ; $06EE61 |
  LDA $7968,y                               ; $06EE63 |
  BPL CODE_06EE6C                           ; $06EE66 |
  EOR #$FFFF                                ; $06EE68 |
  INC A                                     ; $06EE6B |

CODE_06EE6C:
  CMP $00                                   ; $06EE6C |
  BCC CODE_06EE73                           ; $06EE6E |
  JMP CODE_06EEE2                           ; $06EE70 |

CODE_06EE73:
  CMP #$000D                                ; $06EE73 |
  BCC CODE_06EE8B                           ; $06EE76 |
  JMP CODE_06EEE2                           ; $06EE78 |
  LDA #$0040                                ; $06EE7B |
  STA !s_player_x_speed                     ; $06EE7E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EE81 |
  ORA #$0040                                ; $06EE83 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06EE86 |
  JMP CODE_06EEE2                           ; $06EE88 |

CODE_06EE8B:
  LDA $7968,y                               ; $06EE8B |
  BEQ CODE_06EE9E                           ; $06EE8E |
  BMI CODE_06EE9E                           ; $06EE90 |
  CLC                                       ; $06EE92 |
  ADC !s_player_y                           ; $06EE93 |
  STA !s_player_y                           ; $06EE96 |
  STZ !s_player_flutter_state               ; $06EE99 |
  BRA CODE_06EED3                           ; $06EE9C |

CODE_06EE9E:
  SEC                                       ; $06EE9E |
  ADC !s_player_y                           ; $06EE9F |
  STA !s_player_y                           ; $06EEA2 |
  LDA !s_spr_y_pixel_pos,x                  ; $06EEA5 |
  SEC                                       ; $06EEA8 |
  SBC !s_cur_spr_y_prev                     ; $06EEA9 |
  SEC                                       ; $06EEAC |
  ADC !s_player_y                           ; $06EEAD |
  STA !s_player_y                           ; $06EEB0 |
  LDY $60AB                                 ; $06EEB3 |
  BPL CODE_06EEBB                           ; $06EEB6 |
  JMP CODE_06EEFA                           ; $06EEB8 |

CODE_06EEBB:
  LDA !s_spr_x_pixel_pos,x                  ; $06EEBB |
  SEC                                       ; $06EEBE |
  SBC !s_cur_spr_x_prev                     ; $06EEBF |
  CLC                                       ; $06EEC2 |
  ADC !s_player_x                           ; $06EEC3 |
  STA !s_player_x                           ; $06EEC6 |
  INC !s_on_sprite_platform_flag            ; $06EEC9 |
  INC $0E                                   ; $06EECC |
  LDA !s_player_y_speed                     ; $06EECE |
  STA $0C                                   ; $06EED1 |

CODE_06EED3:
  LDA !s_spr_y_speed_lo,x                   ; $06EED3 |
  BPL CODE_06EEDB                           ; $06EED6 |
  LDA #$0000                                ; $06EED8 |

CODE_06EEDB:
  STA !s_player_y_speed                     ; $06EEDB |
  LDY #$01                                  ; $06EEDE |
  SEC                                       ; $06EEE0 |
  RTS                                       ; $06EEE1 |

; soft thing sub
CODE_06EEE2:
  LDX $06                                   ; $06EEE2 |
  LDA $00                                   ; $06EEE4 |
  LSR A                                     ; $06EEE6 |
  BEQ CODE_06EEE9                           ; $06EEE7 |

CODE_06EEE9:
  LDA !s_player_x_speed                     ; $06EEE9 |
  EOR $06EDF2,x                             ; $06EEEC |
  BPL CODE_06EEF8                           ; $06EEF0 |
  STZ !s_player_x_speed_prev                ; $06EEF2 |
  STZ !s_player_x_speed                     ; $06EEF5 |

CODE_06EEF8:
  LDX $12                                   ; $06EEF8 |

CODE_06EEFA:
  LDY #$01                                  ; $06EEFA |
  CLC                                       ; $06EEFC |
  RTS                                       ; $06EEFD |

; soft thing sub
CODE_06EEFE:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EEFE |
  BIT #$0100                                ; $06EF00 |
  BEQ CODE_06EF1F                           ; $06EF03 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EF05 |
  BIT #$8000                                ; $06EF07 |
  BNE CODE_06EF3A                           ; $06EF0A |
  LDA #$0003                                ; $06EF0C |
  STA !s_spr_gsu_morph_1_lo,x               ; $06EF0F |
  LDA !s_player_ground_pound_state          ; $06EF12 |
  BEQ CODE_06EF1D                           ; $06EF15 |
  LDA #$0005                                ; $06EF17 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06EF1A |

CODE_06EF1D:
  BRA CODE_06EF3A                           ; $06EF1D |

CODE_06EF1F:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EF1F |
  BIT #$0020                                ; $06EF21 |
  BEQ CODE_06EF3A                           ; $06EF24 |
  BIT #$2000                                ; $06EF26 |
  BNE CODE_06EF3A                           ; $06EF29 |
  LDA !s_spr_wildcard_4_lo,x                ; $06EF2B |
  ORA #$0080                                ; $06EF2E |
  STA !s_spr_wildcard_4_lo,x                ; $06EF31 |
  LDA #$FFFD                                ; $06EF34 |
  STA !s_spr_gsu_morph_1_lo,x               ; $06EF37 |

CODE_06EF3A:
  LDA !s_spr_gsu_morph_1_lo,x               ; $06EF3A |
  BEQ CODE_06EFA6                           ; $06EF3D |

CODE_06EF3F:
  SEC                                       ; $06EF3F |
  SBC !s_spr_gsu_morph_2_lo,x               ; $06EF40 |
  BEQ CODE_06EF81                           ; $06EF43 |
  AND #$8000                                ; $06EF45 |
  CLC                                       ; $06EF48 |
  ROL A                                     ; $06EF49 |
  ROL A                                     ; $06EF4A |
  ASL A                                     ; $06EF4B |
  TAY                                       ; $06EF4C |
  LDA $EBF4,y                               ; $06EF4D |
  CLC                                       ; $06EF50 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $06EF51 |
  STA !s_spr_gsu_morph_2_lo,x               ; $06EF54 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EF57 |
  BIT #$0010                                ; $06EF59 |
  BEQ CODE_06EF6D                           ; $06EF5C |
  LDA !s_player_y_speed                     ; $06EF5E |
  BMI CODE_06EF6D                           ; $06EF61 |
  LDA $EBF4,y                               ; $06EF63 |
  CLC                                       ; $06EF66 |
  ADC !s_player_y                           ; $06EF67 |
  STA !s_player_y                           ; $06EF6A |

CODE_06EF6D:
  LDA !s_spr_timer_2,x                      ; $06EF6D |
  BNE CODE_06EFA6                           ; $06EF70 |
  LDA #$0062                                ; $06EF72 |
  JSL push_sound_queue                      ; $06EF75 |
  LDA #$000C                                ; $06EF79 |
  STA !s_spr_timer_2,x                      ; $06EF7C |
  BRA CODE_06EFA6                           ; $06EF7F |

CODE_06EF81:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EF81 |
  BIT #$0080                                ; $06EF83 |
  BNE CODE_06EF97                           ; $06EF86 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $06EF88 |
  EOR #$FFFF                                ; $06EF8B |
  INC A                                     ; $06EF8E |
  BMI CODE_06EF92                           ; $06EF8F |
  DEC A                                     ; $06EF91 |

CODE_06EF92:
  STA !s_spr_gsu_morph_1_lo,x               ; $06EF92 |
  BRA CODE_06EF3F                           ; $06EF95 |

CODE_06EF97:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06EF97 |
  AND #$FF7F                                ; $06EF99 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06EF9C |
  LDA #$0001                                ; $06EF9E |
  STA !s_spr_gsu_morph_1_lo,x               ; $06EFA1 |
  BRA CODE_06EF3F                           ; $06EFA4 |

CODE_06EFA6:
  RTS                                       ; $06EFA6 |

  dw $FFFF, $0001                           ; $06EFA7 |
  dw $0001, $FFFF                           ; $06EFAB |
  dw $0000, $0001                           ; $06EFAF |
  dw $FFFF, $0000                           ; $06EFB3 |

; soft thing sub
CODE_06EFB7:
  STA !reg_wrdivl                           ; $06EFB7 |
  STY !reg_wrdivb                           ; $06EFBA |
  NOP                                       ; $06EFBD |
  NOP                                       ; $06EFBE |
  NOP                                       ; $06EFBF |
  NOP                                       ; $06EFC0 |
  NOP                                       ; $06EFC1 |
  NOP                                       ; $06EFC2 |
  NOP                                       ; $06EFC3 |
  NOP                                       ; $06EFC4 |
  LDA !reg_rddivl                           ; $06EFC5 |
  RTS                                       ; $06EFC8 |

; soft thing sub
CODE_06EFC9:
  STZ $0E                                   ; $06EFC9 |
  DEC $00                                   ; $06EFCB |
  INC $02                                   ; $06EFCD |
  LDA $04                                   ; $06EFCF |
  CLC                                       ; $06EFD1 |
  ADC $08                                   ; $06EFD2 |
  STA $0A                                   ; $06EFD4 |
  LDA $06                                   ; $06EFD6 |
  SEC                                       ; $06EFD8 |
  SBC $08                                   ; $06EFD9 |
  STA $0C                                   ; $06EFDB |

CODE_06EFDD:
  LDA $00                                   ; $06EFDD |
  STA !gsu_r8                               ; $06EFDF |
  LDA $0A                                   ; $06EFE2 |
  STA !gsu_r0                               ; $06EFE4 |
  LDX #$0A                                  ; $06EFE7 |
  LDA #$CE2F                                ; $06EFE9 |
  JSL r_gsu_init_3                          ; $06EFEC |
  LDA !gsu_r5                               ; $06EFF0 |
  BEQ CODE_06EFFC                           ; $06EFF3 |
  LDA $0E                                   ; $06EFF5 |
  ORA #$0008                                ; $06EFF7 |
  STA $0E                                   ; $06EFFA |

CODE_06EFFC:
  LDA $02                                   ; $06EFFC |
  STA !gsu_r8                               ; $06EFFE |
  LDA $0A                                   ; $06F001 |
  STA !gsu_r0                               ; $06F003 |
  LDX #$0A                                  ; $06F006 |
  LDA #$CE2F                                ; $06F008 |
  JSL r_gsu_init_3                          ; $06F00B |
  LDA !gsu_r5                               ; $06F00F |
  BEQ CODE_06F01B                           ; $06F012 |
  LDA $0E                                   ; $06F014 |
  ORA #$0004                                ; $06F016 |
  STA $0E                                   ; $06F019 |

CODE_06F01B:
  LDA $0E                                   ; $06F01B |
  AND #$000C                                ; $06F01D |
  CMP #$000C                                ; $06F020 |
  BEQ CODE_06F036                           ; $06F023 |
  LDA $0A                                   ; $06F025 |
  AND #$FFF0                                ; $06F027 |
  CLC                                       ; $06F02A |
  ADC #$0010                                ; $06F02B |
  STA $0A                                   ; $06F02E |
  CMP $0C                                   ; $06F030 |
  BEQ CODE_06EFDD                           ; $06F032 |
  BCC CODE_06EFDD                           ; $06F034 |

CODE_06F036:
  INC $00                                   ; $06F036 |
  DEC $02                                   ; $06F038 |
  DEC $04                                   ; $06F03A |
  DEC $04                                   ; $06F03C |
  INC $06                                   ; $06F03E |
  LDA $00                                   ; $06F040 |
  CLC                                       ; $06F042 |
  ADC $08                                   ; $06F043 |
  STA $0A                                   ; $06F045 |
  LDA $02                                   ; $06F047 |
  SEC                                       ; $06F049 |
  SBC $08                                   ; $06F04A |
  STA $0C                                   ; $06F04C |

CODE_06F04E:
  LDA $0A                                   ; $06F04E |
  STA !gsu_r8                               ; $06F050 |
  LDA $06                                   ; $06F053 |
  STA !gsu_r0                               ; $06F055 |
  LDX #$0A                                  ; $06F058 |
  LDA #$CE2F                                ; $06F05A |
  JSL r_gsu_init_3                          ; $06F05D |
  LDA !gsu_r5                               ; $06F061 |
  BEQ CODE_06F06D                           ; $06F064 |
  LDA $0E                                   ; $06F066 |
  ORA #$0001                                ; $06F068 |
  STA $0E                                   ; $06F06B |

CODE_06F06D:
  LDA $0E                                   ; $06F06D |
  AND #$0003                                ; $06F06F |
  CMP #$0003                                ; $06F072 |
  BEQ CODE_06F088                           ; $06F075 |
  LDA $0A                                   ; $06F077 |
  AND #$FFF0                                ; $06F079 |
  CLC                                       ; $06F07C |
  ADC #$0010                                ; $06F07D |
  STA $0A                                   ; $06F080 |
  CMP $0C                                   ; $06F082 |
  BEQ CODE_06F04E                           ; $06F084 |
  BCC CODE_06F04E                           ; $06F086 |

CODE_06F088:
  INC $04                                   ; $06F088 |
  INC $04                                   ; $06F08A |
  DEC $06                                   ; $06F08C |
  RTS                                       ; $06F08E |

init_platform_ghost_sewer:
  LDA $70449E                               ; $06F08F |
  CLC                                       ; $06F093 |
  ADC !s_spr_x_pixel_pos,x                  ; $06F094 |
  CLC                                       ; $06F097 |
  ADC #$0018                                ; $06F098 |
  STA !s_spr_wildcard_5_lo,x                ; $06F09B |
  LDA $7044A8                               ; $06F09E |
  CLC                                       ; $06F0A2 |
  ADC !s_spr_y_pixel_pos,x                  ; $06F0A3 |
  SEC                                       ; $06F0A6 |
  SBC #$0008                                ; $06F0A7 |
  STA !s_spr_wildcard_6_lo,x                ; $06F0AA |
  LDA #$0600                                ; $06F0AD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06F0B0 |
  STZ !s_spr_facing_dir,x                   ; $06F0B2 |
  STZ !s_spr_wildcard_1_lo,x                ; $06F0B5 |
  STZ !s_spr_wildcard_2_lo,x                ; $06F0B8 |
  STZ !s_spr_timer_1,x                      ; $06F0BB |
  STZ !s_spr_timer_2,x                      ; $06F0BE |
  RTL                                       ; $06F0C1 |

main_platform_ghost_sewer:
  LDA !s_spr_wildcard_2_lo,x                ; $06F0C2 |
  STA $0E                                   ; $06F0C5 |
  JSR CODE_06F0EF                           ; $06F0C7 |
  JSR CODE_06F1A4                           ; $06F0CA |
  JSR CODE_06F1C6                           ; $06F0CD |
  JSR CODE_06F23F                           ; $06F0D0 |
  JSL $03AF23                               ; $06F0D3 |
  LDA $0E                                   ; $06F0D7 |
  BMI .CODE_06F0E1                          ; $06F0D9 |
  JSL $03A31E                               ; $06F0DB |
  BRA .ret                                  ; $06F0DF |

.CODE_06F0E1
  LDA !s_spr_wildcard_1_lo,x                ; $06F0E1 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $06F0E4 |
  JSR CODE_06F383                           ; $06F0E6 |

.ret
  LDA $0E                                   ; $06F0E9 |
  STA !s_spr_wildcard_2_lo,x                ; $06F0EB |
  RTL                                       ; $06F0EE |

; platform ghost sewer sub
CODE_06F0EF:
  LDA #$49F6                                ; $06F0EF |
  STA !gsu_r1                               ; $06F0F2 |
  LDA #$4B36                                ; $06F0F5 |
  STA !gsu_r2                               ; $06F0F8 |
  LDA #$0006                                ; $06F0FB |\
  STA !gsu_r0                               ; $06F0FE | | r1 and r8 = $06
  STA !gsu_r8                               ; $06F101 |/  (this ROM bank)
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06F104 |
  XBA                                       ; $06F106 |
  ASL A                                     ; $06F107 |
  TAY                                       ; $06F108 |
  LDA $F3EF,y                               ; $06F109 |
  STA !gsu_r14                              ; $06F10C |
  INY                                       ; $06F10F |
  INY                                       ; $06F110 |
  LDA $F3EF,y                               ; $06F111 |
  STA !gsu_r7                               ; $06F114 |
  LDA #$0032                                ; $06F117 |
  STA !gsu_r3                               ; $06F11A |
  LDA #$0019                                ; $06F11D |
  STA !gsu_r4                               ; $06F120 |
  LDA #$449E                                ; $06F123 |
  STA !gsu_r5                               ; $06F126 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06F129 |
  AND #$00FF                                ; $06F12B |
  STA !gsu_r6                               ; $06F12E |
  LDA #$8000                                ; $06F131 |
  TRB $0E                                   ; $06F134 |
; make sure ghost is not too far offscreen
  LDA !s_spr_cam_x_pos,x                    ; $06F136 |\
  STA $00                                   ; $06F139 | | screen-relative X coord ->
  STA $6040                                 ; $06F13B |/  $1960 and $0040 (SRAM)
  CLC                                       ; $06F13E |\
  ADC #$0080                                ; $06F13F | | if screen X coord < $0180
  CMP #$0200                                ; $06F142 | | then process
  BCC .check_Y_threshold                    ; $06F145 |/
  JMP .ret                                  ; $06F147 | otherwise return

.check_Y_threshold
  LDA !s_spr_cam_y_pos,x                    ; $06F14A |\
  STA $02                                   ; $06F14D | | screen-relative Y coord ->
  STA $6042                                 ; $06F14F |/  $1962 and $0042 (SRAM)
  CLC                                       ; $06F152 |\
  ADC #$00D2                                ; $06F153 | | if screen Y coord < $01D2
  CMP #$02A4                                ; $06F156 | | then process
  BCC .CODE_06F15E                          ; $06F159 |/
  JMP .ret                                  ; $06F15B | otherwise return

.CODE_06F15E
  LDA #$FF83                                ; $06F15E |
  STA $6044                                 ; $06F161 |
  LDA #$FF2A                                ; $06F164 |
  STA $6046                                 ; $06F167 |
  LDX #$08                                  ; $06F16A |
  LDA #$E800                                ; $06F16C |
  JSL r_gsu_init_1                          ; $06F16F |
  JSL $00BE39                               ; $06F173 |

; DMA args
  dl $7E5040, $703372                       ; $06F177 |
  dw $0348                                  ; $06F17D |

  SEP #$30                                  ; $06F17F |
  LDA #$13                                  ; $06F181 |
  STA !r_reg_tm_mirror                      ; $06F183 |
  LDA #$04                                  ; $06F186 |
  STA !r_reg_ts_mirror                      ; $06F188 |
  LDA #$22                                  ; $06F18B |
  STA !r_reg_cgwsel_mirror                  ; $06F18D |
  LDA #$63                                  ; $06F190 |
  STA !r_reg_cgadsub_mirror                 ; $06F192 |
  LDA #$18                                  ; $06F195 |
  TSB !r_reg_hdmaen_mirror                  ; $06F197 |
  REP #$20                                  ; $06F19A |
  LDA #$8000                                ; $06F19C |
  TSB $0E                                   ; $06F19F |

.ret
  LDX $12                                   ; $06F1A1 |
  RTS                                       ; $06F1A3 |

; platform ghost sewer sub
CODE_06F1A4:
  LDA #$0008                                ; $06F1A4 |
  STA $00                                   ; $06F1A7 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $06F1A9 |
  CMP #$0C00                                ; $06F1AB |
  BCC CODE_06F1B7                           ; $06F1AE |
  PHA                                       ; $06F1B0 |
  LDA #$0004                                ; $06F1B1 |
  STA $00                                   ; $06F1B4 |
  PLA                                       ; $06F1B6 |

CODE_06F1B7:
  CLC                                       ; $06F1B7 |
  ADC $00                                   ; $06F1B8 |
  CMP #$0D00                                ; $06F1BA |
  BCC CODE_06F1C2                           ; $06F1BD |
  LDA #$0000                                ; $06F1BF |

CODE_06F1C2:
  STA !s_spr_wildcard_1_lo,x                ; $06F1C2 |
  RTS                                       ; $06F1C5 |

; platform ghost sewer sub
CODE_06F1C6:
  LDA !s_spr_wildcard_1_lo,x                ; $06F1C6 |
  XBA                                       ; $06F1C9 |
  ASL A                                     ; $06F1CA |
  TAY                                       ; $06F1CB |
  LDA $F3EF,y                               ; $06F1CC |
  STA $00                                   ; $06F1CF |
  INY                                       ; $06F1D1 |
  INY                                       ; $06F1D2 |
  LDA $F3EF,y                               ; $06F1D3 |
  STA $02                                   ; $06F1D6 |
  LDY #$00                                  ; $06F1D8 |
  LDA ($00),y                               ; $06F1DA |
  AND #$00FF                                ; $06F1DC |
  SEC                                       ; $06F1DF |
  SBC #$007D                                ; $06F1E0 |
  STA !gsu_r1                               ; $06F1E3 |
  LDA ($02),y                               ; $06F1E6 |
  AND #$00FF                                ; $06F1E8 |
  SEC                                       ; $06F1EB |
  SBC #$007D                                ; $06F1EC |
  STA !gsu_r3                               ; $06F1EF |
  LDY #$05                                  ; $06F1F2 |
  LDA ($00),y                               ; $06F1F4 |
  AND #$00FF                                ; $06F1F6 |
  SEC                                       ; $06F1F9 |
  SBC #$00D6                                ; $06F1FA |
  STA !gsu_r2                               ; $06F1FD |
  LDA ($02),y                               ; $06F200 |
  AND #$00FF                                ; $06F202 |
  SEC                                       ; $06F205 |
  SBC #$00D6                                ; $06F206 |
  STA !gsu_r5                               ; $06F209 |
  LDA !s_spr_wildcard_1_lo,x                ; $06F20C |
  AND #$00FF                                ; $06F20F |
  STA !gsu_r6                               ; $06F212 |
  LDX #$08                                  ; $06F215 |
  LDA #$EB9D                                ; $06F217 |
  JSL r_gsu_init_1                          ; $06F21A |
  LDX $12                                   ; $06F21E |
  LDA !gsu_r7                               ; $06F220 |
  CLC                                       ; $06F223 |
  ADC !s_spr_x_pixel_pos,x                  ; $06F224 |
  CLC                                       ; $06F227 |
  ADC #$0018                                ; $06F228 |
  STA $00                                   ; $06F22B |
  LDA !gsu_r8                               ; $06F22D |
  CLC                                       ; $06F230 |
  ADC !s_spr_y_pixel_pos,x                  ; $06F231 |
  SEC                                       ; $06F234 |
  SBC #$0008                                ; $06F235 |
  STA $02                                   ; $06F238 |
  RTS                                       ; $06F23A |

  dw $FF80, $0080                           ; $06F23B |

; platform ghost sewer sub
CODE_06F23F:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $06F23F |
  SEC                                       ; $06F241 |
  SBC !s_spr_x_pixel_pos,x                  ; $06F242 |
  SEC                                       ; $06F245 |
  SBC #$0008                                ; $06F246 |
  STA $04                                   ; $06F249 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $06F24B |
  SEC                                       ; $06F24D |
  SBC !s_spr_y_pixel_pos,x                  ; $06F24E |
  SEC                                       ; $06F251 |
  SBC #$0008                                ; $06F252 |
  STA $06                                   ; $06F255 |
  LDA $00                                   ; $06F257 |
  CMP !s_spr_wildcard_5_lo,x                ; $06F259 |
  BEQ CODE_06F274                           ; $06F25C |
  BCC CODE_06F26B                           ; $06F25E |
  LDA !s_spr_facing_dir,x                   ; $06F260 |
  ORA #$0002                                ; $06F263 |
  STA !s_spr_facing_dir,x                   ; $06F266 |
  BRA CODE_06F274                           ; $06F269 |

CODE_06F26B:
  LDA !s_spr_facing_dir,x                   ; $06F26B |
  AND #$FFFD                                ; $06F26E |
  STA !s_spr_facing_dir,x                   ; $06F271 |

CODE_06F274:
  LDA $02                                   ; $06F274 |
  CMP !s_spr_wildcard_6_lo,x                ; $06F276 |
  BEQ CODE_06F291                           ; $06F279 |
  BCC CODE_06F288                           ; $06F27B |
  LDA !s_spr_facing_dir,x                   ; $06F27D |
  ORA #$0004                                ; $06F280 |
  STA !s_spr_facing_dir,x                   ; $06F283 |
  BRA CODE_06F291                           ; $06F286 |

CODE_06F288:
  LDA !s_spr_facing_dir,x                   ; $06F288 |
  AND #$FFFB                                ; $06F28B |
  STA !s_spr_facing_dir,x                   ; $06F28E |

CODE_06F291:
  LDA !s_spr_facing_dir,x                   ; $06F291 |
  AND #$0002                                ; $06F294 |
  TAY                                       ; $06F297 |
  LDA $F23B,y                               ; $06F298 |
  CLC                                       ; $06F29B |
  ADC !s_spr_gsu_morph_1_lo,x               ; $06F29C |
  STA $08                                   ; $06F29F |
  BPL CODE_06F2A7                           ; $06F2A1 |
  EOR #$FFFF                                ; $06F2A3 |
  INC A                                     ; $06F2A6 |

CODE_06F2A7:
  CMP #$0400                                ; $06F2A7 |
  BCS CODE_06F2B1                           ; $06F2AA |
  LDA $08                                   ; $06F2AC |
  STA !s_spr_gsu_morph_1_lo,x               ; $06F2AE |

CODE_06F2B1:
  LDA !s_spr_gsu_morph_1_lo,x               ; $06F2B1 |
  AND #$FF00                                ; $06F2B4 |
  BPL CODE_06F2BC                           ; $06F2B7 |
  ORA #$00FF                                ; $06F2B9 |

CODE_06F2BC:
  XBA                                       ; $06F2BC |
  STA $08                                   ; $06F2BD |
  REP #$10                                  ; $06F2BF |
  LDY !s_spr_oam_pointer,x                  ; $06F2C1 |
  LDX #$0004                                ; $06F2C4 |

CODE_06F2C7:
  LDA $08                                   ; $06F2C7 |
  CLC                                       ; $06F2C9 |
  ADC $04                                   ; $06F2CA |
  CLC                                       ; $06F2CC |
  ADC $6000,y                               ; $06F2CD |
  STA $6000,y                               ; $06F2D0 |
  LDA $6002,y                               ; $06F2D3 |
  CLC                                       ; $06F2D6 |
  ADC $06                                   ; $06F2D7 |
  CLC                                       ; $06F2D9 |
  ADC #$0008                                ; $06F2DA |
  STA $6002,y                               ; $06F2DD |
  TYA                                       ; $06F2E0 |
  CLC                                       ; $06F2E1 |
  ADC #$0008                                ; $06F2E2 |
  TAY                                       ; $06F2E5 |
  DEX                                       ; $06F2E6 |
  BNE CODE_06F2C7                           ; $06F2E7 |
  LDX #$0003                                ; $06F2E9 |

CODE_06F2EC:
  LDA $6000,y                               ; $06F2EC |
  CLC                                       ; $06F2EF |
  ADC $04                                   ; $06F2F0 |
  STA $6000,y                               ; $06F2F2 |
  LDA $6002,y                               ; $06F2F5 |
  CLC                                       ; $06F2F8 |
  ADC $06                                   ; $06F2F9 |
  STA $6002,y                               ; $06F2FB |
  LDA $6004,y                               ; $06F2FE |
  AND #$7FFF                                ; $06F301 |
  STA $6004,y                               ; $06F304 |
  TYA                                       ; $06F307 |
  CLC                                       ; $06F308 |
  ADC #$0008                                ; $06F309 |
  TAY                                       ; $06F30C |
  DEX                                       ; $06F30D |
  BNE CODE_06F2EC                           ; $06F30E |
  LDX $12                                   ; $06F310 |
  SEP #$10                                  ; $06F312 |
  LDA !s_spr_timer_1,x                      ; $06F314 |
  BNE CODE_06F348                           ; $06F317 |
  LDA #$01BA                                ; $06F319 |
  JSL spawn_ambient_sprite                  ; $06F31C |
  LDA !s_spr_x_pixel_pos,x                  ; $06F320 |
  SEC                                       ; $06F323 |
  SBC #$0008                                ; $06F324 |
  STA $70A2,y                               ; $06F327 |
  LDA !s_spr_y_pixel_pos,x                  ; $06F32A |
  SEC                                       ; $06F32D |
  SBC #$000C                                ; $06F32E |
  STA $7142,y                               ; $06F331 |
  LDA #$001A                                ; $06F334 |
  STA $7E4C,y                               ; $06F337 |
  LDA #$0003                                ; $06F33A |
  STA $7782,y                               ; $06F33D |
  LDA #$002E                                ; $06F340 |
  STA !s_spr_timer_1,x                      ; $06F343 |
  LDY #$00                                  ; $06F346 |

CODE_06F348:
  SEP #$10                                  ; $06F348 |
  RTS                                       ; $06F34A |

; data table, no idea where it's used (platform sewer ghost?)
  dw $0007, $0008                           ; $06F34B |
  dw $0009, $000A                           ; $06F34F |
  dw $0009, $0008                           ; $06F353 |
  dw $0007, $0006                           ; $06F357 |
  dw $0005, $0004                           ; $06F35B |
  dw $0003, $0002                           ; $06F35F |
  dw $0001, $0000                           ; $06F363 |
  dw $0003, $0004                           ; $06F367 |
  dw $0005, $0004                           ; $06F36B |
  dw $0003, $0003                           ; $06F36F |
  dw $0003, $0003                           ; $06F373 |
  dw $0003, $0003                           ; $06F377 |
  dw $0003, $0003                           ; $06F37B |
  dw $0003, $0003                           ; $06F37F |

; platform ghost sewer sub
CODE_06F383:
  LDA $0E                                   ; $06F383 |
  BIT #$0001                                ; $06F385 |
  BEQ CODE_06F39B                           ; $06F388 |
  LDA $00                                   ; $06F38A |
  SEC                                       ; $06F38C |
  SBC !s_spr_wildcard_5_lo_dp,x             ; $06F38D |
  CLC                                       ; $06F38F |
  ADC !s_player_x                           ; $06F390 |
  STA !s_player_x                           ; $06F393 |
  LDA #$0001                                ; $06F396 |
  TRB $0E                                   ; $06F399 |

CODE_06F39B:
  LDA !s_player_y_speed                     ; $06F39B |
  BMI CODE_06F3E6                           ; $06F39E |
  LDA !s_player_center_x                    ; $06F3A0 |
  SEC                                       ; $06F3A3 |
  SBC $00                                   ; $06F3A4 |
  STA $04                                   ; $06F3A6 |
  ASL A                                     ; $06F3A8 |
  LDA !s_player_hitbox_half_width           ; $06F3A9 |
  BCS CODE_06F3B2                           ; $06F3AC |
  EOR #$FFFF                                ; $06F3AE |
  INC A                                     ; $06F3B1 |

CODE_06F3B2:
  CLC                                       ; $06F3B2 |
  ADC $04                                   ; $06F3B3 |
  CLC                                       ; $06F3B5 |
  ADC #$0018                                ; $06F3B6 |
  CMP #$0030                                ; $06F3B9 |
  BCS CODE_06F3E6                           ; $06F3BC |
  LDA $02                                   ; $06F3BE |
  SEC                                       ; $06F3C0 |
  SBC #$0008                                ; $06F3C1 |
  STA $04                                   ; $06F3C4 |
  SEC                                       ; $06F3C6 |
  SBC !s_player_y                           ; $06F3C7 |
  CLC                                       ; $06F3CA |
  CMP #$000A                                ; $06F3CB |
  BMI CODE_06F3E6                           ; $06F3CE |
  CMP #$0020                                ; $06F3D0 |
  BCS CODE_06F3E6                           ; $06F3D3 |
  LDA $04                                   ; $06F3D5 |
  SEC                                       ; $06F3D7 |
  SBC #$0020                                ; $06F3D8 |
  STA !s_player_y                           ; $06F3DB |
  INC !s_on_sprite_platform_flag            ; $06F3DE |
  LDA #$0001                                ; $06F3E1 |
  TSB $0E                                   ; $06F3E4 |

CODE_06F3E6:
  LDA $00                                   ; $06F3E6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $06F3E8 |
  LDA $02                                   ; $06F3EA |
  STA !s_spr_wildcard_6_lo_dp,x             ; $06F3EC |
  RTS                                       ; $06F3EE |

; platform ghost sewer data pointers
  dw $F40B                                  ; $06F3EF |
  dw $F46F                                  ; $06F3F1 |
  dw $F4D3                                  ; $06F3F3 |
  dw $F537                                  ; $06F3F5 |
  dw $F59B                                  ; $06F3F7 |
  dw $F5FF                                  ; $06F3F9 |
  dw $F663                                  ; $06F3FB |
  dw $F6C7                                  ; $06F3FD |
  dw $F72B                                  ; $06F3FF |
  dw $F78F                                  ; $06F401 |
  dw $F7F3                                  ; $06F403 |
  dw $F857                                  ; $06F405 |
  dw $F8BB                                  ; $06F407 |
  dw $F40B                                  ; $06F409 |

; platform ghost sewer data tables
  dw $6C00                                  ; $06F40B |
  dw $6903, $670B, $6724, $692C             ; $06F40D |
  dw $6C2F, $7231, $7734, $7D37             ; $06F415 |
  dw $823A, $873F, $8D44, $924B             ; $06F41D |
  dw $9752, $9D5A, $A262, $A76A             ; $06F425 |
  dw $AD72, $B279, $B77F, $BD84             ; $06F42D |
  dw $C289, $C78C, $CD8F, $D292             ; $06F435 |
  dw $D794, $DA93, $DB92, $DB67             ; $06F43D |
  dw $DA66, $D765, $D264, $CD61             ; $06F445 |
  dw $C75E, $C25B, $BD56, $B751             ; $06F44D |
  dw $B24A, $AD43, $A73B, $A233             ; $06F455 |
  dw $9D2B, $9723, $921C, $8D15             ; $06F45D |
  dw $8710, $820B, $7D08, $7705             ; $06F465 |
  dw $7202                                  ; $06F46D |

  dw $8603, $8306, $810E                    ; $06F46F |
  dw $8127, $832F, $8632, $8B35             ; $06F475 |
  dw $8F38, $933B, $973F, $9B44             ; $06F47D |
  dw $9F49, $A34F, $A755, $AB5C             ; $06F485 |
  dw $AF63, $B36B, $B772, $BB78             ; $06F48D |
  dw $BF7D, $C382, $C787, $CB8B             ; $06F495 |
  dw $CF8E, $D391, $D794, $DA93             ; $06F49D |
  dw $DB92, $DB67, $DA66, $D765             ; $06F4A5 |
  dw $D363, $CF60, $CB5D, $C759             ; $06F4AD |
  dw $C354, $BF4F, $BB49, $B743             ; $06F4B5 |
  dw $B33C, $AF34, $AB2D, $A726             ; $06F4BD |
  dw $A320, $9F1A, $9B15, $9710             ; $06F4C5 |
  dw $930C, $8F09, $8B06                    ; $06F4CD |

  dw $9F0D                                  ; $06F4D3 |
  dw $9C10, $9A18, $9A31, $9C39             ; $06F4D5 |
  dw $9F3C, $A23F, $A542, $A846             ; $06F4DD |
  dw $AB4A, $AD4E, $B052, $B357             ; $06F4E5 |
  dw $B65D, $B963, $BB68, $BE6E             ; $06F4ED |
  dw $C174, $C47A, $C77E, $C982             ; $06F4F5 |
  dw $CC86, $CF8A, $D28E, $D591             ; $06F4FD |
  dw $D794, $DA93, $DB92, $DB67             ; $06F505 |
  dw $DA66, $D765, $D563, $D260             ; $06F50D |
  dw $CF5C, $CC58, $C954, $C750             ; $06F515 |
  dw $C44B, $C145, $BE3F, $BB39             ; $06F51D |
  dw $B934, $B62E, $B328, $B023             ; $06F525 |
  dw $AD1F, $AB1B, $A817, $A513             ; $06F52D |
  dw $A210                                  ; $06F535 |

  dw $B41E, $B121, $AF29                    ; $06F537 |
  dw $AF42, $B14A, $B44D, $B650             ; $06F53D |
  dw $B853, $BA56, $BB59, $BD5D             ; $06F545 |
  dw $BF60, $C164, $C268, $C46D             ; $06F54D |
  dw $C671, $C875, $C97A, $CB7D             ; $06F555 |
  dw $CD81, $CF84, $D088, $D28B             ; $06F55D |
  dw $D48E, $D691, $D794, $DA93             ; $06F565 |
  dw $DB92, $DB67, $DA66, $D765             ; $06F56D |
  dw $D663, $D460, $D25D, $D05A             ; $06F575 |
  dw $CF56, $CD53, $CB4F, $C94B             ; $06F57D |
  dw $C846, $C642, $C43E, $C239             ; $06F585 |
  dw $C135, $BF31, $BD2E, $BB2A             ; $06F58D |
  dw $BA27, $B824, $B621                    ; $06F595 |

  dw $C533                                  ; $06F59B |
  dw $C236, $C03E, $C057, $C25F             ; $06F59D |
  dw $C562, $C665, $C767, $C869             ; $06F5A5 |
  dw $C96C, $CA6E, $CB71, $CC73             ; $06F5AD |
  dw $CD76, $CE79, $CE7B, $CF7D             ; $06F5B5 |
  dw $D080, $D183, $D285, $D388             ; $06F5BD |
  dw $D48A, $D58D, $D68F, $D691             ; $06F5C5 |
  dw $D794, $DA93, $DB92, $DB67             ; $06F5CD |
  dw $DA66, $D765, $D663, $D661             ; $06F5D5 |
  dw $D55F, $D45C, $D35A, $D257             ; $06F5DD |
  dw $D155, $D052, $CF4F, $CE4C             ; $06F5E5 |
  dw $CE4A, $CD47, $CC44, $CB42             ; $06F5ED |
  dw $CA3F, $C93D, $C83A, $C738             ; $06F5F5 |
  dw $C636                                  ; $06F5FD |

  dw $CF4C, $CC4F, $CA57                    ; $06F5FF |
  dw $CA70, $CC78, $CF7B, $D07D             ; $06F605 |
  dw $D07D, $D17E, $D180, $D181             ; $06F60D |
  dw $D282, $D283, $D385, $D386             ; $06F615 |
  dw $D387, $D488, $D48A, $D58B             ; $06F61D |
  dw $D58C, $D58D, $D68F, $D690             ; $06F625 |
  dw $D691, $D692, $D794, $DA93             ; $06F62D |
  dw $DB92, $DB67, $DA66, $D765             ; $06F635 |
  dw $D664, $D663, $D662, $D660             ; $06F63D |
  dw $D55F, $D55E, $D55D, $D45B             ; $06F645 |
  dw $D45A, $D359, $D358, $D356             ; $06F64D |
  dw $D255, $D254, $D153, $D151             ; $06F655 |
  dw $D150, $D04F, $D04E                    ; $06F65D |

  dw $D266                                  ; $06F663 |
  dw $CF69, $CD71, $CD8A, $CF92             ; $06F665 |
  dw $D295, $D394, $D394, $D394             ; $06F66D |
  dw $D394, $D494, $D494, $D494             ; $06F675 |
  dw $D494, $D594, $D594, $D594             ; $06F67D |
  dw $D594, $D694, $D694, $D694             ; $06F685 |
  dw $D694, $D694, $D694, $D694             ; $06F68D |
  dw $D794, $DA93, $DB92, $DB67             ; $06F695 |
  dw $DA66, $D765, $D666, $D666             ; $06F69D |
  dw $D666, $D666, $D666, $D666             ; $06F6A5 |
  dw $D666, $D566, $D566, $D566             ; $06F6AD |
  dw $D566, $D466, $D466, $D466             ; $06F6B5 |
  dw $D466, $D366, $D366, $D366             ; $06F6BD |
  dw $D366                                  ; $06F6C5 |

  dw $CB80, $C883, $C68B                    ; $06F6C7 |
  dw $C6A4, $C8AC, $CBAF, $CCAD             ; $06F6CD |
  dw $CDAC, $CDAB, $CEA9, $CEA8             ; $06F6D5 |
  dw $CFA7, $D0A5, $D0A4, $D1A2             ; $06F6DD |
  dw $D1A1, $D2A0, $D39E, $D39D             ; $06F6E5 |
  dw $D49B, $D49A, $D599, $D697             ; $06F6ED |
  dw $D696, $D695, $D794, $DA93             ; $06F6F5 |
  dw $DB92, $DB67, $DA66, $D765             ; $06F6FD |
  dw $D667, $D668, $D669, $D56B             ; $06F705 |
  dw $D46C, $D46D, $D36F, $D370             ; $06F70D |
  dw $D272, $D173, $D174, $D076             ; $06F715 |
  dw $D077, $CF79, $CE7A, $CE7B             ; $06F71D |
  dw $CD7D, $CD7D, $CC7E                    ; $06F725 |

  dw $B799                                  ; $06F72B |
  dw $B49C, $B2A4, $B2BD, $B4C5             ; $06F72D |
  dw $B7C8, $B9C6, $BBC4, $BCC2             ; $06F735 |
  dw $BEBF, $BFBD, $C1BA, $C3B7             ; $06F73D |
  dw $C4B4, $C6B1, $C7AE, $C9AA             ; $06F745 |
  dw $CBA7, $CCA4, $CEA1, $CF9E             ; $06F74D |
  dw $D19C, $D399, $D497, $D695             ; $06F755 |
  dw $D794, $DA93, $DB92, $DB67             ; $06F75D |
  dw $DA66, $D765, $D667, $D469             ; $06F765 |
  dw $D36B, $D16E, $CF70, $CE73             ; $06F76D |
  dw $CC76, $CB79, $C97C, $C77F             ; $06F775 |
  dw $C682, $C485, $C388, $C18B             ; $06F77D |
  dw $BF8E, $BE90, $BC93, $BB95             ; $06F785 |
  dw $B997                                  ; $06F78D |

  dw $95AE, $92B1, $90B9                    ; $06F78F |
  dw $90D2, $92DA, $95DD, $99DB             ; $06F795 |
  dw $9CD9, $9FD6, $A3D3, $A6D0             ; $06F79D |
  dw $A9CC, $ADC8, $B0C3, $B3BD             ; $06F7A5 |
  dw $B6B8, $BAB3, $BDAD, $C0A8             ; $06F7AD |
  dw $C4A4, $C7A0, $CA9D, $CE9A             ; $06F7B5 |
  dw $D197, $D495, $D794, $DA93             ; $06F7BD |
  dw $DB92, $DB67, $DA66, $D765             ; $06F7C5 |
  dw $D467, $D169, $CE6C, $CA6F             ; $06F7CD |
  dw $C772, $C476, $C07A, $BD7E             ; $06F7D5 |
  dw $BA84, $B689, $B38E, $B094             ; $06F7DD |
  dw $AD99, $A99D, $A6A1, $A3A4             ; $06F7E5 |
  dw $9FA7, $9CAA, $99AC                    ; $06F7ED |

  dw $6BBF                                  ; $06F7F3 |
  dw $68C2, $66CA, $66E3, $68EB             ; $06F7F5 |
  dw $6BEE, $71EC, $76EA, $7CE8             ; $06F7FD |
  dw $81E5, $86E1, $8CDC, $91D6             ; $06F805 |
  dw $97CF, $9CC8, $A1C1, $A7B9             ; $06F80D |
  dw $ACB2, $B2AB, $B7A5, $BCA0             ; $06F815 |
  dw $C29C, $C799, $CD97, $D295             ; $06F81D |
  dw $D794, $DA93, $DB92, $DB67             ; $06F825 |
  dw $DA66, $D765, $D267, $CD69             ; $06F82D |
  dw $C76B, $C26E, $BC72, $B777             ; $06F835 |
  dw $B27D, $AC83, $A78A, $A192             ; $06F83D |
  dw $9C99, $97A0, $91A7, $8CAD             ; $06F845 |
  dw $86B2, $81B6, $7CB9, $76BB             ; $06F84D |
  dw $71BD                                  ; $06F855 |

  dw $39C9, $36CC, $34D4                    ; $06F857 |
  dw $34ED, $36F5, $39F8, $41F7             ; $06F85D |
  dw $49F6, $51F5, $59F2, $61ED             ; $06F865 |
  dw $69E8, $71E1, $79D8, $81CF             ; $06F86D |
  dw $88C6, $90BC, $98B3, $A0AA             ; $06F875 |
  dw $A8A3, $B09E, $B899, $C096             ; $06F87D |
  dw $C895, $D094, $D794, $DA93             ; $06F885 |
  dw $DB92, $DB67, $DA66, $D765             ; $06F88D |
  dw $D066, $C867, $C068, $B86B             ; $06F895 |
  dw $B070, $A875, $A07C, $9884             ; $06F89D |
  dw $908D, $8897, $81A0, $79A9             ; $06F8A5 |
  dw $71B2, $69B9, $61BE, $59C3             ; $06F8AD |
  dw $51C6, $49C7, $41C8                    ; $06F8B5 |

  dw $05CC                                  ; $06F8BB |
  dw $02CF, $00D7, $00F0, $02F8             ; $06F8BD |
  dw $05FB, $10FC, $1AFC, $25FB             ; $06F8C5 |
  dw $2FF9, $3AF5, $44EF, $4FE7             ; $06F8CD |
  dw $59DD, $64D2, $6EC7, $79BC             ; $06F8D5 |
  dw $83B1, $8EA7, $989F, $A399             ; $06F8DD |
  dw $AD95, $B893, $C292, $CD92             ; $06F8E5 |
  dw $D794, $DA93, $DB92, $DB67             ; $06F8ED |
  dw $DA66, $D765, $CD64, $C264             ; $06F8F5 |
  dw $B865, $AD67, $A36B, $9871             ; $06F8FD |
  dw $8E79, $8382, $798D, $6E98             ; $06F905 |
  dw $64A3, $59AE, $4FB8, $44C0             ; $06F90D |
  dw $3AC6, $2FCA, $25CC, $1ACD             ; $06F915 |
  dw $10CD                                  ; $06F91D |

; uncompressed graphics files
  dl $520000                                ; $06F91F |
  dl $528000                                ; $06F922 |
  dl $52C000                                ; $06F925 |
  dl $530000                                ; $06F928 |
  dl $538000                                ; $06F92B |
  dl $53C000                                ; $06F92E |
  dl $540000                                ; $06F931 |
  dl $548000                                ; $06F934 |
  dl $550000                                ; $06F937 |
  dl $558000                                ; $06F93A |
  dl $560000                                ; $06F93D |
  dl $566000                                ; $06F940 |
  dl $568000                                ; $06F943 |
  dl $569000                                ; $06F946 |
  dl $56A000                                ; $06F949 |
  dl $56B000                                ; $06F94C |
  dl $56C000                                ; $06F94F |
  dl $56D000                                ; $06F952 |
  dl $56E800                                ; $06F955 |
  dl $56EC00                                ; $06F958 |
  dl $56FC00                                ; $06F95B |

; compression routine $08A980 graphics files
  dl $573C00                                ; $06F95E |
  dl $5748E9                                ; $06F961 |
  dl $57555B                                ; $06F964 |
  dl $576234                                ; $06F967 |
  dl $576EAB                                ; $06F96A |
  dl $5778F9                                ; $06F96D |
  dl $57826C                                ; $06F970 |
  dl $578DB8                                ; $06F973 |
  dl $579952                                ; $06F976 |
  dl $57A56A                                ; $06F979 |
  dl $57AECB                                ; $06F97C |
  dl $57B9B0                                ; $06F97F |
  dl $57C271                                ; $06F982 |
  dl $57CEA1                                ; $06F985 |
  dl $57DBBA                                ; $06F988 |
  dl $57E85A                                ; $06F98B |
  dl $57F3C7                                ; $06F98E |
  dl $57F85E                                ; $06F991 |
  dl $57FDEA                                ; $06F994 |
  dl $58025D                                ; $06F997 |
  dl $5803E1                                ; $06F99A |
  dl $5808D6                                ; $06F99D |
  dl $580C65                                ; $06F9A0 |
  dl $580FCD                                ; $06F9A3 |
  dl $5814E1                                ; $06F9A6 |
  dl $581B2C                                ; $06F9A9 |
  dl $581FDA                                ; $06F9AC |
  dl $5822D0                                ; $06F9AF |
  dl $58285E                                ; $06F9B2 |
  dl $582FC1                                ; $06F9B5 |
  dl $5835E2                                ; $06F9B8 |
  dl $583C34                                ; $06F9BB |
  dl $584016                                ; $06F9BE |
  dl $58451B                                ; $06F9C1 |
  dl $584A74                                ; $06F9C4 |
  dl $584FBF                                ; $06F9C7 |
  dl $585A68                                ; $06F9CA |
  dl $586597                                ; $06F9CD |
  dl $58720F                                ; $06F9D0 |
  dl $587E21                                ; $06F9D3 |
  dl $5883AF                                ; $06F9D6 |
  dl $5888CD                                ; $06F9D9 |
  dl $588E8F                                ; $06F9DC |
  dl $589574                                ; $06F9DF |
  dl $589AE6                                ; $06F9E2 |
  dl $589D4F                                ; $06F9E5 |
  dl $589FC4                                ; $06F9E8 |
  dl $58A2CD                                ; $06F9EB |
  dl $58A5D2                                ; $06F9EE |
  dl $58B241                                ; $06F9F1 |
  dl $58BE20                                ; $06F9F4 |
  dl $58C992                                ; $06F9F7 |
  dl $58D774                                ; $06F9FA |
  dl $58E471                                ; $06F9FD |
  dl $58EE33                                ; $06FA00 |
  dl $58F928                                ; $06FA03 |
  dl $5902AB                                ; $06FA06 |
  dl $590E7D                                ; $06FA09 |
  dl $591A64                                ; $06FA0C |
  dl $592757                                ; $06FA0F |
  dl $593432                                ; $06FA12 |
  dl $5941AC                                ; $06FA15 |
  dl $594E69                                ; $06FA18 |
  dl $595892                                ; $06FA1B |
  dl $5964EC                                ; $06FA1E |
  dl $597241                                ; $06FA21 |
  dl $597F14                                ; $06FA24 |
  dl $598ABB                                ; $06FA27 |
  dl $5996AF                                ; $06FA2A |
  dl $599C37                                ; $06FA2D |
  dl $59A7C1                                ; $06FA30 |
  dl $59B3E4                                ; $06FA33 |
  dl $59C08B                                ; $06FA36 |
  dl $59CD17                                ; $06FA39 |
  dl $59D92C                                ; $06FA3C |
  dl $59ED9E                                ; $06FA3F |
  dl $5A05C4                                ; $06FA42 |
  dl $5A1135                                ; $06FA45 |
  dl $5A17A3                                ; $06FA48 |
  dl $5A1CED                                ; $06FA4B |
  dl $5A235C                                ; $06FA4E |
  dl $5A28D6                                ; $06FA51 |
  dl $5A2EE2                                ; $06FA54 |
  dl $5A3453                                ; $06FA57 |
  dl $5A3944                                ; $06FA5A |
  dl $5A4110                                ; $06FA5D |
  dl $5A4608                                ; $06FA60 |
  dl $5A4C5F                                ; $06FA63 |
  dl $5A53A6                                ; $06FA66 |
  dl $5A5905                                ; $06FA69 |
  dl $5A5E25                                ; $06FA6C |
  dl $5A64A1                                ; $06FA6F |
  dl $5A6952                                ; $06FA72 |
  dl $5A6DE8                                ; $06FA75 |
  dl $5A736D                                ; $06FA78 |
  dl $5A7994                                ; $06FA7B |
  dl $5A8748                                ; $06FA7E |
  dl $5A9257                                ; $06FA81 |
  dl $5A97E0                                ; $06FA84 |
  dl $5A9C3D                                ; $06FA87 |
  dl $5AA0EF                                ; $06FA8A |
  dl $5AA75A                                ; $06FA8D |
  dl $5AAD40                                ; $06FA90 |
  dl $5AB189                                ; $06FA93 |
  dl $5AB630                                ; $06FA96 |
  dl $5ABC4D                                ; $06FA99 |
  dl $5ACAD1                                ; $06FA9C |
  dl $5AD992                                ; $06FA9F |
  dl $5AE7A0                                ; $06FAA2 |
  dl $5AF2D5                                ; $06FAA5 |
  dl $5AFE28                                ; $06FAA8 |
  dl $5B03C0                                ; $06FAAB |
  dl $5B08CC                                ; $06FAAE |
  dl $5B0C94                                ; $06FAB1 |
  dl $5B121D                                ; $06FAB4 |
  dl $5B17A1                                ; $06FAB7 |
  dl $5B1A25                                ; $06FABA |
  dl $5B1CC2                                ; $06FABD |
  dl $5B2058                                ; $06FAC0 |
  dl $5B2323                                ; $06FAC3 |
  dl $5B25DB                                ; $06FAC6 |
  dl $5B278F                                ; $06FAC9 |
  dl $5B28B2                                ; $06FACC |
  dl $5B2A43                                ; $06FACF |
  dl $5B2BAB                                ; $06FAD2 |
  dl $5B2EA9                                ; $06FAD5 |
  dl $5B32B7                                ; $06FAD8 |
  dl $5B35C3                                ; $06FADB |
  dl $5B3942                                ; $06FADE |
  dl $5B3C69                                ; $06FAE1 |
  dl $5B40C4                                ; $06FAE4 |
  dl $5B457B                                ; $06FAE7 |
  dl $5B4937                                ; $06FAEA |
  dl $5B4D88                                ; $06FAED |
  dl $5B51E9                                ; $06FAF0 |
  dl $5B561D                                ; $06FAF3 |
  dl $5B5A43                                ; $06FAF6 |
  dl $5B5DE5                                ; $06FAF9 |
  dl $5B6042                                ; $06FAFC |
  dl $5B6270                                ; $06FAFF |
  dl $5B6446                                ; $06FB02 |
  dl $5B6718                                ; $06FB05 |
  dl $5B69A5                                ; $06FB08 |
  dl $5B6C06                                ; $06FB0B |
  dl $5B6DDC                                ; $06FB0E |
  dl $5B70B5                                ; $06FB11 |
  dl $5B7361                                ; $06FB14 |
  dl $5B75AB                                ; $06FB17 |
  dl $5B77F0                                ; $06FB1A |
  dl $5B7AA3                                ; $06FB1D |
  dl $5B7B89                                ; $06FB20 |
  dl $5B7D18                                ; $06FB23 |
  dl $5B7EBC                                ; $06FB26 |
  dl $5B8070                                ; $06FB29 |
  dl $5B83C7                                ; $06FB2C |
  dl $5B85A0                                ; $06FB2F |
  dl $5B8C16                                ; $06FB32 |
  dl $5B8CE5                                ; $06FB35 |
  dl $5B8D8F                                ; $06FB38 |
  dl $5B8E39                                ; $06FB3B |
  dl $5B8F62                                ; $06FB3E |
  dl $5B9179                                ; $06FB41 |
  dl $5B92A1                                ; $06FB44 |
  dl $5B92AD                                ; $06FB47 |
  dl $5B93BC                                ; $06FB4A |
  dl $5B93C8                                ; $06FB4D |
  dl $5B94C1                                ; $06FB50 |
  dl $5B9588                                ; $06FB53 |
  dl $5B9669                                ; $06FB56 |
  dl $5B9A2E                                ; $06FB59 |
  dl $5B9BF5                                ; $06FB5C |
  dl $5B9F48                                ; $06FB5F |
  dl $5BA1BE                                ; $06FB62 |
  dl $5BA405                                ; $06FB65 |
  dl $5BA6A5                                ; $06FB68 |
  dl $5BA99E                                ; $06FB6B |
  dl $5BAD4E                                ; $06FB6E |
  dl $5BAE23                                ; $06FB71 |
  dl $5BBAC5                                ; $06FB74 |
  dl $5BBE47                                ; $06FB77 |
  dl $5BC472                                ; $06FB7A |
  dl $5BCB3F                                ; $06FB7D |
  dl $5BD161                                ; $06FB80 |
  dl $5BD781                                ; $06FB83 |
  dl $5BDC95                                ; $06FB86 |
  dl $5BE14B                                ; $06FB89 |
  dl $5BE7E6                                ; $06FB8C |
  dl $5BEDDD                                ; $06FB8F |
  dl $5BF3C3                                ; $06FB92 |
  dl $5BF986                                ; $06FB95 |
  dl $5BFCA8                                ; $06FB98 |
  dl $5C0892                                ; $06FB9B |
  dl $5C0BEA                                ; $06FB9E |
  dl $5C12CD                                ; $06FBA1 |
  dl $5C145A                                ; $06FBA4 |
  dl $5C1996                                ; $06FBA7 |
  dl $5C1BFA                                ; $06FBAA |
  dl $5C1DA2                                ; $06FBAD |
  dl $5C1ED3                                ; $06FBB0 |
  dl $5C24BA                                ; $06FBB3 |
  dl $5C2658                                ; $06FBB6 |
  dl $5C28B0                                ; $06FBB9 |
  dl $5C2A9D                                ; $06FBBC |
  dl $5C340D                                ; $06FBBF |
  dl $5C3545                                ; $06FBC2 |
  dl $5C3A30                                ; $06FBC5 |
  dl $5C3D29                                ; $06FBC8 |
  dl $5C3EDA                                ; $06FBCB |
  dl $5C437B                                ; $06FBCE |
  dl $5C4711                                ; $06FBD1 |
  dl $5C490A                                ; $06FBD4 |
  dl $5C50AB                                ; $06FBD7 |
  dl $5C532C                                ; $06FBDA |
  dl $5C5727                                ; $06FBDD |
  dl $5C573B                                ; $06FBE0 |
  dl $5C5839                                ; $06FBE3 |
  dl $5C5CA3                                ; $06FBE6 |
  dl $5C5D18                                ; $06FBE9 |
  dl $5C6148                                ; $06FBEC |
  dl $5C63B8                                ; $06FBEF |
  dl $5C654D                                ; $06FBF2 |
  dl $5C6564                                ; $06FBF5 |
  dl $5C6790                                ; $06FBF8 |
  dl $5C69A5                                ; $06FBFB |
  dl $5C6C1C                                ; $06FBFE |
  dl $5C6E1A                                ; $06FC01 |
  dl $5C6E26                                ; $06FC04 |
  dl $5C6E32                                ; $06FC07 |
  dl $5C6E3E                                ; $06FC0A |
  dl $5C7083                                ; $06FC0D |
  dl $5C7170                                ; $06FC10 |
  dl $5C7532                                ; $06FC13 |
  dl $5C7782                                ; $06FC16 |
  dl $5C7A54                                ; $06FC19 |
  dl $5C7C40                                ; $06FC1C |
  dl $5C7D9D                                ; $06FC1F |
  dl $5C7FD3                                ; $06FC22 |
  dl $5C84DD                                ; $06FC25 |
  dl $5C84EE                                ; $06FC28 |
  dl $5C8653                                ; $06FC2B |
  dl $5C86E9                                ; $06FC2E |
  dl $5C8892                                ; $06FC31 |
  dl $5C8A60                                ; $06FC34 |
  dl $5C8DA4                                ; $06FC37 |
  dl $5C8DC6                                ; $06FC3A |
  dl $5C8EF6                                ; $06FC3D |
  dl $5C9024                                ; $06FC40 |
  dl $5C90C8                                ; $06FC43 |
  dl $5C9456                                ; $06FC46 |
  dl $5C94CD                                ; $06FC49 |
  dl $5C97A4                                ; $06FC4C |
  dl $5C981D                                ; $06FC4F |
  dl $5C98D3                                ; $06FC52 |
  dl $5C9AC1                                ; $06FC55 |
  dl $5C9D51                                ; $06FC58 |
  dl $5CA15C                                ; $06FC5B |
  dl $5CA51B                                ; $06FC5E |
  dl $5CA62A                                ; $06FC61 |
  dl $5CA824                                ; $06FC64 |
  dl $5CACB2                                ; $06FC67 |
  dl $5CAF37                                ; $06FC6A |
  dl $5CB2B0                                ; $06FC6D |
  dl $5CB518                                ; $06FC70 |
  dl $5CB71B                                ; $06FC73 |
  dl $5CB929                                ; $06FC76 |

; compression routine $0A8000 graphics files
  dl $5CBA89                                ; $06FC79 |
  dl $5CC342                                ; $06FC7C |
  dl $5CCB44                                ; $06FC7F |
  dl $5CD671                                ; $06FC82 |
  dl $5CDFC6                                ; $06FC85 |
  dl $5CE630                                ; $06FC88 |
  dl $5CEEE1                                ; $06FC8B |
  dl $5CF376                                ; $06FC8E |
  dl $5CF91E                                ; $06FC91 |
  dl $5CFF0B                                ; $06FC94 |
  dl $5D04ED                                ; $06FC97 |
  dl $5D0FEB                                ; $06FC9A |
  dl $5D180F                                ; $06FC9D |
  dl $5D1FFF                                ; $06FCA0 |
  dl $5D26DE                                ; $06FCA3 |
  dl $5D2F69                                ; $06FCA6 |
  dl $5D351B                                ; $06FCA9 |
  dl $5D3A65                                ; $06FCAC |
  dl $5D3F7A                                ; $06FCAF |
  dl $5D4050                                ; $06FCB2 |
  dl $5D46D0                                ; $06FCB5 |
  dl $5D4B93                                ; $06FCB8 |
  dl $5D511D                                ; $06FCBB |
  dl $5D57EE                                ; $06FCBE |
  dl $5D5D3A                                ; $06FCC1 |
  dl $5D6469                                ; $06FCC4 |
  dl $5D6ACF                                ; $06FCC7 |
  dl $5D6C99                                ; $06FCCA |
  dl $5D6DAC                                ; $06FCCD |
  dl $5D6EA2                                ; $06FCD0 |
  dl $5D7033                                ; $06FCD3 |
  dl $5D728B                                ; $06FCD6 |
  dl $5D7466                                ; $06FCD9 |
  dl $5D7623                                ; $06FCDC |
  dl $5D7810                                ; $06FCDF |
  dl $5D79BB                                ; $06FCE2 |
  dl $5D7B30                                ; $06FCE5 |
  dl $5D7C85                                ; $06FCE8 |
  dl $5D7E57                                ; $06FCEB |
  dl $5D80A3                                ; $06FCEE |
  dl $5D82C8                                ; $06FCF1 |
  dl $5D845B                                ; $06FCF4 |
  dl $5D86B4                                ; $06FCF7 |
  dl $5D87F8                                ; $06FCFA |
  dl $5D8990                                ; $06FCFD |
  dl $5D8B43                                ; $06FD00 |
  dl $5D8D2D                                ; $06FD03 |
  dl $5D8E69                                ; $06FD06 |
  dl $5D8FC6                                ; $06FD09 |
  dl $5D90F8                                ; $06FD0C |
  dl $5D9242                                ; $06FD0F |
  dl $5D93BD                                ; $06FD12 |
  dl $5D952A                                ; $06FD15 |
  dl $5D969C                                ; $06FD18 |
  dl $5D98F0                                ; $06FD1B |
  dl $5D9AEC                                ; $06FD1E |
  dl $5D9C49                                ; $06FD21 |
  dl $5D9DC6                                ; $06FD24 |
  dl $5D9FFA                                ; $06FD27 |
  dl $5DA191                                ; $06FD2A |
  dl $5DA389                                ; $06FD2D |
  dl $5DA536                                ; $06FD30 |
  dl $5DA714                                ; $06FD33 |
  dl $5DA960                                ; $06FD36 |
  dl $5DAB59                                ; $06FD39 |
  dl $5DACF1                                ; $06FD3C |
  dl $5DAE74                                ; $06FD3F |
  dl $5DAFBA                                ; $06FD42 |
  dl $5DB0F3                                ; $06FD45 |
  dl $5DB321                                ; $06FD48 |
  dl $5DB48B                                ; $06FD4B |
  dl $5DB5F0                                ; $06FD4E |
  dl $5DB80E                                ; $06FD51 |
  dl $5DBA3E                                ; $06FD54 |
  dl $5DBC21                                ; $06FD57 |
  dl $5DBDC1                                ; $06FD5A |
  dl $5DBF2C                                ; $06FD5D |
  dl $5DC0DF                                ; $06FD60 |
  dl $5DC1EC                                ; $06FD63 |
  dl $5DC3EF                                ; $06FD66 |
  dl $5DC58C                                ; $06FD69 |
  dl $5DC70B                                ; $06FD6C |
  dl $5DC885                                ; $06FD6F |
  dl $5DC947                                ; $06FD72 |
  dl $5DCA3E                                ; $06FD75 |
  dl $5DCC2E                                ; $06FD78 |
  dl $5DCE2B                                ; $06FD7B |
  dl $5DCFDF                                ; $06FD7E |
  dl $5DD119                                ; $06FD81 |
  dl $5DD286                                ; $06FD84 |
  dl $5DD445                                ; $06FD87 |
  dl $5DD5FB                                ; $06FD8A |
  dl $5DD7C6                                ; $06FD8D |
  dl $5DD930                                ; $06FD90 |
  dl $5DDAF4                                ; $06FD93 |
  dl $5DDCCE                                ; $06FD96 |
  dl $5DDE10                                ; $06FD99 |
  dl $5DDFB0                                ; $06FD9C |
  dl $5DE0E8                                ; $06FD9F |
  dl $5DE1DC                                ; $06FDA2 |
  dl $5DE3A5                                ; $06FDA5 |
  dl $5DE581                                ; $06FDA8 |
  dl $5DE6E9                                ; $06FDAB |
  dl $5DE8AE                                ; $06FDAE |
  dl $5DEA53                                ; $06FDB1 |
  dl $5DEC4C                                ; $06FDB4 |
  dl $5DEDF4                                ; $06FDB7 |
  dl $5DEFCA                                ; $06FDBA |
  dl $5DF13D                                ; $06FDBD |
  dl $5DF2C3                                ; $06FDC0 |
  dl $5DF399                                ; $06FDC3 |
  dl $5DF4BE                                ; $06FDC6 |
  dl $5DF5A6                                ; $06FDC9 |
  dl $5DF70A                                ; $06FDCC |
  dl $5DF804                                ; $06FDCF |
  dl $5E03D3                                ; $06FDD2 |
  dl $5E0596                                ; $06FDD5 |
  dl $5E0750                                ; $06FDD8 |
  dl $5E0956                                ; $06FDDB |
  dl $5E0AB6                                ; $06FDDE |
  dl $5E0F30                                ; $06FDE1 |
  dl $5E16FA                                ; $06FDE4 |
  dl $5E1DD1                                ; $06FDE7 |
  dl $5E2450                                ; $06FDEA |
  dl $5E2E3F                                ; $06FDED |
  dl $5E3939                                ; $06FDF0 |
  dl $5E3E16                                ; $06FDF3 |
  dl $5E42AC                                ; $06FDF6 |
  dl $5E4D55                                ; $06FDF9 |
  dl $5E57A7                                ; $06FDFC |
  dl $5E5E4B                                ; $06FDFF |
  dl $5E6583                                ; $06FE02 |
  dl $5E6AAE                                ; $06FE05 |
  dl $5E70E0                                ; $06FE08 |
  dl $5E77FD                                ; $06FE0B |
  dl $5E829F                                ; $06FE0E |
  dl $5E9360                                ; $06FE11 |
  dl $5EA7C0                                ; $06FE14 |
  dl $5EBA21                                ; $06FE17 |
  dl $5EC639                                ; $06FE1A |
  dl $5ED157                                ; $06FE1D |
  dl $5ED7BE                                ; $06FE20 |
  dl $5EE3D2                                ; $06FE23 |
  dl $5EE999                                ; $06FE26 |
  dl $5EEC88                                ; $06FE29 |
  dl $5EF3B1                                ; $06FE2C |
  dl $5EF5DC                                ; $06FE2F |
  dl $5EF845                                ; $06FE32 |
  dl $5EFA6E                                ; $06FE35 |
  dl $5EFCD6                                ; $06FE38 |
  dl $5EFEFF                                ; $06FE3B |
  dl $5F01FE                                ; $06FE3E |
  dl $5F0576                                ; $06FE41 |
  dl $5F0922                                ; $06FE44 |
  dl $5F0BBB                                ; $06FE47 |
  dl $5F10E1                                ; $06FE4A |
  dl $5F15BA                                ; $06FE4D |
  dl $5F1960                                ; $06FE50 |
  dl $5F1D97                                ; $06FE53 |
  dl $5F21AB                                ; $06FE56 |
  dl $5F25FB                                ; $06FE59 |
  dl $5F2948                                ; $06FE5C |
  dl $5F2CAC                                ; $06FE5F |
  dl $5F2EB0                                ; $06FE62 |
  dl $5F3352                                ; $06FE65 |
  dl $5F3A70                                ; $06FE68 |
  dl $5F4013                                ; $06FE6B |
  dl $5F45B7                                ; $06FE6E |
  dl $5F4D68                                ; $06FE71 |
  dl $5F5485                                ; $06FE74 |
  dl $5F55D7                                ; $06FE77 |
  dl $5F5742                                ; $06FE7A |
  dl $5F5942                                ; $06FE7D |
  dl $5F5B92                                ; $06FE80 |
  dl $5F5D48                                ; $06FE83 |
  dl $5F5F21                                ; $06FE86 |
  dl $5F6126                                ; $06FE89 |
  dl $5F62D2                                ; $06FE8C |
  dl $5F6925                                ; $06FE8F |
  dl $5F6E88                                ; $06FE92 |
  dl $5F725C                                ; $06FE95 |
  dl $5F7906                                ; $06FE98 |
  dl $5F7AC9                                ; $06FE9B |
  dl $5F7CE1                                ; $06FE9E |
  dl $5F7EA6                                ; $06FEA1 |
  dl $5F80B8                                ; $06FEA4 |
  dl $5F8589                                ; $06FEA7 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEAA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEB2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEBA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEC2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FECA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FED2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEDA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEE2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEEA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEF2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FEFA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF02 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF0A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF12 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF1A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF22 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF2A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF32 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF3A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF42 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF4A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF52 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF5A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF62 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF6A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF72 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF7A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF82 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF8A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF92 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FF9A |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFA2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFAA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFB2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFBA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFC2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFCA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFD2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFDA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFE2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFEA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $06FFF2 |
  db $FF, $FF, $FF, $FF, $FF, $FF           ; $06FFFA |
