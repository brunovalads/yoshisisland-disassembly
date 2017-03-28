org $0C8000

arch 65816

  dw $0000, $FFF9, $FFF3                    ; $0C8000 |

  dw $000E, $0015, $001B                    ; $0C8006 |

init_falling_icicle:
  STZ !s_spr_y_speed_lo,x                   ; $0C800C |
  LDA #$FFFF                                ; $0C800F |
  STA !s_spr_draw_priority,x                ; $0C8012 |
  RTL                                       ; $0C8015 |

main_falling_icicle:
  JSL $03AF23                               ; $0C8016 |
  LDA !s_spr_anim_frame,x                   ; $0C801A |
  ASL A                                     ; $0C801D |
  TAY                                       ; $0C801E |
  LDA $8000,y                               ; $0C801F |
  STA !s_spr_y_hitbox_offset,x              ; $0C8022 |
  LDA $8006,y                               ; $0C8025 |
  STA !s_spr_hitbox_height,x                ; $0C8028 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C802B |
  TAX                                       ; $0C802D |
  JMP ($8031,x)                             ; $0C802E |

  dw $8039                                  ; $0C8031 |
  dw $8065                                  ; $0C8033 |
  dw $80AD                                  ; $0C8035 |
  dw $80DB                                  ; $0C8037 |

  LDX $12                                   ; $0C8039 |
  JSR CODE_0C80E4                           ; $0C803B |
  LDA !s_spr_x_hitbox_center,x              ; $0C803E |
  SEC                                       ; $0C8041 |
  SBC !s_player_center_x                    ; $0C8042 |
  CLC                                       ; $0C8045 |
  ADC #$0060                                ; $0C8046 |
  CMP #$00C0                                ; $0C8049 |
  BCS CODE_0C8064                           ; $0C804C |
  LDA !s_spr_y_hitbox_center,x              ; $0C804E |
  SEC                                       ; $0C8051 |
  SBC !s_player_center_y                    ; $0C8052 |
  SEC                                       ; $0C8055 |
  SBC #$0020                                ; $0C8056 |
  BPL CODE_0C8064                           ; $0C8059 |
  LDA #$0030                                ; $0C805B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C805E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8060 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8062 |

CODE_0C8064:
  RTL                                       ; $0C8064 |

  LDX $12                                   ; $0C8065 |
  JSR CODE_0C8133                           ; $0C8067 |
  LDA #$0059                                ; $0C806A |\ play sound #$0059
  JSL push_sound_queue                      ; $0C806D |/
  LDA !s_spr_anim_frame,x                   ; $0C8071 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C8074 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8076 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8078 |
  RTL                                       ; $0C807A |

  dw $0000, $FFFF, $0001, $0001             ; $0C807B |
  dw $FFFF, $FFFF, $0001, $0001             ; $0C8083 |
  dw $FFFF, $FFFF, $0001, $0001             ; $0C808B |
  dw $FFFF, $FFFF, $0001, $0001             ; $0C8093 |
  dw $FFFF, $FFFF, $0001, $0001             ; $0C809B |
  dw $FFFF, $FFFF, $0001, $0001             ; $0C80A3 |
  dw $FFFF                                  ; $0C80AB |

  LDX $12                                   ; $0C80AD |
  JSR CODE_0C8278                           ; $0C80AF |
  LDA !s_spr_timer_1,x                      ; $0C80B2 |
  BNE CODE_0C80CF                           ; $0C80B5 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C80B7 |
  BEQ CODE_0C80D0                           ; $0C80B9 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C80BB |
  CLC                                       ; $0C80BE |
  ADC $807B,y                               ; $0C80BF |
  STA !s_spr_x_pixel_pos,x                  ; $0C80C2 |
  LDA #$0001                                ; $0C80C5 |
  STA !s_spr_timer_1,x                      ; $0C80C8 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C80CB |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C80CD |

CODE_0C80CF:
  RTL                                       ; $0C80CF |

CODE_0C80D0:
  LDA #$0040                                ; $0C80D0 |
  STA !s_spr_y_accel,x                      ; $0C80D3 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C80D6 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C80D8 |
  RTL                                       ; $0C80DA |

  LDX $12                                   ; $0C80DB |
  JSR CODE_0C82B4                           ; $0C80DD |
  JSR CODE_0C8278                           ; $0C80E0 |
  RTL                                       ; $0C80E3 |

CODE_0C80E4:
  LDA !s_spr_x_pixel_pos,x                  ; $0C80E4 |
  CLC                                       ; $0C80E7 |
  ADC #$0008                                ; $0C80E8 |
  STA !gsu_r8                               ; $0C80EB |
  LDA !s_spr_y_pixel_pos,x                  ; $0C80EE |
  CLC                                       ; $0C80F1 |
  ADC #$0008                                ; $0C80F2 |
  STA !gsu_r0                               ; $0C80F5 |
  LDX #$0A                                  ; $0C80F8 |
  LDA #$CE2F                                ; $0C80FA |
  JSL r_gsu_init_3                          ; $0C80FD | GSU init
  LDX $12                                   ; $0C8101 |
  LDA !gsu_r6                               ; $0C8103 |
  CMP #$8E00                                ; $0C8106 |
  BEQ CODE_0C811A                           ; $0C8109 |
  CMP #$8E01                                ; $0C810B |
  BEQ CODE_0C811A                           ; $0C810E |
  CMP #$8E02                                ; $0C8110 |
  BEQ CODE_0C811A                           ; $0C8113 |
  PLA                                       ; $0C8115 |
  JML $03A32E                               ; $0C8116 |

CODE_0C811A:
  RTS                                       ; $0C811A |

  dw $0000, $0000, $0000, $8D94             ; $0C811B |
  dw $0000, $0000, $8D94, $799E             ; $0C8123 |
  dw $0000, $8D94, $799F, $799E             ; $0C812B |

CODE_0C8133:
  LDA !s_spr_x_pixel_pos,x                  ; $0C8133 |
  CLC                                       ; $0C8136 |
  ADC #$0008                                ; $0C8137 |
  STA !gsu_r8                               ; $0C813A |
  STA $00                                   ; $0C813D |
  LDA !s_spr_y_pixel_pos,x                  ; $0C813F |
  CLC                                       ; $0C8142 |
  ADC #$0008                                ; $0C8143 |
  STA !gsu_r0                               ; $0C8146 |
  STA $02                                   ; $0C8149 |
  LDX #$0A                                  ; $0C814B |
  LDA #$CE2F                                ; $0C814D |
  JSL r_gsu_init_3                          ; $0C8150 | GSU init
  LDX $12                                   ; $0C8154 |
  LDA !gsu_r6                               ; $0C8156 |
  CMP #$8E00                                ; $0C8159 |
  BNE CODE_0C8178                           ; $0C815C |
  LDA #$0002                                ; $0C815E |
  STA !s_spr_anim_frame,x                   ; $0C8161 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8164 |
  CLC                                       ; $0C8167 |
  ADC #$0020                                ; $0C8168 |
  STA !s_spr_y_pixel_pos,x                  ; $0C816B |
  LDA #$811B                                ; $0C816E |
  STA $04                                   ; $0C8171 |
  LDY #$06                                  ; $0C8173 |
  JMP CODE_0C8235                           ; $0C8175 |

CODE_0C8178:
  CMP #$8E01                                ; $0C8178 |
  BNE CODE_0C81C6                           ; $0C817B |
  LDA #$0001                                ; $0C817D |
  STA !s_spr_anim_frame,x                   ; $0C8180 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8183 |
  CLC                                       ; $0C8186 |
  ADC #$0010                                ; $0C8187 |
  STA !s_spr_y_pixel_pos,x                  ; $0C818A |
  LDA #$8123                                ; $0C818D |
  STA $04                                   ; $0C8190 |
  LDA $00                                   ; $0C8192 |
  STA !gsu_r8                               ; $0C8194 |
  LDA $02                                   ; $0C8197 |
  SEC                                       ; $0C8199 |
  SBC #$0010                                ; $0C819A |
  STA !gsu_r0                               ; $0C819D |
  STA $02                                   ; $0C81A0 |
  LDX #$0A                                  ; $0C81A2 |
  LDA #$CE2F                                ; $0C81A4 |
  JSL r_gsu_init_3                          ; $0C81A7 | GSU init
  LDX $12                                   ; $0C81AB |
  LDY #$06                                  ; $0C81AD |
  LDA !gsu_r6                               ; $0C81AF |
  CMP #$8E00                                ; $0C81B2 |
  BNE CODE_0C81BA                           ; $0C81B5 |
  JMP CODE_0C8235                           ; $0C81B7 |

CODE_0C81BA:
  LDA $02                                   ; $0C81BA |
  CLC                                       ; $0C81BC |
  ADC #$0010                                ; $0C81BD |
  STA $02                                   ; $0C81C0 |
  DEY                                       ; $0C81C2 |
  DEY                                       ; $0C81C3 |
  BRA CODE_0C8235                           ; $0C81C4 |

CODE_0C81C6:
  CMP #$8E02                                ; $0C81C6 |
  BNE CODE_0C8230                           ; $0C81C9 |
  LDA #$0000                                ; $0C81CB |
  STA !s_spr_anim_frame,x                   ; $0C81CE |
  LDA #$812B                                ; $0C81D1 |
  STA $04                                   ; $0C81D4 |
  LDA $00                                   ; $0C81D6 |
  STA !gsu_r8                               ; $0C81D8 |
  LDA $02                                   ; $0C81DB |
  SEC                                       ; $0C81DD |
  SBC #$0010                                ; $0C81DE |
  STA !gsu_r0                               ; $0C81E1 |
  LDX #$0A                                  ; $0C81E4 |
  LDA #$CE2F                                ; $0C81E6 |
  JSL r_gsu_init_3                          ; $0C81E9 | GSU init
  LDX $12                                   ; $0C81ED |
  LDY #$02                                  ; $0C81EF |
  LDA !gsu_r6                               ; $0C81F1 |
  CMP #$799D                                ; $0C81F4 |
  BEQ CODE_0C8235                           ; $0C81F7 |
  INY                                       ; $0C81F9 |
  INY                                       ; $0C81FA |
  PHY                                       ; $0C81FB |
  LDA $00                                   ; $0C81FC |
  STA !gsu_r8                               ; $0C81FE |
  LDA $02                                   ; $0C8201 |
  SEC                                       ; $0C8203 |
  SBC #$0010                                ; $0C8204 |
  STA $02                                   ; $0C8207 |
  SEC                                       ; $0C8209 |
  SBC #$0010                                ; $0C820A |
  STA !gsu_r0                               ; $0C820D |
  LDX #$0A                                  ; $0C8210 |
  LDA #$CE2F                                ; $0C8212 |
  JSL r_gsu_init_3                          ; $0C8215 | GSU init
  LDX $12                                   ; $0C8219 |
  PLY                                       ; $0C821B |
  LDA !gsu_r6                               ; $0C821C |
  CMP #$799D                                ; $0C821F |
  BEQ CODE_0C8235                           ; $0C8222 |
  LDA $02                                   ; $0C8224 |
  SEC                                       ; $0C8226 |
  SBC #$0010                                ; $0C8227 |
  STA $02                                   ; $0C822A |
  INY                                       ; $0C822C |
  INY                                       ; $0C822D |
  BRA CODE_0C8235                           ; $0C822E |

CODE_0C8230:
  PLA                                       ; $0C8230 |
  JML $03A32E                               ; $0C8231 |

CODE_0C8235:
  PHY                                       ; $0C8235 |
  LDA !s_spr_anim_frame,x                   ; $0C8236 |
  ASL A                                     ; $0C8239 |
  TAY                                       ; $0C823A |
  LDA $8000,y                               ; $0C823B |
  STA !s_spr_y_hitbox_offset,x              ; $0C823E |
  LDA $8006,y                               ; $0C8241 |
  STA !s_spr_hitbox_height,x                ; $0C8244 |
  LDA #$0005                                ; $0C8247 |
  STA !s_spr_draw_priority,x                ; $0C824A |
  PLY                                       ; $0C824D |

CODE_0C824E:
  LDA $00                                   ; $0C824E |
  STA $0091                                 ; $0C8250 |
  LDA $02                                   ; $0C8253 |
  STA $0093                                 ; $0C8255 |
  LDA #$0001                                ; $0C8258 |
  STA $008F                                 ; $0C825B |
  LDA ($04),y                               ; $0C825E |
  STA $0095                                 ; $0C8260 |
  PHY                                       ; $0C8263 |
  JSL $109295                               ; $0C8264 |
  PLY                                       ; $0C8268 |
  LDA $02                                   ; $0C8269 |
  CLC                                       ; $0C826B |
  ADC #$0010                                ; $0C826C |
  STA $02                                   ; $0C826F |
  DEY                                       ; $0C8271 |
  DEY                                       ; $0C8272 |
  BPL CODE_0C824E                           ; $0C8273 |
  LDX $12                                   ; $0C8275 |
  RTS                                       ; $0C8277 |

CODE_0C8278:
  LDY !s_spr_collision_id,x                 ; $0C8278 |
  BPL CODE_0C8282                           ; $0C827B |
  JSL player_hit_sprite                     ; $0C827D |

CODE_0C8281:
  RTS                                       ; $0C8281 |

CODE_0C8282:
  TXA                                       ; $0C8282 |
  STA !gsu_r1                               ; $0C8283 |
  PHX                                       ; $0C8286 |
  LDX #$09                                  ; $0C8287 |
  LDA #$9011                                ; $0C8289 |
  JSL r_gsu_init_1                          ; $0C828C | GSU init
  PLX                                       ; $0C8290 |
  LDY !gsu_r14                              ; $0C8291 |
  BMI CODE_0C8281                           ; $0C8294 |
  BEQ CODE_0C8281                           ; $0C8296 |
  LDA !s_spr_state,y                        ; $0C8298 |
  CMP #$000E                                ; $0C829B |
  BCC CODE_0C8281                           ; $0C829E |
  LDA !s_spr_bitwise_settings_3,y           ; $0C82A0 |
  BIT #$6000                                ; $0C82A3 |
  BNE CODE_0C8281                           ; $0C82A6 |
  TYX                                       ; $0C82A8 |
  JSL $0CFF61                               ; $0C82A9 |
  JSL $03B24B                               ; $0C82AD |
  LDX $12                                   ; $0C82B1 |
  RTS                                       ; $0C82B3 |

CODE_0C82B4:
  LDA $7860,x                               ; $0C82B4 |
  BIT #$0001                                ; $0C82B7 |
  BNE CODE_0C82BD                           ; $0C82BA |
  RTS                                       ; $0C82BC |

CODE_0C82BD:
  REP #$10                                  ; $0C82BD |
  LDA !s_spr_wildcard_2_lo,x                ; $0C82BF |
  TAX                                       ; $0C82C2 |
  LDA $700024,x                             ; $0C82C3 |
  AND #$F800                                ; $0C82C7 |
  CMP #$4000                                ; $0C82CA |
  BNE CODE_0C831E                           ; $0C82CD |
  LDA $700020,x                             ; $0C82CF |
  STA $0091                                 ; $0C82D3 |
  STA $00                                   ; $0C82D6 |
  LDA $700022,x                             ; $0C82D8 |
  STA $0093                                 ; $0C82DC |
  STA $02                                   ; $0C82DF |
  LDA #$0000                                ; $0C82E1 |
  STA $008F                                 ; $0C82E4 |
  SEP #$10                                  ; $0C82E7 |
  JSL $109295                               ; $0C82E9 |
  LDA #$01C3                                ; $0C82ED |
  JSL spawn_ambient_sprite                  ; $0C82F0 |
  LDA $00                                   ; $0C82F4 |
  AND #$FFF0                                ; $0C82F6 |
  STA $70A2,y                               ; $0C82F9 |
  LDA $02                                   ; $0C82FC |
  AND #$FFF0                                ; $0C82FE |
  STA $7142,y                               ; $0C8301 |
  LDA #$000A                                ; $0C8304 |
  STA $73C2,y                               ; $0C8307 |
  LDA #$0002                                ; $0C830A |
  STA $7782,y                               ; $0C830D |
  LDA #$0066                                ; $0C8310 |\ play sound #$0066
  JSL push_sound_queue                      ; $0C8313 |/
  LDX $12                                   ; $0C8317 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0C8319 |
  BMI CODE_0C831E                           ; $0C831B |
  RTS                                       ; $0C831D |

CODE_0C831E:
  SEP #$10                                  ; $0C831E |
  LDX $12                                   ; $0C8320 |
  LDA #$0066                                ; $0C8322 |\ play sound #$0066
  JSL push_sound_queue                      ; $0C8325 |/
  LDA !s_spr_y_pixel_pos,x                  ; $0C8329 |
  SEC                                       ; $0C832C |
  SBC #$0008                                ; $0C832D |
  STA $00                                   ; $0C8330 |
  LDA !s_spr_anim_frame,x                   ; $0C8332 |
  STA $02                                   ; $0C8335 |

CODE_0C8337:
  LDA #$01F2                                ; $0C8337 |
  JSL spawn_ambient_sprite                  ; $0C833A |
  LDA !s_spr_x_pixel_pos,x                  ; $0C833E |
  STA $70A2,y                               ; $0C8341 |
  LDA $00                                   ; $0C8344 |
  STA $7142,y                               ; $0C8346 |
  SEC                                       ; $0C8349 |
  SBC #$0008                                ; $0C834A |
  STA $00                                   ; $0C834D |
  LDA #$000B                                ; $0C834F |
  STA $73C2,y                               ; $0C8352 |
  LDA #$0004                                ; $0C8355 |
  STA $7782,y                               ; $0C8358 |
  DEC $02                                   ; $0C835B |
  BPL CODE_0C8337                           ; $0C835D |
  PLA                                       ; $0C835F |
  JML $03A32E                               ; $0C8360 |

init_goomba:
  JSL $0C83DF                               ; $0C8364 |
  RTL                                       ; $0C8368 |

main_goomba:
  JSL $03AF23                               ; $0C8369 |
  JSL $07E336                               ; $0C836D |
  JSL $03A5B7                               ; $0C8371 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8375 |
  TYX                                       ; $0C8377 |
  JMP ($837B,x)                             ; $0C8378 |

  dw $83EE, $8425, $8450                    ; $0C837B |
  dw $84E6, $856D, $84B1                    ; $0C8381 |

  db $00, $0F, $10, $00, $08, $00, $08, $00 ; $0C8387 |

  db $20, $00, $00, $04, $04, $04, $04, $20 ; $0C838F |

CODE_0C8397:
  LDA #$0004                                ; $0C8397 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C839A |
  LDA #$0007                                ; $0C839C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C839F |
  SEP #$20                                  ; $0C83A1 |
  TAY                                       ; $0C83A3 |
  LDA $8387,y                               ; $0C83A4 |
  STA !s_spr_anim_frame,x                   ; $0C83A7 |
  LDA $838F,y                               ; $0C83AA |
  STA !s_spr_timer_1,x                      ; $0C83AD |
  REP #$20                                  ; $0C83B0 |
  RTL                                       ; $0C83B2 |

  db $00, $00, $08, $00, $08, $00           ; $0C83B3 |

  db $04, $04, $04, $04, $04, $20           ; $0C83B9 |

CODE_0C83BF:
  LDA #$0002                                ; $0C83BF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C83C2 |
  LDA #$0005                                ; $0C83C4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C83C7 |
  SEP #$20                                  ; $0C83C9 |
  TAY                                       ; $0C83CB |
  LDA $83B3,y                               ; $0C83CC |
  STA !s_spr_anim_frame,x                   ; $0C83CF |
  LDA $83B9,y                               ; $0C83D2 |
  STA !s_spr_timer_1,x                      ; $0C83D5 |
  REP #$20                                  ; $0C83D8 |
  RTL                                       ; $0C83DA |

  dw $FF00, $0100                           ; $0C83DB |

CODE_0C83DF:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C83DF |
  LDA #$0004                                ; $0C83E1 |
  STA !s_spr_timer_1,x                      ; $0C83E4 |
  STZ !s_spr_anim_frame,x                   ; $0C83E7 |
  LDY !s_spr_facing_dir,x                   ; $0C83EA |
  RTL                                       ; $0C83ED |

  LDX $12                                   ; $0C83EE |
  STZ !s_spr_x_speed_lo,x                   ; $0C83F0 |
  LDA $7860,x                               ; $0C83F3 |
  BIT #$0001                                ; $0C83F6 |
  BEQ CODE_0C8397                           ; $0C83F9 |
  BIT #$000C                                ; $0C83FB |
  BNE CODE_0C83BF                           ; $0C83FE |
  LDA !s_spr_timer_1,x                      ; $0C8400 |
  BNE CODE_0C8416                           ; $0C8403 |
  LDA !s_spr_anim_frame,x                   ; $0C8405 |
  INC A                                     ; $0C8408 |
  AND #$0007                                ; $0C8409 |
  STA !s_spr_anim_frame,x                   ; $0C840C |
  LDA #$0004                                ; $0C840F |
  STA !s_spr_timer_1,x                      ; $0C8412 |
  RTL                                       ; $0C8415 |

CODE_0C8416:
  CMP #$0001                                ; $0C8416 |
  BNE CODE_0C8424                           ; $0C8419 |
  LDY !s_spr_facing_dir,x                   ; $0C841B |
  LDA $83DB,y                               ; $0C841E |
  STA !s_spr_x_speed_lo,x                   ; $0C8421 |

CODE_0C8424:
  RTL                                       ; $0C8424 |

  LDX $12                                   ; $0C8425 |
  LDA !s_spr_timer_1,x                      ; $0C8427 |
  BNE CODE_0C844B                           ; $0C842A |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C842C |
  BMI CODE_0C83DF                           ; $0C842E |
  SEP #$20                                  ; $0C8430 |
  BNE CODE_0C843C                           ; $0C8432 |
  LDA !s_spr_facing_dir,x                   ; $0C8434 |
  EOR #$02                                  ; $0C8437 |
  STA !s_spr_facing_dir,x                   ; $0C8439 |

CODE_0C843C:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C843C |
  LDA $83B3,y                               ; $0C843E |
  STA !s_spr_anim_frame,x                   ; $0C8441 |
  LDA #$04                                  ; $0C8444 |
  STA !s_spr_timer_1,x                      ; $0C8446 |
  REP #$20                                  ; $0C8449 |

CODE_0C844B:
  RTL                                       ; $0C844B |

  dw $FFC0, $0040                           ; $0C844C |

  LDX $12                                   ; $0C8450 |
  LDA !s_spr_timer_1,x                      ; $0C8452 |
  BNE CODE_0C8497                           ; $0C8455 |
  LDA $7860,x                               ; $0C8457 |
  BIT #$0001                                ; $0C845A |
  BEQ CODE_0C8498                           ; $0C845D |
  STZ !s_spr_x_speed_lo,x                   ; $0C845F |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C8462 |
  BPL CODE_0C8469                           ; $0C8464 |
  JMP CODE_0C83DF                           ; $0C8466 |

CODE_0C8469:
  SEP #$20                                  ; $0C8469 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C846B |
  LDA $8387,y                               ; $0C846D |
  STA !s_spr_anim_frame,x                   ; $0C8470 |
  LDA $838F,y                               ; $0C8473 |
  STA !s_spr_timer_1,x                      ; $0C8476 |
  REP #$20                                  ; $0C8479 |
  CPY #$02                                  ; $0C847B |
  BNE CODE_0C8497                           ; $0C847D |
  LDA $7860,x                               ; $0C847F |
  AND #$FFFE                                ; $0C8482 |
  STA $7860,x                               ; $0C8485 |
  LDA #$FD00                                ; $0C8488 |
  STA !s_spr_y_speed_lo,x                   ; $0C848B |
  LDY !s_spr_facing_dir,x                   ; $0C848E |
  LDA $844C,y                               ; $0C8491 |
  STA !s_spr_x_speed_lo,x                   ; $0C8494 |

CODE_0C8497:
  RTL                                       ; $0C8497 |

CODE_0C8498:
  LDA #$000F                                ; $0C8498 |
  LDY !s_spr_y_speed_hi,x                   ; $0C849B |
  BMI CODE_0C84A3                           ; $0C849E |
  LDA #$0010                                ; $0C84A0 |

CODE_0C84A3:
  STA !s_spr_anim_frame,x                   ; $0C84A3 |
  RTL                                       ; $0C84A6 |

  db $00, $09, $0A, $0B, $0C                ; $0C84A7 |
  db $20, $04, $08, $04, $20                ; $0C84AC |

  LDX $12                                   ; $0C84B1 |
  LDA !s_spr_timer_1,x                      ; $0C84B3 |
  BNE CODE_0C84CE                           ; $0C84B6 |
  SEP #$20                                  ; $0C84B8 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C84BA |
  BMI CODE_0C84CF                           ; $0C84BC |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C84BE |
  LDA $84A7,y                               ; $0C84C0 |
  STA !s_spr_anim_frame,x                   ; $0C84C3 |
  LDA $84AC,y                               ; $0C84C6 |
  STA !s_spr_timer_1,x                      ; $0C84C9 |
  REP #$20                                  ; $0C84CC |

CODE_0C84CE:
  RTL                                       ; $0C84CE |

CODE_0C84CF:
  REP #$20                                  ; $0C84CF |
  LDA !s_spr_id,x                           ; $0C84D1 |
  TXY                                       ; $0C84D4 |
  JSL $03A377                               ; $0C84D5 |
  LDA #$0002                                ; $0C84D9 |
  STA !s_spr_state,x                        ; $0C84DC |
  RTL                                       ; $0C84DF |

  db $0E, $0D, $80, $FF, $80, $00           ; $0C84E0 |

  LDX $12                                   ; $0C84E6 |
  JSL $07FC2A                               ; $0C84E8 |
  BEQ CODE_0C84F0                           ; $0C84EC |
  BCS CODE_0C84F9                           ; $0C84EE |

CODE_0C84F0:
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0C84F0 |
  LDA !s_spr_timer_2,x                      ; $0C84F2 |
  BEQ CODE_0C8548                           ; $0C84F5 |
  BRA CODE_0C8503                           ; $0C84F7 |

CODE_0C84F9:
  LDA #$0100                                ; $0C84F9 |
  STA !s_spr_timer_2,x                      ; $0C84FC |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0C84FF |
  BEQ CODE_0C8527                           ; $0C8501 |

CODE_0C8503:
  LDA !s_spr_timer_1,x                      ; $0C8503 |
  BNE CODE_0C8526                           ; $0C8506 |
  SEP #$20                                  ; $0C8508 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C850A |
  DEC A                                     ; $0C850C |
  AND #$01                                  ; $0C850D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C850F |
  TAY                                       ; $0C8511 |
  LDA $84E0,y                               ; $0C8512 |
  STA !s_spr_anim_frame,x                   ; $0C8515 |
  LDA #$02                                  ; $0C8518 |
  STA !s_spr_timer_1,x                      ; $0C851A |
  REP #$20                                  ; $0C851D |
  LDA #$001B                                ; $0C851F |\ play sound #$001B
  JSL push_sound_queue                      ; $0C8522 |/

CODE_0C8526:
  RTL                                       ; $0C8526 |

CODE_0C8527:
  INC !s_spr_wildcard_6_lo_dp,x             ; $0C8527 |
  STZ !s_spr_x_speed_lo,x                   ; $0C8529 |
  LDA #$0008                                ; $0C852C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C852F |
  LDA #$0003                                ; $0C8531 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8534 |
  SEP #$20                                  ; $0C8536 |
  TAY                                       ; $0C8538 |
  LDA $8565,y                               ; $0C8539 |
  STA !s_spr_anim_frame,x                   ; $0C853C |
  LDA $8569,y                               ; $0C853F |
  STA !s_spr_timer_1,x                      ; $0C8542 |
  REP #$20                                  ; $0C8545 |
  RTL                                       ; $0C8547 |

CODE_0C8548:
  STZ !s_spr_x_speed_lo,x                   ; $0C8548 |
  SEP #$20                                  ; $0C854B |
  LDA #$04                                  ; $0C854D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C854F |
  TAY                                       ; $0C8551 |
  LDA $84A7,y                               ; $0C8552 |
  STA !s_spr_anim_frame,x                   ; $0C8555 |
  LDA $84AC,y                               ; $0C8558 |
  STA !s_spr_timer_1,x                      ; $0C855B |
  LDA #$0A                                  ; $0C855E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C8560 |
  REP #$20                                  ; $0C8562 |
  RTL                                       ; $0C8564 |

  db $0C, $0B, $0A, $0B                     ; $0C8565 |

  db $20, $01, $02, $01                     ; $0C8569 |

  LDX $12                                   ; $0C856D |
  LDA !s_spr_timer_1,x                      ; $0C856F |
  BNE CODE_0C858A                           ; $0C8572 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C8574 |
  BMI CODE_0C858B                           ; $0C8576 |
  SEP #$20                                  ; $0C8578 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C857A |
  LDA $8565,y                               ; $0C857C |
  STA !s_spr_anim_frame,x                   ; $0C857F |
  LDA $8569,y                               ; $0C8582 |
  STA !s_spr_timer_1,x                      ; $0C8585 |
  REP #$20                                  ; $0C8588 |

CODE_0C858A:
  RTL                                       ; $0C858A |

CODE_0C858B:
  BRA CODE_0C8606                           ; $0C858B |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C858D |
  TAX                                       ; $0C858F |
  JMP ($8630,x)                             ; $0C8590 |
  LDX $12                                   ; $0C8593 |
  STZ !s_spr_x_speed_lo,x                   ; $0C8595 |
  LDA #$0004                                ; $0C8598 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C859B |
  SEP #$20                                  ; $0C859D |
  TAY                                       ; $0C859F |
  LDA $8634,y                               ; $0C85A0 |
  STA !s_spr_anim_frame,x                   ; $0C85A3 |
  LDA $8639,y                               ; $0C85A6 |
  STA !s_spr_timer_1,x                      ; $0C85A9 |
  REP #$20                                  ; $0C85AC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0C85AE |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0C85B0 |
  RTL                                       ; $0C85B2 |

  LDX $12                                   ; $0C85B3 |
  LDA !s_spr_timer_1,x                      ; $0C85B5 |
  BNE CODE_0C85D0                           ; $0C85B8 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0C85BA |
  BMI CODE_0C85D1                           ; $0C85BC |
  SEP #$20                                  ; $0C85BE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C85C0 |
  LDA $8634,y                               ; $0C85C2 |
  STA !s_spr_anim_frame,x                   ; $0C85C5 |
  LDA $8639,y                               ; $0C85C8 |
  STA !s_spr_timer_1,x                      ; $0C85CB |
  REP #$20                                  ; $0C85CE |

CODE_0C85D0:
  RTL                                       ; $0C85D0 |

CODE_0C85D1:
  LDA #$0010                                ; $0C85D1 |
  STA !s_spr_state,x                        ; $0C85D4 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0C85D7 |
  LDA !s_spr_bitwise_settings_1,x           ; $0C85D9 |
  AND #$07FF                                ; $0C85DC |
  ORA #$F640                                ; $0C85DF |
  STA !s_spr_bitwise_settings_1,x           ; $0C85E2 |
  LDA !s_spr_bitwise_settings_3,x           ; $0C85E5 |
  AND #$F03F                                ; $0C85E8 |
  ORA #$0140                                ; $0C85EB |
  STA !s_spr_bitwise_settings_3,x           ; $0C85EE |
  LDA #$000C                                ; $0C85F1 |
  STA !s_spr_y_hitbox_offset,x              ; $0C85F4 |
  LDA #$0005                                ; $0C85F7 |
  STA !s_spr_hitbox_height,x                ; $0C85FA |
  LDA !s_spr_x_player_dir,x                 ; $0C85FD |
  AND #$00FF                                ; $0C8600 |
  STA !s_spr_facing_dir,x                   ; $0C8603 |

CODE_0C8606:
  LDA #$0100                                ; $0C8606 |
  STA !s_spr_timer_2,x                      ; $0C8609 |
  LDA #$0006                                ; $0C860C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C860F |
  LDA #$0001                                ; $0C8611 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8614 |
  SEP #$20                                  ; $0C8616 |
  TAY                                       ; $0C8618 |
  LDA $84E0,y                               ; $0C8619 |
  STA !s_spr_anim_frame,x                   ; $0C861C |
  LDA #$02                                  ; $0C861F |
  STA !s_spr_timer_1,x                      ; $0C8621 |
  REP #$20                                  ; $0C8624 |
  LDY !s_spr_facing_dir,x                   ; $0C8626 |
  LDA $84E2,y                               ; $0C8629 |
  STA !s_spr_x_speed_lo,x                   ; $0C862C |
  RTL                                       ; $0C862F |

  dw $8593, $85B3                           ; $0C8630 |

  db $0C, $0B, $0A, $09, $00                ; $0C8634 |

  db $20, $01, $02, $01, $01                ; $0C8639 |

init_unknown:
  STZ !s_spr_facing_dir,x                   ; $0C863E |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8641 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8644 |
  STA !s_spr_x_hitbox_offset,x              ; $0C8646 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C8649 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C864C |
  STA !s_spr_y_hitbox_offset,x              ; $0C864F |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C8652 |
  CLC                                       ; $0C8655 |
  ADC #$0010                                ; $0C8656 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C8659 |
  LDA #$0018                                ; $0C865B |
  STA !s_spr_hitbox_width,x                 ; $0C865E |
  STZ !s_spr_hitbox_height,x                ; $0C8661 |
  STZ !s_spr_wildcard_1_lo,x                ; $0C8664 |
  JSL $03AE60                               ; $0C8667 |
  BCC CODE_0C86AA                           ; $0C866B |
  JSR CODE_0C878D                           ; $0C866D |
  RTL                                       ; $0C8670 |

init_unbalanced_snowy_platform:
  STZ !s_spr_facing_dir,x                   ; $0C8671 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8674 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8677 |
  STA !s_spr_x_hitbox_offset,x              ; $0C8679 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C867C |
  LDA !s_spr_y_pixel_pos,x                  ; $0C867F |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C8682 |
  CLC                                       ; $0C8685 |
  ADC #$0020                                ; $0C8686 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C8689 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C868B |
  SEC                                       ; $0C868E |
  SBC #$0010                                ; $0C868F |
  STA !s_spr_y_hitbox_offset,x              ; $0C8692 |
  LDA #$0028                                ; $0C8695 |
  STA !s_spr_hitbox_width,x                 ; $0C8698 |
  LDA #$FFF0                                ; $0C869B |
  STA !s_spr_hitbox_height,x                ; $0C869E |
  STZ !s_spr_wildcard_1_lo,x                ; $0C86A1 |
  JSL $03ADFE                               ; $0C86A4 |
  BCS CODE_0C86B1                           ; $0C86A8 |

CODE_0C86AA:
  STZ $61C0                                 ; $0C86AA |
  JML $03A31E                               ; $0C86AD |

CODE_0C86B1:
  JSR CODE_0C88A2                           ; $0C86B1 |
  RTL                                       ; $0C86B4 |

  db $10, $00                               ; $0C86B5 |

  dw $0000, $FFF0, $FFE0                    ; $0C86B7 |

  JSL $03AA52                               ; $0C86BD |
  JSL $03AF23                               ; $0C86C1 |
  JSR CODE_0C878D                           ; $0C86C5 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C86C8 |
  STA $603E                                 ; $0C86CA |
  LDA !s_spr_wildcard_1_lo,x                ; $0C86CD |
  BNE CODE_0C8710                           ; $0C86D0 |
  LDA $61C0                                 ; $0C86D2 |
  BEQ CODE_0C870D                           ; $0C86D5 |
  DEC $61C0                                 ; $0C86D7 |
  DEC A                                     ; $0C86DA |
  AND #$0001                                ; $0C86DB |
  ASL A                                     ; $0C86DE |
  TAY                                       ; $0C86DF |
  LDA !s_spr_x_pixel_pos,x                  ; $0C86E0 |
  CLC                                       ; $0C86E3 |
  ADC $86B7,y                               ; $0C86E4 |
  STA $0091                                 ; $0C86E7 |
  LDA $61C0                                 ; $0C86EA |
  AND #$0002                                ; $0C86ED |
  TAY                                       ; $0C86F0 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C86F1 |
  CLC                                       ; $0C86F4 |
  ADC $86B7,y                               ; $0C86F5 |
  STA $0093                                 ; $0C86F8 |
  LDA #$0001                                ; $0C86FB |
  STA $008F                                 ; $0C86FE |
  LDA #$0000                                ; $0C8701 |
  STA $0095                                 ; $0C8704 |
  JSL $109295                               ; $0C8707 |
  BRA CODE_0C8731                           ; $0C870B |

CODE_0C870D:
  INC !s_spr_wildcard_1_lo,x                ; $0C870D |

CODE_0C8710:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C8710 |
  CLC                                       ; $0C8712 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $0C8713 |
  STA $00                                   ; $0C8715 |
  CLC                                       ; $0C8717 |
  ADC #$3000                                ; $0C8718 |
  CMP #$6000                                ; $0C871B |
  BCS CODE_0C8731                           ; $0C871E |
  LDA $00                                   ; $0C8720 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C8722 |
  LDX #$09                                  ; $0C8724 |
  LDA #$9F21                                ; $0C8726 | gsu_calc_snowy_platform_coords
  JSL r_gsu_init_1                          ; $0C8729 |
  LDX $12                                   ; $0C872D |
  BRA CODE_0C8744                           ; $0C872F |

CODE_0C8731:
  LDA #$FF80                                ; $0C8731 |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $0C8734 |
  BMI CODE_0C873B                           ; $0C8736 |
  LDA #$0080                                ; $0C8738 |

CODE_0C873B:
  STA !s_spr_x_speed_lo,x                   ; $0C873B |
  LDA #$0040                                ; $0C873E |
  STA !s_spr_y_accel,x                      ; $0C8741 |

CODE_0C8744:
  LDX #$09                                  ; $0C8744 |
  LDA #$9D9D                                ; $0C8746 |
  JSL r_gsu_init_1                          ; $0C8749 | GSU init
  LDX $12                                   ; $0C874D |
  LDA !gsu_r0                               ; $0C874F |
  BEQ CODE_0C8768                           ; $0C8752 |
  LDA !s_spr_x_pixel_pos                    ; $0C8754 |
  CLC                                       ; $0C8757 |
  ADC !s_spr_x_delta_lo,x                   ; $0C8758 |
  STA !s_spr_x_pixel_pos                    ; $0C875B |
  LDA !s_spr_y_pixel_pos                    ; $0C875E |
  CLC                                       ; $0C8761 |
  ADC !s_spr_y_delta_lo,x                   ; $0C8762 |
  STA !s_spr_y_pixel_pos                    ; $0C8765 |

CODE_0C8768:
  LDX #$09                                  ; $0C8768 |
  LDA #$9C0D                                ; $0C876A |
  JSL r_gsu_init_1                          ; $0C876D | GSU init
  LDX $12                                   ; $0C8771 |
  LDA !gsu_r0                               ; $0C8773 |
  BEQ CODE_0C878C                           ; $0C8776 |
  LDA !s_player_x                           ; $0C8778 |
  CLC                                       ; $0C877B |
  ADC !s_spr_x_delta_lo,x                   ; $0C877C |
  STA !s_player_x                           ; $0C877F |
  LDA !s_player_y                           ; $0C8782 |
  CLC                                       ; $0C8785 |
  ADC !s_spr_y_delta_lo,x                   ; $0C8786 |
  STA !s_player_y                           ; $0C8789 |

CODE_0C878C:
  RTL                                       ; $0C878C |

CODE_0C878D:
  REP #$10                                  ; $0C878D |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C878F |
  EOR #$FFFF                                ; $0C8791 |
  INC A                                     ; $0C8794 |
  XBA                                       ; $0C8795 |
  AND #$00FF                                ; $0C8796 |
  STA !gsu_r5                               ; $0C8799 |
  LDY !s_spr_dyntile_index,x                ; $0C879C |
  TYX                                       ; $0C879F |
  LDA $03A9CE,x                             ; $0C87A0 |
  STA !gsu_r3                               ; $0C87A4 |
  LDA $03A9EE,x                             ; $0C87A7 |
  STA !gsu_r2                               ; $0C87AB |
  LDA #$0100                                ; $0C87AE |
  STA !gsu_r6                               ; $0C87B1 |
  LDA #$2021                                ; $0C87B4 |
  STA !gsu_r12                              ; $0C87B7 |
  LDA #$0055                                ; $0C87BA |
  STA !gsu_r13                              ; $0C87BD |
  SEP #$10                                  ; $0C87C0 |
  LDX #$08                                  ; $0C87C2 |
  LDA #$8205                                ; $0C87C4 |
  JSL r_gsu_init_1                          ; $0C87C7 | GSU init
  INC $0CF9                                 ; $0C87CB |
  LDX $12                                   ; $0C87CE |
  RTS                                       ; $0C87D0 |

main_unbalanced_snowy_playform:
  JSL $03AB1C                               ; $0C87D1 |
  JSL $03AF23                               ; $0C87D5 |
  JSR CODE_0C88A2                           ; $0C87D9 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C87DC |
  STA $603E                                 ; $0C87DE |
  LDA !s_spr_wildcard_1_lo,x                ; $0C87E1 |
  BNE CODE_0C8825                           ; $0C87E4 |
  LDA $61C0                                 ; $0C87E6 |
  BEQ CODE_0C8822                           ; $0C87E9 |
  DEC $61C0                                 ; $0C87EB |
  DEC A                                     ; $0C87EE |
  AND #$0003                                ; $0C87EF |
  ASL A                                     ; $0C87F2 |
  TAY                                       ; $0C87F3 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C87F4 |
  CLC                                       ; $0C87F7 |
  ADC $86B5,y                               ; $0C87F8 |
  STA $0091                                 ; $0C87FB |
  LDA $61C0                                 ; $0C87FE |
  AND #$000C                                ; $0C8801 |
  LSR A                                     ; $0C8804 |
  TAY                                       ; $0C8805 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8806 |
  CLC                                       ; $0C8809 |
  ADC $86B5,y                               ; $0C880A |
  STA $0093                                 ; $0C880D |
  LDA #$0001                                ; $0C8810 |
  STA $008F                                 ; $0C8813 |
  LDA #$0000                                ; $0C8816 |
  STA $0095                                 ; $0C8819 |
  JSL $109295                               ; $0C881C |
  BRA CODE_0C8846                           ; $0C8820 |

CODE_0C8822:
  INC !s_spr_wildcard_1_lo,x                ; $0C8822 |

CODE_0C8825:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C8825 |
  CLC                                       ; $0C8827 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $0C8828 |
  STA $00                                   ; $0C882A |
  CLC                                       ; $0C882C |
  ADC #$3000                                ; $0C882D |
  CMP #$6000                                ; $0C8830 |
  BCS CODE_0C8846                           ; $0C8833 |
  LDA $00                                   ; $0C8835 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C8837 |
  LDX #$09                                  ; $0C8839 |
  LDA #$9F21                                ; $0C883B | gsu_calc_snowy_platform_coords
  JSL r_gsu_init_1                          ; $0C883E |
  LDX $12                                   ; $0C8842 |
  BRA CODE_0C8859                           ; $0C8844 |

CODE_0C8846:
  LDA #$FF80                                ; $0C8846 |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $0C8849 |
  BMI CODE_0C8850                           ; $0C884B |
  LDA #$0080                                ; $0C884D |

CODE_0C8850:
  STA !s_spr_x_speed_lo,x                   ; $0C8850 |
  LDA #$0040                                ; $0C8853 |
  STA !s_spr_y_accel,x                      ; $0C8856 |

CODE_0C8859:
  LDX #$09                                  ; $0C8859 |
  LDA #$9D9D                                ; $0C885B |
  JSL r_gsu_init_1                          ; $0C885E | GSU init
  LDX $12                                   ; $0C8862 |
  LDA !gsu_r0                               ; $0C8864 |
  BEQ CODE_0C887D                           ; $0C8867 |
  LDA !s_spr_x_pixel_pos                    ; $0C8869 |
  CLC                                       ; $0C886C |
  ADC !s_spr_x_delta_lo,x                   ; $0C886D |
  STA !s_spr_x_pixel_pos                    ; $0C8870 |
  LDA !s_spr_y_pixel_pos                    ; $0C8873 |
  CLC                                       ; $0C8876 |
  ADC !s_spr_y_delta_lo,x                   ; $0C8877 |
  STA !s_spr_y_pixel_pos                    ; $0C887A |

CODE_0C887D:
  LDX #$09                                  ; $0C887D |
  LDA #$9C0D                                ; $0C887F |
  JSL r_gsu_init_1                          ; $0C8882 | GSU init
  LDX $12                                   ; $0C8886 |
  LDA !gsu_r0                               ; $0C8888 |
  BEQ CODE_0C88A1                           ; $0C888B |
  LDA !s_player_x                           ; $0C888D |
  CLC                                       ; $0C8890 |
  ADC !s_spr_x_delta_lo,x                   ; $0C8891 |
  STA !s_player_x                           ; $0C8894 |
  LDA !s_player_y                           ; $0C8897 |
  CLC                                       ; $0C889A |
  ADC !s_spr_y_delta_lo,x                   ; $0C889B |
  STA !s_player_y                           ; $0C889E |

CODE_0C88A1:
  RTL                                       ; $0C88A1 |

CODE_0C88A2:
  REP #$10                                  ; $0C88A2 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C88A4 |
  EOR #$FFFF                                ; $0C88A6 |
  INC A                                     ; $0C88A9 |
  XBA                                       ; $0C88AA |
  AND #$00FF                                ; $0C88AB |
  STA !gsu_r5                               ; $0C88AE |
  LDY !s_spr_dyntile_index,x                ; $0C88B1 |
  TYX                                       ; $0C88B4 |
  LDA $03A9CE,x                             ; $0C88B5 |
  STA !gsu_r3                               ; $0C88B9 |
  LDA $03A9EE,x                             ; $0C88BC |
  STA !gsu_r2                               ; $0C88C0 |
  LDA #$0100                                ; $0C88C3 |
  STA !gsu_r6                               ; $0C88C6 |
  LDA #$4001                                ; $0C88C9 |
  STA !gsu_r12                              ; $0C88CC |
  LDA #$0055                                ; $0C88CF |
  STA !gsu_r13                              ; $0C88D2 |
  SEP #$10                                  ; $0C88D5 |
  LDX #$08                                  ; $0C88D7 |
  LDA #$8B47                                ; $0C88D9 |
  JSL r_gsu_init_1                          ; $0C88DC | GSU init
  INC $0CF9                                 ; $0C88E0 |
  LDX $12                                   ; $0C88E3 |
  RTS                                       ; $0C88E5 |

  LDA #$0001                                ; $0C88E6 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C88E9 |
  LDA #$0100                                ; $0C88EB |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C88EE |
  JSL $03AE60                               ; $0C88F0 |
  JMP CODE_0C891C                           ; $0C88F4 |

  dw $2041, $2041, $2061, $2041, $2061      ; $0C88F7 |

  dw $0055, $0055, $0055, $0055, $0055      ; $0C8901 |

  JSL $03AA52                               ; $0C890B |
  JSL $03AF23                               ; $0C890F |
  JSR CODE_0C8A80                           ; $0C8913 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C8916 |
  TYX                                       ; $0C8918 |
  JSR ($8965,x)                             ; $0C8919 |

CODE_0C891C:
  LDA !s_spr_facing_dir,x                   ; $0C891C |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C891F |
  REP #$10                                  ; $0C8922 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C8924 |
  AND #$00FF                                ; $0C8926 |
  STA !gsu_r5                               ; $0C8929 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C892C |
  LDA $88F7,y                               ; $0C892E |
  STA !gsu_r12                              ; $0C8931 |
  LDA $8901,y                               ; $0C8934 |
  AND #$00FF                                ; $0C8937 |
  STA !gsu_r13                              ; $0C893A |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0C893D |
  STA !gsu_r6                               ; $0C893F |
  LDA !s_spr_dyntile_index,x                ; $0C8942 |
  TAX                                       ; $0C8945 |
  LDA $03A9CE,x                             ; $0C8946 |
  STA !gsu_r3                               ; $0C894A |
  LDA $03A9EE,x                             ; $0C894D |
  STA !gsu_r2                               ; $0C8951 |
  SEP #$10                                  ; $0C8954 |
  LDX #$08                                  ; $0C8956 |
  LDA #$8205                                ; $0C8958 |
  JSL r_gsu_init_1                          ; $0C895B | GSU init
  INC $0CF9                                 ; $0C895F |
  LDX $12                                   ; $0C8962 |
  RTL                                       ; $0C8964 |

  dw $896F, $8994, $89B5, $8A5D, $8A13      ; $0C8965 |

  LDX $12                                   ; $0C896F |
  JSR CODE_0C8AEC                           ; $0C8971 |
  JSR CODE_0C8B28                           ; $0C8974 |

CODE_0C8977:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C8977 |
  CLC                                       ; $0C8979 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0C897A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C897C |
  CLC                                       ; $0C897E |
  ADC #$000C                                ; $0C897F |
  CMP #$0018                                ; $0C8982 |
  BCC CODE_0C898F                           ; $0C8985 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C8987 |
  EOR #$FFFF                                ; $0C8989 |
  INC A                                     ; $0C898C |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C898D |

CODE_0C898F:
  RTS                                       ; $0C898F |

  dw $FE00, $0200                           ; $0C8990 |

  LDX $12                                   ; $0C8994 |
  LDA $7860,x                               ; $0C8996 |
  BIT #$0001                                ; $0C8999 |
  BEQ CODE_0C89B4                           ; $0C899C |
  LDA !s_spr_x_player_dir,x                 ; $0C899E |
  AND #$00FF                                ; $0C89A1 |
  STA !s_spr_facing_dir,x                   ; $0C89A4 |
  TAY                                       ; $0C89A7 |
  LDA $8990,y                               ; $0C89A8 |
  STA !s_spr_x_speed_lo,x                   ; $0C89AB |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C89AE |
  INY                                       ; $0C89B0 |
  INY                                       ; $0C89B1 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0C89B2 |

CODE_0C89B4:
  RTS                                       ; $0C89B4 |

  LDX $12                                   ; $0C89B5 |
  LDA !s_spr_facing_dir,x                   ; $0C89B7 |
  CMP !s_spr_gsu_morph_1_lo,x               ; $0C89BA |
  BNE CODE_0C89E8                           ; $0C89BD |
  LDA $14                                   ; $0C89BF |
  AND #$000F                                ; $0C89C1 |
  BNE CODE_0C89CD                           ; $0C89C4 |
  LDA #$0059                                ; $0C89C6 |\ play sound #$0059
  JSL push_sound_queue                      ; $0C89C9 |/

CODE_0C89CD:
  LDA !s_spr_x_speed_lo,x                   ; $0C89CD |
  BPL CODE_0C89D6                           ; $0C89D0 |
  EOR #$FFFF                                ; $0C89D2 |
  INC A                                     ; $0C89D5 |

CODE_0C89D6:
  LSR A                                     ; $0C89D6 |
  LSR A                                     ; $0C89D7 |
  LSR A                                     ; $0C89D8 |
  LSR A                                     ; $0C89D9 |
  LSR A                                     ; $0C89DA |
  LSR A                                     ; $0C89DB |
  AND #$00FF                                ; $0C89DC |
  CLC                                       ; $0C89DF |
  ADC !s_spr_wildcard_3_lo_dp,x             ; $0C89E0 |
  AND #$00FF                                ; $0C89E2 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C89E5 |
  RTS                                       ; $0C89E7 |

CODE_0C89E8:
  LDA #$0036                                ; $0C89E8 |\ play sound #$0036
  JSL push_sound_queue                      ; $0C89EB |/
  LDA #$01CD                                ; $0C89EF |
  JSL spawn_ambient_sprite                  ; $0C89F2 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C89F6 |
  STA $70A2,y                               ; $0C89F9 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C89FC |
  STA $7142,y                               ; $0C89FF |
  LDA #$000B                                ; $0C8A02 |
  STA $7E4C,y                               ; $0C8A05 |
  LDA #$0004                                ; $0C8A08 |
  STA $7782,y                               ; $0C8A0B |
  PLA                                       ; $0C8A0E |
  JML $03A31E                               ; $0C8A0F |
  LDX $12                                   ; $0C8A13 |
  JSR CODE_0C8AEC                           ; $0C8A15 |
  JSR CODE_0C8B28                           ; $0C8A18 |
  LDA !s_spr_timer_2,x                      ; $0C8A1B |
  BNE CODE_0C8A2D                           ; $0C8A1E |
  LDA #$003D                                ; $0C8A20 |\ play sound #$003D
  JSL push_sound_queue                      ; $0C8A23 |/
  LDA #$0020                                ; $0C8A27 |
  STA !s_spr_timer_2,x                      ; $0C8A2A |

CODE_0C8A2D:
  LDA !s_spr_timer_1,x                      ; $0C8A2D |
  BEQ CODE_0C8A4E                           ; $0C8A30 |
  LDA !s_spr_x_player_dir,x                 ; $0C8A32 |
  AND #$00FF                                ; $0C8A35 |
  STA !s_spr_facing_dir,x                   ; $0C8A38 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0C8A3B |
  SEC                                       ; $0C8A3D |
  SBC #$0008                                ; $0C8A3E |
  CMP #$00C0                                ; $0C8A41 |
  BCS CODE_0C8A49                           ; $0C8A44 |
  LDA #$0100                                ; $0C8A46 |

CODE_0C8A49:
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8A49 |
  JMP CODE_0C8977                           ; $0C8A4B |

CODE_0C8A4E:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C8A4E |
  LDA #$0001                                ; $0C8A50 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C8A53 |
  LDA #$0100                                ; $0C8A55 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8A58 |
  JMP CODE_0C8B09                           ; $0C8A5A |
  LDX $12                                   ; $0C8A5D |
  JSR CODE_0C8AEC                           ; $0C8A5F |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0C8A62 |
  CLC                                       ; $0C8A64 |
  ADC #$0004                                ; $0C8A65 |
  CMP #$0100                                ; $0C8A68 |
  BCS CODE_0C8A70                           ; $0C8A6B |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8A6D |
  RTS                                       ; $0C8A6F |

CODE_0C8A70:
  LDA #$0040                                ; $0C8A70 |
  STA !s_spr_timer_1,x                      ; $0C8A73 |
  LDA #$0100                                ; $0C8A76 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8A79 |
  LDY #$08                                  ; $0C8A7B |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0C8A7D |
  RTS                                       ; $0C8A7F |

CODE_0C8A80:
  LDY !s_spr_collision_id,x                 ; $0C8A80 |
  BPL CODE_0C8AA0                           ; $0C8A83 |
  LDA !s_spr_y_player_delta,x               ; $0C8A85 |
  SEC                                       ; $0C8A88 |
  SBC !s_player_hitbox_half_height          ; $0C8A89 |
  SEC                                       ; $0C8A8C |
  SBC !s_spr_hitbox_height,x                ; $0C8A8D |
  CMP #$FFF8                                ; $0C8A90 |
  BCC CODE_0C8A9B                           ; $0C8A93 |
  JSL $03B20B                               ; $0C8A95 |
  BRA CODE_0C8A9F                           ; $0C8A99 |

CODE_0C8A9B:
  JSL player_hit_sprite                     ; $0C8A9B |

CODE_0C8A9F:
  RTS                                       ; $0C8A9F |

CODE_0C8AA0:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0C8AA0 |
  CPY #$02                                  ; $0C8AA2 |
  BCC CODE_0C8A9F                           ; $0C8AA4 |
  CPY #$05                                  ; $0C8AA6 |
  BCS CODE_0C8A9F                           ; $0C8AA8 |
  TXA                                       ; $0C8AAA |
  STA !gsu_r1                               ; $0C8AAB |
  PHX                                       ; $0C8AAE |
  LDX #$09                                  ; $0C8AAF |
  LDA #$9011                                ; $0C8AB1 |
  JSL r_gsu_init_1                          ; $0C8AB4 | GSU init
  PLX                                       ; $0C8AB8 |
  LDY !gsu_r14                              ; $0C8AB9 |
  BMI CODE_0C8A9F                           ; $0C8ABC |
  BEQ CODE_0C8A9F                           ; $0C8ABE |
  LDA !s_spr_state,y                        ; $0C8AC0 |
  CMP #$000E                                ; $0C8AC3 |
  BCC CODE_0C8A9F                           ; $0C8AC6 |
  LDA !s_spr_bitwise_settings_3,y           ; $0C8AC8 |
  AND #$6000                                ; $0C8ACB |
  BNE CODE_0C8A9F                           ; $0C8ACE |
  LDA !s_spr_bitwise_settings_1,y           ; $0C8AD0 |
  AND #$0020                                ; $0C8AD3 |
  BNE CODE_0C8A9F                           ; $0C8AD6 |
  LDA !s_spr_id,y                           ; $0C8AD8 |
  CMP #$002C                                ; $0C8ADB |
  BEQ CODE_0C8A9F                           ; $0C8ADE |
  TYX                                       ; $0C8AE0 |
  JSL $0CFF61                               ; $0C8AE1 |
  JSL $03B24B                               ; $0C8AE5 |
  LDX $12                                   ; $0C8AE9 |
  RTS                                       ; $0C8AEB |

CODE_0C8AEC:
  LDA !s_spr_y_pixel_pos,x                  ; $0C8AEC |
  SEC                                       ; $0C8AEF |
  SBC !s_player_y                           ; $0C8AF0 |
  SEC                                       ; $0C8AF3 |
  SBC #$0020                                ; $0C8AF4 |
  BPL CODE_0C8B27                           ; $0C8AF7 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8AF9 |
  SEC                                       ; $0C8AFC |
  SBC !s_player_x                           ; $0C8AFD |
  CLC                                       ; $0C8B00 |
  ADC #$0060                                ; $0C8B01 |
  CMP #$00C0                                ; $0C8B04 |
  BCS CODE_0C8B27                           ; $0C8B07 |

CODE_0C8B09:
  LDA #$0040                                ; $0C8B09 |
  STA !s_spr_y_accel,x                      ; $0C8B0C |
  LDA #$0400                                ; $0C8B0F |
  STA !s_spr_y_accel_ceiling,x              ; $0C8B12 |
  LDA !s_spr_bitwise_settings_3,x           ; $0C8B15 |
  ORA #$0043                                ; $0C8B18 |
  STA !s_spr_bitwise_settings_3,x           ; $0C8B1B |
  LDY #$02                                  ; $0C8B1E |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0C8B20 |
  LDA #$0100                                ; $0C8B22 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8B25 |

CODE_0C8B27:
  RTS                                       ; $0C8B27 |

CODE_0C8B28:
  LDY !s_spr_collision_id,x                 ; $0C8B28 |
  DEY                                       ; $0C8B2B |
  BMI CODE_0C8B60                           ; $0C8B2C |
  BEQ CODE_0C8B60                           ; $0C8B2E |
  LDA !s_spr_state,y                        ; $0C8B30 |
  CMP #$0010                                ; $0C8B33 |
  BNE CODE_0C8B60                           ; $0C8B36 |
  LDA !s_spr_collision_state,y              ; $0C8B38 |
  BEQ CODE_0C8B60                           ; $0C8B3B |
  TYX                                       ; $0C8B3D |
  JSL $03B25B                               ; $0C8B3E |
  LDX $12                                   ; $0C8B42 |
  LDA #$0013                                ; $0C8B44 |\ play sound #$0013
  JSL push_sound_queue                      ; $0C8B47 |/
  LDA !s_spr_x_player_dir,x                 ; $0C8B4B |
  AND #$00FF                                ; $0C8B4E |
  STA !s_spr_facing_dir,x                   ; $0C8B51 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C8B54 |
  LDY #$06                                  ; $0C8B56 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0C8B58 |
  LDA #$00C0                                ; $0C8B5A |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C8B5D |
  PLA                                       ; $0C8B5F |

CODE_0C8B60:
  RTS                                       ; $0C8B60 |

init_boo_guy:
  JSL $0EB8AE                               ; $0C8B61 |
  BEQ CODE_0C8B74                           ; $0C8B65 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8B67 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C8B6A |
  LDA #$0004                                ; $0C8B6D |
  STA !s_spr_y_hitbox_offset,x              ; $0C8B70 |
  RTL                                       ; $0C8B73 |

CODE_0C8B74:
  SEP #$20                                  ; $0C8B74 |
  LDA #$01                                  ; $0C8B76 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C8B78 |
  LDA #$FF                                  ; $0C8B7B |
  STA !s_spr_draw_priority,x                ; $0C8B7D |
  REP #$20                                  ; $0C8B80 |
  LDA #$0060                                ; $0C8B82 |
  STA !s_spr_bitwise_settings_1,x           ; $0C8B85 |
  LDA #$2000                                ; $0C8B88 |
  STA !s_spr_bitwise_settings_3,x           ; $0C8B8B |
  LDA !s_spr_oam_1,x                        ; $0C8B8E |
  AND #$FE0F                                ; $0C8B91 |
  STA !s_spr_oam_1,x                        ; $0C8B94 |
  STZ !s_spr_y_accel,x                      ; $0C8B97 |
  STZ !s_spr_y_accel_ceiling,x              ; $0C8B9A |
  STZ !s_spr_y_speed_lo,x                   ; $0C8B9D |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8BA0 |
  CLC                                       ; $0C8BA3 |
  ADC #$0008                                ; $0C8BA4 |
  STA !s_spr_x_pixel_pos,x                  ; $0C8BA7 |
  RTL                                       ; $0C8BAA |

  dw $FF80, $0080                           ; $0C8BAB |

main_boo_guy:
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C8BAF |
  BEQ CODE_0C8BB7                           ; $0C8BB2 |
  JMP CODE_0C8F5D                           ; $0C8BB4 |

CODE_0C8BB7:
  LDA !s_spr_state,x                        ; $0C8BB7 |
  CMP #$0010                                ; $0C8BBA |
  BNE CODE_0C8BD3                           ; $0C8BBD |
  LDA !s_spr_collision_state,x              ; $0C8BBF |
  BEQ CODE_0C8BD3                           ; $0C8BC2 |
  LDA !s_spr_x_speed_lo,x                   ; $0C8BC4 |
  CLC                                       ; $0C8BC7 |
  ADC #$0180                                ; $0C8BC8 |
  CMP #$0301                                ; $0C8BCB |
  BCC CODE_0C8BD3                           ; $0C8BCE |
  JMP CODE_0C8D2F                           ; $0C8BD0 |

CODE_0C8BD3:
  JSL $03AF23                               ; $0C8BD3 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8BD7 |
  CPY #$04                                  ; $0C8BD9 |
  BEQ CODE_0C8BE5                           ; $0C8BDB |
  JSL $03A5B7                               ; $0C8BDD |
  JSL $0C8E50                               ; $0C8BE1 |

CODE_0C8BE5:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8BE5 |
  TYX                                       ; $0C8BE7 |
  JMP ($8BEB,x)                             ; $0C8BE8 |

  dw $8BF7                                  ; $0C8BEB |
  dw $8C15                                  ; $0C8BED |
  dw $8C5A                                  ; $0C8BEF |
  dw $8C7F                                  ; $0C8BF1 |
  dw $8CA0                                  ; $0C8BF3 |
  dw $8CCE                                  ; $0C8BF5 |

  LDX $12                                   ; $0C8BF7 |
  JSR CODE_0C8D19                           ; $0C8BF9 |
  LDA !s_spr_timer_1,x                      ; $0C8BFC |
  BNE CODE_0C8C14                           ; $0C8BFF |
  STZ !s_spr_x_speed_lo,x                   ; $0C8C01 |
  LDA $10                                   ; $0C8C04 |
  AND #$001F                                ; $0C8C06 |
  CLC                                       ; $0C8C09 |
  ADC #$0020                                ; $0C8C0A |
  STA !s_spr_timer_1,x                      ; $0C8C0D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8C10 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C8C12 |

CODE_0C8C14:
  RTL                                       ; $0C8C14 |

  LDX $12                                   ; $0C8C15 |
  JSR CODE_0C8D19                           ; $0C8C17 |
  LDA !s_spr_timer_1,x                      ; $0C8C1A |
  BNE CODE_0C8C3B                           ; $0C8C1D |
  LDA $10                                   ; $0C8C1F |
  AND #$003F                                ; $0C8C21 |
  CLC                                       ; $0C8C24 |
  ADC #$0040                                ; $0C8C25 |
  STA !s_spr_timer_1,x                      ; $0C8C28 |
  STZ !s_spr_wildcard_3_lo,x                ; $0C8C2B |
  LDY !s_spr_facing_dir,x                   ; $0C8C2E |
  LDA $8BAB,y                               ; $0C8C31 |
  STA !s_spr_x_speed_lo,x                   ; $0C8C34 |
  JSR CODE_0C8CE6                           ; $0C8C37 |

CODE_0C8C3A:
  RTL                                       ; $0C8C3A |

CODE_0C8C3B:
  LDA !s_spr_timer_3,x                      ; $0C8C3B |
  BNE CODE_0C8C3A                           ; $0C8C3E |
  LDA !s_spr_facing_dir,x                   ; $0C8C40 |
  EOR #$0002                                ; $0C8C43 |
  STA !s_spr_facing_dir,x                   ; $0C8C46 |
  LDA $10                                   ; $0C8C49 |
  AND #$000F                                ; $0C8C4B |
  CLC                                       ; $0C8C4E |
  ADC #$0010                                ; $0C8C4F |
  STA !s_spr_timer_3,x                      ; $0C8C52 |
  RTL                                       ; $0C8C55 |

  dw $FF00, $0100                           ; $0C8C56 |

  LDX $12                                   ; $0C8C5A |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8C5C |
  STA !gsu_r8                               ; $0C8C5F |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8C62 |
  CLC                                       ; $0C8C65 |
  ADC #$0003                                ; $0C8C66 |
  JSL $0EB8B7                               ; $0C8C69 |
  BEQ CODE_0C8C7E                           ; $0C8C6D |
  STZ !s_spr_y_speed_lo,x                   ; $0C8C6F |
  LDA #$0020                                ; $0C8C72 |
  STA !s_spr_timer_1,x                      ; $0C8C75 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8C78 |
  INY                                       ; $0C8C7A |
  INY                                       ; $0C8C7B |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0C8C7C |

CODE_0C8C7E:
  RTL                                       ; $0C8C7E |

  LDX $12                                   ; $0C8C7F |
  LDA !s_spr_timer_1,x                      ; $0C8C81 |
  BNE CODE_0C8C9F                           ; $0C8C84 |
  LDA #$0077                                ; $0C8C86 |\ play sound #$0077
  JSL push_sound_queue                      ; $0C8C89 |/
  LDA #$0040                                ; $0C8C8D |
  STA !s_spr_y_accel,x                      ; $0C8C90 |
  LDA #$FC00                                ; $0C8C93 |
  STA !s_spr_y_speed_lo,x                   ; $0C8C96 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8C99 |
  INY                                       ; $0C8C9B |
  INY                                       ; $0C8C9C |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0C8C9D |

CODE_0C8C9F:
  RTL                                       ; $0C8C9F |

  LDX $12                                   ; $0C8CA0 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8CA2 |
  STA !gsu_r8                               ; $0C8CA5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8CA8 |
  CLC                                       ; $0C8CAB |
  ADC #$000F                                ; $0C8CAC |
  JSL $0EB8B7                               ; $0C8CAF |
  BEQ CODE_0C8CCD                           ; $0C8CB3 |
  LDY !s_spr_facing_dir,x                   ; $0C8CB5 |
  LDA $8C56,y                               ; $0C8CB8 |
  STA !s_spr_x_speed_lo,x                   ; $0C8CBB |
  LDA !s_spr_bitwise_settings_3,x           ; $0C8CBE |
  ORA #$0001                                ; $0C8CC1 |
  STA !s_spr_bitwise_settings_3,x           ; $0C8CC4 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C8CC7 |
  INY                                       ; $0C8CC9 |
  INY                                       ; $0C8CCA |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0C8CCB |

CODE_0C8CCD:
  RTL                                       ; $0C8CCD |

  LDX $12                                   ; $0C8CCE |
  LDA $7860,x                               ; $0C8CD0 |
  AND #$0001                                ; $0C8CD3 |
  BEQ CODE_0C8CE5                           ; $0C8CD6 |
  STZ !s_spr_x_speed_lo,x                   ; $0C8CD8 |
  LDA #$0004                                ; $0C8CDB |
  STA !s_spr_y_hitbox_offset,x              ; $0C8CDE |
  LDY #$00                                  ; $0C8CE1 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0C8CE3 |

CODE_0C8CE5:
  RTL                                       ; $0C8CE5 |

CODE_0C8CE6:
  LDA !s_spr_x_player_dir,x                 ; $0C8CE6 |
  AND #$00FF                                ; $0C8CE9 |
  CMP !s_spr_facing_dir,x                   ; $0C8CEC |
  BNE CODE_0C8D18                           ; $0C8CEF |
  LDA !s_spr_x_hitbox_center,x              ; $0C8CF1 |
  SEC                                       ; $0C8CF4 |
  SBC !s_player_center_x                    ; $0C8CF5 |
  CLC                                       ; $0C8CF8 |
  ADC #$0040                                ; $0C8CF9 |
  CMP #$0080                                ; $0C8CFC |
  BCS CODE_0C8D18                           ; $0C8CFF |
  LDA !s_spr_y_hitbox_center,x              ; $0C8D01 |
  SEC                                       ; $0C8D04 |
  SBC !s_player_center_y                    ; $0C8D05 |
  CLC                                       ; $0C8D08 |
  ADC #$0040                                ; $0C8D09 |
  CMP #$0080                                ; $0C8D0C |
  BCS CODE_0C8D18                           ; $0C8D0F |
  LDA !s_spr_x_speed_lo,x                   ; $0C8D11 |
  ASL A                                     ; $0C8D14 |
  STA !s_spr_x_speed_lo,x                   ; $0C8D15 |

CODE_0C8D18:
  RTS                                       ; $0C8D18 |

CODE_0C8D19:
  LDA !s_spr_timer_2,x                      ; $0C8D19 |
  BNE CODE_0C8D2E                           ; $0C8D1C |
  LDA #$0004                                ; $0C8D1E |
  STA !s_spr_timer_2,x                      ; $0C8D21 |
  LDA !s_spr_anim_frame,x                   ; $0C8D24 |
  INC A                                     ; $0C8D27 |
  AND #$0007                                ; $0C8D28 |
  STA !s_spr_anim_frame,x                   ; $0C8D2B |

CODE_0C8D2E:
  RTS                                       ; $0C8D2E |

CODE_0C8D2F:
  LDA !s_sprite_disable_flag                ; $0C8D2F |
  ORA $0B55                                 ; $0C8D32 |
  ORA !r_cur_item_used                      ; $0C8D35 |
  BEQ CODE_0C8D3B                           ; $0C8D38 |
  RTL                                       ; $0C8D3A |

CODE_0C8D3B:
  LDA !s_spr_collision_state,x              ; $0C8D3B |
  DEC A                                     ; $0C8D3E |
  BEQ CODE_0C8D44                           ; $0C8D3F |
  STA !s_spr_collision_state,x              ; $0C8D41 |

CODE_0C8D44:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0C8D44 |
  TYX                                       ; $0C8D46 |
  JMP ($8D4A,x)                             ; $0C8D47 |

  dw $8D6A                                  ; $0C8D4A |
  dw $8DB6                                  ; $0C8D4C |

  dw $0200, $FE00, $0000, $0000             ; $0C8D4E |
  dw $0000, $0000, $FA00, $FA00             ; $0C8D56 |
  dw $0000, $0000, $FFF0, $FFF0             ; $0C8D5E |

  dw $1000, $F000                           ; $0C8D66 |

  LDX $12                                   ; $0C8D6A |
  LDY #$00                                  ; $0C8D6C |
  LDA !s_spr_x_speed_lo,x                   ; $0C8D6E |
  BMI CODE_0C8D75                           ; $0C8D71 |
  INY                                       ; $0C8D73 |
  INY                                       ; $0C8D74 |

CODE_0C8D75:
  TYA                                       ; $0C8D75 |
  EOR !s_spr_facing_dir,x                   ; $0C8D76 |
  TAY                                       ; $0C8D79 |
  LDA $8D66,y                               ; $0C8D7A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8D7D |
  STZ !s_spr_anim_frame,x                   ; $0C8D7F |
  LDA !s_spr_bitwise_settings_3,x           ; $0C8D82 |
  AND #$FCFF                                ; $0C8D85 |
  ORA #$0001                                ; $0C8D88 |
  STA !s_spr_bitwise_settings_3,x           ; $0C8D8B |
  LDA #$0008                                ; $0C8D8E |
  STA !s_spr_y_hitbox_offset,x              ; $0C8D91 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0C8D94 |
  INY                                       ; $0C8D96 |
  INY                                       ; $0C8D97 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0C8D98 |
  LDA !s_spr_dyntile_index,x                ; $0C8D9A |
  BMI CODE_0C8DAC                           ; $0C8D9D |
  LDA !s_spr_oam_1,x                        ; $0C8D9F |
  AND #$07FC                                ; $0C8DA2 |
  ORA #$0800                                ; $0C8DA5 |
  STA !s_spr_oam_1,x                        ; $0C8DA8 |
  RTL                                       ; $0C8DAB |

CODE_0C8DAC:
  LDA !s_spr_oam_yxppccct,x                 ; $0C8DAC |
  ORA #$0080                                ; $0C8DAF |
  STA !s_spr_oam_yxppccct,x                 ; $0C8DB2 |
  RTL                                       ; $0C8DB5 |

  LDX $12                                   ; $0C8DB6 |
  LDA !s_spr_dyntile_index,x                ; $0C8DB8 |
  BMI CODE_0C8DC7                           ; $0C8DBB |
  JSL $03AA2E                               ; $0C8DBD |
  JSL $0C8E07                               ; $0C8DC1 |
  BRA CODE_0C8DD3                           ; $0C8DC5 |

CODE_0C8DC7:
  LDA !s_spr_oam_1,x                        ; $0C8DC7 |
  AND #$07FC                                ; $0C8DCA |
  ORA #$1001                                ; $0C8DCD |
  STA !s_spr_oam_1,x                        ; $0C8DD0 |

CODE_0C8DD3:
  LDA $7860,x                               ; $0C8DD3 |
  BIT #$0001                                ; $0C8DD6 |
  BEQ CODE_0C8DEE                           ; $0C8DD9 |
  LDA !s_spr_x_speed_lo,x                   ; $0C8DDB |
  AND #$8000                                ; $0C8DDE |
  ASL A                                     ; $0C8DE1 |
  ROL A                                     ; $0C8DE2 |
  ASL A                                     ; $0C8DE3 |
  TAY                                       ; $0C8DE4 |
  LDA $8D4E,y                               ; $0C8DE5 |
  STA !s_spr_x_speed_lo,x                   ; $0C8DE8 |
  LDA $7860,x                               ; $0C8DEB |

CODE_0C8DEE:
  BIT #$000C                                ; $0C8DEE |
  BEQ CODE_0C8DF7                           ; $0C8DF1 |
  JSL $0C8F3F                               ; $0C8DF3 |

CODE_0C8DF7:
  JSL $0C8EDE                               ; $0C8DF7 |
  SEP #$20                                  ; $0C8DFB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C8DFD |
  CLC                                       ; $0C8DFF |
  ADC !s_spr_wildcard_4_hi_dp,x             ; $0C8E00 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C8E02 |
  REP #$20                                  ; $0C8E04 |
  RTL                                       ; $0C8E06 |

  LDA !r_msg_box_state                      ; $0C8E07 |
  BNE CODE_0C8E4F                           ; $0C8E0A |
  LDA !s_spr_dyntile_index,x                ; $0C8E0C |
  BMI CODE_0C8E4F                           ; $0C8E0F |
  REP #$10                                  ; $0C8E11 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C8E13 |
  AND #$00FF                                ; $0C8E15 |
  STA !gsu_r5                               ; $0C8E18 |
  LDA #$5010                                ; $0C8E1B |
  STA !gsu_r12                              ; $0C8E1E |
  LDA #$0054                                ; $0C8E21 |
  STA !gsu_r13                              ; $0C8E24 |
  LDA #$0100                                ; $0C8E27 |
  STA !gsu_r6                               ; $0C8E2A |
  LDA !s_spr_dyntile_index,x                ; $0C8E2D |
  TAX                                       ; $0C8E30 |
  LDA $03A9CE,x                             ; $0C8E31 |
  STA !gsu_r3                               ; $0C8E35 |
  LDA $03A9EE,x                             ; $0C8E38 |
  STA !gsu_r2                               ; $0C8E3C |
  SEP #$10                                  ; $0C8E3F |
  LDX #$08                                  ; $0C8E41 |
  LDA #$867E                                ; $0C8E43 |
  JSL r_gsu_init_1                          ; $0C8E46 | GSU init
  INC $0CF9                                 ; $0C8E4A |
  LDX $12                                   ; $0C8E4D |

CODE_0C8E4F:
  RTL                                       ; $0C8E4F |

  LDY !s_spr_collision_id,x                 ; $0C8E50 |
  DEY                                       ; $0C8E53 |
  BMI CODE_0C8EB4                           ; $0C8E54 |
  BEQ CODE_0C8EB4                           ; $0C8E56 |
  LDA !s_spr_state,y                        ; $0C8E58 |
  CMP #$0010                                ; $0C8E5B |
  BNE CODE_0C8EB4                           ; $0C8E5E |
  LDA !s_spr_collision_state,y              ; $0C8E60 |
  BEQ CODE_0C8EB4                           ; $0C8E63 |
  PHY                                       ; $0C8E65 |
  JSL $03AD24                               ; $0C8E66 |
  BCC CODE_0C8E70                           ; $0C8E6A |
  JSL $0C8E07                               ; $0C8E6C |

CODE_0C8E70:
  PLY                                       ; $0C8E70 |
  LDA !s_spr_x_hitbox_center,x              ; $0C8E71 |
  SEC                                       ; $0C8E74 |
  SBC !s_spr_x_hitbox_center,y              ; $0C8E75 |
  AND #$8000                                ; $0C8E78 |
  ASL A                                     ; $0C8E7B |
  ROL A                                     ; $0C8E7C |
  ASL A                                     ; $0C8E7D |
  STA $00                                   ; $0C8E7E |
  JSR CODE_0C8EBF                           ; $0C8E80 |
  BCS CODE_0C8E8C                           ; $0C8E83 |
  TYX                                       ; $0C8E85 |
  JSL $03B24B                               ; $0C8E86 |
  BRA CODE_0C8E91                           ; $0C8E8A |

CODE_0C8E8C:
  TYX                                       ; $0C8E8C |
  JSL $03B25B                               ; $0C8E8D |

CODE_0C8E91:
  LDX $12                                   ; $0C8E91 |
  LDY #$00                                  ; $0C8E93 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0C8E95 |
  LDA #$0001                                ; $0C8E97 |
  STA !s_spr_collision_state,x              ; $0C8E9A |
  LDY $00                                   ; $0C8E9D |
  LDA $8D4E,y                               ; $0C8E9F |
  STA !s_spr_x_speed_lo,x                   ; $0C8EA2 |
  JSL $0C8D6A                               ; $0C8EA5 |
  LDX $12                                   ; $0C8EA9 |
  LDA #$0067                                ; $0C8EAB |\ play sound #$0067
  JSL push_sound_queue                      ; $0C8EAE |/
  PLY                                       ; $0C8EB2 |
  PLA                                       ; $0C8EB3 |

CODE_0C8EB4:
  RTL                                       ; $0C8EB4 |

  dw $019A, $001E, $0133, $012B             ; $0C8EB5 |
  dw $00F3                                  ; $0C8EBD |

CODE_0C8EBF:
  LDX #$08                                  ; $0C8EBF |
  LDA !s_spr_id,y                           ; $0C8EC1 |

CODE_0C8EC4:
  CMP $8EB5,x                               ; $0C8EC4 |
  BEQ CODE_0C8ED1                           ; $0C8EC7 |
  DEX                                       ; $0C8EC9 |
  DEX                                       ; $0C8ECA |
  BPL CODE_0C8EC4                           ; $0C8ECB |
  LDX $12                                   ; $0C8ECD |
  CLC                                       ; $0C8ECF |
  RTS                                       ; $0C8ED0 |

CODE_0C8ED1:
  LDX $12                                   ; $0C8ED1 |
  SEC                                       ; $0C8ED3 |
  RTS                                       ; $0C8ED4 |

  db $0C, $0C, $0D, $0E, $0F, $10, $11, $12 ; $0C8ED5 |
  db $12                                    ; $0C8EDD |

  LDY !s_spr_collision_id,x                 ; $0C8EDE |
  BMI CODE_0C8F3F                           ; $0C8EE1 |
  PHX                                       ; $0C8EE3 |
  TXA                                       ; $0C8EE4 |
  STA !gsu_r1                               ; $0C8EE5 |
  LDX #$09                                  ; $0C8EE8 |
  LDA #$9011                                ; $0C8EEA |
  JSL r_gsu_init_1                          ; $0C8EED | GSU init
  PLX                                       ; $0C8EF1 |
  LDY !gsu_r14                              ; $0C8EF2 |
  BMI CODE_0C8EB4                           ; $0C8EF5 |
  BEQ CODE_0C8EB4                           ; $0C8EF7 |
  LDA !s_spr_state,y                        ; $0C8EF9 |
  CMP #$000E                                ; $0C8EFC |
  BCC CODE_0C8EB4                           ; $0C8EFF |
  LDA !s_spr_bitwise_settings_3,y           ; $0C8F01 |
  BIT #$6000                                ; $0C8F04 |
  BNE CODE_0C8EB4                           ; $0C8F07 |
  JSR CODE_0C8EBF                           ; $0C8F09 |
  BCS CODE_0C8F16                           ; $0C8F0C |
  LDA !s_spr_bitwise_settings_1,y           ; $0C8F0E |
  BIT #$0020                                ; $0C8F11 |
  BNE CODE_0C8EB4                           ; $0C8F14 |

CODE_0C8F16:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C8F16 |
  CMP #$0008                                ; $0C8F18 |
  BCS CODE_0C8F21                           ; $0C8F1B |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0C8F1D |
  BRA CODE_0C8F2A                           ; $0C8F1F |

CODE_0C8F21:
  PHX                                       ; $0C8F21 |
  PHY                                       ; $0C8F22 |
  TYX                                       ; $0C8F23 |
  JSL $03A496                               ; $0C8F24 |
  PLY                                       ; $0C8F28 |
  PLX                                       ; $0C8F29 |

CODE_0C8F2A:
  TYX                                       ; $0C8F2A |
  JSL $03B25B                               ; $0C8F2B |
  LDX !s_cur_sprite_slot                    ; $0C8F2F |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0C8F32 |
  LDA $8ED5,y                               ; $0C8F34 |
  AND #$00FF                                ; $0C8F37 |
  JSL push_sound_queue                      ; $0C8F3A |
  RTL                                       ; $0C8F3E |

CODE_0C8F3F:
  LDA !s_spr_x_hitbox_center,x              ; $0C8F3F |
  STA $00                                   ; $0C8F42 |
  LDA !s_spr_y_hitbox_center,x              ; $0C8F44 |
  STA $02                                   ; $0C8F47 |
  LDA #$01E7                                ; $0C8F49 |
  JSL $03B56E                               ; $0C8F4C |
  LDA #$000B                                ; $0C8F50 |\ play sound #$000B
  JSL push_sound_queue                      ; $0C8F53 |/
  PLY                                       ; $0C8F57 |
  PLA                                       ; $0C8F58 |
  JML $03A32E                               ; $0C8F59 |

CODE_0C8F5D:
  JSL $03AF23                               ; $0C8F5D |
  LDA !s_spr_timer_1,x                      ; $0C8F61 |
  BNE CODE_0C8FE2                           ; $0C8F64 |
  LDX #$09                                  ; $0C8F66 |
  LDA #$9204                                ; $0C8F68 |
  JSL r_gsu_init_1                          ; $0C8F6B | GSU init
  LDX $12                                   ; $0C8F6F |
  LDA !gsu_r6                               ; $0C8F71 |
  CMP #$0007                                ; $0C8F74 |
  BCS CODE_0C8FE2                           ; $0C8F77 |
  LDA !s_spr_x_player_delta,x               ; $0C8F79 |
  CLC                                       ; $0C8F7C |
  ADC #$001C                                ; $0C8F7D |
  CMP #$0038                                ; $0C8F80 |
  BCS CODE_0C8F91                           ; $0C8F83 |
  LDA !s_spr_y_player_delta,x               ; $0C8F85 |
  CLC                                       ; $0C8F88 |
  ADC #$0021                                ; $0C8F89 |
  CMP #$0042                                ; $0C8F8C |
  BCC CODE_0C8FDC                           ; $0C8F8F |

CODE_0C8F91:
  LDA #$019A                                ; $0C8F91 |
  JSL spawn_sprite_active                   ; $0C8F94 |
  BCC CODE_0C8FE2                           ; $0C8F98 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C8F9A |
  STA !s_spr_x_pixel_pos,y                  ; $0C8F9D |
  LDA !s_spr_y_pixel_pos,x                  ; $0C8FA0 |
  STA !s_spr_y_pixel_pos,y                  ; $0C8FA3 |
  STA !s_spr_gsu_morph_2_lo,y               ; $0C8FA6 |
  LDA #$FF00                                ; $0C8FA9 |
  STA !s_spr_y_speed_lo,y                   ; $0C8FAC |
  LDA #$0000                                ; $0C8FAF |
  STA !s_spr_y_accel,y                      ; $0C8FB2 |
  LDA !s_spr_bitwise_settings_3,y           ; $0C8FB5 |
  AND #$FFE0                                ; $0C8FB8 |
  STA !s_spr_bitwise_settings_3,y           ; $0C8FBB |
  LDA !s_spr_x_player_dir,x                 ; $0C8FBE |
  AND #$00FF                                ; $0C8FC1 |
  STA !s_spr_facing_dir,y                   ; $0C8FC4 |
  SEP #$20                                  ; $0C8FC7 |
  LDA #$00                                  ; $0C8FC9 |
  STA $7862,y                               ; $0C8FCB |
  LDA #$04                                  ; $0C8FCE |
  STA !s_spr_wildcard_3_lo,y                ; $0C8FD0 |
  REP #$20                                  ; $0C8FD3 |
  LDA #$0076                                ; $0C8FD5 |\ play sound #$0076
  JSL push_sound_queue                      ; $0C8FD8 |/

CODE_0C8FDC:
  LDA #$0080                                ; $0C8FDC |
  STA !s_spr_timer_1,x                      ; $0C8FDF |

CODE_0C8FE2:
  RTL                                       ; $0C8FE2 |

  LDA !s_spr_bitwise_settings_1,x           ; $0C8FE3 |
  AND #$F9FF                                ; $0C8FE6 |
  STA !s_spr_bitwise_settings_1,x           ; $0C8FE9 |
  LDA !s_spr_bitwise_settings_3,x           ; $0C8FEC |
  AND #$FFE0                                ; $0C8FEF |
  STA !s_spr_bitwise_settings_3,x           ; $0C8FF2 |
  LDA #$0040                                ; $0C8FF5 |
  STA !s_spr_y_accel,x                      ; $0C8FF8 |
  LDA #$0400                                ; $0C8FFB |
  STA !s_spr_y_accel_ceiling,x              ; $0C8FFE |
  STZ !s_spr_draw_priority,x                ; $0C9001 |
  LDA !s_spr_oam_1,x                        ; $0C9004 |
  AND #$FFF3                                ; $0C9007 |
  ORA #$0004                                ; $0C900A |
  STA !s_spr_oam_1,x                        ; $0C900D |
  LDA !s_spr_oam_yxppccct,x                 ; $0C9010 |
  ORA #$0080                                ; $0C9013 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C9016 |
  CPY #$06                                  ; $0C9018 |
  BEQ CODE_0C9027                           ; $0C901A |
  CPY #$08                                  ; $0C901C |
  BEQ CODE_0C9027                           ; $0C901E |
  ORA #$0030                                ; $0C9020 |
  STA !s_spr_oam_yxppccct,x                 ; $0C9023 |

CODE_0C9026:
  RTL                                       ; $0C9026 |

CODE_0C9027:
  STA !s_spr_oam_yxppccct,x                 ; $0C9027 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C902A |
  CMP !s_spr_gsu_morph_2_lo,x               ; $0C902D |
  BMI CODE_0C9026                           ; $0C9030 |
  JML $03A31E                               ; $0C9032 |

  dw $0007, $0007, $0006, $0005             ; $0C9036 |
  dw $0004, $0003, $0002, $0001             ; $0C903E |
  dw $0000                                  ; $0C9046 |

  dw $0008, $0008, $0008, $0009             ; $0C9048 |
  dw $000A, $000B, $000C, $000D             ; $0C9050 |
  dw $000E                                  ; $0C9058 |

init_blargg:
  LDA !s_spr_y_pixel_pos,x                  ; $0C905A |
  SEC                                       ; $0C905D |
  SBC #$0008                                ; $0C905E |
  STA !s_spr_y_pixel_pos,x                  ; $0C9061 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C9064 |
  LDA #$0008                                ; $0C9067 |
  STA !s_spr_x_hitbox_offset,x              ; $0C906A |
  LDA #$000A                                ; $0C906D |
  STA !s_spr_hitbox_width,x                 ; $0C9070 |
  LDA $9036                                 ; $0C9073 |
  STA !s_spr_y_hitbox_offset,x              ; $0C9076 |
  LDA $9048                                 ; $0C9079 |
  STA !s_spr_hitbox_height,x                ; $0C907C |
  RTL                                       ; $0C907F |

main_blargg:
  JSL $03AF23                               ; $0C9080 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C9084 |
  TAX                                       ; $0C9086 |
  JMP ($908A,x)                             ; $0C9087 |

  dw $9092, $915E, $921B, $9263             ; $0C908A |

  LDX $12                                   ; $0C9092 |
  JSL $03A5B7                               ; $0C9094 |
  JSL $0C910B                               ; $0C9098 |
  JSL $0C9284                               ; $0C909C |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C90A0 |
  TAX                                       ; $0C90A2 |
  JSR ($90A7,x)                             ; $0C90A3 |
  RTL                                       ; $0C90A6 |

  dw $90AB, $90C3                           ; $0C90A7 |

  LDX $12                                   ; $0C90AB |
  LDA !s_spr_timer_1,x                      ; $0C90AD |
  BNE CODE_0C90C2                           ; $0C90B0 |
  LDA #$0010                                ; $0C90B2 |
  STA !s_spr_timer_1,x                      ; $0C90B5 |
  LDA #$0004                                ; $0C90B8 |
  STA !s_spr_timer_2,x                      ; $0C90BB |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C90BE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C90C0 |

CODE_0C90C2:
  RTS                                       ; $0C90C2 |

  LDX $12                                   ; $0C90C3 |
  LDA !s_spr_timer_1,x                      ; $0C90C5 |
  BEQ CODE_0C90ED                           ; $0C90C8 |
  LDA !s_spr_timer_2,x                      ; $0C90CA |
  BNE CODE_0C90EC                           ; $0C90CD |
  LDA #$0004                                ; $0C90CF |
  STA !s_spr_timer_2,x                      ; $0C90D2 |
  LDA !s_spr_anim_frame,x                   ; $0C90D5 |
  EOR #$0001                                ; $0C90D8 |
  STA !s_spr_anim_frame,x                   ; $0C90DB |
  ASL A                                     ; $0C90DE |
  TAY                                       ; $0C90DF |
  LDA $9036,y                               ; $0C90E0 |
  STA !s_spr_y_hitbox_offset,x              ; $0C90E3 |
  LDA $9048,y                               ; $0C90E6 |
  STA !s_spr_hitbox_height,x                ; $0C90E9 |

CODE_0C90EC:
  RTS                                       ; $0C90EC |

CODE_0C90ED:
  STZ !s_spr_anim_frame,x                   ; $0C90ED |
  LDA $9036                                 ; $0C90F0 |
  STA !s_spr_y_hitbox_offset,x              ; $0C90F3 |
  LDA $9048                                 ; $0C90F6 |
  STA !s_spr_hitbox_height,x                ; $0C90F9 |
  LDA $10                                   ; $0C90FC |
  AND #$003F                                ; $0C90FE |
  CLC                                       ; $0C9101 |
  ADC #$0040                                ; $0C9102 |
  STA !s_spr_timer_1,x                      ; $0C9105 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C9108 |
  RTS                                       ; $0C910A |

  LDA !s_spr_x_hitbox_center,x              ; $0C910B |
  SEC                                       ; $0C910E |
  SBC !s_player_center_x                    ; $0C910F |
  CLC                                       ; $0C9112 |
  ADC #$0060                                ; $0C9113 |
  CMP #$00C0                                ; $0C9116 |
  BCS CODE_0C915D                           ; $0C9119 |
  LDA !s_spr_y_hitbox_center,x              ; $0C911B |
  SEC                                       ; $0C911E |
  SBC !s_player_center_y                    ; $0C911F |
  CLC                                       ; $0C9122 |
  ADC #$0020                                ; $0C9123 |
  CMP #$0080                                ; $0C9126 |
  BCS CODE_0C915D                           ; $0C9129 |
  LDA !s_spr_x_player_dir,x                 ; $0C912B |
  AND #$00FF                                ; $0C912E |
  STA !s_spr_facing_dir,x                   ; $0C9131 |
  LDA #$0100                                ; $0C9134 |
  STA !s_spr_y_accel_ceiling,x              ; $0C9137 |
  LDA #$0010                                ; $0C913A |
  STA !s_spr_y_accel,x                      ; $0C913D |
  LDA #$FF00                                ; $0C9140 |
  STA !s_spr_y_speed_lo,x                   ; $0C9143 |
  STZ !s_spr_anim_frame,x                   ; $0C9146 |
  LDA $9036                                 ; $0C9149 |
  STA !s_spr_y_hitbox_offset,x              ; $0C914C |
  LDA $9048                                 ; $0C914F |
  STA !s_spr_hitbox_height,x                ; $0C9152 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C9155 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9157 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9159 |
  PLY                                       ; $0C915B |
  PLA                                       ; $0C915C |

CODE_0C915D:
  RTL                                       ; $0C915D |

  LDX $12                                   ; $0C915E |
  JSL $03A5B7                               ; $0C9160 |
  JSL $0C92D0                               ; $0C9164 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C9168 |
  TAX                                       ; $0C916A |
  JMP ($916E,x)                             ; $0C916B |

  dw $9176, $91EE                           ; $0C916E |

  dw $FF00, $0100                           ; $0C9172 |

  LDX $12                                   ; $0C9176 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0C9178 |
  CLC                                       ; $0C917B |
  ADC #$0010                                ; $0C917C |
  CMP !s_spr_y_pixel_pos,x                  ; $0C917F |
  BPL CODE_0C91D1                           ; $0C9182 |
  STA !s_spr_y_pixel_pos,x                  ; $0C9184 |
  LDA #$FEA0                                ; $0C9187 |
  STA !s_spr_y_speed_lo,x                   ; $0C918A |
  LDA #$0008                                ; $0C918D |
  STA !s_spr_y_accel,x                      ; $0C9190 |
  LDA #$0400                                ; $0C9193 |
  STA !s_spr_y_accel_ceiling,x              ; $0C9196 |
  LDY !s_spr_facing_dir,x                   ; $0C9199 |
  LDA $9172,y                               ; $0C919C |
  STA !s_spr_x_speed_lo,x                   ; $0C919F |
  LDA #$0048                                ; $0C91A2 |\ play sound #$0048
  JSL push_sound_queue                      ; $0C91A5 |/
  LDA #$000D                                ; $0C91A9 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C91AC |
  SEP #$20                                  ; $0C91AE |
  TAY                                       ; $0C91B0 |
  LDA $91E0,y                               ; $0C91B1 |
  STA !s_spr_timer_1,x                      ; $0C91B4 |
  LDA $91D2,y                               ; $0C91B7 |
  STA !s_spr_anim_frame,x                   ; $0C91BA |
  ASL A                                     ; $0C91BD |
  TAY                                       ; $0C91BE |
  REP #$20                                  ; $0C91BF |
  LDA $9036,y                               ; $0C91C1 |
  STA !s_spr_y_hitbox_offset,x              ; $0C91C4 |
  LDA $9048,y                               ; $0C91C7 |
  STA !s_spr_hitbox_height,x                ; $0C91CA |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C91CD |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C91CF |

CODE_0C91D1:
  RTL                                       ; $0C91D1 |

  db $02, $03, $04, $05, $06, $07, $08      ; $0C91D2 |
  db $07, $06, $05, $04, $03, $02, $00      ; $0C91D9 |

  db $02, $02, $02, $02, $02, $02, $18      ; $0C91E0 |
  db $02, $02, $02, $02, $02, $02, $10      ; $0C91E7 |

  LDX $12                                   ; $0C91EE |
  LDA !s_spr_timer_1,x                      ; $0C91F0 |
  BNE CODE_0C9219                           ; $0C91F3 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0C91F5 |
  BMI CODE_0C921A                           ; $0C91F7 |
  SEP #$20                                  ; $0C91F9 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0C91FB |
  LDA $91E0,y                               ; $0C91FD |
  STA !s_spr_timer_1,x                      ; $0C9200 |
  LDA $91D2,y                               ; $0C9203 |
  STA !s_spr_anim_frame,x                   ; $0C9206 |
  ASL A                                     ; $0C9209 |
  TAY                                       ; $0C920A |
  REP #$20                                  ; $0C920B |
  LDA $9036,y                               ; $0C920D |
  STA !s_spr_y_hitbox_offset,x              ; $0C9210 |
  LDA $9048,y                               ; $0C9213 |
  STA !s_spr_hitbox_height,x                ; $0C9216 |

CODE_0C9219:
  RTL                                       ; $0C9219 |

CODE_0C921A:
  RTL                                       ; $0C921A |

  LDX $12                                   ; $0C921B |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C921D |
  BEQ CODE_0C9236                           ; $0C921F |
  LDA !s_spr_timer_1,x                      ; $0C9221 |
  BNE CODE_0C9235                           ; $0C9224 |
  DEC !s_spr_y_pixel_pos,x                  ; $0C9226 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C9229 |
  CMP !s_spr_gsu_morph_2_lo,x               ; $0C922C |
  BNE CODE_0C9235                           ; $0C922F |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C9231 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C9233 |

CODE_0C9235:
  RTL                                       ; $0C9235 |

CODE_0C9236:
  LDA !s_spr_gsu_morph_2_lo,x               ; $0C9236 |
  CLC                                       ; $0C9239 |
  ADC #$0020                                ; $0C923A |
  CMP !s_spr_y_pixel_pos,x                  ; $0C923D |
  BPL CODE_0C9262                           ; $0C9240 |
  STA !s_spr_y_pixel_pos,x                  ; $0C9242 |
  STZ !s_spr_y_accel,x                      ; $0C9245 |
  STZ !s_spr_y_speed_lo,x                   ; $0C9248 |
  STZ !s_spr_anim_frame,x                   ; $0C924B |
  LDA $9036                                 ; $0C924E |
  STA !s_spr_y_hitbox_offset,x              ; $0C9251 |
  LDA $9048                                 ; $0C9254 |
  STA !s_spr_hitbox_height,x                ; $0C9257 |
  LDA #$0080                                ; $0C925A |
  STA !s_spr_timer_1,x                      ; $0C925D |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C9260 |

CODE_0C9262:
  RTL                                       ; $0C9262 |

  LDX $12                                   ; $0C9263 |
  LDA !s_spr_timer_1,x                      ; $0C9265 |
  BNE CODE_0C9283                           ; $0C9268 |
  LDA !s_spr_anim_frame,x                   ; $0C926A |
  CMP #$0001                                ; $0C926D |
  BEQ CODE_0C9283                           ; $0C9270 |
  BCS CODE_0C9279                           ; $0C9272 |
  LDA #$0001                                ; $0C9274 |
  BRA CODE_0C927A                           ; $0C9277 |

CODE_0C9279:
  DEC A                                     ; $0C9279 |

CODE_0C927A:
  STA !s_spr_anim_frame,x                   ; $0C927A |
  LDA #$0002                                ; $0C927D |
  STA !s_spr_timer_1,x                      ; $0C9280 |

CODE_0C9283:
  RTL                                       ; $0C9283 |

  LDY !s_spr_collision_id,x                 ; $0C9284 |
  DEY                                       ; $0C9287 |
  BMI CODE_0C92CF                           ; $0C9288 |
  BEQ CODE_0C92CF                           ; $0C928A |
  LDA !s_spr_state,y                        ; $0C928C |
  CMP #$0010                                ; $0C928F |
  BNE CODE_0C92CF                           ; $0C9292 |
  LDA !s_spr_collision_state,y              ; $0C9294 |
  BEQ CODE_0C92CF                           ; $0C9297 |
  TYX                                       ; $0C9299 |
  JSL $03B25B                               ; $0C929A |
  LDX $12                                   ; $0C929E |
  LDA #$0001                                ; $0C92A0 |
  STA !s_spr_anim_frame,x                   ; $0C92A3 |
  ASL A                                     ; $0C92A6 |
  TAY                                       ; $0C92A7 |
  LDA $9036,y                               ; $0C92A8 |
  STA !s_spr_y_hitbox_offset,x              ; $0C92AB |
  LDA $9048,y                               ; $0C92AE |
  STA !s_spr_hitbox_height,x                ; $0C92B1 |
  LDA #$0100                                ; $0C92B4 |
  STA !s_spr_y_accel_ceiling,x              ; $0C92B7 |
  LDA #$0010                                ; $0C92BA |
  STA !s_spr_y_accel,x                      ; $0C92BD |
  LDA #$FF00                                ; $0C92C0 |
  STA !s_spr_y_speed_lo,x                   ; $0C92C3 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C92C6 |
  LDA #$0004                                ; $0C92C8 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C92CB |
  PLY                                       ; $0C92CD |
  PLA                                       ; $0C92CE |

CODE_0C92CF:
  RTL                                       ; $0C92CF |

  LDY !s_spr_collision_id,x                 ; $0C92D0 |
  DEY                                       ; $0C92D3 |
  BMI CODE_0C9305                           ; $0C92D4 |
  BEQ CODE_0C9305                           ; $0C92D6 |
  LDA !s_spr_state,y                        ; $0C92D8 |
  CMP #$0010                                ; $0C92DB |
  BNE CODE_0C9305                           ; $0C92DE |
  LDA !s_spr_collision_state,y              ; $0C92E0 |
  BEQ CODE_0C9305                           ; $0C92E3 |
  TYX                                       ; $0C92E5 |
  JSL $03B25B                               ; $0C92E6 |
  LDX $12                                   ; $0C92EA |
  STZ !s_spr_x_speed_lo,x                   ; $0C92EC |
  STZ !s_spr_y_speed_lo,x                   ; $0C92EF |
  LDA #$0001                                ; $0C92F2 |
  STA !s_spr_y_accel,x                      ; $0C92F5 |
  LDA #$0100                                ; $0C92F8 |
  STA !s_spr_y_accel_ceiling,x              ; $0C92FB |
  LDA #$0006                                ; $0C92FE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C9301 |
  PLY                                       ; $0C9303 |
  PLA                                       ; $0C9304 |

CODE_0C9305:
  RTL                                       ; $0C9305 |

init_bumpty:
  JSL $02A007                               ; $0C9306 |
  JSR CODE_0C9497                           ; $0C930A |
  RTL                                       ; $0C930D |

main_bumpty:
  JSL $03AF23                               ; $0C930E |
  JSR CODE_0C9613                           ; $0C9312 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C9315 |
  TAX                                       ; $0C9317 |
  JMP ($931B,x)                             ; $0C9318 |

  dw $9323                                  ; $0C931B |
  dw $9379                                  ; $0C931D |
  dw $93EF                                  ; $0C931F |
  dw $9408                                  ; $0C9321 |

  LDX $12                                   ; $0C9323 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0C9325 |
  BEQ CODE_0C9345                           ; $0C9328 |
  LDA !s_spr_x_speed_lo,x                   ; $0C932A |
  BEQ CODE_0C9338                           ; $0C932D |
  LDA !s_spr_facing_dir,x                   ; $0C932F |
  DEC A                                     ; $0C9332 |
  EOR !s_spr_x_speed_lo,x                   ; $0C9333 |
  BMI CODE_0C9344                           ; $0C9336 |

CODE_0C9338:
  STZ !s_spr_gsu_morph_2_lo,x               ; $0C9338 |
  STZ !s_spr_x_accel,x                      ; $0C933B |
  STZ !s_spr_x_speed_lo,x                   ; $0C933E |
  JSR CODE_0C9497                           ; $0C9341 |

CODE_0C9344:
  RTL                                       ; $0C9344 |

CODE_0C9345:
  JSR CODE_0C9364                           ; $0C9345 |
  LDA $7860,x                               ; $0C9348 |
  BIT #$000C                                ; $0C934B |
  BNE CODE_0C935C                           ; $0C934E |
  BIT #$0001                                ; $0C9350 |
  BEQ CODE_0C935C                           ; $0C9353 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C9355 |
  TAX                                       ; $0C9357 |
  JSR ($9360,x)                             ; $0C9358 |
  RTL                                       ; $0C935B |

CODE_0C935C:
  JSR CODE_0C9497                           ; $0C935C |
  RTL                                       ; $0C935F |

  dw $9583                                  ; $0C9360 |
  dw $9487                                  ; $0C9362 |

CODE_0C9364:
  LDY $61CC                                 ; $0C9364 |
  BNE CODE_0C936E                           ; $0C9367 |
  LDA !s_baby_mario_state                   ; $0C9369 |
  BEQ CODE_0C936F                           ; $0C936C |

CODE_0C936E:
  RTS                                       ; $0C936E |

CODE_0C936F:
  LDA #$0002                                ; $0C936F |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C9372 |
  JSR CODE_0C95CB                           ; $0C9374 |
  PLA                                       ; $0C9377 |
  RTL                                       ; $0C9378 |

  LDX $12                                   ; $0C9379 |
  JSR CODE_0C93CE                           ; $0C937B |
  JSR CODE_0C96CF                           ; $0C937E |
  BCS CODE_0C93C3                           ; $0C9381 |
  JSL $06BE72                               ; $0C9383 |
  LDA #$0004                                ; $0C9387 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C938A |
  STZ !s_spr_x_speed_lo,x                   ; $0C938C |
  LDA #$0006                                ; $0C938F |
  STA !s_spr_anim_frame,x                   ; $0C9392 |
  LDA $00                                   ; $0C9395 |
  AND #$8000                                ; $0C9397 |
  ASL A                                     ; $0C939A |
  ROL A                                     ; $0C939B |
  ASL A                                     ; $0C939C |
  STA !s_spr_facing_dir,x                   ; $0C939D |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C93A0 |
  LDA $00                                   ; $0C93A2 |
  BPL CODE_0C93AA                           ; $0C93A4 |
  EOR #$FFFF                                ; $0C93A6 |
  INC A                                     ; $0C93A9 |

CODE_0C93AA:
  ASL A                                     ; $0C93AA |
  ASL A                                     ; $0C93AB |
  ASL A                                     ; $0C93AC |
  ASL A                                     ; $0C93AD |
  LDY $01                                   ; $0C93AE |
  BPL CODE_0C93B6                           ; $0C93B0 |
  EOR #$FFFF                                ; $0C93B2 |
  INC A                                     ; $0C93B5 |

CODE_0C93B6:
  STA !s_spr_x_speed_lo                     ; $0C93B6 |
  LDA $7860                                 ; $0C93B9 |
  AND #$FFFE                                ; $0C93BC |
  STA $7860                                 ; $0C93BF |
  RTL                                       ; $0C93C2 |

CODE_0C93C3:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C93C3 |
  TAX                                       ; $0C93C5 |
  JSR CODE_0C94DA                           ; $0C93C6 |
  RTL                                       ; $0C93C9 |

  dw $95CB                                  ; $0C93CA |
  dw $94DA                                  ; $0C93CC |

CODE_0C93CE:
  LDA $61CC                                 ; $0C93CE |
  ORA !s_baby_mario_state                   ; $0C93D1 |
  BNE CODE_0C93D7                           ; $0C93D4 |
  RTS                                       ; $0C93D6 |

CODE_0C93D7:
  LDA #$0000                                ; $0C93D7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C93DA |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C93DC |
  BNE CODE_0C93E5                           ; $0C93DE |
  JSR CODE_0C9497                           ; $0C93E0 |
  BRA CODE_0C93ED                           ; $0C93E3 |

CODE_0C93E5:
  LDA #$0002                                ; $0C93E5 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0C93E8 |
  JSR CODE_0C9597                           ; $0C93EA |

CODE_0C93ED:
  PLA                                       ; $0C93ED |
  RTL                                       ; $0C93EE |

  LDX $12                                   ; $0C93EF |
  JSR CODE_0C93FF                           ; $0C93F1 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C93F4 |
  TAX                                       ; $0C93F6 |
  JSR ($93FB,x)                             ; $0C93F7 |
  RTL                                       ; $0C93FA |

  dw $9414                                  ; $0C93FB |
  dw $944A                                  ; $0C93FD |

CODE_0C93FF:
  LDA !s_baby_mario_state                   ; $0C93FF |
  CMP #$4000                                ; $0C9402 |
  BNE CODE_0C93D7                           ; $0C9405 |
  RTS                                       ; $0C9407 |

  LDX $12                                   ; $0C9408 |
  JSR CODE_0C93FF                           ; $0C940A |
  JSR CODE_0C96BE                           ; $0C940D |
  JSR CODE_0C955C                           ; $0C9410 |
  RTL                                       ; $0C9413 |

  LDX $12                                   ; $0C9414 |
  LDA !s_spr_y_speed_lo                     ; $0C9416 |
  BMI CODE_0C9449                           ; $0C9419 |
  STZ !s_spr_x_speed_lo                     ; $0C941B |
  STZ !s_spr_y_speed_lo                     ; $0C941E |
  JSR CODE_0C96BE                           ; $0C9421 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C9424 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C9426 |
  STZ !s_spr_x_speed_lo,x                   ; $0C9428 |
  LDA $10                                   ; $0C942B |
  AND #$001F                                ; $0C942D |
  CLC                                       ; $0C9430 |
  ADC #$0010                                ; $0C9431 |
  STA !s_spr_timer_1,x                      ; $0C9434 |
  LDA #$0006                                ; $0C9437 |
  STA !s_spr_anim_frame,x                   ; $0C943A |
  LDA $10                                   ; $0C943D |
  AND #$0007                                ; $0C943F |
  CLC                                       ; $0C9442 |
  ADC #$0008                                ; $0C9443 |
  STA !s_spr_timer_3,x                      ; $0C9446 |

CODE_0C9449:
  RTS                                       ; $0C9449 |

  LDX $12                                   ; $0C944A |
  JSR CODE_0C96BE                           ; $0C944C |
  LDA !s_spr_timer_1,x                      ; $0C944F |
  BNE CODE_0C9468                           ; $0C9452 |
  LDA #$0006                                ; $0C9454 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C9457 |
  LDA !s_spr_x_player_dir,x                 ; $0C9459 |
  AND #$00FF                                ; $0C945C |
  EOR #$0002                                ; $0C945F |
  STA !s_spr_facing_dir,x                   ; $0C9462 |
  JMP CODE_0C95DB                           ; $0C9465 |

CODE_0C9468:
  LDA !s_spr_timer_3,x                      ; $0C9468 |
  BNE CODE_0C9482                           ; $0C946B |
  LDA !s_spr_facing_dir,x                   ; $0C946D |
  EOR #$0002                                ; $0C9470 |
  STA !s_spr_facing_dir,x                   ; $0C9473 |
  LDA $10                                   ; $0C9476 |
  AND #$0007                                ; $0C9478 |
  CLC                                       ; $0C947B |
  ADC #$0008                                ; $0C947C |
  STA !s_spr_timer_3,x                      ; $0C947F |

CODE_0C9482:
  RTS                                       ; $0C9482 |

  dw $FF80, $0080                           ; $0C9483 |

  LDX $12                                   ; $0C9487 |
  LDA #$9483                                ; $0C9489 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C948C |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C948E |
  BNE CODE_0C950B                           ; $0C9490 |
  LDA !s_spr_timer_1,x                      ; $0C9492 |
  BNE CODE_0C94BB                           ; $0C9495 |

CODE_0C9497:
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C9497 |
  STZ !s_spr_x_speed_lo,x                   ; $0C9499 |
  LDA $10                                   ; $0C949C |
  AND #$003F                                ; $0C949E |
  CLC                                       ; $0C94A1 |
  ADC #$0040                                ; $0C94A2 |
  STA !s_spr_timer_1,x                      ; $0C94A5 |
  LDA #$0006                                ; $0C94A8 |
  STA !s_spr_anim_frame,x                   ; $0C94AB |
  LDA $10                                   ; $0C94AE |
  AND #$001F                                ; $0C94B0 |
  CLC                                       ; $0C94B3 |
  ADC #$0008                                ; $0C94B4 |
  STA !s_spr_timer_3,x                      ; $0C94B7 |
  RTS                                       ; $0C94BA |

CODE_0C94BB:
  LDA !s_spr_timer_3,x                      ; $0C94BB |
  BNE CODE_0C94D1                           ; $0C94BE |
  DEC !s_spr_anim_frame,x                   ; $0C94C0 |
  BPL CODE_0C94D1                           ; $0C94C3 |

CODE_0C94C5:
  LDA #$0005                                ; $0C94C5 |
  STA !s_spr_anim_frame,x                   ; $0C94C8 |
  LDA #$0002                                ; $0C94CB |
  STA !s_spr_timer_3,x                      ; $0C94CE |

CODE_0C94D1:
  RTS                                       ; $0C94D1 |

  dw $FF00, $0100                           ; $0C94D2 |

  dw $FE00, $0200                           ; $0C94D6 |

CODE_0C94DA:
  LDX $12                                   ; $0C94DA |
  LDA #$94D6                                ; $0C94DC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C94DF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C94E1 |
  BNE CODE_0C950B                           ; $0C94E3 |
  JSR CODE_0C969E                           ; $0C94E5 |
  LDA !s_spr_x_hitbox_center,x              ; $0C94E8 |
  SEC                                       ; $0C94EB |
  SBC !s_spr_x_hitbox_center                ; $0C94EC |
  STA $00                                   ; $0C94EF |
  LDA !s_spr_facing_dir,x                   ; $0C94F1 |
  DEC A                                     ; $0C94F4 |
  EOR $00                                   ; $0C94F5 |
  BMI CODE_0C94BB                           ; $0C94F7 |
  LDA !s_spr_facing_dir,x                   ; $0C94F9 |
  EOR #$0002                                ; $0C94FC |
  STA !s_spr_facing_dir,x                   ; $0C94FF |
  TAY                                       ; $0C9502 |
  LDA $94D2,y                               ; $0C9503 |
  STA !s_spr_x_speed_lo,x                   ; $0C9506 |
  BRA CODE_0C94BB                           ; $0C9509 |

CODE_0C950B:
  LDA $7860,x                               ; $0C950B |
  BIT #$0001                                ; $0C950E |
  BNE CODE_0C9530                           ; $0C9511 |
  BIT #$000C                                ; $0C9513 |
  BEQ CODE_0C9521                           ; $0C9516 |
  LDY !s_spr_facing_dir,x                   ; $0C9518 |
  LDA $94D2,y                               ; $0C951B |
  STA !s_spr_x_speed_lo,x                   ; $0C951E |

CODE_0C9521:
  LDA #$0007                                ; $0C9521 |
  LDY !s_spr_y_speed_hi,x                   ; $0C9524 |
  BMI CODE_0C952C                           ; $0C9527 |
  LDA #$0008                                ; $0C9529 |

CODE_0C952C:
  STA !s_spr_anim_frame,x                   ; $0C952C |
  RTS                                       ; $0C952F |

CODE_0C9530:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C9530 |
  CMP #$0001                                ; $0C9532 |
  BNE CODE_0C9545                           ; $0C9535 |
  LDA #$0009                                ; $0C9537 |
  STA !s_spr_anim_frame,x                   ; $0C953A |
  LDA #$0004                                ; $0C953D |
  STA !s_spr_timer_3,x                      ; $0C9540 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0C9543 |

CODE_0C9545:
  LDA !s_spr_timer_3,x                      ; $0C9545 |
  BNE CODE_0C955B                           ; $0C9548 |
  LDY !s_spr_facing_dir,x                   ; $0C954A |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0C954D |
  STA $00                                   ; $0C954F |
  LDA ($00),y                               ; $0C9551 |
  STA !s_spr_x_speed_lo,x                   ; $0C9553 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0C9556 |
  JMP CODE_0C94C5                           ; $0C9558 |

CODE_0C955B:
  RTS                                       ; $0C955B |

CODE_0C955C:
  LDX $12                                   ; $0C955C |
  LDA #$94D6                                ; $0C955E |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C9561 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C9563 |
  BNE CODE_0C950B                           ; $0C9565 |
  LDA $7860,x                               ; $0C9567 |
  BIT #$000C                                ; $0C956A |
  BNE CODE_0C9577                           ; $0C956D |
  BIT #$0001                                ; $0C956F |
  BEQ CODE_0C9580                           ; $0C9572 |
  JMP CODE_0C94BB                           ; $0C9574 |

CODE_0C9577:
  LDY !s_spr_facing_dir,x                   ; $0C9577 |
  LDA $94D6,y                               ; $0C957A |
  STA !s_spr_x_speed_lo,x                   ; $0C957D |

CODE_0C9580:
  JMP CODE_0C95DB                           ; $0C9580 |
  LDX $12                                   ; $0C9583 |
  LDA !s_spr_timer_1,x                      ; $0C9585 |
  BNE CODE_0C95B0                           ; $0C9588 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C958A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C958C |
  LDY !s_spr_facing_dir,x                   ; $0C958E |
  LDA $9483,y                               ; $0C9591 |
  STA !s_spr_x_speed_lo,x                   ; $0C9594 |

CODE_0C9597:
  LDA $10                                   ; $0C9597 |
  AND #$003F                                ; $0C9599 |
  CLC                                       ; $0C959C |
  ADC #$0040                                ; $0C959D |
  STA !s_spr_timer_1,x                      ; $0C95A0 |
  LDA #$0005                                ; $0C95A3 |
  STA !s_spr_anim_frame,x                   ; $0C95A6 |
  LDA #$0002                                ; $0C95A9 |
  STA !s_spr_timer_3,x                      ; $0C95AC |
  RTS                                       ; $0C95AF |

CODE_0C95B0:
  LDA !s_spr_timer_3,x                      ; $0C95B0 |
  BNE CODE_0C95CA                           ; $0C95B3 |
  LDA !s_spr_facing_dir,x                   ; $0C95B5 |
  EOR #$0002                                ; $0C95B8 |
  STA !s_spr_facing_dir,x                   ; $0C95BB |
  LDA $10                                   ; $0C95BE |
  AND #$001F                                ; $0C95C0 |
  CLC                                       ; $0C95C3 |
  ADC #$0008                                ; $0C95C4 |
  STA !s_spr_timer_3,x                      ; $0C95C7 |

CODE_0C95CA:
  RTS                                       ; $0C95CA |

CODE_0C95CB:
  LDA !s_spr_x_hitbox_center,x              ; $0C95CB |
  SEC                                       ; $0C95CE |
  SBC !s_spr_x_hitbox_center                ; $0C95CF |
  AND #$8000                                ; $0C95D2 |
  ASL A                                     ; $0C95D5 |
  ROL A                                     ; $0C95D6 |
  ASL A                                     ; $0C95D7 |
  STA !s_spr_facing_dir,x                   ; $0C95D8 |

CODE_0C95DB:
  LDA #$0001                                ; $0C95DB |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C95DE |
  LDA #$FC00                                ; $0C95E0 |
  STA !s_spr_y_speed_lo,x                   ; $0C95E3 |
  LDA $7860,x                               ; $0C95E6 |
  AND #$FFFE                                ; $0C95E9 |
  STA $7860,x                               ; $0C95EC |
  RTS                                       ; $0C95EF |

  LDA !s_spr_timer_3,x                      ; $0C95F0 |
  BNE CODE_0C960A                           ; $0C95F3 |
  LDA !s_spr_facing_dir,x                   ; $0C95F5 |
  EOR #$0002                                ; $0C95F8 |
  STA !s_spr_facing_dir,x                   ; $0C95FB |
  LDA $10                                   ; $0C95FE |
  AND #$001F                                ; $0C9600 |
  CLC                                       ; $0C9603 |
  ADC #$0008                                ; $0C9604 |
  STA !s_spr_timer_3,x                      ; $0C9607 |

CODE_0C960A:
  RTS                                       ; $0C960A |

  dw $FD00, $0300                           ; $0C960B |

  dw $0180, $0060                           ; $0C960F |

CODE_0C9613:
  LDY !s_spr_collision_id,x                 ; $0C9613 |
  BMI CODE_0C9621                           ; $0C9616 |
  CPX $61B6                                 ; $0C9618 |
  BNE CODE_0C960A                           ; $0C961B |
  STZ $61B6                                 ; $0C961D |
  RTS                                       ; $0C9620 |

CODE_0C9621:
  LDA !s_super_mario_timer                  ; $0C9621 |
  BEQ CODE_0C962B                           ; $0C9624 |
  PLA                                       ; $0C9626 |
  JML $03B25B                               ; $0C9627 |

CODE_0C962B:
  LDA !s_spr_y_player_delta,x               ; $0C962B |
  SEC                                       ; $0C962E |
  SBC !s_player_hitbox_half_height          ; $0C962F |
  SEC                                       ; $0C9632 |
  SBC !s_spr_hitbox_height,x                ; $0C9633 |
  CMP #$FFF8                                ; $0C9636 |
  BCC CODE_0C964C                           ; $0C9639 |
  LDA !s_player_y_speed                     ; $0C963B |
  BMI CODE_0C95CA                           ; $0C963E |
  LDA #$0013                                ; $0C9640 |\ play sound #$0013
  JSL push_sound_queue                      ; $0C9643 |/
  JSL $03B20B                               ; $0C9647 |
  RTS                                       ; $0C964B |

CODE_0C964C:
  LDA !s_player_y_speed                     ; $0C964C |
  BPL CODE_0C965B                           ; $0C964F |
  STZ !s_player_y_speed                     ; $0C9651 |
  STZ !s_player_jump_state                  ; $0C9654 |
  STZ !s_player_flutter_state               ; $0C9657 |
  RTS                                       ; $0C965A |

CODE_0C965B:
  LDA #$0013                                ; $0C965B |\ play sound #$0013
  JSL push_sound_queue                      ; $0C965E |/
  LDY !s_spr_x_player_dir,x                 ; $0C9662 |
  LDA !s_player_tile_collision              ; $0C9665 |
  AND $960F,y                               ; $0C9668 |
  BNE CODE_0C9676                           ; $0C966B |
  LDA $960B,y                               ; $0C966D |
  STA !s_player_x_speed_prev                ; $0C9670 |
  STA !s_player_x_speed                     ; $0C9673 |

CODE_0C9676:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C9676 |
  CMP #$0000                                ; $0C9678 |
  BNE CODE_0C9699                           ; $0C967B |
  LDA !s_spr_x_player_dir,x                 ; $0C967D |
  AND #$00FF                                ; $0C9680 |
  STA !s_spr_facing_dir,x                   ; $0C9683 |
  TAY                                       ; $0C9686 |
  LDA $969A,y                               ; $0C9687 |
  STA !s_spr_x_speed_lo,x                   ; $0C968A |
  LDA #$0010                                ; $0C968D |
  STA !s_spr_x_accel,x                      ; $0C9690 |
  LDA #$0001                                ; $0C9693 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C9696 |

CODE_0C9699:
  RTS                                       ; $0C9699 |

  dw $0100, $FF00                           ; $0C969A |

CODE_0C969E:
  LDY !s_spr_facing_dir,x                   ; $0C969E |
  LDA $7860,x                               ; $0C96A1 |
  BIT #$000C                                ; $0C96A4 |
  BEQ CODE_0C96AE                           ; $0C96A7 |
  LDA $94D2,y                               ; $0C96A9 |
  BRA CODE_0C96B6                           ; $0C96AC |

CODE_0C96AE:
  BIT #$0001                                ; $0C96AE |
  BNE CODE_0C96BD                           ; $0C96B1 |
  LDA $94D6,y                               ; $0C96B3 |

CODE_0C96B6:
  STA !s_spr_x_speed_lo,x                   ; $0C96B6 |
  PLA                                       ; $0C96B9 |
  JMP CODE_0C95DB                           ; $0C96BA |

CODE_0C96BD:
  RTS                                       ; $0C96BD |

CODE_0C96BE:
  LDA !s_spr_x_pixel_pos,x                  ; $0C96BE |
  STA !s_spr_x_pixel_pos                    ; $0C96C1 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C96C4 |
  SEC                                       ; $0C96C7 |
  SBC #$0010                                ; $0C96C8 |
  STA !s_spr_y_pixel_pos                    ; $0C96CB |
  RTS                                       ; $0C96CE |

CODE_0C96CF:
  LDA !s_spr_hitbox_width,x                 ; $0C96CF |
  CLC                                       ; $0C96D2 |
  ADC $7BB6                                 ; $0C96D3 |
  STA $04                                   ; $0C96D6 |
  LDA !s_spr_x_hitbox_center,x              ; $0C96D8 |
  SEC                                       ; $0C96DB |
  SBC !s_spr_x_hitbox_center                ; $0C96DC |
  STA $00                                   ; $0C96DF |
  BPL CODE_0C96E7                           ; $0C96E1 |
  EOR #$FFFF                                ; $0C96E3 |
  INC A                                     ; $0C96E6 |

CODE_0C96E7:
  CMP $04                                   ; $0C96E7 |
  BCS CODE_0C9705                           ; $0C96E9 |
  LDA !s_spr_hitbox_height,x                ; $0C96EB |
  CLC                                       ; $0C96EE |
  ADC $7BB8                                 ; $0C96EF |
  STA $04                                   ; $0C96F2 |
  LDA !s_spr_y_hitbox_center,x              ; $0C96F4 |
  SEC                                       ; $0C96F7 |
  SBC !s_spr_y_hitbox_center                ; $0C96F8 |
  STA $02                                   ; $0C96FB |
  BPL CODE_0C9703                           ; $0C96FD |
  EOR #$FFFF                                ; $0C96FF |
  INC A                                     ; $0C9702 |

CODE_0C9703:
  CMP $04                                   ; $0C9703 |

CODE_0C9705:
  RTS                                       ; $0C9705 |

  dw $FE58, $01A8                           ; $0C9706 |

init_bumpty_tackling:
  LDA !s_spr_facing_dir,x                   ; $0C970A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C970D |
  TAY                                       ; $0C970F |
  LDA $9706,y                               ; $0C9710 |
  STA !s_spr_x_speed_lo,x                   ; $0C9713 |
  LDA #$0008                                ; $0C9716 |
  STA !s_spr_timer_2,x                      ; $0C9719 |
  RTL                                       ; $0C971C |

main_bumpty_tackling:
  JSL $03AF23                               ; $0C971D |
  JSL $0C9926                               ; $0C9721 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C9725 |
  TAX                                       ; $0C9727 |
  JMP ($972B,x)                             ; $0C9728 |

  dw $9737                                  ; $0C972B |
  dw $9797                                  ; $0C972D |
  dw $9845                                  ; $0C972F |
  dw $98BA                                  ; $0C9731 |
  dw $97F5                                  ; $0C9733 |
  dw $98E8                                  ; $0C9735 |

  LDX $12                                   ; $0C9737 |
  JSR CODE_0C990C                           ; $0C9739 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C973C |
  BNE CODE_0C9771                           ; $0C973E |
  LDA !s_spr_timer_1,x                      ; $0C9740 |
  BNE CODE_0C975F                           ; $0C9743 |
  LDA !s_spr_timer_2,x                      ; $0C9745 |
  BEQ CODE_0C9760                           ; $0C9748 |
  LDA #$0002                                ; $0C974A |
  STA !s_spr_timer_1,x                      ; $0C974D |
  LDA !s_spr_anim_frame,x                   ; $0C9750 |
  DEC A                                     ; $0C9753 |
  CMP #$0006                                ; $0C9754 |
  BCC CODE_0C975C                           ; $0C9757 |
  LDA #$0005                                ; $0C9759 |

CODE_0C975C:
  STA !s_spr_anim_frame,x                   ; $0C975C |

CODE_0C975F:
  RTL                                       ; $0C975F |

CODE_0C9760:
  LDA #$0006                                ; $0C9760 |
  STA !s_spr_anim_frame,x                   ; $0C9763 |
  LDA #$0002                                ; $0C9766 |
  STA !s_spr_timer_1,x                      ; $0C9769 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C976C |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C976E |
  RTL                                       ; $0C9770 |

CODE_0C9771:
  LDA $7860,x                               ; $0C9771 |
  BIT #$0001                                ; $0C9774 |
  BNE CODE_0C9788                           ; $0C9777 |
  LDA #$0007                                ; $0C9779 |
  LDY !s_spr_y_speed_hi,x                   ; $0C977C |
  BMI CODE_0C9784                           ; $0C977F |
  LDA #$0008                                ; $0C9781 |

CODE_0C9784:
  STA !s_spr_anim_frame,x                   ; $0C9784 |
  RTL                                       ; $0C9787 |

CODE_0C9788:
  LDA #$0009                                ; $0C9788 |
  STA !s_spr_anim_frame,x                   ; $0C978B |
  LDA #$0002                                ; $0C978E |
  STA !s_spr_timer_1,x                      ; $0C9791 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0C9794 |
  RTL                                       ; $0C9796 |

  LDX $12                                   ; $0C9797 |
  JSR CODE_0C990C                           ; $0C9799 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C979C |
  BNE CODE_0C9771                           ; $0C979E |
  LDA !s_spr_timer_1,x                      ; $0C97A0 |
  BNE CODE_0C97B5                           ; $0C97A3 |
  LDA !s_spr_anim_frame,x                   ; $0C97A5 |
  CMP #$0006                                ; $0C97A8 |
  BNE CODE_0C97B6                           ; $0C97AB |
  LDA #$FE00                                ; $0C97AD |
  STA !s_spr_y_speed_lo,x                   ; $0C97B0 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C97B3 |

CODE_0C97B5:
  RTL                                       ; $0C97B5 |

CODE_0C97B6:
  LDA #$0006                                ; $0C97B6 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C97B9 |
  TAY                                       ; $0C97BB |
  LDA $9836,y                               ; $0C97BC |
  AND #$00FF                                ; $0C97BF |
  STA !s_spr_anim_frame,x                   ; $0C97C2 |
  LDA !s_spr_x_speed_lo,x                   ; $0C97C5 |
  BPL CODE_0C97CE                           ; $0C97C8 |
  EOR #$FFFF                                ; $0C97CA |
  INC A                                     ; $0C97CD |

CODE_0C97CE:
  LSR A                                     ; $0C97CE |
  LSR A                                     ; $0C97CF |
  AND #$0007                                ; $0C97D0 |
  TAY                                       ; $0C97D3 |
  LDA $983D,y                               ; $0C97D4 |
  AND #$00FF                                ; $0C97D7 |
  STA !s_spr_timer_1,x                      ; $0C97DA |
  LDA #$0004                                ; $0C97DD |
  STA !s_spr_x_accel,x                      ; $0C97E0 |
  LDA !s_spr_bitwise_settings_3,x           ; $0C97E3 |
  AND #$FF3F                                ; $0C97E6 |
  ORA #$0080                                ; $0C97E9 |
  STA !s_spr_bitwise_settings_3,x           ; $0C97EC |
  LDA #$0004                                ; $0C97EF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C97F2 |
  RTL                                       ; $0C97F4 |

  LDX $12                                   ; $0C97F5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0C97F7 |
  BEQ CODE_0C97FE                           ; $0C97F9 |
  JMP CODE_0C9771                           ; $0C97FB |

CODE_0C97FE:
  LDA !s_spr_timer_1,x                      ; $0C97FE |
  BNE CODE_0C9818                           ; $0C9801 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0C9803 |
  BMI CODE_0C9819                           ; $0C9805 |
  LDA #$0004                                ; $0C9807 |
  STA !s_spr_timer_1,x                      ; $0C980A |
  LDA !s_spr_facing_dir,x                   ; $0C980D |
  EOR #$0002                                ; $0C9810 |
  STA !s_spr_facing_dir,x                   ; $0C9813 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C9816 |

CODE_0C9818:
  RTL                                       ; $0C9818 |

CODE_0C9819:
  LDA !s_spr_x_player_dir,x                 ; $0C9819 |
  AND #$00FF                                ; $0C981C |
  STA !s_spr_facing_dir,x                   ; $0C981F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C9822 |
  TAY                                       ; $0C9824 |
  LDA $9706,y                               ; $0C9825 |
  STA !s_spr_x_speed_lo,x                   ; $0C9828 |
  LDA #$0008                                ; $0C982B |
  STA !s_spr_timer_2,x                      ; $0C982E |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0C9831 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C9833 |
  RTL                                       ; $0C9835 |

  db $0D, $0A, $0B, $0C, $0C, $0B, $0A      ; $0C9836 |

  db $0B, $0A, $09, $08, $07, $06, $05, $04 ; $0C983D |

  LDX $12                                   ; $0C9845 |
  LDA !s_spr_x_speed_lo,x                   ; $0C9847 |
  BEQ CODE_0C9897                           ; $0C984A |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C984C |
  DEC A                                     ; $0C984E |
  EOR !s_spr_x_speed_lo,x                   ; $0C984F |
  BMI CODE_0C9897                           ; $0C9852 |
  LDA !s_spr_timer_1,x                      ; $0C9854 |
  BNE CODE_0C9896                           ; $0C9857 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0C9859 |
  BPL CODE_0C9862                           ; $0C985B |
  LDA #$0006                                ; $0C985D |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C9860 |

CODE_0C9862:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0C9862 |
  LDA $9836,y                               ; $0C9864 |
  AND #$00FF                                ; $0C9867 |
  STA !s_spr_anim_frame,x                   ; $0C986A |
  CPY #$06                                  ; $0C986D |
  BEQ CODE_0C9875                           ; $0C986F |
  CPY #$03                                  ; $0C9871 |
  BNE CODE_0C987E                           ; $0C9873 |

CODE_0C9875:
  LDA !s_spr_facing_dir,x                   ; $0C9875 |
  EOR #$0002                                ; $0C9878 |
  STA !s_spr_facing_dir,x                   ; $0C987B |

CODE_0C987E:
  LDA !s_spr_x_speed_lo,x                   ; $0C987E |
  BPL CODE_0C9887                           ; $0C9881 |
  EOR #$FFFF                                ; $0C9883 |
  INC A                                     ; $0C9886 |

CODE_0C9887:
  LSR A                                     ; $0C9887 |
  LSR A                                     ; $0C9888 |
  AND #$0007                                ; $0C9889 |
  TAY                                       ; $0C988C |
  LDA $983D,y                               ; $0C988D |
  AND #$00FF                                ; $0C9890 |
  STA !s_spr_timer_1,x                      ; $0C9893 |

CODE_0C9896:
  RTL                                       ; $0C9896 |

CODE_0C9897:
  LDA !s_spr_bitwise_settings_3,x           ; $0C9897 |
  AND #$FF3F                                ; $0C989A |
  ORA #$0040                                ; $0C989D |
  STA !s_spr_bitwise_settings_3,x           ; $0C98A0 |
  STZ !s_spr_x_speed_lo,x                   ; $0C98A3 |
  STZ !s_spr_x_accel,x                      ; $0C98A6 |
  LDA #$0040                                ; $0C98A9 |
  STA !s_spr_timer_1,x                      ; $0C98AC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C98AF |
  STA !s_spr_facing_dir,x                   ; $0C98B1 |
  LDA #$0006                                ; $0C98B4 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C98B7 |
  RTL                                       ; $0C98B9 |

  LDX $12                                   ; $0C98BA |
  LDA !s_spr_timer_1,x                      ; $0C98BC |
  BNE CODE_0C98D5                           ; $0C98BF |
  LDA !s_spr_anim_frame,x                   ; $0C98C1 |
  CMP #$0006                                ; $0C98C4 |
  BEQ CODE_0C98D6                           ; $0C98C7 |
  LDA #$0006                                ; $0C98C9 |
  STA !s_spr_anim_frame,x                   ; $0C98CC |
  LDA #$0008                                ; $0C98CF |
  STA !s_spr_timer_1,x                      ; $0C98D2 |

CODE_0C98D5:
  RTL                                       ; $0C98D5 |

CODE_0C98D6:
  LDA #$FE00                                ; $0C98D6 |
  STA !s_spr_y_speed_lo,x                   ; $0C98D9 |
  LDA #$0003                                ; $0C98DC |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0C98DF |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0C98E1 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C98E3 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C98E5 |
  RTL                                       ; $0C98E7 |

  LDX $12                                   ; $0C98E8 |
  LDY #$00                                  ; $0C98EA |
  LDA $7860,x                               ; $0C98EC |
  BIT #$0001                                ; $0C98EF |
  BEQ CODE_0C98F6                           ; $0C98F2 |
  LDY #$10                                  ; $0C98F4 |

CODE_0C98F6:
  TYA                                       ; $0C98F6 |
  STA !s_spr_x_accel,x                      ; $0C98F7 |
  LDA !s_spr_x_speed_lo,x                   ; $0C98FA |
  BEQ CODE_0C9908                           ; $0C98FD |
  LDA !s_spr_facing_dir,x                   ; $0C98FF |
  DEC A                                     ; $0C9902 |
  EOR !s_spr_x_speed_lo,x                   ; $0C9903 |
  BMI CODE_0C990B                           ; $0C9906 |

CODE_0C9908:
  JMP CODE_0C9897                           ; $0C9908 |

CODE_0C990B:
  RTL                                       ; $0C990B |

CODE_0C990C:
  LDA $7860,x                               ; $0C990C |
  BIT #$000C                                ; $0C990F |
  BEQ CODE_0C9919                           ; $0C9912 |
  LDA !s_spr_facing_dir,x                   ; $0C9914 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C9917 |

CODE_0C9919:
  RTS                                       ; $0C9919 |

  dw $FD00, $0300                           ; $0C991A |

  dw $0180, $0060                           ; $0C991E |

  dw $0100, $FF00                           ; $0C9922 |

  LDY !s_spr_collision_id,x                 ; $0C9926 |
  BMI CODE_0C9935                           ; $0C9929 |
  CPX $61B6                                 ; $0C992B |
  BNE CODE_0C9960                           ; $0C992E |
  STZ $61B6                                 ; $0C9930 |
  BRA CODE_0C9960                           ; $0C9933 |

CODE_0C9935:
  LDA !s_super_mario_timer                  ; $0C9935 |
  BEQ CODE_0C9940                           ; $0C9938 |
  PLY                                       ; $0C993A |
  PLA                                       ; $0C993B |
  JML $03B25B                               ; $0C993C |

CODE_0C9940:
  LDA !s_spr_y_player_delta,x               ; $0C9940 |
  SEC                                       ; $0C9943 |
  SBC !s_player_hitbox_half_height          ; $0C9944 |
  SEC                                       ; $0C9947 |
  SBC !s_spr_hitbox_height,x                ; $0C9948 |
  CMP #$FFF8                                ; $0C994B |
  BCC CODE_0C9961                           ; $0C994E |
  LDA !s_player_y_speed                     ; $0C9950 |
  BMI CODE_0C9960                           ; $0C9953 |
  LDA #$0013                                ; $0C9955 |\ play sound #$0013
  JSL push_sound_queue                      ; $0C9958 |/
  JSL $03B20B                               ; $0C995C |

CODE_0C9960:
  RTL                                       ; $0C9960 |

CODE_0C9961:
  LDA !s_player_y_speed                     ; $0C9961 |
  BPL CODE_0C9970                           ; $0C9964 |
  STZ !s_player_y_speed                     ; $0C9966 |
  STZ !s_player_jump_state                  ; $0C9969 |
  STZ !s_player_flutter_state               ; $0C996C |
  RTL                                       ; $0C996F |

CODE_0C9970:
  LDA #$0013                                ; $0C9970 |\ play sound #$0013
  JSL push_sound_queue                      ; $0C9973 |/
  LDY !s_spr_x_player_dir,x                 ; $0C9977 |
  LDA !s_player_tile_collision              ; $0C997A |
  AND $991E,y                               ; $0C997D |
  BNE CODE_0C998B                           ; $0C9980 |
  LDA $991A,y                               ; $0C9982 |
  STA !s_player_x_speed_prev                ; $0C9985 |
  STA !s_player_x_speed                     ; $0C9988 |

CODE_0C998B:
  LDA !s_spr_x_player_dir,x                 ; $0C998B |
  AND #$00FF                                ; $0C998E |
  STA !s_spr_facing_dir,x                   ; $0C9991 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C9994 |
  TAY                                       ; $0C9996 |
  LDA $9922,y                               ; $0C9997 |
  STA !s_spr_x_speed_lo,x                   ; $0C999A |
  LDA #$000A                                ; $0C999D |
  STA !s_spr_anim_frame,x                   ; $0C99A0 |
  LDA #$000A                                ; $0C99A3 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C99A6 |
  RTL                                       ; $0C99A8 |

  dw $FFE8, $0018                           ; $0C99A9 |

  dw $0800, $F800                           ; $0C99AD |

  dw $FF80, $0080                           ; $0C99B1 |

init_bumpty_flying:
  LDA !s_spr_y_pixel_pos,x                  ; $0C99B5 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C99B8 |
  SEC                                       ; $0C99BB |
  SBC #$0008                                ; $0C99BC |
  STA !s_spr_y_pixel_pos,x                  ; $0C99BF |
  LDA $99AD                                 ; $0C99C2 |
  STA !s_spr_y_accel_ceiling,x              ; $0C99C5 |
  LDA #$0008                                ; $0C99C8 |
  STA !s_spr_y_accel,x                      ; $0C99CB |
  LDA !s_spr_x_pixel_pos,x                  ; $0C99CE |
  BIT #$0010                                ; $0C99D1 |
  BNE CODE_0C99FB                           ; $0C99D4 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0C99D6 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0C99D9 |
  LDY !s_spr_facing_dir,x                   ; $0C99DB |
  CLC                                       ; $0C99DE |
  ADC $99A9,y                               ; $0C99DF |
  STA !s_spr_x_pixel_pos,x                  ; $0C99E2 |
  LDA $99AD,y                               ; $0C99E5 |
  STA !s_spr_x_accel_ceiling,x              ; $0C99E8 |
  LDA #$0002                                ; $0C99EB |
  STA !s_spr_x_accel,x                      ; $0C99EE |
  LDA !s_spr_facing_dir,x                   ; $0C99F1 |
  EOR #$0002                                ; $0C99F4 |
  STA !s_spr_facing_dir,x                   ; $0C99F7 |
  RTL                                       ; $0C99FA |

CODE_0C99FB:
  LDA #$0002                                ; $0C99FB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C99FE |
  LDY !s_spr_facing_dir,x                   ; $0C9A00 |
  LDA $99B1,y                               ; $0C9A03 |
  STA !s_spr_x_speed_lo,x                   ; $0C9A06 |
  LDA !s_spr_bitwise_settings_3,x           ; $0C9A09 |
  ORA #$0001                                ; $0C9A0C |
  STA !s_spr_bitwise_settings_3,x           ; $0C9A0F |
  RTL                                       ; $0C9A12 |

main_bumpty_flying:
  LDA !s_spr_state,x                        ; $0C9A13 |
  CMP #$0008                                ; $0C9A16 |
  BNE CODE_0C9A23                           ; $0C9A19 |
  LDA #$0184                                ; $0C9A1B |
  TXY                                       ; $0C9A1E |
  JML $03A377                               ; $0C9A1F |

CODE_0C9A23:
  JSL $03AF23                               ; $0C9A23 |
  JSL $0C9B02                               ; $0C9A27 |
  LDY #$00                                  ; $0C9A2B |
  LDA !s_spr_y_pixel_pos,x                  ; $0C9A2D |
  CMP !s_spr_gsu_morph_1_lo,x               ; $0C9A30 |
  BMI CODE_0C9A37                           ; $0C9A33 |
  INY                                       ; $0C9A35 |
  INY                                       ; $0C9A36 |

CODE_0C9A37:
  LDA $99AD,y                               ; $0C9A37 |
  STA !s_spr_y_accel_ceiling,x              ; $0C9A3A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0C9A3D |
  TAX                                       ; $0C9A3F |
  JMP ($9A43,x)                             ; $0C9A40 |

  dw $9A47                                  ; $0C9A43 |
  dw $9A97                                  ; $0C9A45 |

  LDX $12                                   ; $0C9A47 |
  LDY #$00                                  ; $0C9A49 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C9A4B |
  CMP !s_spr_gsu_morph_2_lo,x               ; $0C9A4E |
  BMI CODE_0C9A55                           ; $0C9A51 |
  INY                                       ; $0C9A53 |
  INY                                       ; $0C9A54 |

CODE_0C9A55:
  LDA $99AD,y                               ; $0C9A55 |
  STA !s_spr_x_accel_ceiling,x              ; $0C9A58 |
  LDA !s_spr_x_speed_lo,x                   ; $0C9A5B |
  CLC                                       ; $0C9A5E |
  ADC #$0008                                ; $0C9A5F |
  CMP #$0010                                ; $0C9A62 |
  BCS CODE_0C9A81                           ; $0C9A65 |
  LDA #$0000                                ; $0C9A67 |
  STA !s_spr_anim_frame,x                   ; $0C9A6A |
  LDA !s_spr_facing_dir,x                   ; $0C9A6D |
  DEC A                                     ; $0C9A70 |
  EOR !s_spr_x_speed_lo,x                   ; $0C9A71 |
  BPL CODE_0C9A7F                           ; $0C9A74 |
  LDA !s_spr_facing_dir,x                   ; $0C9A76 |
  EOR #$0002                                ; $0C9A79 |
  STA !s_spr_facing_dir,x                   ; $0C9A7C |

CODE_0C9A7F:
  BRA CODE_0C9A96                           ; $0C9A7F |

CODE_0C9A81:
  LDY #$00                                  ; $0C9A81 |
  LDA !s_spr_facing_dir,x                   ; $0C9A83 |
  DEC A                                     ; $0C9A86 |
  EOR !s_spr_x_accel_ceiling,x              ; $0C9A87 |
  BPL CODE_0C9A8E                           ; $0C9A8A |
  INY                                       ; $0C9A8C |
  INY                                       ; $0C9A8D |

CODE_0C9A8E:
  LDA $9ADF,y                               ; $0C9A8E |
  STA $00                                   ; $0C9A91 |
  JSR CODE_0C9AE7                           ; $0C9A93 |

CODE_0C9A96:
  RTL                                       ; $0C9A96 |

  LDX $12                                   ; $0C9A97 |
  LDA !s_spr_x_speed_lo,x                   ; $0C9A99 |
  BEQ CODE_0C9AA7                           ; $0C9A9C |
  LDA $9ADF                                 ; $0C9A9E |
  STA $00                                   ; $0C9AA1 |
  JSR CODE_0C9AE7                           ; $0C9AA3 |
  RTL                                       ; $0C9AA6 |

CODE_0C9AA7:
  LDA !s_spr_timer_1,x                      ; $0C9AA7 |
  BNE CODE_0C9ADE                           ; $0C9AAA |
  SEP #$20                                  ; $0C9AAC |
  LDA #$00                                  ; $0C9AAE |
  STA !s_spr_anim_frame,x                   ; $0C9AB0 |
  LDA #$02                                  ; $0C9AB3 |
  STA !s_spr_timer_1,x                      ; $0C9AB5 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0C9AB8 |
  REP #$20                                  ; $0C9ABA |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0C9ABC |
  CPY #$02                                  ; $0C9ABE |
  BNE CODE_0C9ACB                           ; $0C9AC0 |
  LDA !s_spr_facing_dir,x                   ; $0C9AC2 |
  EOR #$0002                                ; $0C9AC5 |
  STA !s_spr_facing_dir,x                   ; $0C9AC8 |

CODE_0C9ACB:
  CPY #$03                                  ; $0C9ACB |
  BCC CODE_0C9ADE                           ; $0C9ACD |
  SEP #$20                                  ; $0C9ACF |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0C9AD1 |
  REP #$20                                  ; $0C9AD3 |
  LDY !s_spr_facing_dir,x                   ; $0C9AD5 |
  LDA $99B1,y                               ; $0C9AD8 |
  STA !s_spr_x_speed_lo,x                   ; $0C9ADB |

CODE_0C9ADE:
  RTL                                       ; $0C9ADE |

  dw $9AE3                                  ; $0C9ADF |
  dw $9AE5                                  ; $0C9AE1 |

  db $01, $02                               ; $0C9AE3 |

  db $03, $04                               ; $0C9AE5 |

CODE_0C9AE7:
  LDA !s_spr_timer_1,x                      ; $0C9AE7 |
  BNE CODE_0C9B01                           ; $0C9AEA |
  SEP #$20                                  ; $0C9AEC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0C9AEE |
  EOR #$01                                  ; $0C9AF0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0C9AF2 |
  TAY                                       ; $0C9AF4 |
  LDA ($00),y                               ; $0C9AF5 |
  STA !s_spr_anim_frame,x                   ; $0C9AF7 |
  LDA #$03                                  ; $0C9AFA |
  STA !s_spr_timer_1,x                      ; $0C9AFC |
  REP #$20                                  ; $0C9AFF |

CODE_0C9B01:
  RTS                                       ; $0C9B01 |

  LDY !s_spr_collision_id,x                 ; $0C9B02 |
  BMI CODE_0C9B11                           ; $0C9B05 |
  CPX $61B6                                 ; $0C9B07 |
  BNE CODE_0C9B3C                           ; $0C9B0A |
  STZ $61B6                                 ; $0C9B0C |
  BRA CODE_0C9B3C                           ; $0C9B0F |

CODE_0C9B11:
  LDA !s_super_mario_timer                  ; $0C9B11 |
  BEQ CODE_0C9B1C                           ; $0C9B14 |
  PLY                                       ; $0C9B16 |
  PLA                                       ; $0C9B17 |
  JML $03B25B                               ; $0C9B18 |

CODE_0C9B1C:
  LDA !s_spr_y_player_delta,x               ; $0C9B1C |
  SEC                                       ; $0C9B1F |
  SBC !s_player_hitbox_half_height          ; $0C9B20 |
  SEC                                       ; $0C9B23 |
  SBC !s_spr_hitbox_height,x                ; $0C9B24 |
  CMP #$FFF8                                ; $0C9B27 |
  BCC CODE_0C9B3D                           ; $0C9B2A |
  LDA !s_player_y_speed                     ; $0C9B2C |
  BMI CODE_0C9B3C                           ; $0C9B2F |
  LDA #$0013                                ; $0C9B31 |\ play sound #$0013
  JSL push_sound_queue                      ; $0C9B34 |/
  JSL $03B20B                               ; $0C9B38 |

CODE_0C9B3C:
  RTL                                       ; $0C9B3C |

CODE_0C9B3D:
  LDA !s_player_y_speed                     ; $0C9B3D |
  BPL CODE_0C9B4C                           ; $0C9B40 |
  STZ !s_player_y_speed                     ; $0C9B42 |
  STZ !s_player_jump_state                  ; $0C9B45 |
  STZ !s_player_flutter_state               ; $0C9B48 |
  RTL                                       ; $0C9B4B |

CODE_0C9B4C:
  LDA #$0013                                ; $0C9B4C |\ play sound #$0013
  JSL push_sound_queue                      ; $0C9B4F |/
  LDY !s_spr_x_player_dir,x                 ; $0C9B53 |
  LDA !s_player_tile_collision              ; $0C9B56 |
  AND $991E,y                               ; $0C9B59 |
  BNE CODE_0C9B67                           ; $0C9B5C |
  LDA $991A,y                               ; $0C9B5E |
  STA !s_player_x_speed_prev                ; $0C9B61 |
  STA !s_player_x_speed                     ; $0C9B64 |

CODE_0C9B67:
  RTL                                       ; $0C9B67 |

  dw $FF00, $0100                           ; $0C9B68 |

init_skeleton_goonie:
  LDY !s_spr_facing_dir,x                   ; $0C9B6C |
  LDA $9B68,y                               ; $0C9B6F |
  STA !s_spr_x_speed_lo,x                   ; $0C9B72 |
  LDA #$0004                                ; $0C9B75 |
  STA !s_spr_timer_1,x                      ; $0C9B78 |
  LDA #$0008                                ; $0C9B7B |
  STA !s_spr_anim_frame,x                   ; $0C9B7E |
  ASL A                                     ; $0C9B81 |
  TAY                                       ; $0C9B82 |
  LDA $9BBC,y                               ; $0C9B83 |
  STA !s_spr_y_hitbox_center,x              ; $0C9B86 |
  RTL                                       ; $0C9B89 |

main_skeleton_goonie:
  LDA !s_spr_state,x                        ; $0C9B8A |
  CMP #$0008                                ; $0C9B8D |
  BNE CODE_0C9BA6                           ; $0C9B90 |
  LDA #$0216                                ; $0C9B92 |
  STA $06                                   ; $0C9B95 |
  LDA #$0000                                ; $0C9B97 |
  JSL $0C9C8A                               ; $0C9B9A |
  LDA #$019E                                ; $0C9B9E |
  TXY                                       ; $0C9BA1 |
  JML $03A377                               ; $0C9BA2 |

CODE_0C9BA6:
  JSL $03AF23                               ; $0C9BA6 |
  JSL $07E336                               ; $0C9BAA |
  JSL $03A5B7                               ; $0C9BAE |
  JSR CODE_0C9C23                           ; $0C9BB2 |
  JSR CODE_0C9BF2                           ; $0C9BB5 |
  JSR CODE_0C9BCE                           ; $0C9BB8 |
  RTL                                       ; $0C9BBB |

  dw $0008, $0007, $0007, $0006             ; $0C9BBC |
  dw $0006, $0007, $0007, $0008             ; $0C9BC4 |
  dw $0008                                  ; $0C9BCC |

CODE_0C9BCE:
  LDA !s_spr_timer_1,x                      ; $0C9BCE |
  BNE CODE_0C9BF1                           ; $0C9BD1 |
  SEP #$20                                  ; $0C9BD3 |
  DEC !s_spr_anim_frame,x                   ; $0C9BD5 |
  BPL CODE_0C9BDF                           ; $0C9BD8 |
  LDA #$08                                  ; $0C9BDA |
  STA !s_spr_anim_frame,x                   ; $0C9BDC |

CODE_0C9BDF:
  LDA #$04                                  ; $0C9BDF |
  STA !s_spr_timer_1,x                      ; $0C9BE1 |
  LDA !s_spr_anim_frame,x                   ; $0C9BE4 |
  ASL A                                     ; $0C9BE7 |
  TAY                                       ; $0C9BE8 |
  REP #$20                                  ; $0C9BE9 |
  LDA $9BBC,y                               ; $0C9BEB |
  STA !s_spr_y_hitbox_center,x              ; $0C9BEE |

CODE_0C9BF1:
  RTS                                       ; $0C9BF1 |

CODE_0C9BF2:
  LDA !s_spr_timer_2,x                      ; $0C9BF2 |
  BNE CODE_0C9C22                           ; $0C9BF5 |
  LDA #$0215                                ; $0C9BF7 |
  JSL spawn_ambient_sprite                  ; $0C9BFA |
  LDA !s_spr_x_pixel_pos,x                  ; $0C9BFE |
  STA $70A2,y                               ; $0C9C01 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C9C04 |
  STA $7142,y                               ; $0C9C07 |
  LDA #$FFFF                                ; $0C9C0A |
  STA $7782,y                               ; $0C9C0D |
  LDA #$00C0                                ; $0C9C10 |
  STA $7E8E,y                               ; $0C9C13 |
  LDA $10                                   ; $0C9C16 |
  AND #$003F                                ; $0C9C18 |
  CLC                                       ; $0C9C1B |
  ADC #$0040                                ; $0C9C1C |
  STA !s_spr_timer_2,x                      ; $0C9C1F |

CODE_0C9C22:
  RTS                                       ; $0C9C22 |

CODE_0C9C23:
  LDY !s_spr_collision_id,x                 ; $0C9C23 |
  DEY                                       ; $0C9C26 |
  BMI CODE_0C9C47                           ; $0C9C27 |
  BEQ CODE_0C9C47                           ; $0C9C29 |
  LDA !s_spr_state,y                        ; $0C9C2B |
  CMP #$0010                                ; $0C9C2E |
  BNE CODE_0C9C47                           ; $0C9C31 |
  LDA !s_spr_collision_state,y              ; $0C9C33 |
  BEQ CODE_0C9C47                           ; $0C9C36 |
  TYX                                       ; $0C9C38 |
  JSL $03B25B                               ; $0C9C39 |
  LDX $12                                   ; $0C9C3D |
  LDA #$000E                                ; $0C9C3F |
  STA !s_spr_state,x                        ; $0C9C42 |
  PLA                                       ; $0C9C45 |
  RTL                                       ; $0C9C46 |

CODE_0C9C47:
  RTS                                       ; $0C9C47 |

  JSL $0C9C7B                               ; $0C9C48 |
  LDA #$019E                                ; $0C9C4C |
  TXY                                       ; $0C9C4F |
  JSL $03A377                               ; $0C9C50 |
  LDA #$0010                                ; $0C9C54 |
  STA !s_spr_state,x                        ; $0C9C57 |
  RTL                                       ; $0C9C5A |

  dw $FE80, $FF00, $FF80, $0000             ; $0C9C5B |
  dw $0080, $0100, $0180, $0200             ; $0C9C63 |

  dw $FC00, $FC80, $FD00, $FD80             ; $0C9C6B |
  dw $FE00, $FE80, $FF00, $FF80             ; $0C9C73 |

  LDA #$0216                                ; $0C9C7B |
  STA $06                                   ; $0C9C7E |
  LDA #$0007                                ; $0C9C80 |\ play sound #$0007
  JSL push_sound_queue                      ; $0C9C83 |/
  LDA #$0004                                ; $0C9C87 |
  STA $00                                   ; $0C9C8A |

CODE_0C9C8C:
  LDA $10                                   ; $0C9C8C |
  AND #$0007                                ; $0C9C8E |
  ASL A                                     ; $0C9C91 |
  TAY                                       ; $0C9C92 |
  LDA $9C5B,y                               ; $0C9C93 |
  STA $02                                   ; $0C9C96 |
  LDA $10                                   ; $0C9C98 |
  AND #$0038                                ; $0C9C9A |
  LSR A                                     ; $0C9C9D |
  LSR A                                     ; $0C9C9E |
  TAY                                       ; $0C9C9F |
  LDA $9C6B,y                               ; $0C9CA0 |
  STA $04                                   ; $0C9CA3 |
  LDA $06                                   ; $0C9CA5 |
  JSL spawn_ambient_sprite                  ; $0C9CA7 |
  LDA #$0040                                ; $0C9CAB |
  STA $7782,y                               ; $0C9CAE |
  LDA #$0002                                ; $0C9CB1 |
  STA $7E8E,y                               ; $0C9CB4 |
  LDA #$0003                                ; $0C9CB7 |
  STA $73C2,y                               ; $0C9CBA |
  STA $7E4C,y                               ; $0C9CBD |
  LDA !s_spr_x_hitbox_center,x              ; $0C9CC0 |
  SEC                                       ; $0C9CC3 |
  SBC #$0004                                ; $0C9CC4 |
  STA $70A2,y                               ; $0C9CC7 |
  LDA !s_spr_y_hitbox_center,x              ; $0C9CCA |
  SEC                                       ; $0C9CCD |
  SBC #$0004                                ; $0C9CCE |
  STA $7142,y                               ; $0C9CD1 |
  LDA #$0020                                ; $0C9CD4 |
  STA $7502,y                               ; $0C9CD7 |
  LDA #$0200                                ; $0C9CDA |
  STA $75A2,y                               ; $0C9CDD |
  LDA $02                                   ; $0C9CE0 |
  STA $71E0,y                               ; $0C9CE2 |
  LDA $04                                   ; $0C9CE5 |
  STA $71E2,y                               ; $0C9CE7 |
  JSL random_number_gen                     ; $0C9CEA |
  DEC $00                                   ; $0C9CEE |
  BPL CODE_0C9C8C                           ; $0C9CF0 |
  RTL                                       ; $0C9CF2 |

init_skeleton_goonie_flightless:
  LDA #$0002                                ; $0C9CF3 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0C9CF6 |
  RTL                                       ; $0C9CF8 |

  dw $FE00, $0200                           ; $0C9CF9 |

main_skeleton_goonie_flightless:
  JSL $03AF23                               ; $0C9CFD |
  JSL $03A5B7                               ; $0C9D01 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0C9D05 |
  TYX                                       ; $0C9D07 |
  JMP ($9D0B,x)                             ; $0C9D08 |

  dw $9D11                                  ; $0C9D0B |
  dw $9D26                                  ; $0C9D0D |
  dw $9D3B                                  ; $0C9D0F |

  LDX $12                                   ; $0C9D11 |
  LDA $7860,x                               ; $0C9D13 |
  BIT #$0001                                ; $0C9D16 |
  BEQ CODE_0C9D25                           ; $0C9D19 |
  LDA #$0040                                ; $0C9D1B |
  STA !s_spr_timer_1,x                      ; $0C9D1E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9D21 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9D23 |

CODE_0C9D25:
  RTL                                       ; $0C9D25 |

  LDX $12                                   ; $0C9D26 |
  LDA !s_spr_timer_1,x                      ; $0C9D28 |
  BNE CODE_0C9D3A                           ; $0C9D2B |
  LDY !s_spr_facing_dir,x                   ; $0C9D2D |
  LDA $9CF9,y                               ; $0C9D30 |
  STA !s_spr_x_speed_lo,x                   ; $0C9D33 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9D36 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0C9D38 |

CODE_0C9D3A:
  RTL                                       ; $0C9D3A |

  LDX $12                                   ; $0C9D3B |
  LDA !s_spr_timer_1,x                      ; $0C9D3D |
  BNE CODE_0C9D55                           ; $0C9D40 |
  SEP #$20                                  ; $0C9D42 |
  DEC !s_spr_anim_frame,x                   ; $0C9D44 |
  BPL CODE_0C9D4E                           ; $0C9D47 |
  LDA #$02                                  ; $0C9D49 |
  STA !s_spr_anim_frame,x                   ; $0C9D4B |

CODE_0C9D4E:
  LDA #$02                                  ; $0C9D4E |
  STA !s_spr_timer_1,x                      ; $0C9D50 |
  REP #$20                                  ; $0C9D53 |

CODE_0C9D55:
  RTL                                       ; $0C9D55 |

  dw $0001, $FFFF                           ; $0C9D56 |

  dw $0010, $000F, $000E, $000D             ; $0C9D5A |
  dw $000D, $000E, $000F, $0010             ; $0C9D62 |
  dw $0011                                  ; $0C9D6A |

init_skeleton_goonie_with_bomb:
  LDY !s_spr_facing_dir,x                   ; $0C9D6C |
  LDA $9B68,y                               ; $0C9D6F |
  STA !s_spr_x_speed_lo,x                   ; $0C9D72 |
  LDA #$0004                                ; $0C9D75 |
  STA !s_spr_timer_1,x                      ; $0C9D78 |
  LDA #$0008                                ; $0C9D7B |
  STA !s_spr_anim_frame,x                   ; $0C9D7E |
  ASL A                                     ; $0C9D81 |
  TAY                                       ; $0C9D82 |
  LDA $9BBC,y                               ; $0C9D83 |
  STA !s_spr_y_hitbox_center,x              ; $0C9D86 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C9D89 |
  CLC                                       ; $0C9D8C |
  ADC $9D5A,y                               ; $0C9D8D |
  STA $02                                   ; $0C9D90 |
  LDY !s_spr_facing_dir,x                   ; $0C9D92 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C9D95 |
  CLC                                       ; $0C9D98 |
  ADC $9D56,y                               ; $0C9D99 |
  STA $00                                   ; $0C9D9C |
  LDA #$0060                                ; $0C9D9E |
  JSL spawn_sprite_active                   ; $0C9DA1 |
  BCC CODE_0C9DEC                           ; $0C9DA5 |
  TXA                                       ; $0C9DA7 |
  STA !s_spr_wildcard_4_lo,y                ; $0C9DA8 |
  LDA $00                                   ; $0C9DAB |
  STA !s_spr_x_pixel_pos,y                  ; $0C9DAD |
  LDA $02                                   ; $0C9DB0 |
  STA !s_spr_y_pixel_pos,y                  ; $0C9DB2 |
  LDA #$0001                                ; $0C9DB5 |
  STA !s_spr_wildcard_6_lo,y                ; $0C9DB8 |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9DBB |
  AND #$FFE0                                ; $0C9DBE |
  STA !s_spr_bitwise_settings_3,y           ; $0C9DC1 |
  LDA !s_spr_oam_1,y                        ; $0C9DC4 |
  AND #$FFF3                                ; $0C9DC7 |
  STA !s_spr_oam_1,y                        ; $0C9DCA |
  LDA $10                                   ; $0C9DCD |
  AND #$001F                                ; $0C9DCF |
  CLC                                       ; $0C9DD2 |
  ADC #$0030                                ; $0C9DD3 |
  STA !s_spr_wildcard_3_lo,y                ; $0C9DD6 |
  SEP #$20                                  ; $0C9DD9 |
  LDA #$7F                                  ; $0C9DDB |
  STA $7863,y                               ; $0C9DDD |
  LDA #$00                                  ; $0C9DE0 |
  STA $7862,y                               ; $0C9DE2 |
  REP #$20                                  ; $0C9DE5 |
  TYA                                       ; $0C9DE7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0C9DE8 |
  RTL                                       ; $0C9DEB |

CODE_0C9DEC:
  LDA #$019D                                ; $0C9DEC |
  TXY                                       ; $0C9DEF |
  JML $03A377                               ; $0C9DF0 |

main_skeleton_goonie_with_bomb:
  JSR CODE_0C9F9D                           ; $0C9DF4 |
  LDA !s_spr_state,x                        ; $0C9DF7 |
  CMP #$0008                                ; $0C9DFA |
  BNE CODE_0C9E34                           ; $0C9DFD |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9DFF |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9E02 |
  ORA #$001B                                ; $0C9E05 |
  STA !s_spr_bitwise_settings_3,y           ; $0C9E08 |
  LDA !s_spr_oam_1,y                        ; $0C9E0B |
  ORA #$0004                                ; $0C9E0E |
  STA !s_spr_oam_1,y                        ; $0C9E11 |
  LDA #$0000                                ; $0C9E14 |
  STA !s_spr_wildcard_4_lo,y                ; $0C9E17 |
  LDA #$0002                                ; $0C9E1A |
  STA !s_spr_state,y                        ; $0C9E1D |
  LDA #$0216                                ; $0C9E20 |
  STA $06                                   ; $0C9E23 |
  LDA #$0000                                ; $0C9E25 |
  JSL $0C9C8A                               ; $0C9E28 |
  LDA #$019E                                ; $0C9E2C |
  TXY                                       ; $0C9E2F |
  JML $03A377                               ; $0C9E30 |

CODE_0C9E34:
  CMP #$0010                                ; $0C9E34 |
  BNE CODE_0C9E3E                           ; $0C9E37 |
  LDA !s_spr_timer_frozen,x                 ; $0C9E39 |
  BEQ CODE_0C9E74                           ; $0C9E3C |

CODE_0C9E3E:
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9E3E |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9E41 |
  ORA #$001B                                ; $0C9E44 |
  STA !s_spr_bitwise_settings_3,y           ; $0C9E47 |
  LDA !s_spr_oam_1,y                        ; $0C9E4A |
  ORA #$0004                                ; $0C9E4D |
  STA !s_spr_oam_1,y                        ; $0C9E50 |
  LDA #$0000                                ; $0C9E53 |
  STA !s_spr_wildcard_4_lo,y                ; $0C9E56 |
  LDA #$0002                                ; $0C9E59 |
  STA !s_spr_state,y                        ; $0C9E5C |
  LDA #$019D                                ; $0C9E5F |
  TXY                                       ; $0C9E62 |
  JSL $03A377                               ; $0C9E63 |
  LDA #$0040                                ; $0C9E67 |
  STA !s_spr_y_accel,x                      ; $0C9E6A |
  LDA #$0400                                ; $0C9E6D |
  STA !s_spr_y_accel_ceiling,x              ; $0C9E70 |
  RTL                                       ; $0C9E73 |

CODE_0C9E74:
  JSL $03AF23                               ; $0C9E74 |
  JSR CODE_0C9F76                           ; $0C9E78 |
  LDY !s_spr_collision_id,x                 ; $0C9E7B |
  BPL CODE_0C9EC2                           ; $0C9E7E |
  LDA !s_player_ground_pound_state          ; $0C9E80 |
  BEQ CODE_0C9EC2                           ; $0C9E83 |
  LDA !s_spr_y_player_delta,x               ; $0C9E85 |
  SEC                                       ; $0C9E88 |
  SBC !s_player_hitbox_half_height          ; $0C9E89 |
  SEC                                       ; $0C9E8C |
  SBC !s_spr_hitbox_height,x                ; $0C9E8D |
  CMP #$FFF8                                ; $0C9E90 |
  BCC CODE_0C9EC2                           ; $0C9E93 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9E95 |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9E98 |
  ORA #$001B                                ; $0C9E9B |
  STA !s_spr_bitwise_settings_3,y           ; $0C9E9E |
  LDA !s_spr_oam_1,y                        ; $0C9EA1 |
  ORA #$0004                                ; $0C9EA4 |
  STA !s_spr_oam_1,y                        ; $0C9EA7 |
  LDA #$0000                                ; $0C9EAA |
  STA !s_spr_wildcard_4_lo,y                ; $0C9EAD |
  LDA #$0002                                ; $0C9EB0 |
  STA !s_spr_state,y                        ; $0C9EB3 |
  JSL $0C9C7B                               ; $0C9EB6 |
  JSL $0CFF61                               ; $0C9EBA |
  JML $03B273                               ; $0C9EBE |

CODE_0C9EC2:
  JSL $03A5B7                               ; $0C9EC2 |
  JSR CODE_0C9EFE                           ; $0C9EC6 |
  JSR CODE_0C9C23                           ; $0C9EC9 |
  JSR CODE_0C9BF2                           ; $0C9ECC |
  JSR CODE_0C9BCE                           ; $0C9ECF |
  JSR CODE_0C9ED6                           ; $0C9ED2 |
  RTL                                       ; $0C9ED5 |

CODE_0C9ED6:
  LDY !s_spr_facing_dir,x                   ; $0C9ED6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0C9ED9 |
  CLC                                       ; $0C9EDC |
  ADC $9D56,y                               ; $0C9EDD |
  STA $00                                   ; $0C9EE0 |
  LDA !s_spr_anim_frame,x                   ; $0C9EE2 |
  ASL A                                     ; $0C9EE5 |
  TAY                                       ; $0C9EE6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0C9EE7 |
  CLC                                       ; $0C9EEA |
  ADC $9D5A,y                               ; $0C9EEB |
  STA $02                                   ; $0C9EEE |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9EF0 |
  LDA $00                                   ; $0C9EF3 |
  STA !s_spr_x_pixel_pos,y                  ; $0C9EF5 |
  LDA $02                                   ; $0C9EF8 |
  STA !s_spr_y_pixel_pos,y                  ; $0C9EFA |
  RTS                                       ; $0C9EFD |

CODE_0C9EFE:
  LDA !s_spr_y_hitbox_center,x              ; $0C9EFE |
  SEC                                       ; $0C9F01 |
  SBC !s_player_center_y                    ; $0C9F02 |
  BMI CODE_0C9F0C                           ; $0C9F05 |
  CMP #$0010                                ; $0C9F07 |
  BPL CODE_0C9F75                           ; $0C9F0A |

CODE_0C9F0C:
  LDA !s_spr_x_hitbox_center,x              ; $0C9F0C |
  SEC                                       ; $0C9F0F |
  SBC !s_player_center_x                    ; $0C9F10 |
  CLC                                       ; $0C9F13 |
  ADC #$0010                                ; $0C9F14 |
  CMP #$0020                                ; $0C9F17 |
  BCS CODE_0C9F75                           ; $0C9F1A |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9F1C |
  LDA !s_spr_x_speed_lo,x                   ; $0C9F1F |
  STA !s_spr_x_speed_lo,y                   ; $0C9F22 |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9F25 |
  ORA #$001B                                ; $0C9F28 |
  STA !s_spr_bitwise_settings_3,y           ; $0C9F2B |
  LDA !s_spr_oam_1,y                        ; $0C9F2E |
  ORA #$0004                                ; $0C9F31 |
  STA !s_spr_oam_1,y                        ; $0C9F34 |
  LDA #$0000                                ; $0C9F37 |
  STA !s_spr_wildcard_4_lo,y                ; $0C9F3A |
  LDA #$0002                                ; $0C9F3D |
  STA !s_spr_state,y                        ; $0C9F40 |
  LDA !s_spr_anim_frame,x                   ; $0C9F43 |
  STA $00                                   ; $0C9F46 |
  LDA !s_spr_timer_1,x                      ; $0C9F48 |
  STA $02                                   ; $0C9F4B |
  LDA !s_spr_timer_2,x                      ; $0C9F4D |
  STA $04                                   ; $0C9F50 |
  LDA !s_spr_x_speed_lo,x                   ; $0C9F52 |
  STA $06                                   ; $0C9F55 |
  LDA #$019D                                ; $0C9F57 |
  TXY                                       ; $0C9F5A |
  JSL $03A377                               ; $0C9F5B |
  LDA $06                                   ; $0C9F5F |
  STA !s_spr_x_speed_lo,x                   ; $0C9F61 |
  LDA $04                                   ; $0C9F64 |
  STA !s_spr_timer_2,x                      ; $0C9F66 |
  LDA $02                                   ; $0C9F69 |
  STA !s_spr_timer_1,x                      ; $0C9F6B |
  LDA $00                                   ; $0C9F6E |
  STA !s_spr_anim_frame,x                   ; $0C9F70 |
  PLA                                       ; $0C9F73 |
  RTL                                       ; $0C9F74 |

CODE_0C9F75:
  RTS                                       ; $0C9F75 |

CODE_0C9F76:
  JSL $03A2F8                               ; $0C9F76 |
  BCC CODE_0C9F9C                           ; $0C9F7A |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9F7C |
  CPY #$60                                  ; $0C9F7F |
  BCS CODE_0C9F9A                           ; $0C9F81 |
  LDA !s_spr_state,y                        ; $0C9F83 |
  CMP #$0010                                ; $0C9F86 |
  BNE CODE_0C9F9A                           ; $0C9F89 |
  LDA !s_spr_id,y                           ; $0C9F8B |
  CMP #$0060                                ; $0C9F8E |
  BNE CODE_0C9F9A                           ; $0C9F91 |
  TYX                                       ; $0C9F93 |
  JSL $03A31E                               ; $0C9F94 |
  LDX $12                                   ; $0C9F98 |

CODE_0C9F9A:
  PLA                                       ; $0C9F9A |
  RTL                                       ; $0C9F9B |

CODE_0C9F9C:
  RTS                                       ; $0C9F9C |

CODE_0C9F9D:
  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9F9D |
  CPY #$60                                  ; $0C9FA0 |
  BCS CODE_0C9FB4                           ; $0C9FA2 |
  LDA !s_spr_state,y                        ; $0C9FA4 |
  CMP #$0010                                ; $0C9FA7 |
  BNE CODE_0C9FB4                           ; $0C9FAA |
  LDA !s_spr_id,y                           ; $0C9FAC |
  CMP #$0060                                ; $0C9FAF |
  BEQ CODE_0C9F9C                           ; $0C9FB2 |

CODE_0C9FB4:
  LDA !s_spr_anim_frame,x                   ; $0C9FB4 |
  PHA                                       ; $0C9FB7 |
  LDA !s_spr_timer_1,x                      ; $0C9FB8 |
  PHA                                       ; $0C9FBB |
  LDA !s_spr_timer_2,x                      ; $0C9FBC |
  PHA                                       ; $0C9FBF |
  LDA !s_spr_x_speed_lo,x                   ; $0C9FC0 |
  PHA                                       ; $0C9FC3 |
  LDA #$019D                                ; $0C9FC4 |
  TXY                                       ; $0C9FC7 |
  JSL $03A377                               ; $0C9FC8 |
  PLA                                       ; $0C9FCC |
  STA !s_spr_x_speed_lo,x                   ; $0C9FCD |
  PLA                                       ; $0C9FD0 |
  STA !s_spr_timer_2,x                      ; $0C9FD1 |
  PLA                                       ; $0C9FD4 |
  STA !s_spr_timer_1,x                      ; $0C9FD5 |
  PLA                                       ; $0C9FD8 |
  STA !s_spr_anim_frame,x                   ; $0C9FD9 |
  PLA                                       ; $0C9FDC |
  RTL                                       ; $0C9FDD |

  LDY !s_spr_gsu_morph_1_lo,x               ; $0C9FDE |
  LDA !s_spr_bitwise_settings_3,y           ; $0C9FE1 |
  ORA #$001B                                ; $0C9FE4 |
  STA !s_spr_bitwise_settings_3,y           ; $0C9FE7 |
  LDA #$0002                                ; $0C9FEA |
  STA !s_spr_state,y                        ; $0C9FED |
  JSL $0C9C7B                               ; $0C9FF0 |
  LDA #$019E                                ; $0C9FF4 |
  TXY                                       ; $0C9FF7 |
  JSL $03A377                               ; $0C9FF8 |
  LDA #$0010                                ; $0C9FFC |
  STA !s_spr_state,x                        ; $0C9FFF |
  RTL                                       ; $0CA002 |

; gsu table
  dw $4202, $0202, $4200, $0200             ; $0CA003 |
  dw $FF00, $0100                           ; $0CA00B |

; regular and double-ended
init_firebar:
  STZ !s_spr_facing_dir,x                   ; $0CA00F |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA012 |
  AND #$0010                                ; $0CA015 |
  LSR A                                     ; $0CA018 |
  LSR A                                     ; $0CA019 |
  LSR A                                     ; $0CA01A |
  TAY                                       ; $0CA01B |
  LDA $A00B,y                               ; $0CA01C |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CA01F |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA021 |
  CLC                                       ; $0CA024 |
  ADC #$FFF8                                ; $0CA025 |
  STA !s_spr_x_pixel_pos,x                  ; $0CA028 |
  LDA #$FFB8                                ; $0CA02B |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA02E |
  LDA #$0003                                ; $0CA030 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA033 |
  LDA #$0006                                ; $0CA035 |
  STA !s_spr_timer_1,x                      ; $0CA038 |
  RTL                                       ; $0CA03B |

; regular and double-ended
main_firebar:
  LDA #$000C                                ; $0CA03C |
  STA !gsu_r5                               ; $0CA03F |
  LDA #$A003                                ; $0CA042 |
  STA !gsu_r6                               ; $0CA045 |
  LDX #$08                                  ; $0CA048 |
  LDA #$96DF                                ; $0CA04A |
  JSL r_gsu_init_1                          ; $0CA04D | GSU init
  LDX $12                                   ; $0CA051 |
  JSL $03AF23                               ; $0CA053 |
  LDY !s_spr_collision_id,x                 ; $0CA057 |
  BPL CODE_0CA060                           ; $0CA05A |
  JSL player_hit_sprite                     ; $0CA05C |

CODE_0CA060:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA060 |
  CLC                                       ; $0CA062 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $0CA063 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA065 |
  LDA !s_spr_timer_1,x                      ; $0CA067 |
  BNE CODE_0CA07D                           ; $0CA06A |
  SEP #$20                                  ; $0CA06C |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CA06E |
  BPL CODE_0CA076                           ; $0CA070 |
  LDA #$03                                  ; $0CA072 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA074 |

CODE_0CA076:
  LDA #$06                                  ; $0CA076 |
  STA !s_spr_timer_1,x                      ; $0CA078 |
  REP #$20                                  ; $0CA07B |

CODE_0CA07D:
  RTL                                       ; $0CA07D |

init_little_mouser_nest:
  STZ !s_spr_facing_dir,x                   ; $0CA07E |
  RTL                                       ; $0CA081 |

main_little_mouser_nest:
  JSL $03AF23                               ; $0CA082 |
  RTL                                       ; $0CA086 |

init_little_mouser_in_nest:
  STZ !s_spr_facing_dir,x                   ; $0CA087 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA08A |
  AND #$0010                                ; $0CA08D |
  LSR A                                     ; $0CA090 |
  LSR A                                     ; $0CA091 |
  LSR A                                     ; $0CA092 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA093 |
  TAX                                       ; $0CA095 |
  JMP ($A099,x)                             ; $0CA096 |

  dw $A119                                  ; $0CA099 |
  dw $A09D                                  ; $0CA09B |

  LDX $12                                   ; $0CA09D |
  LDA #$0008                                ; $0CA09F |
  STA !s_spr_anim_frame,x                   ; $0CA0A2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA0A5 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CA0A8 |
  SEC                                       ; $0CA0AA |
  SBC #$0018                                ; $0CA0AB |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CA0AE |
  JMP CODE_0CA20F                           ; $0CA0B1 |

main_little_mouser_in_nest:
  JSL $03AF23                               ; $0CA0B4 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA0B8 |
  TAX                                       ; $0CA0BA |
  JMP ($A0BE,x)                             ; $0CA0BB |

  dw $A0F0                                  ; $0CA0BE |
  dw $A143                                  ; $0CA0C0 |

  dw $A0CA                                  ; $0CA0C2 |
  dw $A0DA                                  ; $0CA0C4 |

  dw $A0D2                                  ; $0CA0C6 |
  dw $A0E3                                  ; $0CA0C8 |

  dw $0102, $0102, $0102, $0002             ; $0CA0CA |

  dw $4002, $1004, $2004, $4004             ; $0CA0D2 |

  dw $0502, $0506, $0302, $0304             ; $0CA0DA |
  dw $0201, $1002, $0202, $1002             ; $0CA0E2 |

  dw $4002, $0007, $0008                    ; $0CA0EA |

  LDX $12                                   ; $0CA0F0 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CA0F2 |
  TAY                                       ; $0CA0F4 |
  LDA $A0C2,y                               ; $0CA0F5 |
  STA $00                                   ; $0CA0F8 |
  LDA $A0C6,y                               ; $0CA0FA |
  STA $02                                   ; $0CA0FD |
  LDA !s_spr_timer_1,x                      ; $0CA0FF |
  BNE CODE_0CA118                           ; $0CA102 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CA104 |
  BMI CODE_0CA11B                           ; $0CA106 |
  SEP #$20                                  ; $0CA108 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA10A |
  LDA ($00),y                               ; $0CA10C |
  STA !s_spr_anim_frame,x                   ; $0CA10E |
  LDA ($02),y                               ; $0CA111 |
  STA !s_spr_timer_1,x                      ; $0CA113 |
  REP #$20                                  ; $0CA116 |

CODE_0CA118:
  RTL                                       ; $0CA118 |

  LDX $12                                   ; $0CA119 |

CODE_0CA11B:
  LDA $10                                   ; $0CA11B |
  AND #$0001                                ; $0CA11D |
  ASL A                                     ; $0CA120 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA121 |
  TAY                                       ; $0CA123 |
  LDA $A0C2,y                               ; $0CA124 |
  STA $00                                   ; $0CA127 |
  LDA $A0C6,y                               ; $0CA129 |
  STA $02                                   ; $0CA12C |
  LDA $A0EC,y                               ; $0CA12E |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA131 |
  TAY                                       ; $0CA133 |
  SEP #$20                                  ; $0CA134 |
  LDA ($00),y                               ; $0CA136 |
  STA !s_spr_anim_frame,x                   ; $0CA138 |
  LDA ($02),y                               ; $0CA13B |
  STA !s_spr_timer_1,x                      ; $0CA13D |
  REP #$20                                  ; $0CA140 |
  RTL                                       ; $0CA142 |

  LDX $12                                   ; $0CA143 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CA145 |
  TAX                                       ; $0CA147 |
  JMP ($A14B,x)                             ; $0CA148 |

  dw $A155                                  ; $0CA14B |
  dw $A197                                  ; $0CA14D |
  dw $A1D4                                  ; $0CA14F |
  dw $A1E6                                  ; $0CA151 |
  dw $A208                                  ; $0CA153 |

  LDX $12                                   ; $0CA155 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CA157 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CA15A |
  BMI CODE_0CA177                           ; $0CA15D |
  STA !s_spr_y_pixel_pos,x                  ; $0CA15F |
  STZ !s_spr_y_speed_lo,x                   ; $0CA162 |
  LDA $10                                   ; $0CA165 |
  AND #$0003                                ; $0CA167 |
  BEQ CODE_0CA178                           ; $0CA16A |
  LDA #$0020                                ; $0CA16C |
  STA !s_spr_timer_1,x                      ; $0CA16F |
  LDA #$0004                                ; $0CA172 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA175 |

CODE_0CA177:
  RTL                                       ; $0CA177 |

CODE_0CA178:
  LDA #$0006                                ; $0CA178 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA17B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA17D |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA17F |
  RTL                                       ; $0CA181 |

  db $08, $07, $08, $07, $08, $07, $08      ; $0CA182 |

  db $02, $10, $30, $10, $02, $20, $02      ; $0CA189 |

  db $00, $01, $00, $01, $00, $01, $00      ; $0CA190 |

  LDX $12                                   ; $0CA197 |
  LDA !s_spr_timer_1,x                      ; $0CA199 |
  BNE CODE_0CA1C4                           ; $0CA19C |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CA19E |
  BMI CODE_0CA1C5                           ; $0CA1A0 |
  SEP #$20                                  ; $0CA1A2 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA1A4 |
  LDA $A182,y                               ; $0CA1A6 |
  STA !s_spr_anim_frame,x                   ; $0CA1A9 |
  LDA $A189,y                               ; $0CA1AC |
  STA !s_spr_timer_1,x                      ; $0CA1AF |
  LDA $A190,y                               ; $0CA1B2 |
  BEQ CODE_0CA1C2                           ; $0CA1B5 |
  LDA $10                                   ; $0CA1B7 |
  AND #$01                                  ; $0CA1B9 |
  ASL A                                     ; $0CA1BB |
  EOR !s_spr_facing_dir,x                   ; $0CA1BC |
  STA !s_spr_facing_dir,x                   ; $0CA1BF |

CODE_0CA1C2:
  REP #$20                                  ; $0CA1C2 |

CODE_0CA1C4:
  RTL                                       ; $0CA1C4 |

CODE_0CA1C5:
  STZ !s_spr_facing_dir,x                   ; $0CA1C5 |
  LDA #$0400                                ; $0CA1C8 |
  STA !s_spr_y_speed_lo,x                   ; $0CA1CB |
  LDA #$0006                                ; $0CA1CE |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA1D1 |
  RTL                                       ; $0CA1D3 |

  LDX $12                                   ; $0CA1D4 |
  LDA !s_spr_timer_1,x                      ; $0CA1D6 |
  BNE CODE_0CA1E5                           ; $0CA1D9 |
  LDA #$0400                                ; $0CA1DB |
  STA !s_spr_y_speed_lo,x                   ; $0CA1DE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA1E1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA1E3 |

CODE_0CA1E5:
  RTL                                       ; $0CA1E5 |

  LDX $12                                   ; $0CA1E6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA1E8 |
  CMP !s_spr_wildcard_6_lo_dp,x             ; $0CA1EB |
  BMI CODE_0CA207                           ; $0CA1ED |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0CA1EF |
  STA !s_spr_y_pixel_pos,x                  ; $0CA1F1 |
  LDA $10                                   ; $0CA1F4 |
  AND #$003F                                ; $0CA1F6 |
  CLC                                       ; $0CA1F9 |
  ADC #$0040                                ; $0CA1FA |
  STA !s_spr_timer_1,x                      ; $0CA1FD |
  STZ !s_spr_y_speed_lo,x                   ; $0CA200 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA203 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CA205 |

CODE_0CA207:
  RTL                                       ; $0CA207 |

  LDX $12                                   ; $0CA208 |
  LDA !s_spr_timer_1,x                      ; $0CA20A |
  BNE CODE_0CA217                           ; $0CA20D |

CODE_0CA20F:
  LDA #$FC00                                ; $0CA20F |
  STA !s_spr_y_speed_lo,x                   ; $0CA212 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CA215 |

CODE_0CA217:
  RTL                                       ; $0CA217 |

  dw $FE80, $0180                           ; $0CA218 |

init_little_mouser:
  LDY !s_spr_wildcard_1_lo,x                ; $0CA21C |
  BEQ CODE_0CA24F                           ; $0CA21F |

CODE_0CA221:
  SEP #$20                                  ; $0CA221 |
  LDA #$01                                  ; $0CA223 |
  STA !s_spr_wildcard_1_lo,x                ; $0CA225 |
  LDA #$02                                  ; $0CA228 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA22A |
  TAY                                       ; $0CA22C |
  LDA $A430,y                               ; $0CA22D |
  STA !s_spr_anim_frame,x                   ; $0CA230 |
  LDA #$02                                  ; $0CA233 |
  STA !s_spr_timer_2,x                      ; $0CA235 |
  REP #$20                                  ; $0CA238 |
  LDA #$0020                                ; $0CA23A |
  STA !s_spr_timer_1,x                      ; $0CA23D |
  LDY !s_spr_facing_dir,x                   ; $0CA240 |
  LDA $A218,y                               ; $0CA243 |
  STA !s_spr_x_speed_lo,x                   ; $0CA246 |
  LDA #$FFFF                                ; $0CA249 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA24C |
  RTL                                       ; $0CA24E |

CODE_0CA24F:
  SEP #$20                                  ; $0CA24F |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA251 |
  AND #$10                                  ; $0CA254 |
  LSR A                                     ; $0CA256 |
  LSR A                                     ; $0CA257 |
  LSR A                                     ; $0CA258 |
  INC A                                     ; $0CA259 |
  STA !s_spr_wildcard_1_lo,x                ; $0CA25A |
  PHA                                       ; $0CA25D |
  LDA #$02                                  ; $0CA25E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA260 |
  TAY                                       ; $0CA262 |
  LDA $A430,y                               ; $0CA263 |
  STA !s_spr_anim_frame,x                   ; $0CA266 |
  LDA #$02                                  ; $0CA269 |
  STA !s_spr_timer_2,x                      ; $0CA26B |
  REP #$20                                  ; $0CA26E |
  LDA #$0020                                ; $0CA270 |
  STA !s_spr_timer_1,x                      ; $0CA273 |
  LDY !s_spr_facing_dir,x                   ; $0CA276 |
  LDA $A218,y                               ; $0CA279 |
  STA !s_spr_x_speed_lo,x                   ; $0CA27C |
  PLY                                       ; $0CA27F |
  DEY                                       ; $0CA280 |
  BNE CODE_0CA289                           ; $0CA281 |
  LDA #$FFFF                                ; $0CA283 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA286 |
  RTL                                       ; $0CA288 |

CODE_0CA289:
  LDA #$0025                                ; $0CA289 |
  JSL spawn_sprite_active                   ; $0CA28C |
  BCC CODE_0CA221                           ; $0CA290 |
  LDA !s_spr_bitwise_settings_3,y           ; $0CA292 |
  AND #$FFE0                                ; $0CA295 |
  STA !s_spr_bitwise_settings_3,y           ; $0CA298 |
  LDA !s_spr_oam_1,y                        ; $0CA29B |
  AND #$FFF3                                ; $0CA29E |
  STA !s_spr_oam_1,y                        ; $0CA2A1 |
  LDA #$0001                                ; $0CA2A4 |
  STA !s_spr_gsu_morph_1_lo,y               ; $0CA2A7 |
  LDA #$0000                                ; $0CA2AA |
  STA !s_spr_y_speed_lo,y                   ; $0CA2AD |
  STA !s_spr_x_speed_lo,y                   ; $0CA2B0 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA2B3 |
  STA !s_spr_x_pixel_pos,y                  ; $0CA2B6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA2B9 |
  SEC                                       ; $0CA2BC |
  SBC #$0010                                ; $0CA2BD |
  STA !s_spr_y_pixel_pos,y                  ; $0CA2C0 |
  TYA                                       ; $0CA2C3 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA2C4 |
  RTL                                       ; $0CA2C6 |

main_little_mouser:
  LDA !s_spr_state,x                        ; $0CA2C7 |
  CMP #$0010                                ; $0CA2CA |
  BEQ CODE_0CA2F7                           ; $0CA2CD |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA2CF |
  BMI CODE_0CA2F7                           ; $0CA2D1 |
  LDA !s_spr_id,y                           ; $0CA2D3 |
  CMP #$0022                                ; $0CA2D6 |
  BCC CODE_0CA2F7                           ; $0CA2D9 |
  CMP #$0026                                ; $0CA2DB |
  BCS CODE_0CA2F7                           ; $0CA2DE |
  LDA !s_spr_wildcard_6_lo,y                ; $0CA2E0 |
  BNE CODE_0CA2F7                           ; $0CA2E3 |
  LDA !s_spr_bitwise_settings_3,y           ; $0CA2E5 |
  ORA #$0001                                ; $0CA2E8 |
  STA !s_spr_bitwise_settings_3,y           ; $0CA2EB |
  LDA !s_spr_oam_1,y                        ; $0CA2EE |
  ORA #$0004                                ; $0CA2F1 |
  STA !s_spr_oam_1,y                        ; $0CA2F4 |

CODE_0CA2F7:
  JSL $03AF23                               ; $0CA2F7 |
  JSL $03A2F8                               ; $0CA2FB |
  BCC CODE_0CA322                           ; $0CA2FF |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA301 |
  BMI CODE_0CA321                           ; $0CA303 |
  LDA !s_spr_state,y                        ; $0CA305 |
  CMP #$0010                                ; $0CA308 |
  BNE CODE_0CA321                           ; $0CA30B |
  LDA !s_spr_id,y                           ; $0CA30D |
  CMP #$0022                                ; $0CA310 |
  BCC CODE_0CA321                           ; $0CA313 |
  CMP #$0026                                ; $0CA315 |
  BCS CODE_0CA321                           ; $0CA318 |
  TYX                                       ; $0CA31A |
  JSL $03A31E                               ; $0CA31B |
  LDX $12                                   ; $0CA31F |

CODE_0CA321:
  RTL                                       ; $0CA321 |

CODE_0CA322:
  LDY !s_spr_wildcard_1_lo,x                ; $0CA322 |
  DEY                                       ; $0CA325 |
  BNE CODE_0CA375                           ; $0CA326 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA328 |
  CMP #$0006                                ; $0CA32A |
  BCC CODE_0CA334                           ; $0CA32D |
  CMP #$0009                                ; $0CA32F |
  BCC CODE_0CA34D                           ; $0CA332 |

CODE_0CA334:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA334 |
  CMP #$000A                                ; $0CA336 |
  BCC CODE_0CA340                           ; $0CA339 |
  CMP #$000F                                ; $0CA33B |
  BCC CODE_0CA34D                           ; $0CA33E |

CODE_0CA340:
  JSR CODE_0CA8C2                           ; $0CA340 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA343 |
  CMP #$0004                                ; $0CA345 |
  BEQ CODE_0CA34D                           ; $0CA348 |
  JSR CODE_0CA867                           ; $0CA34A |

CODE_0CA34D:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA34D |
  CMP #$0008                                ; $0CA34F |
  BEQ CODE_0CA36A                           ; $0CA352 |
  CMP #$0006                                ; $0CA354 |
  BEQ CODE_0CA36A                           ; $0CA357 |
  LDA $7860,x                               ; $0CA359 |
  BIT #$0001                                ; $0CA35C |
  BNE CODE_0CA36A                           ; $0CA35F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA361 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CA363 |
  LDA #$0008                                ; $0CA365 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA368 |

CODE_0CA36A:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA36A |
  TAX                                       ; $0CA36C |
  JSR ($A420,x)                             ; $0CA36D |
  JSL $03A5B7                               ; $0CA370 |
  RTL                                       ; $0CA374 |

CODE_0CA375:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA375 |
  LDA !s_spr_state,y                        ; $0CA377 |
  CMP #$0010                                ; $0CA37A |
  BNE CODE_0CA396                           ; $0CA37D |
  LDA !s_spr_id,y                           ; $0CA37F |
  CMP #$0022                                ; $0CA382 |
  BCC CODE_0CA396                           ; $0CA385 |
  CMP #$0026                                ; $0CA387 |
  BCS CODE_0CA396                           ; $0CA38A |
  LDA !s_spr_collision_state,y              ; $0CA38C |
  BNE CODE_0CA396                           ; $0CA38F |
  LDA !s_spr_wildcard_6_lo,y                ; $0CA391 |
  BEQ CODE_0CA3C7                           ; $0CA394 |

CODE_0CA396:
  LDA #$FFFF                                ; $0CA396 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA399 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CA39B |
  SEP #$20                                  ; $0CA39E |
  LDA #$01                                  ; $0CA3A0 |
  STA !s_spr_wildcard_1_lo,x                ; $0CA3A2 |
  REP #$20                                  ; $0CA3A5 |
  PHY                                       ; $0CA3A7 |
  LDA #$0075                                ; $0CA3A8 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA3AB |/
  PLY                                       ; $0CA3AF |
  LDA #$FC00                                ; $0CA3B0 |
  STA !s_spr_y_speed_lo,x                   ; $0CA3B3 |
  LDA $7860,x                               ; $0CA3B6 |
  AND #$FFFE                                ; $0CA3B9 |
  STA $7860,x                               ; $0CA3BC |
  LDA !s_spr_bitwise_settings_3,x           ; $0CA3BF |
  JSR CODE_0CA50F                           ; $0CA3C2 |
  BRA CODE_0CA41B                           ; $0CA3C5 |

CODE_0CA3C7:
  LDA #$0002                                ; $0CA3C7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CA3CA |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA3CD |
  STA !s_spr_x_pixel_pos,y                  ; $0CA3D0 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA3D3 |
  SEC                                       ; $0CA3D6 |
  SBC #$0010                                ; $0CA3D7 |
  STA !s_spr_y_pixel_pos,y                  ; $0CA3DA |
  LDA !s_spr_y_hitbox_center,x              ; $0CA3DD |
  SEC                                       ; $0CA3E0 |
  SBC !s_player_center_y                    ; $0CA3E1 |
  CLC                                       ; $0CA3E4 |
  ADC #$0060                                ; $0CA3E5 |
  CMP #$00C0                                ; $0CA3E8 |
  BCS CODE_0CA415                           ; $0CA3EB |
  LDA !s_spr_x_hitbox_center,x              ; $0CA3ED |
  SEC                                       ; $0CA3F0 |
  SBC !s_player_center_x                    ; $0CA3F1 |
  CLC                                       ; $0CA3F4 |
  ADC #$0050                                ; $0CA3F5 |
  CMP #$00A0                                ; $0CA3F8 |
  BCS CODE_0CA415                           ; $0CA3FB |
  SEP #$20                                  ; $0CA3FD |
  LDA #$01                                  ; $0CA3FF |
  STA !s_spr_wildcard_1_lo,x                ; $0CA401 |
  REP #$20                                  ; $0CA404 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CA406 |
  AND #$F83F                                ; $0CA409 |
  ORA #$0480                                ; $0CA40C |
  STA !s_spr_bitwise_settings_3,x           ; $0CA40F |
  JSR CODE_0CA7BF                           ; $0CA412 |

CODE_0CA415:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA415 |
  TAX                                       ; $0CA417 |
  JSR ($A420,x)                             ; $0CA418 |

CODE_0CA41B:
  JSL $03A5B7                               ; $0CA41B |
  RTL                                       ; $0CA41F |

  dw $A433                                  ; $0CA420 |
  dw $A475                                  ; $0CA422 |
  dw $A4CC                                  ; $0CA424 |
  dw $A534                                  ; $0CA426 |
  dw $A572                                  ; $0CA428 |
  dw $A5DD                                  ; $0CA42A |
  dw $A70A                                  ; $0CA42C |
  dw $A7D9                                  ; $0CA42E |

  db $04, $03, $02                          ; $0CA430 |

  LDX $12                                   ; $0CA433 |
  LDA !s_spr_timer_1,x                      ; $0CA435 |
  BEQ CODE_0CA43D                           ; $0CA438 |
  JMP CODE_0CA6EB                           ; $0CA43A |

CODE_0CA43D:
  STZ !s_spr_x_speed_lo,x                   ; $0CA43D |
  SEP #$20                                  ; $0CA440 |
  LDA #$02                                  ; $0CA442 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA444 |
  TAY                                       ; $0CA446 |
  LDA $A46F,y                               ; $0CA447 |
  STA !s_spr_anim_frame,x                   ; $0CA44A |
  LDA $10                                   ; $0CA44D |
  AND #$03                                  ; $0CA44F |
  INC A                                     ; $0CA451 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CA452 |
  LDA $10                                   ; $0CA454 |
  LSR A                                     ; $0CA456 |
  LSR A                                     ; $0CA457 |
  AND #$07                                  ; $0CA458 |
  CLC                                       ; $0CA45A |
  ADC #$02                                  ; $0CA45B |
  STA !s_spr_timer_1,x                      ; $0CA45D |
  REP #$20                                  ; $0CA460 |
  LDA #$0075                                ; $0CA462 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA465 |/
  LDA #$0002                                ; $0CA469 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA46C |
  RTS                                       ; $0CA46E |

  db $00, $01, $00                          ; $0CA46F |

  db $02, $00, $00                          ; $0CA472 |

  LDX $12                                   ; $0CA475 |
  LDA !s_spr_timer_1,x                      ; $0CA477 |
  BNE CODE_0CA4A7                           ; $0CA47A |
  SEP #$20                                  ; $0CA47C |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CA47E |
  BPL CODE_0CA48A                           ; $0CA480 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CA482 |
  BMI CODE_0CA4A8                           ; $0CA484 |
  LDA #$02                                  ; $0CA486 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA488 |

CODE_0CA48A:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CA48A |
  LDA $A46F,y                               ; $0CA48C |
  STA !s_spr_anim_frame,x                   ; $0CA48F |
  LDA !s_spr_facing_dir,x                   ; $0CA492 |
  EOR $A472,y                               ; $0CA495 |
  STA !s_spr_facing_dir,x                   ; $0CA498 |
  LDA $10                                   ; $0CA49B |
  AND #$1F                                  ; $0CA49D |
  CLC                                       ; $0CA49F |
  ADC #$02                                  ; $0CA4A0 |
  STA !s_spr_timer_1,x                      ; $0CA4A2 |
  REP #$20                                  ; $0CA4A5 |

CODE_0CA4A7:
  RTS                                       ; $0CA4A7 |

CODE_0CA4A8:
  LDA #$9502                                ; $0CA4A8 |
  CLC                                       ; $0CA4AB |
  TAY                                       ; $0CA4AC |
  LDA $A430,y                               ; $0CA4AD |
  STA !s_spr_anim_frame,x                   ; $0CA4B0 |
  LDA #$9D02                                ; $0CA4B3 |
  TYA                                       ; $0CA4B6 |
  PLY                                       ; $0CA4B7 |
  REP #$20                                  ; $0CA4B8 |
  LDA #$0020                                ; $0CA4BA |
  STA !s_spr_timer_1,x                      ; $0CA4BD |
  LDY !s_spr_facing_dir,x                   ; $0CA4C0 |
  LDA $A218,y                               ; $0CA4C3 |
  STA !s_spr_x_speed_lo,x                   ; $0CA4C6 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CA4C9 |
  RTS                                       ; $0CA4CB |

  LDX $12                                   ; $0CA4CC |
  LDA $7860,x                               ; $0CA4CE |
  BIT #$000C                                ; $0CA4D1 |
  BEQ CODE_0CA4EF                           ; $0CA4D4 |

CODE_0CA4D6:
  STZ !s_spr_anim_frame,x                   ; $0CA4D6 |
  LDA #$0008                                ; $0CA4D9 |
  STA !s_spr_timer_1,x                      ; $0CA4DC |
  LDA #$0001                                ; $0CA4DF |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CA4E2 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA4E5 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CA4E7 |
  LDA #$0006                                ; $0CA4E9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA4EC |
  RTS                                       ; $0CA4EE |

CODE_0CA4EF:
  LDA !s_spr_y_hitbox_center,x              ; $0CA4EF |
  SEC                                       ; $0CA4F2 |
  SBC !s_player_center_y                    ; $0CA4F3 |
  CLC                                       ; $0CA4F6 |
  ADC #$0060                                ; $0CA4F7 |
  CMP #$00C0                                ; $0CA4FA |
  BCS CODE_0CA50F                           ; $0CA4FD |
  LDA !s_spr_x_hitbox_center,x              ; $0CA4FF |
  SEC                                       ; $0CA502 |
  SBC !s_player_center_x                    ; $0CA503 |
  CLC                                       ; $0CA506 |
  ADC #$0070                                ; $0CA507 |
  CMP #$00E0                                ; $0CA50A |
  BCC CODE_0CA51E                           ; $0CA50D |

CODE_0CA50F:
  LDA !s_spr_bitwise_settings_3,x           ; $0CA50F |
  AND #$F83F                                ; $0CA512 |
  ORA #$0140                                ; $0CA515 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA518 |
  JMP CODE_0CA43D                           ; $0CA51B |

CODE_0CA51E:
  LDA !s_spr_x_player_dir,x                 ; $0CA51E |
  AND #$00FF                                ; $0CA521 |
  EOR #$0002                                ; $0CA524 |
  STA !s_spr_facing_dir,x                   ; $0CA527 |
  TAY                                       ; $0CA52A |
  LDA $A218,y                               ; $0CA52B |
  STA !s_spr_x_speed_lo,x                   ; $0CA52E |
  JMP CODE_0CA6EB                           ; $0CA531 |
  LDX $12                                   ; $0CA534 |
  LDA !s_spr_timer_1,x                      ; $0CA536 |
  BNE CODE_0CA555                           ; $0CA539 |
  LDA #$0075                                ; $0CA53B |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA53E |/
  LDA #$FC00                                ; $0CA542 |
  STA !s_spr_y_speed_lo,x                   ; $0CA545 |
  LDY !s_spr_facing_dir,x                   ; $0CA548 |
  LDA $A218,y                               ; $0CA54B |
  STA !s_spr_x_speed_lo,x                   ; $0CA54E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CA551 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CA553 |

CODE_0CA555:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CA555 |
  DEC A                                     ; $0CA558 |
  BEQ CODE_0CA56D                           ; $0CA559 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA55B |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA55D |
  STA !s_spr_x_pixel_pos,y                  ; $0CA560 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA563 |
  SEC                                       ; $0CA566 |
  SBC #$0010                                ; $0CA567 |
  STA !s_spr_y_pixel_pos,y                  ; $0CA56A |

CODE_0CA56D:
  RTS                                       ; $0CA56D |

  dw $FF00, $0100                           ; $0CA56E |

  LDX $12                                   ; $0CA572 |
  LDA $7860,x                               ; $0CA574 |
  BIT #$0001                                ; $0CA577 |
  BNE CODE_0CA5D5                           ; $0CA57A |
  LDY #$19                                  ; $0CA57C |
  LDA !s_spr_y_speed_lo,x                   ; $0CA57E |
  CLC                                       ; $0CA581 |
  ADC #$0080                                ; $0CA582 |
  CMP #$0100                                ; $0CA585 |
  BCC CODE_0CA5A8                           ; $0CA588 |
  LDY #$18                                  ; $0CA58A |
  LDA !s_spr_y_speed_lo,x                   ; $0CA58C |
  BMI CODE_0CA5A8                           ; $0CA58F |
  LDY #$1A                                  ; $0CA591 |
  CMP #$0100                                ; $0CA593 |
  BCC CODE_0CA5A8                           ; $0CA596 |
  LDY #$1B                                  ; $0CA598 |
  CMP #$0180                                ; $0CA59A |
  BCC CODE_0CA5A8                           ; $0CA59D |
  LDY #$1C                                  ; $0CA59F |
  CMP #$0200                                ; $0CA5A1 |
  BCC CODE_0CA5A8                           ; $0CA5A4 |
  LDY #$1D                                  ; $0CA5A6 |

CODE_0CA5A8:
  TYA                                       ; $0CA5A8 |
  STA !s_spr_anim_frame,x                   ; $0CA5A9 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CA5AC |
  BEQ CODE_0CA5D4                           ; $0CA5AF |
  DEC A                                     ; $0CA5B1 |
  BEQ CODE_0CA5C6                           ; $0CA5B2 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA5B4 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA5B6 |
  STA !s_spr_x_pixel_pos,y                  ; $0CA5B9 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA5BC |
  SEC                                       ; $0CA5BF |
  SBC #$0010                                ; $0CA5C0 |
  STA !s_spr_y_pixel_pos,y                  ; $0CA5C3 |

CODE_0CA5C6:
  LDA !s_spr_x_speed_lo,x                   ; $0CA5C6 |
  BNE CODE_0CA5D4                           ; $0CA5C9 |
  LDY !s_spr_facing_dir,x                   ; $0CA5CB |
  LDA $A56E,y                               ; $0CA5CE |
  STA !s_spr_x_speed_lo,x                   ; $0CA5D1 |

CODE_0CA5D4:
  RTS                                       ; $0CA5D4 |

CODE_0CA5D5:
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CA5D5 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0CA5D8 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA5DA |
  RTS                                       ; $0CA5DC |

  LDX $12                                   ; $0CA5DD |
  LDY !s_spr_collision_id,x                 ; $0CA5DF |
  DEY                                       ; $0CA5E2 |
  BMI CODE_0CA616                           ; $0CA5E3 |
  BEQ CODE_0CA616                           ; $0CA5E5 |
  LDA !s_spr_state,y                        ; $0CA5E7 |
  CMP #$0010                                ; $0CA5EA |
  BNE CODE_0CA616                           ; $0CA5ED |
  LDA !s_spr_collision_state,y              ; $0CA5EF |
  BNE CODE_0CA616                           ; $0CA5F2 |
  LDA !s_spr_id,y                           ; $0CA5F4 |
  CMP #$0022                                ; $0CA5F7 |
  BCC CODE_0CA616                           ; $0CA5FA |
  CMP #$0026                                ; $0CA5FC |
  BCS CODE_0CA616                           ; $0CA5FF |
  LDA !s_spr_gsu_morph_1_lo,y               ; $0CA601 |
  BNE CODE_0CA616                           ; $0CA604 |
  LDA !s_spr_wildcard_5_hi,y                ; $0CA606 |
  BMI CODE_0CA616                           ; $0CA609 |
  LDA !s_spr_x_hitbox_center,x              ; $0CA60B |
  SEC                                       ; $0CA60E |
  SBC !s_spr_x_hitbox_center,y              ; $0CA60F |
  STA $02                                   ; $0CA612 |
  BRA CODE_0CA692                           ; $0CA614 |

CODE_0CA616:
  LDA #$0022                                ; $0CA616 |
  STA !gsu_r14                              ; $0CA619 |
  LDA #$0026                                ; $0CA61C |
  STA !gsu_r11                              ; $0CA61F |
  TXA                                       ; $0CA622 |
  STA !gsu_r10                              ; $0CA623 |
  LDX #$09                                  ; $0CA626 |
  LDA #$9FA5                                ; $0CA628 |
  JSL r_gsu_init_1                          ; $0CA62B | GSU init
  LDX $12                                   ; $0CA62F |
  LDY !gsu_r1                               ; $0CA631 |
  BPL CODE_0CA651                           ; $0CA634 |
  PHY                                       ; $0CA636 |
  LDA #$0075                                ; $0CA637 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA63A |/
  PLY                                       ; $0CA63E |
  LDA #$FC00                                ; $0CA63F |
  STA !s_spr_y_speed_lo,x                   ; $0CA642 |
  LDA $7860,x                               ; $0CA645 |
  AND #$FFFE                                ; $0CA648 |
  STA $7860,x                               ; $0CA64B |
  JMP CODE_0CA50F                           ; $0CA64E |

CODE_0CA651:
  LDA $7860,x                               ; $0CA651 |
  BIT #$000C                                ; $0CA654 |
  BEQ CODE_0CA65C                           ; $0CA657 |
  JMP CODE_0CA4D6                           ; $0CA659 |

CODE_0CA65C:
  LDA !s_spr_hitbox_width,x                 ; $0CA65C |
  CLC                                       ; $0CA65F |
  ADC !s_spr_hitbox_width,y                 ; $0CA660 |
  STA $00                                   ; $0CA663 |
  LDA !s_spr_x_hitbox_center,x              ; $0CA665 |
  SEC                                       ; $0CA668 |
  SBC !s_spr_x_hitbox_center,y              ; $0CA669 |
  STA $02                                   ; $0CA66C |
  BPL CODE_0CA674                           ; $0CA66E |
  EOR #$FFFF                                ; $0CA670 |
  INC A                                     ; $0CA673 |

CODE_0CA674:
  CMP $00                                   ; $0CA674 |
  BCS CODE_0CA6D4                           ; $0CA676 |
  LDA !s_spr_hitbox_height,x                ; $0CA678 |
  CLC                                       ; $0CA67B |
  ADC !s_spr_hitbox_height,y                ; $0CA67C |
  STA $00                                   ; $0CA67F |
  LDA !s_spr_y_hitbox_center,x              ; $0CA681 |
  SEC                                       ; $0CA684 |
  SBC !s_spr_y_hitbox_center,y              ; $0CA685 |
  BPL CODE_0CA68E                           ; $0CA688 |
  EOR #$FFFF                                ; $0CA68A |
  INC A                                     ; $0CA68D |

CODE_0CA68E:
  CMP $00                                   ; $0CA68E |
  BCS CODE_0CA6C2                           ; $0CA690 |

CODE_0CA692:
  TYX                                       ; $0CA692 |
  JSL $03BF87                               ; $0CA693 |
  TXY                                       ; $0CA697 |
  LDX $12                                   ; $0CA698 |
  LDA #$000C                                ; $0CA69A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA69D |
  STZ !s_spr_x_speed_lo,x                   ; $0CA69F |
  STZ !s_spr_anim_frame,x                   ; $0CA6A2 |
  TYA                                       ; $0CA6A5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA6A6 |
  LDA $7860,y                               ; $0CA6A8 |
  AND #$FFFE                                ; $0CA6AB |
  STA $7860,y                               ; $0CA6AE |
  LDA $02                                   ; $0CA6B1 |
  ASL A                                     ; $0CA6B3 |
  ASL A                                     ; $0CA6B4 |
  ASL A                                     ; $0CA6B5 |
  ASL A                                     ; $0CA6B6 |
  STA !s_spr_x_speed_lo,y                   ; $0CA6B7 |
  LDA #$FE00                                ; $0CA6BA |
  STA !s_spr_y_speed_lo,y                   ; $0CA6BD |
  PLA                                       ; $0CA6C0 |
  RTL                                       ; $0CA6C1 |

CODE_0CA6C2:
  STZ !s_spr_x_speed_lo,x                   ; $0CA6C2 |
  LDA #$FC00                                ; $0CA6C5 |
  STA !s_spr_y_speed_lo,x                   ; $0CA6C8 |
  LDA #$0075                                ; $0CA6CB |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA6CE |/
  PLA                                       ; $0CA6D2 |
  RTL                                       ; $0CA6D3 |

CODE_0CA6D4:
  LDA !s_spr_x_hitbox_center,x              ; $0CA6D4 |
  SEC                                       ; $0CA6D7 |
  SBC !s_spr_x_hitbox_center,y              ; $0CA6D8 |
  AND #$8000                                ; $0CA6DB |
  ASL A                                     ; $0CA6DE |
  ROL A                                     ; $0CA6DF |
  ASL A                                     ; $0CA6E0 |
  STA !s_spr_facing_dir,x                   ; $0CA6E1 |
  TAY                                       ; $0CA6E4 |
  LDA $A218,y                               ; $0CA6E5 |
  STA !s_spr_x_speed_lo,x                   ; $0CA6E8 |

CODE_0CA6EB:
  LDA !s_spr_timer_2,x                      ; $0CA6EB |
  BNE CODE_0CA709                           ; $0CA6EE |
  SEP #$20                                  ; $0CA6F0 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CA6F2 |
  BPL CODE_0CA6FA                           ; $0CA6F4 |
  LDA #$02                                  ; $0CA6F6 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA6F8 |

CODE_0CA6FA:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CA6FA |
  LDA $A430,y                               ; $0CA6FC |
  STA !s_spr_anim_frame,x                   ; $0CA6FF |
  LDA #$02                                  ; $0CA702 |
  STA !s_spr_timer_2,x                      ; $0CA704 |
  REP #$20                                  ; $0CA707 |

CODE_0CA709:
  RTS                                       ; $0CA709 |

  LDX $12                                   ; $0CA70A |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA70C |
  LDA !s_spr_state,y                        ; $0CA70E |
  CMP #$0010                                ; $0CA711 |
  BNE CODE_0CA732                           ; $0CA714 |
  LDA !s_spr_id,y                           ; $0CA716 |
  CMP #$0022                                ; $0CA719 |
  BCC CODE_0CA732                           ; $0CA71C |
  CMP #$0026                                ; $0CA71E |
  BCS CODE_0CA732                           ; $0CA721 |
  LDA !s_spr_collision_state,y              ; $0CA723 |
  BNE CODE_0CA732                           ; $0CA726 |
  LDA !s_spr_wildcard_6_lo,y                ; $0CA728 |
  BNE CODE_0CA732                           ; $0CA72B |
  LDA !s_spr_gsu_morph_1_lo,y               ; $0CA72D |
  BEQ CODE_0CA752                           ; $0CA730 |

CODE_0CA732:
  LDA #$FFFF                                ; $0CA732 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA735 |
  PHY                                       ; $0CA737 |
  LDA #$0075                                ; $0CA738 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA73B |/
  PLY                                       ; $0CA73F |
  LDA #$FC00                                ; $0CA740 |
  STA !s_spr_y_speed_lo,x                   ; $0CA743 |
  LDA $7860,x                               ; $0CA746 |
  AND #$FFFE                                ; $0CA749 |
  STA $7860,x                               ; $0CA74C |
  JMP CODE_0CA50F                           ; $0CA74F |

CODE_0CA752:
  LDA !s_spr_y_speed_lo,y                   ; $0CA752 |
  BMI CODE_0CA78D                           ; $0CA755 |
  LDA !s_spr_hitbox_width,x                 ; $0CA757 |
  CLC                                       ; $0CA75A |
  ADC !s_spr_hitbox_width,y                 ; $0CA75B |
  STA $00                                   ; $0CA75E |
  LDA !s_spr_x_hitbox_center,x              ; $0CA760 |
  SEC                                       ; $0CA763 |
  SBC !s_spr_x_hitbox_center,y              ; $0CA764 |
  STA $02                                   ; $0CA767 |
  BPL CODE_0CA76F                           ; $0CA769 |
  EOR #$FFFF                                ; $0CA76B |
  INC A                                     ; $0CA76E |

CODE_0CA76F:
  CMP $00                                   ; $0CA76F |
  BCS CODE_0CA78D                           ; $0CA771 |
  LDA !s_spr_hitbox_height,x                ; $0CA773 |
  CLC                                       ; $0CA776 |
  ADC !s_spr_hitbox_height,y                ; $0CA777 |
  STA $00                                   ; $0CA77A |
  LDA !s_spr_y_hitbox_center,x              ; $0CA77C |
  SEC                                       ; $0CA77F |
  SBC !s_spr_y_hitbox_center,y              ; $0CA780 |
  BPL CODE_0CA789                           ; $0CA783 |
  EOR #$FFFF                                ; $0CA785 |
  INC A                                     ; $0CA788 |

CODE_0CA789:
  CMP $00                                   ; $0CA789 |
  BCC CODE_0CA78E                           ; $0CA78B |

CODE_0CA78D:
  RTS                                       ; $0CA78D |

CODE_0CA78E:
  LDA !s_spr_bitwise_settings_3,y           ; $0CA78E |
  AND #$FFE0                                ; $0CA791 |
  STA !s_spr_bitwise_settings_3,y           ; $0CA794 |
  LDA !s_spr_oam_1,y                        ; $0CA797 |
  AND #$FFF3                                ; $0CA79A |
  STA !s_spr_oam_1,y                        ; $0CA79D |
  LDA #$0001                                ; $0CA7A0 |
  STA !s_spr_gsu_morph_1_lo,y               ; $0CA7A3 |
  LDA #$0000                                ; $0CA7A6 |
  STA !s_spr_y_speed_lo,y                   ; $0CA7A9 |
  STA !s_spr_x_speed_lo,y                   ; $0CA7AC |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA7AF |
  STA !s_spr_x_pixel_pos,y                  ; $0CA7B2 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA7B5 |
  SEC                                       ; $0CA7B8 |
  SBC #$0010                                ; $0CA7B9 |
  STA !s_spr_y_pixel_pos,y                  ; $0CA7BC |

CODE_0CA7BF:
  LDA #$000E                                ; $0CA7BF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA7C2 |
  LDA !s_spr_x_player_dir,x                 ; $0CA7C4 |
  AND #$00FF                                ; $0CA7C7 |
  EOR #$0002                                ; $0CA7CA |
  STA !s_spr_facing_dir,x                   ; $0CA7CD |
  TAY                                       ; $0CA7D0 |
  LDA $A218,y                               ; $0CA7D1 |
  STA !s_spr_x_speed_lo,x                   ; $0CA7D4 |
  PLA                                       ; $0CA7D7 |
  RTL                                       ; $0CA7D8 |

  LDX $12                                   ; $0CA7D9 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CA7DB |
  LDA !s_spr_state,y                        ; $0CA7DD |
  CMP #$0010                                ; $0CA7E0 |
  BNE CODE_0CA7FC                           ; $0CA7E3 |
  LDA !s_spr_id,y                           ; $0CA7E5 |
  CMP #$0022                                ; $0CA7E8 |
  BCC CODE_0CA7FC                           ; $0CA7EB |
  CMP #$0026                                ; $0CA7ED |
  BCS CODE_0CA7FC                           ; $0CA7F0 |
  LDA !s_spr_collision_state,y              ; $0CA7F2 |
  BNE CODE_0CA7FC                           ; $0CA7F5 |
  LDA !s_spr_wildcard_6_lo,y                ; $0CA7F7 |
  BEQ CODE_0CA81F                           ; $0CA7FA |

CODE_0CA7FC:
  LDA #$FFFF                                ; $0CA7FC |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CA7FF |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CA801 |
  PHY                                       ; $0CA804 |
  LDA #$0075                                ; $0CA805 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA808 |/
  PLY                                       ; $0CA80C |
  LDA #$FC00                                ; $0CA80D |
  STA !s_spr_y_speed_lo,x                   ; $0CA810 |
  LDA $7860,x                               ; $0CA813 |
  AND #$FFFE                                ; $0CA816 |
  STA $7860,x                               ; $0CA819 |
  JMP CODE_0CA50F                           ; $0CA81C |

CODE_0CA81F:
  LDA #$0002                                ; $0CA81F |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CA822 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA825 |
  STA !s_spr_x_pixel_pos,y                  ; $0CA828 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CA82B |
  SEC                                       ; $0CA82E |
  SBC #$0010                                ; $0CA82F |
  STA !s_spr_y_pixel_pos,y                  ; $0CA832 |
  LDA $7860,x                               ; $0CA835 |
  BIT #$000C                                ; $0CA838 |
  BEQ CODE_0CA851                           ; $0CA83B |
  STZ !s_spr_anim_frame,x                   ; $0CA83D |
  LDA #$0004                                ; $0CA840 |
  STA !s_spr_timer_1,x                      ; $0CA843 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA846 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CA848 |
  LDA #$0006                                ; $0CA84A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA84D |
  PLA                                       ; $0CA84F |
  RTL                                       ; $0CA850 |

CODE_0CA851:
  LDA !s_spr_x_player_dir,x                 ; $0CA851 |
  AND #$00FF                                ; $0CA854 |
  EOR #$0002                                ; $0CA857 |
  STA !s_spr_facing_dir,x                   ; $0CA85A |
  TAY                                       ; $0CA85D |
  LDA $A218,y                               ; $0CA85E |
  STA !s_spr_x_speed_lo,x                   ; $0CA861 |
  JMP CODE_0CA6EB                           ; $0CA864 |

CODE_0CA867:
  LDA !s_spr_y_hitbox_center,x              ; $0CA867 |
  SEC                                       ; $0CA86A |
  SBC !s_player_center_y                    ; $0CA86B |
  CLC                                       ; $0CA86E |
  ADC #$0060                                ; $0CA86F |
  CMP #$00C0                                ; $0CA872 |
  BCS CODE_0CA887                           ; $0CA875 |
  LDA !s_spr_x_hitbox_center,x              ; $0CA877 |
  SEC                                       ; $0CA87A |
  SBC !s_player_center_x                    ; $0CA87B |
  CLC                                       ; $0CA87E |
  ADC #$0050                                ; $0CA87F |
  CMP #$00A0                                ; $0CA882 |
  BCC CODE_0CA888                           ; $0CA885 |

CODE_0CA887:
  RTS                                       ; $0CA887 |

CODE_0CA888:
  SEP #$20                                  ; $0CA888 |
  LDA #$02                                  ; $0CA88A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CA88C |
  TAY                                       ; $0CA88E |
  LDA $A430,y                               ; $0CA88F |
  STA !s_spr_anim_frame,x                   ; $0CA892 |
  LDA #$02                                  ; $0CA895 |
  STA !s_spr_timer_2,x                      ; $0CA897 |
  REP #$20                                  ; $0CA89A |
  LDA !s_spr_bitwise_settings_3,x           ; $0CA89C |
  AND #$F83F                                ; $0CA89F |
  ORA #$0480                                ; $0CA8A2 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA8A5 |
  LDA !s_spr_x_player_dir,x                 ; $0CA8A8 |
  AND #$00FF                                ; $0CA8AB |
  EOR #$0002                                ; $0CA8AE |
  STA !s_spr_facing_dir,x                   ; $0CA8B1 |
  TAY                                       ; $0CA8B4 |
  LDA $A218,y                               ; $0CA8B5 |
  STA !s_spr_x_speed_lo,x                   ; $0CA8B8 |
  LDA #$0004                                ; $0CA8BB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA8BE |
  PLA                                       ; $0CA8C0 |
  RTL                                       ; $0CA8C1 |

CODE_0CA8C2:
  LDA #$0022                                ; $0CA8C2 |
  STA !gsu_r14                              ; $0CA8C5 |
  LDA #$0026                                ; $0CA8C8 |
  STA !gsu_r11                              ; $0CA8CB |
  TXA                                       ; $0CA8CE |
  STA !gsu_r10                              ; $0CA8CF |
  LDX #$09                                  ; $0CA8D2 |
  LDA #$9FA5                                ; $0CA8D4 |
  JSL r_gsu_init_1                          ; $0CA8D7 | GSU init
  LDX $12                                   ; $0CA8DB |
  LDY !gsu_r1                               ; $0CA8DD |
  BPL CODE_0CA8E3                           ; $0CA8E0 |
  RTS                                       ; $0CA8E2 |

CODE_0CA8E3:
  LDA !s_spr_bitwise_settings_3,x           ; $0CA8E3 |
  AND #$F83F                                ; $0CA8E6 |
  ORA #$0480                                ; $0CA8E9 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA8EC |
  STZ !s_spr_x_speed_lo,x                   ; $0CA8EF |
  PHY                                       ; $0CA8F2 |
  LDA #$0075                                ; $0CA8F3 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CA8F6 |/
  PLY                                       ; $0CA8FA |
  LDA #$FC00                                ; $0CA8FB |
  STA !s_spr_y_speed_lo,x                   ; $0CA8FE |
  LDA !s_spr_x_hitbox_center,x              ; $0CA901 |
  SEC                                       ; $0CA904 |
  SBC !s_spr_x_hitbox_center,y              ; $0CA905 |
  AND #$8000                                ; $0CA908 |
  ASL A                                     ; $0CA90B |
  ROL A                                     ; $0CA90C |
  ASL A                                     ; $0CA90D |
  STA !s_spr_facing_dir,x                   ; $0CA90E |
  LDA #$000A                                ; $0CA911 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA914 |
  PLA                                       ; $0CA916 |
  RTL                                       ; $0CA917 |

init_little_mouser_from_nest:
  STZ !s_spr_facing_dir,x                   ; $0CA918 |
  LDY !r_header_bg1_tileset                 ; $0CA91B |
  CPY #$03                                  ; $0CA91E |
  BEQ CODE_0CA946                           ; $0CA920 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CA922 |
  ORA #$0141                                ; $0CA925 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA928 |
  LDA #$0004                                ; $0CA92B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA92E |
  SEP #$20                                  ; $0CA930 |
  LDA #$02                                  ; $0CA932 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CA934 |
  TAY                                       ; $0CA936 |
  LDA $AF00,y                               ; $0CA937 |
  STA !s_spr_anim_frame,x                   ; $0CA93A |
  LDA $AF03,y                               ; $0CA93D |
  STA !s_spr_timer_1,x                      ; $0CA940 |
  REP #$20                                  ; $0CA943 |
  RTL                                       ; $0CA945 |

CODE_0CA946:
  LDA !s_spr_bitwise_settings_3,x           ; $0CA946 |
  ORA #$0006                                ; $0CA949 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA94C |
  LDA !s_spr_x_pixel_pos,x                  ; $0CA94F |
  AND #$0010                                ; $0CA952 |
  LSR A                                     ; $0CA955 |
  LSR A                                     ; $0CA956 |
  LSR A                                     ; $0CA957 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CA958 |
  BNE CODE_0CA977                           ; $0CA95A |
  SEP #$20                                  ; $0CA95C |
  LDA #$01                                  ; $0CA95E |
  STA !s_spr_draw_priority,x                ; $0CA960 |
  LDA #$02                                  ; $0CA963 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CA965 |
  TAY                                       ; $0CA967 |
  LDA $A9E7,y                               ; $0CA968 |
  STA !s_spr_anim_frame,x                   ; $0CA96B |
  LDA $A9EA,y                               ; $0CA96E |
  STA !s_spr_timer_1,x                      ; $0CA971 |
  REP #$20                                  ; $0CA974 |
  RTL                                       ; $0CA976 |

CODE_0CA977:
  SEP #$20                                  ; $0CA977 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CA979 |
  AND #$CF                                  ; $0CA97C |
  STA !s_spr_oam_yxppccct,x                 ; $0CA97E |
  LDA #$FF                                  ; $0CA981 |
  STA !s_spr_draw_priority,x                ; $0CA983 |
  LDA #$0C                                  ; $0CA986 |
  STA !s_spr_anim_frame,x                   ; $0CA988 |
  REP #$20                                  ; $0CA98B |
  RTL                                       ; $0CA98D |

main_little_mouser_from_nest:
  LDA !s_spr_state,x                        ; $0CA98E |
  CMP #$0008                                ; $0CA991 |
  BNE CODE_0CA9A8                           ; $0CA994 |
  LDA #$0030                                ; $0CA996 |
  TXY                                       ; $0CA999 |
  JSL $03A377                               ; $0CA99A |
  SEP #$20                                  ; $0CA99E |
  LDA #$01                                  ; $0CA9A0 |
  STA !s_spr_wildcard_1_lo,x                ; $0CA9A2 |
  REP #$20                                  ; $0CA9A5 |
  RTL                                       ; $0CA9A7 |

CODE_0CA9A8:
  CMP #$0010                                ; $0CA9A8 |
  BNE CODE_0CA9BB                           ; $0CA9AB |
  LDA !s_spr_timer_frozen,x                 ; $0CA9AD |
  BEQ CODE_0CA9BB                           ; $0CA9B0 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CA9B2 |
  AND #$FFE0                                ; $0CA9B5 |
  STA !s_spr_bitwise_settings_3,x           ; $0CA9B8 |

CODE_0CA9BB:
  JSL $03AF23                               ; $0CA9BB |
  JSR CODE_0CB29D                           ; $0CA9BF |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CA9C2 |
  TAX                                       ; $0CA9C4 |
  JMP ($A9C8,x)                             ; $0CA9C5 |

  dw $A9CE                                  ; $0CA9C8 |
  dw $AC25                                  ; $0CA9CA |
  dw $AEE1                                  ; $0CA9CC |

  LDX $12                                   ; $0CA9CE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CA9D0 |
  TYX                                       ; $0CA9D2 |
  JMP ($A9D7,x)                             ; $0CA9D3 |
  RTL                                       ; $0CA9D6 |

  dw $A9ED                                  ; $0CA9D7 |
  dw $AA27                                  ; $0CA9D9 |
  dw $AA63                                  ; $0CA9DB |
  dw $AAF0                                  ; $0CA9DD |
  dw $AB3F                                  ; $0CA9DF |
  dw $AB5B                                  ; $0CA9E1 |
  dw $AB99                                  ; $0CA9E3 |
  dw $B1CF                                  ; $0CA9E5 |

  db $06, $05, $16                          ; $0CA9E7 |

  db $03, $14, $40                          ; $0CA9EA |

  LDX $12                                   ; $0CA9ED |
  LDA !s_spr_timer_1,x                      ; $0CA9EF |
  BNE CODE_0CAA0A                           ; $0CA9F2 |
  SEP #$20                                  ; $0CA9F4 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CA9F6 |
  BMI CODE_0CAA0B                           ; $0CA9F8 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CA9FA |
  LDA $A9E7,y                               ; $0CA9FC |
  STA !s_spr_anim_frame,x                   ; $0CA9FF |
  LDA $A9EA,y                               ; $0CAA02 |
  STA !s_spr_timer_1,x                      ; $0CAA05 |
  REP #$20                                  ; $0CAA08 |

CODE_0CAA0A:
  RTL                                       ; $0CAA0A |

CODE_0CAA0B:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAA0B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAA0D |
  LDA #$07                                  ; $0CAA0F |
  STA !s_spr_anim_frame,x                   ; $0CAA11 |
  REP #$20                                  ; $0CAA14 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CAA16 |
  SEC                                       ; $0CAA19 |
  SBC #$000A                                ; $0CAA1A |
  STA !s_spr_y_pixel_pos,x                  ; $0CAA1D |
  LDA #$FD00                                ; $0CAA20 |
  STA !s_spr_y_speed_lo,x                   ; $0CAA23 |
  RTL                                       ; $0CAA26 |

  LDX $12                                   ; $0CAA27 |
  REP #$10                                  ; $0CAA29 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CAA2B |
  TAX                                       ; $0CAA2E |
  LDA $700026,x                             ; $0CAA2F |
  SEP #$10                                  ; $0CAA33 |
  LDX $12                                   ; $0CAA35 |
  CMP #$0100                                ; $0CAA37 |
  BCC CODE_0CAA62                           ; $0CAA3A |
  CMP #$0103                                ; $0CAA3C |
  BCC CODE_0CAA46                           ; $0CAA3F |
  CMP #$010A                                ; $0CAA41 |
  BNE CODE_0CAA62                           ; $0CAA44 |

CODE_0CAA46:
  LDA !s_spr_y_speed_lo,x                   ; $0CAA46 |
  CMP #$8000                                ; $0CAA49 |
  ROR A                                     ; $0CAA4C |
  STA !s_spr_y_speed_lo,x                   ; $0CAA4D |
  SEP #$20                                  ; $0CAA50 |
  LDA #$08                                  ; $0CAA52 |
  STA !s_spr_anim_frame,x                   ; $0CAA54 |
  LDA #$03                                  ; $0CAA57 |
  STA !s_spr_timer_1,x                      ; $0CAA59 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAA5C |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAA5E |
  REP #$20                                  ; $0CAA60 |

CODE_0CAA62:
  RTL                                       ; $0CAA62 |

  LDX $12                                   ; $0CAA63 |
  LDA !s_spr_timer_1,x                      ; $0CAA65 |
  BNE CODE_0CAA70                           ; $0CAA68 |
  LDA #$0009                                ; $0CAA6A |
  STA !s_spr_anim_frame,x                   ; $0CAA6D |

CODE_0CAA70:
  REP #$10                                  ; $0CAA70 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CAA72 |
  TAX                                       ; $0CAA75 |
  LDA $700026,x                             ; $0CAA76 |
  SEP #$10                                  ; $0CAA7A |
  LDX $12                                   ; $0CAA7C |
  CMP #$0028                                ; $0CAA7E |
  BCC CODE_0CAACE                           ; $0CAA81 |
  CMP #$002B                                ; $0CAA83 |
  BCC CODE_0CAA8D                           ; $0CAA86 |
  CMP #$002D                                ; $0CAA88 |
  BNE CODE_0CAACE                           ; $0CAA8B |

CODE_0CAA8D:
  LDA !s_spr_bitwise_settings_1,x           ; $0CAA8D |
  AND #$FF9F                                ; $0CAA90 |
  STA !s_spr_bitwise_settings_1,x           ; $0CAA93 |
  LDA !s_spr_oam_1,x                        ; $0CAA96 |
  ORA #$0150                                ; $0CAA99 |
  STA !s_spr_oam_1,x                        ; $0CAA9C |
  LDA $10                                   ; $0CAA9F |
  AND #$0001                                ; $0CAAA1 |
  BNE CODE_0CAACF                           ; $0CAAA4 |

CODE_0CAAA6:
  STZ !s_spr_y_speed_lo,x                   ; $0CAAA6 |
  SEP #$20                                  ; $0CAAA9 |
  LDA #$05                                  ; $0CAAAB |
  STA !s_spr_draw_priority,x                ; $0CAAAD |
  LDA #$03                                  ; $0CAAB0 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAAB2 |
  TAY                                       ; $0CAAB4 |
  LDA $AAE4,y                               ; $0CAAB5 |
  STA !s_spr_anim_frame,x                   ; $0CAAB8 |
  LDA $AAE8,y                               ; $0CAABB |
  STA !s_spr_timer_1,x                      ; $0CAABE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAAC1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAAC3 |
  REP #$20                                  ; $0CAAC5 |
  LDA #$0075                                ; $0CAAC7 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CAACA |/

CODE_0CAACE:
  RTL                                       ; $0CAACE |

CODE_0CAACF:
  SEP #$20                                  ; $0CAACF |
  LDA #$07                                  ; $0CAAD1 |
  STA !s_spr_draw_priority,x                ; $0CAAD3 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CAAD6 |
  CLC                                       ; $0CAAD8 |
  ADC #$04                                  ; $0CAAD9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CAADB |
  REP #$20                                  ; $0CAADD |
  RTL                                       ; $0CAADF |

  db $00, $00, $00, $01, $00, $00, $00, $0B ; $0CAAE0 |

  db $24, $10, $24, $03, $02, $02, $00, $00 ; $0CAAE8 |

  LDX $12                                   ; $0CAAF0 |
  LDA !s_spr_timer_1,x                      ; $0CAAF2 |
  BNE CODE_0CAB16                           ; $0CAAF5 |
  SEP #$20                                  ; $0CAAF7 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAAF9 |
  BMI CODE_0CAB17                           ; $0CAAFB |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAAFD |
  LDA $AAE4,y                               ; $0CAAFF |
  STA !s_spr_anim_frame,x                   ; $0CAB02 |
  LDA $AAE8,y                               ; $0CAB05 |
  STA !s_spr_timer_1,x                      ; $0CAB08 |
  LDA !s_spr_facing_dir,x                   ; $0CAB0B |
  EOR $AAEC,y                               ; $0CAB0E |
  STA !s_spr_facing_dir,x                   ; $0CAB11 |
  REP #$20                                  ; $0CAB14 |

CODE_0CAB16:
  RTL                                       ; $0CAB16 |

CODE_0CAB17:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB17 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB19 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CAB1B |
  ORA #$60                                  ; $0CAB1E |
  STA !s_spr_bitwise_settings_1,x           ; $0CAB20 |
  LDA #$07                                  ; $0CAB23 |
  STA !s_spr_draw_priority,x                ; $0CAB25 |
  LDA #$09                                  ; $0CAB28 |
  STA !s_spr_anim_frame,x                   ; $0CAB2A |
  REP #$20                                  ; $0CAB2D |
  LDA !s_spr_oam_1,x                        ; $0CAB2F |
  AND #$FEAF                                ; $0CAB32 |
  STA !s_spr_oam_1,x                        ; $0CAB35 |
  LDA #$FE80                                ; $0CAB38 |
  STA !s_spr_y_speed_lo,x                   ; $0CAB3B |
  RTL                                       ; $0CAB3E |

  LDX $12                                   ; $0CAB3F |
  SEP #$20                                  ; $0CAB41 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CAB43 |
  ORA #$60                                  ; $0CAB46 |
  STA !s_spr_bitwise_settings_1,x           ; $0CAB48 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB4B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB4D |
  REP #$20                                  ; $0CAB4F |
  LDA !s_spr_oam_1,x                        ; $0CAB51 |
  AND #$FEAF                                ; $0CAB54 |
  STA !s_spr_oam_1,x                        ; $0CAB57 |
  RTL                                       ; $0CAB5A |

  LDX $12                                   ; $0CAB5B |
  REP #$10                                  ; $0CAB5D |
  LDA !s_spr_wildcard_2_lo,x                ; $0CAB5F |
  TAX                                       ; $0CAB62 |
  LDA $700006,x                             ; $0CAB63 |
  SEP #$10                                  ; $0CAB67 |
  LDX $12                                   ; $0CAB69 |
  CMP #$0028                                ; $0CAB6B |
  BCC CODE_0CAB7A                           ; $0CAB6E |
  CMP #$002B                                ; $0CAB70 |
  BCC CODE_0CAB98                           ; $0CAB73 |
  CMP #$002D                                ; $0CAB75 |
  BEQ CODE_0CAB98                           ; $0CAB78 |

CODE_0CAB7A:
  STZ !s_spr_y_speed_lo,x                   ; $0CAB7A |
  SEP #$20                                  ; $0CAB7D |
  LDA #$0A                                  ; $0CAB7F |
  STA !s_spr_anim_frame,x                   ; $0CAB81 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CAB84 |
  AND #$CF                                  ; $0CAB87 |
  STA !s_spr_oam_yxppccct,x                 ; $0CAB89 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB8C |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAB8E |
  REP #$20                                  ; $0CAB90 |
  LDA #$0300                                ; $0CAB92 |
  STA !s_spr_y_speed_lo,x                   ; $0CAB95 |

CODE_0CAB98:
  RTL                                       ; $0CAB98 |

  LDX $12                                   ; $0CAB99 |
  JSR CODE_0CB21B                           ; $0CAB9B |
  BMI CODE_0CAB98                           ; $0CAB9E |
  BEQ CODE_0CAB98                           ; $0CABA0 |
  LDA !s_spr_hitbox_width,x                 ; $0CABA2 |
  CLC                                       ; $0CABA5 |
  ADC !s_spr_hitbox_width,y                 ; $0CABA6 |
  STA $00                                   ; $0CABA9 |
  LDA !s_spr_x_hitbox_center,x              ; $0CABAB |
  SEC                                       ; $0CABAE |
  SBC !s_spr_x_hitbox_center,y              ; $0CABAF |
  BPL CODE_0CABB8                           ; $0CABB2 |
  EOR #$FFFF                                ; $0CABB4 |
  INC A                                     ; $0CABB7 |

CODE_0CABB8:
  CMP $00                                   ; $0CABB8 |
  BCS CODE_0CAC24                           ; $0CABBA |
  LDA !s_spr_hitbox_height,x                ; $0CABBC |
  CLC                                       ; $0CABBF |
  ADC !s_spr_hitbox_height,y                ; $0CABC0 |
  STA $00                                   ; $0CABC3 |
  LDA !s_spr_y_hitbox_center,x              ; $0CABC5 |
  SEC                                       ; $0CABC8 |
  SBC !s_spr_y_hitbox_center,y              ; $0CABC9 |
  BPL CODE_0CABD2                           ; $0CABCC |
  EOR #$FFFF                                ; $0CABCE |
  INC A                                     ; $0CABD1 |

CODE_0CABD2:
  CMP $00                                   ; $0CABD2 |
  BCS CODE_0CAC24                           ; $0CABD4 |
  STZ !s_spr_y_speed_lo,x                   ; $0CABD6 |
  LDA !s_spr_y_pixel_pos,y                  ; $0CABD9 |
  STA !s_spr_y_pixel_pos,x                  ; $0CABDC |
  LDA $10                                   ; $0CABDF |
  AND #$0001                                ; $0CABE1 |
  ASL A                                     ; $0CABE4 |
  TAY                                       ; $0CABE5 |
  LDA $B1A3,y                               ; $0CABE6 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CABE9 |
  STA $00                                   ; $0CABEC |
  LDA $B1A7,y                               ; $0CABEE |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CABF1 |
  STA $02                                   ; $0CABF4 |
  JSL random_number_gen                     ; $0CABF6 |
  SEP #$20                                  ; $0CABFA |
  LDA #$FF                                  ; $0CABFC |
  STA !s_spr_draw_priority,x                ; $0CABFE |
  LDA !s_spr_oam_yxppccct,x                 ; $0CAC01 |
  ORA #$20                                  ; $0CAC04 |
  STA !s_spr_oam_yxppccct,x                 ; $0CAC06 |
  LDA $B19F,y                               ; $0CAC09 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAC0C |
  TAY                                       ; $0CAC0E |
  LDA ($00),y                               ; $0CAC0F |
  STA !s_spr_anim_frame,x                   ; $0CAC11 |
  LDA $10                                   ; $0CAC14 |
  AND #$1F                                  ; $0CAC16 |
  CLC                                       ; $0CAC18 |
  ADC #$20                                  ; $0CAC19 |
  STA !s_spr_timer_1,x                      ; $0CAC1B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAC1E |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAC20 |
  REP #$20                                  ; $0CAC22 |

CODE_0CAC24:
  RTL                                       ; $0CAC24 |

  LDX $12                                   ; $0CAC25 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CAC27 |
  TYX                                       ; $0CAC29 |
  JMP ($AC2D,x)                             ; $0CAC2A |

  dw $AC3F                                  ; $0CAC2D |
  dw $ACC1                                  ; $0CAC2F |
  dw $AD09                                  ; $0CAC31 |
  dw $AD56                                  ; $0CAC33 |
  dw $AB3F                                  ; $0CAC35 |
  dw $ADA5                                  ; $0CAC37 |
  dw $ADD8                                  ; $0CAC39 |
  dw $AE3B                                  ; $0CAC3B |
  dw $AE90                                  ; $0CAC3D |

  LDX $12                                   ; $0CAC3F |
  LDA !s_spr_timer_1,x                      ; $0CAC41 |
  BEQ CODE_0CAC47                           ; $0CAC44 |
  RTL                                       ; $0CAC46 |

CODE_0CAC47:
  LDA #$FD00                                ; $0CAC47 |
  STA !s_spr_y_speed_lo,x                   ; $0CAC4A |
  JSR CODE_0CB21B                           ; $0CAC4D |
  BMI CODE_0CAC91                           ; $0CAC50 |
  BEQ CODE_0CAC91                           ; $0CAC52 |
  LDA !s_spr_hitbox_width,x                 ; $0CAC54 |
  CLC                                       ; $0CAC57 |
  ADC !s_spr_hitbox_width,y                 ; $0CAC58 |
  STA $00                                   ; $0CAC5B |
  LDA !s_spr_x_hitbox_center,x              ; $0CAC5D |
  SEC                                       ; $0CAC60 |
  SBC !s_spr_x_hitbox_center,y              ; $0CAC61 |
  BPL CODE_0CAC6A                           ; $0CAC64 |
  EOR #$FFFF                                ; $0CAC66 |
  INC A                                     ; $0CAC69 |

CODE_0CAC6A:
  CMP $00                                   ; $0CAC6A |
  BCS CODE_0CAC88                           ; $0CAC6C |
  LDA !s_spr_hitbox_height,x                ; $0CAC6E |
  CLC                                       ; $0CAC71 |
  ADC !s_spr_hitbox_height,y                ; $0CAC72 |
  STA $00                                   ; $0CAC75 |
  LDA !s_spr_y_hitbox_center,x              ; $0CAC77 |
  SEC                                       ; $0CAC7A |
  SBC !s_spr_y_hitbox_center,y              ; $0CAC7B |
  BPL CODE_0CAC84                           ; $0CAC7E |
  EOR #$FFFF                                ; $0CAC80 |
  INC A                                     ; $0CAC83 |

CODE_0CAC84:
  CMP $00                                   ; $0CAC84 |
  BCC CODE_0CAC91                           ; $0CAC86 |

CODE_0CAC88:
  SEP #$20                                  ; $0CAC88 |
  LDA #$07                                  ; $0CAC8A |
  STA !s_spr_draw_priority,x                ; $0CAC8C |
  REP #$20                                  ; $0CAC8F |

CODE_0CAC91:
  REP #$10                                  ; $0CAC91 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CAC93 |
  TAX                                       ; $0CAC96 |
  LDA $700006,x                             ; $0CAC97 |
  SEP #$10                                  ; $0CAC9B |
  LDX $12                                   ; $0CAC9D |
  CMP #$0000                                ; $0CAC9F |
  BNE CODE_0CACC0                           ; $0CACA2 |
  SEP #$20                                  ; $0CACA4 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CACA6 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CACA8 |
  LDA #$03                                  ; $0CACAA |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CACAC |
  TAY                                       ; $0CACAE |
  LDA $AAE0,y                               ; $0CACAF |
  STA !s_spr_anim_frame,x                   ; $0CACB2 |
  LDA $AAE8,y                               ; $0CACB5 |
  STA !s_spr_timer_1,x                      ; $0CACB8 |
  REP #$20                                  ; $0CACBB |
  STZ !s_spr_y_speed_lo,x                   ; $0CACBD |

CODE_0CACC0:
  RTL                                       ; $0CACC0 |

  LDX $12                                   ; $0CACC1 |
  LDA !s_spr_timer_1,x                      ; $0CACC3 |
  BNE CODE_0CACE7                           ; $0CACC6 |
  SEP #$20                                  ; $0CACC8 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CACCA |
  BMI CODE_0CACE8                           ; $0CACCC |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CACCE |
  LDA $AAE0,y                               ; $0CACD0 |
  STA !s_spr_anim_frame,x                   ; $0CACD3 |
  LDA $AAE8,y                               ; $0CACD6 |
  STA !s_spr_timer_1,x                      ; $0CACD9 |
  LDA !s_spr_facing_dir,x                   ; $0CACDC |
  EOR $AAEC,y                               ; $0CACDF |
  STA !s_spr_facing_dir,x                   ; $0CACE2 |
  REP #$20                                  ; $0CACE5 |

CODE_0CACE7:
  RTL                                       ; $0CACE7 |

CODE_0CACE8:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CACE8 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CACEA |
  LDA #$0D                                  ; $0CACEC |
  STA !s_spr_anim_frame,x                   ; $0CACEE |
  LDA !s_spr_oam_yxppccct,x                 ; $0CACF1 |
  ORA #$20                                  ; $0CACF4 |
  STA !s_spr_oam_yxppccct,x                 ; $0CACF6 |
  REP #$20                                  ; $0CACF9 |
  LDA #$0180                                ; $0CACFB |
  STA !s_spr_y_speed_lo,x                   ; $0CACFE |
  LDA #$0075                                ; $0CAD01 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CAD04 |/
  RTL                                       ; $0CAD08 |

  LDX $12                                   ; $0CAD09 |
  REP #$10                                  ; $0CAD0B |
  LDA !s_spr_wildcard_2_lo,x                ; $0CAD0D |
  TAX                                       ; $0CAD10 |
  LDA $700026,x                             ; $0CAD11 |
  SEP #$10                                  ; $0CAD15 |
  LDX $12                                   ; $0CAD17 |
  CMP #$0100                                ; $0CAD19 |
  BCC CODE_0CAD44                           ; $0CAD1C |
  CMP #$0103                                ; $0CAD1E |
  BCC CODE_0CAD28                           ; $0CAD21 |
  CMP #$010A                                ; $0CAD23 |
  BNE CODE_0CAD44                           ; $0CAD26 |

CODE_0CAD28:
  LDA !s_spr_bitwise_settings_1,x           ; $0CAD28 |
  AND #$FF9F                                ; $0CAD2B |
  STA !s_spr_bitwise_settings_1,x           ; $0CAD2E |
  LDA !s_spr_oam_1,x                        ; $0CAD31 |
  ORA #$0150                                ; $0CAD34 |
  STA !s_spr_oam_1,x                        ; $0CAD37 |
  LDA $10                                   ; $0CAD3A |
  AND #$0001                                ; $0CAD3C |
  BNE CODE_0CAD45                           ; $0CAD3F |
  JMP CODE_0CAAA6                           ; $0CAD41 |

CODE_0CAD44:
  RTL                                       ; $0CAD44 |

CODE_0CAD45:
  SEP #$20                                  ; $0CAD45 |
  LDA #$01                                  ; $0CAD47 |
  STA !s_spr_draw_priority,x                ; $0CAD49 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CAD4C |
  CLC                                       ; $0CAD4E |
  ADC #$04                                  ; $0CAD4F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CAD51 |
  REP #$20                                  ; $0CAD53 |
  RTL                                       ; $0CAD55 |

  LDX $12                                   ; $0CAD56 |
  LDA !s_spr_timer_1,x                      ; $0CAD58 |
  BNE CODE_0CAD7C                           ; $0CAD5B |
  SEP #$20                                  ; $0CAD5D |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAD5F |
  BMI CODE_0CAD7D                           ; $0CAD61 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAD63 |
  LDA $AAE4,y                               ; $0CAD65 |
  STA !s_spr_anim_frame,x                   ; $0CAD68 |
  LDA $AAE8,y                               ; $0CAD6B |
  STA !s_spr_timer_1,x                      ; $0CAD6E |
  LDA !s_spr_facing_dir,x                   ; $0CAD71 |
  EOR $AAEC,y                               ; $0CAD74 |
  STA !s_spr_facing_dir,x                   ; $0CAD77 |
  REP #$20                                  ; $0CAD7A |

CODE_0CAD7C:
  RTL                                       ; $0CAD7C |

CODE_0CAD7D:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAD7D |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAD7F |
  LDA !s_spr_bitwise_settings_1,x           ; $0CAD81 |
  ORA #$60                                  ; $0CAD84 |
  STA !s_spr_bitwise_settings_1,x           ; $0CAD86 |
  LDA #$01                                  ; $0CAD89 |
  STA !s_spr_draw_priority,x                ; $0CAD8B |
  LDA #$0D                                  ; $0CAD8E |
  STA !s_spr_anim_frame,x                   ; $0CAD90 |
  REP #$20                                  ; $0CAD93 |
  LDA !s_spr_oam_1,x                        ; $0CAD95 |
  AND #$FEAF                                ; $0CAD98 |
  STA !s_spr_oam_1,x                        ; $0CAD9B |
  LDA #$0180                                ; $0CAD9E |
  STA !s_spr_y_speed_lo,x                   ; $0CADA1 |
  RTL                                       ; $0CADA4 |

  LDX $12                                   ; $0CADA5 |
  REP #$10                                  ; $0CADA7 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CADA9 |
  TAX                                       ; $0CADAC |
  LDA $700026,x                             ; $0CADAD |
  SEP #$10                                  ; $0CADB1 |
  LDX $12                                   ; $0CADB3 |
  CMP #$0100                                ; $0CADB5 |
  BCC CODE_0CADC4                           ; $0CADB8 |
  CMP #$0103                                ; $0CADBA |
  BCC CODE_0CADD7                           ; $0CADBD |
  CMP #$010A                                ; $0CADBF |
  BEQ CODE_0CADD7                           ; $0CADC2 |

CODE_0CADC4:
  LDA #$0300                                ; $0CADC4 |
  STA !s_spr_y_speed_lo,x                   ; $0CADC7 |
  SEP #$20                                  ; $0CADCA |
  LDA #$0E                                  ; $0CADCC |
  STA !s_spr_anim_frame,x                   ; $0CADCE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CADD1 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CADD3 |
  REP #$20                                  ; $0CADD5 |

CODE_0CADD7:
  RTL                                       ; $0CADD7 |

  LDX $12                                   ; $0CADD8 |
  JSR CODE_0CB21B                           ; $0CADDA |
  BMI CODE_0CAE3A                           ; $0CADDD |
  BEQ CODE_0CAE3A                           ; $0CADDF |
  LDA !s_spr_hitbox_width,x                 ; $0CADE1 |
  CLC                                       ; $0CADE4 |
  ADC !s_spr_hitbox_width,y                 ; $0CADE5 |
  STA $00                                   ; $0CADE8 |
  LDA !s_spr_x_hitbox_center,x              ; $0CADEA |
  SEC                                       ; $0CADED |
  SBC !s_spr_x_hitbox_center,y              ; $0CADEE |
  BPL CODE_0CADF7                           ; $0CADF1 |
  EOR #$FFFF                                ; $0CADF3 |
  INC A                                     ; $0CADF6 |

CODE_0CADF7:
  CMP $00                                   ; $0CADF7 |
  BCS CODE_0CAE3A                           ; $0CADF9 |
  LDA !s_spr_hitbox_height,x                ; $0CADFB |
  CLC                                       ; $0CADFE |
  ADC !s_spr_hitbox_height,y                ; $0CADFF |
  STA $00                                   ; $0CAE02 |
  LDA !s_spr_y_hitbox_center,x              ; $0CAE04 |
  SEC                                       ; $0CAE07 |
  SBC !s_spr_y_hitbox_center,y              ; $0CAE08 |
  BPL CODE_0CAE11                           ; $0CAE0B |
  EOR #$FFFF                                ; $0CAE0D |
  INC A                                     ; $0CAE10 |

CODE_0CAE11:
  CMP $00                                   ; $0CAE11 |
  BCS CODE_0CAE3A                           ; $0CAE13 |
  STZ !s_spr_y_speed_lo,x                   ; $0CAE15 |
  LDA !s_spr_x_pixel_pos,y                  ; $0CAE18 |
  STA !s_spr_x_pixel_pos,x                  ; $0CAE1B |
  LDA !s_spr_y_pixel_pos,y                  ; $0CAE1E |
  STA !s_spr_y_pixel_pos,x                  ; $0CAE21 |
  SEP #$20                                  ; $0CAE24 |
  LDA #$01                                  ; $0CAE26 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAE28 |
  LDA #$0F                                  ; $0CAE2A |
  STA !s_spr_anim_frame,x                   ; $0CAE2C |
  LDA #$03                                  ; $0CAE2F |
  STA !s_spr_timer_1,x                      ; $0CAE31 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAE34 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAE36 |
  REP #$20                                  ; $0CAE38 |

CODE_0CAE3A:
  RTL                                       ; $0CAE3A |

  LDX $12                                   ; $0CAE3B |
  LDA !s_spr_timer_1,x                      ; $0CAE3D |
  BNE CODE_0CAE54                           ; $0CAE40 |
  SEP #$20                                  ; $0CAE42 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAE44 |
  BMI CODE_0CAE55                           ; $0CAE46 |
  LDA #$10                                  ; $0CAE48 |
  STA !s_spr_anim_frame,x                   ; $0CAE4A |
  LDA #$03                                  ; $0CAE4D |
  STA !s_spr_timer_1,x                      ; $0CAE4F |
  REP #$20                                  ; $0CAE52 |

CODE_0CAE54:
  RTL                                       ; $0CAE54 |

CODE_0CAE55:
  REP #$20                                  ; $0CAE55 |
  LDA $10                                   ; $0CAE57 |
  AND #$0001                                ; $0CAE59 |
  ASL A                                     ; $0CAE5C |
  TAY                                       ; $0CAE5D |
  LDA $B1A3,y                               ; $0CAE5E |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CAE61 |
  STA $00                                   ; $0CAE64 |
  LDA $B1A7,y                               ; $0CAE66 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CAE69 |
  STA $02                                   ; $0CAE6C |
  JSL random_number_gen                     ; $0CAE6E |
  SEP #$20                                  ; $0CAE72 |
  LDA $B19F,y                               ; $0CAE74 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAE77 |
  TAY                                       ; $0CAE79 |
  LDA ($00),y                               ; $0CAE7A |
  STA !s_spr_anim_frame,x                   ; $0CAE7C |
  LDA $10                                   ; $0CAE7F |
  AND #$1F                                  ; $0CAE81 |
  CLC                                       ; $0CAE83 |
  ADC #$20                                  ; $0CAE84 |
  STA !s_spr_timer_1,x                      ; $0CAE86 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAE89 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAE8B |
  REP #$20                                  ; $0CAE8D |
  RTL                                       ; $0CAE8F |

  LDX $12                                   ; $0CAE90 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CAE92 |
  STA $00                                   ; $0CAE95 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CAE97 |
  STA $02                                   ; $0CAE9A |
  LDA !s_spr_timer_1,x                      ; $0CAE9C |
  BNE CODE_0CAED1                           ; $0CAE9F |
  SEP #$20                                  ; $0CAEA1 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAEA3 |
  BPL CODE_0CAED2                           ; $0CAEA5 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CAEA7 |
  AND #$CF                                  ; $0CAEAA |
  STA !s_spr_oam_yxppccct,x                 ; $0CAEAC |
  LDA #$FF                                  ; $0CAEAF |
  STA !s_spr_draw_priority,x                ; $0CAEB1 |
  LDA #$0C                                  ; $0CAEB4 |
  STA !s_spr_anim_frame,x                   ; $0CAEB6 |
  LDA $10                                   ; $0CAEB9 |
  AND #$1F                                  ; $0CAEBB |
  CLC                                       ; $0CAEBD |
  ADC #$20                                  ; $0CAEBE |
  STA !s_spr_timer_1,x                      ; $0CAEC0 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CAEC3 |
  REP #$20                                  ; $0CAEC5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CAEC7 |
  SEC                                       ; $0CAECA |
  SBC #$0010                                ; $0CAECB |
  STA !s_spr_y_pixel_pos,x                  ; $0CAECE |

CODE_0CAED1:
  RTL                                       ; $0CAED1 |

CODE_0CAED2:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAED2 |
  LDA ($00),y                               ; $0CAED4 |
  STA !s_spr_anim_frame,x                   ; $0CAED6 |
  LDA ($02),y                               ; $0CAED9 |
  STA !s_spr_timer_1,x                      ; $0CAEDB |
  REP #$20                                  ; $0CAEDE |
  RTL                                       ; $0CAEE0 |

  LDX $12                                   ; $0CAEE1 |
  JSR CODE_0CB2C2                           ; $0CAEE3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CAEE6 |
  TYX                                       ; $0CAEE8 |
  JMP ($AEEC,x)                             ; $0CAEE9 |

  dw $AF06                                  ; $0CAEEC |
  dw $AF5B                                  ; $0CAEEE |
  dw $AF95                                  ; $0CAEF0 |
  dw $AFDD                                  ; $0CAEF2 |
  dw $B05A                                  ; $0CAEF4 |
  dw $B091                                  ; $0CAEF6 |
  dw $B0ED                                  ; $0CAEF8 |
  dw $B125                                  ; $0CAEFA |
  dw $B131                                  ; $0CAEFC |
  dw $B1CF                                  ; $0CAEFE |

  db $15, $14, $16                          ; $0CAF00 |

  db $04, $04, $40                          ; $0CAF03 |

  LDX $12                                   ; $0CAF06 |
  LDA !s_spr_timer_1,x                      ; $0CAF08 |
  BNE CODE_0CAF23                           ; $0CAF0B |
  SEP #$20                                  ; $0CAF0D |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAF0F |
  BMI CODE_0CAF24                           ; $0CAF11 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAF13 |
  LDA $AF00,y                               ; $0CAF15 |
  STA !s_spr_anim_frame,x                   ; $0CAF18 |
  LDA $AF03,y                               ; $0CAF1B |
  STA !s_spr_timer_1,x                      ; $0CAF1E |
  REP #$20                                  ; $0CAF21 |

CODE_0CAF23:
  RTL                                       ; $0CAF23 |

CODE_0CAF24:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAF24 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAF26 |
  LDA #$0D                                  ; $0CAF28 |
  STA !s_spr_anim_frame,x                   ; $0CAF2A |
  LDA #$04                                  ; $0CAF2D |
  STA !s_spr_timer_1,x                      ; $0CAF2F |
  LDA #$05                                  ; $0CAF32 |
  STA !s_spr_draw_priority,x                ; $0CAF34 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CAF37 |
  AND #$9F                                  ; $0CAF3A |
  STA !s_spr_bitwise_settings_1,x           ; $0CAF3C |
  REP #$20                                  ; $0CAF3F |
  LDA !s_spr_oam_1,x                        ; $0CAF41 |
  ORA #$0150                                ; $0CAF44 |
  STA !s_spr_oam_1,x                        ; $0CAF47 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CAF4A |
  CLC                                       ; $0CAF4D |
  ADC #$0002                                ; $0CAF4E |
  STA !s_spr_y_pixel_pos,x                  ; $0CAF51 |
  LDA #$0400                                ; $0CAF54 |
  STA !s_spr_y_speed_lo,x                   ; $0CAF57 |
  RTL                                       ; $0CAF5A |

  LDX $12                                   ; $0CAF5B |
  LDA !s_spr_timer_1,x                      ; $0CAF5D |
  BNE CODE_0CAF72                           ; $0CAF60 |
  SEP #$20                                  ; $0CAF62 |
  LDA $7860,x                               ; $0CAF64 |
  AND #$01                                  ; $0CAF67 |
  BNE CODE_0CAF73                           ; $0CAF69 |
  LDA #$0E                                  ; $0CAF6B |
  STA !s_spr_anim_frame,x                   ; $0CAF6D |
  REP #$20                                  ; $0CAF70 |

CODE_0CAF72:
  RTL                                       ; $0CAF72 |

CODE_0CAF73:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAF73 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAF75 |
  LDA #$01                                  ; $0CAF77 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAF79 |
  TAY                                       ; $0CAF7B |
  LDA $AF91,y                               ; $0CAF7C |
  STA !s_spr_anim_frame,x                   ; $0CAF7F |
  LDA $AF93,y                               ; $0CAF82 |
  STA !s_spr_timer_1,x                      ; $0CAF85 |
  REP #$20                                  ; $0CAF88 |
  LDA #$0040                                ; $0CAF8A |
  STA !s_spr_y_accel,x                      ; $0CAF8D |
  RTL                                       ; $0CAF90 |

  db $00, $17                               ; $0CAF91 |

  db $20, $04                               ; $0CAF93 |

  LDX $12                                   ; $0CAF95 |
  LDA !s_spr_timer_1,x                      ; $0CAF97 |
  BNE CODE_0CAFB2                           ; $0CAF9A |
  SEP #$20                                  ; $0CAF9C |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAF9E |
  BMI CODE_0CAFB3                           ; $0CAFA0 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAFA2 |
  LDA $AF91,y                               ; $0CAFA4 |
  STA !s_spr_anim_frame,x                   ; $0CAFA7 |
  LDA $AF93,y                               ; $0CAFAA |
  STA !s_spr_timer_1,x                      ; $0CAFAD |
  REP #$20                                  ; $0CAFB0 |

CODE_0CAFB2:
  RTL                                       ; $0CAFB2 |

CODE_0CAFB3:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAFB3 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CAFB5 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CAFB7 |
  LDA $10                                   ; $0CAFB9 |
  AND #$03                                  ; $0CAFBB |
  INC A                                     ; $0CAFBD |

CODE_0CAFBE:
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CAFBE |
  LDA #$02                                  ; $0CAFC0 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAFC2 |
  TAY                                       ; $0CAFC4 |
  LDA $A46F,y                               ; $0CAFC5 |
  STA !s_spr_anim_frame,x                   ; $0CAFC8 |
  LDA $10                                   ; $0CAFCB |
  LSR A                                     ; $0CAFCD |
  LSR A                                     ; $0CAFCE |
  AND #$07                                  ; $0CAFCF |
  CLC                                       ; $0CAFD1 |
  ADC #$02                                  ; $0CAFD2 |
  STA !s_spr_timer_1,x                      ; $0CAFD4 |
  REP #$20                                  ; $0CAFD7 |
  STZ !s_spr_x_speed_lo,x                   ; $0CAFD9 |
  RTL                                       ; $0CAFDC |

  LDX $12                                   ; $0CAFDD |
  LDA !s_spr_timer_1,x                      ; $0CAFDF |
  BNE CODE_0CB00F                           ; $0CAFE2 |
  SEP #$20                                  ; $0CAFE4 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CAFE6 |
  BPL CODE_0CAFF2                           ; $0CAFE8 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CAFEA |
  BMI CODE_0CB010                           ; $0CAFEC |
  LDA #$02                                  ; $0CAFEE |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CAFF0 |

CODE_0CAFF2:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CAFF2 |
  LDA $A46F,y                               ; $0CAFF4 |
  STA !s_spr_anim_frame,x                   ; $0CAFF7 |
  LDA !s_spr_facing_dir,x                   ; $0CAFFA |
  EOR $A472,y                               ; $0CAFFD |
  STA !s_spr_facing_dir,x                   ; $0CB000 |
  LDA $10                                   ; $0CB003 |
  AND #$07                                  ; $0CB005 |
  CLC                                       ; $0CB007 |
  ADC #$02                                  ; $0CB008 |
  STA !s_spr_timer_1,x                      ; $0CB00A |
  REP #$20                                  ; $0CB00D |

CODE_0CB00F:
  RTL                                       ; $0CB00F |

CODE_0CB010:
  LDA !s_spr_wildcard_5_hi_dp,x             ; $0CB010 |
  BNE CODE_0CB039                           ; $0CB012 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB014 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB016 |
  LDA #$20                                  ; $0CB018 |
  STA !s_spr_timer_1,x                      ; $0CB01A |

CODE_0CB01D:
  LDA #$02                                  ; $0CB01D |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB01F |
  TAY                                       ; $0CB021 |
  LDA $A430,y                               ; $0CB022 |
  STA !s_spr_anim_frame,x                   ; $0CB025 |
  LDA #$02                                  ; $0CB028 |
  STA !s_spr_timer_2,x                      ; $0CB02A |
  REP #$20                                  ; $0CB02D |
  LDY !s_spr_facing_dir,x                   ; $0CB02F |
  LDA $A218,y                               ; $0CB032 |
  STA !s_spr_x_speed_lo,x                   ; $0CB035 |
  RTL                                       ; $0CB038 |

CODE_0CB039:
  REP #$20                                  ; $0CB039 |
  JSR CODE_0CB21B                           ; $0CB03B |
  BMI CODE_0CB052                           ; $0CB03E |
  BEQ CODE_0CB052                           ; $0CB040 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB042 |
  SEC                                       ; $0CB045 |
  SBC !s_spr_x_pixel_pos,y                  ; $0CB046 |
  AND #$8000                                ; $0CB049 |
  ASL A                                     ; $0CB04C |
  ROL A                                     ; $0CB04D |
  ASL A                                     ; $0CB04E |
  STA !s_spr_facing_dir,x                   ; $0CB04F |

CODE_0CB052:
  SEP #$20                                  ; $0CB052 |
  LDA #$0A                                  ; $0CB054 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CB056 |
  BRA CODE_0CB01D                           ; $0CB058 |
  LDX $12                                   ; $0CB05A |
  LDA !s_spr_timer_1,x                      ; $0CB05C |
  BEQ CODE_0CB080                           ; $0CB05F |
  LDA !s_spr_timer_2,x                      ; $0CB061 |
  BNE CODE_0CB07F                           ; $0CB064 |
  SEP #$20                                  ; $0CB066 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CB068 |
  BPL CODE_0CB070                           ; $0CB06A |
  LDA #$02                                  ; $0CB06C |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB06E |

CODE_0CB070:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CB070 |
  LDA $A430,y                               ; $0CB072 |
  STA !s_spr_anim_frame,x                   ; $0CB075 |
  LDA #$02                                  ; $0CB078 |
  STA !s_spr_timer_2,x                      ; $0CB07A |
  REP #$20                                  ; $0CB07D |

CODE_0CB07F:
  RTL                                       ; $0CB07F |

CODE_0CB080:
  SEP #$20                                  ; $0CB080 |
  LDA $10                                   ; $0CB082 |
  AND #$04                                  ; $0CB084 |
  STA !s_spr_wildcard_5_hi_dp,x             ; $0CB086 |
  LDA #$06                                  ; $0CB088 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CB08A |
  LDA #$03                                  ; $0CB08C |
  JMP CODE_0CAFBE                           ; $0CB08E |
  LDX $12                                   ; $0CB091 |
  JSR CODE_0CB21B                           ; $0CB093 |
  BMI CODE_0CB0A8                           ; $0CB096 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB098 |
  SEC                                       ; $0CB09B |
  SBC !s_spr_x_pixel_pos,y                  ; $0CB09C |
  CLC                                       ; $0CB09F |
  ADC #$0002                                ; $0CB0A0 |
  CMP #$0004                                ; $0CB0A3 |
  BCC CODE_0CB0C7                           ; $0CB0A6 |

CODE_0CB0A8:
  LDA !s_spr_timer_2,x                      ; $0CB0A8 |
  BNE CODE_0CB0C6                           ; $0CB0AB |
  SEP #$20                                  ; $0CB0AD |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CB0AF |
  BPL CODE_0CB0B7                           ; $0CB0B1 |
  LDA #$02                                  ; $0CB0B3 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB0B5 |

CODE_0CB0B7:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CB0B7 |
  LDA $A430,y                               ; $0CB0B9 |
  STA !s_spr_anim_frame,x                   ; $0CB0BC |
  LDA #$02                                  ; $0CB0BF |
  STA !s_spr_timer_2,x                      ; $0CB0C1 |
  REP #$20                                  ; $0CB0C4 |

CODE_0CB0C6:
  RTL                                       ; $0CB0C6 |

CODE_0CB0C7:
  LDA !s_spr_x_pixel_pos,y                  ; $0CB0C7 |
  STA !s_spr_x_pixel_pos,x                  ; $0CB0CA |
  STZ !s_spr_x_speed_lo,x                   ; $0CB0CD |
  STZ !s_spr_y_accel,x                      ; $0CB0D0 |
  STZ !s_spr_facing_dir,x                   ; $0CB0D3 |
  SEP #$20                                  ; $0CB0D6 |
  LDA #$17                                  ; $0CB0D8 |
  STA !s_spr_anim_frame,x                   ; $0CB0DA |
  LDA #$04                                  ; $0CB0DD |
  STA !s_spr_timer_1,x                      ; $0CB0DF |
  LDA #$01                                  ; $0CB0E2 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB0E4 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB0E6 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB0E8 |
  REP #$20                                  ; $0CB0EA |
  RTL                                       ; $0CB0EC |

  LDX $12                                   ; $0CB0ED |
  LDA !s_spr_timer_1,x                      ; $0CB0EF |
  BNE CODE_0CB109                           ; $0CB0F2 |
  JSR CODE_0CB234                           ; $0CB0F4 |
  SEP #$20                                  ; $0CB0F7 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CB0F9 |
  BMI CODE_0CB10A                           ; $0CB0FB |
  LDA #$11                                  ; $0CB0FD |
  STA !s_spr_anim_frame,x                   ; $0CB0FF |
  LDA #$04                                  ; $0CB102 |
  STA !s_spr_timer_1,x                      ; $0CB104 |
  REP #$20                                  ; $0CB107 |

CODE_0CB109:
  RTL                                       ; $0CB109 |

CODE_0CB10A:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB10A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB10C |
  LDA #$07                                  ; $0CB10E |
  STA !s_spr_anim_frame,x                   ; $0CB110 |
  REP #$20                                  ; $0CB113 |
  LDA #$FC00                                ; $0CB115 |
  STA !s_spr_y_speed_lo,x                   ; $0CB118 |
  LDA $7860,x                               ; $0CB11B |
  AND #$FFFE                                ; $0CB11E |
  STA $7860,x                               ; $0CB121 |
  RTL                                       ; $0CB124 |

  LDX $12                                   ; $0CB125 |
  JSR CODE_0CB234                           ; $0CB127 |
  RTL                                       ; $0CB12A |

  db $13, $12, $09                          ; $0CB12B |

  db $00, $00, $08                          ; $0CB12E |

  LDX $12                                   ; $0CB131 |
  LDA !s_spr_timer_1,x                      ; $0CB133 |
  BNE CODE_0CB15F                           ; $0CB136 |
  SEP #$20                                  ; $0CB138 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CB13A |
  BMI CODE_0CB160                           ; $0CB13C |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CB13E |
  LDA $B12B,y                               ; $0CB140 |
  STA !s_spr_anim_frame,x                   ; $0CB143 |
  LDA #$04                                  ; $0CB146 |
  STA !s_spr_timer_1,x                      ; $0CB148 |
  LDA $B12E,y                               ; $0CB14B |
  STA $00                                   ; $0CB14E |
  STZ $01                                   ; $0CB150 |
  REP #$20                                  ; $0CB152 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0CB154 |
  LDA !s_spr_y_pixel_pos,y                  ; $0CB156 |
  CLC                                       ; $0CB159 |
  ADC $00                                   ; $0CB15A |
  STA !s_spr_y_pixel_pos,x                  ; $0CB15C |

CODE_0CB15F:
  RTL                                       ; $0CB15F |

CODE_0CB160:
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB160 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB162 |
  LDA $10                                   ; $0CB164 |
  AND #$01                                  ; $0CB166 |
  ASL A                                     ; $0CB168 |
  TAY                                       ; $0CB169 |
  REP #$20                                  ; $0CB16A |
  LDA $B1A3,y                               ; $0CB16C |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CB16F |
  STA $00                                   ; $0CB172 |
  LDA $B1A7,y                               ; $0CB174 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CB177 |
  STA $02                                   ; $0CB17A |
  JSL random_number_gen                     ; $0CB17C |
  SEP #$20                                  ; $0CB180 |
  LDA $B19F,y                               ; $0CB182 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB185 |
  TAY                                       ; $0CB187 |
  LDA ($00),y                               ; $0CB188 |
  STA !s_spr_anim_frame,x                   ; $0CB18A |
  LDA $10                                   ; $0CB18D |
  AND #$0F                                  ; $0CB18F |
  CLC                                       ; $0CB191 |
  ADC #$10                                  ; $0CB192 |
  STA !s_spr_timer_1,x                      ; $0CB194 |
  LDA #$FF                                  ; $0CB197 |
  STA !s_spr_draw_priority,x                ; $0CB199 |
  REP #$20                                  ; $0CB19C |
  RTL                                       ; $0CB19E |

  db $07, $00, $09, $00                     ; $0CB19F |

  dw $B1AB                                  ; $0CB1A3 |
  dw $B1BB                                  ; $0CB1A5 |

  dw $B1B3                                  ; $0CB1A7 |
  dw $B1C5                                  ; $0CB1A9 |

  dw $161E, $161E, $161E, $161E             ; $0CB1AB |

  dw $4002, $1004, $2004, $0004             ; $0CB1B3 |

  dw $211E, $2122, $1F1E, $1F20             ; $0CB1BB |
  dw $1616                                  ; $0CB1C3 |

  dw $0202, $0210, $0202, $0210             ; $0CB1C5 |
  dw $0020                                  ; $0CB1CD |

  LDX $12                                   ; $0CB1CF |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CB1D1 |
  STA $00                                   ; $0CB1D4 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CB1D6 |
  STA $02                                   ; $0CB1D9 |
  LDA !s_spr_timer_1,x                      ; $0CB1DB |
  BNE CODE_0CB20B                           ; $0CB1DE |
  SEP #$20                                  ; $0CB1E0 |
  LDA #$06                                  ; $0CB1E2 |
  STA !s_spr_draw_priority,x                ; $0CB1E4 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CB1E7 |
  BPL CODE_0CB20C                           ; $0CB1E9 |
  LDA #$02                                  ; $0CB1EB |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB1ED |
  TAY                                       ; $0CB1EF |
  LDA $AF00,y                               ; $0CB1F0 |
  STA !s_spr_anim_frame,x                   ; $0CB1F3 |
  LDA $10                                   ; $0CB1F6 |
  AND #$1F                                  ; $0CB1F8 |
  CLC                                       ; $0CB1FA |
  ADC #$20                                  ; $0CB1FB |
  STA !s_spr_timer_1,x                      ; $0CB1FD |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CB200 |
  REP #$20                                  ; $0CB202 |
  LDA #$0075                                ; $0CB204 |\ play sound #$0075
  JSL push_sound_queue                      ; $0CB207 |/

CODE_0CB20B:
  RTL                                       ; $0CB20B |

CODE_0CB20C:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CB20C |
  LDA ($00),y                               ; $0CB20E |
  STA !s_spr_anim_frame,x                   ; $0CB210 |
  LDA ($02),y                               ; $0CB213 |
  STA !s_spr_timer_1,x                      ; $0CB215 |
  REP #$20                                  ; $0CB218 |
  RTL                                       ; $0CB21A |

CODE_0CB21B:
  LDA #$002F                                ; $0CB21B |
  STA !gsu_r14                              ; $0CB21E |
  TXA                                       ; $0CB221 |
  STA !gsu_r1                               ; $0CB222 |
  LDX #$09                                  ; $0CB225 |
  LDA #$8EBF                                ; $0CB227 |
  JSL r_gsu_init_1                          ; $0CB22A | GSU init
  LDX $12                                   ; $0CB22E |
  LDY !gsu_r1                               ; $0CB230 |
  RTS                                       ; $0CB233 |

CODE_0CB234:
  JSR CODE_0CB21B                           ; $0CB234 |
  BMI CODE_0CB29C                           ; $0CB237 |
  BEQ CODE_0CB29C                           ; $0CB239 |
  LDA !s_spr_hitbox_width,x                 ; $0CB23B |
  CLC                                       ; $0CB23E |
  ADC !s_spr_hitbox_width,y                 ; $0CB23F |
  STA $00                                   ; $0CB242 |
  LDA !s_spr_x_hitbox_center,x              ; $0CB244 |
  SEC                                       ; $0CB247 |
  SBC !s_spr_x_hitbox_center,y              ; $0CB248 |
  BPL CODE_0CB251                           ; $0CB24B |
  EOR #$FFFF                                ; $0CB24D |
  INC A                                     ; $0CB250 |

CODE_0CB251:
  CMP $00                                   ; $0CB251 |
  BCS CODE_0CB29C                           ; $0CB253 |
  LDA !s_spr_hitbox_height,x                ; $0CB255 |
  CLC                                       ; $0CB258 |
  ADC !s_spr_hitbox_height,y                ; $0CB259 |
  STA $00                                   ; $0CB25C |
  LDA !s_spr_y_hitbox_center,x              ; $0CB25E |
  SEC                                       ; $0CB261 |
  SBC !s_spr_y_hitbox_center,y              ; $0CB262 |
  BPL CODE_0CB26B                           ; $0CB265 |
  EOR #$FFFF                                ; $0CB267 |
  INC A                                     ; $0CB26A |

CODE_0CB26B:
  CMP $00                                   ; $0CB26B |
  BCS CODE_0CB29C                           ; $0CB26D |
  STZ !s_spr_y_speed_lo,x                   ; $0CB26F |
  SEP #$20                                  ; $0CB272 |
  LDA #$10                                  ; $0CB274 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CB276 |
  LDA #$02                                  ; $0CB278 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CB27A |
  LDA #$04                                  ; $0CB27C |
  STA !s_spr_timer_1,x                      ; $0CB27E |
  TYA                                       ; $0CB281 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CB282 |
  LDA #$06                                  ; $0CB284 |
  STA !s_spr_draw_priority,x                ; $0CB286 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CB289 |
  ORA #$60                                  ; $0CB28C |
  STA !s_spr_bitwise_settings_1,x           ; $0CB28E |
  REP #$20                                  ; $0CB291 |
  LDA !s_spr_oam_1,x                        ; $0CB293 |
  AND #$FEAF                                ; $0CB296 |
  STA !s_spr_oam_1,x                        ; $0CB299 |

CODE_0CB29C:
  RTS                                       ; $0CB29C |

CODE_0CB29D:
  LDA !s_spr_bitwise_settings_1,x           ; $0CB29D |
  AND #$0040                                ; $0CB2A0 |
  BNE CODE_0CB2C1                           ; $0CB2A3 |
  LDY !s_spr_collision_id,x                 ; $0CB2A5 |
  BPL CODE_0CB2C1                           ; $0CB2A8 |
  LDA !s_player_invincibility_timer         ; $0CB2AA |
  BNE CODE_0CB2C1                           ; $0CB2AD |
  JSL $07FC2F                               ; $0CB2AF |
  BCC CODE_0CB2BB                           ; $0CB2B3 |
  PLA                                       ; $0CB2B5 |
  JSL $03A5B7                               ; $0CB2B6 |
  RTL                                       ; $0CB2BA |

CODE_0CB2BB:
  BEQ CODE_0CB2C1                           ; $0CB2BB |
  JSL player_hit_sprite                     ; $0CB2BD |

CODE_0CB2C1:
  RTS                                       ; $0CB2C1 |

CODE_0CB2C2:
  LDA !s_spr_y_accel,x                      ; $0CB2C2 |
  CMP #$0040                                ; $0CB2C5 |
  BMI CODE_0CB2EA                           ; $0CB2C8 |
  LDA #$0022                                ; $0CB2CA |
  STA !gsu_r14                              ; $0CB2CD |
  LDA #$0026                                ; $0CB2D0 |
  STA !gsu_r11                              ; $0CB2D3 |
  TXA                                       ; $0CB2D6 |
  STA !gsu_r10                              ; $0CB2D7 |
  LDX #$09                                  ; $0CB2DA |
  LDA #$9FA5                                ; $0CB2DC |
  JSL r_gsu_init_1                          ; $0CB2DF | GSU init
  LDX $12                                   ; $0CB2E3 |
  LDY !gsu_r1                               ; $0CB2E5 |
  BPL CODE_0CB2EB                           ; $0CB2E8 |

CODE_0CB2EA:
  RTS                                       ; $0CB2EA |

CODE_0CB2EB:
  LDA #$0030                                ; $0CB2EB |
  TXY                                       ; $0CB2EE |
  JSL $03A377                               ; $0CB2EF |
  LDA #$0002                                ; $0CB2F3 |
  STA !s_spr_state,x                        ; $0CB2F6 |
  SEP #$20                                  ; $0CB2F9 |
  LDA #$01                                  ; $0CB2FB |
  STA !s_spr_wildcard_1_lo,x                ; $0CB2FD |
  REP #$20                                  ; $0CB300 |
  PLA                                       ; $0CB302 |
  RTL                                       ; $0CB303 |

init_little_skill_mouser:
  RTL                                       ; $0CB304 |

  dw $FE80, $0180                           ; $0CB305 |

  dw $0000, $0000, $0002, $0000             ; $0CB309 |

CODE_0CB311:
  LDA !s_sprite_disable_flag                ; $0CB311 |
  ORA $0B55                                 ; $0CB314 |
  ORA !r_cur_item_used                      ; $0CB317 |
  BNE CODE_0CB351                           ; $0CB31A |
  LDA $7860,x                               ; $0CB31C |
  BIT #$000C                                ; $0CB31F |
  BNE CODE_0CB352                           ; $0CB322 |
  BIT #$0002                                ; $0CB324 |
  BNE CODE_0CB35D                           ; $0CB327 |
  BIT #$0001                                ; $0CB329 |
  BEQ CODE_0CB351                           ; $0CB32C |
  LDA #$001F                                ; $0CB32E |\ play sound #$001F
  JSL push_sound_queue                      ; $0CB331 |/
  JSL $03A590                               ; $0CB335 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0CB339 |
  CMP #$0003                                ; $0CB33B |
  BCC CODE_0CB349                           ; $0CB33E |
  LDA !s_spr_x_speed_lo,x                   ; $0CB340 |
  BNE CODE_0CB34B                           ; $0CB343 |
  JML $03B078                               ; $0CB345 |

CODE_0CB349:
  INC !s_spr_wildcard_6_lo_dp,x             ; $0CB349 |

CODE_0CB34B:
  LDA #$FE00                                ; $0CB34B |
  STA !s_spr_y_speed_lo,x                   ; $0CB34E |

CODE_0CB351:
  RTL                                       ; $0CB351 |

CODE_0CB352:
  LSR A                                     ; $0CB352 |
  AND #$0006                                ; $0CB353 |
  TAY                                       ; $0CB356 |
  LDA $B309,y                               ; $0CB357 |
  STA !s_spr_facing_dir,x                   ; $0CB35A |

CODE_0CB35D:
  STZ !s_spr_x_speed_lo,x                   ; $0CB35D |
  SEP #$20                                  ; $0CB360 |
  LDA #$02                                  ; $0CB362 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CB364 |
  REP #$20                                  ; $0CB367 |
  RTL                                       ; $0CB369 |

main_little_skull_mouser:
  LDY !s_spr_gsu_morph_1_lo,x               ; $0CB36A |
  TYX                                       ; $0CB36D |
  JMP ($B371,x)                             ; $0CB36E |

  dw $B375                                  ; $0CB371 |
  dw $B455                                  ; $0CB373 |

  LDX $12                                   ; $0CB375 |
  LDA !s_spr_collision_state,x              ; $0CB377 |
  BNE CODE_0CB311                           ; $0CB37A |
  JSL $03AF23                               ; $0CB37C |
  JSL $07FD6C                               ; $0CB380 |
  BCC CODE_0CB394                           ; $0CB384 |
  JSL $03B20B                               ; $0CB386 |
  SEP #$20                                  ; $0CB38A |
  LDA #$02                                  ; $0CB38C |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CB38E |
  REP #$20                                  ; $0CB391 |
  RTL                                       ; $0CB393 |

CODE_0CB394:
  JSL $03A5B7                               ; $0CB394 |
  JSR CODE_0CB406                           ; $0CB398 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CB39B |
  BNE CODE_0CB3D5                           ; $0CB39D |
  LDA $7860,x                               ; $0CB39F |
  BIT #$0001                                ; $0CB3A2 |
  BNE CODE_0CB3C3                           ; $0CB3A5 |
  LDY #$02                                  ; $0CB3A7 |
  LDA !s_spr_y_speed_lo,x                   ; $0CB3A9 |
  CLC                                       ; $0CB3AC |
  ADC #$0040                                ; $0CB3AD |
  CMP #$0080                                ; $0CB3B0 |
  BCC CODE_0CB3BE                           ; $0CB3B3 |
  LDY #$01                                  ; $0CB3B5 |
  LDA !s_spr_y_speed_lo,x                   ; $0CB3B7 |
  BMI CODE_0CB3BE                           ; $0CB3BA |
  LDY #$03                                  ; $0CB3BC |

CODE_0CB3BE:
  TYA                                       ; $0CB3BE |
  STA !s_spr_anim_frame,x                   ; $0CB3BF |
  RTL                                       ; $0CB3C2 |

CODE_0CB3C3:
  STZ !s_spr_x_speed_lo,x                   ; $0CB3C3 |
  LDA #$0004                                ; $0CB3C6 |
  STA !s_spr_anim_frame,x                   ; $0CB3C9 |
  LDA #$0002                                ; $0CB3CC |
  STA !s_spr_timer_1,x                      ; $0CB3CF |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB3D2 |
  RTL                                       ; $0CB3D4 |

CODE_0CB3D5:
  LDA !s_spr_timer_1,x                      ; $0CB3D5 |
  BNE CODE_0CB3F7                           ; $0CB3D8 |
  LDA !s_spr_anim_frame,x                   ; $0CB3DA |
  BNE CODE_0CB3F8                           ; $0CB3DD |
  LDA #$0075                                ; $0CB3DF |\ play sound #$0075
  JSL push_sound_queue                      ; $0CB3E2 |/
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CB3E6 |
  LDA #$FD00                                ; $0CB3E8 |
  STA !s_spr_y_speed_lo,x                   ; $0CB3EB |
  LDY !s_spr_facing_dir,x                   ; $0CB3EE |
  LDA $B305,y                               ; $0CB3F1 |
  STA !s_spr_x_speed_lo,x                   ; $0CB3F4 |

CODE_0CB3F7:
  RTL                                       ; $0CB3F7 |

CODE_0CB3F8:
  STZ !s_spr_anim_frame,x                   ; $0CB3F8 |
  LDA #$0004                                ; $0CB3FB |
  STA !s_spr_timer_1,x                      ; $0CB3FE |
  RTL                                       ; $0CB401 |

  dw $FF00, $0100                           ; $0CB402 |

CODE_0CB406:
  LDY !s_spr_collision_id,x                 ; $0CB406 |
  DEY                                       ; $0CB409 |
  BMI CODE_0CB43E                           ; $0CB40A |
  BEQ CODE_0CB43E                           ; $0CB40C |
  LDA !s_spr_state,y                        ; $0CB40E |
  CMP #$0010                                ; $0CB411 |
  BNE CODE_0CB43E                           ; $0CB414 |
  LDA !s_spr_collision_state,y              ; $0CB416 |
  BEQ CODE_0CB43E                           ; $0CB419 |
  LDX #$00                                  ; $0CB41B |
  LDA !s_spr_x_speed_lo,y                   ; $0CB41D |
  BMI CODE_0CB424                           ; $0CB420 |
  INX                                       ; $0CB422 |
  INX                                       ; $0CB423 |

CODE_0CB424:
  LDA $B402,x                               ; $0CB424 |
  LDX $12                                   ; $0CB427 |
  STA !s_spr_x_speed_lo,x                   ; $0CB429 |
  SEP #$20                                  ; $0CB42C |
  LDA #$02                                  ; $0CB42E |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CB430 |
  REP #$20                                  ; $0CB433 |
  TYX                                       ; $0CB435 |
  JSL $03B24B                               ; $0CB436 |
  LDX $12                                   ; $0CB43A |
  PLA                                       ; $0CB43C |
  RTL                                       ; $0CB43D |

CODE_0CB43E:
  RTS                                       ; $0CB43E |

  db $00, $05, $06, $07, $06, $07, $06, $07 ; $0CB43F |
  db $06, $07, $06                          ; $0CB447 |

  db $02, $02, $32, $02, $02, $02, $02, $02 ; $0CB44A |
  db $02, $02, $32                          ; $0CB452 |

  LDX $12                                   ; $0CB455 |
  LDA !s_spr_state,x                        ; $0CB457 |
  CMP #$0008                                ; $0CB45A |
  BNE CODE_0CB471                           ; $0CB45D |
  LDA #$0030                                ; $0CB45F |
  TXY                                       ; $0CB462 |
  JSL $03A377                               ; $0CB463 |
  SEP #$20                                  ; $0CB467 |
  LDA #$01                                  ; $0CB469 |
  STA !s_spr_wildcard_1_lo,x                ; $0CB46B |
  REP #$20                                  ; $0CB46E |
  RTL                                       ; $0CB470 |

CODE_0CB471:
  STZ !s_spr_collision_state,x              ; $0CB471 |
  JSL $03AF23                               ; $0CB474 |
  JSL $07FD6C                               ; $0CB478 |
  BCC CODE_0CB49A                           ; $0CB47C |
  JSL $03B20B                               ; $0CB47E |
  LDA #$001C                                ; $0CB482 |\ play sound #$001C
  JSL push_sound_queue                      ; $0CB485 |/
  JSL $0CFF61                               ; $0CB489 |
  SEP #$20                                  ; $0CB48D |
  LDA #$FF                                  ; $0CB48F |
  STA !s_spr_stage_id,x                     ; $0CB491 |
  REP #$20                                  ; $0CB494 |
  JML $03A31E                               ; $0CB496 |

CODE_0CB49A:
  LDA $7860,x                               ; $0CB49A |
  BIT #$0001                                ; $0CB49D |
  BEQ CODE_0CB4A5                           ; $0CB4A0 |
  STZ !s_spr_x_speed_lo,x                   ; $0CB4A2 |

CODE_0CB4A5:
  LDA !s_spr_timer_2,x                      ; $0CB4A5 |
  BNE CODE_0CB4D1                           ; $0CB4A8 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CB4AA |
  CMP #$0001                                ; $0CB4AC |
  BNE CODE_0CB4B8                           ; $0CB4AF |
  LDA #$0219                                ; $0CB4B1 |
  JSL $0C9C7E                               ; $0CB4B4 |

CODE_0CB4B8:
  SEP #$20                                  ; $0CB4B8 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CB4BA |
  CMP #$0B                                  ; $0CB4BC |
  BCS CODE_0CB4D2                           ; $0CB4BE |
  TAY                                       ; $0CB4C0 |
  LDA $B44A,y                               ; $0CB4C1 |
  STA !s_spr_timer_2,x                      ; $0CB4C4 |
  LDA $B43F,y                               ; $0CB4C7 |
  STA !s_spr_anim_frame,x                   ; $0CB4CA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CB4CD |
  REP #$20                                  ; $0CB4CF |

CODE_0CB4D1:
  RTL                                       ; $0CB4D1 |

CODE_0CB4D2:
  REP #$20                                  ; $0CB4D2 |
  LDA #$0030                                ; $0CB4D4 |
  TXY                                       ; $0CB4D7 |
  JSL $03A377                               ; $0CB4D8 |
  LDA #$0002                                ; $0CB4DC |
  STA !s_spr_state,x                        ; $0CB4DF |
  SEP #$20                                  ; $0CB4E2 |
  LDA #$01                                  ; $0CB4E4 |
  STA !s_spr_wildcard_1_lo,x                ; $0CB4E6 |
  REP #$20                                  ; $0CB4E9 |
  RTL                                       ; $0CB4EB |

  dw $FF80, $0080                           ; $0CB4EC |

  db $01, $01, $01, $01, $02, $02, $02, $02 ; $0CB4F0 |
  db $04, $04, $04, $04, $04, $00, $00, $00 ; $0CB4F8 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB500 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB508 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB510 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB518 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB520 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB528 |

init_star:
  LDA #$0280                                ; $0CB530 |
  STA !s_spr_timer_1,x                      ; $0CB533 |

CODE_0CB536:
  RTL                                       ; $0CB536 |

main_star:
  LDA !s_sprite_disable_flag                ; $0CB537 |\
  ORA $0B55                                 ; $0CB53A | | If any pause flags
  ORA !r_cur_item_used                      ; $0CB53D | | Branch to return
  BNE CODE_0CB536                           ; $0CB540 |/
  LDA !s_spr_timer_3,x                      ; $0CB542 |
  BNE CODE_0CB59D                           ; $0CB545 |
  LDY !s_spr_collision_id,x                 ; $0CB547 |
  BPL CODE_0CB59D                           ; $0CB54A |
  LDA #$01EF                                ; $0CB54C |
  JSL spawn_ambient_sprite                  ; $0CB54F |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB553 |
  CLC                                       ; $0CB556 |
  ADC #$0008                                ; $0CB557 |
  STA $70A2,y                               ; $0CB55A |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB55D |
  CLC                                       ; $0CB560 |
  ADC #$0008                                ; $0CB561 |
  STA $7142,y                               ; $0CB564 |
  LDA #$0004                                ; $0CB567 |
  STA $73C2,y                               ; $0CB56A |
  LDA #$0002                                ; $0CB56D |
  STA $7782,y                               ; $0CB570 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB573 |
  STA $0000                                 ; $0CB576 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB579 |
  STA $0002                                 ; $0CB57C |
  LDA #$0003                                ; $0CB57F |
  STA $0004                                 ; $0CB582 |
  JSL $03A4C3                               ; $0CB585 |
  LDA !r_star_autoincrease                  ; $0CB589 |
  CLC                                       ; $0CB58C |
  ADC #$000A                                ; $0CB58D |
  STA !r_star_autoincrease                  ; $0CB590 |
  LDA #$0082                                ; $0CB593 |
  STA !r_starcounter_timer                  ; $0CB596 |
  JML $03A32E                               ; $0CB599 |

CODE_0CB59D:
  LDA !s_spr_timer_1,x                      ; $0CB59D |
  BNE CODE_0CB5A6                           ; $0CB5A0 |
  JML $03A31E                               ; $0CB5A2 |

CODE_0CB5A6:
  LSR A                                     ; $0CB5A6 |
  LSR A                                     ; $0CB5A7 |
  LSR A                                     ; $0CB5A8 |
  LSR A                                     ; $0CB5A9 |
  TAY                                       ; $0CB5AA |
  SEP #$20                                  ; $0CB5AB |
  LDX #$05                                  ; $0CB5AD |
  LDA $14                                   ; $0CB5AF |
  AND $B4F0,y                               ; $0CB5B1 |
  BEQ CODE_0CB5B8                           ; $0CB5B4 |
  LDX #$FF                                  ; $0CB5B6 |

CODE_0CB5B8:
  TXA                                       ; $0CB5B8 |
  LDX $12                                   ; $0CB5B9 |
  STA !s_spr_draw_priority,x                ; $0CB5BB |
  REP #$20                                  ; $0CB5BE |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CB5C0 |
  BNE CODE_0CB605                           ; $0CB5C2 |
  LDA $7860,x                               ; $0CB5C4 |
  AND #$0001                                ; $0CB5C7 |
  BNE CODE_0CB5F6                           ; $0CB5CA |
  LDY #$02                                  ; $0CB5CC |
  LDA !s_spr_y_speed_lo,x                   ; $0CB5CE |
  CLC                                       ; $0CB5D1 |
  ADC #$0080                                ; $0CB5D2 |
  CMP #$0100                                ; $0CB5D5 |
  BCC CODE_0CB5F1                           ; $0CB5D8 |
  LDY #$01                                  ; $0CB5DA |
  LDA !s_spr_y_speed_lo,x                   ; $0CB5DC |
  BMI CODE_0CB5F1                           ; $0CB5DF |
  LDY #$03                                  ; $0CB5E1 |
  CMP #$0100                                ; $0CB5E3 |
  BCC CODE_0CB5F1                           ; $0CB5E6 |
  LDY #$04                                  ; $0CB5E8 |
  CMP #$0180                                ; $0CB5EA |
  BCC CODE_0CB5F1                           ; $0CB5ED |
  LDY #$05                                  ; $0CB5EF |

CODE_0CB5F1:
  TYA                                       ; $0CB5F1 |
  STA !s_spr_anim_frame,x                   ; $0CB5F2 |
  RTL                                       ; $0CB5F5 |

CODE_0CB5F6:
  STZ !s_spr_anim_frame,x                   ; $0CB5F6 |
  STZ !s_spr_x_speed_lo,x                   ; $0CB5F9 |
  LDA #$0002                                ; $0CB5FC |
  STA !s_spr_timer_2,x                      ; $0CB5FF |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB602 |
  RTL                                       ; $0CB604 |

CODE_0CB605:
  LDA !s_spr_timer_2,x                      ; $0CB605 |
  BNE CODE_0CB62D                           ; $0CB608 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0CB60A |
  BNE CODE_0CB61C                           ; $0CB60D |
  LDY !s_spr_x_player_dir,x                 ; $0CB60F |
  TYA                                       ; $0CB612 |
  EOR #$0002                                ; $0CB613 |
  STA !s_spr_facing_dir,x                   ; $0CB616 |
  INC !s_spr_gsu_morph_1_lo,x               ; $0CB619 |

CODE_0CB61C:
  LDY !s_spr_facing_dir,x                   ; $0CB61C |
  LDA $B4EC,y                               ; $0CB61F |
  STA !s_spr_x_speed_lo,x                   ; $0CB622 |
  LDA #$FE00                                ; $0CB625 |
  STA !s_spr_y_speed_lo,x                   ; $0CB628 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CB62B |

CODE_0CB62D:
  RTL                                       ; $0CB62D |

  dw $FF00, $0100                           ; $0CB62E |

  dw $FFE8, $0018                           ; $0CB632 |

init_jean_de_fillet:
  JSL $03AE60                               ; $0CB636 |
  JSR CODE_0CB7A8                           ; $0CB63A |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB63D |
  AND #$0010                                ; $0CB640 |
  LSR A                                     ; $0CB643 |
  LSR A                                     ; $0CB644 |
  LSR A                                     ; $0CB645 |
  EOR #$0002                                ; $0CB646 |
  STA !s_spr_facing_dir,x                   ; $0CB649 |
  TAY                                       ; $0CB64C |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB64D |
  CLC                                       ; $0CB650 |
  ADC $B632,y                               ; $0CB651 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CB654 |
  LDA #$3000                                ; $0CB657 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CB65A |
  LDY !r_header_bg1_tileset                 ; $0CB65C |
  CPY #$03                                  ; $0CB65F |
  BNE CODE_0CB671                           ; $0CB661 |

CODE_0CB663:
  LDA !s_spr_y_pixel_pos,x                  ; $0CB663 |
  SEC                                       ; $0CB666 |
  SBC #$0004                                ; $0CB667 |
  STA !s_spr_y_pixel_pos,x                  ; $0CB66A |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CB66D |
  RTL                                       ; $0CB670 |

CODE_0CB671:
  LDA !s_spr_x_pixel_pos,x                  ; $0CB671 |
  STA !gsu_r8                               ; $0CB674 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB677 |
  CLC                                       ; $0CB67A |
  ADC #$0008                                ; $0CB67B |
  STA !gsu_r0                               ; $0CB67E |
  LDX #$0A                                  ; $0CB681 |
  LDA #$CE2F                                ; $0CB683 |
  JSL r_gsu_init_3                          ; $0CB686 |
  LDX $12                                   ; $0CB68A |
  LDA !gsu_r6                               ; $0CB68C |
  AND #$FF00                                ; $0CB68F |
  CMP #$7E00                                ; $0CB692 |
  BEQ CODE_0CB663                           ; $0CB695 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB697 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CB69A |
  RTL                                       ; $0CB69D |

  LDA !s_spr_y_pixel_pos,x                  ; $0CB69E |
  SEC                                       ; $0CB6A1 |
  SBC #$0008                                ; $0CB6A2 |
  STA !s_spr_y_pixel_pos,x                  ; $0CB6A5 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CB6A8 |
  RTL                                       ; $0CB6AB |

main_jean_de_fillet:
  JSL $03AA52                               ; $0CB6AC |
  JSL $03AF23                               ; $0CB6B0 |
  SEP #$20                                  ; $0CB6B4 |
  LDA #$FF                                  ; $0CB6B6 |
  STA $7863,x                               ; $0CB6B8 |
  REP #$20                                  ; $0CB6BB |
  JSR CODE_0CB7A8                           ; $0CB6BD |
  JSR CODE_0CB90A                           ; $0CB6C0 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CB6C3 |
  TYX                                       ; $0CB6C5 |
  JMP ($B6C9,x)                             ; $0CB6C6 |

  dw $B6D1                                  ; $0CB6C9 |
  dw $B6F5                                  ; $0CB6CB |
  dw $B74F                                  ; $0CB6CD |
  dw $B765                                  ; $0CB6CF |

  LDX $12                                   ; $0CB6D1 |
  LDA !s_spr_timer_1,x                      ; $0CB6D3 |
  BNE CODE_0CB6F4                           ; $0CB6D6 |
  LDA #$FA00                                ; $0CB6D8 |
  STA !s_spr_y_speed_lo,x                   ; $0CB6DB |
  LDY !s_spr_facing_dir,x                   ; $0CB6DE |
  LDA $B62E,y                               ; $0CB6E1 |
  STA !s_spr_x_speed_lo,x                   ; $0CB6E4 |
  SEP #$20                                  ; $0CB6E7 |
  LDA #$40                                  ; $0CB6E9 |
  STA !s_spr_y_accel,x                      ; $0CB6EB |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB6EE |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB6F0 |
  REP #$20                                  ; $0CB6F2 |

CODE_0CB6F4:
  RTL                                       ; $0CB6F4 |

  LDX $12                                   ; $0CB6F5 |
  JSR CODE_0CB7EC                           ; $0CB6F7 |
  JSR CODE_0CB781                           ; $0CB6FA |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CB6FD |
  CLC                                       ; $0CB700 |
  ADC #$0010                                ; $0CB701 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CB704 |
  BCS CODE_0CB73E                           ; $0CB707 |
  STA !s_spr_y_pixel_pos,x                  ; $0CB709 |
  LDY !s_spr_facing_dir,x                   ; $0CB70C |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CB70F |
  CLC                                       ; $0CB712 |
  ADC $B632,y                               ; $0CB713 |
  STA !s_spr_x_pixel_pos,x                  ; $0CB716 |
  LDA !s_spr_facing_dir,x                   ; $0CB719 |
  EOR #$0002                                ; $0CB71C |
  STA !s_spr_facing_dir,x                   ; $0CB71F |
  LDA #$3000                                ; $0CB722 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CB725 |
  STZ !s_spr_y_speed_lo,x                   ; $0CB727 |
  STZ !s_spr_x_speed_lo,x                   ; $0CB72A |
  STZ !s_spr_y_accel,x                      ; $0CB72D |
  SEP #$20                                  ; $0CB730 |
  LDA #$20                                  ; $0CB732 |
  STA !s_spr_timer_1,x                      ; $0CB734 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB737 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB739 |
  REP #$20                                  ; $0CB73B |
  RTL                                       ; $0CB73D |

CODE_0CB73E:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CB73E |
  SEC                                       ; $0CB740 |
  SBC #$0200                                ; $0CB741 |
  CMP #$D000                                ; $0CB744 |
  BPL CODE_0CB74C                           ; $0CB747 |
  LDA #$D000                                ; $0CB749 |

CODE_0CB74C:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CB74C |
  RTL                                       ; $0CB74E |

  LDX $12                                   ; $0CB74F |
  LDA !s_spr_timer_1,x                      ; $0CB751 |
  BNE CODE_0CB764                           ; $0CB754 |
  LDA #$FF00                                ; $0CB756 |
  STA !s_spr_y_speed_lo,x                   ; $0CB759 |
  SEP #$20                                  ; $0CB75C |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB75E |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CB760 |
  REP #$20                                  ; $0CB762 |

CODE_0CB764:
  RTL                                       ; $0CB764 |

  LDX $12                                   ; $0CB765 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CB767 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CB76A |
  BCC CODE_0CB780                           ; $0CB76D |
  STA !s_spr_y_pixel_pos,x                  ; $0CB76F |
  STZ !s_spr_y_speed_lo,x                   ; $0CB772 |
  SEP #$20                                  ; $0CB775 |
  LDA #$20                                  ; $0CB777 |
  STA !s_spr_timer_1,x                      ; $0CB779 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CB77C |
  REP #$20                                  ; $0CB77E |

CODE_0CB780:
  RTL                                       ; $0CB780 |

CODE_0CB781:
  LDY !s_spr_facing_dir,x                   ; $0CB781 |
  BNE CODE_0CB794                           ; $0CB784 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CB786 |
  CLC                                       ; $0CB789 |
  ADC $B632,y                               ; $0CB78A |
  CMP !s_spr_x_pixel_pos,x                  ; $0CB78D |
  BPL CODE_0CB7A0                           ; $0CB790 |

CODE_0CB792:
  CLC                                       ; $0CB792 |
  RTS                                       ; $0CB793 |

CODE_0CB794:
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CB794 |
  CLC                                       ; $0CB797 |
  ADC $B632,y                               ; $0CB798 |
  CMP !s_spr_x_pixel_pos,x                  ; $0CB79B |
  BPL CODE_0CB792                           ; $0CB79E |

CODE_0CB7A0:
  STA !s_spr_x_pixel_pos,x                  ; $0CB7A0 |
  STZ !s_spr_x_speed_lo,x                   ; $0CB7A3 |
  SEC                                       ; $0CB7A6 |
  RTS                                       ; $0CB7A7 |

CODE_0CB7A8:
  REP #$10                                  ; $0CB7A8 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CB7AA |
  EOR #$FFFF                                ; $0CB7AC |
  INC A                                     ; $0CB7AF |
  XBA                                       ; $0CB7B0 |
  AND #$00FF                                ; $0CB7B1 |
  STA !gsu_r5                               ; $0CB7B4 |
  LDY !s_spr_dyntile_index,x                ; $0CB7B7 |
  TYX                                       ; $0CB7BA |
  LDA $03A9CE,x                             ; $0CB7BB |
  STA !gsu_r3                               ; $0CB7BF |
  LDA $03A9EE,x                             ; $0CB7C2 |
  STA !gsu_r2                               ; $0CB7C6 |
  LDA #$0100                                ; $0CB7C9 |
  STA !gsu_r6                               ; $0CB7CC |
  LDA #$40E1                                ; $0CB7CF |
  STA !gsu_r12                              ; $0CB7D2 |
  LDA #$0055                                ; $0CB7D5 |
  STA !gsu_r13                              ; $0CB7D8 |
  SEP #$10                                  ; $0CB7DB |
  LDX #$08                                  ; $0CB7DD |
  LDA #$8205                                ; $0CB7DF |
  JSL r_gsu_init_1                          ; $0CB7E2 | GSU init
  INC $0CF9                                 ; $0CB7E6 |
  LDX $12                                   ; $0CB7E9 |
  RTS                                       ; $0CB7EB |

CODE_0CB7EC:
  REP #$10                                  ; $0CB7EC |
  LDA !s_spr_wildcard_2_lo,x                ; $0CB7EE |
  LDY !s_spr_y_speed_lo,x                   ; $0CB7F1 |
  BPL CODE_0CB82B                           ; $0CB7F4 |
  TXY                                       ; $0CB7F6 |
  TAX                                       ; $0CB7F7 |
  LDA $70001C,x                             ; $0CB7F8 |
  AND #$F800                                ; $0CB7FC |
  CMP #$4000                                ; $0CB7FF |
  BEQ CODE_0CB817                           ; $0CB802 |
  LDA !s_spr_wildcard_6_lo,y                ; $0CB804 |
  BMI CODE_0CB812                           ; $0CB807 |
  LDA $70001C,x                             ; $0CB809 |
  BIT #$0008                                ; $0CB80D |
  BEQ CODE_0CB889                           ; $0CB810 |

CODE_0CB812:
  SEP #$10                                  ; $0CB812 |
  LDX $12                                   ; $0CB814 |
  RTS                                       ; $0CB816 |

CODE_0CB817:
  LDA $700018,x                             ; $0CB817 |
  STA $00                                   ; $0CB81B |
  STA $0091                                 ; $0CB81D |
  LDA $70001A,x                             ; $0CB820 |
  STA $02                                   ; $0CB824 |
  STA $0093                                 ; $0CB826 |
  BRA CODE_0CB84B                           ; $0CB829 |

CODE_0CB82B:
  TXY                                       ; $0CB82B |
  TAX                                       ; $0CB82C |
  LDA $700024,x                             ; $0CB82D |
  AND #$F800                                ; $0CB831 |
  CMP #$4000                                ; $0CB834 |
  BNE CODE_0CB884                           ; $0CB837 |
  LDA $700020,x                             ; $0CB839 |
  STA $00                                   ; $0CB83D |
  STA $0091                                 ; $0CB83F |
  LDA $700022,x                             ; $0CB842 |
  STA $02                                   ; $0CB846 |
  STA $0093                                 ; $0CB848 |

CODE_0CB84B:
  SEP #$10                                  ; $0CB84B |
  LDA #$0000                                ; $0CB84D |
  STA $008F                                 ; $0CB850 |
  JSL $109295                               ; $0CB853 |
  LDX $12                                   ; $0CB857 |
  LDA #$01C3                                ; $0CB859 |
  JSL spawn_ambient_sprite                  ; $0CB85C |
  LDA $00                                   ; $0CB860 |
  AND #$FFF0                                ; $0CB862 |
  STA $70A2,y                               ; $0CB865 |
  LDA $02                                   ; $0CB868 |
  AND #$FFF0                                ; $0CB86A |
  STA $7142,y                               ; $0CB86D |
  LDA #$000A                                ; $0CB870 |
  STA $73C2,y                               ; $0CB873 |
  LDA #$0002                                ; $0CB876 |
  STA $7782,y                               ; $0CB879 |
  LDA #$000A                                ; $0CB87C |\ play sound #$000A
  JSL push_sound_queue                      ; $0CB87F |/
  RTS                                       ; $0CB883 |

CODE_0CB884:
  LDA !s_spr_wildcard_6_lo,y                ; $0CB884 |
  BPL CODE_0CB89D                           ; $0CB887 |

CODE_0CB889:
  LDA $700024,x                             ; $0CB889 |
  SEP #$10                                  ; $0CB88D |
  LDX $12                                   ; $0CB88F |
  BIT #$0008                                ; $0CB891 |
  BEQ CODE_0CB8A1                           ; $0CB894 |
  AND #$0010                                ; $0CB896 |
  BNE CODE_0CB8A2                           ; $0CB899 |
  BRA CODE_0CB8DE                           ; $0CB89B |

CODE_0CB89D:
  SEP #$10                                  ; $0CB89D |
  LDX $12                                   ; $0CB89F |

CODE_0CB8A1:
  RTS                                       ; $0CB8A1 |

CODE_0CB8A2:
  LDA !s_spr_y_speed_lo,x                   ; $0CB8A2 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CB8A5 |
  LDA #$005F                                ; $0CB8A7 |\ play sound #$005F
  JSL push_sound_queue                      ; $0CB8AA |/
  LDA #$01C7                                ; $0CB8AE |
  JSL spawn_ambient_sprite                  ; $0CB8B1 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB8B5 |
  STA $70A2,y                               ; $0CB8B8 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB8BB |
  CLC                                       ; $0CB8BE |
  ADC #$0008                                ; $0CB8BF |
  STA $7142,y                               ; $0CB8C2 |
  LDA #$FF40                                ; $0CB8C5 |
  STA $71E2,y                               ; $0CB8C8 |
  LDA #$0008                                ; $0CB8CB |
  STA $7502,y                               ; $0CB8CE |
  LDA #$0200                                ; $0CB8D1 |
  STA $75A2,y                               ; $0CB8D4 |
  LDA #$0030                                ; $0CB8D7 |
  STA $7782,y                               ; $0CB8DA |
  RTS                                       ; $0CB8DD |

CODE_0CB8DE:
  LDA !s_spr_y_speed_lo,x                   ; $0CB8DE |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CB8E1 |
  LDA #$005F                                ; $0CB8E3 |\ play sound #$005F
  JSL push_sound_queue                      ; $0CB8E6 |/
  LDA #$01BA                                ; $0CB8EA |
  JSL spawn_ambient_sprite                  ; $0CB8ED |
  LDA !s_spr_x_pixel_pos,x                  ; $0CB8F1 |
  STA $70A2,y                               ; $0CB8F4 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CB8F7 |
  STA $7142,y                               ; $0CB8FA |
  LDA #$001A                                ; $0CB8FD |
  STA $7E4C,y                               ; $0CB900 |
  LDA #$0003                                ; $0CB903 |
  STA $7782,y                               ; $0CB906 |
  RTS                                       ; $0CB909 |

CODE_0CB90A:
  LDY !s_spr_collision_id,x                 ; $0CB90A |
  BPL CODE_0CB913                           ; $0CB90D |
  JSL player_hit_sprite                     ; $0CB90F |

CODE_0CB913:
  RTS                                       ; $0CB913 |

init_hot_lips:
  LDA !s_spr_y_pixel_pos,x                  ; $0CB914 |
  SEC                                       ; $0CB917 |
  SBC #$0004                                ; $0CB918 |
  LDY !r_header_bg1_tileset                 ; $0CB91B |
  CPY #$03                                  ; $0CB91E |
  BNE CODE_0CB926                           ; $0CB920 |
  SEC                                       ; $0CB922 |
  SBC #$0004                                ; $0CB923 |

CODE_0CB926:
  STA !s_spr_y_pixel_pos,x                  ; $0CB926 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CB929 |

CODE_0CB92C:
  SEP #$20                                  ; $0CB92C |
  LDA #$05                                  ; $0CB92E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CB930 |
  TAY                                       ; $0CB932 |
  LDA $BA90,y                               ; $0CB933 |
  STA !s_spr_anim_frame,x                   ; $0CB936 |
  LDA $BA96,y                               ; $0CB939 |
  STA !s_spr_timer_1,x                      ; $0CB93C |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0CB93F |
  REP #$20                                  ; $0CB941 |
  RTL                                       ; $0CB943 |

; gsu table
  dw $FC08, $020D, $0100, $0DFC             ; $0CB944 |
  dw $0002, $0008, $0206, $F802             ; $0CB94C |
  dw $0000, $0202, $FC08, $020C             ; $0CB954 |
  dw $0100, $0CFC, $0002, $0008             ; $0CB95C |
  dw $0206, $F802, $0000, $0202             ; $0CB964 |
  dw $FC08, $420C, $0100, $0CFC             ; $0CB96C |
  dw $0042, $0008, $0206, $F802             ; $0CB974 |
  dw $0000, $0202, $FC08, $420D             ; $0CB97C |
  dw $0100, $0DFC, $0042, $0008             ; $0CB984 |
  dw $0206, $F802, $0000, $0202             ; $0CB98C |
  dw $FC08, $421C, $0100, $1CFC             ; $0CB994 |
  dw $0042, $0008, $0206, $F802             ; $0CB99C |
  dw $0000, $0202, $00F9, $0202             ; $0CB9A4 |
  dw $0902, $0600, $0202, $FC09             ; $0CB9AC |
  dw $020D, $0200, $0DFC, $0002             ; $0CB9B4 |
  dw $000A, $020A, $FA02, $0201             ; $0CB9BC |
  dw $0202, $FC0A, $020C, $0300             ; $0CB9C4 |
  dw $0CFC, $0002, $00F7, $0204             ; $0CB9CC |
  dw $0002, $1CFC, $0042, $FC07             ; $0CB9D4 |
  dw $021C, $0700, $0600, $0202             ; $0CB9DC |

; gsu table
  dw $FFF2, $FFFE, $FFEC, $FFF8             ; $0CB9E4 |
  dw $FFE6, $FFF2, $FFE0, $FFEC             ; $0CB9EC |
  dw $FFDA, $FFE6, $FFD4, $FFE0             ; $0CB9F4 |
  dw $FFCE, $FFDA, $FFC8, $FFD4             ; $0CB9FC |
  dw $FFC2, $FFCE, $FFBC, $FFC8             ; $0CBA04 |
  dw $FFB6, $FFC2, $FFB0, $FFBC             ; $0CBA0C |
  dw $FFAA, $FFB6, $FFA4, $FFB0             ; $0CBA14 |
  dw $FF9E, $FFAA, $FF98, $FFA4             ; $0CBA1C |
  dw $FF92, $FF9E, $FF8C, $FF98             ; $0CBA24 |

main_hot_lips:
  LDY !s_spr_draw_priority,x                ; $0CBA2C |
  BMI CODE_0CBA71                           ; $0CBA2F |
  LDA #$000C                                ; $0CBA31 |
  STA !gsu_r0                               ; $0CBA34 |
  LDA #$B944                                ; $0CBA37 |
  STA !gsu_r5                               ; $0CBA3A |
  LDA !s_spr_anim_frame,x                   ; $0CBA3D |
  STA !gsu_r1                               ; $0CBA40 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBA43 |
  STA !gsu_r2                               ; $0CBA45 |
  LDA #$B9E4                                ; $0CBA48 |
  STA !gsu_r3                               ; $0CBA4B |
  LDA #$000C                                ; $0CBA4E |
  STA !gsu_r4                               ; $0CBA51 |
  LDA #$0004                                ; $0CBA54 |
  STA $600A                                 ; $0CBA57 |
  LDA #$0004                                ; $0CBA5A |
  STA $600C                                 ; $0CBA5D |
  LDA #$020F                                ; $0CBA60 |
  STA $600E                                 ; $0CBA63 |
  LDX #$08                                  ; $0CBA66 |
  LDA #$9822                                ; $0CBA68 |
  JSL r_gsu_init_1                          ; $0CBA6B | GSU init
  LDX $12                                   ; $0CBA6F |

CODE_0CBA71:
  JSL $03AF23                               ; $0CBA71 |
  JSR CODE_0CBDFC                           ; $0CBA75 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CBA78 |
  TYX                                       ; $0CBA7A |
  JMP ($BA7E,x)                             ; $0CBA7B |

  dw $BA9C                                  ; $0CBA7E |
  dw $BAF3                                  ; $0CBA80 |
  dw $BB2F                                  ; $0CBA82 |
  dw $BB6C                                  ; $0CBA84 |
  dw $BB9B                                  ; $0CBA86 |
  dw $BBD9                                  ; $0CBA88 |
  dw $BC3E                                  ; $0CBA8A |
  dw $BC58                                  ; $0CBA8C |
  dw $BCAE                                  ; $0CBA8E |

  db $01, $02, $03, $02, $01, $00           ; $0CBA90 |

  db $10, $10, $10, $10, $10, $10           ; $0CBA96 |

  LDX $12                                   ; $0CBA9C |
  LDA !s_spr_x_player_dir,x                 ; $0CBA9E |
  AND #$00FF                                ; $0CBAA1 |
  STA !s_spr_facing_dir,x                   ; $0CBAA4 |
  LDA !s_spr_x_hitbox_center,x              ; $0CBAA7 |
  SEC                                       ; $0CBAAA |
  SBC !s_player_center_x                    ; $0CBAAB |
  CLC                                       ; $0CBAAE |
  ADC #$0080                                ; $0CBAAF |
  CMP #$0100                                ; $0CBAB2 |
  BCS CODE_0CBAE0                           ; $0CBAB5 |
  STZ !s_spr_anim_frame,x                   ; $0CBAB7 |
  LDA #$FE00                                ; $0CBABA |
  STA !s_spr_y_accel_ceiling,x              ; $0CBABD |
  LDA #$0010                                ; $0CBAC0 |
  STA !s_spr_y_accel,x                      ; $0CBAC3 |
  SEP #$20                                  ; $0CBAC6 |
  LDA #$05                                  ; $0CBAC8 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CBACA |
  TAY                                       ; $0CBACC |
  LDA $BA90,y                               ; $0CBACD |
  STA !s_spr_anim_frame,x                   ; $0CBAD0 |
  LDA $BA96,y                               ; $0CBAD3 |
  STA !s_spr_timer_1,x                      ; $0CBAD6 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBAD9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBADB |
  REP #$20                                  ; $0CBADD |
  RTL                                       ; $0CBADF |

CODE_0CBAE0:
  LDA #$0005                                ; $0CBAE0 |
  STA $00                                   ; $0CBAE3 |
  LDA #$BA90                                ; $0CBAE5 |
  STA $02                                   ; $0CBAE8 |
  LDA #$BA96                                ; $0CBAEA |
  STA $04                                   ; $0CBAED |
  JSR CODE_0CBE2D                           ; $0CBAEF |
  RTL                                       ; $0CBAF2 |

  LDX $12                                   ; $0CBAF3 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CBAF5 |
  SEC                                       ; $0CBAF8 |
  SBC #$0004                                ; $0CBAF9 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CBAFC |
  BMI CODE_0CBB26                           ; $0CBAFF |
  STA !s_spr_y_pixel_pos,x                  ; $0CBB01 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CBB04 |
  STZ !s_spr_y_accel,x                      ; $0CBB07 |
  STZ !s_spr_y_speed_lo,x                   ; $0CBB0A |
  SEP #$20                                  ; $0CBB0D |
  LDA #$03                                  ; $0CBB0F |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CBB11 |
  TAY                                       ; $0CBB13 |
  LDA $BB27,y                               ; $0CBB14 |
  STA !s_spr_anim_frame,x                   ; $0CBB17 |
  LDA $BB2B,y                               ; $0CBB1A |
  STA !s_spr_timer_1,x                      ; $0CBB1D |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB20 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB22 |
  REP #$20                                  ; $0CBB24 |

CODE_0CBB26:
  RTL                                       ; $0CBB26 |

  db $07, $06, $05, $00                     ; $0CBB27 |

  db $02, $30, $08, $50                     ; $0CBB2B |

  LDX $12                                   ; $0CBB2F |
  LDA !s_spr_timer_1,x                      ; $0CBB31 |
  BNE CODE_0CBB4C                           ; $0CBB34 |
  SEP #$20                                  ; $0CBB36 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CBB38 |
  BMI CODE_0CBB4D                           ; $0CBB3A |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CBB3C |
  LDA $BB27,y                               ; $0CBB3E |
  STA !s_spr_anim_frame,x                   ; $0CBB41 |
  LDA $BB2B,y                               ; $0CBB44 |
  STA !s_spr_timer_1,x                      ; $0CBB47 |
  REP #$20                                  ; $0CBB4A |

CODE_0CBB4C:
  RTL                                       ; $0CBB4C |

CODE_0CBB4D:
  LDA #$9DD1                                ; $0CBB4D |
  TYA                                       ; $0CBB50 |
  PLY                                       ; $0CBB51 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB52 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB54 |
  REP #$20                                  ; $0CBB56 |
  RTL                                       ; $0CBB58 |

  db $08, $08, $08, $08, $08, $08, $08, $08 ; $0CBB59 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $0CBB61 |
  db $08, $08, $10                          ; $0CBB69 |

  LDX $12                                   ; $0CBB6C |
  LDA !s_spr_timer_2,x                      ; $0CBB6E |
  BEQ CODE_0CBB92                           ; $0CBB71 |
  JSR CODE_0CBD85                           ; $0CBB73 |
  LDA !s_spr_timer_1,x                      ; $0CBB76 |
  BNE CODE_0CBB8E                           ; $0CBB79 |
  SEP #$20                                  ; $0CBB7B |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CBB7D |
  CPY #$12                                  ; $0CBB7F |
  BCS CODE_0CBB94                           ; $0CBB81 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CBB83 |
  INY                                       ; $0CBB85 |
  LDA $BB59,y                               ; $0CBB86 |
  STA !s_spr_timer_1,x                      ; $0CBB89 |
  REP #$20                                  ; $0CBB8C |

CODE_0CBB8E:
  JSR CODE_0CBD09                           ; $0CBB8E |
  RTL                                       ; $0CBB91 |

CODE_0CBB92:
  SEP #$20                                  ; $0CBB92 |

CODE_0CBB94:
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB94 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBB96 |
  REP #$20                                  ; $0CBB98 |
  RTL                                       ; $0CBB9A |

  LDX $12                                   ; $0CBB9B |
  LDA !s_spr_timer_1,x                      ; $0CBB9D |
  BNE CODE_0CBBAE                           ; $0CBBA0 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CBBA2 |
  BEQ CODE_0CBBB2                           ; $0CBBA4 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0CBBA6 |
  LDA #$0001                                ; $0CBBA8 |
  STA !s_spr_timer_1,x                      ; $0CBBAB |

CODE_0CBBAE:
  JSR CODE_0CBD09                           ; $0CBBAE |
  RTL                                       ; $0CBBB1 |

CODE_0CBBB2:
  SEP #$20                                  ; $0CBBB2 |
  LDA #$80                                  ; $0CBBB4 |
  STA !s_spr_timer_2,x                      ; $0CBBB6 |
  LDA #$03                                  ; $0CBBB9 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CBBBB |
  TAY                                       ; $0CBBBD |
  LDA $BBD1,y                               ; $0CBBBE |
  STA !s_spr_anim_frame,x                   ; $0CBBC1 |
  LDA $BBD5,y                               ; $0CBBC4 |
  STA !s_spr_timer_1,x                      ; $0CBBC7 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBBCA |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBBCC |
  REP #$20                                  ; $0CBBCE |
  RTL                                       ; $0CBBD0 |

  db $00, $01, $00, $04                     ; $0CBBD1 |

  db $04, $20, $04, $20                     ; $0CBBD5 |

  LDX $12                                   ; $0CBBD9 |
  LDA !s_spr_x_player_dir,x                 ; $0CBBDB |
  AND #$00FF                                ; $0CBBDE |
  STA !s_spr_facing_dir,x                   ; $0CBBE1 |
  LDA !s_spr_x_hitbox_center,x              ; $0CBBE4 |
  SEC                                       ; $0CBBE7 |
  SBC !s_player_center_x                    ; $0CBBE8 |
  CLC                                       ; $0CBBEB |
  ADC #$00A0                                ; $0CBBEC |
  CMP #$0140                                ; $0CBBEF |
  BCC CODE_0CBC0C                           ; $0CBBF2 |
  LDA #$0200                                ; $0CBBF4 |
  STA !s_spr_y_accel_ceiling,x              ; $0CBBF7 |
  LDA #$0010                                ; $0CBBFA |
  STA !s_spr_y_accel,x                      ; $0CBBFD |
  SEP #$20                                  ; $0CBC00 |
  STZ !s_spr_anim_frame,x                   ; $0CBC02 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBC05 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBC07 |
  REP #$20                                  ; $0CBC09 |
  RTL                                       ; $0CBC0B |

CODE_0CBC0C:
  LDA !s_spr_timer_2,x                      ; $0CBC0C |
  BEQ CODE_0CBC24                           ; $0CBC0F |
  LDA #$0003                                ; $0CBC11 |
  STA $00                                   ; $0CBC14 |
  LDA #$BBD1                                ; $0CBC16 |
  STA $02                                   ; $0CBC19 |
  LDA #$BBD5                                ; $0CBC1B |
  STA $04                                   ; $0CBC1E |
  JSR CODE_0CBE2D                           ; $0CBC20 |
  RTL                                       ; $0CBC23 |

CODE_0CBC24:
  SEP #$20                                  ; $0CBC24 |
  LDA #$03                                  ; $0CBC26 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CBC28 |
  TAY                                       ; $0CBC2A |
  LDA $BB27,y                               ; $0CBC2B |
  STA !s_spr_anim_frame,x                   ; $0CBC2E |
  LDA $BB2B,y                               ; $0CBC31 |
  STA !s_spr_timer_1,x                      ; $0CBC34 |
  LDA #$04                                  ; $0CBC37 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CBC39 |
  REP #$20                                  ; $0CBC3B |
  RTL                                       ; $0CBC3D |

  LDX $12                                   ; $0CBC3E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CBC40 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CBC43 |
  BPL CODE_0CBC57                           ; $0CBC46 |
  STA !s_spr_y_pixel_pos,x                  ; $0CBC48 |
  STZ !s_spr_y_speed_lo,x                   ; $0CBC4B |
  STZ !s_spr_y_accel,x                      ; $0CBC4E |
  STZ !s_spr_y_accel_ceiling,x              ; $0CBC51 |
  JMP CODE_0CB92C                           ; $0CBC54 |

CODE_0CBC57:
  RTL                                       ; $0CBC57 |

  LDX $12                                   ; $0CBC58 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CBC5A |
  BNE CODE_0CBC9D                           ; $0CBC5C |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CBC5E |
  CLC                                       ; $0CBC61 |
  ADC #$0010                                ; $0CBC62 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CBC65 |
  BMI CODE_0CBC80                           ; $0CBC68 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CBC6A |
  BNE CODE_0CBC7F                           ; $0CBC6C |
  LDA #$0200                                ; $0CBC6E |
  STA !s_spr_y_accel_ceiling,x              ; $0CBC71 |
  LDA #$0010                                ; $0CBC74 |
  STA !s_spr_y_accel,x                      ; $0CBC77 |
  STZ !s_spr_anim_frame,x                   ; $0CBC7A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CBC7D |

CODE_0CBC7F:
  RTL                                       ; $0CBC7F |

CODE_0CBC80:
  STA !s_spr_y_pixel_pos,x                  ; $0CBC80 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CBC83 |
  STZ !s_spr_y_accel,x                      ; $0CBC86 |
  STZ !s_spr_y_speed_lo,x                   ; $0CBC89 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CBC8C |
  LDA #$0140                                ; $0CBC8E |
  STA !s_spr_timer_1,x                      ; $0CBC91 |
  SEP #$20                                  ; $0CBC94 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBC96 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CBC98 |
  REP #$20                                  ; $0CBC9A |
  RTL                                       ; $0CBC9C |

CODE_0CBC9D:
  LDA !s_spr_timer_1,x                      ; $0CBC9D |
  BNE CODE_0CBCAA                           ; $0CBCA0 |
  DEC !s_spr_wildcard_3_lo_dp,x             ; $0CBCA2 |
  LDA #$0000                                ; $0CBCA4 |
  STA !s_spr_timer_1,x                      ; $0CBCA7 |

CODE_0CBCAA:
  JSR CODE_0CBD09                           ; $0CBCAA |
  RTL                                       ; $0CBCAD |

  LDX $12                                   ; $0CBCAE |
  LDA !s_spr_timer_1,x                      ; $0CBCB0 |
  BNE CODE_0CBCDE                           ; $0CBCB3 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CBCB5 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CBCB8 |
  BMI CODE_0CBCCC                           ; $0CBCBB |
  STA !s_spr_y_pixel_pos,x                  ; $0CBCBD |
  STZ !s_spr_y_accel_ceiling,x              ; $0CBCC0 |
  STZ !s_spr_y_accel,x                      ; $0CBCC3 |
  STZ !s_spr_y_speed_lo,x                   ; $0CBCC6 |
  JMP CODE_0CB92C                           ; $0CBCC9 |

CODE_0CBCCC:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CBCCC |
  BNE CODE_0CBCDE                           ; $0CBCCE |
  LDA #$FE00                                ; $0CBCD0 |
  STA !s_spr_y_accel_ceiling,x              ; $0CBCD3 |
  LDA #$0010                                ; $0CBCD6 |
  STA !s_spr_y_accel,x                      ; $0CBCD9 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CBCDC |

CODE_0CBCDE:
  RTL                                       ; $0CBCDE |

  dw $0001, $0001, $0001, $0001             ; $0CBCDF |
  dw $0001, $0001, $0001, $0001             ; $0CBCE7 |
  dw $0001, $0001, $0001, $0001             ; $0CBCEF |
  dw $0001, $0001, $0001, $0001             ; $0CBCF7 |
  dw $0001, $0001, $0003                    ; $0CBCFF |

  dw $FD00, $0300                           ; $0CBD05 |

CODE_0CBD09:
  LDA $14                                   ; $0CBD09 |
  AND #$0007                                ; $0CBD0B |
  BNE CODE_0CBD17                           ; $0CBD0E |
  LDA #$0061                                ; $0CBD10 |\ play sound #$0061
  JSL push_sound_queue                      ; $0CBD13 |/

CODE_0CBD17:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBD17 |
  ASL A                                     ; $0CBD19 |
  TAY                                       ; $0CBD1A |
  LDA $14                                   ; $0CBD1B |
  AND $BCDF,y                               ; $0CBD1D |
  BNE CODE_0CBD84                           ; $0CBD20 |
  LDY !s_spr_facing_dir,x                   ; $0CBD22 |
  LDA $BD05,y                               ; $0CBD25 |
  STA $00                                   ; $0CBD28 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBD2A |
  DEC A                                     ; $0CBD2C |
  ASL A                                     ; $0CBD2D |
  ASL A                                     ; $0CBD2E |
  TAY                                       ; $0CBD2F |
  LDA $B9E4,y                               ; $0CBD30 |
  PHY                                       ; $0CBD33 |
  LDY !s_spr_facing_dir,x                   ; $0CBD34 |
  BEQ CODE_0CBD3D                           ; $0CBD37 |
  EOR #$FFFF                                ; $0CBD39 |
  INC A                                     ; $0CBD3C |

CODE_0CBD3D:
  PLY                                       ; $0CBD3D |
  CLC                                       ; $0CBD3E |
  ADC !s_spr_x_pixel_pos,x                  ; $0CBD3F |
  STA $02                                   ; $0CBD42 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CBD44 |
  CLC                                       ; $0CBD47 |
  ADC $B9E6,y                               ; $0CBD48 |
  STA $04                                   ; $0CBD4B |
  LDA #$021B                                ; $0CBD4D |
  JSL spawn_ambient_sprite                  ; $0CBD50 |
  LDA $7002,y                               ; $0CBD54 |
  ORA #$0002                                ; $0CBD57 |
  STA $7002,y                               ; $0CBD5A |
  LDA !s_spr_facing_dir,x                   ; $0CBD5D |
  STA $73C0,y                               ; $0CBD60 |
  LDA $02                                   ; $0CBD63 |
  STA $70A2,y                               ; $0CBD65 |
  LDA $04                                   ; $0CBD68 |
  STA $7142,y                               ; $0CBD6A |
  LDA $00                                   ; $0CBD6D |
  STA $71E0,y                               ; $0CBD6F |
  LDA #$FD00                                ; $0CBD72 |
  STA $71E2,y                               ; $0CBD75 |
  LDA #$0010                                ; $0CBD78 |
  STA $7782,y                               ; $0CBD7B |
  LDA #$0002                                ; $0CBD7E |
  STA $73C2,y                               ; $0CBD81 |

CODE_0CBD84:
  RTS                                       ; $0CBD84 |

CODE_0CBD85:
  LDA #$000C                                ; $0CBD85 |
  STA !gsu_r0                               ; $0CBD88 |
  LDA #$B9E4                                ; $0CBD8B |
  STA !gsu_r1                               ; $0CBD8E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBD91 |
  STA !gsu_r12                              ; $0CBD93 |
  LDX #$A908                                ; $0CBD96 |
  ROL $94,x                                 ; $0CBD99 |
  JSL r_gsu_init_1                          ; $0CBD9B | GSU init
  LDX $12                                   ; $0CBD9F |
  LDA !gsu_r11                              ; $0CBDA1 |
  BPL CODE_0CBDA7                           ; $0CBDA4 |
  RTS                                       ; $0CBDA6 |

CODE_0CBDA7:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBDA7 |
  DEC A                                     ; $0CBDA9 |
  ASL A                                     ; $0CBDAA |
  ASL A                                     ; $0CBDAB |
  TAY                                       ; $0CBDAC |
  LDA $B9E4,y                               ; $0CBDAD |
  PHY                                       ; $0CBDB0 |
  LDY !s_spr_facing_dir,x                   ; $0CBDB1 |
  BEQ CODE_0CBDBA                           ; $0CBDB4 |
  EOR #$FFFF                                ; $0CBDB6 |
  INC A                                     ; $0CBDB9 |

CODE_0CBDBA:
  PLY                                       ; $0CBDBA |
  CLC                                       ; $0CBDBB |
  ADC !s_spr_x_pixel_pos,x                  ; $0CBDBC |
  STA $00                                   ; $0CBDBF |
  LDA !s_spr_y_pixel_pos,x                  ; $0CBDC1 |
  CLC                                       ; $0CBDC4 |
  ADC $B9E6,y                               ; $0CBDC5 |
  STA $02                                   ; $0CBDC8 |
  LDA !s_spr_timer_3,x                      ; $0CBDCA |
  BNE CODE_0CBDF2                           ; $0CBDCD |
  LDA #$0004                                ; $0CBDCF |
  STA !s_spr_timer_3,x                      ; $0CBDD2 |
  LDA #$021E                                ; $0CBDD5 |
  JSL spawn_ambient_sprite                  ; $0CBDD8 |
  LDA $00                                   ; $0CBDDC |
  STA $70A2,y                               ; $0CBDDE |
  LDA $02                                   ; $0CBDE1 |
  STA $7142,y                               ; $0CBDE3 |
  LDA #$0002                                ; $0CBDE6 |
  STA $7782,y                               ; $0CBDE9 |
  LDA #$0000                                ; $0CBDEC |
  STA $73C2,y                               ; $0CBDEF |

CODE_0CBDF2:
  REP #$10                                  ; $0CBDF2 |
  JSL $04AC9C                               ; $0CBDF4 |
  SEP #$10                                  ; $0CBDF8 |
  PLA                                       ; $0CBDFA |
  RTL                                       ; $0CBDFB |

CODE_0CBDFC:
  LDY !s_spr_collision_id,x                 ; $0CBDFC |
  BPL CODE_0CBE06                           ; $0CBDFF |
  JSL player_hit_sprite                     ; $0CBE01 |
  RTS                                       ; $0CBE05 |

CODE_0CBE06:
  DEY                                       ; $0CBE06 |
  BMI CODE_0CBE2C                           ; $0CBE07 |
  BEQ CODE_0CBE2C                           ; $0CBE09 |
  LDA !s_spr_state,y                        ; $0CBE0B |
  CMP #$0010                                ; $0CBE0E |
  BNE CODE_0CBE2C                           ; $0CBE11 |
  LDA !s_spr_collision_state,y              ; $0CBE13 |
  BEQ CODE_0CBE2C                           ; $0CBE16 |
  TYX                                       ; $0CBE18 |
  JSL $03B25B                               ; $0CBE19 |
  LDX $12                                   ; $0CBE1D |
  SEP #$20                                  ; $0CBE1F |
  LDA #$0E                                  ; $0CBE21 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CBE23 |
  REP #$20                                  ; $0CBE25 |
  STZ !s_spr_timer_1,x                      ; $0CBE27 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CBE2A |

CODE_0CBE2C:
  RTS                                       ; $0CBE2C |

CODE_0CBE2D:
  LDA !s_spr_timer_1,x                      ; $0CBE2D |
  BNE CODE_0CBE4B                           ; $0CBE30 |
  SEP #$20                                  ; $0CBE32 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CBE34 |
  BPL CODE_0CBE3C                           ; $0CBE36 |
  LDA $00                                   ; $0CBE38 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CBE3A |

CODE_0CBE3C:
  LDY !s_spr_wildcard_4_lo,x                ; $0CBE3C |
  LDA ($02),y                               ; $0CBE3F |
  STA !s_spr_anim_frame,x                   ; $0CBE41 |
  LDA ($04),y                               ; $0CBE44 |
  STA !s_spr_timer_1,x                      ; $0CBE46 |
  REP #$20                                  ; $0CBE49 |

CODE_0CBE4B:
  RTS                                       ; $0CBE4B |

; gsu table
  db $06, $1E, $1C, $00, $04, $16, $0D, $00 ; $0CBE4C |
  db $05, $1E, $1C, $00, $04, $16, $0C, $00 ; $0CBE54 |
  db $04, $1E, $1C, $00, $04, $16, $0C, $00 ; $0CBE5C |
  db $05, $1E, $1C, $40, $05, $16, $0C, $40 ; $0CBE64 |
  db $04, $1E, $1C, $40, $05, $16, $0C      ; $0CBE6C |

  db $40, $03, $1E, $1C, $40, $05, $16, $0D ; $0CBE73 |
  db $40, $06, $06, $06, $06, $08, $08, $08 ; $0CBE7B |
  db $08, $0A, $0A, $0A, $0A, $00, $01, $00 ; $0CBE83 |
  db $FF, $00, $01, $00, $FF, $06, $00, $08 ; $0CBE8B |
  db $00, $0A, $00, $0C, $00                ; $0CBE93 |

init_boo_balloon:
  LDA #$0001                                ; $0CBE98 |
  STA $0C7E                                 ; $0CBE9B |
  LDA $BE8C                                 ; $0CBE9E |
  STA !s_spr_x_accel_ceiling,x              ; $0CBEA1 |
  LDA #$0008                                ; $0CBEA4 |
  STA !s_spr_x_accel,x                      ; $0CBEA7 |
  LDA $BE88                                 ; $0CBEAA |
  STA !s_spr_y_accel_ceiling,x              ; $0CBEAD |
  LDA #$0008                                ; $0CBEB0 |
  STA !s_spr_y_accel,x                      ; $0CBEB3 |
  LDA #$0090                                ; $0CBEB6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBEB9 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CBEBB |
  AND #$0010                                ; $0CBEBE |
  LSR A                                     ; $0CBEC1 |
  LSR A                                     ; $0CBEC2 |
  LSR A                                     ; $0CBEC3 |
  STA !s_spr_wildcard_1_lo,x                ; $0CBEC4 |
  SEP #$20                                  ; $0CBEC7 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0CBEC9 |
  REP #$20                                  ; $0CBECB |
  RTL                                       ; $0CBECD |

  db $02, $01, $01, $00, $03, $04, $04, $05 ; $0CBECE |

main_boo_balloon:
  LDY !s_spr_draw_priority,x                ; $0CBED6 |
  BMI $46                                   ; $0CBED9 |
  LDA !s_spr_anim_frame,x                   ; $0CBEDB |
  BEQ $0E                                   ; $0CBEDE |
  REP #$10                                  ; $0CBEE0 |
  LDA !s_spr_oam_pointer,x                  ; $0CBEE2 |
  CLC                                       ; $0CBEE5 |
  ADC #$0018                                ; $0CBEE6 |
  TAY                                       ; $0CBEE9 |
  JSL $03AA60                               ; $0CBEEA |
  LDA #$000C                                ; $0CBEEE |
  STA !gsu_r0                               ; $0CBEF1 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CBEF4 |
  AND #$00FF                                ; $0CBEF6 |
  ASL A                                     ; $0CBEF9 |
  ASL A                                     ; $0CBEFA |
  ASL A                                     ; $0CBEFB |
  CLC                                       ; $0CBEFC |
  ADC #$BE4C                                ; $0CBEFD |
  STA !gsu_r1                               ; $0CBF00 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBF03 |
  LSR A                                     ; $0CBF05 |
  LSR A                                     ; $0CBF06 |
  LSR A                                     ; $0CBF07 |
  LSR A                                     ; $0CBF08 |
  AND #$001F                                ; $0CBF09 |
  TAY                                       ; $0CBF0C |
  LDA $BE73,y                               ; $0CBF0D |
  AND #$00FF                                ; $0CBF10 |
  STA !gsu_r2                               ; $0CBF13 |
  LDX #$08                                  ; $0CBF16 |
  LDA #$98C1                                ; $0CBF18 |
  JSL r_gsu_init_1                          ; $0CBF1B | GSU init
  LDX $12                                   ; $0CBF1F |
  LDA !s_spr_state,x                        ; $0CBF21 |
  CMP #$0008                                ; $0CBF24 |
  BNE CODE_0CBF2E                           ; $0CBF27 |
  JSR CODE_0CC27A                           ; $0CBF29 |
  PLA                                       ; $0CBF2C |
  PLY                                       ; $0CBF2D |

CODE_0CBF2E:
  JSL $03AF23                               ; $0CBF2E |
  JSR CODE_0CC01F                           ; $0CBF32 |
  JSR CODE_0CC220                           ; $0CBF35 |
  LDA !s_spr_x_player_dir,x                 ; $0CBF38 |
  AND #$00FF                                ; $0CBF3B |
  STA !s_spr_facing_dir,x                   ; $0CBF3E |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CBF41 |
  TYX                                       ; $0CBF43 |
  JSR ($BF97,x)                             ; $0CBF44 |
  LDA $0C7E                                 ; $0CBF47 |
  BNE CODE_0CBF5E                           ; $0CBF4A |
  LDA !s_spr_oam_1,x                        ; $0CBF4C |
  ORA #$0004                                ; $0CBF4F |
  STA !s_spr_oam_1,x                        ; $0CBF52 |
  LDA #$FF00                                ; $0CBF55 |
  STA !s_spr_y_speed_lo,x                   ; $0CBF58 |
  STZ !s_spr_x_speed_lo,x                   ; $0CBF5B |

CODE_0CBF5E:
  LDY #$00                                  ; $0CBF5E |
  LDA !s_spr_facing_dir,x                   ; $0CBF60 |
  DEC A                                     ; $0CBF63 |
  EOR !s_spr_x_speed_lo,x                   ; $0CBF64 |
  BPL CODE_0CBF6B                           ; $0CBF67 |
  LDY #$04                                  ; $0CBF69 |

CODE_0CBF6B:
  STY $7960                                 ; $0CBF6B |
  SEP #$20                                  ; $0CBF6E |
  LDA !s_spr_x_speed_hi,x                   ; $0CBF70 |
  BPL CODE_0CBF78                           ; $0CBF73 |
  EOR #$FF                                  ; $0CBF75 |
  INC A                                     ; $0CBF77 |

CODE_0CBF78:
  CMP #$03                                  ; $0CBF78 |
  BCC CODE_0CBF7E                           ; $0CBF7A |
  LDA #$03                                  ; $0CBF7C |

CODE_0CBF7E:
  CLC                                       ; $0CBF7E |
  ADC $00                                   ; $0CBF7F |
  TAY                                       ; $0CBF81 |
  LDA $BECE,y                               ; $0CBF82 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CBF85 |
  REP #$20                                  ; $0CBF87 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CBF89 |
  TYX                                       ; $0CBF8B |
  JMP ($BF8F,x)                             ; $0CBF8C |

  dw $BF9D                                  ; $0CBF8F |
  dw $BFA6                                  ; $0CBF91 |
  dw $BFD6                                  ; $0CBF93 |
  dw $C006                                  ; $0CBF95 |
  dw $C11F                                  ; $0CBF97 |
  dw $C156                                  ; $0CBF99 |
  dw $C1AA                                  ; $0CBF9B |

  LDX $12                                   ; $0CBF9D |
  JSR CODE_0CC065                           ; $0CBF9F |
  JSR CODE_0CC0F5                           ; $0CBFA2 |
  RTL                                       ; $0CBFA5 |

  LDX $12                                   ; $0CBFA6 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0CBFA8 |
  BNE CODE_0CBFBF                           ; $0CBFAA |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFAC |
  CMP #$00E0                                ; $0CBFAE |
  BCS CODE_0CBFBC                           ; $0CBFB1 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFB3 |
  CLC                                       ; $0CBFB5 |
  ADC #$0002                                ; $0CBFB6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBFB9 |
  RTL                                       ; $0CBFBB |

CODE_0CBFBC:
  INC !s_spr_wildcard_6_lo_dp,x             ; $0CBFBC |
  RTL                                       ; $0CBFBE |

CODE_0CBFBF:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFBF |
  CMP #$00CC                                ; $0CBFC1 |
  BCC CODE_0CBFCF                           ; $0CBFC4 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFC6 |
  SEC                                       ; $0CBFC8 |
  SBC #$0002                                ; $0CBFC9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBFCC |
  RTL                                       ; $0CBFCE |

CODE_0CBFCF:
  JSR CODE_0CC065                           ; $0CBFCF |
  JSR CODE_0CC0F5                           ; $0CBFD2 |
  RTL                                       ; $0CBFD5 |

  LDX $12                                   ; $0CBFD6 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0CBFD8 |
  BNE CODE_0CBFEF                           ; $0CBFDA |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFDC |
  CMP #$0120                                ; $0CBFDE |
  BCS CODE_0CBFEC                           ; $0CBFE1 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFE3 |
  CLC                                       ; $0CBFE5 |
  ADC #$0002                                ; $0CBFE6 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBFE9 |
  RTL                                       ; $0CBFEB |

CODE_0CBFEC:
  INC !s_spr_wildcard_6_lo_dp,x             ; $0CBFEC |
  RTL                                       ; $0CBFEE |

CODE_0CBFEF:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFEF |
  CMP #$0100                                ; $0CBFF1 |
  BCC CODE_0CBFFF                           ; $0CBFF4 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CBFF6 |
  SEC                                       ; $0CBFF8 |
  SBC #$0002                                ; $0CBFF9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CBFFC |
  RTL                                       ; $0CBFFE |

CODE_0CBFFF:
  JSR CODE_0CC065                           ; $0CBFFF |
  JSR CODE_0CC0F5                           ; $0CC002 |
  RTL                                       ; $0CC005 |

  LDX $12                                   ; $0CC006 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC008 |
  CMP #$0130                                ; $0CC00A |
  BCS CODE_0CC018                           ; $0CC00D |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC00F |
  CLC                                       ; $0CC011 |
  ADC #$0002                                ; $0CC012 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC015 |
  RTL                                       ; $0CC017 |

CODE_0CC018:
  LDA #$000E                                ; $0CC018 |
  STA !s_spr_state,x                        ; $0CC01B |
  RTL                                       ; $0CC01E |

CODE_0CC01F:
  LDA !s_spr_anim_frame,x                   ; $0CC01F |
  BEQ CODE_0CC064                           ; $0CC022 |
  LDA !s_spr_dyntile_index,x                ; $0CC024 |
  BMI CODE_0CC064                           ; $0CC027 |
  REP #$10                                  ; $0CC029 |
  LDA #$0000                                ; $0CC02B |
  STA !gsu_r5                               ; $0CC02E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC031 |
  STA !gsu_r6                               ; $0CC033 |
  LDA #$40C1                                ; $0CC036 |
  STA !gsu_r12                              ; $0CC039 |
  LDA #$0055                                ; $0CC03C |
  STA !gsu_r13                              ; $0CC03F |
  LDY !s_spr_dyntile_index,x                ; $0CC042 |
  TYX                                       ; $0CC045 |
  LDA $03A9CE,x                             ; $0CC046 |
  STA !gsu_r3                               ; $0CC04A |
  LDA $03A9EE,x                             ; $0CC04D |
  STA !gsu_r2                               ; $0CC051 |
  SEP #$10                                  ; $0CC054 |
  LDX #$08                                  ; $0CC056 |
  LDA #$8205                                ; $0CC058 |
  JSL r_gsu_init_1                          ; $0CC05B | GSU init
  INC $0CF9                                 ; $0CC05F |
  LDX $12                                   ; $0CC062 |

CODE_0CC064:
  RTS                                       ; $0CC064 |

CODE_0CC065:
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CC065 |
  LDY !s_spr_collision_id,x                 ; $0CC068 |
  BPL CODE_0CC072                           ; $0CC06B |
  JSL player_hit_sprite                     ; $0CC06D |

CODE_0CC071:
  RTS                                       ; $0CC071 |

CODE_0CC072:
  DEY                                       ; $0CC072 |
  BMI CODE_0CC071                           ; $0CC073 |
  BEQ CODE_0CC071                           ; $0CC075 |
  LDA !s_spr_state,y                        ; $0CC077 |
  CMP #$0010                                ; $0CC07A |
  BNE CODE_0CC071                           ; $0CC07D |
  LDA !s_spr_collision_state,y              ; $0CC07F |
  BEQ CODE_0CC071                           ; $0CC082 |
  LDA !s_spr_x_speed_lo,y                   ; $0CC084 |
  AND #$8000                                ; $0CC087 |
  ASL A                                     ; $0CC08A |
  ROL A                                     ; $0CC08B |
  ASL A                                     ; $0CC08C |
  STA $00                                   ; $0CC08D |
  LDA !s_spr_y_speed_lo,y                   ; $0CC08F |
  AND #$8000                                ; $0CC092 |
  ASL A                                     ; $0CC095 |
  ROL A                                     ; $0CC096 |
  ASL A                                     ; $0CC097 |
  STA $02                                   ; $0CC098 |
  TYX                                       ; $0CC09A |
  JSL $03B24B                               ; $0CC09B |
  LDY $00                                   ; $0CC09F |
  LDA $C276,y                               ; $0CC0A1 |
  STA !s_spr_x_speed_lo,x                   ; $0CC0A4 |
  LDY $02                                   ; $0CC0A7 |
  LDA $C276,y                               ; $0CC0A9 |
  STA !s_spr_y_speed_lo,x                   ; $0CC0AC |

CODE_0CC0AF:
  LDX $12                                   ; $0CC0AF |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CC0B1 |
  BNE CODE_0CC071                           ; $0CC0B4 |
  INC !s_spr_gsu_morph_1_lo,x               ; $0CC0B6 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CC0B9 |
  BNE CODE_0CC0CC                           ; $0CC0BB |
  LDA #$0001                                ; $0CC0BD |
  STA !s_spr_anim_frame,x                   ; $0CC0C0 |
  JSL $03AD74                               ; $0CC0C3 |
  BCC CODE_0CC0ED                           ; $0CC0C7 |
  JSR CODE_0CC01F                           ; $0CC0C9 |

CODE_0CC0CC:
  LDA #$0016                                ; $0CC0CC |\ play sound #$0016
  JSL push_sound_queue                      ; $0CC0CF |/
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0CC0D3 |
  SEP #$20                                  ; $0CC0D5 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CC0D7 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CC0D9 |
  REP #$20                                  ; $0CC0DB |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CC0DD |
  LDA $BE90,y                               ; $0CC0DF |
  STA !s_spr_hitbox_width,x                 ; $0CC0E2 |
  LDA $BE90,y                               ; $0CC0E5 |
  STA !s_spr_hitbox_height,x                ; $0CC0E8 |
  PLA                                       ; $0CC0EB |
  RTL                                       ; $0CC0EC |

CODE_0CC0ED:
  LDA #$000E                                ; $0CC0ED |
  STA !s_spr_state,x                        ; $0CC0F0 |
  PLA                                       ; $0CC0F3 |
  RTL                                       ; $0CC0F4 |

CODE_0CC0F5:
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CC0F5 |
  BNE CODE_0CC11E                           ; $0CC0F7 |
  LDA $10                                   ; $0CC0F9 |
  AND #$007F                                ; $0CC0FB |
  CMP #$003F                                ; $0CC0FE |
  BNE CODE_0CC11E                           ; $0CC101 |
  JSL random_number_gen                     ; $0CC103 |
  LDA $10                                   ; $0CC107 |
  AND #$000F                                ; $0CC109 |
  CLC                                       ; $0CC10C |
  ADC #$0020                                ; $0CC10D |
  STA !s_spr_timer_2,x                      ; $0CC110 |
  JSR CODE_0CC174                           ; $0CC113 |
  SEP #$20                                  ; $0CC116 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CC118 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CC11A |
  REP #$20                                  ; $0CC11C |

CODE_0CC11E:
  RTS                                       ; $0CC11E |

  LDX $12                                   ; $0CC11F |
  LDY #$00                                  ; $0CC121 |
  LDA !s_spr_cam_y_pos,x                    ; $0CC123 |
  CMP #$0020                                ; $0CC126 |
  BMI CODE_0CC12D                           ; $0CC129 |
  INY                                       ; $0CC12B |
  INY                                       ; $0CC12C |

CODE_0CC12D:
  LDA $BE88,y                               ; $0CC12D |
  STA !s_spr_y_accel_ceiling,x              ; $0CC130 |
  LDA !s_spr_x_speed_lo,x                   ; $0CC133 |
  BPL CODE_0CC147                           ; $0CC136 |
  LDA !s_spr_cam_x_pos,x                    ; $0CC138 |
  CMP #$0060                                ; $0CC13B |
  BPL CODE_0CC146                           ; $0CC13E |
  LDA $BE8C                                 ; $0CC140 |
  STA !s_spr_x_accel_ceiling,x              ; $0CC143 |

CODE_0CC146:
  RTS                                       ; $0CC146 |

CODE_0CC147:
  LDA !s_spr_cam_x_pos,x                    ; $0CC147 |
  CMP #$0090                                ; $0CC14A |
  BMI CODE_0CC155                           ; $0CC14D |
  LDA $BE8E                                 ; $0CC14F |
  STA !s_spr_x_accel_ceiling,x              ; $0CC152 |

CODE_0CC155:
  RTS                                       ; $0CC155 |

  LDX $12                                   ; $0CC156 |
  LDA !s_spr_timer_2,x                      ; $0CC158 |
  BNE CODE_0CC174                           ; $0CC15B |
  LDA $BE8E                                 ; $0CC15D |
  LDY !s_spr_x_speed_hi,x                   ; $0CC160 |
  BMI CODE_0CC168                           ; $0CC163 |
  LDA $BE8C                                 ; $0CC165 |

CODE_0CC168:
  STA !s_spr_x_accel_ceiling,x              ; $0CC168 |
  SEP #$20                                  ; $0CC16B |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CC16D |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CC16F |
  REP #$20                                  ; $0CC171 |
  RTS                                       ; $0CC173 |

CODE_0CC174:
  LDA !s_player_center_x                    ; $0CC174 |
  STA !gsu_r1                               ; $0CC177 |
  LDA !s_player_center_y                    ; $0CC17A |
  STA !gsu_r2                               ; $0CC17D |
  LDA !s_spr_x_hitbox_center,x              ; $0CC180 |
  STA !gsu_r3                               ; $0CC183 |
  LDA !s_spr_y_hitbox_center,x              ; $0CC186 |
  STA !gsu_r4                               ; $0CC189 |
  LDA #$0300                                ; $0CC18C |
  STA !gsu_r6                               ; $0CC18F |
  LDX #$09                                  ; $0CC192 |
  LDA #$907C                                ; $0CC194 |
  JSL r_gsu_init_1                          ; $0CC197 | GSU init
  LDX $12                                   ; $0CC19B |
  LDA !gsu_r1                               ; $0CC19D |
  STA !s_spr_x_accel_ceiling,x              ; $0CC1A0 |
  LDA !gsu_r2                               ; $0CC1A3 |
  STA !s_spr_y_accel_ceiling,x              ; $0CC1A6 |
  RTS                                       ; $0CC1A9 |

  LDX $12                                   ; $0CC1AA |
  LDY #$00                                  ; $0CC1AC |
  LDA !s_spr_cam_y_pos,x                    ; $0CC1AE |
  CMP #$0020                                ; $0CC1B1 |
  BMI CODE_0CC1B8                           ; $0CC1B4 |
  INY                                       ; $0CC1B6 |
  INY                                       ; $0CC1B7 |

CODE_0CC1B8:
  LDA $BE88,y                               ; $0CC1B8 |
  STA !s_spr_y_accel_ceiling,x              ; $0CC1BB |
  LDA !s_spr_x_speed_lo,x                   ; $0CC1BE |
  BPL CODE_0CC1D3                           ; $0CC1C1 |
  LDA !s_spr_cam_x_pos,x                    ; $0CC1C3 |
  CMP #$0060                                ; $0CC1C6 |
  BPL CODE_0CC1E1                           ; $0CC1C9 |
  LDA $BE8C                                 ; $0CC1CB |
  STA !s_spr_x_accel_ceiling,x              ; $0CC1CE |
  BRA CODE_0CC1E1                           ; $0CC1D1 |

CODE_0CC1D3:
  LDA !s_spr_cam_x_pos,x                    ; $0CC1D3 |
  CMP #$0090                                ; $0CC1D6 |
  BMI CODE_0CC1E1                           ; $0CC1D9 |
  LDA $BE8E                                 ; $0CC1DB |
  STA !s_spr_x_accel_ceiling,x              ; $0CC1DE |

CODE_0CC1E1:
  LDA !s_spr_cam_y_pos,x                    ; $0CC1E1 |
  SEC                                       ; $0CC1E4 |
  SBC #$0020                                ; $0CC1E5 |
  CLC                                       ; $0CC1E8 |
  ADC #$0008                                ; $0CC1E9 |
  CMP #$0010                                ; $0CC1EC |
  BCS CODE_0CC217                           ; $0CC1EF |
  LDA !s_spr_cam_x_pos,x                    ; $0CC1F1 |
  CMP #$00F0                                ; $0CC1F4 |
  BCS CODE_0CC217                           ; $0CC1F7 |
  LDA $10                                   ; $0CC1F9 |
  AND #$003F                                ; $0CC1FB |
  CLC                                       ; $0CC1FE |
  ADC #$0040                                ; $0CC1FF |
  STA !s_spr_timer_2,x                      ; $0CC202 |
  LDA #$0008                                ; $0CC205 |
  STA !s_spr_y_accel,x                      ; $0CC208 |
  LDA #$0008                                ; $0CC20B |
  STA !s_spr_x_accel,x                      ; $0CC20E |
  SEP #$20                                  ; $0CC211 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CC213 |
  REP #$20                                  ; $0CC215 |

CODE_0CC217:
  RTS                                       ; $0CC217 |

  dw $0100, $0800                           ; $0CC218 |

  dw $0100, $0800                           ; $0CC21C |

CODE_0CC220:
  LDA $0C7E                                 ; $0CC220 |
  BEQ CODE_0CC275                           ; $0CC223 |
  LDA !s_spr_cam_x_pos,x                    ; $0CC225 |
  CLC                                       ; $0CC228 |
  ADC #$0020                                ; $0CC229 |
  CMP #$0130                                ; $0CC22C |
  BCC CODE_0CC24D                           ; $0CC22F |
  LDY #$00                                  ; $0CC231 |
  CLC                                       ; $0CC233 |
  ADC #$0030                                ; $0CC234 |
  CMP #$0190                                ; $0CC237 |
  BCC CODE_0CC23E                           ; $0CC23A |
  INY                                       ; $0CC23C |
  INY                                       ; $0CC23D |

CODE_0CC23E:
  LDA $C218,y                               ; $0CC23E |
  LDY $7681,x                               ; $0CC241 |
  BMI CODE_0CC24A                           ; $0CC244 |
  EOR #$FFFF                                ; $0CC246 |
  INC A                                     ; $0CC249 |

CODE_0CC24A:
  STA !s_spr_x_speed_lo,x                   ; $0CC24A |

CODE_0CC24D:
  LDA !s_spr_cam_y_pos,x                    ; $0CC24D |
  CLC                                       ; $0CC250 |
  ADC #$0020                                ; $0CC251 |
  CMP #$0110                                ; $0CC254 |
  BCC CODE_0CC275                           ; $0CC257 |
  LDY #$00                                  ; $0CC259 |
  CLC                                       ; $0CC25B |
  ADC #$0030                                ; $0CC25C |
  CMP #$0170                                ; $0CC25F |
  BCC CODE_0CC266                           ; $0CC262 |
  INY                                       ; $0CC264 |
  INY                                       ; $0CC265 |

CODE_0CC266:
  LDA $C21C,y                               ; $0CC266 |
  LDY $7683,x                               ; $0CC269 |
  BMI CODE_0CC272                           ; $0CC26C |
  EOR #$FFFF                                ; $0CC26E |
  INC A                                     ; $0CC271 |

CODE_0CC272:
  STA !s_spr_y_speed_lo,x                   ; $0CC272 |

CODE_0CC275:
  RTS                                       ; $0CC275 |

  dw $0100, $FF00                           ; $0CC276 |

CODE_0CC27A:
  LDA !s_player_mouth_state                 ; $0CC27A |
  CMP #$0003                                ; $0CC27D |
  BCC CODE_0CC28A                           ; $0CC280 |
  LDA #$FF00                                ; $0CC282 |
  STA !s_spr_y_speed_lo,x                   ; $0CC285 |
  BRA CODE_0CC293                           ; $0CC288 |

CODE_0CC28A:
  LDY !s_spr_x_player_dir,x                 ; $0CC28A |
  LDA $C276,y                               ; $0CC28D |
  STA !s_spr_x_speed_lo,x                   ; $0CC290 |

CODE_0CC293:
  LDA #$0010                                ; $0CC293 |
  STA !s_spr_state,x                        ; $0CC296 |
  STZ $6162                                 ; $0CC299 |
  STZ !s_tongued_sprite_slot                ; $0CC29C |
  RTS                                       ; $0CC29F |

  JSR CODE_0CC0AF                           ; $0CC2A0 |
  RTL                                       ; $0CC2A3 |

  LDY !s_spr_draw_priority,x                ; $0CC2A4 |
  BMI CODE_0CC2EF                           ; $0CC2A7 |
  LDA !s_spr_anim_frame,x                   ; $0CC2A9 |
  BEQ CODE_0CC2BC                           ; $0CC2AC |
  REP #$10                                  ; $0CC2AE |
  LDA !s_spr_oam_pointer,x                  ; $0CC2B0 |
  CLC                                       ; $0CC2B3 |
  ADC #$0018                                ; $0CC2B4 |
  TAY                                       ; $0CC2B7 |
  JSL $03AA60                               ; $0CC2B8 |

CODE_0CC2BC:
  LDA #$000C                                ; $0CC2BC |
  STA !gsu_r0                               ; $0CC2BF |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CC2C2 |
  AND #$00FF                                ; $0CC2C4 |
  ASL A                                     ; $0CC2C7 |
  ASL A                                     ; $0CC2C8 |
  ASL A                                     ; $0CC2C9 |
  CLC                                       ; $0CC2CA |
  ADC #$BE4C                                ; $0CC2CB |
  STA !gsu_r1                               ; $0CC2CE |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC2D1 |
  LSR A                                     ; $0CC2D3 |
  LSR A                                     ; $0CC2D4 |
  LSR A                                     ; $0CC2D5 |
  LSR A                                     ; $0CC2D6 |
  AND #$001F                                ; $0CC2D7 |
  TAY                                       ; $0CC2DA |
  LDA $BE73,y                               ; $0CC2DB |
  AND #$00FF                                ; $0CC2DE |
  STA !gsu_r2                               ; $0CC2E1 |
  LDX #$08                                  ; $0CC2E4 |
  LDA #$98C1                                ; $0CC2E6 |
  JSL r_gsu_init_1                          ; $0CC2E9 | GSU init
  LDX $12                                   ; $0CC2ED |

CODE_0CC2EF:
  LDA #$003B                                ; $0CC2EF |\ play sound #$003B
  JSL push_sound_queue                      ; $0CC2F2 |/
  JSL $04849E                               ; $0CC2F6 |
  JSL $03A32E                               ; $0CC2FA |
  LDY !s_spr_wildcard_1_lo,x                ; $0CC2FE |
  TYX                                       ; $0CC301 |
  JSR ($C306,x)                             ; $0CC302 |
  RTL                                       ; $0CC305 |

  dw $C32B                                  ; $0CC306 |
  dw $C30A                                  ; $0CC308 |

  LDX $12                                   ; $0CC30A |
  LDA #$009D                                ; $0CC30C |
  JSL spawn_sprite_init                     ; $0CC30F |
  BCC CODE_0CC348                           ; $0CC313 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CC315 |
  STA !s_spr_x_pixel_pos,y                  ; $0CC318 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CC31B |
  STA !s_spr_y_pixel_pos,y                  ; $0CC31E |
  LDA !s_spr_oam_1,y                        ; $0CC321 |
  AND #$FFF3                                ; $0CC324 |
  STA !s_spr_oam_1,y                        ; $0CC327 |
  RTS                                       ; $0CC32A |

  LDX $12                                   ; $0CC32B |
  LDA #$0115                                ; $0CC32D |
  JSL spawn_sprite_init                     ; $0CC330 |
  BCC CODE_0CC348                           ; $0CC334 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CC336 |
  STA !s_spr_x_pixel_pos,y                  ; $0CC339 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CC33C |
  STA !s_spr_y_pixel_pos,y                  ; $0CC33F |
  LDA #$FE00                                ; $0CC342 |
  STA !s_spr_y_speed_lo,y                   ; $0CC345 |

CODE_0CC348:
  RTS                                       ; $0CC348 |

  db $10, $20, $30, $40, $50, $60, $70, $80 ; $0CC349 |
  db $90, $A0, $B0, $C0, $D0, $E0, $F0, $10 ; $0CC351 |
  db $00, $10, $20, $30, $40, $50, $60, $70 ; $0CC359 |
  db $80, $90, $A0, $B0, $C0, $D0, $00, $10 ; $0CC361 |

init_kamek_shoots_magic:
  JSL $03AE60                               ; $0CC369 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CC36D |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CC370 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CC373 |
  STA !s_spr_wildcard_1_lo,x                ; $0CC376 |
  LDA #$0000                                ; $0CC379 |
  STA !s_spr_anim_frame,x                   ; $0CC37C |
  LDA #$0100                                ; $0CC37F |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CC382 |
  SEP #$20                                  ; $0CC384 |
  LDA !s_spr_oam_count,x                    ; $0CC386 |
  AND #$27                                  ; $0CC389 |
  STA !s_spr_oam_count,x                    ; $0CC38B |
  LDA #$FF                                  ; $0CC38E |
  STA !s_spr_draw_priority,x                ; $0CC390 |
  LDA #$02                                  ; $0CC393 |
  STA $77C0,x                               ; $0CC395 |
  REP #$20                                  ; $0CC398 |

CODE_0CC39A:
  RTL                                       ; $0CC39A |

main_kamek_shoots_magic:
  LDA !s_spr_anim_frame,x                   ; $0CC39B |
  BNE CODE_0CC3A4                           ; $0CC39E |
  JSL $03AA52                               ; $0CC3A0 |

CODE_0CC3A4:
  JSL $03AF23                               ; $0CC3A4 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CC3A8 |
  TYX                                       ; $0CC3AA |
  JMP ($C3AE,x)                             ; $0CC3AB |

  dw $C3BA                                  ; $0CC3AE |
  dw $C53D                                  ; $0CC3B0 |
  dw $C580                                  ; $0CC3B2 |
  dw $C478                                  ; $0CC3B4 |
  dw $C5BC                                  ; $0CC3B6 |
  dw $C5E0                                  ; $0CC3B8 |

  LDX $12                                   ; $0CC3BA |
  LDA !s_spr_timer_1,x                      ; $0CC3BC |
  BNE CODE_0CC39A                           ; $0CC3BF |
  LDA $10                                   ; $0CC3C1 |
  AND #$000F                                ; $0CC3C3 |
  TAY                                       ; $0CC3C6 |
  LDA $C349,y                               ; $0CC3C7 |
  AND #$00FF                                ; $0CC3CA |
  STA $00                                   ; $0CC3CD |
  LDA !r_bg1_cam_x                          ; $0CC3CF |
  AND #$FFF0                                ; $0CC3D2 |
  CLC                                       ; $0CC3D5 |
  ADC $00                                   ; $0CC3D6 |
  STA !gsu_r1                               ; $0CC3D8 |
  JSL random_number_gen                     ; $0CC3DB |
  LDA #$0030                                ; $0CC3DF |
  STA !gsu_r2                               ; $0CC3E2 |
  LDA #$0040                                ; $0CC3E5 |
  STA $6020                                 ; $0CC3E8 |
  LDX #$0A                                  ; $0CC3EB |
  LDA #$E921                                ; $0CC3ED |
  JSL r_gsu_init_3                          ; $0CC3F0 | GSU init
  LDX $12                                   ; $0CC3F4 |
  LDA !gsu_r10                              ; $0CC3F6 |
  BNE CODE_0CC442                           ; $0CC3F9 |
  LDY #$00                                  ; $0CC3FB |
  LDA !gsu_r1                               ; $0CC3FD |
  STA !s_spr_x_pixel_pos,x                  ; $0CC400 |
  CLC                                       ; $0CC403 |
  ADC !s_spr_x_hitbox_offset,x              ; $0CC404 |
  SEC                                       ; $0CC407 |
  SBC !s_player_center_x                    ; $0CC408 |
  BPL CODE_0CC40F                           ; $0CC40B |
  INY                                       ; $0CC40D |
  INY                                       ; $0CC40E |

CODE_0CC40F:
  TYA                                       ; $0CC40F |
  STA !s_spr_facing_dir,x                   ; $0CC410 |
  LDA !gsu_r2                               ; $0CC413 |
  SEC                                       ; $0CC416 |
  SBC #$0013                                ; $0CC417 |
  STA !s_spr_y_pixel_pos,x                  ; $0CC41A |
  STZ !s_spr_anim_frame,x                   ; $0CC41D |
  LDA #$0031                                ; $0CC420 |\ play sound #$0031
  JSL push_sound_queue                      ; $0CC423 |/
  LDA $10                                   ; $0CC427 |
  BPL CODE_0CC443                           ; $0CC429 |
  LDA #$0030                                ; $0CC42B |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC42E |
  SEP #$20                                  ; $0CC430 |
  LDA #$FF                                  ; $0CC432 |
  STA $7862,x                               ; $0CC434 |
  LDA #$05                                  ; $0CC437 |
  STA !s_spr_draw_priority,x                ; $0CC439 |
  LDA #$02                                  ; $0CC43C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC43E |
  REP #$20                                  ; $0CC440 |

CODE_0CC442:
  RTL                                       ; $0CC442 |

CODE_0CC443:
  LDA #$0001                                ; $0CC443 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CC446 |
  LDA $10                                   ; $0CC448 |
  AND #$003F                                ; $0CC44A |
  STA !s_spr_wildcard_3_lo,x                ; $0CC44D |
  LDA #$003F                                ; $0CC450 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CC453 |
  SEP #$20                                  ; $0CC455 |
  LDA #$05                                  ; $0CC457 |
  STA !s_spr_draw_priority,x                ; $0CC459 |
  LDA #$04                                  ; $0CC45C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC45E |
  REP #$20                                  ; $0CC460 |
  JSR CODE_0CC6C4                           ; $0CC462 |
  RTL                                       ; $0CC465 |

  db $01, $06, $05, $04, $03, $02, $01      ; $0CC466 |

  db $10, $08, $10, $02, $02, $02, $30      ; $0CC46D |

  dw $FFF0, $0010                           ; $0CC474 |

  LDX $12                                   ; $0CC478 |
  JSR CODE_0CC6F9                           ; $0CC47A |
  JSR CODE_0CC6F3                           ; $0CC47D |
  LDA !s_spr_timer_1,x                      ; $0CC480 |
  BNE CODE_0CC4D7                           ; $0CC483 |
  SEP #$20                                  ; $0CC485 |
  DEC !s_spr_wildcard_4_hi_dp,x             ; $0CC487 |
  BMI CODE_0CC4D8                           ; $0CC489 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CC48B |
  LDA $C46D,y                               ; $0CC48D |
  STA !s_spr_timer_1,x                      ; $0CC490 |
  LDA $C466,y                               ; $0CC493 |
  STA !s_spr_anim_frame,x                   ; $0CC496 |
  REP #$20                                  ; $0CC499 |
  CPY #$01                                  ; $0CC49B |
  BNE CODE_0CC4D7                           ; $0CC49D |
  LDY !s_spr_facing_dir,x                   ; $0CC49F |
  LDA !s_spr_x_pixel_pos,x                  ; $0CC4A2 |
  CLC                                       ; $0CC4A5 |
  ADC $C474,y                               ; $0CC4A6 |
  STA $00                                   ; $0CC4A9 |
  LDA #$01AE                                ; $0CC4AB |
  JSL spawn_sprite_active                   ; $0CC4AE |
  BCC CODE_0CC4D7                           ; $0CC4B2 |
  LDA $00                                   ; $0CC4B4 |
  STA !s_spr_x_pixel_pos,y                  ; $0CC4B6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CC4B9 |
  CLC                                       ; $0CC4BC |
  ADC #$0002                                ; $0CC4BD |
  STA !s_spr_y_pixel_pos,y                  ; $0CC4C0 |
  LDA !s_spr_x_pixel_pos,y                  ; $0CC4C3 |
  CLC                                       ; $0CC4C6 |
  ADC !s_spr_x_hitbox_offset,y              ; $0CC4C7 |
  STA !s_spr_x_hitbox_center,y              ; $0CC4CA |
  LDA !s_spr_y_pixel_pos,y                  ; $0CC4CD |
  CLC                                       ; $0CC4D0 |
  ADC !s_spr_y_hitbox_offset,y              ; $0CC4D1 |
  STA !s_spr_y_hitbox_center,y              ; $0CC4D4 |

CODE_0CC4D7:
  RTL                                       ; $0CC4D7 |

CODE_0CC4D8:
  DEC $77C0,x                               ; $0CC4D8 |
  BEQ CODE_0CC4F6                           ; $0CC4DB |
  LDA #$06                                  ; $0CC4DD |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CC4DF |
  TAY                                       ; $0CC4E1 |
  LDA #$08                                  ; $0CC4E2 |
  STA !s_spr_timer_1,x                      ; $0CC4E4 |
  LDA $C466,y                               ; $0CC4E7 |
  STA !s_spr_anim_frame,x                   ; $0CC4EA |
  LDA !s_spr_x_player_dir,x                 ; $0CC4ED |
  STA !s_spr_facing_dir,x                   ; $0CC4F0 |
  REP #$20                                  ; $0CC4F3 |
  RTL                                       ; $0CC4F5 |

CODE_0CC4F6:
  LDA #$02                                  ; $0CC4F6 |
  STA $77C0,x                               ; $0CC4F8 |
  LDA #$31                                  ; $0CC4FB |
  JSL push_sound_queue                      ; $0CC4FD |
  LDA !s_spr_oam_count,x                    ; $0CC501 |
  AND #$27                                  ; $0CC504 |
  STA !s_spr_oam_count,x                    ; $0CC506 |
  STZ !s_spr_anim_frame,x                   ; $0CC509 |
  LDA $10                                   ; $0CC50C |
  AND #$01                                  ; $0CC50E |
  PHP                                       ; $0CC510 |
  JSL random_number_gen                     ; $0CC511 |
  PLP                                       ; $0CC515 |
  BNE CODE_0CC524                           ; $0CC516 |
  LDA #$08                                  ; $0CC518 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC51A |
  REP #$20                                  ; $0CC51C |
  LDA #$0100                                ; $0CC51E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC521 |
  RTL                                       ; $0CC523 |

CODE_0CC524:
  LDA #$0A                                  ; $0CC524 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC526 |
  REP #$20                                  ; $0CC528 |
  LDA #$0001                                ; $0CC52A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CC52D |
  LDA $10                                   ; $0CC52F |
  AND #$003F                                ; $0CC531 |
  STA !s_spr_wildcard_3_lo,x                ; $0CC534 |
  LDA #$003F                                ; $0CC537 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CC53A |
  RTL                                       ; $0CC53C |

  LDX $12                                   ; $0CC53D |
  JSR CODE_0CC5F4                           ; $0CC53F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC542 |
  CMP #$0100                                ; $0CC544 |
  BCS CODE_0CC550                           ; $0CC547 |
  CLC                                       ; $0CC549 |
  ADC #$0010                                ; $0CC54A |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC54D |
  RTL                                       ; $0CC54F |

CODE_0CC550:
  LDA #$0100                                ; $0CC550 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC553 |
  SEP #$20                                  ; $0CC555 |
  LDA !s_spr_oam_count,x                    ; $0CC557 |
  ORA #$10                                  ; $0CC55A |
  STA !s_spr_oam_count,x                    ; $0CC55C |
  LDA #$06                                  ; $0CC55F |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CC561 |
  TAY                                       ; $0CC563 |
  LDA $C46D,y                               ; $0CC564 |
  STA !s_spr_timer_1,x                      ; $0CC567 |
  LDA $C466,y                               ; $0CC56A |
  STA !s_spr_anim_frame,x                   ; $0CC56D |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CC570 |
  CLC                                       ; $0CC572 |
  ADC #$04                                  ; $0CC573 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC575 |
  LDA !s_spr_x_player_dir,x                 ; $0CC577 |
  STA !s_spr_facing_dir,x                   ; $0CC57A |
  REP #$20                                  ; $0CC57D |
  RTL                                       ; $0CC57F |

  LDX $12                                   ; $0CC580 |
  JSR CODE_0CC679                           ; $0CC582 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0CC585 |
  BMI CODE_0CC594                           ; $0CC587 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC589 |
  CLC                                       ; $0CC58B |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0CC58C |
  AND #$003F                                ; $0CC58E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC591 |
  RTL                                       ; $0CC593 |

CODE_0CC594:
  SEP #$20                                  ; $0CC594 |
  LDA !s_spr_oam_count,x                    ; $0CC596 |
  ORA #$10                                  ; $0CC599 |
  STA !s_spr_oam_count,x                    ; $0CC59B |
  LDA #$06                                  ; $0CC59E |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CC5A0 |
  TAY                                       ; $0CC5A2 |
  LDA $C46D,y                               ; $0CC5A3 |
  STA !s_spr_timer_1,x                      ; $0CC5A6 |
  LDA $C466,y                               ; $0CC5A9 |
  STA !s_spr_anim_frame,x                   ; $0CC5AC |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CC5AF |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CC5B1 |
  LDA !s_spr_x_player_dir,x                 ; $0CC5B3 |
  STA !s_spr_facing_dir,x                   ; $0CC5B6 |
  REP #$20                                  ; $0CC5B9 |
  RTL                                       ; $0CC5BB |

  LDX $12                                   ; $0CC5BC |
  JSR CODE_0CC5F4                           ; $0CC5BE |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC5C1 |
  CMP #$0030                                ; $0CC5C3 |
  BCC CODE_0CC5CF                           ; $0CC5C6 |
  SEC                                       ; $0CC5C8 |
  SBC #$0010                                ; $0CC5C9 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC5CC |
  RTL                                       ; $0CC5CE |

CODE_0CC5CF:
  SEP #$20                                  ; $0CC5CF |
  LDA #$FF                                  ; $0CC5D1 |
  STA !s_spr_draw_priority,x                ; $0CC5D3 |
  LDA #$20                                  ; $0CC5D6 |
  STA !s_spr_timer_1,x                      ; $0CC5D8 |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CC5DB |
  REP #$20                                  ; $0CC5DD |
  RTL                                       ; $0CC5DF |

  LDX $12                                   ; $0CC5E0 |
  JSR CODE_0CC640                           ; $0CC5E2 |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0CC5E5 |
  BMI CODE_0CC5CF                           ; $0CC5E7 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC5E9 |
  CLC                                       ; $0CC5EB |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0CC5EC |
  AND #$003F                                ; $0CC5EE |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC5F1 |
  RTL                                       ; $0CC5F3 |

CODE_0CC5F4:
  LDA !s_spr_anim_frame,x                   ; $0CC5F4 |
  BNE CODE_0CC63F                           ; $0CC5F7 |
  LDA !s_spr_dyntile_index,x                ; $0CC5F9 |
  BMI CODE_0CC63F                           ; $0CC5FC |
  REP #$10                                  ; $0CC5FE |
  LDA #$0010                                ; $0CC600 |
  STA !gsu_r8                               ; $0CC603 |
  LDA #$001F                                ; $0CC606 |
  STA !gsu_r9                               ; $0CC609 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC60C |
  STA !gsu_r6                               ; $0CC60E |
  LDA #$60C1                                ; $0CC611 |
  STA !gsu_r12                              ; $0CC614 |
  LDA #$0055                                ; $0CC617 |
  STA !gsu_r13                              ; $0CC61A |
  LDY !s_spr_dyntile_index,x                ; $0CC61D |
  TYX                                       ; $0CC620 |
  LDA $03A9CE,x                             ; $0CC621 |
  STA !gsu_r3                               ; $0CC625 |
  LDA $03A9EE,x                             ; $0CC628 |
  STA !gsu_r2                               ; $0CC62C |
  SEP #$10                                  ; $0CC62F |
  LDX #$08                                  ; $0CC631 |
  LDA #$8293                                ; $0CC633 |
  JSL r_gsu_init_1                          ; $0CC636 | GSU init
  INC $0CF9                                 ; $0CC63A |
  LDX $12                                   ; $0CC63D |

CODE_0CC63F:
  RTS                                       ; $0CC63F |

CODE_0CC640:
  LDA !s_spr_anim_frame,x                   ; $0CC640 |
  BNE CODE_0CC678                           ; $0CC643 |
  LDA !s_spr_dyntile_index,x                ; $0CC645 |
  BMI CODE_0CC678                           ; $0CC648 |
  REP #$10                                  ; $0CC64A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC64C |
  STA !gsu_r5                               ; $0CC64E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CC651 |
  STA !gsu_r12                              ; $0CC653 |
  LDY !s_spr_dyntile_index,x                ; $0CC656 |
  TYX                                       ; $0CC659 |
  LDA $03A9CE,x                             ; $0CC65A |
  STA !gsu_r3                               ; $0CC65E |
  LDA $03A9EE,x                             ; $0CC661 |
  STA !gsu_r4                               ; $0CC665 |
  SEP #$10                                  ; $0CC668 |
  LDX #$08                                  ; $0CC66A |
  LDA #$9981                                ; $0CC66C |
  JSL r_gsu_init_1                          ; $0CC66F | GSU init
  INC $0CF9                                 ; $0CC673 |
  LDX $12                                   ; $0CC676 |

CODE_0CC678:
  RTS                                       ; $0CC678 |

CODE_0CC679:
  LDA !s_spr_anim_frame,x                   ; $0CC679 |
  BNE CODE_0CC6C3                           ; $0CC67C |
  LDA !s_spr_dyntile_index,x                ; $0CC67E |
  BMI CODE_0CC6C3                           ; $0CC681 |
  REP #$10                                  ; $0CC683 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC685 |
  STA !gsu_r5                               ; $0CC687 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CC68A |
  STA !gsu_r12                              ; $0CC68C |
  LDY !s_spr_dyntile_index,x                ; $0CC68F |
  TYX                                       ; $0CC692 |
  LDA $03A9CE,x                             ; $0CC693 |
  STA !gsu_r3                               ; $0CC697 |
  LDA $03A9EE,x                             ; $0CC69A |
  STA !gsu_r4                               ; $0CC69E |
  LDA #$60C0                                ; $0CC6A1 |
  STA !gsu_r6                               ; $0CC6A4 |
  LDA #$0055                                ; $0CC6A7 |
  STA !gsu_r7                               ; $0CC6AA |
  LDA #$0004                                ; $0CC6AD |
  STA !gsu_r8                               ; $0CC6B0 |
  SEP #$10                                  ; $0CC6B3 |
  LDX #$08                                  ; $0CC6B5 |
  LDA #$9A4B                                ; $0CC6B7 |
  JSL r_gsu_init_1                          ; $0CC6BA | GSU init
  INC $0CF9                                 ; $0CC6BE |
  LDX $12                                   ; $0CC6C1 |

CODE_0CC6C3:
  RTS                                       ; $0CC6C3 |

CODE_0CC6C4:
  LDA !s_spr_anim_frame,x                   ; $0CC6C4 |
  BNE CODE_0CC6F2                           ; $0CC6C7 |
  LDA !s_spr_dyntile_index,x                ; $0CC6C9 |
  BMI CODE_0CC6F2                           ; $0CC6CC |
  REP #$10                                  ; $0CC6CE |
  LDY !s_spr_dyntile_index,x                ; $0CC6D0 |
  TYX                                       ; $0CC6D3 |
  LDA $03A9CE,x                             ; $0CC6D4 |
  STA !gsu_r1                               ; $0CC6D8 |
  LDA $03A9EE,x                             ; $0CC6DB |
  STA !gsu_r2                               ; $0CC6DF |
  SEP #$10                                  ; $0CC6E2 |
  LDX #$08                                  ; $0CC6E4 |
  LDA #$9A29                                ; $0CC6E6 |
  JSL r_gsu_init_1                          ; $0CC6E9 | GSU init
  INC $0CF9                                 ; $0CC6ED |
  LDX $12                                   ; $0CC6F0 |

CODE_0CC6F2:
  RTS                                       ; $0CC6F2 |

CODE_0CC6F3:
  LDY !s_spr_collision_id,x                 ; $0CC6F3 |
  BPL CODE_0CC6F8                           ; $0CC6F6 |

CODE_0CC6F8:
  RTS                                       ; $0CC6F8 |

CODE_0CC6F9:
  LDA !s_spr_x_pixel_pos,x                  ; $0CC6F9 |\
  SEC                                       ; $0CC6FC | |
  SBC !s_player_x                           ; $0CC6FD | | compare kamek's X coord
  CLC                                       ; $0CC700 | | to Yoshi's
  ADC #$0020                                ; $0CC701 | |
  CMP #$0040                                ; $0CC704 | |
  BCS CODE_0CC719                           ; $0CC707 |/
  LDA !s_spr_y_pixel_pos,x                  ; $0CC709 |\
  SEC                                       ; $0CC70C | |
  SBC !s_player_y                           ; $0CC70D | | compare kamek's Y coord
  CLC                                       ; $0CC710 | | to Yoshi's
  ADC #$0020                                ; $0CC711 | |
  CMP #$0040                                ; $0CC714 | |
  BCC CODE_0CC74E                           ; $0CC717 |/

CODE_0CC719:
  TXA                                       ; $0CC719 |
  STA !gsu_r1                               ; $0CC71A |
  LDX #$09                                  ; $0CC71D |
  LDA #$8F33                                ; $0CC71F |
  JSL r_gsu_init_1                          ; $0CC722 | GSU init
  LDX $12                                   ; $0CC726 |
  LDY !gsu_r1                               ; $0CC728 |
  BMI CODE_0CC74D                           ; $0CC72B |
  LDA !s_spr_x_pixel_pos,x                  ; $0CC72D |
  SEC                                       ; $0CC730 |
  SBC !s_spr_x_pixel_pos,y                  ; $0CC731 |
  CLC                                       ; $0CC734 |
  ADC #$0020                                ; $0CC735 |
  CMP #$0040                                ; $0CC738 |
  BCS CODE_0CC74D                           ; $0CC73B |
  LDA !s_spr_y_pixel_pos,x                  ; $0CC73D |
  SEC                                       ; $0CC740 |
  SBC !s_spr_y_pixel_pos,y                  ; $0CC741 |
  CLC                                       ; $0CC744 |
  ADC #$0020                                ; $0CC745 |
  CMP #$0040                                ; $0CC748 |
  BCC CODE_0CC74E                           ; $0CC74B |

CODE_0CC74D:
  RTS                                       ; $0CC74D |

CODE_0CC74E:
  LDA #$0031                                ; $0CC74E |\ play sound #$0031
  JSL push_sound_queue                      ; $0CC751 |/
  SEP #$20                                  ; $0CC755 |
  LDA !s_spr_oam_count,x                    ; $0CC757 |
  AND #$27                                  ; $0CC75A |
  STA !s_spr_oam_count,x                    ; $0CC75C |
  STZ !s_spr_anim_frame,x                   ; $0CC75F |
  LDA $10                                   ; $0CC762 |
  AND #$01                                  ; $0CC764 |
  PHP                                       ; $0CC766 |
  JSL random_number_gen                     ; $0CC767 |
  PLP                                       ; $0CC76B |
  BNE CODE_0CC77B                           ; $0CC76C |
  LDA #$08                                  ; $0CC76E |\ change state to shrinking
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC770 |/
  REP #$20                                  ; $0CC772 |
  LDA #$0100                                ; $0CC774 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC777 |
  BRA CODE_0CC793                           ; $0CC779 |

CODE_0CC77B:
  LDA #$0A                                  ; $0CC77B |\ change state to fading
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC77D |/
  REP #$20                                  ; $0CC77F |
  LDA #$0001                                ; $0CC781 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CC784 |
  LDA $10                                   ; $0CC786 |
  AND #$003F                                ; $0CC788 |
  STA !s_spr_wildcard_3_lo,x                ; $0CC78B |
  LDA #$003F                                ; $0CC78E |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CC791 |

CODE_0CC793:
  PLA                                       ; $0CC793 |
  RTL                                       ; $0CC794 |

main_kamek_magic:
  RTL                                       ; $0CC795 |

init_kamek_magic:
  RTL                                       ; $0CC796 |

  JSL $03AF23                               ; $0CC797 |
  JSR CODE_0CC844                           ; $0CC79B |
  JSR CODE_0CC8D4                           ; $0CC79E |
  LDA !s_spr_timer_1,x                      ; $0CC7A1 |
  BNE CODE_0CC7BB                           ; $0CC7A4 |
  LDA !s_spr_anim_frame,x                   ; $0CC7A6 |
  INC A                                     ; $0CC7A9 |
  CMP #$000C                                ; $0CC7AA |
  BCC CODE_0CC7B2                           ; $0CC7AD |
  LDA #$0000                                ; $0CC7AF |

CODE_0CC7B2:
  STA !s_spr_anim_frame,x                   ; $0CC7B2 |
  LDA #$0002                                ; $0CC7B5 |
  STA !s_spr_timer_1,x                      ; $0CC7B8 |

CODE_0CC7BB:
  LDA !s_spr_timer_2,x                      ; $0CC7BB |
  BNE CODE_0CC7CD                           ; $0CC7BE |
  LDA #$0808                                ; $0CC7C0 |
  JSL $029BD9                               ; $0CC7C3 |
  LDA #$0005                                ; $0CC7C7 |
  STA !s_spr_timer_2,x                      ; $0CC7CA |

CODE_0CC7CD:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CC7CD |
  TYX                                       ; $0CC7CF |
  JMP ($C7D3,x)                             ; $0CC7D0 |

  dw $C7D7                                  ; $0CC7D3 |
  dw $C839                                  ; $0CC7D5 |

  LDX $12                                   ; $0CC7D7 |
  LDA #$0004                                ; $0CC7D9 |\ play sound #$0004
  JSL push_sound_queue                      ; $0CC7DC |/
  LDA !s_spr_timer_4,x                      ; $0CC7E0 |
  BNE CODE_0CC838                           ; $0CC7E3 |
  LDA !s_player_center_x                    ; $0CC7E5 |
  STA !gsu_r1                               ; $0CC7E8 |
  LDA !s_player_center_y                    ; $0CC7EB |
  STA !gsu_r2                               ; $0CC7EE |
  LDA !s_spr_x_hitbox_center,x              ; $0CC7F1 |
  STA !gsu_r3                               ; $0CC7F4 |
  LDA !s_spr_y_hitbox_center,x              ; $0CC7F7 |
  STA !gsu_r4                               ; $0CC7FA |
  LDA #$0200                                ; $0CC7FD |
  STA !gsu_r6                               ; $0CC800 |
  LDX #$09                                  ; $0CC803 |
  LDA #$907C                                ; $0CC805 |
  JSL r_gsu_init_1                          ; $0CC808 | GSU init
  LDX $12                                   ; $0CC80C |
  LDA !gsu_r1                               ; $0CC80E |
  STA !s_spr_x_accel_ceiling,x              ; $0CC811 |
  BPL CODE_0CC81A                           ; $0CC814 |
  EOR #$FFFF                                ; $0CC816 |
  INC A                                     ; $0CC819 |

CODE_0CC81A:
  LSR A                                     ; $0CC81A |
  LSR A                                     ; $0CC81B |
  LSR A                                     ; $0CC81C |
  LSR A                                     ; $0CC81D |
  STA !s_spr_x_accel,x                      ; $0CC81E |
  LDA !gsu_r2                               ; $0CC821 |
  STA !s_spr_y_accel_ceiling,x              ; $0CC824 |
  BPL CODE_0CC82D                           ; $0CC827 |
  EOR #$FFFF                                ; $0CC829 |
  INC A                                     ; $0CC82C |

CODE_0CC82D:
  LSR A                                     ; $0CC82D |
  LSR A                                     ; $0CC82E |
  LSR A                                     ; $0CC82F |
  LSR A                                     ; $0CC830 |
  STA !s_spr_y_accel,x                      ; $0CC831 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CC834 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CC836 |

CODE_0CC838:
  RTL                                       ; $0CC838 |

  LDX $12                                   ; $0CC839 |
  RTL                                       ; $0CC83B |

  dw $013E, $0108, $001E, $01A2             ; $0CC83C |

CODE_0CC844:
  REP #$10                                  ; $0CC844 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CC846 |
  TAX                                       ; $0CC849 |
  LDA $700006,x                             ; $0CC84A |
  CMP #$9D8B                                ; $0CC84E |
  BEQ CODE_0CC858                           ; $0CC851 |
  SEP #$10                                  ; $0CC853 |
  LDX $12                                   ; $0CC855 |
  RTS                                       ; $0CC857 |

CODE_0CC858:
  LDA $700000,x                             ; $0CC858 |
  AND #$FFF0                                ; $0CC85C |
  STA $00                                   ; $0CC85F |
  STA $0091                                 ; $0CC861 |
  LDA $700002,x                             ; $0CC864 |
  AND #$FFF0                                ; $0CC868 |
  STA $02                                   ; $0CC86B |
  STA $0093                                 ; $0CC86D |
  SEP #$10                                  ; $0CC870 |
  LDA #$0001                                ; $0CC872 |
  STA $008F                                 ; $0CC875 |
  LDA #$0000                                ; $0CC878 |
  STA $0095                                 ; $0CC87B |
  JSL $109295                               ; $0CC87E |
  LDA #$0015                                ; $0CC882 |\ play sound #$0015
  JSL push_sound_queue                      ; $0CC885 |/
  LDX $12                                   ; $0CC889 |
  LDA #$01E6                                ; $0CC88B |
  JSL spawn_ambient_sprite                  ; $0CC88E |
  LDA $00                                   ; $0CC892 |
  STA $70A2,y                               ; $0CC894 |
  LDA $02                                   ; $0CC897 |
  STA $7142,y                               ; $0CC899 |
  LDA #$0006                                ; $0CC89C |
  STA $73C2,y                               ; $0CC89F |
  STA $7E4C,y                               ; $0CC8A2 |
  LDA #$0004                                ; $0CC8A5 |
  STA $7782,y                               ; $0CC8A8 |
  LDA $10                                   ; $0CC8AB |
  AND #$0006                                ; $0CC8AD |
  TAY                                       ; $0CC8B0 |
  LDA $C83C,y                               ; $0CC8B1 |
  TXY                                       ; $0CC8B4 |
  JSL $03A377                               ; $0CC8B5 |
  LDA !s_spr_x_player_dir,x                 ; $0CC8B9 |
  AND #$00FF                                ; $0CC8BC |
  STA !s_spr_facing_dir,y                   ; $0CC8BF |
  LDA $00                                   ; $0CC8C2 |
  STA !s_spr_x_pixel_pos,y                  ; $0CC8C4 |
  LDA $02                                   ; $0CC8C7 |
  STA !s_spr_y_pixel_pos,y                  ; $0CC8C9 |
  LDA #$0002                                ; $0CC8CC |
  STA !s_spr_state,y                        ; $0CC8CF |
  PLA                                       ; $0CC8D2 |
  RTL                                       ; $0CC8D3 |

CODE_0CC8D4:
  LDY !s_spr_collision_id,x                 ; $0CC8D4 |
  BMI CODE_0CC8DA                           ; $0CC8D7 |
  RTS                                       ; $0CC8D9 |

CODE_0CC8DA:
  JSL player_hit_sprite                     ; $0CC8DA |
  PLA                                       ; $0CC8DE |
  JML $03A31E                               ; $0CC8DF |

init_tulip:
  JSL $03D3F8                               ; $0CC8E3 |
  BEQ CODE_0CC8ED                           ; $0CC8E7 |
  JML $03A31E                               ; $0CC8E9 |

CODE_0CC8ED:
  STZ !s_spr_facing_dir,x                   ; $0CC8ED |
  JSL $03AE8D                               ; $0CC8F0 |
  LDA #$0100                                ; $0CC8F4 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC8F7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CC8F9 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CC8FC |
  JSR CODE_0CCC22                           ; $0CC8FF |
  LDA #$0008                                ; $0CC902 |
  STA !s_spr_x_hitbox_offset,x              ; $0CC905 |
  JSL $0CC969                               ; $0CC908 |
  RTL                                       ; $0CC90C |

  dw $FD00, $FD80, $FC00, $FC80             ; $0CC90D |
  dw $FD40, $FDC0, $FC40, $FCC0             ; $0CC915 |

main_tulip:
  JSR CODE_0CCBD3                           ; $0CC91D |
  JSL $03AF23                               ; $0CC920 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CC924 |
  TYX                                       ; $0CC926 |
  JMP ($C92A,x)                             ; $0CC927 |

  dw $C938                                  ; $0CC92A |
  dw $C98E                                  ; $0CC92C |
  dw $C9B9                                  ; $0CC92E |
  dw $CA44                                  ; $0CC930 |
  dw $CAE3                                  ; $0CC932 |
  dw $CB1E                                  ; $0CC934 |
  dw $CB62                                  ; $0CC936 |

  LDX $12                                   ; $0CC938 |
  JSR CODE_0CCC22                           ; $0CC93A |
  JSR CODE_0CCD43                           ; $0CC93D |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC940 |
  CMP #$1FE0                                ; $0CC942 |
  BCC CODE_0CC95B                           ; $0CC945 |
  LDA #$1FE0                                ; $0CC947 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC94A |
  LDA #$00A0                                ; $0CC94C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC94F |
  SEP #$20                                  ; $0CC951 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CC953 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CC955 |
  REP #$20                                  ; $0CC957 |
  BRA CODE_0CC969                           ; $0CC959 |

CODE_0CC95B:
  CLC                                       ; $0CC95B |
  ADC #$0055                                ; $0CC95C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC95F |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CC961 |
  SEC                                       ; $0CC963 |
  SBC #$0001                                ; $0CC964 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC967 |

CODE_0CC969:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC969 |
  XBA                                       ; $0CC96B |
  AND #$00FF                                ; $0CC96C |
  LSR A                                     ; $0CC96F |
  LSR A                                     ; $0CC970 |
  LSR A                                     ; $0CC971 |
  STA $00                                   ; $0CC972 |
  CLC                                       ; $0CC974 |
  ADC #$0008                                ; $0CC975 |
  STA !s_spr_y_hitbox_offset,x              ; $0CC978 |
  LDA #$0008                                ; $0CC97B |
  CLC                                       ; $0CC97E |
  ADC $00                                   ; $0CC97F |
  STA !s_spr_hitbox_width,x                 ; $0CC981 |
  LDA #$000A                                ; $0CC984 |
  SEC                                       ; $0CC987 |
  SBC $00                                   ; $0CC988 |
  STA !s_spr_hitbox_height,x                ; $0CC98A |
  RTL                                       ; $0CC98D |

  LDX $12                                   ; $0CC98E |
  JSR CODE_0CCC22                           ; $0CC990 |
  JSR CODE_0CCD43                           ; $0CC993 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC996 |
  BNE CODE_0CC9A9                           ; $0CC998 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CC99A |
  LDA #$0100                                ; $0CC99C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC99F |
  SEP #$20                                  ; $0CC9A1 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0CC9A3 |
  REP #$20                                  ; $0CC9A5 |
  BRA CODE_0CC969                           ; $0CC9A7 |

CODE_0CC9A9:
  SEC                                       ; $0CC9A9 |
  SBC #$0055                                ; $0CC9AA |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CC9AD |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CC9AF |
  CLC                                       ; $0CC9B1 |
  ADC #$0001                                ; $0CC9B2 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC9B5 |
  BRA CODE_0CC969                           ; $0CC9B7 |
  LDX $12                                   ; $0CC9B9 |
  JSR CODE_0CCC22                           ; $0CC9BB |
  JSR CODE_0CCE17                           ; $0CC9BE |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CC9C1 |
  BNE CODE_0CCA12                           ; $0CC9C3 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CC9C5 |
  LDA #$0100                                ; $0CC9C7 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CC9CA |
  LDA #$0010                                ; $0CC9CC |
  STA !s_spr_y_hitbox_offset,x              ; $0CC9CF |
  LDA #$0008                                ; $0CC9D2 |
  STA !s_spr_hitbox_width,x                 ; $0CC9D5 |
  LDA #$0006                                ; $0CC9D8 |
  STA !s_spr_hitbox_height,x                ; $0CC9DB |
  LDA !r_stars_amount                       ; $0CC9DE |
  BEQ CODE_0CC9F6                           ; $0CC9E1 |
  STA !reg_wrdivl                           ; $0CC9E3 |
  LDY #$0A                                  ; $0CC9E6 |
  STY !reg_wrdivb                           ; $0CC9E8 |
  NOP                                       ; $0CC9EB |
  NOP                                       ; $0CC9EC |
  NOP                                       ; $0CC9ED |
  NOP                                       ; $0CC9EE |
  NOP                                       ; $0CC9EF |
  NOP                                       ; $0CC9F0 |
  NOP                                       ; $0CC9F1 |
  NOP                                       ; $0CC9F2 |
  LDA !reg_rddivl                           ; $0CC9F3 |

CODE_0CC9F6:
  SEP #$20                                  ; $0CC9F6 |
  STA $00                                   ; $0CC9F8 |
  LDA #$1E                                  ; $0CC9FA |
  SEC                                       ; $0CC9FC |
  SBC $00                                   ; $0CC9FD |
  STA !s_spr_wildcard_2_hi,x                ; $0CC9FF |
  LDA #$08                                  ; $0CCA02 |
  STA !s_spr_wildcard_2_lo,x                ; $0CCA04 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCA07 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCA09 |
  REP #$20                                  ; $0CCA0B |
  JSL $03D3EB                               ; $0CCA0D |
  RTL                                       ; $0CCA11 |

CODE_0CCA12:
  SEC                                       ; $0CCA12 |
  SBC #$0100                                ; $0CCA13 |
  BPL CODE_0CCA1B                           ; $0CCA16 |
  LDA #$0000                                ; $0CCA18 |

CODE_0CCA1B:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CCA1B |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CCA1D |
  CLC                                       ; $0CCA1F |
  ADC #$0003                                ; $0CCA20 |
  CMP #$0100                                ; $0CCA23 |
  BCC CODE_0CCA2B                           ; $0CCA26 |
  LDA #$0100                                ; $0CCA28 |

CODE_0CCA2B:
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CCA2B |
  JMP CODE_0CC969                           ; $0CCA2D |

CODE_0CCA30:
  CLC                                       ; $0CCA30 |
  ADC #$0002                                ; $0CCA31 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCA34 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CCA37 |
  SEC                                       ; $0CCA3A |
  SBC #$0008                                ; $0CCA3B |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CCA3E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CCA41 |
  RTL                                       ; $0CCA43 |

  LDX $12                                   ; $0CCA44 |
  JSR CODE_0CCCAA                           ; $0CCA46 |
  JSR CODE_0CCE17                           ; $0CCA49 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CCA4C |
  CMP #$0120                                ; $0CCA4F |
  BCC CODE_0CCA30                           ; $0CCA52 |
  LDA #$0120                                ; $0CCA54 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCA57 |
  LDA #$0080                                ; $0CCA5A |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CCA5D |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CCA60 |
  LDY !s_spr_wildcard_2_hi,x                ; $0CCA62 |
  BEQ CODE_0CCA69                           ; $0CCA65 |
  BPL CODE_0CCA7D                           ; $0CCA67 |

CODE_0CCA69:
  LDA #$0100                                ; $0CCA69 |
  STA $00                                   ; $0CCA6C |
  LDA #$0140                                ; $0CCA6E |
  STA $02                                   ; $0CCA71 |
  LDA #$0010                                ; $0CCA73 |
  STA $04                                   ; $0CCA76 |
  LDA #$0115                                ; $0CCA78 |
  BRA CODE_0CCA89                           ; $0CCA7B |

CODE_0CCA7D:
  LDA #$0180                                ; $0CCA7D |
  STA $00                                   ; $0CCA80 |
  STZ $02                                   ; $0CCA82 |
  STZ $04                                   ; $0CCA84 |
  LDA #$01A2                                ; $0CCA86 |

CODE_0CCA89:
  JSL spawn_sprite_active                   ; $0CCA89 |
  BCC CODE_0CCACD                           ; $0CCA8D |
  LDA !s_spr_x_pixel_pos,x                  ; $0CCA8F |
  STA !s_spr_x_pixel_pos,y                  ; $0CCA92 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CCA95 |
  SEC                                       ; $0CCA98 |
  SBC #$0010                                ; $0CCA99 |
  STA !s_spr_y_pixel_pos,y                  ; $0CCA9C |
  LDA $10                                   ; $0CCA9F |
  AND #$000E                                ; $0CCAA1 |
  TAX                                       ; $0CCAA4 |
  LDA $03C74C,x                             ; $0CCAA5 |
  STA !s_spr_x_speed_lo,y                   ; $0CCAA9 |
  LDA $10                                   ; $0CCAAC |
  LSR A                                     ; $0CCAAE |
  LSR A                                     ; $0CCAAF |
  LSR A                                     ; $0CCAB0 |
  LSR A                                     ; $0CCAB1 |
  AND #$000E                                ; $0CCAB2 |
  TAX                                       ; $0CCAB5 |
  LDA $C90D,x                               ; $0CCAB6 |
  STA !s_spr_y_speed_lo,y                   ; $0CCAB9 |
  LDX $12                                   ; $0CCABC |
  LDA $00                                   ; $0CCABE |
  STA !s_spr_timer_1,y                      ; $0CCAC0 |
  LDA $02                                   ; $0CCAC3 |
  STA !s_spr_timer_2,y                      ; $0CCAC5 |
  LDA $04                                   ; $0CCAC8 |
  STA !s_spr_timer_3,y                      ; $0CCACA |

CODE_0CCACD:
  LDA #$006E                                ; $0CCACD |\ play sound #$006E
  JSL push_sound_queue                      ; $0CCAD0 |/
  SEP #$20                                  ; $0CCAD4 |
  DEC !s_spr_wildcard_2_lo,x                ; $0CCAD6 |
  DEC !s_spr_wildcard_2_hi,x                ; $0CCAD9 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCADC |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCADE |
  REP #$20                                  ; $0CCAE0 |
  RTL                                       ; $0CCAE2 |

  LDX $12                                   ; $0CCAE3 |
  JSR CODE_0CCCAA                           ; $0CCAE5 |
  JSR CODE_0CCE17                           ; $0CCAE8 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CCAEB |
  CMP #$00F1                                ; $0CCAEE |
  BCS CODE_0CCB0A                           ; $0CCAF1 |
  LDA #$00F0                                ; $0CCAF3 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCAF6 |
  LDA #$0100                                ; $0CCAF9 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CCAFC |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CCAFF |
  SEP #$20                                  ; $0CCB01 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCB03 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCB05 |
  REP #$20                                  ; $0CCB07 |
  RTL                                       ; $0CCB09 |

CODE_0CCB0A:
  SEC                                       ; $0CCB0A |
  SBC #$000C                                ; $0CCB0B |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCB0E |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CCB11 |
  CLC                                       ; $0CCB14 |
  ADC #$0020                                ; $0CCB15 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CCB18 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CCB1B |
  RTL                                       ; $0CCB1D |

  LDX $12                                   ; $0CCB1E |
  JSR CODE_0CCCAA                           ; $0CCB20 |
  JSR CODE_0CCE17                           ; $0CCB23 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CCB26 |
  CMP #$0100                                ; $0CCB29 |
  BCC CODE_0CCB5A                           ; $0CCB2C |
  LDA #$0100                                ; $0CCB2E |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCB31 |
  LDY !s_spr_wildcard_2_lo,x                ; $0CCB34 |
  BNE CODE_0CCB4E                           ; $0CCB37 |
  LDA #$0080                                ; $0CCB39 |
  STA !s_spr_timer_1,x                      ; $0CCB3C |
  STZ !s_spr_wildcard_1_lo,x                ; $0CCB3F |
  STZ !s_spr_wildcard_2_lo,x                ; $0CCB42 |
  SEP #$20                                  ; $0CCB45 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCB47 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $0CCB49 |
  REP #$20                                  ; $0CCB4B |
  RTL                                       ; $0CCB4D |

CODE_0CCB4E:
  SEP #$20                                  ; $0CCB4E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CCB50 |
  SEC                                       ; $0CCB52 |
  SBC #$04                                  ; $0CCB53 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CCB55 |
  REP #$20                                  ; $0CCB57 |
  RTL                                       ; $0CCB59 |

CODE_0CCB5A:
  CLC                                       ; $0CCB5A |
  ADC #$0001                                ; $0CCB5B |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CCB5E |
  RTL                                       ; $0CCB61 |

  LDX $12                                   ; $0CCB62 |
  JSR CODE_0CCCAA                           ; $0CCB64 |
  LDA !s_spr_timer_1,x                      ; $0CCB67 |
  BEQ CODE_0CCBA9                           ; $0CCB6A |
  LDY !s_spr_draw_priority,x                ; $0CCB6C |
  CPY #$FF                                  ; $0CCB6F |
  BNE CODE_0CCB7B                           ; $0CCB71 |
  LDA #$0001                                ; $0CCB73 |
  STA !s_spr_draw_priority,x                ; $0CCB76 |
  BRA CODE_0CCBA8                           ; $0CCB79 |

CODE_0CCB7B:
  LDA !s_spr_wildcard_2_lo,x                ; $0CCB7B |
  CLC                                       ; $0CCB7E |
  ADC !s_spr_wildcard_1_lo,x                ; $0CCB7F |
  STA !s_spr_wildcard_2_lo,x                ; $0CCB82 |
  BIT #$FF00                                ; $0CCB85 |
  BEQ CODE_0CCB96                           ; $0CCB88 |
  AND #$00FF                                ; $0CCB8A |
  STA !s_spr_wildcard_2_lo,x                ; $0CCB8D |
  LDA #$00FF                                ; $0CCB90 |
  STA !s_spr_draw_priority,x                ; $0CCB93 |

CODE_0CCB96:
  LDA !s_spr_wildcard_1_lo,x                ; $0CCB96 |
  CLC                                       ; $0CCB99 |
  ADC #$0004                                ; $0CCB9A |
  CMP #$0100                                ; $0CCB9D |
  BMI CODE_0CCBA5                           ; $0CCBA0 |
  LDA #$0100                                ; $0CCBA2 |

CODE_0CCBA5:
  STA !s_spr_wildcard_1_lo,x                ; $0CCBA5 |

CODE_0CCBA8:
  RTL                                       ; $0CCBA8 |

CODE_0CCBA9:
  LDA #$01CD                                ; $0CCBA9 |
  JSL spawn_ambient_sprite                  ; $0CCBAC |
  LDA !s_spr_x_pixel_pos,x                  ; $0CCBB0 |
  STA $70A2,y                               ; $0CCBB3 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CCBB6 |
  STA $7142,y                               ; $0CCBB9 |
  LDA #$000B                                ; $0CCBBC |
  STA $7E4C,y                               ; $0CCBBF |
  LDA #$0004                                ; $0CCBC2 |
  STA $7782,y                               ; $0CCBC5 |
  LDA #$003B                                ; $0CCBC8 |\ play sound #$003B
  JSL push_sound_queue                      ; $0CCBCB |/
  JML $03A32E                               ; $0CCBCF |

CODE_0CCBD3:
  LDY !s_spr_draw_priority,x                ; $0CCBD3 |
  CPY #$FF                                  ; $0CCBD6 |
  BNE CODE_0CCBDD                           ; $0CCBD8 |

CODE_0CCBDA:
  SEP #$10                                  ; $0CCBDA |
  RTS                                       ; $0CCBDC |

CODE_0CCBDD:
  REP #$10                                  ; $0CCBDD |
  LDY !s_spr_oam_pointer,x                  ; $0CCBDF |
  BMI CODE_0CCBDA                           ; $0CCBE2 |
  LDA !s_spr_dyntile_index,x                ; $0CCBE4 |
  BMI CODE_0CCBDA                           ; $0CCBE7 |
  TAX                                       ; $0CCBE9 |
  LDA $03AA0E,x                             ; $0CCBEA |
  STA $6000                                 ; $0CCBEE |
  LDA $03AA10,x                             ; $0CCBF1 |
  STA $6002                                 ; $0CCBF5 |
  LDA $03AA12,x                             ; $0CCBF8 |
  STA $6004                                 ; $0CCBFC |
  LDA $03AA14,x                             ; $0CCBFF |
  STA $6006                                 ; $0CCC03 |
  LDA $03AA16,x                             ; $0CCC06 |
  STA $6008                                 ; $0CCC0A |
  LDA $03AA1A,x                             ; $0CCC0D |
  STA $600A                                 ; $0CCC11 |
  SEP #$10                                  ; $0CCC14 |
  LDX #$08                                  ; $0CCC16 |
  LDA #$9AC6                                ; $0CCC18 |
  JSL r_gsu_init_1                          ; $0CCC1B | GSU init
  LDX $12                                   ; $0CCC1F |
  RTS                                       ; $0CCC21 |

CODE_0CCC22:
  REP #$10                                  ; $0CCC22 |
  LDA #$0008                                ; $0CCC24 |
  STA !gsu_r8                               ; $0CCC27 |
  LDA #$001F                                ; $0CCC2A |
  STA !gsu_r9                               ; $0CCC2D |
  LDA #$0100                                ; $0CCC30 |
  STA !gsu_r6                               ; $0CCC33 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CCC36 |
  STA !gsu_r11                              ; $0CCC38 |
  LDA #$0031                                ; $0CCC3B |
  STA !gsu_r12                              ; $0CCC3E |
  LDA #$0055                                ; $0CCC41 |
  STA !gsu_r13                              ; $0CCC44 |
  LDY !s_spr_dyntile_index,x                ; $0CCC47 |
  TYX                                       ; $0CCC4A |
  LDA $03A9CE,x                             ; $0CCC4B |
  CLC                                       ; $0CCC4F |
  ADC #$0020                                ; $0CCC50 |
  STA !gsu_r3                               ; $0CCC53 |
  LDA $03A9EE,x                             ; $0CCC56 |
  STA !gsu_r2                               ; $0CCC5A |
  SEP #$10                                  ; $0CCC5D |
  LDX #$08                                  ; $0CCC5F |
  LDA #$8C15                                ; $0CCC61 |
  JSL r_gsu_init_1                          ; $0CCC64 | GSU init
  LDX $12                                   ; $0CCC68 |
  REP #$10                                  ; $0CCC6A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CCC6C |
  XBA                                       ; $0CCC6E |
  AND #$00FF                                ; $0CCC6F |
  STA !gsu_r5                               ; $0CCC72 |
  LDA #$0100                                ; $0CCC75 |
  STA !gsu_r6                               ; $0CCC78 |
  LDA #$0061                                ; $0CCC7B |
  STA !gsu_r12                              ; $0CCC7E |
  LDA #$0055                                ; $0CCC81 |
  STA !gsu_r13                              ; $0CCC84 |
  LDY !s_spr_dyntile_index,x                ; $0CCC87 |
  TYX                                       ; $0CCC8A |
  LDA $03A9CE,x                             ; $0CCC8B |
  STA !gsu_r3                               ; $0CCC8F |
  LDA $03A9EE,x                             ; $0CCC92 |
  STA !gsu_r2                               ; $0CCC96 |
  SEP #$10                                  ; $0CCC99 |
  LDX #$08                                  ; $0CCC9B |
  LDA #$8205                                ; $0CCC9D |
  JSL r_gsu_init_1                          ; $0CCCA0 | GSU init
  LDX $12                                   ; $0CCCA4 |
  INC $0CF9                                 ; $0CCCA6 |
  RTS                                       ; $0CCCA9 |

CODE_0CCCAA:
  REP #$10                                  ; $0CCCAA |
  LDA #$0008                                ; $0CCCAC |
  STA !gsu_r8                               ; $0CCCAF |
  LDA #$001F                                ; $0CCCB2 |
  STA !gsu_r9                               ; $0CCCB5 |
  LDA #$0100                                ; $0CCCB8 |
  STA !gsu_r6                               ; $0CCCBB |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CCCBE |
  STA !gsu_r11                              ; $0CCCC0 |
  LDA #$0031                                ; $0CCCC3 |
  STA !gsu_r12                              ; $0CCCC6 |
  LDA #$0055                                ; $0CCCC9 |
  STA !gsu_r13                              ; $0CCCCC |
  LDY !s_spr_dyntile_index,x                ; $0CCCCF |
  TYX                                       ; $0CCCD2 |
  LDA $03A9CE,x                             ; $0CCCD3 |
  CLC                                       ; $0CCCD7 |
  ADC #$0020                                ; $0CCCD8 |
  STA !gsu_r3                               ; $0CCCDB |
  LDA $03A9EE,x                             ; $0CCCDE |
  STA !gsu_r2                               ; $0CCCE2 |
  SEP #$10                                  ; $0CCCE5 |
  LDX #$08                                  ; $0CCCE7 |
  LDA #$8C15                                ; $0CCCE9 |
  JSL r_gsu_init_1                          ; $0CCCEC | GSU init
  LDX $12                                   ; $0CCCF0 |
  REP #$10                                  ; $0CCCF2 |
  LDA #$0018                                ; $0CCCF4 |
  STA !gsu_r8                               ; $0CCCF7 |
  LDA #$001F                                ; $0CCCFA |
  STA !gsu_r9                               ; $0CCCFD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CCD00 |
  STA !gsu_r6                               ; $0CCD03 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CCD06 |
  STA !gsu_r11                              ; $0CCD09 |
  LDA #$0061                                ; $0CCD0C |
  STA !gsu_r12                              ; $0CCD0F |
  LDA #$0055                                ; $0CCD12 |
  STA !gsu_r13                              ; $0CCD15 |
  LDY !s_spr_dyntile_index,x                ; $0CCD18 |
  TYX                                       ; $0CCD1B |
  LDA $03A9CE,x                             ; $0CCD1C |
  STA !gsu_r3                               ; $0CCD20 |
  LDA $03A9EE,x                             ; $0CCD23 |
  STA !gsu_r2                               ; $0CCD27 |
  SEP #$10                                  ; $0CCD2A |
  LDX #$08                                  ; $0CCD2C |
  LDA #$8295                                ; $0CCD2E |
  JSL r_gsu_init_1                          ; $0CCD31 | GSU init
  LDX $12                                   ; $0CCD35 |
  INC $0CF9                                 ; $0CCD37 |

CODE_0CCD3A:
  RTS                                       ; $0CCD3A |

  dw $FF00, $0100                           ; $0CCD3B |

  dw $FF00, $0100                           ; $0CCD3F |

CODE_0CCD43:
  LDY !s_spr_collision_id,x                 ; $0CCD43 |
  BMI CODE_0CCD3A                           ; $0CCD46 |
  PHX                                       ; $0CCD48 |
  TXA                                       ; $0CCD49 |
  STA !gsu_r1                               ; $0CCD4A |
  LDX #$09                                  ; $0CCD4D |
  LDA #$9011                                ; $0CCD4F |
  JSL r_gsu_init_1                          ; $0CCD52 | GSU init
  PLX                                       ; $0CCD56 |
  LDY !gsu_r14                              ; $0CCD57 |
  BMI CODE_0CCD3A                           ; $0CCD5A |
  BEQ CODE_0CCD3A                           ; $0CCD5C |
  LDA !s_spr_state,y                        ; $0CCD5E |
  CMP #$0010                                ; $0CCD61 |
  BNE CODE_0CCD3A                           ; $0CCD64 |
  LDA !s_spr_collision_state,y              ; $0CCD66 |
  BEQ CODE_0CCD3A                           ; $0CCD69 |
  LDA !s_spr_y_speed_lo,y                   ; $0CCD6B |
  BMI CODE_0CCDCE                           ; $0CCD6E |
  LDA !s_spr_x_hitbox_center,x              ; $0CCD70 |
  SEC                                       ; $0CCD73 |
  SBC !s_spr_x_hitbox_center,y              ; $0CCD74 |
  CLC                                       ; $0CCD77 |
  ADC #$000E                                ; $0CCD78 |
  CMP #$001C                                ; $0CCD7B |
  BCS CODE_0CCDCE                           ; $0CCD7E |
  LDA !s_spr_hitbox_height,x                ; $0CCD80 |
  INC A                                     ; $0CCD83 |
  LSR A                                     ; $0CCD84 |
  STA $00                                   ; $0CCD85 |
  CLC                                       ; $0CCD87 |
  ADC !s_spr_hitbox_height,y                ; $0CCD88 |
  STA $02                                   ; $0CCD8B |
  LDA !s_spr_y_hitbox_center,x              ; $0CCD8D |
  SEC                                       ; $0CCD90 |
  SBC $00                                   ; $0CCD91 |
  SEC                                       ; $0CCD93 |
  SBC !s_spr_y_hitbox_center,y              ; $0CCD94 |
  BPL CODE_0CCD9D                           ; $0CCD97 |
  EOR #$FFFF                                ; $0CCD99 |
  INC A                                     ; $0CCD9C |

CODE_0CCD9D:
  CMP $02                                   ; $0CCD9D |
  BEQ CODE_0CCDA3                           ; $0CCD9F |
  BPL CODE_0CCDCE                           ; $0CCDA1 |

CODE_0CCDA3:
  LDA !s_spr_id,y                           ; $0CCDA3 |
  STA !s_spr_wildcard_1_lo,x                ; $0CCDA6 |
  TYX                                       ; $0CCDA9 |
  JSL $03A32E                               ; $0CCDAA |
  LDX $12                                   ; $0CCDAE |
  LDA #$0014                                ; $0CCDB0 |\ play sound #$0014
  JSL push_sound_queue                      ; $0CCDB3 |/
  SEP #$20                                  ; $0CCDB7 |
  LDA !s_spr_oam_1,x                        ; $0CCDB9 |
  AND #$F3                                  ; $0CCDBC |
  STA !s_spr_oam_1,x                        ; $0CCDBE |
  LDA #$04                                  ; $0CCDC1 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CCDC3 |
  LDA #$FF                                  ; $0CCDC5 |
  STA !s_spr_stage_id,x                     ; $0CCDC7 |
  REP #$20                                  ; $0CCDCA |
  PLA                                       ; $0CCDCC |
  RTL                                       ; $0CCDCD |

CODE_0CCDCE:
  LDA #$CD3B                                ; $0CCDCE |
  STA $00                                   ; $0CCDD1 |
  LDA #$CD3F                                ; $0CCDD3 |
  STA $02                                   ; $0CCDD6 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CCDD8 |
  SEC                                       ; $0CCDDB |
  SBC !s_spr_x_pixel_pos,y                  ; $0CCDDC |
  BPL CODE_0CCDE5                           ; $0CCDDF |
  INC $00                                   ; $0CCDE1 |
  INC $00                                   ; $0CCDE3 |

CODE_0CCDE5:
  LDA !s_spr_y_pixel_pos,x                  ; $0CCDE5 |
  SEC                                       ; $0CCDE8 |
  SBC !s_spr_y_pixel_pos,y                  ; $0CCDE9 |
  BPL CODE_0CCDF2                           ; $0CCDEC |
  INC $02                                   ; $0CCDEE |
  INC $02                                   ; $0CCDF0 |

CODE_0CCDF2:
  LDA ($00)                                 ; $0CCDF2 |
  STA !s_spr_x_speed_lo,y                   ; $0CCDF4 |
  LDA ($02)                                 ; $0CCDF7 |
  STA !s_spr_y_speed_lo,y                   ; $0CCDF9 |
  LDA !s_spr_id,y                           ; $0CCDFC |
  CMP #$0022                                ; $0CCDFF |
  BCC CODE_0CCE0F                           ; $0CCE02 |
  CMP #$002C                                ; $0CCE04 |
  BCS CODE_0CCE0F                           ; $0CCE07 |
  LDA #$0040                                ; $0CCE09 |
  STA !s_spr_y_accel,y                      ; $0CCE0C |

CODE_0CCE0F:
  LDA #$0049                                ; $0CCE0F |\ play sound #$0049
  JSL push_sound_queue                      ; $0CCE12 |/

CODE_0CCE16:
  RTS                                       ; $0CCE16 |

CODE_0CCE17:
  LDY !s_spr_collision_id,x                 ; $0CCE17 |
  BMI CODE_0CCE16                           ; $0CCE1A |
  PHX                                       ; $0CCE1C |
  TXA                                       ; $0CCE1D |
  STA !gsu_r1                               ; $0CCE1E |
  LDX #$09                                  ; $0CCE21 |
  LDA #$9011                                ; $0CCE23 |
  JSL r_gsu_init_1                          ; $0CCE26 | GSU init
  PLX                                       ; $0CCE2A |
  LDY !gsu_r14                              ; $0CCE2B |
  BMI CODE_0CCE16                           ; $0CCE2E |
  BEQ CODE_0CCE16                           ; $0CCE30 |
  LDA !s_spr_state,y                        ; $0CCE32 |
  CMP #$0010                                ; $0CCE35 |
  BNE CODE_0CCE16                           ; $0CCE38 |
  LDA !s_spr_collision_state,y              ; $0CCE3A |
  BEQ CODE_0CCE16                           ; $0CCE3D |
  BRA CODE_0CCDCE                           ; $0CCE3F |

  dw $FF00, $0100                           ; $0CCE41 |
  dw $000E, $000C                           ; $0CCE45 |
  dw $0061, $04A1                           ; $0CCE49 |

init_piscatory_pete:
  LDY !s_spr_facing_dir,x                   ; $0CCE4D |
  LDA $CE41,y                               ; $0CCE50 |
  STA !s_spr_x_accel_ceiling,x              ; $0CCE53 |
  LDA #$0004                                ; $0CCE56 |
  STA !s_spr_x_accel,x                      ; $0CCE59 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CCE5C |
  AND #$0010                                ; $0CCE5F |
  LSR A                                     ; $0CCE62 |
  LSR A                                     ; $0CCE63 |
  LSR A                                     ; $0CCE64 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CCE65 |
  TAY                                       ; $0CCE67 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CCE68 |
  ORA $CE45,y                               ; $0CCE6B |
  STA !s_spr_oam_yxppccct,x                 ; $0CCE6E |
  LDA $CE49,y                               ; $0CCE71 |
  STA !s_spr_bitwise_settings_3,x           ; $0CCE74 |
  SEP #$20                                  ; $0CCE77 |
  LDA #$FF                                  ; $0CCE79 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CCE7B |
  STA $7863,x                               ; $0CCE7D |
  REP #$20                                  ; $0CCE80 |
  RTL                                       ; $0CCE82 |

  JSL $03AF23                               ; $0CCE83 |
  JSL $0CD017                               ; $0CCE87 |
  JSL $0CD053                               ; $0CCE8B |
  JSR CODE_0CD00D                           ; $0CCE8F |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CCE92 |
  TYX                                       ; $0CCE94 |
  JMP ($CE98,x)                             ; $0CCE95 |

  dw $CE9C, $CEA8                           ; $0CCE98 |

  LDX $12                                   ; $0CCE9C |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CCE9E |
  TYX                                       ; $0CCEA0 |
  JMP ($CEA4,x)                             ; $0CCEA1 |

  dw $CEB4, $CFB2                           ; $0CCEA4 |

  LDX $12                                   ; $0CCEA8 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CCEAA |
  TYX                                       ; $0CCEAC |
  JMP ($CEB0,x)                             ; $0CCEAD |

  dw $CEB4, $CF13                           ; $0CCEB0 |

  LDX $12                                   ; $0CCEB4 |
  LDA !s_spr_x_accel,x                      ; $0CCEB6 |
  BEQ CODE_0CCECF                           ; $0CCEB9 |
  ASL A                                     ; $0CCEBB |
  STA $00                                   ; $0CCEBC |
  LDA !s_spr_x_speed_lo,x                   ; $0CCEBE |
  SEC                                       ; $0CCEC1 |
  SBC !s_spr_x_accel_ceiling,x              ; $0CCEC2 |
  CLC                                       ; $0CCEC5 |
  ADC !s_spr_x_accel,x                      ; $0CCEC6 |
  CMP $00                                   ; $0CCEC9 |
  BEQ CODE_0CCECF                           ; $0CCECB |
  BCS CODE_0CCEFC                           ; $0CCECD |

CODE_0CCECF:
  LDA !s_spr_y_accel,x                      ; $0CCECF |
  BEQ CODE_0CCEE8                           ; $0CCED2 |
  ASL A                                     ; $0CCED4 |
  STA $00                                   ; $0CCED5 |
  LDA !s_spr_y_speed_lo,x                   ; $0CCED7 |
  SEC                                       ; $0CCEDA |
  SBC !s_spr_y_accel_ceiling,x              ; $0CCEDB |
  CLC                                       ; $0CCEDE |
  ADC !s_spr_y_accel,x                      ; $0CCEDF |
  CMP $00                                   ; $0CCEE2 |
  BEQ CODE_0CCEE8                           ; $0CCEE4 |
  BCS CODE_0CCEFC                           ; $0CCEE6 |

CODE_0CCEE8:
  STZ !s_spr_x_accel_ceiling,x              ; $0CCEE8 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CCEEB |
  SEP #$20                                  ; $0CCEEE |
  LDA #$01                                  ; $0CCEF0 |
  STA !s_spr_anim_frame,x                   ; $0CCEF2 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CCEF5 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CCEF7 |
  REP #$20                                  ; $0CCEF9 |
  RTL                                       ; $0CCEFB |

CODE_0CCEFC:
  LDA !s_spr_timer_1,x                      ; $0CCEFC |
  BNE CODE_0CCF12                           ; $0CCEFF |
  SEP #$20                                  ; $0CCF01 |
  LDA #$04                                  ; $0CCF03 |
  STA !s_spr_timer_1,x                      ; $0CCF05 |
  LDA !s_spr_anim_frame,x                   ; $0CCF08 |
  EOR #$01                                  ; $0CCF0B |
  STA !s_spr_anim_frame,x                   ; $0CCF0D |
  REP #$20                                  ; $0CCF10 |

CODE_0CCF12:
  RTL                                       ; $0CCF12 |

  LDX $12                                   ; $0CCF13 |
  LDA !s_spr_x_player_dir,x                 ; $0CCF15 |
  AND #$00FF                                ; $0CCF18 |
  STA !s_spr_facing_dir,x                   ; $0CCF1B |
  LDA !s_spr_x_accel,x                      ; $0CCF1E |
  BEQ CODE_0CCF37                           ; $0CCF21 |
  ASL A                                     ; $0CCF23 |
  STA $00                                   ; $0CCF24 |
  LDA !s_spr_x_speed_lo,x                   ; $0CCF26 |
  SEC                                       ; $0CCF29 |
  SBC !s_spr_x_accel_ceiling,x              ; $0CCF2A |
  CLC                                       ; $0CCF2D |
  ADC !s_spr_x_accel,x                      ; $0CCF2E |
  CMP $00                                   ; $0CCF31 |
  BEQ CODE_0CCF37                           ; $0CCF33 |
  BCS CODE_0CCF50                           ; $0CCF35 |

CODE_0CCF37:
  LDA !s_spr_y_accel,x                      ; $0CCF37 |
  BEQ CODE_0CCF53                           ; $0CCF3A |
  ASL A                                     ; $0CCF3C |
  STA $00                                   ; $0CCF3D |
  LDA !s_spr_y_speed_lo,x                   ; $0CCF3F |
  SEC                                       ; $0CCF42 |
  SBC !s_spr_y_accel_ceiling,x              ; $0CCF43 |
  CLC                                       ; $0CCF46 |
  ADC !s_spr_y_accel,x                      ; $0CCF47 |
  CMP $00                                   ; $0CCF4A |
  BEQ CODE_0CCF53                           ; $0CCF4C |
  BCC CODE_0CCF53                           ; $0CCF4E |

CODE_0CCF50:
  JMP CODE_0CCFD7                           ; $0CCF50 |

CODE_0CCF53:
  LDA !s_player_center_x                    ; $0CCF53 |
  STA !gsu_r1                               ; $0CCF56 |
  LDA !s_player_center_y                    ; $0CCF59 |
  STA !gsu_r2                               ; $0CCF5C |
  LDA !s_spr_x_hitbox_center,x              ; $0CCF5F |
  STA !gsu_r3                               ; $0CCF62 |
  LDA !s_spr_y_hitbox_center,x              ; $0CCF65 |
  STA !gsu_r4                               ; $0CCF68 |
  LDA #$0200                                ; $0CCF6B |
  STA !gsu_r6                               ; $0CCF6E |
  LDX #$09                                  ; $0CCF71 |
  LDA #$907C                                ; $0CCF73 |
  JSL r_gsu_init_1                          ; $0CCF76 | GSU init
  LDX $12                                   ; $0CCF7A |
  LDA !gsu_r1                               ; $0CCF7C |
  STA !s_spr_x_accel_ceiling,x              ; $0CCF7F |
  BPL CODE_0CCF88                           ; $0CCF82 |
  EOR #$FFFF                                ; $0CCF84 |
  INC A                                     ; $0CCF87 |

CODE_0CCF88:
  LSR A                                     ; $0CCF88 |
  LSR A                                     ; $0CCF89 |
  LSR A                                     ; $0CCF8A |
  LSR A                                     ; $0CCF8B |
  LSR A                                     ; $0CCF8C |
  LSR A                                     ; $0CCF8D |
  STA !s_spr_x_accel,x                      ; $0CCF8E |
  LDA !gsu_r2                               ; $0CCF91 |
  STA !s_spr_y_accel_ceiling,x              ; $0CCF94 |
  BPL CODE_0CCF9D                           ; $0CCF97 |
  EOR #$FFFF                                ; $0CCF99 |
  INC A                                     ; $0CCF9C |

CODE_0CCF9D:
  LSR A                                     ; $0CCF9D |
  LSR A                                     ; $0CCF9E |
  LSR A                                     ; $0CCF9F |
  LSR A                                     ; $0CCFA0 |
  LSR A                                     ; $0CCFA1 |
  LSR A                                     ; $0CCFA2 |
  STA !s_spr_y_accel,x                      ; $0CCFA3 |
  SEP #$20                                  ; $0CCFA6 |
  STZ !s_spr_anim_frame,x                   ; $0CCFA8 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CCFAB |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CCFAD |
  REP #$20                                  ; $0CCFAF |
  RTL                                       ; $0CCFB1 |

  LDX $12                                   ; $0CCFB2 |
  LDA !s_spr_x_speed_lo,x                   ; $0CCFB4 |
  BEQ CODE_0CCFC2                           ; $0CCFB7 |
  LDA !s_spr_facing_dir,x                   ; $0CCFB9 |
  DEC A                                     ; $0CCFBC |
  EOR !s_spr_x_speed_lo,x                   ; $0CCFBD |
  BPL CODE_0CCFD7                           ; $0CCFC0 |

CODE_0CCFC2:
  LDY !s_spr_facing_dir,x                   ; $0CCFC2 |
  LDA $CE41,y                               ; $0CCFC5 |
  STA !s_spr_x_accel_ceiling,x              ; $0CCFC8 |
  SEP #$20                                  ; $0CCFCB |
  STZ !s_spr_anim_frame,x                   ; $0CCFCD |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CCFD0 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CCFD2 |
  REP #$20                                  ; $0CCFD4 |
  RTL                                       ; $0CCFD6 |

CODE_0CCFD7:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CCFD7 |
  BNE CODE_0CCFF7                           ; $0CCFD9 |
  LDA !s_spr_timer_1,x                      ; $0CCFDB |
  BNE CODE_0CCFF6                           ; $0CCFDE |
  SEP #$20                                  ; $0CCFE0 |
  LDA $10                                   ; $0CCFE2 |
  AND #$1F                                  ; $0CCFE4 |
  BNE CODE_0CCFF4                           ; $0CCFE6 |
  LDA #$08                                  ; $0CCFE8 |
  STA !s_spr_timer_1,x                      ; $0CCFEA |
  LDA #$02                                  ; $0CCFED |
  STA !s_spr_anim_frame,x                   ; $0CCFEF |
  INC !s_spr_wildcard_4_hi_dp,x             ; $0CCFF2 |

CODE_0CCFF4:
  REP #$20                                  ; $0CCFF4 |

CODE_0CCFF6:
  RTL                                       ; $0CCFF6 |

CODE_0CCFF7:
  LDA !s_spr_timer_1,x                      ; $0CCFF7 |
  BNE CODE_0CD00C                           ; $0CCFFA |
  SEP #$20                                  ; $0CCFFC |
  LDA #$01                                  ; $0CCFFE |
  STA !s_spr_anim_frame,x                   ; $0CD000 |
  LDA #$08                                  ; $0CD003 |
  STA !s_spr_timer_1,x                      ; $0CD005 |
  STZ !s_spr_wildcard_4_hi_dp,x             ; $0CD008 |
  REP #$20                                  ; $0CD00A |

CODE_0CD00C:
  RTL                                       ; $0CD00C |

CODE_0CD00D:
  LDY !s_spr_collision_id,x                 ; $0CD00D |
  BPL CODE_0CD016                           ; $0CD010 |
  JSL player_hit_sprite                     ; $0CD012 |

CODE_0CD016:
  RTS                                       ; $0CD016 |

  LDY $7862,x                               ; $0CD017 |
  BNE CODE_0CD031                           ; $0CD01A |
  SEP #$20                                  ; $0CD01C |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0CD01E |
  REP #$20                                  ; $0CD020 |
  LDA #$0040                                ; $0CD022 |
  STA !s_spr_y_accel,x                      ; $0CD025 |
  LDA #$0400                                ; $0CD028 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD02B |
  PLY                                       ; $0CD02E |
  PLA                                       ; $0CD02F |
  RTL                                       ; $0CD030 |

CODE_0CD031:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0CD031 |
  BNE CODE_0CD052                           ; $0CD033 |

CODE_0CD035:
  STZ !s_spr_x_accel_ceiling,x              ; $0CD035 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CD038 |
  LDA #$0004                                ; $0CD03B |
  STA !s_spr_y_accel,x                      ; $0CD03E |
  SEP #$20                                  ; $0CD041 |
  LDA #$01                                  ; $0CD043 |
  STA !s_spr_anim_frame,x                   ; $0CD045 |
  LDA #$02                                  ; $0CD048 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CD04A |
  DEC !s_spr_wildcard_6_lo_dp,x             ; $0CD04C |
  REP #$20                                  ; $0CD04E |
  PLY                                       ; $0CD050 |
  PLA                                       ; $0CD051 |

CODE_0CD052:
  RTL                                       ; $0CD052 |

  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD053 |
  BEQ CODE_0CD05F                           ; $0CD055 |
  LDA $7860,x                               ; $0CD057 |
  BIT #$000F                                ; $0CD05A |
  BNE CODE_0CD035                           ; $0CD05D |

CODE_0CD05F:
  RTL                                       ; $0CD05F |

  dw $0202, $0505                           ; $0CD060 |

init_preying_mantas:
  LDA #$FF00                                ; $0CD064 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD067 |
  LDA #$0010                                ; $0CD06A |
  STA !s_spr_y_accel,x                      ; $0CD06D |
  LDA !s_spr_y_pixel_pos,x                  ; $0CD070 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CD073 |
  LDA #$0003                                ; $0CD075 |
  STA !s_spr_anim_frame,x                   ; $0CD078 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD07B |
  AND #$0010                                ; $0CD07E |
  LSR A                                     ; $0CD081 |
  LSR A                                     ; $0CD082 |
  LSR A                                     ; $0CD083 |
  TAY                                       ; $0CD084 |
  LDA $D060,y                               ; $0CD085 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CD088 |
  RTL                                       ; $0CD08A |

  db $08, $00, $04, $00, $04, $00, $08, $00 ; $0CD08B |

main_preying_mantas:
  JSL $03AF23                               ; $0CD093 |
  JSR CODE_0CD00D                           ; $0CD097 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CD09A |
  TYX                                       ; $0CD09C |
  JSR ($D0A1,x)                             ; $0CD09D |
  RTL                                       ; $0CD0A0 |

  dw $D0A5, $D106                           ; $0CD0A1 |

  LDX $12                                   ; $0CD0A5 |
  LDA !s_spr_y_accel_ceiling,x              ; $0CD0A7 |
  BEQ CODE_0CD0CD                           ; $0CD0AA |
  LDA !s_spr_timer_1,x                      ; $0CD0AC |
  BNE CODE_0CD105                           ; $0CD0AF |
  DEC !s_spr_anim_frame,x                   ; $0CD0B1 |
  BMI CODE_0CD0C4                           ; $0CD0B4 |
  SEP #$20                                  ; $0CD0B6 |
  LDY !s_spr_anim_frame,x                   ; $0CD0B8 |
  LDA $D08B,y                               ; $0CD0BB |
  STA !s_spr_timer_1,x                      ; $0CD0BE |
  REP #$20                                  ; $0CD0C1 |
  RTS                                       ; $0CD0C3 |

CODE_0CD0C4:
  LDA #$0003                                ; $0CD0C4 |
  STA !s_spr_anim_frame,x                   ; $0CD0C7 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CD0CA |

CODE_0CD0CD:
  LDA !s_spr_y_accel,x                      ; $0CD0CD |
  ASL A                                     ; $0CD0D0 |
  STA $00                                   ; $0CD0D1 |
  LDA !s_spr_y_speed_lo,x                   ; $0CD0D3 |
  SEC                                       ; $0CD0D6 |
  SBC !s_spr_y_accel_ceiling,x              ; $0CD0D7 |
  CLC                                       ; $0CD0DA |
  ADC !s_spr_y_accel,x                      ; $0CD0DB |
  CMP $00                                   ; $0CD0DE |
  BCS CODE_0CD105                           ; $0CD0E0 |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CD0E2 |
  BNE CODE_0CD0F9                           ; $0CD0E4 |
  LDA #$0080                                ; $0CD0E6 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD0E9 |
  SEP #$20                                  ; $0CD0EC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CD0EE |
  STA !s_spr_wildcard_5_hi_dp,x             ; $0CD0F0 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CD0F2 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CD0F4 |
  REP #$20                                  ; $0CD0F6 |
  RTS                                       ; $0CD0F8 |

CODE_0CD0F9:
  LDA #$FF00                                ; $0CD0F9 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD0FC |
  SEP #$20                                  ; $0CD0FF |
  DEC !s_spr_wildcard_5_hi_dp,x             ; $0CD101 |
  REP #$20                                  ; $0CD103 |

CODE_0CD105:
  RTS                                       ; $0CD105 |

  LDX $12                                   ; $0CD106 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CD108 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CD10A |
  BPL CODE_0CD11D                           ; $0CD10D |
  STA !s_spr_y_pixel_pos,x                  ; $0CD10F |
  LDA #$FF00                                ; $0CD112 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD115 |
  STZ !s_spr_y_speed_lo,x                   ; $0CD118 |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CD11B |

CODE_0CD11D:
  RTS                                       ; $0CD11D |

  dw $0000, $0100                           ; $0CD11E |

init_loch_nestor:
  LDA #$00A0                                ; $0CD122 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD125 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD127 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CD12A |
  LDA !s_spr_y_pixel_pos,x                  ; $0CD12D |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CD130 |
  LDY !s_spr_facing_dir,x                   ; $0CD133 |
  LDA $D11E,y                               ; $0CD136 |
  STA !s_spr_wildcard_1_lo,x                ; $0CD139 |
  JSL $03AE60                               ; $0CD13C |
  SEP #$20                                  ; $0CD140 |
  LDA #$FF                                  ; $0CD142 |
  STA $7863,x                               ; $0CD144 |
  REP #$20                                  ; $0CD147 |
  RTL                                       ; $0CD149 |

  db $A0, $C0, $54, $C0, $C0, $54           ; $0CD14A |

; gsu table
  db $F5, $FE, $F6, $F6                     ; $0CD150 |

main_loch_nestor:
  LDY !s_spr_draw_priority,x                ; $0CD154 |
  BMI CODE_0CD18E                           ; $0CD157 |
  LDA !s_spr_anim_frame,x                   ; $0CD159 |
  CMP #$0002                                ; $0CD15C |
  BCC CODE_0CD18E                           ; $0CD15F |
  REP #$10                                  ; $0CD161 |
  LDA !s_spr_oam_pointer,x                  ; $0CD163 |
  CLC                                       ; $0CD166 |
  ADC #$0010                                ; $0CD167 |
  TAY                                       ; $0CD16A |
  JSL $03AA60                               ; $0CD16B |
  SEP #$10                                  ; $0CD16F |
  LDA #$000C                                ; $0CD171 |
  STA !gsu_r0                               ; $0CD174 |
  LDA #$D150                                ; $0CD177 |
  STA !gsu_r10                              ; $0CD17A |
  LDA #$0002                                ; $0CD17D |
  STA !gsu_r12                              ; $0CD180 |
  LDX #$08                                  ; $0CD183 |
  LDA #$9B64                                ; $0CD185 |
  JSL r_gsu_init_1                          ; $0CD188 | GSU init
  LDX $12                                   ; $0CD18C |

CODE_0CD18E:
  JSL $03AF23                               ; $0CD18E |
  JSR CODE_0CD3DC                           ; $0CD192 |
  LDA !s_spr_timer_1,x                      ; $0CD195 |
  BNE CODE_0CD1A9                           ; $0CD198 |
  LDA #$0004                                ; $0CD19A |
  STA !s_spr_timer_1,x                      ; $0CD19D |
  LDA !s_spr_anim_frame,x                   ; $0CD1A0 |
  EOR #$0001                                ; $0CD1A3 |
  STA !s_spr_anim_frame,x                   ; $0CD1A6 |

CODE_0CD1A9:
  JSR CODE_0CD435                           ; $0CD1A9 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD1AC |
  BIT #$0020                                ; $0CD1AF |
  BEQ CODE_0CD1BA                           ; $0CD1B2 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD1B4 |
  TYX                                       ; $0CD1B6 |
  JMP ($D1DB,x)                             ; $0CD1B7 |

CODE_0CD1BA:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD1BA |
  BEQ CODE_0CD1D5                           ; $0CD1BC |
  LDA !s_spr_timer_2,x                      ; $0CD1BE |
  BNE CODE_0CD1D5                           ; $0CD1C1 |
  SEP #$20                                  ; $0CD1C3 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD1C5 |
  ORA #$20                                  ; $0CD1C8 |
  STA !s_spr_bitwise_settings_1,x           ; $0CD1CA |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0CD1CD |
  LDA #$04                                  ; $0CD1CF |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CD1D1 |
  REP #$20                                  ; $0CD1D3 |

CODE_0CD1D5:
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CD1D5 |
  TYX                                       ; $0CD1D7 |
  JMP ($D1E7,x)                             ; $0CD1D8 |

  dw $D347, $D36E, $D387, $D3AB             ; $0CD1DB |
  dw $D3B6, $D3BD                           ; $0CD1E3 |

  dw $D1ED, $D228, $D287                    ; $0CD1E7 |

  LDX $12                                   ; $0CD1ED |
  LDA !s_spr_wildcard_1_lo,x                ; $0CD1EF |
  INC A                                     ; $0CD1F2 |
  AND #$01FF                                ; $0CD1F3 |
  STA !s_spr_wildcard_1_lo,x                ; $0CD1F6 |
  AND #$01FE                                ; $0CD1F9 |
  REP #$10                                  ; $0CD1FC |
  TXY                                       ; $0CD1FE |
  TAX                                       ; $0CD1FF |
  LDA $00E9D4,x                             ; $0CD200 |
  CMP #$8000                                ; $0CD204 |
  ROR A                                     ; $0CD207 |
  CMP #$8000                                ; $0CD208 |
  ROR A                                     ; $0CD20B |
  CMP #$8000                                ; $0CD20C |
  ROR A                                     ; $0CD20F |
  CLC                                       ; $0CD210 |
  ADC !s_spr_gsu_morph_1_lo,y               ; $0CD211 |
  STA !s_spr_x_pixel_pos,y                  ; $0CD214 |
  LDA $00E954,x                             ; $0CD217 |
  AND #$8000                                ; $0CD21B |
  ASL A                                     ; $0CD21E |
  ROL A                                     ; $0CD21F |
  ASL A                                     ; $0CD220 |
  STA !s_spr_facing_dir,y                   ; $0CD221 |
  TYX                                       ; $0CD224 |
  SEP #$10                                  ; $0CD225 |
  RTL                                       ; $0CD227 |

  LDX $12                                   ; $0CD228 |
  JSL $0CD4AF                               ; $0CD22A |
  LDA !s_player_center_x                    ; $0CD22E |
  STA !gsu_r1                               ; $0CD231 |
  LDA !s_player_center_y                    ; $0CD234 |
  STA !gsu_r2                               ; $0CD237 |
  LDA !s_spr_x_hitbox_center,x              ; $0CD23A |
  STA !gsu_r3                               ; $0CD23D |
  LDA !s_spr_y_hitbox_center,x              ; $0CD240 |
  STA !gsu_r4                               ; $0CD243 |
  LDA #$0080                                ; $0CD246 |
  STA !gsu_r6                               ; $0CD249 |
  LDX #$09                                  ; $0CD24C |
  LDA #$907C                                ; $0CD24E |
  JSL r_gsu_init_1                          ; $0CD251 | GSU init
  LDX $12                                   ; $0CD255 |
  LDA !gsu_r1                               ; $0CD257 |
  STA !s_spr_x_accel_ceiling,x              ; $0CD25A |
  BPL CODE_0CD263                           ; $0CD25D |
  EOR #$FFFF                                ; $0CD25F |
  INC A                                     ; $0CD262 |

CODE_0CD263:
  LSR A                                     ; $0CD263 |
  LSR A                                     ; $0CD264 |
  LSR A                                     ; $0CD265 |
  LSR A                                     ; $0CD266 |
  STA !s_spr_x_accel,x                      ; $0CD267 |
  LDA !gsu_r2                               ; $0CD26A |
  STA !s_spr_y_accel_ceiling,x              ; $0CD26D |
  BPL CODE_0CD276                           ; $0CD270 |
  EOR #$FFFF                                ; $0CD272 |
  INC A                                     ; $0CD275 |

CODE_0CD276:
  LSR A                                     ; $0CD276 |
  LSR A                                     ; $0CD277 |
  LSR A                                     ; $0CD278 |
  LSR A                                     ; $0CD279 |
  STA !s_spr_y_accel,x                      ; $0CD27A |
  LDA !s_spr_x_player_dir,x                 ; $0CD27D |
  AND #$00FF                                ; $0CD280 |
  STA !s_spr_facing_dir,x                   ; $0CD283 |
  RTL                                       ; $0CD286 |

  LDX $12                                   ; $0CD287 |
  JSL $0CD4AF                               ; $0CD289 |
  LDY #$00                                  ; $0CD28D |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD28F |
  CMP !s_spr_gsu_morph_1_lo,x               ; $0CD292 |
  BPL CODE_0CD299                           ; $0CD295 |
  INY                                       ; $0CD297 |
  INY                                       ; $0CD298 |

CODE_0CD299:
  TYA                                       ; $0CD299 |
  STA !s_spr_facing_dir,x                   ; $0CD29A |
  STZ $00                                   ; $0CD29D |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD29F |
  SEC                                       ; $0CD2A2 |
  SBC !s_spr_gsu_morph_1_lo,x               ; $0CD2A3 |
  CLC                                       ; $0CD2A6 |
  ADC #$0001                                ; $0CD2A7 |
  CMP #$0002                                ; $0CD2AA |
  BCS CODE_0CD2BD                           ; $0CD2AD |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CD2AF |
  STA !s_spr_x_pixel_pos,x                  ; $0CD2B2 |
  STZ !s_spr_x_speed_lo,x                   ; $0CD2B5 |
  STZ !s_spr_x_accel,x                      ; $0CD2B8 |
  INC $00                                   ; $0CD2BB |

CODE_0CD2BD:
  LDA !s_spr_y_pixel_pos,x                  ; $0CD2BD |
  SEC                                       ; $0CD2C0 |
  SBC !s_spr_gsu_morph_2_lo,x               ; $0CD2C1 |
  CLC                                       ; $0CD2C4 |
  ADC #$0001                                ; $0CD2C5 |
  CMP #$0002                                ; $0CD2C8 |
  BCS CODE_0CD2F5                           ; $0CD2CB |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CD2CD |
  STA !s_spr_y_pixel_pos,x                  ; $0CD2D0 |
  STZ !s_spr_y_speed_lo,x                   ; $0CD2D3 |
  STZ !s_spr_y_accel,x                      ; $0CD2D6 |
  LDA $00                                   ; $0CD2D9 |
  BEQ CODE_0CD2F5                           ; $0CD2DB |
  LDY !s_spr_facing_dir,x                   ; $0CD2DD |
  LDA $D11E,y                               ; $0CD2E0 |
  STA !s_spr_wildcard_1_lo,x                ; $0CD2E3 |
  SEP #$20                                  ; $0CD2E6 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CD2E8 |
  AND #$E0                                  ; $0CD2EB |
  STA !s_spr_bitwise_settings_3,x           ; $0CD2ED |
  STZ !s_spr_wildcard_4_hi_dp,x             ; $0CD2F0 |
  REP #$20                                  ; $0CD2F2 |
  RTL                                       ; $0CD2F4 |

CODE_0CD2F5:
  LDX $12                                   ; $0CD2F5 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CD2F7 |
  STA !gsu_r1                               ; $0CD2FA |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CD2FD |
  STA !gsu_r2                               ; $0CD300 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD303 |
  STA !gsu_r3                               ; $0CD306 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CD309 |
  STA !gsu_r4                               ; $0CD30C |
  LDA #$0080                                ; $0CD30F |
  STA !gsu_r6                               ; $0CD312 |
  LDX #$09                                  ; $0CD315 |
  LDA #$907C                                ; $0CD317 |
  JSL r_gsu_init_1                          ; $0CD31A | GSU init
  LDX $12                                   ; $0CD31E |
  LDA !gsu_r1                               ; $0CD320 |
  STA !s_spr_x_accel_ceiling,x              ; $0CD323 |
  BPL CODE_0CD32C                           ; $0CD326 |
  EOR #$FFFF                                ; $0CD328 |
  INC A                                     ; $0CD32B |

CODE_0CD32C:
  LSR A                                     ; $0CD32C |
  LSR A                                     ; $0CD32D |
  LSR A                                     ; $0CD32E |
  LSR A                                     ; $0CD32F |
  STA !s_spr_x_accel,x                      ; $0CD330 |
  LDA !gsu_r2                               ; $0CD333 |
  STA !s_spr_y_accel_ceiling,x              ; $0CD336 |
  BPL CODE_0CD33F                           ; $0CD339 |
  EOR #$FFFF                                ; $0CD33B |
  INC A                                     ; $0CD33E |

CODE_0CD33F:
  LSR A                                     ; $0CD33F |
  LSR A                                     ; $0CD340 |
  LSR A                                     ; $0CD341 |
  LSR A                                     ; $0CD342 |
  STA !s_spr_y_accel,x                      ; $0CD343 |
  RTL                                       ; $0CD346 |

  LDX $12                                   ; $0CD347 |
  LDA #$00A0                                ; $0CD349 |
  CMP !s_spr_wildcard_3_lo_dp,x             ; $0CD34C |
  BCC CODE_0CD365                           ; $0CD34E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD350 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD352 |
  AND #$FFDF                                ; $0CD355 |
  STA !s_spr_bitwise_settings_1,x           ; $0CD358 |
  LDA !s_spr_anim_frame,x                   ; $0CD35B |
  AND #$0001                                ; $0CD35E |
  STA !s_spr_anim_frame,x                   ; $0CD361 |
  RTL                                       ; $0CD364 |

CODE_0CD365:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD365 |
  SEC                                       ; $0CD367 |
  SBC #$0002                                ; $0CD368 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD36B |
  RTL                                       ; $0CD36D |

  LDX $12                                   ; $0CD36E |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD370 |
  CMP #$00EC                                ; $0CD372 |
  BCC CODE_0CD380                           ; $0CD375 |

CODE_0CD377:
  SEP #$20                                  ; $0CD377 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CD379 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CD37B |
  REP #$20                                  ; $0CD37D |
  RTL                                       ; $0CD37F |

CODE_0CD380:
  CLC                                       ; $0CD380 |
  ADC #$0002                                ; $0CD381 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD384 |
  RTL                                       ; $0CD386 |

  LDX $12                                   ; $0CD387 |
  LDA #$00CC                                ; $0CD389 |

CODE_0CD38C:
  CMP !s_spr_wildcard_3_lo_dp,x             ; $0CD38C |
  BCC CODE_0CD3A2                           ; $0CD38E |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD390 |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD392 |
  AND #$FFDF                                ; $0CD395 |
  STA !s_spr_bitwise_settings_1,x           ; $0CD398 |
  LDA #$0140                                ; $0CD39B |
  STA !s_spr_timer_2,x                      ; $0CD39E |
  RTL                                       ; $0CD3A1 |

CODE_0CD3A2:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD3A2 |
  SEC                                       ; $0CD3A4 |
  SBC #$0001                                ; $0CD3A5 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD3A8 |
  RTL                                       ; $0CD3AA |

  LDX $12                                   ; $0CD3AB |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD3AD |
  CMP #$0120                                ; $0CD3AF |
  BCC CODE_0CD380                           ; $0CD3B2 |
  BRA CODE_0CD377                           ; $0CD3B4 |
  LDX $12                                   ; $0CD3B6 |
  LDA #$0100                                ; $0CD3B8 |
  BRA CODE_0CD38C                           ; $0CD3BB |
  LDX $12                                   ; $0CD3BD |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD3BF |
  CMP #$0133                                ; $0CD3C1 |
  BCS CODE_0CD3CD                           ; $0CD3C4 |
  CLC                                       ; $0CD3C6 |
  ADC #$0001                                ; $0CD3C7 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CD3CA |
  RTL                                       ; $0CD3CC |

CODE_0CD3CD:
  JSL $04849E                               ; $0CD3CD |
  LDA #$003B                                ; $0CD3D1 |\ play sound #$003B
  JSL push_sound_queue                      ; $0CD3D4 |/
  JML $03A31E                               ; $0CD3D8 |

CODE_0CD3DC:
  LDA !s_spr_anim_frame,x                   ; $0CD3DC |
  CMP #$0002                                ; $0CD3DF |
  BCC CODE_0CD434                           ; $0CD3E2 |
  LDA !s_spr_dyntile_index,x                ; $0CD3E4 |
  BMI CODE_0CD434                           ; $0CD3E7 |
  REP #$10                                  ; $0CD3E9 |
  LDA #$0000                                ; $0CD3EB |
  STA !gsu_r5                               ; $0CD3EE |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD3F1 |
  STA !gsu_r6                               ; $0CD3F3 |
  LDA !s_spr_anim_frame,x                   ; $0CD3F6 |
  AND #$0001                                ; $0CD3F9 |
  STA $00                                   ; $0CD3FC |
  ASL A                                     ; $0CD3FE |
  CLC                                       ; $0CD3FF |
  ADC $00                                   ; $0CD400 |
  TAY                                       ; $0CD402 |
  LDA $D14A,y                               ; $0CD403 |
  STA !gsu_r12                              ; $0CD406 |
  LDA $D14C,y                               ; $0CD409 |
  AND #$00FF                                ; $0CD40C |
  STA !gsu_r13                              ; $0CD40F |
  LDY !s_spr_dyntile_index,x                ; $0CD412 |
  TYX                                       ; $0CD415 |
  LDA $03A9CE,x                             ; $0CD416 |
  STA !gsu_r3                               ; $0CD41A |
  LDA $03A9EE,x                             ; $0CD41D |
  STA !gsu_r2                               ; $0CD421 |
  SEP #$10                                  ; $0CD424 |
  LDX #$08                                  ; $0CD426 |
  LDA #$8205                                ; $0CD428 |
  JSL r_gsu_init_1                          ; $0CD42B | GSU init
  INC $0CF9                                 ; $0CD42F |
  LDX $12                                   ; $0CD432 |

CODE_0CD434:
  RTS                                       ; $0CD434 |

CODE_0CD435:
  LDA !s_spr_bitwise_settings_1,x           ; $0CD435 |
  BIT #$0020                                ; $0CD438 |
  BNE CODE_0CD434                           ; $0CD43B |
  LDY !s_spr_collision_id,x                 ; $0CD43D |
  BMI CODE_0CD4AA                           ; $0CD440 |
  DEY                                       ; $0CD442 |
  BMI CODE_0CD434                           ; $0CD443 |
  BEQ CODE_0CD434                           ; $0CD445 |
  LDA !s_spr_state,y                        ; $0CD447 |
  CMP #$0010                                ; $0CD44A |
  BNE CODE_0CD434                           ; $0CD44D |
  LDA !s_spr_collision_state,y              ; $0CD44F |
  BEQ CODE_0CD45D                           ; $0CD452 |
  TYX                                       ; $0CD454 |
  JSL $03B24B                               ; $0CD455 |
  LDX $12                                   ; $0CD459 |
  BRA CODE_0CD46C                           ; $0CD45B |

CODE_0CD45D:
  LDA !s_spr_id,y                           ; $0CD45D |
  CMP #$0015                                ; $0CD460 |
  BNE CODE_0CD434                           ; $0CD463 |
  TYX                                       ; $0CD465 |
  JSL $0481A1                               ; $0CD466 |
  LDX $12                                   ; $0CD46A |

CODE_0CD46C:
  LDA #$0020                                ; $0CD46C |\ play sound #$0020
  JSL push_sound_queue                      ; $0CD46F |/
  STZ !s_spr_x_speed_lo,x                   ; $0CD473 |
  STZ !s_spr_y_speed_lo,x                   ; $0CD476 |
  STZ !s_spr_x_accel,x                      ; $0CD479 |
  STZ !s_spr_y_accel,x                      ; $0CD47C |
  SEP #$20                                  ; $0CD47F |
  LDA !s_spr_anim_frame,x                   ; $0CD481 |
  ORA #$02                                  ; $0CD484 |
  STA !s_spr_anim_frame,x                   ; $0CD486 |
  LDA #$10                                  ; $0CD489 |
  STA !s_spr_state,x                        ; $0CD48B |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD48E |
  ORA #$20                                  ; $0CD491 |
  STA !s_spr_bitwise_settings_1,x           ; $0CD493 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CD496 |
  ORA #$01                                  ; $0CD499 |
  STA !s_spr_bitwise_settings_3,x           ; $0CD49B |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CD49E |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CD4A0 |
  LDA #$02                                  ; $0CD4A2 |
  STA !s_spr_wildcard_4_hi_dp,x             ; $0CD4A4 |
  REP #$20                                  ; $0CD4A6 |
  PLA                                       ; $0CD4A8 |
  RTL                                       ; $0CD4A9 |

CODE_0CD4AA:
  JSL player_hit_sprite                     ; $0CD4AA |
  RTS                                       ; $0CD4AE |

  LDY $7862,x                               ; $0CD4AF |
  BNE CODE_0CD4C2                           ; $0CD4B2 |
  LDA #$0040                                ; $0CD4B4 |
  STA !s_spr_y_accel,x                      ; $0CD4B7 |
  LDA #$0400                                ; $0CD4BA |
  STA !s_spr_y_accel_ceiling,x              ; $0CD4BD |
  PLY                                       ; $0CD4C0 |
  PLA                                       ; $0CD4C1 |

CODE_0CD4C2:
  RTL                                       ; $0CD4C2 |

  dw $0001, $0002, $0004, $0008             ; $0CD4C3 |
  dw $0010, $0020, $0040                    ; $0CD4CB |

  dw $FFFE, $FFFD, $FFFB, $FFF7             ; $0CD4D1 |
  dw $FFEF, $FFDF, $FFBF                    ; $0CD4D9 |

  dw $0000, $0400, $0800, $0C00             ; $0CD4DF |
  dw $1000, $1400, $1800                    ; $0CD4E7 |

  dw $FFFF, $FFE0, $2005, $0804             ; $0CD4ED |

; regular, big boo, and big boo with 3 boos
init_boo:
  SEP #$20                                  ; $0CD4F5 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD4F7 |
  AND #$10                                  ; $0CD4FA |
  LSR A                                     ; $0CD4FC |
  LSR A                                     ; $0CD4FD |
  LSR A                                     ; $0CD4FE |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CD4FF |
  REP #$20                                  ; $0CD501 |
  BNE CODE_0CD525                           ; $0CD503 |
  TXY                                       ; $0CD505 |
  LDX #$0C                                  ; $0CD506 |
  LDA $0CC4                                 ; $0CD508 |

CODE_0CD50B:
  BIT $D4C3,x                               ; $0CD50B |
  BEQ CODE_0CD519                           ; $0CD50E |
  DEX                                       ; $0CD510 |
  DEX                                       ; $0CD511 |
  BPL CODE_0CD50B                           ; $0CD512 |
  TYX                                       ; $0CD514 |
  JML $03A31E                               ; $0CD515 |

CODE_0CD519:
  SEP #$20                                  ; $0CD519 |
  TXA                                       ; $0CD51B |
  TYX                                       ; $0CD51C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CD51D |
  REP #$20                                  ; $0CD51F |
  JSR CODE_0CD6A2                           ; $0CD521 |
  RTL                                       ; $0CD524 |

CODE_0CD525:
  LDA !s_spr_y_pixel_pos,x                  ; $0CD525 |
  AND #$0010                                ; $0CD528 |
  LSR A                                     ; $0CD52B |
  LSR A                                     ; $0CD52C |
  LSR A                                     ; $0CD52D |
  TAY                                       ; $0CD52E |
  LDA !s_spr_bitwise_settings_1,x           ; $0CD52F |
  AND $D4ED,y                               ; $0CD532 |
  STA !s_spr_bitwise_settings_1,x           ; $0CD535 |
  LDA !s_spr_oam_1,x                        ; $0CD538 |
  AND #$07F0                                ; $0CD53B |
  ORA $D4F1,y                               ; $0CD53E |
  STA !s_spr_oam_1,x                        ; $0CD541 |
  RTL                                       ; $0CD544 |

; regular, big boo, and big boo with 3 boos
main_boo:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CD545 |
  TYX                                       ; $0CD547 |
  JMP ($D54B,x)                             ; $0CD548 |

  dw $D54F                                  ; $0CD54B |
  dw $D926                                  ; $0CD54D |

  LDX $12                                   ; $0CD54F |
  JSR CODE_0CD6CE                           ; $0CD551 |
  JSL $03AF23                               ; $0CD554 |
  JSL $0CD8FC                               ; $0CD558 |
  JSR CODE_0CD6A2                           ; $0CD55C |
  JSL $0CD77C                               ; $0CD55F |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CD563 |
  TYX                                       ; $0CD565 |
  JMP ($D569,x)                             ; $0CD566 |

  dw $D5FD                                  ; $0CD569 |
  dw $D56F                                  ; $0CD56B |
  dw $D5CE                                  ; $0CD56D |

  LDX $12                                   ; $0CD56F |
  LDA !s_spr_x_player_dir,x                 ; $0CD571 |
  AND #$00FF                                ; $0CD574 |
  CMP !s_spr_facing_dir,x                   ; $0CD577 |
  BNE CODE_0CD5BB                           ; $0CD57A |
  CMP !s_player_direction                   ; $0CD57C |
  BNE CODE_0CD5BB                           ; $0CD57F |
  LDA !s_spr_timer_1,x                      ; $0CD581 |
  BNE CODE_0CD59C                           ; $0CD584 |
  LDA #$0010                                ; $0CD586 |
  STA !s_spr_timer_1,x                      ; $0CD589 |
  LDA #$0001                                ; $0CD58C |
  STA !s_spr_anim_frame,x                   ; $0CD58F |
  LDA $10                                   ; $0CD592 |
  AND #$003F                                ; $0CD594 |
  BNE CODE_0CD59C                           ; $0CD597 |
  STZ !s_spr_anim_frame,x                   ; $0CD599 |

CODE_0CD59C:
  SEP #$20                                  ; $0CD59C |
  LDA #$01                                  ; $0CD59E |
  LDY !s_spr_timer_2,x                      ; $0CD5A0 |
  BNE CODE_0CD5B8                           ; $0CD5A3 |
  STA !s_spr_wildcard_6_lo,x                ; $0CD5A5 |
  LDY !s_spr_timer_3,x                      ; $0CD5A8 |
  BNE CODE_0CD5B8                           ; $0CD5AB |
  STA !s_spr_wildcard_6_hi,x                ; $0CD5AD |
  LDY !s_spr_timer_4,x                      ; $0CD5B0 |
  BNE CODE_0CD5B8                           ; $0CD5B3 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CD5B5 |

CODE_0CD5B8:
  REP #$20                                  ; $0CD5B8 |
  RTL                                       ; $0CD5BA |

CODE_0CD5BB:
  SEP #$20                                  ; $0CD5BB |
  LDA #$01                                  ; $0CD5BD |
  STA !s_spr_anim_frame,x                   ; $0CD5BF |
  LDA #$10                                  ; $0CD5C2 |
  STA $77C0,x                               ; $0CD5C4 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD5C7 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD5C9 |
  REP #$20                                  ; $0CD5CB |
  RTL                                       ; $0CD5CD |

  LDX $12                                   ; $0CD5CE |
  LDY $77C0,x                               ; $0CD5D0 |
  BEQ CODE_0CD5DD                           ; $0CD5D3 |
  SEP #$20                                  ; $0CD5D5 |
  DEC $77C0,x                               ; $0CD5D7 |
  REP #$20                                  ; $0CD5DA |
  RTL                                       ; $0CD5DC |

CODE_0CD5DD:
  SEP #$20                                  ; $0CD5DD |
  LDA #$01                                  ; $0CD5DF |
  STA !s_spr_anim_frame,x                   ; $0CD5E1 |
  LDA #$04                                  ; $0CD5E4 |
  STA !s_spr_timer_1,x                      ; $0CD5E6 |
  LDA #$08                                  ; $0CD5E9 |
  STA !s_spr_timer_2,x                      ; $0CD5EB |
  LDA #$0C                                  ; $0CD5EE |
  STA !s_spr_timer_3,x                      ; $0CD5F0 |
  LDA #$10                                  ; $0CD5F3 |
  STA !s_spr_timer_4,x                      ; $0CD5F5 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CD5F8 |
  REP #$20                                  ; $0CD5FA |
  RTL                                       ; $0CD5FC |

  LDX $12                                   ; $0CD5FD |
  JSR CODE_0CD803                           ; $0CD5FF |
  LDA !s_spr_timer_1,x                      ; $0CD602 |
  BNE CODE_0CD659                           ; $0CD605 |
  STZ !s_spr_anim_frame,x                   ; $0CD607 |
  SEP #$20                                  ; $0CD60A |
  LDA !s_spr_timer_2,x                      ; $0CD60C |
  BNE CODE_0CD622                           ; $0CD60F |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0CD611 |
  LDA !s_spr_timer_3,x                      ; $0CD613 |
  BNE CODE_0CD622                           ; $0CD616 |
  STZ !s_spr_wildcard_6_hi_dp,x             ; $0CD618 |
  LDA !s_spr_timer_4,x                      ; $0CD61A |
  BNE CODE_0CD622                           ; $0CD61D |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CD61F |

CODE_0CD622:
  REP #$20                                  ; $0CD622 |
  LDA !s_spr_x_player_dir,x                 ; $0CD624 |
  AND #$00FF                                ; $0CD627 |
  CMP !s_spr_facing_dir,x                   ; $0CD62A |
  BNE CODE_0CD65A                           ; $0CD62D |
  CMP !s_player_direction                   ; $0CD62F |
  BNE CODE_0CD65A                           ; $0CD632 |
  STZ !s_spr_x_speed_lo,x                   ; $0CD634 |
  STZ !s_spr_y_speed_lo,x                   ; $0CD637 |
  SEP #$20                                  ; $0CD63A |
  LDA #$08                                  ; $0CD63C |
  STA !s_spr_timer_1,x                      ; $0CD63E |
  LDA #$10                                  ; $0CD641 |
  STA !s_spr_timer_2,x                      ; $0CD643 |
  LDA #$18                                  ; $0CD646 |
  STA !s_spr_timer_3,x                      ; $0CD648 |
  LDA #$20                                  ; $0CD64B |
  STA !s_spr_timer_4,x                      ; $0CD64D |
  STZ !s_spr_anim_frame,x                   ; $0CD650 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD653 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD655 |
  REP #$20                                  ; $0CD657 |

CODE_0CD659:
  RTL                                       ; $0CD659 |

CODE_0CD65A:
  STA !s_spr_facing_dir,x                   ; $0CD65A |
  LDA !s_player_center_x                    ; $0CD65D |
  STA !gsu_r1                               ; $0CD660 |
  LDA !s_player_center_y                    ; $0CD663 |
  STA !gsu_r2                               ; $0CD666 |
  LDA !s_spr_x_hitbox_center,x              ; $0CD669 |
  STA !gsu_r3                               ; $0CD66C |
  LDA !s_spr_y_hitbox_center,x              ; $0CD66F |
  STA !gsu_r4                               ; $0CD672 |
  LDA #$0080                                ; $0CD675 |
  STA !gsu_r6                               ; $0CD678 |
  LDX #$09                                  ; $0CD67B |
  LDA #$907C                                ; $0CD67D |
  JSL r_gsu_init_1                          ; $0CD680 | GSU init
  LDX $12                                   ; $0CD684 |
  LDA !gsu_r1                               ; $0CD686 |
  STA !s_spr_x_speed_lo,x                   ; $0CD689 |
  LDA !gsu_r2                               ; $0CD68C |
  STA !s_spr_y_speed_lo,x                   ; $0CD68F |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD692 |
  CMP #$0100                                ; $0CD694 |
  BCS CODE_0CD69B                           ; $0CD697 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CD699 |

CODE_0CD69B:
  SEP #$20                                  ; $0CD69B |
  INC !s_spr_wildcard_4_hi_dp,x             ; $0CD69D |
  REP #$20                                  ; $0CD69F |
  RTL                                       ; $0CD6A1 |

CODE_0CD6A2:
  TXY                                       ; $0CD6A2 |
  LDX !s_spr_wildcard_4_lo_dp,y             ; $0CD6A3 |
  LDA !s_spr_wildcard_4_hi,y                ; $0CD6A5 |
  AND #$00FF                                ; $0CD6A8 |
  ASL A                                     ; $0CD6AB |
  ASL A                                     ; $0CD6AC |
  CLC                                       ; $0CD6AD |
  ADC $D4DF,x                               ; $0CD6AE |
  REP #$10                                  ; $0CD6B1 |
  TAX                                       ; $0CD6B3 |
  LDA !s_spr_x_pixel_pos,y                  ; $0CD6B4 |
  STA $7E5DA6,x                             ; $0CD6B7 |
  LDA !s_spr_y_pixel_pos,y                  ; $0CD6BB |
  STA $7E5DA8,x                             ; $0CD6BE |
  SEP #$10                                  ; $0CD6C2 |
  TYX                                       ; $0CD6C4 |

CODE_0CD6C5:
  RTS                                       ; $0CD6C5 |

  dw $0090, $0060, $0030, $2E26             ; $0CD6C6 |

CODE_0CD6CE:
  LDY !s_spr_draw_priority,x                ; $0CD6CE |
  BMI CODE_0CD6C5                           ; $0CD6D1 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD6D3 |
  LDA #$5DA6                                ; $0CD6D5 |
  CLC                                       ; $0CD6D8 |
  ADC $D4DF,y                               ; $0CD6D9 |
  STA $00                                   ; $0CD6DC |
  LDY #$7E                                  ; $0CD6DE |
  STY $02                                   ; $0CD6E0 |
  SEP #$20                                  ; $0CD6E2 |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0CD6E4 |
  LDA $D6CC,y                               ; $0CD6E6 |
  STA $0E                                   ; $0CD6E9 |
  STZ $0F                                   ; $0CD6EB |
  LDY !s_spr_wildcard_6_hi_dp,x             ; $0CD6ED |
  LDA $D6CC,y                               ; $0CD6EF |
  STA $0C                                   ; $0CD6F2 |
  STZ $0D                                   ; $0CD6F4 |
  LDY !s_spr_gsu_morph_1_lo,x               ; $0CD6F6 |
  LDA $D6CC,y                               ; $0CD6F9 |
  STA $0A                                   ; $0CD6FC |
  STZ $0B                                   ; $0CD6FE |
  REP #$20                                  ; $0CD700 |
  LDA !s_spr_obj_tile_index,x               ; $0CD702 |
  AND #$00FF                                ; $0CD705 |
  ASL A                                     ; $0CD708 |
  ASL A                                     ; $0CD709 |
  ASL A                                     ; $0CD70A |
  STA $08                                   ; $0CD70B |
  LDY #$04                                  ; $0CD70D |

CODE_0CD70F:
  LDA $08                                   ; $0CD70F |
  CLC                                       ; $0CD711 |
  ADC $796A,y                               ; $0CD712 |
  STA $796A,y                               ; $0CD715 |
  DEY                                       ; $0CD718 |
  DEY                                       ; $0CD719 |
  BPL CODE_0CD70F                           ; $0CD71A |
  REP #$10                                  ; $0CD71C |
  LDA !s_spr_oam_pointer,x                  ; $0CD71E |
  STA $06                                   ; $0CD721 |
  LDA #$0004                                ; $0CD723 |
  STA $04                                   ; $0CD726 |

CODE_0CD728:
  LDY $04                                   ; $0CD728 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD72A |
  CMP $D6C6,y                               ; $0CD72C |
  BCS CODE_0CD736                           ; $0CD72F |
  LDY #$0000                                ; $0CD731 |
  BRA CODE_0CD745                           ; $0CD734 |

CODE_0CD736:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $0CD736 |
  AND #$00FF                                ; $0CD738 |
  SEC                                       ; $0CD73B |
  SBC $D6C6,y                               ; $0CD73C |
  AND #$00FF                                ; $0CD73F |
  ASL A                                     ; $0CD742 |
  ASL A                                     ; $0CD743 |
  TAY                                       ; $0CD744 |

CODE_0CD745:
  PHX                                       ; $0CD745 |
  LDX $06                                   ; $0CD746 |
  LDA [$00],y                               ; $0CD748 |
  SEC                                       ; $0CD74A |
  SBC !r_bg1_cam_x                          ; $0CD74B |
  STA $6028,x                               ; $0CD74E |
  INY                                       ; $0CD751 |
  INY                                       ; $0CD752 |
  LDA [$00],y                               ; $0CD753 |
  SEC                                       ; $0CD755 |
  SBC !r_bg1_cam_y                          ; $0CD756 |
  STA $602A,x                               ; $0CD759 |
  LDY $04                                   ; $0CD75C |
  LDA $602C,x                               ; $0CD75E |
  AND #$FE00                                ; $0CD761 |
  ORA $796A,y                               ; $0CD764 |
  STA $602C,x                               ; $0CD767 |
  PLX                                       ; $0CD76A |
  LDA $06                                   ; $0CD76B |
  CLC                                       ; $0CD76D |
  ADC #$0008                                ; $0CD76E |
  STA $06                                   ; $0CD771 |
  DEC $04                                   ; $0CD773 |
  DEC $04                                   ; $0CD775 |
  BPL CODE_0CD728                           ; $0CD777 |
  SEP #$10                                  ; $0CD779 |
  RTS                                       ; $0CD77B |

  LDY !s_spr_collision_id,x                 ; $0CD77C |
  BPL CODE_0CD785                           ; $0CD77F |
  JML $03A858                               ; $0CD781 |

CODE_0CD785:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD785 |
  LDA #$5DA6                                ; $0CD787 |
  CLC                                       ; $0CD78A |
  ADC $D4DF,y                               ; $0CD78B |
  STA $00                                   ; $0CD78E |
  LDY #$7E                                  ; $0CD790 |
  STY $02                                   ; $0CD792 |
  LDA !s_player_hitbox_half_width           ; $0CD794 |
  CLC                                       ; $0CD797 |
  ADC #$0006                                ; $0CD798 |
  STA $06                                   ; $0CD79B |
  ASL A                                     ; $0CD79D |
  STA $08                                   ; $0CD79E |
  LDA !s_player_hitbox_half_height          ; $0CD7A0 |
  CLC                                       ; $0CD7A3 |
  ADC #$0006                                ; $0CD7A4 |
  STA $0A                                   ; $0CD7A7 |
  ASL A                                     ; $0CD7A9 |
  STA $0C                                   ; $0CD7AA |
  REP #$10                                  ; $0CD7AC |
  LDA #$0004                                ; $0CD7AE |
  STA $04                                   ; $0CD7B1 |

CODE_0CD7B3:
  LDY $04                                   ; $0CD7B3 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD7B5 |
  CMP $D6C6,y                               ; $0CD7B7 |
  BCS CODE_0CD7C1                           ; $0CD7BA |
  LDY #$0000                                ; $0CD7BC |
  BRA CODE_0CD7D0                           ; $0CD7BF |

CODE_0CD7C1:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $0CD7C1 |
  AND #$00FF                                ; $0CD7C3 |
  SEC                                       ; $0CD7C6 |
  SBC $D6C6,y                               ; $0CD7C7 |
  AND #$00FF                                ; $0CD7CA |
  ASL A                                     ; $0CD7CD |
  ASL A                                     ; $0CD7CE |
  TAY                                       ; $0CD7CF |

CODE_0CD7D0:
  LDA [$00],y                               ; $0CD7D0 |
  CLC                                       ; $0CD7D2 |
  ADC #$0008                                ; $0CD7D3 |
  SEC                                       ; $0CD7D6 |
  SBC !s_player_center_x                    ; $0CD7D7 |
  CLC                                       ; $0CD7DA |
  ADC $06                                   ; $0CD7DB |
  CMP $08                                   ; $0CD7DD |
  BCS CODE_0CD7FA                           ; $0CD7DF |
  INY                                       ; $0CD7E1 |
  INY                                       ; $0CD7E2 |
  LDA [$00],y                               ; $0CD7E3 |
  CLC                                       ; $0CD7E5 |
  ADC #$0008                                ; $0CD7E6 |
  SEC                                       ; $0CD7E9 |
  SBC !s_player_center_y                    ; $0CD7EA |
  CLC                                       ; $0CD7ED |
  ADC $0A                                   ; $0CD7EE |
  CMP $0C                                   ; $0CD7F0 |
  BCS CODE_0CD7FA                           ; $0CD7F2 |
  SEP #$10                                  ; $0CD7F4 |
  JML $03A858                               ; $0CD7F6 |

CODE_0CD7FA:
  DEC $04                                   ; $0CD7FA |
  DEC $04                                   ; $0CD7FC |
  BPL CODE_0CD7B3                           ; $0CD7FE |
  SEP #$10                                  ; $0CD800 |
  RTL                                       ; $0CD802 |

CODE_0CD803:
  LDY !s_spr_collision_id,x                 ; $0CD803 |
  DEY                                       ; $0CD806 |
  BMI CODE_0CD818                           ; $0CD807 |
  BEQ CODE_0CD818                           ; $0CD809 |
  LDA !s_spr_state,y                        ; $0CD80B |
  CMP #$0010                                ; $0CD80E |
  BNE CODE_0CD818                           ; $0CD811 |
  LDA !s_spr_collision_state,y              ; $0CD813 |
  BNE CODE_0CD819                           ; $0CD816 |

CODE_0CD818:
  RTS                                       ; $0CD818 |

CODE_0CD819:
  LDA #$003B                                ; $0CD819 |\ play sound #$003B
  JSL push_sound_queue                      ; $0CD81C |/
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD820 |
  LDA #$5DA6                                ; $0CD822 |
  CLC                                       ; $0CD825 |
  ADC $D4DF,y                               ; $0CD826 |
  STA $04                                   ; $0CD829 |
  LDY #$7E                                  ; $0CD82B |
  STY $06                                   ; $0CD82D |
  JSL $0CFF61                               ; $0CD82F |
  REP #$10                                  ; $0CD833 |
  LDA #$0004                                ; $0CD835 |
  STA $08                                   ; $0CD838 |

CODE_0CD83A:
  LDY $08                                   ; $0CD83A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CD83C |
  CMP $D6C6,y                               ; $0CD83E |
  BCS CODE_0CD848                           ; $0CD841 |
  LDY #$0000                                ; $0CD843 |
  BRA CODE_0CD857                           ; $0CD846 |

CODE_0CD848:
  LDA !s_spr_wildcard_4_hi_dp,x             ; $0CD848 |
  AND #$00FF                                ; $0CD84A |
  SEC                                       ; $0CD84D |
  SBC $D6C6,y                               ; $0CD84E |
  AND #$00FF                                ; $0CD851 |
  ASL A                                     ; $0CD854 |
  ASL A                                     ; $0CD855 |
  TAY                                       ; $0CD856 |

CODE_0CD857:
  LDA [$04],y                               ; $0CD857 |
  STA $00                                   ; $0CD859 |
  INY                                       ; $0CD85B |
  INY                                       ; $0CD85C |
  LDA [$04],y                               ; $0CD85D |
  STA $02                                   ; $0CD85F |
  SEP #$10                                  ; $0CD861 |
  LDY $08                                   ; $0CD863 |
  STA $0008,y                               ; $0CD865 |
  LDA $00                                   ; $0CD868 |
  STA $0000,y                               ; $0CD86A |
  LDA #$0208                                ; $0CD86D |
  JSL spawn_ambient_sprite                  ; $0CD870 |
  LDA $00                                   ; $0CD874 |
  STA $70A2,y                               ; $0CD876 |
  LDA $02                                   ; $0CD879 |
  STA $7142,y                               ; $0CD87B |
  LDA #$0003                                ; $0CD87E |
  STA $7782,y                               ; $0CD881 |
  LDA #$0016                                ; $0CD884 |
  STA $73C2,y                               ; $0CD887 |
  REP #$10                                  ; $0CD88A |
  DEC $08                                   ; $0CD88C |
  DEC $08                                   ; $0CD88E |
  BPL CODE_0CD83A                           ; $0CD890 |
  SEP #$10                                  ; $0CD892 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD894 |
  LDA $0CC4                                 ; $0CD896 |
  AND $D4D1,y                               ; $0CD899 |
  STA $0CC4                                 ; $0CD89C |
  JSL $03A32E                               ; $0CD89F |
  LDA #$01A2                                ; $0CD8A3 |
  JSL spawn_sprite_active                   ; $0CD8A6 |
  BCC CODE_0CD8FA                           ; $0CD8AA |
  LDA !s_spr_x_pixel_pos,x                  ; $0CD8AC |
  STA !s_spr_x_pixel_pos,y                  ; $0CD8AF |
  LDA !s_spr_y_pixel_pos,x                  ; $0CD8B2 |
  STA !s_spr_y_pixel_pos,y                  ; $0CD8B5 |
  LDA #$FE00                                ; $0CD8B8 |
  STA !s_spr_y_speed_lo,y                   ; $0CD8BB |
  LDA #$0180                                ; $0CD8BE |
  STA !s_spr_timer_1,y                      ; $0CD8C1 |
  LDA #$0004                                ; $0CD8C4 |
  STA $00                                   ; $0CD8C7 |

CODE_0CD8C9:
  LDY $00                                   ; $0CD8C9 |
  LDA $0000,y                               ; $0CD8CB |
  STA $02                                   ; $0CD8CE |
  LDA $0008,y                               ; $0CD8D0 |
  STA $04                                   ; $0CD8D3 |
  LDA #$01A2                                ; $0CD8D5 |
  JSL spawn_sprite_active                   ; $0CD8D8 |
  BCC CODE_0CD8FA                           ; $0CD8DC |
  LDA $02                                   ; $0CD8DE |
  STA !s_spr_x_pixel_pos,y                  ; $0CD8E0 |
  LDA $04                                   ; $0CD8E3 |
  STA !s_spr_y_pixel_pos,y                  ; $0CD8E5 |
  LDA #$FE00                                ; $0CD8E8 |
  STA !s_spr_y_speed_lo,y                   ; $0CD8EB |
  LDA #$0180                                ; $0CD8EE |
  STA !s_spr_timer_1,y                      ; $0CD8F1 |
  DEC $00                                   ; $0CD8F4 |
  DEC $00                                   ; $0CD8F6 |
  BPL CODE_0CD8C9                           ; $0CD8F8 |

CODE_0CD8FA:
  PLA                                       ; $0CD8FA |
  RTL                                       ; $0CD8FB |

  LDA !s_spr_cam_x_pos,x                    ; $0CD8FC |
  CLC                                       ; $0CD8FF |
  ADC #$0080                                ; $0CD900 |
  CMP #$01F0                                ; $0CD903 |
  BCS CODE_0CD914                           ; $0CD906 |
  LDA !s_spr_cam_y_pos,x                    ; $0CD908 |
  CLC                                       ; $0CD90B |
  ADC #$0080                                ; $0CD90C |
  CMP #$01F0                                ; $0CD90F |
  BCC CODE_0CD925                           ; $0CD912 |

CODE_0CD914:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CD914 |
  LDA $0CC4                                 ; $0CD916 |
  AND $D4D1,y                               ; $0CD919 |
  STA $0CC4                                 ; $0CD91C |
  PLY                                       ; $0CD91F |
  PLA                                       ; $0CD920 |
  JML $03A31E                               ; $0CD921 |

CODE_0CD925:
  RTL                                       ; $0CD925 |

  LDX $12                                   ; $0CD926 |
  JSL $03AF23                               ; $0CD928 |
  JSL $0CDA0C                               ; $0CD92C |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CD930 |
  TYX                                       ; $0CD932 |
  JMP ($D936,x)                             ; $0CD933 |

  dw $D99D                                  ; $0CD936 |
  dw $D93C                                  ; $0CD938 |
  dw $D97D                                  ; $0CD93A |

  LDX $12                                   ; $0CD93C |
  LDA !s_spr_x_player_dir,x                 ; $0CD93E |
  AND #$00FF                                ; $0CD941 |
  CMP !s_spr_facing_dir,x                   ; $0CD944 |
  BNE CODE_0CD96A                           ; $0CD947 |
  CMP !s_player_direction                   ; $0CD949 |
  BNE CODE_0CD96A                           ; $0CD94C |
  LDA !s_spr_timer_1,x                      ; $0CD94E |
  BNE CODE_0CD969                           ; $0CD951 |
  LDA #$0010                                ; $0CD953 |
  STA !s_spr_timer_1,x                      ; $0CD956 |
  LDA #$0002                                ; $0CD959 |
  STA !s_spr_anim_frame,x                   ; $0CD95C |
  LDA $10                                   ; $0CD95F |
  AND #$003F                                ; $0CD961 |
  BNE CODE_0CD969                           ; $0CD964 |
  STZ !s_spr_anim_frame,x                   ; $0CD966 |

CODE_0CD969:
  RTL                                       ; $0CD969 |

CODE_0CD96A:
  SEP #$20                                  ; $0CD96A |
  LDA #$02                                  ; $0CD96C |
  STA !s_spr_anim_frame,x                   ; $0CD96E |
  LDA #$10                                  ; $0CD971 |
  STA $77C0,x                               ; $0CD973 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD976 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD978 |
  REP #$20                                  ; $0CD97A |
  RTL                                       ; $0CD97C |

  LDX $12                                   ; $0CD97D |
  LDY $77C0,x                               ; $0CD97F |
  BEQ CODE_0CD98C                           ; $0CD982 |
  SEP #$20                                  ; $0CD984 |
  DEC $77C0,x                               ; $0CD986 |
  REP #$20                                  ; $0CD989 |
  RTL                                       ; $0CD98B |

CODE_0CD98C:
  SEP #$20                                  ; $0CD98C |
  LDA #$02                                  ; $0CD98E |
  STA !s_spr_anim_frame,x                   ; $0CD990 |
  LDA #$04                                  ; $0CD993 |
  STA !s_spr_timer_1,x                      ; $0CD995 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CD998 |
  REP #$20                                  ; $0CD99A |
  RTL                                       ; $0CD99C |

  LDX $12                                   ; $0CD99D |
  JSR CODE_0CDA16                           ; $0CD99F |
  LDA !s_spr_timer_1,x                      ; $0CD9A2 |
  BNE CODE_0CD9D2                           ; $0CD9A5 |
  STZ !s_spr_anim_frame,x                   ; $0CD9A7 |
  LDA !s_spr_x_player_dir,x                 ; $0CD9AA |
  AND #$00FF                                ; $0CD9AD |
  CMP !s_spr_facing_dir,x                   ; $0CD9B0 |
  BNE CODE_0CD9D3                           ; $0CD9B3 |
  CMP !s_player_direction                   ; $0CD9B5 |
  BNE CODE_0CD9D3                           ; $0CD9B8 |
  STZ !s_spr_x_speed_lo,x                   ; $0CD9BA |
  STZ !s_spr_y_speed_lo,x                   ; $0CD9BD |
  SEP #$20                                  ; $0CD9C0 |
  LDA #$10                                  ; $0CD9C2 |
  STA !s_spr_timer_1,x                      ; $0CD9C4 |
  LDA #$00                                  ; $0CD9C7 |
  STA !s_spr_anim_frame,x                   ; $0CD9C9 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD9CC |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CD9CE |
  REP #$20                                  ; $0CD9D0 |

CODE_0CD9D2:
  RTL                                       ; $0CD9D2 |

CODE_0CD9D3:
  STA !s_spr_facing_dir,x                   ; $0CD9D3 |
  LDA !s_player_center_x                    ; $0CD9D6 |
  STA !gsu_r1                               ; $0CD9D9 |
  LDA !s_player_center_y                    ; $0CD9DC |
  STA !gsu_r2                               ; $0CD9DF |
  LDA !s_spr_x_hitbox_center,x              ; $0CD9E2 |
  STA !gsu_r3                               ; $0CD9E5 |
  LDA !s_spr_y_hitbox_center,x              ; $0CD9E8 |
  STA !gsu_r4                               ; $0CD9EB |
  LDA #$0080                                ; $0CD9EE |
  STA !gsu_r6                               ; $0CD9F1 |
  LDX #$09                                  ; $0CD9F4 |
  LDA #$907C                                ; $0CD9F6 |
  JSL r_gsu_init_1                          ; $0CD9F9 | GSU init
  LDX $12                                   ; $0CD9FD |
  LDA !gsu_r1                               ; $0CD9FF |
  STA !s_spr_x_speed_lo,x                   ; $0CDA02 |
  LDA !gsu_r2                               ; $0CDA05 |
  STA !s_spr_y_speed_lo,x                   ; $0CDA08 |
  RTL                                       ; $0CDA0B |

  LDY !s_spr_collision_id,x                 ; $0CDA0C |
  BPL CODE_0CDA15                           ; $0CDA0F |
  JML $03A858                               ; $0CDA11 |

CODE_0CDA15:
  RTL                                       ; $0CDA15 |

CODE_0CDA16:
  LDY !s_spr_collision_id,x                 ; $0CDA16 |
  DEY                                       ; $0CDA19 |
  BMI CODE_0CDA2B                           ; $0CDA1A |
  BEQ CODE_0CDA2B                           ; $0CDA1C |
  LDA !s_spr_state,y                        ; $0CDA1E |
  CMP #$0010                                ; $0CDA21 |
  BNE CODE_0CDA2B                           ; $0CDA24 |
  LDA !s_spr_collision_state,y              ; $0CDA26 |
  BNE CODE_0CDA2C                           ; $0CDA29 |

CODE_0CDA2B:
  RTS                                       ; $0CDA2B |

CODE_0CDA2C:
  LDA #$003B                                ; $0CDA2C |\ play sound #$003B
  JSL push_sound_queue                      ; $0CDA2F |/
  JSL $0CFF61                               ; $0CDA33 |
  JSL $03A32E                               ; $0CDA37 |
  LDA #$01A2                                ; $0CDA3B |
  JSL spawn_sprite_active                   ; $0CDA3E |
  BCC CODE_0CDA5C                           ; $0CDA42 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CDA44 |
  STA !s_spr_x_pixel_pos,y                  ; $0CDA47 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CDA4A |
  STA !s_spr_y_pixel_pos,y                  ; $0CDA4D |
  LDA #$FE00                                ; $0CDA50 |
  STA !s_spr_y_speed_lo,y                   ; $0CDA53 |
  LDA #$0180                                ; $0CDA56 |
  STA !s_spr_timer_1,y                      ; $0CDA59 |

CODE_0CDA5C:
  PLA                                       ; $0CDA5C |
  RTL                                       ; $0CDA5D |

  dw $0026, $0024, $0050, $0051             ; $0CDA5E |
  dw $0080, $0081, $00B0, $00B1             ; $0CDA66 |
  dw $00E0, $00E1, $0110, $0116             ; $0CDA6E |
  dw $0202, $0202, $0404, $0402             ; $0CDA76 |
  dw $0402, $0404, $3535, $3535             ; $0CDA7E |
  dw $3333, $B335, $3335, $3333             ; $0CDA86 |
  dw $0404, $0404, $0101, $0104             ; $0CDA8E |
  dw $0104, $0101, $00D8, $00D8             ; $0CDA96 |
  dw $00D8, $00D8, $00FA, $00FA             ; $0CDA9E |
  dw $00D8, $00FA, $00D8, $00FA             ; $0CDAA6 |
  dw $00FA, $00FA, $3E00, $3E00             ; $0CDAAE |
  dw $3E00, $3E00, $3600, $3600             ; $0CDAB6 |
  dw $3E00, $3600, $3E00, $3600             ; $0CDABE |
  dw $3600, $3600                           ; $0CDAC6 |

; color of kamek's first magic spell per boss battle
  dw $611F, $22DF                           ; $0CDACA |
  dw $7F00, $23EC                           ; $0CDACE |
  dw $611F, $22DF                           ; $0CDAD2 |
  dw $7F00, $5C13                           ; $0CDAD6 |
  dw $611F, $22DF                           ; $0CDADA |
  dw $7F00, $23EC                           ; $0CDADE |

; color of kamek's second magic spell per boss battle
  dw $22DF, $7F00                           ; $0CDAE2 |
  dw $23EC, $7F00                           ; $0CDAE6 |
  dw $7F00, $23EC                           ; $0CDAEA |
  dw $611F, $5D20                           ; $0CDAEE |
  dw $23EC, $611F                           ; $0CDAF2 |
  dw $22DF, $611F                           ; $0CDAF6 |

; music to use per boss battle
  db $0A, $0C                               ; $0CDAFA |
  db $0A, $0C                               ; $0CDAFC |
  db $0A, $0A                               ; $0CDAFE |
  db $0A, $0C                               ; $0CDB00 |
  db $0A, $0A                               ; $0CDB02 |
  db $0A, $0C                               ; $0CDB04 |

init_boss_kamek:
  LDA !s_player_state                       ; $0CDB06 |
  BEQ CODE_0CDB13                           ; $0CDB09 |
  LDA #$0002                                ; $0CDB0B |
  STA !s_spr_state,x                        ; $0CDB0E |
  BRA CODE_0CDB4D                           ; $0CDB11 |

CODE_0CDB13:
  JSL $028925                               ; $0CDB13 |
  STZ !s_player_x_speed                     ; $0CDB17 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CDB1A |
  AND #$0010                                ; $0CDB1D |
  LSR A                                     ; $0CDB20 |
  LSR A                                     ; $0CDB21 |
  LSR A                                     ; $0CDB22 |
  LSR A                                     ; $0CDB23 |
  ORA !r_cur_world                          ; $0CDB24 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CDB27 |
  LDA !r_header_bg2_tileset                 ; $0CDB29 |
  CMP #$0016                                ; $0CDB2C |
  BNE CODE_0CDB47                           ; $0CDB2F |
  SEP #$20                                  ; $0CDB31 |
  LDA #$0F                                  ; $0CDB33 |
  STA $4331                                 ; $0CDB35 |
  LDA #$10                                  ; $0CDB38 |
  STA $4341                                 ; $0CDB3A |
  REP #$20                                  ; $0CDB3D |
  LDA #$0100                                ; $0CDB3F |
  STA !s_bg2_cam_x                          ; $0CDB42 |
  BRA CODE_0CDB4D                           ; $0CDB45 |

CODE_0CDB47:
  LDA #$0100                                ; $0CDB47 |
  STA !s_bg3_cam_x                          ; $0CDB4A |

CODE_0CDB4D:
  LDA #$FFFF                                ; $0CDB4D |
  STA $0E35                                 ; $0CDB50 |
  RTL                                       ; $0CDB53 |

  db $40, $21, $98, $5C, $7E                ; $0CDB54 |

  db $D9, $18, $5A, $D9, $18, $5A, $00      ; $0CDB59 |

  db $42, $22, $18, $5D, $7E                ; $0CDB60 |

  db $D9, $88, $53, $D9, $3A, $54, $00      ; $0CDB65 |

main_boss_kamek:
  JSL $03AF23                               ; $0CDB6C |
  JSR CODE_0CE526                           ; $0CDB70 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CDB73 |
  TYX                                       ; $0CDB75 |
  JMP (boss_kamek_state_ptr,x)              ; $0CDB76 |

boss_kamek_state_ptr:
  dw $DB97                                  ; $0CDB79 | $00: waiting to fly in
  dw $DBD7                                  ; $0CDB7B | $02: init
  dw $DC1B                                  ; $0CDB7D | $04: flying in
  dw $DC99                                  ; $0CDB7F | $06: talking
  dw $DCE8                                  ; $0CDB81 | $08: message box
  dw $DD31                                  ; $0CDB83 | $0A: turning around
  dw $DD7B                                  ; $0CDB85 | $0C: flying out
  dw $DDA5                                  ; $0CDB87 | $0E: init magic 1
  dw $E10E                                  ; $0CDB89 | $10: magic 1
  dw $E34D                                  ; $0CDB8B | $12: waiting offscreen during magic 1
  dw $DF4B                                  ; $0CDB8D | $14: init magic 2
  dw $E214                                  ; $0CDB8F | $16: magic 2
  dw $E404                                  ; $0CDB91 | $18: waiting offscreen during magic 2
  dw $E4A7                                  ; $0CDB93 | $1A: cleanup
  dw $E4CB                                  ; $0CDB95 | $1C: despawn

  LDX $12                                   ; $0CDB97 |
  LDA $1015                                 ; $0CDB99 |
  BEQ CODE_0CDBBD                           ; $0CDB9C |
  LDA $60C6                                 ; $0CDB9E |
  BNE CODE_0CDBA8                           ; $0CDBA1 |
  LDA !s_player_jump_state                  ; $0CDBA3 |
  BNE CODE_0CDBBD                           ; $0CDBA6 |

CODE_0CDBA8:
  LDA $03AE                                 ; $0CDBA8 |
  BNE CODE_0CDBBE                           ; $0CDBAB |
  INC $03AE                                 ; $0CDBAD |
  SEP #$20                                  ; $0CDBB0 |
  LDA #$00                                  ; $0CDBB2 |
  STA !s_spr_timer_2,x                      ; $0CDBB4 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDBB7 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDBB9 |
  REP #$20                                  ; $0CDBBB |

CODE_0CDBBD:
  RTL                                       ; $0CDBBD |

CODE_0CDBBE:
  LDA #$0001                                ; $0CDBBE |
  STA !s_player_disable_flag                ; $0CDBC1 |
  LDA !r_reg_coldata_mirror                 ; $0CDBC4 |
  STA !s_cgram_mirror                       ; $0CDBC7 |
  STA $702D6C                               ; $0CDBCB |
  STZ !r_reg_coldata_mirror                 ; $0CDBCF |
  LDY #$0E                                  ; $0CDBD2 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0CDBD4 |
  RTL                                       ; $0CDBD6 |

  LDX $12                                   ; $0CDBD7 |
  LDA !s_spr_timer_2,x                      ; $0CDBD9 |
  BNE CODE_0CDC1A                           ; $0CDBDC |
  LDA #$0001                                ; $0CDBDE |
  STA !s_player_disable_flag                ; $0CDBE1 |
  LDA !r_bg1_cam_x                          ; $0CDBE4 |
  CLC                                       ; $0CDBE7 |
  ADC #$0130                                ; $0CDBE8 |
  STA !s_spr_x_pixel_pos,x                  ; $0CDBEB |
  LDA !r_bg1_cam_y                          ; $0CDBEE |
  CLC                                       ; $0CDBF1 |
  ADC #$0040                                ; $0CDBF2 |
  STA !s_spr_y_pixel_pos,x                  ; $0CDBF5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CDBF8 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CDBFB |
  LDA #$FE00                                ; $0CDBFE |
  STA !s_spr_x_speed_lo,x                   ; $0CDC01 |
  STZ !s_spr_anim_frame,x                   ; $0CDC04 |
  LDA #$0004                                ; $0CDC07 |
  STA !s_spr_timer_2,x                      ; $0CDC0A |
  SEP #$20                                  ; $0CDC0D |
  LDA #$05                                  ; $0CDC0F |
  STA !s_spr_draw_priority,x                ; $0CDC11 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDC14 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDC16 |
  REP #$20                                  ; $0CDC18 |

CODE_0CDC1A:
  RTL                                       ; $0CDC1A |

  LDX $12                                   ; $0CDC1B |
  JSR CODE_0CE4ED                           ; $0CDC1D |
  LDA #$0001                                ; $0CDC20 |
  STA !s_player_disable_flag                ; $0CDC23 |
  LDA !s_spr_cam_x_pos,x                    ; $0CDC26 |
  CMP #$00F4                                ; $0CDC29 |
  BMI CODE_0CDC43                           ; $0CDC2C |
  LDA !s_spr_timer_2,x                      ; $0CDC2E |
  BNE CODE_0CDC42                           ; $0CDC31 |
  LDA !s_spr_anim_frame,x                   ; $0CDC33 |
  EOR #$0001                                ; $0CDC36 |
  STA !s_spr_anim_frame,x                   ; $0CDC39 |
  LDA #$0004                                ; $0CDC3C |
  STA !s_spr_timer_2,x                      ; $0CDC3F |

CODE_0CDC42:
  RTL                                       ; $0CDC42 |

CODE_0CDC43:
  LDA #$0005                                ; $0CDC43 |
  STA !s_spr_anim_frame,x                   ; $0CDC46 |
  LDA #$0020                                ; $0CDC49 |
  STA !s_spr_x_accel,x                      ; $0CDC4C |
  LDA !s_spr_x_speed_lo,x                   ; $0CDC4F |
  BMI CODE_0CDC70                           ; $0CDC52 |
  STZ !s_spr_x_speed_lo,x                   ; $0CDC54 |
  STZ !s_spr_x_accel,x                      ; $0CDC57 |
  SEP #$20                                  ; $0CDC5A |
  LDA #$13                                  ; $0CDC5C |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CDC5E |
  LDA #$02                                  ; $0CDC60 |
  STA !s_spr_anim_frame,x                   ; $0CDC62 |
  LDA #$20                                  ; $0CDC65 |
  STA !s_spr_timer_2,x                      ; $0CDC67 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDC6A |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDC6C |
  REP #$20                                  ; $0CDC6E |

CODE_0CDC70:
  RTL                                       ; $0CDC70 |

  db $04, $04, $03, $02, $03, $04, $03, $02 ; $0CDC71 |
  db $03, $04, $03, $02, $03, $04, $03, $02 ; $0CDC79 |
  db $03, $04, $03, $02                     ; $0CDC81 |

  db $02, $06, $02, $06, $02, $06, $02, $06 ; $0CDC85 |
  db $02, $06, $02, $06, $02, $06, $02, $06 ; $0CDC8D |
  db $02, $06, $02, $06                     ; $0CDC95 |

  LDX $12                                   ; $0CDC99 |
  JSR CODE_0CE4ED                           ; $0CDC9B |
  LDA !s_spr_timer_2,x                      ; $0CDC9E |
  BNE CODE_0CDCCA                           ; $0CDCA1 |
  SEP #$20                                  ; $0CDCA3 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CDCA5 |
  DEY                                       ; $0CDCA7 |
  BMI CODE_0CDCCB                           ; $0CDCA8 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CDCAA |
  LDA $DC71,y                               ; $0CDCAC |
  STA !s_spr_anim_frame,x                   ; $0CDCAF |
  LDA $DC85,y                               ; $0CDCB2 |
  STA !s_spr_timer_2,x                      ; $0CDCB5 |
  REP #$20                                  ; $0CDCB8 |
  TYA                                       ; $0CDCBA |
  AND #$0007                                ; $0CDCBB |
  CMP #$0007                                ; $0CDCBE |
  BNE CODE_0CDCCA                           ; $0CDCC1 |
  LDA #$005B                                ; $0CDCC3 |\ play sound #$005B
  JSL push_sound_queue                      ; $0CDCC6 |/

CODE_0CDCCA:
  RTL                                       ; $0CDCCA |

CODE_0CDCCB:
  LDA #$04                                  ; $0CDCCB |
  STA !s_spr_anim_frame,x                   ; $0CDCCD |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDCD0 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDCD2 |
  REP #$20                                  ; $0CDCD4 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CDCD6 |
  AND #$00FF                                ; $0CDCD8 |
  ASL A                                     ; $0CDCDB |
  TAY                                       ; $0CDCDC |
  LDA $DA5E,y                               ; $0CDCDD |
  STA $704070                               ; $0CDCE0 |
  INC !r_msg_box_state                      ; $0CDCE4 |
  RTL                                       ; $0CDCE7 |

  LDX $12                                   ; $0CDCE8 |
  JSR CODE_0CE4ED                           ; $0CDCEA |
  LDA #$0001                                ; $0CDCED |
  STA !s_player_disable_flag                ; $0CDCF0 |
  LDA !r_msg_box_state                      ; $0CDCF3 |
  BNE CODE_0CDD24                           ; $0CDCF6 |
  LDA !r_reg_coldata_mirror                 ; $0CDCF8 |
  STA !s_cgram_mirror                       ; $0CDCFB |
  STA $702D6C                               ; $0CDCFF |
  STZ !r_reg_coldata_mirror                 ; $0CDD03 |
  LDA #$FE00                                ; $0CDD06 |
  STA !s_spr_x_speed_lo,x                   ; $0CDD09 |
  SEP #$20                                  ; $0CDD0C |
  LDA #$05                                  ; $0CDD0E |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CDD10 |
  TAY                                       ; $0CDD12 |
  LDA $DD25,y                               ; $0CDD13 |
  STA !s_spr_anim_frame,x                   ; $0CDD16 |
  LDA #$04                                  ; $0CDD19 |
  STA !s_spr_timer_2,x                      ; $0CDD1B |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDD1E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDD20 |
  REP #$20                                  ; $0CDD22 |

CODE_0CDD24:
  RTL                                       ; $0CDD24 |

  db $02, $05, $06, $06, $05, $02           ; $0CDD25 |

  db $00, $00, $02, $00, $00, $00           ; $0CDD2B |

  LDX $12                                   ; $0CDD31 |
  JSR CODE_0CE4ED                           ; $0CDD33 |
  LDA !s_spr_timer_2,x                      ; $0CDD36 |
  BNE CODE_0CDD6B                           ; $0CDD39 |
  SEP #$20                                  ; $0CDD3B |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CDD3D |
  BMI CODE_0CDD6C                           ; $0CDD3F |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CDD41 |
  LDA $DD25,y                               ; $0CDD43 |
  STA !s_spr_anim_frame,x                   ; $0CDD46 |
  LDA !s_spr_facing_dir,x                   ; $0CDD49 |
  EOR $DD2B,y                               ; $0CDD4C |
  STA !s_spr_facing_dir,x                   ; $0CDD4F |
  LDA #$04                                  ; $0CDD52 |
  STA !s_spr_timer_2,x                      ; $0CDD54 |
  REP #$20                                  ; $0CDD57 |
  LDA $DD2B,y                               ; $0CDD59 |
  AND #$00FF                                ; $0CDD5C |
  BEQ CODE_0CDD6B                           ; $0CDD5F |
  LDA !s_spr_x_speed_lo,x                   ; $0CDD61 |
  EOR #$FFFF                                ; $0CDD64 |
  INC A                                     ; $0CDD67 |
  STA !s_spr_x_speed_lo,x                   ; $0CDD68 |

CODE_0CDD6B:
  RTL                                       ; $0CDD6B |

CODE_0CDD6C:
  STZ !s_spr_anim_frame,x                   ; $0CDD6C |
  LDA #$9D04                                ; $0CDD6F |
  TYA                                       ; $0CDD72 |
  PLY                                       ; $0CDD73 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDD74 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDD76 |
  REP #$20                                  ; $0CDD78 |
  RTL                                       ; $0CDD7A |

  LDX $12                                   ; $0CDD7B |
  JSR CODE_0CE4ED                           ; $0CDD7D |
  LDA !s_spr_timer_2,x                      ; $0CDD80 |
  BNE CODE_0CDD94                           ; $0CDD83 |
  LDA !s_spr_anim_frame,x                   ; $0CDD85 |
  EOR #$0001                                ; $0CDD88 |
  STA !s_spr_anim_frame,x                   ; $0CDD8B |
  LDA #$0004                                ; $0CDD8E |
  STA !s_spr_timer_2,x                      ; $0CDD91 |

CODE_0CDD94:
  LDA !s_spr_cam_x_pos,x                    ; $0CDD94 |
  CMP #$0150                                ; $0CDD97 |
  BCC CODE_0CDDA4                           ; $0CDD9A |
  SEP #$20                                  ; $0CDD9C |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDD9E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDDA0 |
  REP #$20                                  ; $0CDDA2 |

CODE_0CDDA4:
  RTL                                       ; $0CDDA4 |

  LDX $12                                   ; $0CDDA5 |
  SEP #$20                                  ; $0CDDA7 |
  LDA #$05                                  ; $0CDDA9 |
  STA !s_spr_draw_priority,x                ; $0CDDAB |
  REP #$20                                  ; $0CDDAE |
  STZ !s_spr_facing_dir,x                   ; $0CDDB0 |
  LDA !r_bg1_cam_x                          ; $0CDDB3 |
  CLC                                       ; $0CDDB6 |
  ADC #$0130                                ; $0CDDB7 |
  STA !s_spr_x_pixel_pos,x                  ; $0CDDBA |
  LDA #$F800                                ; $0CDDBD |
  STA !s_spr_x_accel_ceiling,x              ; $0CDDC0 |
  STZ !s_spr_x_speed_lo,x                   ; $0CDDC3 |
  LDA #$0020                                ; $0CDDC6 |
  STA !s_spr_x_accel,x                      ; $0CDDC9 |
  LDA !r_bg1_cam_y                          ; $0CDDCC |
  CLC                                       ; $0CDDCF |
  ADC #$0040                                ; $0CDDD0 |
  STA !s_spr_y_pixel_pos,x                  ; $0CDDD3 |
  STZ !s_spr_y_accel,x                      ; $0CDDD6 |
  LDA #$F800                                ; $0CDDD9 |
  STA !s_spr_y_accel_ceiling,x              ; $0CDDDC |
  STZ !s_spr_anim_frame,x                   ; $0CDDDF |
  LDA #$0002                                ; $0CDDE2 |
  STA !s_spr_timer_2,x                      ; $0CDDE5 |
  LDA #$0020                                ; $0CDDE8 |
  STA $70449E                               ; $0CDDEB |
  LDA #$03B8                                ; $0CDDEF |
  STA $7044A0                               ; $0CDDF2 |
  LDA #$0000                                ; $0CDDF6 |
  STA $7044A2                               ; $0CDDF9 |
  LDA #$FF98                                ; $0CDDFD |
  STA $7044A4                               ; $0CDE00 |
  LDA #$0000                                ; $0CDE04 |
  STA $7044A6                               ; $0CDE07 |
  LDA #$0000                                ; $0CDE0B |
  STA $7044A8                               ; $0CDE0E |
  LDA #$0001                                ; $0CDE12 |
  STA $7044AA                               ; $0CDE15 |
  LDA #$0000                                ; $0CDE19 |
  STA $7044AC                               ; $0CDE1C |
  LDA #$1000                                ; $0CDE20 |
  STA $7044AE                               ; $0CDE23 |
  LDA #$0000                                ; $0CDE27 |
  STA $7044B0                               ; $0CDE2A |
  LDA #$0020                                ; $0CDE2E |
  STA $7044F2                               ; $0CDE31 |
  LDA #$0080                                ; $0CDE35 |
  STA $7044F4                               ; $0CDE38 |
  LDA #$0002                                ; $0CDE3C |
  STA $7044F6                               ; $0CDE3F |
  LDA #$4000                                ; $0CDE43 |
  STA $7044F8                               ; $0CDE46 |
  LDA #$0030                                ; $0CDE4A |
  STA $7044FA                               ; $0CDE4D |
  LDA #$0000                                ; $0CDE51 |
  STA $7044FC                               ; $0CDE54 |
  LDA #$0000                                ; $0CDE58 |
  STA $7044FE                               ; $0CDE5B |
  LDA #$0000                                ; $0CDE5F |
  STA $704500                               ; $0CDE62 |
  LDA #$0000                                ; $0CDE66 |
  STA $704502                               ; $0CDE69 |
  LDA #$0000                                ; $0CDE6D |
  STA $704504                               ; $0CDE70 |
  LDA #$0000                                ; $0CDE74 |
  STA $704506                               ; $0CDE77 |
  LDA #$0000                                ; $0CDE7B |
  STA !gsu_r1                               ; $0CDE7E |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CDE81 |
  AND #$00FF                                ; $0CDE83 |
  ASL A                                     ; $0CDE86 |
  TAY                                       ; $0CDE87 |
  LDA $DACA,y                               ; $0CDE88 |
  STA !gsu_r2                               ; $0CDE8B |
  LDA #$44B2                                ; $0CDE8E |
  STA !gsu_r3                               ; $0CDE91 |
  LDA #$0020                                ; $0CDE94 |
  STA !gsu_r5                               ; $0CDE97 |
  LDX #$08                                  ; $0CDE9A |
  LDA #$EDAC                                ; $0CDE9C |
  JSL r_gsu_init_1                          ; $0CDE9F | GSU init
  LDX $12                                   ; $0CDEA3 |
  LDA !r_header_bg2_tileset                 ; $0CDEA5 |
  CMP #$0016                                ; $0CDEA8 |
  BEQ CODE_0CDEC1                           ; $0CDEAB |
  LDA #$0100                                ; $0CDEAD |
  STA !s_bg3_cam_x                          ; $0CDEB0 |
  STA !r_bg3_cam_x                          ; $0CDEB3 |
  LDA #$0000                                ; $0CDEB6 |
  STA !s_bg3_cam_y                          ; $0CDEB9 |
  STA !r_bg3_cam_y                          ; $0CDEBC |
  BRA CODE_0CDED3                           ; $0CDEBF |

CODE_0CDEC1:
  LDA #$0100                                ; $0CDEC1 |
  STA !s_bg2_cam_x                          ; $0CDEC4 |
  STA !r_bg2_cam_x                          ; $0CDEC7 |
  LDA #$0200                                ; $0CDECA |
  STA !s_bg2_cam_y                          ; $0CDECD |
  STA !r_bg2_cam_y                          ; $0CDED0 |

CODE_0CDED3:
  SEP #$20                                  ; $0CDED3 |
  LDA !r_reg_tm_mirror                      ; $0CDED5 |
  ORA !r_reg_ts_mirror                      ; $0CDED8 |
  STA !r_reg_tm_mirror                      ; $0CDEDB |
  STA !r_reg_tmw_mirror                     ; $0CDEDE |
  STZ !r_reg_ts_mirror                      ; $0CDEE1 |
  STZ !r_reg_tsw_mirror                     ; $0CDEE4 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CDEE7 |
  LDA $DA76,y                               ; $0CDEE9 |
  TRB !r_reg_tm_mirror                      ; $0CDEEC |
  TRB !r_reg_tmw_mirror                     ; $0CDEEF |
  TSB !r_reg_ts_mirror                      ; $0CDEF2 |
  TSB !r_reg_tsw_mirror                     ; $0CDEF5 |
  LDA $DA82,y                               ; $0CDEF8 |
  STA !r_reg_cgadsub_mirror                 ; $0CDEFB |
  LDX #$04                                  ; $0CDEFE |

CODE_0CDF00:
  LDA $DB54,x                               ; $0CDF00 |
  STA $4310,x                               ; $0CDF03 |
  LDA $DB60,x                               ; $0CDF06 |
  STA $4320,x                               ; $0CDF09 |
  DEX                                       ; $0CDF0C |
  BPL CODE_0CDF00                           ; $0CDF0D |
  LDA #$7E                                  ; $0CDF0F |
  STA $4317                                 ; $0CDF11 |
  STA $4327                                 ; $0CDF14 |
  LDX #$06                                  ; $0CDF17 |

CODE_0CDF19:
  LDA $DB59,x                               ; $0CDF19 |
  STA $7E5C98,x                             ; $0CDF1C |
  LDA $DB65,x                               ; $0CDF20 |
  STA $7E5D18,x                             ; $0CDF23 |
  DEX                                       ; $0CDF27 |
  BPL CODE_0CDF19                           ; $0CDF28 |
  LDX #$58                                  ; $0CDF2A |
  LDA $DA8E,y                               ; $0CDF2C |

CODE_0CDF2F:
  STA $7E5A18,x                             ; $0CDF2F |
  DEX                                       ; $0CDF33 |
  BPL CODE_0CDF2F                           ; $0CDF34 |
  LDX $12                                   ; $0CDF36 |
  LDA #$05                                  ; $0CDF38 |
  STA !s_spr_draw_priority,x                ; $0CDF3A |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDF3D |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CDF3F |
  REP #$20                                  ; $0CDF41 |
  LDA #$0018                                ; $0CDF43 |\ play sound #$0018
  JSL push_sound_queue                      ; $0CDF46 |/
  RTL                                       ; $0CDF4A |

  LDX $12                                   ; $0CDF4B |
  LDA #$00F1                                ; $0CDF4D |
  STA !r_apu_io_0_mirror                    ; $0CDF50 |
  LDA #$0002                                ; $0CDF53 |
  STA !s_spr_facing_dir,x                   ; $0CDF56 |
  LDA !r_bg1_cam_x                          ; $0CDF59 |
  SEC                                       ; $0CDF5C |
  SBC #$0040                                ; $0CDF5D |
  STA !s_spr_x_pixel_pos,x                  ; $0CDF60 |
  LDA #$0800                                ; $0CDF63 |
  STA !s_spr_x_accel_ceiling,x              ; $0CDF66 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CDF69 |
  AND #$00FF                                ; $0CDF6B |
  ASL A                                     ; $0CDF6E |
  TAY                                       ; $0CDF6F |
  PHD                                       ; $0CDF70 |
  LDA #$0000                                ; $0CDF71 |
  TCD                                       ; $0CDF74 |
  REP #$10                                  ; $0CDF75 |
  LDA $DA9A,y                               ; $0CDF77 |
  LDX #$6800                                ; $0CDF7A |
  PHY                                       ; $0CDF7D |
  JSL decompress_lc_lz1_l_x                 ; $0CDF7E |
  PLY                                       ; $0CDF82 |
  LDX $DAB2,y                               ; $0CDF83 |
  TXY                                       ; $0CDF86 |
  LDX #$0070                                ; $0CDF87 |
  STX $01                                   ; $0CDF8A |
  LDX #$6800                                ; $0CDF8C |
  JSL $00BEA6                               ; $0CDF8F |
  SEP #$10                                  ; $0CDF93 |
  PLD                                       ; $0CDF95 |
  LDX $12                                   ; $0CDF96 |
  STZ !s_spr_x_speed_lo,x                   ; $0CDF98 |
  LDA #$0020                                ; $0CDF9B |
  STA !s_spr_x_accel,x                      ; $0CDF9E |
  LDA !r_bg1_cam_y                          ; $0CDFA1 |
  CLC                                       ; $0CDFA4 |
  ADC #$0040                                ; $0CDFA5 |
  STA !s_spr_y_pixel_pos,x                  ; $0CDFA8 |
  STZ !s_spr_y_accel,x                      ; $0CDFAB |
  LDA #$F800                                ; $0CDFAE |
  STA !s_spr_y_accel_ceiling,x              ; $0CDFB1 |
  STZ !s_spr_anim_frame,x                   ; $0CDFB4 |
  LDA #$0002                                ; $0CDFB7 |
  STA !s_spr_timer_2,x                      ; $0CDFBA |
  LDA #$0020                                ; $0CDFBD |
  STA $70449E                               ; $0CDFC0 |
  LDA #$03B8                                ; $0CDFC4 |
  STA $7044A0                               ; $0CDFC7 |
  LDA #$0000                                ; $0CDFCB |
  STA $7044A2                               ; $0CDFCE |
  LDA #$FF98                                ; $0CDFD2 |
  STA $7044A4                               ; $0CDFD5 |
  LDA #$0000                                ; $0CDFD9 |
  STA $7044A6                               ; $0CDFDC |
  LDA #$0000                                ; $0CDFE0 |
  STA $7044A8                               ; $0CDFE3 |
  LDA #$0001                                ; $0CDFE7 |
  STA $7044AA                               ; $0CDFEA |
  LDA #$0000                                ; $0CDFEE |
  STA $7044AC                               ; $0CDFF1 |
  LDA #$1000                                ; $0CDFF5 |
  STA $7044AE                               ; $0CDFF8 |
  LDA #$0000                                ; $0CDFFC |
  STA $7044B0                               ; $0CDFFF |
  LDA #$0020                                ; $0CE003 |
  STA $7044F2                               ; $0CE006 |
  LDA #$0080                                ; $0CE00A |
  STA $7044F4                               ; $0CE00D |
  LDA #$0002                                ; $0CE011 |
  STA $7044F6                               ; $0CE014 |
  LDA #$4000                                ; $0CE018 |
  STA $7044F8                               ; $0CE01B |
  LDA #$0030                                ; $0CE01F |
  STA $7044FA                               ; $0CE022 |
  LDA #$0000                                ; $0CE026 |
  STA $7044FC                               ; $0CE029 |
  LDA #$0000                                ; $0CE02D |
  STA $7044FE                               ; $0CE030 |
  LDA #$0000                                ; $0CE034 |
  STA $704500                               ; $0CE037 |
  LDA #$0000                                ; $0CE03B |
  STA $704502                               ; $0CE03E |
  LDA #$0000                                ; $0CE042 |
  STA $704504                               ; $0CE045 |
  LDA #$0000                                ; $0CE049 |
  STA $704506                               ; $0CE04C |
  LDA #$0000                                ; $0CE050 |
  STA !gsu_r1                               ; $0CE053 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CE056 |
  AND #$00FF                                ; $0CE058 |
  ASL A                                     ; $0CE05B |
  TAY                                       ; $0CE05C |
  LDA $DAE2,y                               ; $0CE05D |
  STA !gsu_r2                               ; $0CE060 |
  LDA #$44B2                                ; $0CE063 |
  STA !gsu_r3                               ; $0CE066 |
  LDA #$0020                                ; $0CE069 |
  STA !gsu_r5                               ; $0CE06C |
  LDX #$08                                  ; $0CE06F |
  LDA #$EDAC                                ; $0CE071 |
  JSL r_gsu_init_1                          ; $0CE074 | GSU init
  LDX $12                                   ; $0CE078 |
  LDA !r_header_bg2_tileset                 ; $0CE07A |
  CMP #$0016                                ; $0CE07D |
  BEQ CODE_0CE096                           ; $0CE080 |
  LDA #$0100                                ; $0CE082 |
  STA !s_bg3_cam_x                          ; $0CE085 |
  STA !r_bg3_cam_x                          ; $0CE088 |
  LDA #$0000                                ; $0CE08B |
  STA !s_bg3_cam_y                          ; $0CE08E |
  STA !r_bg3_cam_y                          ; $0CE091 |
  BRA CODE_0CE0A8                           ; $0CE094 |

CODE_0CE096:
  LDA #$0100                                ; $0CE096 |
  STA !s_bg2_cam_x                          ; $0CE099 |
  STA !r_bg2_cam_x                          ; $0CE09C |
  LDA #$0200                                ; $0CE09F |
  STA !s_bg2_cam_y                          ; $0CE0A2 |
  STA !r_bg2_cam_y                          ; $0CE0A5 |

CODE_0CE0A8:
  SEP #$20                                  ; $0CE0A8 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CE0AA |
  LDA $DA76,y                               ; $0CE0AC |
  TRB !r_reg_tm_mirror                      ; $0CE0AF |
  TRB !r_reg_tmw_mirror                     ; $0CE0B2 |
  TSB !r_reg_ts_mirror                      ; $0CE0B5 |
  TSB !r_reg_tsw_mirror                     ; $0CE0B8 |
  LDA $DA82,y                               ; $0CE0BB |
  STA !r_reg_cgadsub_mirror                 ; $0CE0BE |
  LDX #$04                                  ; $0CE0C1 |

CODE_0CE0C3:
  LDA $DB54,x                               ; $0CE0C3 |
  STA $4310,x                               ; $0CE0C6 |
  LDA $DB60,x                               ; $0CE0C9 |
  STA $4320,x                               ; $0CE0CC |
  DEX                                       ; $0CE0CF |
  BPL CODE_0CE0C3                           ; $0CE0D0 |
  LDA #$7E                                  ; $0CE0D2 |
  STA $4317                                 ; $0CE0D4 |
  STA $4327                                 ; $0CE0D7 |
  LDX #$06                                  ; $0CE0DA |

CODE_0CE0DC:
  LDA $DB59,x                               ; $0CE0DC |
  STA $7E5C98,x                             ; $0CE0DF |
  LDA $DB65,x                               ; $0CE0E3 |
  STA $7E5D18,x                             ; $0CE0E6 |
  DEX                                       ; $0CE0EA |
  BPL CODE_0CE0DC                           ; $0CE0EB |
  LDX #$58                                  ; $0CE0ED |
  LDA $DA8E,y                               ; $0CE0EF |

CODE_0CE0F2:
  STA $7E5A18,x                             ; $0CE0F2 |
  DEX                                       ; $0CE0F6 |
  BPL CODE_0CE0F2                           ; $0CE0F7 |
  LDX $12                                   ; $0CE0F9 |
  LDA #$05                                  ; $0CE0FB |
  STA !s_spr_draw_priority,x                ; $0CE0FD |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE100 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE102 |
  REP #$20                                  ; $0CE104 |
  LDA #$0018                                ; $0CE106 |\ play sound #$0018
  JSL push_sound_queue                      ; $0CE109 |/
  RTL                                       ; $0CE10D |

  LDX $12                                   ; $0CE10E |
  LDA !s_spr_cam_y_pos,x                    ; $0CE110 |
  SEC                                       ; $0CE113 |
  SBC #$0009                                ; $0CE114 |
  CMP #$0100                                ; $0CE117 |
  BCS CODE_0CE128                           ; $0CE11A |
  AND #$00FF                                ; $0CE11C |
  CLC                                       ; $0CE11F |
  ADC #$0010                                ; $0CE120 |
  XBA                                       ; $0CE123 |
  STA $7044F2                               ; $0CE124 |

CODE_0CE128:
  LDX $12                                   ; $0CE128 |
  LDA !s_spr_x_speed_lo,x                   ; $0CE12A |
  EOR #$FFFF                                ; $0CE12D |
  INC A                                     ; $0CE130 |
  AND #$FC00                                ; $0CE131 |
  XBA                                       ; $0CE134 |
  ASL A                                     ; $0CE135 |
  ASL A                                     ; $0CE136 |
  STA !s_spr_y_accel,x                      ; $0CE137 |
  LDA !s_spr_timer_2,x                      ; $0CE13A |
  BNE CODE_0CE14E                           ; $0CE13D |
  LDA !s_spr_anim_frame,x                   ; $0CE13F |
  EOR #$0001                                ; $0CE142 |
  STA !s_spr_anim_frame,x                   ; $0CE145 |
  LDA #$0002                                ; $0CE148 |
  STA !s_spr_timer_2,x                      ; $0CE14B |

CODE_0CE14E:
  LDA !s_spr_cam_x_pos,x                    ; $0CE14E |
  CMP #$0100                                ; $0CE151 |
  BCS CODE_0CE190                           ; $0CE154 |
  STA !gsu_r1                               ; $0CE156 |
  SEC                                       ; $0CE159 |
  SBC !s_spr_x_delta_lo,x                   ; $0CE15A |
  STA !gsu_r7                               ; $0CE15D |
  LDA !s_spr_cam_y_pos,x                    ; $0CE160 |
  CMP #$0100                                ; $0CE163 |
  BCS CODE_0CE190                           ; $0CE166 |
  STA !gsu_r2                               ; $0CE168 |
  SEC                                       ; $0CE16B |
  SBC !s_spr_y_delta_lo,x                   ; $0CE16C |
  CMP #$0100                                ; $0CE16F |
  BCS CODE_0CE190                           ; $0CE172 |
  STA !gsu_r8                               ; $0CE174 |
  LDX #$08                                  ; $0CE177 |
  LDA #$ECEF                                ; $0CE179 |
  JSL r_gsu_init_1                          ; $0CE17C | GSU init
  NOP                                       ; $0CE180 |
  NOP                                       ; $0CE181 |
  JSL $00BE39                               ; $0CE182 |

; DMA args
  dl $7E56D0, $703A02                       ; $0CE186 |
  dw $0348                                  ; $0CE18C |

  LDX $12                                   ; $0CE18E |

CODE_0CE190:
  LDA !s_spr_cam_x_pos,x                    ; $0CE190 |
  CMP #$0100                                ; $0CE193 |
  BPL CODE_0CE1D9                           ; $0CE196 |
  LDX #$08                                  ; $0CE198 |
  LDA #$EF0B                                ; $0CE19A |
  JSL r_gsu_init_1                          ; $0CE19D | GSU init
  NOP                                       ; $0CE1A1 |
  NOP                                       ; $0CE1A2 |
  JSL $00BE39                               ; $0CE1A3 |

; DMA args
  dl $7E5040, $703372                       ; $0CE1A7 |
  dw $01A4                                  ; $0CE1AD |

  JSL $00BE39                               ; $0CE1AF |

; DMA args
  dl $7E5388, $7036BA                       ; $0CE1B3 |
  dw $01A4                                  ; $0CE1B9 |

  SEP #$20                                  ; $0CE1BB |
  LDA !r_header_bg2_tileset                 ; $0CE1BD |
  CMP #$16                                  ; $0CE1C0 |
  BEQ CODE_0CE1CB                           ; $0CE1C2 |
  LDA #$02                                  ; $0CE1C4 |
  STA !r_reg_w34sel_mirror                  ; $0CE1C6 |
  BRA CODE_0CE1D0                           ; $0CE1C9 |

CODE_0CE1CB:
  LDA #$20                                  ; $0CE1CB |
  STA !r_reg_w12sel_mirror                  ; $0CE1CD |

CODE_0CE1D0:
  LDA #$36                                  ; $0CE1D0 |
  TSB !r_reg_hdmaen_mirror                  ; $0CE1D2 |
  REP #$20                                  ; $0CE1D5 |
  LDX $12                                   ; $0CE1D7 |

CODE_0CE1D9:
  JSR CODE_0CE313                           ; $0CE1D9 |
  LDA !s_spr_timer_1,x                      ; $0CE1DC |
  BNE CODE_0CE213                           ; $0CE1DF |
  LDA #$0004                                ; $0CE1E1 |
  STA !s_spr_timer_1,x                      ; $0CE1E4 |
  LDA #$0220                                ; $0CE1E7 |
  JSL spawn_ambient_sprite                  ; $0CE1EA |
  LDA #$0007                                ; $0CE1EE |
  STA $73C2,y                               ; $0CE1F1 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE1F4 |
  STA $70A2,y                               ; $0CE1F7 |
  LDA $10                                   ; $0CE1FA |
  AND #$001F                                ; $0CE1FC |
  CLC                                       ; $0CE1FF |
  ADC !s_spr_y_pixel_pos,x                  ; $0CE200 |
  STA $7142,y                               ; $0CE203 |
  LDA #$0004                                ; $0CE206 |
  STA $7782,y                               ; $0CE209 |
  LDA #$0018                                ; $0CE20C |\ play sound #$0018
  JSL push_sound_queue                      ; $0CE20F |/

CODE_0CE213:
  RTL                                       ; $0CE213 |

  LDX $12                                   ; $0CE214 |
  LDA !s_spr_cam_y_pos,x                    ; $0CE216 |
  SEC                                       ; $0CE219 |
  SBC #$0009                                ; $0CE21A |
  CMP #$0100                                ; $0CE21D |
  BCS CODE_0CE22E                           ; $0CE220 |
  AND #$00FF                                ; $0CE222 |
  CLC                                       ; $0CE225 |
  ADC #$0010                                ; $0CE226 |
  XBA                                       ; $0CE229 |
  STA $7044F2                               ; $0CE22A |

CODE_0CE22E:
  LDX $12                                   ; $0CE22E |
  LDA !s_spr_x_speed_lo,x                   ; $0CE230 |
  AND #$FC00                                ; $0CE233 |
  XBA                                       ; $0CE236 |
  ASL A                                     ; $0CE237 |
  ASL A                                     ; $0CE238 |
  STA !s_spr_y_accel,x                      ; $0CE239 |
  LDA !s_spr_timer_2,x                      ; $0CE23C |
  BNE CODE_0CE250                           ; $0CE23F |
  LDA !s_spr_anim_frame,x                   ; $0CE241 |
  EOR #$0001                                ; $0CE244 |
  STA !s_spr_anim_frame,x                   ; $0CE247 |
  LDA #$0002                                ; $0CE24A |
  STA !s_spr_timer_2,x                      ; $0CE24D |

CODE_0CE250:
  LDA !s_spr_cam_x_pos,x                    ; $0CE250 |
  CMP #$0100                                ; $0CE253 |
  BCS CODE_0CE292                           ; $0CE256 |
  STA !gsu_r1                               ; $0CE258 |
  SEC                                       ; $0CE25B |
  SBC !s_spr_x_delta_lo,x                   ; $0CE25C |
  STA !gsu_r7                               ; $0CE25F |
  LDA !s_spr_cam_y_pos,x                    ; $0CE262 |
  CMP #$0100                                ; $0CE265 |
  BCS CODE_0CE292                           ; $0CE268 |
  STA !gsu_r2                               ; $0CE26A |
  SEC                                       ; $0CE26D |
  SBC !s_spr_y_delta_lo,x                   ; $0CE26E |
  CMP #$0100                                ; $0CE271 |
  BCS CODE_0CE292                           ; $0CE274 |
  STA !gsu_r8                               ; $0CE276 |
  LDX #$08                                  ; $0CE279 |
  LDA #$EE49                                ; $0CE27B |
  JSL r_gsu_init_1                          ; $0CE27E | GSU init
  NOP                                       ; $0CE282 |
  NOP                                       ; $0CE283 |
  JSL $00BE39                               ; $0CE284 |

; DMA args
  dl $7E56D0, $703A02                       ; $0CE288 |
  dw $0348                                  ; $0CE28E |

  LDX $12                                   ; $0CE290 |

CODE_0CE292:
  LDA !s_spr_cam_x_pos,x                    ; $0CE292 |
  BMI CODE_0CE2D8                           ; $0CE295 |
  LDX #$08                                  ; $0CE297 |
  LDA #$EF0B                                ; $0CE299 |
  JSL r_gsu_init_1                          ; $0CE29C | GSU init
  NOP                                       ; $0CE2A0 |
  NOP                                       ; $0CE2A1 |
  JSL $00BE39                               ; $0CE2A2 |

; DMA args
  dl $7E5040, $703372                       ; $0CE2A6 |
  dw $01A4                                  ; $0CE2AC |

  JSL $00BE39                               ; $0CE2AE |

; DMA args
  dl $7E5388, $7036BA                       ; $0CE2B2 |
  dw $01A4                                  ; $0CE2B8 |

  SEP #$20                                  ; $0CE2BA |
  LDA !r_header_bg2_tileset                 ; $0CE2BC |
  CMP #$16                                  ; $0CE2BF |
  BEQ CODE_0CE2CA                           ; $0CE2C1 |
  LDA #$02                                  ; $0CE2C3 |
  STA !r_reg_w34sel_mirror                  ; $0CE2C5 |
  BRA CODE_0CE2CF                           ; $0CE2C8 |

CODE_0CE2CA:
  LDA #$20                                  ; $0CE2CA |
  STA !r_reg_w12sel_mirror                  ; $0CE2CC |

CODE_0CE2CF:
  LDA #$36                                  ; $0CE2CF |
  TSB !r_reg_hdmaen_mirror                  ; $0CE2D1 |
  REP #$20                                  ; $0CE2D4 |
  LDX $12                                   ; $0CE2D6 |

CODE_0CE2D8:
  JSR CODE_0CE313                           ; $0CE2D8 |
  LDA !s_spr_timer_1,x                      ; $0CE2DB |
  BNE CODE_0CE312                           ; $0CE2DE |
  LDA #$0004                                ; $0CE2E0 |
  STA !s_spr_timer_1,x                      ; $0CE2E3 |
  LDA #$0220                                ; $0CE2E6 |
  JSL spawn_ambient_sprite                  ; $0CE2E9 |
  LDA #$0007                                ; $0CE2ED |
  STA $73C2,y                               ; $0CE2F0 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE2F3 |
  STA $70A2,y                               ; $0CE2F6 |
  LDA $10                                   ; $0CE2F9 |
  AND #$001F                                ; $0CE2FB |
  CLC                                       ; $0CE2FE |
  ADC !s_spr_y_pixel_pos,x                  ; $0CE2FF |
  STA $7142,y                               ; $0CE302 |
  LDA #$0004                                ; $0CE305 |
  STA $7782,y                               ; $0CE308 |
  LDA #$0018                                ; $0CE30B |\ play sound #$0018
  JSL push_sound_queue                      ; $0CE30E |/

CODE_0CE312:
  RTL                                       ; $0CE312 |

CODE_0CE313:
  LDA !s_spr_cam_x_pos,x                    ; $0CE313 |
  CLC                                       ; $0CE316 |
  ADC #$0060                                ; $0CE317 |
  CMP #$01B0                                ; $0CE31A |
  BCS CODE_0CE32C                           ; $0CE31D |
  LDA !s_spr_cam_y_pos,x                    ; $0CE31F |
  CLC                                       ; $0CE322 |
  ADC #$0060                                ; $0CE323 |
  CMP #$01B0                                ; $0CE326 |
  BCS CODE_0CE32C                           ; $0CE329 |
  RTS                                       ; $0CE32B |

CODE_0CE32C:
  STZ !s_spr_x_speed_lo,x                   ; $0CE32C |
  STZ !s_spr_x_accel,x                      ; $0CE32F |
  STZ !s_spr_y_speed_lo,x                   ; $0CE332 |
  STZ !s_spr_y_accel,x                      ; $0CE335 |
  LDA #$0020                                ; $0CE338 |
  STA !s_spr_timer_1,x                      ; $0CE33B |
  SEP #$20                                  ; $0CE33E |
  LDA #$FF                                  ; $0CE340 |
  STA !s_spr_draw_priority,x                ; $0CE342 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE345 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE347 |
  REP #$20                                  ; $0CE349 |
  PLA                                       ; $0CE34B |
  RTL                                       ; $0CE34C |

  LDX $12                                   ; $0CE34D |
  LDA !s_spr_timer_1,x                      ; $0CE34F |
  BNE CODE_0CE363                           ; $0CE352 |
  LDA #$0002                                ; $0CE354 |
  STA $1015                                 ; $0CE357 |
  SEP #$20                                  ; $0CE35A |
  LDA #$01                                  ; $0CE35C |
  STA !s_spr_gsu_morph_2_hi,x               ; $0CE35E |
  REP #$20                                  ; $0CE361 |

CODE_0CE363:
  LDA $7044F2                               ; $0CE363 |
  CMP #$9800                                ; $0CE367 |
  BCC CODE_0CE375                           ; $0CE36A |
  SEP #$20                                  ; $0CE36C |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE36E |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE370 |
  REP #$20                                  ; $0CE372 |
  RTL                                       ; $0CE374 |

CODE_0CE375:
  LDX $12                                   ; $0CE375 |
  LDA !s_spr_cam_y_pos,x                    ; $0CE377 |
  SEC                                       ; $0CE37A |
  SBC #$0009                                ; $0CE37B |
  CMP #$0100                                ; $0CE37E |
  BCS CODE_0CE38F                           ; $0CE381 |
  AND #$00FF                                ; $0CE383 |
  CLC                                       ; $0CE386 |
  ADC #$0010                                ; $0CE387 |
  XBA                                       ; $0CE38A |
  STA $7044F2                               ; $0CE38B |

CODE_0CE38F:
  LDA !s_spr_cam_x_pos,x                    ; $0CE38F |
  STA !gsu_r1                               ; $0CE392 |
  SEC                                       ; $0CE395 |
  SBC !s_spr_x_delta_lo,x                   ; $0CE396 |
  STA !gsu_r7                               ; $0CE399 |
  LDA !s_spr_cam_y_pos,x                    ; $0CE39C |
  STA !gsu_r2                               ; $0CE39F |
  SEC                                       ; $0CE3A2 |
  SBC !s_spr_y_delta_lo,x                   ; $0CE3A3 |
  STA !gsu_r8                               ; $0CE3A6 |
  LDX #$08                                  ; $0CE3A9 |
  LDA #$ECEF                                ; $0CE3AB |
  JSL r_gsu_init_1                          ; $0CE3AE | GSU init
  NOP                                       ; $0CE3B2 |
  NOP                                       ; $0CE3B3 |
  JSL $00BE39                               ; $0CE3B4 |

; DMA args
  dl $7E56D0, $703A02                       ; $0CE3B8 |
  dw $0348                                  ; $0CE3BE |

  LDX $12                                   ; $0CE3C0 |
  LDX #$08                                  ; $0CE3C2 |
  LDA #$EF0B                                ; $0CE3C4 |
  JSL r_gsu_init_1                          ; $0CE3C7 | GSU init
  NOP                                       ; $0CE3CB |
  NOP                                       ; $0CE3CC |
  JSL $00BE39                               ; $0CE3CD |

; DMA args
  dl $7E5040, $703372                       ; $0CE3D1 |
  dw $01A4                                  ; $0CE3D7 |

  JSL $00BE39                               ; $0CE3D9 |

; DMA args
  dl $7E5388, $7036BA                       ; $0CE3DD |
  dw $01A4                                  ; $0CE3E3 |

  SEP #$20                                  ; $0CE3E5 |
  LDA !r_header_bg2_tileset                 ; $0CE3E7 |
  CMP #$16                                  ; $0CE3EA |
  BEQ CODE_0CE3F5                           ; $0CE3EC |
  LDA #$02                                  ; $0CE3EE |
  STA !r_reg_w34sel_mirror                  ; $0CE3F0 |
  BRA CODE_0CE3FA                           ; $0CE3F3 |

CODE_0CE3F5:
  LDA #$20                                  ; $0CE3F5 |
  STA !r_reg_w12sel_mirror                  ; $0CE3F7 |

CODE_0CE3FA:
  LDA #$36                                  ; $0CE3FA |
  TSB !r_reg_hdmaen_mirror                  ; $0CE3FC |
  REP #$20                                  ; $0CE3FF |
  LDX $12                                   ; $0CE401 |
  RTL                                       ; $0CE403 |

  LDX $12                                   ; $0CE404 |
  LDA $7044F2                               ; $0CE406 |
  CMP #$9800                                ; $0CE40A |
  BCC CODE_0CE418                           ; $0CE40D |
  SEP #$20                                  ; $0CE40F |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE411 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE413 |
  REP #$20                                  ; $0CE415 |
  RTL                                       ; $0CE417 |

CODE_0CE418:
  LDX $12                                   ; $0CE418 |
  LDA !s_spr_cam_y_pos,x                    ; $0CE41A |
  SEC                                       ; $0CE41D |
  SBC #$0009                                ; $0CE41E |
  CMP #$0100                                ; $0CE421 |
  BCS CODE_0CE432                           ; $0CE424 |
  AND #$00FF                                ; $0CE426 |
  CLC                                       ; $0CE429 |
  ADC #$0010                                ; $0CE42A |
  XBA                                       ; $0CE42D |
  STA $7044F2                               ; $0CE42E |

CODE_0CE432:
  LDA !s_spr_cam_x_pos,x                    ; $0CE432 |
  STA !gsu_r1                               ; $0CE435 |
  SEC                                       ; $0CE438 |
  SBC !s_spr_x_delta_lo,x                   ; $0CE439 |
  STA !gsu_r7                               ; $0CE43C |
  LDA !s_spr_cam_y_pos,x                    ; $0CE43F |
  STA !gsu_r2                               ; $0CE442 |
  SEC                                       ; $0CE445 |
  SBC !s_spr_y_delta_lo,x                   ; $0CE446 |
  STA !gsu_r8                               ; $0CE449 |
  LDX #$08                                  ; $0CE44C |
  LDA #$EE49                                ; $0CE44E |
  JSL r_gsu_init_1                          ; $0CE451 | GSU init
  NOP                                       ; $0CE455 |
  NOP                                       ; $0CE456 |
  JSL $00BE39                               ; $0CE457 |

; DMA args
  dl $7E56D0, $703A02                       ; $0CE45B |
  dw $0348                                  ; $0CE461 |

  LDX $12                                   ; $0CE463 |
  LDX #$08                                  ; $0CE465 |
  LDA #$EF0B                                ; $0CE467 |
  JSL r_gsu_init_1                          ; $0CE46A | GSU init
  NOP                                       ; $0CE46E |
  NOP                                       ; $0CE46F |
  JSL $00BE39                               ; $0CE470 |

; DMA args
  dl $7E5040, $703372                       ; $0CE474 |
  dw $01A4                                  ; $0CE47A |

  JSL $00BE39                               ; $0CE47C |

; DMA args
  dl $7E5388, $7036BA                       ; $0CE480 |
  dw $01A4                                  ; $0CE486 |

  SEP #$20                                  ; $0CE488 |
  LDA !r_header_bg2_tileset                 ; $0CE48A |
  CMP #$16                                  ; $0CE48D |
  BEQ CODE_0CE498                           ; $0CE48F |
  LDA #$02                                  ; $0CE491 |
  STA !r_reg_w34sel_mirror                  ; $0CE493 |
  BRA CODE_0CE49D                           ; $0CE496 |

CODE_0CE498:
  LDA #$20                                  ; $0CE498 |
  STA !r_reg_w12sel_mirror                  ; $0CE49A |

CODE_0CE49D:
  LDA #$36                                  ; $0CE49D |
  TSB !r_reg_hdmaen_mirror                  ; $0CE49F |
  REP #$20                                  ; $0CE4A2 |
  LDX $12                                   ; $0CE4A4 |
  RTL                                       ; $0CE4A6 |

  LDX $12                                   ; $0CE4A7 |
  LDA #$FFFF                                ; $0CE4A9 |
  STA $1015                                 ; $0CE4AC |
  STZ !s_player_disable_flag                ; $0CE4AF |
  SEP #$20                                  ; $0CE4B2 |
  LDA #$36                                  ; $0CE4B4 |
  TRB !r_reg_hdmaen_mirror                  ; $0CE4B6 |
  LDA #$20                                  ; $0CE4B9 |
  STA !r_reg_cgadsub_mirror                 ; $0CE4BB |
  STZ !r_reg_tmw_mirror                     ; $0CE4BE |
  STZ !r_reg_tsw_mirror                     ; $0CE4C1 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE4C4 |
  INC !s_spr_wildcard_3_lo_dp,x             ; $0CE4C6 |
  REP #$20                                  ; $0CE4C8 |
  RTL                                       ; $0CE4CA |

  LDX $12                                   ; $0CE4CB |
  LDA $1015                                 ; $0CE4CD |
  BEQ CODE_0CE4D3                           ; $0CE4D0 |
  RTL                                       ; $0CE4D2 |

CODE_0CE4D3:
  JSR CODE_0CE5B1                           ; $0CE4D3 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CE4D6 |
  CPY #$0B                                  ; $0CE4D8 |
  BEQ CODE_0CE4E5                           ; $0CE4DA |
  LDA $DAFA,y                               ; $0CE4DC |
  AND #$00FF                                ; $0CE4DF |
  STA !r_apu_io_0_mirror                    ; $0CE4E2 |

CODE_0CE4E5:
  JML $03A32E                               ; $0CE4E5 |
  JSR CODE_0CE4ED                           ; $0CE4E9 |
  RTL                                       ; $0CE4EC |

CODE_0CE4ED:
  REP #$10                                  ; $0CE4ED |
  TXY                                       ; $0CE4EF |
  LDX !s_spr_wildcard_6_lo_dp,y             ; $0CE4F0 |
  LDA $00E9D4,x                             ; $0CE4F2 |
  CMP #$8000                                ; $0CE4F6 |
  ROR A                                     ; $0CE4F9 |
  CMP #$8000                                ; $0CE4FA |
  ROR A                                     ; $0CE4FD |
  CMP #$8000                                ; $0CE4FE |
  ROR A                                     ; $0CE501 |
  CMP #$8000                                ; $0CE502 |
  ROR A                                     ; $0CE505 |
  CMP #$8000                                ; $0CE506 |
  ROR A                                     ; $0CE509 |
  CMP #$8000                                ; $0CE50A |
  ROR A                                     ; $0CE50D |
  CLC                                       ; $0CE50E |
  ADC !s_spr_gsu_morph_1_lo,y               ; $0CE50F |
  STA !s_spr_y_pixel_pos,y                  ; $0CE512 |
  LDA !s_spr_wildcard_6_lo,y                ; $0CE515 |
  CLC                                       ; $0CE518 |
  ADC #$0008                                ; $0CE519 |
  AND #$01FE                                ; $0CE51C |
  STA !s_spr_wildcard_6_lo,y                ; $0CE51F |
  TYX                                       ; $0CE522 |
  SEP #$10                                  ; $0CE523 |
  RTS                                       ; $0CE525 |

CODE_0CE526:
  LDY !s_spr_gsu_morph_2_hi,x               ; $0CE526 |
  BEQ CODE_0CE568                           ; $0CE529 |
  LDA $14                                   ; $0CE52B |
  AND #$0003                                ; $0CE52D |
  BNE CODE_0CE568                           ; $0CE530 |
  SEP #$20                                  ; $0CE532 |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0CE534 |
  PHA                                       ; $0CE537 |
  CLC                                       ; $0CE538 |
  ADC #$1C                                  ; $0CE539 |
  AND #$1E                                  ; $0CE53B |
  TAY                                       ; $0CE53D |
  PLA                                       ; $0CE53E |
  INC A                                     ; $0CE53F |
  INC A                                     ; $0CE540 |
  AND #$1E                                  ; $0CE541 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CE543 |
  REP #$20                                  ; $0CE546 |
  PHB                                       ; $0CE548 |
  LDX #$70                                  ; $0CE549 |
  PHX                                       ; $0CE54B |
  PLB                                       ; $0CE54C |
  TYX                                       ; $0CE54D |
  LDY #$1C                                  ; $0CE54E |

CODE_0CE550:
  LDA $5FE9A8,x                             ; $0CE550 |
  STA $21C2,y                               ; $0CE554 |
  STA $2F2E,y                               ; $0CE557 |
  TXA                                       ; $0CE55A |
  DEC A                                     ; $0CE55B |
  DEC A                                     ; $0CE55C |
  AND #$001E                                ; $0CE55D |
  TAX                                       ; $0CE560 |
  DEY                                       ; $0CE561 |
  DEY                                       ; $0CE562 |
  BPL CODE_0CE550                           ; $0CE563 |
  PLB                                       ; $0CE565 |
  LDX $12                                   ; $0CE566 |

CODE_0CE568:
  RTS                                       ; $0CE568 |

; boss palette pointers (after transformation)
  dl $5FA5CA				                            ; $0CE569 | 1-4 Burt the Bashful
  dl $702122				                            ; $0CE56C | 1-8 Salvo the Slime
  dl $702122				                            ; $0CE56F | 2-4 Bigger Boo
  dl $702122				                            ; $0CE572 | 2-8 Roger the Potted Ghost
  dl $7021A2				                            ; $0CE575 | 3-4 Prince Froggy
  dl $702122				                            ; $0CE578 | 3-8 Naval Piranha
  dl $5FA606 				                            ; $0CE57B | 4-4 Marching Milde
  dl $702122				                            ; $0CE57E | 4-8 Hookbill the Koopa
  dl $702182				                            ; $0CE581 | 5-4 Sluggy the Unshaven
  dl $5FA58E				                            ; $0CE584 | 5-8 Raphael the Raven
  dl $5FA642				                            ; $0CE587 | 6-4 Tap-Tap the Red Nose
  dl $7021C2				                            ; $0CE58A | 6-8 King Bowser

; boss palette pointers (before transformation)
  dl $702102				                            ; $0CE58D | 1-4 Burt the Bashful
  dl $702122				                            ; $0CE590 | 1-8 Salvo the Slime
  dl $702182				                            ; $0CE593 | 2-4 Bigger Boo
  dl $702122				                            ; $0CE596 | 2-8 Roger the Potted Ghost
  dl $702122				                            ; $0CE599 | 3-4 Prince Froggy
  dl $702122				                            ; $0CE59C | 3-8 Naval Piranha
  dl $7021A2				                            ; $0CE59F | 4-4 Marching Milde
  dl $702122				                            ; $0CE5A2 | 4-8 Hookbill the Koopa
  dl $702182				                            ; $0CE5A5 | 5-4 Sluggy the Unshaven
  dl $702142				                            ; $0CE5A8 | 5-8 Raphael the Raven
  dl $702142				                            ; $0CE5AB | 6-4 Tap-Tap the Red Nose
  dl $702102				                            ; $0CE5AE | 6-8 King Bowser

CODE_0CE5B1:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CE5B1 |
  ASL A                                     ; $0CE5B3 |
  CLC                                       ; $0CE5B4 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0CE5B5 |
  TAY                                       ; $0CE5B7 |

CODE_0CE5B8:
  PHX                                       ; $0CE5B8 |
  LDA $E569,y                               ; $0CE5B9 |
  STA $00                                   ; $0CE5BC |
  LDX $E56B,y                               ; $0CE5BE |
  STX $02                                   ; $0CE5C1 |
  LDX #$1C                                  ; $0CE5C3 |

CODE_0CE5C5:
  TXY                                       ; $0CE5C5 |
  LDA [$00],y                               ; $0CE5C6 |
  STA $7021C2,x                             ; $0CE5C8 |
  STA $702F2E,x                             ; $0CE5CC |
  DEX                                       ; $0CE5D0 |
  DEX                                       ; $0CE5D1 |
  BPL CODE_0CE5C5                           ; $0CE5D2 |
  PLX                                       ; $0CE5D4 |
  RTS                                       ; $0CE5D5 |

  PHB                                       ; $0CE5D6 |
  PHK                                       ; $0CE5D7 |
  PLB                                       ; $0CE5D8 |
  JSR CODE_0CE5B8                           ; $0CE5D9 |
  PLB                                       ; $0CE5DC |
  RTL                                       ; $0CE5DD |

  LDY #$FF                                  ; $0CE5DE |
  RTS                                       ; $0CE5E0 |

  db $00, $02, $00, $03, $00, $02, $01, $04 ; $0CE5E1 |

init_roger_shy_guy:
  LDA !s_spr_x_pixel_pos,x                  ; $0CE5E9 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CE5EC |
  LDA $E5DE                                 ; $0CE5EF |
  STA !s_spr_x_speed_lo,x                   ; $0CE5F2 |
  SEP #$20                                  ; $0CE5F5 |
  LDA #$06                                  ; $0CE5F7 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE5F9 |
  TAY                                       ; $0CE5FB |
  LDA $E5E2,y                               ; $0CE5FC |
  STA !s_spr_anim_frame,x                   ; $0CE5FF |
  STA $00                                   ; $0CE602 |
  LDA #$03                                  ; $0CE604 |
  STA !s_spr_timer_1,x                      ; $0CE606 |
  REP #$20                                  ; $0CE609 |
  TXY                                       ; $0CE60B |
  LDA #$0047                                ; $0CE60C |
  JSL spawn_sprite_active_y                 ; $0CE60F |
  BCC CODE_0CE657                           ; $0CE613 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE615 |
  CLC                                       ; $0CE618 |
  ADC #$0040                                ; $0CE619 |
  STA !s_spr_x_pixel_pos,y                  ; $0CE61C |
  STA !s_spr_gsu_morph_1_lo,y               ; $0CE61F |
  LDA !s_spr_y_pixel_pos,x                  ; $0CE622 |
  STA !s_spr_y_pixel_pos,y                  ; $0CE625 |
  LDA $E5DE                                 ; $0CE628 |
  STA !s_spr_x_speed_lo,y                   ; $0CE62B |
  SEP #$20                                  ; $0CE62E |
  TXA                                       ; $0CE630 |
  STA !s_spr_wildcard_4_lo,y                ; $0CE631 |
  LDA #$02                                  ; $0CE634 |
  STA !s_spr_wildcard_4_hi,y                ; $0CE636 |
  LDA #$04                                  ; $0CE639 |
  STA !s_spr_draw_priority,y                ; $0CE63B |
  LDA #$06                                  ; $0CE63E |
  STA !s_spr_wildcard_5_lo,y                ; $0CE640 |
  LDA $00                                   ; $0CE643 |
  STA !s_spr_anim_frame,y                   ; $0CE645 |
  LDA #$03                                  ; $0CE648 |
  STA !s_spr_timer_1,y                      ; $0CE64A |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CE64D |
  STA !s_spr_wildcard_1_lo,x                ; $0CE64F |
  STA !s_spr_wildcard_1_lo,y                ; $0CE652 |
  REP #$20                                  ; $0CE655 |

CODE_0CE657:
  RTL                                       ; $0CE657 |

main_roger_shy_guy:
  JSL $03AF23                               ; $0CE658 |
  JSR CODE_0CE94F                           ; $0CE65C |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CE65F |
  TYX                                       ; $0CE661 |
  JMP ($E665,x)                             ; $0CE662 |

  dw $E669                                  ; $0CE665 |
  dw $E67F                                  ; $0CE667 |

  LDX $12                                   ; $0CE669 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CE66B |
  TYX                                       ; $0CE66D |
  JSR ($E677,x)                             ; $0CE66E |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CE671 |
  TYX                                       ; $0CE673 |
  JMP ($E67B,x)                             ; $0CE674 |

  dw $E81B                                  ; $0CE677 |
  dw $E851                                  ; $0CE679 |

  dw $E68B                                  ; $0CE67B |
  dw $E6F1                                  ; $0CE67D |

  LDX $12                                   ; $0CE67F |
  LDY !s_spr_wildcard_5_hi_dp,x             ; $0CE681 |
  TYX                                       ; $0CE683 |
  JMP ($E687,x)                             ; $0CE684 |

  dw $E731                                  ; $0CE687 |
  dw $E774                                  ; $0CE689 |

  LDX $12                                   ; $0CE68B |
  LDY #$00                                  ; $0CE68D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CE68F |
  CMP !s_spr_x_pixel_pos,x                  ; $0CE692 |
  BMI CODE_0CE6A2                           ; $0CE695 |
  INY                                       ; $0CE697 |
  INY                                       ; $0CE698 |
  SEC                                       ; $0CE699 |
  SBC #$0010                                ; $0CE69A |
  CMP !s_spr_x_pixel_pos,x                  ; $0CE69D |
  BMI CODE_0CE6AE                           ; $0CE6A0 |

CODE_0CE6A2:
  TYA                                       ; $0CE6A2 |
  STA !s_spr_facing_dir,x                   ; $0CE6A3 |
  LDA $E5DE,y                               ; $0CE6A6 |
  STA !s_spr_x_speed_lo,x                   ; $0CE6A9 |
  BRA CODE_0CE6B5                           ; $0CE6AC |

CODE_0CE6AE:
  LDA $10                                   ; $0CE6AE |
  AND #$001F                                ; $0CE6B0 |
  BEQ CODE_0CE6D4                           ; $0CE6B3 |

CODE_0CE6B5:
  LDA !s_spr_timer_1,x                      ; $0CE6B5 |
  BNE CODE_0CE6D3                           ; $0CE6B8 |
  SEP #$20                                  ; $0CE6BA |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CE6BC |
  BPL CODE_0CE6C4                           ; $0CE6BE |
  LDA #$06                                  ; $0CE6C0 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE6C2 |

CODE_0CE6C4:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CE6C4 |
  LDA $E5E2,y                               ; $0CE6C6 |
  STA !s_spr_anim_frame,x                   ; $0CE6C9 |
  LDA #$03                                  ; $0CE6CC |
  STA !s_spr_timer_1,x                      ; $0CE6CE |
  REP #$20                                  ; $0CE6D1 |

CODE_0CE6D3:
  RTL                                       ; $0CE6D3 |

CODE_0CE6D4:
  JSL random_number_gen                     ; $0CE6D4 |
  STZ !s_spr_x_speed_lo,x                   ; $0CE6D8 |
  STZ !s_spr_anim_frame,x                   ; $0CE6DB |
  SEP #$20                                  ; $0CE6DE |
  LDA $10                                   ; $0CE6E0 |
  AND #$0F                                  ; $0CE6E2 |
  CLC                                       ; $0CE6E4 |
  ADC #$10                                  ; $0CE6E5 |
  STA !s_spr_timer_1,x                      ; $0CE6E7 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE6EA |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE6EC |
  REP #$20                                  ; $0CE6EE |
  RTL                                       ; $0CE6F0 |

  LDX $12                                   ; $0CE6F1 |
  LDA !s_spr_timer_1,x                      ; $0CE6F3 |
  BNE CODE_0CE712                           ; $0CE6F6 |
  SEP #$20                                  ; $0CE6F8 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CE6FA |
  BMI CODE_0CE713                           ; $0CE6FC |
  LDA !s_spr_facing_dir,x                   ; $0CE6FE |
  EOR #$02                                  ; $0CE701 |
  STA !s_spr_facing_dir,x                   ; $0CE703 |
  LDA $10                                   ; $0CE706 |
  AND #$0F                                  ; $0CE708 |
  CLC                                       ; $0CE70A |
  ADC #$10                                  ; $0CE70B |
  STA !s_spr_timer_1,x                      ; $0CE70D |
  REP #$20                                  ; $0CE710 |

CODE_0CE712:
  RTL                                       ; $0CE712 |

CODE_0CE713:
  LDA #$9506                                ; $0CE713 |
  ROR $A8,x                                 ; $0CE716 |
  LDA $E5E2,y                               ; $0CE718 |
  STA !s_spr_anim_frame,x                   ; $0CE71B |
  LDA #$9D03                                ; $0CE71E |
  STX $7A,y                                 ; $0CE721 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CE723 |
  REP #$20                                  ; $0CE725 |
  LDY !s_spr_facing_dir,x                   ; $0CE727 |
  LDA $E5DE,y                               ; $0CE72A |
  STA !s_spr_x_speed_lo,x                   ; $0CE72D |
  RTL                                       ; $0CE730 |

  LDX $12                                   ; $0CE731 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CE733 |
  TYX                                       ; $0CE735 |
  JSR ($E887,x)                             ; $0CE736 |
  LDA !s_spr_timer_1,x                      ; $0CE739 |
  BNE CODE_0CE757                           ; $0CE73C |
  SEP #$20                                  ; $0CE73E |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CE740 |
  BPL CODE_0CE748                           ; $0CE742 |
  LDA #$06                                  ; $0CE744 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE746 |

CODE_0CE748:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CE748 |
  LDA $E5E2,y                               ; $0CE74A |
  STA !s_spr_anim_frame,x                   ; $0CE74D |
  LDA #$01                                  ; $0CE750 |
  STA !s_spr_timer_1,x                      ; $0CE752 |
  REP #$20                                  ; $0CE755 |

CODE_0CE757:
  RTL                                       ; $0CE757 |

  dw $E75C                                  ; $0CE758 |
  dw $E762                                  ; $0CE75A |

  db $05, $09, $08, $07, $06, $05           ; $0CE75C |

  db $0B, $0C, $0B, $0C, $0B, $0C           ; $0CE762 |

  dw $0000, $0008, $FFF0                    ; $0CE768 |

  dw $0008, $0010, $0002                    ; $0CE76E |

  LDX $12                                   ; $0CE774 |
  LDA #$0004                                ; $0CE776 |
  STA $00                                   ; $0CE779 |
  LDY !s_spr_wildcard_1_lo,x                ; $0CE77B |
  LDA !s_spr_x_pixel_pos,y                  ; $0CE77E |
  CMP #$0100                                ; $0CE781 |
  BCS CODE_0CE793                           ; $0CE784 |
  DEC $00                                   ; $0CE786 |
  DEC $00                                   ; $0CE788 |
  CMP #$0060                                ; $0CE78A |
  BCC CODE_0CE793                           ; $0CE78D |
  DEC $00                                   ; $0CE78F |
  DEC $00                                   ; $0CE791 |

CODE_0CE793:
  LDY $00                                   ; $0CE793 |
  LDA $E768,y                               ; $0CE795 |
  STA $02                                   ; $0CE798 |
  LDA $E76E,y                               ; $0CE79A |
  STA $04                                   ; $0CE79D |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE79F |
  LDA !s_spr_hitbox_width,y                 ; $0CE7A1 |
  ASL A                                     ; $0CE7A4 |
  CLC                                       ; $0CE7A5 |
  ADC !s_spr_x_pixel_pos,y                  ; $0CE7A6 |
  STA !s_spr_x_pixel_pos,x                  ; $0CE7A9 |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CE7AC |
  BNE CODE_0CE7E8                           ; $0CE7AE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE7B0 |
  PHX                                       ; $0CE7B2 |
  LDX #$00                                  ; $0CE7B3 |
  LDA !s_spr_wildcard_2_lo,y                ; $0CE7B5 |
  BMI CODE_0CE7BC                           ; $0CE7B8 |
  INX                                       ; $0CE7BA |
  INX                                       ; $0CE7BB |

CODE_0CE7BC:
  LDA $E758,x                               ; $0CE7BC |
  STA $00                                   ; $0CE7BF |
  TXA                                       ; $0CE7C1 |
  PLX                                       ; $0CE7C2 |
  STA !s_spr_wildcard_2_lo,x                ; $0CE7C3 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CE7C6 |
  SEC                                       ; $0CE7C9 |
  SBC #$00A0                                ; $0CE7CA |
  CMP !s_spr_x_pixel_pos,x                  ; $0CE7CD |
  BPL CODE_0CE7FD                           ; $0CE7D0 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE7D2 |
  LDA !s_spr_x_speed_lo,y                   ; $0CE7D4 |
  CLC                                       ; $0CE7D7 |
  ADC #$FFF4                                ; $0CE7D8 |
  CLC                                       ; $0CE7DB |
  ADC $02                                   ; $0CE7DC |
  CLC                                       ; $0CE7DE |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $0CE7DF |
  STA !s_spr_x_speed_lo,y                   ; $0CE7E1 |
  STZ !s_spr_wildcard_6_lo_dp,x             ; $0CE7E4 |
  BRA CODE_0CE7FD                           ; $0CE7E6 |

CODE_0CE7E8:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE7E8 |
  LDA #$FFF4                                ; $0CE7EA |
  CLC                                       ; $0CE7ED |
  ADC $02                                   ; $0CE7EE |
  STA !s_spr_wildcard_6_lo,y                ; $0CE7F0 |
  PHX                                       ; $0CE7F3 |
  LDX !s_spr_wildcard_2_lo,y                ; $0CE7F4 |
  LDA $E758,x                               ; $0CE7F7 |
  STA $00                                   ; $0CE7FA |
  PLX                                       ; $0CE7FC |

CODE_0CE7FD:
  LDA !s_spr_timer_1,x                      ; $0CE7FD |
  BNE CODE_0CE81A                           ; $0CE800 |
  SEP #$20                                  ; $0CE802 |
  DEC !s_spr_wildcard_5_lo_dp,x             ; $0CE804 |
  BPL CODE_0CE80C                           ; $0CE806 |
  LDA #$05                                  ; $0CE808 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE80A |

CODE_0CE80C:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CE80C |
  LDA ($00),y                               ; $0CE80E |
  STA !s_spr_anim_frame,x                   ; $0CE810 |
  LDA $04                                   ; $0CE813 |
  STA !s_spr_timer_1,x                      ; $0CE815 |
  REP #$20                                  ; $0CE818 |

CODE_0CE81A:
  RTL                                       ; $0CE81A |

  LDX $12                                   ; $0CE81B |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE81D |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CE81F |
  SEC                                       ; $0CE822 |
  SBC #$0030                                ; $0CE823 |
  CMP !s_spr_x_pixel_pos,y                  ; $0CE826 |
  BPL CODE_0CE850                           ; $0CE829 |
  STZ !s_spr_facing_dir,x                   ; $0CE82B |
  LDA #$FF00                                ; $0CE82E |
  STA !s_spr_x_speed_lo,x                   ; $0CE831 |
  SEP #$20                                  ; $0CE834 |
  LDA #$02                                  ; $0CE836 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CE838 |
  LDA #$06                                  ; $0CE83A |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE83C |
  TAY                                       ; $0CE83E |
  LDA $E5E2,y                               ; $0CE83F |
  STA !s_spr_anim_frame,x                   ; $0CE842 |
  LDA #$01                                  ; $0CE845 |
  STA !s_spr_timer_1,x                      ; $0CE847 |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CE84A |
  REP #$20                                  ; $0CE84C |
  PLA                                       ; $0CE84E |
  RTL                                       ; $0CE84F |

CODE_0CE850:
  RTS                                       ; $0CE850 |

  LDX $12                                   ; $0CE851 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE853 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CE855 |
  SEC                                       ; $0CE858 |
  SBC #$003E                                ; $0CE859 |
  CMP !s_spr_x_pixel_pos,y                  ; $0CE85C |
  BPL CODE_0CE886                           ; $0CE85F |
  STZ !s_spr_facing_dir,x                   ; $0CE861 |
  LDA #$FF00                                ; $0CE864 |
  STA !s_spr_x_speed_lo,x                   ; $0CE867 |
  SEP #$20                                  ; $0CE86A |
  LDA #$02                                  ; $0CE86C |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CE86E |
  LDA #$06                                  ; $0CE870 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE872 |
  TAY                                       ; $0CE874 |
  LDA $E5E2,y                               ; $0CE875 |
  STA !s_spr_anim_frame,x                   ; $0CE878 |
  LDA #$01                                  ; $0CE87B |
  STA !s_spr_timer_1,x                      ; $0CE87D |
  STZ !s_spr_wildcard_5_hi_dp,x             ; $0CE880 |
  REP #$20                                  ; $0CE882 |
  PLA                                       ; $0CE884 |
  RTL                                       ; $0CE885 |

CODE_0CE886:
  RTS                                       ; $0CE886 |

  dw $E88B                                  ; $0CE887 |
  dw $E8EE                                  ; $0CE889 |

  LDX $12                                   ; $0CE88B |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE88D |
  LDA !s_spr_hitbox_height,x                ; $0CE88F |
  CLC                                       ; $0CE892 |
  ADC !s_spr_hitbox_height,y                ; $0CE893 |
  STA $00                                   ; $0CE896 |
  LDA !s_spr_y_hitbox_center,x              ; $0CE898 |
  SEC                                       ; $0CE89B |
  SBC !s_spr_y_hitbox_center,y              ; $0CE89C |
  BPL CODE_0CE8A5                           ; $0CE89F |
  EOR #$FFFF                                ; $0CE8A1 |
  INC A                                     ; $0CE8A4 |

CODE_0CE8A5:
  CMP $00                                   ; $0CE8A5 |
  BCS CODE_0CE8ED                           ; $0CE8A7 |
  LDA !s_spr_hitbox_width,x                 ; $0CE8A9 |
  CLC                                       ; $0CE8AC |
  ADC !s_spr_hitbox_width,y                 ; $0CE8AD |
  STA $00                                   ; $0CE8B0 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE8B2 |
  SEC                                       ; $0CE8B5 |
  SBC !s_spr_x_pixel_pos,y                  ; $0CE8B6 |
  BMI CODE_0CE8ED                           ; $0CE8B9 |
  SEC                                       ; $0CE8BB |
  SBC $00                                   ; $0CE8BC |
  STA $02                                   ; $0CE8BE |
  BEQ CODE_0CE8C4                           ; $0CE8C0 |
  BPL CODE_0CE8ED                           ; $0CE8C2 |

CODE_0CE8C4:
  STZ !s_spr_x_speed_lo,x                   ; $0CE8C4 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE8C7 |
  CLC                                       ; $0CE8CA |
  ADC $02                                   ; $0CE8CB |
  STA !s_spr_x_pixel_pos,x                  ; $0CE8CD |
  STZ !s_spr_anim_frame,x                   ; $0CE8D0 |
  SEP #$20                                  ; $0CE8D3 |
  LDA #$05                                  ; $0CE8D5 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE8D7 |
  TAY                                       ; $0CE8D9 |
  LDA $E75C,y                               ; $0CE8DA |
  STA !s_spr_anim_frame,x                   ; $0CE8DD |
  LDA #$08                                  ; $0CE8E0 |
  STA !s_spr_timer_1,x                      ; $0CE8E2 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE8E5 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE8E7 |
  REP #$20                                  ; $0CE8E9 |
  PLA                                       ; $0CE8EB |
  RTL                                       ; $0CE8EC |

CODE_0CE8ED:
  RTS                                       ; $0CE8ED |

  LDX $12                                   ; $0CE8EE |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CE8F0 |
  LDA !s_spr_hitbox_height,x                ; $0CE8F2 |
  CLC                                       ; $0CE8F5 |
  ADC !s_spr_hitbox_height,y                ; $0CE8F6 |
  STA $00                                   ; $0CE8F9 |
  LDA !s_spr_y_hitbox_center,x              ; $0CE8FB |
  SEC                                       ; $0CE8FE |
  SBC !s_spr_y_hitbox_center,y              ; $0CE8FF |
  BPL CODE_0CE908                           ; $0CE902 |
  EOR #$FFFF                                ; $0CE904 |
  INC A                                     ; $0CE907 |

CODE_0CE908:
  CMP $00                                   ; $0CE908 |
  BCS CODE_0CE94E                           ; $0CE90A |
  LDA !s_spr_hitbox_width,x                 ; $0CE90C |
  CLC                                       ; $0CE90F |
  ADC !s_spr_hitbox_width,y                 ; $0CE910 |
  STA $00                                   ; $0CE913 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE915 |
  SEC                                       ; $0CE918 |
  SBC !s_spr_x_pixel_pos,y                  ; $0CE919 |
  BMI CODE_0CE94E                           ; $0CE91C |
  SEC                                       ; $0CE91E |
  SBC $00                                   ; $0CE91F |
  STA $02                                   ; $0CE921 |
  BEQ CODE_0CE927                           ; $0CE923 |
  BPL CODE_0CE94E                           ; $0CE925 |

CODE_0CE927:
  STZ !s_spr_x_speed_lo,x                   ; $0CE927 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE92A |
  CLC                                       ; $0CE92D |
  ADC $02                                   ; $0CE92E |
  STA !s_spr_x_pixel_pos,x                  ; $0CE930 |
  LDA !s_spr_anim_frame,y                   ; $0CE933 |
  STA !s_spr_anim_frame,x                   ; $0CE936 |
  SEP #$20                                  ; $0CE939 |
  LDA !s_spr_wildcard_5_lo,y                ; $0CE93B |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CE93E |
  LDA !s_spr_timer_1,y                      ; $0CE940 |
  STA !s_spr_timer_1,x                      ; $0CE943 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE946 |
  INC !s_spr_wildcard_5_hi_dp,x             ; $0CE948 |
  REP #$20                                  ; $0CE94A |
  PLA                                       ; $0CE94C |
  RTL                                       ; $0CE94D |

CODE_0CE94E:
  RTS                                       ; $0CE94E |

CODE_0CE94F:
  LDA !s_spr_cam_y_pos,x                    ; $0CE94F |
  CLC                                       ; $0CE952 |
  ADC #$0050                                ; $0CE953 |
  CMP #$0190                                ; $0CE956 |
  BCC CODE_0CE960                           ; $0CE959 |
  PLA                                       ; $0CE95B |
  JML $03A31E                               ; $0CE95C |

CODE_0CE960:
  RTS                                       ; $0CE960 |

init_coin:
  JSL $03D3F8                               ; $0CE961 |
  BEQ CODE_0CE96B                           ; $0CE965 |
  JML $03A31E                               ; $0CE967 |

CODE_0CE96B:
  LDA !r_header_spr_palette                 ; $0CE96B |
  CMP #$0002                                ; $0CE96E |
  BNE CODE_0CE97C                           ; $0CE971 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CE973 |
  ORA #$000E                                ; $0CE976 |
  STA !s_spr_oam_yxppccct,x                 ; $0CE979 |

CODE_0CE97C:
  STZ !s_spr_facing_dir,x                   ; $0CE97C |
  LDA $14                                   ; $0CE97F |
  LSR A                                     ; $0CE981 |
  LSR A                                     ; $0CE982 |
  LSR A                                     ; $0CE983 |
  AND #$0003                                ; $0CE984 |
  STA !s_spr_anim_frame,x                   ; $0CE987 |
  RTL                                       ; $0CE98A |

main_coin:
  LDA $14                                   ; $0CE98B |
  LSR A                                     ; $0CE98D |
  LSR A                                     ; $0CE98E |
  LSR A                                     ; $0CE98F |
  AND #$0003                                ; $0CE990 |
  STA !s_spr_anim_frame,x                   ; $0CE993 |
  LDY !s_spr_collision_id,x                 ; $0CE996 |
  BEQ CODE_0CE9BF                           ; $0CE999 |
  BMI CODE_0CE9C0                           ; $0CE99B |
  DEY                                       ; $0CE99D |
  BEQ CODE_0CE9BF                           ; $0CE99E |
  LDA !s_spr_state,y                        ; $0CE9A0 |
  CMP #$0010                                ; $0CE9A3 |
  BNE CODE_0CE9BF                           ; $0CE9A6 |
  LDA !s_spr_collision_state,y              ; $0CE9A8 |
  BEQ CODE_0CE9BF                           ; $0CE9AB |
  LDA !s_spr_id,y                           ; $0CE9AD |
  CMP #$0107                                ; $0CE9B0 |
  BEQ CODE_0CE9C0                           ; $0CE9B3 |
  CMP #$0022                                ; $0CE9B5 |
  BCC CODE_0CE9BF                           ; $0CE9B8 |
  CMP #$002C                                ; $0CE9BA |
  BCC CODE_0CE9C0                           ; $0CE9BD |

CODE_0CE9BF:
  RTL                                       ; $0CE9BF |

CODE_0CE9C0:
  LDA !s_spr_x_pixel_pos,x                  ; $0CE9C0 |
  STA $0000                                 ; $0CE9C3 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CE9C6 |
  STA $0002                                 ; $0CE9C9 |
  JSL $03A520                               ; $0CE9CC |
  LDA #$0009                                ; $0CE9D0 |\ play sound #$0009
  JSL push_sound_queue                      ; $0CE9D3 |/
  JSL $03D3EB                               ; $0CE9D7 |
  LDA #$01E4                                ; $0CE9DB |
  JSL spawn_ambient_sprite                  ; $0CE9DE |
  LDA !s_spr_x_pixel_pos,x                  ; $0CE9E2 |
  STA $70A2,y                               ; $0CE9E5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CE9E8 |
  STA $7142,y                               ; $0CE9EB |
  LDA #$000C                                ; $0CE9EE |
  STA $73C2,y                               ; $0CE9F1 |
  LDA #$0008                                ; $0CE9F4 |
  STA $7782,y                               ; $0CE9F7 |
  JML $03A32E                               ; $0CE9FA |

  dw $0004, $0002, $000E, $000C             ; $0CE9FE |

init_red_coin:
  JSL $03D3F8                               ; $0CEA06 |
  BEQ CODE_0CEA10                           ; $0CEA0A |
  JML $03A31E                               ; $0CEA0C |

CODE_0CEA10:
  STZ !s_spr_facing_dir,x                   ; $0CEA10 |
  LDY #$00                                  ; $0CEA13 |
  LDA !r_header_spr_palette                 ; $0CEA15 |
  CMP #$0002                                ; $0CEA18 |
  BNE CODE_0CEA1F                           ; $0CEA1B |
  LDY #$04                                  ; $0CEA1D |

CODE_0CEA1F:
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CEA1F |
  LDA !s_magnify_glass_flag                 ; $0CEA21 |
  BEQ CODE_0CEA28                           ; $0CEA24 |
  INY                                       ; $0CEA26 |
  INY                                       ; $0CEA27 |

CODE_0CEA28:
  LDA !s_spr_oam_yxppccct,x                 ; $0CEA28 |
  AND #$FFF1                                ; $0CEA2B |
  ORA $E9FE,y                               ; $0CEA2E |
  STA !s_spr_oam_yxppccct,x                 ; $0CEA31 |
  LDA $14                                   ; $0CEA34 |
  LSR A                                     ; $0CEA36 |
  LSR A                                     ; $0CEA37 |
  LSR A                                     ; $0CEA38 |
  AND #$0003                                ; $0CEA39 |
  STA !s_spr_anim_frame,x                   ; $0CEA3C |
  RTL                                       ; $0CEA3F |

main_red_coin:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CEA40 |
  LDA !s_magnify_glass_flag                 ; $0CEA42 |
  BEQ CODE_0CEA49                           ; $0CEA45 |
  INY                                       ; $0CEA47 |
  INY                                       ; $0CEA48 |

CODE_0CEA49:
  LDA !s_spr_oam_yxppccct,x                 ; $0CEA49 |
  AND #$FFF1                                ; $0CEA4C |
  ORA $E9FE,y                               ; $0CEA4F |
  STA !s_spr_oam_yxppccct,x                 ; $0CEA52 |
  LDA $14                                   ; $0CEA55 |
  LSR A                                     ; $0CEA57 |
  LSR A                                     ; $0CEA58 |
  LSR A                                     ; $0CEA59 |
  AND #$0003                                ; $0CEA5A |
  STA !s_spr_anim_frame,x                   ; $0CEA5D |
  LDY !s_spr_collision_id,x                 ; $0CEA60 |
  BEQ CODE_0CEA89                           ; $0CEA63 |
  BMI CODE_0CEA8A                           ; $0CEA65 |
  DEY                                       ; $0CEA67 |
  BEQ CODE_0CEA89                           ; $0CEA68 |
  LDA !s_spr_state,y                        ; $0CEA6A |
  CMP #$0010                                ; $0CEA6D |
  BNE CODE_0CEA89                           ; $0CEA70 |
  LDA !s_spr_collision_state,y              ; $0CEA72 |
  BEQ CODE_0CEA89                           ; $0CEA75 |
  LDA !s_spr_id,y                           ; $0CEA77 |
  CMP #$0107                                ; $0CEA7A |
  BEQ CODE_0CEA8A                           ; $0CEA7D |
  CMP #$0022                                ; $0CEA7F |
  BCC CODE_0CEA89                           ; $0CEA82 |
  CMP #$002C                                ; $0CEA84 |
  BCC CODE_0CEA8A                           ; $0CEA87 |

CODE_0CEA89:
  RTL                                       ; $0CEA89 |

CODE_0CEA8A:
  JSL $0CEAA5                               ; $0CEA8A |
  JML $03A32E                               ; $0CEA8E |
  PHB                                       ; $0CEA92 |
  PHK                                       ; $0CEA93 |
  PLB                                       ; $0CEA94 |
  PHD                                       ; $0CEA95 |
  LDA #$7960                                ; $0CEA96 |
  TCD                                       ; $0CEA99 |
  JSL $0CEAA5                               ; $0CEA9A |
  JSL $03A32E                               ; $0CEA9E |
  PLD                                       ; $0CEAA2 |
  PLB                                       ; $0CEAA3 |
  RTL                                       ; $0CEAA4 |

  JSL $03D3EB                               ; $0CEAA5 |
  LDA #$01E4                                ; $0CEAA9 |
  JSL spawn_ambient_sprite                  ; $0CEAAC |
  LDA !s_spr_x_pixel_pos,x                  ; $0CEAB0 |
  STA $70A2,y                               ; $0CEAB3 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CEAB6 |
  STA $7142,y                               ; $0CEAB9 |
  LDA #$000C                                ; $0CEABC |
  STA $73C2,y                               ; $0CEABF |
  LDA #$0008                                ; $0CEAC2 |
  STA $7782,y                               ; $0CEAC5 |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CEAC8 |
  INY                                       ; $0CEACA |
  INY                                       ; $0CEACB |
  LDA $E9FE,y                               ; $0CEACC |
  JSL $03B35B                               ; $0CEACF |
  RTL                                       ; $0CEAD3 |

  dw $ECEC                                  ; $0CEAD4 |
  dw $ECEC                                  ; $0CEAD6 |
  dw $ECEC                                  ; $0CEAD8 |
  dw $ECEC                                  ; $0CEADA |
  dw $ECEC                                  ; $0CEADC |
  dw $ECEC                                  ; $0CEADE |

  dw $ED7B                                  ; $0CEAE0 |
  dw $ED7B                                  ; $0CEAE2 |
  dw $ED7B                                  ; $0CEAE4 |
  dw $ED7B                                  ; $0CEAE6 |
  dw $ED7B                                  ; $0CEAE8 |
  dw $ED7B                                  ; $0CEAEA |

  dw $0004, $0004, $0004, $0004             ; $0CEAEC |
  dw $0004, $0004                           ; $0CEAF4 |

  dw $EE64                                  ; $0CEAF8 |
  dw $EE64                                  ; $0CEAFA |
  dw $EE64                                  ; $0CEAFC |
  dw $EE64                                  ; $0CEAFE |
  dw $EE64                                  ; $0CEB00 |
  dw $EE64                                  ; $0CEB02 |
  dw $EF14                                  ; $0CEB04 |
  dw $EF14                                  ; $0CEB06 |
  dw $EF14                                  ; $0CEB08 |
  dw $EF14                                  ; $0CEB0A |
  dw $EF14                                  ; $0CEB0C |
  dw $EF14                                  ; $0CEB0E |

init_balloon_bg3:
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CEB10 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CEB12 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CEB15 |
  LDA #$0030                                ; $0CEB17 |
  STA $6126                                 ; $0CEB1A |
  LDA !s_spr_oam_yxppccct,x                 ; $0CEB1D |
  AND #$FFCF                                ; $0CEB20 |
  ORA #$0030                                ; $0CEB23 |
  STA !s_spr_oam_yxppccct,x                 ; $0CEB26 |
  LDA !r_reg_tm_mirror                      ; $0CEB29 |
  STA !s_spr_wildcard_2_lo,x                ; $0CEB2C |
  LDA !r_header_bg2_tileset                 ; $0CEB2F |
  CMP #$0016                                ; $0CEB32 |
  BNE CODE_0CEB67                           ; $0CEB35 |
  LDY #$0F                                  ; $0CEB37 |
  STY $4331                                 ; $0CEB39 |
  LDY #$10                                  ; $0CEB3C |
  STY $4341                                 ; $0CEB3E |
  LDX #$1E                                  ; $0CEB41 |

CODE_0CEB43:
  LDA $5FCD6A,x                             ; $0CEB43 |
  STA $702E2E,x                             ; $0CEB47 |
  STA $7020C2,x                             ; $0CEB4B |
  DEX                                       ; $0CEB4F |
  DEX                                       ; $0CEB50 |
  BPL CODE_0CEB43                           ; $0CEB51 |
  LDX #$1E                                  ; $0CEB53 |

CODE_0CEB55:
  LDA $5FCD6A,x                             ; $0CEB55 |
  STA $702E4E,x                             ; $0CEB59 |
  STA $7020E2,x                             ; $0CEB5D |
  DEX                                       ; $0CEB61 |
  DEX                                       ; $0CEB62 |
  BPL CODE_0CEB55                           ; $0CEB63 |
  BRA CODE_0CEB79                           ; $0CEB65 |

CODE_0CEB67:
  LDX #$08                                  ; $0CEB67 |

CODE_0CEB69:
  LDA $5FE34C,x                             ; $0CEB69 |
  STA $702D6C,x                             ; $0CEB6D |
  STA !s_cgram_mirror,x                     ; $0CEB71 |
  DEX                                       ; $0CEB75 |
  DEX                                       ; $0CEB76 |
  BNE CODE_0CEB69                           ; $0CEB77 |

CODE_0CEB79:
  LDX $12                                   ; $0CEB79 |
  LDA !r_reg_tm_mirror                      ; $0CEB7B |
  ORA !r_reg_ts_mirror                      ; $0CEB7E |
  AND #$000F                                ; $0CEB81 |
  XBA                                       ; $0CEB84 |
  ORA #$0010                                ; $0CEB85 |
  STA !r_reg_tm_mirror                      ; $0CEB88 |
  LDA #$0002                                ; $0CEB8B |
  STA !s_spr_y_accel,x                      ; $0CEB8E |
  LDA #$0040                                ; $0CEB91 |
  STA !s_spr_y_accel_ceiling,x              ; $0CEB94 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CEB97 |
  SEC                                       ; $0CEB9A |
  SBC !r_bg1_cam_x                          ; $0CEB9B |
  STA !s_spr_cam_x_pos,x                    ; $0CEB9E |
  LDA !s_spr_y_pixel_pos,x                  ; $0CEBA1 |
  SEC                                       ; $0CEBA4 |
  SBC !r_bg1_cam_y                          ; $0CEBA5 |
  STA !s_spr_cam_y_pos,x                    ; $0CEBA8 |
  JSR CODE_0CEDE1                           ; $0CEBAB |
  JSR CODE_0CED94                           ; $0CEBAE |
  RTL                                       ; $0CEBB1 |

  dw $0014, $000A                           ; $0CEBB2 |

  dw $0001, $FFFF                           ; $0CEBB6 |

main_balloon_bg3:
  JSR CODE_0CEDE1                           ; $0CEBBA |
  JSR CODE_0CED94                           ; $0CEBBD |
  LDA $12                                   ; $0CEBC0 |
  AND #$00FF                                ; $0CEBC2 |
  STA $6012                                 ; $0CEBC5 |
  LDA !s_player_x                           ; $0CEBC8 |
  SEC                                       ; $0CEBCB |
  SBC !r_bg1_cam_x                          ; $0CEBCC |
  STA $6014                                 ; $0CEBCF |
  LDA !s_player_y                           ; $0CEBD2 |
  SEC                                       ; $0CEBD5 |
  SBC !r_bg1_cam_y                          ; $0CEBD6 |
  STA $6016                                 ; $0CEBD9 |
  LDA !s_player_duck_state                  ; $0CEBDC |
  STA $6018                                 ; $0CEBDF |
  LDX #$0A                                  ; $0CEBE2 |
  LDA #$8390                                ; $0CEBE4 |
  JSL r_gsu_init_1                          ; $0CEBE7 | GSU init
  LDX $12                                   ; $0CEBEB |
  JSL $03AF23                               ; $0CEBED |
  LDA $601A                                 ; $0CEBF1 |
  BNE CODE_0CEBF9                           ; $0CEBF4 |
  JMP CODE_0CEC71                           ; $0CEBF6 |

CODE_0CEBF9:
  BIT #$0001                                ; $0CEBF9 |
  BEQ CODE_0CEC3E                           ; $0CEBFC |
  LDA !s_player_y_speed                     ; $0CEBFE |
  BMI CODE_0CEC3E                           ; $0CEC01 |
  STZ !s_player_ground_pound_state          ; $0CEC03 |
  LDA #$0001                                ; $0CEC06 |
  STA !s_on_sprite_platform_flag            ; $0CEC09 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CEC0C |
  BNE CODE_0CEC20                           ; $0CEC0E |
  LDY #$04                                  ; $0CEC10 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CEC12 |
  LDA #$0100                                ; $0CEC14 |
  STA !s_spr_y_speed_lo,x                   ; $0CEC17 |
  LDA #$0040                                ; $0CEC1A |
  STA !s_spr_timer_1,x                      ; $0CEC1D |

CODE_0CEC20:
  LDA #$0200                                ; $0CEC20 |
  STA !s_player_y_speed                     ; $0CEC23 |
  LDA $601C                                 ; $0CEC26 |
  CLC                                       ; $0CEC29 |
  ADC #$0002                                ; $0CEC2A |
  CLC                                       ; $0CEC2D |
  ADC !s_player_y                           ; $0CEC2E |
  STA !s_player_y                           ; $0CEC31 |
  LDA !s_player_x                           ; $0CEC34 |
  CLC                                       ; $0CEC37 |
  ADC !s_spr_x_delta_lo,x                   ; $0CEC38 |
  STA !s_player_x                           ; $0CEC3B |

CODE_0CEC3E:
  LDA $601A                                 ; $0CEC3E |
  AND #$001E                                ; $0CEC41 |
  BEQ CODE_0CEC71                           ; $0CEC44 |
  PHA                                       ; $0CEC46 |
  PHA                                       ; $0CEC47 |
  LDY #$00                                  ; $0CEC48 |
  LDA !s_player_x_speed_prev                ; $0CEC4A |
  BMI CODE_0CEC51                           ; $0CEC4D |
  INY                                       ; $0CEC4F |
  INY                                       ; $0CEC50 |

CODE_0CEC51:
  PLA                                       ; $0CEC51 |
  AND $EBB2,y                               ; $0CEC52 |
  BEQ CODE_0CEC5D                           ; $0CEC55 |
  STZ !s_player_x_speed_prev                ; $0CEC57 |
  STZ !s_player_x_speed                     ; $0CEC5A |

CODE_0CEC5D:
  PLA                                       ; $0CEC5D |
  LDY #$00                                  ; $0CEC5E |
  AND #$0014                                ; $0CEC60 |
  BNE CODE_0CEC67                           ; $0CEC63 |
  INY                                       ; $0CEC65 |
  INY                                       ; $0CEC66 |

CODE_0CEC67:
  LDA !s_player_x                           ; $0CEC67 |
  CLC                                       ; $0CEC6A |
  ADC $EBB6,y                               ; $0CEC6B |
  STA !s_player_x                           ; $0CEC6E |

CODE_0CEC71:
  LDA !s_baby_mario_state                   ; $0CEC71 |
  ORA $61CC                                 ; $0CEC74 |
  BNE CODE_0CECB0                           ; $0CEC77 |
  LDA $6014                                 ; $0CEC79 |
  BEQ CODE_0CECB0                           ; $0CEC7C |
  BIT #$0001                                ; $0CEC7E |
  BEQ CODE_0CEC8E                           ; $0CEC81 |
  LDA !s_spr_y_speed_lo                     ; $0CEC83 |
  BMI CODE_0CEC8E                           ; $0CEC86 |
  LDA #$0001                                ; $0CEC88 |
  TSB $7860                                 ; $0CEC8B |

CODE_0CEC8E:
  LDA $6014                                 ; $0CEC8E |
  AND #$001E                                ; $0CEC91 |
  BEQ CODE_0CECB0                           ; $0CEC94 |
  PHA                                       ; $0CEC96 |
  LDY #$00                                  ; $0CEC97 |
  LDA !s_spr_x_speed_lo                     ; $0CEC99 |
  BMI CODE_0CECA0                           ; $0CEC9C |
  INY                                       ; $0CEC9E |
  INY                                       ; $0CEC9F |

CODE_0CECA0:
  PLA                                       ; $0CECA0 |
  AND $EBB2,y                               ; $0CECA1 |
  BEQ CODE_0CECB0                           ; $0CECA4 |
  LDA !s_spr_x_speed_lo                     ; $0CECA6 |
  EOR #$FFFF                                ; $0CECA9 |
  INC A                                     ; $0CECAC |
  STA !s_spr_x_speed_lo                     ; $0CECAD |

CODE_0CECB0:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CECB0 |
  TYX                                       ; $0CECB2 |
  JMP ($ECB6,x)                             ; $0CECB3 |

  dw $ECBE                                  ; $0CECB6 |
  dw $ECE0                                  ; $0CECB8 |
  dw $ECE6                                  ; $0CECBA |
  dw $ECDD                                  ; $0CECBC |

  LDX $12                                   ; $0CECBE |
  LDA !s_spr_y_accel_ceiling,x              ; $0CECC0 |
  SEC                                       ; $0CECC3 |
  SBC !s_spr_y_speed_lo,x                   ; $0CECC4 |
  BPL CODE_0CECCD                           ; $0CECC7 |
  EOR #$FFFF                                ; $0CECC9 |
  INC A                                     ; $0CECCC |

CODE_0CECCD:
  CMP !s_spr_y_accel,x                      ; $0CECCD |
  BCS CODE_0CECDC                           ; $0CECD0 |
  LDA !s_spr_y_accel_ceiling,x              ; $0CECD2 |
  EOR #$FFFF                                ; $0CECD5 |
  INC A                                     ; $0CECD8 |
  STA !s_spr_y_accel_ceiling,x              ; $0CECD9 |

CODE_0CECDC:
  RTL                                       ; $0CECDC |

  LDX $12                                   ; $0CECDD |
  RTL                                       ; $0CECDF |

  LDX !r_cur_world                          ; $0CECE0 |
  JMP ($EAD4,x)                             ; $0CECE3 |
  LDX !r_cur_world                          ; $0CECE6 |
  JMP ($EAE0,x)                             ; $0CECE9 |
  LDX $12                                   ; $0CECEC |
  LDA !s_spr_timer_2,x                      ; $0CECEE |
  BNE CODE_0CED2F                           ; $0CECF1 |
  LDA #$0010                                ; $0CECF3 |
  STA !s_spr_timer_2,x                      ; $0CECF6 |
  LDA #$0016                                ; $0CECF9 |\ play sound #$0016
  JSL push_sound_queue                      ; $0CECFC |/
  LDA #$01DF                                ; $0CED00 |
  JSL spawn_ambient_sprite                  ; $0CED03 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CED07 |
  CLC                                       ; $0CED0A |
  ADC #$FFF8                                ; $0CED0B |
  STA $70A2,y                               ; $0CED0E |
  LDA !s_spr_y_pixel_pos,x                  ; $0CED11 |
  STA $7142,y                               ; $0CED14 |
  LDA #$0005                                ; $0CED17 |
  STA $7E4C,y                               ; $0CED1A |
  LDA #$0005                                ; $0CED1D |
  STA $73C2,y                               ; $0CED20 |
  LDA #$0004                                ; $0CED23 |
  STA $7782,y                               ; $0CED26 |
  LDA #$0006                                ; $0CED29 |
  STA $7462,y                               ; $0CED2C |

CODE_0CED2F:
  LDA !s_spr_timer_1,x                      ; $0CED2F |
  BNE CODE_0CED5B                           ; $0CED32 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CED34 |
  SEC                                       ; $0CED36 |
  SBC #$0001                                ; $0CED37 |
  BPL CODE_0CED53                           ; $0CED3A |
  LDA #$0040                                ; $0CED3C |
  STA !s_spr_y_accel,x                      ; $0CED3F |
  LDA #$0400                                ; $0CED42 |
  STA !s_spr_y_accel_ceiling,x              ; $0CED45 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CED48 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CED4A |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CED4C |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CED4E |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CED50 |
  RTL                                       ; $0CED52 |

CODE_0CED53:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CED53 |
  LDA #$0008                                ; $0CED55 |
  STA !s_spr_timer_1,x                      ; $0CED58 |

CODE_0CED5B:
  LDY !r_cur_world                          ; $0CED5B |
  LDA $EAEC,y                               ; $0CED5E |
  STA !s_spr_y_accel,x                      ; $0CED61 |

CODE_0CED64:
  LDY #$00                                  ; $0CED64 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CED66 |
  CMP !s_spr_wildcard_6_lo,x                ; $0CED69 |
  BPL CODE_0CED70                           ; $0CED6C |
  INY                                       ; $0CED6E |
  INY                                       ; $0CED6F |

CODE_0CED70:
  LDA $ED77,y                               ; $0CED70 |
  STA !s_spr_y_accel_ceiling,x              ; $0CED73 |
  RTL                                       ; $0CED76 |

  dw $FF00, $0100                           ; $0CED77 |

  LDX $12                                   ; $0CED7B |
  LDA !s_spr_timer_1,x                      ; $0CED7D |
  BNE CODE_0CED8C                           ; $0CED80 |
  LDA #$0180                                ; $0CED82 |
  STA !s_spr_x_speed_lo,x                   ; $0CED85 |
  LDY #$02                                  ; $0CED88 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CED8A |

CODE_0CED8C:
  LDA #$0008                                ; $0CED8C |
  STA !s_spr_y_accel,x                      ; $0CED8F |
  BRA CODE_0CED64                           ; $0CED92 |

CODE_0CED94:
  LDA !s_spr_cam_x_pos,x                    ; $0CED94 |
  CLC                                       ; $0CED97 |
  ADC #$00F0                                ; $0CED98 |
  CMP #$0240                                ; $0CED9B |
  BCC CODE_0CEDAE                           ; $0CED9E |
  LDA !s_spr_wildcard_2_lo,x                ; $0CEDA0 |
  STA !r_reg_tm_mirror                      ; $0CEDA3 |
  STZ $0CB2                                 ; $0CEDA6 |
  PLA                                       ; $0CEDA9 |
  JML $03A31E                               ; $0CEDAA |

CODE_0CEDAE:
  CMP #$0200                                ; $0CEDAE |
  BCC CODE_0CEDCA                           ; $0CEDB1 |
  LDA !r_header_bg2_tileset                 ; $0CEDB3 |
  CMP #$0016                                ; $0CEDB6 |
  BNE CODE_0CEDC0                           ; $0CEDB9 |
  LDA #$0002                                ; $0CEDBB |
  BRA CODE_0CEDC3                           ; $0CEDBE |

CODE_0CEDC0:
  LDA #$0004                                ; $0CEDC0 |

CODE_0CEDC3:
  TRB !r_reg_tm_mirror                      ; $0CEDC3 |
  TRB !r_reg_ts_mirror                      ; $0CEDC6 |
  RTS                                       ; $0CEDC9 |

CODE_0CEDCA:
  LDA !r_header_bg2_tileset                 ; $0CEDCA |
  CMP #$0016                                ; $0CEDCD |
  BNE CODE_0CEDD7                           ; $0CEDD0 |
  LDA #$0002                                ; $0CEDD2 |
  BRA CODE_0CEDDA                           ; $0CEDD5 |

CODE_0CEDD7:
  LDA #$0004                                ; $0CEDD7 |

CODE_0CEDDA:
  TSB !r_reg_tm_mirror                      ; $0CEDDA |
  TSB !r_reg_ts_mirror                      ; $0CEDDD |
  RTS                                       ; $0CEDE0 |

CODE_0CEDE1:
  LDA #$49F6                                ; $0CEDE1 |
  STA !gsu_r1                               ; $0CEDE4 |
  LDA #$4B36                                ; $0CEDE7 |
  STA !gsu_r2                               ; $0CEDEA |
  LDA #$002C                                ; $0CEDED |
  STA !gsu_r3                               ; $0CEDF0 |
  LDA #$0000                                ; $0CEDF3 |
  STA !gsu_r4                               ; $0CEDF6 |
  LDA #$449E                                ; $0CEDF9 |
  STA !gsu_r5                               ; $0CEDFC |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CEDFF |
  STA !gsu_r6                               ; $0CEE01 |
  LDY !r_cur_world                          ; $0CEE04 |
  LDA $EB04,y                               ; $0CEE07 |
  STA !gsu_r14                              ; $0CEE0A |
  LDA #$000C                                ; $0CEE0D |
  STA !gsu_r0                               ; $0CEE10 |
  LDA $EAF8,y                               ; $0CEE13 |
  STA !gsu_r7                               ; $0CEE16 |
  LDA #$000C                                ; $0CEE19 |
  STA !gsu_r8                               ; $0CEE1C |
  LDA !s_spr_cam_x_pos,x                    ; $0CEE1F |
  CLC                                       ; $0CEE22 |
  ADC #$0010                                ; $0CEE23 |
  STA $6040                                 ; $0CEE26 |
  LDA !s_spr_cam_y_pos,x                    ; $0CEE29 |
  CLC                                       ; $0CEE2C |
  ADC #$0006                                ; $0CEE2D |
  STA $6042                                 ; $0CEE30 |
  LDX #$08                                  ; $0CEE33 |
  LDA #$E865                                ; $0CEE35 |
  JSL r_gsu_init_1                          ; $0CEE38 | GSU init
  JSL $00BE39                               ; $0CEE3C |

; DMA args
  dl $7E5040, $703372                       ; $0CEE40 |
  dw $0348                                  ; $0CEE46 |

  LDA !r_header_bg2_tileset                 ; $0CEE48 |
  CMP #$0016                                ; $0CEE4B |
  BNE CODE_0CEE55                           ; $0CEE4E |
  LDA #$0002                                ; $0CEE50 |
  BRA CODE_0CEE58                           ; $0CEE53 |

CODE_0CEE55:
  LDA #$0004                                ; $0CEE55 |

CODE_0CEE58:
  TSB !r_reg_tm_mirror                      ; $0CEE58 |
  LDA #$0018                                ; $0CEE5B |
  TSB !r_reg_hdmaen_mirror                  ; $0CEE5E |
  LDX $12                                   ; $0CEE61 |
  RTS                                       ; $0CEE63 |

  dw $0000, $0000, $0003, $FFF5             ; $0CEE64 |
  dw $0008, $FFEB, $000E, $FFE1             ; $0CEE6C |
  dw $0015, $FFDA, $001C, $FFD3             ; $0CEE74 |
  dw $0023, $FFCE, $002C, $FFC9             ; $0CEE7C |
  dw $0034, $FFC5, $003B, $FFC3             ; $0CEE84 |
  dw $0046, $FFC1, $0050, $FFC1             ; $0CEE8C |
  dw $005D, $FFC2, $0064, $FFC4             ; $0CEE94 |
  dw $006B, $FFC7, $0074, $FFCC             ; $0CEE9C |
  dw $007C, $FFD3, $0081, $FFD8             ; $0CEEA4 |
  dw $0086, $FFDF, $008B, $FFE9             ; $0CEEAC |
  dw $008E, $FFF3, $008F, $0000             ; $0CEEB4 |
  dw $008F, $0008, $008D, $0012             ; $0CEEBC |
  dw $008B, $0018, $0087, $0020             ; $0CEEC4 |
  dw $0081, $0029, $007C, $002E             ; $0CEECC |
  dw $0075, $0034, $006D, $0039             ; $0CEED4 |
  dw $0067, $003C, $005D, $003F             ; $0CEEDC |
  dw $0050, $0040, $0046, $0040             ; $0CEEE4 |
  dw $003B, $003E, $0032, $003B             ; $0CEEEC |
  dw $002A, $0037, $0023, $0033             ; $0CEEF4 |
  dw $001C, $002E, $0016, $0028             ; $0CEEFC |
  dw $0011, $0023, $000C, $001D             ; $0CEF04 |
  dw $0008, $0016, $0003, $000C             ; $0CEF0C |

  dw $0000, $0000, $0000, $FFFF             ; $0CEF14 |
  dw $0000, $FFFE, $0001, $FFFD             ; $0CEF1C |
  dw $0001, $FFFC, $0002, $FFFB             ; $0CEF24 |
  dw $0003, $FFFA, $0004, $FFFA             ; $0CEF2C |
  dw $0005, $FFF9, $0006, $FFF9             ; $0CEF34 |
  dw $0007, $FFF9, $0008, $FFF9             ; $0CEF3C |
  dw $0009, $FFF9, $000A, $FFF9             ; $0CEF44 |
  dw $000B, $FFFA, $000C, $FFFA             ; $0CEF4C |
  dw $000D, $FFFB, $000E, $FFFC             ; $0CEF54 |
  dw $000E, $FFFD, $000F, $FFFE             ; $0CEF5C |
  dw $000F, $FFFF, $000F, $0000             ; $0CEF64 |
  dw $000F, $0001, $000F, $0002             ; $0CEF6C |
  dw $000F, $0003, $000E, $0004             ; $0CEF74 |
  dw $000E, $0005, $000D, $0006             ; $0CEF7C |
  dw $000C, $0007, $000B, $0007             ; $0CEF84 |
  dw $000A, $0008, $0009, $0008             ; $0CEF8C |
  dw $0008, $0008, $0007, $0008             ; $0CEF94 |
  dw $0006, $0008, $0005, $0008             ; $0CEF9C |
  dw $0004, $0007, $0003, $0007             ; $0CEFA4 |
  dw $0002, $0006, $0001, $0005             ; $0CEFAC |
  dw $0001, $0004, $0000, $0003             ; $0CEFB4 |
  dw $0000, $0002, $0000, $0001             ; $0CEFBC |

init_balloon_pumper_with_red_balloon_bg3:
  JSL $03AE60                               ; $0CEFC4 |
  LDA $0CB2                                 ; $0CEFC8 |
  BNE CODE_0CEFD6                           ; $0CEFCB |
  LDA #$01B0                                ; $0CEFCD |
  JSL spawn_sprite_init                     ; $0CEFD0 |
  BCS CODE_0CEFDA                           ; $0CEFD4 |

CODE_0CEFD6:
  JML $03A31E                               ; $0CEFD6 |

CODE_0CEFDA:
  SEP #$20                                  ; $0CEFDA |
  LDA #$FF                                  ; $0CEFDC |
  STA !s_spr_stage_id,x                     ; $0CEFDE |
  REP #$20                                  ; $0CEFE1 |
  INC $0CB2                                 ; $0CEFE3 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CEFE6 |
  CLC                                       ; $0CEFE9 |
  ADC #$0010                                ; $0CEFEA |
  STA !s_spr_x_pixel_pos,y                  ; $0CEFED |
  LDA !s_spr_y_pixel_pos,x                  ; $0CEFF0 |
  CLC                                       ; $0CEFF3 |
  ADC #$0004                                ; $0CEFF4 |
  STA !s_spr_y_pixel_pos,y                  ; $0CEFF7 |
  STY !s_spr_wildcard_6_lo_dp,x             ; $0CEFFA |
  LDA #$0100                                ; $0CEFFC |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CEFFF |
  JML $028048                               ; $0CF001 |

main_balloon_pumper_with_red_balloon_bg3:
  LDA !s_spr_oam_pointer,x                  ; $0CF005 |
  INC A                                     ; $0CF008 |
  INC A                                     ; $0CF009 |
  STA !gsu_r5                               ; $0CF00A |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CF00D |
  STA !gsu_r6                               ; $0CF00F |
  LDX #$08                                  ; $0CF012 |
  LDA #$8ED3                                ; $0CF014 |
  JSL r_gsu_init_1                          ; $0CF017 | GSU init
  LDX $12                                   ; $0CF01B |
  REP #$10                                  ; $0CF01D |
  LDY $6002                                 ; $0CF01F |
  JSL $03AA60                               ; $0CF022 |
  SEP #$10                                  ; $0CF026 |
  LDY !s_spr_draw_priority,x                ; $0CF028 |
  BMI CODE_0CF036                           ; $0CF02B |
  LDA !r_msg_box_state                      ; $0CF02D |
  BNE CODE_0CF036                           ; $0CF030 |
  JSL $028048                               ; $0CF032 |

CODE_0CF036:
  JSL $03AF23                               ; $0CF036 |
  JSR CODE_0CF147                           ; $0CF03A |
  STZ $0E                                   ; $0CF03D |
  LDA !s_spr_y_player_delta,x               ; $0CF03F |
  CLC                                       ; $0CF042 |
  ADC $6000                                 ; $0CF043 |
  CMP #$0022                                ; $0CF046 |
  BPL CODE_0CF05C                           ; $0CF049 |
  STA !s_spr_y_player_delta,x               ; $0CF04B |
  JSL $03D129                               ; $0CF04E |
  LDA $0E                                   ; $0CF052 |
  BEQ CODE_0CF05C                           ; $0CF054 |
  LDA #$0400                                ; $0CF056 |
  STA !s_player_y_speed                     ; $0CF059 |

CODE_0CF05C:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CF05C |
  TYX                                       ; $0CF05E |
  JMP ($F062,x)                             ; $0CF05F |

  dw $F06C                                  ; $0CF062 |
  dw $F0A9                                  ; $0CF064 |
  dw $F135                                  ; $0CF066 |

  dw $FFFC, $FFE0                           ; $0CF068 |

  LDX $12                                   ; $0CF06C |
  LDA $0E                                   ; $0CF06E |
  BEQ CODE_0CF098                           ; $0CF070 |
  LDY #$00                                  ; $0CF072 |
  LDA !s_player_ground_pound_state          ; $0CF074 |
  BEQ CODE_0CF07E                           ; $0CF077 |
  STZ !s_player_ground_pound_state          ; $0CF079 |
  INY                                       ; $0CF07C |
  INY                                       ; $0CF07D |

CODE_0CF07E:
  STY !s_spr_wildcard_4_hi_dp,x             ; $0CF07E |
  LDA $F068,y                               ; $0CF080 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CF083 |
  STZ !s_spr_gsu_morph_1_lo,x               ; $0CF085 |
  LDA #$0096                                ; $0CF088 |\ play sound #$0096
  JSL push_sound_queue                      ; $0CF08B |/
  SEP #$20                                  ; $0CF08F |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CF091 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CF093 |
  REP #$20                                  ; $0CF095 |
  RTL                                       ; $0CF097 |

CODE_0CF098:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CF098 |
  CLC                                       ; $0CF09A |
  ADC #$0010                                ; $0CF09B |
  CMP #$0100                                ; $0CF09E |
  BCC CODE_0CF0A6                           ; $0CF0A1 |
  LDA #$0100                                ; $0CF0A3 |

CODE_0CF0A6:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CF0A6 |
  RTL                                       ; $0CF0A8 |

  LDX $12                                   ; $0CF0A9 |
  LDA $0E                                   ; $0CF0AB |
  BNE CODE_0CF0B8                           ; $0CF0AD |
  SEP #$20                                  ; $0CF0AF |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CF0B1 |
  DEC !s_spr_wildcard_4_lo_dp,x             ; $0CF0B3 |
  REP #$20                                  ; $0CF0B5 |
  RTL                                       ; $0CF0B7 |

CODE_0CF0B8:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CF0B8 |
  CLC                                       ; $0CF0BA |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0CF0BB |
  CMP #$0020                                ; $0CF0BD |
  BCS CODE_0CF0C5                           ; $0CF0C0 |
  LDA #$0020                                ; $0CF0C2 |

CODE_0CF0C5:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CF0C5 |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CF0C7 |
  CLC                                       ; $0CF0C9 |
  ADC #$0002                                ; $0CF0CA |
  CMP #$FFFC                                ; $0CF0CD |
  BMI CODE_0CF0D5                           ; $0CF0D0 |
  LDA #$FFFC                                ; $0CF0D2 |

CODE_0CF0D5:
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CF0D5 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CF0D7 |
  CMP #$0020                                ; $0CF0D9 |
  BEQ CODE_0CF134                           ; $0CF0DC |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CF0DE |
  EOR #$FFFF                                ; $0CF0E0 |
  INC A                                     ; $0CF0E3 |
  ASL A                                     ; $0CF0E4 |
  ASL A                                     ; $0CF0E5 |
  ASL A                                     ; $0CF0E6 |
  ASL A                                     ; $0CF0E7 |
  ASL A                                     ; $0CF0E8 |
  ASL A                                     ; $0CF0E9 |
  NOP                                       ; $0CF0EA |
  NOP                                       ; $0CF0EB |
  LDY !s_spr_wildcard_4_hi_dp,x             ; $0CF0EC |
  BEQ CODE_0CF0F1                           ; $0CF0EE |
  ASL A                                     ; $0CF0F0 |

CODE_0CF0F1:
  CLC                                       ; $0CF0F1 |
  ADC !s_spr_gsu_morph_1_lo,x               ; $0CF0F2 |
  STA $00                                   ; $0CF0F5 |
  AND #$00FF                                ; $0CF0F7 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CF0FA |
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0CF0FD |
  LDA !s_spr_state,y                        ; $0CF0FF |
  CMP #$0010                                ; $0CF102 |
  BNE CODE_0CF134                           ; $0CF105 |
  LDA !s_spr_id,y                           ; $0CF107 |
  CMP #$01B0                                ; $0CF10A |
  BNE CODE_0CF134                           ; $0CF10D |
  LDA !s_spr_wildcard_4_lo,y                ; $0CF10F |
  AND #$00FF                                ; $0CF112 |
  BNE CODE_0CF134                           ; $0CF115 |
  LDA $00                                   ; $0CF117 |
  AND #$FF00                                ; $0CF119 |
  XBA                                       ; $0CF11C |
  CLC                                       ; $0CF11D |
  ADC !s_spr_wildcard_3_lo,y                ; $0CF11E |
  CMP #$0100                                ; $0CF121 |
  BCC CODE_0CF131                           ; $0CF124 |
  SEP #$20                                  ; $0CF126 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CF128 |
  INC !s_spr_wildcard_4_lo_dp,x             ; $0CF12A |
  REP #$20                                  ; $0CF12C |
  LDA #$0100                                ; $0CF12E |

CODE_0CF131:
  STA !s_spr_wildcard_3_lo,y                ; $0CF131 |

CODE_0CF134:
  RTL                                       ; $0CF134 |

  LDX $12                                   ; $0CF135 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CF137 |
  CLC                                       ; $0CF139 |
  ADC !s_spr_wildcard_5_lo_dp,x             ; $0CF13A |
  CMP #$0020                                ; $0CF13C |
  BCS CODE_0CF144                           ; $0CF13F |
  LDA #$0020                                ; $0CF141 |

CODE_0CF144:
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CF144 |
  RTL                                       ; $0CF146 |

CODE_0CF147:
  LDA !s_spr_cam_x_pos,x                    ; $0CF147 |
  CLC                                       ; $0CF14A |
  ADC #$0050                                ; $0CF14B |
  CMP #$0190                                ; $0CF14E |
  BCS CODE_0CF160                           ; $0CF151 |
  LDA !s_spr_cam_y_pos,x                    ; $0CF153 |
  CLC                                       ; $0CF156 |
  ADC #$0050                                ; $0CF157 |
  CMP #$0190                                ; $0CF15A |
  BCS CODE_0CF160                           ; $0CF15D |

CODE_0CF15F:
  RTS                                       ; $0CF15F |

CODE_0CF160:
  LDY !s_spr_wildcard_6_lo_dp,x             ; $0CF160 |
  LDA !s_spr_state,y                        ; $0CF162 |
  CMP #$0010                                ; $0CF165 |
  BNE CODE_0CF177                           ; $0CF168 |
  LDA !s_spr_id,y                           ; $0CF16A |
  CMP #$01B0                                ; $0CF16D |
  BNE CODE_0CF177                           ; $0CF170 |
  LDA !s_spr_wildcard_4_lo,y                ; $0CF172 |
  BEQ CODE_0CF15F                           ; $0CF175 |

CODE_0CF177:
  PLA                                       ; $0CF177 |
  JML $03A31E                               ; $0CF178 |

  db $00, $01, $02, $03, $04, $05, $00, $01 ; $0CF17C |
  db $02, $03, $04, $05, $00, $01, $02, $03 ; $0CF184 |

init_train_bandit:
  SEP #$20                                  ; $0CF18C |
  LDA $10                                   ; $0CF18E |
  AND #$0F                                  ; $0CF190 |
  TAY                                       ; $0CF192 |
  LDA $F17C,y                               ; $0CF193 |
  STA !s_spr_anim_frame,x                   ; $0CF196 |
  REP #$20                                  ; $0CF199 |
  RTL                                       ; $0CF19B |

; gsu table
  db $FF, $00, $1F, $FF, $02, $1F, $00, $00 ; $0CF19C |
  db $20, $00, $00, $21, $00, $00, $22, $00 ; $0CF1A4 |
  db $00, $23, $00, $00, $24, $00, $00, $25 ; $0CF1AC |
  db $00, $00, $26, $00, $00, $27, $00, $00 ; $0CF1B4 |
  db $28, $FF, $01, $68, $FF, $02, $68, $FF ; $0CF1BC |
  db $01, $69, $FF, $02, $69, $FF, $01, $71 ; $0CF1C4 |
  db $FF, $02, $71, $FF, $C2, $00, $00, $00 ; $0CF1CC |
  db $9E                                    ; $0CF1D4 |

main_train_bandit:
  JSL $03AF23                               ; $0CF1D5 |
  LDA !s_player_form                        ; $0CF1D9 |
  CMP #$0008                                ; $0CF1DC |
  BNE CODE_0CF1EB                           ; $0CF1DF |
  LDA !s_player_invincibility_timer         ; $0CF1E1 |
  BNE CODE_0CF1EB                           ; $0CF1E4 |
  LDA !s_player_transform_misc              ; $0CF1E6 |
  BNE CODE_0CF1FB                           ; $0CF1E9 |

CODE_0CF1EB:
  STZ !s_spr_timer_2,x                      ; $0CF1EB |
  STZ !s_spr_x_speed_lo,x                   ; $0CF1EE |
  STZ !s_spr_y_speed_lo,x                   ; $0CF1F1 |
  LDA #$0040                                ; $0CF1F4 |
  STA !s_spr_timer_3,x                      ; $0CF1F7 |

CODE_0CF1FA:
  RTL                                       ; $0CF1FA |

CODE_0CF1FB:
  LDA !s_spr_timer_3,x                      ; $0CF1FB |
  BNE CODE_0CF1FA                           ; $0CF1FE |
  JSR CODE_0CF2F9                           ; $0CF200 |
  JSR CODE_0CF260                           ; $0CF203 |
  JSR CODE_0CF2A1                           ; $0CF206 |
  LDY #$00                                  ; $0CF209 |
  LDA !s_spr_x_speed_lo,x                   ; $0CF20B |
  BPL CODE_0CF214                           ; $0CF20E |
  EOR #$FFFF                                ; $0CF210 |
  INC A                                     ; $0CF213 |

CODE_0CF214:
  STA $00                                   ; $0CF214 |
  LDA !s_spr_y_speed_lo,x                   ; $0CF216 |
  BPL CODE_0CF21F                           ; $0CF219 |
  EOR #$FFFF                                ; $0CF21B |
  INC A                                     ; $0CF21E |

CODE_0CF21F:
  CMP $00                                   ; $0CF21F |
  BPL CODE_0CF234                           ; $0CF221 |
  PHY                                       ; $0CF223 |
  LDY #$00                                  ; $0CF224 |
  LDA !s_spr_x_speed_lo,x                   ; $0CF226 |
  BMI CODE_0CF22D                           ; $0CF229 |
  INY                                       ; $0CF22B |
  INY                                       ; $0CF22C |

CODE_0CF22D:
  TYA                                       ; $0CF22D |
  STA !s_spr_facing_dir,x                   ; $0CF22E |
  PLY                                       ; $0CF231 |
  BRA CODE_0CF23D                           ; $0CF232 |

CODE_0CF234:
  INY                                       ; $0CF234 |
  INY                                       ; $0CF235 |
  LDA !s_spr_y_speed_lo,x                   ; $0CF236 |
  BMI CODE_0CF23D                           ; $0CF239 |
  INY                                       ; $0CF23B |
  INY                                       ; $0CF23C |

CODE_0CF23D:
  TYA                                       ; $0CF23D |
  STA $00                                   ; $0CF23E |
  LDA !s_spr_anim_frame,x                   ; $0CF240 |
  AND #$0001                                ; $0CF243 |
  ORA $00                                   ; $0CF246 |
  STA !s_spr_anim_frame,x                   ; $0CF248 |
  LDA !s_spr_timer_1,x                      ; $0CF24B |
  BNE CODE_0CF25F                           ; $0CF24E |
  LDA !s_spr_anim_frame,x                   ; $0CF250 |
  EOR #$0001                                ; $0CF253 |
  STA !s_spr_anim_frame,x                   ; $0CF256 |
  LDA #$0008                                ; $0CF259 |
  STA !s_spr_timer_1,x                      ; $0CF25C |

CODE_0CF25F:
  RTL                                       ; $0CF25F |

CODE_0CF260:
  LDA !s_spr_timer_2,x                      ; $0CF260 |
  BNE CODE_0CF2A0                           ; $0CF263 |
  LDA !s_player_center_x                    ; $0CF265 |
  STA !gsu_r1                               ; $0CF268 |
  LDA !s_player_center_y                    ; $0CF26B |
  STA !gsu_r2                               ; $0CF26E |
  LDA !s_spr_x_hitbox_center,x              ; $0CF271 |
  STA !gsu_r3                               ; $0CF274 |
  LDA !s_spr_y_hitbox_center,x              ; $0CF277 |
  STA !gsu_r4                               ; $0CF27A |
  LDA #$0080                                ; $0CF27D |
  STA !gsu_r6                               ; $0CF280 |
  LDX #$09                                  ; $0CF283 |
  LDA #$907C                                ; $0CF285 |
  JSL r_gsu_init_1                          ; $0CF288 | GSU init
  LDX $12                                   ; $0CF28C |
  LDA !gsu_r1                               ; $0CF28E |
  STA !s_spr_x_speed_lo,x                   ; $0CF291 |
  LDA !gsu_r2                               ; $0CF294 |
  STA !s_spr_y_speed_lo,x                   ; $0CF297 |
  LDA #$0008                                ; $0CF29A |
  STA !s_spr_timer_2,x                      ; $0CF29D |

CODE_0CF2A0:
  RTS                                       ; $0CF2A0 |

CODE_0CF2A1:
  LDY !s_spr_collision_id,x                 ; $0CF2A1 |
  BPL CODE_0CF2AA                           ; $0CF2A4 |
  JSL player_hit_sprite                     ; $0CF2A6 |

CODE_0CF2AA:
  PHX                                       ; $0CF2AA |
  TXA                                       ; $0CF2AB |
  STA !gsu_r1                               ; $0CF2AC |
  LDX #$09                                  ; $0CF2AF |
  LDA #$9011                                ; $0CF2B1 |
  JSL r_gsu_init_1                          ; $0CF2B4 | GSU init
  PLX                                       ; $0CF2B8 |
  LDY !gsu_r14                              ; $0CF2B9 |
  BMI CODE_0CF2A0                           ; $0CF2BC |
  BEQ CODE_0CF2A0                           ; $0CF2BE |
  LDA !s_spr_id,y                           ; $0CF2C0 |
  CMP #$0072                                ; $0CF2C3 |
  BNE CODE_0CF2A0                           ; $0CF2C6 |
  LDA !s_spr_x_hitbox_center,x              ; $0CF2C8 |
  SEC                                       ; $0CF2CB |
  SBC !s_spr_x_hitbox_center,y              ; $0CF2CC |
  EOR !s_spr_x_speed_lo,x                   ; $0CF2CF |
  BPL CODE_0CF2DE                           ; $0CF2D2 |
  LDA !s_spr_x_speed_lo,x                   ; $0CF2D4 |
  EOR #$FFFF                                ; $0CF2D7 |
  INC A                                     ; $0CF2DA |
  STA !s_spr_x_speed_lo,x                   ; $0CF2DB |

CODE_0CF2DE:
  LDA !s_spr_y_hitbox_center,x              ; $0CF2DE |
  SEC                                       ; $0CF2E1 |
  SBC !s_spr_y_hitbox_center,y              ; $0CF2E2 |
  EOR !s_spr_y_speed_lo,x                   ; $0CF2E5 |
  BPL CODE_0CF2F4                           ; $0CF2E8 |
  LDA !s_spr_y_speed_lo,x                   ; $0CF2EA |
  EOR #$FFFF                                ; $0CF2ED |
  INC A                                     ; $0CF2F0 |
  STA !s_spr_y_speed_lo,x                   ; $0CF2F1 |

CODE_0CF2F4:
  RTS                                       ; $0CF2F4 |

  dw $0001, $FFFF                           ; $0CF2F5 |

CODE_0CF2F9:
  LDA #$000C                                ; $0CF2F9 |
  STA !gsu_r0                               ; $0CF2FC |
  LDA #$F19C                                ; $0CF2FF |
  STA !gsu_r1                               ; $0CF302 |
  LDA #$0013                                ; $0CF305 |
  STA !gsu_r2                               ; $0CF308 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CF30B |
  STA !gsu_r3                               ; $0CF30E |
  LDX #$0A                                  ; $0CF311 |
  LDA #$E9AE                                ; $0CF313 |
  JSL r_gsu_init_1                          ; $0CF316 | GSU init
  LDX $12                                   ; $0CF31A |
  LDA !gsu_r0                               ; $0CF31C |
  AND #$000F                                ; $0CF31F |
  CMP #$000F                                ; $0CF322 |
  BEQ CODE_0CF386                           ; $0CF325 |
  LDY #$00                                  ; $0CF327 |
  AND #$0008                                ; $0CF329 |
  BNE CODE_0CF333                           ; $0CF32C |
  LDA !s_spr_x_speed_lo,x                   ; $0CF32E |
  BMI CODE_0CF342                           ; $0CF331 |

CODE_0CF333:
  INY                                       ; $0CF333 |
  INY                                       ; $0CF334 |
  LDA !gsu_r0                               ; $0CF335 |
  AND #$0004                                ; $0CF338 |
  BNE CODE_0CF355                           ; $0CF33B |
  LDA !s_spr_x_speed_lo,x                   ; $0CF33D |
  BMI CODE_0CF355                           ; $0CF340 |

CODE_0CF342:
  EOR #$FFFF                                ; $0CF342 |
  INC A                                     ; $0CF345 |
  STA !s_spr_x_speed_lo,x                   ; $0CF346 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF349 |
  CLC                                       ; $0CF34C |
  ADC $F2F5,y                               ; $0CF34D |
  STA !s_spr_x_pixel_pos,x                  ; $0CF350 |
  BRA CODE_0CF384                           ; $0CF353 |

CODE_0CF355:
  LDY #$00                                  ; $0CF355 |
  LDA !gsu_r0                               ; $0CF357 |
  AND #$0002                                ; $0CF35A |
  BNE CODE_0CF364                           ; $0CF35D |
  LDA !s_spr_y_speed_lo,x                   ; $0CF35F |
  BMI CODE_0CF373                           ; $0CF362 |

CODE_0CF364:
  INY                                       ; $0CF364 |
  INY                                       ; $0CF365 |
  LDA !gsu_r0                               ; $0CF366 |
  AND #$0001                                ; $0CF369 |
  BNE CODE_0CF386                           ; $0CF36C |
  LDA !s_spr_y_speed_lo,x                   ; $0CF36E |
  BMI CODE_0CF386                           ; $0CF371 |

CODE_0CF373:
  EOR #$FFFF                                ; $0CF373 |
  INC A                                     ; $0CF376 |
  STA !s_spr_y_speed_lo,x                   ; $0CF377 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF37A |
  CLC                                       ; $0CF37D |
  ADC $F2F5,y                               ; $0CF37E |
  STA !s_spr_y_pixel_pos,x                  ; $0CF381 |

CODE_0CF384:
  PLA                                       ; $0CF384 |
  RTL                                       ; $0CF385 |

CODE_0CF386:
  RTS                                       ; $0CF386 |

  dw $FFC0, $0040                           ; $0CF387 |

; whirly and carrying red coin
init_fly_guy:
  LDY !s_spr_wildcard_1_lo,x                ; $0CF38B |
  BNE CODE_0CF3BF                           ; $0CF38E |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF390 |
  ASL A                                     ; $0CF393 |
  ASL A                                     ; $0CF394 |
  ASL A                                     ; $0CF395 |
  ASL A                                     ; $0CF396 |
  AND #$FF00                                ; $0CF397 |
  ORA #$8000                                ; $0CF39A |
  STA $00                                   ; $0CF39D |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF39F |
  LSR A                                     ; $0CF3A2 |
  LSR A                                     ; $0CF3A3 |
  LSR A                                     ; $0CF3A4 |
  LSR A                                     ; $0CF3A5 |
  AND #$00FF                                ; $0CF3A6 |
  ORA $00                                   ; $0CF3A9 |
  STA !s_spr_wildcard_2_lo,x                ; $0CF3AB |
  SEP #$20                                  ; $0CF3AE |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF3B0 |
  AND #$10                                  ; $0CF3B3 |
  LSR A                                     ; $0CF3B5 |
  LSR A                                     ; $0CF3B6 |
  LSR A                                     ; $0CF3B7 |
  INC A                                     ; $0CF3B8 |
  STA !s_spr_wildcard_1_lo,x                ; $0CF3B9 |
  TAY                                       ; $0CF3BC |
  REP #$20                                  ; $0CF3BD |

CODE_0CF3BF:
  DEY                                       ; $0CF3BF |
  TYX                                       ; $0CF3C0 |
  JMP ($F3C4,x)                             ; $0CF3C1 |

  dw $F3C8                                  ; $0CF3C4 |
  dw $F405                                  ; $0CF3C6 |

  LDX $12                                   ; $0CF3C8 |
  JSL $03D3F8                               ; $0CF3CA |
  BEQ CODE_0CF3D4                           ; $0CF3CE |
  JML $03A31E                               ; $0CF3D0 |

CODE_0CF3D4:
  LDA !s_spr_x_pixel_pos,x                  ; $0CF3D4 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CF3D7 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF3DA |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CF3DD |
  LDY !s_spr_facing_dir,x                   ; $0CF3E0 |
  LDA $F387,y                               ; $0CF3E3 |
  STA !s_spr_x_speed_lo,x                   ; $0CF3E6 |
  LDA #$0080                                ; $0CF3E9 |
  STA !s_spr_y_accel_ceiling,x              ; $0CF3EC |
  LDA #$0004                                ; $0CF3EF |
  STA !s_spr_y_accel,x                      ; $0CF3F2 |
  LDA #$3106                                ; $0CF3F5 |
  STA !s_spr_oam_1,x                        ; $0CF3F8 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF3FB |
  ORA #$0002                                ; $0CF3FE |
  STA !s_spr_oam_yxppccct,x                 ; $0CF401 |
  RTL                                       ; $0CF404 |

  LDX $12                                   ; $0CF405 |
  LDA #$0020                                ; $0CF407 |
  STA !s_spr_y_accel,x                      ; $0CF40A |
  LDA #$0200                                ; $0CF40D |
  STA !s_spr_y_accel_ceiling,x              ; $0CF410 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CF413 |
  ORA #$0001                                ; $0CF416 |
  STA !s_spr_bitwise_settings_3,x           ; $0CF419 |
  LDA #$2906                                ; $0CF41C |
  STA !s_spr_oam_1,x                        ; $0CF41F |
  RTL                                       ; $0CF422 |

  dw $F87B                                  ; $0CF423 |
  dw $F8F3                                  ; $0CF425 |

  dw $0200, $FE00                           ; $0CF427 |

; whirly and carrying red coin
main_fly_guy:
  LDY !s_spr_draw_priority,x                ; $0CF42B |
  BMI CODE_0CF44B                           ; $0CF42E |
  LDY !s_spr_wildcard_1_lo,x                ; $0CF430 |
  DEY                                       ; $0CF433 |
  LDA #$000C                                ; $0CF434 |
  STA !gsu_r0                               ; $0CF437 |
  LDA $F423,y                               ; $0CF43A |
  STA !gsu_r1                               ; $0CF43D |
  LDX #$09                                  ; $0CF440 |
  LDA #$AEC1                                ; $0CF442 |
  JSL r_gsu_init_1                          ; $0CF445 | GSU init
  LDX $12                                   ; $0CF449 |

CODE_0CF44B:
  LDA !s_spr_state,x                        ; $0CF44B |
  CMP #$0008                                ; $0CF44E |
  BNE CODE_0CF45B                           ; $0CF451 |
  LDY !s_spr_wildcard_1_lo,x                ; $0CF453 |
  DEY                                       ; $0CF456 |
  TYX                                       ; $0CF457 |
  JMP ($F7B4,x)                             ; $0CF458 |

CODE_0CF45B:
  LDY !s_spr_wildcard_1_lo,x                ; $0CF45B |
  DEY                                       ; $0CF45E |
  BNE CODE_0CF464                           ; $0CF45F |
  JSR CODE_0CF477                           ; $0CF461 |

CODE_0CF464:
  JSL $03AF23                               ; $0CF464 |
  JSR CODE_0CF6D0                           ; $0CF468 |
  LDY !s_spr_wildcard_1_lo,x                ; $0CF46B |
  DEY                                       ; $0CF46E |
  TYX                                       ; $0CF46F |
  JMP ($F473,x)                             ; $0CF470 |

  dw $F4D9                                  ; $0CF473 |
  dw $F5EC                                  ; $0CF475 |

CODE_0CF477:
  LDA !s_spr_state,x                        ; $0CF477 |
  CMP #$0010                                ; $0CF47A |
  BEQ CODE_0CF4B0                           ; $0CF47D |
  LDA #$0115                                ; $0CF47F |
  JSL spawn_sprite_active                   ; $0CF482 |
  BCC CODE_0CF4B1                           ; $0CF486 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF488 |
  STA !s_spr_x_pixel_pos,y                  ; $0CF48B |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF48E |
  CLC                                       ; $0CF491 |
  ADC #$0010                                ; $0CF492 |
  STA !s_spr_y_pixel_pos,y                  ; $0CF495 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF498 |
  AND #$FFF1                                ; $0CF49B |
  ORA #$0002                                ; $0CF49E |
  STA !s_spr_oam_yxppccct,y                 ; $0CF4A1 |
  LDA #$0002                                ; $0CF4A4 |
  STA !s_spr_state,y                        ; $0CF4A7 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CF4AA |
  STA !s_spr_wildcard_2_lo,y                ; $0CF4AD |

CODE_0CF4B0:
  RTS                                       ; $0CF4B0 |

CODE_0CF4B1:
  LDA #$0115                                ; $0CF4B1 |
  TXY                                       ; $0CF4B4 |
  JSL $03A377                               ; $0CF4B5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF4B9 |
  CLC                                       ; $0CF4BC |
  ADC #$0010                                ; $0CF4BD |
  STA !s_spr_y_pixel_pos,x                  ; $0CF4C0 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF4C3 |
  AND #$FFF1                                ; $0CF4C6 |
  ORA #$0002                                ; $0CF4C9 |
  STA !s_spr_oam_yxppccct,x                 ; $0CF4CC |
  LDA #$0002                                ; $0CF4CF |
  STA !s_spr_state,x                        ; $0CF4D2 |
  PLA                                       ; $0CF4D5 |
  PLY                                       ; $0CF4D6 |
  PLA                                       ; $0CF4D7 |
  RTL                                       ; $0CF4D8 |

  LDX $12                                   ; $0CF4D9 |
  JSR CODE_0CF52B                           ; $0CF4DB |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CF4DE |
  SEC                                       ; $0CF4E1 |
  SBC #$0020                                ; $0CF4E2 |
  CMP !s_spr_x_pixel_pos,x                  ; $0CF4E5 |
  BMI CODE_0CF4EF                           ; $0CF4E8 |
  LDA #$0002                                ; $0CF4EA |
  BRA CODE_0CF4FB                           ; $0CF4ED |

CODE_0CF4EF:
  CLC                                       ; $0CF4EF |
  ADC #$0040                                ; $0CF4F0 |
  CMP !s_spr_x_pixel_pos,x                  ; $0CF4F3 |
  BPL CODE_0CF505                           ; $0CF4F6 |
  LDA #$0000                                ; $0CF4F8 |

CODE_0CF4FB:
  STA !s_spr_facing_dir,x                   ; $0CF4FB |
  TAY                                       ; $0CF4FE |
  LDA $F387,y                               ; $0CF4FF |
  STA !s_spr_x_speed_lo,x                   ; $0CF502 |

CODE_0CF505:
  JMP CODE_0CF6AB                           ; $0CF505 |

CODE_0CF508:
  LDA !s_spr_y_player_delta,x               ; $0CF508 |
  SEC                                       ; $0CF50B |
  SBC !s_player_hitbox_half_height          ; $0CF50C |
  SEC                                       ; $0CF50F |
  SBC !s_spr_hitbox_height,x                ; $0CF510 |
  CMP #$FFF8                                ; $0CF513 |
  BCC CODE_0CF526                           ; $0CF516 |
  LDA #$003A                                ; $0CF518 |\ play sound #$003A
  JSL push_sound_queue                      ; $0CF51B |/
  JSL $03B20B                               ; $0CF51F |
  JMP CODE_0CF5C4                           ; $0CF523 |

CODE_0CF526:
  JSL player_hit_sprite                     ; $0CF526 |

CODE_0CF52A:
  RTS                                       ; $0CF52A |

CODE_0CF52B:
  LDY !s_spr_collision_id,x                 ; $0CF52B |
  BMI CODE_0CF508                           ; $0CF52E |
  DEY                                       ; $0CF530 |
  BMI CODE_0CF52A                           ; $0CF531 |
  BEQ CODE_0CF52A                           ; $0CF533 |
  LDA !s_spr_state,y                        ; $0CF535 |
  CMP #$0010                                ; $0CF538 |
  BNE CODE_0CF52A                           ; $0CF53B |
  LDA !s_spr_collision_state,y              ; $0CF53D |
  BEQ CODE_0CF52A                           ; $0CF540 |
  STZ $00                                   ; $0CF542 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF544 |
  CMP !s_spr_x_pixel_pos,y                  ; $0CF547 |
  BMI CODE_0CF550                           ; $0CF54A |
  INC $00                                   ; $0CF54C |
  INC $00                                   ; $0CF54E |

CODE_0CF550:
  TYX                                       ; $0CF550 |
  JSL $03B25B                               ; $0CF551 |
  LDX $12                                   ; $0CF555 |
  LDA #$0009                                ; $0CF557 |\ play sound #$0009
  JSL push_sound_queue                      ; $0CF55A |/
  SEP #$20                                  ; $0CF55E |
  LDA #$FF                                  ; $0CF560 |
  STA !s_spr_stage_id,x                     ; $0CF562 |
  REP #$20                                  ; $0CF565 |
  LDA #$0115                                ; $0CF567 |
  JSL spawn_sprite_active                   ; $0CF56A |
  BCC CODE_0CF5C4                           ; $0CF56E |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF570 |
  STA !s_spr_x_pixel_pos,y                  ; $0CF573 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF576 |
  CLC                                       ; $0CF579 |
  ADC #$0010                                ; $0CF57A |
  STA !s_spr_y_pixel_pos,y                  ; $0CF57D |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF580 |
  AND #$FFF1                                ; $0CF583 |
  ORA #$0002                                ; $0CF586 |
  STA !s_spr_oam_yxppccct,y                 ; $0CF589 |
  LDA #$0002                                ; $0CF58C |
  STA !s_spr_state,y                        ; $0CF58F |
  LDA !s_spr_wildcard_2_lo,x                ; $0CF592 |
  STA !s_spr_wildcard_2_lo,y                ; $0CF595 |
  LDA #$000E                                ; $0CF598 |
  STA !s_spr_state,x                        ; $0CF59B |
  LDA !s_spr_oam_1,x                        ; $0CF59E |
  SEC                                       ; $0CF5A1 |
  SBC #$0800                                ; $0CF5A2 |
  STA !s_spr_oam_1,x                        ; $0CF5A5 |
  LDA #$0020                                ; $0CF5A8 |
  STA !s_spr_y_accel,x                      ; $0CF5AB |
  LDA #$FE00                                ; $0CF5AE |
  STA !s_spr_y_accel_ceiling,x              ; $0CF5B1 |
  LDY $00                                   ; $0CF5B4 |
  LDA $F427,y                               ; $0CF5B6 |
  STA !s_spr_x_accel_ceiling,x              ; $0CF5B9 |
  LDA #$0002                                ; $0CF5BC |
  STA !s_spr_timer_2,x                      ; $0CF5BF |
  PLA                                       ; $0CF5C2 |
  RTL                                       ; $0CF5C3 |

CODE_0CF5C4:
  LDA #$0115                                ; $0CF5C4 |
  TXY                                       ; $0CF5C7 |
  JSL $03A377                               ; $0CF5C8 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF5CC |
  CLC                                       ; $0CF5CF |
  ADC #$0010                                ; $0CF5D0 |
  STA !s_spr_y_pixel_pos,x                  ; $0CF5D3 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF5D6 |
  AND #$FFF1                                ; $0CF5D9 |
  ORA #$0002                                ; $0CF5DC |
  STA !s_spr_oam_yxppccct,x                 ; $0CF5DF |
  LDA #$0002                                ; $0CF5E2 |
  STA !s_spr_state,x                        ; $0CF5E5 |
  PLA                                       ; $0CF5E8 |
  JMP CODE_0CFF61                           ; $0CF5E9 |
  LDX $12                                   ; $0CF5EC |
  JSR CODE_0CF6E6                           ; $0CF5EE |
  SEP #$20                                  ; $0CF5F1 |
  LDA !s_spr_wildcard_3_hi_dp,x             ; $0CF5F3 |
  INC A                                     ; $0CF5F5 |
  INC A                                     ; $0CF5F6 |
  AND #$0E                                  ; $0CF5F7 |
  STA !s_spr_wildcard_3_hi_dp,x             ; $0CF5F9 |
  TAY                                       ; $0CF5FB |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF5FC |
  AND #$F1                                  ; $0CF5FF |
  ORA !s_spr_wildcard_3_hi_dp,x             ; $0CF601 |
  STA !s_spr_oam_yxppccct,x                 ; $0CF603 |
  REP #$20                                  ; $0CF606 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CF608 |
  TYX                                       ; $0CF60A |
  JMP ($F60E,x)                             ; $0CF60B |

  dw $F614                                  ; $0CF60E |
  dw $F66A                                  ; $0CF610 |
  dw $F698                                  ; $0CF612 |

  LDX $12                                   ; $0CF614 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF616 |
  SEC                                       ; $0CF619 |
  SBC !s_player_x                           ; $0CF61A |
  CLC                                       ; $0CF61D |
  ADC #$0050                                ; $0CF61E |
  CMP #$00A0                                ; $0CF621 |
  BCS CODE_0CF665                           ; $0CF624 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF626 |
  SEC                                       ; $0CF629 |
  SBC !s_player_y                           ; $0CF62A |
  CLC                                       ; $0CF62D |
  ADC #$0040                                ; $0CF62E |
  CMP #$0080                                ; $0CF631 |
  BCS CODE_0CF665                           ; $0CF634 |
  STZ !s_spr_y_accel,x                      ; $0CF636 |
  STZ !s_spr_y_accel_ceiling,x              ; $0CF639 |
  LDA !s_spr_bitwise_settings_3,x           ; $0CF63C |
  AND #$FFE0                                ; $0CF63F |
  STA !s_spr_bitwise_settings_3,x           ; $0CF642 |
  LDA #$FF00                                ; $0CF645 |
  STA !s_spr_y_speed_lo,x                   ; $0CF648 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF64B |
  SEC                                       ; $0CF64E |
  SBC #$0060                                ; $0CF64F |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CF652 |
  LDY !s_spr_x_player_dir,x                 ; $0CF655 |
  TYA                                       ; $0CF658 |
  EOR #$0002                                ; $0CF659 |
  STA !s_spr_facing_dir,x                   ; $0CF65C |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CF65F |
  INY                                       ; $0CF661 |
  INY                                       ; $0CF662 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0CF663 |

CODE_0CF665:
  RTL                                       ; $0CF665 |

  dw $FFC0, $0040                           ; $0CF666 |

  LDX $12                                   ; $0CF66A |
  LDY !s_spr_x_player_dir,x                 ; $0CF66C |
  TYA                                       ; $0CF66F |
  EOR #$0002                                ; $0CF670 |
  STA !s_spr_facing_dir,x                   ; $0CF673 |
  TAY                                       ; $0CF676 |
  LDA $F666,y                               ; $0CF677 |
  STA !s_spr_x_speed_lo,x                   ; $0CF67A |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF67D |
  CMP !s_spr_gsu_morph_2_lo,x               ; $0CF680 |
  BPL CODE_0CF697                           ; $0CF683 |
  LDA #$0080                                ; $0CF685 |
  STA !s_spr_y_accel_ceiling,x              ; $0CF688 |
  LDA #$0004                                ; $0CF68B |
  STA !s_spr_y_accel,x                      ; $0CF68E |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CF691 |
  INY                                       ; $0CF693 |
  INY                                       ; $0CF694 |
  STY !s_spr_wildcard_3_lo_dp,x             ; $0CF695 |

CODE_0CF697:
  RTL                                       ; $0CF697 |

  LDX $12                                   ; $0CF698 |
  LDY !s_spr_x_player_dir,x                 ; $0CF69A |
  TYA                                       ; $0CF69D |
  EOR #$0002                                ; $0CF69E |
  STA !s_spr_facing_dir,x                   ; $0CF6A1 |
  TAY                                       ; $0CF6A4 |
  LDA $F666,y                               ; $0CF6A5 |
  STA !s_spr_x_speed_lo,x                   ; $0CF6A8 |

CODE_0CF6AB:
  LDA !s_spr_y_speed_lo,x                   ; $0CF6AB |
  EOR !s_spr_y_accel_ceiling,x              ; $0CF6AE |
  BMI CODE_0CF6CF                           ; $0CF6B1 |
  LDA !s_spr_y_speed_lo,x                   ; $0CF6B3 |
  SEC                                       ; $0CF6B6 |
  SBC !s_spr_y_accel_ceiling,x              ; $0CF6B7 |
  BPL CODE_0CF6C0                           ; $0CF6BA |
  EOR #$FFFF                                ; $0CF6BC |
  INC A                                     ; $0CF6BF |

CODE_0CF6C0:
  CMP !s_spr_y_accel,x                      ; $0CF6C0 |
  BCS CODE_0CF6CF                           ; $0CF6C3 |
  LDA !s_spr_y_accel_ceiling,x              ; $0CF6C5 |
  EOR #$FFFF                                ; $0CF6C8 |
  INC A                                     ; $0CF6CB |
  STA !s_spr_y_accel_ceiling,x              ; $0CF6CC |

CODE_0CF6CF:
  RTL                                       ; $0CF6CF |

CODE_0CF6D0:
  LDA !s_spr_timer_1,x                      ; $0CF6D0 |
  BNE CODE_0CF6E5                           ; $0CF6D3 |
  LDA #$0001                                ; $0CF6D5 |
  STA !s_spr_timer_1,x                      ; $0CF6D8 |
  LDA !s_spr_anim_frame,x                   ; $0CF6DB |
  INC A                                     ; $0CF6DE |
  AND #$0003                                ; $0CF6DF |
  STA !s_spr_anim_frame,x                   ; $0CF6E2 |

CODE_0CF6E5:
  RTS                                       ; $0CF6E5 |

CODE_0CF6E6:
  LDY !s_spr_collision_id,x                 ; $0CF6E6 |
  BMI CODE_0CF729                           ; $0CF6E9 |
  DEY                                       ; $0CF6EB |
  BMI CODE_0CF728                           ; $0CF6EC |
  BEQ CODE_0CF728                           ; $0CF6EE |
  LDA !s_spr_state,y                        ; $0CF6F0 |
  CMP #$0010                                ; $0CF6F3 |
  BNE CODE_0CF728                           ; $0CF6F6 |
  LDA !s_spr_collision_state,y              ; $0CF6F8 |
  BEQ CODE_0CF728                           ; $0CF6FB |
  TYX                                       ; $0CF6FD |
  JSL $03B25B                               ; $0CF6FE |
  LDX $12                                   ; $0CF702 |
  LDA #$008F                                ; $0CF704 |\ play sound #$008F
  JSL push_sound_queue                      ; $0CF707 |/
  SEP #$20                                  ; $0CF70B |
  LDA #$FF                                  ; $0CF70D |
  STA !s_spr_stage_id,x                     ; $0CF70F |
  REP #$20                                  ; $0CF712 |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CF714 |
  BNE CODE_0CF71C                           ; $0CF716 |
  JSL $0CF636                               ; $0CF718 |

CODE_0CF71C:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CF71C |
  CPY #$05                                  ; $0CF71E |
  BCS CODE_0CF725                           ; $0CF720 |
  INY                                       ; $0CF722 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CF723 |

CODE_0CF725:
  JSR CODE_0CF752                           ; $0CF725 |

CODE_0CF728:
  RTS                                       ; $0CF728 |

CODE_0CF729:
  JSL player_hit_sprite                     ; $0CF729 |
  RTS                                       ; $0CF72D |

  dw $0200, $0202                           ; $0CF72E |

  dw $0000, $0060, $0000, $FFA0             ; $0CF732 |
  dw $0080, $FF80                           ; $0CF73A |

  dw $0000, $FD60, $FD00, $FD60             ; $0CF73E |
  dw $FE00, $FE00, $0000, $0009             ; $0CF746 |
  dw $0009, $0018                           ; $0CF74E |

CODE_0CF752:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CF752 |
  BEQ CODE_0CF7A3                           ; $0CF754 |
  CPY #$04                                  ; $0CF756 |
  BCS CODE_0CF7A4                           ; $0CF758 |
  LDA $F74A,y                               ; $0CF75A |
  PHY                                       ; $0CF75D |
  JSL push_sound_queue                      ; $0CF75E |
  PLY                                       ; $0CF762 |
  LDA $F72E,y                               ; $0CF763 |
  TAY                                       ; $0CF766 |

CODE_0CF767:
  PHY                                       ; $0CF767 |
  LDA $F732,y                               ; $0CF768 |
  STA $00                                   ; $0CF76B |
  LDA $F73E,y                               ; $0CF76D |
  STA $02                                   ; $0CF770 |
  LDY !s_spr_facing_dir,x                   ; $0CF772 |
  BEQ CODE_0CF77F                           ; $0CF775 |
  LDA $00                                   ; $0CF777 |
  EOR #$FFFF                                ; $0CF779 |
  INC A                                     ; $0CF77C |
  STA $00                                   ; $0CF77D |

CODE_0CF77F:
  LDA #$0115                                ; $0CF77F |
  JSL spawn_sprite_init                     ; $0CF782 |
  BCC CODE_0CF79E                           ; $0CF786 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF788 |
  STA !s_spr_x_pixel_pos,y                  ; $0CF78B |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF78E |
  STA !s_spr_y_pixel_pos,y                  ; $0CF791 |
  LDA $00                                   ; $0CF794 |
  STA !s_spr_x_speed_lo,y                   ; $0CF796 |
  LDA $02                                   ; $0CF799 |
  STA !s_spr_y_speed_lo,y                   ; $0CF79B |

CODE_0CF79E:
  PLY                                       ; $0CF79E |
  DEY                                       ; $0CF79F |
  DEY                                       ; $0CF7A0 |
  BNE CODE_0CF767                           ; $0CF7A1 |

CODE_0CF7A3:
  RTS                                       ; $0CF7A3 |

CODE_0CF7A4:
  PHY                                       ; $0CF7A4 |
  JSL $03A496                               ; $0CF7A5 |
  PLY                                       ; $0CF7A9 |
  CPY #$9005                                ; $0CF7AA |
  SBC $68,x                                 ; $0CF7AD |
  PLA                                       ; $0CF7AF |
  JML $03B25B                               ; $0CF7B0 |

  dw $F7B8                                  ; $0CF7B4 |
  dw $F82F                                  ; $0CF7B6 |

  LDX $12                                   ; $0CF7B8 |
  LDA #$0115                                ; $0CF7BA |
  JSL spawn_sprite_active                   ; $0CF7BD |
  BCC CODE_0CF802                           ; $0CF7C1 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CF7C3 |
  STA !s_spr_x_pixel_pos,y                  ; $0CF7C6 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF7C9 |
  CLC                                       ; $0CF7CC |
  ADC #$0010                                ; $0CF7CD |
  STA !s_spr_y_pixel_pos,y                  ; $0CF7D0 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF7D3 |
  AND #$FFF1                                ; $0CF7D6 |
  ORA #$0002                                ; $0CF7D9 |
  STA !s_spr_oam_yxppccct,y                 ; $0CF7DC |
  LDA #$0002                                ; $0CF7DF |
  STA !s_spr_state,y                        ; $0CF7E2 |
  LDA !s_spr_wildcard_2_lo,x                ; $0CF7E5 |
  STA !s_spr_wildcard_2_lo,y                ; $0CF7E8 |
  LDA #$001E                                ; $0CF7EB |
  TXY                                       ; $0CF7EE |
  JSL $03A377                               ; $0CF7EF |
  LDA #$0003                                ; $0CF7F3 |
  STA !s_spr_wildcard_2_lo,x                ; $0CF7F6 |
  DEC A                                     ; $0CF7F9 |
  ORA !s_spr_oam_yxppccct,x                 ; $0CF7FA |
  STA !s_spr_oam_yxppccct,x                 ; $0CF7FD |
  BRA CODE_0CF82C                           ; $0CF800 |

CODE_0CF802:
  STZ $6162                                 ; $0CF802 |
  STZ !s_tongued_sprite_slot                ; $0CF805 |
  LDA #$0115                                ; $0CF808 |
  TXY                                       ; $0CF80B |
  JSL $03A377                               ; $0CF80C |
  LDA !s_spr_y_pixel_pos,x                  ; $0CF810 |
  CLC                                       ; $0CF813 |
  ADC #$0010                                ; $0CF814 |
  STA !s_spr_y_pixel_pos,x                  ; $0CF817 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CF81A |
  AND #$FFF1                                ; $0CF81D |
  ORA #$0002                                ; $0CF820 |
  STA !s_spr_oam_yxppccct,x                 ; $0CF823 |
  LDA #$0002                                ; $0CF826 |
  STA !s_spr_state,x                        ; $0CF829 |

CODE_0CF82C:
  PLY                                       ; $0CF82C |
  PLA                                       ; $0CF82D |
  RTL                                       ; $0CF82E |

  LDX $12                                   ; $0CF82F |
  LDA #$001E                                ; $0CF831 |
  TXY                                       ; $0CF834 |
  JSL $03A377                               ; $0CF835 |
  LDA #$0001                                ; $0CF839 |
  STA !s_spr_wildcard_2_lo,x                ; $0CF83C |
  DEC A                                     ; $0CF83F |
  ORA !s_spr_oam_yxppccct,x                 ; $0CF840 |
  STA !s_spr_oam_yxppccct,x                 ; $0CF843 |
  BRA CODE_0CF82C                           ; $0CF846 |
  LDY !s_spr_draw_priority,x                ; $0CF848 |
  BMI CODE_0CF868                           ; $0CF84B |
  LDY !s_spr_wildcard_1_lo,x                ; $0CF84D |
  DEY                                       ; $0CF850 |
  LDA #$000C                                ; $0CF851 |
  STA !gsu_r0                               ; $0CF854 |
  LDA #$F8F3                                ; $0CF857 |
  STA !gsu_r1                               ; $0CF85A |
  LDX #$09                                  ; $0CF85D |
  LDA #$A7A7                                ; $0CF85F |
  JSL r_gsu_init_1                          ; $0CF862 | GSU init
  LDX $12                                   ; $0CF866 |

CODE_0CF868:
  JSR CODE_0CF6D0                           ; $0CF868 |
  LDA !s_spr_timer_2,x                      ; $0CF86B |
  CMP #$0001                                ; $0CF86E |
  BNE CODE_0CF87A                           ; $0CF871 |
  LDA #$006E                                ; $0CF873 |\ play sound #$006E
  JSL push_sound_queue                      ; $0CF876 |/

CODE_0CF87A:
  RTL                                       ; $0CF87A |

; gsu table
  dw $0002, $8800, $0000, $FA08             ; $0CF87B |
  dw $402C, $0000, $2CFA, $0000             ; $0CF883 |
  dw $0E01, $402F, $0600, $2F0E             ; $0CF88B |
  dw $0240, $1000, $02A0, $0002             ; $0CF893 |
  dw $8800, $0000, $FA08, $402D             ; $0CF89B |
  dw $0000, $2DFA, $0000, $0E01             ; $0CF8A3 |
  dw $402F, $0600, $2F0E, $0240             ; $0CF8AB |
  dw $1000, $02A0, $0002, $8800             ; $0CF8B3 |
  dw $0000, $FA08, $403C, $0000             ; $0CF8BB |
  dw $3CFA, $0000, $0E01, $402F             ; $0CF8C3 |
  dw $0600, $2F0E, $0240, $1000             ; $0CF8CB |
  dw $02A0, $0002, $8800, $0000             ; $0CF8D3 |
  dw $FA08, $403D, $0000, $3DFA             ; $0CF8DB |
  dw $0000, $0E01, $402F, $0600             ; $0CF8E3 |
  dw $2F0E, $0240, $1000, $02A0             ; $0CF8EB |

; gsu table
  dw $0002, $8800, $0000, $FA00             ; $0CF8F3 |
  dw $002C, $0800, $2CFA, $0040             ; $0CF8FB |
  dw $0E01, $402F, $0600, $2F0E             ; $0CF903 |
  dw $0240, $0000, $0088, $0000             ; $0CF90B |
  dw $2DFA, $0000, $FA08, $402D             ; $0CF913 |
  dw $0100, $2F0E, $0040, $0E06             ; $0CF91B |
  dw $402F, $0002, $8800, $0000             ; $0CF923 |
  dw $FA00, $003C, $0800, $3CFA             ; $0CF92B |
  dw $0040, $0E01, $402F, $0600             ; $0CF933 |
  dw $2F0E, $0240, $0000, $0088             ; $0CF93B |
  dw $0000, $3DFA, $0000, $FA08             ; $0CF943 |
  dw $403D, $0100, $2F0E, $0040             ; $0CF94B |
  dw $0E06, $402F                           ; $0CF953 |

  LDA !s_spr_wildcard_2_lo,x                ; $0CF957 |
  BPL CODE_0CF972                           ; $0CF95A |
  PHA                                       ; $0CF95C |
  AND #$00FF                                ; $0CF95D |
  ASL A                                     ; $0CF960 |
  ASL A                                     ; $0CF961 |
  ASL A                                     ; $0CF962 |
  ASL A                                     ; $0CF963 |
  STA $04                                   ; $0CF964 |
  PLA                                       ; $0CF966 |
  AND #$7F00                                ; $0CF967 |
  LSR A                                     ; $0CF96A |
  LSR A                                     ; $0CF96B |
  LSR A                                     ; $0CF96C |
  LSR A                                     ; $0CF96D |
  JSL $03D3F3                               ; $0CF96E |

CODE_0CF972:
  RTL                                       ; $0CF972 |

  dw $0409, $200A, $0409, $1008             ; $0CF973 |

  dw $040B, $040C, $240D, $040C             ; $0CF97B |
  dw $040B, $1008                           ; $0CF983 |

  dw $040E, $240F, $040E, $1008             ; $0CF987 |
  dw $2401, $1000                           ; $0CF98F |

  dw $0404, $2005, $0404, $1000             ; $0CF993 |

  dw $0406, $2007, $0406, $1000             ; $0CF99B |

  dw $0404, $2010, $0404, $1000             ; $0CF9A3 |

  dw $0401, $2002, $0401, $1000             ; $0CF9AB |

  dw $0402, $2003, $0402, $1001             ; $0CF9B3 |

  dw $0400, $2004, $0400, $1001             ; $0CF9BB |
  dw $0406                                  ; $0CF9C3 |

  dw $2007, $0406, $1001                    ; $0CF9C5 |

  dw $F98F, $9302, $06F9                    ; $0CF9CB |
  dw $F99B, $8F06, $02F9                    ; $0CF9D1 |
  dw $F993, $8F06, $02F9                    ; $0CF9D7 |
  dw $F993, $8F06, $02F9                    ; $0CF9DD |

  dw $F973, $7B06, $0AF9                    ; $0CF9E3 |
  dw $F987, $7306, $06F9                    ; $0CF9E9 |
  dw $F97B, $730A, $06F9                    ; $0CF9EF |
  dw $F97B, $730A, $06F9                    ; $0CF9F5 |

  dw $F9A3, $AB06, $06F9                    ; $0CF9FB |
  dw $F99B, $A306, $06F9                    ; $0CFA01 |
  dw $F9AB, $A306, $06F9                    ; $0CFA07 |
  dw $F9AB, $A306, $06F9                    ; $0CFA0D |

  dw $F9B3, $BB06, $06F9                    ; $0CFA13 |
  dw $F9C3, $B306, $06F9                    ; $0CFA19 |
  dw $F9BB, $B306, $06F9                    ; $0CFA1F |
  dw $F9BB, $B306, $06F9                    ; $0CFA25 |

  dw $F9CB                                  ; $0CFA2B |
  dw $F9E3                                  ; $0CFA2D |
  dw $F9E3                                  ; $0CFA2F |
  dw $F9E3                                  ; $0CFA31 |
  dw $F9FB                                  ; $0CFA33 |
  dw $FA13                                  ; $0CFA35 |
  dw $FA13                                  ; $0CFA37 |
  dw $F9FB                                  ; $0CFA39 |

  dw $000A, $000E, $000C, $0008             ; $0CFA3B |
  dw $0002, $0000, $0004, $0006             ; $0CFA43 |

init_yoshi_in_intro_cutscene:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CFA4B |
  LDA !s_spr_oam_yxppccct,x                 ; $0CFA4D |
  ORA $FA3B,y                               ; $0CFA50 |
  STA !s_spr_oam_yxppccct,x                 ; $0CFA53 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CFA56 |
  STA !s_spr_wildcard_5_lo_dp,x             ; $0CFA59 |
  JMP CODE_0CFB20                           ; $0CFA5B |

  dw $0020, $0040, $0060, $0080             ; $0CFA5E |

  dw $0004, $0008, $000C, $0010             ; $0CFA66 |

main_yoshi_in_intro_cutscene:
  JSR CODE_0CFB64                           ; $0CFA6E |
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CFA71 |
  TYX                                       ; $0CFA73 |
  JMP ($FA77,x)                             ; $0CFA74 |

  dw $FA87                                  ; $0CFA77 |
  dw $FAB0                                  ; $0CFA79 |
  dw $FAB0                                  ; $0CFA7B |
  dw $FAB0                                  ; $0CFA7D |
  dw $FAB0                                  ; $0CFA7F |
  dw $FAB0                                  ; $0CFA81 |
  dw $FAB0                                  ; $0CFA83 |
  dw $FAB0                                  ; $0CFA85 |

  LDX $12                                   ; $0CFA87 |
  LDA $0D27                                 ; $0CFA89 |
  CMP #$0004                                ; $0CFA8C |
  BCS CODE_0CFA94                           ; $0CFA8F |
  JMP CODE_0CFAED                           ; $0CFA91 |

CODE_0CFA94:
  LDA #$0004                                ; $0CFA94 |
  STA !s_player_state                       ; $0CFA97 |
  LDA #$0003                                ; $0CFA9A |
  STA $611A                                 ; $0CFA9D |
  LDA !s_spr_x_pixel_pos,x                  ; $0CFAA0 |
  STA !s_player_x                           ; $0CFAA3 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CFAA6 |
  STA !s_player_y                           ; $0CFAA9 |
  JML $03A31E                               ; $0CFAAC |
  LDX $12                                   ; $0CFAB0 |
  LDA !s_player_x                           ; $0CFAB2 |
  CMP #$01C8                                ; $0CFAB5 |
  BCC CODE_0CFAED                           ; $0CFAB8 |
  LDA #$0002                                ; $0CFABA |
  STA !s_spr_facing_dir,x                   ; $0CFABD |
  LDA $7860,x                               ; $0CFAC0 |
  BIT #$0001                                ; $0CFAC3 |
  BEQ CODE_0CFADF                           ; $0CFAC6 |
  LDA #$0012                                ; $0CFAC8 |
  STA !s_spr_anim_frame,x                   ; $0CFACB |
  LDA !s_spr_timer_2,x                      ; $0CFACE |
  BNE CODE_0CFAEC                           ; $0CFAD1 |
  LDA #$0011                                ; $0CFAD3 |
  STA !s_spr_anim_frame,x                   ; $0CFAD6 |
  LDA #$FC00                                ; $0CFAD9 |
  STA !s_spr_y_speed_lo,x                   ; $0CFADC |

CODE_0CFADF:
  LDA $10                                   ; $0CFADF |
  AND #$0003                                ; $0CFAE1 |
  ASL A                                     ; $0CFAE4 |
  TAY                                       ; $0CFAE5 |
  LDA $FA66,y                               ; $0CFAE6 |
  STA !s_spr_timer_2,x                      ; $0CFAE9 |

CODE_0CFAEC:
  RTL                                       ; $0CFAEC |

CODE_0CFAED:
  LDX $12                                   ; $0CFAED |
  LDA $10                                   ; $0CFAEF |
  AND #$0003                                ; $0CFAF1 |
  ASL A                                     ; $0CFAF4 |
  TAY                                       ; $0CFAF5 |
  LDA $FA66,y                               ; $0CFAF6 |
  STA !s_spr_timer_2,x                      ; $0CFAF9 |
  LDA !s_spr_timer_1,x                      ; $0CFAFC |
  BNE CODE_0CFB1F                           ; $0CFAFF |
  LDY !s_spr_wildcard_4_lo_dp,x             ; $0CFB01 |
  DEY                                       ; $0CFB03 |
  DEY                                       ; $0CFB04 |
  BMI CODE_0CFB20                           ; $0CFB05 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $0CFB07 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CFB09 |
  STA $00                                   ; $0CFB0C |
  INC A                                     ; $0CFB0E |
  STA $02                                   ; $0CFB0F |
  SEP #$20                                  ; $0CFB11 |
  LDA ($00),y                               ; $0CFB13 |
  STA !s_spr_anim_frame,x                   ; $0CFB15 |
  LDA ($02),y                               ; $0CFB18 |
  STA !s_spr_timer_1,x                      ; $0CFB1A |
  REP #$20                                  ; $0CFB1D |

CODE_0CFB1F:
  RTL                                       ; $0CFB1F |

CODE_0CFB20:
  LDY !s_spr_wildcard_3_lo_dp,x             ; $0CFB20 |
  LDA $FA2B,y                               ; $0CFB22 |
  STA $00                                   ; $0CFB25 |
  LDA $10                                   ; $0CFB27 |
  AND #$0007                                ; $0CFB29 |
  STA $02                                   ; $0CFB2C |
  ASL A                                     ; $0CFB2E |
  CLC                                       ; $0CFB2F |
  ADC $02                                   ; $0CFB30 |
  TAY                                       ; $0CFB32 |
  LDA ($00),y                               ; $0CFB33 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CFB35 |
  STA $02                                   ; $0CFB38 |
  INC A                                     ; $0CFB3A |
  STA $04                                   ; $0CFB3B |
  INY                                       ; $0CFB3D |
  INY                                       ; $0CFB3E |
  SEP #$20                                  ; $0CFB3F |
  LDA ($00),y                               ; $0CFB41 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFB43 |
  TAY                                       ; $0CFB45 |
  LDA ($02),y                               ; $0CFB46 |
  STA !s_spr_anim_frame,x                   ; $0CFB48 |
  REP #$20                                  ; $0CFB4B |
  LDA $10                                   ; $0CFB4D |
  AND #$0003                                ; $0CFB4F |
  ASL A                                     ; $0CFB52 |
  TAY                                       ; $0CFB53 |
  LDA $FA5E,y                               ; $0CFB54 |
  LDY $611A                                 ; $0CFB57 |
  BEQ CODE_0CFB60                           ; $0CFB5A |
  CLC                                       ; $0CFB5C |
  ADC #$0140                                ; $0CFB5D |

CODE_0CFB60:
  STA !s_spr_timer_1,x                      ; $0CFB60 |
  RTL                                       ; $0CFB63 |

CODE_0CFB64:
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0CFB64 |
  CMP !s_spr_y_pixel_pos,x                  ; $0CFB66 |
  BPL CODE_0CFB7A                           ; $0CFB69 |
  STA !s_spr_y_pixel_pos,x                  ; $0CFB6B |
  LDA #$0100                                ; $0CFB6E |
  STA !s_spr_y_speed_lo,x                   ; $0CFB71 |
  LDA #$0001                                ; $0CFB74 |
  STA $7860,x                               ; $0CFB77 |

CODE_0CFB7A:
  RTS                                       ; $0CFB7A |

  dw $FC5F, $FCA5, $FCC2                    ; $0CFB7B |
  dw $FC5F, $FCFC, $FD08                    ; $0CFB81 |

  dw $0000, $0002, $0004, $0008             ; $0CFB87 |

init_woozy_guy:
  LDY !s_spr_wildcard_1_lo,x                ; $0CFB8F |
  BNE CODE_0CFBD4                           ; $0CFB92 |
  SEP #$20                                  ; $0CFB94 |
  LDA !s_spr_x_pixel_pos,x                  ; $0CFB96 |
  AND #$10                                  ; $0CFB99 |
  LSR A                                     ; $0CFB9B |
  STA $00                                   ; $0CFB9C |
  LDA !s_spr_y_pixel_pos,x                  ; $0CFB9E |
  AND #$10                                  ; $0CFBA1 |
  ORA $00                                   ; $0CFBA3 |
  LSR A                                     ; $0CFBA5 |
  LSR A                                     ; $0CFBA6 |
  INC A                                     ; $0CFBA7 |
  STA !s_spr_wildcard_1_lo,x                ; $0CFBA8 |
  TAY                                       ; $0CFBAB |
  REP #$20                                  ; $0CFBAC |
  LDA !s_spr_x_pixel_pos,x                  ; $0CFBAE |
  CLC                                       ; $0CFBB1 |
  ADC #$0008                                ; $0CFBB2 |
  STA !gsu_r8                               ; $0CFBB5 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CFBB8 |
  CLC                                       ; $0CFBBB |
  ADC #$0008                                ; $0CFBBC |
  STA !gsu_r0                               ; $0CFBBF |
  PHY                                       ; $0CFBC2 |
  LDX #$0A                                  ; $0CFBC3 |
  LDA #$CE2F                                ; $0CFBC5 |
  JSL r_gsu_init_3                          ; $0CFBC8 | GSU init
  LDX $12                                   ; $0CFBCC |
  PLY                                       ; $0CFBCE |
  LDA !gsu_r5                               ; $0CFBCF |
  BNE CODE_0CFBFE                           ; $0CFBD2 |

CODE_0CFBD4:
  DEY                                       ; $0CFBD4 |
  LDA !s_spr_oam_yxppccct,x                 ; $0CFBD5 |
  ORA $FB87,y                               ; $0CFBD8 |
  STA !s_spr_oam_yxppccct,x                 ; $0CFBDB |
  JSL $03AE11                               ; $0CFBDE |
  SEP #$20                                  ; $0CFBE2 |
  LDA #$FF                                  ; $0CFBE4 |
  STA $7863,x                               ; $0CFBE6 |
  STA !s_spr_wildcard_2_lo,x                ; $0CFBE9 |
  REP #$20                                  ; $0CFBEC |
  LDA #$0100                                ; $0CFBEE |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFBF1 |
  LDA #$FFE0                                ; $0CFBF3 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CFBF6 |
  JSL $0CFEDD                               ; $0CFBF9 |
  RTL                                       ; $0CFBFD |

CODE_0CFBFE:
  DEY                                       ; $0CFBFE |
  LDA !s_spr_oam_yxppccct,x                 ; $0CFBFF |
  ORA $FB87,y                               ; $0CFC02 |
  STA !s_spr_oam_yxppccct,x                 ; $0CFC05 |
  JSL $03AE11                               ; $0CFC08 |
  LDA !s_spr_y_pixel_pos,x                  ; $0CFC0C |
  SEC                                       ; $0CFC0F |
  SBC #$0010                                ; $0CFC10 |
  STA !s_spr_y_pixel_pos,x                  ; $0CFC13 |
  LDA #$0020                                ; $0CFC16 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFC19 |
  DEC A                                     ; $0CFC1B |
  SEP #$20                                  ; $0CFC1C |
  STA !s_spr_wildcard_2_lo,x                ; $0CFC1E |
  LDA #$FF                                  ; $0CFC21 |
  STA $7863,x                               ; $0CFC23 |
  REP #$20                                  ; $0CFC26 |
  LDA #$FFE0                                ; $0CFC28 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CFC2B |
  LDY #$0A                                  ; $0CFC2E |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0CFC30 |
  JSL $0CFEDD                               ; $0CFC32 |
  RTL                                       ; $0CFC36 |

main_woozy_guy:
  JSL $03AA2E                               ; $0CFC37 |
  LDA !s_spr_state,x                        ; $0CFC3B |
  CMP #$0008                                ; $0CFC3E |
  BNE CODE_0CFC48                           ; $0CFC41 |
  LDA #$0100                                ; $0CFC43 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFC46 |

CODE_0CFC48:
  JSR CODE_0CFD41                           ; $0CFC48 |
  JSL $0CFEDD                               ; $0CFC4B |
  JSR CODE_0CFD69                           ; $0CFC4F |
  JSL $03AF23                               ; $0CFC52 |
  JSR CODE_0CFDFC                           ; $0CFC56 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CFC59 |
  TYX                                       ; $0CFC5B |
  JMP ($FB7B,x)                             ; $0CFC5C |
  LDX $12                                   ; $0CFC5F |
  LDA !s_spr_gsu_morph_1_lo,x               ; $0CFC61 |
  PHA                                       ; $0CFC64 |
  CLC                                       ; $0CFC65 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $0CFC66 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFC68 |
  PLA                                       ; $0CFC6A |
  BPL CODE_0CFC7C                           ; $0CFC6B |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CFC6D |
  CMP #$00A0                                ; $0CFC6F |
  BCS CODE_0CFC9A                           ; $0CFC72 |
  LDA #$0020                                ; $0CFC74 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CFC77 |
  BRA CODE_0CFC9A                           ; $0CFC7A |

CODE_0CFC7C:
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CFC7C |
  CMP #$0100                                ; $0CFC7E |
  BCC CODE_0CFC9A                           ; $0CFC81 |
  LDA #$0100                                ; $0CFC83 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFC86 |
  LDA #$FFE0                                ; $0CFC88 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0CFC8B |
  LDA #$0020                                ; $0CFC8E |
  STA !s_spr_timer_1,x                      ; $0CFC91 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CFC94 |
  INY                                       ; $0CFC96 |
  INY                                       ; $0CFC97 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0CFC98 |

CODE_0CFC9A:
  RTL                                       ; $0CFC9A |

  dw $FF00, $0100                           ; $0CFC9B |
  dw $2000                                  ; $0CFC9F |
  dw $E000                                  ; $0CFCA1 |
  dw $2000                                  ; $0CFCA3 |

  LDX $12                                   ; $0CFCA5 |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CFCA7 |
  LDY !s_spr_facing_dir,x                   ; $0CFCA9 |
  LDA $FC9B,y                               ; $0CFCAC |
  STA !s_spr_x_speed_lo,x                   ; $0CFCAF |
  LDA #$FC00                                ; $0CFCB2 |
  STA !s_spr_y_speed_lo,x                   ; $0CFCB5 |
  STZ !s_spr_timer_1,x                      ; $0CFCB8 |
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CFCBB |
  INY                                       ; $0CFCBD |
  INY                                       ; $0CFCBE |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0CFCBF |
  RTL                                       ; $0CFCC1 |

  LDX $12                                   ; $0CFCC2 |
  LDA $7860,x                               ; $0CFCC4 |
  AND #$0001                                ; $0CFCC7 |
  BNE CODE_0CFCD5                           ; $0CFCCA |
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CFCCC |
  CLC                                       ; $0CFCCE |
  ADC #$0800                                ; $0CFCCF |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CFCD2 |
  RTL                                       ; $0CFCD4 |

CODE_0CFCD5:
  STZ !s_spr_x_speed_lo,x                   ; $0CFCD5 |
  LDY !s_spr_ground_angle,x                 ; $0CFCD8 |
  BNE CODE_0CFCE6                           ; $0CFCDB |
  STZ !s_spr_wildcard_3_lo_dp,x             ; $0CFCDD |

CODE_0CFCDF:
  LDY !s_spr_wildcard_5_lo_dp,x             ; $0CFCDF |
  INY                                       ; $0CFCE1 |
  INY                                       ; $0CFCE2 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0CFCE3 |
  RTL                                       ; $0CFCE5 |

CODE_0CFCE6:
  BMI CODE_0CFCF2                           ; $0CFCE6 |
  LDY !s_spr_facing_dir,x                   ; $0CFCE8 |
  LDA $FC9F,y                               ; $0CFCEB |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CFCEE |
  BRA CODE_0CFCDF                           ; $0CFCF0 |

CODE_0CFCF2:
  LDY !s_spr_facing_dir,x                   ; $0CFCF2 |
  LDA $FCA1,y                               ; $0CFCF5 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CFCF8 |
  BRA CODE_0CFCDF                           ; $0CFCFA |
  LDX $12                                   ; $0CFCFC |
  LDA !s_spr_timer_1,x                      ; $0CFCFE |
  BNE CODE_0CFD07                           ; $0CFD01 |
  LDY #$00                                  ; $0CFD03 |
  STY !s_spr_wildcard_5_lo_dp,x             ; $0CFD05 |

CODE_0CFD07:
  RTL                                       ; $0CFD07 |

  LDX $12                                   ; $0CFD08 |
  LDA !s_spr_cam_x_pos,x                    ; $0CFD0A |
  CMP #$00F0                                ; $0CFD0D |
  BCS CODE_0CFD2F                           ; $0CFD10 |
  LDA !s_spr_cam_y_pos,x                    ; $0CFD12 |
  CMP #$00C0                                ; $0CFD15 |
  BCS CODE_0CFD2F                           ; $0CFD18 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CFD1A |
  CLC                                       ; $0CFD1C |
  ADC #$0002                                ; $0CFD1D |
  CMP #$0100                                ; $0CFD20 |
  BCS CODE_0CFD30                           ; $0CFD23 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFD25 |
  DEC A                                     ; $0CFD27 |
  SEP #$20                                  ; $0CFD28 |
  STA !s_spr_wildcard_2_lo,x                ; $0CFD2A |
  REP #$20                                  ; $0CFD2D |

CODE_0CFD2F:
  RTL                                       ; $0CFD2F |

CODE_0CFD30:
  LDA #$0100                                ; $0CFD30 |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFD33 |
  SEP #$20                                  ; $0CFD35 |
  LDA #$FF                                  ; $0CFD37 |
  STA !s_spr_wildcard_2_lo,x                ; $0CFD39 |
  STZ !s_spr_wildcard_5_lo_dp,x             ; $0CFD3C |
  REP #$20                                  ; $0CFD3E |
  RTL                                       ; $0CFD40 |

CODE_0CFD41:
  LDA !s_spr_state,x                        ; $0CFD41 |
  CMP #$0010                                ; $0CFD44 |
  BNE CODE_0CFD68                           ; $0CFD47 |
  LDA !s_spr_collision_state,x              ; $0CFD49 |
  BEQ CODE_0CFD68                           ; $0CFD4C |
  LDA !s_spr_x_speed_lo,x                   ; $0CFD4E |
  CLC                                       ; $0CFD51 |
  ADC #$0180                                ; $0CFD52 |
  CMP #$0301                                ; $0CFD55 |
  BCC CODE_0CFD68                           ; $0CFD58 |
  LDA #$0100                                ; $0CFD5A |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFD5D |
  LDA !s_spr_anim_frame,x                   ; $0CFD5F |
  AND #$00FF                                ; $0CFD62 |
  STA !s_spr_anim_frame,x                   ; $0CFD65 |

CODE_0CFD68:
  RTS                                       ; $0CFD68 |

CODE_0CFD69:
  LDA !s_spr_state,x                        ; $0CFD69 |
  CMP #$0010                                ; $0CFD6C |
  BNE CODE_0CFD82                           ; $0CFD6F |
  LDA !s_spr_collision_state,x              ; $0CFD71 |
  BEQ CODE_0CFD82                           ; $0CFD74 |
  LDA !s_spr_x_speed_lo,x                   ; $0CFD76 |
  CLC                                       ; $0CFD79 |
  ADC #$0180                                ; $0CFD7A |
  CMP #$0301                                ; $0CFD7D |
  BCS CODE_0CFD83                           ; $0CFD80 |

CODE_0CFD82:
  RTS                                       ; $0CFD82 |

CODE_0CFD83:
  PLA                                       ; $0CFD83 |
  LDA !s_sprite_disable_flag                ; $0CFD84 |
  ORA $0B55                                 ; $0CFD87 |
  ORA !r_cur_item_used                      ; $0CFD8A |
  BEQ CODE_0CFD90                           ; $0CFD8D |
  RTL                                       ; $0CFD8F |

CODE_0CFD90:
  LDA !s_spr_collision_state,x              ; $0CFD90 |
  DEC A                                     ; $0CFD93 |
  BEQ CODE_0CFD99                           ; $0CFD94 |
  STA !s_spr_collision_state,x              ; $0CFD96 |

CODE_0CFD99:
  LDY !s_spr_wildcard_1_hi,x                ; $0CFD99 |
  TYX                                       ; $0CFD9C |
  JMP ($FDA0,x)                             ; $0CFD9D |

  dw $FDA4, $FDCF                           ; $0CFDA0 |

  LDX $12                                   ; $0CFDA4 |
  LDY #$00                                  ; $0CFDA6 |
  LDA !s_spr_x_speed_lo,x                   ; $0CFDA8 |
  BMI CODE_0CFDAF                           ; $0CFDAB |
  INY                                       ; $0CFDAD |
  INY                                       ; $0CFDAE |

CODE_0CFDAF:
  TYA                                       ; $0CFDAF |
  EOR !s_spr_facing_dir,x                   ; $0CFDB0 |
  TAY                                       ; $0CFDB3 |
  LDA $8D66,y                               ; $0CFDB4 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $0CFDB7 |
  LDA !s_spr_facing_dir,x                   ; $0CFDB9 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CFDBC |
  LDA #$0100                                ; $0CFDBF |
  STA !s_spr_wildcard_4_lo_dp,x             ; $0CFDC2 |
  SEP #$20                                  ; $0CFDC4 |
  INC !s_spr_wildcard_1_hi,x                ; $0CFDC6 |
  INC !s_spr_wildcard_1_hi,x                ; $0CFDC9 |
  REP #$20                                  ; $0CFDCC |
  RTL                                       ; $0CFDCE |

  LDX $12                                   ; $0CFDCF |
  JSR CODE_0CFE63                           ; $0CFDD1 |
  JSR CODE_0CFE6C                           ; $0CFDD4 |
  LDA $7860,x                               ; $0CFDD7 |
  BIT #$0001                                ; $0CFDDA |
  BEQ CODE_0CFDEE                           ; $0CFDDD |
  LDY #$00                                  ; $0CFDDF |
  LDA !s_spr_x_speed_lo,x                   ; $0CFDE1 |
  BPL CODE_0CFDE8                           ; $0CFDE4 |
  INY                                       ; $0CFDE6 |
  INY                                       ; $0CFDE7 |

CODE_0CFDE8:
  LDA $8D4E,y                               ; $0CFDE8 |
  STA !s_spr_x_speed_lo,x                   ; $0CFDEB |

CODE_0CFDEE:
  LDA !s_spr_wildcard_3_lo_dp,x             ; $0CFDEE |
  CLC                                       ; $0CFDF0 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $0CFDF1 |
  STA !s_spr_wildcard_3_lo_dp,x             ; $0CFDF3 |
  LDA !s_spr_facing_dir,x                   ; $0CFDF5 |
  STA !s_spr_gsu_morph_2_lo,x               ; $0CFDF8 |
  RTL                                       ; $0CFDFB |

CODE_0CFDFC:
  LDX $12                                   ; $0CFDFC |
  LDY !s_spr_collision_id,x                 ; $0CFDFE |
  BPL CODE_0CFE0E                           ; $0CFE01 |
  LDA !s_player_invincibility_timer         ; $0CFE03 |
  BNE CODE_0CFE5E                           ; $0CFE06 |
  PLA                                       ; $0CFE08 |
  JSL $03A5B7                               ; $0CFE09 |
  RTL                                       ; $0CFE0D |

CODE_0CFE0E:
  DEY                                       ; $0CFE0E |
  BMI CODE_0CFE5E                           ; $0CFE0F |
  BEQ CODE_0CFE5E                           ; $0CFE11 |
  LDA !s_spr_state,y                        ; $0CFE13 |
  CMP #$0010                                ; $0CFE16 |
  BNE CODE_0CFE5E                           ; $0CFE19 |
  LDA !s_spr_collision_state,y              ; $0CFE1B |
  BEQ CODE_0CFE5E                           ; $0CFE1E |
  JSR CODE_0C8EBF                           ; $0CFE20 |
  BCC CODE_0CFE28                           ; $0CFE23 |
  JMP CODE_0CFEAA                           ; $0CFE25 |

CODE_0CFE28:
  LDA !s_spr_x_hitbox_center,x              ; $0CFE28 |
  SEC                                       ; $0CFE2B |
  SBC !s_spr_x_hitbox_center,y              ; $0CFE2C |
  AND #$8000                                ; $0CFE2F |
  ASL A                                     ; $0CFE32 |
  ROL A                                     ; $0CFE33 |
  ASL A                                     ; $0CFE34 |
  STA $00                                   ; $0CFE35 |
  TYX                                       ; $0CFE37 |
  JSL $03B25B                               ; $0CFE38 |
  LDX $12                                   ; $0CFE3C |
  PLA                                       ; $0CFE3E |
  LDA #$0067                                ; $0CFE3F |\ play sound #$0067
  JSL push_sound_queue                      ; $0CFE42 |/
  SEP #$20                                  ; $0CFE46 |
  STZ !s_spr_wildcard_1_hi,x                ; $0CFE48 |
  LDA #$01                                  ; $0CFE4B |
  STA !s_spr_collision_state,x              ; $0CFE4D |
  REP #$20                                  ; $0CFE50 |
  LDY $00                                   ; $0CFE52 |
  LDA $8D4E,y                               ; $0CFE54 |
  STA !s_spr_x_speed_lo,x                   ; $0CFE57 |
  JML $0CFDA4                               ; $0CFE5A |

CODE_0CFE5E:
  RTS                                       ; $0CFE5E |

  dw $0008, $0004                           ; $0CFE5F |

CODE_0CFE63:
  LDA !s_spr_facing_dir,x                   ; $0CFE63 |
  CMP !s_spr_gsu_morph_2_lo,x               ; $0CFE66 |
  BNE CODE_0CFE73                           ; $0CFE69 |
  RTS                                       ; $0CFE6B |

CODE_0CFE6C:
  LDX $12                                   ; $0CFE6C |
  LDY !s_spr_collision_id,x                 ; $0CFE6E |
  BPL CODE_0CFE77                           ; $0CFE71 |

CODE_0CFE73:
  PHY                                       ; $0CFE73 |
  JMP CODE_0C8F3F                           ; $0CFE74 |

CODE_0CFE77:
  TXA                                       ; $0CFE77 |
  STA !gsu_r1                               ; $0CFE78 |
  PHX                                       ; $0CFE7B |
  LDX #$A909                                ; $0CFE7C |
  ORA ($90),y                               ; $0CFE7F |
  JSL r_gsu_init_1                          ; $0CFE81 | GSU init
  PLX                                       ; $0CFE85 |
  LDY !gsu_r14                              ; $0CFE86 |
  BMI CODE_0CFEC0                           ; $0CFE89 |
  BEQ CODE_0CFEC0                           ; $0CFE8B |
  LDA !s_spr_state,y                        ; $0CFE8D |
  CMP #$000E                                ; $0CFE90 |
  BCC CODE_0CFEC0                           ; $0CFE93 |
  LDA !s_spr_bitwise_settings_3,y           ; $0CFE95 |
  AND #$6000                                ; $0CFE98 |
  BNE CODE_0CFEC0                           ; $0CFE9B |
  JSR CODE_0C8EBF                           ; $0CFE9D |
  BCS CODE_0CFEAA                           ; $0CFEA0 |
  LDA !s_spr_bitwise_settings_1,y           ; $0CFEA2 |
  AND #$0020                                ; $0CFEA5 |
  BNE CODE_0CFEC0                           ; $0CFEA8 |

CODE_0CFEAA:
  LDA !s_spr_x_pixel_pos,y                  ; $0CFEAA |
  STA $00                                   ; $0CFEAD |
  LDA !s_spr_y_pixel_pos,y                  ; $0CFEAF |
  STA $02                                   ; $0CFEB2 |
  TYX                                       ; $0CFEB4 |
  JSL $03B25B                               ; $0CFEB5 |
  LDX $12                                   ; $0CFEB9 |
  PLA                                       ; $0CFEBB |
  JML $03B24B                               ; $0CFEBC |

CODE_0CFEC0:
  RTS                                       ; $0CFEC0 |

  dw $0007, $0006, $0005, $0004             ; $0CFEC1 |
  dw $0003, $0002, $0001, $0000             ; $0CFEC9 |
  dw $0000, $0000, $0000, $0000             ; $0CFED1 |

  dw $7020, $6020                           ; $0CFED9 |

  LDY $7403,x                               ; $0CFEDD |
  BNE CODE_0CFF60                           ; $0CFEE0 |
  LDY !s_spr_draw_priority,x                ; $0CFEE2 |
  BMI CODE_0CFF60                           ; $0CFEE5 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CFEE7 |
  LSR A                                     ; $0CFEE9 |
  LSR A                                     ; $0CFEEA |
  LSR A                                     ; $0CFEEB |
  LSR A                                     ; $0CFEEC |
  AND #$00FE                                ; $0CFEED |
  TAY                                       ; $0CFEF0 |
  LDA $FEC1,y                               ; $0CFEF1 |
  STA $00                                   ; $0CFEF4 |
  REP #$10                                  ; $0CFEF6 |
  LDY !s_spr_oam_pointer,x                  ; $0CFEF8 |
  LDA $6002,y                               ; $0CFEFB |
  CLC                                       ; $0CFEFE |
  ADC $00                                   ; $0CFEFF |
  STA $6002,y                               ; $0CFF01 |
  SEP #$10                                  ; $0CFF04 |
  LDA !r_msg_box_state                      ; $0CFF06 |
  BNE CODE_0CFF60                           ; $0CFF09 |
  LDA !s_spr_dyntile_index,x                ; $0CFF0B |
  BMI CODE_0CFF60                           ; $0CFF0E |
  LDY #$00                                  ; $0CFF10 |
  LDA !s_spr_collision_state,x              ; $0CFF12 |
  BEQ CODE_0CFF19                           ; $0CFF15 |
  INY                                       ; $0CFF17 |
  INY                                       ; $0CFF18 |

CODE_0CFF19:
  LDA $FED9,y                               ; $0CFF19 |
  STA $00                                   ; $0CFF1C |
  LDY !s_spr_wildcard_3_hi_dp,x             ; $0CFF1E |
  TYA                                       ; $0CFF20 |
  STA !gsu_r5                               ; $0CFF21 |
  LDY !s_spr_wildcard_2_lo,x                ; $0CFF24 |
  TYA                                       ; $0CFF27 |
  INC A                                     ; $0CFF28 |
  STA !gsu_r6                               ; $0CFF29 |
  LDA !s_spr_wildcard_4_lo_dp,x             ; $0CFF2C |
  STA !gsu_r11                              ; $0CFF2E |
  REP #$10                                  ; $0CFF31 |
  LDY !s_spr_dyntile_index,x                ; $0CFF33 |
  TYX                                       ; $0CFF36 |
  LDA $03A9EE,x                             ; $0CFF37 |
  STA !gsu_r2                               ; $0CFF3B |
  LDA $03A9CE,x                             ; $0CFF3E |
  STA !gsu_r3                               ; $0CFF42 |
  LDA $00                                   ; $0CFF45 |
  STA !gsu_r12                              ; $0CFF47 |
  LDA #$0054                                ; $0CFF4A |
  STA !gsu_r13                              ; $0CFF4D |
  SEP #$10                                  ; $0CFF50 |
  LDX #$08                                  ; $0CFF52 |
  LDA #$83ED                                ; $0CFF54 |
  JSL r_gsu_init_1                          ; $0CFF57 | GSU init
  INC $0CF9                                 ; $0CFF5B |
  LDX $12                                   ; $0CFF5E |

CODE_0CFF60:
  RTL                                       ; $0CFF60 |

CODE_0CFF61:
  PHY                                       ; $0CFF61 |
  TXY                                       ; $0CFF62 |
  JSL $03B4DF                               ; $0CFF63 |
  PLY                                       ; $0CFF67 |
  RTL                                       ; $0CFF68 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF69 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF71 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF79 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF81 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF89 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF91 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFF99 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFA1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFA9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFB1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFB9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFC1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFC9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFD1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFD9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFE1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFE9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0CFFF1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF      ; $0CFFF9 |
