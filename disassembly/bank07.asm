org $078000

init_bubble_plant:
  LDA #$0006                                ; $078000 |
  STA !s_spr_timer_2,x                      ; $078003 |
  LDA #$005A                                ; $078006 |
  STA !s_spr_timer_1,x                      ; $078009 |
  RTL                                       ; $07800C |

  db $00, $06, $07                          ; $07800D |

  db $04, $04, $04, $14, $02, $20, $02, $04 ; $078010 |

  db $00, $02, $01, $02, $05, $03, $05, $04 ; $078018 |

main_bubble_plant:
  JSL $03AF23                               ; $078020 |
  JSR CODE_078425                           ; $078024 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $078027 |
  BNE CODE_078055                           ; $078029 |
  LDA !s_spr_timer_1,x                      ; $07802B |
  BEQ CODE_078055                           ; $07802E |
  LDA !s_spr_timer_2,x                      ; $078030 |
  BEQ CODE_078036                           ; $078033 |
  RTL                                       ; $078035 |

CODE_078036:
  LDA #$0006                                ; $078036 |
  STA !s_spr_timer_2,x                      ; $078039 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07803C |
  INC A                                     ; $07803E |
  CMP #$0003                                ; $07803F |
  BCC CODE_078047                           ; $078042 |
  LDA #$0000                                ; $078044 |

CODE_078047:
  STA !s_spr_wildcard_4_lo_dp,x             ; $078047 |
  TAY                                       ; $078049 |
  LDA $800D,y                               ; $07804A |
  AND #$00FF                                ; $07804D |
  STA !s_spr_anim_frame,x                   ; $078050 |
  BRA CODE_0780C0                           ; $078053 |

CODE_078055:
  LDA !s_spr_timer_3,x                      ; $078055 |
  BNE CODE_0780AB                           ; $078058 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07805A |
  TAY                                       ; $07805C |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07805D |
  LDA $8010,y                               ; $07805F |
  AND #$00FF                                ; $078062 |
  STA !s_spr_timer_3,x                      ; $078065 |
  LDA $8018,y                               ; $078068 |
  AND #$00FF                                ; $07806B |
  STA !s_spr_anim_frame,x                   ; $07806E |
  CPY #$04                                  ; $078071 |
  BNE CODE_0780C0                           ; $078073 |
  LDA #$0019                                ; $078075 |
  JSL spawn_sprite_active                   ; $078078 |
  BCC CODE_0780C0                           ; $07807C |
  LDA !s_spr_x_pixel_pos,x                  ; $07807E |
  STA !s_spr_x_pixel_pos,y                  ; $078081 |
  LDA !s_spr_y_pixel_pos,x                  ; $078084 |
  SEC                                       ; $078087 |
  SBC #$0018                                ; $078088 |
  STA !s_spr_y_pixel_pos,y                  ; $07808B |
  LDA #$FF00                                ; $07808E |
  STA !s_spr_y_speed_lo,y                   ; $078091 |
  LDA #$0004                                ; $078094 |
  STA !s_spr_anim_frame,y                   ; $078097 |
  LDA #$000A                                ; $07809A |
  STA !s_spr_timer_2,y                      ; $07809D |
  LDA !s_spr_bitwise_settings_1,y           ; $0780A0 |
  AND #$F9FF                                ; $0780A3 |
  STA !s_spr_bitwise_settings_1,y           ; $0780A6 |
  BRA CODE_0780C0                           ; $0780A9 |

CODE_0780AB:
  LSR A                                     ; $0780AB |
  BNE CODE_0780C0                           ; $0780AC |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0780AE |
  CMP #$0008                                ; $0780B0 |
  BNE CODE_0780C0                           ; $0780B3 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0780B5 |
  STZ !s_spr_anim_frame,x                   ; $0780B7 |
  LDA #$005A                                ; $0780BA |
  STA !s_spr_timer_1,x                      ; $0780BD |

CODE_0780C0:
  RTL                                       ; $0780C0 |

  db $FF, $9F                               ; $0780C1 |

; also needlenose plant
init_egg_plant:
  JSL $02A007                               ; $0780C3 |
  SEP #$20                                  ; $0780C7 |
  LDA !s_spr_x_pixel_pos,x                  ; $0780C9 |
  AND #$10                                  ; $0780CC |
  LSR A                                     ; $0780CE |
  LSR A                                     ; $0780CF |
  LSR A                                     ; $0780D0 |
  STA !s_spr_wildcard_1_lo,x                ; $0780D1 |
  LSR A                                     ; $0780D4 |
  TAY                                       ; $0780D5 |
  LDA !s_spr_bitwise_settings_4,x           ; $0780D6 |
  AND $80C1,y                               ; $0780D9 |
  STA !s_spr_bitwise_settings_4,x           ; $0780DC |
  LDY #$03                                  ; $0780DF |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0780E1 |
  LDA $8119,y                               ; $0780E3 |
  STA !s_spr_anim_frame,x                   ; $0780E6 |
  LDA $811D,y                               ; $0780E9 |
  STA !s_spr_timer_1,x                      ; $0780EC |
  REP #$20                                  ; $0780EF |
  BRA CODE_07810C                           ; $0780F1 |

; also needlenose plant
main_egg_plant:
  JSL $03AF23                               ; $0780F3 |
  JSR CODE_078425                           ; $0780F7 |
  LDA !s_player_disable_flag                ; $0780FA |
  ORA !s_player_state                       ; $0780FD |
  BEQ CODE_078103                           ; $078100 |
  RTL                                       ; $078102 |

CODE_078103:
  JSR CODE_078411                           ; $078103 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $078106 |
  TYX                                       ; $078108 |
  JSR ($8113,x)                             ; $078109 |

CODE_07810C:
  LDA !s_player_jump_state                  ; $07810C |
  STA !s_spr_wildcard_2_lo,x                ; $07810F |
  RTL                                       ; $078112 |

  dw $813D, $838A, $83C9                    ; $078113 |

  dw $0102, $0002                           ; $078119 |
  dw $0204, $0402                           ; $07811D |

  dw $0000, $0080, $FF80, $0100             ; $078121 |
  dw $FF00, $0040, $FFC0, $00C0             ; $078129 |
  dw $0040, $FFC0, $0080, $FF80             ; $078131 |
  dw $0100, $FF00                           ; $078139 |

  LDX $12                                   ; $07813D |
  LDA !s_spr_timer_1,x                      ; $07813F |
  BNE CODE_07815B                           ; $078142 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $078144 |
  DEY                                       ; $078146 |
  BMI CODE_07815C                           ; $078147 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $078149 |
  SEP #$20                                  ; $07814B |
  LDA $8119,y                               ; $07814D |
  STA !s_spr_anim_frame,x                   ; $078150 |
  LDA $811D,y                               ; $078153 |
  STA !s_spr_timer_1,x                      ; $078156 |
  REP #$20                                  ; $078159 |

CODE_07815B:
  RTS                                       ; $07815B |

CODE_07815C:
  SEP #$20                                  ; $07815C |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07815E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $078160 |
  LDY #$03                                  ; $078162 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $078164 |
  LDA $8382,y                               ; $078166 |
  STA !s_spr_anim_frame,x                   ; $078169 |
  LDA $8386,y                               ; $07816C |
  STA !s_spr_timer_1,x                      ; $07816F |
  REP #$20                                  ; $078172 |
  LDY !s_spr_wildcard_1_lo,x                ; $078174 |
  TYX                                       ; $078177 |
  JMP ($817B,x)                             ; $078178 |

  dw $817F, $8297                           ; $07817B |

  LDX $12                                   ; $07817F |
  LDX #$09                                  ; $078181 |
  LDA #$91D5                                ; $078183 |
  JSL r_gsu_init_1                          ; $078186 | GSU init
  LDX $12                                   ; $07818A |
  LDA !gsu_r6                               ; $07818C |
  CMP #$0006                                ; $07818F |
  BCS CODE_0781FB                           ; $078192 |
  CMP #$0005                                ; $078194 |
  BEQ CODE_0781A0                           ; $078197 |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $078199 |
  BEQ CODE_0781A0                           ; $07819B |
  JMP CODE_078238                           ; $07819D |

CODE_0781A0:
  LDA $10                                   ; $0781A0 |
  AND #$0007                                ; $0781A2 |
  ASL A                                     ; $0781A5 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $0781A6 |
  BNE CODE_0781AF                           ; $0781A8 |
  INC A                                     ; $0781AA |
  INC A                                     ; $0781AB |
  AND #$000E                                ; $0781AC |

CODE_0781AF:
  STA !s_spr_wildcard_6_lo_dp,x             ; $0781AF |
  TAY                                       ; $0781B1 |
  LDA $8121,y                               ; $0781B2 |
  STA $00                                   ; $0781B5 |
  LDA #$0025                                ; $0781B7 |
  JSL spawn_sprite_active                   ; $0781BA |
  BCC CODE_0781FB                           ; $0781BE |
  LDA #$0002                                ; $0781C0 |
  STA !s_spr_draw_priority,y                ; $0781C3 |
  STA !s_spr_gsu_morph_1_lo,y               ; $0781C6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0781C9 |
  STA !s_spr_x_pixel_pos,y                  ; $0781CC |
  LDA !s_spr_y_pixel_pos,x                  ; $0781CF |
  SEC                                       ; $0781D2 |
  SBC #$0014                                ; $0781D3 |
  STA !s_spr_y_pixel_pos,y                  ; $0781D6 |
  LDA $00                                   ; $0781D9 |
  STA !s_spr_x_speed_lo,y                   ; $0781DB |
  LDA #$FA00                                ; $0781DE |
  STA !s_spr_y_speed_lo,y                   ; $0781E1 |
  LDA #$0040                                ; $0781E4 |
  STA !s_spr_y_accel,y                      ; $0781E7 |
  LDA !s_spr_bitwise_settings_3,y           ; $0781EA |
  AND #$FFE0                                ; $0781ED |
  STA !s_spr_bitwise_settings_3,y           ; $0781F0 |
  LDA #$0014                                ; $0781F3 |\ play sound #$0014
  JSL push_sound_queue                      ; $0781F6 |/
  RTS                                       ; $0781FA |

CODE_0781FB:
  LDA #$01DF                                ; $0781FB |
  JSL spawn_ambient_sprite                  ; $0781FE |
  LDA !s_spr_x_pixel_pos,x                  ; $078202 |
  STA $70A2,y                               ; $078205 |
  LDA !s_spr_y_pixel_pos,x                  ; $078208 |
  SEC                                       ; $07820B |
  SBC #$0014                                ; $07820C |
  STA $7142,y                               ; $07820F |
  LDA #$0005                                ; $078212 |
  STA $7E4C,y                               ; $078215 |
  LDA #$0005                                ; $078218 |
  STA $73C2,y                               ; $07821B |
  LDA #$0004                                ; $07821E |
  STA $7782,y                               ; $078221 |
  LDA #$0002                                ; $078224 |
  STA $7462,y                               ; $078227 |
  LDA #$FF00                                ; $07822A |
  STA $71E2,y                               ; $07822D |
  LDA #$0037                                ; $078230 |\ play sound #$0037
  JSL push_sound_queue                      ; $078233 |/
  RTS                                       ; $078237 |

CODE_078238:
  LDA #$0006                                ; $078238 |
  SEC                                       ; $07823B |
  SBC !gsu_r6                               ; $07823C |
  DEC A                                     ; $07823F |
  STA $00                                   ; $078240 |
  LDY #$00                                  ; $078242 |
  STY !s_spr_wildcard_3_hi_dp,x             ; $078244 |

CODE_078246:
  LDA $00                                   ; $078246 |
  ASL A                                     ; $078248 |
  TAY                                       ; $078249 |
  LDA $8131,y                               ; $07824A |
  STA $02                                   ; $07824D |
  LDA #$0025                                ; $07824F |
  JSL spawn_sprite_active                   ; $078252 |
  BCC CODE_07828F                           ; $078256 |
  LDA #$0002                                ; $078258 |
  STA !s_spr_draw_priority,y                ; $07825B |
  STA !s_spr_gsu_morph_1_lo,y               ; $07825E |
  LDA !s_spr_x_pixel_pos,x                  ; $078261 |
  STA !s_spr_x_pixel_pos,y                  ; $078264 |
  LDA !s_spr_y_pixel_pos,x                  ; $078267 |
  SEC                                       ; $07826A |
  SBC #$0014                                ; $07826B |
  STA !s_spr_y_pixel_pos,y                  ; $07826E |
  LDA $02                                   ; $078271 |
  STA !s_spr_x_speed_lo,y                   ; $078273 |
  LDA #$FA00                                ; $078276 |
  STA !s_spr_y_speed_lo,y                   ; $078279 |
  LDA #$0040                                ; $07827C |
  STA !s_spr_y_accel,y                      ; $07827F |
  LDA !s_spr_bitwise_settings_3,y           ; $078282 |
  AND #$FFE0                                ; $078285 |
  STA !s_spr_bitwise_settings_3,y           ; $078288 |
  DEC $00                                   ; $07828B |
  BPL CODE_078246                           ; $07828D |

CODE_07828F:
  LDA #$0014                                ; $07828F |\ play sound #$0014
  JSL push_sound_queue                      ; $078292 |/
  RTS                                       ; $078296 |

  LDX $12                                   ; $078297 |
  LDX #$09                                  ; $078299 |
  LDA #$91D5                                ; $07829B |
  JSL r_gsu_init_1                          ; $07829E | GSU init
  LDX $12                                   ; $0782A2 |
  LDA !gsu_r6                               ; $0782A4 |
  CMP #$0006                                ; $0782A7 |
  BCS CODE_0782DE                           ; $0782AA |
  STA $00                                   ; $0782AC |
  LDA #$0163                                ; $0782AE |
  STA !gsu_r4                               ; $0782B1 |
  LDA #$0164                                ; $0782B4 |
  STA !gsu_r5                               ; $0782B7 |
  LDX #$09                                  ; $0782BA |
  LDA #$91DB                                ; $0782BC |
  JSL r_gsu_init_1                          ; $0782BF | GSU init
  LDX $12                                   ; $0782C3 |
  LDA !gsu_r6                               ; $0782C5 |
  CLC                                       ; $0782C8 |
  ADC $00                                   ; $0782C9 |
  STA $00                                   ; $0782CB |
  CMP #$0006                                ; $0782CD |
  BCS CODE_0782DE                           ; $0782D0 |
  CMP #$0005                                ; $0782D2 |
  BEQ CODE_0782E1                           ; $0782D5 |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $0782D7 |
  BEQ CODE_0782E1                           ; $0782D9 |
  JMP CODE_078330                           ; $0782DB |

CODE_0782DE:
  JMP CODE_0781FB                           ; $0782DE |

CODE_0782E1:
  LDA $10                                   ; $0782E1 |
  AND #$0007                                ; $0782E3 |
  ASL A                                     ; $0782E6 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $0782E7 |
  BNE CODE_0782F0                           ; $0782E9 |
  INC A                                     ; $0782EB |
  INC A                                     ; $0782EC |
  AND #$000E                                ; $0782ED |

CODE_0782F0:
  STA !s_spr_wildcard_6_lo_dp,x             ; $0782F0 |
  TAY                                       ; $0782F2 |
  LDA $8121,y                               ; $0782F3 |
  STA $00                                   ; $0782F6 |
  LDA #$0163                                ; $0782F8 |
  JSL spawn_sprite_active                   ; $0782FB |
  BCC CODE_0782DE                           ; $0782FF |
  LDA #$0002                                ; $078301 |
  STA !s_spr_draw_priority,y                ; $078304 |
  LDA !s_spr_x_pixel_pos,x                  ; $078307 |
  STA !s_spr_x_pixel_pos,y                  ; $07830A |
  LDA !s_spr_y_pixel_pos,x                  ; $07830D |
  SEC                                       ; $078310 |
  SBC #$0014                                ; $078311 |
  STA !s_spr_y_pixel_pos,y                  ; $078314 |
  LDA $00                                   ; $078317 |
  STA !s_spr_x_speed_lo,y                   ; $078319 |
  LDA #$FA00                                ; $07831C |
  STA !s_spr_y_speed_lo,y                   ; $07831F |
  LDA #$0040                                ; $078322 |
  STA !s_spr_y_accel,y                      ; $078325 |
  LDA #$0014                                ; $078328 |\ play sound #$0014
  JSL push_sound_queue                      ; $07832B |/
  RTS                                       ; $07832F |

CODE_078330:
  LDA #$0006                                ; $078330 |
  SEC                                       ; $078333 |
  SBC $00                                   ; $078334 |
  DEC A                                     ; $078336 |
  STA $00                                   ; $078337 |
  LDY #$00                                  ; $078339 |
  STY !s_spr_wildcard_3_hi_dp,x             ; $07833B |

CODE_07833D:
  LDA $00                                   ; $07833D |
  ASL A                                     ; $07833F |
  TAY                                       ; $078340 |
  LDA $8131,y                               ; $078341 |
  STA $02                                   ; $078344 |
  LDA #$0163                                ; $078346 |
  JSL spawn_sprite_active                   ; $078349 |
  BCC CODE_07837A                           ; $07834D |
  LDA #$0002                                ; $07834F |
  STA !s_spr_draw_priority,y                ; $078352 |
  LDA !s_spr_x_pixel_pos,x                  ; $078355 |
  STA !s_spr_x_pixel_pos,y                  ; $078358 |
  LDA !s_spr_y_pixel_pos,x                  ; $07835B |
  SEC                                       ; $07835E |
  SBC #$0014                                ; $07835F |
  STA !s_spr_y_pixel_pos,y                  ; $078362 |
  LDA $02                                   ; $078365 |
  STA !s_spr_x_speed_lo,y                   ; $078367 |
  LDA #$FA00                                ; $07836A |
  STA !s_spr_y_speed_lo,y                   ; $07836D |
  LDA #$0040                                ; $078370 |
  STA !s_spr_y_accel,y                      ; $078373 |
  DEC $00                                   ; $078376 |
  BPL CODE_07833D                           ; $078378 |

CODE_07837A:
  LDA #$0014                                ; $07837A |\ play sound #$0014
  JSL push_sound_queue                      ; $07837D |/
  RTS                                       ; $078381 |

  db $09, $0A, $09, $08                     ; $078382 |

  db $02, $08, $02, $04                     ; $078386 |

  LDX $12                                   ; $07838A |
  LDA !s_spr_timer_1,x                      ; $07838C |
  BNE CODE_0783A8                           ; $07838F |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $078391 |
  DEY                                       ; $078393 |
  BMI CODE_0783A9                           ; $078394 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $078396 |
  SEP #$20                                  ; $078398 |
  LDA $8382,y                               ; $07839A |
  STA !s_spr_anim_frame,x                   ; $07839D |
  LDA $8386,y                               ; $0783A0 |
  STA !s_spr_timer_1,x                      ; $0783A3 |
  REP #$20                                  ; $0783A6 |

CODE_0783A8:
  RTS                                       ; $0783A8 |

CODE_0783A9:
  SEP #$20                                  ; $0783A9 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0783AB |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0783AD |
  LDY #$02                                  ; $0783AF |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0783B1 |
  LDA $83C6,y                               ; $0783B3 |
  STA !s_spr_anim_frame,x                   ; $0783B6 |
  LDA #$06                                  ; $0783B9 |
  STA !s_spr_timer_1,x                      ; $0783BB |
  LDA #$20                                  ; $0783BE |
  STA !s_spr_timer_2,x                      ; $0783C0 |
  REP #$20                                  ; $0783C3 |
  RTS                                       ; $0783C5 |

  db $07, $06, $00                          ; $0783C6 |

  LDX $12                                   ; $0783C9 |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $0783CB |
  BNE CODE_0783D4                           ; $0783CD |
  LDA !s_spr_timer_2,x                      ; $0783CF |
  BNE CODE_0783DC                           ; $0783D2 |

CODE_0783D4:
  LDA !s_spr_anim_frame,x                   ; $0783D4 |
  CMP #$0000                                ; $0783D7 |
  BEQ CODE_0783FA                           ; $0783DA |

CODE_0783DC:
  LDA !s_spr_timer_1,x                      ; $0783DC |
  BNE CODE_0783F9                           ; $0783DF |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0783E1 |
  DEY                                       ; $0783E3 |
  BPL CODE_0783E8                           ; $0783E4 |
  LDY #$02                                  ; $0783E6 |

CODE_0783E8:
  STY !s_spr_wildcard_4_lo_dp,x             ; $0783E8 |
  SEP #$20                                  ; $0783EA |
  LDA #$06                                  ; $0783EC |
  STA !s_spr_timer_1,x                      ; $0783EE |
  LDA $83C6,y                               ; $0783F1 |
  STA !s_spr_anim_frame,x                   ; $0783F4 |
  REP #$20                                  ; $0783F7 |

CODE_0783F9:
  RTS                                       ; $0783F9 |

CODE_0783FA:
  SEP #$20                                  ; $0783FA |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0783FC |
  LDY #$03                                  ; $0783FE |
  STY !s_spr_wildcard_4_lo_dp,x             ; $078400 |
  LDA $8119,y                               ; $078402 |
  STA !s_spr_anim_frame,x                   ; $078405 |
  LDA $811D,y                               ; $078408 |
  STA !s_spr_timer_1,x                      ; $07840B |
  REP #$20                                  ; $07840E |
  RTS                                       ; $078410 |

CODE_078411:
  LDA !s_player_ground_pound_state          ; $078411 |
  BEQ CODE_078424                           ; $078414 |
  LDA !s_player_jump_state                  ; $078416 |
  BNE CODE_078424                           ; $078419 |
  LDA !s_spr_wildcard_2_lo,x                ; $07841B |
  BEQ CODE_078424                           ; $07841E |
  LDY #$01                                  ; $078420 |
  STY !s_spr_wildcard_3_hi_dp,x             ; $078422 |

CODE_078424:
  RTS                                       ; $078424 |

CODE_078425:
  LDA #$0040                                ; $078425 |
  STA !s_spr_y_accel,x                      ; $078428 |
  LDA !s_spr_x_hitbox_center,x              ; $07842B |
  STA !gsu_r5                               ; $07842E |
  LDA !s_spr_y_hitbox_center,x              ; $078431 |
  STA !gsu_r6                               ; $078434 |
  LDA !s_spr_hitbox_width,x                 ; $078437 |
  STA !gsu_r7                               ; $07843A |
  LDA !s_spr_hitbox_height,x                ; $07843D |
  STA !gsu_r8                               ; $078440 |
  LDX #$09                                  ; $078443 |
  LDA #$933A                                ; $078445 |
  JSL r_gsu_init_1                          ; $078448 | GSU init
  LDX $12                                   ; $07844C |
  LDY !gsu_r1                               ; $07844E |
  BMI CODE_078485                           ; $078451 |
  LDA !gsu_r0                               ; $078453 |
  CMP #$0008                                ; $078456 |
  BPL CODE_078485                           ; $078459 |
  CPY $12                                   ; $07845B |
  BCC CODE_078486                           ; $07845D |

CODE_07845F:
  LDA !s_spr_y_speed_lo,y                   ; $07845F |
  CMP #$0100                                ; $078462 |
  BPL CODE_07846A                           ; $078465 |
  LDA #$0100                                ; $078467 |

CODE_07846A:
  STA !s_spr_y_speed_lo,x                   ; $07846A |
  LDA !s_spr_y_hitbox_center,y              ; $07846D |
  SEC                                       ; $078470 |
  SBC !s_spr_hitbox_height,y                ; $078471 |
  SEC                                       ; $078474 |
  SBC #$000E                                ; $078475 |
  STA !s_spr_y_pixel_pos,x                  ; $078478 |
  LDA !s_spr_x_pixel_pos,x                  ; $07847B |
  CLC                                       ; $07847E |
  ADC !s_spr_x_delta_lo,y                   ; $07847F |
  STA !s_spr_x_pixel_pos,x                  ; $078482 |

CODE_078485:
  RTS                                       ; $078485 |

CODE_078486:
  STY $00                                   ; $078486 |
  LDA !s_spr_id,x                           ; $078488 |
  JSL spawn_sprite_active_y                 ; $07848B |
  BCS CODE_078495                           ; $07848F |
  LDY $00                                   ; $078491 |
  BRA CODE_07845F                           ; $078493 |

CODE_078495:
  LDA !s_spr_x_pixel_pos,x                  ; $078495 |
  STA !s_spr_x_pixel_pos,y                  ; $078498 |
  LDA !s_spr_y_pixel_pos,x                  ; $07849B |
  STA !s_spr_y_pixel_pos,y                  ; $07849E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0784A1 |
  STA !s_spr_wildcard_3_lo,y                ; $0784A3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0784A6 |
  STA !s_spr_wildcard_4_lo,y                ; $0784A8 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0784AB |
  STA !s_spr_wildcard_5_lo,y                ; $0784AD |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0784B0 |
  STA !s_spr_wildcard_6_lo,y                ; $0784B2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0784B5 |
  STA !s_spr_gsu_morph_1_lo,y               ; $0784B8 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0784BB |
  STA !s_spr_gsu_morph_2_lo,y               ; $0784BE |
  LDA !s_spr_wildcard_1_lo,x                ; $0784C1 |
  STA !s_spr_wildcard_1_lo,y                ; $0784C4 |
  LDA !s_spr_wildcard_2_lo,x                ; $0784C7 |
  STA !s_spr_wildcard_2_lo,y                ; $0784CA |
  LDA !s_spr_timer_1,x                      ; $0784CD |
  STA !s_spr_timer_1,y                      ; $0784D0 |
  LDA !s_spr_timer_2,x                      ; $0784D3 |
  STA !s_spr_timer_2,y                      ; $0784D6 |
  LDA !s_spr_timer_3,x                      ; $0784D9 |
  STA !s_spr_timer_3,y                      ; $0784DC |
  LDA !s_spr_timer_4,x                      ; $0784DF |
  STA !s_spr_timer_4,y                      ; $0784E2 |
  LDA !s_spr_anim_frame,x                   ; $0784E5 |
  STA !s_spr_anim_frame,y                   ; $0784E8 |
  LDA $7860,x                               ; $0784EB |
  STA $7860,y                               ; $0784EE |
  LDA !s_spr_y_terrain_offset,x             ; $0784F1 |
  STA !s_spr_y_terrain_offset,y             ; $0784F4 |
  LDA !s_spr_cam_x_pos,x                    ; $0784F7 |
  STA !s_spr_cam_x_pos,y                    ; $0784FA |
  LDA !s_spr_cam_y_pos,x                    ; $0784FD |
  STA !s_spr_cam_y_pos,y                    ; $078500 |
  LDA !s_spr_bitwise_settings_3,x           ; $078503 |
  STA !s_spr_bitwise_settings_3,y           ; $078506 |
  SEP #$20                                  ; $078509 |
  LDA !s_spr_stage_id,x                     ; $07850B |
  STA !s_spr_stage_id,y                     ; $07850E |
  REP #$20                                  ; $078511 |
  PLA                                       ; $078513 |
  JML $03A32E                               ; $078514 |

  db $00, $01, $02, $03, $04, $05, $06, $07 ; $078518 |
  db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F ; $078520 |
  db $10, $11, $12, $13, $14, $15, $16, $17 ; $078528 |

  dw $FFA0, $0060                           ; $078530 |

  dw $0060, $FFA0                           ; $078534 |

  dw $0000, $0002, $0004, $0008             ; $078538 |

init_stilt_guy:
  LDA !s_spr_wildcard_2_lo,x                ; $078540 |
  BNE CODE_07856B                           ; $078543 |
  LDA !s_spr_x_pixel_pos,x                  ; $078545 |
  AND #$0010                                ; $078548 |
  LSR A                                     ; $07854B |
  STA $00                                   ; $07854C |
  LDA !s_spr_y_pixel_pos,x                  ; $07854E |
  AND #$0010                                ; $078551 |
  ORA $00                                   ; $078554 |
  LSR A                                     ; $078556 |
  LSR A                                     ; $078557 |
  TAY                                       ; $078558 |
  LDA $8538,y                               ; $078559 |
  INC A                                     ; $07855C |
  STA !s_spr_wildcard_2_lo,x                ; $07855D |
  LDA !s_spr_oam_yxppccct,x                 ; $078560 |
  ORA $8538,y                               ; $078563 |
  STA !s_spr_oam_yxppccct,x                 ; $078566 |
  BRA CODE_078575                           ; $078569 |

CODE_07856B:
  LDA !s_spr_wildcard_2_lo,x                ; $07856B |
  DEC A                                     ; $07856E |
  ORA !s_spr_oam_yxppccct,x                 ; $07856F |
  STA !s_spr_oam_yxppccct,x                 ; $078572 |

CODE_078575:
  LDA #$0003                                ; $078575 |
  STA !s_spr_timer_1,x                      ; $078578 |
  LDA #$0000                                ; $07857B |
  STA !s_spr_anim_frame,x                   ; $07857E |
  LDY !s_spr_facing_dir,x                   ; $078581 |
  LDA #$0001                                ; $078584 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078587 |
  LDA $7860,x                               ; $078589 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07858C |
  RTL                                       ; $07858E |

main_stilt_guy:
  LDA !s_spr_state,x                        ; $07858F |
  CMP #$0008                                ; $078592 |
  BNE CODE_0785A8                           ; $078595 |
  STZ $6162                                 ; $078597 |
  STZ !s_tongued_sprite_slot                ; $07859A |
  LDA #$0010                                ; $07859D |
  STA !s_spr_state,x                        ; $0785A0 |
  PLY                                       ; $0785A3 |
  PLA                                       ; $0785A4 |
  JSR CODE_07874D                           ; $0785A5 |

CODE_0785A8:
  JSL $03AF23                               ; $0785A8 |
  LDY !s_spr_collision_id,x                 ; $0785AC |
  BPL CODE_07860A                           ; $0785AF |
  LDA !s_player_ground_pound_state          ; $0785B1 |
  BEQ CODE_07860A                           ; $0785B4 |
  LDA !s_spr_y_player_delta,x               ; $0785B6 |
  SEC                                       ; $0785B9 |
  SBC !s_player_hitbox_half_height          ; $0785BA |
  SEC                                       ; $0785BD |
  SBC !s_spr_hitbox_height,x                ; $0785BE |
  CMP #$FFF8                                ; $0785C1 |
  BCC CODE_07860A                           ; $0785C4 |
  LDY !s_spr_facing_dir,x                   ; $0785C6 |
  LDA $8530,y                               ; $0785C9 |
  STA $00                                   ; $0785CC |
  LDA #$01F7                                ; $0785CE |
  JSL spawn_ambient_sprite                  ; $0785D1 |
  LDA !s_spr_x_pixel_pos,x                  ; $0785D5 |
  STA $70A2,y                               ; $0785D8 |
  LDA !s_spr_y_pixel_pos,x                  ; $0785DB |
  STA $7142,y                               ; $0785DE |
  LDA !s_spr_facing_dir,x                   ; $0785E1 |
  STA $73C0,y                               ; $0785E4 |
  LDA $00                                   ; $0785E7 |
  STA $71E0,y                               ; $0785E9 |
  LDA #$FC00                                ; $0785EC |
  STA $71E2,y                               ; $0785EF |
  LDA #$00C0                                ; $0785F2 |
  STA $7782,y                               ; $0785F5 |
  LDA !s_spr_wildcard_2_lo,x                ; $0785F8 |
  DEC A                                     ; $0785FB |
  ORA $7002,y                               ; $0785FC |
  STA $7002,y                               ; $0785FF |
  JSL $0CFF61                               ; $078602 |
  JML $03B273                               ; $078606 |

CODE_07860A:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07860A |
  TAX                                       ; $07860C |
  JMP ($8610,x)                             ; $07860D |

  dw $8644, $86C6                           ; $078610 |

  dw $0000, $FFFF, $0000, $FFFF             ; $078614 |
  dw $0000, $FFFF, $FFFE, $FFFF             ; $07861C |
  dw $FFFE, $FFFF, $FFFE, $FFFF             ; $078624 |
  dw $0000, $FFFF, $0000, $FFFF             ; $07862C |
  dw $0000, $0000, $FFFE, $FFFE             ; $078634 |
  dw $FFFE, $FFFF, $FFFE, $FFFF             ; $07863C |

  LDX $12                                   ; $078644 |
  JSR CODE_0786EE                           ; $078646 |
  LDA $7860,x                               ; $078649 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07864C |
  JSR CODE_078737                           ; $07864E |
  JSL $03A5B7                               ; $078651 |
  LDA !s_spr_timer_1,x                      ; $078655 |
  BNE CODE_0786C5                           ; $078658 |
  LDA #$0003                                ; $07865A |
  STA !s_spr_timer_1,x                      ; $07865D |
  LDA !s_spr_anim_frame,x                   ; $078660 |
  STA $00                                   ; $078663 |
  CLC                                       ; $078665 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $078666 |
  CMP #$0018                                ; $078668 |
  BCC CODE_078670                           ; $07866B |
  LDA #$0000                                ; $07866D |

CODE_078670:
  STA !s_spr_anim_frame,x                   ; $078670 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078673 |
  BPL CODE_078689                           ; $078675 |
  LDA $00                                   ; $078677 |
  ASL A                                     ; $078679 |
  TAY                                       ; $07867A |
  LDA $8614,y                               ; $07867B |
  LDY !s_spr_facing_dir,x                   ; $07867E |
  BNE CODE_0786A2                           ; $078681 |
  EOR #$FFFF                                ; $078683 |
  INC A                                     ; $078686 |
  BRA CODE_0786A2                           ; $078687 |

CODE_078689:
  CLC                                       ; $078689 |
  ADC $00                                   ; $07868A |
  CMP #$0018                                ; $07868C |
  BCC CODE_078694                           ; $07868F |
  LDA #$0000                                ; $078691 |

CODE_078694:
  ASL A                                     ; $078694 |
  TAY                                       ; $078695 |
  LDA $8614,y                               ; $078696 |
  LDY !s_spr_facing_dir,x                   ; $078699 |
  BEQ CODE_0786A2                           ; $07869C |
  EOR #$FFFF                                ; $07869E |
  INC A                                     ; $0786A1 |

CODE_0786A2:
  CLC                                       ; $0786A2 |
  ADC !s_spr_x_pixel_pos,x                  ; $0786A3 |
  STA !s_spr_x_pixel_pos,x                  ; $0786A6 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0786A9 |
  BPL CODE_0786C5                           ; $0786AB |
  LDA !s_spr_anim_frame,x                   ; $0786AD |
  BEQ CODE_0786B7                           ; $0786B0 |
  CMP #$000C                                ; $0786B2 |
  BNE CODE_0786C5                           ; $0786B5 |

CODE_0786B7:
  LDA #$0001                                ; $0786B7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0786BA |
  LDA !s_spr_facing_dir,x                   ; $0786BC |
  EOR #$0002                                ; $0786BF |
  STA !s_spr_facing_dir,x                   ; $0786C2 |

CODE_0786C5:
  RTL                                       ; $0786C5 |

  LDX $12                                   ; $0786C6 |
  LDA $7860,x                               ; $0786C8 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0786CB |
  JSL $03A5B7                               ; $0786CD |
  LDA $7860,x                               ; $0786D1 |
  BIT #$0001                                ; $0786D4 |
  BEQ CODE_0786E3                           ; $0786D7 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0786D9 |
  BMI CODE_0786E4                           ; $0786DB |
  LDA #$FE00                                ; $0786DD |
  STA !s_spr_y_speed_lo,x                   ; $0786E0 |

CODE_0786E3:
  RTL                                       ; $0786E3 |

CODE_0786E4:
  STZ !s_spr_x_speed_lo,x                   ; $0786E4 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0786E7 |
  RTL                                       ; $0786E9 |

  dw $0008, $0004                           ; $0786EA |

CODE_0786EE:
  LDA !s_spr_facing_dir,x                   ; $0786EE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0786F1 |
  BPL CODE_0786F8                           ; $0786F3 |
  EOR #$0002                                ; $0786F5 |

CODE_0786F8:
  TAY                                       ; $0786F8 |
  LDA $7860,x                               ; $0786F9 |
  AND $86EA,y                               ; $0786FC |
  BEQ CODE_07870A                           ; $0786FF |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078701 |
  EOR #$FFFF                                ; $078703 |
  INC A                                     ; $078706 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078707 |
  RTS                                       ; $078709 |

CODE_07870A:
  LDA $7860,x                               ; $07870A |
  BIT #$0001                                ; $07870D |
  BNE CODE_07872F                           ; $078710 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $078712 |
  BIT #$0001                                ; $078714 |
  BEQ CODE_078730                           ; $078717 |
  LDA $70276E,x                             ; $078719 |
  STA !s_spr_x_pixel_pos,x                  ; $07871D |
  LDA $702770,x                             ; $078720 |
  STA !s_spr_y_pixel_pos,x                  ; $078724 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078727 |
  EOR #$FFFF                                ; $078729 |
  INC A                                     ; $07872C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07872D |

CODE_07872F:
  RTS                                       ; $07872F |

CODE_078730:
  LDA $7860,x                               ; $078730 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $078733 |
  PLA                                       ; $078735 |
  RTL                                       ; $078736 |

CODE_078737:
  LDY !s_spr_collision_id,x                 ; $078737 |
  BPL CODE_078754                           ; $07873A |
  LDA !s_super_mario_timer                  ; $07873C |
  BNE CODE_078749                           ; $07873F |
  JSL $07FC2F                               ; $078741 |
  BEQ CODE_078753                           ; $078745 |
  BCS CODE_078753                           ; $078747 |

CODE_078749:
  JSL player_hit_sprite                     ; $078749 |

CODE_07874D:
  LDY !s_spr_x_player_dir,x                 ; $07874D |
  JMP CODE_07880B                           ; $078750 |

CODE_078753:
  RTS                                       ; $078753 |

CODE_078754:
  DEY                                       ; $078754 |
  BMI CODE_078753                           ; $078755 |
  BEQ CODE_078753                           ; $078757 |
  LDA !s_spr_state,y                        ; $078759 |
  CMP #$0010                                ; $07875C |
  BNE CODE_078753                           ; $07875F |
  LDA !s_spr_collision_state,y              ; $078761 |
  BEQ CODE_078753                           ; $078764 |
  LDA !s_spr_y_hitbox_center,x              ; $078766 |
  SEC                                       ; $078769 |
  SBC #$0008                                ; $07876A |
  CMP !s_spr_y_hitbox_center,y              ; $07876D |
  BPL CODE_07878C                           ; $078770 |
  PHY                                       ; $078772 |
  TYX                                       ; $078773 |
  JSL $03B24B                               ; $078774 |
  PLY                                       ; $078778 |
  LDX $12                                   ; $078779 |
  LDA !s_spr_x_hitbox_center,x              ; $07877B |
  SEC                                       ; $07877E |
  SBC !s_spr_x_hitbox_center,y              ; $07877F |
  AND #$8000                                ; $078782 |
  ASL A                                     ; $078785 |
  ROL A                                     ; $078786 |
  ASL A                                     ; $078787 |
  TAY                                       ; $078788 |
  JMP CODE_07880B                           ; $078789 |

CODE_07878C:
  LDA !s_spr_y_accel,y                      ; $07878C |
  CMP #$0040                                ; $07878F |
  BMI CODE_078798                           ; $078792 |
  PLA                                       ; $078794 |
  JMP CODE_078826                           ; $078795 |

CODE_078798:
  LDA !s_spr_x_speed_lo,y                   ; $078798 |
  CMP #$8000                                ; $07879B |
  ROR A                                     ; $07879E |
  CMP #$8000                                ; $07879F |
  ROR A                                     ; $0787A2 |
  STA $00                                   ; $0787A3 |
  TYX                                       ; $0787A5 |
  JSL $03B24B                               ; $0787A6 |
  LDX $12                                   ; $0787AA |
  LDA #$01F7                                ; $0787AC |
  JSL spawn_ambient_sprite                  ; $0787AF |
  LDA !s_spr_x_pixel_pos,x                  ; $0787B3 |
  STA $70A2,y                               ; $0787B6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0787B9 |
  STA $7142,y                               ; $0787BC |
  LDA !s_spr_facing_dir,x                   ; $0787BF |
  STA $73C0,y                               ; $0787C2 |
  LDA $00                                   ; $0787C5 |
  STA $71E0,y                               ; $0787C7 |
  LDA #$FC00                                ; $0787CA |
  STA $71E2,y                               ; $0787CD |
  LDA #$00C0                                ; $0787D0 |
  STA $7782,y                               ; $0787D3 |
  LDA !s_spr_wildcard_2_lo,x                ; $0787D6 |
  DEC A                                     ; $0787D9 |
  ORA $7002,y                               ; $0787DA |
  STA $7002,y                               ; $0787DD |
  LDA #$001E                                ; $0787E0 |
  STA !s_spr_id,x                           ; $0787E3 |
  LDA !s_spr_oam_1,x                        ; $0787E6 |
  AND #$07FF                                ; $0787E9 |
  ORA #$1800                                ; $0787EC |
  STA !s_spr_oam_1,x                        ; $0787EF |
  SEP #$20                                  ; $0787F2 |
  STZ !s_spr_obj_tile_index,x               ; $0787F4 |
  REP #$20                                  ; $0787F7 |
  STZ !s_spr_anim_frame,x                   ; $0787F9 |
  LDA !s_spr_y_pixel_pos,x                  ; $0787FC |
  SEC                                       ; $0787FF |
  SBC #$0020                                ; $078800 |
  STA !s_spr_y_pixel_pos,x                  ; $078803 |
  PLA                                       ; $078806 |
  JML $03B25B                               ; $078807 |

CODE_07880B:
  LDA $8534,y                               ; $07880B |
  STA !s_spr_x_speed_lo,x                   ; $07880E |
  LDA #$0015                                ; $078811 |
  STA !s_spr_anim_frame,x                   ; $078814 |
  LDA #$0003                                ; $078817 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07881A |
  LDY #$02                                  ; $07881C |
  STY !s_spr_wildcard_3_lo_dp,x             ; $07881E |
  PLA                                       ; $078820 |
  RTL                                       ; $078821 |

  dw $0080, $FF80                           ; $078822 |

CODE_078826:
  TYX                                       ; $078826 |
  JSL $03B24B                               ; $078827 |
  LDX $12                                   ; $07882B |

head_bop_stilt_guy:
  PHX                                       ; $07882D |
  LDA #$01F7                                ; $07882E |
  JSL spawn_ambient_sprite                  ; $078831 |
  LDA !s_spr_x_pixel_pos,x                  ; $078835 |
  STA $70A2,y                               ; $078838 |
  LDA !s_spr_y_pixel_pos,x                  ; $07883B |
  STA $7142,y                               ; $07883E |
  LDA !s_spr_wildcard_2_lo,x                ; $078841 |
  DEC A                                     ; $078844 |
  ORA $7002,y                               ; $078845 |
  STA $7002,y                               ; $078848 |
  LDA !s_spr_facing_dir,x                   ; $07884B |
  STA $73C0,y                               ; $07884E |
  TAX                                       ; $078851 |
  LDA $91BA,x                               ; $078852 |
  STA $71E0,y                               ; $078855 |
  LDA #$FC00                                ; $078858 |
  STA $71E2,y                               ; $07885B |
  LDA #$00C0                                ; $07885E |
  STA $7782,y                               ; $078861 |
  PLX                                       ; $078864 |
  PHY                                       ; $078865 |
  JSL $03A331                               ; $078866 |
  PLY                                       ; $07886A |
  LDA #$001E                                ; $07886B |
  TXY                                       ; $07886E |
  JSL $03A377                               ; $07886F |
  LDA !s_spr_y_pixel_pos,x                  ; $078873 |
  SEC                                       ; $078876 |
  SBC #$0018                                ; $078877 |
  STA !s_spr_y_pixel_pos,x                  ; $07887A |
  LDA !s_spr_state,x                        ; $07887D |
  CMP #$0010                                ; $078880 |
  BEQ CODE_07888A                           ; $078883 |
  CMP #$000E                                ; $078885 |
  BNE CODE_078890                           ; $078888 |

CODE_07888A:
  LDA #$0002                                ; $07888A |
  STA !s_spr_state,x                        ; $07888D |

CODE_078890:
  RTL                                       ; $078890 |

  dw $FF80, $0080                           ; $078891 |

  db $16, $17, $18, $17, $19, $17, $18, $17 ; $078895 |
  db $19, $17, $18, $17, $19, $17, $17, $1A ; $07889D |
  db $1B, $1A                               ; $0788A5 |

init_slugger:
  LDA !s_spr_wildcard_2_lo,x                ; $0788A7 |
  BNE CODE_0788B3                           ; $0788AA |
  LDA !s_spr_x_pixel_pos,x                  ; $0788AC |
  INC A                                     ; $0788AF |
  STA !s_spr_wildcard_2_lo,x                ; $0788B0 |

CODE_0788B3:
  LDA $8932                                 ; $0788B3 |
  AND #$00FF                                ; $0788B6 |
  STA !s_spr_anim_frame,x                   ; $0788B9 |
  LDA #$0004                                ; $0788BC |
  STA !s_spr_timer_1,x                      ; $0788BF |
  LDY !s_spr_facing_dir,x                   ; $0788C2 |
  LDA $8891,y                               ; $0788C5 |
  STA !s_spr_x_speed_lo,x                   ; $0788C8 |
  STZ !s_spr_wildcard_1_lo,x                ; $0788CB |
  RTL                                       ; $0788CE |

  dw $FF00, $0100                           ; $0788CF |

  LDA !s_spr_oam_yxppccct,x                 ; $0788D3 |
  AND #$FFF1                                ; $0788D6 |
  LDY !s_spr_collision_state,x              ; $0788D9 |
  BEQ CODE_0788E1                           ; $0788DC |
  ORA #$0004                                ; $0788DE |

CODE_0788E1:
  STA !s_spr_oam_yxppccct,x                 ; $0788E1 |
  JSL $03AF23                               ; $0788E4 |
  LDA !s_spr_wildcard_1_lo,x                ; $0788E8 |
  BEQ CODE_0788F0                           ; $0788EB |
  JMP CODE_078EC3                           ; $0788ED |

CODE_0788F0:
  LDA !s_super_mario_timer                  ; $0788F0 |
  BNE CODE_0788FB                           ; $0788F3 |
  JSL $07FC2A                               ; $0788F5 |
  BCS CODE_07890A                           ; $0788F9 |

CODE_0788FB:
  JSL $03A5B7                               ; $0788FB |
  JSR CODE_078DE5                           ; $0788FF |
  TXY                                       ; $078902 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $078903 |
  ASL A                                     ; $078905 |
  TAX                                       ; $078906 |
  JMP ($8928,x)                             ; $078907 |

CODE_07890A:
  LDY !s_spr_x_player_dir,x                 ; $07890A |
  LDA $88CF,y                               ; $07890D |
  STA !s_player_x_speed_prev                ; $078910 |
  STA !s_player_x_speed                     ; $078913 |
  LDA !s_spr_bitwise_settings_3,x           ; $078916 |
  AND #$FCFF                                ; $078919 |
  STA !s_spr_bitwise_settings_3,x           ; $07891C |
  LDA #$8895                                ; $07891F |
  STA $00                                   ; $078922 |
  JSR CODE_07A580                           ; $078924 |
  RTL                                       ; $078927 |

  dw $8937, $8A26, $8AEA, $8BB5, $8CD4      ; $078928 |

  db $00, $01, $02, $03, $04                ; $078932 |

  TYX                                       ; $078937 |
  LDA !s_spr_facing_dir,x                   ; $078938 |
  TAY                                       ; $07893B |
  LDA $8891,y                               ; $07893C |
  STA !s_spr_x_speed_lo,x                   ; $07893F |
  JSR CODE_078EF1                           ; $078942 |
  BCC CODE_078962                           ; $078945 |
  JSR CODE_078F2C                           ; $078947 |
  BCC CODE_078962                           ; $07894A |
  JSR CODE_078F27                           ; $07894C |
  BCC CODE_078962                           ; $07894F |
  LDA #$0030                                ; $078951 |
  STA $04                                   ; $078954 |
  STA $08                                   ; $078956 |
  ASL A                                     ; $078958 |
  STA $06                                   ; $078959 |
  STA $0A                                   ; $07895B |
  JSR CODE_078CF1                           ; $07895D |
  BMI CODE_07898D                           ; $078960 |

CODE_078962:
  LDA #$0003                                ; $078962 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078965 |
  STZ !s_spr_x_speed_lo,x                   ; $078967 |
  LDA $02                                   ; $07896A |
  STA !s_spr_facing_dir,x                   ; $07896C |
  LDA #$0000                                ; $07896F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078972 |
  TAY                                       ; $078974 |
  LDA $8CB2,y                               ; $078975 |
  AND #$00FF                                ; $078978 |
  STA !s_spr_anim_frame,x                   ; $07897B |
  LDA $8CC3,y                               ; $07897E |
  AND #$00FF                                ; $078981 |
  STA !s_spr_timer_1,x                      ; $078984 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $078987 |
  JSR CODE_07A218                           ; $078989 |
  RTL                                       ; $07898C |

CODE_07898D:
  LDA #$0020                                ; $07898D |
  STA $04                                   ; $078990 |
  STA $08                                   ; $078992 |
  ASL A                                     ; $078994 |
  STA $06                                   ; $078995 |
  STA $0A                                   ; $078997 |
  JSR CODE_078D33                           ; $078999 |
  BMI CODE_0789C9                           ; $07899C |
  LDA #$0002                                ; $07899E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0789A1 |
  STZ !s_spr_x_speed_lo,x                   ; $0789A3 |
  LDA $02                                   ; $0789A6 |
  STA !s_spr_facing_dir,x                   ; $0789A8 |
  LDA #$0000                                ; $0789AB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0789AE |
  TAY                                       ; $0789B0 |
  LDA $8ADE,y                               ; $0789B1 |
  AND #$00FF                                ; $0789B4 |
  STA !s_spr_anim_frame,x                   ; $0789B7 |
  LDA $8AE2,y                               ; $0789BA |
  AND #$00FF                                ; $0789BD |
  STA !s_spr_timer_1,x                      ; $0789C0 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0789C3 |
  JSR CODE_07A218                           ; $0789C5 |
  RTL                                       ; $0789C8 |

CODE_0789C9:
  LDA !s_spr_x_speed_lo,x                   ; $0789C9 |
  BPL CODE_0789DD                           ; $0789CC |
  LDA !s_spr_wildcard_2_lo,x                ; $0789CE |
  DEC A                                     ; $0789D1 |
  SEC                                       ; $0789D2 |
  SBC #$0018                                ; $0789D3 |
  CMP !s_spr_x_pixel_pos,x                  ; $0789D6 |
  BPL CODE_0789EA                           ; $0789D9 |
  BRA CODE_0789FA                           ; $0789DB |

CODE_0789DD:
  LDA !s_spr_wildcard_2_lo,x                ; $0789DD |
  DEC A                                     ; $0789E0 |
  CLC                                       ; $0789E1 |
  ADC #$0018                                ; $0789E2 |
  CMP !s_spr_x_pixel_pos,x                  ; $0789E5 |
  BPL CODE_0789FA                           ; $0789E8 |

CODE_0789EA:
  LDA !s_spr_facing_dir,x                   ; $0789EA |
  EOR #$0002                                ; $0789ED |
  STA !s_spr_facing_dir,x                   ; $0789F0 |
  TAY                                       ; $0789F3 |
  LDA $8891,y                               ; $0789F4 |
  STA !s_spr_x_speed_lo,x                   ; $0789F7 |

CODE_0789FA:
  LDA !s_spr_timer_1,x                      ; $0789FA |
  BNE CODE_078A1D                           ; $0789FD |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0789FF |
  INC A                                     ; $078A01 |
  CMP #$0005                                ; $078A02 |
  BCC CODE_078A0A                           ; $078A05 |
  LDA #$0000                                ; $078A07 |

CODE_078A0A:
  STA !s_spr_wildcard_4_lo,x                ; $078A0A |
  TAY                                       ; $078A0D |
  LDA $8932,y                               ; $078A0E |
  AND #$00FF                                ; $078A11 |
  STA !s_spr_anim_frame,x                   ; $078A14 |
  LDA #$0004                                ; $078A17 |
  STA !s_spr_timer_1,x                      ; $078A1A |

CODE_078A1D:
  RTL                                       ; $078A1D |

  db $08, $07, $06, $05, $20, $04, $04, $10 ; $078A1E |

  TYX                                       ; $078A26 |
  JSR CODE_078EF1                           ; $078A27 |
  BCC CODE_078A47                           ; $078A2A |
  JSR CODE_078F2C                           ; $078A2C |
  BCC CODE_078A47                           ; $078A2F |
  JSR CODE_078F27                           ; $078A31 |
  BCC CODE_078A47                           ; $078A34 |
  LDA #$0030                                ; $078A36 |
  STA $04                                   ; $078A39 |
  STA $08                                   ; $078A3B |
  ASL A                                     ; $078A3D |
  STA $06                                   ; $078A3E |
  STA $0A                                   ; $078A40 |
  JSR CODE_078CF1                           ; $078A42 |
  BMI CODE_078A72                           ; $078A45 |

CODE_078A47:
  LDA #$0003                                ; $078A47 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078A4A |
  STZ !s_spr_x_speed_lo,x                   ; $078A4C |
  LDA $02                                   ; $078A4F |
  STA !s_spr_facing_dir,x                   ; $078A51 |
  LDA #$0000                                ; $078A54 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078A57 |
  TAY                                       ; $078A59 |
  LDA $8CB2,y                               ; $078A5A |
  AND #$00FF                                ; $078A5D |
  STA !s_spr_anim_frame,x                   ; $078A60 |
  LDA $8CC3,y                               ; $078A63 |
  AND #$00FF                                ; $078A66 |
  STA !s_spr_timer_1,x                      ; $078A69 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $078A6C |
  JSR CODE_07A218                           ; $078A6E |
  RTL                                       ; $078A71 |

CODE_078A72:
  LDA #$0020                                ; $078A72 |
  STA $04                                   ; $078A75 |
  STA $08                                   ; $078A77 |
  ASL A                                     ; $078A79 |
  STA $06                                   ; $078A7A |
  STA $0A                                   ; $078A7C |
  JSR CODE_078D33                           ; $078A7E |
  BMI CODE_078AAE                           ; $078A81 |
  LDA #$0002                                ; $078A83 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078A86 |
  STZ !s_spr_x_speed_lo,x                   ; $078A88 |
  LDA $02                                   ; $078A8B |
  STA !s_spr_facing_dir,x                   ; $078A8D |
  LDA #$0000                                ; $078A90 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078A93 |
  TAY                                       ; $078A95 |
  LDA $8ADE,y                               ; $078A96 |
  AND #$00FF                                ; $078A99 |
  STA !s_spr_anim_frame,x                   ; $078A9C |
  LDA $8AE2,y                               ; $078A9F |
  AND #$00FF                                ; $078AA2 |
  STA !s_spr_timer_1,x                      ; $078AA5 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $078AA8 |
  JSR CODE_07A218                           ; $078AAA |
  RTL                                       ; $078AAD |

CODE_078AAE:
  LDA !s_spr_timer_1,x                      ; $078AAE |
  BNE CODE_078ADD                           ; $078AB1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078AB3 |
  INC A                                     ; $078AB5 |
  CMP #$0004                                ; $078AB6 |
  BCC CODE_078AC7                           ; $078AB9 |
  LDA #$0000                                ; $078ABB |
  STA !s_spr_timer_1,x                      ; $078ABE |
  LDA #$0004                                ; $078AC1 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078AC4 |
  RTL                                       ; $078AC6 |

CODE_078AC7:
  STA !s_spr_wildcard_4_lo,x                ; $078AC7 |
  TAY                                       ; $078ACA |
  LDA $8A1E,y                               ; $078ACB |
  AND #$00FF                                ; $078ACE |
  STA !s_spr_anim_frame,x                   ; $078AD1 |
  LDA $8A22,y                               ; $078AD4 |
  AND #$00FF                                ; $078AD7 |
  STA !s_spr_timer_1,x                      ; $078ADA |

CODE_078ADD:
  RTL                                       ; $078ADD |

  db $05, $06, $07, $08, $04, $02, $02, $02 ; $078ADE |

  dw $FFE8, $0018                           ; $078AE6 |

  TYX                                       ; $078AEA |
  JSR CODE_078EF1                           ; $078AEB |
  BCC CODE_078B1C                           ; $078AEE |
  JSR CODE_078F2C                           ; $078AF0 |
  BCC CODE_078B1C                           ; $078AF3 |
  JSR CODE_078F27                           ; $078AF5 |
  BCC CODE_078B1C                           ; $078AF8 |
  LDA #$0018                                ; $078AFA |
  STA $04                                   ; $078AFD |
  STA $08                                   ; $078AFF |
  ASL A                                     ; $078B01 |
  STA $06                                   ; $078B02 |
  STA $0A                                   ; $078B04 |
  JSR CODE_078D33                           ; $078B06 |
  BPL CODE_078B1C                           ; $078B09 |
  LDA #$0030                                ; $078B0B |
  STA $04                                   ; $078B0E |
  STA $08                                   ; $078B10 |
  ASL A                                     ; $078B12 |
  STA $06                                   ; $078B13 |
  STA $0A                                   ; $078B15 |
  JSR CODE_078CF1                           ; $078B17 |
  BMI CODE_078B47                           ; $078B1A |

CODE_078B1C:
  LDA #$0003                                ; $078B1C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078B1F |
  STZ !s_spr_x_speed_lo,x                   ; $078B21 |
  LDA $02                                   ; $078B24 |
  STA !s_spr_facing_dir,x                   ; $078B26 |
  LDA #$0000                                ; $078B29 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078B2C |
  TAY                                       ; $078B2E |
  LDA $8CB2,y                               ; $078B2F |
  AND #$00FF                                ; $078B32 |
  STA !s_spr_anim_frame,x                   ; $078B35 |
  LDA $8CC3,y                               ; $078B38 |
  AND #$00FF                                ; $078B3B |
  STA !s_spr_timer_1,x                      ; $078B3E |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $078B41 |
  JSR CODE_07A218                           ; $078B43 |
  RTL                                       ; $078B46 |

CODE_078B47:
  LDA #$0020                                ; $078B47 |
  STA $04                                   ; $078B4A |
  STA $08                                   ; $078B4C |
  ASL A                                     ; $078B4E |
  STA $06                                   ; $078B4F |
  STA $0A                                   ; $078B51 |
  JSR CODE_078D33                           ; $078B53 |
  BPL CODE_078B8E                           ; $078B56 |
  LDA #$0001                                ; $078B58 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078B5B |
  LDA $02                                   ; $078B5D |
  STA !s_spr_facing_dir,x                   ; $078B5F |
  LDA #$0000                                ; $078B62 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078B65 |
  TAY                                       ; $078B67 |
  LDA $8A1E,y                               ; $078B68 |
  AND #$00FF                                ; $078B6B |
  STA !s_spr_anim_frame,x                   ; $078B6E |
  LDA $8A22,y                               ; $078B71 |
  AND #$00FF                                ; $078B74 |
  STA !s_spr_timer_1,x                      ; $078B77 |
  RTL                                       ; $078B7A |

  CMP !s_spr_facing_dir,x                   ; $078B7B |
  BEQ CODE_078B8E                           ; $078B7E |
  STA !s_spr_facing_dir,x                   ; $078B80 |
  TAY                                       ; $078B83 |
  LDA !s_spr_x_pixel_pos,x                  ; $078B84 |
  CLC                                       ; $078B87 |
  ADC $8AE6,y                               ; $078B88 |
  STA !s_spr_x_pixel_pos,x                  ; $078B8B |

CODE_078B8E:
  LDA !s_spr_timer_1,x                      ; $078B8E |
  BNE CODE_078BB4                           ; $078B91 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078B93 |
  INC A                                     ; $078B95 |
  CMP #$0004                                ; $078B96 |
  BCC CODE_078B9E                           ; $078B99 |
  LDA #$0003                                ; $078B9B |

CODE_078B9E:
  STA !s_spr_wildcard_4_lo,x                ; $078B9E |
  TAY                                       ; $078BA1 |
  LDA $8ADE,y                               ; $078BA2 |
  AND #$00FF                                ; $078BA5 |
  STA !s_spr_anim_frame,x                   ; $078BA8 |
  LDA $8AE2,y                               ; $078BAB |
  AND #$00FF                                ; $078BAE |
  STA !s_spr_timer_1,x                      ; $078BB1 |

CODE_078BB4:
  RTL                                       ; $078BB4 |

  LDX $12                                   ; $078BB5 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $078BB7 |
  CPY #$08                                  ; $078BB9 |
  BCC CODE_078BC2                           ; $078BBB |
  JSR CODE_078F2C                           ; $078BBD |
  BCC CODE_078BEB                           ; $078BC0 |

CODE_078BC2:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078BC2 |
  SEC                                       ; $078BC4 |
  SBC #$0001                                ; $078BC5 |
  CMP #$0007                                ; $078BC8 |
  BCC CODE_078C0B                           ; $078BCB |
  CMP #$0010                                ; $078BCD |
  BCS CODE_078BE8                           ; $078BD0 |
  LDA #$0030                                ; $078BD2 |
  STA $04                                   ; $078BD5 |
  STA $08                                   ; $078BD7 |
  ASL A                                     ; $078BD9 |
  STA $06                                   ; $078BDA |
  STA $0A                                   ; $078BDC |
  JSR CODE_078CF1                           ; $078BDE |
  BMI CODE_078BE8                           ; $078BE1 |
  TYA                                       ; $078BE3 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $078BE4 |
  BNE CODE_078BEB                           ; $078BE6 |

CODE_078BE8:
  JMP CODE_078C84                           ; $078BE8 |

CODE_078BEB:
  LDA $02                                   ; $078BEB |
  STA !s_spr_facing_dir,x                   ; $078BED |
  LDA #$0000                                ; $078BF0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $078BF3 |
  TAY                                       ; $078BF5 |
  LDA $8CB2,y                               ; $078BF6 |
  AND #$00FF                                ; $078BF9 |
  STA !s_spr_anim_frame,x                   ; $078BFC |
  LDA $8CC3,y                               ; $078BFF |
  AND #$00FF                                ; $078C02 |
  STA !s_spr_timer_1,x                      ; $078C05 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $078C08 |
  RTL                                       ; $078C0A |

CODE_078C0B:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $078C0B |
  BNE CODE_078C84                           ; $078C0D |
  JSR CODE_078E3E                           ; $078C0F |
  JSR CODE_078F76                           ; $078C12 |
  JSR CODE_078FA0                           ; $078C15 |
  LDA #$0008                                ; $078C18 |
  STA $04                                   ; $078C1B |
  ASL A                                     ; $078C1D |
  STA $06                                   ; $078C1E |
  LDA #$0010                                ; $078C20 |
  STA $08                                   ; $078C23 |
  ASL A                                     ; $078C25 |
  STA $0A                                   ; $078C26 |
  JSR CODE_078CF1                           ; $078C28 |
  BMI CODE_078C84                           ; $078C2B |
  LDA !s_spr_id,y                           ; $078C2D |
  CMP #$0022                                ; $078C30 |
  BCC CODE_078C47                           ; $078C33 |
  CMP #$002C                                ; $078C35 |
  BCS CODE_078C47                           ; $078C38 |
  LDA #$0001                                ; $078C3A |
  STA !s_spr_gsu_morph_1_lo,y               ; $078C3D |
  SEP #$20                                  ; $078C40 |
  STA $77C0,y                               ; $078C42 |
  REP #$20                                  ; $078C45 |

CODE_078C47:
  LDA !s_spr_x_pixel_pos,y                  ; $078C47 |
  SEC                                       ; $078C4A |
  SBC !s_spr_x_delta_lo,y                   ; $078C4B |
  STA !s_spr_x_pixel_pos,y                  ; $078C4E |
  LDA !s_spr_x_speed_lo,y                   ; $078C51 |
  EOR #$FFFF                                ; $078C54 |
  INC A                                     ; $078C57 |
  STA !s_spr_x_speed_lo,y                   ; $078C58 |
  LDA !s_spr_y_pixel_pos,y                  ; $078C5B |
  SEC                                       ; $078C5E |
  SBC !s_spr_y_delta_lo,y                   ; $078C5F |
  STA !s_spr_y_pixel_pos,y                  ; $078C62 |
  LDA #$FC00                                ; $078C65 |
  STA !s_spr_y_speed_lo,y                   ; $078C68 |
  TYA                                       ; $078C6B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $078C6C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $078C6E |
  LDA !s_spr_x_hitbox_center,y              ; $078C70 |
  STA $00                                   ; $078C73 |
  LDA !s_spr_y_hitbox_center,y              ; $078C75 |
  STA $02                                   ; $078C78 |
  JSR CODE_07FD16                           ; $078C7A |
  LDA #$0067                                ; $078C7D |\ play sound #$0067
  JSL push_sound_queue                      ; $078C80 |/

CODE_078C84:
  LDA !s_spr_timer_1,x                      ; $078C84 |
  BNE CODE_078CB1                           ; $078C87 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $078C89 |
  INC A                                     ; $078C8B |
  CMP #$0011                                ; $078C8C |
  BCC CODE_078C9B                           ; $078C8F |
  LDA #$0000                                ; $078C91 |
  STA !s_spr_timer_1,x                      ; $078C94 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $078C97 |
  BRA CODE_078CB1                           ; $078C99 |

CODE_078C9B:
  STA !s_spr_wildcard_4_lo,x                ; $078C9B |
  TAY                                       ; $078C9E |
  LDA $8CB2,y                               ; $078C9F |
  AND #$00FF                                ; $078CA2 |
  STA !s_spr_anim_frame,x                   ; $078CA5 |
  LDA $8CC3,y                               ; $078CA8 |
  AND #$00FF                                ; $078CAB |
  STA !s_spr_timer_1,x                      ; $078CAE |

CODE_078CB1:
  RTL                                       ; $078CB1 |

  db $08, $06, $09, $0A, $0B, $0C, $0D, $0E ; $078CB2 |
  db $0F, $10, $11, $12, $13, $14, $15, $09 ; $078CBA |
  db $05                                    ; $078CC2 |

  db $01, $01, $01, $01, $01, $01, $01, $01 ; $078CC3 |
  db $20, $01, $01, $01, $02, $02, $03, $03 ; $078CCB |
  db $10                                    ; $078CD3 |

  TYX                                       ; $078CD4 |
  LDA !s_spr_timer_1,x                      ; $078CD5 |
  BNE CODE_078CF0                           ; $078CD8 |
  LDA #$0000                                ; $078CDA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $078CDD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $078CDF |
  LDA $8932                                 ; $078CE1 |
  AND #$00FF                                ; $078CE4 |
  STA !s_spr_anim_frame,x                   ; $078CE7 |
  LDA #$0004                                ; $078CEA |
  STA !s_spr_timer_1,x                      ; $078CED |

CODE_078CF0:
  RTL                                       ; $078CF0 |

CODE_078CF1:
  TXA                                       ; $078CF1 |
  STA !gsu_r1                               ; $078CF2 |
  PHX                                       ; $078CF5 |
  LDX #$09                                  ; $078CF6 |
  LDA #$8F33                                ; $078CF8 |
  JSL r_gsu_init_1                          ; $078CFB | GSU init
  PLX                                       ; $078CFF |
  LDY !gsu_r1                               ; $078D00 |
  BMI CODE_078D32                           ; $078D03 |
  LDA !s_spr_x_hitbox_center,x              ; $078D05 |
  SEC                                       ; $078D08 |
  SBC !s_spr_x_hitbox_center,y              ; $078D09 |
  PHA                                       ; $078D0C |
  AND #$8000                                ; $078D0D |
  ASL A                                     ; $078D10 |
  ROL A                                     ; $078D11 |
  ASL A                                     ; $078D12 |
  STA $02                                   ; $078D13 |
  PLA                                       ; $078D15 |
  CLC                                       ; $078D16 |
  ADC $04                                   ; $078D17 |
  CMP $06                                   ; $078D19 |
  BCS CODE_078D2F                           ; $078D1B |
  LDA !s_spr_y_hitbox_center,x              ; $078D1D |
  SEC                                       ; $078D20 |
  SBC !s_spr_y_hitbox_center,y              ; $078D21 |
  CLC                                       ; $078D24 |
  ADC $08                                   ; $078D25 |
  CMP $0A                                   ; $078D27 |
  BCS CODE_078D2F                           ; $078D29 |
  CPY #$00                                  ; $078D2B |
  BRA CODE_078D32                           ; $078D2D |

CODE_078D2F:
  LDA #$FFFF                                ; $078D2F |

CODE_078D32:
  RTS                                       ; $078D32 |

CODE_078D33:
  LDA !s_spr_x_pixel_pos,x                  ; $078D33 |
  SEC                                       ; $078D36 |
  SBC !s_player_x                           ; $078D37 |
  PHA                                       ; $078D3A |
  AND #$8000                                ; $078D3B |
  ASL A                                     ; $078D3E |
  ROL A                                     ; $078D3F |
  ASL A                                     ; $078D40 |
  STA $02                                   ; $078D41 |
  PLA                                       ; $078D43 |
  CLC                                       ; $078D44 |
  ADC $04                                   ; $078D45 |
  CMP $06                                   ; $078D47 |
  BCS CODE_078D5D                           ; $078D49 |
  LDA !s_spr_y_pixel_pos,x                  ; $078D4B |
  SEC                                       ; $078D4E |
  SBC !s_player_y                           ; $078D4F |
  CLC                                       ; $078D52 |
  ADC $08                                   ; $078D53 |
  CMP $0A                                   ; $078D55 |
  BCS CODE_078D5D                           ; $078D57 |
  LDA $02                                   ; $078D59 |
  BRA CODE_078D60                           ; $078D5B |

CODE_078D5D:
  LDA #$FFFF                                ; $078D5D |

CODE_078D60:
  RTS                                       ; $078D60 |

  dw $000A, $FFF6, $000A, $FFF6             ; $078D61 |
  dw $000A, $FFF6, $000B, $FFF5             ; $078D69 |
  dw $000A, $FFF6, $0008, $FFF8             ; $078D71 |
  dw $000C, $FFF4, $000F, $FFF1             ; $078D79 |
  dw $0008, $FFF8, $0010, $FFF0             ; $078D81 |
  dw $0008, $FFF8, $FFEC, $0014             ; $078D89 |
  dw $FFEE, $0012, $FFFA, $0006             ; $078D91 |
  dw $0008, $FFF8, $0009, $FFF7             ; $078D99 |
  dw $0001, $FFFF, $FFF6, $000A             ; $078DA1 |
  dw $FFEC, $0014, $FFEE, $0012             ; $078DA9 |
  dw $0001, $FFFF, $000F, $FFF1             ; $078DB1 |
  dw $FFF7, $FFF6, $FFF5, $FFF6             ; $078DB9 |
  dw $FFF8, $FFF3, $FFF3, $FFF1             ; $078DC1 |
  dw $FFED, $FFF7, $0009, $0004             ; $078DC9 |
  dw $FFF4, $FFEC, $FFEE, $FFF1             ; $078DD1 |
  dw $FFEC, $FFEC, $FFF7, $0009             ; $078DD9 |
  dw $000D, $0006                           ; $078DE1 |

CODE_078DE5:
  LDA !s_player_hitbox_half_height          ; $078DE5 |
  ASL A                                     ; $078DE8 |
  CLC                                       ; $078DE9 |
  ADC #$0004                                ; $078DEA |
  STA $00                                   ; $078DED |
  LDA !s_player_hitbox_half_width           ; $078DEF |
  ASL A                                     ; $078DF2 |
  CLC                                       ; $078DF3 |
  ADC #$0004                                ; $078DF4 |
  STA $02                                   ; $078DF7 |
  LDA !s_spr_anim_frame,x                   ; $078DF9 |
  ASL A                                     ; $078DFC |
  TAY                                       ; $078DFD |
  LDA !s_spr_y_hitbox_center,x              ; $078DFE |
  CLC                                       ; $078E01 |
  ADC $8DB9,y                               ; $078E02 |
  SEC                                       ; $078E05 |
  SBC !s_player_center_y                    ; $078E06 |
  CLC                                       ; $078E09 |
  ADC !s_player_hitbox_half_height          ; $078E0A |
  CLC                                       ; $078E0D |
  ADC #$0002                                ; $078E0E |
  CMP $00                                   ; $078E11 |
  BCS CODE_078E39                           ; $078E13 |
  LDA !s_spr_anim_frame,x                   ; $078E15 |
  ASL A                                     ; $078E18 |
  ASL A                                     ; $078E19 |
  ORA !s_spr_facing_dir,x                   ; $078E1A |
  TAY                                       ; $078E1D |
  LDA !s_spr_x_hitbox_center,x              ; $078E1E |
  CLC                                       ; $078E21 |
  ADC $8D61,y                               ; $078E22 |
  SEC                                       ; $078E25 |
  SBC !s_player_center_x                    ; $078E26 |
  CLC                                       ; $078E29 |
  ADC !s_player_hitbox_half_width           ; $078E2A |
  CLC                                       ; $078E2D |
  ADC #$0002                                ; $078E2E |
  CMP $02                                   ; $078E31 |
  BCS CODE_078E39                           ; $078E33 |
  JSL player_hit_sprite                     ; $078E35 |

CODE_078E39:
  RTS                                       ; $078E39 |

  dw $FE00, $0200                           ; $078E3A |

CODE_078E3E:
  LDA $76                                   ; $078E3E |
  CMP #$000B                                ; $078E40 |
  BNE CODE_078EC2                           ; $078E43 |
  LDA $7BB8                                 ; $078E45 |
  ASL A                                     ; $078E48 |
  CLC                                       ; $078E49 |
  ADC #$0004                                ; $078E4A |
  STA $00                                   ; $078E4D |
  LDA $7BB6                                 ; $078E4F |
  ASL A                                     ; $078E52 |
  CLC                                       ; $078E53 |
  ADC #$0004                                ; $078E54 |
  STA $02                                   ; $078E57 |
  LDA !s_spr_anim_frame,x                   ; $078E59 |
  ASL A                                     ; $078E5C |
  TAY                                       ; $078E5D |
  LDA !s_spr_y_hitbox_center,x              ; $078E5E |
  CLC                                       ; $078E61 |
  ADC $8DB9,y                               ; $078E62 |
  SEC                                       ; $078E65 |
  SBC !s_spr_y_hitbox_center                ; $078E66 |
  CLC                                       ; $078E69 |
  ADC $7BB8                                 ; $078E6A |
  CLC                                       ; $078E6D |
  ADC #$0002                                ; $078E6E |
  CMP $00                                   ; $078E71 |
  BCS CODE_078E95                           ; $078E73 |
  LDA !s_spr_anim_frame,x                   ; $078E75 |
  ASL A                                     ; $078E78 |
  ASL A                                     ; $078E79 |
  ORA !s_spr_facing_dir,x                   ; $078E7A |
  TAY                                       ; $078E7D |
  LDA !s_spr_x_hitbox_center,x              ; $078E7E |
  CLC                                       ; $078E81 |
  ADC $8D61,y                               ; $078E82 |
  SEC                                       ; $078E85 |
  SBC !s_spr_x_hitbox_center                ; $078E86 |
  CLC                                       ; $078E89 |
  ADC $7BB6                                 ; $078E8A |
  CLC                                       ; $078E8D |
  ADC #$0002                                ; $078E8E |
  CMP $02                                   ; $078E91 |
  BCC CODE_078E9B                           ; $078E93 |

CODE_078E95:
  LDY !s_spr_collision_id,x                 ; $078E95 |
  DEY                                       ; $078E98 |
  BNE CODE_078EC2                           ; $078E99 |

CODE_078E9B:
  LDY !s_spr_facing_dir,x                   ; $078E9B |
  LDA $8E3A,y                               ; $078E9E |
  STA !s_spr_x_speed_lo                     ; $078EA1 |
  LDA !s_spr_y_speed_lo                     ; $078EA4 |
  EOR #$FFFF                                ; $078EA7 |
  INC A                                     ; $078EAA |
  STA !s_spr_y_speed_lo                     ; $078EAB |
  LDA !s_spr_x_hitbox_center                ; $078EAE |
  STA $00                                   ; $078EB1 |
  LDA !s_spr_y_hitbox_center                ; $078EB3 |
  STA $02                                   ; $078EB6 |
  JSR CODE_07FD16                           ; $078EB8 |
  LDA #$0067                                ; $078EBB |\ play sound #$0067
  JSL push_sound_queue                      ; $078EBE |/

CODE_078EC2:
  RTS                                       ; $078EC2 |

CODE_078EC3:
  LDY !s_spr_collision_id,x                 ; $078EC3 |
  BPL CODE_078EDA                           ; $078EC6 |
  LDA !s_super_mario_timer                  ; $078EC8 |
  BEQ CODE_078ED1                           ; $078ECB |
  JML $03B273                               ; $078ECD |

CODE_078ED1:
  JSL $07FC2F                               ; $078ED1 |
  BCC CODE_078EDA                           ; $078ED5 |
  JMP CODE_07890A                           ; $078ED7 |

CODE_078EDA:
  LDA #$8895                                ; $078EDA |
  STA $00                                   ; $078EDD |
  JSR CODE_07A623                           ; $078EDF |
  LDA !s_spr_wildcard_1_lo,x                ; $078EE2 |
  BNE CODE_078EF0                           ; $078EE5 |
  LDA !s_spr_bitwise_settings_3,x           ; $078EE7 |
  ORA #$0100                                ; $078EEA |
  STA !s_spr_bitwise_settings_3,x           ; $078EED |

CODE_078EF0:
  RTL                                       ; $078EF0 |

CODE_078EF1:
  LDA $76                                   ; $078EF1 |
  CMP #$000B                                ; $078EF3 |
  BNE CODE_078F25                           ; $078EF6 |
  LDA !s_spr_x_pixel_pos,x                  ; $078EF8 |
  SEC                                       ; $078EFB |
  SBC !s_spr_x_pixel_pos                    ; $078EFC |
  STA $02                                   ; $078EFF |
  CLC                                       ; $078F01 |
  ADC #$0010                                ; $078F02 |
  CMP #$0020                                ; $078F05 |
  BCS CODE_078F25                           ; $078F08 |
  LDY #$00                                  ; $078F0A |
  LDA $02                                   ; $078F0C |
  BPL CODE_078F12                           ; $078F0E |
  INY                                       ; $078F10 |
  INY                                       ; $078F11 |

CODE_078F12:
  TYA                                       ; $078F12 |
  STA $02                                   ; $078F13 |
  LDA !s_spr_y_pixel_pos,x                  ; $078F15 |
  SEC                                       ; $078F18 |
  SBC !s_spr_y_pixel_pos                    ; $078F19 |
  CLC                                       ; $078F1C |
  ADC #$0010                                ; $078F1D |
  CMP #$0020                                ; $078F20 |
  BCC CODE_078F26                           ; $078F23 |

CODE_078F25:
  SEC                                       ; $078F25 |

CODE_078F26:
  RTS                                       ; $078F26 |

CODE_078F27:
  LDA #$011D                                ; $078F27 |
  BRA CODE_078F2F                           ; $078F2A |

CODE_078F2C:
  LDA #$009E                                ; $078F2C |

CODE_078F2F:
  STA !gsu_r14                              ; $078F2F |
  TXA                                       ; $078F32 |
  STA !gsu_r1                               ; $078F33 |
  LDX #$09                                  ; $078F36 |
  LDA #$8EBF                                ; $078F38 |
  JSL r_gsu_init_1                          ; $078F3B | GSU init
  LDX $12                                   ; $078F3F |
  LDY !gsu_r1                               ; $078F41 |
  BMI CODE_078F70                           ; $078F44 |
  LDA !s_spr_x_hitbox_center,x              ; $078F46 |
  SEC                                       ; $078F49 |
  SBC !s_spr_x_hitbox_center,y              ; $078F4A |
  PHA                                       ; $078F4D |
  AND #$8000                                ; $078F4E |
  ASL A                                     ; $078F51 |
  ROL A                                     ; $078F52 |
  ASL A                                     ; $078F53 |
  STA $02                                   ; $078F54 |
  PLA                                       ; $078F56 |
  CLC                                       ; $078F57 |
  ADC #$0010                                ; $078F58 |
  CMP #$0020                                ; $078F5B |
  BCS CODE_078F70                           ; $078F5E |
  LDA !s_spr_y_hitbox_center,x              ; $078F60 |
  SEC                                       ; $078F63 |
  SBC !s_spr_y_hitbox_center,y              ; $078F64 |
  CLC                                       ; $078F67 |
  ADC #$0010                                ; $078F68 |
  CMP #$0020                                ; $078F6B |
  BCC CODE_078F71                           ; $078F6E |

CODE_078F70:
  SEC                                       ; $078F70 |

CODE_078F71:
  RTS                                       ; $078F71 |

  dw $FC00, $0400                           ; $078F72 |

CODE_078F76:
  LDY !s_spr_facing_dir,x                   ; $078F76 |
  LDA $8F72,y                               ; $078F79 |
  STA $0E                                   ; $078F7C |
  LDA #$009E                                ; $078F7E |
  JSR CODE_078FD4                           ; $078F81 |
  BCS CODE_078F9F                           ; $078F84 |
  LDA $0E                                   ; $078F86 |
  STA !s_spr_x_speed_lo,y                   ; $078F88 |
  LDA !s_spr_x_hitbox_center,y              ; $078F8B |
  STA $00                                   ; $078F8E |
  LDA !s_spr_y_hitbox_center,y              ; $078F90 |
  STA $02                                   ; $078F93 |
  JSR CODE_07FD16                           ; $078F95 |
  LDA #$0067                                ; $078F98 |\ play sound #$0067
  JSL push_sound_queue                      ; $078F9B |/

CODE_078F9F:
  RTS                                       ; $078F9F |

CODE_078FA0:
  LDY !s_spr_facing_dir,x                   ; $078FA0 |
  LDA $8F72,y                               ; $078FA3 |
  STA $0E                                   ; $078FA6 |
  LDA #$011D                                ; $078FA8 |
  JSR CODE_078FD4                           ; $078FAB |
  BCS CODE_078FD3                           ; $078FAE |
  LDA $0E                                   ; $078FB0 |
  STA !s_spr_x_speed_lo,y                   ; $078FB2 |
  LDA !s_spr_y_speed_lo,y                   ; $078FB5 |
  EOR #$FFFF                                ; $078FB8 |
  INC A                                     ; $078FBB |
  STA !s_spr_y_speed_lo,y                   ; $078FBC |
  LDA !s_spr_x_hitbox_center,y              ; $078FBF |
  STA $00                                   ; $078FC2 |
  LDA !s_spr_y_hitbox_center,y              ; $078FC4 |
  STA $02                                   ; $078FC7 |
  JSR CODE_07FD16                           ; $078FC9 |
  LDA #$0067                                ; $078FCC |\ play sound #$0067
  JSL push_sound_queue                      ; $078FCF |/

CODE_078FD3:
  RTS                                       ; $078FD3 |

CODE_078FD4:
  STA !gsu_r14                              ; $078FD4 |
  TXA                                       ; $078FD7 |
  STA !gsu_r1                               ; $078FD8 |
  LDX #$09                                  ; $078FDB |
  LDA #$8EBF                                ; $078FDD |
  JSL r_gsu_init_1                          ; $078FE0 | GSU init
  LDX $12                                   ; $078FE4 |
  LDY !gsu_r1                               ; $078FE6 |
  BMI CODE_07901F                           ; $078FE9 |
  LDA !s_spr_hitbox_height,x                ; $078FEB |
  CLC                                       ; $078FEE |
  ADC !s_spr_hitbox_height,y                ; $078FEF |
  STA $00                                   ; $078FF2 |
  LDA !s_spr_hitbox_width,x                 ; $078FF4 |
  CLC                                       ; $078FF7 |
  ADC !s_spr_hitbox_width,y                 ; $078FF8 |
  STA $02                                   ; $078FFB |
  LDA !s_spr_y_hitbox_center,x              ; $078FFD |
  SEC                                       ; $079000 |
  SBC !s_spr_y_hitbox_center,y              ; $079001 |
  BPL CODE_07900A                           ; $079004 |
  EOR #$FFFF                                ; $079006 |
  INC A                                     ; $079009 |

CODE_07900A:
  CMP $00                                   ; $07900A |
  BCS CODE_079020                           ; $07900C |
  LDA !s_spr_x_hitbox_center,x              ; $07900E |
  SEC                                       ; $079011 |
  SBC !s_spr_x_hitbox_center,y              ; $079012 |
  BPL CODE_07901B                           ; $079015 |
  EOR #$FFFF                                ; $079017 |
  INC A                                     ; $07901A |

CODE_07901B:
  CMP $02                                   ; $07901B |
  BCC CODE_079020                           ; $07901D |

CODE_07901F:
  SEC                                       ; $07901F |

CODE_079020:
  RTS                                       ; $079020 |

  db $A8, $FF, $58, $00                     ; $079021 |

init_spear_guy_long:
  LDA #$9261                                ; $079025 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079028 |
  LDA #$0800                                ; $07902A |
  BRA CODE_079037                           ; $07902D |

init_spear_guy_short:
  LDA #$926D                                ; $07902F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079032 |
  LDA #$0000                                ; $079034 |

CODE_079037:
  STA !s_spr_wildcard_6_lo_dp,x             ; $079037 |
  LDA #$0004                                ; $079039 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07903C |
  SEP #$20                                  ; $07903E |
  TAY                                       ; $079040 |
  LDA #$04                                  ; $079041 |
  STA !s_spr_timer_1,x                      ; $079043 |
  LDA $906F,y                               ; $079046 |
  STA !s_spr_anim_frame,x                   ; $079049 |
  TAY                                       ; $07904C |
  LDA $9078,y                               ; $07904D |
  STA !s_spr_x_hitbox_offset,x              ; $079050 |
  LDA $907E,y                               ; $079053 |
  STA !s_spr_hitbox_width,x                 ; $079056 |
  REP #$20                                  ; $079059 |
  LDY !s_spr_facing_dir,x                   ; $07905B |
  LDA $9021,y                               ; $07905E |
  STA !s_spr_x_speed_lo,x                   ; $079061 |
  LDA #$0003                                ; $079064 |
  STA !s_spr_wildcard_2_lo,x                ; $079067 |
  RTL                                       ; $07906A |

  dw $0004, $0002                           ; $07906B |

  db $04, $03, $02, $01, $00                ; $07906F |
  db $04, $04, $30, $01                     ; $079074 |

  db $08, $08, $08, $08, $08, $06           ; $079078 |

  db $06, $06, $06, $06, $06, $0A           ; $07907E |
  db $20, $00, $20, $00, $00, $02           ; $079084 |
  db $00, $FE, $E0, $FF, $20, $00           ; $07908A |

main_spear_guy:
  LDA !s_spr_state,x                        ; $079090 |
  CMP #$0008                                ; $079093 |
  BEQ CODE_07909B                           ; $079096 |
  JMP CODE_0790D1                           ; $079098 |

CODE_07909B:
  LDA !s_spr_x_player_dir,x                 ; $07909B |
  AND #$00FF                                ; $07909E |
  EOR !s_spr_facing_dir,x                   ; $0790A1 |
  BEQ CODE_0790A9                           ; $0790A4 |

CODE_0790A6:
  JMP CODE_0791BF                           ; $0790A6 |

CODE_0790A9:
  LDA !s_player_mouth_state                 ; $0790A9 |
  CMP #$0003                                ; $0790AC |
  BCS CODE_0790A6                           ; $0790AF |
  LDA #$003C                                ; $0790B1 |\ play sound #$003C
  JSL push_sound_queue                      ; $0790B4 |/
  LDA #$0010                                ; $0790B8 |
  STA !s_spr_state,x                        ; $0790BB |
  STZ $6162                                 ; $0790BE |
  STZ !s_tongued_sprite_slot                ; $0790C1 |
  PLA                                       ; $0790C4 |
  PLY                                       ; $0790C5 |
  JSL $03AF23                               ; $0790C6 |
  JSR CODE_079377                           ; $0790CA |
  LDY #$02                                  ; $0790CD |
  BRA CODE_0790E1                           ; $0790CF |

CODE_0790D1:
  JSL $03AF23                               ; $0790D1 |
  JSL $03A5B7                               ; $0790D5 |
  JSR CODE_079279                           ; $0790D9 |
  BPL CODE_0790E1                           ; $0790DC |
  JMP CODE_079135                           ; $0790DE |

CODE_0790E1:
  LDA $906B,y                               ; $0790E1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0790E4 |
  LDA #$0020                                ; $0790E6 |
  STA !s_spr_timer_1,x                      ; $0790E9 |
  LDA #$0005                                ; $0790EC |
  STA !s_spr_anim_frame,x                   ; $0790EF |
  TAY                                       ; $0790F2 |
  LDA $9078,y                               ; $0790F3 |
  AND #$00FF                                ; $0790F6 |
  STA !s_spr_x_hitbox_offset,x              ; $0790F9 |
  LDA $907E,y                               ; $0790FC |
  AND #$00FF                                ; $0790FF |
  STA !s_spr_hitbox_width,x                 ; $079102 |
  LDA !s_spr_bitwise_settings_3,x           ; $079105 |
  AND #$FC3F                                ; $079108 |
  ORA #$0080                                ; $07910B |
  STA !s_spr_bitwise_settings_3,x           ; $07910E |
  LDA !s_spr_oam_1,x                        ; $079111 |
  ORA #$0004                                ; $079114 |
  STA !s_spr_oam_1,x                        ; $079117 |
  LDY !s_spr_collision_id,x                 ; $07911A |
  DEY                                       ; $07911D |
  BMI CODE_079135                           ; $07911E |
  LDA !s_spr_state,y                        ; $079120 |
  CMP #$0010                                ; $079123 |
  BNE CODE_079135                           ; $079126 |
  LDA !s_spr_collision_state,y              ; $079128 |
  BEQ CODE_079135                           ; $07912B |
  TYX                                       ; $07912D |
  JSL $03B25B                               ; $07912E |
  JSR CODE_079377                           ; $079132 |

CODE_079135:
  TXY                                       ; $079135 |
  LDX !s_spr_wildcard_5_lo_dp,y             ; $079136 |
  JMP ($913B,x)                             ; $079138 |

  dw $9141, $916F, $91BE                    ; $07913B |

  TYX                                       ; $079141 |
  LDA !s_spr_timer_1,x                      ; $079142 |
  BNE CODE_07916E                           ; $079145 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $079147 |
  BPL CODE_079150                           ; $079149 |
  LDA #$0004                                ; $07914B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07914E |

CODE_079150:
  SEP #$20                                  ; $079150 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $079152 |
  LDA #$04                                  ; $079154 |
  STA !s_spr_timer_1,x                      ; $079156 |
  LDA $906F,y                               ; $079159 |
  STA !s_spr_anim_frame,x                   ; $07915C |
  TAY                                       ; $07915F |
  LDA $9078,y                               ; $079160 |
  STA !s_spr_x_hitbox_offset,x              ; $079163 |
  LDA $907E,y                               ; $079166 |
  STA !s_spr_hitbox_width,x                 ; $079169 |
  REP #$20                                  ; $07916C |

CODE_07916E:
  RTL                                       ; $07916E |

  TYX                                       ; $07916F |
  LDA !s_spr_x_speed_lo,x                   ; $079170 |
  BNE CODE_079178                           ; $079173 |
  STZ !s_spr_x_accel,x                      ; $079175 |

CODE_079178:
  LDA !s_spr_timer_1,x                      ; $079178 |
  BNE CODE_0791B9                           ; $07917B |
  LDA #$0004                                ; $07917D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $079180 |
  SEP #$20                                  ; $079182 |
  TAY                                       ; $079184 |
  LDA #$04                                  ; $079185 |
  STA !s_spr_timer_1,x                      ; $079187 |
  LDA $906F,y                               ; $07918A |
  STA !s_spr_anim_frame,x                   ; $07918D |
  TAY                                       ; $079190 |
  LDA $9078,y                               ; $079191 |
  STA !s_spr_x_hitbox_offset,x              ; $079194 |
  LDA $907E,y                               ; $079197 |
  STA !s_spr_hitbox_width,x                 ; $07919A |
  REP #$20                                  ; $07919D |
  LDY !s_spr_facing_dir,x                   ; $07919F |
  LDA $9021,y                               ; $0791A2 |
  STA !s_spr_x_speed_lo,x                   ; $0791A5 |
  STZ !s_spr_x_accel,x                      ; $0791A8 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0791AB |
  LDA !s_spr_bitwise_settings_3,x           ; $0791AD |
  AND #$FC3F                                ; $0791B0 |
  ORA #$0140                                ; $0791B3 |
  STA !s_spr_bitwise_settings_3,x           ; $0791B6 |

CODE_0791B9:
  RTL                                       ; $0791B9 |

  dw $FF00, $0100                           ; $0791BA |

  TYX                                       ; $0791BE |

CODE_0791BF:
  JSR CODE_0791E7                           ; $0791BF |
  JSL $03A331                               ; $0791C2 |
  LDA #$001E                                ; $0791C6 |
  TXY                                       ; $0791C9 |
  JSL $03A377                               ; $0791CA |
  LDA !s_spr_wildcard_2_lo,x                ; $0791CE |
  DEC A                                     ; $0791D1 |
  ORA !s_spr_oam_yxppccct,x                 ; $0791D2 |
  STA !s_spr_oam_yxppccct,x                 ; $0791D5 |
  LDA !s_spr_state,x                        ; $0791D8 |
  CMP #$0010                                ; $0791DB |
  BNE CODE_0791E6                           ; $0791DE |
  LDA #$0002                                ; $0791E0 |
  STA !s_spr_state,x                        ; $0791E3 |

CODE_0791E6:
  RTL                                       ; $0791E6 |

CODE_0791E7:
  PHX                                       ; $0791E7 |
  LDA #$01EA                                ; $0791E8 |
  JSL spawn_ambient_sprite                  ; $0791EB |
  LDA !s_spr_x_pixel_pos,x                  ; $0791EF |
  STA $70A2,y                               ; $0791F2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0791F5 |
  STA $7142,y                               ; $0791F8 |
  LDA !s_spr_facing_dir,x                   ; $0791FB |
  STA $73C0,y                               ; $0791FE |
  TAX                                       ; $079201 |
  LDA $91BA,x                               ; $079202 |
  STA $71E0,y                               ; $079205 |
  LDA #$FC00                                ; $079208 |
  STA $71E2,y                               ; $07920B |
  LDA #$0020                                ; $07920E |
  STA $7782,y                               ; $079211 |
  PLX                                       ; $079214 |
  PHX                                       ; $079215 |
  LDA #$01EB                                ; $079216 |
  JSL spawn_ambient_sprite                  ; $079219 |
  LDA !s_spr_x_pixel_pos,x                  ; $07921D |
  STA $70A2,y                               ; $079220 |
  LDA !s_spr_y_pixel_pos,x                  ; $079223 |
  STA $7142,y                               ; $079226 |
  LDA $7000,y                               ; $079229 |
  CLC                                       ; $07922C |
  ADC !s_spr_wildcard_6_lo,x                ; $07922D |
  STA $7000,y                               ; $079230 |
  LDA !s_spr_facing_dir,x                   ; $079233 |
  STA $73C0,y                               ; $079236 |
  EOR #$0002                                ; $079239 |
  TAX                                       ; $07923C |
  LDA $91BA,x                               ; $07923D |
  STA $71E0,y                               ; $079240 |
  LDA #$FC00                                ; $079243 |
  STA $71E2,y                               ; $079246 |
  LDA #$0020                                ; $079249 |
  STA $7782,y                               ; $07924C |
  PLX                                       ; $07924F |
  RTS                                       ; $079250 |

  dw $0040, $0000, $0008, $0009             ; $079251 |
  dw $0009, $0008, $0008, $000A             ; $079259 |
  dw $FFE9, $FFEB, $FFEA, $FFE9             ; $079261 |
  dw $FFE8, $FFEF, $FFF5, $FFF7             ; $079269 |
  dw $FFF6, $FFF5, $FFF4, $FFF9             ; $079271 |

CODE_079279:
  JSR CODE_07931E                           ; $079279 |
  LDY !s_spr_collision_id,x                 ; $07927C |
  BEQ CODE_0792B9                           ; $07927F |
  BMI CODE_0792B9                           ; $079281 |
  DEY                                       ; $079283 |
  LDA !s_spr_state,y                        ; $079284 |
  CMP #$0010                                ; $079287 |
  BNE CODE_0792B9                           ; $07928A |
  LDA !s_spr_collision_state,y              ; $07928C |
  BEQ CODE_0792B9                           ; $07928F |
  LDX $12                                   ; $079291 |
  LDA !s_spr_x_collision_delta,x            ; $079293 |
  AND #$8000                                ; $079296 |
  ASL A                                     ; $079299 |
  ROL A                                     ; $07929A |
  ASL A                                     ; $07929B |
  EOR !s_spr_facing_dir,x                   ; $07929C |
  BEQ CODE_0792A3                           ; $07929F |
  TAY                                       ; $0792A1 |
  RTS                                       ; $0792A2 |

CODE_0792A3:
  TYX                                       ; $0792A3 |
  JSL $03B25B                               ; $0792A4 |
  LDX $12                                   ; $0792A8 |
  LDA #$003B                                ; $0792AA |\ play sound #$003B
  JSL push_sound_queue                      ; $0792AD |/
  JSR CODE_0791E7                           ; $0792B1 |
  PLA                                       ; $0792B4 |
  JML $03B24B                               ; $0792B5 |

CODE_0792B9:
  TXA                                       ; $0792B9 |
  STA !gsu_r1                               ; $0792BA |
  PHX                                       ; $0792BD |
  LDX #$09                                  ; $0792BE |
  LDA #$8F33                                ; $0792C0 |
  JSL r_gsu_init_1                          ; $0792C3 | GSU init
  PLX                                       ; $0792C7 |
  LDY !gsu_r1                               ; $0792C8 |
  BMI CODE_07931D                           ; $0792CB |
  LDA !s_spr_facing_dir,x                   ; $0792CD |
  LSR A                                     ; $0792D0 |
  LSR A                                     ; $0792D1 |
  ROR A                                     ; $0792D2 |
  STA $00                                   ; $0792D3 |
  LDA !s_spr_x_hitbox_center,x              ; $0792D5 |
  SEC                                       ; $0792D8 |
  SBC !s_spr_x_hitbox_center,y              ; $0792D9 |
  STA $02                                   ; $0792DC |
  EOR $00                                   ; $0792DE |
  BMI CODE_07931B                           ; $0792E0 |
  LDA $02                                   ; $0792E2 |
  EOR !s_spr_x_speed_lo,y                   ; $0792E4 |
  BMI CODE_07931B                           ; $0792E7 |
  LDA $02                                   ; $0792E9 |
  CLC                                       ; $0792EB |
  ADC #$0018                                ; $0792EC |
  CMP #$0030                                ; $0792EF |
  BCS CODE_07931B                           ; $0792F2 |
  LDA $02                                   ; $0792F4 |
  BPL CODE_0792FC                           ; $0792F6 |
  EOR #$FFFF                                ; $0792F8 |
  INC A                                     ; $0792FB |

CODE_0792FC:
  STA $04                                   ; $0792FC |
  LSR A                                     ; $0792FE |
  STA $02                                   ; $0792FF |
  LDA !s_spr_y_hitbox_center,x              ; $079301 |
  SEC                                       ; $079304 |
  SBC !s_spr_y_hitbox_center,y              ; $079305 |
  STA $00                                   ; $079308 |
  EOR !s_spr_y_speed_lo,y                   ; $07930A |
  BMI CODE_07931B                           ; $07930D |
  LDA $00                                   ; $07930F |
  CLC                                       ; $079311 |
  ADC $02                                   ; $079312 |
  CMP $04                                   ; $079314 |
  BCS CODE_07931B                           ; $079316 |
  LDY #$02                                  ; $079318 |
  RTS                                       ; $07931A |

CODE_07931B:
  LDY #$FF                                  ; $07931B |

CODE_07931D:
  RTS                                       ; $07931D |

CODE_07931E:
  LDY !s_spr_collision_id,x                 ; $07931E |
  BMI CODE_079376                           ; $079321 |
  LDA !s_player_hitbox_half_height          ; $079323 |
  ASL A                                     ; $079326 |
  STA $02                                   ; $079327 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $079329 |
  STA $00                                   ; $07932B |
  LDA !s_spr_anim_frame,x                   ; $07932D |
  ASL A                                     ; $079330 |
  TAY                                       ; $079331 |
  LDA !s_spr_y_pixel_pos,x                  ; $079332 |
  CLC                                       ; $079335 |
  ADC ($00),y                               ; $079336 |
  SEC                                       ; $079338 |
  SBC !s_player_center_y                    ; $079339 |
  CLC                                       ; $07933C |
  ADC !s_player_hitbox_half_height          ; $07933D |
  CMP $02                                   ; $079340 |
  BCS CODE_079376                           ; $079342 |
  LDA !s_spr_anim_frame,x                   ; $079344 |
  ASL A                                     ; $079347 |
  TAY                                       ; $079348 |
  LDA $9255,y                               ; $079349 |
  LDY !s_spr_facing_dir,x                   ; $07934C |
  BEQ CODE_079358                           ; $07934F |
  EOR #$FFFF                                ; $079351 |
  CLC                                       ; $079354 |
  ADC #$0009                                ; $079355 |

CODE_079358:
  STA $00                                   ; $079358 |
  LDA !s_player_hitbox_half_width           ; $07935A |
  ASL A                                     ; $07935D |
  STA $02                                   ; $07935E |
  LDA !s_spr_x_pixel_pos,x                  ; $079360 |
  CLC                                       ; $079363 |
  ADC $00                                   ; $079364 |
  SEC                                       ; $079366 |
  SBC !s_player_center_x                    ; $079367 |
  CLC                                       ; $07936A |
  ADC !s_player_hitbox_half_width           ; $07936B |
  CMP $02                                   ; $07936E |
  BCS CODE_079376                           ; $079370 |
  JSL player_hit_sprite                     ; $079372 |

CODE_079376:
  RTS                                       ; $079376 |

CODE_079377:
  LDY !s_spr_facing_dir,x                   ; $079377 |
  LDA $9084,y                               ; $07937A |
  STA !s_spr_x_accel,x                      ; $07937D |
  LDA $9088,y                               ; $079380 |
  STA !s_spr_x_speed_lo,x                   ; $079383 |
  LDA $908C,y                               ; $079386 |
  STA $00                                   ; $079389 |
  LDA #$01E0                                ; $07938B |
  JSL spawn_ambient_sprite                  ; $07938E |
  LDA !s_spr_facing_dir,x                   ; $079392 |
  EOR #$0002                                ; $079395 |
  STA $73C0,y                               ; $079398 |
  LDA #$0004                                ; $07939B |
  STA $7782,y                               ; $07939E |
  STA $7E4C,y                               ; $0793A1 |
  LDA $00                                   ; $0793A4 |
  STA $71E0,y                               ; $0793A6 |
  LDA #$FFF0                                ; $0793A9 |
  STA $71E2,y                               ; $0793AC |
  LDA !s_spr_x_pixel_pos,x                  ; $0793AF |
  STA $70A2,y                               ; $0793B2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0793B5 |
  CLC                                       ; $0793B8 |
  ADC #$000C                                ; $0793B9 |
  STA $7142,y                               ; $0793BC |
  RTS                                       ; $0793BF |

  dw $FFA8, $0058, $0100, $FF00             ; $0793C0 |
  dw $FFEC, $0005, $FFF3, $FFFD             ; $0793C8 |
  dw $FFF8, $FFF8                           ; $0793D0 |

  dw $0000, $0001, $0002, $0003             ; $0793D4 |
  dw $0004, $0005, $0006, $0007             ; $0793DC |
  dw $0008, $0009, $0008, $0005             ; $0793E4 |
  dw $0010, $0020, $0002, $0002             ; $0793EC |
  dw $0006, $0008, $0010                    ; $0793F4 |

init_snifit:
  LDY !s_spr_facing_dir,x                   ; $0793FA |
  LDA $93C0,y                               ; $0793FD |
  STA !s_spr_x_speed_lo,x                   ; $079400 |
  LDA #$0004                                ; $079403 |
  STA !s_spr_timer_1,x                      ; $079406 |
  LDA $93D4                                 ; $079409 |
  STA !s_spr_anim_frame,x                   ; $07940C |
  RTL                                       ; $07940F |

main_snifit:
  JSL $03AF23                               ; $079410 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $079414 |
  TAX                                       ; $079416 |
  JSR ($941F,x)                             ; $079417 |
  JSL $03A5B7                               ; $07941A |
  RTL                                       ; $07941E |

  dw $9423                                  ; $07941F |
  dw $9476                                  ; $079421 |

  LDX $12                                   ; $079423 |
  LDA !s_spr_cam_x_pos,x                    ; $079425 |
  CMP #$00F0                                ; $079428 |
  BCS CODE_079432                           ; $07942B |
  LDA !s_spr_timer_2,x                      ; $07942D |
  BEQ CODE_079454                           ; $079430 |

CODE_079432:
  LDA !s_spr_timer_1,x                      ; $079432 |
  BNE CODE_079475                           ; $079435 |
  LDA #$0004                                ; $079437 |
  STA !s_spr_timer_1,x                      ; $07943A |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07943D |
  INC A                                     ; $07943F |
  INC A                                     ; $079440 |
  CMP #$000A                                ; $079441 |
  BCC CODE_079449                           ; $079444 |
  LDA #$0000                                ; $079446 |

CODE_079449:
  STA !s_spr_wildcard_4_lo_dp,x             ; $079449 |
  TAY                                       ; $07944B |
  LDA $93D4,y                               ; $07944C |
  STA !s_spr_anim_frame,x                   ; $07944F |
  BRA CODE_079475                           ; $079452 |

CODE_079454:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079454 |
  STZ !s_spr_x_speed_lo,x                   ; $079456 |
  LDA $93EC                                 ; $079459 |
  STA !s_spr_timer_1,x                      ; $07945C |
  LDA $93DE                                 ; $07945F |
  STA !s_spr_anim_frame,x                   ; $079462 |
  LDA !s_spr_bitwise_settings_3,x           ; $079465 |
  AND #$F83F                                ; $079468 |
  ORA #$0400                                ; $07946B |
  STA !s_spr_bitwise_settings_3,x           ; $07946E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $079471 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $079473 |

CODE_079475:
  RTS                                       ; $079475 |

  LDX $12                                   ; $079476 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $079478 |
  BEQ CODE_079486                           ; $07947A |
  LDA !s_spr_x_speed_lo,x                   ; $07947C |
  BNE CODE_079486                           ; $07947F |
  STZ !s_spr_x_accel,x                      ; $079481 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $079484 |

CODE_079486:
  LDA !s_spr_timer_1,x                      ; $079486 |
  BNE CODE_0794B5                           ; $079489 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07948B |
  INC A                                     ; $07948D |
  INC A                                     ; $07948E |
  CMP #$000E                                ; $07948F |
  BCS CODE_0794B8                           ; $079492 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079494 |
  TAY                                       ; $079496 |
  LDA $93EC,y                               ; $079497 |
  STA !s_spr_timer_1,x                      ; $07949A |
  LDA $93DE,y                               ; $07949D |
  STA !s_spr_anim_frame,x                   ; $0794A0 |
  TYX                                       ; $0794A3 |
  JMP ($94A7,x)                             ; $0794A4 |

  dw $94B5                                  ; $0794A7 |
  dw $94D3                                  ; $0794A9 |
  dw $950D                                  ; $0794AB |
  dw $94B5                                  ; $0794AD |
  dw $94B5                                  ; $0794AF |
  dw $94B5                                  ; $0794B1 |
  dw $94B5                                  ; $0794B3 |

CODE_0794B5:
  LDX $12                                   ; $0794B5 |
  RTS                                       ; $0794B7 |

CODE_0794B8:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0794B8 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0794BA |
  LDA !s_spr_bitwise_settings_3,x           ; $0794BC |
  AND #$F83F                                ; $0794BF |
  ORA #$0140                                ; $0794C2 |
  STA !s_spr_bitwise_settings_3,x           ; $0794C5 |
  LDA #$0080                                ; $0794C8 |
  STA !s_spr_timer_2,x                      ; $0794CB |
  JSL $0793FA                               ; $0794CE |
  RTS                                       ; $0794D2 |

  LDX $12                                   ; $0794D3 |
  LDY !s_spr_facing_dir,x                   ; $0794D5 |
  LDA $93CC,y                               ; $0794D8 |
  STA $00                                   ; $0794DB |
  LDA #$01F5                                ; $0794DD |
  JSL spawn_ambient_sprite                  ; $0794E0 |
  LDA !s_spr_x_hitbox_center,x              ; $0794E4 |
  CLC                                       ; $0794E7 |
  ADC $00                                   ; $0794E8 |
  STA $70A2,y                               ; $0794EA |
  LDA !s_spr_y_pixel_pos,x                  ; $0794ED |
  SEC                                       ; $0794F0 |
  SBC #$000A                                ; $0794F1 |
  STA $7142,y                               ; $0794F4 |
  LDA !s_spr_facing_dir,x                   ; $0794F7 |
  STA $73C0,y                               ; $0794FA |
  LDA #$0006                                ; $0794FD |
  STA $7E4C,y                               ; $079500 |
  STA $7782,y                               ; $079503 |
  LDA #$0002                                ; $079506 |
  STA $7E4E,y                               ; $079509 |
  RTS                                       ; $07950C |

  LDX $12                                   ; $07950D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07950F |
  LDY !s_spr_facing_dir,x                   ; $079511 |
  LDA $93C4,y                               ; $079514 |
  STA !s_spr_x_speed_lo,x                   ; $079517 |
  LDA #$0010                                ; $07951A |
  STA !s_spr_x_accel,x                      ; $07951D |
  LDA $958D,y                               ; $079520 |
  STA $00                                   ; $079523 |
  LDA $93C8,y                               ; $079525 |
  STA $02                                   ; $079528 |
  LDA $93D0,y                               ; $07952A |
  STA $04                                   ; $07952D |
  LDA #$0114                                ; $07952F |
  JSL spawn_sprite_active                   ; $079532 |
  BCC CODE_079556                           ; $079536 |
  LDA !s_spr_x_hitbox_center,x              ; $079538 |
  CLC                                       ; $07953B |
  ADC $02                                   ; $07953C |
  STA !s_spr_x_pixel_pos,y                  ; $07953E |
  LDA !s_spr_y_pixel_pos,x                  ; $079541 |
  SEC                                       ; $079544 |
  SBC #$0001                                ; $079545 |
  STA !s_spr_y_pixel_pos,y                  ; $079548 |
  LDA !s_spr_facing_dir,x                   ; $07954B |
  STA !s_spr_facing_dir,y                   ; $07954E |
  LDA $00                                   ; $079551 |
  STA !s_spr_x_speed_lo,y                   ; $079553 |

CODE_079556:
  LDA #$01F6                                ; $079556 |
  JSL spawn_ambient_sprite                  ; $079559 |
  LDA !s_spr_x_hitbox_center,x              ; $07955D |
  CLC                                       ; $079560 |
  ADC $04                                   ; $079561 |
  STA $70A2,y                               ; $079563 |
  LDA !s_spr_y_pixel_pos,x                  ; $079566 |
  SEC                                       ; $079569 |
  SBC #$0004                                ; $07956A |
  STA $7142,y                               ; $07956D |
  LDA !s_spr_facing_dir,x                   ; $079570 |
  STA $73C0,y                               ; $079573 |
  LDA #$0002                                ; $079576 |
  STA $7E4C,y                               ; $079579 |
  STA $7782,y                               ; $07957C |
  LDA #$0005                                ; $07957F |
  STA $7E4E,y                               ; $079582 |
  LDA #$0047                                ; $079585 |\ play sound #$0047
  JSL push_sound_queue                      ; $079588 |/
  RTS                                       ; $07958C |

  dw $FE00, $0200                           ; $07958D |

init_snifit_bullet:
  LDY !s_spr_facing_dir,x                   ; $079591 |
  LDA $958D,y                               ; $079594 |
  STA !s_spr_x_speed_lo,x                   ; $079597 |
  RTL                                       ; $07959A |

main_snifit_bullet:
  JSL $03AF23                               ; $07959B |
  LDY !s_spr_collision_id,x                 ; $07959F |
  BPL CODE_0795A8                           ; $0795A2 |
  JSL player_hit_sprite                     ; $0795A4 |

CODE_0795A8:
  RTL                                       ; $0795A8 |

  db $03, $04, $05, $06                     ; $0795A9 |

  db $08, $02                               ; $0795AD |

  db $01, $02, $01, $00, $01, $02, $01, $00 ; $0795AF |
  db $01, $02, $01, $00, $01, $02, $01, $00 ; $0795B7 |
  db $01, $02, $01, $00                     ; $0795BF |

  db $08, $09, $08, $07, $08, $0C, $0B, $0A ; $0795C3 |
  db $08, $0C, $0B, $0A, $08, $09, $08, $07 ; $0795CB |

  db $0E, $0F, $10, $0F, $0E, $0D, $0E, $0F ; $0795D3 |
  db $10, $0F, $0E, $0D, $0E, $0F, $10, $0F ; $0795DB |
  db $0E, $0D                               ; $0795E3 |

  db $00, $11, $11, $00, $00, $11, $11, $00 ; $0795E5 |
  db $00, $11, $11, $00, $00                ; $0795ED |

  db $08, $03, $03, $05, $05, $03, $03, $05 ; $0795F2 |
  db $05, $03, $03, $05, $05                ; $0795FA |

  db $00, $02, $00, $00, $00, $02, $00, $00 ; $0795FF |
  db $00, $02, $00, $00, $00                ; $079607 |

  dw $FF00, $0100                           ; $07960C |

  dw $FC80, $0380                           ; $079610 |
  dw $FF00, $0100                           ; $079614 |
  dw $0008, $0004                           ; $079618 |
  dw $0100, $FF00                           ; $07961C |
  dw $FFE0, $0020                           ; $079620 |

  dw $0406, $0202                           ; $079624 |

init_poochy:
  LDA !r_poochy_gen_flag                    ; $079628 |
  BEQ CODE_079631                           ; $07962B |
  JML $03A31E                               ; $07962D |

CODE_079631:
  INC !r_poochy_gen_flag                    ; $079631 |
  RTL                                       ; $079634 |

main_poochy:
  JSL $03AF23                               ; $079635 |
  JSL $03A5B7                               ; $079639 |
  LDA !s_spr_y_pixel_pos,x                  ; $07963D |
  CMP #$0800                                ; $079640 |
  BMI CODE_07964C                           ; $079643 |
  STZ !r_poochy_gen_flag                    ; $079645 |
  JML $03A31E                               ; $079648 |

CODE_07964C:
  JSR CODE_079D3D                           ; $07964C |
  JSR CODE_079EA0                           ; $07964F |
  JSR CODE_079B88                           ; $079652 |
  JSR CODE_079C71                           ; $079655 |
  JSR CODE_079CBC                           ; $079658 |
  LDA !r_poochy_gen_flag                    ; $07965B |
  BNE CODE_079669                           ; $07965E |
  LDA !s_spr_oam_1,x                        ; $079660 |
  ORA #$0004                                ; $079663 |
  STA !s_spr_oam_1,x                        ; $079666 |

CODE_079669:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $079669 |
  TAX                                       ; $07966B |
  JSR ($9670,x)                             ; $07966C |
  RTL                                       ; $07966F |

  dw $967A                                  ; $079670 |
  dw $99AE                                  ; $079672 |
  dw $9A3B                                  ; $079674 |

  dw $001D, $FFE3                           ; $079676 |

  LDX $12                                   ; $07967A |
  JSR CODE_079960                           ; $07967C |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $07967F |
  BEQ CODE_079696                           ; $079681 |
  STZ !s_spr_x_speed_lo,x                   ; $079683 |
  TYX                                       ; $079686 |
  JMP ($968A,x)                             ; $079687 |

  dw $97EE                                  ; $07968A |
  dw $97EE                                  ; $07968C |
  dw $98D9                                  ; $07968E |
  dw $992B                                  ; $079690 |
  dw $98D9                                  ; $079692 |
  dw $992B                                  ; $079694 |

CODE_079696:
  LDA !r_poochy_gen_flag                    ; $079696 |
  BNE CODE_07969E                           ; $079699 |
  JMP CODE_079B48                           ; $07969B |

CODE_07969E:
  LDA #$0300                                ; $07969E |
  STA $00                                   ; $0796A1 |
  ASL A                                     ; $0796A3 |
  STA $02                                   ; $0796A4 |
  JSR CODE_079C2E                           ; $0796A6 |
  BCS CODE_0796EF                           ; $0796A9 |
  LDA !s_egg_throw_state                    ; $0796AB |
  BNE CODE_0796B6                           ; $0796AE |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0796B0 |
  BEQ CODE_0796B6                           ; $0796B2 |
  BPL CODE_0796CB                           ; $0796B4 |

CODE_0796B6:
  LDA !s_spr_timer_2,x                      ; $0796B6 |
  BNE CODE_0796E0                           ; $0796B9 |
  LDA !s_spr_x_player_dir,x                 ; $0796BB |
  AND #$00FF                                ; $0796BE |
  DEC A                                     ; $0796C1 |
  STA $02                                   ; $0796C2 |
  LDA !s_spr_x_player_delta,x               ; $0796C4 |
  STA $00                                   ; $0796C7 |
  BRA CODE_0796FD                           ; $0796C9 |

CODE_0796CB:
  LDA !s_spr_x_hitbox_center,x              ; $0796CB |
  SEC                                       ; $0796CE |
  SBC !s_spr_x_hitbox_center,y              ; $0796CF |
  STA $00                                   ; $0796D2 |
  AND #$8000                                ; $0796D4 |
  ASL A                                     ; $0796D7 |
  ROL A                                     ; $0796D8 |
  ASL A                                     ; $0796D9 |
  DEC A                                     ; $0796DA |
  STA $02                                   ; $0796DB |
  JMP CODE_079825                           ; $0796DD |

CODE_0796E0:
  LDA !s_spr_facing_dir,x                   ; $0796E0 |
  TAY                                       ; $0796E3 |
  DEC A                                     ; $0796E4 |
  STA $02                                   ; $0796E5 |
  LDA $9676,y                               ; $0796E7 |
  STA $00                                   ; $0796EA |
  JMP CODE_079825                           ; $0796EC |

CODE_0796EF:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0796EF |
  BEQ CODE_0796FA                           ; $0796F1 |
  BPL CODE_0796CB                           ; $0796F3 |
  LDA !s_spr_timer_2,x                      ; $0796F5 |
  BNE CODE_0796E0                           ; $0796F8 |

CODE_0796FA:
  JMP CODE_07976A                           ; $0796FA |

CODE_0796FD:
  STZ !s_spr_x_accel_ceiling,x              ; $0796FD |
  LDA #$0010                                ; $079700 |
  STA !s_spr_x_accel,x                      ; $079703 |
  LDA !s_spr_x_player_dir,x                 ; $079706 |
  AND #$00FF                                ; $079709 |
  CMP !s_spr_facing_dir,x                   ; $07970C |
  BNE CODE_07974E                           ; $07970F |
  LDA $00                                   ; $079711 |
  BPL CODE_079719                           ; $079713 |
  EOR #$FFFF                                ; $079715 |
  INC A                                     ; $079718 |

CODE_079719:
  CMP #$0030                                ; $079719 |
  BMI CODE_07974E                           ; $07971C |
  LDA !s_spr_x_accel,x                      ; $07971E |
  ASL A                                     ; $079721 |
  STA $04                                   ; $079722 |
  LDA !s_spr_x_speed_lo,x                   ; $079724 |
  CLC                                       ; $079727 |
  ADC !s_spr_x_accel,x                      ; $079728 |
  CMP $04                                   ; $07972B |
  BCS CODE_07973D                           ; $07972D |
  STZ !s_spr_x_speed_lo,x                   ; $07972F |
  STZ !s_spr_x_accel,x                      ; $079732 |
  LDA $02                                   ; $079735 |
  INC A                                     ; $079737 |
  CMP !s_spr_facing_dir,x                   ; $079738 |
  BNE CODE_07976A                           ; $07973B |

CODE_07973D:
  LDY !s_spr_facing_dir,x                   ; $07973D |
  LDA $9610,y                               ; $079740 |
  STA !s_spr_x_accel_ceiling,x              ; $079743 |
  LDA #$0030                                ; $079746 |
  STA !s_spr_x_accel,x                      ; $079749 |
  BRA CODE_0797B8                           ; $07974C |

CODE_07974E:
  LDA !s_spr_x_speed_lo,x                   ; $07974E |
  BEQ CODE_07975C                           ; $079751 |
  LDA !s_spr_facing_dir,x                   ; $079753 |
  DEC A                                     ; $079756 |
  EOR !s_spr_x_speed_lo,x                   ; $079757 |
  BPL CODE_0797B8                           ; $07975A |

CODE_07975C:
  STZ !s_spr_x_speed_lo,x                   ; $07975C |
  STZ !s_spr_x_accel,x                      ; $07975F |
  LDA $02                                   ; $079762 |
  INC A                                     ; $079764 |
  CMP !s_spr_facing_dir,x                   ; $079765 |
  BEQ CODE_079783                           ; $079768 |

CODE_07976A:
  LDY #$02                                  ; $07976A |
  STY !s_spr_wildcard_5_hi_dp,x             ; $07976C |
  LDY #$0C                                  ; $07976E |
  STY !s_spr_wildcard_4_lo_dp,x             ; $079770 |
  SEP #$20                                  ; $079772 |
  LDA $95F2,y                               ; $079774 |
  STA !s_spr_timer_1,x                      ; $079777 |
  LDA $95E5,y                               ; $07977A |
  STA !s_spr_anim_frame,x                   ; $07977D |
  REP #$20                                  ; $079780 |
  RTS                                       ; $079782 |

CODE_079783:
  LDA !s_spr_timer_1,x                      ; $079783 |
  BNE CODE_0797B7                           ; $079786 |
  LDY #$00                                  ; $079788 |
  LDA !s_egg_throw_state                    ; $07978A |
  BEQ CODE_079791                           ; $07978D |
  LDY #$01                                  ; $07978F |

CODE_079791:
  LDA $95AD,y                               ; $079791 |
  AND #$00FF                                ; $079794 |
  STA !s_spr_timer_1,x                      ; $079797 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07979A |
  DEC A                                     ; $07979C |
  AND #$0003                                ; $07979D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0797A0 |
  TAY                                       ; $0797A2 |
  LDA $95AF,y                               ; $0797A3 |
  AND #$00FF                                ; $0797A6 |
  STA !s_spr_anim_frame,x                   ; $0797A9 |
  CPY #$00                                  ; $0797AC |
  BNE CODE_0797B7                           ; $0797AE |
  LDA #$00A2                                ; $0797B0 |\
  JSL push_sound_queue                      ; $0797B3 |/ play sound #$00A2

CODE_0797B7:
  RTS                                       ; $0797B7 |

CODE_0797B8:
  LDA !s_spr_timer_1,x                      ; $0797B8 |
  BNE CODE_0797ED                           ; $0797BB |
  LDA !s_spr_x_speed_lo,x                   ; $0797BD |
  BPL CODE_0797C6                           ; $0797C0 |
  EOR #$FFFF                                ; $0797C2 |
  INC A                                     ; $0797C5 |

CODE_0797C6:
  XBA                                       ; $0797C6 |
  SEP #$20                                  ; $0797C7 |
  AND #$03                                  ; $0797C9 |
  TAY                                       ; $0797CB |
  LDA $9624,y                               ; $0797CC |
  STA !s_spr_timer_1,x                      ; $0797CF |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0797D2 |
  INC A                                     ; $0797D4 |
  AND #$03                                  ; $0797D5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0797D7 |
  TAY                                       ; $0797D9 |
  LDA $95A9,y                               ; $0797DA |
  STA !s_spr_anim_frame,x                   ; $0797DD |
  REP #$20                                  ; $0797E0 |
  CPY #$00                                  ; $0797E2 |
  BNE CODE_0797ED                           ; $0797E4 |
  LDA #$00A2                                ; $0797E6 |\
  JSL push_sound_queue                      ; $0797E9 |/ play sound #$00A2

CODE_0797ED:
  RTS                                       ; $0797ED |

CODE_0797EE:
  LDX $12                                   ; $0797EE |
  LDA !s_spr_timer_1,x                      ; $0797F0 |
  BNE CODE_079815                           ; $0797F3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0797F5 |
  DEY                                       ; $0797F7 |
  BMI CODE_079816                           ; $0797F8 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0797FA |
  SEP #$20                                  ; $0797FC |
  LDA !s_spr_facing_dir,x                   ; $0797FE |
  EOR $95FF,y                               ; $079801 |
  STA !s_spr_facing_dir,x                   ; $079804 |
  LDA $95E5,y                               ; $079807 |
  STA !s_spr_anim_frame,x                   ; $07980A |
  LDA $95F2,y                               ; $07980D |
  STA !s_spr_timer_1,x                      ; $079810 |
  REP #$20                                  ; $079813 |

CODE_079815:
  RTS                                       ; $079815 |

CODE_079816:
  LDY #$00                                  ; $079816 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079818 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07981A |
  BPL CODE_079822                           ; $07981C |
  LDY #$00                                  ; $07981E |
  STY !s_spr_wildcard_5_lo_dp,x             ; $079820 |

CODE_079822:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079822 |
  RTS                                       ; $079824 |

CODE_079825:
  STZ !s_spr_x_accel_ceiling,x              ; $079825 |
  LDA #$0010                                ; $079828 |
  STA !s_spr_x_accel,x                      ; $07982B |
  LDA $00                                   ; $07982E |
  CLC                                       ; $079830 |
  ADC #$001C                                ; $079831 |
  CMP #$0038                                ; $079834 |
  BCC CODE_07986A                           ; $079837 |
  LDA !s_spr_x_accel,x                      ; $079839 |
  ASL A                                     ; $07983C |
  STA $04                                   ; $07983D |
  LDA !s_spr_x_speed_lo,x                   ; $07983F |
  CLC                                       ; $079842 |
  ADC !s_spr_x_accel,x                      ; $079843 |
  CMP $04                                   ; $079846 |
  BCS CODE_079858                           ; $079848 |
  STZ !s_spr_x_speed_lo,x                   ; $07984A |
  STZ !s_spr_x_accel,x                      ; $07984D |
  LDA $02                                   ; $079850 |
  INC A                                     ; $079852 |
  CMP !s_spr_facing_dir,x                   ; $079853 |
  BNE CODE_07988E                           ; $079856 |

CODE_079858:
  LDY !s_spr_facing_dir,x                   ; $079858 |
  LDA $9610,y                               ; $07985B |
  STA !s_spr_x_accel_ceiling,x              ; $07985E |
  LDA #$0030                                ; $079861 |
  STA !s_spr_x_accel,x                      ; $079864 |
  JMP CODE_0797B8                           ; $079867 |

CODE_07986A:
  LDA !s_spr_x_speed_lo,x                   ; $07986A |
  BEQ CODE_079876                           ; $07986D |
  EOR $02                                   ; $07986F |
  BPL CODE_079876                           ; $079871 |
  JMP CODE_0797B8                           ; $079873 |

CODE_079876:
  STZ !s_spr_x_speed_lo,x                   ; $079876 |
  STZ !s_spr_x_accel,x                      ; $079879 |
  LDA $02                                   ; $07987C |
  INC A                                     ; $07987E |
  CMP !s_spr_facing_dir,x                   ; $07987F |
  BNE CODE_07988E                           ; $079882 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $079884 |
  LDA !s_spr_collision_state,y              ; $079886 |
  BEQ CODE_079891                           ; $079889 |
  JMP CODE_079783                           ; $07988B |

CODE_07988E:
  JMP CODE_07976A                           ; $07988E |

CODE_079891:
  LDA !s_spr_y_hitbox_center,x              ; $079891 |
  SEC                                       ; $079894 |
  SBC !s_spr_y_hitbox_center,y              ; $079895 |
  CLC                                       ; $079898 |
  ADC #$0010                                ; $079899 |
  CMP #$0020                                ; $07989C |
  BCC CODE_0798A4                           ; $07989F |
  JMP CODE_07997B                           ; $0798A1 |

CODE_0798A4:
  SEP #$20                                  ; $0798A4 |
  LDA $10                                   ; $0798A6 |
  AND #$06                                  ; $0798A8 |
  CLC                                       ; $0798AA |
  ADC #$04                                  ; $0798AB |
  STA !s_spr_wildcard_5_hi_dp,x             ; $0798AD |
  TAX                                       ; $0798AF |
  REP #$20                                  ; $0798B0 |
  JMP ($98B5,x)                             ; $0798B2 |

  dw $98C1                                  ; $0798B5 |
  dw $98C1                                  ; $0798B7 |
  dw $98C1                                  ; $0798B9 |
  dw $9913                                  ; $0798BB |
  dw $98C1                                  ; $0798BD |
  dw $9948                                  ; $0798BF |

  LDX $12                                   ; $0798C1 |
  LDA #$000F                                ; $0798C3 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0798C6 |
  TAY                                       ; $0798C8 |
  LDA $95C3,y                               ; $0798C9 |
  AND #$00FF                                ; $0798CC |
  STA !s_spr_anim_frame,x                   ; $0798CF |
  LDA #$0004                                ; $0798D2 |
  STA !s_spr_timer_1,x                      ; $0798D5 |
  RTS                                       ; $0798D8 |

  LDX $12                                   ; $0798D9 |
  LDA !s_spr_timer_1,x                      ; $0798DB |
  BNE CODE_07990D                           ; $0798DE |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0798E0 |
  BMI CODE_07990E                           ; $0798E2 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0798E4 |
  LDA $95C3,y                               ; $0798E6 |
  AND #$00FF                                ; $0798E9 |
  STA !s_spr_anim_frame,x                   ; $0798EC |
  LDA #$0004                                ; $0798EF |
  STA !s_spr_timer_1,x                      ; $0798F2 |
  CPY #$09                                  ; $0798F5 |
  BNE CODE_07990D                           ; $0798F7 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0798F9 |
  LDA #$FE00                                ; $0798FB |
  STA !s_spr_y_speed_lo,y                   ; $0798FE |
  LDA #$0040                                ; $079901 |
  STA !s_spr_y_accel,y                      ; $079904 |
  LDA #$0001                                ; $079907 |
  STA !s_spr_collision_state,y              ; $07990A |

CODE_07990D:
  RTS                                       ; $07990D |

CODE_07990E:
  LDY #$00                                  ; $07990E |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079910 |
  RTS                                       ; $079912 |

  LDX $12                                   ; $079913 |
  LDA #$0011                                ; $079915 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079918 |
  TAY                                       ; $07991A |
  LDA $95D3,y                               ; $07991B |
  AND #$00FF                                ; $07991E |
  STA !s_spr_anim_frame,x                   ; $079921 |
  LDA #$0002                                ; $079924 |
  STA !s_spr_timer_1,x                      ; $079927 |
  RTS                                       ; $07992A |

  LDX $12                                   ; $07992B |
  LDA !s_spr_timer_1,x                      ; $07992D |
  BNE CODE_079947                           ; $079930 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $079932 |
  BMI CODE_07990E                           ; $079934 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $079936 |
  LDA $95D3,y                               ; $079938 |
  AND #$00FF                                ; $07993B |
  STA !s_spr_anim_frame,x                   ; $07993E |
  LDA #$0002                                ; $079941 |
  STA !s_spr_timer_1,x                      ; $079944 |

CODE_079947:
  RTS                                       ; $079947 |

  LDX $12                                   ; $079948 |
  LDA #$0013                                ; $07994A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07994D |
  TAY                                       ; $07994F |
  LDA $95AF,y                               ; $079950 |
  AND #$00FF                                ; $079953 |
  STA !s_spr_anim_frame,x                   ; $079956 |
  LDA #$0002                                ; $079959 |
  STA !s_spr_timer_1,x                      ; $07995C |
  RTS                                       ; $07995F |

CODE_079960:
  LDY $7862,x                               ; $079960 |
  BNE CODE_07996D                           ; $079963 |
  LDA $7860,x                               ; $079965 |
  BIT #$0001                                ; $079968 |
  BEQ CODE_0799A7                           ; $07996B |

CODE_07996D:
  LDA $7860,x                               ; $07996D |
  BIT #$000C                                ; $079970 |
  BNE CODE_07997A                           ; $079973 |
  RTS                                       ; $079975 |

  dw $FF00, $0100                           ; $079976 |

CODE_07997A:
  PLA                                       ; $07997A |

CODE_07997B:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07997B |
  BNE CODE_07998D                           ; $07997D |
  LDA #$0006                                ; $07997F |
  STA !s_spr_timer_1,x                      ; $079982 |
  LDA #$000D                                ; $079985 |
  STA !s_spr_anim_frame,x                   ; $079988 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $07998B |

CODE_07998D:
  LDY !s_spr_facing_dir,x                   ; $07998D |
  LDA $9976,y                               ; $079990 |
  STA !s_spr_x_speed_lo,x                   ; $079993 |
  STZ !s_spr_x_accel,x                      ; $079996 |
  LDA !s_spr_timer_1,x                      ; $079999 |
  BNE CODE_0799A6                           ; $07999C |
  LDA #$FA00                                ; $07999E |
  STA !s_spr_y_speed_lo,x                   ; $0799A1 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0799A4 |

CODE_0799A6:
  RTS                                       ; $0799A6 |

CODE_0799A7:
  LDA #$0002                                ; $0799A7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0799AA |
  PLA                                       ; $0799AC |
  RTS                                       ; $0799AD |

  LDX $12                                   ; $0799AE |
  LDA !s_spr_y_speed_lo,x                   ; $0799B0 |
  BMI CODE_0799BA                           ; $0799B3 |
  LDY $7862,x                               ; $0799B5 |
  BNE CODE_0799F2                           ; $0799B8 |

CODE_0799BA:
  LDA $7860,x                               ; $0799BA |
  BIT #$0001                                ; $0799BD |
  BNE CODE_0799F2                           ; $0799C0 |
  LDA !s_spr_x_speed_lo,x                   ; $0799C2 |
  BNE CODE_0799D0                           ; $0799C5 |
  LDY !s_spr_facing_dir,x                   ; $0799C7 |
  LDA $9976,y                               ; $0799CA |
  STA !s_spr_x_speed_lo,x                   ; $0799CD |

CODE_0799D0:
  LDA !s_spr_y_speed_lo,x                   ; $0799D0 |
  CLC                                       ; $0799D3 |
  ADC #$0100                                ; $0799D4 |
  CMP #$0200                                ; $0799D7 |
  BCS CODE_0799E1                           ; $0799DA |
  LDA #$0004                                ; $0799DC |
  BRA CODE_0799EE                           ; $0799DF |

CODE_0799E1:
  LDA !s_spr_y_speed_lo,x                   ; $0799E1 |
  BPL CODE_0799EB                           ; $0799E4 |
  LDA #$0003                                ; $0799E6 |
  BRA CODE_0799EE                           ; $0799E9 |

CODE_0799EB:
  LDA #$0005                                ; $0799EB |

CODE_0799EE:
  STA !s_spr_anim_frame,x                   ; $0799EE |
  RTS                                       ; $0799F1 |

CODE_0799F2:
  LDA #$0000                                ; $0799F2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0799F5 |
  RTS                                       ; $0799F7 |

CODE_0799F8:
  LDA $7860,x                               ; $0799F8 |
  BIT #$000C                                ; $0799FB |
  BEQ CODE_079A26                           ; $0799FE |
  LDA #$FC00                                ; $079A00 |
  STA !s_spr_y_speed_lo,x                   ; $079A03 |
  LDA #$0400                                ; $079A06 |
  STA !s_spr_y_accel_ceiling,x              ; $079A09 |
  LDA #$0040                                ; $079A0C |
  STA !s_spr_y_accel,x                      ; $079A0F |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079A12 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $079A14 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $079A16 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $079A18 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $079A1B |
  STZ !s_spr_wildcard_1_lo,x                ; $079A1E |
  STZ !s_spr_wildcard_2_lo,x                ; $079A21 |
  BRA CODE_0799A7                           ; $079A24 |

CODE_079A26:
  RTS                                       ; $079A26 |

  STZ !s_spr_wildcard_5_lo_dp,x             ; $079A27 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $079A29 |
  STZ !s_spr_x_speed_lo,x                   ; $079A2B |
  STZ !s_spr_x_accel,x                      ; $079A2E |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079A31 |
  LDA #$0004                                ; $079A33 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $079A36 |
  RTS                                       ; $079A38 |

  db $05, $06                               ; $079A39 |

  LDX $12                                   ; $079A3B |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $079A3D |
  TAX                                       ; $079A3F |
  JMP ($9A43,x)                             ; $079A40 |

  dw $9A47, $9B17                           ; $079A43 |

  LDX $12                                   ; $079A47 |
  JSR CODE_0799F8                           ; $079A49 |
  JSR CODE_079AB5                           ; $079A4C |
  JSR CODE_079A6F                           ; $079A4F |
  LDA !s_spr_timer_1,x                      ; $079A52 |
  BNE CODE_079A6E                           ; $079A55 |
  SEP #$20                                  ; $079A57 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $079A59 |
  EOR #$01                                  ; $079A5B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079A5D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $079A5F |
  LDA $9A39,y                               ; $079A61 |
  STA !s_spr_anim_frame,x                   ; $079A64 |
  LDA #$04                                  ; $079A67 |
  STA !s_spr_timer_1,x                      ; $079A69 |
  REP #$20                                  ; $079A6C |

CODE_079A6E:
  RTS                                       ; $079A6E |

CODE_079A6F:
  LDA !s_spr_timer_3,x                      ; $079A6F |
  BNE CODE_079AB0                           ; $079A72 |
  LDY $7862,x                               ; $079A74 |
  BEQ CODE_079A8D                           ; $079A77 |
  LDA #$FF00                                ; $079A79 |
  STA !s_spr_y_accel_ceiling,x              ; $079A7C |
  LDA #$0020                                ; $079A7F |
  STA !s_spr_y_accel,x                      ; $079A82 |
  LDA #$0000                                ; $079A85 |
  STA !s_spr_timer_3,x                      ; $079A88 |
  BRA CODE_079AB0                           ; $079A8B |

CODE_079A8D:
  LDA #$0400                                ; $079A8D |
  STA !s_spr_y_accel_ceiling,x              ; $079A90 |
  LDA #$0040                                ; $079A93 |
  STA !s_spr_y_accel,x                      ; $079A96 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079A99 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $079A9B |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $079A9D |
  STZ !s_spr_gsu_morph_1_lo,x               ; $079A9F |
  STZ !s_spr_gsu_morph_2_lo,x               ; $079AA2 |
  STZ !s_spr_wildcard_1_lo,x                ; $079AA5 |
  STZ !s_spr_wildcard_2_lo,x                ; $079AA8 |
  LDA #$0000                                ; $079AAB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $079AAE |

CODE_079AB0:
  RTS                                       ; $079AB0 |

  dw $FE00, $0200                           ; $079AB1 |

CODE_079AB5:
  STZ !s_spr_x_speed_lo,x                   ; $079AB5 |
  TXA                                       ; $079AB8 |
  STA !gsu_r1                               ; $079AB9 |
  LDX #$09                                  ; $079ABC |
  LDA #$8F33                                ; $079ABE |
  JSL r_gsu_init_1                          ; $079AC1 | GSU init
  LDX $12                                   ; $079AC5 |
  LDY !gsu_r1                               ; $079AC7 | r1
  BMI CODE_079AF4                           ; $079ACA |
  LDA !s_spr_id,y                           ; $079ACC |
  CMP #$0022                                ; $079ACF |
  BCC CODE_079AF4                           ; $079AD2 |
  CMP #$0026                                ; $079AD4 |
  BCS CODE_079AF4                           ; $079AD7 |
  LDA !s_spr_x_hitbox_center,x              ; $079AD9 |
  SEC                                       ; $079ADC |
  SBC !s_spr_x_hitbox_center,y              ; $079ADD |
  STA $00                                   ; $079AE0 |
  LDA !s_spr_facing_dir,x                   ; $079AE2 |
  DEC A                                     ; $079AE5 |
  EOR $00                                   ; $079AE6 |
  BPL CODE_079AFF                           ; $079AE8 |

CODE_079AEA:
  LDY !s_spr_facing_dir,x                   ; $079AEA |
  LDA $9AB1,y                               ; $079AED |
  STA !s_spr_x_speed_lo,x                   ; $079AF0 |
  RTS                                       ; $079AF3 |

CODE_079AF4:
  LDA !s_spr_x_player_dir,x                 ; $079AF4 |
  AND #$00FF                                ; $079AF7 |
  CMP !s_spr_facing_dir,x                   ; $079AFA |
  BEQ CODE_079AEA                           ; $079AFD |

CODE_079AFF:
  LDA #$0002                                ; $079AFF |
  STA !s_spr_wildcard_6_lo_dp,x             ; $079B02 |
  LDA #$0003                                ; $079B04 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $079B07 |
  LDA #$0004                                ; $079B09 |
  STA !s_spr_timer_1,x                      ; $079B0C |
  STZ !s_spr_x_speed_lo,x                   ; $079B0F |
  RTS                                       ; $079B12 |

  db $00, $11, $11, $00                     ; $079B13 |

  LDX $12                                   ; $079B17 |
  JSR CODE_079A6F                           ; $079B19 |
  LDA !s_spr_timer_1,x                      ; $079B1C |
  BNE CODE_079B42                           ; $079B1F |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $079B21 |
  BMI CODE_079B43                           ; $079B23 |
  SEP #$20                                  ; $079B25 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $079B27 |
  LDA $9B13,y                               ; $079B29 |
  STA !s_spr_anim_frame,x                   ; $079B2C |
  LDA #$04                                  ; $079B2F |
  STA !s_spr_timer_1,x                      ; $079B31 |
  CPY #$01                                  ; $079B34 |
  BNE CODE_079B40                           ; $079B36 |
  LDA !s_spr_facing_dir,x                   ; $079B38 |
  EOR #$02                                  ; $079B3B |
  STA !s_spr_facing_dir,x                   ; $079B3D |

CODE_079B40:
  REP #$20                                  ; $079B40 |

CODE_079B42:
  RTS                                       ; $079B42 |

CODE_079B43:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079B43 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $079B45 |
  RTS                                       ; $079B47 |

CODE_079B48:
  LDA !s_spr_x_player_dir,x                 ; $079B48 |
  AND #$00FF                                ; $079B4B |
  CMP !s_spr_facing_dir,x                   ; $079B4E |
  BNE CODE_079B76                           ; $079B51 |
  LDA !s_spr_x_speed_lo,x                   ; $079B53 |
  BEQ CODE_079B6D                           ; $079B56 |
  STZ !s_spr_x_accel_ceiling,x              ; $079B58 |
  LDA #$0010                                ; $079B5B |
  STA !s_spr_x_accel,x                      ; $079B5E |
  LDA !s_spr_facing_dir,x                   ; $079B61 |
  DEC A                                     ; $079B64 |
  EOR !s_spr_x_speed_lo,x                   ; $079B65 |
  BMI CODE_079B73                           ; $079B68 |
  STZ !s_spr_x_speed_lo,x                   ; $079B6A |

CODE_079B6D:
  STZ !s_spr_x_accel,x                      ; $079B6D |
  JMP CODE_07976A                           ; $079B70 |

CODE_079B73:
  JMP CODE_0797B8                           ; $079B73 |

CODE_079B76:
  LDY !s_spr_facing_dir,x                   ; $079B76 |
  LDA $9610,y                               ; $079B79 |
  STA !s_spr_x_accel_ceiling,x              ; $079B7C |
  LDA #$0030                                ; $079B7F |
  STA !s_spr_x_accel,x                      ; $079B82 |
  JMP CODE_0797B8                           ; $079B85 |

CODE_079B88:
  TXA                                       ; $079B88 |
  STA !gsu_r1                               ; $079B89 |
  LDX #$09                                  ; $079B8C |
  LDA #$8F33                                ; $079B8E |
  JSL r_gsu_init_1                          ; $079B91 | GSU init
  LDX $12                                   ; $079B95 |
  LDY !gsu_r1                               ; $079B97 | r1
  BMI CODE_079BCB                           ; $079B9A |
  LDA !s_spr_id,y                           ; $079B9C |
  CMP #$0022                                ; $079B9F |
  BCC CODE_079BCB                           ; $079BA2 |
  CMP #$0026                                ; $079BA4 |
  BCS CODE_079BCB                           ; $079BA7 |
  LDA !s_spr_x_hitbox_center,x              ; $079BA9 |
  SEC                                       ; $079BAC |
  SBC !s_spr_x_hitbox_center,y              ; $079BAD |
  CLC                                       ; $079BB0 |
  ADC #$0100                                ; $079BB1 |
  CMP #$0200                                ; $079BB4 |
  BCS CODE_079BCB                           ; $079BB7 |
  LDA !s_spr_y_hitbox_center,x              ; $079BB9 |
  SEC                                       ; $079BBC |
  SBC !s_spr_y_hitbox_center,y              ; $079BBD |
  CLC                                       ; $079BC0 |
  ADC #$0100                                ; $079BC1 |
  CMP #$0200                                ; $079BC4 |
  BCS CODE_079BCB                           ; $079BC7 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $079BC9 |

CODE_079BCB:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $079BCB |
  BEQ CODE_079C2D                           ; $079BCD |
  BMI CODE_079C2D                           ; $079BCF |
  LDA !s_spr_state,y                        ; $079BD1 |
  CMP #$0010                                ; $079BD4 |
  BNE CODE_079C05                           ; $079BD7 |
  LDA !s_spr_id,y                           ; $079BD9 |
  CMP #$0022                                ; $079BDC |
  BCC CODE_079C05                           ; $079BDF |
  CMP #$0026                                ; $079BE1 |
  BCS CODE_079C05                           ; $079BE4 |
  LDA !s_spr_wildcard_6_lo,y                ; $079BE6 |
  BNE CODE_079C05                           ; $079BE9 |
  LDA !s_spr_cam_x_pos,y                    ; $079BEB |
  CLC                                       ; $079BEE |
  ADC #$0030                                ; $079BEF |
  CMP #$0150                                ; $079BF2 |
  BCS CODE_079C05                           ; $079BF5 |
  LDA !s_spr_cam_y_pos,y                    ; $079BF7 |
  CLC                                       ; $079BFA |
  ADC #$0030                                ; $079BFB |
  CMP #$0150                                ; $079BFE |
  BCS CODE_079C05                           ; $079C01 |
  BRA CODE_079C11                           ; $079C03 |

CODE_079C05:
  LDA #$0020                                ; $079C05 |
  STA !s_spr_timer_2,x                      ; $079C08 |
  LDY #$FF                                  ; $079C0B |
  STY !s_spr_wildcard_5_lo_dp,x             ; $079C0D |
  BRA CODE_079C1D                           ; $079C0F |

CODE_079C11:
  LDA !s_spr_cam_x_pos,x                    ; $079C11 |
  CLC                                       ; $079C14 |
  ADC #$0028                                ; $079C15 |
  CMP #$0128                                ; $079C18 |
  BCC CODE_079C2D                           ; $079C1B |

CODE_079C1D:
  STZ !s_spr_timer_2,x                      ; $079C1D |
  LDY #$00                                  ; $079C20 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $079C22 |
  STZ !s_spr_x_accel,x                      ; $079C24 |
  STZ !s_spr_x_speed_lo,x                   ; $079C27 |
  STZ !s_spr_x_accel_ceiling,x              ; $079C2A |

CODE_079C2D:
  RTS                                       ; $079C2D |

CODE_079C2E:
  LDA !s_spr_y_hitbox_center,x              ; $079C2E |
  SEC                                       ; $079C31 |
  SBC !s_player_center_y                    ; $079C32 |
  STA $08                                   ; $079C35 |
  LDA !s_spr_x_hitbox_center,x              ; $079C37 |
  SEC                                       ; $079C3A |
  SBC !s_player_center_x                    ; $079C3B |
  PHA                                       ; $079C3E |
  BPL CODE_079C45                           ; $079C3F |
  EOR #$FFFF                                ; $079C41 |
  INC A                                     ; $079C44 |

CODE_079C45:
  STA $04                                   ; $079C45 |
  PLA                                       ; $079C47 |
  CLC                                       ; $079C48 |
  ADC $00                                   ; $079C49 |
  CMP $02                                   ; $079C4B |
  BCS CODE_079C6C                           ; $079C4D |
  LDA $04                                   ; $079C4F |
  ASL A                                     ; $079C51 |
  STA $04                                   ; $079C52 |
  ASL A                                     ; $079C54 |
  STA $06                                   ; $079C55 |
  LDA $08                                   ; $079C57 |
  CLC                                       ; $079C59 |
  ADC $04                                   ; $079C5A |
  CMP $06                                   ; $079C5C |
  BCC CODE_079C6C                           ; $079C5E |
  LDA $08                                   ; $079C60 |
  CLC                                       ; $079C62 |
  ADC #$0020                                ; $079C63 |
  BPL CODE_079C6B                           ; $079C66 |
  SEC                                       ; $079C68 |
  BRA CODE_079C6C                           ; $079C69 |

CODE_079C6B:
  CLC                                       ; $079C6B |

CODE_079C6C:
  RTS                                       ; $079C6C |

  dw $0200, $FE00                           ; $079C6D |

CODE_079C71:
  LDY !s_spr_collision_id,x                 ; $079C71 |
  DEY                                       ; $079C74 |
  BMI CODE_079CB7                           ; $079C75 |
  BEQ CODE_079CB7                           ; $079C77 |
  LDA !s_spr_state,y                        ; $079C79 |
  CMP #$0010                                ; $079C7C |
  BNE CODE_079CB7                           ; $079C7F |
  LDA !s_spr_id,y                           ; $079C81 |
  CMP #$0022                                ; $079C84 |
  BCC CODE_079CB7                           ; $079C87 |
  CMP #$0026                                ; $079C89 |
  BCS CODE_079CB7                           ; $079C8C |
  LDA !s_spr_wildcard_6_lo,y                ; $079C8E |
  BNE CODE_079CB7                           ; $079C91 |
  LDA #$0001                                ; $079C93 |
  STA !s_spr_collision_state,y              ; $079C96 |
  LDA #$0040                                ; $079C99 |
  STA !s_spr_y_accel,y                      ; $079C9C |
  LDA #$FC00                                ; $079C9F |
  STA !s_spr_y_speed_lo,y                   ; $079CA2 |
  LDA !s_spr_x_collision_delta,x            ; $079CA5 |
  AND #$8000                                ; $079CA8 |
  ASL A                                     ; $079CAB |
  ROL A                                     ; $079CAC |
  ASL A                                     ; $079CAD |
  TAX                                       ; $079CAE |
  LDA $9C6D,x                               ; $079CAF |
  STA !s_spr_x_speed_lo,y                   ; $079CB2 |
  LDX $12                                   ; $079CB5 |

CODE_079CB7:
  RTS                                       ; $079CB7 |

  dw $0100, $FF00                           ; $079CB8 |

CODE_079CBC:
  LDA !s_spr_x_speed_lo,x                   ; $079CBC |
  BNE CODE_079CC9                           ; $079CBF |
  LDA $7860,x                               ; $079CC1 |
  BIT #$0001                                ; $079CC4 |
  BNE CODE_079CF6                           ; $079CC7 |

CODE_079CC9:
  TXA                                       ; $079CC9 |
  STA !gsu_r1                               ; $079CCA |
  LDX #$09                                  ; $079CCD |
  LDA #$9011                                ; $079CCF |
  JSL r_gsu_init_1                          ; $079CD2 | GSU init

CODE_079CD6:
  LDX $12                                   ; $079CD6 |
  LDY !gsu_r14                              ; $079CD8 | r14
  BMI CODE_079CF6                           ; $079CDB |
  BEQ CODE_079CF6                           ; $079CDD |
  LDA !s_spr_state,y                        ; $079CDF |
  CMP #$000E                                ; $079CE2 |
  BCC CODE_079CF7                           ; $079CE5 |
  LDA !s_spr_bitwise_settings_3,y           ; $079CE7 |
  BIT #$6000                                ; $079CEA |
  BNE CODE_079CF7                           ; $079CED |
  TYX                                       ; $079CEF |
  JSL $03B25B                               ; $079CF0 |
  LDX $12                                   ; $079CF4 |

CODE_079CF6:
  RTS                                       ; $079CF6 |

CODE_079CF7:
  LDX #$09                                  ; $079CF7 |
  LDA !gsu_r15                              ; $079CF9 |
  JSL r_gsu_init_1                          ; $079CFC | GSU init
  BRA CODE_079CD6                           ; $079D00 |
  LDA #$0001                                ; $079D02 |
  STA !s_spr_collision_state,y              ; $079D05 |
  LDA #$0400                                ; $079D08 |
  STA !s_spr_y_accel_ceiling,y              ; $079D0B |
  LDA #$0040                                ; $079D0E |
  STA !s_spr_y_accel,y                      ; $079D11 |
  LDA #$0000                                ; $079D14 |
  STA !s_spr_x_accel,y                      ; $079D17 |
  STA $7860,y                               ; $079D1A |
  STA !s_spr_wildcard_4_lo,y                ; $079D1D |
  LDA !s_spr_x_collision_delta,y            ; $079D20 |
  AND #$8000                                ; $079D23 |
  ASL A                                     ; $079D26 |
  ROL A                                     ; $079D27 |
  ASL A                                     ; $079D28 |
  TAX                                       ; $079D29 |
  LDA $9CB8,x                               ; $079D2A |
  STA !s_spr_x_speed_lo,y                   ; $079D2D |
  LDA #$FE00                                ; $079D30 |
  STA !s_spr_y_speed_lo,y                   ; $079D33 |
  LDX $12                                   ; $079D36 |
  RTS                                       ; $079D38 |

  dw $0008, $0004                           ; $079D39 |

CODE_079D3D:
  LDY $77C0,x                               ; $079D3D |
  BNE CODE_079D52                           ; $079D40 |
  JSL $07FC2A                               ; $079D42 |
  BCS CODE_079D49                           ; $079D46 |
  RTS                                       ; $079D48 |

CODE_079D49:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $079D49 |
  SEP #$20                                  ; $079D4B |
  INC $77C0,x                               ; $079D4D |
  REP #$20                                  ; $079D50 |

CODE_079D52:
  JSR CODE_079CBC                           ; $079D52 |
  JSR CODE_079EA0                           ; $079D55 |
  LDY !s_spr_collision_id,x                 ; $079D58 |
  BPL CODE_079D74                           ; $079D5B |
  LDA !s_player_y_speed                     ; $079D5D |
  BMI CODE_079D74                           ; $079D60 |
  LDA !s_player_tile_collision              ; $079D62 |
  AND #$0007                                ; $079D65 |
  BNE CODE_079D74                           ; $079D68 |
  LDA !s_spr_y_pixel_pos,x                  ; $079D6A |
  SEC                                       ; $079D6D |
  SBC #$0022                                ; $079D6E |
  STA !s_player_y                           ; $079D71 |

CODE_079D74:
  LDY !s_spr_wildcard_5_hi_dp,x             ; $079D74 |
  TYX                                       ; $079D76 |
  JMP ($9D7A,x)                             ; $079D77 |

  dw $9D82                                  ; $079D7A |
  dw $9E1F                                  ; $079D7C |
  dw $9E26                                  ; $079D7E |
  dw $9E3E                                  ; $079D80 |

  LDX $12                                   ; $079D82 |
  JSL $07FC2F                               ; $079D84 |
  BCC CODE_079DDD                           ; $079D88 |
  LDA !s_player_direction                   ; $079D8A |
  CMP !s_spr_facing_dir,x                   ; $079D8D |
  BEQ CODE_079DBE                           ; $079D90 |
  LDA $7860,x                               ; $079D92 |
  BIT #$0001                                ; $079D95 |
  BNE CODE_079DA2                           ; $079D98 |
  LDY $7862,x                               ; $079D9A |
  BEQ CODE_079E19                           ; $079D9D |
  LDA $7860,x                               ; $079D9F |

CODE_079DA2:
  LDY !s_spr_facing_dir,x                   ; $079DA2 |
  AND $9D39,y                               ; $079DA5 |
  BNE CODE_079E02                           ; $079DA8 |
  LDY !s_spr_facing_dir,x                   ; $079DAA |
  LDA $9610,y                               ; $079DAD |
  STA !s_spr_x_accel_ceiling,x              ; $079DB0 |
  LDA #$0008                                ; $079DB3 |
  STA !s_spr_x_accel,x                      ; $079DB6 |

CODE_079DB9:
  JSR CODE_0797B8                           ; $079DB9 |
  BRA CODE_079E1D                           ; $079DBC |

CODE_079DBE:
  JSR CODE_079E7E                           ; $079DBE |
  BNE CODE_079DB9                           ; $079DC1 |
  SEP #$20                                  ; $079DC3 |
  LDY #$02                                  ; $079DC5 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079DC7 |
  LDY #$03                                  ; $079DC9 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $079DCB |
  LDA $95F2,y                               ; $079DCD |
  STA !s_spr_timer_1,x                      ; $079DD0 |
  LDA $95E5,y                               ; $079DD3 |
  STA !s_spr_anim_frame,x                   ; $079DD6 |
  REP #$20                                  ; $079DD9 |
  BRA CODE_079E1D                           ; $079DDB |

CODE_079DDD:
  JSR CODE_079E7E                           ; $079DDD |
  BNE CODE_079DB9                           ; $079DE0 |
  LDA #$0000                                ; $079DE2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $079DE5 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $079DE7 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $079DE9 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $079DEB |
  STZ !s_spr_gsu_morph_1_lo,x               ; $079DED |
  STZ !s_spr_gsu_morph_2_lo,x               ; $079DF0 |
  STZ !s_spr_wildcard_1_lo,x                ; $079DF3 |
  STZ !s_spr_wildcard_2_lo,x                ; $079DF6 |
  SEP #$20                                  ; $079DF9 |
  STZ $77C0,x                               ; $079DFB |
  REP #$20                                  ; $079DFE |
  BRA CODE_079E1D                           ; $079E00 |

CODE_079E02:
  STZ !s_spr_x_accel,x                      ; $079E02 |
  SEP #$20                                  ; $079E05 |
  LDY #$04                                  ; $079E07 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079E09 |
  LDA #$06                                  ; $079E0B |
  STA !s_spr_timer_1,x                      ; $079E0D |
  LDA #$0D                                  ; $079E10 |
  STA !s_spr_anim_frame,x                   ; $079E12 |
  REP #$20                                  ; $079E15 |
  BRA CODE_079E1D                           ; $079E17 |

CODE_079E19:
  LDY #$06                                  ; $079E19 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079E1B |

CODE_079E1D:
  PLA                                       ; $079E1D |
  RTL                                       ; $079E1E |

  LDX $12                                   ; $079E1F |
  JSR CODE_0797EE                           ; $079E21 |
  BRA CODE_079E1D                           ; $079E24 |
  LDX $12                                   ; $079E26 |
  LDA !s_spr_timer_1,x                      ; $079E28 |
  BNE CODE_079E1D                           ; $079E2B |
  LDY !s_spr_facing_dir,x                   ; $079E2D |
  LDA $9976,y                               ; $079E30 |
  STA !s_spr_x_speed_lo,x                   ; $079E33 |
  LDA #$FA00                                ; $079E36 |
  STA !s_spr_y_speed_lo,x                   ; $079E39 |
  BRA CODE_079E19                           ; $079E3C |
  LDX $12                                   ; $079E3E |
  LDA !s_spr_x_speed_lo,x                   ; $079E40 |
  BNE CODE_079E4E                           ; $079E43 |
  LDY !s_spr_facing_dir,x                   ; $079E45 |
  LDA $9976,y                               ; $079E48 |
  STA !s_spr_x_speed_lo,x                   ; $079E4B |

CODE_079E4E:
  LDY $7862,x                               ; $079E4E |
  BNE CODE_079E78                           ; $079E51 |
  LDY #$04                                  ; $079E53 |
  LDA !s_spr_y_speed_lo,x                   ; $079E55 |
  CLC                                       ; $079E58 |
  ADC #$0100                                ; $079E59 |
  CMP #$0200                                ; $079E5C |
  BCC CODE_079E72                           ; $079E5F |
  LDY #$03                                  ; $079E61 |
  LDA !s_spr_y_speed_lo,x                   ; $079E63 |
  BMI CODE_079E72                           ; $079E66 |
  LDA $7860,x                               ; $079E68 |
  BIT #$0001                                ; $079E6B |
  BNE CODE_079E78                           ; $079E6E |
  LDY #$05                                  ; $079E70 |

CODE_079E72:
  TYA                                       ; $079E72 |
  STA !s_spr_anim_frame,x                   ; $079E73 |
  BRA CODE_079E1D                           ; $079E76 |

CODE_079E78:
  LDY #$00                                  ; $079E78 |
  STY !s_spr_wildcard_5_hi_dp,x             ; $079E7A |
  BRA CODE_079E1D                           ; $079E7C |

CODE_079E7E:
  STZ !s_spr_x_accel_ceiling,x              ; $079E7E |
  LDA #$0040                                ; $079E81 |
  STA !s_spr_x_accel,x                      ; $079E84 |
  LDA !s_spr_x_speed_lo,x                   ; $079E87 |
  BEQ CODE_079E97                           ; $079E8A |
  AND #$8000                                ; $079E8C |
  ASL A                                     ; $079E8F |
  ROL A                                     ; $079E90 |
  ASL A                                     ; $079E91 |
  EOR !s_spr_facing_dir,x                   ; $079E92 |
  BNE CODE_079E9F                           ; $079E95 |

CODE_079E97:
  STZ !s_spr_x_speed_lo,x                   ; $079E97 |
  STZ !s_spr_x_accel,x                      ; $079E9A |
  LDY #$00                                  ; $079E9D |

CODE_079E9F:
  RTS                                       ; $079E9F |

CODE_079EA0:
  LDY $7862,x                               ; $079EA0 |
  BEQ CODE_079EB2                           ; $079EA3 |
  LDA #$FF00                                ; $079EA5 |
  STA !s_spr_y_accel_ceiling,x              ; $079EA8 |
  LDA #$0020                                ; $079EAB |
  STA !s_spr_y_accel,x                      ; $079EAE |
  RTS                                       ; $079EB1 |

CODE_079EB2:
  LDA #$0400                                ; $079EB2 |
  STA !s_spr_y_accel_ceiling,x              ; $079EB5 |
  LDA #$0040                                ; $079EB8 |
  STA !s_spr_y_accel,x                      ; $079EBB |
  RTS                                       ; $079EBE |

  db $00, $01, $02, $03, $04, $05, $06, $07 ; $079EBF |
  db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F ; $079EC7 |
  db $10, $11, $12, $13, $12, $11, $14, $15 ; $079ECF |
  db $05, $18, $19, $1A, $19, $1B, $19, $1A ; $079ED7 |
  db $19, $1B, $19, $1A, $19, $1B, $19, $19 ; $079EDF |
  db $1C, $1D, $1C                          ; $079EE7 |

  db $04, $04, $10, $04, $04, $04, $20, $03 ; $079EEA |
  db $02, $01, $01, $01, $10, $04, $04, $04 ; $079EF2 |
  db $04, $10, $00, $00, $02, $00, $04, $00 ; $079EFA |
  db $08, $00                               ; $079F02 |

  dw $FFA0, $0060                           ; $079F04 |

  dw $0006, $FFFA                           ; $079F08 |

  dw $0001, $FFFF                           ; $079F0C |

  dw $FFFD, $0003, $FFFE, $0002             ; $079F10 |
  dw $FFFE, $0002, $FFFD, $0003             ; $079F18 |
  dw $FFFD, $0003, $FFFE, $0002             ; $079F20 |
  dw $FFFC, $0004, $FFFC, $0004             ; $079F28 |
  dw $0000, $0000, $0002, $FFFE             ; $079F30 |
  dw $0003, $FFFD, $0005, $FFFB             ; $079F38 |
  dw $0009, $FFF7, $000F, $FFF1             ; $079F40 |
  dw $000F, $FFF1, $000C, $FFF4             ; $079F48 |
  dw $FFFF, $0001, $FFF8, $0008             ; $079F50 |
  dw $FFF8, $0008, $FFF8, $0008             ; $079F58 |
  dw $FFFA, $0006, $FFFD, $0003             ; $079F60 |
  dw $FFEC, $0014, $FFF6, $000A             ; $079F68 |
  dw $FFF8, $FFF8, $FFF7, $FFF7             ; $079F70 |
  dw $FFF6, $FFF6, $FFF7, $FFF7             ; $079F78 |
  dw $FFF8, $FFF8, $FFF8, $FFF8             ; $079F80 |
  dw $FFF8, $FFF8, $FFF7, $FFF7             ; $079F88 |
  dw $FFF7, $FFF7, $FFF5, $FFF5             ; $079F90 |
  dw $FFF6, $FFF6, $FFF7, $FFF7             ; $079F98 |
  dw $FFF7, $FFF7, $FFFD, $FFFD             ; $079FA0 |
  dw $FFFB, $FFFB, $FFF8, $FFF8             ; $079FA8 |
  dw $FFF0, $FFF0, $FFF8, $FFF8             ; $079FB0 |
  dw $FFFA, $FFFA, $FFFB, $FFFB             ; $079FB8 |
  dw $FFF8, $FFF8, $FFF7, $FFF7             ; $079FC0 |
  dw $FFFC, $FFFC, $FFEA, $FFEA             ; $079FC8 |

init_green_glove:
  LDA #$FFFF                                ; $079FD0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $079FD3 |
  STZ !s_spr_wildcard_1_lo,x                ; $079FD5 |
  JSR CODE_07A0EB                           ; $079FD8 |
  RTL                                       ; $079FDB |

main_green_glove:
  LDA !s_spr_state,x                        ; $079FDC |
  CMP #$0010                                ; $079FDF |
  BNE CODE_079FE9                           ; $079FE2 |
  LDA !s_spr_timer_frozen,x                 ; $079FE4 |
  BEQ CODE_07A022                           ; $079FE7 |

CODE_079FE9:
  LDA !s_spr_oam_1,x                        ; $079FE9 |
  ORA #$0004                                ; $079FEC |
  LDA !s_spr_oam_1,x                        ; $079FEF |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $079FF2 |
  BMI CODE_07A022                           ; $079FF4 |
  LDA #$0040                                ; $079FF6 |
  STA !s_spr_y_accel,y                      ; $079FF9 |
  LDA #$0001                                ; $079FFC |
  STA !s_spr_collision_state,y              ; $079FFF |
  STA !s_spr_draw_priority,y                ; $07A002 |
  LDA #$0000                                ; $07A005 |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A008 |
  LDA !s_spr_bitwise_settings_1,y           ; $07A00B |
  AND #$FFBF                                ; $07A00E |
  STA !s_spr_bitwise_settings_1,y           ; $07A011 |
  LDA !s_spr_oam_1,y                        ; $07A014 |
  ORA #$0004                                ; $07A017 |
  STA !s_spr_oam_1,y                        ; $07A01A |
  LDA #$FFFF                                ; $07A01D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A020 |

CODE_07A022:
  JSL $03AF23                               ; $07A022 |
  LDA !s_spr_oam_1,x                        ; $07A026 |
  AND #$000C                                ; $07A029 |
  BNE CODE_07A040                           ; $07A02C |
  JSL $03A2F8                               ; $07A02E |
  BCC CODE_07A040                           ; $07A032 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A034 |
  BMI CODE_07A03F                           ; $07A036 |
  TYX                                       ; $07A038 |
  JSL $03A31E                               ; $07A039 |
  LDX $12                                   ; $07A03D |

CODE_07A03F:
  RTL                                       ; $07A03F |

CODE_07A040:
  LDA !s_spr_anim_frame,x                   ; $07A040 |
  CMP #$000D                                ; $07A043 |
  BNE CODE_07A059                           ; $07A046 |
  LDA $14                                   ; $07A048 |
  AND #$0006                                ; $07A04A |
  TAY                                       ; $07A04D |
  LDA !s_spr_oam_yxppccct,x                 ; $07A04E |
  AND #$FFF1                                ; $07A051 |
  ORA $9EFC,y                               ; $07A054 |
  BRA CODE_07A05F                           ; $07A057 |

CODE_07A059:
  LDA !s_spr_oam_yxppccct,x                 ; $07A059 |
  AND #$FFF1                                ; $07A05C |

CODE_07A05F:
  STA !s_spr_oam_yxppccct,x                 ; $07A05F |
  LDA !s_spr_wildcard_1_lo,x                ; $07A062 |
  BEQ CODE_07A06A                           ; $07A065 |
  JMP CODE_07A54E                           ; $07A067 |

CODE_07A06A:
  LDA !s_super_mario_timer                  ; $07A06A |
  BNE CODE_07A075                           ; $07A06D |
  JSL $07FC2A                               ; $07A06F |
  BCS CODE_07A080                           ; $07A073 |

CODE_07A075:
  JSL $03A5B7                               ; $07A075 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07A079 |
  TAX                                       ; $07A07B |
  JSR ($A0E1,x)                             ; $07A07C |
  RTL                                       ; $07A07F |

CODE_07A080:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A080 |
  BMI CODE_07A0B0                           ; $07A082 |
  LDA #$0040                                ; $07A084 |
  STA !s_spr_y_accel,y                      ; $07A087 |
  LDA #$0001                                ; $07A08A |
  STA !s_spr_collision_state,y              ; $07A08D |
  STA !s_spr_draw_priority,y                ; $07A090 |
  LDA #$0000                                ; $07A093 |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A096 |
  LDA !s_spr_bitwise_settings_1,y           ; $07A099 |
  AND #$FFBF                                ; $07A09C |
  STA !s_spr_bitwise_settings_1,y           ; $07A09F |
  LDA !s_spr_oam_1,y                        ; $07A0A2 |
  ORA #$0004                                ; $07A0A5 |
  STA !s_spr_oam_1,y                        ; $07A0A8 |
  LDA #$FFFF                                ; $07A0AB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A0AE |

CODE_07A0B0:
  LDY !s_spr_x_player_dir,x                 ; $07A0B0 |
  LDA $88CF,y                               ; $07A0B3 |
  STA !s_player_x_speed_prev                ; $07A0B6 |
  STA !s_player_x_speed                     ; $07A0B9 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A0BC |
  BMI CODE_07A0D8                           ; $07A0BE |
  LDA !s_spr_bitwise_settings_1,y           ; $07A0C0 |
  AND #$FFBF                                ; $07A0C3 |
  STA !s_spr_bitwise_settings_1,y           ; $07A0C6 |
  LDA #$0000                                ; $07A0C9 |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A0CC |
  STA !s_spr_collision_state,y              ; $07A0CF |
  LDA #$0040                                ; $07A0D2 |
  STA !s_spr_y_accel,x                      ; $07A0D5 |

CODE_07A0D8:
  LDA #$9ED8                                ; $07A0D8 |
  STA $00                                   ; $07A0DB |
  JSR CODE_07A580                           ; $07A0DD |
  RTL                                       ; $07A0E0 |

  dw $A111                                  ; $07A0E1 |
  dw $A230                                  ; $07A0E3 |
  dw $A31B                                  ; $07A0E5 |
  dw $A38D                                  ; $07A0E7 |
  dw $A355                                  ; $07A0E9 |

CODE_07A0EB:
  LDY !s_spr_facing_dir,x                   ; $07A0EB |
  LDA $9F04,y                               ; $07A0EE |
  STA !s_spr_x_speed_lo,x                   ; $07A0F1 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07A0F4 |
  LDA $9EBF                                 ; $07A0F6 |
  AND #$00FF                                ; $07A0F9 |
  STA !s_spr_anim_frame,x                   ; $07A0FC |
  LDA #$0004                                ; $07A0FF |
  STA !s_spr_timer_1,x                      ; $07A102 |
  LDA #$007C                                ; $07A105 |
  STA !s_spr_timer_2,x                      ; $07A108 |
  LDA #$0000                                ; $07A10B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A10E |
  RTS                                       ; $07A110 |

  LDX $12                                   ; $07A111 |
  JSR CODE_07A538                           ; $07A113 |
  BMI CODE_07A129                           ; $07A116 |
  JSL $07FC1F                               ; $07A118 |
  BPL CODE_07A126                           ; $07A11C |
  LDA !s_spr_x_player_dir,x                 ; $07A11E |
  AND #$00FF                                ; $07A121 |
  STA $02                                   ; $07A124 |

CODE_07A126:
  JMP CODE_07A202                           ; $07A126 |

CODE_07A129:
  JSR CODE_07A171                           ; $07A129 |
  LDA $7860,x                               ; $07A12C |
  BIT #$0001                                ; $07A12F |
  BEQ CODE_07A139                           ; $07A132 |
  AND #$000C                                ; $07A134 |
  BEQ CODE_07A146                           ; $07A137 |

CODE_07A139:
  LDA !s_spr_x_pixel_pos,x                  ; $07A139 |
  SEC                                       ; $07A13C |
  SBC !s_spr_x_delta_lo,x                   ; $07A13D |
  STA !s_spr_x_pixel_pos,x                  ; $07A140 |
  JMP CODE_07A1EB                           ; $07A143 |

CODE_07A146:
  LDA !s_spr_timer_1,x                      ; $07A146 |
  BNE CODE_07A170                           ; $07A149 |
  LDA !s_spr_timer_2,x                      ; $07A14B |
  BNE CODE_07A153                           ; $07A14E |
  JSR CODE_07A1EB                           ; $07A150 |

CODE_07A153:
  SEP #$20                                  ; $07A153 |
  LDA !s_spr_wildcard_4_lo,x                ; $07A155 |
  INC A                                     ; $07A158 |
  CMP #$05                                  ; $07A159 |
  BCC CODE_07A15F                           ; $07A15B |
  LDA #$00                                  ; $07A15D |

CODE_07A15F:
  STA !s_spr_wildcard_4_lo,x                ; $07A15F |
  TAY                                       ; $07A162 |
  LDA $9EBF,y                               ; $07A163 |
  STA !s_spr_anim_frame,x                   ; $07A166 |
  LDA #$04                                  ; $07A169 |
  STA !s_spr_timer_1,x                      ; $07A16B |
  REP #$20                                  ; $07A16E |

CODE_07A170:
  RTS                                       ; $07A170 |

CODE_07A171:
  LDY !s_spr_collision_id,x                 ; $07A171 |
  DEY                                       ; $07A174 |
  BEQ CODE_07A1EA                           ; $07A175 |
  BMI CODE_07A1EA                           ; $07A177 |
  LDA !s_spr_state,y                        ; $07A179 |
  CMP #$0010                                ; $07A17C |
  BNE CODE_07A1EA                           ; $07A17F |
  LDA !s_spr_id,y                           ; $07A181 |
  CMP #$0022                                ; $07A184 |
  BCC CODE_07A1EA                           ; $07A187 |
  CMP #$002C                                ; $07A189 |
  BCS CODE_07A1EA                           ; $07A18C |
  LDA !s_spr_wildcard_6_lo,y                ; $07A18E |
  BNE CODE_07A1EA                           ; $07A191 |
  LDA !s_spr_gsu_morph_1_lo,y               ; $07A193 |
  BMI CODE_07A1EA                           ; $07A196 |
  LDA #$0005                                ; $07A198 |
  STA !s_spr_draw_priority,y                ; $07A19B |
  LDA #$0000                                ; $07A19E |
  STA !s_spr_x_accel,y                      ; $07A1A1 |
  STA !s_spr_y_accel,y                      ; $07A1A4 |
  STA !s_spr_x_speed_lo,y                   ; $07A1A7 |
  STA !s_spr_y_speed_lo,y                   ; $07A1AA |
  STA !s_spr_collision_state,y              ; $07A1AD |
  STA !s_spr_anim_frame,y                   ; $07A1B0 |
  LDA !s_spr_bitwise_settings_1,y           ; $07A1B3 |
  ORA #$0040                                ; $07A1B6 |
  STA !s_spr_bitwise_settings_1,y           ; $07A1B9 |
  LDA !s_spr_bitwise_settings_3,y           ; $07A1BC |
  AND #$FFE0                                ; $07A1BF |
  STA !s_spr_bitwise_settings_3,y           ; $07A1C2 |
  LDA !s_spr_oam_1,y                        ; $07A1C5 |
  AND #$FFF3                                ; $07A1C8 |
  STA !s_spr_oam_1,y                        ; $07A1CB |
  LDA #$FFFF                                ; $07A1CE |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A1D1 |
  TYA                                       ; $07A1D4 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A1D5 |
  STZ !s_spr_x_speed_lo,x                   ; $07A1D7 |
  STZ !s_spr_x_accel,x                      ; $07A1DA |
  LDA !s_spr_oam_1,x                        ; $07A1DD |
  AND #$FFF3                                ; $07A1E0 |
  STA !s_spr_oam_1,x                        ; $07A1E3 |
  PLA                                       ; $07A1E6 |
  JMP CODE_07A302                           ; $07A1E7 |

CODE_07A1EA:
  RTS                                       ; $07A1EA |

CODE_07A1EB:
  LDA !s_spr_facing_dir,x                   ; $07A1EB |
  EOR #$0002                                ; $07A1EE |
  STA !s_spr_facing_dir,x                   ; $07A1F1 |
  TAY                                       ; $07A1F4 |
  LDA $9F04,y                               ; $07A1F5 |
  STA !s_spr_x_speed_lo,x                   ; $07A1F8 |
  LDA #$007C                                ; $07A1FB |
  STA !s_spr_timer_2,x                      ; $07A1FE |
  RTS                                       ; $07A201 |

CODE_07A202:
  STZ !s_spr_x_speed_lo,x                   ; $07A202 |
  LDA $02                                   ; $07A205 |
  STA !s_spr_facing_dir,x                   ; $07A207 |
  LDA #$0016                                ; $07A20A |
  STA !s_spr_anim_frame,x                   ; $07A20D |
  LDA #$0002                                ; $07A210 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A213 |
  STZ !s_spr_timer_1,x                      ; $07A215 |

CODE_07A218:
  LDA $7860,x                               ; $07A218 |
  BIT #$0001                                ; $07A21B |
  BEQ CODE_07A225                           ; $07A21E |
  AND #$000C                                ; $07A220 |
  BEQ CODE_07A22F                           ; $07A223 |

CODE_07A225:
  LDA !s_spr_x_pixel_pos,x                  ; $07A225 |
  SEC                                       ; $07A228 |
  SBC !s_spr_x_delta_lo,x                   ; $07A229 |
  STA !s_spr_x_pixel_pos,x                  ; $07A22C |

CODE_07A22F:
  RTS                                       ; $07A22F |

  LDX $12                                   ; $07A230 |
  LDY !s_spr_collision_id,x                 ; $07A232 |
  DEY                                       ; $07A235 |
  BEQ CODE_07A23A                           ; $07A236 |
  BPL CODE_07A23D                           ; $07A238 |

CODE_07A23A:
  JMP CODE_07A2DB                           ; $07A23A |

CODE_07A23D:
  LDA !s_spr_state,y                        ; $07A23D |
  CMP #$0010                                ; $07A240 |
  BNE CODE_07A23A                           ; $07A243 |
  LDA !s_spr_collision_state,y              ; $07A245 |
  BEQ CODE_07A23A                           ; $07A248 |
  JSL $07FC0D                               ; $07A24A |
  BPL CODE_07A253                           ; $07A24E |

CODE_07A250:
  JMP CODE_07A2DB                           ; $07A250 |

CODE_07A253:
  LDA !s_spr_id,y                           ; $07A253 |
  CMP #$0022                                ; $07A256 |
  BCC CODE_07A250                           ; $07A259 |
  CMP #$002C                                ; $07A25B |
  BCS CODE_07A2DB                           ; $07A25E |
  LDA !s_spr_y_accel,y                      ; $07A260 |
  CMP #$0040                                ; $07A263 |
  BCS CODE_07A278                           ; $07A266 |
  LDA !s_spr_x_speed_lo,y                   ; $07A268 |
  CMP #$8000                                ; $07A26B |
  ROR A                                     ; $07A26E |
  STA !s_spr_x_speed_lo,x                   ; $07A26F |
  LDA #$0040                                ; $07A272 |
  STA !s_spr_x_accel,x                      ; $07A275 |

CODE_07A278:
  LDA #$0005                                ; $07A278 |
  STA !s_spr_draw_priority,y                ; $07A27B |
  LDA #$0000                                ; $07A27E |
  STA !s_spr_x_accel,y                      ; $07A281 |
  STA !s_spr_y_accel,y                      ; $07A284 |
  STA !s_spr_x_speed_lo,y                   ; $07A287 |
  STA !s_spr_y_speed_lo,y                   ; $07A28A |
  STA !s_spr_collision_state,y              ; $07A28D |
  STA !s_spr_anim_frame,y                   ; $07A290 |
  LDA #$FFFF                                ; $07A293 |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A296 |
  LDA !s_spr_bitwise_settings_1,y           ; $07A299 |
  ORA #$0040                                ; $07A29C |
  STA !s_spr_bitwise_settings_1,y           ; $07A29F |
  LDA !s_spr_bitwise_settings_3,y           ; $07A2A2 |
  AND #$FFE0                                ; $07A2A5 |
  STA !s_spr_bitwise_settings_3,y           ; $07A2A8 |
  LDA !s_spr_oam_1,y                        ; $07A2AB |
  AND #$FFF3                                ; $07A2AE |
  STA !s_spr_oam_1,y                        ; $07A2B1 |
  TYA                                       ; $07A2B4 |
  AND #$00FF                                ; $07A2B5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A2B8 |
  LDA !s_spr_oam_1,x                        ; $07A2BA |
  AND #$FFF3                                ; $07A2BD |
  STA !s_spr_oam_1,x                        ; $07A2C0 |
  LDA !s_spr_y_hitbox_center,x              ; $07A2C3 |
  SEC                                       ; $07A2C6 |
  SBC #$0010                                ; $07A2C7 |
  SEC                                       ; $07A2CA |
  SBC !s_spr_y_hitbox_center,y              ; $07A2CB |
  BCC CODE_07A2D5                           ; $07A2CE |
  JSR CODE_07A4D3                           ; $07A2D0 |
  BRA CODE_07A2D8                           ; $07A2D3 |

CODE_07A2D5:
  JSR CODE_07A474                           ; $07A2D5 |

CODE_07A2D8:
  JMP CODE_07A342                           ; $07A2D8 |

CODE_07A2DB:
  LDA !s_spr_timer_1,x                      ; $07A2DB |
  BNE CODE_07A2FE                           ; $07A2DE |
  JSR CODE_07A538                           ; $07A2E0 |
  BMI CODE_07A2FF                           ; $07A2E3 |
  JSL $07FC1F                               ; $07A2E5 |
  BPL CODE_07A2F3                           ; $07A2E9 |
  LDA !s_spr_x_player_dir,x                 ; $07A2EB |
  AND #$00FF                                ; $07A2EE |
  STA $02                                   ; $07A2F1 |

CODE_07A2F3:
  LDA $02                                   ; $07A2F3 |
  STA !s_spr_facing_dir,x                   ; $07A2F5 |
  LDA #$0040                                ; $07A2F8 |
  STA !s_spr_timer_1,x                      ; $07A2FB |

CODE_07A2FE:
  RTS                                       ; $07A2FE |

CODE_07A2FF:
  JMP CODE_07A0EB                           ; $07A2FF |

CODE_07A302:
  LDA #$0004                                ; $07A302 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A305 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07A307 |
  LDA $9EC4                                 ; $07A309 |
  AND #$00FF                                ; $07A30C |
  STA !s_spr_anim_frame,x                   ; $07A30F |
  LDA #$0004                                ; $07A312 |
  STA !s_spr_timer_1,x                      ; $07A315 |
  JMP CODE_07A3C4                           ; $07A318 |
  LDX $12                                   ; $07A31B |
  LDA !s_spr_timer_1,x                      ; $07A31D |
  BNE CODE_07A33F                           ; $07A320 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07A322 |
  INC A                                     ; $07A324 |
  CMP #$0002                                ; $07A325 |
  BCC CODE_07A32D                           ; $07A328 |
  JMP CODE_07A372                           ; $07A32A |

CODE_07A32D:
  STA !s_spr_wildcard_4_lo_dp,x             ; $07A32D |
  TAY                                       ; $07A32F |
  LDA $9EC4,y                               ; $07A330 |
  AND #$00FF                                ; $07A333 |
  STA !s_spr_anim_frame,x                   ; $07A336 |
  LDA #$0004                                ; $07A339 |
  STA !s_spr_timer_1,x                      ; $07A33C |

CODE_07A33F:
  JMP CODE_07A3C4                           ; $07A33F |

CODE_07A342:
  LDA #$0023                                ; $07A342 |\ play sound #$0023
  JSL push_sound_queue                      ; $07A345 |/
  LDA #$0008                                ; $07A349 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A34C |
  LDA #$003E                                ; $07A34E |
  STA !s_spr_timer_1,x                      ; $07A351 |
  RTS                                       ; $07A354 |

  LDX $12                                   ; $07A355 |
  LDA !s_spr_x_speed_lo,x                   ; $07A357 |
  BEQ CODE_07A367                           ; $07A35A |
  LDA !s_spr_facing_dir,x                   ; $07A35C |
  LSR A                                     ; $07A35F |
  LSR A                                     ; $07A360 |
  ROR A                                     ; $07A361 |
  EOR !s_spr_x_speed_lo,x                   ; $07A362 |
  BPL CODE_07A3C4                           ; $07A365 |

CODE_07A367:
  STZ !s_spr_x_speed_lo,x                   ; $07A367 |
  STZ !s_spr_x_accel,x                      ; $07A36A |
  LDA !s_spr_timer_1,x                      ; $07A36D |
  BNE CODE_07A3C4                           ; $07A370 |

CODE_07A372:
  LDA #$0006                                ; $07A372 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A375 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07A377 |
  LDA $9EC6                                 ; $07A379 |
  AND #$00FF                                ; $07A37C |
  STA !s_spr_anim_frame,x                   ; $07A37F |
  LDA $9EEA                                 ; $07A382 |
  AND #$00FF                                ; $07A385 |
  STA !s_spr_timer_1,x                      ; $07A388 |
  BRA CODE_07A3C4                           ; $07A38B |
  LDX $12                                   ; $07A38D |
  LDA !s_spr_x_player_dir,x                 ; $07A38F |
  STA !s_spr_facing_dir,x                   ; $07A392 |
  LDA !s_spr_timer_1,x                      ; $07A395 |
  BNE CODE_07A3B7                           ; $07A398 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07A39A |
  INC A                                     ; $07A39C |
  CMP #$0012                                ; $07A39D |
  BCS CODE_07A3EC                           ; $07A3A0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07A3A2 |
  TAY                                       ; $07A3A4 |
  LDA $9EC6,y                               ; $07A3A5 |
  AND #$00FF                                ; $07A3A8 |
  STA !s_spr_anim_frame,x                   ; $07A3AB |
  LDA $9EEA,y                               ; $07A3AE |
  AND #$00FF                                ; $07A3B1 |
  STA !s_spr_timer_1,x                      ; $07A3B4 |

CODE_07A3B7:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07A3B7 |
  CMP #$000B                                ; $07A3B9 |
  BEQ CODE_07A3EF                           ; $07A3BC |
  BCS CODE_07A3EB                           ; $07A3BE |
  JSL $0EB14D                               ; $07A3C0 |

CODE_07A3C4:
  LDA !s_spr_anim_frame,x                   ; $07A3C4 |
  ASL A                                     ; $07A3C7 |
  ASL A                                     ; $07A3C8 |
  ORA !s_spr_facing_dir,x                   ; $07A3C9 |
  TAY                                       ; $07A3CC |
  LDA $9F10,y                               ; $07A3CD |
  STA $00                                   ; $07A3D0 |
  LDA $9F70,y                               ; $07A3D2 |
  STA $02                                   ; $07A3D5 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A3D7 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A3D9 |
  CLC                                       ; $07A3DC |
  ADC $00                                   ; $07A3DD |
  STA !s_spr_x_pixel_pos,y                  ; $07A3DF |
  LDA !s_spr_y_pixel_pos,x                  ; $07A3E2 |
  CLC                                       ; $07A3E5 |
  ADC $02                                   ; $07A3E6 |
  STA !s_spr_y_pixel_pos,y                  ; $07A3E8 |

CODE_07A3EB:
  RTS                                       ; $07A3EB |

CODE_07A3EC:
  JMP CODE_07A0EB                           ; $07A3EC |

CODE_07A3EF:
  JSL $0EB148                               ; $07A3EF |
  LDA !s_player_center_x                    ; $07A3F3 |
  STA !gsu_r1                               ; $07A3F6 |
  LDA !s_player_center_y                    ; $07A3F9 |
  STA !gsu_r2                               ; $07A3FC |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A3FF |
  LDA !s_spr_x_hitbox_center,y              ; $07A401 |
  STA !gsu_r3                               ; $07A404 |
  LDA !s_spr_y_hitbox_center,y              ; $07A407 |
  STA !gsu_r4                               ; $07A40A |
  LDA #$06F0                                ; $07A40D |
  STA !gsu_r6                               ; $07A410 |
  LDX #$09                                  ; $07A413 |
  LDA #$907C                                ; $07A415 |
  JSL r_gsu_init_1                          ; $07A418 | GSU init
  LDX $12                                   ; $07A41C |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07A41E |
  LDA !gsu_r1                               ; $07A420 |
  STA !s_spr_x_speed_lo,y                   ; $07A423 |
  LDA !gsu_r2                               ; $07A426 |
  STA !s_spr_y_speed_lo,y                   ; $07A429 |
  LDA #$0001                                ; $07A42C |
  STA !s_spr_y_accel,y                      ; $07A42F |
  STA !s_spr_collision_state,y              ; $07A432 |
  LDA #$0001                                ; $07A435 |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A438 |
  STA !s_spr_draw_priority,y                ; $07A43B |
  SEP #$20                                  ; $07A43E |
  STA $77C0,y                               ; $07A440 |
  REP #$20                                  ; $07A443 |
  LDA !s_spr_bitwise_settings_1,y           ; $07A445 |
  AND #$FFBF                                ; $07A448 |
  STA !s_spr_bitwise_settings_1,y           ; $07A44B |
  LDA !s_spr_oam_1,y                        ; $07A44E |
  ORA #$0004                                ; $07A451 |
  STA !s_spr_oam_1,y                        ; $07A454 |
  LDA #$FFFF                                ; $07A457 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A45A |
  LDA !s_spr_oam_1,x                        ; $07A45C |
  ORA #$0004                                ; $07A45F |
  STA !s_spr_oam_1,x                        ; $07A462 |
  LDA #$0020                                ; $07A465 |\ play sound #$0020
  JSL push_sound_queue                      ; $07A468 |/
  LDA #$004A                                ; $07A46C |\ play sound #$004A
  JSL push_sound_queue                      ; $07A46F |/
  RTS                                       ; $07A473 |

CODE_07A474:
  PHY                                       ; $07A474 |
  LDA !s_spr_anim_frame,x                   ; $07A475 |
  ASL A                                     ; $07A478 |
  ASL A                                     ; $07A479 |
  ORA !s_spr_facing_dir,x                   ; $07A47A |
  TAY                                       ; $07A47D |
  LDA $9F10,y                               ; $07A47E |
  STA $00                                   ; $07A481 |
  LDA $9F70,y                               ; $07A483 |
  STA $02                                   ; $07A486 |
  PLY                                       ; $07A488 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A489 |
  CLC                                       ; $07A48C |
  ADC $00                                   ; $07A48D |
  STA !s_spr_x_pixel_pos,y                  ; $07A48F |
  LDA !s_spr_y_pixel_pos,x                  ; $07A492 |
  CLC                                       ; $07A495 |
  ADC $02                                   ; $07A496 |
  STA !s_spr_y_pixel_pos,y                  ; $07A498 |
  LDY !s_spr_facing_dir,x                   ; $07A49B |
  LDA $9F08,y                               ; $07A49E |
  STA $00                                   ; $07A4A1 |
  LDA #$01F6                                ; $07A4A3 |
  JSL spawn_ambient_sprite                  ; $07A4A6 |
  LDA !s_spr_facing_dir,x                   ; $07A4AA |
  STA $73C0,y                               ; $07A4AD |
  LDA !s_spr_x_pixel_pos,x                  ; $07A4B0 |
  SEC                                       ; $07A4B3 |
  SBC $00                                   ; $07A4B4 |
  STA $70A2,y                               ; $07A4B6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07A4B9 |
  SEC                                       ; $07A4BC |
  SBC #$0007                                ; $07A4BD |
  STA $7142,y                               ; $07A4C0 |
  LDA #$0002                                ; $07A4C3 |
  STA $7E4C,y                               ; $07A4C6 |
  STA $7782,y                               ; $07A4C9 |
  LDA #$0005                                ; $07A4CC |
  STA $7E4E,y                               ; $07A4CF |
  RTS                                       ; $07A4D2 |

CODE_07A4D3:
  LDA #$0017                                ; $07A4D3 |
  STA !s_spr_anim_frame,x                   ; $07A4D6 |
  PHY                                       ; $07A4D9 |
  LDA !s_spr_anim_frame,x                   ; $07A4DA |
  ASL A                                     ; $07A4DD |
  ASL A                                     ; $07A4DE |
  ORA !s_spr_facing_dir,x                   ; $07A4DF |
  TAY                                       ; $07A4E2 |
  LDA $9F10,y                               ; $07A4E3 |
  STA $00                                   ; $07A4E6 |
  LDA $9F70,y                               ; $07A4E8 |
  STA $02                                   ; $07A4EB |
  PLY                                       ; $07A4ED |
  LDA !s_spr_x_pixel_pos,x                  ; $07A4EE |
  CLC                                       ; $07A4F1 |
  ADC $00                                   ; $07A4F2 |
  STA !s_spr_x_pixel_pos,y                  ; $07A4F4 |
  LDA !s_spr_y_pixel_pos,x                  ; $07A4F7 |
  CLC                                       ; $07A4FA |
  ADC $02                                   ; $07A4FB |
  STA !s_spr_y_pixel_pos,y                  ; $07A4FD |
  LDY !s_spr_facing_dir,x                   ; $07A500 |
  LDA $9F0C,y                               ; $07A503 |
  STA $00                                   ; $07A506 |
  LDA #$01F9                                ; $07A508 |
  JSL spawn_ambient_sprite                  ; $07A50B |
  LDA !s_spr_facing_dir,x                   ; $07A50F |
  STA $73C0,y                               ; $07A512 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A515 |
  SEC                                       ; $07A518 |
  SBC $00                                   ; $07A519 |
  STA $70A2,y                               ; $07A51B |
  LDA !s_spr_y_pixel_pos,x                  ; $07A51E |
  SEC                                       ; $07A521 |
  SBC #$000B                                ; $07A522 |
  STA $7142,y                               ; $07A525 |
  LDA #$0002                                ; $07A528 |
  STA $7E4C,y                               ; $07A52B |
  STA $7782,y                               ; $07A52E |
  LDA #$0005                                ; $07A531 |
  STA $7E4E,y                               ; $07A534 |
  RTS                                       ; $07A537 |

CODE_07A538:
  LDA #$0030                                ; $07A538 |
  STA $04                                   ; $07A53B |
  ASL A                                     ; $07A53D |
  STA $06                                   ; $07A53E |
  LDA #$0020                                ; $07A540 |
  STA $08                                   ; $07A543 |
  CLC                                       ; $07A545 |
  ADC #$0030                                ; $07A546 |
  STA $0A                                   ; $07A549 |
  JMP CODE_078CF1                           ; $07A54B |

CODE_07A54E:
  LDY !s_spr_collision_id,x                 ; $07A54E |
  BPL CODE_07A565                           ; $07A551 |
  LDA !s_super_mario_timer                  ; $07A553 |
  BEQ CODE_07A55C                           ; $07A556 |
  JML $03B273                               ; $07A558 |

CODE_07A55C:
  JSL $07FC2A                               ; $07A55C |
  BCC CODE_07A565                           ; $07A560 |
  JMP CODE_07A0B0                           ; $07A562 |

CODE_07A565:
  LDA #$9ED8                                ; $07A565 |
  STA $00                                   ; $07A568 |
  JSR CODE_07A623                           ; $07A56A |
  RTL                                       ; $07A56D |

  dw $2020, $0202, $0202, $0202             ; $07A56E |
  dw $0202, $0202, $0202, $0620             ; $07A576 |
  dw $1018                                  ; $07A57E |

CODE_07A580:
  LDA !s_player_ground_pound_state          ; $07A580 |
  BNE CODE_07A5CA                           ; $07A583 |
  JSL $03B20B                               ; $07A585 |
  LDY $77C0,x                               ; $07A589 |
  CPY #$02                                  ; $07A58C |
  BCS CODE_07A5CA                           ; $07A58E |
  SEP #$20                                  ; $07A590 |
  INC $77C0,x                               ; $07A592 |
  LDA ($00)                                 ; $07A595 |
  STA !s_spr_anim_frame,x                   ; $07A597 |
  LDA $A56E                                 ; $07A59A |
  STA !s_spr_timer_1,x                      ; $07A59D |
  REP #$20                                  ; $07A5A0 |
  STZ !s_spr_x_speed_lo,x                   ; $07A5A2 |
  STZ !s_spr_x_accel,x                      ; $07A5A5 |
  STZ !s_spr_wildcard_4_lo,x                ; $07A5A8 |
  LDA #$0001                                ; $07A5AB |
  STA !s_spr_wildcard_1_lo,x                ; $07A5AE |
  LDA #$001C                                ; $07A5B1 |\ play sound #$001C
  JSL push_sound_queue                      ; $07A5B4 |/
  LDA !s_spr_x_hitbox_center,x              ; $07A5B8 |
  STA $00                                   ; $07A5BB |
  LDA !s_spr_y_hitbox_center,x              ; $07A5BD |
  STA $02                                   ; $07A5C0 |
  LDA #$01E7                                ; $07A5C2 |
  JSL $03B56E                               ; $07A5C5 |
  RTS                                       ; $07A5C9 |

CODE_07A5CA:
  LDA #$003B                                ; $07A5CA |\ play sound #$003B
  JSL push_sound_queue                      ; $07A5CD |/
  JSL $0CFF61                               ; $07A5D1 |
  JSL $03A32E                               ; $07A5D5 |
  LDA #$0004                                ; $07A5D9 |
  STA $00                                   ; $07A5DC |
  JSR CODE_07A5EF                           ; $07A5DE |
  PLA                                       ; $07A5E1 |
  RTL                                       ; $07A5E2 |

  dw $0000, $0100, $FF00                    ; $07A5E3 |

  dw $FD80, $FE00, $FE00                    ; $07A5E9 |

CODE_07A5EF:
  PHX                                       ; $07A5EF |
  LDX $00                                   ; $07A5F0 |
  LDA $A5E3,x                               ; $07A5F2 |
  STA $02                                   ; $07A5F5 |
  LDA $A5E9,x                               ; $07A5F7 |
  STA $04                                   ; $07A5FA |
  PLX                                       ; $07A5FC |
  LDA #$0115                                ; $07A5FD |
  JSL spawn_sprite_init                     ; $07A600 |
  BCC CODE_07A622                           ; $07A604 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A606 |
  STA !s_spr_x_pixel_pos,y                  ; $07A609 |
  LDA !s_spr_y_pixel_pos,x                  ; $07A60C |
  STA !s_spr_y_pixel_pos,y                  ; $07A60F |
  LDA $02                                   ; $07A612 |
  STA !s_spr_x_speed_lo,y                   ; $07A614 |
  LDA $04                                   ; $07A617 |
  STA !s_spr_y_speed_lo,y                   ; $07A619 |
  DEC $00                                   ; $07A61C |
  DEC $00                                   ; $07A61E |
  BPL CODE_07A5EF                           ; $07A620 |

CODE_07A622:
  RTS                                       ; $07A622 |

CODE_07A623:
  LDA $7860,x                               ; $07A623 |
  AND #$0001                                ; $07A626 |
  BEQ CODE_07A658                           ; $07A629 |
  LDA !s_spr_timer_1,x                      ; $07A62B |
  BNE CODE_07A658                           ; $07A62E |
  LDA !s_spr_wildcard_4_lo,x                ; $07A630 |
  INC A                                     ; $07A633 |
  CMP #$0012                                ; $07A634 |
  BCS CODE_07A659                           ; $07A637 |
  STA !s_spr_wildcard_4_lo,x                ; $07A639 |
  TAY                                       ; $07A63C |
  LDA ($00),y                               ; $07A63D |
  AND #$00FF                                ; $07A63F |
  STA !s_spr_anim_frame,x                   ; $07A642 |
  LDA $A56E,y                               ; $07A645 |
  AND #$00FF                                ; $07A648 |
  STA !s_spr_timer_1,x                      ; $07A64B |
  CPY #$10                                  ; $07A64E |
  BNE CODE_07A658                           ; $07A650 |
  LDA #$FD00                                ; $07A652 |
  STA !s_spr_y_speed_lo,x                   ; $07A655 |

CODE_07A658:
  RTS                                       ; $07A658 |

CODE_07A659:
  LDY $77C0,x                               ; $07A659 |
  PHY                                       ; $07A65C |
  LDA !s_spr_id,x                           ; $07A65D |
  TXY                                       ; $07A660 |
  JSL $03A377                               ; $07A661 |
  SEP #$20                                  ; $07A665 |
  PLA                                       ; $07A667 |
  STA $77C0,x                               ; $07A668 |
  REP #$20                                  ; $07A66B |
  STZ !s_spr_wildcard_1_lo,x                ; $07A66D |
  LDA #$FFFF                                ; $07A670 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A673 |
  RTS                                       ; $07A675 |

  dw $FE80, $0180                           ; $07A676 |

; spawns one or two lakitus
init_lakitu:
  LDA !r_lakitu_gen_flag                    ; $07A67A |
  BEQ CODE_07A683                           ; $07A67D |
  JML $03A31E                               ; $07A67F |

CODE_07A683:
  LDA #$0001                                ; $07A683 |
  STA !r_lakitu_gen_flag                    ; $07A686 |
  LDA #$0200                                ; $07A689 |
  STA !s_spr_x_accel_ceiling,x              ; $07A68C |
  LDA #$0200                                ; $07A68F |
  STA !s_spr_y_accel_ceiling,x              ; $07A692 |
  LDA #$0008                                ; $07A695 |
  STA !s_spr_x_accel,x                      ; $07A698 |
  LDA #$0008                                ; $07A69B |
  STA !s_spr_y_accel,x                      ; $07A69E |
  LDA #$A6FA                                ; $07A6A1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07A6A4 |
  JSR CODE_07A84D                           ; $07A6A7 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A6AA |
  AND #$0010                                ; $07A6AD |
  BEQ CODE_07A6F9                           ; $07A6B0 |
  LDY !s_spr_facing_dir,x                   ; $07A6B2 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A6B5 |
  CLC                                       ; $07A6B8 |
  ADC $A676,y                               ; $07A6B9 |
  AND #$FFE0                                ; $07A6BC |
  STA $00                                   ; $07A6BF |
  LDA #$011B                                ; $07A6C1 |
  JSL spawn_sprite_active                   ; $07A6C4 |
  BCC CODE_07A6F9                           ; $07A6C8 |
  LDA $00                                   ; $07A6CA |
  STA !s_spr_x_pixel_pos,y                  ; $07A6CC |
  LDA !s_spr_y_pixel_pos,x                  ; $07A6CF |
  STA !s_spr_y_pixel_pos,y                  ; $07A6D2 |
  LDA #$0200                                ; $07A6D5 |
  STA !s_spr_x_accel_ceiling,y              ; $07A6D8 |
  LDA #$0200                                ; $07A6DB |
  STA !s_spr_y_accel_ceiling,y              ; $07A6DE |
  LDA #$0008                                ; $07A6E1 |
  STA !s_spr_x_accel,y                      ; $07A6E4 |
  LDA #$0008                                ; $07A6E7 |
  STA !s_spr_y_accel,y                      ; $07A6EA |
  LDA #$A6FE                                ; $07A6ED |
  STA !s_spr_gsu_morph_1_lo,y               ; $07A6F0 |
  TYX                                       ; $07A6F3 |
  JSR CODE_07A84D                           ; $07A6F4 |
  LDX $12                                   ; $07A6F7 |

CODE_07A6F9:
  RTL                                       ; $07A6F9 |

  dw $0088, $0068, $0098, $0058             ; $07A6FA |

; spawns one or two lakitus
main_lakitu:
  LDA !s_spr_state,x                        ; $07A702 |
  CMP #$0008                                ; $07A705 |
  BNE CODE_07A751                           ; $07A708 |
  LDA #$011C                                ; $07A70A |
  JSL spawn_sprite_active                   ; $07A70D |
  BCC CODE_07A741                           ; $07A711 |
  LDA !s_spr_x_pixel_pos,x                  ; $07A713 |
  STA !s_spr_x_pixel_pos,y                  ; $07A716 |
  LDA !s_spr_y_pixel_pos,x                  ; $07A719 |
  STA !s_spr_y_pixel_pos,y                  ; $07A71C |
  LDA #$0008                                ; $07A71F |
  STA !s_spr_state,y                        ; $07A722 |
  TYA                                       ; $07A725 |
  AND #$00FF                                ; $07A726 |
  INC A                                     ; $07A729 |
  STA $6162                                 ; $07A72A |
  LDA !s_spr_oam_1,y                        ; $07A72D |
  AND #$FFF3                                ; $07A730 |
  STA !s_spr_oam_1,y                        ; $07A733 |
  TXA                                       ; $07A736 |
  INC A                                     ; $07A737 |
  STA !s_spr_wildcard_3_lo,y                ; $07A738 |
  JSL $07A956                               ; $07A73B |
  BRA CODE_07A74A                           ; $07A73F |

CODE_07A741:
  LDA #$0010                                ; $07A741 |
  STA !s_spr_state,x                        ; $07A744 |
  STZ $6162                                 ; $07A747 |

CODE_07A74A:
  STZ !s_tongued_sprite_slot                ; $07A74A |
  PLA                                       ; $07A74D |
  PLY                                       ; $07A74E |
  BRA CODE_07A754                           ; $07A74F |

CODE_07A751:
  JSR CODE_07A9C6                           ; $07A751 |

CODE_07A754:
  JSL $03AF23                               ; $07A754 |
  JSR CODE_07AA37                           ; $07A758 |
  LDA !s_spr_x_player_dir,x                 ; $07A75B |
  STA !s_spr_facing_dir,x                   ; $07A75E |
  LDA !r_lakitu_gen_flag                    ; $07A761 |
  BNE CODE_07A783                           ; $07A764 |
  LDA #$FC00                                ; $07A766 |
  STA !s_spr_x_accel_ceiling,x              ; $07A769 |
  STA !s_spr_y_accel_ceiling,x              ; $07A76C |
  LDA #$0040                                ; $07A76F |
  STA !s_spr_y_accel,x                      ; $07A772 |
  STA !s_spr_x_accel,x                      ; $07A775 |
  LDA !s_spr_oam_1,x                        ; $07A778 |
  ORA #$0004                                ; $07A77B |
  STA !s_spr_oam_1,x                        ; $07A77E |
  BRA CODE_07A800                           ; $07A781 |

CODE_07A783:
  LDA !s_spr_x_player_dir,x                 ; $07A783 |
  LSR A                                     ; $07A786 |
  LSR A                                     ; $07A787 |
  ROR A                                     ; $07A788 |
  EOR !s_spr_x_speed_lo,x                   ; $07A789 |
  BMI CODE_07A793                           ; $07A78C |
  LDA #$0010                                ; $07A78E |
  BRA CODE_07A796                           ; $07A791 |

CODE_07A793:
  LDA #$0008                                ; $07A793 |

CODE_07A796:
  STA !s_spr_x_accel,x                      ; $07A796 |
  LDA !s_spr_x_speed_lo,x                   ; $07A799 |
  BPL CODE_07A7A2                           ; $07A79C |
  EOR #$FFFF                                ; $07A79E |
  INC A                                     ; $07A7A1 |

CODE_07A7A2:
  CMP #$0080                                ; $07A7A2 |
  BCC CODE_07A7C8                           ; $07A7A5 |
  LDA !s_spr_x_speed_lo,x                   ; $07A7A7 |
  AND #$8000                                ; $07A7AA |
  ASL A                                     ; $07A7AD |
  ROL A                                     ; $07A7AE |
  ASL A                                     ; $07A7AF |
  TAY                                       ; $07A7B0 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07A7B1 |
  STA $00                                   ; $07A7B4 |
  LDA !s_spr_cam_x_pos,x                    ; $07A7B6 |
  CMP ($00),y                               ; $07A7B9 |
  BPL CODE_07A7C2                           ; $07A7BB |
  LDA #$0200                                ; $07A7BD |
  BRA CODE_07A7C5                           ; $07A7C0 |

CODE_07A7C2:
  LDA #$FE00                                ; $07A7C2 |

CODE_07A7C5:
  STA !s_spr_x_accel_ceiling,x              ; $07A7C5 |

CODE_07A7C8:
  LDA !s_spr_cam_y_pos,x                    ; $07A7C8 |
  SEC                                       ; $07A7CB |
  SBC #$0030                                ; $07A7CC |
  EOR !s_spr_y_speed_lo,x                   ; $07A7CF |
  BMI CODE_07A7D9                           ; $07A7D2 |
  LDA #$0010                                ; $07A7D4 |
  BRA CODE_07A7DC                           ; $07A7D7 |

CODE_07A7D9:
  LDA #$0008                                ; $07A7D9 |

CODE_07A7DC:
  STA !s_spr_y_accel,x                      ; $07A7DC |
  LDA !s_spr_y_speed_lo,x                   ; $07A7DF |
  BPL CODE_07A7E8                           ; $07A7E2 |
  EOR #$FFFF                                ; $07A7E4 |
  INC A                                     ; $07A7E7 |

CODE_07A7E8:
  CMP #$0100                                ; $07A7E8 |
  BCC CODE_07A800                           ; $07A7EB |
  LDA !s_spr_cam_y_pos,x                    ; $07A7ED |
  CMP #$0030                                ; $07A7F0 |
  BPL CODE_07A7FA                           ; $07A7F3 |
  LDA #$0200                                ; $07A7F5 |
  BRA CODE_07A7FD                           ; $07A7F8 |

CODE_07A7FA:
  LDA #$FE00                                ; $07A7FA |

CODE_07A7FD:
  STA !s_spr_y_accel_ceiling,x              ; $07A7FD |

CODE_07A800:
  LDA $14                                   ; $07A800 |
  AND #$0007                                ; $07A802 |
  BNE CODE_07A83C                           ; $07A805 |
  LDA #$01F8                                ; $07A807 |
  JSL spawn_ambient_sprite                  ; $07A80A |
  LDA #$0002                                ; $07A80E |
  STA $73C2,y                               ; $07A811 |
  LDA #$0008                                ; $07A814 |
  STA $7782,y                               ; $07A817 |
  LDA !s_spr_x_hitbox_center,x              ; $07A81A |
  SEC                                       ; $07A81D |
  SBC #$0008                                ; $07A81E |
  SEC                                       ; $07A821 |
  SBC !s_spr_x_delta_lo,x                   ; $07A822 |
  STA $70A2,y                               ; $07A825 |
  LDA $10                                   ; $07A828 |
  AND #$0007                                ; $07A82A |
  CLC                                       ; $07A82D |
  ADC !s_spr_y_hitbox_center,x              ; $07A82E |
  SEC                                       ; $07A831 |
  SBC #$0008                                ; $07A832 |
  SEC                                       ; $07A835 |
  SBC !s_spr_y_delta_lo,x                   ; $07A836 |
  STA $7142,y                               ; $07A839 |

CODE_07A83C:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07A83C |
  TAX                                       ; $07A83E |
  JSR ($A847,x)                             ; $07A83F |
  JSL $03A5B7                               ; $07A842 |
  RTL                                       ; $07A846 |

  dw $A869                                  ; $07A847 |
  dw $A869                                  ; $07A849 |
  dw $A8E6                                  ; $07A84B |

CODE_07A84D:
  LDA $10                                   ; $07A84D |
  AND #$007F                                ; $07A84F |
  CLC                                       ; $07A852 |
  ADC #$0080                                ; $07A853 |
  STA !s_spr_timer_1,x                      ; $07A856 |
  STZ !s_spr_anim_frame,x                   ; $07A859 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07A85C |
  LDA #$0003                                ; $07A85E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A861 |
  LDA #$A896                                ; $07A863 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07A866 |
  RTS                                       ; $07A868 |

  LDX $12                                   ; $07A869 |
  LDA !s_spr_timer_1,x                      ; $07A86B |
  BNE CODE_07A881                           ; $07A86E |
  LDA !s_spr_cam_x_pos,x                    ; $07A870 |
  ORA !s_spr_cam_y_pos,x                    ; $07A873 |
  AND #$FF00                                ; $07A876 |
  BEQ CODE_07A88F                           ; $07A879 |
  LDA #$0050                                ; $07A87B |
  STA !s_spr_timer_1,x                      ; $07A87E |

CODE_07A881:
  AND !s_spr_wildcard_5_lo_dp,x             ; $07A881 |
  BNE CODE_07A88E                           ; $07A883 |
  LDA !s_spr_anim_frame,x                   ; $07A885 |
  EOR #$0001                                ; $07A888 |
  STA !s_spr_anim_frame,x                   ; $07A88B |

CODE_07A88E:
  RTS                                       ; $07A88E |

CODE_07A88F:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07A88F |
  STA $00                                   ; $07A891 |
  JMP ($7960)                               ; $07A893 |
  LDA #$0050                                ; $07A896 |
  STA !s_spr_timer_1,x                      ; $07A899 |
  LDA #$0002                                ; $07A89C |
  STA !s_spr_anim_frame,x                   ; $07A89F |
  LDA #$0002                                ; $07A8A2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A8A5 |
  LDA #$0007                                ; $07A8A7 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A8AA |
  LDA #$A8CC                                ; $07A8AC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07A8AF |
  RTS                                       ; $07A8B1 |

  db $0C, $02, $02, $02, $02, $02, $02, $02 ; $07A8B2 |
  db $02, $06, $10, $40, $20                ; $07A8BA |

  db $04, $05, $06, $07, $08, $09, $0A, $0B ; $07A8BF |
  db $0A, $0C, $0A, $0D, $0E                ; $07A8C7 |

  STZ !s_spr_wildcard_5_lo_dp,x             ; $07A8CC |
  LDA $A8B2                                 ; $07A8CE |
  AND #$00FF                                ; $07A8D1 |
  STA !s_spr_timer_1,x                      ; $07A8D4 |
  LDA $A8BF                                 ; $07A8D7 |
  AND #$00FF                                ; $07A8DA |
  STA !s_spr_anim_frame,x                   ; $07A8DD |
  LDA #$0004                                ; $07A8E0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07A8E3 |
  RTS                                       ; $07A8E5 |

  LDX $12                                   ; $07A8E6 |
  LDA !s_spr_cam_x_pos,x                    ; $07A8E8 |
  ORA !s_spr_cam_y_pos,x                    ; $07A8EB |
  AND #$FF00                                ; $07A8EE |
  BNE CODE_07A903                           ; $07A8F1 |
  LDA !s_spr_timer_1,x                      ; $07A8F3 |
  BEQ CODE_07A8FB                           ; $07A8F6 |
  JMP CODE_07A928                           ; $07A8F8 |

CODE_07A8FB:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07A8FB |
  INC A                                     ; $07A8FD |
  CMP #$000D                                ; $07A8FE |
  BCC CODE_07A906                           ; $07A901 |

CODE_07A903:
  JMP CODE_07A84D                           ; $07A903 |

CODE_07A906:
  STA !s_spr_wildcard_5_lo_dp,x             ; $07A906 |
  TAY                                       ; $07A908 |
  LDA $A8B2,y                               ; $07A909 |
  AND #$00FF                                ; $07A90C |
  STA !s_spr_timer_1,x                      ; $07A90F |
  LDA $A8BF,y                               ; $07A912 |
  AND #$00FF                                ; $07A915 |
  STA !s_spr_anim_frame,x                   ; $07A918 |
  CPY #$0C                                  ; $07A91B |
  BNE CODE_07A928                           ; $07A91D |
  JSL $0EB148                               ; $07A91F |
  JSR CODE_07AA8D                           ; $07A923 |
  BRA CODE_07A944                           ; $07A926 |

CODE_07A928:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07A928 |
  CMP #$000B                                ; $07A92A |
  BCC CODE_07A944                           ; $07A92D |
  CMP #$000C                                ; $07A92F |
  BCS CODE_07A944                           ; $07A932 |
  JSL $0EB14D                               ; $07A934 |
  STZ !s_spr_x_accel,x                      ; $07A938 |
  STZ !s_spr_y_accel,x                      ; $07A93B |
  STZ !s_spr_x_speed_lo,x                   ; $07A93E |
  STZ !s_spr_y_speed_lo,x                   ; $07A941 |

CODE_07A944:
  RTS                                       ; $07A944 |

CODE_07A945:
  LDA !s_spr_x_hitbox_center,x              ; $07A945 |
  STA $00                                   ; $07A948 |
  LDA !s_spr_y_hitbox_center,x              ; $07A94A |
  STA $02                                   ; $07A94D |
  LDA #$01E6                                ; $07A94F |
  JSL $03B56E                               ; $07A952 |
  STZ !s_spr_y_speed_lo,x                   ; $07A956 |
  STZ !s_spr_x_accel,x                      ; $07A959 |
  STZ !s_spr_x_accel_ceiling,x              ; $07A95C |
  LDA #$0040                                ; $07A95F |
  STA !s_spr_y_accel,x                      ; $07A962 |
  LDA #$0400                                ; $07A965 |
  STA !s_spr_y_accel_ceiling,x              ; $07A968 |
  LDA #$000F                                ; $07A96B |
  STA !s_spr_anim_frame,x                   ; $07A96E |
  LDA #$000E                                ; $07A971 |
  STA !s_spr_state,x                        ; $07A974 |
  LDA #$0280                                ; $07A977 |
  STA !s_spr_timer_4,x                      ; $07A97A |
  RTL                                       ; $07A97D |

  dw $0010, $0018, $0010, $0018             ; $07A97E |
  dw $0000, $0008, $0000, $0008             ; $07A986 |
  dw $0000, $0008, $0000, $0008             ; $07A98E |
  dw $0000, $0008, $0008, $0010             ; $07A996 |
  dw $0008, $0010, $0010, $0018             ; $07A99E |
  dw $0010, $0018, $0010, $0018             ; $07A9A6 |
  dw $0010, $0018, $0010, $0018             ; $07A9AE |
  dw $0010, $0018, $0008, $000A             ; $07A9B6 |
  dw $0000, $0200, $0400, $0800             ; $07A9BE |

CODE_07A9C6:
  LDY !s_spr_draw_priority,x                ; $07A9C6 |
  BMI CODE_07AA36                           ; $07A9C9 |
  REP #$10                                  ; $07A9CB |
  LDA !s_spr_anim_frame,x                   ; $07A9CD |
  CMP #$000F                                ; $07A9D0 |
  BEQ CODE_07AA16                           ; $07A9D3 |
  ASL A                                     ; $07A9D5 |
  ASL A                                     ; $07A9D6 |
  TAY                                       ; $07A9D7 |
  LDA $A97E,y                               ; $07A9D8 |
  STA $00                                   ; $07A9DB |
  LDA $A980,y                               ; $07A9DD |
  STA $02                                   ; $07A9E0 |
  LDA $14                                   ; $07A9E2 |
  AND #$0008                                ; $07A9E4 |
  LSR A                                     ; $07A9E7 |
  LSR A                                     ; $07A9E8 |
  TAY                                       ; $07A9E9 |
  LDA $A9BA,y                               ; $07A9EA |
  STA $04                                   ; $07A9ED |
  LDA !s_spr_oam_pointer,x                  ; $07A9EF |
  CLC                                       ; $07A9F2 |
  ADC $00                                   ; $07A9F3 |
  TAY                                       ; $07A9F5 |
  LDA $6004,y                               ; $07A9F6 |
  AND #$FFF0                                ; $07A9F9 |
  ORA $04                                   ; $07A9FC |
  STA $6004,y                               ; $07A9FE |
  LDA !s_spr_oam_pointer,x                  ; $07AA01 |
  CLC                                       ; $07AA04 |
  ADC $02                                   ; $07AA05 |
  TAY                                       ; $07AA07 |
  LDA $6004,y                               ; $07AA08 |
  AND #$FFF0                                ; $07AA0B |
  ORA $04                                   ; $07AA0E |
  STA $6004,y                               ; $07AA10 |
  LDA !s_spr_anim_frame,x                   ; $07AA13 |

CODE_07AA16:
  CMP #$000D                                ; $07AA16 |
  BNE CODE_07AA34                           ; $07AA19 |
  LDA $14                                   ; $07AA1B |
  AND #$0006                                ; $07AA1D |
  TAY                                       ; $07AA20 |
  LDA $A9BE,y                               ; $07AA21 |
  STA $00                                   ; $07AA24 |
  LDY !s_spr_oam_pointer,x                  ; $07AA26 |
  LDA $6004,y                               ; $07AA29 |
  AND #$F1FF                                ; $07AA2C |
  ORA $00                                   ; $07AA2F |
  STA $6004,y                               ; $07AA31 |

CODE_07AA34:
  SEP #$10                                  ; $07AA34 |

CODE_07AA36:
  RTS                                       ; $07AA36 |

CODE_07AA37:
  LDY !s_spr_collision_id,x                 ; $07AA37 |
  BMI CODE_07AA5A                           ; $07AA3A |
  DEY                                       ; $07AA3C |
  BEQ CODE_07AA59                           ; $07AA3D |
  BMI CODE_07AA59                           ; $07AA3F |
  LDA !s_spr_state,y                        ; $07AA41 |
  CMP #$0010                                ; $07AA44 |
  BNE CODE_07AA59                           ; $07AA47 |
  LDA !s_spr_collision_state,y              ; $07AA49 |
  BEQ CODE_07AA59                           ; $07AA4C |
  TYX                                       ; $07AA4E |
  JSL $03B24B                               ; $07AA4F |
  LDX $12                                   ; $07AA53 |
  PLA                                       ; $07AA55 |
  JMP CODE_07A945                           ; $07AA56 |

CODE_07AA59:
  RTS                                       ; $07AA59 |

CODE_07AA5A:
  JSL $07FC2F                               ; $07AA5A |
  BCS CODE_07AA67                           ; $07AA5E |
  BEQ CODE_07AA66                           ; $07AA60 |
  JSL player_hit_sprite                     ; $07AA62 |

CODE_07AA66:
  RTS                                       ; $07AA66 |

CODE_07AA67:
  LDA #$011C                                ; $07AA67 |
  JSL spawn_sprite_init                     ; $07AA6A |
  BCC CODE_07AA81                           ; $07AA6E |
  LDA !s_spr_x_pixel_pos,x                  ; $07AA70 |
  STA !s_spr_x_pixel_pos,y                  ; $07AA73 |
  LDA !s_spr_y_pixel_pos,x                  ; $07AA76 |
  STA !s_spr_y_pixel_pos,y                  ; $07AA79 |
  TXA                                       ; $07AA7C |
  INC A                                     ; $07AA7D |
  STA !s_spr_wildcard_3_lo,y                ; $07AA7E |

CODE_07AA81:
  JSL $03B20B                               ; $07AA81 |
  PLA                                       ; $07AA85 |
  JMP CODE_07A945                           ; $07AA86 |

  dw $FFF0, $0000                           ; $07AA89 |

CODE_07AA8D:
  LDA !s_player_center_x                    ; $07AA8D |
  STA !gsu_r1                               ; $07AA90 |
  LDA !s_player_center_y                    ; $07AA93 |
  STA !gsu_r2                               ; $07AA96 |
  LDY !s_spr_facing_dir,x                   ; $07AA99 |
  LDA !s_spr_x_hitbox_center,x              ; $07AA9C |
  CLC                                       ; $07AA9F |
  ADC $AA89,y                               ; $07AAA0 |
  STA $00                                   ; $07AAA3 |
  STA !gsu_r3                               ; $07AAA5 |
  LDA !s_spr_y_hitbox_center,x              ; $07AAA8 |
  STA !gsu_r4                               ; $07AAAB |
  LDA #$0200                                ; $07AAAE |
  STA !gsu_r6                               ; $07AAB1 |
  LDX #$09                                  ; $07AAB4 |
  LDA #$907C                                ; $07AAB6 |
  JSL r_gsu_init_1                          ; $07AAB9 | GSU init
  LDX $12                                   ; $07AABD |
  LDA #$011D                                ; $07AABF |
  JSL spawn_sprite_init                     ; $07AAC2 |
  BCC CODE_07AAE3                           ; $07AAC6 |
  LDA !gsu_r1                               ; $07AAC8 |
  STA !s_spr_x_speed_lo,y                   ; $07AACB |
  LDA !gsu_r2                               ; $07AACE |
  STA !s_spr_y_speed_lo,y                   ; $07AAD1 |
  LDA $00                                   ; $07AAD4 |
  STA !s_spr_x_pixel_pos,y                  ; $07AAD6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07AAD9 |
  SEC                                       ; $07AADC |
  SBC #$0008                                ; $07AADD |
  STA !s_spr_y_pixel_pos,y                  ; $07AAE0 |

CODE_07AAE3:
  RTS                                       ; $07AAE3 |

  dw $FFC0, $0140                           ; $07AAE4 |

  dw $FFC0, $0140                           ; $07AAE8 |

  LDA !s_spr_cam_y_pos,x                    ; $07AAEC |
  AND #$FF00                                ; $07AAEF |
  BEQ CODE_07AB48                           ; $07AAF2 |
  BMI CODE_07AB48                           ; $07AAF4 |
  LDA #$FFFF                                ; $07AAF6 |
  STA !s_spr_draw_priority,x                ; $07AAF9 |
  STZ !s_spr_y_accel,x                      ; $07AAFC |
  STZ !s_spr_y_speed_lo,x                   ; $07AAFF |
  LDA !s_spr_timer_4,x                      ; $07AB02 |
  BNE CODE_07AB48                           ; $07AB05 |
  LDA #$0005                                ; $07AB07 |
  STA !s_spr_draw_priority,x                ; $07AB0A |
  LDA #$0200                                ; $07AB0D |
  STA !s_spr_x_accel_ceiling,x              ; $07AB10 |
  LDA #$0200                                ; $07AB13 |
  STA !s_spr_y_accel_ceiling,x              ; $07AB16 |
  LDA #$0008                                ; $07AB19 |
  STA !s_spr_x_accel,x                      ; $07AB1C |
  LDA #$0008                                ; $07AB1F |
  STA !s_spr_y_accel,x                      ; $07AB22 |
  JSR CODE_07A84D                           ; $07AB25 |
  LDY !r_cam_moving_dir_x                   ; $07AB28 |
  LDA !r_bg1_cam_x                          ; $07AB2B |
  CLC                                       ; $07AB2E |
  ADC $AAE4,y                               ; $07AB2F |
  STA !s_spr_x_pixel_pos,x                  ; $07AB32 |
  LDY !r_cam_moving_dir_y                   ; $07AB35 |
  LDA !r_bg1_cam_y                          ; $07AB38 |
  CLC                                       ; $07AB3B |
  ADC $AAE8,y                               ; $07AB3C |
  STA !s_spr_y_pixel_pos,x                  ; $07AB3F |
  LDA #$0010                                ; $07AB42 |
  STA !s_spr_state,x                        ; $07AB45 |

CODE_07AB48:
  RTL                                       ; $07AB48 |

lava_drop_x_end_point_pos:
  dw $FFD0, $0030                           ; $07AB49 |

lava_drop_x_speed:
  dw $FE00, $0200                           ; $07AB4D |

init_lava_drop_horizontal:
  LDA !s_spr_x_pixel_pos,x                  ; $07AB51 |
  CLC                                       ; $07AB54 |
  ADC lava_drop_x_end_point_pos             ; $07AB55 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07AB58 |
  LDA !s_spr_x_pixel_pos,x                  ; $07AB5A |
  CLC                                       ; $07AB5D |
  ADC lava_drop_x_end_point_pos+2           ; $07AB5E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07AB61 |
  LDA #$0004                                ; $07AB63 |
  STA !s_spr_x_accel,x                      ; $07AB66 |
  LDA !s_spr_x_pixel_pos,x                  ; $07AB69 |
  AND #$0010                                ; $07AB6C |
  LSR A                                     ; $07AB6F |
  LSR A                                     ; $07AB70 |
  LSR A                                     ; $07AB71 |
  EOR #$0002                                ; $07AB72 |
  STA !s_spr_facing_dir,x                   ; $07AB75 |
  TAY                                       ; $07AB78 |
  LDA lava_drop_x_speed,y                   ; $07AB79 |
  STA !s_spr_x_speed_lo,x                   ; $07AB7C |
  LDA !s_spr_x_pixel_pos,x                  ; $07AB7F |
  SEC                                       ; $07AB82 |
  SBC lava_drop_x_end_point_pos,y           ; $07AB83 |
  STA !s_spr_x_pixel_pos,x                  ; $07AB86 |
  LDA #$0003                                ; $07AB89 |
  STA !s_spr_timer_1,x                      ; $07AB8C |
  RTL                                       ; $07AB8F |

  db $00, $09, $08, $07, $06, $05, $04, $00 ; $07AB90 |

  dw $0008, $FFF8                           ; $07AB98 |

main_lava_drop_horizontal:
  JSL $03AF23                               ; $07AB9C |
  LDA !s_spr_x_speed_lo,x                   ; $07ABA0 |
  BEQ CODE_07AC1C                           ; $07ABA3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07ABA5 |
  CMP !s_spr_x_pixel_pos,x                  ; $07ABA7 |
  BCS CODE_07AC05                           ; $07ABAA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07ABAC |
  CMP !s_spr_x_pixel_pos,x                  ; $07ABAE |
  BCC CODE_07AC05                           ; $07ABB1 |
  LDA !s_spr_timer_1,x                      ; $07ABB3 |
  BNE CODE_07ABC8                           ; $07ABB6 |
  LDA #$0003                                ; $07ABB8 |
  STA !s_spr_timer_1,x                      ; $07ABBB |
  LDA !s_spr_anim_frame,x                   ; $07ABBE |
  INC A                                     ; $07ABC1 |
  AND #$0003                                ; $07ABC2 |
  STA !s_spr_anim_frame,x                   ; $07ABC5 |

CODE_07ABC8:
  LDA $14                                   ; $07ABC8 |
  AND #$0007                                ; $07ABCA |
  BNE CODE_07AC03                           ; $07ABCD |
  LDY !s_spr_facing_dir,x                   ; $07ABCF |
  LDA !s_spr_x_pixel_pos,x                  ; $07ABD2 |
  CLC                                       ; $07ABD5 |
  ADC $AB98,y                               ; $07ABD6 |
  STA $00                                   ; $07ABD9 |
  LDA #$01FA                                ; $07ABDB |
  JSL spawn_ambient_sprite                  ; $07ABDE |
  LDA $10                                   ; $07ABE2 |
  AND #$0006                                ; $07ABE4 |
  SEC                                       ; $07ABE7 |
  SBC #$0002                                ; $07ABE8 |
  CLC                                       ; $07ABEB |
  ADC !s_spr_y_pixel_pos,x                  ; $07ABEC |
  STA $7142,y                               ; $07ABEF |
  LDA $00                                   ; $07ABF2 |
  STA $70A2,y                               ; $07ABF4 |
  LDA #$0006                                ; $07ABF7 |
  STA $7782,y                               ; $07ABFA |
  LDA #$0003                                ; $07ABFD |
  STA $73C2,y                               ; $07AC00 |

CODE_07AC03:
  BRA CODE_07AC19                           ; $07AC03 |

CODE_07AC05:
  STA !s_spr_x_pixel_pos,x                  ; $07AC05 |
  STZ !s_spr_x_speed_lo,x                   ; $07AC08 |
  STZ !s_spr_x_accel,x                      ; $07AC0B |
  LDA #$0007                                ; $07AC0E |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07AC11 |
  LDA #$0004                                ; $07AC13 |
  STA !s_spr_timer_1,x                      ; $07AC16 |

CODE_07AC19:
  JMP CODE_07FC4B                           ; $07AC19 |

CODE_07AC1C:
  LDA !s_spr_timer_1,x                      ; $07AC1C |
  BNE CODE_07AC19                           ; $07AC1F |
  LDA #$0004                                ; $07AC21 |
  STA !s_spr_timer_1,x                      ; $07AC24 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07AC27 |
  DEC A                                     ; $07AC29 |
  BMI CODE_07AC47                           ; $07AC2A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07AC2C |
  TAY                                       ; $07AC2E |
  LDA $AB90,y                               ; $07AC2F |
  AND #$00FF                                ; $07AC32 |
  STA !s_spr_anim_frame,x                   ; $07AC35 |
  CPY #$00                                  ; $07AC38 |
  BNE CODE_07AC19                           ; $07AC3A |
  LDA !s_spr_facing_dir,x                   ; $07AC3C |
  EOR #$0002                                ; $07AC3F |
  STA !s_spr_facing_dir,x                   ; $07AC42 |
  BRA CODE_07AC19                           ; $07AC45 |

CODE_07AC47:
  LDA !s_spr_facing_dir,x                   ; $07AC47 |
  TAY                                       ; $07AC4A |
  LDA lava_drop_x_speed,y                   ; $07AC4B |
  STA !s_spr_x_speed_lo,x                   ; $07AC4E |
  LDA #$0004                                ; $07AC51 |
  STA !s_spr_x_accel,x                      ; $07AC54 |
  LDA #$0003                                ; $07AC57 |
  STA !s_spr_timer_1,x                      ; $07AC5A |
  BRA CODE_07AC19                           ; $07AC5D |

init_lava_drop_vertical:
  LDA !s_spr_y_pixel_pos,x                  ; $07AC5F |
  CLC                                       ; $07AC62 |
  ADC $AB49                                 ; $07AC63 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07AC66 |
  LDA !s_spr_y_pixel_pos,x                  ; $07AC68 |
  CLC                                       ; $07AC6B |
  ADC $AB4B                                 ; $07AC6C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07AC6F |
  LDA #$0004                                ; $07AC71 |
  STA !s_spr_y_accel,x                      ; $07AC74 |
  LDA !s_spr_x_pixel_pos,x                  ; $07AC77 |
  AND #$0010                                ; $07AC7A |
  LSR A                                     ; $07AC7D |
  LSR A                                     ; $07AC7E |
  LSR A                                     ; $07AC7F |
  EOR #$0002                                ; $07AC80 |
  STA !s_spr_wildcard_3_lo,x                ; $07AC83 |
  TAY                                       ; $07AC86 |
  LDA lava_drop_x_speed,y                   ; $07AC87 |
  STA !s_spr_y_speed_lo,x                   ; $07AC8A |
  LDA !s_spr_y_pixel_pos,x                  ; $07AC8D |
  SEC                                       ; $07AC90 |
  SBC $AB49,y                               ; $07AC91 |
  STA !s_spr_y_pixel_pos,x                  ; $07AC94 |
  LDA $ACCA,y                               ; $07AC97 |
  STA $00                                   ; $07AC9A |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $07AC9C |
  LDA ($00),y                               ; $07AC9E |
  AND #$00FF                                ; $07ACA0 |
  STA !s_spr_anim_frame,x                   ; $07ACA3 |
  LDA #$0003                                ; $07ACA6 |
  STA !s_spr_timer_1,x                      ; $07ACA9 |
  LDA #$0003                                ; $07ACAC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07ACAF |
  RTL                                       ; $07ACB1 |

  db $00, $01, $02, $03                     ; $07ACB2 |

  db $0A, $0B, $0C, $0D                     ; $07ACB6 |

  db $0D, $09, $08, $07, $06, $05, $04, $00 ; $07ACBA |

  db $03, $13, $12, $11, $10, $0F, $0E, $0A ; $07ACC2 |

  dw $ACB2                                  ; $07ACCA |
  dw $ACB6                                  ; $07ACCC |
  dw $ACBA                                  ; $07ACCE |
  dw $ACC2                                  ; $07ACD0 |

main_lava_drop_vertical:
  JSL $03AF23                               ; $07ACD2 |
  LDA !s_spr_y_speed_lo,x                   ; $07ACD6 |
  BNE CODE_07ACDE                           ; $07ACD9 |
  JMP CODE_07AD75                           ; $07ACDB |

CODE_07ACDE:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07ACDE |
  CMP !s_spr_y_pixel_pos,x                  ; $07ACE0 |
  BCS CODE_07AD4D                           ; $07ACE3 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07ACE5 |
  CMP !s_spr_y_pixel_pos,x                  ; $07ACE7 |
  BCC CODE_07AD4D                           ; $07ACEA |
  LDA !s_spr_timer_1,x                      ; $07ACEC |
  BNE CODE_07AD11                           ; $07ACEF |
  LDA #$0003                                ; $07ACF1 |
  STA !s_spr_timer_1,x                      ; $07ACF4 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $07ACF7 |
  LDA $ACCA,y                               ; $07ACF9 |
  STA $00                                   ; $07ACFC |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $07ACFE |
  BPL CODE_07AD07                           ; $07AD00 |
  LDA #$0003                                ; $07AD02 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07AD05 |

CODE_07AD07:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $07AD07 |
  LDA ($00),y                               ; $07AD09 |
  AND #$00FF                                ; $07AD0B |
  STA !s_spr_anim_frame,x                   ; $07AD0E |

CODE_07AD11:
  LDA $14                                   ; $07AD11 |
  AND #$0007                                ; $07AD13 |
  BNE CODE_07AD4B                           ; $07AD16 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $07AD18 |
  LDA !s_spr_y_pixel_pos,x                  ; $07AD1A |
  CLC                                       ; $07AD1D |
  ADC $AB98,y                               ; $07AD1E |
  STA $00                                   ; $07AD21 |
  LDA #$01FB                                ; $07AD23 |
  JSL spawn_ambient_sprite                  ; $07AD26 |
  LDA $10                                   ; $07AD2A |
  AND #$0006                                ; $07AD2C |
  SEC                                       ; $07AD2F |
  SBC #$0002                                ; $07AD30 |
  CLC                                       ; $07AD33 |
  ADC !s_spr_x_pixel_pos,x                  ; $07AD34 |
  STA $70A2,y                               ; $07AD37 |
  LDA $00                                   ; $07AD3A |
  STA $7142,y                               ; $07AD3C |
  LDA #$0006                                ; $07AD3F |
  STA $7782,y                               ; $07AD42 |
  LDA #$0003                                ; $07AD45 |
  STA $73C2,y                               ; $07AD48 |

CODE_07AD4B:
  BRA CODE_07AD72                           ; $07AD4B |

CODE_07AD4D:
  STA !s_spr_y_pixel_pos,x                  ; $07AD4D |
  STZ !s_spr_y_speed_lo,x                   ; $07AD50 |
  STZ !s_spr_y_accel,x                      ; $07AD53 |
  LDA #$0007                                ; $07AD56 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07AD59 |
  LDA #$0004                                ; $07AD5B |
  STA !s_spr_timer_1,x                      ; $07AD5E |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $07AD61 |
  LDA $ACCE,y                               ; $07AD63 |
  STA $00                                   ; $07AD66 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $07AD68 |
  LDA ($00),y                               ; $07AD6A |
  AND #$00FF                                ; $07AD6C |
  STA !s_spr_anim_frame,x                   ; $07AD6F |

CODE_07AD72:
  JMP CODE_07FC4B                           ; $07AD72 |

CODE_07AD75:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $07AD75 |
  LDA $ACCE,y                               ; $07AD77 |
  STA $00                                   ; $07AD7A |
  LDA !s_spr_timer_1,x                      ; $07AD7C |
  BNE CODE_07AD72                           ; $07AD7F |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $07AD81 |
  BMI CODE_07AD97                           ; $07AD83 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $07AD85 |
  LDA ($00),y                               ; $07AD87 |
  AND #$00FF                                ; $07AD89 |
  STA !s_spr_anim_frame,x                   ; $07AD8C |
  LDA #$0004                                ; $07AD8F |
  STA !s_spr_timer_1,x                      ; $07AD92 |
  BRA CODE_07AD72                           ; $07AD95 |

CODE_07AD97:
  LDA #$0004                                ; $07AD97 |
  STA !s_spr_y_accel,x                      ; $07AD9A |
  LDA #$0003                                ; $07AD9D |
  STA !s_spr_timer_1,x                      ; $07ADA0 |
  LDA #$0003                                ; $07ADA3 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07ADA6 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07ADA8 |
  EOR #$0002                                ; $07ADAA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07ADAD |
  TAY                                       ; $07ADAF |
  LDA lava_drop_x_speed,y                   ; $07ADB0 |
  STA !s_spr_y_speed_lo,x                   ; $07ADB3 |
  LDA $ACCA,y                               ; $07ADB6 |
  STA $00                                   ; $07ADB9 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $07ADBB |
  LDA ($00),y                               ; $07ADBD |
  AND #$00FF                                ; $07ADBF |
  STA !s_spr_anim_frame,x                   ; $07ADC2 |
  BRA CODE_07AD72                           ; $07ADC5 |
  LDY #$FF                                  ; $07ADC7 |
  RTS                                       ; $07ADC9 |

  dw $0000, $00FF                           ; $07ADCA |

  dw $2A01, $2B00                           ; $07ADCE |

  db $00, $02, $00, $00, $00                ; $07ADD2 |

; red and green
init_fat_guy:
  LDA !s_spr_wildcard_2_lo,x                ; $07ADD7 |
  BNE CODE_07AE0C                           ; $07ADDA |
  LDA #$002A                                ; $07ADDC |
  STA !gsu_r4                               ; $07ADDF |
  LDA #$002C                                ; $07ADE2 |
  STA !gsu_r5                               ; $07ADE5 |
  LDX #$09                                  ; $07ADE8 |
  LDA #$91DB                                ; $07ADEA |
  JSL r_gsu_init_1                          ; $07ADED | GSU init
  LDX $12                                   ; $07ADF1 |
  LDA !gsu_r6                               ; $07ADF3 |
  CMP #$0003                                ; $07ADF6 |
  BCC CODE_07ADFF                           ; $07ADF9 |
  JML $03A31E                               ; $07ADFB |

CODE_07ADFF:
  LDA !s_spr_x_pixel_pos,x                  ; $07ADFF |
  AND #$0010                                ; $07AE02 |
  LSR A                                     ; $07AE05 |
  LSR A                                     ; $07AE06 |
  LSR A                                     ; $07AE07 |
  INC A                                     ; $07AE08 |
  STA !s_spr_wildcard_2_lo,x                ; $07AE09 |

CODE_07AE0C:
  TAY                                       ; $07AE0C |
  DEY                                       ; $07AE0D |
  LDA !s_spr_oam_yxppccct,x                 ; $07AE0E |
  ORA $ADD3,y                               ; $07AE11 |
  STA !s_spr_oam_yxppccct,x                 ; $07AE14 |
  LDA $ADCF,y                               ; $07AE17 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07AE1A |
  TYX                                       ; $07AE1C |
  JMP ($AE20,x)                             ; $07AE1D |

  dw $AE24                                  ; $07AE20 |
  dw $AE46                                  ; $07AE22 |

  LDX $12                                   ; $07AE24 |
  LDY !s_spr_facing_dir,x                   ; $07AE26 |
  LDA $ADC7,y                               ; $07AE29 |
  STA !s_spr_x_speed_lo,x                   ; $07AE2C |
  LDA #$0000                                ; $07AE2F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07AE32 |
  LDA #$0003                                ; $07AE34 |
  STA !s_spr_timer_1,x                      ; $07AE37 |
  LDA $AE7A                                 ; $07AE3A |
  AND #$00FF                                ; $07AE3D |
  STA !s_spr_anim_frame,x                   ; $07AE40 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07AE43 |
  RTL                                       ; $07AE45 |

  LDX $12                                   ; $07AE46 |
  LDY !s_spr_facing_dir,x                   ; $07AE48 |
  LDA $ADCB,y                               ; $07AE4B |
  STA !s_spr_x_speed_lo,x                   ; $07AE4E |
  LDA #$0002                                ; $07AE51 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07AE54 |
  LDA #$0002                                ; $07AE56 |
  STA !s_spr_timer_1,x                      ; $07AE59 |
  LDA $AEAD                                 ; $07AE5C |
  AND #$00FF                                ; $07AE5F |
  STA !s_spr_anim_frame,x                   ; $07AE62 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07AE65 |
  RTL                                       ; $07AE67 |

; red and green
main_fat_guy:
  JSL $03AF23                               ; $07AE68 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07AE6C |
  TAX                                       ; $07AE6E |
  JMP ($AE72,x)                             ; $07AE6F |

  dw $AE86                                  ; $07AE72 |
  dw $AEAF                                  ; $07AE74 |
  dw $AED8                                  ; $07AE76 |
  dw $AF0E                                  ; $07AE78 |

  db $04, $05, $06, $07, $08, $09, $0A, $0B ; $07AE7A |
  db $0C, $0D, $0E, $0F                     ; $07AE82 |

  LDX $12                                   ; $07AE86 |
  LDA !s_spr_timer_1,x                      ; $07AE88 |
  BNE CODE_07AEAA                           ; $07AE8B |
  LDA #$0003                                ; $07AE8D |
  STA !s_spr_timer_1,x                      ; $07AE90 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07AE93 |
  INC A                                     ; $07AE95 |
  CMP #$000C                                ; $07AE96 |
  BCC CODE_07AE9E                           ; $07AE99 |
  LDA #$0000                                ; $07AE9B |

CODE_07AE9E:
  STA !s_spr_wildcard_4_lo_dp,x             ; $07AE9E |
  TAY                                       ; $07AEA0 |
  LDA $AE7A,y                               ; $07AEA1 |
  AND #$00FF                                ; $07AEA4 |
  STA !s_spr_anim_frame,x                   ; $07AEA7 |

CODE_07AEAA:
  JMP CODE_07AF4A                           ; $07AEAA |

  db $10, $11                               ; $07AEAD |

  LDX $12                                   ; $07AEAF |
  LDA !s_spr_timer_1,x                      ; $07AEB1 |
  BNE CODE_07AECD                           ; $07AEB4 |
  LDA #$0002                                ; $07AEB6 |
  STA !s_spr_timer_1,x                      ; $07AEB9 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07AEBC |
  EOR #$0001                                ; $07AEBE |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07AEC1 |
  TAY                                       ; $07AEC3 |
  LDA $AEAD,y                               ; $07AEC4 |
  AND #$00FF                                ; $07AEC7 |
  STA !s_spr_anim_frame,x                   ; $07AECA |

CODE_07AECD:
  JMP CODE_07AF4A                           ; $07AECD |

  dw $0213, $0001                           ; $07AED0 |

  dw $0304, $0202                           ; $07AED4 |

  LDX $12                                   ; $07AED8 |
  LDA !s_spr_timer_1,x                      ; $07AEDA |
  BNE CODE_07AEF5                           ; $07AEDD |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07AEDF |
  BMI CODE_07AEF8                           ; $07AEE1 |
  SEP #$20                                  ; $07AEE3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07AEE5 |
  LDA $AED0,y                               ; $07AEE7 |
  STA !s_spr_anim_frame,x                   ; $07AEEA |
  LDA $AED4,y                               ; $07AEED |
  STA !s_spr_timer_1,x                      ; $07AEF0 |
  REP #$20                                  ; $07AEF3 |

CODE_07AEF5:
  JMP CODE_07AF4A                           ; $07AEF5 |

CODE_07AEF8:
  BRA CODE_07AF24                           ; $07AEF8 |

  db $00, $01, $02, $01, $00, $15, $16, $17 ; $07AEFA |

  db $03, $03, $05, $03, $02, $04, $05, $0F ; $07AF02 |

  dw $0100, $FF00                           ; $07AF0A |

  LDX $12                                   ; $07AF0E |
  LDA $7860,x                               ; $07AF10 |
  AND #$0001                                ; $07AF13 |
  BEQ CODE_07AF1B                           ; $07AF16 |
  STZ !s_spr_x_speed_lo,x                   ; $07AF18 |

CODE_07AF1B:
  LDA !s_spr_timer_1,x                      ; $07AF1B |
  BNE CODE_07AF4A                           ; $07AF1E |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07AF20 |
  BPL CODE_07AF36                           ; $07AF22 |

CODE_07AF24:
  LDA !s_spr_x_player_dir,x                 ; $07AF24 |
  AND #$00FF                                ; $07AF27 |
  EOR #$0002                                ; $07AF2A |
  STA !s_spr_facing_dir,x                   ; $07AF2D |
  JSL $07AE46                               ; $07AF30 |
  BRA CODE_07AF4A                           ; $07AF34 |

CODE_07AF36:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07AF36 |
  LDA $AEFA,y                               ; $07AF38 |
  AND #$00FF                                ; $07AF3B |
  STA !s_spr_anim_frame,x                   ; $07AF3E |
  LDA $AF02,y                               ; $07AF41 |
  AND #$00FF                                ; $07AF44 |
  STA !s_spr_timer_1,x                      ; $07AF47 |

CODE_07AF4A:
  LDY !s_spr_collision_id,x                 ; $07AF4A |
  BMI CODE_07AF90                           ; $07AF4D |
  DEY                                       ; $07AF4F |
  BMI CODE_07AF8F                           ; $07AF50 |
  BEQ CODE_07AF8F                           ; $07AF52 |
  LDA !s_spr_state,y                        ; $07AF54 |
  CMP #$0010                                ; $07AF57 |
  BNE CODE_07AF8F                           ; $07AF5A |
  LDA !s_spr_collision_state,y              ; $07AF5C |
  BEQ CODE_07AF8F                           ; $07AF5F |
  LDA !s_spr_y_accel,y                      ; $07AF61 |
  CMP #$0040                                ; $07AF64 |
  BPL CODE_07AFE3                           ; $07AF67 |
  PHY                                       ; $07AF69 |
  JSL $03B24B                               ; $07AF6A |
  PLY                                       ; $07AF6E |
  LDA #$FE00                                ; $07AF6F |
  STA !s_spr_y_speed_lo,x                   ; $07AF72 |
  LDA !s_spr_x_speed_lo,y                   ; $07AF75 |
  CMP #$8000                                ; $07AF78 |
  ROR A                                     ; $07AF7B |
  CMP #$8000                                ; $07AF7C |
  ROR A                                     ; $07AF7F |
  STA !s_spr_x_speed_lo,x                   ; $07AF80 |
  PHY                                       ; $07AF83 |
  JSL $03B53D                               ; $07AF84 |
  PLX                                       ; $07AF88 |
  JSL $03B24B                               ; $07AF89 |
  LDX $12                                   ; $07AF8D |

CODE_07AF8F:
  RTL                                       ; $07AF8F |

CODE_07AF90:
  LDA !s_super_mario_timer                  ; $07AF90 |
  BNE CODE_07AF9D                           ; $07AF93 |
  JSL $07FC2F                               ; $07AF95 |
  BCS CODE_07AFA1                           ; $07AF99 |
  BEQ CODE_07AF8F                           ; $07AF9B |

CODE_07AF9D:
  JML $03A858                               ; $07AF9D |

CODE_07AFA1:
  LDA !s_player_ground_pound_state          ; $07AFA1 |
  BEQ CODE_07AFA9                           ; $07AFA4 |
  JMP CODE_07B04B                           ; $07AFA6 |

CODE_07AFA9:
  LDA #$0015                                ; $07AFA9 |\ play sound #$0015
  JSL push_sound_queue                      ; $07AFAC |/
  LDA #$FC00                                ; $07AFB0 |
  STA !s_player_y_speed                     ; $07AFB3 |
  LDA #$0008                                ; $07AFB6 |
  STA !s_player_jump_state                  ; $07AFB9 |
  LDA #$8001                                ; $07AFBC |
  STA !s_player_flutter_state               ; $07AFBF |
  STZ !s_spr_x_speed_lo,x                   ; $07AFC2 |
  LDA #$0004                                ; $07AFC5 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07AFC8 |
  LDA #$0003                                ; $07AFCA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07AFCD |
  TAY                                       ; $07AFCF |
  LDA $AED0,y                               ; $07AFD0 |
  AND #$00FF                                ; $07AFD3 |
  STA !s_spr_anim_frame,x                   ; $07AFD6 |
  LDA $AED4,y                               ; $07AFD9 |
  AND #$00FF                                ; $07AFDC |
  STA !s_spr_timer_1,x                      ; $07AFDF |
  RTL                                       ; $07AFE2 |

CODE_07AFE3:
  LDA !s_spr_x_hitbox_center,x              ; $07AFE3 |
  SEC                                       ; $07AFE6 |
  SBC !s_spr_x_hitbox_center,y              ; $07AFE7 |
  EOR !s_spr_x_speed_lo,y                   ; $07AFEA |
  BMI CODE_07AF8F                           ; $07AFED |
  PHY                                       ; $07AFEF |
  LDA #$0015                                ; $07AFF0 |\ play sound #$0015
  JSL push_sound_queue                      ; $07AFF3 |/
  PLY                                       ; $07AFF7 |
  LDX #$00                                  ; $07AFF8 |
  LDA !s_spr_x_speed_lo,y                   ; $07AFFA |
  BPL CODE_07B001                           ; $07AFFD |
  INX                                       ; $07AFFF |
  INX                                       ; $07B000 |

CODE_07B001:
  LDA $AF0A,x                               ; $07B001 |
  STA $00                                   ; $07B004 |
  LDX $12                                   ; $07B006 |
  LDA $00                                   ; $07B008 |
  STA !s_spr_x_speed_lo,x                   ; $07B00A |
  EOR #$FFFF                                ; $07B00D |
  INC A                                     ; $07B010 |
  STA !s_spr_x_speed_lo,y                   ; $07B011 |
  LDA #$FE00                                ; $07B014 |
  STA !s_spr_y_speed_lo,x                   ; $07B017 |
  LDA !s_spr_y_speed_lo,y                   ; $07B01A |
  EOR #$FFFF                                ; $07B01D |
  INC A                                     ; $07B020 |
  STA !s_spr_y_speed_lo,y                   ; $07B021 |
  LDA $7860,x                               ; $07B024 |
  AND #$FFFE                                ; $07B027 |
  STA $7860,x                               ; $07B02A |
  LDA #$0006                                ; $07B02D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07B030 |
  LDA #$0007                                ; $07B032 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B035 |
  TAY                                       ; $07B037 |
  LDA $AEFA,y                               ; $07B038 |
  AND #$00FF                                ; $07B03B |
  STA !s_spr_anim_frame,x                   ; $07B03E |
  LDA $AF02,y                               ; $07B041 |
  AND #$00FF                                ; $07B044 |
  STA !s_spr_timer_1,x                      ; $07B047 |
  RTL                                       ; $07B04A |

CODE_07B04B:
  JSL $03A79C                               ; $07B04B |
  LDX $12                                   ; $07B04F |
  RTL                                       ; $07B051 |

init_fang_dangling:
  LDA #$0004                                ; $07B052 |
  STA !s_spr_anim_frame,x                   ; $07B055 |
  RTL                                       ; $07B058 |

main_fang_dangling:
  JSR CODE_07B253                           ; $07B059 |
  JSL $03AF23                               ; $07B05C |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07B060 |
  BEQ CODE_07B068                           ; $07B063 |
  JMP CODE_07B24F                           ; $07B065 |

CODE_07B068:
  JSR CODE_07B194                           ; $07B068 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07B06B |
  TAX                                       ; $07B06D |
  JSR ($B076,x)                             ; $07B06E |
  JSL $03A5B7                               ; $07B071 |
  RTL                                       ; $07B075 |

  dw $B080                                  ; $07B076 |
  dw $B0D1                                  ; $07B078 |
  dw $B14A                                  ; $07B07A |

  dw $FFFF, $0000                           ; $07B07C |

  LDX $12                                   ; $07B080 |
  LDA !s_spr_y_hitbox_center,x              ; $07B082 |
  SEC                                       ; $07B085 |
  SBC !s_player_center_y                    ; $07B086 |
  CLC                                       ; $07B089 |
  ADC #$0020                                ; $07B08A |
  BPL CODE_07B0C6                           ; $07B08D |
  LDA !s_spr_x_hitbox_center,x              ; $07B08F |
  SEC                                       ; $07B092 |
  SBC !s_player_center_x                    ; $07B093 |
  CLC                                       ; $07B096 |
  ADC #$0080                                ; $07B097 |
  CMP #$0100                                ; $07B09A |
  BCS CODE_07B0C6                           ; $07B09D |
  LDA #$0194                                ; $07B09F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B0A2 |
  JSR CODE_07B177                           ; $07B0A4 |
  LDA #$0000                                ; $07B0A7 |
  STA !s_spr_anim_frame,x                   ; $07B0AA |
  LDY #$00                                  ; $07B0AD |
  LDA !s_spr_y_speed_lo,x                   ; $07B0AF |
  BPL CODE_07B0B6                           ; $07B0B2 |
  INY                                       ; $07B0B4 |
  INY                                       ; $07B0B5 |

CODE_07B0B6:
  LDA $B0CD,y                               ; $07B0B6 |
  STA !s_spr_timer_1,x                      ; $07B0B9 |
  LDA #$0040                                ; $07B0BC |
  STA !s_spr_timer_3,x                      ; $07B0BF |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B0C2 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B0C4 |

CODE_07B0C6:
  RTS                                       ; $07B0C6 |

  db $00, $01, $02, $03, $02, $01, $03, $00 ; $07B0C7 |
  db $01, $00                               ; $07B0CF |

  LDX $12                                   ; $07B0D1 |
  JSR CODE_07B165                           ; $07B0D3 |
  LDA !s_spr_y_hitbox_center,x              ; $07B0D6 |
  SEC                                       ; $07B0D9 |
  SBC !s_player_center_y                    ; $07B0DA |
  CLC                                       ; $07B0DD |
  ADC #$0010                                ; $07B0DE |
  BMI CODE_07B0F5                           ; $07B0E1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07B0E3 |
  CLC                                       ; $07B0E5 |
  ADC #$0004                                ; $07B0E6 |
  AND #$01FE                                ; $07B0E9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B0EC |
  JSR CODE_07B177                           ; $07B0EE |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B0F1 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B0F3 |

CODE_07B0F5:
  LDA !s_spr_timer_1,x                      ; $07B0F5 |
  BNE CODE_07B11D                           ; $07B0F8 |
  LDY #$00                                  ; $07B0FA |
  LDA !s_spr_y_speed_lo,x                   ; $07B0FC |
  BPL CODE_07B103                           ; $07B0FF |
  INY                                       ; $07B101 |
  INY                                       ; $07B102 |

CODE_07B103:
  LDA $B0CD,y                               ; $07B103 |
  STA !s_spr_timer_1,x                      ; $07B106 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07B109 |
  DEC A                                     ; $07B10B |
  BPL CODE_07B111                           ; $07B10C |
  LDA #$0005                                ; $07B10E |

CODE_07B111:
  STA !s_spr_wildcard_6_lo_dp,x             ; $07B111 |
  TAY                                       ; $07B113 |
  LDA $B0C7,y                               ; $07B114 |
  AND #$00FF                                ; $07B117 |
  STA !s_spr_anim_frame,x                   ; $07B11A |

CODE_07B11D:
  LDA !s_spr_timer_2,x                      ; $07B11D |
  BNE CODE_07B149                           ; $07B120 |
  LDA #$01FC                                ; $07B122 |
  JSL spawn_ambient_sprite                  ; $07B125 |
  LDA !s_spr_x_pixel_pos,x                  ; $07B129 |
  SEC                                       ; $07B12C |
  SBC !s_spr_x_delta_lo,x                   ; $07B12D |
  STA $70A2,y                               ; $07B130 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B133 |
  SEC                                       ; $07B136 |
  SBC !s_spr_y_delta_lo,x                   ; $07B137 |
  STA $7142,y                               ; $07B13A |
  LDA #$003C                                ; $07B13D |
  STA $7782,y                               ; $07B140 |
  LDA #$000C                                ; $07B143 |
  STA !s_spr_timer_2,x                      ; $07B146 |

CODE_07B149:
  RTS                                       ; $07B149 |

  LDX $12                                   ; $07B14A |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07B14C |
  BNE CODE_07B156                           ; $07B14E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B150 |

init_fang_flying_wavily:
  BNE CODE_07B162                           ; $07B152 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07B154 |

CODE_07B156:
  CLC                                       ; $07B156 |
  ADC #$0004                                ; $07B157 |
  AND #$01FE                                ; $07B15A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B15D |
  JSR CODE_07B177                           ; $07B15F |

CODE_07B162:
  JMP CODE_07B0F5                           ; $07B162 |

CODE_07B165:
  LDA !s_spr_timer_3,x                      ; $07B165 |
  BEQ CODE_07B176                           ; $07B168 |
  AND #$0003                                ; $07B16A |
  BNE CODE_07B176                           ; $07B16D |
  LDA #$001B                                ; $07B16F |\ play sound #$001B
  JSL push_sound_queue                      ; $07B172 |/

CODE_07B176:
  RTS                                       ; $07B176 |

CODE_07B177:
  REP #$10                                  ; $07B177 |
  TXY                                       ; $07B179 |
  TAX                                       ; $07B17A |
  LDA $00E9D4,x                             ; $07B17B |
  STA !s_spr_y_speed_lo,y                   ; $07B17F |
  LDA $00E954,x                             ; $07B182 |
  LDX !s_spr_facing_dir,y                   ; $07B186 |
  EOR $B07C,x                               ; $07B189 |
  INC A                                     ; $07B18C |
  STA !s_spr_x_speed_lo,y                   ; $07B18D |
  TYX                                       ; $07B190 |
  SEP #$10                                  ; $07B191 |
  RTS                                       ; $07B193 |

CODE_07B194:
  LDY !s_spr_collision_id,x                 ; $07B194 |
  BPL CODE_07B1A5                           ; $07B197 |
  JSL $07FC2F                               ; $07B199 |
  BCS CODE_07B1A5                           ; $07B19D |
  BEQ CODE_07B1A5                           ; $07B19F |
  JSL player_hit_sprite                     ; $07B1A1 |

CODE_07B1A5:
  RTS                                       ; $07B1A5 |

  dw $FEA0, $0160, $0020, $FFE0             ; $07B1A6 |

  dw $F800, $0800                           ; $07B1AE |

  dw $FF80, $0080                           ; $07B1B2 |

  LDA !s_spr_x_pixel_pos,x                  ; $07B1B6 |
  AND #$0010                                ; $07B1B9 |
  LSR A                                     ; $07B1BC |
  LSR A                                     ; $07B1BD |
  LSR A                                     ; $07B1BE |
  TAY                                       ; $07B1BF |
  LDA !s_spr_y_pixel_pos,x                  ; $07B1C0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B1C3 |
  LDA $B1A6,y                               ; $07B1C5 |
  STA !s_spr_y_speed_lo,x                   ; $07B1C8 |
  LDA $B1AE,y                               ; $07B1CB |
  STA !s_spr_y_accel_ceiling,x              ; $07B1CE |
  LDA #$0008                                ; $07B1D1 |
  STA !s_spr_y_accel,x                      ; $07B1D4 |
  LDY !s_spr_facing_dir,x                   ; $07B1D7 |
  LDA $B1B2,y                               ; $07B1DA |
  STA !s_spr_x_speed_lo,x                   ; $07B1DD |
  LDA #$0000                                ; $07B1E0 |
  STA !s_spr_anim_frame,x                   ; $07B1E3 |
  LDY #$00                                  ; $07B1E6 |
  LDA !s_spr_y_speed_lo,x                   ; $07B1E8 |
  BPL CODE_07B1EF                           ; $07B1EB |
  INY                                       ; $07B1ED |
  INY                                       ; $07B1EE |

CODE_07B1EF:
  LDA $B0CD,y                               ; $07B1EF |
  STA !s_spr_timer_1,x                      ; $07B1F2 |
  LDA #$0040                                ; $07B1F5 |
  STA !s_spr_timer_3,x                      ; $07B1F8 |
  RTL                                       ; $07B1FB |

main_fang_flying_wavily:
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B1FC |
  BEQ CODE_07B20F                           ; $07B1FF |
  LDA !s_spr_state,x                        ; $07B201 |
  CMP #$0010                                ; $07B204 |
  BEQ CODE_07B20F                           ; $07B207 |
  DEC !r_bat_gen_amount                     ; $07B209 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $07B20C |

CODE_07B20F:
  JSR CODE_07B253                           ; $07B20F |
  JSL $03AF23                               ; $07B212 |
  JSL $07FC64                               ; $07B216 |
  BCC CODE_07B22B                           ; $07B21A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B21C |
  BEQ CODE_07B227                           ; $07B21F |
  DEC !r_bat_gen_amount                     ; $07B221 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $07B224 |

CODE_07B227:
  JML $03A31E                               ; $07B227 |

CODE_07B22B:
  JSR CODE_07B165                           ; $07B22B |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07B22E |
  BNE CODE_07B24F                           ; $07B231 |
  JSR CODE_07B194                           ; $07B233 |
  LDY #$00                                  ; $07B236 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B238 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $07B23B |
  BPL CODE_07B241                           ; $07B23D |
  INY                                       ; $07B23F |
  INY                                       ; $07B240 |

CODE_07B241:
  LDA $B1AE,y                               ; $07B241 |
  STA !s_spr_y_accel_ceiling,x              ; $07B244 |
  JSR CODE_07B0F5                           ; $07B247 |
  JSL $03A5B7                               ; $07B24A |
  RTL                                       ; $07B24E |

CODE_07B24F:
  JSR CODE_07B0F5                           ; $07B24F |
  RTL                                       ; $07B252 |

CODE_07B253:
  LDA !s_spr_collision_state,x              ; $07B253 |
  BEQ CODE_07B281                           ; $07B256 |
  STZ !s_spr_collision_state,x              ; $07B258 |
  LDA #$0001                                ; $07B25B |
  STA !s_spr_gsu_morph_2_lo,x               ; $07B25E |
  LDA #$0040                                ; $07B261 |
  STA !s_spr_y_accel,x                      ; $07B264 |
  LDA #$FF00                                ; $07B267 |
  STA !s_spr_y_accel_ceiling,x              ; $07B26A |
  LDA #$0020                                ; $07B26D |
  STA !s_spr_x_accel_ceiling,x              ; $07B270 |
  LDA #$0200                                ; $07B273 |
  LDY !s_spr_x_speed_hi,x                   ; $07B276 |
  BPL CODE_07B27E                           ; $07B279 |
  LDA #$FE00                                ; $07B27B |

CODE_07B27E:
  STA !s_spr_x_speed_lo,x                   ; $07B27E |

CODE_07B281:
  RTS                                       ; $07B281 |

  dw $0020, $FFE0                           ; $07B282 |

  dw $FF00, $0100                           ; $07B286 |

  dw $0100, $FF00                           ; $07B28A |

; also the randomly jumping one
init_flopsy_fish:
  LDA !r_cur_stage                          ; $07B28E |
  CMP #$0029                                ; $07B291 |
  BNE CODE_07B2A0                           ; $07B294 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B296 |
  CLC                                       ; $07B299 |
  ADC #$0004                                ; $07B29A |
  STA !s_spr_y_pixel_pos,x                  ; $07B29D |

CODE_07B2A0:
  LDA !s_spr_x_pixel_pos,x                  ; $07B2A0 |
  AND #$0010                                ; $07B2A3 |
  LSR A                                     ; $07B2A6 |
  LSR A                                     ; $07B2A7 |
  LSR A                                     ; $07B2A8 |
  EOR #$0002                                ; $07B2A9 |
  STA !s_spr_facing_dir,x                   ; $07B2AC |
  TAY                                       ; $07B2AF |
  LDA !s_spr_x_pixel_pos,x                  ; $07B2B0 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B2B3 |
  CLC                                       ; $07B2B5 |
  ADC $B282,y                               ; $07B2B6 |
  STA !s_spr_x_pixel_pos,x                  ; $07B2B9 |
  LDA $B286,y                               ; $07B2BC |
  STA !s_spr_x_speed_lo,x                   ; $07B2BF |
  LDA #$0003                                ; $07B2C2 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B2C5 |
  TAY                                       ; $07B2C7 |
  LDA $B2EB,y                               ; $07B2C8 |
  AND #$00FF                                ; $07B2CB |
  STA !s_spr_anim_frame,x                   ; $07B2CE |
  LDA $B2EF,y                               ; $07B2D1 |
  AND #$00FF                                ; $07B2D4 |
  STA !s_spr_timer_1,x                      ; $07B2D7 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B2DA |
  CLC                                       ; $07B2DD |
  ADC #$0004                                ; $07B2DE |
  STA !s_spr_gsu_morph_1_lo,x               ; $07B2E1 |
  STA !s_spr_wildcard_2_lo,x                ; $07B2E4 |
  STZ !s_spr_wildcard_1_lo,x                ; $07B2E7 |
  RTL                                       ; $07B2EA |

  db $00, $0E, $00, $01                     ; $07B2EB |

  db $08, $0A, $08, $0A                     ; $07B2EF |

; the non-jumping one
main_flopsy_fish:
  LDA !s_spr_state,x                        ; $07B2F3 |
  CMP #$000C                                ; $07B2F6 |
  BNE CODE_07B301                           ; $07B2F9 |
  LDA #$0003                                ; $07B2FB |
  STA !s_spr_anim_frame,x                   ; $07B2FE |

CODE_07B301:
  JSL $03AF23                               ; $07B301 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07B305 |
  TAX                                       ; $07B307 |
  JSR ($B330,x)                             ; $07B308 |
  JSL $03A5B7                               ; $07B30B |
  RTL                                       ; $07B30F |

main_flopsy_fish_jumping:
  LDA !s_spr_state,x                        ; $07B310 |
  CMP #$000C                                ; $07B313 |
  BNE CODE_07B31E                           ; $07B316 |
  LDA #$0003                                ; $07B318 |
  STA !s_spr_anim_frame,x                   ; $07B31B |

CODE_07B31E:
  JSL $03AF23                               ; $07B31E |
  JSR CODE_07B33E                           ; $07B322 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07B325 |
  TAX                                       ; $07B327 |
  JSR ($B330,x)                             ; $07B328 |
  JSL $03A5B7                               ; $07B32B |
  RTL                                       ; $07B32F |

  dw $B35F, $B3FE, $B455, $B492             ; $07B330 |
  dw $B53D, $B580, $B5D6                    ; $07B338 |

CODE_07B33E:
  LDA !s_spr_gsu_morph_2_lo,x               ; $07B33E |
  BNE CODE_07B35E                           ; $07B341 |
  LDA $10                                   ; $07B343 |
  AND #$003F                                ; $07B345 |
  BNE CODE_07B35E                           ; $07B348 |
  STZ !s_spr_x_speed_lo,x                   ; $07B34A |
  STZ !s_spr_x_accel,x                      ; $07B34D |
  STZ !s_spr_y_speed_lo,x                   ; $07B350 |
  STZ !s_spr_y_accel,x                      ; $07B353 |
  INC !s_spr_gsu_morph_2_lo,x               ; $07B356 |
  LDA #$0004                                ; $07B359 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07B35C |

CODE_07B35E:
  RTS                                       ; $07B35E |

  LDX $12                                   ; $07B35F |
  JSR CODE_07B645                           ; $07B361 |
  LDA !s_spr_x_pixel_pos,x                  ; $07B364 |
  SEC                                       ; $07B367 |
  SBC !s_spr_wildcard_4_lo_dp,x             ; $07B368 |
  PHA                                       ; $07B36A |
  CLC                                       ; $07B36B |
  ADC #$0020                                ; $07B36C |
  CMP #$0040                                ; $07B36F |
  BCS CODE_07B3BB                           ; $07B372 |
  STZ !s_spr_x_accel,x                      ; $07B374 |
  PLA                                       ; $07B377 |
  CLC                                       ; $07B378 |
  ADC #$0010                                ; $07B379 |
  CMP #$0020                                ; $07B37C |
  BCC CODE_07B387                           ; $07B37F |
  LDA #$0004                                ; $07B381 |
  STA !s_spr_x_accel,x                      ; $07B384 |

CODE_07B387:
  LDY #$00                                  ; $07B387 |
  LDA !s_spr_x_pixel_pos,x                  ; $07B389 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $07B38C |
  BCC CODE_07B392                           ; $07B38E |
  INY                                       ; $07B390 |
  INY                                       ; $07B391 |

CODE_07B392:
  LDA $B28A,y                               ; $07B392 |
  STA !s_spr_x_accel_ceiling,x              ; $07B395 |
  LDA !s_spr_timer_1,x                      ; $07B398 |
  BNE CODE_07B3BA                           ; $07B39B |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B39D |
  BPL CODE_07B3A6                           ; $07B39F |
  LDA #$0003                                ; $07B3A1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B3A4 |

CODE_07B3A6:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B3A6 |
  LDA $B2EB,y                               ; $07B3A8 |
  AND #$00FF                                ; $07B3AB |
  STA !s_spr_anim_frame,x                   ; $07B3AE |
  LDA $B2EF,y                               ; $07B3B1 |
  AND #$00FF                                ; $07B3B4 |
  STA !s_spr_timer_1,x                      ; $07B3B7 |

CODE_07B3BA:
  RTS                                       ; $07B3BA |

CODE_07B3BB:
  PLA                                       ; $07B3BB |
  AND #$8000                                ; $07B3BC |
  ASL A                                     ; $07B3BF |
  ROL A                                     ; $07B3C0 |
  ASL A                                     ; $07B3C1 |
  TAY                                       ; $07B3C2 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07B3C3 |
  CLC                                       ; $07B3C5 |
  ADC $B282,y                               ; $07B3C6 |
  STA !s_spr_x_pixel_pos,x                  ; $07B3C9 |
  STZ !s_spr_x_speed_lo,x                   ; $07B3CC |
  STZ !s_spr_x_accel,x                      ; $07B3CF |
  LDA #$0008                                ; $07B3D2 |
  STA !s_spr_timer_1,x                      ; $07B3D5 |
  LDA #$0004                                ; $07B3D8 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B3DB |
  LDA #$0000                                ; $07B3DD |
  STA !s_spr_anim_frame,x                   ; $07B3E0 |
  LDA $B3F0,y                               ; $07B3E3 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07B3E6 |
  INC !s_spr_gsu_morph_2_lo,x               ; $07B3E8 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B3EB |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B3ED |
  RTS                                       ; $07B3EF |

  dw $B3F9, $B3F4                           ; $07B3F0 |

  db $00, $0E, $10, $0E, $00                ; $07B3F4 |

  db $00, $01, $0F, $01, $00                ; $07B3F9 |

  LDX $12                                   ; $07B3FE |
  JSR CODE_07B645                           ; $07B400 |
  LDA !s_spr_timer_1,x                      ; $07B403 |
  BNE CODE_07B42D                           ; $07B406 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B408 |
  BMI CODE_07B42E                           ; $07B40A |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B40C |
  CPY #$02                                  ; $07B40E |
  BNE CODE_07B41B                           ; $07B410 |
  LDA !s_spr_facing_dir,x                   ; $07B412 |
  EOR #$0002                                ; $07B415 |
  STA !s_spr_facing_dir,x                   ; $07B418 |

CODE_07B41B:
  LDA #$0008                                ; $07B41B |
  STA !s_spr_timer_1,x                      ; $07B41E |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07B421 |
  STA $00                                   ; $07B423 |
  LDA ($00),y                               ; $07B425 | table at $07B3F4 or $07B3F9
  AND #$00FF                                ; $07B427 |
  STA !s_spr_anim_frame,x                   ; $07B42A |

CODE_07B42D:
  RTS                                       ; $07B42D |

CODE_07B42E:
  STZ !s_spr_gsu_morph_2_lo,x               ; $07B42E |

CODE_07B431:
  LDA #$0003                                ; $07B431 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B434 |
  TAY                                       ; $07B436 |
  LDA $B2EB,y                               ; $07B437 |
  AND #$00FF                                ; $07B43A |
  STA !s_spr_anim_frame,x                   ; $07B43D |
  LDA $B2EF,y                               ; $07B440 |
  AND #$00FF                                ; $07B443 |
  STA !s_spr_timer_1,x                      ; $07B446 |
  LDY !s_spr_facing_dir,x                   ; $07B449 |
  LDA $B286,y                               ; $07B44C |
  STA !s_spr_x_speed_lo,x                   ; $07B44F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07B452 |
  RTS                                       ; $07B454 |

  LDX $12                                   ; $07B455 |
  LDA !s_spr_timer_1,x                      ; $07B457 |
  BNE CODE_07B46E                           ; $07B45A |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B45C |
  BMI CODE_07B46F                           ; $07B45E |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B460 |
  LDA #$0002                                ; $07B462 |
  STA !s_spr_timer_1,x                      ; $07B465 |
  LDA #$0002                                ; $07B468 |
  STA !s_spr_anim_frame,x                   ; $07B46B |

CODE_07B46E:
  RTS                                       ; $07B46E |

CODE_07B46F:
  LDA #$0002                                ; $07B46F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B472 |
  TAY                                       ; $07B474 |
  LDA $B48F,y                               ; $07B475 |
  AND #$00FF                                ; $07B478 |
  STA !s_spr_anim_frame,x                   ; $07B47B |
  LDA #$0006                                ; $07B47E |
  STA !s_spr_timer_1,x                      ; $07B481 |
  LDA #$F900                                ; $07B484 |
  STA !s_spr_y_speed_lo,x                   ; $07B487 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B48A |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B48C |
  RTS                                       ; $07B48E |

  db $05, $04, $03                          ; $07B48F |

  LDX $12                                   ; $07B492 |
  JSR CODE_07B674                           ; $07B494 |
  LDA !s_spr_y_speed_lo,x                   ; $07B497 |
  CLC                                       ; $07B49A |
  ADC #$0100                                ; $07B49B |
  BMI CODE_07B4A3                           ; $07B49E |
  JMP CODE_07B52F                           ; $07B4A0 |

CODE_07B4A3:
  LDY !s_spr_wildcard_1_lo,x                ; $07B4A3 |
  BNE CODE_07B4DD                           ; $07B4A6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B4A8 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $07B4AB |
  BPL CODE_07B4DD                           ; $07B4AE |
  LDA #$01FE                                ; $07B4B0 |
  JSL spawn_ambient_sprite                  ; $07B4B3 |
  LDA !s_spr_x_pixel_pos,x                  ; $07B4B7 |
  STA $70A2,y                               ; $07B4BA |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B4BD |
  SEC                                       ; $07B4C0 |
  SBC #$0008                                ; $07B4C1 |
  STA $7142,y                               ; $07B4C4 |
  LDA #$0006                                ; $07B4C7 |
  STA $73C2,y                               ; $07B4CA |
  LDA #$0002                                ; $07B4CD |
  STA $7782,y                               ; $07B4D0 |
  LDA #$0003                                ; $07B4D3 |\ play sound #$0003
  JSL push_sound_queue                      ; $07B4D6 |/
  INC !s_spr_wildcard_1_lo,x                ; $07B4DA |

CODE_07B4DD:
  LDA !s_spr_y_pixel_pos,x                  ; $07B4DD |
  CMP !s_spr_gsu_morph_1_lo,x               ; $07B4E0 |
  BPL CODE_07B50F                           ; $07B4E3 |
  LDA !s_spr_timer_2,x                      ; $07B4E5 |
  BNE CODE_07B50F                           ; $07B4E8 |
  LDA #$01FD                                ; $07B4EA |
  JSL spawn_ambient_sprite                  ; $07B4ED |
  LDA !s_spr_x_pixel_pos,x                  ; $07B4F1 |
  STA $70A2,y                               ; $07B4F4 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B4F7 |
  STA $7142,y                               ; $07B4FA |
  LDA #$000F                                ; $07B4FD |
  STA $73C2,y                               ; $07B500 |
  LDA #$0003                                ; $07B503 |
  STA $7782,y                               ; $07B506 |
  LDA #$0006                                ; $07B509 |
  STA !s_spr_timer_2,x                      ; $07B50C |

CODE_07B50F:
  LDA !s_spr_timer_1,x                      ; $07B50F |
  BNE CODE_07B52E                           ; $07B512 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B514 |
  BPL CODE_07B51D                           ; $07B516 |
  LDA #$0002                                ; $07B518 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B51B |

CODE_07B51D:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B51D |
  LDA $B48F,y                               ; $07B51F |
  AND #$00FF                                ; $07B522 |
  STA !s_spr_anim_frame,x                   ; $07B525 |
  LDA #$0006                                ; $07B528 |
  STA !s_spr_timer_1,x                      ; $07B52B |

CODE_07B52E:
  RTS                                       ; $07B52E |

CODE_07B52F:
  LDA #$0006                                ; $07B52F |
  STA !s_spr_anim_frame,x                   ; $07B532 |
  STZ !s_spr_wildcard_1_lo,x                ; $07B535 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B538 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B53A |
  RTS                                       ; $07B53C |

  LDX $12                                   ; $07B53D |
  JSR CODE_07B674                           ; $07B53F |
  LDY #$06                                  ; $07B542 |
  LDA !s_spr_y_speed_lo,x                   ; $07B544 |
  CLC                                       ; $07B547 |
  ADC #$0100                                ; $07B548 |
  CMP #$0100                                ; $07B54B |
  BCC CODE_07B55E                           ; $07B54E |
  LDY #$07                                  ; $07B550 |
  CMP #$0180                                ; $07B552 |
  BCC CODE_07B55E                           ; $07B555 |
  CMP #$0200                                ; $07B557 |
  BCS CODE_07B563                           ; $07B55A |
  LDY #$08                                  ; $07B55C |

CODE_07B55E:
  TYA                                       ; $07B55E |
  STA !s_spr_anim_frame,x                   ; $07B55F |
  RTS                                       ; $07B562 |

CODE_07B563:
  LDA #$0002                                ; $07B563 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B566 |
  TAY                                       ; $07B568 |
  LDA $B57D,y                               ; $07B569 |
  AND #$00FF                                ; $07B56C |
  STA !s_spr_anim_frame,x                   ; $07B56F |
  LDA #$0006                                ; $07B572 |
  STA !s_spr_timer_1,x                      ; $07B575 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B578 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B57A |
  RTS                                       ; $07B57C |

  db $0B, $0A, $09                          ; $07B57D |

  LDX $12                                   ; $07B580 |
  JSR CODE_07B674                           ; $07B582 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B585 |
  SEC                                       ; $07B588 |
  SBC !s_spr_y_pixel_pos,x                  ; $07B589 |
  CMP #$0020                                ; $07B58C |
  BCC CODE_07B5B1                           ; $07B58F |
  LDA !s_spr_timer_1,x                      ; $07B591 |
  BNE CODE_07B5B0                           ; $07B594 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B596 |
  BPL CODE_07B59F                           ; $07B598 |
  LDA #$0002                                ; $07B59A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B59D |

CODE_07B59F:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B59F |
  LDA $B57D,y                               ; $07B5A1 |
  AND #$00FF                                ; $07B5A4 |
  STA !s_spr_anim_frame,x                   ; $07B5A7 |
  LDA #$0006                                ; $07B5AA |
  STA !s_spr_timer_1,x                      ; $07B5AD |

CODE_07B5B0:
  RTS                                       ; $07B5B0 |

CODE_07B5B1:
  LDA #$0003                                ; $07B5B1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B5B4 |
  TAY                                       ; $07B5B6 |
  LDA $B5CE,y                               ; $07B5B7 |
  AND #$00FF                                ; $07B5BA |
  STA !s_spr_anim_frame,x                   ; $07B5BD |
  LDA $B5D2,y                               ; $07B5C0 |
  AND #$00FF                                ; $07B5C3 |
  STA !s_spr_timer_1,x                      ; $07B5C6 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B5C9 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B5CB |
  RTS                                       ; $07B5CD |

  db $01, $02, $0D, $0C                     ; $07B5CE |

  db $08, $0C, $08, $08                     ; $07B5D2 |

  LDX $12                                   ; $07B5D6 |
  JSR CODE_07B674                           ; $07B5D8 |
  LDY !s_spr_wildcard_1_lo,x                ; $07B5DB |
  BNE CODE_07B615                           ; $07B5DE |
  LDA !s_spr_y_pixel_pos,x                  ; $07B5E0 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $07B5E3 |
  BMI CODE_07B615                           ; $07B5E6 |
  LDA #$01FE                                ; $07B5E8 |
  JSL spawn_ambient_sprite                  ; $07B5EB |
  LDA !s_spr_x_pixel_pos,x                  ; $07B5EF |
  STA $70A2,y                               ; $07B5F2 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B5F5 |
  SEC                                       ; $07B5F8 |
  SBC #$0008                                ; $07B5F9 |
  STA $7142,y                               ; $07B5FC |
  LDA #$0006                                ; $07B5FF |
  STA $73C2,y                               ; $07B602 |
  LDA #$0002                                ; $07B605 |
  STA $7782,y                               ; $07B608 |
  LDA #$0003                                ; $07B60B |\ play sound #$0003
  JSL push_sound_queue                      ; $07B60E |/
  INC !s_spr_wildcard_1_lo,x                ; $07B612 |

CODE_07B615:
  LDA !s_spr_timer_1,x                      ; $07B615 |
  BNE CODE_07B638                           ; $07B618 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07B61A |
  BPL CODE_07B624                           ; $07B61C |
  STZ !s_spr_wildcard_1_lo,x                ; $07B61E |
  JMP CODE_07B431                           ; $07B621 |

CODE_07B624:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07B624 |
  LDA $B5CE,y                               ; $07B626 |
  AND #$00FF                                ; $07B629 |
  STA !s_spr_anim_frame,x                   ; $07B62C |
  LDA $B5D2,y                               ; $07B62F |
  AND #$00FF                                ; $07B632 |
  STA !s_spr_timer_1,x                      ; $07B635 |

CODE_07B638:
  RTS                                       ; $07B638 |

  dw $0040, $FFC0                           ; $07B639 |

  dw $0008, $0008                           ; $07B63D |

  dw $0000, $0004                           ; $07B641 |

CODE_07B645:
  LDA !s_spr_y_speed_lo,x                   ; $07B645 |
  AND #$8000                                ; $07B648 |
  ASL A                                     ; $07B64B |
  ROL A                                     ; $07B64C |
  ASL A                                     ; $07B64D |
  TAY                                       ; $07B64E |
  LDA !s_spr_y_hitbox_center,x              ; $07B64F |
  CLC                                       ; $07B652 |
  ADC $B641,y                               ; $07B653 |
  LDY #$00                                  ; $07B656 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $07B658 |
  BMI CODE_07B65F                           ; $07B65B |
  INY                                       ; $07B65D |
  INY                                       ; $07B65E |

CODE_07B65F:
  LDA $B639,y                               ; $07B65F |
  STA !s_spr_y_accel_ceiling,x              ; $07B662 |
  LDA $B63D,y                               ; $07B665 |
  STA !s_spr_y_accel,x                      ; $07B668 |
  RTS                                       ; $07B66B |

  dw $0400, $FF00                           ; $07B66C |

  dw $0040, $0040                           ; $07B670 |

CODE_07B674:
  LDA !s_spr_y_speed_lo,x                   ; $07B674 |
  AND #$8000                                ; $07B677 |
  ASL A                                     ; $07B67A |
  ROL A                                     ; $07B67B |
  ASL A                                     ; $07B67C |
  TAY                                       ; $07B67D |
  LDA !s_spr_y_hitbox_center,x              ; $07B67E |
  CLC                                       ; $07B681 |
  ADC $B641,y                               ; $07B682 |
  LDY #$00                                  ; $07B685 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $07B687 |
  BMI CODE_07B68E                           ; $07B68A |
  INY                                       ; $07B68C |
  INY                                       ; $07B68D |

CODE_07B68E:
  LDA $B66C,y                               ; $07B68E |
  STA !s_spr_y_accel_ceiling,x              ; $07B691 |
  LDA $B670,y                               ; $07B694 |
  STA !s_spr_y_accel,x                      ; $07B697 |
  RTS                                       ; $07B69A |

  dw $FFE0, $0020                           ; $07B69B |

  dw $0060, $0030                           ; $07B69F |

init_blue_sluggy:
  LDY !s_spr_facing_dir,x                   ; $07B6A3 |
  LDA $B69B,y                               ; $07B6A6 |
  STA !s_spr_x_speed_lo,x                   ; $07B6A9 |

init_pink_sluggy:
  LDA #$0008                                ; $07B6AC |
  STA !s_spr_timer_1,x                      ; $07B6AF |
  LDA #$0003                                ; $07B6B2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B6B5 |
  TAY                                       ; $07B6B7 |
  LDA $B74B,y                               ; $07B6B8 |
  AND #$00FF                                ; $07B6BB |
  STA !s_spr_anim_frame,x                   ; $07B6BE |
  LDA #$0100                                ; $07B6C1 |
  STA !s_spr_y_accel,x                      ; $07B6C4 |
  LDA !s_spr_x_pixel_pos,x                  ; $07B6C7 |
  AND #$0010                                ; $07B6CA |
  LSR A                                     ; $07B6CD |
  LSR A                                     ; $07B6CE |
  LSR A                                     ; $07B6CF |
  TAY                                       ; $07B6D0 |
  LDA $B69F,y                               ; $07B6D1 |
  STA !s_spr_wildcard_1_lo,x                ; $07B6D4 |
  ASL A                                     ; $07B6D7 |
  STA !s_spr_wildcard_2_lo,x                ; $07B6D8 |
  RTL                                       ; $07B6DB |

; blue and pink
main_sluggy:
  LDA !s_spr_collision_state,x              ; $07B6DC |
  BEQ CODE_07B704                           ; $07B6DF |
  LDA !s_sprite_disable_flag                ; $07B6E1 |
  ORA $0B55                                 ; $07B6E4 |
  ORA !r_cur_item_used                      ; $07B6E7 |
  BNE CODE_07B704                           ; $07B6EA |
  LDA #$0005                                ; $07B6EC |
  STA !s_spr_anim_frame,x                   ; $07B6EF |
  LDA !s_spr_oam_yxppccct,x                 ; $07B6F2 |
  AND #$FF7F                                ; $07B6F5 |
  STA !s_spr_oam_yxppccct,x                 ; $07B6F8 |
  LDA !s_spr_bitwise_settings_3,x           ; $07B6FB |
  AND #$FFE0                                ; $07B6FE |
  STA !s_spr_bitwise_settings_3,x           ; $07B701 |

CODE_07B704:
  JSL $03AF23                               ; $07B704 |
  JSL $07B853                               ; $07B708 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07B70C |
  TAX                                       ; $07B70E |
  JSR ($B716,x)                             ; $07B70F |
  JML $07B830                               ; $07B712 |

  dw $B71E                                  ; $07B716 |
  dw $B774                                  ; $07B718 |
  dw $B7C1                                  ; $07B71A |
  dw $B82B                                  ; $07B71C |

  LDX $12                                   ; $07B71E |
  JSL $07FC7B                               ; $07B720 |
  LDA !s_spr_x_hitbox_center,x              ; $07B724 |
  SEC                                       ; $07B727 |
  SBC !s_player_center_x                    ; $07B728 |
  CLC                                       ; $07B72B |
  ADC !s_spr_wildcard_1_lo,x                ; $07B72C |
  CMP !s_spr_wildcard_2_lo,x                ; $07B72F |
  BCS CODE_07B74F                           ; $07B732 |
  STZ !s_spr_x_speed_lo,x                   ; $07B734 |
  LDA #$0004                                ; $07B737 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B73A |
  TAY                                       ; $07B73C |
  LDA $B76F,y                               ; $07B73D |
  AND #$00FF                                ; $07B740 |
  STA !s_spr_anim_frame,x                   ; $07B743 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B746 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B748 |
  RTS                                       ; $07B74A |

  db $01, $02, $01, $00                     ; $07B74B |

CODE_07B74F:
  LDA !s_spr_timer_1,x                      ; $07B74F |
  BNE CODE_07B76E                           ; $07B752 |
  LDA #$0008                                ; $07B754 |
  STA !s_spr_timer_1,x                      ; $07B757 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07B75A |
  BPL CODE_07B763                           ; $07B75C |
  LDA #$0003                                ; $07B75E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B761 |

CODE_07B763:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07B763 |
  LDA $B74B,y                               ; $07B765 |
  AND #$00FF                                ; $07B768 |
  STA !s_spr_anim_frame,x                   ; $07B76B |

CODE_07B76E:
  RTS                                       ; $07B76E |

  db $04, $03, $02, $01, $00                ; $07B76F |

  LDX $12                                   ; $07B774 |
  LDA !s_spr_timer_1,x                      ; $07B776 |
  BNE CODE_07B790                           ; $07B779 |
  LDA #$0004                                ; $07B77B |
  STA !s_spr_timer_1,x                      ; $07B77E |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07B781 |
  BMI CODE_07B791                           ; $07B783 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07B785 |
  LDA $B76F,y                               ; $07B787 |
  AND #$00FF                                ; $07B78A |
  STA !s_spr_anim_frame,x                   ; $07B78D |

CODE_07B790:
  RTS                                       ; $07B790 |

CODE_07B791:
  LDA !s_spr_y_pixel_pos,x                  ; $07B791 |
  CLC                                       ; $07B794 |
  ADC #$0004                                ; $07B795 |
  STA !s_spr_y_pixel_pos,x                  ; $07B798 |
  LDA #$0005                                ; $07B79B |
  STA !s_spr_anim_frame,x                   ; $07B79E |
  LDA #$0400                                ; $07B7A1 |
  STA !s_spr_y_accel_ceiling,x              ; $07B7A4 |
  LDA #$0040                                ; $07B7A7 |
  STA !s_spr_y_accel,x                      ; $07B7AA |
  LDA #$0005                                ; $07B7AD |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B7B0 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B7B2 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B7B4 |
  RTS                                       ; $07B7B6 |

  db $02, $01, $00, $01, $02                ; $07B7B7 |

  db $10, $04, $04, $01, $01                ; $07B7BC |

  LDX $12                                   ; $07B7C1 |
  LDA $7860,x                               ; $07B7C3 |
  BIT #$0001                                ; $07B7C6 |
  BEQ CODE_07B7FE                           ; $07B7C9 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07B7CB |
  BNE CODE_07B7E1                           ; $07B7CD |
  LDA #$0060                                ; $07B7CF |\ play sound #$0060
  JSL push_sound_queue                      ; $07B7D2 |/
  LDA !s_spr_oam_yxppccct,x                 ; $07B7D6 |
  ORA #$0080                                ; $07B7D9 |
  STA !s_spr_oam_yxppccct,x                 ; $07B7DC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07B7DF |

CODE_07B7E1:
  LDA !s_spr_timer_1,x                      ; $07B7E1 |
  BNE CODE_07B7FE                           ; $07B7E4 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07B7E6 |
  BMI CODE_07B7FF                           ; $07B7E8 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07B7EA |
  LDA $B7B7,y                               ; $07B7EC |
  AND #$00FF                                ; $07B7EF |
  STA !s_spr_anim_frame,x                   ; $07B7F2 |
  LDA $B7BC,y                               ; $07B7F5 |
  AND #$00FF                                ; $07B7F8 |
  STA !s_spr_timer_1,x                      ; $07B7FB |

CODE_07B7FE:
  RTS                                       ; $07B7FE |

CODE_07B7FF:
  LDA #$0008                                ; $07B7FF |
  STA !s_spr_timer_1,x                      ; $07B802 |
  LDA #$0003                                ; $07B805 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B808 |
  TAY                                       ; $07B80A |
  LDA $B74B,y                               ; $07B80B |
  AND #$00FF                                ; $07B80E |
  STA !s_spr_anim_frame,x                   ; $07B811 |
  LDA !s_spr_bitwise_settings_3,x           ; $07B814 |
  ORA #$0100                                ; $07B817 |
  STA !s_spr_bitwise_settings_3,x           ; $07B81A |
  LDY !s_spr_facing_dir,x                   ; $07B81D |
  LDA $B69B,y                               ; $07B820 |
  STA !s_spr_x_speed_lo,x                   ; $07B823 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B826 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07B828 |
  RTS                                       ; $07B82A |

  LDX $12                                   ; $07B82B |
  JMP CODE_07B74F                           ; $07B82D |
  LDY !s_spr_collision_id,x                 ; $07B830 |
  BPL CODE_07B852                           ; $07B833 |
  LDA $7860,x                               ; $07B835 |
  BIT #$0001                                ; $07B838 |
  BEQ CODE_07B845                           ; $07B83B |
  JSL $07FC2A                               ; $07B83D |
  BCS CODE_07B849                           ; $07B841 |
  BEQ CODE_07B852                           ; $07B843 |

CODE_07B845:
  JML $03A858                               ; $07B845 |

CODE_07B849:
  LDA #$000E                                ; $07B849 |
  STA !s_spr_state,x                        ; $07B84C |
  STZ !s_spr_x_speed_lo,x                   ; $07B84F |

CODE_07B852:
  RTL                                       ; $07B852 |

  LDY !s_spr_collision_id,x                 ; $07B853 |
  DEY                                       ; $07B856 |
  BMI CODE_07B8B2                           ; $07B857 |
  BEQ CODE_07B8B2                           ; $07B859 |
  LDA !s_spr_state,y                        ; $07B85B |
  CMP #$0010                                ; $07B85E |
  BNE CODE_07B8B2                           ; $07B861 |
  LDA !s_spr_collision_state,y              ; $07B863 |
  BEQ CODE_07B8B2                           ; $07B866 |
  LDA #$0062                                ; $07B868 |\ play sound #$0062
  JSL push_sound_queue                      ; $07B86B |/
  LDA #$000E                                ; $07B86F |
  STA !s_spr_state,x                        ; $07B872 |
  STZ !s_spr_y_speed_lo,x                   ; $07B875 |
  STZ !s_spr_x_speed_lo,x                   ; $07B878 |
  STZ !s_spr_x_accel,x                      ; $07B87B |
  STZ !s_spr_x_accel_ceiling,x              ; $07B87E |
  LDA #$0040                                ; $07B881 |
  STA !s_spr_y_accel,x                      ; $07B884 |
  LDA #$0400                                ; $07B887 |
  STA !s_spr_y_accel_ceiling,x              ; $07B88A |
  LDA #$0005                                ; $07B88D |
  STA !s_spr_anim_frame,x                   ; $07B890 |
  LDA !s_spr_oam_yxppccct,x                 ; $07B893 |
  AND #$FF7F                                ; $07B896 |
  STA !s_spr_oam_yxppccct,x                 ; $07B899 |
  LDA !s_spr_bitwise_settings_3,x           ; $07B89C |
  AND #$FFE0                                ; $07B89F |
  STA !s_spr_bitwise_settings_3,x           ; $07B8A2 |
  SEP #$20                                  ; $07B8A5 |
  LDA #$FF                                  ; $07B8A7 |
  STA !s_spr_stage_id,x                     ; $07B8A9 |
  REP #$20                                  ; $07B8AC |
  INC !s_spr_wildcard_6_lo_dp,x             ; $07B8AE |
  PLY                                       ; $07B8B0 |
  PLA                                       ; $07B8B1 |

CODE_07B8B2:
  RTL                                       ; $07B8B2 |

  dw $0021, $0023, $0025                    ; $07B8B3 |

  LDA !s_spr_wildcard_6_lo,x                ; $07B8B9 |
  BNE CODE_07B938                           ; $07B8BC |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07B8BE |
  BNE CODE_07B928                           ; $07B8C1 |
  LDA !s_player_y_speed                     ; $07B8C3 |
  BMI CODE_07B91F                           ; $07B8C6 |
  LDA #$0001                                ; $07B8C8 |
  STA !s_on_sprite_platform_flag            ; $07B8CB |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07B8CE |
  BNE CODE_07B8F3                           ; $07B8D1 |
  LDA #$0003                                ; $07B8D3 |
  STA !s_spr_timer_1,x                      ; $07B8D6 |
  LDA #$0002                                ; $07B8D9 |
  STA !s_spr_anim_frame,x                   ; $07B8DC |
  LDA #$0100                                ; $07B8DF |
  STA !s_player_y_speed                     ; $07B8E2 |
  LDA !s_spr_y_pixel_pos,x                  ; $07B8E5 |
  SEC                                       ; $07B8E8 |
  SBC #$0020                                ; $07B8E9 |
  STA !s_player_y                           ; $07B8EC |
  INC !s_spr_gsu_morph_1_lo,x               ; $07B8EF |
  RTL                                       ; $07B8F2 |

CODE_07B8F3:
  LDA !s_spr_y_pixel_pos,x                  ; $07B8F3 |
  SEC                                       ; $07B8F6 |
  SBC !s_player_y                           ; $07B8F7 |
  SEC                                       ; $07B8FA |
  SBC #$0010                                ; $07B8FB |
  CMP #$0004                                ; $07B8FE |
  BMI CODE_07B939                           ; $07B901 |
  PHA                                       ; $07B903 |
  ASL A                                     ; $07B904 |
  ASL A                                     ; $07B905 |
  ASL A                                     ; $07B906 |
  ASL A                                     ; $07B907 |
  STA !s_player_y_speed                     ; $07B908 |
  PLA                                       ; $07B90B |
  LDY #$02                                  ; $07B90C |
  CMP #$0018                                ; $07B90E |
  BCS CODE_07B91A                           ; $07B911 |
  DEY                                       ; $07B913 |
  CMP #$0010                                ; $07B914 |
  BCS CODE_07B91A                           ; $07B917 |
  DEY                                       ; $07B919 |

CODE_07B91A:
  TYA                                       ; $07B91A |
  STA !s_spr_anim_frame,x                   ; $07B91B |
  RTL                                       ; $07B91E |

CODE_07B91F:
  LDA #$0003                                ; $07B91F |
  STA !s_spr_timer_1,x                      ; $07B922 |
  INC !s_spr_gsu_morph_2_lo,x               ; $07B925 |

CODE_07B928:
  LDA !s_spr_timer_1,x                      ; $07B928 |
  BNE CODE_07B938                           ; $07B92B |
  DEC !s_spr_anim_frame,x                   ; $07B92D |
  BMI CODE_07B939                           ; $07B930 |
  LDA #$0003                                ; $07B932 |
  STA !s_spr_timer_1,x                      ; $07B935 |

CODE_07B938:
  RTL                                       ; $07B938 |

CODE_07B939:
  SEP #$20                                  ; $07B939 |
  LDA #$FF                                  ; $07B93B |
  STA !s_spr_draw_priority,x                ; $07B93D |
  REP #$20                                  ; $07B940 |
  LDA #$01EE                                ; $07B942 |
  JSL spawn_ambient_sprite                  ; $07B945 |
  LDA #$0008                                ; $07B949 |
  STA $73C2,y                               ; $07B94C |
  LDA #$0002                                ; $07B94F |
  STA $7782,y                               ; $07B952 |
  LDA !s_spr_x_hitbox_center,x              ; $07B955 |
  STA $70A2,y                               ; $07B958 |
  LDA !s_spr_y_hitbox_center,x              ; $07B95B |
  STA $7142,y                               ; $07B95E |
  LDA #$003B                                ; $07B961 |\ play sound #$003B
  JSL push_sound_queue                      ; $07B964 |/
  JML $03A32E                               ; $07B968 |

  dw $002F, $002E, $002D, $002C             ; $07B96C |
  dw $002B, $002A, $0029, $0028             ; $07B974 |
  dw $FA58, $F800, $FA58, $0000             ; $07B97C |
  dw $05A8, $0800, $05A8, $0000             ; $07B984 |
  dw $FA58, $0000, $05A8, $0800             ; $07B98C |
  dw $05A8, $0000, $FA58, $F800             ; $07B994 |
  dw $0000, $0002, $0004, $0008             ; $07B99C |

init_arrow_cloud_up:
  LDA #$000E                                ; $07B9A4 |
  BRA CODE_07B9CA                           ; $07B9A7 |

init_arrow_cloud_up_right:
  LDA #$000C                                ; $07B9A9 |
  BRA CODE_07B9CA                           ; $07B9AC |

init_arrow_cloud_right:
  LDA #$000A                                ; $07B9AE |
  BRA CODE_07B9CA                           ; $07B9B1 |

init_arrow_cloud_down_right:
  LDA #$0008                                ; $07B9B3 |
  BRA CODE_07B9CA                           ; $07B9B6 |

init_arrow_cloud_down:
  LDA #$0006                                ; $07B9B8 |
  BRA CODE_07B9CA                           ; $07B9BB |

init_arrow_cloud_down_left:
  LDA #$0004                                ; $07B9BD |
  BRA CODE_07B9CA                           ; $07B9C0 |

init_arrow_cloud_left:
  LDA #$0002                                ; $07B9C2 |
  BRA CODE_07B9CA                           ; $07B9C5 |

init_arrow_cloud_up_left:
  LDA #$0000                                ; $07B9C7 |

CODE_07B9CA:
  STA !s_spr_wildcard_4_lo_dp,x             ; $07B9CA |
  LDA #$0002                                ; $07B9CC |
  STA !s_spr_anim_frame,x                   ; $07B9CF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07B9D2 |
  LDA #$0008                                ; $07B9D4 |
  STA !s_spr_timer_1,x                      ; $07B9D7 |
  STZ !s_spr_facing_dir,x                   ; $07B9DA |
  LDA $10                                   ; $07B9DD |
  AND #$0003                                ; $07B9DF |
  ASL A                                     ; $07B9E2 |
  TAY                                       ; $07B9E3 |
  LDA !s_spr_oam_yxppccct,x                 ; $07B9E4 |
  ORA $B99C,y                               ; $07B9E7 |
  STA !s_spr_oam_yxppccct,x                 ; $07B9EA |
  RTL                                       ; $07B9ED |

init_arrow_cloud_rotating:
  LDY #$03                                  ; $07B9EE |
  STY !reg_wrmpya                           ; $07B9F0 |
  LDA $10                                   ; $07B9F3 |
  AND #$0007                                ; $07B9F5 |
  INC A                                     ; $07B9F8 |
  TAY                                       ; $07B9F9 |
  STY !reg_wrmpyb                           ; $07B9FA |
  LDA #$0017                                ; $07B9FD |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BA00 |
  LDA #$0008                                ; $07BA02 |
  STA !s_spr_timer_1,x                      ; $07BA05 |
  LDA !reg_rdmpyl                           ; $07BA08 |
  DEC A                                     ; $07BA0B |
  STA !s_spr_anim_frame,x                   ; $07BA0C |
  STA !reg_wrdivl                           ; $07BA0F |
  LDY #$03                                  ; $07BA12 |
  STY !reg_wrdivb                           ; $07BA14 |
  STZ !s_spr_facing_dir,x                   ; $07BA17 |
  LDA $10                                   ; $07BA1A |
  AND #$0003                                ; $07BA1C |
  ASL A                                     ; $07BA1F |
  TAY                                       ; $07BA20 |
  LDA !s_spr_oam_yxppccct,x                 ; $07BA21 |
  ORA $B99C,y                               ; $07BA24 |
  STA !s_spr_oam_yxppccct,x                 ; $07BA27 |
  LDA !reg_rddivl                           ; $07BA2A |
  ASL A                                     ; $07BA2D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07BA2E |
  RTL                                       ; $07BA30 |

; all except rotating
main_arrow_cloud:
  JSL $03AF23                               ; $07BA31 |
  JSL $07BA78                               ; $07BA35 |
  JSR CODE_07BA62                           ; $07BA39 |
  RTL                                       ; $07BA3C |

main_arrow_cloud_rotating:
  JSL $03AF23                               ; $07BA3D |
  LDA !s_spr_anim_frame,x                   ; $07BA41 |
  STA !reg_wrdivl                           ; $07BA44 |
  LDY #$03                                  ; $07BA47 |
  STY !reg_wrdivb                           ; $07BA49 |
  NOP                                       ; $07BA4C |
  NOP                                       ; $07BA4D |
  NOP                                       ; $07BA4E |
  NOP                                       ; $07BA4F |
  NOP                                       ; $07BA50 |
  NOP                                       ; $07BA51 |
  NOP                                       ; $07BA52 |
  NOP                                       ; $07BA53 |
  LDA !reg_rddivl                           ; $07BA54 |
  ASL A                                     ; $07BA57 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07BA58 |
  JSL $07BA78                               ; $07BA5A |
  JSR CODE_07BA62                           ; $07BA5E |
  RTL                                       ; $07BA61 |

CODE_07BA62:
  LDA !s_spr_timer_1,x                      ; $07BA62 |
  BNE CODE_07BA77                           ; $07BA65 |
  DEC !s_spr_anim_frame,x                   ; $07BA67 |
  BPL CODE_07BA71                           ; $07BA6A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07BA6C |
  STA !s_spr_anim_frame,x                   ; $07BA6E |

CODE_07BA71:
  LDA #$0008                                ; $07BA71 |
  STA !s_spr_timer_1,x                      ; $07BA74 |

CODE_07BA77:
  RTS                                       ; $07BA77 |

  LDY !s_spr_collision_id,x                 ; $07BA78 |
  DEY                                       ; $07BA7B |
  BMI CODE_07BA9A                           ; $07BA7C |
  BEQ CODE_07BA9A                           ; $07BA7E |
  LDA !s_spr_state,y                        ; $07BA80 |
  CMP #$0010                                ; $07BA83 |
  BNE CODE_07BA9A                           ; $07BA86 |
  LDA !s_spr_collision_state,y              ; $07BA88 |
  BEQ CODE_07BA9A                           ; $07BA8B |
  LDA !s_spr_id,y                           ; $07BA8D |
  CMP #$0022                                ; $07BA90 |
  BCC CODE_07BA9A                           ; $07BA93 |
  CMP #$002C                                ; $07BA95 |
  BCC CODE_07BA9D                           ; $07BA98 |

CODE_07BA9A:
  JMP CODE_07BB13                           ; $07BA9A |

CODE_07BA9D:
  LDA !s_spr_x_pixel_pos,x                  ; $07BA9D |
  STA !s_spr_x_pixel_pos,y                  ; $07BAA0 |
  LDA !s_spr_y_pixel_pos,x                  ; $07BAA3 |
  STA !s_spr_y_pixel_pos,y                  ; $07BAA6 |
  LDA #$0000                                ; $07BAA9 |
  STA !s_spr_y_accel,y                      ; $07BAAC |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07BAAF |
  TAX                                       ; $07BAB1 |
  LDA $B97C,x                               ; $07BAB2 |
  STA !s_spr_x_speed_lo,y                   ; $07BAB5 |
  LDA $B98C,x                               ; $07BAB8 |
  STA !s_spr_y_speed_lo,y                   ; $07BABB |
  LDA #$FFFF                                ; $07BABE |
  STA !s_spr_timer_1,y                      ; $07BAC1 |
  INC A                                     ; $07BAC4 |
  SEP #$20                                  ; $07BAC5 |
  STA $77C0,y                               ; $07BAC7 |
  REP #$20                                  ; $07BACA |
  LDX $12                                   ; $07BACC |
  JSL $039F2B                               ; $07BACE |
  LDA #$0200                                ; $07BAD2 |
  JSL spawn_ambient_sprite                  ; $07BAD5 |
  LDA !s_spr_x_pixel_pos,x                  ; $07BAD9 |
  STA $70A2,y                               ; $07BADC |
  LDA !s_spr_y_pixel_pos,x                  ; $07BADF |
  STA $7142,y                               ; $07BAE2 |
  LDA #$0080                                ; $07BAE5 |
  STA $7782,y                               ; $07BAE8 |
  LDA !s_spr_oam_yxppccct,x                 ; $07BAEB |
  AND #$000E                                ; $07BAEE |
  ORA $7002,y                               ; $07BAF1 |
  STA $7002,y                               ; $07BAF4 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07BAF7 |
  LSR A                                     ; $07BAF9 |
  STA $73C2,y                               ; $07BAFA |
  LDA #$0020                                ; $07BAFD |\ play sound #$0020
  JSL push_sound_queue                      ; $07BB00 |/
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07BB04 |
  LDA $B96C,y                               ; $07BB06 |
  JSL push_sound_queue                      ; $07BB09 |
  JSL $03A32E                               ; $07BB0D |
  PLY                                       ; $07BB11 |
  PLA                                       ; $07BB12 |

CODE_07BB13:
  RTL                                       ; $07BB13 |

  dw $FF80, $0080                           ; $07BB14 |

  dw $FFE0, $0020                           ; $07BB18 |

  dw $0800, $F800                           ; $07BB1C |

init_flutter:
  LDY !s_spr_facing_dir,x                   ; $07BB20 |
  LDA $BB14,y                               ; $07BB23 |
  STA !s_spr_x_speed_lo,x                   ; $07BB26 |
  LDA !s_spr_x_pixel_pos,x                  ; $07BB29 |
  AND #$0010                                ; $07BB2C |
  LSR A                                     ; $07BB2F |
  LSR A                                     ; $07BB30 |
  LSR A                                     ; $07BB31 |
  TAY                                       ; $07BB32 |
  LDA !s_spr_y_pixel_pos,x                  ; $07BB33 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07BB36 |
  CLC                                       ; $07BB38 |
  ADC $BB18,y                               ; $07BB39 |
  STA !s_spr_y_pixel_pos,x                  ; $07BB3C |
  LDA $BB1C,y                               ; $07BB3F |
  STA !s_spr_y_accel_ceiling,x              ; $07BB42 |
  LDA #$0008                                ; $07BB45 |
  STA !s_spr_y_accel,x                      ; $07BB48 |
  LDA #$0004                                ; $07BB4B |
  STA !s_spr_timer_1,x                      ; $07BB4E |
  LDA #$0003                                ; $07BB51 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BB54 |
  TAY                                       ; $07BB56 |
  LDA $BB8A,y                               ; $07BB57 |
  AND #$00FF                                ; $07BB5A |
  STA !s_spr_anim_frame,x                   ; $07BB5D |
  RTL                                       ; $07BB60 |

main_flutter:
  LDA !s_spr_collision_state,x              ; $07BB61 |
  BEQ CODE_07BB72                           ; $07BB64 |
  LDA !s_spr_bitwise_settings_1,x           ; $07BB66 |
  AND #$FFDF                                ; $07BB69 |
  ORA #$0200                                ; $07BB6C |
  STA !s_spr_bitwise_settings_1,x           ; $07BB6F |

CODE_07BB72:
  JSL $03AF23                               ; $07BB72 |
  JSL $07BE69                               ; $07BB76 |
  JSL $07E336                               ; $07BB7A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07BB7E |
  TAX                                       ; $07BB80 |
  JMP ($BB84,x)                             ; $07BB81 |

  dw $BB8E                                  ; $07BB84 |
  dw $BC9E                                  ; $07BB86 |
  dw $BD21                                  ; $07BB88 |

  db $01, $02, $01, $00                     ; $07BB8A |

  LDX $12                                   ; $07BB8E |
  JSL $07BBC9                               ; $07BB90 |
  LDA !s_spr_timer_1,x                      ; $07BB94 |
  BNE CODE_07BBB3                           ; $07BB97 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07BB99 |
  BPL CODE_07BBA2                           ; $07BB9B |
  LDA #$0003                                ; $07BB9D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BBA0 |

CODE_07BBA2:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07BBA2 |
  LDA $BB8A,y                               ; $07BBA4 |
  AND #$00FF                                ; $07BBA7 |
  STA !s_spr_anim_frame,x                   ; $07BBAA |
  LDA #$0004                                ; $07BBAD |
  STA !s_spr_timer_1,x                      ; $07BBB0 |

CODE_07BBB3:
  LDY #$00                                  ; $07BBB3 |
  LDA !s_spr_y_pixel_pos,x                  ; $07BBB5 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $07BBB8 |
  BMI CODE_07BBBE                           ; $07BBBA |
  INY                                       ; $07BBBC |
  INY                                       ; $07BBBD |

CODE_07BBBE:
  LDA $BB1C,y                               ; $07BBBE |
  STA !s_spr_y_accel_ceiling,x              ; $07BBC1 |
  RTL                                       ; $07BBC4 |

  dw $0100, $FF00                           ; $07BBC5 |

  LDY !s_spr_collision_id,x                 ; $07BBC9 |
  BPL CODE_07BBF3                           ; $07BBCC |
  JSL $07FC2F                               ; $07BBCE |
  BEQ CODE_07BC05                           ; $07BBD2 |
  BCC CODE_07BBEF                           ; $07BBD4 |
  LDA !s_player_x_speed_prev                ; $07BBD6 |
  STA !s_spr_x_speed_lo,x                   ; $07BBD9 |
  LDA !s_player_y_speed                     ; $07BBDC |
  STA !s_spr_y_speed_lo,x                   ; $07BBDF |
  LDA #$001C                                ; $07BBE2 |\ play sound #$001C
  JSL push_sound_queue                      ; $07BBE5 |/
  JSL $03B20B                               ; $07BBE9 |
  BRA CODE_07BC1B                           ; $07BBED |

CODE_07BBEF:
  JML $03A858                               ; $07BBEF |

CODE_07BBF3:
  DEY                                       ; $07BBF3 |
  BMI CODE_07BC05                           ; $07BBF4 |
  BEQ CODE_07BC05                           ; $07BBF6 |
  LDA !s_spr_state,y                        ; $07BBF8 |
  CMP #$0010                                ; $07BBFB |
  BNE CODE_07BC05                           ; $07BBFE |
  LDA !s_spr_collision_state,y              ; $07BC00 |
  BNE CODE_07BC08                           ; $07BC03 |

CODE_07BC05:
  JMP CODE_07BC8F                           ; $07BC05 |

CODE_07BC08:
  LDA !s_spr_x_speed_lo,y                   ; $07BC08 |
  STA !s_spr_x_speed_lo,x                   ; $07BC0B |
  LDA !s_spr_y_speed_lo,y                   ; $07BC0E |
  STA !s_spr_y_speed_lo,x                   ; $07BC11 |
  TYX                                       ; $07BC14 |
  JSL $03B24B                               ; $07BC15 |
  LDX $12                                   ; $07BC19 |

CODE_07BC1B:
  LDA !s_spr_x_speed_lo,x                   ; $07BC1B |
  STA !s_spr_wildcard_1_lo,x                ; $07BC1E |
  LDA !s_spr_y_speed_lo,x                   ; $07BC21 |
  STA !s_spr_wildcard_2_lo,x                ; $07BC24 |
  LDA #$0100                                ; $07BC27 |
  STA !s_spr_y_accel,x                      ; $07BC2A |
  STA !s_spr_x_accel,x                      ; $07BC2D |
  STZ !s_spr_y_accel_ceiling,x              ; $07BC30 |
  LDA #$0006                                ; $07BC33 |
  STA !s_spr_wildcard_5_lo,x                ; $07BC36 |
  TAY                                       ; $07BC39 |
  LDA $BC90,y                               ; $07BC3A |
  AND #$00FF                                ; $07BC3D |
  STA !s_spr_anim_frame,x                   ; $07BC40 |
  LDA $BC97,y                               ; $07BC43 |
  AND #$00FF                                ; $07BC46 |
  STA !s_spr_timer_1,x                      ; $07BC49 |
  LDY !s_spr_x_player_dir,x                 ; $07BC4C |
  LDA $BBC5,y                               ; $07BC4F |
  STA $00                                   ; $07BC52 |
  LDA #$0202                                ; $07BC54 |
  JSL spawn_ambient_sprite                  ; $07BC57 |
  LDA !s_spr_x_pixel_pos,x                  ; $07BC5B |
  STA $70A2,y                               ; $07BC5E |
  LDA !s_spr_y_pixel_pos,x                  ; $07BC61 |
  SEC                                       ; $07BC64 |
  SBC #$0008                                ; $07BC65 |
  STA $7142,y                               ; $07BC68 |
  LDA $00                                   ; $07BC6B |
  STA $71E0,y                               ; $07BC6D |
  LDA #$FE00                                ; $07BC70 |
  STA $71E2,y                               ; $07BC73 |
  LDA #$0020                                ; $07BC76 |
  STA $7502,y                               ; $07BC79 |
  LDA #$0400                                ; $07BC7C |
  STA $75A2,y                               ; $07BC7F |
  LDA #$0040                                ; $07BC82 |
  STA $7782,y                               ; $07BC85 |
  LDA #$0002                                ; $07BC88 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07BC8B |
  PLY                                       ; $07BC8D |
  PLA                                       ; $07BC8E |

CODE_07BC8F:
  RTL                                       ; $07BC8F |

  db $03, $04, $05, $06, $05, $04, $03      ; $07BC90 |

  db $02, $02, $02, $04, $02, $02, $02      ; $07BC97 |

  LDX $12                                   ; $07BC9E |
  JSL $07BE33                               ; $07BCA0 |
  LDA !s_spr_x_speed_lo,x                   ; $07BCA4 |
  EOR !s_spr_wildcard_1_lo,x                ; $07BCA7 |
  BMI CODE_07BCB5                           ; $07BCAA |
  STZ !s_spr_x_speed_lo,x                   ; $07BCAC |
  STZ !s_spr_x_accel,x                      ; $07BCAF |
  STZ !s_spr_wildcard_1_lo,x                ; $07BCB2 |

CODE_07BCB5:
  LDA !s_spr_y_speed_lo,x                   ; $07BCB5 |
  EOR !s_spr_wildcard_2_lo,x                ; $07BCB8 |
  BPL CODE_07BCC6                           ; $07BCBB |
  STZ !s_spr_y_speed_lo,x                   ; $07BCBD |
  STZ !s_spr_y_accel,x                      ; $07BCC0 |
  STZ !s_spr_wildcard_2_lo,x                ; $07BCC3 |

CODE_07BCC6:
  LDA !s_spr_timer_1,x                      ; $07BCC6 |
  BNE CODE_07BCE5                           ; $07BCC9 |
  DEC !s_spr_wildcard_5_lo,x                ; $07BCCB |
  BMI CODE_07BCE6                           ; $07BCCE |
  LDY !s_spr_wildcard_5_lo,x                ; $07BCD0 |
  LDA $BC90,y                               ; $07BCD3 |
  AND #$00FF                                ; $07BCD6 |
  STA !s_spr_anim_frame,x                   ; $07BCD9 |
  LDA $BC97,y                               ; $07BCDC |
  AND #$00FF                                ; $07BCDF |
  STA !s_spr_timer_1,x                      ; $07BCE2 |

CODE_07BCE5:
  RTL                                       ; $07BCE5 |

CODE_07BCE6:
  STZ !s_spr_x_speed_lo,x                   ; $07BCE6 |
  STZ !s_spr_x_accel,x                      ; $07BCE9 |
  STZ !s_spr_wildcard_1_lo,x                ; $07BCEC |
  STZ !s_spr_y_speed_lo,x                   ; $07BCEF |
  STZ !s_spr_y_accel,x                      ; $07BCF2 |
  STZ !s_spr_wildcard_2_lo,x                ; $07BCF5 |
  LDA #$0003                                ; $07BCF8 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BCFB |
  TAY                                       ; $07BCFD |
  LDA $BD19,y                               ; $07BCFE |
  AND #$00FF                                ; $07BD01 |
  STA !s_spr_anim_frame,x                   ; $07BD04 |
  LDA #$0002                                ; $07BD07 |
  STA !s_spr_timer_1,x                      ; $07BD0A |
  LDA #$0040                                ; $07BD0D |
  STA !s_spr_timer_2,x                      ; $07BD10 |
  LDA #$0004                                ; $07BD13 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07BD16 |
  RTL                                       ; $07BD18 |

  db $08, $09, $08, $07                     ; $07BD19 |

  dw $FFF0, $0000                           ; $07BD1D |

  LDX $12                                   ; $07BD21 |
  LDA !s_spr_timer_2,x                      ; $07BD23 |
  BEQ CODE_07BD31                           ; $07BD26 |
  LDA !s_spr_x_player_dir,x                 ; $07BD28 |
  AND #$00FF                                ; $07BD2B |
  STA !s_spr_facing_dir,x                   ; $07BD2E |

CODE_07BD31:
  JSL $07BE33                               ; $07BD31 |
  LDA !s_spr_timer_1,x                      ; $07BD35 |
  BNE CODE_07BD54                           ; $07BD38 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07BD3A |
  BPL CODE_07BD43                           ; $07BD3C |
  LDA #$0003                                ; $07BD3E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BD41 |

CODE_07BD43:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07BD43 |
  LDA $BD19,y                               ; $07BD45 |
  AND #$00FF                                ; $07BD48 |
  STA !s_spr_anim_frame,x                   ; $07BD4B |
  LDA #$0002                                ; $07BD4E |
  STA !s_spr_timer_1,x                      ; $07BD51 |

CODE_07BD54:
  LDA !s_spr_timer_3,x                      ; $07BD54 |
  BNE CODE_07BDA7                           ; $07BD57 |
  LDA #$000E                                ; $07BD59 |
  STA !s_spr_timer_3,x                      ; $07BD5C |
  LDY !s_spr_facing_dir,x                   ; $07BD5F |
  LDA !s_spr_x_pixel_pos,x                  ; $07BD62 |
  CLC                                       ; $07BD65 |
  ADC $BD1D,y                               ; $07BD66 |
  STA $00                                   ; $07BD69 |
  LDA !s_spr_y_pixel_pos,x                  ; $07BD6B |
  SEC                                       ; $07BD6E |
  SBC #$0010                                ; $07BD6F |
  STA $02                                   ; $07BD72 |
  LDA #$FE00                                ; $07BD74 |
  CLC                                       ; $07BD77 |
  ADC !s_spr_x_speed_lo,x                   ; $07BD78 |
  STA $04                                   ; $07BD7B |
  LDA #$FE00                                ; $07BD7D |
  CLC                                       ; $07BD80 |
  ADC !s_spr_y_speed_lo,x                   ; $07BD81 |
  STA $06                                   ; $07BD84 |
  LDA #$0002                                ; $07BD86 |
  STA $08                                   ; $07BD89 |
  JSR CODE_07BDE8                           ; $07BD8B |
  LDY !s_spr_facing_dir,x                   ; $07BD8E |
  LDA $00                                   ; $07BD91 |
  CLC                                       ; $07BD93 |
  ADC #$0010                                ; $07BD94 |
  STA $00                                   ; $07BD97 |
  LDA #$0200                                ; $07BD99 |
  CLC                                       ; $07BD9C |
  ADC !s_spr_x_speed_lo,x                   ; $07BD9D |
  STA $04                                   ; $07BDA0 |
  STZ $08                                   ; $07BDA2 |
  JSR CODE_07BDE8                           ; $07BDA4 |

CODE_07BDA7:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07BDA7 |
  BNE CODE_07BDE7                           ; $07BDA9 |
  LDA !s_spr_timer_2,x                      ; $07BDAB |
  BNE CODE_07BDE7                           ; $07BDAE |
  LDA !s_player_center_x                    ; $07BDB0 |
  STA !gsu_r1                               ; $07BDB3 |
  LDA !s_player_center_y                    ; $07BDB6 |
  STA !gsu_r2                               ; $07BDB9 |
  LDA !s_spr_x_hitbox_center,x              ; $07BDBC |
  STA !gsu_r3                               ; $07BDBF |
  LDA !s_spr_y_hitbox_center,x              ; $07BDC2 |
  STA !gsu_r4                               ; $07BDC5 |
  LDA #$0200                                ; $07BDC8 |
  STA !gsu_r6                               ; $07BDCB |
  LDX #$09                                  ; $07BDCE |
  LDA #$907C                                ; $07BDD0 |
  JSL r_gsu_init_1                          ; $07BDD3 | GSU init
  LDX $12                                   ; $07BDD7 |
  LDA !gsu_r1                               ; $07BDD9 |
  STA !s_spr_x_speed_lo,x                   ; $07BDDC |
  LDA !gsu_r2                               ; $07BDDF |
  STA !s_spr_y_speed_lo,x                   ; $07BDE2 |
  INC !s_spr_wildcard_6_lo_dp,x             ; $07BDE5 |

CODE_07BDE7:
  RTL                                       ; $07BDE7 |

CODE_07BDE8:
  LDA #$0203                                ; $07BDE8 |
  JSL spawn_ambient_sprite                  ; $07BDEB |
  LDA $00                                   ; $07BDEF |
  STA $70A2,y                               ; $07BDF1 |
  LDA $02                                   ; $07BDF4 |
  STA $7142,y                               ; $07BDF6 |
  LDA $04                                   ; $07BDF9 |
  STA $71E0,y                               ; $07BDFB |
  LDA $06                                   ; $07BDFE |
  STA $71E2,y                               ; $07BE00 |
  LDA $75A0,y                               ; $07BE03 |
  CLC                                       ; $07BE06 |
  ADC !s_spr_x_speed_lo,x                   ; $07BE07 |
  STA $75A0,y                               ; $07BE0A |
  LDA $75A2,y                               ; $07BE0D |
  CLC                                       ; $07BE10 |
  ADC !s_spr_y_speed_lo,x                   ; $07BE11 |
  STA $75A2,y                               ; $07BE14 |
  LDA $7968                                 ; $07BE17 |
  STA $73C0,y                               ; $07BE1A |
  LDA #$0040                                ; $07BE1D |
  STA $7502,y                               ; $07BE20 |
  STA $7500,y                               ; $07BE23 |
  LDA #$0002                                ; $07BE26 |
  STA $7782,y                               ; $07BE29 |
  LDA #$0006                                ; $07BE2C |
  STA $73C2,y                               ; $07BE2F |
  RTS                                       ; $07BE32 |

  LDY !s_spr_collision_id,x                 ; $07BE33 |
  BPL CODE_07BE4F                           ; $07BE36 |
  JSL $07FC2F                               ; $07BE38 |
  BEQ CODE_07BE68                           ; $07BE3C |
  BCC CODE_07BE4B                           ; $07BE3E |
  LDA #$001C                                ; $07BE40 |\ play sound #$001C
  JSL push_sound_queue                      ; $07BE43 |/
  JML $03B20B                               ; $07BE47 |

CODE_07BE4B:
  JML $03A858                               ; $07BE4B |

CODE_07BE4F:
  DEY                                       ; $07BE4F |
  BMI CODE_07BE68                           ; $07BE50 |
  BEQ CODE_07BE68                           ; $07BE52 |
  LDA !s_spr_state,y                        ; $07BE54 |
  CMP #$0010                                ; $07BE57 |
  BNE CODE_07BE68                           ; $07BE5A |
  LDA !s_spr_collision_state,y              ; $07BE5C |
  BEQ CODE_07BE68                           ; $07BE5F |
  TYX                                       ; $07BE61 |
  JSL $03B24B                               ; $07BE62 |
  LDX $12                                   ; $07BE66 |

CODE_07BE68:
  RTL                                       ; $07BE68 |

  LDA !s_spr_gsu_morph_1_lo,x               ; $07BE69 |
  BEQ CODE_07BE8F                           ; $07BE6C |
  LDA !s_spr_cam_x_pos,x                    ; $07BE6E |
  CLC                                       ; $07BE71 |
  ADC #$0050                                ; $07BE72 |
  CMP #$0190                                ; $07BE75 |
  BCS CODE_07BE86                           ; $07BE78 |
  LDA !s_spr_cam_y_pos,x                    ; $07BE7A |
  CLC                                       ; $07BE7D |
  ADC #$0050                                ; $07BE7E |
  CMP #$0190                                ; $07BE81 |
  BCC CODE_07BE8F                           ; $07BE84 |

CODE_07BE86:
  DEC $0C6C                                 ; $07BE86 |
  PLY                                       ; $07BE89 |
  PLA                                       ; $07BE8A |
  JML $03A31E                               ; $07BE8B |

CODE_07BE8F:
  RTL                                       ; $07BE8F |

init_spray_fish:
  LDA !s_spr_x_pixel_pos,x                  ; $07BE90 |
  SEC                                       ; $07BE93 |
  SBC #$0020                                ; $07BE94 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07BE97 |
  CLC                                       ; $07BE99 |
  ADC #$0040                                ; $07BE9A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07BE9D |
  LDA !s_spr_y_pixel_pos,x                  ; $07BE9F |
  CLC                                       ; $07BEA2 |
  ADC #$0008                                ; $07BEA3 |
  STA !s_spr_y_pixel_pos,x                  ; $07BEA6 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07BEA9 |
  SEC                                       ; $07BEAC |
  SBC #$001C                                ; $07BEAD |
  STA !s_spr_gsu_morph_1_lo,x               ; $07BEB0 |
  RTL                                       ; $07BEB3 |

; gsu table
  dw $FFF0, $FFFB, $FFEA, $FFF5             ; $07BEB4 |
  dw $FFE4, $FFEF, $FFDE, $FFE9             ; $07BEBC |
  dw $FFD8, $FFE3, $FFD2, $FFDD             ; $07BEC4 |
  dw $FFCC, $FFD7, $FFC6, $FFD1             ; $07BECC |
  dw $FFC0, $FFCB, $FFBA, $FFC5             ; $07BED4 |
  dw $FFB4, $FFBF, $FFAE, $FFB9             ; $07BEDC |
  dw $FFA8, $FFB3, $FFA2, $FFAD             ; $07BEE4 |
  dw $FF9C, $FFA7, $FF96, $FFA1             ; $07BEEC |
  dw $FF90, $FF9B, $FF8A, $FF95             ; $07BEF4 |

main_spray_fish:
  LDY !s_spr_draw_priority,x                ; $07BEFC |
  BMI CODE_07BF23                           ; $07BEFF |
  LDA !s_spr_anim_frame,x                   ; $07BF01 |
  STA !gsu_r1                               ; $07BF04 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07BF07 |
  STA !gsu_r2                               ; $07BF09 |
  LDA #$BEB4                                ; $07BF0C |
  STA !gsu_r3                               ; $07BF0F |
  LDA #$0007                                ; $07BF12 |
  STA !gsu_r4                               ; $07BF15 |
  LDX #$08                                  ; $07BF18 |
  LDA #$9332                                ; $07BF1A |
  JSL r_gsu_init_1                          ; $07BF1D | GSU init
  LDX $12                                   ; $07BF21 |

CODE_07BF23:
  JSL $03AF23                               ; $07BF23 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07BF27 |
  TAX                                       ; $07BF29 |
  JMP ($BF2D,x)                             ; $07BF2A |

  dw $BF39                                  ; $07BF2D |
  dw $BFBF                                  ; $07BF2F |
  dw $BFF3                                  ; $07BF31 |
  dw $C04E                                  ; $07BF33 |
  dw $C0B1                                  ; $07BF35 |
  dw $C0DD                                  ; $07BF37 |

  LDX $12                                   ; $07BF39 |
  LDA !s_spr_x_player_dir,x                 ; $07BF3B |
  AND #$00FF                                ; $07BF3E |
  STA !s_spr_facing_dir,x                   ; $07BF41 |
  LDA !s_spr_timer_1,x                      ; $07BF44 |
  BNE CODE_07BF81                           ; $07BF47 |
  LDA !s_spr_y_player_delta,x               ; $07BF49 |
  SEC                                       ; $07BF4C |
  SBC #$0018                                ; $07BF4D |
  CMP #$00A0                                ; $07BF50 |
  BCS CODE_07BF81                           ; $07BF53 |
  LDY !s_spr_x_player_dir,x                 ; $07BF55 |
  DEY                                       ; $07BF58 |
  BMI CODE_07BF5F                           ; $07BF59 |
  EOR #$FFFF                                ; $07BF5B |
  INC A                                     ; $07BF5E |

CODE_07BF5F:
  CLC                                       ; $07BF5F |
  ADC !s_player_x                           ; $07BF60 |
  CMP !s_spr_wildcard_5_lo_dp,x             ; $07BF63 |
  BPL CODE_07BF6B                           ; $07BF65 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07BF67 |
  BRA CODE_07BF71                           ; $07BF69 |

CODE_07BF6B:
  CMP !s_spr_wildcard_6_lo_dp,x             ; $07BF6B |
  BMI CODE_07BF71                           ; $07BF6D |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07BF6F |

CODE_07BF71:
  STA !s_spr_x_pixel_pos,x                  ; $07BF71 |
  SEC                                       ; $07BF74 |
  SBC !s_player_x                           ; $07BF75 |
  CLC                                       ; $07BF78 |
  ADC #$0020                                ; $07BF79 |
  CMP #$0040                                ; $07BF7C |
  BCS CODE_07BF82                           ; $07BF7F |

CODE_07BF81:
  RTL                                       ; $07BF81 |

CODE_07BF82:
  LDA #$01BA                                ; $07BF82 |
  JSL spawn_ambient_sprite                  ; $07BF85 |
  LDA !s_spr_x_pixel_pos,x                  ; $07BF89 |
  STA $70A2,y                               ; $07BF8C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07BF8F |
  STA $7142,y                               ; $07BF92 |
  LDA #$001A                                ; $07BF95 |
  STA $7E4C,y                               ; $07BF98 |
  LDA #$0003                                ; $07BF9B |
  STA $7782,y                               ; $07BF9E |
  LDA #$0061                                ; $07BFA1 |\ play sound #$0061
  JSL push_sound_queue                      ; $07BFA4 |/
  LDA #$0018                                ; $07BFA8 |
  STA !s_spr_timer_1,x                      ; $07BFAB |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07BFAE |
  STA !s_spr_y_pixel_pos,x                  ; $07BFB1 |
  LDA #$FF00                                ; $07BFB4 |
  STA !s_spr_y_speed_lo,x                   ; $07BFB7 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07BFBA |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07BFBC |
  RTL                                       ; $07BFBE |

  LDX $12                                   ; $07BFBF |
  LDA !s_spr_timer_1,x                      ; $07BFC1 |
  BNE CODE_07BFDC                           ; $07BFC4 |
  STZ !s_spr_y_speed_lo,x                   ; $07BFC6 |
  INC !s_spr_anim_frame,x                   ; $07BFC9 |
  LDA #$0030                                ; $07BFCC |
  STA !s_spr_timer_2,x                      ; $07BFCF |
  LDA #$00D1                                ; $07BFD2 |
  STA !s_spr_timer_3,x                      ; $07BFD5 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07BFD8 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07BFDA |

CODE_07BFDC:
  JSR CODE_07C285                           ; $07BFDC |
  RTL                                       ; $07BFDF |

  db $01, $01, $01, $01, $01, $01, $01, $01 ; $07BFE0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $07BFE8 |
  db $01, $01, $C0                          ; $07BFF0 |

  LDX $12                                   ; $07BFF3 |
  LDA !s_spr_timer_2,x                      ; $07BFF5 |
  BNE CODE_07BFDC                           ; $07BFF8 |
  LDA #$0002                                ; $07BFFA |
  STA !s_spr_anim_frame,x                   ; $07BFFD |
  LDA $14                                   ; $07C000 |
  AND #$0003                                ; $07C002 |
  BNE CODE_07C00E                           ; $07C005 |
  LDA #$0051                                ; $07C007 |\ play sound #$0051
  JSL push_sound_queue                      ; $07C00A |/

CODE_07C00E:
  LDA !s_spr_timer_3,x                      ; $07C00E |
  BEQ CODE_07C046                           ; $07C011 |
  JSL $07C192                               ; $07C013 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C017 |
  CMP #$0012                                ; $07C019 |
  BEQ CODE_07C026                           ; $07C01C |
  LDA !s_spr_timer_1,x                      ; $07C01E |
  CMP #$0002                                ; $07C021 |
  BCS CODE_07C02B                           ; $07C024 |

CODE_07C026:
  LDA !s_spr_timer_1,x                      ; $07C026 |
  BNE CODE_07C03F                           ; $07C029 |

CODE_07C02B:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C02B |
  CMP #$0012                                ; $07C02D |
  BCS CODE_07C046                           ; $07C030 |
  INC A                                     ; $07C032 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C033 |
  TAY                                       ; $07C035 |
  LDA $BFE0,y                               ; $07C036 |
  AND #$00FF                                ; $07C039 |
  STA !s_spr_timer_1,x                      ; $07C03C |

CODE_07C03F:
  JSR CODE_07C11A                           ; $07C03F |
  JSR CODE_07C285                           ; $07C042 |
  RTL                                       ; $07C045 |

CODE_07C046:
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C046 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C048 |
  JSR CODE_07C285                           ; $07C04A |
  RTL                                       ; $07C04D |

  LDX $12                                   ; $07C04E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C050 |
  BEQ CODE_07C09D                           ; $07C052 |
  JSR CODE_07C11A                           ; $07C054 |
  LDA !s_spr_timer_2,x                      ; $07C057 |
  BNE CODE_07C0AD                           ; $07C05A |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $07C05C |
  BNE CODE_07C095                           ; $07C05E |
  LDA #$01BA                                ; $07C060 |
  JSL spawn_ambient_sprite                  ; $07C063 |
  LDA !s_spr_x_pixel_pos,x                  ; $07C067 |
  STA $70A2,y                               ; $07C06A |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07C06D |
  STA $7142,y                               ; $07C070 |
  LDA #$001A                                ; $07C073 |
  STA $7E4C,y                               ; $07C076 |
  LDA #$0003                                ; $07C079 |
  STA $7782,y                               ; $07C07C |
  LDA #$0061                                ; $07C07F |\ play sound #$0061
  JSL push_sound_queue                      ; $07C082 |/
  LDA #$0018                                ; $07C086 |
  STA !s_spr_timer_1,x                      ; $07C089 |
  LDA #$0100                                ; $07C08C |
  STA !s_spr_y_speed_lo,x                   ; $07C08F |
  STZ !s_spr_anim_frame,x                   ; $07C092 |

CODE_07C095:
  LDA #$0001                                ; $07C095 |
  STA !s_spr_timer_2,x                      ; $07C098 |
  BRA CODE_07C0AD                           ; $07C09B |

CODE_07C09D:
  LDA !s_spr_timer_1,x                      ; $07C09D |
  BNE CODE_07C0AD                           ; $07C0A0 |
  LDA #$0040                                ; $07C0A2 |
  STA !s_spr_timer_1,x                      ; $07C0A5 |
  STZ !s_spr_y_speed_lo,x                   ; $07C0A8 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07C0AB |

CODE_07C0AD:
  JSR CODE_07C285                           ; $07C0AD |
  RTL                                       ; $07C0B0 |

  LDX $12                                   ; $07C0B1 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C0B3 |
  BEQ CODE_07C0BD                           ; $07C0B5 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $07C0B7 |
  JSR CODE_07C11A                           ; $07C0B9 |
  RTL                                       ; $07C0BC |

CODE_07C0BD:
  LDA #$0000                                ; $07C0BD |
  STA !s_spr_anim_frame,x                   ; $07C0C0 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07C0C3 |
  CMP !s_spr_y_pixel_pos,x                  ; $07C0C6 |
  BPL CODE_07C0D9                           ; $07C0C9 |
  STA !s_spr_y_pixel_pos,x                  ; $07C0CB |
  LDA #$0140                                ; $07C0CE |
  STA !s_spr_timer_1,x                      ; $07C0D1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C0D4 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C0D6 |
  RTL                                       ; $07C0D8 |

CODE_07C0D9:
  INC !s_spr_y_pixel_pos,x                  ; $07C0D9 |
  RTL                                       ; $07C0DC |

  LDX $12                                   ; $07C0DD |
  LDA !s_spr_timer_1,x                      ; $07C0DF |
  BNE CODE_07C0EF                           ; $07C0E2 |
  LDA #$0040                                ; $07C0E4 |
  STA !s_spr_timer_1,x                      ; $07C0E7 |
  STZ !s_spr_y_speed_lo,x                   ; $07C0EA |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07C0ED |

CODE_07C0EF:
  RTL                                       ; $07C0EF |

  dw $0001, $0001, $0001, $0001             ; $07C0F0 |
  dw $0001, $0001, $0001, $0001             ; $07C0F8 |
  dw $0001, $0001, $0001, $0001             ; $07C100 |
  dw $0001, $0001, $0001, $0001             ; $07C108 |
  dw $0001, $0001, $0003, $FC00             ; $07C110 |
  dw $0400                                  ; $07C118 |

CODE_07C11A:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C11A |
  ASL A                                     ; $07C11C |
  TAY                                       ; $07C11D |
  LDA $14                                   ; $07C11E |
  AND $C0F0,y                               ; $07C120 |
  BNE CODE_07C189                           ; $07C123 |
  LDY !s_spr_facing_dir,x                   ; $07C125 |
  LDA $C116,y                               ; $07C128 |
  STA $00                                   ; $07C12B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C12D |
  DEC A                                     ; $07C12F |
  ASL A                                     ; $07C130 |
  ASL A                                     ; $07C131 |
  TAY                                       ; $07C132 |
  LDA $BEB4,y                               ; $07C133 |
  PHY                                       ; $07C136 |
  LDY !s_spr_facing_dir,x                   ; $07C137 |
  BEQ CODE_07C140                           ; $07C13A |
  EOR #$FFFF                                ; $07C13C |
  INC A                                     ; $07C13F |

CODE_07C140:
  PLY                                       ; $07C140 |
  CLC                                       ; $07C141 |
  ADC !s_spr_x_pixel_pos,x                  ; $07C142 |
  STA $02                                   ; $07C145 |
  INY                                       ; $07C147 |
  INY                                       ; $07C148 |
  LDA !s_spr_y_pixel_pos,x                  ; $07C149 |
  CLC                                       ; $07C14C |
  ADC $BEB4,y                               ; $07C14D |
  STA $04                                   ; $07C150 |
  LDA #$0206                                ; $07C152 |
  JSL spawn_ambient_sprite                  ; $07C155 |
  LDA $7002,y                               ; $07C159 |
  ORA #$0006                                ; $07C15C |
  STA $7002,y                               ; $07C15F |
  LDA !s_spr_facing_dir,x                   ; $07C162 |
  STA $73C0,y                               ; $07C165 |
  LDA $02                                   ; $07C168 |
  STA $70A2,y                               ; $07C16A |
  LDA $04                                   ; $07C16D |
  STA $7142,y                               ; $07C16F |
  LDA $00                                   ; $07C172 |
  STA $71E0,y                               ; $07C174 |
  LDA #$FC00                                ; $07C177 |
  STA $71E2,y                               ; $07C17A |
  LDA #$0010                                ; $07C17D |
  STA $7782,y                               ; $07C180 |
  LDA #$0002                                ; $07C183 |
  STA $73C2,y                               ; $07C186 |

CODE_07C189:
  RTS                                       ; $07C189 |

  dw $FE00, $0200                           ; $07C18A |

  dw $0180, $0060                           ; $07C18E |

  LDA #$0007                                ; $07C192 |
  STA !gsu_r0                               ; $07C195 |
  LDA #$BEB4                                ; $07C198 |
  STA !gsu_r1                               ; $07C19B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C19E |
  STA !gsu_r12                              ; $07C1A0 |
  LDX #$A908                                ; $07C1A3 |
  ROL $94,x                                 ; $07C1A6 |
  JSL r_gsu_init_1                          ; $07C1A8 | GSU init
  LDX $12                                   ; $07C1AC |
  LDA !gsu_r11                              ; $07C1AE |
  BPL CODE_07C1B6                           ; $07C1B1 |
  JMP CODE_07C284                           ; $07C1B3 |

CODE_07C1B6:
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C1B6 |
  DEC A                                     ; $07C1B8 |
  ASL A                                     ; $07C1B9 |
  ASL A                                     ; $07C1BA |
  TAY                                       ; $07C1BB |
  LDA $BEB4,y                               ; $07C1BC |
  PHY                                       ; $07C1BF |
  LDY !s_spr_facing_dir,x                   ; $07C1C0 |
  BEQ CODE_07C1C9                           ; $07C1C3 |
  EOR #$FFFF                                ; $07C1C5 |
  INC A                                     ; $07C1C8 |

CODE_07C1C9:
  PLY                                       ; $07C1C9 |
  CLC                                       ; $07C1CA |
  ADC !s_spr_x_pixel_pos,x                  ; $07C1CB |
  STA $00                                   ; $07C1CE |
  INY                                       ; $07C1D0 |
  INY                                       ; $07C1D1 |
  LDA !s_spr_y_pixel_pos,x                  ; $07C1D2 |
  CLC                                       ; $07C1D5 |
  ADC $BEB4,y                               ; $07C1D6 |
  STA $02                                   ; $07C1D9 |
  LDA !s_spr_timer_4,x                      ; $07C1DB |
  BNE CODE_07C203                           ; $07C1DE |
  LDA #$0004                                ; $07C1E0 |
  STA !s_spr_timer_4,x                      ; $07C1E3 |
  LDA #$0204                                ; $07C1E6 |
  JSL spawn_ambient_sprite                  ; $07C1E9 |
  LDA $00                                   ; $07C1ED |
  STA $70A2,y                               ; $07C1EF |
  LDA $02                                   ; $07C1F2 |
  STA $7142,y                               ; $07C1F4 |
  LDA #$0002                                ; $07C1F7 |
  STA $7782,y                               ; $07C1FA |
  LDA #$0001                                ; $07C1FD |
  STA $73C2,y                               ; $07C200 |

CODE_07C203:
  LDA $10                                   ; $07C203 |
  AND #$0003                                ; $07C205 |
  XBA                                       ; $07C208 |
  LSR A                                     ; $07C209 |
  CLC                                       ; $07C20A |
  ADC #$0100                                ; $07C20B |
  STA $04                                   ; $07C20E |
  LDA $10                                   ; $07C210 |
  AND #$0001                                ; $07C212 |
  BEQ CODE_07C21F                           ; $07C215 |
  LDA $04                                   ; $07C217 |
  EOR #$FFFF                                ; $07C219 |
  INC A                                     ; $07C21C |
  STA $04                                   ; $07C21D |

CODE_07C21F:
  LDA $10                                   ; $07C21F |
  AND #$000C                                ; $07C221 |
  XBA                                       ; $07C224 |
  LSR A                                     ; $07C225 |
  LSR A                                     ; $07C226 |
  LSR A                                     ; $07C227 |
  CLC                                       ; $07C228 |
  ADC #$0100                                ; $07C229 |
  STA $06                                   ; $07C22C |
  LDA $10                                   ; $07C22E |
  AND #$0100                                ; $07C230 |
  BNE CODE_07C23D                           ; $07C233 |
  LDA $06                                   ; $07C235 |
  EOR #$FFFF                                ; $07C237 |
  INC A                                     ; $07C23A |
  STA $06                                   ; $07C23B |

CODE_07C23D:
  LDA #$0205                                ; $07C23D |
  JSL spawn_ambient_sprite                  ; $07C240 |
  LDA $7002,y                               ; $07C244 |
  ORA #$0006                                ; $07C247 |
  STA $7002,y                               ; $07C24A |
  LDA $00                                   ; $07C24D |
  STA $70A2,y                               ; $07C24F |
  LDA $02                                   ; $07C252 |
  STA $7142,y                               ; $07C254 |
  LDA $04                                   ; $07C257 |
  STA $71E0,y                               ; $07C259 |
  STA $71E2,y                               ; $07C25C |
  LDA #$0006                                ; $07C25F |
  STA $7782,y                               ; $07C262 |
  LDA #$0002                                ; $07C265 |
  STA $73C2,y                               ; $07C268 |
  LDY !s_spr_facing_dir,x                   ; $07C26B |
  LDA !s_player_tile_collision              ; $07C26E |
  AND $C18E,y                               ; $07C271 |
  BNE CODE_07C27F                           ; $07C274 |
  LDA $C18A,y                               ; $07C276 |
  STA !s_player_x_speed_prev                ; $07C279 |
  STA !s_player_x_speed                     ; $07C27C |

CODE_07C27F:
  PLY                                       ; $07C27F |
  PLA                                       ; $07C280 |
  JSR CODE_07C285                           ; $07C281 |

CODE_07C284:
  RTL                                       ; $07C284 |

CODE_07C285:
  LDY !s_spr_collision_id,x                 ; $07C285 |
  BMI CODE_07C2AF                           ; $07C288 |
  DEY                                       ; $07C28A |
  BMI CODE_07C2AE                           ; $07C28B |
  BEQ CODE_07C2AE                           ; $07C28D |
  LDA !s_spr_state,y                        ; $07C28F |
  CMP #$0010                                ; $07C292 |
  BNE CODE_07C2AE                           ; $07C295 |
  LDA !s_spr_collision_state,y              ; $07C297 |
  BEQ CODE_07C2AE                           ; $07C29A |
  TYX                                       ; $07C29C |
  JSL $03B24B                               ; $07C29D |
  LDX $12                                   ; $07C2A1 |
  LDA #$0008                                ; $07C2A3 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C2A6 |
  STZ !s_spr_y_speed_lo,x                   ; $07C2A8 |
  STZ !s_spr_y_accel,x                      ; $07C2AB |

CODE_07C2AE:
  RTS                                       ; $07C2AE |

CODE_07C2AF:
  LDA !s_spr_y_player_delta,x               ; $07C2AF |
  SEC                                       ; $07C2B2 |
  SBC !s_player_hitbox_half_height          ; $07C2B3 |
  SEC                                       ; $07C2B6 |
  SBC !s_spr_hitbox_height,x                ; $07C2B7 |
  CMP #$FFF8                                ; $07C2BA |
  BCC CODE_07C2C5                           ; $07C2BD |
  JSL $03B20B                               ; $07C2BF |
  BRA CODE_07C2C9                           ; $07C2C3 |

CODE_07C2C5:
  JSL player_hit_sprite                     ; $07C2C5 |

CODE_07C2C9:
  RTS                                       ; $07C2C9 |

  dw $FFFF, $0005                           ; $07C2CA |

  dw $0030, $0060                           ; $07C2CE |

  dw $0000, $0100                           ; $07C2D2 |

init_wall_lakitu:
  LDA !s_spr_x_pixel_pos,x                  ; $07C2D6 |
  AND #$0010                                ; $07C2D9 |
  LSR A                                     ; $07C2DC |
  LSR A                                     ; $07C2DD |
  LSR A                                     ; $07C2DE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C2DF |
  TAY                                       ; $07C2E1 |
  LDA $C2CA,y                               ; $07C2E2 |
  STA !s_spr_draw_priority,x                ; $07C2E5 |
  LDA $C2CE,y                               ; $07C2E8 |
  STA !s_spr_timer_1,x                      ; $07C2EB |
  LDA !s_spr_oam_1,x                        ; $07C2EE |
  AND #$FEFF                                ; $07C2F1 |
  ORA $C2D2,y                               ; $07C2F4 |
  STA !s_spr_oam_1,x                        ; $07C2F7 |
  LDA #$0000                                ; $07C2FA |
  STA !s_spr_anim_frame,x                   ; $07C2FD |
  LDA !s_spr_y_pixel_pos,x                  ; $07C300 |
  CLC                                       ; $07C303 |
  ADC #$000B                                ; $07C304 |
  STA !s_spr_y_pixel_pos,x                  ; $07C307 |
  RTL                                       ; $07C30A |

  LDA $00                                   ; $07C30B |
  STA !s_spr_x_pixel_pos,y                  ; $07C30D |
  LDA $02                                   ; $07C310 |
  CLC                                       ; $07C312 |
  ADC #$000B                                ; $07C313 |
  STA !s_spr_y_pixel_pos,y                  ; $07C316 |
  LDA #$FFFF                                ; $07C319 |
  STA !s_spr_draw_priority,y                ; $07C31C |
  LDA #$0030                                ; $07C31F |
  STA !s_spr_timer_1,y                      ; $07C322 |
  LDA !s_spr_oam_1,y                        ; $07C325 |
  AND #$FEFF                                ; $07C328 |
  STA !s_spr_oam_1,y                        ; $07C32B |
  LDA #$0000                                ; $07C32E |
  STA !s_spr_anim_frame,y                   ; $07C331 |
  LDA #$0001                                ; $07C334 |
  STA !s_spr_wildcard_6_lo,y                ; $07C337 |
  LDA !s_spr_oam_1,y                        ; $07C33A |
  AND #$FFF3                                ; $07C33D |
  STA !s_spr_oam_1,y                        ; $07C340 |
  RTL                                       ; $07C343 |

main_wall_lakitu:
  LDA !s_spr_state,x                        ; $07C344 |
  CMP #$0010                                ; $07C347 |
  BNE CODE_07C351                           ; $07C34A |
  LDA !s_spr_collision_state,x              ; $07C34C |
  BEQ CODE_07C373                           ; $07C34F |

CODE_07C351:
  LDA #$0010                                ; $07C351 |
  STA !s_spr_anim_frame,x                   ; $07C354 |
  LDA !s_spr_wildcard_6_lo,x                ; $07C357 |
  BEQ CODE_07C39D                           ; $07C35A |
  LDA #$0040                                ; $07C35C |
  STA $0CD6                                 ; $07C35F |
  DEC $0C4E                                 ; $07C362 |
  STZ !s_spr_wildcard_6_lo,x                ; $07C365 |
  LDA !s_spr_oam_1,x                        ; $07C368 |
  ORA #$0004                                ; $07C36B |
  STA !s_spr_oam_1,x                        ; $07C36E |
  BRA CODE_07C39D                           ; $07C371 |

CODE_07C373:
  LDY !s_spr_draw_priority,x                ; $07C373 |
  BMI CODE_07C39D                           ; $07C376 |
  LDA !s_spr_anim_frame,x                   ; $07C378 |
  CMP #$000E                                ; $07C37B |
  BNE CODE_07C39D                           ; $07C37E |
  LDA $14                                   ; $07C380 |
  AND #$0006                                ; $07C382 |
  TAY                                       ; $07C385 |
  LDA $A9BE,y                               ; $07C386 |
  STA $00                                   ; $07C389 |
  REP #$10                                  ; $07C38B |
  LDY !s_spr_oam_pointer,x                  ; $07C38D |
  LDA $6004,y                               ; $07C390 |
  AND #$F1FF                                ; $07C393 |
  ORA $00                                   ; $07C396 |
  STA $6004,y                               ; $07C398 |
  SEP #$10                                  ; $07C39B |

CODE_07C39D:
  JSL $03AF23                               ; $07C39D |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C3A1 |
  TAX                                       ; $07C3A3 |
  JMP ($C3A7,x)                             ; $07C3A4 |

  dw $C3AB                                  ; $07C3A7 |
  dw $C3CF                                  ; $07C3A9 |

  LDX $12                                   ; $07C3AB |
  LDA !s_spr_wildcard_6_lo,x                ; $07C3AD |
  BEQ CODE_07C3BF                           ; $07C3B0 |
  JSL $07FC64                               ; $07C3B2 |
  BCC CODE_07C3BF                           ; $07C3B6 |
  DEC $0C4E                                 ; $07C3B8 |
  JML $03A31E                               ; $07C3BB |

CODE_07C3BF:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07C3BF |
  TAX                                       ; $07C3C1 |
  JMP ($C3C5,x)                             ; $07C3C2 |

  dw $C3DB                                  ; $07C3C5 |
  dw $C467                                  ; $07C3C7 |
  dw $C40B                                  ; $07C3C9 |
  dw $C50C                                  ; $07C3CB |
  dw $C4A1                                  ; $07C3CD |

  LDX $12                                   ; $07C3CF |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07C3D1 |
  TAX                                       ; $07C3D3 |
  JMP ($C3D7,x)                             ; $07C3D4 |

  dw $C40B                                  ; $07C3D7 |
  dw $C50C                                  ; $07C3D9 |

  LDX $12                                   ; $07C3DB |
  LDA !s_spr_timer_1,x                      ; $07C3DD |
  BNE CODE_07C40A                           ; $07C3E0 |
  LDA #$0005                                ; $07C3E2 |
  STA !s_spr_draw_priority,x                ; $07C3E5 |
  LDA !s_spr_oam_1,x                        ; $07C3E8 |
  ORA #$0100                                ; $07C3EB |
  STA !s_spr_oam_1,x                        ; $07C3EE |
  LDA #$0003                                ; $07C3F1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07C3F4 |
  TAY                                       ; $07C3F6 |
  LDA $C467,y                               ; $07C3F7 |
  AND #$00FF                                ; $07C3FA |
  STA !s_spr_anim_frame,x                   ; $07C3FD |
  LDA #$0003                                ; $07C400 |
  STA !s_spr_timer_1,x                      ; $07C403 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C406 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C408 |

CODE_07C40A:
  RTL                                       ; $07C40A |

  LDX $12                                   ; $07C40B |
  LDA !s_spr_timer_1,x                      ; $07C40D |
  BNE CODE_07C43C                           ; $07C410 |
  LDA !s_spr_cam_x_pos,x                    ; $07C412 |
  ORA !s_spr_cam_y_pos,x                    ; $07C415 |
  AND #$FF00                                ; $07C418 |
  BNE CODE_07C43C                           ; $07C41B |
  LDA #$0012                                ; $07C41D |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07C420 |
  TAY                                       ; $07C422 |
  LDA $C4E6,y                               ; $07C423 |
  AND #$00FF                                ; $07C426 |
  STA !s_spr_anim_frame,x                   ; $07C429 |
  LDA $C4F9,y                               ; $07C42C |
  AND #$00FF                                ; $07C42F |
  STA !s_spr_timer_1,x                      ; $07C432 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C435 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C437 |
  JMP CODE_07C5D8                           ; $07C439 |

CODE_07C43C:
  LDA !s_spr_timer_2,x                      ; $07C43C |
  BNE CODE_07C464                           ; $07C43F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07C441 |
  BEQ CODE_07C44B                           ; $07C444 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $07C446 |
  BRA CODE_07C455                           ; $07C449 |

CODE_07C44B:
  LDA $10                                   ; $07C44B |
  AND #$000F                                ; $07C44D |
  BNE CODE_07C464                           ; $07C450 |
  INC !s_spr_gsu_morph_1_lo,x               ; $07C452 |

CODE_07C455:
  LDA #$0010                                ; $07C455 |
  STA !s_spr_timer_2,x                      ; $07C458 |
  LDA !s_spr_facing_dir,x                   ; $07C45B |
  EOR #$0002                                ; $07C45E |
  STA !s_spr_facing_dir,x                   ; $07C461 |

CODE_07C464:
  JMP CODE_07C5D8                           ; $07C464 |

  db $01, $03, $04, $05                     ; $07C467 |

  LDX $12                                   ; $07C46B |
  LDA !s_spr_timer_1,x                      ; $07C46D |
  BNE CODE_07C487                           ; $07C470 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07C472 |
  BMI CODE_07C48A                           ; $07C474 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07C476 |
  LDA $C467,y                               ; $07C478 |
  AND #$00FF                                ; $07C47B |
  STA !s_spr_anim_frame,x                   ; $07C47E |
  LDA #$0003                                ; $07C481 |
  STA !s_spr_timer_1,x                      ; $07C484 |

CODE_07C487:
  JMP CODE_07C5D8                           ; $07C487 |

CODE_07C48A:
  LDA #$0000                                ; $07C48A |
  STA !s_spr_anim_frame,x                   ; $07C48D |
  LDA #$0060                                ; $07C490 |
  STA !s_spr_timer_1,x                      ; $07C493 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C496 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C498 |
  JMP CODE_07C5D8                           ; $07C49A |

  db $05, $04, $03, $01                     ; $07C49D |

  LDX $12                                   ; $07C4A1 |
  LDA !s_spr_timer_1,x                      ; $07C4A3 |
  BNE CODE_07C4BD                           ; $07C4A6 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07C4A8 |
  BMI CODE_07C4C0                           ; $07C4AA |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07C4AC |
  LDA $C49D,y                               ; $07C4AE |
  AND #$00FF                                ; $07C4B1 |
  STA !s_spr_anim_frame,x                   ; $07C4B4 |
  LDA #$0003                                ; $07C4B7 |
  STA !s_spr_timer_1,x                      ; $07C4BA |

CODE_07C4BD:
  JMP CODE_07C5D8                           ; $07C4BD |

CODE_07C4C0:
  LDA !s_spr_wildcard_6_lo,x                ; $07C4C0 |
  BNE CODE_07C4DF                           ; $07C4C3 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07C4C5 |
  LDA #$0030                                ; $07C4C7 |
  STA !s_spr_timer_1,x                      ; $07C4CA |
  LDA #$FFFF                                ; $07C4CD |
  STA !s_spr_draw_priority,x                ; $07C4D0 |
  LDA !s_spr_oam_1,x                        ; $07C4D3 |
  AND #$FEFF                                ; $07C4D6 |
  STA !s_spr_oam_1,x                        ; $07C4D9 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07C4DC |
  RTL                                       ; $07C4DE |

CODE_07C4DF:
  DEC $0C4E                                 ; $07C4DF |
  JML $03A31E                               ; $07C4E2 |

  db $0F, $0E, $0B, $0D, $0B, $0C, $0B, $0A ; $07C4E6 |
  db $09, $08, $07, $06, $04, $03, $02, $03 ; $07C4EE |
  db $02, $03, $02                          ; $07C4F6 |

  db $20, $40, $10, $06, $02, $02, $02, $02 ; $07C4F9 |
  db $02, $02, $02, $02, $0C, $08, $08, $08 ; $07C501 |
  db $08, $08, $08                          ; $07C509 |

  LDX $12                                   ; $07C50C |
  LDA !s_spr_cam_x_pos,x                    ; $07C50E |
  ORA !s_spr_cam_y_pos,x                    ; $07C511 |
  AND #$FF00                                ; $07C514 |
  BEQ CODE_07C51C                           ; $07C517 |
  JMP CODE_07C5A9                           ; $07C519 |

CODE_07C51C:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07C51C |
  CMP #$0002                                ; $07C51E |
  BCC CODE_07C52C                           ; $07C521 |
  LDA !s_spr_x_player_dir,x                 ; $07C523 |
  AND #$00FF                                ; $07C526 |
  STA !s_spr_facing_dir,x                   ; $07C529 |

CODE_07C52C:
  LDA !s_spr_timer_1,x                      ; $07C52C |
  BNE CODE_07C582                           ; $07C52F |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $07C531 |
  BMI CODE_07C5A9                           ; $07C533 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07C535 |
  LDA $C4E6,y                               ; $07C537 |
  AND #$00FF                                ; $07C53A |
  STA !s_spr_anim_frame,x                   ; $07C53D |
  LDA $C4F9,y                               ; $07C540 |
  AND #$00FF                                ; $07C543 |
  STA !s_spr_timer_1,x                      ; $07C546 |
  CPY #$01                                  ; $07C549 |
  BNE CODE_07C566                           ; $07C54B |
  LDA !s_player_center_x                    ; $07C54D |
  SEC                                       ; $07C550 |
  SBC #$0008                                ; $07C551 |
  STA !s_spr_wildcard_1_lo,x                ; $07C554 |
  LDA !s_player_center_y                    ; $07C557 |
  SEC                                       ; $07C55A |
  SBC #$0008                                ; $07C55B |
  STA !s_spr_wildcard_2_lo,x                ; $07C55E |
  STZ !s_spr_gsu_morph_2_lo,x               ; $07C561 |
  BRA CODE_07C588                           ; $07C564 |

CODE_07C566:
  CPY #$00                                  ; $07C566 |
  BNE CODE_07C582                           ; $07C568 |
  LDA !s_spr_wildcard_1_lo,x                ; $07C56A |
  STA $00                                   ; $07C56D |
  LDA !s_spr_wildcard_2_lo,x                ; $07C56F |
  STA $02                                   ; $07C572 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07C574 |
  STA $04                                   ; $07C577 |
  JSL $07FCB3                               ; $07C579 |
  JSR CODE_07C632                           ; $07C57D |
  BRA CODE_07C5A7                           ; $07C580 |

CODE_07C582:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $07C582 |
  CPY #$01                                  ; $07C584 |
  BNE CODE_07C5A7                           ; $07C586 |

CODE_07C588:
  LDA !s_spr_wildcard_1_lo,x                ; $07C588 |
  STA $00                                   ; $07C58B |
  LDA !s_spr_wildcard_2_lo,x                ; $07C58D |
  STA $02                                   ; $07C590 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07C592 |
  STA $04                                   ; $07C595 |
  JSL $07FCB8                               ; $07C597 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07C59B |
  INC A                                     ; $07C59E |
  CMP #$0020                                ; $07C59F |
  BCS CODE_07C5A7                           ; $07C5A2 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07C5A4 |

CODE_07C5A7:
  BRA CODE_07C5D8                           ; $07C5A7 |

CODE_07C5A9:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C5A9 |
  BEQ CODE_07C5BF                           ; $07C5AB |
  LDA #$0000                                ; $07C5AD |
  STA !s_spr_anim_frame,x                   ; $07C5B0 |
  LDA #$0060                                ; $07C5B3 |
  STA !s_spr_timer_1,x                      ; $07C5B6 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07C5B9 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07C5BB |
  BRA CODE_07C5D8                           ; $07C5BD |

CODE_07C5BF:
  LDA #$0003                                ; $07C5BF |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07C5C2 |
  TAY                                       ; $07C5C4 |
  LDA $C49D,y                               ; $07C5C5 |
  AND #$00FF                                ; $07C5C8 |
  STA !s_spr_anim_frame,x                   ; $07C5CB |
  LDA #$0003                                ; $07C5CE |
  STA !s_spr_timer_1,x                      ; $07C5D1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C5D4 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07C5D6 |

CODE_07C5D8:
  LDY !s_spr_collision_id,x                 ; $07C5D8 |
  BMI CODE_07C5F9                           ; $07C5DB |
  DEY                                       ; $07C5DD |
  BMI CODE_07C5F8                           ; $07C5DE |
  BEQ CODE_07C5F8                           ; $07C5E0 |
  LDA !s_spr_state,y                        ; $07C5E2 |
  CMP #$0010                                ; $07C5E5 |
  BNE CODE_07C5F8                           ; $07C5E8 |
  LDA !s_spr_collision_state,y              ; $07C5EA |
  BEQ CODE_07C5F8                           ; $07C5ED |
  TYX                                       ; $07C5EF |
  JSL $03B24B                               ; $07C5F0 |
  LDX $12                                   ; $07C5F4 |
  BRA CODE_07C60C                           ; $07C5F6 |

CODE_07C5F8:
  RTL                                       ; $07C5F8 |

CODE_07C5F9:
  JSL $07FC2F                               ; $07C5F9 |
  BEQ CODE_07C5F8                           ; $07C5FD |
  BCC CODE_07C5F8                           ; $07C5FF |
  JSL $03B20B                               ; $07C601 |
  LDA #$001C                                ; $07C605 |\ play sound #$001C
  JSL push_sound_queue                      ; $07C608 |/

CODE_07C60C:
  LDA #$FC00                                ; $07C60C |
  STA !s_spr_y_speed_lo,x                   ; $07C60F |
  LDA #$0040                                ; $07C612 |
  STA !s_spr_y_accel,x                      ; $07C615 |
  LDA #$0010                                ; $07C618 |
  STA !s_spr_anim_frame,x                   ; $07C61B |
  LDA #$000E                                ; $07C61E |
  STA !s_spr_state,x                        ; $07C621 |
  SEP #$20                                  ; $07C624 |
  LDA #$FF                                  ; $07C626 |
  STA !s_spr_stage_id,x                     ; $07C628 |
  REP #$20                                  ; $07C62B |
  RTL                                       ; $07C62D |

  JML $03A858                               ; $07C62E |

CODE_07C632:
  LDA !s_spr_wildcard_1_lo,x                ; $07C632 |
  STA !gsu_r1                               ; $07C635 |
  LDA !s_spr_wildcard_2_lo,x                ; $07C638 |
  STA !gsu_r2                               ; $07C63B |
  LDY !s_spr_facing_dir,x                   ; $07C63E |
  LDA !s_spr_x_hitbox_center,x              ; $07C641 |
  CLC                                       ; $07C644 |
  ADC $AA89,y                               ; $07C645 |
  STA $00                                   ; $07C648 |
  STA !gsu_r3                               ; $07C64A |
  LDA !s_spr_y_hitbox_center,x              ; $07C64D |
  STA !gsu_r4                               ; $07C650 |
  LDA #$0380                                ; $07C653 |
  STA !gsu_r6                               ; $07C656 |
  LDX #$09                                  ; $07C659 |
  LDA #$907C                                ; $07C65B |
  JSL r_gsu_init_1                          ; $07C65E | GSU init
  LDX $12                                   ; $07C662 |
  LDA #$011D                                ; $07C664 |
  JSL spawn_sprite_init                     ; $07C667 |
  BCC CODE_07C688                           ; $07C66B |
  LDA !gsu_r1                               ; $07C66D |
  STA !s_spr_x_speed_lo,y                   ; $07C670 |
  LDA !gsu_r2                               ; $07C673 |
  STA !s_spr_y_speed_lo,y                   ; $07C676 |
  LDA $00                                   ; $07C679 |
  STA !s_spr_x_pixel_pos,y                  ; $07C67B |
  LDA !s_spr_y_pixel_pos,x                  ; $07C67E |
  SEC                                       ; $07C681 |
  SBC #$0008                                ; $07C682 |
  STA !s_spr_y_pixel_pos,y                  ; $07C685 |

CODE_07C688:
  RTS                                       ; $07C688 |

  LDA !s_spr_wildcard_6_lo,x                ; $07C689 |
  BEQ CODE_07C6A1                           ; $07C68C |
  LDA #$0040                                ; $07C68E |
  STA $0CD6                                 ; $07C691 |
  JSL $07FC64                               ; $07C694 |
  BCC CODE_07C6A1                           ; $07C698 |
  DEC $0C4E                                 ; $07C69A |
  JML $03A31E                               ; $07C69D |

CODE_07C6A1:
  RTL                                       ; $07C6A1 |

  dw $FFA0, $0060                           ; $07C6A2 |

init_grunt_walking:
  LDY !s_spr_facing_dir,x                   ; $07C6A6 |
  LDA $C6A2,y                               ; $07C6A9 |
  STA !s_spr_x_speed_lo,x                   ; $07C6AC |
  LDA #$0004                                ; $07C6AF |
  STA !s_spr_timer_1,x                      ; $07C6B2 |
  LDA #$0004                                ; $07C6B5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C6B8 |
  TAY                                       ; $07C6BA |
  LDA $C714,y                               ; $07C6BB |
  AND #$00FF                                ; $07C6BE |
  STA !s_spr_anim_frame,x                   ; $07C6C1 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07C6C4 |
  RTL                                       ; $07C6C6 |

  dw $FF00, $0100                           ; $07C6C7 |

init_grunt_running:
  LDY !s_spr_facing_dir,x                   ; $07C6CB |
  LDA $C6C7,y                               ; $07C6CE |
  STA !s_spr_x_speed_lo,x                   ; $07C6D1 |
  LDA #$0003                                ; $07C6D4 |
  STA !s_spr_timer_1,x                      ; $07C6D7 |
  LDA #$0001                                ; $07C6DA |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C6DD |
  TAY                                       ; $07C6DF |
  LDA $C73F,y                               ; $07C6E0 |
  AND #$00FF                                ; $07C6E3 |
  STA !s_spr_anim_frame,x                   ; $07C6E6 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07C6E9 |
  RTL                                       ; $07C6EB |

main_grunt_walking:
  JSL $03AF23                               ; $07C6EC |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C6F0 |
  TAX                                       ; $07C6F2 |
  JMP ($C6F6,x)                             ; $07C6F3 |

  dw $C719                                  ; $07C6F6 |
  dw $C79D                                  ; $07C6F8 |
  dw $C7EB                                  ; $07C6FA |
  dw $C76A                                  ; $07C6FC |
  dw $C83A                                  ; $07C6FE |

main_grunt_running:
  JSL $03AF23                               ; $07C700 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C704 |
  TAX                                       ; $07C706 |
  JMP ($C70A,x)                             ; $07C707 |

  dw $C741                                  ; $07C70A |
  dw $C79D                                  ; $07C70C |
  dw $C7EB                                  ; $07C70E |
  dw $C76A                                  ; $07C710 |
  dw $C83A                                  ; $07C712 |

  db $04, $03, $02, $01, $00                ; $07C714 |

  LDX $12                                   ; $07C719 |
  JSL $07C866                               ; $07C71B |
  LDA !s_spr_timer_1,x                      ; $07C71F |
  BNE CODE_07C73E                           ; $07C722 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07C724 |
  BPL CODE_07C72D                           ; $07C726 |
  LDA #$0004                                ; $07C728 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C72B |

CODE_07C72D:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07C72D |
  LDA $C714,y                               ; $07C72F |
  AND #$00FF                                ; $07C732 |
  STA !s_spr_anim_frame,x                   ; $07C735 |
  LDA #$0004                                ; $07C738 |
  STA !s_spr_timer_1,x                      ; $07C73B |

CODE_07C73E:
  RTL                                       ; $07C73E |

  db $08, $07                               ; $07C73F |

  LDX $12                                   ; $07C741 |
  JSL $07C866                               ; $07C743 |
  LDA #$C73F                                ; $07C747 |
  STA $00                                   ; $07C74A |

CODE_07C74C:
  LDA !s_spr_timer_1,x                      ; $07C74C |
  BNE CODE_07C767                           ; $07C74F |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07C751 |
  EOR #$0001                                ; $07C753 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C756 |
  TAY                                       ; $07C758 |
  LDA ($00),y                               ; $07C759 |
  AND #$00FF                                ; $07C75B |
  STA !s_spr_anim_frame,x                   ; $07C75E |
  LDA #$0003                                ; $07C761 |
  STA !s_spr_timer_1,x                      ; $07C764 |

CODE_07C767:
  RTL                                       ; $07C767 |

  db $06, $05                               ; $07C768 |

  LDX $12                                   ; $07C76A |
  JSL $07C923                               ; $07C76C |
  LDA !s_spr_wildcard_6_lo,x                ; $07C770 |
  BEQ CODE_07C796                           ; $07C773 |
  LDA !s_spr_timer_2,x                      ; $07C775 |
  BNE CODE_07C796                           ; $07C778 |
  LDA !s_spr_facing_dir,x                   ; $07C77A |
  EOR #$0002                                ; $07C77D |
  STA !s_spr_facing_dir,x                   ; $07C780 |
  LDA !s_spr_x_speed_lo,x                   ; $07C783 |
  EOR #$FFFF                                ; $07C786 |
  INC A                                     ; $07C789 |
  STA !s_spr_x_speed_lo,x                   ; $07C78A |
  LDA #$0020                                ; $07C78D |
  STA !s_spr_timer_2,x                      ; $07C790 |
  DEC !s_spr_wildcard_6_lo,x                ; $07C793 |

CODE_07C796:
  LDA #$C768                                ; $07C796 |
  STA $00                                   ; $07C799 |
  BRA CODE_07C74C                           ; $07C79B |
  LDX $12                                   ; $07C79D |
  LDA $7860,x                               ; $07C79F |
  AND #$0001                                ; $07C7A2 |
  BEQ CODE_07C7C8                           ; $07C7A5 |
  SEP #$20                                  ; $07C7A7 |
  LDA #$10                                  ; $07C7A9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C7AB |
  TAY                                       ; $07C7AD |
  LDA $C7C9,y                               ; $07C7AE |
  STA !s_spr_anim_frame,x                   ; $07C7B1 |
  LDA $C7DA,y                               ; $07C7B4 |
  STA !s_spr_timer_1,x                      ; $07C7B7 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07C7BA |
  STA !s_spr_facing_dir,x                   ; $07C7BC |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C7BF |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C7C1 |
  REP #$20                                  ; $07C7C3 |
  STZ !s_spr_x_speed_lo,x                   ; $07C7C5 |

CODE_07C7C8:
  RTL                                       ; $07C7C8 |

  db $0D, $0A, $0C, $0A, $0B, $0A, $0C, $0A ; $07C7C9 |
  db $0B, $0A, $0C, $0A, $0B, $0A, $09, $10 ; $07C7D1 |
  db $0F                                    ; $07C7D9 |

  db $42, $12, $02, $02, $02, $02, $02, $02 ; $07C7DA |
  db $02, $02, $02, $02, $02, $08, $20, $02 ; $07C7E2 |
  db $02                                    ; $07C7EA |

  LDX $12                                   ; $07C7EB |
  LDA !s_spr_timer_1,x                      ; $07C7ED |
  BNE CODE_07C808                           ; $07C7F0 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07C7F2 |
  BMI CODE_07C809                           ; $07C7F4 |
  SEP #$20                                  ; $07C7F6 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07C7F8 |
  LDA $C7C9,y                               ; $07C7FA |
  STA !s_spr_anim_frame,x                   ; $07C7FD |
  LDA $C7DA,y                               ; $07C800 |
  STA !s_spr_timer_1,x                      ; $07C803 |
  REP #$20                                  ; $07C806 |

CODE_07C808:
  RTL                                       ; $07C808 |

CODE_07C809:
  LDY !s_spr_facing_dir,x                   ; $07C809 |
  LDA $C6C7,y                               ; $07C80C |
  STA !s_spr_x_speed_lo,x                   ; $07C80F |
  LDA #$0003                                ; $07C812 |
  STA !s_spr_timer_1,x                      ; $07C815 |
  LDA #$0001                                ; $07C818 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C81B |
  TAY                                       ; $07C81D |
  LDA $C768,y                               ; $07C81E |
  AND #$00FF                                ; $07C821 |
  STA !s_spr_anim_frame,x                   ; $07C824 |
  LDA #$0003                                ; $07C827 |
  STA !s_spr_wildcard_6_lo,x                ; $07C82A |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C82D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C82F |
  RTL                                       ; $07C831 |

  db $12, $13, $12, $11                     ; $07C832 |

  db $40, $03, $03, $03                     ; $07C836 |

  LDX $12                                   ; $07C83A |
  LDA !s_spr_timer_1,x                      ; $07C83C |
  BNE CODE_07C857                           ; $07C83F |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07C841 |
  BMI CODE_07C858                           ; $07C843 |
  SEP #$20                                  ; $07C845 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07C847 |
  LDA $C832,y                               ; $07C849 |
  STA !s_spr_anim_frame,x                   ; $07C84C |
  LDA $C836,y                               ; $07C84F |
  STA !s_spr_timer_1,x                      ; $07C852 |
  REP #$20                                  ; $07C855 |

CODE_07C857:
  RTL                                       ; $07C857 |

CODE_07C858:
  LDA !s_spr_id,x                           ; $07C858 |
  CMP #$0159                                ; $07C85B |
  BNE CODE_07C863                           ; $07C85E |
  JMP init_grunt_walking                    ; $07C860 |

CODE_07C863:
  JMP init_grunt_running                    ; $07C863 |
  LDY !s_spr_collision_id,x                 ; $07C866 |
  BPL CODE_07C86E                           ; $07C869 |
  JMP CODE_07C8F8                           ; $07C86B |

CODE_07C86E:
  DEY                                       ; $07C86E |
  BEQ CODE_07C873                           ; $07C86F |
  BPL CODE_07C876                           ; $07C871 |

CODE_07C873:
  JMP CODE_07C8F7                           ; $07C873 |

CODE_07C876:
  LDA !s_spr_state,y                        ; $07C876 |
  CMP #$0010                                ; $07C879 |
  BNE CODE_07C8F7                           ; $07C87C |
  LDA !s_spr_collision_state,y              ; $07C87E |
  BEQ CODE_07C8F7                           ; $07C881 |
  LDA #$000E                                ; $07C883 |
  STA !s_spr_anim_frame,x                   ; $07C886 |
  LDA #$FE00                                ; $07C889 |
  STA !s_spr_y_speed_lo,x                   ; $07C88C |
  LDA $7860,x                               ; $07C88F |
  AND #$FFFE                                ; $07C892 |
  STA $7860,x                               ; $07C895 |
  LDA !s_spr_x_speed_lo,y                   ; $07C898 |
  CMP #$8000                                ; $07C89B |
  ROR A                                     ; $07C89E |
  CMP #$8000                                ; $07C89F |
  ROR A                                     ; $07C8A2 |
  STA !s_spr_x_speed_lo,x                   ; $07C8A3 |
  AND #$8000                                ; $07C8A6 |
  ASL A                                     ; $07C8A9 |
  ROL A                                     ; $07C8AA |
  ASL A                                     ; $07C8AB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07C8AC |
  PHY                                       ; $07C8AE |
  JSL $03B53D                               ; $07C8AF |
  PLX                                       ; $07C8B3 |
  JSL $03B24B                               ; $07C8B4 |
  LDX $12                                   ; $07C8B8 |
  LDA #$0207                                ; $07C8BA |
  JSL spawn_ambient_sprite                  ; $07C8BD |
  LDA !s_spr_x_pixel_pos,x                  ; $07C8C1 |
  STA $70A2,y                               ; $07C8C4 |
  LDA !s_spr_y_pixel_pos,x                  ; $07C8C7 |
  SEC                                       ; $07C8CA |
  SBC #$000E                                ; $07C8CB |
  STA $7142,y                               ; $07C8CE |
  LDA !s_spr_y_speed_lo,x                   ; $07C8D1 |
  SEC                                       ; $07C8D4 |
  SBC #$0100                                ; $07C8D5 |
  STA $71E2,y                               ; $07C8D8 |
  LDA !s_spr_x_speed_lo,x                   ; $07C8DB |
  EOR #$FFFF                                ; $07C8DE |
  INC A                                     ; $07C8E1 |
  STA $71E0,y                               ; $07C8E2 |
  LDA #$00C0                                ; $07C8E5 |
  STA $7782,y                               ; $07C8E8 |
  LDA !s_spr_facing_dir,x                   ; $07C8EB |
  STA $73C0,y                               ; $07C8EE |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C8F1 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07C8F3 |
  PLY                                       ; $07C8F5 |
  PLA                                       ; $07C8F6 |

CODE_07C8F7:
  RTL                                       ; $07C8F7 |

CODE_07C8F8:
  JSL $07FC2F                               ; $07C8F8 |
  BEQ CODE_07C922                           ; $07C8FC |
  BCC CODE_07C91E                           ; $07C8FE |
  STZ !s_spr_x_speed_lo,x                   ; $07C900 |
  SEP #$20                                  ; $07C903 |
  LDA #$03                                  ; $07C905 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07C907 |
  TAY                                       ; $07C909 |
  LDA $C832,y                               ; $07C90A |
  STA !s_spr_anim_frame,x                   ; $07C90D |
  LDA $C836,y                               ; $07C910 |
  STA !s_spr_timer_1,x                      ; $07C913 |
  LDA #$08                                  ; $07C916 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C918 |
  REP #$20                                  ; $07C91A |
  PLY                                       ; $07C91C |
  PLA                                       ; $07C91D |

CODE_07C91E:
  JSL player_hit_sprite                     ; $07C91E |

CODE_07C922:
  RTL                                       ; $07C922 |

  LDY !s_spr_collision_id,x                 ; $07C923 |
  BMI CODE_07C963                           ; $07C926 |
  DEY                                       ; $07C928 |
  BMI CODE_07C962                           ; $07C929 |
  BEQ CODE_07C962                           ; $07C92B |
  LDA !s_spr_state,y                        ; $07C92D |
  CMP #$0010                                ; $07C930 |
  BNE CODE_07C962                           ; $07C933 |
  LDA !s_spr_collision_state,y              ; $07C935 |
  BEQ CODE_07C962                           ; $07C938 |
  PHY                                       ; $07C93A |
  JSL $03B24B                               ; $07C93B |
  PLY                                       ; $07C93F |
  LDA #$FE00                                ; $07C940 |
  STA !s_spr_y_speed_lo,x                   ; $07C943 |
  LDA !s_spr_x_speed_lo,y                   ; $07C946 |
  CMP #$8000                                ; $07C949 |
  ROR A                                     ; $07C94C |
  CMP #$8000                                ; $07C94D |
  ROR A                                     ; $07C950 |
  STA !s_spr_x_speed_lo,x                   ; $07C951 |
  PHY                                       ; $07C954 |
  JSL $03B53D                               ; $07C955 |
  PLX                                       ; $07C959 |
  JSL $03B24B                               ; $07C95A |
  LDX $12                                   ; $07C95E |
  PLY                                       ; $07C960 |
  PLA                                       ; $07C961 |

CODE_07C962:
  RTL                                       ; $07C962 |

CODE_07C963:
  JSL $03A5B7                               ; $07C963 |
  RTL                                       ; $07C967 |

init_spear_guy_dancing:
  LDY !s_spr_wildcard_1_lo,x                ; $07C968 |
  BNE CODE_07C9BE                           ; $07C96B |
  LDA $0C50                                 ; $07C96D |
  BNE CODE_07C976                           ; $07C970 |
  JML $03A31E                               ; $07C972 |

CODE_07C976:
  STZ !s_spr_facing_dir,x                   ; $07C976 |
  LDA !s_spr_y_hitbox_offset,x              ; $07C979 |
  SEC                                       ; $07C97C |
  SBC #$0004                                ; $07C97D |
  STA !s_spr_y_hitbox_offset,x              ; $07C980 |
  LDA !s_spr_hitbox_height,x                ; $07C983 |
  CLC                                       ; $07C986 |
  ADC #$0002                                ; $07C987 |
  STA !s_spr_hitbox_height,x                ; $07C98A |
  LDA !s_spr_x_pixel_pos,x                  ; $07C98D |
  AND #$0010                                ; $07C990 |
  LSR A                                     ; $07C993 |
  LSR A                                     ; $07C994 |
  LSR A                                     ; $07C995 |
  TAY                                       ; $07C996 |
  INC A                                     ; $07C997 |
  STA !s_spr_wildcard_1_lo,x                ; $07C998 |
  LDA $0CD8                                 ; $07C99B |
  BEQ CODE_07C9B4                           ; $07C99E |
  LDA !s_spr_x_pixel_pos,x                  ; $07C9A0 |
  CLC                                       ; $07C9A3 |
  ADC $0C62,y                               ; $07C9A4 |
  STA !s_spr_x_pixel_pos,x                  ; $07C9A7 |
  LDA $0C58,y                               ; $07C9AA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C9AD |
  TAX                                       ; $07C9AF |
  JSR ($C9F7,x)                             ; $07C9B0 |
  RTL                                       ; $07C9B3 |

CODE_07C9B4:
  LDA !s_spr_x_pixel_pos,x                  ; $07C9B4 |
  CLC                                       ; $07C9B7 |
  ADC $0C5E,y                               ; $07C9B8 |
  STA !s_spr_x_pixel_pos,x                  ; $07C9BB |

CODE_07C9BE:
  LDA #$0004                                ; $07C9BE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C9C1 |
  TAX                                       ; $07C9C3 |
  JSR ($C9F7,x)                             ; $07C9C4 |
  RTL                                       ; $07C9C7 |

main_spear_guy_dancing:
  JSL $03AF23                               ; $07C9C8 |
  INC $0C66                                 ; $07C9CC |
  JSR CODE_07CE47                           ; $07C9CF |
  LDA $0CD8                                 ; $07C9D2 |
  BEQ CODE_07C9EC                           ; $07C9D5 |
  STZ !s_spr_x_speed_lo,x                   ; $07C9D7 |
  STZ !s_spr_facing_dir,x                   ; $07C9DA |
  LDY !s_spr_wildcard_1_lo,x                ; $07C9DD |
  DEY                                       ; $07C9E0 |
  LDA $0C58,y                               ; $07C9E1 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07C9E4 |
  TAX                                       ; $07C9E6 |
  JSR ($C9F7,x)                             ; $07C9E7 |
  BRA CODE_07C9F2                           ; $07C9EA |

CODE_07C9EC:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07C9EC |
  TAX                                       ; $07C9EE |
  JSR ($CA09,x)                             ; $07C9EF |

CODE_07C9F2:
  JSL $03A5B7                               ; $07C9F2 |
  RTL                                       ; $07C9F6 |

  dw $CA2B                                  ; $07C9F7 |
  dw $CAA9                                  ; $07C9F9 |
  dw $CB31                                  ; $07C9FB |
  dw $CB86                                  ; $07C9FD |
  dw $CBE0                                  ; $07C9FF |
  dw $CC58                                  ; $07CA01 |
  dw $CCCA                                  ; $07CA03 |
  dw $CD28                                  ; $07CA05 |
  dw $CDA9                                  ; $07CA07 |

  dw $CA44                                  ; $07CA09 |
  dw $CAC2                                  ; $07CA0B |
  dw $CB4A                                  ; $07CA0D |
  dw $CBA8                                  ; $07CA0F |
  dw $CC0B                                  ; $07CA11 |
  dw $CC71                                  ; $07CA13 |
  dw $CCE3                                  ; $07CA15 |
  dw $CD41                                  ; $07CA17 |
  dw $CDC2                                  ; $07CA19 |

  db $00, $FE, $00, $02, $07, $03, $02, $01 ; $07CA1B |
  db $00, $06                               ; $07CA23 |

  db $08, $08, $08, $08, $08, $08           ; $07CA25 |

  LDX $12                                   ; $07CA2B |
  LDA #$0005                                ; $07CA2D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CA30 |
  SEP #$20                                  ; $07CA32 |
  TAY                                       ; $07CA34 |
  LDA $CA1F,y                               ; $07CA35 |
  STA !s_spr_anim_frame,x                   ; $07CA38 |
  LDA $CA25,y                               ; $07CA3B |
  STA !s_spr_timer_1,x                      ; $07CA3E |
  REP #$20                                  ; $07CA41 |
  RTS                                       ; $07CA43 |

  LDX $12                                   ; $07CA44 |
  LDA $7860,x                               ; $07CA46 |
  BIT #$0001                                ; $07CA49 |
  BEQ CODE_07CA51                           ; $07CA4C |
  STZ !s_spr_x_speed_lo,x                   ; $07CA4E |

CODE_07CA51:
  LDA !s_spr_timer_1,x                      ; $07CA51 |
  BNE CODE_07CA8E                           ; $07CA54 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CA56 |
  BMI CODE_07CA8F                           ; $07CA58 |
  SEP #$20                                  ; $07CA5A |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CA5C |
  LDA $CA1F,y                               ; $07CA5E |
  STA !s_spr_anim_frame,x                   ; $07CA61 |
  LDA $CA25,y                               ; $07CA64 |
  STA !s_spr_timer_1,x                      ; $07CA67 |
  REP #$20                                  ; $07CA6A |
  CPY #$03                                  ; $07CA6C |
  BNE CODE_07CA8E                           ; $07CA6E |
  LDA #$FE00                                ; $07CA70 |
  STA !s_spr_y_speed_lo,x                   ; $07CA73 |
  LDA $7860,x                               ; $07CA76 |
  AND #$FFFE                                ; $07CA79 |
  STA $7860,x                               ; $07CA7C |
  LDA #$0040                                ; $07CA7F |
  STA !s_spr_y_accel,x                      ; $07CA82 |
  LDY !s_spr_facing_dir,x                   ; $07CA85 |
  LDA $CA1B,y                               ; $07CA88 |
  STA !s_spr_x_speed_lo,x                   ; $07CA8B |

CODE_07CA8E:
  RTS                                       ; $07CA8E |

CODE_07CA8F:
  LDA #$0004                                ; $07CA8F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CA92 |
  TAX                                       ; $07CA94 |
  JSR ($C9F7,x)                             ; $07CA95 |
  RTS                                       ; $07CA98 |

  dw $0200, $FE00                           ; $07CA99 |

  db $06, $00, $05, $04, $03, $07           ; $07CA9D |

  db $08, $08, $08, $08, $08, $08           ; $07CAA3 |

  LDX $12                                   ; $07CAA9 |
  LDA #$0005                                ; $07CAAB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CAAE |
  SEP #$20                                  ; $07CAB0 |
  TAY                                       ; $07CAB2 |
  LDA $CA9D,y                               ; $07CAB3 |
  STA !s_spr_anim_frame,x                   ; $07CAB6 |
  LDA $CAA3,y                               ; $07CAB9 |
  STA !s_spr_timer_1,x                      ; $07CABC |
  REP #$20                                  ; $07CABF |
  RTS                                       ; $07CAC1 |

  LDX $12                                   ; $07CAC2 |
  LDA $7860,x                               ; $07CAC4 |
  BIT #$0001                                ; $07CAC7 |
  BEQ CODE_07CACF                           ; $07CACA |
  STZ !s_spr_x_speed_lo,x                   ; $07CACC |

CODE_07CACF:
  LDA !s_spr_timer_1,x                      ; $07CACF |
  BNE CODE_07CB0C                           ; $07CAD2 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CAD4 |
  BMI CODE_07CB0D                           ; $07CAD6 |
  SEP #$20                                  ; $07CAD8 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CADA |
  LDA $CA9D,y                               ; $07CADC |
  STA !s_spr_anim_frame,x                   ; $07CADF |
  LDA $CAA3,y                               ; $07CAE2 |
  STA !s_spr_timer_1,x                      ; $07CAE5 |
  REP #$20                                  ; $07CAE8 |
  CPY #$03                                  ; $07CAEA |
  BNE CODE_07CB0C                           ; $07CAEC |
  LDA #$FE00                                ; $07CAEE |
  STA !s_spr_y_speed_lo,x                   ; $07CAF1 |
  LDA $7860,x                               ; $07CAF4 |
  AND #$FFFE                                ; $07CAF7 |
  STA $7860,x                               ; $07CAFA |
  LDA #$0040                                ; $07CAFD |
  STA !s_spr_y_accel,x                      ; $07CB00 |
  LDY !s_spr_facing_dir,x                   ; $07CB03 |
  LDA $CA99,y                               ; $07CB06 |
  STA !s_spr_x_speed_lo,x                   ; $07CB09 |

CODE_07CB0C:
  RTS                                       ; $07CB0C |

CODE_07CB0D:
  LDA #$0004                                ; $07CB0D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CB10 |
  TAX                                       ; $07CB12 |
  JSR ($C9F7,x)                             ; $07CB13 |
  RTS                                       ; $07CB16 |

  db $00, $05, $04, $03, $02, $01, $00, $05 ; $07CB17 |
  db $04, $03, $02, $01, $00                ; $07CB1F |

  db $02, $04, $04, $04, $04, $04, $04, $04 ; $07CB24 |
  db $04, $04, $04, $04, $02                ; $07CB2C |

  LDX $12                                   ; $07CB31 |
  LDA #$000C                                ; $07CB33 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CB36 |
  TAY                                       ; $07CB38 |
  SEP #$20                                  ; $07CB39 |
  LDA $CB17,y                               ; $07CB3B |
  STA !s_spr_anim_frame,x                   ; $07CB3E |
  LDA $CB24,y                               ; $07CB41 |
  STA !s_spr_timer_1,x                      ; $07CB44 |
  REP #$20                                  ; $07CB47 |
  RTS                                       ; $07CB49 |

  LDX $12                                   ; $07CB4A |
  LDA !s_spr_timer_1,x                      ; $07CB4C |
  BNE CODE_07CB67                           ; $07CB4F |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CB51 |
  BMI CODE_07CB68                           ; $07CB53 |
  SEP #$20                                  ; $07CB55 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CB57 |
  LDA $CB17,y                               ; $07CB59 |
  STA !s_spr_anim_frame,x                   ; $07CB5C |
  LDA $CB24,y                               ; $07CB5F |
  STA !s_spr_timer_1,x                      ; $07CB62 |
  REP #$20                                  ; $07CB65 |

CODE_07CB67:
  RTS                                       ; $07CB67 |

CODE_07CB68:
  LDA #$0004                                ; $07CB68 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CB6B |
  TAX                                       ; $07CB6D |
  JSR ($C9F7,x)                             ; $07CB6E |
  RTS                                       ; $07CB71 |

  dw $FFAB, $0055                           ; $07CB72 |

  db $08, $09, $0A, $0B, $0B, $0A, $09, $08 ; $07CB76 |

  db $06, $06, $06, $06, $06, $06, $06, $06 ; $07CB7E |

  LDX $12                                   ; $07CB86 |
  LDA #$0007                                ; $07CB88 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CB8B |
  SEP #$20                                  ; $07CB8D |
  TAY                                       ; $07CB8F |
  LDA $CB76,y                               ; $07CB90 |
  STA !s_spr_anim_frame,x                   ; $07CB93 |
  LDA $CB7E,y                               ; $07CB96 |
  STA !s_spr_timer_1,x                      ; $07CB99 |
  REP #$20                                  ; $07CB9C |
  LDY !s_spr_facing_dir,x                   ; $07CB9E |
  LDA $CB72,y                               ; $07CBA1 |
  STA !s_spr_x_speed_lo,x                   ; $07CBA4 |
  RTS                                       ; $07CBA7 |

  LDX $12                                   ; $07CBA8 |
  LDA !s_spr_timer_1,x                      ; $07CBAA |
  BNE CODE_07CBD2                           ; $07CBAD |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CBAF |
  BMI CODE_07CBD3                           ; $07CBB1 |
  SEP #$20                                  ; $07CBB3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CBB5 |
  LDA $CB76,y                               ; $07CBB7 |
  STA !s_spr_anim_frame,x                   ; $07CBBA |
  LDA $CB7E,y                               ; $07CBBD |
  STA !s_spr_timer_1,x                      ; $07CBC0 |
  REP #$20                                  ; $07CBC3 |
  CPY #$03                                  ; $07CBC5 |
  BNE CODE_07CBD2                           ; $07CBC7 |
  LDA !s_spr_facing_dir,x                   ; $07CBC9 |
  EOR #$0002                                ; $07CBCC |
  STA !s_spr_facing_dir,x                   ; $07CBCF |

CODE_07CBD2:
  RTS                                       ; $07CBD2 |

CODE_07CBD3:
  STZ !s_spr_x_speed_lo,x                   ; $07CBD3 |
  LDA #$0004                                ; $07CBD6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CBD9 |
  TAX                                       ; $07CBDB |
  JSR ($C9F7,x)                             ; $07CBDC |
  RTS                                       ; $07CBDF |

  LDX $12                                   ; $07CBE0 |
  LDA !s_spr_facing_dir,x                   ; $07CBE2 |
  EOR #$0002                                ; $07CBE5 |
  STA !s_spr_facing_dir,x                   ; $07CBE8 |
  LDA #$0007                                ; $07CBEB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CBEE |
  TAY                                       ; $07CBF0 |
  SEP #$20                                  ; $07CBF1 |
  LDA $CB76,y                               ; $07CBF3 |
  STA !s_spr_anim_frame,x                   ; $07CBF6 |
  LDA $CB7E,y                               ; $07CBF9 |
  STA !s_spr_timer_1,x                      ; $07CBFC |
  REP #$20                                  ; $07CBFF |
  LDY !s_spr_facing_dir,x                   ; $07CC01 |
  LDA $CB72,y                               ; $07CC04 |
  STA !s_spr_x_speed_lo,x                   ; $07CC07 |
  RTS                                       ; $07CC0A |

  LDX $12                                   ; $07CC0B |
  LDX $12                                   ; $07CC0D |
  LDA !s_spr_timer_1,x                      ; $07CC0F |
  BNE CODE_07CC37                           ; $07CC12 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CC14 |
  BMI CODE_07CC38                           ; $07CC16 |
  SEP #$20                                  ; $07CC18 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CC1A |
  LDA $CB76,y                               ; $07CC1C |
  STA !s_spr_anim_frame,x                   ; $07CC1F |
  LDA $CB7E,y                               ; $07CC22 |
  STA !s_spr_timer_1,x                      ; $07CC25 |
  REP #$20                                  ; $07CC28 |
  CPY #$03                                  ; $07CC2A |
  BNE CODE_07CC37                           ; $07CC2C |
  LDA !s_spr_facing_dir,x                   ; $07CC2E |
  EOR #$0002                                ; $07CC31 |
  STA !s_spr_facing_dir,x                   ; $07CC34 |

CODE_07CC37:
  RTS                                       ; $07CC37 |

CODE_07CC38:
  STZ !s_spr_x_speed_lo,x                   ; $07CC38 |
  LDA !s_spr_facing_dir,x                   ; $07CC3B |
  EOR #$0002                                ; $07CC3E |
  STA !s_spr_facing_dir,x                   ; $07CC41 |
  LDA #$0004                                ; $07CC44 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CC47 |
  TAX                                       ; $07CC49 |
  JSR ($C9F7,x)                             ; $07CC4A |
  RTS                                       ; $07CC4D |

  db $0C, $0D, $0E, $0D, $0C                ; $07CC4E |
  db $08, $04, $18, $04, $08                ; $07CC53 |

  LDX $12                                   ; $07CC58 |
  LDA #$0004                                ; $07CC5A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CC5D |
  SEP #$20                                  ; $07CC5F |
  TAY                                       ; $07CC61 |
  LDA $CC4E,y                               ; $07CC62 |
  STA !s_spr_anim_frame,x                   ; $07CC65 |
  LDA $CC53,y                               ; $07CC68 |
  STA !s_spr_timer_1,x                      ; $07CC6B |
  REP #$20                                  ; $07CC6E |
  RTS                                       ; $07CC70 |

  LDX $12                                   ; $07CC71 |
  LDA !s_spr_timer_1,x                      ; $07CC73 |
  BNE CODE_07CCA7                           ; $07CC76 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CC78 |
  BMI CODE_07CCA8                           ; $07CC7A |
  SEP #$20                                  ; $07CC7C |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CC7E |
  LDA $CC4E,y                               ; $07CC80 |
  STA !s_spr_anim_frame,x                   ; $07CC83 |
  LDA $CC53,y                               ; $07CC86 |
  STA !s_spr_timer_1,x                      ; $07CC89 |
  REP #$20                                  ; $07CC8C |
  CPY #$02                                  ; $07CC8E |
  BNE CODE_07CCA7                           ; $07CC90 |
  LDA #$FE08                                ; $07CC92 |
  STA !s_spr_y_speed_lo,x                   ; $07CC95 |
  LDA $7860,x                               ; $07CC98 |
  AND #$FFFE                                ; $07CC9B |
  STA $7860,x                               ; $07CC9E |
  LDA #$002A                                ; $07CCA1 |
  STA !s_spr_y_accel,x                      ; $07CCA4 |

CODE_07CCA7:
  RTS                                       ; $07CCA7 |

CODE_07CCA8:
  LDA #$0004                                ; $07CCA8 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CCAB |
  TAX                                       ; $07CCAD |
  JSR ($C9F7,x)                             ; $07CCAE |
  RTS                                       ; $07CCB1 |

  db $03, $03, $03, $07, $03, $03, $03, $07 ; $07CCB2 |

  db $00, $00, $00, $06, $00, $00, $00, $06 ; $07CCBA |

  db $06, $06, $06, $06, $06, $06, $06, $06 ; $07CCC2 |

  LDX $12                                   ; $07CCCA |
  LDA #$0007                                ; $07CCCC |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CCCF |
  SEP #$20                                  ; $07CCD1 |
  TAY                                       ; $07CCD3 |
  LDA $CCB2,y                               ; $07CCD4 |
  STA !s_spr_anim_frame,x                   ; $07CCD7 |
  LDA $CCC2,y                               ; $07CCDA |
  STA !s_spr_timer_1,x                      ; $07CCDD |
  REP #$20                                  ; $07CCE0 |
  RTS                                       ; $07CCE2 |

  LDX $12                                   ; $07CCE3 |
  LDA !s_spr_timer_1,x                      ; $07CCE5 |
  BNE CODE_07CD1D                           ; $07CCE8 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CCEA |
  BMI CODE_07CD1E                           ; $07CCEC |
  SEP #$20                                  ; $07CCEE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CCF0 |
  LDA $CCB2,y                               ; $07CCF2 |
  STA !s_spr_anim_frame,x                   ; $07CCF5 |
  LDA $CCC2,y                               ; $07CCF8 |
  STA !s_spr_timer_1,x                      ; $07CCFB |
  REP #$20                                  ; $07CCFE |
  CPY #$06                                  ; $07CD00 |
  BEQ CODE_07CD08                           ; $07CD02 |
  CPY #$02                                  ; $07CD04 |
  BNE CODE_07CD1D                           ; $07CD06 |

CODE_07CD08:
  LDA #$FE80                                ; $07CD08 |
  STA !s_spr_y_speed_lo,x                   ; $07CD0B |
  LDA $7860,x                               ; $07CD0E |
  AND #$FFFE                                ; $07CD11 |
  STA $7860,x                               ; $07CD14 |
  LDA #$0040                                ; $07CD17 |
  STA !s_spr_y_accel,x                      ; $07CD1A |

CODE_07CD1D:
  RTS                                       ; $07CD1D |

CODE_07CD1E:
  LDA #$0004                                ; $07CD1E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CD21 |
  TAX                                       ; $07CD23 |
  JSR ($C9F7,x)                             ; $07CD24 |
  RTS                                       ; $07CD27 |

  LDX $12                                   ; $07CD28 |
  LDA #$0007                                ; $07CD2A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CD2D |
  SEP #$20                                  ; $07CD2F |
  TAY                                       ; $07CD31 |
  LDA $CCBA,y                               ; $07CD32 |
  STA !s_spr_anim_frame,x                   ; $07CD35 |
  LDA $CCC2,y                               ; $07CD38 |
  STA !s_spr_timer_1,x                      ; $07CD3B |
  REP #$20                                  ; $07CD3E |
  RTS                                       ; $07CD40 |

  LDX $12                                   ; $07CD41 |
  LDA !s_spr_timer_1,x                      ; $07CD43 |
  BNE CODE_07CD7B                           ; $07CD46 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CD48 |
  BMI CODE_07CD7C                           ; $07CD4A |
  SEP #$20                                  ; $07CD4C |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CD4E |
  LDA $CCBA,y                               ; $07CD50 |
  STA !s_spr_anim_frame,x                   ; $07CD53 |
  LDA $CCC2,y                               ; $07CD56 |
  STA !s_spr_timer_1,x                      ; $07CD59 |
  REP #$20                                  ; $07CD5C |
  CPY #$06                                  ; $07CD5E |
  BEQ CODE_07CD66                           ; $07CD60 |
  CPY #$02                                  ; $07CD62 |
  BNE CODE_07CD7B                           ; $07CD64 |

CODE_07CD66:
  LDA #$FE80                                ; $07CD66 |
  STA !s_spr_y_speed_lo,x                   ; $07CD69 |
  LDA $7860,x                               ; $07CD6C |
  AND #$FFFE                                ; $07CD6F |
  STA $7860,x                               ; $07CD72 |
  LDA #$0040                                ; $07CD75 |
  STA !s_spr_y_accel,x                      ; $07CD78 |

CODE_07CD7B:
  RTS                                       ; $07CD7B |

CODE_07CD7C:
  LDA !s_spr_facing_dir,x                   ; $07CD7C |
  EOR #$0002                                ; $07CD7F |
  STA !s_spr_facing_dir,x                   ; $07CD82 |
  LDA #$0004                                ; $07CD85 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CD88 |
  TAX                                       ; $07CD8A |
  JSR ($C9F7,x)                             ; $07CD8B |
  RTS                                       ; $07CD8E |

  db $0F, $10, $10, $0F, $10, $10, $0F, $10 ; $07CD8F |
  db $10, $0F, $10, $10, $0F                ; $07CD97 |

  db $02, $04, $04, $04, $04, $04, $04, $04 ; $07CD9C |
  db $04, $04, $04, $04, $02                ; $07CDA4 |

  LDX $12                                   ; $07CDA9 |
  LDA #$000C                                ; $07CDAB |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CDAE |
  SEP #$20                                  ; $07CDB0 |
  TAY                                       ; $07CDB2 |
  LDA $CD8F,y                               ; $07CDB3 |
  STA !s_spr_anim_frame,x                   ; $07CDB6 |
  LDA $CD9C,y                               ; $07CDB9 |
  STA !s_spr_timer_1,x                      ; $07CDBC |
  REP #$20                                  ; $07CDBF |
  RTS                                       ; $07CDC1 |

  LDX $12                                   ; $07CDC2 |
  LDA !s_spr_timer_1,x                      ; $07CDC4 |
  BNE CODE_07CDF8                           ; $07CDC7 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07CDC9 |
  BMI CODE_07CDF9                           ; $07CDCB |
  SEP #$20                                  ; $07CDCD |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07CDCF |
  LDA $CD8F,y                               ; $07CDD1 |
  STA !s_spr_anim_frame,x                   ; $07CDD4 |
  LDA $CD9C,y                               ; $07CDD7 |
  STA !s_spr_timer_1,x                      ; $07CDDA |
  REP #$20                                  ; $07CDDD |
  CPY #$0A                                  ; $07CDDF |
  BEQ CODE_07CDEF                           ; $07CDE1 |
  CPY #$07                                  ; $07CDE3 |
  BEQ CODE_07CDEF                           ; $07CDE5 |
  CPY #$04                                  ; $07CDE7 |
  BEQ CODE_07CDEF                           ; $07CDE9 |
  CPY #$01                                  ; $07CDEB |
  BNE CODE_07CDF8                           ; $07CDED |

CODE_07CDEF:
  LDA !s_spr_facing_dir,x                   ; $07CDEF |
  EOR #$0002                                ; $07CDF2 |
  STA !s_spr_facing_dir,x                   ; $07CDF5 |

CODE_07CDF8:
  RTS                                       ; $07CDF8 |

CODE_07CDF9:
  LDA #$0004                                ; $07CDF9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07CDFC |
  TAX                                       ; $07CDFE |
  JSR ($C9F7,x)                             ; $07CDFF |
  RTS                                       ; $07CE02 |

  dw $0010, $000F, $000E, $000C             ; $07CE03 |
  dw $000D, $000E, $0010, $000C             ; $07CE0B |
  dw $0005, $0002, $0003, $0006             ; $07CE13 |
  dw $000E, $000E, $000E, $0007             ; $07CE1B |
  dw $0008                                  ; $07CE23 |

  dw $FFE4, $FFE2, $FFE1, $FFE0             ; $07CE25 |
  dw $FFDF, $FFE1, $FFE7, $FFE3             ; $07CE2D |
  dw $FFE2, $FFE3, $FFE4, $FFE3             ; $07CE35 |
  dw $FFE6, $FFE3, $FFDE, $FFE4             ; $07CE3D |
  dw $FFE3                                  ; $07CE45 |

CODE_07CE47:
  LDA !s_spr_anim_frame,x                   ; $07CE47 |
  ASL A                                     ; $07CE4A |
  TAY                                       ; $07CE4B |
  LDA !s_player_hitbox_half_height          ; $07CE4C |
  CLC                                       ; $07CE4F |
  ADC #$0001                                ; $07CE50 |
  STA $00                                   ; $07CE53 |
  LDA $CE25,y                               ; $07CE55 |
  CLC                                       ; $07CE58 |
  ADC !s_spr_y_pixel_pos,x                  ; $07CE59 |
  SEC                                       ; $07CE5C |
  SBC !s_player_center_y                    ; $07CE5D |
  BPL CODE_07CE66                           ; $07CE60 |
  EOR #$FFFF                                ; $07CE62 |
  INC A                                     ; $07CE65 |

CODE_07CE66:
  CMP $00                                   ; $07CE66 |
  BCS CODE_07CE98                           ; $07CE68 |
  LDA !s_player_hitbox_half_width           ; $07CE6A |
  CLC                                       ; $07CE6D |
  ADC #$0001                                ; $07CE6E |
  STA $00                                   ; $07CE71 |
  LDA $CE03,y                               ; $07CE73 |
  LDY !s_spr_facing_dir,x                   ; $07CE76 |
  BEQ CODE_07CE82                           ; $07CE79 |
  EOR #$FFFF                                ; $07CE7B |
  CLC                                       ; $07CE7E |
  ADC #$0009                                ; $07CE7F |

CODE_07CE82:
  CLC                                       ; $07CE82 |
  ADC !s_spr_x_pixel_pos,x                  ; $07CE83 |
  SEC                                       ; $07CE86 |
  SBC !s_player_center_x                    ; $07CE87 |
  BPL CODE_07CE90                           ; $07CE8A |
  EOR #$FFFF                                ; $07CE8C |
  INC A                                     ; $07CE8F |

CODE_07CE90:
  CMP $00                                   ; $07CE90 |
  BCS CODE_07CE98                           ; $07CE92 |
  JSL player_hit_sprite                     ; $07CE94 |

CODE_07CE98:
  RTS                                       ; $07CE98 |

  dw $FF00, $0100                           ; $07CE99 |

init_zeus_guy:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07CE9D |
  STZ !s_spr_wildcard_6_lo,x                ; $07CE9F |
  LDA #$D08D                                ; $07CEA2 |
  STA !s_spr_wildcard_2_lo,x                ; $07CEA5 |
  JSR CODE_07D0A1                           ; $07CEA8 |
  RTL                                       ; $07CEAB |

  dw $0200, $FE00                           ; $07CEAC |

main_zeus_guy:
  LDA !s_spr_state,x                        ; $07CEB0 |
  CMP #$0008                                ; $07CEB3 |
  BNE CODE_07CEF4                           ; $07CEB6 |
  LDA !s_player_mouth_state                 ; $07CEB8 |
  CMP #$0003                                ; $07CEBB |
  BCS CODE_07CED8                           ; $07CEBE |
  LDA !s_spr_x_player_dir,x                 ; $07CEC0 |
  AND #$00FF                                ; $07CEC3 |
  STA !s_spr_facing_dir,x                   ; $07CEC6 |
  TAY                                       ; $07CEC9 |
  LDA $CEAC,y                               ; $07CECA |
  STA !s_spr_x_speed_lo,x                   ; $07CECD |
  LDA #$0001                                ; $07CED0 |
  STA !s_spr_x_accel,x                      ; $07CED3 |
  BRA CODE_07CEE6                           ; $07CED6 |

CODE_07CED8:
  LDA $7860,x                               ; $07CED8 |
  AND #$0001                                ; $07CEDB |
  BEQ CODE_07CEE6                           ; $07CEDE |
  LDA #$FE00                                ; $07CEE0 |
  STA !s_spr_y_speed_lo,x                   ; $07CEE3 |

CODE_07CEE6:
  STZ $6162                                 ; $07CEE6 |
  STZ !s_tongued_sprite_slot                ; $07CEE9 |
  LDA #$0010                                ; $07CEEC |
  STA !s_spr_state,x                        ; $07CEEF |
  PLY                                       ; $07CEF2 |
  PLA                                       ; $07CEF3 |

CODE_07CEF4:
  JSL $03AF23                               ; $07CEF4 |
  LDA !s_spr_x_accel,x                      ; $07CEF8 |
  BEQ CODE_07CF00                           ; $07CEFB |
  JMP CODE_07D80C                           ; $07CEFD |

CODE_07CF00:
  STZ !s_spr_wildcard_1_lo,x                ; $07CF00 |
  LDA !s_spr_oam_yxppccct,x                 ; $07CF03 |
  AND #$FFF1                                ; $07CF06 |
  STA !s_spr_oam_yxppccct,x                 ; $07CF09 |
  TAX                                       ; $07CF0C |
  STA !gsu_r1                               ; $07CF0D |
  LDX #$09                                  ; $07CF10 |
  LDA #$8F33                                ; $07CF12 |
  JSL r_gsu_init_1                          ; $07CF15 | GSU init
  LDX $12                                   ; $07CF19 |
  LDA !gsu_r1                               ; $07CF1B |
  STA !s_spr_gsu_morph_2_lo,x               ; $07CF1E |
  LDA !s_spr_anim_frame,x                   ; $07CF21 |
  CMP #$0000                                ; $07CF24 |
  BNE CODE_07CF32                           ; $07CF27 |
  LDA !s_spr_x_player_dir,x                 ; $07CF29 |
  AND #$00FF                                ; $07CF2C |
  STA !s_spr_facing_dir,x                   ; $07CF2F |

CODE_07CF32:
  JSR CODE_07D4DF                           ; $07CF32 |
  JSR CODE_07D550                           ; $07CF35 |
  JSR CODE_07D5D2                           ; $07CF38 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07CF3B |
  CMP #$0004                                ; $07CF3D |
  BCS CODE_07CF61                           ; $07CF40 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07CF42 |
  BMI CODE_07CF61                           ; $07CF45 |
  JSL $07FC1F                               ; $07CF47 |
  BMI CODE_07CF61                           ; $07CF4B |
  LDA !s_spr_x_hitbox_center,x              ; $07CF4D |
  SEC                                       ; $07CF50 |
  SBC !s_spr_x_hitbox_center,y              ; $07CF51 |
  AND #$8000                                ; $07CF54 |
  ASL A                                     ; $07CF57 |
  ROL A                                     ; $07CF58 |
  ASL A                                     ; $07CF59 |
  STA !s_spr_facing_dir,x                   ; $07CF5A |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07CF5D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07CF5F |

CODE_07CF61:
  LDA $7860,x                               ; $07CF61 |
  BIT #$0001                                ; $07CF64 |
  BEQ CODE_07CF75                           ; $07CF67 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $07CF69 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07CF6C |
  TAX                                       ; $07CF6E |
  JSR ($CF9A,x)                             ; $07CF6F |
  JMP CODE_07D79D                           ; $07CF72 |

CODE_07CF75:
  LDA !s_spr_gsu_morph_1_lo,x               ; $07CF75 |
  BEQ CODE_07CF83                           ; $07CF78 |
  LDY !s_spr_facing_dir,x                   ; $07CF7A |
  LDA $CE99,y                               ; $07CF7D |
  STA !s_spr_x_speed_lo,x                   ; $07CF80 |

CODE_07CF83:
  LDA #$0020                                ; $07CF83 |
  STA !s_spr_anim_frame,x                   ; $07CF86 |
  STZ !s_spr_timer_1,x                      ; $07CF89 |
  LDA #$000C                                ; $07CF8C |
  STA !s_spr_wildcard_6_lo,x                ; $07CF8F |
  LDA #$0002                                ; $07CF92 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07CF95 |
  JMP CODE_07D79D                           ; $07CF97 |

  dw $D00E, $D031, $D05B, $D072             ; $07CF9A |

  dw $D0A1, $D123, $D239, $D2B4             ; $07CFA2 |
  dw $D327, $D39D, $D492                    ; $07CFAA |

  dw $D0D5, $D13E, $D283, $D2FF             ; $07CFB0 |
  dw $D372, $D3C7, $D49F                    ; $07CFB8 |

  dw $0004, $0006, $0008, $000A             ; $07CFBE |
  dw $0004, $0006, $0008, $0004             ; $07CFC6 |
  dw $0006, $0008, $0004, $0006             ; $07CFCE |
  dw $0008, $0004, $0006, $0008             ; $07CFD6 |
  dw $0004, $0006, $0008, $0004             ; $07CFDE |
  dw $0006, $0008, $0004, $0006             ; $07CFE6 |
  dw $0008, $0004, $0006, $0008             ; $07CFEE |
  dw $0004, $0006, $0008, $0004             ; $07CFF6 |
  dw $000A, $000A, $000A, $000A             ; $07CFFE |
  dw $000A, $0004, $0006, $0008             ; $07D006 |

  LDX $12                                   ; $07D00E |
  LDA #$D08D                                ; $07D010 |
  STA !s_spr_wildcard_2_lo,x                ; $07D013 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D016 |
  BEQ CODE_07D02A                           ; $07D018 |
  LDA !s_spr_wildcard_6_lo,x                ; $07D01A |
  AND #$0002                                ; $07D01D |
  EOR #$0002                                ; $07D020 |
  STA !s_spr_wildcard_6_lo,x                ; $07D023 |
  TAX                                       ; $07D026 |
  JMP ($CFA2,x)                             ; $07D027 |

CODE_07D02A:
  LDA !s_spr_wildcard_6_lo,x                ; $07D02A |
  TAX                                       ; $07D02D |
  JMP ($CFB0,x)                             ; $07D02E |
  LDX $12                                   ; $07D031 |
  LDA #$D091                                ; $07D033 |
  STA !s_spr_wildcard_2_lo,x                ; $07D036 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D039 |
  BEQ CODE_07D02A                           ; $07D03B |
  LDA $10                                   ; $07D03D |
  AND #$0007                                ; $07D03F |
  BEQ CODE_07D049                           ; $07D042 |
  LDA #$0000                                ; $07D044 |
  BRA CODE_07D054                           ; $07D047 |

CODE_07D049:
  LDA $10                                   ; $07D049 |
  AND #$0038                                ; $07D04B |
  LSR A                                     ; $07D04E |
  LSR A                                     ; $07D04F |
  TAY                                       ; $07D050 |
  LDA $CFFE,y                               ; $07D051 |

CODE_07D054:
  STA !s_spr_wildcard_6_lo,x                ; $07D054 |
  TAX                                       ; $07D057 |
  JMP ($CFA2,x)                             ; $07D058 |
  LDX $12                                   ; $07D05B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D05D |
  BEQ CODE_07D02A                           ; $07D05F |
  LDA $10                                   ; $07D061 |
  AND #$000F                                ; $07D063 |
  ASL A                                     ; $07D066 |
  TAY                                       ; $07D067 |
  LDA $CFBE,y                               ; $07D068 |
  STA !s_spr_wildcard_6_lo,x                ; $07D06B |
  TAX                                       ; $07D06E |
  JMP ($CFA2,x)                             ; $07D06F |
  LDX $12                                   ; $07D072 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D074 |
  BEQ CODE_07D02A                           ; $07D076 |
  LDA $10                                   ; $07D078 |
  AND #$000F                                ; $07D07A |
  ASL A                                     ; $07D07D |
  TAY                                       ; $07D07E |
  LDA $CFDE,y                               ; $07D07F |
  STA !s_spr_wildcard_6_lo,x                ; $07D082 |
  TAX                                       ; $07D085 |
  JMP ($CFA2,x)                             ; $07D086 |

  db $00, $1F, $1E, $1D, $20, $02           ; $07D089 |
  db $02, $02, $08, $02, $02, $02           ; $07D08F |

  dw $0008, $0004                           ; $07D095 |

  dw $FFFC, $0004                           ; $07D099 |

  dw $FFFE, $0002                           ; $07D09D |

CODE_07D0A1:
  LDX $12                                   ; $07D0A1 |
  LDA !s_spr_wildcard_2_lo,x                ; $07D0A3 |
  STA $00                                   ; $07D0A6 |
  LDA #$0003                                ; $07D0A8 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D0AB |
  SEP #$20                                  ; $07D0AD |
  TAY                                       ; $07D0AF |
  LDA $D089,y                               ; $07D0B0 |
  STA !s_spr_anim_frame,x                   ; $07D0B3 |
  LDA ($00),y                               ; $07D0B6 |
  STA !s_spr_timer_1,x                      ; $07D0B8 |
  REP #$20                                  ; $07D0BB |
  LDY !s_spr_facing_dir,x                   ; $07D0BD |
  LDA $7860,x                               ; $07D0C0 |
  AND $D095,y                               ; $07D0C3 |
  BNE CODE_07D0D2                           ; $07D0C6 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D0C8 |
  CLC                                       ; $07D0CB |
  ADC $D099,y                               ; $07D0CC |
  STA !s_spr_x_pixel_pos,x                  ; $07D0CF |

CODE_07D0D2:
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D0D2 |
  RTS                                       ; $07D0D4 |

  LDX $12                                   ; $07D0D5 |
  LDA !s_spr_timer_1,x                      ; $07D0D7 |
  BNE CODE_07D10F                           ; $07D0DA |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D0DC |
  BMI CODE_07D110                           ; $07D0DE |
  LDA !s_spr_wildcard_2_lo,x                ; $07D0E0 |
  STA $00                                   ; $07D0E3 |
  SEP #$20                                  ; $07D0E5 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D0E7 |
  LDA $D089,y                               ; $07D0E9 |
  STA !s_spr_anim_frame,x                   ; $07D0EC |
  LDA ($00),y                               ; $07D0EF |
  STA !s_spr_timer_1,x                      ; $07D0F1 |
  REP #$20                                  ; $07D0F4 |
  CPY #$02                                  ; $07D0F6 |
  BNE CODE_07D10F                           ; $07D0F8 |
  LDY !s_spr_facing_dir,x                   ; $07D0FA |
  LDA $7860,x                               ; $07D0FD |
  AND $D095,y                               ; $07D100 |
  BNE CODE_07D10F                           ; $07D103 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D105 |
  CLC                                       ; $07D108 |
  ADC $D09D,y                               ; $07D109 |
  STA !s_spr_x_pixel_pos,x                  ; $07D10C |

CODE_07D10F:
  RTS                                       ; $07D10F |

CODE_07D110:
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D110 |
  RTS                                       ; $07D112 |

  db $00, $1D, $1E, $1F                     ; $07D113 |

  dw $0002, $FFFE                           ; $07D117 |

  dw $0004, $FFFC                           ; $07D11B |

  dw $0004, $0008                           ; $07D11F |

  LDX $12                                   ; $07D123 |
  LDA #$0003                                ; $07D125 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D128 |
  SEP #$20                                  ; $07D12A |
  TAY                                       ; $07D12C |
  LDA $D113,y                               ; $07D12D |
  STA !s_spr_anim_frame,x                   ; $07D130 |
  LDA $D08D,y                               ; $07D133 |
  STA !s_spr_timer_1,x                      ; $07D136 |
  REP #$20                                  ; $07D139 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D13B |
  RTS                                       ; $07D13D |

  LDX $12                                   ; $07D13E |
  LDA !s_spr_timer_1,x                      ; $07D140 |
  BNE CODE_07D18F                           ; $07D143 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D145 |
  BMI CODE_07D190                           ; $07D147 |
  SEP #$20                                  ; $07D149 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D14B |
  LDA $D113,y                               ; $07D14D |
  STA !s_spr_anim_frame,x                   ; $07D150 |
  LDA $D08D,y                               ; $07D153 |
  STA !s_spr_timer_1,x                      ; $07D156 |
  REP #$20                                  ; $07D159 |
  CPY #$01                                  ; $07D15B |
  BNE CODE_07D176                           ; $07D15D |
  LDY !s_spr_facing_dir,x                   ; $07D15F |
  LDA $7860,x                               ; $07D162 |
  AND $D11F,y                               ; $07D165 |
  BNE CODE_07D18F                           ; $07D168 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D16A |
  CLC                                       ; $07D16D |
  ADC $D117,y                               ; $07D16E |
  STA !s_spr_x_pixel_pos,x                  ; $07D171 |
  BRA CODE_07D18F                           ; $07D174 |

CODE_07D176:
  CPY #$00                                  ; $07D176 |
  BNE CODE_07D18F                           ; $07D178 |
  LDY !s_spr_facing_dir,x                   ; $07D17A |
  LDA $7860,x                               ; $07D17D |
  AND $D11F,y                               ; $07D180 |
  BNE CODE_07D18F                           ; $07D183 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D185 |
  CLC                                       ; $07D188 |
  ADC $D11B,y                               ; $07D189 |
  STA !s_spr_x_pixel_pos,x                  ; $07D18C |

CODE_07D18F:
  RTS                                       ; $07D18F |

CODE_07D190:
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D190 |
  RTS                                       ; $07D192 |

  db $01, $02, $03, $02, $01, $00           ; $07D193 |

  db $02, $01, $08, $01, $02, $08           ; $07D199 |

  dw $FFFE, $FFFF                           ; $07D19F |

  dw $0504, $0706, $0908                    ; $07D1A3 |
  dw $0708, $0506, $0004                    ; $07D1A9 |

  dw $0202, $0202, $0101                    ; $07D1AF |
  dw $0201, $0202, $0802                    ; $07D1B5 |

  dw $FFFD, $FFFE, $FFFF                    ; $07D1BB |

  db $17, $16, $15, $14, $13, $12, $11, $10 ; $07D1C1 |
  db $0F, $0E, $0D, $0C, $0B, $0A, $00      ; $07D1C9 |

  db $02, $02, $02, $02, $02, $02, $02, $02 ; $07D1D0 |
  db $02, $02, $02, $02, $02, $02, $08      ; $07D1D8 |

  dw $FFFA, $FFFB, $FFFC                    ; $07D1DF |
  dw $FFFD, $FFFE, $FFFF                    ; $07D1E5 |

  db $1C, $18, $19, $1A, $19, $18, $00      ; $07D1EB |

  db $12, $01, $02, $30, $02, $02, $08      ; $07D1F2 |

  dw $FFF0, $0010                           ; $07D1F9 |

  dw $0000, $0002, $0004, $0008             ; $07D1FD |

  dw $0008, $FFF8                           ; $07D205 |

  dw $0001, $0000, $0001, $0000             ; $07D209 |
  dw $0003, $0002, $0003, $0002             ; $07D211 |
  dw $0005, $0004, $0005, $0004             ; $07D219 |
  dw $0007, $0006, $0007, $0006             ; $07D221 |
  dw $0009, $0008, $0009, $0008             ; $07D229 |
  dw $000B, $000A, $000B, $000A             ; $07D231 |

  LDX $12                                   ; $07D239 |
  JSR CODE_07D61E                           ; $07D23B |
  LDA #$0005                                ; $07D23E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D241 |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07D243 |
  BMI CODE_07D267                           ; $07D246 |
  LDA !s_spr_x_hitbox_center,x              ; $07D248 |
  SEC                                       ; $07D24B |
  SBC !s_spr_x_hitbox_center,y              ; $07D24C |
  BPL CODE_07D255                           ; $07D24F |
  EOR #$FFFF                                ; $07D251 |
  INC A                                     ; $07D254 |

CODE_07D255:
  LSR A                                     ; $07D255 |
  LSR A                                     ; $07D256 |
  LSR A                                     ; $07D257 |
  CMP #$0002                                ; $07D258 |
  BCS CODE_07D267                           ; $07D25B |
  ASL A                                     ; $07D25D |
  TAY                                       ; $07D25E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07D25F |
  CLC                                       ; $07D261 |
  ADC $D19F,y                               ; $07D262 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D265 |

CODE_07D267:
  SEP #$20                                  ; $07D267 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D269 |
  LDA $D193,y                               ; $07D26B |
  STA !s_spr_anim_frame,x                   ; $07D26E |
  LDA $D199,y                               ; $07D271 |
  STA !s_spr_timer_1,x                      ; $07D274 |
  REP #$20                                  ; $07D277 |
  LDA #$003C                                ; $07D279 |\ play sound #$003C
  JSL push_sound_queue                      ; $07D27C |/
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D280 |
  RTS                                       ; $07D282 |

  LDX $12                                   ; $07D283 |
  JSR CODE_07D61E                           ; $07D285 |
  LDA !s_spr_timer_1,x                      ; $07D288 |
  BNE CODE_07D2AA                           ; $07D28B |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D28D |
  BMI CODE_07D2AB                           ; $07D28F |
  SEP #$20                                  ; $07D291 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D293 |
  LDA $D193,y                               ; $07D295 |
  STA !s_spr_anim_frame,x                   ; $07D298 |
  LDA $D199,y                               ; $07D29B |
  STA !s_spr_timer_1,x                      ; $07D29E |
  REP #$20                                  ; $07D2A1 |
  CPY #$02                                  ; $07D2A3 |
  BNE CODE_07D2AA                           ; $07D2A5 |
  JSR CODE_07D701                           ; $07D2A7 |

CODE_07D2AA:
  RTS                                       ; $07D2AA |

CODE_07D2AB:
  LDA #$0000                                ; $07D2AB |
  STA !s_spr_anim_frame,x                   ; $07D2AE |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D2B1 |
  RTS                                       ; $07D2B3 |

  LDX $12                                   ; $07D2B4 |
  JSR CODE_07D61E                           ; $07D2B6 |
  LDA #$000B                                ; $07D2B9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D2BC |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07D2BE |
  BMI CODE_07D2E3                           ; $07D2C1 |
  LDA !s_spr_x_hitbox_center,x              ; $07D2C3 |
  SEC                                       ; $07D2C6 |
  SBC !s_spr_x_hitbox_center,y              ; $07D2C7 |
  BPL CODE_07D2D0                           ; $07D2CA |
  EOR #$FFFF                                ; $07D2CC |
  INC A                                     ; $07D2CF |

CODE_07D2D0:
  LSR A                                     ; $07D2D0 |
  LSR A                                     ; $07D2D1 |
  LSR A                                     ; $07D2D2 |
  LSR A                                     ; $07D2D3 |
  CMP #$0003                                ; $07D2D4 |
  BCS CODE_07D2E3                           ; $07D2D7 |
  ASL A                                     ; $07D2D9 |
  TAY                                       ; $07D2DA |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07D2DB |
  CLC                                       ; $07D2DD |
  ADC $D1BB,y                               ; $07D2DE |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D2E1 |

CODE_07D2E3:
  SEP #$20                                  ; $07D2E3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D2E5 |
  LDA $D1A3,y                               ; $07D2E7 |
  STA !s_spr_anim_frame,x                   ; $07D2EA |
  LDA $D1AF,y                               ; $07D2ED |
  STA !s_spr_timer_1,x                      ; $07D2F0 |
  REP #$20                                  ; $07D2F3 |
  LDA #$003C                                ; $07D2F5 |\ play sound #$003C
  JSL push_sound_queue                      ; $07D2F8 |/
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D2FC |
  RTS                                       ; $07D2FE |

  LDX $12                                   ; $07D2FF |
  JSR CODE_07D61E                           ; $07D301 |
  LDA !s_spr_timer_1,x                      ; $07D304 |
  BNE CODE_07D326                           ; $07D307 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D309 |
  BMI CODE_07D2AB                           ; $07D30B |
  SEP #$20                                  ; $07D30D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D30F |
  LDA $D1A3,y                               ; $07D311 |
  STA !s_spr_anim_frame,x                   ; $07D314 |
  LDA $D1AF,y                               ; $07D317 |
  STA !s_spr_timer_1,x                      ; $07D31A |
  REP #$20                                  ; $07D31D |
  CPY #$05                                  ; $07D31F |
  BNE CODE_07D326                           ; $07D321 |
  JSR CODE_07D701                           ; $07D323 |

CODE_07D326:
  RTS                                       ; $07D326 |

  LDX $12                                   ; $07D327 |
  JSR CODE_07D61E                           ; $07D329 |
  LDA #$000E                                ; $07D32C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D32F |
  LDY !s_spr_gsu_morph_2_lo,x               ; $07D331 |
  BMI CODE_07D356                           ; $07D334 |
  LDA !s_spr_x_hitbox_center,x              ; $07D336 |
  SEC                                       ; $07D339 |
  SBC !s_spr_x_hitbox_center,y              ; $07D33A |
  BPL CODE_07D343                           ; $07D33D |
  EOR #$FFFF                                ; $07D33F |
  INC A                                     ; $07D342 |

CODE_07D343:
  LSR A                                     ; $07D343 |
  LSR A                                     ; $07D344 |
  LSR A                                     ; $07D345 |
  LSR A                                     ; $07D346 |
  CMP #$0006                                ; $07D347 |
  BCS CODE_07D356                           ; $07D34A |
  ASL A                                     ; $07D34C |
  TAY                                       ; $07D34D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07D34E |
  CLC                                       ; $07D350 |
  ADC $D1DF,y                               ; $07D351 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D354 |

CODE_07D356:
  SEP #$20                                  ; $07D356 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D358 |
  LDA $D1C1,y                               ; $07D35A |
  STA !s_spr_anim_frame,x                   ; $07D35D |
  LDA $D1D0,y                               ; $07D360 |
  STA !s_spr_timer_1,x                      ; $07D363 |
  REP #$20                                  ; $07D366 |
  LDA #$003C                                ; $07D368 |\ play sound #$003C
  JSL push_sound_queue                      ; $07D36B |/
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D36F |
  RTS                                       ; $07D371 |

  LDX $12                                   ; $07D372 |
  JSR CODE_07D61E                           ; $07D374 |
  LDA !s_spr_timer_1,x                      ; $07D377 |
  BNE CODE_07D399                           ; $07D37A |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D37C |
  BMI CODE_07D39A                           ; $07D37E |
  SEP #$20                                  ; $07D380 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D382 |
  LDA $D1C1,y                               ; $07D384 |
  STA !s_spr_anim_frame,x                   ; $07D387 |
  LDA $D1D0,y                               ; $07D38A |
  STA !s_spr_timer_1,x                      ; $07D38D |
  REP #$20                                  ; $07D390 |
  CPY #$05                                  ; $07D392 |
  BNE CODE_07D399                           ; $07D394 |
  JSR CODE_07D701                           ; $07D396 |

CODE_07D399:
  RTS                                       ; $07D399 |

CODE_07D39A:
  JMP CODE_07D2AB                           ; $07D39A |
  LDX $12                                   ; $07D39D |
  LDA #$0006                                ; $07D39F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D3A2 |
  STZ !s_spr_x_speed_lo,x                   ; $07D3A4 |
  SEP #$20                                  ; $07D3A7 |
  TAY                                       ; $07D3A9 |
  LDA $D1EB,y                               ; $07D3AA |
  STA !s_spr_anim_frame,x                   ; $07D3AD |
  LDA $D1F2,y                               ; $07D3B0 |
  STA !s_spr_timer_1,x                      ; $07D3B3 |
  LDA #$2E                                  ; $07D3B6 |
  STA $77C0,x                               ; $07D3B8 |
  REP #$20                                  ; $07D3BB |
  LDA #$003C                                ; $07D3BD |\ play sound #$003C
  JSL push_sound_queue                      ; $07D3C0 |/
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D3C4 |
  RTS                                       ; $07D3C6 |

  LDX $12                                   ; $07D3C7 |
  STZ !s_spr_x_speed_lo,x                   ; $07D3C9 |
  LDA !s_spr_anim_frame,x                   ; $07D3CC |
  CMP #$001A                                ; $07D3CF |
  BNE CODE_07D43A                           ; $07D3D2 |
  LDA !s_spr_timer_2,x                      ; $07D3D4 |
  BNE CODE_07D41F                           ; $07D3D7 |
  LDY !s_spr_facing_dir,x                   ; $07D3D9 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D3DC |
  CLC                                       ; $07D3DF |
  ADC $D205,y                               ; $07D3E0 |
  STA $00                                   ; $07D3E3 |
  LDY $77C0,x                               ; $07D3E5 |
  LDA $D209,y                               ; $07D3E8 |
  STA $02                                   ; $07D3EB |
  DEY                                       ; $07D3ED |
  DEY                                       ; $07D3EE |
  BPL CODE_07D3F3                           ; $07D3EF |
  LDY #$02                                  ; $07D3F1 |

CODE_07D3F3:
  SEP #$20                                  ; $07D3F3 |
  TYA                                       ; $07D3F5 |
  STA $77C0,x                               ; $07D3F6 |
  REP #$20                                  ; $07D3F9 |
  LDA #$0228                                ; $07D3FB |
  JSL spawn_ambient_sprite                  ; $07D3FE |
  LDA $00                                   ; $07D402 |
  STA $70A2,y                               ; $07D404 |
  LDA !s_spr_y_pixel_pos,x                  ; $07D407 |
  CLC                                       ; $07D40A |
  ADC #$0008                                ; $07D40B |
  STA $7142,y                               ; $07D40E |
  LDA $02                                   ; $07D411 |
  STA $73C2,y                               ; $07D413 |
  LDA #$0002                                ; $07D416 |
  STA $7782,y                               ; $07D419 |
  STA !s_spr_timer_2,x                      ; $07D41C |

CODE_07D41F:
  LDA $14                                   ; $07D41F |
  AND #$0003                                ; $07D421 |
  ASL A                                     ; $07D424 |
  TAY                                       ; $07D425 |
  LDA !s_spr_oam_yxppccct,x                 ; $07D426 |
  ORA $D1FD,y                               ; $07D429 |
  STA !s_spr_oam_yxppccct,x                 ; $07D42C |
  CPY #$00                                  ; $07D42F |
  BNE CODE_07D43A                           ; $07D431 |
  LDA #$000E                                ; $07D433 |\ play sound #$000E
  JSL push_sound_queue                      ; $07D436 |/

CODE_07D43A:
  LDA !s_spr_timer_1,x                      ; $07D43A |
  BNE CODE_07D487                           ; $07D43D |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D43F |
  BPL CODE_07D446                           ; $07D441 |
  JMP CODE_07D2AB                           ; $07D443 |

CODE_07D446:
  SEP #$20                                  ; $07D446 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D448 |
  LDA $D1EB,y                               ; $07D44A |
  STA !s_spr_anim_frame,x                   ; $07D44D |
  LDA $D1F2,y                               ; $07D450 |
  STA !s_spr_timer_1,x                      ; $07D453 |
  REP #$20                                  ; $07D456 |
  CPY #$00                                  ; $07D458 |
  BNE CODE_07D487                           ; $07D45A |
  LDY !s_spr_facing_dir,x                   ; $07D45C |
  LDA !s_spr_x_pixel_pos,x                  ; $07D45F |
  CLC                                       ; $07D462 |
  ADC $D1F9,y                               ; $07D463 |
  STA $00                                   ; $07D466 |
  LDA #$00FE                                ; $07D468 |
  JSL spawn_sprite_active                   ; $07D46B |
  BCC CODE_07D487                           ; $07D46F |
  LDA !s_spr_facing_dir,x                   ; $07D471 |
  STA !s_spr_facing_dir,y                   ; $07D474 |
  LDA $00                                   ; $07D477 |
  STA !s_spr_x_pixel_pos,y                  ; $07D479 |
  LDA !s_spr_y_pixel_pos,x                  ; $07D47C |
  STA !s_spr_y_pixel_pos,y                  ; $07D47F |
  TYX                                       ; $07D482 |
  JSL $07D8D4                               ; $07D483 |

CODE_07D487:
  LDX $12                                   ; $07D487 |
  RTS                                       ; $07D489 |

  db $00, $21, $20, $21                     ; $07D48A |

  db $04, $04, $00, $20                     ; $07D48E |

CODE_07D492:
  LDX $12                                   ; $07D492 |
  STZ !s_spr_x_speed_lo,x                   ; $07D494 |
  LDA #$0003                                ; $07D497 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D49A |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $07D49C |
  RTS                                       ; $07D49E |

  LDX $12                                   ; $07D49F |
  LDA $7860,x                               ; $07D4A1 |
  BIT #$0001                                ; $07D4A4 |
  BEQ CODE_07D4D1                           ; $07D4A7 |
  LDA !s_spr_timer_1,x                      ; $07D4A9 |
  BNE CODE_07D4D1                           ; $07D4AC |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D4AE |
  BMI CODE_07D4D2                           ; $07D4B0 |
  SEP #$20                                  ; $07D4B2 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D4B4 |
  LDA $D48A,y                               ; $07D4B6 |
  STA !s_spr_anim_frame,x                   ; $07D4B9 |
  LDA $D48E,y                               ; $07D4BC |
  STA !s_spr_timer_1,x                      ; $07D4BF |
  REP #$20                                  ; $07D4C2 |
  CPY #$02                                  ; $07D4C4 |
  BNE CODE_07D4D1                           ; $07D4C6 |
  LDA #$FA80                                ; $07D4C8 |
  STA !s_spr_y_speed_lo,x                   ; $07D4CB |
  INC !s_spr_gsu_morph_1_lo,x               ; $07D4CE |

CODE_07D4D1:
  RTS                                       ; $07D4D1 |

CODE_07D4D2:
  STZ !s_spr_x_speed_lo,x                   ; $07D4D2 |
  STZ !s_spr_wildcard_6_lo,x                ; $07D4D5 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D4D8 |
  RTS                                       ; $07D4DA |

  dw $FFE0, $0020                           ; $07D4DB |

CODE_07D4DF:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07D4DF |
  STZ !s_spr_x_speed_lo,x                   ; $07D4E1 |
  LDA #$0080                                ; $07D4E4 |
  STA $00                                   ; $07D4E7 |
  STA $04                                   ; $07D4E9 |
  ASL A                                     ; $07D4EB |
  STA $02                                   ; $07D4EC |
  STA $06                                   ; $07D4EE |
  JSL $07FCFB                               ; $07D4F0 |
  BCS CODE_07D547                           ; $07D4F4 |
  LDA #$0002                                ; $07D4F6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07D4F9 |
  LDA #$0020                                ; $07D4FB |
  STA $00                                   ; $07D4FE |
  ASL A                                     ; $07D500 |
  STA $02                                   ; $07D501 |
  LDA #$0010                                ; $07D503 |
  STA $04                                   ; $07D506 |
  ASL A                                     ; $07D508 |
  STA $06                                   ; $07D509 |
  JSL $07FCFB                               ; $07D50B |
  BCS CODE_07D547                           ; $07D50F |
  LDY !s_spr_facing_dir,x                   ; $07D511 |
  LDA $D4DB,y                               ; $07D514 |
  STA !s_spr_x_speed_lo,x                   ; $07D517 |
  LDA #$0010                                ; $07D51A |
  STA $00                                   ; $07D51D |
  ASL A                                     ; $07D51F |
  STA $02                                   ; $07D520 |
  LDA #$0010                                ; $07D522 |
  STA $04                                   ; $07D525 |
  ASL A                                     ; $07D527 |
  STA $06                                   ; $07D528 |
  JSL $07FCFB                               ; $07D52A |
  BCS CODE_07D533                           ; $07D52E |
  STZ !s_spr_x_speed_lo,x                   ; $07D530 |

CODE_07D533:
  LDA #$0004                                ; $07D533 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07D536 |
  LDA !s_spr_wildcard_6_lo,x                ; $07D538 |
  CMP #$0000                                ; $07D53B |
  BEQ CODE_07D545                           ; $07D53E |
  CMP #$0002                                ; $07D540 |
  BNE CODE_07D547                           ; $07D543 |

CODE_07D545:
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D545 |

CODE_07D547:
  RTS                                       ; $07D547 |

  dw $0008, $0004                           ; $07D548 |

  dw $FFEC, $0014                           ; $07D54C |

CODE_07D550:
  LDY !s_spr_facing_dir,x                   ; $07D550 |
  LDA !s_spr_x_hitbox_center,x              ; $07D553 |
  CLC                                       ; $07D556 |
  ADC $D54C,y                               ; $07D557 |
  STA $00                                   ; $07D55A |
  STA !gsu_r8                               ; $07D55C |
  LDA !s_spr_y_hitbox_center,x              ; $07D55F |
  STA !gsu_r0                               ; $07D562 |
  LDX #$0A                                  ; $07D565 |
  LDA #$CE2F                                ; $07D567 |
  JSL r_gsu_init_3                          ; $07D56A | GSU init
  LDX $12                                   ; $07D56E |
  LDA !gsu_r7                               ; $07D570 |
  AND #$F800                                ; $07D573 |
  CMP #$4000                                ; $07D576 |
  BEQ CODE_07D5A0                           ; $07D579 |
  LDA $00                                   ; $07D57B |
  STA !gsu_r8                               ; $07D57D |
  LDA !s_spr_y_hitbox_center,x              ; $07D580 |
  SEC                                       ; $07D583 |
  SBC #$0008                                ; $07D584 |
  STA !gsu_r0                               ; $07D587 |
  LDX #$0A                                  ; $07D58A |
  LDA #$CE2F                                ; $07D58C |
  JSL r_gsu_init_3                          ; $07D58F | GSU init
  LDX $12                                   ; $07D593 |
  LDA !gsu_r7                               ; $07D595 |
  AND #$F800                                ; $07D598 |
  CMP #$4000                                ; $07D59B |
  BNE CODE_07D5B5                           ; $07D59E |

CODE_07D5A0:
  LDA #$0006                                ; $07D5A0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07D5A3 |
  LDA !s_spr_wildcard_6_lo,x                ; $07D5A5 |
  CMP #$0000                                ; $07D5A8 |
  BEQ CODE_07D5B2                           ; $07D5AB |
  CMP #$0002                                ; $07D5AD |
  BNE CODE_07D5B4                           ; $07D5B0 |

CODE_07D5B2:
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D5B2 |

CODE_07D5B4:
  RTS                                       ; $07D5B4 |

CODE_07D5B5:
  LDA !s_spr_wildcard_6_lo,x                ; $07D5B5 |
  CMP #$000C                                ; $07D5B8 |
  BEQ CODE_07D5D1                           ; $07D5BB |
  LDY !s_spr_facing_dir,x                   ; $07D5BD |
  LDA $7860,x                               ; $07D5C0 |
  AND $D548,y                               ; $07D5C3 |
  BEQ CODE_07D5D1                           ; $07D5C6 |
  LDA #$000C                                ; $07D5C8 |
  STA !s_spr_wildcard_6_lo,x                ; $07D5CB |
  JSR CODE_07D492                           ; $07D5CE |

CODE_07D5D1:
  RTS                                       ; $07D5D1 |

CODE_07D5D2:
  LDY !s_spr_gsu_morph_2_lo,x               ; $07D5D2 |
  BMI CODE_07D619                           ; $07D5D5 |
  LDA !s_spr_x_hitbox_center,x              ; $07D5D7 |
  SEC                                       ; $07D5DA |
  SBC !s_spr_x_hitbox_center,y              ; $07D5DB |
  STA $00                                   ; $07D5DE |
  CLC                                       ; $07D5E0 |
  ADC #$0060                                ; $07D5E1 |
  CMP #$00C0                                ; $07D5E4 |
  BCS CODE_07D619                           ; $07D5E7 |
  LDA $00                                   ; $07D5E9 |
  BPL CODE_07D5F1                           ; $07D5EB |
  EOR #$FFFF                                ; $07D5ED |
  INC A                                     ; $07D5F0 |

CODE_07D5F1:
  ASL A                                     ; $07D5F1 |
  STA $00                                   ; $07D5F2 |
  ASL A                                     ; $07D5F4 |
  STA $02                                   ; $07D5F5 |
  LDA !s_spr_y_hitbox_center,x              ; $07D5F7 |
  SEC                                       ; $07D5FA |
  SBC !s_spr_y_hitbox_center,y              ; $07D5FB |
  CLC                                       ; $07D5FE |
  ADC $00                                   ; $07D5FF |
  CMP $02                                   ; $07D601 |
  BCS CODE_07D619                           ; $07D603 |
  LDA #$0006                                ; $07D605 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07D608 |
  LDA !s_spr_wildcard_6_lo,x                ; $07D60A |
  CMP #$0000                                ; $07D60D |
  BEQ CODE_07D617                           ; $07D610 |
  CMP #$0002                                ; $07D612 |
  BNE CODE_07D619                           ; $07D615 |

CODE_07D617:
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D617 |

CODE_07D619:
  RTS                                       ; $07D619 |

  dw $FFF0, $0010                           ; $07D61A |

CODE_07D61E:
  LDA !s_spr_facing_dir,x                   ; $07D61E |
  DEC A                                     ; $07D621 |
  STA $00                                   ; $07D622 |
  LDY !s_spr_collision_id,x                 ; $07D624 |
  BMI CODE_07D64F                           ; $07D627 |
  DEY                                       ; $07D629 |
  BEQ CODE_07D64F                           ; $07D62A |
  BMI CODE_07D64F                           ; $07D62C |
  LDA !s_spr_state,y                        ; $07D62E |
  CMP #$0010                                ; $07D631 |
  BNE CODE_07D64F                           ; $07D634 |
  LDA !s_spr_collision_state,y              ; $07D636 |
  BEQ CODE_07D64F                           ; $07D639 |
  LDA !s_spr_facing_dir,x                   ; $07D63B |
  DEC A                                     ; $07D63E |
  STA $02                                   ; $07D63F |
  LDA !s_spr_x_hitbox_center,x              ; $07D641 |
  SEC                                       ; $07D644 |
  SBC !s_spr_x_hitbox_center,y              ; $07D645 |
  EOR $02                                   ; $07D648 |
  BMI CODE_07D64F                           ; $07D64A |
  JMP CODE_07D6A2                           ; $07D64C |

CODE_07D64F:
  LDY !s_spr_gsu_morph_2_lo,x               ; $07D64F |
  BMI CODE_07D6A2                           ; $07D652 |
  LDA !s_spr_hitbox_height,x                ; $07D654 |
  CLC                                       ; $07D657 |
  ADC #$0008                                ; $07D658 |
  CLC                                       ; $07D65B |
  ADC !s_spr_hitbox_height,y                ; $07D65C |
  STA $04                                   ; $07D65F |
  ASL A                                     ; $07D661 |
  STA $02                                   ; $07D662 |
  LDA !s_spr_y_hitbox_center,x              ; $07D664 |
  SEC                                       ; $07D667 |
  SBC !s_spr_y_hitbox_center,y              ; $07D668 |
  CLC                                       ; $07D66B |
  ADC $04                                   ; $07D66C |
  CMP $02                                   ; $07D66E |
  BCS CODE_07D6A2                           ; $07D670 |
  LDA !s_spr_x_hitbox_center,x              ; $07D672 |
  SEC                                       ; $07D675 |
  SBC !s_spr_x_hitbox_center,y              ; $07D676 |
  STA $02                                   ; $07D679 |
  EOR $00                                   ; $07D67B |
  BPL CODE_07D6A2                           ; $07D67D |
  LDA !s_spr_hitbox_width,x                 ; $07D67F |
  CLC                                       ; $07D682 |
  ADC #$0008                                ; $07D683 |
  CLC                                       ; $07D686 |
  ADC !s_spr_hitbox_width,y                 ; $07D687 |
  STA $04                                   ; $07D68A |
  LDA $02                                   ; $07D68C |
  BPL CODE_07D694                           ; $07D68E |
  EOR #$FFFF                                ; $07D690 |
  INC A                                     ; $07D693 |

CODE_07D694:
  CMP $04                                   ; $07D694 |
  BCS CODE_07D6A2                           ; $07D696 |
  TYX                                       ; $07D698 |
  JSL $03B24B                               ; $07D699 |
  INC !s_spr_wildcard_1_lo,x                ; $07D69D |
  LDX $12                                   ; $07D6A0 |

CODE_07D6A2:
  LDA !s_spr_hitbox_height,x                ; $07D6A2 |
  CLC                                       ; $07D6A5 |
  ADC !s_player_hitbox_half_height          ; $07D6A6 |
  STA $02                                   ; $07D6A9 |
  ASL A                                     ; $07D6AB |
  STA $04                                   ; $07D6AC |
  LDA !s_spr_y_hitbox_center,x              ; $07D6AE |
  SEC                                       ; $07D6B1 |
  SBC !s_player_center_y                    ; $07D6B2 |
  CLC                                       ; $07D6B5 |
  ADC $02                                   ; $07D6B6 |
  CMP $7964                                 ; $07D6B8 |
  BCS CODE_07D700                           ; $07D6BB |
  LDA !s_spr_x_hitbox_center,x              ; $07D6BD |
  SEC                                       ; $07D6C0 |
  SBC !s_player_center_x                    ; $07D6C1 |
  STA $02                                   ; $07D6C4 |
  EOR $00                                   ; $07D6C6 |
  BPL CODE_07D700                           ; $07D6C8 |
  LDA !s_spr_hitbox_width,x                 ; $07D6CA |
  CLC                                       ; $07D6CD |
  ADC #$0008                                ; $07D6CE |
  CLC                                       ; $07D6D1 |
  ADC !s_player_hitbox_half_width           ; $07D6D2 |
  STA $04                                   ; $07D6D5 |
  LDA $02                                   ; $07D6D7 |
  BPL CODE_07D6DF                           ; $07D6D9 |
  EOR #$FFFF                                ; $07D6DB |
  INC A                                     ; $07D6DE |

CODE_07D6DF:
  CMP $04                                   ; $07D6DF |
  BCS CODE_07D700                           ; $07D6E1 |
  LDA !s_player_invincibility_timer         ; $07D6E3 |
  BNE CODE_07D6FC                           ; $07D6E6 |
  LDY !s_spr_facing_dir,x                   ; $07D6E8 |
  LDA !s_spr_x_hitbox_center,x              ; $07D6EB |
  CLC                                       ; $07D6EE |
  ADC $D61A,y                               ; $07D6EF |
  STA $00                                   ; $07D6F2 |
  LDA !s_spr_y_hitbox_center,x              ; $07D6F4 |
  STA $02                                   ; $07D6F7 |
  JSR CODE_07FD16                           ; $07D6F9 |

CODE_07D6FC:
  JSL player_hit_sprite                     ; $07D6FC |

CODE_07D700:
  RTS                                       ; $07D700 |

CODE_07D701:
  LDY !s_spr_facing_dir,x                   ; $07D701 |
  LDA !s_spr_x_hitbox_center,x              ; $07D704 |
  CLC                                       ; $07D707 |
  ADC $D54C,y                               ; $07D708 |
  STA $00                                   ; $07D70B |
  STA !gsu_r8                               ; $07D70D |
  LDA !s_spr_y_hitbox_center,x              ; $07D710 |
  STA $02                                   ; $07D713 |
  STA !gsu_r0                               ; $07D715 |
  LDX #$0A                                  ; $07D718 |
  LDA #$CE2F                                ; $07D71A |
  JSL r_gsu_init_3                          ; $07D71D | GSU init
  LDX $12                                   ; $07D721 |
  LDA !gsu_r7                               ; $07D723 |
  AND #$F800                                ; $07D726 |
  CMP #$4000                                ; $07D729 |
  BNE CODE_07D731                           ; $07D72C |
  JSR CODE_07D75C                           ; $07D72E |

CODE_07D731:
  LDA $00                                   ; $07D731 |
  STA !gsu_r8                               ; $07D733 |
  LDA !s_spr_y_hitbox_center,x              ; $07D736 |
  SEC                                       ; $07D739 |
  SBC #$0008                                ; $07D73A |
  STA $02                                   ; $07D73D |
  STA !gsu_r0                               ; $07D73F |
  LDX #$0A                                  ; $07D742 |
  LDA #$CE2F                                ; $07D744 |
  JSL r_gsu_init_3                          ; $07D747 | GSU init
  LDX $12                                   ; $07D74B |
  LDA !gsu_r7                               ; $07D74D |
  AND #$F800                                ; $07D750 |
  CMP #$4000                                ; $07D753 |
  BNE CODE_07D75B                           ; $07D756 |
  JSR CODE_07D75C                           ; $07D758 |

CODE_07D75B:
  RTS                                       ; $07D75B |

CODE_07D75C:
  LDA #$0000                                ; $07D75C |
  STA $008F                                 ; $07D75F |
  LDA $00                                   ; $07D762 |
  STA $0091                                 ; $07D764 |
  LDA $02                                   ; $07D767 |
  STA $0093                                 ; $07D769 |
  JSL $109295                               ; $07D76C |
  LDX $12                                   ; $07D770 |
  LDA #$01C3                                ; $07D772 |
  JSL spawn_ambient_sprite                  ; $07D775 |
  LDA $00                                   ; $07D779 |
  AND #$FFF0                                ; $07D77B |
  STA $70A2,y                               ; $07D77E |
  LDA $02                                   ; $07D781 |
  AND #$FFF0                                ; $07D783 |
  STA $7142,y                               ; $07D786 |
  LDA #$000A                                ; $07D789 |
  STA $73C2,y                               ; $07D78C |
  LDA #$0002                                ; $07D78F |
  STA $7782,y                               ; $07D792 |
  LDA #$000A                                ; $07D795 |\ play sound #$000A
  JSL push_sound_queue                      ; $07D798 |/
  RTS                                       ; $07D79C |

CODE_07D79D:
  LDA !s_spr_wildcard_1_lo,x                ; $07D79D |
  BNE CODE_07D7EA                           ; $07D7A0 |
  LDY !s_spr_collision_id,x                 ; $07D7A2 |
  BMI CODE_07D7EB                           ; $07D7A5 |
  DEY                                       ; $07D7A7 |
  BMI CODE_07D7EA                           ; $07D7A8 |
  BEQ CODE_07D7EA                           ; $07D7AA |
  LDA !s_spr_state,y                        ; $07D7AC |
  CMP #$0010                                ; $07D7AF |
  BNE CODE_07D7EA                           ; $07D7B2 |
  LDA !s_spr_collision_state,y              ; $07D7B4 |
  BEQ CODE_07D7EA                           ; $07D7B7 |
  LDA !s_spr_x_speed_lo,y                   ; $07D7B9 |
  CMP #$8000                                ; $07D7BC |
  ROR A                                     ; $07D7BF |
  CMP #$8000                                ; $07D7C0 |
  ROR A                                     ; $07D7C3 |
  STA !s_spr_x_speed_lo,x                   ; $07D7C4 |
  TYX                                       ; $07D7C7 |
  JSL $03B24B                               ; $07D7C8 |
  LDX $12                                   ; $07D7CC |

CODE_07D7CE:
  LDA #$000E                                ; $07D7CE |
  STA !s_spr_state,x                        ; $07D7D1 |
  LDA #$0010                                ; $07D7D4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D7D7 |
  SEP #$20                                  ; $07D7D9 |
  TAY                                       ; $07D7DB |
  LDA $D835,y                               ; $07D7DC |
  STA !s_spr_anim_frame,x                   ; $07D7DF |
  LDA $D846,y                               ; $07D7E2 |
  STA !s_spr_timer_1,x                      ; $07D7E5 |
  REP #$20                                  ; $07D7E8 |

CODE_07D7EA:
  RTL                                       ; $07D7EA |

CODE_07D7EB:
  LDA !s_super_mario_timer                  ; $07D7EB |
  BNE CODE_07D805                           ; $07D7EE |
  JSL $07FC2F                               ; $07D7F0 |
  BCC CODE_07D803                           ; $07D7F4 |

CODE_07D7F6:
  JSL $03B20B                               ; $07D7F6 |
  LDA #$001C                                ; $07D7FA |\
  JSL push_sound_queue                      ; $07D7FD |/ play sound #$001C
  BRA CODE_07D7CE                           ; $07D801 |

CODE_07D803:
  BEQ CODE_07D809                           ; $07D803 |

CODE_07D805:
  JSL player_hit_sprite                     ; $07D805 |

CODE_07D809:
  RTL                                       ; $07D809 |

  db $01, $20                               ; $07D80A |

CODE_07D80C:
  LDY #$BD00                                ; $07D80C |
  RTS                                       ; $07D80F |

  db $78, $89, $01, $00, $F0, $01, $C8      ; $07D810 |

  LDA $D80A,y                               ; $07D817 |
  AND #$00FF                                ; $07D81A |
  STA !s_spr_x_accel,x                      ; $07D81D |
  LDA !s_spr_x_speed_lo,x                   ; $07D820 |
  BEQ CODE_07D82E                           ; $07D823 |
  LDA !s_spr_facing_dir,x                   ; $07D825 |
  DEC A                                     ; $07D828 |
  EOR !s_spr_x_speed_lo,x                   ; $07D829 |
  BMI CODE_07D834                           ; $07D82C |

CODE_07D82E:
  STZ !s_spr_x_speed_lo,x                   ; $07D82E |
  STZ !s_spr_x_accel,x                      ; $07D831 |

CODE_07D834:
  RTL                                       ; $07D834 |

  db $2A, $2B, $2A, $2B, $2A, $2B, $2A, $2A ; $07D835 |
  db $29, $28, $27, $26, $25, $24, $23, $22 ; $07D83D |
  db $00                                    ; $07D845 |

  db $20, $02, $02, $02, $02, $02, $02, $22 ; $07D846 |
  db $02, $02, $80, $02, $04, $02, $02, $04 ; $07D84E |
  db $02                                    ; $07D856 |

head_bop_zeus_guy:
  LDA !s_spr_oam_yxppccct,x                 ; $07D857 |
  AND #$FFF1                                ; $07D85A |
  STA !s_spr_oam_yxppccct,x                 ; $07D85D |
  LDA $7860,x                               ; $07D860 |
  BIT #$0001                                ; $07D863 |
  BEQ CODE_07D86B                           ; $07D866 |
  STZ !s_spr_x_speed_lo,x                   ; $07D868 |

CODE_07D86B:
  LDA !s_spr_timer_1,x                      ; $07D86B |
  BNE CODE_07D898                           ; $07D86E |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D870 |
  BMI CODE_07D8B0                           ; $07D872 |
  SEP #$20                                  ; $07D874 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D876 |
  LDA $D835,y                               ; $07D878 |
  STA !s_spr_anim_frame,x                   ; $07D87B |
  LDA $D846,y                               ; $07D87E |
  STA !s_spr_timer_1,x                      ; $07D881 |
  REP #$20                                  ; $07D884 |
  CPY #$0F                                  ; $07D886 |
  BNE CODE_07D898                           ; $07D888 |
  LDA $7860,x                               ; $07D88A |
  AND #$0001                                ; $07D88D |
  BEQ CODE_07D898                           ; $07D890 |
  LDA #$FE80                                ; $07D892 |
  STA !s_spr_y_speed_lo,x                   ; $07D895 |

CODE_07D898:
  JSL $07FD6C                               ; $07D898 |
  BEQ CODE_07D8A7                           ; $07D89C |
  PHP                                       ; $07D89E |
  LDA !s_super_mario_timer                  ; $07D89F |
  BNE CODE_07D8AB                           ; $07D8A2 |
  PLP                                       ; $07D8A4 |
  BCS CODE_07D8A8                           ; $07D8A5 |

CODE_07D8A7:
  RTL                                       ; $07D8A7 |

CODE_07D8A8:
  JMP CODE_07D7F6                           ; $07D8A8 |

CODE_07D8AB:
  PLP                                       ; $07D8AB |
  JML $03B273                               ; $07D8AC |

CODE_07D8B0:
  LDA #$0010                                ; $07D8B0 |
  STA !s_spr_state,x                        ; $07D8B3 |
  JML $07CE9D                               ; $07D8B6 |

  db $01, $02, $03, $04, $05, $06, $07, $08 ; $07D8BA |
  db $09, $0A, $0B, $0A, $09, $08, $07, $06 ; $07D8C2 |
  db $05, $04, $03, $02, $01, $00           ; $07D8CA |

  dw $FF00, $0100                           ; $07D8D0 |

init_zeus_guy_energy:
  LDA #$0015                                ; $07D8D4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D8D7 |
  SEP #$20                                  ; $07D8D9 |
  TAY                                       ; $07D8DB |
  LDA $D8BA,y                               ; $07D8DC |
  STA !s_spr_anim_frame,x                   ; $07D8DF |
  LDA #$01                                  ; $07D8E2 |
  STA !s_spr_timer_1,x                      ; $07D8E4 |
  REP #$20                                  ; $07D8E7 |
  LDY !s_spr_facing_dir,x                   ; $07D8E9 |
  LDA $D8D0,y                               ; $07D8EC |
  STA !s_spr_x_speed_lo,x                   ; $07D8EF |
  RTL                                       ; $07D8F2 |

main_zeus_guy_energy:
  JSL $03AF23                               ; $07D8F3 |
  LDA !s_spr_timer_1,x                      ; $07D8F7 |
  BNE CODE_07D91E                           ; $07D8FA |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07D8FC |
  BPL CODE_07D905                           ; $07D8FE |
  LDA #$0015                                ; $07D900 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07D903 |

CODE_07D905:
  SEP #$20                                  ; $07D905 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07D907 |
  LDA $D8BA,y                               ; $07D909 |
  STA !s_spr_anim_frame,x                   ; $07D90C |
  LDA !s_spr_anim_frame,x                   ; $07D90F |
  EOR #$01                                  ; $07D912 |
  STA !s_spr_anim_frame,x                   ; $07D914 |
  LDA #$01                                  ; $07D917 |
  STA !s_spr_timer_1,x                      ; $07D919 |
  REP #$20                                  ; $07D91C |

CODE_07D91E:
  LDY !s_spr_collision_id,x                 ; $07D91E |
  BPL CODE_07D955                           ; $07D921 |
  LDA #$020A                                ; $07D923 |
  JSL spawn_ambient_sprite                  ; $07D926 |
  LDA !s_spr_x_pixel_pos,x                  ; $07D92A |
  SEC                                       ; $07D92D |
  SBC #$0004                                ; $07D92E |
  STA $70A2,y                               ; $07D931 |
  LDA !s_spr_y_pixel_pos,x                  ; $07D934 |
  SEC                                       ; $07D937 |
  SBC #$0004                                ; $07D938 |
  STA $7142,y                               ; $07D93B |
  LDA #$0008                                ; $07D93E |
  STA $7782,y                               ; $07D941 |
  LDA #$0004                                ; $07D944 |
  STA $73C2,y                               ; $07D947 |
  STA $7E4C,y                               ; $07D94A |
  JSL player_hit_sprite                     ; $07D94D |
  JSL $03A31E                               ; $07D951 |

CODE_07D955:
  RTL                                       ; $07D955 |

; red and green
init_koopa_shell:
  LDA #$0002                                ; $07D956 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07D959 |
  RTL                                       ; $07D95B |

  dw $0380, $FC80                           ; $07D95C |

  dw $FE40, $FF00                           ; $07D960 |

; red and green
main_koopa_shell:
  LDA !s_spr_state,x                        ; $07D964 |
  CMP #$0010                                ; $07D967 |
  BEQ CODE_07D971                           ; $07D96A |
  STZ !s_spr_wildcard_5_lo,x                ; $07D96C |
  BRA CODE_07D976                           ; $07D96F |

CODE_07D971:
  LDA !s_spr_collision_state,x              ; $07D971 |
  BNE CODE_07D980                           ; $07D974 |

CODE_07D976:
  JSL $03AF23                               ; $07D976 |
  JSL $07E336                               ; $07D97A |
  BRA CODE_07D994                           ; $07D97E |

CODE_07D980:
  LDA !s_sprite_disable_flag                ; $07D980 |
  BEQ CODE_07D986                           ; $07D983 |
  RTL                                       ; $07D985 |

CODE_07D986:
  LDA !s_spr_collision_state,x              ; $07D986 |
  CMP #$0002                                ; $07D989 |
  BCC CODE_07D991                           ; $07D98C |
  DEC !s_spr_collision_state,x              ; $07D98E |

CODE_07D991:
  JSR CODE_07DC8C                           ; $07D991 |

CODE_07D994:
  LDA $7860,x                               ; $07D994 |
  BIT #$0001                                ; $07D997 |
  BEQ CODE_07D9AA                           ; $07D99A |
  LDA !s_spr_wildcard_6_lo,x                ; $07D99C |
  CMP #$0002                                ; $07D99F |
  BCS CODE_07D9AD                           ; $07D9A2 |
  INC A                                     ; $07D9A4 |
  STA !s_spr_wildcard_6_lo,x                ; $07D9A5 |
  BRA CODE_07D9AD                           ; $07D9A8 |

CODE_07D9AA:
  STZ !s_spr_wildcard_6_lo,x                ; $07D9AA |

CODE_07D9AD:
  LDA !s_spr_wildcard_6_lo,x                ; $07D9AD |
  CMP #$0001                                ; $07D9B0 |
  BNE CODE_07D9CF                           ; $07D9B3 |
  LDA #$001D                                ; $07D9B5 |\ play sound #$001D
  JSL push_sound_queue                      ; $07D9B8 |/
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D9BC |
  CMP #$0002                                ; $07D9BE |
  BCS CODE_07D9CF                           ; $07D9C1 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07D9C3 |
  ASL A                                     ; $07D9C5 |
  TAY                                       ; $07D9C6 |
  LDA $D960,y                               ; $07D9C7 |
  STA !s_spr_y_speed_lo,x                   ; $07D9CA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $07D9CD |

CODE_07D9CF:
  LDA !s_spr_x_speed_lo,x                   ; $07D9CF |
  CLC                                       ; $07D9D2 |
  ADC #$0180                                ; $07D9D3 |
  CMP #$0301                                ; $07D9D6 |
  BCS CODE_07DA52                           ; $07D9D9 |
  LDY !s_spr_collision_state,x              ; $07D9DB |
  CPY #$B002                                ; $07D9DE |
  ORA $BC                                   ; $07D9E1 |
  ROL $7D,x                                 ; $07D9E3 |
  BMI CODE_07D9EA                           ; $07D9E5 |
  JMP CODE_07DA7A                           ; $07D9E7 |

CODE_07D9EA:
  JSL $07FC2F                               ; $07D9EA |
  BCC CODE_07D9F9                           ; $07D9EE |
  JSL $03B20B                               ; $07D9F0 |
  LDA #$001C                                ; $07D9F4 |
  BRA CODE_07D9FC                           ; $07D9F7 |

CODE_07D9F9:
  LDA #$000B                                ; $07D9F9 |\ play sound #$000B

CODE_07D9FC:
  JSL push_sound_queue                      ; $07D9FC |/
  LDA !s_player_invincibility_timer         ; $07DA00 |
  CMP #$0020                                ; $07DA03 |
  BCS CODE_07DA0E                           ; $07DA06 |
  LDA #$0020                                ; $07DA08 |
  STA !s_player_invincibility_timer         ; $07DA0B |

CODE_07DA0E:
  LDA !s_player_x_speed_prev                ; $07DA0E |
  BPL CODE_07DA17                           ; $07DA11 |
  EOR #$FFFF                                ; $07DA13 |
  INC A                                     ; $07DA16 |

CODE_07DA17:
  STA $00                                   ; $07DA17 |
  CMP #$0300                                ; $07DA19 |
  BMI CODE_07DA26                           ; $07DA1C |
  LDA $00                                   ; $07DA1E |
  CLC                                       ; $07DA20 |
  ADC #$0080                                ; $07DA21 |
  BRA CODE_07DA29                           ; $07DA24 |

CODE_07DA26:
  LDA #$0380                                ; $07DA26 |

CODE_07DA29:
  STA $00                                   ; $07DA29 |
  EOR #$FFFF                                ; $07DA2B |
  INC A                                     ; $07DA2E |
  STA $02                                   ; $07DA2F |
  LDA !s_spr_x_hitbox_center,x              ; $07DA31 |
  SEC                                       ; $07DA34 |
  SBC !s_player_center_x                    ; $07DA35 |
  AND #$8000                                ; $07DA38 |
  ASL A                                     ; $07DA3B |
  ROL A                                     ; $07DA3C |
  ASL A                                     ; $07DA3D |
  TAY                                       ; $07DA3E |
  LDA $7960,y                               ; $07DA3F |
  STA !s_spr_x_speed_lo,x                   ; $07DA42 |
  LDA #$0004                                ; $07DA45 |
  STA !s_spr_timer_1,x                      ; $07DA48 |
  LDA #$0001                                ; $07DA4B |
  STA !s_spr_collision_state,x              ; $07DA4E |
  RTL                                       ; $07DA51 |

CODE_07DA52:
  LDA $7860,x                               ; $07DA52 |
  AND #$000E                                ; $07DA55 |
  BEQ CODE_07DA61                           ; $07DA58 |
  LDA #$001C                                ; $07DA5A |\ play sound #$001C
  JSL push_sound_queue                      ; $07DA5D |/

CODE_07DA61:
  LDA !s_spr_timer_1,x                      ; $07DA61 |
  BNE CODE_07DA76                           ; $07DA64 |
  LDA !s_spr_anim_frame,x                   ; $07DA66 |
  INC A                                     ; $07DA69 |
  AND #$0003                                ; $07DA6A |
  STA !s_spr_anim_frame,x                   ; $07DA6D |
  LDA #$0004                                ; $07DA70 |
  STA !s_spr_timer_1,x                      ; $07DA73 |

CODE_07DA76:
  JSR CODE_07DAA8                           ; $07DA76 |
  RTL                                       ; $07DA79 |

CODE_07DA7A:
  LDA !s_spr_timer_2,x                      ; $07DA7A |
  BNE CODE_07DA9B                           ; $07DA7D |
  LDA $7860,x                               ; $07DA7F |
  AND #$0001                                ; $07DA82 |
  BNE CODE_07DA8B                           ; $07DA85 |
  JSR CODE_07DAA8                           ; $07DA87 |
  RTL                                       ; $07DA8A |

CODE_07DA8B:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07DA8B |
  CMP #$0002                                ; $07DA8D |
  BCC CODE_07DA95                           ; $07DA90 |
  STZ !s_spr_x_speed_lo,x                   ; $07DA92 |

CODE_07DA95:
  STZ !s_spr_collision_state,x              ; $07DA95 |
  JSR CODE_07DC43                           ; $07DA98 |

CODE_07DA9B:
  RTL                                       ; $07DA9B |

  db $0C, $0D, $0E, $0F, $10, $11, $12, $12 ; $07DA9C |

  dw $0200, $FE00                           ; $07DAA4 |

CODE_07DAA8:
  LDY !s_spr_collision_id,x                 ; $07DAA8 |
  BPL CODE_07DADC                           ; $07DAAB |
  LDA !s_spr_collision_state,x              ; $07DAAD |
  CMP #$0002                                ; $07DAB0 |
  BCS CODE_07DADC                           ; $07DAB3 |
  JSL $07FC2F                               ; $07DAB5 |
  BCC CODE_07DAD5                           ; $07DAB9 |
  LDA #$001C                                ; $07DABB |\ play sound #$001C
  JSL push_sound_queue                      ; $07DABE |/
  STZ !s_spr_x_speed_lo,x                   ; $07DAC2 |
  JSL $03B20B                               ; $07DAC5 |
  LDA $7860,x                               ; $07DAC9 |
  BIT #$0001                                ; $07DACC |
  BEQ CODE_07DAD4                           ; $07DACF |
  STZ !s_spr_collision_state,x              ; $07DAD1 |

CODE_07DAD4:
  RTS                                       ; $07DAD4 |

CODE_07DAD5:
  BEQ CODE_07DADB                           ; $07DAD5 |
  JSL player_hit_sprite                     ; $07DAD7 |

CODE_07DADB:
  RTS                                       ; $07DADB |

CODE_07DADC:
  DEY                                       ; $07DADC |
  BMI CODE_07DB5C                           ; $07DADD |
  BEQ CODE_07DB5C                           ; $07DADF |
  LDA !s_spr_state,y                        ; $07DAE1 |
  CMP #$0010                                ; $07DAE4 |
  BNE CODE_07DB5C                           ; $07DAE7 |
  LDA !s_spr_id,y                           ; $07DAE9 |
  CMP #$0022                                ; $07DAEC |
  BCC CODE_07DAF6                           ; $07DAEF |
  CMP #$002C                                ; $07DAF1 |
  BCC CODE_07DAFB                           ; $07DAF4 |

CODE_07DAF6:
  CMP #$0107                                ; $07DAF6 |
  BNE CODE_07DB00                           ; $07DAF9 |

CODE_07DAFB:
  LDA !s_spr_collision_state,y              ; $07DAFB |
  BNE CODE_07DB1A                           ; $07DAFE |

CODE_07DB00:
  LDA !s_spr_bitwise_settings_3,y           ; $07DB00 |
  BIT #$6000                                ; $07DB03 |
  BNE CODE_07DB5C                           ; $07DB06 |
  LDA !s_spr_id,y                           ; $07DB08 |
  CMP #$0167                                ; $07DB0B |
  BCC CODE_07DB15                           ; $07DB0E |
  CMP #$0170                                ; $07DB10 |
  BCC CODE_07DB5D                           ; $07DB13 |

CODE_07DB15:
  LDA !s_spr_collision_state,y              ; $07DB15 |
  BEQ CODE_07DB1D                           ; $07DB18 |

CODE_07DB1A:
  JMP CODE_07DC05                           ; $07DB1A |

CODE_07DB1D:
  LDA !s_spr_bitwise_settings_1,y           ; $07DB1D |
  BIT #$0020                                ; $07DB20 |
  BNE CODE_07DB5C                           ; $07DB23 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07DB25 |
  INC A                                     ; $07DB28 |
  CMP #$0009                                ; $07DB29 |
  BCS CODE_07DB31                           ; $07DB2C |
  STA !s_spr_gsu_morph_1_lo,x               ; $07DB2E |

CODE_07DB31:
  CMP #$0008                                ; $07DB31 |
  BCC CODE_07DB3F                           ; $07DB34 |
  PHX                                       ; $07DB36 |
  PHY                                       ; $07DB37 |
  TYX                                       ; $07DB38 |
  JSL $03A496                               ; $07DB39 |
  PLY                                       ; $07DB3D |
  PLX                                       ; $07DB3E |

CODE_07DB3F:
  TYX                                       ; $07DB3F |
  JSL $0CFF61                               ; $07DB40 |
  JSL $03A32E                               ; $07DB44 |
  LDX $12                                   ; $07DB48 |

CODE_07DB4A:
  LDY !s_spr_gsu_morph_1_lo,x               ; $07DB4A |
  DEY                                       ; $07DB4D |
  CPY #$07                                  ; $07DB4E |
  BCS CODE_07DB5C                           ; $07DB50 |
  LDA $DA9C,y                               ; $07DB52 |
  AND #$00FF                                ; $07DB55 |
  JSL push_sound_queue                      ; $07DB58 |

CODE_07DB5C:
  RTS                                       ; $07DB5C |

CODE_07DB5D:
  CMP #$0169                                ; $07DB5D |
  BCS CODE_07DB9F                           ; $07DB60 |
  LDA !s_spr_collision_state,y              ; $07DB62 |
  BEQ CODE_07DB9F                           ; $07DB65 |
  PHY                                       ; $07DB67 |
  JSL $03B288                               ; $07DB68 |
  SEP #$20                                  ; $07DB6C |
  LDA #$FF                                  ; $07DB6E |
  STA !s_spr_stage_id,x                     ; $07DB70 |
  LDA $7C77,x                               ; $07DB73 |
  AND #$80                                  ; $07DB76 |
  ASL A                                     ; $07DB78 |
  ROL A                                     ; $07DB79 |
  ASL A                                     ; $07DB7A |
  EOR #$02                                  ; $07DB7B |
  TAY                                       ; $07DB7D |
  REP #$20                                  ; $07DB7E |
  LDA $DAA4,y                               ; $07DB80 |
  STA !s_spr_x_speed_lo,x                   ; $07DB83 |
  LDA #$000E                                ; $07DB86 |
  STA !s_spr_state,x                        ; $07DB89 |
  LDA #$0040                                ; $07DB8C |
  STA !s_spr_y_accel,x                      ; $07DB8F |
  LDA #$0400                                ; $07DB92 |
  STA !s_spr_y_accel_ceiling,x              ; $07DB95 |
  LDA #$FC00                                ; $07DB98 |
  STA !s_spr_y_speed_lo,x                   ; $07DB9B |
  PLY                                       ; $07DB9E |

CODE_07DB9F:
  LDA !s_spr_gsu_morph_1_lo,x               ; $07DB9F |
  INC A                                     ; $07DBA2 |
  CMP #$0009                                ; $07DBA3 |
  BCS CODE_07DBAB                           ; $07DBA6 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07DBA8 |

CODE_07DBAB:
  CMP #$0008                                ; $07DBAB |
  BCC CODE_07DBB9                           ; $07DBAE |
  PHX                                       ; $07DBB0 |
  PHY                                       ; $07DBB1 |
  TYX                                       ; $07DBB2 |
  JSL $03A496                               ; $07DBB3 |
  PLY                                       ; $07DBB7 |
  PLX                                       ; $07DBB8 |

CODE_07DBB9:
  PHY                                       ; $07DBB9 |
  TYX                                       ; $07DBBA |
  JSL $0CFF61                               ; $07DBBB |
  JSL $03B24B                               ; $07DBBF |
  PLY                                       ; $07DBC3 |
  LDX $12                                   ; $07DBC4 |
  SEP #$20                                  ; $07DBC6 |
  LDA $7C77,x                               ; $07DBC8 |
  AND #$80                                  ; $07DBCB |
  ASL A                                     ; $07DBCD |
  ROL A                                     ; $07DBCE |
  ASL A                                     ; $07DBCF |
  TAX                                       ; $07DBD0 |
  REP #$20                                  ; $07DBD1 |
  LDA $DAA4,x                               ; $07DBD3 |
  STA !s_spr_x_speed_lo,y                   ; $07DBD6 |
  LDA #$000E                                ; $07DBD9 |
  STA !s_spr_state,y                        ; $07DBDC |
  LDA #$0040                                ; $07DBDF |
  STA !s_spr_y_accel,y                      ; $07DBE2 |
  LDA #$0400                                ; $07DBE5 |
  STA !s_spr_y_accel_ceiling,y              ; $07DBE8 |
  LDA #$FC00                                ; $07DBEB |
  STA !s_spr_y_speed_lo,y                   ; $07DBEE |
  LDA !s_spr_bitwise_settings_3,y           ; $07DBF1 |
  ORA #$0020                                ; $07DBF4 |
  STA !s_spr_bitwise_settings_3,y           ; $07DBF7 |
  LDA #$0001                                ; $07DBFA |
  STA !s_spr_wildcard_1_lo,y                ; $07DBFD |
  LDX $12                                   ; $07DC00 |
  JMP CODE_07DB4A                           ; $07DC02 |

CODE_07DC05:
  TYX                                       ; $07DC05 |
  JSL $03B24B                               ; $07DC06 |
  BCS CODE_07DC42                           ; $07DC0A |
  JSL $03B288                               ; $07DC0C |
  SEP #$20                                  ; $07DC10 |
  LDA #$FF                                  ; $07DC12 |
  STA !s_spr_stage_id,x                     ; $07DC14 |
  LDA $7C77,x                               ; $07DC17 |
  AND #$80                                  ; $07DC1A |
  ASL A                                     ; $07DC1C |
  ROL A                                     ; $07DC1D |
  ASL A                                     ; $07DC1E |
  EOR #$02                                  ; $07DC1F |
  TAY                                       ; $07DC21 |
  REP #$20                                  ; $07DC22 |
  LDA $DAA4,y                               ; $07DC24 |
  STA !s_spr_x_speed_lo,x                   ; $07DC27 |
  LDA #$000E                                ; $07DC2A |
  STA !s_spr_state,x                        ; $07DC2D |
  LDA #$0040                                ; $07DC30 |
  STA !s_spr_y_accel,x                      ; $07DC33 |
  LDA #$0400                                ; $07DC36 |
  STA !s_spr_y_accel_ceiling,x              ; $07DC39 |
  LDA #$FC00                                ; $07DC3C |
  STA !s_spr_y_speed_lo,x                   ; $07DC3F |

CODE_07DC42:
  RTS                                       ; $07DC42 |

CODE_07DC43:
  LDY !s_spr_collision_id,x                 ; $07DC43 |
  DEY                                       ; $07DC46 |
  BMI CODE_07DC8B                           ; $07DC47 |
  BEQ CODE_07DC8B                           ; $07DC49 |
  LDA !s_spr_state,y                        ; $07DC4B |
  CMP #$0010                                ; $07DC4E |
  BNE CODE_07DC8B                           ; $07DC51 |
  LDA !s_spr_collision_state,y              ; $07DC53 |
  BEQ CODE_07DC8B                           ; $07DC56 |
  LDA !s_spr_id,y                           ; $07DC58 |
  CMP #$0167                                ; $07DC5B |
  BCC CODE_07DC65                           ; $07DC5E |
  CMP #$0169                                ; $07DC60 |
  BCC CODE_07DC8B                           ; $07DC63 |

CODE_07DC65:
  STZ $00                                   ; $07DC65 |
  LDA !s_spr_x_hitbox_center,x              ; $07DC67 |
  SEC                                       ; $07DC6A |
  SBC !s_spr_x_hitbox_center,y              ; $07DC6B |
  BPL CODE_07DC74                           ; $07DC6E |
  INC $00                                   ; $07DC70 |
  INC $00                                   ; $07DC72 |

CODE_07DC74:
  TYX                                       ; $07DC74 |
  JSL $03B24B                               ; $07DC75 |
  BCS CODE_07DC8B                           ; $07DC79 |
  LDX $12                                   ; $07DC7B |
  LDY $00                                   ; $07DC7D |
  LDA $D95C,y                               ; $07DC7F |
  STA !s_spr_x_speed_lo,x                   ; $07DC82 |
  LDA #$0001                                ; $07DC85 |
  STA !s_spr_collision_state,x              ; $07DC88 |

CODE_07DC8B:
  RTS                                       ; $07DC8B |

CODE_07DC8C:
  LDA $7860,x                               ; $07DC8C |
  AND #$000E                                ; $07DC8F |
  BEQ CODE_07DC8B                           ; $07DC92 |
  BIT #$0008                                ; $07DC94 |
  BNE CODE_07DCED                           ; $07DC97 |
  BIT #$0004                                ; $07DC99 |
  BNE CODE_07DCC7                           ; $07DC9C |
  LDA !s_spr_wildcard_2_lo,x                ; $07DC9E |
  REP #$10                                  ; $07DCA1 |
  TAX                                       ; $07DCA3 |
  LDA $70001C,x                             ; $07DCA4 |
  AND #$F800                                ; $07DCA8 |
  CMP #$4000                                ; $07DCAB |
  BNE CODE_07DCC4                           ; $07DCAE |
  LDA $700018,x                             ; $07DCB0 |
  STA $00                                   ; $07DCB4 |
  STA $0091                                 ; $07DCB6 |
  LDA $70001A,x                             ; $07DCB9 |
  STA $02                                   ; $07DCBD |
  STA $0093                                 ; $07DCBF |
  BRA CODE_07DD11                           ; $07DCC2 |

CODE_07DCC4:
  JMP CODE_07DD49                           ; $07DCC4 |

CODE_07DCC7:
  LDA !s_spr_wildcard_2_lo,x                ; $07DCC7 |
  REP #$10                                  ; $07DCCA |
  TAX                                       ; $07DCCC |
  LDA $700014,x                             ; $07DCCD |
  AND #$F800                                ; $07DCD1 |
  CMP #$4000                                ; $07DCD4 |
  BNE CODE_07DD49                           ; $07DCD7 |
  LDA $700010,x                             ; $07DCD9 |
  STA $00                                   ; $07DCDD |
  STA $0091                                 ; $07DCDF |
  LDA $700012,x                             ; $07DCE2 |
  STA $02                                   ; $07DCE6 |
  STA $0093                                 ; $07DCE8 |
  BRA CODE_07DD11                           ; $07DCEB |

CODE_07DCED:
  LDA !s_spr_wildcard_2_lo,x                ; $07DCED |
  REP #$10                                  ; $07DCF0 |
  TAX                                       ; $07DCF2 |
  LDA $70000C,x                             ; $07DCF3 |
  AND #$F800                                ; $07DCF7 |
  CMP #$4000                                ; $07DCFA |
  BNE CODE_07DD49                           ; $07DCFD |
  LDA $700008,x                             ; $07DCFF |
  STA $00                                   ; $07DD03 |
  STA $0091                                 ; $07DD05 |
  LDA $70000A,x                             ; $07DD08 |
  STA $02                                   ; $07DD0C |
  STA $0093                                 ; $07DD0E |

CODE_07DD11:
  SEP #$10                                  ; $07DD11 |
  LDA #$0000                                ; $07DD13 |
  STA $008F                                 ; $07DD16 |
  JSL $109295                               ; $07DD19 |
  LDX $12                                   ; $07DD1D |
  LDA #$01C3                                ; $07DD1F |
  JSL spawn_ambient_sprite                  ; $07DD22 |
  LDA $00                                   ; $07DD26 |
  AND #$FFF0                                ; $07DD28 |
  STA $70A2,y                               ; $07DD2B |
  LDA $02                                   ; $07DD2E |
  AND #$FFF0                                ; $07DD30 |
  STA $7142,y                               ; $07DD33 |
  LDA #$000A                                ; $07DD36 |
  STA $73C2,y                               ; $07DD39 |
  LDA #$0002                                ; $07DD3C |
  STA $7782,y                               ; $07DD3F |
  LDA #$000A                                ; $07DD42 |\ play sound #$000A
  JSL push_sound_queue                      ; $07DD45 |/

CODE_07DD49:
  SEP #$10                                  ; $07DD49 |
  LDX $12                                   ; $07DD4B |
  RTS                                       ; $07DD4D |

  dw $FFA0, $0060                           ; $07DD4E |

; red and green
init_beach_koopa:
  LDY !s_spr_facing_dir,x                   ; $07DD52 |
  LDA $DD4E,y                               ; $07DD55 |
  STA !s_spr_x_speed_lo,x                   ; $07DD58 |
  LDA #$010A                                ; $07DD5B |
  STA !s_spr_gsu_morph_1_lo,x               ; $07DD5E |
  LDA $7860,x                               ; $07DD61 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07DD64 |
  SEP #$20                                  ; $07DD67 |
  STZ !s_spr_anim_frame,x                   ; $07DD69 |
  LDA #$05                                  ; $07DD6C |
  STA !s_spr_timer_1,x                      ; $07DD6E |
  LDA #$00                                  ; $07DD71 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07DD73 |
  REP #$20                                  ; $07DD75 |
  RTL                                       ; $07DD77 |

; red and green
init_koopa:
  LDY !s_spr_facing_dir,x                   ; $07DD78 |
  LDA $DD4E,y                               ; $07DD7B |
  STA !s_spr_x_speed_lo,x                   ; $07DD7E |
  LDA #$000A                                ; $07DD81 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07DD84 |
  LDA $7860,x                               ; $07DD87 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07DD8A |
  SEP #$20                                  ; $07DD8D |
  STZ !s_spr_anim_frame,x                   ; $07DD8F |
  LDA #$05                                  ; $07DD92 |
  STA !s_spr_timer_1,x                      ; $07DD94 |
  LDA #$00                                  ; $07DD97 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07DD99 |
  REP #$20                                  ; $07DD9B |
  STZ !s_spr_wildcard_1_lo,x                ; $07DD9D |
  RTL                                       ; $07DDA0 |

; red and green
main_beach_koopa:
  LDX #$08                                  ; $07DDA1 |
  LDA #$949D                                ; $07DDA3 |
  JSL r_gsu_init_1                          ; $07DDA6 | GSU init
  LDX $12                                   ; $07DDAA |
  JSL $03AF23                               ; $07DDAC |
  LDA $7860,x                               ; $07DDB0 |
  BIT #$0001                                ; $07DDB3 |
  BNE CODE_07DDC6                           ; $07DDB6 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07DDB8 |
  BIT #$0001                                ; $07DDBB |
  BNE CODE_07DDC6                           ; $07DDBE |
  LDA #$0002                                ; $07DDC0 |
  STA !s_spr_timer_2,x                      ; $07DDC3 |

CODE_07DDC6:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07DDC6 |
  TAX                                       ; $07DDC8 |
  JSR ($DDD1,x)                             ; $07DDC9 |
  JSL $03A5B7                               ; $07DDCC |
  RTL                                       ; $07DDD0 |

  dw $DE7F                                  ; $07DDD1 |
  dw $DFFF                                  ; $07DDD3 |
  dw $E12D                                  ; $07DDD5 |
  dw $E1B4                                  ; $07DDD7 |

; red and green
main_koopa:
  LDA !s_spr_state,x                        ; $07DDD9 |
  CMP #$0008                                ; $07DDDC |
  BNE CODE_07DDE4                           ; $07DDDF |
  JMP CODE_07E234                           ; $07DDE1 |

CODE_07DDE4:
  LDX #$08                                  ; $07DDE4 |
  LDA #$949D                                ; $07DDE6 |
  JSL r_gsu_init_1                          ; $07DDE9 | GSU init
  LDX $12                                   ; $07DDED |
  JSL $03AF23                               ; $07DDEF |
  JSL $07E35B                               ; $07DDF3 |
  JSL $03A5B7                               ; $07DDF7 |
  JSL $07E2A1                               ; $07DDFB |
  LDA $7860,x                               ; $07DDFF |
  BIT #$0001                                ; $07DE02 |
  BNE CODE_07DE15                           ; $07DE05 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07DE07 |
  BIT #$0001                                ; $07DE0A |
  BNE CODE_07DE15                           ; $07DE0D |
  LDA #$0002                                ; $07DE0F |
  STA !s_spr_timer_2,x                      ; $07DE12 |

CODE_07DE15:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07DE15 |
  TAX                                       ; $07DE17 |
  JSR ($DE1C,x)                             ; $07DE18 |
  RTL                                       ; $07DE1B |

  dw $DE2A                                  ; $07DE1C |
  dw $DFFF                                  ; $07DE1E |
  dw $E0C6                                  ; $07DE20 |

  db $07, $06, $05, $04, $03, $02, $01, $00 ; $07DE22 |

  LDX $12                                   ; $07DE2A |
  JSR CODE_07E1E4                           ; $07DE2C |
  BEQ CODE_07DE36                           ; $07DE2F |
  JSR CODE_07E1F3                           ; $07DE31 |
  BRA CODE_07DE39                           ; $07DE34 |

CODE_07DE36:
  JSR CODE_07E1FD                           ; $07DE36 |

CODE_07DE39:
  JSR CODE_07E303                           ; $07DE39 |
  JSR CODE_07E250                           ; $07DE3C |
  LDA !s_spr_timer_2,x                      ; $07DE3F |
  BNE CODE_07DE4F                           ; $07DE42 |
  LDY !s_spr_facing_dir,x                   ; $07DE44 |
  LDA $DD4E,y                               ; $07DE47 |
  STA !s_spr_x_speed_lo,x                   ; $07DE4A |
  BRA CODE_07DE67                           ; $07DE4D |

CODE_07DE4F:
  LDA #$000C                                ; $07DE4F |
  STA !s_spr_anim_frame,x                   ; $07DE52 |
  LDA $7860,x                               ; $07DE55 |
  AND #$0001                                ; $07DE58 |
  BEQ CODE_07DE7E                           ; $07DE5B |
  LDA #$0008                                ; $07DE5D |
  STA !s_spr_anim_frame,x                   ; $07DE60 |
  STZ !s_spr_x_speed_lo,x                   ; $07DE63 |
  RTS                                       ; $07DE66 |

CODE_07DE67:
  LDA !s_spr_timer_1,x                      ; $07DE67 |
  BNE CODE_07DE7E                           ; $07DE6A |
  SEP #$20                                  ; $07DE6C |
  LDA !s_spr_anim_frame,x                   ; $07DE6E |
  INC A                                     ; $07DE71 |
  AND #$07                                  ; $07DE72 |
  STA !s_spr_anim_frame,x                   ; $07DE74 |
  LDA #$05                                  ; $07DE77 |
  STA !s_spr_timer_1,x                      ; $07DE79 |
  REP #$20                                  ; $07DE7C |

CODE_07DE7E:
  RTS                                       ; $07DE7E |

  LDX $12                                   ; $07DE7F |
  LDA !s_spr_wildcard_6_lo,x                ; $07DE81 |
  BEQ CODE_07DE89                           ; $07DE84 |
  JMP CODE_07DF0D                           ; $07DE86 |

CODE_07DE89:
  LDA !s_spr_timer_3,x                      ; $07DE89 |
  BNE CODE_07DF0D                           ; $07DE8C |
  LDA !s_spr_x_pixel_pos,x                  ; $07DE8E |
  STA !gsu_r3                               ; $07DE91 |
  LDA !s_spr_y_pixel_pos,x                  ; $07DE94 |
  STA !gsu_r4                               ; $07DE97 |
  LDX #$09                                  ; $07DE9A |
  LDA #$9856                                ; $07DE9C |
  JSL r_gsu_init_1                          ; $07DE9F | GSU init
  LDX $12                                   ; $07DEA3 |
  LDY !gsu_r9                               ; $07DEA5 |
  BMI CODE_07DF0D                           ; $07DEA8 |
  LDA !s_spr_y_hitbox_center,x              ; $07DEAA |
  SEC                                       ; $07DEAD |
  SBC !s_spr_y_hitbox_center,y              ; $07DEAE |
  CLC                                       ; $07DEB1 |
  ADC #$0010                                ; $07DEB2 |
  CMP #$0020                                ; $07DEB5 |
  BCS CODE_07DF0D                           ; $07DEB8 |
  LDA !s_spr_facing_dir,x                   ; $07DEBA |
  DEC A                                     ; $07DEBD |
  STA $00                                   ; $07DEBE |
  LDA !s_spr_x_hitbox_center,x              ; $07DEC0 |
  SEC                                       ; $07DEC3 |
  SBC !s_spr_x_hitbox_center,y              ; $07DEC4 |
  STA $02                                   ; $07DEC7 |
  EOR $00                                   ; $07DEC9 |
  BPL CODE_07DF0D                           ; $07DECB |
  LDA $02                                   ; $07DECD |
  BPL CODE_07DED5                           ; $07DECF |
  EOR #$FFFF                                ; $07DED1 |
  INC A                                     ; $07DED4 |

CODE_07DED5:
  CMP #$0020                                ; $07DED5 |
  BCS CODE_07DF0D                           ; $07DED8 |
  ASL A                                     ; $07DEDA |
  ASL A                                     ; $07DEDB |
  ASL A                                     ; $07DEDC |
  LDY $03                                   ; $07DEDD |
  BMI CODE_07DEE5                           ; $07DEDF |
  EOR #$FFFF                                ; $07DEE1 |
  INC A                                     ; $07DEE4 |

CODE_07DEE5:
  STA !s_spr_x_speed_lo,x                   ; $07DEE5 |
  LDA #$FE00                                ; $07DEE8 |
  STA !s_spr_y_speed_lo,x                   ; $07DEEB |
  LDA #$0020                                ; $07DEEE |
  STA !s_spr_y_accel,x                      ; $07DEF1 |
  LDA #$0001                                ; $07DEF4 |
  STA !s_spr_wildcard_6_lo,x                ; $07DEF7 |
  LDA $7860,x                               ; $07DEFA |
  AND #$FFFE                                ; $07DEFD |
  STA $7860,x                               ; $07DF00 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07DF03 |
  LDA #$000C                                ; $07DF06 |
  STA !s_spr_anim_frame,x                   ; $07DF09 |
  RTS                                       ; $07DF0C |

CODE_07DF0D:
  JSR CODE_07E1E4                           ; $07DF0D |
  BEQ CODE_07DF17                           ; $07DF10 |
  JSR CODE_07E1F3                           ; $07DF12 |
  BRA CODE_07DF1A                           ; $07DF15 |

CODE_07DF17:
  JSR CODE_07E1FD                           ; $07DF17 |

CODE_07DF1A:
  JSR CODE_07E303                           ; $07DF1A |
  JSR CODE_07E250                           ; $07DF1D |
  LDA !s_spr_timer_2,x                      ; $07DF20 |
  BNE CODE_07DF49                           ; $07DF23 |
  STZ !s_spr_wildcard_6_lo,x                ; $07DF25 |
  LDY !s_spr_facing_dir,x                   ; $07DF28 |
  LDA $DD4E,y                               ; $07DF2B |
  STA !s_spr_x_speed_lo,x                   ; $07DF2E |
  LDA !s_spr_timer_1,x                      ; $07DF31 |
  BNE CODE_07DF48                           ; $07DF34 |
  SEP #$20                                  ; $07DF36 |
  LDA !s_spr_anim_frame,x                   ; $07DF38 |
  INC A                                     ; $07DF3B |
  AND #$07                                  ; $07DF3C |
  STA !s_spr_anim_frame,x                   ; $07DF3E |
  LDA #$05                                  ; $07DF41 |
  STA !s_spr_timer_1,x                      ; $07DF43 |
  REP #$20                                  ; $07DF46 |

CODE_07DF48:
  RTS                                       ; $07DF48 |

CODE_07DF49:
  LDA #$000C                                ; $07DF49 |
  LDY !s_spr_y_speed_hi,x                   ; $07DF4C |
  BMI CODE_07DF54                           ; $07DF4F |
  LDA #$0010                                ; $07DF51 |

CODE_07DF54:
  STA !s_spr_anim_frame,x                   ; $07DF54 |
  LDA $7860,x                               ; $07DF57 |
  BIT #$0001                                ; $07DF5A |
  BEQ CODE_07DF93                           ; $07DF5D |
  LDY !s_spr_collision_id,x                 ; $07DF5F |
  BMI CODE_07DF90                           ; $07DF62 |
  DEY                                       ; $07DF64 |
  BMI CODE_07DF90                           ; $07DF65 |
  BEQ CODE_07DF90                           ; $07DF67 |
  LDA !s_spr_id,y                           ; $07DF69 |
  CMP #$0167                                ; $07DF6C |
  BCC CODE_07DF90                           ; $07DF6F |
  CMP #$0169                                ; $07DF71 |
  BCS CODE_07DF90                           ; $07DF74 |
  LDA !s_spr_state,y                        ; $07DF76 |
  CMP #$0010                                ; $07DF79 |
  BNE CODE_07DF90                           ; $07DF7C |
  LDA !s_spr_collision_state,y              ; $07DF7E |
  BNE CODE_07DF90                           ; $07DF81 |
  LDA !s_spr_x_speed_lo,y                   ; $07DF83 |
  BNE CODE_07DF90                           ; $07DF86 |
  LDA $7860,y                               ; $07DF88 |
  BIT #$0001                                ; $07DF8B |
  BNE CODE_07DF94                           ; $07DF8E |

CODE_07DF90:
  JMP CODE_07DFEF                           ; $07DF90 |

CODE_07DF93:
  RTS                                       ; $07DF93 |

CODE_07DF94:
  LDA !s_spr_id,y                           ; $07DF94 |
  CMP #$0167                                ; $07DF97 |
  BNE CODE_07DFA1                           ; $07DF9A |
  LDA #$016B                                ; $07DF9C |
  BRA CODE_07DFA4                           ; $07DF9F |

CODE_07DFA1:
  LDA #$016C                                ; $07DFA1 |

CODE_07DFA4:
  PHY                                       ; $07DFA4 |
  TXY                                       ; $07DFA5 |
  JSL $03A377                               ; $07DFA6 |
  LDA #$0010                                ; $07DFAA |
  STA !s_spr_state,x                        ; $07DFAD |
  LDA !s_spr_y_pixel_pos,x                  ; $07DFB0 |
  CLC                                       ; $07DFB3 |
  ADC #$0008                                ; $07DFB4 |
  STA !s_spr_y_pixel_pos,x                  ; $07DFB7 |
  LDA #$FFF8                                ; $07DFBA |
  STA !s_spr_y_terrain_offset,x             ; $07DFBD |
  LDA #$0004                                ; $07DFC0 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07DFC3 |
  LDA #$0004                                ; $07DFC5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07DFC8 |
  SEP #$20                                  ; $07DFCA |
  TAY                                       ; $07DFCC |
  LDA $E05C,y                               ; $07DFCD |
  STA !s_spr_anim_frame,x                   ; $07DFD0 |
  LDA $E061,y                               ; $07DFD3 |
  STA !s_spr_timer_1,x                      ; $07DFD6 |
  REP #$20                                  ; $07DFD9 |
  LDA #$000A                                ; $07DFDB |
  STA !s_spr_gsu_morph_1_lo,x               ; $07DFDE |
  LDA $7860,x                               ; $07DFE1 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07DFE4 |
  PLX                                       ; $07DFE7 |
  JSL $03A31E                               ; $07DFE8 |
  LDX $12                                   ; $07DFEC |
  RTS                                       ; $07DFEE |

CODE_07DFEF:
  LDA #$0040                                ; $07DFEF |
  STA !s_spr_y_accel,x                      ; $07DFF2 |
  JMP CODE_07E042                           ; $07DFF5 |
  RTS                                       ; $07DFF8 |

  db $08, $09, $0A, $0A, $09, $08           ; $07DFF9 |

  LDX $12                                   ; $07DFFF |
  LDA $7860,x                               ; $07E001 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E004 |
  LDA $7860,x                               ; $07E007 |
  BIT #$0001                                ; $07E00A |
  BNE CODE_07E01A                           ; $07E00D |
  LDA !s_spr_facing_dir,x                   ; $07E00F |
  EOR #$0002                                ; $07E012 |
  STA !s_spr_facing_dir,x                   ; $07E015 |
  BRA CODE_07E042                           ; $07E018 |

CODE_07E01A:
  LDA !s_spr_timer_1,x                      ; $07E01A |
  BNE CODE_07E041                           ; $07E01D |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07E01F |
  BMI CODE_07E042                           ; $07E021 |
  SEP #$20                                  ; $07E023 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07E025 |
  LDA $DFF9,y                               ; $07E027 |
  STA !s_spr_anim_frame,x                   ; $07E02A |
  LDA #$05                                  ; $07E02D |
  STA !s_spr_timer_1,x                      ; $07E02F |
  REP #$20                                  ; $07E032 |
  CPY #$02                                  ; $07E034 |
  BNE CODE_07E041                           ; $07E036 |
  LDA !s_spr_facing_dir,x                   ; $07E038 |
  EOR #$0002                                ; $07E03B |
  STA !s_spr_facing_dir,x                   ; $07E03E |

CODE_07E041:
  RTS                                       ; $07E041 |

CODE_07E042:
  LDY !s_spr_facing_dir,x                   ; $07E042 |
  LDA $DD4E,y                               ; $07E045 |
  STA !s_spr_x_speed_lo,x                   ; $07E048 |
  SEP #$20                                  ; $07E04B |
  STZ !s_spr_anim_frame,x                   ; $07E04D |
  LDA #$05                                  ; $07E050 |
  STA !s_spr_timer_1,x                      ; $07E052 |
  LDA #$00                                  ; $07E055 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E057 |
  REP #$20                                  ; $07E059 |
  RTS                                       ; $07E05B |

  db $08, $0D, $0C, $0B, $0E                ; $07E05C |

  db $0A, $08, $10, $08, $60                ; $07E061 |

  dw $FFFE, $0002, $0002, $FFFE             ; $07E066 |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E06E |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E076 |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E07E |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E086 |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E08E |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E096 |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E09E |
  dw $FFFE, $0002, $0002, $FFFE             ; $07E0A6 |
  dw $0000, $0000, $0000, $0000             ; $07E0AE |
  dw $0000, $0000, $0000, $0000             ; $07E0B6 |
  dw $0000, $0000, $0000, $0000             ; $07E0BE |

  LDX $12                                   ; $07E0C6 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07E0C8 |
  CMP #$0004                                ; $07E0CA |
  BNE CODE_07E0E1                           ; $07E0CD |
  LDA !s_spr_timer_1,x                      ; $07E0CF |
  LSR A                                     ; $07E0D2 |
  BCS CODE_07E0E1                           ; $07E0D3 |
  ASL A                                     ; $07E0D5 |
  TAY                                       ; $07E0D6 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E0D7 |
  CLC                                       ; $07E0DA |
  ADC $E066,y                               ; $07E0DB |
  STA !s_spr_x_pixel_pos,x                  ; $07E0DE |

CODE_07E0E1:
  LDA !s_spr_timer_1,x                      ; $07E0E1 |
  BNE CODE_07E125                           ; $07E0E4 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07E0E6 |
  BMI CODE_07E126                           ; $07E0E8 |
  SEP #$20                                  ; $07E0EA |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07E0EC |
  LDA $E05C,y                               ; $07E0EE |
  STA !s_spr_anim_frame,x                   ; $07E0F1 |
  LDA $E061,y                               ; $07E0F4 |
  STA !s_spr_timer_1,x                      ; $07E0F7 |
  REP #$20                                  ; $07E0FA |
  CPY #$03                                  ; $07E0FC |
  BNE CODE_07E10F                           ; $07E0FE |
  LDA !s_spr_y_pixel_pos,x                  ; $07E100 |
  SEC                                       ; $07E103 |
  SBC #$0008                                ; $07E104 |
  STA !s_spr_y_pixel_pos,x                  ; $07E107 |
  STZ !s_spr_y_terrain_offset,x             ; $07E10A |
  BRA CODE_07E125                           ; $07E10D |

CODE_07E10F:
  CPY #$02                                  ; $07E10F |
  BNE CODE_07E125                           ; $07E111 |
  LDA #$FE00                                ; $07E113 |
  STA !s_spr_y_speed_lo,x                   ; $07E116 |
  LDA $7860,x                               ; $07E119 |
  AND #$FFFE                                ; $07E11C |
  STA $7860,x                               ; $07E11F |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E122 |

CODE_07E125:
  RTS                                       ; $07E125 |

CODE_07E126:
  JMP CODE_07E042                           ; $07E126 |

  dw $FFE0, $0020                           ; $07E129 |

  LDX $12                                   ; $07E12D |
  LDA !s_spr_facing_dir,x                   ; $07E12F |
  DEC A                                     ; $07E132 |
  EOR !s_spr_x_speed_lo,x                   ; $07E133 |
  BPL CODE_07E193                           ; $07E136 |
  LDA !s_spr_x_speed_lo,x                   ; $07E138 |
  BEQ CODE_07E193                           ; $07E13B |
  LDA $7860,x                               ; $07E13D |
  BIT #$0001                                ; $07E140 |
  BEQ CODE_07E191                           ; $07E143 |
  LDA !s_spr_bitwise_settings_1,x           ; $07E145 |
  ORA #$0200                                ; $07E148 |
  STA !s_spr_bitwise_settings_1,x           ; $07E14B |
  LDA $14                                   ; $07E14E |
  AND #$0003                                ; $07E150 |
  BNE CODE_07E191                           ; $07E153 |
  LDY !s_spr_facing_dir,x                   ; $07E155 |
  LDA $E129,y                               ; $07E158 |
  STA $00                                   ; $07E15B |
  LDA #$01E0                                ; $07E15D |
  JSL spawn_ambient_sprite                  ; $07E160 |
  LDA !s_spr_facing_dir,x                   ; $07E164 |
  EOR #$0002                                ; $07E167 |
  STA $73C0,y                               ; $07E16A |
  LDA #$0004                                ; $07E16D |
  STA $7782,y                               ; $07E170 |
  STA $7E4C,y                               ; $07E173 |
  LDA $00                                   ; $07E176 |
  STA $71E0,y                               ; $07E178 |
  LDA #$FFF0                                ; $07E17B |
  STA $71E2,y                               ; $07E17E |
  LDA !s_spr_x_pixel_pos,x                  ; $07E181 |
  STA $70A2,y                               ; $07E184 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E187 |
  CLC                                       ; $07E18A |
  ADC #$0014                                ; $07E18B |
  STA $7142,y                               ; $07E18E |

CODE_07E191:
  PLA                                       ; $07E191 |
  RTL                                       ; $07E192 |

CODE_07E193:
  LDA !s_spr_bitwise_settings_1,x           ; $07E193 |
  ORA #$0200                                ; $07E196 |
  STA !s_spr_bitwise_settings_1,x           ; $07E199 |
  STZ !s_spr_x_accel,x                      ; $07E19C |
  STZ !s_spr_x_speed_lo,x                   ; $07E19F |
  LDA #$0008                                ; $07E1A2 |
  STA !s_spr_timer_1,x                      ; $07E1A5 |
  LDA #$0001                                ; $07E1A8 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E1AB |
  LDA #$0006                                ; $07E1AD |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E1B0 |
  PLA                                       ; $07E1B2 |
  RTL                                       ; $07E1B3 |

  LDX $12                                   ; $07E1B4 |
  LDA !s_spr_timer_1,x                      ; $07E1B6 |
  BNE CODE_07E1CB                           ; $07E1B9 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07E1BB |
  BMI CODE_07E1CD                           ; $07E1BD |
  LDA #$000D                                ; $07E1BF |
  STA !s_spr_anim_frame,x                   ; $07E1C2 |
  LDA #$0008                                ; $07E1C5 |
  STA !s_spr_timer_1,x                      ; $07E1C8 |

CODE_07E1CB:
  PLA                                       ; $07E1CB |
  RTL                                       ; $07E1CC |

CODE_07E1CD:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $07E1CD |
  JSR CODE_07E1E4                           ; $07E1CF |
  BNE CODE_07E1DD                           ; $07E1D2 |
  LDA !s_spr_bitwise_settings_3,x           ; $07E1D4 |
  ORA #$0200                                ; $07E1D7 |
  STA !s_spr_bitwise_settings_3,x           ; $07E1DA |

CODE_07E1DD:
  JMP CODE_07E042                           ; $07E1DD |

  dw $016A, $016C                           ; $07E1E0 |

CODE_07E1E4:
  LDY #$02                                  ; $07E1E4 |
  LDA !s_spr_id,x                           ; $07E1E6 |

CODE_07E1E9:
  CMP $E1E0,y                               ; $07E1E9 |
  BEQ CODE_07E1F2                           ; $07E1EC |
  DEY                                       ; $07E1EE |
  DEY                                       ; $07E1EF |
  BPL CODE_07E1E9                           ; $07E1F0 |

CODE_07E1F2:
  RTS                                       ; $07E1F2 |

CODE_07E1F3:
  LDA $7860,x                               ; $07E1F3 |
  BIT #$000C                                ; $07E1F6 |
  BNE CODE_07E20F                           ; $07E1F9 |
  BRA CODE_07E229                           ; $07E1FB |

CODE_07E1FD:
  LDA $7860,x                               ; $07E1FD |
  BIT #$000C                                ; $07E200 |
  BNE CODE_07E20F                           ; $07E203 |
  BIT #$0001                                ; $07E205 |
  BNE CODE_07E229                           ; $07E208 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07E20A |
  BEQ CODE_07E229                           ; $07E20D |

CODE_07E20F:
  LDA #$0005                                ; $07E20F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E212 |
  SEP #$20                                  ; $07E214 |
  TAY                                       ; $07E216 |
  LDA $DFF9,y                               ; $07E217 |
  STA !s_spr_anim_frame,x                   ; $07E21A |
  LDA #$05                                  ; $07E21D |
  STA !s_spr_timer_1,x                      ; $07E21F |
  LDA #$02                                  ; $07E222 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E224 |
  REP #$20                                  ; $07E226 |
  PLA                                       ; $07E228 |

CODE_07E229:
  LDA $7860,x                               ; $07E229 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E22C |
  RTS                                       ; $07E22F |

  dw $016B, $016D                           ; $07E230 |

CODE_07E234:
  LDY #$02                                  ; $07E234 |
  LDA !s_spr_id,x                           ; $07E236 |

CODE_07E239:
  CMP $E230,y                               ; $07E239 |
  BEQ CODE_07E247                           ; $07E23C |
  DEY                                       ; $07E23E |
  DEY                                       ; $07E23F |
  BPL CODE_07E239                           ; $07E240 |
  LDA #$0168                                ; $07E242 |
  BRA CODE_07E24A                           ; $07E245 |

CODE_07E247:
  LDA #$0167                                ; $07E247 |

CODE_07E24A:
  TXY                                       ; $07E24A |
  JSL $03A377                               ; $07E24B |
  RTL                                       ; $07E24F |

CODE_07E250:
  LDY !s_spr_collision_id,x                 ; $07E250 |
  DEY                                       ; $07E253 |
  BMI CODE_07E2A0                           ; $07E254 |
  BEQ CODE_07E2A0                           ; $07E256 |
  LDA !s_spr_collision_state,y              ; $07E258 |
  BNE CODE_07E2A0                           ; $07E25B |
  LDA !s_spr_id,y                           ; $07E25D |
  CMP #$0169                                ; $07E260 |
  BCC CODE_07E2A0                           ; $07E263 |
  CMP #$016E                                ; $07E265 |
  BCS CODE_07E2A0                           ; $07E268 |
  LDA !s_spr_state,y                        ; $07E26A |
  CMP #$0010                                ; $07E26D |
  BNE CODE_07E2A0                           ; $07E270 |
  LDA !s_spr_facing_dir,x                   ; $07E272 |
  DEC A                                     ; $07E275 |
  STA $00                                   ; $07E276 |
  LDA !s_spr_x_hitbox_center,x              ; $07E278 |
  SEC                                       ; $07E27B |
  SBC !s_spr_x_hitbox_center,y              ; $07E27C |
  EOR $00                                   ; $07E27F |
  BPL CODE_07E2A0                           ; $07E281 |
  STZ !s_spr_x_speed_lo,x                   ; $07E283 |
  LDA #$0005                                ; $07E286 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E289 |
  SEP #$20                                  ; $07E28B |
  TAY                                       ; $07E28D |
  LDA $DFF9,y                               ; $07E28E |
  STA !s_spr_anim_frame,x                   ; $07E291 |
  LDA #$05                                  ; $07E294 |
  STA !s_spr_timer_1,x                      ; $07E296 |
  LDA #$02                                  ; $07E299 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E29B |
  REP #$20                                  ; $07E29D |
  PLA                                       ; $07E29F |

CODE_07E2A0:
  RTS                                       ; $07E2A0 |

  LDY !s_spr_collision_id,x                 ; $07E2A1 |
  DEY                                       ; $07E2A4 |
  BMI CODE_07E302                           ; $07E2A5 |
  BEQ CODE_07E302                           ; $07E2A7 |
  LDA !s_spr_collision_state,y              ; $07E2A9 |
  BEQ CODE_07E302                           ; $07E2AC |
  LDA !s_spr_id,y                           ; $07E2AE |
  CMP #$0167                                ; $07E2B1 |
  BCC CODE_07E2BB                           ; $07E2B4 |
  CMP #$0169                                ; $07E2B6 |
  BCC CODE_07E302                           ; $07E2B9 |

CODE_07E2BB:
  STZ $00                                   ; $07E2BB |
  LDA !s_spr_x_hitbox_center,x              ; $07E2BD |
  SEC                                       ; $07E2C0 |
  SBC !s_spr_x_hitbox_center,y              ; $07E2C1 |
  BPL CODE_07E2CA                           ; $07E2C4 |
  INC $00                                   ; $07E2C6 |
  INC $00                                   ; $07E2C8 |

CODE_07E2CA:
  TYX                                       ; $07E2CA |
  JSL $03B24B                               ; $07E2CB |
  LDX $12                                   ; $07E2CF |
  LDA !s_spr_id,x                           ; $07E2D1 |
  CMP #$016B                                ; $07E2D4 |
  BNE CODE_07E2DE                           ; $07E2D7 |
  LDA #$0167                                ; $07E2D9 |
  BRA CODE_07E2E1                           ; $07E2DC |

CODE_07E2DE:
  LDA #$0168                                ; $07E2DE |

CODE_07E2E1:
  TXY                                       ; $07E2E1 |
  JSL $03A377                               ; $07E2E2 |
  LDA #$0010                                ; $07E2E6 |
  STA !s_spr_state,x                        ; $07E2E9 |
  LDA #$0020                                ; $07E2EC |
  STA !s_spr_timer_2,x                      ; $07E2EF |
  LDA #$0001                                ; $07E2F2 |
  STA !s_spr_collision_state,x              ; $07E2F5 |
  LDY $00                                   ; $07E2F8 |
  LDA $D95C,y                               ; $07E2FA |
  STA !s_spr_x_speed_lo,x                   ; $07E2FD |
  PLY                                       ; $07E300 |
  PLA                                       ; $07E301 |

CODE_07E302:
  RTL                                       ; $07E302 |

CODE_07E303:
  LDA !s_player_invincibility_timer         ; $07E303 |
  BNE CODE_07E335                           ; $07E306 |
  LDY !s_spr_collision_id,x                 ; $07E308 |
  BPL CODE_07E335                           ; $07E30B |
  LDA !s_spr_x_player_dir,x                 ; $07E30D |
  AND #$00FF                                ; $07E310 |
  CMP !s_spr_facing_dir,x                   ; $07E313 |
  BEQ CODE_07E335                           ; $07E316 |
  STZ !s_spr_x_speed_lo,x                   ; $07E318 |
  LDA #$0005                                ; $07E31B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E31E |
  SEP #$20                                  ; $07E320 |
  TAY                                       ; $07E322 |
  LDA $DFF9,y                               ; $07E323 |
  STA !s_spr_anim_frame,x                   ; $07E326 |
  LDA #$05                                  ; $07E329 |
  STA !s_spr_timer_1,x                      ; $07E32B |
  LDA #$02                                  ; $07E32E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E330 |
  REP #$20                                  ; $07E332 |
  PLA                                       ; $07E334 |

CODE_07E335:
  RTS                                       ; $07E335 |

  LDY !s_spr_collision_id,x                 ; $07E336 |
  BPL CODE_07E35A                           ; $07E339 |
  LDA !s_player_ground_pound_state          ; $07E33B |
  BEQ CODE_07E35A                           ; $07E33E |
  LDA !s_spr_y_player_delta,x               ; $07E340 |
  SEC                                       ; $07E343 |
  SBC !s_player_hitbox_half_height          ; $07E344 |
  SEC                                       ; $07E347 |
  SBC !s_spr_hitbox_height,x                ; $07E348 |
  CMP #$FFF8                                ; $07E34B |
  BCC CODE_07E35A                           ; $07E34E |
  JSL $0CFF61                               ; $07E350 |
  PLY                                       ; $07E354 |
  PLA                                       ; $07E355 |
  JML $03B273                               ; $07E356 |

CODE_07E35A:
  RTL                                       ; $07E35A |

  LDY !s_spr_collision_id,x                 ; $07E35B |
  BPL CODE_07E398                           ; $07E35E |
  LDA !s_spr_y_player_delta,x               ; $07E360 |
  SEC                                       ; $07E363 |
  SBC !s_player_hitbox_half_height          ; $07E364 |
  SEC                                       ; $07E367 |
  SBC !s_spr_hitbox_height,x                ; $07E368 |
  CMP #$FFF8                                ; $07E36B |
  BCC CODE_07E398                           ; $07E36E |
  LDA !s_player_ground_pound_state          ; $07E370 |
  BEQ CODE_07E37F                           ; $07E373 |
  JSL $0CFF61                               ; $07E375 |
  PLY                                       ; $07E379 |
  PLA                                       ; $07E37A |
  JML $03B273                               ; $07E37B |

CODE_07E37F:
  LDA #$001C                                ; $07E37F |\ play sound #$001C
  JSL push_sound_queue                      ; $07E382 |/
  LDA #$000E                                ; $07E386 |
  STA !s_spr_state,x                        ; $07E389 |
  STZ !s_spr_x_speed_lo,x                   ; $07E38C |
  STZ !s_spr_y_speed_lo,x                   ; $07E38F |
  PLY                                       ; $07E392 |
  PLA                                       ; $07E393 |
  JML $03B20B                               ; $07E394 |

CODE_07E398:
  RTL                                       ; $07E398 |

CODE_07E399:
  LDA !s_spr_oam_1,x                        ; $07E399 |
  BIT #$0003                                ; $07E39C |
  BEQ CODE_07E3AC                           ; $07E39F |
  LDX #$08                                  ; $07E3A1 |
  LDA #$949D                                ; $07E3A3 |
  JSL r_gsu_init_1                          ; $07E3A6 | GSU init
  LDX $12                                   ; $07E3AA |

CODE_07E3AC:
  STZ !s_spr_anim_frame,x                   ; $07E3AC |
  LDA !s_spr_oam_1,x                        ; $07E3AF |
  AND #$07FC                                ; $07E3B2 |
  ORA #$0800                                ; $07E3B5 |
  STA !s_spr_oam_1,x                        ; $07E3B8 |
  BRA CODE_07E3C8                           ; $07E3BB |
  LDX #$08                                  ; $07E3BD |
  LDA #$949D                                ; $07E3BF |
  JSL r_gsu_init_1                          ; $07E3C2 | GSU init
  LDX $12                                   ; $07E3C6 |

CODE_07E3C8:
  LDA !s_spr_bitwise_settings_3,x           ; $07E3C8 |
  AND #$FFE0                                ; $07E3CB |
  STA !s_spr_bitwise_settings_3,x           ; $07E3CE |
  LDA !s_spr_oam_yxppccct,x                 ; $07E3D1 |
  ORA #$00B0                                ; $07E3D4 |
  STA !s_spr_oam_yxppccct,x                 ; $07E3D7 |
  RTL                                       ; $07E3DA |

  dw $0400, $FC00                           ; $07E3DB |

  LDA !s_spr_wildcard_1_lo,x                ; $07E3DF |
  BNE CODE_07E399                           ; $07E3E2 |
  LDX #$08                                  ; $07E3E4 |
  LDA #$949D                                ; $07E3E6 |
  JSL r_gsu_init_1                          ; $07E3E9 | GSU init
  LDX $12                                   ; $07E3ED |
  LDA #$0167                                ; $07E3EF |
  STA $00                                   ; $07E3F2 |
  LDA #$0169                                ; $07E3F4 |
  BRA CODE_07E411                           ; $07E3F7 |
  LDA !s_spr_wildcard_1_lo,x                ; $07E3F9 |
  BNE CODE_07E399                           ; $07E3FC |
  LDX #$08                                  ; $07E3FE |
  LDA #$949D                                ; $07E400 |
  JSL r_gsu_init_1                          ; $07E403 | GSU init
  LDX $12                                   ; $07E407 |
  LDA #$0168                                ; $07E409 |
  STA $00                                   ; $07E40C |
  LDA #$016A                                ; $07E40E |

CODE_07E411:
  TXY                                       ; $07E411 |
  JSL $03A377                               ; $07E412 |
  LDA !s_spr_x_player_dir,x                 ; $07E416 |
  AND #$00FF                                ; $07E419 |
  STA !s_spr_facing_dir,x                   ; $07E41C |
  TAY                                       ; $07E41F |
  LDA $E3DB,y                               ; $07E420 |
  STA !s_spr_x_speed_lo,x                   ; $07E423 |
  LDA #$0020                                ; $07E426 |
  STA !s_spr_timer_3,x                      ; $07E429 |
  LDA #$010A                                ; $07E42C |
  STA !s_spr_gsu_morph_1_lo,x               ; $07E42F |
  LDA $7860,x                               ; $07E432 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E435 |
  LDA #$0004                                ; $07E438 |
  STA !s_spr_wildcard_3_lo,x                ; $07E43B |
  LDA #$000C                                ; $07E43E |
  STA !s_spr_anim_frame,x                   ; $07E441 |
  LDA #$0020                                ; $07E444 |
  STA !s_spr_x_accel,x                      ; $07E447 |
  LDA !s_spr_bitwise_settings_1,x           ; $07E44A |
  AND #$FDFF                                ; $07E44D |
  STA !s_spr_bitwise_settings_1,x           ; $07E450 |
  LDA !s_spr_bitwise_settings_3,x           ; $07E453 |
  AND #$FCFF                                ; $07E456 |
  STA !s_spr_bitwise_settings_3,x           ; $07E459 |
  LDA #$0010                                ; $07E45C |
  STA !s_spr_state,x                        ; $07E45F |
  LDA $00                                   ; $07E462 |
  JSL spawn_sprite_active                   ; $07E464 |
  BCC CODE_07E482                           ; $07E468 |
  LDA #$0020                                ; $07E46A |
  STA !s_spr_timer_2,y                      ; $07E46D |
  LDA !s_spr_facing_dir,x                   ; $07E470 |
  STA !s_spr_facing_dir,y                   ; $07E473 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E476 |
  STA !s_spr_x_pixel_pos,y                  ; $07E479 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E47C |
  STA !s_spr_y_pixel_pos,y                  ; $07E47F |

CODE_07E482:
  RTL                                       ; $07E482 |

  dw $FF80, $0080                           ; $07E483 |

init_green_parakoopa:
  LDA #$002A                                ; $07E487 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07E48A |
  LDA #$0010                                ; $07E48D |
  STA !s_spr_y_accel,x                      ; $07E490 |
  LDA #$0100                                ; $07E493 |
  STA !s_spr_y_accel_ceiling,x              ; $07E496 |
  LDY !s_spr_facing_dir,x                   ; $07E499 |
  LDA $E483,y                               ; $07E49C |
  STA !s_spr_x_speed_lo,x                   ; $07E49F |
  LDA #$FE00                                ; $07E4A2 |
  STA !s_spr_y_speed_lo,x                   ; $07E4A5 |
  LDA #$0008                                ; $07E4A8 |
  STA !s_spr_anim_frame,x                   ; $07E4AB |
  LDA #$0002                                ; $07E4AE |
  STA !s_spr_timer_1,x                      ; $07E4B1 |
  LDA #$0000                                ; $07E4B4 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E4B7 |
  STZ !s_spr_wildcard_1_lo,x                ; $07E4B9 |
  RTL                                       ; $07E4BC |

  dw $0030, $FFD0                           ; $07E4BD |

  dw $0004, $FFFC                           ; $07E4C1 |

  dw $FEE0, $0120                           ; $07E4C5 |

  dw $FED0, $0130                           ; $07E4C9 |

  dw $F800, $0800                           ; $07E4CD |

init_red_parakoopa_horizontal:
  LDA #$002A                                ; $07E4D1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07E4D4 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E4D7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E4DA |
  AND #$0010                                ; $07E4DC |
  LSR A                                     ; $07E4DF |
  LSR A                                     ; $07E4E0 |
  LSR A                                     ; $07E4E1 |
  EOR #$0002                                ; $07E4E2 |
  STA !s_spr_facing_dir,x                   ; $07E4E5 |
  TAY                                       ; $07E4E8 |
  LDA $E4C5,y                               ; $07E4E9 |
  STA !s_spr_x_speed_lo,x                   ; $07E4EC |
  LDA $E4CD,y                               ; $07E4EF |
  STA !s_spr_x_accel_ceiling,x              ; $07E4F2 |
  STA !s_spr_y_accel_ceiling,x              ; $07E4F5 |
  LDA #$0004                                ; $07E4F8 |
  STA !s_spr_x_accel,x                      ; $07E4FB |
  LDA #$0008                                ; $07E4FE |
  STA !s_spr_y_accel,x                      ; $07E501 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E504 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07E507 |
  CLC                                       ; $07E509 |
  ADC $E4C1,y                               ; $07E50A |
  STA !s_spr_y_pixel_pos,x                  ; $07E50D |
  LDA #$0008                                ; $07E510 |
  STA !s_spr_anim_frame,x                   ; $07E513 |
  LDA #$0003                                ; $07E516 |
  STA !s_spr_timer_1,x                      ; $07E519 |
  STZ !s_spr_wildcard_1_lo,x                ; $07E51C |
  RTL                                       ; $07E51F |

init_red_parakoopa_vertical:
  LDA #$002A                                ; $07E520 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07E523 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E526 |
  AND #$0010                                ; $07E529 |
  LSR A                                     ; $07E52C |
  LSR A                                     ; $07E52D |
  LSR A                                     ; $07E52E |
  EOR #$0002                                ; $07E52F |
  TAY                                       ; $07E532 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E533 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E536 |
  LDA $E4C9,y                               ; $07E538 |
  STA !s_spr_y_speed_lo,x                   ; $07E53B |
  LDA $E4CD,y                               ; $07E53E |
  STA !s_spr_y_accel_ceiling,x              ; $07E541 |
  LDA #$0004                                ; $07E544 |
  STA !s_spr_y_accel,x                      ; $07E547 |
  LDA #$0008                                ; $07E54A |
  STA !s_spr_anim_frame,x                   ; $07E54D |
  LDA $E593,y                               ; $07E550 |
  STA !s_spr_timer_1,x                      ; $07E553 |
  STZ !s_spr_wildcard_1_lo,x                ; $07E556 |
  RTL                                       ; $07E559 |

main_green_parakoopa:
  LDA !s_spr_state,x                        ; $07E55A |
  CMP #$0008                                ; $07E55D |
  BNE CODE_07E56A                           ; $07E560 |
  STZ $00                                   ; $07E562 |
  JSR CODE_07FD34                           ; $07E564 |
  JMP CODE_07E234                           ; $07E567 |

CODE_07E56A:
  LDX #$08                                  ; $07E56A |
  LDA #$949D                                ; $07E56C |
  JSL r_gsu_init_1                          ; $07E56F | GSU init
  LDX $12                                   ; $07E573 |
  JSL $03AF23                               ; $07E575 |
  JSL $07E35B                               ; $07E579 |
  JSL $03A5B7                               ; $07E57D |
  JSL $07E6B7                               ; $07E581 |
  JSR CODE_07E6E9                           ; $07E585 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07E588 |
  TAX                                       ; $07E58A |
  JSR ($E58F,x)                             ; $07E58B |
  RTL                                       ; $07E58E |

  dw $E597                                  ; $07E58F |
  dw $E5CD                                  ; $07E591 |

  dw $0002, $0004                           ; $07E593 |

  LDX $12                                   ; $07E597 |
  LDA $7860,x                               ; $07E599 |
  BIT #$0001                                ; $07E59C |
  BNE CODE_07E5B8                           ; $07E59F |
  LDA !s_spr_timer_1,x                      ; $07E5A1 |
  BNE CODE_07E5B7                           ; $07E5A4 |
  DEC !s_spr_anim_frame,x                   ; $07E5A6 |
  BPL CODE_07E5B1                           ; $07E5A9 |
  LDA #$0008                                ; $07E5AB |
  STA !s_spr_anim_frame,x                   ; $07E5AE |

CODE_07E5B1:
  LDA #$0002                                ; $07E5B1 |
  STA !s_spr_timer_1,x                      ; $07E5B4 |

CODE_07E5B7:
  RTS                                       ; $07E5B7 |

CODE_07E5B8:
  STZ !s_spr_x_speed_lo,x                   ; $07E5B8 |
  LDA #$0008                                ; $07E5BB |
  STA !s_spr_timer_1,x                      ; $07E5BE |
  LDA #$0009                                ; $07E5C1 |
  STA !s_spr_anim_frame,x                   ; $07E5C4 |
  LDA #$0002                                ; $07E5C7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E5CA |
  RTS                                       ; $07E5CC |

  LDX $12                                   ; $07E5CD |
  LDA !s_spr_timer_1,x                      ; $07E5CF |
  BNE CODE_07E5D8                           ; $07E5D2 |
  JSL $07E499                               ; $07E5D4 |

CODE_07E5D8:
  RTS                                       ; $07E5D8 |

main_red_parakoopa_horizontal:
  LDA !s_spr_state,x                        ; $07E5D9 |
  CMP #$0008                                ; $07E5DC |
  BNE CODE_07E5E9                           ; $07E5DF |
  STZ $00                                   ; $07E5E1 |
  JSR CODE_07FD34                           ; $07E5E3 |
  JMP CODE_07E234                           ; $07E5E6 |

CODE_07E5E9:
  LDX #$08                                  ; $07E5E9 |
  LDA #$949D                                ; $07E5EB |
  JSL r_gsu_init_1                          ; $07E5EE | GSU init
  LDX $12                                   ; $07E5F2 |
  JSL $03AF23                               ; $07E5F4 |
  JSL $07E35B                               ; $07E5F8 |
  JSL $03A5B7                               ; $07E5FC |
  JSL $07E6B7                               ; $07E600 |
  LDY #$00                                  ; $07E604 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E606 |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $07E609 |
  BPL CODE_07E60F                           ; $07E60B |
  INY                                       ; $07E60D |
  INY                                       ; $07E60E |

CODE_07E60F:
  LDA $E4CD,y                               ; $07E60F |
  STA !s_spr_x_accel_ceiling,x              ; $07E612 |
  LDA !s_spr_facing_dir,x                   ; $07E615 |
  DEC A                                     ; $07E618 |
  EOR !s_spr_x_speed_lo,x                   ; $07E619 |
  BPL CODE_07E627                           ; $07E61C |
  LDA !s_spr_facing_dir,x                   ; $07E61E |
  EOR #$0002                                ; $07E621 |
  STA !s_spr_facing_dir,x                   ; $07E624 |

CODE_07E627:
  LDY #$00                                  ; $07E627 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E629 |
  CMP !s_spr_wildcard_5_lo_dp,x             ; $07E62C |
  BPL CODE_07E632                           ; $07E62E |
  INY                                       ; $07E630 |
  INY                                       ; $07E631 |

CODE_07E632:
  LDA $E4CD,y                               ; $07E632 |
  STA !s_spr_y_accel_ceiling,x              ; $07E635 |
  LDA !s_spr_timer_1,x                      ; $07E638 |
  BNE CODE_07E64E                           ; $07E63B |
  DEC !s_spr_anim_frame,x                   ; $07E63D |
  BPL CODE_07E648                           ; $07E640 |
  LDA #$0008                                ; $07E642 |
  STA !s_spr_anim_frame,x                   ; $07E645 |

CODE_07E648:
  LDA #$0003                                ; $07E648 |
  STA !s_spr_timer_1,x                      ; $07E64B |

CODE_07E64E:
  RTL                                       ; $07E64E |

main_red_parakoopa_vertical:
  LDA !s_spr_state,x                        ; $07E64F |
  CMP #$0008                                ; $07E652 |
  BNE CODE_07E65F                           ; $07E655 |
  STZ $00                                   ; $07E657 |
  JSR CODE_07FD34                           ; $07E659 |
  JMP CODE_07E234                           ; $07E65C |

CODE_07E65F:
  LDX #$08                                  ; $07E65F |
  LDA #$949D                                ; $07E661 |
  JSL r_gsu_init_1                          ; $07E664 | GSU init
  LDX $12                                   ; $07E668 |
  JSL $03AF23                               ; $07E66A |
  JSL $07E35B                               ; $07E66E |
  JSL $03A5B7                               ; $07E672 |
  JSL $07E6B7                               ; $07E676 |
  LDY #$00                                  ; $07E67A |
  LDA !s_spr_y_pixel_pos,x                  ; $07E67C |
  CMP !s_spr_wildcard_4_lo_dp,x             ; $07E67F |
  BPL CODE_07E685                           ; $07E681 |
  INY                                       ; $07E683 |
  INY                                       ; $07E684 |

CODE_07E685:
  LDA $E4CD,y                               ; $07E685 |
  STA !s_spr_y_accel_ceiling,x              ; $07E688 |
  LDA !s_spr_timer_1,x                      ; $07E68B |
  BNE CODE_07E6B6                           ; $07E68E |
  DEC !s_spr_anim_frame,x                   ; $07E690 |
  BPL CODE_07E69B                           ; $07E693 |
  LDA #$0008                                ; $07E695 |
  STA !s_spr_anim_frame,x                   ; $07E698 |

CODE_07E69B:
  LDY #$00                                  ; $07E69B |
  LDA #$0100                                ; $07E69D |
  BIT !s_spr_y_accel_ceiling,x              ; $07E6A0 |
  BPL CODE_07E6A8                           ; $07E6A3 |
  LDA #$FF00                                ; $07E6A5 |

CODE_07E6A8:
  CLC                                       ; $07E6A8 |
  ADC !s_spr_y_speed_lo,x                   ; $07E6A9 |
  BMI CODE_07E6B0                           ; $07E6AC |
  INY                                       ; $07E6AE |
  INY                                       ; $07E6AF |

CODE_07E6B0:
  LDA $E593,y                               ; $07E6B0 |
  STA !s_spr_timer_1,x                      ; $07E6B3 |

CODE_07E6B6:
  RTL                                       ; $07E6B6 |

  LDY !s_spr_collision_id,x                 ; $07E6B7 |
  DEY                                       ; $07E6BA |
  BMI CODE_07E6E8                           ; $07E6BB |
  BEQ CODE_07E6E8                           ; $07E6BD |
  LDA !s_spr_state,y                        ; $07E6BF |
  CMP #$0010                                ; $07E6C2 |
  BNE CODE_07E6E8                           ; $07E6C5 |
  LDA !s_spr_collision_state,y              ; $07E6C7 |
  BEQ CODE_07E6E8                           ; $07E6CA |
  LDA !s_spr_id,y                           ; $07E6CC |
  CMP #$0167                                ; $07E6CF |
  BCC CODE_07E6D9                           ; $07E6D2 |
  CMP #$0169                                ; $07E6D4 |
  BCC CODE_07E6E8                           ; $07E6D7 |

CODE_07E6D9:
  TYX                                       ; $07E6D9 |
  JSL $03B24B                               ; $07E6DA |
  LDX $12                                   ; $07E6DE |
  LDA #$000E                                ; $07E6E0 |
  STA !s_spr_state,x                        ; $07E6E3 |
  PLY                                       ; $07E6E6 |
  PLA                                       ; $07E6E7 |

CODE_07E6E8:
  RTL                                       ; $07E6E8 |

CODE_07E6E9:
  LDY !s_spr_collision_id,x                 ; $07E6E9 |
  DEY                                       ; $07E6EC |
  BMI CODE_07E72F                           ; $07E6ED |
  BEQ CODE_07E72F                           ; $07E6EF |
  LDA !s_spr_state,y                        ; $07E6F1 |
  CMP #$0010                                ; $07E6F4 |
  BNE CODE_07E72F                           ; $07E6F7 |
  LDA !s_spr_collision_state,y              ; $07E6F9 |
  BNE CODE_07E72F                           ; $07E6FC |
  LDA !s_spr_id,y                           ; $07E6FE |
  CMP #$0169                                ; $07E701 |
  BCC CODE_07E72F                           ; $07E704 |
  CMP #$016E                                ; $07E706 |
  BCS CODE_07E72F                           ; $07E709 |
  LDA !s_spr_facing_dir,x                   ; $07E70B |
  DEC A                                     ; $07E70E |
  STA $00                                   ; $07E70F |
  LDA !s_spr_x_hitbox_center,x              ; $07E711 |
  SEC                                       ; $07E714 |
  SBC !s_spr_x_hitbox_center,y              ; $07E715 |
  EOR $00                                   ; $07E718 |
  BPL CODE_07E72F                           ; $07E71A |
  LDA !s_spr_facing_dir,x                   ; $07E71C |
  EOR #$0002                                ; $07E71F |
  STA !s_spr_facing_dir,x                   ; $07E722 |
  LDA !s_spr_x_speed_lo,x                   ; $07E725 |
  EOR #$FFFF                                ; $07E728 |
  INC A                                     ; $07E72B |
  STA !s_spr_x_speed_lo,x                   ; $07E72C |

CODE_07E72F:
  RTS                                       ; $07E72F |

  LDA !s_spr_timer_4,x                      ; $07E730 |
  BNE CODE_07E740                           ; $07E733 |
  STZ $00                                   ; $07E735 |
  JSR CODE_07FD34                           ; $07E737 |
  LDA #$FFFF                                ; $07E73A |
  STA !s_spr_timer_4,x                      ; $07E73D |

CODE_07E740:
  LDA !s_spr_wildcard_1_lo,x                ; $07E740 |
  BEQ CODE_07E748                           ; $07E743 |
  JMP CODE_07E399                           ; $07E745 |

CODE_07E748:
  LDA #$016B                                ; $07E748 |
  BRA CODE_07E768                           ; $07E74B |
  LDA !s_spr_timer_4,x                      ; $07E74D |
  BNE CODE_07E75D                           ; $07E750 |
  STZ $00                                   ; $07E752 |
  JSR CODE_07FD34                           ; $07E754 |
  LDA #$FFFF                                ; $07E757 |
  STA !s_spr_timer_4,x                      ; $07E75A |

CODE_07E75D:
  LDA !s_spr_wildcard_1_lo,x                ; $07E75D |
  BEQ CODE_07E765                           ; $07E760 |
  JMP CODE_07E399                           ; $07E762 |

CODE_07E765:
  LDA #$016C                                ; $07E765 |

CODE_07E768:
  PHA                                       ; $07E768 |
  LDX #$08                                  ; $07E769 |
  LDA #$949D                                ; $07E76B |
  JSL r_gsu_init_1                          ; $07E76E | GSU init
  PLA                                       ; $07E772 |
  LDX $12                                   ; $07E773 |
  TXY                                       ; $07E775 |
  JSL $03A377                               ; $07E776 |
  LDA #$0010                                ; $07E77A |
  STA !s_spr_state,x                        ; $07E77D |
  LDA #$000A                                ; $07E780 |
  STA !s_spr_gsu_morph_1_lo,x               ; $07E783 |
  LDA $7860,x                               ; $07E786 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E789 |
  RTL                                       ; $07E78C |

  dw $0018, $0018, $0018, $0018             ; $07E78D |
  dw $0010, $0008, $0004, $0003             ; $07E795 |
  dw $0000, $0000, $0000, $0000             ; $07E79D |
  dw $0000, $0001, $0000, $0004             ; $07E7A5 |
  dw $0008, $000C                           ; $07E7AD |

  dw $FF80, $0080                           ; $07E7B1 |

init_aqua_lakitu:
  LDY !s_spr_wildcard_1_lo,x                ; $07E7B5 |
  BNE CODE_07E7CD                           ; $07E7B8 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E7BA |
  AND #$0010                                ; $07E7BD |
  BEQ CODE_07E7C4                           ; $07E7C0 |
  INY                                       ; $07E7C2 |
  INY                                       ; $07E7C3 |

CODE_07E7C4:
  SEP #$20                                  ; $07E7C4 |
  TYA                                       ; $07E7C6 |
  INC A                                     ; $07E7C7 |
  STA !s_spr_wildcard_1_lo,x                ; $07E7C8 |
  REP #$20                                  ; $07E7CB |

CODE_07E7CD:
  LDA #$0004                                ; $07E7CD |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E7D0 |
  JSR CODE_07E842                           ; $07E7D2 |
  RTL                                       ; $07E7D5 |

main_aqua_lakitu:
  LDA !s_spr_state,x                        ; $07E7D6 |
  CMP #$000C                                ; $07E7D9 |
  BEQ CODE_07E7E3                           ; $07E7DC |
  CMP #$0008                                ; $07E7DE |
  BNE CODE_07E7E9                           ; $07E7E1 |

CODE_07E7E3:
  LDA #$0012                                ; $07E7E3 |
  STA !s_spr_anim_frame,x                   ; $07E7E6 |

CODE_07E7E9:
  LDY !s_spr_draw_priority,x                ; $07E7E9 |
  BMI CODE_07E813                           ; $07E7EC |
  LDA !s_spr_anim_frame,x                   ; $07E7EE |
  CMP #$000B                                ; $07E7F1 |
  BNE CODE_07E813                           ; $07E7F4 |
  LDA $14                                   ; $07E7F6 |
  AND #$0006                                ; $07E7F8 |
  TAY                                       ; $07E7FB |
  LDA $A9BE,y                               ; $07E7FC |
  STA $00                                   ; $07E7FF |
  REP #$10                                  ; $07E801 |
  LDY !s_spr_oam_pointer,x                  ; $07E803 |
  LDA $6014,y                               ; $07E806 |
  AND #$F1FF                                ; $07E809 |
  ORA $00                                   ; $07E80C |
  STA $6014,y                               ; $07E80E |
  SEP #$10                                  ; $07E811 |

CODE_07E813:
  JSL $03AF23                               ; $07E813 |
  JSR CODE_07EADE                           ; $07E817 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $07E81A |
  TYX                                       ; $07E81C |
  JSR ($E825,x)                             ; $07E81D |
  JSL $03A5B7                               ; $07E820 |
  RTL                                       ; $07E824 |

  dw $E873                                  ; $07E825 |
  dw $E915                                  ; $07E827 |
  dw $E82B                                  ; $07E829 |

  LDX $12                                   ; $07E82B |
  LDA !s_spr_cam_x_pos,x                    ; $07E82D |
  CMP #$00F0                                ; $07E830 |
  BCS CODE_07E872                           ; $07E833 |
  LDA !s_spr_cam_y_pos,x                    ; $07E835 |
  CMP #$00D0                                ; $07E838 |
  BCS CODE_07E872                           ; $07E83B |
  LDA #$0002                                ; $07E83D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E840 |

CODE_07E842:
  LDA !s_spr_bitwise_settings_1,x           ; $07E842 |
  AND #$7F9F                                ; $07E845 |
  STA !s_spr_bitwise_settings_1,x           ; $07E848 |
  LDA !s_spr_oam_1,x                        ; $07E84B |
  ORA #$0100                                ; $07E84E |
  STA !s_spr_oam_1,x                        ; $07E851 |
  LDA #$000C                                ; $07E854 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07E857 |
  SEP #$20                                  ; $07E859 |
  TAY                                       ; $07E85B |
  LDA $E8AE,y                               ; $07E85C |
  STA !s_spr_timer_1,x                      ; $07E85F |
  LDA $E896,y                               ; $07E862 |
  STA !s_spr_anim_frame,x                   ; $07E865 |
  ASL A                                     ; $07E868 |
  TAY                                       ; $07E869 |
  REP #$20                                  ; $07E86A |
  LDA $E78D,y                               ; $07E86C |
  STA !s_spr_y_hitbox_offset,x              ; $07E86F |

CODE_07E872:
  RTS                                       ; $07E872 |

  LDX $12                                   ; $07E873 |
  JSR CODE_07EA77                           ; $07E875 |
  LDA !s_spr_timer_1,x                      ; $07E878 |
  BNE CODE_07E895                           ; $07E87B |
  LDA #$0008                                ; $07E87D |
  STA !s_spr_timer_1,x                      ; $07E880 |
  LDA !s_spr_anim_frame,x                   ; $07E883 |
  INC A                                     ; $07E886 |
  AND #$0001                                ; $07E887 |
  STA !s_spr_anim_frame,x                   ; $07E88A |
  ASL A                                     ; $07E88D |
  TAY                                       ; $07E88E |
  LDA $E78D,y                               ; $07E88F |
  STA !s_spr_y_hitbox_offset,x              ; $07E892 |

CODE_07E895:
  RTS                                       ; $07E895 |

  db $01, $02, $03, $11, $10, $0F, $0D, $0E ; $07E896 |
  db $0D, $0C, $0B, $09, $08, $09, $0A, $09 ; $07E89E |
  db $08, $07, $06, $05, $04, $03, $02, $01 ; $07E8A6 |

  db $04, $04, $38, $02, $02, $02, $02, $04 ; $07E8AE |
  db $02, $20, $40, $20, $04, $02, $02, $02 ; $07E8B6 |
  db $02, $02, $02, $02, $02, $20, $02, $02 ; $07E8BE |
  db $00, $FE, $00, $02, $00, $FE, $00, $02 ; $07E8C6 |
  db $00, $00, $00, $00, $80, $FF, $80, $FF ; $07E8CE |

  dw $FFC0, $0040, $FFD0, $0030             ; $07E8D6 |

  dw $0010, $0010, $001C, $001C             ; $07E8DE |

CODE_07E8E6:
  LDA #$0008                                ; $07E8E6 |
  STA !s_spr_timer_1,x                      ; $07E8E9 |
  LDA #$0000                                ; $07E8EC |
  STA !s_spr_anim_frame,x                   ; $07E8EF |
  ASL A                                     ; $07E8F2 |
  TAY                                       ; $07E8F3 |
  LDA $E78D,y                               ; $07E8F4 |
  STA !s_spr_y_hitbox_offset,x              ; $07E8F7 |
  LDA #$0080                                ; $07E8FA |
  STA !s_spr_timer_2,x                      ; $07E8FD |
  LDY !s_spr_wildcard_1_lo,x                ; $07E900 |
  DEY                                       ; $07E903 |
  BNE CODE_07E90F                           ; $07E904 |
  LDY !s_spr_facing_dir,x                   ; $07E906 |
  LDA $E7B1,y                               ; $07E909 |
  STA !s_spr_x_speed_lo,x                   ; $07E90C |

CODE_07E90F:
  LDA #$0000                                ; $07E90F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07E912 |
  RTS                                       ; $07E914 |

  LDX $12                                   ; $07E915 |
  LDA !s_spr_cam_x_pos,x                    ; $07E917 |
  ORA !s_spr_cam_y_pos,x                    ; $07E91A |
  AND #$FF00                                ; $07E91D |
  BNE CODE_07E8E6                           ; $07E920 |
  LDA !s_spr_timer_1,x                      ; $07E922 |
  BEQ CODE_07E92A                           ; $07E925 |
  JMP CODE_07E9AA                           ; $07E927 |

CODE_07E92A:
  DEC !s_spr_wildcard_4_lo_dp,x             ; $07E92A |
  BMI CODE_07E8E6                           ; $07E92C |
  SEP #$20                                  ; $07E92E |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $07E930 |
  LDA $E8AE,y                               ; $07E932 |
  STA !s_spr_timer_1,x                      ; $07E935 |
  LDA $E896,y                               ; $07E938 |
  STA !s_spr_anim_frame,x                   ; $07E93B |
  ASL A                                     ; $07E93E |
  TAY                                       ; $07E93F |
  REP #$20                                  ; $07E940 |
  LDA $E78D,y                               ; $07E942 |
  STA !s_spr_y_hitbox_offset,x              ; $07E945 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07E948 |
  CMP #$0013                                ; $07E94A |
  BNE CODE_07E97A                           ; $07E94D |
  LDA #$0201                                ; $07E94F |
  JSL spawn_ambient_sprite                  ; $07E952 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E956 |
  STA $70A2,y                               ; $07E959 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E95C |
  CLC                                       ; $07E95F |
  ADC #$0008                                ; $07E960 |
  STA $7142,y                               ; $07E963 |
  LDA #$0002                                ; $07E966 |
  STA $7782,y                               ; $07E969 |
  LDA #$0005                                ; $07E96C |
  STA $73C2,y                               ; $07E96F |
  LDA #$0003                                ; $07E972 |\ play sound #$0003
  JSL push_sound_queue                      ; $07E975 |/
  RTS                                       ; $07E979 |

CODE_07E97A:
  CMP #$0002                                ; $07E97A |
  BNE CODE_07E9E3                           ; $07E97D |
  LDA #$01BA                                ; $07E97F |
  JSL spawn_ambient_sprite                  ; $07E982 |
  LDA !s_spr_x_pixel_pos,x                  ; $07E986 |
  STA $70A2,y                               ; $07E989 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E98C |
  SEC                                       ; $07E98F |
  SBC #$0008                                ; $07E990 |
  STA $7142,y                               ; $07E993 |
  LDA #$001A                                ; $07E996 |
  STA $7E4C,y                               ; $07E999 |
  LDA #$0003                                ; $07E99C |
  STA $7782,y                               ; $07E99F |
  LDA #$0003                                ; $07E9A2 |\ play sound #$0003
  JSL push_sound_queue                      ; $07E9A5 |/
  RTS                                       ; $07E9A9 |

CODE_07E9AA:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07E9AA |

CODE_07E9AC:
  CMP #$000A                                ; $07E9AC |
  BNE CODE_07E9E2                           ; $07E9AF |

CODE_07E9B1:
  LDY !s_spr_wildcard_1_lo,x                ; $07E9B1 |
  DEY                                       ; $07E9B4 |
  TYA                                       ; $07E9B5 |
  ASL A                                     ; $07E9B6 |
  ORA !s_spr_facing_dir,x                   ; $07E9B7 |
  TAY                                       ; $07E9BA |
  LDA !s_spr_x_pixel_pos,x                  ; $07E9BB |
  CLC                                       ; $07E9BE |
  ADC $E8D6,y                               ; $07E9BF |
  STA $00                                   ; $07E9C2 |
  LDA !s_spr_y_pixel_pos,x                  ; $07E9C4 |
  SEC                                       ; $07E9C7 |
  SBC $E8DE,y                               ; $07E9C8 |
  STA $02                                   ; $07E9CB |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07E9CD |
  STA $04                                   ; $07E9D0 |
  JSL $07FCB8                               ; $07E9D2 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07E9D6 |
  INC A                                     ; $07E9D9 |
  CMP #$0020                                ; $07E9DA |
  BCS CODE_07E9E2                           ; $07E9DD |
  STA !s_spr_gsu_morph_2_lo,x               ; $07E9DF |

CODE_07E9E2:
  RTS                                       ; $07E9E2 |

CODE_07E9E3:
  CMP #$0012                                ; $07E9E3 |
  BNE CODE_07E9FB                           ; $07E9E6 |
  LDA !s_spr_bitwise_settings_1,x           ; $07E9E8 |
  AND #$7F9F                                ; $07E9EB |
  STA !s_spr_bitwise_settings_1,x           ; $07E9EE |
  LDA !s_spr_oam_1,x                        ; $07E9F1 |
  ORA #$0100                                ; $07E9F4 |
  STA !s_spr_oam_1,x                        ; $07E9F7 |
  RTS                                       ; $07E9FA |

CODE_07E9FB:
  CMP #$0004                                ; $07E9FB |
  BNE CODE_07EA13                           ; $07E9FE |
  LDA !s_spr_bitwise_settings_1,x           ; $07EA00 |
  ORA #$C060                                ; $07EA03 |
  STA !s_spr_bitwise_settings_1,x           ; $07EA06 |
  LDA !s_spr_oam_1,x                        ; $07EA09 |
  AND #$FEFF                                ; $07EA0C |
  STA !s_spr_oam_1,x                        ; $07EA0F |
  RTS                                       ; $07EA12 |

CODE_07EA13:
  CMP #$000A                                ; $07EA13 |
  BNE CODE_07EA1D                           ; $07EA16 |
  STZ !s_spr_gsu_morph_2_lo,x               ; $07EA18 |
  BRA CODE_07E9B1                           ; $07EA1B |

CODE_07EA1D:
  CMP #$0009                                ; $07EA1D |
  BNE CODE_07E9AC                           ; $07EA20 |
  LDY !s_spr_wildcard_1_lo,x                ; $07EA22 |
  DEY                                       ; $07EA25 |
  TYA                                       ; $07EA26 |
  ASL A                                     ; $07EA27 |
  ORA !s_spr_facing_dir,x                   ; $07EA28 |
  TAY                                       ; $07EA2B |
  PHY                                       ; $07EA2C |
  LDA !s_spr_x_pixel_pos,x                  ; $07EA2D |
  CLC                                       ; $07EA30 |
  ADC $E8D6,y                               ; $07EA31 |
  STA $00                                   ; $07EA34 |
  LDA !s_spr_y_pixel_pos,x                  ; $07EA36 |
  SEC                                       ; $07EA39 |
  SBC $E8DE,y                               ; $07EA3A |
  STA $02                                   ; $07EA3D |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07EA3F |
  STA $04                                   ; $07EA42 |
  JSL $07FCB3                               ; $07EA44 |
  PLY                                       ; $07EA48 |
  LDA $E8C6,y                               ; $07EA49 |
  STA $00                                   ; $07EA4C |
  LDA $E8CE,y                               ; $07EA4E |
  STA $02                                   ; $07EA51 |
  LDA #$0099                                ; $07EA53 |
  JSL spawn_sprite_init                     ; $07EA56 |
  BCC CODE_07E9E2                           ; $07EA5A |
  LDA !s_spr_x_pixel_pos,x                  ; $07EA5C |
  STA !s_spr_x_pixel_pos,y                  ; $07EA5F |
  LDA !s_spr_y_pixel_pos,x                  ; $07EA62 |
  SEC                                       ; $07EA65 |
  SBC #$0010                                ; $07EA66 |
  STA !s_spr_y_pixel_pos,y                  ; $07EA69 |
  LDA $00                                   ; $07EA6C |
  STA !s_spr_x_speed_lo,y                   ; $07EA6E |
  LDA $02                                   ; $07EA71 |
  STA !s_spr_y_speed_lo,y                   ; $07EA73 |
  RTS                                       ; $07EA76 |

CODE_07EA77:
  LDA !s_spr_timer_2,x                      ; $07EA77 |
  BNE CODE_07EAD9                           ; $07EA7A |
  LDA !s_spr_x_hitbox_center,x              ; $07EA7C |
  SEC                                       ; $07EA7F |
  SBC !s_player_center_x                    ; $07EA80 |
  CLC                                       ; $07EA83 |
  ADC #$0020                                ; $07EA84 |
  CMP #$0040                                ; $07EA87 |
  BCC CODE_07EAD9                           ; $07EA8A |
  SEC                                       ; $07EA8C |
  SBC #$0020                                ; $07EA8D |
  CLC                                       ; $07EA90 |
  ADC #$0060                                ; $07EA91 |
  CMP #$00C0                                ; $07EA94 |
  BCS CODE_07EAD9                           ; $07EA97 |
  LDA !s_spr_y_hitbox_center,x              ; $07EA99 |
  SEC                                       ; $07EA9C |
  SBC !s_player_center_y                    ; $07EA9D |
  CLC                                       ; $07EAA0 |
  ADC #$0040                                ; $07EAA1 |
  CMP #$0080                                ; $07EAA4 |
  BCS CODE_07EAD9                           ; $07EAA7 |
  LDA !s_spr_x_player_dir,x                 ; $07EAA9 |
  AND #$00FF                                ; $07EAAC |
  STA !s_spr_facing_dir,x                   ; $07EAAF |
  STZ !s_spr_x_speed_lo,x                   ; $07EAB2 |
  LDA #$0017                                ; $07EAB5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07EAB8 |
  SEP #$20                                  ; $07EABA |
  TAY                                       ; $07EABC |
  LDA $E8AE,y                               ; $07EABD |
  STA !s_spr_timer_1,x                      ; $07EAC0 |
  LDA $E896,y                               ; $07EAC3 |
  STA !s_spr_anim_frame,x                   ; $07EAC6 |
  ASL A                                     ; $07EAC9 |
  TAY                                       ; $07EACA |
  REP #$20                                  ; $07EACB |
  LDA $E78D,y                               ; $07EACD |
  STA !s_spr_y_hitbox_offset,x              ; $07EAD0 |
  LDA #$0002                                ; $07EAD3 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07EAD6 |
  PLA                                       ; $07EAD8 |

CODE_07EAD9:
  RTS                                       ; $07EAD9 |

  dw $0000, $0010                           ; $07EADA |

CODE_07EADE:
  LDY !s_spr_wildcard_1_lo,x                ; $07EADE |
  DEY                                       ; $07EAE1 |
  BNE CODE_07EB44                           ; $07EAE2 |
  LDY !s_spr_facing_dir,x                   ; $07EAE4 |
  LDA !s_spr_x_pixel_pos,x                  ; $07EAE7 |
  CLC                                       ; $07EAEA |
  ADC $EADA,y                               ; $07EAEB |
  STA !gsu_r8                               ; $07EAEE |
  LDA !s_spr_y_pixel_pos,x                  ; $07EAF1 |
  CLC                                       ; $07EAF4 |
  ADC #$0008                                ; $07EAF5 |
  STA !gsu_r0                               ; $07EAF8 |
  LDX #$0A                                  ; $07EAFB |
  LDA #$CE2F                                ; $07EAFD |
  JSL r_gsu_init_3                          ; $07EB00 | GSU init
  LDX $12                                   ; $07EB04 |
  LDA !gsu_r6                               ; $07EB06 |
  CMP #$77C2                                ; $07EB09 |
  BCC CODE_07EB1D                           ; $07EB0C |
  CMP #$77C6                                ; $07EB0E |
  BCC CODE_07EB44                           ; $07EB11 |
  CMP #$77D0                                ; $07EB13 |
  BCC CODE_07EB1D                           ; $07EB16 |
  CMP #$77D6                                ; $07EB18 |
  BCC CODE_07EB44                           ; $07EB1B |

CODE_07EB1D:
  LDA !s_spr_facing_dir,x                   ; $07EB1D |
  EOR #$0002                                ; $07EB20 |
  STA !s_spr_facing_dir,x                   ; $07EB23 |
  LDA !s_spr_x_speed_lo,x                   ; $07EB26 |
  EOR #$FFFF                                ; $07EB29 |
  INC A                                     ; $07EB2C |
  STA !s_spr_x_speed_lo,x                   ; $07EB2D |
  LDA !s_spr_x_pixel_pos,x                  ; $07EB30 |
  SEC                                       ; $07EB33 |
  SBC !s_spr_x_delta_lo,x                   ; $07EB34 |
  STA !s_spr_x_pixel_pos,x                  ; $07EB37 |
  LDA !s_spr_x_hitbox_center,x              ; $07EB3A |
  SEC                                       ; $07EB3D |
  SBC !s_spr_x_delta_lo,x                   ; $07EB3E |
  STA !s_spr_x_hitbox_center,x              ; $07EB41 |

CODE_07EB44:
  RTS                                       ; $07EB44 |

  LDA #$0012                                ; $07EB45 |
  STA !s_spr_anim_frame,x                   ; $07EB48 |
  RTL                                       ; $07EB4B |

; spawns one or two
init_thunder_lakitu:
  LDA #$0001                                ; $07EB4C |
  STA !r_fire_lakitu_gen_flag               ; $07EB4F |
  LDA !r_reg_tm_mirror                      ; $07EB52 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07EB55 |
  LDA #$0010                                ; $07EB57 |
  STA !s_spr_x_accel,x                      ; $07EB5A |
  STA !s_spr_y_accel,x                      ; $07EB5D |
  LDA #$0200                                ; $07EB60 |
  STA !s_spr_y_accel_ceiling,x              ; $07EB63 |
  STA !s_spr_x_accel_ceiling,x              ; $07EB66 |
  LDA !s_spr_x_pixel_pos,x                  ; $07EB69 |
  AND #$0010                                ; $07EB6C |
  BEQ CODE_07EBAD                           ; $07EB6F |
  LDY !r_cam_moving_dir_x                   ; $07EB71 |
  LDA !r_bg1_cam_x                          ; $07EB74 |
  CLC                                       ; $07EB77 |
  ADC $F0C3,y                               ; $07EB78 |
  STA $00                                   ; $07EB7B |
  LDA #$0166                                ; $07EB7D |
  JSL spawn_sprite_active                   ; $07EB80 |
  BCC CODE_07EBAD                           ; $07EB84 |
  LDA !r_reg_tm_mirror                      ; $07EB86 |
  STA !s_spr_wildcard_5_lo,y                ; $07EB89 |
  LDA $00                                   ; $07EB8C |
  STA !s_spr_x_pixel_pos,y                  ; $07EB8E |
  LDA !r_bg1_cam_y                          ; $07EB91 |
  SEC                                       ; $07EB94 |
  SBC #$0030                                ; $07EB95 |
  STA !s_spr_y_pixel_pos,y                  ; $07EB98 |
  LDA #$0010                                ; $07EB9B |
  STA !s_spr_x_accel,y                      ; $07EB9E |
  STA !s_spr_y_accel,y                      ; $07EBA1 |
  LDA #$0200                                ; $07EBA4 |
  STA !s_spr_y_accel_ceiling,y              ; $07EBA7 |
  STA !s_spr_x_accel_ceiling,y              ; $07EBAA |

CODE_07EBAD:
  RTL                                       ; $07EBAD |

; spawns one or two
main_thunder_lakitu:
  LDA !s_spr_state,x                        ; $07EBAE |
  CMP #$0010                                ; $07EBB1 |
  BNE CODE_07EBBB                           ; $07EBB4 |
  JSR CODE_07EF4A                           ; $07EBB6 |
  BRA CODE_07EC14                           ; $07EBB9 |

CODE_07EBBB:
  PHA                                       ; $07EBBB |
  JSR CODE_07EFD2                           ; $07EBBC |
  PLA                                       ; $07EBBF |
  CMP #$0008                                ; $07EBC0 |
  BNE CODE_07EC14                           ; $07EBC3 |
  LDA #$011C                                ; $07EBC5 |
  JSL spawn_sprite_active                   ; $07EBC8 |
  BCC CODE_07EC06                           ; $07EBCC |
  LDA !s_spr_x_pixel_pos,x                  ; $07EBCE |
  STA !s_spr_x_pixel_pos,y                  ; $07EBD1 |
  LDA !s_spr_y_pixel_pos,x                  ; $07EBD4 |
  CLC                                       ; $07EBD7 |
  ADC #$0008                                ; $07EBD8 |
  STA !s_spr_y_pixel_pos,y                  ; $07EBDB |
  LDA #$0008                                ; $07EBDE |
  STA !s_spr_state,y                        ; $07EBE1 |
  TYA                                       ; $07EBE4 |
  AND #$00FF                                ; $07EBE5 |
  INC A                                     ; $07EBE8 |
  STA $6162                                 ; $07EBE9 |
  LDA !s_spr_oam_1,y                        ; $07EBEC |
  AND #$FFF3                                ; $07EBEF |
  STA !s_spr_oam_1,y                        ; $07EBF2 |
  TXA                                       ; $07EBF5 |
  INC A                                     ; $07EBF6 |
  STA !s_spr_wildcard_3_lo,y                ; $07EBF7 |
  LDA #$000E                                ; $07EBFA |
  STA !s_spr_state,x                        ; $07EBFD |
  JSL $07F06B                               ; $07EC00 |
  BRA CODE_07EC0F                           ; $07EC04 |

CODE_07EC06:
  LDA #$0010                                ; $07EC06 |
  STA !s_spr_state,x                        ; $07EC09 |
  STZ $6162                                 ; $07EC0C |

CODE_07EC0F:
  STZ !s_tongued_sprite_slot                ; $07EC0F |
  PLA                                       ; $07EC12 |
  PLY                                       ; $07EC13 |

CODE_07EC14:
  JSL $03AF23                               ; $07EC14 |
  JSL $07EF98                               ; $07EC18 |
  LDA !s_spr_x_player_dir,x                 ; $07EC1C |
  AND #$00FF                                ; $07EC1F |
  STA !s_spr_facing_dir,x                   ; $07EC22 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07EC25 |
  TAX                                       ; $07EC27 |
  JSR ($EC8B,x)                             ; $07EC28 |
  JSR CODE_07EFE9                           ; $07EC2B |
  LDA !r_fire_lakitu_gen_flag               ; $07EC2E |
  BNE CODE_07EC4E                           ; $07EC31 |
  LDA #$F800                                ; $07EC33 |
  STA !s_spr_y_accel_ceiling,x              ; $07EC36 |
  STA !s_spr_x_accel_ceiling,x              ; $07EC39 |
  LDA #$0040                                ; $07EC3C |
  STA !s_spr_y_accel,x                      ; $07EC3F |
  STA !s_spr_x_accel,x                      ; $07EC42 |
  LDA !s_spr_oam_1,x                        ; $07EC45 |
  ORA #$0004                                ; $07EC48 |
  STA !s_spr_oam_1,x                        ; $07EC4B |

CODE_07EC4E:
  LDA $14                                   ; $07EC4E |
  AND #$0007                                ; $07EC50 |
  BNE CODE_07EC86                           ; $07EC53 |
  LDA #$01F8                                ; $07EC55 |
  JSL spawn_ambient_sprite                  ; $07EC58 |
  LDA #$0002                                ; $07EC5C |
  STA $73C2,y                               ; $07EC5F |
  LDA #$0008                                ; $07EC62 |
  STA $7782,y                               ; $07EC65 |
  LDA !s_spr_x_pixel_pos,x                  ; $07EC68 |
  SEC                                       ; $07EC6B |
  SBC !s_spr_x_delta_lo,x                   ; $07EC6C |
  STA $70A2,y                               ; $07EC6F |
  LDA $10                                   ; $07EC72 |
  AND #$0007                                ; $07EC74 |
  CLC                                       ; $07EC77 |
  ADC !s_spr_y_pixel_pos,x                  ; $07EC78 |
  CLC                                       ; $07EC7B |
  ADC #$0008                                ; $07EC7C |
  SEC                                       ; $07EC7F |
  SBC !s_spr_y_delta_lo,x                   ; $07EC80 |
  STA $7142,y                               ; $07EC83 |

CODE_07EC86:
  JSL $03A5B7                               ; $07EC86 |
  RTL                                       ; $07EC8A |

  dw $ECA7                                  ; $07EC8B |
  dw $ED63                                  ; $07EC8D |
  dw $EE47                                  ; $07EC8F |
  dw $EEFF                                  ; $07EC91 |

  dw $0030, $FFD0                           ; $07EC93 |

  dw $0008, $0010                           ; $07EC97 |

  dw $0200, $FE00                           ; $07EC9B |

  dw $0008, $0010                           ; $07EC9F |

  dw $0200, $FE00                           ; $07ECA3 |

  LDX $12                                   ; $07ECA7 |
  JSR CODE_07ECC4                           ; $07ECA9 |
  LDA !s_spr_timer_2,x                      ; $07ECAC |
  BNE CODE_07ECC3                           ; $07ECAF |
  JSR CODE_07F027                           ; $07ECB1 |
  BCS CODE_07ECC3                           ; $07ECB4 |
  LDA #$0001                                ; $07ECB6 |
  STA !s_spr_anim_frame,x                   ; $07ECB9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07ECBC |
  LDA #$0002                                ; $07ECBE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07ECC1 |

CODE_07ECC3:
  RTS                                       ; $07ECC3 |

CODE_07ECC4:
  LDY #$00                                  ; $07ECC4 |
  DEC A                                     ; $07ECC6 |
  EOR !s_spr_x_speed_lo,x                   ; $07ECC7 |
  BPL CODE_07ECCE                           ; $07ECCA |
  INY                                       ; $07ECCC |
  INY                                       ; $07ECCD |

CODE_07ECCE:
  LDA $EC97,y                               ; $07ECCE |
  STA !s_spr_x_accel,x                      ; $07ECD1 |
  LDA !s_spr_x_speed_lo,x                   ; $07ECD4 |
  AND #$8000                                ; $07ECD7 |
  ASL A                                     ; $07ECDA |
  ROL A                                     ; $07ECDB |
  ASL A                                     ; $07ECDC |
  TAY                                       ; $07ECDD |
  LDA !s_player_x                           ; $07ECDE |
  CLC                                       ; $07ECE1 |
  ADC $EC93,y                               ; $07ECE2 |
  LDY #$00                                  ; $07ECE5 |
  CMP !s_spr_x_pixel_pos,x                  ; $07ECE7 |
  BPL CODE_07ECEE                           ; $07ECEA |
  INY                                       ; $07ECEC |
  INY                                       ; $07ECED |

CODE_07ECEE:
  LDA $EC9B,y                               ; $07ECEE |
  STA !s_spr_x_accel_ceiling,x              ; $07ECF1 |
  LDA !s_spr_y_speed_lo,x                   ; $07ECF4 |
  BPL CODE_07ECFD                           ; $07ECF7 |
  EOR #$FFFF                                ; $07ECF9 |
  INC A                                     ; $07ECFC |

CODE_07ECFD:
  CMP #$0100                                ; $07ECFD |
  BCC CODE_07ED14                           ; $07ED00 |
  LDY #$00                                  ; $07ED02 |
  LDA !s_spr_cam_y_pos,x                    ; $07ED04 |
  CMP #$0030                                ; $07ED07 |
  BMI CODE_07ED0E                           ; $07ED0A |
  INY                                       ; $07ED0C |
  INY                                       ; $07ED0D |

CODE_07ED0E:
  LDA $ECA3,y                               ; $07ED0E |
  STA !s_spr_y_accel_ceiling,x              ; $07ED11 |

CODE_07ED14:
  LDY #$00                                  ; $07ED14 |
  LDA !s_spr_cam_y_pos,x                    ; $07ED16 |
  SEC                                       ; $07ED19 |
  SBC #$0030                                ; $07ED1A |
  EOR !s_spr_y_speed_lo,x                   ; $07ED1D |
  BMI CODE_07ED24                           ; $07ED20 |
  INY                                       ; $07ED22 |
  INY                                       ; $07ED23 |

CODE_07ED24:
  LDA $EC9F,y                               ; $07ED24 |
  STA !s_spr_y_accel,x                      ; $07ED27 |
  LDA !s_spr_cam_y_pos,x                    ; $07ED2A |
  CLC                                       ; $07ED2D |
  ADC #$0080                                ; $07ED2E |
  CMP #$0200                                ; $07ED31 |
  BCC CODE_07ED4A                           ; $07ED34 |
  LDA !s_spr_y_accel_ceiling,x              ; $07ED36 |
  CLC                                       ; $07ED39 |
  ADC #$0800                                ; $07ED3A |
  CMP #$1000                                ; $07ED3D |
  BCS CODE_07ED4A                           ; $07ED40 |
  LDA !s_spr_y_accel_ceiling,x              ; $07ED42 |
  ASL A                                     ; $07ED45 |
  ASL A                                     ; $07ED46 |
  STA !s_spr_y_accel_ceiling,x              ; $07ED47 |

CODE_07ED4A:
  RTS                                       ; $07ED4A |

  dw $0004, $000C                           ; $07ED4B |

  dw $FFFE, $0002                           ; $07ED4F |

  dw $0006, $000C                           ; $07ED53 |

  dw $000F, $000F, $000F, $000F             ; $07ED57 |
  dw $000F, $000F                           ; $07ED5F |

  LDX $12                                   ; $07ED63 |
  JSR CODE_07ECC4                           ; $07ED65 |
  JSR CODE_07F027                           ; $07ED68 |
  BCC CODE_07ED70                           ; $07ED6B |
  JMP CODE_07EF06                           ; $07ED6D |

CODE_07ED70:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07ED70 |
  PHA                                       ; $07ED72 |
  AND #$0004                                ; $07ED73 |
  LSR A                                     ; $07ED76 |
  TAY                                       ; $07ED77 |
  LDA $ED4B,y                               ; $07ED78 |
  STA $00                                   ; $07ED7B |
  PLA                                       ; $07ED7D |
  LSR A                                     ; $07ED7E |
  LSR A                                     ; $07ED7F |
  LSR A                                     ; $07ED80 |
  CMP #$0005                                ; $07ED81 |
  BCC CODE_07ED89                           ; $07ED84 |
  LDA #$0005                                ; $07ED86 |

CODE_07ED89:
  STA $02                                   ; $07ED89 |
  ASL A                                     ; $07ED8B |
  TAY                                       ; $07ED8C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07ED8D |
  AND $ED57,y                               ; $07ED8F |
  BNE CODE_07ED9B                           ; $07ED92 |
  LDA #$0051                                ; $07ED94 |\ play sound #$0051
  JSL push_sound_queue                      ; $07ED97 |/

CODE_07ED9B:
  LDY !s_spr_facing_dir,x                   ; $07ED9B |
  LDA !s_spr_x_pixel_pos,x                  ; $07ED9E |
  CLC                                       ; $07EDA1 |
  ADC $ED4F,y                               ; $07EDA2 |
  STA $04                                   ; $07EDA5 |
  LDA #$020D                                ; $07EDA7 |
  JSL spawn_ambient_sprite                  ; $07EDAA |
  LDA $02                                   ; $07EDAE |
  STA $73C2,y                               ; $07EDB0 |
  LDA #$0001                                ; $07EDB3 |
  STA $7782,y                               ; $07EDB6 |
  LDA $04                                   ; $07EDB9 |
  STA $70A2,y                               ; $07EDBB |
  LDA !s_spr_y_pixel_pos,x                  ; $07EDBE |
  SEC                                       ; $07EDC1 |
  SBC #$0018                                ; $07EDC2 |
  STA $7142,y                               ; $07EDC5 |
  LDA $7002,y                               ; $07EDC8 |
  AND #$FFF1                                ; $07EDCB |
  ORA $00                                   ; $07EDCE |
  STA $7002,y                               ; $07EDD0 |
  LDY !s_spr_facing_dir,x                   ; $07EDD3 |
  LDA !s_spr_x_pixel_pos,x                  ; $07EDD6 |
  CLC                                       ; $07EDD9 |
  ADC $ED53,y                               ; $07EDDA |
  STA $00                                   ; $07EDDD |
  LDA #$020E                                ; $07EDDF |
  JSL spawn_ambient_sprite                  ; $07EDE2 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07EDE6 |
  LSR A                                     ; $07EDE8 |
  AND #$0007                                ; $07EDE9 |
  STA $73C2,y                               ; $07EDEC |
  LDA #$0001                                ; $07EDEF |
  STA $7782,y                               ; $07EDF2 |
  LDA $00                                   ; $07EDF5 |
  STA $70A2,y                               ; $07EDF7 |
  LDA !s_spr_y_pixel_pos,x                  ; $07EDFA |
  SEC                                       ; $07EDFD |
  SBC #$0020                                ; $07EDFE |
  STA $7142,y                               ; $07EE01 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07EE04 |
  INC A                                     ; $07EE06 |
  CMP #$0040                                ; $07EE07 |
  BCS CODE_07EE0F                           ; $07EE0A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07EE0C |
  RTS                                       ; $07EE0E |

CODE_07EE0F:
  LDA !r_reg_tm_mirror                      ; $07EE0F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07EE12 |
  ORA !r_reg_ts_mirror                      ; $07EE14 |
  AND #$000F                                ; $07EE17 |
  XBA                                       ; $07EE1A |
  ORA #$0010                                ; $07EE1B |
  STA !r_reg_tm_mirror                      ; $07EE1E |
  LDA #$0002                                ; $07EE21 |
  STA !s_spr_anim_frame,x                   ; $07EE24 |
  LDA #$0018                                ; $07EE27 |
  STA !s_spr_timer_1,x                      ; $07EE2A |
  LDA #$0004                                ; $07EE2D |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07EE30 |
  STZ !s_spr_x_accel,x                      ; $07EE32 |
  STZ !s_spr_x_speed_lo,x                   ; $07EE35 |
  STZ !s_spr_y_accel,x                      ; $07EE38 |
  STZ !s_spr_y_speed_lo,x                   ; $07EE3B |
  RTS                                       ; $07EE3E |

  dw $0000, $7C00, $03E0, $001F             ; $07EE3F |

  LDX $12                                   ; $07EE47 |
  JSR CODE_07F027                           ; $07EE49 |
  BCC CODE_07EE54                           ; $07EE4C |
  JSR CODE_07EFD2                           ; $07EE4E |
  JMP CODE_07EF06                           ; $07EE51 |

CODE_07EE54:
  LDA $14                                   ; $07EE54 |
  AND #$0007                                ; $07EE56 |
  BNE CODE_07EE62                           ; $07EE59 |
  LDA #$0051                                ; $07EE5B |\ play sound #$0051
  JSL push_sound_queue                      ; $07EE5E |/

CODE_07EE62:
  LDA !s_spr_anim_frame,x                   ; $07EE62 |
  AND #$0001                                ; $07EE65 |
  ASL A                                     ; $07EE68 |
  TAY                                       ; $07EE69 |
  LDA $ED4B,y                               ; $07EE6A |
  STA $00                                   ; $07EE6D |
  LDA #$020D                                ; $07EE6F |
  JSL spawn_ambient_sprite                  ; $07EE72 |
  LDA #$0005                                ; $07EE76 |
  STA $73C2,y                               ; $07EE79 |
  LDA #$0001                                ; $07EE7C |
  STA $7782,y                               ; $07EE7F |
  LDA !s_spr_x_pixel_pos,x                  ; $07EE82 |
  STA $70A2,y                               ; $07EE85 |
  LDA !s_spr_y_pixel_pos,x                  ; $07EE88 |
  SEC                                       ; $07EE8B |
  SBC #$0018                                ; $07EE8C |
  STA $7142,y                               ; $07EE8F |
  LDA $7002,y                               ; $07EE92 |
  AND #$FFF1                                ; $07EE95 |
  ORA $00                                   ; $07EE98 |
  STA $7002,y                               ; $07EE9A |
  LDA !s_spr_timer_1,x                      ; $07EE9D |
  BEQ CODE_07EEBF                           ; $07EEA0 |
  AND #$0003                                ; $07EEA2 |
  BNE CODE_07EEBE                           ; $07EEA5 |
  LDA !s_spr_anim_frame,x                   ; $07EEA7 |
  EOR #$0001                                ; $07EEAA |
  STA !s_spr_anim_frame,x                   ; $07EEAD |
  LDA $14                                   ; $07EEB0 |
  AND #$000C                                ; $07EEB2 |
  LSR A                                     ; $07EEB5 |
  TAY                                       ; $07EEB6 |
  LDA $EE3F,y                               ; $07EEB7 |
  STA !s_cgram_mirror                       ; $07EEBA |

CODE_07EEBE:
  RTS                                       ; $07EEBE |

CODE_07EEBF:
  JSR CODE_07EFD2                           ; $07EEBF |
  LDA #$0030                                ; $07EEC2 |
  STA !s_spr_timer_1,x                      ; $07EEC5 |
  LDA #$0004                                ; $07EEC8 |
  STA !s_spr_anim_frame,x                   ; $07EECB |
  LDA #$0006                                ; $07EECE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07EED1 |
  LDA #$00A2                                ; $07EED3 |
  JSL spawn_sprite_active                   ; $07EED6 |
  BCC CODE_07EEFA                           ; $07EEDA |
  LDA !s_spr_x_pixel_pos,x                  ; $07EEDC |
  STA !s_spr_x_pixel_pos,y                  ; $07EEDF |
  LDA !s_spr_y_pixel_pos,x                  ; $07EEE2 |
  STA !s_spr_y_pixel_pos,y                  ; $07EEE5 |
  LDA #$0005                                ; $07EEE8 |
  STA !s_spr_anim_frame,y                   ; $07EEEB |
  LDA #$0200                                ; $07EEEE |
  STA !s_spr_y_speed_lo,y                   ; $07EEF1 |
  LDA !s_player_x_speed_prev                ; $07EEF4 |
  STA !s_spr_x_speed_lo,y                   ; $07EEF7 |

CODE_07EEFA:
  RTS                                       ; $07EEFA |

  dw $FE00, $0200                           ; $07EEFB |

  LDX $12                                   ; $07EEFF |
  LDA !s_spr_timer_1,x                      ; $07EF01 |
  BNE CODE_07EF3F                           ; $07EF04 |

CODE_07EF06:
  LDA $10                                   ; $07EF06 |
  AND #$007F                                ; $07EF08 |
  CLC                                       ; $07EF0B |
  ADC #$0080                                ; $07EF0C |
  STA !s_spr_timer_2,x                      ; $07EF0F |
  LDA #$0010                                ; $07EF12 |
  STA !s_spr_x_accel,x                      ; $07EF15 |
  STA !s_spr_y_accel,x                      ; $07EF18 |
  LDA $10                                   ; $07EF1B |
  AND #$0001                                ; $07EF1D |
  ASL A                                     ; $07EF20 |
  TAY                                       ; $07EF21 |
  LDA $EEFB,y                               ; $07EF22 |
  STA !s_spr_x_accel_ceiling,x              ; $07EF25 |
  LDA $10                                   ; $07EF28 |
  AND #$0002                                ; $07EF2A |
  TAY                                       ; $07EF2D |
  LDA $EEFB,y                               ; $07EF2E |
  STA !s_spr_y_accel_ceiling,x              ; $07EF31 |
  LDA #$0000                                ; $07EF34 |
  STA !s_spr_anim_frame,x                   ; $07EF37 |
  LDA #$0000                                ; $07EF3A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07EF3D |

CODE_07EF3F:
  RTS                                       ; $07EF3F |

  dw $000A, $000A, $000A, $0022             ; $07EF40 |
  dw $000A                                  ; $07EF48 |

CODE_07EF4A:
  LDY !s_spr_draw_priority,x                ; $07EF4A |
  BMI CODE_07EF97                           ; $07EF4D |
  LDA $14                                   ; $07EF4F |
  AND #$0008                                ; $07EF51 |
  BEQ CODE_07EF97                           ; $07EF54 |
  LDA !s_spr_anim_frame,x                   ; $07EF56 |
  CMP #$0005                                ; $07EF59 |
  BCS CODE_07EF97                           ; $07EF5C |
  ASL A                                     ; $07EF5E |
  TAY                                       ; $07EF5F |
  LDA !s_spr_obj_tile_index,x               ; $07EF60 |
  AND #$00FF                                ; $07EF63 |
  ASL A                                     ; $07EF66 |
  ASL A                                     ; $07EF67 |
  ASL A                                     ; $07EF68 |
  CLC                                       ; $07EF69 |
  ADC $EF40,y                               ; $07EF6A |
  STA $00                                   ; $07EF6D |
  REP #$10                                  ; $07EF6F |
  LDA !s_spr_oam_pointer,x                  ; $07EF71 |
  CLC                                       ; $07EF74 |
  ADC #$0008                                ; $07EF75 |
  TAY                                       ; $07EF78 |
  LDA $6004,y                               ; $07EF79 |
  AND #$FE00                                ; $07EF7C |
  ORA $00                                   ; $07EF7F |
  STA $6004,y                               ; $07EF81 |
  TYA                                       ; $07EF84 |
  CLC                                       ; $07EF85 |
  ADC #$0008                                ; $07EF86 |
  TAY                                       ; $07EF89 |
  LDA $6004,y                               ; $07EF8A |
  AND #$FE00                                ; $07EF8D |
  ORA $00                                   ; $07EF90 |
  STA $6004,y                               ; $07EF92 |
  SEP #$10                                  ; $07EF95 |

CODE_07EF97:
  RTS                                       ; $07EF97 |

  LDY !s_spr_collision_id,x                 ; $07EF98 |
  DEY                                       ; $07EF9B |
  BEQ CODE_07EFD1                           ; $07EF9C |
  BMI CODE_07EFD1                           ; $07EF9E |
  LDA !s_spr_state,y                        ; $07EFA0 |
  CMP #$0010                                ; $07EFA3 |
  BNE CODE_07EFD1                           ; $07EFA6 |
  LDA !s_spr_collision_state,y              ; $07EFA8 |
  BEQ CODE_07EFD1                           ; $07EFAB |
  TYX                                       ; $07EFAD |
  JSL $03B24B                               ; $07EFAE |
  LDX $12                                   ; $07EFB2 |
  LDA !s_spr_x_hitbox_center,x              ; $07EFB4 |
  STA $00                                   ; $07EFB7 |
  LDA !s_spr_y_hitbox_center,x              ; $07EFB9 |
  STA $02                                   ; $07EFBC |
  LDA #$01E6                                ; $07EFBE |
  JSL $03B56E                               ; $07EFC1 |
  LDA #$000E                                ; $07EFC5 |
  STA !s_spr_state,x                        ; $07EFC8 |
  JSL $07F06B                               ; $07EFCB |
  PLY                                       ; $07EFCF |
  PLA                                       ; $07EFD0 |

CODE_07EFD1:
  RTL                                       ; $07EFD1 |

CODE_07EFD2:
  LDA !r_reg_cgadsub_mirror                 ; $07EFD2 |
  AND #$FF7F                                ; $07EFD5 |
  STA !r_reg_cgadsub_mirror                 ; $07EFD8 |
  LDA $702D6C                               ; $07EFDB |
  STA !s_cgram_mirror                       ; $07EFDF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07EFE3 |
  STA !r_reg_tm_mirror                      ; $07EFE5 |
  RTS                                       ; $07EFE8 |

CODE_07EFE9:
  LDA !s_spr_gsu_morph_2_lo,x               ; $07EFE9 |
  BNE CODE_07F009                           ; $07EFEC |
  LDA !r_bg1_cam_x                          ; $07EFEE |
  CLC                                       ; $07EFF1 |
  ADC #$0010                                ; $07EFF2 |
  CMP !s_spr_x_pixel_pos,x                  ; $07EFF5 |
  BPL CODE_07F026                           ; $07EFF8 |
  CLC                                       ; $07EFFA |
  ADC #$00D0                                ; $07EFFB |
  CMP !s_spr_x_pixel_pos,x                  ; $07EFFE |
  BMI CODE_07F026                           ; $07F001 |
  LDA #$0001                                ; $07F003 |
  STA !s_spr_gsu_morph_2_lo,x               ; $07F006 |

CODE_07F009:
  LDA !r_fire_lakitu_gen_flag               ; $07F009 |
  BEQ CODE_07F026                           ; $07F00C |
  LDA !r_bg1_cam_x                          ; $07F00E |
  CLC                                       ; $07F011 |
  ADC #$0010                                ; $07F012 |
  CMP !s_spr_x_pixel_pos,x                  ; $07F015 |
  BPL CODE_07F023                           ; $07F018 |
  CLC                                       ; $07F01A |
  ADC #$00D0                                ; $07F01B |
  CMP !s_spr_x_pixel_pos,x                  ; $07F01E |
  BPL CODE_07F026                           ; $07F021 |

CODE_07F023:
  STA !s_spr_x_pixel_pos,x                  ; $07F023 |

CODE_07F026:
  RTS                                       ; $07F026 |

CODE_07F027:
  LDA !s_spr_cam_x_pos,x                    ; $07F027 |
  CLC                                       ; $07F02A |
  ADC #$0030                                ; $07F02B |
  CMP #$0150                                ; $07F02E |
  BCS CODE_07F03D                           ; $07F031 |
  LDA !s_spr_cam_y_pos,x                    ; $07F033 |
  CLC                                       ; $07F036 |
  ADC #$0030                                ; $07F037 |
  CMP #$0150                                ; $07F03A |

CODE_07F03D:
  RTS                                       ; $07F03D |

  LDA !s_spr_gsu_morph_1_lo,x               ; $07F03E |
  TAX                                       ; $07F041 |
  JMP ($F045,x)                             ; $07F042 |

  dw $F04B                                  ; $07F045 |
  dw $F08D                                  ; $07F047 |
  dw $F0C7                                  ; $07F049 |

  LDX $12                                   ; $07F04B |
  LDA #$011C                                ; $07F04D |
  JSL spawn_sprite_init                     ; $07F050 |
  BCC CODE_07F06B                           ; $07F054 |
  LDA !s_spr_x_pixel_pos,x                  ; $07F056 |
  STA !s_spr_x_pixel_pos,y                  ; $07F059 |
  LDA !s_spr_y_pixel_pos,x                  ; $07F05C |
  CLC                                       ; $07F05F |
  ADC #$0008                                ; $07F060 |
  STA !s_spr_y_pixel_pos,y                  ; $07F063 |
  TXA                                       ; $07F066 |
  INC A                                     ; $07F067 |
  STA !s_spr_wildcard_3_lo,y                ; $07F068 |

CODE_07F06B:
  JSR CODE_07EFD2                           ; $07F06B |
  LDA #$0005                                ; $07F06E |
  STA !s_spr_anim_frame,x                   ; $07F071 |
  LDA #$0040                                ; $07F074 |
  STA !s_spr_y_accel,x                      ; $07F077 |
  LDA #$0400                                ; $07F07A |
  STA !s_spr_y_accel_ceiling,x              ; $07F07D |
  LDA #$0100                                ; $07F080 |
  STA !s_spr_y_speed_lo,x                   ; $07F083 |
  INC !s_spr_gsu_morph_1_lo,x               ; $07F086 |
  INC !s_spr_gsu_morph_1_lo,x               ; $07F089 |
  RTL                                       ; $07F08C |

  LDX $12                                   ; $07F08D |
  LDA !s_spr_cam_x_pos,x                    ; $07F08F |
  CLC                                       ; $07F092 |
  ADC #$0050                                ; $07F093 |
  CMP #$0190                                ; $07F096 |
  BCS CODE_07F0A7                           ; $07F099 |
  LDA !s_spr_cam_y_pos,x                    ; $07F09B |
  CLC                                       ; $07F09E |
  ADC #$0050                                ; $07F09F |
  CMP #$0190                                ; $07F0A2 |
  BCC CODE_07F0C2                           ; $07F0A5 |

CODE_07F0A7:
  STZ !s_spr_y_accel,x                      ; $07F0A7 |
  STZ !s_spr_y_speed_lo,x                   ; $07F0AA |
  STZ !s_spr_x_speed_lo,x                   ; $07F0AD |
  LDA #$FFFF                                ; $07F0B0 |
  STA !s_spr_draw_priority,x                ; $07F0B3 |
  LDA #$0280                                ; $07F0B6 |
  STA !s_spr_timer_1,x                      ; $07F0B9 |
  INC !s_spr_gsu_morph_1_lo,x               ; $07F0BC |
  INC !s_spr_gsu_morph_1_lo,x               ; $07F0BF |

CODE_07F0C2:
  RTL                                       ; $07F0C2 |

  dw $FFD0, $0110                           ; $07F0C3 |

  LDX $12                                   ; $07F0C7 |
  LDA !s_spr_timer_1,x                      ; $07F0C9 |
  BNE CODE_07F10B                           ; $07F0CC |
  LDY !r_cam_moving_dir_x                   ; $07F0CE |
  LDA !r_bg1_cam_x                          ; $07F0D1 |
  CLC                                       ; $07F0D4 |
  ADC $F0C3,y                               ; $07F0D5 |
  STA !s_spr_x_pixel_pos,x                  ; $07F0D8 |
  LDA !r_bg1_cam_y                          ; $07F0DB |
  SEC                                       ; $07F0DE |
  SBC #$0030                                ; $07F0DF |
  STA !s_spr_y_pixel_pos,x                  ; $07F0E2 |
  LDA #$0010                                ; $07F0E5 |
  STA !s_spr_x_accel,x                      ; $07F0E8 |
  STA !s_spr_y_accel,x                      ; $07F0EB |
  LDA #$0200                                ; $07F0EE |
  STA !s_spr_y_accel_ceiling,x              ; $07F0F1 |
  STA !s_spr_x_accel_ceiling,x              ; $07F0F4 |
  LDA #$0005                                ; $07F0F7 |
  STA !s_spr_draw_priority,x                ; $07F0FA |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $07F0FD |
  STZ !s_spr_anim_frame,x                   ; $07F0FF |
  STZ !s_spr_gsu_morph_1_lo,x               ; $07F102 |
  LDA #$0010                                ; $07F105 |
  STA !s_spr_state,x                        ; $07F108 |

CODE_07F10B:
  RTL                                       ; $07F10B |

  dw $0200, $0804                           ; $07F10C |

  dw $FFC0, $0040                           ; $07F110 |

  dw $FF80, $0080                           ; $07F114 |

init_baron_von_zeppelin_5_coins:
  LDA #$000E                                ; $07F118 |
  BRA CODE_07F12B                           ; $07F11B |

init_baron_von_zeppelin_key:
  JSR CODE_07F28B                           ; $07F11D |
  LDA #$000C                                ; $07F120 |
  BRA CODE_07F12B                           ; $07F123 |

init_baron_von_zeppelin_1_up:
  JSR CODE_07F28B                           ; $07F125 |
  LDA #$000A                                ; $07F128 |

CODE_07F12B:
  STA !s_spr_gsu_morph_1_lo,x               ; $07F12B |
  LDA !s_spr_facing_dir,x                   ; $07F12E |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F131 |
  TAY                                       ; $07F133 |
  STZ !s_spr_facing_dir,x                   ; $07F134 |
  BRA CODE_07F1AA                           ; $07F137 |

init_baron_von_zeppelin_large_spring_ball:
  JSL $03AE60                               ; $07F139 |
  LDA #$0100                                ; $07F13D |
  STA !gsu_r6                               ; $07F140 |
  LDA #$0055                                ; $07F143 |
  STA !gsu_r13                              ; $07F146 |
  LDA #$40E0                                ; $07F149 |
  STA !gsu_r12                              ; $07F14C |
  LDA #$0010                                ; $07F14F |
  STA !gsu_r8                               ; $07F152 |
  STA !gsu_r9                               ; $07F155 |
  LDY !s_spr_dyntile_index,x                ; $07F158 |
  TYX                                       ; $07F15B |
  LDA $03A9CE,x                             ; $07F15C |
  STA !gsu_r3                               ; $07F160 |
  LDA $03A9EE,x                             ; $07F163 |
  STA !gsu_r2                               ; $07F167 |
  LDX #$08                                  ; $07F16A |
  LDA #$8293                                ; $07F16C |
  JSL r_gsu_init_1                          ; $07F16F | GSU init
  LDX $12                                   ; $07F173 |
  INC $0CF9                                 ; $07F175 |
  LDA #$0008                                ; $07F178 |
  BRA CODE_07F19E                           ; $07F17B |

init_baron_von_zeppelin_icy_watermelon:
  LDA #$0014                                ; $07F17D |
  BRA CODE_07F19E                           ; $07F180 |

init_baron_von_zeppelin_fire_watermelon:
  LDA #$0012                                ; $07F182 |
  BRA CODE_07F19E                           ; $07F185 |

init_baron_von_zeppelin_watermelon:
  LDA #$0010                                ; $07F187 |
  BRA CODE_07F19E                           ; $07F18A |

init_baron_von_zeppelin_bandit:
  LDA #$0006                                ; $07F18C |
  BRA CODE_07F19E                           ; $07F18F |

init_baron_von_zeppelin_bomb:
  LDA #$0004                                ; $07F191 |
  BRA CODE_07F19E                           ; $07F194 |

init_baron_von_zeppelin_needlenose:
  LDA #$0002                                ; $07F196 |
  BRA CODE_07F19E                           ; $07F199 |

init_baron_von_zeppelin_red_shy_guy:
  LDA #$0000                                ; $07F19B |

CODE_07F19E:
  STA !s_spr_gsu_morph_1_lo,x               ; $07F19E |
  LDA #$FFFF                                ; $07F1A1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F1A4 |
  LDA !s_spr_facing_dir,x                   ; $07F1A6 |
  TAY                                       ; $07F1A9 |

CODE_07F1AA:
  LDA $F110,y                               ; $07F1AA |
  STA !s_spr_x_speed_lo,x                   ; $07F1AD |
  SEP #$20                                  ; $07F1B0 |
  LDA $10                                   ; $07F1B2 |
  AND #$03                                  ; $07F1B4 |
  TAY                                       ; $07F1B6 |
  LDA $F10C,y                               ; $07F1B7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07F1BA |
  REP #$20                                  ; $07F1BC |
  LDA #$0800                                ; $07F1BE |
  STA !s_spr_y_accel_ceiling,x              ; $07F1C1 |
  LDA #$0004                                ; $07F1C4 |
  STA !s_spr_y_accel,x                      ; $07F1C7 |
  RTL                                       ; $07F1CA |

init_baron_von_zeppelin_giant_egg:
  LDA #$0018                                ; $07F1CB |
  STA !s_spr_gsu_morph_1_lo,x               ; $07F1CE |
  LDA #$FFFF                                ; $07F1D1 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F1D4 |
  LDA !s_spr_facing_dir,x                   ; $07F1D6 |
  TAY                                       ; $07F1D9 |
  LDA $F114,y                               ; $07F1DA |
  STA !s_spr_x_speed_lo,x                   ; $07F1DD |
  SEP #$20                                  ; $07F1E0 |
  LDA $10                                   ; $07F1E2 |
  AND #$03                                  ; $07F1E4 |
  TAY                                       ; $07F1E6 |
  LDA $F10C,y                               ; $07F1E7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07F1EA |
  REP #$20                                  ; $07F1EC |
  LDA #$0800                                ; $07F1EE |
  STA !s_spr_y_accel_ceiling,x              ; $07F1F1 |
  LDA #$0004                                ; $07F1F4 |
  STA !s_spr_y_accel,x                      ; $07F1F7 |
  RTL                                       ; $07F1FA |

init_baron_von_zeppelin_crate_with_6_stars:
  JSL $03AE60                               ; $07F1FB |
  LDA #$0100                                ; $07F1FF |
  STA !gsu_r6                               ; $07F202 |
  LDA #$0055                                ; $07F205 |
  STA !gsu_r13                              ; $07F208 |
  LDA #$2080                                ; $07F20B |
  STA !gsu_r12                              ; $07F20E |
  LDA #$0010                                ; $07F211 |
  STA !gsu_r8                               ; $07F214 |
  STA !gsu_r9                               ; $07F217 |
  LDY !s_spr_dyntile_index,x                ; $07F21A |
  TYX                                       ; $07F21D |
  LDA $03A9CE,x                             ; $07F21E |
  STA !gsu_r3                               ; $07F222 |
  LDA $03A9EE,x                             ; $07F225 |
  STA !gsu_r2                               ; $07F229 |
  LDX #$08                                  ; $07F22C |
  LDA #$8293                                ; $07F22E |
  JSL r_gsu_init_1                          ; $07F231 | GSU init
  LDX $12                                   ; $07F235 |
  INC $0CF9                                 ; $07F237 |
  LDA #$0016                                ; $07F23A |
  STA !s_spr_gsu_morph_1_lo,x               ; $07F23D |
  LDA !s_spr_facing_dir,x                   ; $07F240 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F243 |
  TAY                                       ; $07F245 |
  STZ !s_spr_facing_dir,x                   ; $07F246 |
  LDA $F110,y                               ; $07F249 |
  STA !s_spr_x_speed_lo,x                   ; $07F24C |
  SEP #$20                                  ; $07F24F |
  LDA $10                                   ; $07F251 |
  AND #$03                                  ; $07F253 |
  TAY                                       ; $07F255 |
  LDA $F10C,y                               ; $07F256 |
  LSR A                                     ; $07F259 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07F25A |
  LDA $10                                   ; $07F25C |
  AND #$0C                                  ; $07F25E |
  LSR A                                     ; $07F260 |
  LSR A                                     ; $07F261 |
  TAY                                       ; $07F262 |
  LDA $F10C,y                               ; $07F263 |
  LSR A                                     ; $07F266 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $07F267 |
  LDA $10                                   ; $07F269 |
  AND #$30                                  ; $07F26B |
  LSR A                                     ; $07F26D |
  LSR A                                     ; $07F26E |
  LSR A                                     ; $07F26F |
  LSR A                                     ; $07F270 |
  TAY                                       ; $07F271 |
  LDA $F10C,y                               ; $07F272 |
  LSR A                                     ; $07F275 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07F276 |
  LDA #$03                                  ; $07F278 |
  STA !s_spr_wildcard_5_hi_dp,x             ; $07F27A |
  REP #$20                                  ; $07F27C |
  LDA #$0800                                ; $07F27E |
  STA !s_spr_y_accel_ceiling,x              ; $07F281 |
  LDA #$0004                                ; $07F284 |
  STA !s_spr_y_accel,x                      ; $07F287 |
  RTL                                       ; $07F28A |

CODE_07F28B:
  JSL $03D3F8                               ; $07F28B |
  BEQ CODE_07F296                           ; $07F28F |
  PLA                                       ; $07F291 |
  JML $03A31E                               ; $07F292 |

CODE_07F296:
  LDA !s_spr_x_pixel_pos,x                  ; $07F296 |
  ASL A                                     ; $07F299 |
  ASL A                                     ; $07F29A |
  ASL A                                     ; $07F29B |
  ASL A                                     ; $07F29C |
  AND #$FF00                                ; $07F29D |
  STA $00                                   ; $07F2A0 |
  LDA !s_spr_y_pixel_pos,x                  ; $07F2A2 |
  LSR A                                     ; $07F2A5 |
  LSR A                                     ; $07F2A6 |
  LSR A                                     ; $07F2A7 |
  LSR A                                     ; $07F2A8 |
  AND #$00FF                                ; $07F2A9 |
  ORA $00                                   ; $07F2AC |
  STA !s_spr_gsu_morph_2_lo,x               ; $07F2AE |
  RTS                                       ; $07F2B1 |

; bandit, bomb, needlenose, and red shy guy
main_baron_von_zeppelin_enemies:
  STZ !gsu_r4                               ; $07F2B2 |
  LDX #$08                                  ; $07F2B5 |
  LDA #$95B9                                ; $07F2B7 |
  JSL r_gsu_init_1                          ; $07F2BA | GSU init
  LDX $12                                   ; $07F2BE |
  JSR CODE_07F9C9                           ; $07F2C0 |
  JSL $03AF23                               ; $07F2C3 |
  JSR CODE_07F412                           ; $07F2C7 |
  JSR CODE_07F746                           ; $07F2CA |
  JSR CODE_07F3DB                           ; $07F2CD |
  RTL                                       ; $07F2D0 |

;
main_baron_von_zeppelin_large_spring_ball:
  JSL $03AA52                               ; $07F2D1 |
  STZ !gsu_r4                               ; $07F2D5 |
  LDX #$08                                  ; $07F2D8 |
  LDA #$95B9                                ; $07F2DA |
  JSL r_gsu_init_1                          ; $07F2DD | GSU init
  LDX $12                                   ; $07F2E1 |
  JSL $03AF23                               ; $07F2E3 |
  JSR CODE_07F538                           ; $07F2E7 |
  JSR CODE_07F497                           ; $07F2EA |
  JSR CODE_07F3DB                           ; $07F2ED |
  RTL                                       ; $07F2F0 |

;regular and fire watermelons, and giant egg
main_baron_von_zeppelin_melon_and_giant_egg:
  STZ !gsu_r4                               ; $07F2F1 |
  LDX #$08                                  ; $07F2F4 |
  LDA #$95B9                                ; $07F2F6 |
  JSL r_gsu_init_1                          ; $07F2F9 | GSU init
  LDX $12                                   ; $07F2FD |
  JSR CODE_07F9C9                           ; $07F2FF |
  JSL $03AF23                               ; $07F302 |
  JSR CODE_07F538                           ; $07F306 |
  JSR CODE_07F497                           ; $07F309 |
  JSR CODE_07F3DB                           ; $07F30C |
  RTL                                       ; $07F30F |

main_baron_von_zeppelin_icy_watermelon:
  STZ !gsu_r4                               ; $07F310 |
  LDX #$08                                  ; $07F313 |
  LDA #$95B9                                ; $07F315 |
  JSL r_gsu_init_1                          ; $07F318 | GSU init
  LDX $12                                   ; $07F31C |
  JSR CODE_07F9C9                           ; $07F31E |
  JSL $03AF23                               ; $07F321 |
  JSR CODE_07F538                           ; $07F325 |
  JSR CODE_07F497                           ; $07F328 |
  JSR CODE_07F3DB                           ; $07F32B |
  JSL $048131                               ; $07F32E |
  RTL                                       ; $07F332 |

; 5 coins, key, and 1-up
main_baron_von_zeppelin_consumables:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07F333 |
  LSR A                                     ; $07F335 |
  LSR A                                     ; $07F336 |
  ROR A                                     ; $07F337 |
  LSR A                                     ; $07F338 |
  STA !gsu_r4                               ; $07F339 |
  LDX #$08                                  ; $07F33C |
  LDA #$95B9                                ; $07F33E |
  JSL r_gsu_init_1                          ; $07F341 | GSU init
  LDX $12                                   ; $07F345 |
  JSR CODE_07F9C9                           ; $07F347 |
  JSL $03AF23                               ; $07F34A |
  LDA !s_spr_facing_dir,x                   ; $07F34E |
  BEQ CODE_07F35A                           ; $07F351 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07F353 |
  EOR #$0002                                ; $07F355 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F358 |

CODE_07F35A:
  STZ !s_spr_facing_dir,x                   ; $07F35A |
  JSR CODE_07F538                           ; $07F35D |
  JSR CODE_07F497                           ; $07F360 |
  JSR CODE_07F3DB                           ; $07F363 |
  RTL                                       ; $07F366 |

  dw $F704                                  ; $07F367 |
  dw $F304                                  ; $07F369 |
  dw $E500                                  ; $07F36B |
  dw $F80B                                  ; $07F36D |
  dw $F50D                                  ; $07F36F |
  dw $E80C                                  ; $07F371 |
  dw $F9FD                                  ; $07F373 |
  dw $F5FB                                  ; $07F375 |
  dw $E8F4                                  ; $07F377 |
  dw $F808                                  ; $07F379 |
  dw $F409                                  ; $07F37B |
  dw $E707                                  ; $07F37D |
  dw $F800                                  ; $07F37F |
  dw $F4FF                                  ; $07F381 |
  dw $E7F9                                  ; $07F383 |
  dw $F804                                  ; $07F385 |
  dw $F404                                  ; $07F387 |
  dw $E600                                  ; $07F389 |

; gsu pointer table
  dw $F38A                                  ; $07F38B |
  dw $F384                                  ; $07F38D |
  dw $F378                                  ; $07F38F |

main_baron_von_zeppelin_crate_with_6_stars:
  JSL $03AA52                               ; $07F391 |
  LDA #$0007                                ; $07F395 |
  STA !gsu_r0                               ; $07F398 |
  LDA !s_spr_wildcard_5_hi_dp,x             ; $07F39B |
  DEC A                                     ; $07F39D |
  ASL A                                     ; $07F39E |
  TAY                                       ; $07F39F |
  LDA $F38B,y                               ; $07F3A0 |
  STA !gsu_r7                               ; $07F3A3 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07F3A6 |
  LSR A                                     ; $07F3A8 |
  LSR A                                     ; $07F3A9 |
  ROR A                                     ; $07F3AA |
  LSR A                                     ; $07F3AB |
  STA !gsu_r4                               ; $07F3AC |
  LDX #$08                                  ; $07F3AF |
  LDA #$95F4                                ; $07F3B1 |
  JSL r_gsu_init_1                          ; $07F3B4 | GSU init
  LDX $12                                   ; $07F3B8 |
  JSL $03AF23                               ; $07F3BA |
  LDA !s_spr_facing_dir,x                   ; $07F3BE |
  BEQ CODE_07F3CA                           ; $07F3C1 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07F3C3 |
  EOR #$0002                                ; $07F3C5 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F3C8 |

CODE_07F3CA:
  STZ !s_spr_facing_dir,x                   ; $07F3CA |
  JSR CODE_07F6E7                           ; $07F3CD |
  JSR CODE_07F582                           ; $07F3D0 |
  JSR CODE_07F3DB                           ; $07F3D3 |
  RTL                                       ; $07F3D6 |

  dw $F800, $0800                           ; $07F3D7 |

CODE_07F3DB:
  LDA !s_spr_y_speed_lo,x                   ; $07F3DB |
  CLC                                       ; $07F3DE |
  ADC #$0060                                ; $07F3DF |
  CMP #$00C0                                ; $07F3E2 |
  BCC CODE_07F3F7                           ; $07F3E5 |
  LDA !s_spr_y_speed_lo,x                   ; $07F3E7 |
  AND #$8000                                ; $07F3EA |
  ASL A                                     ; $07F3ED |
  ROL A                                     ; $07F3EE |
  ASL A                                     ; $07F3EF |
  TAY                                       ; $07F3F0 |
  LDA $F3D7,y                               ; $07F3F1 |
  STA !s_spr_y_accel_ceiling,x              ; $07F3F4 |

CODE_07F3F7:
  RTS                                       ; $07F3F7 |

  dw $FFE8, $FFE8, $FFE8, $FFE0             ; $07F3F8 |
  dw $FFE8, $FFE8, $FFE8, $FFE8             ; $07F400 |
  dw $FFE8, $FFE8, $FFE8, $0000             ; $07F408 |
  dw $FFE0                                  ; $07F410 |

CODE_07F412:
  LDY !s_spr_collision_id,x                 ; $07F412 |
  DEY                                       ; $07F415 |
  BMI CODE_07F497                           ; $07F416 |
  BEQ CODE_07F497                           ; $07F418 |
  LDA !s_spr_state,y                        ; $07F41A |
  CMP #$0010                                ; $07F41D |
  BNE CODE_07F497                           ; $07F420 |
  LDA !s_spr_collision_state,y              ; $07F422 |
  BEQ CODE_07F497                           ; $07F425 |
  TYX                                       ; $07F427 |
  JSL $03B24B                               ; $07F428 |
  LDX $12                                   ; $07F42C |
  LDY !s_spr_gsu_morph_1_lo,x               ; $07F42E |
  LDA $F3F8,y                               ; $07F431 |
  STA $00                                   ; $07F434 |
  LDA #$017F                                ; $07F436 |
  JSL spawn_sprite_active                   ; $07F439 |
  BCC CODE_07F461                           ; $07F43D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07F43F |
  STA !s_spr_wildcard_4_lo,y                ; $07F441 |
  LDA !s_spr_x_speed_lo,x                   ; $07F444 |
  STA !s_spr_x_speed_lo,y                   ; $07F447 |
  LDA !s_spr_facing_dir,x                   ; $07F44A |
  STA !s_spr_facing_dir,y                   ; $07F44D |
  LDA !s_spr_x_pixel_pos,x                  ; $07F450 |
  STA !s_spr_x_pixel_pos,y                  ; $07F453 |
  LDA !s_spr_y_pixel_pos,x                  ; $07F456 |
  CLC                                       ; $07F459 |
  ADC $00                                   ; $07F45A |
  STA !s_spr_y_pixel_pos,y                  ; $07F45C |
  BRA CODE_07F487                           ; $07F45F |

CODE_07F461:
  LDA #$01EF                                ; $07F461 |
  JSL spawn_ambient_sprite                  ; $07F464 |
  LDA #$0005                                ; $07F468 |
  STA $73C2,y                               ; $07F46B |
  LDA #$0002                                ; $07F46E |
  STA $7782,y                               ; $07F471 |
  LDA !s_spr_x_hitbox_center,x              ; $07F474 |
  STA $70A2,y                               ; $07F477 |
  LDA !s_spr_y_pixel_pos,x                  ; $07F47A |
  CLC                                       ; $07F47D |
  ADC $00                                   ; $07F47E |
  CLC                                       ; $07F480 |
  ADC #$0008                                ; $07F481 |
  STA $7142,y                               ; $07F484 |

CODE_07F487:
  LDX $12                                   ; $07F487 |
  SEP #$20                                  ; $07F489 |
  LDA #$FF                                  ; $07F48B |
  STA !s_spr_stage_id,x                     ; $07F48D |
  REP #$20                                  ; $07F490 |
  PLA                                       ; $07F492 |
  JML $039F91                               ; $07F493 |

CODE_07F497:
  LDA !s_spr_bitwise_settings_1,x           ; $07F497 |
  AND #$0400                                ; $07F49A |
  BEQ CODE_07F4B3                           ; $07F49D |
  TXA                                       ; $07F49F |
  STA !gsu_r1                               ; $07F4A0 |
  LDX #$09                                  ; $07F4A3 |
  LDA #$8F33                                ; $07F4A5 |
  JSL r_gsu_init_1                          ; $07F4A8 | GSU init
  LDX $12                                   ; $07F4AC |
  LDY !gsu_r1                               ; $07F4AE |
  BPL CODE_07F4B4                           ; $07F4B1 |

CODE_07F4B3:
  RTS                                       ; $07F4B3 |

CODE_07F4B4:
  LDA !s_spr_hitbox_width,y                 ; $07F4B4 |
  CLC                                       ; $07F4B7 |
  ADC #$0006                                ; $07F4B8 |
  STA $00                                   ; $07F4BB |
  LDA !s_spr_x_hitbox_center,x              ; $07F4BD |
  SEC                                       ; $07F4C0 |
  SBC !s_spr_x_hitbox_center,y              ; $07F4C1 |
  BPL CODE_07F4CA                           ; $07F4C4 |
  EOR #$FFFF                                ; $07F4C6 |
  INC A                                     ; $07F4C9 |

CODE_07F4CA:
  CMP $00                                   ; $07F4CA |
  BCS CODE_07F4B3                           ; $07F4CC |
  LDA !s_spr_hitbox_height,y                ; $07F4CE |
  CLC                                       ; $07F4D1 |
  ADC #$0006                                ; $07F4D2 |
  STA $00                                   ; $07F4D5 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07F4D7 |
  TAX                                       ; $07F4DA |
  LDA $F3F8,x                               ; $07F4DB |
  LDX $12                                   ; $07F4DE |
  CLC                                       ; $07F4E0 |
  ADC !s_spr_y_pixel_pos,x                  ; $07F4E1 |
  CLC                                       ; $07F4E4 |
  ADC #$0008                                ; $07F4E5 |
  STA $04                                   ; $07F4E8 |
  SEC                                       ; $07F4EA |
  SBC !s_spr_y_hitbox_center,y              ; $07F4EB |
  BPL CODE_07F4F4                           ; $07F4EE |
  EOR #$FFFF                                ; $07F4F0 |
  INC A                                     ; $07F4F3 |

CODE_07F4F4:
  CMP $00                                   ; $07F4F4 |
  BCS CODE_07F4B3                           ; $07F4F6 |
  LDA !s_spr_y_accel,y                      ; $07F4F8 |
  CMP #$0040                                ; $07F4FB |
  BCC CODE_07F507                           ; $07F4FE |
  TYX                                       ; $07F500 |
  JSL $03B24B                               ; $07F501 |
  LDX $12                                   ; $07F505 |

CODE_07F507:
  LDA #$003B                                ; $07F507 |\ play sound #$003B
  JSL push_sound_queue                      ; $07F50A |/
  LDA #$01EF                                ; $07F50E |
  JSL spawn_ambient_sprite                  ; $07F511 |
  LDA #$0005                                ; $07F515 |
  STA $73C2,y                               ; $07F518 |
  LDA #$0002                                ; $07F51B |
  STA $7782,y                               ; $07F51E |
  LDA !s_spr_x_hitbox_center,x              ; $07F521 |
  STA $70A2,y                               ; $07F524 |
  LDA $04                                   ; $07F527 |
  STA $7142,y                               ; $07F529 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $07F52C |
  TAX                                       ; $07F52F |
  LDA $F7A3,x                               ; $07F530 |
  JSR ($F7BD,x)                             ; $07F533 |
  PLA                                       ; $07F536 |
  RTL                                       ; $07F537 |

CODE_07F538:
  LDY !s_spr_collision_id,x                 ; $07F538 |
  BPL CODE_07F57E                           ; $07F53B |
  LDY !s_spr_gsu_morph_1_lo,x               ; $07F53D |
  LDA !s_spr_y_pixel_pos,x                  ; $07F540 |
  CLC                                       ; $07F543 |
  ADC $F3F8,y                               ; $07F544 |
  CLC                                       ; $07F547 |
  ADC #$0008                                ; $07F548 |
  STA $00                                   ; $07F54B |
  LDA #$003B                                ; $07F54D |\ play sound #$003B
  JSL push_sound_queue                      ; $07F550 |/
  LDA #$01EF                                ; $07F554 |
  JSL spawn_ambient_sprite                  ; $07F557 |
  LDA #$0005                                ; $07F55B |
  STA $73C2,y                               ; $07F55E |
  LDA #$0002                                ; $07F561 |
  STA $7782,y                               ; $07F564 |
  LDA !s_spr_x_hitbox_center,x              ; $07F567 |
  STA $70A2,y                               ; $07F56A |
  LDA $00                                   ; $07F56D |
  STA $7142,y                               ; $07F56F |
  LDY !s_spr_gsu_morph_1_lo,x               ; $07F572 |
  TYX                                       ; $07F575 |
  LDA $F7A3,x                               ; $07F576 |
  JSR ($F7BD,x)                             ; $07F579 |
  PLA                                       ; $07F57C |
  RTL                                       ; $07F57D |

CODE_07F57E:
  RTS                                       ; $07F57E |

  db $38, $50, $68                          ; $07F57F |

CODE_07F582:
  SEP #$20                                  ; $07F582 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07F584 |
  BPL CODE_07F592                           ; $07F586 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $07F588 |
  BPL CODE_07F59C                           ; $07F58A |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07F58C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07F58E |
  BRA CODE_07F5A4                           ; $07F590 |

CODE_07F592:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $07F592 |
  BPL CODE_07F5A8                           ; $07F594 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07F596 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $07F598 |
  BRA CODE_07F5A4                           ; $07F59A |

CODE_07F59C:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $07F59C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07F59E |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07F5A0 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $07F5A2 |

CODE_07F5A4:
  LDA #$FF                                  ; $07F5A4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07F5A6 |

CODE_07F5A8:
  STZ $03                                   ; $07F5A8 |
  LDA !s_spr_wildcard_5_hi_dp,x             ; $07F5AA |
  STA $02                                   ; $07F5AC |
  DEC A                                     ; $07F5AE |
  ASL A                                     ; $07F5AF |
  TAY                                       ; $07F5B0 |
  REP #$20                                  ; $07F5B1 |
  LDA $F38B,y                               ; $07F5B3 |
  STA $00                                   ; $07F5B6 |
  TXA                                       ; $07F5B8 |
  STA !gsu_r1                               ; $07F5B9 |
  LDX #$09                                  ; $07F5BC |
  LDA #$8F33                                ; $07F5BE |
  JSL r_gsu_init_1                          ; $07F5C1 | GSU init
  LDX $12                                   ; $07F5C5 |
  LDY !gsu_r1                               ; $07F5C7 |
  BPL CODE_07F5CD                           ; $07F5CA |
  RTS                                       ; $07F5CC |

CODE_07F5CD:
  LDA !s_spr_hitbox_width,y                 ; $07F5CD |
  CLC                                       ; $07F5D0 |
  ADC #$0003                                ; $07F5D1 |
  STA $0C                                   ; $07F5D4 |
  LDA !s_spr_hitbox_height,y                ; $07F5D6 |
  CLC                                       ; $07F5D9 |
  ADC #$0003                                ; $07F5DA |
  STA $0E                                   ; $07F5DD |

CODE_07F5DF:
  LDA ($00)                                 ; $07F5DF |
  AND #$00FF                                ; $07F5E1 |
  BIT #$0080                                ; $07F5E4 |
  BEQ CODE_07F5EC                           ; $07F5E7 |
  ORA #$FF00                                ; $07F5E9 |

CODE_07F5EC:
  CLC                                       ; $07F5EC |
  ADC !s_spr_y_pixel_pos,x                  ; $07F5ED |
  CLC                                       ; $07F5F0 |
  ADC #$0008                                ; $07F5F1 |
  STA $04                                   ; $07F5F4 |
  DEC $00                                   ; $07F5F6 |
  LDA ($00)                                 ; $07F5F8 |
  AND #$00FF                                ; $07F5FA |
  BIT #$0080                                ; $07F5FD |
  BEQ CODE_07F605                           ; $07F600 |
  ORA #$FF00                                ; $07F602 |

CODE_07F605:
  CLC                                       ; $07F605 |
  ADC !s_spr_x_pixel_pos,x                  ; $07F606 |
  CLC                                       ; $07F609 |
  ADC #$0008                                ; $07F60A |
  STA $06                                   ; $07F60D |
  SEC                                       ; $07F60F |
  SBC !s_spr_x_hitbox_center,y              ; $07F610 |
  BPL CODE_07F619                           ; $07F613 |
  EOR #$FFFF                                ; $07F615 |
  INC A                                     ; $07F618 |

CODE_07F619:
  CMP $0C                                   ; $07F619 |
  BCC CODE_07F620                           ; $07F61B |

CODE_07F61D:
  JMP CODE_07F6B3                           ; $07F61D |

CODE_07F620:
  LDA $04                                   ; $07F620 |
  SEC                                       ; $07F622 |
  SBC !s_spr_y_hitbox_center,y              ; $07F623 |
  BPL CODE_07F62C                           ; $07F626 |
  EOR #$FFFF                                ; $07F628 |
  INC A                                     ; $07F62B |

CODE_07F62C:
  CMP $0E                                   ; $07F62C |
  BCS CODE_07F61D                           ; $07F62E |
  LDA !s_spr_y_accel,y                      ; $07F630 |
  CMP #$0040                                ; $07F633 |
  BCC CODE_07F63F                           ; $07F636 |
  TYX                                       ; $07F638 |
  JSL $03B24B                               ; $07F639 |
  LDX $12                                   ; $07F63D |

CODE_07F63F:
  LDA #$003B                                ; $07F63F |\ play sound #$003B
  JSL push_sound_queue                      ; $07F642 |/
  SEP #$20                                  ; $07F646 |
  LDA #$FF                                  ; $07F648 |
  STA !s_spr_stage_id,x                     ; $07F64A |
  REP #$20                                  ; $07F64D |
  LDA #$01EF                                ; $07F64F |
  JSL spawn_ambient_sprite                  ; $07F652 |
  LDA #$0005                                ; $07F656 |
  STA $73C2,y                               ; $07F659 |
  LDA #$0002                                ; $07F65C |
  STA $7782,y                               ; $07F65F |
  LDA $06                                   ; $07F662 |
  STA $70A2,y                               ; $07F664 |
  LDA $04                                   ; $07F667 |
  STA $7142,y                               ; $07F669 |
  LDA #$00C0                                ; $07F66C |
  STA !s_spr_y_speed_lo,x                   ; $07F66F |
  SEP #$20                                  ; $07F672 |
  DEC !s_spr_wildcard_5_hi_dp,x             ; $07F674 |
  REP #$20                                  ; $07F676 |
  BNE CODE_07F67F                           ; $07F678 |
  JSR CODE_07F8C9                           ; $07F67A |
  BRA CODE_07F6B1                           ; $07F67D |

CODE_07F67F:
  SEP #$20                                  ; $07F67F |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $07F681 |
  DEY                                       ; $07F683 |
  LDA !s_spr_oam_count,x                    ; $07F684 |
  AND #$07                                  ; $07F687 |
  ORA $F57F,y                               ; $07F689 |
  STA !s_spr_oam_count,x                    ; $07F68C |
  LDA #$FF                                  ; $07F68F |
  LDY $02                                   ; $07F691 |
  CPY #$03                                  ; $07F693 |
  BNE CODE_07F6A5                           ; $07F695 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07F697 |
  LDA !s_spr_wildcard_4_hi_dp,x             ; $07F699 |
  PHA                                       ; $07F69B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07F69C |
  STA !s_spr_wildcard_4_hi_dp,x             ; $07F69E |
  PLA                                       ; $07F6A0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $07F6A1 |
  BRA CODE_07F6AF                           ; $07F6A3 |

CODE_07F6A5:
  CPY #$02                                  ; $07F6A5 |
  BNE CODE_07F6AD                           ; $07F6A7 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $07F6A9 |
  BRA CODE_07F6AF                           ; $07F6AB |

CODE_07F6AD:
  STA !s_spr_wildcard_5_lo_dp,x             ; $07F6AD |

CODE_07F6AF:
  REP #$20                                  ; $07F6AF |

CODE_07F6B1:
  PLA                                       ; $07F6B1 |
  RTL                                       ; $07F6B2 |

CODE_07F6B3:
  LDA $00                                   ; $07F6B3 |
  SEC                                       ; $07F6B5 |
  SBC #$0005                                ; $07F6B6 |
  STA $00                                   ; $07F6B9 |
  DEC $02                                   ; $07F6BB |
  BEQ CODE_07F6C2                           ; $07F6BD |
  JMP CODE_07F5DF                           ; $07F6BF |

CODE_07F6C2:
  RTS                                       ; $07F6C2 |

  dw $0008                                  ; $07F6C3 |

  dw $0001, $000F                           ; $07F6C5 |

  dw $FFFC, $0014, $0008                    ; $07F6C9 |

  dw $FFEE                                  ; $07F6CF |

  dw $FFEF, $FFEF                           ; $07F6D1 |

  dw $FFF0, $FFF0, $FFEC                    ; $07F6D5 |

  dw $F6C3                                  ; $07F6DB |
  dw $F6C5                                  ; $07F6DD |
  dw $F6C9                                  ; $07F6DF |
  dw $F6CF                                  ; $07F6E1 |
  dw $F6D1                                  ; $07F6E3 |
  dw $F6D5                                  ; $07F6E5 |

CODE_07F6E7:
  LDY !s_spr_collision_id,x                 ; $07F6E7 |
  BPL CODE_07F745                           ; $07F6EA |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $07F6EC |
  DEY                                       ; $07F6EE |
  PHY                                       ; $07F6EF |
  TYA                                       ; $07F6F0 |
  ASL A                                     ; $07F6F1 |
  TAY                                       ; $07F6F2 |
  LDA $F6DB,y                               ; $07F6F3 |
  STA $0C                                   ; $07F6F6 |
  LDA $F6E1,y                               ; $07F6F8 |
  STA $0E                                   ; $07F6FB |
  PLY                                       ; $07F6FD |

CODE_07F6FE:
  PHY                                       ; $07F6FE |
  ASL A                                     ; $07F6FF |
  AND #$00FF                                ; $07F700 |
  STA $04                                   ; $07F703 |
  TYA                                       ; $07F705 |
  ASL A                                     ; $07F706 |
  TAY                                       ; $07F707 |
  LDA !s_spr_x_pixel_pos,x                  ; $07F708 |
  CLC                                       ; $07F70B |
  ADC ($0C),y                               ; $07F70C |
  STA $06                                   ; $07F70E |
  LDA !s_spr_y_pixel_pos,x                  ; $07F710 |
  CLC                                       ; $07F713 |
  ADC ($0E),y                               ; $07F714 |
  STA $08                                   ; $07F716 |
  LDA #$003B                                ; $07F718 |\ play sound #$003B
  JSL push_sound_queue                      ; $07F71B |/
  LDA #$01EF                                ; $07F71F |
  JSL spawn_ambient_sprite                  ; $07F722 |
  LDA #$0005                                ; $07F726 |
  STA $73C2,y                               ; $07F729 |
  LDA #$0002                                ; $07F72C |
  STA $7782,y                               ; $07F72F |
  LDA $06                                   ; $07F732 |
  STA $70A2,y                               ; $07F734 |
  LDA $08                                   ; $07F737 |
  STA $7142,y                               ; $07F739 |
  PLY                                       ; $07F73C |
  DEY                                       ; $07F73D |
  BPL CODE_07F6FE                           ; $07F73E |
  JSR CODE_07F8C9                           ; $07F740 |
  PLA                                       ; $07F743 |
  RTL                                       ; $07F744 |

CODE_07F745:
  RTS                                       ; $07F745 |

CODE_07F746:
  LDA !s_spr_cam_x_pos,x                    ; $07F746 |
  CMP #$00F0                                ; $07F749 |
  BCS CODE_07F7A2                           ; $07F74C |
  LDA !s_spr_x_hitbox_center,x              ; $07F74E |
  SEC                                       ; $07F751 |
  SBC !s_player_center_x                    ; $07F752 |
  CLC                                       ; $07F755 |
  ADC #$0004                                ; $07F756 |
  CMP #$0008                                ; $07F759 |
  BCS CODE_07F7A2                           ; $07F75C |
  LDA #$000E                                ; $07F75E |\ play sound #$000E
  JSL push_sound_queue                      ; $07F761 |/
  LDY !s_spr_gsu_morph_1_lo,x               ; $07F765 |
  LDA $F3F8,y                               ; $07F768 |
  STA $00                                   ; $07F76B |
  LDA #$017F                                ; $07F76D |
  JSL spawn_sprite_active                   ; $07F770 |
  BCC CODE_07F796                           ; $07F774 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07F776 |
  STA !s_spr_wildcard_4_lo,y                ; $07F778 |
  LDA !s_spr_x_speed_lo,x                   ; $07F77B |
  STA !s_spr_x_speed_lo,y                   ; $07F77E |
  LDA !s_spr_facing_dir,x                   ; $07F781 |
  STA !s_spr_facing_dir,y                   ; $07F784 |
  LDA !s_spr_x_pixel_pos,x                  ; $07F787 |
  STA !s_spr_x_pixel_pos,y                  ; $07F78A |
  LDA !s_spr_y_pixel_pos,x                  ; $07F78D |
  CLC                                       ; $07F790 |
  ADC $00                                   ; $07F791 |
  STA !s_spr_y_pixel_pos,y                  ; $07F793 |

CODE_07F796:
  LDA !s_spr_gsu_morph_1_lo,x               ; $07F796 |
  TAX                                       ; $07F799 |
  LDA $F7A3,x                               ; $07F79A |
  JSR ($F7BD,x)                             ; $07F79D |
  PLA                                       ; $07F7A0 |
  RTL                                       ; $07F7A1 |

CODE_07F7A2:
  RTS                                       ; $07F7A2 |

  dw $001E, $0163, $0060, $0020             ; $07F7A3 |
  dw $0148, $0100, $0027, $0115             ; $07F7AB |
  dw $0007, $0009, $0005, $010E             ; $07F7B3 |
  dw $0026                                  ; $07F7BB |

  dw $F7D7                                  ; $07F7BD |
  dw $F857                                  ; $07F7BF |
  dw $F808                                  ; $07F7C1 |
  dw $F82C                                  ; $07F7C3 |
  dw $F982                                  ; $07F7C5 |
  dw $F974                                  ; $07F7C7 |
  dw $F86D                                  ; $07F7C9 |
  dw $F908                                  ; $07F7CB |
  dw $F8A6                                  ; $07F7CD |
  dw $F8A6                                  ; $07F7CF |
  dw $F8A6                                  ; $07F7D1 |
  dw $F8C9                                  ; $07F7D3 |
  dw $F9AD                                  ; $07F7D5 |

  LDX $12                                   ; $07F7D7 |
  TXY                                       ; $07F7D9 |
  JSL $03A377                               ; $07F7DA |
  SEP #$20                                  ; $07F7DE |
  LDA #$FF                                  ; $07F7E0 |
  STA !s_spr_stage_id,x                     ; $07F7E2 |
  REP #$20                                  ; $07F7E5 |
  LDA #$0004                                ; $07F7E7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07F7EA |
  LDA !s_spr_oam_yxppccct,x                 ; $07F7EC |
  ORA #$0002                                ; $07F7EF |
  STA !s_spr_oam_yxppccct,x                 ; $07F7F2 |
  INC A                                     ; $07F7F5 |
  STA !s_spr_wildcard_2_lo,x                ; $07F7F6 |
  LDA !s_spr_state,x                        ; $07F7F9 |
  CMP #$0010                                ; $07F7FC |
  BEQ CODE_07F807                           ; $07F7FF |
  LDA #$0002                                ; $07F801 |
  STA !s_spr_state,x                        ; $07F804 |

CODE_07F807:
  RTS                                       ; $07F807 |

  LDX $12                                   ; $07F808 |
  TXY                                       ; $07F80A |
  JSL $03A377                               ; $07F80B |
  SEP #$20                                  ; $07F80F |
  LDA #$FF                                  ; $07F811 |
  STA !s_spr_stage_id,x                     ; $07F813 |
  REP #$20                                  ; $07F816 |
  LDA #$0001                                ; $07F818 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07F81B |
  LDA !s_spr_state,x                        ; $07F81D |
  CMP #$0010                                ; $07F820 |
  BEQ CODE_07F82B                           ; $07F823 |
  LDA #$0002                                ; $07F825 |
  STA !s_spr_state,x                        ; $07F828 |

CODE_07F82B:
  RTS                                       ; $07F82B |

  LDX $12                                   ; $07F82C |
  TXY                                       ; $07F82E |
  JSL $03A377                               ; $07F82F |
  SEP #$20                                  ; $07F833 |
  LDA #$FF                                  ; $07F835 |
  STA !s_spr_stage_id,x                     ; $07F837 |
  REP #$20                                  ; $07F83A |
  LDA #$000C                                ; $07F83C |
  STA !s_spr_wildcard_5_lo,y                ; $07F83F |
  LDA #$0017                                ; $07F842 |
  STA !s_spr_anim_frame,y                   ; $07F845 |
  LDA !s_spr_state,x                        ; $07F848 |
  CMP #$0010                                ; $07F84B |
  BEQ CODE_07F856                           ; $07F84E |
  LDA #$0002                                ; $07F850 |
  STA !s_spr_state,x                        ; $07F853 |

CODE_07F856:
  RTS                                       ; $07F856 |

  LDX $12                                   ; $07F857 |
  TXY                                       ; $07F859 |
  JSL $03A377                               ; $07F85A |
  LDA !s_spr_state,x                        ; $07F85E |
  CMP #$0010                                ; $07F861 |
  BEQ CODE_07F86C                           ; $07F864 |
  LDA #$0002                                ; $07F866 |
  STA !s_spr_state,x                        ; $07F869 |

CODE_07F86C:
  RTS                                       ; $07F86C |

  LDX $12                                   ; $07F86D |
  PHA                                       ; $07F86F |
  LDA !s_spr_gsu_morph_2_lo,x               ; $07F870 |
  PHA                                       ; $07F873 |
  AND #$FF00                                ; $07F874 |
  LSR A                                     ; $07F877 |
  LSR A                                     ; $07F878 |
  LSR A                                     ; $07F879 |
  LSR A                                     ; $07F87A |
  STA $00                                   ; $07F87B |
  PLA                                       ; $07F87D |
  AND #$00FF                                ; $07F87E |
  ASL A                                     ; $07F881 |
  ASL A                                     ; $07F882 |
  ASL A                                     ; $07F883 |
  ASL A                                     ; $07F884 |
  STA $02                                   ; $07F885 |
  TXY                                       ; $07F887 |
  PLA                                       ; $07F888 |
  JSL $03A377                               ; $07F889 |
  LDA $00                                   ; $07F88D |
  STA !s_spr_wildcard_1_lo,x                ; $07F88F |
  LDA $02                                   ; $07F892 |
  STA !s_spr_wildcard_2_lo,x                ; $07F894 |
  LDA !s_spr_state,x                        ; $07F897 |
  CMP #$0010                                ; $07F89A |
  BEQ CODE_07F8A5                           ; $07F89D |
  LDA #$0010                                ; $07F89F |
  STA !s_spr_state,x                        ; $07F8A2 |

CODE_07F8A5:
  RTS                                       ; $07F8A5 |

  LDX $12                                   ; $07F8A6 |
  TXY                                       ; $07F8A8 |
  JSL $03A377                               ; $07F8A9 |
  SEP #$20                                  ; $07F8AD |
  LDA #$FF                                  ; $07F8AF |
  STA !s_spr_stage_id,x                     ; $07F8B1 |
  REP #$20                                  ; $07F8B4 |
  JSL $048066                               ; $07F8B6 |
  LDA !s_spr_state,x                        ; $07F8BA |
  CMP #$0010                                ; $07F8BD |
  BEQ CODE_07F8C8                           ; $07F8C0 |
  LDA #$0002                                ; $07F8C2 |
  STA !s_spr_state,x                        ; $07F8C5 |

CODE_07F8C8:
  RTS                                       ; $07F8C8 |

CODE_07F8C9:
  LDX $12                                   ; $07F8C9 |
  JSL $03AEFD                               ; $07F8CB |
  TXY                                       ; $07F8CF |
  LDA #$010E                                ; $07F8D0 |
  JSL $03A377                               ; $07F8D3 |
  SEP #$20                                  ; $07F8D7 |
  LDA #$FF                                  ; $07F8D9 |
  STA !s_spr_stage_id,x                     ; $07F8DB |
  REP #$20                                  ; $07F8DE |
  LDA !s_spr_y_pixel_pos,x                  ; $07F8E0 |
  CLC                                       ; $07F8E3 |
  ADC #$0008                                ; $07F8E4 |
  STA !s_spr_y_pixel_pos,x                  ; $07F8E7 |
  LDA #$0001                                ; $07F8EA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $07F8ED |
  PHB                                       ; $07F8EF |
  LDY #$0D                                  ; $07F8F0 |
  PHY                                       ; $07F8F2 |
  PLB                                       ; $07F8F3 |
  JSL $0D8E60                               ; $07F8F4 |
  PLB                                       ; $07F8F8 |
  LDA #$0010                                ; $07F8F9 |
  STA !s_spr_state,x                        ; $07F8FC |
  RTS                                       ; $07F8FF |

  dw $0100, $0080, $FF00, $FE80             ; $07F900 |

  LDX $12                                   ; $07F908 |
  TXY                                       ; $07F90A |
  JSL $03A377                               ; $07F90B |
  JSL $04C968                               ; $07F90F |
  SEP #$20                                  ; $07F913 |
  LDA #$FF                                  ; $07F915 |
  STA !s_spr_stage_id,x                     ; $07F917 |
  REP #$20                                  ; $07F91A |
  LDA #$0018                                ; $07F91C |\ play sound #$0018
  JSL push_sound_queue                      ; $07F91F |/
  LDA !s_spr_state,x                        ; $07F923 |
  CMP #$0010                                ; $07F926 |
  BEQ CODE_07F931                           ; $07F929 |
  LDA #$0002                                ; $07F92B |
  STA !s_spr_state,x                        ; $07F92E |

CODE_07F931:
  LDA #$0006                                ; $07F931 |
  STA $00                                   ; $07F934 |

CODE_07F936:
  JSL random_number_gen                     ; $07F936 |
  LDY $00                                   ; $07F93A |
  LDA $F900,y                               ; $07F93C |
  STA $02                                   ; $07F93F |
  LDA #$0115                                ; $07F941 |
  JSL spawn_sprite_init                     ; $07F944 |
  BCC CODE_07F973                           ; $07F948 |
  LDA !s_spr_x_pixel_pos,x                  ; $07F94A |
  STA !s_spr_x_pixel_pos,y                  ; $07F94D |
  LDA !s_spr_y_pixel_pos,x                  ; $07F950 |
  STA !s_spr_y_pixel_pos,y                  ; $07F953 |
  LDA $10                                   ; $07F956 |
  AND #$00FF                                ; $07F958 |
  CLC                                       ; $07F95B |
  ADC $02                                   ; $07F95C |
  STA !s_spr_x_speed_lo,y                   ; $07F95E |
  LDA $10                                   ; $07F961 |
  AND #$01FF                                ; $07F963 |
  EOR #$FFFF                                ; $07F966 |
  INC A                                     ; $07F969 |
  STA !s_spr_y_speed_lo,y                   ; $07F96A |
  DEC $00                                   ; $07F96D |
  DEC $00                                   ; $07F96F |
  BPL CODE_07F936                           ; $07F971 |

CODE_07F973:
  RTS                                       ; $07F973 |

CODE_07F974:
  LDX $12                                   ; $07F974 |
  JSL $03A496                               ; $07F976 |
  JSR CODE_07FB0A                           ; $07F97A |
  JSL $03A32E                               ; $07F97D |
  RTS                                       ; $07F981 |

  LDX $12                                   ; $07F982 |
  PHA                                       ; $07F984 |
  JSL $03AEFD                               ; $07F985 |
  PLA                                       ; $07F989 |
  TXY                                       ; $07F98A |
  JSL $03A377                               ; $07F98B |
  LDA !s_spr_y_pixel_pos,x                  ; $07F98F |
  CLC                                       ; $07F992 |
  ADC #$0010                                ; $07F993 |
  ORA #$0001                                ; $07F996 |
  STA !s_spr_y_pixel_pos,x                  ; $07F999 |
  PHB                                       ; $07F99C |
  LDY #$05                                  ; $07F99D |
  PHY                                       ; $07F99F |
  PLB                                       ; $07F9A0 |
  JSL $0582B5                               ; $07F9A1 |
  PLB                                       ; $07F9A5 |
  LDA #$0010                                ; $07F9A6 |
  STA !s_spr_state,x                        ; $07F9A9 |
  RTS                                       ; $07F9AC |

  LDX $12                                   ; $07F9AD |
  TXY                                       ; $07F9AF |
  JSL $03A377                               ; $07F9B0 |
  LDA #$0040                                ; $07F9B4 |
  STA !s_spr_y_accel,x                      ; $07F9B7 |
  LDA !s_spr_state,x                        ; $07F9BA |
  CMP #$0010                                ; $07F9BD |
  BEQ CODE_07F9C8                           ; $07F9C0 |
  LDA #$0002                                ; $07F9C2 |
  STA !s_spr_state,x                        ; $07F9C5 |

CODE_07F9C8:
  RTS                                       ; $07F9C8 |

CODE_07F9C9:
  LDA !s_spr_state,x                        ; $07F9C9 |
  CMP #$0008                                ; $07F9CC |
  BEQ CODE_07F9D2                           ; $07F9CF |
  RTS                                       ; $07F9D1 |

CODE_07F9D2:
  LDA !s_spr_gsu_morph_1_lo,x               ; $07F9D2 |
  TAX                                       ; $07F9D5 |
  LDA $F7A3,x                               ; $07F9D6 |
  JMP ($F9DC,x)                             ; $07F9D9 |

  dw $F9F9                                  ; $07F9DC |
  dw $FA2C                                  ; $07F9DE |
  dw $FA2C                                  ; $07F9E0 |
  dw $F9F6                                  ; $07F9E2 |
  dw $F9F6                                  ; $07F9E4 |
  dw $FABE                                  ; $07F9E6 |
  dw $F9F6                                  ; $07F9E8 |
  dw $FA6F                                  ; $07F9EA |
  dw $FA2C                                  ; $07F9EC |
  dw $FA2C                                  ; $07F9EE |
  dw $FA2C                                  ; $07F9F0 |
  dw $F9F6                                  ; $07F9F2 |
  dw $FA16                                  ; $07F9F4 |

  LDX $12                                   ; $07F9F6 |
  RTS                                       ; $07F9F8 |

  PHA                                       ; $07F9F9 |
  TXA                                       ; $07F9FA |
  ASL A                                     ; $07F9FB |
  TAX                                       ; $07F9FC |
  LDY $12                                   ; $07F9FD |
  PLA                                       ; $07F9FF |
  JSL $03A377                               ; $07FA00 |
  TXY                                       ; $07FA04 |
  LDX $12                                   ; $07FA05 |
  LDA !s_spr_oam_yxppccct,x                 ; $07FA07 |
  ORA #$0002                                ; $07FA0A |
  STA !s_spr_oam_yxppccct,x                 ; $07FA0D |
  INC A                                     ; $07FA10 |
  STA !s_spr_wildcard_2_lo,x                ; $07FA11 |
  BRA CODE_07FA3A                           ; $07FA14 |
  PHA                                       ; $07FA16 |
  TXA                                       ; $07FA17 |
  ASL A                                     ; $07FA18 |
  TAX                                       ; $07FA19 |
  LDY $12                                   ; $07FA1A |
  PLA                                       ; $07FA1C |
  JSL $03A377                               ; $07FA1D |
  TXY                                       ; $07FA21 |
  LDX $12                                   ; $07FA22 |
  LDA #$0040                                ; $07FA24 |
  STA !s_spr_y_accel,x                      ; $07FA27 |
  BRA CODE_07FA3A                           ; $07FA2A |
  PHA                                       ; $07FA2C |
  TXA                                       ; $07FA2D |
  ASL A                                     ; $07FA2E |
  TAX                                       ; $07FA2F |
  LDY $12                                   ; $07FA30 |
  PLA                                       ; $07FA32 |
  JSL $03A377                               ; $07FA33 |
  TXY                                       ; $07FA37 |
  LDX $12                                   ; $07FA38 |

CODE_07FA3A:
  SEP #$20                                  ; $07FA3A |
  LDA #$FF                                  ; $07FA3C |
  STA !s_spr_stage_id,x                     ; $07FA3E |
  REP #$20                                  ; $07FA41 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FA43 |
  CLC                                       ; $07FA46 |
  ADC $F3F8,y                               ; $07FA47 |
  CLC                                       ; $07FA4A |
  ADC #$0008                                ; $07FA4B |
  STA $00                                   ; $07FA4E |
  LDA #$01EF                                ; $07FA50 |
  JSL spawn_ambient_sprite                  ; $07FA53 |
  LDA #$0005                                ; $07FA57 |
  STA $73C2,y                               ; $07FA5A |
  LDA #$0002                                ; $07FA5D |
  STA $7782,y                               ; $07FA60 |
  LDA !s_spr_x_hitbox_center,x              ; $07FA63 |
  STA $70A2,y                               ; $07FA66 |
  LDA $00                                   ; $07FA69 |
  STA $7142,y                               ; $07FA6B |
  RTS                                       ; $07FA6E |

  PHA                                       ; $07FA6F |
  TXA                                       ; $07FA70 |
  ASL A                                     ; $07FA71 |
  TAX                                       ; $07FA72 |
  LDY $12                                   ; $07FA73 |
  PLA                                       ; $07FA75 |
  JSL $03A377                               ; $07FA76 |
  TXY                                       ; $07FA7A |
  LDX $12                                   ; $07FA7B |
  SEP #$20                                  ; $07FA7D |
  LDA #$FF                                  ; $07FA7F |
  STA !s_spr_stage_id,x                     ; $07FA81 |
  REP #$20                                  ; $07FA84 |
  LDA #$0018                                ; $07FA86 |\ play sound #$0018
  JSL push_sound_queue                      ; $07FA89 |/
  STZ !s_tongued_sprite_slot                ; $07FA8D |
  LDA !s_spr_y_pixel_pos,x                  ; $07FA90 |
  CLC                                       ; $07FA93 |
  ADC $F3F8,y                               ; $07FA94 |
  CLC                                       ; $07FA97 |
  ADC #$0008                                ; $07FA98 |
  STA $00                                   ; $07FA9B |
  LDA #$01EF                                ; $07FA9D |
  JSL spawn_ambient_sprite                  ; $07FAA0 |
  LDA #$0005                                ; $07FAA4 |
  STA $73C2,y                               ; $07FAA7 |
  LDA #$0002                                ; $07FAAA |
  STA $7782,y                               ; $07FAAD |
  LDA !s_spr_x_hitbox_center,x              ; $07FAB0 |
  STA $70A2,y                               ; $07FAB3 |
  LDA $00                                   ; $07FAB6 |
  STA $7142,y                               ; $07FAB8 |
  JMP CODE_07F931                           ; $07FABB |
  LDA #$0018                                ; $07FABE |\ play sound #$0018
  JSL push_sound_queue                      ; $07FAC1 |/
  TXA                                       ; $07FAC5 |
  ASL A                                     ; $07FAC6 |
  TAY                                       ; $07FAC7 |
  LDX $12                                   ; $07FAC8 |
  SEP #$20                                  ; $07FACA |
  LDA #$FF                                  ; $07FACC |
  STA !s_spr_stage_id,x                     ; $07FACE |
  REP #$20                                  ; $07FAD1 |
  STZ $6162                                 ; $07FAD3 |
  STZ !s_tongued_sprite_slot                ; $07FAD6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FAD9 |
  CLC                                       ; $07FADC |
  ADC $F3F8,y                               ; $07FADD |
  CLC                                       ; $07FAE0 |
  ADC #$0008                                ; $07FAE1 |
  STA $00                                   ; $07FAE4 |
  LDA #$01EF                                ; $07FAE6 |
  JSL spawn_ambient_sprite                  ; $07FAE9 |
  LDA #$0005                                ; $07FAED |
  STA $73C2,y                               ; $07FAF0 |
  LDA #$0002                                ; $07FAF3 |
  STA $7782,y                               ; $07FAF6 |
  LDA !s_spr_x_hitbox_center,x              ; $07FAF9 |
  STA $70A2,y                               ; $07FAFC |
  LDA $00                                   ; $07FAFF |
  STA $7142,y                               ; $07FB01 |
  JSR CODE_07FB0A                           ; $07FB04 |
  JMP CODE_07F974                           ; $07FB07 |

CODE_07FB0A:
  LDA !s_spr_gsu_morph_2_lo,x               ; $07FB0A |
  PHA                                       ; $07FB0D |
  AND #$FF00                                ; $07FB0E |
  LSR A                                     ; $07FB11 |
  LSR A                                     ; $07FB12 |
  LSR A                                     ; $07FB13 |
  LSR A                                     ; $07FB14 |
  STA $04                                   ; $07FB15 |
  PLA                                       ; $07FB17 |
  AND #$00FF                                ; $07FB18 |
  ASL A                                     ; $07FB1B |
  ASL A                                     ; $07FB1C |
  ASL A                                     ; $07FB1D |
  ASL A                                     ; $07FB1E |
  JSL $03D3F3                               ; $07FB1F |
  RTS                                       ; $07FB23 |

init_baron_von_zeppelin:
  LDA !s_spr_facing_dir,x                   ; $07FB24 |
  TAY                                       ; $07FB27 |
  LDA $F110,y                               ; $07FB28 |
  STA !s_spr_x_speed_lo,x                   ; $07FB2B |
  SEP #$20                                  ; $07FB2E |
  LDA $10                                   ; $07FB30 |
  AND #$03                                  ; $07FB32 |
  TAY                                       ; $07FB34 |
  LDA $F10C,y                               ; $07FB35 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $07FB38 |
  REP #$20                                  ; $07FB3A |
  RTL                                       ; $07FB3C |

main_baron_von_zeppelin:
  STZ !gsu_r4                               ; $07FB3D |
  LDX #$08                                  ; $07FB40 |
  LDA #$95B9                                ; $07FB42 |
  JSL r_gsu_init_1                          ; $07FB45 | GSU init
  LDX $12                                   ; $07FB49 |
  JSL $03AF23                               ; $07FB4B |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $07FB4F |
  TAX                                       ; $07FB51 |
  JMP ($FB55,x)                             ; $07FB52 |

  dw $FB59                                  ; $07FB55 |
  dw $FB5F                                  ; $07FB57 |

  LDX $12                                   ; $07FB59 |
  JSR CODE_07FB8B                           ; $07FB5B |
  RTL                                       ; $07FB5E |

  LDX $12                                   ; $07FB5F |
  JSR CODE_07F3DB                           ; $07FB61 |
  LDA !s_player_center_x                    ; $07FB64 |
  SEC                                       ; $07FB67 |
  SBC #$0008                                ; $07FB68 |
  STA !s_spr_x_pixel_pos,x                  ; $07FB6B |
  LDA !s_spr_y_pixel_pos,x                  ; $07FB6E |
  CLC                                       ; $07FB71 |
  ADC #$0016                                ; $07FB72 |
  CLC                                       ; $07FB75 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $07FB76 |
  STA !s_player_y                           ; $07FB78 |
  LDA !s_player_direction                   ; $07FB7B |
  EOR #$0002                                ; $07FB7E |
  STA !s_spr_facing_dir,x                   ; $07FB81 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $07FB84 |
  BEQ CODE_07FB8A                           ; $07FB86 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $07FB88 |

CODE_07FB8A:
  RTL                                       ; $07FB8A |

CODE_07FB8B:
  LDY !s_spr_collision_id,x                 ; $07FB8B |
  DEY                                       ; $07FB8E |
  BEQ CODE_07FBD2                           ; $07FB8F |
  BMI CODE_07FBD2                           ; $07FB91 |
  LDA !s_spr_state,y                        ; $07FB93 |
  CMP #$0010                                ; $07FB96 |
  BNE CODE_07FBD2                           ; $07FB99 |
  LDA !s_spr_collision_state,y              ; $07FB9B |
  BEQ CODE_07FBD2                           ; $07FB9E |
  TYX                                       ; $07FBA0 |
  JSL $03B24B                               ; $07FBA1 |
  LDX $12                                   ; $07FBA5 |
  LDA #$003B                                ; $07FBA7 |\
  JSL push_sound_queue                      ; $07FBAA |/ play sound #$003B
  LDA #$01EF                                ; $07FBAE |
  JSL spawn_ambient_sprite                  ; $07FBB1 |
  LDA #$0005                                ; $07FBB5 |
  STA $73C2,y                               ; $07FBB8 |
  LDA #$0002                                ; $07FBBB |
  STA $7782,y                               ; $07FBBE |
  LDA !s_spr_x_hitbox_center,x              ; $07FBC1 |
  STA $70A2,y                               ; $07FBC4 |
  LDA !s_spr_y_hitbox_center,x              ; $07FBC7 |
  STA $7142,y                               ; $07FBCA |
  PLA                                       ; $07FBCD |
  JML $03A32E                               ; $07FBCE |

CODE_07FBD2:
  RTS                                       ; $07FBD2 |

  LDA !s_spr_x_pixel_pos,x                  ; $07FBD3 |
  CLC                                       ; $07FBD6 |
  ADC #$0008                                ; $07FBD7 |
  SEC                                       ; $07FBDA |
  SBC !s_player_center_x                    ; $07FBDB |
  BNE CODE_07FC0C                           ; $07FBDE |
  LDA !s_player_hitbox_half_height          ; $07FBE0 |
  CLC                                       ; $07FBE3 |
  ADC #$0004                                ; $07FBE4 |
  STA $00                                   ; $07FBE7 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FBE9 |
  CLC                                       ; $07FBEC |
  ADC #$0016                                ; $07FBED |
  SEC                                       ; $07FBF0 |
  SBC !s_player_center_y                    ; $07FBF1 |
  CLC                                       ; $07FBF4 |
  ADC $00                                   ; $07FBF5 |
  CMP $00                                   ; $07FBF7 |
  BCS CODE_07FC0C                           ; $07FBF9 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $07FBFB |
  STZ !s_spr_x_speed_lo,x                   ; $07FBFD |
  LDA #$0080                                ; $07FC00 |
  STA !s_spr_y_speed_lo,x                   ; $07FC03 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07FC06 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $07FC08 |
  PLA                                       ; $07FC0A |
  RTL                                       ; $07FC0B |

CODE_07FC0C:
  RTS                                       ; $07FC0C |

  LDA !s_spr_facing_dir,x                   ; $07FC0D |
  LSR A                                     ; $07FC10 |
  LSR A                                     ; $07FC11 |
  ROR A                                     ; $07FC12 |
  STA $00                                   ; $07FC13 |
  LDA !s_spr_x_hitbox_center,x              ; $07FC15 |
  SEC                                       ; $07FC18 |
  SBC !s_spr_x_hitbox_center,y              ; $07FC19 |
  EOR $00                                   ; $07FC1C |
  RTL                                       ; $07FC1E |

  LDA !s_spr_x_hitbox_center,x              ; $07FC1F |
  SEC                                       ; $07FC22 |
  SBC !s_spr_x_hitbox_center,y              ; $07FC23 |
  EOR !s_spr_x_speed_lo,y                   ; $07FC26 |
  RTL                                       ; $07FC29 |

  LDY !s_spr_collision_id,x                 ; $07FC2A |
  BPL CODE_07FC49                           ; $07FC2D |
  LDA !s_spr_y_player_delta,x               ; $07FC2F |
  SEC                                       ; $07FC32 |
  SBC !s_player_hitbox_half_height          ; $07FC33 |
  SEC                                       ; $07FC36 |
  SBC !s_spr_hitbox_height,x                ; $07FC37 |
  CMP #$FFF6                                ; $07FC3A |
  BCC CODE_07FC4A                           ; $07FC3D |
  LDA !s_player_y_speed                     ; $07FC3F |
  BMI CODE_07FC46                           ; $07FC42 |
  SEC                                       ; $07FC44 |
  RTL                                       ; $07FC45 |

CODE_07FC46:
  LDA #$0000                                ; $07FC46 |

CODE_07FC49:
  CLC                                       ; $07FC49 |

CODE_07FC4A:
  RTL                                       ; $07FC4A |

CODE_07FC4B:
  LDY !s_spr_collision_id,x                 ; $07FC4B |
  BPL CODE_07FC54                           ; $07FC4E |
  JSL player_hit_sprite                     ; $07FC50 |

CODE_07FC54:
  RTL                                       ; $07FC54 |

  LDA !s_spr_y_pixel_pos,x                  ; $07FC55 |
  CMP #$0800                                ; $07FC58 |
  BMI CODE_07FC63                           ; $07FC5B |
  PLY                                       ; $07FC5D |
  PLA                                       ; $07FC5E |
  JML $03A31E                               ; $07FC5F |

CODE_07FC63:
  RTL                                       ; $07FC63 |

  LDA !s_spr_cam_x_pos,x                    ; $07FC64 |
  CLC                                       ; $07FC67 |
  ADC #$0040                                ; $07FC68 |
  CMP #$0180                                ; $07FC6B |
  BCS CODE_07FC7A                           ; $07FC6E |
  LDA !s_spr_cam_y_pos,x                    ; $07FC70 |
  CLC                                       ; $07FC73 |
  ADC #$0040                                ; $07FC74 |
  CMP #$0180                                ; $07FC77 |

CODE_07FC7A:
  RTL                                       ; $07FC7A |

  LDA $7860,x                               ; $07FC7B |
  BIT #$0002                                ; $07FC7E |
  BNE CODE_07FCAA                           ; $07FC81 |
  LDA !s_spr_x_pixel_pos,x                  ; $07FC83 |
  SEC                                       ; $07FC86 |
  SBC !s_spr_x_delta_lo,x                   ; $07FC87 |
  STA !s_spr_x_pixel_pos,x                  ; $07FC8A |
  LDA !s_spr_y_pixel_pos,x                  ; $07FC8D |
  SEC                                       ; $07FC90 |
  SBC !s_spr_y_delta_lo,x                   ; $07FC91 |
  STA !s_spr_y_pixel_pos,x                  ; $07FC94 |
  LDA !s_spr_x_speed_lo,x                   ; $07FC97 |
  EOR #$FFFF                                ; $07FC9A |
  INC A                                     ; $07FC9D |
  STA !s_spr_x_speed_lo,x                   ; $07FC9E |
  LDA !s_spr_facing_dir,x                   ; $07FCA1 |
  EOR #$0002                                ; $07FCA4 |
  STA !s_spr_facing_dir,x                   ; $07FCA7 |

CODE_07FCAA:
  RTL                                       ; $07FCAA |

  dw $0000, $0002, $0004, $0008             ; $07FCAB |

  LDA #$0010                                ; $07FCB3 |
  BRA CODE_07FCBB                           ; $07FCB6 |
  LDA #$0001                                ; $07FCB8 |

CODE_07FCBB:
  STA $08                                   ; $07FCBB |
  LDA $14                                   ; $07FCBD |
  BIT #$0007                                ; $07FCBF |
  BNE CODE_07FCCD                           ; $07FCC2 |
  LDA #$0050                                ; $07FCC4 |\ play sound #$0050
  JSL push_sound_queue                      ; $07FCC7 |/
  LDA $14                                   ; $07FCCB |

CODE_07FCCD:
  AND #$0003                                ; $07FCCD |
  ASL A                                     ; $07FCD0 |
  TAY                                       ; $07FCD1 |
  LDA $FCAB,y                               ; $07FCD2 |
  STA $06                                   ; $07FCD5 |
  LDA #$01E2                                ; $07FCD7 |
  JSL spawn_ambient_sprite                  ; $07FCDA |
  LDA $00                                   ; $07FCDE |
  STA $70A2,y                               ; $07FCE0 |
  LDA $02                                   ; $07FCE3 |
  STA $7142,y                               ; $07FCE5 |
  LDA $08                                   ; $07FCE8 |
  STA $7782,y                               ; $07FCEA |
  LDA $7002,y                               ; $07FCED |
  ORA $06                                   ; $07FCF0 |
  STA $7002,y                               ; $07FCF2 |
  LDA $04                                   ; $07FCF5 |
  STA $7E4C,y                               ; $07FCF7 |
  RTL                                       ; $07FCFA |

  LDA !s_spr_x_hitbox_center,x              ; $07FCFB |
  SEC                                       ; $07FCFE |
  SBC !s_player_center_x                    ; $07FCFF |
  CLC                                       ; $07FD02 |
  ADC $00                                   ; $07FD03 |
  CMP $02                                   ; $07FD05 |
  BCS CODE_07FD15                           ; $07FD07 |
  LDA !s_spr_y_hitbox_center,x              ; $07FD09 |
  SEC                                       ; $07FD0C |
  SBC !s_player_center_y                    ; $07FD0D |
  CLC                                       ; $07FD10 |
  ADC $04                                   ; $07FD11 |
  CMP $06                                   ; $07FD13 |

CODE_07FD15:
  RTL                                       ; $07FD15 |

CODE_07FD16:
  LDA #$01E9                                ; $07FD16 |
  JSL spawn_ambient_sprite                  ; $07FD19 |
  LDA $00                                   ; $07FD1D |
  STA $70A2,y                               ; $07FD1F |
  LDA $02                                   ; $07FD22 |
  STA $7142,y                               ; $07FD24 |
  LDA #$0002                                ; $07FD27 |
  STA $7782,y                               ; $07FD2A |
  LDA #$0022                                ; $07FD2D |
  STA $7002,y                               ; $07FD30 |
  RTS                                       ; $07FD33 |

CODE_07FD34:
  LDA #$0211                                ; $07FD34 |
  BRA CODE_07FD3C                           ; $07FD37 |

CODE_07FD39:
  LDA #$0210                                ; $07FD39 |

CODE_07FD3C:
  JSL spawn_ambient_sprite                  ; $07FD3C |
  LDA $7002,y                               ; $07FD40 |
  AND #$FFF1                                ; $07FD43 |
  ORA $00                                   ; $07FD46 |
  STA $7002,y                               ; $07FD48 |
  LDA !s_spr_x_pixel_pos,x                  ; $07FD4B |
  CLC                                       ; $07FD4E |
  ADC #$0008                                ; $07FD4F |
  STA $70A2,y                               ; $07FD52 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FD55 |
  STA $7142,y                               ; $07FD58 |
  LDA #$0001                                ; $07FD5B |
  STA $7782,y                               ; $07FD5E |
  LDA #$0017                                ; $07FD61 |
  STA $73C2,y                               ; $07FD64 |
  RTS                                       ; $07FD67 |

  JSR CODE_07FD39                           ; $07FD68 |
  RTL                                       ; $07FD6B |

  LDA !s_spr_x_hitbox_center,x              ; $07FD6C |
  SEC                                       ; $07FD6F |
  SBC !s_player_center_x                    ; $07FD70 |
  BPL CODE_07FD79                           ; $07FD73 |
  EOR #$FFFF                                ; $07FD75 |
  INC A                                     ; $07FD78 |

CODE_07FD79:
  SEC                                       ; $07FD79 |
  SBC !s_spr_hitbox_width,x                 ; $07FD7A |
  SEC                                       ; $07FD7D |
  SBC !s_player_hitbox_half_width           ; $07FD7E |
  BPL CODE_07FDB5                           ; $07FD81 |
  LDA !s_spr_y_hitbox_center,x              ; $07FD83 |
  SEC                                       ; $07FD86 |
  SBC !s_player_center_y                    ; $07FD87 |
  STA $00                                   ; $07FD8A |
  BPL CODE_07FD92                           ; $07FD8C |
  EOR #$FFFF                                ; $07FD8E |
  INC A                                     ; $07FD91 |

CODE_07FD92:
  SEC                                       ; $07FD92 |
  SBC !s_spr_hitbox_height,x                ; $07FD93 |
  SEC                                       ; $07FD96 |
  SBC !s_player_hitbox_half_height          ; $07FD97 |
  BPL CODE_07FDB5                           ; $07FD9A |
  LDA $00                                   ; $07FD9C |
  SEC                                       ; $07FD9E |
  SBC !s_spr_hitbox_height,x                ; $07FD9F |
  SEC                                       ; $07FDA2 |
  SBC !s_player_hitbox_half_height          ; $07FDA3 |
  CMP #$FFF8                                ; $07FDA6 |
  BCS CODE_07FDB0                           ; $07FDA9 |
  LDA #$0001                                ; $07FDAB |
  BRA CODE_07FDB8                           ; $07FDAE |

CODE_07FDB0:
  LDA !s_player_y_speed                     ; $07FDB0 |
  BPL CODE_07FDBA                           ; $07FDB3 |

CODE_07FDB5:
  LDA #$0000                                ; $07FDB5 |

CODE_07FDB8:
  CLC                                       ; $07FDB8 |
  RTL                                       ; $07FDB9 |

CODE_07FDBA:
  LDA #$0001                                ; $07FDBA |
  SEC                                       ; $07FDBD |
  RTL                                       ; $07FDBE |

init_cork:
  LDA !s_spr_x_pixel_pos,x                  ; $07FDBF |
  CLC                                       ; $07FDC2 |
  ADC #$0008                                ; $07FDC3 |
  STA !s_spr_x_pixel_pos,x                  ; $07FDC6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FDC9 |
  SEC                                       ; $07FDCC |
  SBC #$0007                                ; $07FDCD |
  STA !s_spr_y_pixel_pos,x                  ; $07FDD0 |
  JSL $03D3F8                               ; $07FDD3 |
  BEQ CODE_07FDE0                           ; $07FDD7 |
  JSR CODE_07FF25                           ; $07FDD9 |
  JML $03A31E                               ; $07FDDC |

CODE_07FDE0:
  RTL                                       ; $07FDE0 |

  db $10, $10, $20                          ; $07FDE1 |

main_cork:
  JSL $03AF23                               ; $07FDE4 |
  JSL $03D127                               ; $07FDE8 |
  JSL $03D291                               ; $07FDEC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07FDF0 |
  BEQ CODE_07FE56                           ; $07FDF2 |
  LDA !s_spr_timer_1,x                      ; $07FDF4 |
  BNE CODE_07FE55                           ; $07FDF7 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $07FDF9 |
  CMP #$0003                                ; $07FDFB |
  BEQ CODE_07FE20                           ; $07FDFE |
  BCS CODE_07FE55                           ; $07FE00 |
  TAY                                       ; $07FE02 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FE03 |
  SEC                                       ; $07FE06 |
  SBC #$0002                                ; $07FE07 |
  STA !s_spr_y_pixel_pos,x                  ; $07FE0A |
  LDA $FDE1,y                               ; $07FE0D |
  AND #$00FF                                ; $07FE10 |
  STA !s_spr_timer_1,x                      ; $07FE13 |
  LDA #$0040                                ; $07FE16 |\ play sound #$0040
  JSL push_sound_queue                      ; $07FE19 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $07FE1D |
  RTL                                       ; $07FE1F |

CODE_07FE20:
  STZ !s_player_disable_flag                ; $07FE20 |
  LDA #$F800                                ; $07FE23 |
  STA !s_spr_y_speed_lo,x                   ; $07FE26 |
  LDA #$021A                                ; $07FE29 |
  JSL spawn_ambient_sprite                  ; $07FE2C |
  LDA !s_spr_x_pixel_pos,x                  ; $07FE30 |
  STA $70A2,y                               ; $07FE33 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FE36 |
  CLC                                       ; $07FE39 |
  ADC #$0010                                ; $07FE3A |
  STA $7142,y                               ; $07FE3D |
  LDA #$0001                                ; $07FE40 |
  STA $7782,y                               ; $07FE43 |
  LDA #$000B                                ; $07FE46 |
  STA $7E4C,y                               ; $07FE49 |
  LDA #$003B                                ; $07FE4C |\ play sound #$003B
  JSL push_sound_queue                      ; $07FE4F |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $07FE53 |

CODE_07FE55:
  RTL                                       ; $07FE55 |

CODE_07FE56:
  JSR CODE_07FEFF                           ; $07FE56 |
  BNE CODE_07FE73                           ; $07FE59 |
  LDY !s_spr_collision_id,x                 ; $07FE5B |
  BMI CODE_07FE63                           ; $07FE5E |
  JMP CODE_07FEE5                           ; $07FE60 |

CODE_07FE63:
  LDA !s_spr_y_player_delta,x               ; $07FE63 |
  SEC                                       ; $07FE66 |
  SBC !s_player_hitbox_half_height          ; $07FE67 |
  SEC                                       ; $07FE6A |
  SBC !s_spr_hitbox_height,x                ; $07FE6B |
  CMP #$FFF6                                ; $07FE6E |
  BCS CODE_07FECF                           ; $07FE71 |

CODE_07FE73:
  LDY !s_cur_egg_inv_size                   ; $07FE73 |
  BEQ CODE_07FEE4                           ; $07FE76 |
  LDA $7DF6,y                               ; $07FE78 |
  TAY                                       ; $07FE7B |
  LDA !s_spr_id,y                           ; $07FE7C |
  CMP #$0027                                ; $07FE7F |
  BNE CODE_07FEE4                           ; $07FE82 |
  TYX                                       ; $07FE84 |
  JSL $03BF87                               ; $07FE85 |
  JSL $03A31E                               ; $07FE89 |
  LDX $12                                   ; $07FE8D |
  JSL $03D3EB                               ; $07FE8F |
  JSR CODE_07FF25                           ; $07FE93 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FE96 |
  SEC                                       ; $07FE99 |
  SBC #$0002                                ; $07FE9A |
  STA !s_spr_y_pixel_pos,x                  ; $07FE9D |
  LDA #$0008                                ; $07FEA0 |
  STA !s_spr_timer_1,x                      ; $07FEA3 |
  LDA #$01CD                                ; $07FEA6 |
  JSL spawn_ambient_sprite                  ; $07FEA9 |
  LDA !s_spr_x_pixel_pos,x                  ; $07FEAD |
  STA $70A2,y                               ; $07FEB0 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FEB3 |
  STA $7142,y                               ; $07FEB6 |
  LDA #$000B                                ; $07FEB9 |
  STA $7E4C,y                               ; $07FEBC |
  LDA #$0004                                ; $07FEBF |
  STA $7782,y                               ; $07FEC2 |
  LDA #$0040                                ; $07FEC5 |\ play sound #$0040
  JSL push_sound_queue                      ; $07FEC8 |/
  INC !s_spr_wildcard_5_lo_dp,x             ; $07FECC |
  RTL                                       ; $07FECE |

CODE_07FECF:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $07FECF |
  BNE CODE_07FEE4                           ; $07FED1 |
  LDA !s_player_ground_pound_state          ; $07FED3 |
  BEQ CODE_07FEE4                           ; $07FED6 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FED8 |
  CLC                                       ; $07FEDB |
  ADC #$0004                                ; $07FEDC |
  STA !s_spr_y_pixel_pos,x                  ; $07FEDF |
  INC !s_spr_wildcard_4_lo_dp,x             ; $07FEE2 |

CODE_07FEE4:
  RTL                                       ; $07FEE4 |

CODE_07FEE5:
  DEY                                       ; $07FEE5 |
  BMI CODE_07FEE4                           ; $07FEE6 |
  BEQ CODE_07FEE4                           ; $07FEE8 |
  LDA !s_spr_state,x                        ; $07FEEA |
  CMP #$0010                                ; $07FEED |
  BNE CODE_07FEE4                           ; $07FEF0 |
  LDA !s_spr_collision_state,x              ; $07FEF2 |
  BEQ CODE_07FEE4                           ; $07FEF5 |
  TYX                                       ; $07FEF7 |
  JSL $03B25B                               ; $07FEF8 |
  LDX $12                                   ; $07FEFC |
  RTL                                       ; $07FEFE |

CODE_07FEFF:
  LDA !s_spr_x_pixel_pos,x                  ; $07FEFF |
  STA !gsu_r8                               ; $07FF02 |
  STA $00                                   ; $07FF05 |
  LDA !s_spr_y_pixel_pos,x                  ; $07FF07 |
  CLC                                       ; $07FF0A |
  ADC #$0010                                ; $07FF0B |
  STA !gsu_r0                               ; $07FF0E |
  STA $02                                   ; $07FF11 |
  LDX #$0A                                  ; $07FF13 |
  LDA #$CE2F                                ; $07FF15 |
  JSL r_gsu_init_3                          ; $07FF18 | GSU init
  LDX $12                                   ; $07FF1C |
  LDA !gsu_r6                               ; $07FF1E |
  CMP #$7D24                                ; $07FF21 |
  RTS                                       ; $07FF24 |

CODE_07FF25:
  JSR CODE_07FEFF                           ; $07FF25 |
  BNE CODE_07FF46                           ; $07FF28 |
  LDA #$0001                                ; $07FF2A |
  STA $008F                                 ; $07FF2D |
  LDA #$7D22                                ; $07FF30 |
  STA $0095                                 ; $07FF33 |
  LDA $00                                   ; $07FF36 |
  STA $0091                                 ; $07FF38 |
  LDA $02                                   ; $07FF3B |
  STA $0093                                 ; $07FF3D |
  JSL $109295                               ; $07FF40 |
  LDX $12                                   ; $07FF44 |

CODE_07FF46:
  RTS                                       ; $07FF46 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FF9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $07FFF7 |
  db $FF                                    ; $07FFFF |
