org $0D8000

; common ptr sub
  TYX                                       ; $0D8000 |
  RTS                                       ; $0D8001 |

; also the double-ended one
init_spiky_mace:
  JSL $03AE60                               ; $0D8002 |
  LDA $7722,x                               ; $0D8006 |
  STA $7902,x                               ; $0D8009 |
  JSL $03AD74                               ; $0D800C |
  BCS CODE_0D801C                           ; $0D8010 |
  LDA $7902,x                               ; $0D8012 |
  STA $7722,x                               ; $0D8015 |
  JML $03A31E                               ; $0D8018 |

CODE_0D801C:
  LDA $70E2,x                               ; $0D801C |
  AND #$0010                                ; $0D801F |
  LSR A                                     ; $0D8022 |
  LSR A                                     ; $0D8023 |
  LSR A                                     ; $0D8024 |
  STA $7400,x                               ; $0D8025 |
  DEC A                                     ; $0D8028 |
  ASL A                                     ; $0D8029 |
  STA $7900,x                               ; $0D802A |
  JSR CODE_0D82C0                           ; $0D802D |
  RTL                                       ; $0D8030 |

main_spiky_mace:
  STZ $7400,x                               ; $0D8031 |
  JSR CODE_0D8065                           ; $0D8034 |
  JSL $03AF23                               ; $0D8037 |
  JSL $03A2DE                               ; $0D803B |
  BCC CODE_0D804C                           ; $0D803F |
  LDA $7902,x                               ; $0D8041 |
  STA $7722,x                               ; $0D8044 |
  JSL $03AEFD                               ; $0D8047 |
  RTL                                       ; $0D804B |

CODE_0D804C:
  JSR CODE_0D821E                           ; $0D804C |
  JSR CODE_0D82B1                           ; $0D804F |
  LDA $7A96,x                               ; $0D8052 |
  BNE CODE_0D8064                           ; $0D8055 |
  LDA #$0008                                ; $0D8057 |
  STA $7A96,x                               ; $0D805A |
  LDA #$001B                                ; $0D805D |\ play sound #$001B
  JSL $0085D2                               ; $0D8060 |/

CODE_0D8064:
  RTL                                       ; $0D8064 |

CODE_0D8065:
  JSL $03AA52                               ; $0D8065 |
  LDA $7722,x                               ; $0D8069 |
  PHA                                       ; $0D806C |
  LDA $7902,x                               ; $0D806D |
  STA $7722,x                               ; $0D8070 |
  REP #$10                                  ; $0D8073 |
  LDA $7362,x                               ; $0D8075 |
  CLC                                       ; $0D8078 |
  ADC #$0020                                ; $0D8079 |
  TAY                                       ; $0D807C |
  JSL $03AA60                               ; $0D807D |
  PLA                                       ; $0D8081 |
  STA $7722,x                               ; $0D8082 |
  REP #$10                                  ; $0D8085 |
  LDY $7362,x                               ; $0D8087 |
  LDA $6024,y                               ; $0D808A |
  STA $6044,y                               ; $0D808D |
  LDA $602C,y                               ; $0D8090 |
  STA $604C,y                               ; $0D8093 |
  LDA $6034,y                               ; $0D8096 |
  STA $6054,y                               ; $0D8099 |
  LDA $603C,y                               ; $0D809C |
  STA $605C,y                               ; $0D809F |
  SEP #$10                                  ; $0D80A2 |
  LDA #$FFE9                                ; $0D80A4 |
  STA $00                                   ; $0D80A7 |
  LDA $7A38,x                               ; $0D80A9 |
  EOR #$FFFF                                ; $0D80AC |
  INC A                                     ; $0D80AF |
  AND #$01FE                                ; $0D80B0 |
  STA $02                                   ; $0D80B3 |
  LDX #$00                                  ; $0D80B5 |
  LDY #$02                                  ; $0D80B7 |

CODE_0D80B9:
  LDA $00                                   ; $0D80B9 |
  STA $300C                                 ; $0D80BB |
  LDA $02                                   ; $0D80BE |
  STA $3002                                 ; $0D80C0 |
  PHX                                       ; $0D80C3 |
  PHY                                       ; $0D80C4 |
  LDX #$0B                                  ; $0D80C5 |
  LDA #$8595                                ; $0D80C7 |
  JSL $7EDE44                               ; $0D80CA | GSU init
  PLY                                       ; $0D80CE |
  PLX                                       ; $0D80CF |
  LDA $3000                                 ; $0D80D0 |
  STA $04,x                                 ; $0D80D3 |
  LDA $3002                                 ; $0D80D5 |
  STA $08,x                                 ; $0D80D8 |
  LDA $00                                   ; $0D80DA |
  CLC                                       ; $0D80DC |
  ADC #$FFC8                                ; $0D80DD |
  STA $00                                   ; $0D80E0 |
  INX                                       ; $0D80E2 |
  INX                                       ; $0D80E3 |
  DEY                                       ; $0D80E4 |
  BNE CODE_0D80B9                           ; $0D80E5 |
  LDX $12                                   ; $0D80E7 |
  LDA $04                                   ; $0D80E9 |
  STA $18,x                                 ; $0D80EB |
  LDA $06                                   ; $0D80ED |
  STA $76,x                                 ; $0D80EF |
  LDA $08                                   ; $0D80F1 |
  STA $78,x                                 ; $0D80F3 |
  LDA $0A                                   ; $0D80F5 |
  STA $7A36,x                               ; $0D80F7 |
  REP #$10                                  ; $0D80FA |
  LDY $7362,x                               ; $0D80FC |
  LDA $7CD6,x                               ; $0D80FF |
  SEC                                       ; $0D8102 |
  SBC $6094                                 ; $0D8103 |
  STA $00                                   ; $0D8106 |
  LDA $7CD8,x                               ; $0D8108 |
  SEC                                       ; $0D810B |
  SBC $609C                                 ; $0D810C |
  STA $02                                   ; $0D810F |
  LDX #$0002                                ; $0D8111 |

CODE_0D8114:
  LDA $04,x                                 ; $0D8114 |
  STA $0C                                   ; $0D8116 |
  LDA $08,x                                 ; $0D8118 |
  STA $0E                                   ; $0D811A |
  JSR CODE_0D81F3                           ; $0D811C |
  TYA                                       ; $0D811F |
  CLC                                       ; $0D8120 |
  ADC #$0020                                ; $0D8121 |
  TAY                                       ; $0D8124 |
  DEX                                       ; $0D8125 |
  DEX                                       ; $0D8126 |
  BPL CODE_0D8114                           ; $0D8127 |
  LDA $04                                   ; $0D8129 |
  CLC                                       ; $0D812B |
  ADC $06                                   ; $0D812C |
  CMP #$8000                                ; $0D812E |
  ROR A                                     ; $0D8131 |
  STA $0C                                   ; $0D8132 |
  LDA $08                                   ; $0D8134 |
  CLC                                       ; $0D8136 |
  ADC $0A                                   ; $0D8137 |
  CMP #$8000                                ; $0D8139 |
  ROR A                                     ; $0D813C |
  STA $0E                                   ; $0D813D |
  JSR CODE_0D81F3                           ; $0D813F |
  SEP #$10                                  ; $0D8142 |
  LDX $12                                   ; $0D8144 |
  LDA $7360,x                               ; $0D8146 |
  CMP #$0101                                ; $0D8149 |
  BNE CODE_0D814F                           ; $0D814C |
  RTS                                       ; $0D814E |

CODE_0D814F:
  REP #$10                                  ; $0D814F |
  LDY $7362,x                               ; $0D8151 |
  LDA $6004,y                               ; $0D8154 |
  ORA #$C000                                ; $0D8157 |
  STA $60BC,y                               ; $0D815A |
  LDA $600C,y                               ; $0D815D |
  ORA #$C000                                ; $0D8160 |
  STA $60B4,y                               ; $0D8163 |
  LDA $6014,y                               ; $0D8166 |
  ORA #$C000                                ; $0D8169 |
  STA $60AC,y                               ; $0D816C |
  LDA $601C,y                               ; $0D816F |
  ORA #$C000                                ; $0D8172 |
  STA $60A4,y                               ; $0D8175 |
  LDA $6024,y                               ; $0D8178 |
  ORA #$C000                                ; $0D817B |
  STA $607C,y                               ; $0D817E |
  STA $609C,y                               ; $0D8181 |
  LDA $602C,y                               ; $0D8184 |
  ORA #$C000                                ; $0D8187 |
  STA $6074,y                               ; $0D818A |
  STA $6094,y                               ; $0D818D |
  LDA $6034,y                               ; $0D8190 |
  ORA #$C000                                ; $0D8193 |
  STA $606C,y                               ; $0D8196 |
  STA $608C,y                               ; $0D8199 |
  LDA $603C,y                               ; $0D819C |
  ORA #$C000                                ; $0D819F |
  STA $6064,y                               ; $0D81A2 |
  STA $6084,y                               ; $0D81A5 |
  LDX #$0006                                ; $0D81A8 |

CODE_0D81AB:
  LDA $04,x                                 ; $0D81AB |
  EOR #$FFFF                                ; $0D81AD |
  INC A                                     ; $0D81B0 |
  STA $04,x                                 ; $0D81B1 |
  DEX                                       ; $0D81B3 |
  DEX                                       ; $0D81B4 |
  BPL CODE_0D81AB                           ; $0D81B5 |
  TYA                                       ; $0D81B7 |
  CLC                                       ; $0D81B8 |
  ADC #$00A0                                ; $0D81B9 |
  TAY                                       ; $0D81BC |
  LDX #$0002                                ; $0D81BD |

CODE_0D81C0:
  LDA $04,x                                 ; $0D81C0 |
  STA $0C                                   ; $0D81C2 |
  LDA $08,x                                 ; $0D81C4 |
  STA $0E                                   ; $0D81C6 |
  JSR CODE_0D81F3                           ; $0D81C8 |
  TYA                                       ; $0D81CB |
  SEC                                       ; $0D81CC |
  SBC #$0020                                ; $0D81CD |
  TAY                                       ; $0D81D0 |
  DEX                                       ; $0D81D1 |
  DEX                                       ; $0D81D2 |
  BPL CODE_0D81C0                           ; $0D81D3 |
  LDA $04                                   ; $0D81D5 |
  CLC                                       ; $0D81D7 |
  ADC $06                                   ; $0D81D8 |
  CMP #$8000                                ; $0D81DA |
  ROR A                                     ; $0D81DD |
  STA $0C                                   ; $0D81DE |
  LDA $08                                   ; $0D81E0 |
  CLC                                       ; $0D81E2 |
  ADC $0A                                   ; $0D81E3 |
  CMP #$8000                                ; $0D81E5 |
  ROR A                                     ; $0D81E8 |
  STA $0E                                   ; $0D81E9 |
  JSR CODE_0D81F3                           ; $0D81EB |
  SEP #$10                                  ; $0D81EE |
  LDX $12                                   ; $0D81F0 |
  RTS                                       ; $0D81F2 |

CODE_0D81F3:
  LDA $00                                   ; $0D81F3 |
  CLC                                       ; $0D81F5 |
  ADC $0E                                   ; $0D81F6 |
  STA $6008,y                               ; $0D81F8 |
  STA $6018,y                               ; $0D81FB |
  SEC                                       ; $0D81FE |
  SBC #$0010                                ; $0D81FF |
  STA $6000,y                               ; $0D8202 |
  STA $6010,y                               ; $0D8205 |
  LDA $02                                   ; $0D8208 |
  CLC                                       ; $0D820A |
  ADC $0C                                   ; $0D820B |
  STA $6012,y                               ; $0D820D |
  STA $601A,y                               ; $0D8210 |
  SEC                                       ; $0D8213 |
  SBC #$0010                                ; $0D8214 |
  STA $6002,y                               ; $0D8217 |
  STA $600A,y                               ; $0D821A |
  RTS                                       ; $0D821D |

CODE_0D821E:
  LDA $18,x                                 ; $0D821E |
  STA $00                                   ; $0D8220 |
  LDA $76,x                                 ; $0D8222 |
  STA $02                                   ; $0D8224 |
  CLC                                       ; $0D8226 |
  ADC $00                                   ; $0D8227 |
  CMP #$8000                                ; $0D8229 |
  ROR A                                     ; $0D822C |
  STA $04                                   ; $0D822D |
  LDA $78,x                                 ; $0D822F |
  STA $06                                   ; $0D8231 |
  LDA $7A36,x                               ; $0D8233 |
  STA $08                                   ; $0D8236 |
  CLC                                       ; $0D8238 |
  ADC $06                                   ; $0D8239 |
  CMP #$8000                                ; $0D823B |
  ROR A                                     ; $0D823E |
  STA $0A                                   ; $0D823F |
  LDA $7C16,x                               ; $0D8241 |
  STA $0C                                   ; $0D8244 |
  LDA $7C18,x                               ; $0D8246 |
  STA $0E                                   ; $0D8249 |
  LDA $6120                                 ; $0D824B |
  CLC                                       ; $0D824E |
  ADC #$000A                                ; $0D824F |
  STA $3000                                 ; $0D8252 |
  ASL A                                     ; $0D8255 |
  STA $3002                                 ; $0D8256 |
  LDA $6122                                 ; $0D8259 |
  CLC                                       ; $0D825C |
  ADC #$000A                                ; $0D825D |
  STA $3004                                 ; $0D8260 |
  ASL A                                     ; $0D8263 |
  STA $3006                                 ; $0D8264 |
  JSR CODE_0D8284                           ; $0D8267 |
  LDA $7360,x                               ; $0D826A |
  CMP #$0101                                ; $0D826D |
  BEQ CODE_0D8283                           ; $0D8270 |
  LDX #$0A                                  ; $0D8272 |

CODE_0D8274:
  LDA $00,x                                 ; $0D8274 |
  EOR #$FFFF                                ; $0D8276 |
  INC A                                     ; $0D8279 |
  STA $00,x                                 ; $0D827A |
  DEX                                       ; $0D827C |
  DEX                                       ; $0D827D |
  BPL CODE_0D8274                           ; $0D827E |
  JSR CODE_0D8284                           ; $0D8280 |

CODE_0D8283:
  RTS                                       ; $0D8283 |

CODE_0D8284:
  LDX #$04                                  ; $0D8284 |

CODE_0D8286:
  LDA $06,x                                 ; $0D8286 |
  CLC                                       ; $0D8288 |
  ADC $0C                                   ; $0D8289 |
  CLC                                       ; $0D828B |
  ADC $3000                                 ; $0D828C |
  CMP $3002                                 ; $0D828F |
  BCS CODE_0D82A2                           ; $0D8292 |
  LDA $00,x                                 ; $0D8294 |
  CLC                                       ; $0D8296 |
  ADC $0E                                   ; $0D8297 |
  CLC                                       ; $0D8299 |
  ADC $3004                                 ; $0D829A |
  CMP $3006                                 ; $0D829D |
  BCC CODE_0D82A9                           ; $0D82A0 |

CODE_0D82A2:
  DEX                                       ; $0D82A2 |
  DEX                                       ; $0D82A3 |
  BPL CODE_0D8286                           ; $0D82A4 |
  LDX $12                                   ; $0D82A6 |
  RTS                                       ; $0D82A8 |

CODE_0D82A9:
  LDX $12                                   ; $0D82A9 |
  JSL $03A858                               ; $0D82AB |
  PLA                                       ; $0D82AF |
  RTS                                       ; $0D82B0 |

CODE_0D82B1:
  LDA $7722,x                               ; $0D82B1 |
  LSR A                                     ; $0D82B4 |
  LSR A                                     ; $0D82B5 |
  LSR A                                     ; $0D82B6 |
  SEC                                       ; $0D82B7 |
  SBC $0030                                 ; $0D82B8 |
  AND #$0001                                ; $0D82BB |
  BNE CODE_0D833C                           ; $0D82BE |

CODE_0D82C0:
  LDA $7A38,x                               ; $0D82C0 |
  CLC                                       ; $0D82C3 |
  ADC $7900,x                               ; $0D82C4 |
  AND #$01FE                                ; $0D82C7 |
  STA $7A38,x                               ; $0D82CA |
  LDA #$00A0                                ; $0D82CD |
  STA $3018                                 ; $0D82D0 |
  LDA #$0055                                ; $0D82D3 |
  STA $301A                                 ; $0D82D6 |
  LDA $7A38,x                               ; $0D82D9 |
  LSR A                                     ; $0D82DC |
  STA $300A                                 ; $0D82DD |
  LDA #$0100                                ; $0D82E0 |
  STA $300C                                 ; $0D82E3 |
  LDY $7722,x                               ; $0D82E6 |
  TYX                                       ; $0D82E9 |
  LDA $03A9CE,x                             ; $0D82EA |
  STA $3006                                 ; $0D82EE |
  LDA $03A9EE,x                             ; $0D82F1 |
  STA $3004                                 ; $0D82F5 |
  LDX #$08                                  ; $0D82F8 |
  LDA #$8205                                ; $0D82FA |
  JSL $7EDE44                               ; $0D82FD | GSU init
  LDX $12                                   ; $0D8301 |
  LDA #$00C0                                ; $0D8303 |
  STA $3018                                 ; $0D8306 |
  LDA #$0055                                ; $0D8309 |
  STA $301A                                 ; $0D830C |
  LDA $7A38,x                               ; $0D830F |
  LSR A                                     ; $0D8312 |
  STA $300A                                 ; $0D8313 |
  LDA #$0100                                ; $0D8316 |
  STA $300C                                 ; $0D8319 |
  LDY $7902,x                               ; $0D831C |
  TYX                                       ; $0D831F |
  LDA $03A9CE,x                             ; $0D8320 |
  STA $3006                                 ; $0D8324 |
  LDA $03A9EE,x                             ; $0D8327 |
  STA $3004                                 ; $0D832B |
  LDX #$08                                  ; $0D832E |
  LDA #$8205                                ; $0D8330 |
  JSL $7EDE44                               ; $0D8333 | GSU init
  LDX $12                                   ; $0D8337 |
  INC $0CF9                                 ; $0D8339 |

CODE_0D833C:
  RTS                                       ; $0D833C |

DATA_0D833D:         dw $FFE0, $0020, $FFF0, $0020
DATA_0D8345:         dw $FFE0, $0010, $FFF0, $0010

init_boo_guys_carrying_bombs_left:
  LDA #$0000                                ; $0D834D |
  BRA CODE_0D8355                           ; $0D8350 |

init_boo_guys_carrying_bombs_right:
  LDA #$0002                                ; $0D8352 |

CODE_0D8355:
  STA $7400,x                               ; $0D8355 |
  STA $7A36,x                               ; $0D8358 |
  ASL A                                     ; $0D835B |
  TAY                                       ; $0D835C |
  LDA $70E2,x                               ; $0D835D |
  AND #$0010                                ; $0D8360 |
  BEQ CODE_0D8367                           ; $0D8363 |
  INY                                       ; $0D8365 |
  INY                                       ; $0D8366 |

CODE_0D8367:
  LDA $0EEF,y                               ; $0D8367 |
  BEQ CODE_0D8370                           ; $0D836A |
  JML $03A31E                               ; $0D836C |

CODE_0D8370:
  LDA #$0001                                ; $0D8370 |
  STA $0EEF,y                               ; $0D8373 |
  TYA                                       ; $0D8376 |
  ASL A                                     ; $0D8377 |
  ASL A                                     ; $0D8378 |
  ASL A                                     ; $0D8379 |
  TAY                                       ; $0D837A |
  STY $78,x                                 ; $0D837B |
  LDA #$FFFF                                ; $0D837D |
  STA $0EF7,y                               ; $0D8380 |
  STA $0EF9,y                               ; $0D8383 |
  STA $0EFB,y                               ; $0D8386 |
  STA $0EFD,y                               ; $0D8389 |
  STA $0EFF,y                               ; $0D838C |
  STA $0F01,y                               ; $0D838F |
  STA $0F03,y                               ; $0D8392 |
  STA $0F05,y                               ; $0D8395 |
  INC A                                     ; $0D8398 |
  STA $0F37,y                               ; $0D8399 |
  STA $0F39,y                               ; $0D839C |
  STA $0F3B,y                               ; $0D839F |
  STA $0F3D,y                               ; $0D83A2 |
  STA $0F3F,y                               ; $0D83A5 |
  STA $0F41,y                               ; $0D83A8 |
  STA $0F43,y                               ; $0D83AB |
  STA $0F45,y                               ; $0D83AE |
  LDY $7400,x                               ; $0D83B1 |
  LDA $8349,y                               ; $0D83B4 |
  CLC                                       ; $0D83B7 |
  ADC $7CD6,x                               ; $0D83B8 |
  STA $3010                                 ; $0D83BB |
  LDA $7CD8,x                               ; $0D83BE |
  STA $3000                                 ; $0D83C1 |
  LDX #$0A                                  ; $0D83C4 |
  LDA #$CE2F                                ; $0D83C6 |
  JSL $7EDE91                               ; $0D83C9 | GSU init
  LDY #$02                                  ; $0D83CD |
  LDA $300C                                 ; $0D83CF |
  CMP #$00B6                                ; $0D83D2 |
  BMI CODE_0D83DC                           ; $0D83D5 |
  CMP #$00BB                                ; $0D83D7 |
  BMI CODE_0D83DE                           ; $0D83DA |

CODE_0D83DC:
  LDY #$00                                  ; $0D83DC |

CODE_0D83DE:
  LDX $12                                   ; $0D83DE |
  TYA                                       ; $0D83E0 |
  EOR $7400,x                               ; $0D83E1 |
  TAY                                       ; $0D83E4 |
  LDA $833D,y                               ; $0D83E5 |
  STA $06                                   ; $0D83E8 |
  LDA $7400,x                               ; $0D83EA |
  BEQ CODE_0D83F5                           ; $0D83ED |
  TYA                                       ; $0D83EF |
  CLC                                       ; $0D83F0 |
  ADC #$0004                                ; $0D83F1 |
  TAY                                       ; $0D83F4 |

CODE_0D83F5:
  LDA $8341,y                               ; $0D83F5 |
  CLC                                       ; $0D83F8 |
  ADC $7CD6,x                               ; $0D83F9 |
  STA $04                                   ; $0D83FC |
  STA $0A                                   ; $0D83FE |
  STZ $08                                   ; $0D8400 |
  LDA $7CD8,x                               ; $0D8402 |
  STA $02                                   ; $0D8405 |

CODE_0D8407:
  LDA $02                                   ; $0D8407 |
  STA $3000                                 ; $0D8409 |
  LDA $04                                   ; $0D840C |
  STA $3010                                 ; $0D840E |
  LDX #$0A                                  ; $0D8411 |
  LDA #$CE2F                                ; $0D8413 |
  JSL $7EDE91                               ; $0D8416 | GSU init
  LDA $300C                                 ; $0D841A |
  CMP #$00B6                                ; $0D841D |
  BMI CODE_0D8427                           ; $0D8420 |
  CMP #$00BB                                ; $0D8422 |
  BMI CODE_0D8432                           ; $0D8425 |

CODE_0D8427:
  LDA $04                                   ; $0D8427 |
  CLC                                       ; $0D8429 |
  ADC $06                                   ; $0D842A |
  STA $04                                   ; $0D842C |
  INC $08                                   ; $0D842E |
  BRA CODE_0D8407                           ; $0D8430 |

CODE_0D8432:
  LDX $12                                   ; $0D8432 |
  LDY $08                                   ; $0D8434 |
  STY $18,x                                 ; $0D8436 |
  TYA                                       ; $0D8438 |
  CLC                                       ; $0D8439 |
  ADC #$0009                                ; $0D843A |
  ASL A                                     ; $0D843D |
  ASL A                                     ; $0D843E |
  ASL A                                     ; $0D843F |
  XBA                                       ; $0D8440 |
  ORA $7040,x                               ; $0D8441 |
  STA $7040,x                               ; $0D8444 |
  LDA $04                                   ; $0D8447 |
  SEC                                       ; $0D8449 |
  SBC $0A                                   ; $0D844A |
  STA $00                                   ; $0D844C |
  LDA $7400,x                               ; $0D844E |
  DEC A                                     ; $0D8451 |
  EOR $00                                   ; $0D8452 |
  BPL CODE_0D8467                           ; $0D8454 |
  LDA $70E2,x                               ; $0D8456 |
  CLC                                       ; $0D8459 |
  ADC $00                                   ; $0D845A |
  STA $70E2,x                               ; $0D845C |
  LDA $00                                   ; $0D845F |
  EOR #$FFFF                                ; $0D8461 |
  INC A                                     ; $0D8464 |
  STA $00                                   ; $0D8465 |

CODE_0D8467:
  LDA $00                                   ; $0D8467 |
  EOR #$FFFF                                ; $0D8469 |
  INC A                                     ; $0D846C |
  BMI CODE_0D847E                           ; $0D846D |
  CLC                                       ; $0D846F |
  ADC #$0140                                ; $0D8470 |
  STA $7902,x                               ; $0D8473 |
  LDA #$FFC0                                ; $0D8476 |
  STA $7900,x                               ; $0D8479 |
  BRA CODE_0D848B                           ; $0D847C |

CODE_0D847E:
  SEC                                       ; $0D847E |
  SBC #$0040                                ; $0D847F |
  STA $7900,x                               ; $0D8482 |
  LDA #$0140                                ; $0D8485 |
  STA $7902,x                               ; $0D8488 |

CODE_0D848B:
  LDY $0136                                 ; $0D848B |
  CPY #$06                                  ; $0D848E |
  BEQ CODE_0D8496                           ; $0D8490 |
  CPY #$0E                                  ; $0D8492 |
  BNE CODE_0D84A0                           ; $0D8494 |

CODE_0D8496:
  LDA $7182,x                               ; $0D8496 |
  SEC                                       ; $0D8499 |
  SBC #$0008                                ; $0D849A |
  STA $7182,x                               ; $0D849D |

CODE_0D84A0:
  LDY #$10                                  ; $0D84A0 |
  STY $16,x                                 ; $0D84A2 |
  RTL                                       ; $0D84A4 |

DATA_0D84A5:         dw $8787
DATA_0D84A7:         dw $88D0
DATA_0D84A9:         dw $8997

main_boo_guys_carrying_bombs:
  JSR CODE_0D85B8                           ; $0D84AB |
  JSL $03AF23                               ; $0D84AE |
  JSR CODE_0D8729                           ; $0D84B2 |
  TXY                                       ; $0D84B5 |
  LDA $76,x                                 ; $0D84B6 |
  ASL A                                     ; $0D84B8 |
  TAX                                       ; $0D84B9 |
  JSR ($84A5,x)                             ; $0D84BA |
  JSR CODE_0D8757                           ; $0D84BD |
  LDA $61C6                                 ; $0D84C0 |
  BEQ CODE_0D84CF                           ; $0D84C3 |
  LDY $76,x                                 ; $0D84C5 |
  BNE CODE_0D84CF                           ; $0D84C7 |
  LDY #$16                                  ; $0D84C9 |
  STY $16,x                                 ; $0D84CB |
  INC $76,x                                 ; $0D84CD |

CODE_0D84CF:
  RTL                                       ; $0D84CF |

DATA_0D84D0:         dw $0000, $0000, $0002, $0002
DATA_0D84D8:         dw $0002, $0004, $0004, $0004
DATA_0D84E0:         dw $0004, $0004, $0004, $0002
DATA_0D84E8:         dw $0002, $0002, $0002, $0000
DATA_0D84F0:         dw $0000, $0006, $0006, $0006
DATA_0D84F8:         dw $0006, $0006, $0006, $0008
DATA_0D8500:         dw $000A, $000C, $000C, $000A
DATA_0D8508:         dw $000E

DATA_0D850A:         dw $4000, $4000, $4000, $4000
DATA_0D8512:         dw $4000, $4000, $4000, $4000
DATA_0D851A:         dw $0000, $0000, $0000, $0000
DATA_0D8522:         dw $0000, $0000, $0000, $0000
DATA_0D852A:         dw $0000, $0000, $0000, $0000
DATA_0D8532:         dw $0000, $0000, $0000, $0000
DATA_0D853A:         dw $4000, $4000, $0000, $0000
DATA_0D8542:         dw $0000

DATA_0D8544:         dw $8000, $0010, $0010, $0010
DATA_0D854C:         dw $000F, $000D, $000A, $0006
DATA_0D8554:         dw $0000, $FFFA, $FFF6, $FFF3
DATA_0D855C:         dw $FFF1, $FFF0, $FFF0, $FFF0
DATA_0D8564:         dw $8000, $0000, $0000, $0000
DATA_0D856C:         dw $0000, $0000, $8000, $8000
DATA_0D8574:         dw $8000, $8000, $8000, $8000
DATA_0D857C:         dw $8000

DATA_0D857E:         dw $8000, $0000, $0000, $0000
DATA_0D8586:         dw $FFFF, $FFFE, $FFFD, $FFFD
DATA_0D858E:         dw $FFFD, $FFFD, $FFFD, $FFFE
DATA_0D8596:         dw $FFFF, $0000, $0000, $0000
DATA_0D859E:         dw $8000, $FFF9, $FFF6, $FFF4
DATA_0D85A6:         dw $FFF3, $FFF2, $8000, $8000
DATA_0D85AE:         dw $8000, $8000, $8000, $8000
DATA_0D85B6:         dw $8000

CODE_0D85B8:
  LDA $70E2,x                               ; $0D85B8 |
  SEC                                       ; $0D85BB |
  SBC $6094                                 ; $0D85BC |
  STA $00                                   ; $0D85BF |
  LDA $7182,x                               ; $0D85C1 |
  SEC                                       ; $0D85C4 |
  SBC $609C                                 ; $0D85C5 |
  STA $02                                   ; $0D85C8 |
  LDY #$00                                  ; $0D85CA |
  LDA $7360,x                               ; $0D85CC |
  CMP #$0105                                ; $0D85CF |
  BEQ CODE_0D85D6                           ; $0D85D2 |
  INY                                       ; $0D85D4 |
  INY                                       ; $0D85D5 |

CODE_0D85D6:
  LDA $833D,y                               ; $0D85D6 |
  STA $04                                   ; $0D85D9 |
  LDA $18,x                                 ; $0D85DB |
  STA $0E                                   ; $0D85DD |
  STA $3002                                 ; $0D85DF |
  REP #$10                                  ; $0D85E2 |
  LDY $7362,x                               ; $0D85E4 |
  STY $06                                   ; $0D85E7 |
  LDA #$8000                                ; $0D85E9 |
  STA $6000,y                               ; $0D85EC |
  STA $6008,y                               ; $0D85EF |
  STA $6010,y                               ; $0D85F2 |
  STA $6018,y                               ; $0D85F5 |
  STA $6020,y                               ; $0D85F8 |
  STA $6028,y                               ; $0D85FB |
  STA $6030,y                               ; $0D85FE |
  STA $6038,y                               ; $0D8601 |
  TYA                                       ; $0D8604 |
  CLC                                       ; $0D8605 |
  ADC #$0040                                ; $0D8606 |
  STA $0C                                   ; $0D8609 |
  TAY                                       ; $0D860B |
  PHY                                       ; $0D860C |
  LDA $16,x                                 ; $0D860D |
  ASL A                                     ; $0D860F |
  TAY                                       ; $0D8610 |
  LDA $84D0,y                               ; $0D8611 |
  STA $08                                   ; $0D8614 |
  LDA $850A,y                               ; $0D8616 |
  STA $0A                                   ; $0D8619 |
  PLY                                       ; $0D861B |

CODE_0D861C:
  LDA $00                                   ; $0D861C |
  CLC                                       ; $0D861E |
  ADC #$0040                                ; $0D861F |
  CMP #$0180                                ; $0D8622 |
  BCC CODE_0D862C                           ; $0D8625 |
  LDA #$8000                                ; $0D8627 |
  BRA CODE_0D862E                           ; $0D862A |

CODE_0D862C:
  LDA $00                                   ; $0D862C |

CODE_0D862E:
  STA $6000,y                               ; $0D862E |
  LDA $02                                   ; $0D8631 |
  STA $6002,y                               ; $0D8633 |
  LDA $6004,y                               ; $0D8636 |
  ORA $08                                   ; $0D8639 |
  EOR $0A                                   ; $0D863B |
  STA $6004,y                               ; $0D863D |
  LDA $00                                   ; $0D8640 |
  CLC                                       ; $0D8642 |
  ADC $04                                   ; $0D8643 |
  STA $00                                   ; $0D8645 |
  TYA                                       ; $0D8647 |
  CLC                                       ; $0D8648 |
  ADC #$0008                                ; $0D8649 |
  TAY                                       ; $0D864C |
  DEC $0E                                   ; $0D864D |
  BPL CODE_0D861C                           ; $0D864F |
  LDY $08                                   ; $0D8651 |
  CPY #$0006                                ; $0D8653 |
  BNE CODE_0D865B                           ; $0D8656 |
  SEP #$10                                  ; $0D8658 |
  RTS                                       ; $0D865A |

CODE_0D865B:
  LDA $7400,x                               ; $0D865B |
  STA $0A                                   ; $0D865E |
  XBA                                       ; $0D8660 |
  ASL A                                     ; $0D8661 |
  ASL A                                     ; $0D8662 |
  ASL A                                     ; $0D8663 |
  ASL A                                     ; $0D8664 |
  ASL A                                     ; $0D8665 |
  STA $08                                   ; $0D8666 |
  LDA $16,x                                 ; $0D8668 |
  SEC                                       ; $0D866A |
  SBC #$0010                                ; $0D866B |
  STA $3014                                 ; $0D866E |
  STZ $00                                   ; $0D8671 |
  LDA #$0007                                ; $0D8673 |
  STA $0E                                   ; $0D8676 |
  ASL A                                     ; $0D8678 |
  CLC                                       ; $0D8679 |
  ADC $78,x                                 ; $0D867A |
  TAX                                       ; $0D867C |

CODE_0D867D:
  LDA $0EF7,x                               ; $0D867D |
  BPL CODE_0D8685                           ; $0D8680 |
  JMP CODE_0D871B                           ; $0D8682 |

CODE_0D8685:
  STA $3000                                 ; $0D8685 |
  ASL A                                     ; $0D8688 |
  ASL A                                     ; $0D8689 |
  ASL A                                     ; $0D868A |
  CLC                                       ; $0D868B |
  ADC $0C                                   ; $0D868C |
  TAY                                       ; $0D868E |
  PHX                                       ; $0D868F |
  LDA $0F37,x                               ; $0D8690 |
  PHA                                       ; $0D8693 |
  LDA $3014                                 ; $0D8694 |
  BEQ CODE_0D86A5                           ; $0D8697 |
  LDA #$8000                                ; $0D8699 |
  STA $02                                   ; $0D869C |
  PLA                                       ; $0D869E |
  PHA                                       ; $0D869F |
  CMP #$001C                                ; $0D86A0 |
  BNE CODE_0D86D4                           ; $0D86A3 |

CODE_0D86A5:
  PLA                                       ; $0D86A5 |
  PHA                                       ; $0D86A6 |
  ASL A                                     ; $0D86A7 |
  TAX                                       ; $0D86A8 |
  LDA $84D0,x                               ; $0D86A9 |
  ORA $6004,y                               ; $0D86AC |
  AND #$BFFF                                ; $0D86AF |
  ORA $08                                   ; $0D86B2 |
  EOR $850A,x                               ; $0D86B4 |
  STA $6004,y                               ; $0D86B7 |
  LDA $857E,x                               ; $0D86BA |
  CLC                                       ; $0D86BD |
  ADC $6002,y                               ; $0D86BE |
  STA $04                                   ; $0D86C1 |
  LDA $8544,x                               ; $0D86C3 |
  LDX $0A                                   ; $0D86C6 |
  BEQ CODE_0D86CE                           ; $0D86C8 |
  EOR #$FFFF                                ; $0D86CA |
  INC A                                     ; $0D86CD |

CODE_0D86CE:
  CLC                                       ; $0D86CE |
  ADC $6000,y                               ; $0D86CF |
  STA $02                                   ; $0D86D2 |

CODE_0D86D4:
  LDA $3000                                 ; $0D86D4 |
  CMP $3002                                 ; $0D86D7 |
  BNE CODE_0D86DF                           ; $0D86DA |
  PLA                                       ; $0D86DC |
  BRA CODE_0D8702                           ; $0D86DD |

CODE_0D86DF:
  TYA                                       ; $0D86DF |
  CLC                                       ; $0D86E0 |
  ADC #$0008                                ; $0D86E1 |
  TAY                                       ; $0D86E4 |
  PLA                                       ; $0D86E5 |
  SEC                                       ; $0D86E6 |
  SBC #$000C                                ; $0D86E7 |
  BMI CODE_0D86F1                           ; $0D86EA |
  CMP #$0004                                ; $0D86EC |
  BMI CODE_0D86F4                           ; $0D86EF |

CODE_0D86F1:
  LDA #$0000                                ; $0D86F1 |

CODE_0D86F4:
  ASL A                                     ; $0D86F4 |
  TAX                                       ; $0D86F5 |
  LDA $6004,y                               ; $0D86F6 |
  EOR #$4000                                ; $0D86F9 |
  ORA $84D0,x                               ; $0D86FC |
  STA $6004,y                               ; $0D86FF |

CODE_0D8702:
  LDA $06                                   ; $0D8702 |
  CLC                                       ; $0D8704 |
  ADC $00                                   ; $0D8705 |
  TAY                                       ; $0D8707 |
  LDA $04                                   ; $0D8708 |
  STA $6002,y                               ; $0D870A |
  LDA $02                                   ; $0D870D |
  STA $6000,y                               ; $0D870F |
  LDA $00                                   ; $0D8712 |
  CLC                                       ; $0D8714 |
  ADC #$0008                                ; $0D8715 |
  STA $00                                   ; $0D8718 |
  PLX                                       ; $0D871A |

CODE_0D871B:
  DEX                                       ; $0D871B |
  DEX                                       ; $0D871C |
  DEC $0E                                   ; $0D871D |
  BMI CODE_0D8724                           ; $0D871F |
  JMP CODE_0D867D                           ; $0D8721 |

CODE_0D8724:
  LDX $12                                   ; $0D8724 |
  SEP #$10                                  ; $0D8726 |
  RTS                                       ; $0D8728 |

CODE_0D8729:
  LDA $7680,x                               ; $0D8729 |
  CMP $7900,x                               ; $0D872C |
  BMI CODE_0D8736                           ; $0D872F |
  CMP $7902,x                               ; $0D8731 |
  BMI CODE_0D8756                           ; $0D8734 |

CODE_0D8736:
  JSL $03A31E                               ; $0D8736 |
  LDY #$00                                  ; $0D873A |
  LDA $7360,x                               ; $0D873C |
  CMP #$0105                                ; $0D873F |
  BEQ CODE_0D8746                           ; $0D8742 |
  LDY #$04                                  ; $0D8744 |

CODE_0D8746:
  LDA $70E2,x                               ; $0D8746 |
  AND #$0010                                ; $0D8749 |
  BEQ CODE_0D8750                           ; $0D874C |
  INY                                       ; $0D874E |
  INY                                       ; $0D874F |

CODE_0D8750:
  LDA #$0000                                ; $0D8750 |
  STA $0EEF,y                               ; $0D8753 |

CODE_0D8756:
  RTS                                       ; $0D8756 |

CODE_0D8757:
  LDY #$07                                  ; $0D8757 |
  TYA                                       ; $0D8759 |
  ASL A                                     ; $0D875A |
  CLC                                       ; $0D875B |
  ADC $78,x                                 ; $0D875C |
  TAX                                       ; $0D875E |

CODE_0D875F:
  LDA $0F77,x                               ; $0D875F |
  BEQ CODE_0D8767                           ; $0D8762 |
  DEC $0F77,x                               ; $0D8764 |

CODE_0D8767:
  DEX                                       ; $0D8767 |
  DEX                                       ; $0D8768 |
  DEY                                       ; $0D8769 |
  BPL CODE_0D875F                           ; $0D876A |
  LDX $12                                   ; $0D876C |
  RTS                                       ; $0D876E |

DATA_0D876F:         db $02, $02, $03, $03, $02, $02, $02, $02
DATA_0D8777:         db $02, $02, $02, $02, $02, $03, $03, $02
DATA_0D877F:         db $02, $02, $02, $02, $02, $02, $08, $10

  TYX                                       ; $0D8787 |
  LDA $7A96,x                               ; $0D8788 |
  BNE CODE_0D87B5                           ; $0D878B |
  LDA #$0100                                ; $0D878D |
  STA $7A96,x                               ; $0D8790 |
  LDY #$07                                  ; $0D8793 |
  TYA                                       ; $0D8795 |
  ASL A                                     ; $0D8796 |
  CLC                                       ; $0D8797 |
  ADC $78,x                                 ; $0D8798 |
  TAX                                       ; $0D879A |

CODE_0D879B:
  LDA $0EF7,x                               ; $0D879B |
  BMI CODE_0D87A7                           ; $0D879E |
  DEX                                       ; $0D87A0 |
  DEX                                       ; $0D87A1 |
  DEY                                       ; $0D87A2 |
  BPL CODE_0D879B                           ; $0D87A3 |
  BRA CODE_0D87B5                           ; $0D87A5 |

CODE_0D87A7:
  STZ $0EF7,x                               ; $0D87A7 |
  STZ $0F37,x                               ; $0D87AA |
  LDA #$0003                                ; $0D87AD |
  STA $0F77,x                               ; $0D87B0 |
  LDX $12                                   ; $0D87B3 |

CODE_0D87B5:
  LDA $18,x                                 ; $0D87B5 |
  STA $00                                   ; $0D87B7 |
  LDA $7C16,x                               ; $0D87B9 |
  STA $02                                   ; $0D87BC |
  LDA $7400,x                               ; $0D87BE |
  STA $04                                   ; $0D87C1 |
  LDY #$07                                  ; $0D87C3 |
  TYA                                       ; $0D87C5 |
  ASL A                                     ; $0D87C6 |
  CLC                                       ; $0D87C7 |
  ADC $78,x                                 ; $0D87C8 |
  TAX                                       ; $0D87CA |

CODE_0D87CB:
  LDA $0EF7,x                               ; $0D87CB |
  BMI CODE_0D87E0                           ; $0D87CE |
  LDA $0F37,x                               ; $0D87D0 |
  CMP #$0011                                ; $0D87D3 |
  BMI CODE_0D87DD                           ; $0D87D6 |
  JSR CODE_0D87E8                           ; $0D87D8 |
  BRA CODE_0D87E0                           ; $0D87DB |

CODE_0D87DD:
  JSR CODE_0D886A                           ; $0D87DD |

CODE_0D87E0:
  DEX                                       ; $0D87E0 |
  DEX                                       ; $0D87E1 |
  DEY                                       ; $0D87E2 |
  BPL CODE_0D87CB                           ; $0D87E3 |
  LDX $12                                   ; $0D87E5 |

CODE_0D87E7:
  RTS                                       ; $0D87E7 |

CODE_0D87E8:
  LDA $0F77,x                               ; $0D87E8 |
  BNE CODE_0D87E7                           ; $0D87EB |
  INC $0F37,x                               ; $0D87ED |
  PHY                                       ; $0D87F0 |
  LDA $0F37,x                               ; $0D87F1 |
  CMP #$0016                                ; $0D87F4 |
  BNE CODE_0D885D                           ; $0D87F7 |
  LDA $0EF7,x                               ; $0D87F9 |
  STA $00                                   ; $0D87FC |
  PHX                                       ; $0D87FE |
  LDX $12                                   ; $0D87FF |
  LDA #$0060                                ; $0D8801 |
  JSL $03A364                               ; $0D8804 |
  BCC CODE_0D8854                           ; $0D8808 |
  LDA $00                                   ; $0D880A |
  ASL A                                     ; $0D880C |
  ASL A                                     ; $0D880D |
  ASL A                                     ; $0D880E |
  ASL A                                     ; $0D880F |
  ASL A                                     ; $0D8810 |
  PHY                                       ; $0D8811 |
  LDY $7400,x                               ; $0D8812 |
  BNE CODE_0D881B                           ; $0D8815 |
  EOR #$FFFF                                ; $0D8817 |
  INC A                                     ; $0D881A |

CODE_0D881B:
  PLY                                       ; $0D881B |
  CLC                                       ; $0D881C |
  ADC $70E2,x                               ; $0D881D |
  STA $70E2,y                               ; $0D8820 |
  LDA $7182,x                               ; $0D8823 |
  SEC                                       ; $0D8826 |
  SBC #$000A                                ; $0D8827 |
  STA $7182,y                               ; $0D882A |
  LDA #$001C                                ; $0D882D |
  STA $7A96,y                               ; $0D8830 |
  LDA $7400,x                               ; $0D8833 |
  STA $7400,y                               ; $0D8836 |
  LDA $10                                   ; $0D8839 |
  AND #$001F                                ; $0D883B |
  CLC                                       ; $0D883E |
  ADC #$0030                                ; $0D883F |
  STA $7976,y                               ; $0D8842 |
  SEP #$20                                  ; $0D8845 |
  LDA #$7F                                  ; $0D8847 |
  STA $7863,y                               ; $0D8849 |
  REP #$20                                  ; $0D884C |
  PLX                                       ; $0D884E |
  LDA #$0016                                ; $0D884F |
  BRA CODE_0D88C4                           ; $0D8852 |

CODE_0D8854:
  PLX                                       ; $0D8854 |
  DEC $0F37,x                               ; $0D8855 |
  LDA #$0015                                ; $0D8858 |
  BRA CODE_0D88C4                           ; $0D885B |

CODE_0D885D:
  CMP #$0018                                ; $0D885D |
  BNE CODE_0D88C4                           ; $0D8860 |
  LDA #$FFFF                                ; $0D8862 |
  STA $0EF7,x                               ; $0D8865 |
  PLY                                       ; $0D8868 |
  RTS                                       ; $0D8869 |

CODE_0D886A:
  LDA $0F77,x                               ; $0D886A |
  BNE CODE_0D88CF                           ; $0D886D |
  INC $0F37,x                               ; $0D886F |
  PHY                                       ; $0D8872 |
  LDA $0F37,x                               ; $0D8873 |
  CMP #$0009                                ; $0D8876 |
  BNE CODE_0D88A8                           ; $0D8879 |
  LDA $0EF7,x                               ; $0D887B |
  CMP $00                                   ; $0D887E |
  BEQ CODE_0D88A0                           ; $0D8880 |
  ASL A                                     ; $0D8882 |
  ASL A                                     ; $0D8883 |
  ASL A                                     ; $0D8884 |
  ASL A                                     ; $0D8885 |
  ASL A                                     ; $0D8886 |
  LDY $04                                   ; $0D8887 |
  BNE CODE_0D888F                           ; $0D8889 |
  EOR #$FFFF                                ; $0D888B |
  INC A                                     ; $0D888E |

CODE_0D888F:
  CLC                                       ; $0D888F |
  ADC $02                                   ; $0D8890 |
  CLC                                       ; $0D8892 |
  ADC #$0040                                ; $0D8893 |
  CMP #$0080                                ; $0D8896 |
  BCC CODE_0D88A0                           ; $0D8899 |
  LDA #$0009                                ; $0D889B |
  BRA CODE_0D88C4                           ; $0D889E |

CODE_0D88A0:
  LDA #$0011                                ; $0D88A0 |
  STA $0F37,x                               ; $0D88A3 |
  BRA CODE_0D88C4                           ; $0D88A6 |

CODE_0D88A8:
  CMP #$000E                                ; $0D88A8 |
  BNE CODE_0D88B6                           ; $0D88AB |
  PHA                                       ; $0D88AD |
  LDA #$0055                                ; $0D88AE |\ play sound #$0055
  JSL $0085D2                               ; $0D88B1 |/
  PLA                                       ; $0D88B5 |

CODE_0D88B6:
  AND #$000F                                ; $0D88B6 |
  BNE CODE_0D88C4                           ; $0D88B9 |
  INC $0EF7,x                               ; $0D88BB |
  LDA #$0004                                ; $0D88BE |
  STA $0F37,x                               ; $0D88C1 |

CODE_0D88C4:
  TAY                                       ; $0D88C4 |
  LDA $876F,y                               ; $0D88C5 |
  AND #$00FF                                ; $0D88C8 |
  STA $0F77,x                               ; $0D88CB |
  PLY                                       ; $0D88CE |

CODE_0D88CF:
  RTS                                       ; $0D88CF |
  TYX                                       ; $0D88D0 |
  LDA $70E2,x                               ; $0D88D1 |
  STA $00                                   ; $0D88D4 |
  LDA $7400,x                               ; $0D88D6 |
  STA $02                                   ; $0D88D9 |
  LDA $7182,x                               ; $0D88DB |
  STA $06                                   ; $0D88DE |
  LDY #$07                                  ; $0D88E0 |
  TYA                                       ; $0D88E2 |
  ASL A                                     ; $0D88E3 |
  CLC                                       ; $0D88E4 |
  ADC $78,x                                 ; $0D88E5 |
  TAX                                       ; $0D88E7 |

CODE_0D88E8:
  LDA $0EF7,x                               ; $0D88E8 |
  BPL CODE_0D88F0                           ; $0D88EB |
  JMP CODE_0D8972                           ; $0D88ED |

CODE_0D88F0:
  PHX                                       ; $0D88F0 |
  PHY                                       ; $0D88F1 |
  ASL A                                     ; $0D88F2 |
  ASL A                                     ; $0D88F3 |
  ASL A                                     ; $0D88F4 |
  ASL A                                     ; $0D88F5 |
  ASL A                                     ; $0D88F6 |
  LDY $02                                   ; $0D88F7 |
  BNE CODE_0D88FF                           ; $0D88F9 |
  EOR #$FFFF                                ; $0D88FB |
  INC A                                     ; $0D88FE |

CODE_0D88FF:
  CLC                                       ; $0D88FF |
  ADC $00                                   ; $0D8900 |
  STA $04                                   ; $0D8902 |
  LDA $0F37,x                               ; $0D8904 |
  BIT #$000F                                ; $0D8907 |
  BEQ CODE_0D8970                           ; $0D890A |
  CMP #$0016                                ; $0D890C |
  BPL CODE_0D8970                           ; $0D890F |
  ASL A                                     ; $0D8911 |
  TAY                                       ; $0D8912 |
  LDA $857E,y                               ; $0D8913 |
  CLC                                       ; $0D8916 |
  ADC $06                                   ; $0D8917 |
  STA $08                                   ; $0D8919 |
  LDA $8544,y                               ; $0D891B |
  LDY $02                                   ; $0D891E |
  BEQ CODE_0D8926                           ; $0D8920 |
  EOR #$FFFF                                ; $0D8922 |
  INC A                                     ; $0D8925 |

CODE_0D8926:
  CLC                                       ; $0D8926 |
  ADC $04                                   ; $0D8927 |
  STA $04                                   ; $0D8929 |
  LDX $12                                   ; $0D892B |
  LDA #$0060                                ; $0D892D |
  JSL $03A364                               ; $0D8930 |
  BCS CODE_0D893B                           ; $0D8934 |
  PLY                                       ; $0D8936 |
  PLX                                       ; $0D8937 |
  LDX $12                                   ; $0D8938 |
  RTS                                       ; $0D893A |

CODE_0D893B:
  LDA $04                                   ; $0D893B |
  STA $70E2,y                               ; $0D893D |
  LDA $08                                   ; $0D8940 |
  STA $7182,y                               ; $0D8942 |
  LDA #$0020                                ; $0D8945 |
  STA $7A96,y                               ; $0D8948 |
  LDA $7400,x                               ; $0D894B |
  STA $7400,y                               ; $0D894E |
  LDA $10                                   ; $0D8951 |
  AND #$001F                                ; $0D8953 |
  CLC                                       ; $0D8956 |
  ADC #$0030                                ; $0D8957 |
  STA $7976,y                               ; $0D895A |
  SEP #$20                                  ; $0D895D |
  LDA #$7F                                  ; $0D895F |
  STA $7863,y                               ; $0D8961 |
  REP #$20                                  ; $0D8964 |
  PLY                                       ; $0D8966 |
  PLX                                       ; $0D8967 |
  LDA #$001C                                ; $0D8968 |
  STA $0F37,x                               ; $0D896B |
  BRA CODE_0D8972                           ; $0D896E |

CODE_0D8970:
  PLY                                       ; $0D8970 |
  PLX                                       ; $0D8971 |

CODE_0D8972:
  DEX                                       ; $0D8972 |
  DEX                                       ; $0D8973 |
  DEY                                       ; $0D8974 |
  BMI CODE_0D897A                           ; $0D8975 |
  JMP CODE_0D88E8                           ; $0D8977 |

CODE_0D897A:
  LDX $12                                   ; $0D897A |
  LDA #$00C0                                ; $0D897C |
  STA $7A96,x                               ; $0D897F |
  LDA #$0044                                ; $0D8982 |
  STA $7A98,x                               ; $0D8985 |
  LDA #$0040                                ; $0D8988 |
  STA $7AF6,x                               ; $0D898B |
  LDA #$0001                                ; $0D898E |
  STA $7A36,x                               ; $0D8991 |
  INC $76,x                                 ; $0D8994 |
  RTS                                       ; $0D8996 |
  TYX                                       ; $0D8997 |
  LDA $7AF6,x                               ; $0D8998 |
  BNE CODE_0D89FE                           ; $0D899B |
  LDY $16,x                                 ; $0D899D |
  CPY #$16                                  ; $0D899F |
  BNE CODE_0D89A7                           ; $0D89A1 |
  LDY #$18                                  ; $0D89A3 |
  STY $16,x                                 ; $0D89A5 |

CODE_0D89A7:
  LDA $7A96,x                               ; $0D89A7 |
  BNE CODE_0D89CD                           ; $0D89AA |
  LDY #$07                                  ; $0D89AC |
  TYA                                       ; $0D89AE |
  ASL A                                     ; $0D89AF |
  CLC                                       ; $0D89B0 |
  ADC $78,x                                 ; $0D89B1 |
  TAX                                       ; $0D89B3 |

CODE_0D89B4:
  LDA $0EF7,x                               ; $0D89B4 |
  BMI CODE_0D89BF                           ; $0D89B7 |
  LDA #$FFFF                                ; $0D89B9 |
  STA $0EF7,x                               ; $0D89BC |

CODE_0D89BF:
  DEX                                       ; $0D89BF |
  DEX                                       ; $0D89C0 |
  DEY                                       ; $0D89C1 |
  BPL CODE_0D89B4                           ; $0D89C2 |
  LDX $12                                   ; $0D89C4 |
  LDY #$10                                  ; $0D89C6 |
  STY $16,x                                 ; $0D89C8 |
  STZ $76,x                                 ; $0D89CA |
  RTS                                       ; $0D89CC |

CODE_0D89CD:
  LDA $7A98,x                               ; $0D89CD |
  BNE CODE_0D89FE                           ; $0D89D0 |
  LDA #$0004                                ; $0D89D2 |
  STA $7A98,x                               ; $0D89D5 |
  LDA $16,x                                 ; $0D89D8 |
  CLC                                       ; $0D89DA |
  ADC $7A36,x                               ; $0D89DB |
  CMP #$0017                                ; $0D89DE |
  BEQ CODE_0D89ED                           ; $0D89E1 |
  CMP #$001C                                ; $0D89E3 |
  BNE CODE_0D89FC                           ; $0D89E6 |
  LDA #$001A                                ; $0D89E8 |
  BRA CODE_0D89F0                           ; $0D89EB |

CODE_0D89ED:
  LDA #$0019                                ; $0D89ED |

CODE_0D89F0:
  PHA                                       ; $0D89F0 |
  LDA $7A36,x                               ; $0D89F1 |
  EOR #$FFFF                                ; $0D89F4 |
  INC A                                     ; $0D89F7 |
  STA $7A36,x                               ; $0D89F8 |
  PLA                                       ; $0D89FB |

CODE_0D89FC:
  STA $16,x                                 ; $0D89FC |

CODE_0D89FE:
  RTS                                       ; $0D89FE |

init_chained_spike_ball:
  LDA $0FB7                                 ; $0D89FF |
  BEQ CODE_0D8A14                           ; $0D8A02 |
  CPX $0FB7                                 ; $0D8A04 |
  BMI CODE_0D8A0C                           ; $0D8A07 |
  STX $0FB7                                 ; $0D8A09 |

CODE_0D8A0C:
  LDA $0FB9                                 ; $0D8A0C |
  STA $7722,x                               ; $0D8A0F |
  BRA CODE_0D8A21                           ; $0D8A12 |

CODE_0D8A14:
  JSL $03AE60                               ; $0D8A14 |
  STX $0FB7                                 ; $0D8A18 |
  LDA $7722,x                               ; $0D8A1B |
  STA $0FB9                                 ; $0D8A1E |

CODE_0D8A21:
  INC $0FBB                                 ; $0D8A21 |
  LDA #$010D                                ; $0D8A24 |
  JSL $03A364                               ; $0D8A27 |
  BCS CODE_0D8A39                           ; $0D8A2B |
  DEC $0FBB                                 ; $0D8A2D |
  BNE CODE_0D8A35                           ; $0D8A30 |
  STZ $0FB7                                 ; $0D8A32 |

CODE_0D8A35:
  JML $03A31E                               ; $0D8A35 |

CODE_0D8A39:
  STY $18,x                                 ; $0D8A39 |
  LDA $7182,x                               ; $0D8A3B |
  STA $7182,y                               ; $0D8A3E |
  STA $7902,x                               ; $0D8A41 |
  LDA #$0004                                ; $0D8A44 |
  STA $7A98,y                               ; $0D8A47 |
  CLC                                       ; $0D8A4A |
  ADC $70E2,x                               ; $0D8A4B |
  STA $70E2,y                               ; $0D8A4E |
  CLC                                       ; $0D8A51 |
  ADC #$0004                                ; $0D8A52 |
  STA $70E2,x                               ; $0D8A55 |
  STA $3002                                 ; $0D8A58 |
  LDA $7182,x                               ; $0D8A5B |
  CLC                                       ; $0D8A5E |
  ADC #$0020                                ; $0D8A5F |
  STA $3004                                 ; $0D8A62 |
  STZ $3006                                 ; $0D8A65 |
  LDA #$0010                                ; $0D8A68 |
  STA $3008                                 ; $0D8A6B |
  LDX #$0A                                  ; $0D8A6E |
  LDA #$CDFA                                ; $0D8A70 |
  JSL $7EDE91                               ; $0D8A73 | GSU init
  LDX $12                                   ; $0D8A77 |
  LDY $3018                                 ; $0D8A79 |
  CPY #$0B                                  ; $0D8A7C |
  BPL CODE_0D8A85                           ; $0D8A7E |
  LDA #$8000                                ; $0D8A80 |
  BRA CODE_0D8A90                           ; $0D8A83 |

CODE_0D8A85:
  LDA #$0013                                ; $0D8A85 |
  SEC                                       ; $0D8A88 |
  SBC $3018                                 ; $0D8A89 |
  ASL A                                     ; $0D8A8C |
  ASL A                                     ; $0D8A8D |
  ASL A                                     ; $0D8A8E |
  ASL A                                     ; $0D8A8F |

CODE_0D8A90:
  STA $7A36,x                               ; $0D8A90 |
  STZ $7400,x                               ; $0D8A93 |
  LDA $7182,x                               ; $0D8A96 |
  CLC                                       ; $0D8A99 |
  ADC #$0030                                ; $0D8A9A |
  STA $7182,x                               ; $0D8A9D |
  CPX $0FB7                                 ; $0D8AA0 |
  BNE CODE_0D8AE0                           ; $0D8AA3 |
  LDA #$00A0                                ; $0D8AA5 |
  STA $3018                                 ; $0D8AA8 |
  LDA #$0055                                ; $0D8AAB |
  STA $301A                                 ; $0D8AAE |
  LDA #$0100                                ; $0D8AB1 |
  STA $300C                                 ; $0D8AB4 |
  LDA #$0010                                ; $0D8AB7 |
  STA $3010                                 ; $0D8ABA |
  STA $3012                                 ; $0D8ABD |
  LDY $7722,x                               ; $0D8AC0 |
  TYX                                       ; $0D8AC3 |
  LDA $03A9CE,x                             ; $0D8AC4 |
  STA $3006                                 ; $0D8AC8 |
  LDA $03A9EE,x                             ; $0D8ACB |
  STA $3004                                 ; $0D8ACF |
  LDX #$08                                  ; $0D8AD2 |
  LDA #$8293                                ; $0D8AD4 |
  JSL $7EDE44                               ; $0D8AD7 | GSU init
  LDX $12                                   ; $0D8ADB |
  INC $0CF9                                 ; $0D8ADD |

CODE_0D8AE0:
  LDA #$0008                                ; $0D8AE0 |
  STA $7720,x                               ; $0D8AE3 |
  RTL                                       ; $0D8AE6 |

DATA_0D8AE7:         dw $8CB5
DATA_0D8AE9:         dw $8CFA
DATA_0D8AEB:         dw $8D36
DATA_0D8AED:         dw $8DC4
DATA_0D8AEF:         dw $8E06

main_chained_spike_ball:
  JSR CODE_0D8B3B                           ; $0D8AF1 |
  JSR CODE_0D8B8B                           ; $0D8AF4 |
  JSL $03AF23                               ; $0D8AF7 |
  LDY $7D36,x                               ; $0D8AFB |
  BPL CODE_0D8B06                           ; $0D8AFE |
  JSL $03A858                               ; $0D8B00 |
  BRA CODE_0D8B0A                           ; $0D8B04 |

CODE_0D8B06:
  JSL $03A5B7                               ; $0D8B06 |

CODE_0D8B0A:
  JSL $03A2C7                               ; $0D8B0A |
  BCC CODE_0D8B2F                           ; $0D8B0E |
  LDA $18,x                                 ; $0D8B10 |
  TAX                                       ; $0D8B12 |
  JSL $03A31E                               ; $0D8B13 |
  LDX $12                                   ; $0D8B17 |
  DEC $0FBB                                 ; $0D8B19 |
  BNE CODE_0D8B25                           ; $0D8B1C |
  STZ $0FB7                                 ; $0D8B1E |
  JSL $03AEFD                               ; $0D8B21 |

CODE_0D8B25:
  LDA #$FFFF                                ; $0D8B25 |
  STA $7722,x                               ; $0D8B28 |
  JSL $03A31E                               ; $0D8B2B |

CODE_0D8B2F:
  JSR CODE_0D8C4B                           ; $0D8B2F |
  TXY                                       ; $0D8B32 |
  LDA $76,x                                 ; $0D8B33 |
  ASL A                                     ; $0D8B35 |
  TAX                                       ; $0D8B36 |
  JSR ($8AE7,x)                             ; $0D8B37 |
  RTL                                       ; $0D8B3A |

CODE_0D8B3B:
  LDA $61B0                                 ; $0D8B3B |
  ORA $0B55                                 ; $0D8B3E |
  ORA $0398                                 ; $0D8B41 |
  BNE CODE_0D8B8A                           ; $0D8B44 |
  LDY $18,x                                 ; $0D8B46 |
  LDA $70E2,y                               ; $0D8B48 |
  CLC                                       ; $0D8B4B |
  ADC #$0004                                ; $0D8B4C |
  STA $3002                                 ; $0D8B4F |
  LDA $7182,y                               ; $0D8B52 |
  CLC                                       ; $0D8B55 |
  ADC #$0020                                ; $0D8B56 |
  STA $3004                                 ; $0D8B59 |
  STZ $3006                                 ; $0D8B5C |
  LDA #$0010                                ; $0D8B5F |
  STA $3008                                 ; $0D8B62 |
  LDX #$0A                                  ; $0D8B65 |
  LDA #$CDFA                                ; $0D8B67 |
  JSL $7EDE91                               ; $0D8B6A | GSU init
  LDX $12                                   ; $0D8B6E |
  LDY $3018                                 ; $0D8B70 |
  CPY #$0B                                  ; $0D8B73 |
  BPL CODE_0D8B7C                           ; $0D8B75 |
  LDA #$8000                                ; $0D8B77 |
  BRA CODE_0D8B87                           ; $0D8B7A |

CODE_0D8B7C:
  LDA #$0013                                ; $0D8B7C |
  SEC                                       ; $0D8B7F |
  SBC $3018                                 ; $0D8B80 |
  ASL A                                     ; $0D8B83 |
  ASL A                                     ; $0D8B84 |
  ASL A                                     ; $0D8B85 |
  ASL A                                     ; $0D8B86 |

CODE_0D8B87:
  STA $7A36,x                               ; $0D8B87 |

CODE_0D8B8A:
  RTS                                       ; $0D8B8A |

CODE_0D8B8B:
  LDY $18,x                                 ; $0D8B8B |
  LDA $7182,y                               ; $0D8B8D |
  SEC                                       ; $0D8B90 |
  SBC $609C                                 ; $0D8B91 |
  STA $04                                   ; $0D8B94 |
  REP #$10                                  ; $0D8B96 |
  LDY $7362,x                               ; $0D8B98 |
  LDA $7A36,x                               ; $0D8B9B |
  BPL CODE_0D8BAB                           ; $0D8B9E |
  LDA #$8000                                ; $0D8BA0 |
  STA $6000,y                               ; $0D8BA3 |
  STA $6008,y                               ; $0D8BA6 |
  BRA CODE_0D8BC3                           ; $0D8BA9 |

CODE_0D8BAB:
  CLC                                       ; $0D8BAB |
  ADC $04                                   ; $0D8BAC |
  STA $6002,y                               ; $0D8BAE |
  STA $600A,y                               ; $0D8BB1 |
  LDA $6004,y                               ; $0D8BB4 |
  AND #$FE00                                ; $0D8BB7 |
  ORA #$00C0                                ; $0D8BBA |
  STA $6004,y                               ; $0D8BBD |
  STA $600C,y                               ; $0D8BC0 |

CODE_0D8BC3:
  TYA                                       ; $0D8BC3 |
  CLC                                       ; $0D8BC4 |
  ADC #$0010                                ; $0D8BC5 |
  PHA                                       ; $0D8BC8 |
  TAY                                       ; $0D8BC9 |
  JSL $03AA60                               ; $0D8BCA |
  REP #$10                                  ; $0D8BCE |
  PLA                                       ; $0D8BD0 |
  CLC                                       ; $0D8BD1 |
  ADC #$0020                                ; $0D8BD2 |
  TAY                                       ; $0D8BD5 |
  LDA $7A38,x                               ; $0D8BD6 |
  BEQ CODE_0D8BE3                           ; $0D8BD9 |
  LDA $04                                   ; $0D8BDB |
  CLC                                       ; $0D8BDD |
  ADC #$007A                                ; $0D8BDE |
  BRA CODE_0D8BEA                           ; $0D8BE1 |

CODE_0D8BE3:
  LDA $7182,x                               ; $0D8BE3 |
  SEC                                       ; $0D8BE6 |
  SBC $609C                                 ; $0D8BE7 |

CODE_0D8BEA:
  STA $00                                   ; $0D8BEA |
  CLC                                       ; $0D8BEC |
  ADC $78,x                                 ; $0D8BED |
  SEC                                       ; $0D8BEF |
  SBC #$0004                                ; $0D8BF0 |
  STA $02                                   ; $0D8BF3 |
  STZ $06                                   ; $0D8BF5 |
  STZ $08                                   ; $0D8BF7 |
  LDA $7AF6,x                               ; $0D8BF9 |
  BEQ CODE_0D8C04                           ; $0D8BFC |
  INC $06                                   ; $0D8BFE |
  LDA $10                                   ; $0D8C00 |
  STA $08                                   ; $0D8C02 |

CODE_0D8C04:
  LDA #$000B                                ; $0D8C04 |
  STA $0E                                   ; $0D8C07 |

CODE_0D8C09:
  LDA $02                                   ; $0D8C09 |
  SEC                                       ; $0D8C0B |
  SBC #$000A                                ; $0D8C0C |
  STA $02                                   ; $0D8C0F |
  CMP $00                                   ; $0D8C11 |
  BPL CODE_0D8C19                           ; $0D8C13 |
  CMP $04                                   ; $0D8C15 |
  BPL CODE_0D8C21                           ; $0D8C17 |

CODE_0D8C19:
  LDA #$8000                                ; $0D8C19 |
  STA $6000,y                               ; $0D8C1C |
  BRA CODE_0D8C3E                           ; $0D8C1F |

CODE_0D8C21:
  LDA $08                                   ; $0D8C21 |
  AND #$0003                                ; $0D8C23 |
  SEC                                       ; $0D8C26 |
  SBC $06                                   ; $0D8C27 |
  STA $0A                                   ; $0D8C29 |
  ADC $02                                   ; $0D8C2B |
  STA $6002,y                               ; $0D8C2D |
  LDA $6000,y                               ; $0D8C30 |
  CLC                                       ; $0D8C33 |
  ADC $0A                                   ; $0D8C34 |
  STA $6000,y                               ; $0D8C36 |
  LDA $08                                   ; $0D8C39 |
  ROR A                                     ; $0D8C3B |
  STA $08                                   ; $0D8C3C |

CODE_0D8C3E:
  TYA                                       ; $0D8C3E |
  CLC                                       ; $0D8C3F |
  ADC #$0008                                ; $0D8C40 |
  TAY                                       ; $0D8C43 |
  DEC $0E                                   ; $0D8C44 |
  BNE CODE_0D8C09                           ; $0D8C46 |
  SEP #$10                                  ; $0D8C48 |
  RTS                                       ; $0D8C4A |

CODE_0D8C4B:
  LDA $7182,x                               ; $0D8C4B |
  SEC                                       ; $0D8C4E |
  SBC $7902,x                               ; $0D8C4F |
  LSR A                                     ; $0D8C52 |
  STA $00                                   ; $0D8C53 |
  CLC                                       ; $0D8C55 |
  ADC $7902,x                               ; $0D8C56 |
  STA $02                                   ; $0D8C59 |
  LDA $6120                                 ; $0D8C5B |
  CLC                                       ; $0D8C5E |
  ADC #$0008                                ; $0D8C5F |
  STA $04                                   ; $0D8C62 |
  ASL A                                     ; $0D8C64 |
  STA $06                                   ; $0D8C65 |
  LDA $70E2,x                               ; $0D8C67 |
  CLC                                       ; $0D8C6A |
  ADC #$0009                                ; $0D8C6B |
  SEC                                       ; $0D8C6E |
  SBC $611C                                 ; $0D8C6F |
  STA $0C                                   ; $0D8C72 |
  CLC                                       ; $0D8C74 |
  ADC $04                                   ; $0D8C75 |
  CMP $06                                   ; $0D8C77 |
  BCS CODE_0D8CB4                           ; $0D8C79 |
  LDA $6122                                 ; $0D8C7B |
  CLC                                       ; $0D8C7E |
  ADC $00                                   ; $0D8C7F |
  STA $08                                   ; $0D8C81 |
  ASL A                                     ; $0D8C83 |
  STA $0A                                   ; $0D8C84 |
  LDA $02                                   ; $0D8C86 |
  SEC                                       ; $0D8C88 |
  SBC $611E                                 ; $0D8C89 |
  CLC                                       ; $0D8C8C |
  ADC $08                                   ; $0D8C8D |
  CMP $0A                                   ; $0D8C8F |
  BCS CODE_0D8CB4                           ; $0D8C91 |
  LDA $04                                   ; $0D8C93 |
  LDY $0D                                   ; $0D8C95 |
  BMI CODE_0D8C9D                           ; $0D8C97 |
  EOR #$FFFF                                ; $0D8C99 |
  INC A                                     ; $0D8C9C |

CODE_0D8C9D:
  CLC                                       ; $0D8C9D |
  ADC $70E2,x                               ; $0D8C9E |
  CLC                                       ; $0D8CA1 |
  ADC #$0008                                ; $0D8CA2 |
  SEC                                       ; $0D8CA5 |
  SBC $611C                                 ; $0D8CA6 |
  CLC                                       ; $0D8CA9 |
  ADC $608C                                 ; $0D8CAA |
  STA $608C                                 ; $0D8CAD |
  JSL $03A858                               ; $0D8CB0 |

CODE_0D8CB4:
  RTS                                       ; $0D8CB4 |
  TYX                                       ; $0D8CB5 |
  LDA $78,x                                 ; $0D8CB6 |
  BEQ CODE_0D8CEE                           ; $0D8CB8 |
  LDY $7900,x                               ; $0D8CBA |
  BEQ CODE_0D8CE3                           ; $0D8CBD |
  LDA $7860,x                               ; $0D8CBF |
  AND #$0001                                ; $0D8CC2 |
  BNE CODE_0D8CE3                           ; $0D8CC5 |
  LDY $18,x                                 ; $0D8CC7 |
  LDA #$000C                                ; $0D8CC9 |
  STA $7402,y                               ; $0D8CCC |
  LDA #$0005                                ; $0D8CCF |
  STA $7A98,y                               ; $0D8CD2 |
  LDA #$0001                                ; $0D8CD5 |
  STA $79D6,y                               ; $0D8CD8 |
  STZ $7900,x                               ; $0D8CDB |
  LDY #$02                                  ; $0D8CDE |
  STY $76,x                                 ; $0D8CE0 |
  RTS                                       ; $0D8CE2 |

CODE_0D8CE3:
  LDA $7974                                 ; $0D8CE3 |
  AND #$0001                                ; $0D8CE6 |
  BNE CODE_0D8CED                           ; $0D8CE9 |
  DEC $78,x                                 ; $0D8CEB |

CODE_0D8CED:
  RTS                                       ; $0D8CED |

CODE_0D8CEE:
  LDA #$FF80                                ; $0D8CEE |
  STA $7222,x                               ; $0D8CF1 |
  STZ $7900,x                               ; $0D8CF4 |
  INC $76,x                                 ; $0D8CF7 |
  RTS                                       ; $0D8CF9 |
  TYX                                       ; $0D8CFA |
  LDA $7974                                 ; $0D8CFB |
  AND #$0003                                ; $0D8CFE |
  BNE CODE_0D8D0A                           ; $0D8D01 |
  LDA #$002F                                ; $0D8D03 |\ play sound #$002F
  JSL $0085D2                               ; $0D8D06 |/

CODE_0D8D0A:
  LDY $18,x                                 ; $0D8D0A |
  LDA $7182,x                               ; $0D8D0C |
  SEC                                       ; $0D8D0F |
  SBC $7182,y                               ; $0D8D10 |
  CMP #$0028                                ; $0D8D13 |
  BPL CODE_0D8D35                           ; $0D8D16 |
  STZ $7222,x                               ; $0D8D18 |
  LDA #$000C                                ; $0D8D1B |
  STA $7402,y                               ; $0D8D1E |
  LDA #$0005                                ; $0D8D21 |
  STA $7A98,y                               ; $0D8D24 |
  LDA #$0001                                ; $0D8D27 |
  STA $79D6,y                               ; $0D8D2A |
  LDA #$0008                                ; $0D8D2D |
  STA $7542,x                               ; $0D8D30 |
  INC $76,x                                 ; $0D8D33 |

CODE_0D8D35:
  RTS                                       ; $0D8D35 |
  TYX                                       ; $0D8D36 |
  INC $7542,x                               ; $0D8D37 |
  LDA #$0040                                ; $0D8D3A |
  CMP $7542,x                               ; $0D8D3D |
  BPL CODE_0D8D45                           ; $0D8D40 |
  STA $7542,x                               ; $0D8D42 |

CODE_0D8D45:
  LDY $18,x                                 ; $0D8D45 |
  LDA #$007A                                ; $0D8D47 |
  SEC                                       ; $0D8D4A |
  SBC $7182,x                               ; $0D8D4B |
  CLC                                       ; $0D8D4E |
  ADC $7182,y                               ; $0D8D4F |
  BPL CODE_0D8D77                           ; $0D8D52 |
  CLC                                       ; $0D8D54 |
  ADC $7182,x                               ; $0D8D55 |
  STA $7182,x                               ; $0D8D58 |
  LDA #$001B                                ; $0D8D5B |\ play sound #$001B
  JSL $0085D2                               ; $0D8D5E |/
  LDA $7A38,x                               ; $0D8D62 |
  BNE CODE_0D8DB2                           ; $0D8D65 |
  INC $7A38,x                               ; $0D8D67 |
  LDA #$FF00                                ; $0D8D6A |
  STA $7222,x                               ; $0D8D6D |
  LDA #$0010                                ; $0D8D70 |
  STA $7AF6,x                               ; $0D8D73 |
  RTS                                       ; $0D8D76 |

CODE_0D8D77:
  LDA $7860,x                               ; $0D8D77 |
  AND #$0001                                ; $0D8D7A |
  BEQ CODE_0D8DC3                           ; $0D8D7D |
  INC $7900,x                               ; $0D8D7F |
  LDA #$01F1                                ; $0D8D82 |
  JSL $008B21                               ; $0D8D85 |
  LDA $7CD6,x                               ; $0D8D89 |
  STA $70A2,y                               ; $0D8D8C |
  LDA $7182,x                               ; $0D8D8F |
  CLC                                       ; $0D8D92 |
  ADC #$0010                                ; $0D8D93 |
  STA $7142,y                               ; $0D8D96 |
  LDA #$0005                                ; $0D8D99 |
  STA $73C2,y                               ; $0D8D9C |
  LDA #$0002                                ; $0D8D9F |
  STA $7782,y                               ; $0D8DA2 |
  LDA #$0020                                ; $0D8DA5 |
  STA $61C6                                 ; $0D8DA8 |
  LDA #$0047                                ; $0D8DAB |\ play sound #$0047
  JSL $0085D2                               ; $0D8DAE |/

CODE_0D8DB2:
  STZ $7A38,x                               ; $0D8DB2 |
  STZ $7222,x                               ; $0D8DB5 |
  STZ $7542,x                               ; $0D8DB8 |
  LDA #$0010                                ; $0D8DBB |
  STA $7AF6,x                               ; $0D8DBE |
  INC $76,x                                 ; $0D8DC1 |

CODE_0D8DC3:
  RTS                                       ; $0D8DC3 |
  TYX                                       ; $0D8DC4 |
  LDY $7900,x                               ; $0D8DC5 |
  BEQ CODE_0D8DD8                           ; $0D8DC8 |
  LDA $7860,x                               ; $0D8DCA |
  AND #$0001                                ; $0D8DCD |
  BNE CODE_0D8DD8                           ; $0D8DD0 |
  STZ $7900,x                               ; $0D8DD2 |
  DEC $76,x                                 ; $0D8DD5 |
  RTS                                       ; $0D8DD7 |

CODE_0D8DD8:
  LDA $78,x                                 ; $0D8DD8 |
  CLC                                       ; $0D8DDA |
  ADC #$0004                                ; $0D8DDB |
  STA $78,x                                 ; $0D8DDE |
  LDY $18,x                                 ; $0D8DE0 |
  LDA #$007A                                ; $0D8DE2 |
  SEC                                       ; $0D8DE5 |
  SBC $7182,x                               ; $0D8DE6 |
  CLC                                       ; $0D8DE9 |
  ADC $7182,y                               ; $0D8DEA |
  SEC                                       ; $0D8DED |
  SBC $78,x                                 ; $0D8DEE |
  BPL CODE_0D8E05                           ; $0D8DF0 |
  CLC                                       ; $0D8DF2 |
  ADC $78,x                                 ; $0D8DF3 |
  STA $78,x                                 ; $0D8DF5 |
  LDA #$0003                                ; $0D8DF7 |
  STA $79D6,y                               ; $0D8DFA |
  LDA #$0020                                ; $0D8DFD |
  STA $7A96,x                               ; $0D8E00 |
  INC $76,x                                 ; $0D8E03 |

CODE_0D8E05:
  RTS                                       ; $0D8E05 |
  TYX                                       ; $0D8E06 |
  LDY $7900,x                               ; $0D8E07 |
  BEQ CODE_0D8E30                           ; $0D8E0A |
  LDA $7860,x                               ; $0D8E0C |
  AND #$0001                                ; $0D8E0F |
  BNE CODE_0D8E30                           ; $0D8E12 |
  LDY $18,x                                 ; $0D8E14 |
  LDA #$000C                                ; $0D8E16 |
  STA $7402,y                               ; $0D8E19 |
  LDA #$0005                                ; $0D8E1C |
  STA $7A98,y                               ; $0D8E1F |
  LDA #$0001                                ; $0D8E22 |
  STA $79D6,y                               ; $0D8E25 |
  STZ $7900,x                               ; $0D8E28 |
  LDY #$02                                  ; $0D8E2B |
  STY $76,x                                 ; $0D8E2D |
  RTS                                       ; $0D8E2F |

CODE_0D8E30:
  LDA $7A96,x                               ; $0D8E30 |
  BNE CODE_0D8E5F                           ; $0D8E33 |
  LDY $18,x                                 ; $0D8E35 |
  LDA $79D6,y                               ; $0D8E37 |
  CMP #$0003                                ; $0D8E3A |
  BEQ CODE_0D8E47                           ; $0D8E3D |
  CMP #$0005                                ; $0D8E3F |
  BNE CODE_0D8E5F                           ; $0D8E42 |
  STZ $76,x                                 ; $0D8E44 |
  RTS                                       ; $0D8E46 |

CODE_0D8E47:
  LDA #$0005                                ; $0D8E47 |
  STA $7976,y                               ; $0D8E4A |
  LDA #$0014                                ; $0D8E4D |
  STA $7402,y                               ; $0D8E50 |
  LDA #$0010                                ; $0D8E53 |
  STA $7A98,y                               ; $0D8E56 |
  LDA #$0004                                ; $0D8E59 |
  STA $79D6,y                               ; $0D8E5C |

CODE_0D8E5F:
  RTS                                       ; $0D8E5F |

init_crate:
  JSL $03AE60                               ; $0D8E60 |
  LDA #$0100                                ; $0D8E64 |
  STA $7A36,x                               ; $0D8E67 |
  LDY $16,x                                 ; $0D8E6A |
  BNE CODE_0D8E84                           ; $0D8E6C |
  LDA $70E2,x                               ; $0D8E6E |
  STA $7900,x                               ; $0D8E71 |
  STA $04                                   ; $0D8E74 |
  LDA $7182,x                               ; $0D8E76 |
  STA $7902,x                               ; $0D8E79 |
  JSL $03D400                               ; $0D8E7C |
  BEQ CODE_0D8E84                           ; $0D8E80 |
  INC $79,x                                 ; $0D8E82 |

CODE_0D8E84:
  LDA #$FFFA                                ; $0D8E84 |
  STA $7720,x                               ; $0D8E87 |
  LDY $0136                                 ; $0D8E8A |
  CPY #$03                                  ; $0D8E8D |
  BEQ CODE_0D8E95                           ; $0D8E8F |
  CPY #$0D                                  ; $0D8E91 |
  BNE CODE_0D8EA9                           ; $0D8E93 |

CODE_0D8E95:
  LDY #$04                                  ; $0D8E95 |
  STY $19,x                                 ; $0D8E97 |
  LDA #$FFF2                                ; $0D8E99 |
  STA $7720,x                               ; $0D8E9C |
  LDA $7182,x                               ; $0D8E9F |
  CLC                                       ; $0D8EA2 |
  ADC #$0008                                ; $0D8EA3 |
  STA $7182,x                               ; $0D8EA6 |

CODE_0D8EA9:
  STZ $7400,x                               ; $0D8EA9 |
  JSR CODE_0D9111                           ; $0D8EAC |
  RTL                                       ; $0D8EAF |

crate_ptr:
DATA_0D8EB0:         dw $8000
DATA_0D8EB2:         dw $917B
DATA_0D8EB4:         dw $918F
DATA_0D8EB6:         dw $91A3
DATA_0D8EB8:         dw $91B7
DATA_0D8EBA:         dw $93BE
DATA_0D8EBC:         dw $93C9

main_crate:
  JSR CODE_0D8F27                           ; $0D8EBE |
  JSL $03AF23                               ; $0D8EC1 |
  STZ $7220,x                               ; $0D8EC5 |
  JSR CODE_0D8F38                           ; $0D8EC8 |
  TXY                                       ; $0D8ECB |
  LDA $76,x                                 ; $0D8ECC |
  ASL A                                     ; $0D8ECE |
  TAX                                       ; $0D8ECF |
  JSR ($8EB0,x)                             ; $0D8ED0 | crate_ptr
  JSR CODE_0D9111                           ; $0D8ED3 |
  RTL                                       ; $0D8ED6 |
  PHX                                       ; $0D8ED7 |
  PHB                                       ; $0D8ED8 |
  PHK                                       ; $0D8ED9 |
  PLB                                       ; $0D8EDA |
  LDA #$010E                                ; $0D8EDB |
  JSL $03A364                               ; $0D8EDE |
  BCC CODE_0D8F23                           ; $0D8EE2 |
  LDA $00                                   ; $0D8EE4 |
  STA $70E2,y                               ; $0D8EE6 |
  LDA $02                                   ; $0D8EE9 |
  STA $7182,y                               ; $0D8EEB |
  TYX                                       ; $0D8EEE |
  JSL $03AD74                               ; $0D8EEF |
  BCC CODE_0D8F1F                           ; $0D8EF3 |
  LDY #$06                                  ; $0D8EF5 |
  STY $76,x                                 ; $0D8EF7 |
  LDA #$0060                                ; $0D8EF9 |
  STA $7A96,x                               ; $0D8EFC |
  LDY #$02                                  ; $0D8EFF |
  STY $78,x                                 ; $0D8F01 |
  LDA #$0100                                ; $0D8F03 |
  STA $7A36,x                               ; $0D8F06 |
  LDA #$FFFF                                ; $0D8F09 |
  STA $74A2,x                               ; $0D8F0C |
  LDA #$2081                                ; $0D8F0F |
  STA $7040,x                               ; $0D8F12 |
  STZ $7542,x                               ; $0D8F15 |
  JSR CODE_0D9111                           ; $0D8F18 |
  PLB                                       ; $0D8F1B |
  PLX                                       ; $0D8F1C |
  SEC                                       ; $0D8F1D |
  RTL                                       ; $0D8F1E |

CODE_0D8F1F:
  JSL $03A31E                               ; $0D8F1F |

CODE_0D8F23:
  PLB                                       ; $0D8F23 |
  PLX                                       ; $0D8F24 |
  CLC                                       ; $0D8F25 |
  RTL                                       ; $0D8F26 |

; crate sub
CODE_0D8F27:
  LDY $78,x                                 ; $0D8F27 |
  BNE CODE_0D8F2F                           ; $0D8F29 |
  JSL $03AA52                               ; $0D8F2B |

CODE_0D8F2F:
  RTS                                       ; $0D8F2F |

; data
DATA_0D8F30:         dw $0040
DATA_0D8F32:         dw $FFC0

; data
DATA_0D8F34:         dw $0018
DATA_0D8F36:         dw $001C

; crate sub
CODE_0D8F38:
  LDY $78,x                                 ; $0D8F38 |
  BNE CODE_0D8F2F                           ; $0D8F3A |
  LDY $19,x                                 ; $0D8F3C |
  TYA                                       ; $0D8F3E |
  LSR A                                     ; $0D8F3F |
  TAY                                       ; $0D8F40 |
  LDA $8F34,y                               ; $0D8F41 |
  STA $3000                                 ; $0D8F44 |
  LDA $7A36,x                               ; $0D8F47 |
  STA $300C                                 ; $0D8F4A |
  LDX #$0B                                  ; $0D8F4D |
  LDA #$86B6                                ; $0D8F4F |
  JSL $7EDE44                               ; $0D8F52 | GSU init
  LDX $12                                   ; $0D8F56 |
  LDY $18,x                                 ; $0D8F58 |
  BEQ CODE_0D8FAF                           ; $0D8F5A |
  LDA $60D4                                 ; $0D8F5C |
  BNE CODE_0D8F7C                           ; $0D8F5F |
  LDY $60AB                                 ; $0D8F61 |
  BMI CODE_0D8F97                           ; $0D8F64 |
  LDA $7BB6,x                               ; $0D8F66 |
  CLC                                       ; $0D8F69 |
  ADC $6120                                 ; $0D8F6A |
  ASL A                                     ; $0D8F6D |
  STA $02                                   ; $0D8F6E |
  LSR A                                     ; $0D8F70 |
  CLC                                       ; $0D8F71 |
  ADC $7C16,x                               ; $0D8F72 |
  CMP $02                                   ; $0D8F75 |
  BCS CODE_0D8F97                           ; $0D8F77 |
  INC $61B4                                 ; $0D8F79 |

CODE_0D8F7C:
  LDA $60FC                                 ; $0D8F7C |
  AND #$0007                                ; $0D8F7F |
  BNE CODE_0D8FAE                           ; $0D8F82 |
  LDA $7182,x                               ; $0D8F84 |
  CLC                                       ; $0D8F87 |
  ADC #$0010                                ; $0D8F88 |
  SEC                                       ; $0D8F8B |
  SBC $3000                                 ; $0D8F8C |
  SEC                                       ; $0D8F8F |
  SBC #$001E                                ; $0D8F90 |
  STA $6090                                 ; $0D8F93 |
  RTS                                       ; $0D8F96 |

CODE_0D8F97:
  LDY #$00                                  ; $0D8F97 |
  STY $18,x                                 ; $0D8F99 |
  LDY #$03                                  ; $0D8F9B |
  STY $76,x                                 ; $0D8F9D |
  LDY $7D36,x                               ; $0D8F9F |
  BMI CODE_0D8FAE                           ; $0D8FA2 |
  PLA                                       ; $0D8FA4 |
  STA $00                                   ; $0D8FA5 |
  JSL $03A5B7                               ; $0D8FA7 |
  LDA $00                                   ; $0D8FAB |
  PHA                                       ; $0D8FAD |

CODE_0D8FAE:
  RTS                                       ; $0D8FAE |

CODE_0D8FAF:
  LDA $7BB6,x                               ; $0D8FAF |
  CLC                                       ; $0D8FB2 |
  ADC $6120                                 ; $0D8FB3 |
  STA $00                                   ; $0D8FB6 |
  ASL A                                     ; $0D8FB8 |
  STA $02                                   ; $0D8FB9 |
  LDA $7C16,x                               ; $0D8FBB |
  CLC                                       ; $0D8FBE |
  ADC $00                                   ; $0D8FBF |
  CMP $02                                   ; $0D8FC1 |
  BCC CODE_0D8FC8                           ; $0D8FC3 |

CODE_0D8FC5:
  JMP CODE_0D9027                           ; $0D8FC5 |

CODE_0D8FC8:
  LDA $3000                                 ; $0D8FC8 |
  CLC                                       ; $0D8FCB |
  ADC #$0020                                ; $0D8FCC |
  STA $04                                   ; $0D8FCF |
  SEC                                       ; $0D8FD1 |
  SBC #$0008                                ; $0D8FD2 |
  STA $06                                   ; $0D8FD5 |
  LDA $7182,x                               ; $0D8FD7 |
  CLC                                       ; $0D8FDA |
  ADC #$0010                                ; $0D8FDB |
  SEC                                       ; $0D8FDE |
  SBC $6090                                 ; $0D8FDF |
  BMI CODE_0D8FC5                           ; $0D8FE2 |
  CMP $04                                   ; $0D8FE4 |
  BPL CODE_0D8FC5                           ; $0D8FE6 |
  CMP $06                                   ; $0D8FE8 |
  BMI CODE_0D9024                           ; $0D8FEA |
  LDA $60FC                                 ; $0D8FEC |
  AND #$0007                                ; $0D8FEF |
  BNE CODE_0D8FC5                           ; $0D8FF2 |
  LDY $60AB                                 ; $0D8FF4 |
  BMI CODE_0D8FC5                           ; $0D8FF7 |
  LDY $60D4                                 ; $0D8FF9 |
  BNE CODE_0D9005                           ; $0D8FFC |
  INC $61B4                                 ; $0D8FFE |
  LDY #$01                                  ; $0D9001 |
  BRA CODE_0D900D                           ; $0D9003 |

CODE_0D9005:
  LDA #$0020                                ; $0D9005 |
  STA $7A38,x                               ; $0D9008 |
  LDY #$04                                  ; $0D900B |

CODE_0D900D:
  STY $76,x                                 ; $0D900D |
  STZ $60AA                                 ; $0D900F |
  LDA $7182,x                               ; $0D9012 |
  CLC                                       ; $0D9015 |
  ADC #$FFF2                                ; $0D9016 |
  SEC                                       ; $0D9019 |
  SBC $3000                                 ; $0D901A |
  STA $6090                                 ; $0D901D |
  INC $18,x                                 ; $0D9020 |
  BRA CODE_0D8FC5                           ; $0D9022 |

CODE_0D9024:
  JSR CODE_0D9037                           ; $0D9024 |

CODE_0D9027:
  LDY $7D36,x                               ; $0D9027 |
  BMI CODE_0D9036                           ; $0D902A |
  PLA                                       ; $0D902C |
  STA $00                                   ; $0D902D |
  JSL $03A5B7                               ; $0D902F |
  LDA $00                                   ; $0D9033 |
  PHA                                       ; $0D9035 |

CODE_0D9036:
  RTS                                       ; $0D9036 |

; crate sub
CODE_0D9037:
  LDA $60A8                                 ; $0D9037 |
  BEQ CODE_0D9036                           ; $0D903A |
  EOR $7C16,x                               ; $0D903C |
  BMI CODE_0D9036                           ; $0D903F |
  LDA #$0160                                ; $0D9041 |
  STA $093A                                 ; $0D9044 |
  LDA $7BB6,x                               ; $0D9047 |
  CLC                                       ; $0D904A |
  ADC $6120                                 ; $0D904B |
  DEC A                                     ; $0D904E |
  DEC A                                     ; $0D904F |
  LDY $77C2,x                               ; $0D9050 |
  BNE CODE_0D9059                           ; $0D9053 |
  EOR #$FFFF                                ; $0D9055 |
  INC A                                     ; $0D9058 |

CODE_0D9059:
  CLC                                       ; $0D9059 |
  ADC $7C16,x                               ; $0D905A |
  CLC                                       ; $0D905D |
  ADC $608C                                 ; $0D905E |
  STA $608C                                 ; $0D9061 |
  STZ $60A8                                 ; $0D9064 |
  STZ $60B4                                 ; $0D9067 |
  LDA $0036                                 ; $0D906A |
  AND #$0003                                ; $0D906D |
  BEQ CODE_0D909C                           ; $0D9070 |
  AND #$0001                                ; $0D9072 |
  DEC A                                     ; $0D9075 |
  EOR $7C16,x                               ; $0D9076 |
  BMI CODE_0D909C                           ; $0D9079 |
  LDA $60DE                                 ; $0D907B |
  ORA $6150                                 ; $0D907E |
  BNE CODE_0D909C                           ; $0D9081 |
  INC $61C2                                 ; $0D9083 |
  LDY $77C2,x                               ; $0D9086 |
  LDA $8F30,y                               ; $0D9089 |
  STA $7220,x                               ; $0D908C |
  STA $60A8                                 ; $0D908F |
  STA $60B4                                 ; $0D9092 |
  JSL $0D90A1                               ; $0D9095 |
  INC $60DC                                 ; $0D9099 |

CODE_0D909C:
  RTS                                       ; $0D909C |

; data
DATA_0D909D:         dw $FFC0
DATA_0D909F:         dw $0040

; crate sub
  LDA $7974                                 ; $0D90A1 |
  AND #$000F                                ; $0D90A4 |
  BNE CODE_0D9100                           ; $0D90A7 |
  PHB                                       ; $0D90A9 |
  PHK                                       ; $0D90AA |
  PLB                                       ; $0D90AB |
  LDA #$0059                                ; $0D90AC |\ play sound #$0059
  JSL $0085D2                               ; $0D90AF |/
  LDY $77C2,x                               ; $0D90B3 |
  LDA $909D,y                               ; $0D90B6 |
  STA $00                                   ; $0D90B9 |
  LDA #$01D8                                ; $0D90BB |
  JSL $008B21                               ; $0D90BE |
  LDA $10                                   ; $0D90C2 |
  AND #$0007                                ; $0D90C4 |
  SEC                                       ; $0D90C7 |
  SBC #$0004                                ; $0D90C8 |
  CLC                                       ; $0D90CB |
  ADC $70E2,x                               ; $0D90CC |
  STA $70A2,y                               ; $0D90CF |
  LDA $7182,x                               ; $0D90D2 |
  CLC                                       ; $0D90D5 |
  ADC #$0004                                ; $0D90D6 |
  STA $7142,y                               ; $0D90D9 |
  LDA #$0008                                ; $0D90DC |
  STA $7782,y                               ; $0D90DF |
  LDA #$0003                                ; $0D90E2 |
  STA $7E4C,y                               ; $0D90E5 |
  LDA $00                                   ; $0D90E8 |
  STA $71E0,y                               ; $0D90EA |
  LDA #$FF80                                ; $0D90ED |
  STA $71E2,y                               ; $0D90F0 |
  LDA $77C2,x                               ; $0D90F3 |
  AND #$00FF                                ; $0D90F6 |
  EOR #$0002                                ; $0D90F9 |
  STA $73C0,y                               ; $0D90FC |
  PLB                                       ; $0D90FF |

CODE_0D9100:
  RTL                                       ; $0D9100 |

; data
DATA_0D9101:         dw $0055
DATA_0D9103:         dw $0055
DATA_0D9105:         dw $0054
DATA_0D9107:         dw $0055

; data
DATA_0D9109:         dw $2080
DATA_0D910B:         dw $20A0
DATA_0D910D:         dw $E060
DATA_0D910F:         dw $20A0

; crate sub
CODE_0D9111:
  LDA $6F00,x                               ; $0D9111 |
  BEQ $64                                   ; $0D9114 |
  LDA $7A36,x                               ; $0D9116 |
  STA $3016                                 ; $0D9119 |
  LDA #$0200                                ; $0D911C |
  SEC                                       ; $0D911F |
  SBC $7A36,x                               ; $0D9120 |
  LSR A                                     ; $0D9123 |
  LSR A                                     ; $0D9124 |
  LSR A                                     ; $0D9125 |
  LSR A                                     ; $0D9126 |
  CLC                                       ; $0D9127 |
  ADC #$0100                                ; $0D9128 |
  STA $300C                                 ; $0D912B |
  SEP #$20                                  ; $0D912E |
  LDA $19,x                                 ; $0D9130 |
  CLC                                       ; $0D9132 |
  ADC $78,x                                 ; $0D9133 |
  TAY                                       ; $0D9135 |
  REP #$20                                  ; $0D9136 |
  TYA                                       ; $0D9138 |
  BIT #$0002                                ; $0D9139 |
  BEQ CODE_0D9144                           ; $0D913C |
  LDA #$0100                                ; $0D913E |
  STA $300C                                 ; $0D9141 |

CODE_0D9144:
  LDA $9101,y                               ; $0D9144 |
  STA $301A                                 ; $0D9147 |
  LDA $9109,y                               ; $0D914A |
  STA $3018                                 ; $0D914D |
  LDA #$0010                                ; $0D9150 |
  STA $3010                                 ; $0D9153 |
  ASL A                                     ; $0D9156 |
  STA $3012                                 ; $0D9157 |
  LDY $7722,x                               ; $0D915A |
  TYX                                       ; $0D915D |
  LDA $03A9CE,x                             ; $0D915E |
  STA $3006                                 ; $0D9162 |
  LDA $03A9EE,x                             ; $0D9165 |
  STA $3004                                 ; $0D9169 |
  LDX #$08                                  ; $0D916C |
  LDA #$8295                                ; $0D916E |
  JSL $7EDE44                               ; $0D9171 | GSU init
  LDX $12                                   ; $0D9175 |
  INC $0CF9                                 ; $0D9177 |
  RTS                                       ; $0D917A |

; crate_ptr sub
  TYX                                       ; $0D917B |
  LDA $7A36,x                               ; $0D917C |
  SEC                                       ; $0D917F |
  SBC #$0010                                ; $0D9180 |
  CMP #$00F0                                ; $0D9183 |
  BPL CODE_0D919F                           ; $0D9186 |
  INC $76,x                                 ; $0D9188 |
  LDA #$00F0                                ; $0D918A |
  BRA CODE_0D919F                           ; $0D918D |

; crate_ptr sub
  TYX                                       ; $0D918F |
  LDA $7A36,x                               ; $0D9190 |
  CLC                                       ; $0D9193 |
  ADC #$0008                                ; $0D9194 |
  CMP #$00E0                                ; $0D9197 |
  BMI CODE_0D919F                           ; $0D919A |
  LDA #$00E0                                ; $0D919C |

CODE_0D919F:
  STA $7A36,x                               ; $0D919F | entry point
  RTS                                       ; $0D91A2 |

; crate_ptr sub
  TYX                                       ; $0D91A3 |
  LDA $7A36,x                               ; $0D91A4 |
  CLC                                       ; $0D91A7 |
  ADC #$0004                                ; $0D91A8 |
  CMP #$0100                                ; $0D91AB |
  BMI CODE_0D919F                           ; $0D91AE |
  STZ $76,x                                 ; $0D91B0 |
  LDA #$0100                                ; $0D91B2 |
  BRA CODE_0D919F                           ; $0D91B5 |

; crate_ptr sub
  TYX                                       ; $0D91B7 |
  LDA $7A38,x                               ; $0D91B8 |
  DEC A                                     ; $0D91BB |
  BEQ CODE_0D91C1                           ; $0D91BC |
  STA $7A38,x                               ; $0D91BE |

CODE_0D91C1:
  LDA $7A36,x                               ; $0D91C1 |
  SEC                                       ; $0D91C4 |
  SBC $7A38,x                               ; $0D91C5 |
  CMP #$0080                                ; $0D91C8 |
  BMI CODE_0D91D1                           ; $0D91CB |
  STA $7A36,x                               ; $0D91CD |

CODE_0D91D0:
  RTS                                       ; $0D91D0 |

CODE_0D91D1:
  JSR CODE_0D9236                           ; $0D91D1 |
  INC $76,x                                 ; $0D91D4 |
  LDY $79,x                                 ; $0D91D6 |
  BNE CODE_0D91D0                           ; $0D91D8 |
  LDA $7360,x                               ; $0D91DA |
  CMP #$010E                                ; $0D91DD |
  BNE CODE_0D91F7                           ; $0D91E0 |
  LDY $16,x                                 ; $0D91E2 |
  BNE CODE_0D91F2                           ; $0D91E4 |
  LDA $7900,x                               ; $0D91E6 |
  STA $04                                   ; $0D91E9 |
  LDA $7902,x                               ; $0D91EB |
  JSL $03D3F3                               ; $0D91EE |

CODE_0D91F2:
  JSL $0D9329                               ; $0D91F2 |
  RTS                                       ; $0D91F6 |

CODE_0D91F7:
  JMP CODE_0D9383                           ; $0D91F7 |

; data
DATA_0D91FA:         dw $FFF2
DATA_0D91FC:         dw $FFF4
DATA_0D91FE:         dw $0000
DATA_0D9200:         dw $000A
DATA_0D9202:         dw $000D
DATA_0D9204:         dw $0000

; data
DATA_0D9206:         dw $0000
DATA_0D9208:         dw $FFF4
DATA_0D920A:         dw $FFF2
DATA_0D920C:         dw $FFF4
DATA_0D920E:         dw $0000
DATA_0D9210:         dw $0000

; data
DATA_0D9212:         dw $0000
DATA_0D9214:         dw $000E
DATA_0D9216:         dw $000C
DATA_0D9218:         dw $000E
DATA_0D921A:         dw $0012
DATA_0D921C:         dw $000C

; data
DATA_0D921E:         dw $FC00
DATA_0D9220:         dw $FE00
DATA_0D9222:         dw $0000
DATA_0D9224:         dw $0200
DATA_0D9226:         dw $0400
DATA_0D9228:         dw $0000

; data
DATA_0D922A:         dw $FF00
DATA_0D922C:         dw $FE00
DATA_0D922E:         dw $FC80
DATA_0D9230:         dw $FE00
DATA_0D9232:         dw $FF00
DATA_0D9234:         dw $0000

; crate sub
CODE_0D9236:
  PHX                                       ; $0D9236 |
  LDA $7722,x                               ; $0D9237 |
  TAX                                       ; $0D923A |
  LDA $03AA0E,x                             ; $0D923B |
  PLX                                       ; $0D923F |
  AND #$000F                                ; $0D9240 |
  STA $0E                                   ; $0D9243 |
  LDA $10                                   ; $0D9245 |
  STA $0C                                   ; $0D9247 |
  LDY #$0A                                  ; $0D9249 |

CODE_0D924B:
  LDA $91FA,y                               ; $0D924B |
  STA $00                                   ; $0D924E |
  LDA $9206,y                               ; $0D9250 |
  STA $02                                   ; $0D9253 |
  LDA $9212,y                               ; $0D9255 |
  STA $04                                   ; $0D9258 |
  LDA $921E,y                               ; $0D925A |
  STA $06                                   ; $0D925D |
  LDA $922A,y                               ; $0D925F |
  STA $08                                   ; $0D9262 |
  PHY                                       ; $0D9264 |
  LDA #$01F3                                ; $0D9265 |
  JSL $008B21                               ; $0D9268 |
  LDA $70E2,x                               ; $0D926C |
  CLC                                       ; $0D926F |
  ADC $00                                   ; $0D9270 |
  STA $70A2,y                               ; $0D9272 |
  LDA $7182,x                               ; $0D9275 |
  CLC                                       ; $0D9278 |
  ADC $02                                   ; $0D9279 |
  STA $7142,y                               ; $0D927B |
  LDA $04                                   ; $0D927E |
  STA $7E4E,y                               ; $0D9280 |
  LDA #$0050                                ; $0D9283 |
  STA $7782,y                               ; $0D9286 |
  LDA #$0003                                ; $0D9289 |
  STA $7E8E,y                               ; $0D928C |
  STA $78C0,y                               ; $0D928F |
  LDA $0E                                   ; $0D9292 |
  STA $7E8C,y                               ; $0D9294 |
  LDA $06                                   ; $0D9297 |
  STA $71E0,y                               ; $0D9299 |
  LDA $08                                   ; $0D929C |
  STA $71E2,y                               ; $0D929E |
  LDA #$0040                                ; $0D92A1 |
  STA $7500,y                               ; $0D92A4 |
  LDA $0C                                   ; $0D92A7 |
  AND #$0002                                ; $0D92A9 |
  STA $73C0,y                               ; $0D92AC |
  LDA $0C                                   ; $0D92AF |
  ROR A                                     ; $0D92B1 |
  STA $0C                                   ; $0D92B2 |
  PLY                                       ; $0D92B4 |
  DEY                                       ; $0D92B5 |
  DEY                                       ; $0D92B6 |
  BPL CODE_0D924B                           ; $0D92B7 |
  LDY #$02                                  ; $0D92B9 |
  STY $78,x                                 ; $0D92BB |
  LDA #$0100                                ; $0D92BD |
  STA $7A36,x                               ; $0D92C0 |
  LDA #$0060                                ; $0D92C3 |
  STA $7A96,x                               ; $0D92C6 |
  LDA #$FFFF                                ; $0D92C9 |
  STA $74A2,x                               ; $0D92CC |
  LDA #$2081                                ; $0D92CF |
  STA $7040,x                               ; $0D92D2 |
  RTS                                       ; $0D92D5 |

; data
DATA_0D92D6:         dw $0241
DATA_0D92D8:         dw $FDBF
DATA_0D92DA:         dw $0195
DATA_0D92DC:         dw $FE6B
DATA_0D92DE:         dw $009B
DATA_0D92E0:         dw $FF65

; data
DATA_0D92E2:         dw $FEEF
DATA_0D92E4:         dw $FEEF
DATA_0D92E6:         dw $FE11
DATA_0D92E8:         dw $FE11
DATA_0D92EA:         dw $FD94
DATA_0D92EC:         dw $FD94

; sub
  PHB                                       ; $0D92EE |
  PHK                                       ; $0D92EF |
  PLB                                       ; $0D92F0 |
  LDY #$0A                                  ; $0D92F1 |

CODE_0D92F3:
  LDA $92D6,y                               ; $0D92F3 |
  STA $00                                   ; $0D92F6 |
  LDA $92E2,y                               ; $0D92F8 |
  STA $02                                   ; $0D92FB |
  PHY                                       ; $0D92FD |
  LDA #$0115                                ; $0D92FE |
  JSL $03A34C                               ; $0D9301 |
  BCC CODE_0D9326                           ; $0D9305 |
  LDA $70E2,x                               ; $0D9307 |
  STA $70E2,y                               ; $0D930A |
  LDA $7182,x                               ; $0D930D |
  DEC A                                     ; $0D9310 |
  DEC A                                     ; $0D9311 |
  STA $7182,y                               ; $0D9312 |
  LDA $00                                   ; $0D9315 |
  STA $7220,y                               ; $0D9317 |
  LDA $02                                   ; $0D931A |
  STA $7222,y                               ; $0D931C |
  PLY                                       ; $0D931F |
  DEY                                       ; $0D9320 |
  DEY                                       ; $0D9321 |
  BPL CODE_0D92F3                           ; $0D9322 |
  PLB                                       ; $0D9324 |
  RTL                                       ; $0D9325 |

CODE_0D9326:
  PLB                                       ; $0D9326 |
  PLY                                       ; $0D9327 |
  RTL                                       ; $0D9328 |

; crate sub
  PHB                                       ; $0D9329 |
  PHK                                       ; $0D932A |
  PLB                                       ; $0D932B |
  LDA $03B6                                 ; $0D932C |
  STA $04                                   ; $0D932F |
  LDY #$0A                                  ; $0D9331 |

CODE_0D9333:
  LDA $04                                   ; $0D9333 |
  CLC                                       ; $0D9335 |
  ADC #$000A                                ; $0D9336 |
  CMP #$0136                                ; $0D9339 |
  BPL CODE_0D92F3                           ; $0D933C |
  STA $04                                   ; $0D933E |
  LDA $92D6,y                               ; $0D9340 |
  STA $00                                   ; $0D9343 |
  LDA $92E2,y                               ; $0D9345 |
  STA $02                                   ; $0D9348 |
  PHY                                       ; $0D934A |
  LDA #$01A2                                ; $0D934B |
  JSL $03A34C                               ; $0D934E |
  BCC CODE_0D9326                           ; $0D9352 |
  LDA $70E2,x                               ; $0D9354 |
  STA $70E2,y                               ; $0D9357 |
  LDA $7182,x                               ; $0D935A |
  DEC A                                     ; $0D935D |
  DEC A                                     ; $0D935E |
  STA $7182,y                               ; $0D935F |
  LDA $00                                   ; $0D9362 |
  STA $7220,y                               ; $0D9364 |
  LDA $02                                   ; $0D9367 |
  STA $7222,y                               ; $0D9369 |
  LDA #$0180                                ; $0D936C |
  STA $7A96,y                               ; $0D936F |
  LDA #$0020                                ; $0D9372 |
  STA $7AF6,y                               ; $0D9375 |
  PLY                                       ; $0D9378 |
  DEY                                       ; $0D9379 |
  DEY                                       ; $0D937A |
  BPL CODE_0D9333                           ; $0D937B |
  PLB                                       ; $0D937D |
  RTL                                       ; $0D937E |

; data
DATA_0D937F:         dw $0200
DATA_0D9381:         dw $FE00

; crate sub
CODE_0D9383:
  LDY $60C4                                 ; $0D9383 |
  LDA $937F,y                               ; $0D9386 |
  STA $00                                   ; $0D9389 |
  LDA #$0027                                ; $0D938B |
  JSL $03A34C                               ; $0D938E |
  BCC CODE_0D93BD                           ; $0D9392 |
  LDA $70E2,x                               ; $0D9394 |
  STA $70E2,y                               ; $0D9397 |
  LDA $7182,x                               ; $0D939A |
  STA $7182,y                               ; $0D939D |
  LDA $00                                   ; $0D93A0 |
  STA $7220,y                               ; $0D93A2 |
  LDA #$FB00                                ; $0D93A5 |
  STA $7222,y                               ; $0D93A8 |
  LDA #$0001                                ; $0D93AB |
  STA $7D38,y                               ; $0D93AE |
  LDA $7900,x                               ; $0D93B1 |
  STA $7900,y                               ; $0D93B4 |
  LDA $7902,x                               ; $0D93B7 |
  STA $7902,y                               ; $0D93BA |

CODE_0D93BD:
  RTS                                       ; $0D93BD |

; crate_ptr sub
  TYX                                       ; $0D93BE |
  LDA $7A96,x                               ; $0D93BF |
  BNE CODE_0D93C8                           ; $0D93C2 |

CODE_0D93C4:
  JSL $03A32E                               ; $0D93C4 |

CODE_0D93C8:
  RTS                                       ; $0D93C8 |

; crate_ptr sub
  TYX                                       ; $0D93C9 |
  LDA $7A96,x                               ; $0D93CA |
  BEQ CODE_0D93C4                           ; $0D93CD |
  CMP #$0050                                ; $0D93CF |
  BMI CODE_0D9438                           ; $0D93D2 |
  LDA #$01F3                                ; $0D93D4 |
  JSL $008B21                               ; $0D93D7 |
  LDA $10                                   ; $0D93DB |
  AND #$0078                                ; $0D93DD |
  SEC                                       ; $0D93E0 |
  SBC #$0040                                ; $0D93E1 |
  CLC                                       ; $0D93E4 |
  ADC $70E2,x                               ; $0D93E5 |
  STA $70A2,y                               ; $0D93E8 |
  LDA $7182,x                               ; $0D93EB |
  STA $7142,y                               ; $0D93EE |
  LDA #$0050                                ; $0D93F1 |
  STA $7782,y                               ; $0D93F4 |
  PHX                                       ; $0D93F7 |
  LDA $7722,x                               ; $0D93F8 |
  TAX                                       ; $0D93FB |
  LDA $03AA0E,x                             ; $0D93FC |
  PLX                                       ; $0D9400 |
  AND #$000F                                ; $0D9401 |
  STA $7E8C,y                               ; $0D9404 |
  LDA $10                                   ; $0D9407 |
  AND #$07FF                                ; $0D9409 |
  SEC                                       ; $0D940C |
  SBC #$0400                                ; $0D940D |
  STA $71E0,y                               ; $0D9410 |
  LDA $0F                                   ; $0D9413 |
  AND #$03FF                                ; $0D9415 |
  CLC                                       ; $0D9418 |
  ADC #$0600                                ; $0D9419 |
  EOR #$FFFF                                ; $0D941C |
  INC A                                     ; $0D941F |
  STA $71E2,y                               ; $0D9420 |
  LDA $10                                   ; $0D9423 |
  AND #$0007                                ; $0D9425 |
  CLC                                       ; $0D9428 |
  ADC #$0002                                ; $0D9429 |
  STA $78C0,y                               ; $0D942C |
  STA $7E8E,y                               ; $0D942F |
  LDA #$0004                                ; $0D9432 |
  STA $7500,y                               ; $0D9435 |

CODE_0D9438:
  RTS                                       ; $0D9438 |

init_spiked_log:
  LDA #$0127                                ; $0D9439 |
  JSL $03A364                               ; $0D943C |
  BCC CODE_0D944F                           ; $0D9440 |
  TYX                                       ; $0D9442 |
  JSL $03AD74                               ; $0D9443 |
  BCS CODE_0D9453                           ; $0D9447 |
  JSL $03A31E                               ; $0D9449 |
  LDX $12                                   ; $0D944D |

CODE_0D944F:
  JML $03A31E                               ; $0D944F |

CODE_0D9453:
  PHX                                       ; $0D9453 |
  JSR CODE_0D9803                           ; $0D9454 |
  PLY                                       ; $0D9457 |
  LDX $12                                   ; $0D9458 |
  LDA $70E2,x                               ; $0D945A |
  STA $70E2,y                               ; $0D945D |
  LDA $7182,x                               ; $0D9460 |
  STA $7182,y                               ; $0D9463 |
  STA $7902,x                               ; $0D9466 |
  TXA                                       ; $0D9469 |
  STA $7978,y                               ; $0D946A |
  STY $18,x                                 ; $0D946D |
  STZ $7400,x                               ; $0D946F |
  LDA #$0007                                ; $0D9472 |
  STA $7720,x                               ; $0D9475 |
  LDA $70E2,x                               ; $0D9478 |
  CLC                                       ; $0D947B |
  ADC #$000E                                ; $0D947C |
  STA $3002                                 ; $0D947F |
  SEC                                       ; $0D9482 |
  SBC #$0008                                ; $0D9483 |
  STA $70E2,x                               ; $0D9486 |
  LDA $7182,x                               ; $0D9489 |
  CLC                                       ; $0D948C |
  ADC #$0030                                ; $0D948D |
  STA $3004                                 ; $0D9490 |
  STZ $3006                                 ; $0D9493 |
  LDA #$0010                                ; $0D9496 |
  STA $3008                                 ; $0D9499 |
  LDX #$0A                                  ; $0D949C |
  LDA #$CDFA                                ; $0D949E |
  JSL $7EDE91                               ; $0D94A1 | GSU init
  LDX $12                                   ; $0D94A5 |
  LDY $3018                                 ; $0D94A7 |
  CPY #$0C                                  ; $0D94AA |
  BPL CODE_0D94B7                           ; $0D94AC |
  LDA #$8000                                ; $0D94AE |
  STA $7A36,x                               ; $0D94B1 |
  XBA                                       ; $0D94B4 |
  BRA CODE_0D94C5                           ; $0D94B5 |

CODE_0D94B7:
  LDA #$0014                                ; $0D94B7 |
  SEC                                       ; $0D94BA |
  SBC $3018                                 ; $0D94BB |
  ASL A                                     ; $0D94BE |
  ASL A                                     ; $0D94BF |
  ASL A                                     ; $0D94C0 |
  ASL A                                     ; $0D94C1 |
  STA $7A36,x                               ; $0D94C2 |

CODE_0D94C5:
  CLC                                       ; $0D94C5 |
  ADC $7182,x                               ; $0D94C6 |
  SEC                                       ; $0D94C9 |
  SBC #$0010                                ; $0D94CA |
  STA $7182,x                               ; $0D94CD |
  LDY $18,x                                 ; $0D94D0 |
  STA $7A36,y                               ; $0D94D2 |
  STA $78,x                                 ; $0D94D5 |
  STZ $7400,x                               ; $0D94D7 |
  LDA #$000F                                ; $0D94DA |
  SEC                                       ; $0D94DD |
  SBC $3018                                 ; $0D94DE |
  CMP #$0003                                ; $0D94E1 |
  BMI CODE_0D94E9                           ; $0D94E4 |
  LDA #$0003                                ; $0D94E6 |

CODE_0D94E9:
  STA $7900,x                               ; $0D94E9 |
  RTL                                       ; $0D94EC |

DATA_0D94ED:         dw $8000
DATA_0D94EF:         dw $96A5
DATA_0D94F1:         dw $96BC
DATA_0D94F3:         dw $96DF

  JSR CODE_0D9560                           ; $0D94F5 |
  JSL $03AF23                               ; $0D94F8 |
  JSR CODE_0D95EE                           ; $0D94FC |
  JSL $03A299                               ; $0D94FF |
  BCC CODE_0D9512                           ; $0D9503 |
  LDA $18,x                                 ; $0D9505 |
  TAX                                       ; $0D9507 |
  JSL $03A31E                               ; $0D9508 |
  LDX $12                                   ; $0D950C |
  JML $03A31E                               ; $0D950E |

CODE_0D9512:
  TXY                                       ; $0D9512 |
  LDA $76,x                                 ; $0D9513 |
  ASL A                                     ; $0D9515 |
  TAX                                       ; $0D9516 |
  JSR ($94ED,x)                             ; $0D9517 |
  JSL $03D127                               ; $0D951A |
  LDY $7D36,x                               ; $0D951E |
  DEY                                       ; $0D9521 |
  BNE CODE_0D955B                           ; $0D9522 |
  LDA $7CD6                                 ; $0D9524 |
  SEC                                       ; $0D9527 |
  SBC $7CD6,x                               ; $0D9528 |
  STA $00                                   ; $0D952B |
  EOR $7220                                 ; $0D952D |
  BPL CODE_0D955A                           ; $0D9530 |
  LDA $7BB6,x                               ; $0D9532 |
  CLC                                       ; $0D9535 |
  ADC $7BB6                                 ; $0D9536 |
  LDY $01                                   ; $0D9539 |
  BPL CODE_0D9541                           ; $0D953B |
  EOR #$FFFF                                ; $0D953D |
  INC A                                     ; $0D9540 |

CODE_0D9541:
  CLC                                       ; $0D9541 |
  ADC $7CD6,x                               ; $0D9542 |
  SEC                                       ; $0D9545 |
  SBC $7CD6                                 ; $0D9546 |
  CLC                                       ; $0D9549 |
  ADC $70E2                                 ; $0D954A |
  STA $70E2                                 ; $0D954D |
  LDA $7220                                 ; $0D9550 |
  EOR #$FFFF                                ; $0D9553 |
  INC A                                     ; $0D9556 |
  STA $7220                                 ; $0D9557 |

CODE_0D955A:
  RTL                                       ; $0D955A |

CODE_0D955B:
  JSL $03A5B7                               ; $0D955B |
  RTL                                       ; $0D955F |

CODE_0D9560:
  LDY $18,x                                 ; $0D9560 |
  LDA $7182,y                               ; $0D9562 |
  SEC                                       ; $0D9565 |
  SBC $609C                                 ; $0D9566 |
  STA $04                                   ; $0D9569 |
  REP #$10                                  ; $0D956B |
  LDY $7362,x                               ; $0D956D |
  LDA $7A36,x                               ; $0D9570 |
  BPL CODE_0D9580                           ; $0D9573 |
  LDA #$8000                                ; $0D9575 |
  STA $6000,y                               ; $0D9578 |
  STA $6008,y                               ; $0D957B |
  BRA CODE_0D9589                           ; $0D957E |

CODE_0D9580:
  CLC                                       ; $0D9580 |
  ADC $04                                   ; $0D9581 |
  STA $6002,y                               ; $0D9583 |
  STA $600A,y                               ; $0D9586 |

CODE_0D9589:
  TYA                                       ; $0D9589 |
  CLC                                       ; $0D958A |
  ADC #$0048                                ; $0D958B |
  TAY                                       ; $0D958E |
  LDA $7182,x                               ; $0D958F |
  SEC                                       ; $0D9592 |
  SBC #$001A                                ; $0D9593 |
  SEC                                       ; $0D9596 |
  SBC $609C                                 ; $0D9597 |
  STA $02                                   ; $0D959A |
  STZ $06                                   ; $0D959C |
  STZ $08                                   ; $0D959E |
  LDA $7AF6,x                               ; $0D95A0 |
  BEQ CODE_0D95AB                           ; $0D95A3 |
  INC $06                                   ; $0D95A5 |
  LDA $10                                   ; $0D95A7 |
  STA $08                                   ; $0D95A9 |

CODE_0D95AB:
  LDA #$0005                                ; $0D95AB |
  STA $0E                                   ; $0D95AE |

CODE_0D95B0:
  LDA $02                                   ; $0D95B0 |
  SEC                                       ; $0D95B2 |
  SBC #$0010                                ; $0D95B3 |
  STA $02                                   ; $0D95B6 |
  CMP $04                                   ; $0D95B8 |
  BPL CODE_0D95C4                           ; $0D95BA |
  LDA #$8000                                ; $0D95BC |
  STA $6000,y                               ; $0D95BF |
  BRA CODE_0D95E1                           ; $0D95C2 |

CODE_0D95C4:
  LDA $08                                   ; $0D95C4 |
  AND #$0003                                ; $0D95C6 |
  SEC                                       ; $0D95C9 |
  SBC $06                                   ; $0D95CA |
  STA $0A                                   ; $0D95CC |
  ADC $02                                   ; $0D95CE |
  STA $6002,y                               ; $0D95D0 |
  LDA $6000,y                               ; $0D95D3 |
  CLC                                       ; $0D95D6 |
  ADC $0A                                   ; $0D95D7 |
  STA $6000,y                               ; $0D95D9 |
  LDA $08                                   ; $0D95DC |
  ROR A                                     ; $0D95DE |
  STA $08                                   ; $0D95DF |

CODE_0D95E1:
  TYA                                       ; $0D95E1 |
  CLC                                       ; $0D95E2 |
  ADC #$0008                                ; $0D95E3 |
  TAY                                       ; $0D95E6 |
  DEC $0E                                   ; $0D95E7 |
  BNE CODE_0D95B0                           ; $0D95E9 |
  SEP #$10                                  ; $0D95EB |
  RTS                                       ; $0D95ED |

CODE_0D95EE:
  LDA $6120                                 ; $0D95EE |
  STA $3000                                 ; $0D95F1 |
  LDA $611C                                 ; $0D95F4 |
  STA $3002                                 ; $0D95F7 |
  LDA $6122                                 ; $0D95FA |
  STA $3004                                 ; $0D95FD |
  LDA $611E                                 ; $0D9600 |
  STA $3006                                 ; $0D9603 |
  JSR CODE_0D965E                           ; $0D9606 |
  BCS CODE_0D962C                           ; $0D9609 |
  LDA $04                                   ; $0D960B |
  LDY $0D                                   ; $0D960D |
  BMI CODE_0D9615                           ; $0D960F |
  EOR #$FFFF                                ; $0D9611 |
  INC A                                     ; $0D9614 |

CODE_0D9615:
  CLC                                       ; $0D9615 |
  ADC $70E2,x                               ; $0D9616 |
  CLC                                       ; $0D9619 |
  ADC #$0008                                ; $0D961A |
  SEC                                       ; $0D961D |
  SBC $611C                                 ; $0D961E |
  CLC                                       ; $0D9621 |
  ADC $608C                                 ; $0D9622 |
  STA $608C                                 ; $0D9625 |
  JSL $03A858                               ; $0D9628 |

CODE_0D962C:
  LDA $7BB6                                 ; $0D962C |
  STA $3000                                 ; $0D962F |
  LDA $7CD6                                 ; $0D9632 |
  STA $3002                                 ; $0D9635 |
  LDA $7BB8                                 ; $0D9638 |
  STA $3004                                 ; $0D963B |
  LDA $7CD8                                 ; $0D963E |
  STA $3006                                 ; $0D9641 |
  JSR CODE_0D965E                           ; $0D9644 |
  BCS CODE_0D965D                           ; $0D9647 |
  LDA $0C                                   ; $0D9649 |
  EOR #$FFFF                                ; $0D964B |
  INC A                                     ; $0D964E |
  STA $00                                   ; $0D964F |
  EOR $7220                                 ; $0D9651 |
  BPL CODE_0D965D                           ; $0D9654 |
  LDA #$0008                                ; $0D9656 |
  JSL $0D9535                               ; $0D9659 |

CODE_0D965D:
  RTS                                       ; $0D965D |

CODE_0D965E:
  LDA $7182,x                               ; $0D965E |
  SEC                                       ; $0D9661 |
  SBC $7902,x                               ; $0D9662 |
  LSR A                                     ; $0D9665 |
  STA $00                                   ; $0D9666 |
  CLC                                       ; $0D9668 |
  ADC $7902,x                               ; $0D9669 |
  STA $02                                   ; $0D966C |
  LDA $3000                                 ; $0D966E |
  CLC                                       ; $0D9671 |
  ADC #$0008                                ; $0D9672 |
  STA $04                                   ; $0D9675 |
  ASL A                                     ; $0D9677 |
  STA $06                                   ; $0D9678 |
  LDA $70E2,x                               ; $0D967A |
  CLC                                       ; $0D967D |
  ADC #$0009                                ; $0D967E |
  SEC                                       ; $0D9681 |
  SBC $3002                                 ; $0D9682 |
  STA $0C                                   ; $0D9685 |
  CLC                                       ; $0D9687 |
  ADC $04                                   ; $0D9688 |
  CMP $06                                   ; $0D968A |
  BCS CODE_0D96A4                           ; $0D968C |
  LDA $3004                                 ; $0D968E |
  CLC                                       ; $0D9691 |
  ADC $00                                   ; $0D9692 |
  STA $08                                   ; $0D9694 |
  ASL A                                     ; $0D9696 |
  STA $0A                                   ; $0D9697 |
  LDA $02                                   ; $0D9699 |
  SEC                                       ; $0D969B |
  SBC $3006                                 ; $0D969C |
  CLC                                       ; $0D969F |
  ADC $08                                   ; $0D96A0 |
  CMP $0A                                   ; $0D96A2 |

CODE_0D96A4:
  RTS                                       ; $0D96A4 |
  TYX                                       ; $0D96A5 |
  LDA $78,x                                 ; $0D96A6 |
  CMP $7182,x                               ; $0D96A8 |
  BMI CODE_0D96BB                           ; $0D96AB |
  STA $7182,x                               ; $0D96AD |
  STZ $7222,x                               ; $0D96B0 |
  LDA #$0080                                ; $0D96B3 |
  STA $7A96,x                               ; $0D96B6 |
  INC $76,x                                 ; $0D96B9 |

CODE_0D96BB:
  RTS                                       ; $0D96BB |
  TYX                                       ; $0D96BC |
  LDA $7A96,x                               ; $0D96BD |
  BNE CODE_0D96DE                           ; $0D96C0 |
  LDA #$0010                                ; $0D96C2 |
  STA $7222,x                               ; $0D96C5 |
  LDA #$0016                                ; $0D96C8 |
  CLC                                       ; $0D96CB |
  ADC $78,x                                 ; $0D96CC |
  STA $78,x                                 ; $0D96CE |
  INC $7900,x                               ; $0D96D0 |
  LDA #$0080                                ; $0D96D3 |
  STA $7A96,x                               ; $0D96D6 |
  STZ $7A38,x                               ; $0D96D9 |
  INC $76,x                                 ; $0D96DC |

CODE_0D96DE:
  RTS                                       ; $0D96DE |
  TYX                                       ; $0D96DF |
  LDA $7A96,x                               ; $0D96E0 |
  BNE CODE_0D96DE                           ; $0D96E3 |
  LDA $7A38,x                               ; $0D96E5 |
  CLC                                       ; $0D96E8 |
  ADC #$0020                                ; $0D96E9 |
  CMP #$4000                                ; $0D96EC |
  BMI CODE_0D96F4                           ; $0D96EF |
  LDA #$4000                                ; $0D96F1 |

CODE_0D96F4:
  STA $7A38,x                               ; $0D96F4 |
  AND #$FF00                                ; $0D96F7 |
  XBA                                       ; $0D96FA |
  STA $7542,x                               ; $0D96FB |
  LDA $7860,x                               ; $0D96FE |
  AND #$0001                                ; $0D9701 |
  BEQ CODE_0D9744                           ; $0D9704 |
  LDA #$01F1                                ; $0D9706 |
  JSL $008B21                               ; $0D9709 |
  LDA $78,x                                 ; $0D970D |
  STA $7182,x                               ; $0D970F |
  CLC                                       ; $0D9712 |
  ADC #$0010                                ; $0D9713 |
  STA $7142,y                               ; $0D9716 |
  LDA $70E2,x                               ; $0D9719 |
  CLC                                       ; $0D971C |
  ADC #$0008                                ; $0D971D |
  STA $70A2,y                               ; $0D9720 |
  LDA #$0002                                ; $0D9723 |
  STA $7782,y                               ; $0D9726 |
  LDA #$0005                                ; $0D9729 |
  STA $73C2,y                               ; $0D972C |
  LDA #$0020                                ; $0D972F |
  STA $61C6                                 ; $0D9732 |
  LDA #$0047                                ; $0D9735 |\ play sound #$0047
  JSL $0085D2                               ; $0D9738 |/
  LDA #$0010                                ; $0D973C |
  STA $7AF6,x                               ; $0D973F |
  BRA CODE_0D975B                           ; $0D9742 |

CODE_0D9744:
  LDA $78,x                                 ; $0D9744 |
  CMP $7182,x                               ; $0D9746 |
  BPL CODE_0D976F                           ; $0D9749 |
  LDY $7900,x                               ; $0D974B |
  CPY #$03                                  ; $0D974E |
  BMI CODE_0D9764                           ; $0D9750 |
  STA $7182,x                               ; $0D9752 |
  LDA #$0010                                ; $0D9755 |
  STA $7AF6,x                               ; $0D9758 |

CODE_0D975B:
  STZ $7222,x                               ; $0D975B |
  STZ $7542,x                               ; $0D975E |
  STZ $76,x                                 ; $0D9761 |
  RTS                                       ; $0D9763 |

CODE_0D9764:
  INC $7900,x                               ; $0D9764 |
  LDA $78,x                                 ; $0D9767 |
  CLC                                       ; $0D9769 |
  ADC #$0016                                ; $0D976A |
  STA $78,x                                 ; $0D976D |

CODE_0D976F:
  RTS                                       ; $0D976F |

init_pulley:
  RTL                                       ; $0D9770 |

main_pulley:
  JSL $03AA52                               ; $0D9771 |
  JSL $03AF23                               ; $0D9775 |
  LDY $7D36,x                               ; $0D9779 |
  BEQ CODE_0D97C3                           ; $0D977C |
  DEY                                       ; $0D977E |
  BPL CODE_0D9787                           ; $0D977F |
  JSL $03A858                               ; $0D9781 |
  BRA CODE_0D97C3                           ; $0D9785 |

CODE_0D9787:
  LDA $6F00,y                               ; $0D9787 |
  CMP #$0010                                ; $0D978A |
  BNE CODE_0D97C3                           ; $0D978D |
  LDA $7D38,y                               ; $0D978F |
  BEQ CODE_0D97C3                           ; $0D9792 |
  TYX                                       ; $0D9794 |
  JSL $03B25B                               ; $0D9795 |
  LDY $18,x                                 ; $0D9799 |
  LDA $7222,y                               ; $0D979B |
  BMI CODE_0D97C3                           ; $0D979E |
  LDA $7900,y                               ; $0D97A0 |
  DEC A                                     ; $0D97A3 |
  BMI CODE_0D97C3                           ; $0D97A4 |
  STA $7900,y                               ; $0D97A6 |
  LDA $79D8,y                               ; $0D97A9 |
  SEC                                       ; $0D97AC |
  SBC #$0016                                ; $0D97AD |
  STA $79D8,y                               ; $0D97B0 |
  LDA #$FFC0                                ; $0D97B3 |
  STA $7222,y                               ; $0D97B6 |
  LDA #$0000                                ; $0D97B9 |
  STA $7542,y                               ; $0D97BC |
  INC A                                     ; $0D97BF |
  STA $79D6,y                               ; $0D97C0 |

CODE_0D97C3:
  LDY $18,x                                 ; $0D97C3 |
  LDA $7222,y                               ; $0D97C5 |
  BEQ CODE_0D97DB                           ; $0D97C8 |
  LDA $7182,y                               ; $0D97CA |
  AND #$0002                                ; $0D97CD |
  BNE CODE_0D97DB                           ; $0D97D0 |
  PHY                                       ; $0D97D2 |
  LDA #$005A                                ; $0D97D3 |\ play sound #$005A
  JSL $0085D2                               ; $0D97D6 |/
  PLY                                       ; $0D97DA |

CODE_0D97DB:
  LDA $7A36,x                               ; $0D97DB |
  SEC                                       ; $0D97DE |
  SBC $7182,y                               ; $0D97DF |
  STA $3000                                 ; $0D97E2 |
  LDA #$0C00                                ; $0D97E5 |
  STA $300C                                 ; $0D97E8 |
  LDX #$0B                                  ; $0D97EB |
  LDA #$86B6                                ; $0D97ED |
  JSL $7EDE44                               ; $0D97F0 | GSU init
  LDX $12                                   ; $0D97F4 |
  LDA $3000                                 ; $0D97F6 |
  AND #$01FE                                ; $0D97F9 |
  STA $7A38,x                               ; $0D97FC |
  JSR CODE_0D9803                           ; $0D97FF |
  RTL                                       ; $0D9802 |

CODE_0D9803:
  LDA #$20E0                                ; $0D9803 |
  STA $3018                                 ; $0D9806 |
  LDA #$0055                                ; $0D9809 |
  STA $301A                                 ; $0D980C |
  LDA $7A38,x                               ; $0D980F |
  LSR A                                     ; $0D9812 |
  STA $300A                                 ; $0D9813 |
  LDA #$0100                                ; $0D9816 |
  STA $300C                                 ; $0D9819 |
  LDY $7722,x                               ; $0D981C |
  TYX                                       ; $0D981F |
  LDA $03A9CE,x                             ; $0D9820 |
  STA $3006                                 ; $0D9824 |
  LDA $03A9EE,x                             ; $0D9827 |
  STA $3004                                 ; $0D982B |
  LDX #$08                                  ; $0D982E |
  LDA #$8205                                ; $0D9830 |
  JSL $7EDE44                               ; $0D9833 | GSU init
  LDX $12                                   ; $0D9837 |
  INC $0CF9                                 ; $0D9839 |
  RTS                                       ; $0D983C |

init_small_raven:
  JSL $03AE60                               ; $0D983D |
  LDY #$00                                  ; $0D9841 |
  LDA $70E2,x                               ; $0D9843 |
  SEC                                       ; $0D9846 |
  SBC #$0008                                ; $0D9847 |
  STA $7900,x                               ; $0D984A |
  AND #$0010                                ; $0D984D |
  BNE CODE_0D9854                           ; $0D9850 |
  INY                                       ; $0D9852 |
  INY                                       ; $0D9853 |

CODE_0D9854:
  TYA                                       ; $0D9854 |
  STA $7400,x                               ; $0D9855 |
  STY $78,x                                 ; $0D9858 |
  LDA $7182,x                               ; $0D985A |
  SEC                                       ; $0D985D |
  SBC #$0008                                ; $0D985E |
  STA $7902,x                               ; $0D9861 |
  LDA $7360,x                               ; $0D9864 |
  CMP #$0135                                ; $0D9867 |
  BEQ CODE_0D9871                           ; $0D986A |
  LDA #$0080                                ; $0D986C |
  STA $18,x                                 ; $0D986F |

CODE_0D9871:
  JSR CODE_0D98FB                           ; $0D9871 |
  RTL                                       ; $0D9874 |

DATA_0D9875:         dw $99AF
DATA_0D9877:         dw $99EF

main_small_raven:
  JSL $03AA52                               ; $0D9879 |
  JSL $03AF23                               ; $0D987D |
  JSR CODE_0D98CA                           ; $0D9881 |
  JSR CODE_0D98FB                           ; $0D9884 |
  JSR CODE_0D994E                           ; $0D9887 |
  JSR CODE_0D9998                           ; $0D988A |
  TXY                                       ; $0D988D |
  LDA $76,x                                 ; $0D988E |
  ASL A                                     ; $0D9890 |
  TAX                                       ; $0D9891 |
  JSR ($9875,x)                             ; $0D9892 |
  LDY $7D36,x                               ; $0D9895 |
  BEQ CODE_0D98C5                           ; $0D9898 |
  BPL CODE_0D98C1                           ; $0D989A |
  LDA $7C18,x                               ; $0D989C |
  SEC                                       ; $0D989F |
  SBC $6122                                 ; $0D98A0 |
  SEC                                       ; $0D98A3 |
  SBC $7BB8,x                               ; $0D98A4 |
  CMP #$FFF6                                ; $0D98A7 |
  BCC CODE_0D98B6                           ; $0D98AA |
  LDY $7223,x                               ; $0D98AC |
  BMI CODE_0D98B6                           ; $0D98AF |
  LDY $60C0                                 ; $0D98B1 |
  BNE CODE_0D98BC                           ; $0D98B4 |

CODE_0D98B6:
  JSL $03A858                               ; $0D98B6 |
  BRA CODE_0D98C5                           ; $0D98BA |

CODE_0D98BC:
  JSL $03A5B7                               ; $0D98BC |
  RTL                                       ; $0D98C0 |

CODE_0D98C1:
  JSL $0DC14C                               ; $0D98C1 |

CODE_0D98C5:
  RTL                                       ; $0D98C5 |

DATA_0D98C6:         dw $0100, $0400

CODE_0D98CA:
  LDY $76,x                                 ; $0D98CA |
  BNE CODE_0D98F6                           ; $0D98CC |
  LDA $7360,x                               ; $0D98CE |
  SEC                                       ; $0D98D1 |
  SBC #$0135                                ; $0D98D2 |
  ASL A                                     ; $0D98D5 |
  TAY                                       ; $0D98D6 |
  LDA $7A36,x                               ; $0D98D7 |
  CLC                                       ; $0D98DA |
  ADC $98C6,y                               ; $0D98DB |
  PHA                                       ; $0D98DE |
  AND #$01FF                                ; $0D98DF |
  STA $7A36,x                               ; $0D98E2 |
  PLA                                       ; $0D98E5 |
  AND #$FE00                                ; $0D98E6 |
  BPL CODE_0D98EE                           ; $0D98E9 |
  ORA #$00FF                                ; $0D98EB |

CODE_0D98EE:
  XBA                                       ; $0D98EE |
  CLC                                       ; $0D98EF |
  ADC $7A38,x                               ; $0D98F0 |
  STA $7A38,x                               ; $0D98F3 |

CODE_0D98F6:
  RTS                                       ; $0D98F6 |

DATA_0D98F7:         dw $4080, $40A0

CODE_0D98FB:
  LDY $77,x                                 ; $0D98FB |
  LDA $98F7,y                               ; $0D98FD |
  STA $3018                                 ; $0D9900 |
  LDA #$0055                                ; $0D9903 |
  STA $301A                                 ; $0D9906 |
  LDY $78,x                                 ; $0D9909 |
  STY $00                                   ; $0D990B |
  LDA $7A38,x                               ; $0D990D |
  LDY $7400,x                               ; $0D9910 |
  CPY $00                                   ; $0D9913 |
  BEQ CODE_0D9920                           ; $0D9915 |
  BIT #$0080                                ; $0D9917 |
  BEQ CODE_0D9920                           ; $0D991A |
  CLC                                       ; $0D991C |
  ADC #$0100                                ; $0D991D |

CODE_0D9920:
  AND #$01FE                                ; $0D9920 |
  LSR A                                     ; $0D9923 |
  STA $300A                                 ; $0D9924 |
  LDA #$0100                                ; $0D9927 |
  STA $300C                                 ; $0D992A |
  LDY $7722,x                               ; $0D992D |
  TYX                                       ; $0D9930 |
  LDA $03A9CE,x                             ; $0D9931 |
  STA $3006                                 ; $0D9935 |
  LDA $03A9EE,x                             ; $0D9938 |
  STA $3004                                 ; $0D993C |
  LDX #$08                                  ; $0D993F |
  LDA #$8205                                ; $0D9941 |
  JSL $7EDE44                               ; $0D9944 | GSU init
  LDX $12                                   ; $0D9948 |
  INC $0CF9                                 ; $0D994A |
  RTS                                       ; $0D994D |

CODE_0D994E:
  LDY $7400,x                               ; $0D994E |
  STY $00                                   ; $0D9951 |
  PHP                                       ; $0D9953 |
  LDA $7A38,x                               ; $0D9954 |
  LDY $78,x                                 ; $0D9957 |
  CPY $00                                   ; $0D9959 |
  BEQ CODE_0D9965                           ; $0D995B |
  BIT #$0080                                ; $0D995D |
  BEQ CODE_0D9965                           ; $0D9960 |
  PLP                                       ; $0D9962 |
  BRA CODE_0D9968                           ; $0D9963 |

CODE_0D9965:
  PLP                                       ; $0D9965 |
  BEQ CODE_0D996C                           ; $0D9966 |

CODE_0D9968:
  EOR #$FFFF                                ; $0D9968 |
  INC A                                     ; $0D996B |

CODE_0D996C:
  AND #$01FE                                ; $0D996C |
  STA $3002                                 ; $0D996F |
  LDA #$0018                                ; $0D9972 |
  STA $300C                                 ; $0D9975 |
  LDX #$0B                                  ; $0D9978 |
  LDA #$8595                                ; $0D997A |
  JSL $7EDE44                               ; $0D997D | GSU init
  LDX $12                                   ; $0D9981 |
  LDA $7900,x                               ; $0D9983 |
  CLC                                       ; $0D9986 |
  ADC $3002                                 ; $0D9987 |
  STA $70E2,x                               ; $0D998A |
  LDA $7902,x                               ; $0D998D |
  SEC                                       ; $0D9990 |
  SBC $3000                                 ; $0D9991 |
  STA $7182,x                               ; $0D9994 |
  RTS                                       ; $0D9997 |

CODE_0D9998:
  LDY $76,x                                 ; $0D9998 |
  BNE CODE_0D99AE                           ; $0D999A |
  LDA $7A98,x                               ; $0D999C |
  BNE CODE_0D99AE                           ; $0D999F |
  LDA #$0004                                ; $0D99A1 |
  STA $7A98,x                               ; $0D99A4 |
  LDA $77,x                                 ; $0D99A7 |
  EOR #$0002                                ; $0D99A9 |
  STA $77,x                                 ; $0D99AC |

CODE_0D99AE:
  RTS                                       ; $0D99AE |
  TYX                                       ; $0D99AF |
  LDA $7360,x                               ; $0D99B0 |
  CMP #$0135                                ; $0D99B3 |
  BEQ CODE_0D99EE                           ; $0D99B6 |
  LDA $7A38,x                               ; $0D99B8 |
  SEC                                       ; $0D99BB |
  SBC $18,x                                 ; $0D99BC |
  BMI CODE_0D99EE                           ; $0D99BE |
  INC $76,x                                 ; $0D99C0 |
  LDA $18,x                                 ; $0D99C2 |
  STA $7A38,x                               ; $0D99C4 |
  AND #$01FF                                ; $0D99C7 |
  BEQ CODE_0D99DD                           ; $0D99CA |
  LDA $10                                   ; $0D99CC |
  AND #$001F                                ; $0D99CE |
  CLC                                       ; $0D99D1 |
  ADC #$0004                                ; $0D99D2 |
  STA $7A96,x                               ; $0D99D5 |
  LDY #$01                                  ; $0D99D8 |
  STY $16,x                                 ; $0D99DA |
  RTS                                       ; $0D99DC |

CODE_0D99DD:
  LDA #$0010                                ; $0D99DD |
  STA $7A96,x                               ; $0D99E0 |
  LDA $10                                   ; $0D99E3 |
  AND #$0003                                ; $0D99E5 |
  CLC                                       ; $0D99E8 |
  ADC #$0003                                ; $0D99E9 |
  STA $16,x                                 ; $0D99EC |

CODE_0D99EE:
  RTS                                       ; $0D99EE |
  TYX                                       ; $0D99EF |
  LDA $7A96,x                               ; $0D99F0 |
  BNE CODE_0D9A19                           ; $0D99F3 |
  DEC $16,x                                 ; $0D99F5 |
  BNE CODE_0D9A0A                           ; $0D99F7 |
  LDY $7400,x                               ; $0D99F9 |
  STY $78,x                                 ; $0D99FC |
  LDA $7A38,x                               ; $0D99FE |
  CLC                                       ; $0D9A01 |
  ADC #$0080                                ; $0D9A02 |
  STA $18,x                                 ; $0D9A05 |
  DEC $76,x                                 ; $0D9A07 |
  RTS                                       ; $0D9A09 |

CODE_0D9A0A:
  LDA #$0008                                ; $0D9A0A |
  STA $7A96,x                               ; $0D9A0D |
  LDA $7400,x                               ; $0D9A10 |
  EOR #$0002                                ; $0D9A13 |
  STA $7400,x                               ; $0D9A16 |

CODE_0D9A19:
  RTS                                       ; $0D9A19 |

init_flipper_downwards:
  JSL $03AE60                               ; $0D9A1A |
  STZ $7400,x                               ; $0D9A1E |
  JSR CODE_0D9C93                           ; $0D9A21 |
  RTL                                       ; $0D9A24 |

main_flipper_downwards:
  JSR CODE_0D9A40                           ; $0D9A25 |
  JSL $03AF23                               ; $0D9A28 |
  JSR CODE_0D9B13                           ; $0D9A2C |
  JSR CODE_0D9C93                           ; $0D9A2F |
  LDA #$04B4                                ; $0D9A32 |
  LDY $18,x                                 ; $0D9A35 |
  BEQ CODE_0D9A3C                           ; $0D9A37 |
  LDA #$0474                                ; $0D9A39 |

CODE_0D9A3C:
  STA $6FA0,x                               ; $0D9A3C |
  RTL                                       ; $0D9A3F |

CODE_0D9A40:
  JSL $03AA52                               ; $0D9A40 |
  LDA $7A38,x                               ; $0D9A44 |
  AND #$01FE                                ; $0D9A47 |
  STA $3002                                 ; $0D9A4A |
  LDA #$0008                                ; $0D9A4D |
  STA $300C                                 ; $0D9A50 |
  LDX #$0B                                  ; $0D9A53 |
  LDA #$8595                                ; $0D9A55 |
  JSL $7EDE44                               ; $0D9A58 | GSU init
  LDX $12                                   ; $0D9A5C |
  LDA $7CD6,x                               ; $0D9A5E |
  SEC                                       ; $0D9A61 |
  SBC #$0018                                ; $0D9A62 |
  CLC                                       ; $0D9A65 |
  ADC $3000                                 ; $0D9A66 |
  SEC                                       ; $0D9A69 |
  SBC $6094                                 ; $0D9A6A |
  STA $00                                   ; $0D9A6D |
  LDA $7CD6,x                               ; $0D9A6F |
  CLC                                       ; $0D9A72 |
  ADC #$0018                                ; $0D9A73 |
  SEC                                       ; $0D9A76 |
  SBC $3000                                 ; $0D9A77 |
  SEC                                       ; $0D9A7A |
  SBC $6094                                 ; $0D9A7B |
  STA $02                                   ; $0D9A7E |
  LDA $7CD8,x                               ; $0D9A80 |
  CLC                                       ; $0D9A83 |
  ADC $3002                                 ; $0D9A84 |
  SEC                                       ; $0D9A87 |
  SBC $609C                                 ; $0D9A88 |
  STA $04                                   ; $0D9A8B |
  REP #$10                                  ; $0D9A8D |
  LDY $7362,x                               ; $0D9A8F |
  LDA $00                                   ; $0D9A92 |
  STA $6008,y                               ; $0D9A94 |
  STA $6018,y                               ; $0D9A97 |
  SEC                                       ; $0D9A9A |
  SBC #$0010                                ; $0D9A9B |
  STA $6000,y                               ; $0D9A9E |
  STA $6010,y                               ; $0D9AA1 |
  LDA $02                                   ; $0D9AA4 |
  STA $6020,y                               ; $0D9AA6 |
  STA $6030,y                               ; $0D9AA9 |
  SEC                                       ; $0D9AAC |
  SBC #$0010                                ; $0D9AAD |
  STA $6028,y                               ; $0D9AB0 |
  STA $6038,y                               ; $0D9AB3 |
  LDA $04                                   ; $0D9AB6 |
  STA $6012,y                               ; $0D9AB8 |
  STA $601A,y                               ; $0D9ABB |
  STA $6032,y                               ; $0D9ABE |
  STA $603A,y                               ; $0D9AC1 |
  SEC                                       ; $0D9AC4 |
  SBC #$0010                                ; $0D9AC5 |
  STA $6002,y                               ; $0D9AC8 |
  STA $600A,y                               ; $0D9ACB |
  STA $6022,y                               ; $0D9ACE |
  STA $602A,y                               ; $0D9AD1 |
  LDA $6004,y                               ; $0D9AD4 |
  EOR #$4000                                ; $0D9AD7 |
  STA $6024,y                               ; $0D9ADA |
  LDA $600C,y                               ; $0D9ADD |
  EOR #$4000                                ; $0D9AE0 |
  STA $602C,y                               ; $0D9AE3 |
  LDA $6014,y                               ; $0D9AE6 |
  EOR #$4000                                ; $0D9AE9 |
  STA $6034,y                               ; $0D9AEC |
  LDA $601C,y                               ; $0D9AEF |
  EOR #$4000                                ; $0D9AF2 |
  STA $603C,y                               ; $0D9AF5 |
  LDA $6006,y                               ; $0D9AF8 |
  STA $6026,y                               ; $0D9AFB |
  LDA $600E,y                               ; $0D9AFE |
  STA $602E,y                               ; $0D9B01 |
  LDA $6016,y                               ; $0D9B04 |
  STA $6036,y                               ; $0D9B07 |
  LDA $601E,y                               ; $0D9B0A |
  STA $603E,y                               ; $0D9B0D |
  SEP #$10                                  ; $0D9B10 |
  RTS                                       ; $0D9B12 |

CODE_0D9B13:
  STZ $02                                   ; $0D9B13 |
  LDY $7D36,x                               ; $0D9B15 |
  BPL CODE_0D9B86                           ; $0D9B18 |
  LDA $7C18,x                               ; $0D9B1A |
  EOR #$FFFF                                ; $0D9B1D |
  INC A                                     ; $0D9B20 |
  SEC                                       ; $0D9B21 |
  SBC $6122                                 ; $0D9B22 |
  SEC                                       ; $0D9B25 |
  SBC $7BB8,x                               ; $0D9B26 |
  STA $00                                   ; $0D9B29 |
  DEC A                                     ; $0D9B2B |
  CMP #$FFF7                                ; $0D9B2C |
  BCC CODE_0D9B6F                           ; $0D9B2F |
  LDA $7A38,x                               ; $0D9B31 |
  CMP #$FFE0                                ; $0D9B34 |
  BMI CODE_0D9B86                           ; $0D9B37 |
  LDY $60AB                                 ; $0D9B39 |
  BPL CODE_0D9B86                           ; $0D9B3C |
  LDA $00                                   ; $0D9B3E |
  SEC                                       ; $0D9B40 |
  ADC $7CD8,x                               ; $0D9B41 |
  INC A                                     ; $0D9B44 |
  STA $6090                                 ; $0D9B45 |
  LDA #$001C                                ; $0D9B48 |\ play sound #$001C
  JSL $0085D2                               ; $0D9B4B |/
  LDA $60AA                                 ; $0D9B4F |
  CMP #$FF40                                ; $0D9B52 |
  BPL CODE_0D9B67                           ; $0D9B55 |
  LDY $7900,x                               ; $0D9B57 |
  BNE CODE_0D9B67                           ; $0D9B5A |
  LDA #$0004                                ; $0D9B5C |
  STA $7900,x                               ; $0D9B5F |
  STA $7AF6,x                               ; $0D9B62 |
  STZ $78,x                                 ; $0D9B65 |

CODE_0D9B67:
  STZ $60D2                                 ; $0D9B67 |
  STZ $60AA                                 ; $0D9B6A |
  BRA CODE_0D9B86                           ; $0D9B6D |

CODE_0D9B6F:
  LDY $18,x                                 ; $0D9B6F |
  BNE CODE_0D9B80                           ; $0D9B71 |
  LDY #$02                                  ; $0D9B73 |
  STY $18,x                                 ; $0D9B75 |
  STZ $78,x                                 ; $0D9B77 |
  LDA #$000E                                ; $0D9B79 |\ play sound #$000E
  JSL $0085D2                               ; $0D9B7C |/

CODE_0D9B80:
  LDA #$0010                                ; $0D9B80 |
  STA $7AF6,x                               ; $0D9B83 |

CODE_0D9B86:
  TXA                                       ; $0D9B86 |
  STA $3002                                 ; $0D9B87 |
  LDX #$09                                  ; $0D9B8A |
  LDA #$9011                                ; $0D9B8C |
  JSL $7EDE44                               ; $0D9B8F | GSU init

CODE_0D9B93:
  LDX $12                                   ; $0D9B93 |
  LDY $301C                                 ; $0D9B95 |
  BMI CODE_0D9BA4                           ; $0D9B98 |
  BNE CODE_0D9BA7                           ; $0D9B9A |
  LDA $61B2                                 ; $0D9B9C |
  ORA $61CC                                 ; $0D9B9F |
  BEQ CODE_0D9BA7                           ; $0D9BA2 |

CODE_0D9BA4:
  JMP CODE_0D9C85                           ; $0D9BA4 |

CODE_0D9BA7:
  LDA $7360,y                               ; $0D9BA7 |
  CMP #$0091                                ; $0D9BAA |
  BEQ CODE_0D9BA4                           ; $0D9BAD |
  INC $02                                   ; $0D9BAF |
  BRA CODE_0D9BBE                           ; $0D9BB1 |

CODE_0D9BB3:
  LDX #$09                                  ; $0D9BB3 |
  LDA $301E                                 ; $0D9BB5 |
  JSL $7EDE44                               ; $0D9BB8 | GSU init
  BRA CODE_0D9B93                           ; $0D9BBC |

CODE_0D9BBE:
  LDA $7360,y                               ; $0D9BBE |
  CMP #$0006                                ; $0D9BC1 |
  BEQ CODE_0D9BF6                           ; $0D9BC4 |
  CMP #$0018                                ; $0D9BC6 |
  BEQ CODE_0D9BF6                           ; $0D9BC9 |
  CMP #$0022                                ; $0D9BCB |
  BCC CODE_0D9BDA                           ; $0D9BCE |
  CMP #$002C                                ; $0D9BD0 |
  BCS CODE_0D9BDA                           ; $0D9BD3 |
  LDA $79D8,y                               ; $0D9BD5 |
  BNE CODE_0D9BF6                           ; $0D9BD8 |

CODE_0D9BDA:
  LDA $7CD8,y                               ; $0D9BDA |
  SEC                                       ; $0D9BDD |
  SBC $7CD8,x                               ; $0D9BDE |
  STA $00                                   ; $0D9BE1 |
  BPL CODE_0D9BEE                           ; $0D9BE3 |
  LDA $7222,y                               ; $0D9BE5 |
  DEC A                                     ; $0D9BE8 |
  BMI CODE_0D9BEE                           ; $0D9BE9 |
  JMP CODE_0D9C5F                           ; $0D9BEB |

CODE_0D9BEE:
  LDA $7A38,x                               ; $0D9BEE |
  CMP #$FFE0                                ; $0D9BF1 |
  BPL CODE_0D9BF9                           ; $0D9BF4 |

CODE_0D9BF6:
  JMP CODE_0D9C7B                           ; $0D9BF6 |

CODE_0D9BF9:
  LDA $00                                   ; $0D9BF9 |
  SEC                                       ; $0D9BFB |
  SBC $7BB8,y                               ; $0D9BFC |
  SEC                                       ; $0D9BFF |
  SBC $7BB8,x                               ; $0D9C00 |
  EOR #$FFFF                                ; $0D9C03 |
  SEC                                       ; $0D9C06 |
  ADC $7182,y                               ; $0D9C07 |
  INC A                                     ; $0D9C0A |
  INC A                                     ; $0D9C0B |
  STA $7182,y                               ; $0D9C0C |
  LDA #$0000                                ; $0D9C0F |
  STA $7222,y                               ; $0D9C12 |
  CPY #$00                                  ; $0D9C15 |
  BNE CODE_0D9C30                           ; $0D9C17 |
  LDY #$02                                  ; $0D9C19 |
  STY $0DB6                                 ; $0D9C1B |
  LDA $7900,x                               ; $0D9C1E |
  BNE CODE_0D9C7B                           ; $0D9C21 |
  LDA #$0004                                ; $0D9C23 |
  STA $7900,x                               ; $0D9C26 |
  STA $7AF6,x                               ; $0D9C29 |
  STZ $78,x                                 ; $0D9C2C |
  BRA CODE_0D9C7B                           ; $0D9C2E |

CODE_0D9C30:
  LDA $7222,y                               ; $0D9C30 |
  CMP #$FF40                                ; $0D9C33 |
  BPL CODE_0D9C48                           ; $0D9C36 |
  LDA $7900,x                               ; $0D9C38 |
  BNE CODE_0D9C48                           ; $0D9C3B |
  LDA #$0004                                ; $0D9C3D |
  STA $7900,x                               ; $0D9C40 |
  STA $7AF6,x                               ; $0D9C43 |
  STZ $78,x                                 ; $0D9C46 |

CODE_0D9C48:
  LDA $7D38,y                               ; $0D9C48 |
  BEQ CODE_0D9C7B                           ; $0D9C4B |
  TYX                                       ; $0D9C4D |
  PHY                                       ; $0D9C4E |
  JSL $03B25B                               ; $0D9C4F |
  PLY                                       ; $0D9C53 |
  LDA #$0000                                ; $0D9C54 |
  STA $7222,y                               ; $0D9C57 |
  STA $7A96,y                               ; $0D9C5A |
  BRA CODE_0D9C7B                           ; $0D9C5D |

CODE_0D9C5F:
  LDA $7222,y                               ; $0D9C5F |
  BMI CODE_0D9BEE                           ; $0D9C62 |
  LDY $18,x                                 ; $0D9C64 |
  BNE CODE_0D9C75                           ; $0D9C66 |
  LDY #$02                                  ; $0D9C68 |
  STY $18,x                                 ; $0D9C6A |
  STZ $78,x                                 ; $0D9C6C |
  LDA #$000E                                ; $0D9C6E |\ play sound #$000E
  JSL $0085D2                               ; $0D9C71 |/

CODE_0D9C75:
  LDA #$0010                                ; $0D9C75 |
  STA $7AF6,x                               ; $0D9C78 |

CODE_0D9C7B:
  LDA $02                                   ; $0D9C7B |
  BEQ CODE_0D9C82                           ; $0D9C7D |
  JMP CODE_0D9BB3                           ; $0D9C7F |

CODE_0D9C82:
  JMP CODE_0D9B86                           ; $0D9C82 |

CODE_0D9C85:
  LDA $7AF6,x                               ; $0D9C85 |
  BNE CODE_0D9C92                           ; $0D9C88 |
  LDY $18,x                                 ; $0D9C8A |
  BEQ CODE_0D9C92                           ; $0D9C8C |
  STZ $18,x                                 ; $0D9C8E |
  STZ $78,x                                 ; $0D9C90 |

CODE_0D9C92:
  RTS                                       ; $0D9C92 |

CODE_0D9C93:
  LDY $78,x                                 ; $0D9C93 |
  BEQ CODE_0D9C98                           ; $0D9C95 |
  RTS                                       ; $0D9C97 |

CODE_0D9C98:
  LDY $7900,x                               ; $0D9C98 |
  BNE CODE_0D9CA6                           ; $0D9C9B |
  LDA $7A38,x                               ; $0D9C9D |
  LDY $18,x                                 ; $0D9CA0 |
  BNE CODE_0D9CD6                           ; $0D9CA2 |
  BRA CODE_0D9CC4                           ; $0D9CA4 |

CODE_0D9CA6:
  LDY $7AF6,x                               ; $0D9CA6 |
  BNE CODE_0D9CBE                           ; $0D9CA9 |
  LDA $7A38,x                               ; $0D9CAB |
  BPL CODE_0D9CB8                           ; $0D9CAE |
  STZ $7A38,x                               ; $0D9CB0 |
  STZ $7900,x                               ; $0D9CB3 |
  BRA CODE_0D9CCF                           ; $0D9CB6 |

CODE_0D9CB8:
  SEC                                       ; $0D9CB8 |
  SBC #$0008                                ; $0D9CB9 |
  BRA CODE_0D9CE6                           ; $0D9CBC |

CODE_0D9CBE:
  CLC                                       ; $0D9CBE |
  ADC #$0008                                ; $0D9CBF |
  BRA CODE_0D9CE6                           ; $0D9CC2 |

CODE_0D9CC4:
  CMP #$0000                                ; $0D9CC4 |
  BPL CODE_0D9CCF                           ; $0D9CC7 |
  CLC                                       ; $0D9CC9 |
  ADC #$0010                                ; $0D9CCA |
  BRA CODE_0D9CE6                           ; $0D9CCD |

CODE_0D9CCF:
  INC $78,x                                 ; $0D9CCF |
  LDA #$0000                                ; $0D9CD1 |
  BRA CODE_0D9CE6                           ; $0D9CD4 |

CODE_0D9CD6:
  CMP #$FFA1                                ; $0D9CD6 |
  BMI CODE_0D9CE1                           ; $0D9CD9 |
  SEC                                       ; $0D9CDB |
  SBC #$0018                                ; $0D9CDC |
  BRA CODE_0D9CE6                           ; $0D9CDF |

CODE_0D9CE1:
  INC $78,x                                 ; $0D9CE1 |
  LDA #$FFA0                                ; $0D9CE3 |

CODE_0D9CE6:
  STA $7A38,x                               ; $0D9CE6 |
  LDA #$4060                                ; $0D9CE9 |
  STA $3018                                 ; $0D9CEC |
  LDA #$0055                                ; $0D9CEF |
  STA $301A                                 ; $0D9CF2 |
  LDA $7A38,x                               ; $0D9CF5 |
  CLC                                       ; $0D9CF8 |
  ADC $7A36,x                               ; $0D9CF9 |
  AND #$01FE                                ; $0D9CFC |
  LSR A                                     ; $0D9CFF |
  STA $300A                                 ; $0D9D00 |
  LDA #$0100                                ; $0D9D03 |
  STA $300C                                 ; $0D9D06 |
  LDY $7722,x                               ; $0D9D09 |
  TYX                                       ; $0D9D0C |
  LDA $03A9CE,x                             ; $0D9D0D |
  STA $3006                                 ; $0D9D11 |
  LDA $03A9EE,x                             ; $0D9D14 |
  STA $3004                                 ; $0D9D18 |
  LDX #$08                                  ; $0D9D1B |
  LDA #$8205                                ; $0D9D1D |
  JSL $7EDE44                               ; $0D9D20 | GSU init
  LDX $12                                   ; $0D9D24 |
  INC $0CF9                                 ; $0D9D26 |
  RTS                                       ; $0D9D29 |

DATA_0D9D2A:         dw $0080, $FF80

init_flipper_left_and_right:
  JSL $03AE60                               ; $0D9D2E |
  LDA $70E2,x                               ; $0D9D32 |
  AND #$0010                                ; $0D9D35 |
  LSR A                                     ; $0D9D38 |
  LSR A                                     ; $0D9D39 |
  LSR A                                     ; $0D9D3A |
  TAY                                       ; $0D9D3B |
  LDA $9D2A,y                               ; $0D9D3C |
  STA $7A36,x                               ; $0D9D3F |
  STZ $7400,x                               ; $0D9D42 |
  JSR CODE_0D9C93                           ; $0D9D45 |
  RTL                                       ; $0D9D48 |

main_flipped_left_and_right:
  JSR CODE_0D9D64                           ; $0D9D49 |
  JSL $03AF23                               ; $0D9D4C |
  JSR CODE_0D9E70                           ; $0D9D50 |
  JSR CODE_0D9C93                           ; $0D9D53 |
  LDA #$04B5                                ; $0D9D56 |
  LDY $18,x                                 ; $0D9D59 |
  BEQ CODE_0D9D60                           ; $0D9D5B |
  LDA #$0475                                ; $0D9D5D |

CODE_0D9D60:
  STA $6FA0,x                               ; $0D9D60 |
  RTL                                       ; $0D9D63 |

CODE_0D9D64:
  JSL $03AA52                               ; $0D9D64 |
  LDA $7A38,x                               ; $0D9D68 |
  AND #$01FE                                ; $0D9D6B |
  STA $3002                                 ; $0D9D6E |
  LDA #$0008                                ; $0D9D71 |
  STA $300C                                 ; $0D9D74 |
  LDX #$0B                                  ; $0D9D77 |
  LDA #$8595                                ; $0D9D79 |
  JSL $7EDE44                               ; $0D9D7C | GSU init
  LDX $12                                   ; $0D9D80 |
  LDA $70E2,x                               ; $0D9D82 |
  AND #$0010                                ; $0D9D85 |
  BNE CODE_0D9DBB                           ; $0D9D88 |
  LDA $7CD6,x                               ; $0D9D8A |
  CLC                                       ; $0D9D8D |
  ADC $3002                                 ; $0D9D8E |
  SEC                                       ; $0D9D91 |
  SBC $6094                                 ; $0D9D92 |
  STA $00                                   ; $0D9D95 |
  LDA $7CD8,x                               ; $0D9D97 |
  CLC                                       ; $0D9D9A |
  ADC #$0018                                ; $0D9D9B |
  SEC                                       ; $0D9D9E |
  SBC $3000                                 ; $0D9D9F |
  SEC                                       ; $0D9DA2 |
  SBC $609C                                 ; $0D9DA3 |
  STA $02                                   ; $0D9DA6 |
  LDA $7CD8,x                               ; $0D9DA8 |
  SEC                                       ; $0D9DAB |
  SBC #$0018                                ; $0D9DAC |
  CLC                                       ; $0D9DAF |
  ADC $3000                                 ; $0D9DB0 |
  SEC                                       ; $0D9DB3 |
  SBC $609C                                 ; $0D9DB4 |
  STA $04                                   ; $0D9DB7 |
  BRA CODE_0D9DEA                           ; $0D9DB9 |

CODE_0D9DBB:
  LDA $7CD6,x                               ; $0D9DBB |
  SEC                                       ; $0D9DBE |
  SBC $3002                                 ; $0D9DBF |
  SEC                                       ; $0D9DC2 |
  SBC $6094                                 ; $0D9DC3 |
  STA $00                                   ; $0D9DC6 |
  LDA $7CD8,x                               ; $0D9DC8 |
  SEC                                       ; $0D9DCB |
  SBC #$0018                                ; $0D9DCC |
  CLC                                       ; $0D9DCF |
  ADC $3000                                 ; $0D9DD0 |
  SEC                                       ; $0D9DD3 |
  SBC $609C                                 ; $0D9DD4 |
  STA $02                                   ; $0D9DD7 |
  LDA $7CD8,x                               ; $0D9DD9 |
  CLC                                       ; $0D9DDC |
  ADC #$0018                                ; $0D9DDD |
  SEC                                       ; $0D9DE0 |
  SBC $3000                                 ; $0D9DE1 |
  SEC                                       ; $0D9DE4 |
  SBC $609C                                 ; $0D9DE5 |
  STA $04                                   ; $0D9DE8 |

CODE_0D9DEA:
  REP #$10                                  ; $0D9DEA |
  LDY $7362,x                               ; $0D9DEC |
  LDA $00                                   ; $0D9DEF |
  STA $6008,y                               ; $0D9DF1 |
  STA $6018,y                               ; $0D9DF4 |
  STA $6028,y                               ; $0D9DF7 |
  STA $6038,y                               ; $0D9DFA |
  SEC                                       ; $0D9DFD |
  SBC #$0010                                ; $0D9DFE |
  STA $6000,y                               ; $0D9E01 |
  STA $6010,y                               ; $0D9E04 |
  STA $6020,y                               ; $0D9E07 |
  STA $6030,y                               ; $0D9E0A |
  LDA $02                                   ; $0D9E0D |
  STA $6012,y                               ; $0D9E0F |
  STA $601A,y                               ; $0D9E12 |
  SEC                                       ; $0D9E15 |
  SBC #$0010                                ; $0D9E16 |
  STA $6002,y                               ; $0D9E19 |
  STA $600A,y                               ; $0D9E1C |
  LDA $04                                   ; $0D9E1F |
  STA $6022,y                               ; $0D9E21 |
  STA $602A,y                               ; $0D9E24 |
  SEC                                       ; $0D9E27 |
  SBC #$0010                                ; $0D9E28 |
  STA $6032,y                               ; $0D9E2B |
  STA $603A,y                               ; $0D9E2E |
  LDA $6004,y                               ; $0D9E31 |
  EOR #$8000                                ; $0D9E34 |
  STA $6024,y                               ; $0D9E37 |
  LDA $600C,y                               ; $0D9E3A |
  EOR #$8000                                ; $0D9E3D |
  STA $602C,y                               ; $0D9E40 |
  LDA $6014,y                               ; $0D9E43 |
  EOR #$8000                                ; $0D9E46 |
  STA $6034,y                               ; $0D9E49 |
  LDA $601C,y                               ; $0D9E4C |
  EOR #$8000                                ; $0D9E4F |
  STA $603C,y                               ; $0D9E52 |
  LDA $6006,y                               ; $0D9E55 |
  STA $6026,y                               ; $0D9E58 |
  LDA $600E,y                               ; $0D9E5B |
  STA $602E,y                               ; $0D9E5E |
  LDA $6016,y                               ; $0D9E61 |
  STA $6036,y                               ; $0D9E64 |
  LDA $601E,y                               ; $0D9E67 |
  STA $603E,y                               ; $0D9E6A |
  SEP #$10                                  ; $0D9E6D |
  RTS                                       ; $0D9E6F |

CODE_0D9E70:
  LDA $70E2,x                               ; $0D9E70 |
  AND #$0010                                ; $0D9E73 |
  DEC A                                     ; $0D9E76 |
  STA $0E                                   ; $0D9E77 |
  STZ $02                                   ; $0D9E79 |
  LDY $7D36,x                               ; $0D9E7B |
  BMI CODE_0D9E83                           ; $0D9E7E |

CODE_0D9E80:
  JMP CODE_0D9F55                           ; $0D9E80 |

CODE_0D9E83:
  LDY $18,x                                 ; $0D9E83 |
  BNE CODE_0D9E8E                           ; $0D9E85 |
  LDA $7C16,x                               ; $0D9E87 |
  EOR $0E                                   ; $0D9E8A |
  BPL CODE_0D9E91                           ; $0D9E8C |

CODE_0D9E8E:
  JMP CODE_0D9F38                           ; $0D9E8E |

CODE_0D9E91:
  LDA $7A38,x                               ; $0D9E91 |
  CMP #$FFE0                                ; $0D9E94 |
  BMI CODE_0D9E80                           ; $0D9E97 |
  LDA $60A8                                 ; $0D9E99 |
  BNE CODE_0D9EAA                           ; $0D9E9C |
  LDA $0035                                 ; $0D9E9E |
  AND #$0300                                ; $0D9EA1 |
  BEQ CODE_0D9E80                           ; $0D9EA4 |
  AND #$0100                                ; $0D9EA6 |
  DEC A                                     ; $0D9EA9 |

CODE_0D9EAA:
  EOR $0E                                   ; $0D9EAA |
  BMI CODE_0D9E80                           ; $0D9EAC |
  LDA $60A8                                 ; $0D9EAE |
  CLC                                       ; $0D9EB1 |
  ADC #$00C0                                ; $0D9EB2 |
  CMP #$0180                                ; $0D9EB5 |
  BCC CODE_0D9ECA                           ; $0D9EB8 |
  LDY $7900,x                               ; $0D9EBA |
  BNE CODE_0D9ECA                           ; $0D9EBD |
  LDA #$0004                                ; $0D9EBF |
  STA $7900,x                               ; $0D9EC2 |
  STA $7AF6,x                               ; $0D9EC5 |
  STZ $78,x                                 ; $0D9EC8 |

CODE_0D9ECA:
  LDA $6120                                 ; $0D9ECA |
  CLC                                       ; $0D9ECD |
  ADC $7BB6,x                               ; $0D9ECE |
  DEC A                                     ; $0D9ED1 |
  DEC A                                     ; $0D9ED2 |
  LDY $0E                                   ; $0D9ED3 |
  BMI CODE_0D9EDB                           ; $0D9ED5 |
  EOR #$FFFF                                ; $0D9ED7 |
  INC A                                     ; $0D9EDA |

CODE_0D9EDB:
  CLC                                       ; $0D9EDB |
  ADC $7CD6,x                               ; $0D9EDC |
  SEC                                       ; $0D9EDF |
  SBC $611C                                 ; $0D9EE0 |
  CLC                                       ; $0D9EE3 |
  ADC $608C                                 ; $0D9EE4 |
  STA $608C                                 ; $0D9EE7 |
  LDA $60A8                                 ; $0D9EEA |
  CLC                                       ; $0D9EED |
  ADC #$0280                                ; $0D9EEE |
  CMP #$0500                                ; $0D9EF1 |
  BCC CODE_0D9F25                           ; $0D9EF4 |
  LDA $60A8                                 ; $0D9EF6 |
  PHA                                       ; $0D9EF9 |
  CMP #$8000                                ; $0D9EFA |
  ROR A                                     ; $0D9EFD |
  CMP #$8000                                ; $0D9EFE |
  ROR A                                     ; $0D9F01 |
  EOR #$FFFF                                ; $0D9F02 |
  INC A                                     ; $0D9F05 |
  STA $60A8                                 ; $0D9F06 |
  STA $60B4                                 ; $0D9F09 |
  PLA                                       ; $0D9F0C |
  BMI CODE_0D9F13                           ; $0D9F0D |
  EOR #$FFFF                                ; $0D9F0F |
  INC A                                     ; $0D9F12 |

CODE_0D9F13:
  STA $60AA                                 ; $0D9F13 |
  LDA #$0006                                ; $0D9F16 |
  STA $60C0                                 ; $0D9F19 |
  LDA #$0034                                ; $0D9F1C |\ play sound #$0034
  JSL $0085D2                               ; $0D9F1F |/
  BRA CODE_0D9F55                           ; $0D9F23 |

CODE_0D9F25:
  STZ $60A8                                 ; $0D9F25 |
  STZ $60B4                                 ; $0D9F28 |
  LDY $60C0                                 ; $0D9F2B |
  BNE CODE_0D9F55                           ; $0D9F2E |
  INC $61C2                                 ; $0D9F30 |
  INC $60DC                                 ; $0D9F33 |
  BRA CODE_0D9F55                           ; $0D9F36 |

CODE_0D9F38:
  LDY $18,x                                 ; $0D9F38 |
  BNE CODE_0D9F4F                           ; $0D9F3A |
  LDA #$0010                                ; $0D9F3C |
  STA $7BB6,x                               ; $0D9F3F |
  LDY #$02                                  ; $0D9F42 |
  STY $18,x                                 ; $0D9F44 |
  STZ $78,x                                 ; $0D9F46 |
  LDA #$000E                                ; $0D9F48 |\ play sound #$000E
  JSL $0085D2                               ; $0D9F4B |/

CODE_0D9F4F:
  LDA #$0010                                ; $0D9F4F |
  STA $7AF6,x                               ; $0D9F52 |

CODE_0D9F55:
  TXA                                       ; $0D9F55 |
  STA $3002                                 ; $0D9F56 |
  LDX #$09                                  ; $0D9F59 |
  LDA #$9011                                ; $0D9F5B |
  JSL $7EDE44                               ; $0D9F5E | GSU init

CODE_0D9F62:
  LDX $12                                   ; $0D9F62 |
  LDY $301C                                 ; $0D9F64 |
  BMI CODE_0D9F8A                           ; $0D9F67 |
  BNE CODE_0D9F73                           ; $0D9F69 |
  LDA $61B2                                 ; $0D9F6B |
  ORA $61CC                                 ; $0D9F6E |
  BMI CODE_0D9F8A                           ; $0D9F71 |

CODE_0D9F73:
  LDA $7360,y                               ; $0D9F73 |
  CMP #$0091                                ; $0D9F76 |
  BEQ CODE_0D9F7F                           ; $0D9F79 |
  INC $02                                   ; $0D9F7B |
  BRA CODE_0D9F9E                           ; $0D9F7D |

CODE_0D9F7F:
  LDX #$09                                  ; $0D9F7F |
  LDA $301E                                 ; $0D9F81 |
  JSL $7EDE44                               ; $0D9F84 | GSU init
  BRA CODE_0D9F62                           ; $0D9F88 |

CODE_0D9F8A:
  LDA $7AF6,x                               ; $0D9F8A |
  BNE CODE_0D9F9D                           ; $0D9F8D |
  LDY $18,x                                 ; $0D9F8F |
  BEQ CODE_0D9F9D                           ; $0D9F91 |
  LDA #$0008                                ; $0D9F93 |
  STA $7BB6,x                               ; $0D9F96 |
  STZ $18,x                                 ; $0D9F99 |
  STZ $78,x                                 ; $0D9F9B |

CODE_0D9F9D:
  RTS                                       ; $0D9F9D |

CODE_0D9F9E:
  LDA $7220,y                               ; $0D9F9E |
  EOR $0E                                   ; $0D9FA1 |
  BPL CODE_0D9FB3                           ; $0D9FA3 |
  LDA $7CD6,x                               ; $0D9FA5 |
  SEC                                       ; $0D9FA8 |
  SBC $7CD6,y                               ; $0D9FA9 |
  EOR $0E                                   ; $0D9FAC |
  BPL CODE_0D9FB3                           ; $0D9FAE |
  JMP CODE_0DA05C                           ; $0D9FB0 |

CODE_0D9FB3:
  LDA $7A38,x                               ; $0D9FB3 |
  CMP #$FFE0                                ; $0D9FB6 |
  BMI CODE_0DA028                           ; $0D9FB9 |
  LDA $6FA2,x                               ; $0D9FBB |
  AND #$4000                                ; $0D9FBE |
  BEQ CODE_0D9FC6                           ; $0D9FC1 |
  JMP CODE_0DA02A                           ; $0D9FC3 |

CODE_0D9FC6:
  LDA $7220,y                               ; $0D9FC6 |
  BEQ CODE_0DA028                           ; $0D9FC9 |
  EOR $0E                                   ; $0D9FCB |
  BMI CODE_0DA028                           ; $0D9FCD |
  LDA $7D38,y                               ; $0D9FCF |
  BEQ CODE_0DA02A                           ; $0D9FD2 |
  PHY                                       ; $0D9FD4 |
  LDA $7BB6,y                               ; $0D9FD5 |
  SEC                                       ; $0D9FD8 |
  ADC $7BB6,x                               ; $0D9FD9 |
  INC A                                     ; $0D9FDC |
  INC A                                     ; $0D9FDD |
  LDY $0E                                   ; $0D9FDE |
  BMI CODE_0D9FE6                           ; $0D9FE0 |
  EOR #$FFFF                                ; $0D9FE2 |
  INC A                                     ; $0D9FE5 |

CODE_0D9FE6:
  PLY                                       ; $0D9FE6 |
  CLC                                       ; $0D9FE7 |
  ADC $7CD6,x                               ; $0D9FE8 |
  SEC                                       ; $0D9FEB |
  SBC $7CD6,y                               ; $0D9FEC |
  CLC                                       ; $0D9FEF |
  ADC $70E2,y                               ; $0D9FF0 |
  STA $70E2,y                               ; $0D9FF3 |
  LDA $7220,y                               ; $0D9FF6 |
  CLC                                       ; $0D9FF9 |
  ADC #$00C0                                ; $0D9FFA |
  CMP #$0180                                ; $0D9FFD |
  BCC CODE_0DA012                           ; $0DA000 |
  LDA $7900,x                               ; $0DA002 |
  BNE CODE_0DA012                           ; $0DA005 |
  LDA #$0004                                ; $0DA007 |
  STA $7900,x                               ; $0DA00A |
  STA $7AF6,x                               ; $0DA00D |
  STZ $78,x                                 ; $0DA010 |

CODE_0DA012:
  LDA #$0000                                ; $0DA012 |
  STA $7220,y                               ; $0DA015 |
  LDA $6FA2,y                               ; $0DA018 |
  AND #$6000                                ; $0DA01B |
  CMP #$6000                                ; $0DA01E |
  BEQ CODE_0DA08D                           ; $0DA021 |
  TYX                                       ; $0DA023 |
  JSL $03B25B                               ; $0DA024 |

CODE_0DA028:
  BRA CODE_0DA08D                           ; $0DA028 |

CODE_0DA02A:
  LDA $7220,y                               ; $0DA02A |
  BEQ CODE_0DA08D                           ; $0DA02D |
  EOR $0E                                   ; $0DA02F |
  BMI CODE_0DA08D                           ; $0DA031 |
  LDA $7220,y                               ; $0DA033 |
  EOR #$FFFF                                ; $0DA036 |
  INC A                                     ; $0DA039 |
  STA $7220,y                               ; $0DA03A |
  LDA $7400,y                               ; $0DA03D |
  EOR #$0002                                ; $0DA040 |
  STA $7400,y                               ; $0DA043 |
  LDA $75E0,y                               ; $0DA046 |
  EOR #$FFFF                                ; $0DA049 |
  INC A                                     ; $0DA04C |
  STA $75E0,y                               ; $0DA04D |
  LDA $70E2,y                               ; $0DA050 |
  SEC                                       ; $0DA053 |
  SBC $72C0,y                               ; $0DA054 |
  STA $70E2,y                               ; $0DA057 |
  BRA CODE_0DA08D                           ; $0DA05A |

CODE_0DA05C:
  LDA $7360,y                               ; $0DA05C |
  CMP #$009E                                ; $0DA05F |
  BEQ CODE_0DA069                           ; $0DA062 |
  LDA $7D38,y                               ; $0DA064 |
  BEQ CODE_0DA02A                           ; $0DA067 |

CODE_0DA069:
  LDA $18,x                                 ; $0DA069 |
  BNE CODE_0DA087                           ; $0DA06B |
  LDA $7220,y                               ; $0DA06D |
  EOR $0E                                   ; $0DA070 |
  BPL CODE_0DA02A                           ; $0DA072 |
  LDA #$0010                                ; $0DA074 |
  STA $7BB6,x                               ; $0DA077 |
  LDY #$02                                  ; $0DA07A |
  STY $18,x                                 ; $0DA07C |
  STZ $78,x                                 ; $0DA07E |
  LDA #$000E                                ; $0DA080 |\ play sound #$000E
  JSL $0085D2                               ; $0DA083 |/

CODE_0DA087:
  LDA #$0010                                ; $0DA087 |
  STA $7AF6,x                               ; $0DA08A |

CODE_0DA08D:
  LDA $02                                   ; $0DA08D |
  BEQ CODE_0DA094                           ; $0DA08F |
  JMP CODE_0D9F7F                           ; $0DA091 |

CODE_0DA094:
  JMP CODE_0D9F55                           ; $0DA094 |

init_shark_chomp:
  LDA $70E2,x                               ; $0DA097 |
  SEC                                       ; $0DA09A |
  SBC $0039                                 ; $0DA09B |
  CMP #$FFB0                                ; $0DA09E |
  BMI CODE_0DA0B0                           ; $0DA0A1 |
  LDA #$00FF                                ; $0DA0A3 |
  STA $74A2,x                               ; $0DA0A6 |
  LDA #$0002                                ; $0DA0A9 |
  STA $6F00,x                               ; $0DA0AC |
  RTL                                       ; $0DA0AF |

CODE_0DA0B0:
  JSR CODE_0DA4CA                           ; $0DA0B0 |
  STZ $7400,x                               ; $0DA0B3 |
  LDA #$FFE8                                ; $0DA0B6 |
  STA $7902,x                               ; $0DA0B9 |
  LDA #$0007                                ; $0DA0BC |
  STA $74A2,x                               ; $0DA0BF |
  LDA #$0008                                ; $0DA0C2 |
  STA $7540,x                               ; $0DA0C5 |
  LDA #$0400                                ; $0DA0C8 |
  STA $7900,x                               ; $0DA0CB |
  LDY #$15                                  ; $0DA0CE |
  STY $0967                                 ; $0DA0D0 |
  LDA $6094                                 ; $0DA0D3 |
  SEC                                       ; $0DA0D6 |
  SBC $70E2,x                               ; $0DA0D7 |
  CLC                                       ; $0DA0DA |
  ADC #$0040                                ; $0DA0DB |
  STA $0041                                 ; $0DA0DE |
  LDA $609C                                 ; $0DA0E1 |
  SEC                                       ; $0DA0E4 |
  SBC $7182,x                               ; $0DA0E5 |
  CLC                                       ; $0DA0E8 |
  ADC #$0040                                ; $0DA0E9 |
  STA $0043                                 ; $0DA0EC |
  RTL                                       ; $0DA0EF |

DATA_0DA0F0:         dw $A21E
DATA_0DA0F2:         dw $A24A
DATA_0DA0F4:         dw $A270
DATA_0DA0F6:         dw $0004
DATA_0DA0F8:         dw $0004
DATA_0DA0FA:         dw $A2F4
DATA_0DA0FC:         dw $A332

main_shark_chomp:
  JSR CODE_0DA167                           ; $0DA0FE |
  LDA $6F00,x                               ; $0DA101 |
  CMP #$0010                                ; $0DA104 |
  BEQ CODE_0DA113                           ; $0DA107 |
  LDA $0967                                 ; $0DA109 |
  AND #$1313                                ; $0DA10C |
  STA $0967                                 ; $0DA10F |
  RTL                                       ; $0DA112 |

CODE_0DA113:
  JSL $03AF23                               ; $0DA113 |
  TXY                                       ; $0DA117 |
  LDA $76,x                                 ; $0DA118 |
  ASL A                                     ; $0DA11A |
  TAX                                       ; $0DA11B |
  JSR ($A0F0,x)                             ; $0DA11C |
  LDY $76,x                                 ; $0DA11F |
  CPY #$05                                  ; $0DA121 |
  BPL CODE_0DA15A                           ; $0DA123 |
  JSR CODE_0DA416                           ; $0DA125 |
  JSR CODE_0DA369                           ; $0DA128 |
  JSR CODE_0DA386                           ; $0DA12B |
  LDA #$0008                                ; $0DA12E |
  STA $7540,x                               ; $0DA131 |
  LDA $7680,x                               ; $0DA134 |
  CMP #$FFC0                                ; $0DA137 |
  BPL CODE_0DA141                           ; $0DA13A |
  LDA #$0380                                ; $0DA13C |
  BRA CODE_0DA144                           ; $0DA13F |

CODE_0DA141:
  LDA $7900,x                               ; $0DA141 |

CODE_0DA144:
  STA $75E0,x                               ; $0DA144 |
  SEC                                       ; $0DA147 |
  SBC $7220,x                               ; $0DA148 |
  CLC                                       ; $0DA14B |
  ADC #$0100                                ; $0DA14C |
  CMP #$0200                                ; $0DA14F |
  BCC CODE_0DA15A                           ; $0DA152 |
  LDA #$0010                                ; $0DA154 |
  STA $7540,x                               ; $0DA157 |

CODE_0DA15A:
  RTL                                       ; $0DA15A |

DATA_0DA15B:         dw $FFF0, $FFEE, $FFED, $FFD1
DATA_0DA163:         dw $FFCE, $FFCC

CODE_0DA167:
  LDY $18,x                                 ; $0DA167 |
  LDA $A15B,y                               ; $0DA169 |
  CLC                                       ; $0DA16C |
  ADC $7680,x                               ; $0DA16D |
  STA $00                                   ; $0DA170 |
  LDA $A161,y                               ; $0DA172 |
  CLC                                       ; $0DA175 |
  ADC $7682,x                               ; $0DA176 |
  STA $02                                   ; $0DA179 |
  REP #$10                                  ; $0DA17B |
  LDY $7362,x                               ; $0DA17D |
  LDA $00                                   ; $0DA180 |
  STA $6008,y                               ; $0DA182 |
  STA $6010,y                               ; $0DA185 |
  CLC                                       ; $0DA188 |
  ADC #$0008                                ; $0DA189 |
  STA $6018,y                               ; $0DA18C |
  CLC                                       ; $0DA18F |
  ADC #$0008                                ; $0DA190 |
  STA $6000,y                               ; $0DA193 |
  LDA $02                                   ; $0DA196 |
  STA $600A,y                               ; $0DA198 |
  STA $601A,y                               ; $0DA19B |
  CLC                                       ; $0DA19E |
  ADC #$0008                                ; $0DA19F |
  STA $6012,y                               ; $0DA1A2 |
  CLC                                       ; $0DA1A5 |
  ADC #$0008                                ; $0DA1A6 |
  STA $6002,y                               ; $0DA1A9 |
  SEP #$10                                  ; $0DA1AC |
  LDA $6094                                 ; $0DA1AE |
  SEC                                       ; $0DA1B1 |
  SBC $70E2,x                               ; $0DA1B2 |
  CLC                                       ; $0DA1B5 |
  ADC #$0040                                ; $0DA1B6 |
  STA $0041                                 ; $0DA1B9 |
  CLC                                       ; $0DA1BC |
  ADC #$0100                                ; $0DA1BD |
  CMP #$0200                                ; $0DA1C0 |
  BCC CODE_0DA1CB                           ; $0DA1C3 |
  LDA #$0100                                ; $0DA1C5 |
  STA $0041                                 ; $0DA1C8 |

CODE_0DA1CB:
  LDY $19,x                                 ; $0DA1CB |
  BEQ CODE_0DA1F6                           ; $0DA1CD |
  LDA $7A36,x                               ; $0DA1CF |
  AND #$FF00                                ; $0DA1D2 |
  XBA                                       ; $0DA1D5 |
  STA $00                                   ; $0DA1D6 |
  REP #$10                                  ; $0DA1D8 |
  LDY $7362,x                               ; $0DA1DA |
  LDA $604A,y                               ; $0DA1DD |
  CLC                                       ; $0DA1E0 |
  ADC $00                                   ; $0DA1E1 |
  STA $604A,y                               ; $0DA1E3 |
  LDA $6052,y                               ; $0DA1E6 |
  CLC                                       ; $0DA1E9 |
  ADC $00                                   ; $0DA1EA |
  STA $6052,y                               ; $0DA1EC |
  SEP #$10                                  ; $0DA1EF |
  LDA #$0000                                ; $0DA1F1 |
  BRA CODE_0DA1FF                           ; $0DA1F4 |

CODE_0DA1F6:
  LDA $10                                   ; $0DA1F6 |
  AND #$0003                                ; $0DA1F8 |
  SEC                                       ; $0DA1FB |
  SBC #$0002                                ; $0DA1FC |

CODE_0DA1FF:
  CLC                                       ; $0DA1FF |
  ADC $609C                                 ; $0DA200 |
  SEC                                       ; $0DA203 |
  SBC $7182,x                               ; $0DA204 |
  CLC                                       ; $0DA207 |
  ADC #$0040                                ; $0DA208 |
  STA $0043                                 ; $0DA20B |
  CLC                                       ; $0DA20E |
  ADC #$0100                                ; $0DA20F |
  CMP #$0200                                ; $0DA212 |
  BCC CODE_0DA21D                           ; $0DA215 |
  LDA #$0100                                ; $0DA217 |
  STA $0043                                 ; $0DA21A |

CODE_0DA21D:
  RTS                                       ; $0DA21D |
  TYX                                       ; $0DA21E |
  LDA $7680,x                               ; $0DA21F |
  CMP #$0000                                ; $0DA222 |
  BMI CODE_0DA241                           ; $0DA225 |
  LDA #$0020                                ; $0DA227 |
  STA $7900,x                               ; $0DA22A |
  LDY #$01                                  ; $0DA22D |
  LDA $0C1C                                 ; $0DA22F |
  BEQ CODE_0DA23F                           ; $0DA232 |
  LDA $70E2,x                               ; $0DA234 |
  CLC                                       ; $0DA237 |
  ADC #$0080                                ; $0DA238 |
  STA $78,x                                 ; $0DA23B |
  LDY #$03                                  ; $0DA23D |

CODE_0DA23F:
  STY $76,x                                 ; $0DA23F |

CODE_0DA241:
  RTS                                       ; $0DA241 |

DATA_0DA242:         dw $0220, $0260, $0280, $02C0

  TYX                                       ; $0DA24A |
  LDA $7680,x                               ; $0DA24B |
  CMP $78,x                                 ; $0DA24E |
  BPL CODE_0DA267                           ; $0DA250 |
  LDA $10                                   ; $0DA252 |
  AND #$001F                                ; $0DA254 |
  STA $78,x                                 ; $0DA257 |
  LDA $10                                   ; $0DA259 |
  AND #$0006                                ; $0DA25B |
  TAY                                       ; $0DA25E |
  LDA $A242,y                               ; $0DA25F |
  STA $7900,x                               ; $0DA262 |
  INC $76,x                                 ; $0DA265 |

CODE_0DA267:
  RTS                                       ; $0DA267 |

DATA_0DA268:         dw $0080, $00A0, $00C0, $0100

  TYX                                       ; $0DA270 |
  LDA $7680,x                               ; $0DA271 |
  CMP $78,x                                 ; $0DA274 |
  BMI CODE_0DA291                           ; $0DA276 |
  LDA $10                                   ; $0DA278 |
  AND #$003F                                ; $0DA27A |
  CLC                                       ; $0DA27D |
  ADC #$FFC0                                ; $0DA27E |
  STA $78,x                                 ; $0DA281 |
  LDA $10                                   ; $0DA283 |
  AND #$0006                                ; $0DA285 |
  TAY                                       ; $0DA288 |
  LDA $A268,y                               ; $0DA289 |
  STA $7900,x                               ; $0DA28C |
  DEC $76,x                                 ; $0DA28F |

CODE_0DA291:
  RTS                                       ; $0DA291 |

DATA_0DA292:         dw $0000, $0200, $0000, $0200
DATA_0DA29A:         dw $0200, $0400

  TYX                                       ; $0DA29E |
  LDA $70E2,x                               ; $0DA29F |
  CMP $78,x                                 ; $0DA2A2 |
  BMI CODE_0DA2BD                           ; $0DA2A4 |
  LDA $78,x                                 ; $0DA2A6 |
  CLC                                       ; $0DA2A8 |
  ADC #$0100                                ; $0DA2A9 |
  STA $78,x                                 ; $0DA2AC |
  LDY $7A38,x                               ; $0DA2AE |
  LDA $A292,y                               ; $0DA2B1 |
  TAY                                       ; $0DA2B4 |
  LDA $A29A,y                               ; $0DA2B5 |
  STA $7900,x                               ; $0DA2B8 |
  INC $76,x                                 ; $0DA2BB |

CODE_0DA2BD:
  RTS                                       ; $0DA2BD |

DATA_0DA2BE:         dw $0002, $0000, $0200, $0000
DATA_0DA2C6:         dw $0020, $0060

  TYX                                       ; $0DA2CA |
  LDA $70E2,x                               ; $0DA2CB |
  CMP $78,x                                 ; $0DA2CE |
  BMI CODE_0DA2F3                           ; $0DA2D0 |
  LDA $78,x                                 ; $0DA2D2 |
  CLC                                       ; $0DA2D4 |
  ADC #$0080                                ; $0DA2D5 |
  STA $78,x                                 ; $0DA2D8 |
  LDY $7A38,x                               ; $0DA2DA |
  LDA $A2BE,y                               ; $0DA2DD |
  TAY                                       ; $0DA2E0 |
  LDA $A2C6,y                               ; $0DA2E1 |
  STA $7900,x                               ; $0DA2E4 |
  LDA $7A38,x                               ; $0DA2E7 |
  INC A                                     ; $0DA2EA |
  AND #$0007                                ; $0DA2EB |
  STA $7A38,x                               ; $0DA2EE |
  DEC $76,x                                 ; $0DA2F1 |

CODE_0DA2F3:
  RTS                                       ; $0DA2F3 |
  TYX                                       ; $0DA2F4 |
  LDA $7A96,x                               ; $0DA2F5 |
  BNE CODE_0DA331                           ; $0DA2F8 |
  LDA $78,x                                 ; $0DA2FA |
  CLC                                       ; $0DA2FC |
  ADC #$0008                                ; $0DA2FD |
  CMP #$0200                                ; $0DA300 |
  BMI CODE_0DA308                           ; $0DA303 |
  LDA #$0200                                ; $0DA305 |

CODE_0DA308:
  STA $78,x                                 ; $0DA308 |
  CLC                                       ; $0DA30A |
  ADC $7A36,x                               ; $0DA30B |
  CMP #$1400                                ; $0DA30E |
  BMI CODE_0DA32E                           ; $0DA311 |
  LDA #$FF00                                ; $0DA313 |
  STA $78,x                                 ; $0DA316 |
  LDA #$0056                                ; $0DA318 |\ play sound #$0056
  JSL $0085D2                               ; $0DA31B |/
  DEC $16,x                                 ; $0DA31F |
  BNE CODE_0DA32B                           ; $0DA321 |
  LDA #$0040                                ; $0DA323 |
  STA $7A96,x                               ; $0DA326 |
  INC $76,x                                 ; $0DA329 |

CODE_0DA32B:
  LDA #$1400                                ; $0DA32B |

CODE_0DA32E:
  STA $7A36,x                               ; $0DA32E |

CODE_0DA331:
  RTS                                       ; $0DA331 |
  TYX                                       ; $0DA332 |
  LDA $7A96,x                               ; $0DA333 |
  BNE CODE_0DA350                           ; $0DA336 |
  LDA #$0040                                ; $0DA338 |
  CMP $7542,x                               ; $0DA33B |
  BEQ CODE_0DA350                           ; $0DA33E |
  STA $7542,x                               ; $0DA340 |
  LDA #$0400                                ; $0DA343 |
  STA $75E2,x                               ; $0DA346 |
  LDA #$0082                                ; $0DA349 |\ play sound #$0082
  JSL $0085D2                               ; $0DA34C |/

CODE_0DA350:
  LDA $7682,x                               ; $0DA350 |
  CMP #$0140                                ; $0DA353 |
  BMI CODE_0DA368                           ; $0DA356 |
  STZ $7ECC                                 ; $0DA358 |
  JSL $03A32E                               ; $0DA35B |
  LDA $0967                                 ; $0DA35F |
  AND #$1313                                ; $0DA362 |
  STA $0967                                 ; $0DA365 |

CODE_0DA368:
  RTS                                       ; $0DA368 |

CODE_0DA369:
  LDA $7C16,x                               ; $0DA369 |
  CLC                                       ; $0DA36C |
  ADC #$0018                                ; $0DA36D |
  CMP #$0030                                ; $0DA370 |
  BCS CODE_0DA385                           ; $0DA373 |
  LDA $7C18,x                               ; $0DA375 |
  CLC                                       ; $0DA378 |
  ADC #$0030                                ; $0DA379 |
  CMP #$0060                                ; $0DA37C |
  BCS CODE_0DA385                           ; $0DA37F |
  JSL $03A858                               ; $0DA381 |

CODE_0DA385:
  RTS                                       ; $0DA385 |

CODE_0DA386:
  LDA #$0002                                ; $0DA386 |
  STA $0E                                   ; $0DA389 |

CODE_0DA38B:
  LDA $70E2,x                               ; $0DA38B |
  CLC                                       ; $0DA38E |
  ADC #$0030                                ; $0DA38F |
  STA $3010                                 ; $0DA392 |
  STA $0091                                 ; $0DA395 |
  LDA $7182,x                               ; $0DA398 |
  CLC                                       ; $0DA39B |
  ADC $7902,x                               ; $0DA39C |
  STA $3000                                 ; $0DA39F |
  STA $0093                                 ; $0DA3A2 |
  LDX #$0A                                  ; $0DA3A5 |
  LDA #$CE2F                                ; $0DA3A7 |
  JSL $7EDE91                               ; $0DA3AA | GSU init
  LDX $12                                   ; $0DA3AE |
  LDA $300E                                 ; $0DA3B0 |
  AND #$F800                                ; $0DA3B3 |
  CMP #$4000                                ; $0DA3B6 |
  BNE CODE_0DA3C1                           ; $0DA3B9 |
  JSL $0DA46B                               ; $0DA3BB |
  BRA CODE_0DA3FC                           ; $0DA3BF |

CODE_0DA3C1:
  LDA $300A                                 ; $0DA3C1 |
  BEQ CODE_0DA3FC                           ; $0DA3C4 |
  STZ $7220,x                               ; $0DA3C6 |
  STZ $7540,x                               ; $0DA3C9 |
  LDY $18,x                                 ; $0DA3CC |
  CPY #$04                                  ; $0DA3CE |
  BNE CODE_0DA3FA                           ; $0DA3D0 |
  LDA #$0084                                ; $0DA3D2 |\ play sound #$0084
  JSL $0085D2                               ; $0DA3D5 |/
  LDA #$0040                                ; $0DA3D9 |
  STA $61C8                                 ; $0DA3DC |
  INC $19,x                                 ; $0DA3DF |
  STZ $78,x                                 ; $0DA3E1 |
  STZ $7A36,x                               ; $0DA3E3 |
  LDY #$03                                  ; $0DA3E6 |
  STY $16,x                                 ; $0DA3E8 |
  LDA #$0040                                ; $0DA3EA |
  STA $7A96,x                               ; $0DA3ED |
  LDA #$5C01                                ; $0DA3F0 |
  STA $7040,x                               ; $0DA3F3 |
  LDY #$05                                  ; $0DA3F6 |
  STY $76,x                                 ; $0DA3F8 |

CODE_0DA3FA:
  PLA                                       ; $0DA3FA |
  RTL                                       ; $0DA3FB |

CODE_0DA3FC:
  LDA $7902,x                               ; $0DA3FC |
  CLC                                       ; $0DA3FF |
  ADC #$0010                                ; $0DA400 |
  CMP #$0028                                ; $0DA403 |
  BMI CODE_0DA40B                           ; $0DA406 |
  LDA #$FFE8                                ; $0DA408 |

CODE_0DA40B:
  STA $7902,x                               ; $0DA40B |
  DEC $0E                                   ; $0DA40E |
  BEQ CODE_0DA415                           ; $0DA410 |
  JMP CODE_0DA38B                           ; $0DA412 |

CODE_0DA415:
  RTS                                       ; $0DA415 |

CODE_0DA416:
  LDA $72C0,x                               ; $0DA416 |
  CLC                                       ; $0DA419 |
  ADC $7A36,x                               ; $0DA41A |
  CMP #$0008                                ; $0DA41D |
  BMI CODE_0DA43D                           ; $0DA420 |
  SEC                                       ; $0DA422 |
  SBC #$0008                                ; $0DA423 |
  PHA                                       ; $0DA426 |
  LDY $18,x                                 ; $0DA427 |
  INY                                       ; $0DA429 |
  INY                                       ; $0DA42A |
  CPY #$06                                  ; $0DA42B |
  BNE CODE_0DA431                           ; $0DA42D |
  LDY #$00                                  ; $0DA42F |

CODE_0DA431:
  STY $18,x                                 ; $0DA431 |
  JSR CODE_0DA4CA                           ; $0DA433 |
  LDA #$0008                                ; $0DA436 |
  STA $7A98,x                               ; $0DA439 |
  PLA                                       ; $0DA43C |

CODE_0DA43D:
  STA $7A36,x                               ; $0DA43D |
  LDA $7A98,x                               ; $0DA440 |
  BNE CODE_0DA45D                           ; $0DA443 |
  LDA #$0008                                ; $0DA445 |
  STA $7A98,x                               ; $0DA448 |
  STZ $7A36,x                               ; $0DA44B |
  LDY $18,x                                 ; $0DA44E |
  INY                                       ; $0DA450 |
  INY                                       ; $0DA451 |
  CPY #$06                                  ; $0DA452 |
  BNE CODE_0DA458                           ; $0DA454 |
  LDY #$00                                  ; $0DA456 |

CODE_0DA458:
  STY $18,x                                 ; $0DA458 |
  JSR CODE_0DA4CA                           ; $0DA45A |

CODE_0DA45D:
  LDY $18,x                                 ; $0DA45D |
  CPY #$04                                  ; $0DA45F |
  BNE CODE_0DA46A                           ; $0DA461 |
  LDA #$0064                                ; $0DA463 |\ play sound #$0064
  JSL $0085D2                               ; $0DA466 |/

CODE_0DA46A:
  RTS                                       ; $0DA46A |
  LDA #$0000                                ; $0DA46B |
  STA $008F                                 ; $0DA46E |
  JSL $109295                               ; $0DA471 |
  LDX $12                                   ; $0DA475 |
  BRA CODE_0DA48C                           ; $0DA477 |
  LDA #$0000                                ; $0DA479 |
  STA $008F                                 ; $0DA47C |
  JSL $109295                               ; $0DA47F |
  LDX $12                                   ; $0DA483 |
  LDA #$000A                                ; $0DA485 |\ play sound #$000A
  JSL $0085D2                               ; $0DA488 |/

CODE_0DA48C:
  LDA #$01C3                                ; $0DA48C |
  JSL $008B21                               ; $0DA48F |
  LDA $0091                                 ; $0DA493 |
  AND #$FFF0                                ; $0DA496 |
  STA $70A2,y                               ; $0DA499 |
  LDA $0093                                 ; $0DA49C |
  AND #$FFF0                                ; $0DA49F |
  STA $7142,y                               ; $0DA4A2 |
  LDA #$FF80                                ; $0DA4A5 |
  STA $71E2,y                               ; $0DA4A8 |
  LDA #$000A                                ; $0DA4AB |
  STA $73C2,y                               ; $0DA4AE |
  LDA #$0002                                ; $0DA4B1 |
  STA $7782,y                               ; $0DA4B4 |
  LDA #$0008                                ; $0DA4B7 |
  STA $7502,y                               ; $0DA4BA |
  LDA #$0400                                ; $0DA4BD |
  STA $75A2,y                               ; $0DA4C0 |
  RTL                                       ; $0DA4C3 |

DATA_0DA4C4:         dw $5DA8, $5FA8, $61A8

CODE_0DA4CA:
  LDY $18,x                                 ; $0DA4CA |
  LDA $A4C4,y                               ; $0DA4CC |
  STA $00                                   ; $0DA4CF |
  PHX                                       ; $0DA4D1 |
  PHB                                       ; $0DA4D2 |
  SEP #$20                                  ; $0DA4D3 |
  LDA #$7E                                  ; $0DA4D5 |
  PHA                                       ; $0DA4D7 |
  PLB                                       ; $0DA4D8 |
  REP #$30                                  ; $0DA4D9 |
  LDX #$4800                                ; $0DA4DB |
  INX                                       ; $0DA4DE |
  INX                                       ; $0DA4DF |
  LDA #$3401                                ; $0DA4E0 |
  STA $0000,x                               ; $0DA4E3 |
  LDA #$0180                                ; $0DA4E6 |
  STA $0002,x                               ; $0DA4E9 |
  LDA #$0018                                ; $0DA4EC |
  STA $0004,x                               ; $0DA4EF |
  LDA $00                                   ; $0DA4F2 |
  STA $0005,x                               ; $0DA4F4 |
  LDA #$007E                                ; $0DA4F7 |
  STA $0007,x                               ; $0DA4FA |
  LDA #$01CC                                ; $0DA4FD |
  STA $0008,x                               ; $0DA500 |
  TXA                                       ; $0DA503 |
  CLC                                       ; $0DA504 |
  ADC #$000C                                ; $0DA505 |
  STA $000A,x                               ; $0DA508 |
  STA $4800                                 ; $0DA50B |
  SEP #$10                                  ; $0DA50E |
  PLB                                       ; $0DA510 |
  PLX                                       ; $0DA511 |
  RTS                                       ; $0DA512 |

; both green and red switches
init_spiked_platform_switch:
  LDA $7360,x                               ; $0DA513 |
  SEC                                       ; $0DA516 |
  SBC #$015C                                ; $0DA517 |
  ASL A                                     ; $0DA51A |
  STA $78,x                                 ; $0DA51B |
  STZ $7400,x                               ; $0DA51D |
  LDA $7182,x                               ; $0DA520 |
  STA $7902,x                               ; $0DA523 |
  RTL                                       ; $0DA526 |

; both green and red switches
main_spiked_platform_switch:
  JSL $03AF23                               ; $0DA527 |
  LDY $78,x                                 ; $0DA52B |
  LDA $0FD1,y                               ; $0DA52D |
  CMP $0FD5,y                               ; $0DA530 |
  BNE CODE_0DA538                           ; $0DA533 |
  JSR CODE_0DAA6B                           ; $0DA535 |

CODE_0DA538:
  JSL $03D291                               ; $0DA538 |
  JSL $03D127                               ; $0DA53C |
  LDA $7542,x                               ; $0DA540 |
  BEQ CODE_0DA556                           ; $0DA543 |
  LDA $7902,x                               ; $0DA545 |
  CMP $7182,x                               ; $0DA548 |
  BPL CODE_0DA556                           ; $0DA54B |
  STA $7182,x                               ; $0DA54D |
  STZ $7222,x                               ; $0DA550 |
  STZ $7542,x                               ; $0DA553 |

CODE_0DA556:
  LDA $7040,x                               ; $0DA556 |
  AND #$FFF3                                ; $0DA559 |
  STA $7040,x                               ; $0DA55C |
  RTL                                       ; $0DA55F |

; both green and red platforms
init_spiked_platform:
  LDA $7360,x                               ; $0DA560 |
  SEC                                       ; $0DA563 |
  SBC #$015F                                ; $0DA564 |
  ASL A                                     ; $0DA567 |
  STA $78,x                                 ; $0DA568 |
  TAY                                       ; $0DA56A |
  LDA $0FC1,y                               ; $0DA56B |
  BNE CODE_0DA5A1                           ; $0DA56E |
  JSL $03AE60                               ; $0DA570 |
  LDY $78,x                                 ; $0DA574 |
  LDA $7722,x                               ; $0DA576 |
  INC A                                     ; $0DA579 |
  STA $0FC1,y                               ; $0DA57A |
  JSL $03AD74                               ; $0DA57D |
  BCS CODE_0DA58F                           ; $0DA581 |
  LDY $78,x                                 ; $0DA583 |
  LDA #$0000                                ; $0DA585 |
  STA $0FC1,y                               ; $0DA588 |
  JML $03A31E                               ; $0DA58B |

CODE_0DA58F:
  LDY $78,x                                 ; $0DA58F |
  LDA $7722,x                               ; $0DA591 |
  INC A                                     ; $0DA594 |
  STA $0FC5,y                               ; $0DA595 |
  LDA #$FFFF                                ; $0DA598 |
  STA $7722,x                               ; $0DA59B |
  JSR CODE_0DA712                           ; $0DA59E |

CODE_0DA5A1:
  LDY $78,x                                 ; $0DA5A1 |
  LDA $0FCD,y                               ; $0DA5A3 |
  INC A                                     ; $0DA5A6 |
  STA $0FCD,y                               ; $0DA5A7 |
  STZ $7400,x                               ; $0DA5AA |
  LDA #$0019                                ; $0DA5AD |
  STA $7BB6,x                               ; $0DA5B0 |
  LDA #$0007                                ; $0DA5B3 |
  STA $7BB8,x                               ; $0DA5B6 |
  RTL                                       ; $0DA5B9 |

; both green and red platforms
main_spiked_platform:
  JSR CODE_0DA5D7                           ; $0DA5BA |
  JSL $03AF23                               ; $0DA5BD |
  JSR CODE_0DA69C                           ; $0DA5C1 |
  JSR CODE_0DA7E6                           ; $0DA5C4 |
  JSR CODE_0DA8B8                           ; $0DA5C7 |
  JSR CODE_0DA6DC                           ; $0DA5CA |
  LDA $7040,x                               ; $0DA5CD |
  AND #$FFF3                                ; $0DA5D0 |
  STA $7040,x                               ; $0DA5D3 |
  RTL                                       ; $0DA5D6 |

CODE_0DA5D7:
  LDA $7362,x                               ; $0DA5D7 |
  BPL CODE_0DA5DD                           ; $0DA5DA |

CODE_0DA5DC:
  RTS                                       ; $0DA5DC |

CODE_0DA5DD:
  LDY $78,x                                 ; $0DA5DD |
  LDA $0FC1,y                               ; $0DA5DF |
  DEC A                                     ; $0DA5E2 |
  STA $7722,x                               ; $0DA5E3 |
  JSL $03AA52                               ; $0DA5E6 |
  LDY $78,x                                 ; $0DA5EA |
  LDA $0FC5,y                               ; $0DA5EC |
  DEC A                                     ; $0DA5EF |
  STA $7722,x                               ; $0DA5F0 |
  REP #$10                                  ; $0DA5F3 |
  LDA $7362,x                               ; $0DA5F5 |
  CLC                                       ; $0DA5F8 |
  ADC #$0020                                ; $0DA5F9 |
  TAY                                       ; $0DA5FC |
  JSL $03AA60                               ; $0DA5FD |
  LDA #$FFFF                                ; $0DA601 |
  STA $7722,x                               ; $0DA604 |
  LDA $61B0                                 ; $0DA607 |
  ORA $0B55                                 ; $0DA60A |
  ORA $0398                                 ; $0DA60D |
  BNE CODE_0DA61C                           ; $0DA610 |
  LDY $78,x                                 ; $0DA612 |
  LDA $0FBD,y                               ; $0DA614 |
  CMP $7974                                 ; $0DA617 |
  BNE CODE_0DA5DC                           ; $0DA61A |

CODE_0DA61C:
  LDY $78,x                                 ; $0DA61C |
  LDA $0FD9,y                               ; $0DA61E |
  STA $00                                   ; $0DA621 |
  LDA $0FDD,y                               ; $0DA623 |
  STA $02                                   ; $0DA626 |
  LDA $0FE1,y                               ; $0DA628 |
  STA $04                                   ; $0DA62B |
  LDA $0FE5,y                               ; $0DA62D |
  STA $06                                   ; $0DA630 |
  REP #$10                                  ; $0DA632 |
  LDY $7362,x                               ; $0DA634 |
  BMI CODE_0DA699                           ; $0DA637 |
  LDA $6000,y                               ; $0DA639 |
  SEC                                       ; $0DA63C |
  SBC $00                                   ; $0DA63D |
  STA $6000,y                               ; $0DA63F |
  STA $6010,y                               ; $0DA642 |
  LDA $6008,y                               ; $0DA645 |
  SEC                                       ; $0DA648 |
  SBC $00                                   ; $0DA649 |
  STA $6008,y                               ; $0DA64B |
  STA $6018,y                               ; $0DA64E |
  LDA $6002,y                               ; $0DA651 |
  SEC                                       ; $0DA654 |
  SBC $02                                   ; $0DA655 |
  STA $6002,y                               ; $0DA657 |
  STA $600A,y                               ; $0DA65A |
  LDA $6012,y                               ; $0DA65D |
  SEC                                       ; $0DA660 |
  SBC $02                                   ; $0DA661 |
  STA $6012,y                               ; $0DA663 |
  STA $601A,y                               ; $0DA666 |
  LDA $6020,y                               ; $0DA669 |
  CLC                                       ; $0DA66C |
  ADC $04                                   ; $0DA66D |
  STA $6020,y                               ; $0DA66F |
  STA $6030,y                               ; $0DA672 |
  LDA $6028,y                               ; $0DA675 |
  CLC                                       ; $0DA678 |
  ADC $04                                   ; $0DA679 |
  STA $6028,y                               ; $0DA67B |
  STA $6038,y                               ; $0DA67E |
  LDA $6022,y                               ; $0DA681 |
  CLC                                       ; $0DA684 |
  ADC $06                                   ; $0DA685 |
  STA $6022,y                               ; $0DA687 |
  STA $602A,y                               ; $0DA68A |
  LDA $6032,y                               ; $0DA68D |
  CLC                                       ; $0DA690 |
  ADC $06                                   ; $0DA691 |
  STA $6032,y                               ; $0DA693 |
  STA $603A,y                               ; $0DA696 |

CODE_0DA699:
  SEP #$10                                  ; $0DA699 |

CODE_0DA69B:
  RTS                                       ; $0DA69B |

CODE_0DA69C:
  JSL $03A2C7                               ; $0DA69C |
  BCC CODE_0DA69B                           ; $0DA6A0 |
  LDY $78,x                                 ; $0DA6A2 |
  LDA $0FCD,y                               ; $0DA6A4 |
  DEC A                                     ; $0DA6A7 |
  STA $0FCD,y                               ; $0DA6A8 |
  BNE CODE_0DA6D1                           ; $0DA6AB |
  LDA $0FC1,y                               ; $0DA6AD |
  DEC A                                     ; $0DA6B0 |
  STA $7722,x                               ; $0DA6B1 |
  LDA #$0000                                ; $0DA6B4 |
  STA $0FC1,y                               ; $0DA6B7 |
  JSL $03AEFD                               ; $0DA6BA |
  LDY $78,x                                 ; $0DA6BE |
  LDA $0FC5,y                               ; $0DA6C0 |
  DEC A                                     ; $0DA6C3 |
  STA $7722,x                               ; $0DA6C4 |
  LDA #$0000                                ; $0DA6C7 |
  STA $0FC5,y                               ; $0DA6CA |
  JSL $03AEFD                               ; $0DA6CD |

CODE_0DA6D1:
  LDA #$FFFF                                ; $0DA6D1 |
  STA $7722,x                               ; $0DA6D4 |
  PLA                                       ; $0DA6D7 |
  JML $03A31E                               ; $0DA6D8 |

CODE_0DA6DC:
  LDY $78,x                                 ; $0DA6DC |
  LDA $7974                                 ; $0DA6DE |
  CMP $0FBD,y                               ; $0DA6E1 |
  BEQ CODE_0DA711                           ; $0DA6E4 |
  STA $0FBD,y                               ; $0DA6E6 |
  LDA $0FD1,y                               ; $0DA6E9 |
  CMP $0FD5,y                               ; $0DA6EC |
  BEQ CODE_0DA70E                           ; $0DA6EF |
  SEC                                       ; $0DA6F1 |
  SBC #$0020                                ; $0DA6F2 |
  STA $0FD1,y                               ; $0DA6F5 |
  SEC                                       ; $0DA6F8 |
  SBC $0FD5,y                               ; $0DA6F9 |
  CLC                                       ; $0DA6FC |
  ADC #$000F                                ; $0DA6FD |
  CMP #$001E                                ; $0DA700 |
  BCS CODE_0DA70B                           ; $0DA703 |
  LDA $0FD5,y                               ; $0DA705 |
  STA $0FD1,y                               ; $0DA708 |

CODE_0DA70B:
  JSR CODE_0DA712                           ; $0DA70B |

CODE_0DA70E:
  JSR CODE_0DA61C                           ; $0DA70E |

CODE_0DA711:
  RTS                                       ; $0DA711 |

CODE_0DA712:
  LDA #$40C0                                ; $0DA712 |
  STA $3018                                 ; $0DA715 |
  LDA #$0055                                ; $0DA718 |
  STA $301A                                 ; $0DA71B |
  LDY $78,x                                 ; $0DA71E |
  LDA $0FD1,y                               ; $0DA720 |
  AND #$01FE                                ; $0DA723 |
  LSR A                                     ; $0DA726 |
  STA $00                                   ; $0DA727 |
  STA $300A                                 ; $0DA729 |
  LDA #$0100                                ; $0DA72C |
  STA $300C                                 ; $0DA72F |
  LDA $0FC1,y                               ; $0DA732 |
  TAX                                       ; $0DA735 |
  DEX                                       ; $0DA736 |
  LDA $03A9CE,x                             ; $0DA737 |
  STA $3006                                 ; $0DA73B |
  LDA $03A9EE,x                             ; $0DA73E |
  STA $3004                                 ; $0DA742 |
  LDX #$08                                  ; $0DA745 |
  LDA #$8205                                ; $0DA747 |
  JSL $7EDE44                               ; $0DA74A | GSU init
  LDX $12                                   ; $0DA74E |
  LDA #$40C0                                ; $0DA750 |
  STA $3018                                 ; $0DA753 |
  LDA #$0055                                ; $0DA756 |
  STA $301A                                 ; $0DA759 |
  LDA $00                                   ; $0DA75C |
  EOR #$FFFF                                ; $0DA75E |
  INC A                                     ; $0DA761 |
  AND #$00FF                                ; $0DA762 |
  STA $300A                                 ; $0DA765 |
  LDA #$0100                                ; $0DA768 |
  STA $300C                                 ; $0DA76B |
  LDY $78,x                                 ; $0DA76E |
  LDA $0FC5,y                               ; $0DA770 |
  TAX                                       ; $0DA773 |
  DEX                                       ; $0DA774 |
  LDA $03A9CE,x                             ; $0DA775 |
  STA $3006                                 ; $0DA779 |
  LDA $03A9EE,x                             ; $0DA77C |
  STA $3004                                 ; $0DA780 |
  LDX #$08                                  ; $0DA783 |
  LDA #$8205                                ; $0DA785 |
  JSL $7EDE44                               ; $0DA788 | GSU init
  LDX $12                                   ; $0DA78C |
  INC $0CF9                                 ; $0DA78E |
  LDA #$000D                                ; $0DA791 |
  STA $300C                                 ; $0DA794 |
  LDY $78,x                                 ; $0DA797 |
  LDA $0FD1,y                               ; $0DA799 |
  AND #$01FE                                ; $0DA79C |
  STA $3002                                 ; $0DA79F |
  LDX #$0B                                  ; $0DA7A2 |
  LDA #$8595                                ; $0DA7A4 |
  JSL $7EDE44                               ; $0DA7A7 | GSU init
  LDX $12                                   ; $0DA7AB |
  LDY $78,x                                 ; $0DA7AD |
  LDA $3000                                 ; $0DA7AF |
  STA $0FD9,y                               ; $0DA7B2 |
  LDA $3002                                 ; $0DA7B5 |
  STA $0FDD,y                               ; $0DA7B8 |
  LDA #$000C                                ; $0DA7BB |
  STA $300C                                 ; $0DA7BE |
  LDY $78,x                                 ; $0DA7C1 |
  LDA $0FD1,y                               ; $0DA7C3 |
  AND #$01FE                                ; $0DA7C6 |
  STA $3002                                 ; $0DA7C9 |
  LDX #$0B                                  ; $0DA7CC |
  LDA #$8595                                ; $0DA7CE |
  JSL $7EDE44                               ; $0DA7D1 | GSU init
  LDX $12                                   ; $0DA7D5 |
  LDY $78,x                                 ; $0DA7D7 |
  LDA $3000                                 ; $0DA7D9 |
  STA $0FE1,y                               ; $0DA7DC |
  LDA $3002                                 ; $0DA7DF |
  STA $0FE5,y                               ; $0DA7E2 |
  RTS                                       ; $0DA7E5 |

CODE_0DA7E6:
  LDY $78,x                                 ; $0DA7E6 |
  LDA $0FD1,y                               ; $0DA7E8 |
  CMP $0FD5,y                               ; $0DA7EB |
  BNE CODE_0DA807                           ; $0DA7EE |
  JSL $03D127                               ; $0DA7F0 |
  BCC CODE_0DA806                           ; $0DA7F4 |
  DEC $0E                                   ; $0DA7F6 |
  LDY $78,x                                 ; $0DA7F8 |
  LDA $0FC9,y                               ; $0DA7FA |
  DEC A                                     ; $0DA7FD |
  EOR $0E                                   ; $0DA7FE |
  BPL CODE_0DA806                           ; $0DA800 |
  JSL $03A858                               ; $0DA802 |

CODE_0DA806:
  RTS                                       ; $0DA806 |

CODE_0DA807:
  LDA $7C16,x                               ; $0DA807 |
  CLC                                       ; $0DA80A |
  ADC #$0021                                ; $0DA80B |
  CMP #$0042                                ; $0DA80E |
  BCS CODE_0DA806                           ; $0DA811 |
  LDA $7C18,x                               ; $0DA813 |
  CLC                                       ; $0DA816 |
  ADC #$0013                                ; $0DA817 |
  CMP #$0026                                ; $0DA81A |
  BCS CODE_0DA806                           ; $0DA81D |
  LDA $7C16,x                               ; $0DA81F |
  STA $3002                                 ; $0DA822 |
  LDA $7C18,x                               ; $0DA825 |
  STA $3004                                 ; $0DA828 |
  LDX #$0B                                  ; $0DA82B |
  LDA #$BCF8                                ; $0DA82D |
  JSL $7EDE44                               ; $0DA830 | GSU init
  LDX $12                                   ; $0DA834 |
  LDA $3000                                 ; $0DA836 |
  STA $00                                   ; $0DA839 |
  CLC                                       ; $0DA83B |
  ADC #$0080                                ; $0DA83C |
  AND #$01FE                                ; $0DA83F |
  STA $3002                                 ; $0DA842 |
  LDA #$0400                                ; $0DA845 |
  STA $300C                                 ; $0DA848 |
  LDX #$0B                                  ; $0DA84B |
  LDA #$8595                                ; $0DA84D |
  JSL $7EDE44                               ; $0DA850 | GSU init
  LDX $12                                   ; $0DA854 |
  LDA $60FC                                 ; $0DA856 |
  AND #$01E0                                ; $0DA859 |
  BEQ CODE_0DA867                           ; $0DA85C |
  AND #$0180                                ; $0DA85E |
  DEC A                                     ; $0DA861 |
  EOR $3000                                 ; $0DA862 |
  BPL CODE_0DA870                           ; $0DA865 |

CODE_0DA867:
  LDA $3000                                 ; $0DA867 |
  STA $60A8                                 ; $0DA86A |
  STA $60B4                                 ; $0DA86D |

CODE_0DA870:
  LDA $3002                                 ; $0DA870 |
  EOR #$FFFF                                ; $0DA873 |
  INC A                                     ; $0DA876 |
  STA $00                                   ; $0DA877 |
  LDA $60FC                                 ; $0DA879 |
  AND #$001F                                ; $0DA87C |
  BEQ CODE_0DA889                           ; $0DA87F |
  AND #$0018                                ; $0DA881 |
  DEC A                                     ; $0DA884 |
  EOR $00                                   ; $0DA885 |
  BMI CODE_0DA89F                           ; $0DA887 |

CODE_0DA889:
  LDA $00                                   ; $0DA889 |
  BPL CODE_0DA89C                           ; $0DA88B |
  PHA                                       ; $0DA88D |
  LDA #$0006                                ; $0DA88E |
  STA $60C0                                 ; $0DA891 |
  LDA #$8001                                ; $0DA894 |
  STA $60D2                                 ; $0DA897 |
  PLA                                       ; $0DA89A |
  ASL A                                     ; $0DA89B |

CODE_0DA89C:
  STA $60AA                                 ; $0DA89C |

CODE_0DA89F:
  LDY $78,x                                 ; $0DA89F |
  LDA $0FD1,y                               ; $0DA8A1 |
  AND #$01FE                                ; $0DA8A4 |
  SEC                                       ; $0DA8A7 |
  SBC $00                                   ; $0DA8A8 |
  CLC                                       ; $0DA8AA |
  ADC #$0100                                ; $0DA8AB |
  CMP #$0200                                ; $0DA8AE |
  BCC CODE_0DA8B7                           ; $0DA8B1 |
  JSL $03A858                               ; $0DA8B3 |

CODE_0DA8B7:
  RTS                                       ; $0DA8B7 |

CODE_0DA8B8:
  LDY $78,x                                 ; $0DA8B8 |
  LDA $0FD1,y                               ; $0DA8BA |
  CMP $0FD5,y                               ; $0DA8BD |
  BNE CODE_0DA8C6                           ; $0DA8C0 |
  JSL $03D291                               ; $0DA8C2 |

CODE_0DA8C6:
  RTS                                       ; $0DA8C6 |

init_two_spiked_platforms_with_switch:
  JSL $03AE60                               ; $0DA8C7 |
  LDA $7722,x                               ; $0DA8CB |
  STA $7902,x                               ; $0DA8CE |
  JSL $03AD74                               ; $0DA8D1 |
  BCS CODE_0DA8E1                           ; $0DA8D5 |
  LDA $7902,x                               ; $0DA8D7 |
  STA $7722,x                               ; $0DA8DA |
  JML $03A31E                               ; $0DA8DD |

CODE_0DA8E1:
  JSR CODE_0DAB6A                           ; $0DA8E1 |
  STZ $7900,x                               ; $0DA8E4 |
  STZ $7400,x                               ; $0DA8E7 |
  LDA #$0008                                ; $0DA8EA |
  STA $7BB8,x                               ; $0DA8ED |
  RTL                                       ; $0DA8F0 |

main_two_spiked_platforms_with_switch:
  JSR CODE_0DA911                           ; $0DA8F1 |
  JSL $03AF23                               ; $0DA8F4 |
  JSR CODE_0DAC2D                           ; $0DA8F8 |
  JSR CODE_0DAA52                           ; $0DA8FB |
  JSR CODE_0DAC43                           ; $0DA8FE |
  JSR CODE_0DAF16                           ; $0DA901 |
  JSR CODE_0DAAF5                           ; $0DA904 |
  LDA $7040,x                               ; $0DA907 |
  AND #$FFF3                                ; $0DA90A |
  STA $7040,x                               ; $0DA90D |
  RTL                                       ; $0DA910 |

CODE_0DA911:
  LDA $7362,x                               ; $0DA911 |
  BPL CODE_0DA917                           ; $0DA914 |

CODE_0DA916:
  RTS                                       ; $0DA916 |

CODE_0DA917:
  LDA $61B0                                 ; $0DA917 |
  ORA $0B55                                 ; $0DA91A |
  ORA $0398                                 ; $0DA91D |
  BEQ CODE_0DA916                           ; $0DA920 |

CODE_0DA922:
  JSL $03AA52                               ; $0DA922 |
  REP #$10                                  ; $0DA926 |
  LDA $7362,x                               ; $0DA928 |
  CLC                                       ; $0DA92B |
  ADC #$0040                                ; $0DA92C |
  TAY                                       ; $0DA92F |
  JSL $03AA60                               ; $0DA930 |
  LDA $7722,x                               ; $0DA934 |
  PHA                                       ; $0DA937 |
  LDA $7902,x                               ; $0DA938 |
  STA $7722,x                               ; $0DA93B |
  REP #$10                                  ; $0DA93E |
  LDA $7362,x                               ; $0DA940 |
  CLC                                       ; $0DA943 |
  ADC #$0020                                ; $0DA944 |
  TAY                                       ; $0DA947 |
  JSL $03AA60                               ; $0DA948 |
  REP #$10                                  ; $0DA94C |
  LDA $7362,x                               ; $0DA94E |
  CLC                                       ; $0DA951 |
  ADC #$0060                                ; $0DA952 |
  TAY                                       ; $0DA955 |
  JSL $03AA60                               ; $0DA956 |
  PLA                                       ; $0DA95A |
  STA $7722,x                               ; $0DA95B |
  LDA $18,x                                 ; $0DA95E |
  STA $00                                   ; $0DA960 |
  LDA $76,x                                 ; $0DA962 |
  STA $02                                   ; $0DA964 |
  LDA $78,x                                 ; $0DA966 |
  STA $04                                   ; $0DA968 |
  LDA $7A36,x                               ; $0DA96A |
  STA $06                                   ; $0DA96D |
  REP #$10                                  ; $0DA96F |
  LDY $7362,x                               ; $0DA971 |
  BMI CODE_0DA916                           ; $0DA974 |
  LDA $6000,y                               ; $0DA976 |
  SEC                                       ; $0DA979 |
  SBC $00                                   ; $0DA97A |
  STA $6000,y                               ; $0DA97C |
  STA $6010,y                               ; $0DA97F |
  LDA $6008,y                               ; $0DA982 |
  SEC                                       ; $0DA985 |
  SBC $00                                   ; $0DA986 |
  STA $6008,y                               ; $0DA988 |
  STA $6018,y                               ; $0DA98B |
  LDA $6002,y                               ; $0DA98E |
  SEC                                       ; $0DA991 |
  SBC $02                                   ; $0DA992 |
  STA $6002,y                               ; $0DA994 |
  STA $600A,y                               ; $0DA997 |
  LDA $6012,y                               ; $0DA99A |
  SEC                                       ; $0DA99D |
  SBC $02                                   ; $0DA99E |
  STA $6012,y                               ; $0DA9A0 |
  STA $601A,y                               ; $0DA9A3 |
  LDA $6020,y                               ; $0DA9A6 |
  SEC                                       ; $0DA9A9 |
  SBC $04                                   ; $0DA9AA |
  STA $6020,y                               ; $0DA9AC |
  STA $6030,y                               ; $0DA9AF |
  LDA $6028,y                               ; $0DA9B2 |
  SEC                                       ; $0DA9B5 |
  SBC $04                                   ; $0DA9B6 |
  STA $6028,y                               ; $0DA9B8 |
  STA $6038,y                               ; $0DA9BB |
  LDA $6022,y                               ; $0DA9BE |
  SEC                                       ; $0DA9C1 |
  SBC $06                                   ; $0DA9C2 |
  STA $6022,y                               ; $0DA9C4 |
  STA $602A,y                               ; $0DA9C7 |
  LDA $6032,y                               ; $0DA9CA |
  SEC                                       ; $0DA9CD |
  SBC $06                                   ; $0DA9CE |
  STA $6032,y                               ; $0DA9D0 |
  STA $603A,y                               ; $0DA9D3 |
  LDA $6040,y                               ; $0DA9D6 |
  CLC                                       ; $0DA9D9 |
  ADC $04                                   ; $0DA9DA |
  STA $6040,y                               ; $0DA9DC |
  STA $6050,y                               ; $0DA9DF |
  LDA $6048,y                               ; $0DA9E2 |
  CLC                                       ; $0DA9E5 |
  ADC $04                                   ; $0DA9E6 |
  STA $6048,y                               ; $0DA9E8 |
  STA $6058,y                               ; $0DA9EB |
  LDA $6042,y                               ; $0DA9EE |
  CLC                                       ; $0DA9F1 |
  ADC $06                                   ; $0DA9F2 |
  STA $6042,y                               ; $0DA9F4 |
  STA $604A,y                               ; $0DA9F7 |
  LDA $6052,y                               ; $0DA9FA |
  CLC                                       ; $0DA9FD |
  ADC $06                                   ; $0DA9FE |
  STA $6052,y                               ; $0DAA00 |
  STA $605A,y                               ; $0DAA03 |
  LDA $6060,y                               ; $0DAA06 |
  CLC                                       ; $0DAA09 |
  ADC $00                                   ; $0DAA0A |
  STA $6060,y                               ; $0DAA0C |
  STA $6070,y                               ; $0DAA0F |
  LDA $6068,y                               ; $0DAA12 |
  CLC                                       ; $0DAA15 |
  ADC $00                                   ; $0DAA16 |
  STA $6068,y                               ; $0DAA18 |
  STA $6078,y                               ; $0DAA1B |
  LDA $6062,y                               ; $0DAA1E |
  CLC                                       ; $0DAA21 |
  ADC $02                                   ; $0DAA22 |
  STA $6062,y                               ; $0DAA24 |
  STA $606A,y                               ; $0DAA27 |
  LDA $6072,y                               ; $0DAA2A |
  CLC                                       ; $0DAA2D |
  ADC $02                                   ; $0DAA2E |
  STA $6072,y                               ; $0DAA30 |
  STA $607A,y                               ; $0DAA33 |
  LDA $7A98,x                               ; $0DAA36 |
  BNE CODE_0DAA43                           ; $0DAA39 |
  LDA $7A38,x                               ; $0DAA3B |
  CMP $7900,x                               ; $0DAA3E |
  BEQ CODE_0DAA4F                           ; $0DAA41 |

CODE_0DAA43:
  LDA $6084,y                               ; $0DAA43 |
  AND #$F1FF                                ; $0DAA46 |
  ORA #$F800                                ; $0DAA49 |
  STA $6084,y                               ; $0DAA4C |

CODE_0DAA4F:
  SEP #$10                                  ; $0DAA4F |
  RTS                                       ; $0DAA51 |

CODE_0DAA52:
  LDA $7A38,x                               ; $0DAA52 |
  CMP $7900,x                               ; $0DAA55 |
  BNE CODE_0DAA5D                           ; $0DAA58 |
  JSR CODE_0DAA6B                           ; $0DAA5A |

CODE_0DAA5D:
  JSL $03D127                               ; $0DAA5D |
  BCS CODE_0DAA66                           ; $0DAA61 |
  STZ $7D36,x                               ; $0DAA63 |

CODE_0DAA66:
  JSL $03D291                               ; $0DAA66 |
  RTS                                       ; $0DAA6A |

CODE_0DAA6B:
  LDY $60AB                                 ; $0DAA6B |
  BPL CODE_0DAA96                           ; $0DAA6E |
  LDY $60C0                                 ; $0DAA70 |
  BEQ CODE_0DAA96                           ; $0DAA73 |
  LDA $7C16,x                               ; $0DAA75 |
  CLC                                       ; $0DAA78 |
  ADC #$0010                                ; $0DAA79 |
  CMP #$0020                                ; $0DAA7C |
  BCS CODE_0DAA96                           ; $0DAA7F |
  LDA $7C18,x                               ; $0DAA81 |
  CMP #$FFE8                                ; $0DAA84 |
  BMI CODE_0DAA96                           ; $0DAA87 |
  CMP #$FFF0                                ; $0DAA89 |
  BPL CODE_0DAA96                           ; $0DAA8C |
  STZ $60AA                                 ; $0DAA8E |
  STZ $60D2                                 ; $0DAA91 |
  BRA CODE_0DAAAE                           ; $0DAA94 |

CODE_0DAA96:
  LDY $7D36,x                               ; $0DAA96 |
  DEY                                       ; $0DAA99 |
  BMI CODE_0DAAF4                           ; $0DAA9A |
  LDA $6F00,y                               ; $0DAA9C |
  CMP #$0010                                ; $0DAA9F |
  BNE CODE_0DAAF4                           ; $0DAAA2 |
  LDA $7D38,y                               ; $0DAAA4 |
  BEQ CODE_0DAAF4                           ; $0DAAA7 |
  TYX                                       ; $0DAAA9 |
  JSL $03B25B                               ; $0DAAAA |

CODE_0DAAAE:
  LDA #$0032                                ; $0DAAAE |\ play sound #$0032
  JSL $0085D2                               ; $0DAAB1 |/
  LDA $7360,x                               ; $0DAAB5 |
  CMP #$0162                                ; $0DAAB8 |
  BEQ CODE_0DAAE4                           ; $0DAABB |
  LDY $78,x                                 ; $0DAABD |
  LDA $0FC9,y                               ; $0DAABF |
  EOR #$0002                                ; $0DAAC2 |
  STA $0FC9,y                               ; $0DAAC5 |
  LDA $0FD5,y                               ; $0DAAC8 |
  SEC                                       ; $0DAACB |
  SBC #$0500                                ; $0DAACC |
  STA $0FD5,y                               ; $0DAACF |
  LDA $7222,x                               ; $0DAAD2 |
  BMI CODE_0DAAE3                           ; $0DAAD5 |
  LDA #$FD00                                ; $0DAAD7 |
  STA $7222,x                               ; $0DAADA |
  LDA #$0040                                ; $0DAADD |
  STA $7542,x                               ; $0DAAE0 |

CODE_0DAAE3:
  RTS                                       ; $0DAAE3 |

CODE_0DAAE4:
  LDA $7900,x                               ; $0DAAE4 |
  SEC                                       ; $0DAAE7 |
  SBC #$0100                                ; $0DAAE8 |
  STA $7900,x                               ; $0DAAEB |
  LDA #$0020                                ; $0DAAEE |
  STA $7A98,x                               ; $0DAAF1 |

CODE_0DAAF4:
  RTS                                       ; $0DAAF4 |

CODE_0DAAF5:
  LDA $7A98,x                               ; $0DAAF5 |
  BEQ CODE_0DAB0D                           ; $0DAAF8 |
  DEC A                                     ; $0DAAFA |
  BNE CODE_0DAB57                           ; $0DAAFB |
  LDA $16,x                                 ; $0DAAFD |
  EOR #$0002                                ; $0DAAFF |
  STA $16,x                                 ; $0DAB02 |
  LDA #$0040                                ; $0DAB04 |\ play sound #$0040
  JSL $0085D2                               ; $0DAB07 |/
  BRA CODE_0DAB57                           ; $0DAB0B |

CODE_0DAB0D:
  LDA $7A38,x                               ; $0DAB0D |
  CMP $7900,x                               ; $0DAB10 |
  BEQ CODE_0DAB57                           ; $0DAB13 |
  AND #$00FE                                ; $0DAB15 |
  SEC                                       ; $0DAB18 |
  SBC #$007E                                ; $0DAB19 |
  CMP #$0004                                ; $0DAB1C |
  BCS CODE_0DAB30                           ; $0DAB1F |
  LDA $7A96,x                               ; $0DAB21 |
  BEQ CODE_0DAB5B                           ; $0DAB24 |
  DEC A                                     ; $0DAB26 |
  BNE CODE_0DAB57                           ; $0DAB27 |
  LDA #$0040                                ; $0DAB29 |\ play sound #$0040
  JSL $0085D2                               ; $0DAB2C |/

CODE_0DAB30:
  LDA $7A38,x                               ; $0DAB30 |
  SEC                                       ; $0DAB33 |
  SBC #$0004                                ; $0DAB34 |
  STA $7A38,x                               ; $0DAB37 |
  SEC                                       ; $0DAB3A |
  SBC $7900,x                               ; $0DAB3B |
  CLC                                       ; $0DAB3E |
  ADC #$0002                                ; $0DAB3F |
  CMP #$0004                                ; $0DAB42 |
  BCS CODE_0DAB54                           ; $0DAB45 |
  LDA $7900,x                               ; $0DAB47 |
  STA $7A38,x                               ; $0DAB4A |
  LDA #$0041                                ; $0DAB4D |\ play sound #$0041
  JSL $0085D2                               ; $0DAB50 |/

CODE_0DAB54:
  JSR CODE_0DAB6A                           ; $0DAB54 |

CODE_0DAB57:
  JSR CODE_0DA922                           ; $0DAB57 |
  RTS                                       ; $0DAB5A |

CODE_0DAB5B:
  LDA #$0040                                ; $0DAB5B |
  STA $7A96,x                               ; $0DAB5E |
  LDA #$0041                                ; $0DAB61 |\ play sound #$0041
  JSL $0085D2                               ; $0DAB64 |/
  BRA CODE_0DAB57                           ; $0DAB68 |

CODE_0DAB6A:
  LDA #$40C0                                ; $0DAB6A |
  STA $3018                                 ; $0DAB6D |
  LDA #$0055                                ; $0DAB70 |
  STA $301A                                 ; $0DAB73 |
  LDA $7A38,x                               ; $0DAB76 |
  AND #$01FE                                ; $0DAB79 |
  LSR A                                     ; $0DAB7C |
  STA $300A                                 ; $0DAB7D |
  LDA #$0100                                ; $0DAB80 |
  STA $300C                                 ; $0DAB83 |
  LDY $7722,x                               ; $0DAB86 |
  TYX                                       ; $0DAB89 |
  LDA $03A9CE,x                             ; $0DAB8A |
  STA $3006                                 ; $0DAB8E |
  LDA $03A9EE,x                             ; $0DAB91 |
  STA $3004                                 ; $0DAB95 |
  LDX #$08                                  ; $0DAB98 |
  LDA #$8205                                ; $0DAB9A |
  JSL $7EDE44                               ; $0DAB9D | GSU init
  LDX $12                                   ; $0DABA1 |
  LDA #$40C0                                ; $0DABA3 |
  STA $3018                                 ; $0DABA6 |
  LDA #$0055                                ; $0DABA9 |
  STA $301A                                 ; $0DABAC |
  LDA $7A38,x                               ; $0DABAF |
  EOR #$FFFF                                ; $0DABB2 |
  INC A                                     ; $0DABB5 |
  AND #$01FE                                ; $0DABB6 |
  LSR A                                     ; $0DABB9 |
  STA $300A                                 ; $0DABBA |
  LDA #$0100                                ; $0DABBD |
  STA $300C                                 ; $0DABC0 |
  LDY $7902,x                               ; $0DABC3 |
  TYX                                       ; $0DABC6 |
  LDA $03A9CE,x                             ; $0DABC7 |
  STA $3006                                 ; $0DABCB |
  LDA $03A9EE,x                             ; $0DABCE |
  STA $3004                                 ; $0DABD2 |
  LDX #$08                                  ; $0DABD5 |
  LDA #$8205                                ; $0DABD7 |
  JSL $7EDE44                               ; $0DABDA | GSU init
  LDX $12                                   ; $0DABDE |
  INC $0CF9                                 ; $0DABE0 |
  LDA #$002E                                ; $0DABE3 |
  STA $300C                                 ; $0DABE6 |
  LDA $7A38,x                               ; $0DABE9 |
  AND #$01FE                                ; $0DABEC |
  STA $3002                                 ; $0DABEF |
  LDX #$0B                                  ; $0DABF2 |
  LDA #$8595                                ; $0DABF4 |
  JSL $7EDE44                               ; $0DABF7 | GSU init
  LDX $12                                   ; $0DABFB |
  LDA $3000                                 ; $0DABFD |
  STA $18,x                                 ; $0DAC00 |
  LDA $3002                                 ; $0DAC02 |
  STA $76,x                                 ; $0DAC05 |
  LDA #$0016                                ; $0DAC07 |
  STA $300C                                 ; $0DAC0A |
  LDA $7A38,x                               ; $0DAC0D |
  AND #$01FE                                ; $0DAC10 |
  STA $3002                                 ; $0DAC13 |
  LDX #$0B                                  ; $0DAC16 |
  LDA #$8595                                ; $0DAC18 |
  JSL $7EDE44                               ; $0DAC1B | GSU init
  LDX $12                                   ; $0DAC1F |
  LDA $3000                                 ; $0DAC21 |
  STA $78,x                                 ; $0DAC24 |
  LDA $3002                                 ; $0DAC26 |
  STA $7A36,x                               ; $0DAC29 |

CODE_0DAC2C:
  RTS                                       ; $0DAC2C |

CODE_0DAC2D:
  JSL $03A2DE                               ; $0DAC2D |
  BCC CODE_0DAC2C                           ; $0DAC31 |
  JSL $03AEFD                               ; $0DAC33 |
  LDA $7902,x                               ; $0DAC37 |
  STA $7722,x                               ; $0DAC3A |
  JSL $03AEFD                               ; $0DAC3D |
  PLA                                       ; $0DAC41 |
  RTL                                       ; $0DAC42 |

CODE_0DAC43:
  LDA $7A98,x                               ; $0DAC43 |
  BNE CODE_0DAC71                           ; $0DAC46 |
  LDA $7A96,x                               ; $0DAC48 |
  BEQ CODE_0DAC69                           ; $0DAC4B |
  LDA #$0007                                ; $0DAC4D |
  STA $0C                                   ; $0DAC50 |
  LDA #$0038                                ; $0DAC52 |
  STA $0E                                   ; $0DAC55 |
  JSR CODE_0DAC9C                           ; $0DAC57 |
  BCS CODE_0DAC68                           ; $0DAC5A |
  LDA $16,x                                 ; $0DAC5C |
  DEC A                                     ; $0DAC5E |
  EOR $7C16,x                               ; $0DAC5F |
  BPL CODE_0DAC68                           ; $0DAC62 |
  JSL $03A858                               ; $0DAC64 |

CODE_0DAC68:
  RTS                                       ; $0DAC68 |

CODE_0DAC69:
  LDA $7A38,x                               ; $0DAC69 |
  CMP $7900,x                               ; $0DAC6C |
  BNE CODE_0DAC98                           ; $0DAC6F |

CODE_0DAC71:
  LDY $7D36,x                               ; $0DAC71 |
  BMI CODE_0DAC97                           ; $0DAC74 |
  LDA #$0038                                ; $0DAC76 |
  STA $0C                                   ; $0DAC79 |
  LDA #$0007                                ; $0DAC7B |
  STA $0E                                   ; $0DAC7E |
  JSR CODE_0DAC9C                           ; $0DAC80 |
  BCC CODE_0DAC97                           ; $0DAC83 |
  DEC $0E                                   ; $0DAC85 |
  LDA $16,x                                 ; $0DAC87 |
  DEC A                                     ; $0DAC89 |
  EOR $0E                                   ; $0DAC8A |
  BPL CODE_0DAC97                           ; $0DAC8C |
  LDY $7D36,x                               ; $0DAC8E |
  BPL CODE_0DAC97                           ; $0DAC91 |
  JSL $03A858                               ; $0DAC93 |

CODE_0DAC97:
  RTS                                       ; $0DAC97 |

CODE_0DAC98:
  JSR CODE_0DACF2                           ; $0DAC98 |
  RTS                                       ; $0DAC9B |

CODE_0DAC9C:
  STZ $7D36,x                               ; $0DAC9C |
  LDA $6120                                 ; $0DAC9F |
  CLC                                       ; $0DACA2 |
  ADC $0C                                   ; $0DACA3 |
  ASL A                                     ; $0DACA5 |
  STA $00                                   ; $0DACA6 |
  LSR A                                     ; $0DACA8 |
  CLC                                       ; $0DACA9 |
  ADC $7C16,x                               ; $0DACAA |
  CMP $00                                   ; $0DACAD |
  BCS CODE_0DACF1                           ; $0DACAF |
  LDA $6122                                 ; $0DACB1 |
  CLC                                       ; $0DACB4 |
  ADC $0E                                   ; $0DACB5 |
  ASL A                                     ; $0DACB7 |
  STA $00                                   ; $0DACB8 |
  LSR A                                     ; $0DACBA |
  CLC                                       ; $0DACBB |
  ADC $7C18,x                               ; $0DACBC |
  CMP $00                                   ; $0DACBF |
  BCS CODE_0DACF1                           ; $0DACC1 |
  LDA #$00FF                                ; $0DACC3 |
  STA $7D36,x                               ; $0DACC6 |
  LDA $7BB6,x                               ; $0DACC9 |
  STA $3000                                 ; $0DACCC |
  LDA $7BB8,x                               ; $0DACCF |
  STA $3002                                 ; $0DACD2 |
  LDA $0C                                   ; $0DACD5 |
  STA $7BB6,x                               ; $0DACD7 |
  LDA $0E                                   ; $0DACDA |
  STA $7BB8,x                               ; $0DACDC |
  JSL $03D127                               ; $0DACDF |
  PHP                                       ; $0DACE3 |
  LDA $3000                                 ; $0DACE4 |
  STA $7BB6,x                               ; $0DACE7 |
  LDA $3002                                 ; $0DACEA |
  STA $7BB8,x                               ; $0DACED |
  PLP                                       ; $0DACF0 |

CODE_0DACF1:
  RTS                                       ; $0DACF1 |

CODE_0DACF2:
  LDA $7A38,x                               ; $0DACF2 |
  CLC                                       ; $0DACF5 |
  ADC #$0080                                ; $0DACF6 |
  AND #$00FE                                ; $0DACF9 |
  STA $3002                                 ; $0DACFC |
  LDA #$0006                                ; $0DACFF |
  STA $300C                                 ; $0DAD02 |
  LDX #$0B                                  ; $0DAD05 |
  LDA #$8595                                ; $0DAD07 |
  JSL $7EDE44                               ; $0DAD0A | GSU init
  LDX $12                                   ; $0DAD0E |
  LDA $3000                                 ; $0DAD10 |
  BMI CODE_0DAD19                           ; $0DAD13 |
  EOR #$FFFF                                ; $0DAD15 |
  INC A                                     ; $0DAD18 |

CODE_0DAD19:
  SEC                                       ; $0DAD19 |
  SBC $6120                                 ; $0DAD1A |
  STA $08                                   ; $0DAD1D |
  LDA $3002                                 ; $0DAD1F |
  SEC                                       ; $0DAD22 |
  SBC $6122                                 ; $0DAD23 |
  STA $0A                                   ; $0DAD26 |
  LDA $7C16,x                               ; $0DAD28 |
  STA $3002                                 ; $0DAD2B |
  LDA $7C18,x                               ; $0DAD2E |
  STA $3004                                 ; $0DAD31 |
  LDX #$0B                                  ; $0DAD34 |
  LDA #$BCF8                                ; $0DAD36 |
  JSL $7EDE44                               ; $0DAD39 | GSU init
  LDX $12                                   ; $0DAD3D |
  LDA $3000                                 ; $0DAD3F |
  CLC                                       ; $0DAD42 |
  ADC #$0100                                ; $0DAD43 |
  AND #$01FE                                ; $0DAD46 |
  STA $06                                   ; $0DAD49 |
  STZ $6000                                 ; $0DAD4B |
  STZ $6002                                 ; $0DAD4E |
  STZ $6004                                 ; $0DAD51 |
  LDA $7A38,x                               ; $0DAD54 |
  AND #$01FE                                ; $0DAD57 |
  STA $3002                                 ; $0DAD5A |
  STA $0C                                   ; $0DAD5D |
  AND #$00FE                                ; $0DAD5F |
  STA $02                                   ; $0DAD62 |
  ORA #$0100                                ; $0DAD64 |
  STA $04                                   ; $0DAD67 |
  LDA #$0040                                ; $0DAD69 |
  STA $300C                                 ; $0DAD6C |
  LDX #$0B                                  ; $0DAD6F |
  LDA #$8595                                ; $0DAD71 |
  JSL $7EDE44                               ; $0DAD74 | GSU init
  LDX $12                                   ; $0DAD78 |
  LDA $3002                                 ; $0DAD7A |
  STA $603E                                 ; $0DAD7D |
  LDA $3000                                 ; $0DAD80 |
  BPL CODE_0DAD89                           ; $0DAD83 |
  EOR #$FFFF                                ; $0DAD85 |
  INC A                                     ; $0DAD88 |

CODE_0DAD89:
  ASL A                                     ; $0DAD89 |
  STA $00                                   ; $0DAD8A |
  LSR A                                     ; $0DAD8C |
  CLC                                       ; $0DAD8D |
  ADC $7C16,x                               ; $0DAD8E |
  CMP $00                                   ; $0DAD91 |
  BCS CODE_0DADDC                           ; $0DAD93 |
  LDA $7C16,x                               ; $0DAD95 |
  STA $3000                                 ; $0DAD98 |
  REP #$10                                  ; $0DAD9B |
  LDA $0C                                   ; $0DAD9D |
  AND #$00FE                                ; $0DAD9F |
  TAX                                       ; $0DADA2 |
  LDA $0BBA12,x                             ; $0DADA3 |
  STA $300C                                 ; $0DADA7 |
  SEP #$10                                  ; $0DADAA |
  LDX #$0B                                  ; $0DADAC |
  LDA #$86B6                                ; $0DADAE |
  JSL $7EDE44                               ; $0DADB1 | GSU init
  LDX $12                                   ; $0DADB5 |
  LDA $3000                                 ; $0DADB7 |
  CLC                                       ; $0DADBA |
  ADC $7C18,x                               ; $0DADBB |
  STA $0E                                   ; $0DADBE |
  LDA $06                                   ; $0DADC0 |
  STA $3000                                 ; $0DADC2 |
  JSR CODE_0DAE9C                           ; $0DADC5 |
  LDA $60FC                                 ; $0DADC8 |
  AND #$001F                                ; $0DADCB |
  BEQ CODE_0DADDC                           ; $0DADCE |
  AND #$0018                                ; $0DADD0 |
  DEC A                                     ; $0DADD3 |
  EOR $6000                                 ; $0DADD4 |
  BPL CODE_0DADDC                           ; $0DADD7 |
  STZ $6000                                 ; $0DADD9 |

CODE_0DADDC:
  LDA $603E                                 ; $0DADDC |
  BPL CODE_0DADE5                           ; $0DADDF |
  EOR #$FFFF                                ; $0DADE1 |
  INC A                                     ; $0DADE4 |

CODE_0DADE5:
  ASL A                                     ; $0DADE5 |
  STA $00                                   ; $0DADE6 |
  LSR A                                     ; $0DADE8 |
  CLC                                       ; $0DADE9 |
  ADC $7C18,x                               ; $0DADEA |
  CMP $00                                   ; $0DADED |
  BCS CODE_0DAE3B                           ; $0DADEF |
  LDA $7C18,x                               ; $0DADF1 |
  STA $3000                                 ; $0DADF4 |
  REP #$10                                  ; $0DADF7 |
  LDA #$0080                                ; $0DADF9 |
  SEC                                       ; $0DADFC |
  SBC $0C                                   ; $0DADFD |
  AND #$00FE                                ; $0DADFF |
  TAX                                       ; $0DAE02 |
  LDA $0BBA12,x                             ; $0DAE03 |
  STA $300C                                 ; $0DAE07 |
  SEP #$10                                  ; $0DAE0A |
  LDX #$0B                                  ; $0DAE0C |
  LDA #$86B6                                ; $0DAE0E |
  JSL $7EDE44                               ; $0DAE11 | GSU init
  LDX $12                                   ; $0DAE15 |
  LDA $3000                                 ; $0DAE17 |
  CLC                                       ; $0DAE1A |
  ADC $7C16,x                               ; $0DAE1B |
  STA $0E                                   ; $0DAE1E |
  LDA $06                                   ; $0DAE20 |
  STA $3000                                 ; $0DAE22 |
  JSR CODE_0DAEDB                           ; $0DAE25 |
  LDA $60FC                                 ; $0DAE28 |
  AND #$01E0                                ; $0DAE2B |
  BEQ CODE_0DAE3B                           ; $0DAE2E |
  AND #$0180                                ; $0DAE30 |
  EOR $6002                                 ; $0DAE33 |
  BPL CODE_0DAE3B                           ; $0DAE36 |
  STZ $6002                                 ; $0DAE38 |

CODE_0DAE3B:
  LDY $6004                                 ; $0DAE3B |
  BNE CODE_0DAE41                           ; $0DAE3E |
  RTS                                       ; $0DAE40 |

CODE_0DAE41:
  LDA $6000                                 ; $0DAE41 |
  BPL CODE_0DAE4A                           ; $0DAE44 |
  EOR #$FFFF                                ; $0DAE46 |
  INC A                                     ; $0DAE49 |

CODE_0DAE4A:
  STA $00                                   ; $0DAE4A |
  LDA $6002                                 ; $0DAE4C |
  BPL CODE_0DAE55                           ; $0DAE4F |
  EOR #$FFFF                                ; $0DAE51 |
  INC A                                     ; $0DAE54 |

CODE_0DAE55:
  CMP $00                                   ; $0DAE55 |
  BPL CODE_0DAE75                           ; $0DAE57 |
  LDA $6000                                 ; $0DAE59 |
  CLC                                       ; $0DAE5C |
  ADC $6090                                 ; $0DAE5D |
  STA $6090                                 ; $0DAE60 |
  LDY $6001                                 ; $0DAE63 |
  BPL CODE_0DAE6D                           ; $0DAE66 |
  INC $61B4                                 ; $0DAE68 |
  BRA CODE_0DAE7F                           ; $0DAE6B |

CODE_0DAE6D:
  STZ $60AA                                 ; $0DAE6D |
  STZ $60D2                                 ; $0DAE70 |
  BRA CODE_0DAE7F                           ; $0DAE73 |

CODE_0DAE75:
  LDA $608C                                 ; $0DAE75 |
  CLC                                       ; $0DAE78 |
  ADC $6002                                 ; $0DAE79 |
  STA $608C                                 ; $0DAE7C |

CODE_0DAE7F:
  LDA $06                                   ; $0DAE7F |
  LDY $0D                                   ; $0DAE81 |
  BEQ CODE_0DAE8F                           ; $0DAE83 |
  CMP $02                                   ; $0DAE85 |
  BMI CODE_0DAE9B                           ; $0DAE87 |
  CMP $04                                   ; $0DAE89 |
  BPL CODE_0DAE9B                           ; $0DAE8B |
  BRA CODE_0DAE97                           ; $0DAE8D |

CODE_0DAE8F:
  CMP $02                                   ; $0DAE8F |
  BMI CODE_0DAE97                           ; $0DAE91 |
  CMP $04                                   ; $0DAE93 |
  BMI CODE_0DAE9B                           ; $0DAE95 |

CODE_0DAE97:
  JSL $03A858                               ; $0DAE97 |

CODE_0DAE9B:
  RTS                                       ; $0DAE9B |

CODE_0DAE9C:
  LDA $3000                                 ; $0DAE9C |
  LDY $0C                                   ; $0DAE9F |
  BMI CODE_0DAEAD                           ; $0DAEA1 |
  CMP $02                                   ; $0DAEA3 |
  BMI CODE_0DAEC6                           ; $0DAEA5 |
  CMP $04                                   ; $0DAEA7 |
  BPL CODE_0DAEC6                           ; $0DAEA9 |
  BRA CODE_0DAEB5                           ; $0DAEAB |

CODE_0DAEAD:
  CMP $02                                   ; $0DAEAD |
  BMI CODE_0DAEB5                           ; $0DAEAF |
  CMP $04                                   ; $0DAEB1 |
  BMI CODE_0DAEC6                           ; $0DAEB3 |

CODE_0DAEB5:
  LDA $0E                                   ; $0DAEB5 |
  SEC                                       ; $0DAEB7 |
  SBC $0A                                   ; $0DAEB8 |
  CMP #$0008                                ; $0DAEBA |
  BCS CODE_0DAEDA                           ; $0DAEBD |
  STA $6000                                 ; $0DAEBF |
  INC $6004                                 ; $0DAEC2 |
  RTS                                       ; $0DAEC5 |

CODE_0DAEC6:
  LDA $0E                                   ; $0DAEC6 |
  SEC                                       ; $0DAEC8 |
  SBC $6112                                 ; $0DAEC9 |
  CLC                                       ; $0DAECC |
  ADC $0A                                   ; $0DAECD |
  CMP #$FFF8                                ; $0DAECF |
  BCC CODE_0DAEDA                           ; $0DAED2 |
  STA $6000                                 ; $0DAED4 |
  INC $6004                                 ; $0DAED7 |

CODE_0DAEDA:
  RTS                                       ; $0DAEDA |

CODE_0DAEDB:
  LDA $3000                                 ; $0DAEDB |
  LDY $0C                                   ; $0DAEDE |
  BMI CODE_0DAEEC                           ; $0DAEE0 |
  CMP $02                                   ; $0DAEE2 |
  BMI CODE_0DAF05                           ; $0DAEE4 |
  CMP $04                                   ; $0DAEE6 |
  BPL CODE_0DAF05                           ; $0DAEE8 |
  BRA CODE_0DAEF4                           ; $0DAEEA |

CODE_0DAEEC:
  CMP $02                                   ; $0DAEEC |
  BMI CODE_0DAF05                           ; $0DAEEE |
  CMP $04                                   ; $0DAEF0 |
  BPL CODE_0DAF05                           ; $0DAEF2 |

CODE_0DAEF4:
  LDA $0E                                   ; $0DAEF4 |
  SEC                                       ; $0DAEF6 |
  SBC $08                                   ; $0DAEF7 |
  CMP #$0008                                ; $0DAEF9 |
  BCS CODE_0DAF15                           ; $0DAEFC |
  STA $6002                                 ; $0DAEFE |
  INC $6004                                 ; $0DAF01 |
  RTS                                       ; $0DAF04 |

CODE_0DAF05:
  LDA $0E                                   ; $0DAF05 |
  CLC                                       ; $0DAF07 |
  ADC $08                                   ; $0DAF08 |
  CMP #$FFF8                                ; $0DAF0A |
  BCC CODE_0DAF15                           ; $0DAF0D |
  STA $6002                                 ; $0DAF0F |
  INC $6004                                 ; $0DAF12 |

CODE_0DAF15:
  RTS                                       ; $0DAF15 |

CODE_0DAF16:
  LDA $7A98,x                               ; $0DAF16 |
  BNE CODE_0DAF23                           ; $0DAF19 |
  LDA $7A38,x                               ; $0DAF1B |
  CMP $7900,x                               ; $0DAF1E |
  BNE CODE_0DAF4B                           ; $0DAF21 |

CODE_0DAF23:
  LDA $7BB6,x                               ; $0DAF23 |
  STA $3000                                 ; $0DAF26 |
  LDA $7BB8,x                               ; $0DAF29 |
  STA $3002                                 ; $0DAF2C |
  LDA #$0038                                ; $0DAF2F |
  STA $7BB6,x                               ; $0DAF32 |
  LDA #$0007                                ; $0DAF35 |
  STA $7BB8,x                               ; $0DAF38 |
  JSL $03D291                               ; $0DAF3B |
  LDA $3000                                 ; $0DAF3F |
  STA $7BB6,x                               ; $0DAF42 |
  LDA $3002                                 ; $0DAF45 |
  STA $7BB8,x                               ; $0DAF48 |

CODE_0DAF4B:
  RTS                                       ; $0DAF4B |

init_piro_dangle_anticlockwise:
  LDY #$0A                                  ; $0DAF4C |
  STY $79,x                                 ; $0DAF4E |

init_piro_dangle_clockwise:
  LDA #$0001                                ; $0DAF50 |
  STA $7900,x                               ; $0DAF53 |
  XBA                                       ; $0DAF56 |
  STA $7A36,x                               ; $0DAF57 |
  STZ $7400,x                               ; $0DAF5A |
  LDA #$0040                                ; $0DAF5D |
  STA $7542,x                               ; $0DAF60 |
  LDY #$04                                  ; $0DAF63 |
  STY $76,x                                 ; $0DAF65 |
  RTL                                       ; $0DAF67 |

DATA_0DAF68:         dw $B02D
DATA_0DAF6A:         dw $B040
DATA_0DAF6C:         dw $B062
DATA_0DAF6E:         dw $B09C
DATA_0DAF70:         dw $B102
DATA_0DAF72:         dw $B02D
DATA_0DAF74:         dw $B040
DATA_0DAF76:         dw $B062
DATA_0DAF78:         dw $B09C
DATA_0DAF7A:         dw $8000
DATA_0DAF7C:         dw $C040

; both clockwise and anticlockwise
main_piro_dangle:
  LDA $7D96,x                               ; $0DAF7E |
  BNE CODE_0DAF86                           ; $0DAF81 |
  JSR CODE_0DB20B                           ; $0DAF83 |

CODE_0DAF86:
  REP #$10                                  ; $0DAF86 |
  LDA $7362,x                               ; $0DAF88 |
  CLC                                       ; $0DAF8B |
  ADC #$0010                                ; $0DAF8C |
  TAY                                       ; $0DAF8F |
  LDA $7900,x                               ; $0DAF90 |
  BNE CODE_0DAFC9                           ; $0DAF93 |
  LDA #$FFF8                                ; $0DAF95 |
  CLC                                       ; $0DAF98 |
  ADC $7680,x                               ; $0DAF99 |
  STA $6000,y                               ; $0DAF9C |
  STA $6010,y                               ; $0DAF9F |
  CLC                                       ; $0DAFA2 |
  ADC #$0010                                ; $0DAFA3 |
  STA $6008,y                               ; $0DAFA6 |
  STA $6018,y                               ; $0DAFA9 |
  LDA #$FFF8                                ; $0DAFAC |
  CLC                                       ; $0DAFAF |
  ADC $7682,x                               ; $0DAFB0 |
  STA $6002,y                               ; $0DAFB3 |
  STA $600A,y                               ; $0DAFB6 |
  CLC                                       ; $0DAFB9 |
  ADC #$0010                                ; $0DAFBA |
  STA $6012,y                               ; $0DAFBD |
  STA $601A,y                               ; $0DAFC0 |
  JSL $03AA60                               ; $0DAFC3 |
  BRA CODE_0DAFE9                           ; $0DAFC7 |

CODE_0DAFC9:
  PHX                                       ; $0DAFC9 |
  LDA $78,x                                 ; $0DAFCA |
  AND #$00FF                                ; $0DAFCC |
  TAX                                       ; $0DAFCF |
  SEP #$20                                  ; $0DAFD0 |
  LDA $6005,y                               ; $0DAFD2 |
  ORA $AF7A,x                               ; $0DAFD5 |
  STA $6005,y                               ; $0DAFD8 |
  STA $600D,y                               ; $0DAFDB |
  STA $6015,y                               ; $0DAFDE |
  STA $601D,y                               ; $0DAFE1 |
  REP #$20                                  ; $0DAFE4 |
  PLX                                       ; $0DAFE6 |
  SEP #$10                                  ; $0DAFE7 |

CODE_0DAFE9:
  JSL $03AF23                               ; $0DAFE9 |
  LDY $7900,x                               ; $0DAFED |
  BEQ CODE_0DAFF6                           ; $0DAFF0 |
  JSL $03A5B7                               ; $0DAFF2 |

CODE_0DAFF6:
  TXY                                       ; $0DAFF6 |
  LDA $76,x                                 ; $0DAFF7 |
  AND #$00FF                                ; $0DAFF9 |
  ASL A                                     ; $0DAFFC |
  TAX                                       ; $0DAFFD |
  JSR ($AF68,x)                             ; $0DAFFE |
  LDA $7A96,x                               ; $0DB001 |
  BNE CODE_0DB02C                           ; $0DB004 |
  LDA #$0004                                ; $0DB006 |
  STA $7A96,x                               ; $0DB009 |
  LDA $7A38,x                               ; $0DB00C |
  CLC                                       ; $0DB00F |
  ADC #$0080                                ; $0DB010 |
  AND #$01FE                                ; $0DB013 |
  STA $7A38,x                               ; $0DB016 |
  LDA $7402,x                               ; $0DB019 |
  INC A                                     ; $0DB01C |
  AND #$0003                                ; $0DB01D |
  STA $7402,x                               ; $0DB020 |
  LDA $78,x                                 ; $0DB023 |
  INC A                                     ; $0DB025 |
  AND #$0003                                ; $0DB026 |
  TAY                                       ; $0DB029 |
  STY $78,x                                 ; $0DB02A |

CODE_0DB02C:
  RTL                                       ; $0DB02C |
  TYX                                       ; $0DB02D |
  LDA $7A98,x                               ; $0DB02E |
  BNE CODE_0DB03F                           ; $0DB031 |
  JSL $03AD74                               ; $0DB033 |
  BCC CODE_0DB03F                           ; $0DB037 |
  LDY #$04                                  ; $0DB039 |
  STY $16,x                                 ; $0DB03B |
  INC $76,x                                 ; $0DB03D |

CODE_0DB03F:
  RTS                                       ; $0DB03F |
  TYX                                       ; $0DB040 |
  STZ $7900,x                               ; $0DB041 |
  LDA $7A36,x                               ; $0DB044 |
  INC A                                     ; $0DB047 |
  INC A                                     ; $0DB048 |
  CMP #$0124                                ; $0DB049 |
  BMI CODE_0DB057                           ; $0DB04C |
  LDY #$00                                  ; $0DB04E |
  STY $18,x                                 ; $0DB050 |
  INC $76,x                                 ; $0DB052 |
  LDA #$00E0                                ; $0DB054 |

CODE_0DB057:
  STA $7A36,x                               ; $0DB057 |
  JSR CODE_0DB24B                           ; $0DB05A |
  RTS                                       ; $0DB05D |

DATA_0DB05E:         dw $0002, $FFFE

  TYX                                       ; $0DB062 |
  STZ $7900,x                               ; $0DB063 |
  LDY $18,x                                 ; $0DB066 |
  LDA $7A36,x                               ; $0DB068 |
  CLC                                       ; $0DB06B |
  ADC $B05E,y                               ; $0DB06C |
  CMP #$0124                                ; $0DB06F |
  BPL CODE_0DB086                           ; $0DB072 |
  DEC $16,x                                 ; $0DB074 |
  BNE CODE_0DB07A                           ; $0DB076 |
  INC $76,x                                 ; $0DB078 |

CODE_0DB07A:
  LDA $18,x                                 ; $0DB07A |
  EOR #$0002                                ; $0DB07C |
  STA $18,x                                 ; $0DB07F |
  LDA #$0124                                ; $0DB081 |
  BRA CODE_0DB095                           ; $0DB084 |

CODE_0DB086:
  CMP #$01FF                                ; $0DB086 |
  BMI CODE_0DB095                           ; $0DB089 |
  LDA $18,x                                 ; $0DB08B |
  EOR #$0002                                ; $0DB08D |
  STA $18,x                                 ; $0DB090 |
  LDA #$01FF                                ; $0DB092 |

CODE_0DB095:
  STA $7A36,x                               ; $0DB095 |
  JSR CODE_0DB24B                           ; $0DB098 |
  RTS                                       ; $0DB09B |
  TYX                                       ; $0DB09C |
  LDA $7A36,x                               ; $0DB09D |
  DEC A                                     ; $0DB0A0 |
  DEC A                                     ; $0DB0A1 |
  CMP #$0100                                ; $0DB0A2 |
  BPL CODE_0DB0C9                           ; $0DB0A5 |
  LDA #$0040                                ; $0DB0A7 |
  STA $7A98,x                               ; $0DB0AA |
  LDY $76,x                                 ; $0DB0AD |
  CPY #$05                                  ; $0DB0AF |
  PHP                                       ; $0DB0B1 |
  LDY #$00                                  ; $0DB0B2 |
  PLP                                       ; $0DB0B4 |
  BMI CODE_0DB0B9                           ; $0DB0B5 |
  LDY #$05                                  ; $0DB0B7 |

CODE_0DB0B9:
  STY $76,x                                 ; $0DB0B9 |
  LDA #$0100                                ; $0DB0BB |
  STA $7900,x                               ; $0DB0BE |
  STA $7A36,x                               ; $0DB0C1 |
  JSL $03AEFD                               ; $0DB0C4 |
  RTS                                       ; $0DB0C8 |

CODE_0DB0C9:
  STA $7A36,x                               ; $0DB0C9 |
  JSR CODE_0DB24B                           ; $0DB0CC |
  RTS                                       ; $0DB0CF |

DATA_0DB0D0:         db $04, $02, $00, $00, $00, $08, $00, $04
DATA_0DB0D8:         db $00, $00, $08, $02, $04, $02, $00, $00
DATA_0DB0E0:         db $00, $08

DATA_0DB0E2:         dw $FF00, $0100, $FF00, $0100

DATA_0DB0EA:         dw $0100, $FF00, $FF00, $0100

DATA_0DB0F2:         dw $0008, $0008, $0000, $0000

DATA_0DB0FA:         dw $0040, $0140, $01C0, $00C0

  TYX                                       ; $0DB102 |
  LDA $6FA2,x                               ; $0DB103 |
  AND #$FFE0                                ; $0DB106 |
  ORA #$000B                                ; $0DB109 |
  STA $6FA2,x                               ; $0DB10C |
  LDY $7860,x                               ; $0DB10F |
  BEQ CODE_0DB117                           ; $0DB112 |
  JMP CODE_0DB198                           ; $0DB114 |

CODE_0DB117:
  LDA $70E2,x                               ; $0DB117 |
  CLC                                       ; $0DB11A |
  ADC #$0008                                ; $0DB11B |
  STA $3010                                 ; $0DB11E |
  LDA $7182,x                               ; $0DB121 |
  CLC                                       ; $0DB124 |
  ADC #$0010                                ; $0DB125 |
  STA $3000                                 ; $0DB128 |
  LDX #$0A                                  ; $0DB12B |
  LDA #$CE2F                                ; $0DB12D |
  JSL $7EDE91                               ; $0DB130 | GSU init
  LDX $12                                   ; $0DB134 |
  LDA $300E                                 ; $0DB136 |
  AND #$0004                                ; $0DB139 |
  BNE CODE_0DB13F                           ; $0DB13C |
  RTS                                       ; $0DB13E |

CODE_0DB13F:
  LDY #$00                                  ; $0DB13F |
  LDA $70E2,x                               ; $0DB141 |
  AND #$0010                                ; $0DB144 |
  BNE CODE_0DB14B                           ; $0DB147 |
  LDY #$04                                  ; $0DB149 |

CODE_0DB14B:
  LDA $79,x                                 ; $0DB14B |
  AND #$00FF                                ; $0DB14D |
  BNE CODE_0DB154                           ; $0DB150 |
  INY                                       ; $0DB152 |
  INY                                       ; $0DB153 |

CODE_0DB154:
  LDA $B0E2,y                               ; $0DB154 |
  STA $7220,x                               ; $0DB157 |
  LDA $B0EA,y                               ; $0DB15A |
  STA $7222,x                               ; $0DB15D |
  LDA $B0F2,y                               ; $0DB160 |
  STA $7902,x                               ; $0DB163 |
  LDA $B0FA,y                               ; $0DB166 |
  STA $0C                                   ; $0DB169 |
  LDA #$000B                                ; $0DB16B |
  STA $77,x                                 ; $0DB16E |
  LDA $7182,x                               ; $0DB170 |
  AND #$FFF0                                ; $0DB173 |
  INC A                                     ; $0DB176 |
  STA $7182,x                               ; $0DB177 |
  SEP #$20                                  ; $0DB17A |
  STZ $70E1,x                               ; $0DB17C |
  STZ $7181,x                               ; $0DB17F |
  LDA #$FF                                  ; $0DB182 |
  LDY $7221,x                               ; $0DB184 |
  BPL CODE_0DB18C                           ; $0DB187 |
  STA $70E1,x                               ; $0DB189 |

CODE_0DB18C:
  LDY $7223,x                               ; $0DB18C |
  BPL CODE_0DB194                           ; $0DB18F |
  STA $7181,x                               ; $0DB191 |

CODE_0DB194:
  REP #$20                                  ; $0DB194 |
  BRA CODE_0DB1C6                           ; $0DB196 |

CODE_0DB198:
  LDA $79,x                                 ; $0DB198 |
  AND #$00FF                                ; $0DB19A |
  BEQ CODE_0DB1A7                           ; $0DB19D |
  PHA                                       ; $0DB19F |
  TYA                                       ; $0DB1A0 |
  CLC                                       ; $0DB1A1 |
  ADC #$0006                                ; $0DB1A2 |
  TAY                                       ; $0DB1A5 |
  PLA                                       ; $0DB1A6 |

CODE_0DB1A7:
  CLC                                       ; $0DB1A7 |
  ADC $B0D1,y                               ; $0DB1A8 |
  AND #$00FF                                ; $0DB1AB |
  LSR A                                     ; $0DB1AE |
  STA $3008                                 ; $0DB1AF |
  TXA                                       ; $0DB1B2 |
  STA $3014                                 ; $0DB1B3 |
  LDX #$0A                                  ; $0DB1B6 |
  LDA #$E625                                ; $0DB1B8 |
  JSL $7EDE44                               ; $0DB1BB | GSU init
  LDX $12                                   ; $0DB1BF |
  LDA $6018                                 ; $0DB1C1 |
  STA $0C                                   ; $0DB1C4 |

CODE_0DB1C6:
  STZ $7542,x                               ; $0DB1C6 |
  INC $19,x                                 ; $0DB1C9 |
  INC $16,x                                 ; $0DB1CB |
  INC $76,x                                 ; $0DB1CD |
  LDA $7360,x                               ; $0DB1CF |
  CMP #$003A                                ; $0DB1D2 |
  BEQ CODE_0DB1DC                           ; $0DB1D5 |
  CMP #$003B                                ; $0DB1D7 |
  BNE CODE_0DB1E3                           ; $0DB1DA |

CODE_0DB1DC:
  LDA $0C                                   ; $0DB1DC |
  STA $7900,x                               ; $0DB1DE |
  BRA CODE_0DB20A                           ; $0DB1E1 |

CODE_0DB1E3:
  CMP #$006D                                ; $0DB1E3 |
  BEQ CODE_0DB1ED                           ; $0DB1E6 |
  CMP #$006E                                ; $0DB1E8 |
  BNE CODE_0DB1F6                           ; $0DB1EB |

CODE_0DB1ED:
  LDA $0C                                   ; $0DB1ED |
  STA $7900,x                               ; $0DB1EF |
  JSR CODE_0DB47F                           ; $0DB1F2 |
  RTS                                       ; $0DB1F5 |

CODE_0DB1F6:
  LDA $7722,x                               ; $0DB1F6 |
  BMI CODE_0DB200                           ; $0DB1F9 |
  LDY #$03                                  ; $0DB1FB |
  STY $76,x                                 ; $0DB1FD |
  RTS                                       ; $0DB1FF |

CODE_0DB200:
  LDA #$0040                                ; $0DB200 |
  STA $7A98,x                               ; $0DB203 |
  LDY #$00                                  ; $0DB206 |
  STY $76,x                                 ; $0DB208 |

CODE_0DB20A:
  RTS                                       ; $0DB20A |

CODE_0DB20B:
  LDA $61B0                                 ; $0DB20B |
  ORA $0B55                                 ; $0DB20E |
  ORA $0398                                 ; $0DB211 |
  BNE CODE_0DB24A                           ; $0DB214 |
  LDY $19,x                                 ; $0DB216 |
  BEQ CODE_0DB24A                           ; $0DB218 |
  LDY $77,x                                 ; $0DB21A |
  TYA                                       ; $0DB21C |
  STA $3006                                 ; $0DB21D |
  LDY $79,x                                 ; $0DB220 |
  TYA                                       ; $0DB222 |
  CLC                                       ; $0DB223 |
  ADC $7902,x                               ; $0DB224 |
  LSR A                                     ; $0DB227 |
  STA $3008                                 ; $0DB228 |
  LDA $7902,x                               ; $0DB22B |
  STA $300E                                 ; $0DB22E |
  TXA                                       ; $0DB231 |
  STA $3014                                 ; $0DB232 |
  LDA $0C                                   ; $0DB235 |
  STA $6018                                 ; $0DB237 |
  LDX #$0A                                  ; $0DB23A |
  LDA #$E602                                ; $0DB23C |
  JSL $7EDE91                               ; $0DB23F | GSU init
  LDX $12                                   ; $0DB243 |
  LDA $6018                                 ; $0DB245 |
  STA $0C                                   ; $0DB248 |

CODE_0DB24A:
  RTS                                       ; $0DB24A |

CODE_0DB24B:
  LDA #$6030                                ; $0DB24B |
  STA $3018                                 ; $0DB24E |
  LDA #$0054                                ; $0DB251 |
  STA $301A                                 ; $0DB254 |
  LDA $7A38,x                               ; $0DB257 |
  LSR A                                     ; $0DB25A |
  STA $300A                                 ; $0DB25B |
  LDA $7A36,x                               ; $0DB25E |
  STA $3008                                 ; $0DB261 |
  STZ $300C                                 ; $0DB264 |
  LDA #$0600                                ; $0DB267 |
  STA $3014                                 ; $0DB26A |
  LDA $6120                                 ; $0DB26D |
  STA $3002                                 ; $0DB270 |
  LDA $6122                                 ; $0DB273 |
  STA $3010                                 ; $0DB276 |
  LDA $7400,x                               ; $0DB279 |
  STA $300E                                 ; $0DB27C |
  LDY $7722,x                               ; $0DB27F |
  TYX                                       ; $0DB282 |
  LDA $03A9CE,x                             ; $0DB283 |
  STA $3006                                 ; $0DB287 |
  LDA $03A9EE,x                             ; $0DB28A |
  STA $3004                                 ; $0DB28E |
  LDX #$08                                  ; $0DB291 |
  LDA #$D69F                                ; $0DB293 |
  JSL $7EDE44                               ; $0DB296 | GSU init
  LDX $12                                   ; $0DB29A |
  LDA $7722,x                               ; $0DB29C |
  LSR A                                     ; $0DB29F |
  LSR A                                     ; $0DB2A0 |
  LSR A                                     ; $0DB2A1 |
  SEC                                       ; $0DB2A2 |
  SBC $0030                                 ; $0DB2A3 |
  AND #$0003                                ; $0DB2A6 |
  BNE CODE_0DB2AE                           ; $0DB2A9 |
  INC $0CF9                                 ; $0DB2AB |

CODE_0DB2AE:
  LDA $70E2,x                               ; $0DB2AE |
  CLC                                       ; $0DB2B1 |
  ADC #$0008                                ; $0DB2B2 |
  SEC                                       ; $0DB2B5 |
  SBC $611C                                 ; $0DB2B6 |
  CLC                                       ; $0DB2B9 |
  ADC $6024                                 ; $0DB2BA |
  CMP $6026                                 ; $0DB2BD |
  BCS CODE_0DB2E8                           ; $0DB2C0 |
  LDA $7182,x                               ; $0DB2C2 |
  CLC                                       ; $0DB2C5 |
  ADC #$0008                                ; $0DB2C6 |
  SEC                                       ; $0DB2C9 |
  SBC $611E                                 ; $0DB2CA |
  CLC                                       ; $0DB2CD |
  ADC $6028                                 ; $0DB2CE |
  CMP $602A                                 ; $0DB2D1 |
  BCS CODE_0DB2E8                           ; $0DB2D4 |
  LDA $61D6                                 ; $0DB2D6 |
  BNE CODE_0DB2E8                           ; $0DB2D9 |
  LDA $7220,x                               ; $0DB2DB |
  STA $60A8                                 ; $0DB2DE |
  STA $60B4                                 ; $0DB2E1 |
  JSL $03A858                               ; $0DB2E4 |

CODE_0DB2E8:
  RTS                                       ; $0DB2E8 |

init_hootie_anticlockwise:
  LDY #$0A                                  ; $0DB2E9 |
  STY $79,x                                 ; $0DB2EB |
  BRA CODE_0DB2F5                           ; $0DB2ED |

init_hootie_clockwise:
  LDA #$0100                                ; $0DB2EF |
  STA $7A38,x                               ; $0DB2F2 |

CODE_0DB2F5:
  JSL $03AE60                               ; $0DB2F5 |
  INC $18,x                                 ; $0DB2F9 |
  LDA #$0080                                ; $0DB2FB |
  STA $7A36,x                               ; $0DB2FE |
  STZ $7400,x                               ; $0DB301 |
  JSR CODE_0DB43E                           ; $0DB304 |
  RTL                                       ; $0DB307 |

DATA_0DB308:         dw $B102
DATA_0DB30A:         dw $B4BD
DATA_0DB30C:         dw $B504
DATA_0DB30E:         dw $B5E1
DATA_0DB310:         dw $B764
DATA_0DB312:         dw $B58D
DATA_0DB314:         dw $B7C4

; both clockwise and anticlockwise
main_hootie:
  LDY $76,x                                 ; $0DB316 |
  CPY #$06                                  ; $0DB318 |
  BEQ CODE_0DB336                           ; $0DB31A |
  LDA $6F00,x                               ; $0DB31C |
  CMP #$0012                                ; $0DB31F |
  BEQ CODE_0DB336                           ; $0DB322 |
  LDA $7D96,x                               ; $0DB324 |
  BNE CODE_0DB336                           ; $0DB327 |
  LDA $7900,x                               ; $0DB329 |
  STA $0C                                   ; $0DB32C |
  JSR CODE_0DB20B                           ; $0DB32E |
  LDA $0C                                   ; $0DB331 |
  STA $7900,x                               ; $0DB333 |

CODE_0DB336:
  LDY $76,x                                 ; $0DB336 |
  CPY #$06                                  ; $0DB338 |
  BNE CODE_0DB342                           ; $0DB33A |
  STZ $7220,x                               ; $0DB33C |
  STZ $7222,x                               ; $0DB33F |

CODE_0DB342:
  JSR CODE_0DB3B9                           ; $0DB342 |
  LDY $76,x                                 ; $0DB345 |
  CPY #$04                                  ; $0DB347 |
  BNE CODE_0DB352                           ; $0DB349 |
  LDY $7902,x                               ; $0DB34B |
  BEQ CODE_0DB35D                           ; $0DB34E |
  BRA CODE_0DB35A                           ; $0DB350 |

CODE_0DB352:
  CPY #$03                                  ; $0DB352 |
  BMI CODE_0DB35D                           ; $0DB354 |
  CPY #$06                                  ; $0DB356 |
  BPL CODE_0DB35D                           ; $0DB358 |

CODE_0DB35A:
  STZ $611A                                 ; $0DB35A |

CODE_0DB35D:
  JSL $03AF23                               ; $0DB35D |
  TXY                                       ; $0DB361 |
  LDA $76,x                                 ; $0DB362 |
  ASL A                                     ; $0DB364 |
  TAX                                       ; $0DB365 |
  JSR ($B308,x)                             ; $0DB366 |
  JSR CODE_0DB43E                           ; $0DB369 |
  LDY $7D36,x                               ; $0DB36C |
  DEY                                       ; $0DB36F |
  BMI CODE_0DB3B8                           ; $0DB370 |
  LDA $6F00,y                               ; $0DB372 |
  CMP #$0010                                ; $0DB375 |
  BNE CODE_0DB3B8                           ; $0DB378 |
  LDA $7D38,y                               ; $0DB37A |
  BEQ CODE_0DB3B8                           ; $0DB37D |
  TYX                                       ; $0DB37F |
  JSL $03B25B                               ; $0DB380 |
  LDY $76,x                                 ; $0DB384 |
  CPY #$06                                  ; $0DB386 |
  BEQ CODE_0DB3B8                           ; $0DB388 |
  STZ $7220,x                               ; $0DB38A |
  STZ $7222,x                               ; $0DB38D |
  LDA $7A38,x                               ; $0DB390 |
  STA $16,x                                 ; $0DB393 |
  INC A                                     ; $0DB395 |
  INC A                                     ; $0DB396 |
  AND #$01FE                                ; $0DB397 |
  STA $7A38,x                               ; $0DB39A |
  LDY #$06                                  ; $0DB39D |
  STY $76,x                                 ; $0DB39F |
  LDY #$00                                  ; $0DB3A1 |
  STY $19,x                                 ; $0DB3A3 |
  LDY $79,x                                 ; $0DB3A5 |
  TYA                                       ; $0DB3A7 |
  CLC                                       ; $0DB3A8 |
  ADC $7902,x                               ; $0DB3A9 |
  LSR A                                     ; $0DB3AC |
  TAY                                       ; $0DB3AD |
  LDA $B7FC,y                               ; $0DB3AE |
  SEP #$20                                  ; $0DB3B1 |
  STA $7A37,x                               ; $0DB3B3 |
  REP #$20                                  ; $0DB3B6 |

CODE_0DB3B8:
  RTL                                       ; $0DB3B8 |

CODE_0DB3B9:
  JSL $03AA52                               ; $0DB3B9 |
  LDA #$FFF8                                ; $0DB3BD |
  LDY $79,x                                 ; $0DB3C0 |
  BEQ CODE_0DB3C7                           ; $0DB3C2 |
  LDA #$0008                                ; $0DB3C4 |

CODE_0DB3C7:
  STA $300C                                 ; $0DB3C7 |
  LDA $7A38,x                               ; $0DB3CA |
  LDY $76,x                                 ; $0DB3CD |
  CPY #$06                                  ; $0DB3CF |
  BNE CODE_0DB3D5                           ; $0DB3D1 |
  LDA $16,x                                 ; $0DB3D3 |

CODE_0DB3D5:
  CLC                                       ; $0DB3D5 |
  ADC #$0080                                ; $0DB3D6 |
  AND #$01FE                                ; $0DB3D9 |
  STA $3002                                 ; $0DB3DC |
  LDX #$0B                                  ; $0DB3DF |
  LDA #$8595                                ; $0DB3E1 |
  JSL $7EDE44                               ; $0DB3E4 | GSU init
  LDX $12                                   ; $0DB3E8 |
  REP #$10                                  ; $0DB3EA |
  LDY $7362,x                               ; $0DB3EC |
  LDA $6000,y                               ; $0DB3EF |
  CLC                                       ; $0DB3F2 |
  ADC $3000                                 ; $0DB3F3 |
  STA $6000,y                               ; $0DB3F6 |
  STA $6010,y                               ; $0DB3F9 |
  LDA $6008,y                               ; $0DB3FC |
  CLC                                       ; $0DB3FF |
  ADC $3000                                 ; $0DB400 |
  STA $6008,y                               ; $0DB403 |
  STA $6018,y                               ; $0DB406 |
  LDA $6002,y                               ; $0DB409 |
  CLC                                       ; $0DB40C |
  ADC $3002                                 ; $0DB40D |
  STA $6002,y                               ; $0DB410 |
  STA $600A,y                               ; $0DB413 |
  LDA $6012,y                               ; $0DB416 |
  CLC                                       ; $0DB419 |
  ADC $3002                                 ; $0DB41A |
  STA $6012,y                               ; $0DB41D |
  STA $601A,y                               ; $0DB420 |
  SEP #$10                                  ; $0DB423 |
  LDA #$0008                                ; $0DB425 |
  CLC                                       ; $0DB428 |
  ADC $3000                                 ; $0DB429 |
  STA $7B56,x                               ; $0DB42C |
  LDA #$0008                                ; $0DB42F |
  CLC                                       ; $0DB432 |
  ADC $3002                                 ; $0DB433 |
  STA $7B58,x                               ; $0DB436 |
  RTS                                       ; $0DB439 |

DATA_0DB43A:         dw $4041, $4061

CODE_0DB43E:
  LDY $76,x                                 ; $0DB43E |
  CPY #$02                                  ; $0DB440 |
  BPL CODE_0DB47F                           ; $0DB442 |
  LDA $7A38,x                               ; $0DB444 |
  SEC                                       ; $0DB447 |
  SBC $7900,x                               ; $0DB448 |
  BNE CODE_0DB45B                           ; $0DB44B |
  LDY $18,x                                 ; $0DB44D |
  STY $00                                   ; $0DB44F |
  LDY $78,x                                 ; $0DB451 |
  CPY $00                                   ; $0DB453 |
  BEQ CODE_0DB4BC                           ; $0DB455 |
  STY $18,x                                 ; $0DB457 |
  BRA CODE_0DB47F                           ; $0DB459 |

CODE_0DB45B:
  PHP                                       ; $0DB45B |
  CLC                                       ; $0DB45C |
  ADC #$0100                                ; $0DB45D |
  CMP #$0200                                ; $0DB460 |
  BCC CODE_0DB46A                           ; $0DB463 |
  PLP                                       ; $0DB465 |
  BPL CODE_0DB46D                           ; $0DB466 |
  BRA CODE_0DB472                           ; $0DB468 |

CODE_0DB46A:
  PLP                                       ; $0DB46A |
  BPL CODE_0DB472                           ; $0DB46B |

CODE_0DB46D:
  LDA #$0004                                ; $0DB46D |
  BRA CODE_0DB475                           ; $0DB470 |

CODE_0DB472:
  LDA #$FFFC                                ; $0DB472 |

CODE_0DB475:
  CLC                                       ; $0DB475 |
  ADC $7A38,x                               ; $0DB476 |
  AND #$01FE                                ; $0DB479 |
  STA $7A38,x                               ; $0DB47C |

CODE_0DB47F:
  LDA $7A38,x                               ; $0DB47F |
  LSR A                                     ; $0DB482 |
  STA $300A                                 ; $0DB483 |
  LDY $78,x                                 ; $0DB486 |
  LDA $B43A,y                               ; $0DB488 |
  STA $3018                                 ; $0DB48B |
  LDA #$0054                                ; $0DB48E |
  STA $301A                                 ; $0DB491 |
  LDY $7A36,x                               ; $0DB494 |
  TYA                                       ; $0DB497 |
  ASL A                                     ; $0DB498 |
  STA $300C                                 ; $0DB499 |
  LDY $7722,x                               ; $0DB49C |
  TYX                                       ; $0DB49F |
  LDA $03A9CE,x                             ; $0DB4A0 |
  STA $3006                                 ; $0DB4A4 |
  LDA $03A9EE,x                             ; $0DB4A7 |
  STA $3004                                 ; $0DB4AB |
  LDX #$08                                  ; $0DB4AE |
  LDA #$8205                                ; $0DB4B0 |
  JSL $7EDE44                               ; $0DB4B3 | GSU init
  LDX $12                                   ; $0DB4B7 |
  INC $0CF9                                 ; $0DB4B9 |

CODE_0DB4BC:
  RTS                                       ; $0DB4BC |
  TYX                                       ; $0DB4BD |
  LDA $7A96,x                               ; $0DB4BE |
  ORA $7A98,x                               ; $0DB4C1 |
  BNE CODE_0DB501                           ; $0DB4C4 |
  LDA #$0008                                ; $0DB4C6 |
  STA $7A98,x                               ; $0DB4C9 |
  LDA $78,x                                 ; $0DB4CC |
  EOR #$0002                                ; $0DB4CE |
  STA $78,x                                 ; $0DB4D1 |
  DEC $16,x                                 ; $0DB4D3 |
  BPL CODE_0DB501                           ; $0DB4D5 |
  LDA $7C16,x                               ; $0DB4D7 |
  CLC                                       ; $0DB4DA |
  ADC #$0020                                ; $0DB4DB |
  CMP #$0040                                ; $0DB4DE |
  BCS CODE_0DB4F6                           ; $0DB4E1 |
  LDA $7C18,x                               ; $0DB4E3 |
  CLC                                       ; $0DB4E6 |
  ADC #$0020                                ; $0DB4E7 |
  CMP #$0040                                ; $0DB4EA |
  BCS CODE_0DB4F6                           ; $0DB4ED |
  LDA #$0001                                ; $0DB4EF |
  STA $16,x                                 ; $0DB4F2 |
  BRA CODE_0DB501                           ; $0DB4F4 |

CODE_0DB4F6:
  LDA #$0007                                ; $0DB4F6 |
  STA $16,x                                 ; $0DB4F9 |
  LDA #$0040                                ; $0DB4FB |
  STA $7A96,x                               ; $0DB4FE |

CODE_0DB501:
  JMP CODE_0DB806                           ; $0DB501 |
  TYX                                       ; $0DB504 |
  STX $61B6                                 ; $0DB505 |
  LDA $7CD6,x                               ; $0DB508 |
  SEC                                       ; $0DB50B |
  SBC #$0008                                ; $0DB50C |
  STA $00                                   ; $0DB50F |
  LDA $7CD8,x                               ; $0DB511 |
  SEC                                       ; $0DB514 |
  SBC #$0008                                ; $0DB515 |
  STA $02                                   ; $0DB518 |
  LDA $7902,x                               ; $0DB51A |
  PHA                                       ; $0DB51D |
  XBA                                       ; $0DB51E |
  AND #$00FF                                ; $0DB51F |
  TAY                                       ; $0DB522 |
  BPL CODE_0DB528                           ; $0DB523 |
  ORA #$FF00                                ; $0DB525 |

CODE_0DB528:
  STA $04                                   ; $0DB528 |
  PLA                                       ; $0DB52A |
  AND #$00FF                                ; $0DB52B |
  TAY                                       ; $0DB52E |
  BPL CODE_0DB534                           ; $0DB52F |
  ORA #$FF00                                ; $0DB531 |

CODE_0DB534:
  STA $06                                   ; $0DB534 |
  JSL $049B42                               ; $0DB536 |
  PHA                                       ; $0DB53A |
  LDY $04                                   ; $0DB53B |
  TYA                                       ; $0DB53D |
  XBA                                       ; $0DB53E |
  STA $04                                   ; $0DB53F |
  LDY $06                                   ; $0DB541 |
  TYA                                       ; $0DB543 |
  ORA $04                                   ; $0DB544 |
  STA $7902,x                               ; $0DB546 |
  LDA $08                                   ; $0DB549 |
  STA $608C                                 ; $0DB54B |
  LDA $0A                                   ; $0DB54E |
  STA $6090                                 ; $0DB550 |
  PLA                                       ; $0DB553 |
  BNE CODE_0DB584                           ; $0DB554 |
  STZ $7902,x                               ; $0DB556 |
  LDY #$05                                  ; $0DB559 |
  STY $76,x                                 ; $0DB55B |
  LDA #$0020                                ; $0DB55D |
  STA $16,x                                 ; $0DB560 |
  STZ $611A                                 ; $0DB562 |
  LDY $7E48                                 ; $0DB565 |
  BMI CODE_0DB580                           ; $0DB568 |
  STA $74A2,y                               ; $0DB56A |
  DEC $76,x                                 ; $0DB56D |
  DEC $76,x                                 ; $0DB56F |
  INC $7902,x                               ; $0DB571 |
  LDA #$0004                                ; $0DB574 |
  STA $16,x                                 ; $0DB577 |
  LDA #$0014                                ; $0DB579 |\ play sound #$0014
  JSL $0085D2                               ; $0DB57C |/

CODE_0DB580:
  LDY #$00                                  ; $0DB580 |
  STY $78,x                                 ; $0DB582 |

CODE_0DB584:
  RTS                                       ; $0DB584 |

DATA_0DB585:         dw $0004, $FFFC

DATA_0DB589:         dw $0088, $0080

  TYX                                       ; $0DB58D |
  LDA $7042,x                               ; $0DB58E |
  AND #$FFE0                                ; $0DB591 |
  ORA #$0022                                ; $0DB594 |
  STA $7042,x                               ; $0DB597 |
  LDY $7A36,x                               ; $0DB59A |
  BPL CODE_0DB5EF                           ; $0DB59D |
  LDA $7042,x                               ; $0DB59F |
  AND #$FFE0                                ; $0DB5A2 |
  ORA #$0024                                ; $0DB5A5 |
  STA $7042,x                               ; $0DB5A8 |
  LDA $0035                                 ; $0DB5AB |
  AND #$CFF0                                ; $0DB5AE |
  CMP $0D98                                 ; $0DB5B1 |
  BEQ CODE_0DB5EF                           ; $0DB5B4 |
  STA $0D98                                 ; $0DB5B6 |
  CMP #$0000                                ; $0DB5B9 |
  BEQ CODE_0DB5EF                           ; $0DB5BC |
  LDA $16,x                                 ; $0DB5BE |
  CMP #$0005                                ; $0DB5C0 |
  BMI CODE_0DB5EF                           ; $0DB5C3 |
  SEC                                       ; $0DB5C5 |
  SBC #$0010                                ; $0DB5C6 |
  CMP #$0004                                ; $0DB5C9 |
  BPL CODE_0DB5D1                           ; $0DB5CC |
  LDA #$0004                                ; $0DB5CE |

CODE_0DB5D1:
  AND #$FFFC                                ; $0DB5D1 |
  STA $16,x                                 ; $0DB5D4 |
  SEP #$20                                  ; $0DB5D6 |
  LDA #$60                                  ; $0DB5D8 |
  STA $7A36,x                               ; $0DB5DA |
  REP #$20                                  ; $0DB5DD |
  BRA CODE_0DB5EF                           ; $0DB5DF |
  TYX                                       ; $0DB5E1 |
  LDY $7E48                                 ; $0DB5E2 |
  CPY #$00                                  ; $0DB5E5 |
  BMI CODE_0DB5EF                           ; $0DB5E7 |
  LDA #$FF00                                ; $0DB5E9 |
  STA $74A2,y                               ; $0DB5EC |

CODE_0DB5EF:
  LDA $7722,x                               ; $0DB5EF |
  LSR A                                     ; $0DB5F2 |
  LSR A                                     ; $0DB5F3 |
  LSR A                                     ; $0DB5F4 |
  SEC                                       ; $0DB5F5 |
  SBC $0030                                 ; $0DB5F6 |
  AND #$0003                                ; $0DB5F9 |
  BNE CODE_0DB584                           ; $0DB5FC |
  LDA $16,x                                 ; $0DB5FE |
  AND #$0002                                ; $0DB600 |
  TAY                                       ; $0DB603 |
  LDA $7A36,x                               ; $0DB604 |
  AND #$00FF                                ; $0DB607 |
  CLC                                       ; $0DB60A |
  ADC $B585,y                               ; $0DB60B |
  CMP $B589,y                               ; $0DB60E |
  BEQ CODE_0DB616                           ; $0DB611 |
  JMP CODE_0DB75C                           ; $0DB613 |

CODE_0DB616:
  DEC $16,x                                 ; $0DB616 |
  DEC $16,x                                 ; $0DB618 |
  BEQ CODE_0DB61F                           ; $0DB61A |
  JMP CODE_0DB759                           ; $0DB61C |

CODE_0DB61F:
  PHY                                       ; $0DB61F |
  LDY $76,x                                 ; $0DB620 |
  CPY #$05                                  ; $0DB622 |
  BNE CODE_0DB629                           ; $0DB624 |
  JMP CODE_0DB6DF                           ; $0DB626 |

CODE_0DB629:
  LDA #$FC00                                ; $0DB629 |
  STA $300C                                 ; $0DB62C |
  LDA $7A38,x                               ; $0DB62F |
  STA $3002                                 ; $0DB632 |
  LDX #$0B                                  ; $0DB635 |
  LDA #$8595                                ; $0DB637 |
  JSL $7EDE44                               ; $0DB63A | GSU init
  LDX $12                                   ; $0DB63E |
  LDY $7E48                                 ; $0DB640 |
  LDA $7CD6,x                               ; $0DB643 |
  SEC                                       ; $0DB646 |
  SBC #$0008                                ; $0DB647 |
  STA $70E2,y                               ; $0DB64A |
  LDA $7CD8,x                               ; $0DB64D |
  SEC                                       ; $0DB650 |
  SBC #$0008                                ; $0DB651 |
  STA $7182,y                               ; $0DB654 |
  LDA #$0010                                ; $0DB657 |
  STA $6F00,y                               ; $0DB65A |
  LDA $3000                                 ; $0DB65D |
  STA $7220,y                               ; $0DB660 |
  LDA $3002                                 ; $0DB663 |
  STA $7222,y                               ; $0DB666 |
  CPY #$00                                  ; $0DB669 |
  BNE CODE_0DB6C0                           ; $0DB66B |
  TYA                                       ; $0DB66D |
  STA $7976                                 ; $0DB66E |
  STA $7902                                 ; $0DB671 |
  LDA $7220                                 ; $0DB674 |
  STA $3000                                 ; $0DB677 |
  LDA #$00C0                                ; $0DB67A |
  STA $300C                                 ; $0DB67D |
  LDX #$0B                                  ; $0DB680 |
  LDA #$86B6                                ; $0DB682 |
  JSL $7EDE44                               ; $0DB685 | GSU init
  LDX $12                                   ; $0DB689 |
  LDA $3000                                 ; $0DB68B |
  STA $7220                                 ; $0DB68E |
  LDA $7222                                 ; $0DB691 |
  STA $3000                                 ; $0DB694 |
  LDX #$0B                                  ; $0DB697 |
  LDA #$86B6                                ; $0DB699 |
  JSL $7EDE44                               ; $0DB69C | GSU init
  LDX $12                                   ; $0DB6A0 |
  LDA $3000                                 ; $0DB6A2 |
  STA $7222                                 ; $0DB6A5 |
  LDA #$0010                                ; $0DB6A8 |
  STA $7AF8                                 ; $0DB6AB |
  LDA $61B2                                 ; $0DB6AE |
  AND #$0FFF                                ; $0DB6B1 |
  STA $61B2                                 ; $0DB6B4 |
  PHY                                       ; $0DB6B7 |
  LDA #$003C                                ; $0DB6B8 |\ play sound #$003C
  JSL $0085D2                               ; $0DB6BB |/
  PLY                                       ; $0DB6BF |

CODE_0DB6C0:
  STZ $0390                                 ; $0DB6C0 |
  PHX                                       ; $0DB6C3 |
  LDA $7360,y                               ; $0DB6C4 |
  ASL A                                     ; $0DB6C7 |
  TAX                                       ; $0DB6C8 |
  LDA $0A9F1A,x                             ; $0DB6C9 |
  AND #$00FF                                ; $0DB6CD |
  STA $74A2,y                               ; $0DB6D0 |
  PLX                                       ; $0DB6D3 |
  LDA #$FFFF                                ; $0DB6D4 |
  STA $7E48                                 ; $0DB6D7 |
  STA $0D96                                 ; $0DB6DA |
  BRA CODE_0DB743                           ; $0DB6DD |

CODE_0DB6DF:
  LDA #$0000                                ; $0DB6DF |
  STA $60AC                                 ; $0DB6E2 |
  LDA #$FC00                                ; $0DB6E5 |
  STA $300C                                 ; $0DB6E8 |
  LDA $7A38,x                               ; $0DB6EB |
  STA $3002                                 ; $0DB6EE |
  LDX #$0B                                  ; $0DB6F1 |
  LDA #$8595                                ; $0DB6F3 |
  JSL $7EDE44                               ; $0DB6F6 | GSU init
  LDX $12                                   ; $0DB6FA |
  LDA $3000                                 ; $0DB6FC |
  STA $60A8                                 ; $0DB6FF |
  STA $60B4                                 ; $0DB702 |
  LDA $3002                                 ; $0DB705 |
  STA $60AA                                 ; $0DB708 |
  LDA #$0006                                ; $0DB70B |
  STA $60C0                                 ; $0DB70E |
  LDA #$8001                                ; $0DB711 |
  STA $60D2                                 ; $0DB714 |
  LDA $7CD6,x                               ; $0DB717 |
  SEC                                       ; $0DB71A |
  SBC #$0010                                ; $0DB71B |
  STA $608C                                 ; $0DB71E |
  LDA $7CD8,x                               ; $0DB721 |
  SEC                                       ; $0DB724 |
  SBC #$0010                                ; $0DB725 |
  STA $6090                                 ; $0DB728 |
  STZ $61B6                                 ; $0DB72B |
  STZ $0D94                                 ; $0DB72E |
  LDA #$0060                                ; $0DB731 |
  STA $7AF8,x                               ; $0DB734 |
  LDA #$004B                                ; $0DB737 |
  STA $6FA2,x                               ; $0DB73A |
  LDA #$2155                                ; $0DB73D |
  STA $7040,x                               ; $0DB740 |

CODE_0DB743:
  LDA #$003B                                ; $0DB743 |\ play sound #$003B
  JSL $0085D2                               ; $0DB746 |/
  LDA #$0020                                ; $0DB74A |
  STA $7A96,x                               ; $0DB74D |
  LDY #$02                                  ; $0DB750 |
  STY $78,x                                 ; $0DB752 |
  LDY #$04                                  ; $0DB754 |
  STY $76,x                                 ; $0DB756 |
  PLY                                       ; $0DB758 |

CODE_0DB759:
  LDA $B589,y                               ; $0DB759 |

CODE_0DB75C:
  SEP #$20                                  ; $0DB75C |
  STA $7A36,x                               ; $0DB75E |
  REP #$20                                  ; $0DB761 |
  RTS                                       ; $0DB763 |
  TYX                                       ; $0DB764 |
  LDA $7A96,x                               ; $0DB765 |
  BNE CODE_0DB7C3                           ; $0DB768 |
  LDY $7902,x                               ; $0DB76A |
  BNE CODE_0DB7B3                           ; $0DB76D |
  STY $78,x                                 ; $0DB76F |

CODE_0DB771:
  LDA #$004B                                ; $0DB771 |
  STA $6FA2,x                               ; $0DB774 |
  LDY #$01                                  ; $0DB777 |
  STY $76,x                                 ; $0DB779 |
  STY $16,x                                 ; $0DB77B |
  LDY $7A37,x                               ; $0DB77D |
  TYA                                       ; $0DB780 |
  LSR A                                     ; $0DB781 |
  STA $3008                                 ; $0DB782 |
  TXA                                       ; $0DB785 |
  STA $3014                                 ; $0DB786 |
  LDY $77,x                                 ; $0DB789 |
  BEQ CODE_0DB798                           ; $0DB78B |
  LDX #$0A                                  ; $0DB78D |
  LDA #$E81B                                ; $0DB78F |
  JSL $7EDE44                               ; $0DB792 | GSU init
  BRA CODE_0DB7A1                           ; $0DB796 |

CODE_0DB798:
  LDX #$0A                                  ; $0DB798 |
  LDA #$E625                                ; $0DB79A |
  JSL $7EDE44                               ; $0DB79D | GSU init

CODE_0DB7A1:
  LDX $12                                   ; $0DB7A1 |
  LDA $6018                                 ; $0DB7A3 |
  STA $0C                                   ; $0DB7A6 |
  LDA $0C                                   ; $0DB7A8 |
  STA $7A38,x                               ; $0DB7AA |
  STA $7900,x                               ; $0DB7AD |
  INC $19,x                                 ; $0DB7B0 |
  RTS                                       ; $0DB7B2 |

CODE_0DB7B3:
  DEC $7902,x                               ; $0DB7B3 |
  LDA #$0020                                ; $0DB7B6 |
  STA $16,x                                 ; $0DB7B9 |
  LDY #$00                                  ; $0DB7BB |
  STY $78,x                                 ; $0DB7BD |
  LDY #$05                                  ; $0DB7BF |
  STY $76,x                                 ; $0DB7C1 |

CODE_0DB7C3:
  RTS                                       ; $0DB7C3 |
  TYX                                       ; $0DB7C4 |
  LDA $7A38,x                               ; $0DB7C5 |
  SEC                                       ; $0DB7C8 |
  SBC $16,x                                 ; $0DB7C9 |
  AND #$01FE                                ; $0DB7CB |
  CMP #$01F8                                ; $0DB7CE |
  BCC CODE_0DB7EE                           ; $0DB7D1 |
  LDA $16,x                                 ; $0DB7D3 |
  STA $7A38,x                               ; $0DB7D5 |
  STZ $16,x                                 ; $0DB7D8 |
  LDA $70E2,x                               ; $0DB7DA |
  PHA                                       ; $0DB7DD |
  LDA $7182,x                               ; $0DB7DE |
  PHA                                       ; $0DB7E1 |
  JSR CODE_0DB771                           ; $0DB7E2 |
  PLA                                       ; $0DB7E5 |
  STA $7182,x                               ; $0DB7E6 |
  PLA                                       ; $0DB7E9 |
  STA $70E2,x                               ; $0DB7EA |
  RTS                                       ; $0DB7ED |

CODE_0DB7EE:
  LDA $7A38,x                               ; $0DB7EE |
  CLC                                       ; $0DB7F1 |
  ADC #$0008                                ; $0DB7F2 |
  AND #$01FE                                ; $0DB7F5 |
  STA $7A38,x                               ; $0DB7F8 |

CODE_0DB7FB:
  RTS                                       ; $0DB7FB |

DATA_0DB7FC:         db $04, $08, $02, $00, $00, $12, $0E, $0A
DATA_0DB804:         db $00, $0C

CODE_0DB806:
  LDA $10DA                                 ; $0DB806 |
  ORA $7AF8,x                               ; $0DB809 |
  BNE CODE_0DB7FB                           ; $0DB80C |
  LDA $7A38,x                               ; $0DB80E |
  STA $3002                                 ; $0DB811 |
  LDA #$FFF4                                ; $0DB814 |
  STA $300C                                 ; $0DB817 |
  LDX #$0B                                  ; $0DB81A |
  LDA #$8595                                ; $0DB81C |
  JSL $7EDE44                               ; $0DB81F | GSU init
  LDX $12                                   ; $0DB823 |
  LDA $6120                                 ; $0DB825 |
  ASL A                                     ; $0DB828 |
  STA $00                                   ; $0DB829 |
  LSR A                                     ; $0DB82B |
  CLC                                       ; $0DB82C |
  ADC $3000                                 ; $0DB82D |
  CLC                                       ; $0DB830 |
  ADC $7C16,x                               ; $0DB831 |
  CMP $00                                   ; $0DB834 |
  BCC CODE_0DB839                           ; $0DB836 |

CODE_0DB838:
  RTS                                       ; $0DB838 |

CODE_0DB839:
  LDA $6122                                 ; $0DB839 |
  ASL A                                     ; $0DB83C |
  STA $00                                   ; $0DB83D |
  LSR A                                     ; $0DB83F |
  CLC                                       ; $0DB840 |
  ADC $3002                                 ; $0DB841 |
  CLC                                       ; $0DB844 |
  ADC $7C18,x                               ; $0DB845 |
  CMP $00                                   ; $0DB848 |
  BCS CODE_0DB838                           ; $0DB84A |
  LDA $0D94                                 ; $0DB84C |
  BNE CODE_0DB8C1                           ; $0DB84F |
  LDY #$00                                  ; $0DB851 |
  STY $19,x                                 ; $0DB853 |
  LDY $79,x                                 ; $0DB855 |
  TYA                                       ; $0DB857 |
  CLC                                       ; $0DB858 |
  ADC $7902,x                               ; $0DB859 |
  LSR A                                     ; $0DB85C |
  TAY                                       ; $0DB85D |
  LDA $B7FC,y                               ; $0DB85E |
  SEP #$20                                  ; $0DB861 |
  STA $7A37,x                               ; $0DB863 |
  REP #$20                                  ; $0DB866 |
  JSL $03BFF7                               ; $0DB868 |
  INC $0D94                                 ; $0DB86C |
  LDY $7E48                                 ; $0DB86F |
  BMI CODE_0DB878                           ; $0DB872 |
  TYA                                       ; $0DB874 |
  STA $0D96                                 ; $0DB875 |

CODE_0DB878:
  LDA $70E2,x                               ; $0DB878 |
  SEC                                       ; $0DB87B |
  SBC $608C                                 ; $0DB87C |
  AND #$00FF                                ; $0DB87F |
  XBA                                       ; $0DB882 |
  STA $00                                   ; $0DB883 |
  LDA $7182,x                               ; $0DB885 |
  SEC                                       ; $0DB888 |
  SBC $6090                                 ; $0DB889 |
  AND #$00FF                                ; $0DB88C |
  ORA $00                                   ; $0DB88F |
  STA $7902,x                               ; $0DB891 |
  STZ $60D4                                 ; $0DB894 |
  JSL $04F74A                               ; $0DB897 |
  LDA #$001A                                ; $0DB89B |
  STA $60AC                                 ; $0DB89E |
  LDA #$0021                                ; $0DB8A1 |
  STA $60BE                                 ; $0DB8A4 |
  STZ $7220,x                               ; $0DB8A7 |
  STZ $7222,x                               ; $0DB8AA |
  LDA #$404B                                ; $0DB8AD |
  STA $6FA2,x                               ; $0DB8B0 |
  LDA #$2105                                ; $0DB8B3 |
  STA $7040,x                               ; $0DB8B6 |
  LDY #$02                                  ; $0DB8B9 |
  STY $78,x                                 ; $0DB8BB |
  INC $76,x                                 ; $0DB8BD |
  PLA                                       ; $0DB8BF |
  RTL                                       ; $0DB8C0 |

CODE_0DB8C1:
  RTS                                       ; $0DB8C1 |

DATA_0DB8C2:         dw $0A00, $0000

DATA_0DB8C6:         dw $0050, $0030

; both the single and set of three
init_mini_raven:
  LDA $7AF6,x                               ; $0DB8CA |
  BNE CODE_0DB913                           ; $0DB8CD |
  LDY $7400,x                               ; $0DB8CF |
  LDA $B8C2,y                               ; $0DB8D2 |
  STA $78,x                                 ; $0DB8D5 |
  STZ $7400,x                               ; $0DB8D7 |
  LDA $7360,x                               ; $0DB8DA |
  CMP #$003A                                ; $0DB8DD |
  BNE CODE_0DB913                           ; $0DB8E0 |
  LDA #$0002                                ; $0DB8E2 |
  STA $02                                   ; $0DB8E5 |

CODE_0DB8E7:
  LDY $02                                   ; $0DB8E7 |
  LDA $B8C6,y                               ; $0DB8E9 |
  STA $00                                   ; $0DB8EC |
  LDA #$003A                                ; $0DB8EE |
  JSL $03A34C                               ; $0DB8F1 |
  BCC CODE_0DB913                           ; $0DB8F5 |
  LDA $70E2,x                               ; $0DB8F7 |
  STA $70E2,y                               ; $0DB8FA |
  LDA $7182,x                               ; $0DB8FD |
  STA $7182,y                               ; $0DB900 |
  LDA $78,x                                 ; $0DB903 |
  STA $79D8,y                               ; $0DB905 |
  LDA $00                                   ; $0DB908 |
  STA $7AF6,y                               ; $0DB90A |
  DEC $02                                   ; $0DB90D |
  DEC $02                                   ; $0DB90F |
  BPL CODE_0DB8E7                           ; $0DB911 |

CODE_0DB913:
  RTL                                       ; $0DB913 |

DATA_0DB914:         dw $B102
DATA_0DB916:         dw $8000

; both the single and set of three
main_mini_raven:
  LDA $7362,x                               ; $0DB918 |
  BMI CODE_0DB988                           ; $0DB91B |
  LDA $6F00,x                               ; $0DB91D |
  CMP #$0012                                ; $0DB920 |
  BEQ CODE_0DB959                           ; $0DB923 |
  LDA $7D96,x                               ; $0DB925 |
  BNE CODE_0DB959                           ; $0DB928 |
  LDA $7900,x                               ; $0DB92A |
  STA $0C                                   ; $0DB92D |
  JSR CODE_0DB20B                           ; $0DB92F |
  LDA $0C                                   ; $0DB932 |
  STA $7900,x                               ; $0DB934 |
  LDA $7AF6,x                               ; $0DB937 |
  BEQ CODE_0DB959                           ; $0DB93A |
  LDA $7860,x                               ; $0DB93C |
  BNE CODE_0DB945                           ; $0DB93F |
  LDY $77,x                                 ; $0DB941 |
  BEQ CODE_0DB959                           ; $0DB943 |

CODE_0DB945:
  LDA $70E2,x                               ; $0DB945 |
  SEC                                       ; $0DB948 |
  SBC $72C0,x                               ; $0DB949 |
  STA $70E2,x                               ; $0DB94C |
  LDA $7182,x                               ; $0DB94F |
  SEC                                       ; $0DB952 |
  SBC $72C2,x                               ; $0DB953 |
  STA $7182,x                               ; $0DB956 |

CODE_0DB959:
  JSL $03AF23                               ; $0DB959 |
  TXY                                       ; $0DB95D |
  LDA $76,x                                 ; $0DB95E |
  ASL A                                     ; $0DB960 |
  TAX                                       ; $0DB961 |
  JSR ($B914,x)                             ; $0DB962 |
  JSR CODE_0DB9CA                           ; $0DB965 |
  LDA $7220,x                               ; $0DB968 |
  JSR CODE_0DB989                           ; $0DB96B |
  STA $7220,x                               ; $0DB96E |
  LDA $7222,x                               ; $0DB971 |
  JSR CODE_0DB989                           ; $0DB974 |
  STA $7222,x                               ; $0DB977 |
  LDY $7D36,x                               ; $0DB97A |
  DEY                                       ; $0DB97D |
  BMI CODE_0DB984                           ; $0DB97E |
  JML $0DC0F0                               ; $0DB980 |

CODE_0DB984:
  JSL $03A5B7                               ; $0DB984 |

CODE_0DB988:
  RTL                                       ; $0DB988 |

CODE_0DB989:
  CMP #$0059                                ; $0DB989 |
  BNE CODE_0DB991                           ; $0DB98C |
  LDA #$0100                                ; $0DB98E |

CODE_0DB991:
  CMP #$FFA7                                ; $0DB991 |
  BNE CODE_0DB999                           ; $0DB994 |
  LDA #$FF00                                ; $0DB996 |

CODE_0DB999:
  CMP #$003E                                ; $0DB999 |
  BNE CODE_0DB9A1                           ; $0DB99C |
  LDA #$00B5                                ; $0DB99E |

CODE_0DB9A1:
  CMP #$FFC2                                ; $0DB9A1 |
  BNE CODE_0DB9A9                           ; $0DB9A4 |
  LDA #$FF4B                                ; $0DB9A6 |

CODE_0DB9A9:
  RTS                                       ; $0DB9A9 |

DATA_0DB9AA:         dw $0400, $0602, $0400, $0602
DATA_0DB9B2:         dw $0600, $0402, $0600, $0402

DATA_0DB9BA:         dw $A0A0, $6060, $6060, $A0A0
DATA_0DB9C2:         dw $2020, $E020, $E0E0, $20E0

CODE_0DB9CA:
  LDA $7A98,x                               ; $0DB9CA |
  BNE CODE_0DB9DC                           ; $0DB9CD |
  LDA #$0003                                ; $0DB9CF |
  STA $7A98,x                               ; $0DB9D2 |
  LDA $78,x                                 ; $0DB9D5 |
  EOR #$0001                                ; $0DB9D7 |
  STA $78,x                                 ; $0DB9DA |

CODE_0DB9DC:
  LDA $7900,x                               ; $0DB9DC |
  CMP $7A38,x                               ; $0DB9DF |
  BEQ CODE_0DBA05                           ; $0DB9E2 |
  STA $7A38,x                               ; $0DB9E4 |
  ASL A                                     ; $0DB9E7 |
  ASL A                                     ; $0DB9E8 |
  XBA                                       ; $0DB9E9 |
  LDY $79,x                                 ; $0DB9EA |
  BEQ CODE_0DB9F2                           ; $0DB9EC |
  CLC                                       ; $0DB9EE |
  ADC #$0008                                ; $0DB9EF |

CODE_0DB9F2:
  TAY                                       ; $0DB9F2 |
  SEP #$20                                  ; $0DB9F3 |
  LDA $B9BA,y                               ; $0DB9F5 |
  STA $7042,x                               ; $0DB9F8 |
  LDA $B9AA,y                               ; $0DB9FB |
  AND #$FF                                  ; $0DB9FE |
  STA $7A36,x                               ; $0DBA00 |
  REP #$20                                  ; $0DBA03 |

CODE_0DBA05:
  LDA $78,x                                 ; $0DBA05 |
  AND #$00FF                                ; $0DBA07 |
  ORA $7A36,x                               ; $0DBA0A |
  STA $7402,x                               ; $0DBA0D |
  RTS                                       ; $0DBA10 |

init_spinning_log:
  JSL $03AE60                               ; $0DBA11 |
  STZ $7400,x                               ; $0DBA15 |
  JSR CODE_0DBA3D                           ; $0DBA18 |
  LDA #$000C                                ; $0DBA1B |
  STA $7BB6,x                               ; $0DBA1E |
  RTL                                       ; $0DBA21 |

DATA_0DBA22:         dw $BB1F
DATA_0DBA24:         dw $BB2E

main_spinning_log:
  JSL $03AA52                               ; $0DBA26 |
  JSL $03AF23                               ; $0DBA2A |
  TXY                                       ; $0DBA2E |
  LDA $76,x                                 ; $0DBA2F |
  ASL A                                     ; $0DBA31 |
  TAX                                       ; $0DBA32 |
  JSR ($BA22,x)                             ; $0DBA33 |
  JSR CODE_0DBA7D                           ; $0DBA36 |
  JSR CODE_0DBA3D                           ; $0DBA39 |
  RTL                                       ; $0DBA3C |

CODE_0DBA3D:
  LDY $78,x                                 ; $0DBA3D |
  BNE CODE_0DBA7C                           ; $0DBA3F |
  INC $78,x                                 ; $0DBA41 |
  LDA #$4060                                ; $0DBA43 |
  STA $3018                                 ; $0DBA46 |
  LDA #$0054                                ; $0DBA49 |
  STA $301A                                 ; $0DBA4C |
  LDY $7A38,x                               ; $0DBA4F |
  TYA                                       ; $0DBA52 |
  STA $300A                                 ; $0DBA53 |
  LDA #$0100                                ; $0DBA56 |
  STA $300C                                 ; $0DBA59 |
  LDY $7722,x                               ; $0DBA5C |
  TYX                                       ; $0DBA5F |
  LDA $03A9CE,x                             ; $0DBA60 |
  STA $3006                                 ; $0DBA64 |
  LDA $03A9EE,x                             ; $0DBA67 |
  STA $3004                                 ; $0DBA6B |
  LDX #$08                                  ; $0DBA6E |
  LDA #$8205                                ; $0DBA70 |
  JSL $7EDE44                               ; $0DBA73 | GSU init
  LDX $12                                   ; $0DBA77 |
  INC $0CF9                                 ; $0DBA79 |

CODE_0DBA7C:
  RTS                                       ; $0DBA7C |

CODE_0DBA7D:
  LDY $76,x                                 ; $0DBA7D |
  BNE CODE_0DBA86                           ; $0DBA7F |
  JSL $03D127                               ; $0DBA81 |

CODE_0DBA85:
  RTS                                       ; $0DBA85 |

CODE_0DBA86:
  LDA $7C16,x                               ; $0DBA86 |
  CLC                                       ; $0DBA89 |
  ADC #$001A                                ; $0DBA8A |
  CMP #$0034                                ; $0DBA8D |
  BCS CODE_0DBA85                           ; $0DBA90 |
  LDA $7C18,x                               ; $0DBA92 |
  CLC                                       ; $0DBA95 |
  ADC #$0013                                ; $0DBA96 |
  CMP #$0026                                ; $0DBA99 |
  BCS CODE_0DBA85                           ; $0DBA9C |
  LDA $7C16,x                               ; $0DBA9E |
  STA $3002                                 ; $0DBAA1 |
  LDA $7C18,x                               ; $0DBAA4 |
  STA $3004                                 ; $0DBAA7 |
  LDX #$0B                                  ; $0DBAAA |
  LDA #$BCF8                                ; $0DBAAC |
  JSL $7EDE44                               ; $0DBAAF | GSU init
  LDX $12                                   ; $0DBAB3 |
  LDA $3000                                 ; $0DBAB5 |
  STA $00                                   ; $0DBAB8 |
  CLC                                       ; $0DBABA |
  ADC #$0080                                ; $0DBABB |
  AND #$01FE                                ; $0DBABE |
  STA $3002                                 ; $0DBAC1 |
  LDA #$0400                                ; $0DBAC4 |
  STA $300C                                 ; $0DBAC7 |
  LDX #$0B                                  ; $0DBACA |
  LDA #$8595                                ; $0DBACC |
  JSL $7EDE44                               ; $0DBACF | GSU init
  LDX $12                                   ; $0DBAD3 |
  LDA $60FC                                 ; $0DBAD5 |
  AND #$01E0                                ; $0DBAD8 |
  BEQ CODE_0DBAE6                           ; $0DBADB |
  AND #$0180                                ; $0DBADD |
  DEC A                                     ; $0DBAE0 |
  EOR $3000                                 ; $0DBAE1 |
  BPL CODE_0DBAEF                           ; $0DBAE4 |

CODE_0DBAE6:
  LDA $3000                                 ; $0DBAE6 |
  STA $60A8                                 ; $0DBAE9 |
  STA $60B4                                 ; $0DBAEC |

CODE_0DBAEF:
  LDA $3002                                 ; $0DBAEF |
  EOR #$FFFF                                ; $0DBAF2 |
  INC A                                     ; $0DBAF5 |
  STA $00                                   ; $0DBAF6 |
  LDA $60FC                                 ; $0DBAF8 |
  AND #$001F                                ; $0DBAFB |
  BEQ CODE_0DBB08                           ; $0DBAFE |
  AND #$0018                                ; $0DBB00 |
  DEC A                                     ; $0DBB03 |
  EOR $00                                   ; $0DBB04 |
  BMI CODE_0DBB1E                           ; $0DBB06 |

CODE_0DBB08:
  LDA $00                                   ; $0DBB08 |
  BPL CODE_0DBB1B                           ; $0DBB0A |
  PHA                                       ; $0DBB0C |
  LDA #$0006                                ; $0DBB0D |
  STA $60C0                                 ; $0DBB10 |
  LDA #$8001                                ; $0DBB13 |
  STA $60D2                                 ; $0DBB16 |
  PLA                                       ; $0DBB19 |
  ASL A                                     ; $0DBB1A |

CODE_0DBB1B:
  STA $60AA                                 ; $0DBB1B |

CODE_0DBB1E:
  RTS                                       ; $0DBB1E |
  TYX                                       ; $0DBB1F |
  LDA $7A96,x                               ; $0DBB20 |
  BNE CODE_0DBB2D                           ; $0DBB23 |
  LDA #$0080                                ; $0DBB25 |
  STA $7A96,x                               ; $0DBB28 |
  INC $76,x                                 ; $0DBB2B |

CODE_0DBB2D:
  RTS                                       ; $0DBB2D |
  TYX                                       ; $0DBB2E |
  LDA $7A96,x                               ; $0DBB2F |
  BNE CODE_0DBB45                           ; $0DBB32 |
  LDA $7A38,x                               ; $0DBB34 |
  AND #$007F                                ; $0DBB37 |
  BNE CODE_0DBB45                           ; $0DBB3A |
  DEC $76,x                                 ; $0DBB3C |
  LDA #$0080                                ; $0DBB3E |
  STA $7A96,x                               ; $0DBB41 |
  RTS                                       ; $0DBB44 |

CODE_0DBB45:
  LDA $7A38,x                               ; $0DBB45 |
  CLC                                       ; $0DBB48 |
  ADC #$0010                                ; $0DBB49 |
  STA $7A38,x                               ; $0DBB4C |
  STZ $78,x                                 ; $0DBB4F |
  RTS                                       ; $0DBB51 |

init_flower_pot:
  LDA $70E2,x                               ; $0DBB52 |
  STA $7900,x                               ; $0DBB55 |
  STA $04                                   ; $0DBB58 |
  LDA $7182,x                               ; $0DBB5A |
  STA $7902,x                               ; $0DBB5D |
  JSL $03D400                               ; $0DBB60 |
  BEQ CODE_0DBB68                           ; $0DBB64 |
  INC $79,x                                 ; $0DBB66 |

CODE_0DBB68:
  STZ $7400,x                               ; $0DBB68 |
  LDA #$0004                                ; $0DBB6B |
  STA $7B58,x                               ; $0DBB6E |
  ASL A                                     ; $0DBB71 |
  STA $7BB6,x                               ; $0DBB72 |
  LDA #$000C                                ; $0DBB75 |
  STA $7BB8,x                               ; $0DBB78 |
  RTL                                       ; $0DBB7B |

DATA_0DBB7C:         dw $8000
DATA_0DBB7E:         dw $BD11

  JSL $03AF23                               ; $0DBB80 |
  LDY $78,x                                 ; $0DBB84 |
  BNE CODE_0DBB8B                           ; $0DBB86 |
  STZ $7220,x                               ; $0DBB88 |

CODE_0DBB8B:
  STZ $7400,x                               ; $0DBB8B |
  JSR CODE_0DBC65                           ; $0DBB8E |
  JSR CODE_0DBBB1                           ; $0DBB91 |
  TXY                                       ; $0DBB94 |
  LDA $76,x                                 ; $0DBB95 |
  ASL A                                     ; $0DBB97 |
  TAX                                       ; $0DBB98 |
  JSR ($BB7C,x)                             ; $0DBB99 |
  LDY $18,x                                 ; $0DBB9C |
  BEQ CODE_0DBBB0                           ; $0DBB9E |
  LDY $7223,x                               ; $0DBBA0 |
  BPL CODE_0DBBB0                           ; $0DBBA3 |
  LDA $60FC                                 ; $0DBBA5 |
  AND #$0018                                ; $0DBBA8 |
  BEQ CODE_0DBBB0                           ; $0DBBAB |
  STZ $7222,x                               ; $0DBBAD |

CODE_0DBBB0:
  RTL                                       ; $0DBBB0 |

CODE_0DBBB1:
  LDY $76,x                                 ; $0DBBB1 |
  BNE CODE_0DBBC4                           ; $0DBBB3 |
  LDY $7D36,x                               ; $0DBBB5 |
  BPL CODE_0DBBBE                           ; $0DBBB8 |
  JSR CODE_0DBC1B                           ; $0DBBBA |
  RTS                                       ; $0DBBBD |

CODE_0DBBBE:
  DEY                                       ; $0DBBBE |
  BMI CODE_0DBBC4                           ; $0DBBBF |
  JSR CODE_0DBBD1                           ; $0DBBC1 |

CODE_0DBBC4:
  LDY #$00                                  ; $0DBBC4 |
  STY $18,x                                 ; $0DBBC6 |
  RTS                                       ; $0DBBC8 |

DATA_0DBBC9:         dw $FFC0, $0040, $FF80, $0080

CODE_0DBBD1:
  LDA $6F00,y                               ; $0DBBD1 |
  CMP #$0010                                ; $0DBBD4 |
  BNE CODE_0DBC12                           ; $0DBBD7 |
  LDA $7D38,y                               ; $0DBBD9 |
  BEQ CODE_0DBC12                           ; $0DBBDC |
  LDA $7542,y                               ; $0DBBDE |
  STA $00                                   ; $0DBBE1 |
  LDA $7220,y                               ; $0DBBE3 |
  STA $02                                   ; $0DBBE6 |
  LDA $7CD6,y                               ; $0DBBE8 |
  SEC                                       ; $0DBBEB |
  SBC $7CD6,x                               ; $0DBBEC |
  TYX                                       ; $0DBBEF |
  JSL $03B25B                               ; $0DBBF0 |
  LDA #$FD00                                ; $0DBBF4 |
  STA $7222,x                               ; $0DBBF7 |
  LDY #$00                                  ; $0DBBFA |
  LDA $00                                   ; $0DBBFC |
  BNE CODE_0DBC02                           ; $0DBBFE |
  LDY #$04                                  ; $0DBC00 |

CODE_0DBC02:
  LDA $02                                   ; $0DBC02 |
  BMI CODE_0DBC08                           ; $0DBC04 |
  INY                                       ; $0DBC06 |
  INY                                       ; $0DBC07 |

CODE_0DBC08:
  LDA $BBC9,y                               ; $0DBC08 |
  STA $7220,x                               ; $0DBC0B |
  LDY #$01                                  ; $0DBC0E |
  STY $78,x                                 ; $0DBC10 |

CODE_0DBC12:
  RTS                                       ; $0DBC12 |

DATA_0DBC13:         dw $0040, $FFC0, $0018, $001C

CODE_0DBC1B:
  LDA $7C18,x                               ; $0DBC1B |
  SEC                                       ; $0DBC1E |
  SBC $6122                                 ; $0DBC1F |
  SEC                                       ; $0DBC22 |
  SBC $7BB8,x                               ; $0DBC23 |
  STA $04                                   ; $0DBC26 |
  LDY $18,x                                 ; $0DBC28 |
  BEQ CODE_0DBC47                           ; $0DBC2A |
  LDY $60AB                                 ; $0DBC2C |
  BMI CODE_0DBC42                           ; $0DBC2F |

CODE_0DBC31:
  INC $61B4                                 ; $0DBC31 |
  LDA $6090                                 ; $0DBC34 |
  CLC                                       ; $0DBC37 |
  ADC $04                                   ; $0DBC38 |
  CLC                                       ; $0DBC3A |
  ADC #$0002                                ; $0DBC3B |
  STA $6090                                 ; $0DBC3E |
  RTS                                       ; $0DBC41 |

CODE_0DBC42:
  LDY #$00                                  ; $0DBC42 |
  STY $18,x                                 ; $0DBC44 |
  RTS                                       ; $0DBC46 |

CODE_0DBC47:
  CMP #$FFF8                                ; $0DBC47 |
  BCC CODE_0DBC5D                           ; $0DBC4A |
  LDY $60C0                                 ; $0DBC4C |
  BEQ CODE_0DBC60                           ; $0DBC4F |
  LDY $60AB                                 ; $0DBC51 |
  BMI CODE_0DBC60                           ; $0DBC54 |
  INC $18,x                                 ; $0DBC56 |
  STZ $60AA                                 ; $0DBC58 |
  BRA CODE_0DBC31                           ; $0DBC5B |

CODE_0DBC5D:
  JSR CODE_0D9037                           ; $0DBC5D |

CODE_0DBC60:
  RTS                                       ; $0DBC60 |

DATA_0DBC61:         dw $FE00, $FF00

CODE_0DBC65:
  LDA $7860,x                               ; $0DBC65 |
  AND #$0001                                ; $0DBC68 |
  BNE CODE_0DBC7A                           ; $0DBC6B |
  LDY $7A36,x                               ; $0DBC6D |
  BEQ CODE_0DBC79                           ; $0DBC70 |
  LDY $78,x                                 ; $0DBC72 |
  BNE CODE_0DBC79                           ; $0DBC74 |
  INY                                       ; $0DBC76 |
  STY $19,x                                 ; $0DBC77 |

CODE_0DBC79:
  RTS                                       ; $0DBC79 |

CODE_0DBC7A:
  STA $7A36,x                               ; $0DBC7A |
  LDY $78,x                                 ; $0DBC7D |
  BEQ CODE_0DBCA8                           ; $0DBC7F |
  LDA $7182,x                               ; $0DBC81 |
  SEC                                       ; $0DBC84 |
  SBC $7A38,x                               ; $0DBC85 |
  CMP #$0010                                ; $0DBC88 |
  BMI CODE_0DBC93                           ; $0DBC8B |
  LDY #$00                                  ; $0DBC8D |
  STY $78,x                                 ; $0DBC8F |
  BRA CODE_0DBCB3                           ; $0DBC91 |

CODE_0DBC93:
  CPY #$03                                  ; $0DBC93 |
  BPL CODE_0DBCA3                           ; $0DBC95 |
  TYA                                       ; $0DBC97 |
  ASL A                                     ; $0DBC98 |
  TAY                                       ; $0DBC99 |
  LDA $BC5F,y                               ; $0DBC9A |
  STA $7222,x                               ; $0DBC9D |
  INC $78,x                                 ; $0DBCA0 |
  RTS                                       ; $0DBCA2 |

CODE_0DBCA3:
  LDY #$00                                  ; $0DBCA3 |
  STY $78,x                                 ; $0DBCA5 |
  RTS                                       ; $0DBCA7 |

CODE_0DBCA8:
  LDY $19,x                                 ; $0DBCA8 |
  BNE CODE_0DBCB3                           ; $0DBCAA |
  LDA $7182,x                               ; $0DBCAC |
  STA $7A38,x                               ; $0DBCAF |
  RTS                                       ; $0DBCB2 |

CODE_0DBCB3:
  LDY $76,x                                 ; $0DBCB3 |
  BNE CODE_0DBC79                           ; $0DBCB5 |
  LDA $7040,x                               ; $0DBCB7 |
  AND #$FFF3                                ; $0DBCBA |
  STA $7040,x                               ; $0DBCBD |
  LDA #$0002                                ; $0DBCC0 |
  STA $7A98,x                               ; $0DBCC3 |
  STZ $16,x                                 ; $0DBCC6 |
  LDA #$0066                                ; $0DBCC8 |\ play sound #$0066
  JSL $0085D2                               ; $0DBCCB |/
  INC $76,x                                 ; $0DBCCF |
  LDY $79,x                                 ; $0DBCD1 |
  BNE CODE_0DBC79                           ; $0DBCD3 |
  LDY #$00                                  ; $0DBCD5 |
  LDA $7900,x                               ; $0DBCD7 |
  AND #$0010                                ; $0DBCDA |
  BEQ CODE_0DBCE0                           ; $0DBCDD |
  INY                                       ; $0DBCDF |

CODE_0DBCE0:
  LDA $7902,x                               ; $0DBCE0 |
  AND #$0010                                ; $0DBCE3 |
  BEQ CODE_0DBCEA                           ; $0DBCE6 |
  INY                                       ; $0DBCE8 |
  INY                                       ; $0DBCE9 |

CODE_0DBCEA:
  CPY #$03                                  ; $0DBCEA |
  BEQ CODE_0DBD10                           ; $0DBCEC |
  CPY #$02                                  ; $0DBCEE |
  BNE CODE_0DBCF8                           ; $0DBCF0 |
  JSL $0D92EE                               ; $0DBCF2 |
  BRA CODE_0DBD00                           ; $0DBCF6 |

CODE_0DBCF8:
  CPY #$01                                  ; $0DBCF8 |
  BNE CODE_0DBD0D                           ; $0DBCFA |
  JSL $0D9329                               ; $0DBCFC |

CODE_0DBD00:
  LDA $7900,x                               ; $0DBD00 |
  STA $04                                   ; $0DBD03 |
  LDA $7902,x                               ; $0DBD05 |
  JSL $03D3F3                               ; $0DBD08 |
  RTS                                       ; $0DBD0C |

CODE_0DBD0D:
  JSR CODE_0D9383                           ; $0DBD0D |

CODE_0DBD10:
  RTS                                       ; $0DBD10 |
  TYX                                       ; $0DBD11 |
  LDA $7A98,x                               ; $0DBD12 |
  BNE CODE_0DBD10                           ; $0DBD15 |
  LDA #$0004                                ; $0DBD17 |
  STA $7A98,x                               ; $0DBD1A |
  INC $7402,x                               ; $0DBD1D |
  LDY $7402,x                               ; $0DBD20 |
  CPY #$06                                  ; $0DBD23 |
  BMI CODE_0DBD10                           ; $0DBD25 |
  LDY $16,x                                 ; $0DBD27 |
  BNE CODE_0DBD2D                           ; $0DBD29 |
  INC $16,x                                 ; $0DBD2B |

CODE_0DBD2D:
  DEC $7402,x                               ; $0DBD2D |
  JSL $03A2C7                               ; $0DBD30 |
  BCC CODE_0DBD3A                           ; $0DBD34 |
  JSL $03A32E                               ; $0DBD36 |

CODE_0DBD3A:
  RTS                                       ; $0DBD3A |

init_lakitu_cloud:
  LDA #$0360                                ; $0DBD3B |
  STA $7A96,x                               ; $0DBD3E |
  LDA #$03C0                                ; $0DBD41 |
  STA $7AF6,x                               ; $0DBD44 |
  RTL                                       ; $0DBD47 |

DATA_0DBD48:         dw $0008, $00E8, $0010, $FFF0

main_lakitu_cloud:
  LDY #$00                                  ; $0DBD50 |
  LDA $7220,x                               ; $0DBD52 |
  BNE CODE_0DBD61                           ; $0DBD55 |
  CPX $61B6                                 ; $0DBD57 |
  BEQ CODE_0DBD69                           ; $0DBD5A |
  LDY $77C2,x                               ; $0DBD5C |
  BRA CODE_0DBD65                           ; $0DBD5F |

CODE_0DBD61:
  BMI CODE_0DBD65                           ; $0DBD61 |
  INY                                       ; $0DBD63 |
  INY                                       ; $0DBD64 |

CODE_0DBD65:
  TYA                                       ; $0DBD65 |
  STA $7400,x                               ; $0DBD66 |

CODE_0DBD69:
  LDY $7D38,x                               ; $0DBD69 |
  BEQ CODE_0DBD73                           ; $0DBD6C |
  JSL $03A2F8                               ; $0DBD6E |
  RTL                                       ; $0DBD72 |

CODE_0DBD73:
  CPX $61B6                                 ; $0DBD73 |
  BEQ CODE_0DBD7B                           ; $0DBD76 |
  JMP CODE_0DBDE9                           ; $0DBD78 |

CODE_0DBD7B:
  LDA $7680,x                               ; $0DBD7B |
  SEC                                       ; $0DBD7E |
  SBC #$0080                                ; $0DBD7F |
  STA $00                                   ; $0DBD82 |
  LDA $7220,x                               ; $0DBD84 |
  BEQ CODE_0DBD8D                           ; $0DBD87 |
  EOR $00                                   ; $0DBD89 |
  BMI CODE_0DBDAF                           ; $0DBD8B |

CODE_0DBD8D:
  LDA $7680,x                               ; $0DBD8D |
  CMP #$00F0                                ; $0DBD90 |
  BCC CODE_0DBDAF                           ; $0DBD93 |
  STZ $7220,x                               ; $0DBD95 |
  STZ $7540,x                               ; $0DBD98 |
  LDA $70E2,x                               ; $0DBD9B |
  SEC                                       ; $0DBD9E |
  SBC $72C0,x                               ; $0DBD9F |
  STA $70E2,x                               ; $0DBDA2 |
  LDA $7C16,x                               ; $0DBDA5 |
  SEC                                       ; $0DBDA8 |
  SBC $72C0,x                               ; $0DBDA9 |
  STA $7C16,x                               ; $0DBDAC |

CODE_0DBDAF:
  LDA $7682,x                               ; $0DBDAF |
  SEC                                       ; $0DBDB2 |
  SBC #$0080                                ; $0DBDB3 |
  STA $00                                   ; $0DBDB6 |
  LDA $7222,x                               ; $0DBDB8 |
  BEQ CODE_0DBDC1                           ; $0DBDBB |
  EOR $00                                   ; $0DBDBD |
  BMI CODE_0DBDF3                           ; $0DBDBF |

CODE_0DBDC1:
  LDA $7682,x                               ; $0DBDC1 |
  SEC                                       ; $0DBDC4 |
  SBC #$0020                                ; $0DBDC5 |
  CMP #$00B0                                ; $0DBDC8 |
  BCC CODE_0DBDF3                           ; $0DBDCB |
  STZ $7222,x                               ; $0DBDCD |
  STZ $7542,x                               ; $0DBDD0 |
  LDA $7182,x                               ; $0DBDD3 |
  SEC                                       ; $0DBDD6 |
  SBC $72C2,x                               ; $0DBDD7 |
  STA $7182,x                               ; $0DBDDA |
  LDA $7C18,x                               ; $0DBDDD |
  SEC                                       ; $0DBDE0 |
  SBC $72C2,x                               ; $0DBDE1 |
  STA $7C18,x                               ; $0DBDE4 |
  BRA CODE_0DBDF3                           ; $0DBDE7 |

CODE_0DBDE9:
  JSL $03A2C7                               ; $0DBDE9 |
  BCC CODE_0DBDF3                           ; $0DBDED |
  JML $03A31E                               ; $0DBDEF |

CODE_0DBDF3:
  LDA $0C1C                                 ; $0DBDF3 |
  BEQ CODE_0DBE53                           ; $0DBDF6 |
  CPX $61B6                                 ; $0DBDF8 |
  BNE CODE_0DBE53                           ; $0DBDFB |
  LDY #$00                                  ; $0DBDFD |
  LDA $70E2,x                               ; $0DBDFF |
  SEC                                       ; $0DBE02 |
  SBC $6094                                 ; $0DBE03 |
  SEC                                       ; $0DBE06 |
  SBC #$0008                                ; $0DBE07 |
  BMI CODE_0DBE14                           ; $0DBE0A |
  INY                                       ; $0DBE0C |
  INY                                       ; $0DBE0D |
  SEC                                       ; $0DBE0E |
  SBC #$00E0                                ; $0DBE0F |
  BMI CODE_0DBE53                           ; $0DBE12 |

CODE_0DBE14:
  LDA $7220,x                               ; $0DBE14 |
  BEQ CODE_0DBE22                           ; $0DBE17 |
  SEC                                       ; $0DBE19 |
  SBC $7E28                                 ; $0DBE1A |
  EOR $7220,x                               ; $0DBE1D |
  BMI CODE_0DBE53                           ; $0DBE20 |

CODE_0DBE22:
  LDA $7E28                                 ; $0DBE22 |
  STA $7220,x                               ; $0DBE25 |
  LDA $70E2,x                               ; $0DBE28 |
  SEC                                       ; $0DBE2B |
  SBC $72C0,x                               ; $0DBE2C |
  STA $70E2,x                               ; $0DBE2F |
  LDA $7C16,x                               ; $0DBE32 |
  SEC                                       ; $0DBE35 |
  SBC $72C0,x                               ; $0DBE36 |
  STA $7C16,x                               ; $0DBE39 |
  STZ $72C0,x                               ; $0DBE3C |
  LDA $6094                                 ; $0DBE3F |
  CLC                                       ; $0DBE42 |
  ADC $BD48,y                               ; $0DBE43 |
  STA $70E2,x                               ; $0DBE46 |
  SEP #$20                                  ; $0DBE49 |
  LDA $7E27                                 ; $0DBE4B |
  STA $70E1,x                               ; $0DBE4E |
  REP #$20                                  ; $0DBE51 |

CODE_0DBE53:
  JSL $03AF23                               ; $0DBE53 |
  JSR CODE_0DBF4A                           ; $0DBE57 |
  LDA $75E0,x                               ; $0DBE5A |
  BNE CODE_0DBE71                           ; $0DBE5D |
  LDA $7220,x                               ; $0DBE5F |
  CLC                                       ; $0DBE62 |
  ADC #$0040                                ; $0DBE63 |
  CMP #$0080                                ; $0DBE66 |
  BCS CODE_0DBE71                           ; $0DBE69 |
  STZ $7220,x                               ; $0DBE6B |
  STZ $7540,x                               ; $0DBE6E |

CODE_0DBE71:
  LDA $75E2,x                               ; $0DBE71 |
  BNE CODE_0DBE88                           ; $0DBE74 |
  LDA $7222,x                               ; $0DBE76 |
  CLC                                       ; $0DBE79 |
  ADC #$0040                                ; $0DBE7A |
  CMP #$0080                                ; $0DBE7D |
  BCS CODE_0DBE88                           ; $0DBE80 |
  STZ $7222,x                               ; $0DBE82 |
  STZ $7542,x                               ; $0DBE85 |

CODE_0DBE88:
  LDA $7A98,x                               ; $0DBE88 |
  BNE CODE_0DBECC                           ; $0DBE8B |
  LDA $7402,x                               ; $0DBE8D |
  EOR #$0001                                ; $0DBE90 |
  STA $7402,x                               ; $0DBE93 |
  LDA #$01F8                                ; $0DBE96 |
  JSL $008B21                               ; $0DBE99 |
  LDA #$0002                                ; $0DBE9D |
  STA $73C2,y                               ; $0DBEA0 |
  LDA $10                                   ; $0DBEA3 |
  AND #$0003                                ; $0DBEA5 |
  SEC                                       ; $0DBEA8 |
  SBC #$000A                                ; $0DBEA9 |
  CLC                                       ; $0DBEAC |
  ADC $7CD6,x                               ; $0DBEAD |
  STA $70A2,y                               ; $0DBEB0 |
  LDA $10                                   ; $0DBEB3 |
  AND #$0007                                ; $0DBEB5 |
  SEC                                       ; $0DBEB8 |
  SBC #$000C                                ; $0DBEB9 |
  CLC                                       ; $0DBEBC |
  ADC $7CD8,x                               ; $0DBEBD |
  STA $7142,y                               ; $0DBEC0 |
  LDA #$0008                                ; $0DBEC3 |
  STA $7782,y                               ; $0DBEC6 |
  STA $7A98,x                               ; $0DBEC9 |

CODE_0DBECC:
  LDY $16,x                                 ; $0DBECC |
  BEQ CODE_0DBED6                           ; $0DBECE |
  LDA #$0080                                ; $0DBED0 |
  STA $7AF7,y                               ; $0DBED3 |

CODE_0DBED6:
  LDA $0B57                                 ; $0DBED6 |
  BEQ CODE_0DBEE8                           ; $0DBED9 |
  LDA #$0006                                ; $0DBEDB |
  STA $6F00,x                               ; $0DBEDE |
  LDA #$FFFF                                ; $0DBEE1 |
  STA $0B91,x                               ; $0DBEE4 |
  RTL                                       ; $0DBEE7 |

CODE_0DBEE8:
  LDA $7A96,x                               ; $0DBEE8 |
  BNE CODE_0DBF09                           ; $0DBEEB |
  LDA $7AF6,x                               ; $0DBEED |
  BNE CODE_0DBEF9                           ; $0DBEF0 |
  JSR CODE_0DBF59                           ; $0DBEF2 |
  JML $03A31E                               ; $0DBEF5 |

CODE_0DBEF9:
  LDY #$FF                                  ; $0DBEF9 |
  LDA $7974                                 ; $0DBEFB |
  AND #$0001                                ; $0DBEFE |
  BNE CODE_0DBF05                           ; $0DBF01 |
  LDY #$05                                  ; $0DBF03 |

CODE_0DBF05:
  TYA                                       ; $0DBF05 |
  STA $74A2,x                               ; $0DBF06 |

CODE_0DBF09:
  RTL                                       ; $0DBF09 |

DATA_0DBF0A:         dw $0000, $0300, $FD00, $0000
DATA_0DBF12:         dw $0000, $0200, $FE00, $0000
DATA_0DBF1A:         dw $0000, $0200, $FE00, $0000
DATA_0DBF22:         dw $0000, $0200, $FE00, $0000

DATA_0DBF2A:         dw $0000, $0000, $0000, $0000
DATA_0DBF32:         dw $0300, $0200, $0200, $0200
DATA_0DBF3A:         dw $FD00, $FE00, $FE00, $FE00
DATA_0DBF42:         dw $0000, $0000, $0000, $0000

CODE_0DBF4A:
  LDA $0B57                                 ; $0DBF4A |
  BNE CODE_0DBF59                           ; $0DBF4D |
  LDY $60AB                                 ; $0DBF4F |
  BMI CODE_0DBF59                           ; $0DBF52 |
  LDY $0D94                                 ; $0DBF54 |
  BEQ CODE_0DBF7B                           ; $0DBF57 |

CODE_0DBF59:
  CPX $61B6                                 ; $0DBF59 |
  BNE CODE_0DBF7A                           ; $0DBF5C |
  STZ $61B6                                 ; $0DBF5E |
  STZ $18,x                                 ; $0DBF61 |
  STZ $75E0,x                               ; $0DBF63 |
  STZ $75E2,x                               ; $0DBF66 |
  LDA #$0600                                ; $0DBF69 |
  STA $6FA0,x                               ; $0DBF6C |
  LDA $60AC                                 ; $0DBF6F |
  CMP #$0014                                ; $0DBF72 |
  BEQ CODE_0DBF7A                           ; $0DBF75 |
  STZ $60AC                                 ; $0DBF77 |

CODE_0DBF7A:
  RTS                                       ; $0DBF7A |

CODE_0DBF7B:
  CPX $61B6                                 ; $0DBF7B |
  BNE CODE_0DBFE6                           ; $0DBF7E |
  LDA $60FC                                 ; $0DBF80 |
  AND #$01E0                                ; $0DBF83 |
  BEQ CODE_0DBFD0                           ; $0DBF86 |
  AND #$0180                                ; $0DBF88 |
  DEC A                                     ; $0DBF8B |
  EOR $7220,x                               ; $0DBF8C |
  BPL CODE_0DBFA8                           ; $0DBF8F |
  LDA $70E2,x                               ; $0DBF91 |
  SEC                                       ; $0DBF94 |
  SBC $72C0,x                               ; $0DBF95 |
  STA $70E2,x                               ; $0DBF98 |
  LDA $7C16,x                               ; $0DBF9B |
  SEC                                       ; $0DBF9E |
  SBC $72C0,x                               ; $0DBF9F |
  STA $7C16,x                               ; $0DBFA2 |
  STZ $72C0,x                               ; $0DBFA5 |

CODE_0DBFA8:
  LDA $60FC                                 ; $0DBFA8 |
  AND #$001F                                ; $0DBFAB |
  BEQ CODE_0DBFD0                           ; $0DBFAE |
  AND #$0018                                ; $0DBFB0 |
  DEC A                                     ; $0DBFB3 |
  EOR $7222,x                               ; $0DBFB4 |
  BPL CODE_0DBFD0                           ; $0DBFB7 |
  LDA $7182,x                               ; $0DBFB9 |
  SEC                                       ; $0DBFBC |
  SBC $72C2,x                               ; $0DBFBD |
  STA $7182,x                               ; $0DBFC0 |
  LDA $7C18,x                               ; $0DBFC3 |
  SEC                                       ; $0DBFC6 |
  SBC $72C2,x                               ; $0DBFC7 |
  STA $7C18,x                               ; $0DBFCA |
  STZ $72C2,x                               ; $0DBFCD |

CODE_0DBFD0:
  LDA $7C16,x                               ; $0DBFD0 |
  SEC                                       ; $0DBFD3 |
  SBC $72C0,x                               ; $0DBFD4 |
  STA $7C16,x                               ; $0DBFD7 |
  LDA $7C18,x                               ; $0DBFDA |
  SEC                                       ; $0DBFDD |
  SBC $72C2,x                               ; $0DBFDE |
  STA $7C18,x                               ; $0DBFE1 |
  BRA CODE_0DBFEE                           ; $0DBFE4 |

CODE_0DBFE6:
  LDY $60C0                                 ; $0DBFE6 |
  BNE CODE_0DBFEE                           ; $0DBFE9 |
  JMP CODE_0DBF59                           ; $0DBFEB |

CODE_0DBFEE:
  LDA $0B57                                 ; $0DBFEE |
  BNE CODE_0DC011                           ; $0DBFF1 |
  LDA $7C16,x                               ; $0DBFF3 |
  CLC                                       ; $0DBFF6 |
  ADC #$0010                                ; $0DBFF7 |
  CMP #$0020                                ; $0DBFFA |
  BCS CODE_0DC011                           ; $0DBFFD |
  LDA $7C18,x                               ; $0DBFFF |
  SEC                                       ; $0DC002 |
  SBC $6122                                 ; $0DC003 |
  SEC                                       ; $0DC006 |
  SBC $7BB8,x                               ; $0DC007 |
  BPL CODE_0DC011                           ; $0DC00A |
  CMP #$FFF8                                ; $0DC00C |
  BPL CODE_0DC014                           ; $0DC00F |

CODE_0DC011:
  JMP CODE_0DBF59                           ; $0DC011 |

CODE_0DC014:
  STA $00                                   ; $0DC014 |
  LDY $61B6                                 ; $0DC016 |
  BNE CODE_0DC043                           ; $0DC019 |
  LDA $60FC                                 ; $0DC01B |
  AND #$001F                                ; $0DC01E |
  BEQ CODE_0DC026                           ; $0DC021 |
  JMP CODE_0DBF59                           ; $0DC023 |

CODE_0DC026:
  STX $61B6                                 ; $0DC026 |
  LDA $7C16,x                               ; $0DC029 |
  STA $18,x                                 ; $0DC02C |
  LDY #$02                                  ; $0DC02E |
  STY $60AC                                 ; $0DC030 |
  LDA $60A8                                 ; $0DC033 |
  CMP #$8000                                ; $0DC036 |
  ROR A                                     ; $0DC039 |
  STA $7220,x                               ; $0DC03A |
  LDA #$0060                                ; $0DC03D |
  STA $6FA0,x                               ; $0DC040 |

CODE_0DC043:
  CPX $61B6                                 ; $0DC043 |
  BEQ CODE_0DC049                           ; $0DC046 |
  RTS                                       ; $0DC048 |

CODE_0DC049:
  LDA $6150                                 ; $0DC049 |
  BNE CODE_0DC060                           ; $0DC04C |
  LDA $0035                                 ; $0DC04E |
  AND #$FCFF                                ; $0DC051 |
  STA $617A                                 ; $0DC054 |
  LDA $0037                                 ; $0DC057 |
  AND #$FCFF                                ; $0DC05A |
  STA $617C                                 ; $0DC05D |

CODE_0DC060:
  LDA $60FC                                 ; $0DC060 |
  AND #$0018                                ; $0DC063 |
  BNE CODE_0DC078                           ; $0DC066 |
  LDA $00                                   ; $0DC068 |
  SEC                                       ; $0DC06A |
  ADC $6090                                 ; $0DC06B |
  SEC                                       ; $0DC06E |
  ADC $72C2,x                               ; $0DC06F |
  STA $6090                                 ; $0DC072 |
  INC $61B4                                 ; $0DC075 |

CODE_0DC078:
  LDA $18,x                                 ; $0DC078 |
  CMP #$FFFD                                ; $0DC07A |
  BEQ CODE_0DC087                           ; $0DC07D |
  BPL CODE_0DC085                           ; $0DC07F |
  INC $18,x                                 ; $0DC081 |
  BRA CODE_0DC087                           ; $0DC083 |

CODE_0DC085:
  DEC $18,x                                 ; $0DC085 |

CODE_0DC087:
  LDA $60FC                                 ; $0DC087 |
  AND #$01E0                                ; $0DC08A |
  BNE CODE_0DC09C                           ; $0DC08D |
  LDA $7C16,x                               ; $0DC08F |
  SEC                                       ; $0DC092 |
  SBC $18,x                                 ; $0DC093 |
  CLC                                       ; $0DC095 |
  ADC $608C                                 ; $0DC096 |
  STA $608C                                 ; $0DC099 |

CODE_0DC09C:
  LDA $60D4                                 ; $0DC09C |
  BEQ CODE_0DC0AD                           ; $0DC09F |
  LDA #$0500                                ; $0DC0A1 |
  CLC                                       ; $0DC0A4 |
  ADC $7222,x                               ; $0DC0A5 |
  STA $7222,x                               ; $0DC0A8 |
  BRA CODE_0DC0DD                           ; $0DC0AB |

CODE_0DC0AD:
  LDA $0036                                 ; $0DC0AD |
  AND #$000F                                ; $0DC0B0 |
  ASL A                                     ; $0DC0B3 |
  TAY                                       ; $0DC0B4 |
  LDA $BF0A,y                               ; $0DC0B5 |
  STA $75E0,x                               ; $0DC0B8 |
  BEQ CODE_0DC0CE                           ; $0DC0BB |
  LDA $6150                                 ; $0DC0BD |
  ORA $60DE                                 ; $0DC0C0 |
  BNE CODE_0DC0CE                           ; $0DC0C3 |
  LDA $0036                                 ; $0DC0C5 |
  AND #$0002                                ; $0DC0C8 |
  STA $60C4                                 ; $0DC0CB |

CODE_0DC0CE:
  LDA $BF2A,y                               ; $0DC0CE |
  STA $75E2,x                               ; $0DC0D1 |
  LDA #$0008                                ; $0DC0D4 |
  STA $7540,x                               ; $0DC0D7 |
  STA $7542,x                               ; $0DC0DA |

CODE_0DC0DD:
  STZ $60A8                                 ; $0DC0DD |
  STZ $60B4                                 ; $0DC0E0 |
  STZ $60AA                                 ; $0DC0E3 |
  STZ $608A                                 ; $0DC0E6 |
  STZ $608E                                 ; $0DC0E9 |
  STZ $60D4                                 ; $0DC0EC |
  RTS                                       ; $0DC0EF |
  LDY $7D36,x                               ; $0DC0F0 |
  DEY                                       ; $0DC0F3 |
  BMI CODE_0DC14A                           ; $0DC0F4 |
  LDA $6F00,y                               ; $0DC0F6 |
  CMP #$0010                                ; $0DC0F9 |
  BNE CODE_0DC13E                           ; $0DC0FC |
  TYX                                       ; $0DC0FE |
  JSL $04906C                               ; $0DC0FF |
  BEQ CODE_0DC10B                           ; $0DC103 |
  JSL $0EBE8D                               ; $0DC105 |
  BNE CODE_0DC118                           ; $0DC109 |

CODE_0DC10B:
  LDX $12                                   ; $0DC10B |
  LDA $6FA0,x                               ; $0DC10D |
  ORA #$0200                                ; $0DC110 |
  STA $6FA0,x                               ; $0DC113 |
  SEC                                       ; $0DC116 |
  RTL                                       ; $0DC117 |

CODE_0DC118:
  LDA $7D38,x                               ; $0DC118 |
  BEQ CODE_0DC13E                           ; $0DC11B |
  LDA $7360,x                               ; $0DC11D |
  CMP #$0022                                ; $0DC120 |
  BCC CODE_0DC12A                           ; $0DC123 |
  CMP #$002C                                ; $0DC125 |
  BCS CODE_0DC132                           ; $0DC128 |

CODE_0DC12A:
  LDA $7542,x                               ; $0DC12A |
  CMP #$0040                                ; $0DC12D |
  BCC CODE_0DC136                           ; $0DC130 |

CODE_0DC132:
  JSL $03B25B                               ; $0DC132 |

CODE_0DC136:
  LDX $12                                   ; $0DC136 |
  JSL $03B25B                               ; $0DC138 |
  SEC                                       ; $0DC13C |
  RTL                                       ; $0DC13D |

CODE_0DC13E:
  LDX $12                                   ; $0DC13E |
  PLA                                       ; $0DC140 |
  STA $00                                   ; $0DC141 |
  JSL $03A5B7                               ; $0DC143 |
  LDA $00                                   ; $0DC147 |
  PHA                                       ; $0DC149 |

CODE_0DC14A:
  CLC                                       ; $0DC14A |
  RTL                                       ; $0DC14B |
  LDY $7D36,x                               ; $0DC14C |
  DEY                                       ; $0DC14F |
  BMI CODE_0DC14A                           ; $0DC150 |
  LDA $6F00,y                               ; $0DC152 |
  CMP #$0010                                ; $0DC155 |
  BNE CODE_0DC14A                           ; $0DC158 |
  LDA $7D38,y                               ; $0DC15A |
  BEQ CODE_0DC14A                           ; $0DC15D |
  TYX                                       ; $0DC15F |
  JSL $03B24B                               ; $0DC160 |
  BCC CODE_0DC136                           ; $0DC164 |
  LDA $6FA0,x                               ; $0DC166 |
  ORA #$0200                                ; $0DC169 |
  STA $6FA0,x                               ; $0DC16C |
  SEC                                       ; $0DC16F |
  RTL                                       ; $0DC170 |

; normal, stays on ledges, and hopping
init_tap_tap:
  LDA $6FA2,x                               ; $0DC171 |
  STA $7900,x                               ; $0DC174 |
  LDA $7360,x                               ; $0DC177 |
  CMP #$010B                                ; $0DC17A |
  BNE CODE_0DC188                           ; $0DC17D |
  LDA #$000D                                ; $0DC17F |
  STA $7402,x                               ; $0DC182 |
  INC $7A36,x                               ; $0DC185 |

CODE_0DC188:
  RTL                                       ; $0DC188 |

DATA_0DC189:         dw $C389
DATA_0DC18B:         dw $C3EE
DATA_0DC18D:         dw $C41E
DATA_0DC18F:         dw $C496
DATA_0DC191:         dw $C4CE
DATA_0DC193:         dw $C505

DATA_0DC195:         dw $FE88, $0178, $FE00, $0200
DATA_0DC19D:         dw $0180, $FE80, $FF80, $0080

; normal, stays on ledges, and hopping
main_tap_tap:
  LDY $7402,x                               ; $0DC1A5 |
  CPY #$0E                                  ; $0DC1A8 |
  BNE CODE_0DC1C6                           ; $0DC1AA |
  JSL $03AA2E                               ; $0DC1AC |
  REP #$10                                  ; $0DC1B0 |
  LDY $7362,x                               ; $0DC1B2 |
  LDA #$8000                                ; $0DC1B5 |
  STA $6008,y                               ; $0DC1B8 |
  STA $6010,y                               ; $0DC1BB |
  STA $6018,y                               ; $0DC1BE |
  STA $6020,y                               ; $0DC1C1 |
  SEP #$10                                  ; $0DC1C4 |

CODE_0DC1C6:
  LDA $6F00,x                               ; $0DC1C6 |
  CMP #$0008                                ; $0DC1C9 |
  BEQ CODE_0DC1D1                           ; $0DC1CC |
  JMP CODE_0DC273                           ; $0DC1CE |

CODE_0DC1D1:
  LDA #$0010                                ; $0DC1D1 |
  STA $6F00,x                               ; $0DC1D4 |
  STZ $6168                                 ; $0DC1D7 |
  LDA #$0005                                ; $0DC1DA |
  STA $74A2,x                               ; $0DC1DD |
  LDA $7042,x                               ; $0DC1E0 |
  AND #$FF3F                                ; $0DC1E3 |
  STA $7042,x                               ; $0DC1E6 |
  LDY #$02                                  ; $0DC1E9 |
  LDA $6150                                 ; $0DC1EB |
  CMP #$0003                                ; $0DC1EE |
  BMI CODE_0DC1F5                           ; $0DC1F1 |
  INY                                       ; $0DC1F3 |
  INY                                       ; $0DC1F4 |

CODE_0DC1F5:
  STY $6150                                 ; $0DC1F5 |
  LDA $7040,x                               ; $0DC1F8 |
  ORA #$0004                                ; $0DC1FB |
  STA $7040,x                               ; $0DC1FE |
  CPY #$02                                  ; $0DC201 |
  BEQ CODE_0DC217                           ; $0DC203 |
  LDY $77C3,x                               ; $0DC205 |
  BEQ CODE_0DC217                           ; $0DC208 |
  LDA #$FD00                                ; $0DC20A |
  STA $7222,x                               ; $0DC20D |
  LDY #$05                                  ; $0DC210 |
  LDA #$000A                                ; $0DC212 |
  BRA CODE_0DC268                           ; $0DC215 |

CODE_0DC217:
  LDY $77C2,x                               ; $0DC217 |
  TYA                                       ; $0DC21A |
  STA $7400,x                               ; $0DC21B |
  LDA #$0020                                ; $0DC21E |
  STA $7540,x                               ; $0DC221 |
  LDA $C19D,y                               ; $0DC224 |
  STA $7220,x                               ; $0DC227 |
  LDA $C1A1,y                               ; $0DC22A |
  STA $00                                   ; $0DC22D |
  LDA #$01E0                                ; $0DC22F |
  JSL $008B21                               ; $0DC232 |
  LDA $70E2,x                               ; $0DC236 |
  STA $70A2,y                               ; $0DC239 |
  LDA $7182,x                               ; $0DC23C |
  CLC                                       ; $0DC23F |
  ADC #$000C                                ; $0DC240 |
  STA $7142,y                               ; $0DC243 |
  LDA #$0004                                ; $0DC246 |
  STA $7782,y                               ; $0DC249 |
  STA $7E4C,y                               ; $0DC24C |
  LDA $00                                   ; $0DC24F |
  STA $71E0,y                               ; $0DC251 |
  LDA #$FF80                                ; $0DC254 |
  STA $71E2,y                               ; $0DC257 |
  LDA $7400,x                               ; $0DC25A |
  EOR #$0002                                ; $0DC25D |
  STA $73C0,y                               ; $0DC260 |
  LDY #$04                                  ; $0DC263 |
  LDA #$0006                                ; $0DC265 |

CODE_0DC268:
  STY $76,x                                 ; $0DC268 |
  STA $7402,x                               ; $0DC26A |
  STZ $7A98,x                               ; $0DC26D |
  PLA                                       ; $0DC270 |
  PLY                                       ; $0DC271 |
  RTL                                       ; $0DC272 |

CODE_0DC273:
  JSL $03AF23                               ; $0DC273 |
  LDY $7D36,x                               ; $0DC277 |
  BNE CODE_0DC27F                           ; $0DC27A |

CODE_0DC27C:
  JMP CODE_0DC315                           ; $0DC27C |

CODE_0DC27F:
  DEY                                       ; $0DC27F |
  BPL CODE_0DC285                           ; $0DC280 |
  JMP CODE_0DC311                           ; $0DC282 |

CODE_0DC285:
  LDA $6F00,y                               ; $0DC285 |
  CMP #$0010                                ; $0DC288 |
  BNE CODE_0DC27C                           ; $0DC28B |
  LDA $7D38,y                               ; $0DC28D |
  BEQ CODE_0DC27C                           ; $0DC290 |
  STZ $7902,x                               ; $0DC292 |
  LDA #$0008                                ; $0DC295 |
  STA $7540,x                               ; $0DC298 |
  LDA $7542,y                               ; $0DC29B |
  CMP #$0040                                ; $0DC29E |
  BPL CODE_0DC2AC                           ; $0DC2A1 |
  INC $7902,x                               ; $0DC2A3 |
  LDA #$FD00                                ; $0DC2A6 |
  STA $7222,x                               ; $0DC2A9 |

CODE_0DC2AC:
  LDA $7220,y                               ; $0DC2AC |
  PHP                                       ; $0DC2AF |
  TYX                                       ; $0DC2B0 |
  JSL $03B25B                               ; $0DC2B1 |
  LDY #$00                                  ; $0DC2B5 |
  PLP                                       ; $0DC2B7 |
  BMI CODE_0DC2BC                           ; $0DC2B8 |
  INY                                       ; $0DC2BA |
  INY                                       ; $0DC2BB |

CODE_0DC2BC:
  STY $78,x                                 ; $0DC2BC |
  TYA                                       ; $0DC2BE |
  LDY $7902,x                               ; $0DC2BF |
  BEQ CODE_0DC2C8                           ; $0DC2C2 |
  CLC                                       ; $0DC2C4 |
  ADC #$0004                                ; $0DC2C5 |

CODE_0DC2C8:
  TAY                                       ; $0DC2C8 |
  LDA $C195,y                               ; $0DC2C9 |
  STA $7220,x                               ; $0DC2CC |
  LDA #$002E                                ; $0DC2CF |\ play sound #$002E
  JSL $0085D2                               ; $0DC2D2 |/
  LDA #$01EF                                ; $0DC2D6 |
  JSL $008B21                               ; $0DC2D9 |
  LDA $7CD6,x                               ; $0DC2DD |
  STA $70A2,y                               ; $0DC2E0 |
  LDA $7CD8,x                               ; $0DC2E3 |
  STA $7142,y                               ; $0DC2E6 |
  LDA #$0005                                ; $0DC2E9 |
  STA $73C2,y                               ; $0DC2EC |
  ASL A                                     ; $0DC2EF |
  STA $7402,x                               ; $0DC2F0 |
  LDA #$0002                                ; $0DC2F3 |
  STA $7782,y                               ; $0DC2F6 |
  STA $76,x                                 ; $0DC2F9 |
  LDA $7722,x                               ; $0DC2FB |
  BPL CODE_0DC315                           ; $0DC2FE |
  JSL $03AD24                               ; $0DC300 |
  BCC CODE_0DC315                           ; $0DC304 |
  STZ $7A38,x                               ; $0DC306 |
  LDA #$000E                                ; $0DC309 |
  STA $7402,x                               ; $0DC30C |
  BRA CODE_0DC315                           ; $0DC30F |

CODE_0DC311:
  JSL $03A858                               ; $0DC311 |

CODE_0DC315:
  TXY                                       ; $0DC315 |
  LDA $76,x                                 ; $0DC316 |
  ASL A                                     ; $0DC318 |
  TAX                                       ; $0DC319 |
  JSR ($C189,x)                             ; $0DC31A |
  LDA $7900,x                               ; $0DC31D |
  LDY $76,x                                 ; $0DC320 |
  CPY #$02                                  ; $0DC322 |
  BMI CODE_0DC329                           ; $0DC324 |
  LDA #$0841                                ; $0DC326 |

CODE_0DC329:
  STA $6FA2,x                               ; $0DC329 |
  JSR CODE_0DC330                           ; $0DC32C |
  RTL                                       ; $0DC32F |

CODE_0DC330:
  LDY $7402,x                               ; $0DC330 |
  CPY #$0E                                  ; $0DC333 |
  BEQ CODE_0DC341                           ; $0DC335 |
  LDA $7722,x                               ; $0DC337 |
  BMI CODE_0DC37A                           ; $0DC33A |
  JSL $03AEFD                               ; $0DC33C |
  RTS                                       ; $0DC340 |

CODE_0DC341:
  LDA #$5000                                ; $0DC341 |
  STA $3018                                 ; $0DC344 |
  LDA #$0054                                ; $0DC347 |
  STA $301A                                 ; $0DC34A |
  LDA $7A38,x                               ; $0DC34D |
  LSR A                                     ; $0DC350 |
  STA $300A                                 ; $0DC351 |
  LDA #$0100                                ; $0DC354 |
  STA $300C                                 ; $0DC357 |
  LDY $7722,x                               ; $0DC35A |
  TYX                                       ; $0DC35D |
  LDA $03A9CE,x                             ; $0DC35E |
  STA $3006                                 ; $0DC362 |
  LDA $03A9EE,x                             ; $0DC365 |
  STA $3004                                 ; $0DC369 |
  LDX #$08                                  ; $0DC36C |
  LDA #$867E                                ; $0DC36E |
  JSL $7EDE44                               ; $0DC371 | GSU init
  LDX $12                                   ; $0DC375 |
  INC $0CF9                                 ; $0DC377 |

CODE_0DC37A:
  RTS                                       ; $0DC37A |

DATA_0DC37B:         dw $FF80, $00C0

DATA_0DC37F:         db $01, $02, $01, $02, $01

DATA_0DC384:         db $0F, $11, $0F, $11, $0F

  TYX                                       ; $0DC389 |
  LDY $7A36,x                               ; $0DC38A |
  BEQ CODE_0DC3C7                           ; $0DC38D |
  LDA $7860,x                               ; $0DC38F |
  AND #$0001                                ; $0DC392 |
  BEQ CODE_0DC3E2                           ; $0DC395 |
  LDA $7A98,x                               ; $0DC397 |
  BNE CODE_0DC3E2                           ; $0DC39A |
  DEC $18,x                                 ; $0DC39C |
  BPL CODE_0DC3B2                           ; $0DC39E |
  LDA #$0005                                ; $0DC3A0 |
  STA $18,x                                 ; $0DC3A3 |
  LDA #$FC00                                ; $0DC3A5 |
  STA $7222,x                               ; $0DC3A8 |
  LDA #$0010                                ; $0DC3AB |
  STA $7402,x                               ; $0DC3AE |
  RTS                                       ; $0DC3B1 |

CODE_0DC3B2:
  LDY $18,x                                 ; $0DC3B2 |
  LDA $C37F,y                               ; $0DC3B4 |
  AND #$00FF                                ; $0DC3B7 |
  STA $7A98,x                               ; $0DC3BA |
  LDA $C384,y                               ; $0DC3BD |
  AND #$00FF                                ; $0DC3C0 |
  STA $7402,x                               ; $0DC3C3 |
  RTS                                       ; $0DC3C6 |

CODE_0DC3C7:
  INC $7402,x                               ; $0DC3C7 |
  LDY $7402,x                               ; $0DC3CA |
  CPY #$04                                  ; $0DC3CD |
  BNE CODE_0DC3E2                           ; $0DC3CF |
  TYA                                       ; $0DC3D1 |
  LSR A                                     ; $0DC3D2 |
  STA $7A98,x                               ; $0DC3D3 |
  LDY $7400,x                               ; $0DC3D6 |
  LDA $C37B,y                               ; $0DC3D9 |
  STA $7220,x                               ; $0DC3DC |
  INC $76,x                                 ; $0DC3DF |
  RTS                                       ; $0DC3E1 |

CODE_0DC3E2:
  CPY #$02                                  ; $0DC3E2 |
  BNE CODE_0DC3ED                           ; $0DC3E4 |
  LDA #$0026                                ; $0DC3E6 |\ play sound #$0026
  JSL $0085D2                               ; $0DC3E9 |/

CODE_0DC3ED:
  RTS                                       ; $0DC3ED |
  TYX                                       ; $0DC3EE |
  LDA $7A98,x                               ; $0DC3EF |
  BNE CODE_0DC41D                           ; $0DC3F2 |
  LDA #$0002                                ; $0DC3F4 |
  STA $7A98,x                               ; $0DC3F7 |
  INC $7402,x                               ; $0DC3FA |
  LDY $7402,x                               ; $0DC3FD |
  CPY #$0A                                  ; $0DC400 |
  BMI CODE_0DC41D                           ; $0DC402 |
  ASL A                                     ; $0DC404 |
  STA $7A98,x                               ; $0DC405 |
  STZ $7402,x                               ; $0DC408 |
  LDY $7A36,x                               ; $0DC40B |
  BEQ CODE_0DC418                           ; $0DC40E |
  LDA #$000D                                ; $0DC410 |
  STA $7402,x                               ; $0DC413 |
  STZ $18,x                                 ; $0DC416 |

CODE_0DC418:
  STZ $7220,x                               ; $0DC418 |
  STZ $76,x                                 ; $0DC41B |

CODE_0DC41D:
  RTS                                       ; $0DC41D |
  TYX                                       ; $0DC41E |
  LDA $7220,x                               ; $0DC41F |
  CLC                                       ; $0DC422 |
  ADC #$0020                                ; $0DC423 |
  CMP #$0040                                ; $0DC426 |
  BCS CODE_0DC452                           ; $0DC429 |
  STZ $7220,x                               ; $0DC42B |
  STZ $7540,x                               ; $0DC42E |
  LDY $7402,x                               ; $0DC431 |
  CPY #$0E                                  ; $0DC434 |
  BNE CODE_0DC43C                           ; $0DC436 |
  JSL $03AEFD                               ; $0DC438 |

CODE_0DC43C:
  STZ $7A38,x                               ; $0DC43C |
  LDA #$000A                                ; $0DC43F |
  STA $7402,x                               ; $0DC442 |
  LDA #$0060                                ; $0DC445 |
  STA $7A98,x                               ; $0DC448 |
  LDY #$06                                  ; $0DC44B |
  STY $16,x                                 ; $0DC44D |
  INC $76,x                                 ; $0DC44F |
  RTS                                       ; $0DC451 |

CODE_0DC452:
  LDA $7220,x                               ; $0DC452 |
  BPL CODE_0DC45B                           ; $0DC455 |
  EOR #$FFFF                                ; $0DC457 |
  INC A                                     ; $0DC45A |

CODE_0DC45B:
  CLC                                       ; $0DC45B |
  ADC #$0080                                ; $0DC45C |
  AND #$FF00                                ; $0DC45F |
  ASL A                                     ; $0DC462 |
  ASL A                                     ; $0DC463 |
  ASL A                                     ; $0DC464 |
  ASL A                                     ; $0DC465 |
  ASL A                                     ; $0DC466 |
  XBA                                       ; $0DC467 |
  STA $00                                   ; $0DC468 |
  LDA $7400,x                               ; $0DC46A |
  EOR $78,x                                 ; $0DC46D |
  BEQ CODE_0DC479                           ; $0DC46F |
  LDA $00                                   ; $0DC471 |
  EOR #$FFFF                                ; $0DC473 |
  INC A                                     ; $0DC476 |
  STA $00                                   ; $0DC477 |

CODE_0DC479:
  LDA $00                                   ; $0DC479 |
  CLC                                       ; $0DC47B |
  ADC $7A38,x                               ; $0DC47C |
  AND #$01FE                                ; $0DC47F |
  STA $7A38,x                               ; $0DC482 |
  JSL $0EC365                               ; $0DC485 |
  RTS                                       ; $0DC489 |

DATA_0DC48A:         db $0D, $0C, $0A, $0B, $0A, $0B

DATA_0DC490:         db $12, $02, $10, $04, $08, $04

  TYX                                       ; $0DC496 |
  LDA $7A98,x                               ; $0DC497 |
  BNE CODE_0DC4CD                           ; $0DC49A |
  DEC $16,x                                 ; $0DC49C |
  BNE CODE_0DC4B9                           ; $0DC49E |
  LDA #$0004                                ; $0DC4A0 |
  STA $7A98,x                               ; $0DC4A3 |
  STZ $7402,x                               ; $0DC4A6 |
  LDY $7A36,x                               ; $0DC4A9 |
  BEQ CODE_0DC4B6                           ; $0DC4AC |
  LDA #$000D                                ; $0DC4AE |
  STA $7402,x                               ; $0DC4B1 |
  STZ $18,x                                 ; $0DC4B4 |

CODE_0DC4B6:
  STZ $76,x                                 ; $0DC4B6 |
  RTS                                       ; $0DC4B8 |

CODE_0DC4B9:
  LDY $16,x                                 ; $0DC4B9 |
  LDA $C489,y                               ; $0DC4BB |
  AND #$00FF                                ; $0DC4BE |
  STA $7402,x                               ; $0DC4C1 |
  LDA $C48F,y                               ; $0DC4C4 |
  AND #$00FF                                ; $0DC4C7 |
  STA $7A98,x                               ; $0DC4CA |

CODE_0DC4CD:
  RTS                                       ; $0DC4CD |
  TYX                                       ; $0DC4CE |
  LDA $7220,x                               ; $0DC4CF |
  BNE CODE_0DC504                           ; $0DC4D2 |

CODE_0DC4D4:
  LDA $7A98,x                               ; $0DC4D4 |
  BNE CODE_0DC4E6                           ; $0DC4D7 |
  STZ $7540,x                               ; $0DC4D9 |
  LDA #$0010                                ; $0DC4DC |
  STA $7A96,x                               ; $0DC4DF |
  INC A                                     ; $0DC4E2 |
  STA $7A98,x                               ; $0DC4E3 |

CODE_0DC4E6:
  LDA $7A96,x                               ; $0DC4E6 |
  BNE CODE_0DC504                           ; $0DC4E9 |
  LDA #$0004                                ; $0DC4EB |
  STA $7A98,x                               ; $0DC4EE |
  STZ $7402,x                               ; $0DC4F1 |
  LDA $7360,x                               ; $0DC4F4 |
  CMP #$010B                                ; $0DC4F7 |
  BNE CODE_0DC502                           ; $0DC4FA |
  LDA #$000D                                ; $0DC4FC |
  STA $7402,x                               ; $0DC4FF |

CODE_0DC502:
  STZ $76,x                                 ; $0DC502 |

CODE_0DC504:
  RTS                                       ; $0DC504 |
  TYX                                       ; $0DC505 |
  LDA $7860,x                               ; $0DC506 |
  BNE CODE_0DC4D4                           ; $0DC509 |
  RTS                                       ; $0DC50B |

; .init_baby_bowser
  RTL                                       ; $0DC50C |

; baby bowser states
DATA_0DC50D:         dw $C7D5				; 00: prepare to jump attack / idle
DATA_0DC50F:         dw $C81A				; 01: jump attack
DATA_0DC511:         dw $C834				; 02: pre-slam flip at apex of jump
DATA_0DC513:         dw $C876				; 03: jump slam
DATA_0DC515:         dw $C916				; 04: idle after slam attack
DATA_0DC517:         dw $C985				; 05: prepare to idle jump
DATA_0DC519:         dw $C9B3				; 06: idle jump to prepare for next slam attack
DATA_0DC51B:         dw $C9E4				; 07:
DATA_0DC51D:         dw $CA06				; 08:
DATA_0DC51F:         dw $CA0E				; 09: idle animations after non-attack (flying off yoshi / hit by eggs)
DATA_0DC521:         dw $CADC				; 0A: hit by yoshi
DATA_0DC523:         dw $CAFD				; 0B: flip around on ground after being hit
DATA_0DC525:         dw $CB4C				; 0C: laying on ground after being hit
DATA_0DC527:         dw $CB6C				; 0D: prepare to jump attack after being hit
DATA_0DC529:         dw $CB82				; 0E: idle after last hit (before cutscene)
DATA_0DC52B:         dw $CBC9				; 0F: idle after last (during cutscene)
DATA_0DC52D:         dw $CC11				; 10: prepare to expand
DATA_0DC52F:         dw $CC28				; 11: fade baby bowser's color to black
DATA_0DC531:         dw $CE3C				; 12: pre-fight cutscene (with kamek)

; midpoint respawn cutscene states
DATA_0DC533:         dw $EBAA				; 13: pre-cutscene idle (without kamek)
DATA_0DC535:         dw $EBE7				; 14: pre-cutscene centering screen on baby bowser (without kamek)
DATA_0DC537:         dw $CE3C				; 15: pre-fight cutscene (without kamek)

; prepare mecha bowser states
DATA_0DC539:         dw $D267				; 16: baby bowser expanding
DATA_0DC53B:         dw $D300				; 17: prepare fight (black screen)
DATA_0DC53D:         dw $D4AC				; 18: prepare fade in (black screen)
DATA_0DC53F:         dw $D617				; 19: idle before fight (no bowser)
DATA_0DC541:         dw $D65E				; 1A: mecha-bowser rising into frame
DATA_0DC543:         dw $D71D				; 1B: idle (summon rocks)
DATA_0DC545:         dw $DA15				; 1C: walk forward

; mecha bowser states
DATA_0DC547:         dw $D77B				; 1D: shoot fireballs
DATA_0DC549:         dw $D913				; 1E: knockback after hit by egg
DATA_0DC54B:         dw $F1A9				; 1F: explode after final hit

; post-fight cutscene states
DATA_0DC54D:         dw $D617				; 20: fade into victory cutscene (no bowser)
DATA_0DC54F:         dw $F32A				; 21: baby bowser falling in frame
DATA_0DC551:         dw $F358				; 22: flopping around on the ground
DATA_0DC553:         dw $F360				; 23: cutscene with kamek
DATA_0DC555:         dw $F383				; 24: unload baby bowser sprite
DATA_0DC557:         dw $F4F7				; 25: prepare stork cutscene
DATA_0DC559:         dw $F5B2				; 26: stork cutscene

main_baby_bowser:
  LDY $76,x                                 ; $0DC55B |
  CPY #$24                                  ; $0DC55D |
  BPL CODE_0DC569                           ; $0DC55F |
  CPY #$21                                  ; $0DC561 |
  BPL CODE_0DC56C                           ; $0DC563 |
  CPY #$16                                  ; $0DC565 |
  BMI CODE_0DC56C                           ; $0DC567 |

CODE_0DC569:
  JMP CODE_0DC5E6                           ; $0DC569 | make baby bowser grow

CODE_0DC56C:
  JSR CODE_0DC5F9                           ; $0DC56C |
  LDY $76,x                                 ; $0DC56F |
  CPY #$21                                  ; $0DC571 |
  BPL CODE_0DC5E6                           ; $0DC573 |
  JSR CODE_0DC64B                           ; $0DC575 |
  LDY $76,x                                 ; $0DC578 |
  CPY #$12                                  ; $0DC57A |
  BPL CODE_0DC5C5                           ; $0DC57C |
  CPY #$0F                                  ; $0DC57E |
  BPL CODE_0DC5A7                           ; $0DC580 |
  LDY #$22                                  ; $0DC582 |
  CPY $095E                                 ; $0DC584 |
  BEQ CODE_0DC59A                           ; $0DC587 |
  STY $095E                                 ; $0DC589 |
  LDY #$04                                  ; $0DC58C |
  STY $011C                                 ; $0DC58E |
  LDA $003B                                 ; $0DC591 |
  ORA #$2000                                ; $0DC594 |
  STA $7EF0                                 ; $0DC597 |

CODE_0DC59A:
  LDX #$0B                                  ; $0DC59A |
  LDA #$96C3                                ; $0DC59C |
  JSL $7EDE44                               ; $0DC59F | GSU init
  LDX $12                                   ; $0DC5A3 |
  BRA CODE_0DC5BF                           ; $0DC5A5 |

CODE_0DC5A7:
  LDY #$69                                  ; $0DC5A7 |
  STY $095E                                 ; $0DC5A9 |
  LDY #$02                                  ; $0DC5AC |
  STY $011C                                 ; $0DC5AE |
  LDA #$0017                                ; $0DC5B1 |
  LDY $0D0F                                 ; $0DC5B4 |
  BNE CODE_0DC5BC                           ; $0DC5B7 |
  LDA #$0413                                ; $0DC5B9 |

CODE_0DC5BC:
  STA $0967                                 ; $0DC5BC |

CODE_0DC5BF:
  JSL $03AF23                               ; $0DC5BF |
  BRA CODE_0DC5D8                           ; $0DC5C3 |

CODE_0DC5C5:
  LDA $61B0                                 ; $0DC5C5 |
  ORA $0B55                                 ; $0DC5C8 |
  ORA $0398                                 ; $0DC5CB |
  BEQ CODE_0DC5D8                           ; $0DC5CE |
  JSL $03B697                               ; $0DC5D0 |
  JSL $03B716                               ; $0DC5D4 |

CODE_0DC5D8:
  LDY $76,x                                 ; $0DC5D8 |
  CPY #$0A                                  ; $0DC5DA |
  BPL CODE_0DC5F0                           ; $0DC5DC |
  JSR CODE_0DC6CE                           ; $0DC5DE | baby bowser attack
  JSR CODE_0DC77A                           ; $0DC5E1 |
  BRA CODE_0DC5F0                           ; $0DC5E4 |

; make baby bowser grow
CODE_0DC5E6:
  LDA #$0011                                ; $0DC5E6 |
  STA $0B83                                 ; $0DC5E9 |
  JSL $03AF23                               ; $0DC5EC |

CODE_0DC5F0:
  TXY                                       ; $0DC5F0 |
  LDA $76,x                                 ; $0DC5F1 |
  ASL A                                     ; $0DC5F3 |
  TAX                                       ; $0DC5F4 |
  JSR ($C50D,x)                             ; $0DC5F5 |
  RTL                                       ; $0DC5F8 |

CODE_0DC5F9:
  LDA $7362,x                               ; $0DC5F9 |
  BMI CODE_0DC642                           ; $0DC5FC |
  LDY $74A2,x                               ; $0DC5FE |
  BMI CODE_0DC642                           ; $0DC601 |
  LDA $7680,x                               ; $0DC603 |
  STA $3002                                 ; $0DC606 |
  LDA $7682,x                               ; $0DC609 |
  STA $3004                                 ; $0DC60C |
  LDA $7402,x                               ; $0DC60F |
  STA $3006                                 ; $0DC612 |
  LDA $7362,x                               ; $0DC615 |
  STA $3008                                 ; $0DC618 |
  LDA $7400,x                               ; $0DC61B |
  STA $3010                                 ; $0DC61E | r8
  TXA                                       ; $0DC621 |
  STA $3014                                 ; $0DC622 | r10
  LDA #$000B                                ; $0DC625 |
  STA $3018                                 ; $0DC628 | r12
  LDA #$DFA5                                ; $0DC62B |
  STA $301C                                 ; $0DC62E | r14
  LDA #$000D                                ; $0DC631 |
  STA $3000                                 ; $0DC634 | r0
  LDX #$08                                  ; $0DC637 |
  LDA #$A16C                                ; $0DC639 |
  JSL $7EDE44                               ; $0DC63C | GSU init
  LDX $12                                   ; $0DC640 |

CODE_0DC642:
  RTS                                       ; $0DC642 |

DATA_0DC643:         dw $0008, $FFE8

DATA_0DC647:         dw $FD00, $0300

CODE_0DC64B:
  LDY $60D4                                 ; $0DC64B |
  BEQ CODE_0DC670                           ; $0DC64E |
  LDA $60FC                                 ; $0DC650 |
  AND #$0007                                ; $0DC653 |
  BEQ CODE_0DC670                           ; $0DC656 |
  LDY $1064                                 ; $0DC658 |
  BNE CODE_0DC673                           ; $0DC65B |
  INC $1064                                 ; $0DC65D |
  STZ $0A                                   ; $0DC660 |
  LDA #$0010                                ; $0DC662 |
  STA $0C                                   ; $0DC665 |
  LDA $611C                                 ; $0DC667 |
  STA $02                                   ; $0DC66A |
  JSR CODE_0DC674                           ; $0DC66C |
  RTS                                       ; $0DC66F |

CODE_0DC670:
  STZ $1064                                 ; $0DC670 |

CODE_0DC673:
  RTS                                       ; $0DC673 |

CODE_0DC674:
  LDA #$0002                                ; $0DC674 |
  STA $00                                   ; $0DC677 |
  STZ $06                                   ; $0DC679 |
  LDY #$00                                  ; $0DC67B |

CODE_0DC67D:
  STY $06                                   ; $0DC67D |
  LDY $00                                   ; $0DC67F |
  LDA $02                                   ; $0DC681 |
  CLC                                       ; $0DC683 |
  ADC $C643,y                               ; $0DC684 |
  STA $02                                   ; $0DC687 |
  LDA $C647,y                               ; $0DC689 |
  STA $04                                   ; $0DC68C |
  TXA                                       ; $0DC68E |
  SEC                                       ; $0DC68F |
  SBC #$0004                                ; $0DC690 |
  TAY                                       ; $0DC693 |
  LDA #$0128                                ; $0DC694 |
  JSL $03A34E                               ; $0DC697 |
  BCC CODE_0DC6CD                           ; $0DC69B |
  LDA $02                                   ; $0DC69D |
  STA $70E2,y                               ; $0DC69F |
  LDA #$07B8                                ; $0DC6A2 |
  STA $7182,y                               ; $0DC6A5 |
  LDA $04                                   ; $0DC6A8 |
  STA $7220,y                               ; $0DC6AA |
  LDA $00                                   ; $0DC6AD |
  STA $7400,y                               ; $0DC6AF |
  LDA $0A                                   ; $0DC6B2 |
  STA $7AF6,y                               ; $0DC6B4 |
  LDA $0C                                   ; $0DC6B7 |
  STA $7AF8,y                               ; $0DC6B9 |
  LDA $06                                   ; $0DC6BC |
  STA $7A36,y                               ; $0DC6BE |
  DEC $00                                   ; $0DC6C1 |
  DEC $00                                   ; $0DC6C3 |
  BPL CODE_0DC67D                           ; $0DC6C5 |
  TYA                                       ; $0DC6C7 |
  LDY $06                                   ; $0DC6C8 |
  STA $7A36,y                               ; $0DC6CA |

CODE_0DC6CD:
  RTS                                       ; $0DC6CD |

CODE_0DC6CE:
  LDA $7AF8,x                               ; $0DC6CE |
  BNE CODE_0DC6CD                           ; $0DC6D1 |
  LDY $7D36,x                               ; $0DC6D3 |
  BPL CODE_0DC6CD                           ; $0DC6D6 |
  LDA $7C18,x                               ; $0DC6D8 |
  SEC                                       ; $0DC6DB |
  SBC $6122                                 ; $0DC6DC |
  SEC                                       ; $0DC6DF |
  SBC $7BB8,x                               ; $0DC6E0 |
  CMP #$FFF8                                ; $0DC6E3 |
  BCC CODE_0DC737                           ; $0DC6E6 |
  LDY $60AB                                 ; $0DC6E8 |
  BMI CODE_0DC6CD                           ; $0DC6EB |
  LDY $60C0                                 ; $0DC6ED |
  BEQ CODE_0DC6CD                           ; $0DC6F0 |
  STZ $60D4                                 ; $0DC6F2 |
  LDA #$FA00                                ; $0DC6F5 |
  STA $60AA                                 ; $0DC6F8 |
  LDA #$0006                                ; $0DC6FB |
  STA $60C0                                 ; $0DC6FE |
  LDA #$001C                                ; $0DC701 |\ play sound #$001C
  JSL $0085D2                               ; $0DC704 | play sound #$001C/
  LDY $76,x                                 ; $0DC708 |
  CPY #$0A                                  ; $0DC70A |
  BPL CODE_0DC6CD                           ; $0DC70C |
  STZ $7220,x                               ; $0DC70E |
  STZ $7222,x                               ; $0DC711 |
  LDA #$002E                                ; $0DC714 |
  STA $7402,x                               ; $0DC717 |
  LDA #$0008                                ; $0DC71A |
  STA $7A98,x                               ; $0DC71D |
  LDA #$003B                                ; $0DC720 |
  STA $7A36,x                               ; $0DC723 |
  LDA #$003D                                ; $0DC726 |
  STA $7A38,x                               ; $0DC729 |
  LDA #$0001                                ; $0DC72C |
  STA $7900,x                               ; $0DC72F |
  LDY #$07                                  ; $0DC732 |
  STY $76,x                                 ; $0DC734 |
  RTS                                       ; $0DC736 |

CODE_0DC737:
  LDY $76,x                                 ; $0DC737 |
  CPY #$03                                  ; $0DC739 |
  BEQ CODE_0DC742                           ; $0DC73B |
  JSL $03A858                               ; $0DC73D |
  RTS                                       ; $0DC741 |

CODE_0DC742:
  LDA $61B2                                 ; $0DC742 |
  BPL CODE_0DC751                           ; $0DC745 |
  JSL $06D10C                               ; $0DC747 |
  LDA #$0040                                ; $0DC74B |
  STA $7AF8                                 ; $0DC74E |

CODE_0DC751:
  LDA #$000A                                ; $0DC751 |
  STA $6F00,x                               ; $0DC754 |
  TXA                                       ; $0DC757 |
  STA $7E48                                 ; $0DC758 |
  STZ $1060                                 ; $0DC75B |
  STZ $18,x                                 ; $0DC75E |
  LDA #$8000                                ; $0DC760 |
  STA $0390                                 ; $0DC763 |
  LDA #$FFFF                                ; $0DC766 |
  STA $0CD0                                 ; $0DC769 |
  LDA #$0020                                ; $0DC76C |
  STA $0CC8                                 ; $0DC76F |
  LDA #$008B                                ; $0DC772 |\ play sound #$008B
  JSL $0085D2                               ; $0DC775 | play sound #$008B/

CODE_0DC779:
  RTS                                       ; $0DC779 |

CODE_0DC77A:
  LDY $7D36,x                               ; $0DC77A |
  DEY                                       ; $0DC77D |
  BMI CODE_0DC779                           ; $0DC77E |
  LDA $6F00,y                               ; $0DC780 |
  CMP #$0010                                ; $0DC783 |
  BNE CODE_0DC779                           ; $0DC786 |
  LDA $7D38,y                               ; $0DC788 |
  BEQ CODE_0DC779                           ; $0DC78B |
  LDA $7220,y                               ; $0DC78D |
  STA $00                                   ; $0DC790 |
  TYX                                       ; $0DC792 |
  JSL $03B24B                               ; $0DC793 |
  LDY $76,x                                 ; $0DC797 |
  CPY #$07                                  ; $0DC799 |
  BPL CODE_0DC779                           ; $0DC79B |
  LDA #$0080                                ; $0DC79D |
  LDY $01                                   ; $0DC7A0 |
  BPL CODE_0DC7A7                           ; $0DC7A2 |
  LDA #$FF80                                ; $0DC7A4 |

CODE_0DC7A7:
  STA $7220,x                               ; $0DC7A7 |
  STA $75E0,x                               ; $0DC7AA |
  LDA #$0040                                ; $0DC7AD |
  STA $7542,x                               ; $0DC7B0 |

CODE_0DC7B3:
  STZ $16,x                                 ; $0DC7B3 |
  LDA #$0026                                ; $0DC7B5 |
  STA $7402,x                               ; $0DC7B8 |
  STZ $7A98,x                               ; $0DC7BB |

CODE_0DC7BE:
  LDA #$003D                                ; $0DC7BE |
  STA $7A36,x                               ; $0DC7C1 |
  LDA #$003F                                ; $0DC7C4 |
  STA $7A38,x                               ; $0DC7C7 |
  LDA #$0001                                ; $0DC7CA |
  STA $7900,x                               ; $0DC7CD |
  LDY #$09                                  ; $0DC7D0 |
  STY $76,x                                 ; $0DC7D2 |
  RTS                                       ; $0DC7D4 |

; state 0x00 - prepare to jump attack / idle
  TYX                                       ; $0DC7D5 |
  LDY $77C2,x                               ; $0DC7D6 |
  TYA                                       ; $0DC7D9 |
  STA $7400,x                               ; $0DC7DA |
  LDA $7A98,x                               ; $0DC7DD |
  BNE CODE_0DC819                           ; $0DC7E0 |
  INC $76,x                                 ; $0DC7E2 |

CODE_0DC7E4:
  LDA $7C16,x                               ; $0DC7E4 |
  STA $3000                                 ; $0DC7E7 |
  LDA #$F880                                ; $0DC7EA |
  STA $300C                                 ; $0DC7ED |
  LDX #$0B                                  ; $0DC7F0 |
  LDA #$86B6                                ; $0DC7F2 |
  JSL $7EDE44                               ; $0DC7F5 | GSU init
  LDX $12                                   ; $0DC7F9 |
  LDA $3000                                 ; $0DC7FB |
  STA $7220,x                               ; $0DC7FE |
  LDA #$F800                                ; $0DC801 |
  STA $7222,x                               ; $0DC804 |
  LDA #$0017                                ; $0DC807 |
  STA $7A36,x                               ; $0DC80A |
  LDA #$001A                                ; $0DC80D |
  STA $7A38,x                               ; $0DC810 |
  LDA #$0001                                ; $0DC813 |
  STA $7900,x                               ; $0DC816 |

CODE_0DC819:
  RTS                                       ; $0DC819 |

; state 0x01 - jump attack
  JSR CODE_0DCF8F                           ; $0DC81A |
  BCC CODE_0DC833                           ; $0DC81D |
  LDA #$001A                                ; $0DC81F |
  STA $7A36,x                               ; $0DC822 |
  LDA #$0022                                ; $0DC825 |
  STA $7A38,x                               ; $0DC828 |
  LDA #$0001                                ; $0DC82B |
  STA $7900,x                               ; $0DC82E |
  INC $76,x                                 ; $0DC831 |

CODE_0DC833:
  RTS                                       ; $0DC833 |

; state 0x02 - pre-slam flip at apex of jump
  TYX                                       ; $0DC834 |
  LDY $7223,x                               ; $0DC835 |
  BMI CODE_0DC875                           ; $0DC838 |
  LDY $7542,x                               ; $0DC83A |
  BEQ CODE_0DC846                           ; $0DC83D |
  LDA #$008B                                ; $0DC83F |\ play sound #$008B
  JSL $0085D2                               ; $0DC842 | play sound #$008B/

CODE_0DC846:
  STZ $7222,x                               ; $0DC846 |
  STZ $7542,x                               ; $0DC849 |
  STZ $7220,x                               ; $0DC84C |
  TXY                                       ; $0DC84F |
  JSR CODE_0DCF8F                           ; $0DC850 |
  BCC CODE_0DC875                           ; $0DC853 |
  STZ $1066                                 ; $0DC855 |
  LDA #$0800                                ; $0DC858 |
  STA $7222,x                               ; $0DC85B |
  STZ $7542,x                               ; $0DC85E |
  LDA #$005B                                ; $0DC861 |
  STA $7A36,x                               ; $0DC864 |
  LDA #$005E                                ; $0DC867 |
  STA $7A38,x                               ; $0DC86A |
  LDA #$0001                                ; $0DC86D |
  STA $7900,x                               ; $0DC870 |
  INC $76,x                                 ; $0DC873 |

CODE_0DC875:
  RTS                                       ; $0DC875 |

; state 0x03 - jump slam
  TYX                                       ; $0DC876 |
  LDA $7860,x                               ; $0DC877 |
  AND #$0001                                ; $0DC87A |
  BNE CODE_0DC8B1                           ; $0DC87D |
  LDA $7974                                 ; $0DC87F |
  AND #$0003                                ; $0DC882 |
  BNE CODE_0DC8B0                           ; $0DC885 |
  LDA #$01DD                                ; $0DC887 |
  JSL $008B21                               ; $0DC88A |
  LDA $10                                   ; $0DC88E |
  AND #$000F                                ; $0DC890 |
  SEC                                       ; $0DC893 |
  SBC #$0007                                ; $0DC894 |
  CLC                                       ; $0DC897 |
  ADC $70E2,x                               ; $0DC898 |
  STA $70A2,y                               ; $0DC89B |
  LDA $7182,x                               ; $0DC89E |
  STA $7142,y                               ; $0DC8A1 |
  LDA #$0004                                ; $0DC8A4 |
  STA $7E4C,y                               ; $0DC8A7 |
  LDA #$0006                                ; $0DC8AA |
  STA $7782,y                               ; $0DC8AD |

CODE_0DC8B0:
  RTS                                       ; $0DC8B0 |

CODE_0DC8B1:
  LDY $1066                                 ; $0DC8B1 |
  BNE CODE_0DC8ED                           ; $0DC8B4 |
  INC $1066                                 ; $0DC8B6 |
  LDA #$0040                                ; $0DC8B9 |
  STA $61C6                                 ; $0DC8BC |
  LDA #$01DC                                ; $0DC8BF |
  JSL $008B21                               ; $0DC8C2 |
  LDA $70E2,x                               ; $0DC8C6 |
  STA $70A2,y                               ; $0DC8C9 |
  LDA $7182,x                               ; $0DC8CC |
  STA $7142,y                               ; $0DC8CF |
  LDA #$0002                                ; $0DC8D2 |
  STA $7782,y                               ; $0DC8D5 |
  LDA #$000B                                ; $0DC8D8 |
  STA $7E4C,y                               ; $0DC8DB |
  LDA #$0010                                ; $0DC8DE |
  STA $0A                                   ; $0DC8E1 |
  STZ $0C                                   ; $0DC8E3 |
  LDA $7CD6,x                               ; $0DC8E5 |
  STA $02                                   ; $0DC8E8 |
  JSR CODE_0DC674                           ; $0DC8EA |

CODE_0DC8ED:
  LDA #$0040                                ; $0DC8ED |
  STA $7542,x                               ; $0DC8F0 |
  TXY                                       ; $0DC8F3 |
  JSR CODE_0DCF8F                           ; $0DC8F4 |
  BCC CODE_0DC915                           ; $0DC8F7 |

CODE_0DC8F9:
  LDA #$0004                                ; $0DC8F9 |
  STA $7A98,x                               ; $0DC8FC |
  LDA #$000B                                ; $0DC8FF |
  STA $7A36,x                               ; $0DC902 |
  LDA #$000F                                ; $0DC905 |
  STA $7A38,x                               ; $0DC908 |
  LDA #$0001                                ; $0DC90B |
  STA $7900,x                               ; $0DC90E |
  LDY #$04                                  ; $0DC911 |
  STY $76,x                                 ; $0DC913 |

CODE_0DC915:
  RTS                                       ; $0DC915 |

; state 0x04 - idle after slam attack
  JSR CODE_0DCF8F                           ; $0DC916 |
  BCS CODE_0DC920                           ; $0DC919 |
  JSR CODE_0DC935                           ; $0DC91B |
  BCC CODE_0DC934                           ; $0DC91E |

CODE_0DC920:
  LDA #$0013                                ; $0DC920 |
  STA $7A36,x                               ; $0DC923 |
  LDA #$0015                                ; $0DC926 |
  STA $7A38,x                               ; $0DC929 |
  LDA #$0001                                ; $0DC92C |
  STA $7900,x                               ; $0DC92F |
  INC $76,x                                 ; $0DC932 |

CODE_0DC934:
  RTS                                       ; $0DC934 |

CODE_0DC935:
  LDY $60D4                                 ; $0DC935 |
  BEQ CODE_0DC94E                           ; $0DC938 |
  LDA $60FC                                 ; $0DC93A |
  AND #$0007                                ; $0DC93D |
  BNE CODE_0DC94E                           ; $0DC940 |
  LDA $7C16,x                               ; $0DC942 |
  CLC                                       ; $0DC945 |
  ADC #$0038                                ; $0DC946 |
  CMP #$0070                                ; $0DC949 |
  BCC CODE_0DC981                           ; $0DC94C |

CODE_0DC94E:
  TXA                                       ; $0DC94E |
  STA $3002                                 ; $0DC94F |
  LDA #$0128                                ; $0DC952 |
  STA $301C                                 ; $0DC955 |
  LDX #$09                                  ; $0DC958 |
  LDA #$8EBF                                ; $0DC95A |
  JSL $7EDE44                               ; $0DC95D | GSU init
  LDX $12                                   ; $0DC961 |
  LDY $3002                                 ; $0DC963 |
  BMI CODE_0DC983                           ; $0DC966 |
  LDA $7CD6,y                               ; $0DC968 |
  SEC                                       ; $0DC96B |
  SBC $7CD6,x                               ; $0DC96C |
  STA $00                                   ; $0DC96F |
  CLC                                       ; $0DC971 |
  ADC #$0038                                ; $0DC972 |
  CMP #$0070                                ; $0DC975 |
  BCS CODE_0DC983                           ; $0DC978 |
  LDA $7220,y                               ; $0DC97A |
  EOR $00                                   ; $0DC97D |
  BPL CODE_0DC983                           ; $0DC97F |

CODE_0DC981:
  SEC                                       ; $0DC981 |
  RTS                                       ; $0DC982 |

CODE_0DC983:
  CLC                                       ; $0DC983 |
  RTS                                       ; $0DC984 |

; state 0x05 - prepare to idle jump
  JSR CODE_0DCF8F                           ; $0DC985 |
  BCS CODE_0DC998                           ; $0DC988 |
  LDY $7402,x                               ; $0DC98A |
  CPY #$09                                  ; $0DC98D |
  BNE CODE_0DC9B2                           ; $0DC98F |
  JSR CODE_0DC935                           ; $0DC991 |
  BCC CODE_0DC9B2                           ; $0DC994 |
  BRA CODE_0DC9CD                           ; $0DC996 |

CODE_0DC998:
  LDA #$FC00                                ; $0DC998 |
  STA $7222,x                               ; $0DC99B |
  LDA #$0015                                ; $0DC99E |
  STA $7A36,x                               ; $0DC9A1 |
  LDA #$0017                                ; $0DC9A4 |
  STA $7A38,x                               ; $0DC9A7 |
  LDA #$0001                                ; $0DC9AA |
  STA $7900,x                               ; $0DC9AD |
  INC $76,x                                 ; $0DC9B0 |

CODE_0DC9B2:
  RTS                                       ; $0DC9B2 |

; state 0x06 - idle jump to prepare for next slam attack
  TYX                                       ; $0DC9B3 |
  LDA $7860,x                               ; $0DC9B4 |
  AND #$0001                                ; $0DC9B7 |
  BEQ CODE_0DC9E3                           ; $0DC9BA |
  JSR CODE_0DCF8F                           ; $0DC9BC |
  BCS CODE_0DC9D4                           ; $0DC9BF |
  LDY $7402,x                               ; $0DC9C1 |
  CPY #$0C                                  ; $0DC9C4 |
  BNE CODE_0DC9E3                           ; $0DC9C6 |
  JSR CODE_0DC935                           ; $0DC9C8 |
  BCC CODE_0DC9E3                           ; $0DC9CB |

CODE_0DC9CD:
  LDA #$0001                                ; $0DC9CD |
  STA $7A98,x                               ; $0DC9D0 |
  RTS                                       ; $0DC9D3 |

CODE_0DC9D4:
  LDY $77C2,x                               ; $0DC9D4 |
  TYA                                       ; $0DC9D7 |
  STA $7400,x                               ; $0DC9D8 |
  LDA #$0002                                ; $0DC9DB |
  STA $7A98,x                               ; $0DC9DE |
  STZ $76,x                                 ; $0DC9E1 |

CODE_0DC9E3:
  RTS                                       ; $0DC9E3 |

; state 0x07
  TYX                                       ; $0DC9E4 |
  LDA $7860,x                               ; $0DC9E5 |
  AND #$0001                                ; $0DC9E8 |
  BEQ CODE_0DC9E3                           ; $0DC9EB |
  JSR CODE_0DCF8F                           ; $0DC9ED |
  BCS CODE_0DCA03                           ; $0DC9F0 |
  LDY $7402,x                               ; $0DC9F2 |
  BNE CODE_0DC9E3                           ; $0DC9F5 |
  LDY $7A98,x                               ; $0DC9F7 |
  CPY #$10                                  ; $0DC9FA |
  BPL CODE_0DC9E3                           ; $0DC9FC |
  JSR CODE_0DC935                           ; $0DC9FE |
  BCC CODE_0DC9E3                           ; $0DCA01 |

CODE_0DCA03:
  JMP CODE_0DCB51                           ; $0DCA03 |

; state 0x08
  JSR CODE_0DCF8F                           ; $0DCA06 |
  BCC CODE_0DCA22                           ; $0DCA09 |
  JMP CODE_0DCB74                           ; $0DCA0B |

; state 0x09 - idle animations after non-attack (flying off yoshi / hit by eggs)
  TYX                                       ; $0DCA0E |
  LDY $7223,x                               ; $0DCA0F |
  BMI CODE_0DC9E3                           ; $0DCA12 |
  LDA $7860,x                               ; $0DCA14 |
  AND #$0001                                ; $0DCA17 |
  BNE CODE_0DCA23                           ; $0DCA1A |
  LDA #$0027                                ; $0DCA1C |
  STA $7402,x                               ; $0DCA1F |

CODE_0DCA22:
  RTS                                       ; $0DCA22 |

CODE_0DCA23:
  JSR CODE_0DCA59                           ; $0DCA23 |
  JSR CODE_0DCA7B                           ; $0DCA26 |
  TXY                                       ; $0DCA29 |
  JSR CODE_0DCF8F                           ; $0DCA2A |
  BCC CODE_0DC9E3                           ; $0DCA2D |
  INC $16,x                                 ; $0DCA2F |
  LDY $16,x                                 ; $0DCA31 |
  CPY #$03                                  ; $0DCA33 |
  BMI CODE_0DCA3D                           ; $0DCA35 |
  STZ $7220,x                               ; $0DCA37 |
  JMP CODE_0DC8F9                           ; $0DCA3A |

CODE_0DCA3D:
  LDA #$FF00                                ; $0DCA3D |
  STA $7222,x                               ; $0DCA40 |
  LDA #$0027                                ; $0DCA43 |
  STA $7402,x                               ; $0DCA46 |
  LDA $75E0,x                               ; $0DCA49 |
  CMP #$8000                                ; $0DCA4C |
  ROR A                                     ; $0DCA4F |
  STA $7220,x                               ; $0DCA50 |
  STA $75E0,x                               ; $0DCA53 |
  JMP CODE_0DC7BE                           ; $0DCA56 |

CODE_0DCA59:
  LDA $7220,x                               ; $0DCA59 |
  STA $3000                                 ; $0DCA5C |
  LDA #$0010                                ; $0DCA5F |
  STA $300C                                 ; $0DCA62 |
  LDX #$0B                                  ; $0DCA65 |
  LDA #$86B6                                ; $0DCA67 |
  JSL $7EDE44                               ; $0DCA6A | GSU init
  LDX $12                                   ; $0DCA6E |
  LDA $7220,x                               ; $0DCA70 |
  SEC                                       ; $0DCA73 |
  SBC $3000                                 ; $0DCA74 |
  STA $7220,x                               ; $0DCA77 |
  RTS                                       ; $0DCA7A |

CODE_0DCA7B:
  LDA $7974                                 ; $0DCA7B |
  AND #$0007                                ; $0DCA7E |
  BNE CODE_0DCADB                           ; $0DCA81 |
  LDA #$001F                                ; $0DCA83 |\ play sound #$001F
  JSL $0085D2                               ; $0DCA86 | play sound #$001F/
  LDA #$FFC0                                ; $0DCA8A |
  LDY $7221,x                               ; $0DCA8D |
  BMI CODE_0DCA95                           ; $0DCA90 |
  LDA #$0040                                ; $0DCA92 |

CODE_0DCA95:
  STA $00                                   ; $0DCA95 |
  LDA #$01D8                                ; $0DCA97 |
  JSL $008B21                               ; $0DCA9A |
  LDA $10                                   ; $0DCA9E |
  AND #$0007                                ; $0DCAA0 |
  SEC                                       ; $0DCAA3 |
  SBC #$0004                                ; $0DCAA4 |
  CLC                                       ; $0DCAA7 |
  ADC $70E2,x                               ; $0DCAA8 |
  STA $70A2,y                               ; $0DCAAB |
  LDA $7182,x                               ; $0DCAAE |
  CLC                                       ; $0DCAB1 |
  ADC #$0010                                ; $0DCAB2 |
  STA $7142,y                               ; $0DCAB5 |
  LDA #$0008                                ; $0DCAB8 |
  STA $7782,y                               ; $0DCABB |
  LDA #$0003                                ; $0DCABE |
  STA $7E4C,y                               ; $0DCAC1 |
  LDA $00                                   ; $0DCAC4 |
  STA $71E0,y                               ; $0DCAC6 |
  LDA #$FF80                                ; $0DCAC9 |
  STA $71E2,y                               ; $0DCACC |
  LDA $77C2,x                               ; $0DCACF |
  AND #$00FF                                ; $0DCAD2 |
  EOR #$0002                                ; $0DCAD5 |
  STA $73C0,y                               ; $0DCAD8 |

CODE_0DCADB:
  RTS                                       ; $0DCADB |

; state 0x0A - hit by yoshi
  JSR CODE_0DCF8F                           ; $0DCADC |
  LDA $7860,x                               ; $0DCADF |
  AND #$0001                                ; $0DCAE2 |
  BEQ CODE_0DCAFB                           ; $0DCAE5 |
  JSR CODE_0DCA59                           ; $0DCAE7 |
  LDY $7402,x                               ; $0DCAEA |
  CPY #$0F                                  ; $0DCAED |
  BNE CODE_0DCAFB                           ; $0DCAEF |
  LDA #$0034                                ; $0DCAF1 |\ play sound #$0034
  JSL $0085D2                               ; $0DCAF4 | play sound #$0034/
  JSR CODE_0DF343                           ; $0DCAF8 |

CODE_0DCAFB:
  BRA CODE_0DCB22                           ; $0DCAFB |

; state 0x0B - flip around on ground after being hit
  TYX                                       ; $0DCAFD |
  JSR CODE_0DCA59                           ; $0DCAFE |
  TXY                                       ; $0DCB01 |
  JSR CODE_0DCF8F                           ; $0DCB02 |
  BCC CODE_0DCB1F                           ; $0DCB05 |
  STZ $7220,x                               ; $0DCB07 |
  INC $1062                                 ; $0DCB0A |
  LDY $1062                                 ; $0DCB0D |
  CPY #$03                                  ; $0DCB10 |
  BMI CODE_0DCB1C                           ; $0DCB12 |
  JSR CODE_0DCB2A                           ; $0DCB14 |
  LDY #$0E                                  ; $0DCB17 |
  STY $76,x                                 ; $0DCB19 |
  RTS                                       ; $0DCB1B |

CODE_0DCB1C:
  JSR CODE_0DCBF6                           ; $0DCB1C |

CODE_0DCB1F:
  JSR CODE_0DCA7B                           ; $0DCB1F |

CODE_0DCB22:
  LDA $7974                                 ; $0DCB22 |
  AND #$0002                                ; $0DCB25 |
  BNE CODE_0DCB3B                           ; $0DCB28 |

CODE_0DCB2A:
  LDX #$1C                                  ; $0DCB2A |

CODE_0DCB2C:
  LDA $702F2C,x                             ; $0DCB2C |
  STA $7021C0,x                             ; $0DCB30 |
  DEX                                       ; $0DCB34 |
  DEX                                       ; $0DCB35 |
  BNE CODE_0DCB2C                           ; $0DCB36 |
  LDX $12                                   ; $0DCB38 |
  RTS                                       ; $0DCB3A |

CODE_0DCB3B:
  LDX #$1C                                  ; $0DCB3B |

CODE_0DCB3D:
  LDA $5FA56E,x                             ; $0DCB3D |
  STA $7021C0,x                             ; $0DCB41 |
  DEX                                       ; $0DCB45 |
  DEX                                       ; $0DCB46 |
  BNE CODE_0DCB3D                           ; $0DCB47 |
  LDX $12                                   ; $0DCB49 |
  RTS                                       ; $0DCB4B |

; state 0x0C - laying on ground after being hit
  JSR CODE_0DCF8F                           ; $0DCB4C |
  BCC CODE_0DCB22                           ; $0DCB4F |

CODE_0DCB51:
  LDA #$0002                                ; $0DCB51 |
  STA $7A98,x                               ; $0DCB54 |
  LDA #$005E                                ; $0DCB57 |
  STA $7A36,x                               ; $0DCB5A |
  LDA #$0061                                ; $0DCB5D |
  STA $7A38,x                               ; $0DCB60 |
  LDA #$0001                                ; $0DCB63 |
  STA $7900,x                               ; $0DCB66 |
  INC $76,x                                 ; $0DCB69 |
  RTS                                       ; $0DCB6B |

; state 0x0D - prepare to jump attack after being hit
  JSR CODE_0DCF8F                           ; $0DCB6C |
  BCC CODE_0DCB22                           ; $0DCB6F |
  JSR CODE_0DCB2A                           ; $0DCB71 |

CODE_0DCB74:
  LDY $77C2,x                               ; $0DCB74 |
  TYA                                       ; $0DCB77 |
  STA $7400,x                               ; $0DCB78 |
  LDY #$01                                  ; $0DCB7B |
  STY $76,x                                 ; $0DCB7D |
  JMP CODE_0DC7E4                           ; $0DCB7F |

; state 0xE - idle after last hit (before cutscene)
  TYX                                       ; $0DCB82 |
  LDA #$0128                                ; $0DCB83 |
  STA $3008                                 ; $0DCB86 |
  INC A                                     ; $0DCB89 |
  STA $300A                                 ; $0DCB8A |
  LDX #$09                                  ; $0DCB8D |
  LDA #$91DB                                ; $0DCB8F |
  JSL $7EDE44                               ; $0DCB92 | GSU init
  LDX $12                                   ; $0DCB96 |
  LDY $300C                                 ; $0DCB98 |
  BNE CODE_0DCBC8                           ; $0DCB9B |
  LDA $7C16,x                               ; $0DCB9D |
  CLC                                       ; $0DCBA0 |
  ADC #$0080                                ; $0DCBA1 |
  CMP #$0100                                ; $0DCBA4 |
  BCS CODE_0DCBC8                           ; $0DCBA7 |
  LDY $61B3                                 ; $0DCBA9 |
  BPL CODE_0DCBC8                           ; $0DCBAC |
  LDA #$0048                                ; $0DCBAE |
  JSL $03A34C                               ; $0DCBB1 |
  BCC CODE_0DCBC8                           ; $0DCBB5 |
  LDA #$0010                                ; $0DCBB7 |
  STA $70E2,y                               ; $0DCBBA |
  INC $1015                                 ; $0DCBBD |
  JSL $0181FB                               ; $0DCBC0 |
  LDX $12                                   ; $0DCBC4 |
  INC $76,x                                 ; $0DCBC6 |

CODE_0DCBC8:
  RTS                                       ; $0DCBC8 |

; state 0x0F - idle after last (during cutscene)
  TYX                                       ; $0DCBC9 |
  LDY $1015                                 ; $0DCBCA |
  BPL CODE_0DCC10                           ; $0DCBCD |
  PHB                                       ; $0DCBCF |
  REP #$10                                  ; $0DCBD0 |
  LDX #$2D6C                                ; $0DCBD2 | destination
  LDY #$2F6C                                ; $0DCBD5 | source
  LDA #$01FF                                ; $0DCBD8 | bytes
  MVN $70, $70                              ; $0DCBDB | bank 70 to 70
  SEP #$10                                  ; $0DCBDE |
  PLB                                       ; $0DCBE0 |
  LDX #$20                                  ; $0DCBE1 |
  LDA #$0000                                ; $0DCBE3 |

CODE_0DCBE6:
  STA $70312A,x                             ; $0DCBE6 |
  DEX                                       ; $0DCBEA |
  DEX                                       ; $0DCBEB |
  BNE CODE_0DCBE6                           ; $0DCBEC |
  LDX $12                                   ; $0DCBEE |
  LDA #$000B                                ; $0DCBF0 |
  STA $004D                                 ; $0DCBF3 |

CODE_0DCBF6:
  LDA #$0030                                ; $0DCBF6 |
  STA $7A98,x                               ; $0DCBF9 |
  LDA #$0056                                ; $0DCBFC |
  STA $7A36,x                               ; $0DCBFF |
  LDA #$005B                                ; $0DCC02 |
  STA $7A38,x                               ; $0DCC05 |
  LDA #$0001                                ; $0DCC08 |
  STA $7900,x                               ; $0DCC0B |
  INC $76,x                                 ; $0DCC0E |

CODE_0DCC10:
  RTS                                       ; $0DCC10 |

; state 0x10 - prepare to expand
  JSR CODE_0DCF8F                           ; $0DCC11 |
  BCC CODE_0DCC27                           ; $0DCC14 |
  STZ $1015                                 ; $0DCC16 |
  STZ $7400,x                               ; $0DCC19 |
  LDA #$0000                                ; $0DCC1C |
  STA $70336C                               ; $0DCC1F |
  STZ $16,x                                 ; $0DCC23 |
  INC $76,x                                 ; $0DCC25 |

CODE_0DCC27:
  RTS                                       ; $0DCC27 |

; state 0x11 - fade baby bowser's color to black
  TYX                                       ; $0DCC28 |
  LDA $7974                                 ; $0DCC29 |
  AND #$0003                                ; $0DCC2C |
  BNE CODE_0DCC7A                           ; $0DCC2F |
  LDA $70336C                               ; $0DCC31 |
  CMP #$0020                                ; $0DCC35 |
  BMI CODE_0DCC47                           ; $0DCC38 |
  LDA #$0048                                ; $0DCC3A |
  STA $18,x                                 ; $0DCC3D |
  INC $0B59                                 ; $0DCC3F |
  LDY #$16                                  ; $0DCC42 |
  STY $76,x                                 ; $0DCC44 |
  RTS                                       ; $0DCC46 |

CODE_0DCC47:
  CMP #$0010                                ; $0DCC47 |
  BMI CODE_0DCC61                           ; $0DCC4A |
  LDY $16,x                                 ; $0DCC4C |
  BNE CODE_0DCC61                           ; $0DCC4E |
  LDA #$00CF                                ; $0DCC50 |
  JSL $03A34C                               ; $0DCC53 |
  BCC CODE_0DCC7A                           ; $0DCC57 |
  LDA #$0002                                ; $0DCC59 |
  STA $7902,y                               ; $0DCC5C |
  STA $16,x                                 ; $0DCC5F |

CODE_0DCC61:
  LDA #$2D6C                                ; $0DCC61 |
  STA $70336E                               ; $0DCC64 |
  LDA #$2F6C                                ; $0DCC68 |
  STA $703370                               ; $0DCC6B |
  LDX #$08                                  ; $0DCC6F |
  LDA #$B4A9                                ; $0DCC71 |
  JSL $7EDE44                               ; $0DCC74 | GSU init
  LDX $12                                   ; $0DCC78 |

CODE_0DCC7A:
  RTS                                       ; $0DCC7A |

; pre-fight cutscene pointers
DATA_0DCC7B:         dw $CF8F, $CFF3, $CFFC, $D011
DATA_0DCC83:         dw $D01D, $D009, $D0A2, $D0A8
DATA_0DCC8B:         dw $D025, $D02B, $D087, $D036
DATA_0DCC93:         dw $D052, $D06E, $D0AE

DATA_0DCC99:         db $0A, $04, $04, $02, $02, $02, $02, $02
DATA_0DCCA1:         db $02, $04, $0A, $02, $02, $02, $04, $08
DATA_0DCCA9:         db $00

DATA_0DCCAA:         dw $0002, $0040, $0000, $0000
DATA_0DCCB2:         dw $0004, $0001, $0000, $0000
DATA_0DCCBA:         dw $0004, $0006, $0010, $0004
DATA_0DCCC2:         dw $0000, $0006, $000B, $0001
DATA_0DCCCA:         dw $0006, $0000, $000B, $000F
DATA_0DCCD2:         dw $0002, $000B, $0010, $000A
DATA_0DCCDA:         dw $0008, $0004, $0113, $000C
DATA_0DCCE2:         dw $0000, $000F, $0013, $0003
DATA_0DCCEA:         dw $000F, $0000, $000B, $000F
DATA_0DCCF2:         dw $0002, $000B, $000E, $0008
DATA_0DCCFA:         dw $0000, $0013, $0015, $0001
DATA_0DCD02:         dw $0013, $0014, $0000, $FC00
DATA_0DCD0A:         dw $0800, $0080, $001A, $0000
DATA_0DCD12:         dw $0015, $0017, $0001, $0015
DATA_0DCD1A:         dw $0014, $FDC0, $F900, $0400
DATA_0DCD22:         dw $0040, $0000, $0017, $001A
DATA_0DCD2A:         dw $0001, $0017, $0016, $0000
DATA_0DCD32:         dw $001A, $0022, $0001, $001A
DATA_0DCD3A:         dw $0014, $0000, $0800, $0400
DATA_0DCD42:         dw $0000, $0018, $0000, $0022
DATA_0DCD4A:         dw $0025, $0001, $0022, $0014
DATA_0DCD52:         dw $0000, $FC00, $0800, $0080
DATA_0DCD5A:         dw $0016, $0000, $001A, $0022
DATA_0DCD62:         dw $0001, $001A, $0014, $0000
DATA_0DCD6A:         dw $0800, $0400, $0000, $0018
DATA_0DCD72:         dw $0000, $0022, $0025, $0001
DATA_0DCD7A:         dw $0022, $0014, $0000, $FC00
DATA_0DCD82:         dw $0800, $0080, $0016, $0000
DATA_0DCD8A:         dw $001A, $0022, $0001, $001A
DATA_0DCD92:         dw $0014, $0000, $0800, $0400
DATA_0DCD9A:         dw $0000, $0018, $0000, $0022
DATA_0DCDA2:         dw $0025, $0001, $0022, $0010
DATA_0DCDAA:         dw $0000, $002F, $0036, $0001
DATA_0DCDB2:         dw $002F, $0012, $0003, $0004
DATA_0DCDBA:         dw $0114, $000C, $0000, $0036
DATA_0DCDC2:         dw $003B, $0001, $0036, $001C
DATA_0DCDCA:         dw $0010, $0014, $FFE0, $0000
DATA_0DCDD2:         dw $0400, $0040, $0000, $0025
DATA_0DCDDA:         dw $0027, $0003, $0025, $0014
DATA_0DCDE2:         dw $0000, $0000, $0400, $0040
DATA_0DCDEA:         dw $000E, $0006, $000C, $0000
DATA_0DCDF2:         dw $0027, $002B, $0003, $0027
DATA_0DCDFA:         dw $0000, $002B, $002F, $0002
DATA_0DCE02:         dw $002B, $001C, $0010, $0014
DATA_0DCE0A:         dw $FFE0, $0000, $0400, $0040
DATA_0DCE12:         dw $0000, $0025, $0027, $0003
DATA_0DCE1A:         dw $0025, $0014, $0000, $0000
DATA_0DCE22:         dw $0400, $0040, $000E, $0006
DATA_0DCE2A:         dw $000C, $0000, $0027, $002B
DATA_0DCE32:         dw $0003, $0027, $000E, $0008
DATA_0DCE3A:         dw $FFFF

; state 0x12 - pre-fight cutscene (with kamek)
; state 0x15 - pre-fight cutscene (without kamek)
  TYX                                       ; $0DCE3C |
  BRA CODE_0DCE63                           ; $0DCE3D |
  LDA #$0048                                ; $0DCE3F |
  STA $18,x                                 ; $0DCE42 |
  LDA #$7FFF                                ; $0DCE44 |
  STA $0948                                 ; $0DCE47 |
  LDA $6094                                 ; $0DCE4A |
  CLC                                       ; $0DCE4D |
  ADC #$0080                                ; $0DCE4E |
  STA $70E2,x                               ; $0DCE51 |
  LDA $609C                                 ; $0DCE54 |
  CLC                                       ; $0DCE57 |
  ADC #$0080                                ; $0DCE58 |
  STA $7182,x                               ; $0DCE5B |
  LDY #$16                                  ; $0DCE5E |
  STY $76,x                                 ; $0DCE60 |
  RTS                                       ; $0DCE62 |

CODE_0DCE63:
  LDA $78,x                                 ; $0DCE63 |
  TAX                                       ; $0DCE65 |
  JSR ($CC7B,x)                             ; $0DCE66 |
  BCC CODE_0DCECC                           ; $0DCE69 |
  REP #$10                                  ; $0DCE6B |
  LDY $18,x                                 ; $0DCE6D |
  LDA $CCA8,y                               ; $0DCE6F |
  BPL CODE_0DCEA1                           ; $0DCE72 |
  SEP #$10                                  ; $0DCE74 |
  STZ $0C1E                                 ; $0DCE76 |
  STZ $60AC                                 ; $0DCE79 |
  LDA #$000C                                ; $0DCE7C |
  STA $004D                                 ; $0DCE7F |
  LDA #$0400                                ; $0DCE82 |
  STA $75E2,x                               ; $0DCE85 |
  LDA #$0040                                ; $0DCE88 |
  STA $7542,x                               ; $0DCE8B |
  STZ $76,x                                 ; $0DCE8E |
  LDX #$1C                                  ; $0DCE90 |

CODE_0DCE92:
  LDA $7021C0,x                             ; $0DCE92 |
  STA $702F2C,x                             ; $0DCE96 |
  DEX                                       ; $0DCE9A |
  DEX                                       ; $0DCE9B |
  BNE CODE_0DCE92                           ; $0DCE9C |
  LDX $12                                   ; $0DCE9E |
  RTS                                       ; $0DCEA0 |

CODE_0DCEA1:
  STA $78,x                                 ; $0DCEA1 |
  PHA                                       ; $0DCEA3 |
  LDA $CCAA,y                               ; $0DCEA4 |
  STA $7A36,x                               ; $0DCEA7 |
  LDA $CCAC,y                               ; $0DCEAA |
  STA $7A38,x                               ; $0DCEAD |
  LDA $CCAE,y                               ; $0DCEB0 |
  STA $7900,x                               ; $0DCEB3 |
  LDA $CCB0,y                               ; $0DCEB6 |
  STA $7902,x                               ; $0DCEB9 |
  PLA                                       ; $0DCEBC |
  LSR A                                     ; $0DCEBD |
  TAY                                       ; $0DCEBE |
  LDA $CC99,y                               ; $0DCEBF |
  AND #$00FF                                ; $0DCEC2 |
  CLC                                       ; $0DCEC5 |
  ADC $18,x                                 ; $0DCEC6 |
  STA $18,x                                 ; $0DCEC8 |
  SEP #$10                                  ; $0DCECA |

CODE_0DCECC:
  RTS                                       ; $0DCECC |

DATA_0DCECD:         db $02, $03, $04, $05, $06, $07, $05, $04
DATA_0DCED5:         db $03, $02, $00, $01, $00, $01, $00, $02
DATA_0DCEDD:         db $03, $02, $00, $08, $09, $0B, $0C, $0B
DATA_0DCEE5:         db $09, $0A, $0E, $0F, $10, $11, $12, $13
DATA_0DCEED:         db $09, $14, $15, $08, $00, $1A, $1B, $1E
DATA_0DCEF5:         db $1F, $1E, $1C, $1D, $1C, $1D, $1C, $16
DATA_0DCEFD:         db $17, $18, $19, $17, $0B, $0C, $1A, $0C
DATA_0DCF05:         db $1A, $0C, $1A, $08, $00, $08, $00, $22
DATA_0DCF0D:         db $23, $22, $23, $22, $24, $25, $24, $09
DATA_0DCF15:         db $13, $12, $11, $10, $0F, $0E, $28, $29
DATA_0DCF1D:         db $2A, $2B, $2A, $2B, $2A, $2B, $2C, $2D
DATA_0DCF25:         db $0E, $08, $00, $15, $08, $00, $08, $0B
DATA_0DCF2D:         db $0C

DATA_0DCF2E:         db $04, $04, $04, $04, $02, $02, $04, $04
DATA_0DCF36:         db $04, $04, $10, $04, $04, $04, $04, $02
DATA_0DCF3E:         db $06, $02, $06, $08, $01, $08, $10, $08
DATA_0DCF46:         db $08, $10, $02, $02, $02, $02, $02, $02
DATA_0DCF4E:         db $02, $10, $04, $04, $04, $08, $08, $02
DATA_0DCF56:         db $06, $02, $06, $04, $04, $04, $04, $10
DATA_0DCF5E:         db $02, $02, $18, $02, $04, $01, $0C, $0C
DATA_0DCF66:         db $04, $04, $10, $04, $50, $08, $01, $20
DATA_0DCF6E:         db $04, $04, $04, $20, $02, $10, $02, $02
DATA_0DCF76:         db $02, $02, $02, $02, $02, $02, $02, $02
DATA_0DCF7E:         db $02, $02, $02, $04, $04, $10, $04, $04
DATA_0DCF86:         db $04, $08, $10, $04, $04, $20, $02, $02
DATA_0DCF8E:         db $02

CODE_0DCF8F:
  TYX                                       ; $0DCF8F |
  LDA $7A98,x                               ; $0DCF90 |
  BNE CODE_0DCFF1                           ; $0DCF93 |
  LDA $7A36,x                               ; $0DCF95 |
  CMP $7A38,x                               ; $0DCF98 |
  BMI CODE_0DCFA5                           ; $0DCF9B |
  DEC $7900,x                               ; $0DCF9D |
  BEQ CODE_0DCFFA                           ; $0DCFA0 |
  LDA $7902,x                               ; $0DCFA2 |

CODE_0DCFA5:
  INC A                                     ; $0DCFA5 |
  STA $7A36,x                               ; $0DCFA6 |
  TAY                                       ; $0DCFA9 |
  LDA $CF2D,y                               ; $0DCFAA |
  AND #$00FF                                ; $0DCFAD |
  STA $7A98,x                               ; $0DCFB0 |
  LDA $CECC,y                               ; $0DCFB3 |
  AND #$00FF                                ; $0DCFB6 |
  STA $7402,x                               ; $0DCFB9 |
  CPY #$05                                  ; $0DCFBC |
  BPL CODE_0DCFCE                           ; $0DCFBE |
  CMP #$0002                                ; $0DCFC0 |
  BNE CODE_0DCFF1                           ; $0DCFC3 |
  LDA #$008D                                ; $0DCFC5 |\ play sound #$008D
  JSL $0085D2                               ; $0DCFC8 | play sound #$008D/
  BRA CODE_0DCFF1                           ; $0DCFCC |

CODE_0DCFCE:
  CPY #$0F                                  ; $0DCFCE |
  BMI CODE_0DCFF1                           ; $0DCFD0 |
  CPY #$14                                  ; $0DCFD2 |
  BPL CODE_0DCFDD                           ; $0DCFD4 |
  CMP #$0003                                ; $0DCFD6 |
  BNE CODE_0DCFF1                           ; $0DCFD9 |
  BRA CODE_0DCFEA                           ; $0DCFDB |

CODE_0DCFDD:
  CPY #$27                                  ; $0DCFDD |
  BMI CODE_0DCFF1                           ; $0DCFDF |
  CPY #$2C                                  ; $0DCFE1 |
  BPL CODE_0DCFF1                           ; $0DCFE3 |
  CMP #$001F                                ; $0DCFE5 |
  BNE CODE_0DCFF1                           ; $0DCFE8 |

CODE_0DCFEA:
  LDA #$008C                                ; $0DCFEA |\ play sound #$008C
  JSL $0085D2                               ; $0DCFED | play sound #$008C/

CODE_0DCFF1:
  CLC                                       ; $0DCFF1 |
  RTS                                       ; $0DCFF2 |
  TYX                                       ; $0DCFF3 |
  LDA $7A36,x                               ; $0DCFF4 |
  STA $61C6                                 ; $0DCFF7 |

CODE_0DCFFA:
  SEC                                       ; $0DCFFA |
  RTS                                       ; $0DCFFB |
  TYX                                       ; $0DCFFC |
  LDA $7A36,x                               ; $0DCFFD |
  STA $704070                               ; $0DD000 |
  INC $0D0F                                 ; $0DD004 |

CODE_0DD007:
  SEC                                       ; $0DD007 |
  RTS                                       ; $0DD008 |
  TYX                                       ; $0DD009 |
  LDA $0D0F                                 ; $0DD00A |
  BNE CODE_0DD007                           ; $0DD00D |
  CLC                                       ; $0DD00F |
  RTS                                       ; $0DD010 |
  TYX                                       ; $0DD011 |
  LDA $704073                               ; $0DD012 |
  TAY                                       ; $0DD016 |
  CPY #$12                                  ; $0DD017 |
  BEQ CODE_0DD007                           ; $0DD019 |
  CLC                                       ; $0DD01B |
  RTS                                       ; $0DD01C |
  TYX                                       ; $0DD01D |
  LDA $0D0F                                 ; $0DD01E |
  BEQ CODE_0DD007                           ; $0DD021 |
  CLC                                       ; $0DD023 |
  RTS                                       ; $0DD024 |
  TYX                                       ; $0DD025 |
  INC $105C                                 ; $0DD026 |

CODE_0DD029:
  SEC                                       ; $0DD029 |
  RTS                                       ; $0DD02A |
  TYX                                       ; $0DD02B |
  LDY $7A36,x                               ; $0DD02C |
  CPY $105C                                 ; $0DD02F |
  BEQ CODE_0DD029                           ; $0DD032 |

CODE_0DD034:
  CLC                                       ; $0DD034 |
  RTS                                       ; $0DD035 |
  TYX                                       ; $0DD036 |
  LDA $7542,x                               ; $0DD037 |
  CLC                                       ; $0DD03A |
  ADC $7222,x                               ; $0DD03B |
  BMI CODE_0DD034                           ; $0DD03E |
  LDA #$008B                                ; $0DD040 |\ play sound #$008B
  JSL $0085D2                               ; $0DD043 | play sound #$008B/
  STZ $7220,x                               ; $0DD047 |
  STZ $7222,x                               ; $0DD04A |
  STZ $7542,x                               ; $0DD04D |
  SEC                                       ; $0DD050 |
  RTS                                       ; $0DD051 |
  TYX                                       ; $0DD052 |
  LDA $7860,x                               ; $0DD053 |
  AND #$0001                                ; $0DD056 |
  BEQ CODE_0DD034                           ; $0DD059 |
  LDA #$0020                                ; $0DD05B |
  STA $61C6                                 ; $0DD05E |
  ASL A                                     ; $0DD061 |
  STA $7542,x                               ; $0DD062 |
  LDA #$0023                                ; $0DD065 |\ play sound #$0023
  JSL $0085D2                               ; $0DD068 | play sound #$0023/
  SEC                                       ; $0DD06C |
  RTS                                       ; $0DD06D |
  TYX                                       ; $0DD06E |
  LDY $7223,x                               ; $0DD06F |
  BMI CODE_0DD034                           ; $0DD072 |
  LDA #$077D                                ; $0DD074 |
  CMP $7182,x                               ; $0DD077 |
  BPL CODE_0DD034                           ; $0DD07A |
  STA $7182,x                               ; $0DD07C |
  STZ $7222,x                               ; $0DD07F |
  STZ $7542,x                               ; $0DD082 |
  SEC                                       ; $0DD085 |
  RTS                                       ; $0DD086 |
  TYX                                       ; $0DD087 |
  LDA $7A36,x                               ; $0DD088 |
  STA $7220,x                               ; $0DD08B |
  LDA $7A38,x                               ; $0DD08E |
  STA $7222,x                               ; $0DD091 |
  LDA $7900,x                               ; $0DD094 |
  STA $75E2,x                               ; $0DD097 |
  LDA $7902,x                               ; $0DD09A |
  STA $7542,x                               ; $0DD09D |
  SEC                                       ; $0DD0A0 |
  RTS                                       ; $0DD0A1 |
  TYX                                       ; $0DD0A2 |
  STY $0071                                 ; $0DD0A3 |
  SEC                                       ; $0DD0A6 |
  RTS                                       ; $0DD0A7 |
  TYX                                       ; $0DD0A8 |
  STZ $0071                                 ; $0DD0A9 |

CODE_0DD0AC:
  SEC                                       ; $0DD0AC |
  RTS                                       ; $0DD0AD |
  TYX                                       ; $0DD0AE |
  DEC $7A36,x                               ; $0DD0AF |
  BEQ CODE_0DD0AC                           ; $0DD0B2 |
  CLC                                       ; $0DD0B4 |
  RTS                                       ; $0DD0B5 |

; gsu table
DATA_0DD0B6:         db $6C, $58, $5A, $5A, $5B, $56, $59, $59
DATA_0DD0BE:         db $5C, $55, $58, $58, $5C, $54, $58, $58
DATA_0DD0C6:         db $5C, $53, $57, $57, $5C, $52, $57, $57
DATA_0DD0CE:         db $5C, $51, $56, $56, $5C, $50, $56, $56
DATA_0DD0D6:         db $5C, $3E, $3F, $50, $64, $3D, $40, $4F
DATA_0DD0DE:         db $65, $3D, $41, $4E, $65, $3C, $42, $4D
DATA_0DD0E6:         db $65, $3B, $44, $4D, $64, $3B, $45, $4C
DATA_0DD0EE:         db $64, $3A, $44, $4B, $63, $2F, $43, $4B
DATA_0DD0F6:         db $62, $2C, $41, $4A, $61, $2A, $43, $4A
DATA_0DD0FE:         db $60, $28, $45, $49, $5F, $27, $45, $45
DATA_0DD106:         db $60, $25, $44, $44, $62, $24, $43, $43
DATA_0DD10E:         db $63, $23, $43, $43, $64, $22, $43, $43
DATA_0DD116:         db $65, $22, $43, $43, $66, $21, $43, $43
DATA_0DD11E:         db $66, $15, $43, $43, $66, $11, $43, $43
DATA_0DD126:         db $65, $0E, $43, $43, $58, $0C, $43, $43
DATA_0DD12E:         db $50, $0B, $43, $43, $50, $09, $43, $43
DATA_0DD136:         db $51, $08, $43, $43, $52, $07, $43, $43
DATA_0DD13E:         db $52, $06, $43, $43, $53, $05, $43, $43
DATA_0DD146:         db $53, $05, $54, $69, $6B, $04, $54, $67
DATA_0DD14E:         db $6B, $03, $55, $66, $6B, $03, $55, $64
DATA_0DD156:         db $6B, $02, $55, $62, $6B, $02, $56, $61
DATA_0DD15E:         db $6B, $02, $56, $5F, $6B, $01, $56, $5E
DATA_0DD166:         db $6B, $01, $59, $5C, $6B, $01, $43, $43
DATA_0DD16E:         db $6B, $00, $43, $43, $6B, $00, $43, $43
DATA_0DD176:         db $6B, $00, $43, $43, $6B, $00, $43, $43
DATA_0DD17E:         db $6B, $00, $43, $43, $6B, $00, $43, $43
DATA_0DD186:         db $6B, $00, $43, $43, $6B, $00, $44, $44
DATA_0DD18E:         db $6B, $00, $44, $44, $6B, $00, $45, $45
DATA_0DD196:         db $6B, $01, $46, $46, $6C, $01, $47, $47
DATA_0DD19E:         db $6C, $02, $48, $48, $6D, $02, $49, $49
DATA_0DD1A6:         db $6E, $03, $4A, $4A, $6E, $04, $4B, $4B
DATA_0DD1AE:         db $6F, $04, $4C, $4C, $7F, $05, $4D, $4D
DATA_0DD1B6:         db $7F, $06, $4E, $4E, $7F, $08, $4F, $4F
DATA_0DD1BE:         db $7E, $09, $50, $50, $7D, $0B, $51, $51
DATA_0DD1C6:         db $7C, $0E, $51, $51, $7B, $21, $52, $52
DATA_0DD1CE:         db $7B, $22, $52, $52, $7A, $24, $52, $52
DATA_0DD1D6:         db $79, $28, $52, $52, $78, $2E, $53, $53
DATA_0DD1DE:         db $77, $2F, $53, $53, $76, $30, $53, $53
DATA_0DD1E6:         db $76, $2D, $53, $53, $76, $2C, $53, $53
DATA_0DD1EE:         db $76, $2C, $53, $53, $76, $2C, $53, $53
DATA_0DD1F6:         db $77, $25, $53, $53, $79, $24, $53, $53
DATA_0DD1FE:         db $79, $24, $53, $53, $7A, $24, $53, $53
DATA_0DD206:         db $7A, $24, $53, $53, $7A, $24, $53, $53
DATA_0DD20E:         db $7A, $24, $53, $53, $7A, $24, $53, $53
DATA_0DD216:         db $7A, $24, $53, $53, $7A, $25, $53, $53
DATA_0DD21E:         db $7A, $25, $53, $53, $7A, $25, $53, $53
DATA_0DD226:         db $79, $26, $53, $53, $79, $26, $53, $53
DATA_0DD22E:         db $78, $27, $53, $53, $77, $28, $53, $53
DATA_0DD236:         db $76, $28, $53, $53, $75, $29, $53, $53
DATA_0DD23E:         db $73, $2A, $53, $53, $70, $2B, $53, $53
DATA_0DD246:         db $6F, $2C, $53, $53, $6F, $2D, $41, $49
DATA_0DD24E:         db $6E, $2E, $41, $4A, $6D, $2F, $40, $4B
DATA_0DD256:         db $6C, $30, $40, $4C, $6B, $31, $3F, $4E
DATA_0DD25E:         db $6A, $33, $3E, $51, $68, $36, $3C, $5A
DATA_0DD266:         db $65

; state 0x16 - baby bowser expanding
  TYX                                       ; $0DD267 |
  LDA #$000D                                ; $0DD268 |
  STA $3000                                 ; $0DD26B | #$000D -> r0
  LDA #$D0B6                                ; $0DD26E |
  STA $300A                                 ; $0DD271 | #$D0B6 -> r5
  LDA #$0047                                ; $0DD274 |
  STA $3002                                 ; $0DD277 | #$0047 -> r1
  LDA #$0050                                ; $0DD27A |
  STA $3004                                 ; $0DD27D | #$0050 -> r2
  LDA $7680,x                               ; $0DD280 |
  CLC                                       ; $0DD283 |
  ADC #$0006                                ; $0DD284 |
  STA $3006                                 ; $0DD287 | $7680,x + #$0006 -> r3
  LDA $7682,x                               ; $0DD28A |
  CLC                                       ; $0DD28D |
  ADC #$0004                                ; $0DD28E |
  STA $3008                                 ; $0DD291 | #$0004 -> r4
  LDA $18,x                                 ; $0DD294 |
  STA $300C                                 ; $0DD296 | $18,x -> r6
  LDX #$08                                  ; $0DD299 |
  LDA #$BD37                                ; $0DD29B |
  JSL $7EDE44                               ; $0DD29E | GSU init
  JSL $00BE39                               ; $0DD2A2 | return address + 8

DATA_0DD2A6:         dw $56D0, $027E, $703A, $0348

  LDX $12                                   ; $0DD2AE |
  LDA $18,x                                 ; $0DD2B0 |
  CLC                                       ; $0DD2B2 |
  ADC #$0010                                ; $0DD2B3 |
  STA $18,x                                 ; $0DD2B6 |
  CMP #$1000                                ; $0DD2B8 |
  LDA #$0017                                ; $0DD2BB |
  LDY #$AA                                  ; $0DD2BE |
  BCC CODE_0DD2CE                           ; $0DD2C0 |
  INC $76,x                                 ; $0DD2C2 |
  JSL $03BFF7                               ; $0DD2C4 |
  LDY #$00                                  ; $0DD2C8 |
  TYA                                       ; $0DD2CA |
  STY $0200                                 ; $0DD2CB |

CODE_0DD2CE:
  STA $0967                                 ; $0DD2CE |
  STA $0969                                 ; $0DD2D1 |
  STY $0964                                 ; $0DD2D4 |
  STY $0965                                 ; $0DD2D7 |
  STY $0966                                 ; $0DD2DA |
  LDA #$0020                                ; $0DD2DD |
  TSB $094A                                 ; $0DD2E0 |
  RTS                                       ; $0DD2E3 |

DATA_0DD2E4:         dw $5000, $5800, $7000, $0000
DATA_0DD2EC:         dw $1000, $2000, $3000

DATA_0DD2F2:         dw $0060, $005D, $005F, $00B3
DATA_0DD2FA:         dw $00B4, $00B5, $00B6

; state 0x17 - prepare fight (black screen)
  PHD                                       ; $0DD300 |
  LDA #$0000                                ; $0DD301 |
  TCD                                       ; $0DD304 |
  SEP #$20                                  ; $0DD305 |
  JSL $008239                               ; $0DD307 |
  LDX #$0C                                  ; $0DD30B |
  JSL $008543                               ; $0DD30D |
  LDA #$01                                  ; $0DD311 |
  STA $4D                                   ; $0DD313 |
  STA $0205                                 ; $0DD315 |
  LDA #$B1                                  ; $0DD318 |
  STA $4200                                 ; $0DD31A |
  REP #$20                                  ; $0DD31D |
  PLD                                       ; $0DD31F |
  LDX $12                                   ; $0DD320 |
  LDA #$001A                                ; $0DD322 |
  STA $60AC                                 ; $0DD325 |
  LDA $6094                                 ; $0DD328 |
  CMP #$0200                                ; $0DD32B |
  BCS CODE_0DD354                           ; $0DD32E |
  LDY #$01                                  ; $0DD330 |
  ADC #$0010                                ; $0DD332 |
  CMP #$0200                                ; $0DD335 |
  BCC CODE_0DD347                           ; $0DD338 |
  LDA #$0240                                ; $0DD33A |
  STA $608C                                 ; $0DD33D |
  LDA #$0200                                ; $0DD340 |
  STA $7E18                                 ; $0DD343 |
  DEY                                       ; $0DD346 |

CODE_0DD347:
  STY $0C1E                                 ; $0DD347 |
  STA $0C23                                 ; $0DD34A |
  LDA #$0280                                ; $0DD34D |
  STA $7E1A                                 ; $0DD350 |
  RTS                                       ; $0DD353 |

CODE_0DD354:
  REP #$10                                  ; $0DD354 |
  LDA #$0800                                ; $0DD356 |
  STA $00                                   ; $0DD359 |
  LDA $0C16                                 ; $0DD35B |
  BEQ CODE_0DD363                           ; $0DD35E |
  JMP CODE_0DD42D                           ; $0DD360 |

CODE_0DD363:
  LDA $0C14                                 ; $0DD363 |
  CMP #$0007                                ; $0DD366 |
  BCS CODE_0DD36E                           ; $0DD369 |
  JMP CODE_0DD3E9                           ; $0DD36B |

CODE_0DD36E:
  STZ $0C18                                 ; $0DD36E |
  SEP #$10                                  ; $0DD371 |
  LDX #$1C                                  ; $0DD373 |

CODE_0DD375:
  LDA #$0000                                ; $0DD375 |
  STA $702D6E,x                             ; $0DD378 |
  STA $702002,x                             ; $0DD37C |
  LDA $5FF4BE,x                             ; $0DD380 |
  STA $702F4E,x                             ; $0DD384 |
  STA $7021E2,x                             ; $0DD388 |
  DEX                                       ; $0DD38C |
  DEX                                       ; $0DD38D |
  BPL CODE_0DD375                           ; $0DD38E |
  LDA #$005F                                ; $0DD390 |
  STA $3000                                 ; $0DD393 |
  LDA #$F518                                ; $0DD396 |
  STA $301C                                 ; $0DD399 |
  LDX #$09                                  ; $0DD39C |
  LDA #$F572                                ; $0DD39E |
  JSL $7EDE44                               ; $0DD3A1 | GSU init
  JSL $00BE39                               ; $0DD3A5 | return address + 8

DATA_0DD3A9:         dw $56DE, $007F, $7058, $00D2

  JSL $00BE39                               ; $0DD3B1 | return address + 8

DATA_0DD3B5:         dw $5894, $D27F, $7058, $01A4

  JSL $00BE39                               ; $0DD3BD | return address + 8

DATA_0DD3C1:         dw $5388, $5E7E, $7038, $01A4

  LDX #$D2                                  ; $0DD3C9 |\
  LDA #$0000                                ; $0DD3CB | |

CODE_0DD3CE:
  STA $7E5110,x                             ; $0DD3CE | | nuke $7E5110 - $7E51E2
  DEX                                       ; $0DD3D2 | |
  DEX                                       ; $0DD3D3 | |
  BNE CODE_0DD3CE                           ; $0DD3D4 |/
  LDX $12                                   ; $0DD3D6 |
  INC $76,x                                 ; $0DD3D8 |
  LDA #$0002                                ; $0DD3DA |
  STA $60AC                                 ; $0DD3DD |
  STZ $0967                                 ; $0DD3E0 |
  LDY #$00                                  ; $0DD3E3 |
  STY $094A                                 ; $0DD3E5 |
  RTS                                       ; $0DD3E8 |

CODE_0DD3E9:
  ASL A                                     ; $0DD3E9 |
  TAY                                       ; $0DD3EA |
  LDA #$6800                                ; $0DD3EB |
  STA $0C1A                                 ; $0DD3EE |
  LDA $D2E4,y                               ; $0DD3F1 |
  STA $0C18                                 ; $0DD3F4 |
  LDX #$6800                                ; $0DD3F7 |
  CMP #$4000                                ; $0DD3FA |
  BCS CODE_0DD402                           ; $0DD3FD |
  LDX #$7000                                ; $0DD3FF |

CODE_0DD402:
  LDA $D2F2,y                               ; $0DD402 |
  JSL $00B756                               ; $0DD405 |
  STA $0C16                                 ; $0DD409 |
  INC $0C14                                 ; $0DD40C |
  LDX $0C18                                 ; $0DD40F |
  CPX #$4000                                ; $0DD412 |
  BCS CODE_0DD42D                           ; $0DD415 |
  SEP #$10                                  ; $0DD417 |
  STA $3018                                 ; $0DD419 |
  LDX #$08                                  ; $0DD41C |
  LDA #$AA5F                                ; $0DD41E |
  JSL $7EDE44                               ; $0DD421 | GSU init
  REP #$10                                  ; $0DD425 |
  ASL $0C16                                 ; $0DD427 |
  LDA $0C16                                 ; $0DD42A |

CODE_0DD42D:
  SEC                                       ; $0DD42D |
  SBC #$0800                                ; $0DD42E |
  BCS CODE_0DD43B                           ; $0DD431 |
  ADC #$0800                                ; $0DD433 |
  STA $00                                   ; $0DD436 |
  LDA #$0000                                ; $0DD438 |

CODE_0DD43B:
  STA $0C16                                 ; $0DD43B |
  LDX $0C1A                                 ; $0DD43E |
  TXA                                       ; $0DD441 |
  CLC                                       ; $0DD442 |
  ADC $00                                   ; $0DD443 |
  STA $0C1A                                 ; $0DD445 |
  LDA #$0070                                ; $0DD448 |
  STA $0001                                 ; $0DD44B |
  LDY $0C18                                 ; $0DD44E |
  LDA $00                                   ; $0DD451 |
  CPY #$4000                                ; $0DD453 |
  BCS CODE_0DD45E                           ; $0DD456 |
  JSL $00BF86                               ; $0DD458 |
  BRA CODE_0DD464                           ; $0DD45C |

CODE_0DD45E:
  JSL $00BEA6                               ; $0DD45E |
  LSR $00                                   ; $0DD462 |

CODE_0DD464:
  LDA $00                                   ; $0DD464 |
  CLC                                       ; $0DD466 |
  ADC $0C18                                 ; $0DD467 |
  STA $0C18                                 ; $0DD46A |
  SEP #$10                                  ; $0DD46D |
  LDX $12                                   ; $0DD46F |
  RTS                                       ; $0DD471 |

DATA_0DD472:         db $00, $05, $40, $50, $7E

; ugh fucking uneven indexing
DATA_0DD477:         db $70, $07, $3B, $07, $01, $49, $00
DATA_0DD47E:         db $70, $00, $11, $3B, $00, $11, $01
DATA_0DD485:         db $00, $12, $00

DATA_0DD488:         db $40, $21, $98, $5B, $7E

DATA_0DD48D:         db $E9, $12, $51, $E9, $7B, $51, $00

DATA_0DD494:         db $42, $22, $18, $5C, $7E

DATA_0DD499:         db $E9, $88, $53, $E9, $5A, $54, $00

DATA_0DD4A0:         dw $0000, $00C0

DATA_0DD4A4:         dw $0068, $0008

DATA_0DD4A8:         dw $0020, $0040

; state 0x18 - prepare fade in (black screen)
  LDA $0C18                                 ; $0DD4AC |
  CMP #$4000                                ; $0DD4AF |
  BCS CODE_0DD4CC                           ; $0DD4B2 |
  REP #$10                                  ; $0DD4B4 |
  TAY                                       ; $0DD4B6 |
  ADC #$0800                                ; $0DD4B7 |
  STA $0C18                                 ; $0DD4BA |
  LDA #$0800                                ; $0DD4BD |
  LDX #$00FF                                ; $0DD4C0 |
  JSL $00BF4A                               ; $0DD4C3 |
  SEP #$10                                  ; $0DD4C7 |
  LDX $12                                   ; $0DD4C9 |
  RTS                                       ; $0DD4CB |

CODE_0DD4CC:
  SEP #$20                                  ; $0DD4CC |
  LDX #$04                                  ; $0DD4CE |

CODE_0DD4D0:
  LDA $D472,x                               ; $0DD4D0 |
  STA $4370,x                               ; $0DD4D3 |
  LDA $D488,x                               ; $0DD4D6 |
  STA $4330,x                               ; $0DD4D9 |
  LDA $D494,x                               ; $0DD4DC |
  STA $4340,x                               ; $0DD4DF |
  LDA $01D699,x                             ; $0DD4E2 |
  STA $4320,x                               ; $0DD4E6 |
  LDA $01D6A5,x                             ; $0DD4E9 |
  STA $4310,x                               ; $0DD4ED |
  DEX                                       ; $0DD4F0 |
  BPL CODE_0DD4D0                           ; $0DD4F1 |
  LDA #$7F                                  ; $0DD4F3 |
  STA $4327                                 ; $0DD4F5 |
  STA $4317                                 ; $0DD4F8 |
  LDX #$09                                  ; $0DD4FB |

CODE_0DD4FD:
  LDA $D477,x                               ; $0DD4FD |
  STA $7E5040,x                             ; $0DD500 |
  LDA $D47E,x                               ; $0DD504 |
  STA $7E51E4,x                             ; $0DD507 |
  DEX                                       ; $0DD50B |
  BPL CODE_0DD4FD                           ; $0DD50C |
  LDX #$06                                  ; $0DD50E |

CODE_0DD510:
  LDA $D48D,x                               ; $0DD510 |
  STA $7E5B98,x                             ; $0DD513 |
  LDA $D499,x                               ; $0DD517 |
  STA $7E5C18,x                             ; $0DD51A |
  LDA $01D69E,x                             ; $0DD51E |
  STA $7E5C98,x                             ; $0DD522 |
  LDA $01D6AA,x                             ; $0DD526 |
  STA $7E5D18,x                             ; $0DD52A |
  DEX                                       ; $0DD52E |
  BPL CODE_0DD510                           ; $0DD52F |
  LDA #$C6                                  ; $0DD531 |
  STA $094A                                 ; $0DD533 |
  REP #$20                                  ; $0DD536 |
  LDA #$0700                                ; $0DD538 |
  STA $1068                                 ; $0DD53B |
  LDA #$0A00                                ; $0DD53E |
  STA $106A                                 ; $0DD541 |
  LDA #$02C0                                ; $0DD544 |
  STA $106C                                 ; $0DD547 |
  LDA #$0200                                ; $0DD54A |
  STA $0957                                 ; $0DD54D |
  LDA #$0210                                ; $0DD550 |
  STA $0959                                 ; $0DD553 |
  SEP #$10                                  ; $0DD556 |
  LDA #$00D5                                ; $0DD558 |
  JSL $03A364                               ; $0DD55B |
  BCC CODE_0DD5B5                           ; $0DD55F |
  LDA #$0080                                ; $0DD561 |
  STA $70E2,y                               ; $0DD564 |
  STA $7182,y                               ; $0DD567 |
  LDA #$F801                                ; $0DD56A |
  STA $7040,y                               ; $0DD56D |
  STA $7978,y                               ; $0DD570 |
  SEP #$20                                  ; $0DD573 |
  LDA #$06                                  ; $0DD575 |
  STA $74A1,y                               ; $0DD577 |
  REP #$20                                  ; $0DD57A |
  LDX #$02                                  ; $0DD57C |

CODE_0DD57E:
  LDA #$0083                                ; $0DD57E |
  JSL $03A34C                               ; $0DD581 |
  BCC CODE_0DD5B5                           ; $0DD585 |
  LDA $003D                                 ; $0DD587 |
  CLC                                       ; $0DD58A |
  ADC $D4A0,x                               ; $0DD58B |
  STA $70E2,y                               ; $0DD58E |
  LDA $003F                                 ; $0DD591 |
  CLC                                       ; $0DD594 |
  ADC $D4A4,x                               ; $0DD595 |
  STA $7182,y                               ; $0DD598 |
  LDA $D4A8,x                               ; $0DD59B |
  STA $7220,y                               ; $0DD59E |
  CPX #$00                                  ; $0DD5A1 |
  BNE CODE_0DD5B1                           ; $0DD5A3 |
  LDA #$0002                                ; $0DD5A5 |
  STA $7402,y                               ; $0DD5A8 |
  LDA #$2001                                ; $0DD5AB |
  STA $7040,y                               ; $0DD5AE |

CODE_0DD5B1:
  DEX                                       ; $0DD5B1 |
  DEX                                       ; $0DD5B2 |
  BPL CODE_0DD57E                           ; $0DD5B3 |

CODE_0DD5B5:
  LDX $12                                   ; $0DD5B5 |
  LDA #$00CF                                ; $0DD5B7 |
  JSL $03A34C                               ; $0DD5BA |
  BCC CODE_0DD5C6                           ; $0DD5BE |
  LDA #$0002                                ; $0DD5C0 |
  STA $7902,y                               ; $0DD5C3 |

CODE_0DD5C6:
  LDY #$0A                                  ; $0DD5C6 |
  STY $011C                                 ; $0DD5C8 |
  LDY #$69                                  ; $0DD5CB |
  STY $0960                                 ; $0DD5CD |
  LDA #$000F                                ; $0DD5D0 |
  STA $014C                                 ; $0DD5D3 |
  LDA #$0002                                ; $0DD5D6 |
  STA $7402,x                               ; $0DD5D9 |
  LDA #$0180                                ; $0DD5DC |
  STA $7A96,x                               ; $0DD5DF |
  LDA #$0080                                ; $0DD5E2 |
  STA $7A38,x                               ; $0DD5E5 |
  STZ $7902,x                               ; $0DD5E8 |
  LDA #$1200                                ; $0DD5EB |
  STA $0967                                 ; $0DD5EE |
  STZ $60AC                                 ; $0DD5F1 |
  STZ $0B59                                 ; $0DD5F4 |

CODE_0DD5F7:
  INC $76,x                                 ; $0DD5F7 |
  STZ $18,x                                 ; $0DD5F9 |
  LDA $0967                                 ; $0DD5FB |
  STA $0969                                 ; $0DD5FE |
  LDY #$00                                  ; $0DD601 |
  STY $0966                                 ; $0DD603 |
  LDY #$22                                  ; $0DD606 |
  STY $096B                                 ; $0DD608 |
  LDY #$20                                  ; $0DD60B |
  STY $096C                                 ; $0DD60D |
  LDA #$0020                                ; $0DD610 |
  TRB $094A                                 ; $0DD613 |
  RTS                                       ; $0DD616 |

; state 0x19 - idle before fight (no bowser)
; state 0x20 - fade into victory cutscene (no bowser)
  TYX                                       ; $0DD617 |
  LDA #$7FFF                                ; $0DD618 |
  STA $3002                                 ; $0DD61B |
  STZ $3004                                 ; $0DD61E |
  LDA $18,x                                 ; $0DD621 |
  STA $300C                                 ; $0DD623 |
  CLC                                       ; $0DD626 |
  ADC #$0001                                ; $0DD627 |
  STA $18,x                                 ; $0DD62A |
  CMP #$0100                                ; $0DD62C |
  BCC CODE_0DD633                           ; $0DD62F |
  INC $76,x                                 ; $0DD631 |

CODE_0DD633:
  LDX #$08                                  ; $0DD633 |
  LDA #$E132                                ; $0DD635 |
  JSL $7EDE44                               ; $0DD638 | GSU init
  LDX $12                                   ; $0DD63C |
  LDA $3006                                 ; $0DD63E |
  LDY $0B59                                 ; $0DD641 |
  BNE CODE_0DD655                           ; $0DD644 |
  LSR A                                     ; $0DD646 |
  LSR A                                     ; $0DD647 |
  LSR A                                     ; $0DD648 |
  XBA                                       ; $0DD649 |
  AND #$000F                                ; $0DD64A |
  EOR #$000F                                ; $0DD64D |
  TAY                                       ; $0DD650 |
  STY $0200                                 ; $0DD651 |
  RTS                                       ; $0DD654 |

CODE_0DD655:
  STA $702000                               ; $0DD655 |
  RTS                                       ; $0DD659 |

DATA_0DD65A:         dw $4030, $1020

; state 0x1A - mecha-bowser rising into frame
  TYX                                       ; $0DD65E |
  JSR CODE_0DDEAA                           ; $0DD65F |
  LDA #$0990                                ; $0DD662 |
  SEC                                       ; $0DD665 |
  SBC $106A                                 ; $0DD666 |
  BPL CODE_0DD66E                           ; $0DD669 |
  LDA #$0000                                ; $0DD66B |

CODE_0DD66E:
  LSR A                                     ; $0DD66E |
  CMP #$0100                                ; $0DD66F |
  BMI CODE_0DD677                           ; $0DD672 |
  LDA #$0100                                ; $0DD674 |

CODE_0DD677:
  STA $300C                                 ; $0DD677 |
  LDA #$F482                                ; $0DD67A |
  STA $301C                                 ; $0DD67D |
  LDA #$005F                                ; $0DD680 |
  STA $3000                                 ; $0DD683 |
  LDA #$0001                                ; $0DD686 |
  STA $3010                                 ; $0DD689 |
  LDA #$000F                                ; $0DD68C |
  STA $3018                                 ; $0DD68F |
  LDX #$08                                  ; $0DD692 |
  LDA #$E167                                ; $0DD694 |
  JSL $7EDE44                               ; $0DD697 | GSU init
  LDX $12                                   ; $0DD69B |
  LDA $7A96,x                               ; $0DD69D |
  BNE CODE_0DD708                           ; $0DD6A0 |
  LDA $14                                   ; $0DD6A2 |
  AND #$000F                                ; $0DD6A4 |
  ORA #$0040                                ; $0DD6A7 |
  STA $61C6                                 ; $0DD6AA |
  LDA $106A                                 ; $0DD6AD |
  SEC                                       ; $0DD6B0 |
  SBC #$0001                                ; $0DD6B1 |
  STA $106A                                 ; $0DD6B4 |
  CMP #$0750                                ; $0DD6B7 |
  BPL CODE_0DD6E2                           ; $0DD6BA |
  STA $7900,x                               ; $0DD6BC |
  LDX #$1C                                  ; $0DD6BF |

CODE_0DD6C1:
  LDA $5FF482,x                             ; $0DD6C1 |
  STA $702D6E,x                             ; $0DD6C5 |
  STA $702002,x                             ; $0DD6C9 |
  DEX                                       ; $0DD6CD |
  DEX                                       ; $0DD6CE |
  BPL CODE_0DD6C1                           ; $0DD6CF |
  LDX $12                                   ; $0DD6D1 |

CODE_0DD6D3:
  LDA #$001B                                ; $0DD6D3 |
  STA $79D6,x                               ; $0DD6D6 |
  LDA #$0005                                ; $0DD6D9 |
  STA $78,x                                 ; $0DD6DC |
  STZ $7AF8,x                               ; $0DD6DE |
  RTS                                       ; $0DD6E1 |

CODE_0DD6E2:
  CMP #$0900                                ; $0DD6E2 |
  BPL CODE_0DD6ED                           ; $0DD6E5 |
  LDA #$0001                                ; $0DD6E7 |
  STA $61CE                                 ; $0DD6EA |

CODE_0DD6ED:
  LDA $7A98,x                               ; $0DD6ED |
  BNE CODE_0DD708                           ; $0DD6F0 |
  LDA #$0048                                ; $0DD6F2 |\ play sound #$0048
  JSL $0085D2                               ; $0DD6F5 | play sound #$0048/
  LDA $10                                   ; $0DD6F9 |
  AND #$0003                                ; $0DD6FB |
  TAY                                       ; $0DD6FE |
  LDA $D65A,y                               ; $0DD6FF |
  AND #$00FF                                ; $0DD702 |
  STA $7A98,x                               ; $0DD705 |

CODE_0DD708:
  RTS                                       ; $0DD708 |

DATA_0DD709:         dw $0002, $0004, $0006, $0004, $0002

DATA_0DD713:         dw $00E0, $0004, $0130, $0004, $0080

; state 0x1B - idle (summon rocks)
  TYX                                       ; $0DD71D |
  JSR CODE_0DDEAA                           ; $0DD71E |
  LDY $1070                                 ; $0DD721 |
  CPY #$08                                  ; $0DD724 |
  BCC CODE_0DD72B                           ; $0DD726 |
  JSR CODE_0DD8D3                           ; $0DD728 |

CODE_0DD72B:
  LDA $7AF8,x                               ; $0DD72B |
  BNE CODE_0DD760                           ; $0DD72E |
  DEC $78,x                                 ; $0DD730 |
  BPL CODE_0DD73D                           ; $0DD732 |
  INC $76,x                                 ; $0DD734 |
  LDA #$0100                                ; $0DD736 |
  STA $7AF6,x                               ; $0DD739 |
  RTS                                       ; $0DD73C |

CODE_0DD73D:
  LDA $78,x                                 ; $0DD73D |
  ASL A                                     ; $0DD73F |
  TAY                                       ; $0DD740 |
  LDA $D713,y                               ; $0DD741 |
  STA $7AF8,x                               ; $0DD744 |
  LDA $D709,y                               ; $0DD747 |
  STA $7402,x                               ; $0DD74A |
  CMP #$0006                                ; $0DD74D |
  BNE CODE_0DD760                           ; $0DD750 |
  LDA #$0091                                ; $0DD752 |\ play sound #$0091
  JSL $0085D2                               ; $0DD755 | play sound #$0091/
  LDA #$00CF                                ; $0DD759 |
  JSL $03A34C                               ; $0DD75C |

CODE_0DD760:
  RTS                                       ; $0DD760 |

DATA_0DD761:         db $02, $04, $05, $04, $02, $04, $05, $04
DATA_0DD769:         db $02, $04, $05, $04, $02

DATA_0DD76E:         db $04, $04, $60, $04, $40, $04, $60, $04
DATA_0DD776:         db $40, $04, $60, $04, $04

; state 0x1D - mecha-bowser rising into frame
  TYX                                       ; $0DD77B |
  JSR CODE_0DDEAA                           ; $0DD77C |
  JSR CODE_0DD8D3                           ; $0DD77F |
  LDA $7AF8,x                               ; $0DD782 |
  BEQ CODE_0DD7F2                           ; $0DD785 |

CODE_0DD787:
  LDY $7402,x                               ; $0DD787 |
  CPY #$05                                  ; $0DD78A |
  BNE CODE_0DD7D4                           ; $0DD78C |
  CMP #$0020                                ; $0DD78E |
  BCC CODE_0DD7D4                           ; $0DD791 |
  BNE CODE_0DD79F                           ; $0DD793 |
  JSR CODE_0DD822                           ; $0DD795 |
  LDA #$0030                                ; $0DD798 |
  STA $7A36,x                               ; $0DD79B |
  RTS                                       ; $0DD79E |

CODE_0DD79F:
  LDA #$0001                                ; $0DD79F |

CODE_0DD7A2:
  PHA                                       ; $0DD7A2 |
  LDA #$01D3                                ; $0DD7A3 |
  JSL $008B21                               ; $0DD7A6 | spawn fireball sprite
  LDA $611C                                 ; $0DD7AA |
  SEC                                       ; $0DD7AD |
  SBC #$0008                                ; $0DD7AE |
  STA $70A2,y                               ; $0DD7B1 |
  LDA $611E                                 ; $0DD7B4 |
  SEC                                       ; $0DD7B7 |
  SBC #$0008                                ; $0DD7B8 |
  STA $7142,y                               ; $0DD7BB |
  PLA                                       ; $0DD7BE |
  STA $7782,y                               ; $0DD7BF |
  LDA $7A36,x                               ; $0DD7C2 |
  STA $7E4C,y                               ; $0DD7C5 |
  CMP #$0010                                ; $0DD7C8 |
  BCC CODE_0DD7D5                           ; $0DD7CB |
  SEC                                       ; $0DD7CD |
  SBC #$0004                                ; $0DD7CE |
  STA $7A36,x                               ; $0DD7D1 |

CODE_0DD7D4:
  RTS                                       ; $0DD7D4 |

CODE_0DD7D5:
  LDA $14                                   ; $0DD7D5 |
  AND #$0007                                ; $0DD7D7 |
  BNE CODE_0DD7E5                           ; $0DD7DA |
  PHY                                       ; $0DD7DC |
  LDA #$0063                                ; $0DD7DD |\ play sound #$0063
  JSL $0085D2                               ; $0DD7E0 | play sound #$0063/
  PLY                                       ; $0DD7E4 |

CODE_0DD7E5:
  LDA $14                                   ; $0DD7E5 |
  AND #$0004                                ; $0DD7E7 |
  LSR A                                     ; $0DD7EA |
  ADC $7002,y                               ; $0DD7EB |
  STA $7002,y                               ; $0DD7EE |
  RTS                                       ; $0DD7F1 |

CODE_0DD7F2:
  DEC $78,x                                 ; $0DD7F2 |
  BPL CODE_0DD7FF                           ; $0DD7F4 |
  DEC $76,x                                 ; $0DD7F6 |
  LDA #$0100                                ; $0DD7F8 |
  STA $7AF6,x                               ; $0DD7FB |
  RTS                                       ; $0DD7FE |

CODE_0DD7FF:
  LDY $78,x                                 ; $0DD7FF |
  LDA $D76E,y                               ; $0DD801 |
  AND #$00FF                                ; $0DD804 |
  STA $7AF8,x                               ; $0DD807 |
  LDA $D761,y                               ; $0DD80A |
  AND #$00FF                                ; $0DD80D |
  STA $7402,x                               ; $0DD810 |
  CMP #$0005                                ; $0DD813 |
  BNE CODE_0DD81F                           ; $0DD816 |
  LDA #$0091                                ; $0DD818 |\ play sound #$0091
  JSL $0085D2                               ; $0DD81B | play souond #$0091/

CODE_0DD81F:
  JMP CODE_0DD787                           ; $0DD81F |

CODE_0DD822:
  LDA #$0010                                ; $0DD822 |\ play sound #$0010
  JSL $0085D2                               ; $0DD825 | play sound #$0010/
  LDA #$0010                                ; $0DD829 |
  JSR CODE_0DD7A2                           ; $0DD82C |
  LDA $70A2,y                               ; $0DD82F |
  STA $00                                   ; $0DD832 |
  LDA $7142,y                               ; $0DD834 |
  STA $02                                   ; $0DD837 |
  LDA #$00CE                                ; $0DD839 |
  JSL $03A34C                               ; $0DD83C |
  BCS CODE_0DD845                           ; $0DD840 |
  JMP CODE_0DD787                           ; $0DD842 |

CODE_0DD845:
  LDA $106C                                 ; $0DD845 |
  SEC                                       ; $0DD848 |
  SBC #$0008                                ; $0DD849 |
  STA $7902,y                               ; $0DD84C |
  CLC                                       ; $0DD84F |
  ADC $1068                                 ; $0DD850 |
  SEC                                       ; $0DD853 |
  SBC #$0100                                ; $0DD854 |
  STA $70E2,y                               ; $0DD857 |
  LDA $106A                                 ; $0DD85A |
  SEC                                       ; $0DD85D |
  SBC #$0050                                ; $0DD85E |
  STA $7182,y                               ; $0DD861 |
  STY $04                                   ; $0DD864 |
  LDA $00                                   ; $0DD866 |
  STA $3002                                 ; $0DD868 |
  LDA #$0100                                ; $0DD86B |
  STA $3004                                 ; $0DD86E |
  LDA $7902,y                               ; $0DD871 |
  STA $3006                                 ; $0DD874 |
  LDA $1068                                 ; $0DD877 |
  STA $3008                                 ; $0DD87A |
  CLC                                       ; $0DD87D |
  ADC #$0300                                ; $0DD87E |
  ASL A                                     ; $0DD881 |
  STA $06                                   ; $0DD882 |
  STA $300C                                 ; $0DD884 |
  LDX #$09                                  ; $0DD887 |
  LDA #$907C                                ; $0DD889 |
  JSL $7EDE44                               ; $0DD88C | GSU init
  LDX $04                                   ; $0DD890 |
  LDA $3002                                 ; $0DD892 |
  STA $16,x                                 ; $0DD895 |
  LDA $3004                                 ; $0DD897 |
  STA $7220,x                               ; $0DD89A |
  LDA $02                                   ; $0DD89D |
  STA $3002                                 ; $0DD89F |
  LDA #$0100                                ; $0DD8A2 |
  STA $3004                                 ; $0DD8A5 |
  LDA $7182,x                               ; $0DD8A8 |
  STA $3006                                 ; $0DD8AB |
  LDA $1068                                 ; $0DD8AE |
  STA $76,x                                 ; $0DD8B1 |
  STA $3008                                 ; $0DD8B3 |
  LDA $06                                   ; $0DD8B6 |
  STA $300C                                 ; $0DD8B8 |
  LDX #$09                                  ; $0DD8BB |
  LDA #$907C                                ; $0DD8BD |
  JSL $7EDE44                               ; $0DD8C0 | GSU init
  LDX $04                                   ; $0DD8C4 |
  LDA $3002                                 ; $0DD8C6 |
  STA $7222,x                               ; $0DD8C9 |
  LDX $12                                   ; $0DD8CC |
  RTS                                       ; $0DD8CE |

DATA_0DD8CF:         dw $0120, $FFD0

CODE_0DD8D3:
  LDA $7A98,x                               ; $0DD8D3 |
  BNE CODE_0DD912                           ; $0DD8D6 |
  LDX #$09                                  ; $0DD8D8 |
  LDA #$F743                                ; $0DD8DA |
  JSL $7EDE44                               ; $0DD8DD | GSU init
  LDX $12                                   ; $0DD8E1 |
  LDA $3002                                 ; $0DD8E3 |
  BNE CODE_0DD912                           ; $0DD8E6 |
  LDA #$00CD                                ; $0DD8E8 |
  JSL $03A34C                               ; $0DD8EB |
  BCC CODE_0DD912                           ; $0DD8EF |
  LDA $10                                   ; $0DD8F1 |
  AND #$0002                                ; $0DD8F3 |
  STA $7400,y                               ; $0DD8F6 |
  TAX                                       ; $0DD8F9 |
  LDA $0039                                 ; $0DD8FA |
  CLC                                       ; $0DD8FD |
  ADC $D8CF,x                               ; $0DD8FE |
  STA $70E2,y                               ; $0DD901 |
  LDA #$0770                                ; $0DD904 |
  STA $7182,y                               ; $0DD907 |
  LDX $12                                   ; $0DD90A |
  LDA #$0100                                ; $0DD90C |
  STA $7A98,x                               ; $0DD90F |

CODE_0DD912:
  RTS                                       ; $0DD912 |

; state 0x1E - knockback after hit by egg
  TYX                                       ; $0DD913 |
  JSR CODE_0DDEAA                           ; $0DD914 |
  JSR CODE_0DD8D3                           ; $0DD917 |
  LDA #$0006                                ; $0DD91A |
  STA $7402,x                               ; $0DD91D |
  LDA $14                                   ; $0DD920 |
  AND #$0008                                ; $0DD922 |
  BEQ CODE_0DD937                           ; $0DD925 |
  LDX #$1C                                  ; $0DD927 |

CODE_0DD929:
  LDA $5FF538,x                             ; $0DD929 |
  STA $702002,x                             ; $0DD92D |
  DEX                                       ; $0DD931 |
  DEX                                       ; $0DD932 |
  BPL CODE_0DD929                           ; $0DD933 |
  LDX $12                                   ; $0DD935 |

CODE_0DD937:
  LDY $1076                                 ; $0DD937 |
  LDA $7AF8,x                               ; $0DD93A |
  BEQ CODE_0DD97F                           ; $0DD93D |
  CPY #$07                                  ; $0DD93F |
  BEQ CODE_0DD97E                           ; $0DD941 |
  LDA $1068                                 ; $0DD943 |
  CLC                                       ; $0DD946 |
  ADC #$0004                                ; $0DD947 |
  STA $1068                                 ; $0DD94A |
  LDA $106A                                 ; $0DD94D |
  CLC                                       ; $0DD950 |
  ADC $72C2,x                               ; $0DD951 |
  CMP $7900,x                               ; $0DD954 |
  BMI CODE_0DD97B                           ; $0DD957 |
  LDA #$0047                                ; $0DD959 |\ play sound #$0047
  JSL $0085D2                               ; $0DD95C | play sound #$0047/
  LDA #$0008                                ; $0DD960 |
  STA $61C6                                 ; $0DD963 |
  LDA #$F800                                ; $0DD966 |
  STA $7222,x                               ; $0DD969 |
  LDA #$0100                                ; $0DD96C |
  STA $7542,x                               ; $0DD96F |
  LDA #$0800                                ; $0DD972 |
  STA $75E2,x                               ; $0DD975 |
  LDA $7900,x                               ; $0DD978 |

CODE_0DD97B:
  STA $106A                                 ; $0DD97B |

CODE_0DD97E:
  RTS                                       ; $0DD97E |

CODE_0DD97F:
  CPY #$07                                  ; $0DD97F |
  BEQ CODE_0DD98F                           ; $0DD981 |
  CPY #$03                                  ; $0DD983 |
  BNE CODE_0DD98A                           ; $0DD985 |
  JMP CODE_0DD6D3                           ; $0DD987 |

CODE_0DD98A:
  DEC $76,x                                 ; $0DD98A |
  DEC $76,x                                 ; $0DD98C |
  RTS                                       ; $0DD98E |

CODE_0DD98F:
  JSR CODE_0DFC04                           ; $0DD98F |
  JSL $02A982                               ; $0DD992 |
  LDA #$001F                                ; $0DD996 |
  STA $76,x                                 ; $0DD999 |
  LDA #$0200                                ; $0DD99B |
  STA $7A96,x                               ; $0DD99E |
  LDA $094A                                 ; $0DD9A1 |
  EOR #$001E                                ; $0DD9A4 |
  STA $094A                                 ; $0DD9A7 |
  STZ $0948                                 ; $0DD9AA |
  LDA #$0013                                ; $0DD9AD |
  JSL $03A364                               ; $0DD9B0 |
  BCC CODE_0DD9F6                           ; $0DD9B4 |
  LDA #$0200                                ; $0DD9B6 |
  SBC $0041                                 ; $0DD9B9 |
  STA $7680,y                               ; $0DD9BC |
  CLC                                       ; $0DD9BF |
  ADC $0039                                 ; $0DD9C0 |
  STA $70E2,y                               ; $0DD9C3 |
  LDA #$0200                                ; $0DD9C6 |
  SEC                                       ; $0DD9C9 |
  SBC $0043                                 ; $0DD9CA |
  STA $7682,y                               ; $0DD9CD |
  CLC                                       ; $0DD9D0 |
  ADC $003B                                 ; $0DD9D1 |
  STA $7182,y                               ; $0DD9D4 |
  LDA #$611F                                ; $0DD9D7 |
  STA $79D8,y                               ; $0DD9DA |
  LDA #$0008                                ; $0DD9DD |
  STA $7976,y                               ; $0DD9E0 |
  LDA #$0800                                ; $0DD9E3 |
  STA $7A38,y                               ; $0DD9E6 |
  LDA #$FFFF                                ; $0DD9E9 |
  STA $7A96,y                               ; $0DD9EC |
  LDA #$0074                                ; $0DD9EF |\ play sound #$0074
  JSL $0085D2                               ; $0DD9F2 | play sound #$0074/

CODE_0DD9F6:
  JSL $02E1E1                               ; $0DD9F6 |
  RTS                                       ; $0DD9FA |

DATA_0DD9FB:         db $00, $02, $03, $01, $03, $02

DATA_0DDA01:         dw $0840, $4008, $0808

DATA_0DDA07:         dw $0700, $0680, $0600, $0400
DATA_0DDA0F:         dw $0300, $0200, $0000

; state 0x1C - walk forward
  TYX                                       ; $0DDA15 |
  JSR CODE_0DDEAA                           ; $0DDA16 |
  JSR CODE_0DD8D3                           ; $0DDA19 |
  LDA $7AF8,x                               ; $0DDA1C |
  BEQ CODE_0DDA24                           ; $0DDA1F |
  JMP CODE_0DDAD3                           ; $0DDA21 |

CODE_0DDA24:
  LDY $78,x                                 ; $0DDA24 |
  INY                                       ; $0DDA26 |
  CPY #$06                                  ; $0DDA27 |
  BCC CODE_0DDA2D                           ; $0DDA29 |
  LDY #$00                                  ; $0DDA2B |

CODE_0DDA2D:
  TYA                                       ; $0DDA2D |
  STA $78,x                                 ; $0DDA2E |
  LDA $1076                                 ; $0DDA30 |
  ASL A                                     ; $0DDA33 |
  TAX                                       ; $0DDA34 |
  LDA $1068                                 ; $0DDA35 |
  SEC                                       ; $0DDA38 |
  SBC $DA07,x                               ; $0DDA39 |
  ASL A                                     ; $0DDA3C |
  LDX $DA01,y                               ; $0DDA3D |
  TXA                                       ; $0DDA40 |
  BCS CODE_0DDA76                           ; $0DDA41 |
  STA $3000                                 ; $0DDA43 |
  LDX $12                                   ; $0DDA46 |
  LDA #$0002                                ; $0DDA48 |
  STA $7AF6,x                               ; $0DDA4B |
  LDA $7A38,x                               ; $0DDA4E |
  STA $300C                                 ; $0DDA51 |
  SEC                                       ; $0DDA54 |
  SBC #$0010                                ; $0DDA55 |
  BPL CODE_0DDA5D                           ; $0DDA58 |
  LDA #$0000                                ; $0DDA5A |

CODE_0DDA5D:
  STA $7A38,x                               ; $0DDA5D |
  PHY                                       ; $0DDA60 |
  LDX #$0B                                  ; $0DDA61 |
  LDA #$86B6                                ; $0DDA63 |
  JSL $7EDE44                               ; $0DDA66 | GSU init
  PLY                                       ; $0DDA6A |
  LDA $3000                                 ; $0DDA6B |
  CMP #$0004                                ; $0DDA6E |
  BCS CODE_0DDA76                           ; $0DDA71 |
  LDA #$0004                                ; $0DDA73 |

CODE_0DDA76:
  LDX $12                                   ; $0DDA76 |
  STA $7AF8,x                               ; $0DDA78 |
  LDA $D9FB,y                               ; $0DDA7B |
  AND #$00FF                                ; $0DDA7E |
  STA $7402,x                               ; $0DDA81 |
  LSR A                                     ; $0DDA84 |
  BNE CODE_0DDAD3                           ; $0DDA85 |
  LDA #$0047                                ; $0DDA87 |\ play sound #$0047
  JSL $0085D2                               ; $0DDA8A | play sound #$0047/
  LDA #$0020                                ; $0DDA8E |
  STA $61C6                                 ; $0DDA91 |
  LDA $1068                                 ; $0DDA94 |
  STA $00                                   ; $0DDA97 |
  SEC                                       ; $0DDA99 |
  SBC #$0020                                ; $0DDA9A |
  STA $1068                                 ; $0DDA9D |
  CMP #$0100                                ; $0DDAA0 |
  BPL CODE_0DDAB9                           ; $0DDAA3 |
  CMP #$00E0                                ; $0DDAA5 |
  BMI CODE_0DDAD3                           ; $0DDAA8 |
  LDA #$0081                                ; $0DDAAA |\ play sound #$0081
  JSL $0085D2                               ; $0DDAAD | play sound #$0081/
  LDA #$0200                                ; $0DDAB1 |
  STA $61C8                                 ; $0DDAB4 |
  BRA CODE_0DDAD3                           ; $0DDAB7 |

CODE_0DDAB9:
  CMP #$0180                                ; $0DDAB9 |
  BMI CODE_0DDAD3                           ; $0DDABC |
  LDA $7AF6,x                               ; $0DDABE |
  BNE CODE_0DDAD3                           ; $0DDAC1 |
  INC $76,x                                 ; $0DDAC3 |
  LDA #$000D                                ; $0DDAC5 |
  STA $78,x                                 ; $0DDAC8 |
  LDA #$0030                                ; $0DDACA |
  STA $7A36,x                               ; $0DDACD |
  STZ $7A98,x                               ; $0DDAD0 |

CODE_0DDAD3:
  LDA $1068                                 ; $0DDAD3 |
  CMP #$0100                                ; $0DDAD6 |
  BPL CODE_0DDB29                           ; $0DDAD9 |
  JSL $03A858                               ; $0DDADB |
  LDY $7902,x                               ; $0DDADF |
  CPY #$60                                  ; $0DDAE2 |
  BCS CODE_0DDB29                           ; $0DDAE4 |
  TYA                                       ; $0DDAE6 |
  BIT #$0004                                ; $0DDAE7 |
  BEQ CODE_0DDAF0                           ; $0DDAEA |
  EOR #$FFFF                                ; $0DDAEC |
  INC A                                     ; $0DDAEF |

CODE_0DDAF0:
  ASL A                                     ; $0DDAF0 |
  CLC                                       ; $0DDAF1 |
  ADC #$02C0                                ; $0DDAF2 |
  STA $0091                                 ; $0DDAF5 |
  TYA                                       ; $0DDAF8 |
  AND #$0003                                ; $0DDAF9 |
  ASL A                                     ; $0DDAFC |
  ASL A                                     ; $0DDAFD |
  ASL A                                     ; $0DDAFE |
  ASL A                                     ; $0DDAFF |
  ADC #$07C0                                ; $0DDB00 |
  STA $0093                                 ; $0DDB03 |
  LDA #$0001                                ; $0DDB06 |
  STA $008F                                 ; $0DDB09 |
  LDA #$0000                                ; $0DDB0C |
  STA $0095                                 ; $0DDB0F |
  JSL $109295                               ; $0DDB12 |
  JSL $0DA485                               ; $0DDB16 |
  DEC $0057                                 ; $0DDB1A |
  LDA #$0083                                ; $0DDB1D |\ play sound #$0083
  JSL $0085D2                               ; $0DDB20 | play sound #$0083/
  LDX $12                                   ; $0DDB24 |
  INC $7902,x                               ; $0DDB26 |

CODE_0DDB29:
  RTS                                       ; $0DDB29 |

DATA_0DDB2A:         dw $DC0A, $0000
DATA_0DDB2E:         dw $DC0A, $0002
DATA_0DDB32:         dw $DB62, $0000
DATA_0DDB36:         dw $DB62, $0002
DATA_0DDB3A:         dw $DCB2, $0000
DATA_0DDB3E:         dw $DD5A, $0000
DATA_0DDB42:         dw $DE02, $0000

DATA_0DDB46:         dw $0010, $0010, $0000, $0000
DATA_0DDB4E:         dw $0000, $0000, $0000

DATA_0DDB54:         dw $0010, $FFF0, $0000, $0000
DATA_0DDB5C:         dw $0000, $0000, $0000

DATA_0DDB62:         dw $FFFF, $FFFF, $FFFF, $EEED
DATA_0DDB6A:         dw $FFEF, $FFFF, $FFFF, $FFFF
DATA_0DDB72:         dw $FFFF, $FFFF, $FEFD, $FFFF
DATA_0DDB7A:         dw $FFFF, $FFFF, $FFFF, $01FF
DATA_0DDB82:         dw $0C02, $0E0D, $FF0F, $0504
DATA_0DDB8A:         dw $FFFF, $FFFF, $11FF, $1C12
DATA_0DDB92:         dw $1E1D, $131F, $1514, $FFFF
DATA_0DDB9A:         dw $FFFF, $21FF, $2C28, $2E2D
DATA_0DDBA2:         dw $292F, $2524, $FFFF, $FFFF
DATA_0DDBAA:         dw $3130, $3C38, $3E3D, $393F
DATA_0DDBB2:         dw $353A, $FF25, $FFFF, $4140
DATA_0DDBBA:         dw $4C42, $4E4D, $434F, $4544
DATA_0DDBC2:         dw $FFFF, $FFFF, $5150, $5C52
DATA_0DDBCA:         dw $5E5D, $535F, $5554, $FFFF
DATA_0DDBD2:         dw $00FF, $6160, $0362, $0303
DATA_0DDBDA:         dw $6303, $6564, $FF82, $10FF
DATA_0DDBE2:         dw $7170, $0372, $0303, $7303
DATA_0DDBEA:         dw $7574, $FF92, $20FF, $8180
DATA_0DDBF2:         dw $0303, $0303, $0303, $8584
DATA_0DDBFA:         dw $FFA2, $FFFF, $9190, $0303
DATA_0DDC02:         dw $0303, $0303, $9594, $FFFF

DATA_0DDC0A:         dw $FFFF, $FFFF, $FFFF, $EBEA
DATA_0DDC12:         dw $FFEC, $FFFF, $FFFF, $FFFF
DATA_0DDC1A:         dw $FFFF, $FFFF, $FBFA, $FFFC
DATA_0DDC22:         dw $FFFF, $FFFF, $FFFF, $07FF
DATA_0DDC2A:         dw $0C08, $0E0D, $FF0F, $0B0A
DATA_0DDC32:         dw $FFFF, $FFFF, $17FF, $1C18
DATA_0DDC3A:         dw $1E1D, $191F, $1B1A, $FFFF
DATA_0DDC42:         dw $FFFF, $27FF, $2C28, $2E2D
DATA_0DDC4A:         dw $292F, $2B2A, $FFFF, $FFFF
DATA_0DDC52:         dw $3736, $3C38, $3E3D, $393F
DATA_0DDC5A:         dw $3B3A, $FF99, $FFFF, $4746
DATA_0DDC62:         dw $4C48, $4E4D, $494F, $4B4A
DATA_0DDC6A:         dw $FFA9, $06FF, $5756, $5C58
DATA_0DDC72:         dw $5E5D, $595F, $5B5A, $FFFF
DATA_0DDC7A:         dw $16FF, $6766, $0368, $0303
DATA_0DDC82:         dw $6903, $6B6A, $FFFF, $26FF
DATA_0DDC8A:         dw $7776, $0378, $0303, $7903
DATA_0DDC92:         dw $7B7A, $FF88, $FFFF, $8786
DATA_0DDC9A:         dw $0303, $0303, $8903, $8B8A
DATA_0DDCA2:         dw $FF98, $FFFF, $9190, $0303
DATA_0DDCAA:         dw $0303, $0303, $9B9A, $FFFF

DATA_0DDCB2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDCBA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDCC2:         dw $FFFF, $FFFF, $B0A0, $FFEF
DATA_0DDCCA:         dw $FFFF, $FFFF, $FFFF, $01FF
DATA_0DDCD2:         dw $0C02, $0E0D, $FF0F, $0504
DATA_0DDCDA:         dw $FFFF, $FFFF, $11FF, $8312
DATA_0DDCE2:         dw $2E2D, $1334, $1514, $FFFF
DATA_0DDCEA:         dw $FFFF, $21FF, $3C28, $3E3D
DATA_0DDCF2:         dw $293F, $2524, $FFFF, $FFFF
DATA_0DDCFA:         dw $3130, $9338, $4E4D, $39AB
DATA_0DDD02:         dw $353A, $FF25, $FFFF, $4140
DATA_0DDD0A:         dw $A342, $CECD, $43BB, $4544
DATA_0DDD12:         dw $FFFF, $A4FF, $2322, $DC52
DATA_0DDD1A:         dw $DEDD, $53DF, $A6A5, $FFA7
DATA_0DDD22:         dw $B4FF, $3332, $0303, $0303
DATA_0DDD2A:         dw $0303, $B6B5, $FFB7, $C4FF
DATA_0DDD32:         dw $9796, $0303, $0303, $0303
DATA_0DDD3A:         dw $C6C5, $FFC7, $FFFF, $8786
DATA_0DDD42:         dw $0303, $0303, $0303, $F6F5
DATA_0DDD4A:         dw $FFFF, $FFFF, $9190, $0303
DATA_0DDD52:         dw $0303, $0303, $9594, $FFFF

DATA_0DDD5A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDD62:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDD6A:         dw $FFFF, $6CFF, $6E6D, $FF6F
DATA_0DDD72:         dw $FFFF, $FFFF, $FFFF, $01FF
DATA_0DDD7A:         dw $7C02, $7E7D, $FF7F, $0504
DATA_0DDD82:         dw $FFFF, $FFFF, $11FF, $8C9D
DATA_0DDD8A:         dw $8E8D, $9E8F, $1514, $FFFF
DATA_0DDD92:         dw $FFFF, $21FF, $9CAD, $0909
DATA_0DDD9A:         dw $AE9F, $2524, $FFFF, $FFFF
DATA_0DDDA2:         dw $3130, $ACBD, $0909, $BEAF
DATA_0DDDAA:         dw $353A, $FF25, $FFFF, $4140
DATA_0DDDB2:         dw $BC42, $0909, $43BF, $4544
DATA_0DDDBA:         dw $FFFF, $A4FF, $2322, $CC52
DATA_0DDDC2:         dw $CECD, $53CF, $A6A5, $FFA7
DATA_0DDDCA:         dw $B4FF, $3332, $DC03, $DEDD
DATA_0DDDD2:         dw $03DF, $B6B5, $FFB7, $C4FF
DATA_0DDDDA:         dw $9796, $0303, $0303, $0303
DATA_0DDDE2:         dw $C6C5, $FFC7, $FFFF, $8786
DATA_0DDDEA:         dw $0303, $0303, $0303, $F6F5
DATA_0DDDF2:         dw $FFFF, $FFFF, $9190, $0303
DATA_0DDDFA:         dw $0303, $0303, $9594, $FFFF

DATA_0DDE02:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDE0A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0DDE12:         dw $FFFF, $6CFF, $6E6D, $FF6F
DATA_0DDE1A:         dw $FFFF, $FFFF, $A1FF, $01FF
DATA_0DDE22:         dw $7C02, $7E7D, $FF7F, $05A8
DATA_0DDE2A:         dw $FFAA, $B1FF, $B3B2, $8C9D
DATA_0DDE32:         dw $8E8D, $9E8F, $B9B8, $FFBA
DATA_0DDE3A:         dw $C1C0, $C3C2, $9CAD, $0909
DATA_0DDE42:         dw $AE9F, $C9C8, $CBCA, $D1D0
DATA_0DDE4A:         dw $D3D2, $ACD4, $0909, $D7AF
DATA_0DDE52:         dw $D9D8, $DBDA, $FFFF, $E3E2
DATA_0DDE5A:         dw $BCE4, $0909, $E7BF, $E9E8
DATA_0DDE62:         dw $FFFF, $FFFF, $F3F2, $CCF4
DATA_0DDE6A:         dw $CECD, $F7CF, $F9F8, $FF25
DATA_0DDE72:         dw $FFFF, $E1E0, $DC03, $DEDD
DATA_0DDE7A:         dw $03DF, $D6D5, $FFFF, $FFFF
DATA_0DDE82:         dw $F1F0, $0303, $0303, $0303
DATA_0DDE8A:         dw $E6E5, $FFFF, $FFFF, $8786
DATA_0DDE92:         dw $0303, $0303, $0303, $F6F5
DATA_0DDE9A:         dw $FFFF, $FFFF, $9190, $0303
DATA_0DDEA2:         dw $0303, $0303, $9594, $FFFF

; mecha bowser sub
CODE_0DDEAA:
  LDA $7402,x                               ; $0DDEAA |
  ASL A                                     ; $0DDEAD |
  ASL A                                     ; $0DDEAE |
  TAY                                       ; $0DDEAF |
  REP #$10                                  ; $0DDEB0 |
  LDA $DB2C,y                               ; $0DDEB2 |
  STA $7400,x                               ; $0DDEB5 |
  LDA $DB2A,y                               ; $0DDEB8 |
  STA $00                                   ; $0DDEBB |
  LDA #$1D39                                ; $0DDEBD |
  STA $02                                   ; $0DDEC0 |
  LDA #$000D                                ; $0DDEC2 |
  STA $0001                                 ; $0DDEC5 |
  LDA #$000C                                ; $0DDEC8 |
  STA $04                                   ; $0DDECB |

CODE_0DDECD:
  LDX $00                                   ; $0DDECD |
  TXA                                       ; $0DDECF |
  CLC                                       ; $0DDED0 |
  ADC #$000E                                ; $0DDED1 |
  STA $00                                   ; $0DDED4 |
  LDY $02                                   ; $0DDED6 |
  TYA                                       ; $0DDED8 |
  CLC                                       ; $0DDED9 |
  ADC #$0080                                ; $0DDEDA |
  STA $02                                   ; $0DDEDD |
  LDA #$000E                                ; $0DDEDF |
  JSL $00BF16                               ; $0DDEE2 |
  DEC $04                                   ; $0DDEE6 |
  BNE CODE_0DDECD                           ; $0DDEE8 |
  SEP #$10                                  ; $0DDEEA |
  LDX $12                                   ; $0DDEEC |
  LDA $1068                                 ; $0DDEEE |
  STA $3002                                 ; $0DDEF1 |
  LDA $7402,x                               ; $0DDEF4 |
  ASL A                                     ; $0DDEF7 |
  TAY                                       ; $0DDEF8 |
  LDA $106A                                 ; $0DDEF9 |
  CLC                                       ; $0DDEFC |
  ADC $DB46,y                               ; $0DDEFD |
  CLC                                       ; $0DDF00 |
  ADC $0CB0                                 ; $0DDF01 |
  STA $3004                                 ; $0DDF04 |
  LDA $106C                                 ; $0DDF07 |
  CLC                                       ; $0DDF0A |
  ADC $DB54,y                               ; $0DDF0B |
  STA $3006                                 ; $0DDF0E |
  LDA $7400,x                               ; $0DDF11 |
  STA $300A                                 ; $0DDF14 |
  LSR A                                     ; $0DDF17 |
  STA $094E                                 ; $0DDF18 |
  LDX #$09                                  ; $0DDF1B |
  LDA #$F6B0                                ; $0DDF1D |
  JSL $7EDE44                               ; $0DDF20 | GSU init
  LDA $6098                                 ; $0DDF24 |
  STA $0041                                 ; $0DDF27 |
  LDA $60A0                                 ; $0DDF2A |
  STA $0043                                 ; $0DDF2D |
  LDA $3012                                 ; $0DDF30 |
  STA $094F                                 ; $0DDF33 |
  STZ $0951                                 ; $0DDF36 |
  STZ $0953                                 ; $0DDF39 |
  STA $0955                                 ; $0DDF3C |
  LDA $300C                                 ; $0DDF3F |
  ASL A                                     ; $0DDF42 |
  SEC                                       ; $0DDF43 |
  SBC #$0048                                ; $0DDF44 |
  BPL CODE_0DDF4C                           ; $0DDF47 |
  LDA #$0000                                ; $0DDF49 |

CODE_0DDF4C:
  CMP #$0100                                ; $0DDF4C |
  BMI CODE_0DDF54                           ; $0DDF4F |
  LDA #$0100                                ; $0DDF51 |

CODE_0DDF54:
  STA $300C                                 ; $0DDF54 |
  LDA #$F4FA                                ; $0DDF57 |
  STA $301C                                 ; $0DDF5A |
  LDA #$005F                                ; $0DDF5D |
  STA $3000                                 ; $0DDF60 |
  LDA #$0001                                ; $0DDF63 |
  STA $3010                                 ; $0DDF66 |
  LDA #$000F                                ; $0DDF69 |
  STA $3018                                 ; $0DDF6C |
  LDX #$08                                  ; $0DDF6F |
  LDA #$E167                                ; $0DDF71 |
  JSL $7EDE44                               ; $0DDF74 | GSU init
  LDX $12                                   ; $0DDF78 |
  LDA $1074                                 ; $0DDF7A |
  BEQ CODE_0DDFA4                           ; $0DDF7D |
  LDY $76,x                                 ; $0DDF7F |
  CPY #$1E                                  ; $0DDF81 |
  BCS CODE_0DDFA4                           ; $0DDF83 |
  INC $1076                                 ; $0DDF85 |
  LDA #$0080                                ; $0DDF88 |
  STA $7A38,x                               ; $0DDF8B |
  LDA #$0092                                ; $0DDF8E |\ play sound #$0092
  JSL $0085D2                               ; $0DDF91 | play sound #$0092/
  LDA #$001E                                ; $0DDF95 |
  STA $76,x                                 ; $0DDF98 |
  LDA #$0080                                ; $0DDF9A |
  STA $7AF8,x                               ; $0DDF9D |
  PLA                                       ; $0DDFA0 |
  STZ $1074                                 ; $0DDFA1 |

CODE_0DDFA4:
  RTS                                       ; $0DDFA4 |

; gsu table
DATA_0DDFA5:         db $FA, $F5, $05, $0C, $00, $0A, $0D, $2D
DATA_0DDFAD:         db $0C, $00, $FC, $0D, $2C, $0C, $00, $06
DATA_0DDFB5:         db $0D, $36, $0C, $00, $02, $05, $26, $0C
DATA_0DDFBD:         db $00, $FA, $F5, $05, $0C, $02, $F2, $FD
DATA_0DDFC5:         db $14, $0C, $02, $06, $F7, $04, $0C, $00
DATA_0DDFCD:         db $00, $0E, $0A, $8C, $00, $08, $06, $0B
DATA_0DDFD5:         db $8C, $02, $00, $FE, $1A, $8C, $02, $FA
DATA_0DDFDD:         db $F5, $22, $0C, $00, $0A, $0D, $2D, $0C
DATA_0DDFE5:         db $00, $FC, $0D, $2C, $0C, $00, $06, $0D
DATA_0DDFED:         db $36, $0C, $00, $02, $05, $26, $0C, $00
DATA_0DDFF5:         db $FA, $F5, $22, $0C, $02, $F2, $FD, $14
DATA_0DDFFD:         db $0C, $02, $06, $F7, $04, $0C, $00, $00
DATA_0DE005:         db $0E, $0A, $8C, $00, $08, $06, $0B, $8C
DATA_0DE00D:         db $02, $00, $FE, $1A, $8C, $02, $F2, $F8
DATA_0DE015:         db $37, $0C, $00, $FA, $00, $68, $0C, $02
DATA_0DE01D:         db $02, $F8, $39, $0C, $00, $F2, $F8, $37
DATA_0DE025:         db $0C, $02, $0A, $0D, $2D, $0C, $00, $FC
DATA_0DE02D:         db $0D, $2C, $0C, $00, $06, $0D, $36, $0C
DATA_0DE035:         db $00, $07, $F9, $07, $0C, $00, $00, $0E
DATA_0DE03D:         db $0A, $8C, $00, $08, $06, $0B, $8C, $02
DATA_0DE045:         db $00, $FE, $1A, $8C, $02, $F3, $F7, $37
DATA_0DE04D:         db $0C, $00, $FB, $FF, $48, $0C, $02, $03
DATA_0DE055:         db $F7, $39, $0C, $00, $F3, $F7, $37, $0C
DATA_0DE05D:         db $02, $0A, $0D, $2D, $0C, $00, $FC, $0D
DATA_0DE065:         db $2C, $0C, $00, $06, $0D, $36, $0C, $00
DATA_0DE06D:         db $08, $FA, $07, $0C, $00, $00, $0E, $0A
DATA_0DE075:         db $8C, $00, $08, $06, $0B, $8C, $02, $00
DATA_0DE07D:         db $FE, $1A, $8C, $02, $F4, $F3, $45, $0C
DATA_0DE085:         db $00, $04, $FA, $57, $0C, $00, $F4, $F3
DATA_0DE08D:         db $45, $0C, $02, $FB, $FE, $66, $0C, $02
DATA_0DE095:         db $0A, $0D, $2D, $0C, $00, $FC, $0D, $2C
DATA_0DE09D:         db $0C, $00, $06, $0D, $36, $0C, $00, $0B
DATA_0DE0A5:         db $FB, $07, $0C, $00, $00, $0E, $0A, $8C
DATA_0DE0AD:         db $00, $08, $06, $0B, $8C, $02, $00, $FE
DATA_0DE0B5:         db $1A, $8C, $02, $F5, $F1, $45, $0C, $00
DATA_0DE0BD:         db $F5, $F1, $45, $0C, $02, $05, $F8, $57
DATA_0DE0C5:         db $0C, $00, $FC, $FD, $66, $0C, $02, $0A
DATA_0DE0CD:         db $0D, $2D, $0C, $00, $FC, $0D, $2C, $0C
DATA_0DE0D5:         db $00, $07, $0D, $36, $0C, $00, $0D, $F9
DATA_0DE0DD:         db $07, $0C, $00, $01, $0E, $0A, $8C, $00
DATA_0DE0E5:         db $09, $06, $0B, $8C, $02, $01, $FE, $1A
DATA_0DE0ED:         db $8C, $02, $F7, $EE, $45, $0C, $00, $07
DATA_0DE0F5:         db $F6, $57, $0C, $00, $FF, $FE, $66, $0C
DATA_0DE0FD:         db $02, $F7, $EE, $45, $0C, $02, $0A, $0D
DATA_0DE105:         db $2D, $0C, $00, $FC, $0D, $2C, $0C, $00
DATA_0DE10D:         db $07, $0D, $36, $0C, $00, $0F, $F8, $07
DATA_0DE115:         db $0C, $00, $01, $0E, $0A, $8C, $00, $09
DATA_0DE11D:         db $06, $0B, $8C, $02, $02, $FE, $1A, $8C
DATA_0DE125:         db $02, $F7, $EE, $45, $0C, $00, $F7, $EE
DATA_0DE12D:         db $45, $0C, $02, $07, $F6, $57, $0C, $00
DATA_0DE135:         db $FF, $FD, $66, $0C, $02, $0A, $0D, $2D
DATA_0DE13D:         db $0C, $00, $FC, $0D, $2C, $0C, $00, $07
DATA_0DE145:         db $0D, $36, $0C, $00, $0F, $F7, $04, $0C
DATA_0DE14D:         db $00, $01, $0E, $0A, $8C, $00, $09, $06
DATA_0DE155:         db $0B, $8C, $02, $02, $FE, $1A, $8C, $02
DATA_0DE15D:         db $F9, $F9, $05, $0C, $00, $01, $09, $26
DATA_0DE165:         db $0C, $00, $F9, $F9, $05, $0C, $02, $F1
DATA_0DE16D:         db $01, $14, $0C, $02, $0B, $0D, $2D, $0C
DATA_0DE175:         db $00, $FB, $0D, $2C, $0C, $00, $05, $0D
DATA_0DE17D:         db $36, $0C, $00, $04, $FA, $04, $0C, $00
DATA_0DE185:         db $00, $0F, $0A, $8C, $00, $08, $07, $0B
DATA_0DE18D:         db $8C, $02, $00, $FF, $1A, $8C, $02, $0B
DATA_0DE195:         db $06, $34, $8C, $00, $03, $FF, $26, $0C
DATA_0DE19D:         db $00, $FB, $EF, $05, $0C, $02, $F3, $F7
DATA_0DE1A5:         db $14, $0C, $02, $08, $F2, $07, $0C, $00
DATA_0DE1AD:         db $00, $0A, $0A, $8C, $00, $08, $02, $0B
DATA_0DE1B5:         db $8C, $02, $00, $FA, $1A, $8C, $02, $0A
DATA_0DE1BD:         db $0E, $2D, $8C, $00, $01, $0E, $2C, $8C
DATA_0DE1C5:         db $00, $FC, $06, $36, $0C, $00, $0C, $07
DATA_0DE1CD:         db $35, $0C, $00, $0B, $0F, $2D, $0C, $00
DATA_0DE1D5:         db $FE, $0F, $2C, $0C, $00, $01, $0E, $0A
DATA_0DE1DD:         db $8C, $00, $03, $06, $26, $0C, $00, $F3
DATA_0DE1E5:         db $FE, $14, $0C, $02, $FB, $F6, $05, $0C
DATA_0DE1ED:         db $02, $07, $F8, $04, $0C, $00, $09, $06
DATA_0DE1F5:         db $0B, $8C, $02, $01, $FE, $1A, $8C, $02
DATA_0DE1FD:         db $FA, $08, $35, $4C, $00, $02, $06, $26
DATA_0DE205:         db $0C, $00, $FA, $F6, $05, $0C, $02, $F2
DATA_0DE20D:         db $FE, $14, $0C, $02, $0A, $09, $36, $4C
DATA_0DE215:         db $00, $06, $F8, $04, $0C, $00, $0E, $0C
DATA_0DE21D:         db $3C, $4C, $00, $00, $0E, $0A, $8C, $00
DATA_0DE225:         db $08, $06, $0B, $8C, $02, $00, $FE, $1A
DATA_0DE22D:         db $8C, $02, $FD, $0C, $3C, $0C, $00, $FA
DATA_0DE235:         db $09, $36, $0C, $00, $02, $04, $26, $0C
DATA_0DE23D:         db $00, $FA, $F4, $05, $0C, $02, $F2, $FC
DATA_0DE245:         db $14, $0C, $02, $09, $0A, $36, $4C, $00
DATA_0DE24D:         db $06, $F6, $04, $0C, $00, $0D, $0C, $3C
DATA_0DE255:         db $4C, $00, $00, $0D, $0A, $8C, $00, $08
DATA_0DE25D:         db $05, $0B, $8C, $02, $00, $FD, $1A, $8C
DATA_0DE265:         db $02, $FE, $0C, $3C, $0C, $00, $FD, $0A
DATA_0DE26D:         db $36, $0C, $00, $02, $04, $26, $0C, $00
DATA_0DE275:         db $FA, $F4, $22, $0C, $02, $F2, $FC, $14
DATA_0DE27D:         db $0C, $02, $09, $0A, $36, $4C, $00, $06
DATA_0DE285:         db $F6, $04, $0C, $00, $0D, $0C, $3C, $4C
DATA_0DE28D:         db $00, $00, $0D, $0A, $8C, $00, $08, $05
DATA_0DE295:         db $0B, $8C, $02, $00, $FD, $1A, $8C, $02
DATA_0DE29D:         db $FE, $0C, $3C, $0C, $00, $FD, $0A, $36
DATA_0DE2A5:         db $0C, $00, $08, $09, $36, $0C, $00, $0E
DATA_0DE2AD:         db $0E, $2D, $4C, $00, $02, $07, $29, $0C
DATA_0DE2B5:         db $00, $FA, $F7, $08, $0C, $02, $F2, $FF
DATA_0DE2BD:         db $17, $0C, $02, $FD, $F4, $54, $0C, $00
DATA_0DE2C5:         db $02, $0E, $2C, $0C, $00, $0A, $03, $0B
DATA_0DE2CD:         db $8C, $02, $02, $FB, $1A, $8C, $02, $FD
DATA_0DE2D5:         db $09, $36, $0C, $00, $02, $0B, $0A, $8C
DATA_0DE2DD:         db $00, $09, $18, $6C, $CC, $00, $06, $FE
DATA_0DE2E5:         db $2F, $8C, $00, $FE, $FE, $2E, $8C, $00
DATA_0DE2ED:         db $09, $05, $34, $0C, $00, $F1, $10, $07
DATA_0DE2F5:         db $4C, $00, $F8, $0E, $6A, $0C, $02, $01
DATA_0DE2FD:         db $10, $6C, $CC, $02, $06, $0E, $0F, $8C
DATA_0DE305:         db $00, $FE, $FE, $1E, $8C, $02, $F6, $06
DATA_0DE30D:         db $0D, $8C, $02, $0C, $05, $2D, $8C, $00
DATA_0DE315:         db $09, $18, $7B, $0C, $00, $FF, $1D, $04
DATA_0DE31D:         db $CC, $00, $04, $06, $36, $8C, $00, $05
DATA_0DE325:         db $10, $5F, $0C, $00, $FD, $00, $3E, $0C
DATA_0DE32D:         db $02, $F5, $08, $4D, $0C, $02, $FF, $1D
DATA_0DE335:         db $04, $CC, $00, $01, $10, $6A, $0C, $02
DATA_0DE33D:         db $09, $0D, $6C, $CC, $02, $08, $02, $2D
DATA_0DE345:         db $0C, $00, $FF, $02, $2C, $0C, $00, $FF
DATA_0DE34D:         db $17, $2E, $0C, $00, $0B, $1F, $54, $8C
DATA_0DE355:         db $00, $03, $0A, $34, $4C, $00, $04, $05
DATA_0DE35D:         db $2D, $0C, $00, $0B, $1F, $54, $8C, $00
DATA_0DE365:         db $FB, $05, $2C, $0C, $00, $07, $07, $0F
DATA_0DE36D:         db $0C, $00, $FF, $0F, $1E, $0C, $02, $F7
DATA_0DE375:         db $07, $0D, $0C, $02, $08, $0F, $6E, $0C
DATA_0DE37D:         db $02, $0B, $06, $6C, $4C, $02, $07, $1A
DATA_0DE385:         db $3B, $8C, $00, $06, $FC, $6C, $0C, $00
DATA_0DE38D:         db $03, $0F, $35, $CC, $00, $FA, $0B, $2C
DATA_0DE395:         db $0C, $00, $03, $0B, $2D, $0C, $00, $FF
DATA_0DE39D:         db $0A, $5A, $8C, $00, $FF, $12, $3A, $8C
DATA_0DE3A5:         db $02, $07, $0A, $4B, $8C, $02, $0A, $05
DATA_0DE3AD:         db $6E, $0C, $02, $06, $FC, $6C, $0C, $02
DATA_0DE3B5:         db $14, $13, $54, $CC, $00, $06, $0A, $34
DATA_0DE3BD:         db $4C, $00, $0A, $05, $26, $0C, $00, $FA
DATA_0DE3C5:         db $FD, $14, $0C, $02, $02, $F5, $05, $0C
DATA_0DE3CD:         db $02, $10, $FF, $04, $8C, $00, $02, $06
DATA_0DE3D5:         db $0A, $0C, $00, $FB, $0E, $2C, $0C, $00
DATA_0DE3DD:         db $04, $0E, $2D, $0C, $00, $02, $0E, $1A
DATA_0DE3E5:         db $0C, $02, $0A, $06, $0B, $0C, $02, $FD
DATA_0DE3ED:         db $0A, $34, $4C, $00, $02, $07, $29, $0C
DATA_0DE3F5:         db $00, $F2, $FF, $17, $0C, $02, $FA, $F7
DATA_0DE3FD:         db $08, $0C, $02, $02, $F5, $54, $4C, $00
DATA_0DE405:         db $02, $F5, $54, $4C, $00, $0C, $0D, $2D
DATA_0DE40D:         db $0C, $00, $0C, $03, $3D, $0C, $00, $FC
DATA_0DE415:         db $0D, $2C, $0C, $00, $01, $FE, $1A, $8C
DATA_0DE41D:         db $02, $01, $0E, $0A, $8C, $00, $09, $06
DATA_0DE425:         db $0B, $8C, $02, $01, $0A, $29, $0C, $00
DATA_0DE42D:         db $F1, $02, $17, $0C, $02, $F9, $FA, $08
DATA_0DE435:         db $0C, $02, $FD, $F7, $54, $0C, $00, $FD
DATA_0DE43D:         db $F7, $54, $0C, $00, $0C, $06, $35, $0C
DATA_0DE445:         db $00, $FB, $0B, $2C, $0C, $00, $0E, $0B
DATA_0DE44D:         db $2D, $0C, $00, $01, $FE, $1A, $8C, $02
DATA_0DE455:         db $01, $0E, $0A, $8C, $00, $09, $06, $0B
DATA_0DE45D:         db $8C, $02, $03, $09, $29, $0C, $00, $FB
DATA_0DE465:         db $F9, $08, $0C, $02, $F3, $01, $17, $0C
DATA_0DE46D:         db $02, $0E, $04, $35, $0C, $00, $06, $F9
DATA_0DE475:         db $04, $0C, $00, $0D, $0C, $3C, $4C, $00
DATA_0DE47D:         db $02, $0A, $5A, $0C, $00, $0A, $02, $4B
DATA_0DE485:         db $0C, $02, $02, $FA, $3A, $0C, $02, $00
DATA_0DE48D:         db $0C, $36, $0C, $00, $11, $02, $2C, $CC
DATA_0DE495:         db $00, $0C, $08, $34, $8C, $00, $FD, $0B
DATA_0DE49D:         db $2C, $0C, $00, $06, $00, $26, $0C, $00
DATA_0DE4A5:         db $FE, $F0, $05, $0C, $02, $F6, $F8, $14
DATA_0DE4AD:         db $0C, $02, $0A, $F2, $04, $0C, $00, $0D
DATA_0DE4B5:         db $0C, $3C, $4C, $00, $02, $0C, $0A, $8C
DATA_0DE4BD:         db $00, $0A, $04, $0B, $8C, $02, $02, $FC
DATA_0DE4C5:         db $1A, $8C, $02, $FB, $03, $35, $4C, $00
DATA_0DE4CD:         db $05, $EE, $05, $0C, $00, $06, $06, $35
DATA_0DE4D5:         db $CC, $00, $FD, $04, $2D, $0C, $00, $0D
DATA_0DE4DD:         db $FE, $26, $0C, $00, $05, $EE, $05, $0C
DATA_0DE4E5:         db $02, $FD, $F6, $14, $0C, $02, $13, $F4
DATA_0DE4ED:         db $07, $0C, $00, $0D, $0C, $3C, $4C, $00
DATA_0DE4F5:         db $04, $0C, $0A, $8C, $00, $0C, $04, $0B
DATA_0DE4FD:         db $8C, $02, $04, $FC, $1A, $8C, $02, $04
DATA_0DE505:         db $EE, $05, $0C, $00, $07, $06, $35, $CC
DATA_0DE50D:         db $00, $FD, $05, $2D, $0C, $00, $0C, $FE
DATA_0DE515:         db $26, $0C, $00, $04, $EE, $05, $0C, $02
DATA_0DE51D:         db $FC, $F6, $14, $0C, $02, $12, $F4, $07
DATA_0DE525:         db $0C, $00, $0D, $0C, $3C, $4C, $00, $03
DATA_0DE52D:         db $0C, $0A, $8C, $00, $0B, $04, $0B, $8C
DATA_0DE535:         db $02, $03, $FC, $1A, $8C, $02, $F0, $04
DATA_0DE53D:         db $24, $0C, $00, $F8, $F4, $02, $0C, $02
DATA_0DE545:         db $F8, $FC, $30, $0C, $02, $0A, $09, $34
DATA_0DE54D:         db $8C, $00, $F0, $FC, $14, $0C, $00, $03
DATA_0DE555:         db $F4, $04, $0C, $00, $0D, $0C, $3C, $4C
DATA_0DE55D:         db $00, $FF, $0D, $0A, $8C, $00, $07, $05
DATA_0DE565:         db $0B, $8C, $02, $FF, $FD, $1A, $8C, $02
DATA_0DE56D:         db $FE, $0C, $3C, $0C, $00, $F1, $06, $24
DATA_0DE575:         db $0C, $00, $F9, $F6, $02, $0C, $02, $F9
DATA_0DE57D:         db $FE, $30, $0C, $02, $0A, $07, $35, $0C
DATA_0DE585:         db $00, $F1, $FE, $14, $0C, $00, $04, $F6
DATA_0DE58D:         db $04, $0C, $00, $0E, $0C, $3C, $4C, $00
DATA_0DE595:         db $FF, $0E, $0A, $8C, $00, $07, $06, $0B
DATA_0DE59D:         db $8C, $02, $FF, $FE, $1A, $8C, $02, $FC
DATA_0DE5A5:         db $0C, $3C, $0C, $00, $02, $04, $26, $0C
DATA_0DE5AD:         db $00, $FA, $F4, $02, $0C, $02, $F2, $FC
DATA_0DE5B5:         db $14, $0C, $02, $F8, $09, $44, $0C, $00
DATA_0DE5BD:         db $09, $0A, $36, $4C, $00, $06, $F6, $04
DATA_0DE5C5:         db $0C, $00, $0D, $0C, $3C, $4C, $00, $00
DATA_0DE5CD:         db $0D, $0A, $8C, $00, $08, $05, $0B, $8C
DATA_0DE5D5:         db $02, $00, $FD, $1A, $8C, $02, $FE, $0C
DATA_0DE5DD:         db $3C, $0C, $00, $02, $04, $26, $0C, $00
DATA_0DE5E5:         db $FA, $F4, $22, $0C, $02, $F2, $FC, $14
DATA_0DE5ED:         db $0C, $02, $F8, $09, $44, $0C, $00, $09
DATA_0DE5F5:         db $0A, $36, $4C, $00, $06, $F6, $04, $0C
DATA_0DE5FD:         db $00, $0D, $0C, $3C, $4C, $00, $00, $0D
DATA_0DE605:         db $0A, $8C, $00, $08, $05, $0B, $8C, $02
DATA_0DE60D:         db $00, $FD, $1A, $8C, $02, $FE, $0C, $3C
DATA_0DE615:         db $0C, $00, $F9, $F1, $02, $0C, $02, $FA
DATA_0DE61D:         db $FF, $68, $0C, $02, $F2, $F7, $37, $0C
DATA_0DE625:         db $02, $F8, $07, $44, $0C, $00, $09, $0A
DATA_0DE62D:         db $36, $4C, $00, $07, $F8, $07, $0C, $00
DATA_0DE635:         db $0D, $0C, $3C, $4C, $00, $00, $0D, $0A
DATA_0DE63D:         db $8C, $00, $08, $05, $0B, $8C, $02, $00
DATA_0DE645:         db $FD, $1A, $8C, $02, $FE, $0C, $3C, $0C
DATA_0DE64D:         db $00, $FA, $F0, $02, $0C, $02, $F3, $F6
DATA_0DE655:         db $37, $0C, $02, $FB, $FE, $48, $0C, $02
DATA_0DE65D:         db $F8, $07, $44, $0C, $00, $09, $09, $36
DATA_0DE665:         db $4C, $00, $09, $F9, $07, $0C, $00, $0D
DATA_0DE66D:         db $0C, $3C, $4C, $00, $00, $0D, $0A, $8C
DATA_0DE675:         db $00, $08, $05, $0B, $8C, $02, $00, $FD
DATA_0DE67D:         db $1A, $8C, $02, $FE, $0C, $3C, $0C, $00
DATA_0DE685:         db $F3, $02, $24, $0C, $00, $FB, $FA, $42
DATA_0DE68D:         db $0C, $02, $0A, $0D, $2D, $0C, $00, $03
DATA_0DE695:         db $0A, $3D, $CC, $00, $FB, $F2, $05, $0C
DATA_0DE69D:         db $02, $F3, $FA, $14, $0C, $00, $00, $0E
DATA_0DE6A5:         db $0A, $8C, $00, $08, $06, $0B, $8C, $02
DATA_0DE6AD:         db $00, $FE, $1A, $8C, $02, $08, $F5, $04
DATA_0DE6B5:         db $0C, $00, $FB, $0A, $3D, $CC, $00, $03
DATA_0DE6BD:         db $0B, $3D, $CC, $00, $F9, $FE, $42, $0C
DATA_0DE6C5:         db $02, $F1, $06, $24, $0C, $00, $0B, $0A
DATA_0DE6CD:         db $2D, $0C, $00, $F9, $F6, $05, $0C, $02
DATA_0DE6D5:         db $F1, $FE, $14, $0C, $00, $FF, $10, $0A
DATA_0DE6DD:         db $8C, $00, $07, $08, $0B, $8C, $02, $FF
DATA_0DE6E5:         db $00, $1A, $8C, $02, $05, $F8, $04, $0C
DATA_0DE6ED:         db $00, $FA, $0B, $3D, $CC, $00, $F5, $FE
DATA_0DE6F5:         db $24, $0C, $00, $FD, $EE, $02, $0C, $02
DATA_0DE6FD:         db $FD, $F6, $30, $0C, $02, $F5, $F6, $14
DATA_0DE705:         db $0C, $00, $09, $0D, $2D, $0C, $00, $03
DATA_0DE70D:         db $0C, $3D, $CC, $00, $00, $0E, $0A, $8C
DATA_0DE715:         db $00, $08, $06, $0B, $8C, $02, $00, $FE
DATA_0DE71D:         db $1A, $8C, $02, $FE, $0C, $3D, $CC, $00
DATA_0DE725:         db $09, $F0, $04, $0C, $00, $F5, $FE, $24
DATA_0DE72D:         db $0C, $00, $FD, $EE, $22, $0C, $02, $FD
DATA_0DE735:         db $F6, $30, $0C, $02, $F5, $F6, $14, $0C
DATA_0DE73D:         db $00, $09, $0D, $2D, $0C, $00, $03, $0C
DATA_0DE745:         db $3D, $CC, $00, $00, $0E, $0A, $8C, $00
DATA_0DE74D:         db $08, $06, $0B, $8C, $02, $00, $FE, $1A
DATA_0DE755:         db $8C, $02, $FE, $0C, $3D, $CC, $00, $09
DATA_0DE75D:         db $F0, $04, $0C, $00, $FA, $F7, $6C, $0C
DATA_0DE765:         db $02, $FF, $FF, $25, $0C, $00, $07, $FE
DATA_0DE76D:         db $41, $0C, $00, $FF, $EE, $02, $0C, $02
DATA_0DE775:         db $09, $0D, $2D, $0C, $00, $03, $0C, $3D
DATA_0DE77D:         db $CC, $00, $00, $0E, $0A, $8C, $00, $08
DATA_0DE785:         db $06, $0B, $8C, $02, $00, $FE, $1A, $8C
DATA_0DE78D:         db $02, $FE, $0C, $3D, $CC, $00, $08, $F0
DATA_0DE795:         db $07, $0C, $00, $11, $FE, $24, $4C, $00
DATA_0DE79D:         db $11, $F6, $14, $4C, $00, $01, $EE, $02
DATA_0DE7A5:         db $4C, $02, $01, $F6, $30, $4C, $02, $09
DATA_0DE7AD:         db $0D, $2D, $0C, $00, $03, $0C, $3D, $CC
DATA_0DE7B5:         db $00, $00, $0E, $0A, $8C, $00, $08, $06
DATA_0DE7BD:         db $0B, $8C, $02, $00, $FE, $1A, $8C, $02
DATA_0DE7C5:         db $FE, $0C, $3D, $CC, $00, $FD, $F0, $04
DATA_0DE7CD:         db $4C, $00, $07, $0A, $2D, $0C, $00, $02
DATA_0DE7D5:         db $04, $3D, $4C, $00, $FD, $FC, $68, $0C
DATA_0DE7DD:         db $02, $F5, $FC, $47, $0C, $00, $F5, $F4
DATA_0DE7E5:         db $37, $0C, $00, $FD, $F4, $00, $4C, $02
DATA_0DE7ED:         db $FA, $0A, $2C, $0C, $00, $00, $0E, $0A
DATA_0DE7F5:         db $8C, $00, $08, $06, $0B, $8C, $02, $00
DATA_0DE7FD:         db $FE, $1A, $8C, $02, $03, $EF, $54, $0C
DATA_0DE805:         db $00, $FC, $F2, $10, $0C, $00, $0B, $08
DATA_0DE80D:         db $2D, $0C, $00, $FA, $08, $2C, $0C, $00
DATA_0DE815:         db $06, $02, $36, $CC, $00, $04, $02, $31
DATA_0DE81D:         db $8C, $00, $FC, $F2, $10, $0C, $02, $F4
DATA_0DE825:         db $FA, $17, $0C, $02, $00, $0D, $0A, $8C
DATA_0DE82D:         db $00, $08, $05, $0B, $8C, $02, $00, $FD
DATA_0DE835:         db $1A, $8C, $02, $03, $F1, $54, $4C, $00
DATA_0DE83D:         db $FC, $FE, $10, $0C, $02, $F4, $06, $17
DATA_0DE845:         db $0C, $02, $04, $0E, $31, $8C, $00, $FF
DATA_0DE84D:         db $FC, $54, $0C, $00, $0E, $04, $3D, $8C
DATA_0DE855:         db $00, $0A, $05, $5F, $0C, $00, $02, $F5
DATA_0DE85D:         db $3E, $0C, $02, $FA, $FD, $4D, $0C, $02
DATA_0DE865:         db $F8, $FB, $3D, $4C, $00, $0C, $F7, $2D
DATA_0DE86D:         db $0C, $00, $00, $F4, $2C, $0C, $00, $10
DATA_0DE875:         db $06, $3D, $8C, $00, $FC, $FD, $10, $0C
DATA_0DE87D:         db $02, $F4, $05, $17, $0C, $02, $04, $0D
DATA_0DE885:         db $31, $8C, $00, $00, $FB, $54, $4C, $00
DATA_0DE88D:         db $0C, $0A, $0F, $8C, $00, $04, $FA, $1E
DATA_0DE895:         db $8C, $02, $08, $F8, $2C, $4C, $00, $12
DATA_0DE89D:         db $FE, $2D, $0C, $00, $FD, $FB, $3D, $4C
DATA_0DE8A5:         db $00, $FC, $02, $0D, $8C, $02, $FC, $FC
DATA_0DE8AD:         db $10, $0C, $02, $F4, $04, $17, $0C, $02
DATA_0DE8B5:         db $04, $0C, $31, $8C, $00, $01, $FA, $54
DATA_0DE8BD:         db $4C, $00, $01, $FA, $54, $4C, $00, $0F
DATA_0DE8C5:         db $0C, $3D, $8C, $00, $03, $0D, $5A, $0C
DATA_0DE8CD:         db $00, $03, $FD, $3A, $0C, $02, $0B, $05
DATA_0DE8D5:         db $4B, $0C, $02, $0E, $00, $2C, $CC, $00
DATA_0DE8DD:         db $17, $07, $2D, $8C, $00, $0B, $FC, $3B
DATA_0DE8E5:         db $0C, $00, $FC, $FD, $10, $0C, $02, $F4
DATA_0DE8ED:         db $05, $17, $0C, $02, $04, $0D, $31, $8C
DATA_0DE8F5:         db $00, $02, $FC, $54, $4C, $00, $02, $FC
DATA_0DE8FD:         db $54, $4C, $00, $0F, $0B, $3D, $8C, $00
DATA_0DE905:         db $03, $0C, $5A, $0C, $00, $03, $FC, $3A
DATA_0DE90D:         db $0C, $02, $0B, $04, $4B, $0C, $02, $16
DATA_0DE915:         db $0C, $2D, $8C, $00, $FC, $FD, $08, $0C
DATA_0DE91D:         db $02, $F4, $05, $17, $0C, $02, $04, $0D
DATA_0DE925:         db $29, $0C, $00, $02, $FC, $54, $4C, $00
DATA_0DE92D:         db $02, $FA, $3A, $0C, $00, $0A, $0A, $36
DATA_0DE935:         db $4C, $00, $02, $FA, $3A, $0C, $02, $0A
DATA_0DE93D:         db $02, $4B, $0C, $02, $12, $0C, $2D, $CC
DATA_0DE945:         db $00, $0A, $0C, $2C, $8C, $00, $02, $0A
DATA_0DE94D:         db $5A, $0C, $00, $FB, $FD, $08, $0C, $02
DATA_0DE955:         db $F3, $05, $17, $0C, $02, $03, $0D, $29
DATA_0DE95D:         db $0C, $00, $01, $FC, $54, $4C, $00, $00
DATA_0DE965:         db $F8, $3A, $0C, $00, $08, $08, $36, $4C
DATA_0DE96D:         db $00, $00, $F8, $3A, $0C, $02, $08, $00
DATA_0DE975:         db $4B, $0C, $02, $0F, $0C, $2D, $CC, $00
DATA_0DE97D:         db $06, $0C, $2C, $8C, $00, $00, $08, $5A
DATA_0DE985:         db $0C, $00, $F8, $FA, $10, $0C, $00, $00
DATA_0DE98D:         db $0A, $29, $0C, $00, $F8, $FA, $10, $0C
DATA_0DE995:         db $02, $F0, $02, $17, $0C, $02, $0C, $0D
DATA_0DE99D:         db $2D, $0C, $00, $FA, $0D, $2C, $0C, $00
DATA_0DE9A5:         db $05, $0D, $36, $0C, $00, $03, $FB, $04
DATA_0DE9AD:         db $0C, $00, $00, $0F, $0A, $8C, $00, $08
DATA_0DE9B5:         db $07, $0B, $8C, $02, $00, $FF, $1A, $8C
DATA_0DE9BD:         db $02, $0C, $08, $36, $4C, $00, $FA, $02
DATA_0DE9C5:         db $04, $4C, $00, $FA, $08, $70, $8C, $00
DATA_0DE9CD:         db $FA, $10, $50, $8C, $02, $02, $08, $61
DATA_0DE9D5:         db $8C, $02, $03, $FA, $2E, $8C, $00, $0B
DATA_0DE9DD:         db $0A, $0F, $8C, $00, $03, $FA, $1E, $8C
DATA_0DE9E5:         db $02, $FB, $02, $0D, $8C, $02, $0F, $04
DATA_0DE9ED:         db $2D, $8C, $00, $0F, $04, $2D, $8C, $00
DATA_0DE9F5:         db $00, $FE, $00, $02

riding_baby_bowser:
  LDA $60A8                                 ; $0DE9F9 |
  BEQ CODE_0DEA21                           ; $0DE9FC |
  STZ $1060                                 ; $0DE9FE |
  CLC                                       ; $0DEA01 |
  ADC #$0200                                ; $0DEA02 |
  CMP #$0400                                ; $0DEA05 |
  BCC CODE_0DEA44                           ; $0DEA08 |
  LDA $7A98,x                               ; $0DEA0A |
  BNE CODE_0DEA4A                           ; $0DEA0D |
  LDA #$0008                                ; $0DEA0F |
  STA $7A98,x                               ; $0DEA12 |
  INC $7402,x                               ; $0DEA15 |
  LDY $7402,x                               ; $0DEA18 |
  CPY #$21                                  ; $0DEA1B |
  BEQ CODE_0DEA4A                           ; $0DEA1D |
  BRA CODE_0DEA44                           ; $0DEA1F |

CODE_0DEA21:
  LDA $60C2                                 ; $0DEA21 |
  BNE CODE_0DEA2B                           ; $0DEA24 |
  LDA $0035                                 ; $0DEA26 |
  BNE CODE_0DEA44                           ; $0DEA29 |

CODE_0DEA2B:
  LDY $1060                                 ; $0DEA2B |
  INY                                       ; $0DEA2E |
  INY                                       ; $0DEA2F |
  STY $1060                                 ; $0DEA30 |
  BPL CODE_0DEA3A                           ; $0DEA33 |
  LDY #$7F                                  ; $0DEA35 |
  STY $1060                                 ; $0DEA37 |

CODE_0DEA3A:
  CPY #$20                                  ; $0DEA3A |
  BCC CODE_0DEA44                           ; $0DEA3C |
  TXY                                       ; $0DEA3E |
  JSR CODE_0DCF8F                           ; $0DEA3F |
  BRA CODE_0DEA5F                           ; $0DEA42 |

CODE_0DEA44:
  LDA #$0020                                ; $0DEA44 |
  STA $7402,x                               ; $0DEA47 |

CODE_0DEA4A:
  LDA #$003F                                ; $0DEA4A |
  STA $7A36,x                               ; $0DEA4D |
  STA $7902,x                               ; $0DEA50 |
  LDA #$0047                                ; $0DEA53 |
  STA $7A38,x                               ; $0DEA56 |
  LDA #$FFFF                                ; $0DEA59 |
  STA $7900,x                               ; $0DEA5C |

CODE_0DEA5F:
  LDA $0035                                 ; $0DEA5F |
  AND #$0300                                ; $0DEA62 |
  CMP $0D98                                 ; $0DEA65 |
  BEQ CODE_0DEA8F                           ; $0DEA68 |
  STA $0D98                                 ; $0DEA6A |
  CMP #$0000                                ; $0DEA6D |
  BEQ CODE_0DEA8F                           ; $0DEA70 |
  LDY $18,x                                 ; $0DEA72 |
  BEQ CODE_0DEA83                           ; $0DEA74 |
  LDA $7A96,x                               ; $0DEA76 |
  BEQ CODE_0DEA83                           ; $0DEA79 |
  CPY #$04                                  ; $0DEA7B |
  BPL CODE_0DEAA8                           ; $0DEA7D |
  INC $18,x                                 ; $0DEA7F |
  BRA CODE_0DEA87                           ; $0DEA81 |

CODE_0DEA83:
  LDY #$01                                  ; $0DEA83 |
  STY $18,x                                 ; $0DEA85 |

CODE_0DEA87:
  LDA #$0040                                ; $0DEA87 |
  STA $7A96,x                               ; $0DEA8A |
  BRA CODE_0DEA96                           ; $0DEA8D |

CODE_0DEA8F:
  LDA $7A96,x                               ; $0DEA8F |
  BNE CODE_0DEA96                           ; $0DEA92 |
  STZ $18,x                                 ; $0DEA94 |

CODE_0DEA96:
  LDA $60D4                                 ; $0DEA96 |
  BEQ CODE_0DEAA3                           ; $0DEA99 |
  LDA $60FC                                 ; $0DEA9B |
  AND #$0007                                ; $0DEA9E |
  BNE CODE_0DEAA8                           ; $0DEAA1 |

CODE_0DEAA3:
  LDA $61B2                                 ; $0DEAA3 |
  BPL CODE_0DEAD2                           ; $0DEAA6 |

CODE_0DEAA8:
  STZ $18,x                                 ; $0DEAA8 |
  LDA #$0010                                ; $0DEAAA |
  STA $6F00,x                               ; $0DEAAD |
  STZ $0390                                 ; $0DEAB0 |
  LDY $60C4                                 ; $0DEAB3 |
  LDA $E9F5,y                               ; $0DEAB6 |
  STA $7220,x                               ; $0DEAB9 |
  STA $75E0,x                               ; $0DEABC |
  JSR CODE_0DC7B3                           ; $0DEABF |
  LDA #$FD00                                ; $0DEAC2 |
  STA $7222,x                               ; $0DEAC5 |
  LDA #$0020                                ; $0DEAC8 |
  STA $7AF8,x                               ; $0DEACB |
  ASL A                                     ; $0DEACE |
  STA $7542,x                               ; $0DEACF |

CODE_0DEAD2:
  RTL                                       ; $0DEAD2 |
  LDA #$0080                                ; $0DEAD3 |
  STA $7E1A                                 ; $0DEAD6 |
  LDA #$0134                                ; $0DEAD9 |
  JSL $03A364                               ; $0DEADC |
  STY $105E                                 ; $0DEAE0 |
  STZ $105C                                 ; $0DEAE3 |
  LDA $03B0                                 ; $0DEAE6 |
  BEQ CODE_0DEB33                           ; $0DEAE9 |
  LDA #$0100                                ; $0DEAEB |
  STA $70E2,y                               ; $0DEAEE |
  LDA #$07B0                                ; $0DEAF1 |
  STA $7182,y                               ; $0DEAF4 |
  LDA #$000C                                ; $0DEAF7 |
  STA $7402,y                               ; $0DEAFA |
  LDA #$0013                                ; $0DEAFD |
  STA $79D6,y                               ; $0DEB00 |
  LDX #$1C                                  ; $0DEB03 |

CODE_0DEB05:
  LDA $5FEA3C,x                             ; $0DEB05 |
  STA $702F2E,x                             ; $0DEB09 |
  STA $7021C2,x                             ; $0DEB0D |
  LDA $5FEA00,x                             ; $0DEB11 |
  STA $702E2E,x                             ; $0DEB15 |
  STA $7020C2,x                             ; $0DEB19 |
  LDA $5FEA1E,x                             ; $0DEB1D |
  STA $702E4E,x                             ; $0DEB21 |
  STA $7020E2,x                             ; $0DEB25 |
  DEX                                       ; $0DEB29 |
  DEX                                       ; $0DEB2A |
  BPL CODE_0DEB05                           ; $0DEB2B |
  LDX $12                                   ; $0DEB2D |
  JML $03A31E                               ; $0DEB2F |

CODE_0DEB33:
  INC $03B0                                 ; $0DEB33 |
  LDA #$0150                                ; $0DEB36 |
  STA $70E2,y                               ; $0DEB39 |
  LDA #$077D                                ; $0DEB3C |
  STA $7182,y                               ; $0DEB3F |
  LDA #$000A                                ; $0DEB42 |
  STA $79D8,y                               ; $0DEB45 |
  LDA #$0012                                ; $0DEB48 |
  STA $79D6,y                               ; $0DEB4B |
  JSL $029507                               ; $0DEB4E |
  BRA CODE_0DEB58                           ; $0DEB52 |
  JML $03A31E                               ; $0DEB54 |

CODE_0DEB58:
  INC $7402,x                               ; $0DEB58 |
  RTL                                       ; $0DEB5B |

DATA_0DEB5C:         dw $EBAA, $EBE7, $EC74, $ECE2
DATA_0DEB64:         dw $ED47, $EDAC, $EE00, $EEAB
DATA_0DEB6C:         dw $EEEC, $EFF1

  LDY $7402,x                               ; $0DEB70 |
  BNE CODE_0DEB8E                           ; $0DEB73 |
  JSL $03AA52                               ; $0DEB75 |
  REP #$10                                  ; $0DEB79 |
  LDA $7362,x                               ; $0DEB7B |
  CLC                                       ; $0DEB7E |
  ADC #$0020                                ; $0DEB7F |
  TAY                                       ; $0DEB82 |
  LDA #$8000                                ; $0DEB83 |
  STA $6000,y                               ; $0DEB86 |
  STA $6008,y                               ; $0DEB89 |
  SEP #$10                                  ; $0DEB8C |

CODE_0DEB8E:
  LDA $61B0                                 ; $0DEB8E |
  ORA $0B55                                 ; $0DEB91 |
  ORA $0398                                 ; $0DEB94 |
  BEQ CODE_0DEBA1                           ; $0DEB97 |
  JSL $03B697                               ; $0DEB99 |
  JSL $03B716                               ; $0DEB9D |

CODE_0DEBA1:
  TXY                                       ; $0DEBA1 |
  LDA $76,x                                 ; $0DEBA2 |
  ASL A                                     ; $0DEBA4 |
  TAX                                       ; $0DEBA5 |
  JSR ($EB5C,x)                             ; $0DEBA6 |
  RTL                                       ; $0DEBA9 |

; state 0x13 - pre-cutscene idle (without kamek)
  TYX                                       ; $0DEBAA |
  LDA $608C                                 ; $0DEBAB |
  CMP #$0060                                ; $0DEBAE |
  BMI CODE_0DEBE6                           ; $0DEBB1 |
  LDA #$0002                                ; $0DEBB3 |
  STA $60AC                                 ; $0DEBB6 |
  LDA #$0100                                ; $0DEBB9 |
  STA $617A                                 ; $0DEBBC |
  LDA #$00F1                                ; $0DEBBF |
  STA $004D                                 ; $0DEBC2 |
  LDA $7C16,x                               ; $0DEBC5 |
  CMP #$0068                                ; $0DEBC8 |
  BPL CODE_0DEBD8                           ; $0DEBCB |
  STZ $617A                                 ; $0DEBCD |
  LDA $60A8                                 ; $0DEBD0 |
  BNE CODE_0DEBE6                           ; $0DEBD3 |
  INC $76,x                                 ; $0DEBD5 |
  RTS                                       ; $0DEBD7 |

CODE_0DEBD8:
  LDA #$0100                                ; $0DEBD8 |
  CMP $60A8                                 ; $0DEBDB |
  BPL CODE_0DEBE6                           ; $0DEBDE |
  STA $60A8                                 ; $0DEBE0 |
  STA $60B4                                 ; $0DEBE3 |

CODE_0DEBE6:
  RTS                                       ; $0DEBE6 |

; state 0x14 - pre-cutscene centering screen on baby bowser (without kamek)
  TYX                                       ; $0DEBE7 |
  STY $0C1E                                 ; $0DEBE8 |
  LDA $60B0                                 ; $0DEBEB |
  CMP #$0020                                ; $0DEBEE |
  BPL CODE_0DEC1A                           ; $0DEBF1 |
  LDA $7360,x                               ; $0DEBF3 |
  CMP #$008E                                ; $0DEBF6 |
  BEQ CODE_0DEC0A                           ; $0DEBF9 |
  LDA #$0114                                ; $0DEBFB |
  STA $18,x                                 ; $0DEBFE |
  LDA #$000C                                ; $0DEC00 |
  STA $78,x                                 ; $0DEC03 |
  LDA #$0114                                ; $0DEC05 |
  BRA CODE_0DEC0D                           ; $0DEC08 |

CODE_0DEC0A:
  LDA #$0111                                ; $0DEC0A |

CODE_0DEC0D:
  STA $704070                               ; $0DEC0D |
  INC $0071                                 ; $0DEC11 |
  INC $0D0F                                 ; $0DEC14 |
  INC $76,x                                 ; $0DEC17 |
  RTS                                       ; $0DEC19 |

CODE_0DEC1A:
  INC $0039                                 ; $0DEC1A |
  LDA $0039                                 ; $0DEC1D |
  STA $0C23                                 ; $0DEC20 |
  RTS                                       ; $0DEC23 |

DATA_0DEC24:         db $08, $05, $08, $07, $08, $05, $08, $07
DATA_0DEC2C:         db $08, $05, $08, $07, $09, $0A, $09, $07
DATA_0DEC34:         db $09, $0A, $09, $07, $09, $0A, $09, $07
DATA_0DEC3C:         db $09, $0A, $09, $07, $09, $0A, $09, $07
DATA_0DEC44:         db $09, $0A, $09, $07, $09, $0A, $09, $07

DATA_0DEC4C:         db $02, $06, $02, $06, $02, $06, $02, $06
DATA_0DEC54:         db $02, $06, $02, $20, $02, $06, $02, $06
DATA_0DEC5C:         db $02, $06, $02, $06, $02, $06, $02, $06
DATA_0DEC64:         db $02, $06, $02, $06, $02, $06, $02, $06
DATA_0DEC6C:         db $02, $06, $02, $06, $02, $06, $02, $01

  TYX                                       ; $0DEC74 |
  LDA $7A98,x                               ; $0DEC75 |
  BNE CODE_0DECE1                           ; $0DEC78 |
  LDY $16,x                                 ; $0DEC7A |
  CPY #$28                                  ; $0DEC7C |
  BMI CODE_0DECBF                           ; $0DEC7E |
  STZ $0071                                 ; $0DEC80 |
  PHB                                       ; $0DEC83 |
  REP #$10                                  ; $0DEC84 |
  LDX #$2D6C                                ; $0DEC86 |\
  LDY #$2F6C                                ; $0DEC89 | | move 512 bytes from
  LDA #$01FF                                ; $0DEC8C | | $702D6C to $702F6C
  MVN $70,$70                               ; $0DEC8F |/
  SEP #$10                                  ; $0DEC92 |
  PLB                                       ; $0DEC94 |
  LDX #$1C                                  ; $0DEC95 |

CODE_0DEC97:
  LDA $5FEA00,x                             ; $0DEC97 |
  STA $70302E,x                             ; $0DEC9B |
  LDA $5FEA1E,x                             ; $0DEC9F |
  STA $70304E,x                             ; $0DECA3 |
  LDA $5FF5B0,x                             ; $0DECA7 |
  STA $70312E,x                             ; $0DECAB |
  DEX                                       ; $0DECAF |
  DEX                                       ; $0DECB0 |
  BPL CODE_0DEC97                           ; $0DECB1 |
  LDX $12                                   ; $0DECB3 |
  LDA #$0000                                ; $0DECB5 |
  STA $70336C                               ; $0DECB8 |
  INC $76,x                                 ; $0DECBC |
  RTS                                       ; $0DECBE |

CODE_0DECBF:
  INY                                       ; $0DECBF |
  STY $16,x                                 ; $0DECC0 |
  LDA $EC23,y                               ; $0DECC2 |
  AND #$00FF                                ; $0DECC5 |
  STA $7402,x                               ; $0DECC8 |
  LDA $EC4B,y                               ; $0DECCB |
  AND #$00FF                                ; $0DECCE |
  STA $7A98,x                               ; $0DECD1 |
  TYA                                       ; $0DECD4 |
  AND #$0007                                ; $0DECD5 |
  BNE CODE_0DECE1                           ; $0DECD8 |
  LDA #$005B                                ; $0DECDA |\ play sound #$005B
  JSL $0085D2                               ; $0DECDD | play sound #$005B/

CODE_0DECE1:
  RTS                                       ; $0DECE1 |
  TYX                                       ; $0DECE2 |
  LDA $0D0F                                 ; $0DECE3 |
  BNE CODE_0DED46                           ; $0DECE6 |
  LDA $70336C                               ; $0DECE8 |
  BNE CODE_0DECF4                           ; $0DECEC |
  LDA #$0009                                ; $0DECEE |
  STA $004D                                 ; $0DECF1 |

CODE_0DECF4:
  CMP #$0020                                ; $0DECF4 |
  BCS CODE_0DED13                           ; $0DECF7 |
  LDA #$2D6C                                ; $0DECF9 |
  STA $70336E                               ; $0DECFC |
  LDA #$2F6C                                ; $0DED00 |
  STA $703370                               ; $0DED03 |
  LDX #$08                                  ; $0DED07 |
  LDA #$B4A9                                ; $0DED09 |
  JSL $7EDE44                               ; $0DED0C | GSU init
  LDX $12                                   ; $0DED10 |
  RTS                                       ; $0DED12 |

CODE_0DED13:
  LDY $105C                                 ; $0DED13 |
  BEQ CODE_0DED46                           ; $0DED16 |
  LDA #$0040                                ; $0DED18 |
  STA $7A98,x                               ; $0DED1B |
  LDA #$000B                                ; $0DED1E |
  STA $7402,x                               ; $0DED21 |
  INC $76,x                                 ; $0DED24 |
  LDX #$1C                                  ; $0DED26 |

CODE_0DED28:
  LDA $70302E,x                             ; $0DED28 |
  STA $702E2E,x                             ; $0DED2C |
  LDA $70304E,x                             ; $0DED30 |
  STA $702E4E,x                             ; $0DED34 |
  LDA $70312E,x                             ; $0DED38 |
  STA $702F2E,x                             ; $0DED3C |
  DEX                                       ; $0DED40 |
  DEX                                       ; $0DED41 |
  BPL CODE_0DED28                           ; $0DED42 |
  LDX $12                                   ; $0DED44 |

CODE_0DED46:
  RTS                                       ; $0DED46 |
  TYX                                       ; $0DED47 |
  LDA $7A98,x                               ; $0DED48 |
  BNE CODE_0DED79                           ; $0DED4B |
  LDA $7220,x                               ; $0DED4D |
  BEQ CODE_0DED67                           ; $0DED50 |
  LDA #$0112                                ; $0DED52 |
  STA $704070                               ; $0DED55 |
  INC $0D0F                                 ; $0DED59 |
  STZ $16,x                                 ; $0DED5C |
  STZ $7220,x                               ; $0DED5E |
  INC $0071                                 ; $0DED61 |
  INC $76,x                                 ; $0DED64 |
  RTS                                       ; $0DED66 |

CODE_0DED67:
  LDA #$FC00                                ; $0DED67 |
  STA $7220,x                               ; $0DED6A |
  LDA #$0004                                ; $0DED6D |
  STA $7A98,x                               ; $0DED70 |
  LDA #$000C                                ; $0DED73 |
  STA $7402,x                               ; $0DED76 |

CODE_0DED79:
  RTS                                       ; $0DED79 |

DATA_0DED7A:         db $0D, $0C, $0B, $0C, $0D, $0C, $0B, $0C
DATA_0DED82:         db $0D, $0C, $0B, $0C, $0D, $0C, $0B, $0C
DATA_0DED8A:         db $0D, $0C, $0B, $0C, $0D, $0C, $0B, $0C
DATA_0DED92:         db $0D

DATA_0DED93:         db $04, $02, $04, $02, $10, $02, $04, $02
DATA_0DED9B:         db $04, $02, $04, $02, $04, $02, $04, $02
DATA_0DEDA3:         db $04, $02, $04, $02, $04, $02, $04, $02
DATA_0DEDAB:         db $01

  TYX                                       ; $0DEDAC |
  LDA $7A98,x                               ; $0DEDAD |
  BNE CODE_0DEDF7                           ; $0DEDB0 |
  LDY $16,x                                 ; $0DEDB2 |
  CPY #$19                                  ; $0DEDB4 |
  BMI CODE_0DEDD5                           ; $0DEDB6 |
  LDX #$1C                                  ; $0DEDB8 |

CODE_0DEDBA:
  LDA $5FEA3C,x                             ; $0DEDBA |
  STA $70312E,x                             ; $0DEDBE |
  DEX                                       ; $0DEDC2 |
  DEX                                       ; $0DEDC3 |
  BPL CODE_0DEDBA                           ; $0DEDC4 |
  LDX $12                                   ; $0DEDC6 |
  STZ $0071                                 ; $0DEDC8 |
  LDA #$0000                                ; $0DEDCB |
  STA $70336C                               ; $0DEDCE |
  INC $76,x                                 ; $0DEDD2 |
  RTS                                       ; $0DEDD4 |

CODE_0DEDD5:
  INY                                       ; $0DEDD5 |
  STY $16,x                                 ; $0DEDD6 |
  LDA $ED79,y                               ; $0DEDD8 |
  AND #$00FF                                ; $0DEDDB |
  STA $7402,x                               ; $0DEDDE |
  LDA $ED92,y                               ; $0DEDE1 |
  AND #$00FF                                ; $0DEDE4 |
  STA $7A98,x                               ; $0DEDE7 |
  TYA                                       ; $0DEDEA |
  AND #$0007                                ; $0DEDEB |
  BNE CODE_0DEDF7                           ; $0DEDEE |
  LDA #$005B                                ; $0DEDF0 |\ play sound #$005B
  JSL $0085D2                               ; $0DEDF3 | play sound #$005B/

CODE_0DEDF7:
  RTS                                       ; $0DEDF7 |

DATA_0DEDF8:         dw $FF00, $FEC0, $FE40, $FE00

  TYX                                       ; $0DEE00 |
  LDY $105E                                 ; $0DEE01 |
  LDA $7CD6,y                               ; $0DEE04 |
  SEC                                       ; $0DEE07 |
  SBC $7CD6,x                               ; $0DEE08 |
  CMP #$0012                                ; $0DEE0B |
  BPL CODE_0DEE19                           ; $0DEE0E |
  LDA #$000E                                ; $0DEE10 |
  STA $7402,x                               ; $0DEE13 |
  INC $76,x                                 ; $0DEE16 |
  RTS                                       ; $0DEE18 |

CODE_0DEE19:
  LDA $7A98,x                               ; $0DEE19 |
  BNE CODE_0DEE2D                           ; $0DEE1C |
  LDA #$0002                                ; $0DEE1E |
  STA $7A98,x                               ; $0DEE21 |
  LDA $7402,x                               ; $0DEE24 |
  EOR #$0001                                ; $0DEE27 |
  STA $7402,x                               ; $0DEE2A |

CODE_0DEE2D:
  JSR CODE_0DEE80                           ; $0DEE2D |
  LDA $7A96,x                               ; $0DEE30 |
  BNE CODE_0DEE7F                           ; $0DEE33 |
  LDA #$0004                                ; $0DEE35 |
  STA $7A96,x                               ; $0DEE38 |
  LDA $10                                   ; $0DEE3B |
  AND #$0006                                ; $0DEE3D |
  TAY                                       ; $0DEE40 |
  LDA $EDF8,y                               ; $0DEE41 |
  STA $00                                   ; $0DEE44 |
  LDA $11                                   ; $0DEE46 |
  AND #$0006                                ; $0DEE48 |
  TAY                                       ; $0DEE4B |
  LDA $EDF8,y                               ; $0DEE4C |
  STA $02                                   ; $0DEE4F |
  LDA #$0227                                ; $0DEE51 |
  JSL $008B21                               ; $0DEE54 |
  LDA $70E2,x                               ; $0DEE58 |
  CLC                                       ; $0DEE5B |
  ADC #$000C                                ; $0DEE5C |
  STA $70A2,y                               ; $0DEE5F |
  LDA $7182,x                               ; $0DEE62 |
  SEC                                       ; $0DEE65 |
  SBC #$000A                                ; $0DEE66 |
  STA $7142,y                               ; $0DEE69 |
  LDA $00                                   ; $0DEE6C |
  STA $71E0,y                               ; $0DEE6E |
  LDA $02                                   ; $0DEE71 |
  STA $71E2,y                               ; $0DEE73 |
  LDA #$0010                                ; $0DEE76 |
  STA $7782,y                               ; $0DEE79 |
  STA $7500,y                               ; $0DEE7C |

CODE_0DEE7F:
  RTS                                       ; $0DEE7F |

CODE_0DEE80:
  LDA $7978,y                               ; $0DEE80 |
  CMP #$007C                                ; $0DEE83 |
  BMI CODE_0DEEAA                           ; $0DEE86 |
  LDA $70336C                               ; $0DEE88 |
  CMP #$0020                                ; $0DEE8C |
  BPL CODE_0DEEAA                           ; $0DEE8F |
  LDA #$2D6C                                ; $0DEE91 |
  STA $70336E                               ; $0DEE94 |
  LDA #$2F6C                                ; $0DEE98 |
  STA $703370                               ; $0DEE9B |
  LDX #$08                                  ; $0DEE9F |
  LDA #$B4A9                                ; $0DEEA1 |
  JSL $7EDE44                               ; $0DEEA4 | GSU init
  LDX $12                                   ; $0DEEA8 |

CODE_0DEEAA:
  RTS                                       ; $0DEEAA |
  TYX                                       ; $0DEEAB |
  LDY $7D36,x                               ; $0DEEAC |
  BEQ CODE_0DEED4                           ; $0DEEAF |
  JSL $03AD74                               ; $0DEEB1 |
  LDA #$0100                                ; $0DEEB5 |
  STA $7A36,x                               ; $0DEEB8 |
  JSR CODE_0DEFA2                           ; $0DEEBB |
  LDA #$0002                                ; $0DEEBE |
  STA $7400,x                               ; $0DEEC1 |
  LDA $70E2,x                               ; $0DEEC4 |
  CLC                                       ; $0DEEC7 |
  ADC #$0010                                ; $0DEEC8 |
  STA $70E2,x                               ; $0DEECB |
  STZ $7402,x                               ; $0DEECE |
  INC $76,x                                 ; $0DEED1 |
  RTS                                       ; $0DEED3 |

CODE_0DEED4:
  LDA $7A98,x                               ; $0DEED4 |
  BNE CODE_0DEEE8                           ; $0DEED7 |
  LDA #$0002                                ; $0DEED9 |
  STA $7A98,x                               ; $0DEEDC |
  LDA $7402,x                               ; $0DEEDF |
  EOR #$0001                                ; $0DEEE2 |
  STA $7402,x                               ; $0DEEE5 |

CODE_0DEEE8:
  JSR CODE_0DEE80                           ; $0DEEE8 |

CODE_0DEEEB:
  RTS                                       ; $0DEEEB |
  TYX                                       ; $0DEEEC |
  LDY $105C                                 ; $0DEEED |
  CPY #$01                                  ; $0DEEF0 |
  BEQ CODE_0DEF29                           ; $0DEEF2 |
  LDY $105E                                 ; $0DEEF4 |
  LDA $7402,y                               ; $0DEEF7 |
  CMP #$0018                                ; $0DEEFA |
  BNE CODE_0DEEEB                           ; $0DEEFD |
  LDA #$FD80                                ; $0DEEFF |
  STA $7220,x                               ; $0DEF02 |
  LDA #$0180                                ; $0DEF05 |
  STA $75E0,x                               ; $0DEF08 |
  LDA #$0010                                ; $0DEF0B |
  STA $7540,x                               ; $0DEF0E |
  LDA #$FF00                                ; $0DEF11 |
  STA $7222,x                               ; $0DEF14 |
  LDA #$2000                                ; $0DEF17 |
  STA $6FA2,x                               ; $0DEF1A |
  STZ $16,x                                 ; $0DEF1D |
  INC $76,x                                 ; $0DEF1F |
  LDA #$000C                                ; $0DEF21 |\ play sound #$000C
  JSL $0085D2                               ; $0DEF24 | play sound #$000C/
  RTS                                       ; $0DEF28 |

CODE_0DEF29:
  LDY $105E                                 ; $0DEF29 |
  LDA $7222,y                               ; $0DEF2C |
  BMI CODE_0DEF90                           ; $0DEF2F |
  LDA #$0010                                ; $0DEF31 |
  STA $3000                                 ; $0DEF34 |
  LDA $7A36,x                               ; $0DEF37 |
  STA $300C                                 ; $0DEF3A |
  LDX #$0B                                  ; $0DEF3D |
  LDA #$86B6                                ; $0DEF3F |
  JSL $7EDE44                               ; $0DEF42 | GSU init
  LDX $12                                   ; $0DEF46 |
  LDA $7182,x                               ; $0DEF48 |
  CLC                                       ; $0DEF4B |
  ADC #$0018                                ; $0DEF4C |
  SEC                                       ; $0DEF4F |
  SBC $3000                                 ; $0DEF50 |
  STA $00                                   ; $0DEF53 |
  LDA #$000C                                ; $0DEF55 |
  STA $3000                                 ; $0DEF58 | r0
  LDA $7A36,x                               ; $0DEF5B |
  STA $300C                                 ; $0DEF5E | r6
  LDX #$0B                                  ; $0DEF61 |
  LDA #$86B6                                ; $0DEF63 |
  JSL $7EDE44                               ; $0DEF66 | GSU init
  LDX $12                                   ; $0DEF6A |
  LDY $105E                                 ; $0DEF6C |
  LDA $7CD8,y                               ; $0DEF6F |
  SEC                                       ; $0DEF72 |
  SBC $00                                   ; $0DEF73 |
  CLC                                       ; $0DEF75 |
  ADC $7BB8,y                               ; $0DEF76 |
  CLC                                       ; $0DEF79 |
  ADC $3000                                 ; $0DEF7A |
  BMI CODE_0DEF90                           ; $0DEF7D |
  LDA $7A36,x                               ; $0DEF7F |
  SEC                                       ; $0DEF82 |
  SBC #$0018                                ; $0DEF83 |
  CMP #$0020                                ; $0DEF86 |
  BPL CODE_0DEF9F                           ; $0DEF89 |
  LDA #$0020                                ; $0DEF8B |
  BRA CODE_0DEF9F                           ; $0DEF8E |

CODE_0DEF90:
  LDA $7A36,x                               ; $0DEF90 |
  CLC                                       ; $0DEF93 |
  ADC #$0004                                ; $0DEF94 |
  CMP #$0060                                ; $0DEF97 |
  BMI CODE_0DEF9F                           ; $0DEF9A |
  LDA #$0060                                ; $0DEF9C |

CODE_0DEF9F:
  STA $7A36,x                               ; $0DEF9F |

CODE_0DEFA2:
  LDA $7A36,x                               ; $0DEFA2 |
  STA $3016                                 ; $0DEFA5 | r11
  LDA #$0100                                ; $0DEFA8 |
  STA $300C                                 ; $0DEFAB | r6
  LDA #$0010                                ; $0DEFAE |
  STA $3010                                 ; $0DEFB1 | r8
  ASL A                                     ; $0DEFB4 |
  STA $3012                                 ; $0DEFB5 | r9
  LDA #$0055                                ; $0DEFB8 |
  STA $301A                                 ; $0DEFBB | r13
  LDA #$60C1                                ; $0DEFBE |
  STA $3018                                 ; $0DEFC1 | r12
  LDY $7722,x                               ; $0DEFC4 |
  TYX                                       ; $0DEFC7 |
  LDA $03A9CE,x                             ; $0DEFC8 |
  STA $3006                                 ; $0DEFCC | r3
  LDA $03A9EE,x                             ; $0DEFCF |
  STA $3004                                 ; $0DEFD3 | r2
  LDX #$08                                  ; $0DEFD6 |
  LDA #$8295                                ; $0DEFD8 |
  JSL $7EDE44                               ; $0DEFDB | GSU init
  LDX $12                                   ; $0DEFDF |
  INC $0CF9                                 ; $0DEFE1 |
  RTS                                       ; $0DEFE4 |

DATA_0DEFE5:         dw $0008, $FFFE

DATA_0DEFE9:         dw $0060, $0020

DATA_0DEFED:         dw $0001, $FFFF

  TYX                                       ; $0DEFF1 |
  JSL $03A2C7                               ; $0DEFF2 |
  BCC CODE_0DF000                           ; $0DEFF6 |
  INC $105C                                 ; $0DEFF8 |
  PLA                                       ; $0DEFFB |
  JML $03A31E                               ; $0DEFFC |

CODE_0DF000:
  LDY $16,x                                 ; $0DF000 |
  LDA $7A36,x                               ; $0DF002 |
  CLC                                       ; $0DF005 |
  ADC $EFE5,y                               ; $0DF006 |
  STA $7A36,x                               ; $0DF009 |
  SEC                                       ; $0DF00C |
  SBC $EFE9,y                               ; $0DF00D |
  EOR $EFED,y                               ; $0DF010 |
  BMI CODE_0DF022                           ; $0DF013 |
  LDA $EFE9,y                               ; $0DF015 |
  STA $7A36,x                               ; $0DF018 |
  LDA $16,x                                 ; $0DF01B |
  EOR #$0002                                ; $0DF01D |
  STA $16,x                                 ; $0DF020 |

CODE_0DF022:
  LDA $7220,x                               ; $0DF022 |
  CMP $75E0,x                               ; $0DF025 |
  BNE CODE_0DF034                           ; $0DF028 |
  LDA $75E0,x                               ; $0DF02A |
  EOR #$FFFF                                ; $0DF02D |
  INC A                                     ; $0DF030 |
  STA $75E0,x                               ; $0DF031 |

CODE_0DF034:
  JMP CODE_0DEFA2                           ; $0DF034 |
  RTL                                       ; $0DF037 |
  JSR CODE_0DF058                           ; $0DF038 |
  JSL $03AF23                               ; $0DF03B |
  JSR CODE_0DF082                           ; $0DF03F |
  JSR CODE_0DF0A3                           ; $0DF042 |
  JSR CODE_0DF0B9                           ; $0DF045 |
  JSR CODE_0DF182                           ; $0DF048 |
  RTL                                       ; $0DF04B |

DATA_0DF04C:         dw $FFE8, $0018

DATA_0DF050:         dw $0002, $FFFE

DATA_0DF054:         dw $0020, $FFE0

CODE_0DF058:
  LDA $78,x                                 ; $0DF058 |
  STA $3004                                 ; $0DF05A |
  LDY $7400,x                               ; $0DF05D |
  LDA $F04C,y                               ; $0DF060 |
  CLC                                       ; $0DF063 |
  ADC $7680,x                               ; $0DF064 |
  STA $3012                                 ; $0DF067 |
  LDA $F050,y                               ; $0DF06A |
  STA $300A                                 ; $0DF06D |
  LDA $F054,y                               ; $0DF070 |
  STA $3010                                 ; $0DF073 |
  LDX #$0B                                  ; $0DF076 |
  LDA #$96EA                                ; $0DF078 |
  JSL $7EDE44                               ; $0DF07B | GSU init
  LDX $12                                   ; $0DF07F |
  RTS                                       ; $0DF081 |

CODE_0DF082:
  LDA $76,x                                 ; $0DF082 |
  BEQ CODE_0DF092                           ; $0DF084 |
  CLC                                       ; $0DF086 |
  ADC $78,x                                 ; $0DF087 |
  STA $78,x                                 ; $0DF089 |
  BPL CODE_0DF0A2                           ; $0DF08B |
  PLA                                       ; $0DF08D |
  JML $03A31E                               ; $0DF08E |

CODE_0DF092:
  LDA $78,x                                 ; $0DF092 |
  CLC                                       ; $0DF094 |
  ADC #$00C0                                ; $0DF095 |
  CMP #$0A00                                ; $0DF098 |
  BMI CODE_0DF0A0                           ; $0DF09B |
  LDA #$0A00                                ; $0DF09D |

CODE_0DF0A0:
  STA $78,x                                 ; $0DF0A0 |

CODE_0DF0A2:
  RTS                                       ; $0DF0A2 |

CODE_0DF0A3:
  LDY $7D36,x                               ; $0DF0A3 |
  BPL CODE_0DF0A2                           ; $0DF0A6 |
  LDA $7AF8,x                               ; $0DF0A8 |
  BNE CODE_0DF0A2                           ; $0DF0AB |
  STZ $60D4                                 ; $0DF0AD |
  JSL $03A858                               ; $0DF0B0 |

CODE_0DF0B4:
  RTS                                       ; $0DF0B4 |

DATA_0DF0B5:         dw $FE80, $0180

CODE_0DF0B9:
  LDA $7AF6,x                               ; $0DF0B9 |
  BNE CODE_0DF0B4                           ; $0DF0BC |
  TXA                                       ; $0DF0BE |
  STA $3002                                 ; $0DF0BF | r1
  LDX #$09                                  ; $0DF0C2 |
  LDA #$9011                                ; $0DF0C4 |
  JSL $7EDE44                               ; $0DF0C7 | GSU init

CODE_0DF0CB:
  LDX $12                                   ; $0DF0CB |
  LDY $301C                                 ; $0DF0CD |
  BMI CODE_0DF0B4                           ; $0DF0D0 |
  BEQ CODE_0DF0B4                           ; $0DF0D2 |
  LDA $6F00,y                               ; $0DF0D4 |
  CMP #$0010                                ; $0DF0D7 |
  BEQ CODE_0DF0E7                           ; $0DF0DA |

CODE_0DF0DC:
  LDX #$09                                  ; $0DF0DC |
  LDA $301E                                 ; $0DF0DE |
  JSL $7EDE44                               ; $0DF0E1 | GSU init
  BRA CODE_0DF0CB                           ; $0DF0E5 |

CODE_0DF0E7:
  CPY $105E                                 ; $0DF0E7 |
  BNE CODE_0DF13F                           ; $0DF0EA |
  LDA $79D6,y                               ; $0DF0EC |
  CMP #$0009                                ; $0DF0EF |
  BPL CODE_0DF0DC                           ; $0DF0F2 |
  LDA $7222,y                               ; $0DF0F4 |
  BMI CODE_0DF0DC                           ; $0DF0F7 |
  LDY $7400,x                               ; $0DF0F9 |
  LDA $F0B5,y                               ; $0DF0FC |
  LDY $105E                                 ; $0DF0FF |
  STA $7220,y                               ; $0DF102 |
  LDA #$FA00                                ; $0DF105 |
  STA $7222,y                               ; $0DF108 |
  LDA #$0040                                ; $0DF10B |
  STA $7542,y                               ; $0DF10E |
  LDA #$0047                                ; $0DF111 |
  STA $7A36,y                               ; $0DF114 |
  STA $7902,y                               ; $0DF117 |
  LDA #$004E                                ; $0DF11A |
  STA $7A38,y                               ; $0DF11D |
  LDA #$FFFF                                ; $0DF120 |
  STA $7900,y                               ; $0DF123 |
  LDA #$000A                                ; $0DF126 |
  STA $79D6,y                               ; $0DF129 |
  LDA #$008A                                ; $0DF12C |
  LDY $1062                                 ; $0DF12F |
  CPY #$02                                  ; $0DF132 |
  BMI CODE_0DF139                           ; $0DF134 |
  LDA #$008E                                ; $0DF136 |\ play sound #$008E

CODE_0DF139:
  JSL $0085D2                               ; $0DF139 |/

CODE_0DF13D:
  BRA CODE_0DF0DC                           ; $0DF13D |

CODE_0DF13F:
  LDA $7360,y                               ; $0DF13F |
  CMP #$0128                                ; $0DF142 |
  BNE CODE_0DF0DC                           ; $0DF145 |
  TYA                                       ; $0DF147 |
  CMP $7A36,x                               ; $0DF148 |
  BEQ CODE_0DF0DC                           ; $0DF14B |
  CMP $18,x                                 ; $0DF14D |
  BEQ CODE_0DF0DC                           ; $0DF14F |
  LDA $7220,x                               ; $0DF151 |
  EOR $7220,y                               ; $0DF154 |
  BPL CODE_0DF0DC                           ; $0DF157 |
  LDA $7CD6,y                               ; $0DF159 |
  SEC                                       ; $0DF15C |
  SBC $7CD6,x                               ; $0DF15D |
  EOR $7220,x                               ; $0DF160 |
  BPL CODE_0DF168                           ; $0DF163 |
  JMP CODE_0DF0DC                           ; $0DF165 |

CODE_0DF168:
  LDA $79D6,y                               ; $0DF168 |
  CLC                                       ; $0DF16B |
  ADC #$FF40                                ; $0DF16C |
  STA $79D6,y                               ; $0DF16F |
  LDA $76,x                                 ; $0DF172 |
  CLC                                       ; $0DF174 |
  ADC #$FF40                                ; $0DF175 |
  STA $76,x                                 ; $0DF178 |
  STY $18,x                                 ; $0DF17A |
  TXA                                       ; $0DF17C |
  STA $7978,y                               ; $0DF17D |
  BRA CODE_0DF13D                           ; $0DF180 |

CODE_0DF182:
  LDA $7A96,x                               ; $0DF182 |
  BNE CODE_0DF19A                           ; $0DF185 |
  LDA $10                                   ; $0DF187 |
  AND #$0003                                ; $0DF189 |
  CLC                                       ; $0DF18C |
  ADC #$0004                                ; $0DF18D |
  STA $7A96,x                               ; $0DF190 |
  LDA #$0014                                ; $0DF193 |\ play sound #$0014
  JSL $0085D2                               ; $0DF196 |/

CODE_0DF19A:
  RTS                                       ; $0DF19A |

DATA_0DF19B:         dw $0459, $052B, $0528, $0525
DATA_0DF1A3:         dw $0522, $004E, $004D

; state 0x3E
  TYX                                       ; $0DF1A9 |
  LDA $7A96,x                               ; $0DF1AA |
  BEQ CODE_0DF20F                           ; $0DF1AD |
  CMP #$0080                                ; $0DF1AF |
  BNE CODE_0DF1B9                           ; $0DF1B2 |
  LDY #$0A                                  ; $0DF1B4 |
  STY $004D                                 ; $0DF1B6 |

CODE_0DF1B9:
  LSR A                                     ; $0DF1B9 |
  BNE CODE_0DF20C                           ; $0DF1BA |
  LDY #$02                                  ; $0DF1BC |
  STY $011C                                 ; $0DF1BE |
  LDA #$1100                                ; $0DF1C1 |
  STA $0967                                 ; $0DF1C4 |
  LDA $094A                                 ; $0DF1C7 |
  EOR #$00DE                                ; $0DF1CA |
  STA $094A                                 ; $0DF1CD |
  LDA #$7FFF                                ; $0DF1D0 |
  STA $702000                               ; $0DF1D3 |
  LDA #$2800                                ; $0DF1D7 |
  STA $0C18                                 ; $0DF1DA |
  LDA #$0007                                ; $0DF1DD |
  STA $0C14                                 ; $0DF1E0 |
  LDA #$6800                                ; $0DF1E3 |
  STA $3000                                 ; $0DF1E6 |
  LDA #$0002                                ; $0DF1E9 |
  STA $3002                                 ; $0DF1EC |
  LDA #$01CE                                ; $0DF1EF |
  STA $3004                                 ; $0DF1F2 |
  LDA #$0400                                ; $0DF1F5 |
  STA $3018                                 ; $0DF1F8 |
  LDX #$08                                  ; $0DF1FB |
  LDA #$AA8B                                ; $0DF1FD |
  JSL $7EDE44                               ; $0DF200 | GSU init
  LDX $12                                   ; $0DF204 |
  LDA #$B400                                ; $0DF206 |
  STA $0CF9                                 ; $0DF209 |

CODE_0DF20C:
  JMP CODE_0DDEAA                           ; $0DF20C |

CODE_0DF20F:
  LDA #$001A                                ; $0DF20F |
  STA $60AC                                 ; $0DF212 |
  STZ $61AE                                 ; $0DF215 |
  LDA $6094                                 ; $0DF218 |
  CMP #$0280                                ; $0DF21B |
  BCS CODE_0DF232                           ; $0DF21E |
  ADC #$0010                                ; $0DF220 |
  CMP #$0280                                ; $0DF223 |
  BCC CODE_0DF22B                           ; $0DF226 |
  LDA #$0280                                ; $0DF228 |

CODE_0DF22B:
  STA $0C23                                 ; $0DF22B |
  STA $0C1E                                 ; $0DF22E |
  RTS                                       ; $0DF231 |

CODE_0DF232:
  STA $7E18                                 ; $0DF232 |
  STZ $0C1E                                 ; $0DF235 |
  REP #$10                                  ; $0DF238 |
  LDA $0C14                                 ; $0DF23A |
  ASL A                                     ; $0DF23D |
  TAY                                       ; $0DF23E |
  LDX $F199,y                               ; $0DF23F |
  CPY #$000A                                ; $0DF242 |
  BCC CODE_0DF25C                           ; $0DF245 |
  BEQ CODE_0DF256                           ; $0DF247 |
  TXA                                       ; $0DF249 |
  JSL $00B753                               ; $0DF24A |
  LDX #$6800                                ; $0DF24E |
  LDA #$0800                                ; $0DF251 |
  BRA CODE_0DF286                           ; $0DF254 |

CODE_0DF256:
  LDA #$5600                                ; $0DF256 |
  STA $0C18                                 ; $0DF259 |

CODE_0DF25C:
  LDA $06F95E,x                             ; $0DF25C |
  STA $3002                                 ; $0DF260 |
  LDA $06F960,x                             ; $0DF263 |
  AND #$00FF                                ; $0DF267 |
  STA $3000                                 ; $0DF26A |
  LDA #$0010                                ; $0DF26D |
  STA $3006                                 ; $0DF270 |
  SEP #$10                                  ; $0DF273 |
  LDX #$0A                                  ; $0DF275 |
  LDA #$8000                                ; $0DF277 |
  JSL $7EDE44                               ; $0DF27A | GSU init
  REP #$10                                  ; $0DF27E |
  LDX #$5800                                ; $0DF280 |
  LDA #$0400                                ; $0DF283 |

CODE_0DF286:
  STA $00                                   ; $0DF286 |
  LDY #$0070                                ; $0DF288 |
  STY $0001                                 ; $0DF28B |
  LDY $0C18                                 ; $0DF28E |
  JSL $00BEA6                               ; $0DF291 |
  SEP #$10                                  ; $0DF295 |
  LDX $12                                   ; $0DF297 |
  LDA $00                                   ; $0DF299 |
  LSR A                                     ; $0DF29B |
  ADC $0C18                                 ; $0DF29C |
  STA $0C18                                 ; $0DF29F |
  DEC $0C14                                 ; $0DF2A2 |
  BEQ CODE_0DF2A8                           ; $0DF2A5 |
  RTS                                       ; $0DF2A7 |

CODE_0DF2A8:
  LDX #$1C                                  ; $0DF2A8 |

CODE_0DF2AA:
  LDA $5FC328,x                             ; $0DF2AA |
  STA $702D6E,x                             ; $0DF2AE |
  STA $702002,x                             ; $0DF2B2 |
  LDA $5FEA3C,x                             ; $0DF2B6 |
  STA $702F2E,x                             ; $0DF2BA |
  STA $7021C2,x                             ; $0DF2BE |
  DEX                                       ; $0DF2C2 |
  DEX                                       ; $0DF2C3 |
  BPL CODE_0DF2AA                           ; $0DF2C4 |
  LDX $12                                   ; $0DF2C6 |
  JSR CODE_0DD5F7                           ; $0DF2C8 |
  LDA #$7FFF                                ; $0DF2CB |
  STA $702000                               ; $0DF2CE |
  STZ $61CE                                 ; $0DF2D2 |
  STZ $61AE                                 ; $0DF2D5 |
  JSL $028922                               ; $0DF2D8 |
  STZ $60C4                                 ; $0DF2DC |
  LDA #$02C8                                ; $0DF2DF |
  STA $608C                                 ; $0DF2E2 |
  LDA #$07A0                                ; $0DF2E5 |
  STA $6090                                 ; $0DF2E8 |
  LDA #$0358                                ; $0DF2EB |
  STA $70E2,x                               ; $0DF2EE |
  LDA #$0298                                ; $0DF2F1 |
  STA $7182,x                               ; $0DF2F4 |
  STZ $7220,x                               ; $0DF2F7 |
  STZ $7222,x                               ; $0DF2FA |
  LDA #$0040                                ; $0DF2FD |
  STA $7542,x                               ; $0DF300 |
  LDA #$0400                                ; $0DF303 |
  STA $75E2,x                               ; $0DF306 |
  LDA #$0047                                ; $0DF309 |
  STA $7A36,x                               ; $0DF30C |
  STA $7902,x                               ; $0DF30F |
  LDA #$004E                                ; $0DF312 |
  STA $7A38,x                               ; $0DF315 |
  LDA #$FFFF                                ; $0DF318 |
  STA $7900,x                               ; $0DF31B |
  STZ $16,x                                 ; $0DF31E |
  SEP #$20                                  ; $0DF320 |
  LDA #$2C                                  ; $0DF322 |
  STA $7180,x                               ; $0DF324 |
  REP #$20                                  ; $0DF327 |
  RTS                                       ; $0DF329 |

; state 0x21 - baby bowser falling in frame
  JSR CODE_0DCF8F                           ; $0DF32A |
  LDA $7860,x                               ; $0DF32D |
  AND #$0001                                ; $0DF330 |
  BEQ CODE_0DF357                           ; $0DF333 |
  LDY $7402,x                               ; $0DF335 |
  CPY #$0F                                  ; $0DF338 |
  BNE CODE_0DF357                           ; $0DF33A |
  LDA #$008E                                ; $0DF33C |\ play sound #$008E
  JSL $0085D2                               ; $0DF33F |/

CODE_0DF343:
  LDA #$004E                                ; $0DF343 |
  STA $7A36,x                               ; $0DF346 |
  LDA #$0056                                ; $0DF349 |
  STA $7A38,x                               ; $0DF34C |
  LDA #$0001                                ; $0DF34F |
  STA $7900,x                               ; $0DF352 |
  INC $76,x                                 ; $0DF355 |

CODE_0DF357:
  RTS                                       ; $0DF357 |

; state 0x22 - flopping around on the ground
  JSR CODE_0DCF8F                           ; $0DF358 |
  BCC CODE_0DF35F                           ; $0DF35B |
  INC $76,x                                 ; $0DF35D |

CODE_0DF35F:
  RTS                                       ; $0DF35F |

; state 0x23 - cutscene with kamek
  TYX                                       ; $0DF360 |
  LDY $16,x                                 ; $0DF361 |
  BNE CODE_0DF382                           ; $0DF363 |
  LDA #$0125                                ; $0DF365 |
  JSL $03A34C                               ; $0DF368 |
  BCC CODE_0DF382                           ; $0DF36C |
  LDA #$0000                                ; $0DF36E |
  STA $70E2,y                               ; $0DF371 |
  INC $16,x                                 ; $0DF374 |
  LDA #$0015                                ; $0DF376 |
  STA $0967                                 ; $0DF379 |
  STZ $6098                                 ; $0DF37C |
  STZ $60A0                                 ; $0DF37F |

CODE_0DF382:
  RTS                                       ; $0DF382 |

; state 0x24 - unload baby bowser sprite
  TYX                                       ; $0DF383 |
  REP #$10                                  ; $0DF384 |
  LDA #$005E                                ; $0DF386 |
  JSL $00B753                               ; $0DF389 |
  LDX #$6800                                ; $0DF38D |
  LDA #$0070                                ; $0DF390 |
  STA $0001                                 ; $0DF393 |
  LDY #$5800                                ; $0DF396 |
  LDA #$0800                                ; $0DF399 |
  JSL $00BEA6                               ; $0DF39C |
  SEP #$10                                  ; $0DF3A0 |
  LDX #$1C                                  ; $0DF3A2 |

CODE_0DF3A4:
  LDA $5FF592,x                             ; $0DF3A4 |
  STA $7021C2,x                             ; $0DF3A8 |
  DEX                                       ; $0DF3AC |
  DEX                                       ; $0DF3AD |
  BPL CODE_0DF3A4                           ; $0DF3AE |
  LDX $12                                   ; $0DF3B0 |
  INC $76,x                                 ; $0DF3B2 |
  LDA #$9000                                ; $0DF3B4 |
  STA $0C18                                 ; $0DF3B7 |
  LDA #$0480                                ; $0DF3BA |
  STA $7E1A                                 ; $0DF3BD |
  LDA #$0026                                ; $0DF3C0 |
  STA $60AC                                 ; $0DF3C3 |
  STZ $617E                                 ; $0DF3C6 |
  STZ $61F6                                 ; $0DF3C9 |
  LDA #$0011                                ; $0DF3CC |
  STA $0967                                 ; $0DF3CF |
  LDA #$F3E8                                ; $0DF3D2 |
  STA $18,x                                 ; $0DF3D5 |
  LDA #$9000                                ; $0DF3D7 |
  STA $0C18                                 ; $0DF3DA |
  LDY #$3C                                  ; $0DF3DD |
  STY $012E                                 ; $0DF3DF |
  LDY #$1A                                  ; $0DF3E2 |
  STY $012D                                 ; $0DF3E4 |
  RTS                                       ; $0DF3E7 |

; gsu table
DATA_0DF3E8:         db $BD, $DF, $EC, $EA, $CF, $D0, $DB, $EC
DATA_0DF3F0:         db $DC, $D0, $EB, $E6, $D0, $EB, $DF, $DC
DATA_0DF3F8:         db $D0, $E4, $D8, $E9, $ED, $DC, $E3, $E6
DATA_0DF400:         db $EC, $EA, $FF, $0A, $EB, $DC, $D8, $E4
DATA_0DF408:         db $D0, $EE, $E6, $E9, $E2, $D0, $E6, $DD
DATA_0DF410:         db $D0, $EB, $DF, $DC, $D0, $C2, $E6, $EA
DATA_0DF418:         db $DF, $E0, $D0, $DA, $E3, $D8, $E5, $CF
DATA_0DF420:         db $FF, $09, $D0, $D0, $D0, $D0, $EB, $DF
DATA_0DF428:         db $DC, $D0, $EB, $EE, $E0, $E5, $EA, $D0
DATA_0DF430:         db $D8, $E9, $DC, $D0, $E9, $DC, $EC, $E5
DATA_0DF438:         db $E0, $EB, $DC, $DB, $F3, $FF, $0A, $FF
DATA_0DF440:         db $0A, $FF, $09, $BD, $DF, $DC, $D0, $DA
DATA_0DF448:         db $D8, $E7, $EB, $EC, $E9, $DC, $DB, $D0
DATA_0DF450:         db $EA, $EB, $E6, $E9, $E2, $D0, $E0, $EA
DATA_0DF458:         db $D0, $DD, $E9, $DC, $DC, $DB, $FF, $0A
DATA_0DF460:         db $D0, $D0, $D9, $F0, $D0, $C2, $E6, $EA
DATA_0DF468:         db $DF, $E0, $CF, $D0, $D8, $E5, $DB, $D0
DATA_0DF470:         db $EA, $DC, $EB, $EA, $D0, $D8, $D9, $E6
DATA_0DF478:         db $EC, $EB, $FF, $09, $D0, $D0, $DF, $E0
DATA_0DF480:         db $EA, $D0, $DB, $EC, $EB, $F0, $D0, $D8
DATA_0DF488:         db $E5, $DB, $D0, $DD, $E0, $E5, $D8, $E3
DATA_0DF490:         db $E3, $F0, $D0, $E4, $D8, $E2, $DC, $EA
DATA_0DF498:         db $FF, $0A, $D0, $D0, $EB, $DF, $DC, $D0
DATA_0DF4A0:         db $E3, $E6, $E5, $DE, $D0, $D8, $EE, $D8
DATA_0DF4A8:         db $E0, $EB, $DC, $DB, $D0, $DB, $DC, $E3
DATA_0DF4B0:         db $E0, $ED, $DC, $E9, $F0, $C7, $FF, $09
DATA_0DF4B8:         db $FF, $0A, $BD, $DF, $D8, $E5, $E2, $D0
DATA_0DF4C0:         db $F0, $E6, $EC, $CF, $D0, $C2, $E6, $EA
DATA_0DF4C8:         db $DF, $E0, $C7, $D0, $BD, $DF, $DC, $D0
DATA_0DF4D0:         db $EB, $EE, $E0, $E5, $EA, $FF, $09, $D0
DATA_0DF4D8:         db $EE, $E0, $E3, $E3, $D0, $E4, $DC, $DC
DATA_0DF4E0:         db $EB, $D0, $EB, $DF, $DC, $D0, $E7, $D8
DATA_0DF4E8:         db $E9, $DC, $E5, $EB, $EA, $D0, $EA, $E6
DATA_0DF4F0:         db $E6, $E5, $C7, $FF, $09, $FF, $FF

; state 0x25 - prepare stork cutscene
  TYX                                       ; $0DF4F7 |
  LDA #$000D                                ; $0DF4F8 |
  STA $3006                                 ; $0DF4FB |
  LDA $18,x                                 ; $0DF4FE |
  STA $3008                                 ; $0DF500 |
  LDX #$09                                  ; $0DF503 |
  LDA #$F7BC                                ; $0DF505 |
  JSL $7EDE44                               ; $0DF508 | GSU init
  LDX $12                                   ; $0DF50C |
  LDY $3000                                 ; $0DF50E |
  CPY #$FF                                  ; $0DF511 |
  BEQ CODE_0DF528                           ; $0DF513 |
  LDA $301C                                 ; $0DF515 |
  STA $18,x                                 ; $0DF518 |
  LDA $0C18                                 ; $0DF51A |
  STA $0CF9                                 ; $0DF51D |
  CLC                                       ; $0DF520 |
  ADC #$0300                                ; $0DF521 |
  STA $0C18                                 ; $0DF524 |
  RTS                                       ; $0DF527 |

CODE_0DF528:
  INC $76,x                                 ; $0DF528 |
  LDX #$09                                  ; $0DF52A |
  LDA #$F77B                                ; $0DF52C |
  JSL $7EDE44                               ; $0DF52F | GSU init
  LDX $12                                   ; $0DF533 |
  LDA #$B400                                ; $0DF535 |
  STA $0CF9                                 ; $0DF538 |
  STZ $18,x                                 ; $0DF53B |
  LDA #$0A00                                ; $0DF53D |
  STA $7A96,x                               ; $0DF540 |
  LDA #$0300                                ; $0DF543 |
  STA $7A98,x                               ; $0DF546 |
  LDA #$7FFF                                ; $0DF549 |
  STA $702D6E                               ; $0DF54C |
  STA $702002                               ; $0DF550 |
  STZ $6098                                 ; $0DF554 |
  STZ $0041                                 ; $0DF557 |
  STZ $60A0                                 ; $0DF55A |
  STZ $0043                                 ; $0DF55D |
  LDY #$01                                  ; $0DF560 |
  STY $0963                                 ; $0DF562 |
  LDA #$0015                                ; $0DF565 |
  STA $0967                                 ; $0DF568 |
  LDY #$20                                  ; $0DF56B |
  STY $096B                                 ; $0DF56D |
  LDY #$B1                                  ; $0DF570 |
  STY $096C                                 ; $0DF572 |
  LDA $094A                                 ; $0DF575 |
  EOR #$001E                                ; $0DF578 |
  STA $094A                                 ; $0DF57B |
  STZ $0948                                 ; $0DF57E |
  LDA #$0040                                ; $0DF581 |
  JSL $03A34C                               ; $0DF584 |
  LDA #$04F0                                ; $0DF588 |
  STA $70E2,y                               ; $0DF58B |
  LDA #$07A0                                ; $0DF58E |
  STA $7182,y                               ; $0DF591 |
  LDA #$0041                                ; $0DF594 |
  JSL $03A34C                               ; $0DF597 |
  LDA #$0530                                ; $0DF59B |
  STA $70E2,y                               ; $0DF59E |
  LDA #$0732                                ; $0DF5A1 |
  STA $7182,y                               ; $0DF5A4 |
  LDY #$3D                                  ; $0DF5A7 |
  STY $012E                                 ; $0DF5A9 |
  LDY #$16                                  ; $0DF5AC |
  STY $012D                                 ; $0DF5AE |
  RTS                                       ; $0DF5B1 |

; state 0x26 - stork cutscene
  TYX                                       ; $0DF5B2 |
  LDA $60A0                                 ; $0DF5B3 |
  CMP #$00F0                                ; $0DF5B6 |
  BCS CODE_0DF5F7                           ; $0DF5B9 |
  LDA $7A98,x                               ; $0DF5BB |
  BNE CODE_0DF608                           ; $0DF5BE |
  INC $60A0                                 ; $0DF5C0 |
  LDA #$0004                                ; $0DF5C3 |
  STA $7A98,x                               ; $0DF5C6 |
  STZ $3002                                 ; $0DF5C9 |
  LDA #$7FFF                                ; $0DF5CC |
  STA $3004                                 ; $0DF5CF |
  LDA $18,x                                 ; $0DF5D2 |
  STA $300C                                 ; $0DF5D4 |
  CLC                                       ; $0DF5D7 |
  ADC #$0002                                ; $0DF5D8 |
  CMP #$0100                                ; $0DF5DB |
  BCC CODE_0DF5E3                           ; $0DF5DE |
  LDA #$0100                                ; $0DF5E0 |

CODE_0DF5E3:
  STA $18,x                                 ; $0DF5E3 |
  LDX #$08                                  ; $0DF5E5 |
  LDA #$E132                                ; $0DF5E7 |
  JSL $7EDE44                               ; $0DF5EA | GSU init
  LDX $12                                   ; $0DF5EE |
  LDA $3006                                 ; $0DF5F0 |
  STA $0948                                 ; $0DF5F3 |
  RTS                                       ; $0DF5F6 |

CODE_0DF5F7:
  LDA $7A96,x                               ; $0DF5F7 |
  BNE CODE_0DF608                           ; $0DF5FA |
  LDA #$00F1                                ; $0DF5FC |
  STA $004D                                 ; $0DF5FF |
  LDA #$0016                                ; $0DF602 |
  STA $0118                                 ; $0DF605 |

CODE_0DF608:
  RTS                                       ; $0DF608 |

DATA_0DF609:         dw $0180, $00F8, $0060, $FFF0
DATA_0DF611:         dw $0128, $00A0, $0048

DATA_0DF617:         dw $0180, $01FF, $0180, $0180
DATA_0DF61F:         dw $01FF, $0180, $01FF

DATA_0DF625:         dw $0000, $0020, $0040

DATA_0DF62B:         dw $0100, $00C0, $0080

DATA_0DF631:         dw $0000, $0020, $0040

DATA_0DF637:         db $22, $EB, $AE, $03, $A0, $04

CODE_0DF63D:
  PHY                                       ; $0DF63D |
  LDA $F625,y                               ; $0DF63E |
  STA $300A                                 ; $0DF641 |
  LDA $F62B,y                               ; $0DF644 |
  STA $300C                                 ; $0DF647 |
  LDA $F631,y                               ; $0DF64A |
  STA $3006                                 ; $0DF64D |
  STZ $3004                                 ; $0DF650 |
  LDA #$80E0                                ; $0DF653 |
  STA $3018                                 ; $0DF656 |
  LDA #$0054                                ; $0DF659 |
  STA $301A                                 ; $0DF65C |
  LDX #$08                                  ; $0DF65F |
  LDA #$8205                                ; $0DF661 |
  JSL $7EDE44                               ; $0DF664 | GSU init
  PLY                                       ; $0DF668 |
  DEY                                       ; $0DF669 |
  DEY                                       ; $0DF66A |
  BPL CODE_0DF63D                           ; $0DF66B |
  INC $0CF9                                 ; $0DF66D |
  LDY #$1C                                  ; $0DF670 |
  LDX $011C                                 ; $0DF672 |
  CPX #$02                                  ; $0DF675 |
  BNE CODE_0DF67B                           ; $0DF677 |
  LDY #$3C                                  ; $0DF679 |

CODE_0DF67B:
  PHB                                       ; $0DF67B |
  LDX #$70                                  ; $0DF67C |
  PHX                                       ; $0DF67E |
  PLB                                       ; $0DF67F |
  LDX #$1C                                  ; $0DF680 |

CODE_0DF682:
  LDA $5FF4A0,x                             ; $0DF682 |
  STA $2F2E,y                               ; $0DF686 |
  STA $21C2,y                               ; $0DF689 |
  STA $312E,y                               ; $0DF68C |
  DEY                                       ; $0DF68F |
  DEY                                       ; $0DF690 |
  DEX                                       ; $0DF691 |
  DEX                                       ; $0DF692 |
  BPL CODE_0DF682                           ; $0DF693 |
  PLB                                       ; $0DF695 |
  LDX $12                                   ; $0DF696 |
  LDA #$0010                                ; $0DF698 |
  LDY $7902,x                               ; $0DF69B |
  BEQ CODE_0DF6AA                           ; $0DF69E |
  LDY $011C                                 ; $0DF6A0 |
  CPY #$02                                  ; $0DF6A3 |
  BEQ CODE_0DF6AA                           ; $0DF6A5 |
  LDA #$0040                                ; $0DF6A7 |

CODE_0DF6AA:
  STA $1072                                 ; $0DF6AA |
  STA $18,x                                 ; $0DF6AD |
  RTL                                       ; $0DF6AF |

DATA_0DF6B0:         dw $0200, $0204, $0004, $0400
DATA_0DF6B8:         dw $0202, $0402, $0004, $0200

DATA_0DF6C0:         dw $0800, $2001, $2001

DATA_0DF6C6:         dw $0007, $0005, $0006

DATA_0DF6CC:         dw $0C00, $0800, $0A00

DATA_0DF6D2:         dw $FC00, $0500, $FF00, $0300
DATA_0DF6DA:         dw $FE00, $FD00, $0400, $0200
DATA_0DF6E2:         dw $FD80, $0480, $FE80, $0280
DATA_0DF6EA:         dw $FD80, $FE80, $0380, $0180

DATA_0DF6F2:         dw $0400, $FB00

DATA_0DF6F6:         dw $D000, $3000

DATA_0DF6FA:         db $40, $10, $50, $20, $22, $23, $AF, $03
DATA_0DF702:         db $AD, $72, $10, $D0, $03, $4C, $C1, $F7

  LDA $14                                   ; $0DF70A |
  AND #$000F                                ; $0DF70C |
  ORA #$0040                                ; $0DF70F |
  STA $61C6                                 ; $0DF712 |
  LDA $7AF6,x                               ; $0DF715 |
  BNE CODE_0DF730                           ; $0DF718 |
  LDA $10                                   ; $0DF71A |
  AND #$0003                                ; $0DF71C |
  TAY                                       ; $0DF71F |
  LDA $F6FA,y                               ; $0DF720 |
  AND #$00FF                                ; $0DF723 |
  STA $7AF6,x                               ; $0DF726 |
  LDA #$0099                                ; $0DF729 |\ play sound #$0099
  JSL $0085D2                               ; $0DF72C |/

CODE_0DF730:
  LDA $7A96,x                               ; $0DF730 |
  BEQ CODE_0DF736                           ; $0DF733 |
  RTL                                       ; $0DF735 |

CODE_0DF736:
  LDA #$0010                                ; $0DF736 |
  LDY $7902,x                               ; $0DF739 |
  BEQ CODE_0DF741                           ; $0DF73C |
  LDA #$0008                                ; $0DF73E |

CODE_0DF741:
  STA $7A96,x                               ; $0DF741 |
  LDA $18,x                                 ; $0DF744 |
  BEQ CODE_0DF7C0                           ; $0DF746 |
  LDA #$0008                                ; $0DF748 |
  JSL $03A364                               ; $0DF74B |
  BCC CODE_0DF7C0                           ; $0DF74F |
  DEC $18,x                                 ; $0DF751 |
  PHY                                       ; $0DF753 |
  LDA $18,x                                 ; $0DF754 |
  AND #$000F                                ; $0DF756 |
  TAY                                       ; $0DF759 |
  LDX $F6B0,y                               ; $0DF75A |
  PLY                                       ; $0DF75D |
  TXA                                       ; $0DF75E |
  LSR A                                     ; $0DF75F |
  LSR A                                     ; $0DF760 |
  STA $7402,y                               ; $0DF761 |
  LDA $F6C0,x                               ; $0DF764 |
  STA $7040,y                               ; $0DF767 |
  LDA $F6C6,x                               ; $0DF76A |
  STA $74A2,y                               ; $0DF76D |
  LDA $F6CC,x                               ; $0DF770 |
  STA $00                                   ; $0DF773 |
  LDA $10                                   ; $0DF775 |
  AND #$001E                                ; $0DF777 |
  TAX                                       ; $0DF77A |
  LDA $0039                                 ; $0DF77B |
  CLC                                       ; $0DF77E |
  ADC $F6D2,x                               ; $0DF77F |
  STA $7902,y                               ; $0DF782 |
  CLC                                       ; $0DF785 |
  ADC $00                                   ; $0DF786 |
  STA $70E2,y                               ; $0DF788 |
  LDA $10                                   ; $0DF78B |
  AND #$00C0                                ; $0DF78D |
  ORA $7042,y                               ; $0DF790 |
  LDX $011C                                 ; $0DF793 |
  CPX #$02                                  ; $0DF796 |
  BNE CODE_0DF7A5                           ; $0DF798 |
  ORA #$002E                                ; $0DF79A |
  PHA                                       ; $0DF79D |
  LDA #$0000                                ; $0DF79E |
  STA $74A2,y                               ; $0DF7A1 |
  PLA                                       ; $0DF7A4 |

CODE_0DF7A5:
  STA $7042,y                               ; $0DF7A5 |
  LDX $12                                   ; $0DF7A8 |
  LDA $7902,x                               ; $0DF7AA |
  TAX                                       ; $0DF7AD |
  LDA $003B                                 ; $0DF7AE |
  CLC                                       ; $0DF7B1 |
  ADC $F6F2,x                               ; $0DF7B2 |
  STA $7182,y                               ; $0DF7B5 |
  LDA $F6F6,x                               ; $0DF7B8 |
  STA $7222,y                               ; $0DF7BB |
  LDX $12                                   ; $0DF7BE |

CODE_0DF7C0:
  RTL                                       ; $0DF7C0 |
  LDA $18,x                                 ; $0DF7C1 |
  BNE CODE_0DF7F1                           ; $0DF7C3 |
  LDY $7902,x                               ; $0DF7C5 |
  BNE CODE_0DF842                           ; $0DF7C8 |
  LDX #$1C                                  ; $0DF7CA |

CODE_0DF7CC:
  LDA $5FF4DC,x                             ; $0DF7CC |
  STA $702F2E,x                             ; $0DF7D0 |
  STA $7021C2,x                             ; $0DF7D4 |
  DEX                                       ; $0DF7D8 |
  DEX                                       ; $0DF7D9 |
  BPL CODE_0DF7CC                           ; $0DF7DA |
  LDX $12                                   ; $0DF7DC |
  STZ $74A2,x                               ; $0DF7DE |
  LDA $003B                                 ; $0DF7E1 |
  CLC                                       ; $0DF7E4 |
  ADC #$00F0                                ; $0DF7E5 |
  STA $7182,x                               ; $0DF7E8 |
  LDA #$0005                                ; $0DF7EB |
  STA $18,x                                 ; $0DF7EE |
  RTL                                       ; $0DF7F0 |

CODE_0DF7F1:
  LDA $14                                   ; $0DF7F1 |
  ASL A                                     ; $0DF7F3 |
  ASL A                                     ; $0DF7F4 |
  ASL A                                     ; $0DF7F5 |
  AND #$00FF                                ; $0DF7F6 |
  STA $300A                                 ; $0DF7F9 |
  LDA $76,x                                 ; $0DF7FC |
  STA $300C                                 ; $0DF7FE |
  LDY $7722,x                               ; $0DF801 |
  TYX                                       ; $0DF804 |
  LDA $03A9CE,x                             ; $0DF805 |
  STA $3006                                 ; $0DF809 |
  LDA $03A9EE,x                             ; $0DF80C |
  STA $3004                                 ; $0DF810 |
  LDA #$80E0                                ; $0DF813 |
  STA $3018                                 ; $0DF816 |
  LDA #$0054                                ; $0DF819 |
  STA $301A                                 ; $0DF81C |
  SEP #$10                                  ; $0DF81F |
  LDX #$08                                  ; $0DF821 |
  LDA #$877E                                ; $0DF823 |
  JSL $7EDE44                               ; $0DF826 | GSU init
  INC $0CF9                                 ; $0DF82A |
  LDX $12                                   ; $0DF82D |
  LDA $7682,x                               ; $0DF82F |
  CMP #$00F0                                ; $0DF832 |
  BMI CODE_0DF8A6                           ; $0DF835 |
  LDY $1070                                 ; $0DF837 |
  CPY #$0E                                  ; $0DF83A |
  BCS CODE_0DF842                           ; $0DF83C |
  DEC $18,x                                 ; $0DF83E |
  BNE CODE_0DF846                           ; $0DF840 |

CODE_0DF842:
  JML $03A31E                               ; $0DF842 |

CODE_0DF846:
  INY                                       ; $0DF846 |
  INY                                       ; $0DF847 |
  STY $1070                                 ; $0DF848 |
  LDA $F607,y                               ; $0DF84B |
  CLC                                       ; $0DF84E |
  ADC $7E18                                 ; $0DF84F |
  STA $70E2,x                               ; $0DF852 |
  LDA $003B                                 ; $0DF855 |
  SEC                                       ; $0DF858 |
  SBC #$0200                                ; $0DF859 |
  STA $7182,x                               ; $0DF85C |
  LDA $F615,y                               ; $0DF85F |
  STA $76,x                                 ; $0DF862 |
  LDA #$07C0                                ; $0DF864 |
  STA $78,x                                 ; $0DF867 |
  LDA #$0800                                ; $0DF869 |
  STA $7222,x                               ; $0DF86C |
  LDA #$00AC                                ; $0DF86F |
  JSL $03A364                               ; $0DF872 |
  BCC CODE_0DF89F                           ; $0DF876 |
  LDA $70E2,x                               ; $0DF878 |
  STA $70E2,y                               ; $0DF87B |
  LDA #$07C0                                ; $0DF87E |
  STA $7182,y                               ; $0DF881 |
  LDA #$0080                                ; $0DF884 |
  STA $7A96,y                               ; $0DF887 |
  LDA $76,x                                 ; $0DF88A |
  INC A                                     ; $0DF88C |
  XBA                                       ; $0DF88D |
  AND #$00FF                                ; $0DF88E |
  ASL A                                     ; $0DF891 |
  CLC                                       ; $0DF892 |
  ADC #$0002                                ; $0DF893 |
  STA $7978,y                               ; $0DF896 |
  LDA #$0040                                ; $0DF899 |
  STA $7A98,y                               ; $0DF89C |

CODE_0DF89F:
  LDA #$0020                                ; $0DF89F |\ play sound #$0020
  JML $0085D2                               ; $0DF8A2 |/

CODE_0DF8A6:
  LDA $7182,x                               ; $0DF8A6 |
  CMP #$07F0                                ; $0DF8A9 |
  BPL CODE_0DF8E9                           ; $0DF8AC |
  CMP $78,x                                 ; $0DF8AE |
  BMI CODE_0DF8E9                           ; $0DF8B0 |
  STA $0093                                 ; $0DF8B2 |
  LDA $70E2,x                               ; $0DF8B5 |
  SEC                                       ; $0DF8B8 |
  SBC #$0010                                ; $0DF8B9 |
  STA $0091                                 ; $0DF8BC |
  LDA $76,x                                 ; $0DF8BF |
  INC A                                     ; $0DF8C1 |
  ASL A                                     ; $0DF8C2 |
  XBA                                       ; $0DF8C3 |
  TAY                                       ; $0DF8C4 |
  DEY                                       ; $0DF8C5 |
  STY $0095                                 ; $0DF8C6 |
  LDA #$0003                                ; $0DF8C9 |
  STA $008F                                 ; $0DF8CC |
  JSL $109295                               ; $0DF8CF |
  LDX $12                                   ; $0DF8D3 |
  LDA $78,x                                 ; $0DF8D5 |
  CLC                                       ; $0DF8D7 |
  ADC #$0010                                ; $0DF8D8 |
  STA $78,x                                 ; $0DF8DB |
  CMP #$07D0                                ; $0DF8DD |
  BNE CODE_0DF8E9                           ; $0DF8E0 |
  LDA #$0099                                ; $0DF8E2 |\ play sound #$0099
  JSL $0085D2                               ; $0DF8E5 |/

CODE_0DF8E9:
  RTL                                       ; $0DF8E9 |

init_baby_bowser_egg:
  RTL                                       ; $0DF8EA |

DATA_0DF8EB:         dw $0000
DATA_0DF8ED:         dw $0000
DATA_0DF8EF:         dw $0000
DATA_0DF8F1:         dw $0100
DATA_0DF8F3:         dw $0101
DATA_0DF8F5:         dw $0202
DATA_0DF8F7:         dw $0302
DATA_0DF8F9:         dw $0303

main_baby_bowser_egg:
  LDA $7D38,x                               ; $0DF8FB |
  BNE CODE_0DF903                           ; $0DF8FE |
  JMP CODE_0DFA74                           ; $0DF900 |

CODE_0DF903:
  LDA #$0004                                ; $0DF903 |
  JSR CODE_0DFA94                           ; $0DF906 |
  LDA $7682,x                               ; $0DF909 |
  CLC                                       ; $0DF90C |
  ADC $3004                                 ; $0DF90D |
  STA $7682,x                               ; $0DF910 |
  CMP #$FFC0                                ; $0DF913 |
  BPL CODE_0DF98B                           ; $0DF916 |
  LDA $70E2,x                               ; $0DF918 |
  CLC                                       ; $0DF91B |
  ADC $3002                                 ; $0DF91C |
  STA $70E2,x                               ; $0DF91F |
  LDA $003B                                 ; $0DF922 |
  SEC                                       ; $0DF925 |
  SBC #$0080                                ; $0DF926 |
  STA $7182,x                               ; $0DF929 |
  LDA $10                                   ; $0DF92C |
  AND #$0003                                ; $0DF92E |
  BNE CODE_0DF93F                           ; $0DF931 |
  LDA #$0032                                ; $0DF933 |\ play sound #$0032
  JSL $0085D2                               ; $0DF936 |/
  TXY                                       ; $0DF93A |
  JML $03B426                               ; $0DF93B |

CODE_0DF93F:
  LDA #$002E                                ; $0DF93F |\ play sound #$002E
  JSL $0085D2                               ; $0DF942 |/
  LDA #$0091                                ; $0DF946 |
  TXY                                       ; $0DF949 |
  JSL $03A377                               ; $0DF94A |
  LDA #$000E                                ; $0DF94E |
  STA $6F00,x                               ; $0DF951 |
  LDA $70E2,x                               ; $0DF954 |
  CLC                                       ; $0DF957 |
  ADC #$0010                                ; $0DF958 |
  STA $18,x                                 ; $0DF95B |
  LDA #$000C                                ; $0DF95D |
  STA $7540,x                               ; $0DF960 |
  LDA #$0020                                ; $0DF963 |
  STA $7542,x                               ; $0DF966 |
  LDA #$0200                                ; $0DF969 |
  STA $75E2,x                               ; $0DF96C |
  LDA $7042,x                               ; $0DF96F |
  ORA #$0080                                ; $0DF972 |
  STA $7042,x                               ; $0DF975 |
  LDA #$0004                                ; $0DF978 |
  STA $74A2,x                               ; $0DF97B |
  LDA #$0004                                ; $0DF97E |
  STA $7402,x                               ; $0DF981 |
  LDA #$1801                                ; $0DF984 |
  STA $7040,x                               ; $0DF987 |

CODE_0DF98A:
  RTL                                       ; $0DF98A |

CODE_0DF98B:
  LDA #$0100                                ; $0DF98B |
  SEC                                       ; $0DF98E |
  SBC $300C                                 ; $0DF98F |
  LSR A                                     ; $0DF992 |
  LSR A                                     ; $0DF993 |
  LSR A                                     ; $0DF994 |
  LSR A                                     ; $0DF995 |
  CMP #$000F                                ; $0DF996 |
  BCC CODE_0DF99F                           ; $0DF999 |
  JML $03A31E                               ; $0DF99B |

CODE_0DF99F:
  STA $7402,x                               ; $0DF99F |
  LDA $61B0                                 ; $0DF9A2 |
  ORA $0B55                                 ; $0DF9A5 |
  ORA $0398                                 ; $0DF9A8 |
  BNE CODE_0DF98A                           ; $0DF9AB |
  LDA $3012                                 ; $0DF9AD |
  CMP $1068                                 ; $0DF9B0 |
  BPL CODE_0DF9C5                           ; $0DF9B3 |
  LDA $7682,x                               ; $0DF9B5 |
  CMP #$0090                                ; $0DF9B8 |
  BPL CODE_0DF9C2                           ; $0DF9BB |
  LDY #$20                                  ; $0DF9BD |
  JMP CODE_0DFA65                           ; $0DF9BF |

CODE_0DF9C2:
  JMP CODE_0DFA63                           ; $0DF9C2 |

CODE_0DF9C5:
  CMP #$0100                                ; $0DF9C5 |
  BMI CODE_0DFA1D                           ; $0DF9C8 |
  LDY $7B56,x                               ; $0DF9CA |
  BNE CODE_0DF9D8                           ; $0DF9CD |
  CMP #$0800                                ; $0DF9CF |
  BMI CODE_0DF9C2                           ; $0DF9D2 |
  JML $03A31E                               ; $0DF9D4 |

CODE_0DF9D8:
  STZ $7B56,x                               ; $0DF9D8 |
  LDA $7902,x                               ; $0DF9DB |
  SEC                                       ; $0DF9DE |
  SBC $106C                                 ; $0DF9DF |
  STA $00                                   ; $0DF9E2 |
  CLC                                       ; $0DF9E4 |
  ADC #$0054                                ; $0DF9E5 |
  CMP #$0099                                ; $0DF9E8 |
  BCS CODE_0DFA02                           ; $0DF9EB |
  LDA $7CD8,x                               ; $0DF9ED |
  SEC                                       ; $0DF9F0 |
  SBC $106A                                 ; $0DF9F1 |
  CLC                                       ; $0DF9F4 |
  ADC #$00EC                                ; $0DF9F5 |
  CMP #$0119                                ; $0DF9F8 |
  BCS CODE_0DFA02                           ; $0DF9FB |
  INC $1074                                 ; $0DF9FD |
  BRA CODE_0DFA1D                           ; $0DFA00 |

CODE_0DFA02:
  LDA $00                                   ; $0DFA02 |
  CLC                                       ; $0DFA04 |
  ADC #$00B4                                ; $0DFA05 |
  CMP #$0159                                ; $0DFA08 |
  BCS CODE_0DFA63                           ; $0DFA0B |
  LDA $7CD8,x                               ; $0DFA0D |
  SEC                                       ; $0DFA10 |
  SBC $106A                                 ; $0DFA11 |
  CLC                                       ; $0DFA14 |
  ADC #$00AC                                ; $0DFA15 |
  CMP #$02B9                                ; $0DFA18 |
  BCS CODE_0DFA63                           ; $0DFA1B |

CODE_0DFA1D:
  LDA #$0218                                ; $0DFA1D |
  JSL $008B21                               ; $0DFA20 |
  LDA $70E2,x                               ; $0DFA24 |
  STA $70A2,y                               ; $0DFA27 |
  LDA $7902,x                               ; $0DFA2A |
  STA $78C2,y                               ; $0DFA2D |
  LDA $7182,x                               ; $0DFA30 |
  STA $7142,y                               ; $0DFA33 |
  LDA #$0011                                ; $0DFA36 |
  STA $7E4C,y                               ; $0DFA39 |
  LDA #$0002                                ; $0DFA3C |
  STA $7782,y                               ; $0DFA3F |
  LDA $7682,x                               ; $0DFA42 |
  CMP #$0090                                ; $0DFA45 |
  BMI CODE_0DFA53                           ; $0DFA48 |
  LDA $7002,y                               ; $0DFA4A |
  AND #$00CF                                ; $0DFA4D |
  STA $7002,y                               ; $0DFA50 |

CODE_0DFA53:
  LDA $7402,x                               ; $0DFA53 |
  TAX                                       ; $0DFA56 |
  LDA $F8EB,x                               ; $0DFA57 |
  STA $7E4E,y                               ; $0DFA5A |
  LDX $12                                   ; $0DFA5D |
  JML $03A31E                               ; $0DFA5F |

CODE_0DFA63:
  LDY #$00                                  ; $0DFA63 |

CODE_0DFA65:
  LDA $7042,x                               ; $0DFA65 |
  AND #$00CF                                ; $0DFA68 |
  STA $00                                   ; $0DFA6B |
  TYA                                       ; $0DFA6D |
  ORA $00                                   ; $0DFA6E |
  STA $7042,x                               ; $0DFA70 |
  RTL                                       ; $0DFA73 |

; baby bowser egg sub
CODE_0DFA74:
  JSL $03B9DD                               ; $0DFA74 |
  LDA $78,x                                 ; $0DFA78 |
  BEQ CODE_0DFA7F                           ; $0DFA7A |
  JMP CODE_0DFA8F                           ; $0DFA7C |

CODE_0DFA7F:
  LDA $7860,x                               ; $0DFA7F |
  AND #$0001                                ; $0DFA82 |
  BEQ CODE_0DFA8B                           ; $0DFA85 |
  JSL $03A590                               ; $0DFA87 |

CODE_0DFA8B:
  JML $03B95E                               ; $0DFA8B |

CODE_0DFA8F:
  JSL $03BB1D                               ; $0DFA8F |
  RTL                                       ; $0DFA93 |

; rubble / baby bowser egg sub
CODE_0DFA94:
  STA $300E                                 ; $0DFA94 |
  LDA $70E2,x                               ; $0DFA97 |
  SEC                                       ; $0DFA9A |
  SBC $72C0,x                               ; $0DFA9B |
  STA $3002                                 ; $0DFA9E |
  LDA $7182,x                               ; $0DFAA1 |
  STA $3004                                 ; $0DFAA4 |
  LDA $7902,x                               ; $0DFAA7 |
  STA $3006                                 ; $0DFAAA |
  LDA $7362,x                               ; $0DFAAD |
  STA $300A                                 ; $0DFAB0 |
  LDX #$09                                  ; $0DFAB3 |
  LDA #$F5F4                                ; $0DFAB5 |
  JSL $7EDE44                               ; $0DFAB8 | GSU init
  LDX $12                                   ; $0DFABC |
  STZ $72C0,x                               ; $0DFABE |
  RTS                                       ; $0DFAC1 |
  JSL $03AEEB                               ; $0DFAC2 |
  LDA #$0007                                ; $0DFAC6 |
  STA $74A2,x                               ; $0DFAC9 |
  LDA #$0008                                ; $0DFACC |
  STA $7402,x                               ; $0DFACF |
  LDA $18,x                                 ; $0DFAD2 |
  STA $300A                                 ; $0DFAD4 |
  LDA $76,x                                 ; $0DFAD7 |
  SEC                                       ; $0DFAD9 |
  SBC #$00AB                                ; $0DFADA |
  STA $300C                                 ; $0DFADD |
  CMP #$0400                                ; $0DFAE0 |
  BCS CODE_0DFAEE                           ; $0DFAE3 |
  STZ $7402,x                               ; $0DFAE5 |
  LDA #$0003                                ; $0DFAE8 |
  STA $7040,x                               ; $0DFAEB |

CODE_0DFAEE:
  LDY $7722,x                               ; $0DFAEE |
  TYX                                       ; $0DFAF1 |
  LDA $03A9CE,x                             ; $0DFAF2 |
  STA $3006                                 ; $0DFAF6 |
  LDA $03A9EE,x                             ; $0DFAF9 |
  STA $3004                                 ; $0DFAFD |
  LDA #$80C0                                ; $0DFB00 |
  STA $3018                                 ; $0DFB03 |
  LDA #$0054                                ; $0DFB06 |
  STA $301A                                 ; $0DFB09 |
  SEP #$10                                  ; $0DFB0C |
  LDX #$08                                  ; $0DFB0E |
  LDA #$88AC                                ; $0DFB10 |
  JSL $7EDE44                               ; $0DFB13 | GSU init
  INC $0CF9                                 ; $0DFB17 |
  LDX $12                                   ; $0DFB1A |
  RTL                                       ; $0DFB1C |
  LDA #$0020                                ; $0DFB1D |
  LDY $7402,x                               ; $0DFB20 |
  BEQ CODE_0DFB28                           ; $0DFB23 |
  LDA #$0004                                ; $0DFB25 |

CODE_0DFB28:
  JSR CODE_0DFA94                           ; $0DFB28 |
  LDA $3012                                 ; $0DFB2B |
  CMP #$0100                                ; $0DFB2E |
  BPL CODE_0DFB4F                           ; $0DFB31 |
  TXA                                       ; $0DFB33 |
  STA $3002                                 ; $0DFB34 |
  LDX #$09                                  ; $0DFB37 |
  LDA #$F70B                                ; $0DFB39 |
  JSL $7EDE44                               ; $0DFB3C | GSU init
  LDX $12                                   ; $0DFB40 |
  LDA $3000                                 ; $0DFB42 |
  BNE CODE_0DFB4B                           ; $0DFB45 |
  JSL $03A858                               ; $0DFB47 |

CODE_0DFB4B:
  JML $03A31E                               ; $0DFB4B |

CODE_0DFB4F:
  STA $76,x                                 ; $0DFB4F |
  JSL $03AF23                               ; $0DFB51 |
  JSL $0DFAD2                               ; $0DFB55 |
  LDA $18,x                                 ; $0DFB59 |
  CLC                                       ; $0DFB5B |
  ADC #$0004                                ; $0DFB5C |
  AND #$00FF                                ; $0DFB5F |
  STA $18,x                                 ; $0DFB62 |
  LDY #$00                                  ; $0DFB64 |
  LDA $16,x                                 ; $0DFB66 |
  BPL CODE_0DFB6B                           ; $0DFB68 |
  DEY                                       ; $0DFB6A |

CODE_0DFB6B:
  LDA $7A36,x                               ; $0DFB6B |
  CLC                                       ; $0DFB6E |
  ADC $16,x                                 ; $0DFB6F |
  STA $7A36,x                               ; $0DFB71 |
  TYA                                       ; $0DFB74 |
  ADC $7A38,x                               ; $0DFB75 |
  STA $7A38,x                               ; $0DFB78 |
  LDA $7902,x                               ; $0DFB7B |
  CLC                                       ; $0DFB7E |
  ADC $7A37,x                               ; $0DFB7F |
  STA $7902,x                               ; $0DFB82 |
  LDA $70E2,x                               ; $0DFB85 |
  CLC                                       ; $0DFB88 |
  ADC $7A37,x                               ; $0DFB89 |
  STA $70E2,x                               ; $0DFB8C |
  STZ $7A37,x                               ; $0DFB8F |
  RTL                                       ; $0DFB92 |

init_rubble:
  RTL                                       ; $0DFB93 |

main_rubble:
  LDA $7041,x                               ; $0DFB94 |
  AND #$00F8                                ; $0DFB97 |
  LSR A                                     ; $0DFB9A |
  LSR A                                     ; $0DFB9B |
  LSR A                                     ; $0DFB9C |
  JSR CODE_0DFA94                           ; $0DFB9D |
  JSL $03AF23                               ; $0DFBA0 |
  LDA $7222,x                               ; $0DFBA4 |
  BPL CODE_0DFBB2                           ; $0DFBA7 |
  LDA $7682,x                               ; $0DFBA9 |
  CMP #$F600                                ; $0DFBAC |
  BMI CODE_0DFBBA                           ; $0DFBAF |

CODE_0DFBB1:
  RTL                                       ; $0DFBB1 |

CODE_0DFBB2:
  LDA $7682,x                               ; $0DFBB2 |
  CMP #$0700                                ; $0DFBB5 |
  BMI CODE_0DFBB1                           ; $0DFBB8 |

CODE_0DFBBA:
  DEC $1072                                 ; $0DFBBA |
  JML $03A31E                               ; $0DFBBD |
  RTL                                       ; $0DFBC1 |
  LDY $74A2,x                               ; $0DFBC2 |
  BPL CODE_0DFBD5                           ; $0DFBC5 |
  LDA $0030                                 ; $0DFBC7 |
  AND #$0008                                ; $0DFBCA |
  BEQ CODE_0DFBD5                           ; $0DFBCD |
  LDY #$02                                  ; $0DFBCF |
  JSL $02D995                               ; $0DFBD1 |

CODE_0DFBD5:
  JSL $03AF23                               ; $0DFBD5 |
  LDA $7A96,x                               ; $0DFBD9 |
  BNE CODE_0DFBE2                           ; $0DFBDC |
  JML $03A31E                               ; $0DFBDE |

CODE_0DFBE2:
  LDA $7A98,x                               ; $0DFBE2 |
  BNE CODE_0DFC03                           ; $0DFBE5 |
  LDA #$0002                                ; $0DFBE7 |
  STA $7A98,x                               ; $0DFBEA |
  LDY $74A2,x                               ; $0DFBED |
  BPL CODE_0DFBF9                           ; $0DFBF0 |
  LDA #$0004                                ; $0DFBF2 |
  STA $74A2,x                               ; $0DFBF5 |
  RTL                                       ; $0DFBF8 |

CODE_0DFBF9:
  LDA $7402,x                               ; $0DFBF9 |
  CMP $18,x                                 ; $0DFBFC |
  BCS CODE_0DFC03                           ; $0DFBFE |
  INC $7402,x                               ; $0DFC00 |

CODE_0DFC03:
  RTL                                       ; $0DFC03 |

CODE_0DFC04:
  PHD                                       ; $0DFC04 |
  LDA #$0000                                ; $0DFC05 |
  TCD                                       ; $0DFC08 |
  SEP #$20                                  ; $0DFC09 |
  LDX $021A                                 ; $0DFC0B |
  LDA #$01                                  ; $0DFC0E |
  STA $0222,x                               ; $0DFC10 |
  STZ $1135                                 ; $0DFC13 |
  REP #$20                                  ; $0DFC16 |
  LDA $03B6                                 ; $0DFC18 |

CODE_0DFC1B:
  SEC                                       ; $0DFC1B |
  SBC #$000A                                ; $0DFC1C |
  BMI CODE_0DFC26                           ; $0DFC1F |
  INC $1135                                 ; $0DFC21 |
  BRA CODE_0DFC1B                           ; $0DFC24 |

CODE_0DFC26:
  LDA $1135                                 ; $0DFC26 |

CODE_0DFC29:
  DEC $03B8                                 ; $0DFC29 |
  BMI CODE_0DFC34                           ; $0DFC2C |
  CLC                                       ; $0DFC2E |
  ADC #$000A                                ; $0DFC2F |
  BRA CODE_0DFC29                           ; $0DFC32 |

CODE_0DFC34:
  CLC                                       ; $0DFC34 |
  ADC $03B4                                 ; $0DFC35 |
  AND #$00FF                                ; $0DFC38 |
  SEP #$20                                  ; $0DFC3B |
  CMP $02FB                                 ; $0DFC3D |
  BCS CODE_0DFC45                           ; $0DFC40 |
  LDA $02FB                                 ; $0DFC42 |

CODE_0DFC45:
  STA $1135                                 ; $0DFC45 |
  STA $02FB                                 ; $0DFC48 |
  STA $A0                                   ; $0DFC4B |
  STZ $A1                                   ; $0DFC4D |
  REP #$20                                  ; $0DFC4F |
  LDX #$06                                  ; $0DFC51 |

CODE_0DFC53:
  LDA $02F4,x                               ; $0DFC53 |
  AND #$00FF                                ; $0DFC56 |
  CLC                                       ; $0DFC59 |
  ADC $A0                                   ; $0DFC5A |
  STA $A0                                   ; $0DFC5C |
  DEX                                       ; $0DFC5E |
  BPL CODE_0DFC53                           ; $0DFC5F |
  LDA $A0                                   ; $0DFC61 |
  CMP #$0320                                ; $0DFC63 |
  BCC CODE_0DFC77                           ; $0DFC66 |
  LDA #$0A09                                ; $0DFC68 |
  STA $0353                                 ; $0DFC6B |
  LDX $021A                                 ; $0DFC6E |
  LDA #$0101                                ; $0DFC71 |
  STA $022A,x                               ; $0DFC74 |

CODE_0DFC77:
  SEP #$20                                  ; $0DFC77 |
  JSL $108279                               ; $0DFC79 |
  REP #$20                                  ; $0DFC7D |
  LDX $12                                   ; $0DFC7F |
  PLD                                       ; $0DFC81 |
  RTS                                       ; $0DFC82 |

; freespace, 893 bytes
DATA_0DFC83:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFC8B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFC93:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFC9B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCA3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCAB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCB3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCBB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCC3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCCB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCD3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCDB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCE3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCEB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCF3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFCFB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD03:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD0B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD13:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD1B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD23:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD2B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD33:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD3B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD43:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD4B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD53:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD5B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD63:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD6B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD73:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD7B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD83:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD8B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD93:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFD9B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDA3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDAB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDB3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDBB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDC3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDCB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDD3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDDB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDE3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDEB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDF3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFDFB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE03:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE0B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE13:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE1B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE23:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE2B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE33:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE3B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE43:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE4B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE53:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE5B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE63:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE6B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE73:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE7B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE83:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE8B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE93:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFE9B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEA3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEAB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEB3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEBB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEC3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFECB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFED3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEDB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEE3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEEB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEF3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFEFB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF03:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF0B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF13:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF1B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF23:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF2B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF33:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF3B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF43:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF4B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF53:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF5B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF63:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF6B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF73:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF7B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF83:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF8B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF93:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFF9B:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFA3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFAB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFB3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFBB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFC3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFCB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFD3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFDB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFE3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFEB:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFF3:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0DFFFB:         db $FF, $FF, $FF, $FF, $FF
