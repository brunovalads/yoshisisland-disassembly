org $068000

.init_slime

CODE_068000: LDA $18,x                                  ;$068000   | 
CODE_068002: BNE CODE_068064                            ;$068002   | 
CODE_068004: JSL CODE_03D406                            ;$068004   | 
CODE_068008: REP #$10                                   ;$068008   | 
CODE_06800A: LDA $7182,x                                ;$06800A   | 
CODE_06800D: STA $1094                                  ;$06800D   | 
CODE_068010: SEC                                        ;$068010   | 
CODE_068011: SBC #$0038                                 ;$068011   | 
CODE_068014: PHA                                        ;$068014   | 
CODE_068015: AND #$FF00                                 ;$068015   | 
CODE_068018: LSR A                                      ;$068018   | 
CODE_068019: LSR A                                      ;$068019   | 
CODE_06801A: LSR A                                      ;$06801A   | 
CODE_06801B: LSR A                                      ;$06801B   | 
CODE_06801C: STA $00                                    ;$06801C   | 
CODE_06801E: LDA $70E2,x                                ;$06801E   | 
CODE_068021: STA $1092                                  ;$068021   | 
CODE_068024: SEC                                        ;$068024   | 
CODE_068025: SBC #$0018                                 ;$068025   | 
CODE_068028: PHA                                        ;$068028   | 
CODE_068029: AND #$FF00                                 ;$068029   | 
CODE_06802C: XBA                                        ;$06802C   | 
CODE_06802D: ORA $00                                    ;$06802D   | 
CODE_06802F: TAX                                        ;$06802F   | 
CODE_068030: PLA                                        ;$068030   | 
CODE_068031: AND #$00F0                                 ;$068031   | 
CODE_068034: LSR A                                      ;$068034   | 
CODE_068035: LSR A                                      ;$068035   | 
CODE_068036: LSR A                                      ;$068036   | 
CODE_068037: STA $00                                    ;$068037   | 
CODE_068039: PLA                                        ;$068039   | 
CODE_06803A: AND #$00F0                                 ;$06803A   | 
CODE_06803D: ASL A                                      ;$06803D   | 
CODE_06803E: ORA $00                                    ;$06803E   | 
CODE_068040: STA $00                                    ;$068040   | 
CODE_068042: LDA $6CA9,x                                ;$068042   | 
CODE_068045: AND #$3F00                                 ;$068045   | 
CODE_068048: ASL A                                      ;$068048   | 
CODE_068049: CLC                                        ;$068049   | 
CODE_06804A: ADC $00                                    ;$06804A   | 
CODE_06804C: STA $00                                    ;$06804C   | 
CODE_06804E: TAX                                        ;$06804E   | 
CODE_06804F: LDA $7F8000,x                              ;$06804F   | 
CODE_068053: SEP #$10                                   ;$068053   | 
CODE_068055: LDX $12                                    ;$068055   | 
CODE_068057: CMP #$0174                                 ;$068057   | 
CODE_06805A: BEQ CODE_068060                            ;$06805A   | 
CODE_06805C: JML CODE_03A31E                            ;$06805C   | 

CODE_068060: LDA $00                                    ;$068060   | 
CODE_068062: STA $18,x                                  ;$068062   | 
CODE_068064: LDA $0CB2                                  ;$068064   | 
CODE_068067: BNE CODE_06805C                            ;$068067   | 
CODE_068069: LDA $6120                                  ;$068069   | 
CODE_06806C: CLC                                        ;$06806C   | 
CODE_06806D: ADC #$0030                                 ;$06806D   | 
CODE_068070: ASL A                                      ;$068070   | 
CODE_068071: STA $00                                    ;$068071   | 
CODE_068073: LSR A                                      ;$068073   | 
CODE_068074: CLC                                        ;$068074   | 
CODE_068075: ADC $70E2,x                                ;$068075   | 
CODE_068078: CLC                                        ;$068078   | 
CODE_068079: ADC #$0010                                 ;$068079   | 
CODE_06807C: SEC                                        ;$06807C   | 
CODE_06807D: SBC $611C                                  ;$06807D   | 
CODE_068080: CMP $00                                    ;$068080   | 
CODE_068082: BCS CODE_06809D                            ;$068082   | 
CODE_068084: LDA $7182,x                                ;$068084   | 
CODE_068087: SEC                                        ;$068087   | 
CODE_068088: SBC $611E                                  ;$068088   | 
CODE_06808B: SEC                                        ;$06808B   | 
CODE_06808C: SBC $6122                                  ;$06808C   | 
CODE_06808F: SEC                                        ;$06808F   | 
CODE_068090: SBC #$0041                                 ;$068090   | 
CODE_068093: BPL CODE_06809D                            ;$068093   | 
CODE_068095: LDA $60FC                                  ;$068095   | 
CODE_068098: AND #$0007                                 ;$068098   | 
CODE_06809B: BNE CODE_0680A4                            ;$06809B   | 
CODE_06809D: LDA #$0002                                 ;$06809D   | 
CODE_0680A0: STA $6F00,x                                ;$0680A0   | 
CODE_0680A3: RTL                                        ;$0680A3   | 

    INC $0CB2           ; $0680A4   |
    LDA #$0174          ; $0680A7   |
    JSL $0681A6         ; $0680AA   |
    LDA $04             ; $0680AE   |
    XBA                 ; $0680B0   |
    AND #$00E3          ; $0680B1   |
    STA $107E           ; $0680B4   |
    ORA #$0080          ; $0680B7   |
    STA $1080           ; $0680BA   |
    LDA $18,x           ; $0680BD   |
    STA $1090           ; $0680BF   |
    LDA $70E2,x         ; $0680C2   |
    CLC                 ; $0680C5   |
    ADC #$0008          ; $0680C6   |
    STA $70E2,x         ; $0680C9   |
    STZ $107C           ; $0680CC   |
    LDA #$0008          ; $0680CF   |
    STA $02             ; $0680D2   |
    LDA $7182,x         ; $0680D4   |
    CLC                 ; $0680D7   |
    ADC #$FFC8          ; $0680D8   |
    AND #$00F0          ; $0680DB   |
    ASL A               ; $0680DE   |
    ASL A               ; $0680DF   |
    STA $00             ; $0680E0   |
    LDA $70E2,x         ; $0680E2   |
    CLC                 ; $0680E5   |
    ADC #$FFE0          ; $0680E6   |
    AND #$01F0          ; $0680E9   |
    LSR A               ; $0680EC   |
    LSR A               ; $0680ED   |
    LSR A               ; $0680EE   |
    BIT #$0020          ; $0680EF   |
    BEQ CODE_0680F7     ; $0680F2   |
    EOR #$0420          ; $0680F4   |

CODE_0680F7:
    TSB $00             ; $0680F7   |
    LDA $00             ; $0680F9   |
    CLC                 ; $0680FB   |
    ADC #$6800          ; $0680FC   |
    STA $00             ; $0680FF   |
    STA $108E           ; $068101   |
    LDA #$0006          ; $068104   |
    STA $0E             ; $068107   |
    PHB                 ; $068109   |
    SEP #$20            ; $06810A   |
    LDA #$7E            ; $06810C   |
    PHA                 ; $06810E   |
    PLB                 ; $06810F   |
    REP #$30            ; $068110   |
    LDX $4800           ; $068112   |

CODE_068115:
    LDA $00             ; $068115   |
    STA $0000,x         ; $068117   |
    LDA #$0880          ; $06811A   |
    STA $0002,x         ; $06811D   |
    LDA #$0019          ; $068120   |
    STA $0004,x         ; $068123   |
    LDA #$107E          ; $068126   |
    STA $0005,x         ; $068129   |
    LDA #$0000          ; $06812C   |
    STA $0007,x         ; $06812F   |
    LDA #$000C          ; $068132   |
    STA $0008,x         ; $068135   |
    TXA                 ; $068138   |
    CLC                 ; $068139   |
    ADC #$000C          ; $06813A   |
    STA $000A,x         ; $06813D   |
    TAX                 ; $068140   |
    DEC $02             ; $068141   |
    BEQ CODE_06814F     ; $068143   |
    LDA $00             ; $068145   |
    CLC                 ; $068147   |
    ADC #$0020          ; $068148   |
    STA $00             ; $06814B   |
    BRA CODE_068115     ; $06814D   |

CODE_06814F:
    LDA $00             ; $06814F   |
    INC A               ; $068151   |
    STA $0000,x         ; $068152   |
    LDA #$0880          ; $068155   |
    STA $0002,x         ; $068158   |
    LDA #$0019          ; $06815B   |
    STA $0004,x         ; $06815E   |
    LDA #$1080          ; $068161   |
    STA $0005,x         ; $068164   |
    LDA #$0000          ; $068167   |
    STA $0007,x         ; $06816A   |
    LDA #$000A          ; $06816D   |
    STA $0008,x         ; $068170   |
    TXA                 ; $068173   |
    CLC                 ; $068174   |
    ADC #$000C          ; $068175   |
    STA $000A,x         ; $068178   |
    STA $4800           ; $06817B   |
    JSR CODE_0690D2     ; $06817E   |
    PLB                 ; $068181   |
    LDA #$0008          ; $068182   |
    STA $7A96,x         ; $068185   |
    LSR A               ; $068188   |
    STA $105E           ; $068189   |
    LDA #$E000          ; $06818C   |
    STA $1078           ; $06818F   |
    STZ $1070           ; $068192   |
    LDA #$0001          ; $068195   |
    STA $10B6           ; $068198   |
    LDA #$883A          ; $06819B   |
    STA $108C           ; $06819E   |
    LDY #$940C          ; $0681A1   |
    ROR $6B,x           ; $0681A4   |
    PHY                 ; $0681A6   |
    REP #$10            ; $0681A7   |
    TAY                 ; $0681A9   |
    AND #$FF00          ; $0681AA   |
    XBA                 ; $0681AD   |
    ASL A               ; $0681AE   |
    TAX                 ; $0681AF   |
    LDA $4C32A4,x       ; $0681B0   |
    STA $00             ; $0681B4   |
    TYA                 ; $0681B6   |
    AND #$00FF          ; $0681B7   |
    ASL A               ; $0681BA   |
    ASL A               ; $0681BB   |
    ASL A               ; $0681BC   |
    CLC                 ; $0681BD   |
    ADC $00             ; $0681BE   |
    TAX                 ; $0681C0   |
    LDA $4C33F2,x       ; $0681C1   |
    STA $04             ; $0681C5   |
    LDA $4C33F4,x       ; $0681C7   |
    STA $06             ; $0681CB   |
    LDA $4C33F6,x       ; $0681CD   |
    STA $08             ; $0681D1   |
    LDA $4C33F8,x       ; $0681D3   |
    STA $0A             ; $0681D7   |
    SEP #$10            ; $0681D9   |
    PLY                 ; $0681DB   |
    LDX $12             ; $0681DC   |
    RTL                 ; $0681DE   |

salvo_init_state_ptr:
DATA_0681DF:         dw $81FE                ; $00: salvo spawn
DATA_0681E1:         dw $823D                ; $01: door closing
DATA_0681E3:         dw $8292                ; $02: small slime falling to the ground, idle
DATA_0681E5:         dw $833D                ; $03: ??
DATA_0681E7:         dw $8347                ; $04: ??
DATA_0681E9:         dw $8362                ; $05: salvo dripping from ceiling
DATA_0681EB:         dw $82A2                ; $06: salvo bouncing back after spawning
DATA_0681ED:         dw $8384                ; $07: salvo growing

.init_salvo
    TXY                 ; $0681EF   |
    LDA $76,x           ; $0681F0   |
    ASL A               ; $0681F2   |
    TAX                 ; $0681F3   |
    JSR ($81DF,x)       ; $0681F4   |
    LDA #$0002          ; $0681F7   |
    STA $6F00,x         ; $0681FA   |
    RTL                 ; $0681FD   |

; $00: salvo spawn
    TYX                 ; $0681FE   |
    LDA $608C           ; $0681FF   |
    CMP #$01E0          ; $068202   |
    BMI CODE_06823C     ; $068205   |
    STZ $60A8           ; $068207   |
    STZ $60B4           ; $06820A   |
    JSL $04F74A         ; $06820D   |
    LDA #$0048          ; $068211   |
    JSL $03A34C         ; $068214   |
    LDA #$0010          ; $068218   |
    STA $70E2,y         ; $06821B   |
    LDA #$00F1          ; $06821E   |
    STA $004D           ; $068221   |
    LDA #$00DD          ; $068224   |
    JSL $03A364         ; $068227   |
    LDA #$0000          ; $06822B   |
    STA $7978,y         ; $06822E   |
    LDA #$0026          ; $068231   |
    STA $7902,y         ; $068234   |
    STZ $105A           ; $068237   |
    INC $76,x           ; $06823A   |

CODE_06823C:
    RTS                 ; $06823C   |

; $01: door closing
    TYX                 ; $06823D   |
    STZ $60C4           ; $06823E   |
    LDY $105A           ; $068241   |
    BEQ CODE_068291     ; $068244   |
    LDA #$0132          ; $068246   |
    JSL $03A364         ; $068249   |
    LDA #$0240          ; $06824D   |
    STA $70E2,y         ; $068250   |
    LDA #$0730          ; $068253   |
    STA $7182,y         ; $068256   |
    LDA #$0006          ; $068259   |
    STA $79D6,y         ; $06825C   |
    LDA $6FA2,y         ; $06825F   |
    ORA #$2000          ; $068262   |
    STA $6FA2,y         ; $068265   |
    SEP #$20            ; $068268   |
    LDA #$01            ; $06826A   |
    STA $74A2,y         ; $06826C   |
    LDA #$2E            ; $06826F   |
    STA $7042,y         ; $068271   |
    REP #$20            ; $068274   |
    LDA #$0009          ; $068276   |
    STA $004D           ; $068279   |
    LDX #$20            ; $06827C   |

CODE_06827E:
    LDA $702E8A,x       ; $06827E   |
    STA $7021BE,x       ; $068282   |
    DEX                 ; $068286   |
    DEX                 ; $068287   |
    BNE CODE_06827E     ; $068288   |
    LDX $12             ; $06828A   |
    STZ $105A           ; $06828C   |
    INC $76,x           ; $06828F   |

CODE_068291:
    RTS                 ; $068291   |

; $02: small slime falling to the ground, idle
    TYX                 ; $068292   |
    LDY $105A           ; $068293   |
    BEQ CODE_0682A1     ; $068296   |
    STZ $10B6           ; $068298   |
    LDY #$06            ; $06829B   |
    STY $76,x           ; $06829D   |
    INC $76,x           ; $06829F   |

CODE_0682A1:
    RTS                 ; $0682A1   |

; $06: salvo bouncing back after spawning
    TYX                 ; $0682A2   |
    JSL $03D5E4         ; $0682A3   |
    STZ $7ECC           ; $0682A7   |
    LDA $0039           ; $0682AA   |
    CLC                 ; $0682AD   |
    ADC #$00A8          ; $0682AE   |
    STA $70E2,x         ; $0682B1   |
    LDA #$0728          ; $0682B4   |
    STA $7182,x         ; $0682B7   |
    STA $1076           ; $0682BA   |
    LDA #$07B0          ; $0682BD   |
    STA $108A           ; $0682C0   |
    INC $0CB2           ; $0682C3   |
    LDY #$05            ; $0682C6   |
    STY $76,x           ; $0682C8   |
    LDA #$01D1          ; $0682CA   |
    JSL $008B21         ; $0682CD   |
    LDA $70E2,x         ; $0682D1   |
    STA $70A2,y         ; $0682D4   |
    LDA $7182,x         ; $0682D7   |
    CLC                 ; $0682DA   |
    ADC #$0006          ; $0682DB   |
    STA $7182,x         ; $0682DE   |
    STA $7142,y         ; $0682E1   |
    LDA $7182,x         ; $0682E4   |
    SEC                 ; $0682E7   |
    SBC $609C           ; $0682E8   |
    CLC                 ; $0682EB   |
    ADC #$0016          ; $0682EC   |
    STA $1062           ; $0682EF   |
    LDA #$FFFF          ; $0682F2   |
    STA $7782,y         ; $0682F5   |
    TYA                 ; $0682F8   |
    STA $7A38,x         ; $0682F9   |
    TXA                 ; $0682FC   |
    STA $7E4C,y         ; $0682FD   |
    STZ $105C           ; $068300   |
    STZ $105E           ; $068303   |
    STZ $1060           ; $068306   |
    STZ $1064           ; $068309   |
    STZ $1066           ; $06830C   |
    LDA #$0100          ; $06830F   |
    STA $1068           ; $068312   |
    STZ $106C           ; $068315   |
    STZ $1084           ; $068318   |
    STZ $1086           ; $06831B   |
    LDA #$B000          ; $06831E   |
    STA $1078           ; $068321   |
    STZ $106A           ; $068324   |
    LDA #$00E0          ; $068327   |
    STA $18,x           ; $06832A   |
    STZ $7900,x         ; $06832C   |
    STZ $1070           ; $06832F   |
    LDA #$0001          ; $068332   |
    STA $1082           ; $068335   |
    STZ $1088           ; $068338   |
    PLA                 ; $06833B   |
    RTL                 ; $06833C   |

; $03: ??
    LDA #$0016          ; $06833D   |
    REP #$10            ; $068340   |
    LDY #$2800          ; $068342   |
    BRA CODE_06834F     ; $068345   |

; $04: ??
    LDA #$0015          ; $068347   |
    REP #$10            ; $06834A   |
    LDY #$2C00          ; $06834C   |

CODE_06834F:
    PHA                 ; $06834F   |
    PHY                 ; $068350   |
    SEP #$10            ; $068351   |
    LDA #$0404          ; $068353   |
    TRB $0967           ; $068356   |
    REP #$10            ; $068359   |
    PLY                 ; $06835B   |
    PLA                 ; $06835C   |
    JSR CODE_068395     ; $06835D   |
    BRA CODE_06837F     ; $068360   |

; $05: salvo dripping from ceiling
    REP #$10            ; $068362   |
    LDA #$00DD          ; $068364   |
    LDY #$3400          ; $068367   |
    JSR CODE_068395     ; $06836A   |
    LDX #$06            ; $06836D   |

CODE_06836F:
    LDA $5FE344,x       ; $06836F   |
    STA $702D74,x       ; $068373   |
    STA $702008,x       ; $068377   |
    DEX                 ; $06837B   |
    DEX                 ; $06837C   |
    BPL CODE_06836F     ; $06837D   |

CODE_06837F:
    LDX $12             ; $06837F   |
    INC $76,x           ; $068381   |
    RTS                 ; $068383   |

; $07: salvo growing
    JSR CODE_068603     ; $068384   |
    LDY #$0F            ; $068387   |
    STY $4331           ; $068389   |
    INY                 ; $06838C   |
    STY $4341           ; $06838D   |
    LDX $12             ; $068390   |
    DEC $76,x           ; $068392   |
    RTS                 ; $068394   |

; salvo sub

CODE_068395:
    PHY                 ; $068395   |
    LDX #$6800          ; $068396   |
    JSL $00B756         ; $068399   |
    PLY                 ; $06839D   |
    LDX #$0070          ; $06839E   |
    STX $0001           ; $0683A1   |
    LDX #$6800          ; $0683A4   |
    JSL $00BEA6         ; $0683A7   |
    SEP #$10            ; $0683AB   |
    RTS                 ; $0683AD   |

salvo_main_state_ptr:
DATA_0683AE:         dw $8999                ; $00
DATA_0683B0:         dw $89B1                ; $01
DATA_0683B2:         dw $8A95                ; $02
DATA_0683B4:         dw $8B08                ; $03
DATA_0683B6:         dw $8999                ; $04
DATA_0683B8:         dw $8B59                ; $05
DATA_0683BA:         dw $8999                ; $06
DATA_0683BC:         dw $8B94                ; $07
DATA_0683BE:         dw $8BAD                ; $08
DATA_0683C0:         dw $8BC6                ; $09
DATA_0683C2:         dw $8C0B                ; $0A
DATA_0683C4:         dw $8C8A                ; $0B
DATA_0683C6:         dw $8D65                ; $0C
DATA_0683C8:         dw $8E80                ; $0D

.main_salvo
    LDA $18,x           ; $0683CA   |
    STA $3000           ; $0683CC   |
    LDY $1079           ; $0683CF   |
    TYA                 ; $0683D2   |
    STA $300C           ; $0683D3   |
    LDX #$0B            ; $0683D6   |
    LDA #$86B6          ; $0683D8   |
    JSL $7EDE44         ; $0683DB   | GSU init
    LDA #$0180          ; $0683DF   |
    STA $300C           ; $0683E2   |
    LDX #$0B            ; $0683E5   |
    LDA #$86B6          ; $0683E7   |
    JSL $7EDE44         ; $0683EA   | GSU init
    LDX $12             ; $0683EE   |
    LDA $3000           ; $0683F0   |
    STA $107A           ; $0683F3   |
    LDY $76,x           ; $0683F6   |
    CPY #$0C            ; $0683F8   |
    BPL CODE_068402     ; $0683FA   |
    JSR CODE_068442     ; $0683FC   |
    JSR CODE_068722     ; $0683FF   |

CODE_068402:
    JSR CODE_068622     ; $068402   |
    LDY $10B6           ; $068405   |
    BEQ CODE_068417     ; $068408   |
    LDY $60AC           ; $06840A   |
    CPY #$06            ; $06840D   |
    BNE CODE_068417     ; $06840F   |
    LDA #$0215          ; $068411   |
    STA $0967           ; $068414   |

CODE_068417:
    JSL $03AF23         ; $068417   |
    LDY $76,x           ; $06841B   |
    CPY #$0C            ; $06841D   |
    BEQ CODE_06842B     ; $06841F   |
    CPY #$0D            ; $068421   |
    BEQ CODE_068428     ; $068423   |
    JSR CODE_0687A5     ; $068425   |

CODE_068428:
    JSR CODE_068909     ; $068428   |

CODE_06842B:
    JSR CODE_06866E     ; $06842B   |
    TXY                 ; $06842E   |
    LDA $76,x           ; $06842F   |
    ASL A               ; $068431   |
    TAX                 ; $068432   |
    JSR ($83AE,x)       ; $068433   | main state
    LDA $106A           ; $068436   |
    BEQ CODE_06843E     ; $068439   |
    DEC $106A           ; $06843B   |

CODE_06843E:
    JSR CODE_0686C1     ; $06843E   |
    RTL                 ; $068441   |

; salvo sub

CODE_068442:
    LDY $76,x           ; $068442   |
    CPY #$05            ; $068444   |
    BEQ CODE_068452     ; $068446   |
    CPY #$0B            ; $068448   |
    BNE CODE_068464     ; $06844A   |
    LDY $1088           ; $06844C   |
    BEQ CODE_068464     ; $06844F   |
    RTS                 ; $068451   |

CODE_068452:
    STZ $600E           ; $068452   |
    STZ $6010           ; $068455   |
    LDY $7A38,x         ; $068458   |
    LDA $7142,y         ; $06845B   |
    SEC                 ; $06845E   |
    SBC $003B           ; $06845F   |
    BRA CODE_0684AA     ; $068462   |

CODE_068464:
    LDY $7A38,x         ; $068464   |
    LDA $79D8,y         ; $068467   |
    PHA                 ; $06846A   |
    AND #$00FF          ; $06846B   |
    TAY                 ; $06846E   |
    BPL CODE_068474     ; $06846F   |
    ORA #$FF00          ; $068471   |

CODE_068474:
    STA $600E           ; $068474   |
    PLA                 ; $068477   |
    AND #$FF00          ; $068478   |
    BPL CODE_068480     ; $06847B   |
    ORA #$00FF          ; $06847D   |

CODE_068480:
    XBA                 ; $068480   |
    STA $00             ; $068481   |
    LDA #$0028          ; $068483   |
    STA $3000           ; $068486   |
    LDA $107A           ; $068489   |
    STA $300C           ; $06848C   |
    LDX #$0B            ; $06848F   |
    LDA #$86B6          ; $068491   |
    JSL $7EDE44         ; $068494   | GSU init
    LDX $12             ; $068498   |
    LDA $00             ; $06849A   |
    SEC                 ; $06849C   |
    SBC $3000           ; $06849D   |
    SEC                 ; $0684A0   |
    SBC #$0008          ; $0684A1   |
    STA $6010           ; $0684A4   |
    LDA #$0000          ; $0684A7   |

CODE_0684AA:
    STA $3004           ; $0684AA   |
    LDA $1062           ; $0684AD   |
    STA $3006           ; $0684B0   |
    LDA $7680,x         ; $0684B3   |
    CLC                 ; $0684B6   |
    ADC #$0008          ; $0684B7   |
    STA $6000           ; $0684BA   |
    LDA $7682,x         ; $0684BD   |
    STA $6002           ; $0684C0   |
    LDA $107A           ; $0684C3   |
    STA $6006           ; $0684C6   |
    TXA                 ; $0684C9   |
    STA $6012           ; $0684CA   |
    LDA #$02C0          ; $0684CD   |
    SEC                 ; $0684D0   |
    SBC $18,x           ; $0684D1   |
    STA $3000           ; $0684D3   |
    LDY $1079           ; $0684D6   |
    TYA                 ; $0684D9   |
    STA $300C           ; $0684DA   |
    LDX #$0B            ; $0684DD   |
    LDA #$86B6          ; $0684DF   |
    JSL $7EDE44         ; $0684E2   | GSU init
    LDA $3000           ; $0684E6   |
    STA $6004           ; $0684E9   |
    LDA $1064           ; $0684EC   |
    STA $6008           ; $0684EF   |
    LDA $1066           ; $0684F2   |
    STA $600A           ; $0684F5   |
    LDA $1068           ; $0684F8   |
    STA $600C           ; $0684FB   |
    LDA $60B0           ; $0684FE   |
    STA $6014           ; $068501   |
    LDA $60B2           ; $068504   |
    STA $6016           ; $068507   |
    LDA $60C2           ; $06850A   |
    STA $6018           ; $06850D   |
    LDX #$0A            ; $068510   |
    LDA #$81C9          ; $068512   |
    JSL $7EDE91         ; $068515   |
    REP #$10            ; $068519   |
    JSL $00BE39         ; $06851B   |

; args to $00BE39
DATA_06851F:         dw $5040, $727E, $7033, $0348

    SEP #$30            ; $068527   |
    LDA $1076           ; $068529   |
    ORA $1077           ; $06852C   |
    BEQ CODE_06853C     ; $06852F   |
    LDA #$08            ; $068531   |
    TRB $095E           ; $068533   |
    LDY #$13            ; $068536   |
    LDA #$04            ; $068538   |
    BRA CODE_06854B     ; $06853A   |

CODE_06853C:
    LDY $10B6           ; $06853C   |
    BEQ CODE_068547     ; $06853F   |
    LDY #$10            ; $068541   |
    LDA #$07            ; $068543   |
    BRA CODE_06854B     ; $068545   |

CODE_068547:
    LDY #$12            ; $068547   |
    LDA #$05            ; $068549   |

CODE_06854B:
    STY $0967           ; $06854B   |
    STA $0968           ; $06854E   |
    LDA #$02            ; $068551   |
    STA $096B           ; $068553   |
    LDA #$20            ; $068556   |
    STA $096C           ; $068558   |
    LDA #$18            ; $06855B   |
    TSB $094A           ; $06855D   |
    REP #$20            ; $068560   |
    LDX $12             ; $068562   |
    JSR CODE_068591     ; $068564   |
    LDX $12             ; $068567   |
    LDA $6020           ; $068569   |
    STA $7900,x         ; $06856C   |
    LDY $76,x           ; $06856F   |
    CPY #$05            ; $068571   |
    BEQ CODE_068590     ; $068573   |
    LDY $7A38,x         ; $068575   |
    LDA $600E           ; $068578   |
    CLC                 ; $06857B   |
    ADC $70E2,x         ; $06857C   |
    STA $70E2,y         ; $06857F   |
    LDA $6010           ; $068582   |
    CLC                 ; $068585   |
    ADC $7182,x         ; $068586   |
    SEC                 ; $068589   |
    SBC #$0010          ; $06858A   |
    STA $7182,y         ; $06858D   |

CODE_068590:
    RTS                 ; $068590   |

; salvo sub

CODE_068591:
    LDY $10B6           ; $068591   |
    BEQ CODE_0685E0     ; $068594   |
    LDY $106A           ; $068596   |
    BEQ CODE_0685BE     ; $068599   |
    LDA $7AF6,x         ; $06859B   |
    BNE CODE_0685DF     ; $06859E   |
    LDA #$0004          ; $0685A0   |
    STA $7AF6,x         ; $0685A3   |
    LDA $702002         ; $0685A6   |
    EOR #$FFFF          ; $0685AA   |
    STA $702002         ; $0685AD   |
    STA $702D6E         ; $0685B1   |
    LDA $702004         ; $0685B5   |
    EOR #$FFFF          ; $0685B9   |
    BRA CODE_0685CC     ; $0685BC   |

CODE_0685BE:
    LDA #$637D          ; $0685BE   |
    STA $702002         ; $0685C1   |
    STA $702D6E         ; $0685C5   |
    LDA #$4A75          ; $0685C9   |

CODE_0685CC:
    STA $702004         ; $0685CC   |
    STA $702D70         ; $0685D0   |
    LDA #$0000          ; $0685D4   |
    STA $702006         ; $0685D7   |
    STA $702D72         ; $0685DB   |

CODE_0685DF:
    RTS                 ; $0685DF   |

CODE_0685E0:
    LDY $106A           ; $0685E0   |
    BEQ CODE_068603     ; $0685E3   |
    LDA $7AF6,x         ; $0685E5   |
    BNE CODE_068603     ; $0685E8   |
    LDA #$0004          ; $0685EA   |
    STA $7AF6,x         ; $0685ED   |
    LDX #$1C            ; $0685F0   |

CODE_0685F2:
    LDA $5FA56E,x       ; $0685F2   |
    STA $7020C0,x       ; $0685F6   |
    STA $7020E0,x       ; $0685FA   |
    DEX                 ; $0685FE   |
    DEX                 ; $0685FF   |
    BNE CODE_0685F2     ; $068600   |
    RTS                 ; $068602   |

CODE_068603:
    LDX #$1C            ; $068603   |

CODE_068605:
    LDA $5FE9C6,x       ; $068605   |
    STA $702E2C,x       ; $068609   |
    STA $7020C0,x       ; $06860D   |
    LDA $5FE9E2,x       ; $068611   |
    STA $702E4C,x       ; $068615   |
    STA $7020E0,x       ; $068619   |
    DEX                 ; $06861D   |
    DEX                 ; $06861E   |
    BNE CODE_068605     ; $06861F   |
    RTS                 ; $068621   |

; salvo sub

CODE_068622:
    LDY $1082           ; $068622   |
    BNE CODE_068631     ; $068625   |
    LDY $76,x           ; $068627   |
    CPY #$04            ; $068629   |
    BEQ CODE_068631     ; $06862B   |
    CPY #$03            ; $06862D   |
    BPL CODE_06866D     ; $06862F   |

CODE_068631:
    LDA $7860,x         ; $068631   |
    AND #$000C          ; $068634   |
    BEQ CODE_06866D     ; $068637   |
    CMP #$000C          ; $068639   |
    BEQ CODE_06866D     ; $06863C   |
    AND #$0008          ; $06863E   |
    LSR A               ; $068641   |
    LSR A               ; $068642   |
    DEC A               ; $068643   |
    CLC                 ; $068644   |
    ADC $70E2,x         ; $068645   |
    SEC                 ; $068648   |
    SBC $72C0,x         ; $068649   |
    STA $70E2,x         ; $06864C   |
    LDA $10BC           ; $06864F   |
    EOR #$FFFF          ; $068652   |
    INC A               ; $068655   |
    STA $10BC           ; $068656   |
    LDA $7220,x         ; $068659   |
    EOR #$FFFF          ; $06865C   |
    INC A               ; $06865F   |
    STA $7220,x         ; $068660   |
    LDA $75E0,x         ; $068663   |
    EOR #$FFFF          ; $068666   |
    INC A               ; $068669   |
    STA $75E0,x         ; $06866A   |

CODE_06866D:
    RTS                 ; $06866D   |

; salvo sub

CODE_06866E:
    LDY $1079           ; $06866E   |
    CPY #$4C            ; $068671   |
    BCS CODE_0686C0     ; $068673   |
    LDY $10B6           ; $068675   |
    BNE CODE_068683     ; $068678   |
    LDY $0B59           ; $06867A   |
    BNE CODE_068683     ; $06867D   |
    JSL $02A982         ; $06867F   |

CODE_068683:
    LDA $7860,x         ; $068683   |
    AND #$0001          ; $068686   |
    BEQ CODE_0686C0     ; $068689   |
    LDY $76,x           ; $06868B   |
    CPY #$09            ; $06868D   |
    BEQ CODE_0686C0     ; $06868F   |
    CPY #$0A            ; $068691   |
    BEQ CODE_0686C0     ; $068693   |
    CPY #$0B            ; $068695   |
    BEQ CODE_0686C0     ; $068697   |
    STZ $7220,x         ; $068699   |
    STZ $7540,x         ; $06869C   |
    LDA #$0040          ; $06869F   |
    STA $7A96,x         ; $0686A2   |
    LDA #$000A          ; $0686A5   |
    STA $76,x           ; $0686A8   |
    LDA #$FFFF          ; $0686AA   |
    STA $7AF8,x         ; $0686AD   |
    STA $0B7B           ; $0686B0   |
    LDY $10B6           ; $0686B3   |
    BNE CODE_0686C0     ; $0686B6   |
    DEC $76,x           ; $0686B8   |
    LDA #$0002          ; $0686BA   |
    STA $60AC           ; $0686BD   |

CODE_0686C0:
    RTS                 ; $0686C0   |

; salvo sub

CODE_0686C1:
    LDA $10B6           ; $0686C1   |
    ORA $1082           ; $0686C4   |
    ORA $0B59           ; $0686C7   |
    BNE CODE_06871D     ; $0686CA   |
    LDY $76,x           ; $0686CC   |
    CPY #$09            ; $0686CE   |
    BPL CODE_06871D     ; $0686D0   |
    LDA #$0132          ; $0686D2   |
    STA $3008           ; $0686D5   |
    INC A               ; $0686D8   |
    STA $300A           ; $0686D9   |
    LDX #$09            ; $0686DC   |
    LDA #$91DB          ; $0686DE   |
    JSL $7EDE44         ; $0686E1   | GSU init
    LDX $12             ; $0686E5   |
    LDY $300C           ; $0686E7   |
    BNE CODE_06871D     ; $0686EA   |
    LDX #$09            ; $0686EC   |
    LDA #$91D5          ; $0686EE   |
    JSL $7EDE44         ; $0686F1   | GSU init
    LDX $12             ; $0686F5   |
    LDY $300C           ; $0686F7   |
    BNE CODE_06871D     ; $0686FA   |
    LDA #$0132          ; $0686FC   |
    JSL $03A364         ; $0686FF   |
    BCC CODE_06871D     ; $068703   |
    LDA $10             ; $068705   |
    AND #$00FF          ; $068707   |
    CLC                 ; $06870A   |
    ADC #$01C8          ; $06870B   |
    STA $70E2,y         ; $06870E   |
    LDA #$0730          ; $068711   |
    STA $7182,y         ; $068714   |
    LDA #$0001          ; $068717   |
    STA $74A2,y         ; $06871A   |

CODE_06871D:
    RTS                 ; $06871D   |

DATA_06871E:         dw $FFFD, $FFFE

; salvo sub

CODE_068722:
    LDY $76,x           ; $068722   |
    CPY #$05            ; $068724   |
    BNE CODE_06872C     ; $068726   |
    STZ $7860,x         ; $068728   |
    RTS                 ; $06872B   |

CODE_06872C:
    LDY $7223,x         ; $06872C   |
    BMI CODE_068747     ; $06872F   |
    LDA $108A           ; $068731   |
    BMI CODE_068747     ; $068734   |
    CMP $7182,x         ; $068736   |
    BPL CODE_068747     ; $068739   |
    STA $7182,x         ; $06873B   |
    LDA $7860,x         ; $06873E   |
    ORA #$0001          ; $068741   |
    STA $7860,x         ; $068744   |

CODE_068747:
    LDY $1070           ; $068747   |
    BNE CODE_06877D     ; $06874A   |
    LDY #$BD00          ; $06874C   |
    JSL $021072         ; $06874F   |
    INY                 ; $068753   |
    INY                 ; $068754   |
    LDA $871E,y         ; $068755   |
    AND $7860,x         ; $068758   |
    STA $7860,x         ; $06875B   |
    AND #$0003          ; $06875E   |
    BEQ CODE_068796     ; $068761   |
    AND #$0002          ; $068763   |
    BEQ CODE_06878A     ; $068766   |
    LDA $7900,x         ; $068768   |
    SEC                 ; $06876B   |
    SBC #$0004          ; $06876C   |
    STA $1072           ; $06876F   |
    STZ $7222,x         ; $068772   |
    STZ $76,x           ; $068775   |
    STZ $7542,x         ; $068777   |
    INC $1070           ; $06877A   |

CODE_06877D:
    LDA $1072           ; $06877D   |
    CLC                 ; $068780   |
    ADC $7182,x         ; $068781   |
    SEC                 ; $068784   |
    SBC $7900,x         ; $068785   |
    BRA CODE_068793     ; $068788   |

CODE_06878A:
    LDA $7182,x         ; $06878A   |
    AND #$FFF0          ; $06878D   |
    ORA #$0001          ; $068790   |

CODE_068793:
    STA $7182,x         ; $068793   |

CODE_068796:
    LDA $7860,x         ; $068796   |
    AND #$0030          ; $068799   |
    LSR A               ; $06879C   |
    LSR A               ; $06879D   |
    ORA $7860,x         ; $06879E   |
    STA $7860,x         ; $0687A1   |
    RTS                 ; $0687A4   |

; salvo sub

CODE_0687A5:
    LDY $7D36,x         ; $0687A5   |
    DEY                 ; $0687A8   |
    BMI CODE_0687E8     ; $0687A9   |
    BEQ CODE_0687E8     ; $0687AB   |
    LDA $6F00,y         ; $0687AD   |
    CMP #$0010          ; $0687B0   |
    BNE CODE_0687E8     ; $0687B3   |
    LDA $7D38,y         ; $0687B5   |
    BEQ CODE_0687E8     ; $0687B8   |
    CPY $10BA           ; $0687BA   |
    BEQ CODE_0687C5     ; $0687BD   |
    STY $10BA           ; $0687BF   |
    STZ $10B8           ; $0687C2   |

CODE_0687C5:
    LDA $1078           ; $0687C5   |
    CMP #$4C00          ; $0687C8   |
    BCC CODE_0687E3     ; $0687CB   |
    LDA $76,x           ; $0687CD   |
    CMP #$0003          ; $0687CF   |
    BEQ CODE_0687E3     ; $0687D2   |
    CMP #$0009          ; $0687D4   |
    BEQ CODE_0687E3     ; $0687D7   |
    CMP #$000A          ; $0687D9   |
    BEQ CODE_0687E3     ; $0687DC   |
    CMP #$000B          ; $0687DE   |
    BNE CODE_0687EE     ; $0687E1   |

CODE_0687E3:
    TYX                 ; $0687E3   |
    JSL $03B24B         ; $0687E4   |

CODE_0687E8:
    LDY #$FF            ; $0687E8   |
    STY $10BA           ; $0687EA   |
    RTS                 ; $0687ED   |

CODE_0687EE:
    LDA #$0020          ; $0687EE   |
    STA $106A           ; $0687F1   |
    LDA $7A98,x         ; $0687F4   |
    BNE CODE_0687E8     ; $0687F7   |
    LDA $70E2,y         ; $0687F9   | \
    STA $00             ; $0687FC   |  | store colliding sprite's location for later
    LDA $7182,y         ; $0687FE   |  |
    STA $02             ; $068801   | /
    LDA $7542,y         ; $068803   |
    STA $04             ; $068806   |
    LDA #$003B          ; $068808   |\ play sound #$003B
    JSL $0085D2         ; $06880B   |/
    LDA $10B8           ; $06880F   | slime generation timer
    AND #$0003          ; $068812   | every 4 frames a slime spawns
    ORA $10B6           ; $068815   |
    BNE CODE_06886C     ; $068818   |
    LDA #$0132          ; $06881A   |
    STA $3008           ; $06881D   |
    INC A               ; $068820   |
    STA $300A           ; $068821   |
    LDX #$09            ; $068824   |
    LDA #$91DB          ; $068826   |
    JSL $7EDE44         ; $068829   | GSU init
    LDX $12             ; $06882D   |
    LDY $300C           ; $06882F   |
    CPY #$06            ; $068832   |
    BPL CODE_06886C     ; $068834   |
    LDA #$0132          ; $068836   |
    JSL $03A364         ; $068839   |
    BCC CODE_06886C     ; $06883D   |
    SEP #$20            ; $06883F   |
    LDA #$02            ; $068841   |
    STA $79D6,y         ; $068843   |
    LDA #$10            ; $068846   |
    STA $7AF6,y         ; $068848   |
    LDA $6FA1,y         ; $06884B   |
    AND #$F9            ; $06884E   |
    STA $6FA1,y         ; $068850   |
    LDA #$01            ; $068853   |
    STA $74A2,y         ; $068855   |
    LDA #$2E            ; $068858   |
    STA $7042,y         ; $06885A   |
    LDA #$40            ; $06885D   |
    STA $7542,y         ; $06885F   |
    REP #$20            ; $068862   |
    TYA                 ; $068864   |
    CLC                 ; $068865   |
    ADC #$0040          ; $068866   |
    TAY                 ; $068869   |
    BRA CODE_068879     ; $06886A   |

CODE_06886C:
    LDA #$0217          ; $06886C   |
    JSL $008B21         ; $06886F   |
    LDA #$FFFF          ; $068873   |
    STA $7782,y         ; $068876   |

CODE_068879:
    LDA $00             ; $068879   | \
    STA $70A2,y         ; $06887B   |  | set slime's location to colliding sprite's
    LDA $02             ; $06887E   |  |
    STA $7142,y         ; $068880   | /
    SEP #$20            ; $068883   |
    LDA #$FF            ; $068885   |
    STA $7823,y         ; $068887   |
    REP #$20            ; $06888A   |
    LDA $10             ; $06888C   | rng
    PHA                 ; $06888E   |
    AND #$01FF          ; $06888F   |
    SEC                 ; $068892   |
    SBC #$0100          ; $068893   | rand [-256, 256)
    STA $71E0,y         ; $068896   | -> x velocity
    BMI CODE_0688A1     ; $068899   |
    LDA #$0002          ; $06889B   | face right if velocity positive
    STA $73C0,y         ; $06889E   |

CODE_0688A1:
    PLA                 ; $0688A1   | \
    XBA                 ; $0688A2   |  |
    AND #$03FF          ; $0688A3   |  | -rand [0, 1024)
    EOR #$FFFF          ; $0688A6   |  | -> y velocity
    INC A               ; $0688A9   |  |
    STA $71E2,y         ; $0688AA   | /
    INC $10B8           ; $0688AD   |
    LDY $1084           ; $0688B0   |
    BNE CODE_0688E3     ; $0688B3   |
    INC $1084           ; $0688B5   |
    LDY #$02            ; $0688B8   |
    STY $1086           ; $0688BA   |
    LDY $76,x           ; $0688BD   |
    CPY #$02            ; $0688BF   |
    BNE CODE_0688CF     ; $0688C1   |
    LDA #$0003          ; $0688C3   |
    STA $106C           ; $0688C6   |
    STZ $7220,x         ; $0688C9   |
    STZ $7540,x         ; $0688CC   |

CODE_0688CF:
    LDA $7220,x         ; $0688CF   |
    EOR #$FFFF          ; $0688D2   |
    INC A               ; $0688D5   |
    STA $7220,x         ; $0688D6   |
    LDA $75E0,x         ; $0688D9   |
    EOR #$FFFF          ; $0688DC   |
    INC A               ; $0688DF   |
    STA $75E0,x         ; $0688E0   |

CODE_0688E3:
    LDA $1078           ; $0688E3   |
    SEC                 ; $0688E6   |
    SBC #$0300          ; $0688E7   |
    CMP #$4C00          ; $0688EA   |
    BCS CODE_0688F2     ; $0688ED   |
    LDA #$4BFF          ; $0688EF   |

CODE_0688F2:
    STA $1078           ; $0688F2   |
    LDY #$02            ; $0688F5   |
    LDA $04             ; $0688F7   |
    CMP #$0040          ; $0688F9   |
    BPL CODE_068900     ; $0688FC   |
    LDY #$01            ; $0688FE   |

CODE_068900:
    TYA                 ; $068900   |
    STA $7A98,x         ; $068901   |

CODE_068904:
    RTS                 ; $068904   |

DATA_068905:         dw $0080, $FF80

; salvo sub

CODE_068909:
    LDA $601A           ; $068909   |
    BEQ CODE_068904     ; $06890C   |
    STZ $60D4           ; $06890E   |
    BIT #$0001          ; $068911   |
    BEQ CODE_06891B     ; $068914   |
    BIT #$000E          ; $068916   |
    BEQ CODE_068953     ; $068919   |

CODE_06891B:
    LDY $77C2,x         ; $06891B   |
    LDA $8905,y         ; $06891E   |
    SEC                 ; $068921   |
    SBC $7C16,x         ; $068922   |
    CMP #$8000          ; $068925   |
    ROR A               ; $068928   |
    STA $00             ; $068929   |
    LDY $76,x           ; $06892B   |
    CPY #$09            ; $06892D   |
    BEQ CODE_068953     ; $06892F   |
    CPY #$0A            ; $068931   |
    BEQ CODE_068953     ; $068933   |
    CPY #$0B            ; $068935   |
    BEQ CODE_068953     ; $068937   |
    LDA $60A8           ; $068939   |
    PHA                 ; $06893C   |
    CLC                 ; $06893D   |
    ADC #$0400          ; $06893E   |
    CMP #$0800          ; $068941   |
    BCS CODE_068952     ; $068944   |
    PLA                 ; $068946   |
    SEC                 ; $068947   |
    SBC $00             ; $068948   |
    STA $60A8           ; $06894A   |
    STA $60B4           ; $06894D   |
    BRA CODE_068953     ; $068950   |

CODE_068952:
    PLA                 ; $068952   |

CODE_068953:
    LDA $601A           ; $068953   |
    BIT #$0001          ; $068956   |
    BEQ CODE_068964     ; $068959   |
    LDA $60AA           ; $06895B   |
    BMI CODE_068964     ; $06895E   |
    LSR A               ; $068960   |
    STA $60AA           ; $068961   |

CODE_068964:
    LDY $77C3,x         ; $068964   |
    LDA $8905,y         ; $068967   |
    SEC                 ; $06896A   |
    SBC $7C18,x         ; $06896B   |
    STA $00             ; $06896E   |
    LDA $60AA           ; $068970   |
    PHA                 ; $068973   |
    CLC                 ; $068974   |
    ADC #$0200          ; $068975   |
    CMP #$0400          ; $068978   |
    BCS CODE_068997     ; $06897B   |
    PLA                 ; $06897D   |
    SEC                 ; $06897E   |
    SBC $00             ; $06897F   |
    SEC                 ; $068981   |
    SBC #$0080          ; $068982   |
    STA $60AA           ; $068985   |
    BPL CODE_068998     ; $068988   |
    LDA #$0006          ; $06898A   |
    STA $60C0           ; $06898D   |
    LDA #$8001          ; $068990   |
    STA $60D2           ; $068993   |
    RTS                 ; $068996   |

CODE_068997:
    PLA                 ; $068997   |

CODE_068998:
    RTS                 ; $068998   |

; salvo main $00, $04, $06
    TYX                 ; $068999   |
    JSR CODE_069114     ; $06899A   |
    LDA $1066           ; $06899D   |
    BEQ CODE_0689AC     ; $0689A0   |
    BMI CODE_0689A9     ; $0689A2   |
    DEC $1066           ; $0689A4   |
    BRA CODE_0689AC     ; $0689A7   |

CODE_0689A9:
    INC $1066           ; $0689A9   |

CODE_0689AC:
    RTS                 ; $0689AC   |

DATA_0689AD:         dw $0100
DATA_0689AF:         dw $FF00

; salvo main $01
    TYX                 ; $0689B1   |
    LDY $1082           ; $0689B2   |
    BNE CODE_0689D8     ; $0689B5   |
    LDA $1086           ; $0689B7   |
    BEQ CODE_0689E5     ; $0689BA   |
    LDY $1079           ; $0689BC   |
    CPY #$4C            ; $0689BF   |
    BCC CODE_0689D8     ; $0689C1   |
    BIT #$0001          ; $0689C3   |
    BNE CODE_0689D9     ; $0689C6   |
    STZ $7220,x         ; $0689C8   |
    STZ $7540,x         ; $0689CB   |
    LDA #$0002          ; $0689CE   |
    STA $106C           ; $0689D1   |
    LDY #$03            ; $0689D4   |
    STY $76,x           ; $0689D6   |

CODE_0689D8:
    RTS                 ; $0689D8   |

CODE_0689D9:
    LDA $1086           ; $0689D9   |
    AND #$0002          ; $0689DC   |
    TAY                 ; $0689DF   |
    LDA $89AD,y         ; $0689E0   |
    BRA CODE_068A1E     ; $0689E3   |

CODE_0689E5:
    LDA #$00C0          ; $0689E5   |
    LDY $77C2,x         ; $0689E8   |
    BNE CODE_0689F1     ; $0689EB   |
    EOR #$FFFF          ; $0689ED   |
    INC A               ; $0689F0   |

CODE_0689F1:
    STA $00             ; $0689F1   |
    LDA $7C16,x         ; $0689F3   |
    STA $02             ; $0689F6   |
    LDA $7860,x         ; $0689F8   |
    AND #$000C          ; $0689FB   |
    BEQ CODE_068A10     ; $0689FE   |
    SEC                 ; $068A00   |
    SBC #$0006          ; $068A01   |
    EOR $02             ; $068A04   |
    BMI CODE_068A10     ; $068A06   |
    LDA $00             ; $068A08   |
    EOR #$FFFF          ; $068A0A   |
    INC A               ; $068A0D   |
    STA $00             ; $068A0E   |

CODE_068A10:
    LDA $00             ; $068A10   |
    LDY $1084           ; $068A12   |
    BEQ CODE_068A1E     ; $068A15   |
    STZ $1084           ; $068A17   |
    EOR #$FFFF          ; $068A1A   |
    INC A               ; $068A1D   |

CODE_068A1E:
    STA $3000           ; $068A1E   |
    LDY $1079           ; $068A21   |
    TYA                 ; $068A24   |
    STA $00             ; $068A25   |
    LDA #$0200          ; $068A27   |
    SEC                 ; $068A2A   |
    SBC $00             ; $068A2B   |
    STA $300C           ; $068A2D   |
    LDX #$0B            ; $068A30   |
    LDA #$86B6          ; $068A32   |
    JSL $7EDE44         ; $068A35   | gsu
    LDX $12             ; $068A39   |
    LDA $3000           ; $068A3B   |
    STA $75E0,x         ; $068A3E   |
    LDY $1086           ; $068A41   |
    BEQ CODE_068A4F     ; $068A44   |
    STZ $1086           ; $068A46   |
    LDY #$04            ; $068A49   |
    STY $76,x           ; $068A4B   |
    BRA CODE_068A7D     ; $068A4D   |

CODE_068A4F:
    LDA $7C16,x         ; $068A4F   |
    CLC                 ; $068A52   |
    ADC #$0080          ; $068A53   |
    CMP #$0100          ; $068A56   |
    BCS CODE_068A7B     ; $068A59   |
    LDA $10             ; $068A5B   |
    BIT #$0003          ; $068A5D   |
    BEQ CODE_068A7B     ; $068A60   |
    STZ $106C           ; $068A62   |
    STZ $1066           ; $068A65   |
    LDA #$0010          ; $068A68   |
    STA $7540,x         ; $068A6B   |
    LDA #$0100          ; $068A6E   |
    STA $105C           ; $068A71   |
    STA $78,x           ; $068A74   |
    LDY #$02            ; $068A76   |
    STY $76,x           ; $068A78   |
    RTS                 ; $068A7A   |

CODE_068A7B:
    STZ $76,x           ; $068A7B   |

CODE_068A7D:
    LDA #$0400          ; $068A7D   |
    STA $105C           ; $068A80   |
    STA $78,x           ; $068A83   |
    LDA #$FCE0          ; $068A85   |
    STA $105E           ; $068A88   |
    LDA $75E0,x         ; $068A8B   |
    STA $10BC           ; $068A8E   |
    STZ $7540,x         ; $068A91   |
    RTS                 ; $068A94   |

; salvo main $02
    TYX                 ; $068A95   |
    LDA $78,x           ; $068A96   |
    CMP $105C           ; $068A98   |
    BNE CODE_068AA7     ; $068A9B   |
    LDA $75E0,x         ; $068A9D   |
    BMI CODE_068AAC     ; $068AA0   |

CODE_068AA2:
    INC $1066           ; $068AA2   |
    BRA CODE_068AAF     ; $068AA5   |

CODE_068AA7:
    LDA $75E0,x         ; $068AA7   |
    BMI CODE_068AA2     ; $068AAA   |

CODE_068AAC:
    DEC $1066           ; $068AAC   |

CODE_068AAF:
    JSR CODE_06914C     ; $068AAF   |
    LDY $1079           ; $068AB2   |
    CPY #$4C            ; $068AB5   |
    BCC CODE_068AF9     ; $068AB7   |
    TXA                 ; $068AB9   |
    STA $3002           ; $068ABA   |
    LDX #$09            ; $068ABD   |
    LDA #$8F33          ; $068ABF   |
    JSL $7EDE44         ; $068AC2   | gsu
    LDX $12             ; $068AC6   |
    LDY $3002           ; $068AC8   |
    BMI CODE_068AF9     ; $068ACB   |
    LDA $7CD6,y         ; $068ACD   |
    SEC                 ; $068AD0   |
    SBC $7CD6,x         ; $068AD1   |
    STA $00             ; $068AD4   |
    CLC                 ; $068AD6   |
    ADC #$0080          ; $068AD7   |
    CMP #$0100          ; $068ADA   |
    BCS CODE_068AF9     ; $068ADD   |
    LDA $00             ; $068ADF   |
    EOR $7220,y         ; $068AE1   |
    BPL CODE_068AF9     ; $068AE4   |
    LDA #$0001          ; $068AE6   |
    STA $76,x           ; $068AE9   |
    STA $1086           ; $068AEB   |
    LDA $00             ; $068AEE   |
    BMI CODE_068AF9     ; $068AF0   |
    LDA #$0003          ; $068AF2   |
    STA $1086           ; $068AF5   |
    RTS                 ; $068AF8   |

CODE_068AF9:
    LDA $7860,x         ; $068AF9   |
    BIT #$000C          ; $068AFC   |
    BEQ CODE_068B07     ; $068AFF   |
    LDA #$0003          ; $068B01   |
    STA $106C           ; $068B04   |

CODE_068B07:
    RTS                 ; $068B07   |

; salvo main $03
    TYX                 ; $068B08   |
    LDA $106C           ; $068B09   |
    BNE CODE_068B22     ; $068B0C   |
    LDA $1066           ; $068B0E   |
    BMI CODE_068B17     ; $068B11   |
    DEC $1066           ; $068B13   |
    RTS                 ; $068B16   |

CODE_068B17:
    LDY #$01            ; $068B17   |
    STY $76,x           ; $068B19   |
    STZ $1066           ; $068B1B   |
    STZ $1086           ; $068B1E   |
    RTS                 ; $068B21   |

CODE_068B22:
    LDA $106C           ; $068B22   |
    BIT #$0001          ; $068B25   |
    BNE CODE_068B3B     ; $068B28   |
    LDA $1068           ; $068B2A   |
    CLC                 ; $068B2D   |
    ADC #$0040          ; $068B2E   |
    STA $1068           ; $068B31   |
    CMP #$0800          ; $068B34   |
    BNE CODE_068B4D     ; $068B37   |
    BRA CODE_068B4A     ; $068B39   |

CODE_068B3B:
    LDA $1068           ; $068B3B   |
    SEC                 ; $068B3E   |
    SBC #$0040          ; $068B3F   |
    STA $1068           ; $068B42   |
    CMP #$0100          ; $068B45   |
    BNE CODE_068B4D     ; $068B48   |

CODE_068B4A:
    DEC $106C           ; $068B4A   |

CODE_068B4D:
    LDA $1066           ; $068B4D   |
    CMP #$0008          ; $068B50   |
    BCS CODE_068B58     ; $068B53   |
    INC $1066           ; $068B55   |

CODE_068B58:
    RTS                 ; $068B58   |

; salvo main $05
    TYX                 ; $068B59   |
    LDY $7A38,x         ; $068B5A   |
    LDA $7182,x         ; $068B5D   |
    SEC                 ; $068B60   |
    SBC $7142,y         ; $068B61   |
    CMP #$004A          ; $068B64   |
    BMI CODE_068B90     ; $068B67   |
    CMP #$004E          ; $068B69   |
    BPL CODE_068B7C     ; $068B6C   |
    LDA #$0018          ; $068B6E   |
    STA $7542,x         ; $068B71   |
    LDA #$0080          ; $068B74   |
    STA $75E2,x         ; $068B77   |
    BRA CODE_068B90     ; $068B7A   |

CODE_068B7C:
    STZ $1076           ; $068B7C   |
    LDA #$000C          ; $068B7F   |
    STA $7542,x         ; $068B82   |
    LDA #$0400          ; $068B85   |
    STA $75E2,x         ; $068B88   |
    INC $76,x           ; $068B8B   |
    JSR CODE_0690AA     ; $068B8D   |

CODE_068B90:
    JSR CODE_069114     ; $068B90   |
    RTS                 ; $068B93   |

; salvo main $07
    TYX                 ; $068B94   |
    LDA $7A96,x         ; $068B95   |
    BNE CODE_068BAC     ; $068B98   |
    LDA $1078           ; $068B9A   |
    CLC                 ; $068B9D   |
    ADC #$0240          ; $068B9E   |
    BMI CODE_068BA6     ; $068BA1   |
    LDA #$FFFF          ; $068BA3   |

CODE_068BA6:
    STA $1078           ; $068BA6   |
    JSR CODE_069114     ; $068BA9   |

CODE_068BAC:
    RTS                 ; $068BAC   |

; salvo main $08
    TYX                 ; $068BAD   |
    LDA $7A96,x         ; $068BAE   |
    BNE CODE_068BBD     ; $068BB1   |
    STZ $1082           ; $068BB3   |
    STZ $60AC           ; $068BB6   |
    LDY #$01            ; $068BB9   |
    STY $76,x           ; $068BBB   |

CODE_068BBD:
    RTS                 ; $068BBD   |

DATA_068BBE:         dw $0100
DATA_068BC0:         dw $0200
DATA_068BC2:         dw $0100
DATA_068BC4:         dw $FF00

; salvo main $09
    TYX                 ; $068BC6   |
    LDY #$00            ; $068BC7   |
    LDA $7C16,x         ; $068BC9   |
    CLC                 ; $068BCC   |
    ADC #$0050          ; $068BCD   |
    CMP #$00A0          ; $068BD0   |
    BCS CODE_068BDB     ; $068BD3   |
    STZ $617A           ; $068BD5   |
    INC $76,x           ; $068BD8   |
    RTS                 ; $068BDA   |

CODE_068BDB:
    BPL CODE_068BDF     ; $068BDB   |
    INY                 ; $068BDD   |
    INY                 ; $068BDE   |

CODE_068BDF:
    LDA $8BBE,y         ; $068BDF   |
    STA $617A           ; $068BE2   |
    LDA $60A8           ; $068BE5   |
    SEC                 ; $068BE8   |
    SBC $8BC2,y         ; $068BE9   |
    EOR $8BC2,y         ; $068BEC   |
    BMI CODE_068BFA     ; $068BEF   |
    LDA $8BC2,y         ; $068BF1   |
    STA $60A8           ; $068BF4   |
    STA $60B4           ; $068BF7   |

CODE_068BFA:
    RTS                 ; $068BFA   |

DATA_068BFB:         dw $0080
DATA_068BFD:         dw $0100
DATA_068BFF:         dw $0200
DATA_068C01:         dw $0400

DATA_068C03:         dw $FF80
DATA_068C05:         dw $FF00
DATA_068C07:         dw $FE00
DATA_068C09:         dw $FC00

; salvo main $0A
    TYX                 ; $068C0B   |
    LDA $7A96,x         ; $068C0C   |
    BNE CODE_068C72     ; $068C0F   |
    LDA #$0002          ; $068C11   |
    STA $7A96,x         ; $068C14   |
    LDA $10             ; $068C17   |
    AND #$000E          ; $068C19   |
    TAY                 ; $068C1C   |
    LDA $8BFB,y         ; $068C1D   |
    STA $00             ; $068C20   |
    LDA $11             ; $068C22   |
    AND #$0006          ; $068C24   |
    TAY                 ; $068C27   |
    LDA $8C03,y         ; $068C28   |
    STA $02             ; $068C2B   |
    LDA $10             ; $068C2D   |
    AND #$000F          ; $068C2F   |
    SEC                 ; $068C32   |
    SBC #$0008          ; $068C33   |
    STA $04             ; $068C36   |
    LDA #$003B          ; $068C38   |
    JSL $0085D2         ; $068C3B   |
    LDA #$0217          ; $068C3F   |
    JSL $008B21         ; $068C42   |
    LDA $70E2,x         ; $068C46   |
    CLC                 ; $068C49   |
    ADC $04             ; $068C4A   |
    STA $70A2,y         ; $068C4C   |
    LDA $7182,x         ; $068C4F   |
    SEC                 ; $068C52   |
    SBC #$0004          ; $068C53   |
    STA $7142,y         ; $068C56   |
    LDA #$FFFF          ; $068C59   |
    STA $7782,y         ; $068C5C   |
    LDA $00             ; $068C5F   |
    STA $71E0,y         ; $068C61   |
    LDA $02             ; $068C64   |
    STA $71E2,y         ; $068C66   |
    SEP #$20            ; $068C69   |
    LDA #$FF            ; $068C6B   |
    STA $7823,y         ; $068C6D   |
    REP #$20            ; $068C70   |

CODE_068C72:
    LDA $1078           ; $068C72   |
    SEC                 ; $068C75   |
    SBC #$0020          ; $068C76   |
    STA $1078           ; $068C79   |
    CMP #$2000          ; $068C7C   |
    BCS CODE_068C89     ; $068C7F   |
    LDA #$0040          ; $068C81   |
    STA $7A96,x         ; $068C84   |
    INC $76,x           ; $068C87   |

CODE_068C89:
    RTS                 ; $068C89   |

; salvo main $0B
    TYX                 ; $068C8A   |
    LDA $7A96,x         ; $068C8B   |
    BNE CODE_068C89     ; $068C8E   |
    INC $1088           ; $068C90   |
    LDY $1088           ; $068C93   |
    CPY #$01            ; $068C96   |
    BEQ CODE_068CBF     ; $068C98   |
    CPY #$02            ; $068C9A   |
    BEQ CODE_068CA6     ; $068C9C   |
    STZ $7ECC           ; $068C9E   |
    PLA                 ; $068CA1   |
    JMP CODE_0603A3     ; $068CA2   |

CODE_068CA6:
    LDA $70E2,x         ; $068CA6   |
    STA $00             ; $068CA9   |
    LDA $7182,x         ; $068CAB   |
    SEC                 ; $068CAE   |
    SBC #$0010          ; $068CAF   |
    STA $02             ; $068CB2   |
    JSL $02E1A3         ; $068CB4   |
    LDA #$00C0          ; $068CB8   |
    STA $7A96,x         ; $068CBB   |
    RTS                 ; $068CBE   |

CODE_068CBF:
    LDA $7A38,x         ; $068CBF   |
    TAX                 ; $068CC2   |
    LDA #$01C0          ; $068CC3   |
    JSL $008B21         ; $068CC6   |
    LDA $70E2,x         ; $068CCA   |
    STA $70A2,y         ; $068CCD   |
    LDA $7182,x         ; $068CD0   |
    STA $7142,y         ; $068CD3   |
    LDA #$0000          ; $068CD6   |
    STA $71E0,y         ; $068CD9   |
    LDA $7000,y         ; $068CDC   |
    AND #$FFFC          ; $068CDF   |
    STA $7000,y         ; $068CE2   |
    LDA #$FFC0          ; $068CE5   |
    STA $71E2,y         ; $068CE8   |
    LDA #$0002          ; $068CEB   |
    STA $7E4C,y         ; $068CEE   |
    LDA #$0006          ; $068CF1   |
    STA $7782,y         ; $068CF4   |
    JSL $03A31E         ; $068CF7   |
    LDA #$001C          ; $068CFB   |
    JSL $0085D2         ; $068CFE   |
    LDX #$08            ; $068D02   |
    LDA #$D46A          ; $068D04   |
    JSL $7EDE44         ; $068D07   | gsu
    REP #$10            ; $068D0B   |
    JSL $00BE39         ; $068D0D   |

; args to $00BE39
DATA_068D11:         dw $5040, $727E, $7033, $0348

    SEP #$10            ; $068D19   |
    LDX $12             ; $068D1B   |
    LDA #$0002          ; $068D1D   |
    STA $7A96,x         ; $068D20   |
    LDY $10B6           ; $068D23   |
    BEQ CODE_068D64     ; $068D26   |
    LDA #$0027          ; $068D28   |
    JSL $03A34C         ; $068D2B   |
    LDA $7A38,x         ; $068D2F   |
    TAX                 ; $068D32   |
    LDA $70E2,x         ; $068D33   |
    STA $70E2,y         ; $068D36   |
    LDA $7182,x         ; $068D39   |
    STA $7182,y         ; $068D3C   |
    LDA #$FB00          ; $068D3F   |
    STA $7222,y         ; $068D42   |
    LDA #$0001          ; $068D45   |
    STA $7D38,y         ; $068D48   |
    LDA $1092           ; $068D4B   |
    STA $7900,y         ; $068D4E   |
    LDA $1094           ; $068D51   |
    STA $7902,y         ; $068D54   |
    LDA #$0215          ; $068D57   |
    STA $0967           ; $068D5A   |
    LDX $12             ; $068D5D   |
    PLA                 ; $068D5F   |
    JMP CODE_0603A3     ; $068D60   |

CODE_068D64:
    RTS                 ; $068D64   |

; salvo main $0C
    TYX                 ; $068D65   |
    LDA $7A96,x         ; $068D66   |
    BNE CODE_068D7F     ; $068D69   |
    DEC $105E           ; $068D6B   |
    BEQ CODE_068D7A     ; $068D6E   |
    LDA #$0008          ; $068D70   |
    STA $7A96,x         ; $068D73   |
    JSR CODE_0690D2     ; $068D76   |
    RTS                 ; $068D79   |

CODE_068D7A:
    STZ $106E           ; $068D7A   |
    INC $76,x           ; $068D7D   |

CODE_068D7F:
    RTS                 ; $068D7F   |

; gsu table
DATA_068D80:         dw $B200
DATA_068D82:         dw $B20A
DATA_068D84:         dw $B30F
DATA_068D86:         dw $B412
DATA_068D88:         dw $B517
DATA_068D8A:         dw $B71B
DATA_068D8C:         dw $BA21
DATA_068D8E:         dw $BF28
DATA_068D90:         dw $C52F
DATA_068D92:         dw $C932
DATA_068D94:         dw $CC33
DATA_068D96:         dw $CF35
DATA_068D98:         dw $D438
DATA_068D9A:         dw $D838
DATA_068D9C:         dw $DB39
DATA_068D9E:         dw $DC3A
DATA_068DA0:         dw $E03A
DATA_068DA2:         dw $E13B
DATA_068DA4:         dw $E83B
DATA_068DA6:         dw $EA3A
DATA_068DA8:         dw $EC39
DATA_068DAA:         dw $EF38
DATA_068DAC:         dw $F136
DATA_068DAE:         dw $F531
DATA_068DB0:         dw $F72D
DATA_068DB2:         dw $FA27
DATA_068DB4:         dw $FB25
DATA_068DB6:         dw $FC1F
DATA_068DB8:         dw $FE19
DATA_068DBA:         dw $FF15
DATA_068DBC:         dw $FF0E
DATA_068DBE:         dw $000E
DATA_068DC0:         dw $0000
DATA_068DC2:         dw $00F1
DATA_068DC4:         dw $FFF1
DATA_068DC6:         dw $FFEB
DATA_068DC8:         dw $FEE7
DATA_068DCA:         dw $FCE0
DATA_068DCC:         dw $FBDB
DATA_068DCE:         dw $FAD9
DATA_068DD0:         dw $F7D3
DATA_068DD2:         dw $F5CF
DATA_068DD4:         dw $F1CA
DATA_068DD6:         dw $EFC8
DATA_068DD8:         dw $ECC7
DATA_068DDA:         dw $EAC6
DATA_068DDC:         dw $E8C5
DATA_068DDE:         dw $E1C5
DATA_068DE0:         dw $E0C6
DATA_068DE2:         dw $DCC6
DATA_068DE4:         dw $DBC7
DATA_068DE6:         dw $D8C8
DATA_068DE8:         dw $D4C8
DATA_068DEA:         dw $CFCB
DATA_068DEC:         dw $CCCD
DATA_068DEE:         dw $C9CE
DATA_068DF0:         dw $C5D2
DATA_068DF2:         dw $BFD8
DATA_068DF4:         dw $BADF
DATA_068DF6:         dw $B7E5
DATA_068DF8:         dw $B5E9
DATA_068DFA:         dw $B4EE
DATA_068DFC:         dw $B3F1
DATA_068DFE:         dw $B2F6

; gsu table
DATA_068E00:         dw $C100
DATA_068E02:         dw $C106
DATA_068E04:         dw $C10C
DATA_068E06:         dw $C112
DATA_068E08:         dw $C118
DATA_068E0A:         dw $C11E
DATA_068E0C:         dw $C124
DATA_068E0E:         dw $C12A
DATA_068E10:         dw $C12F
DATA_068E12:         dw $C52F
DATA_068E14:         dw $C92F
DATA_068E16:         dw $CD2F
DATA_068E18:         dw $D12F
DATA_068E1A:         dw $D52F
DATA_068E1C:         dw $D92F
DATA_068E1E:         dw $DD2F
DATA_068E20:         dw $E12F
DATA_068E22:         dw $E52F
DATA_068E24:         dw $E92F
DATA_068E26:         dw $ED2F
DATA_068E28:         dw $F12F
DATA_068E2A:         dw $F52F
DATA_068E2C:         dw $F92F
DATA_068E2E:         dw $FD2F
DATA_068E30:         dw $002F
DATA_068E32:         dw $002A
DATA_068E34:         dw $0024
DATA_068E36:         dw $001E
DATA_068E38:         dw $0018
DATA_068E3A:         dw $0012
DATA_068E3C:         dw $000C
DATA_068E3E:         dw $0006
DATA_068E40:         dw $0000
DATA_068E42:         dw $00FA
DATA_068E44:         dw $00F4
DATA_068E46:         dw $00EE
DATA_068E48:         dw $00E8
DATA_068E4A:         dw $00E2
DATA_068E4C:         dw $00DC
DATA_068E4E:         dw $00D6
DATA_068E50:         dw $00D0
DATA_068E52:         dw $FDD0
DATA_068E54:         dw $F9D0
DATA_068E56:         dw $F5D0
DATA_068E58:         dw $F1D0
DATA_068E5A:         dw $EDD0
DATA_068E5C:         dw $E9D0
DATA_068E5E:         dw $E5D0
DATA_068E60:         dw $E1D0
DATA_068E62:         dw $DDD0
DATA_068E64:         dw $D9D0
DATA_068E66:         dw $D5D0
DATA_068E68:         dw $D1D0
DATA_068E6A:         dw $CDD0
DATA_068E6C:         dw $C9D0
DATA_068E6E:         dw $C5D0
DATA_068E70:         dw $C1D0
DATA_068E72:         dw $C1D6
DATA_068E74:         dw $C1DC
DATA_068E76:         dw $C1E2
DATA_068E78:         dw $C1E8
DATA_068E7A:         dw $C1EE
DATA_068E7C:         dw $C1F4
DATA_068E7E:         dw $C1FA

; salvo main $0D
    TYX                 ; $068E80   |
    LDA $106E           ; $068E81   |
    BEQ CODE_068E89     ; $068E84   |
    JMP CODE_068F82     ; $068E86   |

CODE_068E89:
    PHA                 ; $068E89   |
    LDA #$0000          ; $068E8A   |
    JSL $0681A6         ; $068E8D   |
    LDA $04             ; $068E91   |
    LDX #$00            ; $068E93   |

CODE_068E95:
    STA $1096,x         ; $068E95   |
    INX                 ; $068E98   |
    INX                 ; $068E99   |
    CPX #$20            ; $068E9A   |
    BNE CODE_068E95     ; $068E9C   |
    LDA $108E           ; $068E9E   |
    STA $00             ; $068EA1   |
    LDA #$0008          ; $068EA3   |
    STA $02             ; $068EA6   |
    PHB                 ; $068EA8   |
    SEP #$20            ; $068EA9   |
    LDA #$7E            ; $068EAB   |
    PHA                 ; $068EAD   |
    PLB                 ; $068EAE   |
    REP #$30            ; $068EAF   |
    LDX #$4800          ; $068EB1   |
    INX                 ; $068EB4   |
    INX                 ; $068EB5   |

CODE_068EB6:
    LDA $00             ; $068EB6   |
    STA $0000,x         ; $068EB8   |
    LDA #$0180          ; $068EBB   |
    STA $0002,x         ; $068EBE   |
    LDA #$0018          ; $068EC1   |
    STA $0004,x         ; $068EC4   |
    LDA #$1096          ; $068EC7   |
    STA $0005,x         ; $068ECA   |
    LDA #$0000          ; $068ECD   |
    STA $0007,x         ; $068ED0   |
    LDA #$0018          ; $068ED3   |
    STA $0008,x         ; $068ED6   |
    TXA                 ; $068ED9   |
    CLC                 ; $068EDA   |
    ADC #$000C          ; $068EDB   |
    STA $000A,x         ; $068EDE   |
    TAX                 ; $068EE1   |
    DEC $02             ; $068EE2   |
    BEQ CODE_068EF0     ; $068EE4   |
    LDA $00             ; $068EE6   |
    CLC                 ; $068EE8   |
    ADC #$0020          ; $068EE9   |
    STA $00             ; $068EEC   |
    BRA CODE_068EB6     ; $068EEE   |

CODE_068EF0:
    TXA                 ; $068EF0   |
    STA $4800           ; $068EF1   |
    PLB                 ; $068EF4   |
    LDX $12             ; $068EF5   |
    LDA #$0004          ; $068EF7   |
    STA $0A             ; $068EFA   |
    LDA $108E           ; $068EFC   |
    SEC                 ; $068EFF   |
    SBC #$6800          ; $068F00   |
    STA $00             ; $068F03   |
    STA $08             ; $068F05   |
    LDA $7682,x         ; $068F07   |
    SEC                 ; $068F0A   |
    SBC #$0040          ; $068F0B   |

CODE_068F0E:
    STA $0E             ; $068F0E   |
    CMP #$0100          ; $068F10   |
    BCS CODE_068F47     ; $068F13   |
    LDY #$0006          ; $068F15   |
    LDX $12             ; $068F18   |
    LDA $7680,x         ; $068F1A   |
    SEC                 ; $068F1D   |
    SBC #$0028          ; $068F1E   |

CODE_068F21:
    STA $0C             ; $068F21   |
    CMP #$0130          ; $068F23   |
    BCS CODE_068F3A     ; $068F26   |
    LDA $00             ; $068F28   |
    BIT #$0400          ; $068F2A   |
    BEQ CODE_068F32     ; $068F2D   |
    EOR #$0420          ; $068F2F   |

CODE_068F32:
    TAX                 ; $068F32   |
    LDA #$0000          ; $068F33   |
    STA $70409E,x       ; $068F36   |

CODE_068F3A:
    LDA $0C             ; $068F3A   |
    CLC                 ; $068F3C   |
    ADC #$0010          ; $068F3D   |
    INC $00             ; $068F40   |
    INC $00             ; $068F42   |
    DEY                 ; $068F44   |
    BNE CODE_068F21     ; $068F45   |

CODE_068F47:
    LDA $08             ; $068F47   |
    CLC                 ; $068F49   |
    ADC #$0040          ; $068F4A   |
    STA $00             ; $068F4D   |
    STA $08             ; $068F4F   |
    LDA $0E             ; $068F51   |
    CLC                 ; $068F53   |
    ADC #$0010          ; $068F54   |
    DEC $0A             ; $068F57   |
    BNE CODE_068F0E     ; $068F59   |
    LDA #$0004          ; $068F5B   |
    STA $00             ; $068F5E   |
    LDX $1090           ; $068F60   |

CODE_068F63:
    PHX                 ; $068F63   |
    LDY #$0006          ; $068F64   |

CODE_068F67:
    LDA #$0000          ; $068F67   |
    STA $7F8000,x       ; $068F6A   |
    INX                 ; $068F6E   |
    INX                 ; $068F6F   |
    DEY                 ; $068F70   |
    BNE CODE_068F67     ; $068F71   |
    PLA                 ; $068F73   |
    CLC                 ; $068F74   |
    ADC #$0020          ; $068F75   |
    TAX                 ; $068F78   |
    DEC $00             ; $068F79   |
    BNE CODE_068F63     ; $068F7B   |
    SEP #$10            ; $068F7D   |
    LDX $12             ; $068F7F   |
    PLA                 ; $068F81   |

CODE_068F82:
    CMP #$0100          ; $068F82   |
    BMI CODE_068FF0     ; $068F85   |
    LDA #$0010          ; $068F87   |
    STA $7542,x         ; $068F8A   |
    LDA #$0400          ; $068F8D   |
    STA $75E2,x         ; $068F90   |
    INC $0CB2           ; $068F93   |
    LDA #$00A0          ; $068F96   |
    STA $18,x           ; $068F99   |
    STZ $7A36,x         ; $068F9B   |
    STZ $79D8,x         ; $068F9E   |
    STZ $7902,x         ; $068FA1   |
    LDY #$01            ; $068FA4   |
    STY $76,x           ; $068FA6   |
    STZ $105C           ; $068FA8   |
    STZ $105E           ; $068FAB   |
    STZ $1060           ; $068FAE   |
    STZ $1064           ; $068FB1   |
    STZ $1066           ; $068FB4   |
    LDA #$0100          ; $068FB7   |
    STA $1068           ; $068FBA   |
    STZ $106C           ; $068FBD   |
    STZ $1084           ; $068FC0   |
    STZ $1086           ; $068FC3   |
    LDA #$E000          ; $068FC6   |
    STA $1078           ; $068FC9   |
    STZ $106A           ; $068FCC   |
    STZ $1062           ; $068FCF   |
    LDA #$FFFF          ; $068FD2   |
    STA $108A           ; $068FD5   |
    STZ $7900,x         ; $068FD8   |
    STZ $1070           ; $068FDB   |
    STZ $1082           ; $068FDE   |
    STZ $1088           ; $068FE1   |
    STZ $1076           ; $068FE4   |
    STZ $106E           ; $068FE7   |
    STZ $1076           ; $068FEA   |
    JMP CODE_0690AA     ; $068FED   |

CODE_068FF0:
    LDA #$8E00          ; $068FF0   |
    STA $3002           ; $068FF3   |
    LDA #$8D80          ; $068FF6   |
    STA $3004           ; $068FF9   |
    LDA #$0006          ; $068FFC   |
    STA $3000           ; $068FFF   |
    LDA #$0040          ; $069002   |
    STA $3006           ; $069005   |
    LDA #$0021          ; $069008   |
    STA $3008           ; $06900B   |
    LDA #$449E          ; $06900E   |
    STA $300A           ; $069011   |
    LDA $106E           ; $069014   |
    STA $300C           ; $069017   |
    LDA $7680,x         ; $06901A   |
    CLC                 ; $06901D   |
    ADC #$0008          ; $06901E   |
    STA $6040           ; $069021   |
    LDA $7682,x         ; $069024   |
    STA $6042           ; $069027   |
    LDX #$08            ; $06902A   |
    LDA #$E93B          ; $06902C   |
    JSL $7EDE44         ; $06902F   |
    JSL $00BE39         ; $069033   |

; args to $00BE39
DATA_069037:         dw $5040, $727E, $7033, $0348

    LDA $12             ; $06903F   |
    STA $6012           ; $069041   |
    LDA $60B0           ; $069044   |
    STA $6014           ; $069047   |
    LDA $60B2           ; $06904A   |
    STA $6016           ; $06904D   |
    LDA $60C2           ; $069050   |
    STA $6018           ; $069053   |
    LDX #$0A            ; $069056   |
    LDA #$8390          ; $069058   |
    JSL $7EDE44         ; $06905B   | gsu
    SEP #$30            ; $06905F   |
    LDY #$10            ; $069061   |
    LDA #$07            ; $069063   |
    STY $0967           ; $069065   |
    STA $0968           ; $069068   |
    LDA #$02            ; $06906B   |
    STA $096B           ; $06906D   |
    LDA #$20            ; $069070   |
    STA $096C           ; $069072   |
    LDA #$18            ; $069075   |
    TSB $094A           ; $069077   |
    REP #$20            ; $06907A   |
    LDX $12             ; $06907C   |
    LDA #$637D          ; $06907E   |
    STA $702002         ; $069081   |
    STA $702D6E         ; $069085   |
    LDA #$4A75          ; $069089   |
    STA $702004         ; $06908C   |
    STA $702D70         ; $069090   |
    LDA #$0000          ; $069094   |
    STA $702006         ; $069097   |
    STA $702D72         ; $06909B   |
    LDA $106E           ; $06909F   |
    CLC                 ; $0690A2   |
    ADC #$0008          ; $0690A3   |
    STA $106E           ; $0690A6   |
    RTS                 ; $0690A9   |

; salvo sub

CODE_0690AA:
    LDA #$002E          ; $0690AA   |
    JSL $03A364         ; $0690AD   |
    BCC CODE_0690D1     ; $0690B1   |
    TXA                 ; $0690B3   |
    STA $7978,y         ; $0690B4   |
    TYA                 ; $0690B7   |
    STA $7A38,x         ; $0690B8   |
    LDA #$0002          ; $0690BB   |
    STA $7402,y         ; $0690BE   |
    LDA $70E2,x         ; $0690C1   |
    STA $70E2,y         ; $0690C4   |
    LDA $7182,x         ; $0690C7   |
    SEC                 ; $0690CA   |
    SBC #$0038          ; $0690CB   |
    STA $7182,y         ; $0690CE   |

CODE_0690D1:
    RTS                 ; $0690D1   |

; salvo sub

CODE_0690D2:
    REP #$10            ; $0690D2   |
    LDX $107C           ; $0690D4   |
    LDA $5FA1A8,x       ; $0690D7   |
    STA $702018         ; $0690DB   |
    STA $702D84         ; $0690DF   |
    LDA $5FA1AA,x       ; $0690E3   |
    STA $70201A         ; $0690E7   |
    STA $702D86         ; $0690EB   |
    LDA $5FA1AC,x       ; $0690EF   |
    STA $70201C         ; $0690F3   |
    STA $702D88         ; $0690F7   |
    LDA $5FA1AE,x       ; $0690FB   |
    STA $70201E         ; $0690FF   |
    STA $702D8A         ; $069103   |
    TXA                 ; $069107   |
    CLC                 ; $069108   |
    ADC #$0008          ; $069109   |
    STA $107C           ; $06910C   |
    SEP #$10            ; $06910F   |
    LDX $12             ; $069111   |
    RTS                 ; $069113   |

; salvo sub

CODE_069114:
    LDY $1070           ; $069114   |
    BEQ CODE_06911E     ; $069117   |
    LDA #$0002          ; $069119   |
    BRA CODE_069129     ; $06911C   |

CODE_06911E:
    LDA $7860,x         ; $06911E   |
    AND #$0003          ; $069121   |
    BEQ CODE_06915A     ; $069124   |
    AND #$0002          ; $069126   |

CODE_069129:
    STA $7902,x         ; $069129   |
    LDY $1060           ; $06912C   |
    BNE CODE_06914C     ; $06912F   |
    INC $1060           ; $069131   |
    LDA $7220,x         ; $069134   |
    STA $10BC           ; $069137   |
    STZ $7220,x         ; $06913A   |
    LDA $7A36,x         ; $06913D   |
    BMI CODE_069146     ; $069140   |
    EOR #$FFFF          ; $069142   |
    INC A               ; $069145   |

CODE_069146:
    STA $7A36,x         ; $069146   |
    JSR CODE_069176     ; $069149   |

CODE_06914C:
    JSR CODE_06919E     ; $06914C   |
    LDA $7A36,x         ; $06914F   |
    BPL CODE_06916C     ; $069152   |
    EOR #$FFFF          ; $069154   |
    INC A               ; $069157   |
    BRA CODE_06916C     ; $069158   |

CODE_06915A:
    STZ $7902,x         ; $06915A   |
    STZ $1060           ; $06915D   |
    LDA $7222,x         ; $069160   |
    STA $7A36,x         ; $069163   |
    BPL CODE_06916C     ; $069166   |
    EOR #$FFFF          ; $069168   |
    INC A               ; $06916B   |

CODE_06916C:
    LSR A               ; $06916C   |
    LSR A               ; $06916D   |
    LSR A               ; $06916E   |
    CLC                 ; $06916F   |
    ADC #$00A0          ; $069170   |
    STA $18,x           ; $069173   |
    RTS                 ; $069175   |

; salvo sub

CODE_069176:
    STA $300C           ; $069176   |
    LDA #$FF50          ; $069179   |
    STA $3000           ; $06917C   |
    LDX #$0B            ; $06917F   |
    LDA #$86B6          ; $069181   |
    JSL $7EDE44         ; $069184   |
    LDX $12             ; $069188   |
    LDA $3000           ; $06918A   |
    STA $105C           ; $06918D   |
    STA $78,x           ; $069190   |
    EOR #$FFFF          ; $069192   |
    INC A               ; $069195   |
    STA $105E           ; $069196   |
    RTS                 ; $069199   |

DATA_06919A:         dw $00C0
DATA_06919C:         dw $FF40

; salvo sub

CODE_06919E:
    LDY $76,x           ; $06919E   |
    CPY #$02            ; $0691A0   |
    BEQ CODE_0691AD     ; $0691A2   |
    CPY #$04            ; $0691A4   |
    BNE CODE_0691B2     ; $0691A6   |
    LDA #$4000          ; $0691A8   |
    BRA CODE_0691DD     ; $0691AB   |

CODE_0691AD:
    LDA #$0A00          ; $0691AD   |
    BRA CODE_0691DD     ; $0691B0   |

CODE_0691B2:
    LDA #$D000          ; $0691B2   |
    LDY $1086           ; $0691B5   |
    BEQ CODE_0691BD     ; $0691B8   |
    LDA #$CC00          ; $0691BA   |

CODE_0691BD:
    STA $300C           ; $0691BD   |
    LDY $1079           ; $0691C0   |
    TYA                 ; $0691C3   |
    SEC                 ; $0691C4   |
    SBC #$0100          ; $0691C5   |
    STA $3000           ; $0691C8   |
    LDX #$0B            ; $0691CB   |
    LDA #$86B6          ; $0691CD   |
    JSL $7EDE44         ; $0691D0   | gsu
    LDX $12             ; $0691D4   |
    LDA $3000           ; $0691D6   |
    CLC                 ; $0691D9   |
    ADC #$2000          ; $0691DA   |

CODE_0691DD:
    STA $00             ; $0691DD   |
    LDA $7A36,x         ; $0691DF   |
    BPL CODE_0691E8     ; $0691E2   |
    EOR #$FFFF          ; $0691E4   |
    INC A               ; $0691E7   |

CODE_0691E8:
    CLC                 ; $0691E8   |
    ADC $00             ; $0691E9   |
    ASL A               ; $0691EB   |
    AND #$FF00          ; $0691EC   |
    XBA                 ; $0691EF   |
    STA $0E             ; $0691F0   |
    LDA $78,x           ; $0691F2   |
    CMP $7A36,x         ; $0691F4   |
    BMI CODE_069237     ; $0691F7   |
    CMP $105C           ; $0691F9   |
    BEQ CODE_06922E     ; $0691FC   |
    LDY $76,x           ; $0691FE   |
    CPY #$02            ; $069200   |
    BEQ CODE_069218     ; $069202   |
    LDA $105E           ; $069204   |
    BEQ CODE_069213     ; $069207   |
    SEC                 ; $069209   |
    ROR A               ; $06920A   |
    CMP #$FFE0          ; $06920B   |
    BCC CODE_069213     ; $06920E   |
    LDA #$0000          ; $069210   |

CODE_069213:
    STA $105E           ; $069213   |
    BRA CODE_069229     ; $069216   |

CODE_069218:
    INC $106C           ; $069218   |
    LDA $106C           ; $06921B   |
    CMP #$0004          ; $06921E   |
    BNE CODE_069229     ; $069221   |
    STZ $7540,x         ; $069223   |
    DEC $76,x           ; $069226   |
    RTS                 ; $069228   |

CODE_069229:
    LDA $105C           ; $069229   |
    STA $78,x           ; $06922C   |

CODE_06922E:
    LDA $7A36,x         ; $06922E   |
    CLC                 ; $069231   |
    ADC $0E             ; $069232   |
    JMP CODE_0692B3     ; $069234   |

CODE_069237:
    CMP $105C           ; $069237   |
    BEQ CODE_06923F     ; $06923A   |
    JMP CODE_0692AD     ; $06923C   |

CODE_06923F:
    LDY $76,x           ; $06923F   |
    CPY #$02            ; $069241   |
    BEQ CODE_06925B     ; $069243   |
    LDA $105C           ; $069245   |
    BEQ CODE_06925B     ; $069248   |
    LSR A               ; $06924A   |
    CMP #$0020          ; $06924B   |
    BCS CODE_069253     ; $06924E   |
    LDA #$0000          ; $069250   |

CODE_069253:
    STA $105C           ; $069253   |
    LDA #$01D0          ; $069256   |
    BRA CODE_06925E     ; $069259   |

CODE_06925B:
    LDA #$0600          ; $06925B   |

CODE_06925E:
    STA $00             ; $06925E   |
    LDA $7A36,x         ; $069260   |
    BMI CODE_0692A8     ; $069263   |
    LDY $7902,x         ; $069265   |
    BNE CODE_069284     ; $069268   |
    LDY $76,x           ; $06926A   |
    CPY #$07            ; $06926C   |
    BEQ CODE_0692A8     ; $06926E   |
    LDY $1082           ; $069270   |
    BEQ CODE_06927C     ; $069273   |
    DEY                 ; $069275   |
    BNE CODE_06927C     ; $069276   |
    INC $1082           ; $069278   |
    ASL A               ; $06927B   |

CODE_06927C:
    CMP $00             ; $06927C   |
    BCC CODE_0692A8     ; $06927E   |
    EOR #$FFFF          ; $069280   |
    INC A               ; $069283   |

CODE_069284:
    STA $7222,x         ; $069284   |
    LDA #$0034          ; $069287   |
    JSL $0085D2         ; $06928A   |
    LDA $10BC           ; $06928E   |
    STA $7220,x         ; $069291   |
    STZ $1070           ; $069294   |
    LDA #$0010          ; $069297   |
    STA $7542,x         ; $06929A   |
    LDY $1082           ; $06929D   |
    BEQ CODE_0692E4     ; $0692A0   |
    LDA #$00C0          ; $0692A2   |
    STA $7220,x         ; $0692A5   |

CODE_0692A8:
    LDA $105E           ; $0692A8   |
    STA $78,x           ; $0692AB   |

CODE_0692AD:
    LDA $7A36,x         ; $0692AD   |
    SEC                 ; $0692B0   |
    SBC $0E             ; $0692B1   |

CODE_0692B3:
    STA $7A36,x         ; $0692B3   |
    LDA $105C           ; $0692B6   |
    ORA $105E           ; $0692B9   |
    BNE CODE_0692E4     ; $0692BC   |
    LDY $76,x           ; $0692BE   |
    CPY #$06            ; $0692C0   |
    BNE CODE_0692D3     ; $0692C2   |
    LDA #$FE00          ; $0692C4   |
    JSR CODE_069176     ; $0692C7   |
    LDA #$0020          ; $0692CA   |
    STA $7A96,x         ; $0692CD   |
    INC $76,x           ; $0692D0   |
    RTS                 ; $0692D2   |

CODE_0692D3:
    CPY #$07            ; $0692D3   |
    BNE CODE_0692E0     ; $0692D5   |
    LDA #$0040          ; $0692D7   |
    STA $7A96,x         ; $0692DA   |
    INC $76,x           ; $0692DD   |
    RTS                 ; $0692DF   |

CODE_0692E0:
    LDY #$01            ; $0692E0   |
    STY $76,x           ; $0692E2   |

CODE_0692E4:
    RTS                 ; $0692E4   |

.init_salvo_eyes
    RTL                 ; $0692E5   |

.main_salvo_eyes
    JSL $03AF23         ; $0692E6   |
    JSR CODE_069329     ; $0692EA   |
    LDA $7A96,x         ; $0692ED   |
    BNE CODE_069326     ; $0692F0   |
    LDA $76,x           ; $0692F2   |
    BEQ CODE_06931A     ; $0692F4   |
    BIT #$0001          ; $0692F6   |
    BNE CODE_069305     ; $0692F9   |
    DEC $7402,x         ; $0692FB   |
    LDA $7402,x         ; $0692FE   |
    BNE CODE_069312     ; $069301   |
    BRA CODE_069310     ; $069303   |

CODE_069305:
    INC $7402,x         ; $069305   |
    LDA $7402,x         ; $069308   |
    CMP #$0002          ; $06930B   |
    BNE CODE_069312     ; $06930E   |

CODE_069310:
    DEC $76,x           ; $069310   |

CODE_069312:
    LDA #$0004          ; $069312   |
    STA $7A96,x         ; $069315   |
    BRA CODE_069326     ; $069318   |

CODE_06931A:
    LDA $10             ; $06931A   |
    BIT #$001F          ; $06931C   |
    BNE CODE_069326     ; $06931F   |
    LDA #$0004          ; $069321   |
    STA $76,x           ; $069324   |

CODE_069326:
    INC $16,x           ; $069326   |
    RTL                 ; $069328   |

; salvo eyes sub

CODE_069329:
    LDA $78,x           ; $069329   |
    STA $0E             ; $06932B   |
    LDA $7C16,x         ; $06932D   |
    STA $3002           ; $069330   |
    LDA $7C18,x         ; $069333   |
    STA $3004           ; $069336   |
    LDX #$0B            ; $069339   |
    LDA #$BCF8          ; $06933B   |
    JSL $7EDE44         ; $06933E   | gsu
    REP #$10            ; $069342   |
    LDA $3002           ; $069344   |
    JSR CODE_069395     ; $069347   |
    SEP #$20            ; $06934A   |
    LDA $0E             ; $06934C   |
    CMP $02             ; $06934E   |
    BEQ CODE_06936C     ; $069350   |
    LDA $0E             ; $069352   |
    BMI CODE_069362     ; $069354   |
    LDA $02             ; $069356   |
    BMI CODE_06936A     ; $069358   |
    CMP $0E             ; $06935A   |
    BCC CODE_06936A     ; $06935C   |

CODE_06935E:
    INC $0E             ; $06935E   |
    BRA CODE_06936C     ; $069360   |

CODE_069362:
    LDA $02             ; $069362   |
    BPL CODE_06935E     ; $069364   |
    CMP $0E             ; $069366   |
    BCS CODE_06935E     ; $069368   |

CODE_06936A:
    DEC $0E             ; $06936A   |

CODE_06936C:
    LDA $0F             ; $06936C   |
    CMP $04             ; $06936E   |
    BEQ CODE_06938E     ; $069370   |
    LDA $0F             ; $069372   |
    BMI CODE_069382     ; $069374   |
    LDA $04             ; $069376   |
    BMI CODE_06938C     ; $069378   |
    CMP $0F             ; $06937A   |
    BCC CODE_06938C     ; $06937C   |

CODE_06937E:
    INC $0F             ; $06937E   |
    BRA CODE_06938E     ; $069380   |

CODE_069382:
    LDA $04             ; $069382   |
    BEQ CODE_06938E     ; $069384   |
    BPL CODE_06937E     ; $069386   |
    CMP $0F             ; $069388   |
    BCS CODE_06937E     ; $06938A   |

CODE_06938C:
    DEC $0F             ; $06938C   |

CODE_06938E:
    REP #$20            ; $06938E   |
    LDA $0E             ; $069390   |
    STA $78,x           ; $069392   |
    RTS                 ; $069394   |

; salvo eyes sub

CODE_069395:
    REP #$10            ; $069395   |
    ASL A               ; $069397   |
    TAX                 ; $069398   |
    PHX                 ; $069399   |
    LDA $00E954,x       ; $06939A   |
    SEP #$20            ; $06939E   |
    STA $211B           ; $0693A0   |
    XBA                 ; $0693A3   |
    STA $211B           ; $0693A4   |
    LDA #$10            ; $0693A7   |
    STA $211C           ; $0693A9   |
    LDA $2135           ; $0693AC   |
    STA $02             ; $0693AF   |
    BPL CODE_0693B7     ; $0693B1   |
    LDA #$FF            ; $0693B3   |
    BRA CODE_0693B9     ; $0693B5   |

CODE_0693B7:
    LDA #$00            ; $0693B7   |

CODE_0693B9:
    STA $03             ; $0693B9   |
    REP #$20            ; $0693BB   |
    PLX                 ; $0693BD   |
    LDA $00E9D4,x       ; $0693BE   |
    SEP #$20            ; $0693C2   |
    STA $211B           ; $0693C4   |
    XBA                 ; $0693C7   |
    STA $211B           ; $0693C8   |
    LDA #$10            ; $0693CB   |
    STA $211C           ; $0693CD   |
    LDA $2135           ; $0693D0   |
    STA $04             ; $0693D3   |
    BPL CODE_0693DB     ; $0693D5   |
    LDA #$FF            ; $0693D7   |
    BRA CODE_0693DD     ; $0693D9   |

CODE_0693DB:
    LDA #$00            ; $0693DB   |

CODE_0693DD:
    STA $05             ; $0693DD   |
    REP #$20            ; $0693DF   |
    SEP #$10            ; $0693E1   |
    LDX $12             ; $0693E3   |
    RTS                 ; $0693E5   |

.init_lemon_drop
    LDY #$05            ; $0693E6   |
    STY $76,x           ; $0693E8   |
    RTL                 ; $0693EA   |

DATA_0693EB:         dw $94F0
DATA_0693ED:         dw $9531
DATA_0693EF:         dw $9587
DATA_0693F1:         dw $95BC
DATA_0693F3:         dw $9625
DATA_0693F5:         dw $966D
DATA_0693F7:         dw $94F0
DATA_0693F9:         dw $9531
DATA_0693FB:         dw $96C0
DATA_0693FD:         dw $9703
DATA_0693FF:         dw $974F

.main_lemon_drop
    LDA $6F00,x         ; $069401   |
    CMP #$0010          ; $069404   |
    BEQ CODE_06941D     ; $069407   |

CODE_069409:
    LDA $60AC           ; $069409   |
    CMP #$0002          ; $06940C   |
    BNE CODE_06943E     ; $06940F   |
    CMP $78,x           ; $069411   |
    BNE CODE_06943E     ; $069413   |
    LDA #$0000          ; $069415   |
    STA $60AC           ; $069418   |
    BRA CODE_06943E     ; $06941B   |

CODE_06941D:
    LDA $7D96,x         ; $06941D   |
    BEQ CODE_069427     ; $069420   |
    STZ $6FA2,x         ; $069422   |
    BRA CODE_069409     ; $069425   |

CODE_069427:
    LDY $7D38,x         ; $069427   |
    BEQ CODE_06943E     ; $06942A   |
    LDA #$0002          ; $06942C   |
    STA $74A2,x         ; $06942F   |
    STZ $7402,x         ; $069432   |
    LDA #$FFFF          ; $069435   |
    STA $7900,x         ; $069438   |
    STA $7902,x         ; $06943B   |

CODE_06943E:
    JSL $03AF23         ; $06943E   |
    TXY                 ; $069442   |
    LDA $76,x           ; $069443   |
    ASL A               ; $069445   |
    TAX                 ; $069446   |
    JSR ($93EB,x)       ; $069447   |

    JSR CODE_06945F     ; $06944A   |
    LDA $7AF6,x         ; $06944D   |
    BNE CODE_06945B     ; $069450   |
    LDA $6FA0,x         ; $069452   |
    ORA #$0600          ; $069455   |
    STA $6FA0,x         ; $069458   |

CODE_06945B:
    JMP CODE_060DC0     ; $06945B   |

CODE_06945F:
    LDA $18,x           ; $06945F   |
    BNE CODE_069486     ; $069461   |
    LDY $7D36,x         ; $069463   |
    BPL CODE_0694E3     ; $069466   |
    LDY $76,x           ; $069468   |
    CPY #$03            ; $06946A   |
    BEQ CODE_0694E7     ; $06946C   |
    CPY #$04            ; $06946E   |
    BEQ CODE_0694E7     ; $069470   |
    LDA $7C18,x         ; $069472   |
    SEC                 ; $069475   |
    SBC $6122           ; $069476   |
    SEC                 ; $069479   |
    SBC $7BB8,x         ; $06947A   |
    CMP #$FFF8          ; $06947D   |
    BCS CODE_069487     ; $069480   |

CODE_069482:
    JSL $03A858         ; $069482   |

CODE_069486:
    RTS                 ; $069486   |

CODE_069487:
    LDY $60AB           ; $069487   |
    BMI CODE_0694E7     ; $06948A   |
    LDY $60C0           ; $06948C   |
    BEQ CODE_069482     ; $06948F   |
    LDA $7860,x         ; $069491   |
    AND #$0001          ; $069494   |
    BEQ CODE_0694E7     ; $069497   |
    LDA #$0020          ; $069499   |
    CMP $61D6           ; $06949C   |
    BMI CODE_0694A4     ; $06949F   |
    STA $61D6           ; $0694A1   |

CODE_0694A4:
    LDA $6086           ; $0694A4   |
    AND $0035           ; $0694A7   |
    STA $617A           ; $0694AA   |
    LDA $0037           ; $0694AD   |
    AND $6086           ; $0694B0   |
    STA $617C           ; $0694B3   |
    STZ $60D4           ; $0694B6   |
    LDA #$0002          ; $0694B9   |
    STA $60AC           ; $0694BC   |
    STA $78,x           ; $0694BF   |
    LDA #$7C60          ; $0694C1   |
    STA $6FA0,x         ; $0694C4   |
    STZ $60A8           ; $0694C7   |
    STZ $60B4           ; $0694CA   |
    STZ $60AA           ; $0694CD   |
    STZ $16,x           ; $0694D0   |
    STZ $7220,x         ; $0694D2   |
    LDA #$0004          ; $0694D5   |
    STA $7A98,x         ; $0694D8   |
    STA $7402,x         ; $0694DB   |
    LDY #$03            ; $0694DE   |
    STY $76,x           ; $0694E0   |
    RTS                 ; $0694E2   |

CODE_0694E3:
    JSL $03A5B7         ; $0694E3   |

CODE_0694E7:
    RTS                 ; $0694E7   |

DATA_0694E8:         db $08, $09, $00, $01

DATA_0694EC:         db $10, $06, $05, $04

    TYX                 ; $0694F0   |
    LDA $7A98,x         ; $0694F1   |
    BNE CODE_06951E     ; $0694F4   |
    INC $16,x           ; $0694F6   |
    LDY $16,x           ; $0694F8   |
    CPY #$05            ; $0694FA   |
    BNE CODE_06950C     ; $0694FC   |
    LDA #$0040          ; $0694FE   |
    STA $7542,x         ; $069501   |
    STZ $16,x           ; $069504   |
    STZ $7402,x         ; $069506   |
    INC $76,x           ; $069509   |
    RTS                 ; $06950B   |

CODE_06950C:
    LDA $94E7,y         ; $06950C   |
    AND #$00FF          ; $06950F   |
    STA $7402,x         ; $069512   |
    LDA $94EB,y         ; $069515   |
    AND #$00FF          ; $069518   |
    STA $7A98,x         ; $06951B   |

CODE_06951E:
    RTS                 ; $06951E   |

DATA_06951F:         db $01, $04, $05, $06, $01, $00, $02, $00
DATA_069527:         db $01

DATA_069528:         db $02, $02, $02, $02, $02, $02, $04, $02
DATA_069530:         db $30

    TYX                 ; $069531   |
    LDA $7860,x         ; $069532   |
    AND #$0001          ; $069535   |
    BEQ CODE_069582     ; $069538   |
    LDA $7A98,x         ; $06953A   |
    BNE CODE_069582     ; $06953D   |
    INC $16,x           ; $06953F   |
    LDY $16,x           ; $069541   |
    LDA $951E,y         ; $069543   |
    AND #$00FF          ; $069546   |
    STA $7402,x         ; $069549   |
    LDA $9527,y         ; $06954C   |
    AND #$00FF          ; $06954F   |
    STA $7A98,x         ; $069552   |
    CPY #$02            ; $069555   |
    BNE CODE_069561     ; $069557   |
    LDA #$0060          ; $069559   |\ play sound #$0060
    JSL $0085D2         ; $06955C   |/
    RTS                 ; $069560   |

CODE_069561:
    CPY #$09            ; $069561   |
    BMI CODE_069582     ; $069563   |
    LDA $7A98,x         ; $069565   |
    STA $7A96,x         ; $069568   |
    LDY $77C2,x         ; $06956B   |
    TYA                 ; $06956E   |
    STA $7400,x         ; $06956F   |
    INC $76,x           ; $069572   |
    LDY $76,x           ; $069574   |
    CPY #$08            ; $069576   |
    BNE CODE_069582     ; $069578   |
    LDA #$0007          ; $06957A   |
    STA $16,x           ; $06957D   |
    INC $1015           ; $06957F   |

CODE_069582:
    RTS                 ; $069582   |

DATA_069583:         dw $FFC0, $0040

    TYX                 ; $069587   |
    LDA $7A96,x         ; $069588   |
    BNE CODE_0695B5     ; $06958B   |
    STZ $18,x           ; $06958D   |
    LDA $7860,x         ; $06958F   |
    AND #$0001          ; $069592   |
    BEQ CODE_0695B5     ; $069595   |
    LDY $7400,x         ; $069597   |
    LDA $9583,y         ; $06959A   |
    STA $7220,x         ; $06959D   |
    LDA $7A98,x         ; $0695A0   |
    BNE CODE_0695B5     ; $0695A3   |
    LDA #$0004          ; $0695A5   |
    STA $7A98,x         ; $0695A8   |
    LDA $7402,x         ; $0695AB   |
    INC A               ; $0695AE   |
    AND #$0003          ; $0695AF   |
    STA $7402,x         ; $0695B2   |

CODE_0695B5:
    RTS                 ; $0695B5   |

DATA_0695B6:         dw $001A, $0018, $0014

    TYX                 ; $0695BC   |
    LDA $7A98,x         ; $0695BD   |
    BNE CODE_069606     ; $0695C0   |
    INC $16,x           ; $0695C2   |
    INC $16,x           ; $0695C4   |
    LDY $16,x           ; $0695C6   |
    CPY #$06            ; $0695C8   |
    BMI CODE_0695FD     ; $0695CA   |
    LDA #$0003          ; $0695CC   |
    STA $7A96,x         ; $0695CF   |
    LDA #$01D2          ; $0695D2   |
    JSL $008B21         ; $0695D5   |
    LDA $7CD6,x         ; $0695D9   |
    STA $70A2,y         ; $0695DC   |
    LDA $7CD8,x         ; $0695DF   |
    STA $7142,y         ; $0695E2   |
    LDA #$0005          ; $0695E5   |
    STA $73C2,y         ; $0695E8   |
    LDA #$0002          ; $0695EB   |
    STA $7782,y         ; $0695EE   |
    SEP #$20            ; $0695F1   |
    LDA #$FF            ; $0695F3   |
    STA $7823,y         ; $0695F5   |
    REP #$20            ; $0695F8   |
    INC $76,x           ; $0695FA   |
    RTS                 ; $0695FC   |

CODE_0695FD:
    LDA #$0004          ; $0695FD   |
    STA $7A98,x         ; $069600   |
    INC $7402,x         ; $069603   |

CODE_069606:
    LDA $60FC           ; $069606   |
    AND #$0007          ; $069609   |
    BNE CODE_069624     ; $06960C   |
    LDY $16,x           ; $06960E   |
    LDA $7182,x         ; $069610   |
    SEC                 ; $069613   |
    SBC $95B6,y         ; $069614   |
    SEC                 ; $069617   |
    SBC $6112           ; $069618   |
    STA $6090           ; $06961B   |
    STZ $60AA           ; $06961E   |
    INC $61B4           ; $069621   |

CODE_069624:
    RTS                 ; $069624   |

    TYX                 ; $069625   |
    LDA $7A96,x         ; $069626   |
    BNE CODE_069643     ; $069629   |
    LDA #$003B          ; $06962B   |\ play sound #$003B
    JSL $0085D2         ; $06962E   |/
    LDA #$0000          ; $069632   |
    STA $60AC           ; $069635   |
    STZ $617A           ; $069638   |
    STZ $617C           ; $06963B   |
    PLA                 ; $06963E   |
    JMP CODE_0603A3     ; $06963F   |

CODE_069643:
    LDA $7CD6,x         ; $069643   |
    STA $3002           ; $069646   |
    LDA $7CD8,x         ; $069649   |
    STA $3004           ; $06964C   |
    LDA #$0040          ; $06964F   |
    STA $3014           ; $069652   |
    LDA #$0200          ; $069655   |
    STA $6000           ; $069658   |
    LDA #$FE00          ; $06965B   |
    STA $6002           ; $06965E   |
    LDX #$09            ; $069661   |
    LDA #$9253          ; $069663   |
    JSL $7EDE44         ; $069666   | GSU init

    LDX $12             ; $06966A   |
    RTS                 ; $06966C   |

    TYX                 ; $06966D   |
    LDA $7900,x         ; $06966E   |
    CMP $7902,x         ; $069671   |
    BNE CODE_069691     ; $069674   |
    INC A               ; $069676   |
    BNE CODE_069691     ; $069677   |
    INC A               ; $069679   |
    STA $7402,x         ; $06967A   |
    INC A               ; $06967D   |
    STA $74A2,x         ; $06967E   |
    STA $76,x           ; $069681   |
    LDA #$0030          ; $069683   |
    STA $7A96,x         ; $069686   |
    LDY $77C2,x         ; $069689   |
    TYA                 ; $06968C   |
    STA $7400,x         ; $06968D   |
    RTS                 ; $069690   |

CODE_069691:
    LDA $7C16,x         ; $069691   |
    CLC                 ; $069694   |
    ADC #$0030          ; $069695   |
    CMP #$0060          ; $069698   |
    BCS CODE_0696B8     ; $06969B   |
    LDA #$FFFF          ; $06969D   |
    STA $7900,x         ; $0696A0   |
    STA $7902,x         ; $0696A3   |
    LDA #$0007          ; $0696A6   |
    STA $7402,x         ; $0696A9   |
    INC A               ; $0696AC   |
    STA $7A98,x         ; $0696AD   |
    LDA #$0002          ; $0696B0   |
    STA $74A2,x         ; $0696B3   |
    STZ $76,x           ; $0696B6   |

CODE_0696B8:
    RTS                 ; $0696B8   |

DATA_0696B9:         db $04, $05, $06, $05, $04, $00, $02

    TYX                 ; $0696C0   |
    LDA $1015           ; $0696C1   |
    BPL CODE_0696FE     ; $0696C4   |
    LDA $7A98,x         ; $0696C6   |
    BNE CODE_0696FE     ; $0696C9   |
    DEC $16,x           ; $0696CB   |
    BPL CODE_0696ED     ; $0696CD   |
    LDA #$0002          ; $0696CF   |
    STA $7402,x         ; $0696D2   |
    STA $16,x           ; $0696D5   |
    LDA #$FA00          ; $0696D7   |
    STA $7222,x         ; $0696DA   |
    STZ $7542,x         ; $0696DD   |
    STZ $7860,x         ; $0696E0   |
    INC $76,x           ; $0696E3   |
    LDA #$0013          ; $0696E5   |\ play sound #$0013
    JSL $0085D2         ; $0696E8   |/
    RTS                 ; $0696EC   |

CODE_0696ED:
    LDY $16,x           ; $0696ED   |
    LDA $96B9,y         ; $0696EF   |
    AND #$00FF          ; $0696F2   |
    STA $7402,x         ; $0696F5   |
    LDA #$0002          ; $0696F8   |
    STA $7A98,x         ; $0696FB   |

CODE_0696FE:
    RTS                 ; $0696FE   |

DATA_0696FF:         db $07, $08

DATA_069701:         db $08, $10

    TYX                 ; $069703   |
    LDA $7222,x         ; $069704   |
    BEQ CODE_069722     ; $069707   |
    LDA $7860,x         ; $069709   |
    AND #$0002          ; $06970C   |
    BEQ CODE_06974E     ; $06970F   |
    LDA $7182,x         ; $069711   |
    CLC                 ; $069714   |
    ADC #$0008          ; $069715   |
    AND #$FFF0          ; $069718   |
    STA $7182,x         ; $06971B   |
    STZ $7222,x         ; $06971E   |
    RTS                 ; $069721   |

CODE_069722:
    LDA $7A98,x         ; $069722   |
    BNE CODE_06974E     ; $069725   |
    DEC $16,x           ; $069727   |
    BPL CODE_06973A     ; $069729   |
    LDA #$0020          ; $06972B   |
    STA $7A96,x         ; $06972E   |
    LDA #$00FF          ; $069731   |
    STA $74A2,x         ; $069734   |
    INC $76,x           ; $069737   |
    RTS                 ; $069739   |

CODE_06973A:
    LDY $16,x           ; $06973A   |
    LDA $96FF,y         ; $06973C   |
    AND #$00FF          ; $06973F   |
    STA $7402,x         ; $069742   |
    LDA $9701,y         ; $069745   |
    AND #$00FF          ; $069748   |
    STA $7A98,x         ; $06974B   |

CODE_06974E:
    RTS                 ; $06974E   |

    TYX                 ; $06974F   |
    LDA $7A96,x         ; $069750   |
    BNE CODE_06975F     ; $069753   |
    STZ $1015           ; $069755   |
    INC $105A           ; $069758   |
    JSL $03A31E         ; $06975B   |

CODE_06975F:
    RTS                 ; $06975F   |

.init_burt
CODE_069760: JSL CODE_03AEEB                            ;$069760   | 
CODE_069764: LDY #$24                                   ;$069764   | 
CODE_069766: JSL CODE_0CE5D6                            ;$069766   | 
CODE_06976A: LDA #$0080                                 ;$06976A   | 
CODE_06976D: STA $7E1A                                  ;$06976D   | 
CODE_069770: LDA $7182,x                                ;$069770   | 
CODE_069773: CLC                                        ;$069773   | 
CODE_069774: ADC #$000F                                 ;$069774   | 
CODE_069777: STA $7182,x                                ;$069777   | 
CODE_06977A: LDA #$FFF8                                 ;$06977A   | 
CODE_06977D: STA $7A38,x                                ;$06977D   | 
CODE_069780: LDA #$0100                                 ;$069780   | 
CODE_069783: STA $18,x                                  ;$069783   | 
CODE_069785: STA $76,x                                  ;$069785   | 
CODE_069787: LDA $6FA2,x                                ;$069787   | 
CODE_06978A: ORA #$0001                                 ;$06978A   | 
CODE_06978D: STA $6FA2,x                                ;$06978D   | 
CODE_069790: LDA #$0200                                 ;$069790   | 
CODE_069793: STA $7A98,x                                ;$069793   | 
CODE_069796: LDA #$FFF4                                 ;$069796   | 
CODE_069799: STA $7720,x                                ;$069799   | 
CODE_06979C: LDA #$0010                                 ;$06979C   | 
CODE_06979F: STA $1066                                  ;$06979F   | 
CODE_0697A2: LDA #$0010                                 ;$0697A2   | 
CODE_0697A5: STA $1064                                  ;$0697A5   | 
CODE_0697A8: LDA #$0040                                 ;$0697A8   | 
CODE_0697AB: STA $7542,x                                ;$0697AB   | 
CODE_0697AE: SEP #$20                                   ;$0697AE   | 
CODE_0697B0: LDA #$04                                   ;$0697B0   | 
CODE_0697B2: STA $7A37,x                                ;$0697B2   | 
CODE_0697B5: LDA #$40                                   ;$0697B5   | 
CODE_0697B7: STA $7900,x                                ;$0697B7   | 
CODE_0697BA: LDA #$0A                                   ;$0697BA   | 
CODE_0697BC: STA $7902,x                                ;$0697BC   | 
CODE_0697BF: LDA #$01                                   ;$0697BF   | 
CODE_0697C1: STA $7903,x                                ;$0697C1   | 
CODE_0697C4: REP #$20                                   ;$0697C4   | 
CODE_0697C6: LDA $7402,x                                ;$0697C6   | 
CODE_0697C9: ASL A                                      ;$0697C9   | 
CODE_0697CA: TAY                                        ;$0697CA   | 
CODE_0697CB: LDA $A421,y                                ;$0697CB   | 
CODE_0697CE: STA $300C                                  ;$0697CE   | 
CODE_0697D1: LDA #$0100                                 ;$0697D1   | 
CODE_0697D4: STA $3016                                  ;$0697D4   | 
CODE_0697D7: LDA #$001C                                 ;$0697D7   | 
CODE_0697DA: STA $3010                                  ;$0697DA   | 
CODE_0697DD: LDA #$0010                                 ;$0697DD   | 
CODE_0697E0: STA $3012                                  ;$0697E0   | 
CODE_0697E3: LDA #$0020                                 ;$0697E3   | 
CODE_0697E6: STA $3006                                  ;$0697E6   | 
CODE_0697E9: LDA #$0000                                 ;$0697E9   | 
CODE_0697EC: STA $3004                                  ;$0697EC   | 
CODE_0697EF: LDA #$6000                                 ;$0697EF   | 
CODE_0697F2: STA $3018                                  ;$0697F2   | 
CODE_0697F5: LDA #$0056                                 ;$0697F5   | 
CODE_0697F8: STA $301A                                  ;$0697F8   | 
CODE_0697FB: LDX #$08                                   ;$0697FB   | 
CODE_0697FD: LDA #$8295                                 ;$0697FD   | 
CODE_069800: JSL CODE_7EDE44                            ;$069800   |  GSU init

CODE_069804: LDX $12                                    ;$069804   | 
CODE_069806: REP #$10                                   ;$069806   | 
CODE_069808: LDA #$0008                                 ;$069808   | 
CODE_06980B: STA $3010                                  ;$06980B   | 
CODE_06980E: LDA #$000F                                 ;$06980E   | 
CODE_069811: STA $3012                                  ;$069811   | 
CODE_069814: LDA #$0040                                 ;$069814   | 
CODE_069817: STA $3006                                  ;$069817   | 
CODE_06981A: LDA #$0000                                 ;$06981A   | 
CODE_06981D: STA $3004                                  ;$06981D   | 
CODE_069820: LDA #$0100                                 ;$069820   | 
CODE_069823: STA $300C                                  ;$069823   | 
CODE_069826: LDA #$0100                                 ;$069826   | 
CODE_069829: STA $3016                                  ;$069829   | 
CODE_06982C: LDA #$6020                                 ;$06982C   | 
CODE_06982F: STA $3018                                  ;$06982F   | 
CODE_069832: LDA #$0056                                 ;$069832   | 
CODE_069835: STA $301A                                  ;$069835   | 
CODE_069838: SEP #$10                                   ;$069838   | 
CODE_06983A: LDX #$08                                   ;$06983A   | 
CODE_06983C: LDA #$861B                                 ;$06983C   | 
CODE_06983F: JSL CODE_7EDE44                            ;$06983F   |  GSU init

CODE_069843: LDX $12                                    ;$069843   | 
CODE_069845: REP #$10                                   ;$069845   | 
CODE_069847: LDA #$0001                                 ;$069847   | 
CODE_06984A: STA $3010                                  ;$06984A   | 
CODE_06984D: LDA #$000E                                 ;$06984D   | 
CODE_069850: STA $3012                                  ;$069850   | 
CODE_069853: LDA #$0040                                 ;$069853   | 
CODE_069856: STA $3006                                  ;$069856   | 
CODE_069859: LDA #$0010                                 ;$069859   | 
CODE_06985C: STA $3004                                  ;$06985C   | 
CODE_06985F: LDA #$0100                                 ;$06985F   | 
CODE_069862: STA $300C                                  ;$069862   | 
CODE_069865: LDA #$0100                                 ;$069865   | 
CODE_069868: STA $3016                                  ;$069868   | 
CODE_06986B: LDA #$6030                                 ;$06986B   | 
CODE_06986E: STA $3018                                  ;$06986E   | 
CODE_069871: LDA #$0056                                 ;$069871   | 
CODE_069874: STA $301A                                  ;$069874   | 
CODE_069877: SEP #$10                                   ;$069877   | 
CODE_069879: LDX #$08                                   ;$069879   | 
CODE_06987B: LDA #$861B                                 ;$06987B   | 
CODE_06987E: JSL CODE_7EDE44                            ;$06987E   |  GSU init

CODE_069882: LDX $12                                    ;$069882   | 
CODE_069884: LDA $7402,x                                ;$069884   | 
CODE_069887: ASL A                                      ;$069887   | 
CODE_069888: ASL A                                      ;$069888   | 
CODE_069889: TAY                                        ;$069889   | 
CODE_06988A: LDA $18,x                                  ;$06988A   | 
CODE_06988C: STA $3000                                  ;$06988C   | 
CODE_06988F: LDA $A409,y                                ;$06988F   | 
CODE_069892: STA $300C                                  ;$069892   | 
CODE_069895: PHX                                        ;$069895   | 
CODE_069896: PHY                                        ;$069896   | 
CODE_069897: LDX #$0B                                   ;$069897   | 
CODE_069899: LDA #$86B6                                 ;$069899   | 
CODE_06989C: JSL CODE_7EDE44                            ;$06989C   |  GSU init

CODE_0698A0: PLY                                        ;$0698A0   | 
CODE_0698A1: PLX                                        ;$0698A1   | 
CODE_0698A2: LDA $79D6,x                                ;$0698A2   | 
CODE_0698A5: CMP $3000                                  ;$0698A5   | 
CODE_0698A8: BPL CODE_0698BB                            ;$0698A8   | 
CODE_0698AA: LDA $A40B,y                                ;$0698AA   | 
CODE_0698AD: BEQ CODE_0698BE                            ;$0698AD   | 
CODE_0698AF: LDA $A40B,y                                ;$0698AF   | 
CODE_0698B2: EOR #$FFFF                                 ;$0698B2   | 
CODE_0698B5: INC A                                      ;$0698B5   | 
CODE_0698B6: AND #$00FF                                 ;$0698B6   | 
CODE_0698B9: BRA CODE_0698BE                            ;$0698B9   | 

CODE_0698BB: LDA $A40B,y                                ;$0698BB   | 
CODE_0698BE: STA $300A                                  ;$0698BE   | 
CODE_0698C1: LDA $3000                                  ;$0698C1   | 
CODE_0698C4: STA $300C                                  ;$0698C4   | 
CODE_0698C7: LDA $76,x                                  ;$0698C7   | 
CODE_0698C9: STA $3016                                  ;$0698C9   | 
CODE_0698CC: LDA #$0060                                 ;$0698CC   | 
CODE_0698CF: STA $3006                                  ;$0698CF   | 
CODE_0698D2: LDA #$0000                                 ;$0698D2   | 
CODE_0698D5: STA $3004                                  ;$0698D5   | 
CODE_0698D8: LDA #$6040                                 ;$0698D8   | 
CODE_0698DB: STA $3018                                  ;$0698DB   | 
CODE_0698DE: LDA #$0056                                 ;$0698DE   | 
CODE_0698E1: STA $301A                                  ;$0698E1   | 
CODE_0698E4: LDX #$08                                   ;$0698E4   | 
CODE_0698E6: LDA #$84A5                                 ;$0698E6   | 
CODE_0698E9: JSL CODE_7EDE44                            ;$0698E9   |  GSU init

CODE_0698ED: LDX $12                                    ;$0698ED   | 
CODE_0698EF: LDA $7402,x                                ;$0698EF   | 
CODE_0698F2: ASL A                                      ;$0698F2   | 
CODE_0698F3: TAY                                        ;$0698F3   | 
CODE_0698F4: LDA $18,x                                  ;$0698F4   | 
CODE_0698F6: STA $3000                                  ;$0698F6   | 
CODE_0698F9: LDA $A419,y                                ;$0698F9   | 
CODE_0698FC: STA $300C                                  ;$0698FC   | 
CODE_0698FF: PHX                                        ;$0698FF   | 
CODE_069900: PHY                                        ;$069900   | 
CODE_069901: LDX #$0B                                   ;$069901   | 
CODE_069903: LDA #$86B6                                 ;$069903   | 
CODE_069906: JSL CODE_7EDE44                            ;$069906   |  GSU init

CODE_06990A: PLY                                        ;$06990A   | 
CODE_06990B: PLX                                        ;$06990B   | 
CODE_06990C: LDA $3000                                  ;$06990C   | 
CODE_06990F: STA $300C                                  ;$06990F   | 
CODE_069912: STA $00                                    ;$069912   | 
CODE_069914: LDA $76,x                                  ;$069914   | 
CODE_069916: STA $3016                                  ;$069916   | 
CODE_069919: LDA #$000F                                 ;$069919   | 
CODE_06991C: STA $3010                                  ;$06991C   | 
CODE_06991F: LDA #$000F                                 ;$06991F   | 
CODE_069922: STA $3012                                  ;$069922   | 
CODE_069925: LDA #$0050                                 ;$069925   | 
CODE_069928: STA $3006                                  ;$069928   | 
CODE_06992B: LDA #$0000                                 ;$06992B   | 
CODE_06992E: STA $3004                                  ;$06992E   | 
CODE_069931: LDA #$7030                                 ;$069931   | 
CODE_069934: STA $3018                                  ;$069934   | 
CODE_069937: LDA #$0056                                 ;$069937   | 
CODE_06993A: STA $301A                                  ;$06993A   | 
CODE_06993D: LDX #$08                                   ;$06993D   | 
CODE_06993F: LDA #$861B                                 ;$06993F   | 
CODE_069942: JSL CODE_7EDE44                            ;$069942   |  GSU init

CODE_069946: LDX $12                                    ;$069946   | 
CODE_069948: LDA $00                                    ;$069948   | 
CODE_06994A: STA $300C                                  ;$06994A   | 
CODE_06994D: LDA $76,x                                  ;$06994D   | 
CODE_06994F: STA $3016                                  ;$06994F   | 
CODE_069952: LDA #$000F                                 ;$069952   | 
CODE_069955: STA $3010                                  ;$069955   | 
CODE_069958: LDA #$0000                                 ;$069958   | 
CODE_06995B: STA $3012                                  ;$06995B   | 
CODE_06995E: LDA #$0050                                 ;$06995E   | 
CODE_069961: STA $3006                                  ;$069961   | 
CODE_069964: LDA #$0010                                 ;$069964   | 
CODE_069967: STA $3004                                  ;$069967   | 
CODE_06996A: LDA #$7020                                 ;$06996A   | 
CODE_06996D: STA $3018                                  ;$06996D   | 
CODE_069970: LDA #$0056                                 ;$069970   | 
CODE_069973: STA $301A                                  ;$069973   | 
CODE_069976: LDX #$08                                   ;$069976   | 
CODE_069978: LDA #$861B                                 ;$069978   | 
CODE_06997B: JSL CODE_7EDE44                            ;$06997B   |  GSU init

CODE_06997F: INC $0CF9                                  ;$06997F   | 
CODE_069982: LDX $12                                    ;$069982   | 
CODE_069984: JSR CODE_06A740                            ;$069984   | 
CODE_069987: RTL                                        ;$069987   | 

DATA_069988:         dw $A429, $A5A6, $A740

DATA_06998E:         dw $A36F, $A36F, $A3EF

DATA_069994:         dw $00E0, $00D0, $00C0, $00C0
DATA_06999C:         dw $00C0, $00C0

DATA_0699A0:         dw $FA00, $FA40, $FA80, $FAC0
DATA_0699A8:         dw $FB00, $FB40, $F600, $F680
DATA_0699B0:         dw $F700, $F780, $F800, $F880

DATA_0699B8:         dw $E7A6, $E640, $E640, $E640
DATA_0699C0:         dw $E640, $E640, $E7DA, $A5D8
DATA_0699C8:         dw $A5D8, $A5D8, $A5D8, $A5D8
DATA_0699D0:         dw $E7FA, $A5F6, $A5F6, $A5F6
DATA_0699D8:         dw $A5F6, $A5F6

.main_burt
CODE_0699DC: LDY $7A37,x                                ;$0699DC   | 
CODE_0699DF: TYX                                        ;$0699DF   | 
CODE_0699E0: JSR ($998E,x)                              ;$0699E0   | 

CODE_0699E3: LDY $7A37,x                                ;$0699E3   | 
CODE_0699E6: CPY #$04                                   ;$0699E6   | 
CODE_0699E8: BCS CODE_0699ED                            ;$0699E8   | 
CODE_0699EA: JSR CODE_06A77F                            ;$0699EA   | 
CODE_0699ED: LDA $0D0F                                  ;$0699ED   | 
CODE_0699F0: BNE CODE_0699F9                            ;$0699F0   | 
CODE_0699F2: LDY $7A37,x                                ;$0699F2   | 
CODE_0699F5: TYX                                        ;$0699F5   | 
CODE_0699F6: JSR ($9988,x)                              ;$0699F6   | 

CODE_0699F9: JSL CODE_03AF23                            ;$0699F9   | 
CODE_0699FD: LDA $60AC                                  ;$0699FD   | 
CODE_069A00: BNE CODE_069A19                            ;$069A00   | 
CODE_069A02: LDY $7A37,x                                ;$069A02   | 
CODE_069A05: CPY #$04                                   ;$069A05   | 
CODE_069A07: BCS CODE_069A19                            ;$069A07   | 
CODE_069A09: LDY $7900,x                                ;$069A09   | 
CODE_069A0C: CPY #$7F                                   ;$069A0C   | 
CODE_069A0E: BCS CODE_069A19                            ;$069A0E   | 
CODE_069A10: LDA $601A                                  ;$069A10   | 
CODE_069A13: BEQ CODE_069A19                            ;$069A13   | 
CODE_069A15: JSL CODE_03A858                            ;$069A15   | 
CODE_069A19: LDY $78,x                                  ;$069A19   | 
CODE_069A1B: BEQ CODE_069A21                            ;$069A1B   | 
CODE_069A1D: TYX                                        ;$069A1D   | 
CODE_069A1E: JSR ($9A28,x)                              ;$069A1E   | 

CODE_069A21: LDY $7A36,x                                ;$069A21   | 
CODE_069A24: TYX                                        ;$069A24   | 
CODE_069A25: JMP ($9A2E,x)                              ;$069A25   | 

DATA_069A28:         dw $A31F, $A322, $A34D

DATA_069A2E:         dw $9A7A			;
DATA_069A30:         dw $9AD3			;
DATA_069A32:         dw $9B36			;
DATA_069A34:         dw $9BAD			;
DATA_069A36:         dw $9BC0			;
DATA_069A38:         dw $9C22			;
DATA_069A3A:         dw $9C56			;
DATA_069A3C:         dw $9C8E			;
DATA_069A3E:         dw $9CC6			;
DATA_069A40:         dw $9CF5			;
DATA_069A42:         dw $9D20			;
DATA_069A44:         dw $9D65			;
DATA_069A46:         dw $9DB7			;
DATA_069A48:         dw $9DE4			;
DATA_069A4A:         dw $9E6A			;
DATA_069A4C:         dw $9EA9			;
DATA_069A4E:         dw $9F2D			;
DATA_069A50:         dw $9F6A			;
DATA_069A52:         dw $9FF4			;
DATA_069A54:         dw $9FD5			;
DATA_069A56:         dw $9FF4			;
DATA_069A58:         dw $9FD5			;
DATA_069A5A:         dw $9FF4			;
DATA_069A5C:         dw $9FD5			;
DATA_069A5E:         dw $9FF4			;
DATA_069A60:         dw $9FD5			;
DATA_069A62:         dw $9FF4			;
DATA_069A64:         dw $9FD5			;
DATA_069A66:         dw $9FF4			;
DATA_069A68:         dw $9FD5			;
DATA_069A6A:         dw $9FC4			;
DATA_069A6C:         dw $A029			;
DATA_069A6E:         dw $A044			;
DATA_069A70:         dw $A089			;
DATA_069A72:         dw $A0AF			;
DATA_069A74:         dw $A18F			;
DATA_069A76:         dw $A1DA			;
DATA_069A78:         dw $A305			;

CODE_069A7A: LDX $12                                    ;$069A7A   | 
CODE_069A7C: LDA $60C0                                  ;$069A7C   | 
CODE_069A7F: BNE CODE_069AD2                            ;$069A7F   | 
CODE_069A81: LDA $7A96,x                                ;$069A81   | 
CODE_069A84: BNE CODE_069AD2                            ;$069A84   | 
CODE_069A86: LDA $18,x                                  ;$069A86   | 
CODE_069A88: CLC                                        ;$069A88   | 
CODE_069A89: ADC $1064                                  ;$069A89   | 
CODE_069A8C: STA $18,x                                  ;$069A8C   | 
CODE_069A8E: LDA $76,x                                  ;$069A8E   | 
CODE_069A90: SEC                                        ;$069A90   | 
CODE_069A91: SBC $1066                                  ;$069A91   | 
CODE_069A94: STA $76,x                                  ;$069A94   | 
CODE_069A96: CMP #$00C0                                 ;$069A96   | 
CODE_069A99: BCS CODE_069AB0                            ;$069A99   | 
CODE_069A9B: LDA $1066                                  ;$069A9B   | 
CODE_069A9E: EOR #$FFFF                                 ;$069A9E   | 
CODE_069AA1: INC A                                      ;$069AA1   | 
CODE_069AA2: STA $1066                                  ;$069AA2   | 
CODE_069AA5: LDA $1064                                  ;$069AA5   | 
CODE_069AA8: EOR #$FFFF                                 ;$069AA8   | 
CODE_069AAB: INC A                                      ;$069AAB   | 
CODE_069AAC: STA $1064                                  ;$069AAC   | 
CODE_069AAF: RTL                                        ;$069AAF   | 

CODE_069AB0: CMP #$0100                                 ;$069AB0   | 
CODE_069AB3: BCC CODE_069AD2                            ;$069AB3   | 
CODE_069AB5: LDA #$FC00                                 ;$069AB5   | 
CODE_069AB8: STA $7222,x                                ;$069AB8   | 
CODE_069ABB: LDA #$FE00                                 ;$069ABB   | 
CODE_069ABE: STA $7220,x                                ;$069ABE   | 
CODE_069AC1: LDA #$0013                                 ;$069AC1   | 
CODE_069AC4: JSL CODE_0085D2                            ;$069AC4   | 
CODE_069AC8: SEP #$20                                   ;$069AC8   | 
CODE_069ACA: INC $7A36,x                                ;$069ACA   | 
CODE_069ACD: INC $7A36,x                                ;$069ACD   | 
CODE_069AD0: REP #$20                                   ;$069AD0   | 
CODE_069AD2: RTL                                        ;$069AD2   | 

CODE_069AD3: LDX $12                                    ;$069AD3   | 
CODE_069AD5: LDA $76,x                                  ;$069AD5   | 
CODE_069AD7: CMP #$0140                                 ;$069AD7   | 
CODE_069ADA: BCS CODE_069AEA                            ;$069ADA   | 
CODE_069ADC: SEC                                        ;$069ADC   | 
CODE_069ADD: SBC $1066                                  ;$069ADD   | 
CODE_069AE0: STA $76,x                                  ;$069AE0   | 
CODE_069AE2: LDA $18,x                                  ;$069AE2   | 
CODE_069AE4: CLC                                        ;$069AE4   | 
CODE_069AE5: ADC $1064                                  ;$069AE5   | 
CODE_069AE8: STA $18,x                                  ;$069AE8   | 
CODE_069AEA: LDA $7860,x                                ;$069AEA   | 
CODE_069AED: BIT #$0001                                 ;$069AED   | 
CODE_069AF0: BEQ CODE_069B17                            ;$069AF0   | 
CODE_069AF2: STZ $7402,x                                ;$069AF2   | 
CODE_069AF5: STZ $7220,x                                ;$069AF5   | 
CODE_069AF8: LDA $1066                                  ;$069AF8   | 
CODE_069AFB: EOR #$FFFF                                 ;$069AFB   | 
CODE_069AFE: INC A                                      ;$069AFE   | 
CODE_069AFF: STA $1066                                  ;$069AFF   | 
CODE_069B02: LDA $1064                                  ;$069B02   | 
CODE_069B05: EOR #$FFFF                                 ;$069B05   | 
CODE_069B08: INC A                                      ;$069B08   | 
CODE_069B09: STA $1064                                  ;$069B09   | 
CODE_069B0C: SEP #$20                                   ;$069B0C   | 
CODE_069B0E: INC $7A36,x                                ;$069B0E   | 
CODE_069B11: INC $7A36,x                                ;$069B11   | 
CODE_069B14: REP #$20                                   ;$069B14   | 
CODE_069B16: RTL                                        ;$069B16   | 

CODE_069B17: LDY #$00                                   ;$069B17   | 
CODE_069B19: LDA $7222,x                                ;$069B19   | 
CODE_069B1C: BPL CODE_069B2B                            ;$069B1C   | 
CODE_069B1E: INY                                        ;$069B1E   | 
CODE_069B1F: EOR #$FFFF                                 ;$069B1F   | 
CODE_069B22: INC A                                      ;$069B22   | 
CODE_069B23: CMP #$0300                                 ;$069B23   | 
CODE_069B26: BCS CODE_069B31                            ;$069B26   | 
CODE_069B28: INY                                        ;$069B28   | 
CODE_069B29: BRA CODE_069B31                            ;$069B29   | 

CODE_069B2B: CMP #$0200                                 ;$069B2B   | 
CODE_069B2E: BCS CODE_069B31                            ;$069B2E   | 
CODE_069B30: INY                                        ;$069B30   | 
CODE_069B31: TYA                                        ;$069B31   | 
CODE_069B32: STA $7402,x                                ;$069B32   | 
CODE_069B35: RTL                                        ;$069B35   | 

CODE_069B36: LDX $12                                    ;$069B36   | 
CODE_069B38: LDA $18,x                                  ;$069B38   | 
CODE_069B3A: CLC                                        ;$069B3A   | 
CODE_069B3B: ADC $1064                                  ;$069B3B   | 
CODE_069B3E: STA $18,x                                  ;$069B3E   | 
CODE_069B40: LDA $76,x                                  ;$069B40   | 
CODE_069B42: SEC                                        ;$069B42   | 
CODE_069B43: SBC $1066                                  ;$069B43   | 
CODE_069B46: STA $76,x                                  ;$069B46   | 
CODE_069B48: LDY $1067                                  ;$069B48   | 
CODE_069B4B: BMI CODE_069B67                            ;$069B4B   | 
CODE_069B4D: CMP #$00C0                                 ;$069B4D   | 
CODE_069B50: BCS CODE_069B66                            ;$069B50   | 
CODE_069B52: LDA $1066                                  ;$069B52   | 
CODE_069B55: EOR #$FFFF                                 ;$069B55   | 
CODE_069B58: INC A                                      ;$069B58   | 
CODE_069B59: STA $1066                                  ;$069B59   | 
CODE_069B5C: LDA $1064                                  ;$069B5C   | 
CODE_069B5F: EOR #$FFFF                                 ;$069B5F   | 
CODE_069B62: INC A                                      ;$069B62   | 
CODE_069B63: STA $1064                                  ;$069B63   | 
CODE_069B66: RTL                                        ;$069B66   | 

CODE_069B67: CMP #$0100                                 ;$069B67   | 
CODE_069B6A: BCC CODE_069BA1                            ;$069B6A   | 
CODE_069B6C: LDA #$0100                                 ;$069B6C   | 
CODE_069B6F: STA $18,x                                  ;$069B6F   | 
CODE_069B71: STA $76,x                                  ;$069B71   | 
CODE_069B73: LDA $70E2,x                                ;$069B73   | 
CODE_069B76: CMP #$00B0                                 ;$069B76   | 
CODE_069B79: BCC CODE_069BA2                            ;$069B79   | 
CODE_069B7B: LDA $1066                                  ;$069B7B   | 
CODE_069B7E: EOR #$FFFF                                 ;$069B7E   | 
CODE_069B81: INC A                                      ;$069B81   | 
CODE_069B82: STA $1066                                  ;$069B82   | 
CODE_069B85: LDA $1064                                  ;$069B85   | 
CODE_069B88: EOR #$FFFF                                 ;$069B88   | 
CODE_069B8B: INC A                                      ;$069B8B   | 
CODE_069B8C: STA $1064                                  ;$069B8C   | 
CODE_069B8F: SEP #$20                                   ;$069B8F   | 
CODE_069B91: LDA #$10                                   ;$069B91   | 
CODE_069B93: STA $7A96,x                                ;$069B93   | 
CODE_069B96: LDA $7A36,x                                ;$069B96   | 
CODE_069B99: SEC                                        ;$069B99   | 
CODE_069B9A: SBC #$04                                   ;$069B9A   | 
CODE_069B9C: STA $7A36,x                                ;$069B9C   | 
CODE_069B9F: REP #$20                                   ;$069B9F   | 
CODE_069BA1: RTL                                        ;$069BA1   | 

CODE_069BA2: SEP #$20                                   ;$069BA2   | 
CODE_069BA4: INC $7A36,x                                ;$069BA4   | 
CODE_069BA7: INC $7A36,x                                ;$069BA7   | 
CODE_069BAA: REP #$20                                   ;$069BAA   | 
CODE_069BAC: RTL                                        ;$069BAC   | 

CODE_069BAD: LDX $12                                    ;$069BAD   | 
CODE_069BAF: LDA #$0001                                 ;$069BAF   | 
CODE_069BB2: STA $1015                                  ;$069BB2   | 
CODE_069BB5: SEP #$20                                   ;$069BB5   | 
CODE_069BB7: INC $7A36,x                                ;$069BB7   | 
CODE_069BBA: INC $7A36,x                                ;$069BBA   | 
CODE_069BBD: REP #$20                                   ;$069BBD   | 
CODE_069BBF: RTL                                        ;$069BBF   | 

CODE_069BC0: LDX $12                                    ;$069BC0   | 
CODE_069BC2: LDA $1015                                  ;$069BC2   | 
CODE_069BC5: BMI CODE_069BC8                            ;$069BC5   | 
CODE_069BC7: RTL                                        ;$069BC7   | 

CODE_069BC8: LDA #$0008                                 ;$069BC8   | 
CODE_069BCB: STA $1066                                  ;$069BCB   | 
CODE_069BCE: LDA #$0008                                 ;$069BCE   | 
CODE_069BD1: STA $1064                                  ;$069BD1   | 
CODE_069BD4: LDX #$3C                                   ;$069BD4   | 
CODE_069BD6: LDA $5FE640,x                              ;$069BD6   | 
CODE_069BDA: STA $702E2E,x                              ;$069BDA   | 
CODE_069BDE: STA $7020C2,x                              ;$069BDE   | 
CODE_069BE2: DEX                                        ;$069BE2   | 
CODE_069BE3: DEX                                        ;$069BE3   | 
CODE_069BE4: BPL CODE_069BD6                            ;$069BE4   | 
CODE_069BE6: LDX $12                                    ;$069BE6   | 
CODE_069BE8: SEP #$20                                   ;$069BE8   | 
CODE_069BEA: LDA #$0F                                   ;$069BEA   | 
CODE_069BEC: STA $4331                                  ;$069BEC   | 
CODE_069BEF: LDA #$10                                   ;$069BEF   | 
CODE_069BF1: STA $4341                                  ;$069BF1   | 
CODE_069BF4: REP #$20                                   ;$069BF4   | 
CODE_069BF6: LDA #$0030                                 ;$069BF6   | 
CODE_069BF9: STA $6126                                  ;$069BF9   | 
CODE_069BFC: LDA $7042                                  ;$069BFC   | 
CODE_069BFF: AND #$FFCF                                 ;$069BFF   | 
CODE_069C02: ORA #$0030                                 ;$069C02   | 
CODE_069C05: STA $7042                                  ;$069C05   | 
CODE_069C08: LDA #$0510                                 ;$069C08   | 
CODE_069C0B: STA $0967                                  ;$069C0B   | 
CODE_069C0E: LDA #$FC00                                 ;$069C0E   | 
CODE_069C11: STA $7222,x                                ;$069C11   | 
CODE_069C14: STZ $7720,x                                ;$069C14   | 
CODE_069C17: SEP #$20                                   ;$069C17   | 
CODE_069C19: INC $7A36,x                                ;$069C19   | 
CODE_069C1C: INC $7A36,x                                ;$069C1C   | 
CODE_069C1F: REP #$20                                   ;$069C1F   | 
CODE_069C21: RTL                                        ;$069C21   | 

CODE_069C22: LDX $12                                    ;$069C22   | 
CODE_069C24: LDA $7222,x                                ;$069C24   | 
CODE_069C27: CLC                                        ;$069C27   | 
CODE_069C28: ADC #$0400                                 ;$069C28   | 
CODE_069C2B: BMI CODE_069C55                            ;$069C2B   | 
CODE_069C2D: LDA #$0030                                 ;$069C2D   | 
CODE_069C30: STA $18,x                                  ;$069C30   | 
CODE_069C32: STA $76,x                                  ;$069C32   | 
CODE_069C34: STZ $1015                                  ;$069C34   | 
CODE_069C37: SEP #$20                                   ;$069C37   | 
CODE_069C39: LDA #$02                                   ;$069C39   | 
CODE_069C3B: STA $7A37,x                                ;$069C3B   | 
CODE_069C3E: LDA $6FA2,x                                ;$069C3E   | 
CODE_069C41: AND #$E0                                   ;$069C41   | 
CODE_069C43: STA $6FA2,x                                ;$069C43   | 
CODE_069C46: INC $7A36,x                                ;$069C46   | 
CODE_069C49: INC $7A36,x                                ;$069C49   | 
CODE_069C4C: REP #$20                                   ;$069C4C   | 
CODE_069C4E: LDA #$0020                                 ;$069C4E   | 
CODE_069C51: JSL CODE_0085D2                            ;$069C51   | 
CODE_069C55: RTL                                        ;$069C55   | 

CODE_069C56: LDX $12                                    ;$069C56   | 
CODE_069C58: LDA $76,x                                  ;$069C58   | 
CODE_069C5A: CLC                                        ;$069C5A   | 
CODE_069C5B: ADC $1066                                  ;$069C5B   | 
CODE_069C5E: STA $76,x                                  ;$069C5E   | 
CODE_069C60: CMP #$0030                                 ;$069C60   | 
CODE_069C63: BCC CODE_069C71                            ;$069C63   | 
CODE_069C65: CMP #$0100                                 ;$069C65   | 
CODE_069C68: BCC CODE_069C70                            ;$069C68   | 
CODE_069C6A: LDA #$FFE0                                 ;$069C6A   | 
CODE_069C6D: STA $1066                                  ;$069C6D   | 
CODE_069C70: RTL                                        ;$069C70   | 

CODE_069C71: LDA #$0030                                 ;$069C71   | 
CODE_069C74: STA $76,x                                  ;$069C74   | 
CODE_069C76: LDA #$0010                                 ;$069C76   | 
CODE_069C79: STA $1066                                  ;$069C79   | 
CODE_069C7C: SEP #$20                                   ;$069C7C   | 
CODE_069C7E: INC $7A36,x                                ;$069C7E   | 
CODE_069C81: INC $7A36,x                                ;$069C81   | 
CODE_069C84: REP #$20                                   ;$069C84   | 
CODE_069C86: LDA #$0020                                 ;$069C86   | 
CODE_069C89: JSL CODE_0085D2                            ;$069C89   | 
CODE_069C8D: RTL                                        ;$069C8D   | 

CODE_069C8E: LDX $12                                    ;$069C8E   | 
CODE_069C90: LDA $18,x                                  ;$069C90   | 
CODE_069C92: CLC                                        ;$069C92   | 
CODE_069C93: ADC $1064                                  ;$069C93   | 
CODE_069C96: STA $18,x                                  ;$069C96   | 
CODE_069C98: CMP #$0030                                 ;$069C98   | 
CODE_069C9B: BCC CODE_069CA9                            ;$069C9B   | 
CODE_069C9D: CMP #$0100                                 ;$069C9D   | 
CODE_069CA0: BCC CODE_069CA8                            ;$069CA0   | 
CODE_069CA2: LDA #$FFE0                                 ;$069CA2   | 
CODE_069CA5: STA $1064                                  ;$069CA5   | 
CODE_069CA8: RTL                                        ;$069CA8   | 

CODE_069CA9: LDA #$0030                                 ;$069CA9   | 
CODE_069CAC: STA $18,x                                  ;$069CAC   | 
CODE_069CAE: LDA #$0010                                 ;$069CAE   | 
CODE_069CB1: STA $1064                                  ;$069CB1   | 
CODE_069CB4: SEP #$20                                   ;$069CB4   | 
CODE_069CB6: INC $7A36,x                                ;$069CB6   | 
CODE_069CB9: INC $7A36,x                                ;$069CB9   | 
CODE_069CBC: REP #$20                                   ;$069CBC   | 
CODE_069CBE: LDA #$0020                                 ;$069CBE   | 
CODE_069CC1: JSL CODE_0085D2                            ;$069CC1   | 
CODE_069CC5: RTL                                        ;$069CC5   | 

CODE_069CC6: LDX $12                                    ;$069CC6   | 
CODE_069CC8: LDA $76,x                                  ;$069CC8   | 
CODE_069CCA: CLC                                        ;$069CCA   | 
CODE_069CCB: ADC $1066                                  ;$069CCB   | 
CODE_069CCE: STA $76,x                                  ;$069CCE   | 
CODE_069CD0: LDA $18,x                                  ;$069CD0   | 
CODE_069CD2: CLC                                        ;$069CD2   | 
CODE_069CD3: ADC $1064                                  ;$069CD3   | 
CODE_069CD6: STA $18,x                                  ;$069CD6   | 
CODE_069CD8: CMP #$0100                                 ;$069CD8   | 
CODE_069CDB: BMI CODE_069CF4                            ;$069CDB   | 
CODE_069CDD: LDA #$0100                                 ;$069CDD   | 
CODE_069CE0: STA $18,x                                  ;$069CE0   | 
CODE_069CE2: LDA #$0100                                 ;$069CE2   | 
CODE_069CE5: STA $76,x                                  ;$069CE5   | 
CODE_069CE7: SEP #$20                                   ;$069CE7   | 
CODE_069CE9: INC $7A36,x                                ;$069CE9   | 
CODE_069CEC: INC $7A36,x                                ;$069CEC   | 
CODE_069CEF: STZ $7A37,x                                ;$069CEF   | 
CODE_069CF2: REP #$20                                   ;$069CF2   | 
CODE_069CF4: RTL                                        ;$069CF4   | 

CODE_069CF5: LDX $12                                    ;$069CF5   | 
CODE_069CF7: LDA $7860,x                                ;$069CF7   | 
CODE_069CFA: BIT #$0001                                 ;$069CFA   | 
CODE_069CFD: BNE CODE_069D00                            ;$069CFD   | 
CODE_069CFF: RTL                                        ;$069CFF   | 

CODE_069D00: LDA #$0020                                 ;$069D00   | 
CODE_069D03: STA $7542,x                                ;$069D03   | 
CODE_069D06: LDA #$0300                                 ;$069D06   | 
CODE_069D09: STA $75E2,x                                ;$069D09   | 
CODE_069D0C: LDA #$0040                                 ;$069D0C   | 
CODE_069D0F: STA $61C6                                  ;$069D0F   | 
CODE_069D12: STZ $1062                                  ;$069D12   | 
CODE_069D15: SEP #$20                                   ;$069D15   | 
CODE_069D17: INC $7A36,x                                ;$069D17   | 
CODE_069D1A: INC $7A36,x                                ;$069D1A   | 
CODE_069D1D: REP #$20                                   ;$069D1D   | 
CODE_069D1F: RTL                                        ;$069D1F   | 

CODE_069D20: LDX $12                                    ;$069D20   | 
CODE_069D22: LDA $18,x                                  ;$069D22   | 
CODE_069D24: SEC                                        ;$069D24   | 
CODE_069D25: SBC $7A38,x                                ;$069D25   | 
CODE_069D28: STA $18,x                                  ;$069D28   | 
CODE_069D2A: LDA $76,x                                  ;$069D2A   | 
CODE_069D2C: CLC                                        ;$069D2C   | 
CODE_069D2D: ADC $7A38,x                                ;$069D2D   | 
CODE_069D30: STA $76,x                                  ;$069D30   | 
CODE_069D32: CMP #$00C0                                 ;$069D32   | 
CODE_069D35: BCS CODE_069D43                            ;$069D35   | 
CODE_069D37: LDA $7A38,x                                ;$069D37   | 
CODE_069D3A: EOR #$FFFF                                 ;$069D3A   | 
CODE_069D3D: INC A                                      ;$069D3D   | 
CODE_069D3E: STA $7A38,x                                ;$069D3E   | 
CODE_069D41: LDA $76,x                                  ;$069D41   | 
CODE_069D43: CMP #$0100                                 ;$069D43   | 
CODE_069D46: BCC CODE_069D64                            ;$069D46   | 
CODE_069D48: LDA #$0100                                 ;$069D48   | 
CODE_069D4B: STA $18,x                                  ;$069D4B   | 
CODE_069D4D: STA $76,x                                  ;$069D4D   | 
CODE_069D4F: LDA #$FFF8                                 ;$069D4F   | 
CODE_069D52: STA $7A38,x                                ;$069D52   | 
CODE_069D55: SEP #$20                                   ;$069D55   | 
CODE_069D57: LDA #$40                                   ;$069D57   | 
CODE_069D59: STA $7A98,x                                ;$069D59   | 
CODE_069D5C: INC $7A36,x                                ;$069D5C   | 
CODE_069D5F: INC $7A36,x                                ;$069D5F   | 
CODE_069D62: REP #$20                                   ;$069D62   | 
CODE_069D64: RTL                                        ;$069D64   | 

CODE_069D65: LDX $12                                    ;$069D65   | 
CODE_069D67: LDA $7A98,x                                ;$069D67   | 
CODE_069D6A: BNE CODE_069D9F                            ;$069D6A   | 
CODE_069D6C: SEP #$20                                   ;$069D6C   | 
CODE_069D6E: LDA $14                                    ;$069D6E   | 
CODE_069D70: BIT #$01                                   ;$069D70   | 
CODE_069D72: BEQ CODE_069D81                            ;$069D72   | 
CODE_069D74: LDA $7900,x                                ;$069D74   | 
CODE_069D77: SEC                                        ;$069D77   | 
CODE_069D78: SBC #$01                                   ;$069D78   | 
CODE_069D7A: CMP #$20                                   ;$069D7A   | 
CODE_069D7C: BCC CODE_069DA0                            ;$069D7C   | 
CODE_069D7E: STA $7900,x                                ;$069D7E   | 
CODE_069D81: LDY $78,x                                  ;$069D81   | 
CODE_069D83: BNE CODE_069D9D                            ;$069D83   | 
CODE_069D85: LDA $7900,x                                ;$069D85   | 
CODE_069D88: CMP #$20                                   ;$069D88   | 
CODE_069D8A: BEQ CODE_069DA0                            ;$069D8A   | 
CODE_069D8C: BCC CODE_069DA0                            ;$069D8C   | 
CODE_069D8E: LDA #$04                                   ;$069D8E   | 
CODE_069D90: STA $79D8,x                                ;$069D90   | 
CODE_069D93: LDA #$07                                   ;$069D93   | 
CODE_069D95: STA $79D9,x                                ;$069D95   | 
CODE_069D98: LDA #$02                                   ;$069D98   | 
CODE_069D9A: STA $7A96,x                                ;$069D9A   | 
CODE_069D9D: REP #$20                                   ;$069D9D   | 
CODE_069D9F: RTL                                        ;$069D9F   | 

    LDA #$20            ; $069DA0   |
    STA $7900,x         ; $069DA2   |
    LDA $78,x           ; $069DA5   |
    BNE CODE_069DB4     ; $069DA7   |
    LDA #$20            ; $069DA9   |
    STA $7A98,x         ; $069DAB   |
    INC $7A36,x         ; $069DAE   |
    INC $7A36,x         ; $069DB1   |

CODE_069DB4:
    REP #$20            ; $069DB4   |
    RTL                 ; $069DB6   |

CODE_069DB7: LDX $12                                    ;$069DB7   | 
CODE_069DB9: LDA $7A98,x                                ;$069DB9   | 
CODE_069DBC: BNE CODE_069DCB                            ;$069DBC   | 
CODE_069DBE: SEP #$20                                   ;$069DBE   | 
CODE_069DC0: INC $7A36,x                                ;$069DC0   | 
CODE_069DC3: INC $7A36,x                                ;$069DC3   | 
CODE_069DC6: REP #$20                                   ;$069DC6   | 
CODE_069DC8: STZ $60AC                                  ;$069DC8   | 
CODE_069DCB: RTL                                        ;$069DCB   | 

DATA_069DCC:         db $C0, $FE, $40, $01, $F0, $FE, $10, $01
DATA_069DD4:         db $40, $FF, $C0, $00, $58, $FF, $A8, $00
DATA_069DDC:         db $70, $FF, $90, $00, $80, $FF, $80, $00

CODE_069DE4: LDX $12                                    ;$069DE4   | 
CODE_069DE6: JSL CODE_06A860                            ;$069DE6   | 
CODE_069DEA: LDA $7860,x                                ;$069DEA   | 
CODE_069DED: BIT #$0001                                 ;$069DED   | 
CODE_069DF0: BEQ CODE_069E4A                            ;$069DF0   | 
CODE_069DF2: LDA $1062                                  ;$069DF2   | 
CODE_069DF5: BEQ CODE_069E07                            ;$069DF5   | 
CODE_069DF7: LDA #$0023                                 ;$069DF7   | 
CODE_069DFA: JSL CODE_0085D2                            ;$069DFA   | 
CODE_069DFE: LDA #$0020                                 ;$069DFE   | 
CODE_069E01: STA $61C6                                  ;$069E01   | 
CODE_069E04: STZ $1062                                  ;$069E04   | 
CODE_069E07: LDA $7A38,x                                ;$069E07   | 
CODE_069E0A: BMI CODE_069E4B                            ;$069E0A   | 
CODE_069E0C: LDA $76,x                                  ;$069E0C   | 
CODE_069E0E: CMP #$0110                                 ;$069E0E   | 
CODE_069E11: BMI CODE_069E4B                            ;$069E11   | 
CODE_069E13: LDA $7860,x                                ;$069E13   | 
CODE_069E16: AND #$FFFE                                 ;$069E16   | 
CODE_069E19: STA $7860,x                                ;$069E19   | 
CODE_069E1C: LDY $7902,x                                ;$069E1C   | 
CODE_069E1F: LDA $99A0,y                                ;$069E1F   | 
CODE_069E22: STA $7222,x                                ;$069E22   | 
CODE_069E25: LDA $7902,x                                ;$069E25   | 
CODE_069E28: AND #$00FF                                 ;$069E28   | 
CODE_069E2B: ASL A                                      ;$069E2B   | 
CODE_069E2C: ORA $7400,x                                ;$069E2C   | 
CODE_069E2F: TAY                                        ;$069E2F   | 
CODE_069E30: LDA $9DCC,y                                ;$069E30   | 
CODE_069E33: STA $7220,x                                ;$069E33   | 
CODE_069E36: LDA #$0013                                 ;$069E36   | 
CODE_069E39: JSL CODE_0085D2                            ;$069E39   | 
CODE_069E3D: INC $1062                                  ;$069E3D   | 
CODE_069E40: SEP #$20                                   ;$069E40   | 
CODE_069E42: INC $7A36,x                                ;$069E42   | 
CODE_069E45: INC $7A36,x                                ;$069E45   | 
CODE_069E48: REP #$20                                   ;$069E48   | 
CODE_069E4A: RTL                                        ;$069E4A   | 

CODE_069E4B: LDA $18,x                                  ;$069E4B   | 
CODE_069E4D: SEC                                        ;$069E4D   | 
CODE_069E4E: SBC $7A38,x                                ;$069E4E   | 
CODE_069E51: STA $18,x                                  ;$069E51   | 
CODE_069E53: LDA $76,x                                  ;$069E53   | 
CODE_069E55: CLC                                        ;$069E55   | 
CODE_069E56: ADC $7A38,x                                ;$069E56   | 
CODE_069E59: STA $76,x                                  ;$069E59   | 
CODE_069E5B: LDY $7902,x                                ;$069E5B   | 
CODE_069E5E: CMP $9994,y                                ;$069E5E   | 
CODE_069E61: BPL CODE_069E69                            ;$069E61   | 
CODE_069E63: LDA #$0008                                 ;$069E63   | 
CODE_069E66: STA $7A38,x                                ;$069E66   | 
CODE_069E69: RTL                                        ;$069E69   | 

CODE_069E6A: LDX $12                                    ;$069E6A   | 
CODE_069E6C: JSL CODE_06A860                            ;$069E6C   | 
CODE_069E70: LDA $18,x                                  ;$069E70   | 
CODE_069E72: CMP #$00A0                                 ;$069E72   | 
CODE_069E75: BCC CODE_069E85                            ;$069E75   | 
CODE_069E77: SEC                                        ;$069E77   | 
CODE_069E78: SBC $7A38,x                                ;$069E78   | 
CODE_069E7B: STA $18,x                                  ;$069E7B   | 
CODE_069E7D: LDA $76,x                                  ;$069E7D   | 
CODE_069E7F: CLC                                        ;$069E7F   | 
CODE_069E80: ADC $7A38,x                                ;$069E80   | 
CODE_069E83: STA $76,x                                  ;$069E83   | 
CODE_069E85: LDY $7223,x                                ;$069E85   | 
CODE_069E88: BPL CODE_069E98                            ;$069E88   | 
CODE_069E8A: LDA $16,x                                  ;$069E8A   | 
CODE_069E8C: CMP #$3000                                 ;$069E8C   | 
CODE_069E8F: BPL CODE_069E98                            ;$069E8F   | 
CODE_069E91: CLC                                        ;$069E91   | 
CODE_069E92: ADC #$0800                                 ;$069E92   | 
CODE_069E95: STA $16,x                                  ;$069E95   | 
CODE_069E97: RTL                                        ;$069E97   | 

CODE_069E98: LDA #$0400                                 ;$069E98   | 
CODE_069E9B: STA $105C                                  ;$069E9B   | 
CODE_069E9E: SEP #$20                                   ;$069E9E   | 
CODE_069EA0: INC $7A36,x                                ;$069EA0   | 
CODE_069EA3: INC $7A36,x                                ;$069EA3   | 
CODE_069EA6: REP #$20                                   ;$069EA6   | 
CODE_069EA8: RTL                                        ;$069EA8   | 

CODE_069EA9: LDX $12                                    ;$069EA9   | 
CODE_069EAB: JSL CODE_06A860                            ;$069EAB   | 
CODE_069EAF: LDA $7222,x                                ;$069EAF   | 
CODE_069EB2: CLC                                        ;$069EB2   | 
CODE_069EB3: ADC #$0100                                 ;$069EB3   | 
CODE_069EB6: BMI CODE_069EBE                            ;$069EB6   | 
CODE_069EB8: LDA #$FFF8                                 ;$069EB8   | 
CODE_069EBB: STA $7A38,x                                ;$069EBB   | 
CODE_069EBE: LDA $18,x                                  ;$069EBE   | 
CODE_069EC0: CMP #$00A0                                 ;$069EC0   | 
CODE_069EC3: BCS CODE_069ECA                            ;$069EC3   | 
CODE_069EC5: LDY $7A39,x                                ;$069EC5   | 
CODE_069EC8: BPL CODE_069EDD                            ;$069EC8   | 
CODE_069ECA: CMP #$0100                                 ;$069ECA   | 
CODE_069ECD: BCS CODE_069EDD                            ;$069ECD   | 
CODE_069ECF: SEC                                        ;$069ECF   | 
CODE_069ED0: SBC $7A38,x                                ;$069ED0   | 
CODE_069ED3: STA $18,x                                  ;$069ED3   | 
CODE_069ED5: LDA $76,x                                  ;$069ED5   | 
CODE_069ED7: CLC                                        ;$069ED7   | 
CODE_069ED8: ADC $7A38,x                                ;$069ED8   | 
CODE_069EDB: STA $76,x                                  ;$069EDB   | 
CODE_069EDD: LDA $7860,x                                ;$069EDD   | 
CODE_069EE0: BIT #$0001                                 ;$069EE0   | 
CODE_069EE3: BNE CODE_069F1A                            ;$069EE3   | 
CODE_069EE5: LDY $7223,x                                ;$069EE5   | 
CODE_069EE8: BMI CODE_069EFB                            ;$069EE8   | 
CODE_069EEA: LDA $16,x                                  ;$069EEA   | 
CODE_069EEC: BEQ CODE_069F19                            ;$069EEC   | 
CODE_069EEE: BPL CODE_069EF5                            ;$069EEE   | 
CODE_069EF0: LDA #$0000                                 ;$069EF0   | 
CODE_069EF3: BRA CODE_069F17                            ;$069EF3   | 

CODE_069EF5: CLC                                        ;$069EF5   | 
CODE_069EF6: ADC #$FE00                                 ;$069EF6   | 
CODE_069EF9: BRA CODE_069F17                            ;$069EF9   | 

CODE_069EFB: LDA $16,x                                  ;$069EFB   | 
CODE_069EFD: CMP #$2800                                 ;$069EFD   | 
CODE_069F00: BCC CODE_069F07                            ;$069F00   | 
CODE_069F02: CMP #$3000                                 ;$069F02   | 
CODE_069F05: BCC CODE_069F13                            ;$069F05   | 
CODE_069F07: LDA $105C                                  ;$069F07   | 
CODE_069F0A: EOR #$FFFF                                 ;$069F0A   | 
CODE_069F0D: INC A                                      ;$069F0D   | 
CODE_069F0E: STA $105C                                  ;$069F0E   | 
CODE_069F11: LDA $16,x                                  ;$069F11   | 
CODE_069F13: CLC                                        ;$069F13   | 
CODE_069F14: ADC $105C                                  ;$069F14   | 
CODE_069F17: STA $16,x                                  ;$069F17   | 
CODE_069F19: RTL                                        ;$069F19   | 

CODE_069F1A: STZ $7220,x                                ;$069F1A   | 
CODE_069F1D: STZ $16,x                                  ;$069F1D   | 
CODE_069F1F: SEP #$20                                   ;$069F1F   | 
CODE_069F21: LDA $7A36,x                                ;$069F21   | 
CODE_069F24: SEC                                        ;$069F24   | 
CODE_069F25: SBC #$04                                   ;$069F25   | 
CODE_069F27: STA $7A36,x                                ;$069F27   | 
CODE_069F2A: REP #$20                                   ;$069F2A   | 
CODE_069F2C: RTL                                        ;$069F2C   | 

CODE_069F2D: LDX $12                                    ;$069F2D   | 
CODE_069F2F: JSR CODE_06A978                            ;$069F2F   | 
CODE_069F32: LDA $18,x                                  ;$069F32   | 
CODE_069F34: CMP #$0080                                 ;$069F34   | 
CODE_069F37: BCC CODE_069F4B                            ;$069F37   | 
CODE_069F39: LDA $18,x                                  ;$069F39   | 
CODE_069F3B: SEC                                        ;$069F3B   | 
CODE_069F3C: SBC $7A38,x                                ;$069F3C   | 
CODE_069F3F: STA $18,x                                  ;$069F3F   | 
CODE_069F41: LDA $76,x                                  ;$069F41   | 
CODE_069F43: CLC                                        ;$069F43   | 
CODE_069F44: ADC $7A38,x                                ;$069F44   | 
CODE_069F47: STA $76,x                                  ;$069F47   | 
CODE_069F49: BRA CODE_069EE5                            ;$069F49   | 

CODE_069F4B: LDA #$0080                                 ;$069F4B   | 
CODE_069F4E: STA $18,x                                  ;$069F4E   | 
CODE_069F50: LDA #$0180                                 ;$069F50   | 
CODE_069F53: STA $76,x                                  ;$069F53   | 
CODE_069F55: LDA $7A38,x                                ;$069F55   | 
CODE_069F58: EOR #$FFFF                                 ;$069F58   | 
CODE_069F5B: INC A                                      ;$069F5B   | 
CODE_069F5C: STA $7A38,x                                ;$069F5C   | 
CODE_069F5F: SEP #$20                                   ;$069F5F   | 
CODE_069F61: INC $7A36,x                                ;$069F61   | 
CODE_069F64: INC $7A36,x                                ;$069F64   | 
CODE_069F67: REP #$20                                   ;$069F67   | 
CODE_069F69: RTL                                        ;$069F69   | 

CODE_069F6A: LDX $12                                    ;$069F6A   | 
CODE_069F6C: JSR CODE_06A978                            ;$069F6C   | 
CODE_069F6F: LDA $7860,x                                ;$069F6F   | 
CODE_069F72: AND #$0001                                 ;$069F72   | 
CODE_069F75: BNE CODE_069FA0                            ;$069F75   | 
CODE_069F77: LDA $18,x                                  ;$069F77   | 
CODE_069F79: CMP #$0080                                 ;$069F79   | 
CODE_069F7C: BCC CODE_069F83                            ;$069F7C   | 
CODE_069F7E: CMP #$00C0                                 ;$069F7E   | 
CODE_069F81: BCC CODE_069F8D                            ;$069F81   | 
CODE_069F83: LDA $7A38,x                                ;$069F83   | 
CODE_069F86: EOR #$FFFF                                 ;$069F86   | 
CODE_069F89: INC A                                      ;$069F89   | 
CODE_069F8A: STA $7A38,x                                ;$069F8A   | 
CODE_069F8D: LDA $18,x                                  ;$069F8D   | 
CODE_069F8F: SEC                                        ;$069F8F   | 
CODE_069F90: SBC $7A38,x                                ;$069F90   | 
CODE_069F93: STA $18,x                                  ;$069F93   | 
CODE_069F95: LDA $76,x                                  ;$069F95   | 
CODE_069F97: CLC                                        ;$069F97   | 
CODE_069F98: ADC $7A38,x                                ;$069F98   | 
CODE_069F9B: STA $76,x                                  ;$069F9B   | 
CODE_069F9D: JMP CODE_069EE5                            ;$069F9D   | 

CODE_069FA0: LDA #$0023                                 ;$069FA0   | 
CODE_069FA3: JSL CODE_0085D2                            ;$069FA3   | 
CODE_069FA7: LDA #$0060                                 ;$069FA7   | 
CODE_069FAA: STA $61C6                                  ;$069FAA   | 
CODE_069FAD: STZ $1062                                  ;$069FAD   | 
CODE_069FB0: STZ $7220,x                                ;$069FB0   | 
CODE_069FB3: LDA #$FFF0                                 ;$069FB3   | 
CODE_069FB6: STA $7A38,x                                ;$069FB6   | 
CODE_069FB9: SEP #$20                                   ;$069FB9   | 
CODE_069FBB: INC $7A36,x                                ;$069FBB   | 
CODE_069FBE: INC $7A36,x                                ;$069FBE   | 
CODE_069FC1: REP #$20                                   ;$069FC1   | 
CODE_069FC3: RTL                                        ;$069FC3   | 

CODE_069FC4: LDX $12                                    ;$069FC4   | 
CODE_069FC6: LDA $18,x                                  ;$069FC6   | 
CODE_069FC8: CMP #$0100                                 ;$069FC8   | 
CODE_069FCB: BMI CODE_06A015                            ;$069FCB   | 
CODE_069FCD: LDA #$0010                                 ;$069FCD   | 
CODE_069FD0: STA $7A98,x                                ;$069FD0   | 
CODE_069FD3: BRA CODE_069FFD                            ;$069FD3   | 

CODE_069FD5: LDX $12                                    ;$069FD5   | 
CODE_069FD7: LDA $18,x                                  ;$069FD7   | 
CODE_069FD9: CMP $1060                                  ;$069FD9   | 
CODE_069FDC: BPL CODE_06A015                            ;$069FDC   | 
CODE_069FDE: LDA $105E                                  ;$069FDE   | 
CODE_069FE1: SEC                                        ;$069FE1   | 
CODE_069FE2: SBC #$0010                                 ;$069FE2   | 
CODE_069FE5: STA $105E                                  ;$069FE5   | 
CODE_069FE8: LDA $1060                                  ;$069FE8   | 
CODE_069FEB: CLC                                        ;$069FEB   | 
CODE_069FEC: ADC #$0010                                 ;$069FEC   | 
CODE_069FEF: STA $1060                                  ;$069FEF   | 
CODE_069FF2: BRA CODE_069FFD                            ;$069FF2   | 

CODE_069FF4: LDX $12                                    ;$069FF4   | 
CODE_069FF6: LDA $18,x                                  ;$069FF6   | 
CODE_069FF8: CMP $105E                                  ;$069FF8   | 
CODE_069FFB: BMI CODE_06A015                            ;$069FFB   | 
CODE_069FFD: LDA $7A38,x                                ;$069FFD   | 
CODE_06A000: EOR #$FFFF                                 ;$06A000   | 
CODE_06A003: INC A                                      ;$06A003   | 
CODE_06A004: STA $7A38,x                                ;$06A004   | 
CODE_06A007: SEP #$20                                   ;$06A007   | 
CODE_06A009: INC $7A36,x                                ;$06A009   | 
CODE_06A00C: INC $7A36,x                                ;$06A00C   | 
CODE_06A00F: REP #$20                                   ;$06A00F   | 
CODE_06A011: JSR CODE_06A978                            ;$06A011   | 
CODE_06A014: RTL                                        ;$06A014   | 

CODE_06A015: LDA $18,x                                  ;$06A015   | 
CODE_06A017: SEC                                        ;$06A017   | 
CODE_06A018: SBC $7A38,x                                ;$06A018   | 
CODE_06A01B: STA $18,x                                  ;$06A01B   | 
CODE_06A01D: LDA $76,x                                  ;$06A01D   | 
CODE_06A01F: CLC                                        ;$06A01F   | 
CODE_06A020: ADC $7A38,x                                ;$06A020   | 
CODE_06A023: STA $76,x                                  ;$06A023   | 
CODE_06A025: JSR CODE_06A978                            ;$06A025   | 
CODE_06A028: RTL                                        ;$06A028   | 

CODE_06A029: LDX $12                                    ;$06A029   | 
CODE_06A02B: LDA $7A98,x                                ;$06A02B   | 
CODE_06A02E: BNE CODE_06A040                            ;$06A02E   | 
CODE_06A030: SEP #$20                                   ;$06A030   | 
CODE_06A032: LDA #$08                                   ;$06A032   | 
CODE_06A034: STA $7A98,x                                ;$06A034   | 
CODE_06A037: INC $7A36,x                                ;$06A037   | 
CODE_06A03A: INC $7A36,x                                ;$06A03A   | 
CODE_06A03D: REP #$20                                   ;$06A03D   | 
CODE_06A03F: RTL                                        ;$06A03F   | 

CODE_06A040: JSR CODE_06A978                            ;$06A040   | 
CODE_06A043: RTL                                        ;$06A043   | 

CODE_06A044: LDX $12                                    ;$06A044   | 
CODE_06A046: LDY $7902,x                                ;$06A046   | 
CODE_06A049: BEQ CODE_06A050                            ;$06A049   | 
CODE_06A04B: LDA $7A98,x                                ;$06A04B   | 
CODE_06A04E: BEQ CODE_06A065                            ;$06A04E   | 
CODE_06A050: JSR CODE_06A978                            ;$06A050   | 
CODE_06A053: LDY $7900,x                                ;$06A053   | 
CODE_06A056: CPY #$7F                                   ;$06A056   | 
CODE_06A058: BCS CODE_06A065                            ;$06A058   | 
CODE_06A05A: SEP #$20                                   ;$06A05A   | 
CODE_06A05C: INC $7900,x                                ;$06A05C   | 
CODE_06A05F: INC $7900,x                                ;$06A05F   | 
CODE_06A062: REP #$20                                   ;$06A062   | 
CODE_06A064: RTL                                        ;$06A064   | 

CODE_06A065: LDX #$03                                   ;$06A065   | 
CODE_06A067: JSR CODE_06A984                            ;$06A067   | 
CODE_06A06A: JSR CODE_06A849                            ;$06A06A   | 
CODE_06A06D: SEP #$20                                   ;$06A06D   | 
CODE_06A06F: LDA #$20                                   ;$06A06F   | 
CODE_06A071: STA $7A98,x                                ;$06A071   | 
CODE_06A074: INC $7A36,x                                ;$06A074   | 
CODE_06A077: INC $7A36,x                                ;$06A077   | 
CODE_06A07A: REP #$20                                   ;$06A07A   | 
CODE_06A07C: LDY $7902,x                                ;$06A07C   | 
CODE_06A07F: BNE CODE_06A088                            ;$06A07F   | 
CODE_06A081: JSL CODE_028925                            ;$06A081   | 
CODE_06A085: JSR CODE_06A920                            ;$06A085   | 
CODE_06A088: RTL                                        ;$06A088   | 

CODE_06A089: LDX $12                                    ;$06A089   | 
CODE_06A08B: LDY $7902,x                                ;$06A08B   | 
CODE_06A08E: BNE CODE_06A097                            ;$06A08E   | 
CODE_06A090: JSL CODE_02A982                            ;$06A090   | 
CODE_06A094: JSR CODE_06A934                            ;$06A094   | 
CODE_06A097: JSR CODE_06A9FB                            ;$06A097   | 
CODE_06A09A: LDA $7A98,x                                ;$06A09A   | 
CODE_06A09D: BNE CODE_06A0AE                            ;$06A09D   | 
CODE_06A09F: SEP #$20                                   ;$06A09F   | 
CODE_06A0A1: LDA #$01                                   ;$06A0A1   | 
CODE_06A0A3: STA $7903,x                                ;$06A0A3   | 
CODE_06A0A6: INC $7A36,x                                ;$06A0A6   | 
CODE_06A0A9: INC $7A36,x                                ;$06A0A9   | 
CODE_06A0AC: REP #$20                                   ;$06A0AC   | 
CODE_06A0AE: RTL                                        ;$06A0AE   | 

CODE_06A0AF: LDX $12                                    ;$06A0AF   | 
CODE_06A0B1: JSR CODE_06A9FB                            ;$06A0B1   | 
CODE_06A0B4: LDY $7902,x                                ;$06A0B4   | 
CODE_06A0B7: BNE CODE_06A0BC                            ;$06A0B7   | 
CODE_06A0B9: JSR CODE_06A934                            ;$06A0B9   | 
CODE_06A0BC: LDY $7902,x                                ;$06A0BC   | 
CODE_06A0BF: LDA $99B8,y                                ;$06A0BF   | 
CODE_06A0C2: STA $301C                                  ;$06A0C2   | 
CODE_06A0C5: LDA #$005F                                 ;$06A0C5   | 
CODE_06A0C8: STA $3000                                  ;$06A0C8   | 
CODE_06A0CB: LDA $7903,x                                ;$06A0CB   | 
CODE_06A0CE: AND #$00FF                                 ;$06A0CE   | 
CODE_06A0D1: STA $300C                                  ;$06A0D1   | 
CODE_06A0D4: LDA #$0061                                 ;$06A0D4   | 
CODE_06A0D7: STA $3010                                  ;$06A0D7   | 
CODE_06A0DA: LDA #$000E                                 ;$06A0DA   | 
CODE_06A0DD: STA $3018                                  ;$06A0DD   | 
CODE_06A0E0: PHY                                        ;$06A0E0   | 
CODE_06A0E1: LDX #$08                                   ;$06A0E1   | 
CODE_06A0E3: LDA #$E167                                 ;$06A0E3   | 
CODE_06A0E6: JSL CODE_7EDE44                            ;$06A0E6   | 

CODE_06A0EA: PLY                                        ;$06A0EA   | 
CODE_06A0EB: LDX $12                                    ;$06A0EB   | 
CODE_06A0ED: LDA $99C4,y                                ;$06A0ED   | 
CODE_06A0F0: STA $301C                                  ;$06A0F0   | 
CODE_06A0F3: LDA #$005F                                 ;$06A0F3   | 
CODE_06A0F6: STA $3000                                  ;$06A0F6   | 
CODE_06A0F9: LDA $7903,x                                ;$06A0F9   | 
CODE_06A0FC: AND #$00FF                                 ;$06A0FC   | 
CODE_06A0FF: STA $300C                                  ;$06A0FF   | 
CODE_06A102: LDA #$00E8                                 ;$06A102   | 
CODE_06A105: STA $3010                                  ;$06A105   | 
CODE_06A108: LDA #$0004                                 ;$06A108   | 
CODE_06A10B: STA $3018                                  ;$06A10B   | 
CODE_06A10E: PHY                                        ;$06A10E   | 
CODE_06A10F: LDX #$08                                   ;$06A10F   | 
CODE_06A111: LDA #$E167                                 ;$06A111   | 
CODE_06A114: JSL CODE_7EDE44                            ;$06A114   | 

CODE_06A118: PLY                                        ;$06A118   | 
CODE_06A119: LDX $12                                    ;$06A119   | 
CODE_06A11B: LDA $99D0,y                                ;$06A11B   | 
CODE_06A11E: STA $301C                                  ;$06A11E   | 
CODE_06A121: LDA #$005F                                 ;$06A121   | 
CODE_06A124: STA $3000                                  ;$06A124   | 
CODE_06A127: LDA $7903,x                                ;$06A127   | 
CODE_06A12A: AND #$00FF                                 ;$06A12A   | 
CODE_06A12D: STA $300C                                  ;$06A12D   | 
CODE_06A130: LDA #$00F8                                 ;$06A130   | 
CODE_06A133: STA $3010                                  ;$06A133   | 
CODE_06A136: LDA #$0004                                 ;$06A136   | 
CODE_06A139: STA $3018                                  ;$06A139   | 
CODE_06A13C: LDX #$08                                   ;$06A13C   | 
CODE_06A13E: LDA #$E167                                 ;$06A13E   | 
CODE_06A141: JSL CODE_7EDE44                            ;$06A141   | 

CODE_06A145: LDX $12                                    ;$06A145   | 
CODE_06A147: SEP #$20                                   ;$06A147   | 
CODE_06A149: LDA $7903,x                                ;$06A149   | 
CODE_06A14C: CLC                                        ;$06A14C   | 
CODE_06A14D: ADC #$04                                   ;$06A14D   | 
CODE_06A14F: STA $7903,x                                ;$06A14F   | 
CODE_06A152: BCC CODE_06A171                            ;$06A152   | 
CODE_06A154: JSR CODE_06A8C8                            ;$06A154   | 
CODE_06A157: LDA #$05                                   ;$06A157   | 
CODE_06A159: STA $74A2,x                                ;$06A159   | 
CODE_06A15C: DEC $7902,x                                ;$06A15C   | 
CODE_06A15F: DEC $7902,x                                ;$06A15F   | 
CODE_06A162: BMI CODE_06A174                            ;$06A162   | 
CODE_06A164: LDA #$1A                                   ;$06A164   | 
CODE_06A166: STA $7A36,x                                ;$06A166   | 
CODE_06A169: REP #$20                                   ;$06A169   | 
CODE_06A16B: LDA #$FFF8                                 ;$06A16B   | 
CODE_06A16E: STA $7A38,x                                ;$06A16E   | 
CODE_06A171: REP #$20                                   ;$06A171   | 
CODE_06A173: RTL                                        ;$06A173   | 

CODE_06A174: INC $7A36,x                                ;$06A174   | 
CODE_06A177: INC $7A36,x                                ;$06A177   | 
CODE_06A17A: LDA #$9D02                                 ;$06A17A   | 
CODE_06A17D: AND [$7A],y                                ;$06A17D   | 
CODE_06A17F: REP #$20                                   ;$06A17F   | 
CODE_06A181: LDA #$0020                                 ;$06A181   | 
CODE_06A184: STA $7A96,x                                ;$06A184   | 
CODE_06A187: LDA #$0100                                 ;$06A187   | 
CODE_06A18A: STA $18,x                                  ;$06A18A   | 
CODE_06A18C: STA $76,x                                  ;$06A18C   | 
CODE_06A18E: RTL                                        ;$06A18E   | 

CODE_06A18F: LDX $12                                    ;$06A18F   | 
CODE_06A191: JSR CODE_06A934                            ;$06A191   | 
CODE_06A194: LDA $7A96,x                                ;$06A194   | 
CODE_06A197: BNE CODE_06A1D1                            ;$06A197   | 
CODE_06A199: LDA #$00A0                                 ;$06A199   | 
CODE_06A19C: STA $7A96,x                                ;$06A19C   | 
CODE_06A19F: STZ $7542,x                                ;$06A19F   | 
CODE_06A1A2: TXY                                        ;$06A1A2   | 
CODE_06A1A3: LDA $10                                    ;$06A1A3   | 
CODE_06A1A5: AND #$007E                                 ;$06A1A5   | 
CODE_06A1A8: TAX                                        ;$06A1A8   | 
CODE_06A1A9: LDA $00E9D4,x                              ;$06A1A9   | 
CODE_06A1AD: ASL A                                      ;$06A1AD   | 
CODE_06A1AE: ASL A                                      ;$06A1AE   | 
CODE_06A1AF: ASL A                                      ;$06A1AF   | 
CODE_06A1B0: ASL A                                      ;$06A1B0   | 
CODE_06A1B1: STA $7222,y                                ;$06A1B1   | 
CODE_06A1B4: LDA $00E954,x                              ;$06A1B4   | 
CODE_06A1B8: ASL A                                      ;$06A1B8   | 
CODE_06A1B9: ASL A                                      ;$06A1B9   | 
CODE_06A1BA: ASL A                                      ;$06A1BA   | 
CODE_06A1BB: ASL A                                      ;$06A1BB   | 
CODE_06A1BC: STA $7220,y                                ;$06A1BC   | 
CODE_06A1BF: TYX                                        ;$06A1BF   | 
CODE_06A1C0: LDA #$0020                                 ;$06A1C0   | 
CODE_06A1C3: JSL CODE_0085D2                            ;$06A1C3   | 
CODE_06A1C7: SEP #$20                                   ;$06A1C7   | 
CODE_06A1C9: INC $7A36,x                                ;$06A1C9   | 
CODE_06A1CC: INC $7A36,x                                ;$06A1CC   | 
CODE_06A1CF: REP #$20                                   ;$06A1CF   | 
CODE_06A1D1: RTL                                        ;$06A1D1   | 

DATA_06A1D2:         db $40, $00, $00, $00, $80, $00, $C0, $00

CODE_06A1DA: LDX $12                                    ;$06A1DA   | 
CODE_06A1DC: JSR CODE_06A934                            ;$06A1DC   | 
CODE_06A1DF: LDA $7A98,x                                ;$06A1DF   | 
CODE_06A1E2: BNE CODE_06A215                            ;$06A1E2   | 
CODE_06A1E4: LDA #$01DF                                 ;$06A1E4   | 
CODE_06A1E7: JSL CODE_008B21                            ;$06A1E7   | 
CODE_06A1EB: LDA $70E2,x                                ;$06A1EB   | 
CODE_06A1EE: STA $70A2,y                                ;$06A1EE   | 
CODE_06A1F1: LDA $7182,x                                ;$06A1F1   | 
CODE_06A1F4: STA $7142,y                                ;$06A1F4   | 
CODE_06A1F7: LDA #$0005                                 ;$06A1F7   | 
CODE_06A1FA: STA $7E4C,y                                ;$06A1FA   | 
CODE_06A1FD: LDA #$0005                                 ;$06A1FD   | 
CODE_06A200: STA $73C2,y                                ;$06A200   | 
CODE_06A203: LDA #$0004                                 ;$06A203   | 
CODE_06A206: STA $7782,y                                ;$06A206   | 
CODE_06A209: LDA #$0006                                 ;$06A209   | 
CODE_06A20C: STA $7462,y                                ;$06A20C   | 
CODE_06A20F: LDA #$0002                                 ;$06A20F   | 
CODE_06A212: STA $7A98,x                                ;$06A212   | 
CODE_06A215: LDY #$00                                   ;$06A215   | 
CODE_06A217: LDA $7680,x                                ;$06A217   | 
CODE_06A21A: AND #$FF00                                 ;$06A21A   | 
CODE_06A21D: BEQ CODE_06A22F                            ;$06A21D   | 
CODE_06A21F: BPL CODE_06A223                            ;$06A21F   | 
CODE_06A221: INY                                        ;$06A221   | 
CODE_06A222: INY                                        ;$06A222   | 
CODE_06A223: LDA $7222,x                                ;$06A223   | 
CODE_06A226: BMI CODE_06A24D                            ;$06A226   | 
CODE_06A228: TYA                                        ;$06A228   | 
CODE_06A229: ORA #$0004                                 ;$06A229   | 
CODE_06A22C: TAY                                        ;$06A22C   | 
CODE_06A22D: BRA CODE_06A24D                            ;$06A22D   | 

CODE_06A22F: LDA $7682,x                                ;$06A22F   | 
CODE_06A232: BMI CODE_06A23F                            ;$06A232   | 
CODE_06A234: CLC                                        ;$06A234   | 
CODE_06A235: ADC #$0040                                 ;$06A235   | 
CODE_06A238: AND #$FF00                                 ;$06A238   | 
CODE_06A23B: BEQ CODE_06A27E                            ;$06A23B   | 
CODE_06A23D: BPL CODE_06A243                            ;$06A23D   | 
CODE_06A23F: INY                                        ;$06A23F   | 
CODE_06A240: INY                                        ;$06A240   | 
CODE_06A241: INY                                        ;$06A241   | 
CODE_06A242: INY                                        ;$06A242   | 
CODE_06A243: LDA $7220,x                                ;$06A243   | 
CODE_06A246: BMI CODE_06A24D                            ;$06A246   | 
CODE_06A248: TYA                                        ;$06A248   | 
CODE_06A249: ORA #$0002                                 ;$06A249   | 
CODE_06A24C: TAY                                        ;$06A24C   | 
CODE_06A24D: LDA $10                                    ;$06A24D   | 
CODE_06A24F: AND #$003F                                 ;$06A24F   | 
CODE_06A252: CLC                                        ;$06A252   | 
CODE_06A253: ADC $A1D2,y                                ;$06A253   | 
CODE_06A256: REP #$10                                   ;$06A256   | 
CODE_06A258: AND #$00FF                                 ;$06A258   | 
CODE_06A25B: ASL A                                      ;$06A25B   | 
CODE_06A25C: TXY                                        ;$06A25C   | 
CODE_06A25D: TAX                                        ;$06A25D   | 
CODE_06A25E: LDA $00E9D4,x                              ;$06A25E   | 
CODE_06A262: ASL A                                      ;$06A262   | 
CODE_06A263: ASL A                                      ;$06A263   | 
CODE_06A264: ASL A                                      ;$06A264   | 
CODE_06A265: ASL A                                      ;$06A265   | 
CODE_06A266: STA $7222,y                                ;$06A266   | 
CODE_06A269: LDA $00E954,x                              ;$06A269   | 
CODE_06A26D: ASL A                                      ;$06A26D   | 
CODE_06A26E: ASL A                                      ;$06A26E   | 
CODE_06A26F: ASL A                                      ;$06A26F   | 
CODE_06A270: ASL A                                      ;$06A270   | 
CODE_06A271: STA $7220,y                                ;$06A271   | 
CODE_06A274: SEP #$10                                   ;$06A274   | 
CODE_06A276: TYX                                        ;$06A276   | 
CODE_06A277: LDA #$0020                                 ;$06A277   | 
CODE_06A27A: JSL CODE_0085D2                            ;$06A27A   | 
CODE_06A27E: LDA $18,x                                  ;$06A27E   | 
CODE_06A280: CMP #$0020                                 ;$06A280   | 
CODE_06A283: BCC CODE_06A294                            ;$06A283   | 
CODE_06A285: SEC                                        ;$06A285   | 
CODE_06A286: SBC #$0002                                 ;$06A286   | 
CODE_06A289: STA $18,x                                  ;$06A289   | 
CODE_06A28B: LDA $76,x                                  ;$06A28B   | 
CODE_06A28D: SEC                                        ;$06A28D   | 
CODE_06A28E: SBC #$0002                                 ;$06A28E   | 
CODE_06A291: STA $76,x                                  ;$06A291   | 
CODE_06A293: RTL                                        ;$06A293   | 

CODE_06A294: LDA $7A96,x                                ;$06A294   | 
CODE_06A297: BNE CODE_06A304                            ;$06A297   | 
CODE_06A299: LDA $7680,x                                ;$06A299   | 
CODE_06A29C: CMP #$0040                                 ;$06A29C   | 
CODE_06A29F: BCC CODE_06A304                            ;$06A29F   | 
CODE_06A2A1: CMP #$00C0                                 ;$06A2A1   | 
CODE_06A2A4: BCS CODE_06A304                            ;$06A2A4   | 
CODE_06A2A6: LDA $7682,x                                ;$06A2A6   | 
CODE_06A2A9: CMP #$0040                                 ;$06A2A9   | 
CODE_06A2AC: BCC CODE_06A304                            ;$06A2AC   | 
CODE_06A2AE: CMP #$0080                                 ;$06A2AE   | 
CODE_06A2B1: BCS CODE_06A304                            ;$06A2B1   | 
CODE_06A2B3: LDA #$01E6                                 ;$06A2B3   | 
CODE_06A2B6: JSL CODE_008B21                            ;$06A2B6   | 
CODE_06A2BA: LDA $70E2,x                                ;$06A2BA   | 
CODE_06A2BD: STA $70A2,y                                ;$06A2BD   | 
CODE_06A2C0: LDA $7182,x                                ;$06A2C0   | 
CODE_06A2C3: SEC                                        ;$06A2C3   | 
CODE_06A2C4: SBC #$0008                                 ;$06A2C4   | 
CODE_06A2C7: STA $7142,y                                ;$06A2C7   | 
CODE_06A2CA: LDA #$0006                                 ;$06A2CA   | 
CODE_06A2CD: STA $73C2,y                                ;$06A2CD   | 
CODE_06A2D0: STA $7E4C,y                                ;$06A2D0   | 
CODE_06A2D3: LDA #$0004                                 ;$06A2D3   | 
CODE_06A2D6: STA $7782,y                                ;$06A2D6   | 
CODE_06A2D9: LDA $70E2,x                                ;$06A2D9   | 
CODE_06A2DC: STA $00                                    ;$06A2DC   | 
CODE_06A2DE: LDA $7182,x                                ;$06A2DE   | 
CODE_06A2E1: SEC                                        ;$06A2E1   | 
CODE_06A2E2: SBC #$0008                                 ;$06A2E2   | 
CODE_06A2E5: STA $02                                    ;$06A2E5   | 
CODE_06A2E7: JSL CODE_02E19C                            ;$06A2E7   | 
CODE_06A2EB: SEP #$20                                   ;$06A2EB   | 
CODE_06A2ED: LDA #$02                                   ;$06A2ED   | 
CODE_06A2EF: TRB $0967                                  ;$06A2EF   | 
CODE_06A2F2: LDA #$FF                                   ;$06A2F2   | 
CODE_06A2F4: STA $74A2,x                                ;$06A2F4   | 
CODE_06A2F7: LDA #$04                                   ;$06A2F7   | 
CODE_06A2F9: STA $7A37,x                                ;$06A2F9   | 
CODE_06A2FC: INC $7A36,x                                ;$06A2FC   | 
CODE_06A2FF: INC $7A36,x                                ;$06A2FF   | 
CODE_06A302: REP #$20                                   ;$06A302   | 
CODE_06A304: RTL                                        ;$06A304   | 

CODE_06A305: LDX $12                                    ;$06A305   | 
CODE_06A307: JSR CODE_06A934                            ;$06A307   | 
CODE_06A30A: JML CODE_03A32E                            ;$06A30A   | 

CODE_06A30E: RTL                                        ;$06A30E   | 

DATA_06A30F:         db $00, $01, $02, $03
DATA_06A313:         db $03, $02, $01, $00
DATA_06A317:         db $00, $00, $00, $02
DATA_06A31B:         db $00, $00, $00, $00

; burt sub
    LDX $12             ; $06A31F   |
    RTS                 ; $06A321   |

; burt sub
    LDX $12             ; $06A322   |
    LDA $7A96,x         ; $06A324   |
    BNE CODE_06A347     ; $06A327   |
    SEP #$20            ; $06A329   |
    DEC $79,x           ; $06A32B   |
    BMI CODE_06A348     ; $06A32D   |
    LDY $79,x           ; $06A32F   |
    LDA #$04            ; $06A331   |
    STA $7A96,x         ; $06A333   |
    LDA $A30F,y         ; $06A336   |
    STA $7402,x         ; $06A339   |
    LDA $7400,x         ; $06A33C   |
    EOR $A317,y         ; $06A33F   |
    STA $7400,x         ; $06A342   |
    REP #$20            ; $06A345   |

CODE_06A347:
    RTS                 ; $06A347   |

CODE_06A348:
    STZ $78,x           ; $06A348   |
    REP #$20            ; $06A34A   |
    RTS                 ; $06A34C   |

; burt sub
    LDX $12             ; $06A34D   |
    LDA $7A96,x         ; $06A34F   |
    BNE CODE_06A369     ; $06A352   |
    SEP #$20            ; $06A354   |
    DEC $79,x           ; $06A356   |
    BMI CODE_06A36A     ; $06A358   |
    LDY $79,x           ; $06A35A   |
    LDA #$02            ; $06A35C   |
    STA $7A96,x         ; $06A35E   |
    LDA $A30F,y         ; $06A361   |
    STA $7402,x         ; $06A364   |
    REP #$20            ; $06A367   |

CODE_06A369:
    RTS                 ; $06A369   |

CODE_06A36A:
    STZ $78,x           ; $06A36A   |
    REP #$20            ; $06A36C   |
    RTS                 ; $06A36E   |

; burt sub
    LDX $12             ; $06A36F   |
    LDY $74A2,x         ; $06A371   |
    CPY #$FF            ; $06A374   |
    BEQ CODE_06A3EC     ; $06A376   |
    LDA $7362,x         ; $06A378   |
    BMI CODE_06A3EC     ; $06A37B   |
    LDA #$01C0          ; $06A37D   |
    STA $6000           ; $06A380   |
    LDA #$01C2          ; $06A383   |
    STA $6002           ; $06A386   |
    LDA #$01E0          ; $06A389   |
    STA $6004           ; $06A38C   |
    LDA #$01E2          ; $06A38F   |
    STA $6006           ; $06A392   |
    LDA #$01C4          ; $06A395   |
    STA $6008           ; $06A398   |
    LDA #$01C6          ; $06A39B   |
    STA $600A           ; $06A39E   |
    LDA #$01E4          ; $06A3A1   |
    STA $600C           ; $06A3A4   |
    LDA #$01E6          ; $06A3A7   |
    STA $600E           ; $06A3AA   |
    LDA #$01C8          ; $06A3AD   |
    STA $6010           ; $06A3B0   |
    LDA #$01E8          ; $06A3B3   |
    STA $6012           ; $06A3B6   |
    LDA #$01CC          ; $06A3B9   |
    STA $6014           ; $06A3BC   |
    LDA #$01CE          ; $06A3BF   |
    STA $6016           ; $06A3C2   |
    LDA #$01EC          ; $06A3C5   |
    STA $6018           ; $06A3C8   |
    LDA #$01EE          ; $06A3CB   |
    STA $601A           ; $06A3CE   |
    LDA #$01CA          ; $06A3D1   |
    STA $601C           ; $06A3D4   |
    STA $601E           ; $06A3D7   |
    LDA #$01EA          ; $06A3DA   |
    STA $6020           ; $06A3DD   |
    STA $6022           ; $06A3E0   |
    LDX #$09            ; $06A3E3   |
    LDA #$A122          ; $06A3E5   |
    JSL $7EDE44         ; $06A3E8   |

CODE_06A3EC:
    LDX $12             ; $06A3EC   |
    RTS                 ; $06A3EE   |

; burt sub
    LDX $12             ; $06A3EF   |
    LDY $74A2,x         ; $06A3F1   |
    CPY #$FF            ; $06A3F4   |
    BEQ CODE_06A406     ; $06A3F6   |
    LDA $7362,x         ; $06A3F8   |
    BMI CODE_06A406     ; $06A3FB   |
    LDX #$09            ; $06A3FD   |
    LDA #$A511          ; $06A3FF   |
    JSL $7EDE44         ; $06A402   |

CODE_06A406:
    LDX $12             ; $06A406   |
    RTS                 ; $06A408   |

DATA_06A409:         dw $0100
DATA_06A40B:         dw $0000
DATA_06A40D:         dw $00E6
DATA_06A40F:         dw $0007
DATA_06A411:         dw $00B3
DATA_06A413:         dw $000E
DATA_06A415:         dw $0066
DATA_06A417:         dw $0015

DATA_06A419:         dw $0100
DATA_06A41B:         dw $00CC
DATA_06A41D:         dw $0099
DATA_06A41F:         dw $0066

DATA_06A421:         dw $0100
DATA_06A423:         dw $00E6
DATA_06A425:         dw $00CC
DATA_06A427:         dw $00B3

; burt sub
    LDX $12             ; $06A429   |
    REP #$10            ; $06A42B   |
    LDA $16,x           ; $06A42D   |
    EOR #$FFFF          ; $06A42F   |
    INC A               ; $06A432   |
    XBA                 ; $06A433   |
    AND #$00FF          ; $06A434   |
    STA $300A           ; $06A437   |
    LDA #$0000          ; $06A43A   |
    STA $3006           ; $06A43D   |
    LDA #$0000          ; $06A440   |
    STA $3004           ; $06A443   |
    LDA #$0100          ; $06A446   |
    STA $300C           ; $06A449   |
    LDA #$6000          ; $06A44C   |
    STA $3018           ; $06A44F   |
    LDA #$0056          ; $06A452   |
    STA $301A           ; $06A455   |
    SEP #$10            ; $06A458   |
    LDX #$08            ; $06A45A   |
    LDA #$8205          ; $06A45C   |
    JSL $7EDE44         ; $06A45F   |
    LDX $12             ; $06A463   |
    LDA $7402,x         ; $06A465   |
    ASL A               ; $06A468   |
    TAY                 ; $06A469   |
    LDA $A421,y         ; $06A46A   |
    STA $300C           ; $06A46D   |
    LDA #$0100          ; $06A470   |
    STA $3016           ; $06A473   |
    LDA #$001C          ; $06A476   |
    STA $3010           ; $06A479   |
    LDA #$0010          ; $06A47C   |
    STA $3012           ; $06A47F   |
    LDA #$0020          ; $06A482   |
    STA $3006           ; $06A485   |
    LDA #$0000          ; $06A488   |
    STA $3004           ; $06A48B   |
    LDA #$6000          ; $06A48E   |
    STA $3018           ; $06A491   |
    LDA #$0056          ; $06A494   |
    STA $301A           ; $06A497   |
    LDX #$08            ; $06A49A   |
    LDA #$8295          ; $06A49C   |
    JSL $7EDE44         ; $06A49F   |
    LDX $12             ; $06A4A3   |
    LDA $7402,x         ; $06A4A5   |
    ASL A               ; $06A4A8   |
    ASL A               ; $06A4A9   |
    TAY                 ; $06A4AA   |
    LDA $18,x           ; $06A4AB   |
    STA $3000           ; $06A4AD   |
    LDA $A409,y         ; $06A4B0   |
    STA $300C           ; $06A4B3   |
    PHX                 ; $06A4B6   |
    PHY                 ; $06A4B7   |
    LDX #$0B            ; $06A4B8   |
    LDA #$86B6          ; $06A4BA   |
    JSL $7EDE44         ; $06A4BD   |
    PLY                 ; $06A4C1   |
    PLX                 ; $06A4C2   |
    LDA $79D6,x         ; $06A4C3   |
    CMP $3000           ; $06A4C6   |
    BPL CODE_06A4DC     ; $06A4C9   |
    LDA $A40B,y         ; $06A4CB   |
    BEQ CODE_06A4DF     ; $06A4CE   |
    LDA $A40B,y         ; $06A4D0   |
    EOR #$FFFF          ; $06A4D3   |
    INC A               ; $06A4D6   |
    AND #$00FF          ; $06A4D7   |
    BRA CODE_06A4DF     ; $06A4DA   |

CODE_06A4DC:
    LDA $A40B,y         ; $06A4DC   |

CODE_06A4DF:
    STA $300A           ; $06A4DF   |
    LDA $3000           ; $06A4E2   |
    STA $300C           ; $06A4E5   |
    LDA $76,x           ; $06A4E8   |
    STA $3016           ; $06A4EA   |
    LDA #$0060          ; $06A4ED   |
    STA $3006           ; $06A4F0   |
    LDA #$0000          ; $06A4F3   |
    STA $3004           ; $06A4F6   |
    LDA #$6040          ; $06A4F9   |
    STA $3018           ; $06A4FC   |
    LDA #$0056          ; $06A4FF   |
    STA $301A           ; $06A502   |
    LDX #$08            ; $06A505   |
    LDA #$84A5          ; $06A507   |
    JSL $7EDE44         ; $06A50A   |
    LDX $12             ; $06A50E   |
    LDA $7402,x         ; $06A510   |
    ASL A               ; $06A513   |
    TAY                 ; $06A514   |
    LDA $18,x           ; $06A515   |
    STA $3000           ; $06A517   |
    LDA $A419,y         ; $06A51A   |
    STA $300C           ; $06A51D   |
    PHX                 ; $06A520   |
    PHY                 ; $06A521   |
    LDX #$0B            ; $06A522   |
    LDA #$86B6          ; $06A524   |
    JSL $7EDE44         ; $06A527   |
    PLY                 ; $06A52B   |
    PLX                 ; $06A52C   |
    LDA $3000           ; $06A52D   |
    STA $300C           ; $06A530   |
    STA $00             ; $06A533   |
    LDA $76,x           ; $06A535   |
    STA $3016           ; $06A537   |
    LDA #$000F          ; $06A53A   |
    STA $3010           ; $06A53D   |
    LDA #$000F          ; $06A540   |
    STA $3012           ; $06A543   |
    LDA #$0050          ; $06A546   |
    STA $3006           ; $06A549   |
    LDA #$0000          ; $06A54C   |
    STA $3004           ; $06A54F   |
    LDA #$7030          ; $06A552   |
    STA $3018           ; $06A555   |
    LDA #$0056          ; $06A558   |
    STA $301A           ; $06A55B   |
    LDX #$08            ; $06A55E   |
    LDA #$861B          ; $06A560   |
    JSL $7EDE44         ; $06A563   |
    LDX $12             ; $06A567   |
    LDA $00             ; $06A569   |
    STA $300C           ; $06A56B   |
    LDA $76,x           ; $06A56E   |
    STA $3016           ; $06A570   |
    LDA #$000F          ; $06A573   |
    STA $3010           ; $06A576   |
    LDA #$0000          ; $06A579   |
    STA $3012           ; $06A57C   |
    LDA #$0050          ; $06A57F   |
    STA $3006           ; $06A582   |
    LDA #$0010          ; $06A585   |
    STA $3004           ; $06A588   |
    LDA #$7020          ; $06A58B   |
    STA $3018           ; $06A58E   |
    LDA #$0056          ; $06A591   |
    STA $301A           ; $06A594   |
    LDX #$08            ; $06A597   |
    LDA #$861B          ; $06A599   |
    JSL $7EDE44         ; $06A59C   |
    INC $0CF9           ; $06A5A0   |
    LDX $12             ; $06A5A3   |
    RTS                 ; $06A5A5   |

; burt sub
    LDX $12             ; $06A5A6   |
    LDA $18,x           ; $06A5A8   |
    STA $300C           ; $06A5AA   |
    LDA $76,x           ; $06A5AD   |
    STA $3016           ; $06A5AF   |
    LDA #$0010          ; $06A5B2   |
    STA $3010           ; $06A5B5   |
    LDA #$0010          ; $06A5B8   |
    STA $3012           ; $06A5BB   |
    LDA #$0000          ; $06A5BE   |
    STA $3006           ; $06A5C1   |
    LDA #$0000          ; $06A5C4   |
    STA $3004           ; $06A5C7   |
    LDA #$6000          ; $06A5CA   |
    STA $3018           ; $06A5CD   |
    LDA #$0056          ; $06A5D0   |
    STA $301A           ; $06A5D3   |
    LDX #$08            ; $06A5D6   |
    LDA #$8295          ; $06A5D8   |
    JSL $7EDE44         ; $06A5DB   |
    LDX $12             ; $06A5DF   |
    LDA $7402,x         ; $06A5E1   |
    ASL A               ; $06A5E4   |
    TAY                 ; $06A5E5   |
    LDA $18,x           ; $06A5E6   |
    STA $300C           ; $06A5E8   |
    LDA $76,x           ; $06A5EB   |
    STA $3016           ; $06A5ED   |
    LDA #$001C          ; $06A5F0   |
    STA $3010           ; $06A5F3   |
    LDA #$0010          ; $06A5F6   |
    STA $3012           ; $06A5F9   |
    LDA #$0020          ; $06A5FC   |
    STA $3006           ; $06A5FF   |
    LDA #$0000          ; $06A602   |
    STA $3004           ; $06A605   |
    LDA #$6000          ; $06A608   |
    STA $3018           ; $06A60B   |
    LDA #$0056          ; $06A60E   |
    STA $301A           ; $06A611   |
    LDX #$08            ; $06A614   |
    LDA #$8295          ; $06A616   |
    JSL $7EDE44         ; $06A619   |
    LDX $12             ; $06A61D   |
    LDA $18,x           ; $06A61F   |
    STA $300C           ; $06A621   |
    LDA $76,x           ; $06A624   |
    STA $3016           ; $06A626   |
    LDA #$0008          ; $06A629   |
    STA $3010           ; $06A62C   |
    LDA #$000F          ; $06A62F   |
    STA $3012           ; $06A632   |
    LDA #$0040          ; $06A635   |
    STA $3006           ; $06A638   |
    LDA #$0000          ; $06A63B   |
    STA $3004           ; $06A63E   |
    LDA #$6020          ; $06A641   |
    STA $3018           ; $06A644   |
    LDA #$0056          ; $06A647   |
    STA $301A           ; $06A64A   |
    LDX #$08            ; $06A64D   |
    LDA #$861B          ; $06A64F   |
    JSL $7EDE44         ; $06A652   |
    LDX $12             ; $06A656   |
    LDA $18,x           ; $06A658   |
    STA $300C           ; $06A65A   |
    LDA $76,x           ; $06A65D   |
    STA $3016           ; $06A65F   |
    LDA #$0001          ; $06A662   |
    STA $3010           ; $06A665   |
    LDA #$000E          ; $06A668   |
    STA $3012           ; $06A66B   |
    LDA #$0040          ; $06A66E   |
    STA $3006           ; $06A671   |
    LDA #$0010          ; $06A674   |
    STA $3004           ; $06A677   |
    LDA #$6030          ; $06A67A   |
    STA $3018           ; $06A67D   |
    LDA #$0056          ; $06A680   |
    STA $301A           ; $06A683   |
    LDX #$08            ; $06A686   |
    LDA #$861B          ; $06A688   |
    JSL $7EDE44         ; $06A68B   |
    LDX $12             ; $06A68F   |
    LDA $18,x           ; $06A691   |
    STA $300C           ; $06A693   |
    LDA $76,x           ; $06A696   |
    STA $3016           ; $06A698   |
    LDA #$0010          ; $06A69B   |
    STA $3010           ; $06A69E   |
    LDA #$0010          ; $06A6A1   |
    STA $3012           ; $06A6A4   |
    LDA #$0060          ; $06A6A7   |
    STA $3006           ; $06A6AA   |
    LDA #$0000          ; $06A6AD   |
    STA $3004           ; $06A6B0   |
    LDA #$6040          ; $06A6B3   |
    STA $3018           ; $06A6B6   |
    LDA #$0056          ; $06A6B9   |
    STA $301A           ; $06A6BC   |
    LDX #$08            ; $06A6BF   |
    LDA #$8295          ; $06A6C1   |
    JSL $7EDE44         ; $06A6C4   |
    LDX $12             ; $06A6C8   |
    LDA $18,x           ; $06A6CA   |
    STA $300C           ; $06A6CC   |
    LDA $76,x           ; $06A6CF   |
    STA $3016           ; $06A6D1   |
    LDA #$000F          ; $06A6D4   |
    STA $3010           ; $06A6D7   |
    LDA #$000F          ; $06A6DA   |
    STA $3012           ; $06A6DD   |
    LDA #$0050          ; $06A6E0   |
    STA $3006           ; $06A6E3   |
    LDA #$0000          ; $06A6E6   |
    STA $3004           ; $06A6E9   |
    LDA #$7030          ; $06A6EC   |
    STA $3018           ; $06A6EF   |
    LDA #$0056          ; $06A6F2   |
    STA $301A           ; $06A6F5   |
    LDX #$08            ; $06A6F8   |
    LDA #$861B          ; $06A6FA   |
    JSL $7EDE44         ; $06A6FD   |
    LDX $12             ; $06A701   |
    LDA $18,x           ; $06A703   |
    STA $300C           ; $06A705   |
    LDA $76,x           ; $06A708   |
    STA $3016           ; $06A70A   |
    LDA #$000F          ; $06A70D   |
    STA $3010           ; $06A710   |
    LDA #$0000          ; $06A713   |
    STA $3012           ; $06A716   |
    LDA #$0050          ; $06A719   |
    STA $3006           ; $06A71C   |
    LDA #$0010          ; $06A71F   |
    STA $3004           ; $06A722   |
    LDA #$7020          ; $06A725   |
    STA $3018           ; $06A728   |
    LDA #$0056          ; $06A72B   |
    STA $301A           ; $06A72E   |
    LDX #$08            ; $06A731   |
    LDA #$861B          ; $06A733   |
    JSL $7EDE44         ; $06A736   |
    INC $0CF9           ; $06A73A   |
    LDX $12             ; $06A73D   |
    RTS                 ; $06A73F   |

; burt sub
CODE_06A740: LDX $12                                    ;$06A740   | 
CODE_06A742: LDA $18,x                                  ;$06A742   | 
CODE_06A744: STA $300C                                  ;$06A744   | 
CODE_06A747: LDA $76,x                                  ;$06A747   | 
CODE_06A749: STA $3016                                  ;$06A749   | 
CODE_06A74C: LDA #$0010                                 ;$06A74C   | 
CODE_06A74F: STA $3010                                  ;$06A74F   | 
CODE_06A752: LDA #$001B                                 ;$06A752   | 
CODE_06A755: STA $3012                                  ;$06A755   | 
CODE_06A758: LDA #$0000                                 ;$06A758   | 
CODE_06A75B: STA $3006                                  ;$06A75B   | 
CODE_06A75E: LDA #$0000                                 ;$06A75E   | 
CODE_06A761: STA $3004                                  ;$06A761   | 
CODE_06A764: LDA #$80E1                                 ;$06A764   | 
CODE_06A767: STA $3018                                  ;$06A767   | 
CODE_06A76A: LDA #$0054                                 ;$06A76A   | 
CODE_06A76D: STA $301A                                  ;$06A76D   | 
CODE_06A770: LDX #$08                                   ;$06A770   | 
CODE_06A772: LDA #$8295                                 ;$06A772   | 
CODE_06A775: JSL CODE_7EDE44                            ;$06A775   | 

CODE_06A779: INC $0CF9                                  ;$06A779   | 
CODE_06A77C: LDX $12                                    ;$06A77C   | 
CODE_06A77E: RTS                                        ;$06A77E   | 

; burt sub
    LDA $7900,x         ; $06A77F   |
    AND #$00FF          ; $06A782   |
    STA $3002           ; $06A785   |
    LDA $7680,x         ; $06A788   |
    STA $3004           ; $06A78B   |
    LDA $7682,x         ; $06A78E   |
    STA $3006           ; $06A791   |
    LDA $18,x           ; $06A794   |
    STA $300A           ; $06A796   |
    LDA $76,x           ; $06A799   |
    STA $300E           ; $06A79B   |
    TXA                 ; $06A79E   |
    STA $6012           ; $06A79F   |
    LDA $60B0           ; $06A7A2   |
    STA $6014           ; $06A7A5   |
    LDA $60B2           ; $06A7A8   |
    STA $6016           ; $06A7AB   |
    LDA $60C2           ; $06A7AE   |
    STA $6018           ; $06A7B1   |
    LDX #$0A            ; $06A7B4   |
    LDA #$897A          ; $06A7B6   |
    JSL $7EDE91         ; $06A7B9   |
    JSL $00BE39         ; $06A7BD   |

; DMA args
DATA_06A7C1:         dl $7E5040, $703372
DATA_06A7C7:         dw $0348

    LDX $12             ; $06A7C9   |
    LDA #$0002          ; $06A7CB   |
    TSB $0967           ; $06A7CE   |
    LDA #$0018          ; $06A7D1   |
    TSB $094A           ; $06A7D4   |
    LDX $12             ; $06A7D7   |
    LDY $7A36,x         ; $06A7D9   |
    CPY #$48            ; $06A7DC   |
    BCS CODE_06A848     ; $06A7DE   |
    LDA $7860,x         ; $06A7E0   |
    BIT #$0001          ; $06A7E3   |
    BEQ CODE_06A80B     ; $06A7E6   |
    LDA $7222,x         ; $06A7E8   |
    BMI CODE_06A80B     ; $06A7EB   |
    LDA $6002           ; $06A7ED   |
    AND #$000F          ; $06A7F0   |
    STA $00             ; $06A7F3   |
    LDA $7182,x         ; $06A7F5   |
    SEC                 ; $06A7F8   |
    SBC $00             ; $06A7F9   |
    STA $7182,x         ; $06A7FB   |
    SEP #$20            ; $06A7FE   |
    STZ $7181,x         ; $06A800   |
    REP #$20            ; $06A803   |
    LDA #$0100          ; $06A805   |
    STA $7222,x         ; $06A808   |

CODE_06A80B:
    LDA $7860,x         ; $06A80B   |
    LDY $7221,x         ; $06A80E   |
    BMI CODE_06A821     ; $06A811   |
    BNE CODE_06A81A     ; $06A813   |
    LDY $7220,x         ; $06A815   |
    BEQ CODE_06A848     ; $06A818   |

CODE_06A81A:
    BIT #$0014          ; $06A81A   |
    BEQ CODE_06A848     ; $06A81D   |
    BRA CODE_06A826     ; $06A81F   |

CODE_06A821:
    BIT #$0028          ; $06A821   |
    BEQ CODE_06A848     ; $06A824   |

CODE_06A826:
    LDA $7220,x         ; $06A826   |
    EOR #$FFFF          ; $06A829   |
    INC A               ; $06A82C   |
    STA $7220,x         ; $06A82D   |
    LDY $79D8,x         ; $06A830   |
    BNE CODE_06A848     ; $06A833   |

CODE_06A835:
    SEP #$20            ; $06A835   |
    LDA #$02            ; $06A837   |
    STA $79D8,x         ; $06A839   |
    LDA #$07            ; $06A83C   |
    STA $79D9,x         ; $06A83E   |
    LDA #$04            ; $06A841   |
    STA $7A96,x         ; $06A843   |
    REP #$20            ; $06A846   |

CODE_06A848:
    RTS                 ; $06A848   |

; burt sub
    LDY $79D8,x         ; $06A849   |
    BNE CODE_06A85F     ; $06A84C   |
    LDA $70E2,x         ; $06A84E   |
    SEC                 ; $06A851   |
    SBC $611C           ; $06A852   |
    STA $00             ; $06A855   |
    LDA $7400,x         ; $06A857   |
    DEC A               ; $06A85A   |
    EOR $00             ; $06A85B   |
    BPL CODE_06A835     ; $06A85D   |

CODE_06A85F:
    RTS                 ; $06A85F   |

; burt sub
    LDY $7D36,x         ; $06A860   |
    DEY                 ; $06A863   |
    BMI CODE_06A8C7     ; $06A864   |
    BEQ CODE_06A8C7     ; $06A866   |
    LDA $6F00,y         ; $06A868   |
    CMP #$0010          ; $06A86B   |
    BNE CODE_06A8C7     ; $06A86E   |
    LDA $7D38,y         ; $06A870   |
    BEQ CODE_06A8C7     ; $06A873   |
    LDA $70E2,x         ; $06A875   |
    SEC                 ; $06A878   |
    SBC $7CD6,y         ; $06A879   |
    STA $00             ; $06A87C   |
    EOR #$FFFF          ; $06A87E   |
    INC A               ; $06A881   |
    STA $7C76,y         ; $06A882   |
    PHX                 ; $06A885   |
    TYX                 ; $06A886   |
    JSL $03B24B         ; $06A887   |
    PLX                 ; $06A88B   |
    LDA #$0200          ; $06A88C   |
    LDY $01             ; $06A88F   |
    BPL CODE_06A897     ; $06A891   |
    EOR #$FFFF          ; $06A893   |
    INC A               ; $06A896   |

CODE_06A897:
    STA $7220,x         ; $06A897   |
    LDA #$FE00          ; $06A89A   |
    STA $7222,x         ; $06A89D   |
    LDA #$0010          ; $06A8A0   |
    STA $7A38,x         ; $06A8A3   |
    LDA #$0140          ; $06A8A6   |
    STA $105E           ; $06A8A9   |
    LDA #$00C0          ; $06A8AC   |
    STA $1060           ; $06A8AF   |
    INC $1062           ; $06A8B2   |
    LDA #$0078          ; $06A8B5   |
    JSL $0085D2         ; $06A8B8   |
    SEP #$20            ; $06A8BC   |
    LDA #$20            ; $06A8BE   |
    STA $7A36,x         ; $06A8C0   |
    REP #$20            ; $06A8C3   |
    PLY                 ; $06A8C5   |
    PLA                 ; $06A8C6   |

CODE_06A8C7:
    RTL                 ; $06A8C7   |

; burt sub
    LDA #$5F            ; $06A8C8   |
    STA $02             ; $06A8CA   |
    REP #$20            ; $06A8CC   |
    LDY $7902,x         ; $06A8CE   |
    LDA $99B8,y         ; $06A8D1   |
    STA $00             ; $06A8D4   |
    PHY                 ; $06A8D6   |
    LDX #$1A            ; $06A8D7   |

CODE_06A8D9:
    TXY                 ; $06A8D9   |
    LDA [$00],y         ; $06A8DA   |
    STA $702E2E,x       ; $06A8DC   |
    STA $7020C2,x       ; $06A8E0   |
    DEX                 ; $06A8E4   |
    DEX                 ; $06A8E5   |
    BPL CODE_06A8D9     ; $06A8E6   |
    PLY                 ; $06A8E8   |
    LDA $99C4,y         ; $06A8E9   |
    STA $00             ; $06A8EC   |
    PHY                 ; $06A8EE   |
    LDX #$06            ; $06A8EF   |

CODE_06A8F1:
    TXY                 ; $06A8F1   |
    LDA [$00],y         ; $06A8F2   |
    STA $702F3C,x       ; $06A8F4   |
    STA $7021D0,x       ; $06A8F8   |
    DEX                 ; $06A8FC   |
    DEX                 ; $06A8FD   |
    BPL CODE_06A8F1     ; $06A8FE   |
    PLY                 ; $06A900   |
    LDA $99D0,y         ; $06A901   |
    STA $00             ; $06A904   |
    LDX #$06            ; $06A906   |

CODE_06A908:
    TXY                 ; $06A908   |
    LDA [$00],y         ; $06A909   |
    STA $702F5C,x       ; $06A90B   |
    STA $7021F0,x       ; $06A90F   |
    DEX                 ; $06A913   |
    DEX                 ; $06A914   |
    BPL CODE_06A908     ; $06A915   |
    SEP #$20            ; $06A917   |
    LDX $12             ; $06A919   |
    RTS                 ; $06A91B   |

DATA_06A91C:         dw $0200
DATA_06A91E:         dw $0100

; burt sub
    LDY #$00            ; $06A920   |
    LDA $70E2,x         ; $06A922   |
    SEC                 ; $06A925   |
    SBC $608C           ; $06A926   |
    BMI CODE_06A92D     ; $06A929   |
    INY                 ; $06A92B   |
    INY                 ; $06A92C   |

CODE_06A92D:
    LDA $A91C,y         ; $06A92D   |
    STA $617A           ; $06A930   |
    RTS                 ; $06A933   |

; burt sub
    LDA $70E2,x         ; $06A934   |
    SEC                 ; $06A937   |
    SBC $608C           ; $06A938   |
    CLC                 ; $06A93B   |
    ADC #$0060          ; $06A93C   |
    CMP #$00C0          ; $06A93F   |
    BCS CODE_06A947     ; $06A942   |
    STZ $617A           ; $06A944   |

CODE_06A947:
    RTS                 ; $06A947   |

DATA_06A948:         dl $5FA570
DATA_06A94B:         dl $702E2E
DATA_06A94E:         dl $702E2E
DATA_06A951:         dl $702E2E
DATA_06A954:         dl $5FA570
DATA_06A957:         dl $702E4E
DATA_06A95A:         dl $702E4E
DATA_06A95D:         dl $702E4E
DATA_06A960:         dl $5FA570
DATA_06A963:         dl $702F2E
DATA_06A966:         dl $702F2E
DATA_06A969:         dl $702F2E
DATA_06A96C:         dl $5FA570
DATA_06A96F:         dl $702F4E
DATA_06A972:         dl $702F4E
DATA_06A975:         dl $702F4E

; burt sub
    LDA $14             ; $06A978   |
    AND #$0003          ; $06A97A   |
    STA $00             ; $06A97D   |
    ASL A               ; $06A97F   |
    CLC                 ; $06A980   |
    ADC $00             ; $06A981   |
    TAX                 ; $06A983   |
    LDA $A948,x         ; $06A984   |
    STA $00             ; $06A987   |
    LDY $A94A,x         ; $06A989   |
    STY $02             ; $06A98C   |
    LDA #$20C2          ; $06A98E   |
    STA $04             ; $06A991   |
    LDY #$70            ; $06A993   |
    STY $06             ; $06A995   |
    LDY #$1C            ; $06A997   |

CODE_06A999:
    LDA [$00],y         ; $06A999   |
    STA [$04],y         ; $06A99B   |
    DEY                 ; $06A99D   |
    DEY                 ; $06A99E   |
    BPL CODE_06A999     ; $06A99F   |
    LDA $A954,x         ; $06A9A1   |
    STA $00             ; $06A9A4   |
    LDY $A956,x         ; $06A9A6   |
    STY $02             ; $06A9A9   |
    LDA #$20E2          ; $06A9AB   |
    STA $04             ; $06A9AE   |
    LDY #$70            ; $06A9B0   |
    STY $06             ; $06A9B2   |
    LDY #$1C            ; $06A9B4   |

CODE_06A9B6:
    LDA [$00],y         ; $06A9B6   |
    STA [$04],y         ; $06A9B8   |
    DEY                 ; $06A9BA   |
    DEY                 ; $06A9BB   |
    BPL CODE_06A9B6     ; $06A9BC   |
    LDA $A960,x         ; $06A9BE   |
    STA $00             ; $06A9C1   |
    LDY $A962,x         ; $06A9C3   |
    STY $02             ; $06A9C6   |
    LDA #$21C2          ; $06A9C8   |
    STA $04             ; $06A9CB   |
    LDY #$70            ; $06A9CD   |
    STY $06             ; $06A9CF   |
    LDY #$1C            ; $06A9D1   |

CODE_06A9D3:
    LDA [$00],y         ; $06A9D3   |
    STA [$04],y         ; $06A9D5   |
    DEY                 ; $06A9D7   |
    DEY                 ; $06A9D8   |
    BPL CODE_06A9D3     ; $06A9D9   |
    LDA $A96C,x         ; $06A9DB   |
    STA $00             ; $06A9DE   |
    LDY $A96E,x         ; $06A9E0   |
    STY $02             ; $06A9E3   |
    LDA #$21E2          ; $06A9E5   |
    STA $04             ; $06A9E8   |
    LDY #$70            ; $06A9EA   |
    STY $06             ; $06A9EC   |
    LDY #$1C            ; $06A9EE   |

CODE_06A9F0:
    LDA [$00],y         ; $06A9F0   |
    STA [$04],y         ; $06A9F2   |
    DEY                 ; $06A9F4   |
    DEY                 ; $06A9F5   |
    BPL CODE_06A9F0     ; $06A9F6   |
    LDX $12             ; $06A9F8   |
    RTS                 ; $06A9FA   |

; burt sub
    LDY $7902,x         ; $06A9FB   |
    BEQ CODE_06AA24     ; $06A9FE   |
    LDA $0030           ; $06AA00   |
    AND #$0003          ; $06AA03   |
    CMP #$0002          ; $06AA06   |
    BCS CODE_06AA11     ; $06AA09   |
    LDA #$0002          ; $06AA0B   |
    TRB $0967           ; $06AA0E   |

CODE_06AA11:
    LDA $0967           ; $06AA11   |
    BIT #$0002          ; $06AA14   |
    BEQ CODE_06AA1E     ; $06AA17   |
    LDA #$0005          ; $06AA19   |
    BRA CODE_06AA21     ; $06AA1C   |

CODE_06AA1E:
    LDA #$FFFF          ; $06AA1E   |

CODE_06AA21:
    STA $74A2,x         ; $06AA21   |

CODE_06AA24:
    RTS                 ; $06AA24   |

DATA_06AA25:         dw $FF80, $0080

.init_milde
    LDA #$00D2          ; $06AA29   |
    LDY #$04            ; $06AA2C   |
    JSL $03A366         ; $06AA2E   |
    LDA #$0080          ; $06AA32   |
    STA $7E1A           ; $06AA35   |
    LDA $70E2,x         ; $06AA38   |
    STA $70E2,y         ; $06AA3B   |
    LDA $7182,x         ; $06AA3E   |
    STA $7182,y         ; $06AA41   |
    TYX                 ; $06AA44   |
    LDA #$FFF0          ; $06AA45   |
    STA $1013           ; $06AA48   |
    JSL $03AEEB         ; $06AA4B   |
    LDY #$2A            ; $06AA4F   |
    JSL $0CE5D6         ; $06AA51   |
    LDX $12             ; $06AA55   |
    JMP CODE_0603A3     ; $06AA57   |

DATA_06AA5B:         dw $FFF9, $FFFA
DATA_06AA5F:         dw $FFFB, $FFFC
DATA_06AA63:         dw $FFFD, $FFFE
DATA_06AA67:         dw $FFFF, $0000
DATA_06AA6B:         dw $0000, $FFFF
DATA_06AA6F:         dw $FFFE, $FFFD
DATA_06AA73:         dw $FFFC, $FFFB
DATA_06AA77:         dw $FFFA, $FFF9

DATA_06AA7B:         dw $AA91
DATA_06AA7D:         dw $AABB
DATA_06AA7F:         dw $AB08
DATA_06AA81:         dw $AB1A
DATA_06AA83:         dw $AB67
DATA_06AA85:         dw $AC4C
DATA_06AA87:         dw $AD12
DATA_06AA89:         dw $AB2B

.main_milde
    LDX $105C           ; $06AA8B   |
    JMP ($AA7B,x)       ; $06AA8E   |

; milde sub
    LDX $12             ; $06AA91   |
    LDA #$FFC0          ; $06AA93   |
    STA $7220,x         ; $06AA96   |
    LDY #$07            ; $06AA99   |
    STY $18,x           ; $06AA9B   |
    SEP #$20            ; $06AA9D   |
    LDA $AAB3,y         ; $06AA9F   |
    STA $7402,x         ; $06AAA2   |
    LDA #$08            ; $06AAA5   |
    STA $7A96,x         ; $06AAA7   |
    REP #$20            ; $06AAAA   |
    INC $105C           ; $06AAAC   |
    INC $105C           ; $06AAAF   |
    RTL                 ; $06AAB2   |

DATA_06AAB3:         db $01, $02, $03, $04
DATA_06AAB7:         db $03, $02, $01, $00

; milde sub
    LDX $12             ; $06AABB   |
    JSL $03AF23         ; $06AABD   |
    LDA $70E2,x         ; $06AAC1   |
    CMP #$00C0          ; $06AAC4   |
    BCC CODE_06AAE7     ; $06AAC7   |
    LDA $7A96,x         ; $06AAC9   |
    BNE CODE_06AAE6     ; $06AACC   |
    LDY $18,x           ; $06AACE   |
    DEY                 ; $06AAD0   |
    BPL CODE_06AAD5     ; $06AAD1   |
    LDY #$07            ; $06AAD3   |

CODE_06AAD5:
    STY $18,x           ; $06AAD5   |
    SEP #$20            ; $06AAD7   |
    LDA $AAB3,y         ; $06AAD9   |
    STA $7402,x         ; $06AADC   |
    LDA #$08            ; $06AADF   |
    STA $7A96,x         ; $06AAE1   |
    REP #$20            ; $06AAE4   |

CODE_06AAE6:
    RTL                 ; $06AAE6   |

CODE_06AAE7:
    STZ $7220,x         ; $06AAE7   |
    LDA #$0001          ; $06AAEA   |
    STA $7402,x         ; $06AAED   |
    LDA #$0001          ; $06AAF0   |
    STA $1015           ; $06AAF3   |
    LDX $12             ; $06AAF6   |
    LDA #$0080          ; $06AAF8   |
    STA $7A96,x         ; $06AAFB   |
    INC $1015           ; $06AAFE   |
    INC $105C           ; $06AB01   |
    INC $105C           ; $06AB04   |
    RTL                 ; $06AB07   |

; milde sub
    LDX $12             ; $06AB08   |
    JSL $03AF23         ; $06AB0A   |
    LDA $1015           ; $06AB0E   |
    BPL CODE_06AB19     ; $06AB11   |
    INC $105C           ; $06AB13   |
    INC $105C           ; $06AB16   |

CODE_06AB19:
    RTL                 ; $06AB19   |

; milde sub
    LDX $12             ; $06AB1A   |
    LDA $7A96,x         ; $06AB1C   |
    BNE CODE_06AB2A     ; $06AB1F   |
    STZ $1015           ; $06AB21   |
    INC $105C           ; $06AB24   |
    INC $105C           ; $06AB27   |

CODE_06AB2A:
    RTL                 ; $06AB2A   |

; milde sub
    LDX $12             ; $06AB2B   |
    JSL $03AF23         ; $06AB2D   |
    LDA $18,x           ; $06AB31   |
    BNE CODE_06AB63     ; $06AB33   |
    LDA $1013           ; $06AB35   |
    BEQ CODE_06AB5C     ; $06AB38   |
    LDX #$09            ; $06AB3A   |
    LDA #$AF4A          ; $06AB3C   |
    JSL $7EDE44         ; $06AB3F   |
    LDX $12             ; $06AB43   |
    LDA $3016           ; $06AB45   |
    BPL CODE_06AB62     ; $06AB48   |
    LDA $70E2,x         ; $06AB4A   |
    STA $00             ; $06AB4D   |
    LDA $7182,x         ; $06AB4F   |
    SEC                 ; $06AB52   |
    SBC #$0008          ; $06AB53   |
    STA $02             ; $06AB56   |
    JSL $02E19C         ; $06AB58   |

CODE_06AB5C:
    JSL $02A982         ; $06AB5C   |
    INC $18,x           ; $06AB60   |

CODE_06AB62:
    RTL                 ; $06AB62   |

CODE_06AB63:
    JMP CODE_0603A3     ; $06AB63   |

; milde sub
    LDX $12             ; $06AB67   |
    LDA $7040,x         ; $06AB69   |
    AND #$07FC          ; $06AB6C   |
    ORA #$0002          ; $06AB6F   |
    STA $7040,x         ; $06AB72   |
    LDY #$1E            ; $06AB75   |
    STY $78,x           ; $06AB77   |
    LDY #$00            ; $06AB79   |
    STA $79,x           ; $06AB7B   |
    LDA #$0020          ; $06AB7D   |
    STA $18,x           ; $06AB80   |
    STA $76,x           ; $06AB82   |
    LSR A               ; $06AB84   |
    LSR A               ; $06AB85   |
    LSR A               ; $06AB86   |
    LSR A               ; $06AB87   |
    AND #$001E          ; $06AB88   |
    TAY                 ; $06AB8B   |
    LDA $AC3A,y         ; $06AB8C   |
    STA $7720,x         ; $06AB8F   |
    LDA $7182,x         ; $06AB92   |
    SEC                 ; $06AB95   |
    SBC $7720,x         ; $06AB96   |
    STA $7182,x         ; $06AB99   |
    LDA #$0FFF          ; $06AB9C   |
    STA $16,x           ; $06AB9F   |
    CLC                 ; $06ABA1   |
    ADC #$2000          ; $06ABA2   |
    XBA                 ; $06ABA5   |
    LSR A               ; $06ABA6   |
    LSR A               ; $06ABA7   |
    LSR A               ; $06ABA8   |
    AND #$0007          ; $06ABA9   |
    STA $7402,x         ; $06ABAC   |
    LDX #$1E            ; $06ABAF   |

CODE_06ABB1:
    LDA $5FE6BC,x       ; $06ABB1   |
    STA $702E4E,x       ; $06ABB5   |
    STA $7020E2,x       ; $06ABB9   |
    DEX                 ; $06ABBD   |
    DEX                 ; $06ABBE   |
    BPL CODE_06ABB1     ; $06ABBF   |
    LDX $12             ; $06ABC1   |
    SEP #$20            ; $06ABC3   |
    LDA #$0F            ; $06ABC5   |
    STA $4331           ; $06ABC7   |
    LDA #$10            ; $06ABCA   |
    STA $4341           ; $06ABCC   |
    REP #$20            ; $06ABCF   |
    LDA #$0030          ; $06ABD1   |
    STA $6126           ; $06ABD4   |
    LDA $7042           ; $06ABD7   |
    AND #$FFCF          ; $06ABDA   |
    ORA #$0030          ; $06ABDD   |
    STA $7042           ; $06ABE0   |
    LDA #$0510          ; $06ABE3   |
    STA $0967           ; $06ABE6   |
    JSR CODE_06B223     ; $06ABE9   |
    LDA #$0087          ; $06ABEC   |
    JSL $0085D2         ; $06ABEF   |
    INC $105C           ; $06ABF3   |
    INC $105C           ; $06ABF6   |
    RTL                 ; $06ABF9   |

DATA_06ABFA:         dw $0110, $0100
DATA_06ABFE:         dw $00F0, $00E0
DATA_06AC02:         dw $00D0, $00C0
DATA_06AC06:         dw $00B0, $00A0
DATA_06AC0A:         dw $0090, $0080
DATA_06AC0E:         dw $0070, $0060
DATA_06AC12:         dw $0050, $0040
DATA_06AC16:         dw $0030, $0020

DATA_06AC1A:         dw $0100, $00F0
DATA_06AC1E:         dw $00E0, $00D0
DATA_06AC22:         dw $00C0, $00B0
DATA_06AC26:         dw $00A0, $0090
DATA_06AC2A:         dw $0080, $0070
DATA_06AC2E:         dw $0060, $0050
DATA_06AC32:         dw $0040, $0030
DATA_06AC36:         dw $0020, $0050

DATA_06AC3A:         dw $FFF6, $FFF6
DATA_06AC3E:         dw $FFF8, $FFF9
DATA_06AC42:         dw $FFFA, $FFFB
DATA_06AC46:         dw $FFFC, $FFFD
DATA_06AC4A:         dw $FFFE

; milde sub
    LDX $12             ; $06AC4C   |
    LDA #$0001          ; $06AC4F   |
    JSR CODE_06B072     ; $06AC51   |
    JSR CODE_06B2DC     ; $06AC54   |
    LDA $0D0F           ; $06AC57   |
    BNE CODE_06AC5F     ; $06AC5A   |
    JSR CODE_06B223     ; $06AC5C   |

CODE_06AC5F:
    JSL $03AF23         ; $06AC5F   |
    LDY $79,x           ; $06AC63   |
    TYX                 ; $06AC65   |
    JMP ($AC69,x)       ; $06AC66   |

DATA_06AC69:         dw $AC6F
DATA_06AC6B:         dw $AC9A
DATA_06AC6D:         dw $ACF5

; milde sub
    LDX $12             ; $06AC6F   |
    LDY $78,x           ; $06AC71   |
    LDA $18,x           ; $06AC73   |
    CLC                 ; $06AC75   |
    ADC #$0004          ; $06AC76   |
    CMP $ABFA,y         ; $06AC79   |
    BCS CODE_06AC91     ; $06AC7C   |
    STA $18,x           ; $06AC7E   |
    STA $76,x           ; $06AC80   |
    LSR A               ; $06AC82   |
    LSR A               ; $06AC83   |
    LSR A               ; $06AC84   |
    LSR A               ; $06AC85   |
    AND #$001E          ; $06AC86   |
    TAY                 ; $06AC89   |
    LDA $AC3A,y         ; $06AC8A   |
    STA $7720,x         ; $06AC8D   |
    RTL                 ; $06AC90   |

CODE_06AC91:
    SEP #$20            ; $06AC91   |
    INC $79,x           ; $06AC93   |
    INC $79,x           ; $06AC95   |
    REP #$20            ; $06AC97   |
    RTL                 ; $06AC99   |

; milde sub
    LDX $12             ; $06AC9A   |
    LDY $78,x           ; $06AC9C   |
    LDA $18,x           ; $06AC9E   |
    SEC                 ; $06ACA0   |
    SBC #$0004          ; $06ACA1   |
    CMP $AC1A,y         ; $06ACA4   |
    BCC CODE_06ACBC     ; $06ACA7   |
    STA $18,x           ; $06ACA9   |
    STA $76,x           ; $06ACAB   |
    LSR A               ; $06ACAD   |
    LSR A               ; $06ACAE   |
    LSR A               ; $06ACAF   |
    LSR A               ; $06ACB0   |
    AND #$001E          ; $06ACB1   |
    TAY                 ; $06ACB4   |
    LDA $AC3A,y         ; $06ACB5   |
    STA $7720,x         ; $06ACB8   |
    RTL                 ; $06ACBB   |

CODE_06ACBC:
    LDY $78,x           ; $06ACBC   |
    DEY                 ; $06ACBE   |
    DEY                 ; $06ACBF   |
    BMI CODE_06ACCD     ; $06ACC0   |
    STY $78,x           ; $06ACC2   |
    SEP #$20            ; $06ACC4   |
    DEC $79,x           ; $06ACC6   |
    DEC $79,x           ; $06ACC8   |
    REP #$20            ; $06ACCA   |
    RTL                 ; $06ACCC   |

CODE_06ACCD:
    LDA #$0080          ; $06ACCD   |
    STA $7A96,x         ; $06ACD0   |
    LDA #$0100          ; $06ACD3   |
    STA $18,x           ; $06ACD6   |
    STA $76,x           ; $06ACD8   |
    LDA $16,x           ; $06ACDA   |
    CLC                 ; $06ACDC   |
    ADC #$2000          ; $06ACDD   |
    XBA                 ; $06ACE0   |
    LSR A               ; $06ACE1   |
    AND #$001E          ; $06ACE2   |
    TAY                 ; $06ACE5   |
    LDA $AA5B,y         ; $06ACE6   |
    STA $7720,x         ; $06ACE9   |
    SEP #$20            ; $06ACEC   |
    INC $79,x           ; $06ACEE   |
    INC $79,x           ; $06ACF0   |
    REP #$20            ; $06ACF2   |
    RTL                 ; $06ACF4   |

; milde sub
    LDA $7A96,x         ; $06ACF5   |
    BNE CODE_06AD11     ; $06ACF8   |
    LDA #$0100          ; $06ACFA   |
    STA $78,x           ; $06ACFD   |
    LDY $7400,x         ; $06ACFF   |
    LDA $AA25,y         ; $06AD02   |
    STA $7220,x         ; $06AD05   |
    STZ $60AC           ; $06AD08   |
    INC $105C           ; $06AD0B   |
    INC $105C           ; $06AD0E   |

CODE_06AD11:
    RTL                 ; $06AD11   |

; milde sub
    LDX $12             ; $06AD12   |
    LDA #$0000          ; $06AD14   |
    JSR CODE_06B072     ; $06AD17   |
    JSR CODE_06B2DC     ; $06AD1A   |
    LDA $0D0F           ; $06AD1D   |
    BNE CODE_06AD25     ; $06AD20   |
    JSR CODE_06B0FD     ; $06AD22   |

CODE_06AD25:
    JSL $03AF23         ; $06AD25   |
    JSR CODE_06AFA7     ; $06AD29   |
    LDY $7A36,x         ; $06AD2C   |
    TYX                 ; $06AD2F   |
    JMP ($AD33,x)       ; $06AD30   |

DATA_06AD33:         dw $AD47
DATA_06AD35:         dw $ADA5
DATA_06AD37:         dw $ADCC
DATA_06AD39:         dw $AE08
DATA_06AD3B:         dw $AE44
DATA_06AD3D:         dw $AEA0
DATA_06AD3F:         dw $AEDD
DATA_06AD41:         dw $AF09

DATA_06AD43:         dw $0028
DATA_06AD45:         dw $0014

; milde sub
    LDX $12             ; $06AD47   |
    LDY $7400,x         ; $06AD49   |
    LDA $7860,x         ; $06AD4C   |
    AND $AD43,y         ; $06AD4F   |
    BEQ CODE_06AD5E     ; $06AD52   |
    LDA $7A36,x         ; $06AD54   |
    XBA                 ; $06AD57   |
    ORA #$0002          ; $06AD58   |
    STA $7A36,x         ; $06AD5B   |

CODE_06AD5E:
    LDA $16,x           ; $06AD5E   |
    SEC                 ; $06AD60   |
    SBC $78,x           ; $06AD61   |
    STA $00             ; $06AD63   |
    CLC                 ; $06AD65   |
    ADC #$2000          ; $06AD66   |
    CMP #$4000          ; $06AD69   |
    BCC CODE_06AD7A     ; $06AD6C   |
    LDA $78,x           ; $06AD6E   |
    EOR #$FFFF          ; $06AD70   |
    INC A               ; $06AD73   |
    STA $78,x           ; $06AD74   |
    LDA $16,x           ; $06AD76   |
    BRA CODE_06AD7E     ; $06AD78   |

CODE_06AD7A:
    LDA $00             ; $06AD7A   |
    STA $16,x           ; $06AD7C   |

CODE_06AD7E:
    CLC                 ; $06AD7E   |
    ADC #$2000          ; $06AD7F   |
    XBA                 ; $06AD82   |
    LSR A               ; $06AD83   |
    PHA                 ; $06AD84   |
    LSR A               ; $06AD85   |
    LSR A               ; $06AD86   |
    AND #$0007          ; $06AD87   |
    STA $7402,x         ; $06AD8A   |
    PLA                 ; $06AD8D   |
    AND #$001E          ; $06AD8E   |
    TAY                 ; $06AD91   |
    LDA $AA5B,y         ; $06AD92   |
    STA $7720,x         ; $06AD95   |
    RTL                 ; $06AD98   |

DATA_06AD99:         db $03, $06, $08, $08
DATA_06AD9D:         db $06, $03, $00, $00
DATA_06ADA1:         db $02, $00, $00, $00

; milde sub
    LDX $12             ; $06ADA5   |
    LDY $7402,x         ; $06ADA7   |
    CPY #$03            ; $06ADAA   |
    BEQ CODE_06ADB0     ; $06ADAC   |
    BRA CODE_06AD5E     ; $06ADAE   |

CODE_06ADB0:
    SEP #$20            ; $06ADB0   |
    LDA #$05            ; $06ADB2   |
    STA $7A38,x         ; $06ADB4   |
    TAY                 ; $06ADB7   |
    LDA $AD99,y         ; $06ADB8   |
    STA $7402,x         ; $06ADBB   |
    LDA #$04            ; $06ADBE   |
    STA $7A96,x         ; $06ADC0   |
    INC $7A36,x         ; $06ADC3   |
    INC $7A36,x         ; $06ADC6   |
    REP #$20            ; $06ADC9   |
    RTL                 ; $06ADCB   |

; milde sub
    LDX $12             ; $06ADCC   |
    LDA $7A96,x         ; $06ADCE   |
    BNE CODE_06ADF3     ; $06ADD1   |
    SEP #$20            ; $06ADD3   |
    DEC $7A38,x         ; $06ADD5   |
    BMI CODE_06ADF4     ; $06ADD8   |
    LDA #$04            ; $06ADDA   |
    STA $7A96,x         ; $06ADDC   |
    LDY $7A38,x         ; $06ADDF   |
    LDA $AD99,y         ; $06ADE2   |
    STA $7402,x         ; $06ADE5   |
    LDA $7400,x         ; $06ADE8   |
    EOR $AD9F,y         ; $06ADEB   |
    STA $7400,x         ; $06ADEE   |
    REP #$20            ; $06ADF1   |

CODE_06ADF3:
    RTL                 ; $06ADF3   |

CODE_06ADF4:
    STZ $7A36,x         ; $06ADF4   |
    LDA #$03            ; $06ADF7   |
    STA $7402,x         ; $06ADF9   |
    REP #$20            ; $06ADFC   |
    LDY $7400,x         ; $06ADFE   |
    LDA $AA25,y         ; $06AE01   |
    STA $7220,x         ; $06AE04   |
    RTL                 ; $06AE07   |

; milde sub
    LDX $12             ; $06AE08   |
    LDA $76,x           ; $06AE0A   |
    SEC                 ; $06AE0C   |
    SBC $7900,x         ; $06AE0D   |
    STA $76,x           ; $06AE10   |
    LDA $18,x           ; $06AE12   |
    CLC                 ; $06AE14   |
    ADC $7900,x         ; $06AE15   |
    STA $18,x           ; $06AE18   |
    CMP #$00FC          ; $06AE1A   |
    BCS CODE_06AE26     ; $06AE1D   |
    LDA #$0004          ; $06AE1F   |
    STA $7900,x         ; $06AE22   |
    RTL                 ; $06AE25   |

CODE_06AE26:
    CMP #$0100          ; $06AE26   |
    BCS CODE_06AE2C     ; $06AE29   |
    RTL                 ; $06AE2B   |

CODE_06AE2C:
    LDA #$0100          ; $06AE2C   |
    STA $18,x           ; $06AE2F   |
    STA $76,x           ; $06AE31   |
    LDA #$FFFC          ; $06AE33   |
    STA $7900,x         ; $06AE36   |
    SEP #$20            ; $06AE39   |
    INC $7A36,x         ; $06AE3B   |
    INC $7A36,x         ; $06AE3E   |
    REP #$20            ; $06AE41   |
    RTL                 ; $06AE43   |

; milde sub
    LDX $12             ; $06AE44   |
    LDA $18,x           ; $06AE46   |
    SEC                 ; $06AE48   |
    SBC $7900,x         ; $06AE49   |
    STA $18,x           ; $06AE4C   |
    LDA $76,x           ; $06AE4E   |
    CLC                 ; $06AE50   |
    ADC $7900,x         ; $06AE51   |
    STA $76,x           ; $06AE54   |
    CMP #$00FC          ; $06AE56   |
    BCS CODE_06AE62     ; $06AE59   |
    LDA #$0004          ; $06AE5B   |
    STA $7900,x         ; $06AE5E   |
    RTL                 ; $06AE61   |

CODE_06AE62:
    CMP #$0100          ; $06AE62   |
    BCS CODE_06AE68     ; $06AE65   |
    RTL                 ; $06AE67   |

CODE_06AE68:
    LDA #$0100          ; $06AE68   |
    STA $18,x           ; $06AE6B   |
    STA $76,x           ; $06AE6D   |
    LDA #$FFFC          ; $06AE6F   |
    STA $7900,x         ; $06AE72   |
    SEP #$20            ; $06AE75   |
    DEC $7902,x         ; $06AE77   |
    BMI CODE_06AE85     ; $06AE7A   |
    DEC $7A36,x         ; $06AE7C   |
    DEC $7A36,x         ; $06AE7F   |
    REP #$20            ; $06AE82   |
    RTL                 ; $06AE84   |

CODE_06AE85:
    STZ $7A36,x         ; $06AE85   |
    REP #$20            ; $06AE88   |
    LDY $7400,x         ; $06AE8A   |
    LDA $AA25,y         ; $06AE8D   |
    STA $7220,x         ; $06AE90   |
    RTL                 ; $06AE93   |

DATA_06AE94:         dw $FF00, $0100
DATA_06AE98:         dw $0000, $0002
DATA_06AE9C:         dw $FFEC, $001C

; milde sub
    LDX $12             ; $06AEA0   |
    STZ $60AA           ; $06AEA2   |
    LDA $105E           ; $06AEA5   |
    BIT #$0001          ; $06AEA8   |
    BEQ CODE_06AEB7     ; $06AEAB   |
    LDA $6090           ; $06AEAD   |
    CLC                 ; $06AEB0   |
    ADC $1060           ; $06AEB1   |
    STA $6090           ; $06AEB4   |

CODE_06AEB7:
    LDA $76,x           ; $06AEB7   |
    SEC                 ; $06AEB9   |
    SBC #$0010          ; $06AEBA   |
    CMP #$0030          ; $06AEBD   |
    BCC CODE_06AECD     ; $06AEC0   |
    STA $76,x           ; $06AEC2   |
    LDA $18,x           ; $06AEC4   |
    CLC                 ; $06AEC6   |
    ADC #$0010          ; $06AEC7   |
    STA $18,x           ; $06AECA   |
    RTL                 ; $06AECC   |

CODE_06AECD:
    SEP #$20            ; $06AECD   |
    LDA #$08            ; $06AECF   |
    STA $7A96,x         ; $06AED1   |
    INC $7A36,x         ; $06AED4   |
    INC $7A36,x         ; $06AED7   |
    REP #$20            ; $06AEDA   |
    RTL                 ; $06AEDC   |

; milde sub
    LDX $12             ; $06AEDD   |
    STZ $60AA           ; $06AEDF   |
    LDA $105E           ; $06AEE2   |
    BIT #$0001          ; $06AEE5   |
    BEQ CODE_06AEF4     ; $06AEE8   |
    LDA $6090           ; $06AEEA   |
    CLC                 ; $06AEED   |
    ADC $1060           ; $06AEEE   |
    STA $6090           ; $06AEF1   |

CODE_06AEF4:
    LDA $7A96,x         ; $06AEF4   |
    BNE CODE_06AF08     ; $06AEF7   |
    SEP #$20            ; $06AEF9   |
    LDA #$FF            ; $06AEFB   |
    STA $74A2,x         ; $06AEFD   |
    INC $7A36,x         ; $06AF00   |
    INC $7A36,x         ; $06AF03   |
    REP #$20            ; $06AF06   |

CODE_06AF08:
    RTL                 ; $06AF08   |

; milde sub
    LDX $12             ; $06AF09   |
    JSL $03AEFD         ; $06AF0B   |
    LDA #$0085          ; $06AF0F   |
    JSL $0085D2         ; $06AF12   |
    LDA #$012E          ; $06AF16   |
    JSL $03A364         ; $06AF19   |
    LDA $70E2,x         ; $06AF1D   |
    STA $70E2,y         ; $06AF20   |
    LDA $7182,x         ; $06AF23   |
    STA $7182,y         ; $06AF26   |
    LDA #$0002          ; $06AF29   |
    STA $79D6,y         ; $06AF2C   |
    LDA #$0001          ; $06AF2F   |
    STA $00             ; $06AF32   |

CODE_06AF34:
    LDA #$00D3          ; $06AF34   |
    JSL $03A34C         ; $06AF37   |
    LDA #$0020          ; $06AF3B   |
    STA $7AF6,y         ; $06AF3E   |
    LDA #$0030          ; $06AF41   |
    STA $7A96,y         ; $06AF44   |
    LDA #$0002          ; $06AF47   |
    STA $79D6,y         ; $06AF4A   |
    LDA #$FC00          ; $06AF4D   |
    STA $7222,y         ; $06AF50   |
    LDA $7860,y         ; $06AF53   |
    AND #$FFFE          ; $06AF56   |
    STA $7860,y         ; $06AF59   |
    LDA $7182,x         ; $06AF5C   |
    SEC                 ; $06AF5F   |
    SBC #$0030          ; $06AF60   |
    STA $7182,y         ; $06AF63   |
    LDA $7040,y         ; $06AF66   |
    AND #$FFF3          ; $06AF69   |
    STA $7040,y         ; $06AF6C   |
    PHX                 ; $06AF6F   |
    LDA $00             ; $06AF70   |
    ASL A               ; $06AF72   |
    TAX                 ; $06AF73   |
    LDA $AE94,x         ; $06AF74   |
    STA $7220,y         ; $06AF77   |
    LDA $AE98,x         ; $06AF7A   |
    STA $7400,y         ; $06AF7D   |
    LDA $AE9C,x         ; $06AF80   |
    PLX                 ; $06AF83   |
    CLC                 ; $06AF84   |
    ADC $70E2,x         ; $06AF85   |
    STA $70E2,y         ; $06AF88   |
    DEC $00             ; $06AF8B   |
    BPL CODE_06AF34     ; $06AF8D   |
    STZ $60AC           ; $06AF8F   |
    LDA #$0002          ; $06AF92   |
    TRB $0967           ; $06AF95   |
    TRB $0968           ; $06AF98   |
    STZ $18,x           ; $06AF9B   |
    STZ $7A96,x         ; $06AF9D   |
    INC $105C           ; $06AFA0   |
    INC $105C           ; $06AFA3   |
    RTL                 ; $06AFA6   |

; milde sub

CODE_06AFA7:
    LDY $74A2,x         ; $06AFA7   |
    CPY #$FF            ; $06AFAA   |
    BEQ CODE_06B029     ; $06AFAC   |
    LDY $7D36,x         ; $06AFAE   |
    DEY                 ; $06AFB1   |
    BMI CODE_06B016     ; $06AFB2   |
    BEQ CODE_06B016     ; $06AFB4   |
    LDA $6F00,y         ; $06AFB6   |
    CMP #$0010          ; $06AFB9   |
    BNE CODE_06B016     ; $06AFBC   |
    LDA $7D38,y         ; $06AFBE   |
    BEQ CODE_06B016     ; $06AFC1   |
    LDA $70E2,x         ; $06AFC3   |
    CLC                 ; $06AFC6   |
    ADC #$0008          ; $06AFC7   |
    SEC                 ; $06AFCA   |
    SBC $7CD6,y         ; $06AFCB   |
    STA $00             ; $06AFCE   |
    LDA $7220,y         ; $06AFD0   |
    BEQ CODE_06AFD9     ; $06AFD3   |
    EOR $00             ; $06AFD5   |
    BMI CODE_06B016     ; $06AFD7   |

CODE_06AFD9:
    LDA $00             ; $06AFD9   |
    EOR #$FFFF          ; $06AFDB   |
    INC A               ; $06AFDE   |
    STA $7C76,x         ; $06AFDF   |
    PHX                 ; $06AFE2   |
    TYX                 ; $06AFE3   |
    JSL $03B24B         ; $06AFE4   |
    PLX                 ; $06AFE8   |
    LDA $7A36,x         ; $06AFE9   |
    CMP #$0006          ; $06AFEC   |
    BCS CODE_06B016     ; $06AFEF   |

CODE_06AFF1:
    STZ $7220,x         ; $06AFF1   |
    LDA #$FFFC          ; $06AFF4   |
    STA $7900,x         ; $06AFF7   |
    CLC                 ; $06AFFA   |
    ADC $18,x           ; $06AFFB   |
    STA $18,x           ; $06AFFD   |
    SEP #$20            ; $06AFFF   |
    LDA #$06            ; $06B001   |
    STA $7A36,x         ; $06B003   |
    LDA #$03            ; $06B006   |
    STA $7902,x         ; $06B008   |
    REP #$20            ; $06B00B   |
    LDA #$0034          ; $06B00D   |
    JSL $0085D2         ; $06B010   |
    PLA                 ; $06B014   |
    RTL                 ; $06B015   | back out of sprite

CODE_06B016:
    LDA $60AC           ; $06B016   |
    BNE CODE_06B029     ; $06B019   |
    LDA $105E           ; $06B01B   |
    BEQ CODE_06B029     ; $06B01E   |
    CMP #$0001          ; $06B020   |
    BEQ CODE_06B02A     ; $06B023   |
    JSL $03A858         ; $06B025   |

CODE_06B029:
    RTS                 ; $06B029   |

CODE_06B02A:
    LDA $60AA           ; $06B02A   |
    BMI CODE_06B029     ; $06B02D   |
    LDA #$0100          ; $06B02F   |
    STA $18,x           ; $06B032   |
    STA $76,x           ; $06B034   |
    LDA $60D4           ; $06B036   |
    BNE CODE_06B048     ; $06B039   |
    JSL $03B20B         ; $06B03B   |
    LDA #$0034          ; $06B03F   |
    JSL $0085D2         ; $06B042   |
    BRA CODE_06AFF1     ; $06B046   |

CODE_06B048:
    LDA $60AA           ; $06B048   |
    BEQ CODE_06B029     ; $06B04B   |
    STZ $60AA           ; $06B04D   |
    LDA $6090           ; $06B050   |
    SEC                 ; $06B053   |
    SBC $1060           ; $06B054   |
    STA $6090           ; $06B057   |
    JSL $028925         ; $06B05A   |
    LDA #$E000          ; $06B05E   |
    STA $16,x           ; $06B061   |
    SEP #$20            ; $06B063   |
    LDA #$09            ; $06B065   |
    STA $7402,x         ; $06B067   |
    LDA #$0A            ; $06B06A   |
    STA $7A36,x         ; $06B06C   |
    REP #$20            ; $06B06F   |
    RTS                 ; $06B071   |

; milde sub

CODE_06B072:
    STA $6004           ; $06B072   |
    LDY $74A2,x         ; $06B075   |
    CPY #$FF            ; $06B078   |
    BEQ CODE_06B0CC     ; $06B07A   |
    LDA $16,x           ; $06B07C   |
    XBA                 ; $06B07E   |
    AND #$00FF          ; $06B07F   |
    STA $3002           ; $06B082   |
    LDA #$0006          ; $06B085   |
    STA $3008           ; $06B088   |
    LDA #$B36D          ; $06B08B   |
    STA $300A           ; $06B08E   |
    LDA $7402,x         ; $06B091   |
    STA $300C           ; $06B094   |
    LDA #$0092          ; $06B097   |
    STA $300E           ; $06B09A   |
    LDA #$4000          ; $06B09D   |
    STA $3010           ; $06B0A0   |
    LDA $18,x           ; $06B0A3   |
    STA $6000           ; $06B0A5   |
    LDA $76,x           ; $06B0A8   |
    STA $6002           ; $06B0AA   |
    LDA $7680,x         ; $06B0AD   |
    CLC                 ; $06B0B0   |
    ADC #$0008          ; $06B0B1   |
    STA $6010           ; $06B0B4   |
    LDA $7682,x         ; $06B0B7   |
    CLC                 ; $06B0BA   |
    ADC #$0004          ; $06B0BB   |
    STA $6012           ; $06B0BE   |
    LDX #$09            ; $06B0C1   |
    LDA #$A578          ; $06B0C3   |
    JSL $7EDE44         ; $06B0C6   |
    LDX $12             ; $06B0CA   |

CODE_06B0CC:
    RTS                 ; $06B0CC   |

DATA_06B0CD:         dw $0100, $0000
DATA_06B0D1:         dw $0100, $0000
DATA_06B0D5:         dw $0100, $0000
DATA_06B0D9:         dw $0100, $0000
DATA_06B0DD:         dw $0100, $0000
DATA_06B0E1:         dw $00F3, $00E4
DATA_06B0E5:         dw $00E6, $00E4
DATA_06B0E9:         dw $00D9, $00E4
DATA_06B0ED:         dw $0100, $0000
DATA_06B0F1:         dw $00E6, $00E4
DATA_06B0F5:         dw $00CC, $00E4
DATA_06B0F9:         dw $0100, $0000

; milde sub

CODE_06B0FD:
    LDY $74A2,x         ; $06B0FD   |
    CPY #$FF            ; $06B100   |
    BNE CODE_06B105     ; $06B102   |
    RTS                 ; $06B104   |

CODE_06B105:
    LDA $16,x           ; $06B105   |
    XBA                 ; $06B107   |
    AND #$00FF          ; $06B108   |
    STA $300A           ; $06B10B   |
    LDA #$0000          ; $06B10E   |
    STA $3006           ; $06B111   |
    LDA #$0000          ; $06B114   |
    STA $3004           ; $06B117   |
    LDA #$0100          ; $06B11A   |
    STA $300C           ; $06B11D   |
    LDA #$6060          ; $06B120   |
    STA $3018           ; $06B123   |
    LDA #$0056          ; $06B126   |
    STA $301A           ; $06B129   |
    LDX #$08            ; $06B12C   |
    LDA #$8205          ; $06B12E   |
    JSL $7EDE44         ; $06B131   |
    LDX $12             ; $06B135   |
    LDA $7402,x         ; $06B137   |
    CMP #$0009          ; $06B13A   |
    BCC CODE_06B17C     ; $06B13D   |
    LDA $18,x           ; $06B13F   |
    STA $300C           ; $06B141   |
    LDA $76,x           ; $06B144   |
    STA $3016           ; $06B146   |
    LDA #$003F          ; $06B149   |
    STA $3010           ; $06B14C   |
    LDA #$001F          ; $06B14F   |
    STA $3012           ; $06B152   |
    LDA #$0020          ; $06B155   |
    STA $3006           ; $06B158   |
    LDA #$0000          ; $06B15B   |
    STA $3004           ; $06B15E   |
    LDA #$6001          ; $06B161   |
    STA $3018           ; $06B164   |
    LDA #$0056          ; $06B167   |
    STA $301A           ; $06B16A   |
    LDX #$08            ; $06B16D   |
    LDA #$8C78          ; $06B16F   |
    JSL $7EDE44         ; $06B172   |
    LDX $12             ; $06B176   |
    INC $0CF9           ; $06B178   |
    RTS                 ; $06B17B   |

CODE_06B17C:
    LDA $18,x           ; $06B17C   |
    STA $300C           ; $06B17E   |
    LDA $76,x           ; $06B181   |
    STA $3016           ; $06B183   |
    LDA #$001F          ; $06B186   |
    STA $3010           ; $06B189   |
    LDA #$0010          ; $06B18C   |
    STA $3012           ; $06B18F   |
    LDA #$0040          ; $06B192   |
    STA $3006           ; $06B195   |
    LDA #$0000          ; $06B198   |
    STA $3004           ; $06B19B   |
    LDA #$6080          ; $06B19E   |
    STA $3018           ; $06B1A1   |
    LDA #$0056          ; $06B1A4   |
    STA $301A           ; $06B1A7   |
    LDX #$08            ; $06B1AA   |
    LDA #$8295          ; $06B1AC   |
    JSL $7EDE44         ; $06B1AF   |
    LDX $12             ; $06B1B3   |
    LDA $7402,x         ; $06B1B5   |
    ASL A               ; $06B1B8   |
    ASL A               ; $06B1B9   |
    TAY                 ; $06B1BA   |
    LDA $76,x           ; $06B1BB   |
    STA $3000           ; $06B1BD   |
    LDA $B0CD,y         ; $06B1C0   |
    STA $300C           ; $06B1C3   |
    PHX                 ; $06B1C6   |
    PHY                 ; $06B1C7   |
    LDX #$0B            ; $06B1C8   |
    LDA #$86B6          ; $06B1CA   |
    JSL $7EDE44         ; $06B1CD   |
    PLY                 ; $06B1D1   |
    PLX                 ; $06B1D2   |
    LDA $18,x           ; $06B1D3   |
    CMP $3000           ; $06B1D5   |
    BPL CODE_06B1EB     ; $06B1D8   |
    LDA $B0CF,y         ; $06B1DA   |
    BEQ CODE_06B1EE     ; $06B1DD   |
    LDA $B0CF,y         ; $06B1DF   |
    EOR #$FFFF          ; $06B1E2   |
    INC A               ; $06B1E5   |
    AND #$00FF          ; $06B1E6   |
    BRA CODE_06B1EE     ; $06B1E9   |

CODE_06B1EB:
    LDA $B0CF,y         ; $06B1EB   |

CODE_06B1EE:
    STA $300A           ; $06B1EE   |
    LDA $18,x           ; $06B1F1   |
    STA $300C           ; $06B1F3   |
    LDA $3000           ; $06B1F6   |
    STA $3016           ; $06B1F9   |
    LDA #$0020          ; $06B1FC   |
    STA $3006           ; $06B1FF   |
    LDA #$0000          ; $06B202   |
    STA $3004           ; $06B205   |
    LDA #$6040          ; $06B208   |
    STA $3018           ; $06B20B   |
    LDA #$0056          ; $06B20E   |
    STA $301A           ; $06B211   |
    LDX #$08            ; $06B214   |
    LDA #$84A5          ; $06B216   |
    JSL $7EDE44         ; $06B219   |
    LDX $12             ; $06B21D   |
    INC $0CF9           ; $06B21F   |

CODE_06B222:
    RTS                 ; $06B222   |

; milde sub

CODE_06B223:
    LDY $74A2,x         ; $06B223   |
    CPY #$FF            ; $06B226   |
    BEQ CODE_06B222     ; $06B228   |
    LDA $16,x           ; $06B22A   |
    XBA                 ; $06B22C   |
    AND #$00FF          ; $06B22D   |
    STA $300A           ; $06B230   |
    LDA #$0000          ; $06B233   |
    STA $3006           ; $06B236   |
    LDA #$0000          ; $06B239   |
    STA $3004           ; $06B23C   |
    LDA $18,x           ; $06B23F   |
    STA $300C           ; $06B241   |
    LDA $76,x           ; $06B244   |
    STA $3016           ; $06B246   |
    LDA #$6060          ; $06B249   |
    STA $3018           ; $06B24C   |
    LDA #$0056          ; $06B24F   |
    STA $301A           ; $06B252   |
    LDX #$08            ; $06B255   |
    LDA #$84A5          ; $06B257   |
    JSL $7EDE44         ; $06B25A   |
    LDX $12             ; $06B25E   |
    LDA $18,x           ; $06B260   |
    STA $300C           ; $06B262   |
    LDA $76,x           ; $06B265   |
    STA $3016           ; $06B267   |
    LDA #$001F          ; $06B26A   |
    STA $3010           ; $06B26D   |
    LDA #$0010          ; $06B270   |
    STA $3012           ; $06B273   |
    LDA #$0040          ; $06B276   |
    STA $3006           ; $06B279   |
    LDA #$0000          ; $06B27C   |
    STA $3004           ; $06B27F   |
    LDA #$6080          ; $06B282   |
    STA $3018           ; $06B285   |
    LDA #$0056          ; $06B288   |
    STA $301A           ; $06B28B   |
    LDX #$08            ; $06B28E   |
    LDA #$8295          ; $06B290   |
    JSL $7EDE44         ; $06B293   |
    LDX $12             ; $06B297   |
    LDA #$0000          ; $06B299   |
    STA $300A           ; $06B29C   |
    LDA $18,x           ; $06B29F   |
    STA $300C           ; $06B2A1   |
    LDA $76,x           ; $06B2A4   |
    STA $3016           ; $06B2A6   |
    LDA #$0010          ; $06B2A9   |
    STA $3010           ; $06B2AC   |
    LDA #$0010          ; $06B2AF   |
    STA $3012           ; $06B2B2   |
    LDA #$0020          ; $06B2B5   |
    STA $3006           ; $06B2B8   |
    LDA #$0000          ; $06B2BB   |
    STA $3004           ; $06B2BE   |
    LDA #$6040          ; $06B2C1   |
    STA $3018           ; $06B2C4   |
    LDA #$0056          ; $06B2C7   |
    STA $301A           ; $06B2CA   |
    LDX #$08            ; $06B2CD   |
    LDA #$8295          ; $06B2CF   |
    JSL $7EDE44         ; $06B2D2   |
    LDX $12             ; $06B2D6   |
    INC $0CF9           ; $06B2D8   |

CODE_06B2DB:
    RTS                 ; $06B2DB   |

; milde sub

CODE_06B2DC:
    LDY $74A2,x         ; $06B2DC   |
    CPY #$FF            ; $06B2DF   |
    BEQ CODE_06B2DB     ; $06B2E1   |
    LDA #$0000          ; $06B2E3   |
    STA $3002           ; $06B2E6   |
    LDA $7680,x         ; $06B2E9   |
    CLC                 ; $06B2EC   |
    ADC #$0008          ; $06B2ED   |
    STA $3004           ; $06B2F0   |
    LDA $7682,x         ; $06B2F3   |
    CLC                 ; $06B2F6   |
    ADC #$0004          ; $06B2F7   |
    STA $3006           ; $06B2FA   |
    LDA $18,x           ; $06B2FD   |
    STA $300A           ; $06B2FF   |
    LDA $76,x           ; $06B302   |
    STA $300E           ; $06B304   |
    TXA                 ; $06B307   |
    STA $6012           ; $06B308   |
    LDA $60B0           ; $06B30B   |
    STA $6014           ; $06B30E   |
    LDA $60B2           ; $06B311   |
    STA $6016           ; $06B314   |
    LDA $60C2           ; $06B317   |
    STA $6018           ; $06B31A   |
    LDX #$0A            ; $06B31D   |
    LDA #$8974          ; $06B31F   |
    JSL $7EDE91         ; $06B322   |
    LDA $601A           ; $06B326   |
    STA $105E           ; $06B329   |
    LDA $601C           ; $06B32C   |
    STA $1060           ; $06B32F   |
    JSL $00BE39         ; $06B332   |

; DMA args
DATA_06B336:         dl $7E5040, $703372
DATA_06B33C:         dw $0348

    LDX $12             ; $06B33E   |
    LDA #$0002          ; $06B340   |
    TSB $0967           ; $06B343   |
    LDA #$0018          ; $06B346   |
    TSB $094A           ; $06B349   |
    LDX $12             ; $06B34C   |
    LDA $7860,x         ; $06B34E   |
    LDY $7221,x         ; $06B351   |
    BMI CODE_06B364     ; $06B354   |
    BNE CODE_06B35D     ; $06B356   |
    LDY $7220,x         ; $06B358   |
    BEQ CODE_06B36C     ; $06B35B   |

CODE_06B35D:
    BIT #$0014          ; $06B35D   |
    BEQ CODE_06B36C     ; $06B360   |
    BRA CODE_06B369     ; $06B362   |

CODE_06B364:
    BIT #$0028          ; $06B364   |
    BEQ CODE_06B36C     ; $06B367   |

CODE_06B369:
    STZ $7220,x         ; $06B369   |

CODE_06B36C:
    RTS                 ; $06B36C   |

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
DATA_06B36D:         db $F8, $02, $F0, $F0, $C0
DATA_06B372:         db $3D, $02, $00, $F0, $C2
DATA_06B377:         db $3D, $02, $F0, $00, $E0
DATA_06B37C:         db $3D, $02, $00, $00, $E2
DATA_06B381:         db $3D, $09, $02, $F0, $F0
DATA_06B386:         db $E2, $FF, $02, $00, $F0
DATA_06B38B:         db $E0, $FF, $02, $F0, $00
DATA_06B390:         db $C2, $FF, $02, $00, $00
DATA_06B395:         db $C0, $FF, $02, $F0, $F0
DATA_06B39A:         db $C2, $6F, $02, $00, $F0
DATA_06B39F:         db $C0, $6F, $02, $F0, $00
DATA_06B3A4:         db $E2, $6F, $02, $00, $00
DATA_06B3A9:         db $E0, $6F, $02, $F0, $F0
DATA_06B3AE:         db $E0, $AD, $02, $00, $F0
DATA_06B3B3:         db $E2, $AD, $02, $F0, $00
DATA_06B3B8:         db $C0, $AD, $02, $00, $00
DATA_06B3BD:         db $C2, $AD, $DB, $9D, $02
DATA_06B3C2:         db $FA, $F0, $CA, $7D, $02
DATA_06B3C7:         db $0A, $F0, $C8, $7D, $02
DATA_06B3CC:         db $FA, $00, $EA, $7D, $02
DATA_06B3D1:         db $0A, $00, $E8, $7D, $02
DATA_06B3D6:         db $E7, $F0, $C8, $3F, $02
DATA_06B3DB:         db $F7, $F0, $CA, $3F, $02
DATA_06B3E0:         db $E7, $00, $E8, $3F, $02
DATA_06B3E5:         db $F7, $00, $EA, $3F, $00
DATA_06B3EA:         db $9F, $02, $F0, $F0, $C4
DATA_06B3EF:         db $3F, $02, $00, $F0, $C6
DATA_06B3F4:         db $3F, $02, $F0, $00, $E4
DATA_06B3F9:         db $3F, $02, $00, $00, $E6
DATA_06B3FE:         db $3F

; milde frame $01
DATA_06B3FF:         db $F8, $02, $F0, $F0
DATA_06B403:         db $C0, $3D, $02, $00, $F0
DATA_06B408:         db $C2, $3D, $02, $F0, $00
DATA_06B40D:         db $E0, $3D, $02, $00, $00
DATA_06B412:         db $E2, $3D, $09, $02, $F0
DATA_06B417:         db $F0, $E2, $FF, $02, $00
DATA_06B41C:         db $F0, $E0, $FF, $02, $F0
DATA_06B421:         db $00, $C2, $FF, $02, $00
DATA_06B426:         db $00, $C0, $FF, $02, $F0
DATA_06B42B:         db $F0, $C2, $6F, $02, $00
DATA_06B430:         db $F0, $C0, $6F, $02, $F0
DATA_06B435:         db $00, $E2, $6F, $02, $00
DATA_06B43A:         db $00, $E0, $6F, $02, $F0
DATA_06B43F:         db $F0, $E0, $AD, $02, $00
DATA_06B444:         db $F0, $E2, $AD, $02, $F0
DATA_06B449:         db $00, $C0, $AD, $02, $00
DATA_06B44E:         db $00, $C2, $AD, $DD, $9D
DATA_06B453:         db $02, $FA, $F0, $CA, $7D
DATA_06B458:         db $02, $0A, $F0, $C8, $7D
DATA_06B45D:         db $02, $FA, $00, $EA, $7D
DATA_06B462:         db $02, $0A, $00, $E8, $7D
DATA_06B467:         db $02, $E6, $F0, $C8, $3F
DATA_06B46C:         db $02, $F6, $F0, $CA, $3F
DATA_06B471:         db $02, $E6, $00, $E8, $3F
DATA_06B476:         db $02, $F6, $00, $EA, $3F
DATA_06B47B:         db $02, $9F, $02, $F0, $F0
DATA_06B480:         db $C4, $3F, $02, $00, $F0
DATA_06B485:         db $C6, $3F, $02, $F0, $00
DATA_06B48A:         db $E4, $3F, $02, $00, $00
DATA_06B48F:         db $E6, $3F

; milde frame $02
DATA_06B491:         db $F8, $02, $F0
DATA_06B494:         db $F0, $C0, $3D, $02, $00
DATA_06B499:         db $F0, $C2, $3D, $02, $F0
DATA_06B49E:         db $00, $E0, $3D, $02, $00
DATA_06B4A3:         db $00, $E2, $3D, $09, $02
DATA_06B4A8:         db $F0, $F0, $E2, $FF, $02
DATA_06B4AD:         db $00, $F0, $E0, $FF, $02
DATA_06B4B2:         db $F0, $00, $C2, $FF, $02
DATA_06B4B7:         db $00, $00, $C0, $FF, $02
DATA_06B4BC:         db $F0, $F0, $C2, $6F, $02
DATA_06B4C1:         db $00, $F0, $C0, $6F, $02
DATA_06B4C6:         db $F0, $00, $E2, $6F, $02
DATA_06B4CB:         db $00, $00, $E0, $6F, $02
DATA_06B4D0:         db $F0, $F0, $E0, $AD, $02
DATA_06B4D5:         db $00, $F0, $E2, $AD, $02
DATA_06B4DA:         db $F0, $00, $C0, $AD, $02
DATA_06B4DF:         db $00, $00, $C2, $AD, $DF
DATA_06B4E4:         db $9D, $02, $FB, $F0, $CA
DATA_06B4E9:         db $7D, $02, $0B, $F0, $C8
DATA_06B4EE:         db $7D, $02, $FB, $00, $EA
DATA_06B4F3:         db $7D, $02, $0B, $00, $E8
DATA_06B4F8:         db $7D, $02, $E5, $F0, $C8
DATA_06B4FD:         db $3F, $02, $F5, $F0, $CA
DATA_06B502:         db $3F, $02, $E5, $00, $E8
DATA_06B507:         db $3F, $02, $F5, $00, $EA
DATA_06B50C:         db $3F, $05, $9F, $02, $F0
DATA_06B511:         db $F0, $C4, $3F, $02, $00
DATA_06B516:         db $F0, $C6, $3F, $02, $F0
DATA_06B51B:         db $00, $E4, $3F, $02, $00
DATA_06B520:         db $00, $E6, $3F

; milde frame $03
DATA_06B523:         db $F8, $02
DATA_06B525:         db $F0, $F0, $C0, $3D, $02
DATA_06B52A:         db $00, $F0, $C2, $3D, $02
DATA_06B52F:         db $F0, $00, $E0, $3D, $02
DATA_06B534:         db $00, $00, $E2, $3D, $09
DATA_06B539:         db $02, $F0, $F0, $E2, $FF
DATA_06B53E:         db $02, $00, $F0, $E0, $FF
DATA_06B543:         db $02, $F0, $00, $C2, $FF
DATA_06B548:         db $02, $00, $00, $C0, $FF
DATA_06B54D:         db $02, $F0, $F0, $C2, $6F
DATA_06B552:         db $02, $00, $F0, $C0, $6F
DATA_06B557:         db $02, $F0, $00, $E2, $6F
DATA_06B55C:         db $02, $00, $00, $E0, $6F
DATA_06B561:         db $02, $F0, $F0, $E0, $AD
DATA_06B566:         db $02, $00, $F0, $E2, $AD
DATA_06B56B:         db $02, $F0, $00, $C0, $AD
DATA_06B570:         db $02, $00, $00, $C2, $AD
DATA_06B575:         db $E2, $9D, $02, $FD, $F0
DATA_06B57A:         db $CA, $7D, $02, $0D, $F0
DATA_06B57F:         db $C8, $7D, $02, $FD, $00
DATA_06B584:         db $EA, $7D, $02, $0D, $00
DATA_06B589:         db $E8, $7D, $02, $E4, $F0
DATA_06B58E:         db $C8, $3F, $02, $F4, $F0
DATA_06B593:         db $CA, $3F, $02, $E4, $00
DATA_06B598:         db $E8, $3F, $02, $F4, $00
DATA_06B59D:         db $EA, $3F, $0A, $9F, $02
DATA_06B5A2:         db $F0, $F0, $C4, $3F, $02
DATA_06B5A7:         db $00, $F0, $C6, $3F, $02
DATA_06B5AC:         db $F0, $00, $E4, $3F, $02
DATA_06B5B1:         db $00, $00, $E6, $3F

; milde frame $04
DATA_06B5B5:         db $F8
DATA_06B5B6:         db $02, $F0, $F0, $C0, $3D
DATA_06B5BB:         db $02, $00, $F0, $C2, $3D
DATA_06B5C0:         db $02, $F0, $00, $E0, $3D
DATA_06B5C5:         db $02, $00, $00, $E2, $3D
DATA_06B5CA:         db $09, $02, $F0, $F0, $E2
DATA_06B5CF:         db $FF, $02, $00, $F0, $E0
DATA_06B5D4:         db $FF, $02, $F0, $00, $C2
DATA_06B5D9:         db $FF, $02, $00, $00, $C0
DATA_06B5DE:         db $FF, $02, $F0, $F0, $C2
DATA_06B5E3:         db $6F, $02, $00, $F0, $C0
DATA_06B5E8:         db $6F, $02, $F0, $00, $E2
DATA_06B5ED:         db $6F, $02, $00, $00, $E0
DATA_06B5F2:         db $6F, $02, $F0, $F0, $E0
DATA_06B5F7:         db $AD, $02, $00, $F0, $E2
DATA_06B5FC:         db $AD, $02, $F0, $00, $C0
DATA_06B601:         db $AD, $02, $00, $00, $C2
DATA_06B606:         db $AD, $E7, $9D, $02, $FE
DATA_06B60B:         db $F0, $CA, $7D, $02, $0E
DATA_06B610:         db $F0, $C8, $7D, $02, $FE
DATA_06B615:         db $00, $EA, $7D, $02, $0E
DATA_06B61A:         db $00, $E8, $7D, $02, $E2
DATA_06B61F:         db $F0, $C8, $3F, $02, $F2
DATA_06B624:         db $F0, $CA, $3F, $02, $E2
DATA_06B629:         db $00, $E8, $3F, $02, $F2
DATA_06B62E:         db $00, $EA, $3F, $10, $9F
DATA_06B633:         db $02, $F0, $F0, $C4, $3F
DATA_06B638:         db $02, $00, $F0, $C6, $3F
DATA_06B63D:         db $02, $F0, $00, $E4, $3F
DATA_06B642:         db $02, $00, $00, $E6, $3F

; milde frame $05
DATA_06B647:         db $F8, $02, $F0, $F0, $C0
DATA_06B64C:         db $3D, $02, $00, $F0, $C2
DATA_06B651:         db $3D, $02, $F0, $00, $E0
DATA_06B656:         db $3D, $02, $00, $00, $E2
DATA_06B65B:         db $3D, $09, $02, $F0, $F0
DATA_06B660:         db $E2, $FF, $02, $00, $F0
DATA_06B665:         db $E0, $FF, $02, $F0, $00
DATA_06B66A:         db $C2, $FF, $02, $00, $00
DATA_06B66F:         db $C0, $FF, $02, $F0, $F0
DATA_06B674:         db $C2, $6F, $02, $00, $F0
DATA_06B679:         db $C0, $6F, $02, $F0, $00
DATA_06B67E:         db $E2, $6F, $02, $00, $00
DATA_06B683:         db $E0, $6F, $02, $F0, $F0
DATA_06B688:         db $E0, $AD, $02, $00, $F0
DATA_06B68D:         db $E2, $AD, $02, $F0, $00
DATA_06B692:         db $C0, $AD, $02, $00, $00
DATA_06B697:         db $C2, $AD, $EC, $9D, $02
DATA_06B69C:         db $FF, $F0, $CA, $7D, $02
DATA_06B6A1:         db $0F, $F0, $C8, $7D, $02
DATA_06B6A6:         db $FF, $00, $EA, $7D, $02
DATA_06B6AB:         db $0F, $00, $E8, $7D, $02
DATA_06B6B0:         db $E1, $F0, $C8, $3F, $02
DATA_06B6B5:         db $F1, $F0, $CA, $3F, $02
DATA_06B6BA:         db $E1, $00, $E8, $3F, $02
DATA_06B6BF:         db $F1, $00, $EA, $3F, $15
DATA_06B6C4:         db $9F, $02, $F0, $F0, $C4
DATA_06B6C9:         db $3F, $02, $00, $F0, $C6
DATA_06B6CE:         db $3F, $02, $F0, $00, $E4
DATA_06B6D3:         db $3F, $02, $00, $00, $E6
DATA_06B6D8:         db $3F

; milde frame $06
DATA_06B6D9:         db $F8, $02, $F0, $F0
DATA_06B6DD:         db $C0, $3D, $02, $00, $F0
DATA_06B6E2:         db $C2, $3D, $02, $F0, $00
DATA_06B6E7:         db $E0, $3D, $02, $00, $00
DATA_06B6EC:         db $E2, $3D, $09, $02, $F0
DATA_06B6F1:         db $F0, $E2, $FF, $02, $00
DATA_06B6F6:         db $F0, $E0, $FF, $02, $F0
DATA_06B6FB:         db $00, $C2, $FF, $02, $00
DATA_06B700:         db $00, $C0, $FF, $02, $F0
DATA_06B705:         db $F0, $C2, $6F, $02, $00
DATA_06B70A:         db $F0, $C0, $6F, $02, $F0
DATA_06B70F:         db $00, $E2, $6F, $02, $00
DATA_06B714:         db $00, $E0, $6F, $02, $F0
DATA_06B719:         db $F0, $E0, $AD, $02, $00
DATA_06B71E:         db $F0, $E2, $AD, $02, $F0
DATA_06B723:         db $00, $C0, $AD, $02, $00
DATA_06B728:         db $00, $C2, $AD, $EF, $9D
DATA_06B72D:         db $02, $00, $F0, $CA, $7D
DATA_06B732:         db $02, $10, $F0, $C8, $7D
DATA_06B737:         db $02, $00, $00, $EA, $7D
DATA_06B73C:         db $02, $10, $00, $E8, $7D
DATA_06B741:         db $02, $E1, $F0, $C8, $3F
DATA_06B746:         db $02, $F1, $F0, $CA, $3F
DATA_06B74B:         db $02, $E1, $00, $E8, $3F
DATA_06B750:         db $02, $F1, $00, $EA, $3F
DATA_06B755:         db $19, $9F, $02, $F0, $F0
DATA_06B75A:         db $C4, $3F, $02, $00, $F0
DATA_06B75F:         db $C6, $3F, $02, $F0, $00
DATA_06B764:         db $E4, $3F, $02, $00, $00
DATA_06B769:         db $E6, $3F

; milde frame $07
DATA_06B76B:         db $F8, $02, $F0
DATA_06B76E:         db $F0, $C0, $3D, $02, $00
DATA_06B773:         db $F0, $C2, $3D, $02, $F0
DATA_06B778:         db $00, $E0, $3D, $02, $00
DATA_06B77D:         db $00, $E2, $3D, $09, $02
DATA_06B782:         db $F0, $F0, $E2, $FF, $02
DATA_06B787:         db $00, $F0, $E0, $FF, $02
DATA_06B78C:         db $F0, $00, $C2, $FF, $02
DATA_06B791:         db $00, $00, $C0, $FF, $02
DATA_06B796:         db $F0, $F0, $C2, $6F, $02
DATA_06B79B:         db $00, $F0, $C0, $6F, $02
DATA_06B7A0:         db $F0, $00, $E2, $6F, $02
DATA_06B7A5:         db $00, $00, $E0, $6F, $02
DATA_06B7AA:         db $F0, $F0, $E0, $AD, $02
DATA_06B7AF:         db $00, $F0, $E2, $AD, $02
DATA_06B7B4:         db $F0, $00, $C0, $AD, $02
DATA_06B7B9:         db $00, $00, $C2, $AD, $F2
DATA_06B7BE:         db $9D, $02, $00, $F0, $CA
DATA_06B7C3:         db $7D, $02, $10, $F0, $C8
DATA_06B7C8:         db $7D, $02, $00, $00, $EA
DATA_06B7CD:         db $7D, $02, $10, $00, $E8
DATA_06B7D2:         db $7D, $02, $E0, $F0, $C8
DATA_06B7D7:         db $3F, $02, $F0, $F0, $CA
DATA_06B7DC:         db $3F, $02, $E0, $00, $E8
DATA_06B7E1:         db $3F, $02, $F0, $00, $EA
DATA_06B7E6:         db $3F, $1C, $9F, $02, $F0
DATA_06B7EB:         db $F0, $C4, $3F, $02, $00
DATA_06B7F0:         db $F0, $C6, $3F, $02, $F0
DATA_06B7F5:         db $00, $E4, $3F, $02, $00
DATA_06B7FA:         db $00, $E6, $3F

; milde frame $08
DATA_06B7FD:         db $F8, $02
DATA_06B7FF:         db $F0, $F0, $C0, $3D, $02
DATA_06B804:         db $00, $F0, $C2, $3D, $02
DATA_06B809:         db $F0, $00, $E0, $3D, $02
DATA_06B80E:         db $00, $00, $E2, $3D, $09
DATA_06B813:         db $02, $F0, $F0, $E2, $FF
DATA_06B818:         db $02, $00, $F0, $E0, $FF
DATA_06B81D:         db $02, $F0, $00, $C2, $FF
DATA_06B822:         db $02, $00, $00, $C0, $FF
DATA_06B827:         db $02, $F0, $F0, $C2, $6F
DATA_06B82C:         db $02, $00, $F0, $C0, $6F
DATA_06B831:         db $02, $F0, $00, $E2, $6F
DATA_06B836:         db $02, $00, $00, $E0, $6F
DATA_06B83B:         db $02, $F0, $F0, $E0, $AD
DATA_06B840:         db $02, $00, $F0, $E2, $AD
DATA_06B845:         db $02, $F0, $00, $C0, $AD
DATA_06B84A:         db $02, $00, $00, $C2, $AD
DATA_06B84F:         db $F6, $9D, $02, $00, $F0
DATA_06B854:         db $CA, $7D, $02, $10, $F0
DATA_06B859:         db $C8, $7D, $02, $00, $00
DATA_06B85E:         db $EA, $7D, $02, $10, $00
DATA_06B863:         db $E8, $7D, $02, $E0, $F0
DATA_06B868:         db $C8, $3F, $02, $F0, $F0
DATA_06B86D:         db $CA, $3F, $02, $E0, $00
DATA_06B872:         db $E8, $3F, $02, $F0, $00
DATA_06B877:         db $EA, $3F, $20, $9F, $02
DATA_06B87C:         db $F0, $F0, $C4, $3F, $02
DATA_06B881:         db $00, $F0, $C6, $3F, $02
DATA_06B886:         db $F0, $00, $E4, $3F, $02
DATA_06B88B:         db $00, $00, $E6, $3F

; milde frame $09
DATA_06B88F:         db $F8
DATA_06B890:         db $02, $F0, $F0, $C0, $3D
DATA_06B895:         db $02, $00, $F0, $C2, $3D
DATA_06B89A:         db $02, $F0, $00, $E0, $3D
DATA_06B89F:         db $02, $00, $00, $E2, $3D
DATA_06B8A4:         db $09, $02, $F0, $F0, $E2
DATA_06B8A9:         db $FF, $02, $00, $F0, $E0
DATA_06B8AE:         db $FF, $02, $F0, $00, $C2
DATA_06B8B3:         db $FF, $02, $00, $00, $C0
DATA_06B8B8:         db $FF, $02, $F0, $F0, $C2
DATA_06B8BD:         db $7D, $02, $00, $F0, $C0
DATA_06B8C2:         db $7D, $02, $F0, $00, $E2
DATA_06B8C7:         db $7D, $02, $00, $00, $E0
DATA_06B8CC:         db $7D, $02, $F0, $F0, $E0
DATA_06B8D1:         db $BF, $02, $00, $F0, $E2
DATA_06B8D6:         db $BF, $02, $F0, $00, $C0
DATA_06B8DB:         db $BF, $02, $00, $00, $C2
DATA_06B8E0:         db $BF, $00, $98, $02, $E0
DATA_06B8E5:         db $F0, $C8, $3D, $02, $F0
DATA_06B8EA:         db $F0, $CA, $3D, $02, $E0
DATA_06B8EF:         db $00, $E8, $3D, $02, $F0
DATA_06B8F4:         db $00, $EA, $3D, $02, $C0
DATA_06B8F9:         db $F0, $C4, $3F, $02, $D0
DATA_06B8FE:         db $F0, $C6, $3F, $02, $C0
DATA_06B903:         db $00, $E4, $3F, $02, $D0
DATA_06B908:         db $00, $E6, $3F, $02, $00
DATA_06B90D:         db $F0, $CA, $7F, $02, $10
DATA_06B912:         db $F0, $C8, $7F, $02, $00
DATA_06B917:         db $00, $EA, $7F, $02, $10
DATA_06B91C:         db $00, $E8, $7F, $02, $20
DATA_06B921:         db $F0, $C6, $7F, $02, $30
DATA_06B926:         db $F0, $C4, $7F, $02, $20
DATA_06B92B:         db $00, $E6, $7F, $02, $30
DATA_06B930:         db $00, $E4, $7F

.init_12E
    RTL                 ; $06B933   |

DATA_06B934:         dl $5FD98A
DATA_06B937:         dl $5FD984
DATA_06B93A:         dl $5FD986
DATA_06B93D:         dl $5FD988

; indices into $B934
DATA_06B940:         db $00, $06, $03, $06, $03, $06

; indices into $B934
DATA_06B946:         db $00, $09, $06, $09, $06, $09

DATA_06B94C:         dw $B940
DATA_06B94E:         dw $B946

.main_12E
    LDA #$0180          ; $06B950   |
    SEC                 ; $06B953   |
    SBC $7680,x         ; $06B954   |
    STA $0041           ; $06B957   |
    LDA #$0180          ; $06B95A   |
    SEC                 ; $06B95D   |
    SBC $7682,x         ; $06B95E   |
    STA $0043           ; $06B961   |
    JSL $03AF23         ; $06B964   |
    LDA $0967           ; $06B968   |
    ORA $0968           ; $06B96B   |
    AND #$001B          ; $06B96E   |
    ORA #$0400          ; $06B971   |
    STA $0967           ; $06B974   |
    LDY #$33            ; $06B977   |
    STY $096C           ; $06B979   |
    LDA $7A96,x         ; $06B97C   |
    BNE CODE_06B9B7     ; $06B97F   |
    LDA #$0002          ; $06B981   |
    STA $7A96,x         ; $06B984   |
    LDY $16,x           ; $06B987   |
    LDA $B94C,y         ; $06B989   |
    STA $00             ; $06B98C   |
    LDY $18,x           ; $06B98E   |
    DEY                 ; $06B990   |
    BPL CODE_06B999     ; $06B991   |
    DEC $76,x           ; $06B993   |
    BMI CODE_06B9B8     ; $06B995   |
    LDY #$05            ; $06B997   |

CODE_06B999:
    STY $18,x           ; $06B999   |
    LDA ($00),y         ; $06B99B   |
    TAY                 ; $06B99D   |
    LDA $B934,y         ; $06B99E   |
    STA $00             ; $06B9A1   |
    LDX $B936,y         ; $06B9A3   |
    STX $02             ; $06B9A6   |
    LDX #$04            ; $06B9A8   |

CODE_06B9AA:
    TXY                 ; $06B9AA   |
    LDA [$00],y         ; $06B9AB   |
    STA $702002,x       ; $06B9AD   |
    DEX                 ; $06B9B1   |
    DEX                 ; $06B9B2   |
    BPL CODE_06B9AA     ; $06B9B3   |
    LDX $12             ; $06B9B5   |

CODE_06B9B7:
    RTL                 ; $06B9B7   |

CODE_06B9B8:
    STZ $6098           ; $06B9B8   |
    STZ $60A0           ; $06B9BB   |
    JMP CODE_0603A3     ; $06B9BE   |

DATA_06B9C2:         db $08, $08, $08, $08
DATA_06B9C6:         db $08, $0C, $10, $10
DATA_06B9CA:         db $10, $10, $10, $10
DATA_06B9CE:         db $0C, $08, $10, $10
DATA_06B9D2:         db $10, $10, $10, $10
DATA_06B9D6:         db $10, $10, $00, $03

.init_cloud_drop_vertical
    LDA $7182,x         ; $06B9DA   |
    STA $18,x           ; $06B9DD   |
    LDA $70E2,x         ; $06B9DF   |
    AND #$0010          ; $06B9E2   |
    BEQ CODE_06BA05     ; $06B9E5   |
    LDA $BA2F           ; $06B9E7   |
    STA $75E2,x         ; $06B9EA   |
    LDA #$FE70          ; $06B9ED   |
    STA $7222,x         ; $06B9F0   |
    LDA #$0006          ; $06B9F3   |
    STA $7402,x         ; $06B9F6   |
    TAY                 ; $06B9F9   |
    LDA $B9C2,y         ; $06B9FA   |
    AND #$00FF          ; $06B9FD   |
    STA $7B58,x         ; $06BA00   |
    BRA CODE_06BA21     ; $06BA03   |

CODE_06BA05:
    LDA $BA31           ; $06BA05   |
    STA $75E2,x         ; $06BA08   |
    LDA #$0180          ; $06BA0B   |
    STA $7222,x         ; $06BA0E   |
    LDA #$000D          ; $06BA11   |
    STA $7402,x         ; $06BA14   |
    TAY                 ; $06BA17   |
    LDA $B9C2,y         ; $06BA18   |
    AND #$00FF          ; $06BA1B   |
    STA $7B58,x         ; $06BA1E   |

CODE_06BA21:
    STZ $7A96,x         ; $06BA21   |
    RTL                 ; $06BA24   |

DATA_06BA25:         db $05, $04, $03, $02
DATA_06BA29:         db $01, $0C, $0B, $0A
DATA_06BA2D:         db $09, $08

DATA_06BA2F:         dw $0800, $F800

.main_cloud_drop_vertical
    LDA $7D38,x         ; $06BA33   |
    BEQ CODE_06BA50     ; $06BA36   |
    LDA $61B0           ; $06BA38   |
    ORA $0B55           ; $06BA3B   |
    ORA $0398           ; $06BA3E   |
    BNE CODE_06BA50     ; $06BA41   |
    LDA $6FA0,x         ; $06BA43   |
    ORA #$0200          ; $06BA46   |
    STA $6FA0,x         ; $06BA49   |
    JSL $06BB4D         ; $06BA4C   |

CODE_06BA50:
    JSL $03AF23         ; $06BA50   |
    JSL $06BAF3         ; $06BA54   |
    LDA $16,x           ; $06BA58   |
    BNE CODE_06BAAE     ; $06BA5A   |
    LDA #$0010          ; $06BA5C   |
    STA $7542,x         ; $06BA5F   |
    LDY #$00            ; $06BA62   |
    LDA $7182,x         ; $06BA64   |
    CMP $18,x           ; $06BA67   |
    BCC CODE_06BA6D     ; $06BA69   |
    LDY #$02            ; $06BA6B   |

CODE_06BA6D:
    LDA $BA2F,y         ; $06BA6D   |
    STA $75E2,x         ; $06BA70   |
    LDA $7222,x         ; $06BA73   |
    BNE CODE_06BA88     ; $06BA76   |
    LDA #$0005          ; $06BA78   |
    STA $16,x           ; $06BA7B   |
    LDA #$0004          ; $06BA7D   |
    STA $7A96,x         ; $06BA80   |
    STZ $7542,x         ; $06BA83   |
    BRA CODE_06BAEE     ; $06BA86   |

CODE_06BA88:
    BPL CODE_06BA9C     ; $06BA88   |
    LDA #$000D          ; $06BA8A   |
    STA $7402,x         ; $06BA8D   |
    TAY                 ; $06BA90   |
    LDA $B9C2,y         ; $06BA91   |
    AND #$00FF          ; $06BA94   |
    STA $7B58,x         ; $06BA97   |
    BRA CODE_06BAEE     ; $06BA9A   |

CODE_06BA9C:
    LDA #$0006          ; $06BA9C   |
    STA $7402,x         ; $06BA9F   |
    TAY                 ; $06BAA2   |
    LDA $B9C2,y         ; $06BAA3   |
    AND #$00FF          ; $06BAA6   |
    STA $7B58,x         ; $06BAA9   |
    BRA CODE_06BAEE     ; $06BAAC   |

CODE_06BAAE:
    LDA #$BA25          ; $06BAAE   |
    LDY $75E3,x         ; $06BAB1   |
    BPL CODE_06BAB9     ; $06BAB4   |
    LDA #$BA2A          ; $06BAB6   |

CODE_06BAB9:
    STA $00             ; $06BAB9   |
    LDA $16,x           ; $06BABB   |
    LSR A               ; $06BABD   |
    BNE CODE_06BACC     ; $06BABE   |
    LDA $7A96,x         ; $06BAC0   |
    LSR A               ; $06BAC3   |
    BNE CODE_06BACC     ; $06BAC4   |
    LDA #$0010          ; $06BAC6   |
    STA $7542,x         ; $06BAC9   |

CODE_06BACC:
    LDY $16,x           ; $06BACC   |
    DEY                 ; $06BACE   |
    LDA ($00),y         ; $06BACF   |
    AND #$00FF          ; $06BAD1   |
    STA $7402,x         ; $06BAD4   |
    TAY                 ; $06BAD7   |
    LDA $B9C2,y         ; $06BAD8   |
    AND #$00FF          ; $06BADB   |
    STA $7B58,x         ; $06BADE   |
    LDA $7A96,x         ; $06BAE1   |
    BNE CODE_06BAEE     ; $06BAE4   |
    LDA #$0004          ; $06BAE6   |
    STA $7A96,x         ; $06BAE9   |
    DEC $16,x           ; $06BAEC   |

CODE_06BAEE:
    JSL $03A5B7         ; $06BAEE   |
    RTL                 ; $06BAF2   |

; cloud drop sub
    LDY $7D36,x         ; $06BAF3   |
    DEY                 ; $06BAF6   |
    BMI CODE_06BB35     ; $06BAF7   |
    BEQ CODE_06BB35     ; $06BAF9   |
    LDA $6F00,y         ; $06BAFB   |
    CMP #$0010          ; $06BAFE   |
    BNE CODE_06BB35     ; $06BB01   |
    LDA $7D38,y         ; $06BB03   |
    BEQ CODE_06BB35     ; $06BB06   |
    JSL $0CFF61         ; $06BB08   |
    LDA #$000E          ; $06BB0C   |
    STA $6F00,x         ; $06BB0F   |
    STZ $7222,x         ; $06BB12   |
    STZ $7220,x         ; $06BB15   |
    STZ $7540,x         ; $06BB18   |
    STZ $75E0,x         ; $06BB1B   |
    LDA #$0040          ; $06BB1E   |
    STA $7542,x         ; $06BB21   |
    LDA #$0400          ; $06BB24   |
    STA $75E2,x         ; $06BB27   |
    SEP #$20            ; $06BB2A   |
    LDA #$FF            ; $06BB2C   |
    STA $74A0,x         ; $06BB2E   |
    REP #$20            ; $06BB31   |
    PLY                 ; $06BB33   |
    PLA                 ; $06BB34   |

CODE_06BB35:
    RTL                 ; $06BB35   |

.head_bop_cloud_drop_vertical
    LDA #$0180          ; $06BB3E   |
    STA $75E2,x         ; $06BB41   |
    LDA #$0010          ; $06BB44   |
    STA $7542,x         ; $06BB47   |
    STZ $7220,x         ; $06BB4A   |
    LDA $7A98,x         ; $06BB4D   |
    BNE CODE_06BB69     ; $06BB50   |
    SEP #$20            ; $06BB52   |
    LDA #$04            ; $06BB54   |
    STA $7A98,x         ; $06BB56   |
    LDY $76,x           ; $06BB59   |
    LDA $BB36,y         ; $06BB5B   |
    STA $7402,x         ; $06BB5E   |
    TYA                 ; $06BB61   |
    INC A               ; $06BB62   |
    AND #$07            ; $06BB63   |
    STA $76,x           ; $06BB65   |
    REP #$20            ; $06BB67   |

CODE_06BB69:
    RTL                 ; $06BB69   |

DATA_06BB6A:         db $04, $04, $04, $04
DATA_06BB6E:         db $08, $0C, $08, $08
DATA_06BB72:         db $08, $08, $0C, $0C
DATA_06BB76:         db $0C, $0C, $08, $04

.init_cloud_drop_horizontal
    LDA $70E2,x         ; $06BB7A   |
    STA $18,x           ; $06BB7D   |
    LDA $70E2,x         ; $06BB7F   |
    AND #$0010          ; $06BB82   |
    BEQ CODE_06BBA5     ; $06BB85   |
    LDA $BA2F           ; $06BB87   |
    STA $75E0,x         ; $06BB8A   |
    LDA #$FE70          ; $06BB8D   |
    STA $7220,x         ; $06BB90   |
    LDA #$000F          ; $06BB93   |
    STA $7402,x         ; $06BB96   |
    TAY                 ; $06BB99   |
    LDA $BB6A,y         ; $06BB9A   |
    AND #$00FF          ; $06BB9D   |
    STA $7B56,x         ; $06BBA0   |
    BRA CODE_06BBC1     ; $06BBA3   |

CODE_06BBA5:
    LDA $BA31           ; $06BBA5   |
    STA $75E2,x         ; $06BBA8   |
    LDA #$0180          ; $06BBAB   |
    STA $7220,x         ; $06BBAE   |
    LDA #$0005          ; $06BBB1   |
    STA $7402,x         ; $06BBB4   |
    TAY                 ; $06BBB7   |
    LDA $BB6A,y         ; $06BBB8   |
    AND #$00FF          ; $06BBBB   |
    STA $7B56,x         ; $06BBBE   |

CODE_06BBC1:
    STZ $7A96,x         ; $06BBC1   |
    LDA #$0010          ; $06BBC4   |
    STA $7540,x         ; $06BBC7   |
    RTL                 ; $06BBCA   |

DATA_06BBCB:         db $04, $03, $02, $01
DATA_06BBCF:         db $0E, $0D, $0C, $0B

.main_cloud_drop_horizontal
    LDA $7D38,x         ; $06BBD3   |
    BEQ CODE_06BBF0     ; $06BBD6   |
    LDA $61B0           ; $06BBD8   |
    ORA $0B55           ; $06BBDB   |
    ORA $0398           ; $06BBDE   |
    BNE CODE_06BBF0     ; $06BBE1   |
    LDA $6FA0,x         ; $06BBE3   |
    ORA #$0200          ; $06BBE6   |
    STA $6FA0,x         ; $06BBE9   |
    JSL $06BCA9         ; $06BBEC   |

CODE_06BBF0:
    JSL $03AF23         ; $06BBF0   |
    JSL $06BAF3         ; $06BBF4   |
    STZ $7400,x         ; $06BBF8   |
    LDA $16,x           ; $06BBFB   |
    BNE CODE_06BC51     ; $06BBFD   |
    LDA #$0010          ; $06BBFF   |
    STA $7540,x         ; $06BC02   |
    LDY #$00            ; $06BC05   |
    LDA $70E2,x         ; $06BC07   |
    CMP $18,x           ; $06BC0A   |
    BCC CODE_06BC10     ; $06BC0C   |
    LDY #$02            ; $06BC0E   |

CODE_06BC10:
    LDA $BA2F,y         ; $06BC10   |
    STA $75E0,x         ; $06BC13   |
    LDA $7220,x         ; $06BC16   |
    BNE CODE_06BC2B     ; $06BC19   |
    LDA #$0004          ; $06BC1B   |
    STA $16,x           ; $06BC1E   |
    LDA #$0005          ; $06BC20   |
    STA $7A96,x         ; $06BC23   |
    STZ $7540,x         ; $06BC26   |
    BRA CODE_06BC91     ; $06BC29   |

CODE_06BC2B:
    BPL CODE_06BC3F     ; $06BC2B   |
    LDA #$000F          ; $06BC2D   |
    STA $7402,x         ; $06BC30   |
    TAY                 ; $06BC33   |
    LDA $BB6A,y         ; $06BC34   |
    AND #$00FF          ; $06BC37   |
    STA $7B56,x         ; $06BC3A   |
    BRA CODE_06BC91     ; $06BC3D   |

CODE_06BC3F:
    LDA #$0005          ; $06BC3F   |
    STA $7402,x         ; $06BC42   |
    TAY                 ; $06BC45   |
    LDA $BB6A,y         ; $06BC46   |
    AND #$00FF          ; $06BC49   |
    STA $7B56,x         ; $06BC4C   |
    BRA CODE_06BC91     ; $06BC4F   |

CODE_06BC51:
    LDA #$BBCB          ; $06BC51   |
    LDY $75E1,x         ; $06BC54   |
    BPL CODE_06BC5C     ; $06BC57   |
    LDA #$BBCF          ; $06BC59   |

CODE_06BC5C:
    STA $00             ; $06BC5C   |
    LDA $16,x           ; $06BC5E   |
    LSR A               ; $06BC60   |
    BNE CODE_06BC6F     ; $06BC61   |
    LDA $7A96,x         ; $06BC63   |
    LSR A               ; $06BC66   |
    BNE CODE_06BC6F     ; $06BC67   |
    LDA #$0010          ; $06BC69   |
    STA $7540,x         ; $06BC6C   |

CODE_06BC6F:
    LDY $16,x           ; $06BC6F   |
    DEY                 ; $06BC71   |
    LDA ($00),y         ; $06BC72   |
    AND #$00FF          ; $06BC74   |
    STA $7402,x         ; $06BC77   |
    TAY                 ; $06BC7A   |
    LDA $BB6A,y         ; $06BC7B   |
    AND #$00FF          ; $06BC7E   |
    STA $7B56,x         ; $06BC81   |
    LDA $7A96,x         ; $06BC84   |
    BNE CODE_06BC91     ; $06BC87   |
    LDA #$0005          ; $06BC89   |
    STA $7A96,x         ; $06BC8C   |
    DEC $16,x           ; $06BC8F   |

CODE_06BC91:
    JSL $03A5B7         ; $06BC91   |
    RTL                 ; $06BC95   |

DATA_06BC96:         db $06, $07, $08, $09

.head_bop_cloud_drop_horizontal
    LDA #$0180          ; $06BC9A   |
    STA $75E2,x         ; $06BC9D   |
    LDA #$0010          ; $06BCA0   |
    STA $7542,x         ; $06BCA3   |
    STZ $7220,x         ; $06BCA6   |
    LDA $7A98,x         ; $06BCA9   |
    BNE CODE_06BCC5     ; $06BCAC   |
    SEP #$20            ; $06BCAE   |
    LDA #$05            ; $06BCB0   |
    STA $7A98,x         ; $06BCB2   |
    LDY $76,x           ; $06BCB5   |
    LDA $BC96,y         ; $06BCB7   |
    STA $7402,x         ; $06BCBA   |
    TYA                 ; $06BCBD   |
    INC A               ; $06BCBE   |
    AND #$03            ; $06BCBF   |
    STA $76,x           ; $06BCC1   |
    REP #$20            ; $06BCC3   |

CODE_06BCC5:
    RTL                 ; $06BCC5   |

    TYX                 ; $06BCC6   |
    RTS                 ; $06BCC7   |

.init_baby_mario
    LDY #$C0            ; $06BCC8   |
    STY $7863           ; $06BCCA   |
    RTL                 ; $06BCCD   |

DATA_06BCCE:         dw $C32B
DATA_06BCD0:         dw $C383
DATA_06BCD2:         dw $BCC6
DATA_06BCD4:         dw $C48E
DATA_06BCD6:         dw $BCC6
DATA_06BCD8:         dw $C4BD
DATA_06BCDA:         dw $C591
DATA_06BCDC:         dw $C6D1
DATA_06BCDE:         dw $C4C4
DATA_06BCE0:         dw $C61F
DATA_06BCE2:         dw $C4C4
DATA_06BCE4:         dw $C6EC
DATA_06BCE6:         dw $C812
DATA_06BCE8:         dw $C4C4
DATA_06BCEA:         dw $C61F

.main_baby_mario
    LDY #$06            ; $06BCEC   |
    LDA $7040           ; $06BCEE   |
    AND #$E000          ; $06BCF1   |
    BEQ CODE_06BCF8     ; $06BCF4   |
    LDY #$0C            ; $06BCF6   |

CODE_06BCF8:
    STY $7BB6           ; $06BCF8   |
    STY $7BB8           ; $06BCFB   |
    LDY $0B59           ; $06BCFE   |
    BEQ CODE_06BD2E     ; $06BD01   |
    LDA #$0006          ; $06BD03   |
    CLC                 ; $06BD06   |
    ADC $6120           ; $06BD07   |
    ASL A               ; $06BD0A   |
    STA $00             ; $06BD0B   |
    LSR A               ; $06BD0D   |
    CLC                 ; $06BD0E   |
    ADC $7C16           ; $06BD0F   |
    CMP $00             ; $06BD12   |
    BCS CODE_06BD2E     ; $06BD14   |
    LDA #$0006          ; $06BD16   |
    CLC                 ; $06BD19   |
    ADC $6122           ; $06BD1A   |
    ASL A               ; $06BD1D   |
    STA $00             ; $06BD1E   |
    LSR A               ; $06BD20   |
    CLC                 ; $06BD21   |
    ADC $7C18           ; $06BD22   |
    CMP $00             ; $06BD25   |
    BCS CODE_06BD2E     ; $06BD27   |
    LDY #$FF            ; $06BD29   |
    STY $7D36           ; $06BD2B   |

CODE_06BD2E:
    LDA $0146           ; $06BD2E   |
    CMP #$0009          ; $06BD31   |
    BNE CODE_06BD39     ; $06BD34   |
    JMP CODE_06CA2D     ; $06BD36   |

CODE_06BD39:
    JSR CODE_06BD81     ; $06BD39   |
    LDA $7860           ; $06BD3C   |
    ORA $0DB6           ; $06BD3F   |
    STA $7860           ; $06BD42   |
    LDY $0B57           ; $06BD45   |
    BEQ CODE_06BD50     ; $06BD48   |
    LDA #$0030          ; $06BD4A   |
    TSB $7042           ; $06BD4D   |

CODE_06BD50:
    JSR CODE_06C281     ; $06BD50   |
    JSR CODE_06BFDC     ; $06BD53   |
    LDA $76             ; $06BD56   |
    ASL A               ; $06BD58   |
    TAX                 ; $06BD59   |
    JSR ($BCCE,x)       ; $06BD5A   |

    LDX $12             ; $06BD5D   |
    JSR CODE_06C1EF     ; $06BD5F   |
    JSR CODE_06C2FA     ; $06BD62   |
    JSR CODE_06C26A     ; $06BD65   |
    LDA $61B2           ; $06BD68   |
    AND #$C000          ; $06BD6B   |
    BEQ CODE_06BD75     ; $06BD6E   |
    LDY #$FF            ; $06BD70   |
    STY $7862           ; $06BD72   |

CODE_06BD75:
    STZ $0DB6           ; $06BD75   |
    RTL                 ; $06BD78   |

DATA_06BD79:         dw $0008, $0004
DATA_06BD7D:         dw $0002, $0001

CODE_06BD81:
    LDY $61CC           ; $06BD81   |
    BNE CODE_06BDCD     ; $06BD84   |
    LDY #$00            ; $06BD86   |
    LDA $70E2           ; $06BD88   |
    CMP $7E18           ; $06BD8B   |
    BPL CODE_06BD95     ; $06BD8E   |
    LDA $7E18           ; $06BD90   |
    BRA CODE_06BDA7     ; $06BD93   |

CODE_06BD95:
    SEC                 ; $06BD95   |
    SBC #$00F0          ; $06BD96   |
    CMP $7E1A           ; $06BD99   |
    BMI CODE_06BDCE     ; $06BD9C   |
    INY                 ; $06BD9E   |
    INY                 ; $06BD9F   |
    LDA $7E1A           ; $06BDA0   |
    CLC                 ; $06BDA3   |
    ADC #$00EF          ; $06BDA4   |

CODE_06BDA7:
    STA $70E2           ; $06BDA7   |
    LDA $BD79,y         ; $06BDAA   |
    TSB $7860           ; $06BDAD   |
    LDA $75E0           ; $06BDB0   |
    EOR #$FFFF          ; $06BDB3   |
    INC A               ; $06BDB6   |
    STA $75E0           ; $06BDB7   |
    LDA $7220           ; $06BDBA   |
    EOR #$FFFF          ; $06BDBD   |
    INC A               ; $06BDC0   |
    STA $7220           ; $06BDC1   |
    LDA $7400           ; $06BDC4   |
    EOR #$0002          ; $06BDC7   |
    STA $7400           ; $06BDCA   |

CODE_06BDCD:
    RTS                 ; $06BDCD   |

CODE_06BDCE:
    LDA $0C1C           ; $06BDCE   |
    BEQ CODE_06BDCD     ; $06BDD1   |
    LDY $76             ; $06BDD3   |
    CPY #$01            ; $06BDD5   |
    BEQ CODE_06BDCD     ; $06BDD7   |
    LDA $7040           ; $06BDD9   |
    AND #$E000          ; $06BDDC   |
    BEQ CODE_06BDCD     ; $06BDDF   |
    LDY #$00            ; $06BDE1   |
    LDA $7680           ; $06BDE3   |
    SEC                 ; $06BDE6   |
    SBC #$0008          ; $06BDE7   |
    BMI CODE_06BDFF     ; $06BDEA   |
    SEC                 ; $06BDEC   |
    SBC #$00E0          ; $06BDED   |
    BMI CODE_06BE29     ; $06BDF0   |
    STA $00             ; $06BDF2   |
    INY                 ; $06BDF4   |
    INY                 ; $06BDF5   |
    LDA $0039           ; $06BDF6   |
    CLC                 ; $06BDF9   |
    ADC #$00E7          ; $06BDFA   |
    BRA CODE_06BE08     ; $06BDFD   |

CODE_06BDFF:
    STA $00             ; $06BDFF   |
    LDA $0039           ; $06BE01   |
    CLC                 ; $06BE04   |
    ADC #$0008          ; $06BE05   |

CODE_06BE08:
    STA $70E2           ; $06BE08   |
    LDA $00             ; $06BE0B   |
    EOR $75E0           ; $06BE0D   |
    BMI CODE_06BE22     ; $06BE10   |
    LDA $BD79,y         ; $06BE12   |
    TSB $7860           ; $06BE15   |
    LDA $75E0           ; $06BE18   |
    EOR #$FFFF          ; $06BE1B   |
    INC A               ; $06BE1E   |
    STA $75E0           ; $06BE1F   |

CODE_06BE22:
    LDA $75E0           ; $06BE22   |
    ASL A               ; $06BE25   |
    STA $7220           ; $06BE26   |

CODE_06BE29:
    LDY #$04            ; $06BE29   |
    LDA $7682           ; $06BE2B   |
    SEC                 ; $06BE2E   |
    SBC #$0008          ; $06BE2F   |
    BMI CODE_06BE47     ; $06BE32   |
    SEC                 ; $06BE34   |
    SBC #$00C0          ; $06BE35   |
    BMI CODE_06BE71     ; $06BE38   |
    STA $00             ; $06BE3A   |
    INY                 ; $06BE3C   |
    INY                 ; $06BE3D   |
    LDA $003B           ; $06BE3E   |
    CLC                 ; $06BE41   |
    ADC #$00C7          ; $06BE42   |
    BRA CODE_06BE50     ; $06BE45   |

CODE_06BE47:
    STA $00             ; $06BE47   |
    LDA $003B           ; $06BE49   |
    CLC                 ; $06BE4C   |
    ADC #$0008          ; $06BE4D   |

CODE_06BE50:
    STA $7182           ; $06BE50   |
    LDA $00             ; $06BE53   |
    EOR $75E2           ; $06BE55   |
    BMI CODE_06BE6A     ; $06BE58   |
    LDA $BD79,y         ; $06BE5A   |
    TSB $7860           ; $06BE5D   |
    LDA $75E2           ; $06BE60   |
    EOR #$FFFF          ; $06BE63   |
    INC A               ; $06BE66   |
    STA $75E2           ; $06BE67   |

CODE_06BE6A:
    LDA $75E2           ; $06BE6A   |
    ASL A               ; $06BE6D   |
    STA $7222           ; $06BE6E   |

CODE_06BE71:
    RTS                 ; $06BE71   |

    LDA $7040           ; $06BE72   |
    AND #$E000          ; $06BE75   |
    BEQ CODE_06BE8A     ; $06BE78   |
    STZ $7540           ; $06BE7A   |
    STZ $7542           ; $06BE7D   |
    STZ $7220           ; $06BE80   |
    STZ $7222           ; $06BE83   |
    LDY #$09            ; $06BE86   |
    BRA CODE_06BE8F     ; $06BE88   |

CODE_06BE8A:
    JSR CODE_06BF1E     ; $06BE8A   |
    LDY #$08            ; $06BE8D   |

CODE_06BE8F:
    STY $76             ; $06BE8F   |
    LDA #$6040          ; $06BE91   |
    STA $6FA2           ; $06BE94   |
    LDA #$0002          ; $06BE97   |
    STA $7902           ; $06BE9A   |
    STA $7902,x         ; $06BE9D   |
    ASL A               ; $06BEA0   |
    STA $74A2           ; $06BEA1   |
    STX $18             ; $06BEA4   |
    LDA $61B2           ; $06BEA6   |
    ORA #$4000          ; $06BEA9   |
    STA $61B2           ; $06BEAC   |
    STZ $0D9C           ; $06BEAF   |
    LDA #$003D          ; $06BEB2   |
    JSL $0085D2         ; $06BEB5   |
    RTL                 ; $06BEB9   |

    LDA #$003D          ; $06BEBA   |
    JSL $0085D2         ; $06BEBD   |
    JSR CODE_06BF1E     ; $06BEC1   |
    LDA #$0020          ; $06BEC4   |
    STA $7542           ; $06BEC7   |
    LDA #$0008          ; $06BECA   |
    STA $7540           ; $06BECD   |
    STZ $75E2           ; $06BED0   |
    STZ $75E0           ; $06BED3   |
    LDY #$0A            ; $06BED6   |
    STY $76             ; $06BED8   |

CODE_06BEDA:
    LDA $6090           ; $06BEDA   |
    SEC                 ; $06BEDD   |
    SBC #$0030          ; $06BEDE   |
    CLC                 ; $06BEE1   |
    ADC $609C           ; $06BEE2   |
    CLC                 ; $06BEE5   |
    ADC #$0030          ; $06BEE6   |
    CMP #$8000          ; $06BEE9   |
    ROR A               ; $06BEEC   |
    STA $0DB2           ; $06BEED   |
    RTL                 ; $06BEF0   |

    JSR CODE_06BF1E     ; $06BEF1   |
    LDA #$0020          ; $06BEF4   |
    STA $7542           ; $06BEF7   |
    LDA #$0008          ; $06BEFA   |
    STA $7540           ; $06BEFD   |
    STZ $75E2           ; $06BF00   |
    STZ $75E0           ; $06BF03   |
    LDY #$0D            ; $06BF06   |
    STY $76             ; $06BF08   |
    LDA #$003D          ; $06BF0A   |
    JSL $0085D2         ; $06BF0D   |
    RTL                 ; $06BF11   |

    JSL $06C114         ; $06BF12   |
    JSL $06BF73         ; $06BF16   |
    JSR CODE_06C070     ; $06BF1A   |
    RTL                 ; $06BF1D   |

CODE_06BF1E:
    LDA #$001B          ; $06BF1E   |
    STA $7402           ; $06BF21   |
    STZ $7220           ; $06BF24   |
    STZ $7222           ; $06BF27   |
    STZ $7540           ; $06BF2A   |
    STZ $7542           ; $06BF2D   |
    LDA #$F620          ; $06BF30   |
    STA $6FA0           ; $06BF33   |
    LDA #$604F          ; $06BF36   |
    STA $6FA2           ; $06BF39   |
    LDA #$3001          ; $06BF3C   |
    STA $7040           ; $06BF3F   |
    LDA $61B2           ; $06BF42   |
    BPL CODE_06BF5F     ; $06BF45   |
    AND #$7FFF          ; $06BF47   |
    STA $61B2           ; $06BF4A   |
    LDA #$0040          ; $06BF4D   |
    STA $7AF8           ; $06BF50   |
    LDA #$FFFF          ; $06BF53   |
    STA $7E48           ; $06BF56   |
    LDA #$0000          ; $06BF59   |
    STA $0D92           ; $06BF5C   |

CODE_06BF5F:
    LDA #$0010          ; $06BF5F   |
    STA $6F00           ; $06BF62   |
    STZ $16             ; $06BF65   |
    STZ $7902           ; $06BF67   |
    STZ $7860           ; $06BF6A   |
    LDY #$00            ; $06BF6D   |
    STY $7862           ; $06BF6F   |
    RTS                 ; $06BF72   |

    LDA $7040           ; $06BF73   |
    AND #$E000          ; $06BF76   |
    BEQ CODE_06BFDB     ; $06BF79   |
    LDA #$000D          ; $06BF7B   |
    STA $7402           ; $06BF7E   |
    LDA #$0040          ; $06BF81   |
    STA $7542           ; $06BF84   |
    LDA #$0400          ; $06BF87   |
    STA $75E2           ; $06BF8A   |
    STZ $7540           ; $06BF8D   |
    LDA #$604F          ; $06BF90   |
    STA $6FA2           ; $06BF93   |
    LDA #$1801          ; $06BF96   |
    STA $7040           ; $06BF99   |
    STZ $7AF8           ; $06BF9C   |
    LDY #$00            ; $06BF9F   |
    STY $7862           ; $06BFA1   |
    LDA #$01E1          ; $06BFA4   |
    JSL $008B21         ; $06BFA7   |
    LDA $70E2           ; $06BFAB   |
    CLC                 ; $06BFAE   |
    ADC #$0008          ; $06BFAF   |
    STA $70A2,y         ; $06BFB2   |
    LDA $7182           ; $06BFB5   |
    CLC                 ; $06BFB8   |
    ADC #$0008          ; $06BFB9   |
    STA $7142,y         ; $06BFBC   |
    LDA #$000A          ; $06BFBF   |
    STA $73C2,y         ; $06BFC2   |
    STA $7E4E,y         ; $06BFC5   |
    LDA #$000C          ; $06BFC8   |
    STA $7E4C,y         ; $06BFCB   |
    LDA #$0001          ; $06BFCE   |

CODE_06BFD1:
    STA $7782,y         ; $06BFD1   |
    LDA #$003B          ; $06BFD4   |
    JSL $0085D2         ; $06BFD7   |

CODE_06BFDB:
    RTL                 ; $06BFDB   |

CODE_06BFDC:
    LDA $0B59           ; $06BFDC   |
    BEQ CODE_06BFE9     ; $06BFDF   |
    LDA $6F00           ; $06BFE1   |
    CMP #$000A          ; $06BFE4   |
    BEQ CODE_06BFEC     ; $06BFE7   |

CODE_06BFE9:
    JSR CODE_06C9E1     ; $06BFE9   |

CODE_06BFEC:
    LDA $6F00           ; $06BFEC   |
    CMP #$000A          ; $06BFEF   |
    BEQ CODE_06C065     ; $06BFF2   |
    LDY $0D9A           ; $06BFF4   |
    BEQ CODE_06C00A     ; $06BFF7   |
    JSL $03B69D         ; $06BFF9   |

CODE_06BFFD:
    JSL $03B716         ; $06BFFD   |
    LDA $6F00           ; $06C001   |
    CMP #$0008          ; $06C004   |
    BEQ CODE_06C028     ; $06C007   |
    RTS                 ; $06C009   |

CODE_06C00A:
    LDY $76             ; $06C00A   |
    CPY #$3005          ; $06C00C   |
    BPL CODE_06BFD1     ; $06C00F   |
    PHP                 ; $06C011   |
    BPL CODE_06C020     ; $06C012   |
    LDA $61B0           ; $06C014   |
    ORA $0B55           ; $06C017   |
    ORA $0398           ; $06C01A   |
    BNE CODE_06BFFD     ; $06C01D   |
    RTS                 ; $06C01F   |

CODE_06C020:
    LDA $6F00           ; $06C020   |
    CMP #$0008          ; $06C023   |
    BNE CODE_06C065     ; $06C026   |

CODE_06C028:
    STA $0D9A           ; $06C028   |
    STA $61B0           ; $06C02B   |
    LDA #$8000          ; $06C02E   |
    TSB $61AE           ; $06C031   |
    LDY $76             ; $06C034   |
    CPY #$3008          ; $06C036   |
    PHP                 ; $06C039   |
    JSL $06C114         ; $06C03A   |
    JSL $06BF73         ; $06C03E   |
    LDY $6150           ; $06C042   |
    CPY #$D004          ; $06C045   |
    ASL A               ; $06C048   |
    LDA $6154           ; $06C049   |
    CMP #$FFF0          ; $06C04C   |
    BMI CODE_06C065     ; $06C04F   |
    BRA CODE_06C05F     ; $06C051   |

    LDA $6152           ; $06C053   |
    CLC                 ; $06C056   |
    ADC #$0010          ; $06C057   |
    CMP #$0020          ; $06C05A   |
    BCS CODE_06C065     ; $06C05D   |

CODE_06C05F:
    STZ $6168           ; $06C05F   |
    JSR CODE_06C070     ; $06C062   |

CODE_06C065:
    PLA                 ; $06C065   |
    STA $00             ; $06C066   |
    JSL $03AF23         ; $06C068   |
    LDA $00             ; $06C06C   |
    PHA                 ; $06C06E   |
    RTS                 ; $06C06F   |

CODE_06C070:
    LDA #$0010          ; $06C070   |
    STA $6F00           ; $06C073   |
    LDY #$00            ; $06C076   |
    STY $7862           ; $06C078   |
    LDA #$0040          ; $06C07B   |
    STA $7542           ; $06C07E   |
    LDY #$01            ; $06C081   |
    STY $76             ; $06C083   |
    STZ $0D9C           ; $06C085   |
    LDY $0B57           ; $06C088   |
    BNE CODE_06C099     ; $06C08B   |
    INC $0D9A           ; $06C08D   |
    LDA #$0001          ; $06C090   |
    STA $61AE           ; $06C093   |
    INC $61B0           ; $06C096   |

CODE_06C099:
    RTS                 ; $06C099   |

    LDA #$0400          ; $06C09A   |
    STA $75E2           ; $06C09D   |
    LDA #$0040          ; $06C0A0   |
    STA $7542           ; $06C0A3   |
    LDY #$0A            ; $06C0A6   |
    LDA $7040           ; $06C0A8   |
    AND #$E000          ; $06C0AB   |
    BEQ CODE_06C0CF     ; $06C0AE   |
    INY                 ; $06C0B0   |
    BRA CODE_06C0CF     ; $06C0B1   |

    LDA $76             ; $06C0B3   |
    SEC                 ; $06C0B5   |
    SBC #$000D          ; $06C0B6   |
    BRA CODE_06C0CB     ; $06C0B9   |

    LDA $76             ; $06C0BB   |
    CMP #$0008          ; $06C0BD   |
    BEQ CODE_06C0C7     ; $06C0C0   |
    CMP #$0009          ; $06C0C2   |
    BNE CODE_06C0FD     ; $06C0C5   |

CODE_06C0C7:
    SEC                 ; $06C0C7   |
    SBC #$0008          ; $06C0C8   |

CODE_06C0CB:
    CLC                 ; $06C0CB   |
    ADC #$000A          ; $06C0CC   |

CODE_06C0CF:
    STA $76             ; $06C0CF   |
    CMP #$000B          ; $06C0D1   |
    BNE CODE_06C0FD     ; $06C0D4   |
    LDA #$FF00          ; $06C0D6   |
    STA $7222           ; $06C0D9   |
    LDA #$0002          ; $06C0DC   |
    STA $7540           ; $06C0DF   |
    ASL A               ; $06C0E2   |
    STA $7542           ; $06C0E3   |
    LDA #$FF00          ; $06C0E6   |
    STA $75E2           ; $06C0E9   |
    LDX $7400           ; $06C0EC   |
    LDA $06C4B9,x       ; $06C0EF   |
    STA $75E0           ; $06C0F3   |
    LDX $12             ; $06C0F6   |
    STZ $7AF6           ; $06C0F8   |
    STZ $16             ; $06C0FB   |

CODE_06C0FD:
    STZ $18             ; $06C0FD   |
    STZ $7902           ; $06C0FF   |
    LDA $61B2           ; $06C102   |
    AND #$BFFF          ; $06C105   |
    STA $61B2           ; $06C108   |
    LDA #$604F          ; $06C10B   |
    STA $6FA2           ; $06C10E   |
    JMP CODE_06BEDA     ; $06C111   |

    LDY $18             ; $06C114   |
    BNE CODE_06C119     ; $06C116   |
    RTL                 ; $06C118   |

CODE_06C119:
    JSL $06C0BB         ; $06C119   |
    LDA $7360,y         ; $06C11D   |
    CMP #$00D9          ; $06C120   |
    BNE CODE_06C12A     ; $06C123   |
    LDA $100F           ; $06C125   |
    BNE CODE_06C136     ; $06C128   |

CODE_06C12A:
    LDA $70E2,y         ; $06C12A   |
    STA $70E2           ; $06C12D   |
    LDA $7182,y         ; $06C130   |
    STA $7182           ; $06C133   |

CODE_06C136:
    LDA $7360,y         ; $06C136   |
    CMP #$0058          ; $06C139   |
    BEQ CODE_06C16E     ; $06C13C   |
    CMP #$005C          ; $06C13E   |
    BEQ CODE_06C173     ; $06C141   |
    CMP #$0184          ; $06C143   |
    BEQ CODE_06C16D     ; $06C146   |
    CMP #$00D9          ; $06C148   |
    BEQ CODE_06C1B4     ; $06C14B   |
    CMP #$0119          ; $06C14D   |
    BEQ CODE_06C16D     ; $06C150   |
    CMP #$0017          ; $06C152   |
    BNE CODE_06C15A     ; $06C155   |
    JMP CODE_06C1DF     ; $06C157   |

CODE_06C15A:
    CMP #$01A5          ; $06C15A   |
    BCC CODE_06C189     ; $06C15D   |
    CMP #$01AA          ; $06C15F   |
    BCS CODE_06C189     ; $06C162   |
    TYX                 ; $06C164   |
    STZ $78,x           ; $06C165   |
    JSL $02B2BB         ; $06C167   |
    LDX $12             ; $06C16B   |

CODE_06C16D:
    RTL                 ; $06C16D   |

CODE_06C16E:
    LDA #$0000          ; $06C16E   |
    BRA CODE_06C176     ; $06C171   |

CODE_06C173:
    LDA #$0005          ; $06C173   |

CODE_06C176:
    STA $79D6,y         ; $06C176   |
    LDA #$0040          ; $06C179   |
    STA $7AF8,y         ; $06C17C   |
    LDA #$0000          ; $06C17F   |
    STA $7A38,y         ; $06C182   |
    STA $7902,y         ; $06C185   |
    RTL                 ; $06C188   |

CODE_06C189:
    SEP #$20            ; $06C189   |
    LDA #$12            ; $06C18B   |
    STA $79D6,y         ; $06C18D   |
    REP #$20            ; $06C190   |
    LDA #$000A          ; $06C192   |
    STA $7A36,y         ; $06C195   |
    LDA #$0012          ; $06C198   |
    STA $7402,y         ; $06C19B   |
    LDA #$0040          ; $06C19E   |
    STA $7A98,y         ; $06C1A1   |
    LDA #$0000          ; $06C1A4   |
    STA $7A38,y         ; $06C1A7   |
    STA $7902,y         ; $06C1AA   |
    STA $7220,y         ; $06C1AD   |
    STA $7540,y         ; $06C1B0   |
    RTL                 ; $06C1B3   |

CODE_06C1B4:
    LDA #$0001          ; $06C1B4   |
    STA $79D6,y         ; $06C1B7   |
    LDA #$0100          ; $06C1BA   |
    STA $75E2,y         ; $06C1BD   |
    LDA #$0008          ; $06C1C0   |
    STA $7542,y         ; $06C1C3   |
    LDA #$0000          ; $06C1C6   |
    STA $7A38,y         ; $06C1C9   |
    STA $7902,y         ; $06C1CC   |
    STA $7402,y         ; $06C1CF   |
    LDA #$0060          ; $06C1D2   |
    STA $7AF8,y         ; $06C1D5   |
    LDA #$0200          ; $06C1D8   |
    STA $7900,y         ; $06C1DB   |
    RTL                 ; $06C1DE   |

CODE_06C1DF:
    SEP #$20            ; $06C1DF   |
    LDA #$00            ; $06C1E1   |
    STA $7902,y         ; $06C1E3   |
    REP #$20            ; $06C1E6   |
    LDA #$0080          ; $06C1E8   |
    STA $7AF8,y         ; $06C1EB   |
    RTL                 ; $06C1EE   |

CODE_06C1EF:
    LDA $0D94           ; $06C1EF   |
    ORA $614A           ; $06C1F2   |
    ORA $0D9C           ; $06C1F5   |
    BEQ CODE_06C1FB     ; $06C1F8   |

CODE_06C1FA:
    RTS                 ; $06C1FA   |

CODE_06C1FB:
    LDY $7D36           ; $06C1FB   |
    BPL CODE_06C1FA     ; $06C1FE   |
    LDA $61D6           ; $06C200   |
    CMP #$0050          ; $06C203   |
    BPL CODE_06C1FA     ; $06C206   |
    LDY $76             ; $06C208   |
    CPY #$04            ; $06C20A   |
    BMI CODE_06C212     ; $06C20C   |
    CPY #$08            ; $06C20E   |
    BMI CODE_06C1FA     ; $06C210   |

CODE_06C212:
    LDA $7AF8           ; $06C212   |
    BEQ CODE_06C25F     ; $06C215   |
    CMP #$0020          ; $06C217   |
    BCS CODE_06C1FA     ; $06C21A   |
    LDY $18             ; $06C21C   |
    BEQ CODE_06C1FA     ; $06C21E   |
    LDA $7360,y         ; $06C220   |
    CMP #$0020          ; $06C223   |
    BEQ CODE_06C237     ; $06C226   |
    CMP #$00A3          ; $06C228   |
    BEQ CODE_06C237     ; $06C22B   |
    CMP #$00A4          ; $06C22D   |
    BEQ CODE_06C237     ; $06C230   |
    CMP #$005B          ; $06C232   |
    BNE CODE_06C25F     ; $06C235   |

CODE_06C237:
    SEP #$20            ; $06C237   |

    LDA #$18            ; $06C239   |
    STA $79D6,y         ; $06C23B   |
    REP #$20            ; $06C23E   |
    LDA #$0017          ; $06C240   |
    STA $7402,y         ; $06C243   |
    LDA #$0007          ; $06C246   |
    STA $7A36,y         ; $06C249   |
    LDA #$FC00          ; $06C24C   |
    STA $7222,y         ; $06C24F   |
    LDA #$0000          ; $06C252   |
    STA $7976,y         ; $06C255   |
    LDA #$0020          ; $06C258   |
    STA $7AF8           ; $06C25B   |
    RTS                 ; $06C25E   |

CODE_06C25F:
    JSL $06C114         ; $06C25F   |
    JSL $06BF73         ; $06C263   |
    JMP CODE_06C070     ; $06C267   |

CODE_06C26A:
    LDA $6FA2           ; $06C26A   |
    AND #$9FFF          ; $06C26D   |
    LDY $0CC8           ; $06C270   |
    BNE CODE_06C27A     ; $06C273   |
    ORA #$6000          ; $06C275   |
    BRA CODE_06C27D     ; $06C278   |

CODE_06C27A:
    ORA #$4000          ; $06C27A   |

CODE_06C27D:
    STA $6FA2           ; $06C27D   |
    RTS                 ; $06C280   |

CODE_06C281:
    LDA $03B6           ; $06C281   |
    CMP #$0009          ; $06C284   |
    BPL CODE_06C2B4     ; $06C287   |
    JSR CODE_06C2B5     ; $06C289   |
    BPL CODE_06C2B1     ; $06C28C   |
    LDA $61B2           ; $06C28E   |
    BIT #$4000          ; $06C291   |
    BEQ CODE_06C2A2     ; $06C294   |
    LDX $18             ; $06C296   |
    JSL $03A31E         ; $06C298   |
    LDX $12             ; $06C29C   |
    JSL $06C114         ; $06C29E   |

CODE_06C2A2:
    LDA #$FFFF          ; $06C2A2   |
    STA $7AF8           ; $06C2A5   |
    STZ $7220           ; $06C2A8   |
    STZ $7222           ; $06C2AB   |
    STZ $7542           ; $06C2AE   |

CODE_06C2B1:
    JSR CODE_06C876     ; $06C2B1   |

CODE_06C2B4:
    RTS                 ; $06C2B4   |

CODE_06C2B5:
    LDA #$0800          ; $06C2B5   |
    CMP $7182           ; $06C2B8   |
    BMI CODE_06C2F5     ; $06C2BB   |
    LDA $7680,x         ; $06C2BD   |
    CLC                 ; $06C2C0   |
    ADC #$0010          ; $06C2C1   |
    CMP #$0120          ; $06C2C4   |
    BCC CODE_06C2F6     ; $06C2C7   |
    LDA $7682,x         ; $06C2C9   |
    CLC                 ; $06C2CC   |
    ADC #$0010          ; $06C2CD   |
    CMP #$0120          ; $06C2D0   |
    BCC CODE_06C2F6     ; $06C2D3   |
    PHX                 ; $06C2D5   |
    REP #$10            ; $06C2D6   |
    LDA $7CD8           ; $06C2D8   |
    AND #$FF00          ; $06C2DB   |
    LSR A               ; $06C2DE   |
    LSR A               ; $06C2DF   |
    LSR A               ; $06C2E0   |
    LSR A               ; $06C2E1   |
    STA $00             ; $06C2E2   |
    LDA $7CD6           ; $06C2E4   |
    AND #$FF00          ; $06C2E7   |
    XBA                 ; $06C2EA   |
    ORA $00             ; $06C2EB   |
    TAX                 ; $06C2ED   |
    LDA $6CAA,x         ; $06C2EE   |
    SEP #$10            ; $06C2F1   |
    PLX                 ; $06C2F3   |
    TAY                 ; $06C2F4   |

CODE_06C2F5:
    RTS                 ; $06C2F5   |

CODE_06C2F6:
    LDA #$0000          ; $06C2F6   |
    RTS                 ; $06C2F9   |

CODE_06C2FA:
    LDY $0B59           ; $06C2FA   |
    BEQ CODE_06C326     ; $06C2FD   |
    LDY $76             ; $06C2FF   |
    CPY #$01            ; $06C301   |
    BEQ CODE_06C326     ; $06C303   |
    CPY #$02            ; $06C305   |
    BEQ CODE_06C326     ; $06C307   |
    LDA $7040           ; $06C309   |
    AND #$E000          ; $06C30C   |
    BEQ CODE_06C326     ; $06C30F   |
    LDY $7402           ; $06C311   |
    CPY #$1F            ; $06C314   |
    BMI CODE_06C326     ; $06C316   |
    JSL $06C114         ; $06C318   |
    LDA #$001F          ; $06C31C   |
    TRB $6FA2           ; $06C31F   |
    LDY #$0C            ; $06C322   |
    STY $76,x           ; $06C324   |

CODE_06C326:
    RTS                 ; $06C326   |

DATA_06C327:         dw $1615, $1715

    LDA $7860           ; $06C32B   |
    AND #$0001          ; $06C32E   |
    BNE CODE_06C33D     ; $06C331   |
    LDY $7862           ; $06C333   |
    BEQ CODE_06C352     ; $06C336   |
    LDY $7223           ; $06C338   |
    BMI CODE_06C37E     ; $06C33B   |

CODE_06C33D:
    LDA $7220           ; $06C33D   |
    PHA                 ; $06C340   |
    LDA $7222           ; $06C341   |
    PHA                 ; $06C344   |
    JSL $06BEC1         ; $06C345   |
    PLA                 ; $06C349   |
    STA $7222           ; $06C34A   |
    PLA                 ; $06C34D   |
    STA $7220           ; $06C34E   |
    RTS                 ; $06C351   |

CODE_06C352:
    LDY $7223           ; $06C352   |
    BMI CODE_06C37E     ; $06C355   |
    LDA $0B57           ; $06C357   |
    BNE CODE_06C364     ; $06C35A   |
    LDA $0DB2           ; $06C35C   |
    CMP $7182           ; $06C35F   |
    BMI CODE_06C33D     ; $06C362   |

CODE_06C364:
    LDY $7A98           ; $06C364   |
    BNE CODE_06C37E     ; $06C367   |
    LDY #$08            ; $06C369   |
    STY $7A98           ; $06C36B   |
    LDA $16             ; $06C36E   |
    DEC A               ; $06C370   |
    AND #$0003          ; $06C371   |
    TAY                 ; $06C374   |
    STY $16             ; $06C375   |
    LDA $C327,y         ; $06C377   |
    TAY                 ; $06C37A   |
    STY $7402           ; $06C37B   |

CODE_06C37E:
    RTS                 ; $06C37E   |

DATA_06C37F:         dw $0100, $FF00

    LDY $0B57           ; $06C383   |
    BEQ CODE_06C38B     ; $06C386   |
    JMP CODE_06C414     ; $06C388   |

CODE_06C38B:
    SEP #$20            ; $06C38B   |
    LDA #$04            ; $06C38D   |
    STA $74A2           ; $06C38F   |
    REP #$20            ; $06C392   |
    LDA $6F00           ; $06C394   |
    CMP #$0008          ; $06C397   |
    BNE CODE_06C3AA     ; $06C39A   |
    LDA #$0010          ; $06C39C   |
    STA $6F00           ; $06C39F   |
    STZ $6168           ; $06C3A2   |
    LDY #$00            ; $06C3A5   |
    STY $7862           ; $06C3A7   |

CODE_06C3AA:
    LDY $0D9C           ; $06C3AA   |
    BNE CODE_06C400     ; $06C3AD   |
    LDA $7C16           ; $06C3AF   |
    STA $3000           ; $06C3B2   |
    LDA #$F800          ; $06C3B5   |
    STA $300C           ; $06C3B8   |
    LDX #$0B            ; $06C3BB   |
    LDA #$86B6          ; $06C3BD   |
    JSL $7EDE44         ; $06C3C0   | GSU init

    LDA $3000           ; $06C3C4   |
    STA $7220           ; $06C3C7   |
    STZ $3000           ; $06C3CA   |
    LDA $7C18           ; $06C3CD   |
    BMI CODE_06C3E4     ; $06C3D0   |
    STA $3000           ; $06C3D2   |
    LDA #$F800          ; $06C3D5   |
    STA $300C           ; $06C3D8   |
    LDX #$0B            ; $06C3DB   |
    LDA #$86B6          ; $06C3DD   |
    JSL $7EDE44         ; $06C3E0   | GSU init

CODE_06C3E4:
    LDA $3000           ; $06C3E4   |
    CLC                 ; $06C3E7   |
    ADC #$FC00          ; $06C3E8   |
    STA $7222           ; $06C3EB   |
    STZ $7860           ; $06C3EE   |
    LDY #$0D            ; $06C3F1   |
    STY $7402           ; $06C3F3   |
    LDA #$6040          ; $06C3F6   |
    STA $6FA2           ; $06C3F9   |
    INC $0D9C           ; $06C3FC   |
    RTS                 ; $06C3FF   |

CODE_06C400:
    LDY $7223           ; $06C400   |
    BMI CODE_06C463     ; $06C403   |
    LDA $7C18           ; $06C405   |
    CMP #$0008          ; $06C408   |
    BCS CODE_06C453     ; $06C40B   |
    LDA #$0043          ; $06C40D   |
    JSL $0085D2         ; $06C410   |

CODE_06C414:
    LDA #$0001          ; $06C414   |
    STA $7902           ; $06C417   |
    LDA #$000A          ; $06C41A   |
    STA $6F00           ; $06C41D   |
    STZ $7A36           ; $06C420   |
    STZ $7A38           ; $06C423   |
    STZ $16             ; $06C426   |
    STZ $76             ; $06C428   |
    STZ $18             ; $06C42A   |
    LDA #$604F          ; $06C42C   |
    STA $6FA2           ; $06C42F   |
    LDY #$00            ; $06C432   |
    STY $7862           ; $06C434   |
    LDA $61B2           ; $06C437   |
    AND #$0FFF          ; $06C43A   |
    ORA #$8000          ; $06C43D   |
    STA $61B2           ; $06C440   |
    STZ $0D9C           ; $06C443   |
    STZ $0D9A           ; $06C446   |
    STZ $61AE           ; $06C449   |
    STZ $61B0           ; $06C44C   |
    LDX $12             ; $06C44F   |
    PLA                 ; $06C451   |
    RTL                 ; $06C452   |

CODE_06C453:
    LDA $7860           ; $06C453   |
    AND #$0001          ; $06C456   |
    BEQ CODE_06C463     ; $06C459   |
    LDA #$0006          ; $06C45B   |
    STA $16             ; $06C45E   |
    STZ $0D9C           ; $06C460   |

CODE_06C463:
    RTS                 ; $06C463   |

DATA_06C464:         db $24, $25, $26, $27, $23, $22, $21, $20
DATA_06C46C:         db $22, $23, $27, $26, $25, $24, $20, $21
DATA_06C474:         db $22, $23, $22, $21, $20

DATA_06C479:         db $20, $04, $04, $20, $20, $04, $04, $20
DATA_06C481:         db $04, $20, $20, $04, $04, $20, $20, $04
DATA_06C489:         db $04, $20, $04, $04, $20

    LDY $7A98           ; $06C48E   |
    BNE CODE_06C4AE     ; $06C491   |
    DEC $16             ; $06C493   |
    BPL CODE_06C49C     ; $06C495   |
    LDA #$0014          ; $06C497   |
    STA $16             ; $06C49A   |

CODE_06C49C:
    LDY $16             ; $06C49C   |
    LDA $C464,y         ; $06C49E   |
    AND #$00FF          ; $06C4A1   |
    STA $7402           ; $06C4A4   |
    LDA $C479,y         ; $06C4A7   |
    TAY                 ; $06C4AA   |
    STY $7A98           ; $06C4AB   |

CODE_06C4AE:
    RTS                 ; $06C4AE   |

DATA_06C4AF:         dw $1C1B, $1F1D, $1F1E, $1F1D
DATA_06C4B7:         dw $1F1E

DATA_06C4B9:         dw $FF80, $0080

    LDY $614E           ; $06C4BD   |
    CPY #$03            ; $06C4C0   |
    BNE CODE_06C51B     ; $06C4C2   |
    LDY $7A98           ; $06C4C4   |
    BNE CODE_06C51B     ; $06C4C7   |
    LDY #$02            ; $06C4C9   |
    STY $7A98           ; $06C4CB   |
    INC $16             ; $06C4CE   |
    LDY $16             ; $06C4D0   |
    CPY #$09            ; $06C4D2   |
    BMI CODE_06C514     ; $06C4D4   |
    PHY                 ; $06C4D6   |
    LDY $76             ; $06C4D7   |
    CPY #$08            ; $06C4D9   |
    BEQ CODE_06C50F     ; $06C4DB   |
    LDA #$FF00          ; $06C4DD   |
    STA $7222           ; $06C4E0   |
    LDA #$FF80          ; $06C4E3   |
    STA $75E2           ; $06C4E6   |
    STZ $7542           ; $06C4E9   |
    LDA #$0002          ; $06C4EC   |
    STA $7542           ; $06C4EF   |
    CPY #$0A            ; $06C4F2   |
    BNE CODE_06C50F     ; $06C4F4   |
    STA $7540           ; $06C4F6   |
    ASL A               ; $06C4F9   |
    STA $7542           ; $06C4FA   |
    LDA #$FF00          ; $06C4FD   |
    STA $75E2           ; $06C500   |
    LDY $7400           ; $06C503   |
    LDA $C4B9,y         ; $06C506   |
    STA $75E0           ; $06C509   |
    STZ $7AF6           ; $06C50C   |

CODE_06C50F:
    PLY                 ; $06C50F   |
    STZ $16             ; $06C510   |
    INC $76             ; $06C512   |

CODE_06C514:
    LDA $C4AE,y         ; $06C514   |
    TAY                 ; $06C517   |
    STY $7402           ; $06C518   |

CODE_06C51B:
    LDY $76             ; $06C51B   |
    CPY #$08            ; $06C51D   |
    BEQ CODE_06C525     ; $06C51F   |
    CPY #$09            ; $06C521   |
    BNE CODE_06C528     ; $06C523   |

CODE_06C525:
    JSR CODE_06C529     ; $06C525   |

CODE_06C528:
    RTS                 ; $06C528   |

CODE_06C529:
    LDY $18             ; $06C529   |
    BEQ CODE_06C574     ; $06C52B   |
    LDA $6F00,y         ; $06C52D   |
    CMP #$0002          ; $06C530   |
    BNE CODE_06C53A     ; $06C533   |
    JSL $06C0BB         ; $06C535   |
    RTS                 ; $06C539   |

CODE_06C53A:
    CMP #$0010          ; $06C53A   |
    BNE CODE_06C574     ; $06C53D   |
    LDA $7360,y         ; $06C53F   |
    CMP #$01A2          ; $06C542   |
    BEQ CODE_06C574     ; $06C545   |
    CMP #$0115          ; $06C547   |
    BEQ CODE_06C574     ; $06C54A   |
    LDA $7360,y         ; $06C54C   |
    CMP #$00D9          ; $06C54F   |
    BEQ CODE_06C578     ; $06C552   |
    LDA $70E2,y         ; $06C554   |
    SEC                 ; $06C557   |
    SBC $70E2           ; $06C558   |
    CLC                 ; $06C55B   |
    ADC #$0018          ; $06C55C   |
    CMP #$0030          ; $06C55F   |
    BCS CODE_06C574     ; $06C562   |
    LDA $7182,y         ; $06C564   |
    SEC                 ; $06C567   |
    SBC $7182           ; $06C568   |
    CLC                 ; $06C56B   |
    ADC #$0020          ; $06C56C   |
    CMP #$0040          ; $06C56F   |
    BCC CODE_06C578     ; $06C572   |

CODE_06C574:
    JSL $06C114         ; $06C574   |

CODE_06C578:
    RTS                 ; $06C578   |

DATA_06C579:         db $1F, $20, $1F, $21, $23, $22, $23, $24

DATA_06C581:         db $04, $08, $04, $08, $08, $10, $08, $10
DATA_06C589:         db $20, $18, $10, $0A, $E0, $00, $20, $00

    LDX $12             ; $06C591   |
    LDA $61B0           ; $06C593   |
    ORA $0B55           ; $06C596   |
    ORA $0398           ; $06C599   |
    BEQ CODE_06C5A2     ; $06C59C   |
    JSL $03B69D         ; $06C59E   |

CODE_06C5A2:
    LDA $0C8A           ; $06C5A2   |
    ORA $614E           ; $06C5A5   |
    BNE CODE_06C5CE     ; $06C5A8   |
    JSL $06BF73         ; $06C5AA   |
    LDA #$000A          ; $06C5AE   |
    STA $6F00           ; $06C5B1   |
    LDA $61B2           ; $06C5B4   |
    AND #$0FFF          ; $06C5B7   |
    ORA #$8000          ; $06C5BA   |
    STA $61B2           ; $06C5BD   |
    TXA                 ; $06C5C0   |
    STA $7E48           ; $06C5C1   |
    LDA #$FFFF          ; $06C5C4   |
    STA $0D92           ; $06C5C7   |
    STZ $76             ; $06C5CA   |
    PLA                 ; $06C5CC   |
    RTL                 ; $06C5CD   |

CODE_06C5CE:
    LDA $7860           ; $06C5CE   |
    AND #$0003          ; $06C5D1   |
    BEQ CODE_06C607     ; $06C5D4   |
    PHA                 ; $06C5D6   |
    STZ $7860           ; $06C5D7   |
    LDA $7182           ; $06C5DA   |
    SEC                 ; $06C5DD   |
    SBC $72C2           ; $06C5DE   |
    STA $7182           ; $06C5E1   |
    PLA                 ; $06C5E4   |
    AND #$0002          ; $06C5E5   |
    DEC A               ; $06C5E8   |
    EOR $75E2           ; $06C5E9   |
    BMI CODE_06C5F3     ; $06C5EC   |
    LDA $75E2           ; $06C5EE   |
    BRA CODE_06C5FA     ; $06C5F1   |

CODE_06C5F3:
    LDA $75E2           ; $06C5F3   |
    EOR #$FFFF          ; $06C5F6   |
    INC A               ; $06C5F9   |

CODE_06C5FA:
    CMP #$8000          ; $06C5FA   |
    ROR A               ; $06C5FD   |
    CMP #$8000          ; $06C5FE   |
    ROR A               ; $06C601   |
    STA $7222           ; $06C602   |
    BRA CODE_06C60F     ; $06C605   |

CODE_06C607:
    LDA $75E2           ; $06C607   |
    CMP $7222           ; $06C60A   |
    BNE CODE_06C61F     ; $06C60D   |

CODE_06C60F:
    LDA #$0080          ; $06C60F   |
    STA $7A96           ; $06C612   |
    LDA $75E2           ; $06C615   |
    EOR #$FFFF          ; $06C618   |
    INC A               ; $06C61B   |
    STA $75E2           ; $06C61C   |

CODE_06C61F:
    LDY $7A98           ; $06C61F   |
    BEQ CODE_06C627     ; $06C622   |
    JMP CODE_06C6CE     ; $06C624   |

CODE_06C627:
    LDA $16             ; $06C627   |
    INC A               ; $06C629   |
    AND #$0003          ; $06C62A   |
    STA $16             ; $06C62D   |
    LDY $76             ; $06C62F   |
    CPY #$06            ; $06C631   |
    BEQ CODE_06C639     ; $06C633   |
    CLC                 ; $06C635   |
    ADC #$0004          ; $06C636   |

CODE_06C639:
    TAY                 ; $06C639   |
    LDA $C581,y         ; $06C63A   |
    AND #$00FF          ; $06C63D   |
    STA $7A98           ; $06C640   |
    LDA $C579,y         ; $06C643   |
    TAY                 ; $06C646   |
    STY $7402           ; $06C647   |
    CPY #$24            ; $06C64A   |
    BNE CODE_06C657     ; $06C64C   |
    LDA #$0044          ; $06C64E   |
    JSL $0085D2         ; $06C651   |
    BRA CODE_06C6CE     ; $06C655   |

CODE_06C657:
    CPY #$22            ; $06C657   |
    BNE CODE_06C6CE     ; $06C659   |
    LDA $03B6           ; $06C65B   |
    CMP #$006E          ; $06C65E   |
    BMI CODE_06C6A7     ; $06C661   |
    LDA $10             ; $06C663   |
    AND #$0003          ; $06C665   |
    ASL A               ; $06C668   |
    ASL A               ; $06C669   |
    INC A               ; $06C66A   |
    LDY $0DBA           ; $06C66B   |
    BNE CODE_06C674     ; $06C66E   |
    EOR #$FFFF          ; $06C670   |
    INC A               ; $06C673   |

CODE_06C674:
    CLC                 ; $06C674   |
    ADC $0DB8           ; $06C675   |
    STA $0DB8           ; $06C678   |
    CMP #$000C          ; $06C67B   |
    BPL CODE_06C68A     ; $06C67E   |
    SEC                 ; $06C680   |
    SBC #$0018          ; $06C681   |
    EOR #$FFFF          ; $06C684   |
    INC A               ; $06C687   |
    BRA CODE_06C696     ; $06C688   |

CODE_06C68A:
    CMP #$0029          ; $06C68A   |
    BMI CODE_06C6A2     ; $06C68D   |
    LDA #$0050          ; $06C68F   |
    SEC                 ; $06C692   |
    SBC $0DB8           ; $06C693   |

CODE_06C696:
    STA $0DB8           ; $06C696   |
    LDA $0DBA           ; $06C699   |
    EOR #$0001          ; $06C69C   |
    STA $0DBA           ; $06C69F   |

CODE_06C6A2:
    LDA $0DB8           ; $06C6A2   |
    BRA CODE_06C6CB     ; $06C6A5   |

CODE_06C6A7:
    STA $3000           ; $06C6A7   |
    LDA #$0200          ; $06C6AA   |
    STA $300C           ; $06C6AD   |
    LDX #$0B            ; $06C6B0   |
    LDA #$86B6          ; $06C6B2   |
    JSL $7EDE44         ; $06C6B5   | GSU init

    LDA $7A98           ; $06C6B9   |
    STA $300C           ; $06C6BC   |
    LDX #$0B            ; $06C6BF   |
    LDA #$86B6          ; $06C6C1   |
    JSL $7EDE44         ; $06C6C4   | GSU init

    LDA $3000           ; $06C6C8   |

CODE_06C6CB:
    STA $7A98           ; $06C6CB   |

CODE_06C6CE:
    JMP CODE_06C51B     ; $06C6CE   |

    LDY $7223           ; $06C6D1   |
    BMI CODE_06C6E7     ; $06C6D4   |
    STZ $61AE           ; $06C6D6   |
    STZ $61B0           ; $06C6D9   |
    LDA #$0020          ; $06C6DC   |
    STA $61F4           ; $06C6DF   |
    STZ $0C88           ; $06C6E2   |
    DEC $76             ; $06C6E5   |

CODE_06C6E7:
    RTS                 ; $06C6E7   |

DATA_06C6E8:         dw $00F0, $00D0

    LDY #$00            ; $06C6EC   |
    LDA $7220           ; $06C6EE   |
    BMI CODE_06C6F5     ; $06C6F1   |
    INY                 ; $06C6F3   |
    INY                 ; $06C6F4   |

CODE_06C6F5:
    STY $7400           ; $06C6F5   |
    LDY $7AF6           ; $06C6F8   |
    BEQ CODE_06C72D     ; $06C6FB   |
    INC $7AF6           ; $06C6FD   |
    LDA $0DB2           ; $06C700   |
    CMP $7182           ; $06C703   |
    BMI CODE_06C715     ; $06C706   |
    LDA $7860           ; $06C708   |
    AND #$0001          ; $06C70B   |
    BNE CODE_06C715     ; $06C70E   |
    LDY $7862           ; $06C710   |
    BEQ CODE_06C72A     ; $06C713   |

CODE_06C715:
    LDA #$FF40          ; $06C715   |
    STA $7222           ; $06C718   |
    LDA #$0080          ; $06C71B   |
    STA $75E2           ; $06C71E   |
    LDA #$0002          ; $06C721   |
    STA $7542           ; $06C724   |
    STZ $7AF6           ; $06C727   |

CODE_06C72A:
    JMP CODE_06C61F     ; $06C72A   |

CODE_06C72D:
    LDA #$0004          ; $06C72D   |
    LDY $7683           ; $06C730   |
    BEQ CODE_06C741     ; $06C733   |
    LDA $7222           ; $06C735   |
    AND #$FFF0          ; $06C738   |
    STA $7222           ; $06C73B   |
    LDA #$0010          ; $06C73E   |

CODE_06C741:
    STA $7542           ; $06C741   |
    LDY $7D36           ; $06C744   |
    DEY                 ; $06C747   |
    BMI CODE_06C784     ; $06C748   |
    LDA $6F00,y         ; $06C74A   |
    CMP #$0010          ; $06C74D   |
    BNE CODE_06C784     ; $06C750   |
    LDA $7D38,y         ; $06C752   |
    BEQ CODE_06C784     ; $06C755   |
    TYX                 ; $06C757   |
    JSL $03B25B         ; $06C758   |
    LDY #$02            ; $06C75C   |
    STY $7AF6           ; $06C75E   |
    LDA #$0400          ; $06C761   |
    STA $75E2           ; $06C764   |
    LDA #$0040          ; $06C767   |
    STA $7542           ; $06C76A   |
    STZ $75E0           ; $06C76D   |
    LDA $6090           ; $06C770   |
    CLC                 ; $06C773   |
    ADC #$0030          ; $06C774   |
    CMP #$07E0          ; $06C777   |
    BMI CODE_06C77F     ; $06C77A   |
    LDA #$07E0          ; $06C77C   |

CODE_06C77F:
    STA $0DB2           ; $06C77F   |
    BRA CODE_06C72A     ; $06C782   |

CODE_06C784:
    LDY #$00            ; $06C784   |
    LDA $7220           ; $06C786   |
    BPL CODE_06C78D     ; $06C789   |
    INY                 ; $06C78B   |
    INY                 ; $06C78C   |

CODE_06C78D:
    LDA $C6E8,y         ; $06C78D   |
    LDY #$00            ; $06C790   |
    CMP $7680           ; $06C792   |
    BMI CODE_06C799     ; $06C795   |
    INY                 ; $06C797   |
    INY                 ; $06C798   |

CODE_06C799:
    LDA $C4B9,y         ; $06C799   |
    STA $75E0           ; $06C79C   |
    LDY $7862           ; $06C79F   |
    BEQ CODE_06C7AB     ; $06C7A2   |
    LDY $75E3           ; $06C7A4   |
    BMI CODE_06C80F     ; $06C7A7   |
    BRA CODE_06C7CF     ; $06C7A9   |

CODE_06C7AB:
    LDA $7860           ; $06C7AB   |
    AND #$0003          ; $06C7AE   |
    BEQ CODE_06C7ED     ; $06C7B1   |
    STZ $7860           ; $06C7B3   |
    AND #$0002          ; $06C7B6   |
    DEC A               ; $06C7B9   |
    EOR $75E2           ; $06C7BA   |
    BMI CODE_06C7CF     ; $06C7BD   |
    LDA $75E2           ; $06C7BF   |
    CMP #$8000          ; $06C7C2   |
    ROR A               ; $06C7C5   |
    CMP #$8000          ; $06C7C6   |
    ROR A               ; $06C7C9   |
    STA $7222           ; $06C7CA   |
    BRA CODE_06C80F     ; $06C7CD   |

CODE_06C7CF:
    LDA $7182           ; $06C7CF   |
    SEC                 ; $06C7D2   |
    SBC $72C2           ; $06C7D3   |
    STA $7182           ; $06C7D6   |
    LDA $75E2           ; $06C7D9   |
    EOR #$FFFF          ; $06C7DC   |
    INC A               ; $06C7DF   |
    CMP #$8000          ; $06C7E0   |
    ROR A               ; $06C7E3   |
    CMP #$8000          ; $06C7E4   |
    ROR A               ; $06C7E7   |
    STA $7222           ; $06C7E8   |
    BRA CODE_06C805     ; $06C7EB   |

CODE_06C7ED:
    LDA $75E2           ; $06C7ED   |
    CMP $7222           ; $06C7F0   |
    BNE CODE_06C80F     ; $06C7F3   |
    LDA $0DB2           ; $06C7F5   |
    SEC                 ; $06C7F8   |
    SBC $7182           ; $06C7F9   |
    EOR $7222           ; $06C7FC   |
    BPL CODE_06C80F     ; $06C7FF   |
    JSL $06BEDA         ; $06C801   |

CODE_06C805:
    LDA $75E2           ; $06C805   |
    EOR #$FFFF          ; $06C808   |
    INC A               ; $06C80B   |
    STA $75E2           ; $06C80C   |

CODE_06C80F:
    JMP CODE_06C61F     ; $06C80F   |

    LDA #$0002          ; $06C812   |
    STA $7400           ; $06C815   |
    LDA $7C16           ; $06C818   |
    PHP                 ; $06C81B   |
    BPL CODE_06C822     ; $06C81C   |
    EOR #$FFFF          ; $06C81E   |
    INC A               ; $06C821   |

CODE_06C822:
    LSR A               ; $06C822   |
    CMP #$0018          ; $06C823   |
    BMI CODE_06C82B     ; $06C826   |
    LDA #$0018          ; $06C828   |

CODE_06C82B:
    CLC                 ; $06C82B   |
    ADC #$0018          ; $06C82C   |
    STA $7540           ; $06C82F   |
    ASL A               ; $06C832   |
    ASL A               ; $06C833   |
    ASL A               ; $06C834   |
    ASL A               ; $06C835   |
    PLP                 ; $06C836   |
    BMI CODE_06C840     ; $06C837   |
    EOR #$FFFF          ; $06C839   |
    INC A               ; $06C83C   |
    STZ $7400           ; $06C83D   |

CODE_06C840:
    STA $75E0           ; $06C840   |
    LDA $7C18           ; $06C843   |
    PHP                 ; $06C846   |
    BPL CODE_06C84D     ; $06C847   |
    EOR #$FFFF          ; $06C849   |
    INC A               ; $06C84C   |

CODE_06C84D:
    LSR A               ; $06C84D   |
    CMP #$0018          ; $06C84E   |
    BMI CODE_06C856     ; $06C851   |
    LDA #$0018          ; $06C853   |

CODE_06C856:
    CLC                 ; $06C856   |
    ADC #$0018          ; $06C857   |
    STA $7542           ; $06C85A   |
    ASL A               ; $06C85D   |
    ASL A               ; $06C85E   |
    ASL A               ; $06C85F   |
    ASL A               ; $06C860   |
    PLP                 ; $06C861   |
    BMI CODE_06C868     ; $06C862   |
    EOR #$FFFF          ; $06C864   |
    INC A               ; $06C867   |

CODE_06C868:
    STA $75E2           ; $06C868   |
    JMP CODE_06C61F     ; $06C86B   |

DATA_06C86E:         dw $FFC0, $FFF0, $0000, $0020

CODE_06C876:
    LDX $12             ; $06C876   |
    LDA $0E35           ; $06C878   |
    BEQ CODE_06C886     ; $06C87B   |
    LDA $03A1           ; $06C87D   |
    ORA $03A3           ; $06C880   |
    BEQ CODE_06C886     ; $06C883   |

CODE_06C885:
    RTS                 ; $06C885   |

CODE_06C886:
    LDA $0E33           ; $06C886   |
    BNE CODE_06C885     ; $06C889   |
    INC $0E33           ; $06C88B   |
    STZ $61CC           ; $06C88E   |
    STZ $0E2F           ; $06C891   |
    STZ $0E2D           ; $06C894   |
    LDA #$0004          ; $06C897   |
    STA $0E31           ; $06C89A   |
    LDA $6094           ; $06C89D   |
    STA $0A             ; $06C8A0   |
    LDA $609C           ; $06C8A2   |
    STA $0C             ; $06C8A5   |
    STZ $0E             ; $06C8A7   |
    LDA $0146           ; $06C8A9   |
    CMP #$0009          ; $06C8AC   |
    BNE CODE_06C8BF     ; $06C8AF   |
    LDA $609A           ; $06C8B1   |
    STA $0A             ; $06C8B4   |
    LDA $60A2           ; $06C8B6   |
    STA $0C             ; $06C8B9   |
    LDY #$06            ; $06C8BB   |
    STY $0E             ; $06C8BD   |

CODE_06C8BF:
    LDY #$08            ; $06C8BF   |
    LDA #$0091          ; $06C8C1   |
    JSL $03A366         ; $06C8C4   |
    LDA $0A             ; $06C8C8   |
    CLC                 ; $06C8CA   |
    ADC #$0080          ; $06C8CB   |
    STA $70E2,y         ; $06C8CE   |
    LDA $0C             ; $06C8D1   |
    SEC                 ; $06C8D3   |
    SBC #$0010          ; $06C8D4   |
    STA $7182,y         ; $06C8D7   |
    LDA $74A1,y         ; $06C8DA   |
    ORA $0E             ; $06C8DD   |
    STA $74A1,y         ; $06C8DF   |
    LDY #$00            ; $06C8E2   |
    LDX #$0C            ; $06C8E4   |

CODE_06C8E6:
    STZ $0E37,x         ; $06C8E6   |
    STZ $0E39,x         ; $06C8E9   |
    STZ $0E49,x         ; $06C8EC   |
    STZ $0E4B,x         ; $06C8EF   |
    LDA $C86E,y         ; $06C8F2   |
    STA $0E38,x         ; $06C8F5   |
    STZ $0E9B,x         ; $06C8F8   |
    STZ $0EC9,x         ; $06C8FB   |
    STZ $0E69,x         ; $06C8FE   |
    STZ $0E6B,x         ; $06C901   |
    STZ $0E89,x         ; $06C904   |
    STZ $0E8B,x         ; $06C907   |
    STZ $0E79,x         ; $06C90A   |
    STZ $0E7B,x         ; $06C90D   |
    STZ $0EAB,x         ; $06C910   |
    STZ $0EB9,x         ; $06C913   |
    STZ $0EBB,x         ; $06C916   |
    STZ $0EA9,x         ; $06C919   |
    STZ $0E59,x         ; $06C91C   |
    STZ $0E5B,x         ; $06C91F   |
    STZ $0E99,x         ; $06C922   |
    INY                 ; $06C925   |
    INY                 ; $06C926   |
    DEX                 ; $06C927   |
    DEX                 ; $06C928   |
    DEX                 ; $06C929   |
    DEX                 ; $06C92A   |
    BPL CODE_06C8E6     ; $06C92B   |
    LDX $12             ; $06C92D   |
    RTS                 ; $06C92F   |

; baby mario boss key cinematic tables
DATA_06C930:         db $00, $01, $00, $02
DATA_06C934:         db $03, $03, $03, $03
DATA_06C938:         db $03, $03, $03, $03
DATA_06C93C:         db $03, $03, $03, $04
DATA_06C940:         db $03, $05, $06, $07
DATA_06C944:         db $07, $08, $09, $0A
DATA_06C948:         db $0B, $0C, $0D, $0E
DATA_06C94C:         db $0F, $10, $10, $11
DATA_06C950:         db $06, $12, $12, $06
DATA_06C954:         db $03, $13, $13, $03
DATA_06C958:         db $14, $14, $15, $10
DATA_06C95C:         db $16, $17, $17, $16
DATA_06C960:         db $0F, $18, $19, $08
DATA_06C964:         db $10

DATA_06C965:         dw $5C00, $5C40, $5C00, $5CC0
DATA_06C96D:         dw $5C00, $5D00, $5C00, $5C80
DATA_06C975:         dw $58C0, $5C80, $5900, $5C80
DATA_06C97D:         dw $5800, $5C80, $5000, $5040
DATA_06C985:         dw $5480, $54C0, $5500, $5540
DATA_06C98D:         dw $5580, $55C0, $4800, $4C00
DATA_06C995:         dw $4840, $4C40, $4880, $4C80
DATA_06C99D:         dw $5900, $5D80, $5C00, $5D80
DATA_06C9A5:         dw $58C0, $5D80, $5080, $50C0
DATA_06C9AD:         dw $4900, $5C80, $4D00, $5C80
DATA_06C9B5:         dw $5C00, $5980, $5DC0, $59C0
DATA_06C9BD:         dw $5800, $5D80, $4900, $5D80
DATA_06C9C5:         dw $4980, $4D80, $48C0, $4CC0

DATA_06C9CD:         db $03, $03, $03, $03
DATA_06C9D1:         db $03, $03, $03, $0D
DATA_06C9D5:         db $0C, $0B

; baby mario boss key cinematic sub
    PHB                 ; $06C9D7   |
    PHK                 ; $06C9D8   |
    PLB                 ; $06C9D9   |
    JSR CODE_06C9E1     ; $06C9DA   |
    PLB                 ; $06C9DD   |
    LDX $12             ; $06C9DE   |
    RTL                 ; $06C9E0   |

; baby mario boss key cinematic sub

CODE_06C9E1:
    LDA $7402           ; $06C9E1   |
    CMP $78             ; $06C9E4   |
    BEQ CODE_06CA22     ; $06C9E6   |
    STA $78             ; $06C9E8   |
    TAY                 ; $06C9EA   |
    LDA $7040           ; $06C9EB   |
    AND #$F800          ; $06C9EE   |
    CMP #$3000          ; $06C9F1   |
    BNE CODE_06C9FB     ; $06C9F4   |
    LDA $C9B2,y         ; $06C9F6   |
    BRA CODE_06C9FE     ; $06C9F9   |

CODE_06C9FB:
    LDA $C930,y         ; $06C9FB   |

CODE_06C9FE:
    AND #$00FF          ; $06C9FE   |
    ASL A               ; $06CA01   |
    ASL A               ; $06CA02   |
    TAY                 ; $06CA03   |
    PHX                 ; $06CA04   |
    LDX #$00            ; $06CA05   |

CODE_06CA07:
    LDA $C965,y         ; $06CA07   |
    STA $0B87,x         ; $06CA0A   |
    CLC                 ; $06CA0D   |
    ADC #$0200          ; $06CA0E   |
    STA $0B89,x         ; $06CA11   |
    INY                 ; $06CA14   |
    INY                 ; $06CA15   |
    INX                 ; $06CA16   |
    INX                 ; $06CA17   |
    INX                 ; $06CA18   |
    INX                 ; $06CA19   |
    CPX #$08            ; $06CA1A   |
    BMI CODE_06CA07     ; $06CA1C   |
    INC $0B85           ; $06CA1E   |
    PLX                 ; $06CA21   |

CODE_06CA22:
    RTS                 ; $06CA22   |

; baby mario routine table
DATA_06CA23:         dw $CDAB
DATA_06CA25:         dw $CDEF
DATA_06CA27:         dw $CE2F
DATA_06CA29:         dw $CE2E
DATA_06CA2B:         dw $CEFB

; baby mario sub

CODE_06CA2D:
    LDA $03A1           ; $06CA2D   |
    ORA $03A3           ; $06CA30   |
    BNE CODE_06CA38     ; $06CA33   |
    JSR CODE_06C876     ; $06CA35   |

CODE_06CA38:
    JSR CODE_06CB27     ; $06CA38   |
    LDA $6F00           ; $06CA3B   |
    CMP #$000A          ; $06CA3E   |
    BNE CODE_06CA4A     ; $06CA41   |
    JSR CODE_06C9E1     ; $06CA43   |
    JSL $03AF23         ; $06CA46   |

CODE_06CA4A:
    JSR CODE_06CCF8     ; $06CA4A   |
    LDA $61B0           ; $06CA4D   |
    ORA $0B55           ; $06CA50   |
    ORA $0398           ; $06CA53   |
    BEQ CODE_06CA60     ; $06CA56   |
    JSL $03B716         ; $06CA58   |
    JSL $03B69D         ; $06CA5C   |

CODE_06CA60:
    LDA $7680           ; $06CA60   |
    CLC                 ; $06CA63   |
    ADC #$0008          ; $06CA64   |
    SEC                 ; $06CA67   |
    SBC $611C           ; $06CA68   |
    CLC                 ; $06CA6B   |
    ADC $0039           ; $06CA6C   |
    STA $7C16           ; $06CA6F   |
    LDA $7682           ; $06CA72   |
    CLC                 ; $06CA75   |
    ADC #$0008          ; $06CA76   |
    SEC                 ; $06CA79   |
    SBC $611E           ; $06CA7A   |
    CLC                 ; $06CA7D   |
    ADC $003B           ; $06CA7E   |
    STA $7C18           ; $06CA81   |
    JSR CODE_06CAA4     ; $06CA84   |
    LDA $76             ; $06CA87   |
    ASL A               ; $06CA89   |
    TAX                 ; $06CA8A   |
    JSR ($CA23,x)       ; $06CA8B   |
    JSR CODE_06CB05     ; $06CA8E   |
    LDY $76             ; $06CA91   |
    CPY #$03            ; $06CA93   |
    BEQ CODE_06CAA1     ; $06CA95   |
    CPY #$02            ; $06CA97   |
    BEQ CODE_06CAA1     ; $06CA99   |
    JSR CODE_06CC9E     ; $06CA9B   |
    JSR CODE_06CB15     ; $06CA9E   |

CODE_06CAA1:
    LDX $12             ; $06CAA1   |
    RTL                 ; $06CAA3   |

CODE_06CAA4:
    LDA $6F00           ; $06CAA4   |
    CMP #$0008          ; $06CAA7   |
    BNE CODE_06CB04     ; $06CAAA   |
    LDY $76             ; $06CAAC   |
    CPY #$02            ; $06CAAE   |
    BEQ CODE_06CB04     ; $06CAB0   |
    LDA #$0001          ; $06CAB2   |
    STA $61B0           ; $06CAB5   |
    STA $0D9A           ; $06CAB8   |
    LDA #$8000          ; $06CABB   |
    TSB $61AE           ; $06CABE   |
    LDY $6150           ; $06CAC1   |
    CPY #$04            ; $06CAC4   |
    BNE CODE_06CAD2     ; $06CAC6   |
    LDA $6154           ; $06CAC8   |
    CMP #$FFF0          ; $06CACB   |
    BMI CODE_06CB04     ; $06CACE   |
    BRA CODE_06CADE     ; $06CAD0   |

CODE_06CAD2:
    LDA $6152           ; $06CAD2   |
    CLC                 ; $06CAD5   |
    ADC #$0010          ; $06CAD6   |
    CMP #$0020          ; $06CAD9   |
    BCS CODE_06CB04     ; $06CADC   |

CODE_06CADE:
    STZ $6168           ; $06CADE   |

CODE_06CAE1:
    LDA #$0010          ; $06CAE1   |
    STA $6F00           ; $06CAE4   |
    LDY #$00            ; $06CAE7   |
    STY $7862           ; $06CAE9   |
    LDY #$07            ; $06CAEC   |
    STY $0DB4           ; $06CAEE   |
    LDY #$02            ; $06CAF1   |
    STY $76             ; $06CAF3   |
    STZ $0D9C           ; $06CAF5   |
    INC $0D9A           ; $06CAF8   |
    LDA #$0001          ; $06CAFB   |
    STA $61AE           ; $06CAFE   |
    INC $61B0           ; $06CB01   |

CODE_06CB04:
    RTS                 ; $06CB04   |

; baby mario sub

CODE_06CB05:
    LDA $7AF8           ; $06CB05   |
    BNE CODE_06CB14     ; $06CB08   |
    LDY $7D36           ; $06CB0A   |
    BPL CODE_06CB14     ; $06CB0D   |
    LDY $0D9C           ; $06CB0F   |
    BEQ CODE_06CAE1     ; $06CB12   |

CODE_06CB14:
    RTS                 ; $06CB14   |

; baby mario sub

CODE_06CB15:
    LDY $0B59           ; $06CB15   |
    BEQ CODE_06CB26     ; $06CB18   |
    LDA $7040           ; $06CB1A   |
    AND #$E000          ; $06CB1D   |
    BEQ CODE_06CB26     ; $06CB20   |
    LDY #$04            ; $06CB22   |
    STY $76             ; $06CB24   |

CODE_06CB26:
    RTS                 ; $06CB26   |

; baby mario sub

CODE_06CB27:
    LDA $6F00           ; $06CB27   |
    CMP #$000A          ; $06CB2A   |
    BEQ CODE_06CB14     ; $06CB2D   |
    LDA $0DB4           ; $06CB2F   |
    CMP #$0007          ; $06CB32   |
    BPL CODE_06CB75     ; $06CB35   |
    STA $3006           ; $06CB37   |
    LDA $7362           ; $06CB3A   |
    STA $3008           ; $06CB3D   |
    TXA                 ; $06CB40   |
    STA $3014           ; $06CB41   |
    LDA #$0006          ; $06CB44   |
    STA $3000           ; $06CB47   |
    LDA #$CC0A          ; $06CB4A   |
    STA $301C           ; $06CB4D   |
    LDA $7680           ; $06CB50   |
    STA $3002           ; $06CB53   |
    LDA $7682           ; $06CB56   |
    STA $3004           ; $06CB59   |
    LDA $7400           ; $06CB5C   |
    STA $3010           ; $06CB5F   |
    LDA #$0004          ; $06CB62   |
    STA $3018           ; $06CB65   |
    LDX #$08            ; $06CB68   |
    LDA #$A16C          ; $06CB6A   |
    JSL $7EDE44         ; $06CB6D   |
    LDX $12             ; $06CB71   |
    BRA CODE_06CB8B     ; $06CB73   |

CODE_06CB75:
    REP #$10            ; $06CB75   |
    LDY $7362           ; $06CB77   |
    LDA #$8000          ; $06CB7A   |
    STA $6000,y         ; $06CB7D   |
    STA $6008,y         ; $06CB80   |
    STA $6010,y         ; $06CB83   |
    STA $6018,y         ; $06CB86   |
    SEP #$10            ; $06CB89   |

CODE_06CB8B:
    LDY $7400           ; $06CB8B   |
    LDA $7680           ; $06CB8E   |
    CLC                 ; $06CB91   |
    ADC #$FFF8          ; $06CB92   |
    STA $00             ; $06CB95   |
    LDA $7682           ; $06CB97   |
    SEC                 ; $06CB9A   |
    SBC #$0008          ; $06CB9B   |
    STA $02             ; $06CB9E   |
    LDA $7400           ; $06CBA0   |
    AND #$FF00          ; $06CBA3   |
    LSR A               ; $06CBA6   |
    LSR A               ; $06CBA7   |
    LSR A               ; $06CBA8   |
    ORA $7042           ; $06CBA9   |
    XBA                 ; $06CBAC   |
    STA $06             ; $06CBAD   |
    REP #$10            ; $06CBAF   |
    LDY $7362           ; $06CBB1   |
    LDA $00             ; $06CBB4   |
    STA $6020,y         ; $06CBB6   |
    STA $6030,y         ; $06CBB9   |
    CLC                 ; $06CBBC   |
    ADC #$0010          ; $06CBBD   |
    STA $6028,y         ; $06CBC0   |
    STA $6038,y         ; $06CBC3   |
    LDA $02             ; $06CBC6   |
    STA $6022,y         ; $06CBC8   |
    STA $602A,y         ; $06CBCB   |
    CLC                 ; $06CBCE   |
    ADC #$0010          ; $06CBCF   |
    STA $6032,y         ; $06CBD2   |
    STA $603A,y         ; $06CBD5   |
    LDA $06             ; $06CBD8   |
    ORA #$0062          ; $06CBDA   |
    STA $6024,y         ; $06CBDD   |
    LDA $06             ; $06CBE0   |
    ORA #$0064          ; $06CBE2   |
    STA $602C,y         ; $06CBE5   |
    LDA $06             ; $06CBE8   |
    ORA #$0082          ; $06CBEA   |
    STA $6034,y         ; $06CBED   |
    LDA $06             ; $06CBF0   |
    ORA #$0084          ; $06CBF2   |
    STA $603C,y         ; $06CBF5   |
    LDA #$0202          ; $06CBF8   |
    STA $6026,y         ; $06CBFB   |
    STA $602E,y         ; $06CBFE   |
    STA $6036,y         ; $06CC01   |
    STA $603E,y         ; $06CC04   |
    SEP #$10            ; $06CC07   |
    RTS                 ; $06CC09   |

; baby mario gsu OAM stuff
DATA_06CC0A:         db $00, $03, $A2, $0A, $00
DATA_06CC0F:         db $08, $03, $A3, $0A, $00
DATA_06CC14:         db $00, $0B, $B2, $0A, $00
DATA_06CC19:         db $08, $0B, $B3, $0A, $00
DATA_06CC1E:         db $FA, $FA, $9C, $0A, $02
DATA_06CC23:         db $FA, $06, $7E, $CA, $02
DATA_06CC28:         db $05, $06, $7E, $8A, $02
DATA_06CC2D:         db $05, $FA, $7E, $0A, $02
DATA_06CC32:         db $FA, $F5, $9C, $0A, $02
DATA_06CC37:         db $FB, $05, $7E, $CA, $02
DATA_06CC3C:         db $05, $05, $7E, $8A, $02
DATA_06CC41:         db $06, $F5, $7E, $0A, $02
DATA_06CC46:         db $F8, $F8, $9C, $0A, $02
DATA_06CC4B:         db $F8, $04, $7E, $CA, $02
DATA_06CC50:         db $08, $04, $7E, $8A, $02
DATA_06CC55:         db $08, $F8, $7E, $0A, $02
DATA_06CC5A:         db $F9, $F7, $9C, $0A, $02
DATA_06CC5F:         db $F9, $05, $7E, $CA, $02
DATA_06CC64:         db $07, $05, $7E, $8A, $02
DATA_06CC69:         db $07, $F7, $7E, $0A, $02
DATA_06CC6E:         db $FA, $F6, $9C, $0A, $02
DATA_06CC73:         db $FA, $06, $7E, $CA, $02
DATA_06CC78:         db $06, $06, $7E, $8A, $02
DATA_06CC7D:         db $06, $F6, $7E, $0A, $02
DATA_06CC82:         db $F8, $F8, $9C, $0A, $02
DATA_06CC87:         db $F8, $04, $7E, $CA, $02
DATA_06CC8C:         db $08, $04, $7E, $8A, $02
DATA_06CC91:         db $08, $F8, $7E, $0A, $02

DATA_06CC96:         dw $FE80, $0180
DATA_06CC9A:         dw $FF80, $0080

; baby mario sub

CODE_06CC9E:
    LDA $70E2           ; $06CC9E   |
    SEC                 ; $06CCA1   |
    SBC $72C0           ; $06CCA2   |
    STA $70E2           ; $06CCA5   |
    LDA $7182           ; $06CCA8   |
    SEC                 ; $06CCAB   |
    SBC $72C2           ; $06CCAC   |
    STA $7182           ; $06CCAF   |
    LDA $7222           ; $06CCB2   |
    EOR #$FFFF          ; $06CCB5   |
    SEC                 ; $06CCB8   |
    ADC $0DAA           ; $06CCB9   |
    BPL CODE_06CCC1     ; $06CCBC   |
    LDA #$7FFF          ; $06CCBE   |

CODE_06CCC1:
    CMP #$3800          ; $06CCC1   |
    BPL CODE_06CCD3     ; $06CCC4   |
    LDA $7222           ; $06CCC6   |
    EOR #$FFFF          ; $06CCC9   |
    INC A               ; $06CCCC   |
    STA $7222           ; $06CCCD   |
    LDA #$3800          ; $06CCD0   |

CODE_06CCD3:
    STA $0DAA           ; $06CCD3   |
    LDA $7220           ; $06CCD6   |
    BEQ CODE_06CCE5     ; $06CCD9   |
    EOR #$FFFF          ; $06CCDB   |
    SEC                 ; $06CCDE   |
    ADC $0DAC           ; $06CCDF   |
    STA $0DAC           ; $06CCE2   |

CODE_06CCE5:
    SEP #$20            ; $06CCE5   |
    LDA $0DAB           ; $06CCE7   |
    STA $0E             ; $06CCEA   |
    LDA $0DAD           ; $06CCEC   |
    STA $00             ; $06CCEF   |
    JSL $0FB8F0         ; $06CCF1   |
    REP #$20            ; $06CCF5   |
    RTS                 ; $06CCF7   |

; baby mario sub

CODE_06CCF8:
    LDA #$0055          ; $06CCF8   |
    STA $301A           ; $06CCFB   |
    LDA #$60E1          ; $06CCFE   |
    STA $3018           ; $06CD01   |
    LDY $76             ; $06CD04   |
    CPY #$03            ; $06CD06   |
    BNE CODE_06CD0F     ; $06CD08   |
    STZ $300A           ; $06CD0A   |
    BRA CODE_06CD22     ; $06CD0D   |

CODE_06CD0F:
    LDY $0D05           ; $06CD0F   |
    TYA                 ; $06CD12   |
    STA $00             ; $06CD13   |
    LDY $0DAD           ; $06CD15   |
    TYA                 ; $06CD18   |
    CLC                 ; $06CD19   |
    ADC $00             ; $06CD1A   |
    AND #$00FF          ; $06CD1C   |
    STA $300A           ; $06CD1F   |

CODE_06CD22:
    LDA #$0100          ; $06CD22   |
    STA $300C           ; $06CD25   |
    STZ $3006           ; $06CD28   |
    LDA #$0020          ; $06CD2B   |
    STA $3004           ; $06CD2E   |
    LDX #$08            ; $06CD31   |
    LDA #$8205          ; $06CD33   |
    JSL $7EDE44         ; $06CD36   |
    LDA #$4620          ; $06CD3A   |
    STA $00             ; $06CD3D   |
    LDA #$6000          ; $06CD3F   |
    STA $02             ; $06CD42   |
    LDA #$0004          ; $06CD44   |
    STA $04             ; $06CD47   |
    PHB                 ; $06CD49   |
    SEP #$20            ; $06CD4A   |
    LDA #$7E            ; $06CD4C   |
    PHA                 ; $06CD4E   |
    PLB                 ; $06CD4F   |
    REP #$30            ; $06CD50   |
    LDX $4800           ; $06CD52   |

CODE_06CD55:
    LDA $00             ; $06CD55   |
    STA $0000,x         ; $06CD57   |
    LDA #$0180          ; $06CD5A   |
    STA $0002,x         ; $06CD5D   |
    LDA #$0018          ; $06CD60   |
    STA $0004,x         ; $06CD63   |
    LDA $02             ; $06CD66   |
    STA $0005,x         ; $06CD68   |
    LDA #$0070          ; $06CD6B   |
    STA $0007,x         ; $06CD6E   |
    LDA #$0080          ; $06CD71   |
    STA $0008,x         ; $06CD74   |
    LDA $00             ; $06CD77   |
    CLC                 ; $06CD79   |
    ADC #$0100          ; $06CD7A   |
    STA $00             ; $06CD7D   |
    LDA $02             ; $06CD7F   |
    CLC                 ; $06CD81   |
    ADC #$0200          ; $06CD82   |
    STA $02             ; $06CD85   |
    TXA                 ; $06CD87   |
    CLC                 ; $06CD88   |
    ADC #$000C          ; $06CD89   |
    STA $000A,x         ; $06CD8C   |
    TAX                 ; $06CD8F   |
    DEC $04             ; $06CD90   |
    BNE CODE_06CD55     ; $06CD92   |
    STX $4800           ; $06CD94   |
    SEP #$10            ; $06CD97   |
    PLB                 ; $06CD99   |
    LDX $12             ; $06CD9A   |
    RTS                 ; $06CD9C   |

DATA_06CD9D:         db $00, $01, $02, $04
DATA_06CDA1:         db $03, $04, $02, $04
DATA_06CDA5:         db $03, $04

DATA_06CDA7:         dw $FFC0, $0040

; baby mario sub
    LDA $7A96           ; $06CDAB   |
    BNE CODE_06CDE6     ; $06CDAE   |
    LDY $7A98           ; $06CDB0   |
    BNE CODE_06CDE6     ; $06CDB3   |
    INC $16             ; $06CDB5   |
    LDY $16             ; $06CDB7   |
    CPY #$09            ; $06CDB9   |
    BMI CODE_06CDDA     ; $06CDBB   |
    LDY $7400           ; $06CDBD   |
    LDA $CDA7,y         ; $06CDC0   |
    STA $75E0           ; $06CDC3   |
    LDA #$0004          ; $06CDC6   |
    STA $7540           ; $06CDC9   |
    LDA #$0004          ; $06CDCC   |
    STA $7542           ; $06CDCF   |
    STZ $75E2           ; $06CDD2   |
    STZ $18             ; $06CDD5   |
    INC $76             ; $06CDD7   |
    RTS                 ; $06CDD9   |

CODE_06CDDA:
    LDA $CD9C,y         ; $06CDDA   |
    TAY                 ; $06CDDD   |
    STY $0DB4           ; $06CDDE   |
    LDY #$02            ; $06CDE1   |
    STY $7A98           ; $06CDE3   |

CODE_06CDE6:
    RTS                 ; $06CDE6   |

DATA_06CDE7:         db $04, $05, $04, $06

DATA_06CDEB:         dw $0080, $FF80

; baby mario sub

CODE_06CDEF:
    LDY $7A98           ; $06CDEF   |
    BNE CODE_06CE10     ; $06CDF2   |
    LDA $16             ; $06CDF4   |
    INC A               ; $06CDF6   |
    AND #$0003          ; $06CDF7   |
    TAY                 ; $06CDFA   |
    STY $16             ; $06CDFB   |
    AND #$0001          ; $06CDFD   |
    ASL A               ; $06CE00   |
    ASL A               ; $06CE01   |
    CLC                 ; $06CE02   |
    ADC #$0004          ; $06CE03   |
    STA $7A98           ; $06CE06   |
    LDA $CDE7,y         ; $06CE09   |
    TAY                 ; $06CE0C   |
    STY $0DB4           ; $06CE0D   |

CODE_06CE10:
    LDY $7A96           ; $06CE10   |
    BNE CODE_06CE2E     ; $06CE13   |
    LDY #$60            ; $06CE15   |
    STY $7A96           ; $06CE17   |
    LDA #$0008          ; $06CE1A   |
    STA $7542           ; $06CE1D   |
    LDA $18             ; $06CE20   |
    EOR #$0002          ; $06CE22   |
    STA $18             ; $06CE25   |
    TAY                 ; $06CE27   |
    LDA $CDEB,y         ; $06CE28   |
    STA $75E2           ; $06CE2B   |

CODE_06CE2E:
    RTS                 ; $06CE2E   |

; baby mario sub
    LDY $0D9C           ; $06CE2F   |
    BNE CODE_06CE9E     ; $06CE32   |
    LDA $7C16           ; $06CE34   |
    STA $3000           ; $06CE37   |
    LDA #$F800          ; $06CE3A   |
    STA $300C           ; $06CE3D   |
    LDX #$0B            ; $06CE40   |
    LDA #$86B6          ; $06CE42   |
    JSL $7EDE44         ; $06CE45   |
    LDA $3000           ; $06CE49   |
    STA $7220           ; $06CE4C   |
    STZ $3000           ; $06CE4F   |
    LDA $7C18           ; $06CE52   |
    BMI CODE_06CE69     ; $06CE55   |
    STA $3000           ; $06CE57   |
    LDA #$F800          ; $06CE5A   |
    STA $300C           ; $06CE5D   |
    LDX #$0B            ; $06CE60   |
    LDA #$86B6          ; $06CE62   |
    JSL $7EDE44         ; $06CE65   |

CODE_06CE69:
    LDA $3000           ; $06CE69   |
    CLC                 ; $06CE6C   |
    ADC #$FC00          ; $06CE6D   |
    STA $7222           ; $06CE70   |
    STZ $7540           ; $06CE73   |
    LDA #$0040          ; $06CE76   |
    STA $7542           ; $06CE79   |
    LDA #$0400          ; $06CE7C   |
    STA $75E2           ; $06CE7F   |
    STZ $7860           ; $06CE82   |
    INC $0D9C           ; $06CE85   |
    LDY $0DB4           ; $06CE88   |
    CPY #$07            ; $06CE8B   |
    BPL CODE_06CE93     ; $06CE8D   |
    JSL $06BFA4         ; $06CE8F   |

CODE_06CE93:
    LDA $0DAC           ; $06CE93   |
    SEC                 ; $06CE96   |
    SBC $7220           ; $06CE97   |
    STA $0DAC           ; $06CE9A   |
    RTS                 ; $06CE9D   |

CODE_06CE9E:
    LDY $7223           ; $06CE9E   |
    BMI CODE_06CE93     ; $06CEA1   |
    LDA $7C18           ; $06CEA3   |
    CMP #$0008          ; $06CEA6   |
    BCS CODE_06CE93     ; $06CEA9   |
    LDA #$0001          ; $06CEAB   |
    STA $7902           ; $06CEAE   |
    LDA #$0043          ; $06CEB1   |
    JSL $0085D2         ; $06CEB4   |
    LDA #$000A          ; $06CEB8   |
    STA $6F00           ; $06CEBB   |
    STZ $7A36           ; $06CEBE   |
    STZ $7A38           ; $06CEC1   |
    STZ $16             ; $06CEC4   |
    STZ $76             ; $06CEC6   |
    STZ $18             ; $06CEC8   |
    LDY #$00            ; $06CECA   |
    STY $7862           ; $06CECC   |
    LDA #$000D          ; $06CECF   |
    STA $7402           ; $06CED2   |
    STZ $79D8           ; $06CED5   |
    LDA #$1801          ; $06CED8   |
    STA $7040           ; $06CEDB   |
    LDA $61B2           ; $06CEDE   |
    AND #$0FFF          ; $06CEE1   |
    ORA #$8000          ; $06CEE4   |
    STA $61B2           ; $06CEE7   |
    STZ $0D9C           ; $06CEEA   |
    STZ $61AE           ; $06CEED   |
    STZ $61B0           ; $06CEF0   |
    LDX $12             ; $06CEF3   |
    PLA                 ; $06CEF5   |
    RTL                 ; $06CEF6   |

DATA_06CEF7:         dw $0200, $FE00

; baby mario sub
    LDY $0D05           ; $06CEFB   |
    TYA                 ; $06CEFE   |
    STA $00             ; $06CEFF   |
    LDY $0DAD           ; $06CF01   |
    TYA                 ; $06CF04   |
    CLC                 ; $06CF05   |
    ADC $00             ; $06CF06   |
    TAY                 ; $06CF08   |
    PHP                 ; $06CF09   |
    LDY #$00            ; $06CF0A   |
    PLP                 ; $06CF0C   |
    BPL CODE_06CF11     ; $06CF0D   |
    INY                 ; $06CF0F   |
    INY                 ; $06CF10   |

CODE_06CF11:
    LDA $CEF7,y         ; $06CF11   |
    STA $7220           ; $06CF14   |
    JMP CODE_06CDEF     ; $06CF17   |

.riding_baby_mario
    LDY #$00            ; $06CF1A   |
    STY $7862           ; $06CF1C   |
    LDA $0B59           ; $06CF1F   |
    BEQ CODE_06CF34     ; $06CF22   |
    LDY #$FF            ; $06CF24   |
    LDA $60BE           ; $06CF26   |
    CMP #$0166          ; $06CF29   |
    BEQ CODE_06CF30     ; $06CF2C   |
    LDY #$04            ; $06CF2E   |

CODE_06CF30:
    STY $74A2           ; $06CF30   |
    RTL                 ; $06CF33   |

CODE_06CF34:
    LDA $0B57           ; $06CF34   |
    BEQ CODE_06CF42     ; $06CF37   |
    LDA $60DE           ; $06CF39   |
    BEQ CODE_06CF42     ; $06CF3C   |
    JSL $03BD40         ; $06CF3E   |

CODE_06CF42:
    TXA                 ; $06CF42   |
    STA $7E48           ; $06CF43   |
    LDA $61B0           ; $06CF46   |
    ORA $0B55           ; $06CF49   |
    ORA $0398           ; $06CF4C   |
    BEQ CODE_06CF55     ; $06CF4F   |
    JSL $03B716         ; $06CF51   |

CODE_06CF55:
    JSR CODE_06CF66     ; $06CF55   |
    JSR CODE_06CFA5     ; $06CF58   |
    JSR CODE_06CFC4     ; $06CF5B   |
    JSR CODE_06D019     ; $06CF5E   |
    RTL                 ; $06CF61   |

DATA_06CF62:         dw $0003, $FFFB

CODE_06CF66:
    LDA $614E           ; $06CF66   |
    CMP #$0001          ; $06CF69   |
    BEQ CODE_06CF74     ; $06CF6C   |
    LDY $0C8A           ; $06CF6E   |
    BNE CODE_06CF74     ; $06CF71   |
    RTS                 ; $06CF73   |

CODE_06CF74:
    LDY #$00            ; $06CF74   |
    STY $74A3           ; $06CF76   |
    LDY $60C4           ; $06CF79   |
    LDA $608C           ; $06CF7C   |
    CLC                 ; $06CF7F   |
    ADC $CF62,y         ; $06CF80   |
    STA $70E2           ; $06CF83   |
    LDA $6090           ; $06CF86   |
    CLC                 ; $06CF89   |
    ADC #$000A          ; $06CF8A   |
    STA $7182           ; $06CF8D   |
    LDA $7400           ; $06CF90   |
    EOR #$0002          ; $06CF93   |
    STA $7400           ; $06CF96   |
    INC $614E           ; $06CF99   |
    JSR CODE_06BF1E     ; $06CF9C   |
    LDY #$05            ; $06CF9F   |
    STY $76             ; $06CFA1   |
    PLA                 ; $06CFA3   |
    RTL                 ; $06CFA4   |

CODE_06CFA5:
    LDA $60AC           ; $06CFA5   |
    CMP #$0012          ; $06CFA8   |
    BEQ CODE_06CFB6     ; $06CFAB   |
    LDA $61D6           ; $06CFAD   |
    SEC                 ; $06CFB0   |
    SBC #$009F          ; $06CFB1   |
    BNE CODE_06CFC3     ; $06CFB4   |

CODE_06CFB6:
    JSR CODE_06D110     ; $06CFB6   |
    LDA $7182           ; $06CFB9   |
    CLC                 ; $06CFBC   |
    ADC #$0004          ; $06CFBD   |
    STA $7182           ; $06CFC0   |

CODE_06CFC3:
    RTS                 ; $06CFC3   |

CODE_06CFC4:
    LDA #$FFFF          ; $06CFC4   |
    LDY $74A2           ; $06CFC7   |
    BMI CODE_06CFF2     ; $06CFCA   |
    REP #$10            ; $06CFCC   |
    LDY $60AE           ; $06CFCE   |
    CPY #$000E          ; $06CFD1   |
    BEQ CODE_06CFED     ; $06CFD4   |
    LDY $60BE           ; $06CFD6   |
    CPY #$0166          ; $06CFD9   |
    BEQ CODE_06CFED     ; $06CFDC   |
    LDA #$0002          ; $06CFDE   |
    LDY $0E15           ; $06CFE1   |
    BNE CODE_06CFED     ; $06CFE4   |
    LDY $61CE           ; $06CFE6   |
    BNE CODE_06CFED     ; $06CFE9   |
    INC A               ; $06CFEB   |
    INC A               ; $06CFEC   |

CODE_06CFED:
    STA $74A2           ; $06CFED   |
    SEP #$10            ; $06CFF0   |

CODE_06CFF2:
    RTS                 ; $06CFF2   |

    LDY $0E15           ; $06CFF3   |
    BEQ CODE_06D012     ; $06CFF6   |
    LDY #$1B            ; $06CFF8   |
    STY $7402           ; $06CFFA   |
    LDY #$12            ; $06CFFD   |
    STY $7A98           ; $06CFFF   |
    LDA #$0004          ; $06D002   |
    STA $16             ; $06D005   |
    LDA #$000C          ; $06D007   |
    STA $7A36           ; $06D00A   |
    STZ $7400           ; $06D00D   |
    INC $76             ; $06D010   |

CODE_06D012:
    RTS                 ; $06D012   |

DATA_06D013:         dw $000D, $0010, $0012

CODE_06D019:
    LDY $1078           ; $06D019   |
    BEQ CODE_06D023     ; $06D01C   |
    LDY #$02            ; $06D01E   |
    JMP CODE_06D07C     ; $06D020   |

CODE_06D023:
    LDA $60AC           ; $06D023   |
    ASL $00             ; $06D027   |
    BNE CODE_06D03E     ; $06D029   |
    LDA $6106           ; $06D02B   |
    AND #$00FF          ; $06D02E   |
    CMP #$0002          ; $06D031   |
    BEQ CODE_06D03B     ; $06D034   |
    CMP #$0004          ; $06D036   |
    BNE CODE_06D03E     ; $06D039   |

CODE_06D03B:
    JMP CODE_06D0DE     ; $06D03B   |

CODE_06D03E:
    LDA $61B0           ; $06D03E   |
    ORA $61AE           ; $06D041   |
    ORA $0B55           ; $06D044   |
    ORA $0398           ; $06D047   |
    BEQ CODE_06D057     ; $06D04A   |
    LDY $0E15           ; $06D04C   |
    BEQ CODE_06D056     ; $06D04F   |
    LDY #$1F            ; $06D051   |
    STY $7402           ; $06D053   |

CODE_06D056:
    RTS                 ; $06D056   |

CODE_06D057: LDA $03B6                                  ;$06D057   | 
CODE_06D05A: CMP #$0032                                 ;$06D05A   | 
CODE_06D05D: BPL CODE_06D060                            ;$06D05D   | 
CODE_06D05F: RTS                                        ;$06D05F   | 

CODE_06D060: LDY #$02                                   ;$06D060   | 
CODE_06D062: LDA $60C0                                  ;$06D062   | 
CODE_06D065: BEQ CODE_06D06C                            ;$06D065   | 
CODE_06D067: LDA $60AA                                  ;$06D067   | 
CODE_06D06A: BRA CODE_06D07F                            ;$06D06A   | 

CODE_06D06C: LDA $60A8                                  ;$06D06C   | 
CODE_06D06F: BEQ CODE_06D0AD                            ;$06D06F   | 
CODE_06D071: CLC                                        ;$06D071   | 
CODE_06D072: ADC #$0270                                 ;$06D072   | 
CODE_06D075: CMP #$04E0                                 ;$06D075   | 
CODE_06D078: BCS CODE_06D07C                            ;$06D078   | 
CODE_06D07A: DEY                                        ;$06D07A   | 
CODE_06D07B: DEY                                        ;$06D07B   | 
CODE_06D07C: LDA $60A8                                  ;$06D07C   | 
CODE_06D07F: BPL CODE_06D085                            ;$06D07F   | 
CODE_06D081: EOR #$FFFF                                 ;$06D081   | 
CODE_06D084: INC A                                      ;$06D084   | 
CODE_06D085: CLC                                        ;$06D085   | 
CODE_06D086: ADC $7A36                                  ;$06D086   | 
CODE_06D089: CMP #$0F00                                 ;$06D089   | 
CODE_06D08C: BMI CODE_06D0A9                            ;$06D08C   | 
CODE_06D08E: SEC                                        ;$06D08E   | 
CODE_06D08F: SBC #$0F00                                 ;$06D08F   | 
CODE_06D092: PHA                                        ;$06D092   | 
CODE_06D093: INC $16                                    ;$06D093   | 
CODE_06D095: LDA $16                                    ;$06D095   | 
CODE_06D097: CLC                                        ;$06D097   | 
CODE_06D098: ADC $D013,y                                ;$06D098   | 
CODE_06D09B: CMP $D015,y                                ;$06D09B   | 
CODE_06D09E: BMI CODE_06D0A5                            ;$06D09E   | 
CODE_06D0A0: STZ $16                                    ;$06D0A0   | 
CODE_06D0A2: LDA $D013,y                                ;$06D0A2   | 
CODE_06D0A5: STA $7402                                  ;$06D0A5   | 
CODE_06D0A8: PLA                                        ;$06D0A8   | 
CODE_06D0A9: STA $7A36                                  ;$06D0A9   | 
CODE_06D0AC: RTS                                        ;$06D0AC   | 

CODE_06D0AD: LDY #$0D                                   ;$06D0AD   | 
CODE_06D0AF: LDA $60CE                                  ;$06D0AF   | 
CODE_06D0B2: BEQ CODE_06D0CD                            ;$06D0B2   | 
CODE_06D0B4: LDA $0DAE                                  ;$06D0B4   | 
CODE_06D0B7: INC A                                      ;$06D0B7   | 
CODE_06D0B8: INC A                                      ;$06D0B8   | 
CODE_06D0B9: STA $0DAE                                  ;$06D0B9   | 
CODE_06D0BC: BPL CODE_06D0C4                            ;$06D0BC   | 
CODE_06D0BE: LDA #$7FFF                                 ;$06D0BE   | 
CODE_06D0C1: STA $0DAE                                  ;$06D0C1   | 
CODE_06D0C4: CMP #$0020                                 ;$06D0C4   | 
CODE_06D0C7: BCC CODE_06D104                            ;$06D0C7   | 
CODE_06D0C9: LDY #$12                                   ;$06D0C9   | 
CODE_06D0CB: BRA CODE_06D104                            ;$06D0CB   | 

CODE_06D0CD: LDA $0DAE                                  ;$06D0CD   | 
CODE_06D0D0: LSR A                                      ;$06D0D0   | 
CODE_06D0D1: STA $0DAE                                  ;$06D0D1   | 
CODE_06D0D4: CPX $0D96                                  ;$06D0D4   | 
CODE_06D0D7: BEQ CODE_06D104                            ;$06D0D7   | 
CODE_06D0D9: LDA $60C2                                  ;$06D0D9   | 
CODE_06D0DC: BEQ CODE_06D0FD                            ;$06D0DC   | 
CODE_06D0DE: LDA $0DB0                                  ;$06D0DE   | 
CODE_06D0E1: INC A                                      ;$06D0E1   | 
CODE_06D0E2: INC A                                      ;$06D0E2   | 
CODE_06D0E3: STA $0DB0                                  ;$06D0E3   | 
CODE_06D0E6: BPL CODE_06D0EE                            ;$06D0E6   | 
CODE_06D0E8: LDA #$7FFF                                 ;$06D0E8   | 
CODE_06D0EB: STA $0DB0                                  ;$06D0EB   | 
CODE_06D0EE: CMP #$0020                                 ;$06D0EE   | 
CODE_06D0F1: BCC CODE_06D104                            ;$06D0F1   | 
CODE_06D0F3: LDY #$13                                   ;$06D0F3   | 
CODE_06D0F5: CMP #$0024                                 ;$06D0F5   | 
CODE_06D0F8: BMI CODE_06D104                            ;$06D0F8   | 
CODE_06D0FA: INY                                        ;$06D0FA   | 
CODE_06D0FB: BRA CODE_06D104                            ;$06D0FB   | 

CODE_06D0FD: LDA $0DB0                                  ;$06D0FD   | 
CODE_06D100: LSR A                                      ;$06D100   | 
CODE_06D101: STA $0DB0                                  ;$06D101   | 
CODE_06D104: STY $7402                                  ;$06D104   | 
CODE_06D107: RTS                                        ;$06D107   | 

CODE_06D108: BRA CODE_06D10B                            ;$06D108   | 

CODE_06D10A: BRA CODE_06D10A                            ;$06D10A   | 

CODE_06D10C: PHA                                        ;$06D10C   | 
CODE_06D10D: PHA                                        ;$06D10D   | 
CODE_06D10E: BRA CODE_06D117                            ;$06D10E   | 

CODE_06D110: LDX $12                                    ;$06D110   | 
CODE_06D112: CPX $0D96                                  ;$06D112   | 
CODE_06D115: BEQ CODE_06D107                            ;$06D115   | 
CODE_06D117: PHX                                        ;$06D117   | 
CODE_06D118: LDA $60C4                                  ;$06D118   | 
CODE_06D11B: STA $7400                                  ;$06D11B   | 
CODE_06D11E: EOR #$0002                                 ;$06D11E   | 
CODE_06D121: TAX                                        ;$06D121   | 
CODE_06D122: LDA $06D108,x                              ;$06D122   | 
CODE_06D126: STA $7220                                  ;$06D126   | 
CODE_06D129: PLX                                        ;$06D129   | 
CODE_06D12A: LDA $61B2                                  ;$06D12A   | 
CODE_06D12D: AND #$7FFF                                 ;$06D12D   | 
CODE_06D130: STA $61B2                                  ;$06D130   | 
CODE_06D133: LDA #$0010                                 ;$06D133   | 
CODE_06D136: STA $6F00                                  ;$06D136   | 
CODE_06D139: LDY #$00                                   ;$06D139   | 
CODE_06D13B: STY $7862                                  ;$06D13B   | 
CODE_06D13E: STZ $16                                    ;$06D13E   | 
CODE_06D140: STZ $7902                                  ;$06D140   | 
CODE_06D143: LDA #$FC00                                 ;$06D143   | 
CODE_06D146: STA $7222                                  ;$06D146   | 
CODE_06D149: STZ $76                                    ;$06D149   | 
CODE_06D14B: LDA #$F629                                 ;$06D14B   | 
CODE_06D14E: STA $6FA0                                  ;$06D14E   | 
CODE_06D151: LDA $0146                                  ;$06D151   | 
CODE_06D154: CMP #$0009                                 ;$06D154   | 
CODE_06D157: BNE CODE_06D185                            ;$06D157   | 
CODE_06D159: LDA #$0005                                 ;$06D159   | 
CODE_06D15C: STA $7A96                                  ;$06D15C   | 
CODE_06D15F: LDA #$4001                                 ;$06D15F   | 
CODE_06D162: STA $7040                                  ;$06D162   | 
CODE_06D165: LDA #$6040                                 ;$06D165   | 
CODE_06D168: STA $6FA2                                  ;$06D168   | 
CODE_06D16B: STZ $0DB4                                  ;$06D16B   | 
CODE_06D16E: LDA $0D04                                  ;$06D16E   | 
CODE_06D171: EOR #$FFFF                                 ;$06D171   | 
CODE_06D174: INC A                                      ;$06D174   | 
CODE_06D175: AND #$FF00                                 ;$06D175   | 
CODE_06D178: STA $0DAC                                  ;$06D178   | 
CODE_06D17B: LDA #$5000                                 ;$06D17B   | 
CODE_06D17E: STA $0DAA                                  ;$06D17E   | 
CODE_06D181: LDY #$10                                   ;$06D181   | 
CODE_06D183: BRA CODE_06D191                            ;$06D183   | 

CODE_06D185: LDA $6090                                  ;$06D185   | 
CODE_06D188: SEC                                        ;$06D188   | 
CODE_06D189: SBC #$0014                                 ;$06D189   | 
CODE_06D18C: STA $0DB2                                  ;$06D18C   | 
CODE_06D18F: LDY #$20                                   ;$06D18F   | 
CODE_06D191: STY $7AF8                                  ;$06D191   | 
CODE_06D194: LDA #$FFFF                                 ;$06D194   | 
CODE_06D197: STA $7E48                                  ;$06D197   | 
CODE_06D19A: PLA                                        ;$06D19A   | 
CODE_06D19B: PLA                                        ;$06D19B   | 
CODE_06D19C: RTL                                        ;$06D19C   | 

DATA_06D19D:         dw $0400, $FC00

.init_dangling_ghost
    LDA #$4000          ; $06D1A1   |
    STA $18,x           ; $06D1A4   |
    LDA #$2000          ; $06D1A6   |
    STA $76,x           ; $06D1A9   |
    LDY #$00            ; $06D1AB   |
    LDA $70E2,x         ; $06D1AD   |
    SEC                 ; $06D1B0   |
    SBC $611C           ; $06D1B1   |
    BMI CODE_06D1B8     ; $06D1B4   |
    LDY #$02            ; $06D1B6   |

CODE_06D1B8:
    LDA $D19D,y         ; $06D1B8   |
    STA $78,x           ; $06D1BB   |
    STZ $7A36,x         ; $06D1BD   |
    STZ $7902,x         ; $06D1C0   |
    STZ $7AF6,x         ; $06D1C3   |
    RTL                 ; $06D1C6   |

.main_dangling_ghost
    LDA $7902,x         ; $06D1C7   |
    STA $0E             ; $06D1CA   |
    JSR CODE_06D2AC     ; $06D1CC   |
    JSR CODE_06D307     ; $06D1CF   |
    JSR CODE_06D484     ; $06D1D2   |
    JSR CODE_06D4FB     ; $06D1D5   |
    JSL $03AF23         ; $06D1D8   |
    LDA $7680,x         ; $06D1DC   |
    CLC                 ; $06D1DF   |
    ADC #$0090          ; $06D1E0   |
    CMP #$0220          ; $06D1E3   |
    BCS CODE_06D1F4     ; $06D1E6   |
    LDA $7682,x         ; $06D1E8   |
    CLC                 ; $06D1EB   |
    ADC #$00C8          ; $06D1EC   |
    CMP #$019A          ; $06D1EF   |
    BCC CODE_06D218     ; $06D1F2   |

CODE_06D1F4:
    JSL $03A31E         ; $06D1F4   |
    LDA $0E             ; $06D1F8   |
    BIT #$0010          ; $06D1FA   |
    BEQ CODE_06D216     ; $06D1FD   |
    LDA $79D6           ; $06D1FF   |
    CMP #$000D          ; $06D202   |
    BEQ CODE_06D20C     ; $06D205   |
    CMP #$000E          ; $06D207   |
    BNE CODE_06D216     ; $06D20A   |

CODE_06D20C:
    JSL $06C0B3         ; $06D20C   |
    LDA #$0400          ; $06D210   |
    STA $7222           ; $06D213   |

CODE_06D216:
    BRA CODE_06D226     ; $06D216   |

CODE_06D218:
    LDA #$0C00          ; $06D218   |
    TRB $0E             ; $06D21B   |
    JSR CODE_06D888     ; $06D21D   |
    JSR CODE_06D234     ; $06D220   |
    JSR CODE_06D537     ; $06D223   |

CODE_06D226:
    LDX $12             ; $06D226   |
    LDA $0E             ; $06D228   |
    STA $7902,x         ; $06D22A   |
    LDX $12             ; $06D22D   |
    RTL                 ; $06D22F   |

DATA_06D230:         dw $FFE0, $0000

; dangling ghost sub

CODE_06D234:
    LDA $61B2           ; $06D234   |
    BMI CODE_06D265     ; $06D237   |
    LDA $0E             ; $06D239   |
    BIT #$0010          ; $06D23B   |
    BEQ CODE_06D26C     ; $06D23E   |
    LDA $7400,x         ; $06D240   |
    AND #$0002          ; $06D243   |
    TAY                 ; $06D246   |
    LDA $7049EA         ; $06D247   |
    CLC                 ; $06D24B   |
    ADC $D230,y         ; $06D24C   |
    CLC                 ; $06D24F   |
    ADC $70E2,x         ; $06D250   |
    STA $70E2           ; $06D253   |
    LDA $7049E8         ; $06D256   |
    CLC                 ; $06D25A   |
    ADC #$0070          ; $06D25B   |
    CLC                 ; $06D25E   |
    ADC $7182,x         ; $06D25F   |
    STA $7182           ; $06D262   |

CODE_06D265:
    LDA $0E             ; $06D265   |
    BIT #$0010          ; $06D267   |
    BNE CODE_06D297     ; $06D26A   |

CODE_06D26C:
    LDA $0E             ; $06D26C   |
    AND #$000F          ; $06D26E   |
    CMP #$0001          ; $06D271   |
    BNE CODE_06D2AB     ; $06D274   |
    LDA $0E             ; $06D276   |
    BIT #$0400          ; $06D278   |
    BEQ CODE_06D2AB     ; $06D27B   |
    LDA $61B2           ; $06D27D   |
    BPL CODE_06D2AB     ; $06D280   |
    LDA $0E             ; $06D282   |
    PHA                 ; $06D284   |
    JSL $06BEF1         ; $06D285   |
    PLA                 ; $06D289   |
    ORA #$0010          ; $06D28A   |
    STA $0E             ; $06D28D   |
    LDA #$003D          ; $06D28F   |
    JSL $0085D2         ; $06D292   |
    RTS                 ; $06D296   |

CODE_06D297:
    LDA $03B6           ; $06D297   |
    BEQ CODE_06D2A1     ; $06D29A   |
    LDA $61B2           ; $06D29C   |
    BPL CODE_06D2AB     ; $06D29F   |

CODE_06D2A1:
    LDA #$0800          ; $06D2A1   |
    TSB $0E             ; $06D2A4   |
    LDA #$0410          ; $06D2A6   |
    TRB $0E             ; $06D2A9   |

CODE_06D2AB:
    RTS                 ; $06D2AB   |

; dangling ghost sub

CODE_06D2AC:
    LDA #$0011          ; $06D2AC   |
    ASL A               ; $06D2AF   |
    TAY                 ; $06D2B0   |

CODE_06D2B1:
    TYA                 ; $06D2B1   |
    ASL A               ; $06D2B2   |
    TAX                 ; $06D2B3   |
    LDA $D2E3,y         ; $06D2B4   |
    AND #$00FF          ; $06D2B7   |
    CMP #$0080          ; $06D2BA   |
    BCC CODE_06D2C2     ; $06D2BD   |
    ORA #$FF00          ; $06D2BF   |

CODE_06D2C2:
    STA $7049C6,x       ; $06D2C2   |
    LDA $D2E4,y         ; $06D2C6   |
    AND #$00FF          ; $06D2C9   |
    CMP #$0080          ; $06D2CC   |
    BCC CODE_06D2D4     ; $06D2CF   |
    ORA #$FF00          ; $06D2D1   |

CODE_06D2D4:
    SEC                 ; $06D2D4   |
    SBC #$0070          ; $06D2D5   |
    STA $7049C8,x       ; $06D2D8   |
    DEY                 ; $06D2DC   |
    DEY                 ; $06D2DD   |
    BPL CODE_06D2B1     ; $06D2DE   |
    LDX $12             ; $06D2E0   |
    RTS                 ; $06D2E2   |

DATA_06D2E3:         db $00, $00, $10, $00
DATA_06D2E7:         db $10, $00, $08, $07
DATA_06D2EB:         db $08, $07, $08, $07
DATA_06D2EF:         db $08, $07, $08, $07
DATA_06D2F3:         db $16, $18, $00, $2E
DATA_06D2F7:         db $EA, $18, $F7, $07
DATA_06D2FB:         db $F7, $07, $F7, $07
DATA_06D2FF:         db $F7, $07, $F7, $07
DATA_06D303:         db $F0, $00, $F0, $00

; dangling ghost sub

CODE_06D307:
    LDA $18,x           ; $06D307   |
    XBA                 ; $06D309   |
    ASL A               ; $06D30A   |
    AND #$00FE          ; $06D30B   |
    CLC                 ; $06D30E   |
    ADC #$0100          ; $06D30F   |
    STA $3002           ; $06D312   |
    STA $00             ; $06D315   |
    LDA $76,x           ; $06D317   |
    STA $02             ; $06D319   |
    ASL A               ; $06D31B   |
    XBA                 ; $06D31C   |
    AND #$00FF          ; $06D31D   |
    STA $300C           ; $06D320   |
    LDX #$0B            ; $06D323   |
    LDA #$8595          ; $06D325   |
    JSL $7EDE44         ; $06D328   |
    LDA $3000           ; $06D32C   |
    LSR A               ; $06D32F   |
    STA $04             ; $06D330   |
    LDA $3002           ; $06D332   |
    LSR A               ; $06D335   |
    STA $06             ; $06D336   |
    LDY #$04            ; $06D338   |

CODE_06D33A:
    LDX $D47F,y         ; $06D33A   |
    LDA $7049C6,x       ; $06D33D   |
    CLC                 ; $06D341   |
    ADC $3000           ; $06D342   |
    STA $7049C6,x       ; $06D345   |
    LDA $7049C8,x       ; $06D349   |
    CLC                 ; $06D34D   |
    ADC $3002           ; $06D34E   |
    STA $7049C8,x       ; $06D351   |
    DEY                 ; $06D355   |
    BPL CODE_06D33A     ; $06D356   |
    LDX $12             ; $06D358   |
    LDA $0E             ; $06D35A   |
    AND #$000F          ; $06D35C   |
    CMP #$0001          ; $06D35F   |
    BEQ CODE_06D36A     ; $06D362   |
    CMP #$0002          ; $06D364   |
    BEQ CODE_06D36A     ; $06D367   |
    RTS                 ; $06D369   |

CODE_06D36A:
    LDA $04             ; $06D36A   |
    CLC                 ; $06D36C   |
    ADC $7049DA         ; $06D36D   |
    STA $7049DA         ; $06D371   |
    LDA $04             ; $06D375   |
    CLC                 ; $06D377   |
    ADC $7049FA         ; $06D378   |
    STA $7049FA         ; $06D37C   |
    LDA $06             ; $06D380   |
    CLC                 ; $06D382   |
    ADC $7049DC         ; $06D383   |
    STA $7049DC         ; $06D387   |
    LDA $06             ; $06D38B   |
    CLC                 ; $06D38D   |
    ADC $7049FC         ; $06D38E   |
    STA $7049FC         ; $06D392   |
    LDA $14             ; $06D396   |
    ASL A               ; $06D398   |
    ASL A               ; $06D399   |
    ASL A               ; $06D39A   |
    ASL A               ; $06D39B   |
    AND #$01FE          ; $06D39C   |
    STA $3002           ; $06D39F   |
    LDA $76,x           ; $06D3A2   |
    XBA                 ; $06D3A4   |
    AND #$00FF          ; $06D3A5   |
    LSR A               ; $06D3A8   |
    LSR A               ; $06D3A9   |
    STA $300C           ; $06D3AA   |
    LDX #$0B            ; $06D3AD   |
    LDA #$8595          ; $06D3AF   |
    JSL $7EDE44         ; $06D3B2   |
    LDX $12             ; $06D3B6   |
    LDA $3002           ; $06D3B8   |
    CLC                 ; $06D3BB   |
    ADC $00             ; $06D3BC   |
    AND #$01FE          ; $06D3BE   |
    STA $3002           ; $06D3C1   |
    LDA $02             ; $06D3C4   |
    LSR A               ; $06D3C6   |
    XBA                 ; $06D3C7   |
    AND #$00FF          ; $06D3C8   |
    STA $300C           ; $06D3CB   |
    LDX #$0B            ; $06D3CE   |
    LDA #$8595          ; $06D3D0   |
    JSL $7EDE44         ; $06D3D3   |
    LDX $12             ; $06D3D7   |
    LDA $3000           ; $06D3D9   |
    CLC                 ; $06D3DC   |
    ADC $7049D6         ; $06D3DD   |
    STA $7049D6         ; $06D3E1   |
    LDA $3000           ; $06D3E5   |
    CLC                 ; $06D3E8   |
    ADC $7049FE         ; $06D3E9   |
    STA $7049FE         ; $06D3ED   |
    LDA $3002           ; $06D3F1   |
    PHA                 ; $06D3F4   |
    CLC                 ; $06D3F5   |
    ADC $7049D8         ; $06D3F6   |
    STA $7049D8         ; $06D3FA   |
    PLA                 ; $06D3FE   |
    ADC $704A00         ; $06D3FF   |
    STA $704A00         ; $06D403   |
    LDA $14             ; $06D407   |
    ASL A               ; $06D409   |
    ASL A               ; $06D40A   |
    ASL A               ; $06D40B   |
    ASL A               ; $06D40C   |
    AND #$01FE          ; $06D40D   |
    STA $3002           ; $06D410   |
    LDA $76,x           ; $06D413   |
    XBA                 ; $06D415   |
    AND #$00FF          ; $06D416   |
    LSR A               ; $06D419   |
    LSR A               ; $06D41A   |
    LSR A               ; $06D41B   |
    STA $300C           ; $06D41C   |
    LDX #$0B            ; $06D41F   |
    LDA #$8595          ; $06D421   |
    JSL $7EDE44         ; $06D424   |
    LDX $12             ; $06D428   |
    LDA $00             ; $06D42A   |
    SEC                 ; $06D42C   |
    SBC $3002           ; $06D42D   |
    AND #$01FE          ; $06D430   |
    STA $3002           ; $06D433   |
    LDA $02             ; $06D436   |
    LSR A               ; $06D438   |
    CLC                 ; $06D439   |
    ADC $02             ; $06D43A   |
    XBA                 ; $06D43C   |
    AND #$00FF          ; $06D43D   |
    STA $300C           ; $06D440   |
    LDX #$0B            ; $06D443   |
    LDA #$8595          ; $06D445   |
    JSL $7EDE44         ; $06D448   |
    LDX $12             ; $06D44C   |
    LDA $3000           ; $06D44E   |
    CLC                 ; $06D451   |
    ADC $7049DE         ; $06D452   |
    STA $7049DE         ; $06D456   |
    LDA $3000           ; $06D45A   |
    CLC                 ; $06D45D   |
    ADC $7049F6         ; $06D45E   |
    STA $7049F6         ; $06D462   |
    LDA $3002           ; $06D466   |
    PHA                 ; $06D469   |
    CLC                 ; $06D46A   |
    ADC $7049E0         ; $06D46B   |
    STA $7049E0         ; $06D46F   |
    PLA                 ; $06D473   |
    ADC $7049F8         ; $06D474   |
    STA $7049F8         ; $06D478   |
    LDX $12             ; $06D47C   |
    RTS                 ; $06D47E   |

DATA_06D47F:         db $1C, $20, $24, $28
DATA_06D483:         db $2C

; dangling ghost sub

CODE_06D484:
    LDA $7680,x         ; $06D484   |
    CLC                 ; $06D486   |
    ADC #$0090          ; $06D488   |
    CMP #$0220          ; $06D48B   |
    BCS CODE_06D49C     ; $06D48E   |
    LDA $7682,x         ; $06D490   |
    CLC                 ; $06D493   |
    ADC #$00C8          ; $06D494   |
    CMP #$019A          ; $06D497   |
    BCC CODE_06D4AC     ; $06D49A   |

CODE_06D49C:
    LDY #$11            ; $06D49C   |
    STY $0967           ; $06D49E   |
    LDY #$02            ; $06D4A1   |
    STY $0968           ; $06D4A3   |
    LDY #$20            ; $06D4A6   |
    STY $096C           ; $06D4A8   |
    RTS                 ; $06D4AB   |

CODE_06D4AC:
    LDA #$0000          ; $06D4AC   |
    CLC                 ; $06D4AF   |
    ADC $7680,x         ; $06D4B0   |
    STA $6040           ; $06D4B3   |
    LDA #$0070          ; $06D4B6   |
    CLC                 ; $06D4B9   |
    ADC $7682,x         ; $06D4BA   |
    STA $6042           ; $06D4BD   |
    LDA #$0012          ; $06D4C0   |
    STA $3004           ; $06D4C3   |
    LDX #$08            ; $06D4C6   |
    LDA #$E64B          ; $06D4C8   |
    JSL $7EDE44         ; $06D4CB   |
    JSL $00BE39         ; $06D4CF   |

; DMA args
DATA_06D4D3:         dl $7E5040, $703372
DATA_06D4D9:         dw $0348

    SEP #$30            ; $06D4DB   |
    LDA #$13            ; $06D4DD   |
    STA $0967           ; $06D4DF   |
    LDA #$04            ; $06D4E2   |
    STA $0968           ; $06D4E4   |
    LDA #$22            ; $06D4E7   |
    STA $096B           ; $06D4E9   |
    LDA #$63            ; $06D4EC   |
    STA $096C           ; $06D4EE   |
    LDA #$18            ; $06D4F1   |
    TSB $094A           ; $06D4F3   |
    REP #$20            ; $06D4F6   |
    LDX $12             ; $06D4F8   |
    RTS                 ; $06D4FA   |

; dangling ghost sub

CODE_06D4FB:
    REP #$10            ; $06D4FB   |
    LDA $7049EA         ; $06D4FD   |
    SEC                 ; $06D501   |
    SBC #$0008          ; $06D502   |
    STA $00             ; $06D505   |
    LDA $7049E8         ; $06D507   |
    CLC                 ; $06D50B   |
    ADC #$0070          ; $06D50C   |
    STA $02             ; $06D50F   |
    LDY $7362,x         ; $06D511   |
    LDX #$000C          ; $06D514   |

CODE_06D517:
    LDA $6000,y         ; $06D517   |
    CLC                 ; $06D51A   |
    ADC $00             ; $06D51B   |
    STA $6000,y         ; $06D51D   |
    LDA $6002,y         ; $06D520   |
    CLC                 ; $06D523   |
    ADC $02             ; $06D524   |
    STA $6002,y         ; $06D526   |
    TYA                 ; $06D529   |
    CLC                 ; $06D52A   |
    ADC #$0008          ; $06D52B   |
    TAY                 ; $06D52E   |
    DEX                 ; $06D52F   |
    BNE CODE_06D517     ; $06D530   |
    SEP #$10            ; $06D532   |
    LDX $12             ; $06D534   |
    RTS                 ; $06D536   |

; dangling ghost sub

CODE_06D537:
    LDA $0E             ; $06D537   |
    BIT #$0800          ; $06D539   |
    BEQ CODE_06D564     ; $06D53C   |
    LDA $0E             ; $06D53E   |
    AND #$FFE0          ; $06D540   |
    ORA #$8022          ; $06D543   |
    STA $0E             ; $06D546   |
    LDA $03B6           ; $06D548   |
    BEQ CODE_06D564     ; $06D54B   |
    LDA $79D6           ; $06D54D   |
    CMP #$000D          ; $06D550   |
    BEQ CODE_06D55A     ; $06D553   |
    CMP #$000E          ; $06D555   |
    BNE CODE_06D564     ; $06D558   |

CODE_06D55A:
    JSL $06C0B3         ; $06D55A   |
    LDA #$0400          ; $06D55E   |
    STA $7222           ; $06D561   |

CODE_06D564:
    LDA $0E             ; $06D564   |
    AND #$000F          ; $06D566   |
    ASL A               ; $06D569   |
    TAY                 ; $06D56A   |
    LDA $D577,y         ; $06D56B   |
    STA $00             ; $06D56E   |
    PER $0002  [$D575]  ; $06D570   |
    JMP ($7960)         ; $06D573   | sub
    RTS                 ; $06D576   |

; dangling ghost routine table
DATA_06D577:         dw $D589
DATA_06D579:         dw $D6F3
DATA_06D57B:         dw $D7B6
DATA_06D57D:         dw $D842

DATA_06D57F:         dw $1000, $7000
DATA_06D583:         dw $0000, $FFFF
DATA_06D587:         dw $0200

    LDA $7400,x         ; $06D589   |
    AND #$FFFD          ; $06D58C   |
    STA $7400,x         ; $06D58F   |
    LDY #$01            ; $06D592   |
    LDA $608C           ; $06D594   |
    SEC                 ; $06D597   |
    SBC $70E2,x         ; $06D598   |
    BPL CODE_06D59F     ; $06D59B   |
    LDY #$00            ; $06D59D   |

CODE_06D59F:
    LDA $D587,y         ; $06D59F   |
    AND #$00FF          ; $06D5A2   |
    ORA $7400,x         ; $06D5A5   |
    STA $7400,x         ; $06D5A8   |
    STZ $7402,x         ; $06D5AB   |
    LDA $18,x           ; $06D5AE   |
    SEC                 ; $06D5B0   |
    SBC #$4000          ; $06D5B1   |
    STA $00             ; $06D5B4   |
    LDA $78,x           ; $06D5B6   |
    CLC                 ; $06D5B8   |
    ADC $18,x           ; $06D5B9   |
    STA $18,x           ; $06D5BB   |
    SEC                 ; $06D5BD   |
    SBC #$4000          ; $06D5BE   |
    EOR $00             ; $06D5C1   |
    BPL CODE_06D5CC     ; $06D5C3   |
    LDA #$0034          ; $06D5C5   |
    JSL $0085D2         ; $06D5C8   |

CODE_06D5CC:
    LDY #$02            ; $06D5CC   |
    LDA $18,x           ; $06D5CE   |
    SEC                 ; $06D5D0   |
    SBC #$4000          ; $06D5D1   |
    BPL CODE_06D5DB     ; $06D5D4   |
    LDY #$00            ; $06D5D6   |
    EOR #$FFFF          ; $06D5D8   |

CODE_06D5DB:
    CMP #$3000          ; $06D5DB   |
    BCC CODE_06D5E5     ; $06D5DE   |
    LDA $D57F,y         ; $06D5E0   |
    STA $18,x           ; $06D5E3   |

CODE_06D5E5:
    LDY #$02            ; $06D5E5   |
    LDA $18,x           ; $06D5E7   |
    SEC                 ; $06D5E9   |
    SBC #$4000          ; $06D5EA   |
    BPL CODE_06D5F5     ; $06D5ED   |
    LDY #$00            ; $06D5EF   |
    EOR #$FFFF          ; $06D5F1   |
    INC A               ; $06D5F4   |

CODE_06D5F5:
    XBA                 ; $06D5F5   |
    AND #$00FF          ; $06D5F6   |
    EOR $D583,y         ; $06D5F9   |
    CLC                 ; $06D5FC   |
    ADC $78,x           ; $06D5FD   |
    STA $78,x           ; $06D5FF   |
    LDA $796E           ; $06D601   |
    BIT #$0010          ; $06D604   |
    BEQ CODE_06D60C     ; $06D607   |
    JMP CODE_06D6E2     ; $06D609   |

CODE_06D60C:
    LDA $611C           ; $06D60C   |
    SEC                 ; $06D60F   |
    SBC $70E2,x         ; $06D610   |
    CLC                 ; $06D613   |
    ADC #$0060          ; $06D614   |
    CMP #$00C0          ; $06D617   |
    BCC CODE_06D621     ; $06D61A   |

CODE_06D61C:
    RTS                 ; $06D61C   |

DATA_06D61D:         dw $0042, $0062

; dangling ghost sub

CODE_06D621:
    LDA $61D6           ; $06D621   |
    BNE CODE_06D61C     ; $06D624   |
    LDA $7AF6,x         ; $06D626   |
    BNE CODE_06D61C     ; $06D629   |
    LDA $7A36,x         ; $06D62B   |
    CMP #$0003          ; $06D62E   |
    BCC CODE_06D63E     ; $06D631   |
    LDA #$0050          ; $06D633   |
    STA $7AF6,x         ; $06D636   |
    STZ $7A36,x         ; $06D639   |
    BRA CODE_06D61C     ; $06D63C   |

CODE_06D63E:
    LDY #$00            ; $06D63E   |
    LDA $70E2,x         ; $06D640   |
    BIT #$0010          ; $06D643   |
    BEQ CODE_06D64A     ; $06D646   |
    LDY #$02            ; $06D648   |

CODE_06D64A:
    LDA $76,x           ; $06D64A   |
    XBA                 ; $06D64C   |
    AND #$00FF          ; $06D64D   |
    ASL A               ; $06D650   |
    STA $00             ; $06D651   |
    LDA $70E2,x         ; $06D653   |
    SEC                 ; $06D656   |
    SBC $611C           ; $06D657   |
    STA $3002           ; $06D65A   |
    LDA $611E           ; $06D65D   |
    SEC                 ; $06D660   |
    SBC $7182,x         ; $06D661   |
    SEC                 ; $06D664   |
    SBC #$0018          ; $06D665   |
    SEC                 ; $06D668   |
    SBC $00             ; $06D669   |
    CMP #$0010          ; $06D66B   |
    BMI CODE_06D6E2     ; $06D66E   |
    CLC                 ; $06D670   |
    ADC $00             ; $06D671   |
    CMP #$00C0          ; $06D673   |
    BPL CODE_06D6E2     ; $06D676   |
    CMP $D61D,y         ; $06D678   |
    BMI CODE_06D680     ; $06D67B   |
    LDA $D61D,y         ; $06D67D   |

CODE_06D680:
    STA $00             ; $06D680   |
    EOR #$FFFF          ; $06D682   |
    INC A               ; $06D685   |
    STA $3004           ; $06D686   |
    LDX #$0B            ; $06D689   |
    LDA #$BCF8          ; $06D68B   |
    JSL $7EDE44         ; $06D68E   |
    LDX $12             ; $06D692   |
    LDA $3002           ; $06D694   |
    SEC                 ; $06D697   |
    SBC #$0080          ; $06D698   |
    AND #$00FF          ; $06D69B   |
    XBA                 ; $06D69E   |
    STA $7A38,x         ; $06D69F   |
    REP #$10            ; $06D6A2   |
    LDA $3002           ; $06D6A4   |
    ASL A               ; $06D6A7   |
    TAX                 ; $06D6A8   |
    LDA $00E9D4,x       ; $06D6A9   |
    ASL A               ; $06D6AD   |
    TAX                 ; $06D6AE   |
    LDA $702200,x       ; $06D6AF   |
    STA $02             ; $06D6B3   |
    SEP #$30            ; $06D6B5   |
    LDX $02             ; $06D6B7   |
    STX $211B           ; $06D6B9   |
    LDX $03             ; $06D6BC   |
    STX $211B           ; $06D6BE   |
    LDA $00             ; $06D6C1   |
    LSR A               ; $06D6C3   |
    STA $211C           ; $06D6C4   |
    REP #$20            ; $06D6C7   |
    LDX $12             ; $06D6C9   |
    LDA $2135           ; $06D6CB   |
    AND #$00FF          ; $06D6CE   |
    XBA                 ; $06D6D1   |
    STA $7900,x         ; $06D6D2   |
    LDA $0E             ; $06D6D5   |
    AND #$FFF0          ; $06D6D7   |
    ORA #$8001          ; $06D6DA   |
    STA $0E             ; $06D6DD   |
    INC $7A36,x         ; $06D6DF   |

CODE_06D6E2:
    RTS                 ; $06D6E2   |

DATA_06D6E3:         db $07, $06, $05, $04
DATA_06D6E7:         db $03, $02, $01, $00
DATA_06D6EB:         db $40, $04, $03, $02
DATA_06D6EF:         db $02, $02, $01, $01

; dangling ghost sub
    LDA $0E             ; $06D6F3   |
    BPL CODE_06D704     ; $06D6F5   |
    AND #$7FFF          ; $06D6F7   |
    STA $0E             ; $06D6FA   |
    LDA #$0006          ; $06D6FC   |
    STA $16,x           ; $06D6FF   |
    STZ $7A96,x         ; $06D701   |

CODE_06D704:
    LDA $7A96,x         ; $06D704   |
    BNE CODE_06D723     ; $06D707   |
    LDA $16,x           ; $06D709   |
    BEQ CODE_06D723     ; $06D70B   |
    DEC A               ; $06D70D   |
    STA $16,x           ; $06D70E   |
    TAY                 ; $06D710   |
    LDA $D6E3,y         ; $06D711   |
    AND #$00FF          ; $06D714   |
    STA $7402,x         ; $06D717   |
    LDA $D6EB,y         ; $06D71A   |
    AND #$00FF          ; $06D71D   |
    STA $7A96,x         ; $06D720   |

CODE_06D723:
    LDA $0E             ; $06D723   |
    BIT #$0010          ; $06D725   |
    BNE CODE_06D73F     ; $06D728   |
    LDA $611C           ; $06D72A   |
    SEC                 ; $06D72D   |
    SBC $70E2,x         ; $06D72E   |
    CLC                 ; $06D731   |
    ADC #$0060          ; $06D732   |
    CMP #$00C0          ; $06D735   |
    BCC CODE_06D74E     ; $06D738   |
    STZ $78,x           ; $06D73A   |
    STZ $7A36,x         ; $06D73C   |

CODE_06D73F:
    LDA $0E             ; $06D73F   |
    AND #$FFF0          ; $06D741   |
    ORA #$8002          ; $06D744   |
    STA $0E             ; $06D747   |
    RTS                 ; $06D749   |

DATA_06D74A:         dw $FE00, $0200

; dangling ghost sub

CODE_06D74E:
    LDY #$00            ; $06D74E   |
    LDA $7A38,x         ; $06D750   |
    SEC                 ; $06D753   |
    SBC $18,x           ; $06D754   |
    STA $00             ; $06D756   |
    BEQ CODE_06D76F     ; $06D758   |
    BMI CODE_06D75E     ; $06D75A   |
    LDY #$02            ; $06D75C   |

CODE_06D75E:
    LDA $D74A,y         ; $06D75E   |
    CLC                 ; $06D761   |
    ADC $18,x           ; $06D762   |
    PHA                 ; $06D764   |
    SEC                 ; $06D765   |
    SBC $7A38,x         ; $06D766   |
    EOR $00             ; $06D769   |
    ASL A               ; $06D76B   |
    PLA                 ; $06D76C   |
    BCS CODE_06D772     ; $06D76D   |

CODE_06D76F:
    LDA $7A38,x         ; $06D76F   |

CODE_06D772:
    STA $18,x           ; $06D772   |
    LDA $7900,x         ; $06D774   |
    SEC                 ; $06D777   |
    SBC $76,x           ; $06D778   |
    BMI CODE_06D790     ; $06D77A   |
    ASL A               ; $06D77C   |
    XBA                 ; $06D77D   |
    AND #$00FF          ; $06D77E   |
    ASL A               ; $06D781   |
    ASL A               ; $06D782   |
    ASL A               ; $06D783   |
    CLC                 ; $06D784   |
    ADC #$0010          ; $06D785   |
    CLC                 ; $06D788   |
    ADC $76,x           ; $06D789   |
    CMP $7900,x         ; $06D78B   |
    BCC CODE_06D79D     ; $06D78E   |

CODE_06D790:
    LDA $0E             ; $06D790   |
    AND #$FFF0          ; $06D792   |
    ORA #$8002          ; $06D795   |
    STA $0E             ; $06D798   |
    LDA $7900,x         ; $06D79A   |

CODE_06D79D:
    STA $76,x           ; $06D79D   |
    LDX $12             ; $06D79F   |
    RTS                 ; $06D7A1   |

DATA_06D7A2:         dw $1800, $1800

DATA_06D7A6:         dw $0000, $8003

DATA_06D7AA:         db $0E, $0D, $0C, $05
DATA_06D7AE:         db $06, $07, $01, $01
DATA_06D7B2:         db $01, $01, $01, $01

; dangling ghost sub
    LDA $0E             ; $06D7B6   |
    BPL CODE_06D7C7     ; $06D7B8   |
    AND #$7FFF          ; $06D7BA   |
    STA $0E             ; $06D7BD   |
    LDA #$0006          ; $06D7BF   |
    STA $16,x           ; $06D7C2   |
    STZ $7A96,x         ; $06D7C4   |

CODE_06D7C7:
    LDA $7A96,x         ; $06D7C7   |
    BNE CODE_06D7E6     ; $06D7CA   |
    LDA $16,x           ; $06D7CC   |
    BEQ CODE_06D7E6     ; $06D7CE   |
    DEC A               ; $06D7D0   |
    STA $16,x           ; $06D7D1   |
    TAY                 ; $06D7D3   |
    LDA $D7AA,y         ; $06D7D4   |
    AND #$00FF          ; $06D7D7   |
    STA $7402,x         ; $06D7DA   |
    LDA $D7B0,y         ; $06D7DD   |
    AND #$00FF          ; $06D7E0   |
    STA $7A96,x         ; $06D7E3   |

CODE_06D7E6:
    LDY #$00            ; $06D7E6   |
    LDA $0E             ; $06D7E8   |
    BIT #$0020          ; $06D7EA   |
    BEQ CODE_06D7F1     ; $06D7ED   |
    LDY #$02            ; $06D7EF   |

CODE_06D7F1:
    LDA $76,x           ; $06D7F1   |
    SEC                 ; $06D7F3   |
    SBC #$0400          ; $06D7F4   |
    CMP $D7A2,y         ; $06D7F7   |
    BCS CODE_06D835     ; $06D7FA   |
    LDA $18,x           ; $06D7FC   |
    SEC                 ; $06D7FE   |
    SBC #$4000          ; $06D7FF   |
    XBA                 ; $06D802   |
    AND #$00FF          ; $06D803   |
    EOR #$FFFF          ; $06D806   |
    INC A               ; $06D809   |
    CLC                 ; $06D80A   |
    ADC #$0400          ; $06D80B   |
    STA $78,x           ; $06D80E   |
    PHY                 ; $06D810   |
    LDY #$00            ; $06D811   |
    LDA $0E             ; $06D813   |
    BIT #$0020          ; $06D815   |
    BEQ CODE_06D822     ; $06D818   |
    LDA #$0100          ; $06D81A   |
    STA $7A98,x         ; $06D81D   |
    LDY #$02            ; $06D820   |

CODE_06D822:
    LDA $0E             ; $06D822   |
    AND #$FFD0          ; $06D824   |
    ORA $D7A6,y         ; $06D827   |
    STA $0E             ; $06D82A   |
    PLY                 ; $06D82C   |
    ORA #$0000          ; $06D82D   |
    BMI CODE_06D842     ; $06D830   |
    LDA $D7A2,y         ; $06D832   |

CODE_06D835:
    STA $76,x           ; $06D835   |
    LDX $12             ; $06D837   |
    RTS                 ; $06D839   |

DATA_06D83A:         db $10, $11, $10, $0F

DATA_06D83E:         db $02, $20, $02, $10

; dangling ghost sub

CODE_06D842:
    LDA $0E             ; $06D842   |
    BPL CODE_06D859     ; $06D844   |
    AND #$7FFF          ; $06D846   |
    STA $0E             ; $06D849   |
    LDA #$0004          ; $06D84B   |
    STA $16,x           ; $06D84E   |
    STZ $7A96,x         ; $06D850   |
    LDA #$0100          ; $06D853   |
    STA $7A98,x         ; $06D856   |

CODE_06D859:
    LDA $7A96,x         ; $06D859   |
    BNE CODE_06D887     ; $06D85C   |
    DEC $16,x           ; $06D85E   |
    BPL CODE_06D867     ; $06D860   |
    LDA #$0003          ; $06D862   |
    STA $16,x           ; $06D865   |

CODE_06D867:
    LDY $16,x           ; $06D867   |
    LDA $D83A,y         ; $06D869   |
    AND #$00FF          ; $06D86C   |
    STA $7402,x         ; $06D86F   |
    LDA $D83E,y         ; $06D872   |
    AND #$00FF          ; $06D875   |
    STA $7A96,x         ; $06D878   |
    LDA $7A98,x         ; $06D87B   |
    BNE CODE_06D887     ; $06D87E   |
    LDA $0E             ; $06D880   |
    AND #$FFF0          ; $06D882   |
    STA $0E             ; $06D885   |

CODE_06D887:
    RTS                 ; $06D887   |

; dangling ghost sub

CODE_06D888:
    LDA $7680,x         ; $06D888   |
    CLC                 ; $06D88B   |
    ADC #$0050          ; $06D88C   |
    CMP #$01A0          ; $06D88F   |
    BCS CODE_06D90F     ; $06D892   |
    TXA                 ; $06D894   |
    STA $6012           ; $06D895   |
    LDA $60B0           ; $06D898   |
    STA $6014           ; $06D89B   |
    LDA $60B2           ; $06D89E   |
    STA $6016           ; $06D8A1   |
    LDA $60C2           ; $06D8A4   |
    STA $6018           ; $06D8A7   |
    LDX #$0A            ; $06D8AA   |
    LDA #$8390          ; $06D8AC   |
    JSL $7EDE44         ; $06D8AF   |
    LDA $601A           ; $06D8B3   |
    BEQ CODE_06D8F4     ; $06D8B6   |
    LDX $12             ; $06D8B8   |
    LDY #$00            ; $06D8BA   |
    LDA $70E2,x         ; $06D8BC   |
    CMP $608C           ; $06D8BF   |
    BMI CODE_06D8C6     ; $06D8C2   |
    LDY #$02            ; $06D8C4   |

CODE_06D8C6:
    LDA $D912,y         ; $06D8C6   |
    CLC                 ; $06D8C9   |
    ADC $60B4           ; $06D8CA   |
    PHA                 ; $06D8CD   |
    SEC                 ; $06D8CE   |
    SBC $D916,y         ; $06D8CF   |
    EOR $D912,y         ; $06D8D2   |
    ASL A               ; $06D8D5   |
    PLA                 ; $06D8D6   |
    BCS CODE_06D8DC     ; $06D8D7   |
    LDA $D916,y         ; $06D8D9   |

CODE_06D8DC:
    STA $60B4           ; $06D8DC   |
    LDA $0E             ; $06D8DF   |
    LDA $0E             ; $06D8E1   |
    PHA                 ; $06D8E3   |
    LDX $12             ; $06D8E4   |
    JSL $03A858         ; $06D8E6   |
    PLA                 ; $06D8EA   |
    STA $0E             ; $06D8EB   |
    LDA #$0400          ; $06D8ED   |
    TSB $0E             ; $06D8F0   |
    LDX $12             ; $06D8F2   |

CODE_06D8F4:
    LDX $12             ; $06D8F4   |
    LDY $7D36,x         ; $06D8F6   |
    DEY                 ; $06D8F9   |
    BMI CODE_06D90F     ; $06D8FA   |
    LDA $7D38,y         ; $06D8FC   |
    BEQ CODE_06D90F     ; $06D8FF   |
    LDA $0E             ; $06D901   |
    PHA                 ; $06D903   |
    TYX                 ; $06D904   |
    JSL $03B25B         ; $06D905   |
    PLA                 ; $06D909   |
    ORA #$0800          ; $06D90A   |
    STA $0E             ; $06D90D   |

CODE_06D90F:
    LDX $12             ; $06D90F   |
    RTS                 ; $06D911   |

DATA_06D912:         dw $0100
DATA_06D914:         dw $FF00

DATA_06D916:         dw $0200
DATA_06D918:         dw $FE00

; caged ghost sub

CODE_06D91A:
    TXA                 ; $06D91A   |
    STA $6012           ; $06D91B   |
    LDA $60B0           ; $06D91E   |
    STA $6014           ; $06D921   |
    LDA $60B2           ; $06D924   |
    STA $6016           ; $06D927   |
    LDA $60C2           ; $06D92A   |
    STA $6018           ; $06D92D   |
    LDX #$0A            ; $06D930   |
    LDA #$8390          ; $06D932   |
    JSL $7EDE44         ; $06D935   | sfx
    LDA $601A           ; $06D939   |
    BEQ CODE_06D976     ; $06D93C   |
    LDX $12             ; $06D93E   |
    LDY #$00            ; $06D940   |
    LDA $70E2,x         ; $06D942   |
    CMP $608C           ; $06D945   |
    BMI CODE_06D94C     ; $06D948   |
    LDY #$02            ; $06D94A   |

CODE_06D94C:
    LDA $D912,y         ; $06D94C   |
    CLC                 ; $06D94F   |
    ADC $60B4           ; $06D950   |
    PHA                 ; $06D953   |
    SEC                 ; $06D954   |
    SBC $D916,y         ; $06D955   |
    EOR $D912,y         ; $06D958   |
    ASL A               ; $06D95B   |
    PLA                 ; $06D95C   |
    BCS CODE_06D962     ; $06D95D   |
    LDA $D916,y         ; $06D95F   |

CODE_06D962:
    STA $60B4           ; $06D962   |
    LDA $0E             ; $06D965   |
    PHA                 ; $06D967   |
    LDX $12             ; $06D968   |
    JSL $03A858         ; $06D96A   |
    PLA                 ; $06D96E   |
    ORA #$0400          ; $06D96F   |
    STA $0E             ; $06D972   |
    LDX $12             ; $06D974   |

CODE_06D976:
    LDA $6014           ; $06D976   |
    BEQ CODE_06D9A2     ; $06D979   |
    LDX $12             ; $06D97B   |
    LDY #$00            ; $06D97D   |
    LDA $70E2,x         ; $06D97F   |
    CMP $70E2           ; $06D982   |
    BMI CODE_06D989     ; $06D985   |
    LDY #$02            ; $06D987   |

CODE_06D989:
    LDA $D912,y         ; $06D989   |
    CLC                 ; $06D98C   |
    ADC $7220           ; $06D98D   |
    PHA                 ; $06D990   |
    SEC                 ; $06D991   |
    SBC $D916,y         ; $06D992   |
    EOR $D912,y         ; $06D995   |
    ASL A               ; $06D998   |
    PLA                 ; $06D999   |
    BCS CODE_06D99F     ; $06D99A   |
    LDA $D916,y         ; $06D99C   |

CODE_06D99F:
    STA $7220           ; $06D99F   |

CODE_06D9A2:
    LDX $12             ; $06D9A2   |
    LDY $7D36,x         ; $06D9A4   |
    DEY                 ; $06D9A7   |
    BMI CODE_06D9BD     ; $06D9A8   |
    LDA $7D38,y         ; $06D9AA   |
    BEQ CODE_06D9BD     ; $06D9AD   |
    LDA $0E             ; $06D9AF   |
    PHA                 ; $06D9B1   |
    TYX                 ; $06D9B2   |
    JSL $03B25B         ; $06D9B3   |
    PLA                 ; $06D9B7   |
    ORA #$0800          ; $06D9B8   |
    STA $0E             ; $06D9BB   |

CODE_06D9BD:
    LDX $12             ; $06D9BD   |
    RTS                 ; $06D9BF   |

.init_caged_ghost_sewer
    LDA #$0000          ; $06D9C0   |
    STA $6040           ; $06D9C3   |
    LDA #$0000          ; $06D9C6   |
    STA $6042           ; $06D9C9   |
    RTL                 ; $06D9CC   |

.main_caged_ghost_sewer
    JSR CODE_06DA01     ; $06D9CD   |
    JSR CODE_06DBA5     ; $06D9D0   |
    JSR CODE_06DC4D     ; $06D9D3   |
    JSL $03AF23         ; $06D9D6   |
    LDA $7680,x         ; $06D9DA   |
    CLC                 ; $06D9DD   |
    ADC #$0200          ; $06D9DE   |
    CMP #$0400          ; $06D9E1   |
    BCS CODE_06D9F2     ; $06D9E4   |
    LDA $7682,x         ; $06D9E6   |
    CLC                 ; $06D9E9   |
    ADC #$01A0          ; $06D9EA   |
    CMP #$0300          ; $06D9ED   |
    BCC CODE_06D9F8     ; $06D9F0   |

CODE_06D9F2:
    JSL $03A31E         ; $06D9F2   |
    BRA CODE_06D9FE     ; $06D9F6   |

CODE_06D9F8:
    JSR CODE_06DC84     ; $06D9F8   |
    JSR CODE_06DD53     ; $06D9FB   |

CODE_06D9FE:
    LDX $12             ; $06D9FE   |
    RTL                 ; $06DA00   |

; caged ghost sewer sub

CODE_06DA01:
    LDA $18,x           ; $06DA01   |
    XBA                 ; $06DA03   |
    AND #$00FF          ; $06DA04   |
    ASL A               ; $06DA07   |
    TAX                 ; $06DA08   |
    LDA $DA55,x         ; $06DA09   |
    STA $00             ; $06DA0C   |
    LDA $DA57,x         ; $06DA0E   |
    STA $02             ; $06DA11   |
    LDY #$34            ; $06DA13   |

CODE_06DA15:
    TYA                 ; $06DA15   |
    ASL A               ; $06DA16   |
    TAX                 ; $06DA17   |
    LDA ($00),y         ; $06DA18   |
    AND #$00FF          ; $06DA1A   |
    SEC                 ; $06DA1D   |
    SBC #$00E0          ; $06DA1E   |
    STA $7049F6,x       ; $06DA21   |
    LDA ($02),y         ; $06DA25   |
    AND #$00FF          ; $06DA27   |
    SEC                 ; $06DA2A   |
    SBC #$00E0          ; $06DA2B   |
    STA $704B36,x       ; $06DA2E   |
    LDA ($00),y         ; $06DA32   |
    AND #$FF00          ; $06DA34   |
    XBA                 ; $06DA37   |
    SEC                 ; $06DA38   |
    SBC #$0050          ; $06DA39   |
    STA $7049F8,x       ; $06DA3C   |
    LDA ($02),y         ; $06DA40   |
    AND #$FF00          ; $06DA42   |
    XBA                 ; $06DA45   |
    SEC                 ; $06DA46   |
    SBC #$0050          ; $06DA47   |
    STA $704B38,x       ; $06DA4A   |
    DEY                 ; $06DA4E   |
    DEY                 ; $06DA4F   |
    BPL CODE_06DA15     ; $06DA50   |
    LDX $12             ; $06DA52   |
    RTS                 ; $06DA54   |

; caged ghost sewer data pointers
DATA_06DA55:         dw $DA61
DATA_06DA57:         dw $DA97
DATA_06DA59:         dw $DACD
DATA_06DA5B:         dw $DB03
DATA_06DA5D:         dw $DB39
DATA_06DA5F:         dw $DB6F

; caged ghost sewer data
DATA_06DA61:         dw $50E0, $5FE0, $5F80, $5F72
DATA_06DA69:         dw $5D6E, $4152, $3F4E, $2F10
DATA_06DA71:         dw $3F10, $3D08, $3802, $3301
DATA_06DA79:         dw $2C01, $2702, $2208, $2010
DATA_06DA81:         dw $2050, $205E, $2262, $3E7E
DATA_06DA89:         dw $4082, $43E0, $47EF, $4CF7
DATA_06DA91:         dw $56FF, $5BFF, $5FFC, $50E0
DATA_06DA99:         dw $5FE0, $5F80, $5F72, $5D6E
DATA_06DAA1:         dw $4152, $3F50, $2F4F, $3F4F
DATA_06DAA9:         dw $3D48, $3842, $3341, $2C41
DATA_06DAB1:         dw $2742, $2248, $2050, $2050
DATA_06DAB9:         dw $205E, $2262, $3E7E, $4082
DATA_06DAC1:         dw $43E0, $47EF, $4CF7, $56FF
DATA_06DAC9:         dw $5BFF, $5FFC, $50E0, $5FE0
DATA_06DAD1:         dw $5F80, $5F72, $5D6E, $3E50
DATA_06DAD9:         dw $3E50, $345B, $3E4F, $394C
DATA_06DAE1:         dw $304B, $2B4D, $2553, $235D
DATA_06DAE9:         dw $2462, $2868, $2868, $2868
DATA_06DAF1:         dw $2868, $2868, $4082, $43E0
DATA_06DAF9:         dw $47EF, $4CF7, $56FF, $5BFF
DATA_06DB01:         dw $5FFC, $50E0, $5FE0, $5F80
DATA_06DB09:         dw $5F80, $5869, $5869, $5869
DATA_06DB11:         dw $4C73, $5868, $5164, $4863
DATA_06DB19:         dw $4365, $3D6B, $3B75, $3C7A
DATA_06DB21:         dw $407F, $407F, $407F, $407F
DATA_06DB29:         dw $407F, $4082, $43E0, $47EF
DATA_06DB31:         dw $4CF7, $56FF, $5BFF, $5FFC
DATA_06DB39:         dw $50E0, $5FE0, $5F80, $5F80
DATA_06DB41:         dw $5F80, $5F80, $5F80, $4F7F
DATA_06DB49:         dw $5F7F, $5D78, $5872, $5371
DATA_06DB51:         dw $4C71, $4772, $4278, $4080
DATA_06DB59:         dw $4080, $4080, $4080, $4080
DATA_06DB61:         dw $4080, $43E0, $47EF, $4CF7
DATA_06DB69:         dw $56FF, $5BFF, $5FFC, $50E0
DATA_06DB71:         dw $60E0, $60E0, $60E0, $60E0
DATA_06DB79:         dw $60E0, $60E0, $51E0, $60DF
DATA_06DB81:         dw $5ED8, $59D2, $54D1, $4DD1
DATA_06DB89:         dw $48D2, $43D8, $41E0, $41E0
DATA_06DB91:         dw $41E0, $41E0, $41E0, $41E0
DATA_06DB99:         dw $41E0, $48EF, $4DF7, $57FF
DATA_06DBA1:         dw $5CFF, $60FC

; caged ghost sewer sub

CODE_06DBA5:
    LDA $7902,x         ; $06DBA5   |
    STA $0E             ; $06DBA8   |
    LDA $7680,x         ; $06DBAA   |
    CMP #$0100          ; $06DBAD   |
    BCC CODE_06DBBA     ; $06DBB0   |
    CMP #$FF00          ; $06DBB2   |
    BCS CODE_06DBBA     ; $06DBB5   |
    JMP CODE_06DC37     ; $06DBB7   |

CODE_06DBBA:
    CLC                 ; $06DBBA   |
    ADC #$00E0          ; $06DBBB   |
    STA $6040           ; $06DBBE   |
    LDA $7682,x         ; $06DBC1   |
    CMP #$0200          ; $06DBC4   |
    BCC CODE_06DBCE     ; $06DBC7   |
    CMP #$FF00          ; $06DBC9   |
    BCC CODE_06DC37     ; $06DBCC   |

CODE_06DBCE:
    CLC                 ; $06DBCE   |
    ADC #$0020          ; $06DBCF   |
    STA $6042           ; $06DBD2   |
    LDA #$49F6          ; $06DBD5   |
    STA $3002           ; $06DBD8   |
    LDA #$4B36          ; $06DBDB   |
    STA $3004           ; $06DBDE   |
    LDA #$001B          ; $06DBE1   |
    STA $3006           ; $06DBE4   |
    STZ $3008           ; $06DBE7   |
    LDA #$449E          ; $06DBEA   |
    STA $300A           ; $06DBED   |
    LDA $18,x           ; $06DBF0   |
    AND #$00FF          ; $06DBF2   |
    STA $300C           ; $06DBF5   |
    LDA #$0000          ; $06DBF8   |
    STA $605E           ; $06DBFB   |
    LDX #$08            ; $06DBFE   |
    LDA #$E8CA          ; $06DC00   |
    JSL $7EDE44         ; $06DC03   |
    JSL $00BE39         ; $06DC07   |

; DMA args
DATA_06DC0B:         dl $7E5040, $703372
DATA_06DC11:         dw $0348

    SEP #$30            ; $06DC13   |
    LDA #$13            ; $06DC15   |
    STA $0967           ; $06DC17   |
    LDA #$04            ; $06DC1A   |
    STA $0968           ; $06DC1C   |
    LDA #$22            ; $06DC1F   |
    STA $096B           ; $06DC21   |
    LDA #$63            ; $06DC24   |
    STA $096C           ; $06DC26   |
    LDA #$18            ; $06DC29   |
    TSB $094A           ; $06DC2B   |
    REP #$20            ; $06DC2E   |
    LDA #$0008          ; $06DC30   |
    TSB $0E             ; $06DC33   |
    BRA CODE_06DC45     ; $06DC35   |

CODE_06DC37:
    SEP #$20            ; $06DC37   |
    LDA #$04            ; $06DC39   |
    TRB $0968           ; $06DC3B   |
    REP #$20            ; $06DC3E   |
    LDA #$0008          ; $06DC40   |
    TRB $0E             ; $06DC43   |

CODE_06DC45:
    LDX $12             ; $06DC45   |
    LDA $0E             ; $06DC47   |
    STA $7902,x         ; $06DC49   |
    RTS                 ; $06DC4C   |

; caged ghost sewer sub

CODE_06DC4D:
    STZ $7400,x         ; $06DC4D   |
    REP #$10            ; $06DC50   |
    LDY $7362,x         ; $06DC52   |
    LDX #$000C          ; $06DC55   |

CODE_06DC58:
    LDA $6000,y         ; $06DC58   |
    CLC                 ; $06DC5B   |
    ADC $7044BA         ; $06DC5C   |
    CLC                 ; $06DC60   |
    ADC #$00DE          ; $06DC61   |
    STA $6000,y         ; $06DC64   |
    LDA $6002,y         ; $06DC67   |
    CLC                 ; $06DC6A   |
    ADC $7044BC         ; $06DC6B   |
    CLC                 ; $06DC6F   |
    ADC #$0018          ; $06DC70   |
    STA $6002,y         ; $06DC73   |
    TYA                 ; $06DC76   |
    CLC                 ; $06DC77   |
    ADC #$0008          ; $06DC78   |
    TAY                 ; $06DC7B   |
    DEX                 ; $06DC7C   |
    BNE CODE_06DC58     ; $06DC7D   |
    SEP #$10            ; $06DC7F   |
    LDX $12             ; $06DC81   |
    RTS                 ; $06DC83   |

; caged ghost sewer sub

CODE_06DC84:
    LDA $7902,x         ; $06DC84   |
    BIT #$0008          ; $06DC87   |
    BNE CODE_06DC8F     ; $06DC8A   |
    JMP CODE_06DD48     ; $06DC8C   |

CODE_06DC8F:
    LDA $7902,x         ; $06DC8F   |
    AND #$F7FF          ; $06DC92   |
    STA $7902,x         ; $06DC95   |
    TXA                 ; $06DC98   |
    STA $6012           ; $06DC99   |
    LDA $60B0           ; $06DC9C   |
    STA $6014           ; $06DC9F   |
    LDA $60B2           ; $06DCA2   |
    STA $6016           ; $06DCA5   |
    LDA $60C2           ; $06DCA8   |
    STA $6018           ; $06DCAB   |
    LDX #$0A            ; $06DCAE   |
    LDA #$8390          ; $06DCB0   |
    JSL $7EDE44         ; $06DCB3   |
    LDX $12             ; $06DCB7   |
    LDA $601A           ; $06DCB9   |
    BEQ CODE_06DCF4     ; $06DCBC   |
    LDY #$00            ; $06DCBE   |
    LDA $70E2,x         ; $06DCC0   |
    CLC                 ; $06DCC3   |
    ADC #$00E0          ; $06DCC4   |
    ASL A               ; $06DCC7   |
    CLC                 ; $06DCC8   |
    ADC $7044BA         ; $06DCC9   |
    LSR A               ; $06DCCD   |
    CMP $608C           ; $06DCCE   |
    BMI CODE_06DCD5     ; $06DCD1   |
    LDY #$02            ; $06DCD3   |

CODE_06DCD5:
    LDA $DD4B,y         ; $06DCD5   |
    CLC                 ; $06DCD8   |
    ADC $60B4           ; $06DCD9   |
    PHA                 ; $06DCDC   |
    SEC                 ; $06DCDD   |
    SBC $DD4F,y         ; $06DCDE   |
    EOR $DD4B,y         ; $06DCE1   |
    ASL A               ; $06DCE4   |
    PLA                 ; $06DCE5   |
    BCS CODE_06DCEB     ; $06DCE6   |
    LDA $DD4F,y         ; $06DCE8   |

CODE_06DCEB:
    STA $60B4           ; $06DCEB   |
    LDX $12             ; $06DCEE   |
    JSL $03A858         ; $06DCF0   |

CODE_06DCF4:
    LDA $6014           ; $06DCF4   |
    BEQ CODE_06DD2B     ; $06DCF7   |
    LDX $12             ; $06DCF9   |
    LDY #$00            ; $06DCFB   |
    LDA $70E2,x         ; $06DCFD   |
    CLC                 ; $06DD00   |
    ADC #$00E0          ; $06DD01   |
    ASL A               ; $06DD04   |
    CLC                 ; $06DD05   |
    ADC $7044BA         ; $06DD06   |
    LSR A               ; $06DD0A   |
    CMP $70E2           ; $06DD0B   |
    BMI CODE_06DD12     ; $06DD0E   |
    LDY #$02            ; $06DD10   |

CODE_06DD12:
    LDA $DD4B,y         ; $06DD12   |
    CLC                 ; $06DD15   |
    ADC $7220           ; $06DD16   |
    PHA                 ; $06DD19   |
    SEC                 ; $06DD1A   |
    SBC $DD4F,y         ; $06DD1B   |
    EOR $DD4B,y         ; $06DD1E   |
    ASL A               ; $06DD21   |
    PLA                 ; $06DD22   |
    BCS CODE_06DD28     ; $06DD23   |
    LDA $DD4F,y         ; $06DD25   |

CODE_06DD28:
    STA $7220           ; $06DD28   |

CODE_06DD2B:
    LDX $12             ; $06DD2B   |
    LDY $7D36,x         ; $06DD2D   |
    DEY                 ; $06DD30   |
    BMI CODE_06DD48     ; $06DD31   |
    LDA $7D38,y         ; $06DD33   |
    BEQ CODE_06DD48     ; $06DD36   |
    TYX                 ; $06DD38   |
    JSL $03B24B         ; $06DD39   |
    LDX $12             ; $06DD3D   |
    LDA $7902,x         ; $06DD3F   |
    ORA #$0800          ; $06DD42   |
    STA $7902,x         ; $06DD45   |

CODE_06DD48:
    LDX $12             ; $06DD48   |
    RTS                 ; $06DD4A   |

DATA_06DD4B:         dw $0100, $FF00

DATA_06DD4F:         dw $0200, $FE00

; caged ghost sewer sub

CODE_06DD53:
    LDA $7902,x         ; $06DD53   |
    STA $0E             ; $06DD56   |
    BIT #$0800          ; $06DD58   |
    BEQ CODE_06DD74     ; $06DD5B   |
    LDA #$0010          ; $06DD5D   |
    STA $7A96,x         ; $06DD60   |
    LDA $0E             ; $06DD63   |
    AND #$FFF8          ; $06DD65   |
    ORA #$0401          ; $06DD68   |
    STA $0E             ; $06DD6B   |
    LDA #$0079          ; $06DD6D   |
    JSL $0085D2         ; $06DD70   |

CODE_06DD74:
    AND #$0007          ; $06DD74   |
    ASL A               ; $06DD77   |
    TAY                 ; $06DD78   |
    LDA $DD98,y         ; $06DD79   |
    STA $00             ; $06DD7C   |
    PER $0002  [$DD83]  ; $06DD7E   |
    JMP ($7960)         ; $06DD81   | sub
    LDA $0E             ; $06DD84   |
    AND #$7FFF          ; $06DD86   |
    BIT #$4000          ; $06DD89   |
    BEQ CODE_06DD94     ; $06DD8C   |
    AND #$BFFF          ; $06DD8E   |
    ORA #$8000          ; $06DD91   |

CODE_06DD94:
    STA $7902,x         ; $06DD94   |
    RTS                 ; $06DD97   |

; caged ghost sewer routine table
DATA_06DD98:         dw $DDA2
DATA_06DD9A:         dw $DE59
DATA_06DD9C:         dw $DE9F
DATA_06DD9E:         dw $DF02
DATA_06DDA0:         dw $DFB2

; caged ghost sewer sub
    LDA $7AF8,x         ; $06DDA2   |
    BEQ CODE_06DDA8     ; $06DDA5   |
    RTS                 ; $06DDA7   |

CODE_06DDA8:
    LDA $18,x           ; $06DDA8   |
    BEQ CODE_06DDCE     ; $06DDAA   |
    JSL $008408         ; $06DDAC   |
    LDA $10             ; $06DDB0   |
    BIT #$001F          ; $06DDB2   |
    BNE CODE_06DDCE     ; $06DDB5   |
    AND #$0001          ; $06DDB7   |
    CLC                 ; $06DDBA   |
    ADC #$001C          ; $06DDBB   |
    STA $7A96,x         ; $06DDBE   |
    LDA $0E             ; $06DDC1   |
    AND #$FFF8          ; $06DDC3   |
    ORA #$0002          ; $06DDC6   |
    STA $0E             ; $06DDC9   |
    JMP CODE_06DE9F     ; $06DDCB   |

CODE_06DDCE:
    LDA $7A98,x         ; $06DDCE   |
    BNE CODE_06DE29     ; $06DDD1   |
    LDA #$00F3          ; $06DDD3   |
    STA $3008           ; $06DDD6   |
    INC A               ; $06DDD9   |
    STA $300A           ; $06DDDA   |
    LDX #$09            ; $06DDDD   |
    LDA #$91DB          ; $06DDDF   |
    JSL $7EDE44         ; $06DDE2   |
    LDX $12             ; $06DDE6   |
    LDA $300C           ; $06DDE8   |
    CMP #$0003          ; $06DDEB   |
    BCS CODE_06DE29     ; $06DDEE   |
    STA $00             ; $06DDF0   |
    LDX #$09            ; $06DDF2   |
    LDA #$91D5          ; $06DDF4   |
    JSL $7EDE44         ; $06DDF7   |
    LDX $12             ; $06DDFB   |
    LDA $300C           ; $06DDFD   |
    CLC                 ; $06DE00   |
    ADC $00             ; $06DE01   |
    CMP #$0006          ; $06DE03   |
    BCS CODE_06DE2B     ; $06DE06   |
    PHA                 ; $06DE08   |
    LDA $0E             ; $06DE09   |
    AND #$FFF8          ; $06DE0B   |
    ORA #$8003          ; $06DE0E   |
    STA $0E             ; $06DE11   |
    PLA                 ; $06DE13   |
    LDY #$00            ; $06DE14   |
    CMP #$0005          ; $06DE16   |
    BCC CODE_06DE1D     ; $06DE19   |
    LDY #$02            ; $06DE1B   |

CODE_06DE1D:
    LDA $DE25,y         ; $06DE1D   |
    STA $78,x           ; $06DE20   |
    JMP CODE_06DF02     ; $06DE22   |

DATA_06DE25:         dw $0002, $0001

CODE_06DE29:
    LDX $12             ; $06DE29   |

CODE_06DE2B:
    LDA $0E             ; $06DE2B   |
    BPL CODE_06DE34     ; $06DE2D   |
    STZ $76,x           ; $06DE2F   |
    STZ $7A96,x         ; $06DE31   |

CODE_06DE34:
    LDA $7A96,x         ; $06DE34   |
    BNE CODE_06DE53     ; $06DE37   |
    LDA $76,x           ; $06DE39   |
    BNE CODE_06DE42     ; $06DE3B   |
    LDA #$0006          ; $06DE3D   |
    STA $76,x           ; $06DE40   |

CODE_06DE42:
    TAY                 ; $06DE42   |
    LDA $DFF3,y         ; $06DE43   |
    STA $7402,x         ; $06DE46   |
    LDA $DFFB,y         ; $06DE49   |
    STA $7A96,x         ; $06DE4C   |
    DEC $76,x           ; $06DE4F   |
    DEC $76,x           ; $06DE51   |

CODE_06DE53:
    RTS                 ; $06DE53   |

DATA_06DE54:         db $0C, $30, $18, $30
DATA_06DE58:         db $0C

; caged ghost sewer sub
    LDA #$000E          ; $06DE59   |
    STA $7402,x         ; $06DE5C   |
    LDA $7A96,x         ; $06DE5F   |
    BNE CODE_06DE7A     ; $06DE62   |
    LDA #$0407          ; $06DE64   |
    TRB $0E             ; $06DE67   |
    LDA #$0020          ; $06DE69   |
    STA $7AF8,x         ; $06DE6C   |
    LDA #$0180          ; $06DE6F   |
    STA $7A98,x         ; $06DE72   |
    STZ $7A96,x         ; $06DE75   |
    STZ $76,x           ; $06DE78   |

CODE_06DE7A:
    LDA $18,x           ; $06DE7A   |
    XBA                 ; $06DE7C   |
    AND #$00FF          ; $06DE7D   |
    TAY                 ; $06DE80   |
    LDA $DE54,y         ; $06DE81   |
    AND #$00FF          ; $06DE84   |
    CLC                 ; $06DE87   |
    ADC $18,x           ; $06DE88   |
    CMP #$0500          ; $06DE8A   |
    BCC CODE_06DE9C     ; $06DE8D   |
    LDA $0E             ; $06DE8F   |
    AND #$FFF8          ; $06DE91   |
    ORA #$4004          ; $06DE94   |
    STA $0E             ; $06DE97   |
    LDA #$04FF          ; $06DE99   |

CODE_06DE9C:
    STA $18,x           ; $06DE9C   |
    RTS                 ; $06DE9E   |

; caged ghost sewer sub

CODE_06DE9F:
    LDA $7A96,x         ; $06DE9F   |
    BNE CODE_06DEAE     ; $06DEA2   |
    LDA $0E             ; $06DEA4   |
    AND #$FFF8          ; $06DEA6   |
    ORA #$4000          ; $06DEA9   |
    STA $0E             ; $06DEAC   |

CODE_06DEAE:
    LDA #$0005          ; $06DEAE   |
    STA $7402,x         ; $06DEB1   |
    LDA #$00C0          ; $06DEB4   |
    STA $0051           ; $06DEB7   |
    LDA $18,x           ; $06DEBA   |
    XBA                 ; $06DEBC   |
    AND #$00FF          ; $06DEBD   |
    ASL A               ; $06DEC0   |
    TAY                 ; $06DEC1   |
    LDA $DEDA,y         ; $06DEC2   |
    CLC                 ; $06DEC5   |
    ADC $18,x           ; $06DEC6   |
    BPL CODE_06DED7     ; $06DEC8   |
    LDA $0E             ; $06DECA   |
    AND #$FFF8          ; $06DECC   |
    ORA #$4000          ; $06DECF   |
    STA $0E             ; $06DED2   |
    LDA #$0000          ; $06DED4   |

CODE_06DED7:
    STA $18,x           ; $06DED7   |
    RTS                 ; $06DED9   |

DATA_06DEDA:         dw $FFFE, $FFF8
DATA_06DEDE:         dw $FFFC, $FFF8
DATA_06DEE2:         dw $FFFE

DATA_06DEE4:         db $07, $06, $05, $04
DATA_06DEE8:         db $03, $02, $0A, $0B
DATA_06DEEC:         db $0A, $01, $02, $03
DATA_06DEF0:         db $04, $05, $06, $01
DATA_06DEF4:         db $01, $01, $01, $01
DATA_06DEF8:         db $01, $02, $0A, $02
DATA_06DEFC:         db $01, $01, $01, $01
DATA_06DF00:         db $01, $01

; caged ghost sewer sub

CODE_06DF02:
    LDA $0E             ; $06DF02   |
    BPL CODE_06DF0B     ; $06DF04   |
    STZ $76,x           ; $06DF06   |
    STZ $7A96,x         ; $06DF08   |

CODE_06DF0B:
    LDA $7A96,x         ; $06DF0B   |
    BEQ CODE_06DF13     ; $06DF0E   |
    JMP CODE_06DFB1     ; $06DF10   |

CODE_06DF13:
    LDY $76,x           ; $06DF13   |
    CPY #$0F            ; $06DF15   |
    BCC CODE_06DF37     ; $06DF17   |
    DEC $78,x           ; $06DF19   |
    BEQ CODE_06DF25     ; $06DF1B   |
    LDA #$4000          ; $06DF1D   |
    TSB $0E             ; $06DF20   |
    JMP CODE_06DFB1     ; $06DF22   |

CODE_06DF25:
    LDA #$0060          ; $06DF25   |
    STA $7A98,x         ; $06DF28   |
    LDA $0E             ; $06DF2B   |
    AND #$BFF8          ; $06DF2D   |
    ORA #$4000          ; $06DF30   |
    STA $0E             ; $06DF33   |
    BRA CODE_06DFB1     ; $06DF35   |

CODE_06DF37:
    LDA $DEF3,y         ; $06DF37   |
    AND #$00FF          ; $06DF3A   |
    STA $7A96,x         ; $06DF3D   |
    CPY #$0E            ; $06DF40   |
    BNE CODE_06DF55     ; $06DF42   |
    LDA $78,x           ; $06DF44   |
    CMP #$0001          ; $06DF46   |
    BEQ CODE_06DF55     ; $06DF49   |
    LDA $7A96,x         ; $06DF4B   |
    CLC                 ; $06DF4E   |
    ADC #$0040          ; $06DF4F   |
    STA $7A96,x         ; $06DF52   |

CODE_06DF55:
    LDA $DEE4,y         ; $06DF55   |
    AND #$00FF          ; $06DF58   |
    STA $7402,x         ; $06DF5B   |
    CPY #$07            ; $06DF5E   |
    BNE CODE_06DFAF     ; $06DF60   |
    LDA #$0077          ; $06DF62   |
    JSL $0085D2         ; $06DF65   |
    LDA #$00F3          ; $06DF69   |
    JSL $03A34C         ; $06DF6C   |
    LDA $70E2,x         ; $06DF70   |
    CLC                 ; $06DF73   |
    ADC $7044BA         ; $06DF74   |
    CLC                 ; $06DF78   |
    ADC #$00CC          ; $06DF79   |
    STA $70E2,y         ; $06DF7C   |
    LDA $7182,x         ; $06DF7F   |
    CLC                 ; $06DF82   |
    ADC $7044BC         ; $06DF83   |
    CLC                 ; $06DF87   |
    ADC #$001E          ; $06DF88   |
    STA $7182,y         ; $06DF8B   |
    LDA #$FE00          ; $06DF8E   |
    STA $7220,y         ; $06DF91   |
    LDA #$FD80          ; $06DF94   |
    STA $7222,y         ; $06DF97   |
    SEP #$20            ; $06DF9A   |
    LDA #$01            ; $06DF9C   |
    STA $7900,y         ; $06DF9E   |
    LDX #$04            ; $06DFA1   |
    STX $76,y           ; $06DFA3   |
    REP #$20            ; $06DFA5   |
    LDA #$0000          ; $06DFA7   |
    STA $7400,y         ; $06DFAA   |
    LDX $12             ; $06DFAD   |

CODE_06DFAF:
    INC $76,x           ; $06DFAF   |

CODE_06DFB1:
    RTS                 ; $06DFB1   |

; caged ghost sewer sub
    LDA $0E             ; $06DFB2   |
    BPL CODE_06DFBB     ; $06DFB4   |
    STZ $7A96,x         ; $06DFB6   |
    STZ $76,x           ; $06DFB9   |

CODE_06DFBB:
    LDA $7A96,x         ; $06DFBB   |
    BNE CODE_06DFF2     ; $06DFBE   |
    LDA $76,x           ; $06DFC0   |
    BNE CODE_06DFC9     ; $06DFC2   |
    LDA #$0012          ; $06DFC4   |
    STA $76,x           ; $06DFC7   |

CODE_06DFC9:
    TAY                 ; $06DFC9   |
    LDA $E017,y         ; $06DFCA   |
    STA $7A96,x         ; $06DFCD   |
    LDA $E003,y         ; $06DFD0   |
    STA $7402,x         ; $06DFD3   |
    DEC $76,x           ; $06DFD6   |
    DEC $76,x           ; $06DFD8   |
    BNE CODE_06DFF2     ; $06DFDA   |
    LDA $0E             ; $06DFDC   |
    AND #$FFF8          ; $06DFDE   |
    ORA #$4000          ; $06DFE1   |
    STA $0E             ; $06DFE4   |
    LDA #$0100          ; $06DFE6   |
    STA $7AF8,x         ; $06DFE9   |
    LDA #$0180          ; $06DFEC   |
    STA $7A98,x         ; $06DFEF   |

CODE_06DFF2:
    RTS                 ; $06DFF2   |

DATA_06DFF3:         dw $0008, $0009
DATA_06DFF7:         dw $0008, $0007

DATA_06DFFB:         dw $0004, $0008
DATA_06DFFF:         dw $0004, $000A

DATA_06E003:         dw $000F, $0010
DATA_06E007:         dw $0011, $0010
DATA_06E00B:         dw $000F, $000F
DATA_06E00F:         dw $0010, $0011
DATA_06E013:         dw $0010, $000F
DATA_06E017:         dw $000A, $0002
DATA_06E01B:         dw $0014, $0002
DATA_06E01F:         dw $000A, $000A
DATA_06E023:         dw $0002, $0014
DATA_06E027:         dw $0002, $000A

.init_caged_ghost_round
    LDA #$0020          ; $06E02B   |
    STA $18,x           ; $06E02E   |
    LDA #$0118          ; $06E030   |
    STA $76,x           ; $06E033   |
    LDA #$0003          ; $06E035   |
    STA $7902,x         ; $06E038   |
    LDA #$0008          ; $06E03B   |
    STA $7A96,x         ; $06E03E   |
    LDA #$0008          ; $06E041   |
    STA $16,x           ; $06E044   |
    RTL                 ; $06E046   |

.main_caged_ghost_round
    LDA $7902,x         ; $06E047   |
    STA $0E             ; $06E04A   |
    LDA #$0000          ; $06E04C   |
    STA $0C             ; $06E04F   |
    JSR CODE_06E42F     ; $06E051   |
    JSR CODE_06E48B     ; $06E054   |
    JSR CODE_06E0A5     ; $06E057   |
    LDA $0E             ; $06E05A   |
    STA $7902,x         ; $06E05C   |
    JSL $03AF23         ; $06E05F   |
    LDA $7902,x         ; $06E063   |
    STA $0E             ; $06E066   |
    LDA $7680,x         ; $06E068   |
    CLC                 ; $06E06B   |
    ADC #$0090          ; $06E06C   |
    CMP #$0220          ; $06E06F   |
    BCS CODE_06E080     ; $06E072   |
    LDA $7682,x         ; $06E074   |
    CLC                 ; $06E077   |
    ADC #$0100          ; $06E078   |
    CMP #$0300          ; $06E07B   |
    BCC CODE_06E086     ; $06E07E   |

CODE_06E080:
    JSL $03A31E         ; $06E080   |
    BRA CODE_06E093     ; $06E084   |

CODE_06E086:
    LDA $0E             ; $06E086   |
    BIT #$0400          ; $06E088   |
    BEQ CODE_06E090     ; $06E08B   |
    JSR CODE_06D91A     ; $06E08D   |

CODE_06E090:
    JSR CODE_06E123     ; $06E090   |

CODE_06E093:
    LDX $12             ; $06E093   |
    LDA $0E             ; $06E095   |
    STA $7902,x         ; $06E097   |
    RTL                 ; $06E09A   |

DATA_06E09B:         dw $0078
DATA_06E09D:         dw $0000
DATA_06E09F:         dw $0078
DATA_06E0A1:         dw $0028
DATA_06E0A3:         dw $0078

; caged_ghost_round sub

CODE_06E0A5:
    LDA $7402,x         ; $06E0A5   |
    CMP #$0015          ; $06E0A8   |
    BCS CODE_06E102     ; $06E0AB   |
    LDA $0E             ; $06E0AD   |
    AND #$000F          ; $06E0AF   |
    ASL A               ; $06E0B2   |
    TAY                 ; $06E0B3   |
    LDA $18,x           ; $06E0B4   |
    CMP $E09B,y         ; $06E0B6   | table
    BCC CODE_06E102     ; $06E0B9   |
    CPY #$02            ; $06E0BB   |
    BNE CODE_06E0C6     ; $06E0BD   |
    LDA $0E             ; $06E0BF   |
    BIT #$0200          ; $06E0C1   |
    BEQ CODE_06E102     ; $06E0C4   |

CODE_06E0C6:
    REP #$10            ; $06E0C6   |
    LDA #$FFF8          ; $06E0C8   |
    STA $00             ; $06E0CB   |
    LDA $7044C8         ; $06E0CD   |
    CLC                 ; $06E0D1   |
    ADC #$0010          ; $06E0D2   |
    STA $02             ; $06E0D5   |
    LDY $7362,x         ; $06E0D7   |
    LDX #$000C          ; $06E0DA   |

CODE_06E0DD:
    LDA $6000,y         ; $06E0DD   |
    CLC                 ; $06E0E0   |
    ADC $00             ; $06E0E1   |
    STA $6000,y         ; $06E0E3   |
    LDA $6002,y         ; $06E0E6   |
    CLC                 ; $06E0E9   |
    ADC $02             ; $06E0EA   |
    STA $6002,y         ; $06E0EC   |
    TYA                 ; $06E0EF   |
    CLC                 ; $06E0F0   |
    ADC #$0008          ; $06E0F1   |
    TAY                 ; $06E0F4   |
    DEX                 ; $06E0F5   |
    BNE CODE_06E0DD     ; $06E0F6   |
    SEP #$10            ; $06E0F8   |
    LDA #$0200          ; $06E0FA   |
    TSB $0E             ; $06E0FD   |
    LDX $12             ; $06E0FF   |
    RTS                 ; $06E101   |--

CODE_06E102:
    REP #$10            ; $06E102   |
    LDY $7362,x         ; $06E104   |
    LDX #$000C          ; $06E107   |

CODE_06E10A:
    LDA #$00E8          ; $06E10A   |
    STA $6002,y         ; $06E10D   |
    TYA                 ; $06E110   |
    CLC                 ; $06E111   |
    ADC #$0008          ; $06E112   |
    TAY                 ; $06E115   |
    DEX                 ; $06E116   |
    BNE CODE_06E10A     ; $06E117   |
    SEP #$10            ; $06E119   |
    LDA #$0200          ; $06E11B   |
    TRB $0E             ; $06E11E   |
    LDX $12             ; $06E120   |
    RTS                 ; $06E122   |

; caged_ghost_round sub

CODE_06E123:
    JSR CODE_06E147     ; $06E123   |
    LDA $0E             ; $06E126   |
    AND #$000F          ; $06E128   |
    ASL A               ; $06E12B   |
    TAY                 ; $06E12C   |
    LDA $E13B,y         ; $06E12D   | caged_ghost_round_ptr table
    STA $00             ; $06E130   | assumes $7960 is DP
    PER $0002  [$E137]  ; $06E132   | 
    JMP ($7960)         ; $06E135   | caged_ghost_round_ptr jump

; returned back to after caged_ghost_round_ptr sub
    LDX $12             ; $06E138   |
    RTS                 ; $06E13A   |

.caged_ghost_round_ptr
DATA_06E13B:         dw $E195
DATA_06E13D:         dw $E225
DATA_06E13F:         dw $E258
DATA_06E141:         dw $E274
DATA_06E143:         dw $E2A2

; table
DATA_06E145:         db $00, $02

; caged_ghost_round sub

CODE_06E147:
    LDY #$01            ; $06E147   |
    LDA $608C           ; $06E149   |
    SEC                 ; $06E14C   |
    SBC $70E2,x         ; $06E14D   |
    BPL CODE_06E154     ; $06E150   |
    LDY #$00            ; $06E152   |

CODE_06E154:
    LDA $E145,y         ; $06E154   | table
    AND #$00FF          ; $06E157   |
    STA $7400,x         ; $06E15A   |
    LDA $0E             ; $06E15D   |
    BIT #$0800          ; $06E15F   |
    BEQ CODE_06E194     ; $06E162   |
    LDA #$0079          ; $06E164   |
    JSL $0085D2         ; $06E167   |
    LDA $0E             ; $06E16B   |
    AND #$000F          ; $06E16D   |
    CMP #$0001          ; $06E170   |
    BEQ CODE_06E194     ; $06E173   |
    LDA $18,x           ; $06E175   |
    SEC                 ; $06E177   |
    SBC #$0020          ; $06E178   |
    CMP #$0030          ; $06E17B   |
    BCS CODE_06E183     ; $06E17E   |
    LDA #$0030          ; $06E180   |

CODE_06E183:
    STA $76,x           ; $06E183   |
    LDA #$0008          ; $06E185   |
    STA $78,x           ; $06E188   |
    LDA $0E             ; $06E18A   |
    AND #$F7F0          ; $06E18C   |
    ORA #$8001          ; $06E18F   |
    STA $0E             ; $06E192   |

CODE_06E194:
    RTS                 ; $06E194   |

; caged_ghost_round_ptr sub
    LDA $18,x           ; $06E195   |
    CMP #$0118          ; $06E197   |
    BCS CODE_06E1CD     ; $06E19A   |
    LDA $7A96,x         ; $06E19C   |
    BEQ CODE_06E1A2     ; $06E19F   |
    RTS                 ; $06E1A1   |--

CODE_06E1A2:
    JSL $008408         ; $06E1A2   |
    LDA $10             ; $06E1A6   |
    BIT #$F800          ; $06E1A8   |
    BNE CODE_06E1CD     ; $06E1AB   |
    AND #$0003          ; $06E1AD   |
    ASL A               ; $06E1B0   |
    ASL A               ; $06E1B1   |
    CLC                 ; $06E1B2   |
    ADC #$0004          ; $06E1B3   |
    CLC                 ; $06E1B6   |
    ADC $18,x           ; $06E1B7   |
    CMP #$0118          ; $06E1B9   |
    BCC CODE_06E1C1     ; $06E1BC   |
    LDA #$0118          ; $06E1BE   |

CODE_06E1C1:
    STA $76,x           ; $06E1C1   |
    LDA $0E             ; $06E1C3   |
    AND #$FFF0          ; $06E1C5   |
    ORA #$8002          ; $06E1C8   |
    STA $0E             ; $06E1CB   |

CODE_06E1CD:
    LDA $7AF8,x         ; $06E1CD   |
    BNE CODE_06E21F     ; $06E1D0   |
    LDA $18,x           ; $06E1D2   |
    CMP #$0078          ; $06E1D4   |
    BCC CODE_06E21F     ; $06E1D7   |
    LDA #$001E          ; $06E1D9   |
    STA $3008           ; $06E1DC   |
    INC A               ; $06E1DF   |
    STA $300A           ; $06E1E0   |
    LDX #$09            ; $06E1E3   |
    LDA #$91DB          ; $06E1E5   |
    JSL $7EDE44         ; $06E1E8   | sfx
    LDA $300C           ; $06E1EC   |
    CMP #$0003          ; $06E1EF   |
    BCS CODE_06E21F     ; $06E1F2   |
    STA $00             ; $06E1F4   |
    LDX #$09            ; $06E1F6   |
    LDA #$91D5          ; $06E1F8   |
    JSL $7EDE44         ; $06E1FB   | sfx
    LDA $300C           ; $06E1FF   |
    CLC                 ; $06E202   |
    ADC $00             ; $06E203   |
    CMP #$0006          ; $06E205   |
    BCS CODE_06E21F     ; $06E208   |
    JSL $008408         ; $06E20A   |
    LDA $10             ; $06E20E   |
    BIT #$0007          ; $06E210   |
    BNE CODE_06E21F     ; $06E213   |
    LDA $0E             ; $06E215   |
    AND #$FFF0          ; $06E217   |
    ORA #$8004          ; $06E21A   |
    STA $0E             ; $06E21D   |

CODE_06E21F:
    LDX $12             ; $06E21F   |
    JSR CODE_06E321     ; $06E221   |
    RTS                 ; $06E224   |

; caged_ghost_round_ptr sub
    JSR CODE_06E321     ; $06E225   |
    LDA $78,x           ; $06E228   |
    SEC                 ; $06E22A   |
    SBC #$0001          ; $06E22B   |
    STA $78,x           ; $06E22E   |
    LDA $18,x           ; $06E230   |
    CLC                 ; $06E232   |
    ADC $78,x           ; $06E233   |
    CMP $76,x           ; $06E235   |
    BCS CODE_06E255     ; $06E237   |
    CMP #$0030          ; $06E239   |
    BCS CODE_06E243     ; $06E23C   |
    LDA #$0180          ; $06E23E   |
    BRA CODE_06E246     ; $06E241   |

CODE_06E243:
    LDA #$0080          ; $06E243   |

CODE_06E246:
    STA $7A96,x         ; $06E246   |
    LDA $0E             ; $06E249   |
    AND #$FFF0          ; $06E24B   |
    ORA #$8000          ; $06E24E   |
    STA $0E             ; $06E251   |
    LDA $76,x           ; $06E253   |

CODE_06E255:
    STA $18,x           ; $06E255   |
    RTS                 ; $06E257   |

; caged_ghost_round_ptr sub
    JSR CODE_06E321     ; $06E258   |
    LDA $18,x           ; $06E25B   |
    CLC                 ; $06E25D   |
    ADC #$0002          ; $06E25E   |
    CMP $76,x           ; $06E261   |
    BCC CODE_06E271     ; $06E263   |
    LDA $0E             ; $06E265   |
    AND #$FFF0          ; $06E267   |
    ORA #$8000          ; $06E26A   |
    STA $0E             ; $06E26D   |
    LDA $76,x           ; $06E26F   |

CODE_06E271:
    STA $18,x           ; $06E271   |
    RTS                 ; $06E273   |

; caged_ghost_round_ptr sub
    LDA $7A96,x         ; $06E274   |
    BNE CODE_06E299     ; $06E277   |
    JSR CODE_06E321     ; $06E279   |
    LDA $76,x           ; $06E27C   |
    SEC                 ; $06E27E   |
    SBC $18,x           ; $06E27F   |
    BCC CODE_06E28B     ; $06E281   |
    LSR A               ; $06E283   |
    LSR A               ; $06E284   |
    BEQ CODE_06E28B     ; $06E285   |
    ADC $18,x           ; $06E287   |
    BRA CODE_06E297     ; $06E289   |

CODE_06E28B:
    LDA $0E             ; $06E28B   |
    AND #$FFF0          ; $06E28D   |
    ORA #$8000          ; $06E290   |
    STA $0E             ; $06E293   |
    LDA $76,x           ; $06E295   |

CODE_06E297:
    STA $18,x           ; $06E297   |

CODE_06E299:
    RTS                 ; $06E299   |

; table
DATA_06E29A:         dw $FFDE
DATA_06E29C:         dw $0012
DATA_06E29E:         dw $FE00
DATA_06E2A0:         dw $0200

; caged_ghost_round_ptr sub
    LDA $7A98,x         ; $06E2A2   |
    BNE CODE_06E31D     ; $06E2A5   |
    LDA $16,x           ; $06E2A7   |
    BNE CODE_06E2B7     ; $06E2A9   |
    LDA $0E             ; $06E2AB   |
    AND #$FFF0          ; $06E2AD   |
    ORA #$8000          ; $06E2B0   |
    STA $0E             ; $06E2B3   |
    BRA CODE_06E31D     ; $06E2B5   |

CODE_06E2B7:
    CMP #$0008          ; $06E2B7   |
    BNE CODE_06E31D     ; $06E2BA   |
    LDA #$0077          ; $06E2BC   |
    JSL $0085D2         ; $06E2BF   |
    LDA #$001E          ; $06E2C3   |
    JSL $03A364         ; $06E2C6   |
    BCC CODE_06E31D     ; $06E2CA   |
    LDA $7044C8         ; $06E2CC   |
    CLC                 ; $06E2D0   |
    ADC $7182,x         ; $06E2D1   |
    CLC                 ; $06E2D4   |
    ADC #$0010          ; $06E2D5   |
    STA $7182,y         ; $06E2D8   |
    LDA $70E2,x         ; $06E2DB   |
    SEC                 ; $06E2DE   |
    SBC #$0008          ; $06E2DF   |
    STA $00             ; $06E2E2   |
    LDA $7400,x         ; $06E2E4   |
    AND #$0002          ; $06E2E7   |
    STA $7400,y         ; $06E2EA   |
    TAX                 ; $06E2ED   |
    LDA $E29A,x         ; $06E2EE   | table
    CLC                 ; $06E2F1   |
    ADC $00             ; $06E2F2   |
    STA $70E2,y         ; $06E2F4   |
    LDA $E29E,x         ; $06E2F7   |
    STA $7220,y         ; $06E2FA   |
    LDA #$FD80          ; $06E2FD   |
    STA $7222,y         ; $06E300   |
    LDA #$0018          ; $06E303   |
    STA $7A96,y         ; $06E306   |
    LDA #$0004          ; $06E309   |
    STA $7976,y         ; $06E30C   |
    LDA #$0001          ; $06E30F   |
    STA $7902,y         ; $06E312   |
    LDX $12             ; $06E315   |
    LDA #$0048          ; $06E317   |
    STA $7AF8,x         ; $06E31A   |

CODE_06E31D:
    JSR CODE_06E321     ; $06E31D   |
    RTS                 ; $06E320   |

; caged_ghost_round sub

CODE_06E321:
    LDA $0E             ; $06E321   |
    BPL CODE_06E32F     ; $06E323   |
    STZ $7A98,x         ; $06E325   |
    STZ $16,x           ; $06E328   |
    LDA #$8000          ; $06E32A   |
    TRB $0E             ; $06E32D   |

CODE_06E32F:
    CLC                 ; $06E32F   |
    LDA $7A98,x         ; $06E330   |
    BNE CODE_06E366     ; $06E333   |
    REP #$10            ; $06E335   |
    LDA $0E             ; $06E337   |
    AND #$000F          ; $06E339   |
    ASL A               ; $06E33C   |
    TAY                 ; $06E33D   |
    LDA $E371,y         ; $06E33E   | address table
    STA $00             ; $06E341   |
    LDA $E37B,y         ; $06E343   | address table
    STA $02             ; $06E346   |
    LDA $16,x           ; $06E348   |
    BNE CODE_06E34F     ; $06E34A   |
    LDA $E367,y         ; $06E34C   | table

CODE_06E34F:
    DEC A               ; $06E34F   |
    STA $16,x           ; $06E350   |
    TAY                 ; $06E352   |
    LDA ($00),y         ; $06E353   | load from table in $E371
    AND #$00FF          ; $06E355   |
    STA $7A98,x         ; $06E358   |
    LDA ($02),y         ; $06E35B   | load from table in $E37B
    AND #$00FF          ; $06E35D   |
    STA $7402,x         ; $06E360   |
    SEP #$10            ; $06E363   |
    SEC                 ; $06E365   |

CODE_06E366:
    RTS                 ; $06E366   |

; data table
DATA_06E367:         dw $0004
DATA_06E369:         dw $0009
DATA_06E36B:         dw $0004
DATA_06E36D:         dw $0008
DATA_06E36F:         dw $000F

; address table: each address is a frame timing table
DATA_06E371:         dw $E385
DATA_06E373:         dw $E38D
DATA_06E375:         dw $E39F
DATA_06E377:         dw $E3A7
DATA_06E379:         dw $E3B7

; address table: each address is an animation frame (?) table
DATA_06E37B:         dw $E389
DATA_06E37D:         dw $E396
DATA_06E37F:         dw $E3A3
DATA_06E381:         dw $E3AF
DATA_06E383:         dw $E3C6

; caged_ghost_round animation tables
; split into pairs of tables, each pair is an AI state
; first table in pair is how many frames to wait
; second table is the animation frame to display (?)
DATA_06E385:         db $04, $08, $04, $08

DATA_06E389:         db $08, $09, $08, $07

DATA_06E38D:         db $40, $02, $04, $01
DATA_06E391:         db $01, $01, $01, $01
DATA_06E395:         db $02

DATA_06E396:         db $14, $13, $12, $0E
DATA_06E39A:         db $0D, $0C, $05, $06
DATA_06E39E:         db $07

DATA_06E39F:         db $04, $08, $04, $08

DATA_06E3A3:         db $08, $09, $08, $07

DATA_06E3A7:         db $40, $04, $03, $02
DATA_06E3AB:         db $02, $01, $01, $01

DATA_06E3AF:         db $07, $06, $05, $04
DATA_06E3B3:         db $03, $02, $01, $00

; spitting shyguy state
DATA_06E3B7:         db $01, $01, $01, $01
DATA_06E3BB:         db $01, $01, $02, $10
DATA_06E3BF:         db $02, $01, $01, $01
DATA_06E3C3:         db $01, $01, $10

DATA_06E3C6:         db $06, $05, $04, $03
DATA_06E3CA:         db $02, $01, $0A, $0B
DATA_06E3CE:         db $0A, $02, $03, $04
DATA_06E3D2:         db $05, $06, $07

; useless RTL's?
    RTL                 ; $06E3D5   |
    RTL                 ; $06E3D6   |

; address table
DATA_06E3D7:         dw $E3D9
DATA_06E3D9:         dw $E3DF
DATA_06E3DB:         dw $E407

; data table
DATA_06E3DD:         db $14, $0E

; data table
DATA_06E3DF:         db $00, $00, $00, $00
DATA_06E3E3:         db $00, $00, $00, $00
DATA_06E3E7:         db $00, $00, $00, $00
DATA_06E3EB:         db $00, $00, $00, $00
DATA_06E3EF:         db $00, $00, $00, $00
DATA_06E3F3:         db $00, $00, $00, $00
DATA_06E3F7:         db $00, $00, $00, $00
DATA_06E3FB:         db $00, $00, $00, $00
DATA_06E3FF:         db $00, $00, $00, $00
DATA_06E403:         db $00, $00, $00, $00

; data table
DATA_06E407:         db $00, $00, $C8, $00
DATA_06E40B:         db $C5, $FF, $C4, $FE
DATA_06E40F:         db $C3, $FA, $C5, $D9
DATA_06E413:         db $C9, $C1, $D1, $A9
DATA_06E417:         db $D8, $A1, $E0, $9D
DATA_06E41B:         db $00, $99, $21, $9D
DATA_06E41F:         db $29, $A1, $30, $A9
DATA_06E423:         db $38, $C1, $3C, $D9
DATA_06E427:         db $3E, $FA, $3D, $FE
DATA_06E42B:         db $3C, $FF, $39, $00

; caged_ghost_round sub

CODE_06E42F:
    LDY $0C             ; $06E42F   |
    LDA $E3DD,y         ; $06E431   | table
    AND #$00FF          ; $06E434   |
    STA $06             ; $06E437   |
    TYA                 ; $06E439   |
    ASL A               ; $06E43A   |
    TAY                 ; $06E43B   |
    LDA $E3D7,y         ; $06E43C   | table
    STA $00             ; $06E43F   |
    LDY #$00            ; $06E441   |
    LDA ($00),y         ; $06E443   |
    STA $02             ; $06E445   |
    LDY #$02            ; $06E447   |
    LDA ($00),y         ; $06E449   |
    STA $04             ; $06E44B   |
    LDA $06             ; $06E44D   |
    DEC A               ; $06E44F   |
    ASL A               ; $06E450   |
    TAY                 ; $06E451   |

CODE_06E452:
    TYA                 ; $06E452   |
    ASL A               ; $06E453   |
    TAX                 ; $06E454   |
    LDA #$0000          ; $06E455   |
    STA $7049F6,x       ; $06E458   |
    LDA #$0000          ; $06E45C   |
    STA $7049F8,x       ; $06E45F   |
    LDA $E407,y         ; $06E463   | table
    AND #$00FF          ; $06E466   |
    CMP #$0080          ; $06E469   |
    BCC CODE_06E471     ; $06E46C   |
    ORA #$FF00          ; $06E46E   |

CODE_06E471:
    STA $704B36,x       ; $06E471   |
    LDA $E407,y         ; $06E475   | table
    AND #$FF00          ; $06E478   |
    BPL CODE_06E480     ; $06E47B   |
    ORA #$00FF          ; $06E47D   |

CODE_06E480:
    XBA                 ; $06E480   |
    STA $704B38,x       ; $06E481   |
    DEY                 ; $06E485   |
    BPL CODE_06E452     ; $06E486   |
    LDX $12             ; $06E488   |
    RTS                 ; $06E48A   |

; caged_ghost_round sub

CODE_06E48B:
    LDA #$0004          ; $06E48B   |
    TRB $0968           ; $06E48E   |
    LDA #$0400          ; $06E491   |
    TRB $0E             ; $06E494   |
    LDA $7680,x         ; $06E496   |
    CLC                 ; $06E499   |
    ADC #$0080          ; $06E49A   |
    CMP #$0200          ; $06E49D   |
    BCS CODE_06E514     ; $06E4A0   |
    LDA $7682,x         ; $06E4A2   |
    CLC                 ; $06E4A5   |
    ADC #$0080          ; $06E4A6   |
    CMP #$0200          ; $06E4A9   |
    BCS CODE_06E514     ; $06E4AC   |
    LDA $7680,x         ; $06E4AE   |
    STA $6040           ; $06E4B1   |
    LDA $7682,x         ; $06E4B4   |
    STA $6042           ; $06E4B7   |
    LDA #$49F6          ; $06E4BA   |
    STA $3002           ; $06E4BD   |
    LDA #$4B36          ; $06E4C0   |
    STA $3004           ; $06E4C3   |
    LDA $06             ; $06E4C6   |
    STA $3006           ; $06E4C8   |
    STZ $3008           ; $06E4CB   |
    LDA #$449E          ; $06E4CE   |
    STA $300A           ; $06E4D1   |
    LDA $18,x           ; $06E4D4   |
    AND #$03FF          ; $06E4D6   |
    STA $300C           ; $06E4D9   |
    LDA #$0000          ; $06E4DC   |
    STA $605E           ; $06E4DF   |
    LDX #$08            ; $06E4E2   |
    LDA #$E8CA          ; $06E4E4   |
    JSL $7EDE44         ; $06E4E7   |
    JSL $00BE39         ; $06E4EB   | continues 8 bytes later

; DMA args
DATA_06E4EF:         db $40, $50, $7E, $72
DATA_06E4F3:         db $33, $70, $48, $03

    SEP #$30            ; $06E4F7   |
    LDA #$04            ; $06E4F9   |
    TSB $0968           ; $06E4FB   |
    LDA #$02            ; $06E4FE   |
    TSB $096B           ; $06E500   |
    LDA #$63            ; $06E503   |
    STA $096C           ; $06E505   |
    LDA #$18            ; $06E508   |
    TSB $094A           ; $06E50A   |
    REP #$20            ; $06E50D   |
    LDA #$0400          ; $06E50F   |
    TSB $0E             ; $06E512   |

CODE_06E514:
    LDX $12             ; $06E514   |
    RTS                 ; $06E516   |

.init_platform_ghost
    LDA #$0100          ; $06E517   |
    STA $18,x           ; $06E51A   |
    LDA #$0040          ; $06E51C   |
    STA $76,x           ; $06E51F   |
    STA $7900,x         ; $06E521   |
    STZ $79D8,x         ; $06E524   |
    STZ $16,x           ; $06E527   |
    LDA #$8000          ; $06E529   |
    STA $7902,x         ; $06E52C   |
    RTL                 ; $06E52F   |

.main_platform_ghost
    LDA $7902,x         ; $06E530   |
    STA $0E             ; $06E533   |
    JSR CODE_06E562     ; $06E535   |
    JSR CODE_06E65D     ; $06E538   |
    JSR CODE_06E58E     ; $06E53B   |
    JSR CODE_06E7E0     ; $06E53E   |
    JSR CODE_06E85A     ; $06E541   |
    LDA $0E             ; $06E544   |
    STA $7902,x         ; $06E546   |
    JSL $03AF23         ; $06E549   |
    LDA $7902,x         ; $06E54D   |
    STA $0E             ; $06E550   |
    LDA $7900,x         ; $06E552   |
    STA $76,x           ; $06E555   |
    JSR CODE_06E894     ; $06E557   |
    LDX $12             ; $06E55A   |
    LDA $0E             ; $06E55C   |
    STA $7902,x         ; $06E55E   |
    RTL                 ; $06E561   |

; platform ghost sub

CODE_06E562:
    LDA $7044DA         ; $06E562   |
    CLC                 ; $06E566   |
    ADC $70E2,x         ; $06E567   |
    STA $3010           ; $06E56A   |
    LDA $7044DC         ; $06E56D   |
    CLC                 ; $06E571   |
    ADC $7182,x         ; $06E572   |
    STA $3000           ; $06E575   |
    LDX #$0A            ; $06E578   |
    LDA #$CE2F          ; $06E57A   |
    JSL $7EDE91         ; $06E57D   |
    LDX $12             ; $06E581   |
    LDA $300A           ; $06E583   |
    BEQ CODE_06E58D     ; $06E586   |
    LDA #$0002          ; $06E588   |
    TSB $0E             ; $06E58B   |

CODE_06E58D:
    RTS                 ; $06E58D   |

; platform ghost sub

CODE_06E58E:
    LDA $7680,x         ; $06E58E   |
    CLC                 ; $06E591   |
    ADC #$0028          ; $06E592   |
    CMP #$0150          ; $06E595   |
    BCC CODE_06E5AA     ; $06E598   |
    LDY #$11            ; $06E59A   |
    STY $0967           ; $06E59C   |
    LDY #$02            ; $06E59F   |
    STY $0968           ; $06E5A1   |
    LDY #$20            ; $06E5A4   |
    STY $096C           ; $06E5A6   |
    RTS                 ; $06E5A9   |

CODE_06E5AA:
    LDA #$0006          ; $06E5AA   |
    STA $3000           ; $06E5AD   |
    LDA $18,x           ; $06E5B0   |
    AND #$00FF          ; $06E5B2   |
    ASL A               ; $06E5B5   |
    TAY                 ; $06E5B6   |
    LDA $E623,y         ; $06E5B7   |
    STA $3002           ; $06E5BA   |
    LDA $18,x           ; $06E5BD   |
    XBA                 ; $06E5BF   |
    AND #$00FF          ; $06E5C0   |
    ASL A               ; $06E5C3   |
    TAY                 ; $06E5C4   |
    LDA $E623,y         ; $06E5C5   |
    STA $3004           ; $06E5C8   |
    LDA #$0010          ; $06E5CB   |
    STA $3006           ; $06E5CE   |
    LDA #$0000          ; $06E5D1   |
    STA $3008           ; $06E5D4   |
    LDA #$449E          ; $06E5D7   |
    STA $300A           ; $06E5DA   |
    LDA $76,x           ; $06E5DD   |
    STA $300C           ; $06E5DF   |
    LDA $7680,x         ; $06E5E2   |
    STA $6040           ; $06E5E5   |
    LDA $7682,x         ; $06E5E8   |
    STA $6042           ; $06E5EB   |
    LDX #$08            ; $06E5EE   |
    LDA #$E93B          ; $06E5F0   |
    JSL $7EDE44         ; $06E5F3   |
    JSL $00BE39         ; $06E5F7   |

; DMA args
DATA_06E5FB:         dl $7E5040, $703372
DATA_06E601:         dw $0348

    SEP #$30            ; $06E603   |
    LDA #$13            ; $06E605   |
    STA $0967           ; $06E607   |
    LDA #$04            ; $06E60A   |
    STA $0968           ; $06E60C   |
    LDA #$22            ; $06E60F   |
    STA $096B           ; $06E611   |
    LDA #$63            ; $06E614   |
    STA $096C           ; $06E616   |
    LDA #$18            ; $06E619   |
    TSB $094A           ; $06E61B   |
    REP #$20            ; $06E61E   |
    LDX $12             ; $06E620   |
    RTS                 ; $06E622   |

; platform ghost data pointers
DATA_06E623:         dw $E8FC
DATA_06E625:         dw $E91C

; platform ghost routine table
DATA_06E627:         dw $E6D1
DATA_06E629:         dw $0001
DATA_06E62B:         dw $E708
DATA_06E62D:         dw $0001
DATA_06E62F:         dw $E760
DATA_06E631:         dw $0001
DATA_06E633:         dw $E7BB
DATA_06E635:         dw $0001
DATA_06E637:         dw $E78C
DATA_06E639:         dw $0001
DATA_06E63B:         dw $E708
DATA_06E63D:         dw $0001
DATA_06E63F:         dw $E760
DATA_06E641:         dw $0001
DATA_06E643:         dw $E7BB
DATA_06E645:         dw $0001
DATA_06E647:         dw $E78C
DATA_06E649:         dw $0001
DATA_06E64B:         dw $E708
DATA_06E64D:         dw $0001
DATA_06E64F:         dw $E764
DATA_06E651:         dw $0001
DATA_06E653:         dw $E7BB
DATA_06E655:         dw $0001
DATA_06E657:         dw $E78C
DATA_06E659:         dw $0001
DATA_06E65B:         dw $0000

; platform ghost sub

CODE_06E65D:
    JSR CODE_06E6B3     ; $06E65D   |
    LDA $78,x           ; $06E660   |
    ASL A               ; $06E662   |
    ASL A               ; $06E663   |

CODE_06E664:
    TAY                 ; $06E664   |
    LDA $E627,y         ; $06E665   |
    BNE CODE_06E673     ; $06E668   |
    STA $78,x           ; $06E66A   |
    LDA #$8000          ; $06E66C   |
    TSB $0E             ; $06E66F   |
    BRA CODE_06E664     ; $06E671   |

CODE_06E673:
    STA $00             ; $06E673   |
    LDA $E629,y         ; $06E675   |
    STA $18,x           ; $06E678   |
    PER $0002  [$E67F]  ; $06E67A   |
    JMP ($7960)         ; $06E67D   |
    LDA $0E             ; $06E680   |
    AND #$7FFF          ; $06E682   |
    BIT #$4000          ; $06E685   |
    BEQ CODE_06E68F     ; $06E688   |
    EOR #$C000          ; $06E68A   |
    INC $78,x           ; $06E68D   |

CODE_06E68F:
    STA $0E             ; $06E68F   |
    RTS                 ; $06E691   |

DATA_06E692:         dw $0000, $0001
DATA_06E696:         dw $0002, $0001
DATA_06E69A:         dw $0002, $0000
DATA_06E69E:         dw $0000, $0001
DATA_06E6A2:         dw $0002, $0001
DATA_06E6A6:         dw $0002

; platform ghost sub

CODE_06E6A8:
    LDA #$0015          ; $06E6A8   |
    STA $7A98,x         ; $06E6AB   |
    LDA #$0004          ; $06E6AE   |
    TSB $0E             ; $06E6B1   |

CODE_06E6B3:
    LDA $0E             ; $06E6B3   |
    BIT #$0004          ; $06E6B5   |
    BEQ CODE_06E6D0     ; $06E6B8   |
    LDA $7A98,x         ; $06E6BA   |
    PHA                 ; $06E6BD   |
    BNE CODE_06E6C5     ; $06E6BE   |
    LDA #$0004          ; $06E6C0   |
    TRB $0E             ; $06E6C3   |

CODE_06E6C5:
    PLA                 ; $06E6C5   |
    AND #$FFFE          ; $06E6C6   |
    TAY                 ; $06E6C9   |
    LDA $E692,y         ; $06E6CA   |
    STA $7402,x         ; $06E6CD   |

CODE_06E6D0:
    RTS                 ; $06E6D0   |

; platform ghost sub
    LDA $0E             ; $06E6D1   |
    BPL CODE_06E6DB     ; $06E6D3   |
    LDA #$00F0          ; $06E6D5   |
    STA $7A96,x         ; $06E6D8   |

CODE_06E6DB:
    LDA $0E             ; $06E6DB   |
    BIT #$0004          ; $06E6DD   |
    BNE CODE_06E707     ; $06E6E0   |
    LDA #$0002          ; $06E6E2   |
    STA $7402,x         ; $06E6E5   |
    LDA $7A96,x         ; $06E6E8   |
    BNE CODE_06E6F6     ; $06E6EB   |
    LDA #$00F0          ; $06E6ED   |
    STA $7A96,x         ; $06E6F0   |
    JSR CODE_06E6A8     ; $06E6F3   |

CODE_06E6F6:
    LDA $0E             ; $06E6F6   |
    BIT #$0001          ; $06E6F8   |
    BEQ CODE_06E707     ; $06E6FB   |
    LDA $0E             ; $06E6FD   |
    AND #$FFFB          ; $06E6FF   |
    ORA #$4000          ; $06E702   |
    STA $0E             ; $06E705   |

CODE_06E707:
    RTS                 ; $06E707   |

; platform ghost sub
    LDA $0E             ; $06E708   |
    BPL CODE_06E724     ; $06E70A   |
    LDA #$0180          ; $06E70C   |
    STA $7220,x         ; $06E70F   |
    LDA #$0080          ; $06E712   |
    STA $7A96,x         ; $06E715   |
    LDA #$0002          ; $06E718   |
    STA $7400,x         ; $06E71B   |
    LDA #$0002          ; $06E71E   |
    STA $7402,x         ; $06E721   |

CODE_06E724:
    LDA $0E             ; $06E724   |
    BIT #$0002          ; $06E726   |
    BNE CODE_06E754     ; $06E729   |
    LDA $7680,x         ; $06E72B   |
    CLC                 ; $06E72E   |
    ADC #$0080          ; $06E72F   |
    CMP #$0200          ; $06E732   |
    BCS CODE_06E73D     ; $06E735   |
    LDA #$00C0          ; $06E737   |
    STA $0051           ; $06E73A   |

CODE_06E73D:
    LDA $7A96,x         ; $06E73D   |
    BNE CODE_06E74B     ; $06E740   |
    STZ $7220,x         ; $06E742   |
    LDA #$4000          ; $06E745   |
    TSB $0E             ; $06E748   |
    RTS                 ; $06E74A   |

CODE_06E74B:
    CMP #$0017          ; $06E74B   |
    BNE CODE_06E753     ; $06E74E   |
    JSR CODE_06E6A8     ; $06E750   |

CODE_06E753:
    RTS                 ; $06E753   |

CODE_06E754:
    STZ $7220,x         ; $06E754   |
    RTS                 ; $06E757   |

DATA_06E758:         dw $0003, $0006
DATA_06E75C:         dw $0090, $0120

; platform ghost sub
    LDY #$00            ; $06E760   |
    BRA CODE_06E766     ; $06E762   |

    LDY #$02            ; $06E764   |

CODE_06E766:
    STZ $7402,x         ; $06E766   |
    LDA $0E             ; $06E769   |
    BPL CODE_06E773     ; $06E76B   |
    LDA #$001E          ; $06E76D   |
    STA $7A96,x         ; $06E770   |

CODE_06E773:
    LDA $7A96,x         ; $06E773   |
    BNE CODE_06E78B     ; $06E776   |
    LDA $76,x           ; $06E778   |
    CLC                 ; $06E77A   |
    ADC $E758,y         ; $06E77B   |
    STA $7900,x         ; $06E77E   |
    CMP $E75C,y         ; $06E781   |
    BCC CODE_06E78B     ; $06E784   |
    LDA #$4000          ; $06E786   |
    TSB $0E             ; $06E789   |

CODE_06E78B:
    RTS                 ; $06E78B   |

; platform ghost sub
    LDA $0E             ; $06E78C   |
    BPL CODE_06E799     ; $06E78E   |
    LDA #$0002          ; $06E790   |
    STA $7402,x         ; $06E793   |
    STZ $7A96,x         ; $06E796   |

CODE_06E799:
    LDA $7A96,x         ; $06E799   |
    BNE CODE_06E7BA     ; $06E79C   |
    LDA #$0002          ; $06E79E   |
    STA $7A96,x         ; $06E7A1   |
    LDA $76,x           ; $06E7A4   |
    SEC                 ; $06E7A6   |
    SBC #$0003          ; $06E7A7   |
    CMP #$0040          ; $06E7AA   |
    BPL CODE_06E7B7     ; $06E7AD   |
    LDA #$4000          ; $06E7AF   |
    TSB $0E             ; $06E7B2   |
    LDA #$0040          ; $06E7B4   |

CODE_06E7B7:
    STA $7900,x         ; $06E7B7   |

CODE_06E7BA:
    RTS                 ; $06E7BA   |

; platform ghost sub
    LDA $0E             ; $06E7BB   |
    BPL CODE_06E7C5     ; $06E7BD   |
    LDA #$00C6          ; $06E7BF   |
    STA $7A96,x         ; $06E7C2   |

CODE_06E7C5:
    LDA $7A96,x         ; $06E7C5   |
    CMP #$0017          ; $06E7C8   |
    BNE CODE_06E7D0     ; $06E7CB   |
    JSR CODE_06E6A8     ; $06E7CD   |

CODE_06E7D0:
    LDA $7A96,x         ; $06E7D0   |
    BNE CODE_06E7DF     ; $06E7D3   |
    LDA $0E             ; $06E7D5   |
    AND #$FFFB          ; $06E7D7   |
    ORA #$4000          ; $06E7DA   |
    STA $0E             ; $06E7DD   |

CODE_06E7DF:
    RTS                 ; $06E7DF   |

; platform ghost sub

CODE_06E7E0:
    LDA $18,x           ; $06E7E0   |
    AND #$00FF          ; $06E7E2   |
    ASL A               ; $06E7E5   |
    TAY                 ; $06E7E6   |
    LDA $E623,y         ; $06E7E7   |
    STA $00             ; $06E7EA   |
    LDA $18,x           ; $06E7EC   |
    XBA                 ; $06E7EE   |
    AND #$00FF          ; $06E7EF   |
    ASL A               ; $06E7F2   |
    TAY                 ; $06E7F3   |
    LDA $E623,y         ; $06E7F4   |
    STA $02             ; $06E7F7   |
    LDY #$12            ; $06E7F9   |
    LDA ($00),y         ; $06E7FB   |
    AND #$00FF          ; $06E7FD   |
    BIT #$0080          ; $06E800   |
    BEQ CODE_06E808     ; $06E803   |
    ORA #$FF00          ; $06E805   |

CODE_06E808:
    STA $3002           ; $06E808   |
    LDA ($02),y         ; $06E80B   |
    AND #$00FF          ; $06E80D   |
    BIT #$0080          ; $06E810   |
    BEQ CODE_06E818     ; $06E813   |
    ORA #$FF00          ; $06E815   |

CODE_06E818:
    STA $3006           ; $06E818   |
    INY                 ; $06E81B   |
    LDA ($00),y         ; $06E81C   |
    AND #$00FF          ; $06E81E   |
    BIT #$0080          ; $06E821   |
    BEQ CODE_06E829     ; $06E824   |
    ORA #$FF00          ; $06E826   |

CODE_06E829:
    STA $3004           ; $06E829   |
    LDA ($02),y         ; $06E82C   |
    AND #$00FF          ; $06E82E   |
    BIT #$0080          ; $06E831   |
    BEQ CODE_06E839     ; $06E834   |
    ORA #$FF00          ; $06E836   |

CODE_06E839:
    STA $300A           ; $06E839   |
    LDA $7900,x         ; $06E83C   |
    STA $300C           ; $06E83F   |
    LDX #$08            ; $06E842   |
    LDA #$EB9D          ; $06E844   |
    JSL $7EDE44         ; $06E847   |
    LDX $12             ; $06E84B   |
    LDA $300E           ; $06E84D   |
    STA $0A             ; $06E850   |
    STA $16,x           ; $06E852   |
    LDA $3010           ; $06E854   |
    STA $0C             ; $06E857   |
    RTS                 ; $06E859   |

; platform ghost sub

CODE_06E85A:
    REP #$10            ; $06E85A   |
    LDA $7A36,x         ; $06E85C   |
    SEC                 ; $06E85F   |
    SBC #$0008          ; $06E860   |
    STA $00             ; $06E863   |
    LDA $7A38,x         ; $06E865   |
    CLC                 ; $06E868   |
    ADC #$0010          ; $06E869   |
    STA $02             ; $06E86C   |
    LDY $7362,x         ; $06E86E   |
    LDX #$000D          ; $06E871   |

CODE_06E874:
    LDA $6000,y         ; $06E874   |
    CLC                 ; $06E877   |
    ADC $00             ; $06E878   |
    STA $6000,y         ; $06E87A   |
    LDA $6002,y         ; $06E87D   |
    CLC                 ; $06E880   |
    ADC $02             ; $06E881   |
    STA $6002,y         ; $06E883   |
    TYA                 ; $06E886   |
    CLC                 ; $06E887   |
    ADC #$0008          ; $06E888   |
    TAY                 ; $06E88B   |
    DEX                 ; $06E88C   |
    BNE CODE_06E874     ; $06E88D   |
    SEP #$10            ; $06E88F   |
    LDX $12             ; $06E891   |
    RTS                 ; $06E893   |

; platform ghost sub

CODE_06E894:
    LDA $60AA           ; $06E894   |
    BMI CODE_06E8F1     ; $06E897   |
    LDA $611C           ; $06E899   |
    SEC                 ; $06E89C   |
    SBC $70E2,x         ; $06E89D   |
    CLC                 ; $06E8A0   |
    ADC $0A             ; $06E8A1   |
    STA $00             ; $06E8A3   |
    ASL A               ; $06E8A5   |
    LDA $6120           ; $06E8A6   |
    BCS CODE_06E8AF     ; $06E8A9   |
    EOR #$FFFF          ; $06E8AB   |
    INC A               ; $06E8AE   |

CODE_06E8AF:
    CLC                 ; $06E8AF   |
    ADC $00             ; $06E8B0   |
    CLC                 ; $06E8B2   |
    ADC #$0018          ; $06E8B3   |
    CMP #$0030          ; $06E8B6   |
    BCS CODE_06E8F1     ; $06E8B9   |
    LDA $7182,x         ; $06E8BB   |
    CLC                 ; $06E8BE   |
    ADC $0C             ; $06E8BF   |
    SEC                 ; $06E8C1   |
    SBC #$0008          ; $06E8C2   |
    STA $00             ; $06E8C5   |
    SEC                 ; $06E8C7   |
    SBC $6090           ; $06E8C8   |
    CLC                 ; $06E8CB   |
    CMP #$000A          ; $06E8CC   |
    BMI CODE_06E8F1     ; $06E8CF   |
    CMP #$0020          ; $06E8D1   |
    BCS CODE_06E8F1     ; $06E8D4   |
    LDA $00             ; $06E8D6   |
    SEC                 ; $06E8D8   |
    SBC #$0020          ; $06E8D9   |
    STA $6090           ; $06E8DC   |
    INC $61B4           ; $06E8DF   |
    LDA #$0001          ; $06E8E2   |
    TSB $0E             ; $06E8E5   |
    LDA $72C0,x         ; $06E8E7   |
    CLC                 ; $06E8EA   |
    ADC $608C           ; $06E8EB   |
    STA $608C           ; $06E8EE   |

CODE_06E8F1:
    LDA $0A             ; $06E8F1   |
    STA $7A36,x         ; $06E8F3   |
    LDA $0C             ; $06E8F6   |
    STA $7A38,x         ; $06E8F8   |
    RTS                 ; $06E8FB   |

; platform ghost data
DATA_06E8FC:         dw $0000, $00C1
DATA_06E900:         dw $F4C8, $E5D0
DATA_06E904:         dw $D0D8, $ACE0
DATA_06E908:         dw $91E8, $86F0
DATA_06E90C:         dw $82F8, $8100
DATA_06E910:         dw $8101, $8209
DATA_06E914:         dw $8A11, $9819
DATA_06E918:         dw $DE20, $0028

; platform ghost data
DATA_06E91C:         dw $0000, $00C1
DATA_06E920:         dw $00C8, $00D0
DATA_06E924:         dw $00D8, $00E0
DATA_06E928:         dw $00E8, $00F0
DATA_06E92C:         dw $00F8, $0000
DATA_06E930:         dw $0001, $0009
DATA_06E934:         dw $0011, $0019
DATA_06E938:         dw $0020, $0028
DATA_06E93C:         dw $0040, $0040
DATA_06E940:         dw $0030, $0030

.init_soft_thing
    LDY #$00            ; $06E944   |
    LDA $70E2,x         ; $06E946   |
    BIT #$0010          ; $06E949   |
    BEQ CODE_06E950     ; $06E94C   |
    LDY #$02            ; $06E94E   |

CODE_06E950:
    LDA $E93C,y         ; $06E950   |
    STA $76,x           ; $06E953   |
    LDA $E940,y         ; $06E955   |
    STA $78,x           ; $06E958   |
    STZ $7B56,x         ; $06E95A   |
    STZ $7B58,x         ; $06E95D   |
    RTL                 ; $06E960   |

.main_soft_thing
    LDA #$F880          ; $06E961   |
    AND $18,x           ; $06E964   |
    STA $18,x           ; $06E966   |
    JSR CODE_06EA0A     ; $06E968   |
    JSL $03AF23         ; $06E96B   |
    LDA $7680,x         ; $06E96F   |
    CLC                 ; $06E972   |
    ADC #$0078          ; $06E973   |
    CMP #$01F0          ; $06E976   |
    BCS CODE_06E987     ; $06E979   |
    LDA $7682,x         ; $06E97B   |
    CLC                 ; $06E97E   |
    ADC #$0078          ; $06E97F   |
    CMP #$01C2          ; $06E982   |
    BCC CODE_06E98C     ; $06E985   |

CODE_06E987:
    JSL $03A31E         ; $06E987   |
    RTL                 ; $06E98B   |

CODE_06E98C:
    LDA $76,x           ; $06E98C   |
    CMP #$8000          ; $06E98E   |
    ROR A               ; $06E991   |
    STA $7BB6,x         ; $06E992   |
    LDA $78,x           ; $06E995   |
    CMP #$8000          ; $06E997   |
    ROR A               ; $06E99A   |
    STA $7BB8,x         ; $06E99B   |
    JSR CODE_06EB2C     ; $06E99E   |
    JSR CODE_06EBF8     ; $06E9A1   |
    JSR CODE_06EEFE     ; $06E9A4   |
    REP #$10            ; $06E9A7   |
    LDA $18,x           ; $06E9A9   |
    AND #$07FF          ; $06E9AB   |
    LDY $60D4           ; $06E9AE   |
    BEQ CODE_06E9C6     ; $06E9B1   |
    BIT #$0010          ; $06E9B3   |
    BEQ CODE_06E9C6     ; $06E9B6   |
    ORA #$0800          ; $06E9B8   |
    BIT #$0400          ; $06E9BB   |
    BEQ CODE_06E9C6     ; $06E9BE   |
    LDY #$0000          ; $06E9C0   |
    STY $60D4           ; $06E9C3   |

CODE_06E9C6:
    LDY $60C0           ; $06E9C6   |
    BNE CODE_06E9CE     ; $06E9C9   |
    ORA #$4000          ; $06E9CB   |

CODE_06E9CE:
    BIT #$0010          ; $06E9CE   |
    BEQ CODE_06E9D6     ; $06E9D1   |
    ORA #$1000          ; $06E9D3   |

CODE_06E9D6:
    BIT #$0020          ; $06E9D6   |
    BEQ CODE_06E9DE     ; $06E9D9   |
    ORA #$2000          ; $06E9DB   |

CODE_06E9DE:
    BIT #$0100          ; $06E9DE   |
    BEQ CODE_06E9E6     ; $06E9E1   |
    ORA #$8000          ; $06E9E3   |

CODE_06E9E6:
    STA $18,x           ; $06E9E6   |
    SEP #$10            ; $06E9E8   |
    LDX $12             ; $06E9EA   |
    RTL                 ; $06E9EC   |

; soft thing sub

CODE_06E9ED:
    LDA $76,x           ; $06E9ED   |
    LSR A               ; $06E9EF   |
    BCS CODE_06E9F3     ; $06E9F0   |
    DEC A               ; $06E9F2   |

CODE_06E9F3:
    STA $02             ; $06E9F3   |
    SEC                 ; $06E9F5   |
    SBC $76,x           ; $06E9F6   |
    INC A               ; $06E9F8   |
    STA $00             ; $06E9F9   |
    LDA $78,x           ; $06E9FB   |
    LSR A               ; $06E9FD   |
    BCS CODE_06EA01     ; $06E9FE   |
    DEC A               ; $06EA00   |

CODE_06EA01:
    STA $06             ; $06EA01   |
    SEC                 ; $06EA03   |
    SBC $78,x           ; $06EA04   |
    INC A               ; $06EA06   |
    STA $04             ; $06EA07   |
    RTS                 ; $06EA09   |

; soft thing sub

CODE_06EA0A:
    LDA $7680,x         ; $06EA0A   |
    ADC #$0078          ; $06EA0D   |
    CMP #$01F0          ; $06EA10   |
    BCC CODE_06EA21     ; $06EA13   |
    SEP #$20            ; $06EA15   |
    LDA #$04            ; $06EA17   |
    TRB $0967           ; $06EA19   |
    REP #$20            ; $06EA1C   |
    LDX $12             ; $06EA1E   |
    RTS                 ; $06EA20   |

CODE_06EA21:
    JSR CODE_06E9ED     ; $06EA21   |
    LDA $00             ; $06EA24   |
    SEC                 ; $06EA26   |
    SBC $7A38,x         ; $06EA27   |
    STA $70449E         ; $06EA2A   |
    STA $7044DA         ; $06EA2E   |
    CLC                 ; $06EA32   |
    ADC #$0001          ; $06EA33   |
    STA $7044A2         ; $06EA36   |
    STA $7044D6         ; $06EA3A   |
    CLC                 ; $06EA3E   |
    ADC #$0001          ; $06EA3F   |
    STA $7044A6         ; $06EA42   |
    STA $7044D2         ; $06EA46   |
    CLC                 ; $06EA4A   |
    ADC #$0002          ; $06EA4B   |
    STA $7044AA         ; $06EA4E   |
    STA $7044CE         ; $06EA52   |
    LDA $02             ; $06EA56   |
    CLC                 ; $06EA58   |
    ADC $7A38,x         ; $06EA59   |
    STA $7044BA         ; $06EA5C   |
    STA $7044BE         ; $06EA60   |
    SEC                 ; $06EA64   |
    SBC #$0001          ; $06EA65   |
    STA $7044B6         ; $06EA68   |
    STA $7044C2         ; $06EA6C   |
    SEC                 ; $06EA70   |
    SBC #$0001          ; $06EA71   |
    STA $7044B2         ; $06EA74   |
    STA $7044C6         ; $06EA78   |
    SEC                 ; $06EA7C   |
    SBC #$0002          ; $06EA7D   |
    STA $7044AE         ; $06EA80   |
    STA $7044CA         ; $06EA84   |
    LDA $04             ; $06EA88   |
    CLC                 ; $06EA8A   |
    ADC $7A38,x         ; $06EA8B   |
    STA $7044AC         ; $06EA8E   |
    STA $7044B0         ; $06EA92   |
    CLC                 ; $06EA96   |
    ADC #$0001          ; $06EA97   |
    STA $7044A8         ; $06EA9A   |
    STA $7044B4         ; $06EA9E   |
    CLC                 ; $06EAA2   |
    ADC #$0001          ; $06EAA3   |
    STA $7044A4         ; $06EAA6   |
    STA $7044B8         ; $06EAAA   |
    CLC                 ; $06EAAE   |
    ADC #$0002          ; $06EAAF   |
    STA $7044A0         ; $06EAB2   |
    STA $7044BC         ; $06EAB6   |
    LDA $06             ; $06EABA   |
    STA $7044D0         ; $06EABC   |
    STA $7044CC         ; $06EAC0   |
    SEC                 ; $06EAC4   |
    SBC #$0001          ; $06EAC5   |
    STA $7044D4         ; $06EAC8   |
    STA $7044C8         ; $06EACC   |
    SEC                 ; $06EAD0   |
    SBC #$0001          ; $06EAD1   |
    STA $7044D8         ; $06EAD4   |
    STA $7044C4         ; $06EAD8   |
    SEC                 ; $06EADC   |
    SBC #$0002          ; $06EADD   |
    STA $7044DC         ; $06EAE0   |
    STA $7044C0         ; $06EAE4   |
    LDA $7680,x         ; $06EAE8   |
    STA $6040           ; $06EAEB   |
    LDA $7682,x         ; $06EAEE   |
    STA $6042           ; $06EAF1   |
    LDA #$0010          ; $06EAF4   |
    STA $3002           ; $06EAF7   |
    LDA #$449E          ; $06EAFA   |
    STA $6048           ; $06EAFD   |
    LDA #$44DA          ; $06EB00   |
    STA $604A           ; $06EB03   |
    LDX #$08            ; $06EB06   |
    LDA #$E9E2          ; $06EB08   |
    JSL $7EDE44         ; $06EB0B   |
    JSL $00BE39         ; $06EB0F   |

; DMA args
DATA_06EB13:         dl $7E5040, $703372
DATA_06EB19:         dw $0348

    SEP #$30            ; $06EB1B   |
    LDA #$04            ; $06EB1D   |
    TSB $0967           ; $06EB1F   |
    LDA #$18            ; $06EB22   |
    TSB $094A           ; $06EB24   |
    REP #$20            ; $06EB27   |
    LDX $12             ; $06EB29   |
    RTS                 ; $06EB2B   |

; soft thing sub

CODE_06EB2C:
    JSR CODE_06E9ED     ; $06EB2C   |
    LDA $00             ; $06EB2F   |
    CLC                 ; $06EB31   |
    ADC $70E2,x         ; $06EB32   |
    STA $00             ; $06EB35   |
    LDA $02             ; $06EB37   |
    CLC                 ; $06EB39   |
    ADC $70E2,x         ; $06EB3A   |
    STA $02             ; $06EB3D   |
    LDA $04             ; $06EB3F   |
    CLC                 ; $06EB41   |
    ADC $7182,x         ; $06EB42   |
    STA $04             ; $06EB45   |
    LDA $06             ; $06EB47   |
    CLC                 ; $06EB49   |
    ADC $7182,x         ; $06EB4A   |
    STA $06             ; $06EB4D   |
    LDA #$0007          ; $06EB4F   |
    STA $08             ; $06EB52   |
    JSR CODE_06EFC9     ; $06EB54   |
    LDX $12             ; $06EB57   |
    LDA $0E             ; $06EB59   |
    ORA $18,x           ; $06EB5B   |
    STA $18,x           ; $06EB5D   |
    LDA $0E             ; $06EB5F   |
    AND #$0003          ; $06EB61   |
    BEQ CODE_06EBA7     ; $06EB64   |
    LDA $0E             ; $06EB66   |
    BIT #$0001          ; $06EB68   |
    BNE CODE_06EB87     ; $06EB6B   |
    LDA $04             ; $06EB6D   |
    EOR #$000F          ; $06EB6F   |
    BEQ CODE_06EB9E     ; $06EB72   |
    INC A               ; $06EB74   |
    AND #$000F          ; $06EB75   |
    STA $0A             ; $06EB78   |
    LDA $7222,x         ; $06EB7A   |
    BPL CODE_06EB9E     ; $06EB7D   |
    STZ $7222,x         ; $06EB7F   |
    STZ $72C2,x         ; $06EB82   |
    BRA CODE_06EB9E     ; $06EB85   |

CODE_06EB87:
    LDA $06             ; $06EB87   |
    INC A               ; $06EB89   |
    AND #$000F          ; $06EB8A   |
    EOR #$FFFF          ; $06EB8D   |
    INC A               ; $06EB90   |
    STA $0A             ; $06EB91   |
    LDA $7222,x         ; $06EB93   |
    BMI CODE_06EB9E     ; $06EB96   |
    STZ $7222,x         ; $06EB98   |
    STZ $72C2,x         ; $06EB9B   |

CODE_06EB9E:
    LDA $7182,x         ; $06EB9E   |
    CLC                 ; $06EBA1   |
    ADC $0A             ; $06EBA2   |
    STA $7182,x         ; $06EBA4   |

CODE_06EBA7:
    LDA $0E             ; $06EBA7   |
    AND #$000C          ; $06EBA9   |
    BEQ CODE_06EBF3     ; $06EBAC   |
    CMP #$000C          ; $06EBAE   |
    BEQ CODE_06EBF3     ; $06EBB1   |
    BIT #$0008          ; $06EBB3   |
    BEQ CODE_06EBD3     ; $06EBB6   |
    LDA $00             ; $06EBB8   |
    AND #$000F          ; $06EBBA   |
    EOR #$000F          ; $06EBBD   |
    INC A               ; $06EBC0   |
    AND #$000F          ; $06EBC1   |
    STA $08             ; $06EBC4   |
    LDA $7220,x         ; $06EBC6   |
    BPL CODE_06EBEA     ; $06EBC9   |
    STZ $7220,x         ; $06EBCB   |
    STZ $72C2,x         ; $06EBCE   |
    BRA CODE_06EBEA     ; $06EBD1   |

CODE_06EBD3:
    LDA $02             ; $06EBD3   |
    INC A               ; $06EBD5   |
    AND #$000F          ; $06EBD6   |
    EOR #$FFFF          ; $06EBD9   |
    INC A               ; $06EBDC   |
    STA $08             ; $06EBDD   |
    LDA $7220,x         ; $06EBDF   |
    BMI CODE_06EBEA     ; $06EBE2   |
    STZ $7220,x         ; $06EBE4   |
    STZ $72C0,x         ; $06EBE7   |

CODE_06EBEA:
    LDA $70E2,x         ; $06EBEA   |
    CLC                 ; $06EBED   |
    ADC $08             ; $06EBEE   |
    STA $70E2,x         ; $06EBF0   |

CODE_06EBF3:
    RTS                 ; $06EBF3   |

DATA_06EBF4:         dw $0001, $FFFF

; soft thing sub

CODE_06EBF8:
    STZ $0E             ; $06EBF8   |
    LDX $12             ; $06EBFA   |
    LDA $76,x           ; $06EBFC   |
    CMP #$8000          ; $06EBFE   |
    ROR A               ; $06EC01   |
    STA $7BB6,x         ; $06EC02   |
    LDA $78,x           ; $06EC05   |
    CMP #$8000          ; $06EC07   |
    ROR A               ; $06EC0A   |
    STA $7BB8,x         ; $06EC0B   |
    LDA $60B4           ; $06EC0E   |
    PHA                 ; $06EC11   |
    JSR CODE_06EDF6     ; $06EC12   |
    PLA                 ; $06EC15   |
    BCS CODE_06EC1B     ; $06EC16   |
    JMP CODE_06ECAF     ; $06EC18   |

CODE_06EC1B:
    CPY #$01            ; $06EC1B   |
    BNE CODE_06EC8F     ; $06EC1D   |
    LDA $0E             ; $06EC1F   |
    BEQ CODE_06EC92     ; $06EC21   |
    LDA $60D4           ; $06EC23   |
    BEQ CODE_06EC88     ; $06EC26   |
    LDA $18,x           ; $06EC28   |
    AND #$000C          ; $06EC2A   |
    CMP #$000C          ; $06EC2D   |
    BEQ CODE_06EC88     ; $06EC30   |
    LDA $78,x           ; $06EC32   |
    CMP #$000E          ; $06EC34   |
    BCC CODE_06EC81     ; $06EC37   |
    LDA $76,x           ; $06EC39   |
    PHA                 ; $06EC3B   |
    LDA $78,x           ; $06EC3C   |
    DEC A               ; $06EC3E   |
    TAY                 ; $06EC3F   |
    LDA #$0C00          ; $06EC40   |
    JSR CODE_06EFB7     ; $06EC43   |
    STA $76,x           ; $06EC46   |
    DEC $78,x           ; $06EC48   |
    LDA $78,x           ; $06EC4A   |
    LSR A               ; $06EC4C   |
    BCS CODE_06EC55     ; $06EC4D   |
    INC $6090           ; $06EC4F   |
    INC $7182,x         ; $06EC52   |

CODE_06EC55:
    PLA                 ; $06EC55   |
    EOR #$FFFF          ; $06EC56   |
    SEC                 ; $06EC59   |
    ADC $76,x           ; $06EC5A   |
    LSR A               ; $06EC5C   |
    STA $00             ; $06EC5D   |
    LDA $18,x           ; $06EC5F   |
    BIT #$000C          ; $06EC61   |
    BEQ CODE_06EC88     ; $06EC64   |
    BIT #$0008          ; $06EC66   |
    BEQ CODE_06EC76     ; $06EC69   |
    LDA $70E2,x         ; $06EC6B   |
    CLC                 ; $06EC6E   |
    ADC $00             ; $06EC6F   |
    STA $70E2,x         ; $06EC71   |
    BRA CODE_06EC88     ; $06EC74   |

CODE_06EC76:
    LDA $70E2,x         ; $06EC76   |
    SEC                 ; $06EC79   |
    SBC $00             ; $06EC7A   |
    STA $70E2,x         ; $06EC7C   |
    BRA CODE_06EC88     ; $06EC7F   |

CODE_06EC81:
    LDA $18,x           ; $06EC81   |
    ORA #$0400          ; $06EC83   |
    STA $18,x           ; $06EC86   |

CODE_06EC88:
    LDA $18,x           ; $06EC88   |
    ORA #$0110          ; $06EC8A   |
    STA $18,x           ; $06EC8D   |

CODE_06EC8F:
    JMP CODE_06EDF1     ; $06EC8F   |

CODE_06EC92:
    LDA $60C0           ; $06EC92   |
    BNE CODE_06ECA5     ; $06EC95   |
    LDY $06             ; $06EC97   |
    LDA $608C           ; $06EC99   |
    CLC                 ; $06EC9C   |
    ADC $7962,y         ; $06EC9D   |
    STA $608C           ; $06ECA0   |
    BRA CODE_06ECAC     ; $06ECA3   |

CODE_06ECA5:
    LDA $18,x           ; $06ECA5   |
    ORA #$0100          ; $06ECA7   |
    STA $18,x           ; $06ECAA   |

CODE_06ECAC:
    JMP CODE_06EDF1     ; $06ECAC   |

CODE_06ECAF:
    CMP $60B4           ; $06ECAF   |
    BNE CODE_06ECB7     ; $06ECB2   |
    JMP CODE_06EDF1     ; $06ECB4   |

CODE_06ECB7:
    STA $08             ; $06ECB7   |
    LDA $18,x           ; $06ECB9   |
    ORA #$0020          ; $06ECBB   |
    STA $18,x           ; $06ECBE   |
    LDY $06             ; $06ECC0   |
    LDA $7962,y         ; $06ECC2   |
    STA $0A             ; $06ECC5   |
    LDA $18,x           ; $06ECC7   |
    PHA                 ; $06ECC9   |
    AND #$BFFF          ; $06ECCA   |
    STA $18,x           ; $06ECCD   |
    PLA                 ; $06ECCF   |
    BIT #$4000          ; $06ECD0   |
    BNE CODE_06ECDC     ; $06ECD3   |
    LDY #$01            ; $06ECD5   |
    LDA $60C0           ; $06ECD7   |
    BNE CODE_06ED48     ; $06ECDA   |

CODE_06ECDC:
    LDA $60DE           ; $06ECDC   |
    BNE CODE_06ED48     ; $06ECDF   |
    LDA $6150           ; $06ECE1   |
    BNE CODE_06ED48     ; $06ECE4   |
    LDY $06             ; $06ECE6   |
    LDA $7962,y         ; $06ECE8   |
    BPL CODE_06ECF6     ; $06ECEB   |
    LDA $18,x           ; $06ECED   |
    BIT #$0004          ; $06ECEF   |
    BNE CODE_06ED69     ; $06ECF2   |
    BRA CODE_06ECFD     ; $06ECF4   |

CODE_06ECF6:
    LDA $18,x           ; $06ECF6   |
    BIT #$0008          ; $06ECF8   |
    BNE CODE_06ED69     ; $06ECFB   |

CODE_06ECFD:
    LDY $60AA           ; $06ECFD   |
    BMI CODE_06ED48     ; $06ED00   |
    LDA $70E2,x         ; $06ED02   |
    SEC                 ; $06ED05   |
    LDX $06             ; $06ED06   |
    SBC $EFA7,x         ; $06ED08   |
    LDX $12             ; $06ED0B   |
    SEC                 ; $06ED0D   |
    SBC $0A             ; $06ED0E   |
    STA $70E2,x         ; $06ED10   |
    LDA $08             ; $06ED13   |
    PHA                 ; $06ED15   |
    CLC                 ; $06ED16   |
    ADC #$00C0          ; $06ED17   |
    CMP #$0181          ; $06ED1A   |
    PLA                 ; $06ED1D   |
    BCC CODE_06ED2A     ; $06ED1E   |
    LDA #$00E0          ; $06ED20   |
    LDX $06             ; $06ED23   |
    BNE CODE_06ED2A     ; $06ED25   |
    LDA #$FF20          ; $06ED27   |

CODE_06ED2A:
    STA $60B4           ; $06ED2A   |
    LDA #$0000          ; $06ED2D   |
    STA $60A8           ; $06ED30   |
    LDA $7A96,x         ; $06ED33   |
    BNE CODE_06ED45     ; $06ED36   |
    LDA #$0059          ; $06ED38   |
    JSL $0085D2         ; $06ED3B   |
    LDA #$000A          ; $06ED3F   |
    STA $7A96,x         ; $06ED42   |

CODE_06ED45:
    JMP CODE_06EDEB     ; $06ED45   |

CODE_06ED48:
    LDA $608C           ; $06ED48   |
    CLC                 ; $06ED4B   |
    LDX $06             ; $06ED4C   |
    ADC $EFA7,x         ; $06ED4E   |
    LDX $12             ; $06ED51   |
    CLC                 ; $06ED53   |
    ADC $0A             ; $06ED54   |
    STA $608C           ; $06ED56   |
    CPY #$00            ; $06ED59   |
    BNE CODE_06ED60     ; $06ED5B   |
    JMP CODE_06EDEB     ; $06ED5D   |

CODE_06ED60:
    STZ $60A8           ; $06ED60   |
    STZ $60B4           ; $06ED63   |
    JMP CODE_06EDF1     ; $06ED66   |

CODE_06ED69:
    LDA $08             ; $06ED69   |
    PHA                 ; $06ED6B   |
    CLC                 ; $06ED6C   |
    ADC #$00C0          ; $06ED6D   |
    CMP #$0181          ; $06ED70   |
    PLA                 ; $06ED73   |
    BCC CODE_06ED80     ; $06ED74   |
    LDA #$00C0          ; $06ED76   |
    LDX $06             ; $06ED79   |
    BNE CODE_06ED80     ; $06ED7B   |
    LDA #$FF40          ; $06ED7D   |

CODE_06ED80:
    STA $60B4           ; $06ED80   |
    LDA #$0000          ; $06ED83   |
    STA $60A8           ; $06ED86   |
    LDX $12             ; $06ED89   |
    LDY #$00            ; $06ED8B   |
    LDA $18,x           ; $06ED8D   |
    AND #$0003          ; $06ED8F   |
    CMP #$0003          ; $06ED92   |
    BEQ CODE_06ED48     ; $06ED95   |
    LDA $76,x           ; $06ED97   |
    DEC A               ; $06ED99   |
    TAY                 ; $06ED9A   |
    LDA #$0C00          ; $06ED9B   |
    JSR CODE_06EFB7     ; $06ED9E   |
    LDY #$00            ; $06EDA1   |
    CMP #$0041          ; $06EDA3   |
    BCS CODE_06ED48     ; $06EDA6   |
    STA $78,x           ; $06EDA8   |
    DEC $76,x           ; $06EDAA   |
    LDA $76,x           ; $06EDAC   |
    AND #$0001          ; $06EDAE   |
    ASL A               ; $06EDB1   |
    ASL A               ; $06EDB2   |
    CLC                 ; $06EDB3   |
    ADC $06             ; $06EDB4   |
    TAY                 ; $06EDB6   |
    LDA $EFAF,y         ; $06EDB7   |
    CLC                 ; $06EDBA   |
    ADC $70E2,x         ; $06EDBB   |
    STA $70E2,x         ; $06EDBE   |
    LDX $06             ; $06EDC1   |
    LDA $EFA7,x         ; $06EDC3   |
    LDX $7972           ; $06EDC6   |
    CLC                 ; $06EDC9   |
    ADC $0A             ; $06EDCA   |
    CLC                 ; $06EDCC   |
    ADC $608C           ; $06EDCD   |
    CLC                 ; $06EDD0   |
    ADC $EFAF,y         ; $06EDD1   |
    STA $608C           ; $06EDD4   |
    LDA $7A96,x         ; $06EDD7   |
    BNE CODE_06EDE9     ; $06EDDA   |
    LDA #$0059          ; $06EDDC   |
    JSL $0085D2         ; $06EDDF   |
    LDA #$000A          ; $06EDE3   |
    STA $7A96,x         ; $06EDE6   |

CODE_06EDE9:
    LDX $12             ; $06EDE9   |

CODE_06EDEB:
    INC $61C2           ; $06EDEB   |
    INC $60DC           ; $06EDEE   |

CODE_06EDF1:
    RTS                 ; $06EDF1   |

DATA_06EDF2:         dw $0001, $FFFF

; soft thing sub

CODE_06EDF6:
    STZ $0E             ; $06EDF6   |
    BRA CODE_06EDFE     ; $06EDF8   |

CODE_06EDFA:
    LDY #$00            ; $06EDFA   |
    SEC                 ; $06EDFC   |
    RTS                 ; $06EDFD   |

CODE_06EDFE:
    LDA $6122           ; $06EDFE   |
    CLC                 ; $06EE01   |
    ADC $7BB8,x         ; $06EE02   |
    STA $00             ; $06EE05   |
    LDA $7C18,x         ; $06EE07   |
    SEC                 ; $06EE0A   |
    SBC $00             ; $06EE0B   |
    CLC                 ; $06EE0D   |
    ADC $7A38,x         ; $06EE0E   |
    BPL CODE_06EDFA     ; $06EE11   |
    STA $0A             ; $06EE13   |
    LDA $00             ; $06EE15   |
    SEC                 ; $06EE17   |
    ADC $7C18,x         ; $06EE18   |
    BEQ CODE_06EDFA     ; $06EE1B   |
    BMI CODE_06EDFA     ; $06EE1D   |
    STA $08             ; $06EE1F   |
    LDY #$00            ; $06EE21   |
    LDA $7C18,x         ; $06EE23   |
    BMI CODE_06EE2A     ; $06EE26   |
    LDY #$02            ; $06EE28   |

CODE_06EE2A:
    STY $0C             ; $06EE2A   |
    LDA $6120           ; $06EE2C   |
    CLC                 ; $06EE2F   |
    ADC $7BB6,x         ; $06EE30   |
    STA $00             ; $06EE33   |
    LDA $7C16,x         ; $06EE35   |
    SEC                 ; $06EE38   |
    SBC $00             ; $06EE39   |
    BPL CODE_06EDFA     ; $06EE3B   |
    STA $04             ; $06EE3D   |
    LDA $00             ; $06EE3F   |
    CLC                 ; $06EE41   |
    ADC $7C16,x         ; $06EE42   |
    BEQ CODE_06EDFA     ; $06EE45   |
    BMI CODE_06EDFA     ; $06EE47   |
    STA $02             ; $06EE49   |
    LDY #$00            ; $06EE4B   |
    LDA $7C16,x         ; $06EE4D   |
    BMI CODE_06EE54     ; $06EE50   |
    LDY #$02            ; $06EE52   |

CODE_06EE54:
    STY $06             ; $06EE54   |
    LDA $7962,y         ; $06EE56   |
    BPL CODE_06EE5F     ; $06EE59   |
    EOR #$FFFF          ; $06EE5B   |
    INC A               ; $06EE5E   |

CODE_06EE5F:
    STA $00             ; $06EE5F   |
    LDY $0C             ; $06EE61   |
    LDA $7968,y         ; $06EE63   |
    BPL CODE_06EE6C     ; $06EE66   |
    EOR #$FFFF          ; $06EE68   |
    INC A               ; $06EE6B   |

CODE_06EE6C:
    CMP $00             ; $06EE6C   |
    BCC CODE_06EE73     ; $06EE6E   |
    JMP CODE_06EEE2     ; $06EE70   |

CODE_06EE73:
    CMP #$000D          ; $06EE73   |
    BCC CODE_06EE8B     ; $06EE76   |
    JMP CODE_06EEE2     ; $06EE78   |
    LDA #$0040          ; $06EE7B   |
    STA $60B4           ; $06EE7E   |
    LDA $18,x           ; $06EE81   |
    ORA #$0040          ; $06EE83   |
    STA $18,x           ; $06EE86   |
    JMP CODE_06EEE2     ; $06EE88   |

CODE_06EE8B:
    LDA $7968,y         ; $06EE8B   |
    BEQ CODE_06EE9E     ; $06EE8E   |
    BMI CODE_06EE9E     ; $06EE90   |
    CLC                 ; $06EE92   |
    ADC $6090           ; $06EE93   |
    STA $6090           ; $06EE96   |
    STZ $60D2           ; $06EE99   |
    BRA CODE_06EED3     ; $06EE9C   |

CODE_06EE9E:
    SEC                 ; $06EE9E   |
    ADC $6090           ; $06EE9F   |
    STA $6090           ; $06EEA2   |
    LDA $7182,x         ; $06EEA5   |
    SEC                 ; $06EEA8   |
    SBC $6EBE           ; $06EEA9   |
    SEC                 ; $06EEAC   |
    ADC $6090           ; $06EEAD   |
    STA $6090           ; $06EEB0   |
    LDY $60AB           ; $06EEB3   |
    BPL CODE_06EEBB     ; $06EEB6   |
    JMP CODE_06EEFA     ; $06EEB8   |

CODE_06EEBB:
    LDA $70E2,x         ; $06EEBB   |
    SEC                 ; $06EEBE   |
    SBC $6EBC           ; $06EEBF   |
    CLC                 ; $06EEC2   |
    ADC $608C           ; $06EEC3   |
    STA $608C           ; $06EEC6   |
    INC $61B4           ; $06EEC9   |
    INC $0E             ; $06EECC   |
    LDA $60AA           ; $06EECE   |
    STA $0C             ; $06EED1   |

CODE_06EED3:
    LDA $7222,x         ; $06EED3   |
    BPL CODE_06EEDB     ; $06EED6   |
    LDA #$0000          ; $06EED8   |

CODE_06EEDB:
    STA $60AA           ; $06EEDB   |
    LDY #$01            ; $06EEDE   |
    SEC                 ; $06EEE0   |
    RTS                 ; $06EEE1   |

; soft thing sub

CODE_06EEE2:
    LDX $06             ; $06EEE2   |
    LDA $00             ; $06EEE4   |
    LSR A               ; $06EEE6   |
    BEQ CODE_06EEE9     ; $06EEE7   |

CODE_06EEE9:
    LDA $60B4           ; $06EEE9   |
    EOR $06EDF2,x       ; $06EEEC   |
    BPL CODE_06EEF8     ; $06EEF0   |
    STZ $60A8           ; $06EEF2   |
    STZ $60B4           ; $06EEF5   |

CODE_06EEF8:
    LDX $12             ; $06EEF8   |

CODE_06EEFA:
    LDY #$01            ; $06EEFA   |
    CLC                 ; $06EEFC   |
    RTS                 ; $06EEFD   |

; soft thing sub

CODE_06EEFE:
    LDA $18,x           ; $06EEFE   |
    BIT #$0100          ; $06EF00   |
    BEQ CODE_06EF1F     ; $06EF03   |
    LDA $18,x           ; $06EF05   |
    BIT #$8000          ; $06EF07   |
    BNE CODE_06EF3A     ; $06EF0A   |
    LDA #$0003          ; $06EF0C   |
    STA $7A36,x         ; $06EF0F   |
    LDA $60D4           ; $06EF12   |
    BEQ CODE_06EF1D     ; $06EF15   |
    LDA #$0005          ; $06EF17   |
    STA $7A36,x         ; $06EF1A   |

CODE_06EF1D:
    BRA CODE_06EF3A     ; $06EF1D   |

CODE_06EF1F:
    LDA $18,x           ; $06EF1F   |
    BIT #$0020          ; $06EF21   |
    BEQ CODE_06EF3A     ; $06EF24   |
    BIT #$2000          ; $06EF26   |
    BNE CODE_06EF3A     ; $06EF29   |
    LDA $7978,x         ; $06EF2B   |
    ORA #$0080          ; $06EF2E   |
    STA $7978,x         ; $06EF31   |
    LDA #$FFFD          ; $06EF34   |
    STA $7A36,x         ; $06EF37   |

CODE_06EF3A:
    LDA $7A36,x         ; $06EF3A   |
    BEQ CODE_06EFA6     ; $06EF3D   |

CODE_06EF3F:
    SEC                 ; $06EF3F   |
    SBC $7A38,x         ; $06EF40   |
    BEQ CODE_06EF81     ; $06EF43   |
    AND #$8000          ; $06EF45   |
    CLC                 ; $06EF48   |
    ROL A               ; $06EF49   |
    ROL A               ; $06EF4A   |
    ASL A               ; $06EF4B   |
    TAY                 ; $06EF4C   |
    LDA $EBF4,y         ; $06EF4D   |
    CLC                 ; $06EF50   |
    ADC $7A38,x         ; $06EF51   |
    STA $7A38,x         ; $06EF54   |
    LDA $18,x           ; $06EF57   |
    BIT #$0010          ; $06EF59   |
    BEQ CODE_06EF6D     ; $06EF5C   |
    LDA $60AA           ; $06EF5E   |
    BMI CODE_06EF6D     ; $06EF61   |
    LDA $EBF4,y         ; $06EF63   |
    CLC                 ; $06EF66   |
    ADC $6090           ; $06EF67   |
    STA $6090           ; $06EF6A   |

CODE_06EF6D:
    LDA $7A98,x         ; $06EF6D   |
    BNE CODE_06EFA6     ; $06EF70   |
    LDA #$0062          ; $06EF72   |
    JSL $0085D2         ; $06EF75   |
    LDA #$000C          ; $06EF79   |
    STA $7A98,x         ; $06EF7C   |
    BRA CODE_06EFA6     ; $06EF7F   |

CODE_06EF81:
    LDA $18,x           ; $06EF81   |
    BIT #$0080          ; $06EF83   |
    BNE CODE_06EF97     ; $06EF86   |
    LDA $7A36,x         ; $06EF88   |
    EOR #$FFFF          ; $06EF8B   |
    INC A               ; $06EF8E   |
    BMI CODE_06EF92     ; $06EF8F   |
    DEC A               ; $06EF91   |

CODE_06EF92:
    STA $7A36,x         ; $06EF92   |
    BRA CODE_06EF3F     ; $06EF95   |

CODE_06EF97:
    LDA $18,x           ; $06EF97   |
    AND #$FF7F          ; $06EF99   |
    STA $18,x           ; $06EF9C   |
    LDA #$0001          ; $06EF9E   |
    STA $7A36,x         ; $06EFA1   |
    BRA CODE_06EF3F     ; $06EFA4   |

CODE_06EFA6:
    RTS                 ; $06EFA6   |

DATA_06EFA7:         dw $FFFF, $0001
DATA_06EFAB:         dw $0001, $FFFF
DATA_06EFAF:         dw $0000, $0001
DATA_06EFB3:         dw $FFFF, $0000

; soft thing sub

CODE_06EFB7:
    STA $4204           ; $06EFB7   |
    STY $4206           ; $06EFBA   |
    NOP                 ; $06EFBD   |
    NOP                 ; $06EFBE   |
    NOP                 ; $06EFBF   |
    NOP                 ; $06EFC0   |
    NOP                 ; $06EFC1   |
    NOP                 ; $06EFC2   |
    NOP                 ; $06EFC3   |
    NOP                 ; $06EFC4   |
    LDA $4214           ; $06EFC5   |
    RTS                 ; $06EFC8   |

; soft thing sub

CODE_06EFC9:
    STZ $0E             ; $06EFC9   |
    DEC $00             ; $06EFCB   |
    INC $02             ; $06EFCD   |
    LDA $04             ; $06EFCF   |
    CLC                 ; $06EFD1   |
    ADC $08             ; $06EFD2   |
    STA $0A             ; $06EFD4   |
    LDA $06             ; $06EFD6   |
    SEC                 ; $06EFD8   |
    SBC $08             ; $06EFD9   |
    STA $0C             ; $06EFDB   |

CODE_06EFDD:
    LDA $00             ; $06EFDD   |
    STA $3010           ; $06EFDF   |
    LDA $0A             ; $06EFE2   |
    STA $3000           ; $06EFE4   |
    LDX #$0A            ; $06EFE7   |
    LDA #$CE2F          ; $06EFE9   |
    JSL $7EDE91         ; $06EFEC   |
    LDA $300A           ; $06EFF0   |
    BEQ CODE_06EFFC     ; $06EFF3   |
    LDA $0E             ; $06EFF5   |
    ORA #$0008          ; $06EFF7   |
    STA $0E             ; $06EFFA   |

CODE_06EFFC:
    LDA $02             ; $06EFFC   |
    STA $3010           ; $06EFFE   |
    LDA $0A             ; $06F001   |
    STA $3000           ; $06F003   |
    LDX #$0A            ; $06F006   |
    LDA #$CE2F          ; $06F008   |
    JSL $7EDE91         ; $06F00B   |
    LDA $300A           ; $06F00F   |
    BEQ CODE_06F01B     ; $06F012   |
    LDA $0E             ; $06F014   |
    ORA #$0004          ; $06F016   |
    STA $0E             ; $06F019   |

CODE_06F01B:
    LDA $0E             ; $06F01B   |
    AND #$000C          ; $06F01D   |
    CMP #$000C          ; $06F020   |
    BEQ CODE_06F036     ; $06F023   |
    LDA $0A             ; $06F025   |
    AND #$FFF0          ; $06F027   |
    CLC                 ; $06F02A   |
    ADC #$0010          ; $06F02B   |
    STA $0A             ; $06F02E   |
    CMP $0C             ; $06F030   |
    BEQ CODE_06EFDD     ; $06F032   |
    BCC CODE_06EFDD     ; $06F034   |

CODE_06F036:
    INC $00             ; $06F036   |
    DEC $02             ; $06F038   |
    DEC $04             ; $06F03A   |
    DEC $04             ; $06F03C   |
    INC $06             ; $06F03E   |
    LDA $00             ; $06F040   |
    CLC                 ; $06F042   |
    ADC $08             ; $06F043   |
    STA $0A             ; $06F045   |
    LDA $02             ; $06F047   |
    SEC                 ; $06F049   |
    SBC $08             ; $06F04A   |
    STA $0C             ; $06F04C   |

CODE_06F04E:
    LDA $0A             ; $06F04E   |
    STA $3010           ; $06F050   |
    LDA $06             ; $06F053   |
    STA $3000           ; $06F055   |
    LDX #$0A            ; $06F058   |
    LDA #$CE2F          ; $06F05A   |
    JSL $7EDE91         ; $06F05D   |
    LDA $300A           ; $06F061   |
    BEQ CODE_06F06D     ; $06F064   |
    LDA $0E             ; $06F066   |
    ORA #$0001          ; $06F068   |
    STA $0E             ; $06F06B   |

CODE_06F06D:
    LDA $0E             ; $06F06D   |
    AND #$0003          ; $06F06F   |
    CMP #$0003          ; $06F072   |
    BEQ CODE_06F088     ; $06F075   |
    LDA $0A             ; $06F077   |
    AND #$FFF0          ; $06F079   |
    CLC                 ; $06F07C   |
    ADC #$0010          ; $06F07D   |
    STA $0A             ; $06F080   |
    CMP $0C             ; $06F082   |
    BEQ CODE_06F04E     ; $06F084   |
    BCC CODE_06F04E     ; $06F086   |

CODE_06F088:
    INC $04             ; $06F088   |
    INC $04             ; $06F08A   |
    DEC $06             ; $06F08C   |
    RTS                 ; $06F08E   |

.init_platform_ghost_sewer
    LDA $70449E         ; $06F08F   |
    CLC                 ; $06F093   |
    ADC $70E2,x         ; $06F094   |
    CLC                 ; $06F097   |
    ADC #$0018          ; $06F098   |
    STA $79D6,x         ; $06F09B   |
    LDA $7044A8         ; $06F09E   |
    CLC                 ; $06F0A2   |
    ADC $7182,x         ; $06F0A3   |
    SEC                 ; $06F0A6   |
    SBC #$0008          ; $06F0A7   |
    STA $79D8,x         ; $06F0AA   |
    LDA #$0600          ; $06F0AD   |
    STA $18,x           ; $06F0B0   |
    STZ $7400,x         ; $06F0B2   |
    STZ $7900,x         ; $06F0B5   |
    STZ $7902,x         ; $06F0B8   |
    STZ $7A96,x         ; $06F0BB   |
    STZ $7A98,x         ; $06F0BE   |
    RTL                 ; $06F0C1   |

.main_platform_ghost_sewer
    LDA $7902,x         ; $06F0C2   |
    STA $0E             ; $06F0C5   |
    JSR CODE_06F0EF     ; $06F0C7   |
    JSR CODE_06F1A4     ; $06F0CA   |
    JSR CODE_06F1C6     ; $06F0CD   |
    JSR CODE_06F23F     ; $06F0D0   |
    JSL $03AF23         ; $06F0D3   |
    LDA $0E             ; $06F0D7   |
    BMI CODE_06F0E1     ; $06F0D9   |
    JSL $03A31E         ; $06F0DB   |
    BRA CODE_06F0E9     ; $06F0DF   |

CODE_06F0E1:
    LDA $7900,x         ; $06F0E1   |
    STA $18,x           ; $06F0E4   |
    JSR CODE_06F383     ; $06F0E6   |

CODE_06F0E9:
    LDA $0E             ; $06F0E9   |
    STA $7902,x         ; $06F0EB   |
    RTL                 ; $06F0EE   |

; platform ghost sewer sub

CODE_06F0EF:
    LDA #$49F6          ; $06F0EF   |
    STA $3002           ; $06F0F2   |
    LDA #$4B36          ; $06F0F5   |
    STA $3004           ; $06F0F8   |
    LDA #$0006          ; $06F0FB   |
    STA $3000           ; $06F0FE   |
    STA $3010           ; $06F101   |
    LDA $18,x           ; $06F104   |
    XBA                 ; $06F106   |
    ASL A               ; $06F107   |
    TAY                 ; $06F108   |
    LDA $F3EF,y         ; $06F109   |
    STA $301C           ; $06F10C   |
    INY                 ; $06F10F   |
    INY                 ; $06F110   |
    LDA $F3EF,y         ; $06F111   |
    STA $300E           ; $06F114   |
    LDA #$0032          ; $06F117   |
    STA $3006           ; $06F11A   |
    LDA #$0019          ; $06F11D   |
    STA $3008           ; $06F120   |
    LDA #$449E          ; $06F123   |
    STA $300A           ; $06F126   |
    LDA $18,x           ; $06F129   |
    AND #$00FF          ; $06F12B   |
    STA $300C           ; $06F12E   |
    LDA #$8000          ; $06F131   |
    TRB $0E             ; $06F134   |
    LDA $7680,x         ; $06F136   |
    STA $00             ; $06F139   |
    STA $6040           ; $06F13B   |
    CLC                 ; $06F13E   |
    ADC #$0080          ; $06F13F   |
    CMP #$0200          ; $06F142   |
    BCC CODE_06F14A     ; $06F145   |
    JMP CODE_06F1A1     ; $06F147   |

CODE_06F14A:
    LDA $7682,x         ; $06F14A   |
    STA $02             ; $06F14D   |
    STA $6042           ; $06F14F   |
    CLC                 ; $06F152   |
    ADC #$00D2          ; $06F153   |
    CMP #$02A4          ; $06F156   |
    BCC CODE_06F15E     ; $06F159   |
    JMP CODE_06F1A1     ; $06F15B   |

CODE_06F15E:
    LDA #$FF83          ; $06F15E   |
    STA $6044           ; $06F161   |
    LDA #$FF2A          ; $06F164   |
    STA $6046           ; $06F167   |
    LDX #$08            ; $06F16A   |
    LDA #$E800          ; $06F16C   |
    JSL $7EDE44         ; $06F16F   |
    JSL $00BE39         ; $06F173   |

; DMA args
DATA_06F177:         dl $7E5040, $703372
DATA_06F17D:         dw $0348

    SEP #$30            ; $06F17F   |
    LDA #$13            ; $06F181   |
    STA $0967           ; $06F183   |
    LDA #$04            ; $06F186   |
    STA $0968           ; $06F188   |
    LDA #$22            ; $06F18B   |
    STA $096B           ; $06F18D   |
    LDA #$63            ; $06F190   |
    STA $096C           ; $06F192   |
    LDA #$18            ; $06F195   |
    TSB $094A           ; $06F197   |
    REP #$20            ; $06F19A   |
    LDA #$8000          ; $06F19C   |
    TSB $0E             ; $06F19F   |

CODE_06F1A1:
    LDX $12             ; $06F1A1   |
    RTS                 ; $06F1A3   |

; platform ghost sewer sub

CODE_06F1A4:
    LDA #$0008          ; $06F1A4   |
    STA $00             ; $06F1A7   |
    LDA $18,x           ; $06F1A9   |
    CMP #$0C00          ; $06F1AB   |
    BCC CODE_06F1B7     ; $06F1AE   |
    PHA                 ; $06F1B0   |
    LDA #$0004          ; $06F1B1   |
    STA $00             ; $06F1B4   |
    PLA                 ; $06F1B6   |

CODE_06F1B7:
    CLC                 ; $06F1B7   |
    ADC $00             ; $06F1B8   |
    CMP #$0D00          ; $06F1BA   |
    BCC CODE_06F1C2     ; $06F1BD   |
    LDA #$0000          ; $06F1BF   |

CODE_06F1C2:
    STA $7900,x         ; $06F1C2   |
    RTS                 ; $06F1C5   |

; platform ghost sewer sub

CODE_06F1C6:
    LDA $7900,x         ; $06F1C6   |
    XBA                 ; $06F1C9   |
    ASL A               ; $06F1CA   |
    TAY                 ; $06F1CB   |
    LDA $F3EF,y         ; $06F1CC   |
    STA $00             ; $06F1CF   |
    INY                 ; $06F1D1   |
    INY                 ; $06F1D2   |
    LDA $F3EF,y         ; $06F1D3   |
    STA $02             ; $06F1D6   |
    LDY #$00            ; $06F1D8   |
    LDA ($00),y         ; $06F1DA   |
    AND #$00FF          ; $06F1DC   |
    SEC                 ; $06F1DF   |
    SBC #$007D          ; $06F1E0   |
    STA $3002           ; $06F1E3   |
    LDA ($02),y         ; $06F1E6   |
    AND #$00FF          ; $06F1E8   |
    SEC                 ; $06F1EB   |
    SBC #$007D          ; $06F1EC   |
    STA $3006           ; $06F1EF   |
    LDY #$05            ; $06F1F2   |
    LDA ($00),y         ; $06F1F4   |
    AND #$00FF          ; $06F1F6   |
    SEC                 ; $06F1F9   |
    SBC #$00D6          ; $06F1FA   |
    STA $3004           ; $06F1FD   |
    LDA ($02),y         ; $06F200   |
    AND #$00FF          ; $06F202   |
    SEC                 ; $06F205   |
    SBC #$00D6          ; $06F206   |
    STA $300A           ; $06F209   |
    LDA $7900,x         ; $06F20C   |
    AND #$00FF          ; $06F20F   |
    STA $300C           ; $06F212   |
    LDX #$08            ; $06F215   |
    LDA #$EB9D          ; $06F217   |
    JSL $7EDE44         ; $06F21A   |
    LDX $12             ; $06F21E   |
    LDA $300E           ; $06F220   |
    CLC                 ; $06F223   |
    ADC $70E2,x         ; $06F224   |
    CLC                 ; $06F227   |
    ADC #$0018          ; $06F228   |
    STA $00             ; $06F22B   |
    LDA $3010           ; $06F22D   |
    CLC                 ; $06F230   |
    ADC $7182,x         ; $06F231   |
    SEC                 ; $06F234   |
    SBC #$0008          ; $06F235   |
    STA $02             ; $06F238   |
    RTS                 ; $06F23A   |

DATA_06F23B:         dw $FF80, $0080

; platform ghost sewer sub

CODE_06F23F:
    LDA $76,x           ; $06F23F   |
    SEC                 ; $06F241   |
    SBC $70E2,x         ; $06F242   |
    SEC                 ; $06F245   |
    SBC #$0008          ; $06F246   |
    STA $04             ; $06F249   |
    LDA $78,x           ; $06F24B   |
    SEC                 ; $06F24D   |
    SBC $7182,x         ; $06F24E   |
    SEC                 ; $06F251   |
    SBC #$0008          ; $06F252   |
    STA $06             ; $06F255   |
    LDA $00             ; $06F257   |
    CMP $79D6,x         ; $06F259   |
    BEQ CODE_06F274     ; $06F25C   |
    BCC CODE_06F26B     ; $06F25E   |
    LDA $7400,x         ; $06F260   |
    ORA #$0002          ; $06F263   |
    STA $7400,x         ; $06F266   |
    BRA CODE_06F274     ; $06F269   |

CODE_06F26B:
    LDA $7400,x         ; $06F26B   |
    AND #$FFFD          ; $06F26E   |
    STA $7400,x         ; $06F271   |

CODE_06F274:
    LDA $02             ; $06F274   |
    CMP $79D8,x         ; $06F276   |
    BEQ CODE_06F291     ; $06F279   |
    BCC CODE_06F288     ; $06F27B   |
    LDA $7400,x         ; $06F27D   |
    ORA #$0004          ; $06F280   |
    STA $7400,x         ; $06F283   |
    BRA CODE_06F291     ; $06F286   |

CODE_06F288:
    LDA $7400,x         ; $06F288   |
    AND #$FFFB          ; $06F28B   |
    STA $7400,x         ; $06F28E   |

CODE_06F291:
    LDA $7400,x         ; $06F291   |
    AND #$0002          ; $06F294   |
    TAY                 ; $06F297   |
    LDA $F23B,y         ; $06F298   |
    CLC                 ; $06F29B   |
    ADC $7A36,x         ; $06F29C   |
    STA $08             ; $06F29F   |
    BPL CODE_06F2A7     ; $06F2A1   |
    EOR #$FFFF          ; $06F2A3   |
    INC A               ; $06F2A6   |

CODE_06F2A7:
    CMP #$0400          ; $06F2A7   |
    BCS CODE_06F2B1     ; $06F2AA   |
    LDA $08             ; $06F2AC   |
    STA $7A36,x         ; $06F2AE   |

CODE_06F2B1:
    LDA $7A36,x         ; $06F2B1   |
    AND #$FF00          ; $06F2B4   |
    BPL CODE_06F2BC     ; $06F2B7   |
    ORA #$00FF          ; $06F2B9   |

CODE_06F2BC:
    XBA                 ; $06F2BC   |
    STA $08             ; $06F2BD   |
    REP #$10            ; $06F2BF   |
    LDY $7362,x         ; $06F2C1   |
    LDX #$0004          ; $06F2C4   |

CODE_06F2C7:
    LDA $08             ; $06F2C7   |
    CLC                 ; $06F2C9   |
    ADC $04             ; $06F2CA   |
    CLC                 ; $06F2CC   |
    ADC $6000,y         ; $06F2CD   |
    STA $6000,y         ; $06F2D0   |
    LDA $6002,y         ; $06F2D3   |
    CLC                 ; $06F2D6   |
    ADC $06             ; $06F2D7   |
    CLC                 ; $06F2D9   |
    ADC #$0008          ; $06F2DA   |
    STA $6002,y         ; $06F2DD   |
    TYA                 ; $06F2E0   |
    CLC                 ; $06F2E1   |
    ADC #$0008          ; $06F2E2   |
    TAY                 ; $06F2E5   |
    DEX                 ; $06F2E6   |
    BNE CODE_06F2C7     ; $06F2E7   |
    LDX #$0003          ; $06F2E9   |

CODE_06F2EC:
    LDA $6000,y         ; $06F2EC   |
    CLC                 ; $06F2EF   |
    ADC $04             ; $06F2F0   |
    STA $6000,y         ; $06F2F2   |
    LDA $6002,y         ; $06F2F5   |
    CLC                 ; $06F2F8   |
    ADC $06             ; $06F2F9   |
    STA $6002,y         ; $06F2FB   |
    LDA $6004,y         ; $06F2FE   |
    AND #$7FFF          ; $06F301   |
    STA $6004,y         ; $06F304   |
    TYA                 ; $06F307   |
    CLC                 ; $06F308   |
    ADC #$0008          ; $06F309   |
    TAY                 ; $06F30C   |
    DEX                 ; $06F30D   |
    BNE CODE_06F2EC     ; $06F30E   |
    LDX $12             ; $06F310   |
    SEP #$10            ; $06F312   |
    LDA $7A96,x         ; $06F314   |
    BNE CODE_06F348     ; $06F317   |
    LDA #$01BA          ; $06F319   |
    JSL $008B21         ; $06F31C   |
    LDA $70E2,x         ; $06F320   |
    SEC                 ; $06F323   |
    SBC #$0008          ; $06F324   |
    STA $70A2,y         ; $06F327   |
    LDA $7182,x         ; $06F32A   |
    SEC                 ; $06F32D   |
    SBC #$000C          ; $06F32E   |
    STA $7142,y         ; $06F331   |
    LDA #$001A          ; $06F334   |
    STA $7E4C,y         ; $06F337   |
    LDA #$0003          ; $06F33A   |
    STA $7782,y         ; $06F33D   |
    LDA #$002E          ; $06F340   |
    STA $7A96,x         ; $06F343   |
    LDY #$00            ; $06F346   |

CODE_06F348:
    SEP #$10            ; $06F348   |
    RTS                 ; $06F34A   |

; data table, no idea where it's used (platform sewer ghost?)
DATA_06F34B:         dw $0007, $0008
DATA_06F34F:         dw $0009, $000A
DATA_06F353:         dw $0009, $0008
DATA_06F357:         dw $0007, $0006
DATA_06F35B:         dw $0005, $0004
DATA_06F35F:         dw $0003, $0002
DATA_06F363:         dw $0001, $0000
DATA_06F367:         dw $0003, $0004
DATA_06F36B:         dw $0005, $0004
DATA_06F36F:         dw $0003, $0003
DATA_06F373:         dw $0003, $0003
DATA_06F377:         dw $0003, $0003
DATA_06F37B:         dw $0003, $0003
DATA_06F37F:         dw $0003, $0003

; platform ghost sewer sub

CODE_06F383:
    LDA $0E             ; $06F383   |
    BIT #$0001          ; $06F385   |
    BEQ CODE_06F39B     ; $06F388   |
    LDA $00             ; $06F38A   |
    SEC                 ; $06F38C   |
    SBC $76,x           ; $06F38D   |
    CLC                 ; $06F38F   |
    ADC $608C           ; $06F390   |
    STA $608C           ; $06F393   |
    LDA #$0001          ; $06F396   |
    TRB $0E             ; $06F399   |

CODE_06F39B:
    LDA $60AA           ; $06F39B   |
    BMI CODE_06F3E6     ; $06F39E   |
    LDA $611C           ; $06F3A0   |
    SEC                 ; $06F3A3   |
    SBC $00             ; $06F3A4   |
    STA $04             ; $06F3A6   |
    ASL A               ; $06F3A8   |
    LDA $6120           ; $06F3A9   |
    BCS CODE_06F3B2     ; $06F3AC   |
    EOR #$FFFF          ; $06F3AE   |
    INC A               ; $06F3B1   |

CODE_06F3B2:
    CLC                 ; $06F3B2   |
    ADC $04             ; $06F3B3   |
    CLC                 ; $06F3B5   |
    ADC #$0018          ; $06F3B6   |
    CMP #$0030          ; $06F3B9   |
    BCS CODE_06F3E6     ; $06F3BC   |
    LDA $02             ; $06F3BE   |
    SEC                 ; $06F3C0   |
    SBC #$0008          ; $06F3C1   |
    STA $04             ; $06F3C4   |
    SEC                 ; $06F3C6   |
    SBC $6090           ; $06F3C7   |
    CLC                 ; $06F3CA   |
    CMP #$000A          ; $06F3CB   |
    BMI CODE_06F3E6     ; $06F3CE   |
    CMP #$0020          ; $06F3D0   |
    BCS CODE_06F3E6     ; $06F3D3   |
    LDA $04             ; $06F3D5   |
    SEC                 ; $06F3D7   |
    SBC #$0020          ; $06F3D8   |
    STA $6090           ; $06F3DB   |
    INC $61B4           ; $06F3DE   |
    LDA #$0001          ; $06F3E1   |
    TSB $0E             ; $06F3E4   |

CODE_06F3E6:
    LDA $00             ; $06F3E6   |
    STA $76,x           ; $06F3E8   |
    LDA $02             ; $06F3EA   |
    STA $78,x           ; $06F3EC   |
    RTS                 ; $06F3EE   |

; platform ghost sewer data pointers
DATA_06F3EF:         dw $F40B
DATA_06F3F1:         dw $F46F
DATA_06F3F3:         dw $F4D3
DATA_06F3F5:         dw $F537
DATA_06F3F7:         dw $F59B
DATA_06F3F9:         dw $F5FF
DATA_06F3FB:         dw $F663
DATA_06F3FD:         dw $F6C7
DATA_06F3FF:         dw $F72B
DATA_06F401:         dw $F78F
DATA_06F403:         dw $F7F3
DATA_06F405:         dw $F857
DATA_06F407:         dw $F8BB
DATA_06F409:         dw $F40B

; platform ghost sewer data tables
DATA_06F40D:         dw $6903, $670B, $6724, $692C
DATA_06F415:         dw $6C2F, $7231, $7734, $7D37
DATA_06F41D:         dw $823A, $873F, $8D44, $924B
DATA_06F425:         dw $9752, $9D5A, $A262, $A76A
DATA_06F42D:         dw $AD72, $B279, $B77F, $BD84
DATA_06F435:         dw $C289, $C78C, $CD8F, $D292
DATA_06F43D:         dw $D794, $DA93, $DB92, $DB67
DATA_06F445:         dw $DA66, $D765, $D264, $CD61
DATA_06F44D:         dw $C75E, $C25B, $BD56, $B751
DATA_06F455:         dw $B24A, $AD43, $A73B, $A233
DATA_06F45D:         dw $9D2B, $9723, $921C, $8D15
DATA_06F465:         dw $8710, $820B, $7D08, $7705
DATA_06F46D:         dw $7202

DATA_06F46F:         dw $8603, $8306, $810E
DATA_06F475:         dw $8127, $832F, $8632, $8B35
DATA_06F47D:         dw $8F38, $933B, $973F, $9B44
DATA_06F485:         dw $9F49, $A34F, $A755, $AB5C
DATA_06F48D:         dw $AF63, $B36B, $B772, $BB78
DATA_06F495:         dw $BF7D, $C382, $C787, $CB8B
DATA_06F49D:         dw $CF8E, $D391, $D794, $DA93
DATA_06F4A5:         dw $DB92, $DB67, $DA66, $D765
DATA_06F4AD:         dw $D363, $CF60, $CB5D, $C759
DATA_06F4B5:         dw $C354, $BF4F, $BB49, $B743
DATA_06F4BD:         dw $B33C, $AF34, $AB2D, $A726
DATA_06F4C5:         dw $A320, $9F1A, $9B15, $9710
DATA_06F4CD:         dw $930C, $8F09, $8B06

DATA_06F4D3:         dw $9F0D
DATA_06F4D5:         dw $9C10, $9A18, $9A31, $9C39
DATA_06F4DD:         dw $9F3C, $A23F, $A542, $A846
DATA_06F4E5:         dw $AB4A, $AD4E, $B052, $B357
DATA_06F4ED:         dw $B65D, $B963, $BB68, $BE6E
DATA_06F4F5:         dw $C174, $C47A, $C77E, $C982
DATA_06F4FD:         dw $CC86, $CF8A, $D28E, $D591
DATA_06F505:         dw $D794, $DA93, $DB92, $DB67
DATA_06F50D:         dw $DA66, $D765, $D563, $D260
DATA_06F515:         dw $CF5C, $CC58, $C954, $C750
DATA_06F51D:         dw $C44B, $C145, $BE3F, $BB39
DATA_06F525:         dw $B934, $B62E, $B328, $B023
DATA_06F52D:         dw $AD1F, $AB1B, $A817, $A513
DATA_06F535:         dw $A210

DATA_06F537:         dw $B41E, $B121, $AF29
DATA_06F53D:         dw $AF42, $B14A, $B44D, $B650
DATA_06F545:         dw $B853, $BA56, $BB59, $BD5D
DATA_06F54D:         dw $BF60, $C164, $C268, $C46D
DATA_06F555:         dw $C671, $C875, $C97A, $CB7D
DATA_06F55D:         dw $CD81, $CF84, $D088, $D28B
DATA_06F565:         dw $D48E, $D691, $D794, $DA93
DATA_06F56D:         dw $DB92, $DB67, $DA66, $D765
DATA_06F575:         dw $D663, $D460, $D25D, $D05A
DATA_06F57D:         dw $CF56, $CD53, $CB4F, $C94B
DATA_06F585:         dw $C846, $C642, $C43E, $C239
DATA_06F58D:         dw $C135, $BF31, $BD2E, $BB2A
DATA_06F595:         dw $BA27, $B824, $B621

DATA_06F59B:         dw $C533
DATA_06F59D:         dw $C236, $C03E, $C057, $C25F
DATA_06F5A5:         dw $C562, $C665, $C767, $C869
DATA_06F5AD:         dw $C96C, $CA6E, $CB71, $CC73
DATA_06F5B5:         dw $CD76, $CE79, $CE7B, $CF7D
DATA_06F5BD:         dw $D080, $D183, $D285, $D388
DATA_06F5C5:         dw $D48A, $D58D, $D68F, $D691
DATA_06F5CD:         dw $D794, $DA93, $DB92, $DB67
DATA_06F5D5:         dw $DA66, $D765, $D663, $D661
DATA_06F5DD:         dw $D55F, $D45C, $D35A, $D257
DATA_06F5E5:         dw $D155, $D052, $CF4F, $CE4C
DATA_06F5ED:         dw $CE4A, $CD47, $CC44, $CB42
DATA_06F5F5:         dw $CA3F, $C93D, $C83A, $C738
DATA_06F5FD:         dw $C636

DATA_06F5FF:         dw $CF4C, $CC4F, $CA57
DATA_06F605:         dw $CA70, $CC78, $CF7B, $D07D
DATA_06F60D:         dw $D07D, $D17E, $D180, $D181
DATA_06F615:         dw $D282, $D283, $D385, $D386
DATA_06F61D:         dw $D387, $D488, $D48A, $D58B
DATA_06F625:         dw $D58C, $D58D, $D68F, $D690
DATA_06F62D:         dw $D691, $D692, $D794, $DA93
DATA_06F635:         dw $DB92, $DB67, $DA66, $D765
DATA_06F63D:         dw $D664, $D663, $D662, $D660
DATA_06F645:         dw $D55F, $D55E, $D55D, $D45B
DATA_06F64D:         dw $D45A, $D359, $D358, $D356
DATA_06F655:         dw $D255, $D254, $D153, $D151
DATA_06F65D:         dw $D150, $D04F, $D04E

DATA_06F663:         dw $D266
DATA_06F665:         dw $CF69, $CD71, $CD8A, $CF92
DATA_06F66D:         dw $D295, $D394, $D394, $D394
DATA_06F675:         dw $D394, $D494, $D494, $D494
DATA_06F67D:         dw $D494, $D594, $D594, $D594
DATA_06F685:         dw $D594, $D694, $D694, $D694
DATA_06F68D:         dw $D694, $D694, $D694, $D694
DATA_06F695:         dw $D794, $DA93, $DB92, $DB67
DATA_06F69D:         dw $DA66, $D765, $D666, $D666
DATA_06F6A5:         dw $D666, $D666, $D666, $D666
DATA_06F6AD:         dw $D666, $D566, $D566, $D566
DATA_06F6B5:         dw $D566, $D466, $D466, $D466
DATA_06F6BD:         dw $D466, $D366, $D366, $D366
DATA_06F6C5:         dw $D366

DATA_06F6C7:         dw $CB80, $C883, $C68B
DATA_06F6CD:         dw $C6A4, $C8AC, $CBAF, $CCAD
DATA_06F6D5:         dw $CDAC, $CDAB, $CEA9, $CEA8
DATA_06F6DD:         dw $CFA7, $D0A5, $D0A4, $D1A2
DATA_06F6E5:         dw $D1A1, $D2A0, $D39E, $D39D
DATA_06F6ED:         dw $D49B, $D49A, $D599, $D697
DATA_06F6F5:         dw $D696, $D695, $D794, $DA93
DATA_06F6FD:         dw $DB92, $DB67, $DA66, $D765
DATA_06F705:         dw $D667, $D668, $D669, $D56B
DATA_06F70D:         dw $D46C, $D46D, $D36F, $D370
DATA_06F715:         dw $D272, $D173, $D174, $D076
DATA_06F71D:         dw $D077, $CF79, $CE7A, $CE7B
DATA_06F725:         dw $CD7D, $CD7D, $CC7E

DATA_06F72B:         dw $B799
DATA_06F72D:         dw $B49C, $B2A4, $B2BD, $B4C5
DATA_06F735:         dw $B7C8, $B9C6, $BBC4, $BCC2
DATA_06F73D:         dw $BEBF, $BFBD, $C1BA, $C3B7
DATA_06F745:         dw $C4B4, $C6B1, $C7AE, $C9AA
DATA_06F74D:         dw $CBA7, $CCA4, $CEA1, $CF9E
DATA_06F755:         dw $D19C, $D399, $D497, $D695
DATA_06F75D:         dw $D794, $DA93, $DB92, $DB67
DATA_06F765:         dw $DA66, $D765, $D667, $D469
DATA_06F76D:         dw $D36B, $D16E, $CF70, $CE73
DATA_06F775:         dw $CC76, $CB79, $C97C, $C77F
DATA_06F77D:         dw $C682, $C485, $C388, $C18B
DATA_06F785:         dw $BF8E, $BE90, $BC93, $BB95
DATA_06F78D:         dw $B997

DATA_06F78F:         dw $95AE, $92B1, $90B9
DATA_06F795:         dw $90D2, $92DA, $95DD, $99DB
DATA_06F79D:         dw $9CD9, $9FD6, $A3D3, $A6D0
DATA_06F7A5:         dw $A9CC, $ADC8, $B0C3, $B3BD
DATA_06F7AD:         dw $B6B8, $BAB3, $BDAD, $C0A8
DATA_06F7B5:         dw $C4A4, $C7A0, $CA9D, $CE9A
DATA_06F7BD:         dw $D197, $D495, $D794, $DA93
DATA_06F7C5:         dw $DB92, $DB67, $DA66, $D765
DATA_06F7CD:         dw $D467, $D169, $CE6C, $CA6F
DATA_06F7D5:         dw $C772, $C476, $C07A, $BD7E
DATA_06F7DD:         dw $BA84, $B689, $B38E, $B094
DATA_06F7E5:         dw $AD99, $A99D, $A6A1, $A3A4
DATA_06F7ED:         dw $9FA7, $9CAA, $99AC

DATA_06F7F3:         dw $6BBF
DATA_06F7F5:         dw $68C2, $66CA, $66E3, $68EB
DATA_06F7FD:         dw $6BEE, $71EC, $76EA, $7CE8
DATA_06F805:         dw $81E5, $86E1, $8CDC, $91D6
DATA_06F80D:         dw $97CF, $9CC8, $A1C1, $A7B9
DATA_06F815:         dw $ACB2, $B2AB, $B7A5, $BCA0
DATA_06F81D:         dw $C29C, $C799, $CD97, $D295
DATA_06F825:         dw $D794, $DA93, $DB92, $DB67
DATA_06F82D:         dw $DA66, $D765, $D267, $CD69
DATA_06F835:         dw $C76B, $C26E, $BC72, $B777
DATA_06F83D:         dw $B27D, $AC83, $A78A, $A192
DATA_06F845:         dw $9C99, $97A0, $91A7, $8CAD
DATA_06F84D:         dw $86B2, $81B6, $7CB9, $76BB
DATA_06F855:         dw $71BD

DATA_06F857:         dw $39C9, $36CC, $34D4
DATA_06F85D:         dw $34ED, $36F5, $39F8, $41F7
DATA_06F865:         dw $49F6, $51F5, $59F2, $61ED
DATA_06F86D:         dw $69E8, $71E1, $79D8, $81CF
DATA_06F875:         dw $88C6, $90BC, $98B3, $A0AA
DATA_06F87D:         dw $A8A3, $B09E, $B899, $C096
DATA_06F885:         dw $C895, $D094, $D794, $DA93
DATA_06F88D:         dw $DB92, $DB67, $DA66, $D765
DATA_06F895:         dw $D066, $C867, $C068, $B86B
DATA_06F89D:         dw $B070, $A875, $A07C, $9884
DATA_06F8A5:         dw $908D, $8897, $81A0, $79A9
DATA_06F8AD:         dw $71B2, $69B9, $61BE, $59C3
DATA_06F8B5:         dw $51C6, $49C7, $41C8

DATA_06F8BB:         dw $05CC
DATA_06F8BD:         dw $02CF, $00D7, $00F0, $02F8
DATA_06F8C5:         dw $05FB, $10FC, $1AFC, $25FB
DATA_06F8CD:         dw $2FF9, $3AF5, $44EF, $4FE7
DATA_06F8D5:         dw $59DD, $64D2, $6EC7, $79BC
DATA_06F8DD:         dw $83B1, $8EA7, $989F, $A399
DATA_06F8E5:         dw $AD95, $B893, $C292, $CD92
DATA_06F8ED:         dw $D794, $DA93, $DB92, $DB67
DATA_06F8F5:         dw $DA66, $D765, $CD64, $C264
DATA_06F8FD:         dw $B865, $AD67, $A36B, $9871
DATA_06F905:         dw $8E79, $8382, $798D, $6E98
DATA_06F90D:         dw $64A3, $59AE, $4FB8, $44C0
DATA_06F915:         dw $3AC6, $2FCA, $25CC, $1ACD
DATA_06F91D:         dw $10CD

; uncompressed graphics files
DATA_06F91F:         dl $520000
DATA_06F922:         dl $528000
DATA_06F925:         dl $52C000
DATA_06F928:         dl $530000
DATA_06F92B:         dl $538000
DATA_06F92E:         dl $53C000
DATA_06F931:         dl $540000
DATA_06F934:         dl $548000
DATA_06F937:         dl $550000
DATA_06F93A:         dl $558000
DATA_06F93D:         dl $560000
DATA_06F940:         dl $566000
DATA_06F943:         dl $568000
DATA_06F946:         dl $569000
DATA_06F949:         dl $56A000
DATA_06F94C:         dl $56B000
DATA_06F94F:         dl $56C000
DATA_06F952:         dl $56D000
DATA_06F955:         dl $56E800
DATA_06F958:         dl $56EC00
DATA_06F95B:         dl $56FC00

; compression routine $08A980 graphics files
DATA_06F95E:         dl $573C00
DATA_06F961:         dl $5748E9
DATA_06F964:         dl $57555B
DATA_06F967:         dl $576234
DATA_06F96A:         dl $576EAB
DATA_06F96D:         dl $5778F9
DATA_06F970:         dl $57826C
DATA_06F973:         dl $578DB8
DATA_06F976:         dl $579952
DATA_06F979:         dl $57A56A
DATA_06F97C:         dl $57AECB
DATA_06F97F:         dl $57B9B0
DATA_06F982:         dl $57C271
DATA_06F985:         dl $57CEA1
DATA_06F988:         dl $57DBBA
DATA_06F98B:         dl $57E85A
DATA_06F98E:         dl $57F3C7
DATA_06F991:         dl $57F85E
DATA_06F994:         dl $57FDEA
DATA_06F997:         dl $58025D
DATA_06F99A:         dl $5803E1
DATA_06F99D:         dl $5808D6
DATA_06F9A0:         dl $580C65
DATA_06F9A3:         dl $580FCD
DATA_06F9A6:         dl $5814E1
DATA_06F9A9:         dl $581B2C
DATA_06F9AC:         dl $581FDA
DATA_06F9AF:         dl $5822D0
DATA_06F9B2:         dl $58285E
DATA_06F9B5:         dl $582FC1
DATA_06F9B8:         dl $5835E2
DATA_06F9BB:         dl $583C34
DATA_06F9BE:         dl $584016
DATA_06F9C1:         dl $58451B
DATA_06F9C4:         dl $584A74
DATA_06F9C7:         dl $584FBF
DATA_06F9CA:         dl $585A68
DATA_06F9CD:         dl $586597
DATA_06F9D0:         dl $58720F
DATA_06F9D3:         dl $587E21
DATA_06F9D6:         dl $5883AF
DATA_06F9D9:         dl $5888CD
DATA_06F9DC:         dl $588E8F
DATA_06F9DF:         dl $589574
DATA_06F9E2:         dl $589AE6
DATA_06F9E5:         dl $589D4F
DATA_06F9E8:         dl $589FC4
DATA_06F9EB:         dl $58A2CD
DATA_06F9EE:         dl $58A5D2
DATA_06F9F1:         dl $58B241
DATA_06F9F4:         dl $58BE20
DATA_06F9F7:         dl $58C992
DATA_06F9FA:         dl $58D774
DATA_06F9FD:         dl $58E471
DATA_06FA00:         dl $58EE33
DATA_06FA03:         dl $58F928
DATA_06FA06:         dl $5902AB
DATA_06FA09:         dl $590E7D
DATA_06FA0C:         dl $591A64
DATA_06FA0F:         dl $592757
DATA_06FA12:         dl $593432
DATA_06FA15:         dl $5941AC
DATA_06FA18:         dl $594E69
DATA_06FA1B:         dl $595892
DATA_06FA1E:         dl $5964EC
DATA_06FA21:         dl $597241
DATA_06FA24:         dl $597F14
DATA_06FA27:         dl $598ABB
DATA_06FA2A:         dl $5996AF
DATA_06FA2D:         dl $599C37
DATA_06FA30:         dl $59A7C1
DATA_06FA33:         dl $59B3E4
DATA_06FA36:         dl $59C08B
DATA_06FA39:         dl $59CD17
DATA_06FA3C:         dl $59D92C
DATA_06FA3F:         dl $59ED9E
DATA_06FA42:         dl $5A05C4
DATA_06FA45:         dl $5A1135
DATA_06FA48:         dl $5A17A3
DATA_06FA4B:         dl $5A1CED
DATA_06FA4E:         dl $5A235C
DATA_06FA51:         dl $5A28D6
DATA_06FA54:         dl $5A2EE2
DATA_06FA57:         dl $5A3453
DATA_06FA5A:         dl $5A3944
DATA_06FA5D:         dl $5A4110
DATA_06FA60:         dl $5A4608
DATA_06FA63:         dl $5A4C5F
DATA_06FA66:         dl $5A53A6
DATA_06FA69:         dl $5A5905
DATA_06FA6C:         dl $5A5E25
DATA_06FA6F:         dl $5A64A1
DATA_06FA72:         dl $5A6952
DATA_06FA75:         dl $5A6DE8
DATA_06FA78:         dl $5A736D
DATA_06FA7B:         dl $5A7994
DATA_06FA7E:         dl $5A8748
DATA_06FA81:         dl $5A9257
DATA_06FA84:         dl $5A97E0
DATA_06FA87:         dl $5A9C3D
DATA_06FA8A:         dl $5AA0EF
DATA_06FA8D:         dl $5AA75A
DATA_06FA90:         dl $5AAD40
DATA_06FA93:         dl $5AB189
DATA_06FA96:         dl $5AB630
DATA_06FA99:         dl $5ABC4D
DATA_06FA9C:         dl $5ACAD1
DATA_06FA9F:         dl $5AD992
DATA_06FAA2:         dl $5AE7A0
DATA_06FAA5:         dl $5AF2D5
DATA_06FAA8:         dl $5AFE28
DATA_06FAAB:         dl $5B03C0
DATA_06FAAE:         dl $5B08CC
DATA_06FAB1:         dl $5B0C94
DATA_06FAB4:         dl $5B121D
DATA_06FAB7:         dl $5B17A1
DATA_06FABA:         dl $5B1A25
DATA_06FABD:         dl $5B1CC2
DATA_06FAC0:         dl $5B2058
DATA_06FAC3:         dl $5B2323
DATA_06FAC6:         dl $5B25DB
DATA_06FAC9:         dl $5B278F
DATA_06FACC:         dl $5B28B2
DATA_06FACF:         dl $5B2A43
DATA_06FAD2:         dl $5B2BAB
DATA_06FAD5:         dl $5B2EA9
DATA_06FAD8:         dl $5B32B7
DATA_06FADB:         dl $5B35C3
DATA_06FADE:         dl $5B3942
DATA_06FAE1:         dl $5B3C69
DATA_06FAE4:         dl $5B40C4
DATA_06FAE7:         dl $5B457B
DATA_06FAEA:         dl $5B4937
DATA_06FAED:         dl $5B4D88
DATA_06FAF0:         dl $5B51E9
DATA_06FAF3:         dl $5B561D
DATA_06FAF6:         dl $5B5A43
DATA_06FAF9:         dl $5B5DE5
DATA_06FAFC:         dl $5B6042
DATA_06FAFF:         dl $5B6270
DATA_06FB02:         dl $5B6446
DATA_06FB05:         dl $5B6718
DATA_06FB08:         dl $5B69A5
DATA_06FB0B:         dl $5B6C06
DATA_06FB0E:         dl $5B6DDC
DATA_06FB11:         dl $5B70B5
DATA_06FB14:         dl $5B7361
DATA_06FB17:         dl $5B75AB
DATA_06FB1A:         dl $5B77F0
DATA_06FB1D:         dl $5B7AA3
DATA_06FB20:         dl $5B7B89
DATA_06FB23:         dl $5B7D18
DATA_06FB26:         dl $5B7EBC
DATA_06FB29:         dl $5B8070
DATA_06FB2C:         dl $5B83C7
DATA_06FB2F:         dl $5B85A0
DATA_06FB32:         dl $5B8C16
DATA_06FB35:         dl $5B8CE5
DATA_06FB38:         dl $5B8D8F
DATA_06FB3B:         dl $5B8E39
DATA_06FB3E:         dl $5B8F62
DATA_06FB41:         dl $5B9179
DATA_06FB44:         dl $5B92A1
DATA_06FB47:         dl $5B92AD
DATA_06FB4A:         dl $5B93BC
DATA_06FB4D:         dl $5B93C8
DATA_06FB50:         dl $5B94C1
DATA_06FB53:         dl $5B9588
DATA_06FB56:         dl $5B9669
DATA_06FB59:         dl $5B9A2E
DATA_06FB5C:         dl $5B9BF5
DATA_06FB5F:         dl $5B9F48
DATA_06FB62:         dl $5BA1BE
DATA_06FB65:         dl $5BA405
DATA_06FB68:         dl $5BA6A5
DATA_06FB6B:         dl $5BA99E
DATA_06FB6E:         dl $5BAD4E
DATA_06FB71:         dl $5BAE23
DATA_06FB74:         dl $5BBAC5
DATA_06FB77:         dl $5BBE47
DATA_06FB7A:         dl $5BC472
DATA_06FB7D:         dl $5BCB3F
DATA_06FB80:         dl $5BD161
DATA_06FB83:         dl $5BD781
DATA_06FB86:         dl $5BDC95
DATA_06FB89:         dl $5BE14B
DATA_06FB8C:         dl $5BE7E6
DATA_06FB8F:         dl $5BEDDD
DATA_06FB92:         dl $5BF3C3
DATA_06FB95:         dl $5BF986
DATA_06FB98:         dl $5BFCA8
DATA_06FB9B:         dl $5C0892
DATA_06FB9E:         dl $5C0BEA
DATA_06FBA1:         dl $5C12CD
DATA_06FBA4:         dl $5C145A
DATA_06FBA7:         dl $5C1996
DATA_06FBAA:         dl $5C1BFA
DATA_06FBAD:         dl $5C1DA2
DATA_06FBB0:         dl $5C1ED3
DATA_06FBB3:         dl $5C24BA
DATA_06FBB6:         dl $5C2658
DATA_06FBB9:         dl $5C28B0
DATA_06FBBC:         dl $5C2A9D
DATA_06FBBF:         dl $5C340D
DATA_06FBC2:         dl $5C3545
DATA_06FBC5:         dl $5C3A30
DATA_06FBC8:         dl $5C3D29
DATA_06FBCB:         dl $5C3EDA
DATA_06FBCE:         dl $5C437B
DATA_06FBD1:         dl $5C4711
DATA_06FBD4:         dl $5C490A
DATA_06FBD7:         dl $5C50AB
DATA_06FBDA:         dl $5C532C
DATA_06FBDD:         dl $5C5727
DATA_06FBE0:         dl $5C573B
DATA_06FBE3:         dl $5C5839
DATA_06FBE6:         dl $5C5CA3
DATA_06FBE9:         dl $5C5D18
DATA_06FBEC:         dl $5C6148
DATA_06FBEF:         dl $5C63B8
DATA_06FBF2:         dl $5C654D
DATA_06FBF5:         dl $5C6564
DATA_06FBF8:         dl $5C6790
DATA_06FBFB:         dl $5C69A5
DATA_06FBFE:         dl $5C6C1C
DATA_06FC01:         dl $5C6E1A
DATA_06FC04:         dl $5C6E26
DATA_06FC07:         dl $5C6E32
DATA_06FC0A:         dl $5C6E3E
DATA_06FC0D:         dl $5C7083
DATA_06FC10:         dl $5C7170
DATA_06FC13:         dl $5C7532
DATA_06FC16:         dl $5C7782
DATA_06FC19:         dl $5C7A54
DATA_06FC1C:         dl $5C7C40
DATA_06FC1F:         dl $5C7D9D
DATA_06FC22:         dl $5C7FD3
DATA_06FC25:         dl $5C84DD
DATA_06FC28:         dl $5C84EE
DATA_06FC2B:         dl $5C8653
DATA_06FC2E:         dl $5C86E9
DATA_06FC31:         dl $5C8892
DATA_06FC34:         dl $5C8A60
DATA_06FC37:         dl $5C8DA4
DATA_06FC3A:         dl $5C8DC6
DATA_06FC3D:         dl $5C8EF6
DATA_06FC40:         dl $5C9024
DATA_06FC43:         dl $5C90C8
DATA_06FC46:         dl $5C9456
DATA_06FC49:         dl $5C94CD
DATA_06FC4C:         dl $5C97A4
DATA_06FC4F:         dl $5C981D
DATA_06FC52:         dl $5C98D3
DATA_06FC55:         dl $5C9AC1
DATA_06FC58:         dl $5C9D51
DATA_06FC5B:         dl $5CA15C
DATA_06FC5E:         dl $5CA51B
DATA_06FC61:         dl $5CA62A
DATA_06FC64:         dl $5CA824
DATA_06FC67:         dl $5CACB2
DATA_06FC6A:         dl $5CAF37
DATA_06FC6D:         dl $5CB2B0
DATA_06FC70:         dl $5CB518
DATA_06FC73:         dl $5CB71B
DATA_06FC76:         dl $5CB929

; compression routine $0A8000 graphics files
DATA_06FC79:         dl $5CBA89
DATA_06FC7C:         dl $5CC342
DATA_06FC7F:         dl $5CCB44
DATA_06FC82:         dl $5CD671
DATA_06FC85:         dl $5CDFC6
DATA_06FC88:         dl $5CE630
DATA_06FC8B:         dl $5CEEE1
DATA_06FC8E:         dl $5CF376
DATA_06FC91:         dl $5CF91E
DATA_06FC94:         dl $5CFF0B
DATA_06FC97:         dl $5D04ED
DATA_06FC9A:         dl $5D0FEB
DATA_06FC9D:         dl $5D180F
DATA_06FCA0:         dl $5D1FFF
DATA_06FCA3:         dl $5D26DE
DATA_06FCA6:         dl $5D2F69
DATA_06FCA9:         dl $5D351B
DATA_06FCAC:         dl $5D3A65
DATA_06FCAF:         dl $5D3F7A
DATA_06FCB2:         dl $5D4050
DATA_06FCB5:         dl $5D46D0
DATA_06FCB8:         dl $5D4B93
DATA_06FCBB:         dl $5D511D
DATA_06FCBE:         dl $5D57EE
DATA_06FCC1:         dl $5D5D3A
DATA_06FCC4:         dl $5D6469
DATA_06FCC7:         dl $5D6ACF
DATA_06FCCA:         dl $5D6C99
DATA_06FCCD:         dl $5D6DAC
DATA_06FCD0:         dl $5D6EA2
DATA_06FCD3:         dl $5D7033
DATA_06FCD6:         dl $5D728B
DATA_06FCD9:         dl $5D7466
DATA_06FCDC:         dl $5D7623
DATA_06FCDF:         dl $5D7810
DATA_06FCE2:         dl $5D79BB
DATA_06FCE5:         dl $5D7B30
DATA_06FCE8:         dl $5D7C85
DATA_06FCEB:         dl $5D7E57
DATA_06FCEE:         dl $5D80A3
DATA_06FCF1:         dl $5D82C8
DATA_06FCF4:         dl $5D845B
DATA_06FCF7:         dl $5D86B4
DATA_06FCFA:         dl $5D87F8
DATA_06FCFD:         dl $5D8990
DATA_06FD00:         dl $5D8B43
DATA_06FD03:         dl $5D8D2D
DATA_06FD06:         dl $5D8E69
DATA_06FD09:         dl $5D8FC6
DATA_06FD0C:         dl $5D90F8
DATA_06FD0F:         dl $5D9242
DATA_06FD12:         dl $5D93BD
DATA_06FD15:         dl $5D952A
DATA_06FD18:         dl $5D969C
DATA_06FD1B:         dl $5D98F0
DATA_06FD1E:         dl $5D9AEC
DATA_06FD21:         dl $5D9C49
DATA_06FD24:         dl $5D9DC6
DATA_06FD27:         dl $5D9FFA
DATA_06FD2A:         dl $5DA191
DATA_06FD2D:         dl $5DA389
DATA_06FD30:         dl $5DA536
DATA_06FD33:         dl $5DA714
DATA_06FD36:         dl $5DA960
DATA_06FD39:         dl $5DAB59
DATA_06FD3C:         dl $5DACF1
DATA_06FD3F:         dl $5DAE74
DATA_06FD42:         dl $5DAFBA
DATA_06FD45:         dl $5DB0F3
DATA_06FD48:         dl $5DB321
DATA_06FD4B:         dl $5DB48B
DATA_06FD4E:         dl $5DB5F0
DATA_06FD51:         dl $5DB80E
DATA_06FD54:         dl $5DBA3E
DATA_06FD57:         dl $5DBC21
DATA_06FD5A:         dl $5DBDC1
DATA_06FD5D:         dl $5DBF2C
DATA_06FD60:         dl $5DC0DF
DATA_06FD63:         dl $5DC1EC
DATA_06FD66:         dl $5DC3EF
DATA_06FD69:         dl $5DC58C
DATA_06FD6C:         dl $5DC70B
DATA_06FD6F:         dl $5DC885
DATA_06FD72:         dl $5DC947
DATA_06FD75:         dl $5DCA3E
DATA_06FD78:         dl $5DCC2E
DATA_06FD7B:         dl $5DCE2B
DATA_06FD7E:         dl $5DCFDF
DATA_06FD81:         dl $5DD119
DATA_06FD84:         dl $5DD286
DATA_06FD87:         dl $5DD445
DATA_06FD8A:         dl $5DD5FB
DATA_06FD8D:         dl $5DD7C6
DATA_06FD90:         dl $5DD930
DATA_06FD93:         dl $5DDAF4
DATA_06FD96:         dl $5DDCCE
DATA_06FD99:         dl $5DDE10
DATA_06FD9C:         dl $5DDFB0
DATA_06FD9F:         dl $5DE0E8
DATA_06FDA2:         dl $5DE1DC
DATA_06FDA5:         dl $5DE3A5
DATA_06FDA8:         dl $5DE581
DATA_06FDAB:         dl $5DE6E9
DATA_06FDAE:         dl $5DE8AE
DATA_06FDB1:         dl $5DEA53
DATA_06FDB4:         dl $5DEC4C
DATA_06FDB7:         dl $5DEDF4
DATA_06FDBA:         dl $5DEFCA
DATA_06FDBD:         dl $5DF13D
DATA_06FDC0:         dl $5DF2C3
DATA_06FDC3:         dl $5DF399
DATA_06FDC6:         dl $5DF4BE
DATA_06FDC9:         dl $5DF5A6
DATA_06FDCC:         dl $5DF70A
DATA_06FDCF:         dl $5DF804
DATA_06FDD2:         dl $5E03D3
DATA_06FDD5:         dl $5E0596
DATA_06FDD8:         dl $5E0750
DATA_06FDDB:         dl $5E0956
DATA_06FDDE:         dl $5E0AB6
DATA_06FDE1:         dl $5E0F30
DATA_06FDE4:         dl $5E16FA
DATA_06FDE7:         dl $5E1DD1
DATA_06FDEA:         dl $5E2450
DATA_06FDED:         dl $5E2E3F
DATA_06FDF0:         dl $5E3939
DATA_06FDF3:         dl $5E3E16
DATA_06FDF6:         dl $5E42AC
DATA_06FDF9:         dl $5E4D55
DATA_06FDFC:         dl $5E57A7
DATA_06FDFF:         dl $5E5E4B
DATA_06FE02:         dl $5E6583
DATA_06FE05:         dl $5E6AAE
DATA_06FE08:         dl $5E70E0
DATA_06FE0B:         dl $5E77FD
DATA_06FE0E:         dl $5E829F
DATA_06FE11:         dl $5E9360
DATA_06FE14:         dl $5EA7C0
DATA_06FE17:         dl $5EBA21
DATA_06FE1A:         dl $5EC639
DATA_06FE1D:         dl $5ED157
DATA_06FE20:         dl $5ED7BE
DATA_06FE23:         dl $5EE3D2
DATA_06FE26:         dl $5EE999
DATA_06FE29:         dl $5EEC88
DATA_06FE2C:         dl $5EF3B1
DATA_06FE2F:         dl $5EF5DC
DATA_06FE32:         dl $5EF845
DATA_06FE35:         dl $5EFA6E
DATA_06FE38:         dl $5EFCD6
DATA_06FE3B:         dl $5EFEFF
DATA_06FE3E:         dl $5F01FE
DATA_06FE41:         dl $5F0576
DATA_06FE44:         dl $5F0922
DATA_06FE47:         dl $5F0BBB
DATA_06FE4A:         dl $5F10E1
DATA_06FE4D:         dl $5F15BA
DATA_06FE50:         dl $5F1960
DATA_06FE53:         dl $5F1D97
DATA_06FE56:         dl $5F21AB
DATA_06FE59:         dl $5F25FB
DATA_06FE5C:         dl $5F2948
DATA_06FE5F:         dl $5F2CAC
DATA_06FE62:         dl $5F2EB0
DATA_06FE65:         dl $5F3352
DATA_06FE68:         dl $5F3A70
DATA_06FE6B:         dl $5F4013
DATA_06FE6E:         dl $5F45B7
DATA_06FE71:         dl $5F4D68
DATA_06FE74:         dl $5F5485
DATA_06FE77:         dl $5F55D7
DATA_06FE7A:         dl $5F5742
DATA_06FE7D:         dl $5F5942
DATA_06FE80:         dl $5F5B92
DATA_06FE83:         dl $5F5D48
DATA_06FE86:         dl $5F5F21
DATA_06FE89:         dl $5F6126
DATA_06FE8C:         dl $5F62D2
DATA_06FE8F:         dl $5F6925
DATA_06FE92:         dl $5F6E88
DATA_06FE95:         dl $5F725C
DATA_06FE98:         dl $5F7906
DATA_06FE9B:         dl $5F7AC9
DATA_06FE9E:         dl $5F7CE1
DATA_06FEA1:         dl $5F7EA6
DATA_06FEA4:         dl $5F80B8
DATA_06FEA7:         dl $5F8589

; freespace
DATA_06FEAA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEB2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEBA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEC2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FECA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FED2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEDA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEE2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEEA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEF2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FEFA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF02:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF0A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF12:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF1A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF22:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF2A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF32:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF3A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF42:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF4A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF52:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF5A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF62:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF6A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF72:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF7A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF82:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF8A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF92:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FF9A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFA2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFAA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFB2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFBA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFC2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFCA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFD2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFDA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFE2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFEA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFF2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_06FFFA:         db $FF, $FF, $FF, $FF, $FF, $FF
