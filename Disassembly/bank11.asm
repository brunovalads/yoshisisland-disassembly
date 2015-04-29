org $118000

    SEP #$30            ; $118000   |
    JSL $119D5A         ; $118002   |
    JSL $008277         ; $118006   |
    JSL $01AF6E         ; $11800A   |
    JSL $0394B8         ; $11800E   |
    JSL $008259         ; $118012   |
    REP #$20            ; $118016   |
    LDX #$1C            ; $118018   |

CODE_11801A:
    STZ $0134,x         ; $11801A   |
    DEX                 ; $11801D   |
    DEX                 ; $11801E   |
    BPL CODE_11801A     ; $11801F   |
    STZ $0398           ; $118021   |
    SEP #$20            ; $118024   |
    LDA $03A7           ; $118026   |
    LSR A               ; $118029   |
    TAY                 ; $11802A   |
    JSL $00B49E         ; $11802B   |
    LDX #$2A            ; $11802F   |
    JSL $00BDA2         ; $118031   |
    JSL $01D5B3         ; $118035   |
    REP #$30            ; $118039   |
    LDA #$0020          ; $11803B   |
    STA $6126           ; $11803E   |
    LDA #$4000          ; $118041   |
    STA $60A4           ; $118044   |
    STA $60A6           ; $118047   |
    LDY #$005C          ; $11804A   |
    LDA #$0000          ; $11804D   |

CODE_118050:
    STA $7360,y         ; $118050   |
    DEY                 ; $118053   |
    DEY                 ; $118054   |
    DEY                 ; $118055   |
    DEY                 ; $118056   |
    BPL CODE_118050     ; $118057   |
    LDY $03A7           ; $118059   |
    JSL $00BB70         ; $11805C   | load palette
    LDA #$09            ; $118060   |
    STA $0127           ; $118062   |
    JSL $00E37B         ; $118065   |
    LDA #$02            ; $118069   |
    STA $004D           ; $11806B   |
    STZ $0205           ; $11806E   |
    LDX $03A7           ; $118071   |
    JSR ($80CD,x)       ; $118074   |

    REP #$20            ; $118077   |
    LDA #$8000          ; $118079   |
    STA $61B2           ; $11807C   |
    STZ $7DF6           ; $11807F   |
    INC $7FEE           ; $118082   |
    LDX #$08            ; $118085   |
    LDA #$B1EF          ; $118087   |
    JSL $7EDE44         ; $11808A   | GSU init
    LDA $03A7           ; $11808E   |
    LSR A               ; $118091   |
    CLC                 ; $118092   |
    ADC #$0120          ; $118093   |
    STA $704070         ; $118096   |
    SEP #$20            ; $11809A   |
    STZ $038C           ; $11809C   |
    LDA #$2F            ; $11809F   |
    STA $0118           ; $1180A1   |
    INC $0D0F           ; $1180A4   |
    LDA $095E           ; $1180A7   |
    ORA #$40            ; $1180AA   |
    STA $095E           ; $1180AC   |
    LDA #$04            ; $1180AF   |
    STA $0148           ; $1180B1   |
    STZ $0121           ; $1180B4   |
    LDA #$04            ; $1180B7   |
    STA $0125           ; $1180B9   |
    LDA #$50            ; $1180BC   |
    STA $4207           ; $1180BE   |
    LDA #$D8            ; $1180C1   |
    STA $4209           ; $1180C3   |
    LDA #$B1            ; $1180C6   |
    STA $4200           ; $1180C8   |
    PLB                 ; $1180CB   |
    RTL                 ; $1180CC   |

DATA_1180CD:         dw $80E8
DATA_1180CF:         dw $80EE
DATA_1180D1:         dw $80F4
DATA_1180D3:         dw $B6DC
DATA_1180D5:         dw $AD79
DATA_1180D7:         dw $9D91
DATA_1180D9:         dw $9D98
DATA_1180DB:         dw $B764
DATA_1180DD:         dw $80E5
DATA_1180DF:         dw $B76E
DATA_1180E1:         dw $C506
DATA_1180E3:         dw $80FA

    SEP #$30            ; $1180E5   |
    RTS                 ; $1180E7   |

    LDY #$03            ; $1180E8   |
    LDX #$00            ; $1180EA   |
    BRA CODE_11810A     ; $1180EC   |

    LDY #$04            ; $1180EE   |
    LDX #$00            ; $1180F0   |
    BRA CODE_11810A     ; $1180F2   |

    LDY #$05            ; $1180F4   |
    LDX #$00            ; $1180F6   |
    BRA CODE_11810A     ; $1180F8   |

    LDY #$03            ; $1180FA   |
    LDX #$01            ; $1180FC   |
    BRA CODE_11810A     ; $1180FE   |

    LDY #$04            ; $118100   |

    LDX #$01            ; $118102   |
    BRA CODE_11810A     ; $118104   |

    LDY #$05            ; $118106   |
    LDX #$01            ; $118108   |

CODE_11810A:
    STY $1170           ; $11810A   |
    STX $10F2           ; $11810D   |
    LDA $095F           ; $118110   |
    EOR #$03            ; $118113   |
    STA $095F           ; $118115   |
    STA $2107           ; $118118   |
    LDA $0960           ; $11811B   |
    EOR #$03            ; $11811E   |
    STA $0960           ; $118120   |
    STA $2108           ; $118123   |
    REP #$20            ; $118126   |
    STZ $39             ; $118128   |
    STZ $3B             ; $11812A   |
    STZ $3D             ; $11812C   |
    LDA #$0017          ; $11812E   |
    STA $3F             ; $118131   |
    STZ $41             ; $118133   |
    STZ $43             ; $118135   |
    LDA #$0030          ; $118137   |
    STA $70E2           ; $11813A   |
    STA $608C           ; $11813D   |
    LDA #$00B0          ; $118140   |
    STA $7182           ; $118143   |
    LDA #$00E0          ; $118146   |
    STA $70E4           ; $118149   |
    LDA #$00D8          ; $11814C   |
    STA $7184           ; $11814F   |
    LDA #$0061          ; $118152   |
    STA $70E6           ; $118155   |
    LDA #$0035          ; $118158   |
    STA $7186           ; $11815B   |
    LDA #$00C0          ; $11815E   |
    STA $10FE           ; $118161   |
    LDA #$00C0          ; $118164   |
    STA $1100           ; $118167   |
    STA $1164           ; $11816A   |
    STZ $1102           ; $11816D   |
    STZ $7978           ; $118170   |
    LDA #$0001          ; $118173   |
    STA $797C           ; $118176   |
    STZ $1108           ; $118179   |
    STZ $1128           ; $11817C   |
    STZ $1138           ; $11817F   |
    JSL $008408         ; $118182   |
    LDA $7970           ; $118186   |
    LSR A               ; $118189   |
    BCC CODE_118191     ; $11818A   |
    LDA #$FFF0          ; $11818C   |
    BRA CODE_118194     ; $11818F   |

CODE_118191:
    LDA #$0010          ; $118191   |

CODE_118194:
    STA $7224           ; $118194   |
    STZ $797A           ; $118197   |
    LDA #$0001          ; $11819A   |
    STA $10F6           ; $11819D   |
    LDA #$301F          ; $1181A0   |
    STA $70218A         ; $1181A3   |
    SEP #$20            ; $1181A7   |
    LDA #$B4            ; $1181A9   |
    STA $118C           ; $1181AB   |
    STZ $4204           ; $1181AE   |
    STA $4205           ; $1181B1   |
    LDA #$48            ; $1181B4   |
    STA $4206           ; $1181B6   |
    NOP                 ; $1181B9   |
    NOP                 ; $1181BA   |
    NOP                 ; $1181BB   |
    NOP                 ; $1181BC   |
    NOP                 ; $1181BD   |
    NOP                 ; $1181BE   |
    NOP                 ; $1181BF   |
    NOP                 ; $1181C0   |
    LDA $4214           ; $1181C1   |
    STA $118E           ; $1181C4   |
    LDA $4215           ; $1181C7   |
    STA $118F           ; $1181CA   |
    LDA #$09            ; $1181CD   |
    STA $095E           ; $1181CF   |
    STZ $096C           ; $1181D2   |
    JSR CODE_119134     ; $1181D5   |
    RTS                 ; $1181D8   |

    LDA $0D0F           ; $1181D9   |
    BEQ CODE_1181EA     ; $1181DC   |
    JSL $01DE5A         ; $1181DE   |
    LDA $0D0F           ; $1181E2   |
    BNE CODE_1181EA     ; $1181E5   |
    JSR CODE_118216     ; $1181E7   |

CODE_1181EA:
    LDX $03A7           ; $1181EA   |
    JSR ($81F2,x)       ; $1181ED   |

    PLB                 ; $1181F0   |
    RTL                 ; $1181F1   |

DATA_1181F2:         dw $825E
DATA_1181F4:         dw $825E
DATA_1181F6:         dw $825E
DATA_1181F8:         dw $B6DD
DATA_1181FA:         dw $AE1A
DATA_1181FC:         dw $9E88
DATA_1181FE:         dw $9E88
DATA_118200:         dw $B765
DATA_118202:         dw $80E5
DATA_118204:         dw $B85C
DATA_118206:         dw $C5FA
DATA_118208:         dw $825E

DATA_11820A:         db $A2, $A2, $A2, $A3
DATA_11820E:         db $A3, $A4, $A4, $A6
DATA_118212:         db $A7, $A5, $A5, $A2

CODE_118216:
    LDA $03A7           ; $118216   |
    LSR A               ; $118219   |
    REP #$30            ; $11821A   |
    AND #$00FF          ; $11821C   |
    TAY                 ; $11821F   |
    LDA $820A,y         ; $118220   |
    AND #$00FF          ; $118223   |
    JSL $00B753         ; $118226   |
    LDX #$0070          ; $11822A   |
    STX $01             ; $11822D   |
    LDX #$6800          ; $11822F   |
    LDY #$3400          ; $118232   |
    JSL $00BEA6         ; $118235   |
    LDX #$0000          ; $118239   |

CODE_11823C:
    LDA $5FE3CC,x       ; $11823C   |
    STA $702002,x       ; $118240   |
    INX                 ; $118244   |
    INX                 ; $118245   |
    CPX #$001E          ; $118246   |
    BCC CODE_11823C     ; $118249   |
    SEP #$30            ; $11824B   |
    LDA $094A           ; $11824D   |
    EOR #$20            ; $118250   |
    STA $094A           ; $118252   |
    LDA $095E           ; $118255   |
    EOR #$40            ; $118258   |
    STA $095E           ; $11825A   |
    RTS                 ; $11825D   |

    REP #$20            ; $11825E   |
    LDY $1194           ; $118260   |
    LDA $093C,y         ; $118263   |
    STA $0035           ; $118266   |
    LDA $093E,y         ; $118269   |
    STA $0037           ; $11826C   |
    JSL $008259         ; $11826F   |
    JSL $0394CF         ; $118273   |
    JSR CODE_118D8D     ; $118277   |
    JSR CODE_1187FD     ; $11827A   |
    LDA $0D0F           ; $11827D   |
    BNE CODE_118293     ; $118280   |
    LDA $094A           ; $118282   |
    BIT #$08            ; $118285   |
    BNE CODE_118290     ; $118287   |
    JSR CODE_11942C     ; $118289   |
    JSL $119C27         ; $11828C   |

CODE_118290:
    JSR CODE_1182BB     ; $118290   |

CODE_118293:
    JSR CODE_118D73     ; $118293   |
    REP #$20            ; $118296   |
    LDA $7E4000         ; $118298   |
    CMP #$0020          ; $11829C   |
    BCS CODE_1182A4     ; $11829F   |
    JSR CODE_11912F     ; $1182A1   |

CODE_1182A4:
    LDA $10F8           ; $1182A4   |
    BEQ CODE_1182AD     ; $1182A7   |
    JSL $0397D3         ; $1182A9   |

CODE_1182AD:
    REP #$20            ; $1182AD   |
    LDX #$08            ; $1182AF   |
    LDA #$B1EF          ; $1182B1   |
    JSL $7EDE44         ; $1182B4   | GSU init
    SEP #$20            ; $1182B8   |
    RTS                 ; $1182BA   |

CODE_1182BB:
    LDA $797C           ; $1182BB   |
    ASL A               ; $1182BE   |
    TAY                 ; $1182BF   |
    LDA $82CD,y         ; $1182C0   |
    STA $00             ; $1182C3   |
    LDA $82CE,y         ; $1182C5   |
    STA $01             ; $1182C8   |
    JMP ($0000)         ; $1182CA   |

DATA_1182CD:         dw $82D3
DATA_1182CF:         dw $8443
DATA_1182D1:         dw $84EC

    REP #$30            ; $1182D3   |
    LDA $30             ; $1182D5   |
    AND #$0003          ; $1182D7   |
    BEQ CODE_1182DF     ; $1182DA   |
    JMP CODE_11836D     ; $1182DC   |

CODE_1182DF:
    LDA $1164           ; $1182DF   |
    AND #$01F0          ; $1182E2   |
    ASL A               ; $1182E5   |
    ASL A               ; $1182E6   |
    ASL A               ; $1182E7   |
    ASL A               ; $1182E8   |
    ASL A               ; $1182E9   |
    ASL A               ; $1182EA   |
    ORA #$001F          ; $1182EB   |
    STA $70218A         ; $1182EE   |
    LDA $1164           ; $1182F2   |
    INC A               ; $1182F5   |
    STA $1164           ; $1182F6   |
    CMP #$01FF          ; $1182F9   |
    BCC CODE_11836D     ; $1182FC   |
    LDA #$0002          ; $1182FE   |
    STA $797C           ; $118301   |
    LDA $7978           ; $118304   |
    BNE CODE_11833C     ; $118307   |
    LDA #$0003          ; $118309   |
    STA $797A           ; $11830C   |
    LDA #$0004          ; $11830F   |
    STA $7978           ; $118312   |
    LDA #$00C0          ; $118315   |
    STA $79D8           ; $118318   |
    STZ $79D6           ; $11831B   |
    LDA #$009D          ; $11831E   |
    STA $00             ; $118321   |
    SEP #$20            ; $118323   |
    LDA #$FE            ; $118325   |
    STA $1107           ; $118327   |
    LDA #$08            ; $11832A   |
    STA $7222           ; $11832C   |
    STZ $1106           ; $11832F   |
    STZ $1126           ; $118332   |
    STZ $1136           ; $118335   |
    REP #$20            ; $118338   |
    BRA CODE_11834D     ; $11833A   |

CODE_11833C:
    LDA #$0004          ; $11833C   |
    STA $797A           ; $11833F   |
    LDA #$0003          ; $118342   |
    STA $7978           ; $118345   |
    LDA #$009E          ; $118348   |
    STA $00             ; $11834B   |

CODE_11834D:
    REP #$30            ; $11834D   |
    LDA #$01FF          ; $11834F   |
    STA $1164           ; $118352   |
    LDA $1154           ; $118355   |
    LDA $1156           ; $118358   |
    LDA $1144           ; $11835B   |
    LDA $1146           ; $11835E   |
    STZ $114A           ; $118361   |
    STZ $115A           ; $118364   |
    STZ $116A           ; $118367   |
    STZ $1168           ; $11836A   |

CODE_11836D:
    LDA $1168           ; $11836D   |
    BEQ CODE_11839D     ; $118370   |
    DEC $1168           ; $118372   |
    LDA $1100           ; $118375   |
    SEC                 ; $118378   |
    SBC #$0003          ; $118379   |
    STA $1100           ; $11837C   |
    LDA $10FE           ; $11837F   |
    CLC                 ; $118382   |
    ADC #$0003          ; $118383   |
    CMP #$01FF          ; $118386   |
    BCC CODE_11838E     ; $118389   |
    LDA #$01FF          ; $11838B   |

CODE_11838E:
    STA $10FE           ; $11838E   |
    LDA $30             ; $118391   |
    AND #$0003          ; $118393   |
    BNE CODE_1183D0     ; $118396   |
    INC $7186           ; $118398   |
    BRA CODE_1183D0     ; $11839B   |

CODE_11839D:
    LDA $1100           ; $11839D   |
    CLC                 ; $1183A0   |
    ADC #$0003          ; $1183A1   |
    CMP $1164           ; $1183A4   |
    BCC CODE_1183AC     ; $1183A7   |
    LDA $1164           ; $1183A9   |

CODE_1183AC:
    STA $1100           ; $1183AC   |
    LDA $10FE           ; $1183AF   |
    SEC                 ; $1183B2   |
    SBC #$0003          ; $1183B3   |
    CMP $1164           ; $1183B6   |
    BCS CODE_1183BE     ; $1183B9   |
    LDA $1164           ; $1183BB   |

CODE_1183BE:
    STA $10FE           ; $1183BE   |
    LDA $7186           ; $1183C1   |
    DEC A               ; $1183C4   |
    CMP #$0090          ; $1183C5   |
    BCS CODE_1183CD     ; $1183C8   |
    LDA #$0090          ; $1183CA   |

CODE_1183CD:
    STA $7186           ; $1183CD   |

CODE_1183D0:
    JSR CODE_1183D6     ; $1183D0   |
    SEP #$30            ; $1183D3   |
    RTS                 ; $1183D5   |

CODE_1183D6:
    REP #$30            ; $1183D6   |
    LDY $6092           ; $1183D8   |
    LDX #$0000          ; $1183DB   |
    STZ $02             ; $1183DE   |

CODE_1183E0:
    STZ $00             ; $1183E0   |

CODE_1183E2:
    LDA $70E6           ; $1183E2   |
    CLC                 ; $1183E5   |
    ADC $00             ; $1183E6   |
    STA $6000,y         ; $1183E8   |
    LDA $7186           ; $1183EB   |
    CLC                 ; $1183EE   |
    ADC $02             ; $1183EF   |
    STA $6002,y         ; $1183F1   |
    LDA $8433,x         ; $1183F4   |
    AND #$00FF          ; $1183F7   |
    ORA #$2900          ; $1183FA   |
    STA $6004,y         ; $1183FD   |
    LDA #$0002          ; $118400   |
    STA $6006,y         ; $118403   |
    TYA                 ; $118406   |
    CLC                 ; $118407   |
    ADC #$0008          ; $118408   |
    TAY                 ; $11840B   |
    INX                 ; $11840C   |
    INC $04             ; $11840D   |
    INC $04             ; $11840F   |
    LDA $00             ; $118411   |
    CLC                 ; $118413   |
    ADC #$0010          ; $118414   |
    STA $00             ; $118417   |
    CMP #$0040          ; $118419   |
    BCC CODE_1183E2     ; $11841C   |
    STZ $00             ; $11841E   |
    LDA $02             ; $118420   |
    CLC                 ; $118422   |
    ADC #$0010          ; $118423   |
    STA $02             ; $118426   |
    CMP #$0040          ; $118428   |
    BCC CODE_1183E0     ; $11842B   |
    STY $6092           ; $11842D   |
    SEP #$30            ; $118430   |
    RTS                 ; $118432   |

DATA_118433:         db $C0, $C2, $C4, $C6, $E0, $E2, $E4, $E6
DATA_11843B:         db $C8, $CA, $CC, $CE, $E8, $EA, $EC, $EE

    LDY #$00            ; $118443   |
    LDX #$04            ; $118445   |
    LDA $7978           ; $118447   |
    CMP #$02            ; $11844A   |
    BEQ CODE_118457     ; $11844C   |
    LDA $797A           ; $11844E   |
    CMP #$02            ; $118451   |
    BNE CODE_11845E     ; $118453   |
    LDY #$02            ; $118455   |

CODE_118457:
    LDA $1105,y         ; $118457   |
    CMP #$FD            ; $11845A   |
    BEQ CODE_11846E     ; $11845C   |

CODE_11845E:
    LDA #$0D            ; $11845E   |
    STA $00             ; $118460   |
    LDA #$03            ; $118462   |
    STA $02             ; $118464   |
    LDA #$00            ; $118466   |
    JSR CODE_119073     ; $118468   |
    JSR CODE_1190EB     ; $11846B   |

CODE_11846E:
    JSR CODE_118FDE     ; $11846E   |
    LDA $70E2,x         ; $118471   |
    CMP #$26            ; $118474   |
    BCS CODE_1184A9     ; $118476   |
    LDA #$26            ; $118478   |
    STA $70E2,x         ; $11847A   |
    LDA #$90            ; $11847D   |
    STA $7182,x         ; $11847F   |
    STZ $7978,x         ; $118482   |
    LDA #$01            ; $118485   |
    STA $7978           ; $118487   |
    STZ $1154           ; $11848A   |
    STZ $1144           ; $11848D   |
    STZ $116E           ; $118490   |
    LDA #$08            ; $118493   |
    STA $1168           ; $118495   |
    LDA #$13            ; $118498   |\ play sound #$0013
    JSL $0085D2         ; $11849A   |/
    STZ $1194           ; $11849E   |
    JSR CODE_1195A7     ; $1184A1   |
    JSR CODE_1195E8     ; $1184A4   |
    BRA CODE_1184E8     ; $1184A7   |

CODE_1184A9:
    CMP #$9D            ; $1184A9   |
    BCC CODE_1184E8     ; $1184AB   |
    LDA #$9C            ; $1184AD   |
    STA $70E2,x         ; $1184AF   |
    LDA #$90            ; $1184B2   |
    STA $7182,x         ; $1184B4   |
    STZ $7978,x         ; $1184B7   |
    LDA #$01            ; $1184BA   |
    STA $797A           ; $1184BC   |
    STZ $1156           ; $1184BF   |
    STZ $1146           ; $1184C2   |
    STZ $116E           ; $1184C5   |
    LDA #$08            ; $1184C8   |
    STA $1168           ; $1184CA   |
    LDA #$13            ; $1184CD   |\ play sound #$0013
    JSL $0085D2         ; $1184CF   |/
    LDA $10F2           ; $1184D3   |
    BEQ CODE_1184E5     ; $1184D6   |
    LDA #$04            ; $1184D8   |
    STA $1194           ; $1184DA   |
    JSR CODE_1195A7     ; $1184DD   |
    JSR CODE_1195E8     ; $1184E0   |
    BRA CODE_1184E8     ; $1184E3   |

CODE_1184E5:
    JSR CODE_118C58     ; $1184E5   |

CODE_1184E8:
    JSR CODE_1183D6     ; $1184E8   |
    RTS                 ; $1184EB   |

    LDA $116A           ; $1184EC   |
    ASL A               ; $1184EF   |
    TAY                 ; $1184F0   |
    LDA $84FE,y         ; $1184F1   |
    STA $00             ; $1184F4   |
    LDA $84FF,y         ; $1184F6   |
    STA $01             ; $1184F9   |
    JMP ($0000)         ; $1184FB   |

DATA_1184FE:         dw $850E
DATA_118500:         dw $8532
DATA_118502:         dw $8557
DATA_118504:         dw $85A8
DATA_118506:         dw $85CC
DATA_118508:         dw $85F0
DATA_11850A:         dw $8614
DATA_11850C:         dw $867E

    REP #$30            ; $11850E   |
    LDA #$0004          ; $118510   |
    STA $00             ; $118513   |
    LDA #$0002          ; $118515   |
    STA $0A             ; $118518   |
    LDA #$006A          ; $11851A   |
    STA $0C             ; $11851D   |
    LDX #$0000          ; $11851F   |
    JSR CODE_118682     ; $118522   |
    JSR CODE_1183D6     ; $118525   |
    INC $116A           ; $118528   |
    LDA #$86            ; $11852B   |\ play sound #$0086
    JSL $0085D2         ; $11852D   |/
    RTS                 ; $118531   |

    REP #$30            ; $118532   |
    LDA #$0001          ; $118534   |
    STA $00             ; $118537   |
    LDA #$0002          ; $118539   |
    STA $0A             ; $11853C   |
    LDA #$0040          ; $11853E   |
    STA $0C             ; $118541   |
    LDX #$0004          ; $118543   |
    JSR CODE_118682     ; $118546   |
    JSR CODE_1183D6     ; $118549   |
    SEP #$30            ; $11854C   |
    INC $116A           ; $11854E   |
    LDA #$10            ; $118551   |
    STA $1168           ; $118553   |
    RTS                 ; $118556   |

    REP #$30            ; $118557   |
    LDA #$0004          ; $118559   |
    STA $00             ; $11855C   |
    LDA #$0002          ; $11855E   |
    STA $0A             ; $118561   |
    LDA #$0042          ; $118563   |
    STA $0C             ; $118566   |
    LDX #$0005          ; $118568   |
    JSR CODE_118682     ; $11856B   |
    SEP #$30            ; $11856E   |
    LDA $30             ; $118570   |
    LSR A               ; $118572   |
    BCS CODE_118578     ; $118573   |
    JSR CODE_1183D6     ; $118575   |

CODE_118578:
    DEC $1168           ; $118578   |
    BNE CODE_118585     ; $11857B   |
    INC $116A           ; $11857D   |
    LDA #$02            ; $118580   |
    STA $1168           ; $118582   |

CODE_118585:
    REP #$30            ; $118585   |
    LDA $10FE           ; $118587   |
    SEC                 ; $11858A   |
    SBC #$0010          ; $11858B   |
    BPL CODE_118593     ; $11858E   |
    LDA #$0001          ; $118590   |

CODE_118593:
    STA $10FE           ; $118593   |
    LDA $1100           ; $118596   |
    SEC                 ; $118599   |
    SBC #$0010          ; $11859A   |
    BPL CODE_1185A2     ; $11859D   |
    LDA #$0001          ; $11859F   |

CODE_1185A2:
    STA $1100           ; $1185A2   |
    SEP #$30            ; $1185A5   |
    RTS                 ; $1185A7   |

    REP #$30            ; $1185A8   |
    LDA #$0010          ; $1185AA   |
    STA $00             ; $1185AD   |
    STZ $0A             ; $1185AF   |
    LDA #$00E3          ; $1185B1   |
    STA $0C             ; $1185B4   |
    LDX #$0009          ; $1185B6   |
    JSR CODE_118682     ; $1185B9   |
    SEP #$30            ; $1185BC   |
    DEC $1168           ; $1185BE   |
    BNE CODE_1185CB     ; $1185C1   |
    INC $116A           ; $1185C3   |
    LDA #$02            ; $1185C6   |
    STA $1168           ; $1185C8   |

CODE_1185CB:
    RTS                 ; $1185CB   |

    REP #$30            ; $1185CC   |
    LDA #$0020          ; $1185CE   |
    STA $00             ; $1185D1   |
    STZ $0A             ; $1185D3   |
    LDA #$00E3          ; $1185D5   |
    STA $0C             ; $1185D8   |
    LDX #$0019          ; $1185DA   |
    JSR CODE_118682     ; $1185DD   |
    SEP #$30            ; $1185E0   |
    DEC $1168           ; $1185E2   |
    BNE CODE_1185EF     ; $1185E5   |
    INC $116A           ; $1185E7   |
    LDA #$02            ; $1185EA   |
    STA $1168           ; $1185EC   |

CODE_1185EF:
    RTS                 ; $1185EF   |

    REP #$30            ; $1185F0   |
    LDA #$0020          ; $1185F2   |
    STA $00             ; $1185F5   |
    STZ $0A             ; $1185F7   |
    LDA #$00E3          ; $1185F9   |
    STA $0C             ; $1185FC   |
    LDX #$0039          ; $1185FE   |
    JSR CODE_118682     ; $118601   |
    SEP #$30            ; $118604   |
    DEC $1168           ; $118606   |
    BNE CODE_118613     ; $118609   |
    INC $116A           ; $11860B   |
    LDA #$02            ; $11860E   |
    STA $1168           ; $118610   |

CODE_118613:
    RTS                 ; $118613   |

    REP #$30            ; $118614   |
    LDA #$0008          ; $118616   |
    STA $00             ; $118619   |
    LDA #$0002          ; $11861B   |
    STA $0A             ; $11861E   |
    LDA #$00E5          ; $118620   |
    STA $0C             ; $118623   |
    LDX #$0059          ; $118625   |
    JSR CODE_118682     ; $118628   |
    SEP #$30            ; $11862B   |
    DEC $1168           ; $11862D   |
    BNE CODE_11867D     ; $118630   |
    INC $116A           ; $118632   |
    INC $10E2           ; $118635   |
    LDA $7978           ; $118638   |
    CMP #$04            ; $11863B   |
    BEQ CODE_118644     ; $11863D   |
    INC $10E6           ; $11863F   |
    BRA CODE_11867A     ; $118642   |

CODE_118644:
    LDA $10F2           ; $118644   |
    BEQ CODE_11864E     ; $118647   |
    INC $10FA           ; $118649   |
    BRA CODE_11867A     ; $11864C   |

CODE_11864E:
    REP #$20            ; $11864E   |
    LDA #$0011          ; $118650   |
    JSL $03A34C         ; $118653   |
    BCC CODE_11867A     ; $118657   |
    PHX                 ; $118659   |
    LDA $1170           ; $11865A   |
    SEC                 ; $11865D   |
    SBC #$0003          ; $11865E   |
    CLC                 ; $118661   |
    ADC #$000A          ; $118662   |
    STA $7978,y         ; $118665   |
    LDA #$0080          ; $118668   |
    STA $7182,y         ; $11866B   |
    LDA #$0038          ; $11866E   |
    STA $70E2,y         ; $118671   |
    PLX                 ; $118674   |
    INC $10F8           ; $118675   |
    SEP #$20            ; $118678   |

CODE_11867A:
    JSR CODE_1191C4     ; $11867A   |

CODE_11867D:
    RTS                 ; $11867D   |

    JSR CODE_1191C4     ; $11867E   |
    RTS                 ; $118681   |

CODE_118682:
    REP #$30            ; $118682   |
    LDY $6092           ; $118684   |

CODE_118687:
    LDA $873B,x         ; $118687   |
    CLC                 ; $11868A   |
    ADC #$0020          ; $11868B   |
    AND #$00FF          ; $11868E   |
    CMP #$0080          ; $118691   |
    BCC CODE_118699     ; $118694   |
    ORA #$FF00          ; $118696   |

CODE_118699:
    CLC                 ; $118699   |
    ADC $70E6           ; $11869A   |
    STA $6000,y         ; $11869D   |
    LDA $86DA,x         ; $1186A0   |
    CLC                 ; $1186A3   |
    ADC #$0020          ; $1186A4   |
    AND #$00FF          ; $1186A7   |
    CMP #$0080          ; $1186AA   |
    BCC CODE_1186B2     ; $1186AD   |
    ORA #$FF00          ; $1186AF   |

CODE_1186B2:
    CLC                 ; $1186B2   |
    ADC $7186           ; $1186B3   |
    STA $6002,y         ; $1186B6   |
    LDA $879B,x         ; $1186B9   |
    AND #$FF00          ; $1186BC   |
    ORA $0C             ; $1186BF   |
    STA $6004,y         ; $1186C1   |
    LDA $0A             ; $1186C4   |
    STA $6006,y         ; $1186C6   |
    INX                 ; $1186C9   |
    TYA                 ; $1186CA   |
    CLC                 ; $1186CB   |
    ADC #$0008          ; $1186CC   |
    TAY                 ; $1186CF   |
    DEC $00             ; $1186D0   |
    BNE CODE_118687     ; $1186D2   |
    STY $6092           ; $1186D4   |
    SEP #$30            ; $1186D7   |
    RTS                 ; $1186D9   |

DATA_1186DA:         db $00, $00, $F0, $F0, $F8, $00, $00, $F0
DATA_1186E2:         db $F0, $08, $08, $00, $00, $F8, $F0, $F0
DATA_1186EA:         db $F8, $08, $F0, $08, $F0, $00, $00, $F8
DATA_1186F2:         db $F8, $F4, $F4, $EC, $EC, $F4, $F4, $EC
DATA_1186FA:         db $EC, $0C, $0C, $04, $04, $0C, $0C, $04
DATA_118702:         db $04, $10, $10, $08, $08, $F0, $F0, $E8
DATA_11870A:         db $E8, $00, $00, $F8, $F8, $00, $00, $F8
DATA_118712:         db $F8, $F0, $F0, $E8, $E8, $00, $00, $F8
DATA_11871A:         db $F8, $10, $10, $08, $08, $18, $18, $10
DATA_118722:         db $10, $10, $10, $08, $08, $00, $00, $F8
DATA_11872A:         db $F8, $F0, $F0, $E8, $E8, $E8, $E8, $E0
DATA_118732:         db $E0, $F8, $10, $18, $10, $F8, $E0, $D8
DATA_11873A:         db $E0

DATA_11873B:         db $00, $F0, $00, $F0, $F8, $F0, $00, $00
DATA_118743:         db $F0, $00, $F8, $F0, $08, $08, $00, $F8
DATA_11874B:         db $F0, $08, $08, $F0, $F0, $00, $F8, $00
DATA_118753:         db $F8, $F4, $EC, $F4, $EC, $0C, $04, $0C
DATA_11875B:         db $04, $0C, $04, $0C, $04, $F4, $EC, $F4
DATA_118763:         db $EC, $00, $F8, $00, $F8, $00, $F8, $00
DATA_11876B:         db $F8, $10, $08, $10, $08, $F0, $E8, $F0
DATA_118773:         db $E8, $F0, $E8, $E8, $F0, $E8, $E0, $E0
DATA_11877B:         db $E8, $F0, $E8, $E8, $F0, $00, $F8, $F8
DATA_118783:         db $00, $10, $08, $08, $10, $18, $10, $10
DATA_11878B:         db $18, $10, $08, $08, $10, $00, $F8, $F8
DATA_118793:         db $00, $D8, $E0, $F8, $10, $18, $10, $F8

DATA_11879B:         db $E0, $F0, $B0, $70, $30, $30, $B2, $F2
DATA_1187A3:         db $72, $32, $B0, $F0, $30, $70, $F0, $30
DATA_1187AB:         db $70, $B0, $F0, $70, $B0, $30, $30, $70
DATA_1187B3:         db $B0, $F0, $F0, $B0, $70, $30, $F0, $B0
DATA_1187BB:         db $70, $30, $F0, $B0, $70, $30, $F0, $B0
DATA_1187C3:         db $70, $30, $F0, $B0, $70, $30, $F0, $B0
DATA_1187CB:         db $70, $30, $F0, $B0, $70, $30, $F0, $B0
DATA_1187D3:         db $70, $30, $F0, $B0, $30, $70, $F0, $B0
DATA_1187DB:         db $30, $70, $F0, $B0, $30, $70, $F0, $B0
DATA_1187E3:         db $30, $70, $F0, $B0, $30, $70, $F0, $B0
DATA_1187EB:         db $30, $70, $F0, $B0, $30, $70, $F0, $B0
DATA_1187F3:         db $30, $70, $30, $30, $30, $70, $70, $70
DATA_1187FB:         db $70, $30

CODE_1187FD:
    LDA $797A           ; $1187FD   |
    ASL A               ; $118800   |
    TAY                 ; $118801   |
    LDA $880F,y         ; $118802   |
    STA $00             ; $118805   |
    LDA $8810,y         ; $118807   |
    STA $01             ; $11880A   |
    JMP ($0000)         ; $11880C   |

DATA_11880F:         dw $8819
DATA_118811:         dw $88FB
DATA_118813:         dw $8A1F
DATA_118815:         dw $8B0E
DATA_118817:         dw $8C54

CODE_118819:
    LDY $1156           ; $118819   |
    LDA $1146           ; $11881C   |
    BEQ CODE_118826     ; $11881F   |
    DEC $1146           ; $118821   |
    BRA CODE_118835     ; $118824   |

CODE_118826:
    INY                 ; $118826   |
    CPY #$04            ; $118827   |
    BCC CODE_11882D     ; $118829   |
    LDY #$00            ; $11882B   |

CODE_11882D:
    STY $1156           ; $11882D   |
    LDA #$10            ; $118830   |
    STA $1146           ; $118832   |

CODE_118835:
    REP #$30            ; $118835   |
    TYA                 ; $118837   |
    ASL A               ; $118838   |
    ASL A               ; $118839   |
    CLC                 ; $11883A   |
    ADC $1156           ; $11883B   |
    ASL A               ; $11883E   |
    TAX                 ; $11883F   |
    LDY $6092           ; $118840   |
    LDA #$0005          ; $118843   |
    STA $00             ; $118846   |

CODE_118848:
    LDA $88AB,x         ; $118848   |
    CLC                 ; $11884B   |
    ADC $70E4           ; $11884C   |
    STA $6000,y         ; $11884F   |
    LDA $88D3,x         ; $118852   |
    CLC                 ; $118855   |
    ADC $7184           ; $118856   |
    STA $6002,y         ; $118859   |
    LDA $8883,x         ; $11885C   |
    STA $6004,y         ; $11885F   |
    AND #$FF00          ; $118862   |
    SEC                 ; $118865   |
    SBC #$3100          ; $118866   |
    BEQ CODE_11886E     ; $118869   |
    LDA #$0002          ; $11886B   |

CODE_11886E:
    STA $6006,y         ; $11886E   |
    INX                 ; $118871   |
    INX                 ; $118872   |
    TYA                 ; $118873   |
    CLC                 ; $118874   |
    ADC #$0008          ; $118875   |
    TAY                 ; $118878   |
    DEC $00             ; $118879   |
    BNE CODE_118848     ; $11887B   |
    STY $6092           ; $11887D   |
    SEP #$30            ; $118880   |
    RTS                 ; $118882   |

DATA_118883:         db $9E, $31, $9E, $31, $8B, $31, $8A, $31
DATA_11888B:         db $88, $33, $9E, $31, $9E, $31, $8B, $31
DATA_118893:         db $8A, $31, $88, $33, $88, $33, $9E, $31
DATA_11889B:         db $9E, $31, $8B, $31, $8A, $31, $9E, $31
DATA_1188A3:         db $9E, $31, $8B, $31, $8A, $31, $88, $33

DATA_1188AB:         dw $FFEB, $FFE0, $FFE8, $FFE0
DATA_1188B3:         dw $FFE0, $FFEB, $FFE0, $FFE8
DATA_1188BB:         dw $FFE0, $FFDF, $FFDE, $FFEB
DATA_1188C3:         dw $FFE0, $FFE8, $FFE0, $FFEB
DATA_1188CB:         dw $FFE0, $FFE8, $FFE0, $FFDF

ATA_1188D3:         dw $FFF0, $FFF0, $FFED, $FFED
ATA_1188DB:         dw $FFDE, $FFF0, $FFF0, $FFED
ATA_1188E3:         dw $FFED, $FFDE, $FFDF, $FFF0
ATA_1188EB:         dw $FFF0, $FFED, $FFED, $FFF0
ATA_1188F3:         dw $FFF0, $FFED, $FFED, $FFDE

    LDA $10F2           ; $1188FB   |
    BEQ CODE_118903     ; $1188FE   |
    JMP CODE_1189A5     ; $118900   |

CODE_118903:
    LDA $118A           ; $118903   |
    BEQ CODE_118919     ; $118906   |
    JSR CODE_119B79     ; $118908   |
    DEC $118A           ; $11890B   |
    BEQ CODE_118913     ; $11890E   |
    JMP CODE_1189A1     ; $118910   |

CODE_118913:
    STZ $116E           ; $118913   |
    JSR CODE_118C58     ; $118916   |

CODE_118919:
    LDA $116E           ; $118919   |
    ASL A               ; $11891C   |
    TAX                 ; $11891D   |
    LDA $1172,x         ; $11891E   |
    DEC A               ; $118921   |
    STA $1172,x         ; $118922   |
    BNE CODE_11894B     ; $118925   |
    JSL $008408         ; $118927   |
    LDA $7970           ; $11892B   |
    CMP #$02            ; $11892E   |
    BCS CODE_11893F     ; $118930   |
    LDA #$20            ; $118932   |
    STA $118A           ; $118934   |
    LDA #$90            ; $118937   |\ play sound #$0090
    JSL $0085D2         ; $118939   |/
    BRA CODE_1189A1     ; $11893D   |

CODE_11893F:
    INC $116E           ; $11893F   |
    LDA #$8F            ; $118942   |\ play sound #$008F
    JSL $0085D2         ; $118944   |/
    JSR CODE_1199F8     ; $118948   |

CODE_11894B:
    DEC $1166           ; $11894B   |
    BEQ CODE_118958     ; $11894E   |
    JSR CODE_119AC6     ; $118950   |
    JSR CODE_119B99     ; $118953   |
    BRA CODE_1189A1     ; $118956   |

CODE_118958:
    LDA #$13            ; $118958   |\ play sound #$0013
    JSL $0085D2         ; $11895A   |/
    LDA #$08            ; $11895E   |\ play sound #$0008
    JSL $0085D2         ; $118960   |/
    LDA #$38            ; $118964   |\ play sound #$0038
    JSL $0085D2         ; $118966   |/
    LDA #$02            ; $11896A   |
    STA $797A           ; $11896C   |
    LDA #$01            ; $11896F   |
    STA $797C           ; $118971   |
    STZ $1146           ; $118974   |
    STZ $1156           ; $118977   |
    LDA #$FD            ; $11897A   |
    STA $1107           ; $11897C   |
    LDA #$FD            ; $11897F   |
    STA $1109           ; $118981   |
    STZ $1106           ; $118984   |
    STZ $1108           ; $118987   |
    STZ $1126           ; $11898A   |
    STZ $1128           ; $11898D   |
    LDA #$F0            ; $118990   |
    STA $7224           ; $118992   |
    STZ $1138           ; $118995   |
    STZ $1168           ; $118998   |
    STZ $116A           ; $11899B   |
    JSR CODE_11942C     ; $11899E   |

CODE_1189A1:
    JSR CODE_118819     ; $1189A1   |
    RTS                 ; $1189A4   |

CODE_1189A5:
    LDA $118A           ; $1189A5   |
    BEQ CODE_1189BC     ; $1189A8   |
    DEC $118A           ; $1189AA   |
    BNE CODE_1189B5     ; $1189AD   |
    STZ $116E           ; $1189AF   |
    JSR CODE_1195E8     ; $1189B2   |

CODE_1189B5:
    JSR CODE_118819     ; $1189B5   |
    JSR CODE_119B79     ; $1189B8   |
    RTS                 ; $1189BB   |

CODE_1189BC:
    JSR CODE_119B99     ; $1189BC   |
    REP #$20            ; $1189BF   |
    DEC $116C           ; $1189C1   |
    BNE CODE_1189EA     ; $1189C4   |

CODE_1189C6:
    LDA #$0090          ; $1189C6   |\ play sound #$0090
    JSL $0085D2         ; $1189C9   |/
    LDA #$0020          ; $1189CD   |
    STA $118A           ; $1189D0   |
    LDA $118C           ; $1189D3   |
    STA $116C           ; $1189D6   |
    REP #$20            ; $1189D9   |
    LDA #$0048          ; $1189DB   |
    STA $1192           ; $1189DE   |
    STZ $1190           ; $1189E1   |
    JSR CODE_119BF4     ; $1189E4   |
    JMP CODE_118A19     ; $1189E7   |

CODE_1189EA:
    JSR CODE_119AC6     ; $1189EA   |
    REP #$20            ; $1189ED   |
    LDA $116E           ; $1189EF   |
    ASL A               ; $1189F2   |
    TAX                 ; $1189F3   |
    LDA $37             ; $1189F4   |
    BEQ CODE_118A19     ; $1189F6   |
    CMP $1172,x         ; $1189F8   |
    BNE CODE_1189C6     ; $1189FB   |
    LDA #$008F          ; $1189FD   |\ play sound #$008F
    JSL $0085D2         ; $118A00   |/
    INC $116E           ; $118A04   |
    LDA $1170           ; $118A07   |
    CMP $116E           ; $118A0A   |
    BCC CODE_118A14     ; $118A0D   |
    JSR CODE_119902     ; $118A0F   |
    BRA CODE_118A19     ; $118A12   |

CODE_118A14:
    SEP #$20            ; $118A14   |
    JMP CODE_118958     ; $118A16   |

CODE_118A19:
    SEP #$20            ; $118A19   |
    JSR CODE_118819     ; $118A1B   |
    RTS                 ; $118A1E   |

    LDA #$20            ; $118A1F   |
    STA $00             ; $118A21   |
    LDA #$04            ; $118A23   |
    STA $02             ; $118A25   |
    LDX #$02            ; $118A27   |
    LDA #$00            ; $118A29   |
    JSR CODE_119073     ; $118A2B   |
    LDA $7184           ; $118A2E   |
    CMP #$D8            ; $118A31   |
    BCC CODE_118A43     ; $118A33   |
    LDA #$D8            ; $118A35   |
    STA $7184           ; $118A37   |
    STZ $797A           ; $118A3A   |
    STZ $1146           ; $118A3D   |
    STZ $1156           ; $118A40   |

CODE_118A43:
    LDA $1107           ; $118A43   |
    CLC                 ; $118A46   |
    ADC #$03            ; $118A47   |
    TAY                 ; $118A49   |
    LDA $8A8F,y         ; $118A4A   |
    TAX                 ; $118A4D   |
    REP #$30            ; $118A4E   |
    LDA #$0005          ; $118A50   |
    STA $00             ; $118A53   |
    LDY $6092           ; $118A55   |

CODE_118A58:
    LDA $70E4           ; $118A58   |
    CLC                 ; $118A5B   |
    ADC $8ABE,x         ; $118A5C   |
    STA $6000,y         ; $118A5F   |
    LDA $7184           ; $118A62   |
    CLC                 ; $118A65   |
    ADC $8A96,x         ; $118A66   |
    STA $6002,y         ; $118A69   |
    LDA $8AE6,x         ; $118A6C   |
    STA $6004,y         ; $118A6F   |
    AND #$0200          ; $118A72   |
    BEQ CODE_118A7A     ; $118A75   |
    LDA #$0002          ; $118A77   |

CODE_118A7A:
    STA $6006,y         ; $118A7A   |
    INX                 ; $118A7D   |
    INX                 ; $118A7E   |
    TYA                 ; $118A7F   |
    CLC                 ; $118A80   |
    ADC #$0008          ; $118A81   |
    TAY                 ; $118A84   |
    DEC $00             ; $118A85   |
    BNE CODE_118A58     ; $118A87   |
    STY $6092           ; $118A89   |
    SEP #$30            ; $118A8C   |
    RTS                 ; $118A8E   |

DATA_118A8F:         db $00, $0A, $0A, $14, $14, $14, $1E

DATA_118A96:         dw $FFE2, $FFEF, $FFF0, $FFED
DATA_118A9E:         dw $FFED, $FFEF, $FFF0, $FFE8
DATA_118AA6:         dw $FFE8, $FFD9, $FFF0, $FFF0
DATA_118AAE:         dw $FFDA, $FFE8, $FFE8, $FFF1
DATA_118AB6:         dw $FFF1, $FFE2, $FFEF, $FFEF

DATA_118ABE:         dw $FFDE, $FFEA, $FFE3, $FFE8
DATA_118AC6:         dw $FFE0, $FFE3, $FFE8, $FFE8
DATA_118ACE:         dw $FFE0, $FFE2, $FFE8, $FFE3
DATA_118AD6:         dw $FFE0, $FFE8, $FFE0, $FFE5
DATA_118ADE:         dw $FFE0, $FFDF, $FFE8, $FFE0

DATA_118AE6:         dw $3388, $319A, $319E, $318B
DATA_118AEE:         dw $318A, $719A, $719A, $318B
DATA_118AF6:         dw $318A, $3388, $B19B, $B19B
DATA_118AFE:         dw $3388, $318B, $318A, $319E
DATA_118B06:         dw $319E, $3388, $318B, $318A

    LDX #$02            ; $118B0E   |
    LDA #$20            ; $118B10   |
    STA $00             ; $118B12   |
    LDA #$04            ; $118B14   |
    STA $02             ; $118B16   |
    LDA #$00            ; $118B18   |
    JSR CODE_119073     ; $118B1A   |
    LDA $7182,x         ; $118B1D   |
    CMP #$D8            ; $118B20   |
    BCC CODE_118B4D     ; $118B22   |
    LDA #$D8            ; $118B24   |
    STA $7182,x         ; $118B26   |
    LDA $70E2,x         ; $118B29   |
    CLC                 ; $118B2C   |
    ADC #$F6            ; $118B2D   |
    STA $70EA           ; $118B2F   |
    LDA $7182,x         ; $118B32   |
    CLC                 ; $118B35   |
    ADC #$F8            ; $118B36   |
    STA $718A           ; $118B38   |
    JSR CODE_118F1F     ; $118B3B   |
    LDA $30             ; $118B3E   |
    AND #$30            ; $118B40   |
    LSR A               ; $118B42   |
    LSR A               ; $118B43   |
    LSR A               ; $118B44   |
    LSR A               ; $118B45   |
    TAY                 ; $118B46   |
    LDA $8B96,y         ; $118B47   |
    TAX                 ; $118B4A   |
    BRA CODE_118B59     ; $118B4B   |

CODE_118B4D:
    JSR CODE_1190EB     ; $118B4D   |
    LDA $1105,x         ; $118B50   |
    INC A               ; $118B53   |
    INC A               ; $118B54   |
    TAY                 ; $118B55   |
    LDX $8B9A,y         ; $118B56   |

CODE_118B59:
    REP #$30            ; $118B59   |
    LDY $6092           ; $118B5B   |
    LDA #$0005          ; $118B5E   |
    STA $00             ; $118B61   |

CODE_118B63:
    LDA $70E4           ; $118B63   |
    CLC                 ; $118B66   |
    ADC $8BDC,x         ; $118B67   |
    STA $6000,y         ; $118B6A   |
    LDA $7184           ; $118B6D   |
    CLC                 ; $118B70   |
    ADC $8BA0,x         ; $118B71   |
    STA $6002,y         ; $118B74   |
    LDA $8C18,x         ; $118B77   |
    STA $6004,y         ; $118B7A   |
    AND #$0200          ; $118B7D   |
    XBA                 ; $118B80   |
    STA $6006,y         ; $118B81   |
    INX                 ; $118B84   |
    INX                 ; $118B85   |
    TYA                 ; $118B86   |
    CLC                 ; $118B87   |
    ADC #$0008          ; $118B88   |
    TAY                 ; $118B8B   |
    DEC $00             ; $118B8C   |
    BNE CODE_118B63     ; $118B8E   |
    STY $6092           ; $118B90   |
    SEP #$30            ; $118B93   |
    RTS                 ; $118B95   |

DATA_118B96:         db $1E, $28, $32, $28

DATA_118B9A:         dw $0A00, $1E14, $3228

DATA_118BA0:         dw $FFF1, $FFF1, $FFE2, $FFEF
DATA_118BA8:         dw $FFEF, $FFE4, $FFF2, $FFF2
DATA_118BB0:         dw $FFF1, $FFF1, $FFF3, $FFF3
DATA_118BB8:         dw $FFE6, $FFF3, $FFF3, $FFF3
DATA_118BC0:         dw $FFF3, $FFE5, $FFF2, $FFF2
DATA_118BC8:         dw $FFF3, $FFF3, $FFE4, $FFF2
DATA_118BD0:         dw $FFF2, $FFF3, $FFF3, $FFE4
DATA_118BD8:         dw $FFF2, $FFF2

DATA_118BDC:         dw $FFE5, $FFE0, $FFDF, $FFE8
DATA_118BE4:         dw $FFE0, $FFDF, $FFE4, $FFDF
DATA_118BEC:         dw $FFE9, $FFE1, $FFDC, $FFE1
DATA_118BF4:         dw $FFDF, $FFE9, $FFE1, $FFDC
DATA_118BFC:         dw $FFE1, $FFDF, $FFE9, $FFE1
DATA_118C04:         dw $FFDC, $FFE1, $FFE0, $FFE9
DATA_118C0C:         dw $FFE1, $FFDC, $FFE1, $FFE1
DATA_118C14:         dw $FFE9, $FFE1

DATA_118C18:         dw $319E, $319E, $3388, $318B
DATA_118C20:         dw $318A, $3388, $319A, $319A
DATA_118C28:         dw $318B, $318A, $319B, $319B
DATA_118C30:         dw $3388, $318B, $318A, $319B
DATA_118C38:         dw $319B, $3388, $318B, $318A
DATA_118C40:         dw $319B, $319B, $3388, $318B
DATA_118C48:         dw $318A, $319B, $319B, $3388
DATA_118C50:         dw $318B, $318A

    JMP CODE_118819     ; $118C54   |

    RTS                 ; $118C57   |

CODE_118C58:
    JSR CODE_119BF4     ; $118C58   |
    LDX #$0B            ; $118C5B   |

CODE_118C5D:
    STZ $1172,x         ; $118C5D   |
    DEX                 ; $118C60   |
    BPL CODE_118C5D     ; $118C61   |
    LDA $1165           ; $118C63   |
    BEQ CODE_118C78     ; $118C66   |
    LDA $1164           ; $118C68   |
    CMP #$80            ; $118C6B   |
    BCC CODE_118C78     ; $118C6D   |
    JSL $008408         ; $118C6F   |
    LDA $7970           ; $118C73   |
    BMI CODE_118CB6     ; $118C76   |

CODE_118C78:
    LDA $1170           ; $118C78   |
    ASL A               ; $118C7B   |
    TAX                 ; $118C7C   |
    STZ $00             ; $118C7D   |

CODE_118C7F:
    JSL $008408         ; $118C7F   |
    LDA $7970           ; $118C83   |
    AND #$1F            ; $118C86   |
    CMP #$18            ; $118C88   |
    BCC CODE_118C98     ; $118C8A   |
    CMP #$1C            ; $118C8C   |
    BCS CODE_118C95     ; $118C8E   |
    SEC                 ; $118C90   |
    SBC #$18            ; $118C91   |
    BRA CODE_118C98     ; $118C93   |

CODE_118C95:
    SEC                 ; $118C95   |
    SBC #$08            ; $118C96   |

CODE_118C98:
    CLC                 ; $118C98   |
    ADC #$08            ; $118C99   |
    STA $1172,x         ; $118C9B   |
    CLC                 ; $118C9E   |
    ADC $00             ; $118C9F   |
    STA $00             ; $118CA1   |
    DEX                 ; $118CA3   |
    DEX                 ; $118CA4   |
    BPL CODE_118C7F     ; $118CA5   |
    LDA $00             ; $118CA7   |
    CMP #$B4            ; $118CA9   |
    BCC CODE_118CAF     ; $118CAB   |
    LDA #$B4            ; $118CAD   |

CODE_118CAF:
    STA $1166           ; $118CAF   |
    JSR CODE_11976D     ; $118CB2   |
    RTS                 ; $118CB5   |

CODE_118CB6:
    JSL $008408         ; $118CB6   |
    LDA $7970           ; $118CBA   |
    AND #$7F            ; $118CBD   |
    CLC                 ; $118CBF   |
    ADC #$30            ; $118CC0   |
    STA $1166           ; $118CC2   |
    STA $4204           ; $118CC5   |
    STZ $4205           ; $118CC8   |
    LDA $1170           ; $118CCB   |
    INC A               ; $118CCE   |
    STA $4206           ; $118CCF   |
    NOP                 ; $118CD2   |
    NOP                 ; $118CD3   |
    NOP                 ; $118CD4   |
    NOP                 ; $118CD5   |
    NOP                 ; $118CD6   |
    NOP                 ; $118CD7   |
    NOP                 ; $118CD8   |
    NOP                 ; $118CD9   |
    LDA $4214           ; $118CDA   |
    STA $00             ; $118CDD   |
    LDA $1170           ; $118CDF   |
    ASL A               ; $118CE2   |
    STA $0A             ; $118CE3   |
    LDX #$00            ; $118CE5   |
    STZ $02             ; $118CE7   |

CODE_118CE9:
    LDA $00             ; $118CE9   |
    STA $1172,x         ; $118CEB   |
    CLC                 ; $118CEE   |
    ADC $02             ; $118CEF   |
    STA $02             ; $118CF1   |
    INX                 ; $118CF3   |
    INX                 ; $118CF4   |
    CPX $0A             ; $118CF5   |
    BNE CODE_118CE9     ; $118CF7   |
    LDA $1166           ; $118CF9   |
    SEC                 ; $118CFC   |
    SBC $02             ; $118CFD   |
    STA $1172,x         ; $118CFF   |
    JSL $008408         ; $118D02   |
    LDA $7970           ; $118D06   |
    AND #$06            ; $118D09   |
    TAX                 ; $118D0B   |
    JSR ($8D16,x)       ; $118D0C   |

    JSR CODE_11976D     ; $118D0F   |
    STZ $116E           ; $118D12   |
    RTS                 ; $118D15   |

DATA_118D16:         dw $8D1F
DATA_118D18:         dw $8D1F
DATA_118D1A:         dw $8D4B
DATA_118D1C:         dw $8D4B

    RTS                 ; $118D1E   |

    LDA $1170           ; $118D1F   |
    ASL A               ; $118D22   |
    TAY                 ; $118D23   |
    STZ $00             ; $118D24   |

CODE_118D26:
    LDA $1172,y         ; $118D26   |
    SEC                 ; $118D29   |
    SBC #$08            ; $118D2A   |
    CLC                 ; $118D2C   |
    ADC $00             ; $118D2D   |
    STA $00             ; $118D2F   |
    LDA #$08            ; $118D31   |
    STA $1172,y         ; $118D33   |
    DEY                 ; $118D36   |
    DEY                 ; $118D37   |
    CPY #$02            ; $118D38   |
    BNE CODE_118D26     ; $118D3A   |
    LDA $00             ; $118D3C   |
    LSR A               ; $118D3E   |
    CLC                 ; $118D3F   |
    ADC $1172           ; $118D40   |
    STA $1172           ; $118D43   |
    INC A               ; $118D46   |
    STA $1174           ; $118D47   |
    RTS                 ; $118D4A   |

    LDA $1170           ; $118D4B   |
    DEC A               ; $118D4E   |
    ASL A               ; $118D4F   |
    TAY                 ; $118D50   |
    PHY                 ; $118D51   |
    STZ $00             ; $118D52   |

CODE_118D54:
    LDA $1172,y         ; $118D54   |
    SEC                 ; $118D57   |
    SBC #$08            ; $118D58   |
    CLC                 ; $118D5A   |
    ADC $00             ; $118D5B   |
    STA $00             ; $118D5D   |
    LDA #$08            ; $118D5F   |
    STA $1172,y         ; $118D61   |
    DEY                 ; $118D64   |
    DEY                 ; $118D65   |
    BPL CODE_118D54     ; $118D66   |
    PLY                 ; $118D68   |
    LDA $1174,y         ; $118D69   |
    CLC                 ; $118D6C   |
    ADC $00             ; $118D6D   |
    STA $1174,y         ; $118D6F   |
    RTS                 ; $118D72   |

CODE_118D73:
    LDA $038C           ; $118D73   |
    BNE CODE_118D88     ; $118D76   |
    REP #$20            ; $118D78   |
    LDA $70E2           ; $118D7A   |
    STA $608C           ; $118D7D   |
    LDA $7182           ; $118D80   |
    STA $6090           ; $118D83   |
    SEP #$20            ; $118D86   |

CODE_118D88:
    JSL $04FA67         ; $118D88   |
    RTS                 ; $118D8C   |

CODE_118D8D:
    LDA $7978           ; $118D8D   |
    ASL A               ; $118D90   |
    TAY                 ; $118D91   |
    LDA $8D9F,y         ; $118D92   |
    STA $00             ; $118D95   |
    LDA $8DA0,y         ; $118D97   |
    STA $01             ; $118D9A   |
    JMP ($0000)         ; $118D9C   |

DATA_118D9F:         dw $8DA9
DATA_118DA1:         dw $8DBB
DATA_118DA3:         dw $8DEA
DATA_118DA5:         dw $8E1C
DATA_118DA7:         dw $8E7C

    JSL $008408         ; $118DA9   |
    REP #$20            ; $118DAD   |
    LDX #$0B            ; $118DAF   |
    LDA #$C6C5          ; $118DB1   |
    JSL $7EDECF         ; $118DB4   | GSU init
    SEP #$20            ; $118DB8   |
    RTS                 ; $118DBA   |

    JSR CODE_119845     ; $118DBB   |
    LDY $1154           ; $118DBE   |
    LDA $1144           ; $118DC1   |
    BEQ CODE_118DCB     ; $118DC4   |
    DEC $1144           ; $118DC6   |
    BRA CODE_118DDB     ; $118DC9   |

CODE_118DCB:
    INY                 ; $118DCB   |
    CPY #$04            ; $118DCC   |
    BCC CODE_118DD2     ; $118DCE   |
    LDY #$00            ; $118DD0   |

CODE_118DD2:
    STY $1154           ; $118DD2   |
    LDA $8DE6,y         ; $118DD5   |
    STA $1144           ; $118DD8   |

CODE_118DDB:
    LDA $8DE2,y         ; $118DDB   |
    STA $60BE           ; $118DDE   |
    RTS                 ; $118DE1   |

DATA_118DE2:         db $0D, $00, $4D, $00

DATA_118DE6:         db $20, $06, $06, $06

    LDA #$20            ; $118DEA   |
    STA $00             ; $118DEC   |
    LDA #$04            ; $118DEE   |
    STA $02             ; $118DF0   |
    LDX #$00            ; $118DF2   |
    TXA                 ; $118DF4   |
    JSR CODE_119073     ; $118DF5   |
    LDA $7182           ; $118DF8   |
    CMP #$B0            ; $118DFB   |
    BCC CODE_118E0D     ; $118DFD   |
    LDA #$B0            ; $118DFF   |
    STA $7182           ; $118E01   |
    STZ $7978           ; $118E04   |
    STZ $1154           ; $118E07   |
    STZ $1144           ; $118E0A   |

CODE_118E0D:
    LDA $1105           ; $118E0D   |
    BPL CODE_118E16     ; $118E10   |
    LDA #$06            ; $118E12   |
    BRA CODE_118E18     ; $118E14   |

CODE_118E16:
    LDA #$07            ; $118E16   |

CODE_118E18:
    STA $60BE           ; $118E18   |
    RTS                 ; $118E1B   |

    LDY $1154           ; $118E1C   |
    LDA $1144           ; $118E1F   |
    BEQ CODE_118E29     ; $118E22   |
    DEC $1144           ; $118E24   |
    BRA CODE_118E39     ; $118E27   |

CODE_118E29:
    INY                 ; $118E29   |
    CPY #$11            ; $118E2A   |
    BCC CODE_118E30     ; $118E2C   |
    LDY #$10            ; $118E2E   |

CODE_118E30:
    STY $1154           ; $118E30   |
    LDA $8E6A,y         ; $118E33   |
    STA $1144           ; $118E36   |

CODE_118E39:
    LDA $8E59,y         ; $118E39   |
    STA $60BE           ; $118E3C   |
    CPY #$10            ; $118E3F   |
    BNE CODE_118E58     ; $118E41   |
    LDA $70E2           ; $118E43   |
    CLC                 ; $118E46   |
    ADC #$28            ; $118E47   |
    STA $70EA           ; $118E49   |
    LDA $7182           ; $118E4C   |
    CLC                 ; $118E4F   |
    ADC #$24            ; $118E50   |
    STA $718A           ; $118E52   |
    JSR CODE_118F1F     ; $118E55   |

CODE_118E58:
    RTS                 ; $118E58   |

DATA_118E59:         db $74, $73, $72, $71, $70, $6F, $74, $73
DATA_118E61:         db $72, $71, $70, $6F, $6C, $6D, $6E, $6D
DATA_118E69:         db $6E

DATA_118E6A:         db $03, $03, $03, $03, $03, $03, $03, $03
DATA_118E72:         db $03, $03, $03, $03, $03, $03, $03, $03
DATA_118E7A:         db $03, $60

    LDA $10F2           ; $118E7C   |
    BEQ CODE_118E85     ; $118E7F   |
    LDY #$00            ; $118E81   |
    BRA CODE_118EE4     ; $118E83   |

CODE_118E85:
    DEC $79D8           ; $118E85   |
    LDA $79D8           ; $118E88   |
    BNE CODE_118EB2     ; $118E8B   |
    LDA $79D6           ; $118E8D   |
    INC A               ; $118E90   |
    INC A               ; $118E91   |
    CMP #$1E            ; $118E92   |
    BCC CODE_118E98     ; $118E94   |
    LDA #$1E            ; $118E96   |

CODE_118E98:
    STA $79D6           ; $118E98   |
    LSR A               ; $118E9B   |
    TAY                 ; $118E9C   |
    LDA $8F0F,y         ; $118E9D   |
    STA $79D8           ; $118EA0   |
    CPY #$04            ; $118EA3   |
    BNE CODE_118EB2     ; $118EA5   |
    LDA #$FC            ; $118EA7   |
    STA $1105           ; $118EA9   |
    STZ $1104           ; $118EAC   |
    STZ $1124           ; $118EAF   |

CODE_118EB2:
    LDA $1105           ; $118EB2   |
    BNE CODE_118EBE     ; $118EB5   |
    LDA $7182           ; $118EB7   |
    CMP #$B0            ; $118EBA   |
    BEQ CODE_118EE1     ; $118EBC   |

CODE_118EBE:
    LDA #$20            ; $118EBE   |
    STA $00             ; $118EC0   |
    LDA #$04            ; $118EC2   |
    STA $02             ; $118EC4   |
    LDX #$00            ; $118EC6   |
    TXA                 ; $118EC8   |
    JSR CODE_119073     ; $118EC9   |
    LDA $7182           ; $118ECC   |
    CMP #$B0            ; $118ECF   |
    BCC CODE_118EE1     ; $118ED1   |
    LDA #$B0            ; $118ED3   |
    STA $7182           ; $118ED5   |
    STZ $1105           ; $118ED8   |
    STZ $1104           ; $118EDB   |
    STZ $1124           ; $118EDE   |

CODE_118EE1:
    LDY $79D6           ; $118EE1   |

CODE_118EE4:
    REP #$20            ; $118EE4   |
    LDA $8EEF,y         ; $118EE6   |
    STA $60BE           ; $118EE9   |
    SEP #$20            ; $118EEC   |
    RTS                 ; $118EEE   |

DATA_118EEF:         dw $0000, $01AA, $01AC, $01AD
DATA_118EF7:         dw $01AB, $0021, $0022, $0023
DATA_118EFF:         dw $0024, $0025, $0026, $0027
DATA_118F07:         dw $01AC, $01AD, $01AC, $0000

DATA_118F0F:         dw $2030, $0802, $030C, $0303
DATA_118F17:         dw $0303, $2203, $0402, $FF02

CODE_118F1F:
    LDA $114C           ; $118F1F   |
    BEQ CODE_118F29     ; $118F22   |
    DEC $114C           ; $118F24   |
    BRA CODE_118F3B     ; $118F27   |

CODE_118F29:
    INC $115C           ; $118F29   |
    LDA #$03            ; $118F2C   |
    STA $114C           ; $118F2E   |
    LDA $115C           ; $118F31   |
    CMP #$06            ; $118F34   |
    BNE CODE_118F3B     ; $118F36   |
    STZ $115C           ; $118F38   |

CODE_118F3B:
    LDA $115C           ; $118F3B   |
    ASL A               ; $118F3E   |
    ASL A               ; $118F3F   |
    ASL A               ; $118F40   |
    TAX                 ; $118F41   |
    REP #$30            ; $118F42   |
    LDA #$0004          ; $118F44   |
    STA $00             ; $118F47   |
    LDY $6092           ; $118F49   |

CODE_118F4C:
    LDA $8F7E,x         ; $118F4C   |
    CLC                 ; $118F4F   |
    ADC $70EA           ; $118F50   |
    STA $6000,y         ; $118F53   |
    LDA #$FFE0          ; $118F56   |
    CLC                 ; $118F59   |
    ADC $718A           ; $118F5A   |
    STA $6002,y         ; $118F5D   |
    LDA $8FAE,x         ; $118F60   |
    STA $6004,y         ; $118F63   |
    LDA #$0000          ; $118F66   |
    STA $6006,y         ; $118F69   |
    INX                 ; $118F6C   |
    INX                 ; $118F6D   |
    TYA                 ; $118F6E   |
    CLC                 ; $118F6F   |
    ADC #$0008          ; $118F70   |
    TAY                 ; $118F73   |
    DEC $00             ; $118F74   |
    BNE CODE_118F4C     ; $118F76   |
    STY $6092           ; $118F78   |
    SEP #$30            ; $118F7B   |
    RTS                 ; $118F7D   |

DATA_118F7E:         dw $FFEC, $FFEC, $FFF8, $FFE0
DATA_118F86:         dw $FFEF, $FFE9, $FFF7, $FFE1
DATA_118F8E:         dw $FFE2, $FFF2, $FFE6, $FFF6
DATA_118F96:         dw $FFE4, $FFF4, $FFE4, $FFF4
DATA_118F9E:         dw $FFE6, $FFF6, $FFE2, $FFF2
DATA_118FA6:         dw $FFE9, $FFF7, $FFE1, $FFEF

DATA_118FAE:         dw $351A, $350A, $350A, $351A
DATA_118FB6:         dw $351A, $350A, $350A, $351A
DATA_118FBE:         dw $351A, $351A, $350A, $350A
DATA_118FC6:         dw $351A, $351A, $350A, $350A
DATA_118FCE:         dw $351A, $351A, $350A, $350A
DATA_118FD6:         dw $351A, $351A, $350A, $350A

CODE_118FDE:
    LDY $116A           ; $118FDE   |
    INC $1168           ; $118FE1   |
    LDA $1168           ; $118FE4   |
    CMP $9055,y         ; $118FE7   |
    BCC CODE_118FF2     ; $118FEA   |
    STZ $1168           ; $118FEC   |
    INC $116A           ; $118FEF   |

CODE_118FF2:
    TYA                 ; $118FF2   |
    ASL A               ; $118FF3   |
    TAY                 ; $118FF4   |
    LDA $9002,y         ; $118FF5   |
    STA $00             ; $118FF8   |
    LDA $9003,y         ; $118FFA   |
    STA $01             ; $118FFD   |
    JMP ($0000)         ; $118FFF   |

DATA_119002:         dw $9014
DATA_119004:         dw $9034
DATA_119006:         dw $9034
DATA_119008:         dw $9014
DATA_11900A:         dw $9014
DATA_11900C:         dw $9034
DATA_11900E:         dw $9034
DATA_119010:         dw $9014
DATA_119012:         dw $9014

    REP #$20            ; $119014   |
    LDA $1100           ; $119016   |
    SEC                 ; $119019   |
    SBC $905F,y         ; $11901A   |
    STA $1100           ; $11901D   |
    LDA $10FE           ; $119020   |
    CLC                 ; $119023   |
    ADC $905F,y         ; $119024   |
    CMP #$01FF          ; $119027   |
    BCC CODE_11902F     ; $11902A   |
    LDA #$01FF          ; $11902C   |

CODE_11902F:
    STA $10FE           ; $11902F   |
    BRA CODE_119052     ; $119032   |

    REP #$20            ; $119034   |
    LDA $10FE           ; $119036   |
    SEC                 ; $119039   |
    SBC $905F,y         ; $11903A   |
    STA $10FE           ; $11903D   |
    LDA $1100           ; $119040   |
    CLC                 ; $119043   |
    ADC $905F,y         ; $119044   |
    CMP #$01FF          ; $119047   |
    BCC CODE_11904F     ; $11904A   |
    LDA #$01FF          ; $11904C   |

CODE_11904F:
    STA $1100           ; $11904F   |

CODE_119052:
    SEP #$20            ; $119052   |
    RTS                 ; $119054   |

DATA_119055:         dw $1310, $1010, $0E0E, $0E0E
DATA_11905D:         dw $0E0E, $0006, $0005, $0004
DATA_119065:         dw $0004, $0004, $0004, $0004
DATA_11906D:         dw $0003, $0003, $0003

CODE_119073:
    PHA                 ; $119073   |
    LDA $1124,x         ; $119074   |
    CLC                 ; $119077   |
    ADC $1104,x         ; $119078   |
    STA $1124,x         ; $11907B   |
    LDY #$00            ; $11907E   |
    LDA $1105,x         ; $119080   |
    BPL CODE_119086     ; $119083   |
    DEY                 ; $119085   |

CODE_119086:
    STY $07             ; $119086   |
    ADC $7182,x         ; $119088   |
    STA $7182,x         ; $11908B   |
    LDA $7183,x         ; $11908E   |
    ADC $07             ; $119091   |
    STA $7183,x         ; $119093   |
    LDA $1104,x         ; $119096   |
    CLC                 ; $119099   |
    ADC $00             ; $11909A   |
    STA $1104,x         ; $11909C   |
    LDA $1105,x         ; $11909F   |
    ADC #$00            ; $1190A2   |
    STA $1105,x         ; $1190A4   |
    CMP $02             ; $1190A7   |
    BMI CODE_1190BA     ; $1190A9   |
    LDA $1104,x         ; $1190AB   |
    CMP #$80            ; $1190AE   |
    BCC CODE_1190BA     ; $1190B0   |
    LDA $02             ; $1190B2   |
    STA $1105,x         ; $1190B4   |
    STZ $1104,x         ; $1190B7   |

CODE_1190BA:
    PLA                 ; $1190BA   |
    BEQ CODE_1190EA     ; $1190BB   |
    LDA $02             ; $1190BD   |
    EOR #$FF            ; $1190BF   |
    INC A               ; $1190C1   |
    STA $07             ; $1190C2   |
    LDA $1104,x         ; $1190C4   |
    SEC                 ; $1190C7   |
    SBC $01             ; $1190C8   |
    STA $1104,x         ; $1190CA   |
    LDA $1105,x         ; $1190CD   |
    SBC #$00            ; $1190D0   |
    STA $1105,x         ; $1190D2   |
    CMP $07             ; $1190D5   |
    BPL CODE_1190EA     ; $1190D7   |
    LDA $1104,x         ; $1190D9   |
    CMP #$80            ; $1190DC   |
    BCS CODE_1190EA     ; $1190DE   |
    LDA $07             ; $1190E0   |
    STA $1105,x         ; $1190E2   |
    LDA #$FF            ; $1190E5   |
    STA $1104,x         ; $1190E7   |

CODE_1190EA:
    RTS                 ; $1190EA   |

CODE_1190EB:
    LDA $7220,x         ; $1190EB   |
    ASL A               ; $1190EE   |
    ASL A               ; $1190EF   |
    ASL A               ; $1190F0   |
    ASL A               ; $1190F1   |
    STA $01             ; $1190F2   |
    LDA $7220,x         ; $1190F4   |
    LSR A               ; $1190F7   |
    LSR A               ; $1190F8   |
    LSR A               ; $1190F9   |
    LSR A               ; $1190FA   |
    CMP #$08            ; $1190FB   |
    BCC CODE_119101     ; $1190FD   |
    ORA #$F0            ; $1190FF   |

CODE_119101:
    STA $00             ; $119101   |
    LDY #$00            ; $119103   |
    CMP #$00            ; $119105   |
    BPL CODE_11910A     ; $119107   |
    DEY                 ; $119109   |

CODE_11910A:
    STY $02             ; $11910A   |
    LDA $1134,x         ; $11910C   |
    CLC                 ; $11910F   |
    ADC $01             ; $119110   |
    STA $1134,x         ; $119112   |
    LDA #$00            ; $119115   |
    ROL A               ; $119117   |
    PHA                 ; $119118   |
    ROR A               ; $119119   |
    LDA $70E2,x         ; $11911A   |
    ADC $00             ; $11911D   |
    STA $70E2,x         ; $11911F   |
    LDA $70E3,x         ; $119122   |
    ADC $02             ; $119125   |
    STA $70E3,x         ; $119127   |
    PLA                 ; $11912A   |
    CLC                 ; $11912B   |
    ADC $00             ; $11912C   |
    RTS                 ; $11912E   |

CODE_11912F:
    LDA $0D0F           ; $11912F   |
    BNE CODE_119168     ; $119132   |

CODE_119134:
    REP #$20            ; $119134   |
    LDA $1100           ; $119136   |
    STA $3016           ; $119139   |
    LDA $10FE           ; $11913C   |
    STA $300C           ; $11913F   |
    LDA $1102           ; $119142   |
    STA $300A           ; $119145   |
    LDA #$0054          ; $119148   |
    STA $301A           ; $11914B   |
    LDA #$C0E1          ; $11914E   |
    STA $3018           ; $119151   |
    STZ $3006           ; $119154   |
    STZ $3004           ; $119157   |
    LDX #$08            ; $11915A   |
    LDA #$8945          ; $11915C   |
    JSL $7EDE44         ; $11915F   | GSU init
    INC $0CF9           ; $119163   |
    SEP #$30            ; $119166   |

CODE_119168:
    RTS                 ; $119168   |

CODE_119169:
    REP #$30            ; $119169   |
    LDA $10E6           ; $11916B   |
    BEQ CODE_119175     ; $11916E   |
    LDA #$009E          ; $119170   |
    BRA CODE_119178     ; $119173   |

CODE_119175:
    LDA #$009D          ; $119175   |

CODE_119178:
    STA $00             ; $119178   |
    ASL A               ; $11917A   |
    CLC                 ; $11917B   |
    ADC $00             ; $11917C   |
    TAX                 ; $11917E   |
    LDA $06F95E,x       ; $11917F   |
    STA $3012           ; $119183   |
    LDA $06F960,x       ; $119186   |
    AND #$00FF          ; $11918A   |
    STA $3008           ; $11918D   |
    LDA #$4E00          ; $119190   |
    STA $3014           ; $119193   |
    SEP #$10            ; $119196   |
    LDX #$08            ; $119198   |
    LDA #$A980          ; $11919A   |
    JSL $7EDE44         ; $11919D   | GSU init
    REP #$30            ; $1191A1   |
    LDX #$4E00          ; $1191A3   |
    LDA #$0070          ; $1191A6   |
    STA $01             ; $1191A9   |
    LDY #$3C00          ; $1191AB   |
    LDA #$0800          ; $1191AE   |
    JSL $00BEA6         ; $1191B1   |
    SEP #$30            ; $1191B5   |
    RTS                 ; $1191B7   |

    SEP #$20            ; $1191B8   |
    PHB                 ; $1191BA   |
    LDA #$11            ; $1191BB   |
    PHA                 ; $1191BD   |
    PLB                 ; $1191BE   |
    JSR CODE_1191C4     ; $1191BF   |
    PLB                 ; $1191C2   |
    RTL                 ; $1191C3   |

CODE_1191C4:
    SEP #$20            ; $1191C4   |
    LDA $10E2           ; $1191C6   |
    DEC A               ; $1191C9   |
    ASL A               ; $1191CA   |
    TAY                 ; $1191CB   |
    LDA $91D9,y         ; $1191CC   |
    STA $00             ; $1191CF   |
    LDA $91DA,y         ; $1191D1   |
    STA $01             ; $1191D4   |
    JMP ($0000)         ; $1191D6   |

DATA_1191D9:         dw $922A
DATA_1191DB:         dw $92B6
DATA_1191DD:         dw $91DF

    REP #$20            ; $1191DF   |
    DEC $003F           ; $1191E1   |
    INC $003D           ; $1191E4   |
    LDA $10E6           ; $1191E7   |
    BNE CODE_1191FE     ; $1191EA   |
    LDA $10FA           ; $1191EC   |
    BEQ CODE_11920D     ; $1191EF   |
    LDA $03A7           ; $1191F1   |
    CMP #$0014          ; $1191F4   |
    BEQ CODE_1191FE     ; $1191F7   |
    LDA $60C0           ; $1191F9   |
    BNE CODE_11920D     ; $1191FC   |

CODE_1191FE:
    LDA #$0001          ; $1191FE   |
    STA $10F4           ; $119201   |
    DEC $10E4           ; $119204   |
    BNE CODE_11920D     ; $119207   |
    JSL $11AD2A         ; $119209   |

CODE_11920D:
    SEP #$20            ; $11920D   |
    LDA $10FC           ; $11920F   |
    BEQ CODE_119229     ; $119212   |
    DEC $10FC           ; $119214   |
    BNE CODE_119229     ; $119217   |
    LDA $03A7           ; $119219   |
    CMP #$06            ; $11921C   |
    BCC CODE_119229     ; $11921E   |
    CMP #$14            ; $119220   |
    BCS CODE_119229     ; $119222   |
    LDA #$06            ; $119224   |
    STA $004D           ; $119226   |

CODE_119229:
    RTS                 ; $119229   |

    JSR CODE_119169     ; $11922A   |
    SEP #$20            ; $11922D   |
    LDA #$42            ; $11922F   |
    STA $4350           ; $119231   |
    LDA #$0F            ; $119234   |
    STA $4351           ; $119236   |
    LDA #$98            ; $119239   |
    STA $4352           ; $11923B   |
    LDA #$5B            ; $11923E   |
    STA $4353           ; $119240   |
    LDA #$7E            ; $119243   |
    STA $4354           ; $119245   |
    LDA #$7E            ; $119248   |
    STA $4357           ; $11924A   |
    PHB                 ; $11924D   |
    LDA #$7E            ; $11924E   |
    PHA                 ; $119250   |
    PLB                 ; $119251   |
    STZ $5040           ; $119252   |
    STZ $5042           ; $119255   |
    STZ $5BAD           ; $119258   |
    LDA #$20            ; $11925B   |
    STA $5B98           ; $11925D   |
    STA $5B9B           ; $119260   |
    STA $5B9E           ; $119263   |
    STA $5BA1           ; $119266   |
    STA $5BA4           ; $119269   |
    STA $5BA7           ; $11926C   |
    STA $5BAA           ; $11926F   |
    REP #$20            ; $119272   |
    LDA #$5040          ; $119274   |
    STA $5B99           ; $119277   |
    STA $5B9F           ; $11927A   |
    STA $5BA5           ; $11927D   |
    STA $5BAB           ; $119280   |
    LDA #$5042          ; $119283   |
    STA $5B9C           ; $119286   |
    STA $5BA2           ; $119289   |
    STA $5BA8           ; $11928C   |
    SEP #$20            ; $11928F   |
    PLB                 ; $119291   |
    LDX $10E6           ; $119292   |
    LDA $92B3,x         ; $119295   |
    STA $004D           ; $119298   |
    LDA #$20            ; $11929B   |
    TSB $094A           ; $11929D   |
    INC $10E2           ; $1192A0   |
    LDA $10F6           ; $1192A3   |
    BEQ CODE_1192AB     ; $1192A6   |
    JSR CODE_11942C     ; $1192A8   |

CODE_1192AB:
    JSR CODE_119305     ; $1192AB   |
    JSL $119CCB         ; $1192AE   |
    RTS                 ; $1192B2   |

DATA_1192B3:         db $05, $07, $06

    REP #$20            ; $1192B6   |
    LDA $10E0           ; $1192B8   |
    CLC                 ; $1192BB   |
    ADC #$0008          ; $1192BC   |
    STA $10E0           ; $1192BF   |
    CMP #$0100          ; $1192C2   |
    BCC CODE_119302     ; $1192C5   |
    SEP #$20            ; $1192C7   |
    LDA $094A           ; $1192C9   |
    EOR #$20            ; $1192CC   |
    STA $094A           ; $1192CE   |
    LDA #$01            ; $1192D1   |
    STA $003E           ; $1192D3   |
    STZ $003D           ; $1192D6   |
    LDA #$3C            ; $1192D9   |
    STA $0960           ; $1192DB   |
    STA $2108           ; $1192DE   |
    INC $10E2           ; $1192E1   |
    LDA $10E6           ; $1192E4   |
    BNE CODE_1192F4     ; $1192E7   |
    LDA $03A7           ; $1192E9   |
    CMP #$06            ; $1192EC   |
    BCC CODE_1192F4     ; $1192EE   |
    CMP #$14            ; $1192F0   |
    BCC CODE_1192F8     ; $1192F2   |

CODE_1192F4:
    LDA #$E0            ; $1192F4   |
    BRA CODE_1192FA     ; $1192F6   |

CODE_1192F8:
    LDA #$01            ; $1192F8   |

CODE_1192FA:
    STA $10E4           ; $1192FA   |
    LDA #$FF            ; $1192FD   |
    STA $10FC           ; $1192FF   |

CODE_119302:
    SEP #$20            ; $119302   |
    RTS                 ; $119304   |

CODE_119305:
    REP #$30            ; $119305   |
    LDA $7E4000         ; $119307   |
    TAX                 ; $11930B   |
    LDA $10F2           ; $11930C   |
    BEQ CODE_119314     ; $11930F   |
    LDA #$0003          ; $119311   |

CODE_119314:
    CLC                 ; $119314   |
    ADC $10E6           ; $119315   |
    ASL A               ; $119318   |
    TAY                 ; $119319   |
    LDA $9336,y         ; $11931A   |
    TAY                 ; $11931D   |

CODE_11931E:
    LDA $9340,y         ; $11931E   |
    STA $7E4002,x       ; $119321   |
    INX                 ; $119325   |
    INX                 ; $119326   |
    INY                 ; $119327   |
    INY                 ; $119328   |
    INC A               ; $119329   |
    BNE CODE_11931E     ; $11932A   |
    DEX                 ; $11932C   |
    DEX                 ; $11932D   |
    TXA                 ; $11932E   |
    STA $7E4000         ; $11932F   |
    SEP #$30            ; $119333   |
    RTS                 ; $119335   |

DATA_119336:         db $00, $00, $BA, $00, $EC, $00, $2E, $00
DATA_11933E:         db $74, $00

DATA_119340:         dw $35AC, $0011, $2520, $2521
DATA_119348:         dw $2522, $217F, $2523, $2524
DATA_119350:         dw $E532, $257F, $A530, $35CC
DATA_119358:         dw $0011, $2530, $A521, $A521
DATA_119360:         dw $217F, $2533, $2534, $2532
DATA_119368:         dw $257F, $2529, $FFFF, $35A9
DATA_119370:         dw $001D, $2527, $2525, $2521
DATA_119378:         dw $2520, $2526, $2527, $217F
DATA_119380:         dw $254E, $217F, $2523, $2524
DATA_119388:         dw $E532, $E531, $217F, $A530
DATA_119390:         dw $35C9, $001D, $2539, $2535
DATA_119398:         dw $2536, $2530, $2535, $2537
DATA_1193A0:         dw $217F, $255E, $217F, $2533
DATA_1193A8:         dw $2534, $2532, $2531, $217F
DATA_1193B0:         dw $2529, $FFFF, $35AA, $001D
DATA_1193B8:         dw $2D27, $2D25, $2D21, $2D20
DATA_1193C0:         dw $2D26, $2D27, $217F, $2D4F
DATA_1193C8:         dw $217F, $2D23, $2D24, $ED32
DATA_1193D0:         dw $ED31, $217F, $AD30, $35CA
DATA_1193D8:         dw $001D, $2D39, $2D35, $2D36
DATA_1193E0:         dw $2D30, $2D35, $2D37, $217F
DATA_1193E8:         dw $2D5F, $217F, $2D33, $2D34
DATA_1193F0:         dw $2D32, $2D31, $217F, $2D29
DATA_1193F8:         dw $FFFF, $35AC, $0013, $2D20
DATA_119400:         dw $2D21, $2D22, $217F, $2D25
DATA_119408:         dw $2D21, $ED31, $2D26, $217F
DATA_119410:         dw $AD30, $35CC, $0013, $2D30
DATA_119418:         dw $AD21, $AD21, $217F, $2D35
DATA_119420:         dw $AD21, $2D31, $2D35, $217F
DATA_119428:         dw $2D29, $FFFF

CODE_11942C:
    LDA $1170           ; $11942C   |
    SEC                 ; $11942F   |
    SBC #$03            ; $119430   |
    ASL A               ; $119432   |
    TAX                 ; $119433   |
    REP #$30            ; $119434   |

    LDA $9457,x         ; $119436   |
    TAY                 ; $119439   |
    LDA $7E4000         ; $11943A   |
    TAX                 ; $11943E   |

CODE_11943F:
    LDA $945D,y         ; $11943F   |
    STA $7E4002,x       ; $119442   |
    INX                 ; $119446   |
    INX                 ; $119447   |
    INY                 ; $119448   |
    INY                 ; $119449   |
    INC A               ; $11944A   |
    BNE CODE_11943F     ; $11944B   |
    DEX                 ; $11944D   |
    DEX                 ; $11944E   |
    TXA                 ; $11944F   |
    STA $7E4000         ; $119450   |
    SEP #$30            ; $119454   |
    RTS                 ; $119456   |

DATA_119457:         db $00, $00, $5E, $00, $CC, $00

DATA_11945D:         dw $34C5, $8007, $A555, $2545
DATA_119465:         dw $2545, $2545, $34DA, $8007
DATA_11946D:         dw $E555, $6545, $6545, $6545
DATA_119475:         dw $34C6, $4027, $A556, $3547
DATA_11947D:         dw $4023, $2560, $3567, $4023
DATA_119485:         dw $2560, $68E7, $4023, $00FF
DATA_11948D:         dw $6907, $4023, $00FF, $6927
DATA_119495:         dw $4023, $00FF, $3545, $0003
DATA_11949D:         dw $2565, $2566, $3565, $0003
DATA_1194A5:         dw $2555, $2576, $3559, $0003
DATA_1194AD:         dw $6572, $6570, $3579, $0003
DATA_1194B5:         dw $6574, $6573, $FFFF, $34C3
DATA_1194BD:         dw $8007, $A555, $2545, $2545
DATA_1194C5:         dw $2545, $34DC, $8007, $E555
DATA_1194CD:         dw $6545, $6545, $6545, $34C4
DATA_1194D5:         dw $402F, $A556, $3545, $4027
DATA_1194DD:         dw $2560, $3565, $4027, $2560
DATA_1194E5:         dw $68E5, $402B, $00FF, $6905
DATA_1194ED:         dw $402B, $00FF, $6925, $402B
DATA_1194F5:         dw $00FF, $3543, $0007, $2570
DATA_1194FD:         dw $2571, $2567, $2566, $3563
DATA_119505:         dw $0007, $2573, $2574, $2575
DATA_11950D:         dw $2576, $3559, $0007, $6572
DATA_119515:         dw $2571, $2571, $6570, $3579
DATA_11951D:         dw $0007, $6574, $2574, $2574
DATA_119525:         dw $6573, $FFFF, $34C1, $8007
DATA_11952D:         dw $A555, $2545, $2545, $2545
DATA_119535:         dw $34DE, $8007, $E555, $6545
DATA_11953D:         dw $6545, $6545, $34C2, $4037
DATA_119545:         dw $A556, $3543, $402B, $2560
DATA_11954D:         dw $3563, $402B, $2560, $68E3
DATA_119555:         dw $4033, $00FF, $6903, $4033
DATA_11955D:         dw $00FF, $6923, $4033, $00FF
DATA_119565:         dw $3541, $000B, $2570, $2571
DATA_11956D:         dw $2571, $2571, $2567, $2566
DATA_119575:         dw $3561, $000B, $2573, $2574
DATA_11957D:         dw $2574, $2574, $2575, $2576
DATA_119585:         dw $3559, $000B, $6572, $2571
DATA_11958D:         dw $2571, $2571, $2571, $6570
DATA_119595:         dw $3579, $000B, $6574, $2574
DATA_11959D:         dw $2574, $2574, $2574, $6573
DATA_1195A5:         dw $FFFF

CODE_1195A7:
    REP #$20            ; $1195A7   |
    LDA $118C           ; $1195A9   |
    STA $116C           ; $1195AC   |
    STZ $1190           ; $1195AF   |
    LDA #$0048          ; $1195B2   |
    STA $1192           ; $1195B5   |
    STZ $116E           ; $1195B8   |
    JSR CODE_119BF4     ; $1195BB   |
    REP #$20            ; $1195BE   |
    LDA $1170           ; $1195C0   |
    ASL A               ; $1195C3   |
    TAX                 ; $1195C4   |

CODE_1195C5:
    JSL $008408         ; $1195C5   |
    LDA $7970           ; $1195C9   |
    AND #$000E          ; $1195CC   |
    TAY                 ; $1195CF   |
    LDA $96B7,y         ; $1195D0   |
    CMP $1174,x         ; $1195D3   |
    BEQ CODE_1195C5     ; $1195D6   |
    STA $1172,x         ; $1195D8   |
    LDA $96C7,y         ; $1195DB   |
    STA $117E,x         ; $1195DE   |
    DEX                 ; $1195E1   |
    DEX                 ; $1195E2   |
    BPL CODE_1195C5     ; $1195E3   |
    SEP #$20            ; $1195E5   |
    RTS                 ; $1195E7   |

CODE_1195E8:
    REP #$30            ; $1195E8   |
    LDX $1170           ; $1195EA   |
    LDA $9767,x         ; $1195ED   |
    AND #$00FF          ; $1195F0   |
    STA $0A             ; $1195F3   |
    LDA $7E4000         ; $1195F5   |
    TAX                 ; $1195F9   |
    LDA #$68A4          ; $1195FA   |
    CLC                 ; $1195FD   |
    ADC $0A             ; $1195FE   |
    STA $7E4002,x       ; $119600   |
    LDA $1170           ; $119604   |
    INC A               ; $119607   |
    ASL A               ; $119608   |
    ASL A               ; $119609   |
    DEC A               ; $11960A   |
    ASL A               ; $11960B   |
    DEC A               ; $11960C   |
    ORA #$4000          ; $11960D   |
    STA $7E4004,x       ; $119610   |
    LDA #$31DF          ; $119614   |
    STA $7E4006,x       ; $119617   |
    TXA                 ; $11961B   |
    CLC                 ; $11961C   |
    ADC #$0006          ; $11961D   |
    TAX                 ; $119620   |
    LDY #$0000          ; $119621   |

CODE_119624:
    TYA                 ; $119624   |
    ASL A               ; $119625   |
    ASL A               ; $119626   |
    CLC                 ; $119627   |
    ADC #$6884          ; $119628   |
    CLC                 ; $11962B   |
    ADC $0A             ; $11962C   |
    STA $7E4002,x       ; $11962E   |
    CLC                 ; $119632   |
    ADC #$0020          ; $119633   |
    STA $7E400C,x       ; $119636   |
    CLC                 ; $11963A   |
    ADC #$0020          ; $11963B   |
    STA $7E4016,x       ; $11963E   |
    LDA #$0005          ; $119642   |
    STA $7E4004,x       ; $119645   |
    STA $7E400E,x       ; $119649   |
    STA $7E4018,x       ; $11964D   |
    PHY                 ; $119651   |
    TYA                 ; $119652   |
    ASL A               ; $119653   |
    TAY                 ; $119654   |
    LDA $117E,y         ; $119655   |
    TAY                 ; $119658   |
    LDA $96D7,y         ; $119659   |
    STA $7E4006,x       ; $11965C   |
    LDA $96D9,y         ; $119660   |
    STA $7E4008,x       ; $119663   |
    LDA $96DB,y         ; $119667   |
    STA $7E400A,x       ; $11966A   |
    LDA $96DD,y         ; $11966E   |
    STA $7E4010,x       ; $119671   |
    LDA $96DF,y         ; $119675   |
    STA $7E4012,x       ; $119678   |
    LDA $96E1,y         ; $11967C   |
    STA $7E4014,x       ; $11967F   |
    LDA $96E3,y         ; $119683   |
    STA $7E401A,x       ; $119686   |
    LDA $96E5,y         ; $11968A   |
    STA $7E401C,x       ; $11968D   |
    LDA $96E7,y         ; $119691   |
    STA $7E401E,x       ; $119694   |
    PLY                 ; $119698   |
    TXA                 ; $119699   |
    CLC                 ; $11969A   |
    ADC #$001E          ; $11969B   |
    TAX                 ; $11969E   |
    CPY $1170           ; $11969F   |
    BEQ CODE_1196A8     ; $1196A2   |
    INY                 ; $1196A4   |
    JMP CODE_119624     ; $1196A5   |

CODE_1196A8:
    LDA #$FFFF          ; $1196A8   |
    STA $7E4002,x       ; $1196AB   |
    TXA                 ; $1196AF   |
    STA $7E4000         ; $1196B0   |
    SEP #$30            ; $1196B4   |
    RTS                 ; $1196B6   |

DATA_1196B7:         dw $0100, $0200, $0400, $0800
DATA_1196BF:         dw $8000, $4000, $0080, $0040

DATA_1196C7:         dw $0000, $0012, $0024, $0036
DATA_1196CF:         dw $0048, $005A, $006C, $007E

DATA_1196D7:         dw $3DCC, $3DCD, $75CC, $3DDC
DATA_1196DF:         dw $3DDD, $75DC, $BDCC, $BDCD
DATA_1196E7:         dw $F5CC, $35CC, $3DCD, $7DCC
DATA_1196EF:         dw $35DC, $3DDD, $7DDC, $B5CC
DATA_1196F7:         dw $BDCD, $FDCC, $3DCC, $3DCD
DATA_1196FF:         dw $7DCC, $3DDC, $3DDD, $7DDC
DATA_119707:         dw $B5CC, $B5CD, $F5CC, $35CC
DATA_11970F:         dw $35CD, $75CC, $3DDC, $3DDD
DATA_119717:         dw $7DDC, $BDCC, $BDCD, $FDCC
DATA_11971F:         dw $29CE, $29CF, $69CE, $29DE
DATA_119727:         dw $29EF, $69DE, $A9CE, $A9CF
DATA_11972F:         dw $E9CE, $2DCE, $2DCF, $6DCE
DATA_119737:         dw $2DDE, $2DFE, $6DDE, $ADCE
DATA_11973F:         dw $ADCF, $EDCE, $35CE, $35CF
DATA_119747:         dw $75CE, $35DE, $35EE, $75DE
DATA_11974F:         dw $B5CE, $B5CF, $F5CE, $31CE
DATA_119757:         dw $31CF, $71CE, $31DE, $31FF
DATA_11975F:         dw $71DE, $B1CE, $B1CF, $F1CE
DATA_119767:         dw $0000, $6400, $6062

CODE_11976D:
    REP #$30            ; $11976D   |
    LDX $1170           ; $11976F   |
    LDA $9767,x         ; $119772   |
    AND #$00FF          ; $119775   |
    STA $0A             ; $119778   |
    LDA $7E4000         ; $11977A   |
    TAX                 ; $11977E   |
    LDA #$68A4          ; $11977F   |
    CLC                 ; $119782   |
    ADC $0A             ; $119783   |
    STA $7E4002,x       ; $119785   |
    LDA $1170           ; $119789   |
    INC A               ; $11978C   |
    ASL A               ; $11978D   |
    ASL A               ; $11978E   |
    DEC A               ; $11978F   |
    ASL A               ; $119790   |
    DEC A               ; $119791   |
    ORA #$4000          ; $119792   |
    STA $7E4004,x       ; $119795   |
    LDA #$31DF          ; $119799   |
    STA $7E4006,x       ; $11979C   |
    TXA                 ; $1197A0   |
    CLC                 ; $1197A1   |
    ADC #$0006          ; $1197A2   |
    TAX                 ; $1197A5   |
    LDY #$0000          ; $1197A6   |

CODE_1197A9:
    TYA                 ; $1197A9   |
    ASL A               ; $1197AA   |
    ASL A               ; $1197AB   |
    CLC                 ; $1197AC   |
    ADC #$6884          ; $1197AD   |
    CLC                 ; $1197B0   |
    ADC $0A             ; $1197B1   |
    STA $7E4002,x       ; $1197B3   |
    CLC                 ; $1197B7   |
    ADC #$0020          ; $1197B8   |
    STA $7E400C,x       ; $1197BB   |
    CLC                 ; $1197BF   |
    ADC #$0020          ; $1197C0   |
    STA $7E4016,x       ; $1197C3   |
    LDA #$0005          ; $1197C7   |
    STA $7E4004,x       ; $1197CA   |
    STA $7E400E,x       ; $1197CE   |
    STA $7E4018,x       ; $1197D2   |
    LDA $9833           ; $1197D6   |
    STA $7E4006,x       ; $1197D9   |
    LDA $9835           ; $1197DD   |
    STA $7E4008,x       ; $1197E0   |
    LDA $9837           ; $1197E4   |
    STA $7E400A,x       ; $1197E7   |
    LDA $9839           ; $1197EB   |
    STA $7E4010,x       ; $1197EE   |
    LDA $983B           ; $1197F2   |
    STA $7E4012,x       ; $1197F5   |
    LDA $983D           ; $1197F9   |
    STA $7E4014,x       ; $1197FC   |
    LDA $983F           ; $119800   |
    STA $7E401A,x       ; $119803   |
    LDA $9841           ; $119807   |
    STA $7E401C,x       ; $11980A   |
    LDA $9843           ; $11980E   |
    STA $7E401E,x       ; $119811   |
    TXA                 ; $119815   |
    CLC                 ; $119816   |
    ADC #$001E          ; $119817   |
    TAX                 ; $11981A   |
    CPY $1170           ; $11981B   |
    BEQ CODE_119824     ; $11981E   |
    INY                 ; $119820   |
    JMP CODE_1197A9     ; $119821   |

CODE_119824:
    LDA #$FFFF          ; $119824   |
    STA $7E4002,x       ; $119827   |
    TXA                 ; $11982B   |
    STA $7E4000         ; $11982C   |
    SEP #$30            ; $119830   |
    RTS                 ; $119832   |

DATA_119833:         dw $75ED, $35EC, $35ED, $35FB
DATA_11983B:         dw $35FC, $35FD, $34FF, $35EB
DATA_119843:         dw $34FF

CODE_119845:
    LDA $118A           ; $119845   |
    BEQ CODE_119859     ; $119848   |
    DEC $118A           ; $11984A   |
    BNE CODE_119855     ; $11984D   |
    STZ $116E           ; $11984F   |
    JSR CODE_1195E8     ; $119852   |

CODE_119855:
    JSR CODE_119B79     ; $119855   |
    RTS                 ; $119858   |

CODE_119859:
    JSR CODE_119B99     ; $119859   |
    REP #$20            ; $11985C   |
    DEC $116C           ; $11985E   |
    BNE CODE_119887     ; $119861   |

CODE_119863:
    LDA #$0090          ; $119863   |\ play sound #$0090
    JSL $0085D2         ; $119866   |/
    LDA #$0020          ; $11986A   |
    STA $118A           ; $11986D   |
    LDA $118C           ; $119870   |
    STA $116C           ; $119873   |
    REP #$20            ; $119876   |
    LDA #$0048          ; $119878   |
    STA $1192           ; $11987B   |
    STZ $1190           ; $11987E   |
    JSR CODE_119BF4     ; $119881   |
    JMP CODE_1198FF     ; $119884   |

CODE_119887:
    JSR CODE_119AC6     ; $119887   |
    REP #$20            ; $11988A   |
    LDA $116E           ; $11988C   |
    ASL A               ; $11988F   |
    TAX                 ; $119890   |
    LDA $37             ; $119891   |
    BEQ CODE_1198FF     ; $119893   |
    CMP $1172,x         ; $119895   |
    BNE CODE_119863     ; $119898   |
    LDA #$008F          ; $11989A   |\ play sound #$008F
    JSL $0085D2         ; $11989D   |/
    INC $116E           ; $1198A1   |
    LDA $1170           ; $1198A4   |
    CMP $116E           ; $1198A7   |
    BCC CODE_1198B1     ; $1198AA   |
    JSR CODE_119902     ; $1198AC   |
    BRA CODE_1198FF     ; $1198AF   |

CODE_1198B1:
    LDA #$0013          ; $1198B1   |\ play sound #$0013
    JSL $0085D2         ; $1198B4   |/
    LDA #$0008          ; $1198B8   |\ play sound #$0008
    JSL $0085D2         ; $1198BB   |/
    LDA #$0034          ; $1198BF   |\ play sound #$0034
    JSL $0085D2         ; $1198C2   |/
    SEP #$20            ; $1198C6   |
    LDA #$02            ; $1198C8   |
    STA $7978           ; $1198CA   |
    LDA #$01            ; $1198CD   |
    STA $797C           ; $1198CF   |
    STZ $1144           ; $1198D2   |
    STZ $1154           ; $1198D5   |
    LDA #$FD            ; $1198D8   |
    STA $1105           ; $1198DA   |
    LDA #$FD            ; $1198DD   |
    STA $1109           ; $1198DF   |
    STZ $1104           ; $1198E2   |
    STZ $1108           ; $1198E5   |
    STZ $1124           ; $1198E8   |
    STZ $1128           ; $1198EB   |
    LDA #$10            ; $1198EE   |
    STA $7224           ; $1198F0   |
    STZ $1138           ; $1198F3   |
    STZ $1168           ; $1198F6   |
    STZ $116A           ; $1198F9   |
    JSR CODE_11942C     ; $1198FC   |

CODE_1198FF:
    SEP #$20            ; $1198FF   |
    RTS                 ; $119901   |

CODE_119902:
    REP #$30            ; $119902   |
    LDA $1170           ; $119904   |
    DEC A               ; $119907   |
    DEC A               ; $119908   |
    DEC A               ; $119909   |
    ASL A               ; $11990A   |
    STA $00             ; $11990B   |
    ASL A               ; $11990D   |
    ASL A               ; $11990E   |
    CLC                 ; $11990F   |
    ADC $00             ; $119910   |
    STA $00             ; $119912   |
    LDA $116E           ; $119914   |
    DEC A               ; $119917   |
    ASL A               ; $119918   |
    CLC                 ; $119919   |
    ADC $00             ; $11991A   |
    TAY                 ; $11991C   |
    LDA $7E4000         ; $11991D   |
    TAX                 ; $119921   |
    LDA $99DA,y         ; $119922   |
    STA $7E4002,x       ; $119925   |
    CLC                 ; $119929   |
    ADC #$0020          ; $11992A   |
    STA $7E400C,x       ; $11992D   |
    CLC                 ; $119931   |
    ADC #$0020          ; $119932   |
    STA $7E4016,x       ; $119935   |
    LDA #$0005          ; $119939   |
    STA $7E4004,x       ; $11993C   |
    STA $7E400E,x       ; $119940   |
    STA $7E4018,x       ; $119944   |
    LDA $116E           ; $119948   |
    DEC A               ; $11994B   |
    ASL A               ; $11994C   |
    TAY                 ; $11994D   |
    LDA $117E,y         ; $11994E   |
    TAY                 ; $119951   |
    LDA $96D7,y         ; $119952   |
    AND #$E3FF          ; $119955   |
    ORA #$1800          ; $119958   |
    STA $7E4006,x       ; $11995B   |
    LDA $96D9,y         ; $11995F   |
    AND #$E3FF          ; $119962   |
    ORA #$1800          ; $119965   |
    STA $7E4008,x       ; $119968   |
    LDA $96DB,y         ; $11996C   |
    AND #$E3FF          ; $11996F   |
    ORA #$1800          ; $119972   |
    STA $7E400A,x       ; $119975   |
    LDA $96DD,y         ; $119979   |
    AND #$E3FF          ; $11997C   |
    ORA #$1800          ; $11997F   |
    STA $7E4010,x       ; $119982   |
    LDA $96DF,y         ; $119986   |
    AND #$E3FF          ; $119989   |
    ORA #$1800          ; $11998C   |
    STA $7E4012,x       ; $11998F   |
    LDA $96E1,y         ; $119993   |
    AND #$E3FF          ; $119996   |
    ORA #$1800          ; $119999   |
    STA $7E4014,x       ; $11999C   |
    LDA $96E3,y         ; $1199A0   |
    AND #$E3FF          ; $1199A3   |
    ORA #$1800          ; $1199A6   |
    STA $7E401A,x       ; $1199A9   |
    LDA $96E5,y         ; $1199AD   |
    AND #$E3FF          ; $1199B0   |
    ORA #$1800          ; $1199B3   |
    STA $7E401C,x       ; $1199B6   |
    LDA $96E7,y         ; $1199BA   |
    AND #$E3FF          ; $1199BD   |
    ORA #$1800          ; $1199C0   |
    STA $7E401E,x       ; $1199C3   |
    LDA #$FFFF          ; $1199C7   |
    STA $7E4020,x       ; $1199CA   |
    TXA                 ; $1199CE   |
    CLC                 ; $1199CF   |
    ADC #$001E          ; $1199D0   |
    STA $7E4000         ; $1199D3   |
    SEP #$30            ; $1199D7   |
    RTS                 ; $1199D9   |

DATA_1199DA:         dw $68E8, $68EC, $68F0, $0000
DATA_1199E2:         dw $0000, $68E6, $68EA, $68EE
DATA_1199EA:         dw $68F2, $0000, $68E4, $68E8
DATA_1199F2:         dw $68EC, $68F0, $68F4

CODE_1199F8:
    REP #$30            ; $1199F8   |
    LDA $1170           ; $1199FA   |
    DEC A               ; $1199FD   |
    DEC A               ; $1199FE   |
    DEC A               ; $1199FF   |
    ASL A               ; $119A00   |
    STA $00             ; $119A01   |
    ASL A               ; $119A03   |
    ASL A               ; $119A04   |
    CLC                 ; $119A05   |
    ADC $00             ; $119A06   |
    STA $00             ; $119A08   |
    LDA $116E           ; $119A0A   |
    DEC A               ; $119A0D   |
    ASL A               ; $119A0E   |
    CLC                 ; $119A0F   |
    ADC $00             ; $119A10   |
    TAY                 ; $119A12   |
    LDA $7E4000         ; $119A13   |
    TAX                 ; $119A17   |
    LDA $99DA,y         ; $119A18   |
    STA $7E4002,x       ; $119A1B   |
    CLC                 ; $119A1F   |
    ADC #$0020          ; $119A20   |
    STA $7E400C,x       ; $119A23   |
    CLC                 ; $119A27   |
    ADC #$0020          ; $119A28   |
    STA $7E4016,x       ; $119A2B   |
    LDA #$0005          ; $119A2F   |
    STA $7E4004,x       ; $119A32   |
    STA $7E400E,x       ; $119A36   |
    STA $7E4018,x       ; $119A3A   |
    LDA $9833           ; $119A3E   |
    AND #$E3FF          ; $119A41   |
    ORA #$1800          ; $119A44   |
    STA $7E4006,x       ; $119A47   |
    LDA $9835           ; $119A4B   |
    AND #$E3FF          ; $119A4E   |
    ORA #$1800          ; $119A51   |
    STA $7E4008,x       ; $119A54   |
    LDA $9837           ; $119A58   |
    AND #$E3FF          ; $119A5B   |
    ORA #$1800          ; $119A5E   |
    STA $7E400A,x       ; $119A61   |
    LDA $9839           ; $119A65   |
    AND #$E3FF          ; $119A68   |
    ORA #$1800          ; $119A6B   |
    STA $7E4010,x       ; $119A6E   |
    LDA $983B           ; $119A72   |
    AND #$E3FF          ; $119A75   |
    ORA #$1800          ; $119A78   |
    STA $7E4012,x       ; $119A7B   |
    LDA $983D           ; $119A7F   |
    AND #$E3FF          ; $119A82   |
    ORA #$1800          ; $119A85   |
    STA $7E4014,x       ; $119A88   |
    LDA $983F           ; $119A8C   |
    AND #$E3FF          ; $119A8F   |
    ORA #$1800          ; $119A92   |
    STA $7E401A,x       ; $119A95   |
    LDA $9841           ; $119A99   |
    AND #$E3FF          ; $119A9C   |
    ORA #$1800          ; $119A9F   |
    STA $7E401C,x       ; $119AA2   |
    LDA $9843           ; $119AA6   |
    AND #$E3FF          ; $119AA9   |
    ORA #$1800          ; $119AAC   |
    STA $7E401E,x       ; $119AAF   |
    LDA #$FFFF          ; $119AB3   |
    STA $7E4020,x       ; $119AB6   |
    TXA                 ; $119ABA   |
    CLC                 ; $119ABB   |
    ADC #$001E          ; $119ABC   |
    STA $7E4000         ; $119ABF   |
    SEP #$30            ; $119AC3   |
    RTS                 ; $119AC5   |

CODE_119AC6:
    JSR CODE_119ACC     ; $119AC6   |
    JMP CODE_119B1E     ; $119AC9   |

CODE_119ACC:
    REP #$30            ; $119ACC   |
    LDY $6092           ; $119ACE   |
    LDA $1170           ; $119AD1   |
    DEC A               ; $119AD4   |
    DEC A               ; $119AD5   |
    DEC A               ; $119AD6   |
    ASL A               ; $119AD7   |
    TAX                 ; $119AD8   |
    LDA $9B73,x         ; $119AD9   |
    STA $00             ; $119ADC   |
    LDA $116E           ; $119ADE   |
    ASL A               ; $119AE1   |
    ASL A               ; $119AE2   |
    ASL A               ; $119AE3   |
    ASL A               ; $119AE4   |
    ASL A               ; $119AE5   |
    CLC                 ; $119AE6   |
    ADC $00             ; $119AE7   |
    STA $6000,y         ; $119AE9   |
    STA $6010,y         ; $119AEC   |
    CLC                 ; $119AEF   |
    ADC #$0008          ; $119AF0   |
    STA $6008,y         ; $119AF3   |
    STA $6018,y         ; $119AF6   |
    LDA $118A           ; $119AF9   |
    BNE CODE_119B0A     ; $119AFC   |
    LDA $30             ; $119AFE   |
    AND #$0010          ; $119B00   |
    BEQ CODE_119B0A     ; $119B03   |
    LDA #$0026          ; $119B05   |
    BRA CODE_119B0D     ; $119B08   |

CODE_119B0A:
    LDA #$0024          ; $119B0A   |

CODE_119B0D:
    STA $6002,y         ; $119B0D   |
    STA $600A,y         ; $119B10   |
    CLC                 ; $119B13   |
    ADC #$0008          ; $119B14   |
    STA $6012,y         ; $119B17   |
    STA $601A,y         ; $119B1A   |
    RTS                 ; $119B1D   |

CODE_119B1E:
    LDA $30             ; $119B1E   |
    AND #$0010          ; $119B20   |
    BNE CODE_119B3F     ; $119B23   |
    LDA #$3300          ; $119B25   |
    STA $6004,y         ; $119B28   |
    ORA #$0010          ; $119B2B   |
    STA $6014,y         ; $119B2E   |
    LDA #$7300          ; $119B31   |
    STA $600C,y         ; $119B34   |
    ORA #$0010          ; $119B37   |
    STA $601C,y         ; $119B3A   |
    BRA CODE_119B57     ; $119B3D   |

CODE_119B3F:
    LDA #$3300          ; $119B3F   |
    STA $6004,y         ; $119B42   |
    ORA #$0011          ; $119B45   |
    STA $6014,y         ; $119B48   |
    LDA #$7300          ; $119B4B   |
    STA $600C,y         ; $119B4E   |
    ORA #$0011          ; $119B51   |
    STA $601C,y         ; $119B54   |

CODE_119B57:
    REP #$30            ; $119B57   |
    LDA #$0000          ; $119B59   |
    STA $6006,y         ; $119B5C   |
    STA $600E,y         ; $119B5F   |
    STA $6016,y         ; $119B62   |
    STA $601E,y         ; $119B65   |
    TYA                 ; $119B68   |
    CLC                 ; $119B69   |
    ADC #$0020          ; $119B6A   |
    STA $6092           ; $119B6D   |
    SEP #$30            ; $119B70   |
    RTS                 ; $119B72   |

DATA_119B73:         dw $0044, $0034, $0024

CODE_119B79:
    JSR CODE_119ACC     ; $119B79   |
    REP #$30            ; $119B7C   |
    LDA #$3901          ; $119B7E   |
    STA $6004,y         ; $119B81   |
    LDA #$7901          ; $119B84   |
    STA $600C,y         ; $119B87   |
    LDA #$B901          ; $119B8A   |
    STA $6014,y         ; $119B8D   |

    LDA #$01            ; $119B90   |
    SBC $1C99,y         ; $119B92   |
    RTS                 ; $119B95   |

    JMP CODE_119B57     ; $119B96   |

CODE_119B99:
    INC $1191           ; $119B99   |
    REP #$30            ; $119B9C   |
    LDA $1190           ; $119B9E   |
    SEC                 ; $119BA1   |
    SBC $118E           ; $119BA2   |
    BMI CODE_119BE9     ; $119BA5   |
    STA $1190           ; $119BA7   |
    DEC $1192           ; $119BAA   |
    LDA $7E4000         ; $119BAD   |
    TAX                 ; $119BB1   |
    LDA #$0047          ; $119BB2   |
    SEC                 ; $119BB5   |
    SBC $1192           ; $119BB6   |
    LSR A               ; $119BB9   |
    LSR A               ; $119BBA   |
    CLC                 ; $119BBB   |
    ADC #$3547          ; $119BBC   |
    STA $7E4002,x       ; $119BBF   |
    LDA #$0001          ; $119BC3   |
    STA $7E4004,x       ; $119BC6   |
    LDA $1192           ; $119BCA   |
    AND #$0003          ; $119BCD   |
    ASL A               ; $119BD0   |
    TAY                 ; $119BD1   |
    LDA $9BEC,y         ; $119BD2   |
    STA $7E4006,x       ; $119BD5   |
    LDA #$FFFF          ; $119BD9   |
    STA $7E4008,x       ; $119BDC   |
    TXA                 ; $119BE0   |
    CLC                 ; $119BE1   |
    ADC #$0006          ; $119BE2   |
    STA $7E4000         ; $119BE5   |

CODE_119BE9:
    SEP #$30            ; $119BE9   |
    RTS                 ; $119BEB   |

DATA_119BEC:         dw $2564, $2563, $2562, $2561

CODE_119BF4:
    REP #$30            ; $119BF4   |
    LDY #$0000          ; $119BF6   |
    LDA $7E4000         ; $119BF9   |
    TAX                 ; $119BFD   |

CODE_119BFE:
    LDA $9C1F,y         ; $119BFE   |
    STA $7E4002,x       ; $119C01   |
    INX                 ; $119C05   |
    INX                 ; $119C06   |
    INY                 ; $119C07   |
    INY                 ; $119C08   |
    INC A               ; $119C09   |
    BNE CODE_119BFE     ; $119C0A   |
    DEX                 ; $119C0C   |
    DEX                 ; $119C0D   |
    TXA                 ; $119C0E   |
    STA $7E4000         ; $119C0F   |
    LDA #$0048          ; $119C13   |
    STA $1192           ; $119C16   |
    STZ $1190           ; $119C19   |
    SEP #$30            ; $119C1C   |
    RTS                 ; $119C1E   |

DATA_119C1F:         dw $3547, $4023, $2556, $FFFF

CODE_119C29:
    LDA $9CC4,x         ; $119C29   |
    STA $7E5B18,x       ; $119C2C   |
    BEQ CODE_119C35     ; $119C30   |
    INX                 ; $119C32   |
    BRA CODE_119C29     ; $119C33   |

CODE_119C35:
    REP #$30            ; $119C35   |
    LDX #$007E          ; $119C37   |
    LDA #$00FF          ; $119C3A   |

CODE_119C3D:
    STA $7E552C,x       ; $119C3D   |
    STA $7E55AC,x       ; $119C41   |
    STA $7E562C,x       ; $119C45   |
    STA $7E56AC,x       ; $119C49   |
    DEX                 ; $119C4D   |
    DEX                 ; $119C4E   |
    BPL CODE_119C3D     ; $119C4F   |
    SEP #$20            ; $119C51   |
    LDX #$2641          ; $119C53   |
    STX $4330           ; $119C56   |
    LDX #$5B18          ; $119C59   |
    STX $4332           ; $119C5C   |
    LDA #$7E            ; $119C5F   |
    STA $4334           ; $119C61   |
    LDA #$7E            ; $119C64   |
    STA $4337           ; $119C66   |
    LDA #$30            ; $119C69   |
    STA $0964           ; $119C6B   |
    LDA #$30            ; $119C6E   |
    STA $0965           ; $119C70   |
    LDA #$20            ; $119C73   |
    STA $0966           ; $119C75   |
    LDA #$00            ; $119C78   |
    STA $0969           ; $119C7A   |
    LDA #$00            ; $119C7D   |
    STA $096A           ; $119C7F   |
    LDA #$17            ; $119C82   |
    STA $0967           ; $119C84   |
    LDA #$02            ; $119C87   |
    STA $0968           ; $119C89   |
    LDA #$10            ; $119C8C   |
    STA $096B           ; $119C8E   |
    LDA #$72            ; $119C91   |
    STA $096C           ; $119C93   |
    REP #$20            ; $119C96   |
    LDA $1170           ; $119C98   |
    SEC                 ; $119C9B   |
    SBC #$0003          ; $119C9C   |
    ASL A               ; $119C9F   |
    TAX                 ; $119CA0   |
    LDA $9CBE,x         ; $119CA1   |
    LDX #$0058          ; $119CA4   |

CODE_119CA7:
    STA $7E552C,x       ; $119CA7   |
    INX                 ; $119CAB   |
    INX                 ; $119CAC   |
    CPX #$00A0          ; $119CAD   |
    BNE CODE_119CA7     ; $119CB0   |
    LDA $094A           ; $119CB2   |
    ORA #$0008          ; $119CB5   |
    STA $094A           ; $119CB8   |
    SEP #$30            ; $119CBB   |
    RTL                 ; $119CBD   |

DATA_119CBE:         dw $D030, $E020, $F010

DATA_119CC4:         db $F8, $2C, $55, $F8, $1C, $56, $00

    LDX #$00            ; $119CCB   |

CODE_119CCD:
    LDA $9CC4,x         ; $119CCD   |
    STA $7E5B18,x       ; $119CD0   |
    BEQ CODE_119CD9     ; $119CD4   |
    INX                 ; $119CD6   |
    BRA CODE_119CCD     ; $119CD7   |

CODE_119CD9:
    REP #$30            ; $119CD9   |
    LDX #$007E          ; $119CDB   |
    LDA #$00FF          ; $119CDE   |

CODE_119CE1:
    STA $7E552C,x       ; $119CE1   |
    STA $7E55AC,x       ; $119CE5   |
    STA $7E562C,x       ; $119CE9   |
    STA $7E56AC,x       ; $119CED   |
    DEX                 ; $119CF1   |
    DEX                 ; $119CF2   |
    BPL CODE_119CE1     ; $119CF3   |
    SEP #$20            ; $119CF5   |
    LDX #$2641          ; $119CF7   |
    STX $4330           ; $119CFA   |
    LDX #$5B18          ; $119CFD   |
    STX $4332           ; $119D00   |
    LDA #$7E            ; $119D03   |
    STA $4334           ; $119D05   |
    LDA #$7E            ; $119D08   |
    STA $4337           ; $119D0A   |
    LDA #$30            ; $119D0D   |
    STA $0964           ; $119D0F   |
    LDA #$30            ; $119D12   |
    STA $0965           ; $119D14   |
    LDA #$20            ; $119D17   |
    STA $0966           ; $119D19   |
    LDA #$00            ; $119D1C   |
    STA $0969           ; $119D1E   |
    LDA #$00            ; $119D21   |
    STA $096A           ; $119D23   |
    LDA #$17            ; $119D26   |
    STA $0967           ; $119D28   |
    LDA #$02            ; $119D2B   |
    STA $0968           ; $119D2D   |
    LDA #$10            ; $119D30   |
    STA $096B           ; $119D32   |
    STZ $096C           ; $119D35   |
    REP #$20            ; $119D38   |
    LDA #$7F94          ; $119D3A   |
    STA $0948           ; $119D3D   |
    LDA #$FF00          ; $119D40   |
    LDX #$0000          ; $119D43   |

CODE_119D46:
    STA $7E552C,x       ; $119D46   |
    INX                 ; $119D4A   |
    INX                 ; $119D4B   |
    CPX #$01C0          ; $119D4C   |
    BNE CODE_119D46     ; $119D4F   |
    LDA #$0028          ; $119D51   |
    STA $094A           ; $119D54   |
    SEP #$30            ; $119D57   |
    RTL                 ; $119D59   |

    REP #$30            ; $119D5A   |
    LDX #$007E          ; $119D5C   |
    LDA #$00FF          ; $119D5F   |

CODE_119D62:
    STA $7E552C,x       ; $119D62   |
    STA $7E55AC,x       ; $119D66   |
    STA $7E562C,x       ; $119D6A   |
    STA $7E56AC,x       ; $119D6E   |
    DEX                 ; $119D72   |
    DEX                 ; $119D73   |
    BPL CODE_119D62     ; $119D74   |
    SEP #$30            ; $119D76   |
    LDA $0966           ; $119D78   |
    EOR #$03            ; $119D7B   |
    STA $0966           ; $119D7D   |
    LDA $0969           ; $119D80   |
    EOR #$10            ; $119D83   |
    STA $0969           ; $119D85   |
    LDA $094A           ; $119D88   |
    AND #$F7            ; $119D8B   |
    STA $094A           ; $119D8D   |
    RTL                 ; $119D90   |

    REP #$20            ; $119D91   |
    LDA #$0000          ; $119D93   |
    BRA CODE_119D9D     ; $119D96   |

    REP #$20            ; $119D98   |
    LDA #$0001          ; $119D9A   |

CODE_119D9D:
    STA $113C           ; $119D9D   |
    REP #$20            ; $119DA0   |
    STZ $39             ; $119DA2   |
    STZ $3B             ; $119DA4   |
    STZ $3D             ; $119DA6   |
    LDA #$0017          ; $119DA8   |
    STA $3F             ; $119DAB   |
    STZ $41             ; $119DAD   |
    STZ $43             ; $119DAF   |
    SEP #$20            ; $119DB1   |
    LDA $095F           ; $119DB3   |
    EOR #$03            ; $119DB6   |
    STA $095F           ; $119DB8   |
    STA $2107           ; $119DBB   |
    LDA $0960           ; $119DBE   |
    EOR #$03            ; $119DC1   |
    STA $0960           ; $119DC3   |
    STA $2108           ; $119DC6   |
    REP #$30            ; $119DC9   |
    LDA #$00B0          ; $119DCB   |
    STA $6090           ; $119DCE   |
    STA $1144           ; $119DD1   |
    LDA #$0020          ; $119DD4   |
    STA $608C           ; $119DD7   |
    STA $1142           ; $119DDA   |
    STZ $6CAA           ; $119DDD   |
    STA $03B6           ; $119DE0   |
    LDX #$01FE          ; $119DE3   |
    LDA #$0000          ; $119DE6   |

CODE_119DE9:
    STA $7F8000,x       ; $119DE9   |
    DEX                 ; $119DED   |
    DEX                 ; $119DEE   |
    BPL CODE_119DE9     ; $119DEF   |
    LDX #$001E          ; $119DF1   |
    LDA #$0100          ; $119DF4   |

CODE_119DF7:
    STA $7F81A0,x       ; $119DF7   |
    DEX                 ; $119DFB   |
    DEX                 ; $119DFC   |
    BPL CODE_119DF7     ; $119DFD   |
    LDX #$0160          ; $119DFF   |

CODE_119E02:
    LDA #$0100          ; $119E02   |
    STA $7F8000,x       ; $119E05   |
    STA $7F801E,x       ; $119E09   |
    TXA                 ; $119E0D   |
    SEC                 ; $119E0E   |
    SBC #$0020          ; $119E0F   |
    TAX                 ; $119E12   |
    BNE CODE_119E02     ; $119E13   |
    LDX #$0018          ; $119E15   |
    LDA #$3800          ; $119E18   |

CODE_119E1B:
    STA $7F80A0,x       ; $119E1B   |
    DEX                 ; $119E1F   |
    DEX                 ; $119E20   |
    CPX #$0006          ; $119E21   |
    BCS CODE_119E1B     ; $119E24   |
    LDA #$0100          ; $119E26   |
    STA $7F8002         ; $119E29   |
    STA $7F8004         ; $119E2D   |
    STA $7F801A         ; $119E31   |
    STA $7F801C         ; $119E35   |
    STZ $096C           ; $119E39   |
    SEP #$10            ; $119E3C   |
    LDA #$01B4          ; $119E3E   |
    JSL $03A34C         ; $119E41   |
    LDA #$01B4          ; $119E45   |
    JSL $03A34C         ; $119E48   |
    LDX #$0A            ; $119E4C   |

CODE_119E4E:
    LDA #$01B6          ; $119E4E   |
    JSL $03A34C         ; $119E51   |
    DEX                 ; $119E55   |
    BNE CODE_119E4E     ; $119E56   |
    LDA #$01B5          ; $119E58   |
    JSL $03A34C         ; $119E5B   |
    STZ $1132           ; $119E5F   |
    LDA #$0100          ; $119E62   |
    STA $1134           ; $119E65   |
    STA $1136           ; $119E68   |
    LDX #$00            ; $119E6B   |
    LDA #$F000          ; $119E6D   |
    STA $7ECE           ; $119E70   |
    STA $7ECC           ; $119E73   |
    JSR CODE_11A008     ; $119E76   |
    SEP #$30            ; $119E79   |
    JSL $0397D3         ; $119E7B   |
    LDA #$09            ; $119E7F   |
    STA $095E           ; $119E81   |
    STZ $096C           ; $119E84   |
    RTS                 ; $119E87   |

    JSL $008259         ; $119E88   |
    REP #$20            ; $119E8C   |
    LDA $608C           ; $119E8E   |
    STA $1142           ; $119E91   |
    LDA $6090           ; $119E94   |
    STA $1144           ; $119E97   |
    LDA $1104           ; $119E9A   |
    BEQ CODE_119ED0     ; $119E9D   |
    LDA $60FC           ; $119E9F   |
    AND #$0001          ; $119EA2   |
    EOR #$0001          ; $119EA5   |
    ORA $60AA           ; $119EA8   |
    BEQ CODE_119EC1     ; $119EAB   |
    STZ $0035           ; $119EAD   |
    STZ $0036           ; $119EB0   |
    STZ $0037           ; $119EB3   |
    STZ $0038           ; $119EB6   |
    LDA #$006B          ; $119EB9   |
    STA $60BE           ; $119EBC   |
    BRA CODE_119ED0     ; $119EBF   |

CODE_119EC1:
    STZ $1104           ; $119EC1   |
    LDA #$0096          ; $119EC4   |
    STA $61D6           ; $119EC7   |
    STZ $60A8           ; $119ECA   |
    STZ $60B4           ; $119ECD   |

CODE_119ED0:
    LDA $61D6           ; $119ED0   |
    CMP #$0080          ; $119ED3   |
    BCS CODE_119EDB     ; $119ED6   |
    STZ $61D6           ; $119ED8   |

CODE_119EDB:
    SEP #$20            ; $119EDB   |
    JSL $0394CF         ; $119EDD   |
    JSL $04FA67         ; $119EE1   |
    LDA $10F4           ; $119EE5   |
    BNE CODE_119EF1     ; $119EE8   |
    JSR CODE_119F13     ; $119EEA   |
    JSL $04DD9E         ; $119EED   |

CODE_119EF1:
    LDA $1104           ; $119EF1   |
    BNE CODE_119EF9     ; $119EF4   |
    JSR CODE_119F89     ; $119EF6   |

CODE_119EF9:
    LDA $0D0F           ; $119EF9   |
    BNE CODE_119F05     ; $119EFC   |
    JSL $0397D3         ; $119EFE   |
    JSR CODE_119F40     ; $119F02   |

CODE_119F05:
    REP #$20            ; $119F05   |
    LDX #$08            ; $119F07   |
    LDA #$B1EF          ; $119F09   |
    JSL $7EDE44         ; $119F0C   | GSU init
    SEP #$20            ; $119F10   |
    RTS                 ; $119F12   |

CODE_119F13:
    REP #$20            ; $119F13   |
    LDA $6090           ; $119F15   |
    BPL CODE_119F3D     ; $119F18   |
    CMP #$FFF0          ; $119F1A   |
    BCS CODE_119F3D     ; $119F1D   |
    LDA $608C           ; $119F1F   |
    CMP #$0030          ; $119F22   |
    BCS CODE_119F2F     ; $119F25   |
    STZ $60A8           ; $119F27   |
    LDA #$0030          ; $119F2A   |
    BRA CODE_119F3A     ; $119F2D   |

CODE_119F2F:
    CMP #$00C1          ; $119F2F   |
    BCC CODE_119F3A     ; $119F32   |
    STZ $60A8           ; $119F34   |
    LDA #$00C0          ; $119F37   |

CODE_119F3A:
    STA $608C           ; $119F3A   |

CODE_119F3D:
    SEP #$20            ; $119F3D   |
    RTS                 ; $119F3F   |

CODE_119F40:
    REP #$20            ; $119F40   |
    LDA $10F4           ; $119F42   |
    BEQ CODE_119F48     ; $119F45   |
    RTS                 ; $119F47   |

CODE_119F48:
    LDA $0030           ; $119F48   |
    AND #$000F          ; $119F4B   |
    BNE CODE_119F85     ; $119F4E   |
    LDA $113A           ; $119F50   |
    BNE CODE_119F6E     ; $119F53   |
    DEC $1134           ; $119F55   |
    INC $1136           ; $119F58   |
    LDA $1136           ; $119F5B   |
    CMP #$0101          ; $119F5E   |
    BCC CODE_119F85     ; $119F61   |
    LDA $113A           ; $119F63   |
    EOR #$0001          ; $119F66   |
    STA $113A           ; $119F69   |
    BRA CODE_119F85     ; $119F6C   |

CODE_119F6E:
    INC $1134           ; $119F6E   |
    DEC $1136           ; $119F71   |
    LDA $1134           ; $119F74   |
    CMP #$0101          ; $119F77   |
    BCC CODE_119F85     ; $119F7A   |
    LDA $113A           ; $119F7C   |
    EOR #$0001          ; $119F7F   |
    STA $113A           ; $119F82   |

CODE_119F85:
    JSR CODE_11A008     ; $119F85   |
    RTS                 ; $119F88   |

CODE_119F89:
    REP #$20            ; $119F89   |
    LDA $60AA           ; $119F8B   |
    BMI CODE_119FCF     ; $119F8E   |
    LDA $60D4           ; $119F90   |
    BNE CODE_119FA3     ; $119F93   |
    LDA #$0004          ; $119F95   |
    STA $00             ; $119F98   |
    JSR CODE_119FD2     ; $119F9A   |
    CPY #$00            ; $119F9D   |
    BEQ CODE_119FCF     ; $119F9F   |
    BRA CODE_119FAF     ; $119FA1   |

CODE_119FA3:
    LDA #$0008          ; $119FA3   |
    STA $00             ; $119FA6   |
    JSR CODE_119FD2     ; $119FA8   |
    CPY #$00            ; $119FAB   |
    BEQ CODE_119FCF     ; $119FAD   |

CODE_119FAF:
    LDA $7182,y         ; $119FAF   |
    SEC                 ; $119FB2   |
    SBC #$0020          ; $119FB3   |
    STA $6090           ; $119FB6   |
    LDA $72C0,y         ; $119FB9   |
    CLC                 ; $119FBC   |
    ADC $608C           ; $119FBD   |
    STA $608C           ; $119FC0   |
    LDA #$0001          ; $119FC3   |
    STA $61B4           ; $119FC6   |
    LDA #$0400          ; $119FC9   |
    STA $60AA           ; $119FCC   |

CODE_119FCF:
    SEP #$20            ; $119FCF   |
    RTS                 ; $119FD1   |

CODE_119FD2:
    LDY #$00            ; $119FD2   |
    LDX $1100           ; $119FD4   |
    JSR CODE_119FDD     ; $119FD7   |
    LDX $1102           ; $119FDA   |

CODE_119FDD:
    LDA $70E2,x         ; $119FDD   |
    SEC                 ; $119FE0   |
    SBC #$000C          ; $119FE1   |
    CMP $608C           ; $119FE4   |
    BCS CODE_11A007     ; $119FE7   |
    CLC                 ; $119FE9   |
    ADC #$0028          ; $119FEA   |
    CMP $608C           ; $119FED   |
    BCC CODE_11A007     ; $119FF0   |
    LDA $7182,x         ; $119FF2   |
    SEC                 ; $119FF5   |
    SBC #$0020          ; $119FF6   |
    CMP $6090           ; $119FF9   |
    BCS CODE_11A007     ; $119FFC   |
    CLC                 ; $119FFE   |
    ADC $00             ; $119FFF   |
    CMP $6090           ; $11A001   |
    BCC CODE_11A007     ; $11A004   |
    TXY                 ; $11A006   |

CODE_11A007:
    RTS                 ; $11A007   |

CODE_11A008:
    LDA $1132           ; $11A008   |
    STA $300A           ; $11A00B   |
    LDA $1134           ; $11A00E   |
    STA $300C           ; $11A011   |
    LDA $1136           ; $11A014   |
    STA $3016           ; $11A017   |
    LDA $03A9CE         ; $11A01A   |
    STA $3006           ; $11A01E   |
    LDA $03A9EE         ; $11A021   |
    STA $3004           ; $11A025   |
    LDA #$C0E1          ; $11A028   |
    STA $3018           ; $11A02B   |
    LDA #$0054          ; $11A02E   |
    STA $301A           ; $11A031   |
    LDX #$08            ; $11A034   |
    LDA #$84A5          ; $11A036   |
    JSL $7EDE44         ; $11A039   | GSU init
    INC $0CF9           ; $11A03D   |
    RTS                 ; $11A040   |

CODE_11A041:
    LDA $03A9D6         ; $11A041   |
    STA $3006           ; $11A045   |
    LDA $03A9F6         ; $11A048   |
    STA $3004           ; $11A04C   |
    BRA CODE_11A05F     ; $11A04F   |

CODE_11A051:
    LDA $03A9DE         ; $11A051   |
    STA $3006           ; $11A055   |
    LDA $03A9FE         ; $11A058   |
    STA $3004           ; $11A05C   |

CODE_11A05F:
    LDA $7A38,x         ; $11A05F   |
    STA $300A           ; $11A062   |
    LDA $7900,x         ; $11A065   |
    STA $300C           ; $11A068   |
    LDA $7902,x         ; $11A06B   |
    STA $3016           ; $11A06E   |
    LDA #$C0E1          ; $11A071   |
    STA $3018           ; $11A074   |
    LDA #$0054          ; $11A077   |
    STA $301A           ; $11A07A   |
    LDX #$08            ; $11A07D   |
    LDA #$84A5          ; $11A07F   |
    JSL $7EDE44         ; $11A082   | GSU init
    INC $0CF9           ; $11A086   |
    LDX $7972           ; $11A089   |
    RTS                 ; $11A08C   |

.init_mini_battle_checkered_platform
    LDY $10FE           ; $11A08D   |
    LDA $A0B2,y         ; $11A090   |
    STA $70E2,x         ; $11A093   |
    LDA $A0CA,y         ; $11A096   |
    STA $7182,x         ; $11A099   |
    TXA                 ; $11A09C   |
    STA $1100,y         ; $11A09D   |
    LDA $113C           ; $11A0A0   |
    BEQ CODE_11A0A8     ; $11A0A3   |
    LDA $A0E2,y         ; $11A0A5   |

CODE_11A0A8:
    STA $7220,x         ; $11A0A8   |
    INC $10FE           ; $11A0AB   |
    INC $10FE           ; $11A0AE   |
    RTL                 ; $11A0B1   |

DATA_11A0B2:         dw $0010, $00D8, $0010, $00D0
DATA_11A0BA:         dw $0028, $0058, $0088, $00B8
DATA_11A0C2:         dw $0010, $0050, $0090, $00D0

DATA_11A0CA:         dw $0090, $0090, $0073, $0073
DATA_11A0D2:         dw $0033, $0033, $0033, $0033
DATA_11A0DA:         dw $00B3, $00B3, $00B3, $00B3
DATA_11A0E2:         dw $0080, $FF80

.init_mini_battle_red_balloon
    LDY $10FE           ; $11A0E6   |
    LDA $A0B2,y         ; $11A0E9   |
    STA $70E2,x         ; $11A0EC   |
    LDA $A0CA,y         ; $11A0EF   |
    STA $7182,x         ; $11A0F2   |
    INC $10FE           ; $11A0F5   |
    INC $10FE           ; $11A0F8   |
    CPY #$04            ; $11A0FB   |
    BEQ CODE_11A108     ; $11A0FD   |
    CPY #$06            ; $11A0FF   |
    BNE CODE_11A10D     ; $11A101   |
    LDA $1102           ; $11A103   |
    BRA CODE_11A10B     ; $11A106   |

CODE_11A108:
    LDA $1100           ; $11A108   |

CODE_11A10B:
    STA $78,x           ; $11A10B   |

CODE_11A10D:
    STZ $7722,x         ; $11A10D   |
    RTL                 ; $11A110   |

.main_mini_battle_checkered_platform
    LDA $10F4           ; $11A111   |
    BEQ CODE_11A11A     ; $11A114   |
    STZ $7220,x         ; $11A116   |
    RTL                 ; $11A119   |

CODE_11A11A:
    LDA $70E2,x         ; $11A11A   |
    CMP #$0080          ; $11A11D   |
    BCS CODE_11A14C     ; $11A120   |
    LDA $70E2,x         ; $11A122   |
    CMP #$0050          ; $11A125   |
    BCC CODE_11A132     ; $11A128   |
    LDA #$0050          ; $11A12A   |
    STA $70E2,x         ; $11A12D   |
    BRA CODE_11A140     ; $11A130   |

CODE_11A132:
    CMP #$0010          ; $11A132   |
    BCS CODE_11A174     ; $11A135   |
    LDA #$0010          ; $11A137   |
    STA $70E2,x         ; $11A13A   |
    STZ $72C0,x         ; $11A13D   |

CODE_11A140:
    LDA $7220,x         ; $11A140   |
    EOR #$FFFF          ; $11A143   |
    INC A               ; $11A146   |
    STA $7220,x         ; $11A147   |
    BRA CODE_11A174     ; $11A14A   |

CODE_11A14C:
    LDA $70E2,x         ; $11A14C   |
    CMP #$00D0          ; $11A14F   |
    BCC CODE_11A15C     ; $11A152   |
    LDA #$00D0          ; $11A154   |
    STA $70E2,x         ; $11A157   |
    BRA CODE_11A16A     ; $11A15A   |

CODE_11A15C:
    CMP #$0090          ; $11A15C   |
    BCS CODE_11A174     ; $11A15F   |
    LDA #$0090          ; $11A161   |
    STA $70E2,x         ; $11A164   |
    STZ $72C0,x         ; $11A167   |

CODE_11A16A:
    LDA $7220,x         ; $11A16A   |
    EOR #$FFFF          ; $11A16D   |
    INC A               ; $11A170   |
    STA $7220,x         ; $11A171   |

CODE_11A174:
    RTL                 ; $11A174   |

.main_mini_battle_red_balloon
    LDA $78,x           ; $11A175   |
    BEQ CODE_11A180     ; $11A177   |
    TAY                 ; $11A179   |
    LDA $70E2,y         ; $11A17A   |
    STA $70E2,x         ; $11A17D   |

CODE_11A180:
    LDA $76,x           ; $11A180   |
    ASL A               ; $11A182   |
    TAY                 ; $11A183   |
    LDA $A193,y         ; $11A184   |
    STA $0000           ; $11A187   |
    LDA $A194,y         ; $11A18A   |
    STA $0001           ; $11A18D   |
    JMP ($0000)         ; $11A190   |

DATA_11A193:         dw $A661
DATA_11A195:         dw $A392
DATA_11A197:         dw $A3CF
DATA_11A199:         dw $A40F
DATA_11A19B:         dw $A44E
DATA_11A19D:         dw $A490
DATA_11A19F:         dw $A514
DATA_11A1A1:         dw $A333
DATA_11A1A3:         dw $A1A9
DATA_11A1A5:         dw $A1E9
DATA_11A1A7:         dw $A22B

    JSL $03AA52         ; $11A1A9   |
    LDA $7A38,x         ; $11A1AD   |
    CMP #$0020          ; $11A1B0   |
    BCC CODE_11A1BC     ; $11A1B3   |
    LDA #$0007          ; $11A1B5   |
    STA $76,x           ; $11A1B8   |
    BRA CODE_11A1C6     ; $11A1BA   |

CODE_11A1BC:
    CLC                 ; $11A1BC   |
    ADC #$0008          ; $11A1BD   |
    AND #$00FF          ; $11A1C0   |
    STA $7A38,x         ; $11A1C3   |

CODE_11A1C6:
    LDA $7902,x         ; $11A1C6   |
    CMP #$00C0          ; $11A1C9   |
    BCC CODE_11A1E5     ; $11A1CC   |
    SEC                 ; $11A1CE   |
    SBC #$0020          ; $11A1CF   |
    STA $7902,x         ; $11A1D2   |
    LDA $7900,x         ; $11A1D5   |
    CLC                 ; $11A1D8   |
    ADC #$000C          ; $11A1D9   |
    STA $7900,x         ; $11A1DC   |
    INC $7182,x         ; $11A1DF   |
    INC $7182,x         ; $11A1E2   |

CODE_11A1E5:
    JSR CODE_11A4F4     ; $11A1E5   |
    RTL                 ; $11A1E8   |

    JSL $03AA52         ; $11A1E9   |
    LDA $7A38,x         ; $11A1ED   |
    BEQ CODE_11A1BC     ; $11A1F0   |
    CMP #$00E0          ; $11A1F2   |
    BCS CODE_11A1BC     ; $11A1F5   |
    LDA #$0007          ; $11A1F7   |
    STA $76,x           ; $11A1FA   |
    BRA CODE_11A208     ; $11A1FC   |

    SEC                 ; $11A1FE   |
    SBC #$0008          ; $11A1FF   |
    AND #$00FF          ; $11A202   |
    STA $7A38,x         ; $11A205   |

CODE_11A208:
    LDA $7902,x         ; $11A208   |
    CMP #$00C0          ; $11A20B   |
    BCC CODE_11A227     ; $11A20E   |
    SEC                 ; $11A210   |
    SBC #$0020          ; $11A211   |
    STA $7902,x         ; $11A214   |
    LDA $7900,x         ; $11A217   |
    CLC                 ; $11A21A   |
    ADC #$000C          ; $11A21B   |
    STA $7900,x         ; $11A21E   |
    INC $7182,x         ; $11A221   |
    INC $7182,x         ; $11A224   |

CODE_11A227:
    JSR CODE_11A4F4     ; $11A227   |
    RTL                 ; $11A22A   |

    JSL $03AA52         ; $11A22B   |
    LDA $7902,x         ; $11A22F   |
    SEC                 ; $11A232   |
    SBC #$0020          ; $11A233   |
    CMP #$0060          ; $11A236   |
    BCS CODE_11A2B5     ; $11A239   |
    JSL $03A31E         ; $11A23B   |
    JSR CODE_11A61A     ; $11A23F   |
    CMP #$022B          ; $11A242   |
    BNE CODE_11A256     ; $11A245   |
    INC $10F4           ; $11A247   |
    LDA #$0001          ; $11A24A   |
    STA $10E6           ; $11A24D   |
    STA $10E2           ; $11A250   |
    LDA #$022B          ; $11A253   |

CODE_11A256:
    PHA                 ; $11A256   |
    JSL $008B21         ; $11A257   |
    LDA $70E2,x         ; $11A25B   |
    CLC                 ; $11A25E   |
    ADC #$0020          ; $11A25F   |
    STA $70A2,y         ; $11A262   |
    LDA $7182,x         ; $11A265   |
    CLC                 ; $11A268   |
    ADC #$0010          ; $11A269   |
    STA $7142,y         ; $11A26C   |
    PLA                 ; $11A26F   |
    PHX                 ; $11A270   |
    TYX                 ; $11A271   |
    CMP #$022B          ; $11A272   |
    BNE CODE_11A280     ; $11A275   |
    JSL $11A30D         ; $11A277   |
    JSR CODE_11A2CC     ; $11A27B   |
    BRA CODE_11A284     ; $11A27E   |

CODE_11A280:
    JSL $11A2E1         ; $11A280   |

CODE_11A284:
    PLX                 ; $11A284   |
    LDA #$01DC          ; $11A285   |
    JSL $008B21         ; $11A288   |
    PHX                 ; $11A28C   |
    LDX $112E           ; $11A28D   |
    LDA $70E2,x         ; $11A290   |
    STA $70A2,y         ; $11A293   |
    LDA $7182,x         ; $11A296   |
    CLC                 ; $11A299   |
    ADC #$0008          ; $11A29A   |
    STA $7142,y         ; $11A29D   |
    LDA #$000B          ; $11A2A0   |
    STA $7E4C,y         ; $11A2A3   |
    LDA #$0002          ; $11A2A6   |
    STA $7782,y         ; $11A2A9   |
    PLX                 ; $11A2AC   |
    LDA #$0046          ; $11A2AD   |\ play sound #$0046
    JSL $0085D2         ; $11A2B0   |/
    RTL                 ; $11A2B4   |

CODE_11A2B5:
    STA $7902,x         ; $11A2B5   |
    LDA $7900,x         ; $11A2B8   |
    CLC                 ; $11A2BB   |
    ADC #$0006          ; $11A2BC   |
    STA $7900,x         ; $11A2BF   |
    INC $7182,x         ; $11A2C2   |
    INC $7182,x         ; $11A2C5   |
    JSR CODE_11A4F4     ; $11A2C8   |
    RTL                 ; $11A2CB   |

CODE_11A2CC:
    LDA $70A2,x         ; $11A2CC   |
    CLC                 ; $11A2CF   |
    ADC #$FFF4          ; $11A2D0   |
    STA $70A2,x         ; $11A2D3   |
    LDA $7142,x         ; $11A2D6   |
    CLC                 ; $11A2D9   |
    ADC #$FFE0          ; $11A2DA   |
    STA $7142,x         ; $11A2DD   |
    RTS                 ; $11A2E0   |

    LDA #$0003          ; $11A2E1   |
    STA $7782,x         ; $11A2E4   |
    STZ $7E4E,x         ; $11A2E7   |
    LDA #$FD00          ; $11A2EA   |
    STA $71E2,x         ; $11A2ED   |
    STZ $71E0,x         ; $11A2F0   |
    LDA #$0028          ; $11A2F3   |
    STA $7502,x         ; $11A2F6   |
    LDA #$0001          ; $11A2F9   |
    STA $7462,x         ; $11A2FC   |
    LDA #$0086          ; $11A2FF   |\ play sound #$0086
    JSL $0085D2         ; $11A302   |/
    LDA #$00FF          ; $11A306   |
    STA $7462,x         ; $11A309   |
    RTL                 ; $11A30C   |

    LDA #$0002          ; $11A30D   |
    STA $7782,x         ; $11A310   |
    STA $7E4C,x         ; $11A313   |
    STZ $7E4E,x         ; $11A316   |
    STZ $7E8C,x         ; $11A319   |
    STZ $71E2,x         ; $11A31C   |
    STZ $71E0,x         ; $11A31F   |
    STZ $7502,x         ; $11A322   |
    LDA #$0001          ; $11A325   |
    STA $7462,x         ; $11A328   |
    LDA #$0086          ; $11A32B   |\ play sound #$0086
    JSL $0085D2         ; $11A32E   |/
    RTL                 ; $11A332   |

    JSL $03AA52         ; $11A333   |
    STZ $0000           ; $11A337   |
    LDA $7A38,x         ; $11A33A   |
    BEQ CODE_11A35D     ; $11A33D   |
    INC $0000           ; $11A33F   |
    CMP #$0080          ; $11A342   |
    BCS CODE_11A353     ; $11A345   |
    SEC                 ; $11A347   |
    SBC #$0004          ; $11A348   |
    AND #$00FF          ; $11A34B   |
    STA $7A38,x         ; $11A34E   |
    BRA CODE_11A35D     ; $11A351   |

CODE_11A353:
    CLC                 ; $11A353   |
    ADC #$0004          ; $11A354   |
    AND #$00FF          ; $11A357   |
    STA $7A38,x         ; $11A35A   |

CODE_11A35D:
    LDA $7902,x         ; $11A35D   |
    CMP #$0100          ; $11A360   |
    BEQ CODE_11A384     ; $11A363   |
    INC $0000           ; $11A365   |
    CLC                 ; $11A368   |
    ADC #$0010          ; $11A369   |
    CMP #$0100          ; $11A36C   |
    BCC CODE_11A374     ; $11A36F   |
    LDA #$0100          ; $11A371   |

CODE_11A374:
    STA $7902,x         ; $11A374   |
    LDA $7900,x         ; $11A377   |
    SEC                 ; $11A37A   |
    SBC #$0006          ; $11A37B   |
    STA $7900,x         ; $11A37E   |
    DEC $7182,x         ; $11A381   |

CODE_11A384:
    LDA $0000           ; $11A384   |
    BNE CODE_11A38E     ; $11A387   |
    STZ $76,x           ; $11A389   |
    STZ $7A36,x         ; $11A38B   |

CODE_11A38E:
    JSR CODE_11A4F4     ; $11A38E   |
    RTL                 ; $11A391   |

    JSL $03AA52         ; $11A392   |
    LDA $7A38,x         ; $11A396   |
    CMP #$0020          ; $11A399   |
    BCC CODE_11A3A5     ; $11A39C   |
    LDA #$0007          ; $11A39E   |
    STA $76,x           ; $11A3A1   |
    BRA CODE_11A3AF     ; $11A3A3   |

CODE_11A3A5:
    CLC                 ; $11A3A5   |
    ADC #$0004          ; $11A3A6   |
    AND #$00FF          ; $11A3A9   |
    STA $7A38,x         ; $11A3AC   |

CODE_11A3AF:
    LDA $7902,x         ; $11A3AF   |
    CMP #$00C0          ; $11A3B2   |
    BCC CODE_11A3CB     ; $11A3B5   |
    SEC                 ; $11A3B7   |
    SBC #$0010          ; $11A3B8   |
    STA $7902,x         ; $11A3BB   |
    LDA $7900,x         ; $11A3BE   |
    CLC                 ; $11A3C1   |
    ADC #$0006          ; $11A3C2   |
    STA $7900,x         ; $11A3C5   |
    INC $7182,x         ; $11A3C8   |

CODE_11A3CB:
    JSR CODE_11A4F4     ; $11A3CB   |
    RTL                 ; $11A3CE   |

    JSL $03AA52         ; $11A3CF   |
    LDA $7A38,x         ; $11A3D3   |
    CMP #$0020          ; $11A3D6   |
    BCC CODE_11A3E2     ; $11A3D9   |
    LDA #$0007          ; $11A3DB   |
    STA $76,x           ; $11A3DE   |
    BRA CODE_11A3EC     ; $11A3E0   |

CODE_11A3E2:
    CLC                 ; $11A3E2   |
    ADC #$0008          ; $11A3E3   |
    AND #$00FF          ; $11A3E6   |
    STA $7A38,x         ; $11A3E9   |

CODE_11A3EC:
    LDA $7902,x         ; $11A3EC   |
    CMP #$00C0          ; $11A3EF   |
    BCC CODE_11A40B     ; $11A3F2   |
    SEC                 ; $11A3F4   |
    SBC #$0020          ; $11A3F5   |
    STA $7902,x         ; $11A3F8   |
    LDA $7900,x         ; $11A3FB   |
    CLC                 ; $11A3FE   |
    ADC #$000C          ; $11A3FF   |
    STA $7900,x         ; $11A402   |
    INC $7182,x         ; $11A405   |
    INC $7182,x         ; $11A408   |

CODE_11A40B:
    JSR CODE_11A4F4     ; $11A40B   |
    RTL                 ; $11A40E   |

    JSL $03AA52         ; $11A40F   |
    LDA $7A38,x         ; $11A413   |
    BEQ CODE_11A424     ; $11A416   |
    CMP #$00E0          ; $11A418   |
    BCS CODE_11A424     ; $11A41B   |
    LDA #$0007          ; $11A41D   |
    STA $76,x           ; $11A420   |
    BRA CODE_11A42E     ; $11A422   |

CODE_11A424:
    SEC                 ; $11A424   |
    SBC #$0004          ; $11A425   |
    AND #$00FF          ; $11A428   |
    STA $7A38,x         ; $11A42B   |

CODE_11A42E:
    LDA $7902,x         ; $11A42E   |
    CMP #$00C0          ; $11A431   |
    BCC CODE_11A44A     ; $11A434   |
    SEC                 ; $11A436   |
    SBC #$0010          ; $11A437   |
    STA $7902,x         ; $11A43A   |
    LDA $7900,x         ; $11A43D   |
    CLC                 ; $11A440   |
    ADC #$0006          ; $11A441   |
    STA $7900,x         ; $11A444   |
    INC $7182,x         ; $11A447   |

CODE_11A44A:
    JSR CODE_11A4F4     ; $11A44A   |
    RTL                 ; $11A44D   |

    JSL $03AA52         ; $11A44E   |
    LDA $7A38,x         ; $11A452   |
    BEQ CODE_11A463     ; $11A455   |
    CMP #$00E0          ; $11A457   |
    BCS CODE_11A463     ; $11A45A   |
    LDA #$0007          ; $11A45C   |
    STA $76,x           ; $11A45F   |
    BRA CODE_11A42E     ; $11A461   |

CODE_11A463:
    SEC                 ; $11A463   |
    SBC #$0008          ; $11A464   |
    AND #$00FF          ; $11A467   |
    STA $7A38,x         ; $11A46A   |
    LDA $7902,x         ; $11A46D   |
    CMP #$00C0          ; $11A470   |
    BCC CODE_11A48C     ; $11A473   |
    SEC                 ; $11A475   |
    SBC #$0020          ; $11A476   |
    STA $7902,x         ; $11A479   |
    LDA $7900,x         ; $11A47C   |
    CLC                 ; $11A47F   |
    ADC #$000C          ; $11A480   |
    STA $7900,x         ; $11A483   |
    INC $7182,x         ; $11A486   |
    INC $7182,x         ; $11A489   |

CODE_11A48C:
    JSR CODE_11A4F4     ; $11A48C   |
    RTL                 ; $11A48F   |

    JSL $03AA52         ; $11A490   |
    LDA $7902,x         ; $11A494   |
    CMP #$00C0          ; $11A497   |
    BCC CODE_11A4AF     ; $11A49A   |
    SBC #$0010          ; $11A49C   |
    STA $7902,x         ; $11A49F   |
    LDA $7900,x         ; $11A4A2   |
    CLC                 ; $11A4A5   |
    ADC #$0006          ; $11A4A6   |
    STA $7900,x         ; $11A4A9   |
    INC $7182,x         ; $11A4AC   |

CODE_11A4AF:
    LDA $60C0           ; $11A4AF   |
    BNE CODE_11A4EB     ; $11A4B2   |
    INC $61B4           ; $11A4B4   |
    LDA #$0100          ; $11A4B7   |
    SEC                 ; $11A4BA   |
    SBC $7902,x         ; $11A4BB   |
    LSR A               ; $11A4BE   |
    LSR A               ; $11A4BF   |
    LSR A               ; $11A4C0   |
    LSR A               ; $11A4C1   |
    STA $0000           ; $11A4C2   |
    LDA #$001C          ; $11A4C5   |
    SEC                 ; $11A4C8   |
    SBC $0000           ; $11A4C9   |
    STA $0000           ; $11A4CC   |
    LDA $7182,x         ; $11A4CF   |
    SEC                 ; $11A4D2   |
    SBC $0000           ; $11A4D3   |
    STA $6090           ; $11A4D6   |
    JSR CODE_11A741     ; $11A4D9   |
    STA $76,x           ; $11A4DC   |
    CMP #$0001          ; $11A4DE   |
    BEQ CODE_11A4E8     ; $11A4E1   |
    CMP #$0003          ; $11A4E3   |
    BNE CODE_11A4F0     ; $11A4E6   |

CODE_11A4E8:
    JSR CODE_11A6F0     ; $11A4E8   |

CODE_11A4EB:
    LDA #$0007          ; $11A4EB   |
    STA $76,x           ; $11A4EE   |

CODE_11A4F0:
    JSR CODE_11A4F4     ; $11A4F0   |
    RTL                 ; $11A4F3   |

CODE_11A4F4:
    LDA $7A36,x         ; $11A4F4   |
    BPL CODE_11A4FD     ; $11A4F7   |
    JSR CODE_11A051     ; $11A4F9   |
    RTS                 ; $11A4FC   |

CODE_11A4FD:
    JSR CODE_11A041     ; $11A4FD   |
    LDA $78,x           ; $11A500   |
    BEQ CODE_11A50F     ; $11A502   |
    TAY                 ; $11A504   |
    LDA $72C0,y         ; $11A505   |
    CLC                 ; $11A508   |
    ADC $608C           ; $11A509   |
    STA $608C           ; $11A50C   |

CODE_11A50F:
    RTS                 ; $11A50F   |

DATA_11A510:         dw $0001, $0002

    JSL $03AA52         ; $11A514   |
    LDA $7902,x         ; $11A518   |
    SEC                 ; $11A51B   |
    SBC #$0020          ; $11A51C   |
    CMP #$0060          ; $11A51F   |
    BCC CODE_11A527     ; $11A522   |
    JMP CODE_11A5FA     ; $11A524   |

CODE_11A527:
    JSL $03A31E         ; $11A527   |
    JSR CODE_11A61A     ; $11A52B   |
    NOP                 ; $11A52E   |
    CMP #$022B          ; $11A52F   |
    BNE CODE_11A5B3     ; $11A532   |
    LDA $10E2           ; $11A534   |
    BEQ CODE_11A53E     ; $11A537   |
    LDA #$022C          ; $11A539   |
    BRA CODE_11A5B3     ; $11A53C   |

CODE_11A53E:
    LDA #$F0F0          ; $11A53E   |
    STA $1130           ; $11A541   |
    STZ $10E6           ; $11A544   |
    LDA #$0001          ; $11A547   |
    STA $10E2           ; $11A54A   |
    LDX $112E           ; $11A54D   |
    LDA #$0004          ; $11A550   |
    STA $7978,x         ; $11A553   |
    LDA #$0011          ; $11A556   |
    LDY #$5C            ; $11A559   |

CODE_11A55B:
    LDA $7360,y         ; $11A55B   |
    BEQ CODE_11A566     ; $11A55E   |
    DEY                 ; $11A560   |
    DEY                 ; $11A561   |
    DEY                 ; $11A562   |
    DEY                 ; $11A563   |
    BRA CODE_11A55B     ; $11A564   |

CODE_11A566:
    LDA #$0011          ; $11A566   |
    JSL $03A34E         ; $11A569   |
    BCC CODE_11A5AD     ; $11A56D   |
    LDA $113C           ; $11A56F   |
    ASL A               ; $11A572   |
    TAX                 ; $11A573   |
    LDA $A510,x         ; $11A574   |
    STA $7978,y         ; $11A577   |
    LDA #$0080          ; $11A57A   |
    STA $7182,y         ; $11A57D   |
    LDA #$0078          ; $11A580   |
    STA $70E2,y         ; $11A583   |
    TYX                 ; $11A586   |
    LDA #$022E          ; $11A587   |
    JSL $008B21         ; $11A58A   |
    LDA $70E2,x         ; $11A58E   |
    CLC                 ; $11A591   |
    ADC #$FFF0          ; $11A592   |
    STA $70A2,y         ; $11A595   |
    LDA $7182,x         ; $11A598   |
    CLC                 ; $11A59B   |
    ADC #$FFF0          ; $11A59C   |
    STA $7142,y         ; $11A59F   |
    LDA #$0003          ; $11A5A2   |
    STA $7782,y         ; $11A5A5   |
    TYX                 ; $11A5A8   |
    JSL $009ABF         ; $11A5A9   |

CODE_11A5AD:
    LDX $7972           ; $11A5AD   |
    LDA #$022B          ; $11A5B0   |

CODE_11A5B3:
    PHA                 ; $11A5B3   |
    JSL $008B21         ; $11A5B4   |
    LDA $70E2,x         ; $11A5B8   |
    CLC                 ; $11A5BB   |
    ADC #$0020          ; $11A5BC   |
    STA $70A2,y         ; $11A5BF   |
    LDA $7182,x         ; $11A5C2   |
    CLC                 ; $11A5C5   |
    ADC #$0010          ; $11A5C6   |
    STA $7142,y         ; $11A5C9   |
    LDA #$0002          ; $11A5CC   |
    STA $7782,y         ; $11A5CF   |
    PLA                 ; $11A5D2   |
    PHX                 ; $11A5D3   |
    TYX                 ; $11A5D4   |
    CMP #$022B          ; $11A5D5   |
    BNE CODE_11A5F4     ; $11A5D8   |
    JSL $11A30D         ; $11A5DA   |
    LDA $70A2,x         ; $11A5DE   |
    CLC                 ; $11A5E1   |
    ADC #$FFF4          ; $11A5E2   |
    STA $70A2,x         ; $11A5E5   |
    LDA $7142,x         ; $11A5E8   |
    CLC                 ; $11A5EB   |
    ADC #$FFE0          ; $11A5EC   |
    STA $7142,x         ; $11A5EF   |
    BRA CODE_11A5F8     ; $11A5F2   |

CODE_11A5F4:
    JSL $11A2E1         ; $11A5F4   |

CODE_11A5F8:
    PLX                 ; $11A5F8   |
    RTL                 ; $11A5F9   |

CODE_11A5FA:
    STA $7902,x         ; $11A5FA   |
    LDA $7900,x         ; $11A5FD   |
    CLC                 ; $11A600   |
    ADC #$0006          ; $11A601   |
    STA $7900,x         ; $11A604   |
    INC $7182,x         ; $11A607   |
    INC $7182,x         ; $11A60A   |
    LDA #$0200          ; $11A60D   |
    STA $60AA           ; $11A610   |
    STZ $60C0           ; $11A613   |
    JSR CODE_11A4F4     ; $11A616   |
    RTL                 ; $11A619   |

CODE_11A61A:
    PHY                 ; $11A61A   |
    JSL $008408         ; $11A61B   |
    LDY $1130           ; $11A61F   |
    BMI CODE_11A62F     ; $11A622   |
    SEP #$20            ; $11A624   |
    LDA $10             ; $11A626   |
    AND #$1F            ; $11A628   |
    CMP $A657,y         ; $11A62A   |
    BCC CODE_11A636     ; $11A62D   |

CODE_11A62F:
    REP #$20            ; $11A62F   |
    LDA #$022C          ; $11A631   |
    BRA CODE_11A652     ; $11A634   |

CODE_11A636:
    REP #$20            ; $11A636   |
    LDA #$F0F0          ; $11A638   |
    STA $1130           ; $11A63B   |
    LDY #$3C            ; $11A63E   |
    LDA #$0000          ; $11A640   |

CODE_11A643:
    STA $6EC0,y         ; $11A643   |
    STA $7782,y         ; $11A646   |
    DEY                 ; $11A649   |
    DEY                 ; $11A64A   |
    DEY                 ; $11A64B   |
    DEY                 ; $11A64C   |
    BPL CODE_11A643     ; $11A64D   |
    LDA #$022B          ; $11A64F   |

CODE_11A652:
    INC $1130           ; $11A652   |
    PLY                 ; $11A655   |
    RTS                 ; $11A656   |

DATA_11A657:         db $01, $01, $03, $03, $03, $07, $07, $0F
DATA_11A65F:         db $0F, $FF

    JSR CODE_11A665     ; $11A661   |
    RTL                 ; $11A664   |

CODE_11A665:
    LDA $60AA           ; $11A665   |
    BPL CODE_11A66D     ; $11A668   |
    JMP CODE_11A6EF     ; $11A66A   |

CODE_11A66D:
    LDA $60AB           ; $11A66D   |
    AND #$00FF          ; $11A670   |
    INC A               ; $11A673   |
    STA $0000           ; $11A674   |
    LDA $70E2,x         ; $11A677   |
    SEC                 ; $11A67A   |
    SBC #$0008          ; $11A67B   |
    CMP $608C           ; $11A67E   |
    BCS CODE_11A6EF     ; $11A681   |
    CLC                 ; $11A683   |
    ADC #$0020          ; $11A684   |
    CMP $608C           ; $11A687   |
    BCC CODE_11A6EF     ; $11A68A   |
    LDA $7182,x         ; $11A68C   |
    SEC                 ; $11A68F   |
    SBC #$001C          ; $11A690   |
    CMP $6090           ; $11A693   |
    BCS CODE_11A6EF     ; $11A696   |
    CLC                 ; $11A698   |
    ADC $0000           ; $11A699   |
    CMP $6090           ; $11A69C   |
    BCC CODE_11A6EF     ; $11A69F   |
    LDA $7182,x         ; $11A6A1   |
    SEC                 ; $11A6A4   |
    SBC #$001C          ; $11A6A5   |
    STA $6090           ; $11A6A8   |
    INC $61B4           ; $11A6AB   |
    LDA #$0001          ; $11A6AE   |
    STA $7A36,x         ; $11A6B1   |
    STZ $1104           ; $11A6B4   |
    JSR CODE_11A741     ; $11A6B7   |
    STA $76,x           ; $11A6BA   |
    JSR CODE_11A6F0     ; $11A6BC   |
    LDA #$FF00          ; $11A6BF   |
    STA $7ECE           ; $11A6C2   |
    STA $7ECC           ; $11A6C5   |
    LDA #$0008          ; $11A6C8   |
    STA $7722,x         ; $11A6CB   |
    LDA #$0100          ; $11A6CE   |
    STA $7900,x         ; $11A6D1   |
    STA $7902,x         ; $11A6D4   |
    LDA #$0000          ; $11A6D7   |
    STA $7A38,x         ; $11A6DA   |
    JSR CODE_11A041     ; $11A6DD   |
    LDA $78,x           ; $11A6E0   |
    BEQ CODE_11A6EF     ; $11A6E2   |
    TAY                 ; $11A6E4   |
    LDA $72C0,y         ; $11A6E5   |
    CLC                 ; $11A6E8   |
    ADC $608C           ; $11A6E9   |
    STA $608C           ; $11A6EC   |

CODE_11A6EF:
    RTS                 ; $11A6EF   |

CODE_11A6F0:
    CMP #$0005          ; $11A6F0   |
    BCS CODE_11A72C     ; $11A6F3   |
    ASL A               ; $11A6F5   |
    TAY                 ; $11A6F6   |
    LDA $10FA           ; $11A6F7   |
    BNE CODE_11A702     ; $11A6FA   |
    LDA #$0008          ; $11A6FC   |
    STA $60C0           ; $11A6FF   |

CODE_11A702:
    LDA $A737,y         ; $11A702   |
    STA $60AA           ; $11A705   |
    LDA $A72D,y         ; $11A708   |
    STA $60A8           ; $11A70B   |
    STA $60B4           ; $11A70E   |
    STZ $60D4           ; $11A711   |
    LDA #$0013          ; $11A714   |\ play sound #$0013
    JSL $0085D2         ; $11A717   |/
    LDA $76,x           ; $11A71B   |
    LSR A               ; $11A71D   |
    BCS CODE_11A72C     ; $11A71E   |
    STZ $61B4           ; $11A720   |
    LDA #$006B          ; $11A723   |
    STA $60BE           ; $11A726   |
    INC $1104           ; $11A729   |

CODE_11A72C:
    RTS                 ; $11A72C   |

DATA_11A72D:         dw $0000, $FF00, $FE80, $0100
DATA_11A735:         dw $0180

DATA_11A737:         dw $0000, $0000, $FC00, $0000
DATA_11A73F:         dw $FC00

CODE_11A741:
    STZ $0002           ; $11A741   |
    LDA $60AB           ; $11A744   |
    AND #$00FF          ; $11A747   |
    INC A               ; $11A74A   |
    CMP #$0008          ; $11A74B   |
    BCC CODE_11A753     ; $11A74E   |
    INC $0002           ; $11A750   |

CODE_11A753:
    LDA $70E2,x         ; $11A753   |
    SEC                 ; $11A756   |
    SBC #$0004          ; $11A757   |
    CMP $608C           ; $11A75A   |
    BCS CODE_11A772     ; $11A75D   |
    CLC                 ; $11A75F   |
    ADC #$0018          ; $11A760   |
    CMP $608C           ; $11A763   |
    BCC CODE_11A76D     ; $11A766   |
    LDA #$0005          ; $11A768   |
    BRA CODE_11A775     ; $11A76B   |

CODE_11A76D:
    LDA #$0003          ; $11A76D   |
    BRA CODE_11A775     ; $11A770   |

CODE_11A772:
    LDA #$0001          ; $11A772   |

CODE_11A775:
    CLC                 ; $11A775   |
    ADC $0002           ; $11A776   |
    RTS                 ; $11A779   |

.init_mini_battle_bandit_2
    LDA #$00C0          ; $11A77A   |
    STA $70E2,x         ; $11A77D   |
    LDA #$00C0          ; $11A780   |
    STA $7182,x         ; $11A783   |
    LDA #$0009          ; $11A786   |
    STA $7402,x         ; $11A789   |
    STX $112E           ; $11A78C   |
    RTL                 ; $11A78F   |

.main_mini_battle_bandit_2
    LDA $10F4           ; $11A790   |
    BEQ CODE_11A79E     ; $11A793   |
    STZ $7220,x         ; $11A795   |
    STZ $7222,x         ; $11A798   |
    STZ $7542,x         ; $11A79B   |

CODE_11A79E:
    JSR CODE_11AA97     ; $11A79E   |
    JSR CODE_11ABB2     ; $11A7A1   |
    STX $112E           ; $11A7A4   |
    LDA $18,x           ; $11A7A7   |
    ASL A               ; $11A7A9   |
    TAX                 ; $11A7AA   |
    JSR ($A80A,x)       ; $11A7AB   |

    LDA $18,x           ; $11A7AE   |
    CMP #$0002          ; $11A7B0   |
    BEQ CODE_11A7C1     ; $11A7B3   |
    JSR CODE_11AA00     ; $11A7B5   |
    JSR CODE_11AA47     ; $11A7B8   |
    JSR CODE_11A96A     ; $11A7BB   |
    JSR CODE_11A89B     ; $11A7BE   |

CODE_11A7C1:
    LDA $10F4           ; $11A7C1   |
    BEQ CODE_11A7D9     ; $11A7C4   |
    STZ $7220,x         ; $11A7C6   |
    STZ $7222,x         ; $11A7C9   |
    STZ $7542,x         ; $11A7CC   |
    LDA #$0009          ; $11A7CF   |
    STA $7402,x         ; $11A7D2   |
    STZ $74A2,x         ; $11A7D5   |
    RTL                 ; $11A7D8   |

CODE_11A7D9:
    LDA $18,x           ; $11A7D9   |
    CMP #$0002          ; $11A7DB   |
    BEQ CODE_11A7FD     ; $11A7DE   |
    LDA $7220,x         ; $11A7E0   |
    BPL CODE_11A7E9     ; $11A7E3   |
    EOR #$FFFF          ; $11A7E5   |
    INC A               ; $11A7E8   |

CODE_11A7E9:
    CMP #$0040          ; $11A7E9   |
    BCC CODE_11A7FD     ; $11A7EC   |
    LDA $7220,x         ; $11A7EE   |
    ROL A               ; $11A7F1   |
    ROL A               ; $11A7F2   |
    ROL A               ; $11A7F3   |
    AND #$0002          ; $11A7F4   |
    EOR #$0002          ; $11A7F7   |
    STA $7400,x         ; $11A7FA   |

CODE_11A7FD:
    LDA $70E2,x         ; $11A7FD   |
    STA $113E           ; $11A800   |
    LDA $7182,x         ; $11A803   |
    STA $1140           ; $11A806   |
    RTL                 ; $11A809   |

DATA_11A80A:         dw $AAD8
DATA_11A80C:         dw $ABAB
DATA_11A80E:         dw $A859
DATA_11A810:         dw $A82B
DATA_11A812:         dw $A814

    LDX $112E           ; $11A814   |
    STZ $7220,x         ; $11A817   |
    STZ $7222,x         ; $11A81A   |
    STZ $7542,x         ; $11A81D   |
    LDA #$0009          ; $11A820   |
    STA $7402,x         ; $11A823   |
    STZ $74A2,x         ; $11A826   |
    PLA                 ; $11A829   |
    RTL                 ; $11A82A   |

    LDX $112E           ; $11A82B   |
    LDA $110A           ; $11A82E   |
    ROL A               ; $11A831   |
    ROL A               ; $11A832   |
    ROL A               ; $11A833   |
    AND #$0002          ; $11A834   |
    TAY                 ; $11A837   |
    LDA $A855,y         ; $11A838   |
    CLC                 ; $11A83B   |
    ADC $7220,x         ; $11A83C   |
    STA $7220,x         ; $11A83F   |
    LDA $1116           ; $11A842   |
    CMP #$0004          ; $11A845   |
    BCS CODE_11A854     ; $11A848   |
    LDA #$FA00          ; $11A84A   |
    STA $7222,x         ; $11A84D   |
    INC $76,x           ; $11A850   |
    STZ $18,x           ; $11A852   |

CODE_11A854:
    RTS                 ; $11A854   |

DATA_11A855:         dw $0008, $FFF8

    LDX $112E           ; $11A859   |
    LDA $7860,x         ; $11A85C   |
    LSR A               ; $11A85F   |
    BCS CODE_11A869     ; $11A860   |
    LDA #$001A          ; $11A862   |
    STA $7402,x         ; $11A865   |
    RTS                 ; $11A868   |

CODE_11A869:
    STZ $7220,x         ; $11A869   |
    LDA $7A38,x         ; $11A86C   |
    TAY                 ; $11A86F   |
    LDA $A892,y         ; $11A870   |
    AND #$00FF          ; $11A873   |
    STA $7402,x         ; $11A876   |
    LDA $7A96,x         ; $11A879   |
    BNE CODE_11A891     ; $11A87C   |
    LDA #$0004          ; $11A87E   |
    STA $7A96,x         ; $11A881   |
    INC $7A38,x         ; $11A884   |
    LDA $7A38,x         ; $11A887   |
    CMP #$0008          ; $11A88A   |
    BCC CODE_11A891     ; $11A88D   |
    STZ $18,x           ; $11A88F   |

CODE_11A891:
    RTS                 ; $11A891   |

DATA_11A892:         db $16, $15, $16, $15, $16, $15, $16, $15

CODE_11A89A:
    RTS                 ; $11A89A   |

CODE_11A89B:
    LDA $18,x           ; $11A89B   |
    CMP #$0002          ; $11A89D   |
    BEQ CODE_11A89A     ; $11A8A0   |
    LDA $1104           ; $11A8A2   |
    BNE CODE_11A89A     ; $11A8A5   |
    LDA $1112           ; $11A8A7   |
    CMP #$0010          ; $11A8AA   |
    BCS CODE_11A89A     ; $11A8AD   |
    LDA $1118           ; $11A8AF   |
    CMP #$0010          ; $11A8B2   |
    BCS CODE_11A89A     ; $11A8B5   |
    CMP #$0006          ; $11A8B7   |
    BCC CODE_11A8FB     ; $11A8BA   |
    JSR CODE_11A94D     ; $11A8BC   |
    LDA $110C           ; $11A8BF   |
    BPL CODE_11A8E2     ; $11A8C2   |
    LDA #$0002          ; $11A8C4   |
    STA $18,x           ; $11A8C7   |
    STZ $7A38,x         ; $11A8C9   |
    LDA $7CD6,x         ; $11A8CC   |
    STA $00             ; $11A8CF   |
    LDA $7182,x         ; $11A8D1   |
    SEC                 ; $11A8D4   |
    SBC #$0010          ; $11A8D5   |
    STA $02             ; $11A8D8   |
    LDY #$3A            ; $11A8DA   |
    JSL $03A0E7         ; $11A8DC   |
    BRA CODE_11A8FB     ; $11A8E0   |

CODE_11A8E2:
    LDA $611C           ; $11A8E2   |
    STA $00             ; $11A8E5   |
    LDA $6090           ; $11A8E7   |
    STA $02             ; $11A8EA   |
    LDY #$3A            ; $11A8EC   |
    JSL $03A0E7         ; $11A8EE   |
    LDA #$006B          ; $11A8F2   |
    STA $60BE           ; $11A8F5   |
    INC $1104           ; $11A8F8   |

CODE_11A8FB:
    LDA $7220,x         ; $11A8FB   |
    ROL A               ; $11A8FE   |
    ROL A               ; $11A8FF   |
    ROL A               ; $11A900   |
    AND #$0002          ; $11A901   |
    TAY                 ; $11A904   |
    LDA $A966,y         ; $11A905   |
    STA $7220,x         ; $11A908   |
    EOR #$FFFF          ; $11A90B   |
    INC A               ; $11A90E   |
    STA $60A8           ; $11A90F   |
    STA $60B4           ; $11A912   |
    STZ $60D4           ; $11A915   |
    LDA $60C0           ; $11A918   |
    BEQ CODE_11A927     ; $11A91B   |
    LDA $110C           ; $11A91D   |
    BMI CODE_11A927     ; $11A920   |
    STZ $60AA           ; $11A922   |
    BRA CODE_11A933     ; $11A925   |

CODE_11A927:
    LDA #$0008          ; $11A927   |
    STA $60C0           ; $11A92A   |
    LDA #$FA00          ; $11A92D   |
    STA $60AA           ; $11A930   |

CODE_11A933:
    LDA $76,x           ; $11A933   |
    BEQ CODE_11A941     ; $11A935   |
    LDA $110C           ; $11A937   |
    BMI CODE_11A941     ; $11A93A   |
    STA $7222,x         ; $11A93C   |
    BRA CODE_11A94C     ; $11A93F   |

CODE_11A941:
    LDA #$0001          ; $11A941   |
    STA $76,x           ; $11A944   |
    LDA #$FB00          ; $11A946   |
    STA $7222,x         ; $11A949   |

CODE_11A94C:
    RTS                 ; $11A94C   |

CODE_11A94D:
    LDA $1142           ; $11A94D   |
    STA $608C           ; $11A950   |
    LDA $1144           ; $11A953   |
    STA $6090           ; $11A956   |
    LDA $113E           ; $11A959   |
    STA $70E2,x         ; $11A95C   |
    LDA $1140           ; $11A95F   |
    STA $7182,x         ; $11A962   |
    RTS                 ; $11A965   |

DATA_11A966:         dw $FE00, $0200

CODE_11A96A:
    LDA $76,x           ; $11A96A   |
    BEQ CODE_11A9B1     ; $11A96C   |
    LDA $7222,x         ; $11A96E   |
    BMI CODE_11A9B1     ; $11A971   |
    LDY #$5C            ; $11A973   |

CODE_11A975:
    LDA $7A36,y         ; $11A975   |
    BNE CODE_11A9AB     ; $11A978   |
    LDA $7360,y         ; $11A97A   |
    CMP #$01B6          ; $11A97D   |
    BNE CODE_11A9AB     ; $11A980   |
    LDA $70E2,y         ; $11A982   |
    CMP $7CD6,x         ; $11A985   |
    BCS CODE_11A9AB     ; $11A988   |
    CLC                 ; $11A98A   |
    ADC #$0020          ; $11A98B   |
    CMP $7CD6,x         ; $11A98E   |
    BCC CODE_11A9AB     ; $11A991   |
    LDA $7182,y         ; $11A993   |
    SEC                 ; $11A996   |
    SBC #$0010          ; $11A997   |
    CMP $7182,x         ; $11A99A   |
    BCS CODE_11A9AB     ; $11A99D   |
    CLC                 ; $11A99F   |
    ADC #$0004          ; $11A9A0   |
    CMP $7182,x         ; $11A9A3   |
    BCC CODE_11A9AB     ; $11A9A6   |
    JMP CODE_11A9B2     ; $11A9A8   |

CODE_11A9AB:
    DEY                 ; $11A9AB   |
    DEY                 ; $11A9AC   |
    DEY                 ; $11A9AD   |
    DEY                 ; $11A9AE   |
    BPL CODE_11A975     ; $11A9AF   |

CODE_11A9B1:
    RTS                 ; $11A9B1   |

CODE_11A9B2:
    LDA $70E2,y         ; $11A9B2   |
    CLC                 ; $11A9B5   |
    ADC #$0008          ; $11A9B6   |
    CMP $7CD6,x         ; $11A9B9   |
    BCS CODE_11A9CC     ; $11A9BC   |
    CLC                 ; $11A9BE   |
    ADC #$0010          ; $11A9BF   |
    CMP $7CD6,x         ; $11A9C2   |
    BCC CODE_11A9D1     ; $11A9C5   |
    LDA #$000A          ; $11A9C7   |
    BRA CODE_11A9D4     ; $11A9CA   |

CODE_11A9CC:
    LDA #$0008          ; $11A9CC   |
    BRA CODE_11A9D4     ; $11A9CF   |

CODE_11A9D1:
    LDA #$0009          ; $11A9D1   |

CODE_11A9D4:
    STA $79D6,y         ; $11A9D4   |
    LDA #$FFFF          ; $11A9D7   |
    STA $7A36,y         ; $11A9DA   |
    LDA #$FFF0          ; $11A9DD   |
    STA $7ECE           ; $11A9E0   |
    STA $7ECC           ; $11A9E3   |
    LDA #$0010          ; $11A9E6   |
    STA $7722,y         ; $11A9E9   |
    LDA #$0100          ; $11A9EC   |
    STA $7900,y         ; $11A9EF   |
    STA $7902,y         ; $11A9F2   |
    LDA #$0000          ; $11A9F5   |
    STA $7A38,y         ; $11A9F8   |
    TYX                 ; $11A9FB   |
    JSR CODE_11A051     ; $11A9FC   |
    RTS                 ; $11A9FF   |

CODE_11AA00:
    LDA $76,x           ; $11AA00   |
    BNE CODE_11AA1A     ; $11AA02   |
    LDA $7A96,x         ; $11AA04   |
    BNE CODE_11AA12     ; $11AA07   |
    LDA #$0003          ; $11AA09   |
    STA $7A96,x         ; $11AA0C   |
    INC $7976,x         ; $11AA0F   |

CODE_11AA12:
    LDA $7976,x         ; $11AA12   |
    AND #$0001          ; $11AA15   |
    BRA CODE_11AA43     ; $11AA18   |

CODE_11AA1A:
    LDA $7222,x         ; $11AA1A   |
    BPL CODE_11AA24     ; $11AA1D   |
    LDA #$0018          ; $11AA1F   |
    BRA CODE_11AA43     ; $11AA22   |

CODE_11AA24:
    LDA $1114           ; $11AA24   |
    CMP #$0010          ; $11AA27   |
    BCS CODE_11AA40     ; $11AA2A   |
    JSL $008408         ; $11AA2C   |
    LDA $10             ; $11AA30   |
    AND #$0007          ; $11AA32   |
    BNE CODE_11AA3B     ; $11AA35   |
    JSL $029BD9         ; $11AA37   |

CODE_11AA3B:
    LDA #$001A          ; $11AA3B   |
    BRA CODE_11AA43     ; $11AA3E   |

CODE_11AA40:
    LDA #$0017          ; $11AA40   |

CODE_11AA43:
    STA $7402,x         ; $11AA43   |
    RTS                 ; $11AA46   |

CODE_11AA47:
    LDY $1100           ; $11AA47   |
    JSR CODE_11AA54     ; $11AA4A   |
    LDA $78,x           ; $11AA4D   |
    BNE CODE_11AA96     ; $11AA4F   |
    LDY $1102           ; $11AA51   |

CODE_11AA54:
    LDA $7222,x         ; $11AA54   |
    BMI CODE_11AA94     ; $11AA57   |
    LDA $70E2,y         ; $11AA59   |
    CMP $7CD6,x         ; $11AA5C   |
    BCS CODE_11AA94     ; $11AA5F   |
    CLC                 ; $11AA61   |
    ADC #$0020          ; $11AA62   |
    CMP $7CD6,x         ; $11AA65   |
    BCC CODE_11AA94     ; $11AA68   |
    LDA $7182,y         ; $11AA6A   |
    SEC                 ; $11AA6D   |
    SBC #$0010          ; $11AA6E   |
    CMP $7182,x         ; $11AA71   |
    BCS CODE_11AA94     ; $11AA74   |
    CLC                 ; $11AA76   |
    ADC #$0008          ; $11AA77   |
    CMP $7182,x         ; $11AA7A   |
    BCC CODE_11AA94     ; $11AA7D   |
    LDY $1122           ; $11AA7F   |
    LDA $7182,y         ; $11AA82   |
    SEC                 ; $11AA85   |
    SBC #$0010          ; $11AA86   |
    STA $7182,x         ; $11AA89   |
    LDA #$0001          ; $11AA8C   |
    STA $78,x           ; $11AA8F   |
    STZ $76,x           ; $11AA91   |
    RTS                 ; $11AA93   |

CODE_11AA94:
    STZ $78,x           ; $11AA94   |

CODE_11AA96:
    RTS                 ; $11AA96   |

CODE_11AA97:
    LDA $7182,x         ; $11AA97   |
    BPL CODE_11AAB9     ; $11AA9A   |
    LDA $70E2,x         ; $11AA9C   |
    CMP #$0030          ; $11AA9F   |
    BCS CODE_11AAAC     ; $11AAA2   |
    STZ $7220,x         ; $11AAA4   |
    LDA #$0030          ; $11AAA7   |
    BRA CODE_11AAD4     ; $11AAAA   |

CODE_11AAAC:
    CMP #$00C1          ; $11AAAC   |
    BCC CODE_11AAD4     ; $11AAAF   |
    STZ $7220,x         ; $11AAB1   |
    LDA #$00C0          ; $11AAB4   |
    BRA CODE_11AAD4     ; $11AAB7   |

CODE_11AAB9:
    LDA $70E2,x         ; $11AAB9   |
    CMP #$0010          ; $11AABC   |
    BCS CODE_11AAC9     ; $11AABF   |
    STZ $7220,x         ; $11AAC1   |
    LDA #$0010          ; $11AAC4   |
    BRA CODE_11AAD4     ; $11AAC7   |

CODE_11AAC9:
    CMP #$00E1          ; $11AAC9   |
    BCC CODE_11AAD4     ; $11AACC   |
    STZ $7220,x         ; $11AACE   |
    LDA #$00E0          ; $11AAD1   |

CODE_11AAD4:
    STA $70E2,x         ; $11AAD4   |
    RTS                 ; $11AAD7   |

    LDX $112E           ; $11AAD8   |
    LDA $7860,x         ; $11AADB   |
    LSR A               ; $11AADE   |
    BCS CODE_11AAEC     ; $11AADF   |
    LDA $78,x           ; $11AAE1   |
    BNE CODE_11AAEC     ; $11AAE3   |
    LDA #$0001          ; $11AAE5   |
    STA $76,x           ; $11AAE8   |
    BRA CODE_11AAEE     ; $11AAEA   |

CODE_11AAEC:
    STZ $76,x           ; $11AAEC   |

CODE_11AAEE:
    LDA $78,x           ; $11AAEE   |
    CMP #$0001          ; $11AAF0   |
    BNE CODE_11AB3C     ; $11AAF3   |
    LDA $111A           ; $11AAF5   |
    CMP #$0004          ; $11AAF8   |
    BNE CODE_11AB0A     ; $11AAFB   |
    LDA $1114           ; $11AAFD   |
    CMP #$0002          ; $11AB00   |
    BCS CODE_11AB72     ; $11AB03   |
    LDA #$FB80          ; $11AB05   |
    BRA CODE_11AB61     ; $11AB08   |

CODE_11AB0A:
    LDY $1122           ; $11AB0A   |
    LDA $72C0,y         ; $11AB0D   |
    CLC                 ; $11AB10   |
    ADC $70E2,x         ; $11AB11   |
    STA $70E2,x         ; $11AB14   |
    LDA $70E2,x         ; $11AB17   |
    CMP #$0020          ; $11AB1A   |
    BCC CODE_11AB37     ; $11AB1D   |
    CMP #$00D0          ; $11AB1F   |
    BCS CODE_11AB37     ; $11AB22   |
    LDA $110A           ; $11AB24   |
    ROL A               ; $11AB27   |
    ROL A               ; $11AB28   |
    ROL A               ; $11AB29   |
    AND #$0002          ; $11AB2A   |
    STA $00             ; $11AB2D   |
    LDA $110A           ; $11AB2F   |
    EOR $7220,x         ; $11AB32   |
    BRA CODE_11AB83     ; $11AB35   |

CODE_11AB37:
    LDA #$FA00          ; $11AB37   |
    BRA CODE_11AB61     ; $11AB3A   |

CODE_11AB3C:
    LDA $76,x           ; $11AB3C   |
    BNE CODE_11AB72     ; $11AB3E   |
    LDA $1114           ; $11AB40   |
    CMP #$0004          ; $11AB43   |
    BCS CODE_11AB72     ; $11AB46   |
    LDA $111A           ; $11AB48   |
    BEQ CODE_11AB5E     ; $11AB4B   |
    CMP #$0070          ; $11AB4D   |
    BCC CODE_11AB59     ; $11AB50   |
    LDA #$0003          ; $11AB52   |
    STA $18,x           ; $11AB55   |
    BRA CODE_11AB72     ; $11AB57   |

CODE_11AB59:
    LDA #$FA00          ; $11AB59   |
    BRA CODE_11AB61     ; $11AB5C   |

CODE_11AB5E:
    LDA #$FB00          ; $11AB5E   |

CODE_11AB61:
    STA $7222,x         ; $11AB61   |
    LDA #$0001          ; $11AB64   |
    STA $76,x           ; $11AB67   |
    STZ $78,x           ; $11AB69   |
    LDA #$0038          ; $11AB6B   |\ play sound #$0038
    JSL $0085D2         ; $11AB6E   |/

CODE_11AB72:
    LDA $1108           ; $11AB72   |
    ROL A               ; $11AB75   |
    ROL A               ; $11AB76   |
    ROL A               ; $11AB77   |
    AND #$0002          ; $11AB78   |
    STA $00             ; $11AB7B   |
    LDA $1108           ; $11AB7D   |
    EOR $7220,x         ; $11AB80   |

CODE_11AB83:
    AND #$8000          ; $11AB83   |
    BEQ CODE_11AB94     ; $11AB86   |
    LDA $76,x           ; $11AB88   |
    BNE CODE_11AB91     ; $11AB8A   |
    LDA #$0000          ; $11AB8C   |
    BRA CODE_11AB94     ; $11AB8F   |

CODE_11AB91:
    LDA #$0004          ; $11AB91   |

CODE_11AB94:
    CLC                 ; $11AB94   |
    ADC $00             ; $11AB95   |
    TAY                 ; $11AB97   |
    LDA $ABA3,y         ; $11AB98   |
    CLC                 ; $11AB9B   |
    ADC $7220,x         ; $11AB9C   |
    STA $7220,x         ; $11AB9F   |
    RTS                 ; $11ABA2   |

DATA_11ABA3:         dw $0008, $FFF8, $0038, $FFC8

CODE_11ABAB:
    LDX $112E           ; $11ABAB   |\
    JMP CODE_11ABAB     ; $11ABAE   | | what the fuck

    RTS                 ; $11ABB1   |/

CODE_11ABB2:
    LDA $611C           ; $11ABB2   |
    SEC                 ; $11ABB5   |
    SBC $7CD6,x         ; $11ABB6   |
    STA $1106           ; $11ABB9   |
    BPL CODE_11ABC2     ; $11ABBC   |
    EOR #$FFFF          ; $11ABBE   |
    INC A               ; $11ABC1   |

CODE_11ABC2:
    STA $1112           ; $11ABC2   |
    LDA $611E           ; $11ABC5   |
    SEC                 ; $11ABC8   |
    SBC $7182,x         ; $11ABC9   |
    STA $110C           ; $11ABCC   |
    BPL CODE_11ABD5     ; $11ABCF   |
    EOR #$FFFF          ; $11ABD1   |
    INC A               ; $11ABD4   |

CODE_11ABD5:
    STA $1118           ; $11ABD5   |
    LDA $76,x           ; $11ABD8   |
    BEQ CODE_11ABEF     ; $11ABDA   |
    LDY $1120           ; $11ABDC   |
    LDA $7360,y         ; $11ABDF   |
    CMP #$01B6          ; $11ABE2   |
    BNE CODE_11ABEF     ; $11ABE5   |
    LDA $6F00,y         ; $11ABE7   |
    BEQ CODE_11ABEF     ; $11ABEA   |
    JMP CODE_11AC87     ; $11ABEC   |

CODE_11ABEF:
    STZ $1120           ; $11ABEF   |
    STZ $1122           ; $11ABF2   |
    LDY #$5C            ; $11ABF5   |

CODE_11ABF7:
    LDA $6F00,y         ; $11ABF7   |
    BEQ CODE_11AC4C     ; $11ABFA   |
    LDA $7360,y         ; $11ABFC   |
    CMP #$01B6          ; $11ABFF   |
    BNE CODE_11AC29     ; $11AC02   |
    LDA $7A36,y         ; $11AC04   |
    BNE CODE_11AC4C     ; $11AC07   |
    LDA $7CD6,y         ; $11AC09   |
    CLC                 ; $11AC0C   |
    ADC #$0008          ; $11AC0D   |
    STA $7CD6,y         ; $11AC10   |
    LDA $7CD8,y         ; $11AC13   |
    CLC                 ; $11AC16   |
    ADC #$0005          ; $11AC17   |
    STA $7CD8,y         ; $11AC1A   |
    LDA #$0002          ; $11AC1D   |
    STA $08             ; $11AC20   |
    PHY                 ; $11AC22   |
    JSR CODE_11ACD0     ; $11AC23   |
    PLY                 ; $11AC26   |
    BRA CODE_11AC4C     ; $11AC27   |

CODE_11AC29:
    CMP #$01B4          ; $11AC29   |
    BNE CODE_11AC4C     ; $11AC2C   |
    LDA $7CD6,y         ; $11AC2E   |
    CLC                 ; $11AC31   |
    ADC #$0008          ; $11AC32   |
    STA $7CD6,y         ; $11AC35   |
    LDA $7CD8,y         ; $11AC38   |
    CLC                 ; $11AC3B   |
    ADC #$FFF8          ; $11AC3C   |
    STA $7CD8,y         ; $11AC3F   |
    LDA #$0004          ; $11AC42   |
    STA $08             ; $11AC45   |
    PHY                 ; $11AC47   |
    JSR CODE_11ACD0     ; $11AC48   |
    PLY                 ; $11AC4B   |

CODE_11AC4C:
    DEY                 ; $11AC4C   |
    DEY                 ; $11AC4D   |
    DEY                 ; $11AC4E   |
    DEY                 ; $11AC4F   |
    BPL CODE_11ABF7     ; $11AC50   |
    LDY #$02            ; $11AC52   |
    LDA $1118           ; $11AC54   |
    CMP $111A           ; $11AC57   |
    BCS CODE_11AC68     ; $11AC5A   |
    CMP #$0010          ; $11AC5C   |
    BCS CODE_11AC68     ; $11AC5F   |
    LDA $61D6           ; $11AC61   |
    BNE CODE_11AC68     ; $11AC64   |
    LDY #$00            ; $11AC66   |

CODE_11AC68:
    LDA $1106,y         ; $11AC68   |
    STA $1124           ; $11AC6B   |
    LDA $110C,y         ; $11AC6E   |
    STA $1126           ; $11AC71   |
    LDA $1112,y         ; $11AC74   |
    STA $1128           ; $11AC77   |
    LDA $1118,y         ; $11AC7A   |
    STA $112A           ; $11AC7D   |
    LDA $111E,y         ; $11AC80   |
    STA $112C           ; $11AC83   |
    RTS                 ; $11AC86   |

CODE_11AC87:
    LDY $1120           ; $11AC87   |
    LDA $7CD6,y         ; $11AC8A   |
    CLC                 ; $11AC8D   |
    ADC #$0008          ; $11AC8E   |
    STA $7CD6,y         ; $11AC91   |
    LDA $7CD8,y         ; $11AC94   |
    CLC                 ; $11AC97   |
    ADC #$0005          ; $11AC98   |
    STA $7CD8,y         ; $11AC9B   |
    LDA #$0002          ; $11AC9E   |
    STA $08             ; $11ACA1   |
    STZ $1120           ; $11ACA3   |
    JSR CODE_11ACD0     ; $11ACA6   |
    LDY $1122           ; $11ACA9   |
    LDA $7CD6,y         ; $11ACAC   |
    CLC                 ; $11ACAF   |
    ADC #$0008          ; $11ACB0   |
    STA $7CD6,y         ; $11ACB3   |
    LDA $7CD8,y         ; $11ACB6   |
    CLC                 ; $11ACB9   |
    ADC #$FFF8          ; $11ACBA   |
    STA $7CD8,y         ; $11ACBD   |
    LDA #$0004          ; $11ACC0   |
    STA $08             ; $11ACC3   |
    STZ $1122           ; $11ACC5   |
    JSR CODE_11ACD0     ; $11ACC8   |
    LDY #$00            ; $11ACCB   |
    JMP CODE_11AC4C     ; $11ACCD   |

CODE_11ACD0:
    LDA $7CD6,y         ; $11ACD0   |
    SEC                 ; $11ACD3   |
    SBC $7CD6,x         ; $11ACD4   |
    STA $00             ; $11ACD7   |
    BPL CODE_11ACDF     ; $11ACD9   |
    EOR #$FFFF          ; $11ACDB   |
    INC A               ; $11ACDE   |

CODE_11ACDF:
    STA $04             ; $11ACDF   |
    LDA $7CD8,y         ; $11ACE1   |
    CLC                 ; $11ACE4   |
    ADC #$0008          ; $11ACE5   |
    SEC                 ; $11ACE8   |
    SBC $7CD8,x         ; $11ACE9   |
    STA $02             ; $11ACEC   |
    BPL CODE_11ACF4     ; $11ACEE   |
    EOR #$FFFF          ; $11ACF0   |
    INC A               ; $11ACF3   |

CODE_11ACF4:
    STA $06             ; $11ACF4   |
    STY $0A             ; $11ACF6   |
    LDY $08             ; $11ACF8   |
    LDA $111E,y         ; $11ACFA   |
    BEQ CODE_11AD0F     ; $11ACFD   |
    LDA $1118,y         ; $11ACFF   |
    CMP $06             ; $11AD02   |
    BCC CODE_11AD29     ; $11AD04   |
    BNE CODE_11AD0F     ; $11AD06   |
    LDA $1112,y         ; $11AD08   |
    CMP $04             ; $11AD0B   |
    BCC CODE_11AD29     ; $11AD0D   |

CODE_11AD0F:
    LDA $00             ; $11AD0F   |
    STA $1106,y         ; $11AD11   |
    LDA $02             ; $11AD14   |
    STA $110C,y         ; $11AD16   |
    LDA $04             ; $11AD19   |
    STA $1112,y         ; $11AD1B   |
    LDA $06             ; $11AD1E   |
    STA $1118,y         ; $11AD20   |
    LDA $0A             ; $11AD23   |
    STA $111E,y         ; $11AD25   |
    TAY                 ; $11AD28   |

CODE_11AD29:
    RTS                 ; $11AD29   |

    PHP                 ; $11AD2A   |
    SEP #$30            ; $11AD2B   |
    LDA $1135           ; $11AD2D   |
    PHA                 ; $11AD30   |
    LDA #$7F            ; $11AD31   |
    STA $1135           ; $11AD33   |
    JSL $108279         ; $11AD36   |
    PLA                 ; $11AD3A   |
    STA $1135           ; $11AD3B   |
    LDA $0374           ; $11AD3E   |
    CMP #$FF            ; $11AD41   |
    BNE CODE_11AD4C     ; $11AD43   |
    LDA #$1F            ; $11AD45   |
    STA $0118           ; $11AD47   |
    BRA CODE_11AD77     ; $11AD4A   |

CODE_11AD4C:
    LDA $0376           ; $11AD4C   |
    STA $7F7FC2         ; $11AD4F   |
    LDA #$00            ; $11AD53   |
    STA $7F7FC3         ; $11AD55   |
    INC A               ; $11AD59   |
    STA $038C           ; $11AD5A   |
    LDA #$0B            ; $11AD5D   |
    STA $0118           ; $11AD5F   |
    REP #$20            ; $11AD62   |
    LDA $0374           ; $11AD64   |
    STA $7F7FC0         ; $11AD67   |
    LDA #$01C0          ; $11AD6B   |
    STA $038E           ; $11AD6E   |
    LDA $0377           ; $11AD71   |
    STA $03B6           ; $11AD74   |

CODE_11AD77:
    PLP                 ; $11AD77   |
    RTL                 ; $11AD78   |

    REP #$20            ; $11AD79   |
    STZ $39             ; $11AD7B   |
    STZ $3B             ; $11AD7D   |
    STZ $3D             ; $11AD7F   |
    STZ $3F             ; $11AD81   |
    STZ $41             ; $11AD83   |
    STZ $43             ; $11AD85   |
    SEP #$20            ; $11AD87   |
    LDA #$69            ; $11AD89   |
    STA $095F           ; $11AD8B   |
    STA $2107           ; $11AD8E   |
    LDA #$39            ; $11AD91   |
    STA $0960           ; $11AD93   |
    STA $2108           ; $11AD96   |
    LDA #$09            ; $11AD99   |
    STA $095E           ; $11AD9B   |
    STA $2105           ; $11AD9E   |
    STZ $094A           ; $11ADA1   |
    STZ $096C           ; $11ADA4   |
    REP #$30            ; $11ADA7   |
    LDA #$00B0          ; $11ADA9   |
    STA $6090           ; $11ADAC   |
    LDA #$0030          ; $11ADAF   |
    STA $608C           ; $11ADB2   |
    STZ $6CAA           ; $11ADB5   |
    STA $03B6           ; $11ADB8   |
    LDA #$0030          ; $11ADBB   |
    STA $10EC           ; $11ADBE   |
    LDA #$0001          ; $11ADC1   |
    STA $10EE           ; $11ADC4   |
    STZ $10E8           ; $11ADC7   |
    STZ $10EA           ; $11ADCA   |
    LDX #$01FE          ; $11ADCD   |
    LDA #$0000          ; $11ADD0   |

CODE_11ADD3:
    STA $7F8000,x       ; $11ADD3   |
    DEX                 ; $11ADD7   |
    DEX                 ; $11ADD8   |
    BPL CODE_11ADD3     ; $11ADD9   |
    LDX #$001E          ; $11ADDB   |
    LDA #$0100          ; $11ADDE   |

CODE_11ADE1:
    STA $7F8000,x       ; $11ADE1   |
    STA $7F81A0,x       ; $11ADE5   |
    DEX                 ; $11ADE9   |
    DEX                 ; $11ADEA   |
    BPL CODE_11ADE1     ; $11ADEB   |
    LDX #$0160          ; $11ADED   |

CODE_11ADF0:
    LDA #$0100          ; $11ADF0   |
    STA $7F8000,x       ; $11ADF3   |
    STA $7F801E,x       ; $11ADF7   |
    TXA                 ; $11ADFB   |
    SEC                 ; $11ADFC   |
    SBC #$0020          ; $11ADFD   |
    TAX                 ; $11AE00   |
    BNE CODE_11ADF0     ; $11AE01   |
    SEP #$10            ; $11AE03   |
    LDA #$01B1          ; $11AE05   |
    JSL $03A34C         ; $11AE08   |
    LDA #$01B3          ; $11AE0C   |
    JSL $03A34C         ; $11AE0F   |
    SEP #$30            ; $11AE13   |
    JSL $0397D3         ; $11AE15   |
    RTS                 ; $11AE19   |

    JSL $008259         ; $11AE1A   |
    JSL $0394CF         ; $11AE1E   |
    JSL $04FA67         ; $11AE22   |
    STZ $03BA           ; $11AE26   |
    LDA $10F8           ; $11AE29   |
    ASL A               ; $11AE2C   |
    TAX                 ; $11AE2D   |
    JSR ($AE3F,x)       ; $11AE2E   |

    REP #$20            ; $11AE31   |
    LDX #$08            ; $11AE33   |
    LDA #$B1EF          ; $11AE35   |
    JSL $7EDE44         ; $11AE38   | GSU init
    SEP #$20            ; $11AE3C   |
    RTS                 ; $11AE3E   |

DATA_11AE3F:         dw $AE47
DATA_11AE41:         dw $AEAC
DATA_11AE43:         dw $AEC9

DATA_11AE45:         db $06, $04

    JSL $04DD9E         ; $11AE47   |
    LDA $0D0F           ; $11AE4B   |
    BNE CODE_11AEA9     ; $11AE4E   |
    JSL $0397D3         ; $11AE50   |
    REP #$30            ; $11AE54   |
    JSR CODE_11AEDC     ; $11AE56   |
    SEP #$10            ; $11AE59   |
    LDA $10F8           ; $11AE5B   |
    BEQ CODE_11AEA9     ; $11AE5E   |
    LDX #$5C            ; $11AE60   |

CODE_11AE62:
    LDA $6F00,x         ; $11AE62   |
    BEQ CODE_11AE73     ; $11AE65   |
    STZ $7220,x         ; $11AE67   |
    STZ $7222,x         ; $11AE6A   |
    STZ $7542,x         ; $11AE6D   |
    STZ $7540,x         ; $11AE70   |

CODE_11AE73:
    DEX                 ; $11AE73   |
    DEX                 ; $11AE74   |
    DEX                 ; $11AE75   |
    DEX                 ; $11AE76   |
    BPL CODE_11AE62     ; $11AE77   |
    LDA $10EC           ; $11AE79   |
    BNE CODE_11AEA9     ; $11AE7C   |
    LDA $10E6           ; $11AE7E   |
    BNE CODE_11AEA9     ; $11AE81   |
    LDA #$0011          ; $11AE83   |
    JSL $03A34C         ; $11AE86   |
    BCC CODE_11AEA9     ; $11AE8A   |
    JSL $008408         ; $11AE8C   |
    AND #$0001          ; $11AE90   |
    TAX                 ; $11AE93   |
    LDA $AE45,x         ; $11AE94   |
    AND #$00FF          ; $11AE97   |
    STA $7978,y         ; $11AE9A   |
    LDA #$0080          ; $11AE9D   |
    STA $7182,y         ; $11AEA0   |
    LDA #$0070          ; $11AEA3   |
    STA $70E2,y         ; $11AEA6   |

CODE_11AEA9:
    SEP #$20            ; $11AEA9   |
    RTS                 ; $11AEAB   |

    JSL $04DD9E         ; $11AEAC   |
    JSL $0397D3         ; $11AEB0   |
    LDA $10FA           ; $11AEB4   |
    BEQ CODE_11AEC4     ; $11AEB7   |
    LDA $60C0           ; $11AEB9   |
    BNE CODE_11AEC4     ; $11AEBC   |
    INC $10F8           ; $11AEBE   |
    INC $61AE           ; $11AEC1   |

CODE_11AEC4:
    JSL $1191B8         ; $11AEC4   |
    RTS                 ; $11AEC8   |

    JSL $04DD9E         ; $11AEC9   |
    JSL $0397D3         ; $11AECD   |
    LDA #$01            ; $11AED1   |
    STA $61AE           ; $11AED3   |
    STA $10FA           ; $11AED6   |
    JMP CODE_11AEC4     ; $11AED9   |

CODE_11AEDC:
    CLC                 ; $11AEDC   |
    SED                 ; $11AEDD   |
    LDA $10E8           ; $11AEDE   |
    ADC $03BA           ; $11AEE1   |
    STA $10E8           ; $11AEE4   |
    CLD                 ; $11AEE7   |
    DEC $10EE           ; $11AEE8   |
    BNE CODE_11AF2B     ; $11AEEB   |
    SEC                 ; $11AEED   |
    SED                 ; $11AEEE   |
    LDA $10EC           ; $11AEEF   |
    SBC #$0001          ; $11AEF2   |
    STA $10EC           ; $11AEF5   |
    CLD                 ; $11AEF8   |
    BNE CODE_11AF16     ; $11AEF9   |

    LDY #$0000          ; $11AEFB   |
    LDA $10E8           ; $11AEFE   |
    CMP $10EA           ; $11AF01   |
    BCS CODE_11AF07     ; $11AF04   |
    INY                 ; $11AF06   |

CODE_11AF07:
    STY $10E6           ; $11AF07   |
    INY                 ; $11AF0A   |
    STY $10F8           ; $11AF0B   |
    LDA #$0001          ; $11AF0E   |
    STA $10E2           ; $11AF11   |
    BRA CODE_11AF2B     ; $11AF14   |

CODE_11AF16:
    LDA $10EC           ; $11AF16   |
    CMP #$0006          ; $11AF19   |
    BCS CODE_11AF25     ; $11AF1C   |
    LDA #$007F          ; $11AF1E   |\ play sound #$7F
    JSL $0085D2         ; $11AF21   |/

CODE_11AF25:
    LDA #$003F          ; $11AF25   |
    STA $10EE           ; $11AF28   |

CODE_11AF2B:
    PHB                 ; $11AF2B   |
    LDA #$007E          ; $11AF2C   |
    PHA                 ; $11AF2F   |
    PLB                 ; $11AF30   |
    LDX $4800           ; $11AF31   |
    LDA #$3484          ; $11AF34   |
    STA $0000,x         ; $11AF37   |
    CLC                 ; $11AF3A   |
    ADC #$0020          ; $11AF3B   |
    STA $0010,x         ; $11AF3E   |
    LDA #$348F          ; $11AF41   |
    STA $0020,x         ; $11AF44   |
    ADC #$0020          ; $11AF47   |
    STA $0030,x         ; $11AF4A   |
    LDA #$349A          ; $11AF4D   |
    STA $0040,x         ; $11AF50   |
    ADC #$0020          ; $11AF53   |
    STA $0050,x         ; $11AF56   |
    LDA #$0180          ; $11AF59   |
    STA $0002,x         ; $11AF5C   |
    STA $0012,x         ; $11AF5F   |
    STA $0022,x         ; $11AF62   |
    STA $0032,x         ; $11AF65   |
    STA $0042,x         ; $11AF68   |
    STA $0052,x         ; $11AF6B   |
    LDA #$0018          ; $11AF6E   |
    STA $0004,x         ; $11AF71   |
    STA $0014,x         ; $11AF74   |
    STA $0024,x         ; $11AF77   |
    STA $0034,x         ; $11AF7A   |
    STA $0044,x         ; $11AF7D   |
    STA $0054,x         ; $11AF80   |
    TXA                 ; $11AF83   |
    ADC #$000C          ; $11AF84   |
    STA $0005,x         ; $11AF87   |
    ADC #$0010          ; $11AF8A   |
    STA $0015,x         ; $11AF8D   |
    ADC #$0010          ; $11AF90   |
    STA $0025,x         ; $11AF93   |
    ADC #$0010          ; $11AF96   |
    STA $0035,x         ; $11AF99   |
    ADC #$0010          ; $11AF9C   |
    STA $0045,x         ; $11AF9F   |
    ADC #$0010          ; $11AFA2   |
    STA $0055,x         ; $11AFA5   |
    LDA #$007E          ; $11AFA8   |
    STA $0007,x         ; $11AFAB   |
    STA $0017,x         ; $11AFAE   |
    STA $0027,x         ; $11AFB1   |
    STA $0037,x         ; $11AFB4   |
    STA $0047,x         ; $11AFB7   |
    STA $0057,x         ; $11AFBA   |
    LDA #$0004          ; $11AFBD   |
    STA $0008,x         ; $11AFC0   |
    STA $0018,x         ; $11AFC3   |
    STA $0028,x         ; $11AFC6   |
    STA $0038,x         ; $11AFC9   |
    STA $0048,x         ; $11AFCC   |
    STA $0058,x         ; $11AFCF   |
    TXA                 ; $11AFD2   |
    ADC #$0010          ; $11AFD3   |
    STA $000A,x         ; $11AFD6   |
    ADC #$0010          ; $11AFD9   |
    STA $001A,x         ; $11AFDC   |
    ADC #$0010          ; $11AFDF   |
    STA $002A,x         ; $11AFE2   |
    ADC #$0010          ; $11AFE5   |
    STA $003A,x         ; $11AFE8   |
    ADC #$0010          ; $11AFEB   |
    STA $004A,x         ; $11AFEE   |
    ADC #$0010          ; $11AFF1   |
    STA $005A,x         ; $11AFF4   |
    STA $4800           ; $11AFF7   |
    PLB                 ; $11AFFA   |
    PLB                 ; $11AFFB   |
    TXA                 ; $11AFFC   |
    SEC                 ; $11AFFD   |
    SBC #$4802          ; $11AFFE   |
    TAX                 ; $11B001   |
    LDA $10E8           ; $11B002   |
    TAY                 ; $11B005   |
    AND #$00F0          ; $11B006   |
    LSR A               ; $11B009   |
    LSR A               ; $11B00A   |
    LSR A               ; $11B00B   |
    LSR A               ; $11B00C   |
    ORA #$2900          ; $11B00D   |
    STA $7E480E,x       ; $11B010   |
    ORA #$0010          ; $11B014   |
    STA $7E481E,x       ; $11B017   |
    TYA                 ; $11B01B   |
    AND #$000F          ; $11B01C   |
    ORA #$2900          ; $11B01F   |
    STA $7E4810,x       ; $11B022   |
    ORA #$0010          ; $11B026   |
    STA $7E4820,x       ; $11B029   |
    LDA $10EC           ; $11B02D   |
    TAY                 ; $11B030   |
    AND #$00F0          ; $11B031   |
    LSR A               ; $11B034   |
    LSR A               ; $11B035   |
    LSR A               ; $11B036   |
    LSR A               ; $11B037   |
    ORA #$2900          ; $11B038   |
    STA $7E482E,x       ; $11B03B   |
    ORA #$0010          ; $11B03F   |
    STA $7E483E,x       ; $11B042   |
    TYA                 ; $11B046   |
    AND #$000F          ; $11B047   |
    ORA #$2900          ; $11B04A   |
    STA $7E4830,x       ; $11B04D   |
    ORA #$0010          ; $11B051   |
    STA $7E4840,x       ; $11B054   |
    LDA $10EA           ; $11B058   |
    TAY                 ; $11B05B   |
    AND #$00F0          ; $11B05C   |
    LSR A               ; $11B05F   |
    LSR A               ; $11B060   |
    LSR A               ; $11B061   |
    LSR A               ; $11B062   |
    ORA #$2900          ; $11B063   |
    STA $7E484E,x       ; $11B066   |
    ORA #$0010          ; $11B06A   |
    STA $7E485E,x       ; $11B06D   |
    TYA                 ; $11B071   |
    AND #$000F          ; $11B072   |
    ORA #$2900          ; $11B075   |
    STA $7E4850,x       ; $11B078   |
    ORA #$0010          ; $11B07C   |
    STA $7E4860,x       ; $11B07F   |
    RTS                 ; $11B083   |

DATA_11B084:         db $00, $FF

.init_coin_cannon
    LDA #$0038          ; $11B088   |
    STA $7182,x         ; $11B08B   |
    LDA #$0070          ; $11B08E   |
    STA $70E2,x         ; $11B091   |
    STZ $7902,x         ; $11B094   |
    LDY $7902,x         ; $11B097   |
    LDA $B084,y         ; $11B09A   |
    STA $7220,x         ; $11B09D   |
    LDA #$0040          ; $11B0A0   |
    STA $7A96,x         ; $11B0A3   |
    STZ $78,x           ; $11B0A6   |
    STZ $7A36,x         ; $11B0A8   |
    LDA #$0100          ; $11B0AB   |
    STA $7A38,x         ; $11B0AE   |
    LDA #$0100          ; $11B0B1   |
    STA $7900,x         ; $11B0B4   |
    STZ $16,x           ; $11B0B7   |
    STZ $7722,x         ; $11B0B9   |
    LDA #$0080          ; $11B0BC   |
    STA $3018           ; $11B0BF   |
    LDA #$0055          ; $11B0C2   |
    STA $301A           ; $11B0C5   |
    LDA $7A36,x         ; $11B0C8   |
    STA $300A           ; $11B0CB   |
    LDA $7A38,x         ; $11B0CE   |
    STA $300C           ; $11B0D1   |
    LDA $7900,x         ; $11B0D4   |
    STA $3016           ; $11B0D7   |
    LDY $7722,x         ; $11B0DA   |
    TYX                 ; $11B0DD   |
    LDA $03A9CE,x       ; $11B0DE   |
    STA $3006           ; $11B0E2   |
    LDA $03A9EE,x       ; $11B0E5   |
    STA $3004           ; $11B0E9   |
    LDX #$08            ; $11B0EC   |
    LDA #$84A5          ; $11B0EE   |
    JSL $7EDE44         ; $11B0F1   | GSU init
    INC $0CF9           ; $11B0F5   |
    LDX $12             ; $11B0F8   |

CODE_11B0FA:
    RTL                 ; $11B0FA   |

DATA_11B0FB:         dw $0020, $00E0

DATA_11B0FF:         dw $0018, $00C8, $0002, $FFFE
DATA_11B107:         dw $0133, $014D, $0166, $0133
DATA_11B10F:         dw $0100

DATA_11B111:         dw $00CD, $00B3, $009A, $0100
DATA_11B119:         dw $0100

DATA_11B11B:         dw $000A, $000A, $0010, $0004
DATA_11B123:         dw $0000

.main_coin_cannon
    LDA $10F8           ; $11B125   |
    BNE CODE_11B0FA     ; $11B128   |
    LDA $7A96,x         ; $11B12A   |
    BEQ CODE_11B15B     ; $11B12D   |
    INC $16,x           ; $11B12F   |
    LDA $16,x           ; $11B131   |
    AND #$0003          ; $11B133   |
    BEQ CODE_11B13B     ; $11B136   |

CODE_11B138:
    JMP CODE_11B218     ; $11B138   |

CODE_11B13B:
    LDY $78,x           ; $11B13B   |
    LDA $7A36,x         ; $11B13D   |
    CLC                 ; $11B140   |
    ADC $B103,y         ; $11B141   |
    AND #$00FF          ; $11B144   |
    STA $7A36,x         ; $11B147   |
    CMP $B0FB,y         ; $11B14A   |
    BNE CODE_11B158     ; $11B14D   |
    TYA                 ; $11B14F   |
    AND #$00FF          ; $11B150   |
    EOR #$0002          ; $11B153   |
    STA $78,x           ; $11B156   |

CODE_11B158:
    JMP CODE_11B214     ; $11B158   |

CODE_11B15B:
    LDA $7AF6,x         ; $11B15B   |
    BNE CODE_11B138     ; $11B15E   |
    INC $18,x           ; $11B160   |
    LDA $18,x           ; $11B162   |
    ASL A               ; $11B164   |
    TAY                 ; $11B165   |
    CPY #$08            ; $11B166   |
    BEQ CODE_11B16D     ; $11B168   |

CODE_11B16A:
    JMP CODE_11B1F3     ; $11B16A   |

CODE_11B16D:
    PHY                 ; $11B16D   |
    LDA #$01B2          ; $11B16E   |
    JSL $03A34C         ; $11B171   |
    BCC CODE_11B16A     ; $11B175   |
    LDA $70E2,x         ; $11B177   |
    CLC                 ; $11B17A   |
    ADC #$0008          ; $11B17B   |
    STA $70E2,y         ; $11B17E   |
    LDA $7182,x         ; $11B181   |
    CLC                 ; $11B184   |
    ADC #$0008          ; $11B185   |
    STA $7182,y         ; $11B188   |
    LDA $7A36,x         ; $11B18B   |
    CLC                 ; $11B18E   |
    ADC #$0040          ; $11B18F   |
    AND #$00FF          ; $11B192   |
    ASL A               ; $11B195   |
    TAX                 ; $11B196   |
    LDA $00E9D4,x       ; $11B197   |
    ASL A               ; $11B19B   |
    ASL A               ; $11B19C   |
    STA $7222,y         ; $11B19D   |
    LDA $00E954,x       ; $11B1A0   |
    ASL A               ; $11B1A4   |
    STA $7220,y         ; $11B1A5   |
    LDX $12             ; $11B1A8   |
    LDA #$022A          ; $11B1AA   |
    JSL $008B21         ; $11B1AD   |
    LDA $7A36,x         ; $11B1B1   |
    STA $7E8C,y         ; $11B1B4   |
    LDA $70E2,x         ; $11B1B7   |
    CLC                 ; $11B1BA   |
    ADC #$0008          ; $11B1BB   |
    STA $70A2,y         ; $11B1BE   |
    LDA $7182,x         ; $11B1C1   |
    STA $7142,y         ; $11B1C4   |
    LDA #$002C          ; $11B1C7   |
    STA $78C0,y         ; $11B1CA   |
    LDA #$000C          ; $11B1CD   |
    STA $78C2,y         ; $11B1D0   |

    LDA #$0000          ; $11B1D3   |
    STA $73C2,y         ; $11B1D6   |
    LDA #$0003          ; $11B1D9   |
    STA $7782,y         ; $11B1DC   |
    LDA #$0004          ; $11B1DF   |
    STA $7E8E,y         ; $11B1E2   |
    LDA #$0024          ; $11B1E5   |
    STA $7002,y         ; $11B1E8   |
    LDA #$0047          ; $11B1EB   |\ play sound #$0047
    JSL $0085D2         ; $11B1EE   |/
    PLY                 ; $11B1F2   |

CODE_11B1F3:
    LDA $B107,y         ; $11B1F3   |
    STA $7A38,x         ; $11B1F6   |
    LDA $B111,y         ; $11B1F9   |
    STA $7900,x         ; $11B1FC   |
    LDA $B11B,y         ; $11B1FF   |
    STA $7AF6,x         ; $11B202   |
    BNE CODE_11B214     ; $11B205   |
    STZ $18,x           ; $11B207   |
    LDA $10             ; $11B209   |
    AND #$003F          ; $11B20B   |
    ADC #$0040          ; $11B20E   |
    STA $7A96,x         ; $11B211   |

CODE_11B214:
    JSL $11B0BC         ; $11B214   |

CODE_11B218:
    LDY $7902,x         ; $11B218   |
    LDA $7680,x         ; $11B21B   |
    CMP $B0FF,y         ; $11B21E   |
    BNE CODE_11B23A     ; $11B221   |
    STZ $70E1,x         ; $11B223   |
    LDA $B0FF,y         ; $11B226   |
    STA $70E2,x         ; $11B229   |
    TYA                 ; $11B22C   |
    EOR #$0002          ; $11B22D   |
    TAY                 ; $11B230   |
    STA $7902,x         ; $11B231   |
    LDA $B084,y         ; $11B234   |
    STA $7220,x         ; $11B237   |

CODE_11B23A:
    RTL                 ; $11B23A   |

.init_mini_battle_coin
    LDY #$00            ; $11B23B   |
    LDA $7220,x         ; $11B23D   |
    BPL CODE_11B244     ; $11B240   |
    INY                 ; $11B242   |
    INY                 ; $11B243   |

CODE_11B244:
    TYA                 ; $11B244   |
    STA $7400,x         ; $11B245   |
    RTL                 ; $11B248   |

DATA_11B249:         dw $0006, $0000

.main_mini_battle_coin
    LDA $10F8           ; $11B24D   |
    BEQ CODE_11B255     ; $11B250   |
    JMP CODE_11B30A     ; $11B252   |

CODE_11B255:
    LDY $7D36,x         ; $11B255   |
    BEQ CODE_11B2C4     ; $11B258   |
    BMI CODE_11B284     ; $11B25A   |
    DEY                 ; $11B25C   |
    LDA $7A36,y         ; $11B25D   |
    BNE CODE_11B2C4     ; $11B260   |
    CLC                 ; $11B262   |
    SED                 ; $11B263   |
    LDA $10EA           ; $11B264   |
    ADC #$0001          ; $11B267   |
    STA $10EA           ; $11B26A   |
    CLD                 ; $11B26D   |

    STZ $7902,x         ; $11B26E   |
    DEC $03BA           ; $11B271   |
    LDA $70E2,x         ; $11B274   |
    STA $00             ; $11B277   |
    LDA $7182,x         ; $11B279   |
    SEC                 ; $11B27C   |
    SBC #$0004          ; $11B27D   |
    STA $02             ; $11B280   |
    BRA CODE_11B2A0     ; $11B282   |

CODE_11B284:
    LDA $61D6           ; $11B284   |
    CMP #$0081          ; $11B287   |
    BCS CODE_11B2C4     ; $11B28A   |
    LDA #$0002          ; $11B28C   |
    STA $7902,x         ; $11B28F   |
    LDA $608C           ; $11B292   |
    STA $00             ; $11B295   |
    LDA $6090           ; $11B297   |
    SEC                 ; $11B29A   |
    SBC #$0004          ; $11B29B   |
    STA $02             ; $11B29E   |

CODE_11B2A0:
    LDA #$0003          ; $11B2A0   |
    JSL $03B481         ; $11B2A3   |
    LDA $7902,x         ; $11B2A7   |
    TAX                 ; $11B2AA   |
    LDA $7002,y         ; $11B2AB   |
    AND #$FFF0          ; $11B2AE   |
    ORA $B249,x         ; $11B2B1   |
    STA $7002,y         ; $11B2B4   |
    LDX $12             ; $11B2B7   |
    LDA #$0009          ; $11B2B9   |\ play sound #$0009
    JSL $0085D2         ; $11B2BC   |/
    JMP $03A31E         ; $11B2C0   |

CODE_11B2C4:
    LDA $7860,x         ; $11B2C4   |
    LSR A               ; $11B2C7   |
    BCC CODE_11B2F9     ; $11B2C8   |
    LDA $7222,x         ; $11B2CA   |
    BMI CODE_11B2F9     ; $11B2CD   |
    LSR A               ; $11B2CF   |
    EOR #$FFFF          ; $11B2D0   |
    INC A               ; $11B2D3   |
    STA $7222,x         ; $11B2D4   |
    CMP #$FFF0          ; $11B2D7   |
    BCS CODE_11B2E5     ; $11B2DA   |
    LDA #$002C          ; $11B2DC   |\ play sound #$002C
    JSL $0085D2         ; $11B2DF   |/
    BRA CODE_11B2F9     ; $11B2E3   |

CODE_11B2E5:
    STZ $7222,x         ; $11B2E5   |
    LDA $7220,x         ; $11B2E8   |
    BPL CODE_11B2F1     ; $11B2EB   |
    EOR #$FFFF          ; $11B2ED   |
    INC A               ; $11B2F0   |

CODE_11B2F1:
    CMP #$0010          ; $11B2F1   |
    BCS CODE_11B2F9     ; $11B2F4   |
    STZ $7220,x         ; $11B2F6   |

CODE_11B2F9:
    LDA $7222,x         ; $11B2F9   |
    BMI CODE_11B30A     ; $11B2FC   |
    LDA #$0034          ; $11B2FE   |
    STA $7042,x         ; $11B301   |
    LDA #$0003          ; $11B304   |
    STA $74A2,x         ; $11B307   |

CODE_11B30A:
    LDA $0030           ; $11B30A   |
    LSR A               ; $11B30D   |
    LSR A               ; $11B30E   |
    LSR A               ; $11B30F   |
    AND #$0003          ; $11B310   |
    STA $7402,x         ; $11B313   |
    RTL                 ; $11B316   |

.init_mini_battle_bandit
    LDA #$00C0          ; $11B317   |
    STA $7182,x         ; $11B31A   |
    LDA #$00C0          ; $11B31D   |
    STA $70E2,x         ; $11B320   |
    LDA #$0009          ; $11B323   |
    STA $7402,x         ; $11B326   |

CODE_11B329:
    RTL                 ; $11B329   |

.main_mini_battle_bandit
    LDA $10F8           ; $11B32A   |
    BNE CODE_11B329     ; $11B32D   |
    LDA $61D6           ; $11B32F   |
    CMP #$0081          ; $11B332   |
    BCS CODE_11B33A     ; $11B335   |
    STZ $61D6           ; $11B337   |

CODE_11B33A:
    LDA $7680,x         ; $11B33A   |
    CMP #$0010          ; $11B33D   |
    BCS CODE_11B352     ; $11B340   |
    LDA #$0010          ; $11B342   |
    SEC                 ; $11B345   |
    SBC $7680,x         ; $11B346   |
    CLC                 ; $11B349   |
    ADC $70E2,x         ; $11B34A   |
    STA $70E2,x         ; $11B34D   |
    BRA CODE_11B36B     ; $11B350   |

CODE_11B352:
    LDA $7680,x         ; $11B352   |
    SEC                 ; $11B355   |
    SBC #$00E0          ; $11B356   |
    BMI CODE_11B375     ; $11B359   |
    CMP #$0020          ; $11B35B   |
    BCC CODE_11B36B     ; $11B35E   |
    STA $00             ; $11B360   |
    LDA $70E2,x         ; $11B362   |
    SEC                 ; $11B365   |
    SBC $00             ; $11B366   |
    STA $70E2,x         ; $11B368   |

CODE_11B36B:
    STZ $18,x           ; $11B36B   |
    LDA $7A36,x         ; $11B36D   |
    BEQ CODE_11B375     ; $11B370   |
    STZ $7A36,x         ; $11B372   |

CODE_11B375:
    LDA $18,x           ; $11B375   |
    ASL A               ; $11B377   |
    TAY                 ; $11B378   |
    LDA $B381,y         ; $11B379   |
    STA $00             ; $11B37C   |
    JMP ($7960)         ; $11B37E   |

DATA_11B381:         dw $B38B
DATA_11B383:         dw $B41A
DATA_11B385:         dw $B4CB
DATA_11B387:         dw $B632
DATA_11B389:         dw $B6BD

    LDA $61D6           ; $11B38B   |
    BNE CODE_11B39A     ; $11B38E   |
    LDA $10             ; $11B390   |
    AND #$00FF          ; $11B392   |
    CMP #$00A0          ; $11B395   |
    BCC CODE_11B3C2     ; $11B398   |

CODE_11B39A:
    TXA                 ; $11B39A   |
    AND #$00FF          ; $11B39B   |
    STA $3002           ; $11B39E   |
    LDX #$09            ; $11B3A1   |
    LDA #$8DDA          ; $11B3A3   |
    JSL $7EDE44         ; $11B3A6   | GSU init
    LDX $12             ; $11B3AA   |
    LDA $3002           ; $11B3AC   |
    BMI CODE_11B3C2     ; $11B3AF   |
    STA $76,x           ; $11B3B1   |
    TAY                 ; $11B3B3   |
    LDA $70E2,y         ; $11B3B4   |
    STA $00             ; $11B3B7   |
    LDA #$0200          ; $11B3B9   |
    STA $02             ; $11B3BC   |
    INC $18,x           ; $11B3BE   |
    BRA CODE_11B3D7     ; $11B3C0   |

CODE_11B3C2:
    LDA $608C           ; $11B3C2   |
    STA $00             ; $11B3C5   |
    LDA #$0200          ; $11B3C7   |
    STA $02             ; $11B3CA   |
    LDA #$0002          ; $11B3CC   |
    STA $18,x           ; $11B3CF   |
    LDA #$0050          ; $11B3D1   |
    STA $7A96,x         ; $11B3D4   |

CODE_11B3D7:
    LDA $00             ; $11B3D7   |
    STA $3002           ; $11B3D9   |
    LDA $7182,x         ; $11B3DC   |
    STA $3004           ; $11B3DF   |
    STA $3008           ; $11B3E2   |
    LDA $70E2,x         ; $11B3E5   |
    STA $3006           ; $11B3E8   |
    LDA $02             ; $11B3EB   |
    STA $300C           ; $11B3ED   |
    LDX #$09            ; $11B3F0   |
    LDA #$907C          ; $11B3F2   |
    JSL $7EDE44         ; $11B3F5   | GSU init
    LDX $12             ; $11B3F9   |
    LDY #$02            ; $11B3FB   |
    LDA $3002           ; $11B3FD   |
    STA $7220,x         ; $11B400   |
    BPL CODE_11B407     ; $11B403   |
    DEY                 ; $11B405   |
    DEY                 ; $11B406   |

CODE_11B407:
    TYA                 ; $11B407   |
    STA $7400,x         ; $11B408   |
    LDA #$0001          ; $11B40B   |
    STA $7402,x         ; $11B40E   |
    LDA #$0003          ; $11B411   |
    STA $7A98,x         ; $11B414   |
    STZ $78,x           ; $11B417   |
    RTL                 ; $11B419   |

    LDY $76,x           ; $11B41A   |
    LDA $70E2,y         ; $11B41C   |
    STA $3002           ; $11B41F   |
    LDA $7182,x         ; $11B422   |
    STA $3004           ; $11B425   |
    STA $3008           ; $11B428   |
    LDA $70E2,x         ; $11B42B   |
    STA $3006           ; $11B42E   |
    LDA #$0300          ; $11B431   |
    STA $300C           ; $11B434   |
    LDX #$09            ; $11B437   |
    LDA #$907C          ; $11B439   |
    JSL $7EDE44         ; $11B43C   | GSU init
    LDX $12             ; $11B440   |
    LDA $3002           ; $11B442   |
    STA $7220,x         ; $11B445   |
    LDY $76,x           ; $11B448   |
    LDA $70E2,x         ; $11B44A   |
    SEC                 ; $11B44D   |
    SBC $70E2,y         ; $11B44E   |
    BEQ CODE_11B458     ; $11B451   |
    EOR $3002           ; $11B453   |
    BMI CODE_11B45E     ; $11B456   |

CODE_11B458:
    LDA $70E2,y         ; $11B458   |
    STA $70E2,x         ; $11B45B   |

CODE_11B45E:
    LDA $7860,y         ; $11B45E   |
    LSR A               ; $11B461   |
    BCS CODE_11B495     ; $11B462   |
    LDA $7182,y         ; $11B464   |
    CMP #$00A0          ; $11B467   |
    BCS CODE_11B495     ; $11B46A   |
    LDA $7860,x         ; $11B46C   |
    LSR A               ; $11B46F   |
    BCC CODE_11B495     ; $11B470   |
    LDA $70E2,y         ; $11B472   |
    SEC                 ; $11B475   |
    SBC $70E2,x         ; $11B476   |
    CLC                 ; $11B479   |
    ADC #$0038          ; $11B47A   |
    CMP #$0070          ; $11B47D   |
    BCS CODE_11B495     ; $11B480   |
    LDA $7860,x         ; $11B482   |
    LSR A               ; $11B485   |
    BCC CODE_11B495     ; $11B486   |
    LDA #$FA00          ; $11B488   |
    STA $7222,x         ; $11B48B   |
    LDA #$0038          ; $11B48E   |\ play sound #$0038
    JSL $0085D2         ; $11B491   |/

CODE_11B495:
    LDY $76,x           ; $11B495   |
    LDA $6F00,y         ; $11B497   |
    BNE CODE_11B4A4     ; $11B49A   |
    STZ $7220,x         ; $11B49C   |
    STZ $18,x           ; $11B49F   |
    STZ $7A36,x         ; $11B4A1   |

CODE_11B4A4:
    LDY #$09            ; $11B4A4   |
    LDA $7220,x         ; $11B4A6   |
    BEQ CODE_11B4BE     ; $11B4A9   |
    LDA $7A98,x         ; $11B4AB   |
    BNE CODE_11B4C2     ; $11B4AE   |
    LDA #$0003          ; $11B4B0   |
    STA $7A98,x         ; $11B4B3   |
    LDY $7402,x         ; $11B4B6   |
    DEY                 ; $11B4B9   |
    BPL CODE_11B4BE     ; $11B4BA   |
    LDY #$01            ; $11B4BC   |

CODE_11B4BE:
    TYA                 ; $11B4BE   |
    STA $7402,x         ; $11B4BF   |

CODE_11B4C2:
    RTL                 ; $11B4C2   |

DATA_11B4C3:         dw $FD00, $0300

DATA_11B4C7:         dw $0300, $FD00

    LDY $7D36,x         ; $11B4CB   |
    BPL CODE_11B4D3     ; $11B4CE   |
    JMP CODE_11B570     ; $11B4D0   |

CODE_11B4D3:
    LDA $7860,x         ; $11B4D3   |
    LSR A               ; $11B4D6   |
    BCC CODE_11B502     ; $11B4D7   |
    LDA $608C           ; $11B4D9   |
    SEC                 ; $11B4DC   |
    SBC $70E2,x         ; $11B4DD   |
    CLC                 ; $11B4E0   |
    ADC #$0038          ; $11B4E1   |
    CMP #$0070          ; $11B4E4   |
    BCS CODE_11B502     ; $11B4E7   |
    LDA #$FC00          ; $11B4E9   |
    STA $7222,x         ; $11B4EC   |
    LDA #$0017          ; $11B4EF   |
    STA $7402,x         ; $11B4F2   |
    LDA #$0003          ; $11B4F5   |
    STA $18,x           ; $11B4F8   |
    LDA #$0038          ; $11B4FA   |\ play sound #$0038
    JSL $0085D2         ; $11B4FD   |/
    RTL                 ; $11B501   |

CODE_11B502:
    LDA $608C           ; $11B502   |
    STA $3002           ; $11B505   |
    LDA $7182,x         ; $11B508   |
    STA $3004           ; $11B50B   |
    STA $3008           ; $11B50E   |
    LDA $70E2,x         ; $11B511   |
    STA $3006           ; $11B514   |
    LDA #$0200          ; $11B517   |
    STA $300C           ; $11B51A   |
    LDX #$09            ; $11B51D   |
    LDA #$907C          ; $11B51F   |
    JSL $7EDE44         ; $11B522   | GSU init
    LDX $12             ; $11B526   |
    LDA $3002           ; $11B528   |
    STA $7220,x         ; $11B52B   |
    LDA $70E2,x         ; $11B52E   |
    SEC                 ; $11B531   |
    SBC $608C           ; $11B532   |
    BEQ CODE_11B53C     ; $11B535   |
    EOR $3002           ; $11B537   |
    BMI CODE_11B542     ; $11B53A   |

CODE_11B53C:
    LDA $608C           ; $11B53C   |
    STA $70E2,x         ; $11B53F   |

CODE_11B542:
    LDA $7A96,x         ; $11B542   |
    BEQ CODE_11B567     ; $11B545   |
    LDY #$09            ; $11B547   |
    LDA $7220,x         ; $11B549   |
    BEQ CODE_11B561     ; $11B54C   |
    LDA $7A98,x         ; $11B54E   |
    BNE CODE_11B56F     ; $11B551   |
    LDA #$0003          ; $11B553   |
    STA $7A98,x         ; $11B556   |
    LDY $7402,x         ; $11B559   |
    DEY                 ; $11B55C   |
    BPL CODE_11B561     ; $11B55D   |
    LDY #$01            ; $11B55F   |

CODE_11B561:
    TYA                 ; $11B561   |
    STA $7402,x         ; $11B562   |
    BRA CODE_11B56F     ; $11B565   |

CODE_11B567:
    LDA #$0009          ; $11B567   |
    STA $7402,x         ; $11B56A   |
    STZ $18,x           ; $11B56D   |

CODE_11B56F:
    RTL                 ; $11B56F   |

CODE_11B570:
    LDA $7C18,x         ; $11B570   |
    SEC                 ; $11B573   |
    SBC $6122           ; $11B574   |
    SEC                 ; $11B577   |
    SBC $7BB8,x         ; $11B578   |
    CMP #$FFF8          ; $11B57B   |
    BCC CODE_11B5D7     ; $11B57E   |
    LDY #$3A            ; $11B580   |
    JSL $03A0E7         ; $11B582   |
    LDA #$001C          ; $11B586   |\ play sound #$001C
    JSL $0085D2         ; $11B589   |/
    LDA #$0001          ; $11B58D   |
    STA $7A36,x         ; $11B590   |
    LDA $18,x           ; $11B593   |
    CMP #$0003          ; $11B595   |
    BNE CODE_11B5BD     ; $11B598   |
    LDA $7222,x         ; $11B59A   |
    BPL CODE_11B5A8     ; $11B59D   |
    EOR #$FFFF          ; $11B59F   |
    INC A               ; $11B5A2   |
    STA $7222,x         ; $11B5A3   |
    BRA CODE_11B5BD     ; $11B5A6   |

CODE_11B5A8:
    LDA #$FC00          ; $11B5A8   |
    STA $7222,x         ; $11B5AB   |
    LDY $77C2,x         ; $11B5AE   |
    LDA $B4C7,y         ; $11B5B1   |
    STA $7220,x         ; $11B5B4   |
    LDA #$0017          ; $11B5B7   |
    STA $7402,x         ; $11B5BA   |

CODE_11B5BD:
    LDA #$0008          ; $11B5BD   |
    STA $60C0           ; $11B5C0   |
    LDA #$FA00          ; $11B5C3   |
    STA $60AA           ; $11B5C6   |
    LDY $77C2,x         ; $11B5C9   |
    LDA $B4C3,y         ; $11B5CC   |
    STA $60A8           ; $11B5CF   |
    STA $60B4           ; $11B5D2   |
    BRA CODE_11B62C     ; $11B5D5   |

CODE_11B5D7:
    LDA $7C18,x         ; $11B5D7   |
    CLC                 ; $11B5DA   |
    ADC $6122           ; $11B5DB   |
    CLC                 ; $11B5DE   |
    ADC $7BB8,x         ; $11B5DF   |
    CMP #$0008          ; $11B5E2   |
    BCC CODE_11B5F0     ; $11B5E5   |
    LDA #$0034          ; $11B5E7   |\ play sound #$0034
    JSL $0085D2         ; $11B5EA   |/
    BRA CODE_11B5A8     ; $11B5EE   |

CODE_11B5F0:
    LDA #$0017          ; $11B5F0   |\ play sound #$0017
    JSL $0085D2         ; $11B5F3   |/
    JSL $04F74A         ; $11B5F7   |
    LDA #$00C0          ; $11B5FB   |
    STA $61D6           ; $11B5FE   |
    STZ $60D4           ; $11B601   |
    LDA $60C0           ; $11B604   |
    BNE CODE_11B617     ; $11B607   |
    LDA $60AA           ; $11B609   |
    BPL CODE_11B5A8     ; $11B60C   |
    EOR #$FFFF          ; $11B60E   |
    INC A               ; $11B611   |
    STA $60AA           ; $11B612   |
    BRA CODE_11B617     ; $11B615   |

CODE_11B617:
    LDA #$FC00          ; $11B617   |
    STA $7222,x         ; $11B61A   |
    LDY $77C2,x         ; $11B61D   |
    LDA $B4C7,y         ; $11B620   |
    STA $7220,x         ; $11B623   |
    LDA #$0017          ; $11B626   |
    STA $7402,x         ; $11B629   |

CODE_11B62C:
    LDA #$0003          ; $11B62C   |
    STA $18,x           ; $11B62F   |
    RTL                 ; $11B631   |

    LDA $7A36,x         ; $11B632   |
    BNE CODE_11B640     ; $11B635   |
    LDY $7D36,x         ; $11B637   |
    BPL CODE_11B640     ; $11B63A   |
    JSL $11B570         ; $11B63C   |

CODE_11B640:
    LDY #$BD18          ; $11B640   |
    JSL $011072         ; $11B643   |
    DEY                 ; $11B647   |
    TYA                 ; $11B648   |
    STA $7402,x         ; $11B649   |
    LDA $7860,x         ; $11B64C   |
    LSR A               ; $11B64F   |
    BCC CODE_11B678     ; $11B650   |
    STZ $7220,x         ; $11B652   |
    INC $18,x           ; $11B655   |
    LDA #$0019          ; $11B657   |
    STA $7402,x         ; $11B65A   |
    STZ $78,x           ; $11B65D   |
    LDA #$0004          ; $11B65F   |
    STA $7A98,x         ; $11B662   |
    STZ $7181,x         ; $11B665   |
    LDA #$00C0          ; $11B668   |
    STA $7182,x         ; $11B66B   |
    LDA $7A36,x         ; $11B66E   |
    BEQ CODE_11B678     ; $11B671   |
    LDA #$0006          ; $11B673   |
    STA $78,x           ; $11B676   |

CODE_11B678:
    RTL                 ; $11B678   |

DATA_11B679:         dw $0019, $001A, $001B, $001C
DATA_11B681:         dw $001D, $0009, $0012, $0013
DATA_11B689:         dw $0014, $0015, $0016, $0015
DATA_11B691:         dw $0016, $0015, $0016, $0015
DATA_11B699:         dw $0009

DATA_11B69B:         dw $0004, $0004, $0008, $0002
DATA_11B6A3:         dw $0002, $0000, $0004, $0004
DATA_11B6AB:         dw $0004, $0014, $0002, $0002
DATA_11B6B3:         dw $0002, $0002, $0002, $0014
DATA_11B6BB:         dw $0000

    LDA $7A98,x         ; $11B6BD   |
    BNE CODE_11B6DB     ; $11B6C0   |
    INC $78,x           ; $11B6C2   |
    LDA $78,x           ; $11B6C4   |
    ASL A               ; $11B6C6   |
    TAY                 ; $11B6C7   |
    LDA $B679,y         ; $11B6C8   |
    STA $7402,x         ; $11B6CB   |
    LDA $B69B,y         ; $11B6CE   |
    STA $7A98,x         ; $11B6D1   |
    BNE CODE_11B6DB     ; $11B6D4   |
    STZ $18,x           ; $11B6D6   |
    STZ $7A36,x         ; $11B6D8   |

CODE_11B6DB:
    RTL                 ; $11B6DB   |

DATA_11B6DC:         dw $6060, $2520, $2521, $2522
DATA_11B6E4:         dw $257F, $2523, $2524, $E532
DATA_11B6EC:         dw $A530, $2530, $A521, $A521
DATA_11B6F4:         dw $257F, $2533, $2534, $2532
DATA_11B6FC:         dw $2529, $2D20, $2D21, $2D22
DATA_11B704:         dw $2D7F, $2D25, $2D21, $ED31
DATA_11B70C:         dw $2D26, $AD30, $2D30, $AD21
DATA_11B714:         dw $AD21, $2D7F, $2D35, $AD21
DATA_11B71C:         dw $2D31, $2D35, $2D29, $0003
DATA_11B724:         dw $0006, $0005, $0007, $B744
DATA_11B72C:         dw $35AC, $0180, $DE18, $11B6
DATA_11B734:         dw $0010, $B738, $35CC, $0180
DATA_11B73C:         dw $EE18, $11B6, $0010, $B744
DATA_11B744:         dw $B75E, $35AC, $0180, $FE18
DATA_11B74C:         dw $11B6, $0012, $B752, $35CC
DATA_11B754:         dw $0180, $1018, $11B7, $0012
DATA_11B75C:         dw $B75E, $6B6B, $6B6B, $6B6B
DATA_11B764:         dw $6060, $6B6B, $6B6B, $6B6B
DATA_11B76C:         dw $6B6B

    REP #$20            ; $11B76E   |
    STZ $39             ; $11B770   |
    STZ $3B             ; $11B772   |
    STZ $3D             ; $11B774   |
    STZ $3F             ; $11B776   |
    STZ $41             ; $11B778   |
    STZ $43             ; $11B77A   |

    LDY #$69            ; $11B77C   |
    STY $095F           ; $11B77E   |
    STY $2107           ; $11B781   |
    LDY #$39            ; $11B784   |
    STY $0960           ; $11B786   |
    STY $2108           ; $11B789   |
    LDY #$09            ; $11B78C   |
    STY $095E           ; $11B78E   |
    STY $2105           ; $11B791   |
    LDY #$00            ; $11B794   |
    STY $094A           ; $11B796   |
    STY $096C           ; $11B799   |

    LDA #$00B0          ; $11B79E   |
    STA $6090           ; $11B7A1   |
    LDA #$0030          ; $11B7A4   |
    STA $608C           ; $11B7A7   |
    STZ $6CAA           ; $11B7AA   |
    STA $03B6           ; $11B7AD   |
    STZ $03BC           ; $11B7B0   |
    LDA #$0008          ; $11B7B3   |
    STA $1100           ; $11B7B6   |
    STA $1102           ; $11B7B9   |
    LDA #$FFFF          ; $11B7BC   |
    STA $6EB6           ; $11B7BF   |
    STA $6EB8           ; $11B7C2   |
    STA $6EBA           ; $11B7C5   |
    STZ $6CAA           ; $11B7C8   |
    LDA #$FCEB          ; $11B7CB   |
    STA $32             ; $11B7CE   |
    LDA #$0001          ; $11B7D0   |
    STA $0136           ; $11B7D3   |
    LDA #$01B7          ; $11B7D6   |
    JSL $03A34C         ; $11B7D9   |
    LDA #$01B8          ; $11B7DD   |
    JSL $03A34C         ; $11B7E0   |
    LDA #$0030          ; $11B7E4   |
    STA $70E2,y         ; $11B7E7   |
    LDA #$0050          ; $11B7EA   |
    STA $7182,y         ; $11B7ED   |
    LDA #$01B8          ; $11B7F0   |
    JSL $03A34C         ; $11B7F3   |
    LDA #$00B0          ; $11B7F7   |
    STA $70E2,y         ; $11B7FA   |
    LDA #$0040          ; $11B7FD   |
    STA $7182,y         ; $11B800   |
    LDA #$01B8          ; $11B803   |
    JSL $03A34C         ; $11B806   |
    LDA #$0020          ; $11B80A   |
    STA $70E2,y         ; $11B80D   |
    LDA #$0090          ; $11B810   |
    STA $7182,y         ; $11B813   |
    LDA #$01B8          ; $11B816   |
    JSL $03A34C         ; $11B819   |
    LDA #$00A0          ; $11B81D   |
    STA $70E2,y         ; $11B820   |
    LDA #$0080          ; $11B823   |
    STA $7182,y         ; $11B826   |
    LDA #$01B8          ; $11B829   |
    JSL $03A34C         ; $11B82C   |
    LDA #$0090          ; $11B830   |
    STA $70E2,y         ; $11B833   |
    LDA #$00C0          ; $11B836   |
    STA $7182,y         ; $11B839   |
    LDA #$01B8          ; $11B83C   |
    JSL $03A34C         ; $11B83F   |
    LDA #$00E0          ; $11B843   |
    STA $70E2,y         ; $11B846   |
    LDA #$00C0          ; $11B849   |
    STA $7182,y         ; $11B84C   |
    JSL $0397D3         ; $11B84F   |

    LDA #$15            ; $11B853   |
    STA $34             ; $11B855   |
    JSL $108B61         ; $11B857   |
    RTS                 ; $11B85B   |

    JSL $008259         ; $11B85C   |
    LDA #$30            ; $11B860   |
    STA $6126           ; $11B862   |
    JSL $0394CF         ; $11B865   |
    JSL $04FA67         ; $11B869   |
    STZ $03BA           ; $11B86D   |
    LDA $10F8           ; $11B870   |
    ASL A               ; $11B873   |
    TAX                 ; $11B874   |
    JSR ($B886,x)       ; $11B875   |

    REP #$20            ; $11B878   |
    LDX #$08            ; $11B87A   |
    LDA #$B1EF          ; $11B87C   |
    JSL $7EDE44         ; $11B87F   | GSU init
    SEP #$20            ; $11B883   |
    RTS                 ; $11B885   |

DATA_11B886:         dw $B88C
DATA_11B888:         dw $B89D
DATA_11B88A:         dw $B8C2

    JSL $04DD9E         ; $11B88C   |
    LDA $0D0F           ; $11B890   |
    BNE CODE_11B89C     ; $11B893   |
    JSL $0397D3         ; $11B895   |
    JSR CODE_11B8E2     ; $11B899   |

CODE_11B89C:
    RTS                 ; $11B89C   |

    JSL $04DD9E         ; $11B89D   |
    JSL $0397D3         ; $11B8A1   |
    LDA $10FA           ; $11B8A5   |
    BEQ CODE_11B8BF     ; $11B8A8   |
    LDA $60C0           ; $11B8AA   |
    BNE CODE_11B8BF     ; $11B8AD   |
    REP #$20            ; $11B8AF   |
    LDA #$0080          ; $11B8B1   |
    STA $10F0           ; $11B8B4   |
    SEP #$20            ; $11B8B7   |
    INC $10F8           ; $11B8B9   |
    INC $61AE           ; $11B8BC   |

CODE_11B8BF:
    JMP CODE_11AEC4     ; $11B8BF   |

    JSL $04DD9E         ; $11B8C2   |
    JSL $0397D3         ; $11B8C6   |
    REP #$20            ; $11B8CA   |
    DEC $10F0           ; $11B8CC   |
    BNE CODE_11B8D5     ; $11B8CF   |
    JSL $11AD2A         ; $11B8D1   |

CODE_11B8D5:
    LDA #$0001          ; $11B8D5   |
    STA $61AE           ; $11B8D8   |
    JMP CODE_11AEC4     ; $11B8DB   |

DATA_11B8DE:         dw $0001, $0002

CODE_11B8E2:
    LDA $03BC           ; $11B8E2   |
    BEQ CODE_11B8FD     ; $11B8E5   |
    LDA $03BC           ; $11B8E7   |
    ASL A               ; $11B8EA   |
    STA $04             ; $11B8EB   |
    LDA $1100           ; $11B8ED   |
    SEC                 ; $11B8F0   |
    SBC $04             ; $11B8F1   |
    BPL CODE_11B8F7     ; $11B8F3   |
    LDA #$00            ; $11B8F5   |

CODE_11B8F7:
    STA $1100           ; $11B8F7   |
    STZ $03BC           ; $11B8FA   |

CODE_11B8FD:
    PHB                 ; $11B8FD   |
    LDA #$7E            ; $11B8FE   |
    PHA                 ; $11B900   |
    PLB                 ; $11B901   |
    REP #$30            ; $11B902   |
    LDX $4800           ; $11B904   |
    LDA #$3483          ; $11B907   |
    STA $0000,x         ; $11B90A   |
    LDA #$3495          ; $11B90D   |
    STA $001C,x         ; $11B910   |
    LDA #$0180          ; $11B913   |
    STA $0002,x         ; $11B916   |
    STA $001E,x         ; $11B919   |
    LDA #$0018          ; $11B91C   |
    STA $0004,x         ; $11B91F   |
    STA $0020,x         ; $11B922   |
    TXA                 ; $11B925   |
    CLC                 ; $11B926   |
    ADC #$000C          ; $11B927   |
    STA $0005,x         ; $11B92A   |
    ADC #$001C          ; $11B92D   |
    STA $0021,x         ; $11B930   |
    LDA #$007E          ; $11B933   |
    STA $0007,x         ; $11B936   |
    STA $0023,x         ; $11B939   |
    LDA #$0010          ; $11B93C   |
    STA $0008,x         ; $11B93F   |
    STA $0024,x         ; $11B942   |
    TXA                 ; $11B945   |
    ADC #$001C          ; $11B946   |
    STA $000A,x         ; $11B949   |
    ADC #$001C          ; $11B94C   |
    STA $0026,x         ; $11B94F   |
    STA $4800           ; $11B952   |
    PLB                 ; $11B955   |
    TXA                 ; $11B956   |
    SEC                 ; $11B957   |
    SBC #$4802          ; $11B958   |
    STA $04             ; $11B95B   |
    TAX                 ; $11B95D   |
    LDY $1100           ; $11B95E   |
    LDA #$0008          ; $11B961   |
    SEC                 ; $11B964   |
    SBC $1100           ; $11B965   |
    STA $06             ; $11B968   |
    CMP #$0008          ; $11B96A   |
    BEQ CODE_11B986     ; $11B96D   |
    LDA #$2948          ; $11B96F   |

CODE_11B972:
    STA $7E480E,x       ; $11B972   |
    INX                 ; $11B976   |
    INX                 ; $11B977   |
    DEY                 ; $11B978   |
    BNE CODE_11B972     ; $11B979   |
    LDA #$2949          ; $11B97B   |
    STA $7E480C,x       ; $11B97E   |
    LDA $06             ; $11B982   |
    BEQ CODE_11B993     ; $11B984   |

CODE_11B986:
    LDA #$2946          ; $11B986   |

CODE_11B989:
    STA $7E480E,x       ; $11B989   |
    INX                 ; $11B98D   |
    INX                 ; $11B98E   |
    DEC $06             ; $11B98F   |
    BNE CODE_11B989     ; $11B991   |

CODE_11B993:
    LDX $04             ; $11B993   |
    LDY $1102           ; $11B995   |
    LDA #$0008          ; $11B998   |
    SEC                 ; $11B99B   |
    SBC $1102           ; $11B99C   |
    STA $06             ; $11B99F   |
    CMP #$0008          ; $11B9A1   |
    BEQ CODE_11B9BD     ; $11B9A4   |
    LDA #$2948          ; $11B9A6   |

CODE_11B9A9:
    STA $7E482A,x       ; $11B9A9   |
    INX                 ; $11B9AD   |
    INX                 ; $11B9AE   |
    DEY                 ; $11B9AF   |
    BNE CODE_11B9A9     ; $11B9B0   |
    LDA #$2949          ; $11B9B2   |
    STA $7E4828,x       ; $11B9B5   |
    LDA $06             ; $11B9B9   |
    BEQ CODE_11B9CA     ; $11B9BB   |

CODE_11B9BD:
    LDA #$2946          ; $11B9BD   |

CODE_11B9C0:
    STA $7E482A,x       ; $11B9C0   |
    INX                 ; $11B9C4   |
    INX                 ; $11B9C5   |
    DEC $06             ; $11B9C6   |
    BNE CODE_11B9C0     ; $11B9C8   |

CODE_11B9CA:
    LDY #$0002          ; $11B9CA   |
    LDA $1100           ; $11B9CD   |
    BEQ CODE_11B9DA     ; $11B9D0   |
    LDA $1102           ; $11B9D2   |
    BNE CODE_11B9F9     ; $11B9D5   |
    LDY #$0000          ; $11B9D7   |

CODE_11B9DA:
    TYA                 ; $11B9DA   |
    LSR A               ; $11B9DB   |
    STA $10E6           ; $11B9DC   |
    LDA $B726,y         ; $11B9DF   |
    STA $4D             ; $11B9E2   |
    LDA $B8DE,y         ; $11B9E4   |
    STA $10F8           ; $11B9E7   |
    LDA #$0200          ; $11B9EA   |
    STA $10F0           ; $11B9ED   |
    JSR CODE_11B9FC     ; $11B9F0   |
    LDA #$0001          ; $11B9F3   |
    STA $10E2           ; $11B9F6   |

CODE_11B9F9:
    SEP #$30            ; $11B9F9   |
    RTS                 ; $11B9FB   |

CODE_11B9FC:
    LDX #$005C          ; $11B9FC   |

CODE_11B9FF:
    LDA $6F00,x         ; $11B9FF   |
    BEQ CODE_11BA28     ; $11BA02   |
    LDA $7360,x         ; $11BA04   |
    CMP #$01B7          ; $11BA07   |
    BNE CODE_11BA17     ; $11BA0A   |
    CPY #$0000          ; $11BA0C   |
    BNE CODE_11BA17     ; $11BA0F   |
    LDA #$000E          ; $11BA11   |
    STA $6F00,x         ; $11BA14   |

CODE_11BA17:
    LDA $6FA2,x         ; $11BA17   |
    AND #$6000          ; $11BA1A   |
    BNE CODE_11BA28     ; $11BA1D   |
    STZ $7220,x         ; $11BA1F   |
    STZ $7542,x         ; $11BA22   |
    STZ $7540,x         ; $11BA25   |

CODE_11BA28:
    STZ $7A38,x         ; $11BA28   |
    DEX                 ; $11BA2B   |
    DEX                 ; $11BA2C   |
    DEX                 ; $11BA2D   |
    DEX                 ; $11BA2E   |
    BPL CODE_11B9FF     ; $11BA2F   |
    CPY #$0000          ; $11BA31   |
    BNE CODE_11BA68     ; $11BA34   |
    LDA $10F2           ; $11BA36   |
    BNE CODE_11BA68     ; $11BA39   |
    SEP #$10            ; $11BA3B   |
    LDA #$0011          ; $11BA3D   |
    LDY #$04            ; $11BA40   |
    JSL $03A34E         ; $11BA42   |
    JSL $008408         ; $11BA46   |
    AND #$0003          ; $11BA4A   |
    CMP #$0003          ; $11BA4D   |
    BNE CODE_11BA55     ; $11BA50   |
    LDA #$0000          ; $11BA52   |

CODE_11BA55:
    CLC                 ; $11BA55   |
    ADC #$0007          ; $11BA56   |
    STA $7978,y         ; $11BA59   |
    LDA #$0098          ; $11BA5C   |
    STA $7182,y         ; $11BA5F   |
    LDA #$0078          ; $11BA62   |
    STA $70E2,y         ; $11BA65   |

CODE_11BA68:
    RTS                 ; $11BA68   |

.init_mini_battle_bandit_3
    LDA #$00C0          ; $11BA69   |
    STA $7182,x         ; $11BA6C   |
    LDA #$00C0          ; $11BA6F   |
    STA $70E2,x         ; $11BA72   |
    LDA #$0004          ; $11BA75   |
    STA $7A96,x         ; $11BA78   |
    RTL                 ; $11BA7B   |

DATA_11BA7C:         dw $0002, $0003, $0004, $0005
DATA_11BA84:         dw $0006, $0007, $0000, $0001
DATA_11BA8C:         dw $0008, $0009, $000A, $000B
DATA_11BA94:         dw $000C, $000D, $000E, $000F
DATA_11BA9C:         dw $0010, $0011, $0012, $0013
DATA_11BAA4:         dw $0014, $0015, $0016, $0017
DATA_11BAAC:         dw $0018, $0019, $001A, $001B
DATA_11BAB4:         dw $001A

DATA_11BAB6:         dw $0004, $0004, $0004, $0004
DATA_11BABE:         dw $0004, $0004, $0000, $0000
DATA_11BAC6:         dw $0002, $0002, $0008, $0008
DATA_11BACE:         dw $0000, $0000, $0000, $0000
DATA_11BAD6:         dw $0000, $0002, $0002, $0002
DATA_11BADE:         dw $0002, $0002, $0002, $0002
DATA_11BAE6:         dw $0002, $0000, $0000, $0000
DATA_11BAEE:         dw $0000

DATA_11BAF0:         dw $0000, $0006, $0008, $000A
DATA_11BAF8:         dw $000C, $0013, $0019

DATA_11BAFE:         dw $0006, $0008, $000A, $000C
DATA_11BB06:         dw $0013, $0019, $001D

DATA_11BB0C:         dw $0008, $0000

.main_mini_battle_bandit_3
    LDA $10F8           ; $11BB10   |
    BEQ CODE_11BB1E     ; $11BB13   |
    LDA #$0005          ; $11BB15   |
    STA $7978,x         ; $11BB18   |
    JMP CODE_11BC1B     ; $11BB1B   |

CODE_11BB1E:
    LDY $7400,x         ; $11BB1E   |
    LDA $70E2,x         ; $11BB21   |
    CLC                 ; $11BB24   |
    ADC $BB0C,y         ; $11BB25   |
    STA $3010           ; $11BB28   |
    LDA $7182,x         ; $11BB2B   |
    STA $3000           ; $11BB2E   |
    LDX #$0A            ; $11BB31   |
    LDA #$CE2F          ; $11BB33   |
    JSL $7EDE91         ; $11BB36   | GSU init
    LDX $12             ; $11BB3A   |
    REP #$10            ; $11BB3C   |
    LDA #$0010          ; $11BB3E   |
    STA $00             ; $11BB41   |
    LDA #$0600          ; $11BB43   |
    LDY $300C           ; $11BB46   |
    BEQ CODE_11BB55     ; $11BB49   |
    LDY $300A           ; $11BB4B   |
    BNE CODE_11BB55     ; $11BB4E   |
    STZ $00             ; $11BB50   |
    LDA #$0000          ; $11BB52   |

CODE_11BB55:
    STA $02             ; $11BB55   |
    SEP #$10            ; $11BB57   |
    LDA $6FA0,x         ; $11BB59   |
    AND #$F9FF          ; $11BB5C   |
    ORA $02             ; $11BB5F   |
    STA $6FA0,x         ; $11BB61   |
    LDA $7040,x         ; $11BB64   |
    AND #$FFEF          ; $11BB67   |
    ORA $00             ; $11BB6A   |
    STA $7040,x         ; $11BB6C   |
    LDA $6F00,x         ; $11BB6F   |
    CMP #$0010          ; $11BB72   |
    BNE CODE_11BB98     ; $11BB75   |
    LDY $7D36,x         ; $11BB77   |
    BEQ CODE_11BBD9     ; $11BB7A   |
    BMI CODE_11BBD9     ; $11BB7C   |
    DEY                 ; $11BB7E   |
    LDA $7360,y         ; $11BB7F   |
    CMP #$0107          ; $11BB82   |
    BNE CODE_11BBD9     ; $11BB85   |
    LDA $7A38,y         ; $11BB87   |
    BNE CODE_11BBD9     ; $11BB8A   |
    LDA $7AF6,x         ; $11BB8C   |
    BNE CODE_11BBD9     ; $11BB8F   |
    TYX                 ; $11BB91   |
    JSL $03B24B         ; $11BB92   |
    BRA CODE_11BBB0     ; $11BB96   |

CODE_11BB98:
    PLA                 ; $11BB98   |
    PLY                 ; $11BB99   |
    LDA #$0010          ; $11BB9A   |
    STA $6F00,x         ; $11BB9D   |
    LDA $7AF6,x         ; $11BBA0   |
    BNE CODE_11BBD9     ; $11BBA3   |
    LDA $1102           ; $11BBA5   |
    BEQ CODE_11BBB0     ; $11BBA8   |
    DEC $1102           ; $11BBAA   |
    DEC $1102           ; $11BBAD   |

CODE_11BBB0:
    LDA #$FD00          ; $11BBB0   |
    STA $7222,x         ; $11BBB3   |
    LDA #$0004          ; $11BBB6   |
    STA $18,x           ; $11BBB9   |
    LDA #$0080          ; $11BBBB   |
    STA $7AF6,x         ; $11BBBE   |
    LDA #$0020          ; $11BBC1   |
    STA $7042,x         ; $11BBC4   |
    LDA #$0075          ; $11BBC7   |\ play sound #$0075
    JSL $0085D2         ; $11BBCA   |/
    LDA $1102           ; $11BBCE   |
    BEQ CODE_11BBD9     ; $11BBD1   |
    DEC $1102           ; $11BBD3   |
    DEC $1102           ; $11BBD6   |

CODE_11BBD9:
    SEP #$20            ; $11BBD9   |
    LDY #$04            ; $11BBDB   |
    LDA $7AF6,x         ; $11BBDD   |
    AND #$04            ; $11BBE0   |
    BEQ CODE_11BBE6     ; $11BBE2   |
    LDY #$FF            ; $11BBE4   |

CODE_11BBE6:
    TYA                 ; $11BBE6   |
    STA $74A2,x         ; $11BBE7   |
    REP #$20            ; $11BBEA   |
    LDA $7680,x         ; $11BBEC   |
    CMP #$0010          ; $11BBEF   |
    BCS CODE_11BC04     ; $11BBF2   |
    LDA #$0010          ; $11BBF4   |
    SEC                 ; $11BBF7   |
    SBC $7680,x         ; $11BBF8   |
    CLC                 ; $11BBFB   |
    ADC $70E2,x         ; $11BBFC   |
    STA $70E2,x         ; $11BBFF   |
    BRA CODE_11BC18     ; $11BC02   |

CODE_11BC04:
    LDA $7680,x         ; $11BC04   |
    SEC                 ; $11BC07   |
    SBC #$00E0          ; $11BC08   |
    BMI CODE_11BC1B     ; $11BC0B   |
    STA $00             ; $11BC0D   |
    LDA $70E2,x         ; $11BC0F   |
    SEC                 ; $11BC12   |
    SBC $00             ; $11BC13   |
    STA $70E2,x         ; $11BC15   |

CODE_11BC18:
    STZ $7220,x         ; $11BC18   |

CODE_11BC1B:
    PEA $BC29           ; $11BC1B   |
    LDA $18,x           ; $11BC1E   |
    ASL A               ; $11BC20   |
    TAY                 ; $11BC21   |
    LDA $BCE7,y         ; $11BC22   |
    STA $00             ; $11BC25   |
    JMP ($7960)         ; $11BC27   |

    LDA $110A           ; $11BC2A   |
    BEQ CODE_11BC30     ; $11BC2D   |

CODE_11BC2F:
    RTL                 ; $11BC2F   |

CODE_11BC30:
    LDA $7A98,x         ; $11BC30   |
    BNE CODE_11BC2F     ; $11BC33   |
    LDA $7220,x         ; $11BC35   |
    BNE CODE_11BC41     ; $11BC38   |
    LDA #$0013          ; $11BC3A   |
    STA $7402,x         ; $11BC3D   |
    RTL                 ; $11BC40   |

CODE_11BC41:
    BPL CODE_11BC47     ; $11BC41   |
    EOR #$FFFF          ; $11BC43   |
    INC A               ; $11BC46   |

CODE_11BC47:
    CMP #$0100          ; $11BC47   |
    BCS CODE_11BC5B     ; $11BC4A   |
    LDA #$0005          ; $11BC4C   |
    CMP $110E           ; $11BC4F   |
    BEQ CODE_11BC67     ; $11BC52   |
    STA $110E           ; $11BC54   |
    ASL A               ; $11BC57   |
    TAY                 ; $11BC58   |
    BRA CODE_11BC83     ; $11BC59   |

CODE_11BC5B:
    LDA $110E           ; $11BC5B   |
    BEQ CODE_11BC67     ; $11BC5E   |
    STZ $110E           ; $11BC60   |
    LDY #$00            ; $11BC63   |
    BRA CODE_11BC83     ; $11BC65   |

CODE_11BC67:
    LDA $7860,x         ; $11BC67   |
    LSR A               ; $11BC6A   |
    BCS CODE_11BC73     ; $11BC6B   |
    LDA #$0001          ; $11BC6D   |
    STA $110C           ; $11BC70   |

CODE_11BC73:
    LDA $110E           ; $11BC73   |
    ASL A               ; $11BC76   |
    TAY                 ; $11BC77   |
    LDA $16,x           ; $11BC78   |
    INC A               ; $11BC7A   |
    CMP $BAFE,y         ; $11BC7B   |
    BNE CODE_11BC86     ; $11BC7E   |
    STZ $110C           ; $11BC80   |

CODE_11BC83:
    LDA $BAF0,y         ; $11BC83   |

CODE_11BC86:
    STA $16,x           ; $11BC86   |
    ASL A               ; $11BC88   |
    TAY                 ; $11BC89   |
    LDA $BA7C,y         ; $11BC8A   |
    STA $7402,x         ; $11BC8D   |
    LDA $BAB6,y         ; $11BC90   |
    STA $7A98,x         ; $11BC93   |
    LDA $110C           ; $11BC96   |
    BEQ CODE_11BCE6     ; $11BC99   |
    LDA $7860,x         ; $11BC9B   |
    LSR A               ; $11BC9E   |
    BCC CODE_11BCBC     ; $11BC9F   |
    STZ $110C           ; $11BCA1   |
    STZ $110E           ; $11BCA4   |
    LDY #$00            ; $11BCA7   |
    LDA $BAF0,y         ; $11BCA9   |
    STA $16,x           ; $11BCAC   |
    LDA $BA7C,y         ; $11BCAE   |
    STA $7402,x         ; $11BCB1   |
    LDA $BAB6,y         ; $11BCB4   |
    STA $7A98,x         ; $11BCB7   |
    BRA CODE_11BCE6     ; $11BCBA   |

CODE_11BCBC:
    LDY #$00            ; $11BCBC   |
    LDA $7182,x         ; $11BCBE   |
    CMP #$FD00          ; $11BCC1   |
    BCC CODE_11BCDE     ; $11BCC4   |
    INY                 ; $11BCC6   |
    CMP #$FF00          ; $11BCC7   |
    BCC CODE_11BCDE     ; $11BCCA   |
    INY                 ; $11BCCC   |
    CMP #$0000          ; $11BCCD   |
    BCC CODE_11BCDE     ; $11BCD0   |
    CMP #$0100          ; $11BCD2   |
    BCC CODE_11BCDE     ; $11BCD5   |
    INY                 ; $11BCD7   |
    CMP #$0300          ; $11BCD8   |
    BCC CODE_11BCDE     ; $11BCDB   |
    INY                 ; $11BCDD   |

CODE_11BCDE:
    TYA                 ; $11BCDE   |
    CLC                 ; $11BCDF   |
    ADC #$000C          ; $11BCE0   |
    STA $7402,x         ; $11BCE3   |

CODE_11BCE6:
    RTL                 ; $11BCE6   |

DATA_11BCE7:         dw $BCF3
DATA_11BCE9:         dw $BD7C
DATA_11BCEB:         dw $C013
DATA_11BCED:         dw $C2CF
DATA_11BCEF:         dw $C3E1
DATA_11BCF1:         dw $BCFD

    LDA $1104           ; $11BCF3   |
    BEQ CODE_11BCFE     ; $11BCF6   |
    LDA #$0002          ; $11BCF8   |
    STA $18,x           ; $11BCFB   |
    RTS                 ; $11BCFD   |

CODE_11BCFE:
    TXA                 ; $11BCFE   |
    STA $3002           ; $11BCFF   |
    LDX #$09            ; $11BD02   |
    LDA #$8DDA          ; $11BD04   |
    JSL $7EDE44         ; $11BD07   | GSU init
    LDX $12             ; $11BD0B   |
    LDA $3002           ; $11BD0D   |
    BMI CODE_11BD7B     ; $11BD10   |
    STA $76,x           ; $11BD12   |
    TAY                 ; $11BD14   |
    LDA $7860,x         ; $11BD15   |
    LSR A               ; $11BD18   |
    BCC CODE_11BD7B     ; $11BD19   |
    LDA $70E2,y         ; $11BD1B   |
    STA $3002           ; $11BD1E   |
    LDA $7182,y         ; $11BD21   |
    STA $3004           ; $11BD24   |
    LDA $70E2,x         ; $11BD27   |
    STA $3006           ; $11BD2A   |
    LDA $7182,x         ; $11BD2D   |
    STA $3008           ; $11BD30   |
    LDA #$0200          ; $11BD33   |
    STA $300C           ; $11BD36   |
    LDX #$09            ; $11BD39   |
    LDA #$907C          ; $11BD3B   |
    JSL $7EDE44         ; $11BD3E   | GSU init
    LDX $12             ; $11BD42   |
    LDA $3004           ; $11BD44   |
    BPL CODE_11BD69     ; $11BD47   |
    LDY $76,x           ; $11BD49   |
    LDA $7182,x         ; $11BD4B   |
    SEC                 ; $11BD4E   |
    SBC $7182,y         ; $11BD4F   |
    CMP #$0020          ; $11BD52   |
    BCS CODE_11BD5C     ; $11BD55   |
    LDA #$FC00          ; $11BD57   |
    BRA CODE_11BD5F     ; $11BD5A   |

CODE_11BD5C:
    LDA #$FA80          ; $11BD5C   |

CODE_11BD5F:
    STA $7222,x         ; $11BD5F   |
    LDA #$0038          ; $11BD62   |\ play sound #$0038
    JSL $0085D2         ; $11BD65   |/

CODE_11BD69:
    LDY #$02            ; $11BD69   |
    LDA $3002           ; $11BD6B   |
    STA $7220,x         ; $11BD6E   |
    BPL CODE_11BD75     ; $11BD71   |
    LDY #$00            ; $11BD73   |

CODE_11BD75:
    TYA                 ; $11BD75   |
    STA $7400,x         ; $11BD76   |
    INC $18,x           ; $11BD79   |

CODE_11BD7B:
    RTS                 ; $11BD7B   |

    LDA $6150           ; $11BD7C   |
    BEQ CODE_11BDAE     ; $11BD7F   |
    LDA $616A           ; $11BD81   |
    BEQ CODE_11BDAE     ; $11BD84   |
    LDA $02             ; $11BD86   |
    BEQ CODE_11BDAE     ; $11BD88   |
    LDA $7860,x         ; $11BD8A   |
    LSR A               ; $11BD8D   |
    BCC CODE_11BDAE     ; $11BD8E   |
    LDA $7182,x         ; $11BD90   |
    SEC                 ; $11BD93   |
    SBC $6090           ; $11BD94   |
    CLC                 ; $11BD97   |
    ADC #$0010          ; $11BD98   |
    CMP #$0031          ; $11BD9B   |
    BCS CODE_11BDAE     ; $11BD9E   |
    LDA #$FA80          ; $11BDA0   |
    STA $7222,x         ; $11BDA3   |
    LDA #$0038          ; $11BDA6   |\ play sound #$0038
    JSL $0085D2         ; $11BDA9   |/
    RTS                 ; $11BDAD   |

CODE_11BDAE:
    LDY $7D36,x         ; $11BDAE   |
    BEQ CODE_11BDEE     ; $11BDB1   |
    BMI CODE_11BDEE     ; $11BDB3   |
    DEY                 ; $11BDB5   |
    LDA $6F00,y         ; $11BDB6   |
    CMP #$0010          ; $11BDB9   |
    BNE CODE_11BDEE     ; $11BDBC   |
    LDA $7360,y         ; $11BDBE   |
    CMP #$0007          ; $11BDC1   |
    BEQ CODE_11BDCB     ; $11BDC4   |
    CMP #$0009          ; $11BDC6   |
    BNE CODE_11BDEE     ; $11BDC9   |

CODE_11BDCB:
    STA $1104           ; $11BDCB   |
    LDA #$0003          ; $11BDCE   |
    STA $1106           ; $11BDD1   |
    TYX                 ; $11BDD4   |
    JSL $03A31E         ; $11BDD5   |
    LDX $12             ; $11BDD9   |
    INC $18,x           ; $11BDDB   |
    RTS                 ; $11BDDD   |

CODE_11BDDE:
    LDA $0030           ; $11BDDE   |
    AND #$0008          ; $11BDE1   |
    LSR A               ; $11BDE4   |
    LSR A               ; $11BDE5   |
    LSR A               ; $11BDE6   |
    ORA #$000A          ; $11BDE7   |
    STA $7402,x         ; $11BDEA   |
    RTS                 ; $11BDED   |

CODE_11BDEE:
    TXA                 ; $11BDEE   |
    STA $3002           ; $11BDEF   |
    LDX #$09            ; $11BDF2   |
    LDA #$8DDA          ; $11BDF4   |
    JSL $7EDE44         ; $11BDF7   | GSU init
    LDX $12             ; $11BDFB   |
    LDA $3002           ; $11BDFD   |
    BMI CODE_11BDDE     ; $11BE00   |
    STA $76,x           ; $11BE02   |
    LDA $78,x           ; $11BE04   |
    BEQ CODE_11BE31     ; $11BE06   |
    LDY $7900,x         ; $11BE08   |
    BNE CODE_11BE20     ; $11BE0B   |
    LDA $70E2,x         ; $11BE0D   |
    CMP #$0010          ; $11BE10   |
    BCS CODE_11BE2E     ; $11BE13   |
    LDA #$0002          ; $11BE15   |
    STA $7900,x         ; $11BE18   |
    STA $7400,x         ; $11BE1B   |
    BRA CODE_11BE2E     ; $11BE1E   |

CODE_11BE20:
    LDA $70E2,x         ; $11BE20   |
    CMP #$00E0          ; $11BE23   |
    BCC CODE_11BE2E     ; $11BE26   |
    STZ $7900,x         ; $11BE28   |
    STZ $7400,x         ; $11BE2B   |

CODE_11BE2E:
    JMP CODE_11BEC4     ; $11BE2E   |

CODE_11BE31:
    LDA $7860,x         ; $11BE31   |
    LSR A               ; $11BE34   |
    BCS CODE_11BE3A     ; $11BE35   |
    JMP CODE_11BED0     ; $11BE37   |

CODE_11BE3A:
    LDY #$00            ; $11BE3A   |
    LDA $70E2,x         ; $11BE3C   |
    SEC                 ; $11BE3F   |
    SBC #$0080          ; $11BE40   |
    BPL CODE_11BE47     ; $11BE43   |
    LDY #$02            ; $11BE45   |

CODE_11BE47:
    TYA                 ; $11BE47   |
    STA $7900,x         ; $11BE48   |
    STA $7400,x         ; $11BE4B   |
    LDY $76,x           ; $11BE4E   |
    LDA $70E2,x         ; $11BE50   |
    SEC                 ; $11BE53   |
    SBC $70E2,y         ; $11BE54   |
    CLC                 ; $11BE57   |
    ADC #$0010          ; $11BE58   |
    CMP #$0021          ; $11BE5B   |
    BCS CODE_11BED0     ; $11BE5E   |
    LDA $7182,x         ; $11BE60   |
    STA $7902,x         ; $11BE63   |
    SEC                 ; $11BE66   |
    SBC $7182,y         ; $11BE67   |
    CLC                 ; $11BE6A   |
    ADC #$0020          ; $11BE6B   |
    LDY #$01            ; $11BE6E   |
    CMP #$0031          ; $11BE70   |
    BCC CODE_11BED0     ; $11BE73   |
    BMI CODE_11BEC1     ; $11BE75   |
    CMP #$00A1          ; $11BE77   |
    BCS CODE_11BED0     ; $11BE7A   |
    LDA #$FE00          ; $11BE7C   |
    LDY $70E2,x         ; $11BE7F   |
    CPY #$31            ; $11BE82   |
    BCS CODE_11BE89     ; $11BE84   |
    LDA #$0200          ; $11BE86   |

CODE_11BE89:
    STA $7902,x         ; $11BE89   |
    LDA $70E2,x         ; $11BE8C   |
    SEC                 ; $11BE8F   |
    SBC #$0010          ; $11BE90   |
    CLC                 ; $11BE93   |
    ADC #$0008          ; $11BE94   |
    STA $3010           ; $11BE97   |
    LDA $7182,x         ; $11BE9A   |
    STA $3000           ; $11BE9D   |
    LDX #$0A            ; $11BEA0   |
    LDA #$CE2F          ; $11BEA2   |
    JSL $7EDE91         ; $11BEA5   | GSU init
    LDX $12             ; $11BEA9   |
    LDY #$02            ; $11BEAB   |
    LDA $300A           ; $11BEAD   |
    BEQ CODE_11BEC1     ; $11BEB0   |
    LDA #$FC00          ; $11BEB2   |
    STA $7222,x         ; $11BEB5   |
    PHY                 ; $11BEB8   |
    LDA #$0038          ; $11BEB9   |\ play sound #$0038
    JSL $0085D2         ; $11BEBC   |/
    PLY                 ; $11BEC0   |

CODE_11BEC1:
    TYA                 ; $11BEC1   |
    STA $78,x           ; $11BEC2   |

CODE_11BEC4:
    LDA $78,x           ; $11BEC4   |
    ASL A               ; $11BEC6   |
    TAY                 ; $11BEC7   |
    LDA $BF45,y         ; $11BEC8   |
    STA $00             ; $11BECB   |
    JMP ($7960)         ; $11BECD   |

CODE_11BED0:
    LDY $76,x           ; $11BED0   |
    LDA $70E2,y         ; $11BED2   |
    STA $3002           ; $11BED5   |
    LDA $7182,y         ; $11BED8   |
    STA $3004           ; $11BEDB   |
    LDA $70E2,x         ; $11BEDE   |
    STA $3006           ; $11BEE1   |
    LDA $7182,x         ; $11BEE4   |
    STA $3008           ; $11BEE7   |
    LDA #$0200          ; $11BEEA   |
    STA $300C           ; $11BEED   |
    LDX #$09            ; $11BEF0   |
    LDA #$907C          ; $11BEF2   |
    JSL $7EDE44         ; $11BEF5   | GSU init
    LDX $12             ; $11BEF9   |
    LDY #$02            ; $11BEFB   |
    LDA $3002           ; $11BEFD   |
    STA $7220,x         ; $11BF00   |
    BPL CODE_11BF07     ; $11BF03   |
    LDY #$00            ; $11BF05   |

CODE_11BF07:
    TYA                 ; $11BF07   |
    STA $7400,x         ; $11BF08   |
    LDA $7860,x         ; $11BF0B   |
    LSR A               ; $11BF0E   |
    BCC CODE_11BF46     ; $11BF0F   |
    LDA $7860,x         ; $11BF11   |
    AND $C00B,y         ; $11BF14   |
    BEQ CODE_11BF26     ; $11BF17   |
    LDA #$FC00          ; $11BF19   |
    STA $7222,x         ; $11BF1C   |
    LDA #$0038          ; $11BF1F   |\ play sound #$0038
    JSL $0085D2         ; $11BF22   |/

CODE_11BF26:
    LDA $3004           ; $11BF26   |
    BPL CODE_11BF46     ; $11BF29   |
    LDY $76,x           ; $11BF2B   |
    LDA $7182,x         ; $11BF2D   |
    SEC                 ; $11BF30   |
    SBC $7182,y         ; $11BF31   |
    CMP #$0020          ; $11BF34   |
    BCC CODE_11BF46     ; $11BF37   |
    LDA #$FA80          ; $11BF39   |
    STA $7222,x         ; $11BF3C   |
    LDA #$0038          ; $11BF3F   |\ play sound #$0038
    JSL $0085D2         ; $11BF42   |/

CODE_11BF46:
    RTS                 ; $11BF46   |

DATA_11BF47:         dw $BF53
DATA_11BF49:         dw $BF9E

DATA_11BF4B:         dw $FE00, $0200

DATA_11BF4F:         dw $FFF0, $0010

    LDY $7900,x         ; $11BF53   |
    LDA $BF4B,y         ; $11BF56   |
    STA $7220,x         ; $11BF59   |
    LDA $7860,x         ; $11BF5C   |
    LSR A               ; $11BF5F   |
    BCC CODE_11BF8F     ; $11BF60   |
    LDA $70E2,x         ; $11BF62   |
    CLC                 ; $11BF65   |
    ADC $BF4F,y         ; $11BF66   |
    STA $3010           ; $11BF69   |
    LDA $7182,x         ; $11BF6C   |
    STA $3000           ; $11BF6F   |
    LDX #$0A            ; $11BF72   |
    LDA #$CE2F          ; $11BF74   |
    JSL $7EDE91         ; $11BF77   | GSU init
    LDX $12             ; $11BF7B   |
    LDA $300A           ; $11BF7D   |
    BEQ CODE_11BF8F     ; $11BF80   |
    LDA #$FC00          ; $11BF82   |
    STA $7222,x         ; $11BF85   |
    LDA #$0038          ; $11BF88   |\ play sound #$0038
    JSL $0085D2         ; $11BF8B   |/

CODE_11BF8F:
    LDA $7182,x         ; $11BF8F   |
    SEC                 ; $11BF92   |
    SBC $7902,x         ; $11BF93   |
    CMP #$0028          ; $11BF96   |
    BCC CODE_11BF9D     ; $11BF99   |
    STZ $78,x           ; $11BF9B   |

CODE_11BF9D:
    RTS                 ; $11BF9D   |

    LDA $7902,x         ; $11BF9E   |
    STA $7220,x         ; $11BFA1   |
    STZ $7400,x         ; $11BFA4   |
    LDY $7400,x         ; $11BFA7   |
    LDA $7860,x         ; $11BFAA   |
    LSR A               ; $11BFAD   |
    BCC CODE_11BFDD     ; $11BFAE   |
    LDA $70E2,x         ; $11BFB0   |
    CLC                 ; $11BFB3   |
    ADC $BF4F,y         ; $11BFB4   |
    STA $3010           ; $11BFB7   |
    LDA $7182,x         ; $11BFBA   |
    STA $3000           ; $11BFBD   |
    LDX #$0A            ; $11BFC0   |
    LDA #$CE2F          ; $11BFC2   |
    JSL $7EDE91         ; $11BFC5   | GSU init
    LDX $12             ; $11BFC9   |
    LDA $300A           ; $11BFCB   |
    BEQ CODE_11BFDD     ; $11BFCE   |
    LDA #$FA80          ; $11BFD0   |
    STA $7222,x         ; $11BFD3   |
    LDA #$0038          ; $11BFD6   |\ play sound #$0038
    JSL $0085D2         ; $11BFD9   |/

CODE_11BFDD:
    LDY $76,x           ; $11BFDD   |
    LDA $70E2,x         ; $11BFDF   |
    SEC                 ; $11BFE2   |
    SBC $70E2,y         ; $11BFE3   |
    CLC                 ; $11BFE6   |
    ADC #$0010          ; $11BFE7   |
    CMP #$0021          ; $11BFEA   |
    BCC CODE_11BFFA     ; $11BFED   |
    STZ $7220,x         ; $11BFEF   |
    LDA #$0002          ; $11BFF2   |
    STA $7400,x         ; $11BFF5   |
    STZ $78,x           ; $11BFF8   |

CODE_11BFFA:
    RTS                 ; $11BFFA   |

DATA_11BFFB:         dw $FFEC, $0014, $FFF7, $0009
DATA_11C003:         dw $FFF0, $0010, $0000, $0000
DATA_11C00B:         dw $0008, $0004, $FF00, $0100

    LDA $7A36,x         ; $11C013   |
    BNE CODE_11C04E     ; $11C016   |
    LDY #$02            ; $11C018   |
    LDA $7182,x         ; $11C01A   |
    SEC                 ; $11C01D   |
    SBC $6090           ; $11C01E   |
    CLC                 ; $11C021   |
    ADC #$0010          ; $11C022   |
    BMI CODE_11C030     ; $11C025   |
    LDY #$04            ; $11C027   |
    CMP #$0031          ; $11C029   |
    BCS CODE_11C030     ; $11C02C   |
    LDY #$06            ; $11C02E   |

CODE_11C030:
    TYA                 ; $11C030   |
    STA $7A36,x         ; $11C031   |
    LDY #$02            ; $11C034   |
    LDA $70E2,x         ; $11C036   |
    CMP #$0020          ; $11C039   |
    BCC CODE_11C048     ; $11C03C   |
    LDY #$00            ; $11C03E   |
    CMP #$00D0          ; $11C040   |
    BCS CODE_11C048     ; $11C043   |
    LDY $60C4           ; $11C045   |

CODE_11C048:
    TYA                 ; $11C048   |
    STA $7A38,x         ; $11C049   |
    BRA CODE_11C064     ; $11C04C   |

CODE_11C04E:
    LDA $70E2,x         ; $11C04E   |
    CMP #$00E0          ; $11C051   |
    BCS CODE_11C05B     ; $11C054   |
    CMP #$0012          ; $11C056   |
    BCS CODE_11C064     ; $11C059   |

CODE_11C05B:
    LDA $7A38,x         ; $11C05B   |
    EOR #$0002          ; $11C05E   |
    STA $7A38,x         ; $11C061   |

CODE_11C064:
    PEA $C071           ; $11C064   |
    LDY $7A36,x         ; $11C067   |
    LDA $C083,y         ; $11C06A   |
    STA $00             ; $11C06D   |
    JMP ($7960)         ; $11C06F   |

    LDA $7A36,x         ; $11C072   |
    BEQ CODE_11C084     ; $11C075   |
    LDY #$00            ; $11C077   |
    LDA $7220,x         ; $11C079   |
    BMI CODE_11C080     ; $11C07C   |
    LDY #$02            ; $11C07E   |

CODE_11C080:
    TYA                 ; $11C080   |
    STA $7400,x         ; $11C081   |

CODE_11C084:
    RTS                 ; $11C084   |

DATA_11C085:         dw $C08B
DATA_11C087:         dw $C0EF
DATA_11C089:         dw $C1D2

    LDY $7A38,x         ; $11C08B   |
    LDA $7860,x         ; $11C08E   |
    AND $C00B,y         ; $11C091   |
    BNE CODE_11C09C     ; $11C094   |
    LDA $C00F,y         ; $11C096   |
    STA $7220,x         ; $11C099   |

CODE_11C09C:
    LDA $7860,x         ; $11C09C   |
    LSR A               ; $11C09F   |
    BCC CODE_11C0EE     ; $11C0A0   |
    LDA $70E2,x         ; $11C0A2   |
    CLC                 ; $11C0A5   |
    ADC $BF4F,y         ; $11C0A6   |
    CLC                 ; $11C0A9   |
    ADC #$0008          ; $11C0AA   |
    STA $3010           ; $11C0AD   |
    LDA $7182,x         ; $11C0B0   |
    STA $3000           ; $11C0B3   |
    LDX #$0A            ; $11C0B6   |
    LDA #$CE2F          ; $11C0B8   |
    JSL $7EDE91         ; $11C0BB   | GSU init
    LDX $12             ; $11C0BF   |
    LDA $300A           ; $11C0C1   |
    BEQ CODE_11C0D3     ; $11C0C4   |
    LDA #$FC00          ; $11C0C6   |
    STA $7222,x         ; $11C0C9   |
    LDA #$0038          ; $11C0CC   |\ play sound #$0038
    JSL $0085D2         ; $11C0CF   |/

CODE_11C0D3:
    LDA $7182,x         ; $11C0D3   |
    SEC                 ; $11C0D6   |
    SBC $6090           ; $11C0D7   |
    CLC                 ; $11C0DA   |
    ADC #$0010          ; $11C0DB   |
    CMP #$0031          ; $11C0DE   |
    BCC CODE_11C0E5     ; $11C0E1   |
    BMI CODE_11C0EE     ; $11C0E3   |

CODE_11C0E5:
    STZ $7A36,x         ; $11C0E5   |
    STZ $7222,x         ; $11C0E8   |
    STZ $7220,x         ; $11C0EB   |

CODE_11C0EE:
    RTS                 ; $11C0EE   |

    LDY $7A38,x         ; $11C0EF   |
    LDA $7860,x         ; $11C0F2   |
    AND $C00B,y         ; $11C0F5   |
    BNE CODE_11C100     ; $11C0F8   |
    LDA $C00F,y         ; $11C0FA   |
    STA $7220,x         ; $11C0FD   |

CODE_11C100:
    LDA $7860,x         ; $11C100   |
    LSR A               ; $11C103   |
    BCC CODE_11C121     ; $11C104   |
    LDA $7182,x         ; $11C106   |
    SEC                 ; $11C109   |
    SBC $6090           ; $11C10A   |
    CLC                 ; $11C10D   |
    ADC #$0010          ; $11C10E   |
    BMI CODE_11C118     ; $11C111   |
    CMP #$0031          ; $11C113   |
    BCS CODE_11C122     ; $11C116   |

CODE_11C118:
    STZ $7A36,x         ; $11C118   |
    STZ $7222,x         ; $11C11B   |
    STZ $7220,x         ; $11C11E   |

CODE_11C121:
    RTS                 ; $11C121   |

CODE_11C122:
    LDA $70E2,x         ; $11C122   |
    CLC                 ; $11C125   |
    ADC #$0008          ; $11C126   |
    STA $04             ; $11C129   |
    STA $3010           ; $11C12B   |
    LDA $7182,x         ; $11C12E   |
    SEC                 ; $11C131   |
    SBC #$0040          ; $11C132   |
    STA $06             ; $11C135   |
    STA $3000           ; $11C137   |
    LDX #$0A            ; $11C13A   |
    LDA #$CE2F          ; $11C13C   |
    JSL $7EDE91         ; $11C13F   | GSU init
    LDX $12             ; $11C143   |
    LDA $300A           ; $11C145   |
    BNE CODE_11C19D     ; $11C148   |
    LDA $04             ; $11C14A   |
    STA $3010           ; $11C14C   |
    LDA $06             ; $11C14F   |
    CLC                 ; $11C151   |
    ADC #$0010          ; $11C152   |
    STA $3000           ; $11C155   |
    LDX #$0A            ; $11C158   |
    LDA #$CE2F          ; $11C15A   |
    JSL $7EDE91         ; $11C15D   | GSU init
    LDX $12             ; $11C161   |
    LDA $300E           ; $11C163   |
    AND #$0001          ; $11C166   |
    BNE CODE_11C18C     ; $11C169   |
    LDA $04             ; $11C16B   |
    STA $3010           ; $11C16D   |
    LDA $06             ; $11C170   |
    CLC                 ; $11C172   |
    ADC #$0020          ; $11C173   |
    STA $3000           ; $11C176   |
    LDX #$0A            ; $11C179   |
    LDA #$CE2F          ; $11C17B   |
    JSL $7EDE91         ; $11C17E   | GSU init
    LDX $12             ; $11C182   |
    LDA $300E           ; $11C184   |
    AND #$0001          ; $11C187   |
    BEQ CODE_11C19D     ; $11C18A   |

CODE_11C18C:
    LDA #$FA80          ; $11C18C   |
    STA $7222,x         ; $11C18F   |
    LDA #$0038          ; $11C192   |\ play sound #$0038
    JSL $0085D2         ; $11C195   |/
    STZ $7220,x         ; $11C199   |
    RTS                 ; $11C19C   |

CODE_11C19D:
    LDY $7A38,x         ; $11C19D   |
    LDA $70E2,x         ; $11C1A0   |
    CLC                 ; $11C1A3   |
    ADC $BF4F,y         ; $11C1A4   |
    CLC                 ; $11C1A7   |
    ADC #$0008          ; $11C1A8   |
    STA $3010           ; $11C1AB   |
    LDA $7182,x         ; $11C1AE   |
    STA $3000           ; $11C1B1   |
    LDX #$0A            ; $11C1B4   |
    LDA #$CE2F          ; $11C1B6   |
    JSL $7EDE91         ; $11C1B9   | GSU init
    LDX $12             ; $11C1BD   |
    LDA $300A           ; $11C1BF   |
    BEQ CODE_11C1D1     ; $11C1C2   |
    LDA #$FC00          ; $11C1C4   |
    STA $7222,x         ; $11C1C7   |
    LDA #$0038          ; $11C1CA   |\ play sound #$0038
    JSL $0085D2         ; $11C1CD   |/

CODE_11C1D1:
    RTS                 ; $11C1D1   |

    LDA $7A96,x         ; $11C1D2   |
    BNE CODE_11C21F     ; $11C1D5   |
    LDY $7A38,x         ; $11C1D7   |
    LDA $7860,x         ; $11C1DA   |
    AND $C00B,y         ; $11C1DD   |
    BNE CODE_11C1E8     ; $11C1E0   |
    LDA $C00F,y         ; $11C1E2   |
    STA $7220,x         ; $11C1E5   |

CODE_11C1E8:
    LDA $7860,x         ; $11C1E8   |
    LSR A               ; $11C1EB   |
    BCC CODE_11C21F     ; $11C1EC   |
    LDA $70E2,x         ; $11C1EE   |
    CLC                 ; $11C1F1   |
    ADC $BF4F,y         ; $11C1F2   |
    CLC                 ; $11C1F5   |
    ADC #$0008          ; $11C1F6   |
    STA $3010           ; $11C1F9   |
    LDA $7182,x         ; $11C1FC   |
    STA $3000           ; $11C1FF   |
    LDX #$0A            ; $11C202   |
    LDA #$CE2F          ; $11C204   |
    JSL $7EDE91         ; $11C207   | GSU init
    LDX $12             ; $11C20B   |
    LDA $300A           ; $11C20D   |
    BEQ CODE_11C220     ; $11C210   |
    LDA #$FC00          ; $11C212   |
    STA $7222,x         ; $11C215   |
    LDA #$0038          ; $11C218   |\ play sound #$0038
    JSL $0085D2         ; $11C21B   |/

CODE_11C21F:
    RTS                 ; $11C21F   |

CODE_11C220:
    LDA $7182,x         ; $11C220   |
    SEC                 ; $11C223   |
    SBC $6090           ; $11C224   |
    CLC                 ; $11C227   |
    ADC #$0010          ; $11C228   |
    CMP #$0031          ; $11C22B   |
    BCS CODE_11C2AA     ; $11C22E   |
    LDA $61D6           ; $11C230   |
    BNE CODE_11C21F     ; $11C233   |
    STZ $7222,x         ; $11C235   |
    LDA $608C           ; $11C238   |
    SEC                 ; $11C23B   |
    SBC $70E2,x         ; $11C23C   |
    CLC                 ; $11C23F   |
    ADC #$0060          ; $11C240   |
    CMP #$00C1          ; $11C243   |
    BCS CODE_11C21F     ; $11C246   |
    STZ $7220,x         ; $11C248   |
    LDA $02             ; $11C24B   |
    BEQ CODE_11C2B4     ; $11C24D   |
    INC $18,x           ; $11C24F   |
    LDY #$02            ; $11C251   |
    LDA $608C           ; $11C253   |
    CMP $70E2,x         ; $11C256   |
    BCS CODE_11C25D     ; $11C259   |
    LDY #$00            ; $11C25B   |

CODE_11C25D:
    TYA                 ; $11C25D   |
    STA $7400,x         ; $11C25E   |
    LDA #$001E          ; $11C261   |
    STA $7A96,x         ; $11C264   |

CODE_11C267:
    STZ $7402,x         ; $11C267   |
    LDA $7182,x         ; $11C26A   |
    CLC                 ; $11C26D   |
    ADC #$0002          ; $11C26E   |
    STA $7900,x         ; $11C271   |
    LDY #$00            ; $11C274   |
    LDA $1104           ; $11C276   |
    CMP #$0009          ; $11C279   |
    BEQ CODE_11C280     ; $11C27C   |
    LDY #$04            ; $11C27E   |

CODE_11C280:
    TYA                 ; $11C280   |
    ORA $7400,x         ; $11C281   |
    TAY                 ; $11C284   |
    LDA $70E2,x         ; $11C285   |
    CLC                 ; $11C288   |
    ADC $BFFB,y         ; $11C289   |
    STA $7902,x         ; $11C28C   |
    LDA $C003,y         ; $11C28F   |
    STA $7A38,x         ; $11C292   |
    LDA #$0030          ; $11C295   |
    STA $7042,x         ; $11C298   |
    LDY #$06            ; $11C29B   |
    STY $1108           ; $11C29D   |
    LDA #$0001          ; $11C2A0   |
    STA $110A           ; $11C2A3   |
    STZ $7A36,x         ; $11C2A6   |
    RTS                 ; $11C2A9   |

CODE_11C2AA:
    STZ $7A36,x         ; $11C2AA   |
    STZ $7222,x         ; $11C2AD   |
    STZ $7220,x         ; $11C2B0   |
    RTS                 ; $11C2B3   |

CODE_11C2B4:
    LDY $60C4           ; $11C2B4   |
    LDA $C00F,y         ; $11C2B7   |
    STA $7220,x         ; $11C2BA   |
    LDA $10             ; $11C2BD   |
    TAY                 ; $11C2BF   |
    CPY #$F8            ; $11C2C0   |
    BCC CODE_11C2CE     ; $11C2C2   |
    TYA                 ; $11C2C4   |
    AND #$003F          ; $11C2C5   |
    STA $7A96,x         ; $11C2C8   |
    STZ $7220,x         ; $11C2CB   |

CODE_11C2CE:
    RTS                 ; $11C2CE   |

CODE_11C2CF:
    LDA $7A96,x         ; $11C2CF   |
    BNE CODE_11C308     ; $11C2D2   |
    LDA $1108           ; $11C2D4   |
    BNE CODE_11C309     ; $11C2D7   |
    LDA #$0002          ; $11C2D9   |
    DEC $1106           ; $11C2DC   |
    BNE CODE_11C2E7     ; $11C2DF   |
    STZ $1104           ; $11C2E1   |
    LDA #$0000          ; $11C2E4   |

CODE_11C2E7:
    STA $18,x           ; $11C2E7   |
    STZ $110E           ; $11C2E9   |
    LDY #$00            ; $11C2EC   |
    LDA $BAF0,y         ; $11C2EE   |
    STA $16,x           ; $11C2F1   |
    LDA $BA7C,y         ; $11C2F3   |
    STA $7402,x         ; $11C2F6   |
    LDA $BAB6,y         ; $11C2F9   |
    STA $7A98,x         ; $11C2FC   |
    LDA #$0020          ; $11C2FF   |
    STA $7042,x         ; $11C302   |
    STZ $110A           ; $11C305   |

CODE_11C308:
    RTS                 ; $11C308   |

CODE_11C309:
    LDA #$0001          ; $11C309   |
    STA $7402,x         ; $11C30C   |
    LDA $1104           ; $11C30F   |
    CMP #$0007          ; $11C312   |
    BNE CODE_11C371     ; $11C315   |
    LDY $7400,x         ; $11C317   |
    LDA $7182,x         ; $11C31A   |
    CLC                 ; $11C31D   |
    ADC #$0002          ; $11C31E   |
    STA $7900,x         ; $11C321   |
    LDA $70E2,x         ; $11C324   |
    CLC                 ; $11C327   |
    ADC $BFFF,y         ; $11C328   |
    STA $7902,x         ; $11C32B   |
    LDA #$0006          ; $11C32E   |
    STA $7A96,x         ; $11C331   |
    LDA #$0107          ; $11C334   |
    JSL $03A34C         ; $11C337   |
    BCC CODE_11C36F     ; $11C33B   |
    LDA $7900,x         ; $11C33D   |
    STA $7182,y         ; $11C340   |
    LDA $7902,x         ; $11C343   |
    STA $70E2,y         ; $11C346   |
    LDA #$0001          ; $11C349   |
    STA $7D38,y         ; $11C34C   |
    STA $7A38,y         ; $11C34F   |
    LDA $7400,x         ; $11C352   |
    STA $7400,y         ; $11C355   |
    TAX                 ; $11C358   |
    LDA #$FC00          ; $11C359   |
    CPX #$00            ; $11C35C   |
    BEQ CODE_11C363     ; $11C35E   |
    LDA #$0400          ; $11C360   |

CODE_11C363:
    STA $7220,y         ; $11C363   |
    LDA #$0045          ; $11C366   |\ play sound #$0045
    JSL $0085D2         ; $11C369   |/
    LDX $12             ; $11C36D   |

CODE_11C36F:
    BRA CODE_11C3DD     ; $11C36F   |

CODE_11C371:
    LDA #$0018          ; $11C371   |
    JSL $03A34C         ; $11C374   |
    BCC CODE_11C3DD     ; $11C378   |
    LDA $7900,x         ; $11C37A   |
    STA $7182,y         ; $11C37D   |
    LDA $7902,x         ; $11C380   |
    STA $70E2,y         ; $11C383   |
    LDA #$0001          ; $11C386   |
    STA $7A38,y         ; $11C389   |
    LDA $7400,x         ; $11C38C   |
    STA $7400,y         ; $11C38F   |
    LDA #$0010          ; $11C392   |
    STA $7A96,y         ; $11C395   |
    LDA $7042,y         ; $11C398   |
    AND #$00F1          ; $11C39B   |
    ORA #$0006          ; $11C39E   |
    STA $7042,y         ; $11C3A1   |
    SEP #$20            ; $11C3A4   |
    LDA #$29            ; $11C3A6   |
    STA $7180,y         ; $11C3A8   |
    REP #$20            ; $11C3AB   |
    LDA #$0002          ; $11C3AD   |
    STA $7A96,x         ; $11C3B0   |
    LDA $7902,x         ; $11C3B3   |
    STA $3010           ; $11C3B6   |
    LDA $7900,x         ; $11C3B9   |
    STA $3000           ; $11C3BC   |
    LDX #$0A            ; $11C3BF   |
    LDA #$CE2F          ; $11C3C1   |
    JSL $7EDE91         ; $11C3C4   | GSU init
    LDX $12             ; $11C3C8   |
    LDA $300A           ; $11C3CA   |
    BEQ CODE_11C3D3     ; $11C3CD   |
    STZ $1108           ; $11C3CF   |
    RTS                 ; $11C3D2   |

CODE_11C3D3:
    LDA $7902,x         ; $11C3D3   |
    CLC                 ; $11C3D6   |
    ADC $7A38,x         ; $11C3D7   |
    STA $7902,x         ; $11C3DA   |

CODE_11C3DD:
    DEC $1108           ; $11C3DD   |
    RTS                 ; $11C3E0   |

    LDA $7860,x         ; $11C3E1   |
    LSR A               ; $11C3E4   |
    BCC CODE_11C44A     ; $11C3E5   |
    LDA $7AF8,x         ; $11C3E7   |
    BNE CODE_11C3F5     ; $11C3EA   |
    STZ $7220,x         ; $11C3EC   |
    LDA #$0020          ; $11C3EF   |
    STA $7AF8,x         ; $11C3F2   |

CODE_11C3F5:
    AND #$0008          ; $11C3F5   |
    LSR A               ; $11C3F8   |
    LSR A               ; $11C3F9   |
    LSR A               ; $11C3FA   |
    ORA #$0008          ; $11C3FB   |
    STA $7402,x         ; $11C3FE   |
    LDA $7AF8,x         ; $11C401   |
    CMP #$0001          ; $11C404   |
    BNE CODE_11C44A     ; $11C407   |
    STZ $18,x           ; $11C409   |
    LDA #$0002          ; $11C40B   |
    STA $7402,x         ; $11C40E   |
    LDA $110A           ; $11C411   |
    BEQ CODE_11C44A     ; $11C414   |
    LDA $1108           ; $11C416   |
    BEQ CODE_11C43A     ; $11C419   |
    CMP #$0006          ; $11C41B   |
    BEQ CODE_11C428     ; $11C41E   |
    LDA $1104           ; $11C420   |
    CMP #$0009          ; $11C423   |
    BEQ CODE_11C43A     ; $11C426   |

CODE_11C428:
    LDA #$0003          ; $11C428   |
    STA $18,x           ; $11C42B   |
    LDA #$0030          ; $11C42D   |
    STA $7042,x         ; $11C430   |
    LDA #$0001          ; $11C433   |
    STA $7402,x         ; $11C436   |
    RTS                 ; $11C439   |

CODE_11C43A:
    STZ $110A           ; $11C43A   |
    LDA $1106           ; $11C43D   |
    BEQ CODE_11C44A     ; $11C440   |
    DEC $1106           ; $11C442   |
    BNE CODE_11C44A     ; $11C445   |
    STZ $1104           ; $11C447   |

CODE_11C44A:
    RTS                 ; $11C44A   |

    LDY $2137           ; $11C44B   |
    LDY $213F           ; $11C44E   |
    LDA $213C           ; $11C451   |
    CLC                 ; $11C454   |
    ADC $10             ; $11C455   |
    STA $10             ; $11C457   |
    AND #$00FF          ; $11C459   |
    STA $7A96,x         ; $11C45C   |
    RTL                 ; $11C45F   |

.init_mini_battle_watermelon_pot
    LDA $18,x           ; $11C460   |
    ASL A               ; $11C462   |
    TAY                 ; $11C463   |
    LDA $C46C,y         ; $11C464   |
    STA $00             ; $11C467   |
    JMP ($7960)         ; $11C469   |

DATA_11C46C:         dw $C482
DATA_11C46E:         dw $C4E3
DATA_11C470:         dw $C4F3

DATA_11C472:         dw $0007, $0007, $0009, $0007
DATA_11C47A:         dw $0007, $0009, $0007, $0007

    LDA $7A96,x         ; $11C482   |
    BNE CODE_11C4E2     ; $11C485   |
    LDA $10FE           ; $11C487   |
    CMP #$0002          ; $11C48A   |
    BEQ CODE_11C4DC     ; $11C48D   |
    INC $1110           ; $11C48F   |
    LDA $7970           ; $11C492   |
    AND #$0007          ; $11C495   |
    ASL A               ; $11C498   |
    TAY                 ; $11C499   |
    LDA $C472,y         ; $11C49A   |
    TAY                 ; $11C49D   |
    CMP #$0007          ; $11C49E   |
    BEQ CODE_11C4B2     ; $11C4A1   |
    LDA $1110           ; $11C4A3   |
    CMP #$0004          ; $11C4A6   |
    BCC CODE_11C4B0     ; $11C4A9   |
    STZ $1110           ; $11C4AB   |
    BRA CODE_11C4B2     ; $11C4AE   |

CODE_11C4B0:
    LDY #$07            ; $11C4B0   |

CODE_11C4B2:
    TYA                 ; $11C4B2   |
    JSL $03A364         ; $11C4B3   |
    LDA $6FA0,y         ; $11C4B7   |
    AND #$F9FF          ; $11C4BA   |
    ORA #$0200          ; $11C4BD   |
    STA $6FA0,y         ; $11C4C0   |
    LDA $70E2,x         ; $11C4C3   |
    STA $70E2,y         ; $11C4C6   |
    LDA $7182,x         ; $11C4C9   |
    STA $7182,y         ; $11C4CC   |
    TYA                 ; $11C4CF   |
    STA $76,x           ; $11C4D0   |
    LDA #$0010          ; $11C4D2   |
    STA $16,x           ; $11C4D5   |
    INC $10FE           ; $11C4D7   |
    INC $18,x           ; $11C4DA   |

CODE_11C4DC:
    LDA #$0100          ; $11C4DC   |
    STA $7A96,x         ; $11C4DF   |

CODE_11C4E2:
    RTL                 ; $11C4E2   |

    LDY $76,x           ; $11C4E3   |
    LDA $7182,y         ; $11C4E5   |
    DEC A               ; $11C4E8   |
    STA $7182,y         ; $11C4E9   |
    DEC $16,x           ; $11C4EC   |
    BNE CODE_11C4F2     ; $11C4EE   |
    INC $18,x           ; $11C4F0   |

CODE_11C4F2:
    RTL                 ; $11C4F2   |

    LDY $76,x           ; $11C4F3   |
    LDA $6F00,y         ; $11C4F5   |
    BNE CODE_11C505     ; $11C4F8   |
    STZ $18,x           ; $11C4FA   |
    LDA #$0100          ; $11C4FC   |
    STA $7A96,x         ; $11C4FF   |
    DEC $10FE           ; $11C502   |

CODE_11C505:
    RTL                 ; $11C505   |

    REP #$20            ; $11C506   |
    STZ $39             ; $11C508   |
    STZ $3B             ; $11C50A   |
    STZ $3D             ; $11C50C   |
    STZ $3F             ; $11C50E   |
    STZ $41             ; $11C510   |
    STZ $43             ; $11C512   |
    LDY #$69            ; $11C514   |
    STY $095F           ; $11C516   |
    STY $2107           ; $11C519   |
    LDY #$39            ; $11C51C   |
    STY $0960           ; $11C51E   |
    STY $2108           ; $11C521   |
    LDY #$09            ; $11C524   |
    STY $095E           ; $11C526   |
    STY $2105           ; $11C529   |
    LDY #$00            ; $11C52C   |
    STY $094A           ; $11C52E   |
    STY $096C           ; $11C531   |
    REP #$20            ; $11C534   |
    LDA #$00B0          ; $11C536   |
    STA $6090           ; $11C539   |
    LDA #$0030          ; $11C53C   |
    STA $608C           ; $11C53F   |
    STZ $6CAA           ; $11C542   |
    STA $03B6           ; $11C545   |
    STZ $03BC           ; $11C548   |
    LDA #$0008          ; $11C54B   |
    STA $1100           ; $11C54E   |
    STA $1102           ; $11C551   |
    LDA #$0001          ; $11C554   |
    STA $10F2           ; $11C557   |
    LDA #$FFFF          ; $11C55A   |
    STA $6EB6           ; $11C55D   |
    STA $6EB8           ; $11C560   |
    STA $6EBA           ; $11C563   |
    STZ $6CAA           ; $11C566   |
    LDA #$FCEB          ; $11C569   |
    STA $32             ; $11C56C   |
    LDA #$0001          ; $11C56E   |
    STA $0136           ; $11C571   |
    LDA #$01B9          ; $11C574   |
    JSL $03A34C         ; $11C577   |
    LDA #$01B8          ; $11C57B   |
    JSL $03A34C         ; $11C57E   |
    LDA #$0030          ; $11C582   |
    STA $70E2,y         ; $11C585   |
    LDA #$0050          ; $11C588   |
    STA $7182,y         ; $11C58B   |
    LDA #$01B8          ; $11C58E   |
    JSL $03A34C         ; $11C591   |
    LDA #$00B0          ; $11C595   |
    STA $70E2,y         ; $11C598   |
    LDA #$0040          ; $11C59B   |
    STA $7182,y         ; $11C59E   |
    LDA #$01B8          ; $11C5A1   |
    JSL $03A34C         ; $11C5A4   |
    LDA #$0020          ; $11C5A8   |
    STA $70E2,y         ; $11C5AB   |
    LDA #$0090          ; $11C5AE   |
    STA $7182,y         ; $11C5B1   |
    LDA #$01B8          ; $11C5B4   |
    JSL $03A34C         ; $11C5B7   |
    LDA #$00A0          ; $11C5BB   |
    STA $70E2,y         ; $11C5BE   |
    LDA #$0080          ; $11C5C1   |
    STA $7182,y         ; $11C5C4   |
    LDA #$01B8          ; $11C5C7   |
    JSL $03A34C         ; $11C5CA   |
    LDA #$0090          ; $11C5CE   |
    STA $70E2,y         ; $11C5D1   |
    LDA #$00C0          ; $11C5D4   |
    STA $7182,y         ; $11C5D7   |
    LDA #$01B8          ; $11C5DA   |
    JSL $03A34C         ; $11C5DD   |
    LDA #$00E0          ; $11C5E1   |
    STA $70E2,y         ; $11C5E4   |
    LDA #$00C0          ; $11C5E7   |
    STA $7182,y         ; $11C5EA   |
    JSL $0397D3         ; $11C5ED   |

    LDA #$15            ; $11C5F1   |
    STA $34             ; $11C5F3   |
    JSL $108B61         ; $11C5F5   |
    RTS                 ; $11C5F9   |

    JSL $008259         ; $11C5FA   |
    LDA #$30            ; $11C5FE   |
    STA $6126           ; $11C600   |
    JSL $0394CF         ; $11C603   |
    JSL $04FA67         ; $11C607   |
    STZ $03BA           ; $11C60B   |
    LDA $1100           ; $11C60E   |
    BEQ CODE_11C618     ; $11C611   |
    LDA $1102           ; $11C613   |
    BNE CODE_11C622     ; $11C616   |

CODE_11C618:
    LDA #$01            ; $11C618   |
    STA $10FA           ; $11C61A   |
    JSR CODE_11AEC4     ; $11C61D   |
    BRA CODE_11C632     ; $11C620   |

CODE_11C622:
    JSL $04DD9E         ; $11C622   |
    LDA $0D0F           ; $11C626   |
    BNE CODE_11C632     ; $11C629   |
    JSL $0397D3         ; $11C62B   |
    JSR CODE_11B8E2     ; $11C62F   |

CODE_11C632:
    REP #$20            ; $11C632   |
    LDX #$08            ; $11C634   |
    LDA #$B1EF          ; $11C636   |
    JSL $7EDE44         ; $11C639   | GSU init
    SEP #$20            ; $11C63D   |
    RTS                 ; $11C63F   |

.init_mini_battle_bandit_4
    LDA #$00C0          ; $11C640   |
    STA $7182,x         ; $11C643   |
    LDA #$00C0          ; $11C646   |
    STA $70E2,x         ; $11C649   |
    LDA #$0004          ; $11C64C   |
    STA $7A96,x         ; $11C64F   |
    LDA #$0030          ; $11C652   |
    STA $7042,x         ; $11C655   |
    RTL                 ; $11C658   |

DATA_11C659:         dw $FFF0, $0010, $FF00, $0100

DATA_11C661:         dw $0040, $FFC0, $FDC0, $0240

DATA_11C669:         dw $FDC0, $0240, $0010, $00E0

DATA_11C671:         dw $0010, $00E0, $0011, $0012

.main_mini_battle_bandit_4
    LDA $6F00,x         ; $11C679   |
    CMP #$0010          ; $11C67C   |
    BNE CODE_11C6A2     ; $11C67F   |
    LDY $7D36,x         ; $11C681   |
    BEQ CODE_11C6D8     ; $11C684   |
    BMI CODE_11C6D8     ; $11C686   |
    DEY                 ; $11C688   |
    LDA $7AF6,x         ; $11C689   |
    BNE CODE_11C6D8     ; $11C68C   |
    LDA $7360,y         ; $11C68E   |
    CMP #$0107          ; $11C691   |
    BNE CODE_11C6D8     ; $11C694   |
    LDA $7A38,y         ; $11C696   |
    BNE CODE_11C6D8     ; $11C699   |
    TYX                 ; $11C69B   |
    JSL $03B24B         ; $11C69C   |
    BRA CODE_11C6BA     ; $11C6A0   |

CODE_11C6A2:
    PLA                 ; $11C6A2   |
    PLY                 ; $11C6A3   |
    LDA #$0010          ; $11C6A4   |
    STA $6F00,x         ; $11C6A7   |
    LDA $7AF6,x         ; $11C6AA   |
    BNE CODE_11C6D8     ; $11C6AD   |
    LDA $1102           ; $11C6AF   |
    BEQ CODE_11C6BA     ; $11C6B2   |
    DEC $1102           ; $11C6B4   |
    DEC $1102           ; $11C6B7   |

CODE_11C6BA:
    LDA #$FD00          ; $11C6BA   |
    STA $7222,x         ; $11C6BD   |
    LDA #$0080          ; $11C6C0   |
    STA $7AF6,x         ; $11C6C3   |
    LDA #$0075          ; $11C6C6   |\ play sound #$0075
    JSL $0085D2         ; $11C6C9   |/
    LDA $1102           ; $11C6CD   |
    BEQ CODE_11C6D8     ; $11C6D0   |
    DEC $1102           ; $11C6D2   |
    DEC $1102           ; $11C6D5   |

CODE_11C6D8:
    LDA #$0010          ; $11C6D8   |
    LDY $7AF6,x         ; $11C6DB   |
    BEQ CODE_11C6E3     ; $11C6DE   |
    LDA #$0000          ; $11C6E0   |

CODE_11C6E3:
    STA $00             ; $11C6E3   |
    LDA $7040,x         ; $11C6E5   |
    AND #$FFEF          ; $11C6E8   |
    ORA $00             ; $11C6EB   |
    STA $7040,x         ; $11C6ED   |
    SEP #$20            ; $11C6F0   |
    LDY #$04            ; $11C6F2   |
    LDA $7AF6,x         ; $11C6F4   |
    AND #$04            ; $11C6F7   |
    BEQ CODE_11C6FD     ; $11C6F9   |
    LDY #$FF            ; $11C6FB   |

CODE_11C6FD:
    TYA                 ; $11C6FD   |
    STA $74A2,x         ; $11C6FE   |
    REP #$20            ; $11C701   |
    LDY $7400,x         ; $11C703   |
    BNE CODE_11C720     ; $11C706   |
    LDA $7680,x         ; $11C708   |
    CMP #$0010          ; $11C70B   |
    BCS CODE_11C737     ; $11C70E   |
    LDA #$0010          ; $11C710   |
    SEC                 ; $11C713   |
    SBC $7680,x         ; $11C714   |
    CLC                 ; $11C717   |
    ADC $70E2,x         ; $11C718   |
    STA $70E2,x         ; $11C71B   |
    BRA CODE_11C734     ; $11C71E   |

CODE_11C720:
    LDA $7680,x         ; $11C720   |
    SEC                 ; $11C723   |
    SBC #$00E0          ; $11C724   |
    BMI CODE_11C737     ; $11C727   |
    STA $00             ; $11C729   |
    LDA $70E2,x         ; $11C72B   |
    SEC                 ; $11C72E   |
    SBC $00             ; $11C72F   |
    STA $70E2,x         ; $11C731   |

CODE_11C734:
    STZ $7220,x         ; $11C734   |

CODE_11C737:
    LDA $1104           ; $11C737   |
    BNE CODE_11C767     ; $11C73A   |
    LDY $7D36,x         ; $11C73C   |
    BEQ CODE_11C780     ; $11C73F   |
    BMI CODE_11C780     ; $11C741   |
    DEY                 ; $11C743   |
    LDA $6F00,y         ; $11C744   |
    CMP #$0010          ; $11C747   |
    BNE CODE_11C767     ; $11C74A   |
    LDA $7360,y         ; $11C74C   |
    CMP #$0007          ; $11C74F   |
    BEQ CODE_11C759     ; $11C752   |
    CMP #$0009          ; $11C754   |
    BNE CODE_11C780     ; $11C757   |

CODE_11C759:
    STA $1104           ; $11C759   |
    LDA #$0003          ; $11C75C   |
    STA $1106           ; $11C75F   |
    TYX                 ; $11C762   |
    JSL $03A31E         ; $11C763   |

CODE_11C767:
    LDA $110A           ; $11C767   |
    BNE CODE_11C775     ; $11C76A   |
    LDA $0942           ; $11C76C   |
    ASL A               ; $11C76F   |
    BPL CODE_11C780     ; $11C770   |
    JSR CODE_11C267     ; $11C772   |

CODE_11C775:
    JSR CODE_11C2CF     ; $11C775   |
    LDA #$0030          ; $11C778   |
    STA $7042,x         ; $11C77B   |
    BRA CODE_11C79E     ; $11C77E   |

CODE_11C780:
    LDA $110C           ; $11C780   |
    BNE CODE_11C79E     ; $11C783   |
    LDA $0941           ; $11C785   |
    AND #$0004          ; $11C788   |
    BEQ CODE_11C79E     ; $11C78B   |
    LDA $1112           ; $11C78D   |
    BNE CODE_11C79B     ; $11C790   |
    LDA #$0004          ; $11C792   |
    STA $7BB8,x         ; $11C795   |
    STA $1112           ; $11C798   |

CODE_11C79B:
    JMP CODE_11C82B     ; $11C79B   |

CODE_11C79E:
    LDA #$0006          ; $11C79E   |
    STA $7BB8,x         ; $11C7A1   |
    STZ $1112           ; $11C7A4   |
    LDY #$C0            ; $11C7A7   |
    LDA $0940           ; $11C7A9   |
    BPL CODE_11C7D8     ; $11C7AC   |
    LDY #$20            ; $11C7AE   |
    LDA $110C           ; $11C7B0   |
    BNE CODE_11C7D8     ; $11C7B3   |
    LDA $7860,x         ; $11C7B5   |
    LSR A               ; $11C7B8   |
    BCC CODE_11C7D8     ; $11C7B9   |
    LDA $0942           ; $11C7BB   |
    BPL CODE_11C7D8     ; $11C7BE   |
    LDA #$FC00          ; $11C7C0   |
    STA $7222,x         ; $11C7C3   |
    PHY                 ; $11C7C6   |
    LDA #$0038          ; $11C7C7   |\ play sound #$0038
    JSL $0085D2         ; $11C7CA   |/
    PLY                 ; $11C7CE   |
    LDA #$0001          ; $11C7CF   |
    STA $110C           ; $11C7D2   |
    STA $7A96,x         ; $11C7D5   |

CODE_11C7D8:
    TYA                 ; $11C7D8   |
    STA $7542,x         ; $11C7D9   |
    LDA $0941           ; $11C7DC   |
    AND #$0003          ; $11C7DF   |
    BEQ CODE_11C82B     ; $11C7E2   |
    AND #$0001          ; $11C7E4   |
    ASL A               ; $11C7E7   |
    TAY                 ; $11C7E8   |
    EOR $7400,x         ; $11C7E9   |
    BEQ CODE_11C803     ; $11C7EC   |
    LDA $7220,x         ; $11C7EE   |
    CPY #$02            ; $11C7F1   |
    BEQ CODE_11C7F9     ; $11C7F3   |
    EOR #$FFFF          ; $11C7F5   |
    INC A               ; $11C7F8   |

CODE_11C7F9:
    CMP #$00C0          ; $11C7F9   |
    BPL CODE_11C803     ; $11C7FC   |
    TYA                 ; $11C7FE   |
    ORA #$0004          ; $11C7FF   |
    TAY                 ; $11C802   |

CODE_11C803:
    LDA $70E2,x         ; $11C803   |
    CMP $C66D,y         ; $11C806   |
    BEQ CODE_11C82B     ; $11C809   |
    LDA $7220,x         ; $11C80B   |
    CLC                 ; $11C80E   |
    ADC $C659,y         ; $11C80F   |
    CMP $C665,y         ; $11C812   |
    BEQ CODE_11C81A     ; $11C815   |
    STA $7220,x         ; $11C817   |

CODE_11C81A:
    LDY #$00            ; $11C81A   |
    LDA $7220,x         ; $11C81C   |
    BEQ CODE_11C84A     ; $11C81F   |
    BMI CODE_11C825     ; $11C821   |
    LDY #$02            ; $11C823   |

CODE_11C825:
    TYA                 ; $11C825   |
    STA $7400,x         ; $11C826   |
    BRA CODE_11C84A     ; $11C829   |

CODE_11C82B:
    LDA $110C           ; $11C82B   |
    BNE CODE_11C84A     ; $11C82E   |
    LDY $7400,x         ; $11C830   |
    LDA $7220,x         ; $11C833   |
    BEQ CODE_11C84A     ; $11C836   |
    CLC                 ; $11C838   |
    ADC $C661,y         ; $11C839   |
    STA $00             ; $11C83C   |
    EOR $7220,x         ; $11C83E   |
    BPL CODE_11C845     ; $11C841   |
    STZ $00             ; $11C843   |

CODE_11C845:
    LDA $00             ; $11C845   |
    STA $7220,x         ; $11C847   |

CODE_11C84A:
    LDA $110A           ; $11C84A   |
    BNE CODE_11C8BF     ; $11C84D   |
    LDA $110C           ; $11C84F   |
    BEQ CODE_11C88E     ; $11C852   |
    LDA $7860,x         ; $11C854   |
    LSR A               ; $11C857   |
    BCC CODE_11C875     ; $11C858   |
    LDA $7A96,x         ; $11C85A   |
    BNE CODE_11C8BF     ; $11C85D   |
    LDY #$00            ; $11C85F   |
    LDA $110C           ; $11C861   |
    INC A               ; $11C864   |
    AND #$0003          ; $11C865   |
    STA $110C           ; $11C868   |
    BEQ CODE_11C88C     ; $11C86B   |
    ASL A               ; $11C86D   |
    TAY                 ; $11C86E   |
    LDA $C671,y         ; $11C86F   |
    TAY                 ; $11C872   |
    BRA CODE_11C8BB     ; $11C873   |

CODE_11C875:
    LDY #$0E            ; $11C875   |
    LDA $7222,x         ; $11C877   |
    CLC                 ; $11C87A   |
    ADC #$0100          ; $11C87B   |
    CMP #$0200          ; $11C87E   |
    BCC CODE_11C88C     ; $11C881   |
    LDY #$0C            ; $11C883   |
    LDA $7222,x         ; $11C885   |
    BMI CODE_11C88C     ; $11C888   |
    LDY #$10            ; $11C88A   |

CODE_11C88C:
    BRA CODE_11C8BB     ; $11C88C   |

CODE_11C88E:
    LDA $1112           ; $11C88E   |
    BEQ CODE_11C897     ; $11C891   |
    LDY #$1B            ; $11C893   |
    BRA CODE_11C8BB     ; $11C895   |

CODE_11C897:
    LDY #$00            ; $11C897   |
    LDA $7220,x         ; $11C899   |
    BEQ CODE_11C8BB     ; $11C89C   |
    LDA $7A96,x         ; $11C89E   |
    BNE CODE_11C8BF     ; $11C8A1   |
    LDA #$0004          ; $11C8A3   |
    STA $7A96,x         ; $11C8A6   |
    INC $16,x           ; $11C8A9   |
    LDA $16,x           ; $11C8AB   |
    ASL A               ; $11C8AD   |
    TAY                 ; $11C8AE   |
    CPY #$0C            ; $11C8AF   |
    BNE CODE_11C8B7     ; $11C8B1   |
    LDY #$00            ; $11C8B3   |
    STZ $16,x           ; $11C8B5   |

CODE_11C8B7:
    LDA $BA7C,y         ; $11C8B7   |
    TAY                 ; $11C8BA   |

CODE_11C8BB:
    TYA                 ; $11C8BB   |
    STA $7402,x         ; $11C8BC   |

CODE_11C8BF:
    RTL                 ; $11C8BF   |

; item card table ptr
DATA_11C8C0:         dw $8070
DATA_11C8C2:         dw $A070
DATA_11C8C4:         dw $808C
DATA_11C8C6:         dw $8054
DATA_11C8C8:         dw $80A8
DATA_11C8CA:         dw $801C
DATA_11C8CC:         dw $A08C
DATA_11C8CE:         dw $A08C
DATA_11C8D0:         dw $A0A8
DATA_11C8D2:         dw $A000
DATA_11C8D4:         dw $A01C
DATA_11C8D6:         dw $A038

; item card table ptr
DATA_11C8D8:         dw $C860
DATA_11C8DA:         dw $DFFC
DATA_11C8DC:         dw $C860
DATA_11C8DE:         dw $C860
DATA_11C8E0:         dw $C860
DATA_11C8E2:         dw $C860
DATA_11C8E4:         dw $C87E
DATA_11C8E6:         dw $C860
DATA_11C8E8:         dw $DFFC
DATA_11C8EA:         dw $C860
DATA_11C8EC:         dw $C860
DATA_11C8EE:         dw $C860

.init_item_card
    JSL $03AE60         ; $11C8F0   |
    LDA $18,x           ; $11C8F4   |
    ASL A               ; $11C8F6   |
    TAY                 ; $11C8F7   |
    LDA $C8D6,y         ; $11C8F8   | table
    STA $00             ; $11C8FB   |
    PHB                 ; $11C8FD   |
    LDY #$5F            ; $11C8FE   |
    PHY                 ; $11C900   |
    PLB                 ; $11C901   |
    LDX #$1C            ; $11C902   |
    TXY                 ; $11C904   |

CODE_11C905:
    LDA ($00),y         ; $11C905   | \
    STA $7021C2,x       ; $11C907   |  | loop through table at
    DEY                 ; $11C90B   |  | $3Fxxxx where xxxx is
    DEY                 ; $11C90C   |  | loaded from above table
    DEX                 ; $11C90D   |  | item_card_table_ptr
    DEX                 ; $11C90E   |  | $1C is table size
    BPL CODE_11C905     ; $11C90F   | /
    PLB                 ; $11C911   |
    LDX $7972           ; $11C912   |
    LDA #$0020          ; $11C915   |
    STA $76,x           ; $11C918   |
    LDA $76,x           ; $11C91A   |
    STA $3006           ; $11C91C   |
    LDA $78,x           ; $11C91F   |
    STA $3004           ; $11C921   |
    LDA $18,x           ; $11C924   |
    ASL A               ; $11C926   |
    TAY                 ; $11C927   |
    LDA $C8BE,y         ; $11C928   | table
    STA $301C           ; $11C92B   |
    LDA #$0053          ; $11C92E   |
    STA $301A           ; $11C931   |
    LDY $7722,x         ; $11C934   |
    TYX                 ; $11C937   |
    LDA $03A9CE,x       ; $11C938   |
    STA $3000           ; $11C93C   |
    LDA $03A9EE,x       ; $11C93F   |
    STA $3002           ; $11C943   |
    LDX #$08            ; $11C946   |
    LDA #$9BE1          ; $11C948   |
    JSL $7EDE44         ; $11C94B   | GSU init
    INC $0CF9           ; $11C94F   |
    BRA CODE_11C99D     ; $11C952   |

    LDA $76,x           ; $11C954   |
    LDA #$0100          ; $11C956   |
    STA $3016           ; $11C959   |
    LDA $78,x           ; $11C95C   |
    LDA #$0000          ; $11C95E   |
    STA $301C           ; $11C961   |
    LDA $18,x           ; $11C964   |
    ASL A               ; $11C966   |
    TAY                 ; $11C967   |
    LDA $C8BE,y         ; $11C968   |
    STA $3018           ; $11C96B   |
    LDA #$0053          ; $11C96E   |
    STA $301A           ; $11C971   |
    LDY $7722,x         ; $11C974   |
    TYX                 ; $11C977   |
    LDA $03A9CE,x       ; $11C978   |
    STA $3006           ; $11C97C   |
    LDA $03A9EE,x       ; $11C97F   |
    STA $3004           ; $11C983   |
    LDA #$0010          ; $11C986   |
    STA $3010           ; $11C989   |
    STA $3012           ; $11C98C   |
    LDX #$08            ; $11C98F   |
    LDA #$9BC5          ; $11C991   |
    JSL $7EDE44         ; $11C994   | GSU init
    INC $0CF9           ; $11C998   |
    LDX $12             ; $11C99B   |

CODE_11C99D:
    LDX $12             ; $11C99D   |
    RTL                 ; $11C99F   |

.main_item_card
    PEA $C9AF           ; $11C9A0   | push return address
    LDA $7976,x         ; $11C9A3   |
    ASL A               ; $11C9A6   |
    TAY                 ; $11C9A7   |
    LDA $C9BD,y         ; $11C9A8   | table
    STA $00             ; $11C9AB   |
    JMP ($7960)         ; $11C9AD   |

    JSL $11C91A         ; $11C9B0   | return here after JMP

    JSL $02DABA         ; $11C9B4   |
    JSL $03AA52         ; $11C9B8   |
    RTL                 ; $11C9BC   |

item_card_ptr:
DATA_11C9BD:         dw $C9C1
DATA_11C9BF:         dw $C9DD

; item_card_ptr routine
    LDA $76,x           ; $11C9C1   |
    CLC                 ; $11C9C3   |
    ADC #$0002          ; $11C9C4   |
    STA $76,x           ; $11C9C7   |
    CMP #$0100          ; $11C9C9   |
    BNE CODE_11C9D1     ; $11C9CC   |
    INC $7976,x         ; $11C9CE   |

CODE_11C9D1:
    LDA $78,x           ; $11C9D1   |
    CLC                 ; $11C9D3   |
    ADC #$0003          ; $11C9D4   |
    AND #$00FF          ; $11C9D7   |
    STA $78,x           ; $11C9DA   |
    RTS                 ; $11C9DC   |

; item_card_ptr routine
    LDY $7D36,x         ; $11C9DD   |
    BEQ CODE_11CA04     ; $11C9E0   |
    BPL CODE_11CA04     ; $11C9E2   |
    LDA #$0036          ; $11C9E4   |\ play sound #$0036
    JSL $0085D2         ; $11C9E7   |/
    JSL $02A4F4         ; $11C9EB   |
    JSL $03A31E         ; $11C9EF   |
    INC $10FA           ; $11C9F3   |
    LDA $7978,x         ; $11C9F6   |
    CMP #$000A          ; $11C9F9   |
    BCS CODE_11CA07     ; $11C9FC   |
    JSL $109CA6         ; $11C9FE   |
    LDX $12             ; $11CA02   |

CODE_11CA04:
    JMP CODE_11C9D1     ; $11CA04   |

CODE_11CA07:
    SBC #$000A          ; $11CA07   |
    INC A               ; $11CA0A   |
    CLC                 ; $11CA0B   |
    ADC $0379           ; $11CA0C   |
    STA $0379           ; $11CA0F   |
    JMP CODE_11C9D1     ; $11CA12   |

; level 05 header
DATA_11CA15:         db $CE, $27, $AD, $B6, $9E, $E0, $29, $60
DATA_11CA1D:         db $30, $00

; level 05 object data
DATA_11CA1F:         db $E7, $74, $67, $FF, $09, $D2, $64, $B5
DATA_11CA27:         db $03, $00, $64, $B4, $8E, $EC, $64, $22
DATA_11CA2F:         db $00, $1D, $E4, $64, $20, $01, $1D, $EB
DATA_11CA37:         db $74, $A5, $00, $05, $E6, $74, $49, $FF
DATA_11CA3F:         db $0B, $E5, $74, $2D, $FD, $0D, $00, $65
DATA_11CA47:         db $F0, $FD, $E4, $75, $66, $05, $09, $E6
DATA_11CA4F:         db $75, $2F, $FD, $0D, $E4, $76, $20, $01
DATA_11CA57:         db $0D, $EB, $77, $58, $00, $0A, $6E, $77
DATA_11CA5F:         db $68, $00, $00, $E9, $76, $22, $03, $0D
DATA_11CA67:         db $00, $67, $F0, $FD, $00, $66, $FF, $FD
DATA_11CA6F:         db $EC, $78, $41, $00, $0B, $00, $77, $1F
DATA_11CA77:         db $D5, $EB, $78, $4F, $00, $0B, $00, $78
DATA_11CA7F:         db $1D, $D9, $00, $68, $F0, $FD, $67, $78
DATA_11CA87:         db $8F, $00, $07, $E5, $77, $1D, $FF, $0E
DATA_11CA8F:         db $E4, $77, $1E, $01, $0E, $E6, $77, $2B
DATA_11CA97:         db $FE, $0D, $EC, $78, $86, $00, $07, $E4
DATA_11CA9F:         db $78, $8B, $03, $07, $EB, $78, $8A, $00
DATA_11CAA7:         db $07, $67, $79, $60, $00, $09, $E4, $78
DATA_11CAAF:         db $82, $03, $07, $67, $78, $81, $00, $07
DATA_11CAB7:         db $67, $78, $60, $00, $09, $67, $78, $70
DATA_11CABF:         db $00, $08, $E4, $79, $31, $0B, $0C, $00
DATA_11CAC7:         db $69, $F0, $FD, $6E, $7A, $AA, $00, $00
DATA_11CACF:         db $6E, $7A, $BB, $00, $00, $6E, $7A, $CC
DATA_11CAD7:         db $00, $00, $6E, $7A, $DD, $00, $01, $6E
DATA_11CADF:         db $7A, $EE, $00, $00, $67, $7A, $AB, $04
DATA_11CAE7:         db $00, $67, $7A, $BC, $03, $00, $67, $7A
DATA_11CAEF:         db $CD, $02, $00, $67, $7A, $DE, $01, $00
DATA_11CAF7:         db $67, $7A, $EF, $00, $00, $00, $79, $1B
DATA_11CAFF:         db $50, $6B, $6C, $CE, $31, $03, $00, $6D
DATA_11CB07:         db $BC, $82, $EB, $6C, $98, $00, $06, $E9
DATA_11CB0F:         db $6C, $9B, $01, $06, $E4, $6C, $99, $01
DATA_11CB17:         db $06, $EC, $6C, $BD, $00, $04, $D1, $64
DATA_11CB1F:         db $C4, $13, $63, $78, $66, $04, $63, $78
DATA_11CB27:         db $A7, $02, $63, $77, $A3, $05, $6E, $77
DATA_11CB2F:         db $82, $00, $02, $C4, $76, $7B, $0A, $E4
DATA_11CB37:         db $76, $A7, $03, $05, $67, $76, $A6, $00
DATA_11CB3F:         db $05, $EC, $76, $66, $00, $03, $EC, $76
DATA_11CB47:         db $AB, $00, $05, $63, $76, $8C, $05, $6E
DATA_11CB4F:         db $76, $8B, $00, $02, $0D, $76, $6B, $0C
DATA_11CB57:         db $E4, $74, $2E, $03, $0D, $E9, $75, $22
DATA_11CB5F:         db $03, $0D, $0C, $78, $65, $01, $0C, $78
DATA_11CB67:         db $6B, $01, $E9, $7A, $B7, $05, $04, $E9
DATA_11CB6F:         db $79, $3D, $07, $0C, $E4, $7A, $B5, $01
DATA_11CB77:         db $04, $6E, $7A, $FB, $04, $00, $0C, $7A
DATA_11CB7F:         db $76, $03, $EB, $6A, $37, $00, $13, $E4
DATA_11CB87:         db $6A, $38, $08, $13, $00, $7B, $70, $FF
DATA_11CB8F:         db $00, $6B, $F0, $FF, $6E, $7A, $88, $00
DATA_11CB97:         db $00, $6E, $7A, $99, $00, $00, $6E, $7A
DATA_11CB9F:         db $77, $00, $00, $67, $7A, $7A, $05, $02
DATA_11CBA7:         db $67, $7A, $79, $00, $01, $67, $7A, $78
DATA_11CBAF:         db $00, $00, $0C, $76, $5A, $04, $E4, $6C
DATA_11CBB7:         db $80, $03, $07, $EC, $6C, $84, $00, $07
DATA_11CBBF:         db $63, $6C, $B5, $02, $3C, $72, $69, $09
DATA_11CBC7:         db $67, $62, $7C, $00, $18, $EB, $62, $4B
DATA_11CBCF:         db $00, $1B, $E4, $62, $3D, $03, $1C, $00
DATA_11CBD7:         db $62, $29, $DA, $00, $61, $F0, $FD, $00
DATA_11CBDF:         db $60, $FF, $FD, $E4, $70, $C0, $0B, $03
DATA_11CBE7:         db $00, $6C, $AF, $50, $E5, $70, $BD, $FF
DATA_11CBEF:         db $04, $E6, $70, $9F, $FF, $06, $E4, $71
DATA_11CBF7:         db $90, $01, $06, $E9, $71, $92, $01, $06
DATA_11CBFF:         db $E8, $71, $B4, $01, $04, $E4, $71, $C6
DATA_11CC07:         db $01, $03, $E5, $71, $B9, $FF, $04, $E6
DATA_11CC0F:         db $71, $9B, $FF, $06, $E4, $71, $9C, $01
DATA_11CC17:         db $06, $E9, $71, $9E, $01, $06, $E8, $72
DATA_11CC1F:         db $B0, $01, $04, $E4, $72, $C2, $01, $03
DATA_11CC27:         db $E6, $72, $A5, $FF, $05, $E4, $72, $A6
DATA_11CC2F:         db $01, $05, $EC, $72, $A8, $00, $05, $00
DATA_11CC37:         db $63, $00, $FF, $00, $73, $00, $FF, $15
DATA_11CC3F:         db $62, $B5, $03, $C5, $62, $DA, $02, $15
DATA_11CC47:         db $40, $B0, $1F, $15, $41, $64, $01, $15
DATA_11CC4F:         db $40, $6F, $01, $15, $40, $6A, $01, $6E
DATA_11CC57:         db $40, $BA, $00, $00, $6E, $40, $BF, $00
DATA_11CC5F:         db $00, $6E, $41, $B4, $00, $00, $63, $72
DATA_11CC67:         db $65, $03, $FF

; level 05 screen exit data
DATA_11CC6A:         db $72, $9A, $06, $40, $04, $7A, $3E, $72
DATA_11CC72:         db $63, $00, $78, $6F, $02, $55, $04, $62
DATA_11CC7A:         db $05, $02, $4A, $00, $40, $05, $26, $6A
DATA_11CC82:         db $00, $74, $9A, $48, $23, $00, $FF

; level 3E header
DATA_11CC89:         db $04, $32, $69, $B9, $9E, $40, $70, $06
DATA_11CC91:         db $A2, $20

; level 3E object data
DATA_11CC93:         db $01, $66, $11, $0E, $1E, $06, $77, $71
DATA_11CC9B:         db $01, $08, $01, $77, $70, $00, $08, $04
DATA_11CCA3:         db $77, $93, $03, $06, $01, $77, $B7, $08
DATA_11CCAB:         db $04, $01, $67, $14, $08, $10, $62, $77
DATA_11CCB3:         db $23, $01, $01, $58, $77, $58, $04, $00
DATA_11CCBB:         db $61, $77, $25, $03, $03, $5F, $77, $4C
DATA_11CCC3:         db $03, $01, $60, $78, $20, $01, $01, $67
DATA_11CCCB:         db $77, $29, $06, $01, $67, $77, $49, $02
DATA_11CCD3:         db $00, $00, $77, $99, $50, $05, $78, $B0
DATA_11CCDB:         db $03, $04, $07, $78, $94, $01, $06, $03
DATA_11CCE3:         db $78, $76, $08, $5F, $68, $82, $05, $09
DATA_11CCEB:         db $60, $68, $98, $05, $00, $67, $67, $8D
DATA_11CCF3:         db $04, $09, $67, $68, $88, $05, $00, $E1
DATA_11CCFB:         db $7A, $61, $02, $09, $00, $6A, $F0, $FD
DATA_11CD03:         db $E1, $79, $55, $02, $0A, $E1, $79, $4E
DATA_11CD0B:         db $02, $0B, $01, $5A, $1F, $00, $2E, $01
DATA_11CD13:         db $6A, $BB, $03, $14, $02, $6A, $BA, $14
DATA_11CD1B:         db $60, $6A, $15, $03, $03, $5F, $6A, $09
DATA_11CD23:         db $01, $00, $58, $69, $7A, $05, $00, $01
DATA_11CD2B:         db $5A, $15, $04, $0E, $67, $6A, $05, $03
DATA_11CD33:         db $00, $E1, $7A, $35, $02, $0C, $01, $58
DATA_11CD3B:         db $11, $0A, $11, $02, $59, $1A, $15, $C4
DATA_11CD43:         db $6A, $A5, $00, $C4, $6A, $69, $00, $E1
DATA_11CD4B:         db $78, $6F, $02, $09, $67, $66, $01, $0E
DATA_11CD53:         db $02, $67, $67, $04, $0C, $02, $03, $57
DATA_11CD5B:         db $D0, $1A, $02, $57, $D3, $14, $03, $58
DATA_11CD63:         db $7C, $0E, $00, $57, $FF, $FF, $00, $56
DATA_11CD6B:         db $FF, $FF, $E1, $78, $6A, $02, $09, $67
DATA_11CD73:         db $58, $01, $29, $02, $67, $5A, $0E, $01
DATA_11CD7B:         db $02, $03, $4A, $DA, $12, $02, $4A, $DE
DATA_11CD83:         db $1E, $00, $4B, $F0, $FF, $00, $4A, $FF
DATA_11CD8B:         db $FF, $67, $58, $3C, $0F, $08, $67, $59
DATA_11CD93:         db $1B, $09, $13, $02, $69, $5E, $07, $67
DATA_11CD9B:         db $67, $3D, $0E, $04, $58, $58, $BC, $0E
DATA_11CDA3:         db $00, $62, $59, $C9, $00, $00, $67, $59
DATA_11CDAB:         db $B9, $01, $00, $67, $59, $CA, $00, $00
DATA_11CDB3:         db $60, $58, $CD, $00, $00, $C4, $69, $15
DATA_11CDBB:         db $00, $6E, $58, $FD, $08, $00, $E1, $79
DATA_11CDC3:         db $79, $02, $08, $E1, $69, $FB, $02, $10
DATA_11CDCB:         db $E1, $79, $27, $02, $0D, $00, $79, $A4
DATA_11CDD3:         db $9D, $6E, $69, $C6, $04, $00, $0D, $69
DATA_11CDDB:         db $C2, $03, $67, $69, $7F, $00, $05, $03
DATA_11CDE3:         db $6A, $50, $07, $67, $69, $4B, $04, $02
DATA_11CDEB:         db $5F, $6A, $53, $01, $00, $60, $6A, $41
DATA_11CDF3:         db $01, $03, $67, $6A, $40, $00, $03, $62
DATA_11CDFB:         db $69, $8C, $01, $01, $67, $69, $8E, $00
DATA_11CE03:         db $01, $58, $69, $CE, $02, $00, $61, $69
DATA_11CE0B:         db $8B, $01, $00, $67, $69, $7B, $03, $00
DATA_11CE13:         db $03, $69, $41, $02, $63, $69, $42, $02
DATA_11CE1B:         db $D1, $69, $F4, $0A, $67, $58, $BC, $00
DATA_11CE23:         db $01, $67, $58, $BD, $00, $00, $5F, $68
DATA_11CE2B:         db $6E, $01, $02, $5F, $69, $70, $01, $00
DATA_11CE33:         db $E1, $79, $C2, $02, $03, $E1, $78, $CD
DATA_11CE3B:         db $02, $03, $E1, $78, $D8, $02, $02, $00
DATA_11CE43:         db $6D, $00, $FF, $00, $6E, $00, $FF, $01
DATA_11CE4B:         db $68, $5C, $02, $02, $05, $68, $5F, $01
DATA_11CE53:         db $01, $F4, $68, $3D, $01, $6E, $5A, $0B
DATA_11CE5B:         db $02, $00, $FF

; level 3E screen exit data
DATA_11CE5E:         db $5A, $05, $C6, $6E, $09, $FF

; level 6F header
DATA_11CE64:         db $C0, $02, $69, $80, $05, $60, $28, $05
DATA_11CE6C:         db $02, $40

; level 6F object data
DATA_11CE6E:         db $67, $50, $00, $01, $0F, $67, $52, $07
DATA_11CE76:         db $08, $0F, $67, $52, $06, $00, $0B, $67
DATA_11CE7E:         db $50, $04, $04, $04, $67, $50, $09, $00
DATA_11CE86:         db $0A, $67, $50, $0A, $00, $0D, $01, $50
DATA_11CE8E:         db $EA, $13, $01, $4E, $50, $2B, $1A, $09
DATA_11CE96:         db $00, $30, $00, $FF, $00, $31, $00, $FF
DATA_11CE9E:         db $00, $32, $00, $FF, $3C, $50, $62, $FB
DATA_11CEA6:         db $4F, $51, $9C, $09, $03, $02, $51, $CD
DATA_11CEAE:         db $02, $01, $51, $CE, $08, $03, $67, $50
DATA_11CEB6:         db $0B, $1A, $00, $58, $50, $1A, $02, $0D
DATA_11CEBE:         db $58, $50, $02, $02, $04, $58, $50, $01
DATA_11CEC6:         db $02, $0A, $01, $50, $B1, $08, $04, $00
DATA_11CECE:         db $50, $94, $50, $58, $50, $44, $05, $07
DATA_11CED6:         db $14, $50, $A9, $01, $00, $58, $50, $1C
DATA_11CEDE:         db $1A, $0B, $4F, $50, $9D, $00, $00, $4F
DATA_11CEE6:         db $51, $60, $00, $00, $4F, $50, $4E, $00
DATA_11CEEE:         db $00, $4F, $51, $93, $00, $00, $4F, $51
DATA_11CEF6:         db $A1, $00, $00, $4F, $51, $55, $00, $00
DATA_11CEFE:         db $4F, $51, $78, $00, $00, $4F, $51, $A6
DATA_11CF06:         db $00, $00, $4F, $51, $A9, $00, $00, $4F
DATA_11CF0E:         db $51, $42, $00, $00, $4F, $51, $3A, $00
DATA_11CF16:         db $00, $4F, $51, $6D, $00, $00, $4F, $52
DATA_11CF1E:         db $40, $00, $00, $4F, $52, $62, $00, $00
DATA_11CF26:         db $4F, $52, $44, $00, $00, $4F, $51, $47
DATA_11CF2E:         db $00, $00, $4F, $51, $4C, $00, $00, $68
DATA_11CF36:         db $50, $9D, $00, $00, $68, $50, $4E, $00
DATA_11CF3E:         db $00, $68, $51, $42, $00, $00, $68, $51
DATA_11CF46:         db $93, $00, $00, $68, $51, $A6, $00, $00
DATA_11CF4E:         db $68, $51, $A1, $00, $00, $68, $51, $A9
DATA_11CF56:         db $00, $00, $68, $51, $78, $00, $00, $68
DATA_11CF5E:         db $51, $55, $00, $00, $68, $51, $47, $00
DATA_11CF66:         db $00, $68, $51, $3A, $00, $00, $68, $51
DATA_11CF6E:         db $4C, $00, $00, $68, $51, $6D, $00, $00
DATA_11CF76:         db $68, $52, $40, $00, $00, $68, $52, $62
DATA_11CF7E:         db $00, $00, $FF

; level 7F screen exit data
DATA_11CF81:         db $50, $05, $88, $74, $00, $52, $05, $88
DATA_11CF89:         db $74, $00, $FF

; level 9A header
DATA_11CF8C:         db $04, $32, $69, $B9, $AE, $40, $70, $06
DATA_11CF94:         db $A2, $60

; level 9A object data
DATA_11CF96:         db $05, $50, $CE, $03, $03, $07, $51, $A2
DATA_11CF9E:         db $01, $05, $01, $51, $84, $01, $07, $06
DATA_11CFA6:         db $51, $86, $01, $07, $01, $51, $A8, $06
DATA_11CFAE:         db $05, $58, $32, $6E, $09, $00, $58, $33
DATA_11CFB6:         db $78, $04, $00, $61, $33, $67, $01, $01
DATA_11CFBE:         db $5F, $34, $51, $01, $00, $67, $33, $0E
DATA_11CFC6:         db $02, $05, $02, $42, $51, $00, $03, $42
DATA_11CFCE:         db $53, $00, $58, $42, $61, $02, $00, $01
DATA_11CFD6:         db $42, $52, $00, $00, $5F, $33, $7C, $01
DATA_11CFDE:         db $00, $58, $33, $6C, $03, $00, $5F, $33
DATA_11CFE6:         db $6F, $01, $00, $05, $34, $F5, $03, $00
DATA_11CFEE:         db $01, $34, $F1, $03, $01, $67, $44, $11
DATA_11CFF6:         db $01, $00, $05, $51, $8F, $03, $07, $02
DATA_11CFFE:         db $51, $8E, $01, $01, $52, $63, $00, $09
DATA_11D006:         db $61, $42, $61, $01, $00, $58, $50, $4D
DATA_11D00E:         db $02, $00, $03, $50, $11, $07, $61, $50
DATA_11D016:         db $3A, $03, $01, $67, $50, $3E, $00, $00
DATA_11D01E:         db $67, $50, $2B, $04, $00, $67, $30, $00
DATA_11D026:         db $02, $22, $67, $50, $30, $00, $0C, $60
DATA_11D02E:         db $50, $32, $01, $01, $04, $50, $92, $05
DATA_11D036:         db $06, $02, $42, $F1, $01, $02, $52, $13
DATA_11D03E:         db $05, $62, $52, $11, $01, $01, $01, $42
DATA_11D046:         db $F2, $01, $01, $67, $52, $13, $00, $01
DATA_11D04E:         db $01, $41, $AF, $00, $00, $02, $41, $AE
DATA_11D056:         db $00, $03, $42, $A0, $00, $5F, $41, $BF
DATA_11D05E:         db $01, $00, $62, $41, $BE, $00, $00, $01
DATA_11D066:         db $51, $15, $07, $01, $03, $51, $1D, $01
DATA_11D06E:         db $5F, $51, $3A, $03, $00, $03, $31, $25
DATA_11D076:         db $18, $62, $51, $39, $00, $02, $61, $51
DATA_11D07E:         db $37, $01, $00, $67, $51, $27, $00, $00
DATA_11D086:         db $01, $42, $F4, $00, $10, $02, $42, $C4
DATA_11D08E:         db $03, $58, $31, $3B, $0F, $00, $5F, $31
DATA_11D096:         db $08, $03, $05, $60, $31, $06, $01, $07
DATA_11D09E:         db $67, $31, $0C, $0D, $02, $61, $32, $5D
DATA_11D0A6:         db $01, $01, $61, $32, $0A, $01, $04, $05
DATA_11D0AE:         db $43, $22, $01, $01, $07, $43, $14, $01
DATA_11D0B6:         db $01, $58, $42, $4C, $08, $00, $5F, $43
DATA_11D0BE:         db $34, $03, $01, $5F, $42, $5D, $03, $00
DATA_11D0C6:         db $03, $42, $4A, $1B, $60, $42, $4B, $01
DATA_11D0CE:         db $04, $67, $42, $4D, $03, $00, $67, $42
DATA_11D0D6:         db $3A, $00, $05, $67, $42, $3B, $00, $00
DATA_11D0DE:         db $07, $42, $C5, $01, $13, $67, $42, $A7
DATA_11D0E6:         db $00, $15, $01, $43, $20, $01, $01, $04
DATA_11D0EE:         db $42, $1E, $01, $02, $06, $32, $DA, $03
DATA_11D0F6:         db $06, $01, $32, $D8, $01, $22, $02, $32
DATA_11D0FE:         db $D7, $0C, $01, $33, $F6, $00, $03, $04
DATA_11D106:         db $33, $F7, $03, $03, $07, $43, $1F, $01
DATA_11D10E:         db $01, $01, $43, $1B, $03, $01, $67, $32
DATA_11D116:         db $0C, $0A, $04, $67, $33, $07, $06, $06
DATA_11D11E:         db $62, $32, $5C, $00, $00, $67, $32, $5E
DATA_11D126:         db $08, $00, $5F, $50, $3F, $03, $01, $58
DATA_11D12E:         db $51, $21, $07, $00, $67, $51, $20, $02
DATA_11D136:         db $00, $67, $51, $27, $01, $00, $00, $32
DATA_11D13E:         db $B8, $50, $01, $50, $C8, $05, $03, $00
DATA_11D146:         db $50, $AB, $50, $C5, $31, $EC, $00, $C5
DATA_11D14E:         db $31, $CD, $00, $C5, $32, $85, $00, $C5
DATA_11D156:         db $32, $97, $00, $67, $20, $10, $44, $0E
DATA_11D15E:         db $02, $24, $9C, $06, $03, $24, $D5, $04
DATA_11D166:         db $67, $24, $95, $00, $04, $67, $24, $9C
DATA_11D16E:         db $00, $04, $60, $24, $E6, $00, $00, $62
DATA_11D176:         db $24, $EB, $00, $00, $67, $24, $EC, $00
DATA_11D17E:         db $00, $60, $34, $23, $02, $02, $67, $24
DATA_11D186:         db $E5, $00, $00, $67, $34, $01, $03, $01
DATA_11D18E:         db $67, $34, $21, $01, $02, $07, $34, $D9
DATA_11D196:         db $03, $02, $01, $34, $9D, $03, $04, $02
DATA_11D19E:         db $35, $10, $08, $62, $34, $0C, $03, $03
DATA_11D1A6:         db $67, $35, $00, $00, $03, $67, $35, $01
DATA_11D1AE:         db $0D, $0E, $5F, $35, $F5, $09, $00, $61
DATA_11D1B6:         db $45, $21, $03, $01, $58, $44, $19, $08
DATA_11D1BE:         db $00, $67, $35, $F1, $03, $02, $67, $34
DATA_11D1C6:         db $ED, $03, $02, $61, $43, $38, $03, $00
DATA_11D1CE:         db $58, $43, $3D, $05, $00, $5F, $43, $3C
DATA_11D1D6:         db $01, $01, $5F, $44, $13, $03, $00, $61
DATA_11D1DE:         db $44, $17, $03, $00, $5F, $44, $2B, $01
DATA_11D1E6:         db $00, $67, $44, $1B, $01, $00, $67, $44
DATA_11D1EE:         db $05, $07, $00, $67, $44, $21, $01, $00
DATA_11D1F6:         db $00, $34, $69, $90, $00, $34, $7B, $9B
DATA_11D1FE:         db $D2, $34, $7A, $00, $68, $41, $0B, $00
DATA_11D206:         db $00, $67, $50, $31, $00, $01, $67, $50
DATA_11D20E:         db $91, $00, $06, $C5, $41, $4A, $07, $00
DATA_11D216:         db $15, $F0, $FF, $00, $16, $F0, $FF, $00
DATA_11D21E:         db $13, $FF, $FF, $00, $12, $FF, $FF, $00
DATA_11D226:         db $11, $FF, $FF, $00, $10, $FF, $FF, $00
DATA_11D22E:         db $26, $00, $FF, $67, $31, $05, $00, $07
DATA_11D236:         db $01, $51, $10, $04, $00, $03, $41, $80
DATA_11D23E:         db $09, $58, $41, $B0, $05, $00, $67, $30
DATA_11D246:         db $0B, $09, $1A, $67, $40, $BB, $04, $06
DATA_11D24E:         db $60, $41, $C1, $00, $00, $67, $41, $B0
DATA_11D256:         db $01, $00, $67, $41, $C0, $00, $00, $F4
DATA_11D25E:         db $41, $F1, $01, $67, $24, $0D, $12, $0F
DATA_11D266:         db $67, $20, $00, $44, $00, $02, $14, $DB
DATA_11D26E:         db $10, $03, $14, $D6, $10, $6E, $24, $07
DATA_11D276:         db $03, $00, $67, $24, $05, $00, $08, $67
DATA_11D27E:         db $24, $0C, $00, $08, $00, $14, $FF, $FF
DATA_11D286:         db $3C, $40, $16, $FA, $03, $30, $63, $1C
DATA_11D28E:         db $02, $30, $6A, $1C, $67, $30, $03, $07
DATA_11D296:         db $0A, $58, $30, $A3, $07, $00, $67, $30
DATA_11D29E:         db $A3, $00, $00, $67, $30, $AA, $00, $00
DATA_11D2A6:         db $D1, $24, $39, $12, $FF

; level 9A screen exit data
DATA_11D2AB:         db $40, $05, $29, $76, $05, $24, $05, $44
DATA_11D2B3:         db $7B, $00, $41, $37, $A7, $00, $08, $FF

; level 05 sprite data
DATA_11D2BB:         db $8B, $FD, $44, $F2, $EA, $59, $F2, $EA
DATA_11D2C3:         db $5B, $F2, $E4, $5E, $F2, $EE, $72, $F2
DATA_11D2CB:         db $EE, $70, $10, $F1, $76, $66, $EE, $83
DATA_11D2D3:         db $10, $F1, $89, $F2, $E4, $9C, $F2, $E4
DATA_11D2DB:         db $99, $F2, $E4, $96, $84, $FC, $AC, $0D
DATA_11D2E3:         db $D6, $D5, $10, $D3, $98, $4F, $DC, $61
DATA_11D2EB:         db $C1, $DC, $59, $C1, $C6, $C6, $D1, $F0
DATA_11D2F3:         db $8E, $98, $F3, $AB, $98, $EF, $A9, $F2
DATA_11D2FB:         db $F6, $23, $CC, $E0, $8A, $AD, $DA, $7E
DATA_11D303:         db $65, $CE, $44, $65, $CE, $46, $65, $CE
DATA_11D30B:         db $48, $65, $EE, $77, $65, $EA, $83, $65
DATA_11D313:         db $EA, $8D, $A0, $E4, $6A, $84, $FE, $43
DATA_11D31B:         db $F2, $F6, $17, $F2, $F2, $27, $6C, $EA
DATA_11D323:         db $26, $93, $D6, $26, $D6, $8D, $1C, $AD
DATA_11D32B:         db $90, $06, $24, $94, $0A, $22, $94, $0F
DATA_11D333:         db $23, $94, $14, $1E, $8C, $0A, $1E, $8C
DATA_11D33B:         db $0F, $1E, $8C, $14, $93, $96, $02, $8B
DATA_11D343:         db $D6, $DA, $B5, $C4, $2C, $AD, $DE, $93
DATA_11D34B:         db $FF, $FF

; level 3E sprite data
DATA_11D34D:         db $3D, $EB, $77, $3E, $F3, $9B, $3E, $EF
DATA_11D355:         db $9E, $6C, $D4, $AC, $3D, $C3, $A8, $3D
DATA_11D35D:         db $C7, $A6, $84, $AC, $AC, $C7, $DA, $A6
DATA_11D365:         db $FA, $BA, $8F, $33, $F3, $7D, $33, $F3
DATA_11D36D:         db $7F, $3C, $D9, $9C, $8D, $F3, $94, $6F
DATA_11D375:         db $F8, $89, $F2, $F2, $7B, $F2, $EA, $A2
DATA_11D37D:         db $65, $BA, $91, $65, $B8, $93, $65, $BA
DATA_11D385:         db $95, $65, $BC, $97, $65, $BE, $99, $65
DATA_11D38D:         db $C0, $97, $65, $D0, $A6, $65, $CE, $A7
DATA_11D395:         db $33, $C7, $8D, $FF, $FF

; level 6F sprite data
DATA_11D39A:         db $93, $B6, $24, $B0, $AC, $08, $98, $B6
DATA_11D3A2:         db $1E, $65, $A8, $24, $65, $AC, $10, $D6
DATA_11D3AA:         db $A5, $2A, $AD, $AC, $05, $25, $B4, $08
DATA_11D3B2:         db $FF, $FF

; level 9A sprite data
DATA_11D3B4:         db $3C, $8D, $25, $77, $95, $19, $6F, $AC
DATA_11D3BC:         db $1F, $6F, $92, $1F, $84, $42, $48, $8B
DATA_11D3C4:         db $6D, $4A, $F2, $AE, $13, $65, $74, $1F
DATA_11D3CC:         db $65, $72, $21, $65, $70, $23, $84, $42
DATA_11D3D4:         db $49, $F2, $B2, $0F, $F2, $7E, $3F, $F2
DATA_11D3DC:         db $7E, $33, $33, $9F, $11, $33, $73, $4B
DATA_11D3E4:         db $33, $77, $49, $10, $89, $25, $42, $9E
DATA_11D3EC:         db $11, $FF, $FF

; level 15 header
DATA_11D3EF:         db $CA, $94, $41, $00, $02, $80, $29, $80
DATA_11D3F7:         db $19, $60

; level 15 object data
DATA_11D3F9:         db $00, $00, $11, $FD, $00, $01, $11, $FD
DATA_11D401:         db $00, $02, $11, $FD, $00, $03, $11, $FD
DATA_11D409:         db $00, $04, $11, $FD, $00, $05, $11, $FD
DATA_11D411:         db $32, $31, $B2, $05, $04, $33, $30, $B0
DATA_11D419:         db $04, $04, $00, $30, $AC, $04, $00, $30
DATA_11D421:         db $A6, $05, $00, $30, $AD, $01, $32, $30
DATA_11D429:         db $C5, $09, $03, $34, $31, $8D, $04, $33
DATA_11D431:         db $31, $F8, $03, $00, $33, $31, $AC, $06
DATA_11D439:         db $05, $A7, $34, $B2, $00, $01, $A7, $34
DATA_11D441:         db $B4, $00, $00, $A7, $34, $83, $01, $02
DATA_11D449:         db $46, $34, $CC, $04, $00, $48, $34, $73
DATA_11D451:         db $02, $00, $CC, $35, $80, $FD, $FD, $44
DATA_11D459:         db $35, $61, $13, $05, $6E, $33, $B2, $02
DATA_11D461:         db $01, $2B, $33, $DD, $02, $6C, $33, $CD
DATA_11D469:         db $00, $00, $33, $33, $D2, $02, $02, $33
DATA_11D471:         db $34, $D2, $23, $02, $35, $30, $D0, $65
DATA_11D479:         db $02, $43, $35, $65, $05, $43, $35, $6E
DATA_11D481:         db $05, $49, $36, $11, $02, $00, $33, $A9
DATA_11D489:         db $13, $48, $34, $5D, $18, $00, $48, $34
DATA_11D491:         db $84, $02, $00, $00, $30, $92, $50, $29
DATA_11D499:         db $30, $59, $FD, $FB, $2A, $30, $5A, $03
DATA_11D4A1:         db $FB, $2A, $31, $56, $05, $FB, $2A, $30
DATA_11D4A9:         db $70, $05, $F9, $29, $30, $3F, $FF, $FD
DATA_11D4B1:         db $2A, $31, $30, $01, $FD, $29, $31, $55
DATA_11D4B9:         db $FD, $FB, $63, $32, $A3, $11, $49, $35
DATA_11D4C1:         db $79, $03, $79, $34, $76, $04, $48, $34
DATA_11D4C9:         db $4C, $04, $00, $48, $34, $A4, $03, $00
DATA_11D4D1:         db $48, $34, $C5, $20, $00, $48, $35, $4C
DATA_11D4D9:         db $01, $00, $48, $35, $42, $01, $00, $48
DATA_11D4E1:         db $34, $1A, $05, $01, $48, $34, $3B, $03
DATA_11D4E9:         db $00, $48, $36, $64, $01, $05, $44, $36
DATA_11D4F1:         db $74, $00, $03, $41, $34, $C8, $1C, $48
DATA_11D4F9:         db $34, $95, $02, $02, $C6, $33, $6F, $FE
DATA_11D501:         db $C6, $34, $50, $FE, $68, $34, $51, $01
DATA_11D509:         db $00, $49, $35, $17, $02, $48, $35, $25
DATA_11D511:         db $01, $01, $48, $35, $15, $05, $00, $48
DATA_11D519:         db $35, $29, $01, $01, $48, $35, $2F, $01
DATA_11D521:         db $01, $48, $35, $1F, $05, $00, $48, $36
DATA_11D529:         db $23, $01, $01, $48, $34, $BA, $00, $00
DATA_11D531:         db $48, $35, $46, $03, $00, $48, $36, $40
DATA_11D539:         db $03, $00, $FF

; level 15 screen exit data
DATA_11D53C:         db $36, $4D, $05, $38, $00, $34, $D7, $2A
DATA_11D544:         db $6C, $00, $FF

; level 4D header
DATA_11D547:         db $CF, $20, $41, $59, $5A, $90, $79, $80
DATA_11D54F:         db $19, $00

; level 4D object data
DATA_11D551:         db $CB, $34, $4F, $01, $06, $CD, $35, $90
DATA_11D559:         db $02, $F9, $CB, $34, $3A, $01, $07, $CC
DATA_11D561:         db $34, $8A, $FA, $FA, $CB, $37, $24, $06
DATA_11D569:         db $07, $CB, $30, $41, $09, $05, $33, $35
DATA_11D571:         db $BE, $08, $04, $CC, $35, $AE, $FD, $F8
DATA_11D579:         db $CD, $36, $A6, $03, $F8, $41, $35, $AE
DATA_11D581:         db $08, $CD, $37, $8A, $06, $FA, $CB, $32
DATA_11D589:         db $36, $02, $07, $CB, $31, $3E, $02, $07
DATA_11D591:         db $CB, $39, $4B, $01, $02, $CC, $39, $8C
DATA_11D599:         db $FF, $FF, $CD, $39, $8D, $02, $FC, $CC
DATA_11D5A1:         db $3A, $71, $FF, $FD, $CC, $3A, $8D, $FE
DATA_11D5A9:         db $FC, $CC, $3D, $82, $FE, $FC, $CD, $3D
DATA_11D5B1:         db $83, $01, $FF, $CC, $3A, $78, $FE, $FD
DATA_11D5B9:         db $CD, $3A, $72, $02, $FD, $CD, $3A, $79
DATA_11D5C1:         db $01, $FD, $CD, $3C, $82, $02, $FC, $CC
DATA_11D5C9:         db $3C, $76, $FF, $FD, $CD, $3C, $77, $02
DATA_11D5D1:         db $FD, $CD, $3C, $7E, $01, $FD, $CC, $3C
DATA_11D5D9:         db $7D, $FE, $FD, $CB, $3D, $43, $01, $02
DATA_11D5E1:         db $41, $37, $A3, $08, $68, $31, $69, $00
DATA_11D5E9:         db $00, $68, $31, $5A, $01, $00, $68, $31
DATA_11D5F1:         db $6C, $00, $00, $C4, $32, $62, $02, $C4
DATA_11D5F9:         db $32, $6A, $02, $68, $33, $62, $00, $00
DATA_11D601:         db $68, $33, $53, $01, $00, $68, $33, $65
DATA_11D609:         db $00, $00, $CD, $36, $AE, $03, $FC, $CC
DATA_11D611:         db $35, $A6, $FD, $FC, $CB, $32, $3E, $02
DATA_11D619:         db $07, $CC, $32, $7E, $FD, $FB, $CC, $32
DATA_11D621:         db $66, $FE, $FC, $CD, $32, $68, $02, $FC
DATA_11D629:         db $48, $32, $26, $02, $00, $CC, $31, $6E
DATA_11D631:         db $FC, $FC, $CD, $32, $70, $03, $FB, $48
DATA_11D639:         db $31, $2E, $02, $00, $46, $3E, $AE, $01
DATA_11D641:         db $00, $CB, $3E, $4F, $0C, $04, $CB, $3E
DATA_11D649:         db $44, $07, $05, $CD, $3E, $5B, $02, $FC
DATA_11D651:         db $CB, $30, $4F, $05, $05, $48, $3D, $26
DATA_11D659:         db $02, $00, $48, $39, $27, $02, $00, $43
DATA_11D661:         db $31, $44, $05, $48, $30, $A0, $14, $00
DATA_11D669:         db $CC, $3B, $92, $FE, $F9, $43, $3B, $20
DATA_11D671:         db $01, $CD, $3B, $9D, $02, $F9, $CB, $38
DATA_11D679:         db $35, $06, $06, $CB, $38, $45, $06, $05
DATA_11D681:         db $CB, $33, $3A, $06, $06, $43, $3E, $44
DATA_11D689:         db $05, $CD, $33, $60, $04, $FC, $48, $32
DATA_11D691:         db $2E, $02, $00, $48, $30, $20, $16, $00
DATA_11D699:         db $48, $30, $30, $14, $00, $4A, $3E, $32
DATA_11D6A1:         db $06, $41, $38, $A2, $0C, $41, $33, $A7
DATA_11D6A9:         db $0C, $41, $32, $AE, $02, $41, $32, $A6
DATA_11D6B1:         db $02, $41, $31, $AE, $02, $4A, $31, $35
DATA_11D6B9:         db $06, $CD, $30, $7A, $02, $FD, $00, $30
DATA_11D6C1:         db $8C, $50, $CC, $3E, $5F, $FF, $FF, $45
DATA_11D6C9:         db $3E, $9B, $01, $00, $41, $34, $A9, $08
DATA_11D6D1:         db $00, $34, $AD, $51, $00, $37, $A7, $51
DATA_11D6D9:         db $CD, $3A, $8E, $01, $FC, $CC, $3C, $81
DATA_11D6E1:         db $FF, $FC, $49, $3E, $57, $03, $44, $3F
DATA_11D6E9:         db $90, $09, $00, $49, $3F, $52, $03, $44
DATA_11D6F1:         db $3D, $42, $01, $02, $48, $3C, $30, $14
DATA_11D6F9:         db $00, $8C, $3C, $20, $14, $43, $3C, $2A
DATA_11D701:         db $02, $44, $39, $4C, $01, $02, $48, $39
DATA_11D709:         db $3A, $15, $00, $8C, $39, $2B, $14, $43
DATA_11D711:         db $3A, $25, $02, $43, $39, $2A, $01, $44
DATA_11D719:         db $35, $2F, $06, $07, $33, $30, $B0, $16
DATA_11D721:         db $04, $33, $31, $BE, $02, $04, $33, $32
DATA_11D729:         db $B6, $02, $04, $33, $32, $BE, $02, $04
DATA_11D731:         db $33, $33, $B7, $0C, $04, $33, $34, $B9
DATA_11D739:         db $08, $04, $33, $37, $B3, $08, $04, $33
DATA_11D741:         db $38, $B2, $0C, $04, $33, $3E, $B2, $1D
DATA_11D749:         db $04, $35, $30, $B0, $7F, $04, $35, $38
DATA_11D751:         db $B0, $7F, $04, $48, $30, $40, $02, $00
DATA_11D759:         db $48, $30, $50, $01, $03, $48, $30, $90
DATA_11D761:         db $02, $00, $41, $30, $A2, $14, $48, $3F
DATA_11D769:         db $4A, $05, $06, $44, $3F, $5A, $00, $03
DATA_11D771:         db $41, $3E, $A2, $18, $4A, $33, $27, $07
DATA_11D779:         db $48, $33, $29, $08, $00, $4A, $34, $22
DATA_11D781:         db $07, $43, $33, $3A, $06, $43, $34, $30
DATA_11D789:         db $06, $4A, $38, $22, $07, $4A, $38, $2D
DATA_11D791:         db $07, $48, $38, $24, $08, $00, $43, $38
DATA_11D799:         db $35, $06, $43, $38, $3B, $06, $CD, $35
DATA_11D7A1:         db $A7, $03, $FC, $53, $35, $75, $03, $CC
DATA_11D7A9:         db $36, $AD, $FD, $FC, $53, $36, $7C, $03
DATA_11D7B1:         db $48, $3E, $34, $1B, $00, $48, $3E, $22
DATA_11D7B9:         db $1D, $00, $CD, $3B, $93, $01, $F9, $CC
DATA_11D7C1:         db $3B, $A7, $FE, $F8, $CD, $3B, $A8, $02
DATA_11D7C9:         db $F8, $CC, $3B, $9C, $FF, $F9, $53, $3B
DATA_11D7D1:         db $61, $05, $53, $3B, $69, $05, $43, $3D
DATA_11D7D9:         db $25, $01, $55, $3B, $57, $FE, $01, $55
DATA_11D7E1:         db $3B, $58, $02, $01, $48, $3B, $21, $00
DATA_11D7E9:         db $01, $48, $39, $49, $01, $00, $48, $39
DATA_11D7F1:         db $38, $01, $00, $48, $3B, $40, $01, $00
DATA_11D7F9:         db $48, $3B, $2E, $01, $02, $43, $3B, $2F
DATA_11D801:         db $01, $48, $3D, $36, $01, $00, $48, $3D
DATA_11D809:         db $45, $01, $00, $CC, $37, $94, $FE, $F9
DATA_11D811:         db $48, $37, $24, $06, $00, $45, $35, $55
DATA_11D819:         db $01, $01, $45, $35, $22, $02, $03, $46
DATA_11D821:         db $35, $67, $01, $00, $46, $35, $49, $02
DATA_11D829:         db $01, $45, $36, $5C, $01, $01, $45, $36
DATA_11D831:         db $29, $02, $03, $46, $36, $6E, $01, $00
DATA_11D839:         db $46, $37, $40, $02, $01, $48, $30, $00
DATA_11D841:         db $7F, $01, $48, $3A, $45, $00, $00, $48
DATA_11D849:         db $3C, $4A, $00, $00, $48, $36, $30, $04
DATA_11D851:         db $00, $00, $36, $32, $51, $48, $37, $0F
DATA_11D859:         db $01, $01, $48, $38, $00, $7F, $01, $48
DATA_11D861:         db $37, $35, $00, $02, $48, $37, $39, $00
DATA_11D869:         db $02, $4E, $34, $6C, $02, $03, $48, $34
DATA_11D871:         db $2A, $06, $00, $48, $34, $5E, $01, $00
DATA_11D879:         db $A8, $34, $5E, $00, $00, $48, $35, $2F
DATA_11D881:         db $06, $00, $48, $36, $40, $00, $01, $48
DATA_11D889:         db $36, $44, $00, $01, $CC, $30, $7F, $FE
DATA_11D891:         db $FD, $48, $34, $3B, $00, $02, $48, $34
DATA_11D899:         db $3F, $00, $02, $C4, $34, $4C, $02, $FF

; level 4D screen exit data
DATA_11D8A1:         db $33, $7B, $08, $18, $00, $38, $7B, $57
DATA_11D8A9:         db $18, $00, $3F, $D5, $9A, $7A, $00, $FF

; level 7B header
DATA_11D8B1:         db $CF, $20, $41, $59, $5A, $80, $79, $80
DATA_11D8B9:         db $19, $20

; level 7B object data
DATA_11D8BB:         db $CB, $10, $35, $06, $06, $CB, $15, $44
DATA_11D8C3:         db $06, $05, $45, $00, $99, $03, $04, $CD
DATA_11D8CB:         db $00, $99, $03, $FB, $CB, $00, $F2, $21
DATA_11D8D3:         db $03, $CB, $03, $FC, $1E, $04, $48, $00
DATA_11D8DB:         db $E0, $5F, $00, $F5, $03, $C6, $1C, $01
DATA_11D8E3:         db $A7, $00, $DC, $1D, $00, $CC, $01, $90
DATA_11D8EB:         db $FD, $FB, $CD, $01, $91, $04, $FA, $CC
DATA_11D8F3:         db $01, $9A, $FC, $FA, $CC, $02, $94, $FC
DATA_11D8FB:         db $FA, $CD, $01, $9B, $04, $FA, $CD, $02
DATA_11D903:         db $95, $04, $FA, $CC, $02, $7C, $FE, $FD
DATA_11D90B:         db $45, $03, $A3, $02, $02, $46, $02, $CA
DATA_11D913:         db $02, $00, $CD, $03, $73, $02, $FD, $CC
DATA_11D91B:         db $03, $AF, $FD, $F9, $46, $05, $B4, $03
DATA_11D923:         db $01, $44, $05, $48, $04, $08, $CC, $05
DATA_11D92B:         db $87, $FD, $FC, $CC, $05, $87, $FD, $FD
DATA_11D933:         db $48, $00, $00, $5F, $03, $CD, $10, $6B
DATA_11D93B:         db $02, $FE, $CC, $15, $64, $FD, $FD, $CB
DATA_11D943:         db $03, $F1, $04, $09, $48, $00, $70, $02
DATA_11D94B:         db $06, $44, $00, $43, $05, $08, $00, $04
DATA_11D953:         db $BA, $12, $00, $04, $B0, $12, $00, $03
DATA_11D95B:         db $B6, $12, $48, $03, $C3, $02, $02, $48
DATA_11D963:         db $02, $CA, $02, $01, $00, $15, $6C, $C4
DATA_11D96B:         db $CC, $10, $65, $FD, $FD, $00, $10, $63
DATA_11D973:         db $C4, $CD, $15, $6A, $03, $FD, $41, $02
DATA_11D97B:         db $BA, $01, $41, $03, $B4, $01, $41, $05
DATA_11D983:         db $B3, $02, $41, $00, $BA, $02, $68, $13
DATA_11D98B:         db $6F, $00, $00, $68, $14, $63, $00, $00
DATA_11D993:         db $68, $14, $67, $00, $00, $68, $14, $6B
DATA_11D99B:         db $00, $00, $68, $11, $68, $00, $00, $68
DATA_11D9A3:         db $11, $6C, $00, $00, $68, $11, $64, $00
DATA_11D9AB:         db $00, $CB, $02, $FA, $04, $09, $48, $05
DATA_11D9B3:         db $C3, $02, $01, $48, $05, $7D, $02, $06
DATA_11D9BB:         db $48, $10, $30, $01, $07, $33, $11, $B4
DATA_11D9C3:         db $02, $04, $33, $11, $BD, $04, $04, $33
DATA_11D9CB:         db $10, $B0, $0D, $04, $33, $12, $A6, $13
DATA_11D9D3:         db $05, $33, $15, $B2, $0D, $04, $48, $15
DATA_11D9DB:         db $3E, $01, $07, $35, $10, $B0, $5F, $04
DATA_11D9E3:         db $48, $12, $A6, $13, $00, $48, $00, $CA
DATA_11D9EB:         db $02, $01, $41, $00, $D2, $08, $41, $10
DATA_11D9F3:         db $A1, $0C, $48, $12, $76, $01, $02, $48
DATA_11D9FB:         db $13, $78, $01, $02, $41, $12, $97, $11
DATA_11DA03:         db $41, $15, $A2, $0C, $41, $05, $D5, $08
DATA_11DA0B:         db $41, $11, $A4, $02, $46, $11, $5D, $01
DATA_11DA13:         db $05, $45, $12, $40, $01, $05, $CB, $11
DATA_11DA1B:         db $5D, $01, $04, $44, $11, $4F, $00, $05
DATA_11DA23:         db $CB, $11, $5F, $02, $04, $44, $11, $5E
DATA_11DA2B:         db $02, $04, $41, $11, $AD, $04, $79, $12
DATA_11DA33:         db $44, $05, $CD, $12, $23, $01, $FD, $CC
DATA_11DA3B:         db $12, $6A, $FB, $F9, $CC, $13, $2C, $FF
DATA_11DA43:         db $FD, $CD, $13, $65, $05, $F9, $79, $13
DATA_11DA4B:         db $4B, $FB, $48, $02, $FB, $09, $00, $41
DATA_11DA53:         db $10, $38, $1B, $41, $13, $3C, $1B, $49
DATA_11DA5B:         db $14, $02, $01, $49, $14, $0A, $01, $49
DATA_11DA63:         db $15, $02, $01, $49, $11, $0C, $01, $49
DATA_11DA6B:         db $11, $04, $01, $49, $10, $0C, $01, $48
DATA_11DA73:         db $05, $F8, $07, $00, $48, $15, $0A, $05
DATA_11DA7B:         db $02, $48, $00, $F0, $07, $00, $48, $10
DATA_11DA83:         db $00, $05, $02, $00, $00, $AE, $9A, $41
DATA_11DA8B:         db $04, $B9, $00, $CB, $02, $7C, $07, $02
DATA_11DA93:         db $44, $02, $4D, $05, $08, $48, $00, $40
DATA_11DA9B:         db $04, $02, $48, $12, $9F, $01, $00, $48
DATA_11DAA3:         db $05, $4B, $04, $02, $48, $04, $C9, $00
DATA_11DAAB:         db $01, $41, $03, $BF, $00, $48, $03, $CF
DATA_11DAB3:         db $00, $01, $48, $12, $0D, $05, $00, $48
DATA_11DABB:         db $12, $1E, $03, $07, $41, $13, $4C, $00
DATA_11DAC3:         db $CC, $04, $A9, $FC, $FA, $CD, $03, $8A
DATA_11DACB:         db $01, $FC, $CC, $03, $89, $FD, $FC, $CD
DATA_11DAD3:         db $04, $A0, $04, $FA, $CD, $04, $AA, $02
DATA_11DADB:         db $FA, $CD, $04, $AA, $03, $FA, $CC, $04
DATA_11DAE3:         db $8F, $FF, $FC, $CD, $05, $80, $03, $FC
DATA_11DAEB:         db $48, $04, $59, $00, $02, $48, $03, $5F
DATA_11DAF3:         db $00, $02, $49, $03, $61, $03, $49, $02
DATA_11DAFB:         db $6D, $03, $D2, $00, $AF, $18, $00, $02
DATA_11DB03:         db $A8, $9B, $41, $02, $CB, $09, $44, $02
DATA_11DB0B:         db $DD, $05, $01, $FF

; level 7B screen exit data
DATA_11DB0F:         db $10, $4D, $3D, $38, $00, $15, $4D, $88
DATA_11DB17:         db $38, $00, $05, $D5, $75, $6B, $00, $00
DATA_11DB1F:         db $A3, $04, $7A, $00, $11, $D5, $53, $7A
DATA_11DB27:         db $00, $12, $D5, $53, $7A, $00, $FF

; level A3 header
DATA_11DB2E:         db $57, $20, $C3, $59, $5E, $80, $79, $83
DATA_11DB36:         db $19, $40

; level A3 object data
DATA_11DB38:         db $00, $00, $11, $FD, $00, $01, $11, $FD
DATA_11DB40:         db $00, $02, $11, $FD, $00, $03, $11, $FD
DATA_11DB48:         db $00, $04, $11, $FD, $00, $05, $11, $FD
DATA_11DB50:         db $44, $60, $A2, $3D, $15, $48, $60, $00
DATA_11DB58:         db $3F, $09, $48, $60, $A0, $2C, $03, $48
DATA_11DB60:         db $60, $E0, $26, $02, $48, $70, $10, $1E
DATA_11DB68:         db $01, $48, $70, $30, $16, $01, $48, $70
DATA_11DB70:         db $50, $0B, $01, $43, $71, $B9, $04, $43
DATA_11DB78:         db $72, $91, $06, $43, $72, $69, $09, $41
DATA_11DB80:         db $71, $B0, $00, $41, $71, $99, $00, $41
DATA_11DB88:         db $72, $61, $00, $41, $72, $71, $00, $41
DATA_11DB90:         db $72, $49, $00, $41, $72, $49, $00, $41
DATA_11DB98:         db $71, $A0, $09, $41, $71, $89, $08, $41
DATA_11DBA0:         db $72, $61, $08, $48, $63, $AE, $01, $08
DATA_11DBA8:         db $43, $73, $30, $0C, $41, $72, $49, $07
DATA_11DBB0:         db $A8, $70, $78, $02, $04, $46, $70, $CA
DATA_11DBB8:         db $01, $00, $CB, $70, $7B, $01, $03, $CB
DATA_11DBC0:         db $70, $71, $06, $04, $CC, $70, $8B, $FC
DATA_11DBC8:         db $FF, $CD, $70, $87, $01, $FF, $45, $70
DATA_11DBD0:         db $B7, $01, $01, $48, $70, $70, $01, $08
DATA_11DBD8:         db $44, $70, $8C, $00, $02, $35, $70, $D0
DATA_11DBE0:         db $3F, $02, $44, $61, $D8, $05, $02, $41
DATA_11DBE8:         db $72, $59, $00, $41, $73, $30, $00, $41
DATA_11DBF0:         db $63, $F8, $06, $41, $73, $06, $07, $41
DATA_11DBF8:         db $73, $14, $0A, $41, $73, $20, $0D, $41
DATA_11DC00:         db $70, $C1, $0F, $48, $73, $31, $0E, $09
DATA_11DC08:         db $FF

; level A3 screen exit data
DATA_11DC09:         db $63, $BF, $12, $62, $04, $FF

; level BF/D0 header
DATA_11DC0F:         db $07, $20, $C3, $3E, $5E, $80, $29, $83
DATA_11DC17:         db $22, $80

; level BF/D0 object data
DATA_11DC19:         db $48, $61, $44, $01, $00, $48, $61, $04
DATA_11DC21:         db $0B, $03, $48, $61, $00, $01, $03, $33
DATA_11DC29:         db $61, $CF, $00, $03, $48, $61, $5F, $00
DATA_11DC31:         db $06, $45, $61, $76, $04, $03, $46, $61
DATA_11DC39:         db $93, $02, $01, $45, $61, $81, $01, $02
DATA_11DC41:         db $41, $61, $A1, $09, $CC, $61, $69, $FE
DATA_11DC49:         db $FE, $CD, $61, $6A, $00, $FE, $CC, $61
DATA_11DC51:         db $9E, $FD, $FB, $48, $61, $4C, $03, $00
DATA_11DC59:         db $48, $61, $5D, $01, $00, $48, $61, $6E
DATA_11DC61:         db $01, $00, $48, $61, $40, $01, $00, $48
DATA_11DC69:         db $61, $B0, $0A, $00, $48, $61, $50, $00
DATA_11DC71:         db $06, $33, $61, $C0, $0A, $03, $35, $61
DATA_11DC79:         db $C0, $0F, $03, $F4, $61, $32, $FD, $FF

; level BF/D0 screen exit data
DATA_11DC81:         db $61, $C9, $07, $70, $08, $FF

; level C9 header
DATA_11DC87:         db $01, $8E, $CB, $42, $D6, $09, $68, $80
DATA_11DC8F:         db $7A, $80

; level C9 object data
DATA_11DC91:         db $00, $60, $00, $10, $FF

; level C9 screen exit data
DATA_11DC96:         db $70, $D0, $16, $68, $00, $FF

; level D5 header
DATA_11DC9C:         db $07, $20, $C3, $39, $A2, $80, $71, $C9
DATA_11DCA4:         db $A1, $60

; level D5 object data
DATA_11DCA6:         db $44, $67, $59, $23, $08, $44, $67, $FD
DATA_11DCAE:         db $05, $03, $44, $77, $3D, $20, $09, $48
DATA_11DCB6:         db $78, $5D, $0E, $00, $CB, $67, $81, $02
DATA_11DCBE:         db $04, $48, $67, $70, $02, $00, $CB, $67
DATA_11DCC6:         db $87, $02, $04, $00, $67, $95, $C4, $48
DATA_11DCCE:         db $78, $5D, $12, $00, $46, $79, $35, $02
DATA_11DCD6:         db $00, $44, $69, $E8, $04, $04, $53, $69
DATA_11DCDE:         db $D9, $02, $53, $77, $8C, $02, $53, $77
DATA_11DCE6:         db $5E, $02, $45, $78, $13, $02, $02, $48
DATA_11DCEE:         db $78, $30, $1F, $01, $48, $78, $50, $08
DATA_11DCF6:         db $00, $48, $78, $60, $07, $00, $48, $78
DATA_11DCFE:         db $70, $06, $00, $48, $67, $F0, $0D, $00
DATA_11DD06:         db $48, $69, $60, $0F, $00, $48, $67, $60
DATA_11DD0E:         db $1B, $00, $48, $69, $7C, $03, $00, $48
DATA_11DD16:         db $69, $8D, $02, $0A, $48, $67, $D0, $29
DATA_11DD1E:         db $00, $48, $67, $E0, $29, $00, $CD, $78
DATA_11DD26:         db $13, $03, $FE, $CC, $79, $17, $FE, $FE
DATA_11DD2E:         db $53, $79, $0B, $02, $48, $69, $71, $07
DATA_11DD36:         db $00, $48, $67, $C8, $21, $00, $48, $67
DATA_11DD3E:         db $C0, $02, $00, $48, $67, $8A, $0F, $00
DATA_11DD46:         db $44, $67, $89, $00, $03, $48, $78, $6E
DATA_11DD4E:         db $09, $00, $48, $77, $C0, $27, $01, $48
DATA_11DD56:         db $67, $00, $2F, $05, $41, $67, $B9, $20
DATA_11DD5E:         db $68, $78, $17, $00, $00, $68, $78, $1B
DATA_11DD66:         db $00, $00, $68, $78, $1F, $00, $00, $68
DATA_11DD6E:         db $79, $13, $00, $00, $48, $67, $78, $12
DATA_11DD76:         db $00, $48, $67, $80, $01, $03, $CC, $67
DATA_11DD7E:         db $87, $FF, $FF, $48, $77, $00, $0C, $0B
DATA_11DD86:         db $48, $77, $E0, $2F, $01, $35, $77, $D0
DATA_11DD8E:         db $2F, $02, $CD, $67, $83, $01, $FF, $48
DATA_11DD96:         db $79, $6D, $02, $06, $44, $79, $7D, $00
DATA_11DD9E:         db $03, $41, $79, $C7, $06, $41, $78, $30
DATA_11DDA6:         db $1D, $41, $67, $D2, $06, $41, $77, $BC
DATA_11DDAE:         db $1B, $41, $79, $BD, $01, $41, $67, $C8
DATA_11DDB6:         db $01, $41, $67, $C1, $01, $44, $75, $31
DATA_11DDBE:         db $0C, $0A, $48, $75, $C0, $0F, $03, $48
DATA_11DDC6:         db $75, $70, $01, $04, $48, $75, $00, $0F
DATA_11DDCE:         db $06, $41, $75, $95, $01, $41, $75, $99
DATA_11DDD6:         db $01, $41, $75, $C2, $0B, $35, $75, $D0
DATA_11DDDE:         db $0F, $02, $48, $75, $7E, $01, $04, $FF

; level D5 screen exit data
DATA_11DDE6:         db $79, $4D, $F7, $38, $00, $67, $7B, $59
DATA_11DDEE:         db $0B, $00, $75, $7B, $1F, $18, $00, $FF

; level D7 header
DATA_11DDF6:         db $09, $08, $41, $02, $12, $02, $10, $20
DATA_11DDFE:         db $0D, $C0

; level D7 object data
DATA_11DE00:         db $16, $70, $00, $2F, $0F, $19, $70, $80
DATA_11DE08:         db $2F, $07, $6C, $71, $88, $00, $00, $18
DATA_11DE10:         db $60, $E0, $03, $11, $18, $60, $E7, $02
DATA_11DE18:         db $06, $18, $60, $EA, $05, $04, $18, $61
DATA_11DE20:         db $F0, $0A, $02, $18, $61, $EB, $05, $03
DATA_11DE28:         db $18, $62, $E1, $07, $02, $18, $62, $EE
DATA_11DE30:         db $01, $11, $18, $62, $AE, $01, $03, $18
DATA_11DE38:         db $61, $C0, $05, $02, $18, $61, $80, $05
DATA_11DE40:         db $03, $18, $61, $86, $04, $06, $18, $61
DATA_11DE48:         db $BB, $07, $02, $18, $61, $8B, $07, $02
DATA_11DE50:         db $18, $62, $B3, $05, $02, $18, $62, $83
DATA_11DE58:         db $07, $02, $18, $62, $8B, $04, $01, $18
DATA_11DE60:         db $60, $07, $28, $07, $1A, $62, $E9, $02
DATA_11DE68:         db $00, $60, $DE, $FF, $00, $61, $D3, $FE
DATA_11DE70:         db $FF

; level D7 screen exit data
DATA_11DE71:         db $70, $15, $19, $3E, $09, $FF

; level 15 sprite data
DATA_11DE77:         db $BF, $63, $24, $BF, $63, $25, $99, $6F
DATA_11DE7F:         db $5E, $99, $6F, $55, $BB, $66, $3D, $F4
DATA_11DE87:         db $76, $0A, $FB, $72, $24, $FC, $72, $28
DATA_11DE8F:         db $FC, $72, $2C, $3F, $7B, $27, $40, $7B
DATA_11DE97:         db $3D, $1E, $74, $17, $A5, $6D, $43, $A8
DATA_11DE9F:         db $77, $5F, $93, $76, $61, $C8, $65, $3C
DATA_11DEA7:         db $C2, $76, $44, $C2, $65, $3D, $D6, $6D
DATA_11DEAF:         db $66, $B5, $64, $52, $FF, $FF

; level 4D sprite data
DATA_11DEB5:         db $3F, $77, $1B, $40, $77, $34, $43, $77
DATA_11DEBD:         db $57, $43, $77, $6D, $05, $67, $9B, $05
DATA_11DEC5:         db $67, $A3, $01, $67, $62, $01, $75, $4D
DATA_11DECD:         db $93, $72, $3D, $01, $75, $77, $93, $72
DATA_11DED5:         db $88, $06, $67, $A7, $06, $67, $AF, $05
DATA_11DEDD:         db $67, $C8, $05, $67, $C0, $06, $67, $CC
DATA_11DEE5:         db $06, $67, $D4, $93, $72, $F7, $41, $77
DATA_11DEED:         db $2B, $10, $6B, $62, $01, $72, $05, $4F
DATA_11DEF5:         db $6E, $ED, $65, $6A, $23, $65, $6A, $2B
DATA_11DEFD:         db $56, $74, $91, $25, $6A, $B4, $25, $6A
DATA_11DF05:         db $BB, $65, $6A, $CD, $65, $6A, $D2, $65
DATA_11DF0D:         db $6A, $A2, $65, $6A, $9D, $AF, $6B, $9C
DATA_11DF15:         db $AF, $6B, $A1, $AF, $6B, $CE, $AF, $6B
DATA_11DF1D:         db $D3, $AF, $67, $77, $65, $66, $78, $65
DATA_11DF25:         db $66, $76, $B8, $66, $B3, $C1, $66, $BB
DATA_11DF2D:         db $65, $68, $4D, $FF, $FF

; level 7B sprite data
DATA_11DF32:         db $3F, $37, $11, $C1, $22, $2B, $21, $28
DATA_11DF3A:         db $51, $93, $18, $06, $93, $18, $59, $93
DATA_11DF42:         db $32, $57, $F0, $07, $44, $F1, $07, $59
DATA_11DF4A:         db $A7, $25, $2D, $A7, $25, $32, $A6, $25
DATA_11DF52:         db $49, $C1, $0C, $2F, $56, $14, $27, $BB
DATA_11DF5A:         db $0E, $4A, $BB, $0E, $40, $BB, $0E, $36
DATA_11DF62:         db $93, $32, $08, $40, $37, $4B, $40, $37
DATA_11DF6A:         db $43, $FA, $12, $19, $FA, $18, $3E, $BE
DATA_11DF72:         db $22, $34, $65, $2C, $16, $65, $2C, $1A
DATA_11DF7A:         db $65, $2C, $1E, $65, $2C, $41, $65, $2C
DATA_11DF82:         db $45, $65, $2C, $49, $F1, $07, $20, $40
DATA_11DF8A:         db $37, $1A, $32, $09, $24, $32, $09, $1A
DATA_11DF92:         db $32, $09, $10, $32, $09, $13, $BE, $1A
DATA_11DF9A:         db $28, $93, $32, $1F, $A8, $25, $11, $FF
DATA_11DFA2:         db $FF

; level A3 sprite data
DATA_11DFA3:         db $99, $D9, $35, $4F, $F2, $09, $01, $F6
DATA_11DFAB:         db $04, $17, $E8, $23, $17, $F2, $18, $17
DATA_11DFB3:         db $DE, $1C, $12, $DC, $3B, $FF, $FF

; level BF sprite data
DATA_11DFBA:         db $45, $D8, $1D, $FF, $FF

; level C9 sprite data
DATA_11DFBF:         db $45, $EE, $08, $FF, $FF

; level D0 sprite data
DATA_11DFC4:         db $45, $D6, $1D, $FF, $FF

; level D5 sprite data
DATA_11DFC9:         db $70, $D4, $79, $93, $D8, $75, $93, $F6
DATA_11DFD1:         db $9A, $98, $EF, $88, $98, $ED, $8C, $70
DATA_11DFD9:         db $F4, $83, $65, $E0, $89, $65, $E0, $8D
DATA_11DFE1:         db $65, $E0, $91, $70, $F0, $55, $61, $F3
DATA_11DFE9:         db $5C, $93, $F6, $53, $70, $F0, $59, $FF
DATA_11DFF1:         db $FF

; level D7 sprite data
DATA_11DFF2:         db $02, $F1, $18, $B4, $D8, $2D, $01, $DA
DATA_11DFFA:         db $2A, $65, $E8, $17, $AF, $F9, $19, $AF
DATA_11E002:         db $EF, $1B, $AF, $F3, $15, $98, $E8, $05
DATA_11E00A:         db $AF, $ED, $14, $AF, $E9, $1A, $65, $F4
DATA_11E012:         db $1C, $AF, $F9, $16, $D0, $D6, $0F, $84
DATA_11E01A:         db $DE, $05, $FF, $FF

; level 21 header
DATA_11E01E:         db $E0, $CC, $92, $9B, $1F, $D8, $00, $00
DATA_11E026:         db $05, $00

; level 21 object data
DATA_11E028:         db $01, $60, $C0, $0F, $03, $05, $61, $C0
DATA_11E030:         db $03, $03, $07, $61, $A4, $03, $05, $03
DATA_11E038:         db $61, $68, $09, $00, $50, $FF, $FD, $00
DATA_11E040:         db $51, $F0, $FD, $00, $52, $FF, $FD, $00
DATA_11E048:         db $53, $F0, $FD, $05, $61, $8F, $01, $07
DATA_11E050:         db $07, $62, $71, $01, $08, $02, $61, $8E
DATA_11E058:         db $07, $03, $62, $53, $0A, $04, $62, $7A
DATA_11E060:         db $01, $08, $06, $62, $8C, $01, $07, $02
DATA_11E068:         db $62, $79, $08, $03, $62, $AE, $05, $6E
DATA_11E070:         db $63, $E6, $00, $00, $0D, $62, $83, $02
DATA_11E078:         db $0D, $62, $87, $02, $01, $63, $3F, $00
DATA_11E080:         db $0C, $02, $63, $3E, $0C, $06, $64, $30
DATA_11E088:         db $01, $0C, $04, $64, $52, $01, $0A, $01
DATA_11E090:         db $64, $64, $06, $09, $00, $53, $FF, $FD
DATA_11E098:         db $00, $54, $F0, $FD, $01, $44, $C4, $12
DATA_11E0A0:         db $0E, $58, $54, $B3, $14, $00, $01, $64
DATA_11E0A8:         db $6B, $00, $09, $00, $65, $00, $FD, $14
DATA_11E0B0:         db $54, $06, $11, $0B, $85, $54, $06, $01
DATA_11E0B8:         db $06, $60, $54, $08, $02, $02, $01, $54
DATA_11E0C0:         db $CC, $00, $13, $03, $54, $CD, $13, $14
DATA_11E0C8:         db $54, $FC, $01, $04, $5A, $64, $4C, $00
DATA_11E0D0:         db $00, $60, $54, $FC, $00, $00, $01, $44
DATA_11E0D8:         db $44, $00, $0A, $03, $44, $45, $08, $01
DATA_11E0E0:         db $45, $14, $05, $1A, $14, $45, $B6, $03
DATA_11E0E8:         db $05, $14, $45, $E1, $08, $06, $14, $45
DATA_11E0F0:         db $96, $03, $02, $62, $45, $97, $01, $03
DATA_11E0F8:         db $86, $45, $99, $00, $05, $00, $46, $F0
DATA_11E100:         db $FD, $00, $56, $00, $FD, $14, $45, $78
DATA_11E108:         db $01, $02, $5A, $45, $A8, $00, $00, $14
DATA_11E110:         db $45, $76, $02, $01, $59, $45, $96, $01
DATA_11E118:         db $00, $02, $45, $13, $0B, $14, $45, $93
DATA_11E120:         db $03, $02, $01, $45, $CA, $01, $0F, $14
DATA_11E128:         db $45, $54, $05, $02, $61, $45, $57, $01
DATA_11E130:         db $00, $5A, $45, $84, $00, $00, $60, $45
DATA_11E138:         db $54, $00, $00, $61, $45, $95, $01, $00
DATA_11E140:         db $5F, $54, $0A, $01, $00, $5E, $55, $19
DATA_11E148:         db $00, $03, $5D, $55, $28, $00, $03, $60
DATA_11E150:         db $45, $E5, $00, $01, $14, $44, $C6, $02
DATA_11E158:         db $04, $5E, $54, $17, $01, $00, $01, $44
DATA_11E160:         db $43, $00, $0B, $02, $44, $41, $0B, $67
DATA_11E168:         db $54, $03, $00, $0A, $01, $44, $42, $00
DATA_11E170:         db $0B, $58, $44, $F1, $02, $0B, $14, $54
DATA_11E178:         db $03, $03, $02, $5D, $54, $26, $00, $00
DATA_11E180:         db $5C, $54, $34, $01, $00, $00, $54, $32
DATA_11E188:         db $9C, $C5, $54, $41, $07, $CE, $54, $E2
DATA_11E190:         db $01, $CE, $54, $D7, $FE, $D2, $64, $04
DATA_11E198:         db $00, $02, $54, $CB, $0A, $14, $64, $0B
DATA_11E1A0:         db $01, $02, $14, $55, $63, $04, $05, $5C
DATA_11E1A8:         db $55, $44, $03, $00, $67, $55, $64, $03
DATA_11E1B0:         db $00, $5C, $55, $52, $01, $00, $61, $55
DATA_11E1B8:         db $62, $01, $00, $67, $55, $65, $00, $02
DATA_11E1C0:         db $86, $55, $74, $00, $02, $14, $55, $67
DATA_11E1C8:         db $04, $01, $5F, $55, $67, $01, $00, $6D
DATA_11E1D0:         db $65, $52, $0A, $5F, $45, $E1, $03, $03
DATA_11E1D8:         db $61, $54, $0D, $03, $01, $03, $45, $CC
DATA_11E1E0:         db $0E, $14, $55, $76, $06, $02, $67, $55
DATA_11E1E8:         db $99, $00, $00, $5D, $55, $A8, $00, $00
DATA_11E1F0:         db $5A, $55, $AA, $00, $00, $85, $55, $76
DATA_11E1F8:         db $00, $01, $62, $55, $6B, $00, $00, $03
DATA_11E200:         db $45, $1A, $0B, $14, $45, $79, $01, $03
DATA_11E208:         db $62, $45, $59, $00, $02, $5A, $45, $B9
DATA_11E210:         db $00, $00, $00, $56, $C1, $9D, $01, $46
DATA_11E218:         db $C5, $08, $23, $01, $26, $1E, $00, $4E
DATA_11E220:         db $02, $26, $1D, $2B, $00, $46, $A5, $50
DATA_11E228:         db $00, $44, $AD, $A8, $D1, $56, $31, $08
DATA_11E230:         db $14, $44, $E4, $02, $02, $60, $44, $E4
DATA_11E238:         db $01, $01, $58, $55, $B3, $09, $00, $0D
DATA_11E240:         db $55, $AC, $02, $01, $36, $0F, $1F, $2F
DATA_11E248:         db $03, $26, $1F, $0F, $14, $37, $00, $09
DATA_11E250:         db $0E, $14, $37, $85, $0B, $0E, $14, $46
DATA_11E258:         db $9D, $04, $02, $14, $47, $58, $0C, $0B
DATA_11E260:         db $14, $47, $91, $07, $07, $59, $47, $D1
DATA_11E268:         db $01, $03, $5A, $47, $E3, $01, $02, $59
DATA_11E270:         db $57, $05, $03, $00, $85, $47, $9B, $00
DATA_11E278:         db $01, $60, $47, $9A, $00, $02, $5F, $47
DATA_11E280:         db $98, $01, $03, $67, $47, $97, $00, $03
DATA_11E288:         db $61, $47, $95, $01, $03, $62, $47, $93
DATA_11E290:         db $01, $03, $61, $47, $91, $01, $00, $67
DATA_11E298:         db $47, $77, $04, $01, $5B, $47, $5B, $00
DATA_11E2A0:         db $02, $5A, $47, $4A, $00, $01, $59, $47
DATA_11E2A8:         db $38, $01, $02, $5C, $58, $10, $01, $00
DATA_11E2B0:         db $5E, $48, $E4, $00, $02, $5D, $58, $02
DATA_11E2B8:         db $01, $00, $14, $37, $39, $04, $05, $57
DATA_11E2C0:         db $47, $7C, $02, $57, $48, $A2, $02, $14
DATA_11E2C8:         db $37, $CF, $05, $0B, $14, $37, $E0, $05
DATA_11E2D0:         db $04, $67, $47, $35, $02, $03, $57, $48
DATA_11E2D8:         db $40, $02, $01, $38, $0F, $00, $2F, $67
DATA_11E2E0:         db $37, $9A, $03, $02, $62, $37, $A7, $00
DATA_11E2E8:         db $00, $86, $37, $86, $00, $02, $67, $37
DATA_11E2F0:         db $76, $07, $00, $67, $37, $87, $06, $01
DATA_11E2F8:         db $61, $37, $A8, $01, $01, $5E, $37, $76
DATA_11E300:         db $00, $00, $5C, $37, $57, $01, $01, $5D
DATA_11E308:         db $37, $49, $00, $02, $67, $37, $3A, $03
DATA_11E310:         db $03, $5A, $47, $30, $00, $00, $57, $37
DATA_11E318:         db $D0, $02, $57, $37, $73, $02, $57, $37
DATA_11E320:         db $A2, $02, $57, $47, $1B, $02, $67, $47
DATA_11E328:         db $68, $02, $00, $67, $47, $27, $00, $01
DATA_11E330:         db $57, $37, $F5, $02, $62, $38, $C2, $01
DATA_11E338:         db $03, $86, $38, $C4, $00, $05, $61, $38
DATA_11E340:         db $80, $01, $04, $67, $37, $8E, $01, $03
DATA_11E348:         db $57, $37, $20, $02, $57, $37, $17, $02
DATA_11E350:         db $00, $63, $D6, $9D, $D1, $63, $A6, $02
DATA_11E358:         db $14, $64, $65, $04, $04, $5A, $64, $A5
DATA_11E360:         db $01, $00, $5D, $64, $B8, $01, $00, $5B
DATA_11E368:         db $64, $95, $00, $00, $5E, $64, $A9, $00
DATA_11E370:         db $01, $05, $66, $51, $01, $0A, $01, $65
DATA_11E378:         db $59, $07, $0A, $02, $65, $58, $0A, $07
DATA_11E380:         db $66, $43, $00, $0B, $01, $66, $34, $00
DATA_11E388:         db $0C, $02, $46, $C4, $17, $14, $45, $B4
DATA_11E390:         db $02, $02, $5A, $45, $D4, $01, $00, $01
DATA_11E398:         db $29, $C6, $0D, $03, $04, $29, $AC, $03
DATA_11E3A0:         db $05, $07, $28, $C3, $05, $06, $05, $37
DATA_11E3A8:         db $0B, $07, $03, $06, $29, $68, $03, $09
DATA_11E3B0:         db $05, $28, $69, $03, $0B, $04, $29, $44
DATA_11E3B8:         db $03, $0B, $00, $18, $FF, $FD, $00, $19
DATA_11E3C0:         db $F0, $FD, $01, $28, $4D, $06, $0B, $67
DATA_11E3C8:         db $28, $FC, $03, $03, $05, $2A, $C4, $01
DATA_11E3D0:         db $03, $07, $2A, $B6, $03, $04, $01, $2B
DATA_11E3D8:         db $5C, $00, $0A, $06, $2B, $5D, $05, $0A
DATA_11E3E0:         db $04, $2C, $B3, $01, $04, $01, $2C, $C5
DATA_11E3E8:         db $0A, $03, $67, $1D, $AE, $00, $07, $01
DATA_11E3F0:         db $2D, $10, $0F, $0E, $02, $2C, $1F, $0B
DATA_11E3F8:         db $14, $2C, $8F, $0E, $03, $5D, $2D, $CD
DATA_11E400:         db $00, $00, $62, $2D, $8D, $00, $00, $00
DATA_11E408:         db $1A, $F0, $FD, $00, $1B, $F0, $FD, $00
DATA_11E410:         db $1C, $F0, $FD, $00, $1D, $F0, $FD, $00
DATA_11E418:         db $2C, $A8, $50, $00, $2C, $AB, $50, $5D
DATA_11E420:         db $2D, $C5, $00, $00, $67, $2D, $B6, $00
DATA_11E428:         db $00, $5A, $2D, $C7, $00, $00, $14, $2D
DATA_11E430:         db $65, $02, $02, $14, $2D, $73, $06, $01
DATA_11E438:         db $61, $2D, $78, $01, $00, $5F, $2D, $73
DATA_11E440:         db $01, $00, $01, $2A, $7A, $00, $08, $00
DATA_11E448:         db $29, $21, $50, $C4, $44, $A7, $00, $C4
DATA_11E450:         db $45, $A1, $00, $06, $2A, $7B, $04, $08
DATA_11E458:         db $04, $2B, $C0, $01, $03, $05, $2B, $D3
DATA_11E460:         db $01, $02, $07, $2B, $C5, $06, $03, $01
DATA_11E468:         db $2B, $D2, $00, $02, $7C, $54, $A9, $01
DATA_11E470:         db $7C, $54, $AF, $FF, $7F, $54, $59, $06
DATA_11E478:         db $06, $7C, $54, $59, $03, $7C, $54, $5F
DATA_11E480:         db $FD, $D1, $54, $42, $09, $C4, $44, $7C
DATA_11E488:         db $02, $C4, $45, $80, $00, $00, $28, $2E
DATA_11E490:         db $50, $4E, $27, $50, $03, $00, $02, $06
DATA_11E498:         db $ED, $12, $01, $06, $EE, $00, $12, $03
DATA_11E4A0:         db $06, $EF, $12, $02, $07, $E3, $12, $01
DATA_11E4A8:         db $07, $E4, $00, $12, $03, $07, $E5, $12
DATA_11E4B0:         db $58, $27, $03, $02, $00, $4E, $27, $13
DATA_11E4B8:         db $00, $04, $0D, $16, $FF, $04, $00, $06
DATA_11E4C0:         db $FF, $FF, $00, $07, $F0, $FF, $00, $60
DATA_11E4C8:         db $AA, $50, $C4, $19, $66, $15, $C6, $1A
DATA_11E4D0:         db $7C, $07, $01, $0D, $EF, $00, $16, $14
DATA_11E4D8:         db $2D, $15, $02, $05, $00, $1D, $DC, $C4
DATA_11E4E0:         db $C4, $1B, $E4, $1B, $0A, $0D, $F4, $0A
DATA_11E4E8:         db $01, $0D, $E5, $09, $0B, $58, $1D, $A4
DATA_11E4F0:         db $0A, $05, $6C, $17, $06, $5D, $00, $00
DATA_11E4F8:         db $0D, $EC, $FF, $68, $27, $D1, $00, $02
DATA_11E500:         db $6C, $17, $00, $02, $00, $FF

; level 21 screen exit data
DATA_11E506:         db $2D, $58, $03, $34, $00, $17, $85, $08
DATA_11E50E:         db $3E, $09, $FF

; level 58 header
DATA_11E511:         db $E0, $CC, $92, $94, $0F, $E8, $28, $00
DATA_11E519:         db $1D, $20

; level 58 object data
DATA_11E51B:         db $01, $30, $5C, $00, $0F, $05, $30, $5D
DATA_11E523:         db $01, $0F, $01, $30, $4F, $00, $10, $00
DATA_11E52B:         db $41, $4F, $9A, $03, $20, $D6, $18, $03
DATA_11E533:         db $31, $40, $10, $02, $30, $5B, $0F, $02
DATA_11E53B:         db $31, $55, $10, $03, $31, $5B, $10, $01
DATA_11E543:         db $31, $56, $04, $10, $01, $20, $D0, $05
DATA_11E54B:         db $18, $00, $31, $C3, $9C, $02, $20, $DB
DATA_11E553:         db $03, $6E, $20, $D7, $03, $00, $00, $41
DATA_11E55B:         db $53, $9D, $14, $30, $20, $06, $03, $00
DATA_11E563:         db $30, $59, $9C, $00, $30, $C9, $9D, $D1
DATA_11E56B:         db $30, $69, $05, $14, $30, $7B, $05, $04
DATA_11E573:         db $14, $30, $EB, $05, $04, $0D, $40, $3A
DATA_11E57B:         db $01, $58, $40, $50, $06, $00, $58, $40
DATA_11E583:         db $5B, $05, $00, $00, $31, $37, $47, $14
DATA_11E58B:         db $31, $85, $06, $03, $14, $31, $E5, $06
DATA_11E593:         db $04, $6E, $31, $46, $04, $00, $D1, $31
DATA_11E59B:         db $D3, $07, $58, $41, $55, $06, $00, $0D
DATA_11E5A3:         db $41, $30, $01, $0D, $41, $34, $01, $0D
DATA_11E5AB:         db $41, $3B, $01, $00, $43, $A9, $9A, $00
DATA_11E5B3:         db $44, $A5, $9A, $00, $36, $F0, $FD, $00
DATA_11E5BB:         db $36, $FA, $FD, $00, $47, $00, $FD, $CE
DATA_11E5C3:         db $46, $66, $FD, $00, $32, $F0, $FD, $00
DATA_11E5CB:         db $33, $F0, $FD, $00, $35, $F0, $FD, $D2
DATA_11E5D3:         db $42, $40, $0C, $D2, $44, $A6, $1C, $01
DATA_11E5DB:         db $33, $AA, $03, $08, $02, $33, $A9, $08
DATA_11E5E3:         db $03, $33, $AE, $08, $58, $43, $39, $05
DATA_11E5EB:         db $00, $02, $34, $A4, $0A, $01, $34, $A5
DATA_11E5F3:         db $04, $0A, $14, $33, $DB, $03, $04, $00
DATA_11E5FB:         db $43, $5F, $9A, $00, $44, $53, $9B, $D2
DATA_11E603:         db $44, $50, $02, $CE, $42, $4D, $03, $0D
DATA_11E60B:         db $43, $2E, $01, $0D, $44, $23, $01, $14
DATA_11E613:         db $34, $D4, $03, $04, $D2, $47, $6D, $0A
DATA_11E61B:         db $00, $47, $6C, $9A, $D2, $5B, $55, $01
DATA_11E623:         db $00, $5B, $54, $9A, $00, $4A, $32, $FD
DATA_11E62B:         db $00, $5A, $23, $FD, $00, $59, $35, $FD
DATA_11E633:         db $00, $58, $46, $FD, $00, $4C, $F0, $FD
DATA_11E63B:         db $00, $4D, $11, $FD, $00, $4C, $AF, $92
DATA_11E643:         db $00, $4D, $A4, $93, $00, $4C, $CF, $94
DATA_11E64B:         db $00, $4D, $C4, $95, $6B, $4D, $C8, $27
DATA_11E653:         db $03, $00, $4D, $AC, $50, $00, $4E, $BB
DATA_11E65B:         db $82, $CE, $49, $D2, $FF, $00, $4B, $D7
DATA_11E663:         db $99, $CE, $4C, $B0, $FF, $00, $48, $68
DATA_11E66B:         db $97, $00, $49, $E0, $90, $00, $49, $E1
DATA_11E673:         db $91, $68, $47, $4B, $00, $00, $68, $5B
DATA_11E67B:         db $33, $00, $00, $D2, $4D, $A1, $02, $D2
DATA_11E683:         db $4D, $E1, $02, $68, $47, $5A, $00, $01
DATA_11E68B:         db $68, $5B, $42, $00, $01, $01, $34, $A8
DATA_11E693:         db $01, $0D, $58, $44, $44, $04, $03, $03
DATA_11E69B:         db $34, $AA, $0D, $58, $44, $78, $02, $00
DATA_11E6A3:         db $14, $44, $16, $01, $03, $14, $30, $70
DATA_11E6AB:         db $06, $04, $0D, $31, $60, $05, $CE, $43
DATA_11E6B3:         db $8C, $FF, $D2, $43, $8D, $05, $D2, $43
DATA_11E6BB:         db $AA, $00, $D2, $43, $81, $02, $03, $21
DATA_11E6C3:         db $D0, $03, $01, $20, $DC, $03, $03, $58
DATA_11E6CB:         db $30, $0B, $05, $00, $68, $33, $FF, $04
DATA_11E6D3:         db $00, $0D, $40, $46, $02, $14, $30, $D1
DATA_11E6DB:         db $02, $08, $14, $30, $D3, $03, $03, $57
DATA_11E6E3:         db $40, $41, $02, $14, $40, $03, $02, $02
DATA_11E6EB:         db $60, $30, $D1, $00, $00, $FF

; level 58 screen exit data
DATA_11E6F1:         db $31, $E2, $18, $32, $58, $FF

; level 85 header
DATA_11E6F7:         db $E0, $CC, $92, $84, $23, $08, $28, $00
DATA_11E6FF:         db $05, $C0

; level 85 object data
DATA_11E701:         db $02, $20, $D4, $12, $01, $20, $D5, $00
DATA_11E709:         db $12, $03, $20, $D6, $12, $02, $20, $DA
DATA_11E711:         db $12, $01, $20, $DB, $00, $12, $03, $20
DATA_11E719:         db $DC, $12, $0D, $30, $86, $04, $0D, $30
DATA_11E721:         db $B6, $04, $0D, $30, $56, $04, $0D, $30
DATA_11E729:         db $26, $04, $0D, $20, $F6, $04, $0D, $20
DATA_11E731:         db $FC, $05, $15, $30, $CD, $52, $15, $36
DATA_11E739:         db $C0, $4F, $68, $21, $84, $3B, $00, $68
DATA_11E741:         db $25, $90, $4F, $00, $68, $2A, $A0, $0F
DATA_11E749:         db $00, $68, $2B, $B0, $0F, $00, $0D, $20
DATA_11E751:         db $F0, $04, $68, $2C, $B0, $09, $00, $15
DATA_11E759:         db $3C, $CB, $04, $15, $3B, $C0, $18, $FF

; level 85 screen exit data
DATA_11E761:         db $3C, $21, $90, $10, $00, $FF

; level 21 sprite data
DATA_11E767:         db $02, $DD, $36, $6F, $D3, $26, $6F, $D7
DATA_11E76F:         db $26, $FA, $D6, $26, $6F, $CD, $3C, $6F
DATA_11E777:         db $C9, $3C, $6C, $D4, $47, $44, $C3, $4B
DATA_11E77F:         db $FA, $56, $B2, $8D, $A9, $42, $66, $B6
DATA_11E787:         db $4C, $7F, $C8, $52, $8D, $B7, $61, $F6
DATA_11E78F:         db $A0, $7D, $6C, $93, $83, $6C, $8D, $7D
DATA_11E797:         db $6C, $87, $81, $6C, $81, $7C, $6C, $79
DATA_11E79F:         db $71, $6C, $73, $73, $F6, $84, $74, $6C
DATA_11E7A7:         db $6D, $74, $8D, $D9, $36, $AF, $B5, $56
DATA_11E7AF:         db $AF, $B7, $56, $AF, $B1, $57, $AF, $AF
DATA_11E7B7:         db $58, $E6, $5A, $79, $93, $56, $DB, $E6
DATA_11E7BF:         db $56, $89, $E6, $56, $83, $6B, $CF, $14
DATA_11E7C7:         db $6B, $D7, $0E, $C1, $7E, $72, $65, $90
DATA_11E7CF:         db $48, $65, $8E, $4A, $65, $52, $9D, $65
DATA_11E7D7:         db $54, $9F, $65, $52, $A5, $65, $54, $A1
DATA_11E7DF:         db $65, $54, $A3, $C1, $8C, $55, $8D, $42
DATA_11E7E7:         db $A2, $6C, $48, $71, $6C, $3C, $71, $84
DATA_11E7EF:         db $22, $70, $84, $22, $72, $B1, $2C, $93
DATA_11E7F7:         db $98, $40, $D2, $3C, $4D, $D6, $C1, $4A
DATA_11E7FF:         db $D6, $FF, $FF

; level 58 sprite data
DATA_11E802:         db $55, $88, $20, $01, $6A, $03, $7A, $76
DATA_11E80A:         db $19, $44, $65, $0F, $10, $69, $12, $85
DATA_11E812:         db $75, $09, $97, $81, $19, $03, $86, $02
DATA_11E81A:         db $85, $7F, $13, $8E, $93, $46, $87, $89
DATA_11E822:         db $40, $8E, $93, $3A, $8E, $8B, $7D, $8E
DATA_11E82A:         db $A9, $B5, $0D, $96, $E4, $C9, $8B, $76
DATA_11E832:         db $C9, $8B, $77, $10, $7F, $3C, $10, $8B
DATA_11E83A:         db $D2, $4F, $72, $02, $C1, $7E, $04, $97
DATA_11E842:         db $87, $47, $4E, $64, $18, $65, $7C, $24
DATA_11E84A:         db $65, $7C, $27, $65, $7C, $2A, $65, $7C
DATA_11E852:         db $2D, $65, $82, $30, $65, $92, $32, $65
DATA_11E85A:         db $8E, $2C, $65, $92, $2F, $65, $8A, $67
DATA_11E862:         db $65, $88, $68, $65, $86, $69, $65, $8A
DATA_11E86A:         db $D1, $65, $8A, $D3, $BB, $97, $5A, $BB
DATA_11E872:         db $97, $5B, $FF, $FF

; level 85 sprite data
DATA_11E876:         db $73, $5C, $10, $25, $62, $09, $25, $68
DATA_11E87E:         db $09, $8D, $46, $38, $84, $7E, $C8, $84
DATA_11E886:         db $7E, $CA, $97, $77, $C9, $97, $77, $CB
DATA_11E88E:         db $97, $75, $BF, $97, $75, $AF, $97, $75
DATA_11E896:         db $9F, $97, $75, $8F, $97, $75, $7F, $97
DATA_11E89E:         db $75, $6F, $97, $75, $5F, $97, $75, $4F
DATA_11E8A6:         db $97, $75, $3F, $97, $75, $2F, $97, $75
DATA_11E8AE:         db $1F, $FF, $FF

; level 2D header
DATA_11E8B1:         db $D8, $84, $2B, $C6, $E1, $D0, $58, $4D
DATA_11E8B9:         db $02, $00

; level 2D object data
DATA_11E8BB:         db $01, $70, $C0, $16, $03, $02, $71, $86
DATA_11E8C3:         db $04, $00, $70, $AB, $50, $01, $71, $87
DATA_11E8CB:         db $05, $07, $06, $71, $8D, $02, $07, $01
DATA_11E8D3:         db $73, $83, $05, $07, $04, $72, $B0, $03
DATA_11E8DB:         db $04, $01, $72, $D4, $07, $02, $05, $72
DATA_11E8E3:         db $DC, $03, $02, $07, $73, $B0, $02, $04
DATA_11E8EB:         db $01, $73, $C9, $00, $03, $03, $73, $89
DATA_11E8F3:         db $04, $01, $75, $C4, $00, $03, $05, $75
DATA_11E8FB:         db $95, $01, $06, $02, $75, $94, $02, $03
DATA_11E903:         db $75, $9A, $03, $63, $73, $DF, $0F, $01
DATA_11E90B:         db $77, $C5, $00, $03, $02, $77, $95, $03
DATA_11E913:         db $05, $77, $96, $01, $06, $03, $77, $9B
DATA_11E91B:         db $03, $63, $76, $D1, $0D, $68, $72, $74
DATA_11E923:         db $01, $00, $68, $72, $7A, $01, $00, $68
DATA_11E92B:         db $72, $8C, $01, $00, $68, $72, $82, $01
DATA_11E933:         db $00, $00, $77, $48, $C4, $05, $73, $CA
DATA_11E93B:         db $03, $03, $04, $75, $A0, $03, $05, $01
DATA_11E943:         db $75, $CA, $00, $03, $05, $75, $CB, $01
DATA_11E94B:         db $03, $04, $77, $B3, $01, $04, $02, $74
DATA_11E953:         db $AF, $05, $03, $73, $AE, $05, $07, $75
DATA_11E95B:         db $BD, $00, $04, $05, $75, $AE, $01, $05
DATA_11E963:         db $03, $76, $90, $06, $06, $77, $A2, $00
DATA_11E96B:         db $05, $04, $77, $90, $01, $06, $02, $76
DATA_11E973:         db $9F, $06, $01, $75, $87, $00, $07, $04
DATA_11E97B:         db $75, $88, $01, $07, $6E, $78, $9D, $00
DATA_11E983:         db $01, $6E, $79, $99, $00, $01, $01, $77
DATA_11E98B:         db $88, $00, $07, $04, $77, $89, $01, $07
DATA_11E993:         db $01, $7E, $C8, $07, $03, $00, $7E, $AB
DATA_11E99B:         db $50, $C4, $76, $63, $02, $C4, $76, $6A
DATA_11E9A3:         db $02, $79, $71, $95, $FE, $68, $72, $67
DATA_11E9AB:         db $01, $00, $00, $70, $A3, $1B, $00, $73
DATA_11E9B3:         db $66, $1B, $00, $72, $B7, $1B, $00, $78
DATA_11E9BB:         db $9E, $12, $00, $78, $90, $12, $00, $79
DATA_11E9C3:         db $9A, $12, $01, $77, $BB, $05, $04, $6C
DATA_11E9CB:         db $77, $9F, $00, $01, $03, $78, $B1, $04
DATA_11E9D3:         db $02, $7A, $B4, $04, $01, $7A, $B5, $05
DATA_11E9DB:         db $04, $02, $7A, $8A, $03, $6C, $7A, $96
DATA_11E9E3:         db $00, $01, $01, $7C, $A6, $04, $05, $01
DATA_11E9EB:         db $7A, $8B, $01, $07, $02, $7C, $8A, $02
DATA_11E9F3:         db $01, $7C, $8B, $04, $07, $02, $7C, $6F
DATA_11E9FB:         db $02, $04, $7A, $8D, $01, $07, $03, $7A
DATA_11EA03:         db $9F, $06, $02, $7C, $A5, $05, $03, $7D
DATA_11EA0B:         db $8A, $07, $02, $7E, $A7, $05, $6C, $7B
DATA_11EA13:         db $C2, $00, $01, $63, $7B, $D3, $0E, $6C
DATA_11EA1B:         db $7C, $C2, $00, $01, $00, $7E, $A1, $13
DATA_11EA23:         db $01, $7D, $60, $03, $09, $06, $7D, $64
DATA_11EA2B:         db $01, $09, $00, $70, $AF, $1B, $6C, $7E
DATA_11EA33:         db $A6, $00, $05, $F5, $7E, $B5, $00, $04
DATA_11EA3B:         db $F5, $7D, $CD, $07, $03, $01, $7D, $86
DATA_11EA43:         db $03, $07, $00, $7D, $41, $50, $F4, $7D
DATA_11EA4B:         db $9B, $06, $03, $7E, $A8, $02, $63, $76
DATA_11EA53:         db $96, $03, $63, $78, $BD, $01, $63, $79
DATA_11EA5B:         db $B9, $01, $63, $79, $C2, $03, $63, $79
DATA_11EA63:         db $CE, $02, $63, $78, $C5, $02, $68, $7D
DATA_11EA6B:         db $BE, $01, $00, $68, $7E, $B2, $01, $00
DATA_11EA73:         db $FF

; level 2D screen exit data
DATA_11EA74:         db $7E, $64, $00, $7A, $06, $75, $B5, $0D
DATA_11EA7C:         db $50, $00, $76, $B5, $0D, $50, $00, $FF

; level 64 header
DATA_11EA84:         db $C0, $85, $D7, $46, $E1, $DA, $58, $6D
DATA_11EA8C:         db $2A, $20

; level 64 object data
DATA_11EA8E:         db $01, $71, $99, $01, $06, $01, $71, $20
DATA_11EA96:         db $08, $0D, $01, $70, $C0, $0C, $03, $05
DATA_11EA9E:         db $70, $CD, $01, $03, $01, $70, $BF, $00
DATA_11EAA6:         db $04, $02, $70, $2F, $09, $03, $71, $29
DATA_11EAAE:         db $07, $0D, $72, $82, $03, $04, $72, $66
DATA_11EAB6:         db $01, $09, $05, $73, $74, $01, $08, $01
DATA_11EABE:         db $72, $65, $00, $09, $02, $72, $64, $05
DATA_11EAC6:         db $01, $71, $BF, $05, $04, $14, $70, $7F
DATA_11EACE:         db $07, $03, $14, $71, $51, $08, $03, $04
DATA_11EAD6:         db $71, $9B, $03, $06, $5C, $71, $B3, $03
DATA_11EADE:         db $00, $5F, $71, $51, $03, $01, $67, $79
DATA_11EAE6:         db $00, $17, $0F, $0B, $7A, $08, $0F, $14
DATA_11EAEE:         db $79, $47, $11, $04, $01, $74, $12, $01
DATA_11EAF6:         db $0E, $01, $74, $1A, $02, $0E, $03, $74
DATA_11EAFE:         db $1C, $08, $01, $74, $A4, $05, $05, $02
DATA_11EB06:         db $74, $19, $09, $02, $74, $11, $09, $03
DATA_11EB0E:         db $74, $14, $09, $01, $73, $A8, $09, $05
DATA_11EB16:         db $14, $74, $61, $03, $03, $01, $74, $AC
DATA_11EB1E:         db $04, $05, $14, $74, $69, $03, $03, $05
DATA_11EB26:         db $75, $A1, $03, $05, $01, $75, $85, $01
DATA_11EB2E:         db $07, $03, $76, $70, $08, $02, $76, $94
DATA_11EB36:         db $06, $03, $77, $80, $07, $01, $76, $8B
DATA_11EB3E:         db $04, $07, $03, $75, $87, $07, $02, $75
DATA_11EB46:         db $9C, $06, $05, $75, $9D, $01, $06, $07
DATA_11EB4E:         db $75, $8F, $00, $07, $01, $77, $CD, $04
DATA_11EB56:         db $03, $03, $78, $C2, $03, $14, $79, $A6
DATA_11EB5E:         db $10, $02, $02, $78, $B8, $04, $02, $7A
DATA_11EB66:         db $BE, $04, $03, $7B, $B1, $02, $05, $7D
DATA_11EB6E:         db $A7, $01, $05, $03, $7D, $99, $06, $02
DATA_11EB76:         db $7C, $7F, $04, $03, $7D, $71, $03, $01
DATA_11EB7E:         db $7E, $B0, $00, $04, $02, $7D, $BF, $04
DATA_11EB86:         db $03, $7E, $B1, $04, $01, $73, $66, $01
DATA_11EB8E:         db $09, $03, $73, $68, $04, $01, $78, $AA
DATA_11EB96:         db $05, $05, $0A, $78, $0F, $0A, $01, $7C
DATA_11EB9E:         db $BA, $05, $04, $01, $7D, $A1, $05, $05
DATA_11EBA6:         db $01, $7D, $70, $00, $08, $01, $7B, $D1
DATA_11EBAE:         db $0E, $02, $02, $7B, $6F, $07, $02, $7E
DATA_11EBB6:         db $B6, $04, $01, $7E, $B7, $02, $04, $01
DATA_11EBBE:         db $7F, $C2, $0D, $03, $00, $7F, $AB, $50
DATA_11EBC6:         db $02, $7E, $89, $03, $01, $7E, $8A, $05
DATA_11EBCE:         db $07, $05, $7F, $80, $01, $07, $03, $7F
DATA_11EBD6:         db $72, $05, $14, $76, $AC, $02, $02, $00
DATA_11EBDE:         db $70, $A7, $50, $A9, $70, $9A, $02, $01
DATA_11EBE6:         db $76, $95, $04, $06, $07, $76, $9A, $00
DATA_11EBEE:         db $06, $06, $72, $78, $02, $08, $01, $72
DATA_11EBF6:         db $AB, $05, $05, $07, $73, $A1, $02, $05
DATA_11EBFE:         db $14, $78, $8F, $07, $01, $14, $79, $92
DATA_11EC06:         db $04, $03, $68, $73, $7D, $00, $00, $68
DATA_11EC0E:         db $74, $70, $00, $00, $68, $74, $7D, $00
DATA_11EC16:         db $00, $68, $75, $70, $00, $00, $68, $72
DATA_11EC1E:         db $5B, $00, $00, $68, $73, $50, $00, $00
DATA_11EC26:         db $61, $79, $85, $01, $00, $C4, $77, $8F
DATA_11EC2E:         db $02, $07, $78, $B9, $00, $04, $00, $70
DATA_11EC36:         db $A3, $1B, $00, $71, $77, $1D, $00, $79
DATA_11EC3E:         db $B7, $1C, $00, $7A, $B1, $1C, $00, $73
DATA_11EC46:         db $8A, $1B, $00, $72, $90, $1B, $00, $75
DATA_11EC4E:         db $65, $1B, $00, $78, $A0, $1B, $00, $7D
DATA_11EC56:         db $9F, $1B, $00, $7F, $A5, $1B, $00, $7F
DATA_11EC5E:         db $A7, $1B, $14, $7A, $84, $02, $02, $14
DATA_11EC66:         db $78, $4F, $0A, $02, $0B, $7B, $01, $06
DATA_11EC6E:         db $0A, $7A, $0E, $06, $0A, $7B, $07, $08
DATA_11EC76:         db $0B, $7B, $0A, $08, $0D, $7B, $8A, $01
DATA_11EC7E:         db $0D, $7B, $BE, $01, $06, $7C, $60, $00
DATA_11EC86:         db $09, $58, $7B, $97, $03, $00, $67, $7B
DATA_11EC8E:         db $08, $01, $08, $01, $7A, $BF, $01, $04
DATA_11EC96:         db $58, $7A, $7E, $03, $00, $67, $7A, $0F
DATA_11EC9E:         db $01, $06, $00, $7A, $9F, $1B, $57, $7A
DATA_11ECA6:         db $94, $02, $7F, $79, $59, $0E, $02, $59
DATA_11ECAE:         db $79, $87, $03, $01, $03, $77, $6D, $06
DATA_11ECB6:         db $02, $77, $77, $08, $05, $77, $78, $01
DATA_11ECBE:         db $08, $68, $7B, $9B, $00, $00, $68, $7B
DATA_11ECC6:         db $A3, $00, $00, $68, $7B, $A6, $00, $00
DATA_11ECCE:         db $01, $77, $6A, $02, $09, $00, $74, $82
DATA_11ECD6:         db $1C, $00, $74, $8A, $1D, $02, $7C, $96
DATA_11ECDE:         db $02, $03, $7C, $71, $04, $03, $7C, $9A
DATA_11ECE6:         db $02, $01, $7C, $B1, $05, $04, $01, $7C
DATA_11ECEE:         db $97, $02, $06, $00, $79, $BD, $1D, $68
DATA_11ECF6:         db $74, $75, $00, $00, $68, $74, $78, $00
DATA_11ECFE:         db $00, $68, $73, $6E, $01, $00, $FF

; level 64 screen exit data
DATA_11ED05:         db $7F, $90, $00, $7A, $06, $FF

; level 90 header
DATA_11ED0B:         db $D8, $84, $2B, $C6, $E1, $C0, $59, $ED
DATA_11ED13:         db $02, $40

; level 90 object data
DATA_11ED15:         db $6B, $7E, $A5, $1A, $05, $00, $7E, $9F
DATA_11ED1D:         db $82, $01, $72, $77, $03, $01, $03, $72
DATA_11ED25:         db $7B, $01, $01, $70, $C0, $14, $03, $04
DATA_11ED2D:         db $71, $A7, $01, $05, $01, $76, $D9, $06
DATA_11ED35:         db $02, $02, $76, $0F, $0D, $6C, $7A, $A3
DATA_11ED3D:         db $00, $00, $6C, $7A, $AF, $00, $00, $58
DATA_11ED45:         db $79, $1A, $02, $00, $01, $68, $D9, $03
DATA_11ED4D:         db $12, $C6, $7D, $67, $FE, $68, $7E, $75
DATA_11ED55:         db $00, $00, $58, $7B, $23, $02, $00, $68
DATA_11ED5D:         db $7D, $6F, $00, $00, $68, $7E, $63, $00
DATA_11ED65:         db $00, $68, $71, $6C, $02, $00, $7A, $70
DATA_11ED6D:         db $65, $0A, $05, $7B, $70, $6F, $02, $05
DATA_11ED75:         db $7B, $70, $65, $FE, $05, $01, $76, $D1
DATA_11ED7D:         db $05, $02, $02, $76, $D0, $02, $0A, $65
DATA_11ED85:         db $09, $0F, $58, $75, $09, $02, $00, $00
DATA_11ED8D:         db $65, $CD, $47, $0B, $66, $09, $0F, $00
DATA_11ED95:         db $74, $6F, $C4, $02, $71, $A4, $02, $7F
DATA_11ED9D:         db $70, $95, $03, $02, $7F, $70, $9C, $03
DATA_11EDA5:         db $02, $00, $70, $A6, $50, $00, $70, $AD
DATA_11EDAD:         db $50, $01, $71, $A5, $01, $05, $7F, $70
DATA_11EDB5:         db $7C, $00, $01, $03, $76, $99, $04, $02
DATA_11EDBD:         db $76, $96, $04, $67, $66, $01, $07, $0F
DATA_11EDC5:         db $67, $65, $0A, $01, $0F, $00, $76, $B1
DATA_11EDCD:         db $13, $67, $65, $0C, $04, $06, $58, $65
DATA_11EDD5:         db $6B, $06, $09, $00, $72, $57, $1B, $58
DATA_11EDDD:         db $76, $01, $08, $00, $14, $65, $A9, $02
DATA_11EDE5:         db $02, $63, $65, $DC, $04, $7F, $70, $66
DATA_11EDED:         db $03, $01, $7F, $70, $77, $01, $01, $7F
DATA_11EDF5:         db $70, $6B, $03, $01, $05, $72, $B0, $01
DATA_11EDFD:         db $04, $07, $72, $A2, $01, $05, $05, $72
DATA_11EE05:         db $84, $01, $07, $01, $72, $76, $00, $08
DATA_11EE0D:         db $58, $72, $96, $05, $06, $03, $75, $83
DATA_11EE15:         db $07, $02, $75, $9A, $06, $03, $75, $9C
DATA_11EE1D:         db $06, $01, $75, $9B, $00, $06, $79, $65
DATA_11EE25:         db $E8, $FA, $68, $73, $7C, $00, $00, $68
DATA_11EE2D:         db $74, $72, $00, $00, $02, $7D, $A1, $05
DATA_11EE35:         db $01, $7D, $A2, $00, $05, $03, $7D, $A3
DATA_11EE3D:         db $05, $01, $68, $DD, $02, $0D, $03, $79
DATA_11EE45:         db $99, $06, $03, $79, $AF, $05, $02, $79
DATA_11EE4D:         db $9D, $06, $02, $79, $A7, $05, $07, $79
DATA_11EE55:         db $A8, $00, $05, $06, $79, $9E, $00, $06
DATA_11EE5D:         db $0A, $7B, $03, $01, $0B, $7B, $05, $01
DATA_11EE65:         db $67, $7B, $04, $00, $01, $6E, $7B, $0A
DATA_11EE6D:         db $00, $04, $02, $7B, $9F, $06, $0A, $68
DATA_11EE75:         db $0F, $0D, $0B, $69, $03, $1A, $00, $6A
DATA_11EE7D:         db $F0, $FE, $00, $6A, $00, $FD, $00, $6A
DATA_11EE85:         db $10, $FE, $67, $69, $00, $02, $1A, $14
DATA_11EE8D:         db $68, $DA, $04, $09, $57, $78, $4D, $01
DATA_11EE95:         db $57, $78, $1A, $01, $57, $68, $ED, $01
DATA_11EE9D:         db $14, $78, $6A, $02, $04, $14, $78, $6B
DATA_11EEA5:         db $07, $04, $6E, $7B, $AA, $00, $05, $7F
DATA_11EEAD:         db $78, $AD, $06, $02, $00, $78, $7B, $C4
DATA_11EEB5:         db $14, $79, $40, $03, $05, $7F, $79, $81
DATA_11EEBD:         db $02, $02, $A8, $79, $93, $00, $01, $14
DATA_11EEC5:         db $78, $5E, $02, $01, $5F, $79, $40, $01
DATA_11EECD:         db $00, $7F, $78, $9F, $03, $01, $7F, $79
DATA_11EED5:         db $52, $01, $02, $0A, $69, $0A, $10, $0B
DATA_11EEDD:         db $69, $0C, $10, $67, $69, $0B, $00, $10
DATA_11EEE5:         db $F5, $78, $CE, $08, $03, $0B, $78, $BD
DATA_11EEED:         db $04, $02, $73, $BC, $04, $05, $73, $BD
DATA_11EEF5:         db $01, $04, $01, $73, $AF, $00, $05, $04
DATA_11EEFD:         db $74, $A0, $01, $05, $03, $74, $B2, $04
DATA_11EF05:         db $02, $74, $AA, $05, $01, $74, $CB, $01
DATA_11EF0D:         db $03, $05, $74, $CD, $01, $03, $07, $74
DATA_11EF15:         db $BF, $00, $04, $01, $75, $A0, $02, $05
DATA_11EF1D:         db $03, $74, $AB, $02, $01, $71, $B9, $06
DATA_11EF25:         db $04, $03, $73, $B4, $04, $03, $77, $14
DATA_11EF2D:         db $0B, $04, $77, $02, $01, $0F, $01, $77
DATA_11EF35:         db $00, $01, $0F, $00, $7D, $82, $50, $04
DATA_11EF3D:         db $7C, $90, $01, $06, $03, $7C, $7A, $08
DATA_11EF45:         db $01, $7C, $79, $00, $08, $07, $7C, $97
DATA_11EF4D:         db $01, $06, $05, $7C, $A5, $01, $05, $01
DATA_11EF55:         db $7C, $A2, $02, $05, $14, $72, $A5, $01
DATA_11EF5D:         db $03, $60, $72, $A5, $00, $00, $5A, $72
DATA_11EF65:         db $E5, $00, $00, $6C, $72, $AB, $00, $00
DATA_11EF6D:         db $F5, $72, $D9, $05, $02, $F5, $72, $D7
DATA_11EF75:         db $00, $02, $6C, $72, $C8, $00, $02, $02
DATA_11EF7D:         db $72, $BF, $04, $01, $73, $B0, $03, $04
DATA_11EF85:         db $01, $77, $C4, $0C, $03, $14, $76, $8F
DATA_11EF8D:         db $03, $04, $14, $77, $71, $03, $04, $5C
DATA_11EF95:         db $77, $D1, $01, $00, $02, $68, $B0, $11
DATA_11EF9D:         db $06, $68, $B1, $01, $14, $01, $68, $D6
DATA_11EFA5:         db $02, $12, $00, $68, $B7, $50, $5F, $77
DATA_11EFAD:         db $71, $01, $00, $7F, $76, $9F, $01, $02
DATA_11EFB5:         db $7F, $77, $83, $01, $02, $C5, $66, $9D
DATA_11EFBD:         db $00, $C5, $66, $7E, $00, $C5, $67, $50
DATA_11EFC5:         db $00, $C5, $67, $42, $00, $C5, $67, $44
DATA_11EFCD:         db $00, $C5, $66, $BC, $0E, $14, $78, $49
DATA_11EFD5:         db $01, $06, $7F, $78, $6A, $02, $02, $85
DATA_11EFDD:         db $78, $39, $00, $02, $5A, $78, $B9, $00
DATA_11EFE5:         db $00, $14, $68, $2F, $03, $04, $14, $68
DATA_11EFED:         db $AF, $01, $02, $14, $69, $50, $02, $07
DATA_11EFF5:         db $C4, $7D, $59, $04, $02, $75, $82, $02
DATA_11EFFD:         db $01, $76, $97, $01, $06, $0C, $76, $A0
DATA_11F005:         db $02, $0D, $68, $7D, $02, $62, $69, $22
DATA_11F00D:         db $00, $00, $7F, $68, $3F, $02, $02, $14
DATA_11F015:         db $68, $E0, $01, $04, $01, $68, $D3, $02
DATA_11F01D:         db $12, $14, $68, $F1, $04, $02, $14, $78
DATA_11F025:         db $11, $01, $01, $5C, $78, $31, $01, $00
DATA_11F02D:         db $62, $68, $E1, $00, $00, $62, $68, $F5
DATA_11F035:         db $00, $00, $5D, $78, $25, $00, $00, $7F
DATA_11F03D:         db $68, $F0, $01, $02, $FF

; level 90 screen exit data
DATA_11F042:         db $65, $E4, $5E, $6B, $90, $FF

; level B5 header
DATA_11F048:         db $90, $84, $10, $DB, $69, $80, $78, $4E
DATA_11F050:         db $1D, $E0

; level B5 object data
DATA_11F052:         db $01, $40, $E0, $0F, $31, $01, $61, $10
DATA_11F05A:         db $0F, $1E, $03, $62, $D0, $12, $14, $50
DATA_11F062:         db $31, $0D, $02, $14, $40, $FD, $01, $04
DATA_11F06A:         db $14, $50, $51, $0A, $2A, $00, $61, $21
DATA_11F072:         db $FE, $00, $51, $E1, $FF, $5D, $50, $99
DATA_11F07A:         db $02, $0B, $00, $50, $C6, $9B, $D2, $50
DATA_11F082:         db $C5, $00, $00, $50, $C4, $8E, $D1, $50
DATA_11F08A:         db $D4, $1D, $7F, $50, $A2, $05, $03, $7F
DATA_11F092:         db $50, $D2, $03, $22, $00, $70, $B4, $90
DATA_11F09A:         db $14, $70, $1B, $15, $0E, $02, $63, $17
DATA_11F0A2:         db $1E, $01, $63, $18, $07, $1E, $01, $44
DATA_11F0AA:         db $E0, $0F, $31, $7F, $70, $45, $05, $0B
DATA_11F0B2:         db $7F, $70, $7A, $08, $08, $7F, $71, $22
DATA_11F0BA:         db $0E, $0D, $67, $60, $59, $01, $07, $62
DATA_11F0C2:         db $60, $5B, $03, $0F, $57, $60, $06, $02
DATA_11F0CA:         db $57, $60, $46, $02, $57, $60, $86, $02
DATA_11F0D2:         db $57, $60, $C6, $02, $57, $70, $06, $03
DATA_11F0DA:         db $57, $70, $37, $03, $37, $72, $57, $01
DATA_11F0E2:         db $37, $71, $5F, $05, $37, $72, $5B, $05
DATA_11F0EA:         db $37, $71, $8F, $11, $00, $62, $D1, $FF
DATA_11F0F2:         db $14, $73, $97, $17, $06, $14, $54, $25
DATA_11F0FA:         db $09, $1A, $14, $64, $C1, $0D, $02, $14
DATA_11F102:         db $63, $E8, $16, $0B, $14, $53, $2F, $07
DATA_11F10A:         db $05, $7F, $53, $3F, $0E, $03, $00, $53
DATA_11F112:         db $1E, $FF, $00, $40, $EE, $FF, $00, $44
DATA_11F11A:         db $E1, $FF, $D2, $70, $C5, $34, $CE, $64
DATA_11F122:         db $BA, $F0, $7F, $73, $A7, $04, $05, $7F
DATA_11F12A:         db $54, $59, $04, $2A, $00, $63, $3E, $FE
DATA_11F132:         db $7F, $64, $B7, $03, $14, $7F, $64, $C6
DATA_11F13A:         db $02, $13, $7F, $64, $D4, $03, $12, $7F
DATA_11F142:         db $74, $03, $02, $0F, $7F, $74, $12, $02
DATA_11F14A:         db $0E, $7F, $74, $21, $02, $0D, $7F, $73
DATA_11F152:         db $2F, $03, $0D, $7F, $73, $5E, $02, $0A
DATA_11F15A:         db $7F, $73, $6D, $02, $09, $7F, $73, $7C
DATA_11F162:         db $02, $08, $7F, $73, $89, $04, $07, $14
DATA_11F16A:         db $73, $37, $01, $02, $57, $73, $68, $04
DATA_11F172:         db $57, $73, $28, $06, $37, $73, $CE, $0D
DATA_11F17A:         db $37, $74, $80, $0B, $37, $74, $44, $07
DATA_11F182:         db $37, $74, $08, $03, $59, $54, $95, $01
DATA_11F18A:         db $0D, $5A, $54, $A7, $00, $0C, $5F, $64
DATA_11F192:         db $C1, $03, $01, $60, $64, $75, $02, $04
DATA_11F19A:         db $14, $54, $F2, $04, $02, $14, $54, $A2
DATA_11F1A2:         db $04, $02, $C5, $50, $F3, $17, $68, $70
DATA_11F1AA:         db $56, $02, $03, $C4, $70, $9B, $26, $C6
DATA_11F1B2:         db $64, $CA, $F1, $C5, $54, $8C, $12, $C4
DATA_11F1BA:         db $71, $74, $08, $C4, $73, $73, $02, $00
DATA_11F1C2:         db $73, $94, $9C, $D1, $73, $A4, $00, $D2
DATA_11F1CA:         db $54, $50, $09, $00, $54, $5A, $8F, $D1
DATA_11F1D2:         db $54, $6B, $14, $60, $70, $1F, $02, $02
DATA_11F1DA:         db $FF

; level B5 screen exit data
DATA_11F1DB:         db $54, $2D, $70, $7B, $03, $FF

; level 2D sprite data
DATA_11F1E1:         db $5B, $F9, $45, $5B, $F9, $48, $5B, $F9
DATA_11F1E9:         db $4B, $E2, $F3, $5E, $5B, $F9, $6C, $5B
DATA_11F1F1:         db $F9, $63, $5B, $F9, $66, $5B, $F9, $69
DATA_11F1F9:         db $E2, $F1, $3D, $E2, $F1, $4F, $FB, $F8
DATA_11F201:         db $28, $FC, $EE, $32, $FC, $F8, $2B, $FC
DATA_11F209:         db $F8, $25, $FB, $F4, $2E, $5B, $F9, $42
DATA_11F211:         db $FA, $EE, $46, $5B, $F7, $86, $5B, $F7
DATA_11F219:         db $94, $E2, $F5, $80, $E2, $F5, $A6, $5B
DATA_11F221:         db $F7, $9F, $BB, $E6, $80, $FC, $F0, $67
DATA_11F229:         db $9E, $F7, $23, $9E, $F5, $21, $9D, $ED
DATA_11F231:         db $6A, $9D, $F1, $4B, $E2, $F3, $70, $9D
DATA_11F239:         db $ED, $70, $C1, $E6, $57, $9F, $E7, $A7
DATA_11F241:         db $BB, $E6, $8E, $BB, $E6, $9A, $6A, $E8
DATA_11F249:         db $59, $6A, $E8, $55, $D0, $F6, $EF, $65
DATA_11F251:         db $EC, $64, $65, $EC, $6B, $65, $EC, $26
DATA_11F259:         db $65, $EC, $29, $FD, $F2, $C9, $FD, $EE
DATA_11F261:         db $CE, $BB, $E8, $E5, $C1, $E6, $E1, $EC
DATA_11F269:         db $F8, $C1, $B5, $EA, $68, $D1, $F2, $5F
DATA_11F271:         db $65, $F6, $DD, $65, $F6, $E4, $1E, $F2
DATA_11F279:         db $DB, $FC, $F0, $8D, $FC, $F0, $99, $9D
DATA_11F281:         db $F3, $2D, $B5, $F4, $92, $FF, $FF

; level 64 sprite data
DATA_11F288:         db $A6, $EA, $1E, $D8, $F0, $0A, $A6, $EA
DATA_11F290:         db $9B, $A7, $EC, $C8, $A6, $EA, $3F, $A6
DATA_11F298:         db $EA, $5E, $A6, $EA, $57, $0E, $F3, $8F
DATA_11F2A0:         db $A6, $EA, $37, $D0, $F4, $FF, $FA, $F6
DATA_11F2A8:         db $6D, $58, $E8, $BC, $58, $EA, $EE, $FA
DATA_11F2B0:         db $F8, $DC, $65, $F2, $BE, $4F, $F0, $12
DATA_11F2B8:         db $58, $EC, $6A, $65, $EC, $2C, $65, $EC
DATA_11F2C0:         db $2F, $65, $F0, $80, $FD, $F6, $7F, $44
DATA_11F2C8:         db $F7, $B8, $A6, $F2, $A5, $A6, $EA, $7D
DATA_11F2D0:         db $A6, $EA, $7D, $FD, $F0, $CA, $65, $EC
DATA_11F2D8:         db $46, $65, $EC, $47, $65, $F6, $9B, $65
DATA_11F2E0:         db $F6, $9F, $AF, $F7, $9D, $AF, $F7, $99
DATA_11F2E8:         db $AF, $F7, $A1, $AF, $ED, $4E, $AF, $ED
DATA_11F2F0:         db $4F, $5C, $E4, $88, $5C, $E4, $D0, $FF
DATA_11F2F8:         db $FF

; level 90 sprite data
DATA_11F2F9:         db $6C, $F8, $6C, $4C, $E4, $9B, $0B, $F3
DATA_11F301:         db $A3, $0B, $F3, $AF, $8A, $F4, $B4, $89
DATA_11F309:         db $F4, $A8, $54, $E6, $B4, $0D, $F2, $E6
DATA_11F311:         db $9E, $F5, $4E, $65, $EC, $E1, $65, $C8
DATA_11F319:         db $76, $65, $C8, $7A, $65, $EC, $40, $65
DATA_11F321:         db $EC, $3E, $FA, $D6, $91, $9F, $E7, $41
DATA_11F329:         db $9D, $E5, $1E, $4F, $F2, $0A, $66, $F2
DATA_11F331:         db $BA, $C8, $EE, $5E, $BB, $E8, $65, $BF
DATA_11F339:         db $DA, $4F, $4E, $D6, $5E, $FA, $F8, $26
DATA_11F341:         db $9D, $E5, $3E, $9F, $E7, $D1, $9D, $E3
DATA_11F349:         db $CD, $9D, $E5, $CF, $44, $D7, $5B, $58
DATA_11F351:         db $EA, $AA, $0A, $F3, $D2, $0A, $F3, $D3
DATA_11F359:         db $9F, $E3, $27, $65, $C8, $78, $66, $D4
DATA_11F361:         db $80, $9F, $E5, $24, $F4, $EC, $28, $69
DATA_11F369:         db $EA, $C4, $44, $D7, $8F, $B5, $E0, $84
DATA_11F371:         db $FF, $FF

; level B5 sprite data
DATA_11F373:         db $8B, $B7, $05, $5B, $BF, $07, $5B, $C7
DATA_11F37B:         db $07, $5B, $CF, $07, $5B, $D7, $07, $5B
DATA_11F383:         db $DF, $07, $5B, $DF, $08, $E2, $A9, $08
DATA_11F38B:         db $5B, $E9, $22, $E2, $E5, $1D, $5B, $E9
DATA_11F393:         db $2D, $5B, $EF, $23, $5B, $EF, $2C, $5B
DATA_11F39B:         db $EF, $27, $5B, $EF, $28, $5B, $EB, $3A
DATA_11F3A3:         db $5B, $E3, $39, $5B, $E3, $3B, $5B, $E7
DATA_11F3AB:         db $49, $5B, $E7, $47, $5B, $EF, $48, $5B
DATA_11F3B3:         db $EF, $44, $5B, $F7, $43, $5B, $F7, $46
DATA_11F3BB:         db $E2, $EF, $3E, $5B, $C3, $44, $5B, $B9
DATA_11F3C3:         db $44, $E2, $C7, $47, $84, $A6, $40, $5A
DATA_11F3CB:         db $E9, $27, $8B, $F5, $34, $97, $AB, $42
DATA_11F3D3:         db $97, $AB, $44, $84, $AC, $40, $B5, $E8
DATA_11F3DB:         db $28, $FF, $FF

; level 35 header
DATA_11F3DE:         db $03, $19, $B4, $04, $01, $80, $00, $00
DATA_11F3E6:         db $01, $00

; level 35 object data
DATA_11F3E8:         db $6C, $70, $C0, $11, $03, $37, $71, $C2
DATA_11F3F0:         db $0B, $48, $71, $CE, $31, $03, $6C, $71
DATA_11F3F8:         db $53, $00, $03, $6C, $71, $42, $02, $00
DATA_11F400:         db $45, $73, $3C, $02, $02, $CB, $73, $5B
DATA_11F408:         db $04, $05, $46, $73, $A4, $07, $00, $55
DATA_11F410:         db $73, $96, $03, $02, $48, $72, $B2, $1D
DATA_11F418:         db $00, $48, $72, $A4, $12, $00, $48, $72
DATA_11F420:         db $96, $10, $00, $F4, $74, $B0, $04, $48
DATA_11F428:         db $73, $7A, $00, $01, $48, $73, $63, $07
DATA_11F430:         db $00, $46, $74, $60, $0D, $00, $48, $73
DATA_11F438:         db $55, $05, $00, $48, $73, $5E, $11, $03
DATA_11F440:         db $53, $73, $5A, $04, $53, $72, $8B, $03
DATA_11F448:         db $53, $73, $8A, $04, $CB, $66, $2D, $06
DATA_11F450:         db $09, $48, $74, $92, $0D, $02, $48, $64
DATA_11F458:         db $54, $02, $0D, $48, $74, $39, $06, $01
DATA_11F460:         db $48, $74, $09, $16, $02, $45, $64, $9E
DATA_11F468:         db $03, $04, $46, $65, $C2, $05, $01, $48
DATA_11F470:         db $64, $ED, $42, $01, $45, $65, $78, $05
DATA_11F478:         db $04, $48, $65, $C4, $3B, $01, $53, $74
DATA_11F480:         db $26, $03, $F4, $66, $C4, $03, $45, $67
DATA_11F488:         db $23, $0B, $09, $48, $67, $90, $08, $02
DATA_11F490:         db $48, $67, $60, $05, $02, $53, $66, $9D
DATA_11F498:         db $03, $53, $66, $6C, $04, $48, $68, $A0
DATA_11F4A0:         db $0F, $01, $CB, $68, $37, $08, $06, $48
DATA_11F4A8:         db $68, $75, $07, $00, $48, $68, $45, $02
DATA_11F4B0:         db $02, $48, $66, $5B, $02, $01, $48, $64
DATA_11F4B8:         db $20, $2D, $02, $48, $67, $2A, $15, $01
DATA_11F4C0:         db $48, $64, $00, $4F, $01, $48, $68, $4F
DATA_11F4C8:         db $00, $03, $53, $68, $7C, $03, $44, $68
DATA_11F4D0:         db $8F, $00, $01, $00, $75, $23, $FE, $48
DATA_11F4D8:         db $7D, $00, $29, $00, $48, $7D, $10, $0B
DATA_11F4E0:         db $01, $45, $7D, $42, $06, $07, $48, $7D
DATA_11F4E8:         db $30, $06, $02, $48, $7D, $60, $01, $05
DATA_11F4F0:         db $48, $7D, $A8, $04, $01, $48, $7D, $C0
DATA_11F4F8:         db $0C, $01, $48, $7F, $CB, $04, $01, $48
DATA_11F500:         db $7D, $E0, $2F, $01, $A7, $7D, $1C, $1C
DATA_11F508:         db $00, $48, $7F, $19, $00, $00, $A7, $7D
DATA_11F510:         db $DD, $1D, $00, $D1, $7E, $51, $05, $00
DATA_11F518:         db $7E, $41, $9C, $00, $7E, $B1, $9D, $00
DATA_11F520:         db $7E, $37, $9C, $D1, $7E, $47, $06, $00
DATA_11F528:         db $7E, $3C, $9C, $D1, $7E, $4C, $06, $D1
DATA_11F530:         db $7F, $31, $07, $D1, $7F, $36, $07, $00
DATA_11F538:         db $7E, $B7, $9D, $00, $7E, $BC, $9D, $00
DATA_11F540:         db $7F, $B1, $9D, $00, $7F, $B6, $9D, $48
DATA_11F548:         db $5F, $1E, $01, $2A, $D1, $5F, $5C, $25
DATA_11F550:         db $00, $7F, $BC, $9D, $00, $5F, $4C, $9C
DATA_11F558:         db $48, $6E, $00, $19, $0F, $00, $6E, $EE
DATA_11F560:         db $FE, $48, $5F, $C5, $04, $00, $48, $5D
DATA_11F568:         db $C0, $05, $00, $48, $5D, $D0, $29, $02
DATA_11F570:         db $48, $5D, $08, $27, $00, $A7, $5D, $18
DATA_11F578:         db $25, $00, $A7, $5F, $85, $00, $03, $A7
DATA_11F580:         db $5D, $C6, $1E, $00, $48, $1D, $20, $01
DATA_11F588:         db $49, $D1, $5D, $05, $09, $00, $5D, $A5
DATA_11F590:         db $9D, $00, $4D, $F5, $8E, $48, $4D, $0E
DATA_11F598:         db $11, $0B, $48, $4D, $CF, $10, $03, $00
DATA_11F5A0:         db $4E, $D2, $FE, $D2, $4D, $F6, $06, $A7
DATA_11F5A8:         db $4D, $CE, $00, $01, $00, $4D, $FD, $9B
DATA_11F5B0:         db $48, $1D, $00, $06, $03, $48, $1D, $09
DATA_11F5B8:         db $06, $03, $48, $1D, $2E, $01, $2D, $48
DATA_11F5C0:         db $3D, $C8, $07, $01, $48, $1D, $E6, $03
DATA_11F5C8:         db $01, $D1, $4D, $A7, $02, $D1, $4D, $74
DATA_11F5D0:         db $04, $D1, $3D, $A4, $09, $D1, $1D, $A4
DATA_11F5D8:         db $11, $D1, $1D, $08, $0A, $D1, $2D, $3C
DATA_11F5E0:         db $0A, $D1, $3D, $05, $03, $D1, $3D, $3A
DATA_11F5E8:         db $06, $00, $4D, $C4, $9D, $00, $4D, $D7
DATA_11F5F0:         db $9D, $00, $4D, $DB, $9D, $00, $4D, $64
DATA_11F5F8:         db $9C, $00, $4D, $44, $9D, $D1, $4D, $17
DATA_11F600:         db $06, $00, $4D, $07, $9C, $00, $3D, $AA
DATA_11F608:         db $9D, $00, $3D, $45, $9D, $00, $3D, $2A
DATA_11F610:         db $9C, $00, $2D, $EC, $9D, $00, $2D, $C4
DATA_11F618:         db $9D, $00, $1D, $B8, $9D, $00, $1D, $94
DATA_11F620:         db $9C, $D1, $1D, $8C, $08, $00, $1D, $7C
DATA_11F628:         db $9C, $00, $4D, $87, $9D, $00, $4D, $97
DATA_11F630:         db $9C, $D1, $4D, $8B, $04, $00, $4D, $7B
DATA_11F638:         db $9C, $00, $2D, $F5, $9C, $00, $2D, $98
DATA_11F640:         db $9C, $D1, $2D, $A8, $05, $00, $3D, $08
DATA_11F648:         db $9D, $00, $2D, $2C, $9C, $00, $2D, $1C
DATA_11F650:         db $9D, $00, $5D, $82, $C4, $00, $3D, $94
DATA_11F658:         db $9C, $C4, $73, $1E, $04, $C4, $72, $3B
DATA_11F660:         db $06, $C4, $72, $4C, $04, $C4, $71, $76
DATA_11F668:         db $06, $68, $66, $A7, $01, $01, $68, $66
DATA_11F670:         db $A1, $01, $01, $68, $66, $91, $07, $00
DATA_11F678:         db $68, $7D, $5E, $01, $00, $68, $7E, $52
DATA_11F680:         db $03, $00, $68, $7E, $58, $02, $00, $68
DATA_11F688:         db $7E, $5E, $00, $00, $68, $7F, $52, $02
DATA_11F690:         db $00, $68, $7F, $57, $03, $00, $C4, $4D
DATA_11F698:         db $98, $04, $C4, $3D, $73, $08, $68, $2D
DATA_11F6A0:         db $76, $03, $00, $00, $5D, $49, $9C, $D1
DATA_11F6A8:         db $5D, $59, $00, $CE, $5D, $69, $01, $CE
DATA_11F6B0:         db $5D, $6C, $FF, $D1, $5D, $5D, $00, $00
DATA_11F6B8:         db $5D, $4D, $9C, $D1, $5D, $8B, $01, $00
DATA_11F6C0:         db $5D, $AB, $9D, $D1, $5E, $50, $03, $00
DATA_11F6C8:         db $5E, $40, $8E, $D2, $5E, $41, $01, $00
DATA_11F6D0:         db $5E, $43, $8F, $D1, $5E, $54, $03, $00
DATA_11F6D8:         db $5E, $90, $90, $D2, $5E, $A1, $01, $00
DATA_11F6E0:         db $5E, $93, $91, $00, $5E, $47, $8E, $D2
DATA_11F6E8:         db $5E, $48, $01, $00, $5E, $4A, $9B, $D1
DATA_11F6F0:         db $5E, $57, $00, $00, $5E, $67, $90, $D2
DATA_11F6F8:         db $5E, $78, $01, $00, $5E, $7A, $8F, $D1
DATA_11F700:         db $5E, $8B, $00, $00, $5E, $9A, $91, $D2
DATA_11F708:         db $5E, $A8, $01, $00, $5E, $A7, $9A, $A7
DATA_11F710:         db $5E, $82, $00, $00, $A7, $5E, $2C, $00
DATA_11F718:         db $01, $A7, $5D, $87, $01, $03, $00, $5E
DATA_11F720:         db $4E, $9C, $D1, $5E, $5E, $00, $00, $5E
DATA_11F728:         db $6E, $90, $00, $5E, $7E, $8E, $D1, $5F
DATA_11F730:         db $53, $00, $D2, $5E, $7F, $02, $D1, $5E
DATA_11F738:         db $8E, $01, $00, $5F, $62, $91, $00, $5F
DATA_11F740:         db $72, $8F, $D1, $5F, $83, $01, $00, $5F
DATA_11F748:         db $43, $9C, $00, $5E, $AE, $9D, $00, $5F
DATA_11F750:         db $A3, $9D, $A7, $5F, $20, $00, $02, $00
DATA_11F758:         db $5F, $48, $9C, $D1, $5F, $58, $04, $00
DATA_11F760:         db $5F, $A8, $9D, $FF

; level 35 screen exit data
DATA_11F764:         db $68, $6C, $04, $6A, $00, $1D, $98, $07
DATA_11F76C:         db $4E, $09, $0D, $98, $07, $4E, $09, $FF

; level 6C header
DATA_11F774:         db $03, $18, $C3, $0C, $01, $80, $28, $E3
DATA_11F77C:         db $01, $20

; level 6C object data
DATA_11F77E:         db $CB, $60, $6F, $02, $01, $44, $60, $62
DATA_11F786:         db $04, $05, $45, $60, $67, $03, $05, $48
DATA_11F78E:         db $60, $00, $0B, $01, $48, $60, $20, $08
DATA_11F796:         db $03, $48, $60, $60, $01, $05, $46, $60
DATA_11F79E:         db $9B, $04, $00, $45, $61, $50, $01, $00
DATA_11F7A6:         db $CD, $60, $DC, $04, $FC, $CD, $61, $90
DATA_11F7AE:         db $01, $FF, $53, $60, $7E, $02, $55, $60
DATA_11F7B6:         db $7F, $FA, $05, $48, $60, $C0, $0B, $03
DATA_11F7BE:         db $46, $61, $6B, $01, $00, $CB, $61, $6B
DATA_11F7C6:         db $02, $01, $CC, $62, $D0, $FB, $FB, $45
DATA_11F7CE:         db $61, $5D, $04, $03, $45, $62, $91, $03
DATA_11F7D6:         db $03, $53, $61, $7C, $02, $46, $62, $BD
DATA_11F7DE:         db $06, $01, $55, $61, $7D, $06, $05, $48
DATA_11F7E6:         db $62, $C1, $13, $01, $48, $62, $E1, $4E
DATA_11F7EE:         db $01, $45, $63, $54, $03, $02, $CD, $63
DATA_11F7F6:         db $B4, $03, $FD, $55, $63, $73, $FB, $05
DATA_11F7FE:         db $48, $62, $BB, $09, $00, $F5, $63, $C5
DATA_11F806:         db $08, $02, $48, $63, $73, $01, $03, $46
DATA_11F80E:         db $63, $8B, $03, $00, $CC, $63, $AD, $FE
DATA_11F816:         db $FE, $45, $63, $5F, $08, $06, $48, $63
DATA_11F81E:         db $7E, $01, $06, $CB, $65, $57, $03, $06
DATA_11F826:         db $CB, $65, $90, $01, $02, $46, $64, $CA
DATA_11F82E:         db $06, $00, $CD, $65, $91, $02, $FE, $CD
DATA_11F836:         db $65, $73, $02, $FD, $46, $65, $51, $02
DATA_11F83E:         db $00, $CC, $65, $67, $FF, $FD, $46, $65
DATA_11F846:         db $24, $03, $00, $48, $62, $01, $0A, $01
DATA_11F84E:         db $48, $62, $25, $02, $06, $CD, $56, $7A
DATA_11F856:         db $04, $F2, $48, $54, $00, $2A, $09, $CD
DATA_11F85E:         db $64, $5A, $0B, $F5, $48, $54, $A0, $10
DATA_11F866:         db $05, $00, $54, $E1, $FE, $45, $55, $F8
DATA_11F86E:         db $02, $01, $6C, $65, $18, $03, $00, $48
DATA_11F876:         db $65, $28, $02, $02, $48, $65, $98, $02
DATA_11F87E:         db $02, $48, $64, $07, $02, $08, $46, $66
DATA_11F886:         db $14, $02, $00, $6C, $66, $13, $03, $00
DATA_11F88E:         db $48, $66, $24, $02, $01, $CB, $66, $55
DATA_11F896:         db $02, $06, $45, $56, $F7, $02, $0C, $46
DATA_11F89E:         db $66, $1A, $03, $0A, $48, $66, $44, $05
DATA_11F8A6:         db $00, $48, $66, $84, $05, $00, $48, $66
DATA_11F8AE:         db $C4, $0B, $01, $48, $66, $8A, $00, $01
DATA_11F8B6:         db $48, $66, $4A, $00, $01, $53, $65, $16
DATA_11F8BE:         db $02, $55, $65, $17, $F4, $0C, $48, $64
DATA_11F8C6:         db $C0, $1A, $01, $F5, $65, $CB, $08, $02
DATA_11F8CE:         db $48, $56, $0E, $01, $1B, $53, $66, $8A
DATA_11F8D6:         db $04, $53, $66, $4A, $04, $CC, $64, $56
DATA_11F8DE:         db $FB, $FB, $A7, $55, $AC, $06, $00, $48
DATA_11F8E6:         db $45, $00, $1F, $06, $48, $45, $70, $14
DATA_11F8EE:         db $05, $48, $45, $D0, $1A, $02, $48, $46
DATA_11F8F6:         db $7A, $05, $01, $48, $46, $9E, $01, $06
DATA_11F8FE:         db $53, $46, $DA, $04, $C6, $62, $20, $04
DATA_11F906:         db $C4, $61, $23, $06, $C6, $63, $23, $FA
DATA_11F90E:         db $C6, $63, $2F, $06, $C6, $55, $B7, $F4
DATA_11F916:         db $C4, $55, $CD, $04, $44, $46, $75, $04
DATA_11F91E:         db $05, $C4, $65, $83, $02, $C4, $65, $A3
DATA_11F926:         db $02, $FF

; level 6C screen exit data
DATA_11F928:         db $46, $35, $D4, $7A, $00, $FF

; level 98 header
DATA_11F92E:         db $03, $1A, $54, $A4, $59, $80, $58, $60
DATA_11F936:         db $05, $40

; level 98 object data
DATA_11F938:         db $48, $40, $D0, $06, $02, $48, $40, $D9
DATA_11F940:         db $06, $02, $48, $00, $40, $01, $49, $48
DATA_11F948:         db $40, $0E, $01, $0D, $48, $30, $AE, $05
DATA_11F950:         db $05, $48, $20, $EE, $05, $09, $48, $20
DATA_11F958:         db $6E, $05, $05, $48, $20, $2E, $05, $01
DATA_11F960:         db $48, $10, $DE, $05, $02, $48, $10, $AE
DATA_11F968:         db $05, $01, $48, $10, $6E, $05, $01, $48
DATA_11F970:         db $10, $2E, $05, $01, $48, $00, $AB, $04
DATA_11F978:         db $05, $48, $00, $4E, $01, $05, $48, $00
DATA_11F980:         db $00, $0F, $03, $A6, $00, $8C, $02, $37
DATA_11F988:         db $00, $A8, $02, $A7, $00, $42, $0B, $00
DATA_11F990:         db $D1, $00, $67, $0B, $CE, $10, $27, $01
DATA_11F998:         db $D1, $10, $49, $17, $CE, $20, $C8, $FE
DATA_11F9A0:         db $D1, $20, $F6, $05, $CE, $30, $56, $01
DATA_11F9A8:         db $D1, $30, $78, $17, $00, $40, $F8, $9D
DATA_11F9B0:         db $48, $03, $00, $0F, $02, $48, $03, $30
DATA_11F9B8:         db $03, $04, $A6, $03, $53, $03, $48, $03
DATA_11F9C0:         db $80, $00, $74, $48, $03, $3F, $00, $79
DATA_11F9C8:         db $48, $73, $D0, $06, $02, $48, $73, $D9
DATA_11F9D0:         db $06, $02, $48, $73, $B0, $01, $01, $48
DATA_11F9D8:         db $73, $BE, $01, $01, $A7, $03, $81, $00
DATA_11F9E0:         db $72, $A7, $03, $3E, $00, $77, $A5, $73
DATA_11F9E8:         db $B7, $04, $48, $05, $00, $06, $02, $48
DATA_11F9F0:         db $05, $09, $06, $02, $A5, $05, $07, $03
DATA_11F9F8:         db $4E, $05, $A7, $01, $01, $CB, $05, $33
DATA_11FA00:         db $02, $06, $CD, $75, $81, $06, $F9, $48
DATA_11FA08:         db $05, $30, $00, $79, $CC, $75, $8E, $FA
DATA_11FA10:         db $F9, $48, $05, $3F, $00, $79, $48, $75
DATA_11FA18:         db $D0, $0F, $02, $45, $05, $A1, $06, $66
DATA_11FA20:         db $48, $05, $30, $03, $06, $CB, $05, $3A
DATA_11FA28:         db $02, $06, $46, $15, $08, $06, $60, $48
DATA_11FA30:         db $05, $3C, $03, $06, $48, $05, $A0, $06
DATA_11FA38:         db $01, $48, $05, $A9, $06, $01, $48, $75
DATA_11FA40:         db $AE, $01, $02, $37, $75, $A2, $0B, $A6
DATA_11FA48:         db $75, $BC, $02, $C4, $30, $F4, $02, $C4
DATA_11FA50:         db $30, $A9, $02, $C4, $30, $23, $02, $C4
DATA_11FA58:         db $20, $B5, $02, $C4, $20, $16, $04, $C4
DATA_11FA60:         db $10, $86, $02, $C4, $00, $C4, $02, $48
DATA_11FA68:         db $00, $90, $04, $00, $48, $40, $A0, $04
DATA_11FA70:         db $02, $48, $40, $70, $03, $02, $48, $40
DATA_11FA78:         db $40, $02, $02, $48, $40, $AB, $04, $02
DATA_11FA80:         db $48, $40, $7C, $03, $02, $48, $40, $4D
DATA_11FA88:         db $02, $02, $C5, $03, $B7, $6A, $FF

; level 98 screen exit data
DATA_11FA8F:         db $40, $35, $D7, $12, $00, $00, $98, $35
DATA_11FA97:         db $05, $02, $73, $98, $57, $02, $04, $05
DATA_11FA9F:         db $98, $37, $7B, $05, $75, $B9, $03, $73
DATA_11FAA7:         db $02, $FF

; level B9 header
DATA_11FAA9:         db $C3, $18, $C3, $26, $79, $80, $28, $A3
DATA_11FAB1:         db $1D, $E0

; level B9 object data
DATA_11FAB3:         db $00, $70, $D4, $9A, $D2, $70, $D5, $1A
DATA_11FABB:         db $CE, $72, $84, $FC, $CE, $73, $85, $04
DATA_11FAC3:         db $CE, $74, $60, $FA, $48, $70, $00, $20
DATA_11FACB:         db $00, $48, $70, $10, $01, $05, $A6, $70
DATA_11FAD3:         db $31, $03, $48, $70, $90, $02, $06, $48
DATA_11FADB:         db $70, $50, $04, $01, $48, $70, $70, $05
DATA_11FAE3:         db $01, $48, $70, $17, $19, $07, $48, $70
DATA_11FAEB:         db $99, $16, $01, $D2, $75, $80, $03, $4E
DATA_11FAF3:         db $70, $76, $00, $01, $CE, $75, $84, $03
DATA_11FAFB:         db $CE, $75, $9A, $FE, $CE, $76, $9C, $03
DATA_11FB03:         db $A7, $72, $95, $0F, $00, $CE, $77, $A2
DATA_11FB0B:         db $FE, $CE, $78, $91, $02, $CE, $69, $F0
DATA_11FB13:         db $F4, $D2, $7A, $37, $04, $00, $6A, $EE
DATA_11FB1B:         db $FD, $00, $6B, $E1, $FD, $CE, $7A, $1D
DATA_11FB23:         db $FF, $D2, $7C, $30, $04, $CE, $6C, $BC
DATA_11FB2B:         db $F9, $6B, $6C, $CE, $31, $13, $00, $7E
DATA_11FB33:         db $11, $FF, $00, $7F, $11, $FF, $00, $68
DATA_11FB3B:         db $EE, $FD, $00, $7D, $1E, $FE, $CE, $7C
DATA_11FB43:         db $76, $05, $CE, $7B, $A0, $FF, $CE, $7A
DATA_11FB4B:         db $AD, $01, $CE, $79, $AC, $FF, $CE, $79
DATA_11FB53:         db $A9, $01, $00, $6E, $BE, $82, $A7, $74
DATA_11FB5B:         db $90, $0F, $00, $A7, $75, $9D, $0C, $00
DATA_11FB63:         db $C4, $70, $B9, $16, $C4, $72, $B5, $0F
DATA_11FB6B:         db $C4, $74, $B0, $0F, $C4, $75, $BC, $0F
DATA_11FB73:         db $48, $70, $10, $04, $01, $C6, $77, $66
DATA_11FB7B:         db $FE, $C6, $77, $6E, $02, $C4, $77, $58
DATA_11FB83:         db $04, $C4, $69, $B7, $06, $C6, $6A, $E3
DATA_11FB8B:         db $02, $C6, $6B, $D1, $FE, $C4, $6B, $B4
DATA_11FB93:         db $04, $C6, $6B, $DB, $02, $68, $6D, $64
DATA_11FB9B:         db $03, $00, $FF

; level B9 screen exit data
DATA_11FB9E:         db $FF

; level 35 sprite data
DATA_11FB9F:         db $85, $ED, $E1, $86, $F1, $E7, $87, $EF
DATA_11FBA7:         db $EC, $88, $E7, $F1, $8B, $F5, $F6, $01
DATA_11FBAF:         db $F6, $D4, $8D, $F3, $FC, $85, $AD, $F8
DATA_11FBB7:         db $87, $A9, $E0, $87, $AB, $F3, $85, $AD
DATA_11FBBF:         db $DC, $8E, $B3, $D5, $90, $7C, $DB, $90
DATA_11FBC7:         db $40, $D8, $89, $99, $DB, $87, $99, $D7
DATA_11FBCF:         db $87, $95, $D4, $89, $87, $D4, $8B, $67
DATA_11FBD7:         db $D5, $89, $73, $DA, $88, $41, $DC, $89
DATA_11FBDF:         db $57, $D4, $89, $35, $D8, $8B, $8F, $D7
DATA_11FBE7:         db $8B, $5F, $D8, $8B, $59, $DC, $84, $20
DATA_11FBEF:         db $D7, $9B, $E6, $13, $93, $F1, $32, $FA
DATA_11FBF7:         db $EC, $3C, $10, $D8, $65, $93, $D3, $8B
DATA_11FBFF:         db $93, $CC, $89, $FA, $B0, $E8, $65, $CC
DATA_11FC07:         db $63, $65, $CC, $65, $65, $E2, $3F, $65
DATA_11FC0F:         db $E2, $41, $65, $EA, $ED, $65, $EA, $EF
DATA_11FC17:         db $C1, $2A, $D3, $4F, $34, $D6, $85, $AB
DATA_11FC1F:         db $E7, $FF, $FF

; level 6C sprite data
DATA_11FC22:         db $51, $D0, $14, $51, $D0, $19, $AF, $D1
DATA_11FC2A:         db $14, $65, $D0, $16, $65, $D0, $18, $51
DATA_11FC32:         db $D0, $37, $51, $D0, $3C, $5B, $D9, $37
DATA_11FC3A:         db $E2, $CD, $31, $5B, $D9, $39, $44, $D5
DATA_11FC42:         db $26, $44, $D5, $48, $51, $C0, $5D, $51
DATA_11FC4A:         db $C0, $62, $6C, $C6, $6C, $01, $D6, $04
DATA_11FC52:         db $93, $98, $6C, $C1, $C4, $23, $65, $D0
DATA_11FC5A:         db $38, $65, $D0, $3A, $AF, $D1, $37, $AF
DATA_11FC62:         db $D1, $39, $AF, $D1, $3B, $65, $D2, $52
DATA_11FC6A:         db $65, $D2, $54, $65, $D2, $56, $AF, $CD
DATA_11FC72:         db $66, $AF, $CD, $6A, $65, $CC, $67, $65
DATA_11FC7A:         db $CC, $69, $FA, $D4, $68, $1E, $CC, $0F
DATA_11FC82:         db $1E, $CC, $1D, $1E, $D6, $42, $1E, $D6
DATA_11FC8A:         db $44, $C1, $C4, $4E, $4F, $92, $67, $FF
DATA_11FC92:         db $FF

; level 98 sprite data
DATA_11FC93:         db $89, $99, $08, $1A, $73, $11, $1A, $5B
DATA_11FC9B:         db $11, $1A, $43, $11, $1A, $33, $11, $1A
DATA_11FCA3:         db $2B, $11, $25, $72, $10, $25, $72, $10
DATA_11FCAB:         db $25, $5A, $10, $25, $5A, $10, $25, $42
DATA_11FCB3:         db $10, $25, $42, $10, $25, $42, $10, $25
DATA_11FCBB:         db $32, $10, $25, $32, $10, $D6, $7D, $10
DATA_11FCC3:         db $D6, $5F, $10, $D6, $41, $10, $D6, $23
DATA_11FCCB:         db $10, $25, $72, $10, $25, $5A, $10, $25
DATA_11FCD3:         db $5A, $10, $25, $42, $10, $25, $32, $10
DATA_11FCDB:         db $25, $32, $10, $25, $2A, $10, $25, $2A
DATA_11FCE3:         db $10, $1A, $2B, $39, $1A, $37, $33, $1A
DATA_11FCEB:         db $4B, $3C, $1A, $71, $3A, $1A, $7D, $3C
DATA_11FCF3:         db $1A, $89, $32, $1A, $AB, $32, $1A, $AB
DATA_11FCFB:         db $3D, $25, $2A, $38, $25, $36, $34, $25
DATA_11FD03:         db $4A, $3B, $25, $70, $3B, $25, $7C, $3B
DATA_11FD0B:         db $25, $88, $33, $25, $AA, $33, $25, $AA
DATA_11FD13:         db $3C, $25, $72, $10, $59, $2B, $0F, $1A
DATA_11FD1B:         db $39, $54, $1A, $4F, $5C, $1A, $6B, $53
DATA_11FD23:         db $1A, $C1, $54, $1A, $C1, $5B, $1A, $C5
DATA_11FD2B:         db $52, $1A, $C5, $5D, $1A, $77, $5D, $1A
DATA_11FD33:         db $8D, $53, $25, $38, $55, $25, $4E, $5B
DATA_11FD3B:         db $25, $6A, $54, $25, $76, $5C, $25, $8C
DATA_11FD43:         db $54, $25, $C4, $53, $25, $C0, $55, $25
DATA_11FD4B:         db $C0, $5A, $25, $C4, $5C, $FA, $0E, $03
DATA_11FD53:         db $1A, $65, $3C, $25, $64, $3B, $1A, $97
DATA_11FD5B:         db $39, $25, $96, $38, $C1, $E4, $54, $FA
DATA_11FD63:         db $E4, $5B, $84, $9E, $07, $FF, $FF

; level B9 sprite data
DATA_11FD6A:         db $8E, $F9, $06, $8E, $F9, $70, $8D, $F9
DATA_11FD72:         db $CB, $0D, $D6, $E5, $65, $EA, $79, $65
DATA_11FD7A:         db $EA, $7B, $65, $DA, $A0, $65, $CC, $D9
DATA_11FD82:         db $65, $CC, $DA, $FF, $FF

; freespace
DATA_11FD87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FD8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FD97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FD9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FDFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FE9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FECF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FED7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FEFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FF9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_11FFFF:         db $FF
