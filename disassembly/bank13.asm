org $138000

  REP #$30                                  ; $138000 |
  LDA $2C                                   ; $138002 |
  ASL A                                     ; $138004 |
  TAY                                       ; $138005 |
  LDA $12                                   ; $138006 |
  AND #$FF00                                ; $138008 |
  CMP $1C92                                 ; $13800B |
  BEQ CODE_138018                           ; $13800E |
  JSR CODE_138055                           ; $138010 |
  LDA $8045,y                               ; $138013 |
  BRA CODE_138038                           ; $138016 |

CODE_138018:
  JSR CODE_138073                           ; $138018 |
  BRA CODE_138038                           ; $13801B |
  REP #$30                                  ; $13801D |
  LDA $2C                                   ; $13801F |
  ASL A                                     ; $138021 |
  TAY                                       ; $138022 |
  LDA $12                                   ; $138023 |
  AND #$FF00                                ; $138025 |
  CMP $1C92                                 ; $138028 |
  BEQ CODE_138035                           ; $13802B |
  JSR CODE_138055                           ; $13802D |
  LDA $804D,y                               ; $138030 |
  BRA CODE_138038                           ; $138033 |

CODE_138035:
  JSR CODE_138073                           ; $138035 |

CODE_138038:
  TAY                                       ; $138038 |
  LDA $0000,y                               ; $138039 |
  LDX $1D                                   ; $13803C |
  STA $7F8000,x                             ; $13803E |
  SEP #$30                                  ; $138042 |
  RTL                                       ; $138044 |

  dw $1C5C, $1CB6, $1CBA, $1CC2             ; $138045 |
  dw $1C5E, $1CB8, $1CBC, $1CC4             ; $13804D |

CODE_138055:
  CPY #$0004                                ; $138055 |
  BNE CODE_138072                           ; $138058 |
  LDA $1B                                   ; $13805A |
  STA $0E                                   ; $13805C |
  JSL $128719                               ; $13805E |
  LDA $7F8000,x                             ; $138062 |
  CMP $1CA0                                 ; $138066 |
  BEQ CODE_138070                           ; $138069 |
  CMP $1CA2                                 ; $13806B |
  BNE CODE_138072                           ; $13806E |

CODE_138070:
  INY                                       ; $138070 |
  INY                                       ; $138071 |

CODE_138072:
  RTS                                       ; $138072 |

CODE_138073:
  SEP #$20                                  ; $138073 |
  LDA $28                                   ; $138075 |
  BNE CODE_13808F                           ; $138077 |
  REP #$20                                  ; $138079 |
  LDA $12                                   ; $13807B |
  CMP $1CD6                                 ; $13807D |
  BNE CODE_138087                           ; $138080 |
  LDA #$1D00                                ; $138082 |
  BRA CODE_1380A3                           ; $138085 |

CODE_138087:
  JSR CODE_138055                           ; $138087 |
  LDA $80A4,y                               ; $13808A |
  BRA CODE_1380A3                           ; $13808D |

CODE_13808F:
  REP #$20                                  ; $13808F |
  LDA $12                                   ; $138091 |
  CMP $1CD4                                 ; $138093 |
  BNE CODE_13809D                           ; $138096 |
  LDA #$1CFE                                ; $138098 |
  BRA CODE_1380A3                           ; $13809B |

CODE_13809D:
  JSR CODE_138055                           ; $13809D |
  LDA $80AC,y                               ; $1380A0 |

CODE_1380A3:
  RTS                                       ; $1380A3 |

  dw $1CE6, $1CA0, $1CBA, $1CC2             ; $1380A4 |
  dw $1CE4, $1CA2, $1CBC, $1CC4             ; $1380AC |

  REP #$30                                  ; $1380B4 |
  LDA $12                                   ; $1380B6 |
  CMP $1CF4                                 ; $1380B8 |
  BEQ CODE_13811E                           ; $1380BB |
  CMP $1CF6                                 ; $1380BD |
  BEQ CODE_13811E                           ; $1380C0 |
  CMP $1CD4                                 ; $1380C2 |
  BCC CODE_1380CC                           ; $1380C5 |
  CMP $1CE8                                 ; $1380C7 |
  BCC CODE_13811E                           ; $1380CA |

CODE_1380CC:
  LDA $1B                                   ; $1380CC |
  STA $0E                                   ; $1380CE |
  LDA $2C                                   ; $1380D0 |
  INC A                                     ; $1380D2 |
  CMP $2E                                   ; $1380D3 |
  BNE CODE_138105                           ; $1380D5 |
  LDA $12                                   ; $1380D7 |
  CMP $1CB6                                 ; $1380D9 |
  BEQ CODE_1380F9                           ; $1380DC |
  CMP $1CB8                                 ; $1380DE |
  BEQ CODE_1380F9                           ; $1380E1 |
  CMP $1CC2                                 ; $1380E3 |
  BEQ CODE_13811E                           ; $1380E6 |
  CMP $1CC4                                 ; $1380E8 |
  BEQ CODE_13811E                           ; $1380EB |
  CMP $1CCA                                 ; $1380ED |
  BEQ CODE_13811E                           ; $1380F0 |
  CMP $1CCC                                 ; $1380F2 |
  BEQ CODE_13811E                           ; $1380F5 |
  BRA CODE_138105                           ; $1380F7 |

CODE_1380F9:
  LDA #$1CAC                                ; $1380F9 |
  STA $02                                   ; $1380FC |
  JSR CODE_13816F                           ; $1380FE |
  LDY $02                                   ; $138101 |
  BRA CODE_138115                           ; $138103 |

CODE_138105:
  JSR CODE_138131                           ; $138105 |
  JSL $128875                               ; $138108 |
  AND #$0007                                ; $13810C |
  ASL A                                     ; $13810F |
  TAY                                       ; $138110 |
  LDA $8121,y                               ; $138111 |
  TAY                                       ; $138114 |

CODE_138115:
  LDX $1D                                   ; $138115 |
  LDA $0000,y                               ; $138117 |
  STA $7F8000,x                             ; $13811A |

CODE_13811E:
  SEP #$30                                  ; $13811E |
  RTL                                       ; $138120 |

  dw $1CAE, $1CB0, $1CB2, $1CB4             ; $138121 |
  dw $1CE8, $1CEA, $1CAE, $1CB0             ; $138129 |

CODE_138131:
  JSL $1287A1                               ; $138131 |
  LDA $7F8000,x                             ; $138135 |
  CMP $1CAC                                 ; $138139 |
  BNE CODE_138154                           ; $13813C |
  LDA $1CCA                                 ; $13813E |
  STA $7F8000,x                             ; $138141 |
  LDA $1B                                   ; $138145 |
  STA $0E                                   ; $138147 |
  JSL $12875D                               ; $138149 |
  LDA $1CC4                                 ; $13814D |
  STA $7F8000,x                             ; $138150 |

CODE_138154:
  JSR CODE_13FD61                           ; $138154 |
  CMP $1CAC                                 ; $138157 |
  BNE CODE_13816E                           ; $13815A |
  LDA $1CCC                                 ; $13815C |
  STA $7F8000,x                             ; $13815F |
  JSL $12875D                               ; $138163 |
  LDA $1CC2                                 ; $138167 |
  STA $7F8000,x                             ; $13816A |

CODE_13816E:
  RTS                                       ; $13816E |

CODE_13816F:
  JSL $1287A1                               ; $13816F |
  LDA $7F8000,x                             ; $138173 |
  CMP $1CE8                                 ; $138177 |
  BEQ CODE_13818B                           ; $13817A |
  CMP $1CEA                                 ; $13817C |
  BEQ CODE_13818B                           ; $13817F |
  CMP $1CAE                                 ; $138181 |
  BCC CODE_13819F                           ; $138184 |
  CMP $1CB6                                 ; $138186 |
  BCS CODE_13819F                           ; $138189 |

CODE_13818B:
  LDA $1B                                   ; $13818B |
  STA $0E                                   ; $13818D |
  JSL $12875D                               ; $13818F |
  LDA $1CC2                                 ; $138193 |
  STA $7F8000,x                             ; $138196 |
  LDA #$1CCC                                ; $13819A |
  BRA CODE_1381C8                           ; $13819D |

CODE_13819F:
  JSR CODE_13FD61                           ; $13819F |
  CMP $1CE8                                 ; $1381A2 |
  BEQ CODE_1381B6                           ; $1381A5 |
  CMP $1CEA                                 ; $1381A7 |
  BEQ CODE_1381B6                           ; $1381AA |
  CMP $1CAE                                 ; $1381AC |
  BCC CODE_1381CA                           ; $1381AF |
  CMP $1CB6                                 ; $1381B1 |
  BCS CODE_1381CA                           ; $1381B4 |

CODE_1381B6:
  LDA $1B                                   ; $1381B6 |
  STA $0E                                   ; $1381B8 |
  JSL $12875D                               ; $1381BA |
  LDA $1CC4                                 ; $1381BE |
  STA $7F8000,x                             ; $1381C1 |
  LDA #$1CCA                                ; $1381C5 |

CODE_1381C8:
  STA $02                                   ; $1381C8 |

CODE_1381CA:
  RTS                                       ; $1381CA |

  REP #$30                                  ; $1381CB |
  LDA $28                                   ; $1381CD |
  INC A                                     ; $1381CF |
  CMP $2A                                   ; $1381D0 |
  BNE CODE_1381DC                           ; $1381D2 |
  LDA $2C                                   ; $1381D4 |
  BNE CODE_1381DC                           ; $1381D6 |
  LDA $A1                                   ; $1381D8 |
  STA $2E                                   ; $1381DA |

CODE_1381DC:
  LDA $15                                   ; $1381DC |
  AND #$0001                                ; $1381DE |
  ASL A                                     ; $1381E1 |
  ORA $28                                   ; $1381E2 |
  STA $00                                   ; $1381E4 |
  LDA $2C                                   ; $1381E6 |
  ASL A                                     ; $1381E8 |
  ASL A                                     ; $1381E9 |
  ORA $00                                   ; $1381EA |
  ASL A                                     ; $1381EC |
  TAY                                       ; $1381ED |
  LDX $8217,y                               ; $1381EE |
  BEQ CODE_138214                           ; $1381F1 |
  CPY #$0010                                ; $1381F3 |
  BCC CODE_13820B                           ; $1381F6 |
  LDA $12                                   ; $1381F8 |
  CMP $1C5C                                 ; $1381FA |
  BEQ CODE_138204                           ; $1381FD |
  CMP $1C5E                                 ; $1381FF |
  BNE CODE_138208                           ; $138202 |

CODE_138204:
  INY                                       ; $138204 |
  INY                                       ; $138205 |
  INY                                       ; $138206 |
  INY                                       ; $138207 |

CODE_138208:
  LDX $8217,y                               ; $138208 |

CODE_13820B:
  LDA $0000,x                               ; $13820B |
  LDX $1D                                   ; $13820E |
  STA $7F8000,x                             ; $138210 |

CODE_138214:
  SEP #$30                                  ; $138214 |
  RTL                                       ; $138216 |

  dw $1D12, $1C5E, $1C5E, $1D14             ; $138217 |
  dw $1D16, $1CD0, $1CD2, $1D18             ; $13821F |
  dw $0000, $1CD4, $1CD6, $1CFE             ; $138227 |
  dw $1D00                                  ; $13822F |

  REP #$30                                  ; $138231 |
  JSL $128875                               ; $138233 |
  AND #$0003                                ; $138237 |
  STA $00                                   ; $13823A |
  LDA $15                                   ; $13823C |
  AND #$0001                                ; $13823E |
  STA $0A                                   ; $138241 |
  ASL A                                     ; $138243 |
  ASL A                                     ; $138244 |
  ORA $00                                   ; $138245 |
  ASL A                                     ; $138247 |
  TAY                                       ; $138248 |
  LDA $82A8,y                               ; $138249 |
  STA $00                                   ; $13824C |
  LDA $12                                   ; $13824E |
  CMP $1C5C                                 ; $138250 |
  BEQ CODE_138295                           ; $138253 |
  CMP $1C5E                                 ; $138255 |
  BEQ CODE_138295                           ; $138258 |
  CMP $1CAC                                 ; $13825A |
  BEQ CODE_138269                           ; $13825D |
  CMP $1CB6                                 ; $13825F |
  BEQ CODE_138269                           ; $138262 |
  CMP $1CB8                                 ; $138264 |
  BNE CODE_13829D                           ; $138267 |

CODE_138269:
  LDA $1B                                   ; $138269 |
  STA $0E                                   ; $13826B |
  JSL $128719                               ; $13826D |
  LDA $7F8000,x                             ; $138271 |
  CMP $1CFE                                 ; $138275 |
  BEQ CODE_13828C                           ; $138278 |
  CMP $1D00                                 ; $13827A |
  BEQ CODE_13828C                           ; $13827D |
  LDA $15                                   ; $13827F |
  AND #$0001                                ; $138281 |
  CLC                                       ; $138284 |
  ADC $1CE4                                 ; $138285 |
  STA $7F8000,x                             ; $138288 |

CODE_13828C:
  LDA $1B                                   ; $13828C |
  STA $0E                                   ; $13828E |
  JSR CODE_1382B8                           ; $138290 |
  BRA CODE_13829D                           ; $138293 |

CODE_138295:
  LDA $1CE4                                 ; $138295 |
  CLC                                       ; $138298 |
  ADC $0A                                   ; $138299 |
  BRA CODE_13829F                           ; $13829B |

CODE_13829D:
  LDA ($00)                                 ; $13829D |

CODE_13829F:
  LDX $1D                                   ; $13829F |
  STA $7F8000,x                             ; $1382A1 |
  SEP #$30                                  ; $1382A5 |
  RTL                                       ; $1382A7 |

  dw $1CD8, $1CDC, $1CE0, $1CD8             ; $1382A8 |
  dw $1CDA, $1CDE, $1CE2, $1CDA             ; $1382B0 |

CODE_1382B8:
  LDA $0A                                   ; $1382B8 |
  BNE CODE_1382E4                           ; $1382BA |
  JSL $1287E2                               ; $1382BC |
  LDA #$1CA8                                ; $1382C0 |
  STA $00                                   ; $1382C3 |
  LDA $7F8000,x                             ; $1382C5 |
  CMP $1CAC                                 ; $1382C9 |
  BEQ CODE_13830A                           ; $1382CC |
  LDA $1B                                   ; $1382CE |
  STA $0E                                   ; $1382D0 |
  JSL $12875D                               ; $1382D2 |
  LDA $1CC4                                 ; $1382D6 |
  STA $7F8000,x                             ; $1382D9 |
  LDA #$1CA2                                ; $1382DD |
  STA $00                                   ; $1382E0 |
  BRA CODE_13830A                           ; $1382E2 |

CODE_1382E4:
  JSL $1287A1                               ; $1382E4 |
  LDA #$1CAA                                ; $1382E8 |
  STA $00                                   ; $1382EB |
  LDA $7F8000,x                             ; $1382ED |
  CMP $1CAC                                 ; $1382F1 |
  BEQ CODE_13830A                           ; $1382F4 |
  LDA $1B                                   ; $1382F6 |
  STA $0E                                   ; $1382F8 |
  JSL $12875D                               ; $1382FA |
  LDA $1CC2                                 ; $1382FE |
  STA $7F8000,x                             ; $138301 |
  LDA #$1CA0                                ; $138305 |
  STA $00                                   ; $138308 |

CODE_13830A:
  RTS                                       ; $13830A |

  dw $8348                                  ; $13830B |
  dw $8365                                  ; $13830D |

  REP #$30                                  ; $13830F |
  LDA $2C                                   ; $138311 |
  ASL A                                     ; $138313 |
  TAY                                       ; $138314 |
  CPY #$0008                                ; $138315 |
  BCC CODE_138320                           ; $138318 |
  JSL $1380B4                               ; $13831A |
  BRA CODE_138335                           ; $13831E |

CODE_138320:
  STZ $9B                                   ; $138320 |
  LDA $28                                   ; $138322 |
  AND #$0001                                ; $138324 |
  ASL A                                     ; $138327 |
  TAX                                       ; $138328 |
  JSR ($830B,x)                             ; $138329 |
  LDA $0000,x                               ; $13832C |
  LDX $1D                                   ; $13832F |
  STA $7F8000,x                             ; $138331 |

CODE_138335:
  SEP #$30                                  ; $138335 |
  RTL                                       ; $138337 |

  dw $1C60                                  ; $138338 |
  dw $1A42                                  ; $13833A |
  dw $1A60                                  ; $13833C |
  dw $1CAE                                  ; $13833E |

  dw $1C64                                  ; $138340 |
  dw $1A2A                                  ; $138342 |
  dw $1A40                                  ; $138344 |
  dw $1CC4                                  ; $138346 |

  LDA $15                                   ; $138348 |
  BNE CODE_138351                           ; $13834A |
  LDX $8338,y                               ; $13834C |
  BRA CODE_138354                           ; $13834F |

CODE_138351:
  LDX $8340,y                               ; $138351 |

CODE_138354:
  RTS                                       ; $138354 |

  dw $1C62                                  ; $138355 |
  dw $1A50                                  ; $138357 |
  dw $1A5C                                  ; $138359 |
  dw $1CC2                                  ; $13835B |

  dw $1C66                                  ; $13835D |
  dw $1A34                                  ; $13835F |
  dw $1A5E                                  ; $138361 |
  dw $1CB0                                  ; $138363 |

  INC $9B                                   ; $138365 |
  LDA $15                                   ; $138367 |
  BNE CODE_138370                           ; $138369 |
  LDX $8355,y                               ; $13836B |
  BRA CODE_138373                           ; $13836E |

CODE_138370:
  LDX $835D,y                               ; $138370 |

CODE_138373:
  RTS                                       ; $138373 |

  REP #$30                                  ; $138374 |
  STZ $9B                                   ; $138376 |
  LDA $15                                   ; $138378 |
  CMP #$0006                                ; $13837A |
  BCS CODE_1383A7                           ; $13837D |
  INC $9B                                   ; $13837F |
  AND #$0001                                ; $138381 |
  ASL A                                     ; $138384 |
  ASL A                                     ; $138385 |
  ORA $2C                                   ; $138386 |
  ASL A                                     ; $138388 |
  TAY                                       ; $138389 |
  LDX $8399,y                               ; $13838A |
  LDA $0000,x                               ; $13838D |
  LDX $1D                                   ; $138390 |
  STA $7F8000,x                             ; $138392 |
  SEP #$30                                  ; $138396 |
  RTL                                       ; $138398 |

  dw $1C60                                  ; $138399 |
  dw $1A42                                  ; $13839B |
  dw $1A60                                  ; $13839D |
  dw $0000                                  ; $13839F |
  dw $1A2A                                  ; $1383A1 |
  dw $1A40                                  ; $1383A3 |
  dw $1CC4                                  ; $1383A5 |

CODE_1383A7:
  REP #$30                                  ; $1383A7 |
  STZ $9B                                   ; $1383A9 |
  LDA $15                                   ; $1383AB |
  CMP #$0004                                ; $1383AD |
  BEQ CODE_1383B9                           ; $1383B0 |
  CMP #$0005                                ; $1383B2 |
  BEQ CODE_1383B9                           ; $1383B5 |
  INC $9B                                   ; $1383B7 |

CODE_1383B9:
  DEC A                                     ; $1383B9 |
  DEC A                                     ; $1383BA |
  DEC A                                     ; $1383BB |
  DEC A                                     ; $1383BC |
  ASL A                                     ; $1383BD |
  TAX                                       ; $1383BE |
  LDA $83D7,x                               ; $1383BF |
  STA $00                                   ; $1383C2 |
  LDA $2C                                   ; $1383C4 |
  ASL A                                     ; $1383C6 |
  TAY                                       ; $1383C7 |
  LDX $1D                                   ; $1383C8 |
  LDA ($00),y                               ; $1383CA |
  TAY                                       ; $1383CC |
  LDA $0000,y                               ; $1383CD |
  STA $7F8000,x                             ; $1383D0 |
  SEP #$30                                  ; $1383D4 |
  RTL                                       ; $1383D6 |

  dw $83E3                                  ; $1383D7 |
  dw $83FB                                  ; $1383D9 |
  dw $83E9                                  ; $1383DB |
  dw $8401                                  ; $1383DD |
  dw $83F1                                  ; $1383DF |
  dw $8409                                  ; $1383E1 |

  dw $1A50                                  ; $1383E3 |
  dw $1A5C                                  ; $1383E5 |
  dw $1CC2                                  ; $1383E7 |

  dw $1C6A                                  ; $1383E9 |
  dw $1A16                                  ; $1383EB |
  dw $1A28                                  ; $1383ED |
  dw $1CBE                                  ; $1383EF |

  dw $1C6C                                  ; $1383F1 |
  dw $19EE                                  ; $1383F3 |
  dw $19F6                                  ; $1383F5 |
  dw $1A00                                  ; $1383F7 |
  dw $1CEC                                  ; $1383F9 |

  dw $1C66                                  ; $1383FB |
  dw $1A34                                  ; $1383FD |
  dw $1A5E                                  ; $1383FF |

  dw $1C68                                  ; $138401 |
  dw $1A02                                  ; $138403 |
  dw $1A14                                  ; $138405 |
  dw $1CC0                                  ; $138407 |

  dw $1C6E                                  ; $138409 |
  dw $19DA                                  ; $13840B |
  dw $19E2                                  ; $13840D |
  dw $19EC                                  ; $13840F |
  dw $1CEE                                  ; $138411 |

  REP #$30                                  ; $138413 |
  LDA $15                                   ; $138415 |
  AND #$0001                                ; $138417 |
  ASL A                                     ; $13841A |
  TAY                                       ; $13841B |
  LDX $1D                                   ; $13841C |
  LDA $842C,y                               ; $13841E |
  TAY                                       ; $138421 |
  LDA $0000,y                               ; $138422 |
  STA $7F8000,x                             ; $138425 |
  SEP #$30                                  ; $138429 |
  RTL                                       ; $13842B |

  dw $1CA4, $1CA6                           ; $13842C |

  REP #$30                                  ; $138430 |
  LDX $1D                                   ; $138432 |
  LDA $15                                   ; $138434 |
  AND #$0003                                ; $138436 |
  ASL A                                     ; $138439 |
  TAY                                       ; $13843A |
  LDA $2C                                   ; $13843B |
  BEQ CODE_138449                           ; $13843D |
  INC A                                     ; $13843F |
  CMP $2E                                   ; $138440 |
  BEQ CODE_13844E                           ; $138442 |
  LDA $8458,y                               ; $138444 |
  BRA CODE_138451                           ; $138447 |

CODE_138449:
  LDA $8460,y                               ; $138449 |
  BRA CODE_138451                           ; $13844C |

CODE_13844E:
  LDA $8468,y                               ; $13844E |

CODE_138451:
  TAY                                       ; $138451 |
  LDA $0000,y                               ; $138452 |
  JMP CODE_1384B8                           ; $138455 |

  dw $1DD0, $0000                           ; $138458 |
  dw $8476, $8474                           ; $13845C |

  dw $1DCE, $0000                           ; $138460 |
  dw $8472, $8470                           ; $138464 |

  dw $1DD2, $0000                           ; $138468 |
  dw $1C72, $1C70                           ; $13846C |

  dw $0090, $0091                           ; $138470 |
  dw $0094, $0095                           ; $138474 |

  REP #$30                                  ; $138478 |
  LDA $12                                   ; $13847A |
  AND #$FF00                                ; $13847C |
  CMP $1C7A                                 ; $13847F |
  BEQ CODE_13848D                           ; $138482 |
  LDA $28                                   ; $138484 |
  BEQ CODE_138492                           ; $138486 |
  INC A                                     ; $138488 |
  CMP $2A                                   ; $138489 |
  BEQ CODE_1384A6                           ; $13848B |

CODE_13848D:
  LDA $1C7C                                 ; $13848D |
  BRA CODE_1384B8                           ; $138490 |

CODE_138492:
  LDA $12                                   ; $138492 |
  AND #$FF00                                ; $138494 |
  CMP $1C92                                 ; $138497 |
  BNE CODE_1384A1                           ; $13849A |
  LDA $1C9A                                 ; $13849C |
  BRA CODE_1384B8                           ; $13849F |

CODE_1384A1:
  LDA $1C7A                                 ; $1384A1 |
  BRA CODE_1384B8                           ; $1384A4 |

CODE_1384A6:
  LDA $12                                   ; $1384A6 |
  AND #$FF00                                ; $1384A8 |
  CMP $1C92                                 ; $1384AB |
  BNE CODE_1384B5                           ; $1384AE |
  LDA $1C98                                 ; $1384B0 |
  BRA CODE_1384B8                           ; $1384B3 |

CODE_1384B5:
  LDA $1C7E                                 ; $1384B5 |

CODE_1384B8:
  LDX $1D                                   ; $1384B8 |
  STA $7F8000,x                             ; $1384BA |
  SEP #$30                                  ; $1384BE |
  RTL                                       ; $1384C0 |

  dw $009C, $009B                           ; $1384C1 |
  dw $009A, $0000                           ; $1384C5 |
  dw $0093, $0092                           ; $1384C9 |

  dw $009D, $009E                           ; $1384CD |
  dw $009F, $0000                           ; $1384D1 |
  dw $0092, $0093                           ; $1384D5 |

  dw $0001, $FFFF                           ; $1384D9 |
  dw $8000, $0000                           ; $1384DD |

  REP #$30                                  ; $1384E1 |
  LDY #$0000                                ; $1384E3 |
  LDA $2A                                   ; $1384E6 |
  BPL CODE_1384EC                           ; $1384E8 |
  INY                                       ; $1384EA |
  INY                                       ; $1384EB |

CODE_1384EC:
  LDA $28                                   ; $1384EC |
  AND #$0001                                ; $1384EE |
  ASL A                                     ; $1384F1 |
  STA $00                                   ; $1384F2 |
  TAX                                       ; $1384F4 |
  LDA $28                                   ; $1384F5 |
  BEQ CODE_138501                           ; $1384F7 |
  CLC                                       ; $1384F9 |
  ADC $84D9,y                               ; $1384FA |
  CMP $2A                                   ; $1384FD |
  BNE CODE_138521                           ; $1384FF |

CODE_138501:
  LDA $2C                                   ; $138501 |
  BNE CODE_138546                           ; $138503 |
  LDA $12                                   ; $138505 |
  CMP #$00B4                                ; $138507 |
  BEQ CODE_138511                           ; $13850A |
  CMP #$00A7                                ; $13850C |
  BNE CODE_138516                           ; $13850F |

CODE_138511:
  LDA #$00A7                                ; $138511 |
  BRA CODE_138540                           ; $138514 |

CODE_138516:
  TXA                                       ; $138516 |
  ORA #$0008                                ; $138517 |
  STA $00                                   ; $13851A |
  AND #$0002                                ; $13851C |
  BEQ CODE_138526                           ; $13851F |

CODE_138521:
  LDA $84DD,x                               ; $138521 |
  STA $9B                                   ; $138524 |

CODE_138526:
  LDA $2C                                   ; $138526 |
  AND #$0001                                ; $138528 |
  ASL A                                     ; $13852B |
  ASL A                                     ; $13852C |
  ADC $00                                   ; $13852D |
  TAY                                       ; $13852F |
  LDA $2A                                   ; $138530 |
  BMI CODE_13853B                           ; $138532 |
  LDA $84C1,y                               ; $138534 |
  BEQ CODE_138546                           ; $138537 |
  BRA CODE_138540                           ; $138539 |

CODE_13853B:
  LDA $84CD,y                               ; $13853B |
  BEQ CODE_138546                           ; $13853E |

CODE_138540:
  LDX $1D                                   ; $138540 |
  STA $7F8000,x                             ; $138542 |

CODE_138546:
  SEP #$30                                  ; $138546 |
  RTL                                       ; $138548 |

  dw $009B, $009E                           ; $138549 |

  REP #$30                                  ; $13854D |
  LDA #$8000                                ; $13854F |
  STA $9B                                   ; $138552 |
  LDY #$0000                                ; $138554 |
  LDA $2A                                   ; $138557 |
  BPL CODE_13855D                           ; $138559 |
  INY                                       ; $13855B |
  INY                                       ; $13855C |

CODE_13855D:
  LDA $28                                   ; $13855D |
  BEQ CODE_138582                           ; $13855F |
  CLC                                       ; $138561 |
  ADC $84D9,y                               ; $138562 |
  CMP $2A                                   ; $138565 |
  BEQ CODE_13859E                           ; $138567 |
  LDA $2C                                   ; $138569 |
  ASL A                                     ; $13856B |
  STA $00                                   ; $13856C |
  LDA $15                                   ; $13856E |
  AND #$0002                                ; $138570 |
  ASL A                                     ; $138573 |
  ADC $00                                   ; $138574 |
  ASL A                                     ; $138576 |
  STA $00                                   ; $138577 |
  TYA                                       ; $138579 |
  ORA $00                                   ; $13857A |
  TAY                                       ; $13857C |
  LDA $85BF,y                               ; $13857D |
  BRA CODE_1385B6                           ; $138580 |

CODE_138582:
  STZ $9B                                   ; $138582 |
  LDA $2C                                   ; $138584 |
  BNE CODE_1385BC                           ; $138586 |
  LDA $12                                   ; $138588 |
  CMP #$00B4                                ; $13858A |
  BEQ CODE_138594                           ; $13858D |
  CMP #$00A7                                ; $13858F |
  BNE CODE_138599                           ; $138592 |

CODE_138594:
  LDA #$00A7                                ; $138594 |
  BRA CODE_1385B6                           ; $138597 |

CODE_138599:
  LDA $84C9,y                               ; $138599 |
  BRA CODE_1385B6                           ; $13859C |

CODE_13859E:
  LDA $2C                                   ; $13859E |
  BNE CODE_1385BC                           ; $1385A0 |
  LDA $12                                   ; $1385A2 |
  CMP #$00B4                                ; $1385A4 |
  BEQ CODE_1385AE                           ; $1385A7 |
  CMP #$00A7                                ; $1385A9 |
  BNE CODE_1385B3                           ; $1385AC |

CODE_1385AE:
  LDA #$00A7                                ; $1385AE |
  BRA CODE_1385B6                           ; $1385B1 |

CODE_1385B3:
  LDA $84D5,y                               ; $1385B3 |

CODE_1385B6:
  LDX $1D                                   ; $1385B6 |
  STA $7F8000,x                             ; $1385B8 |

CODE_1385BC:
  SEP #$30                                  ; $1385BC |
  RTL                                       ; $1385BE |

  dw $0097, $0098                           ; $1385BF |
  dw $0096, $0099                           ; $1385C3 |
  dw $00A5, $00A0                           ; $1385C7 |
  dw $00A3, $00A2                           ; $1385CB |
  dw $00A4, $00A1                           ; $1385CF |

  REP #$30                                  ; $1385D3 |
  LDX $1D                                   ; $1385D5 |
  LDA $12                                   ; $1385D7 |
  CMP #$00B4                                ; $1385D9 |
  BEQ CODE_1385E3                           ; $1385DC |
  CMP #$00A7                                ; $1385DE |
  BNE CODE_1385E8                           ; $1385E1 |

CODE_1385E3:
  LDA #$00A7                                ; $1385E3 |
  BRA CODE_1385FE                           ; $1385E6 |

CODE_1385E8:
  LDA $28                                   ; $1385E8 |
  BEQ CODE_1385F6                           ; $1385EA |
  INC A                                     ; $1385EC |
  CMP $2A                                   ; $1385ED |
  BEQ CODE_1385FB                           ; $1385EF |
  LDA #$00A6                                ; $1385F1 |
  BRA CODE_1385FE                           ; $1385F4 |

CODE_1385F6:
  LDA #$0093                                ; $1385F6 |
  BRA CODE_1385FE                           ; $1385F9 |

CODE_1385FB:
  LDA #$0092                                ; $1385FB |

CODE_1385FE:
  STA $7F8000,x                             ; $1385FE |
  SEP #$30                                  ; $138602 |
  RTL                                       ; $138604 |

  REP #$30                                  ; $138605 |
  LDA $1B                                   ; $138607 |
  STA $0E                                   ; $138609 |
  LDX $1D                                   ; $13860B |
  STZ $A1                                   ; $13860D |
  LDA $12                                   ; $13860F |
  AND #$FF00                                ; $138611 |
  CMP $1BE0                                 ; $138614 |
  BNE CODE_138622                           ; $138617 |
  LDA $12                                   ; $138619 |
  AND #$00FF                                ; $13861B |
  INC A                                     ; $13861E |
  ASL A                                     ; $13861F |
  STA $A1                                   ; $138620 |

CODE_138622:
  LDA $2A                                   ; $138622 |
  DEC A                                     ; $138624 |
  BEQ CODE_138631                           ; $138625 |
  LDA $2E                                   ; $138627 |
  DEC A                                     ; $138629 |
  BEQ CODE_138636                           ; $13862A |
  JSR CODE_138686                           ; $13862C |
  BRA CODE_138639                           ; $13862F |

CODE_138631:
  JSR CODE_138645                           ; $138631 |
  BRA CODE_138639                           ; $138634 |

CODE_138636:
  JSR CODE_138666                           ; $138636 |

CODE_138639:
  LDX $1D                                   ; $138639 |
  LDA $0000,y                               ; $13863B |
  STA $7F8000,x                             ; $13863E |
  SEP #$30                                  ; $138642 |
  RTL                                       ; $138644 |

CODE_138645:
  LDA $2C                                   ; $138645 |
  BEQ CODE_138656                           ; $138647 |
  INC A                                     ; $138649 |
  CMP $2E                                   ; $13864A |
  BEQ CODE_13865E                           ; $13864C |
  JSR CODE_138712                           ; $13864E |
  LDA $8784,y                               ; $138651 |
  BRA CODE_138664                           ; $138654 |

CODE_138656:
  JSR CODE_138712                           ; $138656 |
  LDA $87E2,y                               ; $138659 |
  BRA CODE_138664                           ; $13865C |

CODE_13865E:
  JSR CODE_138712                           ; $13865E |
  LDA $8840,y                               ; $138661 |

CODE_138664:
  TAY                                       ; $138664 |
  RTS                                       ; $138665 |

CODE_138666:
  LDA $28                                   ; $138666 |
  BEQ CODE_138676                           ; $138668 |
  INC A                                     ; $13866A |
  CMP $2A                                   ; $13866B |
  BEQ CODE_13867E                           ; $13866D |
  LDY $A1                                   ; $13866F |
  LDA $889E,y                               ; $138671 |
  BRA CODE_138684                           ; $138674 |

CODE_138676:
  JSR CODE_138712                           ; $138676 |
  LDA $88FC,y                               ; $138679 |
  BRA CODE_138684                           ; $13867C |

CODE_13867E:
  JSR CODE_138712                           ; $13867E |
  LDA $895A,y                               ; $138681 |

CODE_138684:
  TAY                                       ; $138684 |
  RTS                                       ; $138685 |

CODE_138686:
  LDA $28                                   ; $138686 |
  BNE CODE_138695                           ; $138688 |
  LDA $2C                                   ; $13868A |
  BEQ CODE_1386B4                           ; $13868C |
  INC A                                     ; $13868E |
  CMP $2E                                   ; $13868F |
  BNE CODE_1386C5                           ; $138691 |
  BRA CODE_1386CD                           ; $138693 |

CODE_138695:
  INC A                                     ; $138695 |
  CMP $2A                                   ; $138696 |
  BEQ CODE_1386A5                           ; $138698 |
  LDA $2C                                   ; $13869A |
  BEQ CODE_1386D5                           ; $13869C |
  INC A                                     ; $13869E |
  CMP $2E                                   ; $13869F |
  BNE CODE_1386E5                           ; $1386A1 |
  BRA CODE_1386EA                           ; $1386A3 |

CODE_1386A5:
  LDA $2C                                   ; $1386A5 |
  BEQ CODE_1386F2                           ; $1386A7 |
  INC A                                     ; $1386A9 |
  CMP $2E                                   ; $1386AA |
  BNE CODE_1386B1                           ; $1386AC |
  JMP CODE_13870A                           ; $1386AE |

CODE_1386B1:
  JMP CODE_138702                           ; $1386B1 |

CODE_1386B4:
  JSR CODE_138712                           ; $1386B4 |
  PHY                                       ; $1386B7 |
  LDY #$0000                                ; $1386B8 |
  JSR CODE_13873E                           ; $1386BB |
  PLY                                       ; $1386BE |
  LDA $89B8,y                               ; $1386BF |
  JMP CODE_138710                           ; $1386C2 |

CODE_1386C5:
  JSR CODE_138712                           ; $1386C5 |
  LDA $8A16,y                               ; $1386C8 |
  BRA CODE_138710                           ; $1386CB |

CODE_1386CD:
  JSR CODE_138712                           ; $1386CD |
  LDA $8A74,y                               ; $1386D0 |
  BRA CODE_138710                           ; $1386D3 |

CODE_1386D5:
  JSR CODE_138712                           ; $1386D5 |
  PHY                                       ; $1386D8 |
  LDY #$0002                                ; $1386D9 |
  JSR CODE_13873E                           ; $1386DC |
  PLY                                       ; $1386DF |
  LDA $8AD2,y                               ; $1386E0 |
  BRA CODE_138710                           ; $1386E3 |

CODE_1386E5:
  LDA #$04                                  ; $1386E5 |
  TRB $2680                                 ; $1386E7 |

CODE_1386EA:
  JSR CODE_138712                           ; $1386EA |
  LDA $8B30,y                               ; $1386ED |
  BRA CODE_138710                           ; $1386F0 |

CODE_1386F2:
  JSR CODE_138712                           ; $1386F2 |
  PHY                                       ; $1386F5 |
  LDY #$0004                                ; $1386F6 |
  JSR CODE_13873E                           ; $1386F9 |
  PLY                                       ; $1386FC |
  LDA $8B8E,y                               ; $1386FD |
  BRA CODE_138710                           ; $138700 |

CODE_138702:
  JSR CODE_138712                           ; $138702 |
  LDA $8BEC,y                               ; $138705 |
  BRA CODE_138710                           ; $138708 |

CODE_13870A:
  JSR CODE_138712                           ; $13870A |
  LDA $8C4A,y                               ; $13870D |

CODE_138710:
  TAY                                       ; $138710 |
  RTS                                       ; $138711 |

CODE_138712:
  LDA $12                                   ; $138712 |
  AND #$FF00                                ; $138714 |
  CMP $1BE0                                 ; $138717 |
  BEQ CODE_13873B                           ; $13871A |
  LDY #$0000                                ; $13871C |
  LDA $12                                   ; $13871F |

CODE_138721:
  LDX $8760,y                               ; $138721 |
  CMP $0000,x                               ; $138724 |
  BEQ CODE_138734                           ; $138727 |
  INY                                       ; $138729 |
  INY                                       ; $13872A |
  CPY #$0024                                ; $13872B |
  BCC CODE_138721                           ; $13872E |
  STZ $A1                                   ; $138730 |
  BRA CODE_13873B                           ; $138732 |

CODE_138734:
  TYA                                       ; $138734 |
  CLC                                       ; $138735 |
  ADC #$0028                                ; $138736 |
  STA $A1                                   ; $138739 |

CODE_13873B:
  LDY $A1                                   ; $13873B |
  RTS                                       ; $13873D |

CODE_13873E:
  JSL $128719                               ; $13873E |
  LDA $7F8000,x                             ; $138742 |
  CMP $1C5C                                 ; $138746 |
  BEQ CODE_138750                           ; $138749 |
  CMP $1C5E                                 ; $13874B |
  BNE CODE_138757                           ; $13874E |

CODE_138750:
  LDA $8758,y                               ; $138750 |
  STA $7F8000,x                             ; $138753 |

CODE_138757:
  RTS                                       ; $138757 |

  dw $007E, $0000, $007F, $007D             ; $138758 |
  dw $1CB6, $1CB8, $1C5C, $1C5E             ; $138760 |
  dw $1CF2, $1CF8, $1CD8, $1CDC             ; $138768 |
  dw $1CE0, $1BE0, $1BE0, $1BE0             ; $138770 |
  dw $1BE0, $1CDA, $1CDE, $1CE2             ; $138778 |
  dw $1CE4, $1CE6, $1BE0, $1BE0             ; $138780 |
  dw $1C18, $1C18, $1C18, $1BF2             ; $138788 |
  dw $1BF0, $1BF2, $1BF0, $1BF0             ; $138790 |
  dw $1BF2, $1C18, $1C04, $1BF8             ; $138798 |
  dw $1BFA, $1BF8, $1C32, $1BF8             ; $1387A0 |
  dw $1BFA, $1C04, $1C06, $1C06             ; $1387A8 |
  dw $1C0A, $1C0C, $1C0E, $1C10             ; $1387B0 |
  dw $1C12, $1C14, $1C16, $1C18             ; $1387B8 |
  dw $1C18, $1C1C, $1C1E, $1C20             ; $1387C0 |
  dw $1C22, $1C24, $1C26, $1C28             ; $1387C8 |
  dw $1C2A, $1C2C, $1C2E, $1C30             ; $1387D0 |
  dw $1C32, $1BF2, $1BF0, $1BE0             ; $1387D8 |
  dw $1BE0, $1C38, $1BE0, $1C18             ; $1387E0 |
  dw $1BE4, $1BE4, $1BF2, $1BEA             ; $1387E8 |
  dw $1BEC, $1BF0, $1BEA, $1BEC             ; $1387F0 |
  dw $1BF4, $1C04, $1BF8, $1BFA             ; $1387F8 |
  dw $1BFC, $1BFE, $1BF8, $1BFA             ; $138800 |
  dw $1C04, $1C06, $1C06, $875E             ; $138808 |
  dw $875E, $1C0E, $1C10, $1C12             ; $138810 |
  dw $1C14, $1C16, $1C18, $1C18             ; $138818 |
  dw $1C1C, $1C1E, $1C20, $1C22             ; $138820 |
  dw $1C24, $1C26, $1C28, $1C2A             ; $138828 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $138830 |
  dw $1BEC, $1BEA, $1C38, $1BE0             ; $138838 |
  dw $1C3A, $1BE0, $1BE2, $1C18             ; $138840 |
  dw $1C1A, $1BE8, $1BF0, $1BF2             ; $138848 |
  dw $1BEE, $1BEE, $1BE8, $1C18             ; $138850 |
  dw $1BF6, $1BF8, $1BFA, $1BF8             ; $138858 |
  dw $1C32, $1C02, $1C02, $1C04             ; $138860 |
  dw $1C06, $1C08, $1C0A, $1C0C             ; $138868 |
  dw $1C2C, $1C2C, $1C12, $1C14             ; $138870 |
  dw $1C16, $1C18, $1C1A, $1C1C             ; $138878 |
  dw $1C1E, $1C20, $1C22, $1C24             ; $138880 |
  dw $1C26, $1C28, $1C2A, $1C2C             ; $138888 |
  dw $1C2E, $1C30, $1C32, $1BE8             ; $138890 |
  dw $1BEE, $1BE0, $1C3A, $1BE6             ; $138898 |
  dw $1C18, $1BE2, $1BE4, $1BE6             ; $1388A0 |
  dw $1C1A, $1BE4, $1BE4, $1C1A             ; $1388A8 |
  dw $1C18, $1C18, $1BF4, $1BF6             ; $1388B0 |
  dw $1C18, $1C04, $1BE4, $1BF4             ; $1388B8 |
  dw $1C1A, $1BF6, $1C04, $1C06             ; $1388C0 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $1388C8 |
  dw $1C10, $1C12, $1C14, $1C16             ; $1388D0 |
  dw $1C18, $1C1A, $1C1C, $1C1E             ; $1388D8 |
  dw $1C20, $1C22, $1C24, $1C26             ; $1388E0 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $1388E8 |
  dw $1C30, $1C32, $1BE6, $1BE6             ; $1388F0 |
  dw $1BE4, $1BE2, $1C34, $1BF2             ; $1388F8 |
  dw $1BE8, $1BEC, $1BE6, $1BE8             ; $138900 |
  dw $1BE4, $1BEC, $1C1A, $1C18             ; $138908 |
  dw $1BF2, $1BF4, $1BF6, $1BF8             ; $138910 |
  dw $1C04, $1BFC, $1BF4, $1BF6             ; $138918 |
  dw $1BF6, $1C04, $1C06, $1C08             ; $138920 |
  dw $1C0A, $1C0C, $1C0E, $1C10             ; $138928 |
  dw $1C08, $1C08, $1C08, $1C18             ; $138930 |
  dw $1C1A, $1C1C, $1C1E, $1C20             ; $138938 |
  dw $1C22, $1C24, $1C3C, $1C28             ; $138940 |
  dw $1C2A, $1C2C, $1C2E, $1C30             ; $138948 |
  dw $1C32, $1C34, $1BE6, $1BEC             ; $138950 |
  dw $1BE8, $1C36, $1BF0, $1BEE             ; $138958 |
  dw $1BEA, $1BE6, $1C1A, $1BEA             ; $138960 |
  dw $1BE4, $1BEE, $1BF0, $1C18             ; $138968 |
  dw $1BF4, $1BF6, $1C18, $1BFA             ; $138970 |
  dw $1BF4, $1BFE, $1C1A, $1C02             ; $138978 |
  dw $1C04, $1C06, $1C08, $1C0A             ; $138980 |
  dw $1C0C, $1C0E, $1C10, $1C12             ; $138988 |
  dw $1C14, $1C16, $1C18, $1C1A             ; $138990 |
  dw $1C1C, $1C1E, $1C0A, $1C0A             ; $138998 |
  dw $1C0A, $1C26, $1C3E, $1C2A             ; $1389A0 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $1389A8 |
  dw $1BE6, $1C36, $1BEA, $1BEE             ; $1389B0 |
  dw $1BFC, $1BF8, $1C18, $1BF4             ; $1389B8 |
  dw $1BE4, $1BF8, $1BF4, $1BFC             ; $1389C0 |
  dw $1C18, $1C18, $1BF8, $1BF4             ; $1389C8 |
  dw $1C04, $1BF8, $1C04, $1BFC             ; $1389D0 |
  dw $1BF4, $1BF8, $1C04, $1C04             ; $1389D8 |
  dw $1C20, $1C20, $1C20, $1C20             ; $1389E0 |
  dw $1C0E, $1C10, $1C10, $1C10             ; $1389E8 |
  dw $1C10, $1C18, $1C18, $1C1C             ; $1389F0 |
  dw $1C1E, $1C20, $1C22, $1C24             ; $1389F8 |
  dw $1C26, $1C28, $1C2A, $1C2C             ; $138A00 |
  dw $1C2E, $1C30, $1C32, $1BFC             ; $138A08 |
  dw $1BF4, $1BFC, $1BF8, $1BF8             ; $138A10 |
  dw $1BF8, $1BF8, $1C18, $1C18             ; $138A18 |
  dw $1BF8, $1C18, $1BF8, $1C18             ; $138A20 |
  dw $1C18, $1BF8, $1C18, $1C04             ; $138A28 |
  dw $1BF8, $1C04, $1BF8, $1C18             ; $138A30 |
  dw $1BF8, $1C04, $1C04, $1C06             ; $138A38 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $138A40 |
  dw $1C10, $1C0C, $1C0C, $1C0C             ; $138A48 |
  dw $1C18, $1C18, $1C1C, $1C1E             ; $138A50 |
  dw $1C20, $1C22, $1C24, $1C26             ; $138A58 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $138A60 |
  dw $1C30, $1C32, $1BF8, $1C18             ; $138A68 |
  dw $1BF8, $1BF8, $1C00, $1BF8             ; $138A70 |
  dw $1C1A, $1C18, $1C1A, $1C00             ; $138A78 |
  dw $1C04, $1BF8, $1C1A, $1C18             ; $138A80 |
  dw $1BF8, $1C18, $1BF6, $1BF8             ; $138A88 |
  dw $1C04, $1BF8, $1C18, $1C00             ; $138A90 |
  dw $1BF6, $1C04, $1C06, $1C08             ; $138A98 |
  dw $1C0A, $1C0C, $1C26, $1C10             ; $138AA0 |
  dw $1C14, $1C14, $1C14, $1C18             ; $138AA8 |
  dw $1C1A, $1C1C, $1C1E, $1C26             ; $138AB0 |
  dw $1C26, $1C26, $1C40, $1C28             ; $138AB8 |
  dw $1C2A, $1C2C, $1C2E, $1C30             ; $138AC0 |
  dw $1C32, $1C00, $1C1A, $1BF8             ; $138AC8 |
  dw $1C00, $1BF4, $1C18, $1C18             ; $138AD0 |
  dw $1BF4, $1BF4, $1C18, $1BF4             ; $138AD8 |
  dw $1BF4, $1C18, $1C18, $1C18             ; $138AE0 |
  dw $1BF4, $1C04, $1C18, $1C04             ; $138AE8 |
  dw $1BF4, $1BF4, $1C18, $1C04             ; $138AF0 |
  dw $1C04, $1C22, $1C22, $1C0A             ; $138AF8 |
  dw $1C0C, $1C0E, $1C10, $1C12             ; $138B00 |
  dw $1C14, $1C16, $1C18, $1C18             ; $138B08 |
  dw $1C1C, $1C1E, $1C20, $1C22             ; $138B10 |
  dw $1C24, $1C26, $1C28, $1C2A             ; $138B18 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $138B20 |
  dw $1BF4, $1BF4, $1BF4, $1C18             ; $138B28 |
  dw $1BF6, $1C04, $1BF6, $1C04             ; $138B30 |
  dw $1BF6, $1BF6, $1C04, $1C04             ; $138B38 |
  dw $1BF6, $1C04, $1C04, $1C04             ; $138B40 |
  dw $1BF6, $1C04, $1C04, $1C04             ; $138B48 |
  dw $1C04, $1BF6, $1BF6, $1C04             ; $138B50 |
  dw $1C06, $1C08, $1C0A, $1C0C             ; $138B58 |
  dw $1C28, $1C28, $1C12, $1C14             ; $138B60 |
  dw $1C16, $1C04, $1BF6, $1C1C             ; $138B68 |
  dw $1C1E, $1C20, $1C22, $1C24             ; $138B70 |
  dw $1C26, $1C28, $1C2A, $1C2C             ; $138B78 |
  dw $1C2E, $1C30, $1C32, $1BF6             ; $138B80 |
  dw $1BF6, $1C04, $1BF6, $1BFE             ; $138B88 |
  dw $1C32, $1C18, $1C18, $1BF4             ; $138B90 |
  dw $1C18, $1BFE, $1BF4, $1C32             ; $138B98 |
  dw $1C32, $1C18, $1BF4, $1C04             ; $138BA0 |
  dw $1C18, $1BFA, $1BF4, $1BF4             ; $138BA8 |
  dw $1C18, $1BFA, $1C04, $1C24             ; $138BB0 |
  dw $1C24, $1C0A, $1C0C, $1C0E             ; $138BB8 |
  dw $1C10, $1C12, $1C14, $1C0E             ; $138BC0 |
  dw $1C04, $1C18, $1C1C, $1C1E             ; $138BC8 |
  dw $1C12, $1C12, $1C12, $1C26             ; $138BD0 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $138BD8 |
  dw $1C30, $1C32, $1BF4, $1BFE             ; $138BE0 |
  dw $1BFE, $1C32, $1BFA, $1BFA             ; $138BE8 |
  dw $1C04, $1C04, $1C04, $1C04             ; $138BF0 |
  dw $1BFA, $1C04, $1BFA, $1BFA             ; $138BF8 |
  dw $1C04, $1C04, $1C04, $1C04             ; $138C00 |
  dw $1BFA, $1C04, $1BFA, $1C04             ; $138C08 |
  dw $1BFA, $1C04, $1C06, $1C08             ; $138C10 |
  dw $1C0A, $1C0C, $1C0E, $1C10             ; $138C18 |
  dw $1C12, $1C14, $1C16, $1C04             ; $138C20 |
  dw $1C04, $1C1C, $1C1E, $1C0E             ; $138C28 |
  dw $1C0E, $1C0E, $1C26, $1C16             ; $138C30 |
  dw $1C2A, $1C2C, $1C2E, $1C30             ; $138C38 |
  dw $1C32, $1C04, $1BFA, $1BFA             ; $138C40 |
  dw $1BFA, $1C02, $1BFA, $1BF6             ; $138C48 |
  dw $1C04, $1BF6, $1BF6, $1BFA             ; $138C50 |
  dw $1C04, $1C02, $1BFA, $1C04             ; $138C58 |
  dw $1C04, $1BF6, $1C04, $1BFA             ; $138C60 |
  dw $1C04, $1BFA, $1BF6, $1C02             ; $138C68 |
  dw $1C04, $1C06, $1C08, $1C0A             ; $138C70 |
  dw $1C0C, $1C2A, $1C2A, $1C12             ; $138C78 |
  dw $1C14, $1C16, $1C04, $1C1A             ; $138C80 |
  dw $1C1C, $1C1E, $1C16, $1C16             ; $138C88 |
  dw $1C16, $1C26, $1C42, $1C2A             ; $138C90 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $138C98 |
  dw $1BF6, $1C02, $1BFA, $1C02             ; $138CA0 |

  dw $00DB, $00DD, $00DC, $0000             ; $138CA8 |
  dw $150F, $1511, $1510                    ; $138CB0 |

  REP #$30                                  ; $138CB6 |
  LDA $2C                                   ; $138CB8 |
  ASL A                                     ; $138CBA |
  ASL A                                     ; $138CBB |
  STA $00                                   ; $138CBC |
  LDA $28                                   ; $138CBE |
  BEQ CODE_138CCB                           ; $138CC0 |
  INC $00                                   ; $138CC2 |
  INC A                                     ; $138CC4 |
  CMP $2A                                   ; $138CC5 |
  BNE CODE_138CCB                           ; $138CC7 |
  INC $00                                   ; $138CC9 |

CODE_138CCB:
  LDA $00                                   ; $138CCB |
  ASL A                                     ; $138CCD |
  TAY                                       ; $138CCE |
  LDA $8CA8,y                               ; $138CCF |
  LDX $1D                                   ; $138CD2 |
  STA $7F8000,x                             ; $138CD4 |
  SEP #$30                                  ; $138CD8 |
  RTL                                       ; $138CDA |

  REP #$30                                  ; $138CDB |
  LDA $12                                   ; $138CDD |
  BNE CODE_138CEA                           ; $138CDF |
  LDX $1D                                   ; $138CE1 |
  LDA #$1600                                ; $138CE3 |
  STA $7F8000,x                             ; $138CE6 |

CODE_138CEA:
  SEP #$30                                  ; $138CEA |
  RTL                                       ; $138CEC |

  REP #$30                                  ; $138CED |
  LDA $1B                                   ; $138CEF |
  STA $0E                                   ; $138CF1 |
  STZ $0A                                   ; $138CF3 |
  LDX $1D                                   ; $138CF5 |
  LDA $12                                   ; $138CF7 |
  AND #$FF00                                ; $138CF9 |
  CMP #$1600                                ; $138CFC |
  BNE CODE_138D06                           ; $138CFF |
  LDA #$0008                                ; $138D01 |
  STA $0A                                   ; $138D04 |

CODE_138D06:
  LDA $2C                                   ; $138D06 |
  BNE CODE_138D16                           ; $138D08 |
  LDA $0A                                   ; $138D0A |
  BNE CODE_138D56                           ; $138D0C |
  LDY #$0000                                ; $138D0E |
  JSR CODE_138D8C                           ; $138D11 |
  BRA CODE_138D56                           ; $138D14 |

CODE_138D16:
  INC A                                     ; $138D16 |
  CMP $2E                                   ; $138D17 |
  BEQ CODE_138D48                           ; $138D19 |
  CMP #$0002                                ; $138D1B |
  BNE CODE_138D38                           ; $138D1E |
  LDA $0A                                   ; $138D20 |
  BNE CODE_138D2C                           ; $138D22 |
  LDY #$0002                                ; $138D24 |
  JSR CODE_138D8C                           ; $138D27 |
  BRA CODE_138D56                           ; $138D2A |

CODE_138D2C:
  JSR CODE_138D7B                           ; $138D2C |
  LDA $8D59,y                               ; $138D2F |
  STA $7F8000,x                             ; $138D32 |
  BRA CODE_138D56                           ; $138D36 |

CODE_138D38:
  JSR CODE_138D7B                           ; $138D38 |
  TYA                                       ; $138D3B |
  ORA $0A                                   ; $138D3C |
  TAY                                       ; $138D3E |
  LDA $8D5F,y                               ; $138D3F |
  STA $7F8000,x                             ; $138D42 |
  BRA CODE_138D56                           ; $138D46 |

CODE_138D48:
  JSR CODE_138D7B                           ; $138D48 |
  TYA                                       ; $138D4B |
  ORA $0A                                   ; $138D4C |
  TAY                                       ; $138D4E |
  LDA $8D6D,y                               ; $138D4F |
  STA $7F8000,x                             ; $138D52 |

CODE_138D56:
  SEP #$30                                  ; $138D56 |
  RTL                                       ; $138D58 |

  dw $011F, $0120, $0121, $011C             ; $138D59 |
  dw $011D, $011E, $0000, $0122             ; $138D61 |
  dw $0123, $0124, $013A, $013B             ; $138D69 |
  dw $013C, $0000, $0137, $0138             ; $138D71 |
  dw $0139                                  ; $138D79 |

CODE_138D7B:
  LDY #$0000                                ; $138D7B |
  LDA $28                                   ; $138D7E |
  BEQ CODE_138D8B                           ; $138D80 |
  INY                                       ; $138D82 |
  INY                                       ; $138D83 |
  INC A                                     ; $138D84 |
  CMP $2A                                   ; $138D85 |
  BNE CODE_138D8B                           ; $138D87 |
  INY                                       ; $138D89 |
  INY                                       ; $138D8A |

CODE_138D8B:
  RTS                                       ; $138D8B |

CODE_138D8C:
  LDA $28                                   ; $138D8C |
  AND #$0001                                ; $138D8E |
  CLC                                       ; $138D91 |
  ADC $8DDF,y                               ; $138D92 |
  STA $7F8000,x                             ; $138D95 |
  LDA $2C                                   ; $138D99 |
  BNE CODE_138DB1                           ; $138D9B |
  JSL $12875D                               ; $138D9D |
  LDA $7F8000,x                             ; $138DA1 |
  AND #$FF00                                ; $138DA5 |
  CMP #$1600                                ; $138DA8 |
  BEQ CODE_138DDE                           ; $138DAB |
  LDA $1B                                   ; $138DAD |
  STA $0E                                   ; $138DAF |

CODE_138DB1:
  LDA $28                                   ; $138DB1 |
  BNE CODE_138DC8                           ; $138DB3 |
  JSL $1287A1                               ; $138DB5 |
  LDA $7F8000,x                             ; $138DB9 |
  BNE CODE_138DDE                           ; $138DBD |
  LDA $8DE3,y                               ; $138DBF |
  STA $7F8000,x                             ; $138DC2 |
  BRA CODE_138DDE                           ; $138DC6 |

CODE_138DC8:
  INC A                                     ; $138DC8 |
  CMP $2A                                   ; $138DC9 |
  BNE CODE_138DDE                           ; $138DCB |
  JSL $1287E2                               ; $138DCD |
  LDA $7F8000,x                             ; $138DD1 |
  BNE CODE_138DDE                           ; $138DD5 |
  LDA $8DE7,y                               ; $138DD7 |
  STA $7F8000,x                             ; $138DDA |

CODE_138DDE:
  RTS                                       ; $138DDE |

  dw $0021, $011A, $0020, $001F             ; $138DDF |
  dw $0023, $0024                           ; $138DE7 |

  REP #$30                                  ; $138DEB |
  STZ $0A                                   ; $138DED |
  LDA $12                                   ; $138DEF |
  AND #$FF00                                ; $138DF1 |
  CMP #$1600                                ; $138DF4 |
  BNE CODE_138DFE                           ; $138DF7 |
  LDA #$0012                                ; $138DF9 |
  STA $0A                                   ; $138DFC |

CODE_138DFE:
  LDY #$0000                                ; $138DFE |
  LDA $2C                                   ; $138E01 |
  BEQ CODE_138E10                           ; $138E03 |
  LDY #$0006                                ; $138E05 |
  INC A                                     ; $138E08 |
  CMP $2E                                   ; $138E09 |
  BNE CODE_138E10                           ; $138E0B |
  LDY #$000C                                ; $138E0D |

CODE_138E10:
  LDA $28                                   ; $138E10 |
  BEQ CODE_138E1D                           ; $138E12 |
  INY                                       ; $138E14 |
  INY                                       ; $138E15 |
  INC A                                     ; $138E16 |
  CMP $2A                                   ; $138E17 |
  BNE CODE_138E1D                           ; $138E19 |
  INY                                       ; $138E1B |
  INY                                       ; $138E1C |

CODE_138E1D:
  TYA                                       ; $138E1D |
  CLC                                       ; $138E1E |
  ADC $0A                                   ; $138E1F |
  TAY                                       ; $138E21 |
  LDX $1D                                   ; $138E22 |
  LDA $8E2E,y                               ; $138E24 |
  STA $7F8000,x                             ; $138E27 |
  SEP #$30                                  ; $138E2B |
  RTL                                       ; $138E2D |

  dw $0125, $0126, $0127, $0128             ; $138E2E |
  dw $0129, $012A, $012B, $012C             ; $138E36 |
  dw $012D, $012E, $012F, $0130             ; $138E3E |
  dw $0131, $0132, $0133, $0134             ; $138E46 |
  dw $0135, $0136                           ; $138E4E |

  REP #$30                                  ; $138E52 |
  LDX $1D                                   ; $138E54 |
  LDA $2C                                   ; $138E56 |
  CMP #$0003                                ; $138E58 |
  BCS CODE_138E70                           ; $138E5B |
  ASL A                                     ; $138E5D |
  ASL A                                     ; $138E5E |
  ASL A                                     ; $138E5F |
  STA $00                                   ; $138E60 |
  LDA $28                                   ; $138E62 |
  AND #$0003                                ; $138E64 |
  ASL A                                     ; $138E67 |
  ORA $00                                   ; $138E68 |
  TAY                                       ; $138E6A |
  LDA $8E90,y                               ; $138E6B |
  BRA CODE_138E89                           ; $138E6E |

CODE_138E70:
  LDA $2C                                   ; $138E70 |
  EOR #$0001                                ; $138E72 |
  AND #$0001                                ; $138E75 |
  ASL A                                     ; $138E78 |
  ASL A                                     ; $138E79 |
  ASL A                                     ; $138E7A |
  STA $00                                   ; $138E7B |
  LDA $28                                   ; $138E7D |
  AND #$0003                                ; $138E7F |
  ASL A                                     ; $138E82 |
  ORA $00                                   ; $138E83 |
  TAY                                       ; $138E85 |
  LDA $8EA8,y                               ; $138E86 |

CODE_138E89:
  STA $7F8000,x                             ; $138E89 |
  SEP #$30                                  ; $138E8D |
  RTL                                       ; $138E8F |

  dw $1601, $1602, $1603, $1604             ; $138E90 |
  dw $1605, $1606, $1607, $1608             ; $138E98 |
  dw $1609, $160A, $160B, $160C             ; $138EA0 |
  dw $160D, $160E, $160F, $1610             ; $138EA8 |
  dw $1611, $1612, $1613, $1614             ; $138EB0 |

  REP #$30                                  ; $138EB8 |
  LDA $28                                   ; $138EBA |
  AND #$0001                                ; $138EBC |
  STA $00                                   ; $138EBF |
  LDA $28                                   ; $138EC1 |
  BNE CODE_138ECA                           ; $138EC3 |
  LDA #$1505                                ; $138EC5 |
  BRA CODE_138EE6                           ; $138EC8 |

CODE_138ECA:
  INC A                                     ; $138ECA |
  CMP $2A                                   ; $138ECB |
  BEQ CODE_138EE3                           ; $138ECD |
  LDA $12                                   ; $138ECF |
  CMP #$0019                                ; $138ED1 |
  BNE CODE_138EDB                           ; $138ED4 |
  LDA #$1509                                ; $138ED6 |
  BRA CODE_138EE6                           ; $138ED9 |

CODE_138EDB:
  LDA #$1501                                ; $138EDB |
  CLC                                       ; $138EDE |
  ADC $00                                   ; $138EDF |
  BRA CODE_138EE6                           ; $138EE1 |

CODE_138EE3:
  LDA #$1506                                ; $138EE3 |

CODE_138EE6:
  LDX $1D                                   ; $138EE6 |
  STA $7F8000,x                             ; $138EE8 |
  SEP #$30                                  ; $138EEC |
  RTL                                       ; $138EEE |

  REP #$30                                  ; $138EEF |
  STZ $0A                                   ; $138EF1 |
  LDA $12                                   ; $138EF3 |
  AND #$FF00                                ; $138EF5 |
  CMP #$1600                                ; $138EF8 |
  BNE CODE_138F02                           ; $138EFB |
  LDA #$0006                                ; $138EFD |
  STA $0A                                   ; $138F00 |

CODE_138F02:
  LDA $12                                   ; $138F02 |
  CMP #$1501                                ; $138F04 |
  BEQ CODE_138F0E                           ; $138F07 |
  CMP #$1502                                ; $138F09 |
  BNE CODE_138F13                           ; $138F0C |

CODE_138F0E:
  LDA #$000C                                ; $138F0E |
  STA $0A                                   ; $138F11 |

CODE_138F13:
  LDY #$0000                                ; $138F13 |
  LDA $2C                                   ; $138F16 |
  BEQ CODE_138F23                           ; $138F18 |
  INY                                       ; $138F1A |
  INY                                       ; $138F1B |
  INC A                                     ; $138F1C |
  CMP $2E                                   ; $138F1D |
  BNE CODE_138F23                           ; $138F1F |
  INY                                       ; $138F21 |
  INY                                       ; $138F22 |

CODE_138F23:
  TYA                                       ; $138F23 |
  CLC                                       ; $138F24 |
  ADC $0A                                   ; $138F25 |
  TAY                                       ; $138F27 |
  LDA $8F34,y                               ; $138F28 |
  LDX $1D                                   ; $138F2B |
  STA $7F8000,x                             ; $138F2D |
  SEP #$30                                  ; $138F31 |
  RTL                                       ; $138F33 |

  dw $1500, $0019, $001A, $1400             ; $138F34 |
  dw $1615, $1616, $0000, $1509             ; $138F3C |

  REP #$30                                  ; $138F44 |
  LDX $1D                                   ; $138F46 |
  LDA $28                                   ; $138F48 |
  ASL A                                     ; $138F4A |
  TAY                                       ; $138F4B |
  LDA $2C                                   ; $138F4C |
  BEQ CODE_138F61                           ; $138F4E |
  INC A                                     ; $138F50 |
  CMP $2E                                   ; $138F51 |
  BEQ CODE_138F5C                           ; $138F53 |
  TYA                                       ; $138F55 |
  ORA #$0004                                ; $138F56 |
  TAY                                       ; $138F59 |
  BRA CODE_138F61                           ; $138F5A |

CODE_138F5C:
  TYA                                       ; $138F5C |
  ORA #$0008                                ; $138F5D |
  TAY                                       ; $138F60 |

CODE_138F61:
  LDA $8F6B,y                               ; $138F61 |
  STA $7F8000,x                             ; $138F64 |
  SEP #$30                                  ; $138F68 |
  RTL                                       ; $138F6A |

  dw $1507, $1508, $001B, $001C             ; $138F6B |
  dw $1503, $1504                           ; $138F73 |

  REP #$30                                  ; $138F77 |
  LDX $1D                                   ; $138F79 |
  LDA $15                                   ; $138F7B |
  AND #$0002                                ; $138F7D |
  TAY                                       ; $138F80 |
  LDA $8F8B,y                               ; $138F81 |
  STA $7F8000,x                             ; $138F84 |
  SEP #$30                                  ; $138F88 |
  RTL                                       ; $138F8A |

  dw $001D, $001E                           ; $138F8B |

  REP #$30                                  ; $138F8F |
  LDX $1D                                   ; $138F91 |
  LDA $2C                                   ; $138F93 |
  ASL A                                     ; $138F95 |
  TAY                                       ; $138F96 |
  LDA $28                                   ; $138F97 |
  AND #$0001                                ; $138F99 |
  BNE CODE_138FA3                           ; $138F9C |
  LDA $8FAD,y                               ; $138F9E |
  BRA CODE_138FA6                           ; $138FA1 |

CODE_138FA3:
  LDA $8FB7,y                               ; $138FA3 |

CODE_138FA6:
  STA $7F8000,x                             ; $138FA6 |
  SEP #$30                                  ; $138FAA |
  RTL                                       ; $138FAC |

  dw $002B, $0027, $9100, $7E02, $7E05      ; $138FAD |

  dw $002C, $0027, $9101, $7E03, $7E05      ; $138FB7 |

  REP #$30                                  ; $138FC1 |
  LDX $1D                                   ; $138FC3 |
  LDA #$7E04                                ; $138FC5 |
  STA $7F8000,x                             ; $138FC8 |
  SEP #$30                                  ; $138FCC |
  RTL                                       ; $138FCE |

  dw $9072, $9073, $907F, $908F             ; $138FCF |
  dw $90A2, $90A3                           ; $138FD7 |

  dw $9200, $9080                           ; $138FDB |
  dw $9090, $9068, $9069, $906A             ; $138FDF |
  dw $906D, $906B, $906B, $906C             ; $138FE7 |
  dw $906D, $906E, $906F, $9070             ; $138FEF |
  dw $906D, $9071, $906D, $906D             ; $138FF7 |
  dw $906D                                  ; $138FFF |

  REP #$30                                  ; $139001 |
  LDA $2C                                   ; $139003 |
  CMP #$0003                                ; $139005 |
  BCS CODE_139049                           ; $139008 |
  ASL A                                     ; $13900A |
  TAY                                       ; $13900B |
  BNE CODE_139017                           ; $13900C |
  JSL $128875                               ; $13900E |
  AND #$0003                                ; $139012 |
  STA $A1                                   ; $139015 |

CODE_139017:
  LDA $2C                                   ; $139017 |
  BNE CODE_139020                           ; $139019 |
  JSR CODE_1390EF                           ; $13901B |
  BRA CODE_13902A                           ; $13901E |

CODE_139020:
  LDA $2C                                   ; $139020 |
  CMP #$0001                                ; $139022 |
  BNE CODE_139030                           ; $139025 |
  JSR CODE_13906F                           ; $139027 |

CODE_13902A:
  TXA                                       ; $13902A |
  CPX #$FFFF                                ; $13902B |
  BNE CODE_139056                           ; $13902E |

CODE_139030:
  LDX #$0000                                ; $139030 |

CODE_139033:
  LDA $12                                   ; $139033 |
  CMP $8FCF,x                               ; $139035 |
  BEQ CODE_13905C                           ; $139038 |
  INX                                       ; $13903A |
  INX                                       ; $13903B |
  CPX #$000C                                ; $13903C |
  BCC CODE_139033                           ; $13903F |
  LDA $A1                                   ; $139041 |
  CLC                                       ; $139043 |
  ADC $8FDB,y                               ; $139044 |
  BRA CODE_139056                           ; $139047 |

CODE_139049:
  JSL $128875                               ; $139049 |
  ADC $2C                                   ; $13904D |
  AND #$001E                                ; $13904F |
  TAY                                       ; $139052 |
  LDA $8FE1,y                               ; $139053 |

CODE_139056:
  LDX $1D                                   ; $139056 |
  STA $7F8000,x                             ; $139058 |

CODE_13905C:
  SEP #$30                                  ; $13905C |
  RTL                                       ; $13905E |

  dw $330D, $3512, $9204, $9205             ; $13905F |
  dw $908F, $907F, $964D, $964E             ; $139067 |

CODE_13906F:
  LDA $12                                   ; $13906F |
  AND #$FF00                                ; $139071 |
  LDX #$0000                                ; $139074 |
  CMP #$9400                                ; $139077 |
  BEQ CODE_139088                           ; $13907A |
  INX                                       ; $13907C |
  INX                                       ; $13907D |
  CMP #$9500                                ; $13907E |
  BEQ CODE_139088                           ; $139081 |
  LDX #$FFFF                                ; $139083 |
  BRA CODE_1390E2                           ; $139086 |

CODE_139088:
  LDA $905F,x                               ; $139088 |
  STA $04                                   ; $13908B |
  LDX #$0000                                ; $13908D |
  LDA $28                                   ; $139090 |
  BEQ CODE_13909B                           ; $139092 |
  INC A                                     ; $139094 |
  CMP $2A                                   ; $139095 |
  BNE CODE_1390E2                           ; $139097 |
  INX                                       ; $139099 |
  INX                                       ; $13909A |

CODE_13909B:
  STX $0C                                   ; $13909B |
  LDA $9063,x                               ; $13909D |
  STA $06                                   ; $1390A0 |
  LDA $9067,x                               ; $1390A2 |
  STA $08                                   ; $1390A5 |
  LDA $906B,x                               ; $1390A7 |
  STA $0A                                   ; $1390AA |
  LDA $1B                                   ; $1390AC |
  STA $0E                                   ; $1390AE |
  JSL $128719                               ; $1390B0 |
  LDA $06                                   ; $1390B4 |
  STA $7F8000,x                             ; $1390B6 |
  LDA $1B                                   ; $1390BA |
  STA $0E                                   ; $1390BC |
  JSL $12875D                               ; $1390BE |
  LDA $08                                   ; $1390C2 |
  STA $7F8000,x                             ; $1390C4 |
  LDA $1B                                   ; $1390C8 |
  STA $0E                                   ; $1390CA |
  LDX $0C                                   ; $1390CC |
  BNE CODE_1390D6                           ; $1390CE |
  JSL $1287A1                               ; $1390D0 |
  BRA CODE_1390DA                           ; $1390D4 |

CODE_1390D6:
  JSL $1287E2                               ; $1390D6 |

CODE_1390DA:
  LDA $0A                                   ; $1390DA |
  STA $7F8000,x                             ; $1390DC |
  LDX $04                                   ; $1390E0 |

CODE_1390E2:
  RTS                                       ; $1390E2 |

  dw $9500, $9402                           ; $1390E3 |

  dw $90A3, $90A2                           ; $1390E7 |

  dw $9073, $9072                           ; $1390EB |

CODE_1390EF:
  LDA $12                                   ; $1390EF |
  AND #$FF00                                ; $1390F1 |
  LDX #$0000                                ; $1390F4 |
  CMP #$9400                                ; $1390F7 |
  BEQ CODE_139105                           ; $1390FA |
  INX                                       ; $1390FC |
  INX                                       ; $1390FD |
  CMP #$9500                                ; $1390FE |
  BEQ CODE_139105                           ; $139101 |
  BRA CODE_139113                           ; $139103 |

CODE_139105:
  LDX #$0000                                ; $139105 |
  LDA $28                                   ; $139108 |
  BEQ CODE_139118                           ; $13910A |
  INX                                       ; $13910C |
  INX                                       ; $13910D |
  INC A                                     ; $13910E |
  CMP $2A                                   ; $13910F |
  BEQ CODE_139118                           ; $139111 |

CODE_139113:
  LDX #$FFFF                                ; $139113 |
  BRA CODE_139158                           ; $139116 |

CODE_139118:
  LDA $90E3,x                               ; $139118 |
  STA $04                                   ; $13911B |
  LDA $90E7,x                               ; $13911D |
  STA $06                                   ; $139120 |
  LDA $90EB,x                               ; $139122 |
  STA $08                                   ; $139125 |
  LDA $1B                                   ; $139127 |
  STA $0E                                   ; $139129 |
  JSL $12875D                               ; $13912B |
  LDA $06                                   ; $13912F |
  STA $7F8000,x                             ; $139131 |
  LDA $1B                                   ; $139135 |
  AND #$F0F0                                ; $139137 |
  CLC                                       ; $13913A |
  ADC #$0010                                ; $13913B |
  AND #$F0F0                                ; $13913E |
  STA $00                                   ; $139141 |
  LDA $1B                                   ; $139143 |
  AND #$0F0F                                ; $139145 |
  ORA $00                                   ; $139148 |
  STA $0E                                   ; $13914A |
  JSL $12875D                               ; $13914C |
  LDA $08                                   ; $139150 |
  STA $7F8000,x                             ; $139152 |
  LDX $04                                   ; $139156 |

CODE_139158:
  RTS                                       ; $139158 |

  dw $9204, $330D, $909C, $90A0             ; $139159 |
  dw $90A2, $9072                           ; $139161 |

  REP #$30                                  ; $139165 |
  LDA $28                                   ; $139167 |
  BNE CODE_139177                           ; $139169 |
  LDA $2C                                   ; $13916B |
  CMP #$0001                                ; $13916D |
  BNE CODE_1391A5                           ; $139170 |
  LDA #$964D                                ; $139172 |
  BRA CODE_13919F                           ; $139175 |

CODE_139177:
  LDA $2C                                   ; $139177 |
  CMP #$0003                                ; $139179 |
  BCS CODE_139185                           ; $13917C |
  ASL A                                     ; $13917E |
  TAY                                       ; $13917F |
  LDA $9159,y                               ; $139180 |
  BRA CODE_13919F                           ; $139183 |

CODE_139185:
  JSL $128875                               ; $139185 |
  AND #$0001                                ; $139189 |
  CLC                                       ; $13918C |
  ADC #$909E                                ; $13918D |
  STA $0A                                   ; $139190 |
  JSR CODE_1391F9                           ; $139192 |
  TYA                                       ; $139195 |
  BMI CODE_13919D                           ; $139196 |
  LDA $915F,y                               ; $139198 |
  STA $0A                                   ; $13919B |

CODE_13919D:
  LDA $0A                                   ; $13919D |

CODE_13919F:
  LDX $1D                                   ; $13919F |
  STA $7F8000,x                             ; $1391A1 |

CODE_1391A5:
  SEP #$30                                  ; $1391A5 |
  RTL                                       ; $1391A7 |

  dw $9205, $3512, $909D, $90A1             ; $1391A8 |
  dw $90A3, $9073                           ; $1391B0 |

  REP #$30                                  ; $1391B4 |
  LDA $28                                   ; $1391B6 |
  BEQ CODE_1391C6                           ; $1391B8 |
  LDA $2C                                   ; $1391BA |
  CMP #$0001                                ; $1391BC |
  BNE CODE_1391F6                           ; $1391BF |
  LDA #$964E                                ; $1391C1 |
  BRA CODE_1391F0                           ; $1391C4 |

CODE_1391C6:
  LDA $2C                                   ; $1391C6 |
  CMP #$0003                                ; $1391C8 |
  BCS CODE_1391D6                           ; $1391CB |
  ASL A                                     ; $1391CD |
  TAY                                       ; $1391CE |
  LDA $91A8,y                               ; $1391CF |
  STA $0A                                   ; $1391D2 |
  BRA CODE_1391F0                           ; $1391D4 |

CODE_1391D6:
  JSL $128875                               ; $1391D6 |
  AND #$0001                                ; $1391DA |
  CLC                                       ; $1391DD |
  ADC #$9062                                ; $1391DE |
  STA $0A                                   ; $1391E1 |
  JSR CODE_1391F9                           ; $1391E3 |
  TYA                                       ; $1391E6 |
  BMI CODE_1391EE                           ; $1391E7 |
  LDA $91AE,y                               ; $1391E9 |
  STA $0A                                   ; $1391EC |

CODE_1391EE:
  LDA $0A                                   ; $1391EE |

CODE_1391F0:
  LDX $1D                                   ; $1391F0 |
  STA $7F8000,x                             ; $1391F2 |

CODE_1391F6:
  SEP #$30                                  ; $1391F6 |
  RTL                                       ; $1391F8 |

CODE_1391F9:
  LDY #$0000                                ; $1391F9 |
  LDA $12                                   ; $1391FC |
  CMP #$9200                                ; $1391FE |
  BCC CODE_139208                           ; $139201 |
  CMP #$9204                                ; $139203 |
  BCC CODE_139223                           ; $139206 |

CODE_139208:
  INY                                       ; $139208 |
  INY                                       ; $139209 |
  CMP #$9080                                ; $13920A |
  BCC CODE_139214                           ; $13920D |
  CMP #$9084                                ; $13920F |
  BCC CODE_139223                           ; $139212 |

CODE_139214:
  INY                                       ; $139214 |
  INY                                       ; $139215 |
  CMP #$9090                                ; $139216 |
  BCC CODE_139220                           ; $139219 |
  CMP #$9094                                ; $13921B |
  BCC CODE_139223                           ; $13921E |

CODE_139220:
  LDY #$FFFF                                ; $139220 |

CODE_139223:
  RTS                                       ; $139223 |

  dw $9608, $9300                           ; $139224 |

  REP #$30                                  ; $139228 |
  LDA $2C                                   ; $13922A |
  CMP #$0002                                ; $13922C |
  BCC CODE_139234                           ; $13922F |
  JMP CODE_139049                           ; $139231 |

CODE_139234:
  JSL $128875                               ; $139234 |
  AND #$0003                                ; $139238 |
  STA $00                                   ; $13923B |
  LDA $2C                                   ; $13923D |
  ASL A                                     ; $13923F |
  TAY                                       ; $139240 |
  LDA $00                                   ; $139241 |
  CLC                                       ; $139243 |
  ADC $9224,y                               ; $139244 |
  LDX $1D                                   ; $139247 |
  STA $7F8000,x                             ; $139249 |
  SEP #$30                                  ; $13924D |
  RTL                                       ; $13924F |

  dw $9400, $9502, $9185, $91D6             ; $139250 |
  dw $9278, $92E0                           ; $139258 |

  REP #$30                                  ; $13925C |
  LDX $15                                   ; $13925E |
  LDA $2C                                   ; $139260 |
  BEQ CODE_139267                           ; $139262 |
  JMP ($9254,x)                             ; $139264 |

CODE_139267:
  JSR ($9258,x)                             ; $139267 |
  LDX $15                                   ; $13926A |
  LDA $9250,x                               ; $13926C |
  LDX $1D                                   ; $13926F |
  STA $7F8000,x                             ; $139271 |
  SEP #$30                                  ; $139275 |
  RTL                                       ; $139277 |

  JSR CODE_13FD61                           ; $139278 |
  CMP #$9090                                ; $13927B |
  BCC CODE_1392DF                           ; $13927E |
  CMP #$9094                                ; $139280 |
  BCS CODE_1392DF                           ; $139283 |
  LDA #$908F                                ; $139285 |
  STA $7F8000,x                             ; $139288 |
  LDA $1B                                   ; $13928C |
  STA $0E                                   ; $13928E |
  JSL $128719                               ; $139290 |
  LDA #$964D                                ; $139294 |
  STA $7F8000,x                             ; $139297 |
  LDA $1B                                   ; $13929B |
  AND #$F0F0                                ; $13929D |
  SEC                                       ; $1392A0 |
  SBC #$0010                                ; $1392A1 |
  AND #$F0F0                                ; $1392A4 |
  STA $00                                   ; $1392A7 |
  LDA $1B                                   ; $1392A9 |
  AND #$0F0F                                ; $1392AB |
  ORA $00                                   ; $1392AE |
  STA $0E                                   ; $1392B0 |
  JSL $1287E2                               ; $1392B2 |
  LDA #$330D                                ; $1392B6 |
  STA $7F8000,x                             ; $1392B9 |
  LDA $1B                                   ; $1392BD |
  AND #$F0F0                                ; $1392BF |
  SEC                                       ; $1392C2 |
  SBC #$0020                                ; $1392C3 |
  AND #$F0F0                                ; $1392C6 |
  STA $00                                   ; $1392C9 |
  LDA $1B                                   ; $1392CB |
  AND #$0F0F                                ; $1392CD |
  ORA $00                                   ; $1392D0 |
  STA $0E                                   ; $1392D2 |
  JSL $1287E2                               ; $1392D4 |
  LDA #$9204                                ; $1392D8 |
  STA $7F8000,x                             ; $1392DB |

CODE_1392DF:
  RTS                                       ; $1392DF |

  JSR CODE_13FD54                           ; $1392E0 |
  CMP #$9090                                ; $1392E3 |
  BCC CODE_139347                           ; $1392E6 |
  CMP #$9094                                ; $1392E8 |
  BCS CODE_139347                           ; $1392EB |
  LDA #$907F                                ; $1392ED |
  STA $7F8000,x                             ; $1392F0 |
  LDA $1B                                   ; $1392F4 |
  STA $0E                                   ; $1392F6 |
  JSL $128719                               ; $1392F8 |
  LDA #$964E                                ; $1392FC |
  STA $7F8000,x                             ; $1392FF |
  LDA $1B                                   ; $139303 |
  AND #$F0F0                                ; $139305 |
  SEC                                       ; $139308 |
  SBC #$0010                                ; $139309 |
  AND #$F0F0                                ; $13930C |
  STA $00                                   ; $13930F |
  LDA $1B                                   ; $139311 |
  AND #$0F0F                                ; $139313 |
  ORA $00                                   ; $139316 |
  STA $0E                                   ; $139318 |
  JSL $1287A1                               ; $13931A |
  LDA #$3512                                ; $13931E |
  STA $7F8000,x                             ; $139321 |
  LDA $1B                                   ; $139325 |
  AND #$F0F0                                ; $139327 |
  SEC                                       ; $13932A |
  SBC #$0020                                ; $13932B |
  AND #$F0F0                                ; $13932E |
  STA $00                                   ; $139331 |
  LDA $1B                                   ; $139333 |
  AND #$0F0F                                ; $139335 |
  ORA $00                                   ; $139338 |
  STA $0E                                   ; $13933A |
  JSL $1287A1                               ; $13933C |
  LDA #$9205                                ; $139340 |
  STA $7F8000,x                             ; $139343 |

CODE_139347:
  RTS                                       ; $139347 |

  dw $9400, $905C, $9402, $90A2             ; $139348 |
  dw $9072                                  ; $139350 |

  REP #$30                                  ; $139352 |
  LDA #$0001                                ; $139354 |
  STA $9B                                   ; $139357 |
  LDA $2C                                   ; $139359 |
  CMP #$0003                                ; $13935B |
  BCC CODE_139363                           ; $13935E |
  JMP CODE_139049                           ; $139360 |

CODE_139363:
  LDA $28                                   ; $139363 |
  BNE CODE_1393A2                           ; $139365 |
  LDA $12                                   ; $139367 |
  CMP #$9080                                ; $139369 |
  BCC CODE_139373                           ; $13936C |
  CMP #$9084                                ; $13936E |
  BCC CODE_13937F                           ; $139371 |

CODE_139373:
  CMP #$9090                                ; $139373 |
  BCC CODE_1393A2                           ; $139376 |
  CMP #$9094                                ; $139378 |
  BCC CODE_13939D                           ; $13937B |
  BRA CODE_1393A2                           ; $13937D |

CODE_13937F:
  LDA $1B                                   ; $13937F |
  STA $0E                                   ; $139381 |
  JSL $128719                               ; $139383 |
  LDA #$9204                                ; $139387 |
  STA $7F8000,x                             ; $13938A |
  JSR CODE_13FD54                           ; $13938E |
  LDA #$964D                                ; $139391 |
  STA $7F8000,x                             ; $139394 |
  LDA #$330D                                ; $139398 |
  BRA CODE_1393D7                           ; $13939B |

CODE_13939D:
  LDA #$908F                                ; $13939D |
  BRA CODE_1393D7                           ; $1393A0 |

CODE_1393A2:
  JSL $128875                               ; $1393A2 |
  AND #$0001                                ; $1393A6 |
  STA $00                                   ; $1393A9 |
  LDA $2C                                   ; $1393AB |
  ASL A                                     ; $1393AD |
  TAY                                       ; $1393AE |
  LDA $9348,y                               ; $1393AF |
  CLC                                       ; $1393B2 |
  ADC $00                                   ; $1393B3 |
  STA $0A                                   ; $1393B5 |
  LDA $28                                   ; $1393B7 |
  DEC A                                     ; $1393B9 |
  CMP $2A                                   ; $1393BA |
  BNE CODE_1393CB                           ; $1393BC |
  JSR CODE_1391F9                           ; $1393BE |
  TYA                                       ; $1393C1 |
  BMI CODE_1393CB                           ; $1393C2 |
  LDA $934C,y                               ; $1393C4 |
  STA $0A                                   ; $1393C7 |
  BRA CODE_1393D5                           ; $1393C9 |

CODE_1393CB:
  LDA $2C                                   ; $1393CB |
  CMP #$0002                                ; $1393CD |
  BNE CODE_1393D5                           ; $1393D0 |
  JMP CODE_139049                           ; $1393D2 |

CODE_1393D5:
  LDA $0A                                   ; $1393D5 |

CODE_1393D7:
  LDX $1D                                   ; $1393D7 |
  STA $7F8000,x                             ; $1393D9 |
  SEP #$30                                  ; $1393DD |
  RTL                                       ; $1393DF |

  dw $9501, $905E, $9500, $90A3             ; $1393E0 |
  dw $9073                                  ; $1393E8 |

  REP #$30                                  ; $1393EA |
  LDA #$0001                                ; $1393EC |
  STA $9B                                   ; $1393EF |
  LDA $2C                                   ; $1393F1 |
  CMP #$0003                                ; $1393F3 |
  BCC CODE_1393FB                           ; $1393F6 |
  JMP CODE_139049                           ; $1393F8 |

CODE_1393FB:
  LDA $28                                   ; $1393FB |
  BNE CODE_13943A                           ; $1393FD |
  LDA $12                                   ; $1393FF |
  CMP #$9080                                ; $139401 |
  BCC CODE_13940B                           ; $139404 |
  CMP #$9084                                ; $139406 |
  BCC CODE_139417                           ; $139409 |

CODE_13940B:
  CMP #$9090                                ; $13940B |
  BCC CODE_13943A                           ; $13940E |
  CMP #$9094                                ; $139410 |
  BCC CODE_139435                           ; $139413 |
  BRA CODE_13943A                           ; $139415 |

CODE_139417:
  LDA $1B                                   ; $139417 |
  STA $0E                                   ; $139419 |
  JSL $128719                               ; $13941B |
  LDA #$9205                                ; $13941F |
  STA $7F8000,x                             ; $139422 |
  JSR CODE_13FD61                           ; $139426 |
  LDA #$964E                                ; $139429 |
  STA $7F8000,x                             ; $13942C |
  LDA #$3512                                ; $139430 |
  BRA CODE_13946F                           ; $139433 |

CODE_139435:
  LDA #$907F                                ; $139435 |
  BRA CODE_13946F                           ; $139438 |

CODE_13943A:
  JSL $128875                               ; $13943A |
  AND #$0001                                ; $13943E |
  STA $00                                   ; $139441 |
  LDA $2C                                   ; $139443 |
  ASL A                                     ; $139445 |
  TAY                                       ; $139446 |
  LDA $93E0,y                               ; $139447 |
  CLC                                       ; $13944A |
  ADC $00                                   ; $13944B |
  STA $0A                                   ; $13944D |
  LDA $28                                   ; $13944F |
  INC A                                     ; $139451 |
  CMP $2A                                   ; $139452 |
  BNE CODE_139463                           ; $139454 |
  JSR CODE_1391F9                           ; $139456 |
  TYA                                       ; $139459 |
  BMI CODE_139463                           ; $13945A |
  LDA $93E4,y                               ; $13945C |
  STA $0A                                   ; $13945F |
  BRA CODE_13946D                           ; $139461 |

CODE_139463:
  LDA $2C                                   ; $139463 |
  CMP #$0002                                ; $139465 |
  BNE CODE_13946D                           ; $139468 |
  JMP CODE_139049                           ; $13946A |

CODE_13946D:
  LDA $0A                                   ; $13946D |

CODE_13946F:
  LDX $1D                                   ; $13946F |
  STA $7F8000,x                             ; $139471 |
  SEP #$30                                  ; $139475 |
  RTL                                       ; $139477 |

  dw $9B01, $9B00, $9639, $9638             ; $139478 |
  dw $9629, $9628, $9631, $9630             ; $139480 |
  dw $961B, $9620, $961D, $961C             ; $139488 |
  dw $963D, $963C, $962D, $962C             ; $139490 |
  dw $9635, $9634, $961B, $9624             ; $139498 |
  dw $960E, $960F, $963A, $963B             ; $1394A0 |
  dw $962A, $962B, $9632, $9633             ; $1394A8 |
  dw $961B, $9623, $9B02, $9B03             ; $1394B0 |
  dw $963E, $963F, $962E, $962F             ; $1394B8 |
  dw $9636, $9637, $961B, $9627             ; $1394C0 |
  dw $9478, $948C, $94A0, $94B4             ; $1394C8 |

  REP #$30                                  ; $1394D0 |
  LDA $28                                   ; $1394D2 |
  AND #$0001                                ; $1394D4 |
  STA $00                                   ; $1394D7 |
  BNE CODE_1394EC                           ; $1394D9 |
  STZ $9B                                   ; $1394DB |
  LDA $2C                                   ; $1394DD |
  BNE CODE_1394F1                           ; $1394DF |
  JSL $128875                               ; $1394E1 |
  AND #$0002                                ; $1394E5 |
  STA $A1                                   ; $1394E8 |
  BRA CODE_1394F1                           ; $1394EA |

CODE_1394EC:
  LDA #$0001                                ; $1394EC |
  STA $9B                                   ; $1394EF |

CODE_1394F1:
  LDA $2C                                   ; $1394F1 |
  EOR #$FFFF                                ; $1394F3 |
  INC A                                     ; $1394F6 |
  CMP #$0005                                ; $1394F7 |
  BCS CODE_13950F                           ; $1394FA |
  ASL A                                     ; $1394FC |
  ADC $00                                   ; $1394FD |
  ASL A                                     ; $1394FF |
  TAY                                       ; $139500 |
  LDA $A1                                   ; $139501 |
  ORA $15                                   ; $139503 |
  TAX                                       ; $139505 |
  LDA $94C8,x                               ; $139506 |
  STA $00                                   ; $139509 |
  LDA ($00),y                               ; $13950B |
  BRA CODE_139512                           ; $13950D |

CODE_13950F:
  LDA #$961B                                ; $13950F |

CODE_139512:
  LDX $1D                                   ; $139512 |
  STA $7F8000,x                             ; $139514 |
  SEP #$30                                  ; $139518 |
  RTL                                       ; $13951A |

  REP #$30                                  ; $13951B |
  LDY #$0000                                ; $13951D |
  LDA $2C                                   ; $139520 |
  BEQ CODE_13952B                           ; $139522 |
  INY                                       ; $139524 |
  INC A                                     ; $139525 |
  CMP $2E                                   ; $139526 |
  BNE CODE_13952B                           ; $139528 |
  INY                                       ; $13952A |

CODE_13952B:
  TYA                                       ; $13952B |
  CLC                                       ; $13952C |
  ADC $1DCE                                 ; $13952D |
  LDX $1D                                   ; $139530 |
  STA $7F8000,x                             ; $139532 |
  LDA $2E                                   ; $139536 |
  DEC A                                     ; $139538 |
  BNE CODE_139542                           ; $139539 |
  LDA $1DD4                                 ; $13953B |
  STA $7F8000,x                             ; $13953E |

CODE_139542:
  SEP #$30                                  ; $139542 |
  RTL                                       ; $139544 |

  dw $330E, $3511                           ; $139545 |

  REP #$30                                  ; $139549 |
  LDA $2C                                   ; $13954B |
  BNE CODE_139558                           ; $13954D |
  LDA $28                                   ; $13954F |
  ASL A                                     ; $139551 |
  TAY                                       ; $139552 |
  LDA $9545,y                               ; $139553 |
  BRA CODE_13956D                           ; $139556 |

CODE_139558:
  LDA $28                                   ; $139558 |
  BNE CODE_139569                           ; $13955A |
  JSL $128875                               ; $13955C |
  AND #$0006                                ; $139560 |
  CLC                                       ; $139563 |
  ADC #$90DA                                ; $139564 |
  BRA CODE_13956D                           ; $139567 |

CODE_139569:
  JSR CODE_13FD54                           ; $139569 |
  INC A                                     ; $13956C |

CODE_13956D:
  LDX $1D                                   ; $13956D |
  STA $7F8000,x                             ; $13956F |
  SEP #$30                                  ; $139573 |
  RTL                                       ; $139575 |

  dw $95CE, $95EA, $9094, $9084             ; $139576 |
  dw $908E, $907E                           ; $13957E |

  dw $957A, $957E                           ; $139582 |
  dw $9064, $9074, $9064                    ; $139586 |

  REP #$30                                  ; $13958C |
  LDX $A1                                   ; $13958E |
  LDA $2E                                   ; $139590 |
  CLC                                       ; $139592 |
  SBC $2C                                   ; $139593 |
  CMP #$0002                                ; $139595 |
  BCC CODE_1395B4                           ; $139598 |
  LDA $2C                                   ; $13959A |
  CMP #$0004                                ; $13959C |
  BCS CODE_1395A8                           ; $13959F |
  ASL A                                     ; $1395A1 |
  TAY                                       ; $1395A2 |
  JSR ($9576,x)                             ; $1395A3 |
  BRA CODE_1395BD                           ; $1395A6 |

CODE_1395A8:
  AND #$0001                                ; $1395A8 |
  ASL A                                     ; $1395AB |
  ADC $A1                                   ; $1395AC |
  TAY                                       ; $1395AE |
  LDA $9586,y                               ; $1395AF |
  BRA CODE_1395BD                           ; $1395B2 |

CODE_1395B4:
  ASL A                                     ; $1395B4 |
  TAY                                       ; $1395B5 |
  LDA $9582,x                               ; $1395B6 |
  STA $00                                   ; $1395B9 |
  LDA ($00),y                               ; $1395BB |

CODE_1395BD:
  LDX $1D                                   ; $1395BD |
  STA $7F8000,x                             ; $1395BF |
  SEP #$30                                  ; $1395C3 |
  RTL                                       ; $1395C5 |

  dw $9211, $9065, $9075, $9085             ; $1395C6 |

  LDA $2C                                   ; $1395CE |
  BNE CODE_1395DE                           ; $1395D0 |
  LDA $12                                   ; $1395D2 |
  CMP #$9214                                ; $1395D4 |
  BNE CODE_1395DE                           ; $1395D7 |
  LDA #$9213                                ; $1395D9 |
  BRA CODE_1395E1                           ; $1395DC |

CODE_1395DE:
  LDA $95C6,y                               ; $1395DE |

CODE_1395E1:
  RTS                                       ; $1395E1 |

  dw $9212, $9078, $9088, $9079             ; $1395E2 |

  LDA $2C                                   ; $1395EA |
  BNE CODE_1395FA                           ; $1395EC |
  LDA $12                                   ; $1395EE |
  CMP #$9214                                ; $1395F0 |
  BNE CODE_1395FA                           ; $1395F3 |
  LDA #$9216                                ; $1395F5 |
  BRA CODE_1395FD                           ; $1395F8 |

CODE_1395FA:
  LDA $95E2,y                               ; $1395FA |

CODE_1395FD:
  RTS                                       ; $1395FD |

  JSL $13958C                               ; $1395FE |
  LDA $2C                                   ; $139602 |
  CMP #$04                                  ; $139604 |
  BCC CODE_139651                           ; $139606 |
  LDA $2E                                   ; $139608 |
  CLC                                       ; $13960A |
  SBC $2C                                   ; $13960B |
  CMP #$02                                  ; $13960D |
  BCC CODE_139651                           ; $13960F |
  REP #$30                                  ; $139611 |
  JSL $128875                               ; $139613 |
  AND #$0002                                ; $139617 |
  BEQ CODE_13964F                           ; $13961A |
  LDA $1B                                   ; $13961C |
  STA $0E                                   ; $13961E |
  LDX $1D                                   ; $139620 |
  LDA $7F8000,x                             ; $139622 |
  CMP #$9064                                ; $139626 |
  BNE CODE_13963B                           ; $139629 |
  JSL $1287A1                               ; $13962B |
  LDA #$907A                                ; $13962F |
  STA $7F8000,x                             ; $139632 |
  LDA #$907B                                ; $139636 |
  BRA CODE_139649                           ; $139639 |

CODE_13963B:
  JSL $1287E2                               ; $13963B |
  LDA #$908A                                ; $13963F |
  STA $7F8000,x                             ; $139642 |
  LDA #$9089                                ; $139646 |

CODE_139649:
  LDX $1D                                   ; $139649 |
  STA $7F8000,x                             ; $13964B |

CODE_13964F:
  SEP #$30                                  ; $13964F |

CODE_139651:
  RTL                                       ; $139651 |

  dw $966F, $1530                           ; $139652 |

  dw $9670, $9A00                           ; $139656 |

  dw $9671, $1531                           ; $13965A |

  REP #$30                                  ; $13965E |
  LDA $2C                                   ; $139660 |
  CMP #$0002                                ; $139662 |
  BCS CODE_139682                           ; $139665 |
  ASL A                                     ; $139667 |
  TAY                                       ; $139668 |
  JSR CODE_13FD54                           ; $139669 |
  LDA $9652,y                               ; $13966C |
  STA $7F8000,x                             ; $13966F |
  JSR CODE_13FD61                           ; $139673 |
  LDA $965A,y                               ; $139676 |
  STA $7F8000,x                             ; $139679 |
  LDA $9656,y                               ; $13967D |
  BRA CODE_1396A1                           ; $139680 |

CODE_139682:
  INC A                                     ; $139682 |
  CMP $2E                                   ; $139683 |
  BEQ CODE_13969E                           ; $139685 |
  CMP #$0003                                ; $139687 |
  BNE CODE_139691                           ; $13968A |
  LDA #$990A                                ; $13968C |
  BRA CODE_1396A1                           ; $13968F |

CODE_139691:
  JSL $128875                               ; $139691 |
  AND #$0002                                ; $139695 |
  LSR A                                     ; $139698 |
  ADC #$990B                                ; $139699 |
  BRA CODE_1396A1                           ; $13969C |

CODE_13969E:
  LDA #$9206                                ; $13969E |

CODE_1396A1:
  LDX $1D                                   ; $1396A1 |
  STA $7F8000,x                             ; $1396A3 |
  SEP #$30                                  ; $1396A7 |
  RTL                                       ; $1396A9 |

  dw $9213, $9214, $9213, $9216             ; $1396AA |

  REP #$30                                  ; $1396B2 |
  LDA $2C                                   ; $1396B4 |
  BNE CODE_1396F6                           ; $1396B6 |
  LDA $12                                   ; $1396B8 |
  CMP #$9B00                                ; $1396BA |
  BCC CODE_1396C7                           ; $1396BD |
  CMP #$9B04                                ; $1396BF |
  BCS CODE_1396C7                           ; $1396C2 |
  JMP CODE_139760                           ; $1396C4 |

CODE_1396C7:
  LDA $1B                                   ; $1396C7 |
  STA $0E                                   ; $1396C9 |
  JSL $128719                               ; $1396CB |
  LDY #$0000                                ; $1396CF |
  LDA $7F8000,x                             ; $1396D2 |
  CMP #$963B                                ; $1396D6 |
  BEQ CODE_1396ED                           ; $1396D9 |
  INY                                       ; $1396DB |
  CMP #$963C                                ; $1396DC |
  BEQ CODE_1396ED                           ; $1396DF |
  INY                                       ; $1396E1 |
  CMP #$960E                                ; $1396E2 |
  BEQ CODE_1396ED                           ; $1396E5 |
  INY                                       ; $1396E7 |
  CMP #$961D                                ; $1396E8 |
  BNE CODE_1396F6                           ; $1396EB |

CODE_1396ED:
  TYA                                       ; $1396ED |
  CLC                                       ; $1396EE |
  ADC #$9B04                                ; $1396EF |
  STA $7F8000,x                             ; $1396F2 |

CODE_1396F6:
  LDY #$0000                                ; $1396F6 |
  LDA $12                                   ; $1396F9 |
  CMP #$960F                                ; $1396FB |
  BEQ CODE_139706                           ; $1396FE |
  INY                                       ; $139700 |
  CMP #$961C                                ; $139701 |
  BNE CODE_13970D                           ; $139704 |

CODE_139706:
  TYA                                       ; $139706 |
  CLC                                       ; $139707 |
  ADC #$9900                                ; $139708 |
  BRA CODE_13975A                           ; $13970B |

CODE_13970D:
  JSL $128875                               ; $13970D |
  AND #$0001                                ; $139711 |
  STA $00                                   ; $139714 |
  LDA $2C                                   ; $139716 |
  INC A                                     ; $139718 |
  CMP $2E                                   ; $139719 |
  BEQ CODE_139725                           ; $13971B |
  LDA $00                                   ; $13971D |
  CLC                                       ; $13971F |
  ADC #$9908                                ; $139720 |
  BRA CODE_139757                           ; $139723 |

CODE_139725:
  LDA $12                                   ; $139725 |
  AND #$FF00                                ; $139727 |
  CMP #$9200                                ; $13972A |
  BNE CODE_139745                           ; $13972D |
  LDA $12                                   ; $13972F |
  CMP #$920F                                ; $139731 |
  BCS CODE_13973B                           ; $139734 |
  LDA #$9215                                ; $139736 |
  BRA CODE_13975A                           ; $139739 |

CODE_13973B:
  SBC #$920F                                ; $13973B |
  ASL A                                     ; $13973E |
  TAY                                       ; $13973F |
  LDA $96AA,y                               ; $139740 |
  BRA CODE_13975A                           ; $139743 |

CODE_139745:
  LDA $00                                   ; $139745 |
  CLC                                       ; $139747 |
  ADC #$00AC                                ; $139748 |
  LDX $A1                                   ; $13974B |
  BEQ CODE_13975A                           ; $13974D |
  LDA $00                                   ; $13974F |
  CLC                                       ; $139751 |
  ADC #$00AE                                ; $139752 |
  BRA CODE_13975A                           ; $139755 |

CODE_139757:
  CLC                                       ; $139757 |
  ADC $A1                                   ; $139758 |

CODE_13975A:
  LDX $1D                                   ; $13975A |
  STA $7F8000,x                             ; $13975C |

CODE_139760:
  SEP #$30                                  ; $139760 |
  RTL                                       ; $139762 |

  dw $97A2, $97AD, $97CB                    ; $139763 |

  JSL $1396B2                               ; $139769 |
  LDA $2C                                   ; $13976D |
  BEQ CODE_1397A1                           ; $13976F |
  CMP #$F001                                ; $139771 |
  BIT $C51A                                 ; $139774 |
  ROL $27F0                                 ; $139777 |
  REP #$30                                  ; $13977A |
  JSL $128875                               ; $13977C |
  AND #$0007                                ; $139780 |
  CMP #$0006                                ; $139783 |
  BCS CODE_13979F                           ; $139786 |
  STA $0A                                   ; $139788 |
  ADC #$9902                                ; $13978A |
  CLC                                       ; $13978D |
  ADC $A1                                   ; $13978E |
  LDX $1D                                   ; $139790 |
  STA $7F8000,x                             ; $139792 |
  LDA $0A                                   ; $139796 |
  AND #$000E                                ; $139798 |
  TAX                                       ; $13979B |
  JSR ($9763,x)                             ; $13979C |

CODE_13979F:
  SEP #$30                                  ; $13979F |

CODE_1397A1:
  RTL                                       ; $1397A1 |

  JSR CODE_1397AD                           ; $1397A2 |
  JSR CODE_1397CB                           ; $1397A5 |
  RTS                                       ; $1397A8 |

  dw $9672, $9674                           ; $1397A9 |

CODE_1397AD:
  JSR CODE_13FD54                           ; $1397AD |
  LDA $0A                                   ; $1397B0 |
  AND #$0001                                ; $1397B2 |
  ASL A                                     ; $1397B5 |
  TAY                                       ; $1397B6 |
  LDA $97A9,y                               ; $1397B7 |
  LDY $A1                                   ; $1397BA |
  BEQ CODE_1397C2                           ; $1397BC |
  INC A                                     ; $1397BE |
  INC A                                     ; $1397BF |
  INC A                                     ; $1397C0 |
  INC A                                     ; $1397C1 |

CODE_1397C2:
  STA $7F8000,x                             ; $1397C2 |
  RTS                                       ; $1397C6 |

  dw $9673, $9675                           ; $1397C7 |

CODE_1397CB:
  JSR CODE_13FD61                           ; $1397CB |
  LDA $0A                                   ; $1397CE |
  AND #$0001                                ; $1397D0 |
  ASL A                                     ; $1397D3 |
  TAY                                       ; $1397D4 |
  LDA $97C7,y                               ; $1397D5 |
  LDY $A1                                   ; $1397D8 |
  BEQ CODE_1397E0                           ; $1397DA |
  INC A                                     ; $1397DC |
  INC A                                     ; $1397DD |
  INC A                                     ; $1397DE |
  INC A                                     ; $1397DF |

CODE_1397E0:
  STA $7F8000,x                             ; $1397E0 |
  RTS                                       ; $1397E4 |

  dw $9809, $9828, $98B0                    ; $1397E5 |

  REP #$30                                  ; $1397EB |
  LDX #$0000                                ; $1397ED |
  LDA $2C                                   ; $1397F0 |
  BEQ CODE_1397FD                           ; $1397F2 |
  INX                                       ; $1397F4 |
  INX                                       ; $1397F5 |
  INC A                                     ; $1397F6 |
  CMP $2E                                   ; $1397F7 |
  BNE CODE_1397FD                           ; $1397F9 |
  INX                                       ; $1397FB |
  INX                                       ; $1397FC |

CODE_1397FD:
  JSR ($97E5,x)                             ; $1397FD |
  LDX $1D                                   ; $139800 |
  STA $7F8000,x                             ; $139802 |
  SEP #$30                                  ; $139806 |
  RTL                                       ; $139808 |

  LDA #$90A8                                ; $139809 |
  LDY $28                                   ; $13980C |
  BEQ CODE_139821                           ; $13980E |
  INC A                                     ; $139810 |
  INY                                       ; $139811 |
  CPY $2A                                   ; $139812 |
  BEQ CODE_139821                           ; $139814 |
  JSL $128875                               ; $139816 |
  AND #$0001                                ; $13981A |
  CLC                                       ; $13981D |
  ADC #$90BE                                ; $13981E |

CODE_139821:
  RTS                                       ; $139821 |

  dw $984A, $9879, $9881                    ; $139822 |

  JSL $128875                               ; $139828 |
  AND #$0007                                ; $13982C |
  TAY                                       ; $13982F |
  LDX #$0000                                ; $139830 |
  LDA $28                                   ; $139833 |
  BEQ CODE_139840                           ; $139835 |
  INX                                       ; $139837 |
  INX                                       ; $139838 |
  INC A                                     ; $139839 |
  CMP $2A                                   ; $13983A |
  BNE CODE_139840                           ; $13983C |
  INX                                       ; $13983E |
  INX                                       ; $13983F |

CODE_139840:
  LDA $1B                                   ; $139840 |
  STA $0E                                   ; $139842 |
  JSR ($9822,x)                             ; $139844 |
  LDA $04                                   ; $139847 |
  RTS                                       ; $139849 |

  TYA                                       ; $13984A |
  AND #$0003                                ; $13984B |
  CLC                                       ; $13984E |
  ADC #$90B6                                ; $13984F |
  STA $04                                   ; $139852 |
  JSL $1287A1                               ; $139854 |
  LDA $7F8000,x                             ; $139858 |
  CMP #$90C4                                ; $13985C |
  BEQ CODE_139870                           ; $13985F |
  CMP #$90C5                                ; $139861 |
  BEQ CODE_139870                           ; $139864 |
  CMP #$90C6                                ; $139866 |
  BEQ CODE_139870                           ; $139869 |
  CMP #$90C7                                ; $13986B |
  BNE CODE_139878                           ; $13986E |

CODE_139870:
  LDA $04                                   ; $139870 |
  INC A                                     ; $139872 |
  INC A                                     ; $139873 |
  INC A                                     ; $139874 |
  INC A                                     ; $139875 |
  STA $04                                   ; $139876 |

CODE_139878:
  RTS                                       ; $139878 |

  TYA                                       ; $139879 |
  CLC                                       ; $13987A |
  ADC #$90D2                                ; $13987B |
  STA $04                                   ; $13987E |
  RTS                                       ; $139880 |

  TYA                                       ; $139881 |
  AND #$0003                                ; $139882 |
  CLC                                       ; $139885 |
  ADC #$90C4                                ; $139886 |
  STA $04                                   ; $139889 |
  JSL $1287E2                               ; $13988B |
  LDA $7F8000,x                             ; $13988F |
  CMP #$90B6                                ; $139893 |
  BEQ CODE_1398A7                           ; $139896 |
  CMP #$90B7                                ; $139898 |
  BEQ CODE_1398A7                           ; $13989B |
  CMP #$90B8                                ; $13989D |
  BEQ CODE_1398A7                           ; $1398A0 |
  CMP #$90B9                                ; $1398A2 |
  BNE CODE_1398AF                           ; $1398A5 |

CODE_1398A7:
  LDA $04                                   ; $1398A7 |
  INC A                                     ; $1398A9 |
  INC A                                     ; $1398AA |
  INC A                                     ; $1398AB |
  INC A                                     ; $1398AC |
  STA $04                                   ; $1398AD |

CODE_1398AF:
  RTS                                       ; $1398AF |

  LDA $12                                   ; $1398B0 |
  AND #$FF00                                ; $1398B2 |
  CMP #$9200                                ; $1398B5 |
  BNE CODE_1398D4                           ; $1398B8 |
  LDA #$90CC                                ; $1398BA |
  LDX $28                                   ; $1398BD |
  BEQ CODE_1398EC                           ; $1398BF |
  INC A                                     ; $1398C1 |
  INX                                       ; $1398C2 |
  CPX $2A                                   ; $1398C3 |
  BEQ CODE_1398EC                           ; $1398C5 |
  JSL $128875                               ; $1398C7 |
  AND #$0003                                ; $1398CB |
  CLC                                       ; $1398CE |
  ADC #$90CE                                ; $1398CF |
  BRA CODE_1398EC                           ; $1398D2 |

CODE_1398D4:
  LDA #$90AE                                ; $1398D4 |
  LDX $28                                   ; $1398D7 |
  BEQ CODE_1398EC                           ; $1398D9 |
  INC A                                     ; $1398DB |
  INX                                       ; $1398DC |
  CPX $2A                                   ; $1398DD |
  BEQ CODE_1398EC                           ; $1398DF |
  JSL $128875                               ; $1398E1 |
  AND #$0003                                ; $1398E5 |
  CLC                                       ; $1398E8 |
  ADC #$90B2                                ; $1398E9 |

CODE_1398EC:
  RTS                                       ; $1398EC |

  dw $9911, $9828, $98B0                    ; $1398ED |

  REP #$30                                  ; $1398F3 |
  LDX #$0000                                ; $1398F5 |
  LDA $2C                                   ; $1398F8 |
  BEQ CODE_139905                           ; $1398FA |
  INX                                       ; $1398FC |
  INX                                       ; $1398FD |
  INC A                                     ; $1398FE |
  CMP $2E                                   ; $1398FF |
  BNE CODE_139905                           ; $139901 |
  INX                                       ; $139903 |
  INX                                       ; $139904 |

CODE_139905:
  JSR ($98ED,x)                             ; $139905 |
  LDX $1D                                   ; $139908 |
  STA $7F8000,x                             ; $13990A |
  SEP #$30                                  ; $13990E |
  RTL                                       ; $139910 |

  LDA #$90AA                                ; $139911 |
  LDX $28                                   ; $139914 |
  BEQ CODE_139929                           ; $139916 |
  INC A                                     ; $139918 |
  INX                                       ; $139919 |
  CPX $2A                                   ; $13991A |
  BEQ CODE_139929                           ; $13991C |
  JSL $128875                               ; $13991E |
  AND #$0003                                ; $139922 |
  CLC                                       ; $139925 |
  ADC #$90C0                                ; $139926 |

CODE_139929:
  RTS                                       ; $139929 |

  dw $9640, $964F, $9641, $9650             ; $13992A |
  dw $9642, $9651, $9643, $9652             ; $139932 |
  dw $9644, $9653, $9645, $9654             ; $13993A |
  dw $9646, $9655, $9647, $9656             ; $139942 |
  dw $9648, $9657, $9649, $9658             ; $13994A |
  dw $964A, $9659, $964B, $965A             ; $139952 |
  dw $0000, $965B, $0000, $965C             ; $13995A |
  dw $0000, $965D, $0000, $965E             ; $139962 |

  dw $992A, $992E, $9932, $9936             ; $13996A |
  dw $993A, $993E, $9942, $9946             ; $139972 |
  dw $994A, $994E, $9952, $9956             ; $13997A |
  dw $995A, $995E, $9962, $9966             ; $139982 |

  REP #$30                                  ; $13998A |
  LDA $2C                                   ; $13998C |
  BNE CODE_139999                           ; $13998E |
  JSL $128875                               ; $139990 |
  AND #$001E                                ; $139994 |
  STA $A1                                   ; $139997 |

CODE_139999:
  LDA $2C                                   ; $139999 |
  ASL A                                     ; $13999B |
  TAY                                       ; $13999C |
  LDX $A1                                   ; $13999D |
  LDA $996A,x                               ; $13999F |
  STA $00                                   ; $1399A2 |
  LDA ($00),y                               ; $1399A4 |
  BEQ CODE_1399D6                           ; $1399A6 |
  STA $00                                   ; $1399A8 |
  LDX $1D                                   ; $1399AA |
  LDY $2C                                   ; $1399AC |
  BEQ CODE_1399D0                           ; $1399AE |
  LDA $7F8000,x                             ; $1399B0 |
  CMP #$9608                                ; $1399B4 |
  BEQ CODE_1399C8                           ; $1399B7 |
  CMP #$9609                                ; $1399B9 |
  BEQ CODE_1399C8                           ; $1399BC |
  CMP #$960A                                ; $1399BE |
  BEQ CODE_1399C8                           ; $1399C1 |
  CMP #$960B                                ; $1399C3 |
  BNE CODE_1399D0                           ; $1399C6 |

CODE_1399C8:
  LDA $00                                   ; $1399C8 |
  CLC                                       ; $1399CA |
  ADC #$0010                                ; $1399CB |
  STA $00                                   ; $1399CE |

CODE_1399D0:
  LDA $00                                   ; $1399D0 |
  STA $7F8000,x                             ; $1399D2 |

CODE_1399D6:
  SEP #$30                                  ; $1399D6 |
  RTL                                       ; $1399D8 |

  dw $1619, $161A, $1626, $1627             ; $1399D9 |
  dw $161B, $161C, $1628, $1628             ; $1399E1 |

  dw $99E1, $99D9, $99E1, $99E1             ; $1399E9 |
  dw $9098, $9099, $909A, $9098             ; $1399F1 |

  REP #$30                                  ; $1399F9 |
  LDA $28                                   ; $1399FB |
  AND #$0001                                ; $1399FD |
  STA $00                                   ; $139A00 |
  LDA $2C                                   ; $139A02 |
  BEQ CODE_139A10                           ; $139A04 |
  CMP #$0002                                ; $139A06 |
  BCC CODE_139A1D                           ; $139A09 |
  LDA #$1628                                ; $139A0B |
  BRA CODE_139A2D                           ; $139A0E |

CODE_139A10:
  LDA $00                                   ; $139A10 |
  BNE CODE_139A1D                           ; $139A12 |
  JSL $128875                               ; $139A14 |
  AND #$0006                                ; $139A18 |
  STA $15                                   ; $139A1B |

CODE_139A1D:
  LDX $15                                   ; $139A1D |
  LDA $99E9,x                               ; $139A1F |
  STA $02                                   ; $139A22 |
  LDA $2C                                   ; $139A24 |
  ASL A                                     ; $139A26 |
  ADC $00                                   ; $139A27 |
  ASL A                                     ; $139A29 |
  TAY                                       ; $139A2A |
  LDA ($02),y                               ; $139A2B |

CODE_139A2D:
  STA $00                                   ; $139A2D |
  LDA $12                                   ; $139A2F |
  AND #$FF00                                ; $139A31 |
  CMP #$6B00                                ; $139A34 |
  BEQ CODE_139A43                           ; $139A37 |
  CMP #$9300                                ; $139A39 |
  BEQ CODE_139A43                           ; $139A3C |
  CMP #$9000                                ; $139A3E |
  BNE CODE_139A65                           ; $139A41 |

CODE_139A43:
  STZ $15                                   ; $139A43 |
  LDA $2C                                   ; $139A45 |
  BNE CODE_139A4E                           ; $139A47 |
  LDA #$9061                                ; $139A49 |
  BRA CODE_139A7C                           ; $139A4C |

CODE_139A4E:
  CMP #$0002                                ; $139A4E |
  BCS CODE_139A60                           ; $139A51 |
  JSL $128875                               ; $139A53 |
  AND #$0006                                ; $139A57 |
  TAY                                       ; $139A5A |
  LDA $99F1,y                               ; $139A5B |
  BRA CODE_139A7C                           ; $139A5E |

CODE_139A60:
  LDA #$909B                                ; $139A60 |
  BRA CODE_139A7C                           ; $139A63 |

CODE_139A65:
  CMP #$9400                                ; $139A65 |
  BEQ CODE_139A74                           ; $139A68 |
  CMP #$9500                                ; $139A6A |
  BNE CODE_139A7E                           ; $139A6D |
  LDA #$9800                                ; $139A6F |
  BRA CODE_139A77                           ; $139A72 |

CODE_139A74:
  LDA #$9700                                ; $139A74 |

CODE_139A77:
  LDY $2C                                   ; $139A77 |
  BEQ CODE_139A7C                           ; $139A79 |
  INC A                                     ; $139A7B |

CODE_139A7C:
  STA $00                                   ; $139A7C |

CODE_139A7E:
  LDA $00                                   ; $139A7E |
  LDX $1D                                   ; $139A80 |
  STA $7F8000,x                             ; $139A82 |
  SEP #$30                                  ; $139A86 |
  RTL                                       ; $139A88 |

  REP #$30                                  ; $139A89 |
  LDA $12                                   ; $139A8B |
  BNE CODE_139A98                           ; $139A8D |
  LDA #$1512                                ; $139A8F |
  LDX $1D                                   ; $139A92 |
  STA $7F8000,x                             ; $139A94 |

CODE_139A98:
  SEP #$30                                  ; $139A98 |
  RTL                                       ; $139A9A |

  dw $9D00, $9D01, $9D02, $9D03             ; $139A9B |
  dw $9D0A, $9D0B, $9D0C, $9D0D             ; $139AA3 |
  dw $9D12, $9D13, $9D14, $9D15             ; $139AAB |

  dw $9D1C, $9D1D, $9D1E, $9D1F             ; $139AB3 |
  dw $9D24, $9D25, $9D26, $9D27             ; $139ABB |
  dw $9D2A, $9D2B, $9D2C, $9D2D             ; $139AC3 |
  dw $0504, $0706, $0504, $0706             ; $139ACB |
  dw $0908, $0B0E, $0F0C, $0F0E             ; $139AD3 |
  dw $1B1A, $1716, $1918, $1716             ; $139ADB |
  dw $1918, $1B1A, $2120, $2322             ; $139AE3 |
  dw $2120, $2322, $2528, $2926             ; $139AEB |
  dw $2928, $2F2E, $3130, $2F2E             ; $139AF3 |
  dw $3130                                  ; $139AFB |

  dw $9B5B, $9BE5, $9BE5, $9C60             ; $139AFD |
  dw $9CED, $9D5C, $9D5C, $9D5D             ; $139B05 |
  dw $9DD2, $9E5C, $9E5C, $9ED7             ; $139B0D |

  REP #$30                                  ; $139B15 |
  LDA $2C                                   ; $139B17 |
  BEQ CODE_139B28                           ; $139B19 |
  INC A                                     ; $139B1B |
  CMP $2E                                   ; $139B1C |
  BEQ CODE_139B25                           ; $139B1E |
  LDA #$0001                                ; $139B20 |
  BRA CODE_139B28                           ; $139B23 |

CODE_139B25:
  LDA #$0002                                ; $139B25 |

CODE_139B28:
  ASL A                                     ; $139B28 |
  ASL A                                     ; $139B29 |
  STA $00                                   ; $139B2A |
  LDA $28                                   ; $139B2C |
  BEQ CODE_139B3E                           ; $139B2E |
  INC A                                     ; $139B30 |
  CMP $2A                                   ; $139B31 |
  BNE CODE_139B3A                           ; $139B33 |
  LDA #$0003                                ; $139B35 |
  BRA CODE_139B3E                           ; $139B38 |

CODE_139B3A:
  AND #$0001                                ; $139B3A |
  INC A                                     ; $139B3D |

CODE_139B3E:
  ORA $00                                   ; $139B3E |
  ASL A                                     ; $139B40 |
  TAY                                       ; $139B41 |
  LDA $15                                   ; $139B42 |
  BNE CODE_139B4B                           ; $139B44 |
  LDA $9A9B,y                               ; $139B46 |
  BRA CODE_139B4E                           ; $139B49 |

CODE_139B4B:
  LDA $9AB3,y                               ; $139B4B |

CODE_139B4E:
  LDX $1D                                   ; $139B4E |
  STA $7F8000,x                             ; $139B50 |
  TYX                                       ; $139B54 |
  JSR ($9AFD,x)                             ; $139B55 |
  SEP #$30                                  ; $139B58 |
  RTL                                       ; $139B5A |

  LDA $1B                                   ; $139B5B |
  STA $0E                                   ; $139B5D |
  JSL $128719                               ; $139B5F |
  STX $04                                   ; $139B63 |
  LDA $7F8000,x                             ; $139B65 |
  AND #$FF00                                ; $139B69 |
  CMP #$9D00                                ; $139B6C |
  BNE CODE_139BE4                           ; $139B6F |
  LDA $7F8000,x                             ; $139B71 |
  AND #$00FF                                ; $139B75 |
  STA $06                                   ; $139B78 |
  JSR CODE_13FD54                           ; $139B7A |
  STX $08                                   ; $139B7D |
  AND #$FF00                                ; $139B7F |
  CMP #$9D00                                ; $139B82 |
  BNE CODE_139BE4                           ; $139B85 |
  LDA $7F8000,x                             ; $139B87 |
  AND #$00FF                                ; $139B8B |
  STA $0A                                   ; $139B8E |
  LDA $1B                                   ; $139B90 |
  TAX                                       ; $139B92 |
  AND #$F0F0                                ; $139B93 |
  STA $00                                   ; $139B96 |
  TXA                                       ; $139B98 |
  AND #$0F0F                                ; $139B99 |
  DEC A                                     ; $139B9C |
  AND #$0F0F                                ; $139B9D |
  ORA $00                                   ; $139BA0 |
  STA $0E                                   ; $139BA2 |
  JSL $128719                               ; $139BA4 |
  LDA $7F8000,x                             ; $139BA8 |
  AND #$FF00                                ; $139BAC |
  CMP #$9D00                                ; $139BAF |
  BNE CODE_139BE4                           ; $139BB2 |
  LDA $7F8000,x                             ; $139BB4 |
  AND #$00FF                                ; $139BB8 |
  JSR CODE_139F64                           ; $139BBB |
  LDX $04                                   ; $139BBE |
  LDA $06                                   ; $139BC0 |
  JSR CODE_139F64                           ; $139BC2 |
  LDX $08                                   ; $139BC5 |
  LDA $0A                                   ; $139BC7 |
  JSR CODE_139F64                           ; $139BC9 |
  LDX $1D                                   ; $139BCC |
  LDA $7F8000,x                             ; $139BCE |
  AND #$FF00                                ; $139BD2 |
  CMP #$9D00                                ; $139BD5 |
  BNE CODE_139BE4                           ; $139BD8 |
  LDA $7F8000,x                             ; $139BDA |
  AND #$00FF                                ; $139BDE |
  JSR CODE_139F64                           ; $139BE1 |

CODE_139BE4:
  RTS                                       ; $139BE4 |

  LDA $1B                                   ; $139BE5 |
  TAX                                       ; $139BE7 |
  AND #$F0F0                                ; $139BE8 |
  STA $04                                   ; $139BEB |
  TXA                                       ; $139BED |
  AND #$0F0F                                ; $139BEE |
  DEC A                                     ; $139BF1 |
  AND #$0F0F                                ; $139BF2 |
  ORA $04                                   ; $139BF5 |
  STA $0E                                   ; $139BF7 |
  JSL $128719                               ; $139BF9 |
  LDA $7F8000,x                             ; $139BFD |
  AND #$FF00                                ; $139C01 |
  CMP #$9D00                                ; $139C04 |
  BNE CODE_139C5F                           ; $139C07 |
  LDA $1B                                   ; $139C09 |
  AND #$0F0F                                ; $139C0B |
  ORA #$00F0                                ; $139C0E |
  INC A                                     ; $139C11 |
  AND #$0F0F                                ; $139C12 |
  ORA $04                                   ; $139C15 |
  STA $0E                                   ; $139C17 |
  JSL $128719                               ; $139C19 |
  LDA $7F8000,x                             ; $139C1D |
  AND #$FF00                                ; $139C21 |
  CMP #$9D00                                ; $139C24 |
  BNE CODE_139C5F                           ; $139C27 |
  LDA $1B                                   ; $139C29 |
  STA $0E                                   ; $139C2B |
  JSL $128719                               ; $139C2D |
  LDA $7F8000,x                             ; $139C31 |
  AND #$FF00                                ; $139C35 |
  CMP #$9D00                                ; $139C38 |
  BNE CODE_139C5F                           ; $139C3B |
  LDA $7F8000,x                             ; $139C3D |
  AND #$00FF                                ; $139C41 |
  JSR CODE_139F64                           ; $139C44 |
  LDX $1D                                   ; $139C47 |
  LDA $7F8000,x                             ; $139C49 |
  AND #$FF00                                ; $139C4D |
  CMP #$9D00                                ; $139C50 |
  BNE CODE_139C5F                           ; $139C53 |
  LDA $7F8000,x                             ; $139C55 |
  AND #$00FF                                ; $139C59 |
  JSR CODE_139F64                           ; $139C5C |

CODE_139C5F:
  RTS                                       ; $139C5F |

  LDA $1B                                   ; $139C60 |
  STA $0E                                   ; $139C62 |
  JSL $128719                               ; $139C64 |
  STX $04                                   ; $139C68 |
  LDA $7F8000,x                             ; $139C6A |
  AND #$FF00                                ; $139C6E |
  CMP #$9D00                                ; $139C71 |
  BNE CODE_139CEC                           ; $139C74 |
  LDA $7F8000,x                             ; $139C76 |
  AND #$00FF                                ; $139C7A |
  STA $06                                   ; $139C7D |
  JSR CODE_13FD61                           ; $139C7F |
  STX $08                                   ; $139C82 |
  AND #$FF00                                ; $139C84 |
  CMP #$9D00                                ; $139C87 |
  BNE CODE_139CEC                           ; $139C8A |
  LDA $7F8000,x                             ; $139C8C |
  AND #$00FF                                ; $139C90 |
  STA $0A                                   ; $139C93 |
  LDA $1B                                   ; $139C95 |
  TAX                                       ; $139C97 |
  AND #$F0F0                                ; $139C98 |
  STA $00                                   ; $139C9B |
  TXA                                       ; $139C9D |
  AND #$0F0F                                ; $139C9E |
  ORA #$00F0                                ; $139CA1 |
  INC A                                     ; $139CA4 |
  AND #$0F0F                                ; $139CA5 |
  ORA $00                                   ; $139CA8 |
  STA $0E                                   ; $139CAA |
  JSL $128719                               ; $139CAC |
  LDA $7F8000,x                             ; $139CB0 |
  AND #$FF00                                ; $139CB4 |
  CMP #$9D00                                ; $139CB7 |
  BNE CODE_139CEC                           ; $139CBA |
  LDA $7F8000,x                             ; $139CBC |
  AND #$00FF                                ; $139CC0 |
  JSR CODE_139F64                           ; $139CC3 |
  LDX $04                                   ; $139CC6 |
  LDA $06                                   ; $139CC8 |
  JSR CODE_139F64                           ; $139CCA |
  LDX $08                                   ; $139CCD |
  LDA $0A                                   ; $139CCF |
  JSR CODE_139F64                           ; $139CD1 |
  LDX $1D                                   ; $139CD4 |
  LDA $7F8000,x                             ; $139CD6 |
  AND #$FF00                                ; $139CDA |
  CMP #$9D00                                ; $139CDD |
  BNE CODE_139CEC                           ; $139CE0 |
  LDA $7F8000,x                             ; $139CE2 |
  AND #$00FF                                ; $139CE6 |
  JSR CODE_139F64                           ; $139CE9 |

CODE_139CEC:
  RTS                                       ; $139CEC |

  LDA $1B                                   ; $139CED |
  TAX                                       ; $139CEF |
  AND #$F0F0                                ; $139CF0 |
  STA $08                                   ; $139CF3 |
  TXA                                       ; $139CF5 |
  AND #$0F0F                                ; $139CF6 |
  DEC A                                     ; $139CF9 |
  AND #$0F0F                                ; $139CFA |
  ORA $08                                   ; $139CFD |
  STA $0E                                   ; $139CFF |
  JSL $128719                               ; $139D01 |
  LDA $7F8000,x                             ; $139D05 |
  AND #$FF00                                ; $139D09 |
  CMP #$9D00                                ; $139D0C |
  BNE CODE_139D5B                           ; $139D0F |
  LDA $1B                                   ; $139D11 |
  AND #$0F0F                                ; $139D13 |
  DEC A                                     ; $139D16 |
  AND #$0F0F                                ; $139D17 |
  ORA $08                                   ; $139D1A |
  STA $0E                                   ; $139D1C |
  JSL $12875D                               ; $139D1E |
  LDA $7F8000,x                             ; $139D22 |
  AND #$FF00                                ; $139D26 |
  CMP #$9D00                                ; $139D29 |
  BNE CODE_139D5B                           ; $139D2C |
  JSR CODE_13FD54                           ; $139D2E |
  AND #$FF00                                ; $139D31 |
  CMP #$9D00                                ; $139D34 |
  BNE CODE_139D5B                           ; $139D37 |
  LDA $7F8000,x                             ; $139D39 |
  AND #$00FF                                ; $139D3D |
  JSR CODE_139F64                           ; $139D40 |
  LDX $1D                                   ; $139D43 |
  LDA $7F8000,x                             ; $139D45 |
  AND #$FF00                                ; $139D49 |
  CMP #$9D00                                ; $139D4C |
  BNE CODE_139D5B                           ; $139D4F |
  LDA $7F8000,x                             ; $139D51 |
  AND #$00FF                                ; $139D55 |
  JSR CODE_139F64                           ; $139D58 |

CODE_139D5B:
  RTS                                       ; $139D5B |

  RTS                                       ; $139D5C |

  LDA $1B                                   ; $139D5D |
  TAX                                       ; $139D5F |
  AND #$F0F0                                ; $139D60 |
  STA $08                                   ; $139D63 |
  TXA                                       ; $139D65 |
  AND #$0F0F                                ; $139D66 |
  ORA #$00F0                                ; $139D69 |
  INC A                                     ; $139D6C |
  AND #$0F0F                                ; $139D6D |
  ORA $08                                   ; $139D70 |
  STA $0E                                   ; $139D72 |
  JSL $128719                               ; $139D74 |
  LDA $7F8000,x                             ; $139D78 |
  AND #$FF00                                ; $139D7C |
  CMP #$9D00                                ; $139D7F |
  BNE CODE_139DD1                           ; $139D82 |
  LDA $1B                                   ; $139D84 |
  AND #$0F0F                                ; $139D86 |
  ORA #$00F0                                ; $139D89 |
  INC A                                     ; $139D8C |
  AND #$0F0F                                ; $139D8D |
  ORA $08                                   ; $139D90 |
  STA $0E                                   ; $139D92 |
  JSL $12875D                               ; $139D94 |
  LDA $7F8000,x                             ; $139D98 |
  AND #$FF00                                ; $139D9C |
  CMP #$9D00                                ; $139D9F |
  BNE CODE_139DD1                           ; $139DA2 |
  JSR CODE_13FD61                           ; $139DA4 |
  AND #$FF00                                ; $139DA7 |
  CMP #$9D00                                ; $139DAA |
  BNE CODE_139DD1                           ; $139DAD |
  LDA $7F8000,x                             ; $139DAF |
  AND #$00FF                                ; $139DB3 |
  JSR CODE_139F64                           ; $139DB6 |
  LDX $1D                                   ; $139DB9 |
  LDA $7F8000,x                             ; $139DBB |
  AND #$FF00                                ; $139DBF |
  CMP #$9D00                                ; $139DC2 |
  BNE CODE_139DD1                           ; $139DC5 |
  LDA $7F8000,x                             ; $139DC7 |
  AND #$00FF                                ; $139DCB |
  JSR CODE_139F64                           ; $139DCE |

CODE_139DD1:
  RTS                                       ; $139DD1 |

  LDA $1B                                   ; $139DD2 |
  STA $0E                                   ; $139DD4 |
  JSL $12875D                               ; $139DD6 |
  STX $04                                   ; $139DDA |
  LDA $7F8000,x                             ; $139DDC |
  AND #$FF00                                ; $139DE0 |
  CMP #$9D00                                ; $139DE3 |
  BNE CODE_139E5B                           ; $139DE6 |
  LDA $7F8000,x                             ; $139DE8 |
  AND #$00FF                                ; $139DEC |
  STA $06                                   ; $139DEF |
  JSR CODE_13FD54                           ; $139DF1 |
  STX $08                                   ; $139DF4 |
  AND #$FF00                                ; $139DF6 |
  CMP #$9D00                                ; $139DF9 |
  BNE CODE_139E5B                           ; $139DFC |
  LDA $7F8000,x                             ; $139DFE |
  AND #$00FF                                ; $139E02 |
  STA $0A                                   ; $139E05 |
  LDA $1B                                   ; $139E07 |
  TAX                                       ; $139E09 |
  AND #$F0F0                                ; $139E0A |
  STA $00                                   ; $139E0D |
  TXA                                       ; $139E0F |
  AND #$0F0F                                ; $139E10 |
  DEC A                                     ; $139E13 |
  AND #$0F0F                                ; $139E14 |
  ORA $00                                   ; $139E17 |
  STA $0E                                   ; $139E19 |
  JSL $12875D                               ; $139E1B |
  LDA $7F8000,x                             ; $139E1F |
  AND #$FF00                                ; $139E23 |
  CMP #$9D00                                ; $139E26 |
  BNE CODE_139E5B                           ; $139E29 |
  LDA $7F8000,x                             ; $139E2B |
  AND #$00FF                                ; $139E2F |
  JSR CODE_139F64                           ; $139E32 |
  LDX $04                                   ; $139E35 |
  LDA $06                                   ; $139E37 |
  JSR CODE_139F64                           ; $139E39 |
  LDX $08                                   ; $139E3C |
  LDA $0A                                   ; $139E3E |
  JSR CODE_139F64                           ; $139E40 |
  LDX $1D                                   ; $139E43 |
  LDA $7F8000,x                             ; $139E45 |
  AND #$FF00                                ; $139E49 |
  CMP #$9D00                                ; $139E4C |
  BNE CODE_139E5B                           ; $139E4F |
  LDA $7F8000,x                             ; $139E51 |
  AND #$00FF                                ; $139E55 |
  JSR CODE_139F64                           ; $139E58 |

CODE_139E5B:
  RTS                                       ; $139E5B |

  LDA $1B                                   ; $139E5C |
  TAX                                       ; $139E5E |
  AND #$F0F0                                ; $139E5F |
  STA $08                                   ; $139E62 |
  TXA                                       ; $139E64 |
  AND #$0F0F                                ; $139E65 |
  DEC A                                     ; $139E68 |
  AND #$0F0F                                ; $139E69 |
  ORA $08                                   ; $139E6C |
  STA $0E                                   ; $139E6E |
  JSL $12875D                               ; $139E70 |
  LDA $7F8000,x                             ; $139E74 |
  AND #$FF00                                ; $139E78 |
  CMP #$9D00                                ; $139E7B |
  BNE CODE_139ED6                           ; $139E7E |
  LDA $1B                                   ; $139E80 |
  AND #$0F0F                                ; $139E82 |
  ORA #$00F0                                ; $139E85 |
  INC A                                     ; $139E88 |
  AND #$0F0F                                ; $139E89 |
  ORA $08                                   ; $139E8C |
  STA $0E                                   ; $139E8E |
  JSL $12875D                               ; $139E90 |
  LDA $7F8000,x                             ; $139E94 |
  AND #$FF00                                ; $139E98 |
  CMP #$9D00                                ; $139E9B |
  BNE CODE_139ED6                           ; $139E9E |
  LDA $1B                                   ; $139EA0 |
  STA $0E                                   ; $139EA2 |
  JSL $12875D                               ; $139EA4 |
  LDA $7F8000,x                             ; $139EA8 |
  AND #$FF00                                ; $139EAC |
  CMP #$9D00                                ; $139EAF |
  BNE CODE_139ED6                           ; $139EB2 |
  LDA $7F8000,x                             ; $139EB4 |
  AND #$00FF                                ; $139EB8 |
  JSR CODE_139F64                           ; $139EBB |
  LDX $1D                                   ; $139EBE |
  LDA $7F8000,x                             ; $139EC0 |
  AND #$FF00                                ; $139EC4 |
  CMP #$9D00                                ; $139EC7 |
  BNE CODE_139ED6                           ; $139ECA |
  LDA $7F8000,x                             ; $139ECC |
  AND #$00FF                                ; $139ED0 |
  JSR CODE_139F64                           ; $139ED3 |

CODE_139ED6:
  RTS                                       ; $139ED6 |

  LDA $1B                                   ; $139ED7 |
  STA $0E                                   ; $139ED9 |
  JSL $12875D                               ; $139EDB |
  STX $04                                   ; $139EDF |
  LDA $7F8000,x                             ; $139EE1 |
  AND #$FF00                                ; $139EE5 |
  CMP #$9D00                                ; $139EE8 |
  BNE CODE_139F63                           ; $139EEB |
  LDA $7F8000,x                             ; $139EED |
  AND #$00FF                                ; $139EF1 |
  STA $06                                   ; $139EF4 |
  JSR CODE_13FD61                           ; $139EF6 |
  STX $08                                   ; $139EF9 |
  AND #$FF00                                ; $139EFB |
  CMP #$9D00                                ; $139EFE |
  BNE CODE_139F63                           ; $139F01 |
  LDA $7F8000,x                             ; $139F03 |
  AND #$00FF                                ; $139F07 |
  STA $0A                                   ; $139F0A |
  LDA $1B                                   ; $139F0C |
  TAX                                       ; $139F0E |
  AND #$F0F0                                ; $139F0F |
  STA $00                                   ; $139F12 |
  TXA                                       ; $139F14 |
  AND #$0F0F                                ; $139F15 |
  ORA #$00F0                                ; $139F18 |
  INC A                                     ; $139F1B |
  AND #$0F0F                                ; $139F1C |
  ORA $00                                   ; $139F1F |
  STA $0E                                   ; $139F21 |
  JSL $12875D                               ; $139F23 |
  LDA $7F8000,x                             ; $139F27 |
  AND #$FF00                                ; $139F2B |
  CMP #$9D00                                ; $139F2E |
  BNE CODE_139F63                           ; $139F31 |
  LDA $7F8000,x                             ; $139F33 |
  AND #$00FF                                ; $139F37 |
  JSR CODE_139F64                           ; $139F3A |
  LDX $04                                   ; $139F3D |
  LDA $06                                   ; $139F3F |
  JSR CODE_139F64                           ; $139F41 |
  LDX $08                                   ; $139F44 |
  LDA $0A                                   ; $139F46 |
  JSR CODE_139F64                           ; $139F48 |
  LDX $1D                                   ; $139F4B |
  LDA $7F8000,x                             ; $139F4D |
  AND #$FF00                                ; $139F51 |
  CMP #$9D00                                ; $139F54 |
  BNE CODE_139F63                           ; $139F57 |
  LDA $7F8000,x                             ; $139F59 |
  AND #$00FF                                ; $139F5D |
  JSR CODE_139F64                           ; $139F60 |

CODE_139F63:
  RTS                                       ; $139F63 |

CODE_139F64:
  TAY                                       ; $139F64 |
  LDA $9ACB,y                               ; $139F65 |
  AND #$00FF                                ; $139F68 |
  ORA #$9D00                                ; $139F6B |
  STA $7F8000,x                             ; $139F6E |
  RTS                                       ; $139F72 |

  dw $9D08, $9D09, $9D10, $9D11             ; $139F73 |

  dw $9B5B, $9C60, $9DD2, $9ED7             ; $139F7B |

  REP #$30                                  ; $139F83 |
  LDA $2C                                   ; $139F85 |
  AND #$0001                                ; $139F87 |
  ASL A                                     ; $139F8A |
  STA $00                                   ; $139F8B |
  LDA $28                                   ; $139F8D |
  AND #$0001                                ; $139F8F |
  ORA $00                                   ; $139F92 |
  ASL A                                     ; $139F94 |
  TAY                                       ; $139F95 |
  LDA $9F73,y                               ; $139F96 |
  LDX $1D                                   ; $139F99 |
  STA $7F8000,x                             ; $139F9B |
  TYX                                       ; $139F9F |
  JSR ($9F7B,x)                             ; $139FA0 |
  SEP #$30                                  ; $139FA3 |
  RTL                                       ; $139FA5 |

  dw $1DF4, $1DF0                           ; $139FA6 |

  REP #$30                                  ; $139FAA |
  LDA $28                                   ; $139FAC |
  BEQ CODE_139FC1                           ; $139FAE |
  LDA $2C                                   ; $139FB0 |
  BNE CODE_139FC1                           ; $139FB2 |
  DEC $2E                                   ; $139FB4 |
  DEC $2E                                   ; $139FB6 |
  BEQ CODE_139FBC                           ; $139FB8 |
  BPL CODE_139FC1                           ; $139FBA |

CODE_139FBC:
  LDA #$0001                                ; $139FBC |
  STA $2E                                   ; $139FBF |

CODE_139FC1:
  LDA $2E                                   ; $139FC1 |
  CLC                                       ; $139FC3 |
  SBC $2C                                   ; $139FC4 |
  BEQ CODE_139FD2                           ; $139FC6 |
  CMP #$0001                                ; $139FC8 |
  BEQ CODE_139FD2                           ; $139FCB |
  JSR CODE_13C15F                           ; $139FCD |
  BRA CODE_139FE0                           ; $139FD0 |

CODE_139FD2:
  ASL A                                     ; $139FD2 |
  TAY                                       ; $139FD3 |
  LDX $9FA6,y                               ; $139FD4 |
  LDA $0000,x                               ; $139FD7 |
  LDX $1D                                   ; $139FDA |
  STA $7F8000,x                             ; $139FDC |

CODE_139FE0:
  SEP #$30                                  ; $139FE0 |
  RTL                                       ; $139FE2 |

  dw $1DEC, $1DE8                           ; $139FE3 |

  REP #$30                                  ; $139FE7 |
  LDA $28                                   ; $139FE9 |
  BEQ CODE_139FF5                           ; $139FEB |
  LDA $2C                                   ; $139FED |
  BNE CODE_139FF5                           ; $139FEF |
  INC $2E                                   ; $139FF1 |
  INC $2E                                   ; $139FF3 |

CODE_139FF5:
  LDA $2E                                   ; $139FF5 |
  CLC                                       ; $139FF7 |
  SBC $2C                                   ; $139FF8 |
  BEQ CODE_13A006                           ; $139FFA |
  CMP #$0001                                ; $139FFC |
  BEQ CODE_13A006                           ; $139FFF |
  JSR CODE_13C15F                           ; $13A001 |
  BRA CODE_13A014                           ; $13A004 |

CODE_13A006:
  ASL A                                     ; $13A006 |
  TAY                                       ; $13A007 |
  LDX $9FE3,y                               ; $13A008 |
  LDA $0000,x                               ; $13A00B |
  LDX $1D                                   ; $13A00E |
  STA $7F8000,x                             ; $13A010 |

CODE_13A014:
  SEP #$30                                  ; $13A014 |
  RTL                                       ; $13A016 |

  dw $7D08, $9D32, $9D34, $79F1             ; $13A017 |
  dw $79F3, $79F5, $7D0A, $9D32             ; $13A01F |
  dw $9D36, $79A8, $79F3, $79A0             ; $13A027 |

  dw $0001, $FFFF                           ; $13A02F |

  REP #$30                                  ; $13A033 |
  LDX #$0000                                ; $13A035 |
  LDA $2E                                   ; $13A038 |
  BPL CODE_13A03E                           ; $13A03A |
  INX                                       ; $13A03C |
  INX                                       ; $13A03D |

CODE_13A03E:
  LDY #$0000                                ; $13A03E |
  LDA $2C                                   ; $13A041 |
  BEQ CODE_13A051                           ; $13A043 |
  INY                                       ; $13A045 |
  INY                                       ; $13A046 |
  CLC                                       ; $13A047 |
  ADC $A02F,x                               ; $13A048 |
  CMP $2E                                   ; $13A04B |
  BNE CODE_13A051                           ; $13A04D |
  INY                                       ; $13A04F |
  INY                                       ; $13A050 |

CODE_13A051:
  TXA                                       ; $13A051 |
  BNE CODE_13A062                           ; $13A052 |
  LDA $15                                   ; $13A054 |
  BNE CODE_13A05D                           ; $13A056 |
  LDA $A017,y                               ; $13A058 |
  BRA CODE_13A06E                           ; $13A05B |

CODE_13A05D:
  LDA $A01D,y                               ; $13A05D |
  BRA CODE_13A06E                           ; $13A060 |

CODE_13A062:
  LDA $15                                   ; $13A062 |
  BNE CODE_13A06B                           ; $13A064 |
  LDA $A023,y                               ; $13A066 |
  BRA CODE_13A06E                           ; $13A069 |

CODE_13A06B:
  LDA $A029,y                               ; $13A06B |

CODE_13A06E:
  CLC                                       ; $13A06E |
  ADC $28                                   ; $13A06F |
  LDX $1D                                   ; $13A071 |
  STA $7F8000,x                             ; $13A073 |
  SEP #$30                                  ; $13A077 |
  RTL                                       ; $13A079 |

  REP #$30                                  ; $13A07A |
  LDY #$0000                                ; $13A07C |
  LDA $2C                                   ; $13A07F |
  BEQ CODE_13A08C                           ; $13A081 |
  INY                                       ; $13A083 |
  INY                                       ; $13A084 |
  INC A                                     ; $13A085 |
  CMP $2E                                   ; $13A086 |
  BNE CODE_13A08C                           ; $13A088 |
  INY                                       ; $13A08A |
  INY                                       ; $13A08B |

CODE_13A08C:
  LDA $28                                   ; $13A08C |
  BEQ CODE_13A097                           ; $13A08E |
  INC A                                     ; $13A090 |
  CMP $2A                                   ; $13A091 |
  BNE CODE_13A0AE                           ; $13A093 |
  BRA CODE_13A0C0                           ; $13A095 |

CODE_13A097:
  LDA $12                                   ; $13A097 |
  CMP #$00A8                                ; $13A099 |
  BEQ CODE_13A0A3                           ; $13A09C |
  CMP #$00A9                                ; $13A09E |
  BNE CODE_13A0A9                           ; $13A0A1 |

CODE_13A0A3:
  INY                                       ; $13A0A3 |
  INY                                       ; $13A0A4 |
  INY                                       ; $13A0A5 |
  INY                                       ; $13A0A6 |
  INY                                       ; $13A0A7 |
  INY                                       ; $13A0A8 |

CODE_13A0A9:
  LDA $A0CC,y                               ; $13A0A9 |
  BRA CODE_13A0C3                           ; $13A0AC |

CODE_13A0AE:
  LDA $28                                   ; $13A0AE |
  EOR #$0001                                ; $13A0B0 |
  AND #$0001                                ; $13A0B3 |
  STA $00                                   ; $13A0B6 |
  LDA $A0D8,y                               ; $13A0B8 |
  CLC                                       ; $13A0BB |
  ADC $00                                   ; $13A0BC |
  BRA CODE_13A0C3                           ; $13A0BE |

CODE_13A0C0:
  LDA $A0DE,y                               ; $13A0C0 |

CODE_13A0C3:
  LDX $1D                                   ; $13A0C3 |
  STA $7F8000,x                             ; $13A0C5 |
  SEP #$30                                  ; $13A0C9 |
  RTL                                       ; $13A0CB |

  dw $00B5, $3C00, $00AB, $00A7             ; $13A0CC |
  dw $3C00, $00AB, $00A8, $3C01             ; $13A0D4 |
  dw $00B0, $00AA, $3C03, $00B2             ; $13A0DC |

  REP #$30                                  ; $13A0E4 |
  LDX $1D                                   ; $13A0E6 |
  LDA $12                                   ; $13A0E8 |
  CMP #$0092                                ; $13A0EA |
  BEQ CODE_13A0F9                           ; $13A0ED |
  CMP #$0093                                ; $13A0EF |
  BEQ CODE_13A0F9                           ; $13A0F2 |
  CMP #$00A6                                ; $13A0F4 |
  BNE CODE_13A0FE                           ; $13A0F7 |

CODE_13A0F9:
  LDA #$00A7                                ; $13A0F9 |
  BRA CODE_13A115                           ; $13A0FC |

CODE_13A0FE:
  LDY #$0000                                ; $13A0FE |
  LDA $2C                                   ; $13A101 |
  BEQ CODE_13A10E                           ; $13A103 |
  INY                                       ; $13A105 |
  INY                                       ; $13A106 |
  INC A                                     ; $13A107 |
  CMP $2E                                   ; $13A108 |
  BNE CODE_13A10E                           ; $13A10A |
  INY                                       ; $13A10C |
  INY                                       ; $13A10D |

CODE_13A10E:
  LDA $A11C,y                               ; $13A10E |
  TAY                                       ; $13A111 |
  LDA $0000,y                               ; $13A112 |

CODE_13A115:
  STA $7F8000,x                             ; $13A115 |
  SEP #$30                                  ; $13A119 |
  RTL                                       ; $13A11B |

  dw $A122, $A124, $1C74, $00B3             ; $13A11C |
  dw $00B4                                  ; $13A124 |

  REP #$30                                  ; $13A126 |
  LDA $15                                   ; $13A128 |
  AND #$0006                                ; $13A12A |
  TAY                                       ; $13A12D |
  LDA $2C                                   ; $13A12E |
  BEQ CODE_13A134                           ; $13A130 |
  INY                                       ; $13A132 |
  INY                                       ; $13A133 |

CODE_13A134:
  LDA $12                                   ; $13A134 |
  BEQ CODE_13A13A                           ; $13A136 |
  INY                                       ; $13A138 |
  INY                                       ; $13A139 |

CODE_13A13A:
  LDX $1D                                   ; $13A13A |
  LDA $A146,y                               ; $13A13C |
  STA $7F8000,x                             ; $13A13F |
  SEP #$30                                  ; $13A143 |
  RTL                                       ; $13A145 |

  dw $0114, $2904, $2906, $0115             ; $13A146 |
  dw $2905, $2907                           ; $13A14E |

  dw $A1D3, $A272                           ; $13A152 |

  REP #$30                                  ; $13A156 |
  LDX $1D                                   ; $13A158 |
  LDA $2A                                   ; $13A15A |
  ORA $2E                                   ; $13A15C |
  DEC A                                     ; $13A15E |
  BNE CODE_13A173                           ; $13A15F |
  LDA #$0156                                ; $13A161 |
  STA $7F8000,x                             ; $13A164 |
  JSR CODE_13A1D3                           ; $13A168 |
  JSR CODE_13A20A                           ; $13A16B |
  JSR CODE_13A333                           ; $13A16E |
  BRA CODE_13A1A6                           ; $13A171 |

CODE_13A173:
  LDY #$0000                                ; $13A173 |
  LDA $28                                   ; $13A176 |
  BEQ CODE_13A183                           ; $13A178 |
  INY                                       ; $13A17A |
  INY                                       ; $13A17B |
  INC A                                     ; $13A17C |
  CMP $2A                                   ; $13A17D |
  BNE CODE_13A183                           ; $13A17F |
  INY                                       ; $13A181 |
  INY                                       ; $13A182 |

CODE_13A183:
  LDA $A1A9,y                               ; $13A183 |
  STA $7F8000,x                             ; $13A186 |
  LDX #$0000                                ; $13A18A |
  LDA $28                                   ; $13A18D |
  BEQ CODE_13A198                           ; $13A18F |
  INX                                       ; $13A191 |
  INX                                       ; $13A192 |
  INC A                                     ; $13A193 |
  CMP $2A                                   ; $13A194 |
  BEQ CODE_13A19D                           ; $13A196 |

CODE_13A198:
  JSR ($A152,x)                             ; $13A198 |
  BRA CODE_13A1A6                           ; $13A19B |

CODE_13A19D:
  JSR CODE_13A20A                           ; $13A19D |
  JSR CODE_13A272                           ; $13A1A0 |
  JSR CODE_13A333                           ; $13A1A3 |

CODE_13A1A6:
  SEP #$30                                  ; $13A1A6 |
  RTL                                       ; $13A1A8 |

  dw $0153, $0154, $0155, $00C2             ; $13A1A9 |
  dw $00C3, $00C4, $00C5, $00C6             ; $13A1B1 |
  dw $00C7, $150D, $150E, $00D1             ; $13A1B9 |
  dw $00C3, $00C3, $00D5, $00D5             ; $13A1C1 |
  dw $00C6, $00C6, $151B, $151B             ; $13A1C9 |
  dw $00C3                                  ; $13A1D1 |

CODE_13A1D3:
  LDA $1B                                   ; $13A1D3 |
  STA $0E                                   ; $13A1D5 |
  JSL $12875D                               ; $13A1D7 |
  LDA $7F8000,x                             ; $13A1DB |
  LDY #$0000                                ; $13A1DF |

CODE_13A1E2:
  CMP $A1AF,y                               ; $13A1E2 |
  BEQ CODE_13A1F0                           ; $13A1E5 |
  INY                                       ; $13A1E7 |
  INY                                       ; $13A1E8 |
  CPY #$0012                                ; $13A1E9 |
  BCC CODE_13A1E2                           ; $13A1EC |
  BRA CODE_13A1F7                           ; $13A1EE |

CODE_13A1F0:
  LDA $A1C1,y                               ; $13A1F0 |
  STA $7F8000,x                             ; $13A1F3 |

CODE_13A1F7:
  RTS                                       ; $13A1F7 |

  dw $00C4, $00D5, $00C4, $00C5             ; $13A1F8 |
  dw $00D5, $00C5, $151B, $151B             ; $13A200 |
  dw $00C4                                  ; $13A208 |

CODE_13A20A:
  JSR CODE_13FD61                           ; $13A20A |
  LDY #$0000                                ; $13A20D |

CODE_13A210:
  CMP $A1AF,y                               ; $13A210 |
  BEQ CODE_13A21E                           ; $13A213 |
  INY                                       ; $13A215 |
  INY                                       ; $13A216 |
  CPY #$0012                                ; $13A217 |
  BCC CODE_13A210                           ; $13A21A |
  BRA CODE_13A225                           ; $13A21C |

CODE_13A21E:
  LDA $A1F8,y                               ; $13A21E |
  STA $7F8000,x                             ; $13A221 |

CODE_13A225:
  RTS                                       ; $13A225 |

  dw $00BE, $00BF, $00C0, $00C1             ; $13A226 |
  dw $00C2, $00C3, $00C4, $00C5             ; $13A22E |
  dw $00C6, $00C7, $00C9, $00CA             ; $13A236 |
  dw $00CB, $00CC, $00D6, $00D7             ; $13A23E |
  dw $150D, $150E, $00D1, $77DE             ; $13A246 |
  dw $77DF, $77E0, $77E1, $00C6             ; $13A24E |
  dw $00C6, $00D5, $00D5, $00C6             ; $13A256 |
  dw $00C6, $77DA, $77DB, $77DC             ; $13A25E |
  dw $77DD, $77D8, $77D9, $151A             ; $13A266 |
  dw $151A, $00C6                           ; $13A26E |

CODE_13A272:
  LDA $1B                                   ; $13A272 |
  STA $0E                                   ; $13A274 |
  JSL $12875D                               ; $13A276 |
  LDA $7F8000,x                             ; $13A27A |
  LDY #$0000                                ; $13A27E |

CODE_13A281:
  CMP $A226,y                               ; $13A281 |
  BEQ CODE_13A28F                           ; $13A284 |
  INY                                       ; $13A286 |
  INY                                       ; $13A287 |
  CPY #$0026                                ; $13A288 |
  BCC CODE_13A281                           ; $13A28B |
  BRA CODE_13A296                           ; $13A28D |

CODE_13A28F:
  LDA $A24C,y                               ; $13A28F |
  STA $7F8000,x                             ; $13A292 |

CODE_13A296:
  RTS                                       ; $13A296 |

  dw $0084, $0085, $0086, $0087             ; $13A297 |
  dw $0088, $0089, $008A, $008B             ; $13A29F |
  dw $008C, $008D, $77E7, $77E9             ; $13A2A7 |
  dw $77E8, $77E6, $00C5, $00D5             ; $13A2AF |
  dw $00C5, $00C5, $00D5, $00C6             ; $13A2B7 |
  dw $77E5, $77E3, $77E2, $77E4             ; $13A2BF |
  dw $77D8, $77D9, $151B, $151B             ; $13A2C7 |
  dw $00C5                                  ; $13A2CF |

CODE_13A2D1:
  JSR CODE_13FD61                           ; $13A2D1 |
  LDY #$0000                                ; $13A2D4 |

CODE_13A2D7:
  CMP $A226,y                               ; $13A2D7 |
  BEQ CODE_13A319                           ; $13A2DA |
  INY                                       ; $13A2DC |
  INY                                       ; $13A2DD |
  CPY #$0026                                ; $13A2DE |
  BCC CODE_13A2D7                           ; $13A2E1 |
  CMP #$002E                                ; $13A2E3 |
  BNE CODE_13A2ED                           ; $13A2E6 |
  LDA #$002F                                ; $13A2E8 |
  BRA CODE_13A31C                           ; $13A2EB |

CODE_13A2ED:
  CMP $A271,y                               ; $13A2ED |
  BEQ CODE_13A2FB                           ; $13A2F0 |
  INY                                       ; $13A2F2 |
  INY                                       ; $13A2F3 |
  CPY #$003A                                ; $13A2F4 |
  BCC CODE_13A2ED                           ; $13A2F7 |
  BRA CODE_13A320                           ; $13A2F9 |

CODE_13A2FB:
  CPY #$0030                                ; $13A2FB |
  BCS CODE_13A320                           ; $13A2FE |
  LDA $2C                                   ; $13A300 |
  CMP #$0001                                ; $13A302 |
  BNE CODE_13A314                           ; $13A305 |
  JSL $128875                               ; $13A307 |
  AND #$0006                                ; $13A30B |
  TAY                                       ; $13A30E |
  LDA $A297,y                               ; $13A30F |
  BRA CODE_13A31C                           ; $13A312 |

CODE_13A314:
  LDA #$0031                                ; $13A314 |
  BRA CODE_13A31C                           ; $13A317 |

CODE_13A319:
  LDA $A2AB,y                               ; $13A319 |

CODE_13A31C:
  STA $7F8000,x                             ; $13A31C |

CODE_13A320:
  RTS                                       ; $13A320 |

  dw $00C7, $00C6, $00C5, $00C5             ; $13A321 |
  dw $00C6, $00C7, $151B, $151B             ; $13A329 |
  dw $00C7                                  ; $13A331 |

CODE_13A333:
  LDA $1B                                   ; $13A333 |
  PHA                                       ; $13A335 |
  ORA #$00F0                                ; $13A336 |
  INC A                                     ; $13A339 |
  AND #$0F0F                                ; $13A33A |
  STA $0E                                   ; $13A33D |
  PLA                                       ; $13A33F |
  AND #$F0F0                                ; $13A340 |
  ORA $0E                                   ; $13A343 |
  STA $0E                                   ; $13A345 |
  JSL $12875D                               ; $13A347 |
  LDA $7F8000,x                             ; $13A34B |
  LDY #$0000                                ; $13A34F |

CODE_13A352:
  CMP $A1AF,y                               ; $13A352 |
  BEQ CODE_13A360                           ; $13A355 |
  INY                                       ; $13A357 |
  INY                                       ; $13A358 |
  CPY #$0012                                ; $13A359 |
  BCC CODE_13A352                           ; $13A35C |
  BRA CODE_13A367                           ; $13A35E |

CODE_13A360:
  LDA $A321,y                               ; $13A360 |
  STA $7F8000,x                             ; $13A363 |

CODE_13A367:
  RTS                                       ; $13A367 |

  dw $00B6, $00B8, $00BA, $00B9             ; $13A368 |
  dw $00B6                                  ; $13A370 |

  REP #$30                                  ; $13A372 |
  LDA $12                                   ; $13A374 |
  AND #$FF00                                ; $13A376 |
  CMP #$7E00                                ; $13A379 |
  BEQ CODE_13A39C                           ; $13A37C |
  LDA $2E                                   ; $13A37E |
  SEC                                       ; $13A380 |
  SBC $2C                                   ; $13A381 |
  CMP #$0004                                ; $13A383 |
  BCC CODE_13A394                           ; $13A386 |
  LDA $2C                                   ; $13A388 |
  AND #$0001                                ; $13A38A |
  ASL A                                     ; $13A38D |
  TAY                                       ; $13A38E |
  LDA $A368,y                               ; $13A38F |
  BRA CODE_13A399                           ; $13A392 |

CODE_13A394:
  ASL A                                     ; $13A394 |
  TAY                                       ; $13A395 |
  LDA $A36A,y                               ; $13A396 |

CODE_13A399:
  JMP CODE_13A3CE                           ; $13A399 |

CODE_13A39C:
  SEP #$30                                  ; $13A39C |
  RTL                                       ; $13A39E |

  dw $00B6, $00B7, $00B8                    ; $13A39F |
  dw $7794, $7795, $7796, $7794, $7794      ; $13A3A5 |

  REP #$30                                  ; $13A3AF |
  LDA $12                                   ; $13A3B1 |
  AND #$FF00                                ; $13A3B3 |
  CMP #$7E00                                ; $13A3B6 |
  BEQ CODE_13A40B                           ; $13A3B9 |
  LDY #$0000                                ; $13A3BB |
  LDA $2C                                   ; $13A3BE |
  BEQ CODE_13A3CB                           ; $13A3C0 |
  INY                                       ; $13A3C2 |
  INY                                       ; $13A3C3 |
  INC A                                     ; $13A3C4 |
  CMP $2E                                   ; $13A3C5 |
  BNE CODE_13A3CB                           ; $13A3C7 |
  INY                                       ; $13A3C9 |
  INY                                       ; $13A3CA |

CODE_13A3CB:
  LDA $A39F,y                               ; $13A3CB |

CODE_13A3CE:
  LDX $1D                                   ; $13A3CE |
  STA $7F8000,x                             ; $13A3D0 |
  SEC                                       ; $13A3D4 |
  SBC #$00B6                                ; $13A3D5 |
  ASL A                                     ; $13A3D8 |
  TAY                                       ; $13A3D9 |
  LDA $12                                   ; $13A3DA |
  CMP #$0032                                ; $13A3DC |
  BEQ CODE_13A3EB                           ; $13A3DF |
  CMP #$0084                                ; $13A3E1 |
  BCC CODE_13A3F2                           ; $13A3E4 |
  CMP #$008E                                ; $13A3E6 |
  BCS CODE_13A3F2                           ; $13A3E9 |

CODE_13A3EB:
  LDA $A3A5,y                               ; $13A3EB |
  STA $7F8000,x                             ; $13A3EE |

CODE_13A3F2:
  LDA $2C                                   ; $13A3F2 |
  BNE CODE_13A3FB                           ; $13A3F4 |
  JSR CODE_13A20A                           ; $13A3F6 |
  BRA CODE_13A40B                           ; $13A3F9 |

CODE_13A3FB:
  JSR CODE_13A2D1                           ; $13A3FB |
  LDA $2C                                   ; $13A3FE |
  INC A                                     ; $13A400 |
  CMP $2E                                   ; $13A401 |
  BNE CODE_13A40B                           ; $13A403 |
  JSR CODE_13A1D3                           ; $13A405 |
  JSR CODE_13A333                           ; $13A408 |

CODE_13A40B:
  SEP #$30                                  ; $13A40B |
  RTL                                       ; $13A40D |

  dw $A443, $A45B                           ; $13A40E |

  REP #$30                                  ; $13A412 |
  LDX $1D                                   ; $13A414 |
  LDA #$00C2                                ; $13A416 |
  STA $7F8000,x                             ; $13A419 |
  LDX #$0000                                ; $13A41D |
  LDA $28                                   ; $13A420 |
  BEQ CODE_13A42B                           ; $13A422 |
  INC A                                     ; $13A424 |
  CMP $2A                                   ; $13A425 |
  BNE CODE_13A439                           ; $13A427 |
  INX                                       ; $13A429 |
  INX                                       ; $13A42A |

CODE_13A42B:
  LDA $1B                                   ; $13A42B |
  STA $0E                                   ; $13A42D |
  JSR ($A40E,x)                             ; $13A42F |
  LDA $28                                   ; $13A432 |
  BNE CODE_13A439                           ; $13A434 |
  JSR CODE_13A47E                           ; $13A436 |

CODE_13A439:
  LDA $2C                                   ; $13A439 |
  BNE CODE_13A440                           ; $13A43B |
  JSR CODE_13A4F8                           ; $13A43D |

CODE_13A440:
  SEP #$30                                  ; $13A440 |
  RTL                                       ; $13A442 |

  JSL $1287A1                               ; $13A443 |
  LDA $7F8000,x                             ; $13A447 |
  CMP #$015A                                ; $13A44B |
  BEQ CODE_13A468                           ; $13A44E |
  LDA $28                                   ; $13A450 |
  INC A                                     ; $13A452 |
  CMP $2A                                   ; $13A453 |
  BNE CODE_13A477                           ; $13A455 |
  LDA $1B                                   ; $13A457 |
  STA $0E                                   ; $13A459 |
  JSL $1287E2                               ; $13A45B |
  LDA $7F8000,x                             ; $13A45F |
  CMP #$015B                                ; $13A463 |
  BNE CODE_13A477                           ; $13A466 |

CODE_13A468:
  SEC                                       ; $13A468 |
  SBC #$015A                                ; $13A469 |
  EOR #$0001                                ; $13A46C |
  CLC                                       ; $13A46F |
  ADC #$0151                                ; $13A470 |
  STA $7F8000,x                             ; $13A473 |

CODE_13A477:
  RTS                                       ; $13A477 |

  dw $00C4, $00C5, $00C7                    ; $13A478 |

CODE_13A47E:
  JSR CODE_13FD54                           ; $13A47E |
  CMP #$0151                                ; $13A481 |
  BEQ CODE_13A4AB                           ; $13A484 |
  CMP #$0152                                ; $13A486 |
  BEQ CODE_13A4AB                           ; $13A489 |
  CMP #$0153                                ; $13A48B |
  BCC CODE_13A495                           ; $13A48E |
  CMP #$0161                                ; $13A490 |
  BCC CODE_13A4AB                           ; $13A493 |

CODE_13A495:
  LDA $1B                                   ; $13A495 |
  STA $0E                                   ; $13A497 |
  JSL $128719                               ; $13A499 |
  LDA $7F8000,x                             ; $13A49D |
  CMP #$00C5                                ; $13A4A1 |
  BNE CODE_13A4EF                           ; $13A4A4 |
  LDY #$0004                                ; $13A4A6 |
  BRA CODE_13A4E6                           ; $13A4A9 |

CODE_13A4AB:
  LDY #$0000                                ; $13A4AB |
  LDA $1B                                   ; $13A4AE |
  STA $0E                                   ; $13A4B0 |
  JSL $128719                               ; $13A4B2 |
  LDA $7F8000,x                             ; $13A4B6 |
  CMP #$0151                                ; $13A4BA |
  BEQ CODE_13A4DF                           ; $13A4BD |
  CMP #$0152                                ; $13A4BF |
  BEQ CODE_13A4DF                           ; $13A4C2 |
  CMP #$0153                                ; $13A4C4 |
  BCC CODE_13A4CE                           ; $13A4C7 |
  CMP #$0161                                ; $13A4C9 |
  BCC CODE_13A4DF                           ; $13A4CC |

CODE_13A4CE:
  CMP #$00C2                                ; $13A4CE |
  BEQ CODE_13A4E6                           ; $13A4D1 |
  CMP #$77E6                                ; $13A4D3 |
  BEQ CODE_13A4E6                           ; $13A4D6 |
  CMP #$77E7                                ; $13A4D8 |
  BEQ CODE_13A4E6                           ; $13A4DB |
  BRA CODE_13A4E4                           ; $13A4DD |

CODE_13A4DF:
  LDA #$00D5                                ; $13A4DF |
  BRA CODE_13A4E9                           ; $13A4E2 |

CODE_13A4E4:
  INY                                       ; $13A4E4 |
  INY                                       ; $13A4E5 |

CODE_13A4E6:
  LDA $A478,y                               ; $13A4E6 |

CODE_13A4E9:
  LDX $1D                                   ; $13A4E9 |
  STA $7F8000,x                             ; $13A4EB |

CODE_13A4EF:
  RTS                                       ; $13A4EF |

  dw $00C3, $00C6, $00C6, $00C7             ; $13A4F0 |

CODE_13A4F8:
  LDA $1B                                   ; $13A4F8 |
  STA $0E                                   ; $13A4FA |
  JSL $128719                               ; $13A4FC |
  LDA $7F8000,x                             ; $13A500 |
  CMP #$0151                                ; $13A504 |
  BEQ CODE_13A521                           ; $13A507 |
  CMP #$0152                                ; $13A509 |
  BEQ CODE_13A521                           ; $13A50C |
  CMP #$0153                                ; $13A50E |
  BCC CODE_13A518                           ; $13A511 |
  CMP #$0161                                ; $13A513 |
  BCC CODE_13A521                           ; $13A516 |

CODE_13A518:
  LDA $A1                                   ; $13A518 |
  BEQ CODE_13A552                           ; $13A51A |
  TAY                                       ; $13A51C |
  STZ $A1                                   ; $13A51D |
  BRA CODE_13A530                           ; $13A51F |

CODE_13A521:
  LDY #$0002                                ; $13A521 |
  LDA $A1                                   ; $13A524 |
  BNE CODE_13A530                           ; $13A526 |
  LDA #$0006                                ; $13A528 |
  STA $A1                                   ; $13A52B |
  LDY #$0000                                ; $13A52D |

CODE_13A530:
  LDX $1D                                   ; $13A530 |
  TYA                                       ; $13A532 |
  BNE CODE_13A549                           ; $13A533 |
  LDA $7F8000,x                             ; $13A535 |
  CMP #$00D5                                ; $13A539 |
  BEQ CODE_13A552                           ; $13A53C |
  JSR CODE_13FD54                           ; $13A53E |
  CMP #$00C6                                ; $13A541 |
  BNE CODE_13A549                           ; $13A544 |
  LDY #$0002                                ; $13A546 |

CODE_13A549:
  LDX $1D                                   ; $13A549 |
  LDA $A4F0,y                               ; $13A54B |
  STA $7F8000,x                             ; $13A54E |

CODE_13A552:
  RTS                                       ; $13A552 |

  REP #$30                                  ; $13A553 |
  LDA #$0001                                ; $13A555 |
  STA $9B                                   ; $13A558 |
  LDX $1D                                   ; $13A55A |
  LDA $15                                   ; $13A55C |
  AND #$0002                                ; $13A55E |
  ASL A                                     ; $13A561 |
  STA $00                                   ; $13A562 |
  LDA $2C                                   ; $13A564 |
  AND #$0001                                ; $13A566 |
  ASL A                                     ; $13A569 |
  ORA $00                                   ; $13A56A |
  TAY                                       ; $13A56C |
  BNE CODE_13A585                           ; $13A56D |
  LDA $12                                   ; $13A56F |
  CMP #$00D6                                ; $13A571 |
  BEQ CODE_13A58C                           ; $13A574 |
  CMP #$00D7                                ; $13A576 |
  BEQ CODE_13A58C                           ; $13A579 |
  CMP #$77D8                                ; $13A57B |
  BEQ CODE_13A58C                           ; $13A57E |
  CMP #$77D9                                ; $13A580 |
  BEQ CODE_13A58C                           ; $13A583 |

CODE_13A585:
  LDA $A5AE,y                               ; $13A585 |
  STA $7F8000,x                             ; $13A588 |

CODE_13A58C:
  LDA $2C                                   ; $13A58C |
  BEQ CODE_13A598                           ; $13A58E |
  DEC A                                     ; $13A590 |
  BNE CODE_13A5A6                           ; $13A591 |
  JSR CODE_13A612                           ; $13A593 |
  BRA CODE_13A59B                           ; $13A596 |

CODE_13A598:
  JSR CODE_13A5BE                           ; $13A598 |

CODE_13A59B:
  TAX                                       ; $13A59B |
  BEQ CODE_13A5A6                           ; $13A59C |
  LDX $1D                                   ; $13A59E |
  STA $7F8000,x                             ; $13A5A0 |
  BRA CODE_13A5AB                           ; $13A5A4 |

CODE_13A5A6:
  JSR CODE_13A47E                           ; $13A5A6 |
  BRA CODE_13A5AB                           ; $13A5A9 |

CODE_13A5AB:
  SEP #$30                                  ; $13A5AB |
  RTL                                       ; $13A5AD |

  dw $00C1, $00C0, $00BE, $00BF             ; $13A5AE |

  dw $77E1, $77E6, $77DE, $77E7             ; $13A5B6 |

CODE_13A5BE:
  LDY #$0000                                ; $13A5BE |
  LDA $1B                                   ; $13A5C1 |
  STA $0E                                   ; $13A5C3 |
  JSL $128719                               ; $13A5C5 |
  LDA $7F8000,x                             ; $13A5C9 |
  CMP #$015A                                ; $13A5CD |
  BEQ CODE_13A5FF                           ; $13A5D0 |
  CMP #$015B                                ; $13A5D2 |
  BEQ CODE_13A5FF                           ; $13A5D5 |
  CMP #$0151                                ; $13A5D7 |
  BEQ CODE_13A5FF                           ; $13A5DA |
  CMP #$0152                                ; $13A5DC |
  BEQ CODE_13A5FF                           ; $13A5DF |
  INY                                       ; $13A5E1 |
  INY                                       ; $13A5E2 |
  JSR CODE_13FD54                           ; $13A5E3 |
  CMP #$015A                                ; $13A5E6 |
  BEQ CODE_13A5FF                           ; $13A5E9 |
  CMP #$015B                                ; $13A5EB |
  BEQ CODE_13A5FF                           ; $13A5EE |
  CMP #$0151                                ; $13A5F0 |
  BEQ CODE_13A5FF                           ; $13A5F3 |
  CMP #$0152                                ; $13A5F5 |
  BEQ CODE_13A5FF                           ; $13A5F8 |
  LDA #$0000                                ; $13A5FA |
  BRA CODE_13A60D                           ; $13A5FD |

CODE_13A5FF:
  LDA $15                                   ; $13A5FF |
  AND #$0002                                ; $13A601 |
  BEQ CODE_13A60A                           ; $13A604 |
  INY                                       ; $13A606 |
  INY                                       ; $13A607 |
  INY                                       ; $13A608 |
  INY                                       ; $13A609 |

CODE_13A60A:
  LDA $A5B6,y                               ; $13A60A |

CODE_13A60D:
  RTS                                       ; $13A60D |

  dw $77E8, $77E9                           ; $13A60E |

CODE_13A612:
  JSR CODE_13FD54                           ; $13A612 |
  CMP #$015A                                ; $13A615 |
  BEQ CODE_13A62E                           ; $13A618 |
  CMP #$015B                                ; $13A61A |
  BEQ CODE_13A62E                           ; $13A61D |
  CMP #$0151                                ; $13A61F |
  BEQ CODE_13A62E                           ; $13A622 |
  CMP #$0152                                ; $13A624 |
  BEQ CODE_13A62E                           ; $13A627 |
  LDA #$0000                                ; $13A629 |
  BRA CODE_13A637                           ; $13A62C |

CODE_13A62E:
  LDA $15                                   ; $13A62E |
  AND #$0002                                ; $13A630 |
  TAY                                       ; $13A633 |
  LDA $A60E,y                               ; $13A634 |

CODE_13A637:
  RTS                                       ; $13A637 |

  dw $0084, $0085, $0085, $0086             ; $13A638 |
  dw $0084, $0086, $0087, $0088             ; $13A640 |

  dw $A6DE, $A701                           ; $13A648 |

  REP #$30                                  ; $13A64C |
  LDA $2C                                   ; $13A64E |
  BNE CODE_13A69A                           ; $13A650 |
  LDA $1B                                   ; $13A652 |
  STA $0E                                   ; $13A654 |
  JSL $128719                               ; $13A656 |
  LDA #$0005                                ; $13A65A |
  STA $00                                   ; $13A65D |
  LDY #$0000                                ; $13A65F |
  LDA $7F8000,x                             ; $13A662 |
  CMP #$00C2                                ; $13A666 |
  BEQ CODE_13A677                           ; $13A669 |
  INY                                       ; $13A66B |
  CMP #$00C5                                ; $13A66C |
  BEQ CODE_13A677                           ; $13A66F |
  INY                                       ; $13A671 |
  CMP #$00C4                                ; $13A672 |
  BNE CODE_13A68A                           ; $13A675 |

CODE_13A677:
  TYA                                       ; $13A677 |
  CLC                                       ; $13A678 |
  ADC #$002E                                ; $13A679 |
  STA $7F8000,x                             ; $13A67C |
  STZ $00                                   ; $13A680 |
  TYA                                       ; $13A682 |
  BEQ CODE_13A68A                           ; $13A683 |
  LDA #$0031                                ; $13A685 |
  BRA CODE_13A6A3                           ; $13A688 |

CODE_13A68A:
  JSL $128875                               ; $13A68A |
  AND #$000E                                ; $13A68E |
  TAY                                       ; $13A691 |
  LDA $A638,y                               ; $13A692 |
  CLC                                       ; $13A695 |
  ADC $00                                   ; $13A696 |
  BRA CODE_13A6A3                           ; $13A698 |

CODE_13A69A:
  LDA $28                                   ; $13A69A |
  AND #$0001                                ; $13A69C |
  CLC                                       ; $13A69F |
  ADC #$7E00                                ; $13A6A0 |

CODE_13A6A3:
  LDX $1D                                   ; $13A6A3 |
  STA $7F8000,x                             ; $13A6A5 |
  LDX #$0000                                ; $13A6A9 |
  LDA $28                                   ; $13A6AC |
  BEQ CODE_13A6B7                           ; $13A6AE |
  INX                                       ; $13A6B0 |
  INX                                       ; $13A6B1 |
  INC A                                     ; $13A6B2 |
  CMP $2A                                   ; $13A6B3 |
  BNE CODE_13A6C1                           ; $13A6B5 |

CODE_13A6B7:
  LDA $1B                                   ; $13A6B7 |
  STA $0E                                   ; $13A6B9 |
  LDY #$0000                                ; $13A6BB |
  JSR ($A648,x)                             ; $13A6BE |

CODE_13A6C1:
  LDA $2C                                   ; $13A6C1 |
  INC A                                     ; $13A6C3 |
  CMP $2E                                   ; $13A6C4 |
  BNE CODE_13A6CB                           ; $13A6C6 |
  JSR CODE_13A724                           ; $13A6C8 |

CODE_13A6CB:
  SEP #$30                                  ; $13A6CB |
  RTL                                       ; $13A6CD |

  dw $01A3, $01A1, $01A3, $01A3             ; $13A6CE |
  dw $015A, $015B, $0151, $0152             ; $13A6D6 |

  JSL $1287A1                               ; $13A6DE |
  LDA $7F8000,x                             ; $13A6E2 |

CODE_13A6E6:
  CMP $A6D6,y                               ; $13A6E6 |
  BEQ CODE_13A6F4                           ; $13A6E9 |
  INY                                       ; $13A6EB |
  INY                                       ; $13A6EC |
  CPY #$0008                                ; $13A6ED |
  BCC CODE_13A6E6                           ; $13A6F0 |
  BRA CODE_13A748                           ; $13A6F2 |

CODE_13A6F4:
  LDA $A6CE,y                               ; $13A6F4 |
  BRA CODE_13A744                           ; $13A6F7 |

  dw $01A2, $01A4, $01A4, $01A4             ; $13A6F9 |

  JSL $1287E2                               ; $13A701 |
  LDA $7F8000,x                             ; $13A705 |

CODE_13A709:
  CMP $A6D6,y                               ; $13A709 |
  BEQ CODE_13A717                           ; $13A70C |
  INY                                       ; $13A70E |
  INY                                       ; $13A70F |
  CPY #$0008                                ; $13A710 |
  BCC CODE_13A709                           ; $13A713 |
  BRA CODE_13A748                           ; $13A715 |

CODE_13A717:
  LDA $A6F9,y                               ; $13A717 |
  BRA CODE_13A744                           ; $13A71A |

  dw $01A5, $01A6, $01A5, $01A6             ; $13A71C |

CODE_13A724:
  LDA $1B                                   ; $13A724 |
  STA $0E                                   ; $13A726 |
  JSL $12875D                               ; $13A728 |
  LDY #$0000                                ; $13A72C |
  LDA $7F8000,x                             ; $13A72F |

CODE_13A733:
  CMP $A6D6,y                               ; $13A733 |
  BEQ CODE_13A741                           ; $13A736 |
  INY                                       ; $13A738 |
  INY                                       ; $13A739 |
  CPY #$0008                                ; $13A73A |
  BCC CODE_13A733                           ; $13A73D |
  BRA CODE_13A748                           ; $13A73F |

CODE_13A741:
  LDA $A71C,y                               ; $13A741 |

CODE_13A744:
  STA $7F8000,x                             ; $13A744 |

CODE_13A748:
  RTS                                       ; $13A748 |

  dw $015A, $015B, $0151                    ; $13A749 |

  dw $A79A, $A7BC                           ; $13A74F |

  REP #$30                                  ; $13A753 |
  LDY #$0004                                ; $13A755 |
  LDA $2A                                   ; $13A758 |
  DEC A                                     ; $13A75A |
  BEQ CODE_13A767                           ; $13A75B |
  JSR CODE_13A887                           ; $13A75D |
  LDA $1B                                   ; $13A760 |
  STA $0E                                   ; $13A762 |
  JSR ($A74F,x)                             ; $13A764 |

CODE_13A767:
  LDA $28                                   ; $13A767 |
  INC A                                     ; $13A769 |
  CMP $2A                                   ; $13A76A |
  BNE CODE_13A778                           ; $13A76C |
  CPY #$0004                                ; $13A76E |
  BNE CODE_13A778                           ; $13A771 |
  LDA #$0152                                ; $13A773 |
  BRA CODE_13A77B                           ; $13A776 |

CODE_13A778:
  LDA $A749,y                               ; $13A778 |

CODE_13A77B:
  LDX $1D                                   ; $13A77B |
  STA $7F8000,x                             ; $13A77D |
  LDA $28                                   ; $13A781 |
  BEQ CODE_13A791                           ; $13A783 |
  INC A                                     ; $13A785 |
  CMP $2A                                   ; $13A786 |
  BNE CODE_13A794                           ; $13A788 |
  DEY                                       ; $13A78A |
  DEY                                       ; $13A78B |
  JSR CODE_13A8AB                           ; $13A78C |
  BRA CODE_13A794                           ; $13A78F |

CODE_13A791:
  JSR CODE_13A7E0                           ; $13A791 |

CODE_13A794:
  JSR CODE_13A8DD                           ; $13A794 |
  JMP CODE_13A833                           ; $13A797 |
  LDA $28                                   ; $13A79A |
  INC A                                     ; $13A79C |
  CMP $2A                                   ; $13A79D |
  BNE CODE_13A7D9                           ; $13A79F |
  JSL $1287E2                               ; $13A7A1 |
  LDA $7F8000,x                             ; $13A7A5 |
  CMP $A74B                                 ; $13A7A9 |
  BEQ CODE_13A7D9                           ; $13A7AC |
  CMP $A74D                                 ; $13A7AE |
  BNE CODE_13A7D6                           ; $13A7B1 |
  LDA $A74B                                 ; $13A7B3 |
  STA $7F8000,x                             ; $13A7B6 |
  BRA CODE_13A7D9                           ; $13A7BA |
  LDA $28                                   ; $13A7BC |
  BNE CODE_13A7D9                           ; $13A7BE |
  JSL $1287A1                               ; $13A7C0 |
  LDA $7F8000,x                             ; $13A7C4 |
  CMP $A80F                                 ; $13A7C8 |
  BNE CODE_13A7D6                           ; $13A7CB |
  LDA $A749                                 ; $13A7CD |
  STA $7F8000,x                             ; $13A7D0 |
  BRA CODE_13A7D9                           ; $13A7D4 |

CODE_13A7D6:
  LDY #$0004                                ; $13A7D6 |

CODE_13A7D9:
  RTS                                       ; $13A7D9 |

  dw $01A2, $01A4, $01A4                    ; $13A7DA |

CODE_13A7E0:
  JSR CODE_13FD54                           ; $13A7E0 |
  CMP #$002E                                ; $13A7E3 |
  BCC CODE_13A80A                           ; $13A7E6 |
  CMP #$0033                                ; $13A7E8 |
  BCC CODE_13A801                           ; $13A7EB |
  CMP #$0084                                ; $13A7ED |
  BCC CODE_13A80A                           ; $13A7F0 |
  CMP #$008E                                ; $13A7F2 |
  BCC CODE_13A801                           ; $13A7F5 |
  CMP #$7E00                                ; $13A7F7 |
  BEQ CODE_13A801                           ; $13A7FA |
  CMP #$7E01                                ; $13A7FC |
  BNE CODE_13A80A                           ; $13A7FF |

CODE_13A801:
  LDX $1D                                   ; $13A801 |
  LDA $A7DA,y                               ; $13A803 |
  STA $7F8000,x                             ; $13A806 |

CODE_13A80A:
  RTS                                       ; $13A80A |

  dw $015B, $015A, $0152                    ; $13A80B |

  REP #$30                                  ; $13A811 |
  LDY #$0004                                ; $13A813 |
  LDA $2A                                   ; $13A816 |
  DEC A                                     ; $13A818 |
  BEQ CODE_13A824                           ; $13A819 |
  JSR CODE_13A887                           ; $13A81B |
  TXA                                       ; $13A81E |
  BEQ CODE_13A824                           ; $13A81F |
  JSR CODE_13A866                           ; $13A821 |

CODE_13A824:
  LDX $1D                                   ; $13A824 |
  LDA $A80B,y                               ; $13A826 |
  STA $7F8000,x                             ; $13A829 |
  JSR CODE_13A8AB                           ; $13A82D |
  JSR CODE_13A8DD                           ; $13A830 |

CODE_13A833:
  LDA $2C                                   ; $13A833 |
  INC A                                     ; $13A835 |
  CMP $2E                                   ; $13A836 |
  BNE CODE_13A846                           ; $13A838 |
  LDA $28                                   ; $13A83A |
  BNE CODE_13A843                           ; $13A83C |
  JSR CODE_13A1D3                           ; $13A83E |
  BRA CODE_13A846                           ; $13A841 |

CODE_13A843:
  JSR CODE_13A272                           ; $13A843 |

CODE_13A846:
  LDA $28                                   ; $13A846 |
  INC A                                     ; $13A848 |
  CMP $2A                                   ; $13A849 |
  BNE CODE_13A863                           ; $13A84B |
  LDA $2C                                   ; $13A84D |
  BNE CODE_13A856                           ; $13A84F |
  JSR CODE_13A20A                           ; $13A851 |
  BRA CODE_13A859                           ; $13A854 |

CODE_13A856:
  JSR CODE_13A2D1                           ; $13A856 |

CODE_13A859:
  LDA $2C                                   ; $13A859 |
  INC A                                     ; $13A85B |
  CMP $2E                                   ; $13A85C |
  BNE CODE_13A863                           ; $13A85E |
  JSR CODE_13A333                           ; $13A860 |

CODE_13A863:
  SEP #$30                                  ; $13A863 |
  RTL                                       ; $13A865 |

CODE_13A866:
  LDA $28                                   ; $13A866 |
  INC A                                     ; $13A868 |
  CMP $2A                                   ; $13A869 |
  BNE CODE_13A886                           ; $13A86B |
  JSR CODE_13FD61                           ; $13A86D |
  CMP $A80B                                 ; $13A870 |
  BEQ CODE_13A886                           ; $13A873 |
  CMP $A80F                                 ; $13A875 |
  BNE CODE_13A883                           ; $13A878 |
  LDA $A80B                                 ; $13A87A |
  STA $7F8000,x                             ; $13A87D |
  BRA CODE_13A886                           ; $13A881 |

CODE_13A883:
  LDY #$0004                                ; $13A883 |

CODE_13A886:
  RTS                                       ; $13A886 |

CODE_13A887:
  LDA $1B                                   ; $13A887 |
  CLC                                       ; $13A889 |
  ADC $28                                   ; $13A88A |
  AND #$0001                                ; $13A88C |
  STA $00                                   ; $13A88F |
  LDA $1B                                   ; $13A891 |
  AND #$0010                                ; $13A893 |
  LSR A                                     ; $13A896 |
  LSR A                                     ; $13A897 |
  LSR A                                     ; $13A898 |
  LSR A                                     ; $13A899 |
  ADC $2C                                   ; $13A89A |
  AND #$0001                                ; $13A89C |
  EOR $00                                   ; $13A89F |
  ASL A                                     ; $13A8A1 |
  TAX                                       ; $13A8A2 |
  TXY                                       ; $13A8A3 |
  RTS                                       ; $13A8A4 |

  dw $01A1, $01A3, $01A3                    ; $13A8A5 |

CODE_13A8AB:
  LDA $28                                   ; $13A8AB |
  INC A                                     ; $13A8AD |
  CMP $2A                                   ; $13A8AE |
  BNE CODE_13A8DC                           ; $13A8B0 |
  JSR CODE_13FD61                           ; $13A8B2 |
  CMP #$002E                                ; $13A8B5 |
  BCC CODE_13A8DC                           ; $13A8B8 |
  CMP #$0033                                ; $13A8BA |
  BCC CODE_13A8D3                           ; $13A8BD |
  CMP #$0084                                ; $13A8BF |
  BCC CODE_13A8DC                           ; $13A8C2 |
  CMP #$008E                                ; $13A8C4 |
  BCC CODE_13A8D3                           ; $13A8C7 |
  CMP #$7E00                                ; $13A8C9 |
  BEQ CODE_13A8D3                           ; $13A8CC |
  CMP #$7E01                                ; $13A8CE |
  BNE CODE_13A8DC                           ; $13A8D1 |

CODE_13A8D3:
  LDX $1D                                   ; $13A8D3 |
  LDA $A8A5,y                               ; $13A8D5 |
  STA $7F8000,x                             ; $13A8D8 |

CODE_13A8DC:
  RTS                                       ; $13A8DC |

CODE_13A8DD:
  LDA $2C                                   ; $13A8DD |
  BNE CODE_13A90C                           ; $13A8DF |
  LDA $1B                                   ; $13A8E1 |
  STA $0E                                   ; $13A8E3 |
  JSL $128719                               ; $13A8E5 |
  LDY #$0000                                ; $13A8E9 |
  LDA $7F8000,x                             ; $13A8EC |
  CMP #$7E00                                ; $13A8F0 |
  BEQ CODE_13A8FA                           ; $13A8F3 |
  CMP #$7E01                                ; $13A8F5 |
  BNE CODE_13A90C                           ; $13A8F8 |

CODE_13A8FA:
  LDX $1D                                   ; $13A8FA |
  LDA $7F8000,x                             ; $13A8FC |
  SEC                                       ; $13A900 |
  SBC #$015A                                ; $13A901 |
  CLC                                       ; $13A904 |
  ADC #$01A5                                ; $13A905 |
  STA $7F8000,x                             ; $13A908 |

CODE_13A90C:
  RTS                                       ; $13A90C |

  REP #$30                                  ; $13A90D |
  LDX $1D                                   ; $13A90F |
  LDY #$0000                                ; $13A911 |
  LDA $2C                                   ; $13A914 |
  BEQ CODE_13A91A                           ; $13A916 |
  INY                                       ; $13A918 |
  INY                                       ; $13A919 |

CODE_13A91A:
  LDA $28                                   ; $13A91A |
  ASL A                                     ; $13A91C |
  ASL A                                     ; $13A91D |
  STA $00                                   ; $13A91E |
  TYA                                       ; $13A920 |
  ORA $00                                   ; $13A921 |
  TAY                                       ; $13A923 |
  LDA $15                                   ; $13A924 |
  AND #$0002                                ; $13A926 |
  ASL A                                     ; $13A929 |
  ASL A                                     ; $13A92A |
  STA $00                                   ; $13A92B |
  TYA                                       ; $13A92D |
  ORA $00                                   ; $13A92E |
  TAY                                       ; $13A930 |
  LDA $A93B,y                               ; $13A931 |
  STA $7F8000,x                             ; $13A934 |
  SEP #$30                                  ; $13A938 |
  RTL                                       ; $13A93A |

  dw $00C8, $00CE, $00CD, $00CF             ; $13A93B |
  dw $00D3, $00D3, $00D4, $00D4             ; $13A943 |

  REP #$30                                  ; $13A94B |
  LDX $1D                                   ; $13A94D |
  LDA $28                                   ; $13A94F |
  ASL A                                     ; $13A951 |
  STA $0E                                   ; $13A952 |
  LDA $15                                   ; $13A954 |
  AND #$0007                                ; $13A956 |
  DEC A                                     ; $13A959 |
  DEC A                                     ; $13A95A |
  DEC A                                     ; $13A95B |
  ASL A                                     ; $13A95C |
  TAY                                       ; $13A95D |
  LDA $0E                                   ; $13A95E |
  CLC                                       ; $13A960 |
  ADC $A984,y                               ; $13A961 |
  TAY                                       ; $13A964 |
  LDA $2C                                   ; $13A965 |
  BEQ CODE_13A970                           ; $13A967 |
  INC A                                     ; $13A969 |
  CMP $2E                                   ; $13A96A |
  BNE CODE_13A975                           ; $13A96C |
  BRA CODE_13A97A                           ; $13A96E |

CODE_13A970:
  LDA $A98A,y                               ; $13A970 |
  BRA CODE_13A97D                           ; $13A973 |

CODE_13A975:
  LDA $A9AE,y                               ; $13A975 |
  BRA CODE_13A97D                           ; $13A978 |

CODE_13A97A:
  LDA $A9D2,y                               ; $13A97A |

CODE_13A97D:
  STA $7F8000,x                             ; $13A97D |
  SEP #$30                                  ; $13A981 |
  RTL                                       ; $13A983 |

  dw $0000, $0008, $0014, $0174             ; $13A984 |
  dw $0175, $0175, $0178, $0174             ; $13A98C |
  dw $0175, $0175, $0175, $0176             ; $13A994 |
  dw $0178, $0174, $0175, $0175             ; $13A99C |
  dw $0175, $0175, $0175, $0177             ; $13A9A4 |
  dw $0178, $0179, $017A, $017A             ; $13A9AC |
  dw $017D, $0179, $017A, $017A             ; $13A9B4 |
  dw $017A, $017B, $017D, $0179             ; $13A9BC |
  dw $017A, $017A, $017A, $017A             ; $13A9C4 |
  dw $017A, $017C, $017D, $017E             ; $13A9CC |
  dw $017F, $017F, $0182, $017E             ; $13A9D4 |
  dw $017F, $017F, $017F, $0180             ; $13A9DC |
  dw $0182, $017E, $017F, $017F             ; $13A9E4 |
  dw $017F, $017F, $017F, $0181             ; $13A9EC |
  dw $0182                                  ; $13A9F4 |

  REP #$30                                  ; $13A9F6 |
  LDY #$0000                                ; $13A9F8 |
  LDA $12                                   ; $13A9FB |
  AND #$FF00                                ; $13A9FD |
  CMP $1A62                                 ; $13AA00 |
  BEQ CODE_13AA24                           ; $13AA03 |
  LDA $12                                   ; $13AA05 |
  CMP #$0000                                ; $13AA07 |
  BEQ CODE_13AA24                           ; $13AA0A |
  CMP #$00C2                                ; $13AA0C |
  BEQ CODE_13AA24                           ; $13AA0F |
  INY                                       ; $13AA11 |
  INY                                       ; $13AA12 |

CODE_13AA13:
  LDX $AC3D,y                               ; $13AA13 |
  CMP $0000,x                               ; $13AA16 |
  BEQ CODE_13AA24                           ; $13AA19 |
  INY                                       ; $13AA1B |
  INY                                       ; $13AA1C |
  CPY #$003E                                ; $13AA1D |
  BCC CODE_13AA13                           ; $13AA20 |
  BRA CODE_13AA51                           ; $13AA22 |

CODE_13AA24:
  LDA $2A                                   ; $13AA24 |
  DEC A                                     ; $13AA26 |
  BNE CODE_13AA30                           ; $13AA27 |
  LDA $2E                                   ; $13AA29 |
  DEC A                                     ; $13AA2B |
  BEQ CODE_13AA3A                           ; $13AA2C |
  BRA CODE_13AA40                           ; $13AA2E |

CODE_13AA30:
  LDA $2E                                   ; $13AA30 |
  DEC A                                     ; $13AA32 |
  BEQ CODE_13AA45                           ; $13AA33 |
  JSR CODE_13AAF0                           ; $13AA35 |
  BRA CODE_13AA48                           ; $13AA38 |

CODE_13AA3A:
  LDA $AC7B,y                               ; $13AA3A |
  TAY                                       ; $13AA3D |
  BRA CODE_13AA48                           ; $13AA3E |

CODE_13AA40:
  JSR CODE_13AA54                           ; $13AA40 |
  BRA CODE_13AA48                           ; $13AA43 |

CODE_13AA45:
  JSR CODE_13AAA2                           ; $13AA45 |

CODE_13AA48:
  LDX $1D                                   ; $13AA48 |
  LDA $0000,y                               ; $13AA4A |
  STA $7F8000,x                             ; $13AA4D |

CODE_13AA51:
  SEP #$30                                  ; $13AA51 |
  RTL                                       ; $13AA53 |

CODE_13AA54:
  LDA $2C                                   ; $13AA54 |
  BEQ CODE_13AA74                           ; $13AA56 |
  INC A                                     ; $13AA58 |
  CMP $2E                                   ; $13AA59 |
  BEQ CODE_13AA8B                           ; $13AA5B |
  JSR CODE_13AC04                           ; $13AA5D |
  BIT #$0001                                ; $13AA60 |
  BEQ CODE_13AA6F                           ; $13AA63 |
  JSR CODE_13AC15                           ; $13AA65 |
  LDA $00                                   ; $13AA68 |
  ASL A                                     ; $13AA6A |
  TAX                                       ; $13AA6B |
  JMP ($B06B,x)                             ; $13AA6C |

CODE_13AA6F:
  LDA $ACF7,y                               ; $13AA6F |
  BRA CODE_13AAA0                           ; $13AA72 |

CODE_13AA74:
  JSR CODE_13AC04                           ; $13AA74 |
  BIT #$0001                                ; $13AA77 |
  BEQ CODE_13AA86                           ; $13AA7A |
  JSR CODE_13AC15                           ; $13AA7C |
  LDA $00                                   ; $13AA7F |
  ASL A                                     ; $13AA81 |
  TAX                                       ; $13AA82 |
  JMP ($B053,x)                             ; $13AA83 |

CODE_13AA86:
  LDA $ACB9,y                               ; $13AA86 |
  BRA CODE_13AAA0                           ; $13AA89 |

CODE_13AA8B:
  JSR CODE_13AC04                           ; $13AA8B |
  BIT #$0001                                ; $13AA8E |
  BEQ CODE_13AA9D                           ; $13AA91 |
  JSR CODE_13AC15                           ; $13AA93 |
  LDA $00                                   ; $13AA96 |
  ASL A                                     ; $13AA98 |
  TAX                                       ; $13AA99 |
  JMP ($B077,x)                             ; $13AA9A |

CODE_13AA9D:
  LDA $AD35,y                               ; $13AA9D |

CODE_13AAA0:
  TAY                                       ; $13AAA0 |
  RTS                                       ; $13AAA1 |

CODE_13AAA2:
  LDA $28                                   ; $13AAA2 |
  BEQ CODE_13AAC2                           ; $13AAA4 |
  INC A                                     ; $13AAA6 |
  CMP $2A                                   ; $13AAA7 |
  BEQ CODE_13AAD9                           ; $13AAA9 |
  JSR CODE_13AC04                           ; $13AAAB |
  BIT #$0001                                ; $13AAAE |
  BEQ CODE_13AABD                           ; $13AAB1 |
  JSR CODE_13AC15                           ; $13AAB3 |
  LDA $00                                   ; $13AAB6 |
  ASL A                                     ; $13AAB8 |
  TAX                                       ; $13AAB9 |
  JMP ($B0B3,x)                             ; $13AABA |

CODE_13AABD:
  LDA $ADB1,y                               ; $13AABD |
  BRA CODE_13AAEE                           ; $13AAC0 |

CODE_13AAC2:
  JSR CODE_13AC04                           ; $13AAC2 |
  BIT #$0001                                ; $13AAC5 |
  BEQ CODE_13AAD4                           ; $13AAC8 |
  JSR CODE_13AC15                           ; $13AACA |
  LDA $00                                   ; $13AACD |
  ASL A                                     ; $13AACF |
  TAX                                       ; $13AAD0 |
  JMP ($B095,x)                             ; $13AAD1 |

CODE_13AAD4:
  LDA $AD73,y                               ; $13AAD4 |
  BRA CODE_13AAEE                           ; $13AAD7 |

CODE_13AAD9:
  JSR CODE_13AC04                           ; $13AAD9 |
  BIT #$0001                                ; $13AADC |
  BEQ CODE_13AAEB                           ; $13AADF |
  JSR CODE_13AC15                           ; $13AAE1 |
  LDA $00                                   ; $13AAE4 |
  ASL A                                     ; $13AAE6 |
  TAX                                       ; $13AAE7 |
  JMP ($B0B9,x)                             ; $13AAE8 |

CODE_13AAEB:
  LDA $ADEF,y                               ; $13AAEB |

CODE_13AAEE:
  TAY                                       ; $13AAEE |
  RTS                                       ; $13AAEF |

CODE_13AAF0:
  LDA $28                                   ; $13AAF0 |
  BNE CODE_13AAFF                           ; $13AAF2 |
  LDA $2C                                   ; $13AAF4 |
  BEQ CODE_13AB24                           ; $13AAF6 |
  INC A                                     ; $13AAF8 |
  CMP $2E                                   ; $13AAF9 |
  BNE CODE_13AB3E                           ; $13AAFB |
  BRA CODE_13AB54                           ; $13AAFD |

CODE_13AAFF:
  LDA $28                                   ; $13AAFF |
  INC A                                     ; $13AB01 |
  CMP $2A                                   ; $13AB02 |
  BEQ CODE_13AB12                           ; $13AB04 |
  LDA $2C                                   ; $13AB06 |
  BEQ CODE_13AB6E                           ; $13AB08 |
  INC A                                     ; $13AB0A |
  CMP $2E                                   ; $13AB0B |
  BNE CODE_13AB84                           ; $13AB0D |
  JMP CODE_13ABA5                           ; $13AB0F |

CODE_13AB12:
  LDA $2C                                   ; $13AB12 |
  BNE CODE_13AB19                           ; $13AB14 |
  JMP CODE_13ABBB                           ; $13AB16 |

CODE_13AB19:
  INC A                                     ; $13AB19 |
  CMP $2E                                   ; $13AB1A |
  BEQ CODE_13AB21                           ; $13AB1C |
  JMP CODE_13ABD5                           ; $13AB1E |

CODE_13AB21:
  JMP CODE_13ABEB                           ; $13AB21 |

CODE_13AB24:
  REP #$20                                  ; $13AB24 |
  JSR CODE_13AC04                           ; $13AB26 |
  BIT #$0001                                ; $13AB29 |
  BEQ CODE_13AB38                           ; $13AB2C |
  JSR CODE_13AC15                           ; $13AB2E |
  LDA $00                                   ; $13AB31 |
  ASL A                                     ; $13AB33 |
  TAX                                       ; $13AB34 |
  JMP ($B0C9,x)                             ; $13AB35 |

CODE_13AB38:
  LDA $AE2D,y                               ; $13AB38 |
  JMP CODE_13AC02                           ; $13AB3B |

CODE_13AB3E:
  REP #$20                                  ; $13AB3E |
  JSR CODE_13AC04                           ; $13AB40 |
  BIT #$0001                                ; $13AB43 |
  BEQ CODE_13AB4E                           ; $13AB46 |
  JSR CODE_13AC15                           ; $13AB48 |
  JMP CODE_13AB9F                           ; $13AB4B |

CODE_13AB4E:
  LDA $AE6B,y                               ; $13AB4E |
  JMP CODE_13AC02                           ; $13AB51 |

CODE_13AB54:
  REP #$20                                  ; $13AB54 |
  JSR CODE_13AC04                           ; $13AB56 |
  BIT #$0001                                ; $13AB59 |
  BEQ CODE_13AB68                           ; $13AB5C |
  JSR CODE_13AC15                           ; $13AB5E |
  LDA $00                                   ; $13AB61 |
  ASL A                                     ; $13AB63 |
  TAX                                       ; $13AB64 |
  JMP ($B0E7,x)                             ; $13AB65 |

CODE_13AB68:
  LDA $AEA9,y                               ; $13AB68 |
  JMP CODE_13AC02                           ; $13AB6B |

CODE_13AB6E:
  REP #$20                                  ; $13AB6E |
  JSR CODE_13AC04                           ; $13AB70 |
  BIT #$0001                                ; $13AB73 |
  BEQ CODE_13AB7E                           ; $13AB76 |
  JSR CODE_13AC15                           ; $13AB78 |
  JMP CODE_13AB9F                           ; $13AB7B |

CODE_13AB7E:
  LDA $AEE7,y                               ; $13AB7E |
  JMP CODE_13AC02                           ; $13AB81 |

CODE_13AB84:
  REP #$20                                  ; $13AB84 |
  TYA                                       ; $13AB86 |
  BNE CODE_13AB9F                           ; $13AB87 |
  LDA $12                                   ; $13AB89 |
  AND #$FF00                                ; $13AB8B |
  CMP $1A62                                 ; $13AB8E |
  BNE CODE_13AB9F                           ; $13AB91 |
  LDA $12                                   ; $13AB93 |
  AND #$00FF                                ; $13AB95 |
  CMP #$0010                                ; $13AB98 |
  BCC CODE_13AB9F                           ; $13AB9B |
  INY                                       ; $13AB9D |
  INY                                       ; $13AB9E |

CODE_13AB9F:
  LDA $AF25,y                               ; $13AB9F |
  JMP CODE_13AC02                           ; $13ABA2 |

CODE_13ABA5:
  REP #$20                                  ; $13ABA5 |
  JSR CODE_13AC04                           ; $13ABA7 |
  BIT #$0001                                ; $13ABAA |
  BEQ CODE_13ABB5                           ; $13ABAD |
  JSR CODE_13AC15                           ; $13ABAF |
  JMP CODE_13AB9F                           ; $13ABB2 |

CODE_13ABB5:
  LDA $AF63,y                               ; $13ABB5 |
  JMP CODE_13AC02                           ; $13ABB8 |

CODE_13ABBB:
  REP #$20                                  ; $13ABBB |
  JSR CODE_13AC04                           ; $13ABBD |
  BIT #$0001                                ; $13ABC0 |
  BEQ CODE_13ABCF                           ; $13ABC3 |
  JSR CODE_13AC15                           ; $13ABC5 |
  LDA $00                                   ; $13ABC8 |
  ASL A                                     ; $13ABCA |
  TAX                                       ; $13ABCB |
  JMP ($B101,x)                             ; $13ABCC |

CODE_13ABCF:
  LDA $AFA1,y                               ; $13ABCF |
  JMP CODE_13AC02                           ; $13ABD2 |

CODE_13ABD5:
  REP #$20                                  ; $13ABD5 |
  JSR CODE_13AC04                           ; $13ABD7 |
  BIT #$0001                                ; $13ABDA |
  BEQ CODE_13ABE5                           ; $13ABDD |
  JSR CODE_13AC15                           ; $13ABDF |
  JMP CODE_13AB9F                           ; $13ABE2 |

CODE_13ABE5:
  LDA $AFDF,y                               ; $13ABE5 |
  JMP CODE_13AC02                           ; $13ABE8 |

CODE_13ABEB:
  REP #$20                                  ; $13ABEB |
  JSR CODE_13AC04                           ; $13ABED |
  BIT #$0001                                ; $13ABF0 |
  BEQ CODE_13ABFF                           ; $13ABF3 |
  JSR CODE_13AC15                           ; $13ABF5 |
  LDA $00                                   ; $13ABF8 |
  ASL A                                     ; $13ABFA |
  TAX                                       ; $13ABFB |
  JMP ($B11F,x)                             ; $13ABFC |

CODE_13ABFF:
  LDA $B01D,y                               ; $13ABFF |

CODE_13AC02:
  TAY                                       ; $13AC02 |
  RTS                                       ; $13AC03 |

CODE_13AC04:
  STZ $00                                   ; $13AC04 |
  LDA $12                                   ; $13AC06 |
  AND #$FF00                                ; $13AC08 |
  CMP $1A62                                 ; $13AC0B |
  BNE CODE_13AC12                           ; $13AC0E |
  INC $00                                   ; $13AC10 |

CODE_13AC12:
  LDA $00                                   ; $13AC12 |
  RTS                                       ; $13AC14 |

CODE_13AC15:
  LDA $12                                   ; $13AC15 |
  LDY #$0000                                ; $13AC17 |

CODE_13AC1A:
  LDX $AC7B,y                               ; $13AC1A |
  CMP $0000,x                               ; $13AC1D |
  BEQ CODE_13AC29                           ; $13AC20 |
  INY                                       ; $13AC22 |
  INY                                       ; $13AC23 |
  CPY #$03E0                                ; $13AC24 |
  BCC CODE_13AC1A                           ; $13AC27 |

CODE_13AC29:
  LDX $1D                                   ; $13AC29 |
  STZ $00                                   ; $13AC2B |

CODE_13AC2D:
  TYA                                       ; $13AC2D |
  CMP #$003E                                ; $13AC2E |
  BCC CODE_13AC3C                           ; $13AC31 |
  SEC                                       ; $13AC33 |
  SBC #$003E                                ; $13AC34 |
  TAY                                       ; $13AC37 |
  INC $00                                   ; $13AC38 |
  BRA CODE_13AC2D                           ; $13AC3A |

CODE_13AC3C:
  RTS                                       ; $13AC3C |

  dw $0000, $1C04, $1BF8, $1BF2             ; $13AC3D |
  dw $1BFA, $1BE0, $1BF4, $1BE4             ; $13AC45 |
  dw $1BF6, $1BE6, $1BFC, $1BEC             ; $13AC4D |
  dw $1BFE, $1BEA, $1C00, $1BE8             ; $13AC55 |
  dw $1C02, $1C1A, $1BE2, $1C18             ; $13AC5D |
  dw $1BF0, $1BEE, $1C5C, $1C5E             ; $13AC65 |
  dw $1C2E, $1C30, $1C32, $1C34             ; $13AC6D |
  dw $1C36, $1C38, $1C3A, $1A80             ; $13AC75 |
  dw $1AA0, $1AAC, $1B80, $1AC4             ; $13AC7D |
  dw $1AB4, $1AE0, $1B9C, $1AF8             ; $13AC85 |
  dw $1AD0, $1B04, $1B8C, $1B0C             ; $13AC8D |
  dw $1BA4, $1B14, $1BBC, $1B1C             ; $13AC95 |
  dw $1B24, $1BAC, $1B30, $1B58             ; $13AC9D |
  dw $1AE8, $1B6C, $1B6C, $1B6A             ; $13ACA5 |
  dw $1AFC, $1BC8, $1BD0, $1BD4             ; $13ACAD |
  dw $1BD8, $1BDC, $1A7A, $1A9A             ; $13ACB5 |
  dw $1AA4, $1B78, $1ABC, $1AB2             ; $13ACBD |
  dw $1ADE, $1B9A, $1A7A, $1A7A             ; $13ACC5 |
  dw $1B00, $1B88, $1B08, $1BA0             ; $13ACCD |
  dw $1A7A, $1A7A, $1A7A, $1A7A             ; $13ACD5 |
  dw $1A7A, $1B3C, $1B50, $1A7A             ; $13ACDD |
  dw $1B6E, $1B6E, $1B66, $1AFA             ; $13ACE5 |
  dw $1BC0, $1BCE, $1BD2, $1BD6             ; $13ACED |
  dw $1BDA, $1A7C, $1A9C, $1AAA             ; $13ACF5 |
  dw $1B7E, $1AC2, $1AB6, $1A7C             ; $13ACFD |
  dw $1A7C, $1A7C, $1A7C, $1A7C             ; $13AD05 |
  dw $1A7C, $1A7C, $1A7C, $1A7C             ; $13AD0D |
  dw $1A7C, $1A7C, $1A7C, $1A7C             ; $13AD15 |
  dw $1BDE, $1B56, $1A7C, $1B6C             ; $13AD1D |
  dw $1B6C, $1B66, $1AFA, $1BC6             ; $13AD25 |
  dw $1BD0, $1BD4, $1BD6, $1BDA             ; $13AD2D |
  dw $1A7E, $1A9E, $1AB0, $1B84             ; $13AD35 |
  dw $1AC8, $1AB8, $1A7E, $1A7E             ; $13AD3D |
  dw $1AF6, $1A7E, $1A7E, $1A7E             ; $13AD45 |
  dw $1A7E, $1A7E, $1B10, $1BB8             ; $13AD4D |
  dw $1B18, $1B2C, $1BB4, $1B3A             ; $13AD55 |
  dw $1B5C, $1AE4, $1B6C, $1B6C             ; $13AD5D |
  dw $1B66, $1AFA, $1BD8, $1BCE             ; $13AD65 |
  dw $1BD2, $1BD6, $1BDA, $1A74             ; $13AD6D |
  dw $1A94, $1AA6, $1B7A, $1A74             ; $13AD75 |
  dw $1A74, $1AD8, $1B94, $1AF0             ; $13AD7D |
  dw $1ACA, $1B02, $1B8A, $1A74             ; $13AD85 |
  dw $1A74, $1B12, $1BBA, $1A74             ; $13AD8D |
  dw $1B20, $1BA8, $1A74, $1A74             ; $13AD95 |
  dw $1A74, $1B70, $1B70, $1B68             ; $13AD9D |
  dw $1AFC, $1BC2, $1BCE, $1BD2             ; $13ADA5 |
  dw $1BD6, $1BDA, $1A76, $1A96             ; $13ADAD |
  dw $1A76, $1A76, $1A76, $1A76             ; $13ADB5 |
  dw $1ADA, $1B96, $1AF2, $1ACC             ; $13ADBD |
  dw $1A76, $1A76, $1A76, $1A76             ; $13ADC5 |
  dw $1A76, $1A76, $1A76, $1B2A             ; $13ADCD |
  dw $1BB2, $1A76, $1A76, $1A76             ; $13ADD5 |
  dw $1B72, $1B72, $1B68, $1AFC             ; $13ADDD |
  dw $1BC2, $1BCE, $1BD2, $1BD6             ; $13ADE5 |
  dw $1BDA, $1A78, $1A98, $1A78             ; $13ADED |
  dw $1A78, $1ABE, $1A78, $1A78             ; $13ADF5 |
  dw $1A78, $1A78, $1ACE, $1A78             ; $13ADFD |
  dw $1A78, $1B0A, $1BA2, $1A78             ; $13AE05 |
  dw $1A78, $1B1A, $1B22, $1BAA             ; $13AE0D |
  dw $1A78, $1B52, $1AE6, $1B74             ; $13AE15 |
  dw $1B74, $1B68, $1AFC, $1BC2             ; $13AE1D |
  dw $1BCE, $1BD2, $1BD6, $1BDA             ; $13AE25 |
  dw $1A62, $1A82, $1AA2, $1B76             ; $13AE2D |
  dw $1A62, $1A62, $1AD2, $1B8E             ; $13AE35 |
  dw $1A62, $1A62, $1AFE, $1B86             ; $13AE3D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AE45 |
  dw $1A62, $1A62, $1A62, $1B32             ; $13AE4D |
  dw $1A62, $1A62, $1B6C, $1B6C             ; $13AE55 |
  dw $1B64, $1AFA, $1BBE, $1BCE             ; $13AE5D |
  dw $1BD2, $1BD6, $1BDA, $1A68             ; $13AE65 |
  dw $1A88, $1AA8, $1B7C, $1A62             ; $13AE6D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AE75 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AE7D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AE85 |
  dw $1A62, $1A62, $1B36, $1A62             ; $13AE8D |
  dw $1A62, $1B6C, $1B6C, $1B64             ; $13AE95 |
  dw $1AFA, $1BBE, $1BCE, $1BD2             ; $13AE9D |
  dw $1BD6, $1BDA, $1A6E, $1A8E             ; $13AEA5 |
  dw $1AAE, $1B84, $1A62, $1A62             ; $13AEAD |
  dw $1A62, $1A62, $1AEA, $1A62             ; $13AEB5 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AEBD |
  dw $1B0E, $1BB6, $1A62, $1B26             ; $13AEC5 |
  dw $1BAE, $1B3E, $1A62, $1A62             ; $13AECD |
  dw $1B5E, $1B5E, $1B64, $1AFA             ; $13AED5 |
  dw $1BBE, $1BCE, $1BD2, $1BD6             ; $13AEDD |
  dw $1BDA, $1A64, $1A84, $1A62             ; $13AEE5 |
  dw $1A62, $1A62, $1A62, $1AD4             ; $13AEED |
  dw $1B90, $1A62, $1A62, $1A62             ; $13AEF5 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AEFD |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF05 |
  dw $1B44, $1A62, $1A62, $1B6E             ; $13AF0D |
  dw $1B6E, $1B64, $1AFA, $1BBE             ; $13AF15 |
  dw $1BCE, $1BD2, $1BD6, $1BDA             ; $13AF1D |
  dw $1A6A, $1A8A, $1A62, $1A62             ; $13AF25 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF2D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF35 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF3D |
  dw $1A62, $1A62, $1A62, $1B2E             ; $13AF45 |
  dw $1A62, $1A62, $1B6E, $1B6E             ; $13AF4D |
  dw $1B64, $1AFA, $1BBE, $1BCE             ; $13AF55 |
  dw $1BD2, $1BD6, $1BDA, $1A70             ; $13AF5D |
  dw $1A90, $1A62, $1A62, $1A62             ; $13AF65 |
  dw $1A62, $1A62, $1A62, $1AEC             ; $13AF6D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF75 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AF7D |
  dw $1B1E, $1BA6, $1A62, $1A62             ; $13AF85 |
  dw $1A62, $1B60, $1B60, $1B64             ; $13AF8D |
  dw $1AFA, $1BBE, $1BCE, $1BD2             ; $13AF95 |
  dw $1BD2, $1BD6, $1A66, $1A86             ; $13AF9D |
  dw $1A62, $1A62, $1ABA, $1A62             ; $13AFA5 |
  dw $1AD6, $1B92, $1A62, $1A62             ; $13AFAD |
  dw $1A62, $1A62, $1B06, $1B9E             ; $13AFB5 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AFBD |
  dw $1A62, $1B34, $1B4E, $1A62             ; $13AFC5 |
  dw $1B74, $1B74, $1B64, $1AFA             ; $13AFCD |
  dw $1BBE, $1BCE, $1BD2, $1BD6             ; $13AFD5 |
  dw $1BDA, $1A6C, $1A8C, $1A62             ; $13AFDD |
  dw $1A62, $1AC0, $1A62, $1A62             ; $13AFE5 |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AFED |
  dw $1A62, $1A62, $1A62, $1A62             ; $13AFF5 |
  dw $1A62, $1A62, $1B28, $1BB0             ; $13AFFD |
  dw $1B38, $1B54, $1A62, $1B62             ; $13B005 |
  dw $1B62, $1B64, $1AFA, $1BC4             ; $13B00D |
  dw $1BCE, $1BD2, $1BD6, $1BDA             ; $13B015 |
  dw $1A72, $1A92, $1A62, $1A62             ; $13B01D |
  dw $1AC6, $1A62, $1A62, $1A62             ; $13B025 |
  dw $1AEE, $1A62, $1A62, $1A62             ; $13B02D |
  dw $1A62, $1A62, $1A62, $1A62             ; $13B035 |
  dw $1B16, $1B28, $1BB0, $1B40             ; $13B03D |
  dw $1B5A, $1AE2, $1B62, $1B62             ; $13B045 |
  dw $1B64, $1AFA, $1BCA, $1BCE             ; $13B04D |
  dw $1BD2, $1BD6, $1BDA                    ; $13B055 |

  dw $AB38, $AB7E, $ABCF, $AB38             ; $13B05B |
  dw $AB9F, $AB4E, $AB9F, $AB9F             ; $13B063 |
  dw $AB9F, $AB9F, $AB9F, $ABE5             ; $13B06B |
  dw $AB4E, $AB9F                           ; $13B073 |

  dw $ABE5, $AB4E, $AB4E, $AB4E             ; $13B077 |
  dw $AB68, $ABB5, $ABFF, $AB4E             ; $13B07F |
  dw $AB9F, $AB68, $AB9F, $AB9F             ; $13B087 |
  dw $ABB5, $ABE5, $ABE5, $ABFF             ; $13B08F |
  dw $AB38, $AB4E, $AB68, $AB9F             ; $13B097 |
  dw $AB9F, $AB9F, $AB9F, $AB9F             ; $13B09F |
  dw $AB9F, $AB9F, $AB9F, $AB9F             ; $13B0A7 |
  dw $AB7E, $AB9F, $ABB5, $AB7E             ; $13B0AF |
  dw $AB9F, $ABB5, $ABCF, $ABE5             ; $13B0B7 |
  dw $ABFF, $AB9F, $AB9F, $AB9F             ; $13B0BF |
  dw $AB7E, $AB9F, $ABB5, $AB4E             ; $13B0C7 |
  dw $AB4E, $AB9F, $AB9F, $AB7E             ; $13B0CF |
  dw $AB9F, $AB9F, $AB4E, $AB9F             ; $13B0D7 |
  dw $AB9F, $AB9F, $AB7E, $AB9F             ; $13B0DF |
  dw $AB9F, $AB4E, $AB4E, $AB68             ; $13B0E7 |
  dw $AB9F, $AB9F, $ABB5, $AB4E             ; $13B0EF |
  dw $AB9F, $AB9F, $AB9F, $AB9F             ; $13B0F7 |
  dw $AB9F, $AB9F, $AB9F, $ABB5             ; $13B0FF |
  dw $ABE5, $AB7E, $AB9F, $AB9F             ; $13B107 |
  dw $AB7E, $AB9F, $AB9F, $AB9F             ; $13B10F |
  dw $AB9F, $AB9F, $AB9F, $AB9F             ; $13B117 |
  dw $ABE5, $ABE5, $AB9F, $AB9F             ; $13B11F |
  dw $ABB5, $AB9F, $AB9F, $AB9F             ; $13B127 |
  dw $AB9F, $ABB5, $AB9F, $AB9F             ; $13B12F |
  dw $ABE5, $ABE5, $ABFF, $ABFF             ; $13B137 |

  REP #$30                                  ; $13B13F |
  LDA $1B                                   ; $13B141 |
  STA $0E                                   ; $13B143 |
  JSL $128719                               ; $13B145 |
  LDA #$B1B0                                ; $13B149 |
  STA $0A                                   ; $13B14C |
  JSR CODE_13B190                           ; $13B14E |
  LDA $1B                                   ; $13B151 |
  STA $0E                                   ; $13B153 |
  JSL $12875D                               ; $13B155 |
  LDA #$B32E                                ; $13B159 |
  STA $0A                                   ; $13B15C |
  JSR CODE_13B190                           ; $13B15E |
  JSR CODE_13FD61                           ; $13B161 |
  LDA #$B4AC                                ; $13B164 |
  STA $0A                                   ; $13B167 |
  JSR CODE_13B190                           ; $13B169 |
  JSR CODE_13FD54                           ; $13B16C |
  LDA #$B62A                                ; $13B16F |
  STA $0A                                   ; $13B172 |
  JSR CODE_13B190                           ; $13B174 |
  LDA $12                                   ; $13B177 |
  AND #$00FF                                ; $13B179 |
  ASL A                                     ; $13B17C |
  TAY                                       ; $13B17D |
  LDA $B7A8,y                               ; $13B17E |
  BEQ CODE_13B187                           ; $13B181 |
  TAY                                       ; $13B183 |
  LDA $0000,y                               ; $13B184 |

CODE_13B187:
  LDX $1D                                   ; $13B187 |
  STA $7F8000,x                             ; $13B189 |
  SEP #$30                                  ; $13B18D |
  RTL                                       ; $13B18F |

CODE_13B190:
  LDA $7F8000,x                             ; $13B190 |
  AND #$FF00                                ; $13B194 |
  CMP $1A62                                 ; $13B197 |
  BNE CODE_13B1AF                           ; $13B19A |
  LDA $7F8000,x                             ; $13B19C |
  AND #$00FF                                ; $13B1A0 |
  ASL A                                     ; $13B1A3 |
  TAY                                       ; $13B1A4 |
  LDA ($0A),y                               ; $13B1A5 |
  TAY                                       ; $13B1A7 |
  LDA $0000,y                               ; $13B1A8 |
  STA $7F8000,x                             ; $13B1AB |

CODE_13B1AF:
  RTS                                       ; $13B1AF |

  dw $1A74, $1A76, $1A78, $1A6E             ; $13B1B0 |
  dw $1A70, $1A72, $1A6E, $1A70             ; $13B1B8 |
  dw $1A72, $1A74, $1A76, $1A78             ; $13B1C0 |
  dw $1A80, $1A7E, $1A7E, $1A80             ; $13B1C8 |
  dw $1A94, $1A96, $1A98, $1A8E             ; $13B1D0 |
  dw $1A90, $1A92, $1A8E, $1A90             ; $13B1D8 |
  dw $1A92, $1A94, $1A96, $1A98             ; $13B1E0 |
  dw $1AA0, $1A9E, $1A9E, $1AA0             ; $13B1E8 |
  dw $1AA6, $1AAC, $1AA6, $1AAE             ; $13B1F0 |
  dw $1AB0, $1AAC, $1AAE, $1AB0             ; $13B1F8 |
  dw $1AB4, $1AB4, $1AB8, $1AB8             ; $13B200 |
  dw $1ABE, $1AC4, $1ABE, $1AC6             ; $13B208 |
  dw $1AC8, $1AC4, $1AC6, $1AC8             ; $13B210 |
  dw $1ACA, $1ACC, $1ACE, $1AD0             ; $13B218 |
  dw $1AD8, $1ADA, $1ADC, $1AD8             ; $13B220 |
  dw $1ADA, $1ADC, $1AE0, $1AE0             ; $13B228 |
  dw $1AE2, $1AE4, $1AE6, $1AE8             ; $13B230 |
  dw $1AEA, $1AEC, $1AEE, $1AF0             ; $13B238 |
  dw $1AF2, $1AF4, $1AF6, $1AF8             ; $13B240 |
  dw $1AFA, $1AFC, $1B02, $1B04             ; $13B248 |
  dw $1B02, $1B04, $1B0A, $1B0C             ; $13B250 |
  dw $1B0A, $1B0C, $1B0E, $1B10             ; $13B258 |
  dw $1B12, $1B14, $1B16, $1B18             ; $13B260 |
  dw $1B1A, $1B1C, $1B1E, $1B20             ; $13B268 |
  dw $1B22, $1B24, $1B26, $1B28             ; $13B270 |
  dw $1B2A, $1B2C, $1B42, $1B30             ; $13B278 |
  dw $1B46, $1B4A, $1B3E, $1B40             ; $13B280 |
  dw $1B3A, $1B30, $1B3E, $1B40             ; $13B288 |
  dw $1B42, $1B48, $1B46, $1B48             ; $13B290 |
  dw $1B4A, $1B3A, $1B52, $1B58             ; $13B298 |
  dw $1B52, $1B5A, $1B5C, $1B58             ; $13B2A0 |
  dw $1B5A, $1B5C, $1B5E, $1B60             ; $13B2A8 |
  dw $1B62, $1B68, $1B6A, $1B68             ; $13B2B0 |
  dw $1B6A, $1B6C, $1B6E, $1B70             ; $13B2B8 |
  dw $1B72, $1B74, $1B7A, $1B80             ; $13B2C0 |
  dw $1B7A, $1B82, $1B84, $1B80             ; $13B2C8 |
  dw $1B82, $1B84, $1B8A, $1B8C             ; $13B2D0 |
  dw $1B8A, $1B8C, $1B94, $1B96             ; $13B2D8 |
  dw $1B98, $1B94, $1B96, $1B98             ; $13B2E0 |
  dw $1B9C, $1B9C, $1BA2, $1BA4             ; $13B2E8 |
  dw $1BA2, $1BA4, $1BA6, $1BA8             ; $13B2F0 |
  dw $1BAA, $1BAC, $1BAE, $1BB0             ; $13B2F8 |
  dw $1BB2, $1BB4, $1BB6, $1BB8             ; $13B300 |
  dw $1BBA, $1BBC, $1BC2, $1BC8             ; $13B308 |
  dw $1BC2, $1BCA, $1BCC, $1BC8             ; $13B310 |
  dw $1BCA, $1BCC, $1BCE, $1BD0             ; $13B318 |
  dw $1BD2, $1BD4, $1BD8, $1BD8             ; $13B320 |
  dw $1BDA, $1BDC, $1BDE, $1A62             ; $13B328 |
  dw $1A64, $1A66, $1A62, $1A64             ; $13B330 |
  dw $1A66, $1A74, $1A76, $1A78             ; $13B338 |
  dw $1A74, $1A76, $1A78, $1A7A             ; $13B340 |
  dw $1A7A, $1A80, $1A80, $1A82             ; $13B348 |
  dw $1A84, $1A86, $1A82, $1A84             ; $13B350 |
  dw $1A86, $1A94, $1A96, $1A98             ; $13B358 |
  dw $1A94, $1A96, $1A98, $1A9A             ; $13B360 |
  dw $1A9A, $1AA0, $1AA0, $1AA2             ; $13B368 |
  dw $1AA4, $1AA6, $1AA2, $1AA4             ; $13B370 |
  dw $1AAC, $1AA6, $1AAC, $1AB2             ; $13B378 |
  dw $1AB4, $1AB2, $1AB4, $1ABA             ; $13B380 |
  dw $1ABC, $1ABE, $1ABA, $1ABC             ; $13B388 |
  dw $1AC4, $1ABE, $1AC4, $1ACA             ; $13B390 |
  dw $1ACC, $1ACE, $1AD0, $1AD2             ; $13B398 |
  dw $1AD4, $1AD6, $1AD8, $1ADA             ; $13B3A0 |
  dw $1ADC, $1ADE, $1AE0, $1AE6             ; $13B3A8 |
  dw $1AE8, $1AE6, $1AE8, $1AF0             ; $13B3B0 |
  dw $1AF2, $1AF4, $1AF0, $1AF2             ; $13B3B8 |
  dw $1AF4, $1AF8, $1AF8, $1AFA             ; $13B3C0 |
  dw $1AFC, $1AFE, $1B00, $1B02             ; $13B3C8 |
  dw $1B04, $1B06, $1B08, $1B0A             ; $13B3D0 |
  dw $1B0C, $1B12, $1B14, $1B12             ; $13B3D8 |
  dw $1B14, $1B1A, $1B1C, $1B1A             ; $13B3E0 |
  dw $1B1C, $1B2A, $1B20, $1B22             ; $13B3E8 |
  dw $1B24, $1B20, $1B22, $1B2A             ; $13B3F0 |
  dw $1B24, $1B44, $1B30, $1B32             ; $13B3F8 |
  dw $1B34, $1B32, $1B34, $1B30             ; $13B400 |
  dw $1B3C, $1B46, $1B4A, $1B48             ; $13B408 |
  dw $1B44, $1B46, $1B48, $1B4A             ; $13B410 |
  dw $1B3C, $1B4E, $1B50, $1B52             ; $13B418 |
  dw $1B4E, $1B50, $1B58, $1B52             ; $13B420 |
  dw $1B58, $1B70, $1B72, $1B74             ; $13B428 |
  dw $1B64, $1B66, $1B68, $1B6A             ; $13B430 |
  dw $1B6E, $1B6E, $1B70, $1B72             ; $13B438 |
  dw $1B74, $1B76, $1B78, $1B7A             ; $13B440 |
  dw $1B76, $1B78, $1B80, $1B7A             ; $13B448 |
  dw $1B80, $1B86, $1B88, $1B8A             ; $13B450 |
  dw $1B8C, $1B8E, $1B90, $1B92             ; $13B458 |
  dw $1B94, $1B96, $1B98, $1B9A             ; $13B460 |
  dw $1B9C, $1B9E, $1BA0, $1BA2             ; $13B468 |
  dw $1BA4, $1BB2, $1BA8, $1BAA             ; $13B470 |
  dw $1BAC, $1BA8, $1BAA, $1BB2             ; $13B478 |
  dw $1BAC, $1BBA, $1BBC, $1BBA             ; $13B480 |
  dw $1BBC, $1BBE, $1BC0, $1BC2             ; $13B488 |
  dw $1BBE, $1BC0, $1BC8, $1BC2             ; $13B490 |
  dw $1BC8, $1BCE, $1BD0, $1BD2             ; $13B498 |
  dw $1BD4, $1BD6, $1BD8, $1BDC             ; $13B4A0 |
  dw $1BDC, $1BDE, $1A62, $1A62             ; $13B4A8 |
  dw $1A7A, $1A68, $1A68, $1A7C             ; $13B4B0 |
  dw $1A6E, $1A6E, $1A7E, $1A74             ; $13B4B8 |
  dw $1A74, $1A80, $1A7A, $1A7C             ; $13B4C0 |
  dw $1A7E, $1A80, $1A82, $1A82             ; $13B4C8 |
  dw $1A9A, $1A88, $1A88, $1A9C             ; $13B4D0 |
  dw $1A8E, $1A8E, $1A9E, $1A94             ; $13B4D8 |
  dw $1A94, $1AA0, $1A9A, $1A9C             ; $13B4E0 |
  dw $1A9E, $1AA0, $1AA2, $1AA4             ; $13B4E8 |
  dw $1AA6, $1AA8, $1AAA, $1AAC             ; $13B4F0 |
  dw $1AAE, $1AB0, $1AB2, $1AB4             ; $13B4F8 |
  dw $1AB6, $1AB8, $1ABC, $1ABC             ; $13B500 |
  dw $1AC4, $1AC2, $1AC2, $1AC4             ; $13B508 |
  dw $1AC8, $1AC8, $1ACA, $1ACA             ; $13B510 |
  dw $1AD0, $1AD0, $1AD2, $1AD2             ; $13B518 |
  dw $1ADE, $1AD8, $1AD8, $1AE0             ; $13B520 |
  dw $1ADE, $1AE0, $1AE4, $1AE4             ; $13B528 |
  dw $1AE8, $1AE8, $1AEA, $1AEA             ; $13B530 |
  dw $1AF6, $1AF0, $1AF0, $1AF8             ; $13B538 |
  dw $1AF6, $1AF8, $1AFC, $1AFC             ; $13B540 |
  dw $1AFE, $1B00, $1B02, $1B04             ; $13B548 |
  dw $1B08, $1B08, $1B0C, $1B0C             ; $13B550 |
  dw $1B0E, $1B10, $1B12, $1B14             ; $13B558 |
  dw $1B18, $1B18, $1B1C, $1B1C             ; $13B560 |
  dw $1B26, $1B20, $1B24, $1B24             ; $13B568 |
  dw $1B26, $1B2C, $1B20, $1B2C             ; $13B570 |
  dw $1B36, $1B30, $1B32, $1B3C             ; $13B578 |
  dw $1B36, $1B4C, $1B3A, $1B3C             ; $13B580 |
  dw $1B3E, $1B3A, $1B3E, $1B32             ; $13B588 |
  dw $1B46, $1B46, $1B30, $1B4C             ; $13B590 |
  dw $1B50, $1B50, $1B58, $1B56             ; $13B598 |
  dw $1B56, $1B58, $1B5C, $1B5C             ; $13B5A0 |
  dw $1B5E, $1B5E, $1B6C, $1B66             ; $13B5A8 |
  dw $1B66, $1B6A, $1B6A, $1B6C             ; $13B5B0 |
  dw $1B6E, $1B70, $1B70, $1B6E             ; $13B5B8 |
  dw $1B76, $1B78, $1B7A, $1B7C             ; $13B5C0 |
  dw $1B7E, $1B80, $1B82, $1B84             ; $13B5C8 |
  dw $1B86, $1B88, $1B8A, $1B8C             ; $13B5D0 |
  dw $1B8E, $1B8E, $1B9A, $1B94             ; $13B5D8 |
  dw $1B94, $1B9C, $1B9A, $1B9C             ; $13B5E0 |
  dw $1BA0, $1BA0, $1BA4, $1BA4             ; $13B5E8 |
  dw $1BA8, $1BA8, $1BAC, $1BAC             ; $13B5F0 |
  dw $1BAE, $1BB4, $1BA8, $1BB4             ; $13B5F8 |
  dw $1BB6, $1BB8, $1BBA, $1BBC             ; $13B600 |
  dw $1BC0, $1BC0, $1BC8, $1BC6             ; $13B608 |
  dw $1BC6, $1BC8, $1BCC, $1BCC             ; $13B610 |
  dw $1BCE, $1BD0, $1BD4, $1BD4             ; $13B618 |
  dw $1BD6, $1BD8, $1BDA, $1BDC             ; $13B620 |
  dw $1BDE, $1A7A, $1A66, $1A66             ; $13B628 |
  dw $1A7C, $1A6C, $1A6C, $1A7E             ; $13B630 |
  dw $1A72, $1A72, $1A80, $1A78             ; $13B638 |
  dw $1A78, $1A7A, $1A7C, $1A7E             ; $13B640 |
  dw $1A80, $1A9A, $1A86, $1A86             ; $13B648 |
  dw $1A9C, $1A8C, $1A8C, $1A9E             ; $13B650 |
  dw $1A92, $1A92, $1AA0, $1A98             ; $13B658 |
  dw $1A98, $1A9A, $1A9C, $1A9E             ; $13B660 |
  dw $1AA0, $1AA4, $1AA4, $1AAC             ; $13B668 |
  dw $1AAA, $1AAA, $1AAC, $1AB0             ; $13B670 |
  dw $1AB0, $1AB2, $1AB4, $1AB6             ; $13B678 |
  dw $1AB8, $1ABA, $1ABC, $1ABE             ; $13B680 |
  dw $1AC0, $1AC2, $1AC4, $1AC6             ; $13B688 |
  dw $1AC8, $1AD0, $1ACE, $1ACE             ; $13B690 |
  dw $1AD0, $1ADE, $1AD6, $1AD6             ; $13B698 |
  dw $1AE0, $1ADC, $1ADC, $1ADE             ; $13B6A0 |
  dw $1AE0, $1AE2, $1AE4, $1AE6             ; $13B6A8 |
  dw $1AE8, $1AF6, $1AEE, $1AEE             ; $13B6B0 |
  dw $1AF8, $1AF4, $1AF4, $1AF6             ; $13B6B8 |
  dw $1AF8, $1AFA, $1AFC, $1B00             ; $13B6C0 |
  dw $1B00, $1B04, $1B04, $1B06             ; $13B6C8 |
  dw $1B08, $1B0A, $1B0C, $1B10             ; $13B6D0 |
  dw $1B10, $1B14, $1B14, $1B16             ; $13B6D8 |
  dw $1B18, $1B1A, $1B1C, $1B28             ; $13B6E0 |
  dw $1B24, $1B22, $1B24, $1B2C             ; $13B6E8 |
  dw $1B28, $1B22, $1B2C, $1B38             ; $13B6F0 |
  dw $1B30, $1B3C, $1B34, $1B4C             ; $13B6F8 |
  dw $1B38, $1B3A, $1B3C, $1B3A             ; $13B700 |
  dw $1B40, $1B40, $1B34, $1B30             ; $13B708 |
  dw $1B4A, $1B4A, $1B4C, $1B4E             ; $13B710 |
  dw $1B50, $1B52, $1B54, $1B56             ; $13B718 |
  dw $1B58, $1B5A, $1B5C, $1B6C             ; $13B720 |
  dw $1B62, $1B6C, $1B64, $1B66             ; $13B728 |
  dw $1B68, $1B6A, $1B6C, $1B6E             ; $13B730 |
  dw $1B6E, $1B74, $1B74, $1B78             ; $13B738 |
  dw $1B78, $1B80, $1B7E, $1B7E             ; $13B740 |
  dw $1B80, $1B84, $1B84, $1B88             ; $13B748 |
  dw $1B88, $1B8C, $1B8C, $1B9A             ; $13B750 |
  dw $1B92, $1B92, $1B9C, $1B98             ; $13B758 |
  dw $1B98, $1B9A, $1B9C, $1B9E             ; $13B760 |
  dw $1BA0, $1BA2, $1BA4, $1BB0             ; $13B768 |
  dw $1BAC, $1BAA, $1BAC, $1BB4             ; $13B770 |
  dw $1BB0, $1BAA, $1BB4, $1BB8             ; $13B778 |
  dw $1BB8, $1BBC, $1BBC, $1BBE             ; $13B780 |
  dw $1BC0, $1BC2, $1BC4, $1BC6             ; $13B788 |
  dw $1BC8, $1BCA, $1BCC, $1BD0             ; $13B790 |
  dw $1BD0, $1BD2, $1BD4, $1BD6             ; $13B798 |
  dw $1BD8, $1BDA, $1BDC, $1BDE             ; $13B7A0 |
  dw $0000, $0000, $0000, $0000             ; $13B7A8 |
  dw $0000, $0000, $0000, $0000             ; $13B7B0 |
  dw $0000, $0000, $0000, $0000             ; $13B7B8 |
  dw $0000, $0000, $0000, $0000             ; $13B7C0 |
  dw $1C04, $1C04, $1C04, $1C04             ; $13B7C8 |
  dw $1C04, $1C04, $1C04, $1C04             ; $13B7D0 |
  dw $1C04, $1C04, $1C04, $1C04             ; $13B7D8 |
  dw $1C04, $1C04, $1C04, $1C04             ; $13B7E0 |
  dw $1BF8, $1BF8, $1BF8, $1BF8             ; $13B7E8 |
  dw $1BF8, $1BF8, $1BF8, $1BF8             ; $13B7F0 |
  dw $1BE0, $1BE0, $1BE0, $1BE0             ; $13B7F8 |
  dw $1BFA, $1BFA, $1BFA, $1BFA             ; $13B800 |
  dw $1BFA, $1BFA, $1BFA, $1BFA             ; $13B808 |
  dw $1BE6, $1BE6, $1BE6, $1BE6             ; $13B810 |
  dw $1BF4, $1BF4, $1BF4, $1BF4             ; $13B818 |
  dw $1BF4, $1BF4, $1BF4, $1BF4             ; $13B820 |
  dw $1BEE, $1BEE, $1BEE, $1BEE             ; $13B828 |
  dw $1BF6, $1BF6, $1BF6, $1BF6             ; $13B830 |
  dw $1BF6, $1BF6, $1BF6, $1BF6             ; $13B838 |
  dw $1C30, $1C30, $1BFC, $1BFC             ; $13B840 |
  dw $1BFC, $1BFC, $1BFE, $1BFE             ; $13B848 |
  dw $1BFE, $1BFE, $1C00, $1C00             ; $13B850 |
  dw $1C00, $1C00, $1C02, $1C02             ; $13B858 |
  dw $1C02, $1C02, $1C1A, $1C1A             ; $13B860 |
  dw $1C1A, $1C1A, $1C1A, $1C1A             ; $13B868 |
  dw $1C1A, $1C1A, $1C18, $1C18             ; $13B870 |
  dw $1C18, $1C18, $1C18, $1C18             ; $13B878 |
  dw $1C18, $1C18, $1C18, $1C18             ; $13B880 |
  dw $1C18, $1C18, $1C18, $1C18             ; $13B888 |
  dw $1C18, $1C18, $1BF0, $1BF0             ; $13B890 |
  dw $1BF0, $1BF0, $1BF0, $1BF0             ; $13B898 |
  dw $1BF0, $1BF0, $1C5C, $1C5E             ; $13B8A0 |
  dw $1C5C, $1C2E, $1C2E, $1C2E             ; $13B8A8 |
  dw $1C2E, $1C5C, $1C5E, $1C5C             ; $13B8B0 |
  dw $1C5E, $1C5C, $1BF2, $1BF2             ; $13B8B8 |
  dw $1BF2, $1BF2, $1BF2, $1BF2             ; $13B8C0 |
  dw $1BF2, $1BF2, $1BEC, $1BEC             ; $13B8C8 |
  dw $1BEC, $1BEC, $1BE4, $1BE4             ; $13B8D0 |
  dw $1BE4, $1BE4, $1BE4, $1BE4             ; $13B8D8 |
  dw $1BE4, $1BE4, $1BEA, $1BEA             ; $13B8E0 |
  dw $1BEA, $1BEA, $1BE2, $1BE2             ; $13B8E8 |
  dw $1BE2, $1BE2, $1BE2, $1BE2             ; $13B8F0 |
  dw $1BE2, $1BE2, $1BE8, $1BE8             ; $13B8F8 |
  dw $1BE8, $1BE8, $1C32, $1C32             ; $13B900 |
  dw $1C32, $1C32, $1C32, $1C32             ; $13B908 |
  dw $1C32, $1C32, $1C34, $1C34             ; $13B910 |
  dw $1C36, $1C36, $1C38, $1C38             ; $13B918 |
  dw $1C3A, $1C3A                           ; $13B920 |

  REP #$30                                  ; $13B924 |
  LDA $15                                   ; $13B926 |
  AND #$0001                                ; $13B928 |
  ASL A                                     ; $13B92B |
  TAY                                       ; $13B92C |
  LDA $12                                   ; $13B92D |
  CMP $1C5C                                 ; $13B92F |
  BEQ CODE_13B943                           ; $13B932 |
  CMP $1C5E                                 ; $13B934 |
  BEQ CODE_13B943                           ; $13B937 |
  CMP $1D94                                 ; $13B939 |
  BEQ CODE_13B943                           ; $13B93C |
  CMP $1D96                                 ; $13B93E |
  BNE CODE_13B948                           ; $13B941 |

CODE_13B943:
  LDY #$1C48                                ; $13B943 |
  BRA CODE_13B94C                           ; $13B946 |

CODE_13B948:
  LDA $B958,y                               ; $13B948 |
  TAY                                       ; $13B94B |

CODE_13B94C:
  LDX $1D                                   ; $13B94C |
  LDA $0000,y                               ; $13B94E |
  STA $7F8000,x                             ; $13B951 |
  SEP #$30                                  ; $13B955 |
  RTL                                       ; $13B957 |

  dw $1C46, $1C52                           ; $13B958 |

  REP #$30                                  ; $13B95C |
  LDA #$0001                                ; $13B95E |
  STA $9B                                   ; $13B961 |
  LDA $2C                                   ; $13B963 |
  CMP #$0002                                ; $13B965 |
  BCS CODE_13B982                           ; $13B968 |
  ASL A                                     ; $13B96A |
  TAY                                       ; $13B96B |
  LDA $2A                                   ; $13B96C |
  BPL CODE_13B975                           ; $13B96E |
  TYA                                       ; $13B970 |
  ORA #$0004                                ; $13B971 |
  TAY                                       ; $13B974 |

CODE_13B975:
  LDX $1D                                   ; $13B975 |
  LDA $B985,y                               ; $13B977 |
  TAY                                       ; $13B97A |
  LDA $0000,y                               ; $13B97B |
  STA $7F8000,x                             ; $13B97E |

CODE_13B982:
  SEP #$30                                  ; $13B982 |
  RTL                                       ; $13B984 |

  dw $1C50, $1C4E, $1C4A, $1C4C             ; $13B985 |

  REP #$30                                  ; $13B98D |
  LDA $12                                   ; $13B98F |
  CMP #$00C2                                ; $13B991 |
  BCC CODE_13BA0D                           ; $13B994 |
  CMP #$00C8                                ; $13B996 |
  BCS CODE_13BA0D                           ; $13B999 |
  CMP #$150D                                ; $13B99B |
  BEQ CODE_13BA0D                           ; $13B99E |
  CMP #$150E                                ; $13B9A0 |
  BEQ CODE_13BA0D                           ; $13B9A3 |
  LDY #$0000                                ; $13B9A5 |
  LDA $28                                   ; $13B9A8 |
  BEQ CODE_13B9BF                           ; $13B9AA |
  INC A                                     ; $13B9AC |
  CMP $2A                                   ; $13B9AD |
  BNE CODE_13B9B6                           ; $13B9AF |
  LDY #$0006                                ; $13B9B1 |
  BRA CODE_13B9BF                           ; $13B9B4 |

CODE_13B9B6:
  INY                                       ; $13B9B6 |
  INY                                       ; $13B9B7 |
  AND #$0001                                ; $13B9B8 |
  BEQ CODE_13B9BF                           ; $13B9BB |
  INY                                       ; $13B9BD |
  INY                                       ; $13B9BE |

CODE_13B9BF:
  LDA $28                                   ; $13B9BF |
  BEQ CODE_13B9C8                           ; $13B9C1 |
  INC A                                     ; $13B9C3 |
  CMP $2A                                   ; $13B9C4 |
  BNE CODE_13B9E1                           ; $13B9C6 |

CODE_13B9C8:
  LDA $12                                   ; $13B9C8 |
  CMP $19DA                                 ; $13B9CA |
  BCC CODE_13B9D4                           ; $13B9CD |
  CMP $1A5E                                 ; $13B9CF |
  BCC CODE_13BA0D                           ; $13B9D2 |

CODE_13B9D4:
  CMP #$00D1                                ; $13B9D4 |
  BEQ CODE_13B9DE                           ; $13B9D7 |
  CMP #$00D2                                ; $13B9D9 |
  BNE CODE_13B9E1                           ; $13B9DC |

CODE_13B9DE:
  LDY #$0002                                ; $13B9DE |

CODE_13B9E1:
  LDA $BA10,y                               ; $13B9E1 |
  LDX $1D                                   ; $13B9E4 |
  STA $7F8000,x                             ; $13B9E6 |
  LDA $12                                   ; $13B9EA |
  CMP #$00C4                                ; $13B9EC |
  BCC CODE_13BA0D                           ; $13B9EF |
  CMP #$00C8                                ; $13B9F1 |
  BCS CODE_13BA0D                           ; $13B9F4 |
  LDA $28                                   ; $13B9F6 |
  BEQ CODE_13BA0D                           ; $13B9F8 |
  LDA $12                                   ; $13B9FA |
  SEC                                       ; $13B9FC |
  SBC #$00C4                                ; $13B9FD |
  ASL A                                     ; $13BA00 |
  TAY                                       ; $13BA01 |
  LDX $1D                                   ; $13BA02 |
  LDA $BA18,y                               ; $13BA04 |
  STA $7F8000,x                             ; $13BA07 |
  BRA CODE_13BA0D                           ; $13BA0B |

CODE_13BA0D:
  SEP #$30                                  ; $13BA0D |
  RTL                                       ; $13BA0F |

  dw $00D1, $150D, $150E, $00D2             ; $13BA10 |
  dw $151B, $151B, $0000, $151A             ; $13BA18 |

  REP #$30                                  ; $13BA20 |
  LDY #$0000                                ; $13BA22 |
  LDA $2A                                   ; $13BA25 |
  BPL CODE_13BA2B                           ; $13BA27 |
  INC A                                     ; $13BA29 |
  INC A                                     ; $13BA2A |

CODE_13BA2B:
  STA $00                                   ; $13BA2B |
  LDA $28                                   ; $13BA2D |
  BEQ CODE_13BA44                           ; $13BA2F |
  INY                                       ; $13BA31 |
  INY                                       ; $13BA32 |
  INC A                                     ; $13BA33 |
  CMP $00                                   ; $13BA34 |
  BEQ CODE_13BA44                           ; $13BA36 |
  LDA $15                                   ; $13BA38 |
  AND #$0003                                ; $13BA3A |
  ASL A                                     ; $13BA3D |
  TAX                                       ; $13BA3E |
  JSR ($BA9E,x)                             ; $13BA3F |
  BRA CODE_13BA8F                           ; $13BA42 |

CODE_13BA44:
  LDA $2C                                   ; $13BA44 |
  BNE CODE_13BA8F                           ; $13BA46 |
  LDA $12                                   ; $13BA48 |
  CMP $19DA                                 ; $13BA4A |
  BCC CODE_13BA54                           ; $13BA4D |
  CMP $1A5E                                 ; $13BA4F |
  BCC CODE_13BA8F                           ; $13BA52 |

CODE_13BA54:
  CMP #$150D                                ; $13BA54 |
  BEQ CODE_13BA8F                           ; $13BA57 |
  CMP #$150E                                ; $13BA59 |
  BEQ CODE_13BA8F                           ; $13BA5C |
  CMP #$00D1                                ; $13BA5E |
  BEQ CODE_13BA6A                           ; $13BA61 |
  CMP #$00D2                                ; $13BA63 |
  BNE CODE_13BA6F                           ; $13BA66 |
  INY                                       ; $13BA68 |
  INY                                       ; $13BA69 |

CODE_13BA6A:
  LDA $BA98,y                               ; $13BA6A |
  BRA CODE_13BA89                           ; $13BA6D |

CODE_13BA6F:
  LDA $2A                                   ; $13BA6F |
  BPL CODE_13BA78                           ; $13BA71 |
  TYA                                       ; $13BA73 |
  EOR #$0002                                ; $13BA74 |
  TAY                                       ; $13BA77 |

CODE_13BA78:
  LDA $2C                                   ; $13BA78 |
  BNE CODE_13BA8F                           ; $13BA7A |
  LDA $12                                   ; $13BA7C |
  CMP #$00C5                                ; $13BA7E |
  BNE CODE_13BA86                           ; $13BA81 |
  LDY #$0004                                ; $13BA83 |

CODE_13BA86:
  LDA $BA92,y                               ; $13BA86 |

CODE_13BA89:
  LDX $1D                                   ; $13BA89 |
  STA $7F8000,x                             ; $13BA8B |

CODE_13BA8F:
  SEP #$30                                  ; $13BA8F |
  RTL                                       ; $13BA91 |

  dw $00D1, $00D2, $151B, $150D             ; $13BA92 |
  dw $150E, $150D                           ; $13BA9A |

  dw $BAA4, $BAE6, $BB13                    ; $13BA9E |

  LDA $2C                                   ; $13BAA4 |
  CMP #$0002                                ; $13BAA6 |
  BCS CODE_13BAD5                           ; $13BAA9 |
  ASL A                                     ; $13BAAB |
  STA $00                                   ; $13BAAC |
  LDA $28                                   ; $13BAAE |
  EOR #$0001                                ; $13BAB0 |
  AND #$0001                                ; $13BAB3 |
  STA $9B                                   ; $13BAB6 |
  ASL A                                     ; $13BAB8 |
  ASL A                                     ; $13BAB9 |
  TAY                                       ; $13BABA |
  LDA $2A                                   ; $13BABB |
  BPL CODE_13BAC4                           ; $13BABD |
  TYA                                       ; $13BABF |
  ORA #$0008                                ; $13BAC0 |
  TAY                                       ; $13BAC3 |

CODE_13BAC4:
  TYA                                       ; $13BAC4 |
  ORA $00                                   ; $13BAC5 |
  TAY                                       ; $13BAC7 |
  LDX $1D                                   ; $13BAC8 |
  LDA $BAD6,y                               ; $13BACA |
  TAY                                       ; $13BACD |
  LDA $0000,y                               ; $13BACE |
  STA $7F8000,x                             ; $13BAD1 |

CODE_13BAD5:
  RTS                                       ; $13BAD5 |

  dw $1A42, $1A60, $1A50, $1A5C             ; $13BAD6 |
  dw $1A34, $1A5E, $1A2A, $1A40             ; $13BADE |

  LDA #$0001                                ; $13BAE6 |
  STA $9B                                   ; $13BAE9 |
  LDA $2C                                   ; $13BAEB |
  CMP #$0002                                ; $13BAED |
  BCS CODE_13BB0A                           ; $13BAF0 |
  ASL A                                     ; $13BAF2 |
  TAY                                       ; $13BAF3 |
  LDA $2A                                   ; $13BAF4 |
  BPL CODE_13BAFD                           ; $13BAF6 |
  TYA                                       ; $13BAF8 |
  ORA #$0004                                ; $13BAF9 |
  TAY                                       ; $13BAFC |

CODE_13BAFD:
  LDX $1D                                   ; $13BAFD |
  LDA $BB0B,y                               ; $13BAFF |
  TAY                                       ; $13BB02 |
  LDA $0000,y                               ; $13BB03 |
  STA $7F8000,x                             ; $13BB06 |

CODE_13BB0A:
  RTS                                       ; $13BB0A |

  dw $1A16, $1A28, $1A02, $1A14             ; $13BB0B |

  LDA #$0001                                ; $13BB13 |
  STA $9B                                   ; $13BB16 |
  LDA $2C                                   ; $13BB18 |
  CMP #$0003                                ; $13BB1A |
  BCS CODE_13BB38                           ; $13BB1D |
  ASL A                                     ; $13BB1F |
  TAY                                       ; $13BB20 |
  LDA $2A                                   ; $13BB21 |
  BPL CODE_13BB2B                           ; $13BB23 |
  TYA                                       ; $13BB25 |
  CLC                                       ; $13BB26 |
  ADC #$0006                                ; $13BB27 |
  TAY                                       ; $13BB2A |

CODE_13BB2B:
  LDX $1D                                   ; $13BB2B |
  LDA $BB39,y                               ; $13BB2D |
  TAY                                       ; $13BB30 |
  LDA $0000,y                               ; $13BB31 |
  STA $7F8000,x                             ; $13BB34 |

CODE_13BB38:
  RTS                                       ; $13BB38 |

  dw $19EE, $19F6, $1A00, $19DA             ; $13BB39 |
  dw $19E2, $19EC                           ; $13BB41 |

  REP #$30                                  ; $13BB45 |
  LDY #$0000                                ; $13BB47 |
  LDA $28                                   ; $13BB4A |
  BEQ CODE_13BB59                           ; $13BB4C |
  INY                                       ; $13BB4E |
  INY                                       ; $13BB4F |
  INC A                                     ; $13BB50 |
  CMP $2A                                   ; $13BB51 |
  BNE CODE_13BB6E                           ; $13BB53 |
  INY                                       ; $13BB55 |
  INY                                       ; $13BB56 |
  BRA CODE_13BB62                           ; $13BB57 |

CODE_13BB59:
  LDA $12                                   ; $13BB59 |
  CMP $1BF8                                 ; $13BB5B |
  BNE CODE_13BB6E                           ; $13BB5E |
  BRA CODE_13BB69                           ; $13BB60 |

CODE_13BB62:
  LDA $12                                   ; $13BB62 |
  CMP $1BFA                                 ; $13BB64 |
  BNE CODE_13BB6E                           ; $13BB67 |

CODE_13BB69:
  TYA                                       ; $13BB69 |
  ORA #$0008                                ; $13BB6A |
  TAY                                       ; $13BB6D |

CODE_13BB6E:
  LDA $15                                   ; $13BB6E |
  CMP #$0057                                ; $13BB70 |
  BEQ CODE_13BB7A                           ; $13BB73 |
  LDA $BB98,y                               ; $13BB75 |
  BRA CODE_13BB7D                           ; $13BB78 |

CODE_13BB7A:
  LDA $BB8A,y                               ; $13BB7A |

CODE_13BB7D:
  TAY                                       ; $13BB7D |
  LDX $1D                                   ; $13BB7E |
  LDA $0000,y                               ; $13BB80 |
  STA $7F8000,x                             ; $13BB83 |
  SEP #$30                                  ; $13BB87 |
  RTL                                       ; $13BB89 |

  dw $1D30, $1D32, $1D34, $0000             ; $13BB8A |
  dw $1D36, $1D32, $1D38, $1C8C             ; $13BB92 |
  dw $1C8E, $1C90, $0000, $1C8C             ; $13BB9A |
  dw $1C8E, $1C90                           ; $13BBA2 |

  REP #$30                                  ; $13BBA6 |
  LDX #$0000                                ; $13BBA8 |
  LDA $28                                   ; $13BBAB |
  BEQ CODE_13BBB8                           ; $13BBAD |
  INX                                       ; $13BBAF |
  INX                                       ; $13BBB0 |
  INC A                                     ; $13BBB1 |
  CMP $2A                                   ; $13BBB2 |
  BNE CODE_13BBB8                           ; $13BBB4 |
  INX                                       ; $13BBB6 |
  INX                                       ; $13BBB7 |

CODE_13BBB8:
  JSR ($BBBE,x)                             ; $13BBB8 |
  SEP #$30                                  ; $13BBBB |
  RTL                                       ; $13BBBD |

  dw $BBC4, $BC73, $BCD4                    ; $13BBBE |

  LDA $A1                                   ; $13BBC4 |
  BPL CODE_13BBCB                           ; $13BBC6 |
  JMP CODE_13BC72                           ; $13BBC8 |

CODE_13BBCB:
  LDA $A1                                   ; $13BBCB |
  BNE CODE_13BBEF                           ; $13BBCD |
  LDA $1B                                   ; $13BBCF |
  STA $0E                                   ; $13BBD1 |
  JSL $12875D                               ; $13BBD3 |
  LDA $7F8000,x                             ; $13BBD7 |
  CMP $1CE8                                 ; $13BBDB |
  BEQ CODE_13BBEF                           ; $13BBDE |
  CMP $1CEA                                 ; $13BBE0 |
  BEQ CODE_13BBEF                           ; $13BBE3 |
  CMP $1CAE                                 ; $13BBE5 |
  BCC CODE_13BC2A                           ; $13BBE8 |
  CMP $1CCA                                 ; $13BBEA |
  BCS CODE_13BC2A                           ; $13BBED |

CODE_13BBEF:
  LDA #$0001                                ; $13BBEF |
  STA $A1                                   ; $13BBF2 |
  LDA $2C                                   ; $13BBF4 |
  BEQ CODE_13BC25                           ; $13BBF6 |
  LDA #$0001                                ; $13BBF8 |
  STA $15                                   ; $13BBFB |
  JSL $138231                               ; $13BBFD |
  REP #$30                                  ; $13BC01 |
  JSR CODE_13FD61                           ; $13BC03 |
  CMP #$007D                                ; $13BC06 |
  BEQ CODE_13BC1A                           ; $13BC09 |
  CMP #$007E                                ; $13BC0B |
  BEQ CODE_13BC1A                           ; $13BC0E |
  CMP $1C5C                                 ; $13BC10 |
  BEQ CODE_13BC1A                           ; $13BC13 |
  CMP $1C5E                                 ; $13BC15 |
  BNE CODE_13BC23                           ; $13BC18 |

CODE_13BC1A:
  LDX $1D                                   ; $13BC1A |
  LDA $1CE6                                 ; $13BC1C |
  STA $7F8000,x                             ; $13BC1F |

CODE_13BC23:
  BRA CODE_13BC72                           ; $13BC23 |

CODE_13BC25:
  LDA $1CF6                                 ; $13BC25 |
  BRA CODE_13BC6C                           ; $13BC28 |

CODE_13BC2A:
  LDA $2C                                   ; $13BC2A |
  BNE CODE_13BC72                           ; $13BC2C |
  LDA $12                                   ; $13BC2E |
  CMP $1CF0                                 ; $13BC30 |
  BEQ CODE_13BC4E                           ; $13BC33 |
  CMP $1CF2                                 ; $13BC35 |
  BEQ CODE_13BC4E                           ; $13BC38 |
  CMP $1CF4                                 ; $13BC3A |
  BEQ CODE_13BC4E                           ; $13BC3D |
  CMP $1CF6                                 ; $13BC3F |
  BEQ CODE_13BC4E                           ; $13BC42 |
  CMP $1CF8                                 ; $13BC44 |
  BEQ CODE_13BC4E                           ; $13BC47 |
  CMP $1CFA                                 ; $13BC49 |
  BNE CODE_13BC53                           ; $13BC4C |

CODE_13BC4E:
  LDA $1CF2                                 ; $13BC4E |
  BRA CODE_13BC6C                           ; $13BC51 |

CODE_13BC53:
  LDA #$8000                                ; $13BC53 |
  STA $A1                                   ; $13BC56 |
  LDA $12                                   ; $13BC58 |
  CMP $1C28                                 ; $13BC5A |
  BEQ CODE_13BC72                           ; $13BC5D |
  CMP $1BF6                                 ; $13BC5F |
  BNE CODE_13BC69                           ; $13BC62 |
  LDA $1C28                                 ; $13BC64 |
  BRA CODE_13BC6C                           ; $13BC67 |

CODE_13BC69:
  LDA $1CF0                                 ; $13BC69 |

CODE_13BC6C:
  LDX $1D                                   ; $13BC6C |
  STA $7F8000,x                             ; $13BC6E |

CODE_13BC72:
  RTS                                       ; $13BC72 |

  STZ $A1                                   ; $13BC73 |
  LDA $2C                                   ; $13BC75 |
  BNE CODE_13BCA3                           ; $13BC77 |
  LDA $12                                   ; $13BC79 |
  CMP $1C28                                 ; $13BC7B |
  BEQ CODE_13BCA3                           ; $13BC7E |
  LDY #$0000                                ; $13BC80 |

CODE_13BC83:
  LDX $BCA4,y                               ; $13BC83 |
  CMP $0000,x                               ; $13BC86 |
  BEQ CODE_13BC97                           ; $13BC89 |
  INY                                       ; $13BC8B |
  INY                                       ; $13BC8C |
  CPY #$0018                                ; $13BC8D |
  BCC CODE_13BC83                           ; $13BC90 |
  LDA $1CF2                                 ; $13BC92 |
  BRA CODE_13BC9D                           ; $13BC95 |

CODE_13BC97:
  LDX $BCBC,y                               ; $13BC97 |
  LDA $0000,x                               ; $13BC9A |

CODE_13BC9D:
  LDX $1D                                   ; $13BC9D |
  STA $7F8000,x                             ; $13BC9F |

CODE_13BCA3:
  RTS                                       ; $13BCA3 |

  dw $1BE2, $1BE6, $1BE8, $1BEE             ; $13BCA4 |
  dw $1BF6, $1C00, $1C02, $1C1A             ; $13BCAC |
  dw $1C30, $1C34, $1C36, $1C3A             ; $13BCB4 |
  dw $1C28, $1C28, $1C26, $1C2A             ; $13BCBC |
  dw $1C28, $1C26, $1C2A, $1C28             ; $13BCC4 |
  dw $1C2A, $1C26, $1C2A, $1C2C             ; $13BCCC |

  LDA $A1                                   ; $13BCD4 |
  BPL CODE_13BCDB                           ; $13BCD6 |
  JMP CODE_13BD7F                           ; $13BCD8 |

CODE_13BCDB:
  LDA $A1                                   ; $13BCDB |
  BNE CODE_13BCFF                           ; $13BCDD |
  LDA $1B                                   ; $13BCDF |
  STA $0E                                   ; $13BCE1 |
  JSL $12875D                               ; $13BCE3 |
  LDA $7F8000,x                             ; $13BCE7 |
  CMP $1CE8                                 ; $13BCEB |
  BEQ CODE_13BCFF                           ; $13BCEE |
  CMP $1CEA                                 ; $13BCF0 |
  BEQ CODE_13BCFF                           ; $13BCF3 |
  CMP $1CAE                                 ; $13BCF5 |
  BCC CODE_13BD37                           ; $13BCF8 |
  CMP $1CCA                                 ; $13BCFA |
  BCS CODE_13BD37                           ; $13BCFD |

CODE_13BCFF:
  LDA #$0001                                ; $13BCFF |
  STA $A1                                   ; $13BD02 |
  LDA $2C                                   ; $13BD04 |
  BEQ CODE_13BD32                           ; $13BD06 |
  STZ $15                                   ; $13BD08 |
  JSL $138231                               ; $13BD0A |
  REP #$30                                  ; $13BD0E |
  JSR CODE_13FD54                           ; $13BD10 |
  CMP #$007D                                ; $13BD13 |
  BEQ CODE_13BD27                           ; $13BD16 |
  CMP #$007F                                ; $13BD18 |
  BEQ CODE_13BD27                           ; $13BD1B |
  CMP $1C5C                                 ; $13BD1D |
  BEQ CODE_13BD27                           ; $13BD20 |
  CMP $1C5E                                 ; $13BD22 |
  BNE CODE_13BD30                           ; $13BD25 |

CODE_13BD27:
  LDX $1D                                   ; $13BD27 |
  LDA $1CE4                                 ; $13BD29 |
  STA $7F8000,x                             ; $13BD2C |

CODE_13BD30:
  BRA CODE_13BD7F                           ; $13BD30 |

CODE_13BD32:
  LDA $1CF4                                 ; $13BD32 |
  BRA CODE_13BD79                           ; $13BD35 |

CODE_13BD37:
  LDA $2C                                   ; $13BD37 |
  BNE CODE_13BD7F                           ; $13BD39 |
  LDA $12                                   ; $13BD3B |
  CMP $1CF0                                 ; $13BD3D |
  BEQ CODE_13BD5B                           ; $13BD40 |
  CMP $1CF2                                 ; $13BD42 |
  BEQ CODE_13BD5B                           ; $13BD45 |
  CMP $1CF4                                 ; $13BD47 |
  BEQ CODE_13BD5B                           ; $13BD4A |
  CMP $1CF6                                 ; $13BD4C |
  BEQ CODE_13BD5B                           ; $13BD4F |
  CMP $1CF8                                 ; $13BD51 |
  BEQ CODE_13BD5B                           ; $13BD54 |
  CMP $1CFA                                 ; $13BD56 |
  BNE CODE_13BD60                           ; $13BD59 |

CODE_13BD5B:
  LDA $1CF2                                 ; $13BD5B |
  BRA CODE_13BD79                           ; $13BD5E |

CODE_13BD60:
  LDA #$8000                                ; $13BD60 |
  STA $A1                                   ; $13BD63 |
  LDA $12                                   ; $13BD65 |
  CMP $1C28                                 ; $13BD67 |
  BEQ CODE_13BD7F                           ; $13BD6A |
  CMP $1BF6                                 ; $13BD6C |
  BNE CODE_13BD76                           ; $13BD6F |
  LDA $1C28                                 ; $13BD71 |
  BRA CODE_13BD79                           ; $13BD74 |

CODE_13BD76:
  LDA $1CFA                                 ; $13BD76 |

CODE_13BD79:
  LDX $1D                                   ; $13BD79 |
  STA $7F8000,x                             ; $13BD7B |

CODE_13BD7F:
  RTS                                       ; $13BD7F |

  REP #$30                                  ; $13BD80 |
  LDA $28                                   ; $13BD82 |
  BEQ CODE_13BD9B                           ; $13BD84 |
  INC A                                     ; $13BD86 |
  CMP $2A                                   ; $13BD87 |
  BNE CODE_13BDA7                           ; $13BD89 |
  LDA $15                                   ; $13BD8B |
  AND #$0004                                ; $13BD8D |
  BNE CODE_13BD96                           ; $13BD90 |
  LDA $2C                                   ; $13BD92 |
  BEQ CODE_13BD99                           ; $13BD94 |

CODE_13BD96:
  JSR CODE_13C1F0                           ; $13BD96 |

CODE_13BD99:
  BRA CODE_13BDEA                           ; $13BD99 |

CODE_13BD9B:
  JSR CODE_13C175                           ; $13BD9B |
  LDA $15                                   ; $13BD9E |
  AND #$0004                                ; $13BDA0 |
  STA $9B                                   ; $13BDA3 |
  BRA CODE_13BDEA                           ; $13BDA5 |

CODE_13BDA7:
  LDA $2C                                   ; $13BDA7 |
  CMP #$0002                                ; $13BDA9 |
  BCS CODE_13BDE7                           ; $13BDAC |
  ASL A                                     ; $13BDAE |
  STA $00                                   ; $13BDAF |
  LDA $28                                   ; $13BDB1 |
  AND #$0001                                ; $13BDB3 |
  EOR #$0001                                ; $13BDB6 |
  STA $9B                                   ; $13BDB9 |
  ASL A                                     ; $13BDBB |
  ASL A                                     ; $13BDBC |
  ORA $00                                   ; $13BDBD |
  TAY                                       ; $13BDBF |
  LDA $15                                   ; $13BDC0 |
  AND #$0004                                ; $13BDC2 |
  ASL A                                     ; $13BDC5 |
  STA $00                                   ; $13BDC6 |
  TYA                                       ; $13BDC8 |
  ORA $00                                   ; $13BDC9 |
  TAY                                       ; $13BDCB |
  LDA $12                                   ; $13BDCC |
  CMP $1CF4                                 ; $13BDCE |
  BEQ CODE_13BDEA                           ; $13BDD1 |
  CMP $1CF6                                 ; $13BDD3 |
  BEQ CODE_13BDEA                           ; $13BDD6 |
  LDA $BDF7,y                               ; $13BDD8 |
  TAY                                       ; $13BDDB |
  LDX $1D                                   ; $13BDDC |
  LDA $0000,y                               ; $13BDDE |
  STA $7F8000,x                             ; $13BDE1 |
  BRA CODE_13BDEA                           ; $13BDE5 |

CODE_13BDE7:
  JSR CODE_13C15F                           ; $13BDE7 |

CODE_13BDEA:
  LDA $28                                   ; $13BDEA |
  INC A                                     ; $13BDEC |
  INC A                                     ; $13BDED |
  CMP $2A                                   ; $13BDEE |
  BNE CODE_13BDF4                           ; $13BDF0 |
  STZ $9B                                   ; $13BDF2 |

CODE_13BDF4:
  SEP #$30                                  ; $13BDF4 |
  RTL                                       ; $13BDF6 |

  dw $1D42, $1CB2, $1D44, $1CB4             ; $13BDF7 |
  dw $1D3A, $1CB2, $1D3C, $1CB4             ; $13BDFF |

  REP #$30                                  ; $13BE07 |
  LDA $28                                   ; $13BE09 |
  BEQ CODE_13BE22                           ; $13BE0B |
  INC A                                     ; $13BE0D |
  CMP $2A                                   ; $13BE0E |
  BNE CODE_13BE2E                           ; $13BE10 |
  LDA $15                                   ; $13BE12 |
  AND #$0004                                ; $13BE14 |
  BNE CODE_13BE1D                           ; $13BE17 |
  LDA $2C                                   ; $13BE19 |
  BEQ CODE_13BE20                           ; $13BE1B |

CODE_13BE1D:
  JSR CODE_13C1F0                           ; $13BE1D |

CODE_13BE20:
  BRA CODE_13BE63                           ; $13BE20 |

CODE_13BE22:
  JSR CODE_13C175                           ; $13BE22 |
  LDA $15                                   ; $13BE25 |
  AND #$0004                                ; $13BE27 |
  STA $9B                                   ; $13BE2A |
  BRA CODE_13BE63                           ; $13BE2C |

CODE_13BE2E:
  LDA $2C                                   ; $13BE2E |
  CMP #$0002                                ; $13BE30 |
  BCS CODE_13BE60                           ; $13BE33 |
  ASL A                                     ; $13BE35 |
  STA $00                                   ; $13BE36 |
  LDA $15                                   ; $13BE38 |
  AND #$0004                                ; $13BE3A |
  ORA $00                                   ; $13BE3D |
  TAY                                       ; $13BE3F |
  LDA #$0001                                ; $13BE40 |
  STA $9B                                   ; $13BE43 |
  LDA $12                                   ; $13BE45 |
  CMP $1CF4                                 ; $13BE47 |
  BEQ CODE_13BE63                           ; $13BE4A |
  CMP $1CF6                                 ; $13BE4C |
  BEQ CODE_13BE63                           ; $13BE4F |
  LDA $BE70,y                               ; $13BE51 |
  TAY                                       ; $13BE54 |
  LDX $1D                                   ; $13BE55 |
  LDA $0000,y                               ; $13BE57 |
  STA $7F8000,x                             ; $13BE5A |
  BRA CODE_13BE63                           ; $13BE5E |

CODE_13BE60:
  JSR CODE_13C15F                           ; $13BE60 |

CODE_13BE63:
  LDA $28                                   ; $13BE63 |
  INC A                                     ; $13BE65 |
  INC A                                     ; $13BE66 |
  CMP $2A                                   ; $13BE67 |
  BNE CODE_13BE6D                           ; $13BE69 |
  STZ $9B                                   ; $13BE6B |

CODE_13BE6D:
  SEP #$30                                  ; $13BE6D |
  RTL                                       ; $13BE6F |

  dw $1D5A, $1CB2, $1D56, $1CB4             ; $13BE70 |

  REP #$30                                  ; $13BE78 |
  LDA $28                                   ; $13BE7A |
  BEQ CODE_13BE98                           ; $13BE7C |
  INC A                                     ; $13BE7E |
  CMP $2A                                   ; $13BE7F |
  BNE CODE_13BEA4                           ; $13BE81 |
  LDA $15                                   ; $13BE83 |
  AND #$0004                                ; $13BE85 |
  BNE CODE_13BE93                           ; $13BE88 |
  LDA $2C                                   ; $13BE8A |
  BEQ CODE_13BE96                           ; $13BE8C |
  CMP #$0001                                ; $13BE8E |
  BEQ CODE_13BE96                           ; $13BE91 |

CODE_13BE93:
  JSR CODE_13C1F0                           ; $13BE93 |

CODE_13BE96:
  BRA CODE_13BEDA                           ; $13BE96 |

CODE_13BE98:
  JSR CODE_13C175                           ; $13BE98 |
  LDA $15                                   ; $13BE9B |
  AND #$0004                                ; $13BE9D |
  STA $9B                                   ; $13BEA0 |
  BRA CODE_13BEDA                           ; $13BEA2 |

CODE_13BEA4:
  LDA $2C                                   ; $13BEA4 |
  CMP #$0003                                ; $13BEA6 |
  BCS CODE_13BED7                           ; $13BEA9 |
  ASL A                                     ; $13BEAB |
  STA $00                                   ; $13BEAC |
  LDA $15                                   ; $13BEAE |
  AND #$0004                                ; $13BEB0 |
  ASL A                                     ; $13BEB3 |
  ORA $00                                   ; $13BEB4 |
  TAY                                       ; $13BEB6 |
  LDA #$0001                                ; $13BEB7 |
  STA $9B                                   ; $13BEBA |
  LDA $12                                   ; $13BEBC |
  CMP $1CF4                                 ; $13BEBE |
  BEQ CODE_13BEDA                           ; $13BEC1 |
  CMP $1CF6                                 ; $13BEC3 |
  BEQ CODE_13BEDA                           ; $13BEC6 |
  LDA $BEE7,y                               ; $13BEC8 |
  TAY                                       ; $13BECB |
  LDX $1D                                   ; $13BECC |
  LDA $0000,y                               ; $13BECE |
  STA $7F8000,x                             ; $13BED1 |
  BRA CODE_13BEDA                           ; $13BED5 |

CODE_13BED7:
  JSR CODE_13C15F                           ; $13BED7 |

CODE_13BEDA:
  LDA $28                                   ; $13BEDA |
  INC A                                     ; $13BEDC |
  INC A                                     ; $13BEDD |
  CMP $2A                                   ; $13BEDE |
  BNE CODE_13BEE4                           ; $13BEE0 |
  STZ $9B                                   ; $13BEE2 |

CODE_13BEE4:
  SEP #$30                                  ; $13BEE4 |
  RTL                                       ; $13BEE6 |

  dw $1D50, $1D52, $1CB2, $0000             ; $13BEE7 |
  dw $1D4A, $1D4C, $1CB4                    ; $13BEEF |

  REP #$30                                  ; $13BEF5 |
  LDX $1D                                   ; $13BEF7 |
  LDA $15                                   ; $13BEF9 |
  AND #$0020                                ; $13BEFB |
  LSR A                                     ; $13BEFE |
  STA $02                                   ; $13BEFF |
  LDA $28                                   ; $13BF01 |
  BEQ CODE_13BF38                           ; $13BF03 |
  INC A                                     ; $13BF05 |
  CMP $2A                                   ; $13BF06 |
  BNE CODE_13BF45                           ; $13BF08 |
  LDA $02                                   ; $13BF0A |
  BEQ CODE_13BF14                           ; $13BF0C |
  LDA $2C                                   ; $13BF0E |
  BNE CODE_13BF14                           ; $13BF10 |
  DEC $2E                                   ; $13BF12 |

CODE_13BF14:
  LDA $2C                                   ; $13BF14 |
  INC A                                     ; $13BF16 |
  CMP $2E                                   ; $13BF17 |
  BEQ CODE_13BF23                           ; $13BF19 |
  JSR CODE_13C1F0                           ; $13BF1B |
  STZ $A1                                   ; $13BF1E |
  JMP CODE_13BFF2                           ; $13BF20 |

CODE_13BF23:
  LDA $A1                                   ; $13BF23 |
  BNE CODE_13BF35                           ; $13BF25 |
  LDA $12                                   ; $13BF27 |
  CMP $1C04                                 ; $13BF29 |
  BNE CODE_13BF35                           ; $13BF2C |
  LDA $1C1E                                 ; $13BF2E |
  STA $7F8000,x                             ; $13BF31 |

CODE_13BF35:
  JMP CODE_13BFF2                           ; $13BF35 |

CODE_13BF38:
  LDA $2C                                   ; $13BF38 |
  INC A                                     ; $13BF3A |
  CMP $2E                                   ; $13BF3B |
  BCS CODE_13BF42                           ; $13BF3D |
  JSR CODE_13C175                           ; $13BF3F |

CODE_13BF42:
  JMP CODE_13BFF2                           ; $13BF42 |

CODE_13BF45:
  LDA $02                                   ; $13BF45 |
  BEQ CODE_13BF62                           ; $13BF47 |
  LDA $2C                                   ; $13BF49 |
  BNE CODE_13BF62                           ; $13BF4B |
  LDA $28                                   ; $13BF4D |
  CMP #$0001                                ; $13BF4F |
  BEQ CODE_13BF62                           ; $13BF52 |
  DEC $2E                                   ; $13BF54 |
  LDA $2E                                   ; $13BF56 |
  CMP #$0002                                ; $13BF58 |
  BNE CODE_13BF62                           ; $13BF5B |
  LDA #$0002                                ; $13BF5D |
  BRA CODE_13BF8D                           ; $13BF60 |

CODE_13BF62:
  LDA $28                                   ; $13BF62 |
  INC A                                     ; $13BF64 |
  INC A                                     ; $13BF65 |
  CMP $2A                                   ; $13BF66 |
  BNE CODE_13BF83                           ; $13BF68 |
  LDA $2C                                   ; $13BF6A |
  BNE CODE_13BF83                           ; $13BF6C |
  LDA $2E                                   ; $13BF6E |
  CMP #$0003                                ; $13BF70 |
  BCS CODE_13BF83                           ; $13BF73 |
  DEC $2A                                   ; $13BF75 |
  LDA $2A                                   ; $13BF77 |
  CMP #$0002                                ; $13BF79 |
  BEQ CODE_13BF8D                           ; $13BF7C |
  LDA #$0001                                ; $13BF7E |
  BRA CODE_13BF8D                           ; $13BF81 |

CODE_13BF83:
  LDA $2C                                   ; $13BF83 |
  INC A                                     ; $13BF85 |
  INC A                                     ; $13BF86 |
  CMP $2E                                   ; $13BF87 |
  BCC CODE_13BFDE                           ; $13BF89 |
  LDA $2E                                   ; $13BF8B |

CODE_13BF8D:
  CLC                                       ; $13BF8D |
  SBC $2C                                   ; $13BF8E |
  BMI CODE_13BFF2                           ; $13BF90 |
  ASL A                                     ; $13BF92 |
  STA $00                                   ; $13BF93 |
  LDA $28                                   ; $13BF95 |
  AND #$0001                                ; $13BF97 |
  EOR #$0001                                ; $13BF9A |
  ASL A                                     ; $13BF9D |
  ASL A                                     ; $13BF9E |
  ASL A                                     ; $13BF9F |
  ORA $00                                   ; $13BFA0 |
  ORA $02                                   ; $13BFA2 |
  STA $00                                   ; $13BFA4 |
  TAY                                       ; $13BFA6 |
  LDA !r_header_bg1_tileset                 ; $13BFA7 |
  CMP #$0008                                ; $13BFAA |
  BNE CODE_13BFB6                           ; $13BFAD |
  LDA $C015,y                               ; $13BFAF |
  BEQ CODE_13BFF2                           ; $13BFB2 |
  BRA CODE_13BFB9                           ; $13BFB4 |

CODE_13BFB6:
  LDA $BFF5,y                               ; $13BFB6 |

CODE_13BFB9:
  TAY                                       ; $13BFB9 |
  LDA $0000,y                               ; $13BFBA |
  CMP $1C1E                                 ; $13BFBD |
  BNE CODE_13BFCE                           ; $13BFC0 |
  LDA $12                                   ; $13BFC2 |
  CMP $1C18                                 ; $13BFC4 |
  BEQ CODE_13BFCE                           ; $13BFC7 |
  CMP $1C04                                 ; $13BFC9 |
  BNE CODE_13BFF2                           ; $13BFCC |

CODE_13BFCE:
  LDA $0000,y                               ; $13BFCE |
  STA $7F8000,x                             ; $13BFD1 |
  LDA $00                                   ; $13BFD5 |
  AND #$0008                                ; $13BFD7 |
  STA $A1                                   ; $13BFDA |
  BRA CODE_13BFF2                           ; $13BFDC |

CODE_13BFDE:
  JSR CODE_13C15F                           ; $13BFDE |
  LDA $02                                   ; $13BFE1 |
  BNE CODE_13BFF2                           ; $13BFE3 |
  LDA $2C                                   ; $13BFE5 |
  BNE CODE_13BFF2                           ; $13BFE7 |
  LDA $28                                   ; $13BFE9 |
  AND #$0001                                ; $13BFEB |
  BNE CODE_13BFF2                           ; $13BFEE |
  DEC $2E                                   ; $13BFF0 |

CODE_13BFF2:
  SEP #$30                                  ; $13BFF2 |
  RTL                                       ; $13BFF4 |

  dw $1C1E, $1D6C, $1CB2, $0000             ; $13BFF5 |
  dw $1D72, $1CB4, $0000, $0000             ; $13BFFD |
  dw $1C1E, $1D82, $1CB2, $0000             ; $13C005 |
  dw $1C1E, $1D82, $1CB4, $0000             ; $13C00D |
  dw $0000, $C035, $1CB2, $0000             ; $13C015 |
  dw $C037, $1CB4, $0000, $0000             ; $13C01D |
  dw $0000, $C039, $1CB2, $0000             ; $13C025 |
  dw $0000, $C039, $1CB4, $0000             ; $13C02D |

  dw $5703, $5903, $5D04                    ; $13C035 |

  REP #$30                                  ; $13C03B |
  LDA $15                                   ; $13C03D |
  AND #$0002                                ; $13C03F |
  ASL A                                     ; $13C042 |
  ASL A                                     ; $13C043 |
  ASL A                                     ; $13C044 |
  STA $02                                   ; $13C045 |
  LDA $28                                   ; $13C047 |
  BEQ CODE_13C081                           ; $13C049 |
  INC A                                     ; $13C04B |
  CMP $2A                                   ; $13C04C |
  BNE CODE_13C095                           ; $13C04E |
  LDA $2C                                   ; $13C050 |
  BNE CODE_13C056                           ; $13C052 |
  INC $2E                                   ; $13C054 |

CODE_13C056:
  LDA $2C                                   ; $13C056 |
  INC A                                     ; $13C058 |
  CMP $2E                                   ; $13C059 |
  BEQ CODE_13C07E                           ; $13C05B |
  INC A                                     ; $13C05D |
  CMP $2E                                   ; $13C05E |
  BEQ CODE_13C06A                           ; $13C060 |
  JSR CODE_13C1F0                           ; $13C062 |
  STZ $A1                                   ; $13C065 |
  JMP CODE_13C116                           ; $13C067 |

CODE_13C06A:
  LDA $A1                                   ; $13C06A |
  BNE CODE_13C07E                           ; $13C06C |
  LDA $12                                   ; $13C06E |
  CMP $1C04                                 ; $13C070 |
  BNE CODE_13C07E                           ; $13C073 |
  LDX $1D                                   ; $13C075 |
  LDA $1C1E                                 ; $13C077 |
  STA $7F8000,x                             ; $13C07A |

CODE_13C07E:
  JMP CODE_13C116                           ; $13C07E |

CODE_13C081:
  LDA $2E                                   ; $13C081 |
  CMP #$0001                                ; $13C083 |
  BEQ CODE_13C092                           ; $13C086 |
  LDA $2C                                   ; $13C088 |
  INC A                                     ; $13C08A |
  CMP $2E                                   ; $13C08B |
  BEQ CODE_13C092                           ; $13C08D |
  JSR CODE_13C175                           ; $13C08F |

CODE_13C092:
  JMP CODE_13C116                           ; $13C092 |

CODE_13C095:
  LDA $02                                   ; $13C095 |
  BNE CODE_13C0A0                           ; $13C097 |
  LDA $28                                   ; $13C099 |
  AND #$0001                                ; $13C09B |
  BNE CODE_13C0A6                           ; $13C09E |

CODE_13C0A0:
  LDA $2C                                   ; $13C0A0 |
  BNE CODE_13C0A6                           ; $13C0A2 |
  INC $2E                                   ; $13C0A4 |

CODE_13C0A6:
  LDA $2C                                   ; $13C0A6 |
  INC A                                     ; $13C0A8 |
  INC A                                     ; $13C0A9 |
  CMP $2E                                   ; $13C0AA |
  BCC CODE_13C113                           ; $13C0AC |
  LDA $2E                                   ; $13C0AE |
  SEC                                       ; $13C0B0 |
  SBC $2C                                   ; $13C0B1 |
  BMI CODE_13C116                           ; $13C0B3 |
  ASL A                                     ; $13C0B5 |
  STA $00                                   ; $13C0B6 |
  LDA $28                                   ; $13C0B8 |
  AND #$0001                                ; $13C0BA |
  EOR #$0001                                ; $13C0BD |
  ASL A                                     ; $13C0C0 |
  ASL A                                     ; $13C0C1 |
  ASL A                                     ; $13C0C2 |
  ORA $00                                   ; $13C0C3 |
  ORA $02                                   ; $13C0C5 |
  TAY                                       ; $13C0C7 |
  LDX $1D                                   ; $13C0C8 |
  LDA !r_header_bg1_tileset                 ; $13C0CA |
  CMP #$0008                                ; $13C0CD |
  BNE CODE_13C0D9                           ; $13C0D0 |
  LDA $C139,y                               ; $13C0D2 |
  BEQ CODE_13C116                           ; $13C0D5 |
  BRA CODE_13C0DC                           ; $13C0D7 |

CODE_13C0D9:
  LDA $C119,y                               ; $13C0D9 |

CODE_13C0DC:
  TAY                                       ; $13C0DC |
  LDA $0000,y                               ; $13C0DD |
  CMP $1C1C                                 ; $13C0E0 |
  BNE CODE_13C0F8                           ; $13C0E3 |
  LDA $12                                   ; $13C0E5 |
  CMP $1C04                                 ; $13C0E7 |
  BEQ CODE_13C0F8                           ; $13C0EA |
  CMP $1BFA                                 ; $13C0EC |
  BEQ CODE_13C101                           ; $13C0EF |
  CMP $1C02                                 ; $13C0F1 |
  BEQ CODE_13C10A                           ; $13C0F4 |
  BRA CODE_13C116                           ; $13C0F6 |

CODE_13C0F8:
  LDA $0000,y                               ; $13C0F8 |
  STA $7F8000,x                             ; $13C0FB |
  BRA CODE_13C116                           ; $13C0FF |

CODE_13C101:
  LDA $1C2E                                 ; $13C101 |
  STA $7F8000,x                             ; $13C104 |
  BRA CODE_13C116                           ; $13C108 |

CODE_13C10A:
  LDA $1C30                                 ; $13C10A |
  STA $7F8000,x                             ; $13C10D |
  BRA CODE_13C116                           ; $13C111 |

CODE_13C113:
  JSR CODE_13C15F                           ; $13C113 |

CODE_13C116:
  SEP #$30                                  ; $13C116 |
  RTL                                       ; $13C118 |

  dw $1C1C, $1D60, $1CB2, $0000             ; $13C119 |
  dw $1C1C, $1C1C, $1D66, $1CB4             ; $13C121 |
  dw $1C1C, $1C1C, $1D78, $1CB2             ; $13C129 |
  dw $1C1C, $1C1C, $1D78, $1CB4             ; $13C131 |
  dw $0000, $C159, $1CB2, $0000             ; $13C139 |
  dw $0000, $0000, $C15B, $1CB4             ; $13C141 |
  dw $0000, $0000, $C15D, $1CB2             ; $13C149 |
  dw $0000, $0000, $C15D, $1CB4             ; $13C151 |

  dw $5303, $5503, $5B05                    ; $13C159 |

CODE_13C15F:
  JSL $128875                               ; $13C15F |
  AND #$0007                                ; $13C163 |
  ASL A                                     ; $13C166 |
  TAY                                       ; $13C167 |
  LDX $8121,y                               ; $13C168 |
  LDA $0000,x                               ; $13C16B |
  LDX $1D                                   ; $13C16E |
  STA $7F8000,x                             ; $13C170 |
  RTS                                       ; $13C174 |

CODE_13C175:
  LDA $12                                   ; $13C175 |
  AND #$FF00                                ; $13C177 |
  CMP $1BE0                                 ; $13C17A |
  BNE CODE_13C193                           ; $13C17D |
  LDA $12                                   ; $13C17F |
  AND #$00FF                                ; $13C181 |
  ASL A                                     ; $13C184 |
  TAY                                       ; $13C185 |
  LDA $C194,y                               ; $13C186 |
  TAY                                       ; $13C189 |
  LDX $1D                                   ; $13C18A |
  LDA $0000,y                               ; $13C18C |
  STA $7F8000,x                             ; $13C18F |

CODE_13C193:
  RTS                                       ; $13C193 |

  dw $1BE0, $1BEE, $1BEA, $1C36             ; $13C194 |
  dw $1C3A, $1BEA, $1C38, $1BEE             ; $13C19C |
  dw $1BF0, $1BE0, $1BFE, $1C02             ; $13C1A4 |
  dw $1BE0, $1BFA, $1C38, $1BFE             ; $13C1AC |
  dw $1C3A, $1C02, $1BFA, $1C06             ; $13C1B4 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $13C1BC |
  dw $1C10, $1C12, $1C14, $1C16             ; $13C1C4 |
  dw $1C32, $1BEE, $1C2E, $1C1E             ; $13C1CC |
  dw $1C20, $1C22, $1C24, $1C26             ; $13C1D4 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $13C1DC |
  dw $1C30, $1C32, $1C34, $1C36             ; $13C1E4 |
  dw $1C38, $1C3A                           ; $13C1EC |

CODE_13C1F0:
  LDA $12                                   ; $13C1F0 |
  AND #$FF00                                ; $13C1F2 |
  CMP $1BE0                                 ; $13C1F5 |
  BNE CODE_13C20E                           ; $13C1F8 |
  LDA $12                                   ; $13C1FA |
  AND #$00FF                                ; $13C1FC |
  ASL A                                     ; $13C1FF |
  TAY                                       ; $13C200 |
  LDA $C20F,y                               ; $13C201 |
  TAY                                       ; $13C204 |
  LDA $0000,y                               ; $13C205 |
  LDX $1D                                   ; $13C208 |
  STA $7F8000,x                             ; $13C20A |

CODE_13C20E:
  RTS                                       ; $13C20E |

  dw $1BE0, $1BE8, $1BEC, $1C34             ; $13C20F |
  dw $1BE8, $1C38, $1BEC, $1C3A             ; $13C217 |
  dw $1BE0, $1BF2, $1BFC, $1C00             ; $13C21F |
  dw $1BF8, $1BE0, $1BFC, $1C38             ; $13C227 |
  dw $1C00, $1C3A, $1BF8, $1C06             ; $13C22F |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $13C237 |
  dw $1C10, $1C12, $1C14, $1C16             ; $13C23F |
  dw $1BF8, $1C00, $1C1C, $1C1E             ; $13C247 |
  dw $1C20, $1C22, $1C24, $1C26             ; $13C24F |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $13C257 |
  dw $1C30, $1BE0, $1C34, $1C36             ; $13C25F |
  dw $1C38, $1C3A                           ; $13C267 |

  dw $151E, $151F, $1520, $0000             ; $13C26B |

  REP #$30                                  ; $13C273 |
  LDY #$0000                                ; $13C275 |
  LDA $28                                   ; $13C278 |
  BEQ CODE_13C285                           ; $13C27A |
  INY                                       ; $13C27C |
  INY                                       ; $13C27D |
  INC A                                     ; $13C27E |
  CMP $2A                                   ; $13C27F |
  BNE CODE_13C285                           ; $13C281 |
  INY                                       ; $13C283 |
  INY                                       ; $13C284 |

CODE_13C285:
  LDA $C26B,y                               ; $13C285 |
  LDX $1D                                   ; $13C288 |
  STA $7F8000,x                             ; $13C28A |
  SEP #$30                                  ; $13C28E |
  RTL                                       ; $13C290 |

  REP #$30                                  ; $13C291 |
  LDA $28                                   ; $13C293 |
  AND #$0001                                ; $13C295 |
  STA $00                                   ; $13C298 |
  LDA $2C                                   ; $13C29A |
  AND #$0001                                ; $13C29C |
  ASL A                                     ; $13C29F |
  ADC $00                                   ; $13C2A0 |
  CLC                                       ; $13C2A2 |
  ADC #$8900                                ; $13C2A3 |
  LDX $1D                                   ; $13C2A6 |
  STA $7F8000,x                             ; $13C2A8 |
  SEP #$30                                  ; $13C2AC |
  RTL                                       ; $13C2AE |

  REP #$30                                  ; $13C2AF |
  JSR CODE_13C15F                           ; $13C2B1 |
  LDA $28                                   ; $13C2B4 |
  BNE CODE_13C2BF                           ; $13C2B6 |
  LDA $2C                                   ; $13C2B8 |
  BNE CODE_13C2BF                           ; $13C2BA |
  JSR CODE_13C539                           ; $13C2BC |

CODE_13C2BF:
  LDA $28                                   ; $13C2BF |
  BNE CODE_13C2C6                           ; $13C2C1 |
  JSR CODE_13C570                           ; $13C2C3 |

CODE_13C2C6:
  LDA $28                                   ; $13C2C6 |
  BNE CODE_13C2D4                           ; $13C2C8 |
  LDA $2C                                   ; $13C2CA |
  INC A                                     ; $13C2CC |
  CMP $2E                                   ; $13C2CD |
  BNE CODE_13C2D4                           ; $13C2CF |
  JSR CODE_13C58E                           ; $13C2D1 |

CODE_13C2D4:
  LDA $2C                                   ; $13C2D4 |
  BNE CODE_13C2DB                           ; $13C2D6 |
  JSR CODE_13C5C5                           ; $13C2D8 |

CODE_13C2DB:
  LDA $2C                                   ; $13C2DB |
  INC A                                     ; $13C2DD |
  CMP $2E                                   ; $13C2DE |
  BNE CODE_13C2E5                           ; $13C2E0 |
  JSR CODE_13C5EC                           ; $13C2E2 |

CODE_13C2E5:
  LDA $2C                                   ; $13C2E5 |
  BNE CODE_13C2F3                           ; $13C2E7 |
  LDA $28                                   ; $13C2E9 |
  INC A                                     ; $13C2EB |
  CMP $2A                                   ; $13C2EC |
  BNE CODE_13C2F3                           ; $13C2EE |
  JSR CODE_13C613                           ; $13C2F0 |

CODE_13C2F3:
  LDA $28                                   ; $13C2F3 |
  INC A                                     ; $13C2F5 |
  CMP $2A                                   ; $13C2F6 |
  BNE CODE_13C2FD                           ; $13C2F8 |
  JSR CODE_13C64D                           ; $13C2FA |

CODE_13C2FD:
  LDA $28                                   ; $13C2FD |
  INC A                                     ; $13C2FF |
  CMP $2A                                   ; $13C300 |
  BNE CODE_13C30E                           ; $13C302 |
  LDA $2C                                   ; $13C304 |
  INC A                                     ; $13C306 |
  CMP $2E                                   ; $13C307 |
  BNE CODE_13C30E                           ; $13C309 |
  JSR CODE_13C66B                           ; $13C30B |

CODE_13C30E:
  SEP #$30                                  ; $13C30E |
  RTL                                       ; $13C310 |

  dw $1BE0, $1BE2, $1BE4, $1BE6             ; $13C311 |
  dw $1BE8, $1BEA, $1BEC, $1BEE             ; $13C319 |
  dw $1BF0, $1BF2, $1BF4, $1BF6             ; $13C321 |
  dw $1BF8, $1BFA, $1BEC, $1BFE             ; $13C329 |
  dw $1C00, $1C02, $1C04, $1C06             ; $13C331 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $13C339 |
  dw $1C10, $1C12, $1C14, $1C16             ; $13C341 |
  dw $1C18, $1C1A, $1C1C, $1C1E             ; $13C349 |
  dw $1C20, $1C22, $1C24, $1C26             ; $13C351 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $13C359 |
  dw $1C30, $1C32, $1C34, $1C36             ; $13C361 |
  dw $1C38, $1C3A, $1BE0, $1BE2             ; $13C369 |
  dw $1BE4, $1BE6, $1BE8, $1BEA             ; $13C371 |
  dw $1BEC, $1BEE, $1BF0, $1BF2             ; $13C379 |
  dw $1BF4, $1BF6, $1BF8, $1BFA             ; $13C381 |
  dw $1BFC, $1BFE, $1C00, $1C02             ; $13C389 |
  dw $1C04, $1C06, $1C08, $1C0A             ; $13C391 |
  dw $1C0C, $1C0E, $1C10, $1C12             ; $13C399 |
  dw $1C14, $1C16, $1C18, $1BE2             ; $13C3A1 |
  dw $1C1C, $1C1E, $1C20, $1C22             ; $13C3A9 |
  dw $1C24, $1C26, $1C28, $1C2A             ; $13C3B1 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $13C3B9 |
  dw $1C34, $1C36, $1C38, $1C3A             ; $13C3C1 |
  dw $1C3A, $1BE2, $1BE6, $1BE6             ; $13C3C9 |
  dw $1BE8, $1C36, $1C34, $1BEE             ; $13C3D1 |
  dw $1BEE, $1BE8, $1BE6, $1BF6             ; $13C3D9 |
  dw $1C00, $1C02, $1C34, $1C36             ; $13C3E1 |
  dw $1C00, $1C02, $1BF6, $1C06             ; $13C3E9 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $13C3F1 |
  dw $1C10, $1C12, $1C14, $1C16             ; $13C3F9 |
  dw $1C1A, $1C1A, $1C1C, $1C1E             ; $13C401 |
  dw $1C20, $1C22, $1C24, $1C26             ; $13C409 |
  dw $1C28, $1C2A, $1C2C, $1C30             ; $13C411 |
  dw $1C30, $1BEE, $1C34, $1C36             ; $13C419 |
  dw $1C38, $1C3A, $1C38, $1BE6             ; $13C421 |
  dw $1BE4, $1BE6, $1C34, $1BEA             ; $13C429 |
  dw $1BEC, $1C36, $1BEA, $1BEC             ; $13C431 |
  dw $1BF4, $1BE6, $1BFC, $1BFE             ; $13C439 |
  dw $1BFC, $1BFE, $1C34, $1C36             ; $13C441 |
  dw $1BF4, $1C06, $1C08, $1C0A             ; $13C449 |
  dw $1C0C, $1C0E, $1C10, $1C12             ; $13C451 |
  dw $1C14, $1C16, $1BF4, $1BE6             ; $13C459 |
  dw $1BF4, $1BF4, $1C20, $1C22             ; $13C461 |
  dw $1C24, $1C26, $1C28, $1C2A             ; $13C469 |
  dw $1C2C, $1BFE, $1C36, $1BFE             ; $13C471 |
  dw $1C34, $1C36, $1C38, $1C3A             ; $13C479 |
  dw $1BE0, $1BE2, $1BE4, $1BE6             ; $13C481 |
  dw $1BE8, $1BEA, $1BEC, $1BEE             ; $13C489 |
  dw $1BF0, $1BF2, $1BE4, $1BF6             ; $13C491 |
  dw $1BF8, $1BFA, $1BFC, $1BEA             ; $13C499 |
  dw $1C00, $1C02, $1C04, $1C06             ; $13C4A1 |
  dw $1C08, $1C0A, $1C0C, $1C0E             ; $13C4A9 |
  dw $1C10, $1C12, $1C14, $1C16             ; $13C4B1 |
  dw $1C18, $1C1A, $1C1C, $1C1E             ; $13C4B9 |
  dw $1C20, $1C22, $1C24, $1C26             ; $13C4C1 |
  dw $1C28, $1C2A, $1C2C, $1C2E             ; $13C4C9 |
  dw $1C30, $1C32, $1C34, $1C36             ; $13C4D1 |
  dw $1C38, $1C3A, $1BE0, $1BE2             ; $13C4D9 |
  dw $1BE4, $1BE6, $1BE8, $1BEA             ; $13C4E1 |
  dw $1BEC, $1BEE, $1BF0, $1BF2             ; $13C4E9 |
  dw $1BF4, $1C1A, $1BF8, $1C32             ; $13C4F1 |
  dw $1BFC, $1BFE, $1C00, $1BEE             ; $13C4F9 |
  dw $1C18, $1C06, $1C08, $1C0A             ; $13C501 |
  dw $1C0C, $1C0E, $1C10, $1C12             ; $13C509 |
  dw $1C14, $1C16, $1C18, $1C1A             ; $13C511 |
  dw $1C1C, $1C1E, $1C20, $1C22             ; $13C519 |
  dw $1C24, $1C26, $1C28, $1C2A             ; $13C521 |
  dw $1C2C, $1C2E, $1C30, $1C32             ; $13C529 |
  dw $1C34, $1C36, $1C38, $1C3A             ; $13C531 |

CODE_13C539:
  LDA $1B                                   ; $13C539 |
  TAX                                       ; $13C53B |
  AND #$F0F0                                ; $13C53C |
  STA $00                                   ; $13C53F |
  TXA                                       ; $13C541 |
  AND #$0F0F                                ; $13C542 |
  DEC A                                     ; $13C545 |
  AND #$0F0F                                ; $13C546 |
  ORA $00                                   ; $13C549 |
  STA $0E                                   ; $13C54B |
  JSL $128719                               ; $13C54D |
  LDA $7F8000,x                             ; $13C551 |
  TAY                                       ; $13C555 |
  AND #$FF00                                ; $13C556 |
  CMP $1BE0                                 ; $13C559 |
  BNE CODE_13C56F                           ; $13C55C |
  TYA                                       ; $13C55E |
  AND #$00FF                                ; $13C55F |
  ASL A                                     ; $13C562 |
  TAY                                       ; $13C563 |
  LDA $C311,y                               ; $13C564 |
  TAY                                       ; $13C567 |
  LDA $0000,y                               ; $13C568 |
  STA $7F8000,x                             ; $13C56B |

CODE_13C56F:
  RTS                                       ; $13C56F |

CODE_13C570:
  JSR CODE_13FD54                           ; $13C570 |
  TAY                                       ; $13C573 |
  AND #$FF00                                ; $13C574 |
  CMP $1BE0                                 ; $13C577 |
  BNE CODE_13C58D                           ; $13C57A |
  TYA                                       ; $13C57C |
  AND #$00FF                                ; $13C57D |
  ASL A                                     ; $13C580 |
  TAY                                       ; $13C581 |
  LDA $C194,y                               ; $13C582 |
  TAY                                       ; $13C585 |
  LDA $0000,y                               ; $13C586 |
  STA $7F8000,x                             ; $13C589 |

CODE_13C58D:
  RTS                                       ; $13C58D |

CODE_13C58E:
  LDA $1B                                   ; $13C58E |
  TAX                                       ; $13C590 |
  AND #$F0F0                                ; $13C591 |
  STA $00                                   ; $13C594 |
  TXA                                       ; $13C596 |
  AND #$0F0F                                ; $13C597 |
  DEC A                                     ; $13C59A |
  AND #$0F0F                                ; $13C59B |
  ORA $00                                   ; $13C59E |
  STA $0E                                   ; $13C5A0 |
  JSL $12875D                               ; $13C5A2 |
  LDA $7F8000,x                             ; $13C5A6 |
  TAY                                       ; $13C5AA |
  AND #$FF00                                ; $13C5AB |
  CMP $1BE0                                 ; $13C5AE |
  BNE CODE_13C5C4                           ; $13C5B1 |
  TYA                                       ; $13C5B3 |
  AND #$00FF                                ; $13C5B4 |
  ASL A                                     ; $13C5B7 |
  TAY                                       ; $13C5B8 |
  LDA $C36D,y                               ; $13C5B9 |
  TAY                                       ; $13C5BC |
  LDA $0000,y                               ; $13C5BD |
  STA $7F8000,x                             ; $13C5C0 |

CODE_13C5C4:
  RTS                                       ; $13C5C4 |

CODE_13C5C5:
  LDA $1B                                   ; $13C5C5 |
  STA $0E                                   ; $13C5C7 |
  JSL $128719                               ; $13C5C9 |
  LDA $7F8000,x                             ; $13C5CD |
  TAY                                       ; $13C5D1 |
  AND #$FF00                                ; $13C5D2 |
  CMP $1BE0                                 ; $13C5D5 |
  BNE CODE_13C5EB                           ; $13C5D8 |
  TYA                                       ; $13C5DA |
  AND #$00FF                                ; $13C5DB |
  ASL A                                     ; $13C5DE |
  TAY                                       ; $13C5DF |
  LDA $C3C9,y                               ; $13C5E0 |
  TAY                                       ; $13C5E3 |
  LDA $0000,y                               ; $13C5E4 |
  STA $7F8000,x                             ; $13C5E7 |

CODE_13C5EB:
  RTS                                       ; $13C5EB |

CODE_13C5EC:
  LDA $1B                                   ; $13C5EC |
  STA $0E                                   ; $13C5EE |
  JSL $12875D                               ; $13C5F0 |
  LDA $7F8000,x                             ; $13C5F4 |
  TAY                                       ; $13C5F8 |
  AND #$FF00                                ; $13C5F9 |
  CMP $1BE0                                 ; $13C5FC |
  BNE CODE_13C612                           ; $13C5FF |
  TYA                                       ; $13C601 |
  AND #$00FF                                ; $13C602 |
  ASL A                                     ; $13C605 |
  TAY                                       ; $13C606 |
  LDA $C425,y                               ; $13C607 |
  TAY                                       ; $13C60A |
  LDA $0000,y                               ; $13C60B |
  STA $7F8000,x                             ; $13C60E |

CODE_13C612:
  RTS                                       ; $13C612 |

CODE_13C613:
  LDA $1B                                   ; $13C613 |
  TAX                                       ; $13C615 |
  AND #$F0F0                                ; $13C616 |
  STA $00                                   ; $13C619 |
  TXA                                       ; $13C61B |
  AND #$0F0F                                ; $13C61C |
  ORA #$00F0                                ; $13C61F |
  INC A                                     ; $13C622 |
  AND #$0F0F                                ; $13C623 |
  ORA $00                                   ; $13C626 |
  STA $0E                                   ; $13C628 |
  JSL $128719                               ; $13C62A |
  LDA $7F8000,x                             ; $13C62E |
  TAY                                       ; $13C632 |
  AND #$FF00                                ; $13C633 |
  CMP $1BE0                                 ; $13C636 |
  BNE CODE_13C64C                           ; $13C639 |
  TYA                                       ; $13C63B |
  AND #$00FF                                ; $13C63C |
  ASL A                                     ; $13C63F |
  TAY                                       ; $13C640 |
  LDA $C481,y                               ; $13C641 |
  TAY                                       ; $13C644 |
  LDA $0000,y                               ; $13C645 |
  STA $7F8000,x                             ; $13C648 |

CODE_13C64C:
  RTS                                       ; $13C64C |

CODE_13C64D:
  JSR CODE_13FD61                           ; $13C64D |
  TAY                                       ; $13C650 |
  AND #$FF00                                ; $13C651 |
  CMP $1BE0                                 ; $13C654 |
  BNE CODE_13C66A                           ; $13C657 |
  TYA                                       ; $13C659 |
  AND #$00FF                                ; $13C65A |
  ASL A                                     ; $13C65D |
  TAY                                       ; $13C65E |
  LDA $C20F,y                               ; $13C65F |
  TAY                                       ; $13C662 |
  LDA $0000,y                               ; $13C663 |
  STA $7F8000,x                             ; $13C666 |

CODE_13C66A:
  RTS                                       ; $13C66A |

CODE_13C66B:
  LDA $1B                                   ; $13C66B |
  TAX                                       ; $13C66D |
  AND #$F0F0                                ; $13C66E |
  STA $00                                   ; $13C671 |
  TXA                                       ; $13C673 |
  AND #$0F0F                                ; $13C674 |
  ORA #$00F0                                ; $13C677 |
  INC A                                     ; $13C67A |
  AND #$0F0F                                ; $13C67B |
  ORA $00                                   ; $13C67E |
  STA $0E                                   ; $13C680 |
  JSL $12875D                               ; $13C682 |
  LDA $7F8000,x                             ; $13C686 |
  TAY                                       ; $13C68A |
  AND #$FF00                                ; $13C68B |
  CMP $1BE0                                 ; $13C68E |
  BNE CODE_13C6A4                           ; $13C691 |
  TYA                                       ; $13C693 |
  AND #$00FF                                ; $13C694 |
  ASL A                                     ; $13C697 |
  TAY                                       ; $13C698 |
  LDA $C4DD,y                               ; $13C699 |
  TAY                                       ; $13C69C |
  LDA $0000,y                               ; $13C69D |
  STA $7F8000,x                             ; $13C6A0 |

CODE_13C6A4:
  RTS                                       ; $13C6A4 |

  REP #$30                                  ; $13C6A5 |
  JSL $128875                               ; $13C6A7 |
  AND #$003F                                ; $13C6AB |
  CMP #$000B                                ; $13C6AE |
  BCC CODE_13C6B8                           ; $13C6B1 |
  LDA #$79E0                                ; $13C6B3 |
  BRA CODE_13C6BC                           ; $13C6B6 |

CODE_13C6B8:
  CLC                                       ; $13C6B8 |
  ADC #$79BB                                ; $13C6B9 |

CODE_13C6BC:
  LDX $1D                                   ; $13C6BC |
  STA $7F8000,x                             ; $13C6BE |
  SEP #$30                                  ; $13C6C2 |
  RTL                                       ; $13C6C4 |

  dw $6000, $7400                           ; $13C6C5 |

  REP #$30                                  ; $13C6C9 |
  LDX $1D                                   ; $13C6CB |
  JSL $01E501                               ; $13C6CD |
  BNE CODE_13C6E0                           ; $13C6D1 |
  LDA $15                                   ; $13C6D3 |
  AND #$0002                                ; $13C6D5 |
  TAY                                       ; $13C6D8 |
  LDA $C6C5,y                               ; $13C6D9 |
  STA $7F8000,x                             ; $13C6DC |

CODE_13C6E0:
  SEP #$30                                  ; $13C6E0 |
  RTL                                       ; $13C6E2 |

  REP #$30                                  ; $13C6E3 |
  LDX $1D                                   ; $13C6E5 |
  LDY #$0000                                ; $13C6E7 |
  LDA $28                                   ; $13C6EA |
  BEQ CODE_13C6F7                           ; $13C6EC |
  INY                                       ; $13C6EE |
  INY                                       ; $13C6EF |
  INC A                                     ; $13C6F0 |
  CMP $2A                                   ; $13C6F1 |
  BNE CODE_13C6F7                           ; $13C6F3 |
  INY                                       ; $13C6F5 |
  INY                                       ; $13C6F6 |

CODE_13C6F7:
  LDA $2C                                   ; $13C6F7 |
  BEQ CODE_13C702                           ; $13C6F9 |
  INC A                                     ; $13C6FB |
  CMP $2E                                   ; $13C6FC |
  BNE CODE_13C707                           ; $13C6FE |
  BRA CODE_13C70C                           ; $13C700 |

CODE_13C702:
  LDA $C716,y                               ; $13C702 |
  BRA CODE_13C70F                           ; $13C705 |

CODE_13C707:
  LDA $C71C,y                               ; $13C707 |
  BRA CODE_13C70F                           ; $13C70A |

CODE_13C70C:
  LDA $C722,y                               ; $13C70C |

CODE_13C70F:
  STA $7F8000,x                             ; $13C70F |
  SEP #$30                                  ; $13C713 |
  RTL                                       ; $13C715 |

  dw $6100, $6101, $6102, $0185             ; $13C716 |
  dw $0186, $0187, $6103, $6104             ; $13C71E |
  dw $6105                                  ; $13C726 |

  REP #$30                                  ; $13C728 |
  LDX $1D                                   ; $13C72A |
  LDY #$6400                                ; $13C72C |
  LDA $28                                   ; $13C72F |
  BEQ CODE_13C73A                           ; $13C731 |
  INY                                       ; $13C733 |
  INC A                                     ; $13C734 |
  CMP $2A                                   ; $13C735 |
  BNE CODE_13C73A                           ; $13C737 |
  INY                                       ; $13C739 |

CODE_13C73A:
  TYA                                       ; $13C73A |
  STA $7F8000,x                             ; $13C73B |
  SEP #$30                                  ; $13C73F |
  RTL                                       ; $13C741 |

  REP #$30                                  ; $13C742 |
  LDA $2C                                   ; $13C744 |
  BNE CODE_13C75E                           ; $13C746 |
  LDA $28                                   ; $13C748 |
  BNE CODE_13C7A3                           ; $13C74A |
  JSR CODE_13FD54                           ; $13C74C |
  CMP $1C5C                                 ; $13C74F |
  BEQ CODE_13C759                           ; $13C752 |
  CMP $1C5E                                 ; $13C754 |
  BNE CODE_13C7A3                           ; $13C757 |

CODE_13C759:
  LDA $1D14                                 ; $13C759 |
  BRA CODE_13C79D                           ; $13C75C |

CODE_13C75E:
  LDY #$0000                                ; $13C75E |
  LDA $28                                   ; $13C761 |
  BEQ CODE_13C76E                           ; $13C763 |
  INY                                       ; $13C765 |
  INY                                       ; $13C766 |
  INC A                                     ; $13C767 |
  CMP $2A                                   ; $13C768 |
  BNE CODE_13C76E                           ; $13C76A |
  INY                                       ; $13C76C |
  INY                                       ; $13C76D |

CODE_13C76E:
  LDA $2C                                   ; $13C76E |
  CMP #$0001                                ; $13C770 |
  BNE CODE_13C79A                           ; $13C773 |
  LDA $28                                   ; $13C775 |
  BNE CODE_13C795                           ; $13C777 |
  JSR CODE_13FD54                           ; $13C779 |
  CMP $1CB6                                 ; $13C77C |
  BEQ CODE_13C790                           ; $13C77F |
  CMP $1CB8                                 ; $13C781 |
  BEQ CODE_13C790                           ; $13C784 |
  CMP $1CD2                                 ; $13C786 |
  BEQ CODE_13C790                           ; $13C789 |
  CMP $1CE6                                 ; $13C78B |
  BNE CODE_13C795                           ; $13C78E |

CODE_13C790:
  LDA $1CFC                                 ; $13C790 |
  BRA CODE_13C79D                           ; $13C793 |

CODE_13C795:
  LDA $C7A6,y                               ; $13C795 |
  BRA CODE_13C79D                           ; $13C798 |

CODE_13C79A:
  LDA $C7AC,y                               ; $13C79A |

CODE_13C79D:
  LDX $1D                                   ; $13C79D |
  STA $7F8000,x                             ; $13C79F |

CODE_13C7A3:
  SEP #$30                                  ; $13C7A3 |
  RTL                                       ; $13C7A5 |

  dw $0188, $0189, $018A, $018B             ; $13C7A6 |
  dw $018C, $018D                           ; $13C7AE |

  REP #$30                                  ; $13C7B2 |
  LDX $1D                                   ; $13C7B4 |
  LDA #$0184                                ; $13C7B6 |
  STA $7F8000,x                             ; $13C7B9 |
  JMP CODE_13A833                           ; $13C7BD |
  REP #$30                                  ; $13C7C0 |
  LDY #$0000                                ; $13C7C2 |
  LDA $2C                                   ; $13C7C5 |
  BEQ CODE_13C7D2                           ; $13C7C7 |
  INY                                       ; $13C7C9 |
  INY                                       ; $13C7CA |
  INC A                                     ; $13C7CB |
  CMP $2E                                   ; $13C7CC |
  BNE CODE_13C7D2                           ; $13C7CE |
  INY                                       ; $13C7D0 |
  INY                                       ; $13C7D1 |

CODE_13C7D2:
  LDX $1D                                   ; $13C7D2 |
  LDA $C7E2,y                               ; $13C7D4 |
  TAY                                       ; $13C7D7 |
  LDA $0000,y                               ; $13C7D8 |
  STA $7F8000,x                             ; $13C7DB |
  SEP #$30                                  ; $13C7DF |
  RTL                                       ; $13C7E1 |

  dw $1DD6, $1DD0, $1DD2                    ; $13C7E2 |

  REP #$30                                  ; $13C7E8 |
  JSL $128875                               ; $13C7EA |
  AND #$0007                                ; $13C7EE |
  ASL A                                     ; $13C7F1 |
  TAY                                       ; $13C7F2 |
  LDA $15                                   ; $13C7F3 |
  AND #$00FF                                ; $13C7F5 |
  CMP #$008B                                ; $13C7F8 |
  BNE CODE_13C800                           ; $13C7FB |
  LDY #$0010                                ; $13C7FD |

CODE_13C800:
  LDX $1D                                   ; $13C800 |
  LDA $C80C,y                               ; $13C802 |
  STA $7F8000,x                             ; $13C805 |
  SEP #$30                                  ; $13C809 |
  RTL                                       ; $13C80B |

  dw $0199, $019A, $019B, $019C             ; $13C80C |
  dw $019D, $019E, $019F, $01A0             ; $13C814 |
  dw $7300                                  ; $13C81C |

  LDX #$00                                  ; $13C81E |
  LDA $2C                                   ; $13C820 |
  INC A                                     ; $13C822 |
  CMP $2E                                   ; $13C823 |
  BNE CODE_13C829                           ; $13C825 |
  LDX #$02                                  ; $13C827 |

CODE_13C829:
  JSR ($C82D,x)                             ; $13C829 |
  RTL                                       ; $13C82C |

  dw $C831, $C850                           ; $13C82D |

CODE_13C831:
  REP #$30                                  ; $13C831 |
  JSL $128875                               ; $13C833 |
  AND #$0003                                ; $13C837 |
  ASL A                                     ; $13C83A |
  TAY                                       ; $13C83B |
  LDX $1D                                   ; $13C83C |
  LDA $C848,y                               ; $13C83E |
  STA $7F8000,x                             ; $13C841 |
  SEP #$30                                  ; $13C845 |
  RTS                                       ; $13C847 |

  dw $3D3B, $3D3C, $3D49, $3D4A             ; $13C848 |

  REP #$30                                  ; $13C850 |
  LDA $12                                   ; $13C852 |
  CMP $1C5C                                 ; $13C854 |
  BEQ CODE_13C85E                           ; $13C857 |
  CMP $1C5E                                 ; $13C859 |
  BNE CODE_13C831                           ; $13C85C |

CODE_13C85E:
  LDX $1D                                   ; $13C85E |
  LDA #$3D4B                                ; $13C860 |
  STA $7F8000,x                             ; $13C863 |
  SEP #$30                                  ; $13C867 |
  RTS                                       ; $13C869 |

  REP #$30                                  ; $13C86A |
  LDA #$C877                                ; $13C86C |
  STA $00                                   ; $13C86F |
  JSR CODE_13C8A9                           ; $13C871 |
  SEP #$30                                  ; $13C874 |
  RTL                                       ; $13C876 |

  dw $3D37, $3D38, $3D45, $3D46             ; $13C877 |

  REP #$30                                  ; $13C87F |
  LDA #$C88C                                ; $13C881 |
  STA $00                                   ; $13C884 |
  JSR CODE_13C8A9                           ; $13C886 |
  SEP #$30                                  ; $13C889 |
  RTL                                       ; $13C88B |

  dw $0141, $0142, $0143, $0144             ; $13C88C |

  REP #$30                                  ; $13C894 |
  LDA #$C8A1                                ; $13C896 |
  STA $00                                   ; $13C899 |
  JSR CODE_13C8A9                           ; $13C89B |
  SEP #$30                                  ; $13C89E |
  RTL                                       ; $13C8A0 |

  dw $3D39, $3D3A, $3D47, $3D48             ; $13C8A1 |

CODE_13C8A9:
  SEP #$20                                  ; $13C8A9 |
  LDA $28                                   ; $13C8AB |
  AND #$01                                  ; $13C8AD |
  STA $02                                   ; $13C8AF |
  LDA $2C                                   ; $13C8B1 |
  ASL A                                     ; $13C8B3 |
  ORA $02                                   ; $13C8B4 |
  ASL A                                     ; $13C8B6 |
  REP #$20                                  ; $13C8B7 |
  AND #$00FF                                ; $13C8B9 |
  TAY                                       ; $13C8BC |
  LDX $1D                                   ; $13C8BD |
  LDA ($00),y                               ; $13C8BF |
  STA $7F8000,x                             ; $13C8C1 |
  RTS                                       ; $13C8C5 |

  REP #$30                                  ; $13C8C6 |
  LDY $28                                   ; $13C8C8 |
  LDA $2C                                   ; $13C8CA |
  AND #$0001                                ; $13C8CC |
  BEQ CODE_13C8D4                           ; $13C8CF |
  INY                                       ; $13C8D1 |
  INY                                       ; $13C8D2 |
  INY                                       ; $13C8D3 |

CODE_13C8D4:
  TYA                                       ; $13C8D4 |
  ASL A                                     ; $13C8D5 |
  TAY                                       ; $13C8D6 |
  LDX $1D                                   ; $13C8D7 |
  LDA $C8E3,y                               ; $13C8D9 |
  STA $7F8000,x                             ; $13C8DC |
  SEP #$30                                  ; $13C8E0 |
  RTL                                       ; $13C8E2 |

  dw $3D42, $3D43, $3D44, $3D50             ; $13C8E3 |
  dw $3D51, $3D52                           ; $13C8EB |

  REP #$30                                  ; $13C8EF |
  LDA $28                                   ; $13C8F1 |
  ASL A                                     ; $13C8F3 |
  TAY                                       ; $13C8F4 |
  LDX $1D                                   ; $13C8F5 |
  LDA $C901,y                               ; $13C8F7 |
  STA $7F8000,x                             ; $13C8FA |
  SEP #$30                                  ; $13C8FE |
  RTL                                       ; $13C900 |

  dw $3D53, $3D54, $3D55                    ; $13C901 |

  REP #$30                                  ; $13C907 |
  LDA $28                                   ; $13C909 |
  ASL A                                     ; $13C90B |
  TAY                                       ; $13C90C |
  LDX $1D                                   ; $13C90D |
  LDA $C919,y                               ; $13C90F |
  STA $7F8000,x                             ; $13C912 |
  SEP #$30                                  ; $13C916 |
  RTL                                       ; $13C918 |

  dw $3D53, $3D57                           ; $13C919 |

  REP #$30                                  ; $13C91D |
  LDA $28                                   ; $13C91F |
  ASL A                                     ; $13C921 |
  TAY                                       ; $13C922 |
  LDX $1D                                   ; $13C923 |
  LDA $C92F,y                               ; $13C925 |
  STA $7F8000,x                             ; $13C928 |
  SEP #$30                                  ; $13C92C |
  RTL                                       ; $13C92E |

  dw $3D56, $3D55                           ; $13C92F |

  REP #$30                                  ; $13C933 |
  LDX $1D                                   ; $13C935 |
  LDA #$3D58                                ; $13C937 |
  STA $7F8000,x                             ; $13C93A |
  SEP #$30                                  ; $13C93E |
  RTL                                       ; $13C940 |

  LDA #$4D                                  ; $13C941 |
  STA $00                                   ; $13C943 |
  LDA #$C9                                  ; $13C945 |
  STA $01                                   ; $13C947 |
  JSR CODE_13C969                           ; $13C949 |
  RTL                                       ; $13C94C |

  dw $3D3E, $3D3D, $3D3F, $3D40             ; $13C94D |

  LDA #$61                                  ; $13C955 |
  STA $00                                   ; $13C957 |
  LDA #$C9                                  ; $13C959 |
  STA $01                                   ; $13C95B |
  JSR CODE_13C969                           ; $13C95D |
  RTL                                       ; $13C960 |

  dw $3D5A, $6700, $3D59, $6600             ; $13C961 |

CODE_13C969:
  REP #$30                                  ; $13C969 |
  LDA $2C                                   ; $13C96B |
  CLC                                       ; $13C96D |
  ROR A                                     ; $13C96E |
  ROR A                                     ; $13C96F |
  STA $9B                                   ; $13C970 |
  LDA $28                                   ; $13C972 |
  BNE CODE_13C988                           ; $13C974 |
  STZ $9B                                   ; $13C976 |
  LDA $2C                                   ; $13C978 |
  BNE CODE_13C9AA                           ; $13C97A |
  LDY #$0001                                ; $13C97C |
  LDA $2A                                   ; $13C97F |
  BPL CODE_13C99F                           ; $13C981 |
  LDY #$0003                                ; $13C983 |
  BRA CODE_13C99F                           ; $13C986 |

CODE_13C988:
  BPL CODE_13C98D                           ; $13C988 |
  DEC A                                     ; $13C98A |
  BRA CODE_13C98E                           ; $13C98B |

CODE_13C98D:
  INC A                                     ; $13C98D |

CODE_13C98E:
  CMP $2A                                   ; $13C98E |
  BNE CODE_13C996                           ; $13C990 |
  LDA $2C                                   ; $13C992 |
  BNE CODE_13C9AA                           ; $13C994 |

CODE_13C996:
  LDA $2C                                   ; $13C996 |
  TAY                                       ; $13C998 |
  LDA $2A                                   ; $13C999 |
  BPL CODE_13C99F                           ; $13C99B |
  INY                                       ; $13C99D |
  INY                                       ; $13C99E |

CODE_13C99F:
  TYA                                       ; $13C99F |
  ASL A                                     ; $13C9A0 |
  TAY                                       ; $13C9A1 |
  LDA ($00),y                               ; $13C9A2 |
  LDX $1D                                   ; $13C9A4 |
  STA $7F8000,x                             ; $13C9A6 |

CODE_13C9AA:
  SEP #$30                                  ; $13C9AA |
  RTS                                       ; $13C9AC |

  REP #$30                                  ; $13C9AD |
  LDA $28                                   ; $13C9AF |
  AND #$0001                                ; $13C9B1 |
  ASL A                                     ; $13C9B4 |
  TAY                                       ; $13C9B5 |
  LDA $12                                   ; $13C9B6 |
  STA $00                                   ; $13C9B8 |
  LDX #$0000                                ; $13C9BA |
  LDA $2C                                   ; $13C9BD |
  BEQ CODE_13C9CC                           ; $13C9BF |
  LDX #$0006                                ; $13C9C1 |
  INC A                                     ; $13C9C4 |
  CMP $2E                                   ; $13C9C5 |
  BNE CODE_13C9CC                           ; $13C9C7 |
  LDX #$000C                                ; $13C9C9 |

CODE_13C9CC:
  LDA $28                                   ; $13C9CC |
  BEQ CODE_13C9DB                           ; $13C9CE |
  INX                                       ; $13C9D0 |
  INX                                       ; $13C9D1 |
  INC A                                     ; $13C9D2 |
  CMP $2A                                   ; $13C9D3 |
  BNE CODE_13C9DB                           ; $13C9D5 |
  INX                                       ; $13C9D7 |
  INX                                       ; $13C9D8 |
  BRA CODE_13C9DB                           ; $13C9D9 |

CODE_13C9DB:
  JSR ($C9ED,x)                             ; $13C9DB |
  TXA                                       ; $13C9DE |
  BMI CODE_13C9EA                           ; $13C9DF |
  LDA $0000,x                               ; $13C9E1 |
  LDX $1D                                   ; $13C9E4 |
  STA $7F8000,x                             ; $13C9E6 |

CODE_13C9EA:
  SEP #$30                                  ; $13C9EA |
  RTL                                       ; $13C9EC |

  dw $C9FF, $CA2A, $CA2E, $CA59             ; $13C9ED |
  dw $CA98, $CAA0, $CADF, $CB0B             ; $13C9F5 |
  dw $CB1D                                  ; $13C9FD |

  LDA $00                                   ; $13C9FF |
  CMP $1D90                                 ; $13CA01 |
  BEQ CODE_13CA0B                           ; $13CA04 |
  CMP $1DAC                                 ; $13CA06 |
  BNE CODE_13CA10                           ; $13CA09 |

CODE_13CA0B:
  LDX #$1D9E                                ; $13CA0B |
  BRA CODE_13CA29                           ; $13CA0E |

CODE_13CA10:
  LDA $1B                                   ; $13CA10 |
  STA $0E                                   ; $13CA12 |
  JSL $12875D                               ; $13CA14 |
  LDA $7F8000,x                             ; $13CA18 |
  CMP $1D9C                                 ; $13CA1C |
  BNE CODE_13CA26                           ; $13CA1F |
  LDX #$FFFF                                ; $13CA21 |
  BRA CODE_13CA29                           ; $13CA24 |

CODE_13CA26:
  LDX #$1DAE                                ; $13CA26 |

CODE_13CA29:
  RTS                                       ; $13CA29 |

  LDX #$1DAE                                ; $13CA2A |
  RTS                                       ; $13CA2D |

  LDA $00                                   ; $13CA2E |
  CMP $1D8A                                 ; $13CA30 |
  BEQ CODE_13CA3A                           ; $13CA33 |
  CMP $1DAA                                 ; $13CA35 |
  BNE CODE_13CA3F                           ; $13CA38 |

CODE_13CA3A:
  LDX #$1D9C                                ; $13CA3A |
  BRA CODE_13CA58                           ; $13CA3D |

CODE_13CA3F:
  LDA $1B                                   ; $13CA3F |
  STA $0E                                   ; $13CA41 |
  JSL $12875D                               ; $13CA43 |
  LDA $7F8000,x                             ; $13CA47 |
  CMP $1D9E                                 ; $13CA4B |
  BNE CODE_13CA55                           ; $13CA4E |
  LDX #$FFFF                                ; $13CA50 |
  BRA CODE_13CA58                           ; $13CA53 |

CODE_13CA55:
  LDX #$1DAE                                ; $13CA55 |

CODE_13CA58:
  RTS                                       ; $13CA58 |

  LDX $CA94,y                               ; $13CA59 |
  LDA $00                                   ; $13CA5C |
  CMP $1D8C                                 ; $13CA5E |
  BEQ CODE_13CA98                           ; $13CA61 |
  CMP $1D8E                                 ; $13CA63 |
  BEQ CODE_13CA98                           ; $13CA66 |
  CMP $1D90                                 ; $13CA68 |
  BEQ CODE_13CA98                           ; $13CA6B |
  CMP $1DAC                                 ; $13CA6D |
  BEQ CODE_13CA98                           ; $13CA70 |
  CMP $1D9C                                 ; $13CA72 |
  BEQ CODE_13CA90                           ; $13CA75 |
  CMP $1D9E                                 ; $13CA77 |
  BEQ CODE_13CA90                           ; $13CA7A |
  CMP $1DA4                                 ; $13CA7C |
  BEQ CODE_13CA90                           ; $13CA7F |
  CMP $1DA2                                 ; $13CA81 |
  BEQ CODE_13CA93                           ; $13CA84 |
  CMP $1DAE                                 ; $13CA86 |
  BNE CODE_13CA93                           ; $13CA89 |
  LDX #$1D9C                                ; $13CA8B |
  BRA CODE_13CA93                           ; $13CA8E |

CODE_13CA90:
  LDX #$FFFF                                ; $13CA90 |

CODE_13CA93:
  RTS                                       ; $13CA93 |

  dw $1D8A, $1DAA                           ; $13CA94 |

CODE_13CA98:
  LDX $CA9C,y                               ; $13CA98 |
  RTS                                       ; $13CA9B |

  dw $1D8C, $1D8E                           ; $13CA9C |

  LDX $CADB,y                               ; $13CAA0 |
  LDA $00                                   ; $13CAA3 |
  CMP $1D8A                                 ; $13CAA5 |
  BEQ CODE_13CA98                           ; $13CAA8 |
  CMP $1D8C                                 ; $13CAAA |
  BEQ CODE_13CA98                           ; $13CAAD |
  CMP $1D8E                                 ; $13CAAF |
  BEQ CODE_13CA98                           ; $13CAB2 |
  CMP $1DAA                                 ; $13CAB4 |
  BEQ CODE_13CA98                           ; $13CAB7 |
  CMP $1D9C                                 ; $13CAB9 |
  BEQ CODE_13CAD7                           ; $13CABC |
  CMP $1D9E                                 ; $13CABE |
  BEQ CODE_13CAD7                           ; $13CAC1 |
  CMP $1DA6                                 ; $13CAC3 |
  BEQ CODE_13CAD7                           ; $13CAC6 |
  CMP $1DA8                                 ; $13CAC8 |
  BEQ CODE_13CADA                           ; $13CACB |
  CMP $1DAE                                 ; $13CACD |
  BNE CODE_13CADA                           ; $13CAD0 |
  LDX #$1D9E                                ; $13CAD2 |
  BRA CODE_13CADA                           ; $13CAD5 |

CODE_13CAD7:
  LDX #$FFFF                                ; $13CAD7 |

CODE_13CADA:
  RTS                                       ; $13CADA |

  dw $1D90, $1DAC                           ; $13CADB |

  LDX #$1D92                                ; $13CADF |
  LDA $00                                   ; $13CAE2 |
  CMP $1D94                                 ; $13CAE4 |
  BEQ CODE_13CB0B                           ; $13CAE7 |
  CMP $1D96                                 ; $13CAE9 |
  BEQ CODE_13CB0B                           ; $13CAEC |
  CMP $1D98                                 ; $13CAEE |
  BEQ CODE_13CB0B                           ; $13CAF1 |
  CMP $1D90                                 ; $13CAF3 |
  BEQ CODE_13CB07                           ; $13CAF6 |
  CMP $1DAC                                 ; $13CAF8 |
  BEQ CODE_13CB07                           ; $13CAFB |
  CMP $1DA2                                 ; $13CAFD |
  BNE CODE_13CB0A                           ; $13CB00 |
  LDX #$FFFF                                ; $13CB02 |
  BRA CODE_13CB0A                           ; $13CB05 |

CODE_13CB07:
  LDX #$1DA6                                ; $13CB07 |

CODE_13CB0A:
  RTS                                       ; $13CB0A |

CODE_13CB0B:
  LDX $CB19,y                               ; $13CB0B |
  LDA $00                                   ; $13CB0E |
  CMP #$0000                                ; $13CB10 |
  BNE CODE_13CB18                           ; $13CB13 |
  LDX #$1DB0                                ; $13CB15 |

CODE_13CB18:
  RTS                                       ; $13CB18 |

  dw $1D94, $1D96                           ; $13CB19 |

  LDX #$1D98                                ; $13CB1D |
  LDA $00                                   ; $13CB20 |
  CMP $1D92                                 ; $13CB22 |
  BEQ CODE_13CB0B                           ; $13CB25 |
  CMP $1D94                                 ; $13CB27 |
  BEQ CODE_13CB0B                           ; $13CB2A |
  CMP $1D96                                 ; $13CB2C |
  BEQ CODE_13CB0B                           ; $13CB2F |
  CMP $1D8A                                 ; $13CB31 |
  BEQ CODE_13CB45                           ; $13CB34 |
  CMP $1DAA                                 ; $13CB36 |
  BEQ CODE_13CB45                           ; $13CB39 |
  CMP $1DA8                                 ; $13CB3B |
  BNE CODE_13CB48                           ; $13CB3E |
  LDX #$FFFF                                ; $13CB40 |
  BRA CODE_13CB48                           ; $13CB43 |

CODE_13CB45:
  LDX #$1DA4                                ; $13CB45 |

CODE_13CB48:
  RTS                                       ; $13CB48 |

  LDA #$01                                  ; $13CB49 |
  STA $9B                                   ; $13CB4B |
  REP #$30                                  ; $13CB4D |
  LDY #$FFFF                                ; $13CB4F |
  LDX #$CB98                                ; $13CB52 |
  LDA $2A                                   ; $13CB55 |
  BMI CODE_13CB5F                           ; $13CB57 |
  LDY #$0001                                ; $13CB59 |
  LDX #$CBAA                                ; $13CB5C |

CODE_13CB5F:
  STX $00                                   ; $13CB5F |
  STY $02                                   ; $13CB61 |
  LDX #$0000                                ; $13CB63 |
  LDA $2C                                   ; $13CB66 |
  BEQ CODE_13CB7B                           ; $13CB68 |
  INX                                       ; $13CB6A |
  INX                                       ; $13CB6B |
  CMP #$0001                                ; $13CB6C |
  BEQ CODE_13CB7B                           ; $13CB6F |
  INX                                       ; $13CB71 |
  INX                                       ; $13CB72 |
  INC A                                     ; $13CB73 |
  CMP $002E                                 ; $13CB74 |
  BNE CODE_13CB7B                           ; $13CB77 |
  INX                                       ; $13CB79 |
  INX                                       ; $13CB7A |

CODE_13CB7B:
  JSR ($CB90,x)                             ; $13CB7B |
  TYA                                       ; $13CB7E |
  BMI CODE_13CB8D                           ; $13CB7F |
  LDA ($00),y                               ; $13CB81 |
  TAY                                       ; $13CB83 |
  LDA $0000,y                               ; $13CB84 |
  LDX $1D                                   ; $13CB87 |
  STA $7F8000,x                             ; $13CB89 |

CODE_13CB8D:
  SEP #$30                                  ; $13CB8D |
  RTL                                       ; $13CB8F |

  dw $CBBC, $CBD0, $CC19, $CC6A             ; $13CB90 |

  dw $1D9A, $1D9C, $1D8A, $1DAA             ; $13CB98 |
  dw $1D8C, $1D8E, $1D94, $1D96             ; $13CBA0 |
  dw $1D92, $1DA0, $1D9E, $1D90             ; $13CBA8 |
  dw $1DAC, $1D8C, $1D8E, $1D94             ; $13CBB0 |
  dw $1D96, $1D98                           ; $13CBB8 |

  LDY #$0000                                ; $13CBBC |
  LDA $12                                   ; $13CBBF |
  CMP $1DAE                                 ; $13CBC1 |
  BEQ CODE_13CBCF                           ; $13CBC4 |
  AND #$FF00                                ; $13CBC6 |
  CMP $1D8A                                 ; $13CBC9 |
  BNE CODE_13CBCF                           ; $13CBCC |
  DEY                                       ; $13CBCE |

CODE_13CBCF:
  RTS                                       ; $13CBCF |

  LDY #$0002                                ; $13CBD0 |
  LDA $28                                   ; $13CBD3 |
  CLC                                       ; $13CBD5 |
  ADC $02                                   ; $13CBD6 |
  CMP $2A                                   ; $13CBD8 |
  BNE CODE_13CBE6                           ; $13CBDA |
  LDA $12                                   ; $13CBDC |
  CMP $1DAE                                 ; $13CBDE |
  BEQ CODE_13CC18                           ; $13CBE1 |
  LDY #$0006                                ; $13CBE3 |

CODE_13CBE6:
  LDA $12                                   ; $13CBE6 |
  CMP $1C5C                                 ; $13CBE8 |
  BEQ CODE_13CC15                           ; $13CBEB |
  CMP $1C5E                                 ; $13CBED |
  BEQ CODE_13CC15                           ; $13CBF0 |
  CMP $1D92                                 ; $13CBF2 |
  BEQ CODE_13CC15                           ; $13CBF5 |
  CMP $1D98                                 ; $13CBF7 |
  BEQ CODE_13CC15                           ; $13CBFA |
  CMP $1D8C                                 ; $13CBFC |
  BEQ CODE_13CC10                           ; $13CBFF |
  CMP $1D8E                                 ; $13CC01 |
  BEQ CODE_13CC10                           ; $13CC04 |
  CMP $1D9C                                 ; $13CC06 |
  BEQ CODE_13CC10                           ; $13CC09 |
  CMP $1D9E                                 ; $13CC0B |
  BNE CODE_13CC18                           ; $13CC0E |

CODE_13CC10:
  LDY #$FFFF                                ; $13CC10 |
  BRA CODE_13CC18                           ; $13CC13 |

CODE_13CC15:
  LDY #$0010                                ; $13CC15 |

CODE_13CC18:
  RTS                                       ; $13CC18 |

  LDA $28                                   ; $13CC19 |
  AND #$0001                                ; $13CC1B |
  ASL A                                     ; $13CC1E |
  ADC #$0008                                ; $13CC1F |
  TAY                                       ; $13CC22 |
  LDA $28                                   ; $13CC23 |
  CLC                                       ; $13CC25 |
  ADC $02                                   ; $13CC26 |
  CMP $2A                                   ; $13CC28 |
  BNE CODE_13CC69                           ; $13CC2A |
  LDA $12                                   ; $13CC2C |
  CMP $1D8A                                 ; $13CC2E |
  BEQ CODE_13CC69                           ; $13CC31 |
  CMP $1DAA                                 ; $13CC33 |
  BEQ CODE_13CC69                           ; $13CC36 |
  CMP $1D90                                 ; $13CC38 |
  BEQ CODE_13CC69                           ; $13CC3B |
  CMP $1DAC                                 ; $13CC3D |
  BEQ CODE_13CC69                           ; $13CC40 |
  CMP $1D8C                                 ; $13CC42 |
  BEQ CODE_13CC69                           ; $13CC45 |
  CMP $1D8E                                 ; $13CC47 |
  BEQ CODE_13CC69                           ; $13CC4A |
  CMP $1D9C                                 ; $13CC4C |
  BEQ CODE_13CC60                           ; $13CC4F |
  CMP $1D9E                                 ; $13CC51 |
  BEQ CODE_13CC60                           ; $13CC54 |
  CMP $1DAE                                 ; $13CC56 |
  BNE CODE_13CC65                           ; $13CC59 |
  LDY #$0002                                ; $13CC5B |
  BRA CODE_13CC69                           ; $13CC5E |

CODE_13CC60:
  LDY #$FFFF                                ; $13CC60 |
  BRA CODE_13CC69                           ; $13CC63 |

CODE_13CC65:
  DEY                                       ; $13CC65 |
  DEY                                       ; $13CC66 |
  DEY                                       ; $13CC67 |
  DEY                                       ; $13CC68 |

CODE_13CC69:
  RTS                                       ; $13CC69 |

  LDA $28                                   ; $13CC6A |
  AND #$0001                                ; $13CC6C |
  ASL A                                     ; $13CC6F |
  ADC #$000C                                ; $13CC70 |
  TAY                                       ; $13CC73 |
  LDA $12                                   ; $13CC74 |
  CMP $1C5C                                 ; $13CC76 |
  BEQ CODE_13CC98                           ; $13CC79 |
  CMP $1C5E                                 ; $13CC7B |
  BEQ CODE_13CC98                           ; $13CC7E |
  CMP $1D92                                 ; $13CC80 |
  BEQ CODE_13CC98                           ; $13CC83 |
  CMP $1D94                                 ; $13CC85 |
  BEQ CODE_13CC98                           ; $13CC88 |
  CMP $1D96                                 ; $13CC8A |
  BEQ CODE_13CC98                           ; $13CC8D |
  CMP $1D98                                 ; $13CC8F |
  BEQ CODE_13CC98                           ; $13CC92 |
  DEY                                       ; $13CC94 |
  DEY                                       ; $13CC95 |
  DEY                                       ; $13CC96 |
  DEY                                       ; $13CC97 |

CODE_13CC98:
  LDA $28                                   ; $13CC98 |
  CLC                                       ; $13CC9A |
  ADC $02                                   ; $13CC9B |
  CMP $2A                                   ; $13CC9D |
  BNE CODE_13CCBD                           ; $13CC9F |
  LDA $12                                   ; $13CCA1 |
  CMP $1C5C                                 ; $13CCA3 |
  BEQ CODE_13CCBA                           ; $13CCA6 |
  CMP $1C5E                                 ; $13CCA8 |
  BEQ CODE_13CCBA                           ; $13CCAB |
  AND #$FF00                                ; $13CCAD |
  CMP $1D8A                                 ; $13CCB0 |
  BEQ CODE_13CCBD                           ; $13CCB3 |
  LDY #$0006                                ; $13CCB5 |
  BRA CODE_13CCBD                           ; $13CCB8 |

CODE_13CCBA:
  LDY #$0010                                ; $13CCBA |

CODE_13CCBD:
  RTS                                       ; $13CCBD |

  REP #$30                                  ; $13CCBE |
  LDA $2C                                   ; $13CCC0 |
  BNE CODE_13CCCA                           ; $13CCC2 |
  LDA $28                                   ; $13CCC4 |
  BEQ CODE_13CCCA                           ; $13CCC6 |
  DEC $2E                                   ; $13CCC8 |

CODE_13CCCA:
  LDA #$CD22                                ; $13CCCA |
  LDX $2A                                   ; $13CCCD |
  BMI CODE_13CCD4                           ; $13CCCF |
  LDA #$CD2A                                ; $13CCD1 |

CODE_13CCD4:
  STA $00                                   ; $13CCD4 |
  LDA $2C                                   ; $13CCD6 |
  INC A                                     ; $13CCD8 |
  CMP $2E                                   ; $13CCD9 |
  BEQ CODE_13CCE7                           ; $13CCDB |
  INC A                                     ; $13CCDD |
  CMP $2E                                   ; $13CCDE |
  BNE CODE_13CD00                           ; $13CCE0 |
  LDY #$0002                                ; $13CCE2 |
  BRA CODE_13CD13                           ; $13CCE5 |

CODE_13CCE7:
  LDA $12                                   ; $13CCE7 |
  CMP $1D92                                 ; $13CCE9 |
  BEQ CODE_13CCFB                           ; $13CCEC |
  CMP $1D98                                 ; $13CCEE |
  BEQ CODE_13CCFB                           ; $13CCF1 |
  AND #$FF00                                ; $13CCF3 |
  CMP $1D8A                                 ; $13CCF6 |
  BEQ CODE_13CD1F                           ; $13CCF9 |

CODE_13CCFB:
  LDY #$0000                                ; $13CCFB |
  BRA CODE_13CD13                           ; $13CCFE |

CODE_13CD00:
  LDA $2C                                   ; $13CD00 |
  AND #$0001                                ; $13CD02 |
  INC A                                     ; $13CD05 |
  INC A                                     ; $13CD06 |
  ASL A                                     ; $13CD07 |
  STA $02                                   ; $13CD08 |
  LDA $28                                   ; $13CD0A |
  AND #$0001                                ; $13CD0C |
  ASL A                                     ; $13CD0F |
  EOR $02                                   ; $13CD10 |
  TAY                                       ; $13CD12 |

CODE_13CD13:
  LDA ($00),y                               ; $13CD13 |
  TAX                                       ; $13CD15 |
  LDA $0000,x                               ; $13CD16 |
  LDX $1D                                   ; $13CD19 |
  STA $7F8000,x                             ; $13CD1B |

CODE_13CD1F:
  SEP #$30                                  ; $13CD1F |
  RTL                                       ; $13CD21 |

  dw $1DA2, $1DA4, $1D8C, $1D8E             ; $13CD22 |
  dw $1DA8, $1DA6, $1D8C, $1D8E             ; $13CD2A |

  REP #$30                                  ; $13CD32 |
  LDA #$CD97                                ; $13CD34 |
  STA $00                                   ; $13CD37 |
  LDA $12                                   ; $13CD39 |
  CMP $1D8C                                 ; $13CD3B |
  BEQ CODE_13CD45                           ; $13CD3E |
  CMP $1D8E                                 ; $13CD40 |
  BNE CODE_13CD4A                           ; $13CD43 |

CODE_13CD45:
  LDA #$CDB7                                ; $13CD45 |
  STA $00                                   ; $13CD48 |

CODE_13CD4A:
  LDY #$0000                                ; $13CD4A |
  LDA $28                                   ; $13CD4D |
  BEQ CODE_13CD64                           ; $13CD4F |
  AND #$0001                                ; $13CD51 |
  EOR #$0001                                ; $13CD54 |
  INC A                                     ; $13CD57 |
  ASL A                                     ; $13CD58 |
  TAY                                       ; $13CD59 |
  LDA $28                                   ; $13CD5A |
  INC A                                     ; $13CD5C |
  CMP $2A                                   ; $13CD5D |
  BNE CODE_13CD64                           ; $13CD5F |
  LDY #$0006                                ; $13CD61 |

CODE_13CD64:
  LDA $2C                                   ; $13CD64 |
  BEQ CODE_13CD6D                           ; $13CD66 |
  TYA                                       ; $13CD68 |
  ORA #$0008                                ; $13CD69 |
  TAY                                       ; $13CD6C |

CODE_13CD6D:
  LDA $12                                   ; $13CD6D |
  CMP $1D8A                                 ; $13CD6F |
  BEQ CODE_13CD83                           ; $13CD72 |
  CMP $1DAA                                 ; $13CD74 |
  BEQ CODE_13CD83                           ; $13CD77 |
  CMP $1D90                                 ; $13CD79 |
  BEQ CODE_13CD83                           ; $13CD7C |
  CMP $1DAC                                 ; $13CD7E |
  BNE CODE_13CD88                           ; $13CD81 |

CODE_13CD83:
  TYA                                       ; $13CD83 |
  ORA #$0010                                ; $13CD84 |
  TAY                                       ; $13CD87 |

CODE_13CD88:
  LDA ($00),y                               ; $13CD88 |
  TAY                                       ; $13CD8A |
  LDX $1D                                   ; $13CD8B |
  LDA $0000,y                               ; $13CD8D |
  STA $7F8000,x                             ; $13CD90 |
  SEP #$30                                  ; $13CD94 |
  RTL                                       ; $13CD96 |

  dw $1DB2, $1DB4, $1DB6, $1DB8             ; $13CD97 |
  dw $1C80, $1C84, $1C86, $1C8A             ; $13CD9F |
  dw $1DBA, $1DBA, $1DBC, $1DBC             ; $13CDA7 |
  dw $1C82, $1C84, $1C86, $1C88             ; $13CDAF |
  dw $1DBE, $1DC0, $1DC2, $1DC4             ; $13CDB7 |
  dw $1C80, $1C84, $1C86, $1C8A             ; $13CDBF |
  dw $1DBA, $1DBA, $1DBC, $1DBC             ; $13CDC7 |
  dw $1C82, $1C84, $1C86, $1C88             ; $13CDCF |

  REP #$30                                  ; $13CDD7 |
  LDA $12                                   ; $13CDD9 |
  CMP #$0000                                ; $13CDDB |
  BEQ CODE_13CE31                           ; $13CDDE |
  AND #$FF00                                ; $13CDE0 |
  CMP $1BE0                                 ; $13CDE3 |
  BNE CODE_13CDED                           ; $13CDE6 |
  JSR CODE_13CFD6                           ; $13CDE8 |
  BRA CODE_13CE31                           ; $13CDEB |

CODE_13CDED:
  CMP $1D8A                                 ; $13CDED |
  BNE CODE_13CE31                           ; $13CDF0 |
  LDA $12                                   ; $13CDF2 |
  AND #$00FF                                ; $13CDF4 |
  ASL A                                     ; $13CDF7 |
  TAY                                       ; $13CDF8 |
  LDX #$0000                                ; $13CDF9 |
  LDA $2C                                   ; $13CDFC |
  BEQ CODE_13CE09                           ; $13CDFE |
  INX                                       ; $13CE00 |
  INX                                       ; $13CE01 |
  INC A                                     ; $13CE02 |
  CMP $2E                                   ; $13CE03 |
  BNE CODE_13CE09                           ; $13CE05 |
  INX                                       ; $13CE07 |
  INX                                       ; $13CE08 |

CODE_13CE09:
  LDA $28                                   ; $13CE09 |
  BEQ CODE_13CE1E                           ; $13CE0B |
  INX                                       ; $13CE0D |
  INX                                       ; $13CE0E |
  INX                                       ; $13CE0F |
  INX                                       ; $13CE10 |
  INX                                       ; $13CE11 |
  INX                                       ; $13CE12 |
  INC A                                     ; $13CE13 |
  CMP $2A                                   ; $13CE14 |
  BNE CODE_13CE1E                           ; $13CE16 |
  INX                                       ; $13CE18 |
  INX                                       ; $13CE19 |
  INX                                       ; $13CE1A |
  INX                                       ; $13CE1B |
  INX                                       ; $13CE1C |
  INX                                       ; $13CE1D |

CODE_13CE1E:
  LDA $CE34,x                               ; $13CE1E |
  STA $00                                   ; $13CE21 |
  LDA ($00),y                               ; $13CE23 |
  TAY                                       ; $13CE25 |
  LDA $0000,y                               ; $13CE26 |
  BMI CODE_13CE31                           ; $13CE29 |
  LDX $1D                                   ; $13CE2B |
  STA $7F8000,x                             ; $13CE2D |

CODE_13CE31:
  SEP #$30                                  ; $13CE31 |
  RTL                                       ; $13CE33 |

  dw $CE46, $CE6E, $CE96, $CEBE             ; $13CE34 |
  dw $CEE6, $CF0E, $CF36, $CF5E             ; $13CE3C |
  dw $CF86                                  ; $13CE44 |

  dw $1DA2, $1DA6, $1DA6, $1D90             ; $13CE46 |
  dw $CFAE, $CFAE, $CFAE, $CFAE             ; $13CE4E |
  dw $CFAE, $CFAE, $1DAC, $CFAE             ; $13CE56 |
  dw $CFAE, $1DB0, $1DA6, $CFAE             ; $13CE5E |
  dw $1DA2, $1DAC, $1DA0, $1DB0             ; $13CE66 |
  dw $CFB0, $1D90, $1DAC, $1D90             ; $13CE6E |
  dw $1C5C, $1D98, $1D98, $1C5E             ; $13CE76 |
  dw $CFB0, $1DA0, $1DAC, $CFB0             ; $13CE7E |
  dw $CFB0, $1DA8, $1D90, $CFAE             ; $13CE86 |
  dw $CFB0, $1DAC, $1DA0, $1DA8             ; $13CE8E |
  dw $1D9A, $1D9E, $1D9E, $1D90             ; $13CE96 |
  dw $1C5C, $1D98, $1D98, $1C5E             ; $13CE9E |
  dw $1D9E, $1DAE, $1D9E, $1D9E             ; $13CEA6 |
  dw $CFB0, $CFB0, $1DAC, $CFAE             ; $13CEAE |
  dw $1D9A, $1DAC, $CFAE, $1DA8             ; $13CEB6 |
  dw $1DA2, $1DB0, $1DB0, $1DA8             ; $13CEBE |
  dw $CFAE, $CFAE, $CFAE, $CFAE             ; $13CEC6 |
  dw $CFB0, $1DA2, $1DA8, $CFB0             ; $13CECE |
  dw $CFAE, $1DB0, $1DB0, $CFAE             ; $13CED6 |
  dw $1DA2, $1DA8, $CFB0, $1DB0             ; $13CEDE |
  dw $CFB0, $CFB0, $CFB0, $CFB0             ; $13CEE6 |
  dw $1C5C, $1C5E, $1C5C, $1C5E             ; $13CEEE |
  dw $CFB0, $CFB0, $CFB0, $CFB0             ; $13CEF6 |
  dw $CFB0, $CFB0, $CFB0, $CFB0             ; $13CEFE |
  dw $CFB0, $CFB0, $CFB0, $CFB0             ; $13CF06 |
  dw $1D9A, $1DAE, $1DAE, $1DA0             ; $13CF0E |
  dw $1C5C, $1C5E, $1C5C, $1C5E             ; $13CF16 |
  dw $CFB0, $1DAE, $1DAE, $CFB0             ; $13CF1E |
  dw $CFB0, $1D9A, $1DA0, $CFB0             ; $13CF26 |
  dw $1D9A, $1DA0, $1DAE, $CFB0             ; $13CF2E |
  dw $1D8A, $1DA4, $1DA4, $1DA6             ; $13CF36 |
  dw $CFAE, $CFAE, $CFAE, $CFAE             ; $13CF3E |
  dw $CFAE, $1D8A, $CFB0, $CFB0             ; $13CF46 |
  dw $CFAE, $1DA4, $1DB0, $CFAE             ; $13CF4E |
  dw $1DAA, $1DA6, $1D9A, $1DB0             ; $13CF56 |
  dw $1D8A, $1D8A, $1DAA, $CFB0             ; $13CF5E |
  dw $1C5C, $1D92, $1D92, $1C5E             ; $13CF66 |
  dw $CFB0, $1DAA, $1D9A, $CFB0             ; $13CF6E |
  dw $CFAE, $1D8A, $1DA2, $CFB0             ; $13CF76 |
  dw $1DAA, $CFB0, $1D9A, $1DA2             ; $13CF7E |
  dw $1D8A, $1D9C, $1D9C, $1DA0             ; $13CF86 |
  dw $1C5C, $1D92, $1D92, $1C5E             ; $13CF8E |
  dw $CFAE, $1D9C, $1DAE, $CFAE             ; $13CF96 |
  dw $1DA2, $1DAA, $CFAE, $CFB0             ; $13CF9E |
  dw $1DAA, $1DAC, $1DAE, $CFAE             ; $13CFA6 |
  dw $FFFF, $0000, $1DA6, $1DB0             ; $13CFAE |
  dw $1DA4, $1DAC, $CFB0, $1DAA             ; $13CFB6 |
  dw $1D9E, $1DAE, $1D9C, $1DA2             ; $13CFBE |
  dw $1DB0, $1DA8, $CFB0, $CFB0             ; $13CFC6 |
  dw $CFB0, $1D9A, $1DAE, $1DA0             ; $13CFCE |

CODE_13CFD6:
  LDY #$0000                                ; $13CFD6 |
  LDA $28                                   ; $13CFD9 |
  BEQ CODE_13CFE6                           ; $13CFDB |
  INY                                       ; $13CFDD |
  INY                                       ; $13CFDE |
  INC A                                     ; $13CFDF |
  CMP $2A                                   ; $13CFE0 |
  BNE CODE_13CFE6                           ; $13CFE2 |
  INY                                       ; $13CFE4 |
  INY                                       ; $13CFE5 |

CODE_13CFE6:
  LDX $2C                                   ; $13CFE6 |
  BEQ CODE_13CFFB                           ; $13CFE8 |
  TYA                                       ; $13CFEA |
  CLC                                       ; $13CFEB |
  ADC #$0006                                ; $13CFEC |
  TAY                                       ; $13CFEF |
  INX                                       ; $13CFF0 |
  CPX $2E                                   ; $13CFF1 |
  BNE CODE_13CFFB                           ; $13CFF3 |
  TYA                                       ; $13CFF5 |
  CLC                                       ; $13CFF6 |
  ADC #$0006                                ; $13CFF7 |
  TAY                                       ; $13CFFA |

CODE_13CFFB:
  LDA $12                                   ; $13CFFB |
  CMP $1C0C                                 ; $13CFFD |
  BEQ CODE_13D007                           ; $13D000 |
  CMP $1C0E                                 ; $13D002 |
  BNE CODE_13D00C                           ; $13D005 |

CODE_13D007:
  LDA $CFC4,y                               ; $13D007 |
  BRA CODE_13D00F                           ; $13D00A |

CODE_13D00C:
  LDA $CFB2,y                               ; $13D00C |

CODE_13D00F:
  TAY                                       ; $13D00F |
  LDA $0000,y                               ; $13D010 |
  LDX $1D                                   ; $13D013 |
  STA $7F8000,x                             ; $13D015 |
  RTS                                       ; $13D019 |

  REP #$30                                  ; $13D01A |
  LDA $2C                                   ; $13D01C |
  BNE CODE_13D026                           ; $13D01E |
  LDA $28                                   ; $13D020 |
  BEQ CODE_13D026                           ; $13D022 |
  DEC $2E                                   ; $13D024 |

CODE_13D026:
  LDX #$0000                                ; $13D026 |
  LDA $2C                                   ; $13D029 |
  INC A                                     ; $13D02B |
  CMP $2E                                   ; $13D02C |
  BEQ CODE_13D039                           ; $13D02E |
  INX                                       ; $13D030 |
  INX                                       ; $13D031 |
  INC A                                     ; $13D032 |
  CMP $2E                                   ; $13D033 |
  BEQ CODE_13D039                           ; $13D035 |
  INX                                       ; $13D037 |
  INX                                       ; $13D038 |

CODE_13D039:
  JSR ($D048,x)                             ; $13D039 |
  TYA                                       ; $13D03C |
  BMI CODE_13D045                           ; $13D03D |
  LDX $1D                                   ; $13D03F |
  STA $7F8000,x                             ; $13D041 |

CODE_13D045:
  SEP #$30                                  ; $13D045 |
  RTL                                       ; $13D047 |

  dw $D04E, $D066, $D071                    ; $13D048 |

  LDY $1DA8                                 ; $13D04E |
  LDA $2A                                   ; $13D051 |
  BPL CODE_13D058                           ; $13D053 |
  LDY $1DA2                                 ; $13D055 |

CODE_13D058:
  LDA $12                                   ; $13D058 |
  AND #$FF00                                ; $13D05A |
  CMP $1D8A                                 ; $13D05D |
  BNE CODE_13D065                           ; $13D060 |
  LDY #$FFFF                                ; $13D062 |

CODE_13D065:
  RTS                                       ; $13D065 |

  LDY $1DA6                                 ; $13D066 |
  LDA $2A                                   ; $13D069 |
  BPL CODE_13D070                           ; $13D06B |
  LDY $1DA4                                 ; $13D06D |

CODE_13D070:
  RTS                                       ; $13D070 |

  LDA $12                                   ; $13D071 |
  CMP #$0000                                ; $13D073 |
  BEQ CODE_13D085                           ; $13D076 |
  AND #$FF00                                ; $13D078 |
  CMP $1D8A                                 ; $13D07B |
  BEQ CODE_13D085                           ; $13D07E |
  LDY #$FFFF                                ; $13D080 |
  BRA CODE_13D093                           ; $13D083 |

CODE_13D085:
  LDA $28                                   ; $13D085 |
  AND #$0001                                ; $13D087 |
  ASL A                                     ; $13D08A |
  TAY                                       ; $13D08B |
  LDX $D094,y                               ; $13D08C |
  LDA $0000,x                               ; $13D08F |
  TAY                                       ; $13D092 |

CODE_13D093:
  RTS                                       ; $13D093 |

  dw $1D8C, $1D8E                           ; $13D094 |

  LDA #$01                                  ; $13D098 |
  STA $9B                                   ; $13D09A |
  REP #$30                                  ; $13D09C |
  LDX #$0000                                ; $13D09E |
  LDA $2C                                   ; $13D0A1 |
  BEQ CODE_13D0AE                           ; $13D0A3 |
  INX                                       ; $13D0A5 |
  INX                                       ; $13D0A6 |
  CMP #$0001                                ; $13D0A7 |
  BEQ CODE_13D0AE                           ; $13D0AA |
  INX                                       ; $13D0AC |
  INX                                       ; $13D0AD |

CODE_13D0AE:
  JSR ($D0BD,x)                             ; $13D0AE |
  TYA                                       ; $13D0B1 |
  BMI CODE_13D0BA                           ; $13D0B2 |
  LDX $1D                                   ; $13D0B4 |
  STA $7F8000,x                             ; $13D0B6 |

CODE_13D0BA:
  SEP #$30                                  ; $13D0BA |
  RTL                                       ; $13D0BC |

  dw $D0C3, $D0DB, $D071                    ; $13D0BD |

  LDY $1DA0                                 ; $13D0C3 |
  LDA $2A                                   ; $13D0C6 |
  BPL CODE_13D0CD                           ; $13D0C8 |
  LDY $1D9A                                 ; $13D0CA |

CODE_13D0CD:
  LDA $12                                   ; $13D0CD |
  AND #$FF00                                ; $13D0CF |
  CMP $1D8A                                 ; $13D0D2 |
  BNE CODE_13D0DA                           ; $13D0D5 |
  LDY #$FFFF                                ; $13D0D7 |

CODE_13D0DA:
  RTS                                       ; $13D0DA |

  LDY $1D9E                                 ; $13D0DB |
  LDA $2A                                   ; $13D0DE |
  BPL CODE_13D0E5                           ; $13D0E0 |
  LDY $1D9C                                 ; $13D0E2 |

CODE_13D0E5:
  RTS                                       ; $13D0E5 |

  REP #$30                                  ; $13D0E6 |
  LDX $1D                                   ; $13D0E8 |
  JSL $01E501                               ; $13D0EA |
  BNE CODE_13D107                           ; $13D0EE |
  LDA $15                                   ; $13D0F0 |
  AND #$0001                                ; $13D0F2 |
  BEQ CODE_13D0FE                           ; $13D0F5 |
  LDA $28                                   ; $13D0F7 |
  AND #$0001                                ; $13D0F9 |
  BNE CODE_13D107                           ; $13D0FC |

CODE_13D0FE:
  LDX $1D                                   ; $13D0FE |
  LDA #$A400                                ; $13D100 |
  STA $7F8000,x                             ; $13D103 |

CODE_13D107:
  SEP #$30                                  ; $13D107 |
  RTL                                       ; $13D109 |

  REP #$30                                  ; $13D10A |
  LDX $1D                                   ; $13D10C |
  JSL $01E501                               ; $13D10E |
  BNE CODE_13D129                           ; $13D112 |
  LDA #$FFFF                                ; $13D114 |
  STA $9B                                   ; $13D117 |
  LDA $28                                   ; $13D119 |
  AND #$0001                                ; $13D11B |
  BNE CODE_13D129                           ; $13D11E |
  LDX $1D                                   ; $13D120 |
  LDA #$A400                                ; $13D122 |
  STA $7F8000,x                             ; $13D125 |

CODE_13D129:
  SEP #$30                                  ; $13D129 |
  RTL                                       ; $13D12B |

  dw $1DF6, $1DF2                           ; $13D12C |

  REP #$30                                  ; $13D130 |
  LDA $28                                   ; $13D132 |
  BEQ CODE_13D147                           ; $13D134 |
  LDA $2C                                   ; $13D136 |
  BNE CODE_13D147                           ; $13D138 |
  DEC $2E                                   ; $13D13A |
  DEC $2E                                   ; $13D13C |
  BEQ CODE_13D142                           ; $13D13E |
  BPL CODE_13D147                           ; $13D140 |

CODE_13D142:
  LDA #$0001                                ; $13D142 |
  STA $2E                                   ; $13D145 |

CODE_13D147:
  LDA $28                                   ; $13D147 |
  BNE CODE_13D14E                           ; $13D149 |
  JSR CODE_13C570                           ; $13D14B |

CODE_13D14E:
  LDA $2E                                   ; $13D14E |
  CLC                                       ; $13D150 |
  SBC $2C                                   ; $13D151 |
  BEQ CODE_13D16B                           ; $13D153 |
  CMP #$0001                                ; $13D155 |
  BEQ CODE_13D16B                           ; $13D158 |
  JSR CODE_13C15F                           ; $13D15A |
  LDA $28                                   ; $13D15D |
  INC A                                     ; $13D15F |
  CMP $00002A                               ; $13D160 |
  BNE CODE_13D1A9                           ; $13D164 |
  JSR CODE_13C64D                           ; $13D166 |
  BRA CODE_13D1A9                           ; $13D169 |

CODE_13D16B:
  ASL A                                     ; $13D16B |
  TAY                                       ; $13D16C |
  LDX $D12C,y                               ; $13D16D |
  LDA $0000,x                               ; $13D170 |
  LDX $1D                                   ; $13D173 |
  STA $7F8000,x                             ; $13D175 |
  TYA                                       ; $13D179 |
  BNE CODE_13D198                           ; $13D17A |
  LDA $1B                                   ; $13D17C |
  JSR CODE_13D22F                           ; $13D17E |
  LDA $1B                                   ; $13D181 |
  TAX                                       ; $13D183 |
  AND #$F0F0                                ; $13D184 |
  STA $0E                                   ; $13D187 |
  TXA                                       ; $13D189 |
  AND #$0F0F                                ; $13D18A |
  DEC A                                     ; $13D18D |
  AND #$0F0F                                ; $13D18E |
  ORA $0E                                   ; $13D191 |
  JSR CODE_13D218                           ; $13D193 |
  BRA CODE_13D1A9                           ; $13D196 |

CODE_13D198:
  LDA $28                                   ; $13D198 |
  INC A                                     ; $13D19A |
  CMP $2A                                   ; $13D19B |
  BNE CODE_13D1A9                           ; $13D19D |
  JSR CODE_13FD61                           ; $13D19F |
  LDA $1D2E                                 ; $13D1A2 |
  STA $7F8000,x                             ; $13D1A5 |

CODE_13D1A9:
  SEP #$30                                  ; $13D1A9 |
  RTL                                       ; $13D1AB |

  dw $1DEE, $1DEA                           ; $13D1AC |

  REP #$30                                  ; $13D1B0 |
  LDA $28                                   ; $13D1B2 |
  BEQ CODE_13D1BE                           ; $13D1B4 |
  LDA $2C                                   ; $13D1B6 |
  BNE CODE_13D1BE                           ; $13D1B8 |
  INC $2E                                   ; $13D1BA |
  INC $2E                                   ; $13D1BC |

CODE_13D1BE:
  LDA $28                                   ; $13D1BE |
  INC A                                     ; $13D1C0 |
  CMP $2A                                   ; $13D1C1 |
  BNE CODE_13D1C8                           ; $13D1C3 |
  JSR CODE_13C64D                           ; $13D1C5 |

CODE_13D1C8:
  LDA $2E                                   ; $13D1C8 |
  CLC                                       ; $13D1CA |
  SBC $2C                                   ; $13D1CB |
  BEQ CODE_13D1E0                           ; $13D1CD |
  CMP #$0001                                ; $13D1CF |
  BEQ CODE_13D1E0                           ; $13D1D2 |
  JSR CODE_13C15F                           ; $13D1D4 |
  LDA $28                                   ; $13D1D7 |
  BNE CODE_13D215                           ; $13D1D9 |
  JSR CODE_13C570                           ; $13D1DB |
  BRA CODE_13D215                           ; $13D1DE |

CODE_13D1E0:
  ASL A                                     ; $13D1E0 |
  TAY                                       ; $13D1E1 |
  LDX $D1AC,y                               ; $13D1E2 |
  LDA $0000,x                               ; $13D1E5 |
  LDX $1D                                   ; $13D1E8 |
  STA $7F8000,x                             ; $13D1EA |
  TYA                                       ; $13D1EE |
  BNE CODE_13D215                           ; $13D1EF |
  LDA $1B                                   ; $13D1F1 |
  JSR CODE_13D218                           ; $13D1F3 |
  LDA $28                                   ; $13D1F6 |
  INC A                                     ; $13D1F8 |
  CMP $2A                                   ; $13D1F9 |
  BNE CODE_13D215                           ; $13D1FB |
  LDA $1B                                   ; $13D1FD |
  TAX                                       ; $13D1FF |
  AND #$0F0F                                ; $13D200 |
  ORA #$00F0                                ; $13D203 |
  INC A                                     ; $13D206 |
  AND #$0F0F                                ; $13D207 |
  STA $0E                                   ; $13D20A |
  TXA                                       ; $13D20C |
  AND #$F0F0                                ; $13D20D |
  ORA $0E                                   ; $13D210 |
  JSR CODE_13D22F                           ; $13D212 |

CODE_13D215:
  SEP #$30                                  ; $13D215 |
  RTL                                       ; $13D217 |

CODE_13D218:
  STA $0E                                   ; $13D218 |
  JSL $12875D                               ; $13D21A |
  LDA $7F8000,x                             ; $13D21E |
  CMP $1C04                                 ; $13D222 |
  BNE CODE_13D22E                           ; $13D225 |
  LDA $1D2C                                 ; $13D227 |
  STA $7F8000,x                             ; $13D22A |

CODE_13D22E:
  RTS                                       ; $13D22E |

CODE_13D22F:
  STA $0E                                   ; $13D22F |
  JSL $12875D                               ; $13D231 |
  LDA $7F8000,x                             ; $13D235 |
  CMP $1C04                                 ; $13D239 |
  BNE CODE_13D245                           ; $13D23C |
  LDA $1D2E                                 ; $13D23E |
  STA $7F8000,x                             ; $13D241 |

CODE_13D245:
  RTS                                       ; $13D245 |

  dw $0146, $0147, $0148, $0149             ; $13D246 |
  dw $014E, $014F, $014E, $014F             ; $13D24E |
  dw $1D14, $1D12, $0145, $0150             ; $13D256 |

  REP #$30                                  ; $13D25E |
  LDY #$0000                                ; $13D260 |
  LDA $28                                   ; $13D263 |
  BEQ CODE_13D26E                           ; $13D265 |
  INY                                       ; $13D267 |
  INY                                       ; $13D268 |
  INC A                                     ; $13D269 |
  CMP $2A                                   ; $13D26A |
  BNE CODE_13D29B                           ; $13D26C |

CODE_13D26E:
  LDA $12                                   ; $13D26E |
  CMP $1C5C                                 ; $13D270 |
  BEQ CODE_13D284                           ; $13D273 |
  CMP $1C5E                                 ; $13D275 |
  BEQ CODE_13D284                           ; $13D278 |
  CMP $1CB6                                 ; $13D27A |
  BEQ CODE_13D284                           ; $13D27D |
  CMP $1CB8                                 ; $13D27F |
  BNE CODE_13D29B                           ; $13D282 |

CODE_13D284:
  LDA $2C                                   ; $13D284 |
  BEQ CODE_13D28D                           ; $13D286 |
  TYA                                       ; $13D288 |
  ORA #$0004                                ; $13D289 |
  TAY                                       ; $13D28C |

CODE_13D28D:
  LDA $D256,y                               ; $13D28D |
  CPY #$0004                                ; $13D290 |
  BCS CODE_13D2C5                           ; $13D293 |
  TAY                                       ; $13D295 |
  LDA $0000,y                               ; $13D296 |
  BRA CODE_13D2C5                           ; $13D299 |

CODE_13D29B:
  LDA $2C                                   ; $13D29B |
  BNE CODE_13D2B0                           ; $13D29D |
  LDA $12                                   ; $13D29F |
  CMP $1C5C                                 ; $13D2A1 |
  BEQ CODE_13D2AB                           ; $13D2A4 |
  CMP $1C5E                                 ; $13D2A6 |
  BNE CODE_13D2CB                           ; $13D2A9 |

CODE_13D2AB:
  LDA #$0000                                ; $13D2AB |
  BRA CODE_13D2C5                           ; $13D2AE |

CODE_13D2B0:
  JSL $128875                               ; $13D2B0 |
  AND #$0003                                ; $13D2B4 |
  ASL A                                     ; $13D2B7 |
  STA $00                                   ; $13D2B8 |
  LDA $15                                   ; $13D2BA |
  AND #$0008                                ; $13D2BC |
  ORA $00                                   ; $13D2BF |
  TAY                                       ; $13D2C1 |
  LDA $D246,y                               ; $13D2C2 |

CODE_13D2C5:
  LDX $1D                                   ; $13D2C5 |
  STA $7F8000,x                             ; $13D2C7 |

CODE_13D2CB:
  SEP #$30                                  ; $13D2CB |
  RTL                                       ; $13D2CD |

  dw $D301, $D30B, $D324, $D354             ; $13D2CE |

  REP #$30                                  ; $13D2D6 |
  LDX #$0000                                ; $13D2D8 |
  TXY                                       ; $13D2DB |
  LDA $2E                                   ; $13D2DC |
  DEC A                                     ; $13D2DE |
  BNE CODE_13D2EA                           ; $13D2DF |
  LDA $2A                                   ; $13D2E1 |
  DEC A                                     ; $13D2E3 |
  BEQ CODE_13D2F5                           ; $13D2E4 |
  INX                                       ; $13D2E6 |
  INX                                       ; $13D2E7 |
  BRA CODE_13D2F5                           ; $13D2E8 |

CODE_13D2EA:
  INX                                       ; $13D2EA |
  INX                                       ; $13D2EB |
  INX                                       ; $13D2EC |
  INX                                       ; $13D2ED |
  LDA $2A                                   ; $13D2EE |
  DEC A                                     ; $13D2F0 |
  BEQ CODE_13D2F5                           ; $13D2F1 |
  INX                                       ; $13D2F3 |
  INX                                       ; $13D2F4 |

CODE_13D2F5:
  JSR ($D2CE,x)                             ; $13D2F5 |
  LDX $1D                                   ; $13D2F8 |
  STA $7F8000,x                             ; $13D2FA |
  SEP #$30                                  ; $13D2FE |
  RTL                                       ; $13D300 |

  LDA #$720D                                ; $13D301 |
  RTS                                       ; $13D304 |

  dw $7209, $720A, $720B                    ; $13D305 |

  LDA $28                                   ; $13D30B |
  BEQ CODE_13D318                           ; $13D30D |
  INY                                       ; $13D30F |
  INY                                       ; $13D310 |
  INC A                                     ; $13D311 |
  CMP $2A                                   ; $13D312 |
  BNE CODE_13D318                           ; $13D314 |
  INY                                       ; $13D316 |
  INY                                       ; $13D317 |

CODE_13D318:
  LDA $D305,y                               ; $13D318 |
  RTS                                       ; $13D31B |

  dw $720C, $720E, $7213, $720F             ; $13D31C |

  LDA $2C                                   ; $13D324 |
  BEQ CODE_13D337                           ; $13D326 |
  LDY #$0006                                ; $13D328 |
  INC A                                     ; $13D32B |
  CMP $2E                                   ; $13D32C |
  BEQ CODE_13D337                           ; $13D32E |
  AND #$0001                                ; $13D330 |
  ASL A                                     ; $13D333 |
  TAY                                       ; $13D334 |
  INY                                       ; $13D335 |
  INY                                       ; $13D336 |

CODE_13D337:
  LDA $D31C,y                               ; $13D337 |
  RTS                                       ; $13D33A |

  RTS                                       ; $13D33B |

  dw $7200, $7201, $7202, $7203             ; $13D33C |
  dw $7204, $7205, $7210, $7211             ; $13D344 |
  dw $7212, $7206, $7207, $7208             ; $13D34C |

  LDA $2C                                   ; $13D354 |
  BEQ CODE_13D36B                           ; $13D356 |
  LDY #$0012                                ; $13D358 |
  INC A                                     ; $13D35B |
  CMP $2E                                   ; $13D35C |
  BEQ CODE_13D36B                           ; $13D35E |
  LDY #$0006                                ; $13D360 |
  AND #$0001                                ; $13D363 |
  BEQ CODE_13D36B                           ; $13D366 |
  LDY #$000C                                ; $13D368 |

CODE_13D36B:
  LDA $28                                   ; $13D36B |
  BEQ CODE_13D378                           ; $13D36D |
  INY                                       ; $13D36F |
  INY                                       ; $13D370 |
  INC A                                     ; $13D371 |
  CMP $2A                                   ; $13D372 |
  BNE CODE_13D378                           ; $13D374 |
  INY                                       ; $13D376 |
  INY                                       ; $13D377 |

CODE_13D378:
  LDA $D33C,y                               ; $13D378 |
  RTS                                       ; $13D37B |

  dw $016F, $0170, $0171, $0172             ; $13D37C |

  REP #$30                                  ; $13D384 |
  LDA $2C                                   ; $13D386 |
  CMP #$0002                                ; $13D388 |
  BCC CODE_13D3B3                           ; $13D38B |
  LDA $12                                   ; $13D38D |
  CMP #$00C3                                ; $13D38F |
  BEQ CODE_13D3A5                           ; $13D392 |
  CMP #$00C7                                ; $13D394 |
  BEQ CODE_13D3A9                           ; $13D397 |
  CMP #$00C5                                ; $13D399 |
  BEQ CODE_13D3AE                           ; $13D39C |
  CMP #$00C2                                ; $13D39E |
  BNE CODE_13D3E4                           ; $13D3A1 |
  BRA CODE_13D3A9                           ; $13D3A3 |

CODE_13D3A5:
  LDA $28                                   ; $13D3A5 |
  BEQ CODE_13D3E4                           ; $13D3A7 |

CODE_13D3A9:
  LDA #$00C6                                ; $13D3A9 |
  BRA CODE_13D3DE                           ; $13D3AC |

CODE_13D3AE:
  LDA #$00D5                                ; $13D3AE |
  BRA CODE_13D3DE                           ; $13D3B1 |

CODE_13D3B3:
  ASL A                                     ; $13D3B3 |
  ASL A                                     ; $13D3B4 |
  STA $00                                   ; $13D3B5 |
  LDA $28                                   ; $13D3B7 |
  AND #$0001                                ; $13D3B9 |
  ASL A                                     ; $13D3BC |
  ORA $00                                   ; $13D3BD |
  TAY                                       ; $13D3BF |
  LDA $12                                   ; $13D3C0 |
  CMP #$00B6                                ; $13D3C2 |
  BEQ CODE_13D3E4                           ; $13D3C5 |
  CMP #$00B7                                ; $13D3C7 |
  BEQ CODE_13D3E4                           ; $13D3CA |
  CMP #$00B8                                ; $13D3CC |
  BEQ CODE_13D3E4                           ; $13D3CF |
  CMP #$00B9                                ; $13D3D1 |
  BEQ CODE_13D3E4                           ; $13D3D4 |
  CMP #$00BA                                ; $13D3D6 |
  BEQ CODE_13D3E4                           ; $13D3D9 |
  LDA $D37C,y                               ; $13D3DB |

CODE_13D3DE:
  LDX $1D                                   ; $13D3DE |
  STA $7F8000,x                             ; $13D3E0 |

CODE_13D3E4:
  SEP #$30                                  ; $13D3E4 |
  RTL                                       ; $13D3E6 |

  dw $3D70, $3DA7, $3D6F                    ; $13D3E7 |

  REP #$10                                  ; $13D3ED |
  LDX $1D                                   ; $13D3EF |
  LDY #$0002                                ; $13D3F1 |
  LDA $2C                                   ; $13D3F4 |
  INC A                                     ; $13D3F6 |
  CMP $2E                                   ; $13D3F7 |
  BEQ CODE_13D402                           ; $13D3F9 |
  JSL $128875                               ; $13D3FB |
  AND #$A801                                ; $13D3FF |

CODE_13D402:
  REP #$20                                  ; $13D402 |
  TYA                                       ; $13D404 |
  AND #$0003                                ; $13D405 |
  ASL A                                     ; $13D408 |
  TAY                                       ; $13D409 |
  LDA $D3E7,y                               ; $13D40A |
  STA $7F8000,x                             ; $13D40D |
  SEP #$30                                  ; $13D411 |
  RTL                                       ; $13D413 |

  dw $7500, $7501, $3DAA, $3DAB             ; $13D414 |

  REP #$30                                  ; $13D41C |
  LDX $1D                                   ; $13D41E |
  LDA $28                                   ; $13D420 |
  AND #$0001                                ; $13D422 |
  ASL A                                     ; $13D425 |
  STA $00                                   ; $13D426 |
  LDA $2C                                   ; $13D428 |
  ASL A                                     ; $13D42A |
  ASL A                                     ; $13D42B |
  ORA $00                                   ; $13D42C |
  TAY                                       ; $13D42E |
  LDA $D414,y                               ; $13D42F |
  STA $7F8000,x                             ; $13D432 |
  SEP #$30                                  ; $13D436 |
  RTL                                       ; $13D438 |

  dw $1A0E, $1A22, $3DBF, $3DBE             ; $13D439 |
  dw $3DDB, $3DDA, $1A46, $1A36             ; $13D441 |
  dw $3DC0, $3DBD, $1A48, $1A38             ; $13D449 |
  dw $3DDC, $3DD9, $1A56, $1A2C             ; $13D451 |
  dw $3DC1, $3DBC, $3DBF, $3DBE             ; $13D459 |
  dw $1A58, $1A32, $3DDD, $3DD8             ; $13D461 |
  dw $3DDB, $3DDA                           ; $13D469 |

  dw $D4D8, $D4FD, $D536                    ; $13D46D |

  REP #$30                                  ; $13D473 |
  LDA $2C                                   ; $13D475 |
  CMP #$0003                                ; $13D477 |
  BCS CODE_13D4D5                           ; $13D47A |
  ASL A                                     ; $13D47C |
  ASL A                                     ; $13D47D |
  TAY                                       ; $13D47E |
  LDA $2A                                   ; $13D47F |
  BPL CODE_13D485                           ; $13D481 |
  INY                                       ; $13D483 |
  INY                                       ; $13D484 |

CODE_13D485:
  STZ $00                                   ; $13D485 |
  LDA $12                                   ; $13D487 |
  BEQ CODE_13D4B9                           ; $13D489 |
  CMP $1C5C                                 ; $13D48B |
  BEQ CODE_13D4B7                           ; $13D48E |
  CMP $1C5E                                 ; $13D490 |
  BEQ CODE_13D4B7                           ; $13D493 |
  CMP #$3DB0                                ; $13D495 |
  BEQ CODE_13D4B5                           ; $13D498 |
  CMP #$3DB1                                ; $13D49A |
  BEQ CODE_13D4B5                           ; $13D49D |
  CMP #$3DB9                                ; $13D49F |
  BEQ CODE_13D4B5                           ; $13D4A2 |
  CMP #$3DBA                                ; $13D4A4 |
  BEQ CODE_13D4B5                           ; $13D4A7 |
  CMP $1A0C                                 ; $13D4A9 |
  BEQ CODE_13D4B9                           ; $13D4AC |
  CMP $1A18                                 ; $13D4AE |
  BEQ CODE_13D4B9                           ; $13D4B1 |
  INC $00                                   ; $13D4B3 |

CODE_13D4B5:
  INC $00                                   ; $13D4B5 |

CODE_13D4B7:
  INC $00                                   ; $13D4B7 |

CODE_13D4B9:
  LDX #$0000                                ; $13D4B9 |
  LDA $28                                   ; $13D4BC |
  BEQ CODE_13D4C9                           ; $13D4BE |
  INX                                       ; $13D4C0 |
  INX                                       ; $13D4C1 |
  AND #$0001                                ; $13D4C2 |
  BNE CODE_13D4C9                           ; $13D4C5 |
  INX                                       ; $13D4C7 |
  INX                                       ; $13D4C8 |

CODE_13D4C9:
  JSR ($D46D,x)                             ; $13D4C9 |
  TYA                                       ; $13D4CC |
  BEQ CODE_13D4D5                           ; $13D4CD |
  LDX $1D                                   ; $13D4CF |
  STA $7F8000,x                             ; $13D4D1 |

CODE_13D4D5:
  SEP #$30                                  ; $13D4D5 |
  RTL                                       ; $13D4D7 |

  STZ $9B                                   ; $13D4D8 |
  LDA $2C                                   ; $13D4DA |
  CMP #$0002                                ; $13D4DC |
  BCC CODE_13D4E6                           ; $13D4DF |
  LDA #$0000                                ; $13D4E1 |
  BRA CODE_13D4FB                           ; $13D4E4 |

CODE_13D4E6:
  LDA $00                                   ; $13D4E6 |
  BEQ CODE_13D4F0                           ; $13D4E8 |
  TYA                                       ; $13D4EA |
  CLC                                       ; $13D4EB |
  ADC #$0004                                ; $13D4EC |
  TAY                                       ; $13D4EF |

CODE_13D4F0:
  LDA $D439,y                               ; $13D4F0 |
  LDX $2C                                   ; $13D4F3 |
  BNE CODE_13D4FB                           ; $13D4F5 |
  TAX                                       ; $13D4F7 |
  LDA $0000,x                               ; $13D4F8 |

CODE_13D4FB:
  TAY                                       ; $13D4FB |
  RTS                                       ; $13D4FC |

  STZ $9B                                   ; $13D4FD |
  LDA $2C                                   ; $13D4FF |
  CMP #$0002                                ; $13D501 |
  BCC CODE_13D50B                           ; $13D504 |
  LDA #$0000                                ; $13D506 |
  BRA CODE_13D52C                           ; $13D509 |

CODE_13D50B:
  LDA $000000                               ; $13D50B |
  BEQ CODE_13D521                           ; $13D50F |
  CMP #$0002                                ; $13D511 |
  BCC CODE_13D51B                           ; $13D514 |
  LDA #$0000                                ; $13D516 |
  BRA CODE_13D52C                           ; $13D519 |

CODE_13D51B:
  TYA                                       ; $13D51B |
  CLC                                       ; $13D51C |
  ADC #$0008                                ; $13D51D |
  TAY                                       ; $13D520 |

CODE_13D521:
  LDA $D445,y                               ; $13D521 |
  LDX $2C                                   ; $13D524 |
  BNE CODE_13D52C                           ; $13D526 |
  TAX                                       ; $13D528 |
  LDA $0000,x                               ; $13D529 |

CODE_13D52C:
  TAY                                       ; $13D52C |
  RTS                                       ; $13D52D |

  dw $D54D, $D553, $D559, $D559             ; $13D52E |

  LDA #$0001                                ; $13D536 |
  STA $9B                                   ; $13D539 |
  LDA $00                                   ; $13D53B |
  ASL A                                     ; $13D53D |
  TAX                                       ; $13D53E |
  JSR ($D52E,x)                             ; $13D53F |
  LDY $02                                   ; $13D542 |
  LDX $2C                                   ; $13D544 |
  BNE CODE_13D54C                           ; $13D546 |
  LDA $0000,y                               ; $13D548 |
  TAY                                       ; $13D54B |

CODE_13D54C:
  RTS                                       ; $13D54C |

  LDA $D455,y                               ; $13D54D |
  STA $02                                   ; $13D550 |
  RTS                                       ; $13D552 |

  LDA $D461,y                               ; $13D553 |
  STA $02                                   ; $13D556 |
  RTS                                       ; $13D558 |

  STZ $02                                   ; $13D559 |
  RTS                                       ; $13D55B |

  dw $1A0C, $1A18, $3DB1, $3DB0             ; $13D55C |
  dw $3DB6, $3DB5, $1A1E, $1A06             ; $13D564 |
  dw $3DBB, $3DB8, $3DBA, $3DB9             ; $13D56C |

  REP #$30                                  ; $13D574 |
  LDA $2C                                   ; $13D576 |
  CMP #$0003                                ; $13D578 |
  BCS CODE_13D5BF                           ; $13D57B |
  LDA #$0001                                ; $13D57D |
  STA $9B                                   ; $13D580 |
  STZ $00                                   ; $13D582 |
  LDA $2A                                   ; $13D584 |
  BPL CODE_13D58D                           ; $13D586 |
  LDA #$0002                                ; $13D588 |
  STA $00                                   ; $13D58B |

CODE_13D58D:
  LDA $2C                                   ; $13D58D |
  ASL A                                     ; $13D58F |
  ASL A                                     ; $13D590 |
  ORA $00                                   ; $13D591 |
  TAY                                       ; $13D593 |
  LDA $28                                   ; $13D594 |
  BNE CODE_13D5B3                           ; $13D596 |
  STZ $9B                                   ; $13D598 |
  LDA $12                                   ; $13D59A |
  BEQ CODE_13D5AE                           ; $13D59C |
  CMP $1C5C                                 ; $13D59E |
  BEQ CODE_13D5A8                           ; $13D5A1 |
  CMP $1C5E                                 ; $13D5A3 |
  BNE CODE_13D5BF                           ; $13D5A6 |

CODE_13D5A8:
  TYA                                       ; $13D5A8 |
  CLC                                       ; $13D5A9 |
  ADC #$0004                                ; $13D5AA |
  TAY                                       ; $13D5AD |

CODE_13D5AE:
  JSR CODE_13D5C2                           ; $13D5AE |
  BRA CODE_13D5B6                           ; $13D5B1 |

CODE_13D5B3:
  JSR CODE_13D5E7                           ; $13D5B3 |

CODE_13D5B6:
  TYA                                       ; $13D5B6 |
  BEQ CODE_13D5BF                           ; $13D5B7 |
  LDX $1D                                   ; $13D5B9 |
  STA $7F8000,x                             ; $13D5BB |

CODE_13D5BF:
  SEP #$30                                  ; $13D5BF |
  RTL                                       ; $13D5C1 |

CODE_13D5C2:
  LDA $2C                                   ; $13D5C2 |
  CMP #$0002                                ; $13D5C4 |
  BCC CODE_13D5CE                           ; $13D5C7 |
  LDA #$0000                                ; $13D5C9 |
  BRA CODE_13D5D9                           ; $13D5CC |

CODE_13D5CE:
  LDA $D55C,y                               ; $13D5CE |
  LDX $2C                                   ; $13D5D1 |
  BNE CODE_13D5D9                           ; $13D5D3 |
  TAX                                       ; $13D5D5 |
  LDA $0000,x                               ; $13D5D6 |

CODE_13D5D9:
  TAY                                       ; $13D5D9 |
  RTS                                       ; $13D5DA |

  dw $1A20, $1A04, $3DB7, $3DB4             ; $13D5DB |
  dw $3DB6, $3DB5                           ; $13D5E3 |

CODE_13D5E7:
  LDA $12                                   ; $13D5E7 |
  BEQ CODE_13D5FF                           ; $13D5E9 |
  CMP $1C5C                                 ; $13D5EB |
  BEQ CODE_13D5FA                           ; $13D5EE |
  CMP $1C5E                                 ; $13D5F0 |
  BEQ CODE_13D5FA                           ; $13D5F3 |
  LDA #$0000                                ; $13D5F5 |
  BRA CODE_13D60A                           ; $13D5F8 |

CODE_13D5FA:
  LDA $D5DB,y                               ; $13D5FA |
  BRA CODE_13D602                           ; $13D5FD |

CODE_13D5FF:
  LDA $D568,y                               ; $13D5FF |

CODE_13D602:
  LDX $2C                                   ; $13D602 |
  BNE CODE_13D60A                           ; $13D604 |
  TAX                                       ; $13D606 |
  LDA $0000,x                               ; $13D607 |

CODE_13D60A:
  TAY                                       ; $13D60A |
  RTS                                       ; $13D60B |

  dw $3DC2, $3DC3, $3DC4, $0000             ; $13D60C |
  dw $3DC8, $3DC9, $3DCA                    ; $13D614 |

  REP #$30                                  ; $13D61A |
  LDA $2C                                   ; $13D61C |
  CMP #$0002                                ; $13D61E |
  BCS CODE_13D635                           ; $13D621 |
  LDA $28                                   ; $13D623 |
  ASL A                                     ; $13D625 |
  STA $00                                   ; $13D626 |
  LDA $2C                                   ; $13D628 |
  ASL A                                     ; $13D62A |
  ASL A                                     ; $13D62B |
  ASL A                                     ; $13D62C |
  ORA $00                                   ; $13D62D |
  TAY                                       ; $13D62F |
  LDA $D60C,y                               ; $13D630 |
  BRA CODE_13D65E                           ; $13D633 |

CODE_13D635:
  LDA $28                                   ; $13D635 |
  BEQ CODE_13D664                           ; $13D637 |
  INC A                                     ; $13D639 |
  CMP $2A                                   ; $13D63A |
  BEQ CODE_13D664                           ; $13D63C |
  LDA #$3DB2                                ; $13D63E |
  LDY $2C                                   ; $13D641 |
  INY                                       ; $13D643 |
  CPY $2E                                   ; $13D644 |
  BNE CODE_13D65E                           ; $13D646 |
  LDY $1A0A                                 ; $13D648 |
  LDA $12                                   ; $13D64B |
  CMP $1A06                                 ; $13D64D |
  BEQ CODE_13D65D                           ; $13D650 |
  LDY $1A30                                 ; $13D652 |
  CMP $1A2C                                 ; $13D655 |
  BEQ CODE_13D65D                           ; $13D658 |
  LDY #$3DAC                                ; $13D65A |

CODE_13D65D:
  TYA                                       ; $13D65D |

CODE_13D65E:
  LDX $1D                                   ; $13D65E |
  STA $7F8000,x                             ; $13D660 |

CODE_13D664:
  SEP #$30                                  ; $13D664 |
  RTL                                       ; $13D666 |

  dw $3DC5, $3DC6, $3DC7, $0000             ; $13D667 |
  dw $3DCB, $3DAE, $3DAF                    ; $13D66F |

  REP #$30                                  ; $13D675 |
  LDA $2C                                   ; $13D677 |
  CMP #$0002                                ; $13D679 |
  BCS CODE_13D690                           ; $13D67C |
  LDA $28                                   ; $13D67E |
  ASL A                                     ; $13D680 |
  STA $00                                   ; $13D681 |
  LDA $2C                                   ; $13D683 |
  ASL A                                     ; $13D685 |
  ASL A                                     ; $13D686 |
  ASL A                                     ; $13D687 |
  ORA $00                                   ; $13D688 |
  TAY                                       ; $13D68A |
  LDA $D667,y                               ; $13D68B |
  BRA CODE_13D6B9                           ; $13D68E |

CODE_13D690:
  LDA $28                                   ; $13D690 |
  BEQ CODE_13D6BF                           ; $13D692 |
  INC A                                     ; $13D694 |
  CMP $2A                                   ; $13D695 |
  BEQ CODE_13D6BF                           ; $13D697 |
  LDA #$3DB3                                ; $13D699 |
  LDY $2C                                   ; $13D69C |
  INY                                       ; $13D69E |
  CPY $2E                                   ; $13D69F |
  BNE CODE_13D6B9                           ; $13D6A1 |
  LDY $1A1A                                 ; $13D6A3 |
  LDA $12                                   ; $13D6A6 |
  CMP $1A1E                                 ; $13D6A8 |
  BEQ CODE_13D6B8                           ; $13D6AB |
  LDY $1A52                                 ; $13D6AD |
  CMP $1A56                                 ; $13D6B0 |
  BEQ CODE_13D6B8                           ; $13D6B3 |
  LDY #$3DAD                                ; $13D6B5 |

CODE_13D6B8:
  TYA                                       ; $13D6B8 |

CODE_13D6B9:
  LDX $1D                                   ; $13D6B9 |
  STA $7F8000,x                             ; $13D6BB |

CODE_13D6BF:
  SEP #$30                                  ; $13D6BF |
  RTL                                       ; $13D6C1 |

  dw $3DCE, $3DCF, $3DD0, $0000             ; $13D6C2 |
  dw $3DD1, $3DD2, $3DD3, $3DD4             ; $13D6CA |

  REP #$30                                  ; $13D6D2 |
  LDX $1D                                   ; $13D6D4 |
  LDA $2C                                   ; $13D6D6 |
  CMP #$0002                                ; $13D6D8 |
  BCS CODE_13D6F1                           ; $13D6DB |
  LDA $28                                   ; $13D6DD |
  ASL A                                     ; $13D6DF |
  STA $00                                   ; $13D6E0 |
  LDA $2C                                   ; $13D6E2 |
  ASL A                                     ; $13D6E4 |
  ASL A                                     ; $13D6E5 |
  ASL A                                     ; $13D6E6 |
  ORA $00                                   ; $13D6E7 |
  TAY                                       ; $13D6E9 |
  LDA $D6C2,y                               ; $13D6EA |
  BEQ CODE_13D716                           ; $13D6ED |
  BRA CODE_13D712                           ; $13D6EF |

CODE_13D6F1:
  LDA $28                                   ; $13D6F1 |
  BEQ CODE_13D716                           ; $13D6F3 |
  INC A                                     ; $13D6F5 |
  CMP $2A                                   ; $13D6F6 |
  BEQ CODE_13D716                           ; $13D6F8 |
  LDY $2C                                   ; $13D6FA |
  INY                                       ; $13D6FC |
  CPY $2E                                   ; $13D6FD |
  BEQ CODE_13D70B                           ; $13D6FF |
  CMP #$0003                                ; $13D701 |
  BCS CODE_13D716                           ; $13D704 |
  LDA #$3DD5                                ; $13D706 |
  BRA CODE_13D712                           ; $13D709 |

CODE_13D70B:
  AND #$0001                                ; $13D70B |
  CLC                                       ; $13D70E |
  ADC #$3DD6                                ; $13D70F |

CODE_13D712:
  STA $7F8000,x                             ; $13D712 |

CODE_13D716:
  SEP #$30                                  ; $13D716 |
  RTL                                       ; $13D718 |

  dw $7600, $7601, $7775, $7776             ; $13D719 |
  dw $7602, $7603, $7777, $7778             ; $13D721 |
  dw $7604, $7605, $7779, $777A             ; $13D729 |
  dw $7606, $7607, $777B, $777C             ; $13D731 |

  REP #$30                                  ; $13D739 |
  LDA $15                                   ; $13D73B |
  AND #$0003                                ; $13D73D |
  ASL A                                     ; $13D740 |
  ASL A                                     ; $13D741 |
  ASL A                                     ; $13D742 |
  STA $00                                   ; $13D743 |
  LDA $28                                   ; $13D745 |
  AND #$0001                                ; $13D747 |
  ASL A                                     ; $13D74A |
  ORA $00                                   ; $13D74B |
  STA $00                                   ; $13D74D |
  LDA $2C                                   ; $13D74F |
  AND #$0001                                ; $13D751 |
  ASL A                                     ; $13D754 |
  ASL A                                     ; $13D755 |
  ORA $00                                   ; $13D756 |
  TAY                                       ; $13D758 |
  LDA $D719,y                               ; $13D759 |
  LDX $1D                                   ; $13D75C |
  STA $7F8000,x                             ; $13D75E |
  SEP #$30                                  ; $13D762 |
  RTL                                       ; $13D764 |

  dw $D794, $D7A0, $D7C2                    ; $13D765 |

  REP #$30                                  ; $13D76B |
  LDX #$0000                                ; $13D76D |
  LDA $28                                   ; $13D770 |
  AND #$0001                                ; $13D772 |
  ASL A                                     ; $13D775 |
  TAY                                       ; $13D776 |
  LDA $2C                                   ; $13D777 |
  BEQ CODE_13D784                           ; $13D779 |
  INX                                       ; $13D77B |
  INX                                       ; $13D77C |
  CMP #$0001                                ; $13D77D |
  BEQ CODE_13D784                           ; $13D780 |
  INX                                       ; $13D782 |
  INX                                       ; $13D783 |

CODE_13D784:
  JSR ($D765,x)                             ; $13D784 |
  LDX $1D                                   ; $13D787 |
  STA $7F8000,x                             ; $13D789 |
  SEP #$30                                  ; $13D78D |
  RTL                                       ; $13D78F |

  dw $7750, $7754                           ; $13D790 |

  LDA $D790,y                               ; $13D794 |
  RTS                                       ; $13D797 |

  dw $7800, $7801, $7802, $7803             ; $13D798 |

  LDA $2A                                   ; $13D7A0 |
  CMP #$0001                                ; $13D7A2 |
  BNE CODE_13D7AC                           ; $13D7A5 |
  LDA #$7804                                ; $13D7A7 |
  BRA CODE_13D7BD                           ; $13D7AA |

CODE_13D7AC:
  LDA $28                                   ; $13D7AC |
  BEQ CODE_13D7BA                           ; $13D7AE |
  INY                                       ; $13D7B0 |
  INY                                       ; $13D7B1 |
  INC A                                     ; $13D7B2 |
  CMP $2A                                   ; $13D7B3 |
  BNE CODE_13D7BA                           ; $13D7B5 |
  LDY #$0006                                ; $13D7B7 |

CODE_13D7BA:
  LDA $D798,y                               ; $13D7BA |

CODE_13D7BD:
  RTS                                       ; $13D7BD |

  dw $01B7, $01B8                           ; $13D7BE |

  LDA $2C                                   ; $13D7C2 |
  CLC                                       ; $13D7C4 |
  ADC $28                                   ; $13D7C5 |
  AND #$0001                                ; $13D7C7 |
  ASL A                                     ; $13D7CA |
  TAY                                       ; $13D7CB |
  LDA $D7BE,y                               ; $13D7CC |
  RTS                                       ; $13D7CF |

  dw $01B9, $01BA, $01BB, $0000             ; $13D7D0 |
  dw $01BC, $01BD, $01BE                    ; $13D7D8 |

  REP #$30                                  ; $13D7DE |
  LDA $2C                                   ; $13D7E0 |
  CMP #$0002                                ; $13D7E2 |
  BCC CODE_13D7F6                           ; $13D7E5 |
  LDA $28                                   ; $13D7E7 |
  BEQ CODE_13D80A                           ; $13D7E9 |
  INC A                                     ; $13D7EB |
  CMP $2A                                   ; $13D7EC |
  BEQ CODE_13D80A                           ; $13D7EE |
  JSL $1380B4                               ; $13D7F0 |
  BRA CODE_13D80A                           ; $13D7F4 |

CODE_13D7F6:
  ASL A                                     ; $13D7F6 |
  ASL A                                     ; $13D7F7 |
  ASL A                                     ; $13D7F8 |
  STA $00                                   ; $13D7F9 |
  LDA $28                                   ; $13D7FB |
  ASL A                                     ; $13D7FD |
  ORA $00                                   ; $13D7FE |
  TAY                                       ; $13D800 |
  LDA $D7D0,y                               ; $13D801 |
  LDX $1D                                   ; $13D804 |
  STA $7F8000,x                             ; $13D806 |

CODE_13D80A:
  SEP #$30                                  ; $13D80A |
  RTL                                       ; $13D80C |

  dw $0000, $7701, $7702, $7703             ; $13D80D |
  dw $7710, $7711, $7712, $7713             ; $13D815 |
  dw $7730, $7731, $7732, $0000             ; $13D81D |
  dw $7740, $7741, $7742, $7743             ; $13D825 |
  dw $7700, $7704, $7708, $770C             ; $13D82D |
  dw $7733, $7737, $773B, $773F             ; $13D835 |
  dw $7723, $7727, $772B, $772F             ; $13D83D |

  dw $D896, $D8CE, $D8AC, $D8BF             ; $13D845 |
  dw $D8DD, $D916, $D907, $D8F4             ; $13D84D |

  REP #$30                                  ; $13D855 |
  LDA $2C                                   ; $13D857 |
  AND #$0001                                ; $13D859 |
  ASL A                                     ; $13D85C |
  ASL A                                     ; $13D85D |
  ASL A                                     ; $13D85E |
  STA $00                                   ; $13D85F |
  LDX #$0000                                ; $13D861 |
  LDA $2C                                   ; $13D864 |
  CMP #$0002                                ; $13D866 |
  BCC CODE_13D87B                           ; $13D869 |
  INX                                       ; $13D86B |
  INX                                       ; $13D86C |
  INC A                                     ; $13D86D |
  CMP $2E                                   ; $13D86E |
  BEQ CODE_13D87B                           ; $13D870 |
  INX                                       ; $13D872 |
  INX                                       ; $13D873 |
  AND #$0001                                ; $13D874 |
  BNE CODE_13D87B                           ; $13D877 |
  INX                                       ; $13D879 |
  INX                                       ; $13D87A |

CODE_13D87B:
  LDA $2E                                   ; $13D87B |
  AND #$0001                                ; $13D87D |
  BEQ CODE_13D887                           ; $13D880 |
  JSR ($D845,x)                             ; $13D882 |
  BRA CODE_13D88A                           ; $13D885 |

CODE_13D887:
  JSR ($D84D,x)                             ; $13D887 |

CODE_13D88A:
  TYA                                       ; $13D88A |
  BEQ CODE_13D893                           ; $13D88B |
  LDX $1D                                   ; $13D88D |
  STA $7F8000,x                             ; $13D88F |

CODE_13D893:
  SEP #$30                                  ; $13D893 |
  RTL                                       ; $13D895 |

  LDA $28                                   ; $13D896 |
  ASL A                                     ; $13D898 |
  ORA $00                                   ; $13D899 |
  TAY                                       ; $13D89B |
  LDA $D80D,y                               ; $13D89C |
  BEQ CODE_13D8AA                           ; $13D89F |
  CLC                                       ; $13D8A1 |
  ADC $15                                   ; $13D8A2 |
  ADC $15                                   ; $13D8A4 |
  ADC $15                                   ; $13D8A6 |
  ADC $15                                   ; $13D8A8 |

CODE_13D8AA:
  TAY                                       ; $13D8AA |
  RTS                                       ; $13D8AB |

  LDA $28                                   ; $13D8AC |
  CMP #$0002                                ; $13D8AE |
  BNE CODE_13D8BB                           ; $13D8B1 |
  LDA $A1                                   ; $13D8B3 |
  TAY                                       ; $13D8B5 |
  LDA $D82D,y                               ; $13D8B6 |
  TAY                                       ; $13D8B9 |
  RTS                                       ; $13D8BA |

CODE_13D8BB:
  LDY #$0000                                ; $13D8BB |
  RTS                                       ; $13D8BE |

  LDA $28                                   ; $13D8BF |
  CMP #$0002                                ; $13D8C1 |
  BNE CODE_13D8BB                           ; $13D8C4 |
  LDA $A1                                   ; $13D8C6 |
  TAY                                       ; $13D8C8 |
  LDA $D835,y                               ; $13D8C9 |
  TAY                                       ; $13D8CC |
  RTS                                       ; $13D8CD |

  LDA $28                                   ; $13D8CE |
  CMP #$0002                                ; $13D8D0 |
  BNE CODE_13D8BB                           ; $13D8D3 |
  LDA $A1                                   ; $13D8D5 |
  TAY                                       ; $13D8D7 |
  LDA $D83D,y                               ; $13D8D8 |
  TAY                                       ; $13D8DB |
  RTS                                       ; $13D8DC |

  LDA $28                                   ; $13D8DD |
  ASL A                                     ; $13D8DF |
  ORA $00                                   ; $13D8E0 |
  TAY                                       ; $13D8E2 |
  LDA $D81D,y                               ; $13D8E3 |
  BEQ CODE_13D8F1                           ; $13D8E6 |
  CLC                                       ; $13D8E8 |
  ADC $15                                   ; $13D8E9 |
  ADC $15                                   ; $13D8EB |
  ADC $15                                   ; $13D8ED |
  ADC $15                                   ; $13D8EF |

CODE_13D8F1:
  TAY                                       ; $13D8F1 |
  RTS                                       ; $13D8F2 |

  RTS                                       ; $13D8F3 |

  LDA $28                                   ; $13D8F4 |
  CMP #$0001                                ; $13D8F6 |
  BNE CODE_13D903                           ; $13D8F9 |
  LDA $A1                                   ; $13D8FB |
  TAY                                       ; $13D8FD |
  LDA $D82D,y                               ; $13D8FE |
  TAY                                       ; $13D901 |
  RTS                                       ; $13D902 |

CODE_13D903:
  LDY #$0000                                ; $13D903 |
  RTS                                       ; $13D906 |

  LDA $28                                   ; $13D907 |
  CMP #$0001                                ; $13D909 |
  BNE CODE_13D903                           ; $13D90C |
  LDA $A1                                   ; $13D90E |
  TAY                                       ; $13D910 |
  LDA $D835,y                               ; $13D911 |
  TAY                                       ; $13D914 |
  RTS                                       ; $13D915 |

  LDA $28                                   ; $13D916 |
  CMP #$0001                                ; $13D918 |
  BNE CODE_13D903                           ; $13D91B |
  LDA $A1                                   ; $13D91D |
  TAY                                       ; $13D91F |
  LDA $D83D,y                               ; $13D920 |
  TAY                                       ; $13D923 |
  RTS                                       ; $13D924 |

  dw $D977, $D98D, $D97F, $D986             ; $13D925 |
  dw $D97B, $D98D, $D986, $D97F             ; $13D92D |

  dw $7722, $7724, $7728, $772C             ; $13D935 |
  dw $7751, $7757, $775A, $775D             ; $13D93D |

  REP #$30                                  ; $13D945 |
  LDA $15                                   ; $13D947 |
  ASL A                                     ; $13D949 |
  TAY                                       ; $13D94A |
  LDX #$0000                                ; $13D94B |
  LDA $2C                                   ; $13D94E |
  BEQ CODE_13D962                           ; $13D950 |
  INX                                       ; $13D952 |
  INX                                       ; $13D953 |
  INC A                                     ; $13D954 |
  CMP $2E                                   ; $13D955 |
  BEQ CODE_13D962                           ; $13D957 |
  INX                                       ; $13D959 |
  INX                                       ; $13D95A |
  AND #$0001                                ; $13D95B |
  BEQ CODE_13D962                           ; $13D95E |
  INX                                       ; $13D960 |
  INX                                       ; $13D961 |

CODE_13D962:
  LDA $2E                                   ; $13D962 |
  AND #$0001                                ; $13D964 |
  BNE CODE_13D970                           ; $13D967 |
  JSR ($D925,x)                             ; $13D969 |
  TAY                                       ; $13D96C |
  JMP CODE_13D88A                           ; $13D96D |

CODE_13D970:
  JSR ($D92D,x)                             ; $13D970 |
  TAY                                       ; $13D973 |
  JMP CODE_13D88A                           ; $13D974 |
  LDA $D935,y                               ; $13D977 |
  RTS                                       ; $13D97A |

  LDA $D93D,y                               ; $13D97B |
  RTS                                       ; $13D97E |

  LDA $A1                                   ; $13D97F |
  TAY                                       ; $13D981 |
  LDA $D82D,y                               ; $13D982 |
  RTS                                       ; $13D985 |

  LDA $A1                                   ; $13D986 |
  TAY                                       ; $13D988 |
  LDA $D835,y                               ; $13D989 |
  RTS                                       ; $13D98C |

  LDA $A1                                   ; $13D98D |
  TAY                                       ; $13D98F |
  LDA $D83D,y                               ; $13D990 |
  RTS                                       ; $13D993 |

  dw $DA01, $DA05, $D98D, $D97F             ; $13D994 |
  dw $D986, $DA09, $DA0D, $D98D             ; $13D99C |
  dw $D986, $D97F                           ; $13D9A4 |

  dw $7753, $7756, $7759, $775C             ; $13D9A8 |
  dw $7752, $7755, $7758, $775B             ; $13D9B0 |
  dw $7720, $7725, $7729, $772D             ; $13D9B8 |
  dw $7721, $7726, $772A, $772E             ; $13D9C0 |

  REP #$30                                  ; $13D9C8 |
  LDA $15                                   ; $13D9CA |
  ASL A                                     ; $13D9CC |
  TAY                                       ; $13D9CD |
  LDX #$0000                                ; $13D9CE |
  LDA $2C                                   ; $13D9D1 |
  BEQ CODE_13D9EC                           ; $13D9D3 |
  INX                                       ; $13D9D5 |
  INX                                       ; $13D9D6 |
  CMP #$0001                                ; $13D9D7 |
  BEQ CODE_13D9EC                           ; $13D9DA |
  INX                                       ; $13D9DC |
  INX                                       ; $13D9DD |
  INC A                                     ; $13D9DE |
  CMP $2E                                   ; $13D9DF |
  BEQ CODE_13D9EC                           ; $13D9E1 |
  INX                                       ; $13D9E3 |
  INX                                       ; $13D9E4 |
  AND #$0001                                ; $13D9E5 |
  BEQ CODE_13D9EC                           ; $13D9E8 |
  INX                                       ; $13D9EA |
  INX                                       ; $13D9EB |

CODE_13D9EC:
  LDA $2E                                   ; $13D9EC |
  AND #$0001                                ; $13D9EE |
  BNE CODE_13D9FA                           ; $13D9F1 |
  JSR ($D994,x)                             ; $13D9F3 |
  TAY                                       ; $13D9F6 |
  JMP CODE_13D88A                           ; $13D9F7 |

CODE_13D9FA:
  JSR ($D99E,x)                             ; $13D9FA |
  TAY                                       ; $13D9FD |
  JMP CODE_13D88A                           ; $13D9FE |
  LDA $D9A8,y                               ; $13DA01 |
  RTS                                       ; $13DA04 |

  LDA $D9B0,y                               ; $13DA05 |
  RTS                                       ; $13DA08 |

  LDA $D9B8,y                               ; $13DA09 |
  RTS                                       ; $13DA0C |

  LDA $D9C0,y                               ; $13DA0D |
  RTS                                       ; $13DA10 |

  dw $7900, $7901, $7902, $7903             ; $13DA11 |
  dw $7904, $7905, $7906, $7907             ; $13DA19 |
  dw $7908, $7909, $790A, $790B             ; $13DA21 |
  dw $790C, $790D, $790E                    ; $13DA29 |

  dw $DA6C, $DA78, $DA70, $DA74             ; $13DA2F |

  REP #$30                                  ; $13DA37 |
  LDY #$0000                                ; $13DA39 |
  LDA $28                                   ; $13DA3C |
  BEQ CODE_13DA49                           ; $13DA3E |
  INY                                       ; $13DA40 |
  INY                                       ; $13DA41 |
  INC A                                     ; $13DA42 |
  CMP $2A                                   ; $13DA43 |
  BNE CODE_13DA49                           ; $13DA45 |
  INY                                       ; $13DA47 |
  INY                                       ; $13DA48 |

CODE_13DA49:
  LDX #$0000                                ; $13DA49 |
  LDA $2C                                   ; $13DA4C |
  BEQ CODE_13DA60                           ; $13DA4E |
  INX                                       ; $13DA50 |
  INX                                       ; $13DA51 |
  INC A                                     ; $13DA52 |
  CMP $2E                                   ; $13DA53 |
  BEQ CODE_13DA60                           ; $13DA55 |
  INX                                       ; $13DA57 |
  INX                                       ; $13DA58 |
  AND #$0001                                ; $13DA59 |
  BEQ CODE_13DA60                           ; $13DA5C |
  INX                                       ; $13DA5E |
  INX                                       ; $13DA5F |

CODE_13DA60:
  JSR ($DA2F,x)                             ; $13DA60 |
  LDX $1D                                   ; $13DA63 |
  STA $7F8000,x                             ; $13DA65 |
  SEP #$30                                  ; $13DA69 |
  RTL                                       ; $13DA6B |

  LDA $DA11,y                               ; $13DA6C |
  RTS                                       ; $13DA6F |

  LDA $DA17,y                               ; $13DA70 |
  RTS                                       ; $13DA73 |

  LDA $DA1D,y                               ; $13DA74 |
  RTS                                       ; $13DA77 |

  LDA $12                                   ; $13DA78 |
  CMP $1C5C                                 ; $13DA7A |
  BEQ CODE_13DA84                           ; $13DA7D |
  CMP $1C5E                                 ; $13DA7F |
  BNE CODE_13DA8A                           ; $13DA82 |

CODE_13DA84:
  TYA                                       ; $13DA84 |
  CLC                                       ; $13DA85 |
  ADC #$0006                                ; $13DA86 |
  TAY                                       ; $13DA89 |

CODE_13DA8A:
  LDA $DA23,y                               ; $13DA8A |
  RTS                                       ; $13DA8D |

  REP #$30                                  ; $13DA8E |
  LDX $1D                                   ; $13DA90 |
  LDA #$7502                                ; $13DA92 |
  STA $7F8000,x                             ; $13DA95 |
  SEP #$30                                  ; $13DA99 |
  RTL                                       ; $13DA9B |

  dw $3308, $3508, $0004, $0005             ; $13DA9C |

  REP #$30                                  ; $13DAA4 |
  LDA $28                                   ; $13DAA6 |
  AND #$0002                                ; $13DAA8 |
  BNE CODE_13DAC5                           ; $13DAAB |
  LDA $28                                   ; $13DAAD |
  AND #$0001                                ; $13DAAF |
  ASL A                                     ; $13DAB2 |
  STA $00                                   ; $13DAB3 |
  LDA $2C                                   ; $13DAB5 |
  ASL A                                     ; $13DAB7 |
  ASL A                                     ; $13DAB8 |
  ORA $00                                   ; $13DAB9 |
  TAY                                       ; $13DABB |
  LDX $1D                                   ; $13DABC |
  LDA $DA9C,y                               ; $13DABE |
  STA $7F8000,x                             ; $13DAC1 |

CODE_13DAC5:
  SEP #$30                                  ; $13DAC5 |
  RTL                                       ; $13DAC7 |

  dw $7A00, $7A01                           ; $13DAC8 |

  REP #$30                                  ; $13DACC |
  LDX $1D                                   ; $13DACE |
  LDA $28                                   ; $13DAD0 |
  AND #$0001                                ; $13DAD2 |
  ASL A                                     ; $13DAD5 |
  TAY                                       ; $13DAD6 |
  LDA $DAC8,y                               ; $13DAD7 |
  CLC                                       ; $13DADA |
  ADC $15                                   ; $13DADB |
  STA $7F8000,x                             ; $13DADD |
  SEP #$30                                  ; $13DAE1 |
  RTL                                       ; $13DAE3 |

  dw $7B00, $7B01, $7B02, $7B03             ; $13DAE4 |

  REP #$30                                  ; $13DAEC |
  LDX $1D                                   ; $13DAEE |
  LDA $28                                   ; $13DAF0 |
  AND #$0001                                ; $13DAF2 |
  ASL A                                     ; $13DAF5 |
  STA $00                                   ; $13DAF6 |
  LDA $2C                                   ; $13DAF8 |
  AND #$0001                                ; $13DAFA |
  ASL A                                     ; $13DAFD |
  ASL A                                     ; $13DAFE |
  ORA $00                                   ; $13DAFF |
  TAY                                       ; $13DB01 |
  LDA $DAE4,y                               ; $13DB02 |
  CLC                                       ; $13DB05 |
  ADC $15                                   ; $13DB06 |
  STA $7F8000,x                             ; $13DB08 |
  SEP #$30                                  ; $13DB0C |
  RTL                                       ; $13DB0E |

  dw $DB30, $DB9A, $DC60, $DC05             ; $13DB0F |

  REP #$30                                  ; $13DB17 |
  LDX $15                                   ; $13DB19 |
  JSR ($DB0F,x)                             ; $13DB1B |
  TYA                                       ; $13DB1E |
  BEQ CODE_13DB27                           ; $13DB1F |
  LDX $1D                                   ; $13DB21 |
  STA $7F8000,x                             ; $13DB23 |

CODE_13DB27:
  SEP #$30                                  ; $13DB27 |
  RTL                                       ; $13DB29 |

  dw $DB52, $DB6E, $DB80                    ; $13DB2A |

  LDA $28                                   ; $13DB30 |
  AND #$0001                                ; $13DB32 |
  ASL A                                     ; $13DB35 |
  STA $00                                   ; $13DB36 |
  TAY                                       ; $13DB38 |
  LDX #$0000                                ; $13DB39 |
  LDA $2C                                   ; $13DB3C |
  BEQ CODE_13DB49                           ; $13DB3E |
  INX                                       ; $13DB40 |
  INX                                       ; $13DB41 |
  INC A                                     ; $13DB42 |
  CMP $2E                                   ; $13DB43 |
  BNE CODE_13DB49                           ; $13DB45 |
  INX                                       ; $13DB47 |
  INX                                       ; $13DB48 |

CODE_13DB49:
  JSR ($DB2A,x)                             ; $13DB49 |
  TAY                                       ; $13DB4C |
  RTS                                       ; $13DB4D |

  dw $7D02, $7D03                           ; $13DB4E |

  LDA $12                                   ; $13DB52 |
  BEQ CODE_13DB5D                           ; $13DB54 |
  CMP #$1600                                ; $13DB56 |
  BEQ CODE_13DB5D                           ; $13DB59 |
  BRA CODE_13DB62                           ; $13DB5B |

CODE_13DB5D:
  LDA $DB4E,y                               ; $13DB5D |
  BRA CODE_13DB65                           ; $13DB60 |

CODE_13DB62:
  LDA #$0000                                ; $13DB62 |

CODE_13DB65:
  RTS                                       ; $13DB65 |

  dw $01C9, $01CA, $01C7, $01C8             ; $13DB66 |

  LDA $2C                                   ; $13DB6E |
  AND #$0001                                ; $13DB70 |
  ASL A                                     ; $13DB73 |
  ASL A                                     ; $13DB74 |
  ORA $00                                   ; $13DB75 |
  TAY                                       ; $13DB77 |
  LDA $DB66,y                               ; $13DB78 |
  RTS                                       ; $13DB7B |

  dw $7D06, $7D07                           ; $13DB7C |

  LDA $12                                   ; $13DB80 |
  BEQ CODE_13DB8B                           ; $13DB82 |
  CMP #$1600                                ; $13DB84 |
  BEQ CODE_13DB8B                           ; $13DB87 |
  BRA CODE_13DB90                           ; $13DB89 |

CODE_13DB8B:
  LDA $DB7C,y                               ; $13DB8B |
  BRA CODE_13DB93                           ; $13DB8E |

CODE_13DB90:
  LDA #$0000                                ; $13DB90 |

CODE_13DB93:
  RTS                                       ; $13DB93 |

  dw $DBBC, $DBD8, $DBEB                    ; $13DB94 |

  LDA $2C                                   ; $13DB9A |
  AND #$0001                                ; $13DB9C |
  ASL A                                     ; $13DB9F |
  STA $00                                   ; $13DBA0 |
  TAY                                       ; $13DBA2 |
  LDX #$0000                                ; $13DBA3 |
  LDA $28                                   ; $13DBA6 |
  BEQ CODE_13DBB3                           ; $13DBA8 |
  INX                                       ; $13DBAA |
  INX                                       ; $13DBAB |
  INC A                                     ; $13DBAC |
  CMP $2A                                   ; $13DBAD |
  BNE CODE_13DBB3                           ; $13DBAF |
  INX                                       ; $13DBB1 |
  INX                                       ; $13DBB2 |

CODE_13DBB3:
  JSR ($DB94,x)                             ; $13DBB3 |
  TAY                                       ; $13DBB6 |
  RTS                                       ; $13DBB7 |

  dw $7D00, $7D01                           ; $13DBB8 |

  LDA $12                                   ; $13DBBC |
  BEQ CODE_13DBC7                           ; $13DBBE |
  CMP #$1600                                ; $13DBC0 |
  BEQ CODE_13DBC7                           ; $13DBC3 |
  BRA CODE_13DBCC                           ; $13DBC5 |

CODE_13DBC7:
  LDA $DBB8,y                               ; $13DBC7 |
  BRA CODE_13DBCF                           ; $13DBCA |

CODE_13DBCC:
  LDA #$0000                                ; $13DBCC |

CODE_13DBCF:
  RTS                                       ; $13DBCF |

  dw $01C4, $01C3, $01C5, $01C6             ; $13DBD0 |

  ASL $00                                   ; $13DBD8 |
  LDA $28                                   ; $13DBDA |
  AND #$0001                                ; $13DBDC |
  ASL A                                     ; $13DBDF |
  ORA $00                                   ; $13DBE0 |
  TAY                                       ; $13DBE2 |
  LDA $DBD0,y                               ; $13DBE3 |
  RTS                                       ; $13DBE6 |

  dw $7D04, $7D05                           ; $13DBE7 |

  LDA $12                                   ; $13DBEB |
  BEQ CODE_13DBF6                           ; $13DBED |
  CMP #$1600                                ; $13DBEF |
  BEQ CODE_13DBF6                           ; $13DBF2 |
  BRA CODE_13DBFB                           ; $13DBF4 |

CODE_13DBF6:
  LDA $DBE7,y                               ; $13DBF6 |
  BRA CODE_13DBFE                           ; $13DBF9 |

CODE_13DBFB:
  LDA #$0000                                ; $13DBFB |

CODE_13DBFE:
  RTS                                       ; $13DBFE |

  dw $DC26, $DC3A, $DC54                    ; $13DBFF |

  LDA $2C                                   ; $13DC05 |
  ASL A                                     ; $13DC07 |
  TAY                                       ; $13DC08 |
  LDX #$0000                                ; $13DC09 |
  LDA $28                                   ; $13DC0C |
  BEQ CODE_13DC19                           ; $13DC0E |
  INX                                       ; $13DC10 |
  INX                                       ; $13DC11 |
  INC A                                     ; $13DC12 |
  CMP $2A                                   ; $13DC13 |
  BNE CODE_13DC19                           ; $13DC15 |
  INX                                       ; $13DC17 |
  INX                                       ; $13DC18 |

CODE_13DC19:
  JSR ($DBFF,x)                             ; $13DC19 |
  TAY                                       ; $13DC1C |
  RTS                                       ; $13DC1D |

  dw $3D2B, $7D1E, $7D1F, $9056             ; $13DC1E |

  LDA $DC1E,y                               ; $13DC26 |
  RTS                                       ; $13DC29 |

  dw $3D2C, $3D2D, $9052, $9053             ; $13DC2A |
  dw $9054, $9055, $9057, $9058             ; $13DC32 |

  LDA $28                                   ; $13DC3A |
  AND #$0001                                ; $13DC3C |
  STA $00                                   ; $13DC3F |
  LDA $2C                                   ; $13DC41 |
  ASL A                                     ; $13DC43 |
  ORA $00                                   ; $13DC44 |
  ASL A                                     ; $13DC46 |
  TAY                                       ; $13DC47 |
  LDA $DC2A,y                               ; $13DC48 |
  RTS                                       ; $13DC4B |

  dw $3D2E, $7D20, $7D21, $9059             ; $13DC4C |

  LDA $DC4C,y                               ; $13DC54 |
  RTS                                       ; $13DC57 |

  dw $905A, $3D29, $7D1C, $9050             ; $13DC58 |

  LDY #$0000                                ; $13DC60 |
  LDA $2C                                   ; $13DC63 |
  BEQ CODE_13DC74                           ; $13DC65 |
  INY                                       ; $13DC67 |
  INC A                                     ; $13DC68 |
  CMP $2E                                   ; $13DC69 |
  BEQ CODE_13DC74                           ; $13DC6B |
  INY                                       ; $13DC6D |
  INC A                                     ; $13DC6E |
  CMP $2E                                   ; $13DC6F |
  BEQ CODE_13DC74                           ; $13DC71 |
  INY                                       ; $13DC73 |

CODE_13DC74:
  TYA                                       ; $13DC74 |
  ASL A                                     ; $13DC75 |
  TAY                                       ; $13DC76 |
  LDA $DC58,y                               ; $13DC77 |
  CLC                                       ; $13DC7A |
  ADC $28                                   ; $13DC7B |
  TAY                                       ; $13DC7D |
  RTS                                       ; $13DC7E |

  dw $0000, $7780, $0000, $777E             ; $13DC7F |
  dw $7C00, $777D, $0000, $7784             ; $13DC87 |
  dw $0000                                  ; $13DC8F |

  REP #$30                                  ; $13DC91 |
  LDX #$0000                                ; $13DC93 |
  LDA $28                                   ; $13DC96 |
  BEQ CODE_13DCA3                           ; $13DC98 |
  INX                                       ; $13DC9A |
  INX                                       ; $13DC9B |
  INC A                                     ; $13DC9C |
  CMP $2A                                   ; $13DC9D |
  BNE CODE_13DCA3                           ; $13DC9F |
  INX                                       ; $13DCA1 |
  INX                                       ; $13DCA2 |

CODE_13DCA3:
  STX $00                                   ; $13DCA3 |
  LDX #$0000                                ; $13DCA5 |
  LDA $2C                                   ; $13DCA8 |
  BEQ CODE_13DCB7                           ; $13DCAA |
  LDX #$0006                                ; $13DCAC |
  INC A                                     ; $13DCAF |
  CMP $2E                                   ; $13DCB0 |
  BNE CODE_13DCB7                           ; $13DCB2 |
  LDX #$000C                                ; $13DCB4 |

CODE_13DCB7:
  TXA                                       ; $13DCB7 |
  CLC                                       ; $13DCB8 |
  ADC $00                                   ; $13DCB9 |
  STA $00                                   ; $13DCBB |
  TAY                                       ; $13DCBD |
  LDA $DC7F,y                               ; $13DCBE |
  STA $04                                   ; $13DCC1 |
  BEQ CODE_13DCF0                           ; $13DCC3 |
  CMP #$7C00                                ; $13DCC5 |
  BEQ CODE_13DCE8                           ; $13DCC8 |
  LDA $12                                   ; $13DCCA |
  BEQ CODE_13DCE8                           ; $13DCCC |
  SEC                                       ; $13DCCE |
  SBC #$777C                                ; $13DCCF |
  STA $02                                   ; $13DCD2 |
  DEC A                                     ; $13DCD4 |
  CMP #$000F                                ; $13DCD5 |
  BCS CODE_13DCF0                           ; $13DCD8 |
  LDA $04                                   ; $13DCDA |
  SEC                                       ; $13DCDC |
  SBC #$777C                                ; $13DCDD |
  ORA $02                                   ; $13DCE0 |
  CLC                                       ; $13DCE2 |
  ADC #$777C                                ; $13DCE3 |
  STA $04                                   ; $13DCE6 |

CODE_13DCE8:
  LDX $1D                                   ; $13DCE8 |
  LDA $04                                   ; $13DCEA |
  STA $7F8000,x                             ; $13DCEC |

CODE_13DCF0:
  SEP #$30                                  ; $13DCF0 |
  RTL                                       ; $13DCF2 |

  REP #$30                                  ; $13DCF3 |
  LDX #$0000                                ; $13DCF5 |
  LDA $28                                   ; $13DCF8 |
  BEQ CODE_13DD05                           ; $13DCFA |
  INX                                       ; $13DCFC |
  INX                                       ; $13DCFD |
  INC A                                     ; $13DCFE |
  CMP $2A                                   ; $13DCFF |
  BNE CODE_13DD05                           ; $13DD01 |
  INX                                       ; $13DD03 |
  INX                                       ; $13DD04 |

CODE_13DD05:
  STX $00                                   ; $13DD05 |
  LDX #$0000                                ; $13DD07 |
  LDA $2C                                   ; $13DD0A |
  BEQ CODE_13DD19                           ; $13DD0C |
  LDX #$0006                                ; $13DD0E |
  INC A                                     ; $13DD11 |
  CMP $2E                                   ; $13DD12 |
  BNE CODE_13DD19                           ; $13DD14 |
  LDX #$000C                                ; $13DD16 |

CODE_13DD19:
  TXA                                       ; $13DD19 |
  CLC                                       ; $13DD1A |
  ADC $00                                   ; $13DD1B |
  STA $06                                   ; $13DD1D |
  TAY                                       ; $13DD1F |
  LDA $DC7F,y                               ; $13DD20 |
  STA $04                                   ; $13DD23 |
  BEQ CODE_13DD64                           ; $13DD25 |
  CMP #$7C00                                ; $13DD27 |
  BNE CODE_13DD31                           ; $13DD2A |
  JSR CODE_13DD67                           ; $13DD2C |
  BRA CODE_13DD5C                           ; $13DD2F |

CODE_13DD31:
  LDA $12                                   ; $13DD31 |
  CMP #$7C00                                ; $13DD33 |
  BEQ CODE_13DD64                           ; $13DD36 |
  SEC                                       ; $13DD38 |
  SBC #$777C                                ; $13DD39 |
  STA $02                                   ; $13DD3C |
  DEC A                                     ; $13DD3E |
  CMP #$000F                                ; $13DD3F |
  BCS CODE_13DD64                           ; $13DD42 |
  LDA $04                                   ; $13DD44 |
  SEC                                       ; $13DD46 |
  SBC #$777C                                ; $13DD47 |
  STA $04                                   ; $13DD4A |
  AND $02                                   ; $13DD4C |
  BEQ CODE_13DD64                           ; $13DD4E |
  LDA $04                                   ; $13DD50 |
  EOR $02                                   ; $13DD52 |
  BEQ CODE_13DD5E                           ; $13DD54 |
  CLC                                       ; $13DD56 |
  ADC #$777C                                ; $13DD57 |
  STA $04                                   ; $13DD5A |

CODE_13DD5C:
  LDA $04                                   ; $13DD5C |

CODE_13DD5E:
  LDX $1D                                   ; $13DD5E |
  STA $7F8000,x                             ; $13DD60 |

CODE_13DD64:
  SEP #$30                                  ; $13DD64 |
  RTL                                       ; $13DD66 |

CODE_13DD67:
  STZ $04                                   ; $13DD67 |
  LDA $1B                                   ; $13DD69 |
  STA $0E                                   ; $13DD6B |
  JSL $128719                               ; $13DD6D |
  LDA $7F8000,x                             ; $13DD71 |
  CMP #$7C00                                ; $13DD75 |
  BNE CODE_13DD7F                           ; $13DD78 |
  LDA #$0008                                ; $13DD7A |
  STA $04                                   ; $13DD7D |

CODE_13DD7F:
  LDA $2C                                   ; $13DD7F |
  INC A                                     ; $13DD81 |
  INC A                                     ; $13DD82 |
  CMP $2E                                   ; $13DD83 |
  BNE CODE_13DD9D                           ; $13DD85 |
  LDA $1B                                   ; $13DD87 |
  STA $0E                                   ; $13DD89 |
  JSL $12875D                               ; $13DD8B |
  LDA $7F8000,x                             ; $13DD8F |
  CMP #$7C00                                ; $13DD93 |
  BNE CODE_13DD9D                           ; $13DD96 |
  LDA #$0004                                ; $13DD98 |
  TSB $04                                   ; $13DD9B |

CODE_13DD9D:
  JSR CODE_13FD54                           ; $13DD9D |
  CMP #$7C00                                ; $13DDA0 |
  BNE CODE_13DDAA                           ; $13DDA3 |
  LDA #$0001                                ; $13DDA5 |
  TSB $04                                   ; $13DDA8 |

CODE_13DDAA:
  LDA $28                                   ; $13DDAA |
  INC A                                     ; $13DDAC |
  INC A                                     ; $13DDAD |
  CMP $2A                                   ; $13DDAE |
  BNE CODE_13DDBF                           ; $13DDB0 |
  JSR CODE_13FD61                           ; $13DDB2 |
  CMP #$7C00                                ; $13DDB5 |
  BNE CODE_13DDBF                           ; $13DDB8 |
  LDA #$0002                                ; $13DDBA |
  TSB $04                                   ; $13DDBD |

CODE_13DDBF:
  LDA $04                                   ; $13DDBF |
  BEQ CODE_13DDC9                           ; $13DDC1 |
  CLC                                       ; $13DDC3 |
  ADC #$777C                                ; $13DDC4 |
  STA $04                                   ; $13DDC7 |

CODE_13DDC9:
  RTS                                       ; $13DDC9 |

  REP #$30                                  ; $13DDCA |
  LDY #$0083                                ; $13DDCC |
  LDA $12                                   ; $13DDCF |
  BEQ CODE_13DDE0                           ; $13DDD1 |
  LDY $1C78                                 ; $13DDD3 |
  CMP $1C5C                                 ; $13DDD6 |
  BEQ CODE_13DDE0                           ; $13DDD9 |
  CMP $1C5E                                 ; $13DDDB |
  BNE CODE_13DDE7                           ; $13DDDE |

CODE_13DDE0:
  LDX $1D                                   ; $13DDE0 |
  TYA                                       ; $13DDE2 |
  STA $7F8000,x                             ; $13DDE3 |

CODE_13DDE7:
  SEP #$30                                  ; $13DDE7 |
  RTL                                       ; $13DDE9 |

  dw $DE22, $DE31, $DE4B                    ; $13DDEA |

  REP #$30                                  ; $13DDF0 |
  LDX #$0000                                ; $13DDF2 |
  LDA $2C                                   ; $13DDF5 |
  BNE CODE_13DDFB                           ; $13DDF7 |
  STZ $A1                                   ; $13DDF9 |

CODE_13DDFB:
  CMP #$0004                                ; $13DDFB |
  BCC CODE_13DE0E                           ; $13DDFE |
  INX                                       ; $13DE00 |
  INX                                       ; $13DE01 |
  LDA $2E                                   ; $13DE02 |
  CLC                                       ; $13DE04 |
  SBC $2C                                   ; $13DE05 |
  CMP #$0003                                ; $13DE07 |
  BCS CODE_13DE0E                           ; $13DE0A |
  INX                                       ; $13DE0C |
  INX                                       ; $13DE0D |

CODE_13DE0E:
  JSR ($DDEA,x)                             ; $13DE0E |
  LDX $1D                                   ; $13DE11 |
  STA $7F8000,x                             ; $13DE13 |
  SEP #$30                                  ; $13DE17 |
  RTL                                       ; $13DE19 |

  dw $3D2F, $7D22, $0110, $0112             ; $13DE1A |

  LDA $2C                                   ; $13DE22 |
  ASL A                                     ; $13DE24 |
  TAY                                       ; $13DE25 |
  LDA $DE1A,y                               ; $13DE26 |
  BRA CODE_13DE55                           ; $13DE29 |

  dw $3D31, $3D16, $3D33                    ; $13DE2B |

  LDA $A1                                   ; $13DE31 |
  INC A                                     ; $13DE33 |
  CMP #$0003                                ; $13DE34 |
  BCC CODE_13DE3C                           ; $13DE37 |
  LDA #$0000                                ; $13DE39 |

CODE_13DE3C:
  STA $A1                                   ; $13DE3C |
  ASL A                                     ; $13DE3E |
  TAY                                       ; $13DE3F |
  LDA $DE2B,y                               ; $13DE40 |
  BRA CODE_13DE55                           ; $13DE43 |

  dw $0110, $7D22, $3D35                    ; $13DE45 |

  LDA $2E                                   ; $13DE4B |
  CLC                                       ; $13DE4D |
  SBC $2C                                   ; $13DE4E |
  ASL A                                     ; $13DE50 |
  TAY                                       ; $13DE51 |
  LDA $DE45,y                               ; $13DE52 |

CODE_13DE55:
  CLC                                       ; $13DE55 |
  ADC $28                                   ; $13DE56 |
  RTS                                       ; $13DE58 |

  dw $7915, $7916, $77A9, $77AA             ; $13DE59 |

  LDA !r_header_bg1_tileset                 ; $13DE61 |
  CMP #$0B                                  ; $13DE64 |
  BEQ CODE_13DE6C                           ; $13DE66 |
  JML $12ABFF                               ; $13DE68 |

CODE_13DE6C:
  REP #$30                                  ; $13DE6C |
  LDY #$0000                                ; $13DE6E |
  LDA $28                                   ; $13DE71 |
  CMP #$0002                                ; $13DE73 |
  BCC CODE_13DE8B                           ; $13DE76 |
  LDY #$0004                                ; $13DE78 |
  INC A                                     ; $13DE7B |
  STA $00                                   ; $13DE7C |
  LDA $2A                                   ; $13DE7E |
  SEC                                       ; $13DE80 |
  SBC $00                                   ; $13DE81 |
  CMP #$0002                                ; $13DE83 |
  BCS CODE_13DE8B                           ; $13DE86 |
  LDY #$0002                                ; $13DE88 |

CODE_13DE8B:
  STY $02                                   ; $13DE8B |
  LDA $28                                   ; $13DE8D |
  AND #$0001                                ; $13DE8F |
  ASL A                                     ; $13DE92 |
  STA $00                                   ; $13DE93 |
  LDA $2C                                   ; $13DE95 |
  AND #$0001                                ; $13DE97 |
  ASL A                                     ; $13DE9A |
  ASL A                                     ; $13DE9B |
  ORA $00                                   ; $13DE9C |
  TAY                                       ; $13DE9E |
  LDA $DE59,y                               ; $13DE9F |
  STA $00                                   ; $13DEA2 |
  JSR CODE_13E0F4                           ; $13DEA4 |
  LDA $00                                   ; $13DEA7 |
  STA $7F8000,x                             ; $13DEA9 |
  SEP #$30                                  ; $13DEAD |
  RTL                                       ; $13DEAF |

  dw $77AF, $77B0, $7925, $7926             ; $13DEB0 |

  REP #$30                                  ; $13DEB8 |
  LDY #$0000                                ; $13DEBA |
  LDA $28                                   ; $13DEBD |
  CMP #$0002                                ; $13DEBF |
  BCC CODE_13DED7                           ; $13DEC2 |
  LDY #$0004                                ; $13DEC4 |
  INC A                                     ; $13DEC7 |
  STA $00                                   ; $13DEC8 |
  LDA $2A                                   ; $13DECA |
  SEC                                       ; $13DECC |
  SBC $00                                   ; $13DECD |
  CMP #$0002                                ; $13DECF |
  BCS CODE_13DED7                           ; $13DED2 |
  LDY #$0002                                ; $13DED4 |

CODE_13DED7:
  STY $02                                   ; $13DED7 |
  LDA $28                                   ; $13DED9 |
  AND #$0001                                ; $13DEDB |
  ASL A                                     ; $13DEDE |
  STA $00                                   ; $13DEDF |
  LDA $2C                                   ; $13DEE1 |
  AND #$0001                                ; $13DEE3 |
  ASL A                                     ; $13DEE6 |
  ASL A                                     ; $13DEE7 |
  ORA $00                                   ; $13DEE8 |
  TAY                                       ; $13DEEA |
  LDA $DEB0,y                               ; $13DEEB |
  STA $00                                   ; $13DEEE |
  JSR CODE_13E0F4                           ; $13DEF0 |
  LDA $00                                   ; $13DEF3 |
  STA $7F8000,x                             ; $13DEF5 |
  SEP #$30                                  ; $13DEF9 |
  RTL                                       ; $13DEFB |

  dw $790F, $7799, $791F, $779A             ; $13DEFC |

  REP #$30                                  ; $13DF04 |
  LDY #$0000                                ; $13DF06 |
  LDA $2C                                   ; $13DF09 |
  CMP #$0002                                ; $13DF0B |
  BCC CODE_13DF23                           ; $13DF0E |
  LDY #$0004                                ; $13DF10 |
  INC A                                     ; $13DF13 |
  STA $00                                   ; $13DF14 |
  LDA $2E                                   ; $13DF16 |
  SEC                                       ; $13DF18 |
  SBC $00                                   ; $13DF19 |
  CMP #$0002                                ; $13DF1B |
  BCS CODE_13DF23                           ; $13DF1E |
  LDY #$0002                                ; $13DF20 |

CODE_13DF23:
  STY $02                                   ; $13DF23 |
  LDA $28                                   ; $13DF25 |
  AND #$0001                                ; $13DF27 |
  ASL A                                     ; $13DF2A |
  STA $00                                   ; $13DF2B |
  LDA $2C                                   ; $13DF2D |
  AND #$0001                                ; $13DF2F |
  ASL A                                     ; $13DF32 |
  ASL A                                     ; $13DF33 |
  ORA $00                                   ; $13DF34 |
  TAY                                       ; $13DF36 |
  LDA $DEFC,y                               ; $13DF37 |
  STA $00                                   ; $13DF3A |
  JSR CODE_13E0F4                           ; $13DF3C |
  LDA $00                                   ; $13DF3F |
  STA $7F8000,x                             ; $13DF41 |
  SEP #$30                                  ; $13DF45 |
  RTL                                       ; $13DF47 |

  dw $779F, $7910, $77A0, $7920             ; $13DF48 |

  REP #$30                                  ; $13DF50 |
  LDY #$0000                                ; $13DF52 |
  LDA $2C                                   ; $13DF55 |
  CMP #$0002                                ; $13DF57 |
  BCC CODE_13DF6F                           ; $13DF5A |
  LDY #$0004                                ; $13DF5C |
  INC A                                     ; $13DF5F |
  STA $00                                   ; $13DF60 |
  LDA $2E                                   ; $13DF62 |
  SEC                                       ; $13DF64 |
  SBC $00                                   ; $13DF65 |
  CMP #$0002                                ; $13DF67 |
  BCS CODE_13DF6F                           ; $13DF6A |
  LDY #$0002                                ; $13DF6C |

CODE_13DF6F:
  STY $02                                   ; $13DF6F |
  LDA $28                                   ; $13DF71 |
  AND #$0001                                ; $13DF73 |
  ASL A                                     ; $13DF76 |
  STA $00                                   ; $13DF77 |
  LDA $2C                                   ; $13DF79 |
  AND #$0001                                ; $13DF7B |
  ASL A                                     ; $13DF7E |
  ASL A                                     ; $13DF7F |
  ORA $00                                   ; $13DF80 |
  TAY                                       ; $13DF82 |
  LDA $DF48,y                               ; $13DF83 |
  STA $00                                   ; $13DF86 |
  JSR CODE_13E0F4                           ; $13DF88 |
  LDA $00                                   ; $13DF8B |
  STA $7F8000,x                             ; $13DF8D |
  SEP #$30                                  ; $13DF91 |
  RTL                                       ; $13DF93 |

  dw $7915, $7916, $7925, $7926             ; $13DF94 |
  dw $790F, $791F, $7910, $7920             ; $13DF9C |
  dw $77A9, $77AA, $77AF, $77B0             ; $13DFA4 |
  dw $7799, $779A, $779F, $77A0             ; $13DFAC |

  dw $DFD4, $DFD4, $DFE4, $DFE4             ; $13DFB4 |
  dw $DFD4, $DFD4, $DFE4, $DFE4             ; $13DFBC |
  dw $DFF4, $E014, $E034, $E054             ; $13DFC4 |
  dw $E074, $E094, $E0B4, $E0D4             ; $13DFCC |

  dw $790F, $791F, $7910, $7920             ; $13DFD4 |
  dw $7799, $779A, $779F, $77A0             ; $13DFDC |

  dw $7915, $7916, $7925, $7926             ; $13DFE4 |
  dw $77A9, $77AA, $77AF, $77B0             ; $13DFEC |

  dw $7931, $792C, $792C, $0000             ; $13DFF4 |
  dw $792B, $7931, $792B, $0000             ; $13DFFC |
  dw $792E, $0000, $0000, $0000             ; $13E004 |
  dw $0000, $792D, $0000, $0000             ; $13E00C |

  dw $7931, $791C, $791C, $0000             ; $13E014 |
  dw $791B, $7931, $791B, $0000             ; $13E01C |
  dw $791E, $0000, $0000, $0000             ; $13E024 |
  dw $0000, $791D, $0000, $0000             ; $13E02C |

  dw $7931, $792C, $792C, $0000             ; $13E034 |
  dw $791C, $7931, $791C, $0000             ; $13E03C |
  dw $792E, $0000, $0000, $0000             ; $13E044 |
  dw $0000, $791E, $0000, $0000             ; $13E04C |

  dw $7931, $792B, $792B, $0000             ; $13E054 |
  dw $791B, $7931, $791B, $0000             ; $13E05C |
  dw $792D, $0000, $0000, $0000             ; $13E064 |
  dw $0000, $791D, $0000, $0000             ; $13E06C |

  dw $792E, $FFFF, $FFFF, $FFFF             ; $13E074 |
  dw $FFFF, $792D, $FFFF, $FFFF             ; $13E07C |
  dw $5D09, $77B9, $77B9, $0000             ; $13E084 |
  dw $77CC, $5B0D, $77CC, $0000             ; $13E08C |

  dw $791E, $FFFF, $FFFF, $FFFF             ; $13E094 |
  dw $FFFF, $791D, $FFFF, $FFFF             ; $13E09C |
  dw $0A2F, $77BB, $77BB, $0000             ; $13E0A4 |
  dw $77BA, $082D, $77BA, $0000             ; $13E0AC |

  dw $792E, $FFFF, $FFFF, $FFFF             ; $13E0B4 |
  dw $FFFF, $791E, $FFFF, $FFFF             ; $13E0BC |
  dw $5D09, $77B9, $77B9, $0000             ; $13E0C4 |
  dw $77BB, $0A2F, $77BB, $0000             ; $13E0CC |

  dw $792D, $FFFF, $FFFF, $FFFF             ; $13E0D4 |
  dw $FFFF, $791D, $FFFF, $FFFF             ; $13E0DC |
  dw $5B0D, $77CC, $77CC, $0000             ; $13E0E4 |
  dw $77BA, $082D, $77BA, $0000             ; $13E0EC |

CODE_13E0F4:
  LDA $12                                   ; $13E0F4 |
  BEQ CODE_13E13D                           ; $13E0F6 |
  LDY #$001E                                ; $13E0F8 |
  LDA $00                                   ; $13E0FB |

CODE_13E0FD:
  CMP $DF94,y                               ; $13E0FD |
  BEQ CODE_13E106                           ; $13E100 |
  DEY                                       ; $13E102 |
  DEY                                       ; $13E103 |
  BRA CODE_13E0FD                           ; $13E104 |

CODE_13E106:
  TYA                                       ; $13E106 |
  LSR A                                     ; $13E107 |
  AND #$000E                                ; $13E108 |
  TAY                                       ; $13E10B |
  LDA $DFB4,y                               ; $13E10C |
  STA $04                                   ; $13E10F |
  LDA $DFC4,y                               ; $13E111 |
  STA $06                                   ; $13E114 |
  LDY #$000E                                ; $13E116 |
  LDA $12                                   ; $13E119 |

CODE_13E11B:
  CMP ($04),y                               ; $13E11B |
  BEQ CODE_13E125                           ; $13E11D |
  DEY                                       ; $13E11F |
  DEY                                       ; $13E120 |
  BPL CODE_13E11B                           ; $13E121 |
  BRA CODE_13E13D                           ; $13E123 |

CODE_13E125:
  TYA                                       ; $13E125 |
  AND #$000C                                ; $13E126 |
  ASL A                                     ; $13E129 |
  ORA $02                                   ; $13E12A |
  TAY                                       ; $13E12C |
  LDA ($06),y                               ; $13E12D |
  CMP #$FFFF                                ; $13E12F |
  BEQ CODE_13E13D                           ; $13E132 |
  CMP #$0000                                ; $13E134 |
  BNE CODE_13E13B                           ; $13E137 |
  LDA $12                                   ; $13E139 |

CODE_13E13B:
  STA $00                                   ; $13E13B |

CODE_13E13D:
  LDX $1D                                   ; $13E13D |
  RTS                                       ; $13E13F |

  dw $779B, $779D, $779C, $779E             ; $13E140 |

  REP #$30                                  ; $13E148 |
  LDA $28                                   ; $13E14A |
  AND #$0001                                ; $13E14C |
  ASL A                                     ; $13E14F |
  STA $00                                   ; $13E150 |
  LDA $2C                                   ; $13E152 |
  AND #$0001                                ; $13E154 |
  ASL A                                     ; $13E157 |
  ASL A                                     ; $13E158 |
  ORA $00                                   ; $13E159 |
  TAY                                       ; $13E15B |
  LDX $1D                                   ; $13E15C |
  LDA $E140,y                               ; $13E15E |
  STA $7F8000,x                             ; $13E161 |
  SEP #$30                                  ; $13E165 |
  RTL                                       ; $13E167 |

  dw $77AB, $77AC, $77AD, $77AE             ; $13E168 |

  REP #$30                                  ; $13E170 |
  LDA $28                                   ; $13E172 |
  AND #$0001                                ; $13E174 |
  ASL A                                     ; $13E177 |
  STA $00                                   ; $13E178 |
  LDA $2C                                   ; $13E17A |
  AND #$0001                                ; $13E17C |
  ASL A                                     ; $13E17F |
  ASL A                                     ; $13E180 |
  ORA $00                                   ; $13E181 |
  TAY                                       ; $13E183 |
  LDX $1D                                   ; $13E184 |
  LDA $E168,y                               ; $13E186 |
  STA $7F8000,x                             ; $13E189 |
  SEP #$30                                  ; $13E18D |
  RTL                                       ; $13E18F |

  dw $77AB, $77AB, $77AC, $77CE             ; $13E190 |
  dw $779B, $779D, $779E, $779D             ; $13E198 |
  dw $779C, $77AD, $77AE, $77AD             ; $13E1A0 |
  dw $77CE, $779D, $779E, $779D             ; $13E1A8 |

  REP #$30                                  ; $13E1B0 |
  LDY #$0000                                ; $13E1B2 |
  LDA $28                                   ; $13E1B5 |
  BEQ CODE_13E1CC                           ; $13E1B7 |
  LDY #$0006                                ; $13E1B9 |
  INC A                                     ; $13E1BC |
  CMP $2A                                   ; $13E1BD |
  BEQ CODE_13E1CC                           ; $13E1BF |
  LDA $28                                   ; $13E1C1 |
  AND #$0001                                ; $13E1C3 |
  ASL A                                     ; $13E1C6 |
  CLC                                       ; $13E1C7 |
  ADC #$0002                                ; $13E1C8 |
  TAY                                       ; $13E1CB |

CODE_13E1CC:
  STY $00                                   ; $13E1CC |
  LDY #$0000                                ; $13E1CE |
  LDA $2C                                   ; $13E1D1 |
  BEQ CODE_13E1EA                           ; $13E1D3 |
  LDY #$0018                                ; $13E1D5 |
  INC A                                     ; $13E1D8 |
  CMP $2E                                   ; $13E1D9 |
  BEQ CODE_13E1EA                           ; $13E1DB |
  LDA $2C                                   ; $13E1DD |
  AND #$0001                                ; $13E1DF |
  ASL A                                     ; $13E1E2 |
  ASL A                                     ; $13E1E3 |
  ASL A                                     ; $13E1E4 |
  CLC                                       ; $13E1E5 |
  ADC #$0008                                ; $13E1E6 |
  TAY                                       ; $13E1E9 |

CODE_13E1EA:
  TYA                                       ; $13E1EA |
  ORA $00                                   ; $13E1EB |
  TAY                                       ; $13E1ED |
  LDA $12                                   ; $13E1EE |
  BNE CODE_13E1FB                           ; $13E1F0 |
  LDX $1D                                   ; $13E1F2 |
  LDA $E190,y                               ; $13E1F4 |
  STA $7F8000,x                             ; $13E1F7 |

CODE_13E1FB:
  SEP #$30                                  ; $13E1FB |
  RTL                                       ; $13E1FD |

  dw $77B9, $77BB, $77C9, $77CC             ; $13E1FE |
  dw $8100, $8101, $8102, $8103             ; $13E206 |
  dw $854B, $854C, $854D, $854E             ; $13E20E |
  dw $1519, $1519, $1519, $1519             ; $13E216 |
  dw $1517, $1517, $1517, $1517             ; $13E21E |
  dw $151C, $151D, $151D, $151D             ; $13E226 |
  dw $1513, $1514, $1515, $1516             ; $13E22E |
  dw $0000, $0000, $0000, $0000             ; $13E236 |
  dw $1513, $1514, $1518, $1516             ; $13E23E |

  REP #$30                                  ; $13E246 |
  LDA $12                                   ; $13E248 |
  CMP #$77B9                                ; $13E24A |
  BCC CODE_13E265                           ; $13E24D |
  LDY #$0000                                ; $13E24F |

CODE_13E252:
  CMP $E1FE,y                               ; $13E252 |
  BEQ CODE_13E260                           ; $13E255 |
  INY                                       ; $13E257 |
  INY                                       ; $13E258 |
  CPY #$0018                                ; $13E259 |
  BCC CODE_13E252                           ; $13E25C |
  BRA CODE_13E276                           ; $13E25E |

CODE_13E260:
  LDA $E216,y                               ; $13E260 |
  BRA CODE_13E270                           ; $13E263 |

CODE_13E265:
  SEC                                       ; $13E265 |
  SBC #$7799                                ; $13E266 |
  AND #$000E                                ; $13E269 |
  TAY                                       ; $13E26C |
  LDA $E22E,y                               ; $13E26D |

CODE_13E270:
  LDX $1D                                   ; $13E270 |
  STA $7F8000,x                             ; $13E272 |

CODE_13E276:
  SEP #$30                                  ; $13E276 |
  RTL                                       ; $13E278 |

  dw $792E, $5D09, $77B9, $77AB             ; $13E279 |

  REP #$30                                  ; $13E281 |
  LDA $2C                                   ; $13E283 |
  ASL A                                     ; $13E285 |
  TAY                                       ; $13E286 |
  LDA $12                                   ; $13E287 |
  BNE CODE_13E294                           ; $13E289 |
  LDX $1D                                   ; $13E28B |
  LDA $E279,y                               ; $13E28D |
  STA $7F8000,x                             ; $13E290 |

CODE_13E294:
  LDA #$FFFF                                ; $13E294 |
  STA $9B                                   ; $13E297 |
  SEP #$30                                  ; $13E299 |
  RTL                                       ; $13E29B |

  dw $77BA, $082D, $791D                    ; $13E29C |

  REP #$30                                  ; $13E2A2 |
  LDA $2C                                   ; $13E2A4 |
  ASL A                                     ; $13E2A6 |
  TAY                                       ; $13E2A7 |
  LDA $12                                   ; $13E2A8 |
  BNE CODE_13E2B5                           ; $13E2AA |
  LDX $1D                                   ; $13E2AC |
  LDA $E29C,y                               ; $13E2AE |
  STA $7F8000,x                             ; $13E2B1 |

CODE_13E2B5:
  LDA #$FFFF                                ; $13E2B5 |
  STA $9B                                   ; $13E2B8 |
  SEP #$30                                  ; $13E2BA |
  RTL                                       ; $13E2BC |

  dw $77AE, $77BA, $082D, $791D             ; $13E2BD |

  REP #$30                                  ; $13E2C5 |
  LDA $2C                                   ; $13E2C7 |
  ASL A                                     ; $13E2C9 |
  TAY                                       ; $13E2CA |
  LDA $12                                   ; $13E2CB |
  BNE CODE_13E2D8                           ; $13E2CD |
  LDX $1D                                   ; $13E2CF |
  LDA $E2BD,y                               ; $13E2D1 |
  STA $7F8000,x                             ; $13E2D4 |

CODE_13E2D8:
  LDA #$FFFF                                ; $13E2D8 |
  STA $9B                                   ; $13E2DB |
  SEP #$30                                  ; $13E2DD |
  RTL                                       ; $13E2DF |

  dw $792D, $5B0C, $77C9, $77AC             ; $13E2E0 |

  REP #$30                                  ; $13E2E8 |
  LDA $2C                                   ; $13E2EA |
  ASL A                                     ; $13E2EC |
  TAY                                       ; $13E2ED |
  LDA $12                                   ; $13E2EE |
  BNE CODE_13E31F                           ; $13E2F0 |
  LDA $E2E0,y                               ; $13E2F2 |
  STA $02                                   ; $13E2F5 |
  CMP #$5B0C                                ; $13E2F7 |
  BNE CODE_13E317                           ; $13E2FA |
  LDA $1B                                   ; $13E2FC |
  STA $0E                                   ; $13E2FE |
  JSL $12875D                               ; $13E300 |
  LDA $7F8000,x                             ; $13E304 |
  CMP #$779F                                ; $13E308 |
  BEQ CODE_13E312                           ; $13E30B |
  CMP #$77A0                                ; $13E30D |
  BNE CODE_13E317                           ; $13E310 |

CODE_13E312:
  LDA #$5B0D                                ; $13E312 |
  STA $02                                   ; $13E315 |

CODE_13E317:
  LDX $1D                                   ; $13E317 |
  LDA $02                                   ; $13E319 |
  STA $7F8000,x                             ; $13E31B |

CODE_13E31F:
  LDA #$FFFF                                ; $13E31F |
  STA $9B                                   ; $13E322 |
  SEP #$30                                  ; $13E324 |
  RTL                                       ; $13E326 |

  dw $77CA, $0A2E, $791E                    ; $13E327 |

  REP #$30                                  ; $13E32D |
  LDA $2C                                   ; $13E32F |
  ASL A                                     ; $13E331 |
  TAY                                       ; $13E332 |
  LDA $12                                   ; $13E333 |
  BNE CODE_13E364                           ; $13E335 |
  LDA $E327,y                               ; $13E337 |
  STA $02                                   ; $13E33A |
  CMP #$0A2E                                ; $13E33C |
  BNE CODE_13E35C                           ; $13E33F |
  LDA $1B                                   ; $13E341 |
  STA $0E                                   ; $13E343 |
  JSL $128719                               ; $13E345 |
  LDA $7F8000,x                             ; $13E349 |
  CMP #$7799                                ; $13E34D |
  BEQ CODE_13E357                           ; $13E350 |
  CMP #$779A                                ; $13E352 |
  BNE CODE_13E35C                           ; $13E355 |

CODE_13E357:
  LDA #$0A2F                                ; $13E357 |
  STA $02                                   ; $13E35A |

CODE_13E35C:
  LDX $1D                                   ; $13E35C |
  LDA $02                                   ; $13E35E |
  STA $7F8000,x                             ; $13E360 |

CODE_13E364:
  LDA #$FFFF                                ; $13E364 |
  STA $9B                                   ; $13E367 |
  SEP #$30                                  ; $13E369 |
  RTL                                       ; $13E36B |

  dw $77AD, $77CA, $0A2E, $791E             ; $13E36C |

  REP #$30                                  ; $13E374 |
  LDA $2C                                   ; $13E376 |
  ASL A                                     ; $13E378 |
  TAY                                       ; $13E379 |
  LDA $12                                   ; $13E37A |
  BNE CODE_13E3AB                           ; $13E37C |
  LDA $E36C,y                               ; $13E37E |
  STA $02                                   ; $13E381 |
  CMP #$0A2E                                ; $13E383 |
  BNE CODE_13E3A3                           ; $13E386 |
  LDA $1B                                   ; $13E388 |
  STA $0E                                   ; $13E38A |
  JSL $128719                               ; $13E38C |
  LDA $7F8000,x                             ; $13E390 |
  CMP #$7799                                ; $13E394 |
  BEQ CODE_13E39E                           ; $13E397 |
  CMP #$779A                                ; $13E399 |
  BNE CODE_13E3A3                           ; $13E39C |

CODE_13E39E:
  LDA #$0A2F                                ; $13E39E |
  STA $02                                   ; $13E3A1 |

CODE_13E3A3:
  LDX $1D                                   ; $13E3A3 |
  LDA $02                                   ; $13E3A5 |
  STA $7F8000,x                             ; $13E3A7 |

CODE_13E3AB:
  LDA #$FFFF                                ; $13E3AB |
  STA $9B                                   ; $13E3AE |
  SEP #$30                                  ; $13E3B0 |
  RTL                                       ; $13E3B2 |

  dw $792F, $7915, $7916, $7930             ; $13E3B3 |

  REP #$30                                  ; $13E3BB |
  LDY #$0000                                ; $13E3BD |
  LDA $28                                   ; $13E3C0 |
  BEQ CODE_13E3D6                           ; $13E3C2 |
  LDY #$0006                                ; $13E3C4 |
  INC A                                     ; $13E3C7 |
  CMP $2A                                   ; $13E3C8 |
  BEQ CODE_13E3D6                           ; $13E3CA |
  DEC A                                     ; $13E3CC |
  AND #$0001                                ; $13E3CD |
  ASL A                                     ; $13E3D0 |
  CLC                                       ; $13E3D1 |
  ADC #$0002                                ; $13E3D2 |
  TAY                                       ; $13E3D5 |

CODE_13E3D6:
  LDX $1D                                   ; $13E3D6 |
  LDA $E3B3,y                               ; $13E3D8 |
  STA $7F8000,x                             ; $13E3DB |
  SEP #$30                                  ; $13E3DF |
  RTL                                       ; $13E3E1 |

  dw $7932, $7925, $7926, $7933             ; $13E3E2 |

  REP #$30                                  ; $13E3EA |
  LDY #$0000                                ; $13E3EC |
  LDA $28                                   ; $13E3EF |
  BEQ CODE_13E405                           ; $13E3F1 |
  LDY #$0006                                ; $13E3F3 |
  INC A                                     ; $13E3F6 |
  CMP $2A                                   ; $13E3F7 |
  BEQ CODE_13E405                           ; $13E3F9 |
  DEC A                                     ; $13E3FB |
  AND #$0001                                ; $13E3FC |
  ASL A                                     ; $13E3FF |
  CLC                                       ; $13E400 |
  ADC #$0002                                ; $13E401 |
  TAY                                       ; $13E404 |

CODE_13E405:
  LDX $1D                                   ; $13E405 |
  LDA $E3E2,y                               ; $13E407 |
  STA $7F8000,x                             ; $13E40A |
  SEP #$30                                  ; $13E40E |
  RTL                                       ; $13E410 |

  dw $792F, $790F, $791F, $7932             ; $13E411 |

  REP #$30                                  ; $13E419 |
  LDY #$0000                                ; $13E41B |
  LDA $2C                                   ; $13E41E |
  BEQ CODE_13E434                           ; $13E420 |
  LDY #$0006                                ; $13E422 |
  INC A                                     ; $13E425 |
  CMP $2E                                   ; $13E426 |
  BEQ CODE_13E434                           ; $13E428 |
  DEC A                                     ; $13E42A |
  AND #$0001                                ; $13E42B |
  ASL A                                     ; $13E42E |
  CLC                                       ; $13E42F |
  ADC #$0002                                ; $13E430 |
  TAY                                       ; $13E433 |

CODE_13E434:
  LDX $1D                                   ; $13E434 |
  LDA $E411,y                               ; $13E436 |
  STA $7F8000,x                             ; $13E439 |
  SEP #$30                                  ; $13E43D |
  RTL                                       ; $13E43F |

  dw $7930, $7910, $7920, $7933             ; $13E440 |

  REP #$30                                  ; $13E448 |
  LDY #$0000                                ; $13E44A |
  LDA $2C                                   ; $13E44D |
  BEQ CODE_13E463                           ; $13E44F |
  LDY #$0006                                ; $13E451 |
  INC A                                     ; $13E454 |
  CMP $2E                                   ; $13E455 |
  BEQ CODE_13E463                           ; $13E457 |
  DEC A                                     ; $13E459 |
  AND #$0001                                ; $13E45A |
  ASL A                                     ; $13E45D |
  CLC                                       ; $13E45E |
  ADC #$0002                                ; $13E45F |
  TAY                                       ; $13E462 |

CODE_13E463:
  LDX $1D                                   ; $13E463 |
  LDA $E440,y                               ; $13E465 |
  STA $7F8000,x                             ; $13E468 |
  SEP #$30                                  ; $13E46C |
  RTL                                       ; $13E46E |

  dw $7799, $779A, $779B, $779C             ; $13E46F |
  dw $779D, $779E, $779F, $77A0             ; $13E477 |
  dw $77A1, $77A2, $77A3, $77A4             ; $13E47F |
  dw $77A5, $77A6, $77A7, $77A8             ; $13E487 |
  dw $77A9, $77AA, $77AB, $77AC             ; $13E48F |
  dw $77AD, $77AE, $77AF, $77B0             ; $13E497 |
  dw $77B1, $77B2, $77B3, $77B4             ; $13E49F |
  dw $77B5, $77B6, $77B7, $77B8             ; $13E4A7 |
  dw $77B9, $77BA, $77BB, $77BE             ; $13E4AF |
  dw $77C9, $77CA, $77CC, $77CE             ; $13E4B7 |
  dw $854B, $854C, $854D, $854E             ; $13E4BF |
  dw $77CF, $77CF, $77CF, $77CF             ; $13E4C7 |
  dw $77C8, $77C8, $77C8, $77C8             ; $13E4CF |
  dw $77CF, $77CF, $77C8, $77C8             ; $13E4D7 |
  dw $77CF, $77CF, $77C8, $77C8             ; $13E4DF |
  dw $77CF, $77CF, $77CF, $77CF             ; $13E4E7 |
  dw $77C8, $77C8, $77C8, $77C8             ; $13E4EF |
  dw $77CF, $77CF, $77C8, $77C8             ; $13E4F7 |
  dw $77CF, $77CF, $77C8, $77C8             ; $13E4FF |
  dw $77CF, $77C8, $77CF, $77CF             ; $13E507 |
  dw $77CF, $77C8, $77CF, $77CF             ; $13E50F |
  dw $854F, $854F, $854F, $854F             ; $13E517 |
  dw $7925, $7926, $7927, $7928             ; $13E51F |
  dw $7929, $792A, $791B, $791C             ; $13E527 |
  dw $7962, $7963, $7966, $7968             ; $13E52F |
  dw $7969, $796A, $796D, $796F             ; $13E537 |
  dw $7978, $7979, $797C, $797D             ; $13E53F |
  dw $7936, $7937, $7939, $793B             ; $13E547 |
  dw $7805, $7806, $7807, $7808             ; $13E54F |
  dw $7809, $780A, $780B, $780C             ; $13E557 |
  dw $780D, $780E, $780F, $7810             ; $13E55F |
  dw $7811, $7812, $7813, $7814             ; $13E567 |
  dw $7815, $7816, $7817, $7818             ; $13E56F |
  dw $1513, $1514, $1515, $1516             ; $13E577 |
  dw $1518, $1519                           ; $13E57F |

  REP #$30                                  ; $13E583 |
  LDA $2C                                   ; $13E585 |
  BNE CODE_13E59E                           ; $13E587 |
  LDY #$0056                                ; $13E589 |
  LDA $12                                   ; $13E58C |

CODE_13E58E:
  CMP $E46F,y                               ; $13E58E |
  BEQ CODE_13E599                           ; $13E591 |
  DEY                                       ; $13E593 |
  DEY                                       ; $13E594 |
  BPL CODE_13E58E                           ; $13E595 |
  BRA CODE_13E5F2                           ; $13E597 |

CODE_13E599:
  LDA $E4C7,y                               ; $13E599 |
  BRA CODE_13E5EC                           ; $13E59C |

CODE_13E59E:
  INC A                                     ; $13E59E |
  INC A                                     ; $13E59F |
  CMP $2E                                   ; $13E5A0 |
  BNE CODE_13E5BC                           ; $13E5A2 |
  LDY #$001A                                ; $13E5A4 |
  LDA $12                                   ; $13E5A7 |

CODE_13E5A9:
  CMP $E5F5,y                               ; $13E5A9 |
  BEQ CODE_13E5B7                           ; $13E5AC |
  DEY                                       ; $13E5AE |
  DEY                                       ; $13E5AF |
  BPL CODE_13E5A9                           ; $13E5B0 |
  LDA #$8103                                ; $13E5B2 |
  BRA CODE_13E5EC                           ; $13E5B5 |

CODE_13E5B7:
  LDA $E611,y                               ; $13E5B7 |
  BRA CODE_13E5EC                           ; $13E5BA |

CODE_13E5BC:
  DEC A                                     ; $13E5BC |
  CMP $2E                                   ; $13E5BD |
  BNE CODE_13E5D6                           ; $13E5BF |
  LDY #$002E                                ; $13E5C1 |
  LDA $12                                   ; $13E5C4 |

CODE_13E5C6:
  CMP $E51F,y                               ; $13E5C6 |
  BEQ CODE_13E5D1                           ; $13E5C9 |
  DEY                                       ; $13E5CB |
  DEY                                       ; $13E5CC |
  BPL CODE_13E5C6                           ; $13E5CD |
  BRA CODE_13E5F2                           ; $13E5CF |

CODE_13E5D1:
  LDA $E54F,y                               ; $13E5D1 |
  BRA CODE_13E5EC                           ; $13E5D4 |

CODE_13E5D6:
  LDY #$000A                                ; $13E5D6 |
  LDA $12                                   ; $13E5D9 |

CODE_13E5DB:
  CMP $E577,y                               ; $13E5DB |
  BEQ CODE_13E5E9                           ; $13E5DE |
  DEY                                       ; $13E5E0 |
  DEY                                       ; $13E5E1 |
  BPL CODE_13E5DB                           ; $13E5E2 |
  LDA #$8101                                ; $13E5E4 |
  BRA CODE_13E5EC                           ; $13E5E7 |

CODE_13E5E9:
  LDA #$1517                                ; $13E5E9 |

CODE_13E5EC:
  LDX $1D                                   ; $13E5EC |
  STA $7F8000,x                             ; $13E5EE |

CODE_13E5F2:
  SEP #$30                                  ; $13E5F2 |
  RTL                                       ; $13E5F4 |

  dw $7925, $7926, $7927, $7928             ; $13E5F5 |
  dw $7929, $792A, $791B, $791C             ; $13E5FD |
  dw $082D, $082E, $0A2D, $0A2E             ; $13E605 |
  dw $0A2F, $0A30, $7805, $7806             ; $13E60D |
  dw $7807, $7808, $7809, $780A             ; $13E615 |
  dw $780B, $780C, $7F01, $7F01             ; $13E61D |
  dw $8001, $8001, $8001, $8001             ; $13E625 |

  REP #$30                                  ; $13E62D |
  LDA $2C                                   ; $13E62F |
  BNE CODE_13E64E                           ; $13E631 |
  LDY #$77BF                                ; $13E633 |
  LDA $12                                   ; $13E636 |
  CMP #$77BA                                ; $13E638 |
  BEQ CODE_13E64B                           ; $13E63B |
  LDY #$77C0                                ; $13E63D |
  AND #$FF00                                ; $13E640 |
  CMP #$8500                                ; $13E643 |
  BNE CODE_13E64B                           ; $13E646 |
  JMP CODE_13E6E5                           ; $13E648 |

CODE_13E64B:
  JMP CODE_13E6DE                           ; $13E64B |

CODE_13E64E:
  CMP #$0001                                ; $13E64E |
  BNE CODE_13E674                           ; $13E651 |
  LDY #$8100                                ; $13E653 |
  LDA $12                                   ; $13E656 |
  CMP #$779F                                ; $13E658 |
  BEQ CODE_13E64B                           ; $13E65B |
  CMP #$77A0                                ; $13E65D |
  BEQ CODE_13E6DE                           ; $13E660 |
  LDY #$1517                                ; $13E662 |
  CMP #$1513                                ; $13E665 |
  BEQ CODE_13E6DE                           ; $13E668 |
  CMP #$1516                                ; $13E66A |
  BEQ CODE_13E6DE                           ; $13E66D |
  LDY #$8102                                ; $13E66F |
  BRA CODE_13E6DE                           ; $13E672 |

CODE_13E674:
  INC A                                     ; $13E674 |
  CMP $2E                                   ; $13E675 |
  BNE CODE_13E6A1                           ; $13E677 |
  LDY #$001A                                ; $13E679 |
  LDA $12                                   ; $13E67C |

CODE_13E67E:
  CMP $E5F5,y                               ; $13E67E |
  BEQ CODE_13E69B                           ; $13E681 |
  DEY                                       ; $13E683 |
  DEY                                       ; $13E684 |
  BPL CODE_13E67E                           ; $13E685 |
  LDY #$002E                                ; $13E687 |

CODE_13E68A:
  CMP $E51F,y                               ; $13E68A |
  BEQ CODE_13E695                           ; $13E68D |
  DEY                                       ; $13E68F |
  DEY                                       ; $13E690 |
  BPL CODE_13E68A                           ; $13E691 |
  BRA CODE_13E6D6                           ; $13E693 |

CODE_13E695:
  LDA $E54F,y                               ; $13E695 |
  TAY                                       ; $13E698 |
  BRA CODE_13E6DE                           ; $13E699 |

CODE_13E69B:
  LDA $E611,y                               ; $13E69B |
  TAY                                       ; $13E69E |
  BRA CODE_13E6DE                           ; $13E69F |

CODE_13E6A1:
  INC A                                     ; $13E6A1 |
  CMP $2E                                   ; $13E6A2 |
  BNE CODE_13E6C8                           ; $13E6A4 |
  LDA $1B                                   ; $13E6A6 |
  STA $0E                                   ; $13E6A8 |
  JSL $12875D                               ; $13E6AA |
  LDY #$002E                                ; $13E6AE |
  LDA $7F8000,x                             ; $13E6B1 |

CODE_13E6B5:
  CMP $E51F,y                               ; $13E6B5 |
  BEQ CODE_13E6C3                           ; $13E6B8 |
  DEY                                       ; $13E6BA |
  DEY                                       ; $13E6BB |
  BPL CODE_13E6B5                           ; $13E6BC |
  LDY #$8101                                ; $13E6BE |
  BRA CODE_13E6DE                           ; $13E6C1 |

CODE_13E6C3:
  LDY #$8103                                ; $13E6C3 |
  BRA CODE_13E6DE                           ; $13E6C6 |

CODE_13E6C8:
  LDY #$000A                                ; $13E6C8 |
  LDA $12                                   ; $13E6CB |

CODE_13E6CD:
  CMP $E577,y                               ; $13E6CD |
  BEQ CODE_13E6DB                           ; $13E6D0 |
  DEY                                       ; $13E6D2 |
  DEY                                       ; $13E6D3 |
  BPL CODE_13E6CD                           ; $13E6D4 |

CODE_13E6D6:
  LDY #$8101                                ; $13E6D6 |
  BRA CODE_13E6DE                           ; $13E6D9 |

CODE_13E6DB:
  LDY #$1517                                ; $13E6DB |

CODE_13E6DE:
  LDX $1D                                   ; $13E6DE |
  TYA                                       ; $13E6E0 |
  STA $7F8000,x                             ; $13E6E1 |

CODE_13E6E5:
  SEP #$30                                  ; $13E6E5 |
  RTL                                       ; $13E6E7 |

  dw $77AF, $77B0, $77B4, $77B8             ; $13E6E8 |
  dw $77C6, $77C7, $082D, $0A2E             ; $13E6F0 |
  dw $0A2F, $854B, $854C, $854D             ; $13E6F8 |
  dw $854E, $77C2, $77C3, $77D2             ; $13E700 |
  dw $77D3, $77D6, $77D7, $082E             ; $13E708 |
  dw $0A2D, $0A30, $855A, $855B             ; $13E710 |
  dw $855C, $855D, $8200, $8201             ; $13E718 |
  dw $8202, $8203, $8204, $8205             ; $13E720 |
  dw $8206, $8207, $8208, $8209             ; $13E728 |
  dw $820A, $820B, $820C, $820D             ; $13E730 |
  dw $820E, $820F, $8210, $8211             ; $13E738 |
  dw $8212, $8213, $8215, $8215             ; $13E740 |
  dw $8214, $8214                           ; $13E748 |

  REP #$30                                  ; $13E74C |
  LDX $1D                                   ; $13E74E |
  LDA $2C                                   ; $13E750 |
  BNE CODE_13E7B7                           ; $13E752 |
  LDA $12                                   ; $13E754 |
  CMP #$854A                                ; $13E756 |
  BNE CODE_13E760                           ; $13E759 |
  LDA #$8550                                ; $13E75B |
  BRA CODE_13E7CA                           ; $13E75E |

CODE_13E760:
  LDA $28                                   ; $13E760 |
  BNE CODE_13E784                           ; $13E762 |
  JSR CODE_13FD54                           ; $13E764 |
  LDX $1D                                   ; $13E767 |
  CMP #$8101                                ; $13E769 |
  BNE CODE_13E7A2                           ; $13E76C |
  LDA $12                                   ; $13E76E |
  SEC                                       ; $13E770 |
  SBC #$854B                                ; $13E771 |
  CMP #$0004                                ; $13E774 |
  BCS CODE_13E77F                           ; $13E777 |
  CLC                                       ; $13E779 |
  ADC #$8556                                ; $13E77A |
  BRA CODE_13E7CA                           ; $13E77D |

CODE_13E77F:
  LDA #$77EB                                ; $13E77F |
  BRA CODE_13E7CA                           ; $13E782 |

CODE_13E784:
  JSR CODE_13FD61                           ; $13E784 |
  CMP #$8101                                ; $13E787 |
  BNE CODE_13E7A2                           ; $13E78A |
  LDA $12                                   ; $13E78C |
  SEC                                       ; $13E78E |
  SBC #$854B                                ; $13E78F |
  CMP #$0004                                ; $13E792 |
  BCS CODE_13E79D                           ; $13E795 |
  CLC                                       ; $13E797 |
  ADC #$856A                                ; $13E798 |
  BRA CODE_13E7CA                           ; $13E79B |

CODE_13E79D:
  LDA #$77D0                                ; $13E79D |
  BRA CODE_13E7CA                           ; $13E7A0 |

CODE_13E7A2:
  LDY #$0018                                ; $13E7A2 |
  LDA $12                                   ; $13E7A5 |

CODE_13E7A7:
  CMP $E6E8,y                               ; $13E7A7 |
  BEQ CODE_13E7B2                           ; $13E7AA |
  DEY                                       ; $13E7AC |
  DEY                                       ; $13E7AD |
  BPL CODE_13E7A7                           ; $13E7AE |
  BRA CODE_13E7D0                           ; $13E7B0 |

CODE_13E7B2:
  LDA $E702,y                               ; $13E7B2 |
  BRA CODE_13E7CA                           ; $13E7B5 |

CODE_13E7B7:
  LDY #$002E                                ; $13E7B7 |
  LDA $12                                   ; $13E7BA |

CODE_13E7BC:
  CMP $E51F,y                               ; $13E7BC |
  BEQ CODE_13E7C7                           ; $13E7BF |
  DEY                                       ; $13E7C1 |
  DEY                                       ; $13E7C2 |
  BPL CODE_13E7BC                           ; $13E7C3 |
  BRA CODE_13E7D0                           ; $13E7C5 |

CODE_13E7C7:
  LDA $E71C,y                               ; $13E7C7 |

CODE_13E7CA:
  LDX $1D                                   ; $13E7CA |
  STA $7F8000,x                             ; $13E7CC |

CODE_13E7D0:
  SEP #$30                                  ; $13E7D0 |
  RTL                                       ; $13E7D2 |

  dw $77C4, $77C5, $77D5, $77D4             ; $13E7D3 |
  dw $77D6, $77D7, $082E, $0A2D             ; $13E7DB |
  dw $0A30, $855E, $855F, $8560             ; $13E7E3 |
  dw $8561, $8300, $8301, $8302             ; $13E7EB |
  dw $8303, $8304, $8305, $8306             ; $13E7F3 |
  dw $8307, $8308, $8309, $830A             ; $13E7FB |
  dw $830B, $830C, $830D, $830E             ; $13E803 |
  dw $830F, $8310, $8311, $8312             ; $13E80B |
  dw $8313, $8315, $8315, $8314             ; $13E813 |
  dw $8314                                  ; $13E81B |

  REP #$30                                  ; $13E81D |
  LDX $1D                                   ; $13E81F |
  LDA $2C                                   ; $13E821 |
  BNE CODE_13E886                           ; $13E823 |
  LDA $12                                   ; $13E825 |
  CMP #$8546                                ; $13E827 |
  BNE CODE_13E831                           ; $13E82A |
  LDA #$8551                                ; $13E82C |
  BRA CODE_13E899                           ; $13E82F |

CODE_13E831:
  LDA $28                                   ; $13E831 |
  BNE CODE_13E853                           ; $13E833 |
  JSR CODE_13FD54                           ; $13E835 |
  CMP #$8101                                ; $13E838 |
  BNE CODE_13E871                           ; $13E83B |
  LDA $12                                   ; $13E83D |
  SEC                                       ; $13E83F |
  SBC #$854B                                ; $13E840 |
  CMP #$0004                                ; $13E843 |
  BCS CODE_13E84E                           ; $13E846 |
  CLC                                       ; $13E848 |
  ADC #$856E                                ; $13E849 |
  BRA CODE_13E899                           ; $13E84C |

CODE_13E84E:
  LDA #$77D1                                ; $13E84E |
  BRA CODE_13E899                           ; $13E851 |

CODE_13E853:
  JSR CODE_13FD61                           ; $13E853 |
  CMP #$8101                                ; $13E856 |
  BNE CODE_13E871                           ; $13E859 |
  LDA $12                                   ; $13E85B |
  SEC                                       ; $13E85D |
  SBC #$854B                                ; $13E85E |
  CMP #$0004                                ; $13E861 |
  BCS CODE_13E86C                           ; $13E864 |
  CLC                                       ; $13E866 |
  ADC #$8552                                ; $13E867 |
  BRA CODE_13E899                           ; $13E86A |

CODE_13E86C:
  LDA #$77D0                                ; $13E86C |
  BRA CODE_13E899                           ; $13E86F |

CODE_13E871:
  LDY #$0018                                ; $13E871 |
  LDA $12                                   ; $13E874 |

CODE_13E876:
  CMP $E6E8,y                               ; $13E876 |
  BEQ CODE_13E881                           ; $13E879 |
  DEY                                       ; $13E87B |
  DEY                                       ; $13E87C |
  BPL CODE_13E876                           ; $13E87D |
  BRA CODE_13E89F                           ; $13E87F |

CODE_13E881:
  LDA $E7D3,y                               ; $13E881 |
  BRA CODE_13E899                           ; $13E884 |

CODE_13E886:
  LDY #$002E                                ; $13E886 |
  LDA $12                                   ; $13E889 |

CODE_13E88B:
  CMP $E51F,y                               ; $13E88B |
  BEQ CODE_13E896                           ; $13E88E |
  DEY                                       ; $13E890 |
  DEY                                       ; $13E891 |
  BPL CODE_13E88B                           ; $13E892 |
  BRA CODE_13E89F                           ; $13E894 |

CODE_13E896:
  LDA $E7ED,y                               ; $13E896 |

CODE_13E899:
  LDX $1D                                   ; $13E899 |
  STA $7F8000,x                             ; $13E89B |

CODE_13E89F:
  SEP #$30                                  ; $13E89F |
  RTL                                       ; $13E8A1 |

  dw $082D, $082E                           ; $13E8A2 |

  REP #$30                                  ; $13E8A6 |
  LDY #$77BF                                ; $13E8A8 |
  LDA $2C                                   ; $13E8AB |
  BEQ CODE_13E8C2                           ; $13E8AD |
  LDY #$0002                                ; $13E8AF |
  LDA $12                                   ; $13E8B2 |

CODE_13E8B4:
  CMP $E8A2,y                               ; $13E8B4 |
  BEQ CODE_13E8BF                           ; $13E8B7 |
  DEY                                       ; $13E8B9 |
  DEY                                       ; $13E8BA |
  BPL CODE_13E8B4                           ; $13E8BB |
  BRA CODE_13E8C9                           ; $13E8BD |

CODE_13E8BF:
  LDY #$7F00                                ; $13E8BF |

CODE_13E8C2:
  LDX $1D                                   ; $13E8C2 |
  TYA                                       ; $13E8C4 |
  STA $7F8000,x                             ; $13E8C5 |

CODE_13E8C9:
  LDA #$FFFF                                ; $13E8C9 |
  STA $9B                                   ; $13E8CC |
  SEP #$30                                  ; $13E8CE |
  RTL                                       ; $13E8D0 |

  dw $0A2D, $0A2E, $0A2F, $0A30             ; $13E8D1 |

  REP #$30                                  ; $13E8D9 |
  LDY #$77C0                                ; $13E8DB |
  LDA $2C                                   ; $13E8DE |
  BEQ CODE_13E8F5                           ; $13E8E0 |
  LDY #$0006                                ; $13E8E2 |
  LDA $12                                   ; $13E8E5 |

CODE_13E8E7:
  CMP $E8D1,y                               ; $13E8E7 |
  BEQ CODE_13E8F2                           ; $13E8EA |
  DEY                                       ; $13E8EC |
  DEY                                       ; $13E8ED |
  BPL CODE_13E8E7                           ; $13E8EE |
  BRA CODE_13E8FC                           ; $13E8F0 |

CODE_13E8F2:
  LDY #$8000                                ; $13E8F2 |

CODE_13E8F5:
  LDX $1D                                   ; $13E8F5 |
  TYA                                       ; $13E8F7 |
  STA $7F8000,x                             ; $13E8F8 |

CODE_13E8FC:
  LDA #$FFFF                                ; $13E8FC |
  STA $9B                                   ; $13E8FF |
  SEP #$30                                  ; $13E901 |
  RTL                                       ; $13E903 |

  REP #$30                                  ; $13E904 |
  LDA $28                                   ; $13E906 |
  AND #$0001                                ; $13E908 |
  BEQ CODE_13E92A                           ; $13E90B |
  BRA CODE_13E93F                           ; $13E90D |
  REP #$30                                  ; $13E90F |
  LDA $2C                                   ; $13E911 |
  AND #$0001                                ; $13E913 |
  BEQ CODE_13E92A                           ; $13E916 |
  BRA CODE_13E93F                           ; $13E918 |
  REP #$30                                  ; $13E91A |
  LDA #$FFFF                                ; $13E91C |
  STA $9B                                   ; $13E91F |
  LDA $28                                   ; $13E921 |
  AND #$0001                                ; $13E923 |
  BEQ CODE_13E92A                           ; $13E926 |
  BRA CODE_13E93F                           ; $13E928 |

CODE_13E92A:
  LDX $1D                                   ; $13E92A |
  JSL $01E501                               ; $13E92C |
  BNE CODE_13E93F                           ; $13E930 |
  LDA $15                                   ; $13E932 |
  AND #$0002                                ; $13E934 |
  TAY                                       ; $13E937 |
  LDA $C6C5,y                               ; $13E938 |
  STA $7F8000,x                             ; $13E93B |

CODE_13E93F:
  SEP #$30                                  ; $13E93F |
  RTL                                       ; $13E941 |

  dw $0000, $0000, $77BC, $77BC             ; $13E942 |
  dw $77BD, $77BD, $0000, $0000             ; $13E94A |
  dw $0000, $0000, $0000, $0000             ; $13E952 |
  dw $0000, $0000, $0000, $0000             ; $13E95A |
  dw $0000, $0000, $77BC, $77BC             ; $13E962 |
  dw $77BD, $77BD, $0000, $0000             ; $13E96A |
  dw $0000, $0000, $0000, $0000             ; $13E972 |
  dw $0000, $0000, $0000, $0000             ; $13E97A |
  dw $77BC, $77BD, $77BC, $77BC             ; $13E982 |
  dw $77BC, $77BD, $77BC, $77BC             ; $13E98A |
  dw $8572, $8573, $8574, $8575             ; $13E992 |

  dw $0000, $0000, $77CB, $77CB             ; $13E99A |
  dw $77CD, $77CD, $0000, $0000             ; $13E9A2 |
  dw $0000, $0000, $0000, $0000             ; $13E9AA |
  dw $0000, $0000, $0000, $0000             ; $13E9B2 |
  dw $0000, $0000, $77CB, $77CB             ; $13E9BA |
  dw $77CD, $77CD, $0000, $0000             ; $13E9C2 |
  dw $0000, $0000, $0000, $0000             ; $13E9CA |
  dw $0000, $0000, $0000, $0000             ; $13E9D2 |
  dw $77CB, $77CD, $77CB, $77CB             ; $13E9DA |
  dw $77CB, $77CD, $77CB, $77CB             ; $13E9E2 |
  dw $8576, $8577, $8578, $8579             ; $13E9EA |

  dw $E942, $E99A                           ; $13E9F2 |

  REP #$30                                  ; $13E9F6 |
  LDA $2C                                   ; $13E9F8 |
  BNE CODE_13EA23                           ; $13E9FA |
  LDY #$8103                                ; $13E9FC |
  LDA $12                                   ; $13E9FF |
  CMP #$8101                                ; $13EA01 |
  BEQ CODE_13EA4A                           ; $13EA04 |
  JSR CODE_13FD54                           ; $13EA06 |
  LDY #$0002                                ; $13EA09 |
  CMP #$8103                                ; $13EA0C |
  BEQ CODE_13EA30                           ; $13EA0F |
  JSR CODE_13FD61                           ; $13EA11 |
  LDY #$0000                                ; $13EA14 |
  CMP #$8103                                ; $13EA17 |
  BEQ CODE_13EA30                           ; $13EA1A |
  CMP #$8101                                ; $13EA1C |
  BEQ CODE_13EA30                           ; $13EA1F |
  BRA CODE_13EA51                           ; $13EA21 |

CODE_13EA23:
  LDY #$161F                                ; $13EA23 |
  CMP #$0001                                ; $13EA26 |
  BEQ CODE_13EA4A                           ; $13EA29 |
  LDY #$1620                                ; $13EA2B |
  BRA CODE_13EA4A                           ; $13EA2E |

CODE_13EA30:
  LDA $E9F2,y                               ; $13EA30 |
  STA $00                                   ; $13EA33 |
  LDY #$0056                                ; $13EA35 |
  LDA $12                                   ; $13EA38 |

CODE_13EA3A:
  CMP $E46F,y                               ; $13EA3A |
  BEQ CODE_13EA45                           ; $13EA3D |
  DEY                                       ; $13EA3F |
  DEY                                       ; $13EA40 |
  BPL CODE_13EA3A                           ; $13EA41 |
  BRA CODE_13EA51                           ; $13EA43 |

CODE_13EA45:
  LDA ($00),y                               ; $13EA45 |
  TAY                                       ; $13EA47 |
  BEQ CODE_13EA51                           ; $13EA48 |

CODE_13EA4A:
  LDX $1D                                   ; $13EA4A |
  TYA                                       ; $13EA4C |
  STA $7F8000,x                             ; $13EA4D |

CODE_13EA51:
  SEP #$30                                  ; $13EA51 |
  RTL                                       ; $13EA53 |

  dw $00CC, $00CB, $00C2                    ; $13EA54 |

  REP #$30                                  ; $13EA5A |
  LDX $1D                                   ; $13EA5C |
  LDY #$0000                                ; $13EA5E |
  LDA $2C                                   ; $13EA61 |
  BEQ CODE_13EA6E                           ; $13EA63 |
  INY                                       ; $13EA65 |
  INY                                       ; $13EA66 |
  CMP #$FFFF                                ; $13EA67 |
  BEQ CODE_13EA6E                           ; $13EA6A |
  INY                                       ; $13EA6C |
  INY                                       ; $13EA6D |

CODE_13EA6E:
  LDA $EA54,y                               ; $13EA6E |
  CPY #$0000                                ; $13EA71 |
  BNE CODE_13EA7A                           ; $13EA74 |
  LDA $12                                   ; $13EA76 |
  BNE CODE_13EA81                           ; $13EA78 |

CODE_13EA7A:
  LDA $EA54,y                               ; $13EA7A |
  STA $7F8000,x                             ; $13EA7D |

CODE_13EA81:
  LDA #$0001                                ; $13EA81 |
  STA $9B                                   ; $13EA84 |
  CPY #$0004                                ; $13EA86 |
  BCC CODE_13EA94                           ; $13EA89 |
  LDA $28                                   ; $13EA8B |
  BNE CODE_13EA99                           ; $13EA8D |
  JSR CODE_13EADC                           ; $13EA8F |
  BRA CODE_13EA99                           ; $13EA92 |

CODE_13EA94:
  JSR CODE_13EB2C                           ; $13EA94 |
  BRA CODE_13EAD9                           ; $13EA97 |

CODE_13EA99:
  LDA $2C                                   ; $13EA99 |
  DEC A                                     ; $13EA9B |
  CMP $2E                                   ; $13EA9C |
  BNE CODE_13EAD9                           ; $13EA9E |
  LDA $12                                   ; $13EAA0 |
  CMP #$00D5                                ; $13EAA2 |
  BNE CODE_13EAAB                           ; $13EAA5 |
  STZ $A1                                   ; $13EAA7 |
  BRA CODE_13EAD6                           ; $13EAA9 |

CODE_13EAAB:
  LDA $1B                                   ; $13EAAB |
  PHA                                       ; $13EAAD |
  AND #$0F0F                                ; $13EAAE |
  DEC A                                     ; $13EAB1 |
  AND #$0F0F                                ; $13EAB2 |
  STA $0E                                   ; $13EAB5 |
  PLA                                       ; $13EAB7 |
  AND #$F0F0                                ; $13EAB8 |
  ORA $0E                                   ; $13EABB |
  STA $0E                                   ; $13EABD |
  JSL $128719                               ; $13EABF |
  LDA $7F8000,x                             ; $13EAC3 |
  CMP #$0153                                ; $13EAC7 |
  BCC CODE_13EAD6                           ; $13EACA |
  CMP #$0161                                ; $13EACC |
  BCS CODE_13EAD6                           ; $13EACF |
  LDA #$0006                                ; $13EAD1 |
  STA $A1                                   ; $13EAD4 |

CODE_13EAD6:
  JSR CODE_13A4F8                           ; $13EAD6 |

CODE_13EAD9:
  SEP #$30                                  ; $13EAD9 |
  RTL                                       ; $13EADB |

CODE_13EADC:
  JSR CODE_13FD54                           ; $13EADC |
  CMP #$0153                                ; $13EADF |
  BCC CODE_13EAE9                           ; $13EAE2 |
  CMP #$0161                                ; $13EAE4 |
  BCC CODE_13EB18                           ; $13EAE7 |

CODE_13EAE9:
  LDA $1B                                   ; $13EAE9 |
  PHA                                       ; $13EAEB |
  AND #$0F0F                                ; $13EAEC |
  DEC A                                     ; $13EAEF |
  AND #$0F0F                                ; $13EAF0 |
  STA $0E                                   ; $13EAF3 |
  PLA                                       ; $13EAF5 |
  AND #$F0F0                                ; $13EAF6 |
  ORA $0E                                   ; $13EAF9 |
  STA $0E                                   ; $13EAFB |
  JSL $128719                               ; $13EAFD |
  LDA $7F8000,x                             ; $13EB01 |
  CMP #$0153                                ; $13EB05 |
  BCC CODE_13EB18                           ; $13EB08 |
  CMP #$0161                                ; $13EB0A |
  BCS CODE_13EB18                           ; $13EB0D |
  LDX $1D                                   ; $13EB0F |
  LDA #$00C7                                ; $13EB11 |
  STA $7F8000,x                             ; $13EB14 |

CODE_13EB18:
  JSR CODE_13A47E                           ; $13EB18 |
  RTS                                       ; $13EB1B |

  dw $77DD, $77DC, $77DA, $77DB             ; $13EB1C |
  dw $77E4, $77E2, $77E5, $77E3             ; $13EB24 |

CODE_13EB2C:
  LDA $1B                                   ; $13EB2C |
  STA $0E                                   ; $13EB2E |
  JSL $128719                               ; $13EB30 |
  LDA $7F8000,x                             ; $13EB34 |
  CMP #$0153                                ; $13EB38 |
  BCC CODE_13EB47                           ; $13EB3B |
  CMP #$0161                                ; $13EB3D |
  BCS CODE_13EB47                           ; $13EB40 |
  LDA $EB1C,y                               ; $13EB42 |
  BRA CODE_13EB57                           ; $13EB45 |

CODE_13EB47:
  JSR CODE_13FD54                           ; $13EB47 |
  CMP #$0153                                ; $13EB4A |
  BCC CODE_13EB5D                           ; $13EB4D |
  CMP #$0161                                ; $13EB4F |
  BCS CODE_13EB5D                           ; $13EB52 |
  LDA $EB24,y                               ; $13EB54 |

CODE_13EB57:
  LDX $1D                                   ; $13EB57 |
  STA $7F8000,x                             ; $13EB59 |

CODE_13EB5D:
  RTS                                       ; $13EB5D |

  dw $00C9, $00CA, $00C2                    ; $13EB5E |

  REP #$30                                  ; $13EB64 |
  LDX $1D                                   ; $13EB66 |
  LDY #$0000                                ; $13EB68 |
  LDA $2C                                   ; $13EB6B |
  BEQ CODE_13EB78                           ; $13EB6D |
  INY                                       ; $13EB6F |
  INY                                       ; $13EB70 |
  CMP #$FFFF                                ; $13EB71 |
  BEQ CODE_13EB78                           ; $13EB74 |
  INY                                       ; $13EB76 |
  INY                                       ; $13EB77 |

CODE_13EB78:
  LDA $EB5E,y                               ; $13EB78 |
  CPY #$0000                                ; $13EB7B |
  BNE CODE_13EB84                           ; $13EB7E |
  LDA $12                                   ; $13EB80 |
  BNE CODE_13EB8B                           ; $13EB82 |

CODE_13EB84:
  LDA $EB5E,y                               ; $13EB84 |
  STA $7F8000,x                             ; $13EB87 |

CODE_13EB8B:
  LDA #$0001                                ; $13EB8B |
  STA $9B                                   ; $13EB8E |
  CPY #$0004                                ; $13EB90 |
  BCC CODE_13EBA1                           ; $13EB93 |
  LDA $28                                   ; $13EB95 |
  DEC A                                     ; $13EB97 |
  CMP $2A                                   ; $13EB98 |
  BNE CODE_13EBAB                           ; $13EB9A |
  JSR CODE_13EADC                           ; $13EB9C |
  BRA CODE_13EBAB                           ; $13EB9F |

CODE_13EBA1:
  TYA                                       ; $13EBA1 |
  ORA #$0004                                ; $13EBA2 |
  TAY                                       ; $13EBA5 |
  JSR CODE_13EB2C                           ; $13EBA6 |
  BRA CODE_13EBED                           ; $13EBA9 |

CODE_13EBAB:
  LDA $2C                                   ; $13EBAB |
  DEC A                                     ; $13EBAD |
  CMP $2E                                   ; $13EBAE |
  BNE CODE_13EBED                           ; $13EBB0 |
  LDA $12                                   ; $13EBB2 |
  CMP #$00D5                                ; $13EBB4 |
  BNE CODE_13EBBB                           ; $13EBB7 |
  BRA CODE_13EBE8                           ; $13EBB9 |

CODE_13EBBB:
  LDA $1B                                   ; $13EBBB |
  PHA                                       ; $13EBBD |
  AND #$0F0F                                ; $13EBBE |
  DEC A                                     ; $13EBC1 |
  AND #$0F0F                                ; $13EBC2 |
  STA $0E                                   ; $13EBC5 |
  PLA                                       ; $13EBC7 |
  AND #$F0F0                                ; $13EBC8 |
  ORA $0E                                   ; $13EBCB |
  STA $0E                                   ; $13EBCD |
  JSL $128719                               ; $13EBCF |
  LDA $7F8000,x                             ; $13EBD3 |
  CMP #$0153                                ; $13EBD7 |
  BCC CODE_13EBE8                           ; $13EBDA |
  CMP #$0161                                ; $13EBDC |
  BCS CODE_13EBE8                           ; $13EBDF |
  LDA #$0006                                ; $13EBE1 |
  STA $A1                                   ; $13EBE4 |
  BRA CODE_13EBEA                           ; $13EBE6 |

CODE_13EBE8:
  STZ $A1                                   ; $13EBE8 |

CODE_13EBEA:
  JSR CODE_13A4F8                           ; $13EBEA |

CODE_13EBED:
  SEP #$30                                  ; $13EBED |
  RTL                                       ; $13EBEF |

  dw $00D6, $00C2, $00D7, $77D8             ; $13EBF0 |
  dw $0000, $77D9                           ; $13EBF8 |

  REP #$30                                  ; $13EBFC |
  LDX $1D                                   ; $13EBFE |
  LDY #$0000                                ; $13EC00 |
  LDA $28                                   ; $13EC03 |
  BEQ CODE_13EC10                           ; $13EC05 |
  INY                                       ; $13EC07 |
  INY                                       ; $13EC08 |
  INC A                                     ; $13EC09 |
  CMP $2A                                   ; $13EC0A |
  BNE CODE_13EC10                           ; $13EC0C |
  INY                                       ; $13EC0E |
  INY                                       ; $13EC0F |

CODE_13EC10:
  LDA $EBF0,y                               ; $13EC10 |
  STA $7F8000,x                             ; $13EC13 |
  LDA $2C                                   ; $13EC17 |
  BNE CODE_13EC49                           ; $13EC19 |
  CPY #$0002                                ; $13EC1B |
  BEQ CODE_13EC46                           ; $13EC1E |
  LDA $1B                                   ; $13EC20 |
  STA $0E                                   ; $13EC22 |
  JSL $128719                               ; $13EC24 |
  LDA $7F8000,x                             ; $13EC28 |
  CMP #$0153                                ; $13EC2C |
  BCC CODE_13EC46                           ; $13EC2F |
  CMP #$0161                                ; $13EC31 |
  BCS CODE_13EC46                           ; $13EC34 |
  LDX $1D                                   ; $13EC36 |
  LDA $EBF6,y                               ; $13EC38 |
  STA $7F8000,x                             ; $13EC3B |
  LDA #$0006                                ; $13EC3F |
  STA $A1                                   ; $13EC42 |
  BRA CODE_13EC49                           ; $13EC44 |

CODE_13EC46:
  JSR CODE_13A4F8                           ; $13EC46 |

CODE_13EC49:
  SEP #$30                                  ; $13EC49 |
  RTL                                       ; $13EC4B |

  REP #$30                                  ; $13EC4C |
  LDA #$FFFF                                ; $13EC4E |
  STA $9B                                   ; $13EC51 |
  LDX $1D                                   ; $13EC53 |
  LDA $15                                   ; $13EC55 |
  CLC                                       ; $13EC57 |
  ADC #$8700                                ; $13EC58 |
  STA $7F8000,x                             ; $13EC5B |
  SEP #$30                                  ; $13EC5F |
  RTL                                       ; $13EC61 |

  dw $8702, $8704                           ; $13EC62 |

  REP #$30                                  ; $13EC66 |
  LDX $1D                                   ; $13EC68 |
  LDY $15                                   ; $13EC6A |
  STZ $9B                                   ; $13EC6C |
  LDA $28                                   ; $13EC6E |
  AND #$0001                                ; $13EC70 |
  BEQ CODE_13EC77                           ; $13EC73 |
  DEC $9B                                   ; $13EC75 |

CODE_13EC77:
  CLC                                       ; $13EC77 |
  ADC $EC62,y                               ; $13EC78 |
  BRA CODE_13ECAD                           ; $13EC7B |

  dw $8706, $870A                           ; $13EC7D |

  REP #$30                                  ; $13EC81 |
  LDX $1D                                   ; $13EC83 |
  LDY $15                                   ; $13EC85 |
  STZ $9B                                   ; $13EC87 |
  LDA $28                                   ; $13EC89 |
  BPL CODE_13EC91                           ; $13EC8B |
  EOR #$FFFF                                ; $13EC8D |
  INC A                                     ; $13EC90 |

CODE_13EC91:
  AND #$0003                                ; $13EC91 |
  CMP #$0003                                ; $13EC94 |
  BNE CODE_13EC9B                           ; $13EC97 |
  DEC $9B                                   ; $13EC99 |

CODE_13EC9B:
  CLC                                       ; $13EC9B |
  ADC $EC7D,y                               ; $13EC9C |
  BRA CODE_13ECAD                           ; $13EC9F |
  REP #$30                                  ; $13ECA1 |
  LDA #$870F                                ; $13ECA3 |
  BRA CODE_13ECAD                           ; $13ECA6 |
  REP #$30                                  ; $13ECA8 |
  LDA #$870E                                ; $13ECAA |

CODE_13ECAD:
  LDX $1D                                   ; $13ECAD |
  STA $7F8000,x                             ; $13ECAF |
  SEP #$30                                  ; $13ECB3 |
  RTL                                       ; $13ECB5 |

  REP #$30                                  ; $13ECB6 |
  JSR CODE_13ECC8                           ; $13ECB8 |
  CLC                                       ; $13ECBB |
  ADC #$854B                                ; $13ECBC |
  LDX $1D                                   ; $13ECBF |
  STA $7F8000,x                             ; $13ECC1 |
  SEP #$30                                  ; $13ECC5 |
  RTL                                       ; $13ECC7 |

CODE_13ECC8:
  LDA $1B                                   ; $13ECC8 |
  AND #$0003                                ; $13ECCA |
  STA $00                                   ; $13ECCD |
  LDA $2C                                   ; $13ECCF |
  AND #$0001                                ; $13ECD1 |
  ASL A                                     ; $13ECD4 |
  ADC $00                                   ; $13ECD5 |
  AND #$0003                                ; $13ECD7 |
  RTS                                       ; $13ECDA |

  dw $EDA2, $EDC1                           ; $13ECDB |

  dw $7941, $7947                           ; $13ECDF |
  dw $7941, $7947, $7940, $7946             ; $13ECE3 |
  dw $793C, $7943, $793F, $7945             ; $13ECEB |
  dw $7931, $7942, $7915, $7916             ; $13ECF3 |
  dw $77A9, $77AA, $77AB, $77AC             ; $13ECFB |
  dw $77AD, $77AE, $77AF, $77B0             ; $13ED03 |
  dw $7925, $7926, $7938, $7938             ; $13ED0B |
  dw $8543, $8543, $8544, $8544             ; $13ED13 |
  dw $8545, $8545, $8546, $8546             ; $13ED1B |
  dw $7939, $7939                           ; $13ED23 |

  REP #$30                                  ; $13ED27 |
  LDX #$0000                                ; $13ED29 |
  LDA $2C                                   ; $13ED2C |
  BEQ CODE_13ED37                           ; $13ED2E |
  INX                                       ; $13ED30 |
  INX                                       ; $13ED31 |
  INC A                                     ; $13ED32 |
  CMP $2E                                   ; $13ED33 |
  BNE CODE_13ED40                           ; $13ED35 |

CODE_13ED37:
  LDA $1B                                   ; $13ED37 |
  STA $0E                                   ; $13ED39 |
  JSR ($ECDB,x)                             ; $13ED3B |
  BRA CODE_13ED9F                           ; $13ED3E |

CODE_13ED40:
  LDX $1D                                   ; $13ED40 |
  LDY #$0000                                ; $13ED42 |
  LDA $12                                   ; $13ED45 |

CODE_13ED47:
  CMP $ECF7,y                               ; $13ED47 |
  BEQ CODE_13ED55                           ; $13ED4A |
  INY                                       ; $13ED4C |
  INY                                       ; $13ED4D |
  CPY #$0018                                ; $13ED4E |
  BCC CODE_13ED47                           ; $13ED51 |
  BRA CODE_13ED5C                           ; $13ED53 |

CODE_13ED55:
  STZ $A1                                   ; $13ED55 |
  LDA $ED0F,y                               ; $13ED57 |
  BRA CODE_13ED9B                           ; $13ED5A |

CODE_13ED5C:
  LDY $A1                                   ; $13ED5C |
  BEQ CODE_13ED67                           ; $13ED5E |
  JSR CODE_13EDE4                           ; $13ED60 |
  STZ $A1                                   ; $13ED63 |
  BRA CODE_13ED9F                           ; $13ED65 |

CODE_13ED67:
  JSL $128875                               ; $13ED67 |
  AND #$0007                                ; $13ED6B |
  ASL A                                     ; $13ED6E |
  TAY                                       ; $13ED6F |
  CPY #$000C                                ; $13ED70 |
  BCC CODE_13ED82                           ; $13ED73 |
  LDA $2E                                   ; $13ED75 |
  CLC                                       ; $13ED77 |
  SBC $2C                                   ; $13ED78 |
  DEC A                                     ; $13ED7A |
  BNE CODE_13ED82                           ; $13ED7B |
  TYA                                       ; $13ED7D |
  AND #$0007                                ; $13ED7E |
  TAY                                       ; $13ED81 |

CODE_13ED82:
  LDA $ECDF,y                               ; $13ED82 |
  STA $7F8000,x                             ; $13ED85 |
  CPY #$0008                                ; $13ED89 |
  BCC CODE_13ED9F                           ; $13ED8C |
  CPY #$000C                                ; $13ED8E |
  BCC CODE_13ED95                           ; $13ED91 |
  STY $A1                                   ; $13ED93 |

CODE_13ED95:
  JSR CODE_13FD54                           ; $13ED95 |
  LDA $ECE7,y                               ; $13ED98 |

CODE_13ED9B:
  STA $7F8000,x                             ; $13ED9B |

CODE_13ED9F:
  SEP #$30                                  ; $13ED9F |
  RTL                                       ; $13EDA1 |

  JSL $128719                               ; $13EDA2 |
  LDA #$7980                                ; $13EDA6 |
  STA $7F8000,x                             ; $13EDA9 |
  JSR CODE_13FD54                           ; $13EDAD |
  LDA #$7981                                ; $13EDB0 |
  STA $7F8000,x                             ; $13EDB3 |
  LDX $1D                                   ; $13EDB7 |
  LDA #$7982                                ; $13EDB9 |
  STA $7F8000,x                             ; $13EDBC |
  RTS                                       ; $13EDC0 |

  JSL $12875D                               ; $13EDC1 |
  LDA #$7988                                ; $13EDC5 |
  STA $7F8000,x                             ; $13EDC8 |
  JSR CODE_13FD54                           ; $13EDCC |
  LDA #$7986                                ; $13EDCF |
  STA $7F8000,x                             ; $13EDD2 |
  LDX $1D                                   ; $13EDD6 |
  LDA #$7987                                ; $13EDD8 |
  STA $7F8000,x                             ; $13EDDB |
  RTS                                       ; $13EDDF |

  dw $793E, $7944                           ; $13EDE0 |

CODE_13EDE4:
  LDX $1D                                   ; $13EDE4 |
  LDA $EDD4,y                               ; $13EDE6 |
  STA $7F8000,x                             ; $13EDE9 |
  CPY #$000E                                ; $13EDED |
  BCS CODE_13EDFC                           ; $13EDF0 |
  JSR CODE_13FD54                           ; $13EDF2 |
  LDA #$793D                                ; $13EDF5 |
  STA $7F8000,x                             ; $13EDF8 |

CODE_13EDFC:
  RTS                                       ; $13EDFC |

  dw $EEAC, $EECB                           ; $13EDFD |

  dw $794D, $7953, $794D, $7953             ; $13EE01 |
  dw $794B, $7951, $794E, $7948             ; $13EE09 |
  dw $794C, $7952, $7931, $7949             ; $13EE11 |
  dw $793A, $793A, $8547, $8547             ; $13EE19 |
  dw $8548, $8548, $8549, $8549             ; $13EE21 |
  dw $854A, $854A, $793B, $793B             ; $13EE29 |

  REP #$30                                  ; $13EE31 |
  LDX #$0000                                ; $13EE33 |
  LDA $2C                                   ; $13EE36 |
  BEQ CODE_13EE41                           ; $13EE38 |
  INX                                       ; $13EE3A |
  INX                                       ; $13EE3B |
  INC A                                     ; $13EE3C |
  CMP $2E                                   ; $13EE3D |
  BNE CODE_13EE4A                           ; $13EE3F |

CODE_13EE41:
  LDA $1B                                   ; $13EE41 |
  STA $0E                                   ; $13EE43 |
  JSR ($EDFD,x)                             ; $13EE45 |
  BRA CODE_13EEA9                           ; $13EE48 |

CODE_13EE4A:
  LDX $1D                                   ; $13EE4A |
  LDY #$0000                                ; $13EE4C |
  LDA $12                                   ; $13EE4F |

CODE_13EE51:
  CMP $ECF7,y                               ; $13EE51 |
  BEQ CODE_13EE5F                           ; $13EE54 |
  INY                                       ; $13EE56 |
  INY                                       ; $13EE57 |
  CPY #$0018                                ; $13EE58 |
  BCC CODE_13EE51                           ; $13EE5B |
  BRA CODE_13EE66                           ; $13EE5D |

CODE_13EE5F:
  STZ $A1                                   ; $13EE5F |
  LDA $EE19,y                               ; $13EE61 |
  BRA CODE_13EEA5                           ; $13EE64 |

CODE_13EE66:
  LDY $A1                                   ; $13EE66 |
  BEQ CODE_13EE71                           ; $13EE68 |
  JSR CODE_13EEEE                           ; $13EE6A |
  STZ $A1                                   ; $13EE6D |
  BRA CODE_13EEA9                           ; $13EE6F |

CODE_13EE71:
  JSL $128875                               ; $13EE71 |
  AND #$0007                                ; $13EE75 |
  ASL A                                     ; $13EE78 |
  TAY                                       ; $13EE79 |
  CPY #$000C                                ; $13EE7A |
  BCC CODE_13EE8C                           ; $13EE7D |
  LDA $2E                                   ; $13EE7F |
  CLC                                       ; $13EE81 |
  SBC $2C                                   ; $13EE82 |
  DEC A                                     ; $13EE84 |
  BNE CODE_13EE8C                           ; $13EE85 |
  TYA                                       ; $13EE87 |
  AND #$0007                                ; $13EE88 |
  TAY                                       ; $13EE8B |

CODE_13EE8C:
  LDA $EE01,y                               ; $13EE8C |
  STA $7F8000,x                             ; $13EE8F |
  CPY #$0008                                ; $13EE93 |
  BCC CODE_13EEA9                           ; $13EE96 |
  CPY #$000C                                ; $13EE98 |
  BCC CODE_13EE9F                           ; $13EE9B |
  STY $A1                                   ; $13EE9D |

CODE_13EE9F:
  JSR CODE_13FD61                           ; $13EE9F |
  LDA $EE09,y                               ; $13EEA2 |

CODE_13EEA5:
  STA $7F8000,x                             ; $13EEA5 |

CODE_13EEA9:
  SEP #$30                                  ; $13EEA9 |
  RTL                                       ; $13EEAB |

  JSL $128719                               ; $13EEAC |
  LDA #$7983                                ; $13EEB0 |
  STA $7F8000,x                             ; $13EEB3 |
  JSR CODE_13FD61                           ; $13EEB7 |
  LDA #$7985                                ; $13EEBA |
  STA $7F8000,x                             ; $13EEBD |
  LDX $1D                                   ; $13EEC1 |
  LDA #$7984                                ; $13EEC3 |
  STA $7F8000,x                             ; $13EEC6 |
  RTS                                       ; $13EECA |

  JSL $12875D                               ; $13EECB |
  LDA #$798B                                ; $13EECF |
  STA $7F8000,x                             ; $13EED2 |
  JSR CODE_13FD61                           ; $13EED6 |
  LDA #$798A                                ; $13EED9 |
  STA $7F8000,x                             ; $13EEDC |
  LDX $1D                                   ; $13EEE0 |
  LDA #$7989                                ; $13EEE2 |
  STA $7F8000,x                             ; $13EEE5 |
  RTS                                       ; $13EEE9 |

  dw $794F, $794A                           ; $13EEEA |

CODE_13EEEE:
  LDX $1D                                   ; $13EEEE |
  LDA $EEDE,y                               ; $13EEF0 |
  STA $7F8000,x                             ; $13EEF3 |
  CPY #$000E                                ; $13EEF7 |
  BCS CODE_13EF06                           ; $13EEFA |
  JSR CODE_13FD61                           ; $13EEFC |
  LDA #$7950                                ; $13EEFF |
  STA $7F8000,x                             ; $13EF02 |

CODE_13EF06:
  RTS                                       ; $13EF06 |

  dw $EFD7, $EFF6                           ; $13EF07 |

  dw $795A, $7961, $795A, $7961             ; $13EF0B |
  dw $7959, $7960, $7956, $795D             ; $13EF13 |
  dw $7958, $795F, $7954, $795B             ; $13EF1B |
  dw $790F, $791F, $7799, $779A             ; $13EF23 |
  dw $779B, $779C, $779D, $779E             ; $13EF2B |
  dw $779F, $77A0, $7910, $7920             ; $13EF33 |
  dw $77CE, $7934, $7934, $853B             ; $13EF3B |
  dw $853B, $853C, $853C, $853D             ; $13EF43 |
  dw $853D, $853E, $853E, $7935             ; $13EF4B |
  dw $7935, $853C                           ; $13EF53 |

  REP #$30                                  ; $13EF57 |
  LDX #$0000                                ; $13EF59 |
  LDA $28                                   ; $13EF5C |
  BEQ CODE_13EF67                           ; $13EF5E |
  INX                                       ; $13EF60 |
  INX                                       ; $13EF61 |
  INC A                                     ; $13EF62 |
  CMP $2A                                   ; $13EF63 |
  BNE CODE_13EF70                           ; $13EF65 |

CODE_13EF67:
  LDA $1B                                   ; $13EF67 |
  STA $0E                                   ; $13EF69 |
  JSR ($EF07,x)                             ; $13EF6B |
  BRA CODE_13EFD4                           ; $13EF6E |

CODE_13EF70:
  LDX $1D                                   ; $13EF70 |
  LDY #$0000                                ; $13EF72 |
  LDA $12                                   ; $13EF75 |

CODE_13EF77:
  CMP $EF23,y                               ; $13EF77 |
  BEQ CODE_13EF85                           ; $13EF7A |
  INY                                       ; $13EF7C |
  INY                                       ; $13EF7D |
  CPY #$001A                                ; $13EF7E |
  BCC CODE_13EF77                           ; $13EF81 |
  BRA CODE_13EF8C                           ; $13EF83 |

CODE_13EF85:
  STZ $A1                                   ; $13EF85 |
  LDA $EF3D,y                               ; $13EF87 |
  BRA CODE_13EFD0                           ; $13EF8A |

CODE_13EF8C:
  LDY $A1                                   ; $13EF8C |
  BEQ CODE_13EF97                           ; $13EF8E |
  JSR CODE_13F01D                           ; $13EF90 |
  STZ $A1                                   ; $13EF93 |
  BRA CODE_13EFD4                           ; $13EF95 |

CODE_13EF97:
  JSL $128875                               ; $13EF97 |
  AND #$0007                                ; $13EF9B |
  ASL A                                     ; $13EF9E |
  TAY                                       ; $13EF9F |
  CPY #$000C                                ; $13EFA0 |
  BCC CODE_13EFB2                           ; $13EFA3 |
  LDA $2A                                   ; $13EFA5 |
  CLC                                       ; $13EFA7 |
  SBC $28                                   ; $13EFA8 |
  DEC A                                     ; $13EFAA |
  BNE CODE_13EFB2                           ; $13EFAB |
  TYA                                       ; $13EFAD |
  AND #$0007                                ; $13EFAE |
  TAY                                       ; $13EFB1 |

CODE_13EFB2:
  LDA $EF0B,y                               ; $13EFB2 |
  STA $7F8000,x                             ; $13EFB5 |
  CPY #$0008                                ; $13EFB9 |
  BCC CODE_13EFD4                           ; $13EFBC |
  CPY #$000C                                ; $13EFBE |
  BCC CODE_13EFC5                           ; $13EFC1 |
  STY $A1                                   ; $13EFC3 |

CODE_13EFC5:
  LDA $1B                                   ; $13EFC5 |
  STA $0E                                   ; $13EFC7 |
  JSL $128719                               ; $13EFC9 |
  LDA $EF13,y                               ; $13EFCD |

CODE_13EFD0:
  STA $7F8000,x                             ; $13EFD0 |

CODE_13EFD4:
  SEP #$30                                  ; $13EFD4 |
  RTL                                       ; $13EFD6 |

  JSL $128719                               ; $13EFD7 |
  LDA #$7980                                ; $13EFDB |
  STA $7F8000,x                             ; $13EFDE |
  JSR CODE_13FD54                           ; $13EFE2 |
  LDA #$7981                                ; $13EFE5 |
  STA $7F8000,x                             ; $13EFE8 |
  LDX $1D                                   ; $13EFEC |
  LDA #$7982                                ; $13EFEE |
  STA $7F8000,x                             ; $13EFF1 |
  RTS                                       ; $13EFF5 |

  JSL $128719                               ; $13EFF6 |
  LDA #$7983                                ; $13EFFA |
  STA $7F8000,x                             ; $13EFFD |
  JSR CODE_13FD61                           ; $13F001 |
  LDA #$7985                                ; $13F004 |
  STA $7F8000,x                             ; $13F007 |
  LDX $1D                                   ; $13F00B |
  LDA #$7984                                ; $13F00D |
  STA $7F8000,x                             ; $13F010 |
  RTS                                       ; $13F014 |

  dw $7957, $795E, $7955, $795C             ; $13F015 |

CODE_13F01D:
  LDX $1D                                   ; $13F01D |
  LDA $F009,y                               ; $13F01F |
  STA $7F8000,x                             ; $13F022 |
  LDA $1B                                   ; $13F026 |
  STA $0E                                   ; $13F028 |
  JSL $128719                               ; $13F02A |
  LDA $F00D,y                               ; $13F02E |
  STA $7F8000,x                             ; $13F031 |
  RTS                                       ; $13F035 |

  dw $F0EC, $F10B                           ; $13F036 |

  dw $7968, $796F                           ; $13F03A |
  dw $7968, $796F, $7966, $796D             ; $13F03E |
  dw $7962, $7969, $7967, $796E             ; $13F046 |
  dw $7964, $796B, $7936, $7936             ; $13F04E |
  dw $853F, $853F, $8540, $8540             ; $13F056 |
  dw $8541, $8541, $8542, $8542             ; $13F05E |
  dw $7937, $7937, $8540                    ; $13F066 |

  REP #$30                                  ; $13F06C |
  LDX #$0000                                ; $13F06E |
  LDA $28                                   ; $13F071 |
  BEQ CODE_13F07C                           ; $13F073 |
  INX                                       ; $13F075 |
  INX                                       ; $13F076 |
  INC A                                     ; $13F077 |
  CMP $2A                                   ; $13F078 |
  BNE CODE_13F085                           ; $13F07A |

CODE_13F07C:
  LDA $1B                                   ; $13F07C |
  STA $0E                                   ; $13F07E |
  JSR ($F036,x)                             ; $13F080 |
  BRA CODE_13F0E9                           ; $13F083 |

CODE_13F085:
  LDX $1D                                   ; $13F085 |
  LDY #$0000                                ; $13F087 |
  LDA $12                                   ; $13F08A |

CODE_13F08C:
  CMP $EF23,y                               ; $13F08C |
  BEQ CODE_13F09A                           ; $13F08F |
  INY                                       ; $13F091 |
  INY                                       ; $13F092 |
  CPY #$001A                                ; $13F093 |
  BCC CODE_13F08C                           ; $13F096 |
  BRA CODE_13F0A1                           ; $13F098 |

CODE_13F09A:
  STZ $A1                                   ; $13F09A |
  LDA $F052,y                               ; $13F09C |
  BRA CODE_13F0E5                           ; $13F09F |

CODE_13F0A1:
  LDY $A1                                   ; $13F0A1 |
  BEQ CODE_13F0AC                           ; $13F0A3 |
  JSR CODE_13F132                           ; $13F0A5 |
  STZ $A1                                   ; $13F0A8 |
  BRA CODE_13F0E9                           ; $13F0AA |

CODE_13F0AC:
  JSL $128875                               ; $13F0AC |
  AND #$0007                                ; $13F0B0 |
  ASL A                                     ; $13F0B3 |
  TAY                                       ; $13F0B4 |
  CPY #$000C                                ; $13F0B5 |
  BCC CODE_13F0C7                           ; $13F0B8 |
  LDA $2A                                   ; $13F0BA |
  CLC                                       ; $13F0BC |
  SBC $28                                   ; $13F0BD |
  DEC A                                     ; $13F0BF |
  BNE CODE_13F0C7                           ; $13F0C0 |
  TYA                                       ; $13F0C2 |
  AND #$0007                                ; $13F0C3 |
  TAY                                       ; $13F0C6 |

CODE_13F0C7:
  LDA $F03A,y                               ; $13F0C7 |
  STA $7F8000,x                             ; $13F0CA |
  CPY #$0008                                ; $13F0CE |
  BCC CODE_13F0E9                           ; $13F0D1 |
  CPY #$000C                                ; $13F0D3 |
  BCC CODE_13F0DA                           ; $13F0D6 |
  STY $A1                                   ; $13F0D8 |

CODE_13F0DA:
  LDA $1B                                   ; $13F0DA |
  STA $0E                                   ; $13F0DC |
  JSL $12875D                               ; $13F0DE |
  LDA $F042,y                               ; $13F0E2 |

CODE_13F0E5:
  STA $7F8000,x                             ; $13F0E5 |

CODE_13F0E9:
  SEP #$30                                  ; $13F0E9 |
  RTL                                       ; $13F0EB |

  JSL $12875D                               ; $13F0EC |
  LDA #$7988                                ; $13F0F0 |
  STA $7F8000,x                             ; $13F0F3 |
  JSR CODE_13FD54                           ; $13F0F7 |
  LDA #$7986                                ; $13F0FA |
  STA $7F8000,x                             ; $13F0FD |
  LDX $1D                                   ; $13F101 |
  LDA #$7987                                ; $13F103 |
  STA $7F8000,x                             ; $13F106 |
  RTS                                       ; $13F10A |

  JSL $12875D                               ; $13F10B |
  LDA #$798B                                ; $13F10F |
  STA $7F8000,x                             ; $13F112 |
  JSR CODE_13FD61                           ; $13F116 |
  LDA #$798A                                ; $13F119 |
  STA $7F8000,x                             ; $13F11C |
  LDX $1D                                   ; $13F120 |
  LDA #$7989                                ; $13F122 |
  STA $7F8000,x                             ; $13F125 |
  RTS                                       ; $13F129 |

  dw $7963, $796A, $7965, $796C             ; $13F12A |

CODE_13F132:
  LDX $1D                                   ; $13F132 |
  LDA $F11E,y                               ; $13F134 |
  STA $7F8000,x                             ; $13F137 |
  LDA $1B                                   ; $13F13B |
  STA $0E                                   ; $13F13D |
  JSL $12875D                               ; $13F13F |
  LDA $F122,y                               ; $13F143 |
  STA $7F8000,x                             ; $13F146 |
  RTS                                       ; $13F14A |

  dw $84BA, $84BB, $330C, $3510             ; $13F14B |
  dw $84BC, $84BD, $84BE, $84BF             ; $13F153 |
  dw $84C0, $84C0, $8600, $8600             ; $13F15B |
  dw $84C1, $84C1                           ; $13F163 |

  REP #$30                                  ; $13F167 |
  LDX $1D                                   ; $13F169 |
  LDA $2C                                   ; $13F16B |
  ASL A                                     ; $13F16D |
  ASL A                                     ; $13F16E |
  STA $00                                   ; $13F16F |
  LDA $28                                   ; $13F171 |
  AND #$0001                                ; $13F173 |
  ASL A                                     ; $13F176 |
  ORA $15                                   ; $13F177 |
  ADC $00                                   ; $13F179 |
  TAY                                       ; $13F17B |
  LDA $F14B,y                               ; $13F17C |
  STA $7F8000,x                             ; $13F17F |
  SEP #$30                                  ; $13F183 |
  RTL                                       ; $13F185 |

  REP #$30                                  ; $13F186 |
  LDA #$8A00                                ; $13F188 |
  LDX $1D                                   ; $13F18B |
  STA $7F8000,x                             ; $13F18D |
  SEP #$30                                  ; $13F191 |
  RTL                                       ; $13F193 |

  dw $0000, $0017, $0000, $0018             ; $13F194 |

  dw $8C01, $8C05, $8C09                    ; $13F19C |

  REP #$30                                  ; $13F1A2 |
  LDA $2C                                   ; $13F1A4 |
  BNE CODE_13F1BB                           ; $13F1A6 |
  LDA $12                                   ; $13F1A8 |
  BNE CODE_13F1DD                           ; $13F1AA |
  JSL $128875                               ; $13F1AC |
  AND #$0006                                ; $13F1B0 |
  TAY                                       ; $13F1B3 |
  LDA $F194,y                               ; $13F1B4 |
  BEQ CODE_13F1DD                           ; $13F1B7 |
  BRA CODE_13F1D7                           ; $13F1B9 |

CODE_13F1BB:
  LDA $28                                   ; $13F1BB |
  AND #$0001                                ; $13F1BD |
  STA $00                                   ; $13F1C0 |
  LDA $2C                                   ; $13F1C2 |
  DEC A                                     ; $13F1C4 |
  ASL A                                     ; $13F1C5 |
  CMP #$0006                                ; $13F1C6 |
  BCC CODE_13F1D0                           ; $13F1C9 |
  LDA #$8C0D                                ; $13F1CB |
  BRA CODE_13F1D7                           ; $13F1CE |

CODE_13F1D0:
  TAY                                       ; $13F1D0 |
  LDA $F19C,y                               ; $13F1D1 |
  CLC                                       ; $13F1D4 |
  ADC $00                                   ; $13F1D5 |

CODE_13F1D7:
  LDX $1D                                   ; $13F1D7 |
  STA $7F8000,x                             ; $13F1D9 |

CODE_13F1DD:
  SEP #$30                                  ; $13F1DD |
  RTL                                       ; $13F1DF |

  dw $8C03, $0000, $8C00, $8C07             ; $13F1E0 |
  dw $8C04, $8C0B, $8C08, $8C0E             ; $13F1E8 |
  dw $8C0C, $8C0E, $8C0C, $0015             ; $13F1F0 |
  dw $0016, $1621, $1622, $1623             ; $13F1F8 |
  dw $1624, $1625, $1625                    ; $13F200 |

  REP #$30                                  ; $13F206 |
  LDA $2C                                   ; $13F208 |
  BNE CODE_13F235                           ; $13F20A |
  LDY #$0000                                ; $13F20C |
  LDA $28                                   ; $13F20F |
  BEQ CODE_13F21C                           ; $13F211 |
  INY                                       ; $13F213 |
  INY                                       ; $13F214 |
  INC A                                     ; $13F215 |
  CMP $2A                                   ; $13F216 |
  BNE CODE_13F21C                           ; $13F218 |
  INY                                       ; $13F21A |
  INY                                       ; $13F21B |

CODE_13F21C:
  CPY #$0002                                ; $13F21C |
  BNE CODE_13F230                           ; $13F21F |
  LDA $1B                                   ; $13F221 |
  STA $0E                                   ; $13F223 |
  JSL $128719                               ; $13F225 |
  LDA #$0000                                ; $13F229 |
  STA $7F8000,x                             ; $13F22C |

CODE_13F230:
  LDA $F1E0,y                               ; $13F230 |
  BRA CODE_13F261                           ; $13F233 |

CODE_13F235:
  ASL A                                     ; $13F235 |
  ASL A                                     ; $13F236 |
  TAY                                       ; $13F237 |
  LDA $2C                                   ; $13F238 |
  CMP #$0004                                ; $13F23A |
  BCC CODE_13F242                           ; $13F23D |
  LDY #$0010                                ; $13F23F |

CODE_13F242:
  STY $00                                   ; $13F242 |
  LDA $28                                   ; $13F244 |
  BEQ CODE_13F24F                           ; $13F246 |
  INC A                                     ; $13F248 |
  CMP $2A                                   ; $13F249 |
  BNE CODE_13F254                           ; $13F24B |
  INY                                       ; $13F24D |
  INY                                       ; $13F24E |

CODE_13F24F:
  LDA $F1E2,y                               ; $13F24F |
  BRA CODE_13F261                           ; $13F252 |

CODE_13F254:
  LDA $28                                   ; $13F254 |
  AND #$0001                                ; $13F256 |
  ASL A                                     ; $13F259 |
  CLC                                       ; $13F25A |
  ADC $00                                   ; $13F25B |
  TAY                                       ; $13F25D |
  LDA $F1F2,y                               ; $13F25E |

CODE_13F261:
  LDX $1D                                   ; $13F261 |
  STA $7F8000,x                             ; $13F263 |
  SEP #$30                                  ; $13F267 |
  RTL                                       ; $13F269 |

  dw $F313, $F31E                           ; $13F26A |

  dw $8C0F, $8C10, $8C11, $8C10             ; $13F26E |
  dw $8C11, $8C12, $8C0F, $8C10             ; $13F276 |
  dw $798C, $798D, $798E, $798D             ; $13F27E |
  dw $798F, $7990, $798C, $7990             ; $13F286 |
  dw $7991, $7992, $7991, $7993             ; $13F28E |
  dw $7994, $7997, $7997, $7997             ; $13F296 |
  dw $7997, $7997, $7997, $7997             ; $13F29E |
  dw $7997, $7995, $7996, $7994             ; $13F2A6 |
  dw $7995, $7996, $7997, $7997             ; $13F2AE |
  dw $7997, $7997, $7997, $7997             ; $13F2B6 |

  REP #$30                                  ; $13F2BE |
  LDA $2C                                   ; $13F2C0 |
  BNE CODE_13F2CF                           ; $13F2C2 |
  LDA $28                                   ; $13F2C4 |
  AND #$0001                                ; $13F2C6 |
  CLC                                       ; $13F2C9 |
  ADC #$8D8C                                ; $13F2CA |
  BRA CODE_13F30A                           ; $13F2CD |

CODE_13F2CF:
  LDX #$0000                                ; $13F2CF |
  LDA $28                                   ; $13F2D2 |
  BEQ CODE_13F2DD                           ; $13F2D4 |
  INX                                       ; $13F2D6 |
  INX                                       ; $13F2D7 |
  INC A                                     ; $13F2D8 |
  CMP $2A                                   ; $13F2D9 |
  BNE CODE_13F2E8                           ; $13F2DB |

CODE_13F2DD:
  LDA $1B                                   ; $13F2DD |
  STA $0E                                   ; $13F2DF |
  JSR ($F26A,x)                             ; $13F2E1 |
  STA $7F8000,x                             ; $13F2E4 |

CODE_13F2E8:
  LDA $2C                                   ; $13F2E8 |
  CMP #$0006                                ; $13F2EA |
  BCS CODE_13F307                           ; $13F2ED |
  DEC A                                     ; $13F2EF |
  ASL A                                     ; $13F2F0 |
  ASL A                                     ; $13F2F1 |
  ASL A                                     ; $13F2F2 |
  STA $00                                   ; $13F2F3 |
  LDA $28                                   ; $13F2F5 |
  CLC                                       ; $13F2F7 |
  ADC $15                                   ; $13F2F8 |
  AND #$0007                                ; $13F2FA |
  CLC                                       ; $13F2FD |
  ADC $00                                   ; $13F2FE |
  ASL A                                     ; $13F300 |
  TAY                                       ; $13F301 |
  LDA $F26E,y                               ; $13F302 |
  BRA CODE_13F30A                           ; $13F305 |

CODE_13F307:
  LDA #$7997                                ; $13F307 |

CODE_13F30A:
  LDX $1D                                   ; $13F30A |
  STA $7F8000,x                             ; $13F30C |
  SEP #$30                                  ; $13F310 |
  RTL                                       ; $13F312 |

  JSL $1287A1                               ; $13F313 |
  LDA #$7998                                ; $13F317 |
  STA $00                                   ; $13F31A |
  BRA CODE_13F327                           ; $13F31C |
  JSL $1287E2                               ; $13F31E |
  LDA #$799A                                ; $13F322 |
  STA $00                                   ; $13F325 |

CODE_13F327:
  LDA $2C                                   ; $13F327 |
  DEC A                                     ; $13F329 |
  BEQ CODE_13F330                           ; $13F32A |
  INC $00                                   ; $13F32C |
  BRA CODE_13F330                           ; $13F32E |

CODE_13F330:
  LDA $00                                   ; $13F330 |
  RTS                                       ; $13F332 |

  dw $79A4, $79A6, $799B, $7999             ; $13F333 |

  REP #$30                                  ; $13F33B |
  LDA $28                                   ; $13F33D |
  ASL A                                     ; $13F33F |
  TAY                                       ; $13F340 |
  LDA $2C                                   ; $13F341 |
  CMP #$0002                                ; $13F343 |
  BCS CODE_13F352                           ; $13F346 |
  ASL A                                     ; $13F348 |
  TAY                                       ; $13F349 |
  LDA $F333,y                               ; $13F34A |
  CLC                                       ; $13F34D |
  ADC $28                                   ; $13F34E |
  BRA CODE_13F355                           ; $13F350 |

CODE_13F352:
  LDA $F337,y                               ; $13F352 |

CODE_13F355:
  LDX $1D                                   ; $13F355 |
  STA $7F8000,x                             ; $13F357 |
  SEP #$30                                  ; $13F35B |
  RTL                                       ; $13F35D |

  dw $8D92, $8D90, $8D91, $8D93             ; $13F35E |
  dw $A602, $A600, $A601, $A603             ; $13F366 |

  REP #$30                                  ; $13F36E |
  LDA $2C                                   ; $13F370 |
  ASL A                                     ; $13F372 |
  ASL A                                     ; $13F373 |
  STA $00                                   ; $13F374 |
  STZ $02                                   ; $13F376 |
  LDA $28                                   ; $13F378 |
  BEQ CODE_13F387                           ; $13F37A |
  INC A                                     ; $13F37C |
  CMP $2A                                   ; $13F37D |
  BNE CODE_13F38B                           ; $13F37F |
  INC $02                                   ; $13F381 |
  INC $02                                   ; $13F383 |
  INC $02                                   ; $13F385 |

CODE_13F387:
  LDA $02                                   ; $13F387 |
  BRA CODE_13F392                           ; $13F389 |

CODE_13F38B:
  AND #$0001                                ; $13F38B |
  CLC                                       ; $13F38E |
  ADC #$0001                                ; $13F38F |

CODE_13F392:
  CLC                                       ; $13F392 |
  ADC $00                                   ; $13F393 |
  ASL A                                     ; $13F395 |
  TAY                                       ; $13F396 |
  LDA $F35E,y                               ; $13F397 |
  LDY $12                                   ; $13F39A |
  CMP #$8D2E                                ; $13F39C |
  BCC CODE_13F3AB                           ; $13F39F |
  CMP #$8D32                                ; $13F3A1 |
  BCS CODE_13F3AB                           ; $13F3A4 |
  TYA                                       ; $13F3A6 |
  CLC                                       ; $13F3A7 |
  ADC #$0004                                ; $13F3A8 |

CODE_13F3AB:
  LDX $1D                                   ; $13F3AB |
  STA $7F8000,x                             ; $13F3AD |
  SEP #$30                                  ; $13F3B1 |
  RTL                                       ; $13F3B3 |

  REP #$30                                  ; $13F3B4 |
  LDY #$A605                                ; $13F3B6 |
  LDA $2C                                   ; $13F3B9 |
  BEQ CODE_13F3BE                           ; $13F3BB |
  INY                                       ; $13F3BD |

CODE_13F3BE:
  TYA                                       ; $13F3BE |
  LDX $1D                                   ; $13F3BF |
  STA $7F8000,x                             ; $13F3C1 |
  SEP #$30                                  ; $13F3C5 |
  RTL                                       ; $13F3C7 |

  dw $2C0C, $1527, $2F0B, $0000             ; $13F3C8 |
  dw $2C0E, $1528, $2F0D, $0000             ; $13F3D0 |
  dw $2C10, $1529, $2F0F, $8D2A             ; $13F3D8 |
  dw $8D2B, $8D2C, $8D2D                    ; $13F3E0 |

  REP #$30                                  ; $13F3E6 |
  LDA $002C                                 ; $13F3E8 |
  BNE CODE_13F405                           ; $13F3EB |
  LDA $A1                                   ; $13F3ED |
  ASL A                                     ; $13F3EF |
  ADC $15                                   ; $13F3F0 |
  TAY                                       ; $13F3F2 |
  LDA $F3C8,y                               ; $13F3F3 |
  LDX $12                                   ; $13F3F6 |
  CPX #$8D2A                                ; $13F3F8 |
  BCC CODE_13F447                           ; $13F3FB |
  CPX #$8D2E                                ; $13F3FD |
  BCS CODE_13F447                           ; $13F400 |
  INC A                                     ; $13F402 |
  BRA CODE_13F447                           ; $13F403 |

CODE_13F405:
  LDA $A1                                   ; $13F405 |
  AND #$0001                                ; $13F407 |
  BEQ CODE_13F44D                           ; $13F40A |
  LDA $2C                                   ; $13F40C |
  INC A                                     ; $13F40E |
  CMP $2E                                   ; $13F40F |
  BEQ CODE_13F42B                           ; $13F411 |
  CMP #$0002                                ; $13F413 |
  BNE CODE_13F41D                           ; $13F416 |
  LDA #$8D29                                ; $13F418 |
  BRA CODE_13F447                           ; $13F41B |

CODE_13F41D:
  LDA $2C                                   ; $13F41D |
  DEC A                                     ; $13F41F |
  DEC A                                     ; $13F420 |
  AND #$0003                                ; $13F421 |
  ASL A                                     ; $13F424 |
  TAY                                       ; $13F425 |
  LDA $F3DE,y                               ; $13F426 |
  BRA CODE_13F447                           ; $13F429 |

CODE_13F42B:
  LDA $2C                                   ; $13F42B |
  AND #$0003                                ; $13F42D |
  EOR #$0002                                ; $13F430 |
  CLC                                       ; $13F433 |
  ADC #$8D2E                                ; $13F434 |
  LDY $12                                   ; $13F437 |
  CPY #$8D90                                ; $13F439 |
  BCC CODE_13F447                           ; $13F43C |
  CPY #$8D94                                ; $13F43E |
  BCS CODE_13F447                           ; $13F441 |
  CLC                                       ; $13F443 |
  ADC #$0004                                ; $13F444 |

CODE_13F447:
  LDX $1D                                   ; $13F447 |
  STA $7F8000,x                             ; $13F449 |

CODE_13F44D:
  LDA $2C                                   ; $13F44D |
  INC A                                     ; $13F44F |
  CMP $2E                                   ; $13F450 |
  BNE CODE_13F461                           ; $13F452 |
  LDA $A1                                   ; $13F454 |
  INC A                                     ; $13F456 |
  CMP #$0003                                ; $13F457 |
  BCC CODE_13F45F                           ; $13F45A |
  LDA #$0000                                ; $13F45C |

CODE_13F45F:
  STA $A1                                   ; $13F45F |

CODE_13F461:
  SEP #$30                                  ; $13F461 |
  RTL                                       ; $13F463 |

  dw $0000, $8D9A, $8D9B, $0000             ; $13F464 |
  dw $0000, $8DA9, $8DAA, $0000             ; $13F46C |
  dw $0000, $8DB8, $8DB9, $0000             ; $13F474 |
  dw $0000, $8DC6, $8DC7, $0000             ; $13F47C |
  dw $8D9C, $8D9D, $8D9E, $8D9F             ; $13F484 |
  dw $8DAB, $8DAC, $8DAD, $8DAE             ; $13F48C |
  dw $8DBA, $8DBB, $8DBC, $8DBD             ; $13F494 |
  dw $8DC8, $8DC9, $8DCA, $8DCB             ; $13F49C |
  dw $8D9A, $8DA0, $8DA0, $8D9B             ; $13F4A4 |
  dw $8DA9, $8DAF, $8DAF, $8DAA             ; $13F4AC |
  dw $8DB8, $8DBE, $8DBE, $8DB9             ; $13F4B4 |
  dw $8DC6, $8DCC, $8DCC, $8DC7             ; $13F4BC |
  dw $8DA1, $8DA2, $8DA3, $8DA4             ; $13F4C4 |
  dw $8DB0, $8DB1, $8DB2, $8DB3             ; $13F4CC |
  dw $8DBF, $8DC0, $8DC1, $8DC2             ; $13F4D4 |
  dw $8DCD, $8DCE, $8DCF, $8DD0             ; $13F4DC |

  REP #$30                                  ; $13F4E4 |
  LDA $2C                                   ; $13F4E6 |
  AND #$0007                                ; $13F4E8 |
  ASL A                                     ; $13F4EB |
  ASL A                                     ; $13F4EC |
  ADC $28                                   ; $13F4ED |
  ASL A                                     ; $13F4EF |
  TAY                                       ; $13F4F0 |
  LDA $2C                                   ; $13F4F1 |
  CMP #$0008                                ; $13F4F3 |
  BCS CODE_13F4FF                           ; $13F4F6 |
  LDA $F464,y                               ; $13F4F8 |
  BEQ CODE_13F508                           ; $13F4FB |
  BRA CODE_13F502                           ; $13F4FD |

CODE_13F4FF:
  LDA $F4A4,y                               ; $13F4FF |

CODE_13F502:
  LDX $1D                                   ; $13F502 |
  STA $7F8000,x                             ; $13F504 |

CODE_13F508:
  SEP #$30                                  ; $13F508 |
  RTL                                       ; $13F50A |

  dw $8C00, $8C04, $8C08                    ; $13F50B |

  REP #$30                                  ; $13F511 |
  LDA $2C                                   ; $13F513 |
  CMP #$0002                                ; $13F515 |
  BCC CODE_13F51D                           ; $13F518 |
  LDA #$0002                                ; $13F51A |

CODE_13F51D:
  ASL A                                     ; $13F51D |
  TAY                                       ; $13F51E |
  STZ $00                                   ; $13F51F |
  LDX #$0003                                ; $13F521 |
  LDA $28                                   ; $13F524 |
  BEQ CODE_13F530                           ; $13F526 |
  INC A                                     ; $13F528 |
  CMP $2A                                   ; $13F529 |
  BNE CODE_13F537                           ; $13F52B |
  DEX                                       ; $13F52D |
  DEX                                       ; $13F52E |
  DEX                                       ; $13F52F |

CODE_13F530:
  TXA                                       ; $13F530 |
  CLC                                       ; $13F531 |
  ADC $F50B,y                               ; $13F532 |
  BRA CODE_13F53A                           ; $13F535 |

CODE_13F537:
  LDA #$0000                                ; $13F537 |

CODE_13F53A:
  LDX $1D                                   ; $13F53A |
  STA $7F8000,x                             ; $13F53C |
  LDA $2C                                   ; $13F540 |
  BNE CODE_13F553                           ; $13F542 |
  LDA $1B                                   ; $13F544 |
  STA $0E                                   ; $13F546 |
  JSL $128719                               ; $13F548 |
  LDA #$0000                                ; $13F54C |
  STA $7F8000,x                             ; $13F54F |

CODE_13F553:
  SEP #$30                                  ; $13F553 |
  RTL                                       ; $13F555 |

  dw $0000, $0000, $859A, $859B             ; $13F556 |
  dw $79DA, $79DB, $0000, $0000             ; $13F55E |
  dw $859F, $85A0, $79DD, $79DE             ; $13F566 |
  dw $0000, $0000, $859A, $859C             ; $13F56E |
  dw $79DD, $79DE, $0000, $0000             ; $13F576 |
  dw $859F, $85A1, $79DD, $79DF             ; $13F57E |
  dw $0000, $0000, $859A, $859B             ; $13F586 |
  dw $79DC, $79DB, $0000, $0000             ; $13F58E |
  dw $85A2, $85A0, $79DD, $79DC             ; $13F596 |
  dw $0000, $85C5, $85A2, $859D             ; $13F59E |
  dw $79DA, $79AC, $85C8, $0000             ; $13F5A6 |
  dw $85A3, $85A4, $79AD, $79AF             ; $13F5AE |
  dw $85C6, $85C7, $859E, $859D             ; $13F5B6 |
  dw $79DC, $79DB, $85C8, $85C5             ; $13F5BE |
  dw $85A3, $85A4, $79DC, $79B6             ; $13F5C6 |

  dw $F5C2                                  ; $13F5CE |
  dw $F5B6                                  ; $13F5D0 |
  dw $F5AA                                  ; $13F5D2 |
  dw $F59E                                  ; $13F5D4 |
  dw $F592                                  ; $13F5D6 |
  dw $F586                                  ; $13F5D8 |
  dw $F57A                                  ; $13F5DA |
  dw $F56E                                  ; $13F5DC |
  dw $F562                                  ; $13F5DE |
  dw $F556                                  ; $13F5E0 |
  dw $F5B6                                  ; $13F5E2 |
  dw $F59E                                  ; $13F5E4 |
  dw $F586                                  ; $13F5E6 |
  dw $F56E                                  ; $13F5E8 |
  dw $F562                                  ; $13F5EA |
  dw $F556                                  ; $13F5EC |

  REP #$30                                  ; $13F5EE |
  LDA $2C                                   ; $13F5F0 |
  CMP #$0003                                ; $13F5F2 |
  BCC CODE_13F602                           ; $13F5F5 |
  DEC A                                     ; $13F5F7 |
  DEC A                                     ; $13F5F8 |
  DEC A                                     ; $13F5F9 |
  ASL A                                     ; $13F5FA |
  STA $00                                   ; $13F5FB |
  JSR CODE_13F654                           ; $13F5FD |
  BRA CODE_13F631                           ; $13F600 |

CODE_13F602:
  LDA $28                                   ; $13F602 |
  AND #$0001                                ; $13F604 |
  STA $00                                   ; $13F607 |
  BNE CODE_13F619                           ; $13F609 |
  LDA $2C                                   ; $13F60B |
  BNE CODE_13F619                           ; $13F60D |
  JSL $128875                               ; $13F60F |
  AND #$000F                                ; $13F613 |
  ASL A                                     ; $13F616 |
  STA $A1                                   ; $13F617 |

CODE_13F619:
  LDA $2C                                   ; $13F619 |
  ASL A                                     ; $13F61B |
  ADC $00                                   ; $13F61C |
  ASL A                                     ; $13F61E |
  TAY                                       ; $13F61F |
  LDX $A1                                   ; $13F620 |
  LDA $F5CE,x                               ; $13F622 |
  STA $00                                   ; $13F625 |
  LDA ($00),y                               ; $13F627 |
  BEQ CODE_13F631                           ; $13F629 |
  LDX $1D                                   ; $13F62B |
  STA $7F8000,x                             ; $13F62D |

CODE_13F631:
  SEP #$30                                  ; $13F631 |
  RTL                                       ; $13F633 |

  dw $79BB, $79BC, $79BD, $79BE             ; $13F634 |
  dw $79BF, $79C0, $79C1, $79C2             ; $13F63C |
  dw $79C3, $79C4, $79E0, $79E0             ; $13F644 |
  dw $79E0, $79E0, $79E0, $79E0             ; $13F64C |

CODE_13F654:
  JSL $128875                               ; $13F654 |
  AND #$000F                                ; $13F658 |
  CLC                                       ; $13F65B |
  ADC $00                                   ; $13F65C |
  CMP #$0010                                ; $13F65E |
  BCC CODE_13F666                           ; $13F661 |
  LDA #$000F                                ; $13F663 |

CODE_13F666:
  ASL A                                     ; $13F666 |
  TAY                                       ; $13F667 |
  LDX $1D                                   ; $13F668 |
  LDA $F634,y                               ; $13F66A |
  STA $7F8000,x                             ; $13F66D |
  RTS                                       ; $13F671 |

  dw $0000, $0000, $85A8, $85A7             ; $13F672 |
  dw $0D0D, $0C0C, $79AD, $79AC             ; $13F67A |

  dw $0000, $0000, $85A8, $85A7             ; $13F682 |
  dw $0D0E, $0C0C, $79B6, $79AE             ; $13F68A |

  dw $0000, $0000, $85A8, $85A6             ; $13F692 |
  dw $0D0E, $0C0B, $79BD, $79AE             ; $13F69A |

  dw $85C2, $0000, $85A9, $85A6             ; $13F6A2 |
  dw $0D0E, $0C0C, $79AD, $79AF             ; $13F6AA |

  dw $85C3, $85C1, $85AA, $85A5             ; $13F6B2 |
  dw $0D0E, $0C0C, $79B1, $79B0             ; $13F6BA |

  dw $F672                                  ; $13F6C2 |
  dw $F682                                  ; $13F6C4 |
  dw $F692                                  ; $13F6C6 |
  dw $F6A2                                  ; $13F6C8 |
  dw $F6B2                                  ; $13F6CA |
  dw $F6B2                                  ; $13F6CC |
  dw $F6A2                                  ; $13F6CE |
  dw $F672                                  ; $13F6D0 |

  REP #$30                                  ; $13F6D2 |
  STZ $9B                                   ; $13F6D4 |
  LDA $2C                                   ; $13F6D6 |
  CMP #$0001                                ; $13F6D8 |
  BNE CODE_13F6E6                           ; $13F6DB |
  LDA $28                                   ; $13F6DD |
  BNE CODE_13F6F5                           ; $13F6DF |
  JSR CODE_13F813                           ; $13F6E1 |
  BRA CODE_13F6F5                           ; $13F6E4 |

CODE_13F6E6:
  CMP #$0002                                ; $13F6E6 |
  BNE CODE_13F6F5                           ; $13F6E9 |
  LDA $28                                   ; $13F6EB |
  DEC A                                     ; $13F6ED |
  CMP $2A                                   ; $13F6EE |
  BNE CODE_13F6F5                           ; $13F6F0 |
  JSR CODE_13F7FE                           ; $13F6F2 |

CODE_13F6F5:
  LDA $28                                   ; $13F6F5 |
  AND #$0001                                ; $13F6F7 |
  STA $00                                   ; $13F6FA |
  BEQ CODE_13F707                           ; $13F6FC |
  LDA $2C                                   ; $13F6FE |
  INC A                                     ; $13F700 |
  CMP $2E                                   ; $13F701 |
  BNE CODE_13F707                           ; $13F703 |
  INC $9B                                   ; $13F705 |

CODE_13F707:
  LDA $00                                   ; $13F707 |
  BNE CODE_13F735                           ; $13F709 |
  LDA $2C                                   ; $13F70B |
  BNE CODE_13F735                           ; $13F70D |
  JSL $128875                               ; $13F70F |
  AND #$0007                                ; $13F713 |
  ASL A                                     ; $13F716 |
  STA $A1                                   ; $13F717 |
  CMP #$0004                                ; $13F719 |
  BEQ CODE_13F723                           ; $13F71C |
  CMP #$0008                                ; $13F71E |
  BNE CODE_13F735                           ; $13F721 |

CODE_13F723:
  LDX $1D                                   ; $13F723 |
  LDA $7F8000,x                             ; $13F725 |
  CMP #$9000                                ; $13F729 |
  BCC CODE_13F735                           ; $13F72C |
  CMP #$9050                                ; $13F72E |
  BCS CODE_13F735                           ; $13F731 |
  STZ $A1                                   ; $13F733 |

CODE_13F735:
  LDX $A1                                   ; $13F735 |
  LDA $F6C2,x                               ; $13F737 |
  STA $02                                   ; $13F73A |
  JMP CODE_13F8F2                           ; $13F73C |

  dw $0000, $85B9, $0814, $79AA             ; $13F73F |

  dw $0000, $85BA, $0815, $79AA             ; $13F747 |

  dw $0000, $85B9, $0816, $79AB             ; $13F74F |

  dw $85C1, $85BB, $0816, $79AB             ; $13F757 |

  dw $85C2, $85BC, $0814, $79B6             ; $13F75F |

  dw $F73F                                  ; $13F767 |
  dw $F747                                  ; $13F769 |
  dw $F74F                                  ; $13F76B |
  dw $F757                                  ; $13F76D |
  dw $F75F                                  ; $13F76F |
  dw $F75F                                  ; $13F771 |
  dw $F757                                  ; $13F773 |
  dw $F73F                                  ; $13F775 |

  REP #$30                                  ; $13F777 |
  LDA $2C                                   ; $13F779 |
  CMP #$0002                                ; $13F77B |
  BNE CODE_13F78A                           ; $13F77E |
  LDA $28                                   ; $13F780 |
  DEC A                                     ; $13F782 |
  CMP $2A                                   ; $13F783 |
  BNE CODE_13F78A                           ; $13F785 |
  JSR CODE_13F7FE                           ; $13F787 |

CODE_13F78A:
  LDA #$0001                                ; $13F78A |
  STA $9B                                   ; $13F78D |
  LDA $2C                                   ; $13F78F |
  BNE CODE_13F79D                           ; $13F791 |
  JSL $128875                               ; $13F793 |
  AND #$0007                                ; $13F797 |
  ASL A                                     ; $13F79A |
  STA $A1                                   ; $13F79B |

CODE_13F79D:
  LDX $A1                                   ; $13F79D |
  LDA $F767,x                               ; $13F79F |
  STA $00                                   ; $13F7A2 |
  JMP CODE_13F9D3                           ; $13F7A4 |

  dw $85A7, $020A, $030D, $79B9             ; $13F7A7 |

  dw $85A7, $020A, $030D, $79AC             ; $13F7AF |

  dw $85A6, $020B, $030D, $79B9             ; $13F7B7 |

  dw $85A7, $020A, $030D, $79B6             ; $13F7BF |

  dw $85B3, $020A, $030D, $79B9             ; $13F7C7 |

  dw $F7C7                                  ; $13F7CF |
  dw $F7BF                                  ; $13F7D1 |
  dw $F7B7                                  ; $13F7D3 |
  dw $F7AF                                  ; $13F7D5 |
  dw $F7A7                                  ; $13F7D7 |
  dw $F7BF                                  ; $13F7D9 |
  dw $F7AF                                  ; $13F7DB |
  dw $F7A7                                  ; $13F7DD |

  REP #$30                                  ; $13F7DF |
  LDA #$0001                                ; $13F7E1 |
  STA $9B                                   ; $13F7E4 |
  LDA $2C                                   ; $13F7E6 |
  BNE CODE_13F7F4                           ; $13F7E8 |
  JSL $128875                               ; $13F7EA |
  AND #$0007                                ; $13F7EE |
  ASL A                                     ; $13F7F1 |
  STA $A1                                   ; $13F7F2 |

CODE_13F7F4:
  LDX $A1                                   ; $13F7F4 |
  LDA $F7CF,x                               ; $13F7F6 |
  STA $00                                   ; $13F7F9 |
  JMP CODE_13F9D3                           ; $13F7FB |

CODE_13F7FE:
  JSR CODE_13FD54                           ; $13F7FE |
  CMP #$79D8                                ; $13F801 |
  BEQ CODE_13F80B                           ; $13F804 |
  CMP #$79D9                                ; $13F806 |
  BNE CODE_13F812                           ; $13F809 |

CODE_13F80B:
  LDA #$79C9                                ; $13F80B |
  STA $7F8000,x                             ; $13F80E |

CODE_13F812:
  RTS                                       ; $13F812 |

CODE_13F813:
  JSR CODE_13FD61                           ; $13F813 |
  CMP #$79D6                                ; $13F816 |
  BEQ CODE_13F820                           ; $13F819 |
  CMP #$79D7                                ; $13F81B |
  BNE CODE_13F827                           ; $13F81E |

CODE_13F820:
  LDA #$79C8                                ; $13F820 |
  STA $7F8000,x                             ; $13F823 |

CODE_13F827:
  RTS                                       ; $13F827 |

  dw $0000, $0000, $85AD, $85B1             ; $13F828 |
  dw $0F11, $100E, $79B2, $79BE             ; $13F830 |

  dw $0000, $0000, $85AD, $85B1             ; $13F838 |
  dw $0F10, $100E, $79AF, $79B7             ; $13F840 |

  dw $0000, $0000, $85AD, $85B2             ; $13F848 |
  dw $0F10, $100F, $79B3, $79B4             ; $13F850 |

  dw $85C3, $0000, $85AE, $85B1             ; $13F858 |
  dw $0F10, $100E, $79C2, $79B6             ; $13F860 |

  dw $85C2, $85C3, $85AF, $85B0             ; $13F868 |
  dw $0F11, $100E, $79B2, $79BE             ; $13F870 |

  dw $F828                                  ; $13F878 |
  dw $F838                                  ; $13F87A |
  dw $F848                                  ; $13F87C |
  dw $F858                                  ; $13F87E |
  dw $F868                                  ; $13F880 |
  dw $F868                                  ; $13F882 |
  dw $F858                                  ; $13F884 |
  dw $F828                                  ; $13F886 |

  REP #$30                                  ; $13F888 |
  STZ $9B                                   ; $13F88A |
  LDA $2C                                   ; $13F88C |
  CMP #$0001                                ; $13F88E |
  BNE CODE_13F89C                           ; $13F891 |
  LDA $28                                   ; $13F893 |
  BNE CODE_13F8AB                           ; $13F895 |
  JSR CODE_13F7FE                           ; $13F897 |
  BRA CODE_13F8AB                           ; $13F89A |

CODE_13F89C:
  CMP #$0002                                ; $13F89C |
  BNE CODE_13F8AB                           ; $13F89F |
  LDA $28                                   ; $13F8A1 |
  INC A                                     ; $13F8A3 |
  CMP $2A                                   ; $13F8A4 |
  BNE CODE_13F8AB                           ; $13F8A6 |
  JSR CODE_13F813                           ; $13F8A8 |

CODE_13F8AB:
  LDA $28                                   ; $13F8AB |
  AND #$0001                                ; $13F8AD |
  STA $00                                   ; $13F8B0 |
  BEQ CODE_13F8BD                           ; $13F8B2 |
  LDA $2C                                   ; $13F8B4 |
  INC A                                     ; $13F8B6 |
  CMP $2E                                   ; $13F8B7 |
  BNE CODE_13F8BD                           ; $13F8B9 |
  INC $9B                                   ; $13F8BB |

CODE_13F8BD:
  LDA $00                                   ; $13F8BD |
  BNE CODE_13F8EB                           ; $13F8BF |
  LDA $2C                                   ; $13F8C1 |
  BNE CODE_13F8EB                           ; $13F8C3 |
  JSL $128875                               ; $13F8C5 |
  AND #$0007                                ; $13F8C9 |
  ASL A                                     ; $13F8CC |
  STA $A1                                   ; $13F8CD |
  CMP #$0004                                ; $13F8CF |
  BEQ CODE_13F8D9                           ; $13F8D2 |
  CMP #$0008                                ; $13F8D4 |
  BNE CODE_13F8EB                           ; $13F8D7 |

CODE_13F8D9:
  LDX $1D                                   ; $13F8D9 |
  LDA $7F8000,x                             ; $13F8DB |
  CMP #$9000                                ; $13F8DF |
  BCC CODE_13F8EB                           ; $13F8E2 |
  CMP #$9050                                ; $13F8E4 |
  BCS CODE_13F8EB                           ; $13F8E7 |
  STZ $A1                                   ; $13F8E9 |

CODE_13F8EB:
  LDX $A1                                   ; $13F8EB |
  LDA $F878,x                               ; $13F8ED |
  STA $02                                   ; $13F8F0 |

CODE_13F8F2:
  LDA $2C                                   ; $13F8F2 |
  CMP #$0004                                ; $13F8F4 |
  BCS CODE_13F90A                           ; $13F8F7 |
  ASL A                                     ; $13F8F9 |
  ADC $00                                   ; $13F8FA |
  ASL A                                     ; $13F8FC |
  TAY                                       ; $13F8FD |
  LDA ($02),y                               ; $13F8FE |
  BEQ CODE_13F914                           ; $13F900 |
  LDX $1D                                   ; $13F902 |
  STA $7F8000,x                             ; $13F904 |
  BRA CODE_13F914                           ; $13F908 |

CODE_13F90A:
  DEC A                                     ; $13F90A |
  DEC A                                     ; $13F90B |
  DEC A                                     ; $13F90C |
  DEC A                                     ; $13F90D |
  ASL A                                     ; $13F90E |
  STA $00                                   ; $13F90F |
  JSR CODE_13F654                           ; $13F911 |

CODE_13F914:
  SEP #$30                                  ; $13F914 |
  RTL                                       ; $13F916 |

  dw $0000, $85BD, $0A15, $79B7             ; $13F917 |

  dw $0000, $85BF, $0A16, $79B7             ; $13F91F |

  dw $0000, $85BD, $0A17, $79B8             ; $13F927 |

  dw $85C3, $85BE, $0A17, $79B8             ; $13F92F |

  dw $85C4, $85C0, $0A15, $79AF             ; $13F937 |

  dw $F917                                  ; $13F93F |
  dw $F91F                                  ; $13F941 |
  dw $F927                                  ; $13F943 |
  dw $F92F                                  ; $13F945 |
  dw $F937                                  ; $13F947 |
  dw $F937                                  ; $13F949 |
  dw $F92F                                  ; $13F94B |
  dw $F917                                  ; $13F94D |

  REP #$30                                  ; $13F94F |
  LDA $2C                                   ; $13F951 |
  CMP #$0002                                ; $13F953 |
  BNE CODE_13F962                           ; $13F956 |
  LDA $28                                   ; $13F958 |
  INC A                                     ; $13F95A |
  CMP $2A                                   ; $13F95B |
  BNE CODE_13F962                           ; $13F95D |
  JSR CODE_13F813                           ; $13F95F |

CODE_13F962:
  LDA #$0001                                ; $13F962 |
  STA $9B                                   ; $13F965 |
  LDA $2C                                   ; $13F967 |
  BNE CODE_13F975                           ; $13F969 |
  JSL $128875                               ; $13F96B |
  AND #$0007                                ; $13F96F |
  ASL A                                     ; $13F972 |
  STA $A1                                   ; $13F973 |

CODE_13F975:
  LDX $A1                                   ; $13F975 |
  LDA $F93F,x                               ; $13F977 |
  STA $00                                   ; $13F97A |
  JMP CODE_13F9D3                           ; $13F97C |

  dw $85B8, $050B, $060D, $79BA             ; $13F97F |

  dw $85B8, $050B, $060D, $79AC             ; $13F987 |

  dw $85B7, $050A, $060D, $79BA             ; $13F98F |

  dw $85B6, $050B, $060D, $79AF             ; $13F997 |

  dw $85B6, $050B, $060D, $79BA             ; $13F99F |

  dw $F99F                                  ; $13F9A7 |
  dw $F997                                  ; $13F9A9 |
  dw $F98F                                  ; $13F9AB |
  dw $F987                                  ; $13F9AD |
  dw $F97F                                  ; $13F9AF |
  dw $F997                                  ; $13F9B1 |
  dw $F987                                  ; $13F9B3 |
  dw $F97F                                  ; $13F9B5 |

  REP #$30                                  ; $13F9B7 |
  LDA #$0001                                ; $13F9B9 |
  STA $9B                                   ; $13F9BC |
  LDA $2C                                   ; $13F9BE |
  BNE CODE_13F9CC                           ; $13F9C0 |
  JSL $128875                               ; $13F9C2 |
  AND #$0007                                ; $13F9C6 |
  ASL A                                     ; $13F9C9 |
  STA $A1                                   ; $13F9CA |

CODE_13F9CC:
  LDX $A1                                   ; $13F9CC |
  LDA $F9A7,x                               ; $13F9CE |
  STA $00                                   ; $13F9D1 |

CODE_13F9D3:
  LDA $2C                                   ; $13F9D3 |
  CMP #$0004                                ; $13F9D5 |
  BCS CODE_13F9E8                           ; $13F9D8 |
  ASL A                                     ; $13F9DA |
  TAY                                       ; $13F9DB |
  LDA ($00),y                               ; $13F9DC |
  BEQ CODE_13F9F2                           ; $13F9DE |
  LDX $1D                                   ; $13F9E0 |
  STA $7F8000,x                             ; $13F9E2 |
  BRA CODE_13F9F2                           ; $13F9E6 |

CODE_13F9E8:
  DEC A                                     ; $13F9E8 |
  DEC A                                     ; $13F9E9 |
  DEC A                                     ; $13F9EA |
  DEC A                                     ; $13F9EB |
  ASL A                                     ; $13F9EC |
  STA $00                                   ; $13F9ED |
  JSR CODE_13F654                           ; $13F9EF |

CODE_13F9F2:
  SEP #$30                                  ; $13F9F2 |
  RTL                                       ; $13F9F4 |

  dw $FA1B                                  ; $13F9F5 |
  dw $FA8E                                  ; $13F9F7 |

  dw $79AD, $79AE, $79B5, $79DD             ; $13F9F9 |

  dw $0300, $0600, $0800, $0A00             ; $13FA01 |
  dw $0C00, $1000                           ; $13FA09 |

  REP #$30                                  ; $13FA0D |
  LDA $1B                                   ; $13FA0F |
  STA $0E                                   ; $13FA11 |
  LDX $15                                   ; $13FA13 |
  JSR ($F9F5,x)                             ; $13FA15 |
  SEP #$30                                  ; $13FA18 |
  RTL                                       ; $13FA1A |

  LDA $2C                                   ; $13FA1B |
  CMP #$0003                                ; $13FA1D |
  BCS CODE_13FA28                           ; $13FA20 |
  JSL $13F7DF                               ; $13FA22 |
  BRA CODE_13FA8D                           ; $13FA26 |

CODE_13FA28:
  LDA $2C                                   ; $13FA28 |
  AND #$0001                                ; $13FA2A |
  CLC                                       ; $13FA2D |
  ADC #$79D6                                ; $13FA2E |
  LDX $1D                                   ; $13FA31 |
  STA $7F8000,x                             ; $13FA33 |
  JSL $1287E2                               ; $13FA37 |
  LDA $7F8000,x                             ; $13FA3B |
  AND #$FF00                                ; $13FA3F |
  CMP #$7900                                ; $13FA42 |
  BNE CODE_13FA5A                           ; $13FA45 |
  STX $00                                   ; $13FA47 |
  JSL $128875                               ; $13FA49 |
  AND #$0006                                ; $13FA4D |
  TAY                                       ; $13FA50 |
  LDX $00                                   ; $13FA51 |
  LDA $F9F9,y                               ; $13FA53 |
  STA $7F8000,x                             ; $13FA56 |

CODE_13FA5A:
  LDA $2C                                   ; $13FA5A |
  INC A                                     ; $13FA5C |
  CMP $2E                                   ; $13FA5D |
  BNE CODE_13FA8D                           ; $13FA5F |
  JSR CODE_13FD54                           ; $13FA61 |
  LDY #$0000                                ; $13FA64 |
  AND #$FF00                                ; $13FA67 |

CODE_13FA6A:
  CMP $FA01,y                               ; $13FA6A |
  BEQ CODE_13FA84                           ; $13FA6D |
  INY                                       ; $13FA6F |
  INY                                       ; $13FA70 |
  CPY #$000C                                ; $13FA71 |
  BCC CODE_13FA6A                           ; $13FA74 |
  LDA $7F8000,x                             ; $13FA76 |
  CMP #$85A8                                ; $13FA7A |
  BCC CODE_13FA8D                           ; $13FA7D |
  CMP #$85B0                                ; $13FA7F |
  BCS CODE_13FA8D                           ; $13FA82 |

CODE_13FA84:
  LDX $1D                                   ; $13FA84 |
  LDA #$79C8                                ; $13FA86 |
  STA $7F8000,x                             ; $13FA89 |

CODE_13FA8D:
  RTS                                       ; $13FA8D |

  LDA $2C                                   ; $13FA8E |
  CMP #$0003                                ; $13FA90 |
  BCS CODE_13FA9B                           ; $13FA93 |
  JSL $13F9B7                               ; $13FA95 |
  BRA CODE_13FB00                           ; $13FA99 |

CODE_13FA9B:
  LDA $2C                                   ; $13FA9B |
  AND #$0001                                ; $13FA9D |
  CLC                                       ; $13FAA0 |
  ADC #$79D8                                ; $13FAA1 |
  LDX $1D                                   ; $13FAA4 |
  STA $7F8000,x                             ; $13FAA6 |
  JSL $1287A1                               ; $13FAAA |
  LDA $7F8000,x                             ; $13FAAE |
  AND #$FF00                                ; $13FAB2 |
  CMP #$7900                                ; $13FAB5 |
  BNE CODE_13FACD                           ; $13FAB8 |
  STX $00                                   ; $13FABA |
  JSL $128875                               ; $13FABC |
  AND #$0006                                ; $13FAC0 |
  TAY                                       ; $13FAC3 |
  LDX $00                                   ; $13FAC4 |
  LDA $F9F9,y                               ; $13FAC6 |
  STA $7F8000,x                             ; $13FAC9 |

CODE_13FACD:
  LDA $2C                                   ; $13FACD |
  INC A                                     ; $13FACF |
  CMP $2E                                   ; $13FAD0 |
  BNE CODE_13FB00                           ; $13FAD2 |
  JSR CODE_13FD61                           ; $13FAD4 |
  LDY #$0000                                ; $13FAD7 |
  AND #$FF00                                ; $13FADA |

CODE_13FADD:
  CMP $FA01,y                               ; $13FADD |
  BEQ CODE_13FAF7                           ; $13FAE0 |
  INY                                       ; $13FAE2 |
  INY                                       ; $13FAE3 |
  CPY #$000C                                ; $13FAE4 |
  BCC CODE_13FADD                           ; $13FAE7 |
  LDA $7F8000,x                             ; $13FAE9 |
  CMP #$85A8                                ; $13FAED |
  BCC CODE_13FB00                           ; $13FAF0 |
  CMP #$85B0                                ; $13FAF2 |
  BCS CODE_13FB00                           ; $13FAF5 |

CODE_13FAF7:
  LDX $1D                                   ; $13FAF7 |
  LDA #$79C9                                ; $13FAF9 |
  STA $7F8000,x                             ; $13FAFC |

CODE_13FB00:
  RTS                                       ; $13FB00 |

  dw $FB7A, $FB7F, $FB84                    ; $13FB01 |

  dw $0000, $0003, $0006                    ; $13FB07 |

  REP #$30                                  ; $13FB0D |
  LDA $2C                                   ; $13FB0F |
  EOR #$FFFF                                ; $13FB11 |
  INC A                                     ; $13FB14 |
  CMP #$0005                                ; $13FB15 |
  BCC CODE_13FB1D                           ; $13FB18 |
  LDA #$0004                                ; $13FB1A |

CODE_13FB1D:
  AND #$0006                                ; $13FB1D |
  TAY                                       ; $13FB20 |
  LDA $FB07,y                               ; $13FB21 |
  STA $00                                   ; $13FB24 |
  CMP #$0006                                ; $13FB26 |
  BCS CODE_13FB41                           ; $13FB29 |
  LDA $2C                                   ; $13FB2B |
  AND #$0001                                ; $13FB2D |
  BEQ CODE_13FB41                           ; $13FB30 |
  JSL $128875                               ; $13FB32 |
  AND #$0002                                ; $13FB36 |
  BEQ CODE_13FB41                           ; $13FB39 |
  INC $00                                   ; $13FB3B |
  INC $00                                   ; $13FB3D |
  INC $00                                   ; $13FB3F |

CODE_13FB41:
  LDA $2C                                   ; $13FB41 |
  EOR $28                                   ; $13FB43 |
  EOR $15                                   ; $13FB45 |
  AND #$0001                                ; $13FB47 |
  ASL A                                     ; $13FB4A |
  TAY                                       ; $13FB4B |
  LDX #$0000                                ; $13FB4C |
  LDA $28                                   ; $13FB4F |
  BEQ CODE_13FB5C                           ; $13FB51 |
  INX                                       ; $13FB53 |
  INX                                       ; $13FB54 |
  INC A                                     ; $13FB55 |
  CMP $2A                                   ; $13FB56 |
  BNE CODE_13FB5C                           ; $13FB58 |
  INX                                       ; $13FB5A |
  INX                                       ; $13FB5B |

CODE_13FB5C:
  JSR ($FB01,x)                             ; $13FB5C |
  LDY $2C                                   ; $13FB5F |
  BNE CODE_13FB6D                           ; $13FB61 |
  LDA $02                                   ; $13FB63 |
  SEC                                       ; $13FB65 |
  SBC #$79E8                                ; $13FB66 |
  CLC                                       ; $13FB69 |
  ADC #$3D09                                ; $13FB6A |

CODE_13FB6D:
  LDX $1D                                   ; $13FB6D |
  STA $7F8000,x                             ; $13FB6F |
  SEP #$30                                  ; $13FB73 |
  RTL                                       ; $13FB75 |

  dw $79E9, $79E8                           ; $13FB76 |

  LDA $FB76,y                               ; $13FB7A |
  BRA CODE_13FB96                           ; $13FB7D |
  LDA #$79E9                                ; $13FB7F |
  BRA CODE_13FB87                           ; $13FB82 |
  LDA #$79E8                                ; $13FB84 |

CODE_13FB87:
  TYX                                       ; $13FB87 |
  BEQ CODE_13FB96                           ; $13FB88 |
  JSR CODE_13FD54                           ; $13FB8A |
  SEC                                       ; $13FB8D |
  SBC #$79E9                                ; $13FB8E |
  STA $00                                   ; $13FB91 |
  LDA #$79EA                                ; $13FB93 |

CODE_13FB96:
  STA $02                                   ; $13FB96 |
  CLC                                       ; $13FB98 |
  ADC $00                                   ; $13FB99 |
  RTS                                       ; $13FB9B |

  dw $FC72, $FC81                           ; $13FB9C |

  REP #$30                                  ; $13FBA0 |
  LDA $2C                                   ; $13FBA2 |
  ASL A                                     ; $13FBA4 |
  TAY                                       ; $13FBA5 |
  CPY #$0006                                ; $13FBA6 |
  BCS CODE_13FBB0                           ; $13FBA9 |
  JSR CODE_13FC0F                           ; $13FBAB |
  BRA CODE_13FBDE                           ; $13FBAE |

CODE_13FBB0:
  LDA $2C                                   ; $13FBB0 |
  EOR $A1                                   ; $13FBB2 |
  AND #$0001                                ; $13FBB4 |
  CLC                                       ; $13FBB7 |
  ADC #$0108                                ; $13FBB8 |
  STA $04                                   ; $13FBBB |
  LDX #$0000                                ; $13FBBD |
  LDA $28                                   ; $13FBC0 |
  BEQ CODE_13FBCB                           ; $13FBC2 |
  INC A                                     ; $13FBC4 |
  CMP $2A                                   ; $13FBC5 |
  BNE CODE_13FBD0                           ; $13FBC7 |
  INX                                       ; $13FBC9 |
  INX                                       ; $13FBCA |

CODE_13FBCB:
  LDA $04                                   ; $13FBCB |
  JSR ($FB9C,x)                             ; $13FBCD |

CODE_13FBD0:
  LDA $15                                   ; $13FBD0 |
  BEQ CODE_13FBDE                           ; $13FBD2 |
  JSR CODE_13FCAC                           ; $13FBD4 |
  LDA $15                                   ; $13FBD7 |
  BMI CODE_13FBDE                           ; $13FBD9 |
  JSR CODE_13FD18                           ; $13FBDB |

CODE_13FBDE:
  LDA $2C                                   ; $13FBDE |
  INC A                                     ; $13FBE0 |
  CMP $2E                                   ; $13FBE1 |
  BNE CODE_13FBEC                           ; $13FBE3 |
  LDA $A1                                   ; $13FBE5 |
  EOR #$0001                                ; $13FBE7 |
  STA $A1                                   ; $13FBEA |

CODE_13FBEC:
  LDA $04                                   ; $13FBEC |
  LDX $1D                                   ; $13FBEE |
  STA $7F8000,x                             ; $13FBF0 |
  SEP #$30                                  ; $13FBF4 |
  RTL                                       ; $13FBF6 |

  dw $0028, $0100, $0103, $002D             ; $13FBF7 |
  dw $010A, $0105, $0028, $9C00             ; $13FBFF |
  dw $0103, $002D, $9C03, $0105             ; $13FC07 |

CODE_13FC0F:
  LDA $FBF7,y                               ; $13FC0F |
  CLC                                       ; $13FC12 |
  ADC $A1                                   ; $13FC13 |
  STA $04                                   ; $13FC15 |
  LDA $28                                   ; $13FC17 |
  BEQ CODE_13FC4D                           ; $13FC19 |
  INC A                                     ; $13FC1B |
  CMP $2A                                   ; $13FC1C |
  BNE CODE_13FC44                           ; $13FC1E |
  JSR CODE_13FD54                           ; $13FC20 |
  CMP #$0029                                ; $13FC23 |
  BEQ CODE_13FC60                           ; $13FC26 |
  CMP #$002D                                ; $13FC28 |
  BEQ CODE_13FC60                           ; $13FC2B |
  CMP #$0101                                ; $13FC2D |
  BEQ CODE_13FC60                           ; $13FC30 |
  CMP #$010A                                ; $13FC32 |
  BEQ CODE_13FC60                           ; $13FC35 |
  CMP #$0104                                ; $13FC37 |
  BEQ CODE_13FC60                           ; $13FC3A |
  CMP #$0105                                ; $13FC3C |
  BEQ CODE_13FC60                           ; $13FC3F |
  INC A                                     ; $13FC41 |
  BRA CODE_13FC6F                           ; $13FC42 |

CODE_13FC44:
  LDA $15                                   ; $13FC44 |
  CMP #$8000                                ; $13FC46 |
  BEQ CODE_13FC54                           ; $13FC49 |
  BRA CODE_13FC71                           ; $13FC4B |

CODE_13FC4D:
  LDA $15                                   ; $13FC4D |
  CMP #$8000                                ; $13FC4F |
  BNE CODE_13FC5C                           ; $13FC52 |

CODE_13FC54:
  LDA $FC03,y                               ; $13FC54 |
  CLC                                       ; $13FC57 |
  ADC $A1                                   ; $13FC58 |
  BRA CODE_13FC6F                           ; $13FC5A |

CODE_13FC5C:
  LDA $A1                                   ; $13FC5C |
  BEQ CODE_13FC71                           ; $13FC5E |

CODE_13FC60:
  LDA $15                                   ; $13FC60 |
  CMP #$8000                                ; $13FC62 |
  BNE CODE_13FC6C                           ; $13FC65 |
  LDA $FC09,y                               ; $13FC67 |
  BRA CODE_13FC6F                           ; $13FC6A |

CODE_13FC6C:
  LDA $FBFD,y                               ; $13FC6C |

CODE_13FC6F:
  STA $04                                   ; $13FC6F |

CODE_13FC71:
  RTS                                       ; $13FC71 |

  CMP #$0109                                ; $13FC72 |
  BNE CODE_13FC93                           ; $13FC75 |
  JSR CODE_13FD54                           ; $13FC77 |
  CMP #$0108                                ; $13FC7A |
  BEQ CODE_13FC93                           ; $13FC7D |
  BRA CODE_13FC8E                           ; $13FC7F |
  CMP #$0108                                ; $13FC81 |
  BNE CODE_13FC93                           ; $13FC84 |
  JSR CODE_13FD61                           ; $13FC86 |
  CMP #$0109                                ; $13FC89 |
  BEQ CODE_13FC93                           ; $13FC8C |

CODE_13FC8E:
  LDA #$0106                                ; $13FC8E |
  STA $04                                   ; $13FC91 |

CODE_13FC93:
  RTS                                       ; $13FC93 |

  dw $0108, $0108, $0108, $79E2             ; $13FC94 |
  dw $79E2, $79E5, $79E5, $79E7             ; $13FC9C |
  dw $0106, $79E1, $79E4, $79E7             ; $13FCA4 |

CODE_13FCAC:
  LDA $04                                   ; $13FCAC |
  CMP #$0106                                ; $13FCAE |
  BEQ CODE_13FCD2                           ; $13FCB1 |
  CMP #$0109                                ; $13FCB3 |
  BEQ CODE_13FCC2                           ; $13FCB6 |
  CMP #$79E3                                ; $13FCB8 |
  BEQ CODE_13FCC2                           ; $13FCBB |
  CMP #$79E6                                ; $13FCBD |
  BNE CODE_13FCF0                           ; $13FCC0 |

CODE_13FCC2:
  JSR CODE_13FD54                           ; $13FCC2 |
  CMP #$0000                                ; $13FCC5 |
  BEQ CODE_13FD0F                           ; $13FCC8 |
  CMP #$79E7                                ; $13FCCA |
  BEQ CODE_13FD0F                           ; $13FCCD |
  INC A                                     ; $13FCCF |
  BRA CODE_13FD0F                           ; $13FCD0 |

CODE_13FCD2:
  LDA $2C                                   ; $13FCD2 |
  DEC A                                     ; $13FCD4 |
  DEC A                                     ; $13FCD5 |
  DEC A                                     ; $13FCD6 |
  CMP #$0006                                ; $13FCD7 |
  BCC CODE_13FCE7                           ; $13FCDA |
  JSL $128875                               ; $13FCDC |
  AND #$0002                                ; $13FCE0 |
  CLC                                       ; $13FCE3 |
  ADC #$0004                                ; $13FCE4 |

CODE_13FCE7:
  AND #$0006                                ; $13FCE7 |
  TAY                                       ; $13FCEA |
  LDA $FCA4,y                               ; $13FCEB |
  BRA CODE_13FD0F                           ; $13FCEE |

CODE_13FCF0:
  JSL $128875                               ; $13FCF0 |
  AND #$0003                                ; $13FCF4 |
  CLC                                       ; $13FCF7 |
  ADC $2C                                   ; $13FCF8 |
  ASL A                                     ; $13FCFA |
  CMP #$0016                                ; $13FCFB |
  BCC CODE_13FD0B                           ; $13FCFE |
  JSL $128875                               ; $13FD00 |
  AND #$0002                                ; $13FD04 |
  CLC                                       ; $13FD07 |
  ADC #$0012                                ; $13FD08 |

CODE_13FD0B:
  TAY                                       ; $13FD0B |
  LDA $FC8E,y                               ; $13FD0C |

CODE_13FD0F:
  STA $04                                   ; $13FD0F |
  RTS                                       ; $13FD11 |

  dw $7792, $7793, $0000                    ; $13FD12 |

CODE_13FD18:
  LDX #$0000                                ; $13FD18 |
  LDA $04                                   ; $13FD1B |
  AND #$FF00                                ; $13FD1D |
  CMP #$7700                                ; $13FD20 |
  BEQ CODE_13FD53                           ; $13FD23 |
  LDA $04                                   ; $13FD25 |
  CMP #$0000                                ; $13FD27 |
  BEQ CODE_13FD53                           ; $13FD2A |
  CMP #$0106                                ; $13FD2C |
  BEQ CODE_13FD53                           ; $13FD2F |
  CMP #$0108                                ; $13FD31 |
  BEQ CODE_13FD44                           ; $13FD34 |
  INX                                       ; $13FD36 |
  INX                                       ; $13FD37 |
  CMP #$0109                                ; $13FD38 |
  BEQ CODE_13FD44                           ; $13FD3B |
  INX                                       ; $13FD3D |
  INX                                       ; $13FD3E |
  CMP #$79E7                                ; $13FD3F |
  BNE CODE_13FD49                           ; $13FD42 |

CODE_13FD44:
  LDA $FD12,x                               ; $13FD44 |
  BRA CODE_13FD51                           ; $13FD47 |

CODE_13FD49:
  SEC                                       ; $13FD49 |
  SBC #$79E1                                ; $13FD4A |
  CLC                                       ; $13FD4D |
  ADC #$778C                                ; $13FD4E |

CODE_13FD51:
  STA $04                                   ; $13FD51 |

CODE_13FD53:
  RTS                                       ; $13FD53 |

CODE_13FD54:
  LDA $1B                                   ; $13FD54 |
  STA $0E                                   ; $13FD56 |
  JSL $1287A1                               ; $13FD58 |
  LDA $7F8000,x                             ; $13FD5C |
  RTS                                       ; $13FD60 |

CODE_13FD61:
  LDA $1B                                   ; $13FD61 |
  STA $0E                                   ; $13FD63 |
  JSL $1287E2                               ; $13FD65 |
  LDA $7F8000,x                             ; $13FD69 |
  RTS                                       ; $13FD6D |

  REP #$30                                  ; $13FD6E |
  LDA $2C                                   ; $13FD70 |
  BNE CODE_13FD79                           ; $13FD72 |
  LDA #$8413                                ; $13FD74 |
  BRA CODE_13FD7C                           ; $13FD77 |

CODE_13FD79:
  LDA #$2910                                ; $13FD79 |

CODE_13FD7C:
  LDX $1D                                   ; $13FD7C |
  STA $7F8000,x                             ; $13FD7E |
  SEP #$30                                  ; $13FD82 |
  RTL                                       ; $13FD84 |

  REP #$30                                  ; $13FD85 |
  LDX $1D                                   ; $13FD87 |
  LDA $7F8000,x                             ; $13FD89 |
  BNE CODE_13FD96                           ; $13FD8D |
  LDA #$9D8B                                ; $13FD8F |
  STA $7F8000,x                             ; $13FD92 |

CODE_13FD96:
  SEP #$30                                  ; $13FD96 |
  RTL                                       ; $13FD98 |

; pointers to yoshi's path for each world's cinema sequence
  dw $0000, $0014, $0028, $0040             ; $13FD99 |
  dw $0054, $0098                           ; $13FDA1 |

; yoshi's path for the cinema sequence (world 1)
  db $00, $D6, $60, $00                     ; $13FDA5 |
  db $00, $BB, $54, $00                     ; $13FDA9 |
  db $00, $A2, $31, $00                     ; $13FDAD |
  db $00, $C1, $15, $00                     ; $13FDB1 |
  db $80, $A1, $21, $00                     ; $13FDB5 |

; yoshi's path for the cinema sequence (world 2)
  db $00, $9E, $21, $00                     ; $13FDB9 |
  db $00, $A9, $DF, $00                     ; $13FDBD |
  db $00, $BD, $AF, $00                     ; $13FDC1 |
  db $00, $D7, $CE, $00                     ; $13FDC5 |
  db $80, $C8, $BB, $00                     ; $13FDC9 |

; yoshi's path for the cinema sequence (world 3)
  db $00, $DB, $B4, $00                     ; $13FDCD |
  db $00, $E9, $A6, $00                     ; $13FDD1 |
  db $00, $0F, $A4, $00                     ; $13FDD5 |
  db $00, $20, $B9, $00                     ; $13FDD9 |
  db $00, $18, $EF, $00                     ; $13FDDD |
  db $80, $20, $B9, $00                     ; $13FDE1 |

; yoshi's path for the cinema sequence (world 4)
  db $00, $61, $00, $00                     ; $13FDE5 |
  db $00, $61, $1C, $00                     ; $13FDE9 |
  db $00, $41, $38, $00                     ; $13FDED |
  db $00, $24, $30, $00                     ; $13FDF1 |
  db $80, $34, $40, $00                     ; $13FDF5 |

; yoshi's path for the cinema sequence (world 5)
  db $00, $21, $65, $00                     ; $13FDF9 |
  db $00, $E8, $5B, $00                     ; $13FDFD |
  db $00, $E6, $1C, $00                     ; $13FE01 |
  db $00, $C9, $19, $10                     ; $13FE05 |
  db $00, $C4, $0A, $20                     ; $13FE09 |
  db $00, $D6, $02, $30                     ; $13FE0D |
  db $00, $D7, $14, $33                     ; $13FE11 |
  db $00, $D0, $0C, $34                     ; $13FE15 |
  db $00, $D2, $FF, $37                     ; $13FE19 |
  db $00, $D3, $F1, $3B                     ; $13FE1D |
  db $00, $D6, $E3, $43                     ; $13FE21 |
  db $00, $E0, $E9, $45                     ; $13FE25 |
  db $00, $EA, $EF, $4C                     ; $13FE29 |
  db $00, $F7, $F5, $53                     ; $13FE2D |
  db $00, $F7, $01, $55                     ; $13FE31 |
  db $00, $F8, $0F, $5B                     ; $13FE35 |
  db $80, $FB, $2A, $5C                     ; $13FE39 |

; yoshi's path for the cinema sequence (world 6)
  db $00, $E0, $D6, $00                     ; $13FE3D |
  db $00, $FA, $A7, $00                     ; $13FE41 |
  db $00, $2B, $C0, $00                     ; $13FE45 |
  db $00, $50, $F3, $00                     ; $13FE49 |
  db $00, $53, $2C, $00                     ; $13FE4D |
  db $00, $21, $26, $00                     ; $13FE51 |
  db $80, $04, $15, $00                     ; $13FE55 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE59 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE61 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE69 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE71 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE79 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE81 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE89 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE91 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FE99 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEA1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEA9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEB1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEB9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEC1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEC9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FED1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FED9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEE1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEE9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEF1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FEF9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF01 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF09 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF11 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF19 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF21 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF29 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF31 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF39 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF41 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF49 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF51 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF59 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF61 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF69 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF71 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF79 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF81 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF89 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF91 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FF99 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFA1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFA9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFB1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFB9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFC1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFC9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFD1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFD9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFE1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFE9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $13FFF1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF      ; $13FFF9 |
