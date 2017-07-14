org $058000

CODE_058000:
  STA $0C                                   ; $058000 |
  ASL A                                     ; $058002 |
  STA $0E                                   ; $058003 |
  LDA !s_spr_x_player_delta,x               ; $058005 |
  STA !gsu_r1                               ; $058008 |
  LDA !s_spr_y_player_delta,x               ; $05800B |
  STA !gsu_r2                               ; $05800E |
  LDX #$0B                                  ; $058011 |
  LDA #$BCF8                                ; $058013 |
  JSL r_gsu_init_1                          ; $058016 | GSU init
  LDX $12                                   ; $05801A |
  LDA !s_spr_wildcard_2_lo,x                ; $05801C |
  PHA                                       ; $05801F |
  SEC                                       ; $058020 |
  SBC !gsu_r0                               ; $058021 |
  CLC                                       ; $058024 |
  ADC $0C                                   ; $058025 |
  CMP $0E                                   ; $058027 |
  BCC CODE_058043                           ; $058029 |
  BMI CODE_058038                           ; $05802B |
  CMP #$0100                                ; $05802D |
  BCS CODE_05803D                           ; $058030 |

CODE_058032:
  PLA                                       ; $058032 |
  SEC                                       ; $058033 |
  SBC $0C                                   ; $058034 |
  BRA CODE_058044                           ; $058036 |

CODE_058038:
  CMP #$FF00                                ; $058038 |
  BCC CODE_058032                           ; $05803B |

CODE_05803D:
  PLA                                       ; $05803D |
  CLC                                       ; $05803E |
  ADC $0C                                   ; $05803F |
  BRA CODE_058044                           ; $058041 |

CODE_058043:
  PLA                                       ; $058043 |

CODE_058044:
  AND #$01FE                                ; $058044 |
  STA !s_spr_wildcard_2_lo,x                ; $058047 |
  SEC                                       ; $05804A |
  SBC #$0080                                ; $05804B |
  CMP #$0100                                ; $05804E |
  BCS CODE_05805F                           ; $058051 |
  STZ !s_spr_facing_dir,x                   ; $058053 |
  LDA !s_spr_wildcard_2_lo,x                ; $058056 |
  CLC                                       ; $058059 |
  ADC #$0100                                ; $05805A |
  BRA CODE_05806C                           ; $05805D |

CODE_05805F:
  LDA #$0002                                ; $05805F |
  STA !s_spr_facing_dir,x                   ; $058062 |
  LDA !s_spr_wildcard_2_lo,x                ; $058065 |
  EOR #$FFFF                                ; $058068 |
  INC A                                     ; $05806B |

CODE_05806C:
  AND #$01FE                                ; $05806C |
  STA !s_spr_gsu_morph_2_lo,x               ; $05806F |
  RTS                                       ; $058072 |

CODE_058073:
  LDA !s_spr_x_speed_lo,x                   ; $058073 |
  CMP #$8000                                ; $058076 |
  ROR A                                     ; $058079 |
  CMP #$8000                                ; $05807A |
  ROR A                                     ; $05807D |
  STA !gsu_r1                               ; $05807E |
  LDA !s_spr_y_speed_lo,x                   ; $058081 |
  CMP #$8000                                ; $058084 |
  ROR A                                     ; $058087 |
  CMP #$8000                                ; $058088 |
  ROR A                                     ; $05808B |
  STA !gsu_r2                               ; $05808C |
  LDX #$0B                                  ; $05808F |
  LDA #$BCF8                                ; $058091 |
  JSL r_gsu_init_1                          ; $058094 | GSU init
  LDX $12                                   ; $058098 |
  LDA !gsu_r0                               ; $05809A |
  SEC                                       ; $05809D |
  SBC #$0080                                ; $05809E |
  CMP #$0100                                ; $0580A1 |
  BCS CODE_0580B5                           ; $0580A4 |
  LDA #$0002                                ; $0580A6 |
  STA !s_spr_facing_dir,x                   ; $0580A9 |
  LDA #$0100                                ; $0580AC |
  SEC                                       ; $0580AF |
  SBC !gsu_r0                               ; $0580B0 |
  BRA CODE_0580BB                           ; $0580B3 |

CODE_0580B5:
  STZ !s_spr_facing_dir,x                   ; $0580B5 |
  LDA !gsu_r0                               ; $0580B8 |

CODE_0580BB:
  AND #$01FE                                ; $0580BB |
  STA !s_spr_gsu_morph_2_lo,x               ; $0580BE |
  RTS                                       ; $0580C1 |

; bucket state 03
  TYX                                       ; $0580C2 |
  RTS                                       ; $0580C3 |

; the ones that give you a single red/yellow/flashing egg
init_egg_block:
  JSL $03D406                               ; $0580C4 |
  LDA !s_spr_id,x                           ; $0580C8 |
  SEC                                       ; $0580CB |
  SBC #$0068                                ; $0580CC |
  ASL A                                     ; $0580CF |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0580D0 |
  LDA #$0100                                ; $0580D2 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0580D5 |
  RTL                                       ; $0580D8 |

  dw $8234                                  ; $0580D9 |
  dw $827D                                  ; $0580DB |

main_flashing_egg_block:
  JSL $03B75E                               ; $0580DD |

; the ones that give you a single red/yellow egg
main_egg_block:
  STZ !s_spr_facing_dir,x                   ; $0580E1 |
  LDY !s_spr_anim_frame,x                   ; $0580E4 |
  BEQ CODE_0580ED                           ; $0580E7 |
  JSL $03AA52                               ; $0580E9 |

CODE_0580ED:
  JSL $03AF23                               ; $0580ED |
  TXY                                       ; $0580F1 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0580F2 |
  ASL A                                     ; $0580F4 |
  TAX                                       ; $0580F5 |
  JSR ($80D9,x)                             ; $0580F6 |
  JSR CODE_058120                           ; $0580F9 |
  LDY !s_spr_anim_frame,x                   ; $0580FC |
  BEQ CODE_058104                           ; $0580FF |
  JSR CODE_058161                           ; $058101 |

CODE_058104:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $058104 |
  BEQ CODE_058109                           ; $058106 |
  RTL                                       ; $058108 |

CODE_058109:
  JSL $03D291                               ; $058109 |
  LDY !s_on_sprite_platform_flag            ; $05810D |
  PHY                                       ; $058110 |
  JSL $03D22D                               ; $058111 |
  PLY                                       ; $058115 |
  CPY !s_on_sprite_platform_flag            ; $058116 |
  BNE CODE_05811F                           ; $058119 |
  JSL $03D127                               ; $05811B |

CODE_05811F:
  RTL                                       ; $05811F |

CODE_058120:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $058120 |
  BEQ CODE_05813C                           ; $058122 |
  LDY !s_spr_collision_id,x                 ; $058124 |
  DEY                                       ; $058127 |
  BMI CODE_05813C                           ; $058128 |
  LDA !s_spr_y_pixel_pos,y                  ; $05812A |
  CMP !s_spr_y_pixel_pos,x                  ; $05812D |
  BPL CODE_05813C                           ; $058130 |
  LDA !s_spr_y_accel_ceiling,y              ; $058132 |
  EOR #$FFFF                                ; $058135 |
  INC A                                     ; $058138 |
  STA !s_spr_y_speed_lo,y                   ; $058139 |

CODE_05813C:
  RTS                                       ; $05813C |

  dw $0100, $01FF                           ; $05813D |
  dw $00CC, $01FF                           ; $058141 |
  dw $0100, $0199                           ; $058145 |

  dw $0050, $FFB0, $0060, $FF9E             ; $058149 |
  dw $0028, $FFD8                           ; $058151 |

  dw $7040, $B070, $A070                    ; $058155 |

  dw $0054, $0054, $0054                    ; $05815B |

CODE_058161:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $058161 |
  PHA                                       ; $058163 |
  ASL A                                     ; $058164 |
  TAY                                       ; $058165 |
  LDA !s_spr_y_speed_lo,x                   ; $058166 |
  BMI CODE_05816D                           ; $058169 |
  INY                                       ; $05816B |
  INY                                       ; $05816C |

CODE_05816D:
  LDA $8149,y                               ; $05816D |
  STA $00                                   ; $058170 |
  PLA                                       ; $058172 |
  ASL A                                     ; $058173 |
  TAY                                       ; $058174 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $058175 |
  CLC                                       ; $058178 |
  ADC $00                                   ; $058179 |
  CMP $813D,y                               ; $05817B |
  BCS CODE_058185                           ; $05817E |
  LDA $813D,y                               ; $058180 |
  BRA CODE_05818D                           ; $058183 |

CODE_058185:
  CMP $813F,y                               ; $058185 |
  BCC CODE_05818D                           ; $058188 |
  LDA $813F,y                               ; $05818A |

CODE_05818D:
  STA !s_spr_gsu_morph_1_lo,x               ; $05818D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $058190 |
  CPY #$04                                  ; $058192 |
  BEQ CODE_0581CE                           ; $058194 |
  PHY                                       ; $058196 |
  LDY #$00                                  ; $058197 |
  LDA !s_spr_y_speed_lo,x                   ; $058199 |
  CMP #$FF80                                ; $05819C |
  BMI CODE_0581AA                           ; $05819F |
  INY                                       ; $0581A1 |
  INY                                       ; $0581A2 |
  CMP #$0200                                ; $0581A3 |
  BMI CODE_0581AA                           ; $0581A6 |
  INY                                       ; $0581A8 |
  INY                                       ; $0581A9 |

CODE_0581AA:
  LDA $8155,y                               ; $0581AA |
  STA !gsu_r12                              ; $0581AD |
  LDA $815B,y                               ; $0581B0 |
  STA !gsu_r13                              ; $0581B3 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0581B6 |
  STA !gsu_r6                               ; $0581B9 |
  PLY                                       ; $0581BC |
  BEQ CODE_0581E3                           ; $0581BD |
  SEC                                       ; $0581BF |
  SBC #$0100                                ; $0581C0 |
  LSR A                                     ; $0581C3 |
  STA $00                                   ; $0581C4 |
  LDA #$0100                                ; $0581C6 |
  SEC                                       ; $0581C9 |
  SBC $00                                   ; $0581CA |
  BRA CODE_0581E3                           ; $0581CC |

CODE_0581CE:
  LDA #$4081                                ; $0581CE |
  STA !gsu_r12                              ; $0581D1 |
  LDA #$0054                                ; $0581D4 |
  STA !gsu_r13                              ; $0581D7 |
  LDA #$00CE                                ; $0581DA |
  STA !gsu_r6                               ; $0581DD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0581E0 |

CODE_0581E3:
  STA !gsu_r11                              ; $0581E3 |
  LDA !s_spr_dyntile_index,x                ; $0581E6 |
  TAX                                       ; $0581E9 |
  LDA $03A9CE,x                             ; $0581EA |
  STA !gsu_r3                               ; $0581EE |
  LDA $03A9EE,x                             ; $0581F1 |
  STA !gsu_r2                               ; $0581F5 |
  CPY #$04                                  ; $0581F8 |
  BNE CODE_058210                           ; $0581FA |
  LDA #$0010                                ; $0581FC |
  STA !gsu_r8                               ; $0581FF |
  STA !gsu_r9                               ; $058202 |
  LDX #$08                                  ; $058205 |
  LDA #$8295                                ; $058207 |
  JSL r_gsu_init_1                          ; $05820A | GSU init
  BRA CODE_058222                           ; $05820E |

CODE_058210:
  LDA #$0008                                ; $058210 |
  STA !gsu_r8                               ; $058213 |
  STA !gsu_r9                               ; $058216 |
  LDX #$08                                  ; $058219 |
  LDA #$82FA                                ; $05821B |
  JSL r_gsu_init_1                          ; $05821E | GSU init

CODE_058222:
  LDX $12                                   ; $058222 |
  INC $0CF9                                 ; $058224 |
  RTS                                       ; $058227 |

  dw $FC00, $FEC0, $FC00                    ; $058228 |

  dw $0040, $0012, $0040                    ; $05822E |

  TYX                                       ; $058234 |
  LDY !s_spr_collision_id,x                 ; $058235 |
  BPL CODE_05827C                           ; $058238 |
  LDA !s_spr_y_player_delta,x               ; $05823A |
  CLC                                       ; $05823D |
  ADC !s_player_hitbox_half_height          ; $05823E |
  CLC                                       ; $058241 |
  ADC !s_spr_hitbox_height,x                ; $058242 |
  CMP #$0008                                ; $058245 |
  BCS CODE_05827C                           ; $058248 |
  LDY $60AB                                 ; $05824A |
  BPL CODE_05827C                           ; $05824D |
  LDY !s_player_jump_state                  ; $05824F |
  BEQ CODE_05827C                           ; $058252 |
  STZ !s_player_y_speed                     ; $058254 |
  STZ !s_player_flutter_state               ; $058257 |
  JSL $03AD74                               ; $05825A |
  BCC CODE_058263                           ; $05825E |
  INC !s_spr_anim_frame,x                   ; $058260 |

CODE_058263:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $058263 |
  LDA $8228,y                               ; $058265 |
  STA !s_spr_y_speed_lo,x                   ; $058268 |
  LDA $822E,y                               ; $05826B |
  STA !s_spr_y_accel,x                      ; $05826E |
  LDA !s_spr_y_pixel_pos,x                  ; $058271 |
  STA !s_spr_wildcard_1_lo,x                ; $058274 |
  DEC !s_spr_y_pixel_pos,x                  ; $058277 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05827A |

CODE_05827C:
  RTS                                       ; $05827C |

  TYX                                       ; $05827D |
  LDA !s_spr_wildcard_1_lo,x                ; $05827E |
  CMP !s_spr_y_pixel_pos,x                  ; $058281 |
  BCS CODE_05827C                           ; $058284 |
  STA !s_spr_y_pixel_pos,x                  ; $058286 |
  JSL $03AEFD                               ; $058289 |
  SEP #$20                                  ; $05828D |
  LDA #$FF                                  ; $05828F |
  STA !s_spr_stage_id,x                     ; $058291 |
  REP #$20                                  ; $058294 |
  TXY                                       ; $058296 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $058297 |
  LSR A                                     ; $058299 |
  CLC                                       ; $05829A |
  ADC #$0022                                ; $05829B |
  JSL $03A377                               ; $05829E |
  JSL $0ED844                               ; $0582A2 |
  PHX                                       ; $0582A6 |
  TYX                                       ; $0582A7 |
  JSL $03B8A8                               ; $0582A8 |
  PLX                                       ; $0582AC |
  PLA                                       ; $0582AD |
  LDA #$003A                                ; $0582AE |\ play sound #$003A
  JML $0085D2                               ; $0582B1 |/

; both sprite IDs
init_large_spring_ball:
  LDA !s_spr_dyntile_index,x                ; $0582B5 |
  BPL CODE_0582E1                           ; $0582B8 |
  JSL $03AE60                               ; $0582BA |
  INC !s_spr_anim_frame,x                   ; $0582BE |
  LDA #$0100                                ; $0582C1 |
  STA !s_spr_wildcard_1_lo,x                ; $0582C4 |
  LDA #$FFF8                                ; $0582C7 |
  STA !s_spr_y_terrain_offset,x             ; $0582CA |
  STZ !s_spr_y_hitbox_offset,x              ; $0582CD |
  LDA #$000C                                ; $0582D0 |
  STA !s_spr_hitbox_width,x                 ; $0582D3 |
  STA !s_spr_hitbox_height,x                ; $0582D6 |
  LDY #$02                                  ; $0582D9 |
  JSL $0582FD                               ; $0582DB |
  BRA CODE_0582E5                           ; $0582DF |

CODE_0582E1:
  JSL $03AA52                               ; $0582E1 |

CODE_0582E5:
  JSL $02A007                               ; $0582E5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0582E9 |
  CLC                                       ; $0582EC |
  ADC #$0008                                ; $0582ED |
  STA !s_spr_y_pixel_pos,x                  ; $0582F0 |
  STA !s_spr_x_accel_ceiling,x              ; $0582F3 |
  RTL                                       ; $0582F6 |

init_spring_ball:
  JSL $02A007                               ; $0582F7 |
  LDY #$00                                  ; $0582FB |
  STY $0E                                   ; $0582FD |
  LDA #$0004                                ; $0582FF |
  STA !s_spr_hitbox_width,x                 ; $058302 |
  LDA #$0100                                ; $058305 |
  STA !s_spr_gsu_morph_1_lo,x               ; $058308 |
  STZ !s_spr_facing_dir,x                   ; $05830B |
  LDA !s_spr_hitbox_height,x                ; $05830E |
  CLC                                       ; $058311 |
  ADC !s_player_hitbox_half_height          ; $058312 |
  CLC                                       ; $058315 |
  ADC !s_car_wheel_ext_height               ; $058316 |
  STA !s_spr_gsu_morph_2_lo,x               ; $058319 |
  JSR CODE_05851F                           ; $05831C |
  RTL                                       ; $05831F |

main_spring_ball:
  LDY !s_spr_anim_frame,x                   ; $058320 |
  BEQ CODE_058329                           ; $058323 |

; both sprite IDs
main_large_spring_ball:
  JSL $03AA52                               ; $058325 |

CODE_058329:
  JSL $03AF23                               ; $058329 |
  LDY #$00                                  ; $05832D |
  LDA !s_spr_id,x                           ; $05832F |
  CMP #$006F                                ; $058332 |
  BEQ CODE_05835F                           ; $058335 |
  INY                                       ; $058337 |
  INY                                       ; $058338 |
  CMP #$0148                                ; $058339 |
  BNE CODE_05835F                           ; $05833C |
  LDA !s_spr_x_accel_ceiling,x              ; $05833E |
  AND #$0001                                ; $058341 |
  BEQ CODE_05835F                           ; $058344 |
  AND $7860,x                               ; $058346 |
  BNE CODE_05835F                           ; $058349 |
  LDA !s_spr_x_accel_ceiling,x              ; $05834B |
  AND #$FFFE                                ; $05834E |
  CMP !s_spr_y_pixel_pos,x                  ; $058351 |
  BPL CODE_05835F                           ; $058354 |
  LDA !s_spr_oam_1,x                        ; $058356 |
  AND #$FFF3                                ; $058359 |
  STA !s_spr_oam_1,x                        ; $05835C |

CODE_05835F:
  STY $0E                                   ; $05835F |
  JSR CODE_05837E                           ; $058361 |
  JSR CODE_05847C                           ; $058364 |
  JSR CODE_05851F                           ; $058367 |
  LDA $7860,x                               ; $05836A |
  AND #$0001                                ; $05836D |
  STA $00                                   ; $058370 |
  LDA !s_spr_x_accel_ceiling,x              ; $058372 |
  AND #$FFFE                                ; $058375 |
  ORA $00                                   ; $058378 |
  STA !s_spr_x_accel_ceiling,x              ; $05837A |
  RTL                                       ; $05837D |

CODE_05837E:
  LDA !s_player_state                       ; $05837E |
  ORA !s_player_form                        ; $058381 |
  BNE CODE_0583A0                           ; $058384 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $058386 |
  BEQ CODE_05838D                           ; $058388 |
  JMP CODE_058430                           ; $05838A |

CODE_05838D:
  LDA !s_player_hitbox_half_width           ; $05838D |
  CLC                                       ; $058390 |
  ADC !s_spr_hitbox_width,x                 ; $058391 |
  ASL A                                     ; $058394 |
  STA $00                                   ; $058395 |
  LSR A                                     ; $058397 |
  CLC                                       ; $058398 |
  ADC !s_spr_x_player_delta,x               ; $058399 |
  CMP $00                                   ; $05839C |
  BCC CODE_0583A1                           ; $05839E |

CODE_0583A0:
  RTS                                       ; $0583A0 |

CODE_0583A1:
  LDA !s_spr_y_player_delta,x               ; $0583A1 |
  BMI CODE_0583A0                           ; $0583A4 |
  SEC                                       ; $0583A6 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $0583A7 |
  BPL CODE_0583A0                           ; $0583AA |
  LDY !s_player_jump_state                  ; $0583AC |
  BEQ CODE_0583A0                           ; $0583AF |
  LDY $60AB                                 ; $0583B1 |
  BMI CODE_0583A0                           ; $0583B4 |
  CLC                                       ; $0583B6 |
  ADC !s_player_y                           ; $0583B7 |
  STA !s_player_y                           ; $0583BA |
  LDA $7860,x                               ; $0583BD |
  AND #$0001                                ; $0583C0 |
  BEQ CODE_05842F                           ; $0583C3 |
  LDY $0E                                   ; $0583C5 |
  BNE CODE_0583D7                           ; $0583C7 |
  LDA !s_spr_dyntile_index,x                ; $0583C9 |
  BPL CODE_0583DB                           ; $0583CC |
  JSL $03AD74                               ; $0583CE |
  BCC CODE_0583DB                           ; $0583D2 |
  INC !s_spr_anim_frame,x                   ; $0583D4 |

CODE_0583D7:
  LDY #$01                                  ; $0583D7 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $0583D9 |

CODE_0583DB:
  LDA !s_player_y_speed                     ; $0583DB |
  LSR A                                     ; $0583DE |
  LSR A                                     ; $0583DF |
  LDY $0E                                   ; $0583E0 |
  BNE CODE_0583E5                           ; $0583E2 |
  LSR A                                     ; $0583E4 |

CODE_0583E5:
  CLC                                       ; $0583E5 |
  ADC #$0100                                ; $0583E6 |
  CMP #$01C0                                ; $0583E9 |
  BMI CODE_0583F1                           ; $0583EC |
  LDA #$01C0                                ; $0583EE |

CODE_0583F1:
  CPY #$00                                  ; $0583F1 |
  BEQ CODE_05840C                           ; $0583F3 |
  STA !gsu_r0                               ; $0583F5 |
  LDA #$0140                                ; $0583F8 |
  STA !gsu_r6                               ; $0583FB |
  LDX #$0B                                  ; $0583FE |
  LDA #$86BF                                ; $058400 |
  JSL r_gsu_init_1                          ; $058403 | GSU init
  LDX $12                                   ; $058407 |
  LDA !gsu_r0                               ; $058409 |

CODE_05840C:
  STA !s_spr_wildcard_1_lo,x                ; $05840C |
  STZ !s_player_y_speed                     ; $05840F |
  STZ !s_player_x_speed_prev                ; $058412 |
  STZ !s_player_x_speed                     ; $058415 |
  STZ !s_player_jump_state                  ; $058418 |
  LDY #$02                                  ; $05841B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05841D |
  LDA #$0004                                ; $05841F |
  CMP !s_player_invincibility_timer         ; $058422 |
  BMI CODE_05842A                           ; $058425 |
  STA !s_player_invincibility_timer         ; $058427 |

CODE_05842A:
  INC !s_on_sprite_platform_flag            ; $05842A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05842D |

CODE_05842F:
  RTS                                       ; $05842F |

CODE_058430:
  LDY !s_player_jump_state                  ; $058430 |
  BEQ CODE_058439                           ; $058433 |
  JSR CODE_0585A5                           ; $058435 |
  RTS                                       ; $058438 |

CODE_058439:
  LDA !s_player_hitbox_half_width           ; $058439 |
  CLC                                       ; $05843C |
  ADC !s_spr_hitbox_width,x                 ; $05843D |
  ASL A                                     ; $058440 |
  STA $00                                   ; $058441 |
  LSR A                                     ; $058443 |
  CLC                                       ; $058444 |
  ADC !s_spr_x_player_delta,x               ; $058445 |
  CMP $00                                   ; $058448 |
  BCC CODE_058450                           ; $05844A |
  JSR CODE_058618                           ; $05844C |
  RTS                                       ; $05844F |

CODE_058450:
  LDA !s_spr_y_hitbox_center,x              ; $058450 |
  SEC                                       ; $058453 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $058454 |
  SEC                                       ; $058457 |
  SBC !s_player_center_y                    ; $058458 |
  CLC                                       ; $05845B |
  ADC !s_player_y                           ; $05845C |
  STA !s_player_y                           ; $05845F |
  STZ !s_player_y_speed                     ; $058462 |
  LDA #$0004                                ; $058465 |
  CMP !s_player_invincibility_timer         ; $058468 |
  BMI CODE_058470                           ; $05846B |
  STA !s_player_invincibility_timer         ; $05846D |

CODE_058470:
  INC !s_on_sprite_platform_flag            ; $058470 |
  RTS                                       ; $058473 |

  dw $FFF0, $0010, $FFF8, $0008             ; $058474 |

CODE_05847C:
  LDY !s_spr_dyntile_index,x                ; $05847C |
  BMI CODE_0584AB                           ; $05847F |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $058481 |
  BEQ CODE_0584AB                           ; $058483 |
  LDA $7860,x                               ; $058485 |
  AND #$0001                                ; $058488 |
  BNE CODE_058490                           ; $05848B |
  JMP CODE_0584EB                           ; $05848D |

CODE_058490:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $058490 |
  CPY #$04                                  ; $058492 |
  BNE CODE_0584AC                           ; $058494 |
  LDY $0E                                   ; $058496 |
  BNE CODE_0584A1                           ; $058498 |
  JSL $03AEFD                               ; $05849A |
  STZ !s_spr_anim_frame,x                   ; $05849E |

CODE_0584A1:
  LDY #$00                                  ; $0584A1 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $0584A3 |
  LDA #$0100                                ; $0584A5 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0584A8 |

CODE_0584AB:
  RTS                                       ; $0584AB |

CODE_0584AC:
  TYA                                       ; $0584AC |
  DEC A                                     ; $0584AD |
  STA $00                                   ; $0584AE |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0584B0 |
  CLC                                       ; $0584B3 |
  ADC $8474,y                               ; $0584B4 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0584B7 |
  SEC                                       ; $0584BA |
  SBC !s_spr_wildcard_1_lo,x                ; $0584BB |
  EOR $00                                   ; $0584BE |
  BMI CODE_0584EA                           ; $0584C0 |
  LDA !s_spr_wildcard_1_lo,x                ; $0584C2 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0584C5 |
  CPY #$00                                  ; $0584C8 |
  BEQ CODE_0584D5                           ; $0584CA |
  LDA #$0100                                ; $0584CC |
  STA !s_spr_wildcard_1_lo,x                ; $0584CF |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0584D2 |
  RTS                                       ; $0584D4 |

CODE_0584D5:
  LDA #$FD00                                ; $0584D5 |
  STA !s_spr_y_speed_lo,x                   ; $0584D8 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0584DB |
  LDA #$0140                                ; $0584DD |
  STA !s_spr_wildcard_1_lo,x                ; $0584E0 |
  LDA #$001F                                ; $0584E3 |\ play sound #$001F
  JSL push_sound_queue                      ; $0584E6 |/

CODE_0584EA:
  RTS                                       ; $0584EA |

CODE_0584EB:
  LDY #$04                                  ; $0584EB |
  LDA !s_spr_y_speed_lo,x                   ; $0584ED |
  BMI CODE_0584FC                           ; $0584F0 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0584F2 |
  CMP #$0100                                ; $0584F5 |
  BPL CODE_0584FC                           ; $0584F8 |
  INY                                       ; $0584FA |
  INY                                       ; $0584FB |

CODE_0584FC:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0584FC |
  CLC                                       ; $0584FF |
  ADC $8474,y                               ; $058500 |
  STA !s_spr_gsu_morph_1_lo,x               ; $058503 |
  RTS                                       ; $058506 |

  dw $7050, $40E0                           ; $058507 |

  dw $0054, $0055                           ; $05850B |

  dw $0008, $0010                           ; $05850F |

  dw $0010, $001C                           ; $058513 |

  dw $0E00, $1800                           ; $058517 |

  dw $0008, $000C                           ; $05851B |

CODE_05851F:
  LDY $0E                                   ; $05851F |
  LDA !s_spr_dyntile_index,x                ; $058521 |
  BPL CODE_05852E                           ; $058524 |
  LDA $8518,y                               ; $058526 |
  AND #$00FF                                ; $058529 |
  BRA CODE_05858F                           ; $05852C |

CODE_05852E:
  STZ !gsu_r7                               ; $05852E |
  LDA !s_spr_gsu_morph_1_lo,x               ; $058531 |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $058534 |
  BEQ CODE_05853D                           ; $058536 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $058538 |
  STA !gsu_r7                               ; $05853A |

CODE_05853D:
  STA !gsu_r4                               ; $05853D |
  LDA #$0200                                ; $058540 |
  SEC                                       ; $058543 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $058544 |
  STA !gsu_r11                              ; $058547 |
  LDA $850B,y                               ; $05854A |
  STA !gsu_r13                              ; $05854D |
  LDA $8507,y                               ; $058550 |
  STA !gsu_r12                              ; $058553 |
  LDA $850F,y                               ; $058556 |
  STA !gsu_r8                               ; $058559 |
  LDA $8513,y                               ; $05855C |
  STA !gsu_r9                               ; $05855F |
  LDA $8517,y                               ; $058562 |
  STA !gsu_r6                               ; $058565 |
  TYA                                       ; $058568 |
  STA !gsu_r10                              ; $058569 |
  LDY !s_spr_dyntile_index,x                ; $05856C |
  TYX                                       ; $05856F |
  LDA $03A9CE,x                             ; $058570 |
  STA !gsu_r3                               ; $058574 |
  LDA $03A9EE,x                             ; $058577 |
  STA !gsu_r2                               ; $05857B |
  LDX #$08                                  ; $05857E |
  LDA #$D62C                                ; $058580 |
  JSL r_gsu_init_1                          ; $058583 | GSU init
  LDX $12                                   ; $058587 |
  INC $0CF9                                 ; $058589 |
  LDA $6020                                 ; $05858C |

CODE_05858F:
  LDY $0E                                   ; $05858F |
  CLC                                       ; $058591 |
  ADC !s_player_hitbox_half_height          ; $058592 |
  CLC                                       ; $058595 |
  ADC !s_car_wheel_ext_height               ; $058596 |
  SEC                                       ; $058599 |
  SBC $851B,y                               ; $05859A |
  STA !s_spr_gsu_morph_2_lo,x               ; $05859D |

CODE_0585A0:
  RTS                                       ; $0585A0 |

  dw $0280, $0200                           ; $0585A1 |

CODE_0585A5:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0585A5 |
  BEQ CODE_0585A0                           ; $0585A7 |
  LDA $7860,x                               ; $0585A9 |
  AND #$0001                                ; $0585AC |
  BEQ CODE_058618                           ; $0585AF |
  LDY $0E                                   ; $0585B1 |
  BNE CODE_0585BA                           ; $0585B3 |
  LDA #$00B0                                ; $0585B5 |
  BRA CODE_0585E2                           ; $0585B8 |

CODE_0585BA:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0585BA |
  CMP #$0140                                ; $0585BD |
  BMI CODE_0585C5                           ; $0585C0 |
  LDA #$0140                                ; $0585C2 |

CODE_0585C5:
  PHY                                       ; $0585C5 |
  STA !gsu_r0                               ; $0585C6 |
  LDA #$0130                                ; $0585C9 |
  STA !gsu_r6                               ; $0585CC |
  LDX #$0B                                  ; $0585CF |
  LDA #$86B6                                ; $0585D1 |
  JSL r_gsu_init_1                          ; $0585D4 | GSU init
  LDX $12                                   ; $0585D8 |
  LDA !gsu_r0                               ; $0585DA |
  PLY                                       ; $0585DD |
  SEC                                       ; $0585DE |
  SBC #$0020                                ; $0585DF |

CODE_0585E2:
  ASL A                                     ; $0585E2 |
  ASL A                                     ; $0585E3 |
  EOR #$FFFF                                ; $0585E4 |
  INC A                                     ; $0585E7 |
  STA !s_spr_y_speed_lo,x                   ; $0585E8 |
  STA !gsu_r0                               ; $0585EB |
  LDA $85A1,y                               ; $0585EE |
  STA !gsu_r6                               ; $0585F1 |
  LDX #$0B                                  ; $0585F4 |
  LDA #$86B6                                ; $0585F6 |
  JSL r_gsu_init_1                          ; $0585F9 | GSU init
  LDX $12                                   ; $0585FD |
  LDA !gsu_r0                               ; $0585FF |
  STA !s_player_y_speed                     ; $058602 |
  LDA #$0013                                ; $058605 |\ play sound #$0013
  JSL push_sound_queue                      ; $058608 |/
  LDA #$0006                                ; $05860C |
  STA !s_player_jump_state                  ; $05860F |
  STA !s_cam_player_center_y                ; $058612 |
  STZ $7860,x                               ; $058615 |

CODE_058618:
  LDY #$00                                  ; $058618 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05861A |
  LDY #$04                                  ; $05861C |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05861E |
  LDA #$0100                                ; $058620 |
  STA !s_spr_wildcard_1_lo,x                ; $058623 |
  RTS                                       ; $058626 |

init_clawdaddy:
  LDA #$FFFF                                ; $058627 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05862A |
  STZ !s_spr_wildcard_1_lo,x                ; $05862C |
  LDA #$0003                                ; $05862F |
  STA !s_spr_wildcard_2_lo,x                ; $058632 |
  RTL                                       ; $058635 |

  dw $87B7                                  ; $058636 |
  dw $88D7                                  ; $058638 |
  dw $8951                                  ; $05863A |
  dw $8A08                                  ; $05863C |
  dw $8A42                                  ; $05863E |

  dw $0022, $0024, $0026, $0028             ; $058640 |

main_clawdaddy:
  LDA !s_spr_state,x                        ; $058648 |
  CMP #$0012                                ; $05864B |
  BEQ CODE_058655                           ; $05864E |
  LDA !s_spr_timer_frozen,x                 ; $058650 |
  BEQ CODE_058658                           ; $058653 |

CODE_058655:
  JSR CODE_058A87                           ; $058655 |

CODE_058658:
  JSR CODE_058723                           ; $058658 |
  JSL $03AF23                               ; $05865B |
  LDA !s_spr_bitwise_settings_3,x           ; $05865F |
  AND #$0300                                ; $058662 |
  BNE CODE_058673                           ; $058665 |
  LDA $7860,x                               ; $058667 |
  LSR A                                     ; $05866A |
  BCC CODE_058673                           ; $05866B |
  LDA #$0943                                ; $05866D |
  STA !s_spr_bitwise_settings_3,x           ; $058670 |

CODE_058673:
  LDA #$0022                                ; $058673 |
  STA !s_spr_oam_yxppccct,x                 ; $058676 |
  LDA !s_spr_timer_4,x                      ; $058679 |
  BEQ CODE_0586A2                           ; $05867C |
  AND #$0006                                ; $05867E |
  TAY                                       ; $058681 |
  LDA $8640,y                               ; $058682 |
  STA !s_spr_oam_yxppccct,x                 ; $058685 |
  LDA !s_spr_x_pixel_pos,x                  ; $058688 |
  SEC                                       ; $05868B |
  SBC !s_spr_x_delta_lo,x                   ; $05868C |
  STA !s_spr_x_pixel_pos,x                  ; $05868F |
  STZ !s_spr_x_speed_lo,x                   ; $058692 |
  INC !s_spr_timer_1,x                      ; $058695 |
  INC !s_spr_timer_2,x                      ; $058698 |
  INC !s_spr_timer_3,x                      ; $05869B |
  JSR CODE_0586C8                           ; $05869E |
  RTL                                       ; $0586A1 |

CODE_0586A2:
  JSR CODE_0586C8                           ; $0586A2 |
  TXY                                       ; $0586A5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0586A6 |
  ASL A                                     ; $0586A8 |
  TAX                                       ; $0586A9 |
  JSR ($8636,x)                             ; $0586AA |
  JSR CODE_058723                           ; $0586AD |
  SEP #$20                                  ; $0586B0 |
  LDA !s_spr_anim_frame,x                   ; $0586B2 |
  CMP !s_spr_wildcard_2_hi,x                ; $0586B5 |
  BEQ CODE_0586C5                           ; $0586B8 |
  STA !s_spr_wildcard_2_hi,x                ; $0586BA |
  BNE CODE_0586C5                           ; $0586BD |
  REP #$20                                  ; $0586BF |
  JSL $03AEFD                               ; $0586C1 |

CODE_0586C5:
  REP #$20                                  ; $0586C5 |
  RTL                                       ; $0586C7 |

CODE_0586C8:
  LDY !s_spr_collision_id,x                 ; $0586C8 |
  DEY                                       ; $0586CB |
  BMI CODE_058710                           ; $0586CC |
  LDA !s_spr_state,y                        ; $0586CE |
  CMP #$0010                                ; $0586D1 |
  BNE CODE_058710                           ; $0586D4 |
  LDA !s_spr_collision_state,y              ; $0586D6 |
  BEQ CODE_058710                           ; $0586D9 |
  TYX                                       ; $0586DB |
  JSL $03B25B                               ; $0586DC |
  DEC !s_spr_wildcard_2_lo,x                ; $0586E0 |
  LDY !s_spr_wildcard_2_lo,x                ; $0586E3 |
  BNE CODE_058709                           ; $0586E6 |
  LDA #$000C                                ; $0586E8 |
  STA !s_spr_state,x                        ; $0586EB |
  LDA #$FE00                                ; $0586EE |
  STA !s_spr_y_speed_lo,x                   ; $0586F1 |
  STZ !s_spr_x_accel,x                      ; $0586F4 |
  SEP #$20                                  ; $0586F7 |
  LDA #$FF                                  ; $0586F9 |
  STA !s_spr_stage_id,x                     ; $0586FB |
  REP #$20                                  ; $0586FE |
  LDA #$000C                                ; $058700 |\ play sound #$000C
  JSL push_sound_queue                      ; $058703 |/
  PLA                                       ; $058707 |
  RTL                                       ; $058708 |

CODE_058709:
  LDA #$0040                                ; $058709 |
  STA !s_spr_timer_4,x                      ; $05870C |
  RTS                                       ; $05870F |

CODE_058710:
  PLA                                       ; $058710 |
  STA $00                                   ; $058711 |
  JSL $03A5B7                               ; $058713 |
  LDA $00                                   ; $058717 |
  PHA                                       ; $058719 |
  RTS                                       ; $05871A |

  dw $0000, $FFF0, $0010, $FFF0             ; $05871B |

CODE_058723:
  LDY !s_spr_wildcard_2_hi,x                ; $058723 |
  BNE CODE_058729                           ; $058726 |
  RTS                                       ; $058728 |

CODE_058729:
  LDY !s_spr_facing_dir,x                   ; $058729 |
  LDA $871B,y                               ; $05872C |
  CLC                                       ; $05872F |
  ADC !s_spr_x_hitbox_center,x              ; $058730 |
  SEC                                       ; $058733 |
  SBC !s_bg1_cam_x                          ; $058734 |
  STA $0C                                   ; $058737 |
  LDA !s_spr_y_hitbox_center,x              ; $058739 |
  SEC                                       ; $05873C |
  SBC !s_bg1_cam_y                          ; $05873D |
  STA $0E                                   ; $058740 |
  JSL $03AA52                               ; $058742 |
  LDY !s_spr_facing_dir,x                   ; $058746 |
  LDA $871D,y                               ; $058749 |
  STA $00                                   ; $05874C |
  LDA !s_spr_oam_yxppccct,x                 ; $05874E |
  AND #$0080                                ; $058751 |
  ASL A                                     ; $058754 |
  ASL A                                     ; $058755 |
  XBA                                       ; $058756 |
  TAY                                       ; $058757 |
  CMP !s_spr_wildcard_1_lo,x                ; $058758 |
  BEQ CODE_058760                           ; $05875B |
  STA !s_spr_wildcard_1_lo,x                ; $05875D |

CODE_058760:
  LDA $871F,y                               ; $058760 |
  STA $02                                   ; $058763 |
  REP #$10                                  ; $058765 |
  LDY !s_spr_oam_pointer,x                  ; $058767 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05876A |
  AND #$00FF                                ; $05876C |
  CMP #$0080                                ; $05876F |
  BCC CODE_058777                           ; $058772 |
  ORA #$FF00                                ; $058774 |

CODE_058777:
  CLC                                       ; $058777 |
  ADC $0C                                   ; $058778 |
  STA $6008,y                               ; $05877A |
  STA $6018,y                               ; $05877D |
  CLC                                       ; $058780 |
  ADC $00                                   ; $058781 |
  STA $6000,y                               ; $058783 |
  STA $6010,y                               ; $058786 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $058789 |
  AND #$00FF                                ; $05878B |
  CMP #$0080                                ; $05878E |
  BCC CODE_058796                           ; $058791 |
  ORA #$FF00                                ; $058793 |

CODE_058796:
  CLC                                       ; $058796 |
  ADC $0E                                   ; $058797 |
  STA $6012,y                               ; $058799 |
  STA $601A,y                               ; $05879C |
  SEC                                       ; $05879F |
  SBC $02                                   ; $0587A0 |
  STA $6002,y                               ; $0587A2 |
  STA $600A,y                               ; $0587A5 |
  SEP #$10                                  ; $0587A8 |
  RTS                                       ; $0587AA |

  dw $00B3, $0059, $FF4D, $FFA7             ; $0587AB |

  dw $FE9A, $0166                           ; $0587B3 |

  TYX                                       ; $0587B7 |
  LDA !s_spr_dyntile_index,x                ; $0587B8 |
  BMI CODE_0587C1                           ; $0587BB |
  JSL $03AEFD                               ; $0587BD |

CODE_0587C1:
  LDA !s_spr_timer_3,x                      ; $0587C1 |
  BNE CODE_058837                           ; $0587C4 |
  LDA !s_spr_y_player_delta,x               ; $0587C6 |
  CLC                                       ; $0587C9 |
  ADC #$0028                                ; $0587CA |
  CMP #$0050                                ; $0587CD |
  BCS CODE_058837                           ; $0587D0 |
  LDA !s_spr_x_player_delta,x               ; $0587D2 |
  CLC                                       ; $0587D5 |
  ADC #$0050                                ; $0587D6 |
  CMP #$00A0                                ; $0587D9 |
  BCS CODE_058837                           ; $0587DC |
  SEC                                       ; $0587DE |
  SBC #$0030                                ; $0587DF |
  CMP #$0040                                ; $0587E2 |
  BCC CODE_058801                           ; $0587E5 |
  LDY !s_spr_x_player_dir,x                 ; $0587E7 |
  LDA $87B3,y                               ; $0587EA |
  STA !s_spr_x_accel_ceiling,x              ; $0587ED |
  LDA #$000B                                ; $0587F0 |
  STA !s_spr_x_accel,x                      ; $0587F3 |
  LDA #$0010                                ; $0587F6 |
  STA !s_spr_timer_1,x                      ; $0587F9 |
  STZ !s_spr_timer_2,x                      ; $0587FC |
  BRA CODE_058837                           ; $0587FF |

CODE_058801:
  JSL $03AD74                               ; $058801 |
  BCC CODE_058837                           ; $058805 |
  LDY #$00                                  ; $058807 |
  LDA !s_spr_x_player_delta,x               ; $058809 |
  BPL CODE_058810                           ; $05880C |
  INY                                       ; $05880E |
  INY                                       ; $05880F |

CODE_058810:
  TYA                                       ; $058810 |
  STA !s_spr_facing_dir,x                   ; $058811 |
  STZ !s_spr_x_speed_lo,x                   ; $058814 |
  STZ !s_spr_x_accel,x                      ; $058817 |
  STZ !s_spr_timer_1,x                      ; $05881A |
  STZ !s_spr_timer_2,x                      ; $05881D |
  LDA #$0055                                ; $058820 |
  STA !s_spr_gsu_morph_1_lo,x               ; $058823 |
  LDA #$0002                                ; $058826 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $058829 |
  LDA #$0010                                ; $05882B |
  STA !s_spr_gsu_morph_2_lo,x               ; $05882E |
  LDA #$0201                                ; $058831 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $058834 |

CODE_058836:
  RTS                                       ; $058836 |

CODE_058837:
  LDA !s_spr_timer_2,x                      ; $058837 |
  BNE CODE_058836                           ; $05883A |
  LDA #$000B                                ; $05883C |
  STA !s_spr_x_accel,x                      ; $05883F |
  LDA $7860,x                               ; $058842 |
  BIT #$000C                                ; $058845 |
  BNE CODE_058857                           ; $058848 |
  AND #$0001                                ; $05884A |
  BNE CODE_05888D                           ; $05884D |
  LDA !s_spr_ground_angle,x                 ; $05884F |
  AND #$00FF                                ; $058852 |
  BNE CODE_05888D                           ; $058855 |

CODE_058857:
  LDA !s_spr_x_pixel_pos,x                  ; $058857 |
  SEC                                       ; $05885A |
  SBC !s_spr_x_delta_lo,x                   ; $05885B |
  STA !s_spr_x_pixel_pos,x                  ; $05885E |
  LDA !s_spr_y_speed_lo,x                   ; $058861 |
  BMI CODE_058875                           ; $058864 |
  AND #$FF00                                ; $058866 |
  XBA                                       ; $058869 |
  STA $00                                   ; $05886A |
  LDA !s_spr_y_pixel_pos,x                  ; $05886C |
  SEC                                       ; $05886F |
  SBC $00                                   ; $058870 |
  STA !s_spr_y_pixel_pos,x                  ; $058872 |

CODE_058875:
  STZ !s_spr_x_accel_ceiling,x              ; $058875 |
  STZ !s_spr_x_speed_lo,x                   ; $058878 |
  STZ !s_spr_x_accel,x                      ; $05887B |
  LDA #$0020                                ; $05887E |
  STA !s_spr_timer_2,x                      ; $058881 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $058884 |
  EOR #$0004                                ; $058887 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05888A |

CODE_05888D:
  LDA !s_spr_x_speed_lo,x                   ; $05888D |
  BPL CODE_058896                           ; $058890 |
  EOR #$FFFF                                ; $058892 |
  INC A                                     ; $058895 |

CODE_058896:
  CLC                                       ; $058896 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $058897 |
  CMP #$0A00                                ; $05889A |
  BCC CODE_0588AE                           ; $05889D |
  PHA                                       ; $05889F |
  LDA !s_spr_facing_dir,x                   ; $0588A0 |
  EOR #$0002                                ; $0588A3 |
  STA !s_spr_facing_dir,x                   ; $0588A6 |
  PLA                                       ; $0588A9 |
  SEC                                       ; $0588AA |
  SBC #$0A00                                ; $0588AB |

CODE_0588AE:
  STA !s_spr_gsu_morph_2_lo,x               ; $0588AE |
  LDA !s_spr_timer_1,x                      ; $0588B1 |
  BNE CODE_0588D2                           ; $0588B4 |
  LDA $10                                   ; $0588B6 |
  AND #$001F                                ; $0588B8 |
  PHA                                       ; $0588BB |
  CLC                                       ; $0588BC |
  ADC #$0020                                ; $0588BD |
  STA !s_spr_timer_1,x                      ; $0588C0 |
  PLA                                       ; $0588C3 |
  AND #$0002                                ; $0588C4 |
  CLC                                       ; $0588C7 |
  ADC !s_spr_gsu_morph_1_lo,x               ; $0588C8 |
  TAY                                       ; $0588CB |
  LDA $87AB,y                               ; $0588CC |
  STA !s_spr_x_accel_ceiling,x              ; $0588CF |

CODE_0588D2:
  RTS                                       ; $0588D2 |

  dw $FFE8, $0008                           ; $0588D3 |

  TYX                                       ; $0588D7 |
  LDA #$0001                                ; $0588D8 |
  STA !s_spr_anim_frame,x                   ; $0588DB |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0588DE |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0588E0 |
  CLC                                       ; $0588E3 |
  ADC $88D3,y                               ; $0588E4 |
  CMP #$00E3                                ; $0588E7 |
  BMI CODE_058926                           ; $0588EA |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0588EC |
  LDA $10                                   ; $0588EE |
  PHA                                       ; $0588F0 |
  AND #$0002                                ; $0588F1 |
  CLC                                       ; $0588F4 |
  ADC #$0004                                ; $0588F5 |
  TAY                                       ; $0588F8 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0588F9 |
  PLA                                       ; $0588FB |
  AND #$0003                                ; $0588FC |
  BNE CODE_058905                           ; $0588FF |
  INY                                       ; $058901 |
  INY                                       ; $058902 |
  INY                                       ; $058903 |
  INY                                       ; $058904 |

CODE_058905:
  CLC                                       ; $058905 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $058906 |
  INC A                                     ; $058908 |
  AND #$00FF                                ; $058909 |
  CMP #$0004                                ; $05890C |
  BCC CODE_058917                           ; $05890F |
  TYA                                       ; $058911 |
  LSR A                                     ; $058912 |
  TAY                                       ; $058913 |
  LDA #$0004                                ; $058914 |

CODE_058917:
  STA !s_spr_wildcard_5_lo_dp,x             ; $058917 |
  STY !s_spr_wildcard_6_hi_dp,x             ; $058919 |
  LDA #$0010                                ; $05891B |
  STA !s_spr_timer_2,x                      ; $05891E |
  LDA #$00E3                                ; $058921 |
  BRA CODE_058946                           ; $058924 |

CODE_058926:
  CMP #$0055                                ; $058926 |
  BPL CODE_058946                           ; $058929 |
  STZ !s_spr_anim_frame,x                   ; $05892B |
  LDA $10                                   ; $05892E |
  AND #$001F                                ; $058930 |
  CLC                                       ; $058933 |
  ADC #$0010                                ; $058934 |
  STA !s_spr_timer_3,x                      ; $058937 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05893A |
  LDY #$00                                  ; $05893C |
  LDA !s_spr_x_accel_ceiling,x              ; $05893E |
  BPL CODE_058945                           ; $058941 |
  LDY #$04                                  ; $058943 |

CODE_058945:
  TYA                                       ; $058945 |

CODE_058946:
  STA !s_spr_gsu_morph_1_lo,x               ; $058946 |
  JSR CODE_058A87                           ; $058949 |

CODE_05894C:
  RTS                                       ; $05894C |

  dw $FFF0, $0020                           ; $05894D |

  TYX                                       ; $058951 |
  LDA !s_spr_timer_2,x                      ; $058952 |
  BNE CODE_05894C                           ; $058955 |
  STZ $02                                   ; $058957 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $058959 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05895B |
  CLC                                       ; $05895E |
  ADC $894D,y                               ; $05895F |
  AND #$01FE                                ; $058962 |
  CPY #$00                                  ; $058965 |
  BNE CODE_05897A                           ; $058967 |
  CMP #$0190                                ; $058969 |
  BCS CODE_05898B                           ; $05896C |
  CMP #$0100                                ; $05896E |
  BCC CODE_05898B                           ; $058971 |
  LDA #$0190                                ; $058973 |
  LDY #$02                                  ; $058976 |
  BRA CODE_05898B                           ; $058978 |

CODE_05897A:
  CMP #$0090                                ; $05897A |
  BCC CODE_05898B                           ; $05897D |
  CMP #$0100                                ; $05897F |
  BCS CODE_05898B                           ; $058982 |
  LDA #$0090                                ; $058984 |
  INC $02                                   ; $058987 |
  LDY #$00                                  ; $058989 |

CODE_05898B:
  STY !s_spr_wildcard_3_lo_dp,x             ; $05898B |
  STA !s_spr_gsu_morph_2_lo,x               ; $05898D |
  CMP #$0010                                ; $058990 |
  BNE CODE_0589A5                           ; $058993 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $058995 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $058997 |
  BNE CODE_0589A5                           ; $058999 |
  LDA #$FFFF                                ; $05899B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05899E |
  LDA #$0001                                ; $0589A0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0589A3 |

CODE_0589A5:
  JSR CODE_058A75                           ; $0589A5 |
  LDY $02                                   ; $0589A8 |
  BEQ CODE_058A07                           ; $0589AA |
  LDA !s_spr_y_pixel_pos,x                  ; $0589AC |
  CLC                                       ; $0589AF |
  ADC #$0014                                ; $0589B0 |
  STA !gsu_r0                               ; $0589B3 |
  LDA !s_spr_x_hitbox_center,x              ; $0589B6 |
  CLC                                       ; $0589B9 |
  ADC $00                                   ; $0589BA |
  STA !gsu_r8                               ; $0589BC |
  LDX #$0A                                  ; $0589BF |
  LDA #$CE2F                                ; $0589C1 |
  JSL r_gsu_init_3                          ; $0589C4 | GSU init
  LDX $12                                   ; $0589C8 |
  LDA #$0045                                ; $0589CA |
  LDY !gsu_r5                               ; $0589CD |
  BEQ CODE_058A03                           ; $0589D0 |
  LDA #$01D4                                ; $0589D2 |
  JSL spawn_ambient_sprite                  ; $0589D5 |
  LDA #$000B                                ; $0589D9 |
  STA $7E4C,y                               ; $0589DC |
  LDA #$0006                                ; $0589DF |
  STA $7782,y                               ; $0589E2 |
  LDA !s_spr_x_hitbox_center,x              ; $0589E5 |
  CLC                                       ; $0589E8 |
  ADC $00                                   ; $0589E9 |
  SEC                                       ; $0589EB |
  SBC #$0008                                ; $0589EC |
  STA $70A2,y                               ; $0589EF |
  LDA !s_spr_y_hitbox_center,x              ; $0589F2 |
  CLC                                       ; $0589F5 |
  ADC $6022                                 ; $0589F6 |
  SEC                                       ; $0589F9 |
  SBC #$0010                                ; $0589FA |
  STA $7142,y                               ; $0589FD |
  LDA #$001F                                ; $058A00 |\ play sound #$001F

CODE_058A03:
  JSL push_sound_queue                      ; $058A03 |/

CODE_058A07:
  RTS                                       ; $058A07 |

  TYX                                       ; $058A08 |
  LDA !s_spr_timer_2,x                      ; $058A09 |
  BNE CODE_058A07                           ; $058A0C |
  LDA !s_spr_timer_1,x                      ; $058A0E |
  BNE CODE_058A41                           ; $058A11 |
  LDA #$0004                                ; $058A13 |
  STA !s_spr_timer_1,x                      ; $058A16 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $058A19 |
  EOR #$0002                                ; $058A1B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $058A1E |
  BNE CODE_058A29                           ; $058A20 |
  LDA #$0037                                ; $058A22 |\ play sound #$0037
  JSL push_sound_queue                      ; $058A25 |/

CODE_058A29:
  DEC !s_spr_wildcard_6_hi_dp,x             ; $058A29 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $058A2B |
  BNE CODE_058A38                           ; $058A2D |
  LDA #$FFFF                                ; $058A2F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $058A32 |
  INC A                                     ; $058A34 |
  INC A                                     ; $058A35 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $058A36 |

CODE_058A38:
  JSR CODE_058A87                           ; $058A38 |
  BCC CODE_058A41                           ; $058A3B |
  JSL player_hit_sprite                     ; $058A3D |

CODE_058A41:
  RTS                                       ; $058A41 |

  TYX                                       ; $058A42 |
  LDA !s_spr_timer_2,x                      ; $058A43 |
  BNE CODE_058A41                           ; $058A46 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $058A48 |
  CLC                                       ; $058A4B |
  ADC #$0010                                ; $058A4C |
  AND #$01FE                                ; $058A4F |
  STA !s_spr_gsu_morph_2_lo,x               ; $058A52 |
  CMP #$0010                                ; $058A55 |
  BNE CODE_058A72                           ; $058A58 |
  DEC !s_spr_wildcard_6_hi_dp,x             ; $058A5A |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $058A5C |
  BNE CODE_058A6B                           ; $058A5E |
  LDA #$FFFF                                ; $058A60 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $058A63 |
  INC A                                     ; $058A65 |
  INC A                                     ; $058A66 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $058A67 |
  BRA CODE_058A72                           ; $058A69 |

CODE_058A6B:
  LDA #$001F                                ; $058A6B |\ play sound #$001F
  JSL push_sound_queue                      ; $058A6E |/

CODE_058A72:
  JMP CODE_058A75                           ; $058A72 |

CODE_058A75:
  JSR CODE_058A87                           ; $058A75 |
  BCC CODE_058A7E                           ; $058A78 |
  JSL player_hit_sprite                     ; $058A7A |

CODE_058A7E:
  RTS                                       ; $058A7E |

  dw $4001, $4021                           ; $058A7F |

  dw $FFF8, $0008                           ; $058A83 |

CODE_058A87:
  LDY !s_spr_anim_frame,x                   ; $058A87 |
  BEQ CODE_058A7E                           ; $058A8A |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $058A8C |
  LDA $8A7F,y                               ; $058A8E |
  STA !gsu_r12                              ; $058A91 |
  LDA #$0054                                ; $058A94 |
  STA !gsu_r13                              ; $058A97 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $058A9A |
  SEC                                       ; $058A9D |
  SBC #$0040                                ; $058A9E |
  AND #$01FE                                ; $058AA1 |
  STA !gsu_r11                              ; $058AA4 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $058AA7 |
  LSR A                                     ; $058AAA |
  STA !gsu_r5                               ; $058AAB |
  LDA !s_spr_gsu_morph_1_lo,x               ; $058AAE |
  STA !gsu_r4                               ; $058AB1 |
  LDA !s_spr_facing_dir,x                   ; $058AB4 |
  STA !gsu_r9                               ; $058AB7 |
  LDA #$EC00                                ; $058ABA |
  STA !gsu_r6                               ; $058ABD |
  LDY !s_spr_dyntile_index,x                ; $058AC0 |
  TYX                                       ; $058AC3 |
  LDA $03A9CE,x                             ; $058AC4 |
  STA !gsu_r3                               ; $058AC8 |
  LDA $03A9EE,x                             ; $058ACB |
  STA !gsu_r2                               ; $058ACF |
  LDX #$08                                  ; $058AD2 |
  LDA #$D645                                ; $058AD4 |
  JSL r_gsu_init_1                          ; $058AD7 | GSU init
  INC $0CF9                                 ; $058ADB |
  LDX $12                                   ; $058ADE |
  LDY !s_spr_facing_dir,x                   ; $058AE0 |
  LDA $8A83,y                               ; $058AE3 |
  CLC                                       ; $058AE6 |
  ADC $6020                                 ; $058AE7 |
  STA $00                                   ; $058AEA |
  TAY                                       ; $058AEC |
  STY !s_spr_wildcard_4_lo_dp,x             ; $058AED |
  LDY $6022                                 ; $058AEF |
  STY !s_spr_wildcard_4_hi_dp,x             ; $058AF2 |
  TXA                                       ; $058AF4 |
  STA !gsu_r1                               ; $058AF5 |
  LDX #$09                                  ; $058AF8 |
  LDA #$8F33                                ; $058AFA |
  JSL r_gsu_init_1                          ; $058AFD | GSU init
  LDX $12                                   ; $058B01 |
  LDY !gsu_r1                               ; $058B03 |
  BMI CODE_058B48                           ; $058B06 |
  LDA !s_player_hitbox_half_width           ; $058B08 |
  CLC                                       ; $058B0B |
  ADC #$0008                                ; $058B0C |
  STA $0C                                   ; $058B0F |
  ASL A                                     ; $058B11 |
  STA $0E                                   ; $058B12 |
  LDA $00                                   ; $058B14 |
  CLC                                       ; $058B16 |
  ADC !s_spr_x_hitbox_center,x              ; $058B17 |
  SEC                                       ; $058B1A |
  SBC !s_spr_x_hitbox_center,y              ; $058B1B |
  CLC                                       ; $058B1E |
  ADC $0C                                   ; $058B1F |
  CMP $0E                                   ; $058B21 |
  BCS CODE_058B48                           ; $058B23 |
  LDA !s_player_hitbox_half_height          ; $058B25 |
  CLC                                       ; $058B28 |
  ADC #$0008                                ; $058B29 |
  STA $0C                                   ; $058B2C |
  ASL A                                     ; $058B2E |
  STA $0E                                   ; $058B2F |
  LDA $6022                                 ; $058B31 |
  CLC                                       ; $058B34 |
  ADC !s_spr_y_hitbox_center,x              ; $058B35 |
  SEC                                       ; $058B38 |
  SBC !s_spr_y_hitbox_center,y              ; $058B39 |
  CLC                                       ; $058B3C |
  ADC $0C                                   ; $058B3D |
  CMP $0E                                   ; $058B3F |
  BCS CODE_058B48                           ; $058B41 |
  TYX                                       ; $058B43 |
  JSL $03B25B                               ; $058B44 |

CODE_058B48:
  LDA !s_spr_x_player_delta,x               ; $058B48 |
  CLC                                       ; $058B4B |
  ADC $6020                                 ; $058B4C |
  CLC                                       ; $058B4F |
  ADC #$0010                                ; $058B50 |
  CMP #$0020                                ; $058B53 |
  BCS CODE_058B6F                           ; $058B56 |
  LDA !s_spr_y_player_delta,x               ; $058B58 |
  CLC                                       ; $058B5B |
  ADC $6022                                 ; $058B5C |
  CLC                                       ; $058B5F |
  ADC #$0010                                ; $058B60 |
  CMP #$0020                                ; $058B63 |
  BCS CODE_058B6F                           ; $058B66 |
  LDA !s_player_invincibility_timer         ; $058B68 |
  BNE CODE_058B6F                           ; $058B6B |
  SEC                                       ; $058B6D |
  RTS                                       ; $058B6E |

CODE_058B6F:
  CLC                                       ; $058B6F |
  RTS                                       ; $058B70 |

  JSL $03AE60                               ; $058B71 |
  LDA #$0049                                ; $058B75 |
  STA !s_spr_gsu_morph_1_lo,x               ; $058B78 |
  JSR CODE_058C74                           ; $058B7B |
  RTL                                       ; $058B7E |

  dw $FFA7, $0059                           ; $058B7F |

  dw $0020, $FFE0                           ; $058B83 |

  dw $20E1, $0041, $5222, $03AA             ; $058B87 |
  dw $2322, $03AF                           ; $058B8F |

  LDA !s_spr_dyntile_index,x                ; $058B93 |
  LSR A                                     ; $058B96 |
  LSR A                                     ; $058B97 |
  LSR A                                     ; $058B98 |
  SEC                                       ; $058B99 |
  SBC !r_frame_counter_global               ; $058B9A |
  AND #$0003                                ; $058B9D |
  BEQ CODE_058BA3                           ; $058BA0 |
  RTL                                       ; $058BA2 |

CODE_058BA3:
  SEP #$20                                  ; $058BA3 |
  LDA #$04                                  ; $058BA5 |
  STA !s_spr_draw_priority,x                ; $058BA7 |
  REP #$20                                  ; $058BAA |
  LDA #$0002                                ; $058BAC |
  STA !s_spr_x_accel,x                      ; $058BAF |
  STA !s_spr_y_accel,x                      ; $058BB2 |
  LDA !s_spr_facing_dir,x                   ; $058BB5 |
  EOR !s_player_direction                   ; $058BB8 |
  BNE CODE_058BD0                           ; $058BBB |
  STZ !s_spr_y_accel,x                      ; $058BBD |
  STZ !s_spr_x_accel,x                      ; $058BC0 |
  STZ !s_spr_x_speed_lo,x                   ; $058BC3 |
  STZ !s_spr_y_speed_lo,x                   ; $058BC6 |
  STZ !s_spr_timer_2,x                      ; $058BC9 |
  LDY #$02                                  ; $058BCC |
  BRA CODE_058BFE                           ; $058BCE |

CODE_058BD0:
  LDA !s_spr_timer_2,x                      ; $058BD0 |
  BNE CODE_058BFC                           ; $058BD3 |
  LDA #$0040                                ; $058BD5 |
  STA !s_spr_timer_2,x                      ; $058BD8 |
  LDA $10                                   ; $058BDB |
  PHA                                       ; $058BDD |
  AND #$0001                                ; $058BDE |
  BEQ CODE_058BEC                           ; $058BE1 |
  LDY !s_spr_x_player_dir,x                 ; $058BE3 |
  LDA $8B7F,y                               ; $058BE6 |
  STA !s_spr_x_accel_ceiling,x              ; $058BE9 |

CODE_058BEC:
  PLA                                       ; $058BEC |
  XBA                                       ; $058BED |
  AND #$0001                                ; $058BEE |
  BEQ CODE_058BFC                           ; $058BF1 |
  LDY !s_spr_y_player_dir,x                 ; $058BF3 |
  LDA $8B7F,y                               ; $058BF6 |
  STA !s_spr_y_accel_ceiling,x              ; $058BF9 |

CODE_058BFC:
  LDY #$00                                  ; $058BFC |

CODE_058BFE:
  LDA !s_spr_gsu_morph_1_lo,x               ; $058BFE |
  CLC                                       ; $058C01 |
  ADC $8B83,y                               ; $058C02 |
  CMP #$00E3                                ; $058C05 |
  BMI CODE_058C0F                           ; $058C08 |
  LDA #$00E3                                ; $058C0A |
  BRA CODE_058C17                           ; $058C0D |

CODE_058C0F:
  CMP #$0049                                ; $058C0F |
  BPL CODE_058C17                           ; $058C12 |
  LDA #$0049                                ; $058C14 |

CODE_058C17:
  STA !s_spr_gsu_morph_1_lo,x               ; $058C17 |
  LDA !s_spr_x_player_delta,x               ; $058C1A |
  EOR #$FFFF                                ; $058C1D |
  INC A                                     ; $058C20 |
  STA !gsu_r1                               ; $058C21 |
  LDA !s_spr_y_player_delta,x               ; $058C24 |
  EOR #$FFFF                                ; $058C27 |
  INC A                                     ; $058C2A |
  STA !gsu_r2                               ; $058C2B |
  LDX #$0B                                  ; $058C2E |
  LDA #$BCF8                                ; $058C30 |
  JSL r_gsu_init_1                          ; $058C33 | GSU init
  LDX $12                                   ; $058C37 |
  LDA !gsu_r0                               ; $058C39 |
  SEC                                       ; $058C3C |
  SBC #$0080                                ; $058C3D |
  CMP #$0100                                ; $058C40 |
  BCS CODE_058C58                           ; $058C43 |
  LDA #$0002                                ; $058C45 |
  STA !s_spr_facing_dir,x                   ; $058C48 |
  LDA !gsu_r0                               ; $058C4B |
  EOR #$FFFF                                ; $058C4E |
  INC A                                     ; $058C51 |
  CLC                                       ; $058C52 |
  ADC #$0100                                ; $058C53 |
  BRA CODE_058C5E                           ; $058C56 |

CODE_058C58:
  STZ !s_spr_facing_dir,x                   ; $058C58 |
  LDA !gsu_r0                               ; $058C5B |

CODE_058C5E:
  AND #$01FE                                ; $058C5E |
  STA !s_spr_gsu_morph_2_lo,x               ; $058C61 |
  JSR CODE_058C74                           ; $058C64 |
  LDA $6020                                 ; $058C67 |
  CMP #$0002                                ; $058C6A |
  BNE CODE_058C73                           ; $058C6D |
  JSL player_hit_sprite                     ; $058C6F |

CODE_058C73:
  RTL                                       ; $058C73 |

CODE_058C74:
  LDA #$0054                                ; $058C74 |
  STA !gsu_r13                              ; $058C77 |
  LDA $8B87,y                               ; $058C7A |
  STA !gsu_r12                              ; $058C7D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $058C80 |
  LSR A                                     ; $058C83 |
  STA !gsu_r5                               ; $058C84 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $058C87 |
  STA !gsu_r4                               ; $058C8A |
  LDA !s_spr_x_player_delta,x               ; $058C8D |
  STA !gsu_r7                               ; $058C90 |
  LDA !s_spr_y_player_delta,x               ; $058C93 |
  STA !gsu_r8                               ; $058C96 |
  LDA !s_player_invincibility_timer         ; $058C99 |
  STA !gsu_r9                               ; $058C9C |
  LDA #$1A00                                ; $058C9F |
  STA !gsu_r6                               ; $058CA2 |
  LDY !s_spr_dyntile_index,x                ; $058CA5 |
  TYX                                       ; $058CA8 |
  LDA $03A9CE,x                             ; $058CA9 |
  STA !gsu_r3                               ; $058CAD |
  LDA $03A9EE,x                             ; $058CB0 |
  STA !gsu_r2                               ; $058CB4 |
  LDX #$08                                  ; $058CB7 |
  LDA #$D67A                                ; $058CB9 |
  JSL r_gsu_init_1                          ; $058CBC | GSU init
  LDX $12                                   ; $058CC0 |
  INC $0CF9                                 ; $058CC2 |
  RTS                                       ; $058CC5 |

init_lava_bubble:
  LDA !s_spr_y_pixel_pos,x                  ; $058CC6 |
  STA !s_spr_wildcard_2_lo,x                ; $058CC9 |
  SEP #$20                                  ; $058CCC |
  LDA #$FF                                  ; $058CCE |
  STA $7863,x                               ; $058CD0 |
  REP #$20                                  ; $058CD3 |
  RTL                                       ; $058CD5 |

  dw $8D45, $8D82                           ; $058CD6 |

main_lava_bubble:
  LDA !s_spr_dyntile_index,x                ; $058CDA |
  BMI CODE_058CE3                           ; $058CDD |
  JSL $03AA52                               ; $058CDF |

CODE_058CE3:
  JSL $03AF23                               ; $058CE3 |
  LDY !s_spr_collision_id,x                 ; $058CE7 |
  BPL CODE_058CF2                           ; $058CEA |
  JSL player_hit_sprite                     ; $058CEC |
  BRA CODE_058CF8                           ; $058CF0 |

CODE_058CF2:
  JSL $0DC14C                               ; $058CF2 |
  BCS CODE_058D40                           ; $058CF6 |

CODE_058CF8:
  LDA !s_spr_id,x                           ; $058CF8 |
  CMP #$0080                                ; $058CFB |
  BEQ CODE_058D03                           ; $058CFE |
  JMP CODE_058E5F                           ; $058D00 |

CODE_058D03:
  TXY                                       ; $058D03 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $058D04 |
  ASL A                                     ; $058D06 |
  TAX                                       ; $058D07 |
  JSR ($8CD6,x)                             ; $058D08 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $058D0B |
  BEQ CODE_058D40                           ; $058D0D |
  LDA !s_spr_wildcard_1_lo,x                ; $058D0F |
  CLC                                       ; $058D12 |
  ADC #$0020                                ; $058D13 |
  CMP #$0100                                ; $058D16 |
  BMI CODE_058D3D                           ; $058D19 |
  AND #$00FF                                ; $058D1B |
  PHA                                       ; $058D1E |
  LDA #$01D6                                ; $058D1F |
  JSL spawn_ambient_sprite                  ; $058D22 |
  LDA #$0003                                ; $058D26 |
  STA $7E4C,y                               ; $058D29 |
  ASL A                                     ; $058D2C |
  STA $7782,y                               ; $058D2D |
  LDA !s_spr_x_pixel_pos,x                  ; $058D30 |
  STA $70A2,y                               ; $058D33 |
  LDA !s_spr_y_pixel_pos,x                  ; $058D36 |
  STA $7142,y                               ; $058D39 |
  PLA                                       ; $058D3C |

CODE_058D3D:
  STA !s_spr_wildcard_1_lo,x                ; $058D3D |

CODE_058D40:
  RTL                                       ; $058D40 |

  dw $0009, $0012                           ; $058D41 |

  TYX                                       ; $058D45 |
  LDA !s_spr_timer_2,x                      ; $058D46 |
  BNE CODE_058D81                           ; $058D49 |
  JSL $03AD74                               ; $058D4B |
  BCC CODE_058D81                           ; $058D4F |
  LDA $10                                   ; $058D51 |
  AND #$0002                                ; $058D53 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $058D56 |
  TAY                                       ; $058D58 |
  LDA $8D41,y                               ; $058D59 |
  STA !s_spr_y_accel,x                      ; $058D5C |
  LDA #$FD34                                ; $058D5F |
  STA !s_spr_y_speed_lo,x                   ; $058D62 |
  LDA #$0039                                ; $058D65 |\ play sound #$0039
  JSL push_sound_queue                      ; $058D68 |/
  SEP #$20                                  ; $058D6C |
  LDA !s_spr_oam_yxppccct,x                 ; $058D6E |
  AND #$7F                                  ; $058D71 |
  STA !s_spr_oam_yxppccct,x                 ; $058D73 |
  LDA #$02                                  ; $058D76 |
  STA !s_spr_draw_priority,x                ; $058D78 |
  REP #$20                                  ; $058D7B |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $058D7D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $058D7F |

CODE_058D81:
  RTS                                       ; $058D81 |

  TYX                                       ; $058D82 |
  LDA !s_spr_wildcard_2_lo,x                ; $058D83 |
  CMP !s_spr_y_pixel_pos,x                  ; $058D86 |
  BPL CODE_058DAA                           ; $058D89 |
  STA !s_spr_y_pixel_pos,x                  ; $058D8B |
  STZ !s_spr_y_speed_lo,x                   ; $058D8E |
  STZ !s_spr_y_accel,x                      ; $058D91 |
  JSL $03AEFD                               ; $058D94 |
  SEP #$20                                  ; $058D98 |
  LDA #$FF                                  ; $058D9A |
  STA !s_spr_draw_priority,x                ; $058D9C |
  REP #$20                                  ; $058D9F |
  LDA #$0060                                ; $058DA1 |
  STA !s_spr_timer_2,x                      ; $058DA4 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $058DA7 |
  RTS                                       ; $058DA9 |

CODE_058DAA:
  LDA !s_spr_y_speed_lo,x                   ; $058DAA |
  BPL CODE_058DB5                           ; $058DAD |
  EOR #$FFFF                                ; $058DAF |
  INC A                                     ; $058DB2 |
  BRA CODE_058DC9                           ; $058DB3 |

CODE_058DB5:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $058DB5 |
  BNE CODE_058DC9                           ; $058DB7 |
  PHA                                       ; $058DB9 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $058DBA |
  SEP #$20                                  ; $058DBC |
  LDA !s_spr_oam_yxppccct,x                 ; $058DBE |
  ORA #$80                                  ; $058DC1 |
  STA !s_spr_oam_yxppccct,x                 ; $058DC3 |
  REP #$20                                  ; $058DC6 |
  PLA                                       ; $058DC8 |

CODE_058DC9:
  LSR A                                     ; $058DC9 |
  CMP #$0080                                ; $058DCA |
  BPL CODE_058DD4                           ; $058DCD |
  LDA #$0080                                ; $058DCF |
  BRA CODE_058DDC                           ; $058DD2 |

CODE_058DD4:
  CMP #$0200                                ; $058DD4 |
  BMI CODE_058DDC                           ; $058DD7 |
  LDA #$01FF                                ; $058DD9 |

CODE_058DDC:
  STA !gsu_r11                              ; $058DDC |
  LDA #$0100                                ; $058DDF |
  STA !gsu_r6                               ; $058DE2 |
  LDA #$0054                                ; $058DE5 |
  STA !gsu_r13                              ; $058DE8 |
  LDA #$80B0                                ; $058DEB |
  STA !gsu_r12                              ; $058DEE |
  LDA #$0008                                ; $058DF1 |
  STA !gsu_r8                               ; $058DF4 |
  STA !gsu_r9                               ; $058DF7 |
  LDY !s_spr_dyntile_index,x                ; $058DFA |
  TYX                                       ; $058DFD |
  LDA $03A9CE,x                             ; $058DFE |
  STA !gsu_r3                               ; $058E02 |
  LDA $03A9EE,x                             ; $058E05 |
  STA !gsu_r2                               ; $058E09 |
  LDX #$08                                  ; $058E0C |
  LDA #$82FA                                ; $058E0E |
  JSL r_gsu_init_1                          ; $058E11 | GSU init
  LDX $12                                   ; $058E15 |
  INC $0CF9                                 ; $058E17 |
  RTS                                       ; $058E1A |

init_lava_bubble_arcing:
  LDA !s_spr_y_pixel_pos,x                  ; $058E1B |
  STA !s_spr_wildcard_2_lo,x                ; $058E1E |
  SEP #$20                                  ; $058E21 |
  LDA #$FF                                  ; $058E23 |
  STA $7863,x                               ; $058E25 |
  REP #$20                                  ; $058E28 |
  RTL                                       ; $058E2A |

  dw $8F11, $8F57, $908F                    ; $058E2B |
  dw $90B4, $9118, $9151                    ; $058E31 |

  dw $0080, $0100, $0180, $0200             ; $058E37 |
  dw $FF80, $FF00, $FE80, $FE00             ; $058E3F |
  dw $0008, $0000, $FFFF, $FFFF             ; $058E47 |
  dw $0008, $0000, $0008, $FFF8             ; $058E4F |
  dw $0000, $0000, $0008, $FFF8             ; $058E57 |

CODE_058E5F:
  TXY                                       ; $058E5F |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $058E60 |
  ASL A                                     ; $058E62 |
  TAX                                       ; $058E63 |
  JSR ($8E2B,x)                             ; $058E64 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $058E67 |
  BNE CODE_058E6C                           ; $058E69 |

CODE_058E6B:
  RTL                                       ; $058E6B |

CODE_058E6C:
  CPY #$03                                  ; $058E6C |
  BEQ CODE_058E7C                           ; $058E6E |
  CPY #$04                                  ; $058E70 |
  BEQ CODE_058E7C                           ; $058E72 |
  LDA !r_frame_counter_global               ; $058E74 |
  AND #$0007                                ; $058E77 |
  BNE CODE_058E6B                           ; $058E7A |

CODE_058E7C:
  LDA #$01D6                                ; $058E7C |
  JSL spawn_ambient_sprite                  ; $058E7F |
  LDA #$0003                                ; $058E83 |
  STA $7E4C,y                               ; $058E86 |
  ASL A                                     ; $058E89 |
  STA $7782,y                               ; $058E8A |
  LDA !s_spr_x_pixel_pos,x                  ; $058E8D |
  STA $70A2,y                               ; $058E90 |
  LDA !s_spr_y_pixel_pos,x                  ; $058E93 |
  STA $7142,y                               ; $058E96 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $058E99 |
  CMP #$0003                                ; $058E9B |
  BEQ CODE_058EA5                           ; $058E9E |
  CMP #$0004                                ; $058EA0 |
  BNE CODE_058F0C                           ; $058EA3 |

CODE_058EA5:
  PHY                                       ; $058EA5 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $058EA6 |
  LDA $8E53,y                               ; $058EA8 |
  STA $08                                   ; $058EAB |
  LDA $8E57,y                               ; $058EAD |
  STA $0A                                   ; $058EB0 |
  LDA $8E47,y                               ; $058EB2 |
  BPL CODE_058EC2                           ; $058EB5 |
  LDA $7974                                 ; $058EB7 |
  AND #$0001                                ; $058EBA |
  BEQ CODE_058EC2                           ; $058EBD |
  LDA #$0008                                ; $058EBF |

CODE_058EC2:
  STA $04                                   ; $058EC2 |
  LDA $8E4B,y                               ; $058EC4 |
  BPL CODE_058ED4                           ; $058EC7 |
  LDA $7974                                 ; $058EC9 |
  AND #$0001                                ; $058ECC |
  BEQ CODE_058ED4                           ; $058ECF |
  LDA #$0008                                ; $058ED1 |

CODE_058ED4:
  STA $06                                   ; $058ED4 |
  LDA $10                                   ; $058ED6 |
  PHA                                       ; $058ED8 |
  AND #$0006                                ; $058ED9 |
  CLC                                       ; $058EDC |
  ADC $04                                   ; $058EDD |
  TAY                                       ; $058EDF |
  LDA $8E37,y                               ; $058EE0 |
  STA $00                                   ; $058EE3 |
  PLA                                       ; $058EE5 |
  XBA                                       ; $058EE6 |
  AND #$0006                                ; $058EE7 |
  CLC                                       ; $058EEA |
  ADC $06                                   ; $058EEB |
  TAY                                       ; $058EED |
  LDA $8E37,y                               ; $058EEE |
  PLY                                       ; $058EF1 |
  STA $71E2,y                               ; $058EF2 |
  LDA $00                                   ; $058EF5 |
  STA $71E0,y                               ; $058EF7 |
  LDA $70A2,y                               ; $058EFA |
  CLC                                       ; $058EFD |
  ADC $08                                   ; $058EFE |
  STA $70A2,y                               ; $058F00 |
  LDA $7142,y                               ; $058F03 |
  CLC                                       ; $058F06 |
  ADC $0A                                   ; $058F07 |
  STA $7142,y                               ; $058F09 |

CODE_058F0C:
  RTL                                       ; $058F0C |

  dw $FF4D, $00B3                           ; $058F0D |

  TYX                                       ; $058F11 |
  LDA !s_spr_timer_2,x                      ; $058F12 |
  BNE CODE_058F47                           ; $058F15 |
  JSL $03AD74                               ; $058F17 |
  BCC CODE_058F47                           ; $058F1B |
  LDA !s_spr_x_player_dir,x                 ; $058F1D |
  TAY                                       ; $058F20 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $058F21 |
  LDA $8F0D,y                               ; $058F23 |
  STA !s_spr_x_speed_lo,x                   ; $058F26 |
  LDA #$FD34                                ; $058F29 |
  STA !s_spr_y_speed_lo,x                   ; $058F2C |
  LDA #$0009                                ; $058F2F |
  STA !s_spr_y_accel,x                      ; $058F32 |
  SEP #$20                                  ; $058F35 |
  LDA #$02                                  ; $058F37 |
  STA !s_spr_draw_priority,x                ; $058F39 |
  REP #$20                                  ; $058F3C |
  LDA #$0039                                ; $058F3E |\ play sound #$0039
  JSL push_sound_queue                      ; $058F41 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $058F45 |

CODE_058F47:
  RTS                                       ; $058F47 |

  db $04, $06, $06, $00, $FF, $FF, $06, $02 ; $058F48 |
  db $FF, $FF, $06, $00, $00, $FF, $06      ; $058F50 |

  TYX                                       ; $058F57 |
  LDA !s_spr_wildcard_2_lo,x                ; $058F58 |
  CMP !s_spr_y_pixel_pos,x                  ; $058F5B |
  BPL CODE_058F82                           ; $058F5E |
  STA !s_spr_y_pixel_pos,x                  ; $058F60 |
  STZ !s_spr_x_speed_lo,x                   ; $058F63 |
  STZ !s_spr_y_speed_lo,x                   ; $058F66 |
  STZ !s_spr_y_accel,x                      ; $058F69 |
  JSL $03AEFD                               ; $058F6C |
  SEP #$20                                  ; $058F70 |
  LDA #$FF                                  ; $058F72 |
  STA !s_spr_draw_priority,x                ; $058F74 |
  REP #$20                                  ; $058F77 |
  LDA #$0060                                ; $058F79 |
  STA !s_spr_timer_2,x                      ; $058F7C |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $058F7F |
  RTS                                       ; $058F81 |

CODE_058F82:
  LDA #$0001                                ; $058F82 |
  LDY !s_spr_y_speed_hi,x                   ; $058F85 |
  BPL CODE_058F8B                           ; $058F88 |
  INC A                                     ; $058F8A |

CODE_058F8B:
  ORA #$0004                                ; $058F8B |
  LDY !s_spr_x_speed_hi,x                   ; $058F8E |
  BPL CODE_058F96                           ; $058F91 |
  EOR #$000C                                ; $058F93 |

CODE_058F96:
  TAY                                       ; $058F96 |
  AND $7860,x                               ; $058F97 |
  BEQ CODE_059008                           ; $058F9A |
  STY $02                                   ; $058F9C |
  TAY                                       ; $058F9E |
  LDA $8F47,y                               ; $058F9F |
  AND #$00FF                                ; $058FA2 |
  CMP #$00FF                                ; $058FA5 |
  BNE CODE_058FD4                           ; $058FA8 |
  LDA !s_spr_x_speed_lo,x                   ; $058FAA |
  BPL CODE_058FB3                           ; $058FAD |
  EOR #$FFFF                                ; $058FAF |
  INC A                                     ; $058FB2 |

CODE_058FB3:
  STA $00                                   ; $058FB3 |
  LDA !s_spr_y_speed_lo,x                   ; $058FB5 |
  BPL CODE_058FBE                           ; $058FB8 |
  EOR #$FFFF                                ; $058FBA |
  INC A                                     ; $058FBD |

CODE_058FBE:
  CMP $00                                   ; $058FBE |
  BPL CODE_058FCB                           ; $058FC0 |
  LDA $02                                   ; $058FC2 |
  AND #$0008                                ; $058FC4 |
  LSR A                                     ; $058FC7 |
  LSR A                                     ; $058FC8 |
  BRA CODE_058FD4                           ; $058FC9 |

CODE_058FCB:
  LDA $02                                   ; $058FCB |
  AND #$0002                                ; $058FCD |
  CLC                                       ; $058FD0 |
  ADC #$0004                                ; $058FD1 |

CODE_058FD4:
  STA !s_spr_wildcard_3_lo_dp,x             ; $058FD4 |
  LDA !s_spr_x_speed_lo,x                   ; $058FD6 |
  STA !s_spr_gsu_morph_1_lo,x               ; $058FD9 |
  LDA !s_spr_y_speed_lo,x                   ; $058FDC |
  STA !s_spr_wildcard_1_lo,x                ; $058FDF |
  BPL CODE_058FEA                           ; $058FE2 |
  EOR #$FFFF                                ; $058FE4 |
  INC A                                     ; $058FE7 |
  BRA CODE_058FFA                           ; $058FE8 |

CODE_058FEA:
  CMP #$0100                                ; $058FEA |
  BPL CODE_058FFA                           ; $058FED |
  LDA #$0100                                ; $058FEF |
  STA !s_spr_wildcard_1_lo,x                ; $058FF2 |
  LDA #$00C0                                ; $058FF5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $058FF8 |

CODE_058FFA:
  STA !s_spr_wildcard_6_lo_dp,x             ; $058FFA |
  STZ !s_spr_x_speed_lo,x                   ; $058FFC |
  STZ !s_spr_y_speed_lo,x                   ; $058FFF |
  STZ !s_spr_y_accel,x                      ; $059002 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059005 |
  RTS                                       ; $059007 |

CODE_059008:
  JSR CODE_058073                           ; $059008 |
  LDA !gsu_r0                               ; $05900B |
  CLC                                       ; $05900E |
  ADC #$0080                                ; $05900F |
  AND #$01FE                                ; $059012 |
  STA !s_spr_gsu_morph_2_lo,x               ; $059015 |
  STZ !s_spr_facing_dir,x                   ; $059018 |
  LDA !s_spr_y_speed_lo,x                   ; $05901B |

CODE_05901E:
  BPL CODE_059024                           ; $05901E |
  EOR #$FFFF                                ; $059020 |
  INC A                                     ; $059023 |

CODE_059024:
  LSR A                                     ; $059024 |
  CMP #$0080                                ; $059025 |
  BPL CODE_05902F                           ; $059028 |
  LDA #$0080                                ; $05902A |
  BRA CODE_059037                           ; $05902D |

CODE_05902F:
  CMP #$0200                                ; $05902F |
  BMI CODE_059037                           ; $059032 |
  LDA #$01FE                                ; $059034 |

CODE_059037:
  STA !gsu_r11                              ; $059037 |
  STA $6022                                 ; $05903A |
  LSR A                                     ; $05903D |
  LSR A                                     ; $05903E |
  LSR A                                     ; $05903F |
  STA $00                                   ; $059040 |
  LDA #$0110                                ; $059042 |
  SEC                                       ; $059045 |
  SBC $00                                   ; $059046 |
  STA !gsu_r6                               ; $059048 |
  STA $6024                                 ; $05904B |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05904E |
  LSR A                                     ; $059051 |
  STA !gsu_r5                               ; $059052 |
  LDA #$0054                                ; $059055 |
  STA !gsu_r13                              ; $059058 |
  LDA #$80B0                                ; $05905B |
  STA !gsu_r12                              ; $05905E |
  PHX                                       ; $059061 |
  LDY !s_spr_dyntile_index,x                ; $059062 |
  TYX                                       ; $059065 |
  LDA $03A9CE,x                             ; $059066 |
  STA !gsu_r3                               ; $05906A |
  LDA $03A9EE,x                             ; $05906D |
  STA !gsu_r2                               ; $059071 |
  PLX                                       ; $059074 |
  LDX #$08                                  ; $059075 |
  LDA #$855F                                ; $059077 |
  JSL r_gsu_init_1                          ; $05907A | GSU init
  LDX $12                                   ; $05907E |
  INC $0CF9                                 ; $059080 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059083 |
  CPY #$01                                  ; $059085 |
  BNE CODE_05908E                           ; $059087 |
  LDA $6022                                 ; $059089 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05908C |

CODE_05908E:
  RTS                                       ; $05908E |

  TYX                                       ; $05908F |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $059090 |
  SEC                                       ; $059092 |
  SBC #$00A0                                ; $059093 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $059096 |
  JSR CODE_05901E                           ; $059098 |
  LDA $6022                                 ; $05909B |
  CMP #$0080                                ; $05909E |
  BNE CODE_0590AB                           ; $0590A1 |
  LDA $6024                                 ; $0590A3 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0590A6 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0590A9 |

CODE_0590AB:
  RTS                                       ; $0590AB |

  dw $00C0, $0040, $0080, $0000             ; $0590AC |

  TYX                                       ; $0590B4 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0590B5 |
  CLC                                       ; $0590B8 |
  ADC #$0020                                ; $0590B9 |
  CMP #$0154                                ; $0590BC |
  BMI CODE_0590C6                           ; $0590BF |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0590C1 |
  LDA #$0154                                ; $0590C3 |

CODE_0590C6:
  STA !s_spr_gsu_morph_2_lo,x               ; $0590C6 |
  STA !gsu_r6                               ; $0590C9 |
  LDA #$0200                                ; $0590CC |
  SEC                                       ; $0590CF |
  SBC !gsu_r6                               ; $0590D0 |
  LSR A                                     ; $0590D3 |
  STA !gsu_r11                              ; $0590D4 |
  LDA #$0054                                ; $0590D7 |
  STA !gsu_r13                              ; $0590DA |
  LDA #$80B0                                ; $0590DD |
  STA !gsu_r12                              ; $0590E0 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0590E3 |
  LDA $90AC,y                               ; $0590E5 |
  STA !gsu_r5                               ; $0590E8 |
  LDA #$0008                                ; $0590EB |
  STA !gsu_r8                               ; $0590EE |
  LDA #$000A                                ; $0590F1 |
  STA !gsu_r9                               ; $0590F4 |
  LDY !s_spr_dyntile_index,x                ; $0590F7 |
  TYX                                       ; $0590FA |
  LDA $03A9CE,x                             ; $0590FB |
  STA !gsu_r3                               ; $0590FF |
  LDA $03A9EE,x                             ; $059102 |
  STA !gsu_r2                               ; $059106 |
  LDX #$08                                  ; $059109 |
  LDA #$855F                                ; $05910B |
  JSL r_gsu_init_1                          ; $05910E | GSU init
  LDX $12                                   ; $059112 |
  INC $0CF9                                 ; $059114 |
  RTS                                       ; $059117 |

  TYX                                       ; $059118 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059119 |
  SEC                                       ; $05911C |
  SBC #$0060                                ; $05911D |
  CMP #$0100                                ; $059120 |
  BPL CODE_0590C6                           ; $059123 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $059125 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $059128 |
  CPY #$04                                  ; $05912A |
  BCS CODE_059132                           ; $05912C |
  EOR #$FFFF                                ; $05912E |
  INC A                                     ; $059131 |

CODE_059132:
  STA !s_spr_x_speed_lo,x                   ; $059132 |
  LDA !s_spr_wildcard_1_lo,x                ; $059135 |
  CPY #$04                                  ; $059138 |
  BCC CODE_059140                           ; $05913A |
  EOR #$FFFF                                ; $05913C |
  INC A                                     ; $05913F |

CODE_059140:
  STA !s_spr_y_speed_lo,x                   ; $059140 |
  LDA #$0009                                ; $059143 |
  STA !s_spr_y_accel,x                      ; $059146 |
  LDA #$0010                                ; $059149 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05914C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05914E |
  RTS                                       ; $059150 |

  TYX                                       ; $059151 |
  JSR CODE_058073                           ; $059152 |
  LDA !gsu_r0                               ; $059155 |
  CLC                                       ; $059158 |
  ADC #$0080                                ; $059159 |
  AND #$01FE                                ; $05915C |
  STA !s_spr_gsu_morph_2_lo,x               ; $05915F |
  STZ !s_spr_facing_dir,x                   ; $059162 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $059165 |
  CLC                                       ; $059167 |
  ADC #$0060                                ; $059168 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05916B |
  JSR CODE_05901E                           ; $05916D |
  LDA $6022                                 ; $059170 |
  DEC A                                     ; $059173 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $059174 |
  BMI CODE_05917C                           ; $059176 |
  LDY #$01                                  ; $059178 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05917A |

CODE_05917C:
  RTS                                       ; $05917C |

init_chain_chomp:
  JSL $03AE60                               ; $05917D |
  LDA !s_spr_x_pixel_pos,x                  ; $059181 |
  CLC                                       ; $059184 |
  ADC #$0004                                ; $059185 |
  STA $0DFD                                 ; $059188 |
  STA $0DFF                                 ; $05918B |
  STA $0E01                                 ; $05918E |
  STA $0E03                                 ; $059191 |
  STA !s_spr_wildcard_1_lo,x                ; $059194 |
  LDA !s_spr_y_pixel_pos,x                  ; $059197 |
  CLC                                       ; $05919A |
  ADC #$0008                                ; $05919B |
  STA $0E05                                 ; $05919E |
  STA $0E07                                 ; $0591A1 |
  STA $0E09                                 ; $0591A4 |
  STA $0E0B                                 ; $0591A7 |
  STA !s_spr_wildcard_2_lo,x                ; $0591AA |
  LDA #$0100                                ; $0591AD |
  STA !s_spr_gsu_morph_1_lo,x               ; $0591B0 |
  STZ $0E13                                 ; $0591B3 |
  JSR CODE_059372                           ; $0591B6 |
  RTL                                       ; $0591B9 |

  dw $948E                                  ; $0591BA |
  dw $9564                                  ; $0591BC |
  dw $9591                                  ; $0591BE |
  dw $95FD                                  ; $0591C0 |
  dw $963C                                  ; $0591C2 |
  dw $96EF                                  ; $0591C4 |

  dw $9080, $9090, $90A0, $9090             ; $0591C6 |
  dw $C000, $C020, $C040, $C020             ; $0591CE |

  dw $0200, $FE00                           ; $0591D6 |

main_chain_chomp:
  LDY !s_spr_oam_count,x                    ; $0591DA |
  BPL CODE_0591E8                           ; $0591DD |
  JSL $03ABFA                               ; $0591DF |
  LDA #$0080                                ; $0591E3 |
  BRA CODE_0591EF                           ; $0591E6 |

CODE_0591E8:
  JSL $03AA52                               ; $0591E8 |
  LDA #$0020                                ; $0591EC |

CODE_0591EF:
  STA $08                                   ; $0591EF |
  STZ $0A                                   ; $0591F1 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0591F3 |
  BEQ CODE_059208                           ; $0591F5 |
  CPY #$02                                  ; $0591F7 |
  BPL CODE_059208                           ; $0591F9 |
  LDA $7974                                 ; $0591FB |
  AND #$0004                                ; $0591FE |
  BNE CODE_059208                           ; $059201 |
  LDA #$8000                                ; $059203 |
  STA $0A                                   ; $059206 |

CODE_059208:
  PHX                                       ; $059208 |
  REP #$10                                  ; $059209 |
  LDA !s_spr_oam_pointer,x                  ; $05920B |
  CLC                                       ; $05920E |
  ADC $08                                   ; $05920F |
  TAY                                       ; $059211 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059212 |
  CMP #$0002                                ; $059214 |
  BMI CODE_059253                           ; $059217 |
  LDA $0E11                                 ; $059219 |
  BEQ CODE_059253                           ; $05921C |
  LDX #$0006                                ; $05921E |

CODE_059221:
  LDA $10                                   ; $059221 |
  PHA                                       ; $059223 |
  AND #$0001                                ; $059224 |
  CLC                                       ; $059227 |
  ADC $0DFD,x                               ; $059228 |
  SEC                                       ; $05922B |
  SBC !s_bg1_cam_x                          ; $05922C |
  STA $6000,y                               ; $05922F |
  PLA                                       ; $059232 |
  PHA                                       ; $059233 |
  XBA                                       ; $059234 |
  AND #$0001                                ; $059235 |
  CLC                                       ; $059238 |
  ADC $0E05,x                               ; $059239 |
  SEC                                       ; $05923C |
  SBC !s_bg1_cam_y                          ; $05923D |
  STA $6002,y                               ; $059240 |
  TYA                                       ; $059243 |
  CLC                                       ; $059244 |
  ADC #$0008                                ; $059245 |
  TAY                                       ; $059248 |
  PLA                                       ; $059249 |
  LSR A                                     ; $05924A |
  STA $10                                   ; $05924B |
  DEX                                       ; $05924D |
  DEX                                       ; $05924E |
  BPL CODE_059221                           ; $05924F |
  BRA CODE_059280                           ; $059251 |

CODE_059253:
  LDX #$0006                                ; $059253 |

CODE_059256:
  LDA $0DFD,x                               ; $059256 |
  SEC                                       ; $059259 |
  SBC !s_bg1_cam_x                          ; $05925A |
  CLC                                       ; $05925D |
  ADC $0A                                   ; $05925E |
  STA $6000,y                               ; $059260 |
  LDA $0E05,x                               ; $059263 |
  SEC                                       ; $059266 |
  SBC !s_bg1_cam_y                          ; $059267 |
  STA $6002,y                               ; $05926A |
  LDA $6004,y                               ; $05926D |
  AND #$3FFF                                ; $059270 |
  STA $6004,y                               ; $059273 |
  TYA                                       ; $059276 |
  CLC                                       ; $059277 |
  ADC #$0008                                ; $059278 |
  TAY                                       ; $05927B |
  DEX                                       ; $05927C |
  DEX                                       ; $05927D |
  BPL CODE_059256                           ; $05927E |

CODE_059280:
  SEP #$10                                  ; $059280 |
  PLX                                       ; $059282 |
  JSL $03AF23                               ; $059283 |
  TXY                                       ; $059287 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059288 |
  ASL A                                     ; $05928A |
  TAX                                       ; $05928B |
  JSR ($91BA,x)                             ; $05928C |
  JSR CODE_059372                           ; $05928F |
  STZ !s_spr_x_accel,x                      ; $059292 |
  LDA $603C                                 ; $059295 |
  STA $0E13                                 ; $059298 |
  BEQ CODE_0592FC                           ; $05929B |
  LDA #$0010                                ; $05929D |
  STA $0E11                                 ; $0592A0 |
  LDY !s_spr_y_speed_hi,x                   ; $0592A3 |
  BPL CODE_0592B5                           ; $0592A6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0592A8 |
  SEC                                       ; $0592AB |
  SBC !s_spr_y_delta_lo,x                   ; $0592AC |
  STA !s_spr_y_pixel_pos,x                  ; $0592AF |
  STZ !s_spr_y_speed_lo,x                   ; $0592B2 |

CODE_0592B5:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0592B5 |
  CPY #$02                                  ; $0592B7 |
  BPL CODE_0592DF                           ; $0592B9 |
  LDA $7860,x                               ; $0592BB |
  LSR A                                     ; $0592BE |
  BCS CODE_0592DF                           ; $0592BF |
  LDY #$00                                  ; $0592C1 |
  LDA !s_spr_wildcard_1_lo,x                ; $0592C3 |
  SEC                                       ; $0592C6 |
  SBC #$0004                                ; $0592C7 |
  CMP !s_spr_x_pixel_pos,x                  ; $0592CA |
  BPL CODE_0592D1                           ; $0592CD |
  INY                                       ; $0592CF |
  INY                                       ; $0592D0 |

CODE_0592D1:
  LDA $91D6,y                               ; $0592D1 |
  STA !s_spr_x_accel_ceiling,x              ; $0592D4 |
  LDA #$0020                                ; $0592D7 |
  STA !s_spr_x_accel,x                      ; $0592DA |
  BRA CODE_059304                           ; $0592DD |

CODE_0592DF:
  LDA !s_spr_x_pixel_pos,x                  ; $0592DF |
  SEC                                       ; $0592E2 |
  SBC !s_spr_wildcard_1_lo,x                ; $0592E3 |
  CLC                                       ; $0592E6 |
  ADC #$0004                                ; $0592E7 |
  EOR !s_spr_x_speed_lo,x                   ; $0592EA |
  BMI CODE_0592FC                           ; $0592ED |
  LDA !s_spr_x_pixel_pos,x                  ; $0592EF |
  SEC                                       ; $0592F2 |
  SBC !s_spr_x_delta_lo,x                   ; $0592F3 |
  STA !s_spr_x_pixel_pos,x                  ; $0592F6 |
  STZ !s_spr_x_speed_lo,x                   ; $0592F9 |

CODE_0592FC:
  LDA $0E11                                 ; $0592FC |
  BEQ CODE_059304                           ; $0592FF |
  DEC $0E11                                 ; $059301 |

CODE_059304:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059304 |
  CPY #$04                                  ; $059306 |
  BMI CODE_05930B                           ; $059308 |
  RTL                                       ; $05930A |

CODE_05930B:
  JSL $03A5B7                               ; $05930B |
  LDY !s_spr_collision_id,x                 ; $05930F |
  DEY                                       ; $059312 |
  BMI CODE_059371                           ; $059313 |
  LDA !s_spr_state,y                        ; $059315 |
  CMP #$0010                                ; $059318 |
  BNE CODE_059371                           ; $05931B |
  LDA !s_spr_collision_state,y              ; $05931D |
  BEQ CODE_059371                           ; $059320 |
  LDA !s_spr_oam_1,y                        ; $059322 |
  LSR A                                     ; $059325 |
  PHP                                       ; $059326 |
  LDA !s_spr_x_speed_lo,y                   ; $059327 |
  CMP #$8000                                ; $05932A |
  ROR A                                     ; $05932D |
  CMP #$8000                                ; $05932E |
  ROR A                                     ; $059331 |
  PLP                                       ; $059332 |
  BCS CODE_059339                           ; $059333 |
  CMP #$8000                                ; $059335 |
  ROR A                                     ; $059338 |

CODE_059339:
  CLC                                       ; $059339 |
  ADC !s_spr_x_speed_lo,x                   ; $05933A |
  CMP #$0200                                ; $05933D |
  BMI CODE_059345                           ; $059340 |
  LDA #$0200                                ; $059342 |

CODE_059345:
  CMP #$FE00                                ; $059345 |
  BPL CODE_05934D                           ; $059348 |
  LDA #$FE00                                ; $05934A |

CODE_05934D:
  STA !s_spr_x_speed_lo,x                   ; $05934D |
  LDA #$FB00                                ; $059350 |
  STA !s_spr_y_speed_lo,x                   ; $059353 |
  LDA #$0040                                ; $059356 |
  STA !s_spr_y_accel,x                      ; $059359 |
  TYX                                       ; $05935C |
  LDA #$0079                                ; $05935D |\ play sound #$0079
  JSL push_sound_queue                      ; $059360 |/
  JSL $03B25B                               ; $059364 |
  LDA #$0001                                ; $059368 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05936B |
  LDY #$01                                  ; $05936D |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05936F |

CODE_059371:
  RTL                                       ; $059371 |

CODE_059372:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059372 |
  CPY #$02                                  ; $059374 |
  BNE CODE_05938D                           ; $059376 |
  LDA !s_spr_x_speed_lo,x                   ; $059378 |
  BNE CODE_059388                           ; $05937B |
  LDA $7860,x                               ; $05937D |
  LSR A                                     ; $059380 |
  BCS CODE_059394                           ; $059381 |
  LDA !s_spr_y_speed_lo,x                   ; $059383 |
  BEQ CODE_059394                           ; $059386 |

CODE_059388:
  JSR CODE_058073                           ; $059388 |
  BRA CODE_059394                           ; $05938B |

CODE_05938D:
  CPY #$04                                  ; $05938D |
  BPL CODE_059394                           ; $05938F |
  STZ !s_spr_gsu_morph_2_lo,x               ; $059391 |

CODE_059394:
  LDY #$06                                  ; $059394 |

CODE_059396:
  LDA $0DFD,y                               ; $059396 |
  STA $6020,y                               ; $059399 |
  LDA $0E05,y                               ; $05939C |
  STA $6028,y                               ; $05939F |
  DEY                                       ; $0593A2 |
  DEY                                       ; $0593A3 |
  BPL CODE_059396                           ; $0593A4 |
  LDA !s_spr_wildcard_2_lo,x                ; $0593A6 |
  STA !gsu_r9                               ; $0593A9 |
  LDA !s_spr_wildcard_1_lo,x                ; $0593AC |
  STA !gsu_r8                               ; $0593AF |
  LDA !s_spr_x_pixel_pos,x                  ; $0593B2 |
  STA !gsu_r1                               ; $0593B5 |
  STA !gsu_r7                               ; $0593B8 |
  SEC                                       ; $0593BB |
  SBC !s_spr_wildcard_1_lo,x                ; $0593BC |
  SEC                                       ; $0593BF |
  SBC #$0004                                ; $0593C0 |
  BPL CODE_0593C9                           ; $0593C3 |
  EOR #$FFFF                                ; $0593C5 |
  INC A                                     ; $0593C8 |

CODE_0593C9:
  STA !gsu_r3                               ; $0593C9 |
  LDA !s_spr_y_pixel_pos,x                  ; $0593CC |
  STA !gsu_r2                               ; $0593CF |
  SEC                                       ; $0593D2 |
  SBC !s_spr_wildcard_2_lo,x                ; $0593D3 |
  SEC                                       ; $0593D6 |
  SBC #$0008                                ; $0593D7 |
  BPL CODE_0593E0                           ; $0593DA |
  EOR #$FFFF                                ; $0593DC |
  INC A                                     ; $0593DF |

CODE_0593E0:
  STA !gsu_r4                               ; $0593E0 |
  LDA #$1000                                ; $0593E3 |
  STA !gsu_r5                               ; $0593E6 |
  XBA                                       ; $0593E9 |
  STA !gsu_r10                              ; $0593EA |
  LDA !s_spr_anim_frame,x                   ; $0593ED |
  STA $6040                                 ; $0593F0 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0593F3 |
  LSR A                                     ; $0593F5 |
  DEC A                                     ; $0593F6 |
  STA $6042                                 ; $0593F7 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0593FA |
  STA $604C                                 ; $0593FD |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059400 |
  LSR A                                     ; $059403 |
  STA $604A                                 ; $059404 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $059407 |
  LDA #$0054                                ; $059409 |
  STA $605A                                 ; $05940C |
  LDA $91C6,y                               ; $05940F |
  STA $6058                                 ; $059412 |
  PHX                                       ; $059415 |
  LDY !s_spr_dyntile_index,x                ; $059416 |
  TYX                                       ; $059419 |
  LDA $03A9CE,x                             ; $05941A |
  STA $6046                                 ; $05941E |
  LDA $03A9EE,x                             ; $059421 |
  STA $6044                                 ; $059425 |
  PLX                                       ; $059428 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059429 |
  CPY #$03                                  ; $05942B |
  BEQ CODE_05945A                           ; $05942D |
  CPY #$02                                  ; $05942F |
  BPL CODE_059465                           ; $059431 |
  LDA !s_spr_y_pixel_pos,x                  ; $059433 |
  CLC                                       ; $059436 |
  ADC #$0007                                ; $059437 |
  CMP !gsu_r9                               ; $05943A |
  BMI CODE_05945A                           ; $05943D |
  LDY $0E13                                 ; $05943F |
  BEQ CODE_05944F                           ; $059442 |
  LDX #$08                                  ; $059444 |
  LDA #$D883                                ; $059446 |
  JSL r_gsu_init_1                          ; $059449 | GSU init
  BRA CODE_05946E                           ; $05944D |

CODE_05944F:
  LDX #$08                                  ; $05944F |
  LDA #$D8F0                                ; $059451 |
  JSL r_gsu_init_1                          ; $059454 | GSU init
  BRA CODE_05946E                           ; $059458 |

CODE_05945A:
  LDX #$08                                  ; $05945A |
  LDA #$D776                                ; $05945C |
  JSL r_gsu_init_1                          ; $05945F | GSU init
  BRA CODE_05946E                           ; $059463 |

CODE_059465:
  LDX #$08                                  ; $059465 |
  LDA #$D7FA                                ; $059467 |
  JSL r_gsu_init_1                          ; $05946A | GSU init

CODE_05946E:
  LDX $12                                   ; $05946E |
  INC $0CF9                                 ; $059470 |
  LDY #$06                                  ; $059473 |

CODE_059475:
  LDA $6020,y                               ; $059475 |
  STA $0DFD,y                               ; $059478 |
  LDA $6028,y                               ; $05947B |
  STA $0E05,y                               ; $05947E |
  DEY                                       ; $059481 |
  DEY                                       ; $059482 |
  BPL CODE_059475                           ; $059483 |
  RTS                                       ; $059485 |

  dw $FE80, $0180                           ; $059486 |

  dw $FB00, $0500                           ; $05948A |

  TYX                                       ; $05948E |
  LDA !s_spr_timer_3,x                      ; $05948F |
  BEQ CODE_0594A1                           ; $059492 |
  LDA $7860,x                               ; $059494 |
  LSR A                                     ; $059497 |
  BCC CODE_05949D                           ; $059498 |
  STZ !s_spr_x_speed_lo,x                   ; $05949A |

CODE_05949D:
  JSR CODE_0595C1                           ; $05949D |
  RTS                                       ; $0594A0 |

CODE_0594A1:
  LDA !s_spr_x_player_delta,x               ; $0594A1 |
  CLC                                       ; $0594A4 |
  ADC #$0040                                ; $0594A5 |
  CMP #$0080                                ; $0594A8 |
  BCC CODE_0594D9                           ; $0594AB |
  LDA $10                                   ; $0594AD |
  BIT #$0003                                ; $0594AF |
  BEQ CODE_0594D3                           ; $0594B2 |
  PHA                                       ; $0594B4 |
  AND #$0003                                ; $0594B5 |
  INC A                                     ; $0594B8 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0594B9 |
  PLA                                       ; $0594BB |
  XBA                                       ; $0594BC |
  AND #$0002                                ; $0594BD |
  STA !s_spr_facing_dir,x                   ; $0594C0 |
  TAY                                       ; $0594C3 |
  LDA $9486,y                               ; $0594C4 |
  STA !s_spr_x_speed_lo,x                   ; $0594C7 |
  LDA #$FE00                                ; $0594CA |
  STA !s_spr_y_speed_lo,x                   ; $0594CD |
  JMP CODE_059561                           ; $0594D0 |

CODE_0594D3:
  XBA                                       ; $0594D3 |
  BIT #$0003                                ; $0594D4 |
  BEQ CODE_0594DE                           ; $0594D7 |

CODE_0594D9:
  LDY !s_spr_x_player_dir,x                 ; $0594D9 |
  BRA CODE_0594E5                           ; $0594DC |

CODE_0594DE:
  LDA !s_spr_facing_dir,x                   ; $0594DE |
  EOR #$0002                                ; $0594E1 |
  TAY                                       ; $0594E4 |

CODE_0594E5:
  LDA $948A,y                               ; $0594E5 |
  STA !s_spr_x_speed_lo,x                   ; $0594E8 |
  STA $0E0F                                 ; $0594EB |
  TYA                                       ; $0594EE |
  STA !s_spr_facing_dir,x                   ; $0594EF |
  LDA $10                                   ; $0594F2 |
  PHP                                       ; $0594F4 |
  AND #$01FF                                ; $0594F5 |
  CLC                                       ; $0594F8 |
  ADC #$0300                                ; $0594F9 |
  EOR #$FFFF                                ; $0594FC |
  INC A                                     ; $0594FF |
  STA !s_spr_y_speed_lo,x                   ; $059500 |
  PLP                                       ; $059503 |
  BMI CODE_05954F                           ; $059504 |
  LDA #$0080                                ; $059506 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059509 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05950C |
  LDA #$01FE                                ; $05950F |
  STA $0E0D                                 ; $059512 |
  LDA #$0050                                ; $059515 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $059518 |
  JSL $03AEFD                               ; $05951A |
  LDA #$0083                                ; $05951E |\ play sound #$0083
  JSL push_sound_queue                      ; $059521 |/
  JSL $03ADD0                               ; $059525 |
  BCS CODE_059537                           ; $059529 |
  LDA #$0100                                ; $05952B |
  STA $0E0D                                 ; $05952E |
  JSL $03AD74                               ; $059531 |
  BRA CODE_059540                           ; $059535 |

CODE_059537:
  INC !s_spr_anim_frame,x                   ; $059537 |
  LDA #$A005                                ; $05953A |
  STA !s_spr_oam_1,x                        ; $05953D |

CODE_059540:
  LDA #$00A0                                ; $059540 |
  STA !s_spr_timer_2,x                      ; $059543 |
  STZ !s_spr_y_accel,x                      ; $059546 |
  LDY #$04                                  ; $059549 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05954B |
  PLA                                       ; $05954D |
  RTL                                       ; $05954E |

CODE_05954F:
  LDA #$007B                                ; $05954F |\ play sound #$007B
  JSL push_sound_queue                      ; $059552 |/
  LDA #$0060                                ; $059556 |
  STA !s_spr_timer_2,x                      ; $059559 |
  STZ !s_spr_y_accel,x                      ; $05955C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05955F |

CODE_059561:
  INC !s_spr_wildcard_5_lo_dp,x             ; $059561 |
  RTS                                       ; $059563 |

  TYX                                       ; $059564 |
  LDY $0E13                                 ; $059565 |
  BNE CODE_05957B                           ; $059568 |
  LDA $7860,x                               ; $05956A |
  LSR A                                     ; $05956D |
  BCC CODE_05958D                           ; $05956E |
  LDA #$0026                                ; $059570 |\ play sound #$0026
  JSL push_sound_queue                      ; $059573 |/
  DEC !s_spr_wildcard_3_lo_dp,x             ; $059577 |
  BNE CODE_059587                           ; $059579 |

CODE_05957B:
  STZ !s_spr_x_speed_lo,x                   ; $05957B |
  LDA #$0020                                ; $05957E |
  STA !s_spr_timer_3,x                      ; $059581 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $059584 |
  RTS                                       ; $059586 |

CODE_059587:
  LDA #$FE00                                ; $059587 |
  STA !s_spr_y_speed_lo,x                   ; $05958A |

CODE_05958D:
  JSR CODE_0595CE                           ; $05958D |
  RTS                                       ; $059590 |

  TYX                                       ; $059591 |
  LDA !s_spr_timer_2,x                      ; $059592 |
  BNE CODE_0595AA                           ; $059595 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $059597 |
  STZ !s_spr_x_speed_lo,x                   ; $059599 |
  STZ !s_spr_y_speed_lo,x                   ; $05959C |
  LDA #$0020                                ; $05959F |
  STA !s_spr_timer_3,x                      ; $0595A2 |
  ASL A                                     ; $0595A5 |
  STA !s_spr_y_accel,x                      ; $0595A6 |
  RTS                                       ; $0595A9 |

CODE_0595AA:
  LDA !s_spr_x_speed_lo,x                   ; $0595AA |
  BNE CODE_0595BA                           ; $0595AD |
  LDA $7860,x                               ; $0595AF |
  LSR A                                     ; $0595B2 |
  BCS CODE_0595BF                           ; $0595B3 |
  LDA !s_spr_y_speed_lo,x                   ; $0595B5 |
  BEQ CODE_0595BF                           ; $0595B8 |

CODE_0595BA:
  LDY #$04                                  ; $0595BA |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0595BC |
  RTS                                       ; $0595BE |

CODE_0595BF:
  BRA CODE_0595CE                           ; $0595BF |

CODE_0595C1:
  LDA #$0008                                ; $0595C1 |
  STA $00                                   ; $0595C4 |
  LSR A                                     ; $0595C6 |
  BRA CODE_0595D6                           ; $0595C7 |

CODE_0595C9:
  LDA #$0010                                ; $0595C9 |
  BRA CODE_0595D1                           ; $0595CC |

CODE_0595CE:
  LDA #$0008                                ; $0595CE |

CODE_0595D1:
  STA $00                                   ; $0595D1 |
  LDA #$0002                                ; $0595D3 |

CODE_0595D6:
  STA $02                                   ; $0595D6 |
  LDA !s_spr_timer_1,x                      ; $0595D8 |
  BNE CODE_0595FC                           ; $0595DB |
  LDA $02                                   ; $0595DD |
  STA !s_spr_timer_1,x                      ; $0595DF |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0595E2 |
  INC A                                     ; $0595E4 |
  INC A                                     ; $0595E5 |
  CMP $00                                   ; $0595E6 |
  BCC CODE_0595EE                           ; $0595E8 |
  LSR A                                     ; $0595EA |
  AND #$FFF8                                ; $0595EB |

CODE_0595EE:
  STA !s_spr_wildcard_4_lo_dp,x             ; $0595EE |
  CMP #$0008                                ; $0595F0 |
  BNE CODE_0595FC                           ; $0595F3 |
  LDA #$0064                                ; $0595F5 |\ play sound #$0064
  JSL push_sound_queue                      ; $0595F8 |/

CODE_0595FC:
  RTS                                       ; $0595FC |

  TYX                                       ; $0595FD |
  LDA !s_spr_wildcard_1_lo,x                ; $0595FE |
  CLC                                       ; $059601 |
  ADC !s_spr_x_delta_lo,x                   ; $059602 |
  STA !s_spr_wildcard_1_lo,x                ; $059605 |
  LDA !s_spr_wildcard_2_lo,x                ; $059608 |
  CLC                                       ; $05960B |
  ADC !s_spr_y_delta_lo,x                   ; $05960C |
  STA !s_spr_wildcard_2_lo,x                ; $05960F |
  BRA CODE_0595CE                           ; $059612 |

  dw $001C, $002C, $0180, $FE80             ; $059614 |

  dw $0100, $00C4, $0100, $00D8             ; $05961C |
  dw $0100, $00F0, $0100, $0100             ; $059624 |
  dw $01FE, $013C, $01FE, $0174             ; $05962C |
  dw $01FE, $019A, $01FE, $01FE             ; $059634 |

  TYX                                       ; $05963C |
  LDA !s_spr_timer_2,x                      ; $05963D |
  BNE CODE_05965A                           ; $059640 |
  LDA #$0040                                ; $059642 |
  STA !s_spr_y_accel,x                      ; $059645 |
  LDY #$00                                  ; $059648 |
  LDA $0E0F                                 ; $05964A |
  BMI CODE_059651                           ; $05964D |
  INY                                       ; $05964F |
  INY                                       ; $059650 |

CODE_059651:
  LDA $9618,y                               ; $059651 |
  STA !s_spr_x_speed_lo,x                   ; $059654 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059657 |
  RTS                                       ; $059659 |

CODE_05965A:
  LDA !s_spr_oam_1,x                        ; $05965A |
  AND #$8000                                ; $05965D |
  XBA                                       ; $059660 |
  ASL A                                     ; $059661 |
  ASL A                                     ; $059662 |
  XBA                                       ; $059663 |
  TAY                                       ; $059664 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059665 |
  AND #$0002                                ; $059668 |
  BEQ CODE_05967E                           ; $05966B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05966D |
  SEC                                       ; $059670 |
  SBC $9614,y                               ; $059671 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059674 |
  CMP $0E0D                                 ; $059677 |
  BPL CODE_0596D1                           ; $05967A |
  BRA CODE_05968E                           ; $05967C |

CODE_05967E:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05967E |
  CLC                                       ; $059681 |
  ADC $9614,y                               ; $059682 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059685 |
  DEC A                                     ; $059688 |
  CMP $0E0D                                 ; $059689 |
  BMI CODE_0596D1                           ; $05968C |

CODE_05968E:
  LDA $0E0D                                 ; $05968E |
  STA !s_spr_gsu_morph_1_lo,x               ; $059691 |
  STZ !s_spr_x_speed_lo,x                   ; $059694 |
  STZ !s_spr_y_speed_lo,x                   ; $059697 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05969A |
  INC A                                     ; $05969D |
  INC A                                     ; $05969E |
  CMP #$0010                                ; $05969F |
  BMI CODE_0596A7                           ; $0596A2 |
  LDA #$000E                                ; $0596A4 |

CODE_0596A7:
  STA !s_spr_gsu_morph_2_lo,x               ; $0596A7 |
  LDA !s_spr_oam_1,x                        ; $0596AA |
  AND #$8000                                ; $0596AD |
  XBA                                       ; $0596B0 |
  LSR A                                     ; $0596B1 |
  LSR A                                     ; $0596B2 |
  LSR A                                     ; $0596B3 |
  STA $00                                   ; $0596B4 |
  CLC                                       ; $0596B6 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $0596B7 |
  TAY                                       ; $0596BA |
  LDA $961C,y                               ; $0596BB |
  STA $0E0D                                 ; $0596BE |
  LDY $00                                   ; $0596C1 |
  LDA $961C,y                               ; $0596C3 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $0596C6 |
  BNE CODE_0596D1                           ; $0596C9 |
  LDA #$0010                                ; $0596CB |
  STA $0E11                                 ; $0596CE |

CODE_0596D1:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0596D1 |
  BNE CODE_0596D8                           ; $0596D3 |
  JMP CODE_0595C9                           ; $0596D5 |

CODE_0596D8:
  LDY #$0C                                  ; $0596D8 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0596DA |
  LDA !s_spr_x_speed_lo,x                   ; $0596DC |
  ORA !s_spr_y_speed_lo,x                   ; $0596DF |
  BNE CODE_0596EA                           ; $0596E2 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0596E4 |
  BEQ CODE_0596EA                           ; $0596E6 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0596E8 |

CODE_0596EA:
  RTS                                       ; $0596EA |

  dw $0006, $0008                           ; $0596EB |

  TYX                                       ; $0596EF |
  LDA $7860,x                               ; $0596F0 |
  AND #$0001                                ; $0596F3 |
  BEQ CODE_0596FB                           ; $0596F6 |
  STZ !s_spr_x_speed_lo,x                   ; $0596F8 |

CODE_0596FB:
  LDY #$08                                  ; $0596FB |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0596FD |
  LDA !s_spr_oam_1,x                        ; $0596FF |
  AND #$8000                                ; $059702 |
  XBA                                       ; $059705 |
  ASL A                                     ; $059706 |
  ASL A                                     ; $059707 |
  XBA                                       ; $059708 |
  TAY                                       ; $059709 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05970A |
  SEC                                       ; $05970D |
  SBC $96EB,y                               ; $05970E |
  CMP #$0080                                ; $059711 |
  BPL CODE_059748                           ; $059714 |
  LDA #$0020                                ; $059716 |
  STA !s_spr_timer_3,x                      ; $059719 |
  LDY !s_spr_oam_count,x                    ; $05971C |
  BPL CODE_059741                           ; $05971F |
  JSL $03AEFD                               ; $059721 |
  JSL $03AD74                               ; $059725 |
  DEC !s_spr_anim_frame,x                   ; $059729 |
  LDA #$4005                                ; $05972C |
  STA !s_spr_oam_1,x                        ; $05972F |
  STZ !s_spr_gsu_morph_2_lo,x               ; $059732 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $059735 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $059737 |
  LDA #$0100                                ; $059739 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05973C |
  PLA                                       ; $05973F |
  RTL                                       ; $059740 |

CODE_059741:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $059741 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $059743 |
  LDA #$0100                                ; $059745 |

CODE_059748:
  STA !s_spr_gsu_morph_1_lo,x               ; $059748 |
  RTS                                       ; $05974B |

init_swing_of_grinders:
  JSL $03AE60                               ; $05974C |
  LDA !s_spr_dyntile_index,x                ; $059750 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $059753 |
  JSL $03AE60                               ; $059755 |
  LDA #$FE40                                ; $059759 |
  STA !s_spr_x_accel_ceiling,x              ; $05975C |
  STA !s_spr_y_accel_ceiling,x              ; $05975F |
  LDA #$8000                                ; $059762 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059765 |
  STA !s_spr_gsu_morph_2_lo,x               ; $059768 |
  LDA #$0018                                ; $05976B |
  STA !s_spr_timer_4,x                      ; $05976E |
  JSR CODE_059A9F                           ; $059771 |
  RTL                                       ; $059774 |

main_swing_of_grinders:
  JSR CODE_0597A9                           ; $059775 |
  LDA !s_spr_state,x                        ; $059778 |
  CMP #$0006                                ; $05977B |
  BNE CODE_059792                           ; $05977E |
  LDA !s_spr_dyntile_index,x                ; $059780 |
  BMI CODE_059789                           ; $059783 |
  JSL $03AEFD                               ; $059785 |

CODE_059789:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $059789 |
  STA !s_spr_dyntile_index,x                ; $05978B |
  JSL $03AEFD                               ; $05978E |

CODE_059792:
  JSL $03AF23                               ; $059792 |
  JSR CODE_05988A                           ; $059796 |
  JSR CODE_05989A                           ; $059799 |
  JSR CODE_0599DD                           ; $05979C |
  JSR CODE_059A9F                           ; $05979F |
  RTL                                       ; $0597A2 |

  dw $FFF0, $0010, $FFF0                    ; $0597A3 |

CODE_0597A9:
  LDY !s_spr_gsu_morph_1_hi,x               ; $0597A9 |
  TYA                                       ; $0597AC |
  ASL A                                     ; $0597AD |
  STA !gsu_r1                               ; $0597AE |
  STA !gsu_r7                               ; $0597B1 |
  LDY !s_spr_gsu_morph_2_hi,x               ; $0597B4 |
  TYA                                       ; $0597B7 |
  ASL A                                     ; $0597B8 |
  STA !gsu_r5                               ; $0597B9 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0597BC |
  SEC                                       ; $0597BF |
  SBC !s_spr_gsu_morph_1_lo,x               ; $0597C0 |
  XBA                                       ; $0597C3 |
  TAY                                       ; $0597C4 |
  TYA                                       ; $0597C5 |
  CPY #$00                                  ; $0597C6 |
  BPL CODE_0597CD                           ; $0597C8 |
  ORA #$FF00                                ; $0597CA |

CODE_0597CD:
  ASL A                                     ; $0597CD |
  STA !gsu_r0                               ; $0597CE |
  LDA !s_spr_facing_dir,x                   ; $0597D1 |
  STA !gsu_r8                               ; $0597D4 |
  LDX #$0B                                  ; $0597D7 |
  LDA #$950A                                ; $0597D9 |
  JSL r_gsu_init_1                          ; $0597DC | GSU init
  LDX $12                                   ; $0597E0 |
  JSL $03AA52                               ; $0597E2 |
  REP #$10                                  ; $0597E6 |
  LDA !s_spr_oam_pointer,x                  ; $0597E8 |
  CLC                                       ; $0597EB |
  ADC #$0020                                ; $0597EC |
  PHA                                       ; $0597EF |
  TAY                                       ; $0597F0 |
  JSL $03AA60                               ; $0597F1 |
  LDA !s_spr_dyntile_index,x                ; $0597F5 |
  STA $00                                   ; $0597F8 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0597FA |
  STA !s_spr_dyntile_index,x                ; $0597FC |
  REP #$10                                  ; $0597FF |
  PLA                                       ; $059801 |
  CLC                                       ; $059802 |
  ADC #$0020                                ; $059803 |
  PHA                                       ; $059806 |
  TAY                                       ; $059807 |
  JSL $03AA60                               ; $059808 |
  REP #$10                                  ; $05980C |
  PLA                                       ; $05980E |
  CLC                                       ; $05980F |
  ADC #$0020                                ; $059810 |
  TAY                                       ; $059813 |
  JSL $03AA60                               ; $059814 |
  LDA $00                                   ; $059818 |
  STA !s_spr_dyntile_index,x                ; $05981A |
  LDA !s_spr_cam_x_pos,x                    ; $05981D |
  CLC                                       ; $059820 |
  ADC #$0008                                ; $059821 |
  LDY !s_spr_facing_dir,x                   ; $059824 |
  CLC                                       ; $059827 |
  ADC $97A3,y                               ; $059828 |
  STA $00                                   ; $05982B |
  LDA $97A5,y                               ; $05982D |
  STA $02                                   ; $059830 |
  LDA !s_spr_cam_y_pos,x                    ; $059832 |
  SEC                                       ; $059835 |
  SBC #$0008                                ; $059836 |
  STA $04                                   ; $059839 |
  LDA #$6020                                ; $05983B |
  STA $06                                   ; $05983E |
  LDA #$0004                                ; $059840 |
  STA $0A                                   ; $059843 |
  REP #$10                                  ; $059845 |
  LDY !s_spr_oam_pointer,x                  ; $059847 |

CODE_05984A:
  LDA ($06)                                 ; $05984A |
  CLC                                       ; $05984C |
  ADC $00                                   ; $05984D |
  STA $6000,y                               ; $05984F |
  STA $6010,y                               ; $059852 |
  CLC                                       ; $059855 |
  ADC $02                                   ; $059856 |
  STA $6008,y                               ; $059858 |
  STA $6018,y                               ; $05985B |
  INC $06                                   ; $05985E |
  INC $06                                   ; $059860 |
  LDA ($06)                                 ; $059862 |
  CLC                                       ; $059864 |
  ADC $04                                   ; $059865 |
  STA $6002,y                               ; $059867 |
  STA $600A,y                               ; $05986A |
  CLC                                       ; $05986D |
  ADC #$0010                                ; $05986E |
  STA $6012,y                               ; $059871 |
  STA $601A,y                               ; $059874 |
  DEC $0A                                   ; $059877 |
  BEQ CODE_059887                           ; $059879 |
  INC $06                                   ; $05987B |
  INC $06                                   ; $05987D |
  TYA                                       ; $05987F |
  CLC                                       ; $059880 |
  ADC #$0020                                ; $059881 |
  TAY                                       ; $059884 |
  BRA CODE_05984A                           ; $059885 |

CODE_059887:
  SEP #$10                                  ; $059887 |

CODE_059889:
  RTS                                       ; $059889 |

CODE_05988A:
  JSL $03A2DE                               ; $05988A |
  BCC CODE_059889                           ; $05988E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $059890 |
  STA !s_spr_dyntile_index,x                ; $059892 |
  PLA                                       ; $059895 |
  JML $03AEFD                               ; $059896 |

CODE_05989A:
  LDY #$0C                                  ; $05989A |
  LDA !s_baby_mario_state                   ; $05989C |
  BIT #$6000                                ; $05989F |
  BNE CODE_059889                           ; $0598A2 |
  LDY $61CC                                 ; $0598A4 |
  BNE CODE_059889                           ; $0598A7 |
  AND #$8000                                ; $0598A9 |
  BEQ CODE_0598D6                           ; $0598AC |

CODE_0598AE:
  LDA !s_spr_x_player_delta,x               ; $0598AE |
  CLC                                       ; $0598B1 |
  ADC $6020,y                               ; $0598B2 |
  CLC                                       ; $0598B5 |
  ADC #$0010                                ; $0598B6 |
  CMP #$0020                                ; $0598B9 |
  BCS CODE_0598CE                           ; $0598BC |
  LDA !s_spr_y_player_delta,x               ; $0598BE |
  CLC                                       ; $0598C1 |
  ADC $6022,y                               ; $0598C2 |
  CLC                                       ; $0598C5 |
  ADC #$0010                                ; $0598C6 |
  CMP #$0020                                ; $0598C9 |
  BCC CODE_059911                           ; $0598CC |

CODE_0598CE:
  TYA                                       ; $0598CE |
  SEC                                       ; $0598CF |
  SBC #$0004                                ; $0598D0 |
  TAY                                       ; $0598D3 |
  BPL CODE_0598AE                           ; $0598D4 |

CODE_0598D6:
  LDA !s_spr_x_hitbox_center,x              ; $0598D6 |
  SEC                                       ; $0598D9 |
  SBC !s_spr_x_hitbox_center                ; $0598DA |
  STA $00                                   ; $0598DD |
  LDA !s_spr_y_hitbox_center,x              ; $0598DF |
  SEC                                       ; $0598E2 |
  SBC !s_spr_y_hitbox_center                ; $0598E3 |
  STA $02                                   ; $0598E6 |
  LDY #$0C                                  ; $0598E8 |

CODE_0598EA:
  LDA $00                                   ; $0598EA |
  CLC                                       ; $0598EC |
  ADC $6020,y                               ; $0598ED |
  CLC                                       ; $0598F0 |
  ADC #$0010                                ; $0598F1 |
  CMP #$0020                                ; $0598F4 |
  BCS CODE_059908                           ; $0598F7 |
  LDA $02                                   ; $0598F9 |
  CLC                                       ; $0598FB |
  ADC $6022,y                               ; $0598FC |
  CLC                                       ; $0598FF |
  ADC #$0010                                ; $059900 |
  CMP #$0020                                ; $059903 |
  BCC CODE_059911                           ; $059906 |

CODE_059908:
  TYA                                       ; $059908 |
  SEC                                       ; $059909 |
  SBC #$0004                                ; $05990A |
  TAY                                       ; $05990D |
  BPL CODE_0598EA                           ; $05990E |
  RTS                                       ; $059910 |

CODE_059911:
  STY $00                                   ; $059911 |
  LDA $6020,y                               ; $059913 |
  STA $02                                   ; $059916 |
  LDA $6022,y                               ; $059918 |
  STA $04                                   ; $05991B |
  CPY #$08                                  ; $05991D |
  BMI CODE_059923                           ; $05991F |
  INX                                       ; $059921 |
  INX                                       ; $059922 |

CODE_059923:
  LDA #$0040                                ; $059923 |
  LDY !s_spr_wildcard_1_hi,x                ; $059926 |
  BPL CODE_05992E                           ; $059929 |
  LDA #$FFC0                                ; $05992B |

CODE_05992E:
  CLC                                       ; $05992E |
  ADC !s_spr_gsu_morph_1_hi,x               ; $05992F |
  AND #$00FF                                ; $059932 |
  ASL A                                     ; $059935 |
  STA !gsu_r1                               ; $059936 |
  LDA #$FC00                                ; $059939 |
  STA !gsu_r6                               ; $05993C |
  LDX #$0B                                  ; $05993F |
  LDA #$8595                                ; $059941 |
  JSL r_gsu_init_1                          ; $059944 | GSU init
  LDX $12                                   ; $059948 |
  LDY !s_spr_facing_dir,x                   ; $05994A |
  BEQ CODE_059959                           ; $05994D |
  LDA !gsu_r0                               ; $05994F |
  EOR #$FFFF                                ; $059952 |
  INC A                                     ; $059955 |
  STA !gsu_r0                               ; $059956 |

CODE_059959:
  LDA #$01A8                                ; $059959 |
  JSL spawn_sprite_active                   ; $05995C |
  BCC CODE_0599D8                           ; $059960 |
  LDA !s_spr_x_pixel_pos,x                  ; $059962 |
  CLC                                       ; $059965 |
  ADC $02                                   ; $059966 |
  STA !s_spr_x_pixel_pos,y                  ; $059968 |
  LDA !s_spr_y_pixel_pos,x                  ; $05996B |
  CLC                                       ; $05996E |
  ADC $04                                   ; $05996F |
  STA !s_spr_y_pixel_pos,y                  ; $059971 |
  LDA !gsu_r0                               ; $059974 |
  STA !s_spr_x_speed_lo,y                   ; $059977 |
  LDA !gsu_r1                               ; $05997A |
  STA !s_spr_y_speed_lo,y                   ; $05997D |
  LDA #$0008                                ; $059980 |
  STA !s_spr_wildcard_1_lo,y                ; $059983 |
  TYX                                       ; $059986 |
  JSL $02BC22                               ; $059987 |
  LDX $12                                   ; $05998B |
  LDY #$0C                                  ; $05998D |

CODE_05998F:
  STY $06                                   ; $05998F |
  CPY $00                                   ; $059991 |
  BEQ CODE_0599C0                           ; $059993 |
  LDA $6020,y                               ; $059995 |
  STA $02                                   ; $059998 |
  LDA $6022,y                               ; $05999A |
  STA $04                                   ; $05999D |
  LDA #$01A5                                ; $05999F |
  JSL spawn_sprite_init                     ; $0599A2 |
  BCC CODE_0599D8                           ; $0599A6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0599A8 |
  CLC                                       ; $0599AB |
  ADC $02                                   ; $0599AC |
  STA !s_spr_x_pixel_pos,y                  ; $0599AE |
  LDA !s_spr_y_pixel_pos,x                  ; $0599B1 |
  CLC                                       ; $0599B4 |
  ADC $04                                   ; $0599B5 |
  STA !s_spr_y_pixel_pos,y                  ; $0599B7 |
  LDA #$0001                                ; $0599BA |
  STA !s_spr_wildcard_1_lo,y                ; $0599BD |

CODE_0599C0:
  LDY $06                                   ; $0599C0 |
  TYA                                       ; $0599C2 |
  SEC                                       ; $0599C3 |
  SBC #$0004                                ; $0599C4 |
  TAY                                       ; $0599C7 |
  BPL CODE_05998F                           ; $0599C8 |
  JSL $03AEFD                               ; $0599CA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0599CE |
  STA !s_spr_dyntile_index,x                ; $0599D0 |
  PLA                                       ; $0599D3 |
  JML $03A32E                               ; $0599D4 |

CODE_0599D8:
  RTS                                       ; $0599D8 |

  dw $FFFA, $0006                           ; $0599D9 |

CODE_0599DD:
  LDY #$00                                  ; $0599DD |
  LDA !s_spr_wildcard_1_lo,x                ; $0599DF |
  SEC                                       ; $0599E2 |
  SBC !s_spr_x_accel_ceiling,x              ; $0599E3 |
  BEQ CODE_059A06                           ; $0599E6 |
  STA $00                                   ; $0599E8 |
  BPL CODE_0599EE                           ; $0599EA |
  INY                                       ; $0599EC |
  INY                                       ; $0599ED |

CODE_0599EE:
  LDA !s_spr_wildcard_1_lo,x                ; $0599EE |
  CLC                                       ; $0599F1 |
  ADC $99D9,y                               ; $0599F2 |
  STA !s_spr_wildcard_1_lo,x                ; $0599F5 |
  SEC                                       ; $0599F8 |
  SBC !s_spr_x_accel_ceiling,x              ; $0599F9 |
  EOR $00                                   ; $0599FC |
  BPL CODE_059A06                           ; $0599FE |
  LDA !s_spr_x_accel_ceiling,x              ; $059A00 |
  STA !s_spr_wildcard_1_lo,x                ; $059A03 |

CODE_059A06:
  LDY !s_spr_gsu_morph_1_hi,x               ; $059A06 |
  TYA                                       ; $059A09 |
  SEC                                       ; $059A0A |
  SBC #$0040                                ; $059A0B |
  STA $00                                   ; $059A0E |
  LDA !s_spr_gsu_morph_1_lo,x               ; $059A10 |
  CLC                                       ; $059A13 |
  ADC !s_spr_wildcard_1_lo,x                ; $059A14 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059A17 |
  XBA                                       ; $059A1A |
  AND #$00FF                                ; $059A1B |
  SEC                                       ; $059A1E |
  SBC #$0040                                ; $059A1F |
  EOR $00                                   ; $059A22 |
  BPL CODE_059A3B                           ; $059A24 |
  LDA $00                                   ; $059A26 |
  CLC                                       ; $059A28 |
  ADC #$0010                                ; $059A29 |
  CMP #$0020                                ; $059A2C |
  BCS CODE_059A3B                           ; $059A2F |
  LDA !s_spr_x_accel_ceiling,x              ; $059A31 |
  EOR #$FFFF                                ; $059A34 |
  INC A                                     ; $059A37 |
  STA !s_spr_x_accel_ceiling,x              ; $059A38 |

CODE_059A3B:
  LDA !s_spr_timer_4,x                      ; $059A3B |
  BNE CODE_059A9E                           ; $059A3E |
  LDY #$00                                  ; $059A40 |
  LDA !s_spr_wildcard_2_lo,x                ; $059A42 |
  SEC                                       ; $059A45 |
  SBC !s_spr_y_accel_ceiling,x              ; $059A46 |
  BEQ CODE_059A69                           ; $059A49 |
  STA $00                                   ; $059A4B |
  BPL CODE_059A51                           ; $059A4D |
  INY                                       ; $059A4F |
  INY                                       ; $059A50 |

CODE_059A51:
  LDA !s_spr_wildcard_2_lo,x                ; $059A51 |
  CLC                                       ; $059A54 |
  ADC $99D9,y                               ; $059A55 |
  STA !s_spr_wildcard_2_lo,x                ; $059A58 |
  SEC                                       ; $059A5B |
  SBC !s_spr_y_accel_ceiling,x              ; $059A5C |
  EOR $00                                   ; $059A5F |
  BPL CODE_059A69                           ; $059A61 |
  LDA !s_spr_y_accel_ceiling,x              ; $059A63 |
  STA !s_spr_wildcard_2_lo,x                ; $059A66 |

CODE_059A69:
  LDY !s_spr_gsu_morph_2_hi,x               ; $059A69 |
  TYA                                       ; $059A6C |
  SEC                                       ; $059A6D |
  SBC #$0040                                ; $059A6E |
  STA $00                                   ; $059A71 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059A73 |
  CLC                                       ; $059A76 |
  ADC !s_spr_wildcard_2_lo,x                ; $059A77 |
  STA !s_spr_gsu_morph_2_lo,x               ; $059A7A |
  XBA                                       ; $059A7D |
  AND #$00FF                                ; $059A7E |
  SEC                                       ; $059A81 |
  SBC #$0040                                ; $059A82 |
  EOR $00                                   ; $059A85 |
  BPL CODE_059A9E                           ; $059A87 |
  LDA $00                                   ; $059A89 |
  CLC                                       ; $059A8B |
  ADC #$0010                                ; $059A8C |
  CMP #$0020                                ; $059A8F |
  BCS CODE_059A9E                           ; $059A92 |
  LDA !s_spr_y_accel_ceiling,x              ; $059A94 |
  EOR #$FFFF                                ; $059A97 |
  INC A                                     ; $059A9A |
  STA !s_spr_y_accel_ceiling,x              ; $059A9B |

CODE_059A9E:
  RTS                                       ; $059A9E |

CODE_059A9F:
  LDA #$C060                                ; $059A9F |
  STA !gsu_r12                              ; $059AA2 |
  LDA #$0054                                ; $059AA5 |
  STA !gsu_r13                              ; $059AA8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059AAB |
  SEC                                       ; $059AAE |
  SBC !s_spr_gsu_morph_1_lo,x               ; $059AAF |
  BPL CODE_059AB7                           ; $059AB2 |
  LDA #$0000                                ; $059AB4 |

CODE_059AB7:
  STA $06                                   ; $059AB7 |
  LSR A                                     ; $059AB9 |
  STA $04                                   ; $059ABA |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059ABC |
  CLC                                       ; $059ABF |
  ADC !s_spr_gsu_morph_1_lo,x               ; $059AC0 |
  LSR A                                     ; $059AC3 |
  CLC                                       ; $059AC4 |
  ADC $04                                   ; $059AC5 |
  XBA                                       ; $059AC7 |
  AND #$00FF                                ; $059AC8 |
  STA !gsu_r5                               ; $059ACB |
  LDA #$0100                                ; $059ACE |
  STA !gsu_r6                               ; $059AD1 |
  LDY !s_spr_dyntile_index,x                ; $059AD4 |
  TYX                                       ; $059AD7 |
  LDA $03A9CE,x                             ; $059AD8 |
  STA !gsu_r3                               ; $059ADC |
  LDA $03A9EE,x                             ; $059ADF |
  STA !gsu_r2                               ; $059AE3 |
  LDX #$08                                  ; $059AE6 |
  LDA #$8205                                ; $059AE8 |
  JSL r_gsu_init_1                          ; $059AEB | GSU init
  LDX $12                                   ; $059AEF |
  LDA #$C060                                ; $059AF1 |
  STA !gsu_r12                              ; $059AF4 |
  LDA #$0054                                ; $059AF7 |
  STA !gsu_r13                              ; $059AFA |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059AFD |
  CLC                                       ; $059B00 |
  ADC $06                                   ; $059B01 |
  XBA                                       ; $059B03 |
  AND #$00FF                                ; $059B04 |
  STA !gsu_r5                               ; $059B07 |
  LDA #$0100                                ; $059B0A |
  STA !gsu_r6                               ; $059B0D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $059B10 |
  TYX                                       ; $059B12 |
  LDA $03A9CE,x                             ; $059B13 |
  STA !gsu_r3                               ; $059B17 |
  LDA $03A9EE,x                             ; $059B1A |
  STA !gsu_r2                               ; $059B1E |
  LDX #$08                                  ; $059B21 |
  LDA #$8205                                ; $059B23 |
  JSL r_gsu_init_1                          ; $059B26 | GSU init
  LDX $12                                   ; $059B2A |
  INC $0CF9                                 ; $059B2C |
  RTS                                       ; $059B2F |

init_expansion_block:
  JSL $03AE60                               ; $059B30 |
  LDA !s_spr_y_pixel_pos,x                  ; $059B34 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $059B37 |
  LDA #$0100                                ; $059B39 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059B3C |
  STZ !s_spr_facing_dir,x                   ; $059B3F |
  JSR CODE_059BA7                           ; $059B42 |
  RTL                                       ; $059B45 |

  dw $80C2                                  ; $059B46 |
  dw $9BE7                                  ; $059B48 |
  dw $9C15                                  ; $059B4A |
  dw $9C42                                  ; $059B4C |

main_expansion_block:
  JSL $03AA52                               ; $059B4E |
  JSL $03AF23                               ; $059B52 |
  TXY                                       ; $059B56 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059B57 |
  ASL A                                     ; $059B59 |
  TAX                                       ; $059B5A |
  JSR ($9B46,x)                             ; $059B5B |
  LDA !s_spr_dyntile_index,x                ; $059B5E |
  LSR A                                     ; $059B61 |
  LSR A                                     ; $059B62 |
  LSR A                                     ; $059B63 |
  SEC                                       ; $059B64 |
  SBC !r_frame_counter_global               ; $059B65 |
  AND #$0003                                ; $059B68 |
  BNE CODE_059B70                           ; $059B6B |
  JSR CODE_059BA7                           ; $059B6D |

CODE_059B70:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059B70 |
  PHA                                       ; $059B72 |
  LDA #$0700                                ; $059B73 |
  STA !gsu_r0                               ; $059B76 |
  LDA #$0800                                ; $059B79 |
  STA !gsu_r1                               ; $059B7C |
  LDA #$000A                                ; $059B7F |
  STA $0A                                   ; $059B82 |
  STZ $02                                   ; $059B84 |
  LDY #$01                                  ; $059B86 |
  STY $09                                   ; $059B88 |
  STY $06                                   ; $059B8A |
  DEY                                       ; $059B8C |
  STZ !gsu_r3                               ; $059B8D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $059B90 |
  STA !gsu_r6                               ; $059B93 |
  JSL $059C6F                               ; $059B96 |
  PLA                                       ; $059B9A |
  CMP !s_spr_wildcard_5_lo_dp,x             ; $059B9B |
  BEQ CODE_059BA6                           ; $059B9D |
  LDA #$0015                                ; $059B9F |\ play sound #$0015
  JSL push_sound_queue                      ; $059BA2 |/

CODE_059BA6:
  RTL                                       ; $059BA6 |

CODE_059BA7:
  LDA !s_spr_gsu_morph_1_lo,x               ; $059BA7 |
  STA !gsu_r6                               ; $059BAA |
  STA !gsu_r11                              ; $059BAD |
  LDA #$0054                                ; $059BB0 |
  STA !gsu_r13                              ; $059BB3 |
  LDA #$7040                                ; $059BB6 |
  STA !gsu_r12                              ; $059BB9 |
  LDA !s_spr_dyntile_index,x                ; $059BBC |
  TAX                                       ; $059BBF |
  LDA $03A9CE,x                             ; $059BC0 |
  STA !gsu_r3                               ; $059BC4 |
  LDA $03A9EE,x                             ; $059BC7 |
  STA !gsu_r2                               ; $059BCB |
  LDA #$0008                                ; $059BCE |
  STA !gsu_r8                               ; $059BD1 |
  ASL A                                     ; $059BD4 |
  STA !gsu_r9                               ; $059BD5 |
  LDX #$08                                  ; $059BD8 |
  LDA #$82FA                                ; $059BDA |
  JSL r_gsu_init_1                          ; $059BDD | GSU init
  LDX $12                                   ; $059BE1 |
  INC $0CF9                                 ; $059BE3 |
  RTS                                       ; $059BE6 |

  TYX                                       ; $059BE7 |
  LDY !s_spr_y_speed_hi,x                   ; $059BE8 |
  BMI CODE_059C11                           ; $059BEB |
  LDA $7860,x                               ; $059BED |
  AND #$0003                                ; $059BF0 |
  BEQ CODE_059BF9                           ; $059BF3 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $059BF5 |
  BRA CODE_059C03                           ; $059BF7 |

CODE_059BF9:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $059BF9 |
  CMP !s_spr_y_pixel_pos,x                  ; $059BFB |
  BPL CODE_059C11                           ; $059BFE |
  STA !s_spr_y_pixel_pos,x                  ; $059C00 |

CODE_059C03:
  STZ !s_spr_y_speed_lo,x                   ; $059C03 |
  STZ !s_spr_y_accel,x                      ; $059C06 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059C09 |
  LDA #$0120                                ; $059C0B |
  STA !s_spr_timer_1,x                      ; $059C0E |

CODE_059C11:
  JSR CODE_059C2F                           ; $059C11 |
  RTS                                       ; $059C14 |

  TYX                                       ; $059C15 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $059C16 |
  BEQ CODE_059C22                           ; $059C18 |
  LDA $7860,x                               ; $059C1A |
  AND #$0003                                ; $059C1D |
  BEQ CODE_059C27                           ; $059C20 |

CODE_059C22:
  LDA !s_spr_timer_1,x                      ; $059C22 |
  BNE CODE_059C2F                           ; $059C25 |

CODE_059C27:
  LDA #$0040                                ; $059C27 |
  STA !s_spr_y_accel,x                      ; $059C2A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059C2D |

CODE_059C2F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $059C2F |
  CLC                                       ; $059C32 |
  ADC #$0010                                ; $059C33 |
  CMP #$0200                                ; $059C36 |
  BMI CODE_059C3E                           ; $059C39 |
  LDA #$01FF                                ; $059C3B |

CODE_059C3E:
  STA !s_spr_gsu_morph_1_lo,x               ; $059C3E |
  RTS                                       ; $059C41 |

  TYX                                       ; $059C42 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $059C43 |
  INC A                                     ; $059C45 |
  CMP !s_spr_y_pixel_pos,x                  ; $059C46 |
  BPL CODE_059C55                           ; $059C49 |
  DEC A                                     ; $059C4B |
  STA !s_spr_y_pixel_pos,x                  ; $059C4C |
  STZ !s_spr_y_speed_lo,x                   ; $059C4F |
  STZ !s_spr_y_accel,x                      ; $059C52 |

CODE_059C55:
  LDA !s_spr_gsu_morph_1_lo,x               ; $059C55 |
  SEC                                       ; $059C58 |
  SBC #$0018                                ; $059C59 |
  CMP #$0100                                ; $059C5C |
  BPL CODE_059C6B                           ; $059C5F |
  LDA #$0100                                ; $059C61 |
  LDY !s_spr_y_accel,x                      ; $059C64 |
  BNE CODE_059C6B                           ; $059C67 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $059C69 |

CODE_059C6B:
  STA !s_spr_gsu_morph_1_lo,x               ; $059C6B |
  RTS                                       ; $059C6E |

  STA !gsu_r9                               ; $059C6F |
  STY $08                                   ; $059C72 |
  LDA !s_player_hitbox_half_width           ; $059C74 |
  STA !gsu_r7                               ; $059C77 |
  LDA !s_player_hitbox_half_height          ; $059C7A |
  STA !gsu_r8                               ; $059C7D |
  LDX #$0B                                  ; $059C80 |
  LDA #$8578                                ; $059C82 |
  JSL r_gsu_init_1                          ; $059C85 | GSU init
  LDX $12                                   ; $059C89 |
  STZ $04                                   ; $059C8B |
  LDA !s_spr_x_pixel_pos,x                  ; $059C8D |
  CLC                                       ; $059C90 |
  ADC #$0008                                ; $059C91 |
  SEC                                       ; $059C94 |
  SBC !s_player_center_x                    ; $059C95 |
  STA $0C                                   ; $059C98 |
  CLC                                       ; $059C9A |
  ADC $603C                                 ; $059C9B |
  CMP $6038                                 ; $059C9E |
  BCC CODE_059CA4                           ; $059CA1 |
  RTL                                       ; $059CA3 |

CODE_059CA4:
  LDA #$0008                                ; $059CA4 |
  LDY $09                                   ; $059CA7 |
  BEQ CODE_059CC7                           ; $059CA9 |
  CPY #$01                                  ; $059CAB |
  BNE CODE_059CBC                           ; $059CAD |
  LDA #$0010                                ; $059CAF |
  SEC                                       ; $059CB2 |
  SBC $6036                                 ; $059CB3 |
  SEC                                       ; $059CB6 |
  SBC !gsu_r3                               ; $059CB7 |
  BRA CODE_059CC7                           ; $059CBA |

CODE_059CBC:
  LDA #$FFF0                                ; $059CBC |
  CLC                                       ; $059CBF |
  ADC $6036                                 ; $059CC0 |
  SEC                                       ; $059CC3 |
  SBC !gsu_r3                               ; $059CC4 |

CODE_059CC7:
  CLC                                       ; $059CC7 |
  ADC !s_spr_y_pixel_pos,x                  ; $059CC8 |
  SEC                                       ; $059CCB |
  SBC !s_player_center_y                    ; $059CCC |
  SEC                                       ; $059CCF |
  SBC !s_car_wheel_ext_height               ; $059CD0 |
  STA $0E                                   ; $059CD3 |
  CLC                                       ; $059CD5 |
  ADC $603E                                 ; $059CD6 |
  CMP $603A                                 ; $059CD9 |
  BCS CODE_059D29                           ; $059CDC |
  LDA $603E                                 ; $059CDE |
  SEC                                       ; $059CE1 |
  SBC $0A                                   ; $059CE2 |
  STA $00                                   ; $059CE4 |
  LDA $0E                                   ; $059CE6 |
  BPL CODE_059CFA                           ; $059CE8 |
  PHA                                       ; $059CEA |
  LDA $00                                   ; $059CEB |
  EOR #$FFFF                                ; $059CED |
  INC A                                     ; $059CF0 |
  STA $00                                   ; $059CF1 |
  PLA                                       ; $059CF3 |
  CMP $00                                   ; $059CF4 |
  BMI CODE_059D2A                           ; $059CF6 |
  BRA CODE_059CFE                           ; $059CF8 |

CODE_059CFA:
  CMP $00                                   ; $059CFA |
  BPL CODE_059D2A                           ; $059CFC |

CODE_059CFE:
  LDY $08                                   ; $059CFE |
  BNE CODE_059D6A                           ; $059D00 |
  INC $04                                   ; $059D02 |
  LDA !s_player_x_speed_prev                ; $059D04 |
  EOR $0C                                   ; $059D07 |
  BMI CODE_059D28                           ; $059D09 |
  LDA $603C                                 ; $059D0B |
  INC A                                     ; $059D0E |
  LDY $0D                                   ; $059D0F |
  BMI CODE_059D18                           ; $059D11 |
  INC $04                                   ; $059D13 |
  EOR #$FFFF                                ; $059D15 |

CODE_059D18:
  CLC                                       ; $059D18 |
  ADC $0C                                   ; $059D19 |
  CLC                                       ; $059D1B |
  ADC !s_player_x                           ; $059D1C |
  STA !s_player_x                           ; $059D1F |
  STZ !s_player_x_speed_prev                ; $059D22 |
  STZ !s_player_x_speed                     ; $059D25 |

CODE_059D28:
  CLC                                       ; $059D28 |

CODE_059D29:
  RTL                                       ; $059D29 |

CODE_059D2A:
  LDA $0E                                   ; $059D2A |
  BPL CODE_059D6C                           ; $059D2C |
  LDY $02                                   ; $059D2E |
  BNE CODE_059D39                           ; $059D30 |
  LDA $0E                                   ; $059D32 |
  EOR !s_player_y_speed                     ; $059D34 |
  BMI CODE_059D6A                           ; $059D37 |

CODE_059D39:
  LDY $08                                   ; $059D39 |
  BNE CODE_059D6A                           ; $059D3B |
  LDY #$04                                  ; $059D3D |
  STY $04                                   ; $059D3F |
  LDA $0E                                   ; $059D41 |
  CLC                                       ; $059D43 |
  ADC $603E                                 ; $059D44 |
  CLC                                       ; $059D47 |
  ADC !s_player_y                           ; $059D48 |
  STA !s_player_y                           ; $059D4B |
  STZ !s_player_y_speed                     ; $059D4E |
  STZ !s_player_flutter_state               ; $059D51 |
  LDY $06                                   ; $059D54 |
  BEQ CODE_059D6A                           ; $059D56 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059D58 |
  BNE CODE_059D6A                           ; $059D5A |
  LDA #$FC00                                ; $059D5C |
  STA !s_spr_y_speed_lo,x                   ; $059D5F |
  LDA #$0040                                ; $059D62 |
  STA !s_spr_y_accel,x                      ; $059D65 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059D68 |

CODE_059D6A:
  SEC                                       ; $059D6A |
  RTL                                       ; $059D6B |

CODE_059D6C:
  LDA $0E                                   ; $059D6C |
  EOR !s_player_y_speed                     ; $059D6E |
  BMI CODE_059D6A                           ; $059D71 |
  LDY #$08                                  ; $059D73 |
  STY $04                                   ; $059D75 |
  LDA $0E                                   ; $059D77 |
  SEC                                       ; $059D79 |
  SBC $603E                                 ; $059D7A |
  CLC                                       ; $059D7D |
  ADC #$0002                                ; $059D7E |
  CLC                                       ; $059D81 |
  ADC !s_player_y                           ; $059D82 |
  STA !s_player_y                           ; $059D85 |
  LDY #$00                                  ; $059D88 |
  STY !s_player_y_sub                       ; $059D8A |
  STZ !s_player_y_speed                     ; $059D8D |
  INC !s_on_sprite_platform_flag            ; $059D90 |
  CLC                                       ; $059D93 |
  RTL                                       ; $059D94 |

; blue and red
init_checkered_block:
  JSL $03AE60                               ; $059D95 |
  LDA #$0100                                ; $059D99 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059D9C |
  STA !s_spr_gsu_morph_2_lo,x               ; $059D9F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $059DA2 |
  JSR CODE_059E99                           ; $059DA4 |
  RTL                                       ; $059DA7 |

  dw $9EF3                                  ; $059DA8 |
  dw $9F50                                  ; $059DAA |
  dw $80C2                                  ; $059DAC |
  dw $80C2                                  ; $059DAE |

  dw $90B0, $8060                           ; $059DB0 |

  dw $0600, $0E00                           ; $059DB4 |

  dw $0A00, $0600                           ; $059DB8 |

; blue and red
main_checkered_block:
  JSL $03AA52                               ; $059DBC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059DC0 |
  CPY #$01                                  ; $059DC2 |
  BEQ CODE_059DCC                           ; $059DC4 |
  JSL $03AF23                               ; $059DC6 |
  BRA CODE_059DD3                           ; $059DCA |

CODE_059DCC:
  JSL $03B716                               ; $059DCC |
  JSR CODE_059E99                           ; $059DD0 |

CODE_059DD3:
  JSR CODE_059E06                           ; $059DD3 |
  JSR CODE_059E6F                           ; $059DD6 |
  JSL $059C6F                               ; $059DD9 |
  BCS CODE_059DF3                           ; $059DDD |
  LDA !s_player_x                           ; $059DDF |
  CLC                                       ; $059DE2 |
  ADC !s_spr_x_delta_lo,x                   ; $059DE3 |
  STA !s_player_x                           ; $059DE6 |
  LDA !s_player_y                           ; $059DE9 |
  CLC                                       ; $059DEC |
  ADC !s_spr_y_delta_lo,x                   ; $059DED |
  STA !s_player_y                           ; $059DF0 |

CODE_059DF3:
  TXY                                       ; $059DF3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $059DF4 |
  ASL A                                     ; $059DF6 |
  TAX                                       ; $059DF7 |
  JSR ($9DA8,x)                             ; $059DF8 |
  LDA !s_spr_x_pixel_pos,x                  ; $059DFB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $059DFE |
  LDA !s_spr_y_pixel_pos,x                  ; $059E00 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $059E03 |
  RTL                                       ; $059E05 |

CODE_059E06:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $059E06 |
  CPY #$02                                  ; $059E08 |
  BMI CODE_059E6E                           ; $059E0A |
  BNE CODE_059E36                           ; $059E0C |
  LDA !s_spr_x_pixel_pos,x                  ; $059E0E |
  CMP !s_spr_wildcard_2_lo,x                ; $059E11 |
  BMI CODE_059E1B                           ; $059E14 |
  CMP !s_spr_wildcard_1_lo,x                ; $059E16 |
  BMI CODE_059E5C                           ; $059E19 |

CODE_059E1B:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $059E1B |
  STA !s_spr_x_pixel_pos,x                  ; $059E1D |
  CLC                                       ; $059E20 |
  ADC #$0008                                ; $059E21 |
  STA !s_spr_x_hitbox_center,x              ; $059E24 |
  STZ !s_spr_x_speed_lo,x                   ; $059E27 |
  LDA !s_spr_x_accel_ceiling,x              ; $059E2A |
  EOR #$FFFF                                ; $059E2D |
  INC A                                     ; $059E30 |
  STA !s_spr_x_accel_ceiling,x              ; $059E31 |
  BRA CODE_059E5C                           ; $059E34 |

CODE_059E36:
  LDA !s_spr_y_pixel_pos,x                  ; $059E36 |
  CMP !s_spr_wildcard_2_lo,x                ; $059E39 |
  BMI CODE_059E43                           ; $059E3C |
  CMP !s_spr_wildcard_1_lo,x                ; $059E3E |
  BMI CODE_059E5C                           ; $059E41 |

CODE_059E43:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $059E43 |
  STA !s_spr_y_pixel_pos,x                  ; $059E45 |
  CLC                                       ; $059E48 |
  ADC #$0008                                ; $059E49 |
  STA !s_spr_y_hitbox_center,x              ; $059E4C |
  STZ !s_spr_y_speed_lo,x                   ; $059E4F |
  LDA !s_spr_y_accel_ceiling,x              ; $059E52 |
  EOR #$FFFF                                ; $059E55 |
  INC A                                     ; $059E58 |
  STA !s_spr_y_accel_ceiling,x              ; $059E59 |

CODE_059E5C:
  LDA !s_spr_x_pixel_pos,x                  ; $059E5C |
  SEC                                       ; $059E5F |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $059E60 |
  STA !s_spr_x_delta_lo,x                   ; $059E62 |
  LDA !s_spr_y_pixel_pos,x                  ; $059E65 |
  SEC                                       ; $059E68 |
  SBC !s_spr_wildcard_6_lo_dp,x             ; $059E69 |
  STA !s_spr_y_delta_lo,x                   ; $059E6B |

CODE_059E6E:
  RTS                                       ; $059E6E |

CODE_059E6F:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $059E6F |
  LDA $9DB4,y                               ; $059E71 |
  STA !gsu_r0                               ; $059E74 |
  LDA $9DB8,y                               ; $059E77 |
  STA !gsu_r1                               ; $059E7A |
  LDA #$000A                                ; $059E7D |
  STA $0A                                   ; $059E80 |
  STZ $02                                   ; $059E82 |
  LDY #$00                                  ; $059E84 |
  STY $09                                   ; $059E86 |
  TYA                                       ; $059E88 |
  STA !gsu_r3                               ; $059E89 |
  INY                                       ; $059E8C |
  STY $06                                   ; $059E8D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $059E8F |
  STA !gsu_r6                               ; $059E92 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059E95 |
  RTS                                       ; $059E98 |

CODE_059E99:
  LDA !s_spr_gsu_morph_1_lo,x               ; $059E99 |
  STA !gsu_r6                               ; $059E9C |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059E9F |
  STA !gsu_r11                              ; $059EA2 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $059EA5 |
  LDA #$0054                                ; $059EA7 |
  STA !gsu_r13                              ; $059EAA |
  LDA $9DB0,y                               ; $059EAD |
  STA !gsu_r12                              ; $059EB0 |
  LDA !s_spr_dyntile_index,x                ; $059EB3 |
  TAX                                       ; $059EB6 |
  LDA $03A9CE,x                             ; $059EB7 |
  STA !gsu_r3                               ; $059EBB |
  LDA $03A9EE,x                             ; $059EBE |
  STA !gsu_r2                               ; $059EC2 |
  LDA #$0010                                ; $059EC5 |
  CPY #$00                                  ; $059EC8 |
  BEQ CODE_059EDD                           ; $059ECA |
  STA !gsu_r8                               ; $059ECC |
  STA !gsu_r9                               ; $059ECF |
  LDX #$08                                  ; $059ED2 |
  LDA #$8295                                ; $059ED4 |
  JSL r_gsu_init_1                          ; $059ED7 | GSU init
  BRA CODE_059EED                           ; $059EDB |

CODE_059EDD:
  LSR A                                     ; $059EDD |
  STA !gsu_r8                               ; $059EDE |
  STA !gsu_r9                               ; $059EE1 |
  LDX #$08                                  ; $059EE4 |
  LDA #$82FA                                ; $059EE6 |
  JSL r_gsu_init_1                          ; $059EE9 | GSU init

CODE_059EED:
  LDX $12                                   ; $059EED |
  INC $0CF9                                 ; $059EEF |
  RTS                                       ; $059EF2 |

  TYX                                       ; $059EF3 |
  LDY !s_spr_collision_id,x                 ; $059EF4 |
  BMI CODE_059F10                           ; $059EF7 |
  DEY                                       ; $059EF9 |
  BMI CODE_059F4F                           ; $059EFA |
  LDA !s_spr_state,y                        ; $059EFC |
  CMP #$0010                                ; $059EFF |
  BNE CODE_059F4F                           ; $059F02 |
  LDA !s_spr_collision_state,y              ; $059F04 |
  BEQ CODE_059F4F                           ; $059F07 |
  TYX                                       ; $059F09 |
  JSL $03B25B                               ; $059F0A |
  BRA CODE_059F19                           ; $059F0E |

CODE_059F10:
  STZ !s_player_x_speed                     ; $059F10 |
  STZ !s_player_x_speed_prev                ; $059F13 |
  STZ !s_player_y_speed                     ; $059F16 |

CODE_059F19:
  LDA !s_spr_x_hitbox_center,x              ; $059F19 |
  STA $00                                   ; $059F1C |
  LDA !s_spr_y_hitbox_center,x              ; $059F1E |
  STA $02                                   ; $059F21 |
  LDA #$01E7                                ; $059F23 |
  JSL $03B56E                               ; $059F26 |
  LDY #$02                                  ; $059F2A |
  STY !s_spr_wildcard_3_lo_dp,x             ; $059F2C |
  LDA #$0021                                ; $059F2E |
  STA !s_spr_timer_1,x                      ; $059F31 |
  LDA #$0080                                ; $059F34 |
  STA !s_spr_gsu_morph_1_lo,x               ; $059F37 |
  LDA #$01FF                                ; $059F3A |
  STA !s_spr_gsu_morph_2_lo,x               ; $059F3D |
  LDA #$0005                                ; $059F40 |\ play sound #$0005
  JSL push_sound_queue                      ; $059F43 |/
  INC !s_player_disable_flag                ; $059F47 |
  INC !s_sprite_disable_flag                ; $059F4A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059F4D |

CODE_059F4F:
  RTS                                       ; $059F4F |

  TYX                                       ; $059F50 |
  LDY !s_spr_timer_1,x                      ; $059F51 |
  BNE CODE_059F9E                           ; $059F54 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $059F56 |
  CLC                                       ; $059F59 |
  ADC #$0004                                ; $059F5A |
  CMP #$0100                                ; $059F5D |
  BMI CODE_059F65                           ; $059F60 |
  LDA #$0100                                ; $059F62 |

CODE_059F65:
  STA !s_spr_gsu_morph_1_lo,x               ; $059F65 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $059F68 |
  SEC                                       ; $059F6B |
  SBC #$0008                                ; $059F6C |
  CMP #$0100                                ; $059F6F |
  BPL CODE_059F77                           ; $059F72 |
  LDA #$0100                                ; $059F74 |

CODE_059F77:
  STA !s_spr_gsu_morph_2_lo,x               ; $059F77 |
  ORA !s_spr_gsu_morph_1_lo,x               ; $059F7A |
  CMP #$0100                                ; $059F7D |
  BNE CODE_059F9E                           ; $059F80 |
  LDA !s_spr_id,x                           ; $059F82 |
  CMP #$0095                                ; $059F85 |
  BNE CODE_059F90                           ; $059F88 |
  JSL $04A6AE                               ; $059F8A |
  BRA CODE_059F96                           ; $059F8E |

CODE_059F90:
  JSL $04A725                               ; $059F90 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059F94 |

CODE_059F96:
  STZ !s_player_disable_flag                ; $059F96 |
  STZ !s_sprite_disable_flag                ; $059F99 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $059F9C |

CODE_059F9E:
  RTS                                       ; $059F9E |

; regular and upside down
init_wild_piranha:
  INC !s_spr_anim_frame,x                   ; $059F9F |
  LDA !s_spr_x_pixel_pos,x                  ; $059FA2 |
  STA !gsu_r8                               ; $059FA5 |
  LDA !s_spr_y_pixel_pos,x                  ; $059FA8 |
  CLC                                       ; $059FAB |
  ADC #$0010                                ; $059FAC |
  JSL $0EB8B7                               ; $059FAF |
  BNE CODE_059FBF                           ; $059FB3 |
  LDA !s_spr_x_pixel_pos,x                  ; $059FB5 |
  CLC                                       ; $059FB8 |
  ADC #$0008                                ; $059FB9 |
  STA !s_spr_x_pixel_pos,x                  ; $059FBC |

CODE_059FBF:
  RTL                                       ; $059FBF |

  dw $A11E                                  ; $059FC0 |
  dw $A169                                  ; $059FC2 |
  dw $A36C                                  ; $059FC4 |
  dw $A456                                  ; $059FC6 |
  dw $A5AF                                  ; $059FC8 |
  dw $A402                                  ; $059FCA |
  dw $A5DA                                  ; $059FCC |
  dw $A5DF                                  ; $059FCE |
  dw $A5F1                                  ; $059FD0 |
  dw $A622                                  ; $059FD2 |
  dw $A65E                                  ; $059FD4 |
  dw $A6A6                                  ; $059FD6 |
  dw $A6BE                                  ; $059FD8 |
  dw $A6E8                                  ; $059FDA |
  dw $A719                                  ; $059FDC |
  dw $A738                                  ; $059FDE |
  dw $A758                                  ; $059FE0 |

  dw $0010, $0000                           ; $059FE2 |

; regular and upside down
main_wild_piranha:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $059FE6 |
  AND #$00FF                                ; $059FE8 |
  CMP #$0080                                ; $059FEB |
  BMI CODE_059FF3                           ; $059FEE |
  ORA #$FF00                                ; $059FF0 |

CODE_059FF3:
  STA $0C                                   ; $059FF3 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $059FF5 |
  AND #$00FF                                ; $059FF7 |
  CMP #$0080                                ; $059FFA |
  BMI CODE_05A002                           ; $059FFD |
  ORA #$FF00                                ; $059FFF |

CODE_05A002:
  LDY !s_spr_oam_yxppccct,x                 ; $05A002 |
  BPL CODE_05A00B                           ; $05A005 |
  CLC                                       ; $05A007 |
  ADC #$0010                                ; $05A008 |

CODE_05A00B:
  STA $0E                                   ; $05A00B |
  LDA !s_spr_anim_frame,x                   ; $05A00D |
  BNE CODE_05A015                           ; $05A010 |
  JSR CODE_05A769                           ; $05A012 |

CODE_05A015:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A015 |
  CPY #$04                                  ; $05A017 |
  BNE CODE_05A022                           ; $05A019 |
  LDY !s_spr_wildcard_1_lo,x                ; $05A01B |
  BEQ CODE_05A02D                           ; $05A01E |
  BRA CODE_05A02A                           ; $05A020 |

CODE_05A022:
  CPY #$03                                  ; $05A022 |
  BMI CODE_05A02D                           ; $05A024 |
  CPY #$06                                  ; $05A026 |
  BPL CODE_05A02D                           ; $05A028 |

CODE_05A02A:
  STZ $611A                                 ; $05A02A |

CODE_05A02D:
  LDA !s_spr_timer_frozen,x                 ; $05A02D |
  BEQ CODE_05A040                           ; $05A030 |
  LDA !s_spr_id,x                           ; $05A032 |
  CMP #$0054                                ; $05A035 |
  BNE CODE_05A040                           ; $05A038 |
  LDA #$8840                                ; $05A03A |
  STA !s_spr_bitwise_settings_3,x           ; $05A03D |

CODE_05A040:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A040 |
  CPY #$10                                  ; $05A042 |
  BEQ CODE_05A04A                           ; $05A044 |
  JSL $03AF23                               ; $05A046 |

CODE_05A04A:
  JSL $03A2C7                               ; $05A04A |
  BCC CODE_05A07B                           ; $05A04E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A050 |
  CPY #$08                                  ; $05A052 |
  BPL CODE_05A07B                           ; $05A054 |
  CPY #$02                                  ; $05A056 |
  BMI CODE_05A076                           ; $05A058 |
  CPY #$06                                  ; $05A05A |
  BPL CODE_05A09F                           ; $05A05C |
  CPY #$04                                  ; $05A05E |
  BNE CODE_05A067                           ; $05A060 |
  LDY !s_spr_wildcard_1_lo,x                ; $05A062 |
  BEQ CODE_05A076                           ; $05A065 |

CODE_05A067:
  STZ !s_player_state                       ; $05A067 |
  LDA #$0070                                ; $05A06A |
  STA !s_player_invincibility_timer         ; $05A06D |
  STZ $0D94                                 ; $05A070 |
  STZ $61B6                                 ; $05A073 |

CODE_05A076:
  JML $03A31E                               ; $05A076 |
  RTL                                       ; $05A07A |

CODE_05A07B:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A07B |
  CPY #$08                                  ; $05A07D |
  BMI CODE_05A09F                           ; $05A07F |
  LDY !s_spr_collision_id,x                 ; $05A081 |
  DEY                                       ; $05A084 |
  BMI CODE_05A0A2                           ; $05A085 |
  LDA !s_spr_state,y                        ; $05A087 |
  CMP #$0010                                ; $05A08A |
  BNE CODE_05A0A2                           ; $05A08D |
  LDA !s_spr_collision_state,y              ; $05A08F |
  BEQ CODE_05A0A2                           ; $05A092 |
  TYX                                       ; $05A094 |
  JSL $03B25B                               ; $05A095 |
  LDY #$10                                  ; $05A099 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05A09B |
  BRA CODE_05A0A2                           ; $05A09D |

CODE_05A09F:
  JSR CODE_05A0C3                           ; $05A09F |

CODE_05A0A2:
  TXY                                       ; $05A0A2 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05A0A3 |
  ASL A                                     ; $05A0A5 |
  TAX                                       ; $05A0A6 |
  JSR ($9FC0,x)                             ; $05A0A7 |
  LDA #$0008                                ; $05A0AA |
  STA !s_spr_x_hitbox_offset,x              ; $05A0AD |
  STA !s_spr_y_hitbox_offset,x              ; $05A0B0 |
  LDA !s_spr_anim_frame,x                   ; $05A0B3 |
  BNE CODE_05A0C2                           ; $05A0B6 |
  LDA $0C                                   ; $05A0B8 |
  STA !s_spr_x_hitbox_offset,x              ; $05A0BA |
  LDA $0E                                   ; $05A0BD |
  STA !s_spr_y_hitbox_offset,x              ; $05A0BF |

CODE_05A0C2:
  RTL                                       ; $05A0C2 |

CODE_05A0C3:
  LDY !s_spr_collision_id,x                 ; $05A0C3 |
  BNE CODE_05A11D                           ; $05A0C6 |
  TXA                                       ; $05A0C8 |
  STA !gsu_r1                               ; $05A0C9 |
  LDX #$09                                  ; $05A0CC |
  LDA #$8F33                                ; $05A0CE |
  JSL r_gsu_init_1                          ; $05A0D1 | GSU init
  LDX $12                                   ; $05A0D5 |
  LDY !gsu_r1                               ; $05A0D7 |
  BMI CODE_05A11D                           ; $05A0DA |
  LDA !s_spr_hitbox_width,y                 ; $05A0DC |
  CLC                                       ; $05A0DF |
  ADC #$0006                                ; $05A0E0 |
  STA $00                                   ; $05A0E3 |
  ASL A                                     ; $05A0E5 |
  STA $02                                   ; $05A0E6 |
  LDA !s_spr_x_pixel_pos,x                  ; $05A0E8 |
  CLC                                       ; $05A0EB |
  ADC #$0008                                ; $05A0EC |
  SEC                                       ; $05A0EF |
  SBC !s_spr_x_hitbox_center,y              ; $05A0F0 |
  CLC                                       ; $05A0F3 |
  ADC $00                                   ; $05A0F4 |
  CMP $02                                   ; $05A0F6 |
  BCS CODE_05A11D                           ; $05A0F8 |
  LDA !s_spr_hitbox_height,y                ; $05A0FA |
  CLC                                       ; $05A0FD |
  ADC #$0006                                ; $05A0FE |
  STA $00                                   ; $05A101 |
  ASL A                                     ; $05A103 |
  STA $02                                   ; $05A104 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A106 |
  CLC                                       ; $05A109 |
  ADC #$0008                                ; $05A10A |
  SEC                                       ; $05A10D |
  SBC !s_spr_y_hitbox_center,y              ; $05A10E |
  CLC                                       ; $05A111 |
  ADC $00                                   ; $05A112 |
  CMP $02                                   ; $05A114 |
  BCS CODE_05A11D                           ; $05A116 |
  INY                                       ; $05A118 |
  TYA                                       ; $05A119 |
  STA !s_spr_collision_id,x                 ; $05A11A |

CODE_05A11D:
  RTS                                       ; $05A11D |

  TYX                                       ; $05A11E |
  PLA                                       ; $05A11F |
  STA $00                                   ; $05A120 |
  JSL $03A5B7                               ; $05A122 |
  LDA $00                                   ; $05A126 |
  PHA                                       ; $05A128 |
  LDA !s_spr_timer_2,x                      ; $05A129 |
  BNE CODE_05A168                           ; $05A12C |
  LDA !s_spr_x_player_delta,x               ; $05A12E |
  CLC                                       ; $05A131 |
  ADC #$0070                                ; $05A132 |
  CMP #$00E0                                ; $05A135 |
  BCS CODE_05A168                           ; $05A138 |
  LDA !s_spr_y_player_delta,x               ; $05A13A |
  CLC                                       ; $05A13D |
  ADC #$0070                                ; $05A13E |
  CMP #$00E0                                ; $05A141 |
  BCS CODE_05A168                           ; $05A144 |
  LDA !s_player_form                        ; $05A146 |
  CMP #$0010                                ; $05A149 |
  BEQ CODE_05A168                           ; $05A14C |
  JSL $03AD74                               ; $05A14E |
  BCC CODE_05A168                           ; $05A152 |
  LDA #$84A8                                ; $05A154 |
  STA !s_spr_bitwise_settings_1,x           ; $05A157 |
  LDA #$3D51                                ; $05A15A |
  STA !s_spr_oam_1,x                        ; $05A15D |
  LDA #$0055                                ; $05A160 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A163 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A166 |

CODE_05A168:
  RTS                                       ; $05A168 |

  TYX                                       ; $05A169 |
  LDY !s_spr_collision_id,x                 ; $05A16A |
  DEY                                       ; $05A16D |
  BMI CODE_05A19B                           ; $05A16E |
  LDA !s_spr_state,y                        ; $05A170 |
  CMP #$0010                                ; $05A173 |
  BNE CODE_05A19B                           ; $05A176 |
  LDA !s_spr_collision_state,y              ; $05A178 |
  BEQ CODE_05A19B                           ; $05A17B |
  JSR CODE_05A96C                           ; $05A17D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05A180 |
  LDY !s_spr_facing_dir,x                   ; $05A183 |
  BEQ CODE_05A192                           ; $05A186 |
  EOR #$FFFF                                ; $05A188 |
  SEC                                       ; $05A18B |
  ADC #$0100                                ; $05A18C |
  AND #$01FE                                ; $05A18F |

CODE_05A192:
  STA !s_spr_wildcard_2_lo,x                ; $05A192 |
  LDA #$0206                                ; $05A195 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05A198 |
  RTS                                       ; $05A19A |

CODE_05A19B:
  LDA !s_spr_dyntile_index,x                ; $05A19B |
  LSR A                                     ; $05A19E |
  LSR A                                     ; $05A19F |
  LSR A                                     ; $05A1A0 |
  SEC                                       ; $05A1A1 |
  SBC !r_frame_counter_global               ; $05A1A2 |
  AND #$0003                                ; $05A1A5 |
  BNE CODE_05A1C0                           ; $05A1A8 |
  STZ !s_spr_anim_frame,x                   ; $05A1AA |
  JSR CODE_05A24A                           ; $05A1AD |
  JSR CODE_05A800                           ; $05A1B0 |
  JSR CODE_05A336                           ; $05A1B3 |
  LDY $10DA                                 ; $05A1B6 |
  BNE CODE_05A1C0                           ; $05A1B9 |
  LDY !s_spr_timer_4,x                      ; $05A1BB |
  BEQ CODE_05A1C1                           ; $05A1BE |

CODE_05A1C0:
  RTS                                       ; $05A1C0 |

CODE_05A1C1:
  LDA !s_player_hitbox_half_width           ; $05A1C1 |
  CLC                                       ; $05A1C4 |
  ADC #$0004                                ; $05A1C5 |
  ASL A                                     ; $05A1C8 |
  STA $04                                   ; $05A1C9 |
  LSR A                                     ; $05A1CB |
  CLC                                       ; $05A1CC |
  ADC !s_spr_x_pixel_pos,x                  ; $05A1CD |
  CLC                                       ; $05A1D0 |
  ADC $0C                                   ; $05A1D1 |
  SEC                                       ; $05A1D3 |
  SBC !s_player_center_x                    ; $05A1D4 |
  STA $00                                   ; $05A1D7 |
  CMP $04                                   ; $05A1D9 |
  BCS CODE_05A1C0                           ; $05A1DB |
  LDA !s_player_hitbox_half_height          ; $05A1DD |
  CLC                                       ; $05A1E0 |
  ADC #$0004                                ; $05A1E1 |
  ASL A                                     ; $05A1E4 |
  STA $04                                   ; $05A1E5 |
  LSR A                                     ; $05A1E7 |
  CLC                                       ; $05A1E8 |
  ADC !s_spr_y_pixel_pos,x                  ; $05A1E9 |
  CLC                                       ; $05A1EC |
  ADC $0E                                   ; $05A1ED |
  SEC                                       ; $05A1EF |
  SBC !s_player_center_y                    ; $05A1F0 |
  STA $02                                   ; $05A1F3 |
  CMP $04                                   ; $05A1F5 |
  BCS CODE_05A1C0                           ; $05A1F7 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A1F9 |
  SEC                                       ; $05A1FC |
  SBC #$0100                                ; $05A1FD |
  ORA !s_player_invincibility_timer         ; $05A200 |
  ORA $0D94                                 ; $05A203 |
  BNE CODE_05A249                           ; $05A206 |
  JSL $03BFF7                               ; $05A208 |
  LDA #$A041                                ; $05A20C |
  STA !s_spr_bitwise_settings_3,x           ; $05A20F |
  LDA #$3D01                                ; $05A212 |
  STA !s_spr_oam_1,x                        ; $05A215 |
  INC $0D94                                 ; $05A218 |
  LDY $7E48                                 ; $05A21B |
  BMI CODE_05A224                           ; $05A21E |
  TYA                                       ; $05A220 |
  STA $0D96                                 ; $05A221 |

CODE_05A224:
  LDA $00                                   ; $05A224 |
  STA !s_spr_wildcard_1_lo,x                ; $05A226 |
  LDA $02                                   ; $05A229 |
  STA !s_spr_wildcard_2_lo,x                ; $05A22B |
  JSL $04F74A                               ; $05A22E |
  LDA #$001A                                ; $05A232 |
  STA !s_player_state                       ; $05A235 |
  LDA #$0021                                ; $05A238 |
  STA !s_player_cur_anim_frame              ; $05A23B |
  LDA #$0202                                ; $05A23E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05A241 |
  JSR CODE_05A800                           ; $05A243 |
  JSR CODE_05A352                           ; $05A246 |

CODE_05A249:
  RTS                                       ; $05A249 |

CODE_05A24A:
  LDY !s_spr_wildcard_2_lo,x                ; $05A24A |
  BNE CODE_05A27F                           ; $05A24D |
  LDA !s_player_form                        ; $05A24F |
  CMP #$0010                                ; $05A252 |
  BEQ CODE_05A27F                           ; $05A255 |
  LDA !s_spr_x_pixel_pos,x                  ; $05A257 |
  CLC                                       ; $05A25A |
  ADC #$0008                                ; $05A25B |
  SEC                                       ; $05A25E |
  SBC !s_player_center_x                    ; $05A25F |
  CLC                                       ; $05A262 |
  ADC #$0070                                ; $05A263 |
  CMP #$00E0                                ; $05A266 |
  BCS CODE_05A27F                           ; $05A269 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A26B |
  CLC                                       ; $05A26E |
  ADC #$0008                                ; $05A26F |
  SEC                                       ; $05A272 |
  SBC !s_player_center_y                    ; $05A273 |
  CLC                                       ; $05A276 |
  ADC #$0070                                ; $05A277 |
  CMP #$00E0                                ; $05A27A |
  BCC CODE_05A2B8                           ; $05A27D |

CODE_05A27F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A27F |
  SEC                                       ; $05A282 |
  SBC #$0020                                ; $05A283 |
  CMP #$0055                                ; $05A286 |
  BPL CODE_05A2C7                           ; $05A289 |
  JSL $03AEFD                               ; $05A28B |
  LDY !s_spr_wildcard_2_lo,x                ; $05A28F |
  BEQ CODE_05A29D                           ; $05A292 |
  STZ !s_spr_wildcard_2_lo,x                ; $05A294 |
  LDA #$0100                                ; $05A297 |
  STA !s_spr_timer_2,x                      ; $05A29A |

CODE_05A29D:
  LDA #$0001                                ; $05A29D |
  STA !s_spr_anim_frame,x                   ; $05A2A0 |
  LDA #$BE00                                ; $05A2A3 |
  STA !s_spr_bitwise_settings_1,x           ; $05A2A6 |
  LDA #$3DD1                                ; $05A2A9 |
  STA !s_spr_oam_1,x                        ; $05A2AC |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05A2AF |
  LDA #$0055                                ; $05A2B1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A2B4 |
  RTS                                       ; $05A2B7 |

CODE_05A2B8:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A2B8 |
  CLC                                       ; $05A2BB |
  ADC #$0040                                ; $05A2BC |
  CMP #$0100                                ; $05A2BF |
  BMI CODE_05A2C7                           ; $05A2C2 |
  LDA #$0100                                ; $05A2C4 |

CODE_05A2C7:
  STA !s_spr_gsu_morph_1_lo,x               ; $05A2C7 |
  LDA !s_spr_x_pixel_pos,x                  ; $05A2CA |
  CLC                                       ; $05A2CD |
  ADC #$0008                                ; $05A2CE |
  SEC                                       ; $05A2D1 |
  SBC !s_player_center_x                    ; $05A2D2 |
  STA !gsu_r1                               ; $05A2D5 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A2D8 |
  CLC                                       ; $05A2DB |
  ADC #$0008                                ; $05A2DC |
  SEC                                       ; $05A2DF |
  SBC !s_player_center_y                    ; $05A2E0 |
  LDY !s_spr_oam_yxppccct,x                 ; $05A2E3 |
  BPL CODE_05A2EC                           ; $05A2E6 |
  EOR #$FFFF                                ; $05A2E8 |
  INC A                                     ; $05A2EB |

CODE_05A2EC:
  STA !gsu_r2                               ; $05A2EC |
  LDX #$0B                                  ; $05A2EF |
  LDA #$BCF8                                ; $05A2F1 |
  JSL r_gsu_init_1                          ; $05A2F4 | GSU init
  LDX $12                                   ; $05A2F8 |
  LDA !gsu_r0                               ; $05A2FA |
  SEC                                       ; $05A2FD |
  SBC #$0080                                ; $05A2FE |
  CMP #$0100                                ; $05A301 |
  BCS CODE_05A31A                           ; $05A304 |
  STZ !s_spr_facing_dir,x                   ; $05A306 |
  LDA !gsu_r0                               ; $05A309 |
  CMP #$0100                                ; $05A30C |
  BMI CODE_05A314                           ; $05A30F |
  LDA #$0100                                ; $05A311 |

CODE_05A314:
  CLC                                       ; $05A314 |
  ADC #$0100                                ; $05A315 |
  BRA CODE_05A32F                           ; $05A318 |

CODE_05A31A:
  LDA #$0002                                ; $05A31A |
  STA !s_spr_facing_dir,x                   ; $05A31D |
  LDA !gsu_r0                               ; $05A320 |
  CMP #$0080                                ; $05A323 |
  BMI CODE_05A32B                           ; $05A326 |
  LDA #$0000                                ; $05A328 |

CODE_05A32B:
  EOR #$FFFF                                ; $05A32B |
  INC A                                     ; $05A32E |

CODE_05A32F:
  AND #$01FE                                ; $05A32F |
  STA !s_spr_gsu_morph_2_lo,x               ; $05A332 |
  RTS                                       ; $05A335 |

CODE_05A336:
  LDA !s_spr_timer_1,x                      ; $05A336 |
  BNE CODE_05A352                           ; $05A339 |
  LDA #$0008                                ; $05A33B |
  STA !s_spr_timer_1,x                      ; $05A33E |
  LDA !s_spr_wildcard_5_hi_dp,x             ; $05A341 |
  EOR #$0002                                ; $05A343 |
  STA !s_spr_wildcard_5_hi_dp,x             ; $05A346 |
  TAY                                       ; $05A348 |
  BEQ CODE_05A352                           ; $05A349 |
  LDA #$0039                                ; $05A34B |\ play sound #$0039
  JSL push_sound_queue                      ; $05A34E |/

CODE_05A352:
  LDA $6022                                 ; $05A352 |
  STA $0C                                   ; $05A355 |
  TAY                                       ; $05A357 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05A358 |
  LDA $6020                                 ; $05A35A |
  TAY                                       ; $05A35D |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05A35E |
  LDY !s_spr_oam_yxppccct,x                 ; $05A360 |
  BPL CODE_05A369                           ; $05A363 |
  CLC                                       ; $05A365 |
  ADC #$0010                                ; $05A366 |

CODE_05A369:
  STA $0E                                   ; $05A369 |
  RTS                                       ; $05A36B |

  TYX                                       ; $05A36C |
  STX $61B6                                 ; $05A36D |
  LDA !s_spr_x_pixel_pos,x                  ; $05A370 |
  CLC                                       ; $05A373 |
  ADC $0C                                   ; $05A374 |
  STA $00                                   ; $05A376 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A378 |
  CLC                                       ; $05A37B |
  ADC $0E                                   ; $05A37C |
  STA $02                                   ; $05A37E |
  LDA !s_spr_wildcard_1_lo,x                ; $05A380 |
  STA $04                                   ; $05A383 |
  LDA !s_spr_wildcard_2_lo,x                ; $05A385 |
  STA $06                                   ; $05A388 |
  JSL $049B42                               ; $05A38A |
  PHA                                       ; $05A38E |
  LDA $04                                   ; $05A38F |
  STA !s_spr_wildcard_1_lo,x                ; $05A391 |
  LDA $06                                   ; $05A394 |
  STA !s_spr_wildcard_2_lo,x                ; $05A396 |
  LDA $08                                   ; $05A399 |
  SEC                                       ; $05A39B |
  SBC !s_player_center_x                    ; $05A39C |
  CLC                                       ; $05A39F |
  ADC !s_player_x                           ; $05A3A0 |
  STA !s_player_x                           ; $05A3A3 |
  LDA $0A                                   ; $05A3A6 |
  SEC                                       ; $05A3A8 |
  SBC !s_player_center_y                    ; $05A3A9 |
  CLC                                       ; $05A3AC |
  ADC !s_player_y                           ; $05A3AD |
  STA !s_player_y                           ; $05A3B0 |
  PLA                                       ; $05A3B3 |
  BNE CODE_05A3ED                           ; $05A3B4 |
  STZ !s_spr_wildcard_1_lo,x                ; $05A3B6 |
  STZ !s_spr_wildcard_2_lo,x                ; $05A3B9 |
  LDA #$0005                                ; $05A3BC |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05A3BF |
  LDA #$0020                                ; $05A3C1 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05A3C4 |
  STZ $611A                                 ; $05A3C6 |
  LDY $7E48                                 ; $05A3C9 |
  BMI CODE_05A3E7                           ; $05A3CC |
  LDA #$00FF                                ; $05A3CE |
  STA !s_spr_draw_priority,y                ; $05A3D1 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05A3D4 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05A3D6 |
  INC !s_spr_wildcard_1_lo,x                ; $05A3D8 |
  LDA #$0004                                ; $05A3DB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05A3DE |
  LDA #$0014                                ; $05A3E0 |\ play sound #$0014
  JSL push_sound_queue                      ; $05A3E3 |/

CODE_05A3E7:
  JSR CODE_05A800                           ; $05A3E7 |
  JSR CODE_05A352                           ; $05A3EA |

CODE_05A3ED:
  RTS                                       ; $05A3ED |

  dw $0008, $FFF8                           ; $05A3EE |

  dw $0110, $0100                           ; $05A3F2 |

  dw $FC80, $0380                           ; $05A3F6 |

  dw $FC00, $0400                           ; $05A3FA |

  dw $0004, $FFFC                           ; $05A3FE |

  TYX                                       ; $05A402 |
  LDA !s_spr_oam_yxppccct,x                 ; $05A403 |
  AND #$FFE0                                ; $05A406 |
  ORA #$0024                                ; $05A409 |
  STA !s_spr_oam_yxppccct,x                 ; $05A40C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A40F |
  CMP #$0100                                ; $05A412 |
  BMI CODE_05A464                           ; $05A415 |
  LDA !s_spr_oam_yxppccct,x                 ; $05A417 |
  AND #$FFE0                                ; $05A41A |
  ORA #$0022                                ; $05A41D |
  STA !s_spr_oam_yxppccct,x                 ; $05A420 |
  LDA !r_joy1_lo_mirror                     ; $05A423 |
  AND #$CFF0                                ; $05A426 |
  CMP $0D98                                 ; $05A429 |
  BEQ CODE_05A464                           ; $05A42C |
  STA $0D98                                 ; $05A42E |
  CMP #$0000                                ; $05A431 |
  BEQ CODE_05A464                           ; $05A434 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05A436 |
  CMP #$0005                                ; $05A438 |
  BMI CODE_05A464                           ; $05A43B |
  SEC                                       ; $05A43D |
  SBC #$0010                                ; $05A43E |
  CMP #$0004                                ; $05A441 |
  BPL CODE_05A449                           ; $05A444 |
  LDA #$0004                                ; $05A446 |

CODE_05A449:
  AND #$FFFC                                ; $05A449 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05A44C |
  LDA #$00C0                                ; $05A44E |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A451 |
  BRA CODE_05A464                           ; $05A454 |
  TYX                                       ; $05A456 |
  LDY $7E48                                 ; $05A457 |
  CPY #$00                                  ; $05A45A |
  BMI CODE_05A464                           ; $05A45C |
  LDA #$00FF                                ; $05A45E |
  STA !s_spr_draw_priority,y                ; $05A461 |

CODE_05A464:
  LDY #$00                                  ; $05A464 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05A466 |
  BEQ CODE_05A47C                           ; $05A469 |
  CMP #$0100                                ; $05A46B |
  BPL CODE_05A472                           ; $05A46E |
  INY                                       ; $05A470 |
  INY                                       ; $05A471 |

CODE_05A472:
  CLC                                       ; $05A472 |
  ADC $A3FE,y                               ; $05A473 |
  AND #$01FC                                ; $05A476 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05A479 |

CODE_05A47C:
  LDA !s_spr_dyntile_index,x                ; $05A47C |
  LSR A                                     ; $05A47F |
  LSR A                                     ; $05A480 |
  LSR A                                     ; $05A481 |
  SEC                                       ; $05A482 |
  SBC !r_frame_counter_global               ; $05A483 |
  AND #$0003                                ; $05A486 |
  BEQ CODE_05A48E                           ; $05A489 |
  JMP CODE_05A58C                           ; $05A48B |

CODE_05A48E:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05A48E |
  AND #$0002                                ; $05A490 |
  TAY                                       ; $05A493 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A494 |
  CLC                                       ; $05A497 |
  ADC $A3EE,y                               ; $05A498 |
  CMP $A3F2,y                               ; $05A49B |
  BEQ CODE_05A4A3                           ; $05A49E |
  JMP CODE_05A583                           ; $05A4A0 |

CODE_05A4A3:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05A4A3 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05A4A5 |
  BEQ CODE_05A4AC                           ; $05A4A7 |
  JMP CODE_05A580                           ; $05A4A9 |

CODE_05A4AC:
  PHY                                       ; $05A4AC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A4AD |
  CPY #$05                                  ; $05A4AF |
  BNE CODE_05A4B6                           ; $05A4B1 |
  JMP CODE_05A540                           ; $05A4B3 |

CODE_05A4B6:
  LDY !s_spr_facing_dir,x                   ; $05A4B6 |
  LDA $A3FA,y                               ; $05A4B9 |
  STA $00                                   ; $05A4BC |
  LDY $7E48                                 ; $05A4BE |
  LDA !s_spr_x_pixel_pos,x                  ; $05A4C1 |
  CLC                                       ; $05A4C4 |
  ADC $0C                                   ; $05A4C5 |
  SEC                                       ; $05A4C7 |
  SBC #$0008                                ; $05A4C8 |
  STA !s_spr_x_pixel_pos,y                  ; $05A4CB |
  LDA !s_spr_y_pixel_pos,x                  ; $05A4CE |
  CLC                                       ; $05A4D1 |
  ADC $0E                                   ; $05A4D2 |
  SEC                                       ; $05A4D4 |
  SBC #$0008                                ; $05A4D5 |
  STA !s_spr_y_pixel_pos,y                  ; $05A4D8 |
  LDA #$0010                                ; $05A4DB |
  STA !s_spr_state,y                        ; $05A4DE |
  LDA $00                                   ; $05A4E1 |
  STA !s_spr_x_speed_lo,y                   ; $05A4E3 |
  CPY #$00                                  ; $05A4E6 |
  BNE CODE_05A520                           ; $05A4E8 |
  LDA !s_spr_x_speed_lo                     ; $05A4EA |
  CMP #$8000                                ; $05A4ED |
  ROR A                                     ; $05A4F0 |
  STA !s_spr_x_speed_lo                     ; $05A4F1 |
  STZ $16                                   ; $05A4F4 |
  STZ !s_spr_wildcard_2_lo                  ; $05A4F6 |
  LDA #$0010                                ; $05A4F9 |
  STA !s_spr_timer_4                        ; $05A4FC |
  LDA !s_baby_mario_state                   ; $05A4FF |
  AND #$0FFF                                ; $05A502 |
  STA !s_baby_mario_state                   ; $05A505 |
  LDA !s_player_y                           ; $05A508 |
  SEC                                       ; $05A50B |
  SBC #$0030                                ; $05A50C |
  CLC                                       ; $05A50F |
  ADC !s_bg1_cam_y                          ; $05A510 |
  CLC                                       ; $05A513 |
  ADC #$0030                                ; $05A514 |
  CMP #$8000                                ; $05A517 |
  ROR A                                     ; $05A51A |
  STA $0DB2                                 ; $05A51B |
  BRA CODE_05A523                           ; $05A51E |

CODE_05A520:
  STZ $0390                                 ; $05A520 |

CODE_05A523:
  PHX                                       ; $05A523 |
  LDA !s_spr_id,y                           ; $05A524 |
  ASL A                                     ; $05A527 |
  TAX                                       ; $05A528 |
  SEP #$20                                  ; $05A529 |
  LDA sprite_oam_attributes,x               ; $05A52B |
  STA !s_spr_draw_priority,y                ; $05A52F |
  REP #$20                                  ; $05A532 |
  PLX                                       ; $05A534 |
  LDA #$FFFF                                ; $05A535 |
  STA $0D96                                 ; $05A538 |
  STA $7E48                                 ; $05A53B |
  BRA CODE_05A56D                           ; $05A53E |

CODE_05A540:
  STZ !s_player_state                       ; $05A540 |
  LDY !s_spr_facing_dir,x                   ; $05A543 |
  LDA $A3F6,y                               ; $05A546 |
  STA !s_player_x_speed_prev                ; $05A549 |
  STA !s_player_x_speed                     ; $05A54C |
  LDA #$0070                                ; $05A54F |
  STA !s_player_invincibility_timer         ; $05A552 |
  STZ $0D94                                 ; $05A555 |
  STZ $61B6                                 ; $05A558 |
  LDA #$0060                                ; $05A55B |
  STA !s_spr_timer_4,x                      ; $05A55E |
  LDA #$8841                                ; $05A561 |
  STA !s_spr_bitwise_settings_3,x           ; $05A564 |
  LDA #$3D51                                ; $05A567 |
  STA !s_spr_oam_1,x                        ; $05A56A |

CODE_05A56D:
  LDA #$0014                                ; $05A56D |\ play sound #$0014
  JSL push_sound_queue                      ; $05A570 |/
  LDA #$0020                                ; $05A574 |
  STA !s_spr_timer_1,x                      ; $05A577 |
  LDA #$0204                                ; $05A57A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05A57D |
  PLY                                       ; $05A57F |

CODE_05A580:
  LDA $A3F2,y                               ; $05A580 |

CODE_05A583:
  STA !s_spr_gsu_morph_1_lo,x               ; $05A583 |
  JSR CODE_05A800                           ; $05A586 |
  JSR CODE_05A352                           ; $05A589 |

CODE_05A58C:
  LDA !s_spr_x_pixel_pos,x                  ; $05A58C |
  CLC                                       ; $05A58F |
  ADC $0C                                   ; $05A590 |
  SEC                                       ; $05A592 |
  SBC !s_player_center_x                    ; $05A593 |
  CLC                                       ; $05A596 |
  ADC !s_player_x                           ; $05A597 |
  STA !s_player_x                           ; $05A59A |
  LDA !s_spr_y_pixel_pos,x                  ; $05A59D |
  CLC                                       ; $05A5A0 |
  ADC $0E                                   ; $05A5A1 |
  SEC                                       ; $05A5A3 |
  SBC !s_player_center_y                    ; $05A5A4 |
  CLC                                       ; $05A5A7 |
  ADC !s_player_y                           ; $05A5A8 |
  STA !s_player_y                           ; $05A5AB |
  RTS                                       ; $05A5AE |

  TYX                                       ; $05A5AF |
  LDY !s_spr_wildcard_1_lo,x                ; $05A5B0 |
  BEQ CODE_05A5B8                           ; $05A5B3 |
  JSR CODE_05A58C                           ; $05A5B5 |

CODE_05A5B8:
  LDA !s_spr_timer_1,x                      ; $05A5B8 |
  BNE CODE_05A5D9                           ; $05A5BB |
  CPY #$00                                  ; $05A5BD |
  BNE CODE_05A5C6                           ; $05A5BF |
  LDY #$01                                  ; $05A5C1 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05A5C3 |
  RTS                                       ; $05A5C5 |

CODE_05A5C6:
  DEC !s_spr_wildcard_1_lo,x                ; $05A5C6 |
  LDA #$0020                                ; $05A5C9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05A5CC |
  LDA #$0005                                ; $05A5CE |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05A5D1 |
  JSR CODE_05A800                           ; $05A5D3 |
  JSR CODE_05A352                           ; $05A5D6 |

CODE_05A5D9:
  RTS                                       ; $05A5D9 |

  JSR CODE_05AAFC                           ; $05A5DA |
  BRA CODE_05A5E8                           ; $05A5DD |
  PLA                                       ; $05A5DF |
  STA $00                                   ; $05A5E0 |
  JSR CODE_05AB77                           ; $05A5E2 |
  LDA $00                                   ; $05A5E5 |
  PHA                                       ; $05A5E7 |

CODE_05A5E8:
  JSR CODE_05A990                           ; $05A5E8 |
  JSR CODE_05A800                           ; $05A5EB |
  JMP CODE_05A352                           ; $05A5EE |
  TYX                                       ; $05A5F1 |
  LDA !s_player_x                           ; $05A5F2 |
  CMP #$0300                                ; $05A5F5 |
  BMI CODE_05A621                           ; $05A5F8 |
  LDA #$00F1                                ; $05A5FA |
  STA !r_apu_io_0_mirror                    ; $05A5FD |
  LDA #$00DD                                ; $05A600 |
  JSL spawn_sprite_active                   ; $05A603 |
  LDA #$0002                                ; $05A607 |
  STA !s_player_state                       ; $05A60A |
  LDA #$0026                                ; $05A60D |
  STA !s_spr_wildcard_4_lo,y                ; $05A610 |
  LDA #$0042                                ; $05A613 |
  STA !s_spr_wildcard_2_lo,y                ; $05A616 |
  STZ !s_player_x_speed_prev                ; $05A619 |
  STA !s_player_x_speed                     ; $05A61C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A61F |

CODE_05A621:
  RTS                                       ; $05A621 |

  TYX                                       ; $05A622 |
  LDY $105A                                 ; $05A623 |
  BEQ CODE_05A65D                           ; $05A626 |
  JSL $03AD74                               ; $05A628 |
  BCC CODE_05A65D                           ; $05A62C |
  LDA #$84A8                                ; $05A62E |
  STA !s_spr_bitwise_settings_1,x           ; $05A631 |
  LDA #$3D51                                ; $05A634 |
  STA !s_spr_oam_1,x                        ; $05A637 |
  LDA #$0055                                ; $05A63A |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A63D |
  LDA #$0040                                ; $05A640 |
  STA !s_spr_timer_3,x                      ; $05A643 |
  LDA #$0009                                ; $05A646 |
  STA !r_apu_io_0_mirror                    ; $05A649 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A64C |
  LDA #$0048                                ; $05A64E |
  JSL spawn_sprite_init                     ; $05A651 |
  BCC CODE_05A65D                           ; $05A655 |
  LDA #$0010                                ; $05A657 |
  STA !s_spr_x_pixel_pos,y                  ; $05A65A |

CODE_05A65D:
  RTS                                       ; $05A65D |

  TYX                                       ; $05A65E |
  LDY $03AE                                 ; $05A65F |
  BEQ CODE_05A669                           ; $05A662 |
  LDA $1015                                 ; $05A664 |
  BNE CODE_05A66F                           ; $05A667 |

CODE_05A669:
  LDA $704070                               ; $05A669 |
  BEQ CODE_05A67F                           ; $05A66D |

CODE_05A66F:
  STA !s_spr_timer_1,x                      ; $05A66F |
  LDY #$00                                  ; $05A672 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05A674 |
  JSR CODE_05A800                           ; $05A676 |
  JSR CODE_05A336                           ; $05A679 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A67C |
  RTS                                       ; $05A67E |

CODE_05A67F:
  LDA !s_spr_dyntile_index,x                ; $05A67F |
  LSR A                                     ; $05A682 |
  LSR A                                     ; $05A683 |
  LSR A                                     ; $05A684 |
  SEC                                       ; $05A685 |
  SBC !r_frame_counter_global               ; $05A686 |
  AND #$0003                                ; $05A689 |
  BNE CODE_05A69A                           ; $05A68C |
  STZ !s_spr_anim_frame,x                   ; $05A68E |
  JSR CODE_05A2B8                           ; $05A691 |
  JSR CODE_05A800                           ; $05A694 |
  JSR CODE_05A336                           ; $05A697 |

CODE_05A69A:
  LDA !s_spr_timer_3,x                      ; $05A69A |
  BNE CODE_05A6A5                           ; $05A69D |
  INC $1015                                 ; $05A69F |
  DEC !s_spr_timer_3,x                      ; $05A6A2 |

CODE_05A6A5:
  RTS                                       ; $05A6A5 |

  TYX                                       ; $05A6A6 |
  LDA $1015                                 ; $05A6A7 |
  BPL CODE_05A6BD                           ; $05A6AA |
  LDA #$0020                                ; $05A6AC |
  STA !s_spr_timer_3,x                      ; $05A6AF |
  LDA #$FFFF                                ; $05A6B2 |
  STA !s_spr_timer_1,x                      ; $05A6B5 |
  STZ $1015                                 ; $05A6B8 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A6BB |

CODE_05A6BD:
  RTS                                       ; $05A6BD |

  TYX                                       ; $05A6BE |
  LDA !s_spr_timer_3,x                      ; $05A6BF |
  BNE CODE_05A6E7                           ; $05A6C2 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05A6C4 |
  CLC                                       ; $05A6C7 |
  ADC #$0002                                ; $05A6C8 |
  AND #$01FE                                ; $05A6CB |
  CMP #$0030                                ; $05A6CE |
  BNE CODE_05A6DE                           ; $05A6D1 |
  LDA #$0020                                ; $05A6D3 |
  STA !s_spr_timer_3,x                      ; $05A6D6 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A6D9 |
  LDA #$0030                                ; $05A6DB |

CODE_05A6DE:
  STA !s_spr_gsu_morph_2_lo,x               ; $05A6DE |
  JSR CODE_05A800                           ; $05A6E1 |
  JSR CODE_05A336                           ; $05A6E4 |

CODE_05A6E7:
  RTS                                       ; $05A6E7 |

  TYX                                       ; $05A6E8 |
  LDA !s_spr_timer_3,x                      ; $05A6E9 |
  BNE CODE_05A6E7                           ; $05A6EC |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05A6EE |
  SEC                                       ; $05A6F1 |
  SBC #$0010                                ; $05A6F2 |
  AND #$01FE                                ; $05A6F5 |
  CMP #$01D0                                ; $05A6F8 |
  BNE CODE_05A6DE                           ; $05A6FB |
  LDA #$FC00                                ; $05A6FD |
  STA !s_spr_y_speed_lo,x                   ; $05A700 |
  LDA #$8840                                ; $05A703 |
  STA !s_spr_bitwise_settings_3,x           ; $05A706 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A709 |
  CLC                                       ; $05A70C |
  ADC #$0010                                ; $05A70D |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05A710 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A712 |
  LDA #$01D0                                ; $05A714 |
  BRA CODE_05A6DE                           ; $05A717 |
  TYX                                       ; $05A719 |
  LDA !s_spr_y_pixel_pos,x                  ; $05A71A |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $05A71D |
  BMI CODE_05A727                           ; $05A71F |
  LDA #$8841                                ; $05A721 |
  STA !s_spr_bitwise_settings_3,x           ; $05A724 |

CODE_05A727:
  LDA !s_spr_cam_y_pos,x                    ; $05A727 |
  CMP #$0100                                ; $05A72A |
  BMI CODE_05A737                           ; $05A72D |
  LDA #$0080                                ; $05A72F |
  STA !s_spr_timer_3,x                      ; $05A732 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05A735 |

CODE_05A737:
  RTS                                       ; $05A737 |

  TYX                                       ; $05A738 |
  LDA !s_spr_timer_3,x                      ; $05A739 |
  BNE CODE_05A746                           ; $05A73C |
  INC $105A                                 ; $05A73E |
  PLA                                       ; $05A741 |
  JML $03A31E                               ; $05A742 |

CODE_05A746:
  CMP #$0030                                ; $05A746 |
  BNE CODE_05A757                           ; $05A749 |
  LDA #$0260                                ; $05A74B |
  STA !s_cam_y_small_shaking_timer          ; $05A74E |
  LDA #$01C0                                ; $05A751 |
  STA !s_cam_y_large_shaking_timer          ; $05A754 |

CODE_05A757:
  RTS                                       ; $05A757 |

  TYX                                       ; $05A758 |
  LDA !s_spr_oam_yxppccct,x                 ; $05A759 |
  EOR #$0002                                ; $05A75C |
  STA !s_spr_oam_yxppccct,x                 ; $05A75F |
  RTS                                       ; $05A762 |

  dw $0010, $FFF0, $0000                    ; $05A763 |

CODE_05A769:
  JSL $03AA52                               ; $05A769 |
  LDA !s_spr_oam_yxppccct,x                 ; $05A76D |
  AND #$0080                                ; $05A770 |
  ASL A                                     ; $05A773 |
  ASL A                                     ; $05A774 |
  XBA                                       ; $05A775 |
  TAY                                       ; $05A776 |
  LDA $A763,y                               ; $05A777 |
  STA $02                                   ; $05A77A |
  LDA $A765,y                               ; $05A77C |
  STA $04                                   ; $05A77F |
  LDY !s_spr_facing_dir,x                   ; $05A781 |
  LDA $A763,y                               ; $05A784 |
  STA $00                                   ; $05A787 |
  LDA $A765,y                               ; $05A789 |
  REP #$10                                  ; $05A78C |
  LDY !s_spr_oam_pointer,x                  ; $05A78E |
  CLC                                       ; $05A791 |
  ADC $0C                                   ; $05A792 |
  CLC                                       ; $05A794 |
  ADC !s_spr_cam_x_pos,x                    ; $05A795 |
  STA $6000,y                               ; $05A798 |
  STA $6010,y                               ; $05A79B |
  CLC                                       ; $05A79E |
  ADC $00                                   ; $05A79F |
  STA $6008,y                               ; $05A7A1 |
  STA $6018,y                               ; $05A7A4 |
  LDA $0E                                   ; $05A7A7 |
  CLC                                       ; $05A7A9 |
  ADC $04                                   ; $05A7AA |
  CLC                                       ; $05A7AC |
  ADC !s_spr_cam_y_pos,x                    ; $05A7AD |
  STA $6002,y                               ; $05A7B0 |
  STA $600A,y                               ; $05A7B3 |
  CLC                                       ; $05A7B6 |
  ADC $02                                   ; $05A7B7 |
  STA $6012,y                               ; $05A7B9 |
  STA $601A,y                               ; $05A7BC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05A7BF |
  CMP #$0006                                ; $05A7C1 |
  BMI CODE_05A7D0                           ; $05A7C4 |
  LDA $1015                                 ; $05A7C6 |
  BMI CODE_05A7F9                           ; $05A7C9 |
  CMP #$0002                                ; $05A7CB |
  BPL CODE_05A7F9                           ; $05A7CE |

CODE_05A7D0:
  LDA !s_spr_timer_frozen,x                 ; $05A7D0 |
  BNE CODE_05A7F9                           ; $05A7D3 |
  LDA $6024,y                               ; $05A7D5 |
  AND #$F1FF                                ; $05A7D8 |
  ORA #$0200                                ; $05A7DB |
  STA $6024,y                               ; $05A7DE |
  LDA $602C,y                               ; $05A7E1 |
  AND #$F1FF                                ; $05A7E4 |
  ORA #$0200                                ; $05A7E7 |
  STA $602C,y                               ; $05A7EA |
  LDA $6034,y                               ; $05A7ED |
  AND #$F1FF                                ; $05A7F0 |
  ORA #$0200                                ; $05A7F3 |
  STA $6034,y                               ; $05A7F6 |

CODE_05A7F9:
  SEP #$10                                  ; $05A7F9 |
  RTS                                       ; $05A7FB |

  dw $60E1, $60C1                           ; $05A7FC |

CODE_05A800:
  LDA !s_spr_anim_frame,x                   ; $05A800 |
  BNE CODE_05A87B                           ; $05A803 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05A805 |
  LSR A                                     ; $05A808 |
  STA !gsu_r5                               ; $05A809 |
  TAY                                       ; $05A80C |
  BMI CODE_05A813                           ; $05A80D |
  CLC                                       ; $05A80F |
  ADC #$0100                                ; $05A810 |

CODE_05A813:
  SEC                                       ; $05A813 |
  SBC #$00C0                                ; $05A814 |
  LSR A                                     ; $05A817 |
  LSR A                                     ; $05A818 |
  STA !gsu_r1                               ; $05A819 |
  LDA !gsu_r5                               ; $05A81C |
  SEC                                       ; $05A81F |
  SBC !gsu_r1                               ; $05A820 |
  AND #$00FF                                ; $05A823 |
  STA !gsu_r1                               ; $05A826 |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05A829 |
  LDA $A7FC,y                               ; $05A82B |
  STA !gsu_r12                              ; $05A82E |
  LDA #$0054                                ; $05A831 |
  STA !gsu_r13                              ; $05A834 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05A837 |
  STA !gsu_r0                               ; $05A83A |
  STA !gsu_r4                               ; $05A83D |
  LDA #$0C00                                ; $05A840 |
  STA !gsu_r6                               ; $05A843 |
  LDA !s_spr_facing_dir,x                   ; $05A846 |
  STA !gsu_r7                               ; $05A849 |
  LDY !s_spr_dyntile_index,x                ; $05A84C |
  TYX                                       ; $05A84F |
  LDA $03A9CE,x                             ; $05A850 |
  STA !gsu_r3                               ; $05A854 |
  LDA $03A9EE,x                             ; $05A857 |
  STA !gsu_r2                               ; $05A85B |
  LDX #$08                                  ; $05A85E |
  LDA #$D5F1                                ; $05A860 |
  JSL r_gsu_init_1                          ; $05A863 | GSU init
  LDX $12                                   ; $05A867 |
  INC $0CF9                                 ; $05A869 |
  LDY !s_spr_oam_yxppccct,x                 ; $05A86C |
  BPL CODE_05A87B                           ; $05A86F |
  LDA $6020                                 ; $05A871 |
  EOR #$FFFF                                ; $05A874 |
  INC A                                     ; $05A877 |
  STA $6020                                 ; $05A878 |

CODE_05A87B:
  RTS                                       ; $05A87B |

init_wild_ptooie_piranha:
  JSL $03AE60                               ; $05A87C |
  LDA #$0100                                ; $05A880 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A883 |
  LDA #$01C0                                ; $05A886 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05A889 |
  LDA #$0003                                ; $05A88C |
  STA !s_spr_wildcard_1_lo,x                ; $05A88F |
  JSR CODE_05A9F0                           ; $05A892 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05A895 |
  LDY !s_spr_facing_dir,x                   ; $05A897 |
  BEQ CODE_05A8A0                           ; $05A89A |
  CLC                                       ; $05A89C |
  ADC #$0008                                ; $05A89D |

CODE_05A8A0:
  TAY                                       ; $05A8A0 |
  LDA $AA10,y                               ; $05A8A1 |
  STA !s_spr_wildcard_2_lo,x                ; $05A8A4 |
  JSR CODE_05A800                           ; $05A8A7 |
  RTL                                       ; $05A8AA |

  dw $A9CB                                  ; $05A8AB |
  dw $AA20                                  ; $05A8AD |
  dw $AAFC                                  ; $05A8AF |
  dw $AB77                                  ; $05A8B1 |

main_wild_ptooie_piranha:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05A8B3 |
  TYA                                       ; $05A8B5 |
  CPY #$00                                  ; $05A8B6 |
  BPL CODE_05A8BD                           ; $05A8B8 |
  ORA #$FF00                                ; $05A8BA |

CODE_05A8BD:
  STA $0C                                   ; $05A8BD |
  STA !s_spr_x_hitbox_offset,x              ; $05A8BF |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05A8C2 |
  TYA                                       ; $05A8C4 |
  CPY #$00                                  ; $05A8C5 |
  BPL CODE_05A8CC                           ; $05A8C7 |
  ORA #$FF00                                ; $05A8C9 |

CODE_05A8CC:
  STA $0E                                   ; $05A8CC |
  STA !s_spr_y_hitbox_offset,x              ; $05A8CE |
  JSR CODE_05A769                           ; $05A8D1 |
  JSL $03AF23                               ; $05A8D4 |
  TXY                                       ; $05A8D8 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05A8D9 |
  ASL A                                     ; $05A8DB |
  TAX                                       ; $05A8DC |
  JSR ($A8AB,x)                             ; $05A8DD |
  JSR CODE_05A94C                           ; $05A8E0 |
  JSR CODE_05A990                           ; $05A8E3 |
  JSR CODE_05A800                           ; $05A8E6 |
  LDY $6022                                 ; $05A8E9 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05A8EC |
  LDY $6020                                 ; $05A8EE |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05A8F1 |
  RTL                                       ; $05A8F3 |

CODE_05A8F4:
  LDA !s_spr_x_player_delta,x               ; $05A8F4 |
  EOR #$FFFF                                ; $05A8F7 |
  INC A                                     ; $05A8FA |
  STA !gsu_r1                               ; $05A8FB |
  LDA !s_spr_y_player_delta,x               ; $05A8FE |
  EOR #$FFFF                                ; $05A901 |
  INC A                                     ; $05A904 |
  STA !gsu_r2                               ; $05A905 |
  LDX #$0B                                  ; $05A908 |
  LDA #$BCF8                                ; $05A90A |
  JSL r_gsu_init_1                          ; $05A90D | GSU init
  LDX $12                                   ; $05A911 |
  LDA !gsu_r0                               ; $05A913 |

CODE_05A916:
  STA $00                                   ; $05A916 |
  SEC                                       ; $05A918 |
  SBC !s_spr_wildcard_2_lo,x                ; $05A919 |
  CLC                                       ; $05A91C |
  ADC #$0004                                ; $05A91D |
  CMP #$0008                                ; $05A920 |
  BCS CODE_05A929                           ; $05A923 |
  LDA $00                                   ; $05A925 |
  BRA CODE_05A945                           ; $05A927 |

CODE_05A929:
  BPL CODE_05A939                           ; $05A929 |
  CMP #$FF00                                ; $05A92B |
  BMI CODE_05A93E                           ; $05A92E |

CODE_05A930:
  LDA !s_spr_wildcard_2_lo,x                ; $05A930 |
  SEC                                       ; $05A933 |
  SBC #$0004                                ; $05A934 |
  BRA CODE_05A945                           ; $05A937 |

CODE_05A939:
  CMP #$0100                                ; $05A939 |
  BPL CODE_05A930                           ; $05A93C |

CODE_05A93E:
  LDA !s_spr_wildcard_2_lo,x                ; $05A93E |
  CLC                                       ; $05A941 |
  ADC #$0004                                ; $05A942 |

CODE_05A945:
  AND #$01FE                                ; $05A945 |
  STA !s_spr_wildcard_2_lo,x                ; $05A948 |
  RTS                                       ; $05A94B |

CODE_05A94C:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05A94C |
  CPY #$02                                  ; $05A94E |
  BPL CODE_05A98F                           ; $05A950 |
  LDY !s_spr_collision_id,x                 ; $05A952 |
  BEQ CODE_05A98F                           ; $05A955 |
  DEY                                       ; $05A957 |
  BPL CODE_05A95F                           ; $05A958 |
  JSL player_hit_sprite                     ; $05A95A |
  RTS                                       ; $05A95E |

CODE_05A95F:
  LDA !s_spr_state,y                        ; $05A95F |
  CMP #$0010                                ; $05A962 |
  BNE CODE_05A98F                           ; $05A965 |
  LDA !s_spr_collision_state,y              ; $05A967 |
  BEQ CODE_05A98F                           ; $05A96A |

CODE_05A96C:
  LDA !s_spr_x_speed_lo,y                   ; $05A96C |
  PHP                                       ; $05A96F |
  TYX                                       ; $05A970 |
  JSL $03B25B                               ; $05A971 |
  LDA #$000B                                ; $05A975 |\ play sound #$000B
  JSL push_sound_queue                      ; $05A978 |/
  LDY #$00                                  ; $05A97C |
  PLP                                       ; $05A97E |
  BPL CODE_05A983                           ; $05A97F |
  INY                                       ; $05A981 |
  INY                                       ; $05A982 |

CODE_05A983:
  STY !s_spr_wildcard_6_lo_dp,x             ; $05A983 |
  LDA #$0020                                ; $05A985 |
  STA !s_spr_timer_4,x                      ; $05A988 |
  LDY #$02                                  ; $05A98B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05A98D |

CODE_05A98F:
  RTS                                       ; $05A98F |

CODE_05A990:
  LDY #$00                                  ; $05A990 |
  LDA !s_spr_wildcard_2_lo,x                ; $05A992 |
  CLC                                       ; $05A995 |
  ADC #$0080                                ; $05A996 |
  AND #$01FE                                ; $05A999 |
  CMP #$00E8                                ; $05A99C |
  BMI CODE_05A9B5                           ; $05A99F |
  CMP #$0118                                ; $05A9A1 |
  BMI CODE_05A9C2                           ; $05A9A4 |
  INY                                       ; $05A9A6 |
  INY                                       ; $05A9A7 |
  LDA !s_spr_wildcard_2_lo,x                ; $05A9A8 |
  SEC                                       ; $05A9AB |
  SBC #$0100                                ; $05A9AC |
  EOR #$FFFF                                ; $05A9AF |
  INC A                                     ; $05A9B2 |
  BRA CODE_05A9B8                           ; $05A9B3 |

CODE_05A9B5:
  LDA !s_spr_wildcard_2_lo,x                ; $05A9B5 |

CODE_05A9B8:
  AND #$01FE                                ; $05A9B8 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05A9BB |
  TYA                                       ; $05A9BE |
  STA !s_spr_facing_dir,x                   ; $05A9BF |

CODE_05A9C2:
  RTS                                       ; $05A9C2 |

  dw $0004, $FFFC                           ; $05A9C3 |

  dw $0100, $00E0                           ; $05A9C7 |

  TYX                                       ; $05A9CB |
  LDA !s_spr_timer_4,x                      ; $05A9CC |
  BNE CODE_05AA0F                           ; $05A9CF |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05A9D1 |
  AND #$0001                                ; $05A9D3 |
  ASL A                                     ; $05A9D6 |
  TAY                                       ; $05A9D7 |
  LDA $A9C3,y                               ; $05A9D8 |
  STA $00                                   ; $05A9DB |
  CLC                                       ; $05A9DD |
  ADC !s_spr_gsu_morph_1_lo,x               ; $05A9DE |
  STA !s_spr_gsu_morph_1_lo,x               ; $05A9E1 |
  SEC                                       ; $05A9E4 |
  SBC $A9C7,y                               ; $05A9E5 |
  EOR $00                                   ; $05A9E8 |
  BMI CODE_05AA0C                           ; $05A9EA |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05A9EC |
  BPL CODE_05AA0C                           ; $05A9EE |

CODE_05A9F0:
  LDA #$0010                                ; $05A9F0 |
  STA !s_spr_timer_4,x                      ; $05A9F3 |
  LDA #$0004                                ; $05A9F6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05A9F9 |
  LDA !s_spr_x_pixel_pos,x                  ; $05A9FB |
  AND #$0010                                ; $05A9FE |
  BNE CODE_05AA07                           ; $05AA01 |
  LDY #$06                                  ; $05AA03 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $05AA05 |

CODE_05AA07:
  LDA #$0001                                ; $05AA07 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05AA0A |

CODE_05AA0C:
  JSR CODE_05A8F4                           ; $05AA0C |

CODE_05AA0F:
  RTS                                       ; $05AA0F |

  dw $0190, $01A8, $01A8, $0198             ; $05AA10 |
  dw $0170, $0158, $0158, $0168             ; $05AA18 |

  TYX                                       ; $05AA20 |
  LDA !s_spr_timer_2,x                      ; $05AA21 |
  BNE CODE_05AA2A                           ; $05AA24 |
  LDY #$00                                  ; $05AA26 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05AA28 |

CODE_05AA2A:
  LDA !s_spr_timer_4,x                      ; $05AA2A |
  BNE CODE_05AA0F                           ; $05AA2D |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05AA2F |
  BPL CODE_05AA41                           ; $05AA31 |
  LDA #$0010                                ; $05AA33 |
  STA !s_spr_timer_4,x                      ; $05AA36 |
  LDA #$000B                                ; $05AA39 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05AA3C |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05AA3E |
  RTS                                       ; $05AA40 |

CODE_05AA41:
  LDY !s_spr_facing_dir,x                   ; $05AA41 |
  BEQ CODE_05AA4A                           ; $05AA44 |
  CLC                                       ; $05AA46 |
  ADC #$0008                                ; $05AA47 |

CODE_05AA4A:
  TAY                                       ; $05AA4A |
  LDA $AA10,y                               ; $05AA4B |
  PHA                                       ; $05AA4E |
  PHY                                       ; $05AA4F |
  JSR CODE_05A916                           ; $05AA50 |
  PLY                                       ; $05AA53 |
  PLA                                       ; $05AA54 |
  CMP !s_spr_wildcard_2_lo,x                ; $05AA55 |
  BNE CODE_05AA0F                           ; $05AA58 |
  LDA !s_spr_x_pixel_pos,x                  ; $05AA5A |
  AND #$0010                                ; $05AA5D |
  BNE CODE_05AA64                           ; $05AA60 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $05AA62 |

CODE_05AA64:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05AA64 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05AA66 |
  LDA #$0010                                ; $05AA68 |
  STA !s_spr_timer_2,x                      ; $05AA6B |
  LDA #$0040                                ; $05AA6E |
  STA !s_spr_timer_4,x                      ; $05AA71 |
  LDY #$02                                  ; $05AA74 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05AA76 |
  LDA #$00F9                                ; $05AA78 |
  JSL spawn_sprite_init                     ; $05AA7B |
  BCS CODE_05AA87                           ; $05AA7F |
  LDA #$FFFF                                ; $05AA81 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05AA84 |
  RTS                                       ; $05AA86 |

CODE_05AA87:
  LDA !s_spr_x_pixel_pos,x                  ; $05AA87 |
  CLC                                       ; $05AA8A |
  ADC $0C                                   ; $05AA8B |
  SEC                                       ; $05AA8D |
  SBC #$0008                                ; $05AA8E |
  STA !s_spr_x_pixel_pos,y                  ; $05AA91 |
  LDA !s_spr_y_pixel_pos,x                  ; $05AA94 |
  CLC                                       ; $05AA97 |
  ADC $0E                                   ; $05AA98 |
  SEC                                       ; $05AA9A |
  SBC #$0008                                ; $05AA9B |
  STA !s_spr_y_pixel_pos,y                  ; $05AA9E |
  LDA #$0040                                ; $05AAA1 |
  STA !s_spr_y_accel,y                      ; $05AAA4 |
  LDA #$0400                                ; $05AAA7 |
  STA !s_spr_y_accel_ceiling,y              ; $05AAAA |
  PHY                                       ; $05AAAD |
  LDA #$FA00                                ; $05AAAE |
  STA !gsu_r6                               ; $05AAB1 |
  LDA !s_spr_wildcard_2_lo,x                ; $05AAB4 |
  STA !gsu_r1                               ; $05AAB7 |
  LDX #$0B                                  ; $05AABA |
  LDA #$8595                                ; $05AABC |
  JSL r_gsu_init_1                          ; $05AABF | GSU init
  LDX $12                                   ; $05AAC3 |
  PLY                                       ; $05AAC5 |
  LDA !gsu_r0                               ; $05AAC6 |
  STA !s_spr_x_speed_lo,y                   ; $05AAC9 |
  LDA !gsu_r1                               ; $05AACC |
  STA !s_spr_y_speed_lo,y                   ; $05AACF |
  LDA !s_spr_facing_dir,x                   ; $05AAD2 |
  STA !s_spr_facing_dir,y                   ; $05AAD5 |
  LDA #$0014                                ; $05AAD8 |\ play sound #$0014
  JSL push_sound_queue                      ; $05AADB |/
  RTS                                       ; $05AADF |

  dw $FFF0, $FFF0, $FFFC, $FFFC             ; $05AAE0 |

  dw $FFF0, $0010, $FFFC, $0004             ; $05AAE8 |

  dw $0140, $01C0, $0100                    ; $05AAF0 |

  db $00, $00, $22, $22, $24, $20           ; $05AAF6 |

CODE_05AAFC:
  TYX                                       ; $05AAFC |
  LDA !s_spr_timer_4,x                      ; $05AAFD |
  BNE CODE_05AB33                           ; $05AB00 |
  LDA !s_spr_id,x                           ; $05AB02 |
  CMP #$009F                                ; $05AB05 |
  BNE CODE_05AB1B                           ; $05AB08 |
  LDY !s_spr_wildcard_1_lo,x                ; $05AB0A |
  LDA $AAF7,y                               ; $05AB0D |
  AND #$00FF                                ; $05AB10 |
  STA !s_spr_oam_yxppccct,x                 ; $05AB13 |
  DEC !s_spr_wildcard_1_lo,x                ; $05AB16 |
  BNE CODE_05AB25                           ; $05AB19 |

CODE_05AB1B:
  LDA #$0025                                ; $05AB1B |\ play sound #$0025
  JSL push_sound_queue                      ; $05AB1E |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $05AB22 |
  RTS                                       ; $05AB24 |

CODE_05AB25:
  LDA #$0010                                ; $05AB25 |
  STA !s_spr_timer_4,x                      ; $05AB28 |
  LDA #$000B                                ; $05AB2B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05AB2E |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05AB30 |
  RTS                                       ; $05AB32 |

CODE_05AB33:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05AB33 |
  BMI CODE_05AB53                           ; $05AB35 |
  LDA $AAE0,y                               ; $05AB37 |
  AND !s_spr_wildcard_2_lo,x                ; $05AB3A |
  CLC                                       ; $05AB3D |
  ADC $AAE8,y                               ; $05AB3E |
  AND #$01FE                                ; $05AB41 |
  CMP $AAF0,y                               ; $05AB44 |
  BNE CODE_05AB50                           ; $05AB47 |
  LDA $AAF0,y                               ; $05AB49 |
  LDY #$FF                                  ; $05AB4C |
  STY !s_spr_wildcard_6_lo_dp,x             ; $05AB4E |

CODE_05AB50:
  STA !s_spr_wildcard_2_lo,x                ; $05AB50 |

CODE_05AB53:
  LDA !s_spr_id,x                           ; $05AB53 |
  CMP #$009F                                ; $05AB56 |
  BNE CODE_05AB76                           ; $05AB59 |
  LDA $7974                                 ; $05AB5B |
  BIT #$0003                                ; $05AB5E |
  BNE CODE_05AB76                           ; $05AB61 |
  AND #$0004                                ; $05AB63 |
  LSR A                                     ; $05AB66 |
  LSR A                                     ; $05AB67 |
  CLC                                       ; $05AB68 |
  ADC !s_spr_wildcard_1_lo,x                ; $05AB69 |
  TAY                                       ; $05AB6C |
  LDA $AAF7,y                               ; $05AB6D |
  AND #$00FF                                ; $05AB70 |
  STA !s_spr_oam_yxppccct,x                 ; $05AB73 |

CODE_05AB76:
  RTS                                       ; $05AB76 |

CODE_05AB77:
  TYX                                       ; $05AB77 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05AB78 |
  SEC                                       ; $05AB7B |
  SBC #$0004                                ; $05AB7C |
  CMP #$0030                                ; $05AB7F |
  BPL CODE_05AB92                           ; $05AB82 |
  SEP #$20                                  ; $05AB84 |
  LDA #$FF                                  ; $05AB86 |
  STA !s_spr_stage_id,x                     ; $05AB88 |
  REP #$20                                  ; $05AB8B |
  PLA                                       ; $05AB8D |
  JML $03B25B                               ; $05AB8E |

CODE_05AB92:
  STA !s_spr_gsu_morph_1_lo,x               ; $05AB92 |
  LDA !s_spr_timer_2,x                      ; $05AB95 |
  BNE CODE_05ABA9                           ; $05AB98 |
  LDA #$0004                                ; $05AB9A |
  STA !s_spr_timer_2,x                      ; $05AB9D |
  LDA !s_spr_oam_yxppccct,x                 ; $05ABA0 |
  EOR #$000E                                ; $05ABA3 |
  STA !s_spr_oam_yxppccct,x                 ; $05ABA6 |

CODE_05ABA9:
  RTS                                       ; $05ABA9 |

  dw $0030, $FFD0                           ; $05ABAA |

  dw $FEC0, $0140                           ; $05ABAE |

init_small_burt:
  JSL $03AE60                               ; $05ABB2 |
  LDA #$0003                                ; $05ABB6 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05ABB9 |
  LDA #$0100                                ; $05ABBC |
  STA !s_spr_gsu_morph_1_lo,x               ; $05ABBF |
  SEP #$20                                  ; $05ABC2 |
  STZ !s_spr_wildcard_1_lo,x                ; $05ABC4 |
  REP #$20                                  ; $05ABC7 |
  LDY !s_spr_wildcard_2_lo,x                ; $05ABC9 |
  BMI CODE_05ABD6                           ; $05ABCC |
  LDA !s_spr_x_pixel_pos,x                  ; $05ABCE |
  AND #$0010                                ; $05ABD1 |
  BEQ CODE_05ABFA                           ; $05ABD4 |

CODE_05ABD6:
  LDA #$03FF                                ; $05ABD6 |
  STA !s_spr_wildcard_2_lo,x                ; $05ABD9 |
  LDY #$0C                                  ; $05ABDC |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05ABDE |
  LDA #$0034                                ; $05ABE0 |
  STA !s_spr_y_accel,x                      ; $05ABE3 |
  LDA #$0340                                ; $05ABE6 |
  STA !s_spr_y_accel_ceiling,x              ; $05ABE9 |
  LDA #$0002                                ; $05ABEC |
  STA $0EED                                 ; $05ABEF |
  AND !s_spr_wildcard_6_lo_dp,x             ; $05ABF2 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05ABF4 |
  JSR CODE_05B035                           ; $05ABF6 |
  RTL                                       ; $05ABF9 |

CODE_05ABFA:
  LDY !s_spr_facing_dir,x                   ; $05ABFA |
  LDA $ABAA,y                               ; $05ABFD |
  STA $00                                   ; $05AC00 |
  LDA $ABAE,y                               ; $05AC02 |
  STA $04                                   ; $05AC05 |
  LDA #$00E7                                ; $05AC07 |
  JSL spawn_sprite_active                   ; $05AC0A |
  BCC CODE_05AC1F                           ; $05AC0E |
  STY $02                                   ; $05AC10 |
  TYX                                       ; $05AC12 |
  JSL $03AD74                               ; $05AC13 |
  BCS CODE_05AC23                           ; $05AC17 |
  JSL $03A31E                               ; $05AC19 |
  LDX $12                                   ; $05AC1D |

CODE_05AC1F:
  JML $03A31E                               ; $05AC1F |

CODE_05AC23:
  LDX $12                                   ; $05AC23 |
  LDY $02                                   ; $05AC25 |
  LDA !s_spr_x_pixel_pos,x                  ; $05AC27 |
  CLC                                       ; $05AC2A |
  ADC $00                                   ; $05AC2B |
  STA !s_spr_x_pixel_pos,y                  ; $05AC2D |
  LDA !s_spr_y_pixel_pos,x                  ; $05AC30 |
  STA !s_spr_y_pixel_pos,y                  ; $05AC33 |
  LDA !s_spr_facing_dir,x                   ; $05AC36 |
  STA !s_spr_facing_dir,y                   ; $05AC39 |
  TYA                                       ; $05AC3C |
  ORA #$0300                                ; $05AC3D |
  STA !s_spr_wildcard_2_lo,x                ; $05AC40 |
  TXA                                       ; $05AC43 |
  ORA #$0300                                ; $05AC44 |
  STA !s_spr_wildcard_2_lo,y                ; $05AC47 |
  TXA                                       ; $05AC4A |
  XBA                                       ; $05AC4B |
  ORA #$0002                                ; $05AC4C |
  STA !s_spr_wildcard_1_lo,y                ; $05AC4F |
  INC A                                     ; $05AC52 |
  STA !s_spr_gsu_morph_2_lo,y               ; $05AC53 |
  LDA #$0100                                ; $05AC56 |
  STA !s_spr_gsu_morph_1_lo,y               ; $05AC59 |
  LDA $04                                   ; $05AC5C |
  STA !s_spr_x_speed_lo,y                   ; $05AC5E |
  LDA #$FB00                                ; $05AC61 |
  STA !s_spr_y_speed_lo,y                   ; $05AC64 |
  LDA #$0140                                ; $05AC67 |
  STA !s_spr_wildcard_4_lo,y                ; $05AC6A |
  LDA #$0004                                ; $05AC6D |
  STA !s_spr_wildcard_5_lo,y                ; $05AC70 |
  SEP #$20                                  ; $05AC73 |
  LDA !s_spr_stage_id,x                     ; $05AC75 |
  STA !s_spr_stage_id,y                     ; $05AC78 |
  TYA                                       ; $05AC7B |
  STA !s_spr_wildcard_1_hi,x                ; $05AC7C |
  REP #$20                                  ; $05AC7F |
  TYX                                       ; $05AC81 |
  JSR CODE_05B035                           ; $05AC82 |
  LDX $12                                   ; $05AC85 |
  STZ $0EED                                 ; $05AC87 |
  JSR CODE_05B035                           ; $05AC8A |
  RTL                                       ; $05AC8D |

  dw $B07C, $B0CE, $B152, $B16A             ; $05AC8E |
  dw $B182, $B18B, $80C2, $B1A9             ; $05AC96 |
  dw $B205, $B257, $B2EA, $B34F             ; $05AC9E |
  dw $B3AB, $B3E3, $B182, $B18B             ; $05ACA6 |

main_small_burt:
  LDY !s_spr_draw_priority,x                ; $05ACAE |
  BMI CODE_05ACB6                           ; $05ACB1 |
  JSR CODE_05AD19                           ; $05ACB3 |

CODE_05ACB6:
  JSR CODE_05AE61                           ; $05ACB6 |
  JSL $03AF23                               ; $05ACB9 |
  LDA #$0018                                ; $05ACBD |
  STA !gsu_r0                               ; $05ACC0 |
  LDA #$000E                                ; $05ACC3 |
  STA !gsu_r1                               ; $05ACC6 |
  LDA !s_spr_y_pixel_pos,x                  ; $05ACC9 |
  STA !gsu_r2                               ; $05ACCC |
  LDA #$0200                                ; $05ACCF |
  SEC                                       ; $05ACD2 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05ACD3 |
  STA !gsu_r6                               ; $05ACD6 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05ACD9 |
  STA !gsu_r3                               ; $05ACDC |
  LDX #$0B                                  ; $05ACDF |
  LDA #$86EC                                ; $05ACE1 |
  JSL r_gsu_init_1                          ; $05ACE4 | GSU init
  LDX $12                                   ; $05ACE8 |
  LDA !gsu_r0                               ; $05ACEA |
  STA $0E                                   ; $05ACED |
  JSR CODE_05ADA6                           ; $05ACEF |
  JSR CODE_05AF09                           ; $05ACF2 |
  TXY                                       ; $05ACF5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05ACF6 |
  ASL A                                     ; $05ACF8 |
  TAX                                       ; $05ACF9 |
  JSR ($AC8E,x)                             ; $05ACFA |
  JSR CODE_05B035                           ; $05ACFD |

CODE_05AD00:
  RTL                                       ; $05AD00 |

  CMP #$00E7                                ; $05AD01 |
  BNE CODE_05AD00                           ; $05AD04 |
  JSR CODE_05AE7E                           ; $05AD06 |
  JML $03A32E                               ; $05AD09 |

  dw $009E, $002E, $002F, $FFFF             ; $05AD0D |
  dw $0001, $0003                           ; $05AD15 |

CODE_05AD19:
  LDY #$00                                  ; $05AD19 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05AD1B |
  CMP #$000A                                ; $05AD1D |
  BEQ CODE_05AD3E                           ; $05AD20 |
  CMP #$000B                                ; $05AD22 |
  BEQ CODE_05AD3E                           ; $05AD25 |
  LDA $7860,x                               ; $05AD27 |
  LSR A                                     ; $05AD2A |
  BCS CODE_05AD50                           ; $05AD2B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05AD2D |
  CMP #$0006                                ; $05AD2F |
  BEQ CODE_05AD50                           ; $05AD32 |
  CMP #$0008                                ; $05AD34 |
  BEQ CODE_05AD3E                           ; $05AD37 |
  CMP #$000D                                ; $05AD39 |
  BNE CODE_05AD47                           ; $05AD3C |

CODE_05AD3E:
  LDA !s_spr_timer_3,x                      ; $05AD3E |
  BEQ CODE_05AD50                           ; $05AD41 |
  INY                                       ; $05AD43 |
  INY                                       ; $05AD44 |
  BRA CODE_05AD50                           ; $05AD45 |

CODE_05AD47:
  INY                                       ; $05AD47 |
  INY                                       ; $05AD48 |
  LDA !s_spr_timer_3,x                      ; $05AD49 |
  BNE CODE_05AD50                           ; $05AD4C |
  INY                                       ; $05AD4E |
  INY                                       ; $05AD4F |

CODE_05AD50:
  LDA $AD0D,y                               ; $05AD50 |
  STA $00                                   ; $05AD53 |
  LDA $AD13,y                               ; $05AD55 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05AD58 |
  REP #$10                                  ; $05AD5B |
  LDY !s_spr_oam_pointer,x                  ; $05AD5D |
  BMI CODE_05ADA3                           ; $05AD60 |
  LDA $6004,y                               ; $05AD62 |
  AND #$FF00                                ; $05AD65 |
  ORA $00                                   ; $05AD68 |
  STA $6004,y                               ; $05AD6A |
  LDA $600C,y                               ; $05AD6D |
  AND #$FF00                                ; $05AD70 |
  ORA $00                                   ; $05AD73 |
  STA $600C,y                               ; $05AD75 |
  TYA                                       ; $05AD78 |
  CLC                                       ; $05AD79 |
  ADC #$0010                                ; $05AD7A |
  TAY                                       ; $05AD7D |
  PHY                                       ; $05AD7E |
  JSL $03AA60                               ; $05AD7F |
  REP #$10                                  ; $05AD83 |
  PLY                                       ; $05AD85 |
  LDA #$0004                                ; $05AD86 |
  STA $02                                   ; $05AD89 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05AD8B |
  STA $00                                   ; $05AD8E |

CODE_05AD90:
  LDA $6002,y                               ; $05AD90 |
  SEC                                       ; $05AD93 |
  SBC $00                                   ; $05AD94 |
  STA $6002,y                               ; $05AD96 |
  TYA                                       ; $05AD99 |
  CLC                                       ; $05AD9A |
  ADC #$0008                                ; $05AD9B |
  TAY                                       ; $05AD9E |
  DEC $02                                   ; $05AD9F |
  BNE CODE_05AD90                           ; $05ADA1 |

CODE_05ADA3:
  SEP #$10                                  ; $05ADA3 |

CODE_05ADA5:
  RTS                                       ; $05ADA5 |

CODE_05ADA6:
  TXA                                       ; $05ADA6 |
  STA !gsu_r1                               ; $05ADA7 |
  LDX #$09                                  ; $05ADAA |
  LDA #$9011                                ; $05ADAC |
  JSL r_gsu_init_1                          ; $05ADAF | GSU init

CODE_05ADB3:
  LDX $12                                   ; $05ADB3 |
  LDY !gsu_r14                              ; $05ADB5 |
  BMI CODE_05ADA5                           ; $05ADB8 |
  LDA !s_spr_state,y                        ; $05ADBA |
  CMP #$0010                                ; $05ADBD |
  BNE CODE_05ADA5                           ; $05ADC0 |
  LDA !s_spr_collision_state,y              ; $05ADC2 |
  BNE CODE_05ADD2                           ; $05ADC5 |

CODE_05ADC7:
  LDX #$09                                  ; $05ADC7 |
  LDA !gsu_r15                              ; $05ADC9 |
  JSL r_gsu_init_1                          ; $05ADCC | GSU init
  BRA CODE_05ADB3                           ; $05ADD0 |

CODE_05ADD2:
  LDA !s_spr_bitwise_settings_3,y           ; $05ADD2 |
  AND #$4000                                ; $05ADD5 |
  BNE CODE_05ADC7                           ; $05ADD8 |
  TYX                                       ; $05ADDA |
  JSL $03B25B                               ; $05ADDB |

CODE_05ADDF:
  JSL $05AE0B                               ; $05ADDF |
  LDY !s_spr_wildcard_1_hi,x                ; $05ADE3 |
  BMI CODE_05ADF1                           ; $05ADE6 |
  SEP #$20                                  ; $05ADE8 |
  LDA #$FF                                  ; $05ADEA |
  STA !s_spr_wildcard_1_hi,y                ; $05ADEC |
  REP #$20                                  ; $05ADEF |

CODE_05ADF1:
  SEP #$20                                  ; $05ADF1 |
  LDA #$FF                                  ; $05ADF3 |
  STA !s_spr_stage_id,x                     ; $05ADF5 |
  REP #$20                                  ; $05ADF8 |
  PLA                                       ; $05ADFA |
  JML $03B273                               ; $05ADFB |

  dw $0000, $FE6B                           ; $05ADFF |

  dw $0195, $FE00, $FE11, $FE11             ; $05AE03 |

  PHB                                       ; $05AE0B |
  PHK                                       ; $05AE0C |
  PLB                                       ; $05AE0D |
  LDA !r_stars_amount                       ; $05AE0E |
  STA $06                                   ; $05AE11 |
  LDY #$06                                  ; $05AE13 |

CODE_05AE15:
  TYA                                       ; $05AE15 |
  STA $00                                   ; $05AE16 |
  LDA $ADFD,y                               ; $05AE18 |
  STA $02                                   ; $05AE1B |
  LDA $AE03,y                               ; $05AE1D |
  STA $04                                   ; $05AE20 |
  LDA $06                                   ; $05AE22 |
  CLC                                       ; $05AE24 |
  ADC #$000A                                ; $05AE25 |
  STA $06                                   ; $05AE28 |
  CMP #$0136                                ; $05AE2A |
  BMI CODE_05AE34                           ; $05AE2D |
  LDA #$0115                                ; $05AE2F |
  BRA CODE_05AE37                           ; $05AE32 |

CODE_05AE34:
  LDA #$01A2                                ; $05AE34 |

CODE_05AE37:
  JSL spawn_sprite_init                     ; $05AE37 |
  BCC CODE_05AE5F                           ; $05AE3B |
  LDA !s_spr_x_pixel_pos,x                  ; $05AE3D |
  STA !s_spr_x_pixel_pos,y                  ; $05AE40 |
  LDA !s_spr_y_pixel_pos,x                  ; $05AE43 |
  STA !s_spr_y_pixel_pos,y                  ; $05AE46 |
  LDA $02                                   ; $05AE49 |
  STA !s_spr_x_speed_lo,y                   ; $05AE4B |
  LDA $04                                   ; $05AE4E |
  STA !s_spr_y_speed_lo,y                   ; $05AE50 |
  LDA #$0011                                ; $05AE53 |
  STA !s_spr_timer_3,y                      ; $05AE56 |
  LDY $00                                   ; $05AE59 |
  DEY                                       ; $05AE5B |
  DEY                                       ; $05AE5C |
  BNE CODE_05AE15                           ; $05AE5D |

CODE_05AE5F:
  PLB                                       ; $05AE5F |
  RTL                                       ; $05AE60 |

CODE_05AE61:
  LDA !s_spr_timer_frozen,x                 ; $05AE61 |
  BEQ CODE_05AE71                           ; $05AE64 |
  STZ !s_spr_bitwise_settings_3,x           ; $05AE66 |
  LDA #$3155                                ; $05AE69 |
  STA !s_spr_oam_1,x                        ; $05AE6C |
  BRA CODE_05AE7E                           ; $05AE6F |

CODE_05AE71:
  LDA !s_spr_state,x                        ; $05AE71 |
  CMP #$0010                                ; $05AE74 |
  BEQ CODE_05AED4                           ; $05AE77 |
  CMP #$0008                                ; $05AE79 |
  BEQ CODE_05AE95                           ; $05AE7C |

CODE_05AE7E:
  LDY !s_spr_wildcard_1_hi,x                ; $05AE7E |
  BPL CODE_05AE84                           ; $05AE81 |
  RTS                                       ; $05AE83 |

CODE_05AE84:
  SEP #$20                                  ; $05AE84 |
  LDA #$FF                                  ; $05AE86 |
  STA !s_spr_wildcard_1_hi,y                ; $05AE88 |
  STA !s_spr_stage_id,x                     ; $05AE8B |
  STA !s_spr_wildcard_1_hi,x                ; $05AE8E |
  REP #$20                                  ; $05AE91 |
  BRA CODE_05AE9A                           ; $05AE93 |

CODE_05AE95:
  LDA !s_spr_x_accel_ceiling,x              ; $05AE95 |
  BNE CODE_05AED2                           ; $05AE98 |

CODE_05AE9A:
  LDY !s_spr_wildcard_2_lo,x                ; $05AE9A |
  BMI CODE_05AED2                           ; $05AE9D |
  SEP #$20                                  ; $05AE9F |
  LDA #$FF                                  ; $05AEA1 |
  STA !s_spr_wildcard_2_lo,y                ; $05AEA3 |
  STA !s_spr_wildcard_2_lo,x                ; $05AEA6 |
  REP #$20                                  ; $05AEA9 |
  LDA #$000C                                ; $05AEAB |
  STA !s_spr_wildcard_5_lo,y                ; $05AEAE |
  LDA !s_spr_wildcard_1_lo,y                ; $05AEB1 |
  EOR #$0002                                ; $05AEB4 |
  STA $0EED                                 ; $05AEB7 |
  LDA #$0034                                ; $05AEBA |
  STA !s_spr_y_accel,y                      ; $05AEBD |
  LDA #$0340                                ; $05AEC0 |
  STA !s_spr_y_accel_ceiling,y              ; $05AEC3 |
  STA !s_spr_x_accel_ceiling,x              ; $05AEC6 |
  LDA !s_spr_wildcard_6_lo,y                ; $05AEC9 |
  AND #$0002                                ; $05AECC |
  STA !s_spr_wildcard_6_lo,y                ; $05AECF |

CODE_05AED2:
  PLA                                       ; $05AED2 |
  RTL                                       ; $05AED3 |

CODE_05AED4:
  JSL $03A2B0                               ; $05AED4 |
  BCC CODE_05AF04                           ; $05AED8 |
  LDY !s_spr_wildcard_2_lo,x                ; $05AEDA |
  BMI CODE_05AEEA                           ; $05AEDD |
  TYX                                       ; $05AEDF |
  JSL $03A2B0                               ; $05AEE0 |
  BCC CODE_05AF02                           ; $05AEE4 |
  JSL $03A31E                               ; $05AEE6 |

CODE_05AEEA:
  LDX $12                                   ; $05AEEA |
  LDY !s_spr_wildcard_1_hi,x                ; $05AEEC |
  BMI CODE_05AEFD                           ; $05AEEF |
  SEP #$20                                  ; $05AEF1 |
  LDA #$FF                                  ; $05AEF3 |
  STA !s_spr_wildcard_1_hi,y                ; $05AEF5 |
  STA !s_spr_stage_id,x                     ; $05AEF8 |
  REP #$20                                  ; $05AEFB |

CODE_05AEFD:
  PLA                                       ; $05AEFD |
  JML $03A31E                               ; $05AEFE |

CODE_05AF02:
  LDX $12                                   ; $05AF02 |

CODE_05AF04:
  RTS                                       ; $05AF04 |

  dw $0100, $FF00                           ; $05AF05 |

CODE_05AF09:
  LDY $0D94                                 ; $05AF09 |
  BNE CODE_05AF68                           ; $05AF0C |
  CPX $61B6                                 ; $05AF0E |
  BNE CODE_05AF78                           ; $05AF11 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05AF13 |
  AND #$0002                                ; $05AF15 |
  BEQ CODE_05AF78                           ; $05AF18 |
  LDA !s_player_tile_collision              ; $05AF1A |
  BIT #$0007                                ; $05AF1D |
  BNE CODE_05AF62                           ; $05AF20 |
  LDY !s_spr_y_speed_hi,x                   ; $05AF22 |
  BPL CODE_05AF46                           ; $05AF25 |
  AND #$0018                                ; $05AF27 |
  BEQ CODE_05AF46                           ; $05AF2A |
  STZ !s_spr_y_speed_lo,x                   ; $05AF2C |
  LDA !s_spr_y_pixel_pos,x                  ; $05AF2F |
  SEC                                       ; $05AF32 |
  SBC !s_spr_y_delta_lo,x                   ; $05AF33 |
  STA !s_spr_y_pixel_pos,x                  ; $05AF36 |
  LDA !s_spr_y_hitbox_center,x              ; $05AF39 |
  SEC                                       ; $05AF3C |
  SBC !s_spr_y_delta_lo,x                   ; $05AF3D |
  STA !s_spr_y_hitbox_center,x              ; $05AF40 |
  STZ !s_spr_y_delta_lo,x                   ; $05AF43 |

CODE_05AF46:
  LDA !s_player_hitbox_half_width           ; $05AF46 |
  CLC                                       ; $05AF49 |
  ADC !s_spr_hitbox_width,x                 ; $05AF4A |
  ASL A                                     ; $05AF4D |
  STA $00                                   ; $05AF4E |
  LSR A                                     ; $05AF50 |
  CLC                                       ; $05AF51 |
  ADC !s_player_center_x                    ; $05AF52 |
  SEC                                       ; $05AF55 |
  SBC !s_spr_x_hitbox_center,x              ; $05AF56 |
  CMP $00                                   ; $05AF59 |
  BCS CODE_05AF62                           ; $05AF5B |
  LDY $60AB                                 ; $05AF5D |
  BPL CODE_05AFD1                           ; $05AF60 |

CODE_05AF62:
  LDA #$0010                                ; $05AF62 |
  STA !s_spr_timer_4,x                      ; $05AF65 |

CODE_05AF68:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05AF68 |
  AND #$0001                                ; $05AF6A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05AF6D |
  CPX $61B6                                 ; $05AF6F |
  BNE CODE_05AF77                           ; $05AF72 |
  STZ $61B6                                 ; $05AF74 |

CODE_05AF77:
  RTS                                       ; $05AF77 |

CODE_05AF78:
  LDA !s_player_hitbox_half_width           ; $05AF78 |
  CLC                                       ; $05AF7B |
  ADC !s_spr_hitbox_width,x                 ; $05AF7C |
  ASL A                                     ; $05AF7F |
  STA $00                                   ; $05AF80 |
  LSR A                                     ; $05AF82 |
  CLC                                       ; $05AF83 |
  ADC !s_player_center_x                    ; $05AF84 |
  SEC                                       ; $05AF87 |
  SBC !s_spr_x_hitbox_center,x              ; $05AF88 |
  CMP $00                                   ; $05AF8B |
  BCS CODE_05AF68                           ; $05AF8D |
  LDA $0E                                   ; $05AF8F |
  SEC                                       ; $05AF91 |
  SBC !s_player_hitbox_half_height          ; $05AF92 |
  SEC                                       ; $05AF95 |
  SBC !s_player_center_y                    ; $05AF96 |
  BPL CODE_05AF68                           ; $05AF99 |
  CMP #$FFF0                                ; $05AF9B |
  BCS CODE_05AFA3                           ; $05AF9E |

CODE_05AFA0:
  JMP CODE_05B02B                           ; $05AFA0 |

CODE_05AFA3:
  LDY $60AB                                 ; $05AFA3 |
  BMI CODE_05AFA0                           ; $05AFA6 |
  LDA !s_player_tile_collision              ; $05AFA8 |
  BIT #$0018                                ; $05AFAB |
  BEQ CODE_05AFB5                           ; $05AFAE |
  AND #$01E0                                ; $05AFB0 |
  BEQ CODE_05B02B                           ; $05AFB3 |

CODE_05AFB5:
  LDY !s_player_ground_pound_state          ; $05AFB5 |
  BEQ CODE_05AFBD                           ; $05AFB8 |
  JMP CODE_05ADDF                           ; $05AFBA |

CODE_05AFBD:
  LDY $61B6                                 ; $05AFBD |
  BEQ CODE_05AFC7                           ; $05AFC0 |
  CPX $61B6                                 ; $05AFC2 |
  BNE CODE_05B02B                           ; $05AFC5 |

CODE_05AFC7:
  STX $61B6                                 ; $05AFC7 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05AFCA |
  ORA #$0002                                ; $05AFCC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05AFCF |

CODE_05AFD1:
  LDA $7860,x                               ; $05AFD1 |
  AND #$0001                                ; $05AFD4 |
  BEQ CODE_05AFF6                           ; $05AFD7 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05AFD9 |
  AND #$0001                                ; $05AFDB |
  BNE CODE_05AFF6                           ; $05AFDE |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05AFE0 |
  CPY #$0A                                  ; $05AFE2 |
  BEQ CODE_05AFF6                           ; $05AFE4 |
  LDA #$0004                                ; $05AFE6 |
  STA !s_spr_timer_3,x                      ; $05AFE9 |
  LDY #$0A                                  ; $05AFEC |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05AFEE |
  STZ !s_player_x_speed_prev                ; $05AFF0 |
  STZ !s_player_x_speed                     ; $05AFF3 |

CODE_05AFF6:
  LDA $0E                                   ; $05AFF6 |
  SEC                                       ; $05AFF8 |
  SBC !s_player_hitbox_half_height          ; $05AFF9 |
  SEC                                       ; $05AFFC |
  SBC !s_player_center_y                    ; $05AFFD |
  CLC                                       ; $05B000 |
  ADC !s_player_y                           ; $05B001 |
  STA !s_player_y                           ; $05B004 |
  LDA #$0180                                ; $05B007 |
  LDY !s_spr_x_delta_hi,x                   ; $05B00A |
  BMI CODE_05B012                           ; $05B00D |
  LDA #$0060                                ; $05B00F |

CODE_05B012:
  AND !s_player_tile_collision              ; $05B012 |
  BNE CODE_05B021                           ; $05B015 |
  LDA !s_player_x                           ; $05B017 |
  CLC                                       ; $05B01A |
  ADC !s_spr_x_delta_lo,x                   ; $05B01B |
  STA !s_player_x                           ; $05B01E |

CODE_05B021:
  STZ !s_player_y_speed                     ; $05B021 |
  STZ !s_player_ground_pound_state          ; $05B024 |
  INC !s_on_sprite_platform_flag            ; $05B027 |
  RTS                                       ; $05B02A |

CODE_05B02B:
  LDY !s_spr_collision_id,x                 ; $05B02B |
  BPL CODE_05B034                           ; $05B02E |
  JSL player_hit_sprite                     ; $05B030 |

CODE_05B034:
  RTS                                       ; $05B034 |

CODE_05B035:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B035 |
  STA !gsu_r6                               ; $05B038 |
  LDA #$0200                                ; $05B03B |
  SEC                                       ; $05B03E |
  SBC !gsu_r6                               ; $05B03F |
  STA !gsu_r11                              ; $05B042 |
  LDA #$0010                                ; $05B045 |
  STA !gsu_r8                               ; $05B048 |
  ASL A                                     ; $05B04B |
  STA !gsu_r9                               ; $05B04C |
  LDA #$0054                                ; $05B04F |
  STA !gsu_r13                              ; $05B052 |
  LDA #$80E1                                ; $05B055 |
  STA !gsu_r12                              ; $05B058 |
  LDY !s_spr_dyntile_index,x                ; $05B05B |
  TYX                                       ; $05B05E |
  LDA $03A9CE,x                             ; $05B05F |
  STA !gsu_r3                               ; $05B063 |
  LDA $03A9EE,x                             ; $05B066 |
  STA !gsu_r2                               ; $05B06A |
  LDX #$08                                  ; $05B06D |
  LDA #$8295                                ; $05B06F |
  JSL r_gsu_init_1                          ; $05B072 | GSU init
  LDX $12                                   ; $05B076 |
  INC $0CF9                                 ; $05B078 |
  RTS                                       ; $05B07B |

  TYX                                       ; $05B07C |

CODE_05B07D:
  LDY !s_spr_wildcard_2_lo,x                ; $05B07D |
  BMI CODE_05B0CD                           ; $05B080 |
  LDA !s_spr_y_speed_lo,y                   ; $05B082 |
  BMI CODE_05B0CD                           ; $05B085 |
  LDA !s_spr_x_pixel_pos,x                  ; $05B087 |
  SEC                                       ; $05B08A |
  SBC !s_spr_x_pixel_pos,y                  ; $05B08B |
  CLC                                       ; $05B08E |
  ADC #$0010                                ; $05B08F |
  CMP #$0020                                ; $05B092 |
  BCS CODE_05B0CD                           ; $05B095 |
  LDA $0E                                   ; $05B097 |
  SEC                                       ; $05B099 |
  SBC #$000E                                ; $05B09A |
  STA $00                                   ; $05B09D |
  SEC                                       ; $05B09F |
  SBC !s_spr_y_pixel_pos,y                  ; $05B0A0 |
  BPL CODE_05B0CD                           ; $05B0A3 |
  CMP #$FFF8                                ; $05B0A5 |
  BMI CODE_05B0CD                           ; $05B0A8 |
  LDA $00                                   ; $05B0AA |
  STA !s_spr_y_pixel_pos,y                  ; $05B0AC |
  LDA #$0000                                ; $05B0AF |
  STA !s_spr_y_speed_lo,y                   ; $05B0B2 |
  STA !s_spr_y_accel,y                      ; $05B0B5 |
  STA !s_spr_x_speed_lo,y                   ; $05B0B8 |
  LDA #$0002                                ; $05B0BB |
  STA !s_spr_timer_3,y                      ; $05B0BE |
  LDA #$0006                                ; $05B0C1 |
  STA !s_spr_wildcard_5_lo,y                ; $05B0C4 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05B0C7 |
  LDY #$01                                  ; $05B0C9 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05B0CB |

CODE_05B0CD:
  RTS                                       ; $05B0CD |

  TYX                                       ; $05B0CE |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B0CF |
  CMP #$0160                                ; $05B0D2 |
  BMI CODE_05B13B                           ; $05B0D5 |
  LDY !s_spr_wildcard_2_lo,x                ; $05B0D7 |
  LDA !s_spr_state,y                        ; $05B0DA |
  CMP #$0010                                ; $05B0DD |
  BNE CODE_05B119                           ; $05B0E0 |
  LDA #$FA00                                ; $05B0E2 |
  STA !s_spr_y_speed_lo,y                   ; $05B0E5 |
  LDA #$0034                                ; $05B0E8 |
  STA !s_spr_y_accel,y                      ; $05B0EB |
  LDA #$0340                                ; $05B0EE |
  STA !s_spr_y_accel_ceiling,y              ; $05B0F1 |
  LDA #$0004                                ; $05B0F4 |
  STA !s_spr_timer_3,y                      ; $05B0F7 |
  LDA #$0180                                ; $05B0FA |
  STA !s_spr_wildcard_4_lo,y                ; $05B0FD |
  PHY                                       ; $05B100 |
  LDA !s_spr_facing_dir,y                   ; $05B101 |
  TAY                                       ; $05B104 |
  LDA $ABAE,y                               ; $05B105 |
  PLY                                       ; $05B108 |
  STA !s_spr_x_speed_lo,y                   ; $05B109 |
  LDA #$0007                                ; $05B10C |
  STA !s_spr_wildcard_5_lo,y                ; $05B10F |
  LDA #$0034                                ; $05B112 |\ play sound #$0034
  JSL push_sound_queue                      ; $05B115 |/

CODE_05B119:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B119 |
  AND #$0002                                ; $05B11B |
  BEQ CODE_05B132                           ; $05B11E |
  LDA #$FC00                                ; $05B120 |
  STA !s_player_y_speed                     ; $05B123 |
  LDA #$0006                                ; $05B126 |
  STA !s_player_jump_state                  ; $05B129 |
  LDA #$8001                                ; $05B12C |
  STA !s_player_flutter_state               ; $05B12F |

CODE_05B132:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05B132 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B134 |
  LDA #$0160                                ; $05B136 |
  BRA CODE_05B13F                           ; $05B139 |

CODE_05B13B:
  CLC                                       ; $05B13B |
  ADC #$0008                                ; $05B13C |

CODE_05B13F:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B13F |
  LDY !s_spr_wildcard_2_lo,x                ; $05B142 |
  STA !s_spr_gsu_morph_1_lo,y               ; $05B145 |
  LDA $0E                                   ; $05B148 |
  SEC                                       ; $05B14A |
  SBC #$000E                                ; $05B14B |
  STA !s_spr_y_pixel_pos,y                  ; $05B14E |
  RTS                                       ; $05B151 |

  TYX                                       ; $05B152 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B153 |
  CMP #$00C0                                ; $05B156 |
  BPL CODE_05B162                           ; $05B159 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B15B |
  LDA #$00C0                                ; $05B15D |
  BRA CODE_05B166                           ; $05B160 |

CODE_05B162:
  SEC                                       ; $05B162 |
  SBC #$0018                                ; $05B163 |

CODE_05B166:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B166 |
  RTS                                       ; $05B169 |

  TYX                                       ; $05B16A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B16B |
  CMP #$0100                                ; $05B16E |
  BMI CODE_05B17A                           ; $05B171 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05B173 |
  LDA #$0100                                ; $05B175 |
  BRA CODE_05B17E                           ; $05B178 |

CODE_05B17A:
  CLC                                       ; $05B17A |
  ADC #$0008                                ; $05B17B |

CODE_05B17E:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B17E |
  RTS                                       ; $05B181 |

  TYX                                       ; $05B182 |
  LDA !s_spr_y_speed_lo,x                   ; $05B183 |
  BMI CODE_05B1CB                           ; $05B186 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B188 |
  RTS                                       ; $05B18A |

  TYX                                       ; $05B18B |
  LDA $7860,x                               ; $05B18C |
  AND #$0001                                ; $05B18F |
  BEQ CODE_05B1A8                           ; $05B192 |
  INC A                                     ; $05B194 |
  STA !s_spr_timer_3,x                      ; $05B195 |
  STZ !s_spr_x_speed_lo,x                   ; $05B198 |
  LDY #$09                                  ; $05B19B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05B19D |
  CMP #$0005                                ; $05B19F |
  BEQ CODE_05B1A6                           ; $05B1A2 |
  LDY #$0D                                  ; $05B1A4 |

CODE_05B1A6:
  STY !s_spr_wildcard_5_lo_dp,x             ; $05B1A6 |

CODE_05B1A8:
  RTS                                       ; $05B1A8 |

  TYX                                       ; $05B1A9 |
  LDA !s_spr_y_speed_lo,x                   ; $05B1AA |
  BMI CODE_05B1CB                           ; $05B1AD |
  LDA #$0100                                ; $05B1AF |
  STA !s_spr_gsu_morph_1_lo,x               ; $05B1B2 |
  LDA $7860,x                               ; $05B1B5 |
  AND #$0001                                ; $05B1B8 |
  BEQ CODE_05B1CA                           ; $05B1BB |
  LDA #$0004                                ; $05B1BD |
  STA !s_spr_timer_3,x                      ; $05B1C0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05B1C3 |
  STZ !s_spr_x_speed_lo,x                   ; $05B1C5 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B1C8 |

CODE_05B1CA:
  RTS                                       ; $05B1CA |

CODE_05B1CB:
  EOR #$FFFF                                ; $05B1CB |
  INC A                                     ; $05B1CE |
  STA !gsu_r1                               ; $05B1CF |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05B1D2 |
  ASL A                                     ; $05B1D4 |
  STA !gsu_r2                               ; $05B1D5 |
  LDA #$0040                                ; $05B1D8 |
  STA !gsu_r3                               ; $05B1DB |
  LDX #$0B                                  ; $05B1DE |
  LDA #$86D1                                ; $05B1E0 |
  JSL r_gsu_init_1                          ; $05B1E3 | GSU init
  LDX $12                                   ; $05B1E7 |
  LDA #$0100                                ; $05B1E9 |
  SEC                                       ; $05B1EC |
  SBC !gsu_r0                               ; $05B1ED |
  CLC                                       ; $05B1F0 |
  ADC !s_spr_gsu_morph_1_lo,x               ; $05B1F1 |
  LSR A                                     ; $05B1F4 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05B1F5 |
  RTS                                       ; $05B1F8 |

  dw $0100, $00C0, $0160, $0008             ; $05B1F9 |
  dw $FFF0, $0010                           ; $05B201 |

  TYX                                       ; $05B205 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05B206 |
  TAY                                       ; $05B208 |
  AND #$0002                                ; $05B209 |
  BEQ CODE_05B218                           ; $05B20C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B20E |
  CMP $B1F9,y                               ; $05B211 |
  BPL CODE_05B24F                           ; $05B214 |
  BRA CODE_05B220                           ; $05B216 |

CODE_05B218:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B218 |
  CMP $B1F9,y                               ; $05B21B |
  BMI CODE_05B24F                           ; $05B21E |

CODE_05B220:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05B220 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05B222 |
  BPL CODE_05B24A                           ; $05B224 |
  PHY                                       ; $05B226 |
  LDY !s_spr_wildcard_2_lo,x                ; $05B227 |
  LDA #$0010                                ; $05B22A |
  STA !s_spr_timer_1,y                      ; $05B22D |
  LDA #$0000                                ; $05B230 |
  STA !s_spr_x_speed_lo,y                   ; $05B233 |
  LDA #$0009                                ; $05B236 |
  STA !s_spr_wildcard_5_lo,y                ; $05B239 |
  LDY #$00                                  ; $05B23C |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05B23E |
  LDA $0EED                                 ; $05B240 |
  EOR #$0002                                ; $05B243 |
  STA $0EED                                 ; $05B246 |
  PLY                                       ; $05B249 |

CODE_05B24A:
  LDA $B1F9,y                               ; $05B24A |
  BRA CODE_05B253                           ; $05B24D |

CODE_05B24F:
  CLC                                       ; $05B24F |
  ADC $B1FF,y                               ; $05B250 |

CODE_05B253:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B253 |

CODE_05B256:
  RTS                                       ; $05B256 |

  TYX                                       ; $05B257 |
  LDA !s_spr_timer_1,x                      ; $05B258 |
  BNE CODE_05B256                           ; $05B25B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B25D |
  CMP #$0140                                ; $05B260 |
  BMI CODE_05B2E2                           ; $05B263 |
  LDY !s_spr_wildcard_2_lo,x                ; $05B265 |
  LDA !s_spr_x_hitbox_center,y              ; $05B268 |
  SEC                                       ; $05B26B |
  SBC !s_spr_x_hitbox_center,x              ; $05B26C |
  STA !gsu_r0                               ; $05B26F |
  CLC                                       ; $05B272 |
  ADC #$0040                                ; $05B273 |
  CMP #$0080                                ; $05B276 |
  BCC CODE_05B288                           ; $05B279 |
  BPL CODE_05B282                           ; $05B27B |
  LDA #$FFC0                                ; $05B27D |
  BRA CODE_05B285                           ; $05B280 |

CODE_05B282:
  LDA #$0040                                ; $05B282 |

CODE_05B285:
  STA !gsu_r0                               ; $05B285 |

CODE_05B288:
  LDA #$05C0                                ; $05B288 |
  STA !gsu_r6                               ; $05B28B |
  LDX #$0B                                  ; $05B28E |
  LDA #$86B6                                ; $05B290 |
  JSL r_gsu_init_1                          ; $05B293 | GSU init
  LDX $12                                   ; $05B297 |
  STZ !s_spr_facing_dir,x                   ; $05B299 |
  LDA !gsu_r0                               ; $05B29C |
  STA !s_spr_x_speed_lo,x                   ; $05B29F |
  BMI CODE_05B2AA                           ; $05B2A2 |
  LDA #$0002                                ; $05B2A4 |
  STA !s_spr_facing_dir,x                   ; $05B2A7 |

CODE_05B2AA:
  LDA #$FB00                                ; $05B2AA |
  STA !s_spr_y_speed_lo,x                   ; $05B2AD |
  LDA #$0140                                ; $05B2B0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05B2B3 |
  LDA #$0004                                ; $05B2B5 |
  STA !s_spr_timer_3,x                      ; $05B2B8 |
  LDA #$0004                                ; $05B2BB |
  STA !s_spr_wildcard_5_lo,x                ; $05B2BE |
  STZ $7860,x                               ; $05B2C1 |
  LDA #$0034                                ; $05B2C4 |\ play sound #$0034
  JSL push_sound_queue                      ; $05B2C7 |/
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B2CB |
  AND #$0002                                ; $05B2CD |
  BEQ CODE_05B2DD                           ; $05B2D0 |
  STZ !s_on_sprite_platform_flag            ; $05B2D2 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05B2D5 |
  LDA #$0010                                ; $05B2D7 |
  STA !s_spr_timer_4,x                      ; $05B2DA |

CODE_05B2DD:
  LDA #$0140                                ; $05B2DD |
  BRA CODE_05B2E6                           ; $05B2E0 |

CODE_05B2E2:
  CLC                                       ; $05B2E2 |
  ADC #$0006                                ; $05B2E3 |

CODE_05B2E6:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B2E6 |
  RTS                                       ; $05B2E9 |

  TYX                                       ; $05B2EA |
  LDY !s_spr_y_speed_hi,x                   ; $05B2EB |
  BMI CODE_05B2FB                           ; $05B2EE |
  LDA $7860,x                               ; $05B2F0 |
  AND #$0001                                ; $05B2F3 |
  BEQ CODE_05B2FB                           ; $05B2F6 |
  STZ !s_spr_x_speed_lo,x                   ; $05B2F8 |

CODE_05B2FB:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B2FB |
  CMP #$0160                                ; $05B2FE |
  BMI CODE_05B344                           ; $05B301 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B303 |
  AND #$0002                                ; $05B305 |
  BNE CODE_05B317                           ; $05B308 |
  STZ !s_on_sprite_platform_flag            ; $05B30A |
  LDA #$0004                                ; $05B30D |
  STA !s_spr_timer_3,x                      ; $05B310 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B313 |
  BRA CODE_05B33F                           ; $05B315 |

CODE_05B317:
  LDY !s_spr_wildcard_2_lo,x                ; $05B317 |
  BMI CODE_05B33F                           ; $05B31A |
  LDA $7860,y                               ; $05B31C |
  LSR A                                     ; $05B31F |
  BCC CODE_05B33F                           ; $05B320 |
  LDA #$0009                                ; $05B322 |
  CMP !s_spr_wildcard_5_lo,y                ; $05B325 |
  BEQ CODE_05B33F                           ; $05B328 |
  STA !s_spr_wildcard_5_lo,y                ; $05B32A |
  LDA #$0010                                ; $05B32D |
  STA !s_spr_timer_1,y                      ; $05B330 |
  LDA #$0000                                ; $05B333 |
  STA !s_spr_x_speed_lo,y                   ; $05B336 |
  LDY !s_spr_wildcard_1_lo,x                ; $05B339 |
  STY $0EED                                 ; $05B33C |

CODE_05B33F:
  LDA #$0160                                ; $05B33F |
  BRA CODE_05B348                           ; $05B342 |

CODE_05B344:
  CLC                                       ; $05B344 |
  ADC #$0008                                ; $05B345 |

CODE_05B348:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B348 |
  JSR CODE_05B07D                           ; $05B34B |
  RTS                                       ; $05B34E |

  TYX                                       ; $05B34F |
  LDY !s_spr_y_speed_hi,x                   ; $05B350 |
  BMI CODE_05B360                           ; $05B353 |
  LDA $7860,x                               ; $05B355 |
  AND #$0001                                ; $05B358 |
  BEQ CODE_05B360                           ; $05B35B |
  STZ !s_spr_x_speed_lo,x                   ; $05B35D |

CODE_05B360:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B360 |
  CMP #$0100                                ; $05B363 |
  BPL CODE_05B3A0                           ; $05B366 |
  LDY !s_spr_wildcard_2_lo,x                ; $05B368 |
  BPL CODE_05B371                           ; $05B36B |
  LDY #$0C                                  ; $05B36D |
  BRA CODE_05B399                           ; $05B36F |

CODE_05B371:
  LDA !s_spr_wildcard_1_lo,x                ; $05B371 |
  CMP $0EED                                 ; $05B374 |
  BEQ CODE_05B397                           ; $05B377 |
  LDA $7860,y                               ; $05B379 |
  LSR A                                     ; $05B37C |
  BCC CODE_05B39B                           ; $05B37D |
  LDA #$0010                                ; $05B37F |
  STA !s_spr_timer_1,y                      ; $05B382 |
  LDA #$0000                                ; $05B385 |
  STA !s_spr_x_speed_lo,y                   ; $05B388 |
  LDA #$0009                                ; $05B38B |
  STA !s_spr_wildcard_5_lo,y                ; $05B38E |
  LDY !s_spr_wildcard_1_lo,x                ; $05B391 |
  STY $0EED                                 ; $05B394 |

CODE_05B397:
  LDY #$00                                  ; $05B397 |

CODE_05B399:
  STY !s_spr_wildcard_5_lo_dp,x             ; $05B399 |

CODE_05B39B:
  LDA #$0100                                ; $05B39B |
  BRA CODE_05B3A4                           ; $05B39E |

CODE_05B3A0:
  SEC                                       ; $05B3A0 |
  SBC #$0010                                ; $05B3A1 |

CODE_05B3A4:
  JMP CODE_05B348                           ; $05B3A4 |

  dw $0008, $FFF8                           ; $05B3A7 |

  TYX                                       ; $05B3AB |
  LDA $7860,x                               ; $05B3AC |
  AND #$0001                                ; $05B3AF |
  BEQ CODE_05B3CF                           ; $05B3B2 |
  STZ !s_spr_x_speed_lo,x                   ; $05B3B4 |
  LDY #$00                                  ; $05B3B7 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B3B9 |
  CMP #$0100                                ; $05B3BC |
  BNE CODE_05B3D0                           ; $05B3BF |
  LDA #$0004                                ; $05B3C1 |
  STA !s_spr_timer_3,x                      ; $05B3C4 |
  LDA #$0020                                ; $05B3C7 |
  STA !s_spr_timer_1,x                      ; $05B3CA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B3CD |

CODE_05B3CF:
  RTS                                       ; $05B3CF |

CODE_05B3D0:
  BMI CODE_05B3D4                           ; $05B3D0 |
  INY                                       ; $05B3D2 |
  INY                                       ; $05B3D3 |

CODE_05B3D4:
  CLC                                       ; $05B3D4 |
  ADC $B3A7,y                               ; $05B3D5 |
  AND #$FFF8                                ; $05B3D8 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05B3DB |
  RTS                                       ; $05B3DE |

  JSL $00DEFF                               ; $05B3DF |
  TYX                                       ; $05B3E3 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B3E4 |
  CMP #$0140                                ; $05B3E7 |
  BMI CODE_05B415                           ; $05B3EA |
  LDY !s_spr_facing_dir,x                   ; $05B3EC |
  LDA $B3DF,y                               ; $05B3EF |
  STA !s_spr_x_speed_lo,x                   ; $05B3F2 |
  LDA #$FA00                                ; $05B3F5 |
  STA !s_spr_y_speed_lo,x                   ; $05B3F8 |
  LDA #$0180                                ; $05B3FB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05B3FE |
  LDA #$0004                                ; $05B400 |
  STA !s_spr_timer_3,x                      ; $05B403 |
  INC !s_spr_wildcard_5_lo,x                ; $05B406 |
  LDA #$0034                                ; $05B409 |\ play sound #$0034
  JSL push_sound_queue                      ; $05B40C |/
  LDA #$0140                                ; $05B410 |
  BRA CODE_05B419                           ; $05B413 |

CODE_05B415:
  CLC                                       ; $05B415 |
  ADC #$0008                                ; $05B416 |

CODE_05B419:
  STA !s_spr_gsu_morph_1_lo,x               ; $05B419 |
  RTS                                       ; $05B41C |

  db $20, $22, $24, $28                     ; $05B41D |

init_balloon:
  LDA !s_spr_x_pixel_pos,x                  ; $05B421 |
  BIT #$0010                                ; $05B424 |
  BEQ CODE_05B455                           ; $05B427 |
  AND #$FFE0                                ; $05B429 |
  STA !s_spr_wildcard_2_lo,x                ; $05B42C |
  LDA #$00FF                                ; $05B42F |
  STA !s_spr_draw_priority,x                ; $05B432 |
  LDA #$0060                                ; $05B435 |
  STA !s_spr_bitwise_settings_1,x           ; $05B438 |
  LDA #$4000                                ; $05B43B |
  STA !s_spr_bitwise_settings_3,x           ; $05B43E |
  LDA #$0002                                ; $05B441 |
  STA !s_spr_oam_1,x                        ; $05B444 |
  STZ !s_spr_y_accel,x                      ; $05B447 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B44A |
  LDY !r_balloon_gen_flag                   ; $05B44C |
  BNE CODE_05B454                           ; $05B44F |
  INC !r_balloon_gen_flag                   ; $05B451 |

CODE_05B454:
  RTL                                       ; $05B454 |

CODE_05B455:
  LDY $0FEB                                 ; $05B455 |
  BNE CODE_05B469                           ; $05B458 |
  JSL $03AE60                               ; $05B45A |
  INC $0FEB                                 ; $05B45E |
  LDA !s_spr_dyntile_index,x                ; $05B461 |
  STA $0FE9                                 ; $05B464 |
  BRA CODE_05B46F                           ; $05B467 |

CODE_05B469:
  LDA $0FE9                                 ; $05B469 |
  STA !s_spr_dyntile_index,x                ; $05B46C |

CODE_05B46F:
  INC $0FED                                 ; $05B46F |
  LDA #$0040                                ; $05B472 |
  STA !s_spr_timer_1,x                      ; $05B475 |
  STA !s_spr_x_accel_ceiling,x              ; $05B478 |
  LDA #$0004                                ; $05B47B |
  STA !s_spr_x_accel,x                      ; $05B47E |
  SEP #$20                                  ; $05B481 |
  LDA $10                                   ; $05B483 |
  AND #$03                                  ; $05B485 |
  TAY                                       ; $05B487 |
  LDA $B41D,y                               ; $05B488 |
  STA !s_spr_oam_yxppccct,x                 ; $05B48B |
  REP #$20                                  ; $05B48E |
  LDA #$0041                                ; $05B490 |
  STA !gsu_r12                              ; $05B493 |
  LDA #$0055                                ; $05B496 |
  STA !gsu_r13                              ; $05B499 |
  LDA #$0100                                ; $05B49C |
  STA !gsu_r6                               ; $05B49F |
  LDA #$0010                                ; $05B4A2 |
  STA !gsu_r8                               ; $05B4A5 |
  STA !gsu_r9                               ; $05B4A8 |
  LDY !s_spr_dyntile_index,x                ; $05B4AB |
  TYX                                       ; $05B4AE |
  LDA $03A9CE,x                             ; $05B4AF |
  STA !gsu_r3                               ; $05B4B3 |
  LDA $03A9EE,x                             ; $05B4B6 |
  STA !gsu_r2                               ; $05B4BA |
  LDX #$08                                  ; $05B4BD |
  LDA #$8293                                ; $05B4BF |
  JSL r_gsu_init_1                          ; $05B4C2 | GSU init
  LDX $12                                   ; $05B4C6 |
  INC $0CF9                                 ; $05B4C8 |
  RTL                                       ; $05B4CB |

main_balloon:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05B4CC |
  BEQ CODE_05B4D3                           ; $05B4CE |
  JMP CODE_05B52B                           ; $05B4D0 |

CODE_05B4D3:
  JSL $03AA52                               ; $05B4D3 |
  JSL $03AF23                               ; $05B4D7 |
  JSL $03A2C7                               ; $05B4DB |
  BCC CODE_05B50F                           ; $05B4DF |
  LDA !s_spr_dyntile_index,x                ; $05B4E1 |
  CMP $0FE9                                 ; $05B4E4 |
  BEQ CODE_05B4F3                           ; $05B4E7 |
  JSL $03AEFD                               ; $05B4E9 |
  LDA $0FE9                                 ; $05B4ED |
  STA !s_spr_dyntile_index,x                ; $05B4F0 |

CODE_05B4F3:
  DEC $0FED                                 ; $05B4F3 |
  BEQ CODE_05B500                           ; $05B4F6 |
  LDA #$FFFF                                ; $05B4F8 |
  STA !s_spr_dyntile_index,x                ; $05B4FB |
  BRA CODE_05B503                           ; $05B4FE |

CODE_05B500:
  STZ $0FEB                                 ; $05B500 |

CODE_05B503:
  CPX $61B6                                 ; $05B503 |
  BNE CODE_05B50B                           ; $05B506 |
  STZ $61B6                                 ; $05B508 |

CODE_05B50B:
  JML $03A31E                               ; $05B50B |

CODE_05B50F:
  JSR CODE_05B565                           ; $05B50F |
  JSR CODE_05B6B0                           ; $05B512 |
  LDA !s_spr_timer_1,x                      ; $05B515 |
  BNE CODE_05B52A                           ; $05B518 |
  LDA #$0080                                ; $05B51A |
  STA !s_spr_timer_1,x                      ; $05B51D |
  LDA !s_spr_x_accel_ceiling,x              ; $05B520 |
  EOR #$FFFF                                ; $05B523 |
  INC A                                     ; $05B526 |
  STA !s_spr_x_accel_ceiling,x              ; $05B527 |

CODE_05B52A:
  RTL                                       ; $05B52A |

CODE_05B52B:
  JSL $03AF23                               ; $05B52B |
  LDY !r_balloon_gen_flag                   ; $05B52F |
  BEQ CODE_05B50B                           ; $05B532 |
  LDA !s_spr_cam_x_pos,x                    ; $05B534 |
  CLC                                       ; $05B537 |
  ADC #$0040                                ; $05B538 |
  CMP #$0180                                ; $05B53B |
  BCS CODE_05B50B                           ; $05B53E |
  LDA !s_spr_timer_1,x                      ; $05B540 |
  BNE CODE_05B564                           ; $05B543 |
  LDA #$0052                                ; $05B545 |
  JSL spawn_sprite_init                     ; $05B548 |
  BCC CODE_05B564                           ; $05B54C |
  LDA !s_spr_wildcard_2_lo,x                ; $05B54E |
  STA !s_spr_x_pixel_pos,y                  ; $05B551 |
  LDA !s_bg1_cam_y                          ; $05B554 |
  CLC                                       ; $05B557 |
  ADC #$0100                                ; $05B558 |
  STA !s_spr_y_pixel_pos,y                  ; $05B55B |
  LDA #$0240                                ; $05B55E |
  STA !s_spr_timer_1,x                      ; $05B561 |

CODE_05B564:
  RTL                                       ; $05B564 |

CODE_05B565:
  LDY $60AB                                 ; $05B565 |
  BMI CODE_05B5B0                           ; $05B568 |
  LDY $0D94                                 ; $05B56A |
  BNE CODE_05B5B0                           ; $05B56D |
  LDA !s_player_tile_collision              ; $05B56F |
  AND #$0018                                ; $05B572 |
  BNE CODE_05B5B0                           ; $05B575 |
  LDA !s_spr_x_player_delta,x               ; $05B577 |
  CLC                                       ; $05B57A |
  ADC #$0010                                ; $05B57B |
  CMP #$0020                                ; $05B57E |
  BCS CODE_05B5B0                           ; $05B581 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B583 |
  LSR A                                     ; $05B585 |
  LSR A                                     ; $05B586 |
  LSR A                                     ; $05B587 |
  LSR A                                     ; $05B588 |
  CLC                                       ; $05B589 |
  ADC !s_spr_y_pixel_pos,x                  ; $05B58A |
  CLC                                       ; $05B58D |
  ADC #$0000                                ; $05B58E |
  SEC                                       ; $05B591 |
  SBC !s_player_center_y                    ; $05B592 |
  SEC                                       ; $05B595 |
  SBC !s_player_hitbox_half_height          ; $05B596 |
  STA $00                                   ; $05B599 |
  CPX $61B6                                 ; $05B59B |
  BNE CODE_05B5AB                           ; $05B59E |
  LDA !s_spr_y_accel_ceiling,x              ; $05B5A0 |
  CMP #$FF40                                ; $05B5A3 |
  BEQ CODE_05B5B8                           ; $05B5A6 |
  JMP CODE_05B64D                           ; $05B5A8 |

CODE_05B5AB:
  CMP #$FFF8                                ; $05B5AB |
  BCS CODE_05B5EE                           ; $05B5AE |

CODE_05B5B0:
  CPX $61B6                                 ; $05B5B0 |
  BNE CODE_05B5CE                           ; $05B5B3 |
  STZ $61B6                                 ; $05B5B5 |

CODE_05B5B8:
  LDA #$0040                                ; $05B5B8 |
  STA !s_spr_x_accel_ceiling,x              ; $05B5BB |
  LDA #$FF40                                ; $05B5BE |
  STA !s_spr_y_accel_ceiling,x              ; $05B5C1 |
  LDA !s_spr_x_player_delta,x               ; $05B5C4 |
  ASL A                                     ; $05B5C7 |
  ASL A                                     ; $05B5C8 |
  ASL A                                     ; $05B5C9 |
  ASL A                                     ; $05B5CA |
  STA !s_spr_x_speed_lo,x                   ; $05B5CB |

CODE_05B5CE:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05B5CE |
  BEQ CODE_05B5ED                           ; $05B5D0 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B5D2 |
  SEC                                       ; $05B5D4 |
  SBC #$0010                                ; $05B5D5 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05B5D8 |
  CMP #$0010                                ; $05B5DA |
  BPL CODE_05B5ED                           ; $05B5DD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05B5DF |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05B5E1 |
  JSL $03AEFD                               ; $05B5E3 |
  LDA $0FE9                                 ; $05B5E7 |
  STA !s_spr_dyntile_index,x                ; $05B5EA |

CODE_05B5ED:
  RTS                                       ; $05B5ED |

CODE_05B5EE:
  LDY !s_player_jump_state                  ; $05B5EE |
  BEQ CODE_05B5B0                           ; $05B5F1 |
  LDY $61B6                                 ; $05B5F3 |
  BNE CODE_05B5CE                           ; $05B5F6 |
  STX $61B6                                 ; $05B5F8 |
  LDA !s_player_y_speed                     ; $05B5FB |
  LSR A                                     ; $05B5FE |
  LSR A                                     ; $05B5FF |
  CMP #$0060                                ; $05B600 |
  BMI CODE_05B608                           ; $05B603 |
  LDA #$0060                                ; $05B605 |

CODE_05B608:
  STA !s_spr_wildcard_1_lo,x                ; $05B608 |
  ASL A                                     ; $05B60B |
  CLC                                       ; $05B60C |
  ADC !s_spr_y_speed_lo,x                   ; $05B60D |
  CMP #$00C0                                ; $05B610 |
  BMI CODE_05B618                           ; $05B613 |
  LDA #$00C0                                ; $05B615 |

CODE_05B618:
  STA !s_spr_y_speed_lo,x                   ; $05B618 |
  LDA #$FFD0                                ; $05B61B |
  STA !s_spr_y_accel_ceiling,x              ; $05B61E |
  LDA !s_player_x_speed_prev                ; $05B621 |
  CMP #$8000                                ; $05B624 |
  ROR A                                     ; $05B627 |
  CMP #$8000                                ; $05B628 |
  ROR A                                     ; $05B62B |
  CMP #$8000                                ; $05B62C |
  ROR A                                     ; $05B62F |
  CLC                                       ; $05B630 |
  ADC !s_spr_x_speed_lo,x                   ; $05B631 |
  STA !s_spr_x_speed_lo,x                   ; $05B634 |
  STZ !s_spr_x_accel_ceiling,x              ; $05B637 |
  JSL $03AD74                               ; $05B63A |
  BCC CODE_05B64D                           ; $05B63E |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05B640 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05B642 |
  LDA #$0010                                ; $05B645 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05B648 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05B64B |

CODE_05B64D:
  LDA !s_player_tile_collision              ; $05B64D |
  AND #$0007                                ; $05B650 |
  BEQ CODE_05B65D                           ; $05B653 |
  LDY !s_spr_y_speed_hi,x                   ; $05B655 |
  BMI CODE_05B65D                           ; $05B658 |
  JMP CODE_05B5B0                           ; $05B65A |

CODE_05B65D:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05B65D |
  BEQ CODE_05B692                           ; $05B65F |
  LDA !s_spr_wildcard_1_lo,x                ; $05B661 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $05B664 |
  BMI CODE_05B670                           ; $05B666 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B668 |
  CLC                                       ; $05B66A |
  ADC !s_spr_gsu_morph_1_lo,x               ; $05B66B |
  BRA CODE_05B690                           ; $05B66E |

CODE_05B670:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05B670 |
  BNE CODE_05B685                           ; $05B673 |
  INC !s_spr_gsu_morph_2_lo,x               ; $05B675 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05B678 |
  LSR A                                     ; $05B67B |
  STA !s_spr_gsu_morph_1_lo,x               ; $05B67C |
  LDA #$0020                                ; $05B67F |
  STA !s_spr_wildcard_1_lo,x                ; $05B682 |

CODE_05B685:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B685 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $05B687 |
  BEQ CODE_05B690                           ; $05B68A |
  SEC                                       ; $05B68C |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05B68D |

CODE_05B690:
  STA !s_spr_wildcard_6_lo_dp,x             ; $05B690 |

CODE_05B692:
  LDA $00                                   ; $05B692 |
  INC A                                     ; $05B694 |
  SEC                                       ; $05B695 |
  ADC !s_player_y                           ; $05B696 |
  STA !s_player_y                           ; $05B699 |
  LDA !s_player_x                           ; $05B69C |
  CLC                                       ; $05B69F |
  ADC !s_spr_x_delta_lo,x                   ; $05B6A0 |
  STA !s_player_x                           ; $05B6A3 |
  STZ !s_player_jump_state                  ; $05B6A6 |
  STZ !s_player_y_speed                     ; $05B6A9 |
  INC !s_on_sprite_platform_flag            ; $05B6AC |
  RTS                                       ; $05B6AF |

CODE_05B6B0:
  LDA !s_spr_dyntile_index,x                ; $05B6B0 |
  CMP $0FE9                                 ; $05B6B3 |
  BEQ CODE_05B6DD                           ; $05B6B6 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B6B8 |
  STA !gsu_r4                               ; $05B6BA |
  LDY !s_spr_dyntile_index,x                ; $05B6BD |
  TYX                                       ; $05B6C0 |
  LDA $03A9CE,x                             ; $05B6C1 |
  STA $6000                                 ; $05B6C5 |
  LDA $03A9EE,x                             ; $05B6C8 |
  STA !gsu_r2                               ; $05B6CC |
  LDX #$08                                  ; $05B6CF |
  LDA #$D584                                ; $05B6D1 |
  JSL r_gsu_init_1                          ; $05B6D4 | GSU init
  LDX $12                                   ; $05B6D8 |
  INC $0CF9                                 ; $05B6DA |

CODE_05B6DD:
  RTS                                       ; $05B6DD |

init_yoshi_block:
  LDA !s_transform_timer                    ; $05B6DE |
  BEQ CODE_05B6E8                           ; $05B6E1 |
  LDA $0C8A                                 ; $05B6E3 |
  BNE CODE_05B6F3                           ; $05B6E6 |

CODE_05B6E8:
  LDY #$03                                  ; $05B6E8 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05B6EA |
  LDA #$00FF                                ; $05B6EC |
  STA !s_spr_draw_priority,x                ; $05B6EF |
  RTL                                       ; $05B6F2 |

CODE_05B6F3:
  LDA !s_spr_x_pixel_pos,x                  ; $05B6F3 |
  STA $00                                   ; $05B6F6 |
  LDA !s_spr_y_pixel_pos,x                  ; $05B6F8 |
  STA $02                                   ; $05B6FB |
  LDA #$01E6                                ; $05B6FD |
  JSL $03B56E                               ; $05B700 |
  JSL $03AE60                               ; $05B704 |
  LDA !s_spr_x_pixel_pos,x                  ; $05B708 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05B70B |
  DEC !s_spr_y_pixel_pos,x                  ; $05B70D |
  LDA !s_spr_y_pixel_pos,x                  ; $05B710 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05B713 |
  STZ !s_spr_facing_dir,x                   ; $05B715 |
  LDA #$0100                                ; $05B718 |
  STA !gsu_r6                               ; $05B71B |
  LDA #$0010                                ; $05B71E |
  STA !gsu_r8                               ; $05B721 |
  STZ !gsu_r9                               ; $05B724 |
  LDA #$0054                                ; $05B727 |
  STA !gsu_r13                              ; $05B72A |
  LDA #$E0C0                                ; $05B72D |
  STA !gsu_r12                              ; $05B730 |
  LDY !s_spr_dyntile_index,x                ; $05B733 |
  TYX                                       ; $05B736 |
  LDA $03A9CE,x                             ; $05B737 |
  STA !gsu_r3                               ; $05B73B |
  LDA $03A9EE,x                             ; $05B73E |
  STA !gsu_r2                               ; $05B742 |
  LDX #$08                                  ; $05B745 |
  LDA #$8293                                ; $05B747 |
  JSL r_gsu_init_1                          ; $05B74A | GSU init
  LDX $12                                   ; $05B74E |
  INC $0CF9                                 ; $05B750 |
  RTL                                       ; $05B753 |

yoshi_block_ptr:
  dw $80C2                                  ; $05B754 |
  dw $B7D1                                  ; $05B756 |
  dw $B85A                                  ; $05B758 |

main_yoshi_block:
  JSL $03AA52                               ; $05B75A |
  LDA !s_sprite_disable_flag                ; $05B75E |
  ORA $0B55                                 ; $05B761 |
  ORA !r_cur_item_used                      ; $05B764 |
  BEQ CODE_05B76D                           ; $05B767 |
  JSL $03B69D                               ; $05B769 |

CODE_05B76D:
  LDA !s_player_state                       ; $05B76D |
  CMP #$0018                                ; $05B770 |
  BEQ CODE_05B7B6                           ; $05B773 |
  TXY                                       ; $05B775 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05B776 |
  CMP #$0003                                ; $05B778 |
  BNE CODE_05B793                           ; $05B77B |
  LDA !s_transform_timer                    ; $05B77D |
  BEQ CODE_05B7D0                           ; $05B780 |
  LDA $0C8A                                 ; $05B782 |
  BEQ CODE_05B7D0                           ; $05B785 |
  LDA #$0002                                ; $05B787 |
  STA !s_spr_draw_priority,x                ; $05B78A |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05B78D |
  JML $05B6F3                               ; $05B78F |

CODE_05B793:
  ASL A                                     ; $05B793 |
  TAX                                       ; $05B794 |
  JSR ($B754,x)                             ; $05B795 |
  JSR CODE_05B88C                           ; $05B798 |
  BCS CODE_05B7B6                           ; $05B79B |
  LDA !s_player_y_prev                      ; $05B79D |
  STA !s_player_y                           ; $05B7A0 |
  LDA $0C8A                                 ; $05B7A3 |
  BEQ CODE_05B7AE                           ; $05B7A6 |
  INC !s_player_disable_flag                ; $05B7A8 |
  INC !s_sprite_disable_flag                ; $05B7AB |

CODE_05B7AE:
  LDA #$0020                                ; $05B7AE |\ play sound #$0020
  JSL push_sound_queue                      ; $05B7B1 |/
  RTL                                       ; $05B7B5 |

CODE_05B7B6:
  LDA !s_transform_timer                    ; $05B7B6 |
  BNE CODE_05B7D0                           ; $05B7B9 |
  LDA !s_spr_x_pixel_pos,x                  ; $05B7BB |
  STA $00                                   ; $05B7BE |
  LDA !s_spr_y_pixel_pos,x                  ; $05B7C0 |
  STA $02                                   ; $05B7C3 |
  LDA #$01E6                                ; $05B7C5 |
  JSL $03B56E                               ; $05B7C8 |
  JML $03A31E                               ; $05B7CC |

CODE_05B7D0:
  RTL                                       ; $05B7D0 |

  TYX                                       ; $05B7D1 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $05B7D2 |
  BNE CODE_05B7FB                           ; $05B7D5 |
  LDA !s_spr_x_speed_lo,x                   ; $05B7D7 |
  EOR !s_spr_x_accel_ceiling,x              ; $05B7DA |
  BMI CODE_05B859                           ; $05B7DD |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05B7DF |
  SEC                                       ; $05B7E1 |
  SBC !s_spr_x_pixel_pos,x                  ; $05B7E2 |
  CLC                                       ; $05B7E5 |
  ADC #$0004                                ; $05B7E6 |
  CMP #$0008                                ; $05B7E9 |
  BCS CODE_05B859                           ; $05B7EC |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05B7EE |
  STA !s_spr_x_pixel_pos,x                  ; $05B7F0 |
  STZ !s_spr_x_accel,x                      ; $05B7F3 |
  STZ !s_spr_x_speed_lo,x                   ; $05B7F6 |
  BRA CODE_05B81D                           ; $05B7F9 |

CODE_05B7FB:
  LDA !s_spr_y_speed_lo,x                   ; $05B7FB |
  EOR !s_spr_y_accel_ceiling,x              ; $05B7FE |
  BMI CODE_05B859                           ; $05B801 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B803 |
  SEC                                       ; $05B805 |
  SBC !s_spr_y_pixel_pos,x                  ; $05B806 |
  CLC                                       ; $05B809 |
  ADC #$0004                                ; $05B80A |
  CMP #$0008                                ; $05B80D |
  BCS CODE_05B859                           ; $05B810 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05B812 |
  STA !s_spr_y_pixel_pos,x                  ; $05B814 |
  STZ !s_spr_y_accel,x                      ; $05B817 |
  STZ !s_spr_y_speed_lo,x                   ; $05B81A |

CODE_05B81D:
  LDA $0C8A                                 ; $05B81D |
  BNE CODE_05B825                           ; $05B820 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05B822 |
  RTS                                       ; $05B824 |

CODE_05B825:
  LDA #$0020                                ; $05B825 |
  STA !s_spr_timer_2,x                      ; $05B828 |
  STZ !s_sprite_disable_flag                ; $05B82B |
  LDA !s_spr_x_pixel_pos,x                  ; $05B82E |
  STA !s_spr_x_pixel_pos                    ; $05B831 |
  LDA !s_spr_y_pixel_pos,x                  ; $05B834 |
  STA !s_spr_y_pixel_pos                    ; $05B837 |
  LDA #$FC00                                ; $05B83A |
  STA !s_spr_y_speed_lo                     ; $05B83D |
  LDA #$0018                                ; $05B840 |
  STA !s_spr_y_accel                        ; $05B843 |
  LDA #$0080                                ; $05B846 |
  STA !s_spr_y_accel_ceiling                ; $05B849 |
  LDY #$07                                  ; $05B84C |
  STY $76                                   ; $05B84E |
  LDA #$001C                                ; $05B850 |\ play sound #$001C
  JSL push_sound_queue                      ; $05B853 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B857 |

CODE_05B859:
  RTS                                       ; $05B859 |

  TYX                                       ; $05B85A |
  LDA !s_spr_timer_2,x                      ; $05B85B |
  BNE CODE_05B859                           ; $05B85E |
  LDA #$01D4                                ; $05B860 |
  JSL spawn_ambient_sprite                  ; $05B863 |
  LDA !s_spr_x_pixel_pos,x                  ; $05B867 |
  STA $70A2,y                               ; $05B86A |
  LDA !s_spr_y_pixel_pos,x                  ; $05B86D |
  SEC                                       ; $05B870 |
  SBC #$0010                                ; $05B871 |
  STA $7142,y                               ; $05B874 |
  LDA #$000B                                ; $05B877 |
  STA $7E4C,y                               ; $05B87A |
  LDA #$0006                                ; $05B87D |
  STA $7782,y                               ; $05B880 |
  PLA                                       ; $05B883 |
  JML $03A31E                               ; $05B884 |

  dw $FC00, $0400                           ; $05B888 |

CODE_05B88C:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05B88C |
  BEQ CODE_05B896                           ; $05B88E |
  JSL $03D127                               ; $05B890 |
  SEC                                       ; $05B894 |

CODE_05B895:
  RTS                                       ; $05B895 |

CODE_05B896:
  STZ !s_spr_gsu_morph_1_lo,x               ; $05B896 |
  LDA #$0E00                                ; $05B899 |
  STA !gsu_r0                               ; $05B89C |
  LDA #$1000                                ; $05B89F |
  STA !gsu_r1                               ; $05B8A2 |
  STZ !gsu_r3                               ; $05B8A5 |
  LDA #$0100                                ; $05B8A8 |
  STA !gsu_r6                               ; $05B8AB |
  STA !gsu_r9                               ; $05B8AE |
  LDA !s_player_hitbox_half_width           ; $05B8B1 |
  STA !gsu_r7                               ; $05B8B4 |
  LDA !s_player_hitbox_half_height          ; $05B8B7 |
  STA !gsu_r8                               ; $05B8BA |
  LDX #$0B                                  ; $05B8BD |
  LDA #$8578                                ; $05B8BF |
  JSL r_gsu_init_1                          ; $05B8C2 | GSU init
  LDX $12                                   ; $05B8C6 |
  LDA !s_spr_x_pixel_pos,x                  ; $05B8C8 |
  CLC                                       ; $05B8CB |
  ADC #$0008                                ; $05B8CC |
  SEC                                       ; $05B8CF |
  SBC !s_player_center_x                    ; $05B8D0 |
  STA $0C                                   ; $05B8D3 |
  CLC                                       ; $05B8D5 |
  ADC $603C                                 ; $05B8D6 |
  CMP $6038                                 ; $05B8D9 |
  BCS CODE_05B895                           ; $05B8DC |
  LDA #$FFF0                                ; $05B8DE |
  CLC                                       ; $05B8E1 |
  ADC $6036                                 ; $05B8E2 |
  SEC                                       ; $05B8E5 |
  SBC !gsu_r3                               ; $05B8E6 |
  CLC                                       ; $05B8E9 |
  ADC !s_spr_y_pixel_pos,x                  ; $05B8EA |
  SEC                                       ; $05B8ED |
  SBC !s_player_center_y                    ; $05B8EE |
  SEC                                       ; $05B8F1 |
  SBC !s_car_wheel_ext_height               ; $05B8F2 |
  STA $0E                                   ; $05B8F5 |
  CLC                                       ; $05B8F7 |
  ADC $603E                                 ; $05B8F8 |
  CMP $603A                                 ; $05B8FB |
  BCS CODE_05B960                           ; $05B8FE |
  LDA $603E                                 ; $05B900 |
  SEC                                       ; $05B903 |
  SBC #$0010                                ; $05B904 |
  STA $00                                   ; $05B907 |
  LDA $0E                                   ; $05B909 |
  BPL CODE_05B91D                           ; $05B90B |
  PHA                                       ; $05B90D |
  LDA $00                                   ; $05B90E |
  EOR #$FFFF                                ; $05B910 |
  INC A                                     ; $05B913 |
  STA $00                                   ; $05B914 |
  PLA                                       ; $05B916 |
  CMP $00                                   ; $05B917 |
  BMI CODE_05B962                           ; $05B919 |
  BRA CODE_05B921                           ; $05B91B |

CODE_05B91D:
  CMP $00                                   ; $05B91D |
  BPL CODE_05B962                           ; $05B91F |

CODE_05B921:
  LDA !s_player_x_speed_prev                ; $05B921 |
  EOR $0C                                   ; $05B924 |
  BMI CODE_05B960                           ; $05B926 |
  STZ $00                                   ; $05B928 |
  LDA $603C                                 ; $05B92A |
  LDY $0D                                   ; $05B92D |
  BMI CODE_05B939                           ; $05B92F |
  INC $00                                   ; $05B931 |
  INC $00                                   ; $05B933 |
  EOR #$FFFF                                ; $05B935 |
  INC A                                     ; $05B938 |

CODE_05B939:
  CLC                                       ; $05B939 |
  ADC $0C                                   ; $05B93A |
  CLC                                       ; $05B93C |
  ADC !s_player_x                           ; $05B93D |
  STA !s_player_x                           ; $05B940 |
  LDY $00                                   ; $05B943 |
  LDA $B888,y                               ; $05B945 |
  STA !s_spr_x_speed_lo,x                   ; $05B948 |
  EOR #$FFFF                                ; $05B94B |
  INC A                                     ; $05B94E |
  STA !s_spr_x_accel_ceiling,x              ; $05B94F |
  LDA #$0040                                ; $05B952 |
  STA !s_spr_x_accel,x                      ; $05B955 |
  STZ !s_player_x_speed_prev                ; $05B958 |
  STZ !s_player_x_speed                     ; $05B95B |
  BRA CODE_05B998                           ; $05B95E |

CODE_05B960:
  SEC                                       ; $05B960 |
  RTS                                       ; $05B961 |

CODE_05B962:
  STZ $00                                   ; $05B962 |
  LDA $603E                                 ; $05B964 |
  LDY $0F                                   ; $05B967 |
  BMI CODE_05B973                           ; $05B969 |
  INC $00                                   ; $05B96B |
  INC $00                                   ; $05B96D |
  EOR #$FFFF                                ; $05B96F |
  INC A                                     ; $05B972 |

CODE_05B973:
  CLC                                       ; $05B973 |
  ADC $0E                                   ; $05B974 |
  CLC                                       ; $05B976 |
  ADC !s_player_y                           ; $05B977 |
  STA !s_player_y                           ; $05B97A |
  LDY $00                                   ; $05B97D |
  LDA $B888,y                               ; $05B97F |
  STA !s_spr_y_speed_lo,x                   ; $05B982 |
  EOR #$FFFF                                ; $05B985 |
  INC A                                     ; $05B988 |
  STA !s_spr_y_accel_ceiling,x              ; $05B989 |
  LDA #$0040                                ; $05B98C |
  STA !s_spr_y_accel,x                      ; $05B98F |
  STZ !s_player_y_speed                     ; $05B992 |
  INC !s_spr_gsu_morph_1_lo,x               ; $05B995 |

CODE_05B998:
  STZ !s_player_flutter_state               ; $05B998 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05B99B |
  CLC                                       ; $05B99D |
  RTS                                       ; $05B99E |

init_eggo_dil:
  LDY $0EDF                                 ; $05B99F |
  BEQ CODE_05B9A8                           ; $05B9A2 |
  JML $03A31E                               ; $05B9A4 |

CODE_05B9A8:
  INC $0EDF                                 ; $05B9A8 |
  LDY #$08                                  ; $05B9AB |

CODE_05B9AD:
  LDA $0EE1,y                               ; $05B9AD |
  BMI CODE_05B9C3                           ; $05B9B0 |
  BEQ CODE_05B9BD                           ; $05B9B2 |
  PHY                                       ; $05B9B4 |
  TAY                                       ; $05B9B5 |
  LDA #$FFFF                                ; $05B9B6 |
  STA !s_spr_wildcard_2_lo,y                ; $05B9B9 |
  PLY                                       ; $05B9BC |

CODE_05B9BD:
  LDA #$FFFF                                ; $05B9BD |
  STA $0EE1,y                               ; $05B9C0 |

CODE_05B9C3:
  DEY                                       ; $05B9C3 |
  DEY                                       ; $05B9C4 |
  BPL CODE_05B9AD                           ; $05B9C5 |
  RTL                                       ; $05B9C7 |

main_eggo_dil:
  STZ !s_spr_facing_dir,x                   ; $05B9C8 |
  JSL $03AF23                               ; $05B9CB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05B9CF |
  BNE CODE_05B9ED                           ; $05B9D1 |
  LDA #$00EF                                ; $05B9D3 |
  JSL spawn_sprite_init                     ; $05B9D6 |
  BCC CODE_05B9ED                           ; $05B9DA |
  LDA !s_spr_x_pixel_pos,x                  ; $05B9DC |
  STA !s_spr_x_pixel_pos,y                  ; $05B9DF |
  LDA !s_spr_y_pixel_pos,x                  ; $05B9E2 |
  STA !s_spr_y_pixel_pos,y                  ; $05B9E5 |
  STX $0EDD                                 ; $05B9E8 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05B9EB |

CODE_05B9ED:
  RTL                                       ; $05B9ED |

init_eggo_dil_face:
  JSR CODE_05BBD5                           ; $05B9EE |
  RTL                                       ; $05B9F1 |

  dw $BC14, $BCBE, $BCE8, $BD3E, $BD3E      ; $05B9F2 |

main_eggo_dil_face:
  STZ !s_spr_facing_dir,x                   ; $05B9FC |
  JSR CODE_05BA36                           ; $05B9FF |
  JSR CODE_05BB09                           ; $05BA02 |
  JSL $03AF23                               ; $05BA05 |
  LDY $0EDF                                 ; $05BA09 |
  BPL CODE_05BA1E                           ; $05BA0C |
  LDX $0EDD                                 ; $05BA0E |
  JSL $03A31E                               ; $05BA11 |
  LDX $12                                   ; $05BA15 |
  STZ $0EDF                                 ; $05BA17 |
  JML $03A31E                               ; $05BA1A |

CODE_05BA1E:
  JSL $03A2C7                               ; $05BA1E |
  BCC CODE_05BA2A                           ; $05BA22 |
  LDY #$FF                                  ; $05BA24 |
  STY $0EDF                                 ; $05BA26 |
  RTL                                       ; $05BA29 |

CODE_05BA2A:
  TXY                                       ; $05BA2A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05BA2B |
  ASL A                                     ; $05BA2D |
  TAX                                       ; $05BA2E |
  JSR ($B9F2,x)                             ; $05BA2F |
  JSR CODE_05BBD5                           ; $05BA32 |
  RTL                                       ; $05BA35 |

CODE_05BA36:
  LDY !s_spr_dyntile_index,x                ; $05BA36 |
  BPL CODE_05BA52                           ; $05BA39 |
  REP #$10                                  ; $05BA3B |
  LDY !s_spr_oam_pointer,x                  ; $05BA3D |
  LDA #$8000                                ; $05BA40 |
  STA $6000,y                               ; $05BA43 |
  STA $6008,y                               ; $05BA46 |
  STA $6010,y                               ; $05BA49 |
  STA $6018,y                               ; $05BA4C |
  SEP #$10                                  ; $05BA4F |
  RTS                                       ; $05BA51 |

CODE_05BA52:
  JSL $03AA52                               ; $05BA52 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05BA56 |
  SEC                                       ; $05BA59 |
  SBC #$0080                                ; $05BA5A |
  AND #$01FE                                ; $05BA5D |
  STA !gsu_r1                               ; $05BA60 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05BA63 |
  PHA                                       ; $05BA66 |
  STA !gsu_r2                               ; $05BA67 |
  STA !gsu_r3                               ; $05BA6A |
  LDA #$0004                                ; $05BA6D |
  STA !gsu_r5                               ; $05BA70 |
  LDX #$0B                                  ; $05BA73 |
  LDA #$86FA                                ; $05BA75 |
  JSL r_gsu_init_1                          ; $05BA78 | GSU init
  LDA !gsu_r0                               ; $05BA7C |
  STA $00                                   ; $05BA7F |
  LDA !gsu_r1                               ; $05BA81 |
  STA $04                                   ; $05BA84 |
  PLA                                       ; $05BA86 |
  STA !gsu_r6                               ; $05BA87 |
  LDA #$000A                                ; $05BA8A |
  STA !gsu_r0                               ; $05BA8D |
  LDX #$0B                                  ; $05BA90 |
  LDA #$86B6                                ; $05BA92 |
  JSL r_gsu_init_1                          ; $05BA95 | GSU init
  LDX $12                                   ; $05BA99 |
  REP #$10                                  ; $05BA9B |
  LDY !s_spr_oam_pointer,x                  ; $05BA9D |
  LDA !s_spr_x_hitbox_center,x              ; $05BAA0 |
  SEC                                       ; $05BAA3 |
  SBC $00                                   ; $05BAA4 |
  SEC                                       ; $05BAA6 |
  SBC !s_bg1_cam_x                          ; $05BAA7 |
  STA $00                                   ; $05BAAA |
  SEC                                       ; $05BAAC |
  SBC #$0010                                ; $05BAAD |
  STA $02                                   ; $05BAB0 |
  LDA !s_spr_y_pixel_pos,x                  ; $05BAB2 |
  SEC                                       ; $05BAB5 |
  SBC !gsu_r0                               ; $05BAB6 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05BAB9 |
  SEC                                       ; $05BABB |
  SBC $04                                   ; $05BABC |
  SEC                                       ; $05BABE |
  SBC !s_bg1_cam_y                          ; $05BABF |
  STA $04                                   ; $05BAC2 |
  LDA $02                                   ; $05BAC4 |
  STA $6000,y                               ; $05BAC6 |
  STA $6010,y                               ; $05BAC9 |
  LDA $00                                   ; $05BACC |
  STA $6008,y                               ; $05BACE |
  STA $6018,y                               ; $05BAD1 |
  LDA $04                                   ; $05BAD4 |
  STA $6012,y                               ; $05BAD6 |
  STA $601A,y                               ; $05BAD9 |
  SEC                                       ; $05BADC |
  SBC #$0010                                ; $05BADD |
  STA $6002,y                               ; $05BAE0 |
  STA $600A,y                               ; $05BAE3 |
  LDY #$0000                                ; $05BAE6 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05BAE9 |
  CLC                                       ; $05BAEC |
  ADC #$0010                                ; $05BAED |
  AND #$01FE                                ; $05BAF0 |
  CMP #$0020                                ; $05BAF3 |
  BCC CODE_05BAFF                           ; $05BAF6 |
  INY                                       ; $05BAF8 |
  CMP #$0110                                ; $05BAF9 |
  BPL CODE_05BAFF                           ; $05BAFC |
  INY                                       ; $05BAFE |

CODE_05BAFF:
  SEP #$10                                  ; $05BAFF |
  TYA                                       ; $05BB01 |
  LDY $0EDD                                 ; $05BB02 |
  STA !s_spr_anim_frame,y                   ; $05BB05 |

CODE_05BB08:
  RTS                                       ; $05BB08 |

CODE_05BB09:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05BB09 |
  BEQ CODE_05BB08                           ; $05BB0B |
  LDA !s_cam_y_small_shaking_timer          ; $05BB0D |
  BEQ CODE_05BB75                           ; $05BB10 |
  LDA $0EEB                                 ; $05BB12 |
  STA $00                                   ; $05BB15 |
  LDY #$08                                  ; $05BB17 |

CODE_05BB19:
  LDX $0EE1,y                               ; $05BB19 |
  BMI CODE_05BB52                           ; $05BB1C |
  LDA $00                                   ; $05BB1E |
  STA !gsu_r1                               ; $05BB20 |
  LDA #$0200                                ; $05BB23 |
  STA !gsu_r6                               ; $05BB26 |
  PHY                                       ; $05BB29 |
  PHX                                       ; $05BB2A |
  LDX #$0B                                  ; $05BB2B |
  LDA #$8595                                ; $05BB2D |
  JSL r_gsu_init_1                          ; $05BB30 | GSU init
  PLX                                       ; $05BB34 |
  PLY                                       ; $05BB35 |
  LDA !gsu_r1                               ; $05BB36 |
  STA !s_spr_x_speed_lo,x                   ; $05BB39 |
  LDA !gsu_r0                               ; $05BB3C |
  EOR #$FFFF                                ; $05BB3F |
  INC A                                     ; $05BB42 |
  STA !s_spr_y_speed_lo,x                   ; $05BB43 |
  LDA #$0040                                ; $05BB46 |
  STA !s_spr_y_accel,x                      ; $05BB49 |
  LDA #$0008                                ; $05BB4C |
  STA !s_spr_x_accel,x                      ; $05BB4F |

CODE_05BB52:
  LDA $00                                   ; $05BB52 |
  CLC                                       ; $05BB54 |
  ADC #$0066                                ; $05BB55 |
  AND #$01FE                                ; $05BB58 |
  STA $00                                   ; $05BB5B |
  DEY                                       ; $05BB5D |
  DEY                                       ; $05BB5E |
  BPL CODE_05BB19                           ; $05BB5F |
  LDX $12                                   ; $05BB61 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05BB63 |
  LDA #$0020                                ; $05BB65 |
  STA !s_spr_timer_1,x                      ; $05BB68 |
  LDA #$0008                                ; $05BB6B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05BB6E |
  LDY #$04                                  ; $05BB70 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05BB72 |
  RTS                                       ; $05BB74 |

CODE_05BB75:
  LDA !s_spr_x_hitbox_center,x              ; $05BB75 |
  SEC                                       ; $05BB78 |
  SBC #$0008                                ; $05BB79 |
  STA $00                                   ; $05BB7C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05BB7E |
  SEC                                       ; $05BB80 |
  SBC #$0008                                ; $05BB81 |
  STA $02                                   ; $05BB84 |
  LDA $0EEB                                 ; $05BB86 |
  STA $06                                   ; $05BB89 |
  LDA !s_spr_wildcard_1_lo,x                ; $05BB8B |
  STA !gsu_r6                               ; $05BB8E |
  LDY #$08                                  ; $05BB91 |

CODE_05BB93:
  LDX $0EE1,y                               ; $05BB93 |
  BMI CODE_05BBC3                           ; $05BB96 |
  LDA $06                                   ; $05BB98 |
  SEC                                       ; $05BB9A |
  SBC #$0080                                ; $05BB9B |
  AND #$01FE                                ; $05BB9E |
  STA !gsu_r1                               ; $05BBA1 |
  PHX                                       ; $05BBA4 |
  PHY                                       ; $05BBA5 |
  LDX #$0B                                  ; $05BBA6 |
  LDA #$8595                                ; $05BBA8 |
  JSL r_gsu_init_1                          ; $05BBAB | GSU init
  PLY                                       ; $05BBAF |
  PLX                                       ; $05BBB0 |
  LDA $00                                   ; $05BBB1 |
  SEC                                       ; $05BBB3 |
  SBC !gsu_r0                               ; $05BBB4 |
  STA !s_spr_x_pixel_pos,x                  ; $05BBB7 |
  LDA $02                                   ; $05BBBA |
  SEC                                       ; $05BBBC |
  SBC !gsu_r1                               ; $05BBBD |
  STA !s_spr_y_pixel_pos,x                  ; $05BBC0 |

CODE_05BBC3:
  LDA $06                                   ; $05BBC3 |
  CLC                                       ; $05BBC5 |
  ADC #$0066                                ; $05BBC6 |
  AND #$01FE                                ; $05BBC9 |
  STA $06                                   ; $05BBCC |
  DEY                                       ; $05BBCE |
  DEY                                       ; $05BBCF |
  BPL CODE_05BB93                           ; $05BBD0 |
  LDX $12                                   ; $05BBD2 |

CODE_05BBD4:
  RTS                                       ; $05BBD4 |

CODE_05BBD5:
  LDY !s_spr_dyntile_index,x                ; $05BBD5 |
  BMI CODE_05BBD4                           ; $05BBD8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05BBDA |
  STA !gsu_r6                               ; $05BBDD |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05BBE0 |
  LSR A                                     ; $05BBE3 |
  STA !gsu_r5                               ; $05BBE4 |
  LDA #$0060                                ; $05BBE7 |
  STA !gsu_r12                              ; $05BBEA |
  LDA #$0055                                ; $05BBED |
  STA !gsu_r13                              ; $05BBF0 |
  LDY !s_spr_dyntile_index,x                ; $05BBF3 |
  TYX                                       ; $05BBF6 |
  LDA $03A9CE,x                             ; $05BBF7 |
  STA !gsu_r3                               ; $05BBFB |
  LDA $03A9EE,x                             ; $05BBFE |
  STA !gsu_r2                               ; $05BC02 |
  LDX #$08                                  ; $05BC05 |
  LDA #$8205                                ; $05BC07 |
  JSL r_gsu_init_1                          ; $05BC0A | GSU init
  LDX $12                                   ; $05BC0E |
  INC $0CF9                                 ; $05BC10 |

CODE_05BC13:
  RTS                                       ; $05BC13 |

  TYX                                       ; $05BC14 |
  LDA !s_spr_timer_1,x                      ; $05BC15 |
  BNE CODE_05BC13                           ; $05BC18 |
  LDY !s_spr_wildcard_2_lo,x                ; $05BC1A |
  BNE CODE_05BC2D                           ; $05BC1D |
  LDY #$08                                  ; $05BC1F |

CODE_05BC21:
  LDA $0EE1,y                               ; $05BC21 |
  BPL CODE_05BC13                           ; $05BC24 |
  DEY                                       ; $05BC26 |
  DEY                                       ; $05BC27 |
  BPL CODE_05BC21                           ; $05BC28 |
  INC !s_spr_wildcard_2_lo,x                ; $05BC2A |

CODE_05BC2D:
  LDA !s_spr_dyntile_index,x                ; $05BC2D |
  BPL CODE_05BC38                           ; $05BC30 |
  JSL $03AD74                               ; $05BC32 |
  BCC CODE_05BC13                           ; $05BC36 |

CODE_05BC38:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05BC38 |
  CLC                                       ; $05BC3B |
  ADC #$0010                                ; $05BC3C |
  CMP #$00E0                                ; $05BC3F |
  BPL CODE_05BC48                           ; $05BC42 |

CODE_05BC44:
  STA !s_spr_gsu_morph_1_lo,x               ; $05BC44 |
  RTS                                       ; $05BC47 |

CODE_05BC48:
  CMP #$0100                                ; $05BC48 |
  BMI CODE_05BC5A                           ; $05BC4B |
  LDA #$0100                                ; $05BC4D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05BC50 |
  BEQ CODE_05BC63                           ; $05BC52 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05BC54 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05BC57 |
  RTS                                       ; $05BC59 |

CODE_05BC5A:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05BC5A |
  BEQ CODE_05BC63                           ; $05BC5C |
  INC !s_spr_wildcard_1_lo,x                ; $05BC5E |
  BRA CODE_05BC44                           ; $05BC61 |

CODE_05BC63:
  STA !s_spr_gsu_morph_1_lo,x               ; $05BC63 |
  LDA !s_spr_x_hitbox_center,x              ; $05BC66 |
  SEC                                       ; $05BC69 |
  SBC #$0008                                ; $05BC6A |
  STA $02                                   ; $05BC6D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05BC6F |
  SEC                                       ; $05BC71 |
  SBC #$0008                                ; $05BC72 |
  STA $04                                   ; $05BC75 |
  LDA #$0005                                ; $05BC77 |
  STA $00                                   ; $05BC7A |

CODE_05BC7C:
  LDA #$00F0                                ; $05BC7C |
  JSL spawn_sprite_active                   ; $05BC7F |
  BCC CODE_05BCA2                           ; $05BC83 |
  LDA $02                                   ; $05BC85 |
  STA !s_spr_x_pixel_pos,y                  ; $05BC87 |
  LDA $04                                   ; $05BC8A |
  STA !s_spr_y_pixel_pos,y                  ; $05BC8C |
  TYA                                       ; $05BC8F |
  PHA                                       ; $05BC90 |
  LDA $00                                   ; $05BC91 |
  ASL A                                     ; $05BC93 |
  STA !s_spr_wildcard_2_lo,y                ; $05BC94 |
  TAY                                       ; $05BC97 |
  PLA                                       ; $05BC98 |
  STA $0EDF,y                               ; $05BC99 |
  DEC $00                                   ; $05BC9C |
  BNE CODE_05BC7C                           ; $05BC9E |
  BRA CODE_05BCB2                           ; $05BCA0 |

CODE_05BCA2:
  LDA $00                                   ; $05BCA2 |
  BEQ CODE_05BCB2                           ; $05BCA4 |
  ASL A                                     ; $05BCA6 |
  TAY                                       ; $05BCA7 |
  LDA #$FFFF                                ; $05BCA8 |
  STA $0EDF,y                               ; $05BCAB |
  DEC $00                                   ; $05BCAE |
  BRA CODE_05BCA2                           ; $05BCB0 |

CODE_05BCB2:
  LDA #$0003                                ; $05BCB2 |
  STA !s_spr_wildcard_1_lo,x                ; $05BCB5 |
  STZ $0EEB                                 ; $05BCB8 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05BCBB |
  RTS                                       ; $05BCBD |

  TYX                                       ; $05BCBE |
  LDA !s_spr_wildcard_1_lo,x                ; $05BCBF |
  INC A                                     ; $05BCC2 |
  CMP #$0014                                ; $05BCC3 |
  BNE CODE_05BCE4                           ; $05BCC6 |
  LDA $10                                   ; $05BCC8 |
  AND #$0003                                ; $05BCCA |
  CLC                                       ; $05BCCD |
  ADC #$0005                                ; $05BCCE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05BCD1 |
  LDA #$0020                                ; $05BCD3 |
  STA !s_spr_timer_1,x                      ; $05BCD6 |
  LDA #$0030                                ; $05BCD9 |
  STA !s_spr_timer_2,x                      ; $05BCDC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05BCDF |
  LDA #$0010                                ; $05BCE1 |

CODE_05BCE4:
  STA !s_spr_wildcard_1_lo,x                ; $05BCE4 |
  RTS                                       ; $05BCE7 |

  TYX                                       ; $05BCE8 |
  LDA !s_spr_timer_1,x                      ; $05BCE9 |
  BNE CODE_05BD2F                           ; $05BCEC |
  LDA !s_spr_timer_2,x                      ; $05BCEE |
  BNE CODE_05BD0C                           ; $05BCF1 |
  LDA #$0020                                ; $05BCF3 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05BCF6 |
  BPL CODE_05BD06                           ; $05BCF8 |
  LDA #$0008                                ; $05BCFA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05BCFD |
  STA !s_spr_timer_1,x                      ; $05BCFF |
  INC !s_spr_wildcard_5_lo,x                ; $05BD02 |
  RTS                                       ; $05BD05 |

CODE_05BD06:
  BNE CODE_05BD09                           ; $05BD06 |
  LSR A                                     ; $05BD08 |

CODE_05BD09:
  STA !s_spr_timer_2,x                      ; $05BD09 |

CODE_05BD0C:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05BD0C |
  AND #$0001                                ; $05BD0E |
  ASL A                                     ; $05BD11 |
  ASL A                                     ; $05BD12 |
  ASL A                                     ; $05BD13 |
  SEC                                       ; $05BD14 |
  SBC #$0004                                ; $05BD15 |
  CLC                                       ; $05BD18 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $05BD19 |
  AND #$01FE                                ; $05BD1C |
  STA !s_spr_gsu_morph_2_lo,x               ; $05BD1F |
  LDA $0EEB                                 ; $05BD22 |
  CLC                                       ; $05BD25 |
  ADC #$0004                                ; $05BD26 |
  AND #$01FE                                ; $05BD29 |
  STA $0EEB                                 ; $05BD2C |

CODE_05BD2F:
  RTS                                       ; $05BD2F |

  dw $FFF0, $0010                           ; $05BD30 |

  dw $0080, $00E0, $00A0, $00F0, $00C0      ; $05BD34 |

  TYX                                       ; $05BD3E |
  LDA !s_spr_timer_1,x                      ; $05BD3F |
  BNE CODE_05BD2F                           ; $05BD42 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05BD44 |
  AND #$0002                                ; $05BD46 |
  PHP                                       ; $05BD49 |
  TAY                                       ; $05BD4A |
  LDA $BD30,y                               ; $05BD4B |
  CLC                                       ; $05BD4E |
  ADC !s_spr_gsu_morph_1_lo,x               ; $05BD4F |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05BD52 |
  PLP                                       ; $05BD54 |
  BNE CODE_05BD5E                           ; $05BD55 |
  CMP $BD34,y                               ; $05BD57 |
  BPL CODE_05BD6C                           ; $05BD5A |
  BRA CODE_05BD63                           ; $05BD5C |

CODE_05BD5E:
  CMP $BD34,y                               ; $05BD5E |
  BMI CODE_05BD6C                           ; $05BD61 |

CODE_05BD63:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05BD63 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05BD65 |
  BMI CODE_05BD70                           ; $05BD67 |
  LDA $BD34,y                               ; $05BD69 |

CODE_05BD6C:
  STA !s_spr_gsu_morph_1_lo,x               ; $05BD6C |
  RTS                                       ; $05BD6F |

CODE_05BD70:
  LDA #$01E8                                ; $05BD70 |
  JSL spawn_ambient_sprite                  ; $05BD73 |
  LDA !s_spr_x_hitbox_center,x              ; $05BD77 |
  SEC                                       ; $05BD7A |
  SBC #$0008                                ; $05BD7B |
  STA $70A2,y                               ; $05BD7E |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05BD81 |
  SEC                                       ; $05BD83 |
  SBC #$0008                                ; $05BD84 |
  STA $7142,y                               ; $05BD87 |
  LDA #$0003                                ; $05BD8A |
  STA $73C2,y                               ; $05BD8D |
  INC A                                     ; $05BD90 |
  STA $7782,y                               ; $05BD91 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05BD94 |
  CPY #$04                                  ; $05BD96 |
  BEQ CODE_05BDEA                           ; $05BD98 |
  LDA $0EEB                                 ; $05BD9A |
  STA $06                                   ; $05BD9D |
  LDA #$0200                                ; $05BD9F |
  STA !gsu_r6                               ; $05BDA2 |
  LDY #$08                                  ; $05BDA5 |

CODE_05BDA7:
  LDX $0EE1,y                               ; $05BDA7 |
  BMI CODE_05BDD9                           ; $05BDAA |
  LDA $06                                   ; $05BDAC |
  SEC                                       ; $05BDAE |
  SBC #$0080                                ; $05BDAF |
  AND #$01FE                                ; $05BDB2 |
  STA !gsu_r1                               ; $05BDB5 |
  PHY                                       ; $05BDB8 |
  PHX                                       ; $05BDB9 |
  LDX #$0B                                  ; $05BDBA |
  LDA #$8595                                ; $05BDBC |
  JSL r_gsu_init_1                          ; $05BDBF | GSU init
  PLX                                       ; $05BDC3 |
  PLY                                       ; $05BDC4 |
  LDA !gsu_r0                               ; $05BDC5 |
  EOR #$FFFF                                ; $05BDC8 |
  INC A                                     ; $05BDCB |
  STA !s_spr_x_speed_lo,x                   ; $05BDCC |
  LDA !gsu_r1                               ; $05BDCF |
  EOR #$FFFF                                ; $05BDD2 |
  INC A                                     ; $05BDD5 |
  STA !s_spr_y_speed_lo,x                   ; $05BDD6 |

CODE_05BDD9:
  LDA $06                                   ; $05BDD9 |
  CLC                                       ; $05BDDB |
  ADC #$0066                                ; $05BDDC |
  AND #$01FE                                ; $05BDDF |
  STA $06                                   ; $05BDE2 |
  DEY                                       ; $05BDE4 |
  DEY                                       ; $05BDE5 |
  BPL CODE_05BDA7                           ; $05BDE6 |
  LDX $12                                   ; $05BDE8 |

CODE_05BDEA:
  LDA #$00C0                                ; $05BDEA |
  STA !s_spr_timer_1,x                      ; $05BDED |
  STZ !s_spr_gsu_morph_1_lo,x               ; $05BDF0 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05BDF3 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05BDF6 |
  STZ !s_spr_wildcard_2_lo,x                ; $05BDF8 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05BDFB |
  JSL $03AEFD                               ; $05BDFD |
  RTS                                       ; $05BE01 |

init_eggo_dil_petal:
  RTL                                       ; $05BE02 |

main_eggo_dil_petal:
  STZ !s_spr_facing_dir,x                   ; $05BE03 |
  LDY !s_spr_state,x                        ; $05BE06 |
  CPY #$10                                  ; $05BE09 |
  BEQ CODE_05BE12                           ; $05BE0B |
  JSR CODE_05BE5A                           ; $05BE0D |
  BRA CODE_05BE24                           ; $05BE10 |

CODE_05BE12:
  LDA !s_spr_collision_state,x              ; $05BE12 |
  BEQ CODE_05BE24                           ; $05BE15 |
  JSL $03A2C7                               ; $05BE17 |
  BCC CODE_05BE24                           ; $05BE1B |
  JSR CODE_05BE5A                           ; $05BE1D |
  JML $03A31E                               ; $05BE20 |

CODE_05BE24:
  JSL $03AF23                               ; $05BE24 |
  LDY $0EDF                                 ; $05BE28 |
  BMI CODE_05BE3A                           ; $05BE2B |
  JSL $03A2C7                               ; $05BE2D |
  BCC CODE_05BE4B                           ; $05BE31 |
  JSR CODE_05BE5A                           ; $05BE33 |
  JML $03A31E                               ; $05BE36 |

CODE_05BE3A:
  LDA !s_spr_x_speed_lo,x                   ; $05BE3A |
  ORA !s_spr_y_speed_lo,x                   ; $05BE3D |
  BNE CODE_05BE4B                           ; $05BE40 |
  JSR CODE_05BE5A                           ; $05BE42 |
  LDA #$0040                                ; $05BE45 |
  STA !s_spr_y_accel,x                      ; $05BE48 |

CODE_05BE4B:
  LDY !s_spr_collision_id,x                 ; $05BE4B |
  DEY                                       ; $05BE4E |
  BMI CODE_05BE55                           ; $05BE4F |
  JML $0DC0F0                               ; $05BE51 |

CODE_05BE55:
  JSL $03A5B7                               ; $05BE55 |
  RTL                                       ; $05BE59 |

CODE_05BE5A:
  LDY !s_spr_wildcard_2_lo,x                ; $05BE5A |
  BMI CODE_05BE68                           ; $05BE5D |
  LDA #$FFFF                                ; $05BE5F |
  STA $0EDF,y                               ; $05BE62 |
  STA !s_spr_wildcard_2_lo,x                ; $05BE65 |

CODE_05BE68:
  RTS                                       ; $05BE68 |

init_flamer_guy:
  LDA !s_spr_wildcard_1_lo,x                ; $05BE69 |
  CMP #$FFFF                                ; $05BE6C |
  BNE CODE_05BE83                           ; $05BE6F |
  CMP !s_spr_wildcard_2_lo,x                ; $05BE71 |
  BNE CODE_05BE83                           ; $05BE74 |
  JSL $03AD74                               ; $05BE76 |
  BCS CODE_05BE89                           ; $05BE7A |
  LDA #$0002                                ; $05BE7C |
  STA !s_spr_state,x                        ; $05BE7F |
  RTL                                       ; $05BE82 |

CODE_05BE83:
  JSL $03AE60                               ; $05BE83 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05BE87 |

CODE_05BE89:
  LDA #$0100                                ; $05BE89 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05BE8C |
  LDY !s_spr_facing_dir,x                   ; $05BE8F |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05BE92 |
  STZ !s_spr_wildcard_1_lo,x                ; $05BE94 |
  STZ !s_spr_wildcard_2_lo,x                ; $05BE97 |
  LDA #$0005                                ; $05BE9A |
  STA !s_spr_draw_priority,x                ; $05BE9D |
  JSR CODE_05C16C                           ; $05BEA0 |
  RTL                                       ; $05BEA3 |

  dw $C1C4, $C202, $C233, $C2D3             ; $05BEA4 |
  dw $C3A9, $C3DD, $C450                    ; $05BEAC |

main_flamer_guy:
  LDA !s_spr_timer_frozen,x                 ; $05BEB2 |
  BEQ CODE_05BEDA                           ; $05BEB5 |
  JSR CODE_05BF99                           ; $05BEB7 |
  JSR CODE_05C06E                           ; $05BEBA |
  LDA !s_spr_timer_frozen,x                 ; $05BEBD |
  PHA                                       ; $05BEC0 |
  TXY                                       ; $05BEC1 |
  LDA #$001E                                ; $05BEC2 |
  JSL $03A377                               ; $05BEC5 |
  PLA                                       ; $05BEC9 |
  STA !s_spr_timer_frozen,x                 ; $05BECA |
  LDA #$0022                                ; $05BECD |
  STA !s_spr_oam_yxppccct,x                 ; $05BED0 |
  INC A                                     ; $05BED3 |
  STA !s_spr_wildcard_2_lo,x                ; $05BED4 |
  JMP CODE_05BF69                           ; $05BED7 |

CODE_05BEDA:
  LDY !s_spr_state,x                        ; $05BEDA |
  CPY #$08                                  ; $05BEDD |
  BNE CODE_05BF00                           ; $05BEDF |
  LDA #$FFFF                                ; $05BEE1 |
  STA !s_spr_wildcard_1_lo,x                ; $05BEE4 |
  STA !s_spr_wildcard_2_lo,x                ; $05BEE7 |
  LDA #$0100                                ; $05BEEA |
  STA !s_spr_gsu_morph_1_lo,x               ; $05BEED |
  LDY !s_spr_draw_priority,x                ; $05BEF0 |
  BMI CODE_05BF69                           ; $05BEF3 |

CODE_05BEF5:
  JSR CODE_05BF99                           ; $05BEF5 |
  JSR CODE_05C06E                           ; $05BEF8 |
  JSR CODE_05C16C                           ; $05BEFB |
  BRA CODE_05BF69                           ; $05BEFE |

CODE_05BF00:
  CPY #$10                                  ; $05BF00 |
  BNE CODE_05BEF5                           ; $05BF02 |
  LDY !s_spr_collision_state,x              ; $05BF04 |
  BEQ CODE_05BF63                           ; $05BF07 |
  LDA #$0011                                ; $05BF09 |
  STA !s_spr_anim_frame,x                   ; $05BF0C |
  LDA !s_spr_wildcard_6_hi_dp,x             ; $05BF0F |
  AND #$00FF                                ; $05BF11 |
  CMP !s_spr_facing_dir,x                   ; $05BF14 |
  PHP                                       ; $05BF17 |
  BEQ CODE_05BF2C                           ; $05BF18 |
  LDY !s_spr_facing_dir,x                   ; $05BF1A |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05BF1D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05BF1F |
  EOR #$FFFF                                ; $05BF22 |
  INC A                                     ; $05BF25 |
  AND #$01FE                                ; $05BF26 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05BF29 |

CODE_05BF2C:
  LDA !s_spr_x_speed_lo,x                   ; $05BF2C |
  BNE CODE_05BF4F                           ; $05BF2F |
  LDA !s_spr_y_speed_lo,x                   ; $05BF31 |
  CLC                                       ; $05BF34 |
  ADC #$0100                                ; $05BF35 |
  CMP #$0200                                ; $05BF38 |
  BCS CODE_05BF4F                           ; $05BF3B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05BF3D |
  SEC                                       ; $05BF40 |
  SBC #$0020                                ; $05BF41 |
  CMP #$0060                                ; $05BF44 |
  BPL CODE_05BF4C                           ; $05BF47 |
  LDA #$0060                                ; $05BF49 |

CODE_05BF4C:
  STA !s_spr_gsu_morph_1_lo,x               ; $05BF4C |

CODE_05BF4F:
  JSR CODE_05BF99                           ; $05BF4F |
  JSR CODE_05C06E                           ; $05BF52 |
  JSR CODE_05C16C                           ; $05BF55 |
  PLP                                       ; $05BF58 |
  BNE CODE_05BF69                           ; $05BF59 |
  LDA #$0005                                ; $05BF5B |
  STA !s_spr_draw_priority,x                ; $05BF5E |
  BRA CODE_05BF69                           ; $05BF61 |

CODE_05BF63:
  JSR CODE_05BF99                           ; $05BF63 |
  JSR CODE_05C06E                           ; $05BF66 |

CODE_05BF69:
  JSL $03AF23                               ; $05BF69 |
  TXY                                       ; $05BF6D |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05BF6E |
  ASL A                                     ; $05BF70 |
  TAX                                       ; $05BF71 |
  JSR ($BEA4,x)                             ; $05BF72 |
  JSR CODE_05C16C                           ; $05BF75 |
  LDA !s_spr_wildcard_6_hi_dp,x             ; $05BF78 |
  AND #$00FF                                ; $05BF7A |
  CMP !s_spr_facing_dir,x                   ; $05BF7D |
  BEQ CODE_05BF8F                           ; $05BF80 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05BF82 |
  EOR #$FFFF                                ; $05BF85 |
  INC A                                     ; $05BF88 |
  AND #$01FE                                ; $05BF89 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05BF8C |

CODE_05BF8F:
  LDY !s_spr_facing_dir,x                   ; $05BF8F |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05BF92 |
  JSL $03A5B7                               ; $05BF94 |
  RTL                                       ; $05BF98 |

CODE_05BF99:
  LDA !s_spr_id,x                           ; $05BF99 |
  CMP #$00EC                                ; $05BF9C |
  BEQ CODE_05BFA4                           ; $05BF9F |
  JMP CODE_05C014                           ; $05BFA1 |

CODE_05BFA4:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05BFA4 |
  CPY #$00                                  ; $05BFA6 |
  BEQ CODE_05BFD2                           ; $05BFA8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05BFAA |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05BFAD |
  BEQ CODE_05BFC1                           ; $05BFAF |
  CMP #$00A0                                ; $05BFB1 |
  BPL CODE_05BFBB                           ; $05BFB4 |
  LDA #$00A0                                ; $05BFB6 |
  BRA CODE_05BFCF                           ; $05BFB9 |

CODE_05BFBB:
  SEC                                       ; $05BFBB |
  SBC #$0010                                ; $05BFBC |
  BRA CODE_05BFCF                           ; $05BFBF |

CODE_05BFC1:
  CMP #$0100                                ; $05BFC1 |
  BMI CODE_05BFCB                           ; $05BFC4 |
  LDA #$0100                                ; $05BFC6 |
  BRA CODE_05BFCF                           ; $05BFC9 |

CODE_05BFCB:
  CLC                                       ; $05BFCB |
  ADC #$0008                                ; $05BFCC |

CODE_05BFCF:
  STA !s_spr_gsu_morph_1_lo,x               ; $05BFCF |

CODE_05BFD2:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05BFD2 |
  BNE CODE_05C013                           ; $05BFD4 |
  LDA !s_spr_x_speed_lo,x                   ; $05BFD6 |
  CMP #$8000                                ; $05BFD9 |
  ROR A                                     ; $05BFDC |
  CMP #$8000                                ; $05BFDD |
  ROR A                                     ; $05BFE0 |
  LDY !s_spr_facing_dir,x                   ; $05BFE1 |
  BEQ CODE_05BFEA                           ; $05BFE4 |
  EOR #$FFFF                                ; $05BFE6 |
  INC A                                     ; $05BFE9 |

CODE_05BFEA:
  STA !gsu_r2                               ; $05BFEA |
  LDA !s_spr_y_speed_lo,x                   ; $05BFED |
  CMP #$8000                                ; $05BFF0 |
  ROR A                                     ; $05BFF3 |
  CMP #$8000                                ; $05BFF4 |
  ROR A                                     ; $05BFF7 |
  EOR #$FFFF                                ; $05BFF8 |
  INC A                                     ; $05BFFB |
  STA !gsu_r1                               ; $05BFFC |
  LDX #$0B                                  ; $05BFFF |
  LDA #$BCF8                                ; $05C001 |
  JSL r_gsu_init_1                          ; $05C004 | GSU init
  LDX $12                                   ; $05C008 |
  LDA !gsu_r0                               ; $05C00A |
  AND #$01FE                                ; $05C00D |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C010 |

CODE_05C013:
  RTS                                       ; $05C013 |

CODE_05C014:
  LDA !s_spr_x_speed_lo,x                   ; $05C014 |
  LDY !s_spr_facing_dir,x                   ; $05C017 |
  BEQ CODE_05C020                           ; $05C01A |
  EOR #$FFFF                                ; $05C01C |
  INC A                                     ; $05C01F |

CODE_05C020:
  CMP #$8000                                ; $05C020 |
  ROR A                                     ; $05C023 |
  CMP #$8000                                ; $05C024 |
  ROR A                                     ; $05C027 |
  CMP #$8000                                ; $05C028 |
  ROR A                                     ; $05C02B |
  AND #$01FE                                ; $05C02C |
  SEC                                       ; $05C02F |
  SBC !s_spr_gsu_morph_2_lo,x               ; $05C030 |
  PHP                                       ; $05C033 |
  CLC                                       ; $05C034 |
  ADC #$0100                                ; $05C035 |
  CMP #$0200                                ; $05C038 |
  BCS CODE_05C042                           ; $05C03B |
  PLP                                       ; $05C03D |
  BPL CODE_05C04E                           ; $05C03E |
  BRA CODE_05C045                           ; $05C040 |

CODE_05C042:
  PLP                                       ; $05C042 |
  BMI CODE_05C04E                           ; $05C043 |

CODE_05C045:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C045 |
  SEC                                       ; $05C048 |
  SBC #$0010                                ; $05C049 |
  BRA CODE_05C055                           ; $05C04C |

CODE_05C04E:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C04E |
  CLC                                       ; $05C051 |
  ADC #$0010                                ; $05C052 |

CODE_05C055:
  AND #$01FE                                ; $05C055 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C058 |

CODE_05C05B:
  RTS                                       ; $05C05B |

  db $0C, $0C, $0C, $0C                     ; $05C05C |
  db $0D, $0D, $0C, $0B                     ; $05C060 |
  db $0A, $0B, $0C, $0D                     ; $05C064 |
  db $10, $10, $10, $10                     ; $05C068 |
  db $10, $08                               ; $05C06C |

CODE_05C06E:
  LDY !s_spr_draw_priority,x                ; $05C06E |
  BMI CODE_05C05B                           ; $05C071 |
  REP #$10                                  ; $05C073 |
  LDA !s_spr_oam_pointer,x                  ; $05C075 |
  CLC                                       ; $05C078 |
  ADC #$0018                                ; $05C079 |
  TAY                                       ; $05C07C |

CODE_05C07D:
  PHY                                       ; $05C07D |
  JSL $03AA60                               ; $05C07E |
  LDA !s_spr_timer_4,x                      ; $05C082 |
  BNE CODE_05C096                           ; $05C085 |
  LDA #$0004                                ; $05C087 |
  STA !s_spr_timer_4,x                      ; $05C08A |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $05C08D |
  INC A                                     ; $05C08F |
  AND #$0003                                ; $05C090 |
  TAY                                       ; $05C093 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05C094 |

CODE_05C096:
  LDA #$0008                                ; $05C096 |
  STA !gsu_r5                               ; $05C099 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C09C |
  SEC                                       ; $05C09F |
  SBC #$0080                                ; $05C0A0 |
  AND #$01FE                                ; $05C0A3 |
  STA !gsu_r1                               ; $05C0A6 |
  LDA #$0100                                ; $05C0A9 |
  STA !gsu_r2                               ; $05C0AC |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05C0AF |
  STA !gsu_r3                               ; $05C0B2 |
  LDX #$0B                                  ; $05C0B5 |
  LDA #$86FA                                ; $05C0B7 |
  JSL r_gsu_init_1                          ; $05C0BA | GSU init
  LDX $12                                   ; $05C0BE |
  LDA !gsu_r0                               ; $05C0C0 |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $05C0C3 |
  BNE CODE_05C0CB                           ; $05C0C5 |
  EOR #$FFFF                                ; $05C0C7 |
  INC A                                     ; $05C0CA |

CODE_05C0CB:
  CLC                                       ; $05C0CB |
  ADC !s_spr_x_hitbox_center,x              ; $05C0CC |
  SEC                                       ; $05C0CF |
  SBC !s_bg1_cam_x                          ; $05C0D0 |
  STA $02                                   ; $05C0D3 |
  SEC                                       ; $05C0D5 |
  SBC #$0010                                ; $05C0D6 |
  STA $00                                   ; $05C0D9 |
  LDY !s_spr_anim_frame,x                   ; $05C0DB |
  LDA $C05C,y                               ; $05C0DE |
  AND #$00FF                                ; $05C0E1 |
  STA $04                                   ; $05C0E4 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C0E6 |
  CLC                                       ; $05C0E9 |
  ADC #$0010                                ; $05C0EA |
  SEC                                       ; $05C0ED |
  SBC $04                                   ; $05C0EE |
  SEC                                       ; $05C0F0 |
  SBC !gsu_r1                               ; $05C0F1 |
  SEC                                       ; $05C0F4 |
  SBC !s_bg1_cam_y                          ; $05C0F5 |
  STA $04                                   ; $05C0F8 |
  REP #$10                                  ; $05C0FA |
  PLY                                       ; $05C0FC |
  LDA !s_spr_wildcard_6_hi_dp,x             ; $05C0FD |
  AND #$00FF                                ; $05C0FF |
  BEQ CODE_05C10E                           ; $05C102 |
  LDA $00                                   ; $05C104 |
  PHA                                       ; $05C106 |
  LDA $02                                   ; $05C107 |
  STA $00                                   ; $05C109 |
  PLA                                       ; $05C10B |
  STA $02                                   ; $05C10C |

CODE_05C10E:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $05C10E |
  AND #$0002                                ; $05C110 |
  BEQ CODE_05C143                           ; $05C113 |
  LDA $00                                   ; $05C115 |
  PHA                                       ; $05C117 |
  LDA $02                                   ; $05C118 |
  STA $00                                   ; $05C11A |
  PLA                                       ; $05C11C |
  STA $02                                   ; $05C11D |
  LDA $6004,y                               ; $05C11F |
  EOR #$4000                                ; $05C122 |
  STA $6004,y                               ; $05C125 |
  LDA $600C,y                               ; $05C128 |
  EOR #$4000                                ; $05C12B |
  STA $600C,y                               ; $05C12E |
  LDA $6014,y                               ; $05C131 |
  EOR #$4000                                ; $05C134 |
  STA $6014,y                               ; $05C137 |
  LDA $601C,y                               ; $05C13A |
  EOR #$4000                                ; $05C13D |
  STA $601C,y                               ; $05C140 |

CODE_05C143:
  LDA $00                                   ; $05C143 |
  STA $6000,y                               ; $05C145 |
  STA $6010,y                               ; $05C148 |
  LDA $02                                   ; $05C14B |
  STA $6008,y                               ; $05C14D |
  STA $6018,y                               ; $05C150 |
  LDA $04                                   ; $05C153 |
  STA $6012,y                               ; $05C155 |
  STA $601A,y                               ; $05C158 |
  SEC                                       ; $05C15B |
  SBC #$0010                                ; $05C15C |
  STA $6002,y                               ; $05C15F |
  STA $600A,y                               ; $05C162 |
  SEP #$10                                  ; $05C165 |
  RTS                                       ; $05C167 |

  dw $4040, $6040                           ; $05C168 |

CODE_05C16C:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05C16C |
  STA !gsu_r11                              ; $05C16F |
  LDA #$0100                                ; $05C172 |
  STA !gsu_r6                               ; $05C175 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $05C178 |
  AND #$0002                                ; $05C17A |
  TAY                                       ; $05C17D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C17E |
  CPY #$00                                  ; $05C181 |
  BEQ CODE_05C18C                           ; $05C183 |
  EOR #$FFFF                                ; $05C185 |
  INC A                                     ; $05C188 |
  AND #$01FE                                ; $05C189 |

CODE_05C18C:
  LSR A                                     ; $05C18C |
  STA !gsu_r5                               ; $05C18D |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $05C190 |
  AND #$0001                                ; $05C192 |
  ASL A                                     ; $05C195 |
  TAY                                       ; $05C196 |
  LDA $C168,y                               ; $05C197 |
  STA !gsu_r12                              ; $05C19A |
  LDA #$0055                                ; $05C19D |
  STA !gsu_r13                              ; $05C1A0 |
  LDY !s_spr_dyntile_index,x                ; $05C1A3 |
  TYX                                       ; $05C1A6 |
  LDA $03A9CE,x                             ; $05C1A7 |
  STA !gsu_r3                               ; $05C1AB |
  LDA $03A9EE,x                             ; $05C1AE |
  STA !gsu_r2                               ; $05C1B2 |
  LDX #$08                                  ; $05C1B5 |
  LDA #$84A5                                ; $05C1B7 |
  JSL r_gsu_init_1                          ; $05C1BA | GSU init
  LDX $12                                   ; $05C1BE |
  INC $0CF9                                 ; $05C1C0 |
  RTS                                       ; $05C1C3 |

  TYX                                       ; $05C1C4 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05C1C5 |
  CMP #$0100                                ; $05C1C8 |
  BMI CODE_05C1F6                           ; $05C1CB |
  LDY #$04                                  ; $05C1CD |
  LDA !s_spr_id,x                           ; $05C1CF |
  CMP #$00EC                                ; $05C1D2 |
  BNE CODE_05C1EF                           ; $05C1D5 |
  LDY #$00                                  ; $05C1D7 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $05C1D9 |
  LDA #$0140                                ; $05C1DB |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C1DE |
  LDA #$FE00                                ; $05C1E1 |
  STA !s_spr_x_speed_lo,x                   ; $05C1E4 |
  LDA #$FC00                                ; $05C1E7 |
  STA !s_spr_y_speed_lo,x                   ; $05C1EA |
  LDY #$02                                  ; $05C1ED |

CODE_05C1EF:
  STY !s_spr_wildcard_5_lo_dp,x             ; $05C1EF |
  LDA #$0100                                ; $05C1F1 |
  BRA CODE_05C1FA                           ; $05C1F4 |

CODE_05C1F6:
  CLC                                       ; $05C1F6 |
  ADC #$0010                                ; $05C1F7 |

CODE_05C1FA:
  STA !s_spr_gsu_morph_1_lo,x               ; $05C1FA |
  RTS                                       ; $05C1FD |

  dw $FE00, $0200                           ; $05C1FE |

  TYX                                       ; $05C202 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05C203 |
  AND #$0003                                ; $05C205 |
  BEQ CODE_05C21D                           ; $05C208 |
  AND #$0001                                ; $05C20A |
  BEQ CODE_05C214                           ; $05C20D |
  LDA #$FC00                                ; $05C20F |
  BRA CODE_05C220                           ; $05C212 |

CODE_05C214:
  LDA !s_spr_wildcard_2_lo,x                ; $05C214 |
  EOR #$FFFF                                ; $05C217 |
  INC A                                     ; $05C21A |
  BRA CODE_05C220                           ; $05C21B |

CODE_05C21D:
  LDA !s_spr_wildcard_2_lo,x                ; $05C21D |

CODE_05C220:
  STA !s_spr_y_speed_lo,x                   ; $05C220 |
  LDY !s_spr_facing_dir,x                   ; $05C223 |
  LDA $C1FE,y                               ; $05C226 |
  STA !s_spr_x_speed_lo,x                   ; $05C229 |
  LDY #$00                                  ; $05C22C |
  STY !s_spr_wildcard_6_lo_dp,x             ; $05C22E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C230 |
  RTS                                       ; $05C232 |

  TYX                                       ; $05C233 |
  LDY !s_spr_anim_frame,x                   ; $05C234 |
  CPY #$11                                  ; $05C237 |
  BNE CODE_05C24C                           ; $05C239 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05C23B |
  BIT #$000C                                ; $05C23D |
  BEQ CODE_05C24C                           ; $05C240 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C242 |
  CLC                                       ; $05C245 |
  ADC #$0008                                ; $05C246 |
  STA !s_spr_y_pixel_pos,x                  ; $05C249 |

CODE_05C24C:
  LDY $7860,x                               ; $05C24C |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05C24F |
  TYA                                       ; $05C251 |
  AND #$000F                                ; $05C252 |
  BEQ CODE_05C29F                           ; $05C255 |
  AND #$000C                                ; $05C257 |
  BEQ CODE_05C271                           ; $05C25A |
  LDY !s_spr_anim_frame,x                   ; $05C25C |
  CPY #$0C                                  ; $05C25F |
  BMI CODE_05C271                           ; $05C261 |
  CPY #$11                                  ; $05C263 |
  BPL CODE_05C271                           ; $05C265 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C267 |
  SEC                                       ; $05C26A |
  SBC #$0008                                ; $05C26B |
  STA !s_spr_y_pixel_pos,x                  ; $05C26E |

CODE_05C271:
  LDA !s_spr_y_speed_lo,x                   ; $05C271 |
  STA !s_spr_wildcard_2_lo,x                ; $05C274 |
  STZ !s_spr_x_speed_lo,x                   ; $05C277 |
  STZ !s_spr_y_speed_lo,x                   ; $05C27A |
  STZ !s_spr_y_accel,x                      ; $05C27D |
  LDA !s_spr_x_pixel_pos,x                  ; $05C280 |
  SEC                                       ; $05C283 |
  SBC !s_spr_x_delta_lo,x                   ; $05C284 |
  STA !s_spr_x_pixel_pos,x                  ; $05C287 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C28A |
  SEC                                       ; $05C28D |
  SBC !s_spr_y_delta_lo,x                   ; $05C28E |
  STA !s_spr_y_pixel_pos,x                  ; $05C291 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05C294 |
  LDA #$0011                                ; $05C296 |
  STA !s_spr_anim_frame,x                   ; $05C299 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C29C |
  RTS                                       ; $05C29E |

CODE_05C29F:
  LDA !s_spr_y_speed_lo,x                   ; $05C29F |
  PHP                                       ; $05C2A2 |
  CLC                                       ; $05C2A3 |
  ADC #$0040                                ; $05C2A4 |
  CMP #$0080                                ; $05C2A7 |
  BCS CODE_05C2B2                           ; $05C2AA |
  PLP                                       ; $05C2AC |
  LDA #$000E                                ; $05C2AD |
  BRA CODE_05C2CF                           ; $05C2B0 |

CODE_05C2B2:
  CLC                                       ; $05C2B2 |
  ADC #$01C0                                ; $05C2B3 |
  CMP #$0400                                ; $05C2B6 |
  BCS CODE_05C2C6                           ; $05C2B9 |
  LDA #$000F                                ; $05C2BB |
  PLP                                       ; $05C2BE |
  BPL CODE_05C2CF                           ; $05C2BF |
  LDA #$000D                                ; $05C2C1 |
  BRA CODE_05C2CF                           ; $05C2C4 |

CODE_05C2C6:
  LDA #$0010                                ; $05C2C6 |
  PLP                                       ; $05C2C9 |
  BPL CODE_05C2CF                           ; $05C2CA |
  LDA #$000C                                ; $05C2CC |

CODE_05C2CF:
  STA !s_spr_anim_frame,x                   ; $05C2CF |
  RTS                                       ; $05C2D2 |

  TYX                                       ; $05C2D3 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05C2D4 |
  CMP #$0090                                ; $05C2D7 |
  BNE CODE_05C2E6                           ; $05C2DA |
  LDA #$0040                                ; $05C2DC |
  STA !s_spr_y_accel,x                      ; $05C2DF |
  LDY #$01                                  ; $05C2E2 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05C2E4 |

CODE_05C2E6:
  JSR CODE_05C312                           ; $05C2E6 |
  RTS                                       ; $05C2E9 |

  dw $0080, $0100, $0180, $0200             ; $05C2EA |
  dw $FF80, $FF00                           ; $05C2F2 |

  dw $FE80, $FE00                           ; $05C2F6 |

  dw $0008, $0000                           ; $05C2FA |
  dw $FFFF, $FFFF, $0008, $0000             ; $05C2FE |
  dw $0008, $FFF8                           ; $05C306 |
  dw $0000, $0000, $0008, $FFF8             ; $05C30A |

CODE_05C312:
  LDA #$01D6                                ; $05C312 |
  JSL spawn_ambient_sprite                  ; $05C315 |
  LDA #$0003                                ; $05C319 |
  STA $7E4C,y                               ; $05C31C |
  ASL A                                     ; $05C31F |
  STA $7782,y                               ; $05C320 |
  LDA #$0022                                ; $05C323 |
  STA $7002,y                               ; $05C326 |
  PHY                                       ; $05C329 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05C32A |
  BIT #$000C                                ; $05C32C |
  BNE CODE_05C33A                           ; $05C32F |
  AND #$0002                                ; $05C331 |
  CLC                                       ; $05C334 |
  ADC #$0004                                ; $05C335 |
  BRA CODE_05C341                           ; $05C338 |

CODE_05C33A:
  AND #$0004                                ; $05C33A |
  EOR #$0004                                ; $05C33D |
  LSR A                                     ; $05C340 |

CODE_05C341:
  TAY                                       ; $05C341 |
  LDA $C306,y                               ; $05C342 |
  STA $08                                   ; $05C345 |
  LDA $C30A,y                               ; $05C347 |
  STA $0A                                   ; $05C34A |
  LDA $C2FA,y                               ; $05C34C |
  BPL CODE_05C35B                           ; $05C34F |
  LDA $10                                   ; $05C351 |
  AND #$0008                                ; $05C353 |
  BEQ CODE_05C35B                           ; $05C356 |
  LDA #$0008                                ; $05C358 |

CODE_05C35B:
  STA $04                                   ; $05C35B |
  LDA $C2FE,y                               ; $05C35D |
  BPL CODE_05C36C                           ; $05C360 |
  LDA $10                                   ; $05C362 |
  AND #$0020                                ; $05C364 |
  BEQ CODE_05C36C                           ; $05C367 |
  LDA #$0008                                ; $05C369 |

CODE_05C36C:
  STA $06                                   ; $05C36C |
  LDA $10                                   ; $05C36E |
  PHA                                       ; $05C370 |
  AND #$0006                                ; $05C371 |
  CLC                                       ; $05C374 |
  ADC $04                                   ; $05C375 |
  TAY                                       ; $05C377 |
  LDA $C2EA,y                               ; $05C378 |
  STA $00                                   ; $05C37B |
  PLA                                       ; $05C37D |
  XBA                                       ; $05C37E |
  AND #$0006                                ; $05C37F |
  CLC                                       ; $05C382 |
  ADC $06                                   ; $05C383 |
  TAY                                       ; $05C385 |
  LDA $C2EA,y                               ; $05C386 |
  PLY                                       ; $05C389 |
  STA $71E2,y                               ; $05C38A |
  LDA $00                                   ; $05C38D |
  STA $71E0,y                               ; $05C38F |
  LDA !s_spr_x_pixel_pos,x                  ; $05C392 |
  CLC                                       ; $05C395 |
  ADC $08                                   ; $05C396 |
  STA $70A2,y                               ; $05C398 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C39B |
  CLC                                       ; $05C39E |
  ADC $0A                                   ; $05C39F |
  STA $7142,y                               ; $05C3A1 |
  RTS                                       ; $05C3A4 |

  dw $FE00, $0200                           ; $05C3A5 |

  TYX                                       ; $05C3A9 |
  LDA !s_spr_timer_1,x                      ; $05C3AA |
  BNE CODE_05C3C7                           ; $05C3AD |
  LDY !s_spr_facing_dir,x                   ; $05C3AF |
  LDA $C3A5,y                               ; $05C3B2 |
  STA !s_spr_x_accel_ceiling,x              ; $05C3B5 |
  LDA #$0030                                ; $05C3B8 |
  STA !s_spr_timer_3,x                      ; $05C3BB |
  LDA #$0004                                ; $05C3BE |
  STA !s_spr_anim_frame,x                   ; $05C3C1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C3C4 |
  RTS                                       ; $05C3C6 |

CODE_05C3C7:
  LDA !s_spr_timer_2,x                      ; $05C3C7 |
  BNE CODE_05C3DC                           ; $05C3CA |
  LDA #$0004                                ; $05C3CC |
  STA !s_spr_timer_2,x                      ; $05C3CF |
  LDA !s_spr_anim_frame,x                   ; $05C3D2 |
  INC A                                     ; $05C3D5 |
  AND #$0003                                ; $05C3D6 |
  STA !s_spr_anim_frame,x                   ; $05C3D9 |

CODE_05C3DC:
  RTS                                       ; $05C3DC |

  TYX                                       ; $05C3DD |
  LDA !s_spr_timer_1,x                      ; $05C3DE |
  BNE CODE_05C3F6                           ; $05C3E1 |
  LDA $7860,x                               ; $05C3E3 |
  AND #$0001                                ; $05C3E6 |
  BNE CODE_05C3FA                           ; $05C3E9 |
  STZ !s_spr_x_accel,x                      ; $05C3EB |
  LDA #$0010                                ; $05C3EE |
  STA !s_spr_anim_frame,x                   ; $05C3F1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C3F4 |

CODE_05C3F6:
  INC !s_spr_timer_3,x                      ; $05C3F6 |
  RTS                                       ; $05C3F9 |

CODE_05C3FA:
  LDA #$0010                                ; $05C3FA |
  STA !s_spr_x_accel,x                      ; $05C3FD |
  LDA !s_spr_timer_3,x                      ; $05C400 |
  BNE CODE_05C426                           ; $05C403 |
  STZ !s_spr_x_accel_ceiling,x              ; $05C405 |
  LDA !s_spr_x_speed_lo,x                   ; $05C408 |
  CLC                                       ; $05C40B |
  ADC #$0010                                ; $05C40C |
  CMP #$0020                                ; $05C40F |
  BCS CODE_05C426                           ; $05C412 |
  STZ !s_spr_x_speed_lo,x                   ; $05C414 |
  STZ !s_spr_x_accel,x                      ; $05C417 |
  LDA #$0060                                ; $05C41A |
  STA !s_spr_timer_1,x                      ; $05C41D |
  STZ !s_spr_anim_frame,x                   ; $05C420 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05C423 |
  RTS                                       ; $05C425 |

CODE_05C426:
  LDA !s_spr_x_speed_lo,x                   ; $05C426 |
  BPL CODE_05C42F                           ; $05C429 |
  EOR #$FFFF                                ; $05C42B |
  INC A                                     ; $05C42E |

CODE_05C42F:
  CLC                                       ; $05C42F |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $05C430 |
  CMP #$0400                                ; $05C432 |
  BMI CODE_05C44D                           ; $05C435 |
  PHA                                       ; $05C437 |
  LDA !s_spr_anim_frame,x                   ; $05C438 |
  SEC                                       ; $05C43B |
  SBC #$0003                                ; $05C43C |
  AND #$0007                                ; $05C43F |
  CLC                                       ; $05C442 |
  ADC #$0004                                ; $05C443 |
  STA !s_spr_anim_frame,x                   ; $05C446 |
  PLA                                       ; $05C449 |
  AND #$03FF                                ; $05C44A |

CODE_05C44D:
  STA !s_spr_wildcard_3_lo_dp,x             ; $05C44D |
  RTS                                       ; $05C44F |

  TYX                                       ; $05C450 |
  INC !s_spr_timer_3,x                      ; $05C451 |
  LDA $7860,x                               ; $05C454 |
  AND #$0001                                ; $05C457 |
  BEQ CODE_05C46A                           ; $05C45A |
  LDA #$0010                                ; $05C45C |
  STA !s_spr_timer_1,x                      ; $05C45F |
  LDA #$000E                                ; $05C462 |
  STA !s_spr_anim_frame,x                   ; $05C465 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05C468 |

CODE_05C46A:
  RTS                                       ; $05C46A |

; 3 bucket inits point here
init_bucket:
  JSL $03AE60                               ; $05C46B |
  LDA #$0100                                ; $05C46F |
  STA !s_spr_gsu_morph_1_lo,x               ; $05C472 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C475 |
  CLC                                       ; $05C478 |
  ADC #$0004                                ; $05C479 |
  STA !s_spr_wildcard_1_lo,x                ; $05C47C |
  LDA !s_spr_y_pixel_pos,x                  ; $05C47F |
  SEC                                       ; $05C482 |
  SBC #$0006                                ; $05C483 |
  STA !s_spr_wildcard_2_lo,x                ; $05C486 |
  STZ !s_spr_facing_dir,x                   ; $05C489 |
  JSR CODE_05C59F                           ; $05C48C |
  LDA !s_spr_id,x                           ; $05C48F |
  CMP #$0021                                ; $05C492 |
  BNE CODE_05C4A2                           ; $05C495 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C497 |
  AND #$0010                                ; $05C49A |
  LSR A                                     ; $05C49D |
  LSR A                                     ; $05C49E |
  LSR A                                     ; $05C49F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05C4A0 |

CODE_05C4A2:
  RTL                                       ; $05C4A2 |

bucket_obj_state_ptr:
  dw $C5EB                                  ; $05C4A3 | state 00
  dw $C6B1                                  ; $05C4A5 | state 01
  dw $C70D                                  ; $05C4A7 | state 02
  dw $C766                                  ; $05C4A9 | state 03
  dw $C79E                                  ; $05C4AB | state 04

; buckets with objects point here - bandit/coins
main_bucket_obj:
  JSR CODE_05C4D5                           ; $05C4AD |
  JSL $03AF23                               ; $05C4B0 |
  JSL $03A2C7                               ; $05C4B4 |
  BCC CODE_05C4C6                           ; $05C4B8 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05C4BA |
  BEQ CODE_05C4C2                           ; $05C4BC |
  JML $03A32E                               ; $05C4BE |

CODE_05C4C2:
  JML $03A31E                               ; $05C4C2 |

CODE_05C4C6:
  TXY                                       ; $05C4C6 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05C4C7 |
  ASL A                                     ; $05C4C9 |
  TAX                                       ; $05C4CA |
  JSR ($C4A3,x)                             ; $05C4CB |
  JSR CODE_05C571                           ; $05C4CE |
  JSR CODE_05C591                           ; $05C4D1 |
  RTL                                       ; $05C4D4 |

; bucket sub
CODE_05C4D5:
  JSL $03AA52                               ; $05C4D5 |
  LDA !s_spr_gsu_morph_2_hi,x               ; $05C4D9 |
  AND #$00FF                                ; $05C4DC |
  ASL A                                     ; $05C4DF |
  STA !gsu_r1                               ; $05C4E0 |
  LDA #$000A                                ; $05C4E3 |
  STA !gsu_r6                               ; $05C4E6 |
  LDX #$0B                                  ; $05C4E9 |
  LDA #$8595                                ; $05C4EB |
  JSL r_gsu_init_1                          ; $05C4EE | GSU init
  LDX $12                                   ; $05C4F2 |
  REP #$10                                  ; $05C4F4 |
  LDY !s_spr_oam_pointer,x                  ; $05C4F6 |
  LDA !s_spr_y_accel,x                      ; $05C4F9 |
  BNE CODE_05C552                           ; $05C4FC |
  LDA !s_spr_wildcard_1_lo,x                ; $05C4FE |
  CLC                                       ; $05C501 |
  ADC #$FFFC                                ; $05C502 |
  SEC                                       ; $05C505 |
  SBC !gsu_r1                               ; $05C506 |
  STA !s_spr_x_pixel_pos,x                  ; $05C509 |
  CLC                                       ; $05C50C |
  ADC #$0008                                ; $05C50D |
  SEC                                       ; $05C510 |
  SBC !s_bg1_cam_x                          ; $05C511 |
  STA $00                                   ; $05C514 |
  LDA !s_spr_wildcard_2_lo,x                ; $05C516 |
  CLC                                       ; $05C519 |
  ADC #$FFFC                                ; $05C51A |
  CLC                                       ; $05C51D |
  ADC !gsu_r0                               ; $05C51E |
  STA !s_spr_y_pixel_pos,x                  ; $05C521 |
  CLC                                       ; $05C524 |
  ADC #$0008                                ; $05C525 |
  SEC                                       ; $05C528 |
  SBC !s_bg1_cam_y                          ; $05C529 |
  STA $02                                   ; $05C52C |
  LDA $00                                   ; $05C52E |
  STA $6008,y                               ; $05C530 |
  STA $6018,y                               ; $05C533 |
  SEC                                       ; $05C536 |
  SBC #$0010                                ; $05C537 |
  STA $6000,y                               ; $05C53A |
  STA $6010,y                               ; $05C53D |
  LDA $02                                   ; $05C540 |
  STA $6012,y                               ; $05C542 |
  STA $601A,y                               ; $05C545 |
  SEC                                       ; $05C548 |
  SBC #$0010                                ; $05C549 |
  STA $6002,y                               ; $05C54C |
  STA $600A,y                               ; $05C54F |

CODE_05C552:
  LDA !s_spr_oam_pointer,x                  ; $05C552 |
  CLC                                       ; $05C555 |
  ADC #$0020                                ; $05C556 |
  TAY                                       ; $05C559 |
  LDA !s_spr_wildcard_1_lo,x                ; $05C55A |
  SEC                                       ; $05C55D |
  SBC !s_bg1_cam_x                          ; $05C55E |
  STA $6000,y                               ; $05C561 |
  LDA !s_spr_wildcard_2_lo,x                ; $05C564 |
  SEC                                       ; $05C567 |
  SBC !s_bg1_cam_y                          ; $05C568 |
  STA $6002,y                               ; $05C56B |
  SEP #$10                                  ; $05C56E |
  RTS                                       ; $05C570 |

; bucket sub
CODE_05C571:
  LDY !s_spr_collision_id,x                 ; $05C571 |
  DEY                                       ; $05C574 |
  BMI CODE_05C590                           ; $05C575 |
  LDA !s_spr_state,y                        ; $05C577 |
  CMP #$0010                                ; $05C57A |
  BNE CODE_05C590                           ; $05C57D |
  LDA !s_spr_collision_state,y              ; $05C57F |
  BEQ CODE_05C590                           ; $05C582 |
  TYX                                       ; $05C584 |
  JSL $03B25B                               ; $05C585 |
  LDA #$002E                                ; $05C589 |\ play sound #$002E
  JSL push_sound_queue                      ; $05C58C |/

CODE_05C590:
  RTS                                       ; $05C590 |

; bucket sub
CODE_05C591:
  LDA !s_spr_dyntile_index,x                ; $05C591 |
  BMI CODE_05C5E2                           ; $05C594 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C596 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $05C599 |
  BEQ CODE_05C5E2                           ; $05C59B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05C59D |

CODE_05C59F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05C59F |
  STA !gsu_r11                              ; $05C5A2 |
  LDA #$0200                                ; $05C5A5 |
  SEC                                       ; $05C5A8 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05C5A9 |
  STA !gsu_r6                               ; $05C5AC |
  LDY !s_spr_gsu_morph_2_hi,x               ; $05C5AF |
  TYA                                       ; $05C5B2 |
  STA !gsu_r5                               ; $05C5B3 |
  LDA #$0055                                ; $05C5B6 |
  STA !gsu_r13                              ; $05C5B9 |
  LDA #$20C0                                ; $05C5BC |
  STA !gsu_r12                              ; $05C5BF |
  LDY !s_spr_dyntile_index,x                ; $05C5C2 |
  TYX                                       ; $05C5C5 |
  LDA $03A9CE,x                             ; $05C5C6 |
  STA !gsu_r3                               ; $05C5CA |
  LDA $03A9EE,x                             ; $05C5CD |
  STA !gsu_r2                               ; $05C5D1 |
  LDX #$08                                  ; $05C5D4 |
  LDA #$84A5                                ; $05C5D6 |
  JSL r_gsu_init_1                          ; $05C5D9 | GSU init
  LDX $12                                   ; $05C5DD |
  INC $0CF9                                 ; $05C5DF |

CODE_05C5E2:
  RTS                                       ; $05C5E2 |

  dw $C7D4                                  ; $05C5E3 |
  dw $C7F9                                  ; $05C5E5 |

  dw $0020                                  ; $05C5E7 |
  dw $0115                                  ; $05C5E9 |

; bucket object state 00
  TYX                                       ; $05C5EB |
  LDY !s_spr_collision_id,x                 ; $05C5EC |
  DEY                                       ; $05C5EF |
  BMI CODE_05C5E2                           ; $05C5F0 |
  LDA !s_spr_state,y                        ; $05C5F2 |
  CMP #$0010                                ; $05C5F5 |
  BNE CODE_05C5E2                           ; $05C5F8 |
  LDA !s_spr_collision_state,y              ; $05C5FA |
  BEQ CODE_05C5E2                           ; $05C5FD |
  LDA !s_spr_x_hitbox_center,y              ; $05C5FF |
  SEC                                       ; $05C602 |
  SBC !s_spr_x_hitbox_center,x              ; $05C603 |
  STA !gsu_r1                               ; $05C606 |
  LDA !s_spr_y_hitbox_center,y              ; $05C609 |
  SEC                                       ; $05C60C |
  SBC !s_spr_y_hitbox_center,x              ; $05C60D |
  STA !gsu_r2                               ; $05C610 |
  LDX #$0B                                  ; $05C613 |
  LDA #$BCF8                                ; $05C615 |
  JSL r_gsu_init_1                          ; $05C618 | GSU init
  LDX $12                                   ; $05C61C |
  LDY !s_spr_collision_id,x                 ; $05C61E |
  DEY                                       ; $05C621 |
  LDA !gsu_r0                               ; $05C622 |
  CMP #$0100                                ; $05C625 |
  BMI CODE_05C633                           ; $05C628 |
  LDA !s_spr_x_speed_lo,y                   ; $05C62A |
  EOR #$FFFF                                ; $05C62D |
  INC A                                     ; $05C630 |
  BRA CODE_05C6A6                           ; $05C631 |

CODE_05C633:
  SEC                                       ; $05C633 |
  SBC #$0070                                ; $05C634 |
  CMP #$0020                                ; $05C637 |
  BCS CODE_05C682                           ; $05C63A |
  LDA !s_spr_id,y                           ; $05C63C |
  CMP #$0022                                ; $05C63F |
  BMI CODE_05C654                           ; $05C642 |
  CMP #$002C                                ; $05C644 |
  BPL CODE_05C654                           ; $05C647 |
  LDA #$FD00                                ; $05C649 |
  STA !s_spr_y_speed_lo,x                   ; $05C64C |
  LDY #$04                                  ; $05C64F |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05C651 |
  RTS                                       ; $05C653 |

CODE_05C654:
  LDA #$FE00                                ; $05C654 |
  STA !s_spr_y_speed_lo,x                   ; $05C657 |
  LDA #$0040                                ; $05C65A |
  STA !s_spr_y_accel,x                      ; $05C65D |
  LDY #$FF                                  ; $05C660 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $05C662 |
  LDA !s_spr_id,x                           ; $05C664 |
  SEC                                       ; $05C667 |
  SBC #$0122                                ; $05C668 |
  ASL A                                     ; $05C66B |
  TAY                                       ; $05C66C |
  STY $00                                   ; $05C66D |
  LDA $C5E7,y                               ; $05C66F |
  JSL spawn_sprite_init                     ; $05C672 |
  BCC CODE_05C67F                           ; $05C676 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $05C678 |
  LDX $00                                   ; $05C67A |
  JSR ($C5E3,x)                             ; $05C67C |

CODE_05C67F:
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C67F |
  RTS                                       ; $05C681 |

CODE_05C682:
  LDA !s_spr_id,y                           ; $05C682 |
  CMP #$0022                                ; $05C685 |
  BMI CODE_05C6A3                           ; $05C688 |
  CMP #$002C                                ; $05C68A |
  BPL CODE_05C6A3                           ; $05C68D |
  LDA !s_spr_y_accel,y                      ; $05C68F |
  BNE CODE_05C6A3                           ; $05C692 |
  LDA !s_spr_x_speed_lo,y                   ; $05C694 |
  PHP                                       ; $05C697 |
  LDA #$0800                                ; $05C698 |
  PLP                                       ; $05C69B |
  BPL CODE_05C6A6                           ; $05C69C |
  LDA #$F800                                ; $05C69E |
  BRA CODE_05C6A6                           ; $05C6A1 |

CODE_05C6A3:
  LDA !s_spr_x_speed_lo,y                   ; $05C6A3 |

CODE_05C6A6:
  STA !s_spr_wildcard_3_lo_dp,x             ; $05C6A6 |
  LDY #$02                                  ; $05C6A8 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05C6AA |
  RTS                                       ; $05C6AC |

  dw $FFF8                                  ; $05C6AD |
  dw $0000                                  ; $05C6AF |

; bucket object state 01
  TYX                                       ; $05C6B1 |
  LDA !s_spr_wildcard_2_lo,x                ; $05C6B2 |
  CLC                                       ; $05C6B5 |
  ADC #$0006                                ; $05C6B6 |
  CMP !s_spr_y_pixel_pos,x                  ; $05C6B9 |
  BPL CODE_05C6C7                           ; $05C6BC |
  STA !s_spr_y_pixel_pos,x                  ; $05C6BE |
  STZ !s_spr_y_speed_lo,x                   ; $05C6C1 |
  STZ !s_spr_y_accel,x                      ; $05C6C4 |

CODE_05C6C7:
  LDA !s_spr_id,x                           ; $05C6C7 |
  SEC                                       ; $05C6CA |
  SBC #$0122                                ; $05C6CB |
  ASL A                                     ; $05C6CE |
  TAY                                       ; $05C6CF |
  STY $02                                   ; $05C6D0 |
  LDA $C6AD,y                               ; $05C6D2 |
  STA $00                                   ; $05C6D5 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05C6D7 |
  BMI CODE_05C6FA                           ; $05C6D9 |
  LDA !s_spr_state,y                        ; $05C6DB |
  CMP #$0002                                ; $05C6DE |
  BEQ CODE_05C6FC                           ; $05C6E1 |
  CMP #$0010                                ; $05C6E3 |
  BNE CODE_05C6FA                           ; $05C6E6 |
  LDA !s_spr_y_pixel_pos,y                  ; $05C6E8 |
  CLC                                       ; $05C6EB |
  ADC $00                                   ; $05C6EC |
  CMP !s_spr_y_pixel_pos,x                  ; $05C6EE |
  BMI CODE_05C6FC                           ; $05C6F1 |
  TYX                                       ; $05C6F3 |
  JSL $03A31E                               ; $05C6F4 |
  LDX $12                                   ; $05C6F8 |

CODE_05C6FA:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05C6FA |

CODE_05C6FC:
  RTS                                       ; $05C6FC |

; bucket rotational effects
  dw $0020                                  ; $05C6FD |
  dw $0040                                  ; $05C6FF |
  dw $FFC0                                  ; $05C701 |
  dw $FFE0                                  ; $05C703 |
  dw $0040                                  ; $05C705 |
  dw $0040                                  ; $05C707 |
  dw $FFC0                                  ; $05C709 |
  dw $FFC0                                  ; $05C70B |

; bucket object state 02
  TYX                                       ; $05C70D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C70E |
  CLC                                       ; $05C711 |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $05C712 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C714 |
  SEC                                       ; $05C717 |
  SBC #$7C00                                ; $05C718 |
  CMP #$0800                                ; $05C71B |
  BCS CODE_05C729                           ; $05C71E |
  LDA #$0010                                ; $05C720 |
  STA !s_spr_timer_1,x                      ; $05C723 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C726 |
  RTS                                       ; $05C728 |

CODE_05C729:
  LDY #$00                                  ; $05C729 |

CODE_05C72B:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C72B |
  BMI CODE_05C736                           ; $05C72E |
  TYA                                       ; $05C730 |
  CLC                                       ; $05C731 |
  ADC #$0004                                ; $05C732 |
  TAY                                       ; $05C735 |

CODE_05C736:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05C736 |
  BPL CODE_05C73C                           ; $05C738 |
  INY                                       ; $05C73A |
  INY                                       ; $05C73B |

CODE_05C73C:
  CLC                                       ; $05C73C |
  ADC $C6FD,y                               ; $05C73D |
  STA $00                                   ; $05C740 |
  CLC                                       ; $05C742 |
  ADC #$0040                                ; $05C743 |
  CMP #$0080                                ; $05C746 |
  BCS CODE_05C75D                           ; $05C749 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C74B |
  CLC                                       ; $05C74E |
  ADC #$0080                                ; $05C74F |
  CMP #$0100                                ; $05C752 |
  BCS CODE_05C75D                           ; $05C755 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05C757 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05C75A |
  RTS                                       ; $05C75C |

CODE_05C75D:
  LDA $00                                   ; $05C75D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05C75F |
  RTS                                       ; $05C761 |

  dw $C82A                                  ; $05C762 |
  dw $C85F                                  ; $05C764 |

; bucket object state 03
  TYX                                       ; $05C766 |
  LDY #$08                                  ; $05C767 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05C769 |
  CLC                                       ; $05C76C |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $05C76D |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C76F |
  SEC                                       ; $05C772 |
  SBC #$7C00                                ; $05C773 |
  CMP #$0800                                ; $05C776 |
  BCS CODE_05C72B                           ; $05C779 |
  LDA !s_spr_timer_1,x                      ; $05C77B |
  BNE CODE_05C729                           ; $05C77E |
  LDA #$8000                                ; $05C780 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05C783 |
  TXY                                       ; $05C786 |
  LDA !s_spr_id,x                           ; $05C787 |
  SEC                                       ; $05C78A |
  SBC #$0122                                ; $05C78B |
  ASL A                                     ; $05C78E |
  TAX                                       ; $05C78F |
  JSR ($C762,x)                             ; $05C790 |
  LDA #$0030                                ; $05C793 |
  STA !s_spr_timer_1,x                      ; $05C796 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05C799 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C79B |
  RTS                                       ; $05C79D |

; bucket object state 04
  TYX                                       ; $05C79E |
  LDA !s_spr_timer_1,x                      ; $05C79F |
  BNE CODE_05C7D3                           ; $05C7A2 |
  LDA #$0040                                ; $05C7A4 |
  STA !s_spr_y_accel,x                      ; $05C7A7 |
  LDA #$8000                                ; $05C7AA |
  STA !s_spr_wildcard_1_lo,x                ; $05C7AD |
  LDA !s_spr_bitwise_settings_3,x           ; $05C7B0 |
  AND #$001F                                ; $05C7B3 |
  BEQ CODE_05C7D3                           ; $05C7B6 |
  LDA $7860,x                               ; $05C7B8 |
  AND #$0001                                ; $05C7BB |
  BEQ CODE_05C7D3                           ; $05C7BE |
  LDA #$2000                                ; $05C7C0 |
  STA !s_spr_bitwise_settings_3,x           ; $05C7C3 |
  LDA #$FC00                                ; $05C7C6 |
  STA !s_spr_y_speed_lo,x                   ; $05C7C9 |
  LDA #$002F                                ; $05C7CC |\ play sound #$002F
  JSL push_sound_queue                      ; $05C7CF |/

CODE_05C7D3:
  RTS                                       ; $05C7D3 |

; bucket sub
  LDX $12                                   ; $05C7D4 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C7D6 |
  STA !s_spr_x_pixel_pos,y                  ; $05C7D9 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C7DC |
  CLC                                       ; $05C7DF |
  ADC #$0004                                ; $05C7E0 |
  STA !s_spr_y_pixel_pos,y                  ; $05C7E3 |
  LDA #$000C                                ; $05C7E6 |
  STA !s_spr_wildcard_5_lo,y                ; $05C7E9 |
  LDA #$0017                                ; $05C7EC |
  STA !s_spr_anim_frame,y                   ; $05C7EF |
  LDA #$FE00                                ; $05C7F2 |
  STA !s_spr_y_speed_lo,y                   ; $05C7F5 |
  RTS                                       ; $05C7F8 |

; bucket sub
  LDX $12                                   ; $05C7F9 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C7FB |
  STA !s_spr_x_pixel_pos,y                  ; $05C7FE |
  LDA !s_spr_y_pixel_pos,x                  ; $05C801 |
  SEC                                       ; $05C804 |
  SBC #$0004                                ; $05C805 |
  STA !s_spr_y_pixel_pos,y                  ; $05C808 |
  LDA #$FE80                                ; $05C80B |
  STA !s_spr_y_speed_lo,y                   ; $05C80E |
  LDA #$FFFF                                ; $05C811 |
  STA !s_spr_timer_1,y                      ; $05C814 |
  STA !s_spr_timer_2,y                      ; $05C817 |
  STA !s_spr_timer_3,y                      ; $05C81A |
  LDA #$0007                                ; $05C81D |
  STA !s_spr_draw_priority,y                ; $05C820 |
  LDA #$0001                                ; $05C823 |
  STA !s_spr_wildcard_5_lo,y                ; $05C826 |
  RTS                                       ; $05C829 |

; bucket sub
  TYX                                       ; $05C82A |
  LDA #$0020                                ; $05C82B |
  JSL spawn_sprite_init                     ; $05C82E |
  BCC CODE_05C84A                           ; $05C832 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C834 |
  STA !s_spr_x_pixel_pos,y                  ; $05C837 |
  LDA !s_spr_y_pixel_pos,x                  ; $05C83A |
  CLC                                       ; $05C83D |
  ADC #$0008                                ; $05C83E |
  STA !s_spr_y_pixel_pos,y                  ; $05C841 |
  LDA #$0017                                ; $05C844 |
  STA !s_spr_anim_frame,y                   ; $05C847 |

CODE_05C84A:
  RTS                                       ; $05C84A |

  dw $0004                                  ; $05C84B |
  dw $0000                                  ; $05C84D |
  dw $FFFC                                  ; $05C84F |
  dw $FFFF                                  ; $05C851 |
  dw $0002                                  ; $05C853 |

  dw $FFFC                                  ; $05C855 |
  dw $0004                                  ; $05C857 |
  dw $0002                                  ; $05C859 |
  dw $FFFE                                  ; $05C85B |
  dw $FFF8                                  ; $05C85D |

; bucket sub
  TYX                                       ; $05C85F |
  LDY #$08                                  ; $05C860 |

CODE_05C862:
  PHY                                       ; $05C862 |
  LDA $C84B,y                               ; $05C863 |
  STA $00                                   ; $05C866 |
  LDA $C855,y                               ; $05C868 |
  STA $02                                   ; $05C86B |
  LDA #$0115                                ; $05C86D |
  JSL spawn_sprite_active                   ; $05C870 |
  BCC CODE_05C8AC                           ; $05C874 |
  LDA !s_spr_x_pixel_pos,x                  ; $05C876 |
  CLC                                       ; $05C879 |
  ADC $00                                   ; $05C87A |
  STA !s_spr_x_pixel_pos,y                  ; $05C87C |
  LDA !s_spr_y_pixel_pos,x                  ; $05C87F |
  CLC                                       ; $05C882 |
  ADC $02                                   ; $05C883 |
  STA !s_spr_y_pixel_pos,y                  ; $05C885 |
  LDA #$FFFF                                ; $05C888 |
  STA !s_spr_timer_1,y                      ; $05C88B |
  STA !s_spr_timer_2,y                      ; $05C88E |
  STA !s_spr_timer_3,y                      ; $05C891 |
  LDA #$0007                                ; $05C894 |
  STA !s_spr_draw_priority,y                ; $05C897 |
  LDA #$0400                                ; $05C89A |
  STA !s_spr_y_speed_lo,y                   ; $05C89D |
  LDA #$0001                                ; $05C8A0 |
  STA !s_spr_wildcard_5_lo,y                ; $05C8A3 |
  PLY                                       ; $05C8A6 |
  DEY                                       ; $05C8A7 |
  DEY                                       ; $05C8A8 |
  BPL CODE_05C862                           ; $05C8A9 |
  PHY                                       ; $05C8AB |

CODE_05C8AC:
  PLY                                       ; $05C8AC |
  RTS                                       ; $05C8AD |

bucket_state_ptr:
  dw $C8F6                                  ; $05C8AE | state 00
  dw $C922                                  ; $05C8B0 | state 01
  dw $C958                                  ; $05C8B2 | state 02
  dw $80C2                                  ; $05C8B4 | state 03

; regular empty bucket
main_bucket:
  JSR CODE_05C4D5                           ; $05C8B6 |
  JSL $03AF23                               ; $05C8B9 |
  TXY                                       ; $05C8BD |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05C8BE |
  ASL A                                     ; $05C8C0 |
  TAX                                       ; $05C8C1 |
  JSR ($C8AE,x)                             ; $05C8C2 |
  JSR CODE_05C571                           ; $05C8C5 |
  JSR CODE_05C591                           ; $05C8C8 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05C8CB |
  CPY #$02                                  ; $05C8CD |
  BMI CODE_05C8F5                           ; $05C8CF |
  LDA !s_spr_x_player_delta,x               ; $05C8D1 |
  CLC                                       ; $05C8D4 |
  ADC #$0014                                ; $05C8D5 |
  CMP #$0028                                ; $05C8D8 |
  BCS CODE_05C8F5                           ; $05C8DB |
  LDA !s_spr_y_player_delta,x               ; $05C8DD |
  SEC                                       ; $05C8E0 |
  SBC !s_player_hitbox_half_height          ; $05C8E1 |
  SEC                                       ; $05C8E4 |
  SBC #$000C                                ; $05C8E5 |
  BPL CODE_05C8F5                           ; $05C8E8 |
  CMP #$FFE4                                ; $05C8EA |
  BMI CODE_05C8F5                           ; $05C8ED |
  LDA #$0010                                ; $05C8EF |
  STA $0CCA                                 ; $05C8F2 |

CODE_05C8F5:
  RTL                                       ; $05C8F5 |

; bucket state 00
  TYX                                       ; $05C8F6 |
  LDY !s_spr_collision_id,x                 ; $05C8F7 |
  DEY                                       ; $05C8FA |
  BMI CODE_05C921                           ; $05C8FB |
  LDA !s_spr_state,y                        ; $05C8FD |
  CMP #$0010                                ; $05C900 |
  BNE CODE_05C921                           ; $05C903 |
  LDA !s_spr_collision_state,y              ; $05C905 |
  BEQ CODE_05C921                           ; $05C908 |
  LDA #$FD00                                ; $05C90A |
  STA !s_spr_y_speed_lo,x                   ; $05C90D |
  LDA #$0040                                ; $05C910 |
  STA !s_spr_y_accel,x                      ; $05C913 |
  LDA #$8000                                ; $05C916 |
  STA !s_spr_wildcard_1_lo,x                ; $05C919 |
  STZ !s_spr_wildcard_2_lo,x                ; $05C91C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C91F |

CODE_05C921:
  RTS                                       ; $05C921 |

; bucket state 01
  TYX                                       ; $05C922 |
  LDA $7860,x                               ; $05C923 |
  AND #$0001                                ; $05C926 |
  BEQ CODE_05C943                           ; $05C929 |
  LDA #$4000                                ; $05C92B |
  STA !s_spr_bitwise_settings_3,x           ; $05C92E |
  LDA #$FC00                                ; $05C931 |
  STA !s_spr_y_speed_lo,x                   ; $05C934 |
  LDY #$03                                  ; $05C937 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05C939 |
  LDA #$002F                                ; $05C93B |\ play sound #$002F
  JSL push_sound_queue                      ; $05C93E |/
  RTS                                       ; $05C942 |

CODE_05C943:
  LDY $7862,x                               ; $05C943 |
  BEQ CODE_05C953                           ; $05C946 |
  LDA !s_spr_y_speed_lo,x                   ; $05C948 |
  LSR A                                     ; $05C94B |
  LSR A                                     ; $05C94C |
  LSR A                                     ; $05C94D |
  STA !s_spr_y_speed_lo,x                   ; $05C94E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05C951 |

CODE_05C953:
  RTS                                       ; $05C953 |

  dw $0200                                  ; $05C954 |
  dw $FF80                                  ; $05C956 |

; bucket state 02
  TYX                                       ; $05C958 |
  LDY #$02                                  ; $05C959 |
  LDA $7862,x                               ; $05C95B |
  AND #$00FF                                ; $05C95E |
  BNE CODE_05C965                           ; $05C961 |
  DEY                                       ; $05C963 |
  DEY                                       ; $05C964 |

CODE_05C965:
  LDA $C954,y                               ; $05C965 |
  STA !s_spr_y_accel_ceiling,x              ; $05C968 |
  LDA !s_spr_y_speed_lo,x                   ; $05C96B |
  BPL CODE_05C974                           ; $05C96E |
  EOR #$FFFF                                ; $05C970 |
  INC A                                     ; $05C973 |

CODE_05C974:
  CLC                                       ; $05C974 |
  ADC #$0080                                ; $05C975 |
  AND #$FF00                                ; $05C978 |
  XBA                                       ; $05C97B |
  ASL A                                     ; $05C97C |
  ASL A                                     ; $05C97D |
  ASL A                                     ; $05C97E |
  ASL A                                     ; $05C97F |
  CLC                                       ; $05C980 |
  ADC #$0010                                ; $05C981 |
  STA !s_spr_y_accel,x                      ; $05C984 |
  SEP #$20                                  ; $05C987 |
  LDA #$FF                                  ; $05C989 |
  STA $7862,x                               ; $05C98B |
  REP #$20                                  ; $05C98E |
  JSR CODE_05C9A4                           ; $05C990 |
  RTS                                       ; $05C993 |

  dw $FFF0                                  ; $05C994 |
  dw $0010                                  ; $05C996 |

  dw $0080                                  ; $05C998 |
  dw $FF80                                  ; $05C99A |

  dw $000C                                  ; $05C99C |
  dw $0002                                  ; $05C99E |

  dw $0008                                  ; $05C9A0 |
  dw $FFFE                                  ; $05C9A2 |

; bucket sub
CODE_05C9A4:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05C9A4 |
  LDA $C99C,y                               ; $05C9A6 |
  STA !s_spr_y_terrain_offset,x             ; $05C9A9 |
  LDY $60AB                                 ; $05C9AC |
  BMI CODE_05C9B6                           ; $05C9AF |
  LDY $0D94                                 ; $05C9B1 |
  BEQ CODE_05C9C4                           ; $05C9B4 |

CODE_05C9B6:
  CPX $61B6                                 ; $05C9B6 |
  BNE CODE_05C9C1                           ; $05C9B9 |
  STZ $61B6                                 ; $05C9BB |
  STZ !s_player_state                       ; $05C9BE |

CODE_05C9C1:
  JMP CODE_05CA90                           ; $05C9C1 |

CODE_05C9C4:
  CPX $61B6                                 ; $05C9C4 |
  BNE CODE_05C9DD                           ; $05C9C7 |
  LDA !s_spr_x_player_delta,x               ; $05C9C9 |
  SEC                                       ; $05C9CC |
  SBC !s_spr_x_delta_lo,x                   ; $05C9CD |
  STA !s_spr_x_player_delta,x               ; $05C9D0 |
  LDA !s_spr_y_player_delta,x               ; $05C9D3 |
  SEC                                       ; $05C9D6 |
  SBC !s_spr_y_delta_lo,x                   ; $05C9D7 |
  STA !s_spr_y_player_delta,x               ; $05C9DA |

CODE_05C9DD:
  LDA !s_spr_x_player_delta,x               ; $05C9DD |
  CLC                                       ; $05C9E0 |
  ADC #$0010                                ; $05C9E1 |
  CMP #$0020                                ; $05C9E4 |
  BCS CODE_05C9B6                           ; $05C9E7 |
  LDA !s_spr_y_player_delta,x               ; $05C9E9 |
  SEC                                       ; $05C9EC |
  SBC !s_player_hitbox_half_height          ; $05C9ED |
  CLC                                       ; $05C9F0 |
  ADC #$0008                                ; $05C9F1 |
  BPL CODE_05C9B6                           ; $05C9F4 |
  CMP #$FFF8                                ; $05C9F6 |
  BMI CODE_05C9B6                           ; $05C9F9 |
  STA $00                                   ; $05C9FB |
  LDY $61B6                                 ; $05C9FD |
  BNE CODE_05CA10                           ; $05CA00 |
  LDA !s_spr_x_player_delta,x               ; $05CA02 |
  STA !s_spr_wildcard_2_lo,x                ; $05CA05 |
  STX $61B6                                 ; $05CA08 |
  LDY #$02                                  ; $05CA0B |
  STY !s_player_state                       ; $05CA0D |

CODE_05CA10:
  CPX $61B6                                 ; $05CA10 |
  BNE CODE_05C9C1                           ; $05CA13 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05CA15 |
  LDA $C9A0,y                               ; $05CA17 |
  STA !s_spr_y_terrain_offset,x             ; $05CA1A |
  LDA $6086                                 ; $05CA1D |
  ORA $6088                                 ; $05CA20 |
  ORA #$0C00                                ; $05CA23 |
  AND !r_joy1_lo_mirror                     ; $05CA26 |
  STA $617A                                 ; $05CA29 |
  LDA !r_joy1_lo_press_mirror               ; $05CA2C |
  AND #$FCFF                                ; $05CA2F |
  STA $617C                                 ; $05CA32 |
  LDA $00                                   ; $05CA35 |
  CLC                                       ; $05CA37 |
  ADC !s_player_y                           ; $05CA38 |
  INC A                                     ; $05CA3B |
  SEC                                       ; $05CA3C |
  ADC !s_spr_y_delta_lo,x                   ; $05CA3D |
  STA !s_player_y                           ; $05CA40 |
  INC !s_on_sprite_platform_flag            ; $05CA43 |
  LDA #$0010                                ; $05CA46 |
  CMP !s_player_invincibility_timer         ; $05CA49 |
  BMI CODE_05CA51                           ; $05CA4C |
  STA !s_player_invincibility_timer         ; $05CA4E |

CODE_05CA51:
  STZ !s_player_x_speed_prev                ; $05CA51 |
  STZ !s_player_x_speed                     ; $05CA54 |
  STZ !s_player_y_speed                     ; $05CA57 |
  STZ !s_player_x_sub                       ; $05CA5A |
  STZ !s_player_y_sub                       ; $05CA5D |
  STZ !s_player_ground_pound_state          ; $05CA60 |
  LDA !s_spr_wildcard_2_lo,x                ; $05CA63 |
  CMP #$FFFD                                ; $05CA66 |
  BEQ CODE_05CA75                           ; $05CA69 |
  BPL CODE_05CA72                           ; $05CA6B |
  INC !s_spr_wildcard_2_lo,x                ; $05CA6D |
  BRA CODE_05CA75                           ; $05CA70 |

CODE_05CA72:
  DEC !s_spr_wildcard_2_lo,x                ; $05CA72 |

CODE_05CA75:
  LDA !s_spr_x_player_delta,x               ; $05CA75 |
  SEC                                       ; $05CA78 |
  SBC !s_spr_wildcard_2_lo,x                ; $05CA79 |
  CLC                                       ; $05CA7C |
  ADC !s_player_x                           ; $05CA7D |
  STA !s_player_x                           ; $05CA80 |
  LDY !s_player_mouth_state                 ; $05CA83 |
  BNE CODE_05CA90                           ; $05CA86 |
  LDA !r_joy1_hi_mirror                     ; $05CA88 |
  AND #$0003                                ; $05CA8B |
  BNE CODE_05CAC6                           ; $05CA8E |

CODE_05CA90:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05CA90 |
  BEQ CODE_05CAB2                           ; $05CA93 |
  BPL CODE_05CA9D                           ; $05CA95 |
  CLC                                       ; $05CA97 |
  ADC #$0080                                ; $05CA98 |
  BRA CODE_05CAA1                           ; $05CA9B |

CODE_05CA9D:
  SEC                                       ; $05CA9D |
  SBC #$0080                                ; $05CA9E |

CODE_05CAA1:
  STA !s_spr_gsu_morph_2_lo,x               ; $05CAA1 |
  CLC                                       ; $05CAA4 |
  ADC #$0080                                ; $05CAA5 |
  CMP #$0100                                ; $05CAA8 |
  BCS CODE_05CAB2                           ; $05CAAB |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05CAAD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05CAB0 |

CODE_05CAB2:
  STZ !s_spr_x_accel_ceiling,x              ; $05CAB2 |
  LDA !s_spr_x_speed_lo,x                   ; $05CAB5 |
  INC A                                     ; $05CAB8 |
  INC A                                     ; $05CAB9 |
  CMP #$0004                                ; $05CABA |
  BCS CODE_05CAC5                           ; $05CABD |
  STZ !s_spr_x_speed_lo,x                   ; $05CABF |
  STZ !s_spr_x_accel,x                      ; $05CAC2 |

CODE_05CAC5:
  RTS                                       ; $05CAC5 |

CODE_05CAC6:
  AND #$0002                                ; $05CAC6 |
  STA !s_player_direction                   ; $05CAC9 |
  TAY                                       ; $05CACC |
  LDA $C998,y                               ; $05CACD |
  STA !s_spr_x_accel_ceiling,x              ; $05CAD0 |
  LDA #$0002                                ; $05CAD3 |
  STA !s_spr_x_accel,x                      ; $05CAD6 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05CAD9 |
  CLC                                       ; $05CADB |
  ADC $C994,y                               ; $05CADC |
  CMP #$0100                                ; $05CADF |
  BMI CODE_05CAE7                           ; $05CAE2 |
  LDA #$0100                                ; $05CAE4 |

CODE_05CAE7:
  CMP #$FF00                                ; $05CAE7 |
  BPL CODE_05CAEF                           ; $05CAEA |
  LDA #$FF00                                ; $05CAEC |

CODE_05CAEF:
  STA !s_spr_wildcard_4_lo_dp,x             ; $05CAEF |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05CAF1 |
  CLC                                       ; $05CAF4 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $05CAF5 |
  CMP #$1000                                ; $05CAF7 |
  BMI CODE_05CAFF                           ; $05CAFA |
  LDA #$1000                                ; $05CAFC |

CODE_05CAFF:
  CMP #$F000                                ; $05CAFF |
  BPL CODE_05CB07                           ; $05CB02 |
  LDA #$F000                                ; $05CB04 |

CODE_05CB07:
  STA !s_spr_gsu_morph_2_lo,x               ; $05CB07 |
  RTS                                       ; $05CB0A |

init_freezegood:
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05CB0B |
  BEQ CODE_05CB25                           ; $05CB0D |
  JSL $03AD74                               ; $05CB0F |
  BCS CODE_05CB21                           ; $05CB13 |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05CB15 |
  LDA #$0000                                ; $05CB17 |
  STA !s_spr_gsu_morph_2_lo,y               ; $05CB1A |
  JML $03A31E                               ; $05CB1D |

CODE_05CB21:
  JSR CODE_05CC2E                           ; $05CB21 |
  RTL                                       ; $05CB24 |

CODE_05CB25:
  JSL $03AE60                               ; $05CB25 |
  JSR CODE_05CC2E                           ; $05CB29 |
  LDA !s_spr_x_pixel_pos,x                  ; $05CB2C |
  STA !s_spr_wildcard_1_lo,x                ; $05CB2F |
  STA $04                                   ; $05CB32 |
  LDA !s_spr_y_pixel_pos,x                  ; $05CB34 |
  STA !s_spr_wildcard_2_lo,x                ; $05CB37 |
  JSL $03D400                               ; $05CB3A |
  BNE CODE_05CB59                           ; $05CB3E |
  SEP #$20                                  ; $05CB40 |
  LDA !s_spr_x_pixel_pos,x                  ; $05CB42 |
  AND #$10                                  ; $05CB45 |
  LSR A                                     ; $05CB47 |
  LSR A                                     ; $05CB48 |
  LSR A                                     ; $05CB49 |
  STA $00                                   ; $05CB4A |
  LDA !s_spr_y_pixel_pos,x                  ; $05CB4C |
  AND #$10                                  ; $05CB4F |
  LSR A                                     ; $05CB51 |
  LSR A                                     ; $05CB52 |
  ORA $00                                   ; $05CB53 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05CB55 |
  REP #$20                                  ; $05CB57 |

CODE_05CB59:
  LDY #$02                                  ; $05CB59 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05CB5B |
  RTL                                       ; $05CB5D |

freezegood_state_ptr:
  dw $D0A8                                  ; $05CB5E |
  dw $D0C7                                  ; $05CB60 |
  dw $D0E4                                  ; $05CB62 |

main_freezegood:
  JSL $03AA52                               ; $05CB64 |
  LDA !s_spr_state,x                        ; $05CB68 |
  CMP #$0010                                ; $05CB6B |
  BEQ CODE_05CB7A                           ; $05CB6E |
  CMP #$0012                                ; $05CB70 |
  BNE CODE_05CB77                           ; $05CB73 |
  PLY                                       ; $05CB75 |
  PLA                                       ; $05CB76 |

CODE_05CB77:
  JSR CODE_05D152                           ; $05CB77 |

CODE_05CB7A:
  JSL $03AF23                               ; $05CB7A |
  JSR CODE_05CB93                           ; $05CB7E |
  JSR CODE_05CBBC                           ; $05CB81 |
  TXY                                       ; $05CB84 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05CB85 |
  ASL A                                     ; $05CB87 |
  TAX                                       ; $05CB88 |
  JSR ($CB5E,x)                             ; $05CB89 |
  JSR CODE_05CC1F                           ; $05CB8C |
  JSR CODE_05CC68                           ; $05CB8F |
  RTL                                       ; $05CB92 |

; freezegood sub
CODE_05CB93:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05CB93 |
  BIT #$FF00                                ; $05CB96 |
  BEQ CODE_05CB9E                           ; $05CB99 |
  ORA #$FF00                                ; $05CB9B |

CODE_05CB9E:
  STA $00                                   ; $05CB9E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05CBA0 |
  SEC                                       ; $05CBA3 |
  SBC $00                                   ; $05CBA4 |
  CMP #$8000                                ; $05CBA6 |
  ROR A                                     ; $05CBA9 |
  CMP #$8000                                ; $05CBAA |
  ROR A                                     ; $05CBAD |
  CLC                                       ; $05CBAE |
  ADC $00                                   ; $05CBAF |
  AND #$01FE                                ; $05CBB1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05CBB4 |

CODE_05CBB7:
  RTS                                       ; $05CBB7 |

  dw $FD00                                  ; $05CBB8 |
  dw $0300                                  ; $05CBBA |

; freezegood sub
CODE_05CBBC:
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05CBBC |
  BNE CODE_05CBB7                           ; $05CBBE |
  LDY !s_spr_ground_angle,x                 ; $05CBC0 |
  BEQ CODE_05CBD0                           ; $05CBC3 |
  PHP                                       ; $05CBC5 |
  LDY #$00                                  ; $05CBC6 |
  PLP                                       ; $05CBC8 |
  BPL CODE_05CBCD                           ; $05CBC9 |
  INY                                       ; $05CBCB |
  INY                                       ; $05CBCC |

CODE_05CBCD:
  LDA $CBB8,y                               ; $05CBCD |

CODE_05CBD0:
  STA !s_spr_x_accel_ceiling,x              ; $05CBD0 |
  LDA #$0000                                ; $05CBD3 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05CBD6 |
  BNE CODE_05CC06                           ; $05CBD8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05CBDA |
  LDY !s_spr_facing_dir,x                   ; $05CBDD |
  BEQ CODE_05CBE6                           ; $05CBE0 |
  EOR #$FFFF                                ; $05CBE2 |
  INC A                                     ; $05CBE5 |

CODE_05CBE6:
  AND #$01FE                                ; $05CBE6 |
  STA !gsu_r1                               ; $05CBE9 |
  LDA #$0020                                ; $05CBEC |
  STA !gsu_r6                               ; $05CBEF |
  LDX #$0B                                  ; $05CBF2 |
  LDA #$8595                                ; $05CBF4 |
  JSL r_gsu_init_1                          ; $05CBF7 | GSU init
  LDX $12                                   ; $05CBFB |
  LDA !gsu_r1                               ; $05CBFD |
  BPL CODE_05CC06                           ; $05CC00 |
  EOR #$FFFF                                ; $05CC02 |
  INC A                                     ; $05CC05 |

CODE_05CC06:
  CLC                                       ; $05CC06 |
  ADC #$0004                                ; $05CC07 |
  STA !s_spr_x_accel,x                      ; $05CC0A |
  LDA !s_spr_x_speed_lo,x                   ; $05CC0D |
  ASL A                                     ; $05CC10 |
  BPL CODE_05CC17                           ; $05CC11 |
  EOR #$FFFF                                ; $05CC13 |
  INC A                                     ; $05CC16 |

CODE_05CC17:
  XBA                                       ; $05CC17 |
  AND #$00FF                                ; $05CC18 |
  STA !s_spr_y_terrain_offset,x             ; $05CC1B |
  RTS                                       ; $05CC1E |

; freezegood sub
CODE_05CC1F:
  LDA !s_spr_dyntile_index,x                ; $05CC1F |
  LSR A                                     ; $05CC22 |
  LSR A                                     ; $05CC23 |
  LSR A                                     ; $05CC24 |
  SEC                                       ; $05CC25 |
  SBC !r_frame_counter_global               ; $05CC26 |
  AND #$0003                                ; $05CC29 |
  BNE CODE_05CC67                           ; $05CC2C |

CODE_05CC2E:
  LDA #$2041                                ; $05CC2E | entry
  STA !gsu_r12                              ; $05CC31 |
  LDA #$0054                                ; $05CC34 |
  STA !gsu_r13                              ; $05CC37 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05CC3A |
  LSR A                                     ; $05CC3D |
  STA !gsu_r5                               ; $05CC3E |
  LDA #$0100                                ; $05CC41 |
  STA !gsu_r6                               ; $05CC44 |
  LDY !s_spr_dyntile_index,x                ; $05CC47 |
  TYX                                       ; $05CC4A |
  LDA $03A9CE,x                             ; $05CC4B |
  STA !gsu_r3                               ; $05CC4F |
  LDA $03A9EE,x                             ; $05CC52 |
  STA !gsu_r2                               ; $05CC56 |
  LDX #$08                                  ; $05CC59 |
  LDA #$8205                                ; $05CC5B |
  JSL r_gsu_init_1                          ; $05CC5E | GSU init
  LDX $12                                   ; $05CC62 |
  INC $0CF9                                 ; $05CC64 |

CODE_05CC67:
  RTS                                       ; $05CC67 |

; freezegood sub
CODE_05CC68:
  LDY !s_spr_collision_id,x                 ; $05CC68 |
  BEQ CODE_05CC67                           ; $05CC6B |
  BMI CODE_05CCA6                           ; $05CC6D |
  SEP #$20                                  ; $05CC6F |
  LDA #$00                                  ; $05CC71 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $05CC73 |
  REP #$20                                  ; $05CC75 |
  LDA $6EFF,y                               ; $05CC77 |
  CMP #$0010                                ; $05CC7A |
  BNE CODE_05CC67                           ; $05CC7D |
  LDA $7D37,y                               ; $05CC7F |
  BEQ CODE_05CC67                           ; $05CC82 |
  LDA $7541,y                               ; $05CC84 |
  STA $00                                   ; $05CC87 |
  TYX                                       ; $05CC89 |
  DEX                                       ; $05CC8A |
  JSL $03B24B                               ; $05CC8B |
  BCC CODE_05CC9C                           ; $05CC8F |
  LDA !s_spr_bitwise_settings_1,x           ; $05CC91 |
  ORA #$0200                                ; $05CC94 |
  STA !s_spr_bitwise_settings_1,x           ; $05CC97 |
  PLA                                       ; $05CC9A |  \
  RTL                                       ; $05CC9B |/ back all the way out

CODE_05CC9C:
  LDA $00                                   ; $05CC9C |
  CMP #$0040                                ; $05CC9E |
  BCS CODE_05CC67                           ; $05CCA1 |
  JMP CODE_05D152                           ; $05CCA3 |

CODE_05CCA6:
  LDA !s_spr_y_player_delta,x               ; $05CCA6 |
  SEC                                       ; $05CCA9 |
  SBC !s_player_hitbox_half_height          ; $05CCAA |
  SEC                                       ; $05CCAD |
  SBC !s_spr_hitbox_height,x                ; $05CCAE |
  CMP #$FFF8                                ; $05CCB1 |
  BCC CODE_05CCD1                           ; $05CCB4 |
  LDY #$00                                  ; $05CCB6 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05CCB8 |
  LDY $60AB                                 ; $05CCBA |
  BMI CODE_05CD15                           ; $05CCBD |
  LDA #$0006                                ; $05CCBF |
  STA !s_player_jump_state                  ; $05CCC2 |
  LDA #$8001                                ; $05CCC5 |
  LDA #$FC00                                ; $05CCC8 |
  STA !s_player_y_speed                     ; $05CCCB |
  JMP CODE_05D152                           ; $05CCCE |

CODE_05CCD1:
  LDA !s_spr_x_player_delta,x               ; $05CCD1 |
  BPL CODE_05CCE0                           ; $05CCD4 |
  CLC                                       ; $05CCD6 |
  ADC !s_player_hitbox_half_width           ; $05CCD7 |
  CLC                                       ; $05CCDA |
  ADC !s_spr_hitbox_width,x                 ; $05CCDB |
  BRA CODE_05CCE8                           ; $05CCDE |

CODE_05CCE0:
  SEC                                       ; $05CCE0 |
  SBC !s_player_hitbox_half_width           ; $05CCE1 |
  SEC                                       ; $05CCE4 |
  SBC !s_spr_hitbox_width,x                 ; $05CCE5 |

CODE_05CCE8:
  STA $06                                   ; $05CCE8 |
  STZ $00                                   ; $05CCEA |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05CCEC |
  BEQ CODE_05CCF5                           ; $05CCEE |
  JSR CODE_05CD55                           ; $05CCF0 |
  BRA CODE_05CCF9                           ; $05CCF3 |

CODE_05CCF5:
  JSL $05CDF9                               ; $05CCF5 |

CODE_05CCF9:
  LDA !s_player_tile_collision              ; $05CCF9 |
  AND $00                                   ; $05CCFC |
  BEQ CODE_05CD14                           ; $05CCFE |
  LDA !s_spr_x_speed_lo,x                   ; $05CD00 |
  EOR #$FFFF                                ; $05CD03 |
  INC A                                     ; $05CD06 |
  CMP #$8000                                ; $05CD07 |
  ROR A                                     ; $05CD0A |
  STA !s_spr_x_speed_lo,x                   ; $05CD0B |
  LDA $603E                                 ; $05CD0E |
  STA !s_player_x                           ; $05CD11 |

CODE_05CD14:
  RTS                                       ; $05CD14 |

CODE_05CD15:
  LDA !s_player_x_speed_prev                ; $05CD15 |
  SEC                                       ; $05CD18 |
  SBC !s_spr_x_speed_lo,x                   ; $05CD19 |
  CMP #$8000                                ; $05CD1C |
  ROR A                                     ; $05CD1F |
  CMP #$8000                                ; $05CD20 |
  ROR A                                     ; $05CD23 |
  CLC                                       ; $05CD24 |
  ADC !s_spr_x_speed_lo,x                   ; $05CD25 |
  STA !s_spr_x_speed_lo,x                   ; $05CD28 |
  LDA #$FE00                                ; $05CD2B |
  LDY !s_spr_x_player_dir,x                 ; $05CD2E |
  BEQ CODE_05CD36                           ; $05CD31 |
  LDA #$0200                                ; $05CD33 |

CODE_05CD36:
  STA !s_player_x_speed_prev                ; $05CD36 |
  STA !s_player_x_speed                     ; $05CD39 |
  LDA #$FC00                                ; $05CD3C |
  STA !s_player_y_speed                     ; $05CD3F |
  LDA #$0006                                ; $05CD42 |
  STA !s_player_jump_state                  ; $05CD45 |
  RTS                                       ; $05CD48 |

  dw $0280                                  ; $05CD49 |
  dw $FD80                                  ; $05CD4B |

  dw $0002                                  ; $05CD4D |
  dw $FFFE                                  ; $05CD4F |

  dw $0180                                  ; $05CD51 |
  dw $0060                                  ; $05CD53 |

; freezegood sub
CODE_05CD55:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05CD55 |
  AND #$FF00                                ; $05CD57 |
  STA $04                                   ; $05CD5A |
  LDA !r_joy1_lo_mirror                     ; $05CD5C |
  BIT $04                                   ; $05CD5F |
  BEQ CODE_05CD68                           ; $05CD61 |
  AND $6084                                 ; $05CD63 |
  BEQ CODE_05CD7F                           ; $05CD66 |

CODE_05CD68:
  LDA !s_player_x                           ; $05CD68 |
  CLC                                       ; $05CD6B |
  ADC $06                                   ; $05CD6C |
  STA !s_player_x                           ; $05CD6E |
  LDA !s_spr_x_speed_lo,x                   ; $05CD71 |
  STA !s_player_x_speed_prev                ; $05CD74 |
  STA !s_player_x_speed                     ; $05CD77 |
  LDY #$00                                  ; $05CD7A |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05CD7C |
  RTS                                       ; $05CD7E |

CODE_05CD7F:
  LDA $05                                   ; $05CD7F |
  AND #$0002                                ; $05CD81 |
  TAY                                       ; $05CD84 |
  LDA !s_player_x                           ; $05CD85 |
  CLC                                       ; $05CD88 |
  ADC $06                                   ; $05CD89 |
  CLC                                       ; $05CD8B |
  ADC $CD4D,y                               ; $05CD8C |
  STA !s_player_x                           ; $05CD8F |
  LDA !s_spr_x_player_delta,x               ; $05CD92 |
  EOR !s_spr_x_speed_lo,x                   ; $05CD95 |
  BPL CODE_05CD9F                           ; $05CD98 |
  LDA $CD51,y                               ; $05CD9A |
  STA $00                                   ; $05CD9D |

CODE_05CD9F:
  LDA !s_spr_x_speed_lo,x                   ; $05CD9F |
  BEQ CODE_05CDAD                           ; $05CDA2 |
  SEC                                       ; $05CDA4 |
  SBC !s_player_x_speed_prev                ; $05CDA5 |
  EOR !s_spr_x_player_delta,x               ; $05CDA8 |
  BPL CODE_05CDF5                           ; $05CDAB |

CODE_05CDAD:
  LDA !s_egg_throw_state                    ; $05CDAD |
  ORA !s_player_mouth_state                 ; $05CDB0 |
  BNE CODE_05CDF8                           ; $05CDB3 |
  INC $61C2                                 ; $05CDB5 |
  LDA !s_player_x_speed_prev                ; $05CDB8 |
  SEC                                       ; $05CDBB |
  SBC !s_spr_x_speed_lo,x                   ; $05CDBC |
  STA !gsu_r0                               ; $05CDBF |
  LDA #$0010                                ; $05CDC2 |
  STA !gsu_r6                               ; $05CDC5 |
  LDX #$0B                                  ; $05CDC8 |
  LDA #$86B6                                ; $05CDCA |
  JSL r_gsu_init_1                          ; $05CDCD | GSU init
  LDX $12                                   ; $05CDD1 |
  LDA !gsu_r0                               ; $05CDD3 |
  CLC                                       ; $05CDD6 |
  ADC !s_spr_x_speed_lo,x                   ; $05CDD7 |
  STA $0E                                   ; $05CDDA |
  CLC                                       ; $05CDDC |
  ADC #$0280                                ; $05CDDD |
  LDY #$00                                  ; $05CDE0 |
  CMP #$0500                                ; $05CDE2 |
  BCC CODE_05CDF0                           ; $05CDE5 |
  BPL CODE_05CDEB                           ; $05CDE7 |
  INY                                       ; $05CDE9 |
  INY                                       ; $05CDEA |

CODE_05CDEB:
  LDA $CD49,y                               ; $05CDEB |
  STA $0E                                   ; $05CDEE |

CODE_05CDF0:
  LDA $0E                                   ; $05CDF0 |
  STA !s_spr_x_speed_lo,x                   ; $05CDF2 |

CODE_05CDF5:
  INC !s_player_pushing_counter             ; $05CDF5 |

CODE_05CDF8:
  RTS                                       ; $05CDF8 |

; freezegood sub
  LDY !s_player_jump_state                  ; $05CDF9 |
  BEQ CODE_05CE01                           ; $05CDFC |
  JMP CODE_05CE4B                           ; $05CDFE |

CODE_05CE01:
  LDA !s_spr_x_speed_lo,x                   ; $05CE01 |
  BNE CODE_05CE0E                           ; $05CE04 |
  LDA !s_player_x_speed_prev                ; $05CE06 |
  BNE CODE_05CE21                           ; $05CE09 |
  JMP CODE_05CFF0                           ; $05CE0B |

CODE_05CE0E:
  LDA !s_player_x_speed_prev                ; $05CE0E |
  BNE CODE_05CE1C                           ; $05CE11 |
  LDA !s_spr_x_player_delta,x               ; $05CE13 |
  EOR !s_spr_x_speed_lo,x                   ; $05CE16 |
  BMI CODE_05CE4B                           ; $05CE19 |

CODE_05CE1B:
  RTL                                       ; $05CE1B |

CODE_05CE1C:
  EOR !s_spr_x_speed_lo,x                   ; $05CE1C |
  BPL CODE_05CE2C                           ; $05CE1F |

CODE_05CE21:
  LDA !s_spr_x_player_delta,x               ; $05CE21 |
  EOR !s_player_x_speed_prev                ; $05CE24 |
  BMI CODE_05CE1B                           ; $05CE27 |
  JMP CODE_05CF16                           ; $05CE29 |

CODE_05CE2C:
  LDA !s_spr_x_speed_lo,x                   ; $05CE2C |
  SEC                                       ; $05CE2F |
  SBC !s_player_x_speed_prev                ; $05CE30 |
  EOR !s_player_x_speed_prev                ; $05CE33 |
  BPL CODE_05CE43                           ; $05CE36 |
  LDA !s_spr_x_player_delta,x               ; $05CE38 |
  EOR !s_player_x_speed_prev                ; $05CE3B |
  BMI CODE_05CE21                           ; $05CE3E |
  JMP CODE_05CF16                           ; $05CE40 |

CODE_05CE43:
  LDA !s_spr_x_player_delta,x               ; $05CE43 |
  EOR !s_player_x_speed_prev                ; $05CE46 |
  BPL CODE_05CE21                           ; $05CE49 |

CODE_05CE4B:
  LDA !r_joy1_lo_mirror                     ; $05CE4B |
  AND #$0300                                ; $05CE4E |
  BEQ CODE_05CE7A                           ; $05CE51 |
  AND #$0200                                ; $05CE53 |
  DEC A                                     ; $05CE56 |
  EOR !s_spr_x_player_delta,x               ; $05CE57 |
  BPL CODE_05CE7A                           ; $05CE5A |
  LDA !s_player_x_speed_prev                ; $05CE5C |
  BPL CODE_05CE65                           ; $05CE5F |
  EOR #$FFFF                                ; $05CE61 |
  INC A                                     ; $05CE64 |

CODE_05CE65:
  AND #$FF00                                ; $05CE65 |
  XBA                                       ; $05CE68 |
  INC A                                     ; $05CE69 |
  LDY !s_spr_x_player_dir,x                 ; $05CE6A |
  BEQ CODE_05CE73                           ; $05CE6D |
  EOR #$FFFF                                ; $05CE6F |
  INC A                                     ; $05CE72 |

CODE_05CE73:
  CLC                                       ; $05CE73 |
  ADC !s_spr_x_speed_lo,x                   ; $05CE74 |
  STA !s_spr_x_speed_lo,x                   ; $05CE77 |

CODE_05CE7A:
  LDA #$0160                                ; $05CE7A |
  STA $093A                                 ; $05CE7D |
  LDA !s_player_jump_state                  ; $05CE80 |
  ORA !s_player_form                        ; $05CE83 |
  ORA !s_egg_throw_state                    ; $05CE86 |
  ORA !s_player_mouth_state                 ; $05CE89 |
  BNE CODE_05CE9F                           ; $05CE8C |
  LDA $7974                                 ; $05CE8E |
  AND #$0007                                ; $05CE91 |
  ASL A                                     ; $05CE94 |
  TAX                                       ; $05CE95 |
  LDA $0AF6AF,x                             ; $05CE96 |
  STA !s_player_cur_anim_frame              ; $05CE9A |
  LDX $12                                   ; $05CE9D |

CODE_05CE9F:
  LDY !s_spr_x_player_dir,x                 ; $05CE9F |
  TYA                                       ; $05CEA2 |
  EOR #$0002                                ; $05CEA3 |
  DEC A                                     ; $05CEA6 |
  ASL A                                     ; $05CEA7 |
  CLC                                       ; $05CEA8 |
  ADC $06                                   ; $05CEA9 |
  STA !gsu_r12                              ; $05CEAB |
  LDA !s_player_hitbox_half_width           ; $05CEAE |
  LDY !s_spr_x_player_dir,x                 ; $05CEB1 |
  BNE CODE_05CEBA                           ; $05CEB4 |
  EOR #$FFFF                                ; $05CEB6 |
  INC A                                     ; $05CEB9 |

CODE_05CEBA:
  CLC                                       ; $05CEBA |
  ADC !s_player_center_x                    ; $05CEBB |
  STA $02                                   ; $05CEBE |
  STA $6020                                 ; $05CEC0 |
  STA $6024                                 ; $05CEC3 |
  LDA !s_player_center_y                    ; $05CEC6 |
  SEC                                       ; $05CEC9 |
  SBC #$0004                                ; $05CECA |
  STA $6022                                 ; $05CECD |
  CLC                                       ; $05CED0 |
  ADC #$0008                                ; $05CED1 |
  STA $6026                                 ; $05CED4 |
  STZ !gsu_r9                               ; $05CED7 |
  LDX #$0A                                  ; $05CEDA |
  LDA #$EA19                                ; $05CEDC |
  JSL r_gsu_init_3                          ; $05CEDF | GSU init
  LDX $12                                   ; $05CEE3 |
  LDA $6020                                 ; $05CEE5 |
  SEC                                       ; $05CEE8 |
  SBC $02                                   ; $05CEE9 |
  CLC                                       ; $05CEEB |
  ADC !s_player_x                           ; $05CEEC |
  STA !s_player_x                           ; $05CEEF |
  LDA !gsu_r12                              ; $05CEF2 |
  BEQ CODE_05CF15                           ; $05CEF5 |
  LDY !s_spr_x_player_dir,x                 ; $05CEF7 |
  TYA                                       ; $05CEFA |
  DEC A                                     ; $05CEFB |
  EOR !s_spr_x_speed_lo,x                   ; $05CEFC |
  BMI CODE_05CF15                           ; $05CEFF |
  LDA !s_spr_x_speed_lo,x                   ; $05CF01 |
  CMP #$8000                                ; $05CF04 |
  ROR A                                     ; $05CF07 |
  EOR #$FFFF                                ; $05CF08 |
  INC A                                     ; $05CF0B |
  STA !s_spr_x_speed_lo,x                   ; $05CF0C |
  STZ !s_player_x_speed_prev                ; $05CF0F |
  STZ !s_player_x_speed                     ; $05CF12 |

CODE_05CF15:
  RTL                                       ; $05CF15 |

CODE_05CF16:
  LDA !r_joy1_lo_mirror                     ; $05CF16 |
  AND #$0300                                ; $05CF19 |
  BNE CODE_05CF21                           ; $05CF1C |
  JMP CODE_05CE4B                           ; $05CF1E |

CODE_05CF21:
  AND #$0200                                ; $05CF21 |
  DEC A                                     ; $05CF24 |
  EOR !s_spr_x_player_delta,x               ; $05CF25 |
  BMI CODE_05CF2D                           ; $05CF28 |
  JMP CODE_05CE9F                           ; $05CF2A |

CODE_05CF2D:
  LDA !s_spr_x_speed_lo,x                   ; $05CF2D |
  BEQ CODE_05CF37                           ; $05CF30 |
  EOR !s_player_x_speed_prev                ; $05CF32 |
  BPL CODE_05CF55                           ; $05CF35 |

CODE_05CF37:
  LDA !s_player_x_speed_prev                ; $05CF37 |
  CMP #$8000                                ; $05CF3A |
  ROR A                                     ; $05CF3D |
  CMP #$8000                                ; $05CF3E |
  ROR A                                     ; $05CF41 |
  CMP #$8000                                ; $05CF42 |
  ROR A                                     ; $05CF45 |
  LDY !s_player_jump_state                  ; $05CF46 |
  BEQ CODE_05CF68                           ; $05CF49 |
  CMP #$8000                                ; $05CF4B |
  ROR A                                     ; $05CF4E |
  CMP #$8000                                ; $05CF4F |
  ROR A                                     ; $05CF52 |
  BRA CODE_05CF68                           ; $05CF53 |

CODE_05CF55:
  LDA !s_player_x_speed_prev                ; $05CF55 |
  AND #$FF00                                ; $05CF58 |
  XBA                                       ; $05CF5B |
  TAY                                       ; $05CF5C |
  BPL CODE_05CF62                           ; $05CF5D |
  ORA #$FF00                                ; $05CF5F |

CODE_05CF62:
  LDY !s_player_jump_state                  ; $05CF62 |
  BNE CODE_05CF68                           ; $05CF65 |
  ASL A                                     ; $05CF67 |

CODE_05CF68:
  CLC                                       ; $05CF68 |
  ADC !s_spr_x_speed_lo,x                   ; $05CF69 |
  STA $08                                   ; $05CF6C |
  LDA !s_spr_x_speed_lo,x                   ; $05CF6E |
  BEQ CODE_05CF8C                           ; $05CF71 |
  EOR !s_player_x_speed_prev                ; $05CF73 |
  BPL CODE_05CF8C                           ; $05CF76 |
  LDA !s_spr_x_speed_lo,x                   ; $05CF78 |
  SEC                                       ; $05CF7B |
  SBC !s_player_x_speed_prev                ; $05CF7C |
  CLC                                       ; $05CF7F |
  ADC #$0200                                ; $05CF80 |
  CMP #$0400                                ; $05CF83 |
  BCC CODE_05CF8C                           ; $05CF86 |
  JSR CODE_05CD15                           ; $05CF88 |
  RTL                                       ; $05CF8B |

CODE_05CF8C:
  LDA $08                                   ; $05CF8C |
  STA !s_spr_x_speed_lo,x                   ; $05CF8E |
  STA !s_player_x_speed_prev                ; $05CF91 |
  STA !s_player_x_speed                     ; $05CF94 |
  INC !s_spr_wildcard_4_hi_dp,x             ; $05CF97 |
  LDA !s_spr_id,x                           ; $05CF99 |
  CMP #$001C                                ; $05CF9C |
  BNE CODE_05CFB8                           ; $05CF9F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $05CFA1 |
  LDA !r_joy1_lo_mirror                     ; $05CFA3 |
  AND #$0300                                ; $05CFA6 |
  CMP #$0300                                ; $05CFA9 |
  BNE CODE_05CFB1                           ; $05CFAC |
  AND #$0100                                ; $05CFAE |

CODE_05CFB1:
  ORA #$0010                                ; $05CFB1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05CFB4 |
  BRA CODE_05CFF0                           ; $05CFB6 |

CODE_05CFB8:
  TAY                                       ; $05CFB8 |
  PHY                                       ; $05CFB9 |
  STZ !s_spr_wildcard_1_lo,x                ; $05CFBA |
  LDA #$0010                                ; $05CFBD |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05CFC0 |
  LDA !r_joy1_lo_mirror                     ; $05CFC2 |
  AND #$0300                                ; $05CFC5 |
  CMP #$0300                                ; $05CFC8 |
  BNE CODE_05CFD0                           ; $05CFCB |
  AND #$0100                                ; $05CFCD |

CODE_05CFD0:
  PLY                                       ; $05CFD0 |
  CPY #$9E                                  ; $05CFD1 |
  BEQ CODE_05CFDA                           ; $05CFD3 |
  STA !s_spr_wildcard_2_lo,x                ; $05CFD5 |
  BRA CODE_05CFDD                           ; $05CFD8 |

CODE_05CFDA:
  STA !s_spr_gsu_morph_1_lo,x               ; $05CFDA |

CODE_05CFDD:
  LDY !s_spr_ground_angle,x                 ; $05CFDD |
  BEQ CODE_05CFE5                           ; $05CFE0 |
  JMP CODE_05CE9F                           ; $05CFE2 |

CODE_05CFE5:
  LDY !s_spr_x_player_dir,x                 ; $05CFE5 |
  TYA                                       ; $05CFE8 |
  DEC A                                     ; $05CFE9 |
  ASL A                                     ; $05CFEA |
  SEC                                       ; $05CFEB |
  SBC $06                                   ; $05CFEC |
  BRA CODE_05CFF6                           ; $05CFEE |

CODE_05CFF0:
  LDA $06                                   ; $05CFF0 |
  EOR #$FFFF                                ; $05CFF2 |
  INC A                                     ; $05CFF5 |

CODE_05CFF6:
  STA !gsu_r12                              ; $05CFF6 |
  STA $02                                   ; $05CFF9 |
  LDA !s_spr_hitbox_width,x                 ; $05CFFB |
  LDY !s_spr_x_player_dir,x                 ; $05CFFE |
  BEQ CODE_05D007                           ; $05D001 |
  EOR #$FFFF                                ; $05D003 |
  INC A                                     ; $05D006 |

CODE_05D007:
  CLC                                       ; $05D007 |
  ADC !s_spr_x_hitbox_center,x              ; $05D008 |
  STA $02                                   ; $05D00B |
  STA $6020                                 ; $05D00D |
  STA $6024                                 ; $05D010 |
  LDA !s_spr_y_hitbox_center,x              ; $05D013 |
  SEC                                       ; $05D016 |
  SBC #$0004                                ; $05D017 |
  STA $6022                                 ; $05D01A |
  CLC                                       ; $05D01D |
  ADC #$0008                                ; $05D01E |
  STA $6026                                 ; $05D021 |
  STZ !gsu_r9                               ; $05D024 |
  LDX #$0A                                  ; $05D027 |
  LDA #$EA19                                ; $05D029 |
  JSL r_gsu_init_3                          ; $05D02C | GSU init
  LDX $12                                   ; $05D030 |
  LDA $6020                                 ; $05D032 |
  SEC                                       ; $05D035 |
  SBC $02                                   ; $05D036 |
  CLC                                       ; $05D038 |
  ADC !s_spr_x_pixel_pos,x                  ; $05D039 |
  STA !s_spr_x_pixel_pos,x                  ; $05D03C |
  LDA !gsu_r12                              ; $05D03F |
  BEQ CODE_05D0A7                           ; $05D042 |
  LDY $07                                   ; $05D044 |
  BPL CODE_05D04C                           ; $05D046 |
  EOR #$FFFF                                ; $05D048 |
  INC A                                     ; $05D04B |

CODE_05D04C:
  STA !gsu_r12                              ; $05D04C |
  LDA !s_player_hitbox_half_width           ; $05D04F |
  LDY !s_spr_x_player_dir,x                 ; $05D052 |
  BNE CODE_05D05B                           ; $05D055 |
  EOR #$FFFF                                ; $05D057 |
  INC A                                     ; $05D05A |

CODE_05D05B:
  CLC                                       ; $05D05B |
  ADC !s_player_center_x                    ; $05D05C |
  STA $02                                   ; $05D05F |
  STA $6020                                 ; $05D061 |
  STA $6024                                 ; $05D064 |
  LDA !s_player_center_y                    ; $05D067 |
  SEC                                       ; $05D06A |
  SBC #$0004                                ; $05D06B |
  STA $6022                                 ; $05D06E |
  CLC                                       ; $05D071 |
  ADC #$0008                                ; $05D072 |
  STA $6026                                 ; $05D075 |
  STZ !gsu_r9                               ; $05D078 |
  LDX #$0A                                  ; $05D07B |
  LDA #$EA19                                ; $05D07D |
  JSL r_gsu_init_3                          ; $05D080 | GSU init
  LDX $12                                   ; $05D084 |
  LDA $6020                                 ; $05D086 |
  SEC                                       ; $05D089 |
  SBC $02                                   ; $05D08A |
  CLC                                       ; $05D08C |
  ADC !s_player_x                           ; $05D08D |
  STA !s_player_x                           ; $05D090 |
  LDA !s_spr_x_speed_lo,x                   ; $05D093 |
  CMP #$8000                                ; $05D096 |
  ROR A                                     ; $05D099 |
  EOR #$FFFF                                ; $05D09A |
  INC A                                     ; $05D09D |
  STA !s_spr_x_speed_lo,x                   ; $05D09E |
  STZ !s_player_x_speed_prev                ; $05D0A1 |
  STZ !s_player_x_speed                     ; $05D0A4 |

CODE_05D0A7:
  RTL                                       ; $05D0A7 |

; freezegood state 00
  TYX                                       ; $05D0A8 |
  LDA !s_spr_x_player_delta,x               ; $05D0A9 |
  CLC                                       ; $05D0AC |
  ADC #$0040                                ; $05D0AD |
  CMP #$0080                                ; $05D0B0 |
  BCS CODE_05D0C6                           ; $05D0B3 |
  LDY !s_spr_x_player_dir,x                 ; $05D0B5 |
  TYA                                       ; $05D0B8 |
  CMP !s_spr_facing_dir,x                   ; $05D0B9 |
  BEQ CODE_05D0C6                           ; $05D0BC |
  LDA #$0040                                ; $05D0BE |
  STA !s_spr_timer_1,x                      ; $05D0C1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05D0C4 |

CODE_05D0C6:
  RTS                                       ; $05D0C6 |

; freezegood state 01
  TYX                                       ; $05D0C7 |
  LDA !s_spr_timer_1,x                      ; $05D0C8 |
  BNE CODE_05D0E3                           ; $05D0CB |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05D0CD |
  LDA #$0000                                ; $05D0CF |
  STA !s_spr_gsu_morph_2_lo,y               ; $05D0D2 |
  TAY                                       ; $05D0D5 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05D0D6 |
  LDA !s_spr_oam_1,x                        ; $05D0D8 |
  ORA #$0004                                ; $05D0DB |
  STA !s_spr_oam_1,x                        ; $05D0DE |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05D0E1 |

CODE_05D0E3:
  RTS                                       ; $05D0E3 |

; freezegood state 02
  TYX                                       ; $05D0E4 |
  LDA $7860,x                               ; $05D0E5 |
  BIT #$0001                                ; $05D0E8 |
  BEQ CODE_05D13F                           ; $05D0EB |
  LDA !s_spr_ground_angle,x                 ; $05D0ED |
  ASL A                                     ; $05D0F0 |
  PHP                                       ; $05D0F1 |
  BIT #$FF00                                ; $05D0F2 |
  BEQ CODE_05D0FA                           ; $05D0F5 |
  ORA #$FF00                                ; $05D0F7 |

CODE_05D0FA:
  LDY !s_spr_facing_dir,x                   ; $05D0FA |
  BEQ CODE_05D103                           ; $05D0FD |
  EOR #$FFFF                                ; $05D0FF |
  INC A                                     ; $05D102 |

CODE_05D103:
  STA !s_spr_gsu_morph_2_lo,x               ; $05D103 |
  PLP                                       ; $05D106 |
  BNE CODE_05D124                           ; $05D107 |
  LDA !s_spr_x_speed_lo,x                   ; $05D109 |
  CLC                                       ; $05D10C |
  ADC #$0010                                ; $05D10D |
  CMP #$0020                                ; $05D110 |
  BCS CODE_05D124                           ; $05D113 |
  STZ !s_spr_x_speed_lo,x                   ; $05D115 |
  STZ !s_spr_x_accel,x                      ; $05D118 |
  LDY !s_spr_x_player_dir,x                 ; $05D11B |
  TYA                                       ; $05D11E |
  STA !s_spr_facing_dir,x                   ; $05D11F |
  BRA CODE_05D13F                           ; $05D122 |

CODE_05D124:
  LDY !s_spr_y_terrain_offset,x             ; $05D124 |
  CPY #$04                                  ; $05D127 |
  BPL CODE_05D12E                           ; $05D129 |
  INC !s_spr_y_terrain_offset,x             ; $05D12B |

CODE_05D12E:
  LDA $7860,x                               ; $05D12E |
  BIT #$000C                                ; $05D131 |
  BEQ CODE_05D13F                           ; $05D134 |
  JMP CODE_05D152                           ; $05D136 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05D139 |
  STZ !s_spr_y_terrain_offset,x             ; $05D13C |

CODE_05D13F:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05D13F |
  CPY #$06                                  ; $05D141 |
  BNE CODE_05D151                           ; $05D143 |
  LDA !s_spr_x_player_delta,x               ; $05D145 |
  CLC                                       ; $05D148 |
  ADC #$0030                                ; $05D149 |
  CMP #$0060                                ; $05D14C |
  BCC CODE_05D152                           ; $05D14F |

CODE_05D151:
  RTS                                       ; $05D151 |

CODE_05D152:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05D152 |
  BEQ CODE_05D18B                           ; $05D154 |
  DEY                                       ; $05D156 |
  DEY                                       ; $05D157 |
  BNE CODE_05D160                           ; $05D158 |
  JSL $0D9329                               ; $05D15A |
  BRA CODE_05D17F                           ; $05D15E |

CODE_05D160:
  DEY                                       ; $05D160 |
  DEY                                       ; $05D161 |
  BNE CODE_05D16A                           ; $05D162 |
  JSL $03A496                               ; $05D164 |
  BRA CODE_05D17F                           ; $05D168 |

CODE_05D16A:
  LDA #$019B                                ; $05D16A |
  JSL spawn_sprite_init                     ; $05D16D |
  BCC CODE_05D151                           ; $05D171 |
  LDA !s_spr_x_pixel_pos,x                  ; $05D173 |
  STA !s_spr_x_pixel_pos,y                  ; $05D176 |
  LDA !s_spr_y_pixel_pos,x                  ; $05D179 |
  STA !s_spr_y_pixel_pos,y                  ; $05D17C |

CODE_05D17F:
  LDA !s_spr_wildcard_1_lo,x                ; $05D17F |
  STA $04                                   ; $05D182 |
  LDA !s_spr_wildcard_2_lo,x                ; $05D184 |
  JSL $03D3F3                               ; $05D187 |

CODE_05D18B:
  LDA #$01CC                                ; $05D18B |
  JSL spawn_ambient_sprite                  ; $05D18E |
  LDA #$0008                                ; $05D192 |
  STA $7E4C,y                               ; $05D195 |
  LDA #$0001                                ; $05D198 |
  STA $7782,y                               ; $05D19B |
  LDA !s_spr_x_pixel_pos,x                  ; $05D19E |
  STA $70A2,y                               ; $05D1A1 |
  LDA !s_spr_y_pixel_pos,x                  ; $05D1A4 |
  STA $7142,y                               ; $05D1A7 |
  LDA !s_spr_x_speed_lo,x                   ; $05D1AA |
  STA $71E0,y                               ; $05D1AD |
  LDA !s_spr_y_speed_lo,x                   ; $05D1B0 |
  BPL CODE_05D1B8                           ; $05D1B3 |
  LDA #$0000                                ; $05D1B5 |

CODE_05D1B8:
  STA $71E2,y                               ; $05D1B8 |
  LDA #$0037                                ; $05D1BB |\ play sound #$0037
  JSL push_sound_queue                      ; $05D1BE |/
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05D1C2 |
  BEQ CODE_05D1CC                           ; $05D1C4 |
  LDA #$0000                                ; $05D1C6 |
  STA !s_spr_gsu_morph_2_lo,y               ; $05D1C9 |

CODE_05D1CC:
  PLA                                       ; $05D1CC |
  JML $03A31E                               ; $05D1CD |

  dw $0022, $0024, $0020                    ; $05D1D1 |

; regular, biting, and bouncing
init_bullet_bill_blaster:
  LDA #$0100                                ; $05D1D7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05D1DA |
  LDA !s_spr_id,x                           ; $05D1DD |
  SEC                                       ; $05D1E0 |
  SBC #$0078                                ; $05D1E1 |
  ASL A                                     ; $05D1E4 |
  TAY                                       ; $05D1E5 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05D1E6 |
  LDA $D1D1,y                               ; $05D1E8 |
  STA !s_spr_oam_yxppccct,x                 ; $05D1EB |
  CPY #$02                                  ; $05D1EE |
  BNE CODE_05D22E                           ; $05D1F0 |
  JSL $03AE60                               ; $05D1F2 |
  LDY #$04                                  ; $05D1F6 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05D1F8 |
  JSR CODE_05D32B                           ; $05D1FA |
  LDA !s_spr_x_player_delta,x               ; $05D1FD |
  STA !gsu_r1                               ; $05D200 |
  LDA !s_spr_y_player_delta,x               ; $05D203 |
  STA !gsu_r2                               ; $05D206 |
  LDX #$0B                                  ; $05D209 |
  LDA #$BCF8                                ; $05D20B |
  JSL r_gsu_init_1                          ; $05D20E | GSU init
  LDX $12                                   ; $05D212 |
  LDA !gsu_r0                               ; $05D214 |
  STA !s_spr_wildcard_2_lo,x                ; $05D217 |
  SEC                                       ; $05D21A |
  SBC #$0080                                ; $05D21B |
  CMP #$0100                                ; $05D21E |
  BCS CODE_05D228                           ; $05D221 |
  STZ !s_spr_facing_dir,x                   ; $05D223 |
  BRA CODE_05D22E                           ; $05D226 |

CODE_05D228:
  LDA #$0002                                ; $05D228 |
  STA !s_spr_facing_dir,x                   ; $05D22B |

CODE_05D22E:
  LDA #$FFFF                                ; $05D22E |
  STA !s_spr_wildcard_1_lo,x                ; $05D231 |
  TAY                                       ; $05D234 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05D235 |
  RTL                                       ; $05D237 |

  dw $D4FA                                  ; $05D238 |
  dw $D577                                  ; $05D23A |
  dw $D5A1                                  ; $05D23C |

  dw $0010, $FFF0                           ; $05D23E |

  dw $FFF8, $0008                           ; $05D242 |

; regular, biting, and bouncing
main_bullet_bill_blaster:
  JSR CODE_05D2B9                           ; $05D246 |
  LDY !s_spr_wildcard_1_hi,x                ; $05D249 |
  BMI CODE_05D275                           ; $05D24C |
  LDA !s_spr_timer_frozen,x                 ; $05D24E |
  BNE CODE_05D260                           ; $05D251 |
  LDA !s_spr_state,x                        ; $05D253 |
  CMP #$0010                                ; $05D256 |
  BNE CODE_05D260                           ; $05D259 |
  LDA $0B65                                 ; $05D25B |
  BEQ CODE_05D26F                           ; $05D25E |

CODE_05D260:
  TYX                                       ; $05D260 |
  JSL $03A31E                               ; $05D261 |
  LDX $12                                   ; $05D265 |
  LDA #$FFFF                                ; $05D267 |
  STA !s_spr_wildcard_1_lo,x                ; $05D26A |
  BRA CODE_05D275                           ; $05D26D |

CODE_05D26F:
  LDA #$0002                                ; $05D26F |
  STA !s_spr_state,y                        ; $05D272 |

CODE_05D275:
  JSL $03AF23                               ; $05D275 |
  JSR CODE_05D37E                           ; $05D279 |
  TXY                                       ; $05D27C |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05D27D |
  AND #$00FF                                ; $05D27F |
  ASL A                                     ; $05D282 |
  TAX                                       ; $05D283 |
  JSR ($D238,x)                             ; $05D284 |
  JSR CODE_05D32B                           ; $05D287 |
  JSR CODE_05D43A                           ; $05D28A |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05D28D |
  CPY #$02                                  ; $05D28F |
  BNE CODE_05D2B8                           ; $05D291 |
  LDY !s_spr_wildcard_1_lo,x                ; $05D293 |
  BMI CODE_05D2B8                           ; $05D296 |
  LDA !s_spr_id,y                           ; $05D298 |
  CMP #$007C                                ; $05D29B |
  BNE CODE_05D2B2                           ; $05D29E |
  LDA !s_spr_timer_frozen,y                 ; $05D2A0 |
  BNE CODE_05D2B2                           ; $05D2A3 |
  LDA !s_spr_state,y                        ; $05D2A5 |
  CMP #$0010                                ; $05D2A8 |
  BEQ CODE_05D2B8                           ; $05D2AB |
  CMP #$0002                                ; $05D2AD |
  BEQ CODE_05D2B8                           ; $05D2B0 |

CODE_05D2B2:
  LDA #$FFFF                                ; $05D2B2 |
  STA !s_spr_wildcard_1_lo,x                ; $05D2B5 |

CODE_05D2B8:
  RTL                                       ; $05D2B8 |

CODE_05D2B9:
  LDY $7723,x                               ; $05D2B9 |
  BMI CODE_05D324                           ; $05D2BC |
  LDY !s_spr_facing_dir,x                   ; $05D2BE |
  LDA $D23E,y                               ; $05D2C1 |
  STA $00                                   ; $05D2C4 |
  LDA $D242,y                               ; $05D2C6 |
  STA $02                                   ; $05D2C9 |
  LDA #$FFF0                                ; $05D2CB |
  LDY !s_spr_oam_yxppccct,x                 ; $05D2CE |
  BPL CODE_05D2D6                           ; $05D2D1 |
  LDA #$0010                                ; $05D2D3 |

CODE_05D2D6:
  STA $04                                   ; $05D2D6 |
  REP #$10                                  ; $05D2D8 |
  LDA !s_spr_oam_pointer,x                  ; $05D2DA |
  CLC                                       ; $05D2DD |
  ADC #$0008                                ; $05D2DE |
  TAY                                       ; $05D2E1 |
  LDA !s_spr_cam_x_pos,x                    ; $05D2E2 |
  CLC                                       ; $05D2E5 |
  ADC $02                                   ; $05D2E6 |
  STA $6000,y                               ; $05D2E8 |
  STA $6010,y                               ; $05D2EB |
  CLC                                       ; $05D2EE |
  ADC $00                                   ; $05D2EF |
  STA $6008,y                               ; $05D2F1 |
  STA $6018,y                               ; $05D2F4 |
  LDA !s_spr_cam_y_pos,x                    ; $05D2F7 |
  CLC                                       ; $05D2FA |
  ADC $04                                   ; $05D2FB |
  STA $6002,y                               ; $05D2FD |
  STA $600A,y                               ; $05D300 |
  SEC                                       ; $05D303 |
  SBC $04                                   ; $05D304 |
  STA $6012,y                               ; $05D306 |
  STA $601A,y                               ; $05D309 |
  LDA $6006,y                               ; $05D30C |
  ORA #$0002                                ; $05D30F |
  STA $6006,y                               ; $05D312 |
  STA $600E,y                               ; $05D315 |
  STA $6016,y                               ; $05D318 |
  STA $601E,y                               ; $05D31B |
  JSL $03AA60                               ; $05D31E |
  SEP #$10                                  ; $05D322 |

CODE_05D324:
  RTS                                       ; $05D324 |

  dw $8010, $8000, $B000                    ; $05D325 |

CODE_05D32B:
  LDY $7723,x                               ; $05D32B |
  BMI CODE_05D37D                           ; $05D32E |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05D330 |
  LDA $D325,y                               ; $05D332 |
  STA !gsu_r12                              ; $05D335 |
  LDA #$0054                                ; $05D338 |
  STA !gsu_r13                              ; $05D33B |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D33E |
  STA !gsu_r11                              ; $05D341 |
  LSR A                                     ; $05D344 |
  STA !gsu_r5                               ; $05D345 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D348 |
  STA !gsu_r6                               ; $05D34B |
  LDA !s_spr_facing_dir,x                   ; $05D34E |
  STA !gsu_r4                               ; $05D351 |
  LDA #$0010                                ; $05D354 |
  STA !gsu_r9                               ; $05D357 |
  STZ !gsu_r10                              ; $05D35A |
  LDY !s_spr_dyntile_index,x                ; $05D35D |
  TYX                                       ; $05D360 |
  LDA $03A9CE,x                             ; $05D361 |
  STA !gsu_r3                               ; $05D365 |
  LDA $03A9EE,x                             ; $05D368 |
  STA !gsu_r2                               ; $05D36C |
  LDX #$08                                  ; $05D36F |
  LDA #$D6EB                                ; $05D371 |
  JSL r_gsu_init_1                          ; $05D374 | GSU init
  LDX $12                                   ; $05D378 |
  INC $0CF9                                 ; $05D37A |

CODE_05D37D:
  RTS                                       ; $05D37D |

CODE_05D37E:
  LDA #$0005                                ; $05D37E |
  STA !gsu_r0                               ; $05D381 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D384 |
  STA !gsu_r6                               ; $05D387 |
  LDX #$0B                                  ; $05D38A |
  LDA #$86B6                                ; $05D38C |
  JSL r_gsu_init_1                          ; $05D38F | GSU init
  LDX $12                                   ; $05D393 |
  LDA !gsu_r0                               ; $05D395 |
  CLC                                       ; $05D398 |
  ADC !s_player_hitbox_half_width           ; $05D399 |
  STA $04                                   ; $05D39C |
  ASL A                                     ; $05D39E |
  STA $00                                   ; $05D39F |
  LSR A                                     ; $05D3A1 |
  CLC                                       ; $05D3A2 |
  ADC !s_spr_x_player_delta,x               ; $05D3A3 |
  CMP $00                                   ; $05D3A6 |
  BCS CODE_05D37D                           ; $05D3A8 |
  LDA #$0008                                ; $05D3AA |
  STA !gsu_r0                               ; $05D3AD |
  LDX #$0B                                  ; $05D3B0 |
  LDA #$86B6                                ; $05D3B2 |
  JSL r_gsu_init_1                          ; $05D3B5 | GSU init
  LDX $12                                   ; $05D3B9 |
  LDA !gsu_r0                               ; $05D3BB |
  CLC                                       ; $05D3BE |
  ADC !s_player_hitbox_half_height          ; $05D3BF |
  ASL A                                     ; $05D3C2 |
  STA $02                                   ; $05D3C3 |
  LSR A                                     ; $05D3C5 |
  CLC                                       ; $05D3C6 |
  ADC !s_spr_y_player_delta,x               ; $05D3C7 |
  CMP $02                                   ; $05D3CA |
  BCS CODE_05D37D                           ; $05D3CC |
  CMP #$0008                                ; $05D3CE |
  BCS CODE_05D3E6                           ; $05D3D1 |
  LDY $60AB                                 ; $05D3D3 |
  BPL CODE_05D37D                           ; $05D3D6 |
  STZ !s_player_flutter_state               ; $05D3D8 |
  CLC                                       ; $05D3DB |
  ADC !s_player_y                           ; $05D3DC |
  STA !s_player_y                           ; $05D3DF |
  STZ !s_player_y_speed                     ; $05D3E2 |

CODE_05D3E5:
  RTS                                       ; $05D3E5 |

CODE_05D3E6:
  SEC                                       ; $05D3E6 |
  SBC $02                                   ; $05D3E7 |
  CMP #$FFF6                                ; $05D3E9 |
  BCC CODE_05D407                           ; $05D3EC |
  LDY !s_player_jump_state                  ; $05D3EE |
  BEQ CODE_05D3F8                           ; $05D3F1 |
  LDY $60AB                                 ; $05D3F3 |
  BMI CODE_05D3E5                           ; $05D3F6 |

CODE_05D3F8:
  INC !s_on_sprite_platform_flag            ; $05D3F8 |
  INC A                                     ; $05D3FB |
  SEC                                       ; $05D3FC |
  ADC !s_player_y                           ; $05D3FD |
  STA !s_player_y                           ; $05D400 |
  STZ !s_player_y_speed                     ; $05D403 |
  RTS                                       ; $05D406 |

CODE_05D407:
  LDA !s_player_x_speed_prev                ; $05D407 |
  BNE CODE_05D413                           ; $05D40A |
  LDA !s_player_direction                   ; $05D40C |
  EOR #$0002                                ; $05D40F |
  DEC A                                     ; $05D412 |

CODE_05D413:
  STA $06                                   ; $05D413 |
  EOR !s_spr_x_player_delta,x               ; $05D415 |
  BMI CODE_05D439                           ; $05D418 |
  LDA $04                                   ; $05D41A |
  LDY $07                                   ; $05D41C |
  BMI CODE_05D424                           ; $05D41E |
  EOR #$FFFF                                ; $05D420 |
  INC A                                     ; $05D423 |

CODE_05D424:
  CLC                                       ; $05D424 |
  ADC !s_spr_x_hitbox_center,x              ; $05D425 |
  SEC                                       ; $05D428 |
  SBC !s_player_center_x                    ; $05D429 |
  CLC                                       ; $05D42C |
  ADC !s_player_x                           ; $05D42D |
  STA !s_player_x                           ; $05D430 |
  STZ !s_player_x_speed_prev                ; $05D433 |
  STZ !s_player_x_speed                     ; $05D436 |

CODE_05D439:
  RTS                                       ; $05D439 |

CODE_05D43A:
  LDY !s_spr_wildcard_6_hi_dp,x             ; $05D43A |
  BEQ CODE_05D439                           ; $05D43C |
  LDY #$00                                  ; $05D43E |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05D440 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D442 |
  SEC                                       ; $05D445 |
  SBC #$0100                                ; $05D446 |
  EOR $6024                                 ; $05D449 |
  BMI CODE_05D457                           ; $05D44C |
  LDA $6024                                 ; $05D44E |
  EOR #$FFFF                                ; $05D451 |
  STA $6024                                 ; $05D454 |

CODE_05D457:
  LDA #$01D5                                ; $05D457 |
  JSL spawn_ambient_sprite                  ; $05D45A |
  LDA #$0006                                ; $05D45E |
  STA $7E4C,y                               ; $05D461 |
  LDA #$0002                                ; $05D464 |
  STA $7782,y                               ; $05D467 |
  LDA !s_spr_x_pixel_pos,x                  ; $05D46A |
  SEC                                       ; $05D46D |
  SBC $6022                                 ; $05D46E |
  STA $70A2,y                               ; $05D471 |
  LDA !s_spr_y_pixel_pos,x                  ; $05D474 |
  SEC                                       ; $05D477 |
  SBC #$0008                                ; $05D478 |
  SEC                                       ; $05D47B |
  SBC $6020                                 ; $05D47C |
  STA $7142,y                               ; $05D47F |
  LDA #$0047                                ; $05D482 |\ play sound #$0047
  JSL push_sound_queue                      ; $05D485 |/
  LDY !s_spr_wildcard_1_hi,x                ; $05D489 |
  BMI CODE_05D439                           ; $05D48C |
  LDA #$0100                                ; $05D48E |
  STA !s_spr_gsu_morph_1_lo,y               ; $05D491 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D494 |
  STA !s_spr_gsu_morph_2_lo,y               ; $05D497 |
  LDA !s_spr_x_pixel_pos,x                  ; $05D49A |
  SEC                                       ; $05D49D |
  SBC $6022                                 ; $05D49E |
  STA !s_spr_x_pixel_pos,y                  ; $05D4A1 |
  LDA !s_spr_y_pixel_pos,x                  ; $05D4A4 |
  SEC                                       ; $05D4A7 |
  SBC #$0008                                ; $05D4A8 |
  SEC                                       ; $05D4AB |
  SBC $6020                                 ; $05D4AC |
  STA !s_spr_y_pixel_pos,y                  ; $05D4AF |
  LDA !s_spr_facing_dir,x                   ; $05D4B2 |
  STA !s_spr_facing_dir,y                   ; $05D4B5 |
  LDA $6024                                 ; $05D4B8 |
  STA !s_spr_y_speed_lo,y                   ; $05D4BB |
  LDA $6026                                 ; $05D4BE |
  STA !s_spr_x_speed_lo,y                   ; $05D4C1 |
  LDA #$6820                                ; $05D4C4 |
  STA !s_spr_bitwise_settings_1,y           ; $05D4C7 |
  LDA !s_spr_id,y                           ; $05D4CA |
  SEC                                       ; $05D4CD |
  SBC #$007B                                ; $05D4CE |
  STA !s_spr_wildcard_2_lo,y                ; $05D4D1 |
  LDA !s_spr_wildcard_2_lo,x                ; $05D4D4 |
  STA !s_spr_wildcard_4_lo,y                ; $05D4D7 |
  LDA #$0030                                ; $05D4DA |
  STA !s_spr_timer_2,y                      ; $05D4DD |
  LDA #$0200                                ; $05D4E0 |
  STA !s_spr_timer_3,y                      ; $05D4E3 |
  LDA #$0002                                ; $05D4E6 |
  STA !s_spr_state,y                        ; $05D4E9 |
  LDA !s_spr_wildcard_1_lo,x                ; $05D4EC |
  ORA #$FF00                                ; $05D4EF |
  STA !s_spr_wildcard_1_lo,x                ; $05D4F2 |
  RTS                                       ; $05D4F5 |

  dw $0000, $0100                           ; $05D4F6 |

  TYX                                       ; $05D4FA |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05D4FB |
  CPY #$02                                  ; $05D4FD |
  BNE CODE_05D531                           ; $05D4FF |
  LDA #$0004                                ; $05D501 |
  JSR CODE_058000                           ; $05D504 |
  LDA !s_spr_timer_2,x                      ; $05D507 |
  BNE CODE_05D530                           ; $05D50A |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05D50C |
  BEQ CODE_05D520                           ; $05D50E |
  LDA !s_spr_cam_x_pos,x                    ; $05D510 |
  CLC                                       ; $05D513 |
  ADC #$0010                                ; $05D514 |
  CMP #$0110                                ; $05D517 |
  BCS CODE_05D530                           ; $05D51A |
  LDY #$00                                  ; $05D51C |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05D51E |

CODE_05D520:
  JSR CODE_05D602                           ; $05D520 |
  BCC CODE_05D530                           ; $05D523 |
  LDA #$0174                                ; $05D525 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05D528 |
  LDA #$0001                                ; $05D52B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05D52E |

CODE_05D530:
  RTS                                       ; $05D530 |

CODE_05D531:
  LDA !s_spr_x_player_dir,x                 ; $05D531 |
  AND #$00FF                                ; $05D534 |
  STA !s_spr_facing_dir,x                   ; $05D537 |
  TAY                                       ; $05D53A |
  LDA $D4F6,y                               ; $05D53B |
  STA !s_spr_wildcard_2_lo,x                ; $05D53E |
  LDA !s_spr_timer_2,x                      ; $05D541 |
  BNE CODE_05D576                           ; $05D544 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05D546 |
  BEQ CODE_05D55A                           ; $05D548 |
  LDA !s_spr_cam_x_pos,x                    ; $05D54A |
  CLC                                       ; $05D54D |
  ADC #$0010                                ; $05D54E |
  CMP #$0110                                ; $05D551 |
  BCS CODE_05D576                           ; $05D554 |
  LDY #$00                                  ; $05D556 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05D558 |

CODE_05D55A:
  JSL $03AD74                               ; $05D55A |
  BCC CODE_05D576                           ; $05D55E |
  JSR CODE_05D602                           ; $05D560 |
  BCS CODE_05D56B                           ; $05D563 |
  JSL $03AEFD                               ; $05D565 |
  BRA CODE_05D576                           ; $05D569 |

CODE_05D56B:
  LDA #$0174                                ; $05D56B |
  STA !s_spr_gsu_morph_1_lo,x               ; $05D56E |
  LDA #$0001                                ; $05D571 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05D574 |

CODE_05D576:
  RTS                                       ; $05D576 |

  TYX                                       ; $05D577 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D578 |
  CLC                                       ; $05D57B |
  ADC #$0004                                ; $05D57C |
  CMP #$01FF                                ; $05D57F |
  BMI CODE_05D595                           ; $05D582 |
  LDY #$02                                  ; $05D584 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $05D586 |
  LDA #$0102                                ; $05D588 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05D58B |
  LDA #$0202                                ; $05D58D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05D590 |
  LDA #$01FF                                ; $05D592 |

CODE_05D595:
  STA !s_spr_gsu_morph_1_lo,x               ; $05D595 |
  RTS                                       ; $05D598 |

  dw $0010, $FFF0                           ; $05D599 |

  dw $0004, $0000                           ; $05D59D |

  TYX                                       ; $05D5A1 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05D5A2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D5A4 |
  CLC                                       ; $05D5A7 |
  ADC $D599,y                               ; $05D5A8 |
  CMP #$01FF                                ; $05D5AB |
  BMI CODE_05D5C0                           ; $05D5AE |
  LDY #$02                                  ; $05D5B0 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05D5B2 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05D5B4 |
  EOR #$0002                                ; $05D5B6 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05D5B9 |
  LDA #$01FF                                ; $05D5BB |
  BRA CODE_05D5FE                           ; $05D5BE |

CODE_05D5C0:
  CMP #$0199                                ; $05D5C0 |
  BPL CODE_05D5FE                           ; $05D5C3 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05D5C5 |
  EOR #$0002                                ; $05D5C7 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05D5CA |
  LDA #$0199                                ; $05D5CC |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05D5CF |
  BNE CODE_05D5FE                           ; $05D5D1 |
  LDY #$00                                  ; $05D5D3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05D5D5 |
  AND #$00FF                                ; $05D5D7 |
  CMP #$0002                                ; $05D5DA |
  BEQ CODE_05D5E1                           ; $05D5DD |
  INY                                       ; $05D5DF |
  INY                                       ; $05D5E0 |

CODE_05D5E1:
  LDA #$0100                                ; $05D5E1 |
  STA !s_spr_timer_2,x                      ; $05D5E4 |
  LDA $D59D,y                               ; $05D5E7 |
  STA !s_spr_wildcard_5_hi_dp,x             ; $05D5EA |
  LDA #$0100                                ; $05D5EC |
  STA !s_spr_gsu_morph_1_lo,x               ; $05D5EF |
  TYA                                       ; $05D5F2 |
  BEQ CODE_05D5F9                           ; $05D5F3 |
  JSL $03AEFD                               ; $05D5F5 |

CODE_05D5F9:
  LDY #$00                                  ; $05D5F9 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05D5FB |
  RTS                                       ; $05D5FD |

CODE_05D5FE:
  STA !s_spr_gsu_morph_1_lo,x               ; $05D5FE |
  RTS                                       ; $05D601 |

CODE_05D602:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05D602 |
  CPY #$02                                  ; $05D604 |
  BNE CODE_05D613                           ; $05D606 |
  LDA !s_spr_wildcard_1_lo,x                ; $05D608 |
  AND #$00FF                                ; $05D60B |
  CMP #$0080                                ; $05D60E |
  BMI CODE_05D635                           ; $05D611 |

CODE_05D613:
  TYA                                       ; $05D613 |
  LSR A                                     ; $05D614 |
  CLC                                       ; $05D615 |
  ADC #$007B                                ; $05D616 |
  TXY                                       ; $05D619 |
  JSL $03A34E                               ; $05D61A |
  BCC CODE_05D635                           ; $05D61E |
  LDA !s_spr_id,y                           ; $05D620 |
  CMP #$007D                                ; $05D623 |
  BEQ CODE_05D639                           ; $05D626 |
  PHX                                       ; $05D628 |
  TYX                                       ; $05D629 |
  JSL $03AD74                               ; $05D62A |
  BCS CODE_05D637                           ; $05D62E |
  JSL $03A31E                               ; $05D630 |
  PLX                                       ; $05D634 |

CODE_05D635:
  CLC                                       ; $05D635 |
  RTS                                       ; $05D636 |

CODE_05D637:
  TXY                                       ; $05D637 |
  PLX                                       ; $05D638 |

CODE_05D639:
  TYA                                       ; $05D639 |
  SEP #$20                                  ; $05D63A |
  STA !s_spr_wildcard_1_lo,x                ; $05D63C |
  STA !s_spr_wildcard_1_hi,x                ; $05D63F |
  REP #$20                                  ; $05D642 |
  LDA !s_spr_x_pixel_pos,x                  ; $05D644 |
  STA !s_spr_x_pixel_pos,y                  ; $05D647 |
  LDA !s_spr_y_pixel_pos,x                  ; $05D64A |
  STA !s_spr_y_pixel_pos,y                  ; $05D64D |
  LDA !s_spr_oam_yxppccct,x                 ; $05D650 |
  STA !s_spr_oam_yxppccct,y                 ; $05D653 |
  SEP #$20                                  ; $05D656 |
  LDA #$FF                                  ; $05D658 |
  STA $7863,x                               ; $05D65A |
  REP #$20                                  ; $05D65D |
  SEC                                       ; $05D65F |
  RTS                                       ; $05D660 |

init_biting_bullet_bill:
  JSR CODE_05D77F                           ; $05D661 |

init_bullet_bill:
  RTL                                       ; $05D664 |

main_biting_bullet_bill:
  LDY !s_spr_draw_priority,x                ; $05D665 |
  BMI CODE_05D673                           ; $05D668 |
  LDY $7723,x                               ; $05D66A |
  BMI CODE_05D673                           ; $05D66D |
  JSL $03AA52                               ; $05D66F |

CODE_05D673:
  JSR CODE_05D71D                           ; $05D673 |
  JSL $03AF23                               ; $05D676 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05D67A |
  BNE CODE_05D68B                           ; $05D67C |
  LDA !s_spr_timer_2,x                      ; $05D67E |
  BNE CODE_05D688                           ; $05D681 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05D683 |
  JSR CODE_05D883                           ; $05D685 |

CODE_05D688:
  JMP CODE_05D6E8                           ; $05D688 |

CODE_05D68B:
  LDA !s_spr_timer_3,x                      ; $05D68B |
  BNE CODE_05D6E2                           ; $05D68E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05D690 |
  BNE CODE_05D6C5                           ; $05D692 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05D694 |
  DEY                                       ; $05D696 |
  BEQ CODE_05D6BC                           ; $05D697 |
  LDA #$01CD                                ; $05D699 |
  JSL spawn_ambient_sprite                  ; $05D69C |
  LDA #$000B                                ; $05D6A0 |
  STA $7E4C,y                               ; $05D6A3 |
  LDA #$0004                                ; $05D6A6 |
  STA $7782,y                               ; $05D6A9 |
  LDA !s_spr_x_pixel_pos,x                  ; $05D6AC |
  STA $70A2,y                               ; $05D6AF |
  LDA !s_spr_y_pixel_pos,x                  ; $05D6B2 |
  STA $7142,y                               ; $05D6B5 |
  JML $03A31E                               ; $05D6B8 |

CODE_05D6BC:
  LDA #$0018                                ; $05D6BC |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05D6BF |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05D6C1 |
  BRA CODE_05D6C7                           ; $05D6C3 |

CODE_05D6C5:
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05D6C5 |

CODE_05D6C7:
  LDA !s_spr_oam_yxppccct,x                 ; $05D6C7 |
  EOR #$000E                                ; $05D6CA |
  STA !s_spr_oam_yxppccct,x                 ; $05D6CD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D6D0 |
  SEC                                       ; $05D6D3 |
  SBC #$0004                                ; $05D6D4 |
  CMP #$0040                                ; $05D6D7 |
  BPL CODE_05D6DF                           ; $05D6DA |
  LDA #$0040                                ; $05D6DC |

CODE_05D6DF:
  STA !s_spr_gsu_morph_1_lo,x               ; $05D6DF |

CODE_05D6E2:
  JSR CODE_05D883                           ; $05D6E2 |
  JSR CODE_058073                           ; $05D6E5 |

CODE_05D6E8:
  JSR CODE_05D76A                           ; $05D6E8 |
  BRA CODE_05D6FA                           ; $05D6EB |

main_bullet_bill:
  JSR CODE_05D71D                           ; $05D6ED |
  JSL $03AF23                               ; $05D6F0 |
  LDA #$0004                                ; $05D6F4 |
  STA !s_spr_draw_priority,x                ; $05D6F7 |

CODE_05D6FA:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D6FA |
  STA !gsu_r4                               ; $05D6FD |
  STA !gsu_r9                               ; $05D700 |
  JSR CODE_05D7BB                           ; $05D703 |
  LDA !s_spr_timer_1,x                      ; $05D706 |
  BNE CODE_05D718                           ; $05D709 |
  LDA #$0006                                ; $05D70B |
  STA !s_spr_timer_1,x                      ; $05D70E |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05D711 |
  EOR #$0002                                ; $05D713 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05D716 |

CODE_05D718:
  RTL                                       ; $05D718 |

  dw $FE00, $0200                           ; $05D719 |

CODE_05D71D:
  LDY !s_spr_collision_state,x              ; $05D71D |
  BEQ CODE_05D765                           ; $05D720 |
  LDY !s_spr_dyntile_index,x                ; $05D722 |
  BMI CODE_05D72B                           ; $05D725 |
  JSL $03AEFD                               ; $05D727 |

CODE_05D72B:
  LDA !s_spr_x_speed_lo,x                   ; $05D72B |
  PHA                                       ; $05D72E |
  LDA !s_spr_y_speed_lo,x                   ; $05D72F |
  PHA                                       ; $05D732 |
  LDA !s_spr_oam_yxppccct,x                 ; $05D733 |
  PHA                                       ; $05D736 |
  TXY                                       ; $05D737 |
  LDA #$007D                                ; $05D738 |
  JSL $03A377                               ; $05D73B |
  LDY !s_spr_facing_dir,x                   ; $05D73F |
  LDA $D719,y                               ; $05D742 |
  STA !s_spr_x_accel_ceiling,x              ; $05D745 |
  LDA #$0040                                ; $05D748 |
  STA !s_spr_y_accel,x                      ; $05D74B |
  STA !s_spr_x_accel,x                      ; $05D74E |
  LDA #$6820                                ; $05D751 |
  STA !s_spr_bitwise_settings_1,x           ; $05D754 |
  PLA                                       ; $05D757 |
  STA !s_spr_oam_yxppccct,x                 ; $05D758 |
  PLA                                       ; $05D75B |
  STA !s_spr_y_speed_lo,x                   ; $05D75C |
  PLA                                       ; $05D75F |
  STA !s_spr_x_speed_lo,x                   ; $05D760 |
  PLA                                       ; $05D763 |
  RTL                                       ; $05D764 |

CODE_05D765:
  RTS                                       ; $05D765 |

  dw $9000, $8020                           ; $05D766 |

CODE_05D76A:
  LDA !s_spr_dyntile_index,x                ; $05D76A |
  LSR A                                     ; $05D76D |
  LSR A                                     ; $05D76E |
  LSR A                                     ; $05D76F |
  SEC                                       ; $05D770 |
  SBC !r_frame_counter_global               ; $05D771 |
  AND #$0003                                ; $05D774 |
  BNE CODE_05D7BA                           ; $05D777 |
  LDA #$0004                                ; $05D779 |
  STA !s_spr_draw_priority,x                ; $05D77C |

CODE_05D77F:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05D77F |
  LDA $D766,y                               ; $05D781 |
  STA !gsu_r12                              ; $05D784 |
  LDA #$0054                                ; $05D787 |
  STA !gsu_r13                              ; $05D78A |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D78D |
  LSR A                                     ; $05D790 |
  STA !gsu_r5                               ; $05D791 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D794 |
  STA !gsu_r6                               ; $05D797 |
  LDY !s_spr_dyntile_index,x                ; $05D79A |
  TYX                                       ; $05D79D |
  LDA $03A9CE,x                             ; $05D79E |
  STA !gsu_r3                               ; $05D7A2 |
  LDA $03A9EE,x                             ; $05D7A5 |
  STA !gsu_r2                               ; $05D7A9 |
  LDX #$08                                  ; $05D7AC |
  LDA #$8205                                ; $05D7AE |
  JSL r_gsu_init_1                          ; $05D7B1 | GSU init
  LDX $12                                   ; $05D7B5 |
  INC $0CF9                                 ; $05D7B7 |

CODE_05D7BA:
  RTS                                       ; $05D7BA |

CODE_05D7BB:
  LDA #$000C                                ; $05D7BB |
  JSR CODE_05D833                           ; $05D7BE |
  BCS CODE_05D7BA                           ; $05D7C1 |
  LDA !s_spr_y_player_delta,x               ; $05D7C3 |
  SEC                                       ; $05D7C6 |
  SBC $02                                   ; $05D7C7 |
  CMP #$FFF8                                ; $05D7C9 |
  BCC CODE_05D820                           ; $05D7CC |
  LDY !s_player_jump_state                  ; $05D7CE |
  BEQ CODE_05D832                           ; $05D7D1 |
  LDY $60AB                                 ; $05D7D3 |
  BMI CODE_05D832                           ; $05D7D6 |
  LDA !s_player_tile_collision              ; $05D7D8 |
  AND #$0018                                ; $05D7DB |
  BNE CODE_05D7F5                           ; $05D7DE |
  LDA #$FA00                                ; $05D7E0 |
  STA !s_player_y_speed                     ; $05D7E3 |
  LDA #$0006                                ; $05D7E6 |
  STA !s_player_jump_state                  ; $05D7E9 |
  STZ !s_player_ground_pound_state          ; $05D7EC |
  LDA #$8001                                ; $05D7EF |
  STA !s_player_flutter_state               ; $05D7F2 |

CODE_05D7F5:
  STZ !s_spr_y_speed_lo,x                   ; $05D7F5 |
  STZ !s_spr_x_speed_lo,x                   ; $05D7F8 |
  LDA #$0016                                ; $05D7FB |
  STA !s_spr_y_accel,x                      ; $05D7FE |
  LDA #$02CC                                ; $05D801 |
  STA !s_spr_y_accel_ceiling,x              ; $05D804 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05D807 |
  LDA #$000E                                ; $05D809 |
  STA !s_spr_state,x                        ; $05D80C |
  LDA !s_spr_bitwise_settings_3,x           ; $05D80F |
  AND #$FFE0                                ; $05D812 |
  STA !s_spr_bitwise_settings_3,x           ; $05D815 |
  LDA #$000B                                ; $05D818 |\ play sound #$000B
  JSL push_sound_queue                      ; $05D81B |/
  RTS                                       ; $05D81F |

CODE_05D820:
  LDA #$0006                                ; $05D820 |
  JSR CODE_05D833                           ; $05D823 |
  BCS CODE_05D832                           ; $05D826 |
  STZ !s_player_y_speed                     ; $05D828 |
  STZ !s_player_flutter_state               ; $05D82B |
  JSL player_hit_sprite                     ; $05D82E |

CODE_05D832:
  RTS                                       ; $05D832 |

CODE_05D833:
  STA !gsu_r6                               ; $05D833 |
  LDA !gsu_r4                               ; $05D836 |
  STA !gsu_r0                               ; $05D839 |
  LDX #$0B                                  ; $05D83C |
  LDA #$86B6                                ; $05D83E |
  JSL r_gsu_init_1                          ; $05D841 | GSU init
  LDX $12                                   ; $05D845 |
  LDA !gsu_r0                               ; $05D847 |
  CLC                                       ; $05D84A |
  ADC !s_player_hitbox_half_width           ; $05D84B |
  ASL A                                     ; $05D84E |
  STA $00                                   ; $05D84F |
  LSR A                                     ; $05D851 |
  CLC                                       ; $05D852 |
  ADC !s_spr_x_player_delta,x               ; $05D853 |
  CMP $00                                   ; $05D856 |
  BCS CODE_05D87E                           ; $05D858 |
  LDA !gsu_r9                               ; $05D85A |
  STA !gsu_r0                               ; $05D85D |
  LDX #$0B                                  ; $05D860 |
  LDA #$86B6                                ; $05D862 |
  JSL r_gsu_init_1                          ; $05D865 | GSU init
  LDX $12                                   ; $05D869 |
  LDA !gsu_r0                               ; $05D86B |
  CLC                                       ; $05D86E |
  ADC !s_player_hitbox_half_height          ; $05D86F |
  STA $02                                   ; $05D872 |
  ASL A                                     ; $05D874 |
  STA $00                                   ; $05D875 |
  LSR A                                     ; $05D877 |
  CLC                                       ; $05D878 |
  ADC !s_spr_y_player_delta,x               ; $05D879 |
  CMP $00                                   ; $05D87C |

CODE_05D87E:
  RTS                                       ; $05D87E |

  dw $009C, $FF64                           ; $05D87F |

CODE_05D883:
  LDA #$0005                                ; $05D883 |
  STA !s_spr_y_accel,x                      ; $05D886 |
  STA !s_spr_x_accel,x                      ; $05D889 |
  LDA !s_spr_timer_2,x                      ; $05D88C |
  BNE CODE_05D8B5                           ; $05D88F |
  LDA #$0040                                ; $05D891 |
  STA !s_spr_timer_2,x                      ; $05D894 |
  LDY #$00                                  ; $05D897 |
  LDA !s_spr_x_player_delta,x               ; $05D899 |
  BMI CODE_05D8A0                           ; $05D89C |
  INY                                       ; $05D89E |
  INY                                       ; $05D89F |

CODE_05D8A0:
  LDA $D87F,y                               ; $05D8A0 |
  STA !s_spr_x_accel_ceiling,x              ; $05D8A3 |
  LDY #$00                                  ; $05D8A6 |
  LDA !s_spr_y_player_delta,x               ; $05D8A8 |
  BMI CODE_05D8AF                           ; $05D8AB |
  INY                                       ; $05D8AD |
  INY                                       ; $05D8AE |

CODE_05D8AF:
  LDA $D87F,y                               ; $05D8AF |
  STA !s_spr_y_accel_ceiling,x              ; $05D8B2 |

CODE_05D8B5:
  RTS                                       ; $05D8B5 |

  JSL $03AA52                               ; $05D8B6 |
  LDA !s_sprite_disable_flag                ; $05D8BA |
  ORA $0B55                                 ; $05D8BD |
  ORA !r_cur_item_used                      ; $05D8C0 |
  BNE CODE_05D8D5                           ; $05D8C3 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D8C5 |
  CLC                                       ; $05D8C8 |
  ADC #$0002                                ; $05D8C9 |
  AND #$01FE                                ; $05D8CC |
  STA !s_spr_gsu_morph_2_lo,x               ; $05D8CF |
  JSR CODE_05D76A                           ; $05D8D2 |

CODE_05D8D5:
  RTL                                       ; $05D8D5 |

  JML $039F9F                               ; $05D8D6 |

init_bouncing_bullet_bill:
  JSR CODE_05D923                           ; $05D8DA |
  RTL                                       ; $05D8DD |

  dw $D962                                  ; $05D8DE |
  dw $D9F2                                  ; $05D8E0 |
  dw $DA6A                                  ; $05D8E2 |
  dw $DA81                                  ; $05D8E4 |

main_bouncing_bullet_bill:
  LDY !s_spr_draw_priority,x                ; $05D8E6 |
  BMI CODE_05D8F4                           ; $05D8E9 |
  LDY $7723,x                               ; $05D8EB |
  BMI CODE_05D8F4                           ; $05D8EE |
  JSL $03AA52                               ; $05D8F0 |

CODE_05D8F4:
  JSR CODE_05D71D                           ; $05D8F4 |
  LDA !s_spr_timer_frozen,x                 ; $05D8F7 |
  BEQ CODE_05D8FF                           ; $05D8FA |
  STZ !s_spr_bitwise_settings_3,x           ; $05D8FC |

CODE_05D8FF:
  JSL $03AF23                               ; $05D8FF |
  LDA #$0004                                ; $05D903 |
  STA !s_spr_draw_priority,x                ; $05D906 |
  TXY                                       ; $05D909 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05D90A |
  ASL A                                     ; $05D90C |
  TAX                                       ; $05D90D |
  JSR ($D8DE,x)                             ; $05D90E |
  JSR CODE_05D923                           ; $05D911 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D914 |
  STA !gsu_r4                               ; $05D917 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05D91A |
  STA !gsu_r9                               ; $05D91C |
  JSR CODE_05D7BB                           ; $05D91F |
  RTL                                       ; $05D922 |

CODE_05D923:
  LDA #$8020                                ; $05D923 |
  STA !gsu_r12                              ; $05D926 |
  LDA #$0054                                ; $05D929 |
  STA !gsu_r13                              ; $05D92C |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05D92F |
  LSR A                                     ; $05D932 |
  STA !gsu_r5                               ; $05D933 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D936 |
  STA !gsu_r6                               ; $05D939 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05D93C |
  STA !gsu_r11                              ; $05D93E |
  LDY !s_spr_dyntile_index,x                ; $05D941 |
  TYX                                       ; $05D944 |
  LDA $03A9CE,x                             ; $05D945 |
  STA !gsu_r3                               ; $05D949 |
  LDA $03A9EE,x                             ; $05D94C |
  STA !gsu_r2                               ; $05D950 |
  LDX #$08                                  ; $05D953 |
  LDA #$84A5                                ; $05D955 |
  JSL r_gsu_init_1                          ; $05D958 | GSU init
  LDX $12                                   ; $05D95C |
  INC $0CF9                                 ; $05D95E |
  RTS                                       ; $05D961 |

  TYX                                       ; $05D962 |
  LDA #$0100                                ; $05D963 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05D966 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05D968 |
  JSR CODE_05D96F                           ; $05D96B |
  RTS                                       ; $05D96E |

CODE_05D96F:
  LDA $7860,x                               ; $05D96F |
  AND #$000F                                ; $05D972 |
  BEQ CODE_05D9C5                           ; $05D975 |
  TAY                                       ; $05D977 |
  STY $02                                   ; $05D978 |
  LDA $8F47,y                               ; $05D97A |
  AND #$00FF                                ; $05D97D |
  CMP #$00FF                                ; $05D980 |
  BNE CODE_05D9AF                           ; $05D983 |
  LDA !s_spr_x_speed_lo,x                   ; $05D985 |
  BPL CODE_05D98E                           ; $05D988 |
  EOR #$FFFF                                ; $05D98A |
  INC A                                     ; $05D98D |

CODE_05D98E:
  STA $00                                   ; $05D98E |
  LDA !s_spr_y_speed_lo,x                   ; $05D990 |
  BPL CODE_05D999                           ; $05D993 |
  EOR #$FFFF                                ; $05D995 |
  INC A                                     ; $05D998 |

CODE_05D999:
  CMP $00                                   ; $05D999 |
  BPL CODE_05D9A6                           ; $05D99B |
  LDA $02                                   ; $05D99D |
  AND #$0008                                ; $05D99F |
  LSR A                                     ; $05D9A2 |
  LSR A                                     ; $05D9A3 |
  BRA CODE_05D9AF                           ; $05D9A4 |

CODE_05D9A6:
  LDA $02                                   ; $05D9A6 |
  AND #$0002                                ; $05D9A8 |
  CLC                                       ; $05D9AB |
  ADC #$0004                                ; $05D9AC |

CODE_05D9AF:
  STA !s_spr_wildcard_3_lo_dp,x             ; $05D9AF |
  LDA !s_spr_ground_angle,x                 ; $05D9B1 |
  AND #$00FF                                ; $05D9B4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05D9B7 |
  STZ !s_spr_x_speed_lo,x                   ; $05D9B9 |
  STZ !s_spr_y_speed_lo,x                   ; $05D9BC |
  LDY #$01                                  ; $05D9BF |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05D9C1 |
  PLA                                       ; $05D9C3 |
  RTS                                       ; $05D9C4 |

CODE_05D9C5:
  LDA !s_spr_x_speed_lo,x                   ; $05D9C5 |
  STA !s_spr_wildcard_1_lo,x                ; $05D9C8 |
  LDA !s_spr_y_speed_lo,x                   ; $05D9CB |
  STA !s_spr_wildcard_2_lo,x                ; $05D9CE |
  RTS                                       ; $05D9D1 |

  dw $FE58, $FE80, $FEAC, $FF00             ; $05D9D2 |
  dw $FEAC, $FE80, $FE54, $0200             ; $05D9DA |
  dw $FFA8, $FF80, $FF54, $FE00             ; $05D9E2 |
  dw $FE54, $FE80, $FEA8, $FF00             ; $05D9EA |

  TYX                                       ; $05D9F2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05D9F3 |
  SEC                                       ; $05D9F6 |
  SBC #$0008                                ; $05D9F7 |
  CMP #$00A0                                ; $05D9FA |
  BPL CODE_05DA5D                           ; $05D9FD |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05D9FF |
  CPY #$04                                  ; $05DA01 |
  BPL CODE_05DA0A                           ; $05DA03 |
  LDA #$000E                                ; $05DA05 |
  BRA CODE_05DA16                           ; $05DA08 |

CODE_05DA0A:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05DA0A |
  CLC                                       ; $05DA0C |
  ADC #$0038                                ; $05DA0D |
  AND #$00F0                                ; $05DA10 |
  LSR A                                     ; $05DA13 |
  LSR A                                     ; $05DA14 |
  LSR A                                     ; $05DA15 |

CODE_05DA16:
  LDY !s_spr_facing_dir,x                   ; $05DA16 |
  BEQ CODE_05DA1F                           ; $05DA19 |
  CLC                                       ; $05DA1B |
  ADC #$0010                                ; $05DA1C |

CODE_05DA1F:
  TAY                                       ; $05DA1F |
  LDA $D9D2,y                               ; $05DA20 |
  LDY !s_spr_facing_dir,x                   ; $05DA23 |
  BNE CODE_05DA2E                           ; $05DA26 |
  SEC                                       ; $05DA28 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $05DA29 |
  BRA CODE_05DA32                           ; $05DA2C |

CODE_05DA2E:
  CLC                                       ; $05DA2E |
  ADC !s_spr_gsu_morph_2_lo,x               ; $05DA2F |

CODE_05DA32:
  AND #$01FE                                ; $05DA32 |
  STA !gsu_r1                               ; $05DA35 |
  LDA #$0166                                ; $05DA38 |
  STA !gsu_r6                               ; $05DA3B |
  LDX #$0B                                  ; $05DA3E |
  LDA #$8595                                ; $05DA40 |
  JSL r_gsu_init_1                          ; $05DA43 | GSU init
  LDX $12                                   ; $05DA47 |
  LDA !gsu_r0                               ; $05DA49 |
  STA !s_spr_x_speed_lo,x                   ; $05DA4C |
  LDA !gsu_r1                               ; $05DA4F |
  STA !s_spr_y_speed_lo,x                   ; $05DA52 |
  JSR CODE_058073                           ; $05DA55 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DA58 |
  LDA #$00A0                                ; $05DA5A |

CODE_05DA5D:
  STA !s_spr_gsu_morph_1_lo,x               ; $05DA5D |
  LDA #$0200                                ; $05DA60 |
  SEC                                       ; $05DA63 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05DA64 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05DA67 |
  RTS                                       ; $05DA69 |

  TYX                                       ; $05DA6A |
  JSR CODE_05D96F                           ; $05DA6B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DA6E |
  CLC                                       ; $05DA71 |
  ADC #$0008                                ; $05DA72 |
  CMP #$0130                                ; $05DA75 |
  BMI CODE_05DA7F                           ; $05DA78 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DA7A |
  LDA #$0130                                ; $05DA7C |

CODE_05DA7F:
  BRA CODE_05DA5D                           ; $05DA7F |
  TYX                                       ; $05DA81 |
  JSR CODE_05D96F                           ; $05DA82 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DA85 |
  SEC                                       ; $05DA88 |
  SBC #$0004                                ; $05DA89 |
  CMP #$0100                                ; $05DA8C |
  BPL CODE_05DA96                           ; $05DA8F |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05DA91 |
  LDA #$0100                                ; $05DA93 |

CODE_05DA96:
  BRA CODE_05DA5D                           ; $05DA96 |

init_hint_block:
  JSL $03AE60                               ; $05DA98 |
  LDA #$0100                                ; $05DA9C |
  STA !s_spr_gsu_morph_1_lo,x               ; $05DA9F |
  LDA !s_spr_y_pixel_pos,x                  ; $05DAA2 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05DAA5 |
  LDA #$0001                                ; $05DAA7 |
  STA !s_spr_anim_frame,x                   ; $05DAAA |
  JSR CODE_05DB79                           ; $05DAAD |
  RTL                                       ; $05DAB0 |

  dw $80C2                                  ; $05DAB1 |
  dw $DBC8                                  ; $05DAB3 |
  dw $DC05                                  ; $05DAB5 |

  dw $6010, $7010                           ; $05DAB7 |

  dw $0018, $FFE8                           ; $05DABB |

  dw $0020, $FFE0                           ; $05DABF |

  JSL $03AA52                               ; $05DAC3 |
  LDA !s_sprite_disable_flag                ; $05DAC7 |
  ORA $0B55                                 ; $05DACA |
  ORA !r_cur_item_used                      ; $05DACD |
  BEQ CODE_05DADA                           ; $05DAD0 |
  JSL $03B69D                               ; $05DAD2 |
  JSL $03B716                               ; $05DAD6 |

CODE_05DADA:
  STZ !s_spr_facing_dir,x                   ; $05DADA |
  TXY                                       ; $05DADD |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05DADE |
  ASL A                                     ; $05DAE0 |
  TAX                                       ; $05DAE1 |
  JSR ($DAB1,x)                             ; $05DAE2 |
  LDA !s_sprite_disable_flag                ; $05DAE5 |
  ORA $0B55                                 ; $05DAE8 |
  ORA !r_cur_item_used                      ; $05DAEB |
  BEQ CODE_05DAF4                           ; $05DAEE |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05DAF0 |
  BEQ CODE_05DAF7                           ; $05DAF2 |

CODE_05DAF4:
  JSR CODE_05DB79                           ; $05DAF4 |

CODE_05DAF7:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05DAF7 |
  BNE CODE_05DB74                           ; $05DAF9 |
  LDY $60AB                                 ; $05DAFB |
  BPL CODE_05DB46                           ; $05DAFE |
  LDY !s_player_jump_state                  ; $05DB00 |
  BEQ CODE_05DB46                           ; $05DB03 |
  LDA !s_spr_x_player_delta,x               ; $05DB05 |
  CLC                                       ; $05DB08 |
  ADC #$000C                                ; $05DB09 |
  CMP #$0018                                ; $05DB0C |
  BCS CODE_05DB46                           ; $05DB0F |
  LDA !s_spr_y_player_delta,x               ; $05DB11 |
  CMP #$FFE8                                ; $05DB14 |
  BMI CODE_05DB46                           ; $05DB17 |
  CMP #$FFF0                                ; $05DB19 |
  BPL CODE_05DB46                           ; $05DB1C |
  STZ !s_player_y_speed                     ; $05DB1E |
  STZ !s_player_flutter_state               ; $05DB21 |

CODE_05DB24:
  DEC !s_spr_y_pixel_pos,x                  ; $05DB24 |
  LDA #$FC00                                ; $05DB27 |
  STA !s_spr_y_speed_lo,x                   ; $05DB2A |
  LDA #$0034                                ; $05DB2D |
  STA !s_spr_y_accel,x                      ; $05DB30 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $05DB33 |
  INC !s_player_disable_flag                ; $05DB36 |
  INC !s_sprite_disable_flag                ; $05DB39 |
  LDA #$0032                                ; $05DB3C |\ play sound #$0032
  JSL push_sound_queue                      ; $05DB3F |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DB43 |
  RTL                                       ; $05DB45 |

CODE_05DB46:
  LDY !s_spr_collision_id,x                 ; $05DB46 |
  DEY                                       ; $05DB49 |
  BMI CODE_05DB60                           ; $05DB4A |
  LDA !s_spr_state,y                        ; $05DB4C |
  CMP #$0010                                ; $05DB4F |
  BNE CODE_05DB60                           ; $05DB52 |
  LDA !s_spr_collision_state,y              ; $05DB54 |
  BEQ CODE_05DB60                           ; $05DB57 |
  TYX                                       ; $05DB59 |
  JSL $03B25B                               ; $05DB5A |
  BRA CODE_05DB24                           ; $05DB5E |

CODE_05DB60:
  LDA !s_spr_timer_2,x                      ; $05DB60 |
  BNE CODE_05DB74                           ; $05DB63 |
  LDA #$0008                                ; $05DB65 |
  STA !s_spr_timer_2,x                      ; $05DB68 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05DB6B |
  EOR #$0002                                ; $05DB6E |
  STA !s_spr_gsu_morph_2_lo,x               ; $05DB71 |

CODE_05DB74:
  JSL $03D127                               ; $05DB74 |
  RTL                                       ; $05DB78 |

CODE_05DB79:
  LDY !s_spr_gsu_morph_2_lo,x               ; $05DB79 |
  LDA $DAB7,y                               ; $05DB7C |
  STA !gsu_r12                              ; $05DB7F |
  LDA #$0055                                ; $05DB82 |
  STA !gsu_r13                              ; $05DB85 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DB88 |
  STA !gsu_r6                               ; $05DB8B |
  SEC                                       ; $05DB8E |
  SBC #$0100                                ; $05DB8F |
  LSR A                                     ; $05DB92 |
  STA $00                                   ; $05DB93 |
  LDA #$0100                                ; $05DB95 |
  SEC                                       ; $05DB98 |
  SBC $00                                   ; $05DB99 |
  STA !gsu_r11                              ; $05DB9B |
  LDA !s_spr_dyntile_index,x                ; $05DB9E |
  TAX                                       ; $05DBA1 |
  LDA $03A9CE,x                             ; $05DBA2 |
  STA !gsu_r3                               ; $05DBA6 |
  LDA $03A9EE,x                             ; $05DBA9 |
  STA !gsu_r2                               ; $05DBAD |
  LDA #$0008                                ; $05DBB0 |
  STA !gsu_r8                               ; $05DBB3 |
  STA !gsu_r9                               ; $05DBB6 |
  LDX #$08                                  ; $05DBB9 |
  LDA #$82FA                                ; $05DBBB |
  JSL r_gsu_init_1                          ; $05DBBE | GSU init
  LDX $12                                   ; $05DBC2 |
  INC $0CF9                                 ; $05DBC4 |
  RTS                                       ; $05DBC7 |

  TYX                                       ; $05DBC8 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05DBC9 |
  CMP !s_spr_y_pixel_pos,x                  ; $05DBCB |
  BPL CODE_05DBDF                           ; $05DBCE |
  STA !s_spr_y_pixel_pos,x                  ; $05DBD0 |
  STZ !s_spr_y_speed_lo,x                   ; $05DBD3 |
  STZ !s_spr_y_accel,x                      ; $05DBD6 |
  STZ !s_spr_wildcard_1_lo,x                ; $05DBD9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DBDC |
  RTS                                       ; $05DBDE |

CODE_05DBDF:
  LDY #$00                                  ; $05DBDF |
  LDA !s_spr_y_speed_lo,x                   ; $05DBE1 |
  BMI CODE_05DBE8                           ; $05DBE4 |
  INY                                       ; $05DBE6 |
  INY                                       ; $05DBE7 |

CODE_05DBE8:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DBE8 |
  CLC                                       ; $05DBEB |
  ADC $DABB,y                               ; $05DBEC |
  CMP #$00A0                                ; $05DBEF |
  BPL CODE_05DBF9                           ; $05DBF2 |
  LDA #$00A0                                ; $05DBF4 |
  BRA CODE_05DC01                           ; $05DBF7 |

CODE_05DBF9:
  CMP #$01FF                                ; $05DBF9 |
  BMI CODE_05DC01                           ; $05DBFC |
  LDA #$01FF                                ; $05DBFE |

CODE_05DC01:
  STA !s_spr_gsu_morph_1_lo,x               ; $05DC01 |
  RTS                                       ; $05DC04 |

  TYX                                       ; $05DC05 |
  LDY !s_spr_wildcard_1_lo,x                ; $05DC06 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DC09 |
  CLC                                       ; $05DC0C |
  ADC $DABF,y                               ; $05DC0D |
  CPY #$00                                  ; $05DC10 |
  BEQ CODE_05DC58                           ; $05DC12 |
  CMP #$0100                                ; $05DC14 |
  BPL CODE_05DC66                           ; $05DC17 |
  LDA !s_spr_x_pixel_pos,x                  ; $05DC19 |
  AND #$0010                                ; $05DC1C |
  LSR A                                     ; $05DC1F |
  LSR A                                     ; $05DC20 |
  LSR A                                     ; $05DC21 |
  LSR A                                     ; $05DC22 |
  TAY                                       ; $05DC23 |
  LDA !s_spr_y_pixel_pos,x                  ; $05DC24 |
  AND #$0010                                ; $05DC27 |
  BEQ CODE_05DC2E                           ; $05DC2A |
  INY                                       ; $05DC2C |
  INY                                       ; $05DC2D |

CODE_05DC2E:
  TYA                                       ; $05DC2E |
  STA $00                                   ; $05DC2F |
  LDA !r_cur_stage                          ; $05DC31 |
  ASL A                                     ; $05DC34 |
  ASL A                                     ; $05DC35 |
  CLC                                       ; $05DC36 |
  ADC $00                                   ; $05DC37 |
  STA $704070                               ; $05DC39 |
  CMP #$0001                                ; $05DC3D |
  BNE CODE_05DC4E                           ; $05DC40 |
  LDA !s_control_scheme                     ; $05DC42 | controller settings
  BEQ CODE_05DC4E                           ; $05DC45 | patient will branch
  LDA #$011C                                ; $05DC47 | hardcoded message for $0001 & hasty
  STA $704070                               ; $05DC4A |

CODE_05DC4E:
  INC !r_msg_box_state                      ; $05DC4E |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05DC51 |
  LDA #$0100                                ; $05DC53 |
  BRA CODE_05DC66                           ; $05DC56 |

CODE_05DC58:
  CMP #$0160                                ; $05DC58 |
  BMI CODE_05DC66                           ; $05DC5B |
  LDA #$0002                                ; $05DC5D |
  STA !s_spr_wildcard_1_lo,x                ; $05DC60 |
  LDA #$0160                                ; $05DC63 |

CODE_05DC66:
  STA !s_spr_gsu_morph_1_lo,x               ; $05DC66 |
  RTS                                       ; $05DC69 |

  dw $FFC0, $0040                           ; $05DC6A |

  dw $0100, $FF00, $0100                    ; $05DC6E |

init_boo_man_bluff:
  LDY !s_spr_facing_dir,x                   ; $05DC74 |
  LDA $DC6A,y                               ; $05DC77 |
  STA !s_spr_x_accel_ceiling,x              ; $05DC7A |
  LDA #$0006                                ; $05DC7D |
  STA !s_spr_x_accel,x                      ; $05DC80 |
  LDY #$00                                  ; $05DC83 |
  LDA !s_player_y                           ; $05DC85 |
  CMP !s_spr_y_pixel_pos,x                  ; $05DC88 |
  BMI CODE_05DC8F                           ; $05DC8B |
  INY                                       ; $05DC8D |
  INY                                       ; $05DC8E |

CODE_05DC8F:
  LDA $DC6E,y                               ; $05DC8F |
  STA !s_spr_y_accel_ceiling,x              ; $05DC92 |
  LDA $DC70,y                               ; $05DC95 |
  STA !s_spr_y_speed_lo,x                   ; $05DC98 |
  LDA !s_spr_y_pixel_pos,x                  ; $05DC9B |
  STA !s_spr_wildcard_2_lo,x                ; $05DC9E |
  LDA #$0026                                ; $05DCA1 |
  STA !s_spr_oam_yxppccct,x                 ; $05DCA4 |
  RTL                                       ; $05DCA7 |

  dw $DF60                                  ; $05DCA8 |
  dw $DF9B                                  ; $05DCAA |
  dw $DFCC                                  ; $05DCAC |
  dw $DFDE                                  ; $05DCAE |
  dw $E010                                  ; $05DCB0 |
  dw $E027                                  ; $05DCB2 |
  dw $E04A                                  ; $05DCB4 |
  dw $E069                                  ; $05DCB6 |
  dw $E087                                  ; $05DCB8 |
  dw $E0B3                                  ; $05DCBA |
  dw $E0DC                                  ; $05DCBC |

main_boo_man_bluff:
  JSL $03AF23                               ; $05DCBE |
  LDY !s_spr_collision_id,x                 ; $05DCC2 |
  BPL CODE_05DCFB                           ; $05DCC5 |
  JSL player_hit_sprite                     ; $05DCC7 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05DCCB |
  CPY #$0A                                  ; $05DCCD |
  BEQ CODE_05DCFF                           ; $05DCCF |
  LDA #$FFFF                                ; $05DCD1 |
  STA !s_spr_timer_3,x                      ; $05DCD4 |
  LDA #$0100                                ; $05DCD7 |
  STA !s_spr_timer_2,x                      ; $05DCDA |
  LDA #$0007                                ; $05DCDD |
  STA !s_spr_anim_frame,x                   ; $05DCE0 |
  LDA #$FC00                                ; $05DCE3 |
  STA !s_spr_y_accel_ceiling,x              ; $05DCE6 |
  STZ !s_spr_x_accel_ceiling,x              ; $05DCE9 |
  LDA #$0008                                ; $05DCEC |
  STA !s_spr_y_accel,x                      ; $05DCEF |
  STA !s_spr_x_accel,x                      ; $05DCF2 |
  LDY #$0A                                  ; $05DCF5 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DCF7 |
  BRA CODE_05DCFF                           ; $05DCF9 |

CODE_05DCFB:
  JSL $03A5B7                               ; $05DCFB |

CODE_05DCFF:
  JSR CODE_05DD1A                           ; $05DCFF |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05DD02 |
  BNE CODE_05DD0E                           ; $05DD04 |
  TXY                                       ; $05DD06 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05DD07 |
  ASL A                                     ; $05DD09 |
  TAX                                       ; $05DD0A |
  JSR ($DCA8,x)                             ; $05DD0B |

CODE_05DD0E:
  JSR CODE_05DF1E                           ; $05DD0E |
  RTL                                       ; $05DD11 |

  dw $FF00, $0100                           ; $05DD12 |

  dw $FE80, $0180                           ; $05DD16 |

CODE_05DD1A:
  LDA !s_spr_timer_3,x                      ; $05DD1A |
  BNE CODE_05DD4B                           ; $05DD1D |
  LDA $61F2                                 ; $05DD1F |
  BEQ CODE_05DD27                           ; $05DD22 |
  JMP CODE_05DE0B                           ; $05DD24 |

CODE_05DD27:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05DD27 |
  CPY #$02                                  ; $05DD29 |
  BEQ CODE_05DD35                           ; $05DD2B |
  CPY #$03                                  ; $05DD2D |
  BEQ CODE_05DD35                           ; $05DD2F |
  CPY #$09                                  ; $05DD31 |
  BNE CODE_05DD4C                           ; $05DD33 |

CODE_05DD35:
  LDA #$0003                                ; $05DD35 |
  STA !s_spr_anim_frame,x                   ; $05DD38 |
  INC A                                     ; $05DD3B |
  STA !s_spr_timer_2,x                      ; $05DD3C |
  LDA #$FFFF                                ; $05DD3F |
  STA !s_spr_timer_3,x                      ; $05DD42 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05DD45 |
  LDY #$07                                  ; $05DD47 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DD49 |

CODE_05DD4B:
  RTS                                       ; $05DD4B |

CODE_05DD4C:
  CPY #$04                                  ; $05DD4C |
  BNE CODE_05DD89                           ; $05DD4E |
  STZ !s_spr_x_accel_ceiling,x              ; $05DD50 |
  STZ !s_spr_y_accel_ceiling,x              ; $05DD53 |
  LDA !s_spr_x_player_delta,x               ; $05DD56 |
  BPL CODE_05DD5F                           ; $05DD59 |
  EOR #$FFFF                                ; $05DD5B |
  INC A                                     ; $05DD5E |

CODE_05DD5F:
  LSR A                                     ; $05DD5F |
  LSR A                                     ; $05DD60 |
  STA !s_spr_x_accel,x                      ; $05DD61 |
  LDA !s_spr_y_player_delta,x               ; $05DD64 |
  BPL CODE_05DD6D                           ; $05DD67 |
  EOR #$FFFF                                ; $05DD69 |
  INC A                                     ; $05DD6C |

CODE_05DD6D:
  LSR A                                     ; $05DD6D |
  LSR A                                     ; $05DD6E |
  STA !s_spr_y_accel,x                      ; $05DD6F |
  LDA #$0002                                ; $05DD72 |
  STA !s_spr_anim_frame,x                   ; $05DD75 |
  LDA #$0004                                ; $05DD78 |
  STA !s_spr_timer_2,x                      ; $05DD7B |
  LDA #$FFFF                                ; $05DD7E |
  STA !s_spr_timer_3,x                      ; $05DD81 |
  LDY #$06                                  ; $05DD84 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DD86 |
  RTS                                       ; $05DD88 |

CODE_05DD89:
  CPY #$06                                  ; $05DD89 |
  BNE CODE_05DDA0                           ; $05DD8B |
  LDA #$0003                                ; $05DD8D |
  STA !s_spr_anim_frame,x                   ; $05DD90 |
  INC A                                     ; $05DD93 |
  STA !s_spr_timer_2,x                      ; $05DD94 |
  LDA #$FFFF                                ; $05DD97 |
  STA !s_spr_timer_3,x                      ; $05DD9A |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DD9D |
  RTS                                       ; $05DD9F |

CODE_05DDA0:
  CPY #$07                                  ; $05DDA0 |
  BNE CODE_05DDC0                           ; $05DDA2 |
  LDA #$0005                                ; $05DDA4 |
  STA !s_spr_anim_frame,x                   ; $05DDA7 |
  DEC A                                     ; $05DDAA |
  STA !s_spr_timer_2,x                      ; $05DDAB |
  DEC A                                     ; $05DDAE |
  STA !s_spr_wildcard_1_lo,x                ; $05DDAF |
  LDA !s_spr_facing_dir,x                   ; $05DDB2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DDB5 |
  LDA #$FFFF                                ; $05DDB7 |
  STA !s_spr_timer_3,x                      ; $05DDBA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DDBD |
  RTS                                       ; $05DDBF |

CODE_05DDC0:
  CPY #$08                                  ; $05DDC0 |
  BNE CODE_05DE0A                           ; $05DDC2 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05DDC4 |
  DEC !s_spr_wildcard_1_lo,x                ; $05DDC6 |
  BNE CODE_05DDF5                           ; $05DDC9 |
  LDY #$00                                  ; $05DDCB |
  LDA !s_spr_y_pixel_pos,x                  ; $05DDCD |
  CMP !s_spr_wildcard_2_lo,x                ; $05DDD0 |
  BMI CODE_05DDD7                           ; $05DDD3 |
  INY                                       ; $05DDD5 |
  INY                                       ; $05DDD6 |

CODE_05DDD7:
  LDA $DC6E,y                               ; $05DDD7 |
  STA !s_spr_y_accel_ceiling,x              ; $05DDDA |
  LDA $DC70,y                               ; $05DDDD |
  STA !s_spr_y_speed_lo,x                   ; $05DDE0 |
  LDY !s_spr_facing_dir,x                   ; $05DDE3 |
  LDA $DC6A,y                               ; $05DDE6 |
  STA !s_spr_x_accel_ceiling,x              ; $05DDE9 |
  LDA #$0100                                ; $05DDEC |
  STA !s_spr_timer_1,x                      ; $05DDEF |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05DDF2 |
  RTS                                       ; $05DDF4 |

CODE_05DDF5:
  LDA #$0005                                ; $05DDF5 |
  STA !s_spr_anim_frame,x                   ; $05DDF8 |
  DEC A                                     ; $05DDFB |
  STA !s_spr_timer_2,x                      ; $05DDFC |
  LDA !s_spr_facing_dir,x                   ; $05DDFF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DE02 |
  LDA #$FFFF                                ; $05DE04 |
  STA !s_spr_timer_3,x                      ; $05DE07 |

CODE_05DE0A:
  RTS                                       ; $05DE0A |

CODE_05DE0B:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05DE0B |
  BEQ CODE_05DE13                           ; $05DE0D |
  CPY #$07                                  ; $05DE0F |
  BNE CODE_05DE4B                           ; $05DE11 |

CODE_05DE13:
  STZ !s_spr_x_accel_ceiling,x              ; $05DE13 |
  STZ !s_spr_y_accel_ceiling,x              ; $05DE16 |
  LDA #$0010                                ; $05DE19 |
  STA !s_spr_x_accel,x                      ; $05DE1C |
  STA !s_spr_y_accel,x                      ; $05DE1F |
  LDA #$FFFF                                ; $05DE22 |
  STA !s_spr_timer_3,x                      ; $05DE25 |
  LDY #$02                                  ; $05DE28 |
  LDA $6EB4                                 ; $05DE2A |
  STA !s_spr_gsu_morph_2_lo,x               ; $05DE2D |
  LDA $6EB2                                 ; $05DE30 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05DE33 |
  SEC                                       ; $05DE36 |
  SBC !s_spr_x_pixel_pos,x                  ; $05DE37 |
  STA $00                                   ; $05DE3A |
  LDA !s_spr_facing_dir,x                   ; $05DE3C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DE3F |
  DEC A                                     ; $05DE41 |
  EOR $00                                   ; $05DE42 |
  BPL CODE_05DE48                           ; $05DE44 |
  LDY #$03                                  ; $05DE46 |

CODE_05DE48:
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DE48 |
  RTS                                       ; $05DE4A |

CODE_05DE4B:
  CPY #$02                                  ; $05DE4B |
  BEQ CODE_05DE57                           ; $05DE4D |
  CPY #$03                                  ; $05DE4F |
  BEQ CODE_05DE57                           ; $05DE51 |
  CPY #$09                                  ; $05DE53 |
  BNE CODE_05DE9E                           ; $05DE55 |

CODE_05DE57:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05DE57 |
  LDA #$0004                                ; $05DE59 |
  STA !s_spr_timer_2,x                      ; $05DE5C |
  LDA #$FFFF                                ; $05DE5F |
  STA !s_spr_timer_3,x                      ; $05DE62 |
  LDY #$00                                  ; $05DE65 |
  LDA $6EB2                                 ; $05DE67 |
  CMP !s_spr_x_pixel_pos,x                  ; $05DE6A |
  BMI CODE_05DE71                           ; $05DE6D |
  INY                                       ; $05DE6F |
  INY                                       ; $05DE70 |

CODE_05DE71:
  TYA                                       ; $05DE71 |
  CMP !s_spr_facing_dir,x                   ; $05DE72 |
  BEQ CODE_05DE87                           ; $05DE75 |
  LDA #$0009                                ; $05DE77 |
  STA !s_spr_anim_frame,x                   ; $05DE7A |
  LDA !s_spr_facing_dir,x                   ; $05DE7D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DE80 |
  LDY #$09                                  ; $05DE82 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DE84 |
  RTS                                       ; $05DE86 |

CODE_05DE87:
  LDA $6EB2                                 ; $05DE87 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05DE8A |
  LDA $6EB4                                 ; $05DE8D |
  STA !s_spr_gsu_morph_2_lo,x               ; $05DE90 |
  LDA #$0002                                ; $05DE93 |
  STA !s_spr_anim_frame,x                   ; $05DE96 |
  LDY #$04                                  ; $05DE99 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DE9B |
  RTS                                       ; $05DE9D |

CODE_05DE9E:
  CPY #$04                                  ; $05DE9E |
  BNE CODE_05DF15                           ; $05DEA0 |
  LDA $6EB2                                 ; $05DEA2 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05DEA5 |
  LDA $6EB4                                 ; $05DEA8 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05DEAB |

CODE_05DEAE:
  LDA #$0040                                ; $05DEAE |
  STA !s_spr_timer_3,x                      ; $05DEB1 |
  LDA !s_spr_x_player_delta,x               ; $05DEB4 |
  BPL CODE_05DEBD                           ; $05DEB7 |
  EOR #$FFFF                                ; $05DEB9 |
  INC A                                     ; $05DEBC |

CODE_05DEBD:
  LSR A                                     ; $05DEBD |
  LSR A                                     ; $05DEBE |
  LSR A                                     ; $05DEBF |
  STA !s_spr_x_accel,x                      ; $05DEC0 |
  LDA !s_spr_y_player_delta,x               ; $05DEC3 |
  BPL CODE_05DECC                           ; $05DEC6 |
  EOR #$FFFF                                ; $05DEC8 |
  INC A                                     ; $05DECB |

CODE_05DECC:
  LSR A                                     ; $05DECC |
  LSR A                                     ; $05DECD |
  LSR A                                     ; $05DECE |
  STA !s_spr_y_accel,x                      ; $05DECF |
  LDY #$00                                  ; $05DED2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05DED4 |
  CMP !s_spr_x_pixel_pos,x                  ; $05DED7 |
  BMI CODE_05DEDE                           ; $05DEDA |
  INY                                       ; $05DEDC |
  INY                                       ; $05DEDD |

CODE_05DEDE:
  LDA $DD12,y                               ; $05DEDE |
  STA !s_spr_x_accel_ceiling,x              ; $05DEE1 |
  TYA                                       ; $05DEE4 |
  CMP !s_spr_facing_dir,x                   ; $05DEE5 |
  BEQ CODE_05DF02                           ; $05DEE8 |
  LDA #$FFFF                                ; $05DEEA |
  STA !s_spr_timer_3,x                      ; $05DEED |
  LDA !s_spr_facing_dir,x                   ; $05DEF0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DEF3 |
  DEC !s_spr_anim_frame,x                   ; $05DEF5 |
  LDA #$0004                                ; $05DEF8 |
  STA !s_spr_timer_2,x                      ; $05DEFB |
  LDY #$05                                  ; $05DEFE |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05DF00 |

CODE_05DF02:
  LDY #$00                                  ; $05DF02 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05DF04 |
  CMP !s_spr_y_pixel_pos,x                  ; $05DF07 |
  BMI CODE_05DF0E                           ; $05DF0A |
  INY                                       ; $05DF0C |
  INY                                       ; $05DF0D |

CODE_05DF0E:
  LDA $DD16,y                               ; $05DF0E |
  STA !s_spr_y_accel_ceiling,x              ; $05DF11 |

CODE_05DF14:
  RTS                                       ; $05DF14 |

CODE_05DF15:
  CPY #$08                                  ; $05DF15 |
  BNE CODE_05DF14                           ; $05DF17 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05DF19 |
  JMP CODE_05DE13                           ; $05DF1B |

CODE_05DF1E:
  LDA !s_spr_x_accel_ceiling,x              ; $05DF1E |
  BNE CODE_05DF3F                           ; $05DF21 |
  LDA !s_spr_x_accel,x                      ; $05DF23 |
  BEQ CODE_05DF3F                           ; $05DF26 |
  DEC A                                     ; $05DF28 |
  STA $00                                   ; $05DF29 |
  ASL A                                     ; $05DF2B |
  STA $7962                                 ; $05DF2C |
  LDA !s_spr_x_speed_lo,x                   ; $05DF2F |
  CLC                                       ; $05DF32 |
  ADC $00                                   ; $05DF33 |
  CMP $02                                   ; $05DF35 |
  BCS CODE_05DF3F                           ; $05DF37 |
  STZ !s_spr_x_speed_lo,x                   ; $05DF39 |
  STZ !s_spr_x_accel,x                      ; $05DF3C |

CODE_05DF3F:
  LDA !s_spr_y_accel_ceiling,x              ; $05DF3F |
  BNE CODE_05DF5F                           ; $05DF42 |
  LDA !s_spr_y_accel,x                      ; $05DF44 |
  BEQ CODE_05DF5F                           ; $05DF47 |
  DEC A                                     ; $05DF49 |
  STA $00                                   ; $05DF4A |
  ASL A                                     ; $05DF4C |
  STA $02                                   ; $05DF4D |
  LDA !s_spr_y_speed_lo,x                   ; $05DF4F |
  CLC                                       ; $05DF52 |
  ADC $00                                   ; $05DF53 |
  CMP $02                                   ; $05DF55 |
  BCS CODE_05DF5F                           ; $05DF57 |
  STZ !s_spr_y_speed_lo,x                   ; $05DF59 |
  STZ !s_spr_y_accel,x                      ; $05DF5C |

CODE_05DF5F:
  RTS                                       ; $05DF5F |

  TYX                                       ; $05DF60 |
  LDA !s_spr_timer_1,x                      ; $05DF61 |
  BNE CODE_05DF7F                           ; $05DF64 |
  STZ !s_spr_x_accel_ceiling,x              ; $05DF66 |
  LDA !s_spr_x_speed_lo,x                   ; $05DF69 |
  ORA !s_spr_x_accel,x                      ; $05DF6C |
  BNE CODE_05DF7F                           ; $05DF6F |
  LDA !s_spr_facing_dir,x                   ; $05DF71 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05DF74 |
  LDA #$0005                                ; $05DF76 |
  STA !s_spr_anim_frame,x                   ; $05DF79 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05DF7C |
  RTS                                       ; $05DF7E |

CODE_05DF7F:
  LDA #$0006                                ; $05DF7F |
  STA !s_spr_x_accel,x                      ; $05DF82 |
  STA !s_spr_y_accel,x                      ; $05DF85 |
  LDY #$00                                  ; $05DF88 |
  LDA !s_spr_y_pixel_pos,x                  ; $05DF8A |
  CMP !s_spr_wildcard_2_lo,x                ; $05DF8D |
  BMI CODE_05DF94                           ; $05DF90 |
  INY                                       ; $05DF92 |
  INY                                       ; $05DF93 |

CODE_05DF94:
  LDA $DC6E,y                               ; $05DF94 |
  STA !s_spr_y_accel_ceiling,x              ; $05DF97 |
  RTS                                       ; $05DF9A |

  TYX                                       ; $05DF9B |
  LDA !s_spr_timer_2,x                      ; $05DF9C |
  BNE CODE_05DFC9                           ; $05DF9F |
  LDA !s_spr_facing_dir,x                   ; $05DFA1 |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $05DFA4 |
  BEQ CODE_05DFBD                           ; $05DFA6 |
  STZ !s_spr_anim_frame,x                   ; $05DFA8 |
  LDA #$0100                                ; $05DFAB |
  STA !s_spr_timer_1,x                      ; $05DFAE |
  LDY !s_spr_facing_dir,x                   ; $05DFB1 |
  LDA $DC6A,y                               ; $05DFB4 |
  STA !s_spr_x_accel_ceiling,x              ; $05DFB7 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05DFBA |
  RTS                                       ; $05DFBC |

CODE_05DFBD:
  EOR #$0002                                ; $05DFBD |
  STA !s_spr_facing_dir,x                   ; $05DFC0 |
  LDA #$0008                                ; $05DFC3 |
  STA !s_spr_timer_2,x                      ; $05DFC6 |

CODE_05DFC9:
  JMP CODE_05DF7F                           ; $05DFC9 |
  TYX                                       ; $05DFCC |
  LDA !s_spr_timer_2,x                      ; $05DFCD |
  BNE CODE_05E00F                           ; $05DFD0 |
  DEC !s_spr_anim_frame,x                   ; $05DFD2 |
  LDY !s_spr_anim_frame,x                   ; $05DFD5 |
  CPY #$03                                  ; $05DFD8 |
  BEQ CODE_05E009                           ; $05DFDA |
  BRA CODE_05DFEB                           ; $05DFDC |
  TYX                                       ; $05DFDE |
  LDA !s_spr_timer_2,x                      ; $05DFDF |
  BNE CODE_05E00F                           ; $05DFE2 |
  LDA !s_spr_facing_dir,x                   ; $05DFE4 |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $05DFE7 |
  BEQ CODE_05E000                           ; $05DFE9 |

CODE_05DFEB:
  LDA #$0008                                ; $05DFEB |
  STA !s_spr_anim_frame,x                   ; $05DFEE |
  LDA #$0040                                ; $05DFF1 |
  STA !s_spr_timer_3,x                      ; $05DFF4 |
  STZ !s_spr_x_accel_ceiling,x              ; $05DFF7 |
  STZ !s_spr_y_accel_ceiling,x              ; $05DFFA |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05DFFD |
  RTS                                       ; $05DFFF |

CODE_05E000:
  LDA !s_spr_facing_dir,x                   ; $05E000 |
  EOR #$0002                                ; $05E003 |
  STA !s_spr_facing_dir,x                   ; $05E006 |

CODE_05E009:
  LDA #$0004                                ; $05E009 |
  STA !s_spr_timer_2,x                      ; $05E00C |

CODE_05E00F:
  RTS                                       ; $05E00F |

  TYX                                       ; $05E010 |
  LDY !s_spr_anim_frame,x                   ; $05E011 |
  CPY #$07                                  ; $05E014 |
  BEQ CODE_05E026                           ; $05E016 |
  LDA !s_spr_timer_2,x                      ; $05E018 |
  BNE CODE_05E026                           ; $05E01B |
  LDA #$0007                                ; $05E01D |
  STA !s_spr_anim_frame,x                   ; $05E020 |
  JSR CODE_05DEAE                           ; $05E023 |

CODE_05E026:
  RTS                                       ; $05E026 |

  TYX                                       ; $05E027 |
  LDA !s_spr_timer_2,x                      ; $05E028 |
  BNE CODE_05E049                           ; $05E02B |
  LDA !s_spr_facing_dir,x                   ; $05E02D |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $05E030 |
  BEQ CODE_05E03D                           ; $05E032 |
  STZ !s_spr_timer_3,x                      ; $05E034 |
  DEC !s_spr_anim_frame,x                   ; $05E037 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05E03A |
  RTS                                       ; $05E03C |

CODE_05E03D:
  EOR #$0002                                ; $05E03D |
  STA !s_spr_facing_dir,x                   ; $05E040 |
  LDA #$0004                                ; $05E043 |
  STA !s_spr_timer_2,x                      ; $05E046 |

CODE_05E049:
  RTS                                       ; $05E049 |

  TYX                                       ; $05E04A |
  LDA !s_spr_timer_2,x                      ; $05E04B |
  BNE CODE_05E068                           ; $05E04E |
  LDY !s_spr_anim_frame,x                   ; $05E050 |
  CPY #$08                                  ; $05E053 |
  BEQ CODE_05E05D                           ; $05E055 |
  LDA #$0008                                ; $05E057 |
  STA !s_spr_anim_frame,x                   ; $05E05A |

CODE_05E05D:
  LDA !s_spr_x_speed_lo,x                   ; $05E05D |
  ORA !s_spr_y_speed_lo,x                   ; $05E060 |
  BNE CODE_05E068                           ; $05E063 |
  STZ !s_spr_timer_3,x                      ; $05E065 |

CODE_05E068:
  RTS                                       ; $05E068 |

  TYX                                       ; $05E069 |
  LDA !s_spr_timer_2,x                      ; $05E06A |
  BNE CODE_05E086                           ; $05E06D |
  INC !s_spr_anim_frame,x                   ; $05E06F |
  LDY !s_spr_anim_frame,x                   ; $05E072 |
  CPY #$05                                  ; $05E075 |
  BNE CODE_05E080                           ; $05E077 |
  STZ !s_spr_timer_3,x                      ; $05E079 |
  STZ !s_spr_anim_frame,x                   ; $05E07C |
  RTS                                       ; $05E07F |

CODE_05E080:
  LDA #$0004                                ; $05E080 |
  STA !s_spr_timer_2,x                      ; $05E083 |

CODE_05E086:
  RTS                                       ; $05E086 |

  TYX                                       ; $05E087 |
  LDA !s_spr_timer_2,x                      ; $05E088 |
  BNE CODE_05E0B2                           ; $05E08B |
  LDY !s_spr_anim_frame,x                   ; $05E08D |
  BNE CODE_05E09B                           ; $05E090 |
  LDA #$0010                                ; $05E092 |
  STA !s_spr_timer_3,x                      ; $05E095 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05E098 |
  RTS                                       ; $05E09A |

CODE_05E09B:
  LDA !s_spr_facing_dir,x                   ; $05E09B |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $05E09E |
  BEQ CODE_05E0AC                           ; $05E0A0 |
  LDA #$0010                                ; $05E0A2 |
  STA !s_spr_timer_2,x                      ; $05E0A5 |
  STZ !s_spr_anim_frame,x                   ; $05E0A8 |
  RTS                                       ; $05E0AB |

CODE_05E0AC:
  EOR #$0002                                ; $05E0AC |
  STA !s_spr_facing_dir,x                   ; $05E0AF |

CODE_05E0B2:
  RTS                                       ; $05E0B2 |

  TYX                                       ; $05E0B3 |
  LDA !s_spr_timer_2,x                      ; $05E0B4 |
  BNE CODE_05E0DB                           ; $05E0B7 |
  LDA !s_spr_facing_dir,x                   ; $05E0B9 |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $05E0BC |
  BEQ CODE_05E0CF                           ; $05E0BE |
  LDA #$0020                                ; $05E0C0 |
  STA !s_spr_timer_3,x                      ; $05E0C3 |
  LDA #$0008                                ; $05E0C6 |
  STA !s_spr_anim_frame,x                   ; $05E0C9 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05E0CC |
  RTS                                       ; $05E0CE |

CODE_05E0CF:
  EOR #$0002                                ; $05E0CF |
  STA !s_spr_facing_dir,x                   ; $05E0D2 |
  LDA #$0004                                ; $05E0D5 |
  STA !s_spr_timer_2,x                      ; $05E0D8 |

CODE_05E0DB:
  RTS                                       ; $05E0DB |

  TYX                                       ; $05E0DC |
  LDA !s_spr_timer_2,x                      ; $05E0DD |
  BNE CODE_05E0EA                           ; $05E0E0 |
  STZ !s_spr_timer_3,x                      ; $05E0E2 |
  LDY #$04                                  ; $05E0E5 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E0E7 |
  RTS                                       ; $05E0E9 |

CODE_05E0EA:
  LDA !s_spr_y_pixel_pos,x                  ; $05E0EA |
  CMP !s_spr_wildcard_2_lo,x                ; $05E0ED |
  BPL CODE_05E0F5                           ; $05E0F0 |
  STZ !s_spr_x_accel_ceiling,x              ; $05E0F2 |

CODE_05E0F5:
  JMP CODE_05DF7F                           ; $05E0F5 |

init_heading_cactus:
  DEC !s_spr_wildcard_4_lo_dp,x             ; $05E0F8 |
  LDA #$00E5                                ; $05E0FA |
  JSL spawn_sprite_active                   ; $05E0FD |
  BCC CODE_05E122                           ; $05E101 |
  LDA !s_spr_x_pixel_pos,x                  ; $05E103 |
  STA !s_spr_x_pixel_pos,y                  ; $05E106 |
  STA !s_spr_gsu_morph_1_lo,y               ; $05E109 |
  LDA !s_spr_y_pixel_pos,x                  ; $05E10C |
  SEC                                       ; $05E10F |
  SBC #$0010                                ; $05E110 |
  STA !s_spr_y_pixel_pos,y                  ; $05E113 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05E116 |
  LDA #$0005                                ; $05E118 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05E11B |
  LDY #$02                                  ; $05E11E |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E120 |

CODE_05E122:
  STZ !s_spr_wildcard_1_lo,x                ; $05E122 |
  LDY !r_cur_world                          ; $05E125 |
  BEQ CODE_05E130                           ; $05E128 |
  INC !s_spr_wildcard_1_lo,x                ; $05E12A |
  INC !s_spr_wildcard_1_lo,x                ; $05E12D |

CODE_05E130:
  RTL                                       ; $05E130 |

  dw $E179, $E1A4, $E1EF, $E28F             ; $05E131 |
  dw $E2C2, $E300                           ; $05E139 |

main_heading_cactus:
  JSL $03AF23                               ; $05E13D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E141 |
  BMI CODE_05E149                           ; $05E143 |
  JSL $03A5B7                               ; $05E145 |

CODE_05E149:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E149 |
  BMI CODE_05E170                           ; $05E14B |
  LDA !s_spr_state,y                        ; $05E14D |
  CMP #$0010                                ; $05E150 |
  BNE CODE_05E162                           ; $05E153 |
  LDA !s_spr_wildcard_5_lo,y                ; $05E155 |
  BNE CODE_05E162                           ; $05E158 |
  LDA !s_spr_id,y                           ; $05E15A |
  CMP #$00E5                                ; $05E15D |
  BEQ CODE_05E170                           ; $05E160 |

CODE_05E162:
  LDY #$FF                                  ; $05E162 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05E164 |
  LDA #$0060                                ; $05E166 |
  STA !s_spr_timer_2,x                      ; $05E169 |
  LDY #$05                                  ; $05E16C |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E16E |

CODE_05E170:
  TXY                                       ; $05E170 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05E171 |
  ASL A                                     ; $05E173 |
  TAX                                       ; $05E174 |
  JSR ($E131,x)                             ; $05E175 |
  RTL                                       ; $05E178 |

  TYX                                       ; $05E179 |
  LDA !s_spr_timer_1,x                      ; $05E17A |
  BNE CODE_05E1A3                           ; $05E17D |
  LDA #$00E5                                ; $05E17F |
  JSL spawn_sprite_active                   ; $05E182 |
  BCC CODE_05E1A3                           ; $05E186 |
  LDA !s_spr_x_pixel_pos,x                  ; $05E188 |
  STA !s_spr_x_pixel_pos,y                  ; $05E18B |
  STA !s_spr_gsu_morph_1_lo,y               ; $05E18E |
  LDA !s_spr_y_pixel_pos,x                  ; $05E191 |
  DEC A                                     ; $05E194 |
  DEC A                                     ; $05E195 |
  STA !s_spr_y_pixel_pos,y                  ; $05E196 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $05E199 |
  LDA #$0020                                ; $05E19B |
  STA !s_spr_timer_2,x                      ; $05E19E |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E1A1 |

CODE_05E1A3:
  RTS                                       ; $05E1A3 |

  TYX                                       ; $05E1A4 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E1A5 |
  LDA #$0000                                ; $05E1A7 |
  STA !s_spr_y_speed_lo,y                   ; $05E1AA |
  LDA !s_spr_timer_2,x                      ; $05E1AD |
  BNE CODE_05E1D6                           ; $05E1B0 |
  LDA #$0002                                ; $05E1B2 |
  STA !s_spr_timer_2,x                      ; $05E1B5 |
  LDA !s_spr_y_pixel_pos,y                  ; $05E1B8 |
  DEC A                                     ; $05E1BB |
  STA !s_spr_y_pixel_pos,y                  ; $05E1BC |
  SEC                                       ; $05E1BF |
  SBC !s_spr_y_pixel_pos,x                  ; $05E1C0 |
  CMP #$FFF3                                ; $05E1C3 |
  BNE CODE_05E1D6                           ; $05E1C6 |
  LDA #$0020                                ; $05E1C8 |
  STA !s_spr_timer_2,x                      ; $05E1CB |
  LDA #$0005                                ; $05E1CE |
  STA !s_spr_gsu_morph_1_lo,x               ; $05E1D1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E1D4 |

CODE_05E1D6:
  RTS                                       ; $05E1D6 |

  db $03, $04, $03, $02, $01                ; $05E1D7 |
  db $04, $04, $03, $02, $01                ; $05E1DC |
  db $00, $08, $02, $01, $02                ; $05E1E1 |
  db $00, $00, $02, $01                     ; $05E1E6 |
  db $02, $F0, $EA, $E4, $E2                ; $05E1EA |

  TYX                                       ; $05E1EF |
  LDA !s_spr_timer_2,x                      ; $05E1F0 |
  BNE CODE_05E206                           ; $05E1F3 |
  DEC !s_spr_gsu_morph_1_lo,x               ; $05E1F5 |
  BPL CODE_05E217                           ; $05E1F8 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05E1FA |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05E1FC |
  CPY #$03                                  ; $05E1FE |
  BNE CODE_05E204                           ; $05E200 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05E202 |

CODE_05E204:
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E204 |

CODE_05E206:
  RTS                                       ; $05E206 |

  dw $FC00, $FBC0                           ; $05E207 |
  dw $FB00, $FA00                           ; $05E20B |
  dw $0020, $0030                           ; $05E20F |
  dw $0300, $0300 		                      ; $05E213 | what the fuck

CODE_05E217:
  LDY !s_spr_gsu_morph_1_lo,x               ; $05E217 |
  CPY #$01                                  ; $05E21A |
  BNE CODE_05E24B                           ; $05E21C |
  PHY                                       ; $05E21E |
  LDY !s_spr_wildcard_1_lo,x                ; $05E21F |
  LDA $E20F,y                               ; $05E222 |
  STA $00                                   ; $05E225 |
  LDA $E213,y                               ; $05E227 |
  STA $02                                   ; $05E22A |
  LDA $E207,y                               ; $05E22C |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05E22F |
  CPY #$02                                  ; $05E231 |
  BNE CODE_05E23B                           ; $05E233 |
  LDY !s_spr_wildcard_1_lo,x                ; $05E235 |
  LDA $E20B,y                               ; $05E238 |

CODE_05E23B:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E23B |
  STA !s_spr_y_speed_lo,y                   ; $05E23D |
  LDA $00                                   ; $05E240 |
  STA !s_spr_y_accel,y                      ; $05E242 |
  LDA $02                                   ; $05E245 |
  STA !s_spr_y_accel_ceiling,y              ; $05E247 |
  PLY                                       ; $05E24A |

CODE_05E24B:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05E24B |
  CMP #$0002                                ; $05E24D |
  BEQ CODE_05E260                           ; $05E250 |
  LDA $E1D7,y                               ; $05E252 |
  AND #$00FF                                ; $05E255 |
  STA !s_spr_anim_frame,x                   ; $05E258 |
  LDA $E1E1,y                               ; $05E25B |
  BRA CODE_05E26C                           ; $05E25E |

CODE_05E260:
  LDA $E1DC,y                               ; $05E260 |
  AND #$00FF                                ; $05E263 |
  STA !s_spr_anim_frame,x                   ; $05E266 |
  LDA $E1E6,y                               ; $05E269 |

CODE_05E26C:
  AND #$00FF                                ; $05E26C |
  STA !s_spr_timer_2,x                      ; $05E26F |
  CPY #$01                                  ; $05E272 |
  BMI CODE_05E288                           ; $05E274 |
  LDY !s_spr_anim_frame,x                   ; $05E276 |
  LDA $E1EA,y                               ; $05E279 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E27C |
  ORA #$FF00                                ; $05E27E |
  CLC                                       ; $05E281 |
  ADC !s_spr_y_pixel_pos,x                  ; $05E282 |
  STA !s_spr_y_pixel_pos,y                  ; $05E285 |

CODE_05E288:
  RTS                                       ; $05E288 |

  dw $FFE2, $FFE4, $FFE4                    ; $05E289 |

  TYX                                       ; $05E28F |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05E290 |
  ASL A                                     ; $05E292 |
  TAY                                       ; $05E293 |
  LDA $E289,y                               ; $05E294 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E297 |
  CLC                                       ; $05E299 |
  ADC !s_spr_y_pixel_pos,x                  ; $05E29A |
  CMP !s_spr_y_pixel_pos,y                  ; $05E29D |
  BPL CODE_05E2B6                           ; $05E2A0 |
  STA !s_spr_y_pixel_pos,y                  ; $05E2A2 |
  LDA #$0000                                ; $05E2A5 |
  STA !s_spr_y_accel,y                      ; $05E2A8 |
  STA !s_spr_y_speed_lo,y                   ; $05E2AB |
  LDA #$0002                                ; $05E2AE |
  STA !s_spr_timer_2,x                      ; $05E2B1 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E2B4 |

CODE_05E2B6:
  RTS                                       ; $05E2B6 |

  dw $F0F2, $E4EA                           ; $05E2B7 |
  dw $0104, $0101                           ; $05E2BB |

  db $10, $01, $01                          ; $05E2C0 |

  TYX                                       ; $05E2C2 |
  LDA !s_spr_timer_2,x                      ; $05E2C3 |
  BNE CODE_05E2FF                           ; $05E2C6 |
  DEC !s_spr_anim_frame,x                   ; $05E2C8 |
  LDY !s_spr_anim_frame,x                   ; $05E2CB |
  BNE CODE_05E2DB                           ; $05E2CE |
  LDA #$0005                                ; $05E2D0 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05E2D3 |
  LDA #$0002                                ; $05E2D6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05E2D9 |

CODE_05E2DB:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05E2DB |
  CMP #$0002                                ; $05E2DD |
  BNE CODE_05E2E7                           ; $05E2E0 |
  LDA $E2BF,y                               ; $05E2E2 |
  BRA CODE_05E2EA                           ; $05E2E5 |

CODE_05E2E7:
  LDA $E2BB,y                               ; $05E2E7 |

CODE_05E2EA:
  AND #$00FF                                ; $05E2EA |
  STA !s_spr_timer_2,x                      ; $05E2ED |
  LDA $E2B7,y                               ; $05E2F0 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E2F3 |
  ORA #$FF00                                ; $05E2F5 |
  CLC                                       ; $05E2F8 |
  ADC !s_spr_y_pixel_pos,x                  ; $05E2F9 |
  STA !s_spr_y_pixel_pos,y                  ; $05E2FC |

CODE_05E2FF:
  RTS                                       ; $05E2FF |

  TYX                                       ; $05E300 |
  LDA !s_spr_timer_2,x                      ; $05E301 |
  BNE CODE_05E31C                           ; $05E304 |
  LDA #$0008                                ; $05E306 |
  STA !s_spr_timer_2,x                      ; $05E309 |
  DEC !s_spr_anim_frame,x                   ; $05E30C |
  BPL CODE_05E31C                           ; $05E30F |
  STZ !s_spr_anim_frame,x                   ; $05E311 |
  LDA #$0180                                ; $05E314 |
  STA !s_spr_timer_1,x                      ; $05E317 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05E31A |

CODE_05E31C:
  RTS                                       ; $05E31C |

init_muddy_buddy:
  JSL $03AE60                               ; $05E31D |
  LDA #$0100                                ; $05E321 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05E324 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05E327 |
  JSR CODE_05E63A                           ; $05E32A |
  RTL                                       ; $05E32D |

  dw $E6F7                                  ; $05E32E |
  dw $E75E                                  ; $05E330 |
  dw $E7AC                                  ; $05E332 |
  dw $E7D5                                  ; $05E334 |
  dw $E75E                                  ; $05E336 |
  dw $E82A                                  ; $05E338 |
  dw $E85D                                  ; $05E33A |
  dw $E898                                  ; $05E33C |
  dw $E898                                  ; $05E33E |
  dw $E937                                  ; $05E340 |

  dw $0200, $FE00                           ; $05E342 |

main_muddy_buddy:
  JSR CODE_05E3EE                           ; $05E346 |
  LDA !s_spr_state,x                        ; $05E349 |
  CMP #$0010                                ; $05E34C |
  BEQ CODE_05E358                           ; $05E34F |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05E351 |
  BEQ CODE_05E358                           ; $05E353 |
  JSR CODE_05E524                           ; $05E355 |

CODE_05E358:
  JSL $03AF23                               ; $05E358 |
  JSR CODE_05E6BD                           ; $05E35C |
  JSR CODE_05E6D9                           ; $05E35F |
  JSR CODE_05E44C                           ; $05E362 |
  TXY                                       ; $05E365 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05E366 |
  ASL A                                     ; $05E368 |
  TAX                                       ; $05E369 |
  JSR ($E32E,x)                             ; $05E36A |
  JSR CODE_05E63A                           ; $05E36D |
  CPX $61B6                                 ; $05E370 |
  BNE CODE_05E379                           ; $05E373 |
  JSR CODE_05E67D                           ; $05E375 |

CODE_05E378:
  RTL                                       ; $05E378 |

CODE_05E379:
  TXA                                       ; $05E379 |
  STA !gsu_r1                               ; $05E37A |
  LDX #$09                                  ; $05E37D |
  LDA #$9011                                ; $05E37F |
  JSL r_gsu_init_1                          ; $05E382 | GSU init
  BRA CODE_05E391                           ; $05E386 |

CODE_05E388:
  LDX #$09                                  ; $05E388 |
  LDA !gsu_r15                              ; $05E38A |
  JSL r_gsu_init_1                          ; $05E38D | GSU init

CODE_05E391:
  LDX $12                                   ; $05E391 |
  LDY !gsu_r14                              ; $05E393 |
  BMI CODE_05E378                           ; $05E396 |
  BEQ CODE_05E378                           ; $05E398 |
  LDA !s_spr_state,y                        ; $05E39A |
  CMP #$0010                                ; $05E39D |
  BNE CODE_05E388                           ; $05E3A0 |
  LDA !s_spr_collision_state,y              ; $05E3A2 |
  BEQ CODE_05E388                           ; $05E3A5 |
  LDA !s_spr_id,y                           ; $05E3A7 |
  CMP #$0022                                ; $05E3AA |
  BCC CODE_05E3B4                           ; $05E3AD |
  CMP #$002C                                ; $05E3AF |
  BCC CODE_05E3C3                           ; $05E3B2 |

CODE_05E3B4:
  LDA !s_spr_bitwise_settings_3,y           ; $05E3B4 |
  AND #$4000                                ; $05E3B7 |
  BNE CODE_05E388                           ; $05E3BA |
  TYX                                       ; $05E3BC |
  JSL $03B25B                               ; $05E3BD |
  BRA CODE_05E388                           ; $05E3C1 |

CODE_05E3C3:
  LDA !s_spr_wildcard_6_lo,y                ; $05E3C3 |
  BNE CODE_05E388                           ; $05E3C6 |
  PHX                                       ; $05E3C8 |
  LDX #$00                                  ; $05E3C9 |
  LDA $6000                                 ; $05E3CB |
  BPL CODE_05E3D2                           ; $05E3CE |
  INX                                       ; $05E3D0 |
  INX                                       ; $05E3D1 |

CODE_05E3D2:
  LDA $05E342,x                             ; $05E3D2 |
  PLX                                       ; $05E3D6 |
  STA !s_spr_x_speed_lo,y                   ; $05E3D7 |
  LDA #$FC00                                ; $05E3DA |
  STA !s_spr_y_speed_lo,y                   ; $05E3DD |
  LDA #$0040                                ; $05E3E0 |
  STA !s_spr_y_accel,y                      ; $05E3E3 |
  LDA #$0001                                ; $05E3E6 |
  STA !s_spr_collision_state,y              ; $05E3E9 |
  BRA CODE_05E388                           ; $05E3EC |

CODE_05E3EE:
  LDA !s_spr_oam_yxppccct,x                 ; $05E3EE |
  AND #$FF00                                ; $05E3F1 |
  BNE CODE_05E447                           ; $05E3F4 |
  LDY !s_spr_draw_priority,x                ; $05E3F6 |
  BMI CODE_05E447                           ; $05E3F9 |
  JSL $03AA52                               ; $05E3FB |
  LDA !s_spr_cam_x_pos,x                    ; $05E3FF |
  CLC                                       ; $05E402 |
  ADC #$0004                                ; $05E403 |
  STA $00                                   ; $05E406 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05E408 |
  STA !gsu_r6                               ; $05E40B |
  LDA #$0002                                ; $05E40E |
  STA $02                                   ; $05E411 |
  REP #$10                                  ; $05E413 |
  LDY !s_spr_oam_pointer,x                  ; $05E415 |

CODE_05E418:
  PHY                                       ; $05E418 |
  LDA $6020,y                               ; $05E419 |
  SEC                                       ; $05E41C |
  SBC $00                                   ; $05E41D |
  STA !gsu_r0                               ; $05E41F |
  SEP #$10                                  ; $05E422 |
  LDX #$0B                                  ; $05E424 |
  LDA #$86B6                                ; $05E426 |
  JSL r_gsu_init_1                          ; $05E429 | GSU init
  REP #$10                                  ; $05E42D |
  PLY                                       ; $05E42F |
  LDA $00                                   ; $05E430 |
  CLC                                       ; $05E432 |
  ADC !gsu_r0                               ; $05E433 |
  STA $6020,y                               ; $05E436 |
  TYA                                       ; $05E439 |
  CLC                                       ; $05E43A |
  ADC #$0008                                ; $05E43B |
  TAY                                       ; $05E43E |
  DEC $02                                   ; $05E43F |
  BNE CODE_05E418                           ; $05E441 |
  SEP #$10                                  ; $05E443 |
  LDX $12                                   ; $05E445 |

CODE_05E447:
  RTS                                       ; $05E447 |

  dw $0100, $FF00                           ; $05E448 |

CODE_05E44C:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05E44C |
  CPY #$09                                  ; $05E44E |
  BPL CODE_05E447                           ; $05E450 |
  LDA #$000E                                ; $05E452 |
  STA !gsu_r0                               ; $05E455 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05E458 |
  STA !gsu_r6                               ; $05E45B |
  LDX #$0B                                  ; $05E45E |
  LDA #$86B6                                ; $05E460 |
  JSL r_gsu_init_1                          ; $05E463 | GSU init
  LDX $12                                   ; $05E467 |
  LDA !gsu_r0                               ; $05E469 |
  CLC                                       ; $05E46C |
  ADC !s_player_hitbox_half_height          ; $05E46D |
  STA $00                                   ; $05E470 |
  CPX $61B6                                 ; $05E472 |
  BNE CODE_05E47A                           ; $05E475 |
  JMP CODE_05E508                           ; $05E477 |

CODE_05E47A:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05E47A |
  CPY #$05                                  ; $05E47C |
  BMI CODE_05E483                           ; $05E47E |
  JMP CODE_05E524                           ; $05E480 |

CODE_05E483:
  LDY !s_spr_collision_id,x                 ; $05E483 |
  BPL CODE_05E447                           ; $05E486 |
  LDA !s_spr_y_pixel_pos,x                  ; $05E488 |
  CLC                                       ; $05E48B |
  ADC #$0010                                ; $05E48C |
  SEC                                       ; $05E48F |
  SBC !s_player_center_y                    ; $05E490 |
  SEC                                       ; $05E493 |
  SBC $00                                   ; $05E494 |
  CMP #$FFF8                                ; $05E496 |
  BCS CODE_05E4CD                           ; $05E499 |
  LDY !s_spr_x_player_dir,x                 ; $05E49B |
  LDA !s_spr_x_speed_lo,x                   ; $05E49E |
  BEQ CODE_05E4B6                           ; $05E4A1 |
  TYA                                       ; $05E4A3 |
  CMP !s_spr_facing_dir,x                   ; $05E4A4 |
  BNE CODE_05E4B6                           ; $05E4A7 |
  LDA !s_spr_x_speed_lo,x                   ; $05E4A9 |
  CLC                                       ; $05E4AC |
  ADC !s_player_x_speed_prev                ; $05E4AD |
  STA !s_player_x_speed_prev                ; $05E4B0 |
  STA !s_player_x_speed                     ; $05E4B3 |

CODE_05E4B6:
  LDA !s_player_x_speed_prev                ; $05E4B6 |
  CLC                                       ; $05E4B9 |
  ADC $E448,y                               ; $05E4BA |
  STA !s_spr_x_speed_lo,x                   ; $05E4BD |
  LDA #$FF00                                ; $05E4C0 |
  STA !s_spr_y_speed_lo,x                   ; $05E4C3 |
  LDA #$0001                                ; $05E4C6 |
  STA !s_spr_collision_state,x              ; $05E4C9 |
  RTS                                       ; $05E4CC |

CODE_05E4CD:
  LDY !s_player_form                        ; $05E4CD |
  BNE CODE_05E551                           ; $05E4D0 |
  LDY $61B6                                 ; $05E4D2 |
  BNE CODE_05E551                           ; $05E4D5 |
  STX $61B6                                 ; $05E4D7 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05E4DA |
  LDA !s_player_x                           ; $05E4DC |
  SEC                                       ; $05E4DF |
  SBC !s_spr_x_pixel_pos,x                  ; $05E4E0 |
  STA !s_spr_wildcard_2_lo,x                ; $05E4E3 |
  LDA #$7440                                ; $05E4E6 |
  STA !s_spr_bitwise_settings_1,x           ; $05E4E9 |
  LDA #$0401                                ; $05E4EC |
  STA !s_spr_bitwise_settings_3,x           ; $05E4EF |
  LDA #$3105                                ; $05E4F2 |
  STA !s_spr_oam_1,x                        ; $05E4F5 |
  STZ !s_spr_anim_frame,x                   ; $05E4F8 |
  LDA #$0008                                ; $05E4FB |
  STA !s_spr_hitbox_width,x                 ; $05E4FE |
  STA !s_spr_hitbox_height,x                ; $05E501 |
  LDY #$05                                  ; $05E504 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E506 |

CODE_05E508:
  LDY $0D94                                 ; $05E508 |
  BNE CODE_05E51F                           ; $05E50B |
  LDY $7862,x                               ; $05E50D |
  BNE CODE_05E51F                           ; $05E510 |
  LDA !r_joy1_lo_mirror                     ; $05E512 |
  AND #$0400                                ; $05E515 |
  BNE CODE_05E524                           ; $05E518 |
  LDA !s_player_invincibility_timer         ; $05E51A |
  BEQ CODE_05E552                           ; $05E51D |

CODE_05E51F:
  CPX $61B6                                 ; $05E51F |
  BNE CODE_05E551                           ; $05E522 |

CODE_05E524:
  STZ $61B6                                 ; $05E524 |
  STZ !s_player_state                       ; $05E527 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05E52A |
  LDA #$7480                                ; $05E52C |
  STA !s_spr_bitwise_settings_1,x           ; $05E52F |
  LDA #$0C01                                ; $05E532 |
  STA !s_spr_bitwise_settings_3,x           ; $05E535 |
  LDA #$3155                                ; $05E538 |
  STA !s_spr_oam_1,x                        ; $05E53B |
  LDA #$0040                                ; $05E53E |
  STA !s_spr_y_accel,x                      ; $05E541 |
  LDA #$0006                                ; $05E544 |
  STA !s_spr_hitbox_width,x                 ; $05E547 |
  STA !s_spr_hitbox_height,x                ; $05E54A |
  LDY #$09                                  ; $05E54D |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E54F |

CODE_05E551:
  RTS                                       ; $05E551 |

CODE_05E552:
  LDA !s_player_center_x                    ; $05E552 |
  STA !gsu_r8                               ; $05E555 |
  LDA !s_player_center_y                    ; $05E558 |
  SEC                                       ; $05E55B |
  SBC !s_player_hitbox_half_height          ; $05E55C |
  STA !gsu_r0                               ; $05E55F |
  LDX #$0A                                  ; $05E562 |
  LDA #$CE2F                                ; $05E564 |
  JSL r_gsu_init_3                          ; $05E567 | GSU init
  LDX $12                                   ; $05E56B |
  LDY !gsu_r5                               ; $05E56D |
  BEQ CODE_05E584                           ; $05E570 |
  LDY !s_spr_y_speed_hi,x                   ; $05E572 |
  BPL CODE_05E584                           ; $05E575 |
  LDA !s_spr_y_pixel_pos,x                  ; $05E577 |
  SEC                                       ; $05E57A |
  SBC !s_spr_y_delta_lo,x                   ; $05E57B |
  STA !s_spr_y_pixel_pos,x                  ; $05E57E |
  STZ !s_spr_y_speed_lo,x                   ; $05E581 |

CODE_05E584:
  LDA !s_spr_x_speed_lo,x                   ; $05E584 |
  BEQ CODE_05E5B2                           ; $05E587 |
  LDA !s_player_tile_collision              ; $05E589 |
  AND #$01E0                                ; $05E58C |
  BEQ CODE_05E5B2                           ; $05E58F |
  AND #$0180                                ; $05E591 |
  DEC A                                     ; $05E594 |
  EOR !s_spr_x_speed_lo,x                   ; $05E595 |
  BPL CODE_05E5B2                           ; $05E598 |
  LDA !s_spr_x_pixel_pos,x                  ; $05E59A |
  SEC                                       ; $05E59D |
  SBC !s_spr_x_delta_lo,x                   ; $05E59E |
  STA !s_spr_x_pixel_pos,x                  ; $05E5A1 |
  LDA !s_spr_x_speed_lo,x                   ; $05E5A4 |
  EOR #$FFFF                                ; $05E5A7 |
  INC A                                     ; $05E5AA |
  CMP #$8000                                ; $05E5AB |
  ROR A                                     ; $05E5AE |
  STA !s_spr_x_speed_lo,x                   ; $05E5AF |

CODE_05E5B2:
  LDA !s_spr_wildcard_2_lo,x                ; $05E5B2 |
  BEQ CODE_05E5C1                           ; $05E5B5 |
  BPL CODE_05E5BE                           ; $05E5B7 |
  INC !s_spr_wildcard_2_lo,x                ; $05E5B9 |
  BRA CODE_05E5C1                           ; $05E5BC |

CODE_05E5BE:
  DEC !s_spr_wildcard_2_lo,x                ; $05E5BE |

CODE_05E5C1:
  LDA !s_spr_x_pixel_pos,x                  ; $05E5C1 |
  CLC                                       ; $05E5C4 |
  ADC !s_spr_wildcard_2_lo,x                ; $05E5C5 |
  STA !s_player_x                           ; $05E5C8 |
  LDA !s_spr_y_pixel_pos,x                  ; $05E5CB |
  CLC                                       ; $05E5CE |
  ADC #$0012                                ; $05E5CF |
  SEC                                       ; $05E5D2 |
  SBC $00                                   ; $05E5D3 |
  SEC                                       ; $05E5D5 |
  SBC !s_player_center_y                    ; $05E5D6 |
  CLC                                       ; $05E5D9 |
  ADC !s_player_y                           ; $05E5DA |
  STA !s_player_y                           ; $05E5DD |
  LDA $6084                                 ; $05E5E0 |
  ORA #$0700                                ; $05E5E3 |
  EOR #$FFFF                                ; $05E5E6 |
  STA $00                                   ; $05E5E9 |
  LDA !r_joy1_lo_mirror                     ; $05E5EB |
  AND $00                                   ; $05E5EE |
  STA $617A                                 ; $05E5F0 |
  LDA !r_joy1_lo_press_mirror               ; $05E5F3 |
  AND $00                                   ; $05E5F6 |
  STA $617C                                 ; $05E5F8 |
  LDA !s_player_mouth_state                 ; $05E5FB |
  ORA !s_egg_throw_state                    ; $05E5FE |
  BNE CODE_05E617                           ; $05E601 |
  LDA !r_joy1_hi_mirror                     ; $05E603 |
  AND #$0003                                ; $05E606 |
  BEQ CODE_05E617                           ; $05E609 |
  AND #$0002                                ; $05E60B |
  STA !s_player_direction                   ; $05E60E |
  EOR #$0002                                ; $05E611 |
  STA !s_spr_facing_dir,x                   ; $05E614 |

CODE_05E617:
  LDA #$0002                                ; $05E617 |
  STA !s_player_state                       ; $05E61A |
  STZ !s_player_x_speed_prev                ; $05E61D |
  STZ !s_player_y_speed                     ; $05E620 |
  STZ !s_player_ground_pound_state          ; $05E623 |
  INC !s_on_sprite_platform_flag            ; $05E626 |
  LDY #$40                                  ; $05E629 |
  LDA !r_joy1_lo_mirror                     ; $05E62B |
  AND $6084                                 ; $05E62E |
  BEQ CODE_05E635                           ; $05E631 |
  LDY #$20                                  ; $05E633 |

CODE_05E635:
  TYA                                       ; $05E635 |
  STA !s_spr_y_accel,x                      ; $05E636 |
  RTS                                       ; $05E639 |

CODE_05E63A:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05E63A |
  STA !gsu_r11                              ; $05E63D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05E640 |
  STA !gsu_r6                               ; $05E643 |
  LDA #$0054                                ; $05E646 |
  STA !gsu_r13                              ; $05E649 |
  LDA #$4000                                ; $05E64C |
  STA !gsu_r12                              ; $05E64F |
  LDA #$0008                                ; $05E652 |
  STA !gsu_r8                               ; $05E655 |
  ASL A                                     ; $05E658 |
  STA !gsu_r9                               ; $05E659 |
  LDY !s_spr_dyntile_index,x                ; $05E65C |
  TYX                                       ; $05E65F |
  LDA $03A9CE,x                             ; $05E660 |
  STA !gsu_r3                               ; $05E664 |
  LDA $03A9EE,x                             ; $05E667 |
  STA !gsu_r2                               ; $05E66B |
  LDX #$08                                  ; $05E66E |
  LDA #$82FA                                ; $05E670 |
  JSL r_gsu_init_1                          ; $05E673 | GSU init
  LDX $12                                   ; $05E677 |
  INC $0CF9                                 ; $05E679 |
  RTS                                       ; $05E67C |

CODE_05E67D:
  LDY !s_spr_y_speed_hi,x                   ; $05E67D |
  BMI CODE_05E6BC                           ; $05E680 |
  TXA                                       ; $05E682 |
  STA !gsu_r1                               ; $05E683 |
  LDX #$09                                  ; $05E686 |
  LDA #$8F9C                                ; $05E688 |
  JSL r_gsu_init_1                          ; $05E68B | GSU init

CODE_05E68F:
  LDX $12                                   ; $05E68F |
  LDY !gsu_r14                              ; $05E691 |
  BMI CODE_05E6BC                           ; $05E694 |
  BEQ CODE_05E6BC                           ; $05E696 |
  LDA !s_spr_state,y                        ; $05E698 |
  CMP #$0010                                ; $05E69B |
  BNE CODE_05E6BC                           ; $05E69E |
  LDA !s_spr_collision_state,y              ; $05E6A0 |
  BNE CODE_05E6BC                           ; $05E6A3 |
  TYX                                       ; $05E6A5 |
  JSL $03B24B                               ; $05E6A6 |
  LDA #$001D                                ; $05E6AA |
  JSL push_sound_queue                      ; $05E6AD |
  LDX #$09                                  ; $05E6B1 |
  LDA !gsu_r15                              ; $05E6B3 |
  JSL r_gsu_init_1                          ; $05E6B6 | GSU init
  BRA CODE_05E68F                           ; $05E6BA |

CODE_05E6BC:
  RTS                                       ; $05E6BC |

CODE_05E6BD:
  LDA $7860,x                               ; $05E6BD |
  AND #$000C                                ; $05E6C0 |
  BEQ CODE_05E6D8                           ; $05E6C3 |
  AND #$0008                                ; $05E6C5 |
  DEC A                                     ; $05E6C8 |
  EOR !s_spr_x_speed_lo,x                   ; $05E6C9 |
  BPL CODE_05E6D8                           ; $05E6CC |
  LDA !s_spr_x_pixel_pos,x                  ; $05E6CE |
  SEC                                       ; $05E6D1 |
  SBC !s_spr_x_delta_lo,x                   ; $05E6D2 |
  STA !s_spr_x_pixel_pos,x                  ; $05E6D5 |

CODE_05E6D8:
  RTS                                       ; $05E6D8 |

CODE_05E6D9:
  CPX $61B6                                 ; $05E6D9 |
  BNE CODE_05E6F2                           ; $05E6DC |
  LDA !s_spr_cam_x_pos,x                    ; $05E6DE |
  BMI CODE_05E6E8                           ; $05E6E1 |
  CMP #$00F0                                ; $05E6E3 |
  BMI CODE_05E6F2                           ; $05E6E6 |

CODE_05E6E8:
  SEC                                       ; $05E6E8 |
  SBC !s_spr_x_delta_lo,x                   ; $05E6E9 |
  STA !s_spr_x_pixel_pos,x                  ; $05E6EC |
  STZ !s_spr_x_speed_lo,x                   ; $05E6EF |

CODE_05E6F2:
  RTS                                       ; $05E6F2 |

  dw $FF00, $0100                           ; $05E6F3 |

  TYX                                       ; $05E6F7 |
  LDA !s_spr_timer_1,x                      ; $05E6F8 |
  BNE CODE_05E71B                           ; $05E6FB |
  LDA $11                                   ; $05E6FD |
  AND #$0002                                ; $05E6FF |
  STA !s_spr_facing_dir,x                   ; $05E702 |
  TAY                                       ; $05E705 |
  LDA $E6F3,y                               ; $05E706 |
  STA !s_spr_x_speed_lo,x                   ; $05E709 |
  LDA $10                                   ; $05E70C |
  AND #$003F                                ; $05E70E |
  CLC                                       ; $05E711 |
  ADC #$0020                                ; $05E712 |
  STA !s_spr_timer_1,x                      ; $05E715 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E718 |
  RTS                                       ; $05E71A |

CODE_05E71B:
  LDY !s_spr_x_player_dir,x                 ; $05E71B |
  TYA                                       ; $05E71E |
  CMP !s_spr_facing_dir,x                   ; $05E71F |
  BNE CODE_05E751                           ; $05E722 |
  LDA !s_spr_x_player_delta,x               ; $05E724 |
  CLC                                       ; $05E727 |
  ADC #$0060                                ; $05E728 |
  CMP #$00C0                                ; $05E72B |
  BCS CODE_05E751                           ; $05E72E |
  LDA !s_spr_y_player_delta,x               ; $05E730 |
  CLC                                       ; $05E733 |
  ADC #$0030                                ; $05E734 |
  CMP #$0060                                ; $05E737 |
  BCS CODE_05E751                           ; $05E73A |
  STZ !s_spr_x_speed_lo,x                   ; $05E73C |
  LDA #$0001                                ; $05E73F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05E742 |
  LDA #$0008                                ; $05E744 |
  STA !s_spr_timer_1,x                      ; $05E747 |
  STZ !s_spr_anim_frame,x                   ; $05E74A |
  LDY #$02                                  ; $05E74D |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E74F |

CODE_05E751:
  RTS                                       ; $05E751 |

  db $02, $03, $04, $03, $03, $02, $01, $02 ; $05E752 |
  db $02, $02, $02, $01                     ; $05E75A |

  TYX                                       ; $05E75E |
  LDA !s_spr_timer_1,x                      ; $05E75F |
  BNE CODE_05E779                           ; $05E762 |
  LDA $10                                   ; $05E764 |
  AND #$001F                                ; $05E766 |
  CLC                                       ; $05E769 |
  ADC #$0020                                ; $05E76A |
  STA !s_spr_timer_1,x                      ; $05E76D |
  STZ !s_spr_x_speed_lo,x                   ; $05E770 |
  STZ !s_spr_anim_frame,x                   ; $05E773 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05E776 |
  RTS                                       ; $05E778 |

CODE_05E779:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05E779 |
  CPY #$04                                  ; $05E77B |
  BEQ CODE_05E782                           ; $05E77D |
  JSR CODE_05E71B                           ; $05E77F |

CODE_05E782:
  LDA !s_spr_timer_2,x                      ; $05E782 |
  BNE CODE_05E7A9                           ; $05E785 |
  LDY !s_spr_anim_frame,x                   ; $05E787 |
  INY                                       ; $05E78A |
  CPY #$07                                  ; $05E78B |
  BMI CODE_05E791                           ; $05E78D |
  LDY #$01                                  ; $05E78F |

CODE_05E791:
  TYA                                       ; $05E791 |
  STA !s_spr_anim_frame,x                   ; $05E792 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05E795 |
  CPY #$04                                  ; $05E797 |
  BNE CODE_05E7A0                           ; $05E799 |
  CLC                                       ; $05E79B |
  ADC #$0006                                ; $05E79C |
  TAY                                       ; $05E79F |

CODE_05E7A0:
  LDA $E751,y                               ; $05E7A0 |
  AND #$00FF                                ; $05E7A3 |
  STA !s_spr_timer_2,x                      ; $05E7A6 |

CODE_05E7A9:
  RTS                                       ; $05E7A9 |

  TSB $BB00                                 ; $05E7AA |
  LDA !s_spr_timer_1,x                      ; $05E7AD |
  BNE CODE_05E7CE                           ; $05E7B0 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05E7B2 |
  LDA $E7AA,y                               ; $05E7B4 |
  TAY                                       ; $05E7B7 |
  JSR CODE_05E9C6                           ; $05E7B8 |
  BNE CODE_05E7CE                           ; $05E7BB |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05E7BD |
  BPL CODE_05E7CE                           ; $05E7BF |
  LDA #$FD00                                ; $05E7C1 |
  STA !s_spr_y_speed_lo,x                   ; $05E7C4 |
  LDA #$0001                                ; $05E7C7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05E7CA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E7CC |

CODE_05E7CE:
  RTS                                       ; $05E7CE |

  dw $2418, $FE00, $0200                    ; $05E7CF |

  TYX                                       ; $05E7D5 |
  LDA $7860,x                               ; $05E7D6 |
  AND #$0001                                ; $05E7D9 |
  BEQ CODE_05E80B                           ; $05E7DC |
  STZ !s_spr_anim_frame,x                   ; $05E7DE |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05E7E1 |
  LDA $E7CF,y                               ; $05E7E3 |
  TAY                                       ; $05E7E6 |
  JSR CODE_05E9C6                           ; $05E7E7 |
  BNE CODE_05E80A                           ; $05E7EA |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05E7EC |
  BPL CODE_05E80A                           ; $05E7EE |
  LDY !s_spr_facing_dir,x                   ; $05E7F0 |
  LDA $E7D1,y                               ; $05E7F3 |
  STA !s_spr_x_speed_lo,x                   ; $05E7F6 |
  LDA $10                                   ; $05E7F9 |
  AND #$003F                                ; $05E7FB |
  CLC                                       ; $05E7FE |
  ADC #$0020                                ; $05E7FF |
  STA !s_spr_timer_1,x                      ; $05E802 |
  STZ !s_spr_anim_frame,x                   ; $05E805 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E808 |

CODE_05E80A:
  RTS                                       ; $05E80A |

CODE_05E80B:
  LDY #$18                                  ; $05E80B |
  JSR CODE_05E9C6                           ; $05E80D |

CODE_05E810:
  LDA !s_spr_timer_2,x                      ; $05E810 |
  BNE CODE_05E829                           ; $05E813 |
  LDY !s_spr_anim_frame,x                   ; $05E815 |
  INY                                       ; $05E818 |
  CPY #$07                                  ; $05E819 |
  BMI CODE_05E81F                           ; $05E81B |
  LDY #$01                                  ; $05E81D |

CODE_05E81F:
  TYA                                       ; $05E81F |
  STA !s_spr_anim_frame,x                   ; $05E820 |
  LDA #$0002                                ; $05E823 |
  STA !s_spr_timer_2,x                      ; $05E826 |

CODE_05E829:
  RTS                                       ; $05E829 |

  TYX                                       ; $05E82A |
  LDA $7860,x                               ; $05E82B |
  AND #$0001                                ; $05E82E |
  BEQ CODE_05E84D                           ; $05E831 |
  LDA !s_spr_x_speed_lo,x                   ; $05E833 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05E836 |
  STZ !s_spr_x_speed_lo,x                   ; $05E838 |
  STZ !s_spr_anim_frame,x                   ; $05E83B |
  LDY #$30                                  ; $05E83E |
  JSR CODE_05E9C6                           ; $05E840 |
  BNE CODE_05E84C                           ; $05E843 |
  LDA #$0001                                ; $05E845 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05E848 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05E84A |

CODE_05E84C:
  RTS                                       ; $05E84C |

CODE_05E84D:
  JSR CODE_05E909                           ; $05E84D |
  LDA !r_joy1_lo_mirror                     ; $05E850 |
  AND $6084                                 ; $05E853 |
  BEQ CODE_05E84C                           ; $05E856 |
  JMP CODE_05E810                           ; $05E858 |

  db $60, $3C                               ; $05E85B |

  TYX                                       ; $05E85D |
  LDY #$07                                  ; $05E85E |
  LDA !r_joy1_lo_mirror                     ; $05E860 |
  BIT $6084                                 ; $05E863 |
  BNE CODE_05E86E                           ; $05E866 |
  BIT #$0300                                ; $05E868 |
  BEQ CODE_05E876                           ; $05E86B |
  INY                                       ; $05E86D |

CODE_05E86E:
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E86E |
  LDA #$0001                                ; $05E870 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05E873 |
  RTS                                       ; $05E875 |

CODE_05E876:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05E876 |
  BEQ CODE_05E880                           ; $05E878 |
  CMP #$8000                                ; $05E87A |
  ROR A                                     ; $05E87D |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05E87E |

CODE_05E880:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05E880 |
  BMI CODE_05E88F                           ; $05E882 |
  LDA $E85B,y                               ; $05E884 |
  TAY                                       ; $05E887 |
  JSR CODE_05E9C6                           ; $05E888 |
  BNE CODE_05E88F                           ; $05E88B |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05E88D |

CODE_05E88F:
  RTS                                       ; $05E88F |

  dw $4854, $6C78                           ; $05E890 |

  dw $FB80, $FD00                           ; $05E894 |

  TYX                                       ; $05E898 |
  LDA $7860,x                               ; $05E899 |
  AND #$0001                                ; $05E89C |
  BEQ CODE_05E8D8                           ; $05E89F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05E8A1 |
  BMI CODE_05E8E2                           ; $05E8A3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05E8A5 |
  CPY #$07                                  ; $05E8A7 |
  BEQ CODE_05E8AF                           ; $05E8A9 |
  CLC                                       ; $05E8AB |
  ADC #$0002                                ; $05E8AC |

CODE_05E8AF:
  TAY                                       ; $05E8AF |
  LDA $E890,y                               ; $05E8B0 |
  TAY                                       ; $05E8B3 |
  JSR CODE_05E9C6                           ; $05E8B4 |
  BNE CODE_05E8D7                           ; $05E8B7 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05E8B9 |
  BPL CODE_05E8D7                           ; $05E8BB |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05E8BD |
  SEC                                       ; $05E8BF |
  SBC #$0007                                ; $05E8C0 |
  ASL A                                     ; $05E8C3 |
  TAY                                       ; $05E8C4 |
  LDA $E894,y                               ; $05E8C5 |
  STA !s_spr_y_speed_lo,x                   ; $05E8C8 |
  LDA #$0035                                ; $05E8CB |
  JSL push_sound_queue                      ; $05E8CE |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05E8D2 |
  STA !s_spr_x_speed_lo,x                   ; $05E8D4 |

CODE_05E8D7:
  RTS                                       ; $05E8D7 |

CODE_05E8D8:
  JSR CODE_05E909                           ; $05E8D8 |
  LDY #$18                                  ; $05E8DB |
  JSR CODE_05E9C6                           ; $05E8DD |
  BNE CODE_05E8E6                           ; $05E8E0 |

CODE_05E8E2:
  LDY #$05                                  ; $05E8E2 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05E8E4 |

CODE_05E8E6:
  LDA !r_joy1_lo_mirror                     ; $05E8E6 |
  AND $6084                                 ; $05E8E9 |
  BEQ CODE_05E8D7                           ; $05E8EC |
  JMP CODE_05E810                           ; $05E8EE |

  dw $0020, $FFE0, $0010, $FFF0             ; $05E8F1 |

  dw $0400, $FC00, $0200, $FE00             ; $05E8F9 |

  dw $FFFF, $0000, $FFFF, $0000             ; $05E901 |

CODE_05E909:
  LDA !r_joy1_hi_mirror                     ; $05E909 |
  AND #$0003                                ; $05E90C |
  BEQ CODE_05E936                           ; $05E90F |
  AND #$0002                                ; $05E911 |
  CPY #$00                                  ; $05E914 |
  BEQ CODE_05E91C                           ; $05E916 |
  CLC                                       ; $05E918 |
  ADC #$0004                                ; $05E919 |

CODE_05E91C:
  TAY                                       ; $05E91C |
  LDA $E8F1,y                               ; $05E91D |
  CLC                                       ; $05E920 |
  ADC !s_spr_x_speed_lo,x                   ; $05E921 |
  STA !s_spr_x_speed_lo,x                   ; $05E924 |
  SEC                                       ; $05E927 |
  SBC $E8F9,y                               ; $05E928 |
  EOR $E901,y                               ; $05E92B |
  BPL CODE_05E936                           ; $05E92E |
  LDA $E8F9,y                               ; $05E930 |
  STA !s_spr_x_speed_lo,x                   ; $05E933 |

CODE_05E936:
  RTS                                       ; $05E936 |

  TYX                                       ; $05E937 |
  LDY #$18                                  ; $05E938 |
  JSR CODE_05E9C6                           ; $05E93A |
  BNE CODE_05E941                           ; $05E93D |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05E93F |

CODE_05E941:
  RTS                                       ; $05E941 |

  dw $0012, $01C0, $0024, $0012             ; $05E942 |
  dw $00A0, $0024, $000F, $00C0             ; $05E94A |
  dw $001E, $000F, $0180, $001E             ; $05E952 |
  dw $000C, $0100, $0018, $000C             ; $05E95A |
  dw $0100, $0018, $000C, $01C0             ; $05E962 |
  dw $0018, $000C, $00A0, $0018             ; $05E96A |
  dw $0020, $01E0, $0040, $0020             ; $05E972 |
  dw $0040, $0040, $000C, $0100             ; $05E97A |
  dw $0018, $000C, $0100, $0018             ; $05E982 |
  dw $0014, $00E0, $0028, $0014             ; $05E98A |
  dw $0140, $0028, $0024, $0080             ; $05E992 |
  dw $0048, $0010, $0160, $0020             ; $05E99A |
  dw $0008, $01C0, $0010, $0008             ; $05E9A2 |
  dw $0080, $0010, $0014, $00F0             ; $05E9AA |
  dw $0028, $0014, $0120, $0028             ; $05E9B2 |
  dw $0024, $00C0, $0048, $0010             ; $05E9BA |
  dw $0130, $0020                           ; $05E9C2 |

CODE_05E9C6:
  LDA #$0002                                ; $05E9C6 |
  STA $00                                   ; $05E9C9 |

CODE_05E9CB:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05E9CB |
  CMP $E944,y                               ; $05E9CE |
  BEQ CODE_05E9EF                           ; $05E9D1 |
  BMI CODE_05E9DB                           ; $05E9D3 |
  SEC                                       ; $05E9D5 |
  SBC $E942,y                               ; $05E9D6 |
  BRA CODE_05E9DF                           ; $05E9D9 |

CODE_05E9DB:
  CLC                                       ; $05E9DB |
  ADC $E942,y                               ; $05E9DC |

CODE_05E9DF:
  STA !s_spr_gsu_morph_1_lo,x               ; $05E9DF |
  SEC                                       ; $05E9E2 |
  SBC $E944,y                               ; $05E9E3 |
  CLC                                       ; $05E9E6 |
  ADC $E942,y                               ; $05E9E7 |
  CMP $E946,y                               ; $05E9EA |
  BCS CODE_05E9F7                           ; $05E9ED |

CODE_05E9EF:
  DEC $00                                   ; $05E9EF |
  LDA $E944,y                               ; $05E9F1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05E9F4 |

CODE_05E9F7:
  CPX $12                                   ; $05E9F7 |
  BNE CODE_05EA05                           ; $05E9F9 |
  INX                                       ; $05E9FB |
  INX                                       ; $05E9FC |
  TYA                                       ; $05E9FD |
  CLC                                       ; $05E9FE |
  ADC #$0006                                ; $05E9FF |
  TAY                                       ; $05EA02 |
  BRA CODE_05E9CB                           ; $05EA03 |

CODE_05EA05:
  LDX $12                                   ; $05EA05 |
  LDY $00                                   ; $05EA07 |
  RTS                                       ; $05EA09 |

init_spooky:
  JSL $03AE60                               ; $05EA0A |
  LDA #$0004                                ; $05EA0E |
  STA !s_spr_y_terrain_offset,x             ; $05EA11 |
  STZ !s_spr_wildcard_1_lo,x                ; $05EA14 |
  JSR CODE_05EC10                           ; $05EA17 |
  RTL                                       ; $05EA1A |

  dw $0040, $0020, $0000                    ; $05EA1B |

  dw $EC54                                  ; $05EA21 |
  dw $ECF2                                  ; $05EA23 |
  dw $ED3A                                  ; $05EA25 |
  dw $EDFD                                  ; $05EA27 |
  dw $EC54                                  ; $05EA29 |

main_spooky:
  JSR CODE_05EB40                           ; $05EA2B |
  LDY !s_spr_state,x                        ; $05EA2E |
  CPY #$08                                  ; $05EA31 |
  BEQ CODE_05EA60                           ; $05EA33 |
  CPY #$0C                                  ; $05EA35 |
  BEQ CODE_05EA4E                           ; $05EA37 |
  CPY #$06                                  ; $05EA39 |
  BEQ CODE_05EA40                           ; $05EA3B |
  JMP CODE_05EAAF                           ; $05EA3D |

CODE_05EA40:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EA40 |
  BEQ CODE_05EA4B                           ; $05EA42 |
  JSR CODE_05EBD0                           ; $05EA44 |
  JSL $06BEC1                               ; $05EA47 |

CODE_05EA4B:
  JMP CODE_05EAAF                           ; $05EA4B |

CODE_05EA4E:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EA4E |
  BEQ CODE_05EA57                           ; $05EA50 |
  JSR CODE_05EF52                           ; $05EA52 |
  BRA CODE_05EA5A                           ; $05EA55 |

CODE_05EA57:
  JSR CODE_05EEF7                           ; $05EA57 |

CODE_05EA5A:
  PLA                                       ; $05EA5A |
  PLY                                       ; $05EA5B |
  JML $03A31E                               ; $05EA5C |

CODE_05EA60:
  LDY !s_player_mouth_state                 ; $05EA60 |
  CPY #$03                                  ; $05EA63 |
  BEQ CODE_05EA6B                           ; $05EA65 |
  CPY #$04                                  ; $05EA67 |
  BNE CODE_05EA96                           ; $05EA69 |

CODE_05EA6B:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EA6B |
  BEQ CODE_05EA78                           ; $05EA6D |
  LDA #$0008                                ; $05EA6F |
  STA !s_spr_state                          ; $05EA72 |
  JSR CODE_05EBD0                           ; $05EA75 |

CODE_05EA78:
  LDA $7860,x                               ; $05EA78 |
  AND #$0001                                ; $05EA7B |
  BEQ CODE_05EA8A                           ; $05EA7E |
  LDA !s_spr_y_pixel_pos,x                  ; $05EA80 |
  SEC                                       ; $05EA83 |
  SBC !s_spr_y_delta_lo,x                   ; $05EA84 |
  STA !s_spr_y_pixel_pos,x                  ; $05EA87 |

CODE_05EA8A:
  LDA #$0010                                ; $05EA8A |
  STA !s_spr_state,x                        ; $05EA8D |
  STZ $6162                                 ; $05EA90 |
  PLA                                       ; $05EA93 |
  PLY                                       ; $05EA94 |
  RTL                                       ; $05EA95 |

CODE_05EA96:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05EA96 |
  BNE CODE_05EAAC                           ; $05EA98 |
  LDA #$3101                                ; $05EA9A |
  STA !s_spr_oam_1,x                        ; $05EA9D |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EAA0 |
  BEQ CODE_05EAA9                           ; $05EAA2 |
  JSR CODE_05EF52                           ; $05EAA4 |
  BRA CODE_05EAAC                           ; $05EAA7 |

CODE_05EAA9:
  JSR CODE_05EEF7                           ; $05EAA9 |

CODE_05EAAC:
  JSR CODE_05EF9F                           ; $05EAAC |

CODE_05EAAF:
  JSL $03AF23                               ; $05EAAF |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05EAB3 |
  CPY #$03                                  ; $05EAB5 |
  BEQ CODE_05EAD7                           ; $05EAB7 |
  CPY #$02                                  ; $05EAB9 |
  BNE CODE_05EAD3                           ; $05EABB |
  LDY !s_spr_y_speed_hi,x                   ; $05EABD |
  BMI CODE_05EAD3                           ; $05EAC0 |
  LDA !s_spr_x_player_delta,x               ; $05EAC2 |
  CLC                                       ; $05EAC5 |
  ADC #$0010                                ; $05EAC6 |
  CMP #$0020                                ; $05EAC9 |
  BCS CODE_05EAD3                           ; $05EACC |
  LDA !s_spr_y_player_delta,x               ; $05EACE |
  BMI CODE_05EAD7                           ; $05EAD1 |

CODE_05EAD3:
  JSL $03A5B7                               ; $05EAD3 |

CODE_05EAD7:
  JSR CODE_05EBA4                           ; $05EAD7 |
  TXY                                       ; $05EADA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05EADB |
  ASL A                                     ; $05EADD |
  TAX                                       ; $05EADE |
  JSR ($EA21,x)                             ; $05EADF |
  SEP #$20                                  ; $05EAE2 |
  LDA !s_spr_timer_2,x                      ; $05EAE4 |
  BNE CODE_05EAF8                           ; $05EAE7 |
  LDA #$08                                  ; $05EAE9 |
  STA !s_spr_timer_2,x                      ; $05EAEB |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $05EAEE |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $05EAF0 |
  BPL CODE_05EAF8                           ; $05EAF2 |
  LDY #$04                                  ; $05EAF4 |
  STY !s_spr_wildcard_4_hi_dp,x             ; $05EAF6 |

CODE_05EAF8:
  REP #$20                                  ; $05EAF8 |
  LDA !s_spr_x_accel,x                      ; $05EAFA |
  BEQ CODE_05EB13                           ; $05EAFD |
  ASL A                                     ; $05EAFF |
  STA $00                                   ; $05EB00 |
  LDA !s_spr_x_speed_lo,x                   ; $05EB02 |
  CLC                                       ; $05EB05 |
  ADC !s_spr_x_accel,x                      ; $05EB06 |
  CMP $00                                   ; $05EB09 |
  BCS CODE_05EB13                           ; $05EB0B |
  STZ !s_spr_x_accel,x                      ; $05EB0D |
  STZ !s_spr_x_speed_lo,x                   ; $05EB10 |

CODE_05EB13:
  LDY !s_spr_wildcard_6_hi_dp,x             ; $05EB13 |
  BNE CODE_05EB3C                           ; $05EB15 |
  LDA $7974                                 ; $05EB17 |
  AND #$0003                                ; $05EB1A |
  BNE CODE_05EB3C                           ; $05EB1D |
  LDA !s_spr_wildcard_1_lo,x                ; $05EB1F |
  DEC A                                     ; $05EB22 |
  CLC                                       ; $05EB23 |
  ADC !s_spr_y_terrain_offset,x             ; $05EB24 |
  BMI CODE_05EB2E                           ; $05EB27 |
  CMP #$000C                                ; $05EB29 |
  BMI CODE_05EB39                           ; $05EB2C |

CODE_05EB2E:
  PHA                                       ; $05EB2E |
  LDA !s_spr_wildcard_1_lo,x                ; $05EB2F |
  EOR #$0002                                ; $05EB32 |
  STA !s_spr_wildcard_1_lo,x                ; $05EB35 |
  PLA                                       ; $05EB38 |

CODE_05EB39:
  STA !s_spr_y_terrain_offset,x             ; $05EB39 |

CODE_05EB3C:
  JSR CODE_05EBFC                           ; $05EB3C |
  RTL                                       ; $05EB3F |

CODE_05EB40:
  LDY !s_spr_anim_frame,x                   ; $05EB40 |
  BNE CODE_05EBA3                           ; $05EB43 |
  JSL $03AA52                               ; $05EB45 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05EB49 |
  STA !gsu_r1                               ; $05EB4C |
  LDA #$0008                                ; $05EB4F |
  STA !gsu_r6                               ; $05EB52 |
  LDX #$0B                                  ; $05EB55 |
  LDA #$8595                                ; $05EB57 |
  JSL r_gsu_init_1                          ; $05EB5A | GSU init
  LDX $12                                   ; $05EB5E |
  LDY !s_spr_facing_dir,x                   ; $05EB60 |
  BEQ CODE_05EB6F                           ; $05EB63 |
  LDA !gsu_r1                               ; $05EB65 |
  EOR #$FFFF                                ; $05EB68 |
  INC A                                     ; $05EB6B |
  STA !gsu_r1                               ; $05EB6C |

CODE_05EB6F:
  LDA #$FFF8                                ; $05EB6F |
  CLC                                       ; $05EB72 |
  ADC !gsu_r0                               ; $05EB73 |
  STA !gsu_r0                               ; $05EB76 |
  REP #$10                                  ; $05EB79 |
  LDY !s_spr_oam_pointer,x                  ; $05EB7B |
  LDA #$0004                                ; $05EB7E |
  STA $00                                   ; $05EB81 |

CODE_05EB83:
  LDA $6000,y                               ; $05EB83 |
  CLC                                       ; $05EB86 |
  ADC !gsu_r1                               ; $05EB87 |
  STA $6000,y                               ; $05EB8A |
  LDA $6002,y                               ; $05EB8D |
  CLC                                       ; $05EB90 |
  ADC !gsu_r0                               ; $05EB91 |
  STA $6002,y                               ; $05EB94 |
  TYA                                       ; $05EB97 |
  CLC                                       ; $05EB98 |
  ADC #$0008                                ; $05EB99 |
  TAY                                       ; $05EB9C |
  DEC $00                                   ; $05EB9D |
  BNE CODE_05EB83                           ; $05EB9F |
  SEP #$10                                  ; $05EBA1 |

CODE_05EBA3:
  RTS                                       ; $05EBA3 |

CODE_05EBA4:
  JSL $03A2C7                               ; $05EBA4 |
  BCC CODE_05EBB3                           ; $05EBA8 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EBAA |
  BNE CODE_05EBB8                           ; $05EBAC |
  PLA                                       ; $05EBAE |
  JML $03A31E                               ; $05EBAF |

CODE_05EBB3:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05EBB3 |
  BNE CODE_05EBBE                           ; $05EBB5 |
  RTS                                       ; $05EBB7 |

CODE_05EBB8:
  STZ !s_spr_x_speed_lo,x                   ; $05EBB8 |
  STZ !s_spr_y_speed_lo,x                   ; $05EBBB |

CODE_05EBBE:
  LDA $61CC                                 ; $05EBBE |
  BNE CODE_05EBD0                           ; $05EBC1 |
  LDA !s_spr_x_pixel_pos,x                  ; $05EBC3 |
  STA !s_spr_x_pixel_pos                    ; $05EBC6 |
  LDA !s_spr_y_pixel_pos,x                  ; $05EBC9 |
  STA !s_spr_y_pixel_pos                    ; $05EBCC |
  RTS                                       ; $05EBCF |

CODE_05EBD0:
  LDY #$04                                  ; $05EBD0 |
  STY !s_spr_draw_priority                  ; $05EBD2 |
  STZ !s_spr_timer_4                        ; $05EBD5 |
  STZ $7860                                 ; $05EBD8 |
  LDA #$B220                                ; $05EBDB |
  STA $6FA0                                 ; $05EBDE |
  STZ $18                                   ; $05EBE1 |
  STZ !s_spr_wildcard_2_lo                  ; $05EBE3 |
  LDA !s_baby_mario_state                   ; $05EBE6 |
  AND #$0FFF                                ; $05EBE9 |
  STA !s_baby_mario_state                   ; $05EBEC |
  LDY #$00                                  ; $05EBEF |
  STY !s_spr_wildcard_6_lo_dp,x             ; $05EBF1 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05EBF3 |
  LDA #$0020                                ; $05EBF5 |
  STA !s_spr_timer_3,x                      ; $05EBF8 |
  RTS                                       ; $05EBFB |

CODE_05EBFC:
  LDY !s_spr_anim_frame,x                   ; $05EBFC |
  BNE CODE_05EC4B                           ; $05EBFF |
  LDA !s_spr_dyntile_index,x                ; $05EC01 |
  LSR A                                     ; $05EC04 |
  LSR A                                     ; $05EC05 |
  LSR A                                     ; $05EC06 |
  SEC                                       ; $05EC07 |
  SBC !r_frame_counter_global               ; $05EC08 |
  AND #$0001                                ; $05EC0B |
  BNE CODE_05EC4B                           ; $05EC0E |

CODE_05EC10:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $05EC10 |
  LDA $EA1B,y                               ; $05EC12 |
  STA !gsu_r12                              ; $05EC15 |
  LDA #$0055                                ; $05EC18 |
  STA !gsu_r13                              ; $05EC1B |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05EC1E |
  LSR A                                     ; $05EC21 |
  STA !gsu_r5                               ; $05EC22 |
  LDA #$0100                                ; $05EC25 |
  STA !gsu_r6                               ; $05EC28 |
  LDY !s_spr_dyntile_index,x                ; $05EC2B |
  TYX                                       ; $05EC2E |
  LDA $03A9CE,x                             ; $05EC2F |
  STA !gsu_r3                               ; $05EC33 |
  LDA $03A9EE,x                             ; $05EC36 |
  STA !gsu_r2                               ; $05EC3A |
  LDX #$08                                  ; $05EC3D |
  LDA #$8205                                ; $05EC3F |
  JSL r_gsu_init_1                          ; $05EC42 | GSU init
  LDX $12                                   ; $05EC46 |
  INC $0CF9                                 ; $05EC48 |

CODE_05EC4B:
  RTS                                       ; $05EC4B |

  dw $FF00, $0100                           ; $05EC4C |
  dw $FE80, $0180                           ; $05EC50 |

  TYX                                       ; $05EC54 |
  LDA !s_spr_x_speed_lo,x                   ; $05EC55 |
  BNE CODE_05EC77                           ; $05EC58 |
  STZ !s_spr_timer_3,x                      ; $05EC5A |
  STZ !s_spr_timer_4,x                      ; $05EC5D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05EC60 |
  BEQ CODE_05EC6E                           ; $05EC63 |
  CLC                                       ; $05EC65 |
  ADC #$0002                                ; $05EC66 |
  CMP #$0004                                ; $05EC69 |
  BCS CODE_05EC80                           ; $05EC6C |

CODE_05EC6E:
  LDA !s_spr_facing_dir,x                   ; $05EC6E |
  EOR #$0002                                ; $05EC71 |
  STA !s_spr_facing_dir,x                   ; $05EC74 |

CODE_05EC77:
  LDY !s_spr_facing_dir,x                   ; $05EC77 |
  LDA $EC4C,y                               ; $05EC7A |
  STA !s_spr_x_speed_lo,x                   ; $05EC7D |

CODE_05EC80:
  JSR CODE_05EE64                           ; $05EC80 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05EC83 |
  BNE CODE_05ECDF                           ; $05EC85 |
  LDA !s_spr_facing_dir,x                   ; $05EC87 |
  DEC A                                     ; $05EC8A |
  EOR !s_spr_x_player_delta,x               ; $05EC8B |
  BPL CODE_05ECDF                           ; $05EC8E |
  LDA !s_spr_x_player_delta,x               ; $05EC90 |
  CLC                                       ; $05EC93 |
  ADC #$0040                                ; $05EC94 |
  CMP #$0080                                ; $05EC97 |
  BCS CODE_05ECDF                           ; $05EC9A |
  LDA !s_spr_y_player_delta,x               ; $05EC9C |
  CLC                                       ; $05EC9F |
  ADC #$0040                                ; $05ECA0 |
  CMP #$0080                                ; $05ECA3 |
  BCS CODE_05ECDF                           ; $05ECA6 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05ECA8 |
  CLC                                       ; $05ECAB |
  ADC #$0020                                ; $05ECAC |
  STA !s_spr_wildcard_2_lo,x                ; $05ECAF |
  LDY !s_spr_facing_dir,x                   ; $05ECB2 |
  LDA $EC50,y                               ; $05ECB5 |
  STA !s_spr_x_speed_lo,x                   ; $05ECB8 |
  STZ !s_spr_y_accel_ceiling,x              ; $05ECBB |
  LDA #$0008                                ; $05ECBE |
  STA !s_spr_y_accel,x                      ; $05ECC1 |
  LSR A                                     ; $05ECC4 |
  STA !s_spr_x_accel,x                      ; $05ECC5 |
  LDA #$FE80                                ; $05ECC8 |
  STA !s_spr_y_speed_lo,x                   ; $05ECCB |
  LDA #$8C83                                ; $05ECCE |
  STA !s_spr_bitwise_settings_3,x           ; $05ECD1 |
  INC !s_spr_wildcard_6_hi_dp,x             ; $05ECD4 |
  STZ !s_spr_wildcard_1_lo,x                ; $05ECD6 |
  STZ !s_spr_y_terrain_offset,x             ; $05ECD9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05ECDC |
  RTS                                       ; $05ECDE |

CODE_05ECDF:
  LDA $7860,x                               ; $05ECDF |
  AND #$0001                                ; $05ECE2 |
  BEQ CODE_05ECF1                           ; $05ECE5 |
  LDA #$8E83                                ; $05ECE7 |
  STA !s_spr_bitwise_settings_3,x           ; $05ECEA |
  LDY #$00                                  ; $05ECED |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05ECEF |

CODE_05ECF1:
  RTS                                       ; $05ECF1 |

  TYX                                       ; $05ECF2 |
  LDA !s_spr_y_speed_lo,x                   ; $05ECF3 |
  CLC                                       ; $05ECF6 |
  ADC #$0020                                ; $05ECF7 |
  CMP #$0040                                ; $05ECFA |
  BCS CODE_05ED0B                           ; $05ECFD |
  STZ !s_spr_y_speed_lo,x                   ; $05ECFF |
  STZ !s_spr_y_accel,x                      ; $05ED02 |
  STZ !s_spr_wildcard_2_lo,x                ; $05ED05 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05ED08 |
  RTS                                       ; $05ED0A |

CODE_05ED0B:
  LDA !s_spr_y_speed_lo,x                   ; $05ED0B |
  CLC                                       ; $05ED0E |
  ADC #$0180                                ; $05ED0F |
  STA !gsu_r6                               ; $05ED12 |
  LDA !s_spr_wildcard_2_lo,x                ; $05ED15 |
  STA !gsu_r1                               ; $05ED18 |
  LDA #$0040                                ; $05ED1B |
  STA !gsu_r7                               ; $05ED1E |
  LDX #$08                                  ; $05ED21 |
  LDA #$A320                                ; $05ED23 |
  JSL r_gsu_init_1                          ; $05ED26 | GSU init
  LDX $12                                   ; $05ED2A |
  LDA !gsu_r1                               ; $05ED2C |
  SEC                                       ; $05ED2F |
  SBC #$0020                                ; $05ED30 |
  AND #$01FE                                ; $05ED33 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05ED36 |
  RTS                                       ; $05ED39 |

  TYX                                       ; $05ED3A |
  LDA !s_spr_wildcard_2_lo,x                ; $05ED3B |
  CLC                                       ; $05ED3E |
  ADC #$0010                                ; $05ED3F |
  CMP #$0110                                ; $05ED42 |
  BEQ CODE_05ED68                           ; $05ED45 |
  STA !s_spr_wildcard_2_lo,x                ; $05ED47 |
  STA !gsu_r6                               ; $05ED4A |
  LDA #$0020                                ; $05ED4D |
  STA !gsu_r1                               ; $05ED50 |
  STZ !gsu_r7                               ; $05ED53 |
  LDX #$08                                  ; $05ED56 |
  LDA #$A320                                ; $05ED58 |
  JSL r_gsu_init_1                          ; $05ED5B | GSU init
  LDX $12                                   ; $05ED5F |
  LDA !gsu_r1                               ; $05ED61 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05ED64 |
  RTS                                       ; $05ED67 |

CODE_05ED68:
  LDA #$0200                                ; $05ED68 |
  STA !s_spr_y_accel_ceiling,x              ; $05ED6B |
  LDA #$0020                                ; $05ED6E |
  STA !s_spr_y_accel,x                      ; $05ED71 |
  LDA $7860,x                               ; $05ED74 |
  AND #$0001                                ; $05ED77 |
  BEQ CODE_05ED92                           ; $05ED7A |
  LDY !s_spr_facing_dir,x                   ; $05ED7C |
  LDA $EC4C,y                               ; $05ED7F |
  STA !s_spr_x_speed_lo,x                   ; $05ED82 |
  LDA #$8E83                                ; $05ED85 |
  STA !s_spr_bitwise_settings_3,x           ; $05ED88 |
  LDY #$00                                  ; $05ED8B |
  STY !s_spr_wildcard_6_hi_dp,x             ; $05ED8D |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05ED8F |
  RTS                                       ; $05ED91 |

CODE_05ED92:
  LDA !s_spr_x_player_delta,x               ; $05ED92 |
  CLC                                       ; $05ED95 |
  ADC #$0010                                ; $05ED96 |
  CMP #$0020                                ; $05ED99 |
  BCS CODE_05EDF4                           ; $05ED9C |
  LDA !s_spr_y_player_delta,x               ; $05ED9E |
  BPL CODE_05EDF4                           ; $05EDA1 |
  CMP #$FFE8                                ; $05EDA3 |
  BMI CODE_05EDF4                           ; $05EDA6 |
  LDA !s_baby_mario_state                   ; $05EDA8 |
  BPL CODE_05EDF4                           ; $05EDAB |
  AND #$0FFF                                ; $05EDAD |
  ORA #$4000                                ; $05EDB0 |
  STA !s_baby_mario_state                   ; $05EDB3 |
  LDA #$003C                                ; $05EDB6 |
  JSL push_sound_queue                      ; $05EDB9 |
  LDA #$FFFF                                ; $05EDBD |
  STA !s_spr_timer_4                        ; $05EDC0 |
  STA $7E48                                 ; $05EDC3 |
  LDA #$0004                                ; $05EDC6 |
  STA $76                                   ; $05EDC9 |
  LDA #$0010                                ; $05EDCB |
  STA !s_spr_state                          ; $05EDCE |
  LDY #$FF                                  ; $05EDD1 |
  STY !s_spr_draw_priority                  ; $05EDD3 |
  STX $18                                   ; $05EDD6 |
  STA !s_spr_wildcard_2_lo                  ; $05EDD8 |
  LDA #$B260                                ; $05EDDB |
  STA $6FA0                                 ; $05EDDE |
  LDA #$604F                                ; $05EDE1 |
  STA $6FA2                                 ; $05EDE4 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $05EDE7 |
  LDA #$0020                                ; $05EDE9 |
  STA !s_spr_timer_1,x                      ; $05EDEC |
  STA $61EC                                 ; $05EDEF |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05EDF2 |

CODE_05EDF4:
  RTS                                       ; $05EDF4 |

  dw $0006, $FFFA                           ; $05EDF5 |

  dw $FF00, $0100                           ; $05EDF9 |

  TYX                                       ; $05EDFD |
  LDA !s_player_direction                   ; $05EDFE |
  STA !s_spr_facing_dir,x                   ; $05EE01 |
  LDA !s_spr_timer_1,x                      ; $05EE04 |
  BNE CODE_05EE2A                           ; $05EE07 |
  STA $61EC                                 ; $05EE09 |
  LDA #$0080                                ; $05EE0C |
  STA !s_player_invincibility_timer         ; $05EE0F |
  LDA !s_spr_facing_dir,x                   ; $05EE12 |
  EOR #$0002                                ; $05EE15 |
  STA !s_spr_facing_dir,x                   ; $05EE18 |
  TAY                                       ; $05EE1B |
  LDA $EDF9,y                               ; $05EE1C |
  STA !s_spr_x_speed_lo,x                   ; $05EE1F |
  LDA #$FC00                                ; $05EE22 |
  STA !s_spr_y_speed_lo,x                   ; $05EE25 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05EE28 |

CODE_05EE2A:
  LDA !r_joy1_lo_mirror                     ; $05EE2A |
  AND #$CFF0                                ; $05EE2D |
  CMP $0D98                                 ; $05EE30 |
  BEQ CODE_05EE44                           ; $05EE33 |
  STA $0D98                                 ; $05EE35 |
  LDA !s_spr_timer_1,x                      ; $05EE38 |
  SEC                                       ; $05EE3B |
  SBC #$0002                                ; $05EE3C |
  BMI CODE_05EE44                           ; $05EE3F |
  STA !s_spr_timer_1,x                      ; $05EE41 |

CODE_05EE44:
  LDY !s_player_direction                   ; $05EE44 |
  LDA !s_player_x                           ; $05EE47 |
  CLC                                       ; $05EE4A |
  ADC $EDF5,y                               ; $05EE4B |
  STA !s_spr_x_pixel_pos,x                  ; $05EE4E |
  LDA !s_player_y                           ; $05EE51 |
  CLC                                       ; $05EE54 |
  ADC #$0006                                ; $05EE55 |
  STA !s_spr_y_pixel_pos,x                  ; $05EE58 |
  RTS                                       ; $05EE5B |

  dw $0002, $FFFE                           ; $05EE5C |

  dw $0020, $01E0                           ; $05EE60 |

CODE_05EE64:
  LDA !s_spr_ground_angle,x                 ; $05EE64 |
  AND #$00FF                                ; $05EE67 |
  BEQ CODE_05EEAA                           ; $05EE6A |
  ASL A                                     ; $05EE6C |
  LDY !s_spr_facing_dir,x                   ; $05EE6D |
  BEQ CODE_05EE79                           ; $05EE70 |
  EOR #$FFFF                                ; $05EE72 |
  INC A                                     ; $05EE75 |
  AND #$01FE                                ; $05EE76 |

CODE_05EE79:
  STA $00                                   ; $05EE79 |
  CMP !s_spr_gsu_morph_2_lo,x               ; $05EE7B |
  BEQ CODE_05EEA9                           ; $05EE7E |
  LDY #$00                                  ; $05EE80 |
  LDA $00                                   ; $05EE82 |
  SEC                                       ; $05EE84 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $05EE85 |
  PHP                                       ; $05EE88 |
  CLC                                       ; $05EE89 |
  ADC #$0100                                ; $05EE8A |
  CMP #$0200                                ; $05EE8D |
  BCS CODE_05EE97                           ; $05EE90 |
  PLP                                       ; $05EE92 |
  BPL CODE_05EE9C                           ; $05EE93 |
  BRA CODE_05EE9A                           ; $05EE95 |

CODE_05EE97:
  PLP                                       ; $05EE97 |
  BMI CODE_05EE9C                           ; $05EE98 |

CODE_05EE9A:
  INY                                       ; $05EE9A |
  INY                                       ; $05EE9B |

CODE_05EE9C:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05EE9C |
  CLC                                       ; $05EE9F |
  ADC $EE5C,y                               ; $05EEA0 |
  AND #$01FE                                ; $05EEA3 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05EEA6 |

CODE_05EEA9:
  RTS                                       ; $05EEA9 |

CODE_05EEAA:
  LDA !s_spr_timer_3,x                      ; $05EEAA |
  ORA !s_spr_timer_4,x                      ; $05EEAD |
  BNE CODE_05EEF2                           ; $05EEB0 |
  LDA #$0002                                ; $05EEB2 |
  STA !s_spr_timer_4,x                      ; $05EEB5 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $05EEB8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05EEBA |
  CLC                                       ; $05EEBD |
  ADC $EE5C,y                               ; $05EEBE |
  AND #$01FE                                ; $05EEC1 |
  BIT #$0100                                ; $05EEC4 |
  BEQ CODE_05EECC                           ; $05EEC7 |
  ORA #$FF00                                ; $05EEC9 |

CODE_05EECC:
  CPY #$00                                  ; $05EECC |
  BNE CODE_05EED7                           ; $05EECE |
  CMP #$0020                                ; $05EED0 |
  BMI CODE_05EEEC                           ; $05EED3 |
  BRA CODE_05EEDC                           ; $05EED5 |

CODE_05EED7:
  CMP #$FFE0                                ; $05EED7 |
  BPL CODE_05EEEC                           ; $05EEDA |

CODE_05EEDC:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $05EEDC |
  EOR #$0002                                ; $05EEDE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $05EEE1 |
  LDA #$0020                                ; $05EEE3 |
  STA !s_spr_timer_3,x                      ; $05EEE6 |
  LDA $EE60,y                               ; $05EEE9 |

CODE_05EEEC:
  AND #$01FE                                ; $05EEEC |
  STA !s_spr_gsu_morph_2_lo,x               ; $05EEEF |

CODE_05EEF2:
  RTS                                       ; $05EEF2 |

  dw $FFF8, $0008                           ; $05EEF3 |

CODE_05EEF7:
  LDA !s_spr_x_player_dir,x                 ; $05EEF7 |
  AND #$00FF                                ; $05EEFA |
  STA !s_spr_facing_dir,x                   ; $05EEFD |
  TAY                                       ; $05EF00 |
  LDA $EEF3,y                               ; $05EF01 |
  STA $04                                   ; $05EF04 |
  LDA #$001E                                ; $05EF06 |
  JSL spawn_sprite_active                   ; $05EF09 |
  BCC CODE_05EF30                           ; $05EF0D |
  LDA !s_spr_x_pixel_pos,x                  ; $05EF0F |
  CLC                                       ; $05EF12 |
  ADC $04                                   ; $05EF13 |
  STA !s_spr_x_pixel_pos,y                  ; $05EF15 |
  LDA !s_spr_y_pixel_pos,x                  ; $05EF18 |
  AND #$FFF0                                ; $05EF1B |
  STA !s_spr_y_pixel_pos,y                  ; $05EF1E |
  LDA !s_spr_facing_dir,x                   ; $05EF21 |
  STA !s_spr_facing_dir,y                   ; $05EF24 |
  LDA #$0001                                ; $05EF27 |
  STA !s_spr_collision_state,y              ; $05EF2A |
  STA !s_spr_wildcard_2_lo,y                ; $05EF2D |

CODE_05EF30:
  LDA !s_player_tongue_x_rel                ; $05EF30 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05EF33 |
  STZ $6164                                 ; $05EF36 |
  LDA #$FFFC                                ; $05EF39 |
  STA $6166                                 ; $05EF3C |
  LDA #$0001                                ; $05EF3F |
  STA !s_spr_anim_frame,x                   ; $05EF42 |
  LDA #$0005                                ; $05EF45 |
  STA !s_spr_draw_priority,x                ; $05EF48 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05EF4B |
  RTS                                       ; $05EF4D |

  dw $FFF8, $0008                           ; $05EF4E |

CODE_05EF52:
  JSL $06BEBA                               ; $05EF52 |
  LDY #$04                                  ; $05EF56 |
  STY !s_spr_draw_priority                  ; $05EF58 |
  STZ $18                                   ; $05EF5B |
  LDY !s_spr_facing_dir,x                   ; $05EF5D |
  LDA $EF4E,y                               ; $05EF60 |
  STA $00                                   ; $05EF63 |
  LDA #$0020                                ; $05EF65 |
  JSL spawn_sprite_active                   ; $05EF68 |
  BCC CODE_05EF30                           ; $05EF6C |
  LDA !s_spr_x_pixel_pos,x                  ; $05EF6E |
  CLC                                       ; $05EF71 |
  ADC $00                                   ; $05EF72 |
  STA !s_spr_x_pixel_pos,y                  ; $05EF74 |
  STA $04                                   ; $05EF77 |
  LDA !s_spr_y_pixel_pos,x                  ; $05EF79 |
  AND #$FFF0                                ; $05EF7C |
  CLC                                       ; $05EF7F |
  ADC #$0010                                ; $05EF80 |
  STA !s_spr_y_pixel_pos,y                  ; $05EF83 |
  STA $06                                   ; $05EF86 |
  JSL $048D5F                               ; $05EF88 |
  JMP CODE_05EF30                           ; $05EF8C |

  dw $0008, $FFF8                           ; $05EF8F |

  dw $0008, $FFF8                           ; $05EF93 |

  dw $FFF8, $0008, $FFE8, $0018             ; $05EF97 |

CODE_05EF9F:
  LDA !s_player_direction                   ; $05EF9F |
  AND #$0002                                ; $05EFA2 |
  TAY                                       ; $05EFA5 |
  STA !s_spr_facing_dir,x                   ; $05EFA6 |
  LDA !s_spr_anim_frame,x                   ; $05EFA9 |
  CMP #$0003                                ; $05EFAC |
  BMI CODE_05EFB4                           ; $05EFAF |
  JMP CODE_05F020                           ; $05EFB1 |

CODE_05EFB4:
  LDA !s_player_tongue_x_rel                ; $05EFB4 |
  BEQ CODE_05EFD8                           ; $05EFB7 |
  CLC                                       ; $05EFB9 |
  ADC #$0008                                ; $05EFBA |
  CMP #$0010                                ; $05EFBD |
  BCS CODE_05EFCA                           ; $05EFC0 |
  LDA $EF8F,y                               ; $05EFC2 |
  STA !s_player_tongue_x_rel                ; $05EFC5 |
  BRA CODE_05EFD8                           ; $05EFC8 |

CODE_05EFCA:
  LDA !s_player_tongue_x_rel                ; $05EFCA |
  SEC                                       ; $05EFCD |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05EFCE |
  CLC                                       ; $05EFD1 |
  ADC $6164                                 ; $05EFD2 |
  STA $6164                                 ; $05EFD5 |

CODE_05EFD8:
  LDA !s_spr_timer_2,x                      ; $05EFD8 |
  BNE CODE_05EFEE                           ; $05EFDB |
  LDA #$0002                                ; $05EFDD |
  STA !s_spr_timer_2,x                      ; $05EFE0 |
  INC !s_spr_anim_frame,x                   ; $05EFE3 |
  LDA !s_spr_anim_frame,x                   ; $05EFE6 |
  CMP #$0003                                ; $05EFE9 |
  BEQ CODE_05EFF1                           ; $05EFEC |

CODE_05EFEE:
  JMP CODE_05F074                           ; $05EFEE |

CODE_05EFF1:
  LDA $6164                                 ; $05EFF1 |
  CLC                                       ; $05EFF4 |
  ADC !s_player_tongue_x_rel                ; $05EFF5 |
  PHA                                       ; $05EFF8 |
  AND #$8000                                ; $05EFF9 |
  STA $06                                   ; $05EFFC |
  PLA                                       ; $05EFFE |
  CLC                                       ; $05EFFF |
  ADC #$0010                                ; $05F000 |
  CMP #$0020                                ; $05F003 |
  BCC CODE_05F011                           ; $05F006 |
  LDA !s_player_tongue_x_rel                ; $05F008 |
  EOR $06                                   ; $05F00B |
  BMI CODE_05F072                           ; $05F00D |
  BRA CODE_05F074                           ; $05F00F |

CODE_05F011:
  INC !s_spr_anim_frame,x                   ; $05F011 |
  LDA !s_player_tongue_x_rel                ; $05F014 |
  EOR $06                                   ; $05F017 |
  BPL CODE_05F074                           ; $05F019 |
  INC !s_spr_anim_frame,x                   ; $05F01B |
  BRA CODE_05F074                           ; $05F01E |

CODE_05F020:
  LDA !s_player_tongue_x_rel                ; $05F020 |
  BEQ CODE_05F074                           ; $05F023 |
  CLC                                       ; $05F025 |
  ADC #$0010                                ; $05F026 |
  CMP #$0020                                ; $05F029 |
  BCS CODE_05F044                           ; $05F02C |
  LDA $EF8F,y                               ; $05F02E |
  STA !s_player_tongue_x_rel                ; $05F031 |
  LDA $6164                                 ; $05F034 |
  CLC                                       ; $05F037 |
  ADC $EF97,y                               ; $05F038 |
  STA $6164                                 ; $05F03B |
  CLC                                       ; $05F03E |
  ADC $EF93,y                               ; $05F03F |
  BRA CODE_05F04B                           ; $05F042 |

CODE_05F044:
  LDA $6164                                 ; $05F044 |
  CLC                                       ; $05F047 |
  ADC !s_player_tongue_x_rel                ; $05F048 |

CODE_05F04B:
  PHA                                       ; $05F04B |
  AND #$8000                                ; $05F04C |
  STA $06                                   ; $05F04F |
  PLA                                       ; $05F051 |
  CLC                                       ; $05F052 |
  ADC #$0010                                ; $05F053 |
  CMP #$0020                                ; $05F056 |
  BCS CODE_05F06B                           ; $05F059 |
  LDY #$04                                  ; $05F05B |
  LDA !s_player_tongue_x_rel                ; $05F05D |
  EOR $06                                   ; $05F060 |
  BPL CODE_05F065                           ; $05F062 |
  INY                                       ; $05F064 |

CODE_05F065:
  TYA                                       ; $05F065 |
  STA !s_spr_anim_frame,x                   ; $05F066 |
  BRA CODE_05F074                           ; $05F069 |

CODE_05F06B:
  LDA !s_player_tongue_x_rel                ; $05F06B |
  EOR $06                                   ; $05F06E |
  BPL CODE_05F074                           ; $05F070 |

CODE_05F072:
  PLA                                       ; $05F072 |
  RTL                                       ; $05F073 |

CODE_05F074:
  LDA !s_player_tongue_x_rel                ; $05F074 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F077 |
  RTS                                       ; $05F07A |

  dw $0480, $0240                           ; $05F07B |

; brown and blue
init_arrow_wheel:
  JSL $03AE60                               ; $05F07F |
  LDA !s_spr_id,x                           ; $05F083 |
  SEC                                       ; $05F086 |
  SBC #$011E                                ; $05F087 |
  ASL A                                     ; $05F08A |
  TAY                                       ; $05F08B |
  LDA $F07B,y                               ; $05F08C |
  STA !s_spr_wildcard_1_lo,x                ; $05F08F |
  STZ !s_spr_wildcard_2_lo,x                ; $05F092 |
  LDA #$0100                                ; $05F095 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F098 |
  JSR CODE_05F3B6                           ; $05F09B |
  RTL                                       ; $05F09E |

; brown and blue
main_arrow_wheel:
  STZ !s_spr_facing_dir,x                   ; $05F09F |
  JSL $03AA52                               ; $05F0A2 |
  JSL $05F0FA                               ; $05F0A6 |
  JSR CODE_05F0F3                           ; $05F0AA |
  JSR CODE_05F1F6                           ; $05F0AD |
  JSR CODE_05F2F6                           ; $05F0B0 |
  JSR CODE_05F34C                           ; $05F0B3 |
  JSR CODE_05F3B6                           ; $05F0B6 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05F0B9 |
  BEQ CODE_05F0F2                           ; $05F0BB |
  LDA !s_spr_timer_1,x                      ; $05F0BD |
  BNE CODE_05F0F2                           ; $05F0C0 |
  LDA !s_spr_timer_2,x                      ; $05F0C2 |
  BNE CODE_05F0E2                           ; $05F0C5 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F0C7 |
  SEC                                       ; $05F0CA |
  SBC #$0020                                ; $05F0CB |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F0CE |
  CMP #$0010                                ; $05F0D1 |
  BPL CODE_05F0E2                           ; $05F0D4 |
  CPX $61B6                                 ; $05F0D6 |
  BNE CODE_05F0DE                           ; $05F0D9 |
  STZ $61B6                                 ; $05F0DB |

CODE_05F0DE:
  JML $03A31E                               ; $05F0DE |

CODE_05F0E2:
  LDY #$FF                                  ; $05F0E2 |
  LDA $7974                                 ; $05F0E4 |
  AND #$0001                                ; $05F0E7 |
  BNE CODE_05F0EE                           ; $05F0EA |
  LDY #$05                                  ; $05F0EC |

CODE_05F0EE:
  TYA                                       ; $05F0EE |
  STA !s_spr_draw_priority,x                ; $05F0EF |

CODE_05F0F2:
  RTL                                       ; $05F0F2 |

CODE_05F0F3:
  JSL $03A2F8                               ; $05F0F3 |
  BCS CODE_05F113                           ; $05F0F7 |
  RTS                                       ; $05F0F9 |

  LDA !s_sprite_disable_flag                ; $05F0FA |
  ORA $0B55                                 ; $05F0FD |
  ORA !r_cur_item_used                      ; $05F100 |
  BNE CODE_05F112                           ; $05F103 |
  LDY !s_spr_collision_state,x              ; $05F105 |
  BNE CODE_05F115                           ; $05F108 |
  LDA !s_spr_state,x                        ; $05F10A |
  CMP #$0010                                ; $05F10D |
  BEQ CODE_05F114                           ; $05F110 |

CODE_05F112:
  PLY                                       ; $05F112 |

CODE_05F113:
  PLA                                       ; $05F113 |

CODE_05F114:
  RTL                                       ; $05F114 |

CODE_05F115:
  LDA #$0040                                ; $05F115 |
  STA !s_spr_x_accel,x                      ; $05F118 |
  STZ !s_spr_x_accel_ceiling,x              ; $05F11B |
  STZ !s_spr_y_accel_ceiling,x              ; $05F11E |
  LDA !s_spr_x_speed_lo,x                   ; $05F121 |
  CLC                                       ; $05F124 |
  ADC #$0040                                ; $05F125 |
  CMP #$0080                                ; $05F128 |
  BCS CODE_05F133                           ; $05F12B |
  STZ !s_spr_x_speed_lo,x                   ; $05F12D |
  STZ !s_spr_x_accel,x                      ; $05F130 |

CODE_05F133:
  LDA !s_spr_y_speed_lo,x                   ; $05F133 |
  CLC                                       ; $05F136 |
  ADC #$0040                                ; $05F137 |
  CMP #$0080                                ; $05F13A |
  BCS CODE_05F145                           ; $05F13D |
  STZ !s_spr_y_speed_lo,x                   ; $05F13F |
  STZ !s_spr_y_accel,x                      ; $05F142 |

CODE_05F145:
  LDA !s_spr_x_speed_lo,x                   ; $05F145 |
  ORA !s_spr_y_speed_lo,x                   ; $05F148 |
  BEQ CODE_05F18C                           ; $05F14B |
  LDY !s_spr_collision_id,x                 ; $05F14D |
  DEY                                       ; $05F150 |
  BMI CODE_05F1BB                           ; $05F151 |
  LDA !s_spr_state,y                        ; $05F153 |
  CMP #$0010                                ; $05F156 |
  BNE CODE_05F1BB                           ; $05F159 |
  LDA !s_spr_bitwise_settings_1,y           ; $05F15B |
  AND #$0020                                ; $05F15E |
  BNE CODE_05F1BB                           ; $05F161 |
  PHY                                       ; $05F163 |
  TYX                                       ; $05F164 |
  JSL $03B24B                               ; $05F165 |
  PLY                                       ; $05F169 |
  LDA #$0000                                ; $05F16A |
  STA !s_spr_x_accel,y                      ; $05F16D |
  LDA #$FE00                                ; $05F170 |
  STA !s_spr_y_speed_lo,y                   ; $05F173 |
  LDX $12                                   ; $05F176 |
  LDA #$0040                                ; $05F178 |
  STA !s_spr_y_accel,y                      ; $05F17B |
  LDA !s_spr_x_speed_lo,x                   ; $05F17E |
  CMP #$8000                                ; $05F181 |
  ROR A                                     ; $05F184 |
  STA !s_spr_x_speed_lo,y                   ; $05F185 |
  JSL $03B53D                               ; $05F188 |

CODE_05F18C:
  JSL $03AEFD                               ; $05F18C |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05F190 |
  PHA                                       ; $05F192 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F193 |
  PHA                                       ; $05F196 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F197 |
  PHA                                       ; $05F19A |
  TXY                                       ; $05F19B |
  LDA !s_spr_id,x                           ; $05F19C |
  JSL $03A377                               ; $05F19F |
  PLA                                       ; $05F1A3 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F1A4 |
  PLA                                       ; $05F1A7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F1A8 |
  PLA                                       ; $05F1AB |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05F1AC |
  LDA #$9A6C                                ; $05F1AE |
  STA $00                                   ; $05F1B1 |
  LDA #$0003                                ; $05F1B3 |
  STA $02                                   ; $05F1B6 |
  JML [$7960]                               ; $05F1B8 |

CODE_05F1BB:
  LDA $7860,x                               ; $05F1BB |
  AND #$000C                                ; $05F1BE |
  BEQ CODE_05F1CF                           ; $05F1C1 |
  LDA !s_spr_x_speed_lo,x                   ; $05F1C3 |
  EOR #$FFFF                                ; $05F1C6 |
  INC A                                     ; $05F1C9 |
  STA !s_spr_x_speed_lo,x                   ; $05F1CA |
  BRA CODE_05F1E6                           ; $05F1CD |

CODE_05F1CF:
  LDA $7860,x                               ; $05F1CF |
  AND #$0003                                ; $05F1D2 |
  BEQ CODE_05F1E6                           ; $05F1D5 |
  STZ !s_spr_y_speed_lo,x                   ; $05F1D7 |
  LDA !s_spr_y_pixel_pos,x                  ; $05F1DA |
  SEC                                       ; $05F1DD |
  SBC !s_spr_y_delta_lo,x                   ; $05F1DE |
  STA !s_spr_y_pixel_pos,x                  ; $05F1E1 |
  BRA CODE_05F18C                           ; $05F1E4 |

CODE_05F1E6:
  PLY                                       ; $05F1E6 |
  PLA                                       ; $05F1E7 |
  RTL                                       ; $05F1E8 |

  db $00, $00, $00, $01, $01, $01, $03, $03 ; $05F1E9 |
  db $04, $05, $06, $07, $08                ; $05F1F1 |

CODE_05F1F6:
  LDY $60AB                                 ; $05F1F6 |
  BMI CODE_05F200                           ; $05F1F9 |
  LDY $0D94                                 ; $05F1FB |
  BEQ CODE_05F203                           ; $05F1FE |

CODE_05F200:
  JMP CODE_05F2D6                           ; $05F200 |

CODE_05F203:
  CPX $61B6                                 ; $05F203 |
  BNE CODE_05F223                           ; $05F206 |
  LDA !s_player_tile_collision              ; $05F208 |
  AND #$01E0                                ; $05F20B |
  BEQ CODE_05F219                           ; $05F20E |
  AND #$0180                                ; $05F210 |
  DEC A                                     ; $05F213 |
  EOR !s_spr_x_speed_lo,x                   ; $05F214 |
  BMI CODE_05F223                           ; $05F217 |

CODE_05F219:
  LDA !s_spr_x_player_delta,x               ; $05F219 |
  SEC                                       ; $05F21C |
  SBC !s_spr_x_delta_lo,x                   ; $05F21D |
  STA !s_spr_x_player_delta,x               ; $05F220 |

CODE_05F223:
  LDA !s_spr_x_player_delta,x               ; $05F223 |
  CLC                                       ; $05F226 |
  ADC #$000C                                ; $05F227 |
  CMP #$0018                                ; $05F22A |
  BCS CODE_05F200                           ; $05F22D |
  LDA !s_spr_x_player_delta,x               ; $05F22F |
  BPL CODE_05F238                           ; $05F232 |
  EOR #$FFFF                                ; $05F234 |
  INC A                                     ; $05F237 |

CODE_05F238:
  STA !s_spr_wildcard_3_lo_dp,x             ; $05F238 |
  TAY                                       ; $05F23A |
  LDA $F1E9,y                               ; $05F23B |
  AND #$00FF                                ; $05F23E |
  CPX $61B6                                 ; $05F241 |
  BNE CODE_05F254                           ; $05F244 |
  SEC                                       ; $05F246 |
  SBC #$0027                                ; $05F247 |
  SEC                                       ; $05F24A |
  SBC !s_car_wheel_ext_height               ; $05F24B |
  CLC                                       ; $05F24E |
  ADC !s_spr_y_pixel_pos,x                  ; $05F24F |
  BRA CODE_05F29B                           ; $05F252 |

CODE_05F254:
  CLC                                       ; $05F254 |
  ADC !s_spr_y_player_delta,x               ; $05F255 |
  SEC                                       ; $05F258 |
  SBC !s_car_wheel_ext_height               ; $05F259 |
  STA $00                                   ; $05F25C |
  CMP #$001B                                ; $05F25E |
  BPL CODE_05F2D6                           ; $05F261 |
  CMP #$0012                                ; $05F263 |
  BMI CODE_05F2D6                           ; $05F266 |
  LDY $61B6                                 ; $05F268 |
  BEQ CODE_05F270                           ; $05F26B |
  JMP CODE_05F2DE                           ; $05F26D |

CODE_05F270:
  STX $61B6                                 ; $05F270 |
  LDA !s_spr_id,x                           ; $05F273 |
  CMP #$011F                                ; $05F276 |
  BNE CODE_05F28D                           ; $05F279 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05F27B |
  BNE CODE_05F28D                           ; $05F27D |
  LDA #$018B                                ; $05F27F |
  STA !s_spr_timer_1,x                      ; $05F282 |
  LDA #$0200                                ; $05F285 |
  STA !s_spr_timer_2,x                      ; $05F288 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05F28B |

CODE_05F28D:
  LDA $00                                   ; $05F28D |
  SEC                                       ; $05F28F |
  SBC #$001B                                ; $05F290 |
  CLC                                       ; $05F293 |
  ADC !s_player_y                           ; $05F294 |
  CLC                                       ; $05F297 |
  ADC !s_spr_y_delta_lo,x                   ; $05F298 |

CODE_05F29B:
  STA !s_player_y                           ; $05F29B |
  INC !s_on_sprite_platform_flag            ; $05F29E |
  STZ !s_player_y_speed                     ; $05F2A1 |
  LDA !s_player_x                           ; $05F2A4 |
  CLC                                       ; $05F2A7 |
  ADC !s_spr_x_delta_lo,x                   ; $05F2A8 |
  STA !s_player_x                           ; $05F2AB |
  LDA !s_player_tile_collision              ; $05F2AE |
  BIT #$0018                                ; $05F2B1 |
  BEQ CODE_05F2C4                           ; $05F2B4 |
  AND #$01E0                                ; $05F2B6 |
  BNE CODE_05F2C4                           ; $05F2B9 |
  LDA $7860,x                               ; $05F2BB |
  ORA #$0002                                ; $05F2BE |
  STA $7860,x                               ; $05F2C1 |

CODE_05F2C4:
  LDA !s_spr_id,x                           ; $05F2C4 |
  CMP #$0120                                ; $05F2C7 |
  BEQ CODE_05F2F5                           ; $05F2CA |
  STZ !s_spr_wildcard_1_lo,x                ; $05F2CC |
  LDA #$0100                                ; $05F2CF |
  STA !s_spr_wildcard_2_lo,x                ; $05F2D2 |
  RTS                                       ; $05F2D5 |

CODE_05F2D6:
  CPX $61B6                                 ; $05F2D6 |
  BNE CODE_05F2DE                           ; $05F2D9 |
  STZ $61B6                                 ; $05F2DB |

CODE_05F2DE:
  LDA !s_spr_id,x                           ; $05F2DE |
  CMP #$0120                                ; $05F2E1 |
  BEQ CODE_05F2F5                           ; $05F2E4 |
  SEC                                       ; $05F2E6 |
  SBC #$011E                                ; $05F2E7 |
  ASL A                                     ; $05F2EA |
  TAY                                       ; $05F2EB |
  LDA $F07B,y                               ; $05F2EC |
  STA !s_spr_wildcard_1_lo,x                ; $05F2EF |
  STZ !s_spr_wildcard_2_lo,x                ; $05F2F2 |

CODE_05F2F5:
  RTS                                       ; $05F2F5 |

CODE_05F2F6:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $05F2F6 |
  CLC                                       ; $05F2F8 |
  ADC !s_spr_wildcard_1_lo,x                ; $05F2F9 |
  PHA                                       ; $05F2FC |
  AND #$FE00                                ; $05F2FD |
  XBA                                       ; $05F300 |
  EOR #$FFFF                                ; $05F301 |
  INC A                                     ; $05F304 |
  CLC                                       ; $05F305 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $05F306 |
  AND #$01FE                                ; $05F309 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F30C |
  PLA                                       ; $05F30F |
  AND #$01FF                                ; $05F310 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05F313 |
  STZ !s_spr_x_speed_lo,x                   ; $05F315 |
  STZ !s_spr_y_speed_lo,x                   ; $05F318 |
  LDA $75,x                                 ; $05F31B |
  AND #$0100                                ; $05F31D |
  CLC                                       ; $05F320 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $05F321 |
  AND #$01FE                                ; $05F324 |
  STA !gsu_r1                               ; $05F327 |
  LDA !s_spr_wildcard_2_lo,x                ; $05F32A |
  STA !gsu_r6                               ; $05F32D |
  LDX #$A90B                                ; $05F330 |
  STA $85,x                                 ; $05F333 |
  JSL r_gsu_init_1                          ; $05F335 | GSU init
  LDX $12                                   ; $05F339 |
  LDA !gsu_r1                               ; $05F33B |
  STA !s_spr_x_speed_lo,x                   ; $05F33E |
  LDA !gsu_r0                               ; $05F341 |
  EOR #$FFFF                                ; $05F344 |
  INC A                                     ; $05F347 |
  STA !s_spr_y_speed_lo,x                   ; $05F348 |
  RTS                                       ; $05F34B |

CODE_05F34C:
  LDA !s_spr_y_speed_lo,x                   ; $05F34C |
  BEQ CODE_05F37B                           ; $05F34F |
  LDA $7860,x                               ; $05F351 |
  AND #$0003                                ; $05F354 |
  BEQ CODE_05F37B                           ; $05F357 |
  DEC A                                     ; $05F359 |
  DEC A                                     ; $05F35A |
  EOR !s_spr_y_speed_lo,x                   ; $05F35B |
  BPL CODE_05F37B                           ; $05F35E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F360 |
  EOR #$FFFF                                ; $05F363 |
  INC A                                     ; $05F366 |
  SEC                                       ; $05F367 |
  SBC #$0100                                ; $05F368 |
  AND #$01FE                                ; $05F36B |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F36E |
  LDA !s_spr_y_pixel_pos,x                  ; $05F371 |
  SEC                                       ; $05F374 |
  SBC !s_spr_y_delta_lo,x                   ; $05F375 |
  STA !s_spr_y_pixel_pos,x                  ; $05F378 |

CODE_05F37B:
  LDA !s_spr_x_speed_lo,x                   ; $05F37B |
  BEQ CODE_05F3A8                           ; $05F37E |
  LDA $7860,x                               ; $05F380 |
  AND #$000C                                ; $05F383 |
  BEQ CODE_05F3A8                           ; $05F386 |
  SEC                                       ; $05F388 |
  SBC #$0008                                ; $05F389 |
  EOR !s_spr_x_speed_lo,x                   ; $05F38C |
  BPL CODE_05F3A8                           ; $05F38F |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F391 |
  EOR #$FFFF                                ; $05F394 |
  INC A                                     ; $05F397 |
  AND #$01FE                                ; $05F398 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F39B |
  LDA !s_spr_x_pixel_pos,x                  ; $05F39E |
  SEC                                       ; $05F3A1 |
  SBC !s_spr_x_delta_lo,x                   ; $05F3A2 |
  STA !s_spr_x_pixel_pos,x                  ; $05F3A5 |

CODE_05F3A8:
  RTS                                       ; $05F3A8 |

CODE_05F3A9:
  LDA #$0100                                ; $05F3A9 |
  STA !gsu_r6                               ; $05F3AC |
  LDA #$4000                                ; $05F3AF |
  LDY #$55                                  ; $05F3B2 |
  BRA CODE_05F3C1                           ; $05F3B4 |

CODE_05F3B6:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F3B6 |
  STA !gsu_r6                               ; $05F3B9 |
  LDA #$2061                                ; $05F3BC |
  LDY #$54                                  ; $05F3BF |

CODE_05F3C1:
  STA !gsu_r12                              ; $05F3C1 |
  TYA                                       ; $05F3C4 |
  STA !gsu_r13                              ; $05F3C5 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F3C8 |
  LSR A                                     ; $05F3CB |
  STA !gsu_r5                               ; $05F3CC |
  LDY !s_spr_dyntile_index,x                ; $05F3CF |
  TYX                                       ; $05F3D2 |
  LDA $03A9CE,x                             ; $05F3D3 |
  STA !gsu_r3                               ; $05F3D7 |
  LDA $03A9EE,x                             ; $05F3DA |
  STA !gsu_r2                               ; $05F3DE |
  LDX #$A908                                ; $05F3E1 |
  ORA $82                                   ; $05F3E4 |
  JSL r_gsu_init_1                          ; $05F3E6 | GSU init
  LDX $12                                   ; $05F3EA |
  INC $0CF9                                 ; $05F3EC |
  RTS                                       ; $05F3EF |

init_double_ended_arrow_lift:
  JSL $03AE60                               ; $05F3F0 |
  LDA !s_spr_wildcard_2_lo,x                ; $05F3F4 |
  INC A                                     ; $05F3F7 |
  BEQ CODE_05F40B                           ; $05F3F8 |
  INC A                                     ; $05F3FA |
  BEQ CODE_05F405                           ; $05F3FB |
  LDA !s_spr_x_speed_lo,x                   ; $05F3FD |
  AND #$0010                                ; $05F400 |
  BEQ CODE_05F40B                           ; $05F403 |

CODE_05F405:
  LDA #$0020                                ; $05F405 |
  STA !s_spr_oam_yxppccct,x                 ; $05F408 |

CODE_05F40B:
  STZ !s_spr_wildcard_2_lo,x                ; $05F40B |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F40E |
  SEC                                       ; $05F411 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $05F412 |
  BEQ CODE_05F428                           ; $05F415 |
  AND #$00FF                                ; $05F417 |
  BEQ CODE_05F422                           ; $05F41A |
  LDY #$9401                                ; $05F41C |
  CLC                                       ; $05F41F |
  BRA CODE_05F428                           ; $05F420 |

CODE_05F422:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F422 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F425 |

CODE_05F428:
  LDA #$0340                                ; $05F428 |
  STA !s_spr_y_accel_ceiling,x              ; $05F42B |
  JSR CODE_05F3A9                           ; $05F42E |
  RTL                                       ; $05F431 |

  dw $F52E                                  ; $05F432 |
  dw $F57D                                  ; $05F434 |

main_double_ended_arrow_lift:
  STZ !s_spr_facing_dir,x                   ; $05F436 |
  JSL $03AA52                               ; $05F439 |
  LDA !s_spr_state,x                        ; $05F43D |
  CMP #$0008                                ; $05F440 |
  BNE CODE_05F45B                           ; $05F443 |
  LDY !s_spr_draw_priority,x                ; $05F445 |
  BPL CODE_05F45B                           ; $05F448 |
  LDA #$FFFF                                ; $05F44A |
  STA !s_spr_wildcard_2_lo,x                ; $05F44D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F450 |
  AND #$0040                                ; $05F453 |
  BEQ CODE_05F45B                           ; $05F456 |
  DEC !s_spr_wildcard_2_lo,x                ; $05F458 |

CODE_05F45B:
  JSL $05F0FA                               ; $05F45B |
  JSR CODE_05F0F3                           ; $05F45F |
  JSR CODE_05F1F6                           ; $05F462 |
  JSR CODE_05F2F6                           ; $05F465 |
  JSR CODE_05F34C                           ; $05F468 |
  JSR CODE_05F47B                           ; $05F46B |
  TXY                                       ; $05F46E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05F46F |
  ASL A                                     ; $05F471 |
  TAX                                       ; $05F472 |
  JSR ($F432,x)                             ; $05F473 |
  JSR CODE_05F3A9                           ; $05F476 |
  RTL                                       ; $05F479 |

CODE_05F47A:
  RTS                                       ; $05F47A |

CODE_05F47B:
  LDA !s_spr_timer_1,x                      ; $05F47B |
  BNE CODE_05F47A                           ; $05F47E |
  LDY !s_spr_collision_id,x                 ; $05F480 |
  DEY                                       ; $05F483 |
  BMI CODE_05F47A                           ; $05F484 |
  LDA !s_spr_state,y                        ; $05F486 |
  CMP #$0010                                ; $05F489 |
  BNE CODE_05F47A                           ; $05F48C |
  LDA !s_spr_collision_state,y              ; $05F48E |
  BEQ CODE_05F47A                           ; $05F491 |
  STZ !s_spr_wildcard_2_lo,x                ; $05F493 |
  PHY                                       ; $05F496 |
  TYX                                       ; $05F497 |
  JSL $03B25B                               ; $05F498 |
  PLY                                       ; $05F49C |
  LDA #$0020                                ; $05F49D |
  STA !s_spr_timer_1,x                      ; $05F4A0 |
  LDA !s_spr_x_speed_lo,y                   ; $05F4A3 |
  CMP #$8000                                ; $05F4A6 |
  ROR A                                     ; $05F4A9 |
  CMP #$8000                                ; $05F4AA |
  ROR A                                     ; $05F4AD |
  STA !gsu_r1                               ; $05F4AE |
  LDA !s_spr_y_speed_lo,y                   ; $05F4B1 |
  CMP #$8000                                ; $05F4B4 |
  ROR A                                     ; $05F4B7 |
  CMP #$8000                                ; $05F4B8 |
  ROR A                                     ; $05F4BB |
  STA !gsu_r2                               ; $05F4BC |
  LDX #$0B                                  ; $05F4BF |
  LDA #$BCF8                                ; $05F4C1 |
  JSL r_gsu_init_1                          ; $05F4C4 | GSU init
  LDX $12                                   ; $05F4C8 |
  LDA !gsu_r0                               ; $05F4CA |
  PHA                                       ; $05F4CD |
  LDA !s_spr_x_collision_delta,x            ; $05F4CE |
  STA !gsu_r1                               ; $05F4D1 |
  LDA !s_spr_y_collision_delta,x            ; $05F4D4 |
  STA !gsu_r2                               ; $05F4D7 |
  LDX #$0B                                  ; $05F4DA |
  LDA #$BCF8                                ; $05F4DC |
  JSL r_gsu_init_1                          ; $05F4DF | GSU init
  LDX $12                                   ; $05F4E3 |
  PLA                                       ; $05F4E5 |
  SEC                                       ; $05F4E6 |
  SBC !gsu_r0                               ; $05F4E7 |
  PHP                                       ; $05F4EA |
  CLC                                       ; $05F4EB |
  ADC #$0100                                ; $05F4EC |
  CMP #$0200                                ; $05F4EF |
  BCS CODE_05F4F9                           ; $05F4F2 |
  PLP                                       ; $05F4F4 |
  BPL CODE_05F4FC                           ; $05F4F5 |
  BRA CODE_05F501                           ; $05F4F7 |

CODE_05F4F9:
  PLP                                       ; $05F4F9 |
  BPL CODE_05F501                           ; $05F4FA |

CODE_05F4FC:
  LDA #$F000                                ; $05F4FC |
  BRA CODE_05F504                           ; $05F4FF |

CODE_05F501:
  LDA #$1000                                ; $05F501 |

CODE_05F504:
  STA !s_spr_wildcard_1_lo,x                ; $05F504 |
  PHP                                       ; $05F507 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F508 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05F50B |
  BEQ CODE_05F512                           ; $05F50D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F50F |

CODE_05F512:
  PLP                                       ; $05F512 |
  BPL CODE_05F51B                           ; $05F513 |
  CLC                                       ; $05F515 |
  ADC #$0080                                ; $05F516 |
  BRA CODE_05F51F                           ; $05F519 |

CODE_05F51B:
  SEC                                       ; $05F51B |
  SBC #$0080                                ; $05F51C |

CODE_05F51F:
  AND #$01FE                                ; $05F51F |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F522 |
  INY                                       ; $05F525 |
  INY                                       ; $05F526 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05F527 |
  LDY #$9401                                ; $05F529 |
  CLC                                       ; $05F52C |
  RTS                                       ; $05F52D |

  TYX                                       ; $05F52E |
  LDA !s_spr_y_accel_ceiling,x              ; $05F52F |
  CLC                                       ; $05F532 |
  ADC !s_spr_x_accel_ceiling,x              ; $05F533 |
  PHA                                       ; $05F536 |
  AND #$00FF                                ; $05F537 |
  STA !s_spr_x_accel_ceiling,x              ; $05F53A |
  PLA                                       ; $05F53D |
  AND #$FF00                                ; $05F53E |
  BPL CODE_05F546                           ; $05F541 |
  ORA #$00FF                                ; $05F543 |

CODE_05F546:
  XBA                                       ; $05F546 |
  CLC                                       ; $05F547 |
  ADC !s_spr_wildcard_2_lo,x                ; $05F548 |
  STA !s_spr_wildcard_2_lo,x                ; $05F54B |
  BPL CODE_05F55F                           ; $05F54E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05F550 |
  EOR #$0001                                ; $05F552 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05F555 |
  STZ !s_spr_wildcard_2_lo,x                ; $05F557 |
  STZ !s_spr_x_accel_ceiling,x              ; $05F55A |
  BRA CODE_05F572                           ; $05F55D |

CODE_05F55F:
  CMP #$0100                                ; $05F55F |
  BMI CODE_05F57C                           ; $05F562 |
  LDA #$0100                                ; $05F564 |
  STA !s_spr_wildcard_2_lo,x                ; $05F567 |
  STZ !s_spr_x_accel_ceiling,x              ; $05F56A |
  CPX $61B6                                 ; $05F56D |
  BEQ CODE_05F57C                           ; $05F570 |

CODE_05F572:
  LDA !s_spr_y_accel_ceiling,x              ; $05F572 |
  EOR #$FFFF                                ; $05F575 |
  INC A                                     ; $05F578 |
  STA !s_spr_y_accel_ceiling,x              ; $05F579 |

CODE_05F57C:
  RTS                                       ; $05F57C |

  TYX                                       ; $05F57D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $05F57E |
  SEC                                       ; $05F581 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $05F582 |
  CLC                                       ; $05F585 |
  ADC #$0010                                ; $05F586 |
  CMP #$0020                                ; $05F589 |
  BCS CODE_05F5A6                           ; $05F58C |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $05F58E |
  DEY                                       ; $05F590 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $05F591 |
  BPL CODE_05F5A6                           ; $05F593 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F595 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05F598 |
  STZ !s_spr_wildcard_1_lo,x                ; $05F59B |
  LDA #$0100                                ; $05F59E |
  STA !s_spr_wildcard_2_lo,x                ; $05F5A1 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05F5A4 |

CODE_05F5A6:
  RTS                                       ; $05F5A6 |

  dw $0100, $00A0, $0060                    ; $05F5A7 |

init_POW:
  LDY $0E25                                 ; $05F5AD |
  CPY #$06                                  ; $05F5B0 |
  BNE CODE_05F5B8                           ; $05F5B2 |
  JML $03A31E                               ; $05F5B4 |

CODE_05F5B8:
  JSL $03AE60                               ; $05F5B8 |
  LDY $0E25                                 ; $05F5BC |
  LDA $F5A7,y                               ; $05F5BF |
  STA !s_spr_gsu_morph_1_lo,x               ; $05F5C2 |
  STZ !s_spr_facing_dir,x                   ; $05F5C5 |
  JSR CODE_05F67D                           ; $05F5C8 |
  RTL                                       ; $05F5CB |

  dw $80C2                                  ; $05F5CC |
  dw $F6BF                                  ; $05F5CE |
  dw $80C2                                  ; $05F5D0 |

  JSL $03AA52                               ; $05F5D2 |
  JSL $03AF23                               ; $05F5D6 |
  TXY                                       ; $05F5DA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05F5DB |
  ASL A                                     ; $05F5DD |
  TAX                                       ; $05F5DE |
  JSR ($F5CC,x)                             ; $05F5DF |
  LDA !s_spr_dyntile_index,x                ; $05F5E2 |
  LSR A                                     ; $05F5E5 |
  LSR A                                     ; $05F5E6 |
  LSR A                                     ; $05F5E7 |
  SEC                                       ; $05F5E8 |
  SBC !r_frame_counter_global               ; $05F5E9 |
  AND #$0003                                ; $05F5EC |
  BNE CODE_05F5F4                           ; $05F5EF |
  JSR CODE_05F67D                           ; $05F5F1 |

CODE_05F5F4:
  LDA #$0E00                                ; $05F5F4 |
  STA !gsu_r0                               ; $05F5F7 |
  STA !gsu_r1                               ; $05F5FA |
  LDA #$0010                                ; $05F5FD |
  STA $0A                                   ; $05F600 |
  STZ $02                                   ; $05F602 |
  LDY #$02                                  ; $05F604 |
  STY $09                                   ; $05F606 |
  LDY #$00                                  ; $05F608 |
  STZ $06                                   ; $05F60A |
  STZ !gsu_r3                               ; $05F60C |
  LDA #$0100                                ; $05F60F |
  STA !gsu_r6                               ; $05F612 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F615 |
  JSL $059C6F                               ; $05F618 |
  LDY $04                                   ; $05F61C |
  BNE CODE_05F629                           ; $05F61E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05F620 |
  CPY #$02                                  ; $05F622 |
  BNE CODE_05F628                           ; $05F624 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05F626 |

CODE_05F628:
  RTL                                       ; $05F628 |

CODE_05F629:
  CPY #$04                                  ; $05F629 |
  BNE CODE_05F628                           ; $05F62B |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05F62D |
  BNE CODE_05F628                           ; $05F62F |
  LDA #$0020                                ; $05F631 |
  STA !s_cam_y_small_shaking_timer          ; $05F634 |
  JSL transform_enemies_stars               ; $05F637 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05F63B |
  LDA #$001F                                ; $05F63D |
  JSL push_sound_queue                      ; $05F640 |
  INC $0E25                                 ; $05F644 |
  INC $0E25                                 ; $05F647 |
  LDY $0E25                                 ; $05F64A |
  CPY #$06                                  ; $05F64D |
  BNE CODE_05F67C                           ; $05F64F |
  LDA #$01D4                                ; $05F651 |
  JSL spawn_ambient_sprite                  ; $05F654 |
  LDA !s_spr_x_pixel_pos,x                  ; $05F658 |
  STA $70A2,y                               ; $05F65B |
  LDA !s_spr_y_pixel_pos,x                  ; $05F65E |
  SEC                                       ; $05F661 |
  SBC #$0010                                ; $05F662 |
  STA $7142,y                               ; $05F665 |
  LDA #$000B                                ; $05F668 |
  STA $7E4C,y                               ; $05F66B |
  LDA #$0006                                ; $05F66E |
  STA $7782,y                               ; $05F671 |
  JSL $03AEFD                               ; $05F674 |
  JSL $03A31E                               ; $05F678 |

CODE_05F67C:
  RTL                                       ; $05F67C |

CODE_05F67D:
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F67D |
  STA !gsu_r11                              ; $05F680 |
  LDA #$0100                                ; $05F683 |
  STA !gsu_r6                               ; $05F686 |
  LDA #$0010                                ; $05F689 |
  STA !gsu_r8                               ; $05F68C |
  STZ !gsu_r9                               ; $05F68F |
  LDA #$0054                                ; $05F692 |
  STA !gsu_r13                              ; $05F695 |
  LDA #$E0A0                                ; $05F698 |
  STA !gsu_r12                              ; $05F69B |
  LDY !s_spr_dyntile_index,x                ; $05F69E |
  TYX                                       ; $05F6A1 |
  LDA $03A9CE,x                             ; $05F6A2 |
  STA !gsu_r3                               ; $05F6A6 |
  LDA $03A9EE,x                             ; $05F6A9 |
  STA !gsu_r2                               ; $05F6AD |
  LDX #$08                                  ; $05F6B0 |
  LDA #$8295                                ; $05F6B2 |
  JSL r_gsu_init_1                          ; $05F6B5 |
  LDX $12                                   ; $05F6B9 |
  INC $0CF9                                 ; $05F6BB |
  RTS                                       ; $05F6BE |

  TYX                                       ; $05F6BF |
  LDY $0E25                                 ; $05F6C0 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05F6C3 |
  CMP $F5A7,y                               ; $05F6C6 |
  BPL CODE_05F6D2                           ; $05F6C9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05F6CB |
  LDA $F5A7,y                               ; $05F6CD |
  BRA CODE_05F6D6                           ; $05F6D0 |

CODE_05F6D2:
  SEC                                       ; $05F6D2 |
  SBC #$0010                                ; $05F6D3 |

CODE_05F6D6:
  STA !s_spr_gsu_morph_1_lo,x               ; $05F6D6 |
  RTS                                       ; $05F6D9 |

  dw $FFC0, $0040                           ; $05F6DA |

; swim & jumps in an arc and jumps 3 times
init_flopsy_fish_jumps:
  SEP #$20                                  ; $05F6DE |
  LDA #$FF                                  ; $05F6E0 |
  STA $7863,x                               ; $05F6E2 |
  REP #$20                                  ; $05F6E5 |
  LDA !s_spr_y_pixel_pos,x                  ; $05F6E7 |
  STA !s_spr_wildcard_2_lo,x                ; $05F6EA |
  LDA !s_spr_x_pixel_pos,x                  ; $05F6ED |
  PHA                                       ; $05F6F0 |
  SEC                                       ; $05F6F1 |
  SBC !s_bg1_cam_x                          ; $05F6F2 |
  STA $00                                   ; $05F6F5 |
  PLA                                       ; $05F6F7 |
  AND #$0010                                ; $05F6F8 |
  EOR #$0010                                ; $05F6FB |
  LSR A                                     ; $05F6FE |
  LSR A                                     ; $05F6FF |
  LSR A                                     ; $05F700 |
  STA !s_spr_facing_dir,x                   ; $05F701 |
  LDY !s_spr_id,x                           ; $05F704 |
  CPY #$41                                  ; $05F707 |
  BEQ CODE_05F737                           ; $05F709 |
  LDA $00                                   ; $05F70B |
  LDY !s_spr_facing_dir,x                   ; $05F70D |
  BNE CODE_05F719                           ; $05F710 |
  CMP #$0120                                ; $05F712 |
  BMI CODE_05F733                           ; $05F715 |
  BRA CODE_05F71E                           ; $05F717 |

CODE_05F719:
  CMP #$FFE0                                ; $05F719 |
  BPL CODE_05F733                           ; $05F71C |

CODE_05F71E:
  JSL $03AE60                               ; $05F71E |
  LDY #$03                                  ; $05F722 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $05F724 |
  JSR CODE_05F872                           ; $05F726 |
  LDY !s_spr_facing_dir,x                   ; $05F729 |
  LDA $F84C,y                               ; $05F72C |
  STA !s_spr_x_speed_lo,x                   ; $05F72F |
  RTL                                       ; $05F732 |

CODE_05F733:
  JML $03A31E                               ; $05F733 |

CODE_05F737:
  TAY                                       ; $05F737 |
  LDA !s_spr_x_pixel_pos,x                  ; $05F738 |
  CLC                                       ; $05F73B |
  ADC $F6DA,y                               ; $05F73C |
  STA !s_spr_wildcard_1_lo,x                ; $05F73F |
  JSR CODE_05F7C3                           ; $05F742 |
  RTL                                       ; $05F745 |

  dw $F850                                  ; $05F746 |
  dw $F8DD                                  ; $05F748 |
  dw $F922                                  ; $05F74A |
  dw $80C2                                  ; $05F74C |

; swim & jumps in an arc and jumps 3 times
main_flopsy_fish_jumps:
  JSR CODE_05F76D                           ; $05F74E |
  JSL $05F79A                               ; $05F751 |
  JSL $03AF23                               ; $05F755 |
  TXY                                       ; $05F759 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05F75A |
  ASL A                                     ; $05F75C |
  TAX                                       ; $05F75D |
  JSR ($F746,x)                             ; $05F75E |
  JSR CODE_05F7C3                           ; $05F761 |
  JSL $03A5B7                               ; $05F764 |
  RTL                                       ; $05F768 |

  dw $0403, $0405                           ; $05F769 |

CODE_05F76D:
  LDA !s_spr_dyntile_index,x                ; $05F76D |
  BMI CODE_05F799                           ; $05F770 |
  LDA !s_spr_oam_pointer,x                  ; $05F772 |
  BMI CODE_05F799                           ; $05F775 |
  LDY !s_spr_draw_priority,x                ; $05F777 |
  BMI CODE_05F799                           ; $05F77A |
  JSL $03AA52                               ; $05F77C |
  REP #$10                                  ; $05F780 |
  LDY !s_spr_oam_pointer,x                  ; $05F782 |
  LDA $6000,y                               ; $05F785 |
  STA $6020,y                               ; $05F788 |
  LDA $6002,y                               ; $05F78B |
  STA $6022,y                               ; $05F78E |
  LDA $6004,y                               ; $05F791 |
  STA $6024,y                               ; $05F794 |
  SEP #$10                                  ; $05F797 |

CODE_05F799:
  RTS                                       ; $05F799 |

  LDA !s_spr_state,x                        ; $05F79A |
  CMP #$000C                                ; $05F79D |
  BNE CODE_05F7C2                           ; $05F7A0 |
  CPX $61B6                                 ; $05F7A2 |
  BNE CODE_05F7AA                           ; $05F7A5 |
  STZ $61B6                                 ; $05F7A7 |

CODE_05F7AA:
  LDA !s_spr_dyntile_index,x                ; $05F7AA |
  BMI CODE_05F7B3                           ; $05F7AD |
  JSL $03AEFD                               ; $05F7AF |

CODE_05F7B3:
  LDA #$0004                                ; $05F7B3 |
  STA !s_spr_anim_frame,x                   ; $05F7B6 |
  LDA !s_spr_oam_yxppccct,x                 ; $05F7B9 |
  ORA #$0080                                ; $05F7BC |
  STA !s_spr_oam_yxppccct,x                 ; $05F7BF |

CODE_05F7C2:
  RTL                                       ; $05F7C2 |

CODE_05F7C3:
  LDA !s_spr_dyntile_index,x                ; $05F7C3 |
  BMI CODE_05F83F                           ; $05F7C6 |
  LDA !s_spr_x_speed_lo,x                   ; $05F7C8 |
  CMP #$8000                                ; $05F7CB |
  ROR A                                     ; $05F7CE |
  CMP #$8000                                ; $05F7CF |
  ROR A                                     ; $05F7D2 |
  STA !gsu_r1                               ; $05F7D3 |
  LDA !s_spr_y_speed_lo,x                   ; $05F7D6 |
  CMP #$8000                                ; $05F7D9 |
  ROR A                                     ; $05F7DC |
  CMP #$8000                                ; $05F7DD |
  ROR A                                     ; $05F7E0 |
  STA !gsu_r2                               ; $05F7E1 |
  LDX #$0B                                  ; $05F7E4 |
  LDA #$BCF8                                ; $05F7E6 |
  JSL r_gsu_init_1                          ; $05F7E9 | GSU init
  LDX $12                                   ; $05F7ED |
  LDA !gsu_r1                               ; $05F7EF |
  SEC                                       ; $05F7F2 |
  SBC #$0040                                ; $05F7F3 |
  CMP #$0080                                ; $05F7F6 |
  BCS CODE_05F804                           ; $05F7F9 |
  LDA #$0080                                ; $05F7FB |
  SEC                                       ; $05F7FE |
  SBC !gsu_r1                               ; $05F7FF |
  BRA CODE_05F807                           ; $05F802 |

CODE_05F804:
  LDA !gsu_r1                               ; $05F804 |

CODE_05F807:
  AND #$00FF                                ; $05F807 |
  STA !gsu_r5                               ; $05F80A |
  LDA #$4020                                ; $05F80D |
  STA !gsu_r12                              ; $05F810 |
  LDA #$0055                                ; $05F813 |
  STA !gsu_r13                              ; $05F816 |
  LDA #$0100                                ; $05F819 |
  STA !gsu_r6                               ; $05F81C |
  LDY !s_spr_dyntile_index,x                ; $05F81F |
  TYX                                       ; $05F822 |
  LDA $03A9CE,x                             ; $05F823 |
  STA !gsu_r3                               ; $05F827 |
  LDA $03A9EE,x                             ; $05F82A |
  STA !gsu_r2                               ; $05F82E |
  LDX #$08                                  ; $05F831 |
  LDA #$8205                                ; $05F833 |
  JSL r_gsu_init_1                          ; $05F836 | GSU init
  LDX $12                                   ; $05F83A |
  INC $0CF9                                 ; $05F83C |

CODE_05F83F:
  RTS                                       ; $05F83F |

  db $01, $00, $0E, $00                     ; $05F840 |

  db $0A, $08, $0A, $08                     ; $05F844 |

  dw $000E, $0001                           ; $05F848 |

  dw $FEF8, $0108                           ; $05F84C |

  TYX                                       ; $05F850 |
  LDA !s_spr_x_pixel_pos,x                  ; $05F851 |
  SEC                                       ; $05F854 |
  SBC !s_spr_wildcard_1_lo,x                ; $05F855 |
  CLC                                       ; $05F858 |
  ADC #$0040                                ; $05F859 |
  CMP #$0080                                ; $05F85C |
  BCS CODE_05F88C                           ; $05F85F |
  SEC                                       ; $05F861 |
  SBC #$0020                                ; $05F862 |
  CMP #$0040                                ; $05F865 |
  BCS CODE_05F8AF                           ; $05F868 |
  JSL $03AD74                               ; $05F86A |
  BCC CODE_05F88C                           ; $05F86E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $05F870 |

CODE_05F872:
  JSR CODE_05F953                           ; $05F872 |
  LDA #$FA80                                ; $05F875 |
  STA !s_spr_y_speed_lo,x                   ; $05F878 |
  LDA #$002E                                ; $05F87B |
  STA !s_spr_y_accel,x                      ; $05F87E |
  LDA #$0011                                ; $05F881 |
  STA !s_spr_anim_frame,x                   ; $05F884 |
  LDY #$02                                  ; $05F887 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05F889 |
  RTS                                       ; $05F88B |

CODE_05F88C:
  STA $00                                   ; $05F88C |
  LDA !s_spr_facing_dir,x                   ; $05F88E |
  DEC A                                     ; $05F891 |
  EOR $00                                   ; $05F892 |
  BMI CODE_05F8AF                           ; $05F894 |
  LDY !s_spr_facing_dir,x                   ; $05F896 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $05F899 |
  LDA $F848,y                               ; $05F89B |
  STA !s_spr_anim_frame,x                   ; $05F89E |
  LDA #$0008                                ; $05F8A1 |
  STA !s_spr_timer_2,x                      ; $05F8A4 |
  STZ !s_spr_x_speed_lo,x                   ; $05F8A7 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05F8AA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05F8AC |
  RTS                                       ; $05F8AE |

CODE_05F8AF:
  LDY !s_spr_facing_dir,x                   ; $05F8AF |
  LDA $F84C,y                               ; $05F8B2 |
  STA !s_spr_x_speed_lo,x                   ; $05F8B5 |
  LDA !s_spr_timer_2,x                      ; $05F8B8 |
  BNE CODE_05F8D8                           ; $05F8BB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05F8BD |
  INC A                                     ; $05F8BF |
  AND #$0003                                ; $05F8C0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05F8C3 |
  TAY                                       ; $05F8C5 |
  LDA $F840,y                               ; $05F8C6 |
  AND #$00FF                                ; $05F8C9 |
  STA !s_spr_anim_frame,x                   ; $05F8CC |
  LDA $F844,y                               ; $05F8CF |
  AND #$00FF                                ; $05F8D2 |
  STA !s_spr_timer_2,x                      ; $05F8D5 |

CODE_05F8D8:
  RTS                                       ; $05F8D8 |

  db $0F, $01, $10, $0E                     ; $05F8D9 |

  TYX                                       ; $05F8DD |
  LDA !s_spr_timer_2,x                      ; $05F8DE |
  BNE CODE_05F921                           ; $05F8E1 |
  LDA #$0008                                ; $05F8E3 |
  STA !s_spr_timer_2,x                      ; $05F8E6 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $05F8E9 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05F8EB |
  CMP #$0003                                ; $05F8ED |
  BNE CODE_05F8F5                           ; $05F8F0 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $05F8F2 |
  RTS                                       ; $05F8F4 |

CODE_05F8F5:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05F8F5 |
  BNE CODE_05F906                           ; $05F8F7 |
  CMP #$0002                                ; $05F8F9 |
  PHP                                       ; $05F8FC |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05F8FD |
  CLC                                       ; $05F8FF |
  ADC #$0002                                ; $05F900 |
  TAY                                       ; $05F903 |
  BRA CODE_05F90C                           ; $05F904 |

CODE_05F906:
  CMP #$0001                                ; $05F906 |
  PHP                                       ; $05F909 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05F90A |

CODE_05F90C:
  LDA $F8D8,y                               ; $05F90C |
  AND #$00FF                                ; $05F90F |
  STA !s_spr_anim_frame,x                   ; $05F912 |
  PLP                                       ; $05F915 |
  BNE CODE_05F921                           ; $05F916 |
  LDA !s_spr_facing_dir,x                   ; $05F918 |
  EOR #$0002                                ; $05F91B |
  STA !s_spr_facing_dir,x                   ; $05F91E |

CODE_05F921:
  RTS                                       ; $05F921 |

  TYX                                       ; $05F922 |
  LDA !s_spr_wildcard_2_lo,x                ; $05F923 |
  CMP !s_spr_y_pixel_pos,x                  ; $05F926 |
  BPL CODE_05F952                           ; $05F929 |
  JSR CODE_05F953                           ; $05F92B |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $05F92E |
  BNE CODE_05F94C                           ; $05F930 |
  LDY !s_spr_id,x                           ; $05F932 |
  CPY #$41                                  ; $05F935 |
  BEQ CODE_05F93C                           ; $05F937 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05F939 |
  RTS                                       ; $05F93B |

CODE_05F93C:
  JSL $03AEFD                               ; $05F93C |
  STZ !s_spr_y_speed_lo,x                   ; $05F940 |
  STZ !s_spr_y_accel,x                      ; $05F943 |
  STZ !s_spr_anim_frame,x                   ; $05F946 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05F949 |
  RTS                                       ; $05F94B |

CODE_05F94C:
  LDA #$FA80                                ; $05F94C |
  STA !s_spr_y_speed_lo,x                   ; $05F94F |

CODE_05F952:
  RTS                                       ; $05F952 |

CODE_05F953:
  LDA #$01FE                                ; $05F953 |
  JSL spawn_ambient_sprite                  ; $05F956 |
  LDA !s_spr_x_pixel_pos,x                  ; $05F95A |
  STA $70A2,y                               ; $05F95D |
  LDA !s_spr_y_pixel_pos,x                  ; $05F960 |
  STA $7142,y                               ; $05F963 |
  LDA #$0006                                ; $05F966 |
  STA $73C2,y                               ; $05F969 |
  LDA #$0002                                ; $05F96C |
  STA $7782,y                               ; $05F96F |
  LDA #$0003                                ; $05F972 |
  JSL push_sound_queue                      ; $05F975 |
  RTS                                       ; $05F979 |

init_melon_bug:
  RTL                                       ; $05F97A |

  dw $FA42                                  ; $05F97B |
  dw $FA81                                  ; $05F97D |
  dw $FAC7                                  ; $05F97F |

main_melon_bug:
  JSL $03AF23                               ; $05F981 |
  LDA !s_spr_x_speed_lo,x                   ; $05F985 |
  CLC                                       ; $05F988 |
  ADC #$0008                                ; $05F989 |
  CMP #$0010                                ; $05F98C |
  BCS CODE_05F994                           ; $05F98F |
  STZ !s_spr_x_speed_lo,x                   ; $05F991 |

CODE_05F994:
  TXY                                       ; $05F994 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05F995 |
  ASL A                                     ; $05F997 |
  TAX                                       ; $05F998 |
  JSR ($F97B,x)                             ; $05F999 |
  LDA #$0040                                ; $05F99C |
  STA !s_spr_y_accel,x                      ; $05F99F |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $05F9A2 |
  DEY                                       ; $05F9A4 |
  BNE CODE_05F9C0                           ; $05F9A5 |
  LDY !s_spr_anim_frame,x                   ; $05F9A7 |
  CPY #$02                                  ; $05F9AA |
  BPL CODE_05F9C0                           ; $05F9AC |
  LDA !s_spr_y_speed_lo,x                   ; $05F9AE |
  CLC                                       ; $05F9B1 |
  ADC #$00A0                                ; $05F9B2 |
  CMP #$0140                                ; $05F9B5 |
  BCS CODE_05F9C0                           ; $05F9B8 |
  LDA #$0008                                ; $05F9BA |
  STA !s_spr_y_accel,x                      ; $05F9BD |

CODE_05F9C0:
  LDY !s_spr_anim_frame,x                   ; $05F9C0 |
  CPY #$02                                  ; $05F9C3 |
  BMI CODE_05F9CE                           ; $05F9C5 |
  JSR CODE_05FB2E                           ; $05F9C7 |
  JSR CODE_05FC2F                           ; $05F9CA |
  RTL                                       ; $05F9CD |

CODE_05F9CE:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05F9CE |
  LDY !s_spr_collision_id,x                 ; $05F9D0 |
  DEY                                       ; $05F9D3 |
  BMI CODE_05FA21                           ; $05F9D4 |
  LDA !s_spr_state,y                        ; $05F9D6 |
  CMP #$0010                                ; $05F9D9 |
  BNE CODE_05FA3D                           ; $05F9DC |
  LDA !s_spr_collision_state,y              ; $05F9DE |
  BEQ CODE_05FA3D                           ; $05F9E1 |
  LDA !s_spr_x_speed_lo,y                   ; $05F9E3 |
  CMP #$0300                                ; $05F9E6 |
  BMI CODE_05F9EE                           ; $05F9E9 |
  LDA #$0300                                ; $05F9EB |

CODE_05F9EE:
  CMP #$FD00                                ; $05F9EE |
  BPL CODE_05F9F6                           ; $05F9F1 |
  LDA #$FD00                                ; $05F9F3 |

CODE_05F9F6:
  STA !s_spr_x_speed_lo,x                   ; $05F9F6 |
  LDA #$0002                                ; $05F9F9 |
  STA !s_spr_anim_frame,x                   ; $05F9FC |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05F9FF |
  LDA !s_spr_id,y                           ; $05FA01 |
  CMP #$0022                                ; $05FA04 |
  BMI CODE_05FA13                           ; $05FA07 |
  CMP #$002C                                ; $05FA09 |
  BPL CODE_05FA13                           ; $05FA0C |
  TYX                                       ; $05FA0E |
  JML $03B24B                               ; $05FA0F |

CODE_05FA13:
  CMP #$0167                                ; $05FA13 |
  BCC CODE_05FA3D                           ; $05FA16 |
  CMP #$0170                                ; $05FA18 |
  BCS CODE_05FA3D                           ; $05FA1B |
  JSR CODE_05FD1A                           ; $05FA1D |
  RTL                                       ; $05FA20 |

CODE_05FA21:
  LDY !s_spr_collision_id,x                 ; $05FA21 |
  BPL CODE_05FA3D                           ; $05FA24 |
  LDA #$0062                                ; $05FA26 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05FA29 |
  JSL push_sound_queue                      ; $05FA2B |
  LDA #$0010                                ; $05FA2F |
  STA !s_spr_timer_3,x                      ; $05FA32 |
  LDA #$0002                                ; $05FA35 |
  STA !s_spr_anim_frame,x                   ; $05FA38 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05FA3B |

CODE_05FA3D:
  JSL $03A5B7                               ; $05FA3D |
  RTL                                       ; $05FA41 |

  TYX                                       ; $05FA42 |
  LDY !s_spr_x_player_dir,x                 ; $05FA43 |
  TYA                                       ; $05FA46 |
  STA !s_spr_facing_dir,x                   ; $05FA47 |
  STZ !s_spr_anim_frame,x                   ; $05FA4A |
  LDA !s_spr_timer_1,x                      ; $05FA4D |
  BNE CODE_05FA7C                           ; $05FA50 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $05FA52 |
  LDA !s_spr_x_player_delta,x               ; $05FA54 |
  CLC                                       ; $05FA57 |
  ADC #$0060                                ; $05FA58 |
  CMP #$00C0                                ; $05FA5B |
  BCS CODE_05FA74                           ; $05FA5E |
  LDA !s_spr_y_player_delta,x               ; $05FA60 |
  CLC                                       ; $05FA63 |
  ADC #$0040                                ; $05FA64 |
  CMP #$0080                                ; $05FA67 |
  BCS CODE_05FA74                           ; $05FA6A |
  LDA #$0002                                ; $05FA6C |
  STA !s_spr_anim_frame,x                   ; $05FA6F |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05FA72 |

CODE_05FA74:
  LDA #$FC00                                ; $05FA74 |
  STA !s_spr_y_speed_lo,x                   ; $05FA77 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $05FA7A |

CODE_05FA7C:
  RTS                                       ; $05FA7C |

  dw $0010, $0060                           ; $05FA7D |

  TYX                                       ; $05FA81 |
  LDA $7860,x                               ; $05FA82 |
  AND #$0001                                ; $05FA85 |
  BEQ CODE_05FA95                           ; $05FA88 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05FA8A |
  STY !s_spr_wildcard_5_lo_dp,x             ; $05FA8C |
  LDA $FA7D,y                               ; $05FA8E |
  STA !s_spr_timer_1,x                      ; $05FA91 |
  RTS                                       ; $05FA94 |

CODE_05FA95:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $05FA95 |
  BNE CODE_05FAC6                           ; $05FA97 |
  LDA !s_spr_y_speed_lo,x                   ; $05FA99 |
  CLC                                       ; $05FA9C |
  ADC #$00A0                                ; $05FA9D |
  CMP #$0140                                ; $05FAA0 |
  BCS CODE_05FAC0                           ; $05FAA3 |
  LDA !s_spr_timer_2,x                      ; $05FAA5 |
  BNE CODE_05FAB9                           ; $05FAA8 |
  LDA #$0004                                ; $05FAAA |
  STA !s_spr_timer_2,x                      ; $05FAAD |
  LDA !s_spr_anim_frame,x                   ; $05FAB0 |
  EOR #$0001                                ; $05FAB3 |
  STA !s_spr_anim_frame,x                   ; $05FAB6 |

CODE_05FAB9:
  LDA !s_spr_y_speed_lo,x                   ; $05FAB9 |
  STA !s_spr_wildcard_2_lo,x                ; $05FABC |
  RTS                                       ; $05FABF |

CODE_05FAC0:
  LDA #$0001                                ; $05FAC0 |
  STA !s_spr_anim_frame,x                   ; $05FAC3 |

CODE_05FAC6:
  RTS                                       ; $05FAC6 |

  TYX                                       ; $05FAC7 |
  JSR CODE_05FDBA                           ; $05FAC8 |
  LDA $7860,x                               ; $05FACB |
  AND #$0001                                ; $05FACE |
  BEQ CODE_05FAFF                           ; $05FAD1 |
  LDA !s_spr_wildcard_2_lo,x                ; $05FAD3 |
  BMI CODE_05FAE6                           ; $05FAD6 |
  LSR A                                     ; $05FAD8 |
  CMP #$0100                                ; $05FAD9 |
  BMI CODE_05FAE6                           ; $05FADC |
  EOR #$FFFF                                ; $05FADE |
  INC A                                     ; $05FAE1 |
  STA !s_spr_y_speed_lo,x                   ; $05FAE2 |
  RTS                                       ; $05FAE5 |

CODE_05FAE6:
  LDA !s_spr_x_accel_ceiling,x              ; $05FAE6 |
  ORA !s_spr_timer_1,x                      ; $05FAE9 |
  ORA !s_spr_x_speed_lo,x                   ; $05FAEC |
  BNE CODE_05FAFF                           ; $05FAEF |
  LDY !s_spr_collision_id,x                 ; $05FAF1 |
  BMI CODE_05FAFF                           ; $05FAF4 |
  LDA #$0010                                ; $05FAF6 |
  STA !s_spr_timer_1,x                      ; $05FAF9 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $05FAFC |
  RTS                                       ; $05FAFE |

CODE_05FAFF:
  LDA !s_spr_x_speed_lo,x                   ; $05FAFF |
  BPL CODE_05FB08                           ; $05FB02 |
  EOR #$FFFF                                ; $05FB04 |
  INC A                                     ; $05FB07 |

CODE_05FB08:
  CLC                                       ; $05FB08 |
  ADC !s_spr_gsu_morph_2_lo,x               ; $05FB09 |
  CMP #$0400                                ; $05FB0C |
  BCC CODE_05FB20                           ; $05FB0F |
  SEC                                       ; $05FB11 |
  SBC #$0400                                ; $05FB12 |
  PHA                                       ; $05FB15 |
  LDA !s_spr_anim_frame,x                   ; $05FB16 |
  EOR #$0001                                ; $05FB19 |
  STA !s_spr_anim_frame,x                   ; $05FB1C |
  PLA                                       ; $05FB1F |

CODE_05FB20:
  STA !s_spr_gsu_morph_2_lo,x               ; $05FB20 |
  LDA !s_spr_y_speed_lo,x                   ; $05FB23 |
  STA !s_spr_wildcard_2_lo,x                ; $05FB26 |
  RTS                                       ; $05FB29 |

  dw $0180, $FE80                           ; $05FB2A |

CODE_05FB2E:
  LDA !s_spr_timer_3,x                      ; $05FB2E |
  BNE CODE_05FB38                           ; $05FB31 |
  LDY !s_spr_collision_id,x                 ; $05FB33 |
  BMI CODE_05FB3B                           ; $05FB36 |

CODE_05FB38:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $05FB38 |
  RTS                                       ; $05FB3A |

CODE_05FB3B:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $05FB3B |
  BNE CODE_05FB48                           ; $05FB3D |
  LDA #$0062                                ; $05FB3F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05FB42 |
  JSL push_sound_queue                      ; $05FB44 |

CODE_05FB48:
  LDA !r_joy1_hi_mirror                     ; $05FB48 |
  AND #$0003                                ; $05FB4B |
  BEQ CODE_05FB59                           ; $05FB4E |
  AND #$0002                                ; $05FB50 |
  DEC A                                     ; $05FB53 |
  EOR !s_spr_x_player_delta,x               ; $05FB54 |
  BMI CODE_05FBD5                           ; $05FB57 |

CODE_05FB59:
  LDA !s_spr_x_speed_lo,x                   ; $05FB59 |
  BEQ CODE_05FBA8                           ; $05FB5C |
  CMP #$8000                                ; $05FB5E |
  ROR A                                     ; $05FB61 |
  STA !s_spr_x_speed_lo,x                   ; $05FB62 |
  STA !gsu_r0                               ; $05FB65 |
  LDA #$0300                                ; $05FB68 |
  STA !gsu_r6                               ; $05FB6B |
  LDX #$0B                                  ; $05FB6E |
  LDA #$86B6                                ; $05FB70 |
  JSL r_gsu_init_1                          ; $05FB73 | GSU init
  LDX $12                                   ; $05FB77 |
  LDA !gsu_r0                               ; $05FB79 |
  EOR !s_player_x_speed_prev                ; $05FB7C |
  BMI CODE_05FB97                           ; $05FB7F |
  LDA !gsu_r0                               ; $05FB81 |
  SEC                                       ; $05FB84 |
  SBC !s_player_x_speed_prev                ; $05FB85 |
  EOR !s_player_x_speed_prev                ; $05FB88 |
  BMI CODE_05FBA8                           ; $05FB8B |
  LDA !s_spr_x_player_delta,x               ; $05FB8D |
  EOR !s_player_x_speed_prev                ; $05FB90 |
  BPL CODE_05FBA8                           ; $05FB93 |
  BRA CODE_05FB9F                           ; $05FB95 |

CODE_05FB97:
  LDA !s_spr_x_player_delta,x               ; $05FB97 |
  EOR !s_player_x_speed_prev                ; $05FB9A |
  BPL CODE_05FBA8                           ; $05FB9D |

CODE_05FB9F:
  LDA !gsu_r0                               ; $05FB9F |
  STA !s_player_x_speed_prev                ; $05FBA2 |
  STA !s_player_x_speed                     ; $05FBA5 |

CODE_05FBA8:
  LDA !s_spr_x_player_delta,x               ; $05FBA8 |
  BPL CODE_05FBB7                           ; $05FBAB |
  CLC                                       ; $05FBAD |
  ADC !s_player_hitbox_half_width           ; $05FBAE |
  CLC                                       ; $05FBB1 |
  ADC !s_spr_hitbox_width,x                 ; $05FBB2 |
  BRA CODE_05FBBF                           ; $05FBB5 |

CODE_05FBB7:
  SEC                                       ; $05FBB7 |
  SBC !s_player_hitbox_half_width           ; $05FBB8 |
  SEC                                       ; $05FBBB |
  SBC !s_spr_hitbox_width,x                 ; $05FBBC |

CODE_05FBBF:
  STA $06                                   ; $05FBBF |
  JSL $05CE7A                               ; $05FBC1 |
  LDA !s_egg_throw_state                    ; $05FBC5 |
  ORA !s_player_mouth_state                 ; $05FBC8 |
  BNE CODE_05FBD4                           ; $05FBCB |
  LDY !s_spr_x_player_dir,x                 ; $05FBCD |
  TYA                                       ; $05FBD0 |
  STA !s_player_direction                   ; $05FBD1 |

CODE_05FBD4:
  RTS                                       ; $05FBD4 |

CODE_05FBD5:
  LDA !s_spr_x_speed_lo,x                   ; $05FBD5 |
  EOR !s_player_x_speed_prev                ; $05FBD8 |
  BPL CODE_05FBF2                           ; $05FBDB |
  LDA !s_spr_x_speed_lo,x                   ; $05FBDD |
  CLC                                       ; $05FBE0 |
  ADC !s_player_x_speed_prev                ; $05FBE1 |
  CMP #$8000                                ; $05FBE4 |
  ROR A                                     ; $05FBE7 |
  STA !s_spr_x_speed_lo,x                   ; $05FBE8 |
  STA !s_player_x_speed_prev                ; $05FBEB |
  STA !s_player_x_speed                     ; $05FBEE |
  RTS                                       ; $05FBF1 |

CODE_05FBF2:
  LDY !s_spr_x_player_dir,x                 ; $05FBF2 |
  LDA !s_player_x_speed_prev                ; $05FBF5 |
  CLC                                       ; $05FBF8 |
  ADC $FB2A,y                               ; $05FBF9 |
  STA !s_spr_x_speed_lo,x                   ; $05FBFC |
  LDA !s_player_x_speed_prev                ; $05FBFF |
  STA !gsu_r0                               ; $05FC02 |
  LDA #$00C0                                ; $05FC05 |
  STA !gsu_r6                               ; $05FC08 |
  LDX #$0B                                  ; $05FC0B |
  LDA #$86B6                                ; $05FC0D |
  JSL r_gsu_init_1                          ; $05FC10 | GSU init
  LDX $12                                   ; $05FC14 |
  LDA !gsu_r0                               ; $05FC16 |
  STA !s_player_x_speed_prev                ; $05FC19 |
  STA !s_player_x_speed                     ; $05FC1C |

CODE_05FC1F:
  RTS                                       ; $05FC1F |

  dw $0080, $FF80                           ; $05FC20 |

  dw $FD00, $0300                           ; $05FC24 |

  db $0C, $0D, $0E, $0F, $10, $11, $12      ; $05FC28 |

CODE_05FC2F:
  TXA                                       ; $05FC2F |
  STA !gsu_r1                               ; $05FC30 |
  LDX #$09                                  ; $05FC33 |
  LDA #$9011                                ; $05FC35 |
  JSL r_gsu_init_1                          ; $05FC38 | GSU init

CODE_05FC3C:
  LDX $12                                   ; $05FC3C |
  LDY !gsu_r14                              ; $05FC3E |
  BMI CODE_05FC1F                           ; $05FC41 |
  BEQ CODE_05FC1F                           ; $05FC43 |
  LDA !s_spr_state,y                        ; $05FC45 |
  CMP #$0010                                ; $05FC48 |
  BNE CODE_05FC9C                           ; $05FC4B |
  LDA !s_spr_bitwise_settings_3,y           ; $05FC4D |
  AND #$6000                                ; $05FC50 |
  BEQ CODE_05FC8C                           ; $05FC53 |
  LDA !s_spr_id,y                           ; $05FC55 |
  CMP #$00FA                                ; $05FC58 |
  BEQ CODE_05FC79                           ; $05FC5B |
  CMP #$0110                                ; $05FC5D |
  BEQ CODE_05FC79                           ; $05FC60 |
  CMP #$0022                                ; $05FC62 |
  BMI CODE_05FC9C                           ; $05FC65 |
  CMP #$002C                                ; $05FC67 |
  BPL CODE_05FC9C                           ; $05FC6A |
  LDA !s_spr_wildcard_6_lo,y                ; $05FC6C |
  BNE CODE_05FC9C                           ; $05FC6F |
  TYX                                       ; $05FC71 |
  JSL $03B24B                               ; $05FC72 |
  JMP CODE_05FD58                           ; $05FC76 |

CODE_05FC79:
  LDA !s_spr_wildcard_5_lo,y                ; $05FC79 |
  CMP #$0002                                ; $05FC7C |
  BNE CODE_05FC9C                           ; $05FC7F |
  INC !s_spr_collision_state,x              ; $05FC81 |
  LDA #$0620                                ; $05FC84 |
  STA !s_spr_bitwise_settings_1,x           ; $05FC87 |
  BRA CODE_05FC1F                           ; $05FC8A |

CODE_05FC8C:
  LDA !s_spr_id,y                           ; $05FC8C |
  CMP #$0092                                ; $05FC8F |
  BNE CODE_05FCA3                           ; $05FC92 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $05FC94 |
  BEQ CODE_05FC9E                           ; $05FC97 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $05FC99 |

CODE_05FC9C:
  BRA CODE_05FCE1                           ; $05FC9C |

CODE_05FC9E:
  JSR CODE_05FCED                           ; $05FC9E |
  BRA CODE_05FCE1                           ; $05FCA1 |

CODE_05FCA3:
  PHA                                       ; $05FCA3 |
  LDA !s_spr_wildcard_1_lo,x                ; $05FCA4 |
  INC A                                     ; $05FCA7 |
  CMP #$0009                                ; $05FCA8 |
  BPL CODE_05FCB0                           ; $05FCAB |
  STA !s_spr_wildcard_1_lo,x                ; $05FCAD |

CODE_05FCB0:
  PLA                                       ; $05FCB0 |
  CMP #$0167                                ; $05FCB1 |
  BCC CODE_05FCC0                           ; $05FCB4 |
  CMP #$0170                                ; $05FCB6 |
  BCS CODE_05FCC0                           ; $05FCB9 |
  JSR CODE_05FD0D                           ; $05FCBB |
  BRA CODE_05FCC7                           ; $05FCBE |

CODE_05FCC0:
  PHY                                       ; $05FCC0 |
  TYX                                       ; $05FCC1 |
  JSL $03B25B                               ; $05FCC2 |
  PLY                                       ; $05FCC6 |

CODE_05FCC7:
  LDA !s_spr_wildcard_1_lo,x                ; $05FCC7 |
  CMP #$0008                                ; $05FCCA |
  BMI CODE_05FCD6                           ; $05FCCD |
  TYX                                       ; $05FCCF |
  JSL $03A496                               ; $05FCD0 |
  BRA CODE_05FCE1                           ; $05FCD4 |

CODE_05FCD6:
  TAY                                       ; $05FCD6 |
  LDA $FC27,y                               ; $05FCD7 |
  AND #$00FF                                ; $05FCDA |
  JSL push_sound_queue                      ; $05FCDD |

CODE_05FCE1:
  LDX #$09                                  ; $05FCE1 |
  LDA !gsu_r15                              ; $05FCE3 |
  JSL r_gsu_init_1                          ; $05FCE6 | GSU init
  JMP CODE_05FC3C                           ; $05FCEA |

CODE_05FCED:
  LDA !s_spr_x_speed_lo,y                   ; $05FCED |
  BNE CODE_05FCF8                           ; $05FCF0 |
  LDA !s_spr_x_speed_lo,x                   ; $05FCF2 |
  BNE CODE_05FD00                           ; $05FCF5 |
  RTS                                       ; $05FCF7 |

CODE_05FCF8:
  JSR CODE_05FD58                           ; $05FCF8 |
  LDA !s_spr_x_speed_lo,x                   ; $05FCFB |
  BEQ CODE_05FD08                           ; $05FCFE |

CODE_05FD00:
  PHX                                       ; $05FD00 |
  TYX                                       ; $05FD01 |
  PLY                                       ; $05FD02 |
  JSR CODE_05FD58                           ; $05FD03 |
  LDX $12                                   ; $05FD06 |

CODE_05FD08:
  RTS                                       ; $05FD08 |

  dw $FE00, $0200                           ; $05FD09 |

CODE_05FD0D:
  CMP #$0169                                ; $05FD0D |
  BCS CODE_05FD1A                           ; $05FD10 |
  LDA !s_spr_collision_state,y              ; $05FD12 |
  BEQ CODE_05FD1A                           ; $05FD15 |
  JSR CODE_05FD58                           ; $05FD17 |

CODE_05FD1A:
  PHY                                       ; $05FD1A |
  TYX                                       ; $05FD1B |
  JSL $0CFF61                               ; $05FD1C |
  JSL $03B24B                               ; $05FD20 |
  PLY                                       ; $05FD24 |
  LDA !s_spr_x_hitbox_center,x              ; $05FD25 |
  LDX #$00                                  ; $05FD28 |
  CMP !s_spr_x_hitbox_center,y              ; $05FD2A |
  BPL CODE_05FD31                           ; $05FD2D |
  INX                                       ; $05FD2F |
  INX                                       ; $05FD30 |

CODE_05FD31:
  LDA $FD09,x                               ; $05FD31 |
  STA !s_spr_x_speed_lo,y                   ; $05FD34 |
  LDA #$000E                                ; $05FD37 |
  STA !s_spr_state,y                        ; $05FD3A |
  LDA #$0040                                ; $05FD3D |
  STA !s_spr_y_accel,y                      ; $05FD40 |
  LDA #$0400                                ; $05FD43 |
  STA !s_spr_y_accel_ceiling,y              ; $05FD46 |
  LDA #$FC00                                ; $05FD49 |
  STA !s_spr_y_speed_lo,y                   ; $05FD4C |
  LDA #$0001                                ; $05FD4F |
  STA !s_spr_wildcard_1_lo,y                ; $05FD52 |
  LDX $12                                   ; $05FD55 |
  RTS                                       ; $05FD57 |

CODE_05FD58:
  PHY                                       ; $05FD58 |
  JSL $03B288                               ; $05FD59 |
  PLY                                       ; $05FD5D |
  PHY                                       ; $05FD5E |
  LDA !s_spr_x_hitbox_center,y              ; $05FD5F |
  LDY #$00                                  ; $05FD62 |
  CMP !s_spr_x_hitbox_center,x              ; $05FD64 |
  BPL CODE_05FD6B                           ; $05FD67 |
  INY                                       ; $05FD69 |
  INY                                       ; $05FD6A |

CODE_05FD6B:
  LDA $FD09,y                               ; $05FD6B |
  STA !s_spr_x_speed_lo,x                   ; $05FD6E |
  LDA #$000E                                ; $05FD71 |
  STA !s_spr_state,x                        ; $05FD74 |
  LDA #$FC00                                ; $05FD77 |
  STA !s_spr_y_speed_lo,x                   ; $05FD7A |
  LDA #$0840                                ; $05FD7D |
  STA !s_spr_bitwise_settings_3,x           ; $05FD80 |
  LDA !s_spr_oam_yxppccct,x                 ; $05FD83 |
  ORA #$0080                                ; $05FD86 |
  STA !s_spr_oam_yxppccct,x                 ; $05FD89 |
  PLY                                       ; $05FD8C |
  RTS                                       ; $05FD8D |

  dw $0008, $0008, $0010, $0020             ; $05FD8E |
  dw $0020, $0010, $0008, $0000             ; $05FD96 |
  dw $0008, $0010, $0020, $0040             ; $05FD9E |
  dw $0040, $0020, $0010                    ; $05FDA6 |

  dw $0000, $0300, $021F, $0180             ; $05FDAC |
  dw $FE80, $FDE1, $FD00                    ; $05FDB4 |

CODE_05FDBA:
  LDY #$00                                  ; $05FDBA |
  LDA !s_spr_ground_angle,x                 ; $05FDBC |
  AND #$00FF                                ; $05FDBF |
  BNE CODE_05FDD8                           ; $05FDC2 |
  LDA $7860,x                               ; $05FDC4 |
  AND #$0001                                ; $05FDC7 |
  BEQ CODE_05FE1B                           ; $05FDCA |
  LDA !s_spr_x_speed_lo,x                   ; $05FDCC |
  BNE CODE_05FDD3                           ; $05FDCF |
  LDY #$0E                                  ; $05FDD1 |

CODE_05FDD3:
  LDA #$0000                                ; $05FDD3 |
  BRA CODE_05FDFB                           ; $05FDD6 |

CODE_05FDD8:
  CMP #$0080                                ; $05FDD8 |
  BMI CODE_05FDE8                           ; $05FDDB |
  ORA #$FF00                                ; $05FDDD |
  LDY #$04                                  ; $05FDE0 |
  CLC                                       ; $05FDE2 |
  ADC #$0020                                ; $05FDE3 |
  BRA CODE_05FDEE                           ; $05FDE6 |

CODE_05FDE8:
  LDY #$0A                                  ; $05FDE8 |
  SEC                                       ; $05FDEA |
  SBC #$0020                                ; $05FDEB |

CODE_05FDEE:
  BEQ CODE_05FDF8                           ; $05FDEE |
  BMI CODE_05FDF6                           ; $05FDF0 |
  DEY                                       ; $05FDF2 |
  DEY                                       ; $05FDF3 |
  BRA CODE_05FDF8                           ; $05FDF4 |

CODE_05FDF6:
  INY                                       ; $05FDF6 |
  INY                                       ; $05FDF7 |

CODE_05FDF8:
  LDA $FDAC,y                               ; $05FDF8 |

CODE_05FDFB:
  STA !s_spr_x_accel_ceiling,x              ; $05FDFB |
  ASL A                                     ; $05FDFE |
  STA $00                                   ; $05FDFF |
  EOR !s_spr_x_speed_lo,x                   ; $05FE01 |
  BMI CODE_05FE12                           ; $05FE04 |
  LDA !s_spr_x_speed_lo,x                   ; $05FE06 |
  SEC                                       ; $05FE09 |
  SBC !s_spr_x_accel_ceiling,x              ; $05FE0A |
  EOR !s_spr_x_speed_lo,x                   ; $05FE0D |
  BPL CODE_05FE18                           ; $05FE10 |

CODE_05FE12:
  TYA                                       ; $05FE12 |
  CLC                                       ; $05FE13 |
  ADC #$0010                                ; $05FE14 |
  TAY                                       ; $05FE17 |

CODE_05FE18:
  LDA $FD8E,y                               ; $05FE18 |

CODE_05FE1B:
  STA !s_spr_x_accel,x                      ; $05FE1B |
  RTS                                       ; $05FE1E |

init_hit_green_egg_block:
  JSL $03AD74                               ; $05FE1F |
  BCC CODE_05FE33                           ; $05FE23 |
  JSL $05FF7E                               ; $05FE25 |
  LDA !s_spr_oam_1,x                        ; $05FE29 |
  CLC                                       ; $05FE2C |
  ADC #$1801                                ; $05FE2D |
  STA !s_spr_oam_1,x                        ; $05FE30 |

CODE_05FE33:
  INC $0C02                                 ; $05FE33 |
  LDA !s_spr_x_pixel_pos,x                  ; $05FE36 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $05FE39 |
  LDA !s_spr_y_pixel_pos,x                  ; $05FE3B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $05FE3E |
  LDA !s_spr_x_pixel_pos,x                  ; $05FE40 |
  SEC                                       ; $05FE43 |
  SBC !s_player_x                           ; $05FE44 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $05FE47 |
  RTL                                       ; $05FE49 |

  dw $00F0, $00D8, $0100, $00C8             ; $05FE4A |
  dw $00E0, $00F8, $00D0, $00E8             ; $05FE52 |

  dw $FD30, $FD78, $FD00, $FDA8             ; $05FE5A |
  dw $FD60, $FD18, $FD90, $FD48             ; $05FE62 |
  dw $0300, $FD00                           ; $05FE6A |

main_hit_green_egg_block:
  LDA !s_spr_dyntile_index,x                ; $05FE6E |
  ORA !s_spr_oam_pointer,x                  ; $05FE71 |
  BMI CODE_05FE7A                           ; $05FE74 |
  JSL $03AA52                               ; $05FE76 |

CODE_05FE7A:
  JSL $03AF23                               ; $05FE7A |
  JSL $03D127                               ; $05FE7E |
  LDY !s_spr_collision_id,x                 ; $05FE82 |
  DEY                                       ; $05FE85 |
  BMI CODE_05FE9D                           ; $05FE86 |
  LDA !s_spr_state,y                        ; $05FE88 |
  CMP #$0010                                ; $05FE8B |
  BNE CODE_05FE9D                           ; $05FE8E |
  LDA !s_spr_bitwise_settings_3,y           ; $05FE90 |
  AND #$0800                                ; $05FE93 |
  BEQ CODE_05FE9D                           ; $05FE96 |
  TYX                                       ; $05FE98 |
  JSL $03B24B                               ; $05FE99 |

CODE_05FE9D:
  LDA !s_spr_gsu_morph_2_lo,x               ; $05FE9D |
  BPL CODE_05FEC2                           ; $05FEA0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $05FEA2 |
  STA $0091                                 ; $05FEA4 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05FEA7 |
  STA $0093                                 ; $05FEA9 |
  LDA #$0001                                ; $05FEAC |
  STA $008F                                 ; $05FEAF |
  LDA #$5F04                                ; $05FEB2 |
  STA $0095                                 ; $05FEB5 |
  JSL $109295                               ; $05FEB8 |
  LDX $12                                   ; $05FEBC |
  JML $03A31E                               ; $05FEBE |

CODE_05FEC2:
  LDY !s_spr_gsu_morph_1_lo,x               ; $05FEC2 |
  CLC                                       ; $05FEC5 |
  ADC $FE6A,y                               ; $05FEC6 |
  STA !s_spr_gsu_morph_2_lo,x               ; $05FEC9 |
  BPL CODE_05FED5                           ; $05FECC |
  LDA #$00FF                                ; $05FECE |
  STA !s_spr_draw_priority,x                ; $05FED1 |
  RTL                                       ; $05FED4 |

CODE_05FED5:
  CMP #$1800                                ; $05FED5 |
  BMI CODE_05FF2D                           ; $05FED8 |
  LDA #$0002                                ; $05FEDA |
  STA !s_spr_gsu_morph_1_lo,x               ; $05FEDD |
  LDX #$09                                  ; $05FEE0 |
  LDA #$91D5                                ; $05FEE2 |
  JSL r_gsu_init_1                          ; $05FEE5 | GSU init
  LDX $12                                   ; $05FEE9 |
  LDA !gsu_r6                               ; $05FEEB |
  CMP #$0006                                ; $05FEEE | Max Eggs spawned
  BCS CODE_05FF2D                           ; $05FEF1 |
  LDA #$0025                                ; $05FEF3 |
  JSL spawn_sprite_init                     ; $05FEF6 |
  BCC CODE_05FF2D                           ; $05FEFA |
  LDA !s_spr_x_pixel_pos,x                  ; $05FEFC |
  STA !s_spr_x_pixel_pos,y                  ; $05FEFF |
  LDA !s_spr_y_pixel_pos,x                  ; $05FF02 |
  STA !s_spr_y_pixel_pos,y                  ; $05FF05 |
  LDA $0C02                                 ; $05FF08 |
  AND #$0007                                ; $05FF0B |
  ASL A                                     ; $05FF0E |
  TAX                                       ; $05FF0F |
  LDA $FE5A,x                               ; $05FF10 |
  STA !s_spr_y_speed_lo,y                   ; $05FF13 |
  LDA $FE4A,x                               ; $05FF16 |
  LDX $12                                   ; $05FF19 |
  BIT !s_spr_wildcard_6_lo_dp,x             ; $05FF1B |
  BPL CODE_05FF23                           ; $05FF1D |
  EOR #$FFFF                                ; $05FF1F |
  INC A                                     ; $05FF22 |

CODE_05FF23:
  STA !s_spr_x_speed_lo,y                   ; $05FF23 |
  LDA #$0004                                ; $05FF26 |
  JSL push_sound_queue                      ; $05FF29 |

CODE_05FF2D:
  LDA !s_spr_gsu_morph_2_hi,x               ; $05FF2D |
  AND #$00FF                                ; $05FF30 |
  ASL A                                     ; $05FF33 |
  TAX                                       ; $05FF34 |
  LDA $00E9D4,x                             ; $05FF35 |
  TAY                                       ; $05FF39 |
  STY !reg_m7a                              ; $05FF3A |
  XBA                                       ; $05FF3D |
  TAY                                       ; $05FF3E |
  STY !reg_m7a                              ; $05FF3F |
  LDY #$20                                  ; $05FF42 |
  STY !reg_m7b                              ; $05FF44 |
  LDA $00E954,x                             ; $05FF47 |
  PHA                                       ; $05FF4B |
  LDX $12                                   ; $05FF4C |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $05FF4E |
  CLC                                       ; $05FF50 |
  ADC !reg_mpym                             ; $05FF51 |
  STA !s_spr_y_pixel_pos,x                  ; $05FF54 |
  PLY                                       ; $05FF57 |
  STY !reg_m7a                              ; $05FF58 |
  PLY                                       ; $05FF5B |
  STY !reg_m7a                              ; $05FF5C |
  LDY #$20                                  ; $05FF5F |
  STY !reg_m7b                              ; $05FF61 |
  LDA #$0020                                ; $05FF64 |
  SEC                                       ; $05FF67 |
  SBC !reg_mpym                             ; $05FF68 |
  BIT !s_spr_wildcard_6_lo_dp,x             ; $05FF6B |
  BPL CODE_05FF73                           ; $05FF6D |
  EOR #$FFFF                                ; $05FF6F |
  INC A                                     ; $05FF72 |

CODE_05FF73:
  CLC                                       ; $05FF73 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $05FF74 |
  STA !s_spr_x_pixel_pos,x                  ; $05FF76 |
  LDA !s_spr_dyntile_index,x                ; $05FF79 |
  BMI CODE_05FFC3                           ; $05FF7C |
  LDA !s_spr_gsu_morph_2_hi,x               ; $05FF7E |
  BIT !s_spr_wildcard_6_lo_dp,x             ; $05FF81 |
  BMI CODE_05FF89                           ; $05FF83 |
  EOR #$FFFF                                ; $05FF85 |
  INC A                                     ; $05FF88 |

CODE_05FF89:
  AND #$00FF                                ; $05FF89 |
  STA !gsu_r5                               ; $05FF8C |
  LDY !s_spr_dyntile_index,x                ; $05FF8F |
  TYX                                       ; $05FF92 |
  LDA $03A9CE,x                             ; $05FF93 |
  STA !gsu_r3                               ; $05FF97 |
  LDA $03A9EE,x                             ; $05FF9A |
  STA !gsu_r2                               ; $05FF9E |
  LDA #$0100                                ; $05FFA1 |
  STA !gsu_r6                               ; $05FFA4 |
  LDA #$7040                                ; $05FFA7 |
  STA !gsu_r12                              ; $05FFAA |
  LDA #$0054                                ; $05FFAD |
  STA !gsu_r13                              ; $05FFB0 |
  SEP #$10                                  ; $05FFB3 |
  LDX #$08                                  ; $05FFB5 |
  LDA #$835F                                ; $05FFB7 |
  JSL r_gsu_init_1                          ; $05FFBA | GSU init
  INC $0CF9                                 ; $05FFBE |
  LDX $12                                   ; $05FFC1 |

CODE_05FFC3:
  RTL                                       ; $05FFC3 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFC4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFCC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFD4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFDC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFE4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFEC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $05FFF4 |
  db $FF, $FF, $FF, $FF                     ; $05FFFC |
