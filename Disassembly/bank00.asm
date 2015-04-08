lorom

org $008000

CODE_008000: SEI                                        ;$008000   |  Disable IRQ
CODE_008001: REP #$09                                   ;$008001   | \ Disable emulation mode
CODE_008003: XCE                                        ;$008003   | /
CODE_008004: SEP #$30                                   ;$008004   | 
CODE_008006: LDA #$00                                   ;$008006   | 
CODE_008008: PHA                                        ;$008008   | \ set ROM bank
CODE_008009: PLB                                        ;$008009   | /
CODE_00800A: PHA                                        ;$00800A   | \
CODE_00800B: PHA                                        ;$00800B   |  | init direct page
CODE_00800C: PLD                                        ;$00800C   | /
CODE_00800D: STZ $4200                                  ;$00800D   |  Disable IRQ, NMI and auto-joypad reading
CODE_008010: STZ $4016                                  ;$008010   |  disable joypad port
CODE_008013: LDA #$8F                                   ;$008013   | \ Enable F-blank
CODE_008015: STA $2100                                  ;$008015   | /
CODE_008018: LDA #$01                                   ;$008018   | \ Enable Backup RAM
CODE_00801A: STA $3033                                  ;$00801A   | /
CODE_00801D: STZ $2106                                  ;$00801D   |  set pixel size to 1x1
CODE_008020: STZ $2140                                  ;$008020   | \
CODE_008023: STZ $2141                                  ;$008023   |  | Clear SPC I/O ports
CODE_008026: STZ $2142                                  ;$008026   |  |
CODE_008029: STZ $2143                                  ;$008029   | /
CODE_00802C: LDA #$FF                                   ;$00802C   | \ Latch H/V counters in I/O port
CODE_00802E: STA $4201                                  ;$00802E   | /
CODE_008031: STZ $4207                                  ;$008031   | \ init H Timer
CODE_008034: STZ $4208                                  ;$008034   | /
CODE_008037: STZ $4209                                  ;$008037   | \ init V Timer
CODE_00803A: STZ $420A                                  ;$00803A   | /
CODE_00803D: STZ $420B                                  ;$00803D   | \ init DMA and HDMA enables
CODE_008040: STZ $420C                                  ;$008040   | /
CODE_008043: STZ $420D                                  ;$008043   |  SlowROM
CODE_008046: REP #$20                                   ;$008046   | 
CODE_008048: LDA #$8000                                 ;$008048   | \ Set up OAM
CODE_00804B: STA $2102                                  ;$00804B   | /
CODE_00804E: LDA #$01FF                                 ;$00804E   | \ Set up the stack
CODE_008051: TCS                                        ;$008051   | /
CODE_008052: SEP #$20                                   ;$008052   | 
CODE_008054: JSL CODE_0082D0                            ;$008054   |  init RAM and SRAM

CODE_008058: LDX #$10                                   ;$008058   | \ Upload SPC engine
CODE_00805A: JSL CODE_008543                            ;$00805A   | /

CODE_00805E: REP #$20                                   ;$00805E   | 
CODE_008060: LDX #$0F                                   ;$008060   | \
CODE_008062: LDA $813F,x                                ;$008062   |  |
CODE_008065: STA $0100,x                                ;$008065   |  | copy $008140~$00814E to $0101~$010F
CODE_008068: DEX                                        ;$008068   |  |
CODE_008069: DEX                                        ;$008069   |  |
CODE_00806A: BPL CODE_008062                            ;$00806A   | /
CODE_00806C: LDA #$C000                                 ;$00806C   | \
CODE_00806F: STA $20                                    ;$00806F   |  |
CODE_008071: LDY #$7E                                   ;$008071   |  |
CODE_008073: STY $22                                    ;$008073   |  |
CODE_008075: LDA #$C000                                 ;$008075   |  | DMA $00C000~$00FFFF to $7EC000~$7EFFFF
CODE_008078: STA $23                                    ;$008078   |  |
CODE_00807A: LDY #$00                                   ;$00807A   |  |
CODE_00807C: STY $25                                    ;$00807C   |  |
CODE_00807E: LDA #$4000                                 ;$00807E   |  |
CODE_008081: JSL CODE_008288                            ;$008081   | /

; init GSU stuff, kinda
; sets up clock speed and initializes the RAMBR
CODE_008085: SEP #$20                                   ;$008085   | 
CODE_008087: REP #$10                                   ;$008087   | 
CODE_008089: LDX #$0046                                 ;$008089   | \
CODE_00808C: STZ $0118,x                                ;$00808C   |  | init $0118~$015E
CODE_00808F: DEX                                        ;$00808F   |  |
CODE_008090: BPL CODE_00808C                            ;$008090   | /
CODE_008092: SEP #$10                                   ;$008092   | 
CODE_008094: LDA #$01                                   ;$008094   | \ Sets GSU clock speed
CODE_008096: STA $3039                                  ;$008096   | / 00 = 10.7MHz, 01 = 21.4MHz
CODE_008099: LDA #$A0                                   ;$008099   | \ mask GSU interrupts and set multiplier frequency to high-speed
CODE_00809B: STA $3037                                  ;$00809B   | /
CODE_00809E: LDA #$16                                   ;$00809E   | \ set SCBR to #$16
CODE_0080A0: STA $012D                                  ;$0080A0   | /
CODE_0080A3: LDA #$3D                                   ;$0080A3   | \ set screen mode to OBJ array, 16-color gradient mode
CODE_0080A5: STA $012E                                  ;$0080A5   | / and give GSU ROM/RAM bus access
CODE_0080A8: REP #$20                                   ;$0080A8   | 
CODE_0080AA: STZ $012B                                  ;$0080AA   | 
CODE_0080AD: STZ $0216                                  ;$0080AD   | 
CODE_0080B0: LDX #$08                                   ;$0080B0   | \
CODE_0080B2: LDA #$A97B                                 ;$0080B2   |  | initialize RAMBR to #$0000
CODE_0080B5: JSL CODE_7EDE44                            ;$0080B5   | / GSU init

CODE_0080B9: SEP #$20                                   ;$0080B9   | 
CODE_0080BB: LDA $707E7D                                ;$0080BB   | \
CODE_0080BF: BNE CODE_0080C9                            ;$0080BF   |  |
CODE_0080C1: LDA $707E7C                                ;$0080C1   |  |
CODE_0080C5: CMP #$03                                   ;$0080C5   |  |
CODE_0080C7: BCC CODE_0080F0                            ;$0080C7   |  |
CODE_0080C9: REP #$20                                   ;$0080C9   |  |
CODE_0080CB: LDA #$0000                                 ;$0080CB   |  | check checksum and nuke it if it's corrupted
CODE_0080CE: STA $707E7C                                ;$0080CE   |  |
CODE_0080D2: STA $707E70                                ;$0080D2   |  |
CODE_0080D6: STA $707E72                                ;$0080D6   |  |
CODE_0080DA: STA $707E74                                ;$0080DA   |  |
CODE_0080DE: STA $707E76                                ;$0080DE   |  |
CODE_0080E2: STA $707E78                                ;$0080E2   |  |
CODE_0080E6: STA $707E7A                                ;$0080E6   | /
CODE_0080EA: JSL CODE_108000                            ;$0080EA   |  generate new checksum

CODE_0080EE: SEP #$20                                   ;$0080EE   | 
CODE_0080F0: CLI                                        ;$0080F0   |  enable interrupts

.GameLoop
CODE_0080F1: LDA $011B                                  ;$0080F1   | \ Wait for interrupt
CODE_0080F4: BMI CODE_0080F1                            ;$0080F4   | /
CODE_0080F6: BRA CODE_008130                            ;$0080F6   | 

CODE_0080F8: LDA $0943                                  ;$0080F8   | 
CODE_0080FB: AND #$10                                   ;$0080FB   | 
CODE_0080FD: BEQ CODE_008107                            ;$0080FD   | 
CODE_0080FF: LDA $012F                                  ;$0080FF   | 
CODE_008102: EOR #$01                                   ;$008102   | 
CODE_008104: STA $012F                                  ;$008104   | 
CODE_008107: LDA $012F                                  ;$008107   | 
CODE_00810A: BEQ CODE_008130                            ;$00810A   | 
CODE_00810C: LDY #$20                                   ;$00810C   | 
CODE_00810E: LDA $0942                                  ;$00810E   | 
CODE_008111: AND #$10                                   ;$008111   | 
CODE_008113: BNE CODE_00812D                            ;$008113   | 
CODE_008115: LDA $0940                                  ;$008115   | 
CODE_008118: AND #$30                                   ;$008118   | 
CODE_00811A: BNE CODE_008121                            ;$00811A   | 
CODE_00811C: STZ $0130                                  ;$00811C   | 
CODE_00811F: BRA CODE_00813A                            ;$00811F   | 

CODE_008121: LDA $0130                                  ;$008121   | 
CODE_008124: BEQ CODE_00812B                            ;$008124   | 
CODE_008126: DEC $0130                                  ;$008126   | 
CODE_008129: BRA CODE_00813A                            ;$008129   | 

CODE_00812B: LDY #$04                                   ;$00812B   | 
CODE_00812D: STY $0130                                  ;$00812D   | 

CODE_008130: REP #$20                                   ;$008130   | \
CODE_008132: INC $30                                    ;$008132   |  | Frame beginning
CODE_008134: SEP #$20                                   ;$008134   |  |
CODE_008136: JSL CODE_008150                            ;$008136   | / execute game mode code

CODE_00813A: DEC $011B                                  ;$00813A   | \ end and begin new frame
CODE_00813D: BRA CODE_0080F1                            ;$00813D   | /

CODE_00813F: RTI                                        ;$00813F   | 

; this is data copied to RAM to be executed as code later
; copied to $0101~$010F
CODE_008140: NOP                                        ;$008140   | \
CODE_008141: NOP                                        ;$008141   |  |
CODE_008142: NOP                                        ;$008142   |  |
CODE_008143: RTI                                        ;$008143   |  | db $EA,$EA,$EA,$40,$EA,$EA,$EA,$5C
CODE_008144: NOP                                        ;$008144   |  | db $00,$C0,$7E,$5C,$E8,$C3,$7E
CODE_008145: NOP                                        ;$008145   |  |
CODE_008146: NOP                                        ;$008146   |  |
CODE_008147: JML CODE_7EC000                            ;$008147   |  | jump to NMI

CODE_00814B: JML CODE_7EC3E8                            ;$00814B   | / jump to IRQ

CODE_00814F: RTI                                        ;$00814F   | 

CODE_008150: LDA $0118                                  ;$008150   | \ get game mode pointer
CODE_008153: ASL A                                      ;$008153   |  |
CODE_008154: ADC $0118                                  ;$008154   |  |
CODE_008157: TAX                                        ;$008157   |  |
CODE_008158: PHB                                        ;$008158   |  |
CODE_008159: LDA $816C,x                                ;$008159   |  |\
CODE_00815C: PHA                                        ;$00815C   |  | | set pointer bank
CODE_00815D: PHA                                        ;$00815D   |  | |
CODE_00815E: PLB                                        ;$00815E   |  |/
CODE_00815F: LDA $00816B,x                              ;$00815F   |  |\
CODE_008163: PHA                                        ;$008163   |  | | set pointer address
CODE_008164: LDA $00816A,x                              ;$008164   |  | |
CODE_008168: PHA                                        ;$008168   |  |/
CODE_008169: RTL                                        ;$008169   | / jump to game mode pointer

.GameModePtr
dl $10838A					;0 Prepare Nintendo Presents
dl $10891D					;1 Load Nintendo Presents
dl $0083EF					;2 Fade into Nintendo Presents
dl $1083E6					;3 Nintendo Presents
dl $0083CC					;4 Fade out of Nintendo Presents
dl $0FBDBD					;5 Load cutscene
dl $0083CC					;6 Fade into cutscene
dl $0FBEB9					;7 Cutscene
dl $0083EF					;8 Fade out of cutscene
dl $1780D5					;9 Load title screen
dl $1787D4					;A Fade into title screen
dl $0083CC					;B Level fade out (after entering pipe)
dl $01AF8F					;C Level fade in + level name
dl $01B4E0					;D Level fade in after pipe/door
dl $108D4B					;E Level fade in (after level name)
dl $01C0D8					;F Level (with control)
dl $01B57F					;10 Victory cutscenes
dl $108E85					;11 Death
dl $0083CC					;12 Death from running out of stars
dl $0FBB79					;13 Prepare retry screen
dl $0083CC					;14 Retry screen cutscene fade in
dl $0FBC65					;15 Retry screen cutscene
dl $0083FB					;16 Load end of world cutscene
dl $10E1C0					;17
dl $1780D5					;18
dl $1787D4					;19 World cutscene after bowser
dl $0083CC					;1A Load credits?
dl $10E1D9					;1B Load/Fade to credits (?)
dl $10E356					;1C Beginning of credits (during very slow fade in effect)
dl $10E3CA					;1D Credits
dl $0083A7					;1E Start+select level fade out
dl $0083EF					;1F Level fade out to overworld
dl $17A58D					;20 Prepare overworld
dl $0083CC					;21 Fade into overworld
dl $17B3CC					;22 Overworld
dl $0083CC					;23 Fade to overworld after beating a level (not 100%)
dl $17B362					;24 Overworld level progression
dl $0083CC					;25 Fade to overworld after beating a level (100%)
dl $17AA19					;26 Change level score on overworld
dl $0083CC					;27 Fade into World score flip cutscene
dl $17A931					;28 World score flip cutscene
dl $0083EF					;29 Go to bonus game from high score screen (to 2A)
dl $109AE7					;2A Prepare/load bonus game
dl $0083CC					;2B Fade in to bonus game or prepare/load bonus game ??
dl $10A13A					;2C In bonus game
dl $0083CC					;2D Throwing balloons minigame
dl $117FFF					;2E
dl $0083CC					;2F
dl $1181D8					;30
dl $01E26C					;31 Loading/fade to score screen from boss cutscene
dl $0083CC					;32
dl $01E52C					;33
dl $0083CC					;34
dl $01E5E8					;35 Restart from the middle ring screen
dl $01E6EF					;36 Restart selection
dl $0083EF					;37 Fade out of title screen
dl $10DA32					;38 Load intro cutscene
dl $10DCAC					;39 Intro cutscene
dl $0083CC					;3A Retry cutscene fade out
dl $01E6A1					;3B Prepare retry screen
dl $0083CC					;3C Fade into retry screen
dl $01E6B8					;3D Retry screen
dl $01E6EF					;3E Retry cutscene selection
dl $10DE3E					;3F Load game over screen ?
dl $10DF52					;40 Game over screen
dl $0083CC					;41
dl $108A99					;42
dl $0083CC					;43
dl $1088FA					;44

CODE_008239: STZ $4200                                  ;$008239   |  disable NMI
CODE_00823C: STZ $420C                                  ;$00823C   |  disable HDMA
CODE_00823F: LDA #$8F                                   ;$00823F   | \ Enables F-blank
CODE_008241: STA $2100                                  ;$008241   | /
CODE_008244: RTL                                        ;$008244   | 

CODE_008245: LDA #$81                                   ;$008245   | \
CODE_008247: STA $4200                                  ;$008247   |  | enable NMI and auto-joypad read
CODE_00824A: RTL                                        ;$00824A   | /

CODE_00824B: REP #$20                                   ;$00824B   | 
CODE_00824D: LDX #$08                                   ;$00824D   | \
CODE_00824F: LDA #$BD16                                 ;$00824F   |  | initialize OAM routine
CODE_008252: JSL CODE_7EDE44                            ;$008252   | / GSU init

CODE_008256: SEP #$20                                   ;$008256   | 
CODE_008258: RTL                                        ;$008258   | 

CODE_008259: REP #$20                                   ;$008259   | 
CODE_00825B: LDX #$08                                   ;$00825B   | \
CODE_00825D: LDA #$B1D8                                 ;$00825D   |  | initialize OAM buffer routine
CODE_008260: JSL CODE_7EDE44                            ;$008260   | / GSU init

CODE_008264: SEP #$20                                   ;$008264   | 
CODE_008266: RTL                                        ;$008266   | 

CODE_008267: REP #$20                                   ;$008267   | 
CODE_008269: LDX #$08                                   ;$008269   | \
CODE_00826B: LDA #$B289                                 ;$00826B   |  | compress OAM high buffer into OAM high table routine
CODE_00826E: JSL CODE_7EDE44                            ;$00826E   | / GSU init

CODE_008272: SEP #$20                                   ;$008272   | 
CODE_008274: RTL                                        ;$008274   | 

DATA_008275:	     db $FF,$FF

CODE_008277: LDA #$03                                   ;$008277   | 
CODE_008279: STA $0127                                  ;$008279   | 
CODE_00827C: JSL CODE_008239                            ;$00827C   | 
CODE_008280: JSL CODE_00824B                            ;$008280   | 
CODE_008284: JML CODE_00E37B                            ;$008284   | 

; DMA $00C000 - $00FFFF to $7EC000 - $7EFFFF
CODE_008288: STA $4305                                  ;$008288   | 
CODE_00828B: LDA $20                                    ;$00828B   | 
CODE_00828D: STA $2181                                  ;$00828D   | 
CODE_008290: LDY $22                                    ;$008290   | 
CODE_008292: STY $2183                                  ;$008292   | 
CODE_008295: LDA #$8000                                 ;$008295   | 
CODE_008298: STA $4300                                  ;$008298   | 
CODE_00829B: LDA $23                                    ;$00829B   | 
CODE_00829D: STA $4302                                  ;$00829D   | 
CODE_0082A0: LDY $25                                    ;$0082A0   | 
CODE_0082A2: STY $4304                                  ;$0082A2   | 
CODE_0082A5: LDY #$01                                   ;$0082A5   | 
CODE_0082A7: STY $420B                                  ;$0082A7   | 
CODE_0082AA: RTL                                        ;$0082AA   | 

; general-purpose DMA (used for init RAM and SRAM, among other things)
CODE_0082AB: STA $4305                                  ;$0082AB   | 
CODE_0082AE: STY $211B                                  ;$0082AE   | 
CODE_0082B1: LDX #$00                                   ;$0082B1   | 
CODE_0082B3: STX $211B                                  ;$0082B3   | 
CODE_0082B6: INX                                        ;$0082B6   | 
CODE_0082B7: STX $211C                                  ;$0082B7   | 
CODE_0082BA: LDA #$3480                                 ;$0082BA   | 
CODE_0082BD: STA $4300                                  ;$0082BD   | 
CODE_0082C0: LDA $20                                    ;$0082C0   | 
CODE_0082C2: STA $4302                                  ;$0082C2   | 
CODE_0082C5: LDX $22                                    ;$0082C5   | 
CODE_0082C7: STX $4304                                  ;$0082C7   | 
CODE_0082CA: LDX #$01                                   ;$0082CA   | 
CODE_0082CC: STX $420B                                  ;$0082CC   | 
CODE_0082CF: RTL                                        ;$0082CF   | 

CODE_0082D0: JSL CODE_008239                            ;$0082D0   | \
CODE_0082D4: REP #$20                                   ;$0082D4   |  |
CODE_0082D6: LDY #$00                                   ;$0082D6   |  |
CODE_0082D8: STZ $20                                    ;$0082D8   |  | clear $7E0000 - $7E00FF
CODE_0082DA: STZ $22                                    ;$0082DA   |  |
CODE_0082DC: LDA #$0100                                 ;$0082DC   |  |
CODE_0082DF: JSL CODE_0082AB                            ;$0082DF   | /

CODE_0082E3: LDA #$0200                                 ;$0082E3   | \
CODE_0082E6: STA $20                                    ;$0082E6   |  |
CODE_0082E8: LDX #$7E                                   ;$0082E8   |  | clear $7E0200 - $7EBFFF
CODE_0082EA: STX $22                                    ;$0082EA   |  |
CODE_0082EC: LDA #$BE00                                 ;$0082EC   |  |
CODE_0082EF: JSL CODE_0082AB                            ;$0082EF   | /

CODE_0082F3: STZ $20                                    ;$0082F3   | \
CODE_0082F5: LDX #$7F                                   ;$0082F5   |  |
CODE_0082F7: STX $22                                    ;$0082F7   |  | clear $7F0000 - $7FFFFF
CODE_0082F9: LDA #$0000                                 ;$0082F9   |  |
CODE_0082FC: JSL CODE_0082AB                            ;$0082FC   | /

CODE_008300: LDX #$70                                   ;$008300   | \
CODE_008302: STX $22                                    ;$008302   |  | clear $700000 - $707BFF
CODE_008304: LDA #$7C00                                 ;$008304   |  |
CODE_008307: JSL CODE_0082AB                            ;$008307   | /

CODE_00830B: LDA #$FFFF                                 ;$00830B   | 
CODE_00830E: STA $7E4002                                ;$00830E   | 
CODE_008312: LDA #$4802                                 ;$008312   | 
CODE_008315: STA $7E4800                                ;$008315   | 
CODE_008319: SEP #$20                                   ;$008319   | 
CODE_00831B: RTL                                        ;$00831B   | 

CODE_00831C: REP #$20                                   ;$00831C   | 
CODE_00831E: LDY #$00                                   ;$00831E   | \
CODE_008320: STZ $21                                    ;$008320   |  |
CODE_008322: LDA #$0035                                 ;$008322   |  | clear $7E0035 - $7E00EF
CODE_008325: STA $20                                    ;$008325   |  |
CODE_008327: LDA #$00CB                                 ;$008327   |  |
CODE_00832A: JSL CODE_0082AB                            ;$00832A   | /

CODE_00832E: LDA #$093C                                 ;$00832E   | \
CODE_008331: STA $20                                    ;$008331   |  | clear $7E093C - $7E11B6
CODE_008333: LDA #$087A                                 ;$008333   |  |
CODE_008336: JSL CODE_0082AB                            ;$008336   | /

CODE_00833A: LDA #$6092                                 ;$00833A   | \
CODE_00833D: STA $20                                    ;$00833D   |  | clear $700092 - $7001F7
CODE_00833F: LDA #$0166                                 ;$00833F   |  |
CODE_008342: JSL CODE_0082AB                            ;$008342   | /

CODE_008346: LDA #$7E08                                 ;$008346   | \
CODE_008349: STA $20                                    ;$008349   |  | clear $701E08 - $701FEF
CODE_00834B: LDA #$01E8                                 ;$00834B   |  |
CODE_00834E: JSL CODE_0082AB                            ;$00834E   | /

CODE_008352: LDA #$2604                                 ;$008352   | \
CODE_008355: STA $20                                    ;$008355   |  |
CODE_008357: LDX #$70                                   ;$008357   |  | clear $702604 - $7077FF
CODE_008359: STX $22                                    ;$008359   |  |
CODE_00835B: LDA #$51FC                                 ;$00835B   |  |
CODE_00835E: JSL CODE_0082AB                            ;$00835E   | /
CODE_008362: SEP #$20                                   ;$008362   | 
CODE_008364: RTL                                        ;$008364   | 

.ExecutePtr
CODE_008365: STY $03                                    ;$008365   | \ preserve Y
CODE_008367: PLY                                        ;$008367   |  |\ pull the high byte and bank byte and store it in $00
CODE_008368: STY $00                                    ;$008368   |  |/ to create a pointer to the pointer table
CODE_00836A: REP #$30                                   ;$00836A   |  |
CODE_00836C: AND #$00FF                                 ;$00836C   |  | allow for a maximum of 256 pointers
CODE_00836F: ASL A                                      ;$00836F   |  |\ get the pointer table index and store it in Y
CODE_008370: TAY                                        ;$008370   |  |/
CODE_008371: PLA                                        ;$008371   |  |\ pull the high byte and bank byte and store it in $01
CODE_008372: STA $01                                    ;$008372   |  |/ to create a pointer to the pointer table
CODE_008374: INY                                        ;$008374   |  | increment to the first byte of the pointer table
CODE_008375: LDA [$00],y                                ;$008375   |  | load the pointer
CODE_008377: STA $00                                    ;$008377   |  | and store the pointer
CODE_008379: SEP #$30                                   ;$008379   |  |
CODE_00837B: LDY $03                                    ;$00837B   |  | restore Y
CODE_00837D: JML [$0000]                                ;$00837D   | / jump to the pointer

.ExecutePtrLong
CODE_008380: STY $05                                    ;$008380   | \ preserve Y
CODE_008382: PLY                                        ;$008382   |  |\ pull the high byte and bank byte and store it in $02
CODE_008383: STY $02                                    ;$008383   |  |/ to create a pointer to the pointer table
CODE_008385: REP #$30                                   ;$008385   |  |
CODE_008387: AND #$00FF                                 ;$008387   |  | allow for a maximum of 256 pointers
CODE_00838A: STA $03                                    ;$00838A   |  |\
CODE_00838C: ASL A                                      ;$00838C   |  | | multiply the pointer by three
CODE_00838D: ADC $03                                    ;$00838D   |  | |
CODE_00838F: TAY                                        ;$00838F   |  |/
CODE_008390: PLA                                        ;$008390   |  |\ pull the high byte and bank byte and store it in $03
CODE_008391: STA $03                                    ;$008391   |  |/ to create a pointer to the pointer table
CODE_008393: INY                                        ;$008393   |  | increment to the first byte of the pointer table
CODE_008394: LDA [$02],y                                ;$008394   |  |\ load and store the first two bytes of the pointer
CODE_008396: STA $00                                    ;$008396   |  |/
CODE_008398: INY                                        ;$008398   |  | move to the next byte in the pointer table
CODE_008399: LDA [$02],y                                ;$008399   |  |\ load and store the last byte of the pointer
CODE_00839B: STA $01                                    ;$00839B   |  |/ (also rereads the high byte)
CODE_00839D: XBA                                        ;$00839D   |  |
CODE_00839E: SEP #$30                                   ;$00839E   |  |
CODE_0083A0: PHB                                        ;$0083A0   |  |\
CODE_0083A1: PHA                                        ;$0083A1   |  | | load pointer bank
CODE_0083A2: PLB                                        ;$0083A2   |  |/
CODE_0083A3: LDY $05                                    ;$0083A3   |  | restore Y
CODE_0083A5: JML [$0000]                                ;$0083A5   | / jump to the pointer

CODE_0083A8: LDX $0201                                  ;$0083A8   | 
CODE_0083AB: LDA $0200                                  ;$0083AB   | 
CODE_0083AE: AND #$0F                                   ;$0083AE   | 
CODE_0083B0: CMP $83C6,x                                ;$0083B0   | 
CODE_0083B3: BNE CODE_0083E7                            ;$0083B3   | 
CODE_0083B5: TXA                                        ;$0083B5   | 
CODE_0083B6: EOR #$01                                   ;$0083B6   | 
CODE_0083B8: AND #$01                                   ;$0083B8   | 
CODE_0083BA: STA $0201                                  ;$0083BA   | 

CODE_0083BD: LDA #$20                                   ;$0083BD   | \
CODE_0083BF: STA $0118                                  ;$0083BF   |  | jump to prepare overworld game mode
CODE_0083C2: BRA CODE_0083EE                            ;$0083C2   | /

DATA_0083C4:	     db $01,$FF,$0F,$00,$8B,$A9,$00,$48

; various game modes:
; $04, $06, $0B, $12, $14, $1A, $21, $23, $25, $27
; $2B, $2D, $2F, $32, $34, $3A, $3C, $41, $43
CODE_0083CC: PLB                                        ;$0083CC   | 
CODE_0083CD: LDX $0201                                  ;$0083CD   | 
CODE_0083D0: LDA $0200                                  ;$0083D0   | 
CODE_0083D3: AND #$0F                                   ;$0083D3   | 
CODE_0083D5: CMP $83C6,x                                ;$0083D5   | 
CODE_0083D8: BNE CODE_0083E7                            ;$0083D8   | 

CODE_0083DA: TXA                                        ;$0083DA   | 
CODE_0083DB: EOR #$01                                   ;$0083DB   | 
CODE_0083DD: AND #$01                                   ;$0083DD   | 
CODE_0083DF: STA $0201                                  ;$0083DF   | 
CODE_0083E2: INC $0118                                  ;$0083E2   | 
CODE_0083E5: BRA CODE_0083EE                            ;$0083E5   | 

CODE_0083E7: CLC                                        ;$0083E7   | 
CODE_0083E8: ADC $83C4,x                                ;$0083E8   | 
CODE_0083EB: STA $0200                                  ;$0083EB   | 
CODE_0083EE: PLB                                        ;$0083EE   | 
CODE_0083EF: RTL                                        ;$0083EF   | 

.gamemode1F
CODE_0083F0: DEC $0202                                  ;$0083F0   | 
CODE_0083F3: BPL CODE_0083EE                            ;$0083F3   | 
CODE_0083F5: LDA #$02                                   ;$0083F5   | 
CODE_0083F7: STA $0202                                  ;$0083F7   | 
CODE_0083FA: BRA CODE_0083CD                            ;$0083FA   | 

CODE_0083FC: DEC $0202                                  ;$0083FC   | 
CODE_0083FF: BPL CODE_0083EE                            ;$0083FF   | 
CODE_008401: LDA #$08                                   ;$008401   | 
CODE_008403: STA $0202                                  ;$008403   | 
CODE_008406: BRA CODE_0083CD                            ;$008406   | 

CODE_008408: PHP                                        ;$008408   | 
CODE_008409: SEP #$20                                   ;$008409   | 
CODE_00840B: LDA $2137                                  ;$00840B   |  latch H/V counter
CODE_00840E: LDA $213F                                  ;$00840E   |  set "low byte" read for $213C
CODE_008411: REP #$20                                   ;$008411   | 
CODE_008413: LDA $213C                                  ;$008413   | \
CODE_008416: CLC                                        ;$008416   |  | set horizontal scanline location
CODE_008417: ADC $7970                                  ;$008417   |  |
CODE_00841A: STA $7970                                  ;$00841A   | /
CODE_00841D: PLP                                        ;$00841D   | 
CODE_00841E: RTL                                        ;$00841E   | 

.SPC700UploadLoop
CODE_00841F: PHP                                        ;$00841F   | \ Preserve processor flags
CODE_008420: REP #$30                                   ;$008420   |  |  16 bit A/X/Y
CODE_008422: LDY #$0000                                 ;$008422   |  |
CODE_008425: LDA #$BBAA                                 ;$008425   |  |\ Value to check if the SPC is ready
; | |
.SPCWait                                                    ; | |
CODE_008428: CMP $2140                                  ;$008428   |  | | Wait for the SPC to be ready
CODE_00842B: BNE CODE_008428                            ;$00842B   |  |/
CODE_00842D: SEP #$20                                   ;$00842D   |  | 8 bit A
CODE_00842F: LDA #$CC                                   ;$00842F   |  |\ Byte used to enable SPC block upload
CODE_008431: BRA CODE_008459                            ;$008431   |  |/

; |
.TransferBytes                                              ; |\
CODE_008433: LDA [$00],y                                ;$008433   |  | | Load the Byte into the low byte
CODE_008435: INY                                        ;$008435   |  | | Increase the index
CODE_008436: XBA                                        ;$008436   |  | | Move it to the high byte
CODE_008437: LDA #$00                                   ;$008437   |  |/ Set the validation byte to the low byte
CODE_008439: BRA CODE_008446                            ;$008439   |  |

; |
.NextByte                                                   ; |\
CODE_00843B: XBA                                        ;$00843B   |  | | Switch the high and low byte
CODE_00843C: LDA [$00],y                                ;$00843C   |  | | Load a new low byte
CODE_00843E: INY                                        ;$00843E   |  | | Increase the index
CODE_00843F: XBA                                        ;$00843F   |  |/ Switch the new low byte to the high byte
; |
.SPCWait                                                    ; |\ SPC wait loop
CODE_008440: CMP $2140                                  ;$008440   |  | | Wait till $2140 matches the validation byte
CODE_008443: BNE CODE_008440                            ;$008443   |  |/
CODE_008445: INC A                                      ;$008445   |  | Increment the validation byte
; |\
CODE_008446: REP #$20                                   ;$008446   |  | | 16 bit A
CODE_008448: STA $2140                                  ;$008448   |  | | Store to $2140/$2141
CODE_00844B: SEP #$20                                   ;$00844B   |  | | 8 bit A
CODE_00844D: DEX                                        ;$00844D   |  |/ Decrement byte counter
CODE_00844E: BNE CODE_00843B                            ;$00844E   |  |
; |
.SPCWait                                                    ; |\ SPC wait loop
CODE_008450: CMP $2140                                  ;$008450   |  | |
CODE_008453: BNE CODE_008450                            ;$008453   |  |/
; |
.AddThree                                                   ; |\
CODE_008455: ADC #$03                                   ;$008455   |  | | If A is 0 add 3 again
CODE_008457: BEQ CODE_008455                            ;$008457   |  |/
; |
.SendSPCBlock						    ; |
CODE_008459: PHA                                        ;$008459   |  | Preserve A to store to $2140 later
CODE_00845A: REP #$20                                   ;$00845A   |  | 16 bit A
CODE_00845C: LDA [$00],y                                ;$00845C   |  |\
CODE_00845E: BNE CODE_00847C                            ;$00845E   |  | | Clear out the address
CODE_008460: DEC $000C                                  ;$008460   |  | | (can't use 00 for transfers)
CODE_008463: BMI CODE_00847C                            ;$008463   |  |/

CODE_008465: LDA $000C                                  ;$008465   | 
CODE_008468: ASL A                                      ;$008468   | 
CODE_008469: ADC $000C                                  ;$008469   | 
CODE_00846C: TAY                                        ;$00846C   | 
CODE_00846D: LDA $0003,y                                ;$00846D   | 
CODE_008470: STA $00                                    ;$008470   | 
CODE_008472: LDA $0004,y                                ;$008472   | 
CODE_008475: STA $01                                    ;$008475   | 
CODE_008477: LDY #$0000                                 ;$008477   | 

CODE_00847A: LDA [$00],y                                ;$00847A   |  |\ Get data length
CODE_00847C: INY                                        ;$00847C   |  | |
CODE_00847D: INY                                        ;$00847D   |  | |
CODE_00847E: TAX                                        ;$00847E   |  |/
CODE_00847F: LDA [$00],y                                ;$00847F   |  |\ Get address to write to in SPC RAM
CODE_008481: INY                                        ;$008481   |  | |
CODE_008482: INY                                        ;$008482   |  |/
CODE_008483: STA $2142                                  ;$008483   |  | Store the address of SPC RAM to write to $2142
CODE_008486: SEP #$20                                   ;$008486   |  | 8 bit A
CODE_008488: CPX #$0001                                 ;$008488   |  |
CODE_00848B: LDA #$00                                   ;$00848B   |  |\ Store the carry flag in $2141
CODE_00848D: ROL A                                      ;$00848D   |  | |
CODE_00848E: STA $2141                                  ;$00848E   |  |/
CODE_008491: ADC #$7F                                   ;$008491   |  | if A is one this sets the overflow flag
CODE_008493: PLA                                        ;$008493   |  |\ Store the A pushed earlier
CODE_008494: STA $2140                                  ;$008494   |  |/
; |
.SPCWait						    ; |\ SPC wait loop
CODE_008497: CMP $2140                                  ;$008497   |  | |
CODE_00849A: BNE CODE_008497                            ;$00849A   |  |/
CODE_00849C: BVS CODE_008433                            ;$00849C   |  | If the overflow is not set, keep uploading
CODE_00849E: STZ $2140                                  ;$00849E   |  |\ Clear SPC I/O ports
CODE_0084A1: STZ $2141                                  ;$0084A1   |  | |
CODE_0084A4: STZ $2142                                  ;$0084A4   |  | |
CODE_0084A7: STZ $2143                                  ;$0084A7   |  |/
CODE_0084AA: PLP                                        ;$0084AA   |  | Restore processor flag
CODE_0084AB: RTS                                        ;$0084AB   | /

; SPC data block pointers
.SPCPtr
DATA_0084AC:         dl $4E0000
DATA_0084AF:         dl $4E169C
DATA_0084B2:         dl $4E23BF
DATA_0084B5:         dl $4E2C39
DATA_0084B8:         dl $4E38D2
DATA_0084BB:         dl $4ED0FE
DATA_0084BE:         dl $4ED5D0
DATA_0084C1:         dl $4EE279
DATA_0084C4:         dl $4EEC85
DATA_0084C7:         dl $4F4122
DATA_0084CA:         dl $4F5C48
DATA_0084CD:         dl $4F6E5A
DATA_0084D0:         dl $4F82E6
DATA_0084D3:         dl $4FFCB2
DATA_0084D6:         dl $500342
DATA_0084D9:         dl $4F33F0
DATA_0084DC:         dl $4EFEC1
DATA_0084DF:         dl $4F205D
DATA_0084E2:         dl $4E3E90
DATA_0084E5:         dl $4EBBEC

; SPC data block sets (4 bytes per)
DATA_0084E8:         dd $FFFFFF2B
DATA_0084EC:         dd $FF2E2225
DATA_0084F0:         dd $FF1C2225
DATA_0084F4:         dd $FF131925
DATA_0084F8:         dd $FF101625
DATA_0084FC:         dd $FF0D1625
DATA_008500:         dd $FF282225
DATA_008504:         dd $FF0A1625
DATA_008508:         dd $FF071925
DATA_00850C:         dd $FF1F1925
DATA_008510:         dd $FF040125
DATA_008514:         dd $FFFF3431
DATA_008518:         dd $FFFF3A37

; Item-Denial table for each music track; $00 enables items and $01 disables them
DATA_00851C:         db $00, $00, $00, $01, $00, $01, $00, $01
DATA_008524:         db $01, $01, $00, $00, $01, $00, $00, $00

DATA_00852C:         db $FF, $00, $FF

; SPC data block set to use for each level
DATA_00852F:         dw $100C
DATA_008531:         dw $1C18
DATA_008533:         dw $1C14
DATA_008535:         dw $2420
DATA_008537:         dw $2424
DATA_008539:         dw $2828
DATA_00853B:         dw $1C2C
DATA_00853D:         dw $0000
DATA_00853F:         dw $0400
DATA_008541:         dw $3008

CODE_008543: STX $014E                                  ;$008543   | 
CODE_008546: LDX $014E                                  ;$008546   | 
CODE_008549: LDA $00851C,x                              ;$008549   | 
CODE_00854D: BMI CODE_008552                            ;$00854D   | 
CODE_00854F: STA $0B48                                  ;$00854F   | 
CODE_008552: INX                                        ;$008552   | 
CODE_008553: CPX $0203                                  ;$008553   | 
CODE_008556: BNE CODE_008559                            ;$008556   | 
CODE_008558: RTL                                        ;$008558   | 

CODE_008559: STX $0203                                  ;$008559   | 
CODE_00855C: STZ $0205                                  ;$00855C   | 
CODE_00855F: LDA $00852E,x                              ;$00855F   | 
CODE_008563: TAX                                        ;$008563   | 
CODE_008564: STZ $0C                                    ;$008564   | 
CODE_008566: STZ $0D                                    ;$008566   | 
CODE_008568: STZ $0E                                    ;$008568   | 
CODE_00856A: LDY #$00                                   ;$00856A   | 
CODE_00856C: LDA $0084E8,x                              ;$00856C   | 
CODE_008570: CMP $0207,y                                ;$008570   | 
CODE_008573: BEQ CODE_00859F                            ;$008573   | 
CODE_008575: STA $0207,y                                ;$008575   | 
CODE_008578: CMP #$FF                                   ;$008578   | 
CODE_00857A: BEQ CODE_00859F                            ;$00857A   | 
CODE_00857C: INC $0C                                    ;$00857C   | 
CODE_00857E: PHX                                        ;$00857E   | 
CODE_00857F: PHY                                        ;$00857F   | 
CODE_008580: TAX                                        ;$008580   | 
CODE_008581: LDY $0E                                    ;$008581   | 
CODE_008583: LDA $0084AB,x                              ;$008583   | 
CODE_008587: STA $0000,y                                ;$008587   | 
CODE_00858A: LDA $0084AC,x                              ;$00858A   | 
CODE_00858E: STA $0001,y                                ;$00858E   | 
CODE_008591: LDA $0084AD,x                              ;$008591   | 
CODE_008595: STA $0002,y                                ;$008595   | 
CODE_008598: INY                                        ;$008598   | 
CODE_008599: INY                                        ;$008599   | 
CODE_00859A: INY                                        ;$00859A   | 
CODE_00859B: STY $0E                                    ;$00859B   | 
CODE_00859D: PLY                                        ;$00859D   | 
CODE_00859E: PLX                                        ;$00859E   | 
CODE_00859F: INX                                        ;$00859F   | 
CODE_0085A0: INY                                        ;$0085A0   | 
CODE_0085A1: CPY #$04                                   ;$0085A1   | 
CODE_0085A3: BCC CODE_00856C                            ;$0085A3   | 
CODE_0085A5: DEC $0C                                    ;$0085A5   | 
CODE_0085A7: BMI CODE_0085B3                            ;$0085A7   | 

.UploadDataToSPC
CODE_0085A9: SEI                                        ;$0085A9   | \ Prevent interrupts from interrupting SPC upload
CODE_0085AA: LDA #$FF                                   ;$0085AA   |  |
CODE_0085AC: STA $2140                                  ;$0085AC   |  |
CODE_0085AF: JSR CODE_00841F                            ;$0085AF   |  | Main SPC upload loop
CODE_0085B2: CLI                                        ;$0085B2   | / Enable interrupts again

CODE_0085B3: LDX #$03                                   ;$0085B3   | \
CODE_0085B5: STZ $2140,x                                ;$0085B5   |  | clear APU I/O registers
CODE_0085B8: DEX                                        ;$0085B8   |  |
CODE_0085B9: BPL CODE_0085B5                            ;$0085B9   | /

CODE_0085BB: REP #$20                                   ;$0085BB   | 
CODE_0085BD: STZ $004D                                  ;$0085BD   | \
CODE_0085C0: STZ $004F                                  ;$0085C0   |  |
CODE_0085C3: STZ $0053                                  ;$0085C3   |  | clear APU I/O mirrors?
CODE_0085C6: STZ $0055                                  ;$0085C6   |  |
CODE_0085C9: STZ $0057                                  ;$0085C9   |  |
CODE_0085CC: STZ $0059                                  ;$0085CC   | /
CODE_0085CF: SEP #$20                                   ;$0085CF   | 
CODE_0085D1: RTL                                        ;$0085D1   | 

CODE_0085D2: LDY $0057                                  ;$0085D2   | \
CODE_0085D5: STA $0059,y                                ;$0085D5   |  | Play sound
CODE_0085D8: INC $0057                                  ;$0085D8   |  |
CODE_0085DB: RTL                                        ;$0085DB   | /

.init_kamek_OH_MY
CODE_0085DC: RTL                                        ;$0085DC   | 

DATA_0085DD:		dw $8607
DATA_0085DF:		dw $8641
DATA_0085E1:		dw $8670
DATA_0085E3:		dw $8691

.main_kamek_OH_MY
CODE_0085E5: LDY #$01                                   ;$0085E5   | 
CODE_0085E7: STY $0C1E                                  ;$0085E7   | 
CODE_0085EA: LDA $78,x                                  ;$0085EA   | 
CODE_0085EC: SEC                                        ;$0085EC   | 
CODE_0085ED: SBC $0039                                  ;$0085ED   | 
CODE_0085F0: CMP #$00F0                                 ;$0085F0   | 
CODE_0085F3: BMI CODE_0085F8                            ;$0085F3   | 
CODE_0085F5: INC $0039                                  ;$0085F5   | 
CODE_0085F8: LDA $0039                                  ;$0085F8   | 
CODE_0085FB: STA $0C23                                  ;$0085FB   | 
CODE_0085FE: TXY                                        ;$0085FE   | 
CODE_0085FF: LDA $76,x                                  ;$0085FF   | 
CODE_008601: ASL A                                      ;$008601   | 
CODE_008602: TAX                                        ;$008602   | 
CODE_008603: JSR ($85DD,x)                              ;$008603   | 

CODE_008606: RTL                                        ;$008606   | 

CODE_008607: TYX                                        ;$008607   | 
CODE_008608: LDA $7220,x                                ;$008608   | 
CODE_00860B: BMI CODE_008622                            ;$00860B   | 
CODE_00860D: STZ $7220,x                                ;$00860D   | 
CODE_008610: STZ $7540,x                                ;$008610   | 
CODE_008613: LDA #$0002                                 ;$008613   | 
CODE_008616: STA $7402,x                                ;$008616   | 
CODE_008619: LDA #$0020                                 ;$008619   | 
CODE_00861C: STA $7A96,x                                ;$00861C   | 
CODE_00861F: INC $76,x                                  ;$00861F   | 
CODE_008621: RTS                                        ;$008621   | 

CODE_008622: CMP #$FF00                                 ;$008622   | 
CODE_008625: BMI CODE_00862C                            ;$008625   | 
CODE_008627: LDA #$0005                                 ;$008627   | 
CODE_00862A: BRA CODE_00863D                            ;$00862A   | 

CODE_00862C: LDA $7A98,x                                ;$00862C   | 
CODE_00862F: BNE CODE_008640                            ;$00862F   | 
CODE_008631: LDA #$0002                                 ;$008631   | 
CODE_008634: STA $7A98,x                                ;$008634   | 
CODE_008637: LDA $7402,x                                ;$008637   | 
CODE_00863A: EOR #$0001                                 ;$00863A   | 
CODE_00863D: STA $7402,x                                ;$00863D   | 
CODE_008640: RTS                                        ;$008640   | 

CODE_008641: TYX                                        ;$008641   | 
CODE_008642: LDA $7A96,x                                ;$008642   | 
CODE_008645: ORA $7A98,x                                ;$008645   | 
CODE_008648: BNE CODE_00866F                            ;$008648   | 
CODE_00864A: INC $7402,x                                ;$00864A   | 
CODE_00864D: LDA $7402,x                                ;$00864D   | 
CODE_008650: CMP #$0004                                 ;$008650   | 
CODE_008653: BNE CODE_008669                            ;$008653   | 
CODE_008655: LDA #$005B                                 ;$008655   | \ play sound #$005B
CODE_008658: JSL CODE_0085D2                            ;$008658   | /

CODE_00865C: LDA #$0082                                 ;$00865C   | 
CODE_00865F: STA $704070                                ;$00865F   | 
CODE_008663: INC $0D0F                                  ;$008663   | 
CODE_008666: INC $76,x                                  ;$008666   | 
CODE_008668: RTS                                        ;$008668   | 

CODE_008669: LDA #$0008                                 ;$008669   | 
CODE_00866C: STA $7A98,x                                ;$00866C   | 
CODE_00866F: RTS                                        ;$00866F   | 

CODE_008670: TYX                                        ;$008670   | 
CODE_008671: LDA $0D0F                                  ;$008671   | 
CODE_008674: BNE CODE_008690                            ;$008674   | 
CODE_008676: LDA #$0002                                 ;$008676   | 
CODE_008679: STA $7402,x                                ;$008679   | 
CODE_00867C: LDA #$FC00                                 ;$00867C   | 
CODE_00867F: STA $7220,x                                ;$00867F   | 
CODE_008682: LDA #$0040                                 ;$008682   | 
CODE_008685: STA $7540,x                                ;$008685   | 
CODE_008688: LDA #$0400                                 ;$008688   | 
CODE_00868B: STA $75E0,x                                ;$00868B   | 
CODE_00868E: INC $76,x                                  ;$00868E   | 
CODE_008690: RTS                                        ;$008690   | 

CODE_008691: TYX                                        ;$008691   | 
CODE_008692: LDA $7220,x                                ;$008692   | 
CODE_008695: CLC                                        ;$008695   | 
CODE_008696: ADC #$0080                                 ;$008696   | 
CODE_008699: CMP #$0100                                 ;$008699   | 
CODE_00869C: BCS CODE_0086A3                            ;$00869C   | 
CODE_00869E: LDA #$0006                                 ;$00869E   | 
CODE_0086A1: BRA CODE_0086B4                            ;$0086A1   | 

CODE_0086A3: CLC                                        ;$0086A3   | 
CODE_0086A4: ADC #$0080                                 ;$0086A4   | 
CODE_0086A7: CMP #$0200                                 ;$0086A7   | 
CODE_0086AA: BCS CODE_0086B1                            ;$0086AA   | 
CODE_0086AC: LDA #$0005                                 ;$0086AC   | 
CODE_0086AF: BRA CODE_0086B4                            ;$0086AF   | 

CODE_0086B1: LDA #$0002                                 ;$0086B1   | 
CODE_0086B4: STA $7402,x                                ;$0086B4   | 
CODE_0086B7: LDA $7220,x                                ;$0086B7   | 
CODE_0086BA: BMI CODE_0086C2                            ;$0086BA   | 
CODE_0086BC: LDA #$0002                                 ;$0086BC   | 
CODE_0086BF: STA $7400,x                                ;$0086BF   | 
CODE_0086C2: LDA $7680,x                                ;$0086C2   | 
CODE_0086C5: CMP #$0140                                 ;$0086C5   | 
CODE_0086C8: BMI CODE_008690                            ;$0086C8   | 
CODE_0086CA: LDX $108A                                  ;$0086CA   | 
CODE_0086CD: LDA $70E2,x                                ;$0086CD   | 
CODE_0086D0: STA $00                                    ;$0086D0   | 
CODE_0086D2: LDA $7182,x                                ;$0086D2   | 
CODE_0086D5: STA $02                                    ;$0086D5   | 
CODE_0086D7: JSL CODE_02E1A3                            ;$0086D7   | 

CODE_0086DB: LDX $108A                                  ;$0086DB   | 
CODE_0086DE: JSL CODE_03A31E                            ;$0086DE   | 

CODE_0086E2: LDX $12                                    ;$0086E2   | 
CODE_0086E4: PLA                                        ;$0086E4   | 
CODE_0086E5: JML CODE_03A31E                            ;$0086E5   | 

.init_background_shyguy
CODE_0086E9: LDY $0073                                  ;$0086E9   | 
CODE_0086EC: BEQ CODE_0086F2                            ;$0086EC   | 
CODE_0086EE: JML CODE_03A31E                            ;$0086EE   | 

CODE_0086F2: LDA $70E2,x                                ;$0086F2   | 
CODE_0086F5: SEC                                        ;$0086F5   | 
CODE_0086F6: SBC $0039                                  ;$0086F6   | 
CODE_0086F9: CLC                                        ;$0086F9   | 
CODE_0086FA: ADC $003D                                  ;$0086FA   | 
CODE_0086FD: STA $70E2,x                                ;$0086FD   | 
CODE_008700: STA $7900,x                                ;$008700   | 
CODE_008703: LDA $7182,x                                ;$008703   | 
CODE_008706: CLC                                        ;$008706   | 
CODE_008707: ADC #$0008                                 ;$008707   | 
CODE_00870A: SEC                                        ;$00870A   | 
CODE_00870B: SBC $003B                                  ;$00870B   | 
CODE_00870E: CLC                                        ;$00870E   | 
CODE_00870F: ADC $003F                                  ;$00870F   | 
CODE_008712: AND #$FFF8                                 ;$008712   | 
CODE_008715: CLC                                        ;$008715   | 
CODE_008716: ADC #$000A                                 ;$008716   | 
CODE_008719: STA $7182,x                                ;$008719   | 
CODE_00871C: STA $7902,x                                ;$00871C   | 
CODE_00871F: INC $74A1,x                                ;$00871F   | 
CODE_008722: INC $74A1,x                                ;$008722   | 
CODE_008725: RTL                                        ;$008725   | 

DATA_008726:		db $E0,$FF,$20,$00

.main_background_shyguy
CODE_00872A: JSL CODE_03AF23                            ;$00872A   | 
CODE_00872E: JSL CODE_03A2C7                            ;$00872E   | 
CODE_008732: BCC CODE_008738                            ;$008732   | 
CODE_008734: JML CODE_03A32E                            ;$008734   | 

CODE_008738: LDA $7400,x                                ;$008738   | 
CODE_00873B: DEC A                                      ;$00873B   | 
CODE_00873C: STA $00                                    ;$00873C   | 
CODE_00873E: LDA $70E2,x                                ;$00873E   | 
CODE_008741: SEC                                        ;$008741   | 
CODE_008742: SBC $7900,x                                ;$008742   | 
CODE_008745: CLC                                        ;$008745   | 
CODE_008746: ADC #$0020                                 ;$008746   | 
CODE_008749: CMP #$0040                                 ;$008749   | 
CODE_00874C: BCC CODE_008767                            ;$00874C   | 
CODE_00874E: EOR $00                                    ;$00874E   | 
CODE_008750: BMI CODE_008767                            ;$008750   | 

CODE_008752: LDA $10                                    ;$008752   | 
CODE_008754: AND #$001F                                 ;$008754   | 
CODE_008757: CLC                                        ;$008757   | 
CODE_008758: ADC #$0030                                 ;$008758   | 
CODE_00875B: STA $7AF6,x                                ;$00875B   | 
CODE_00875E: LDA $7400,x                                ;$00875E   | 
CODE_008761: EOR #$0002                                 ;$008761   | 
CODE_008764: STA $7400,x                                ;$008764   | 
CODE_008767: LDY $7AF6,x                                ;$008767   | 
CODE_00876A: BEQ CODE_008752                            ;$00876A   | 
CODE_00876C: LDY $7400,x                                ;$00876C   | 
CODE_00876F: LDA $8726,y                                ;$00876F   | 
CODE_008772: STA $7220,x                                ;$008772   | 
CODE_008775: LDY $7A98,x                                ;$008775   | 
CODE_008778: BNE CODE_008789                            ;$008778   | 
CODE_00877A: LDA #$0008                                 ;$00877A   | 
CODE_00877D: STA $7A98,x                                ;$00877D   | 
CODE_008780: LDA $7402,x                                ;$008780   | 
CODE_008783: EOR #$0001                                 ;$008783   | 
CODE_008786: STA $7402,x                                ;$008786   | 
CODE_008789: RTL                                        ;$008789   | 

.init_skinny_platform
CODE_00878A: STZ $7400,x                                ;$00878A   | 
CODE_00878D: RTL                                        ;$00878D   | 

.main_skinny_platform
CODE_00878E: REP #$10                                   ;$00878E   | 
CODE_008790: LDY $7362,x                                ;$008790   | 
CODE_008793: LDA $7682,x                                ;$008793   | 
CODE_008796: STA $00                                    ;$008796   | 
CODE_008798: LDA $7A36,x                                ;$008798   | 
CODE_00879B: AND #$00FF                                 ;$00879B   | 
CODE_00879E: CLC                                        ;$00879E   | 
CODE_00879F: ADC $00                                    ;$00879F   | 
CODE_0087A1: STA $6002,y                                ;$0087A1   | 
CODE_0087A4: LDA $7A37,x                                ;$0087A4   | 
CODE_0087A7: AND #$00FF                                 ;$0087A7   | 
CODE_0087AA: CLC                                        ;$0087AA   | 
CODE_0087AB: ADC $00                                    ;$0087AB   | 
CODE_0087AD: STA $600A,y                                ;$0087AD   | 
CODE_0087B0: LDA $7A38,x                                ;$0087B0   | 
CODE_0087B3: AND #$00FF                                 ;$0087B3   | 
CODE_0087B6: CLC                                        ;$0087B6   | 
CODE_0087B7: ADC $00                                    ;$0087B7   | 
CODE_0087B9: STA $6012,y                                ;$0087B9   | 
CODE_0087BC: LDA $7A39,x                                ;$0087BC   | 
CODE_0087BF: AND #$00FF                                 ;$0087BF   | 
CODE_0087C2: CLC                                        ;$0087C2   | 
CODE_0087C3: ADC $00                                    ;$0087C3   | 
CODE_0087C5: STA $601A,y                                ;$0087C5   | 
CODE_0087C8: LDA $7900,x                                ;$0087C8   | 
CODE_0087CB: AND #$00FF                                 ;$0087CB   | 
CODE_0087CE: CLC                                        ;$0087CE   | 
CODE_0087CF: ADC $00                                    ;$0087CF   | 
CODE_0087D1: STA $6022,y                                ;$0087D1   | 
CODE_0087D4: LDA $7901,x                                ;$0087D4   | 
CODE_0087D7: AND #$00FF                                 ;$0087D7   | 
CODE_0087DA: CLC                                        ;$0087DA   | 
CODE_0087DB: ADC $00                                    ;$0087DB   | 
CODE_0087DD: STA $602A,y                                ;$0087DD   | 
CODE_0087E0: LDA $7902,x                                ;$0087E0   | 
CODE_0087E3: AND #$00FF                                 ;$0087E3   | 
CODE_0087E6: CLC                                        ;$0087E6   | 
CODE_0087E7: ADC $00                                    ;$0087E7   | 
CODE_0087E9: STA $6032,y                                ;$0087E9   | 
CODE_0087EC: LDA $7903,x                                ;$0087EC   | 
CODE_0087EF: AND #$00FF                                 ;$0087EF   | 
CODE_0087F2: CLC                                        ;$0087F2   | 
CODE_0087F3: ADC $00                                    ;$0087F3   | 
CODE_0087F5: STA $603A,y                                ;$0087F5   | 
CODE_0087F8: SEP #$10                                   ;$0087F8   | 
CODE_0087FA: LDA $60FC                                  ;$0087FA   | 
CODE_0087FD: AND #$0003                                 ;$0087FD   | 
CODE_008800: BNE CODE_00880B                            ;$008800   | 
CODE_008802: LDA $6090                                  ;$008802   | 
CODE_008805: CLC                                        ;$008805   | 
CODE_008806: ADC $18,x                                  ;$008806   | 
CODE_008808: STA $6090                                  ;$008808   | 
CODE_00880B: LDA $7A36,x                                ;$00880B   | 
CODE_00880E: AND #$00FF                                 ;$00880E   | 
CODE_008811: STA $6000                                  ;$008811   | 
CODE_008814: STA $00                                    ;$008814   | 
CODE_008816: LDA $7A37,x                                ;$008816   | 
CODE_008819: AND #$00FF                                 ;$008819   | 
CODE_00881C: STA $6002                                  ;$00881C   | 
CODE_00881F: STA $02                                    ;$00881F   | 
CODE_008821: LDA $7A38,x                                ;$008821   | 
CODE_008824: AND #$00FF                                 ;$008824   | 
CODE_008827: STA $6004                                  ;$008827   | 
CODE_00882A: STA $04                                    ;$00882A   | 
CODE_00882C: LDA $7A39,x                                ;$00882C   | 
CODE_00882F: AND #$00FF                                 ;$00882F   | 
CODE_008832: STA $6006                                  ;$008832   | 
CODE_008835: STA $06                                    ;$008835   | 
CODE_008837: LDA $7900,x                                ;$008837   | 
CODE_00883A: AND #$00FF                                 ;$00883A   | 
CODE_00883D: STA $6008                                  ;$00883D   | 

CODE_008840: STA $08                                    ;$008840   | 
CODE_008842: LDA $7901,x                                ;$008842   | 
CODE_008845: AND #$00FF                                 ;$008845   | 
CODE_008848: STA $600A                                  ;$008848   | 
CODE_00884B: STA $0A                                    ;$00884B   | 
CODE_00884D: LDA $7902,x                                ;$00884D   | 
CODE_008850: AND #$00FF                                 ;$008850   | 
CODE_008853: STA $600C                                  ;$008853   | 
CODE_008856: STA $0C                                    ;$008856   | 
CODE_008858: LDA $7903,x                                ;$008858   | 
CODE_00885B: AND #$00FF                                 ;$00885B   | 
CODE_00885E: STA $600E                                  ;$00885E   | 
CODE_008861: STA $0E                                    ;$008861   | 
CODE_008863: STZ $3002                                  ;$008863   | 
CODE_008866: LDY $60AB                                  ;$008866   | 

CODE_008869: BPL CODE_008870                            ;$008869   | 
CODE_00886B: LDY $60C0                                  ;$00886B   | 
CODE_00886E: BNE CODE_0088C7                            ;$00886E   | 
CODE_008870: LDA $611C                                  ;$008870   | 
CODE_008873: SEC                                        ;$008873   | 
CODE_008874: SBC $70E2,x                                ;$008874   | 
CODE_008877: CLC                                        ;$008877   | 
CODE_008878: ADC #$0020                                 ;$008878   | 
CODE_00887B: CMP #$0040                                 ;$00887B   | 
CODE_00887E: BCS CODE_0088CF                            ;$00887E   | 
CODE_008880: STA $3004                                  ;$008880   | 
CODE_008883: LDA $70E2,x                                ;$008883   | 
CODE_008886: SEC                                        ;$008886   | 
CODE_008887: SBC #$0018                                 ;$008887   | 
CODE_00888A: SEC                                        ;$00888A   | 
CODE_00888B: SBC $611C                                  ;$00888B   | 
CODE_00888E: STA $3006                                  ;$00888E   | 
CODE_008891: LDA #$0046                                 ;$008891   | 
CODE_008894: CLC                                        ;$008894   | 
CODE_008895: ADC $78,x                                  ;$008895   | 
CODE_008897: STA $603E                                  ;$008897   | 
CODE_00889A: LSR A                                      ;$00889A   | 
CODE_00889B: STA $603C                                  ;$00889B   | 
CODE_00889E: STA $300C                                  ;$00889E   | 
CODE_0088A1: LDA $611E                                  ;$0088A1   | 
CODE_0088A4: CLC                                        ;$0088A4   | 
CODE_0088A5: ADC $6112                                  ;$0088A5   | 
CODE_0088A8: STA $3010                                  ;$0088A8   | 
CODE_0088AB: LDA $6122                                  ;$0088AB   | 
CODE_0088AE: STA $3012                                  ;$0088AE   | 
CODE_0088B1: LDA $7182,x                                ;$0088B1   | 
CODE_0088B4: STA $3014                                  ;$0088B4   | 
CODE_0088B7: LDX #$0B                                   ;$0088B7   | 
CODE_0088B9: LDA #$860A                                 ;$0088B9   | 
CODE_0088BC: JSL CODE_7EDE44                            ;$0088BC   |  GSU init

CODE_0088C0: LDX $12                                    ;$0088C0   | 
CODE_0088C2: LDY $3002                                  ;$0088C2   | 
CODE_0088C5: BNE CODE_0088F5                            ;$0088C5   | 
CODE_0088C7: LDA $7222,x                                ;$0088C7   | 
CODE_0088CA: BEQ CODE_0088CF                            ;$0088CA   | 
CODE_0088CC: JMP CODE_00899F                            ;$0088CC   | 

CODE_0088CF: LDY #$0E                                   ;$0088CF   | 
CODE_0088D1: LDA $7960,y                                ;$0088D1   | 
CODE_0088D4: BEQ CODE_0088EC                            ;$0088D4   | 
CODE_0088D6: CMP #$0008                                 ;$0088D6   | 
CODE_0088D9: BPL CODE_0088DE                            ;$0088D9   | 
CODE_0088DB: LDA #$0008                                 ;$0088DB   | 
CODE_0088DE: LSR A                                      ;$0088DE   | 
CODE_0088DF: LSR A                                      ;$0088DF   | 
CODE_0088E0: LSR A                                      ;$0088E0   | 
CODE_0088E1: EOR #$FFFF                                 ;$0088E1   | 
CODE_0088E4: INC A                                      ;$0088E4   | 
CODE_0088E5: CLC                                        ;$0088E5   | 
CODE_0088E6: ADC $7960,y                                ;$0088E6   | 
CODE_0088E9: STA $7960,y                                ;$0088E9   | 
CODE_0088EC: DEY                                        ;$0088EC   | 
CODE_0088ED: DEY                                        ;$0088ED   | 
CODE_0088EE: BPL CODE_0088D1                            ;$0088EE   | 
CODE_0088F0: STZ $18,x                                  ;$0088F0   | 
CODE_0088F2: JMP CODE_008985                            ;$0088F2   | 

CODE_0088F5: LDA $7222,x                                ;$0088F5   | 
CODE_0088F8: BEQ CODE_00891A                            ;$0088F8   | 
CODE_0088FA: LDY #$0E                                   ;$0088FA   | 
CODE_0088FC: LDA $6000,y                                ;$0088FC   | 
CODE_0088FF: SEC                                        ;$0088FF   | 
CODE_008900: SBC $7960,y                                ;$008900   | 
CODE_008903: BMI CODE_008914                            ;$008903   | 
CODE_008905: CMP #$8000                                 ;$008905   | 
CODE_008908: ROR A                                      ;$008908   | 
CODE_008909: CMP #$8000                                 ;$008909   | 
CODE_00890C: ROR A                                      ;$00890C   | 
CODE_00890D: CLC                                        ;$00890D   | 
CODE_00890E: ADC $7960,y                                ;$00890E   | 
CODE_008911: STA $7960,y                                ;$008911   | 
CODE_008914: DEY                                        ;$008914   | 
CODE_008915: DEY                                        ;$008915   | 
CODE_008916: BPL CODE_0088FC                            ;$008916   | 
CODE_008918: BRA CODE_008936                            ;$008918   | 

CODE_00891A: LDY #$0E                                   ;$00891A   | 
CODE_00891C: LDA $6000,y                                ;$00891C   | 
CODE_00891F: SEC                                        ;$00891F   | 
CODE_008920: SBC $7960,y                                ;$008920   | 
CODE_008923: CMP #$8000                                 ;$008923   | 
CODE_008926: ROR A                                      ;$008926   | 
CODE_008927: CMP #$8000                                 ;$008927   | 
CODE_00892A: ROR A                                      ;$00892A   | 
CODE_00892B: CLC                                        ;$00892B   | 
CODE_00892C: ADC $7960,y                                ;$00892C   | 
CODE_00892F: STA $7960,y                                ;$00892F   | 
CODE_008932: DEY                                        ;$008932   | 
CODE_008933: DEY                                        ;$008933   | 
CODE_008934: BPL CODE_00891C                            ;$008934   | 
CODE_008936: LDY $18,x                                  ;$008936   | 
CODE_008938: BNE CODE_00894F                            ;$008938   | 
CODE_00893A: LDA $60AA                                  ;$00893A   | 
CODE_00893D: LSR A                                      ;$00893D   | 
CODE_00893E: LSR A                                      ;$00893E   | 
CODE_00893F: LSR A                                      ;$00893F   | 
CODE_008940: LSR A                                      ;$008940   | 
CODE_008941: STA $78,x                                  ;$008941   | 
CODE_008943: LDY $60D4                                  ;$008943   | 
CODE_008946: BEQ CODE_00894F                            ;$008946   | 
CODE_008948: LDA $60AA                                  ;$008948   | 
CODE_00894B: LSR A                                      ;$00894B   | 
CODE_00894C: STA $7222,x                                ;$00894C   | 
CODE_00894F: LDA $60FC                                  ;$00894F   | 
CODE_008952: AND #$0003                                 ;$008952   | 
CODE_008955: BNE CODE_008985                            ;$008955   | 
CODE_008957: LDA $6020                                  ;$008957   | 
CODE_00895A: AND #$FFFE                                 ;$00895A   | 
CODE_00895D: TAY                                        ;$00895D   | 
CODE_00895E: LDA $7960,y                                ;$00895E   | 
CODE_008961: CLC                                        ;$008961   | 
CODE_008962: ADC $7182,x                                ;$008962   | 
CODE_008965: SEC                                        ;$008965   | 
CODE_008966: SBC #$001E                                 ;$008966   | 
CODE_008969: SEC                                        ;$008969   | 
CODE_00896A: SBC $6112                                  ;$00896A   | 
CODE_00896D: STA $6090                                  ;$00896D   | 
CODE_008970: STZ $60AA                                  ;$008970   | 
CODE_008973: INC $61B4                                  ;$008973   | 
CODE_008976: LDY #$02                                   ;$008976   | 
CODE_008978: STY $18,x                                  ;$008978   | 
CODE_00897A: LDA $7222,x                                ;$00897A   | 
CODE_00897D: BEQ CODE_008985                            ;$00897D   | 
CODE_00897F: LDA #$0800                                 ;$00897F   | 
CODE_008982: STA $60AA                                  ;$008982   | 
CODE_008985: LDA $7222,x                                ;$008985   | 
CODE_008988: BEQ CODE_008992                            ;$008988   | 
CODE_00898A: LDA $78,x                                  ;$00898A   | 
CODE_00898C: CLC                                        ;$00898C   | 
CODE_00898D: ADC #$0004                                 ;$00898D   | 
CODE_008990: BRA CODE_00899D                            ;$008990   | 

CODE_008992: LDA $78,x                                  ;$008992   | 
CODE_008994: SEC                                        ;$008994   | 
CODE_008995: SBC #$0008                                 ;$008995   | 
CODE_008998: BPL CODE_00899D                            ;$008998   | 
CODE_00899A: LDA #$0000                                 ;$00899A   | 
CODE_00899D: STA $78,x                                  ;$00899D   | 
CODE_00899F: SEP #$20                                   ;$00899F   | 
CODE_0089A1: LDA $00                                    ;$0089A1   | 
CODE_0089A3: STA $7A36,x                                ;$0089A3   | 
CODE_0089A6: LDA $02                                    ;$0089A6   | 
CODE_0089A8: STA $7A37,x                                ;$0089A8   | 
CODE_0089AB: LDA $04                                    ;$0089AB   | 
CODE_0089AD: STA $7A38,x                                ;$0089AD   | 
CODE_0089B0: LDA $06                                    ;$0089B0   | 
CODE_0089B2: STA $7A39,x                                ;$0089B2   | 
CODE_0089B5: LDA $08                                    ;$0089B5   | 
CODE_0089B7: STA $7900,x                                ;$0089B7   | 
CODE_0089BA: LDA $0A                                    ;$0089BA   | 
CODE_0089BC: STA $7901,x                                ;$0089BC   | 
CODE_0089BF: LDA $0C                                    ;$0089BF   | 
CODE_0089C1: STA $7902,x                                ;$0089C1   | 
CODE_0089C4: LDA $0E                                    ;$0089C4   | 
CODE_0089C6: STA $7903,x                                ;$0089C6   | 
CODE_0089C9: REP #$20                                   ;$0089C9   | 
CODE_0089CB: RTL                                        ;$0089CB   | 

; pointer table (address - 1)
DATA_0089CC:         dw $8CBE, $8D03, $8D36, $8D74
DATA_0089D4:         dw $8D8E, $8DA4, $8DB1, $8DE6
DATA_0089DC:         dw $8DF7, $8E15, $8E36, $8E5D
DATA_0089E4:         dw $8E7D, $8EEE, $8EFD, $8F0A
DATA_0089EC:         dw $8F3A, $8F69, $8F9A, $8FD1
DATA_0089F4:         dw $9006, $9027, $9098, $90B9
DATA_0089FC:         dw $90C2, $AD09, $90F5, $912C
DATA_008A04:         dw $9153, $9518, $917A, $919F
DATA_008A0C:         dw $91C6, $9219, $9253, $927C
DATA_008A14:         dw $92ED, $9375, $93A3, $93DD
DATA_008A1C:         dw $9432, $9518, $9547, $955E
DATA_008A24:         dw $92AC, $92A4, $955E, $9518
DATA_008A2C:         dw $9518, $9518, $9518, $9547
DATA_008A34:         dw $A7D9, $9530, $961A, $9530
DATA_008A3C:         dw $9645, $95CB, $9530, $986C
DATA_008A44:         dw $986C, $9518, $958C, $986C
DATA_008A4C:         dw $9575, $9575, $9518, $9547
DATA_008A54:         dw $9415, $9ADC, $9B12, $9530
DATA_008A5C:         dw $9518, $9530, $9530, $955E
DATA_008A64:         dw $9B54, $9518, $9B87, $9BBB
DATA_008A6C:         dw $9BE2, $9C1C, $9E91, $9518
DATA_008A74:         dw $9518, $951C, $A192, $A192
DATA_008A7C:         dw $A550, $A56E, $A599, $9ADC
DATA_008A84:         dw $A6A8, $A6CD, $A834, $A6A8
DATA_008A8C:         dw $A725, $9B54, $A758, $A775
DATA_008A94:         dw $9518, $A78C, $A7A3, $A7F6
DATA_008A9C:         dw $9530, $9518, $A80D, $9518
DATA_008AA4:         dw $8D95, $9219, $9518, $9518
DATA_008AAC:         dw $98AB, $9912, $9997, $9A18
DATA_008AB4:         dw $9A65

    PHB                 ; $008AB6   |
    PHK                 ; $008AB7   |
    PLB                 ; $008AB8   |
    LDA $61B0           ; $008AB9   |
    ORA $0B55           ; $008ABC   |
    ORA $0398           ; $008ABF   |
    STA $0B8F           ; $008AC2   |
    LDX #$3C            ; $008AC5   |

CODE_008AC7:
    LDY $6EC0,x         ; $008AC7   |
    BEQ CODE_008ACF     ; $008ACA   |
    JSR CODE_008AD7     ; $008ACC   |

CODE_008ACF:
    DEX                 ; $008ACF   |
    DEX                 ; $008AD0   |
    DEX                 ; $008AD1   |
    DEX                 ; $008AD2   |
    BPL CODE_008AC7     ; $008AD3   |
    PLB                 ; $008AD5   |
    RTL                 ; $008AD6   |

CODE_008AD7: LDA $7320,x                                ;$008AD7   | 
CODE_008ADA: ASL A                                      ;$008ADA   | 
CODE_008ADB: REP #$10                                   ;$008ADB   | 
CODE_008ADD: TAY                                        ;$008ADD   | 
CODE_008ADE: LDA $8658,y                                ;$008ADE   | 
CODE_008AE1: SEP #$10                                   ;$008AE1   | 
CODE_008AE3: PHA                                        ;$008AE3   | 
CODE_008AE4: RTS                                        ;$008AE4   | 

CODE_008AE5: LDA $0B8F                                  ;$008AE5   | 
CODE_008AE8: BEQ CODE_008AF2                            ;$008AE8   | 
CODE_008AEA: PLA                                        ;$008AEA   | 
CODE_008AEB: RTS                                        ;$008AEB   | 

CODE_008AEC: LDA $0B8F                                  ;$008AEC   | 
CODE_008AEF: BEQ CODE_008AF2                            ;$008AEF   | 
CODE_008AF1: RTS                                        ;$008AF1   | 

CODE_008AF2: LDA $7782,x                                ;$008AF2   | 
CODE_008AF5: BNE CODE_008B0D                            ;$008AF5   | 
CODE_008AF7: PLA                                        ;$008AF7   | 

CODE_008AF8: STZ $6EC0,x                                ;$008AF8   | 
CODE_008AFB: LDA #$00FF                                 ;$008AFB   | 
CODE_008AFE: STA $7462,x                                ;$008AFE   | 
CODE_008B01: LDY $76E2,x                                ;$008B01   | 
CODE_008B04: BMI CODE_008B0C                            ;$008B04   | 
CODE_008B06: LDA $7ECE,y                                ;$008B06   | 
CODE_008B09: TRB $7ECC                                  ;$008B09   | 
CODE_008B0C: RTS                                        ;$008B0C   | 

CODE_008B0D: DEC $7782,x                                ;$008B0D   | 
CODE_008B10: LDA $7E8E,x                                ;$008B10   | 
CODE_008B13: BEQ CODE_008B18                            ;$008B13   | 
CODE_008B15: DEC $7E8E,x                                ;$008B15   | 
CODE_008B18: LDY $7781,x                                ;$008B18   | 
CODE_008B1B: BEQ CODE_008B20                            ;$008B1B   | 
CODE_008B1D: DEC $7781,x                                ;$008B1D   | 
CODE_008B20: RTS                                        ;$008B20   | 

; spawn sprite
CODE_008B21: PHA                                        ;$008B21   | 
CODE_008B22: LDY #$3C                                   ;$008B22   | 
CODE_008B24: LDA $6EC0,y                                ;$008B24   | 
CODE_008B27: BEQ CODE_008B3D                            ;$008B27   | 
CODE_008B29: DEY                                        ;$008B29   | 
CODE_008B2A: DEY                                        ;$008B2A   | 
CODE_008B2B: DEY                                        ;$008B2B   | 
CODE_008B2C: DEY                                        ;$008B2C   | 
CODE_008B2D: BPL CODE_008B24                            ;$008B2D   | 
CODE_008B2F: LDY $7E4A                                  ;$008B2F   | 
CODE_008B32: DEY                                        ;$008B32   | 
CODE_008B33: DEY                                        ;$008B33   | 
CODE_008B34: DEY                                        ;$008B34   | 
CODE_008B35: DEY                                        ;$008B35   | 
CODE_008B36: BPL CODE_008B3A                            ;$008B36   | 
CODE_008B38: LDY #$3C                                   ;$008B38   | 
CODE_008B3A: STY $7E4A                                  ;$008B3A   | 
CODE_008B3D: LDA #$0000                                 ;$008B3D   | 
CODE_008B40: STA $71E0,y                                ;$008B40   | 
CODE_008B43: STA $71E2,y                                ;$008B43   | 
CODE_008B46: STA $73C0,y                                ;$008B46   | 
CODE_008B49: STA $70A0,y                                ;$008B49   | 
CODE_008B4C: STA $7140,y                                ;$008B4C   | 
CODE_008B4F: STA $7E4C,y                                ;$008B4F   | 
CODE_008B52: STA $7E4E,y                                ;$008B52   | 
CODE_008B55: STA $7E8C,y                                ;$008B55   | 
CODE_008B58: STA $7782,y                                ;$008B58   | 
CODE_008B5B: STA $7E8E,y                                ;$008B5B   | 
CODE_008B5E: STA $73C2,y                                ;$008B5E   | 
CODE_008B61: STA $7820,y                                ;$008B61   | 
CODE_008B64: STA $6EC2,y                                ;$008B64   | 
CODE_008B67: STA $76E0,y                                ;$008B67   | 
CODE_008B6A: STA $7640,y                                ;$008B6A   | 
CODE_008B6D: STA $7642,y                                ;$008B6D   | 
CODE_008B70: STA $7500,y                                ;$008B70   | 
CODE_008B73: STA $75A0,y                                ;$008B73   | 
CODE_008B76: STA $7780,y                                ;$008B76   | 
CODE_008B79: DEC A                                      ;$008B79   | 
CODE_008B7A: STA $7322,y                                ;$008B7A   | 
CODE_008B7D: STA $76E2,y                                ;$008B7D   | 
CODE_008B80: LDA #$1FFF                                 ;$008B80   | 
CODE_008B83: STA $7822,y                                ;$008B83   | 
CODE_008B86: PLA                                        ;$008B86   | 
CODE_008B87: STA $7320,y                                ;$008B87   | 
CODE_008B8A: PHX                                        ;$008B8A   | 
CODE_008B8B: ASL A                                      ;$008B8B   | 
CODE_008B8C: REP #$10                                   ;$008B8C   | 
CODE_008B8E: TAX                                        ;$008B8E   | 
CODE_008B8F: SEP #$20                                   ;$008B8F   | 
CODE_008B91: PHY                                        ;$008B91   | 
CODE_008B92: LDA $0AB59E,x                              ;$008B92   | 
CODE_008B96: LDY #$0006                                 ;$008B96   | 
CODE_008B99: CMP $6EB5,y                                ;$008B99   | 
CODE_008B9C: BEQ CODE_008BA4                            ;$008B9C   | 
CODE_008B9E: DEY                                        ;$008B9E   | 
CODE_008B9F: BNE CODE_008B99                            ;$008B9F   | 
CODE_008BA1: TYA                                        ;$008BA1   | 
CODE_008BA2: BRA CODE_008BA9                            ;$008BA2   | 

CODE_008BA4: TYA                                        ;$008BA4   | 
CODE_008BA5: ADC #$06                                   ;$008BA5   | 
CODE_008BA7: ASL A                                      ;$008BA7   | 
CODE_008BA8: ASL A                                      ;$008BA8   | 
CODE_008BA9: REP #$20                                   ;$008BA9   | 
CODE_008BAB: AND #$00FF                                 ;$008BAB   | 
CODE_008BAE: PLY                                        ;$008BAE   | 
CODE_008BAF: STA $7140,y                                ;$008BAF   | 
CODE_008BB2: LDA $0AB19F,x                              ;$008BB2   | 
CODE_008BB6: AND #$00FF                                 ;$008BB6   | 
CODE_008BB9: EOR #$0030                                 ;$008BB9   | 
CODE_008BBC: STA $7002,y                                ;$008BBC   | 
CODE_008BBF: LDA $0AB19E,x                              ;$008BBF   | 
CODE_008BC3: AND #$00FF                                 ;$008BC3   | 
CODE_008BC6: STA $7462,y                                ;$008BC6   | 
CODE_008BC9: LDA $0AB39D,x                              ;$008BC9   | 
CODE_008BCD: AND #$FF00                                 ;$008BCD   | 
CODE_008BD0: BPL CODE_008BD5                            ;$008BD0   | 
CODE_008BD2: ORA #$00FF                                 ;$008BD2   | 
CODE_008BD5: XBA                                        ;$008BD5   | 
CODE_008BD6: STA $7502,y                                ;$008BD6   | 
CODE_008BD9: LDA $0AB39E,x                              ;$008BD9   | 
CODE_008BDD: AND #$FF00                                 ;$008BDD   | 
CODE_008BE0: BPL CODE_008BE5                            ;$008BE0   | 
CODE_008BE2: ORA #$00FF                                 ;$008BE2   | 
CODE_008BE5: XBA                                        ;$008BE5   | 
CODE_008BE6: ASL A                                      ;$008BE6   | 
CODE_008BE7: ASL A                                      ;$008BE7   | 
CODE_008BE8: ASL A                                      ;$008BE8   | 
CODE_008BE9: ASL A                                      ;$008BE9   | 
CODE_008BEA: STA $75A2,y                                ;$008BEA   | 
CODE_008BED: LDA $0AAB9E,x                              ;$008BED   | 
CODE_008BF1: STA $6F60,y                                ;$008BF1   | 
CODE_008BF4: LDA $0AAD9E,x                              ;$008BF4   | 
CODE_008BF8: STA $6F62,y                                ;$008BF8   | 
CODE_008BFB: LDA $0AAF9E,x                              ;$008BFB   | 
CODE_008BFF: STA $7000,y                                ;$008BFF   | 
CODE_008C02: LDA #$000E                                 ;$008C02   | 
CODE_008C05: STA $6EC0,y                                ;$008C05   | 
CODE_008C08: LDA #$00FF                                 ;$008C08   | 
CODE_008C0B: STA $7460,y                                ;$008C0B   | 
CODE_008C0E: SEP #$10                                   ;$008C0E   | 
CODE_008C10: PLX                                        ;$008C10   | 
CODE_008C11: RTL                                        ;$008C11   | 

CODE_008C12: LDA $75A0,x                                ;$008C12   | 
CODE_008C15: SEC                                        ;$008C15   | 
CODE_008C16: SBC $71E0,x                                ;$008C16   | 
CODE_008C19: ASL A                                      ;$008C19   | 
CODE_008C1A: LDA $7500,x                                ;$008C1A   | 
CODE_008C1D: BCC CODE_008C23                            ;$008C1D   | 
CODE_008C1F: EOR #$FFFF                                 ;$008C1F   | 
CODE_008C22: INC A                                      ;$008C22   | 
CODE_008C23: CLC                                        ;$008C23   | 
CODE_008C24: ADC $71E0,x                                ;$008C24   | 
CODE_008C27: STA $71E0,x                                ;$008C27   | 
CODE_008C2A: AND #$00FF                                 ;$008C2A   | 
CODE_008C2D: XBA                                        ;$008C2D   | 
CODE_008C2E: CLC                                        ;$008C2E   | 
CODE_008C2F: ADC $70A0,x                                ;$008C2F   | 
CODE_008C32: STA $70A0,x                                ;$008C32   | 
CODE_008C35: LDA $71E0,x                                ;$008C35   | 
CODE_008C38: AND #$FF00                                 ;$008C38   | 
CODE_008C3B: BPL CODE_008C40                            ;$008C3B   | 
CODE_008C3D: ORA #$00FF                                 ;$008C3D   | 
CODE_008C40: XBA                                        ;$008C40   | 
CODE_008C41: ADC #$0000                                 ;$008C41   | 
CODE_008C44: STA $7280,x                                ;$008C44   | 
CODE_008C47: CLC                                        ;$008C47   | 
CODE_008C48: ADC $70A2,x                                ;$008C48   | 
CODE_008C4B: STA $70A2,x                                ;$008C4B   | 
CODE_008C4E: LDA $75A2,x                                ;$008C4E   | 
CODE_008C51: SEC                                        ;$008C51   | 
CODE_008C52: SBC $71E2,x                                ;$008C52   | 
CODE_008C55: ASL A                                      ;$008C55   | 
CODE_008C56: LDA $7502,x                                ;$008C56   | 
CODE_008C59: BCC CODE_008C5F                            ;$008C59   | 
CODE_008C5B: EOR #$FFFF                                 ;$008C5B   | 
CODE_008C5E: INC A                                      ;$008C5E   | 
CODE_008C5F: CLC                                        ;$008C5F   | 
CODE_008C60: ADC $71E2,x                                ;$008C60   | 
CODE_008C63: STA $71E2,x                                ;$008C63   | 
CODE_008C66: AND #$00FF                                 ;$008C66   | 
CODE_008C69: XBA                                        ;$008C69   | 
CODE_008C6A: CLC                                        ;$008C6A   | 
CODE_008C6B: ADC $7140,x                                ;$008C6B   | 
CODE_008C6E: STA $7140,x                                ;$008C6E   | 
CODE_008C71: LDA $71E2,x                                ;$008C71   | 
CODE_008C74: AND #$FF00                                 ;$008C74   | 
CODE_008C77: BPL CODE_008C7C                            ;$008C77   | 
CODE_008C79: ORA #$00FF                                 ;$008C79   | 
CODE_008C7C: XBA                                        ;$008C7C   | 
CODE_008C7D: ADC #$0000                                 ;$008C7D   | 
CODE_008C80: STA $7282,x                                ;$008C80   | 
CODE_008C83: CLC                                        ;$008C83   | 
CODE_008C84: ADC $7142,x                                ;$008C84   | 
CODE_008C87: STA $7142,x                                ;$008C87   | 
CODE_008C8A: RTS                                        ;$008C8A   | 

DATA_008C8B:          dw $0007, $0008, $0009, $000A
DATA_008C93:          dw $0009, $0008, $0007, $0006
DATA_008C9B:          dw $0005, $0004, $0003, $0002
DATA_008CA3:          dw $0001, $0003, $0004, $0005
DATA_008CAB:          dw $0004, $0003, $0003, $0003
DATA_008CB3:          dw $0003, $0003, $0003, $0003
DATA_008CBB:          dw $0003, $0003

CODE_008CBF: JSR CODE_008AE5                            ;$008CBF   | 
CODE_008CC2: LDA $7782,x                                ;$008CC2   | 
CODE_008CC5: BNE CODE_008CDF                            ;$008CC5   | 
CODE_008CC7: LDA $7E4C,x                                ;$008CC7   | 
CODE_008CCA: DEC A                                      ;$008CCA   | 
CODE_008CCB: DEC A                                      ;$008CCB   | 
CODE_008CCC: BPL CODE_008CCF                            ;$008CCC   | 
CODE_008CCE: RTS                                        ;$008CCE   | 

CODE_008CCF: STA $7E4C,x                                ;$008CCF   | 
CODE_008CD2: TAY                                        ;$008CD2   | 
CODE_008CD3: LDA $8C8B,y                                ;$008CD3   | 
CODE_008CD6: STA $73C2,x                                ;$008CD6   | 
CODE_008CD9: LDA $8CA5,y                                ;$008CD9   | 
CODE_008CDC: STA $7782,x                                ;$008CDC   | 
CODE_008CDF: RTS                                        ;$008CDF   | 

DATA_008CE0:          dw $0000, $0002, $0001, $0001
DATA_008CE8:          dw $0000, $0000, $0001, $0000
DATA_008CF0:          dw $0000, $0000, $0000, $FFFF
DATA_008CF8:          dw $0000, $0000, $FFFF, $FFFF
DATA_008D00:          dw $FFFE, $0000

CODE_008D04: JSR CODE_008AE5                            ;$008D04   | 
CODE_008D07: LDA $7782,x                                ;$008D07   | 
CODE_008D0A: ASL A                                      ;$008D0A   | 
CODE_008D0B: TAY                                        ;$008D0B   | 
CODE_008D0C: LDA $8CDE,y                                ;$008D0C   | 
CODE_008D0F: CLC                                        ;$008D0F   | 
CODE_008D10: ADC $7142,x                                ;$008D10   | 
CODE_008D13: STA $7142,x                                ;$008D13   | 
CODE_008D16: RTS                                        ;$008D16   | 

DATA_008D17:          dw $0001, $0000, $0000, $0000
DATA_008D1F:          dw $0000, $0000, $FFFF, $0000
DATA_008D27:          dw $FFFF, $0000, $0000, $0000
DATA_008D2F:          dw $0000, $0000, $0001, $0000

CODE_008D37: JSR CODE_008AE5                            ;$008D37   | 

CODE_008D3A: LDA $7822,x                                ;$008D3A   | 
CODE_008D3D: AND #$00FF                                 ;$008D3D   | 
CODE_008D40: STA $7782,x                                ;$008D40   | 
CODE_008D43: BNE CODE_008D48                            ;$008D43   | 
CODE_008D45: JMP CODE_008AF8                            ;$008D45   | 

CODE_008D48: LDA #$00FF                                 ;$008D48   | 
CODE_008D4B: ORA $7822,x                                ;$008D4B   | 
CODE_008D4E: STA $7822,x                                ;$008D4E   | 
CODE_008D51: LDA #$0002                                 ;$008D51   | 
CODE_008D54: STA $7462,x                                ;$008D54   | 
CODE_008D57: INC $7E4C,x                                ;$008D57   | 
CODE_008D5A: LDA $7E4C,x                                ;$008D5A   | 
CODE_008D5D: BIT #$0018                                 ;$008D5D   | 
CODE_008D60: BEQ CODE_008D65                            ;$008D60   | 
CODE_008D62: DEC $7142,x                                ;$008D62   | 
CODE_008D65: AND #$000F                                 ;$008D65   | 
CODE_008D68: ASL A                                      ;$008D68   | 
CODE_008D69: TAY                                        ;$008D69   | 
CODE_008D6A: LDA $70A2,x                                ;$008D6A   | 
CODE_008D6D: CLC                                        ;$008D6D   | 
CODE_008D6E: ADC $8D17,y                                ;$008D6E   | 
CODE_008D71: STA $70A2,x                                ;$008D71   | 
CODE_008D74: RTS                                        ;$008D74   | 

CODE_008D75: JSR CODE_008AE5                            ;$008D75   | 
CODE_008D78: LDA $7782,x                                ;$008D78   | 
CODE_008D7B: BNE CODE_008D89                            ;$008D7B   | 
CODE_008D7D: INC $7782,x                                ;$008D7D   | 
CODE_008D80: LDA $7002,x                                ;$008D80   | 
CODE_008D83: ORA #$0080                                 ;$008D83   | 
CODE_008D86: STA $7002,x                                ;$008D86   | 
CODE_008D89: RTS                                        ;$008D89   | 

DATA_008D8A:		db $40,$40,$FF,$00,$00

CODE_008D8F: JSR CODE_008AE5                            ;$008D8F   | 
CODE_008D92: INC $73C2,x                                ;$008D92   | 
CODE_008D95: RTS                                        ;$008D95   | 

CODE_008D96: JSR CODE_008AEC                            ;$008D96   | 
CODE_008D99: LDA $14                                    ;$008D99   | 
CODE_008D9B: LSR A                                      ;$008D9B   | 
CODE_008D9C: LSR A                                      ;$008D9C   | 
CODE_008D9D: LSR A                                      ;$008D9D   | 
CODE_008D9E: AND #$0003                                 ;$008D9E   | 
CODE_008DA1: STA $73C2,x                                ;$008DA1   | 
CODE_008DA4: RTS                                        ;$008DA4   | 

CODE_008DA5: JSR CODE_008AEC                            ;$008DA5   | 
CODE_008DA8: RTS                                        ;$008DA8   | 

DATA_008DA9:          db $02, $01, $00, $FF, $00, $06, $06, $06
DATA_008DB1:          db $03

CODE_008DB2: JSR CODE_008AE5                            ;$008DB2   | 
CODE_008DB5: SEP #$20                                   ;$008DB5   | 
CODE_008DB7: LDY $7E4C,x                                ;$008DB7   | 
CODE_008DBA: LDA $7782,x                                ;$008DBA   | 
CODE_008DBD: BNE CODE_008DD7                            ;$008DBD   | 
CODE_008DBF: DEC $7E4C,x                                ;$008DBF   | 
CODE_008DC2: BMI CODE_008DE4                            ;$008DC2   | 
CODE_008DC4: DEY                                        ;$008DC4   | 
CODE_008DC5: CPY #$03                                   ;$008DC5   | 
CODE_008DC7: BNE CODE_008DD1                            ;$008DC7   | 
CODE_008DC9: LDA $7000,x                                ;$008DC9   | 
CODE_008DCC: AND #$FC                                   ;$008DCC   | 
CODE_008DCE: STA $7000,x                                ;$008DCE   | 
CODE_008DD1: LDA $8DAE,y                                ;$008DD1   | 
CODE_008DD4: STA $7782,x                                ;$008DD4   | 
CODE_008DD7: LDA $8DA9,y                                ;$008DD7   | 
CODE_008DDA: STA $73C2,x                                ;$008DDA   | 
CODE_008DDD: BMI CODE_008DE1                            ;$008DDD   | 
CODE_008DDF: LDA #$06                                   ;$008DDF   | 
CODE_008DE1: STA $7462,x                                ;$008DE1   | 
CODE_008DE4: REP #$20                                   ;$008DE4   | 
CODE_008DE6: RTS                                        ;$008DE6   | 

CODE_008DE7: JSR CODE_008AE5                            ;$008DE7   | 
CODE_008DEA: SEP #$20                                   ;$008DEA   | 
CODE_008DEC: LDA $7782,x                                ;$008DEC   | 
CODE_008DEF: LSR A                                      ;$008DEF   | 
CODE_008DF0: LSR A                                      ;$008DF0   | 
CODE_008DF1: LSR A                                      ;$008DF1   | 
CODE_008DF2: STA $73C2,x                                ;$008DF2   | 
CODE_008DF5: REP #$20                                   ;$008DF5   | 
CODE_008DF7: RTS                                        ;$008DF7   | 

CODE_008DF8: DEC $7782,x                                ;$008DF8   | 
CODE_008DFB: LDA $7782,x                                ;$008DFB   | 
CODE_008DFE: BNE CODE_008E03                            ;$008DFE   | 
CODE_008E00: JMP CODE_008AF8                            ;$008E00   | 

CODE_008E03: CMP #$003F                                 ;$008E03   | 
CODE_008E06: BCS CODE_008E0B                            ;$008E06   | 
CODE_008E08: DEC $7782,x                                ;$008E08   | 
CODE_008E0B: SEP #$20                                   ;$008E0B   | 
CODE_008E0D: LSR A                                      ;$008E0D   | 
CODE_008E0E: AND #$07                                   ;$008E0E   | 
CODE_008E10: STA $73C2,x                                ;$008E10   | 
CODE_008E13: REP #$20                                   ;$008E13   | 
CODE_008E15: RTS                                        ;$008E15   | 

CODE_008E16: JSR CODE_008AE5                            ;$008E16   | 
CODE_008E19: LDY $73C2,x                                ;$008E19   | 
CODE_008E1C: LDA $7782,x                                ;$008E1C   | 
CODE_008E1F: BNE CODE_008E2F                            ;$008E1F   | 
CODE_008E21: DEC $73C2,x                                ;$008E21   | 
CODE_008E24: BPL CODE_008E29                            ;$008E24   | 
CODE_008E26: JMP CODE_008AF8                            ;$008E26   | 

CODE_008E29: LDA #$0002                                 ;$008E29   | 
CODE_008E2C: STA $7782,x                                ;$008E2C   | 
CODE_008E2F: RTS                                        ;$008E2F   | 

DATA_008E30:          db $09, $07, $06, $03, $02, $01, $00

CODE_008E37: JSR CODE_008AE5                            ;$008E37   | 
CODE_008E3A: SEP #$20                                   ;$008E3A   | 
CODE_008E3C: LDY $7E4C,x                                ;$008E3C   | 
CODE_008E3F: LDA $7782,x                                ;$008E3F   | 
CODE_008E42: BNE CODE_008E4F                            ;$008E42   | 
CODE_008E44: DEC $7E4C,x                                ;$008E44   | 
CODE_008E47: BMI CODE_008E55                            ;$008E47   | 
CODE_008E49: LDA $8E2F,y                                ;$008E49   | 
CODE_008E4C: STA $7782,x                                ;$008E4C   | 
CODE_008E4F: LDA $8E33,y                                ;$008E4F   | 
CODE_008E52: STA $73C2,x                                ;$008E52   | 
CODE_008E55: REP #$20                                   ;$008E55   | 
CODE_008E57: RTS                                        ;$008E57   | 

DATA_008E58:          db $06, $06, $06, $06, $04, $03

CODE_008E5E: JSR CODE_008AE5                            ;$008E5E   | 
CODE_008E61: SEP #$20                                   ;$008E61   | 
CODE_008E63: LDY $73C2,x                                ;$008E63   | 
CODE_008E66: LDA $7782,x                                ;$008E66   | 
CODE_008E69: BNE CODE_008E77                            ;$008E69   | 
CODE_008E6B: DEY                                        ;$008E6B   | 
CODE_008E6C: BMI CODE_008E77                            ;$008E6C   | 
CODE_008E6E: DEC $73C2,x                                ;$008E6E   | 
CODE_008E71: LDA $8E58,y                                ;$008E71   | 
CODE_008E74: STA $7782,x                                ;$008E74   | 
CODE_008E77: REP #$20                                   ;$008E77   | 
CODE_008E79: RTS                                        ;$008E79   | 

DATA_008E7A:          db $06, $06, $05, $05

CODE_008E7E: JSR CODE_008AE5                            ;$008E7E   | 
CODE_008E81: SEP #$20                                   ;$008E81   | 
CODE_008E83: LDY $73C2,x                                ;$008E83   | 
CODE_008E86: LDA $7782,x                                ;$008E86   | 
CODE_008E89: LSR A                                      ;$008E89   | 
CODE_008E8A: BNE CODE_008E9A                            ;$008E8A   | 
CODE_008E8C: DEY                                        ;$008E8C   | 
CODE_008E8D: DEY                                        ;$008E8D   | 
CODE_008E8E: BMI CODE_008E9A                            ;$008E8E   | 
CODE_008E90: TYA                                        ;$008E90   | 
CODE_008E91: STA $73C2,x                                ;$008E91   | 
CODE_008E94: LDA $8E7A,y                                ;$008E94   | 
CODE_008E97: STA $7782,x                                ;$008E97   | 
CODE_008E9A: REP #$10                                   ;$008E9A   | 
CODE_008E9C: LDA $73C2,x                                ;$008E9C   | 
CODE_008E9F: LSR A                                      ;$008E9F   | 
CODE_008EA0: TXY                                        ;$008EA0   | 
CODE_008EA1: LDX $7E4C,y                                ;$008EA1   | 
CODE_008EA4: LDA $00E954,x                              ;$008EA4   | 
CODE_008EA8: STA $211B                                  ;$008EA8   | 
CODE_008EAB: LDA $00E955,x                              ;$008EAB   | 
CODE_008EAF: STA $211B                                  ;$008EAF   | 
CODE_008EB2: LDA #$FC                                   ;$008EB2   | 
CODE_008EB4: BCC CODE_008EB8                            ;$008EB4   | 
CODE_008EB6: LDA #$FE                                   ;$008EB6   | 
CODE_008EB8: CLC                                        ;$008EB8   | 
CODE_008EB9: ADC $7E4E,y                                ;$008EB9   | 
CODE_008EBC: STA $7E4E,y                                ;$008EBC   | 
CODE_008EBF: STA $211C                                  ;$008EBF   | 
CODE_008EC2: REP #$20                                   ;$008EC2   | 
CODE_008EC4: LDA $2135                                  ;$008EC4   | 
CODE_008EC7: ASL A                                      ;$008EC7   | 
CODE_008EC8: ASL A                                      ;$008EC8   | 
CODE_008EC9: ASL A                                      ;$008EC9   | 
CODE_008ECA: STA $71E0,y                                ;$008ECA   | 
CODE_008ECD: LDA $00E9D4,x                              ;$008ECD   | 
CODE_008ED1: SEP #$20                                   ;$008ED1   | 
CODE_008ED3: STA $211B                                  ;$008ED3   | 
CODE_008ED6: XBA                                        ;$008ED6   | 
CODE_008ED7: STA $211B                                  ;$008ED7   | 
CODE_008EDA: LDA $7E4E,y                                ;$008EDA   | 
CODE_008EDD: STA $211C                                  ;$008EDD   | 
CODE_008EE0: REP #$20                                   ;$008EE0   | 
CODE_008EE2: LDA $2135                                  ;$008EE2   | 
CODE_008EE5: ASL A                                      ;$008EE5   | 
CODE_008EE6: ASL A                                      ;$008EE6   | 
CODE_008EE7: ASL A                                      ;$008EE7   | 
CODE_008EE8: STA $71E2,y                                ;$008EE8   | 
CODE_008EEB: SEP #$10                                   ;$008EEB   | 
CODE_008EED: TYX                                        ;$008EED   | 
CODE_008EEE: RTS                                        ;$008EEE   | 

CODE_008EEF: JSR CODE_008AE5                            ;$008EEF   | 
CODE_008EF2: LDA $71E2,x                                ;$008EF2   | 
CODE_008EF5: BMI CODE_008EFD                            ;$008EF5   | 
CODE_008EF7: LDA #$0001                                 ;$008EF7   | 
CODE_008EFA: STA $73C2,x                                ;$008EFA   | 
CODE_008EFD: RTS                                        ;$008EFD   | 

CODE_008EFE: JSR CODE_008AE5                            ;$008EFE   | 
CODE_008F01: LDA $7782,x                                ;$008F01   | 
CODE_008F04: LSR A                                      ;$008F04   | 
CODE_008F05: LSR A                                      ;$008F05   | 
CODE_008F06: LSR A                                      ;$008F06   | 
CODE_008F07: STA $73C2,x                                ;$008F07   | 
CODE_008F0A: RTS                                        ;$008F0A   | 

CODE_008F0B: JSR CODE_008AE5                            ;$008F0B   | 
CODE_008F0E: LDA $7782,x                                ;$008F0E   | 
CODE_008F11: CMP #$0008                                 ;$008F11   | 
CODE_008F14: BNE CODE_008F19                            ;$008F14   | 
CODE_008F16: INC $73C2,x                                ;$008F16   | 
CODE_008F19: AND #$0007                                 ;$008F19   | 
CODE_008F1C: BNE CODE_008F2E                            ;$008F1C   | 
CODE_008F1E: LDA $7970                                  ;$008F1E   | 
CODE_008F21: AND #$0001                                 ;$008F21   | 
CODE_008F24: BNE CODE_008F27                            ;$008F24   | 
CODE_008F26: DEC A                                      ;$008F26   | 
CODE_008F27: CLC                                        ;$008F27   | 
CODE_008F28: ADC $70A2,x                                ;$008F28   | 
CODE_008F2B: STA $70A2,x                                ;$008F2B   | 
CODE_008F2E: RTS                                        ;$008F2E   | 

DATA_008F2F:         db $02, $02, $02, $01, $01, $01, $03, $03
DATA_008F37:         db $03, $02, $02, $02

CODE_008F3B: JSR CODE_008AE5                            ;$008F3B   | 
CODE_008F3E: LDA $7782,x                                ;$008F3E   | 
CODE_008F41: BNE CODE_008F5B                            ;$008F41   | 
CODE_008F43: SEP #$20                                   ;$008F43   | 
CODE_008F45: DEC $7E4C,x                                ;$008F45   | 
CODE_008F48: BEQ CODE_008F59                            ;$008F48   | 
CODE_008F4A: LDY $7E4C,x                                ;$008F4A   | 
CODE_008F4D: LDA $8F34,y                                ;$008F4D   | 
CODE_008F50: STA $7782,x                                ;$008F50   | 
CODE_008F53: LDA $8F2E,y                                ;$008F53   | 
CODE_008F56: STA $73C2,x                                ;$008F56   | 
CODE_008F59: REP #$20                                   ;$008F59   | 
CODE_008F5B: RTS                                        ;$008F5B   | 

DATA_008F5C:         db $05, $04, $03, $01, $01, $02, $01, $03
DATA_008F64:         db $03, $03, $03, $03, $04, $04

CODE_008F6A: JSR CODE_008AE5                            ;$008F6A   | 
CODE_008F6D: LDA $7782,x                                ;$008F6D   | 
CODE_008F70: BNE CODE_008F8A                            ;$008F70   | 
CODE_008F72: DEC $7E4C,x                                ;$008F72   | 
CODE_008F75: BMI CODE_008F8A                            ;$008F75   | 
CODE_008F77: SEP #$20                                   ;$008F77   | 
CODE_008F79: LDY $7E4C,x                                ;$008F79   | 
CODE_008F7C: LDA $8F5C,y                                ;$008F7C   | 
CODE_008F7F: STA $73C2,x                                ;$008F7F   | 
CODE_008F82: LDA $8F63,y                                ;$008F82   | 
CODE_008F85: STA $7782,x                                ;$008F85   | 
CODE_008F88: REP #$20                                   ;$008F88   | 
CODE_008F8A: RTS                                        ;$008F8A   | 

DATA_008F8B:         db $08, $07, $06, $05, $04, $03, $02, $01
DATA_008F93:         db $40, $02, $02, $02, $02, $02, $02, $02

CODE_008F9B: JSR CODE_008AE5                            ;$008F9B   | 
CODE_008F9E: LDA $7782,x                                ;$008F9E   | 
CODE_008FA1: BNE CODE_008FBB                            ;$008FA1   | 
CODE_008FA3: DEC $7E4C,x                                ;$008FA3   | 
CODE_008FA6: BMI CODE_008FBB                            ;$008FA6   | 
CODE_008FA8: SEP #$20                                   ;$008FA8   | 
CODE_008FAA: LDY $7E4C,x                                ;$008FAA   | 
CODE_008FAD: LDA $8F8B,y                                ;$008FAD   | 
CODE_008FB0: STA $73C2,x                                ;$008FB0   | 
CODE_008FB3: LDA $8F93,y                                ;$008FB3   | 
CODE_008FB6: STA $7782,x                                ;$008FB6   | 
CODE_008FB9: REP #$20                                   ;$008FB9   | 
CODE_008FBB: RTS                                        ;$008FBB   | 

DATA_008FBC:          db $0B, $0A, $09, $08, $07, $06, $05, $04
DATA_008FC4:          db $03, $02, $01, $04, $04, $04, $04, $04
DATA_008FCC:          db $04, $03, $03, $02, $02, $01

CODE_008FD2: LDY $7E4E,x                                ;$008FD2   | 
CODE_008FD5: BEQ CODE_008FE4                            ;$008FD5   | 
CODE_008FD7: LDA $0B8F                                  ;$008FD7   | 
CODE_008FDA: BEQ CODE_008FE4                            ;$008FDA   | 
CODE_008FDC: DEC $7782,x                                ;$008FDC   | 
CODE_008FDF: BPL CODE_008FE7                            ;$008FDF   | 
CODE_008FE1: JMP CODE_008AF8                            ;$008FE1   | 

CODE_008FE4: JSR CODE_008AE5                            ;$008FE4   | 
CODE_008FE7: LDA $7782,x                                ;$008FE7   | 
CODE_008FEA: BNE CODE_009004                            ;$008FEA   | 
CODE_008FEC: DEC $7E4C,x                                ;$008FEC   | 
CODE_008FEF: BMI CODE_009004                            ;$008FEF   | 
CODE_008FF1: SEP #$20                                   ;$008FF1   | 
CODE_008FF3: LDY $7E4C,x                                ;$008FF3   | 
CODE_008FF6: LDA $8FBC,y                                ;$008FF6   | 
CODE_008FF9: STA $73C2,x                                ;$008FF9   | 
CODE_008FFC: LDA $8FC7,y                                ;$008FFC   | 
CODE_008FFF: STA $7782,x                                ;$008FFF   | 
CODE_009002: REP #$20                                   ;$009002   | 
CODE_009004: RTS                                        ;$009004   | 

DATA_009005:          db $01, $11

CODE_009007: JSR CODE_008AE5                            ;$009007   | 
CODE_00900A: LDA $7782,x                                ;$00900A   | 
CODE_00900D: BNE CODE_009027                            ;$00900D   | 
CODE_00900F: DEC $7E4C,x                                ;$00900F   | 
CODE_009012: BMI CODE_009027                            ;$009012   | 
CODE_009014: SEP #$20                                   ;$009014   | 
CODE_009016: LDY $7E4C,x                                ;$009016   | 
CODE_009019: LDA $9005,y                                ;$009019   | 
CODE_00901C: STA $73C2,x                                ;$00901C   | 
CODE_00901F: LDA $9006,y                                ;$00901F   | 
CODE_009022: STA $7782,x                                ;$009022   | 
CODE_009025: REP #$20                                   ;$009025   | 
CODE_009027: RTS                                        ;$009027   | 

CODE_009028: JSR CODE_008AE5                            ;$009028   | 
CODE_00902B: LDY $7E4C,x                                ;$00902B   | 
CODE_00902E: LDA $70E2,y                                ;$00902E   | 
CODE_009031: STA $00                                    ;$009031   | 
CODE_009033: LDA $7182,y                                ;$009033   | 
CODE_009036: CLC                                        ;$009036   | 
CODE_009037: ADC #$0008                                 ;$009037   | 
CODE_00903A: STA $02                                    ;$00903A   | 
CODE_00903C: LDA $7E4E,x                                ;$00903C   | 
CODE_00903F: STA $06                                    ;$00903F   | 
CODE_009041: LDA $7E8C,x                                ;$009041   | 
CODE_009044: STA $04                                    ;$009044   | 
CODE_009046: LDA $70A2,x                                ;$009046   | 
CODE_009049: STA $08                                    ;$009049   | 
CODE_00904B: LDA $7142,x                                ;$00904B   | 
CODE_00904E: STA $0A                                    ;$00904E   | 
CODE_009050: JSL CODE_049B42                            ;$009050   | 
CODE_009054: LDA $04                                    ;$009054   | 
CODE_009056: STA $7E8C,x                                ;$009056   | 
CODE_009059: BPL CODE_009061                            ;$009059   | 
CODE_00905B: EOR #$FFFF                                 ;$00905B   | 
CODE_00905E: INC A                                      ;$00905E   | 
CODE_00905F: STA $04                                    ;$00905F   | 
CODE_009061: LDA $06                                    ;$009061   | 
CODE_009063: STA $7E4E,x                                ;$009063   | 
CODE_009066: BPL CODE_00906C                            ;$009066   | 
CODE_009068: EOR #$FFFF                                 ;$009068   | 
CODE_00906B: INC A                                      ;$00906B   | 
CODE_00906C: CLC                                        ;$00906C   | 
CODE_00906D: ADC $04                                    ;$00906D   | 
CODE_00906F: CMP #$0030                                 ;$00906F   | 
CODE_009072: BCS CODE_00907A                            ;$009072   | 
CODE_009074: LDA #$0001                                 ;$009074   | 
CODE_009077: STA $73C2,x                                ;$009077   | 
CODE_00907A: LDA $08                                    ;$00907A   | 
CODE_00907C: STA $70A2,x                                ;$00907C   | 
CODE_00907F: LDA $0A                                    ;$00907F   | 
CODE_009081: STA $7142,x                                ;$009081   | 
CODE_009084: RTS                                        ;$009084   | 

DATA_009085:          db $0A, $09, $08, $07, $06, $05, $04, $03
DATA_00908D:          db $02, $01, $05, $05, $05, $04, $04, $04
DATA_009095:          db $03, $03, $02, $02

CODE_009099: JSR CODE_008AE5                            ;$009099   | 
CODE_00909C: LDA $7782,x                                ;$00909C   | 
CODE_00909F: BNE CODE_0090B9                            ;$00909F   | 
CODE_0090A1: DEC $7E4C,x                                ;$0090A1   | 
CODE_0090A4: BMI CODE_0090B9                            ;$0090A4   | 
CODE_0090A6: SEP #$20                                   ;$0090A6   | 
CODE_0090A8: LDY $7E4C,x                                ;$0090A8   | 
CODE_0090AB: LDA $9085,y                                ;$0090AB   | 
CODE_0090AE: STA $73C2,x                                ;$0090AE   | 
CODE_0090B1: LDA $908F,y                                ;$0090B1   | 
CODE_0090B4: STA $7782,x                                ;$0090B4   | 
CODE_0090B7: REP #$20                                   ;$0090B7   | 
CODE_0090B9: RTS                                        ;$0090B9   | 

CODE_0090BA: JSR CODE_008AEC                            ;$0090BA   | 
CODE_0090BD: RTS                                        ;$0090BD   | 

DATA_0090BE:          db $06, $04, $04, $03, $03

CODE_0090C3: JSR CODE_008AE5                            ;$0090C3   | 
CODE_0090C6: LDA $7782,x                                ;$0090C6   | 
CODE_0090C9: BNE CODE_0090DF                            ;$0090C9   | 
CODE_0090CB: DEC $73C2,x                                ;$0090CB   | 
CODE_0090CE: BPL CODE_0090D3                            ;$0090CE   | 
CODE_0090D0: JMP CODE_008AF8                            ;$0090D0   | 

CODE_0090D3: LDY $73C2,x                                ;$0090D3   | 
CODE_0090D6: LDA $90BE,y                                ;$0090D6   | 
CODE_0090D9: AND #$00FF                                 ;$0090D9   | 
CODE_0090DC: STA $7782,x                                ;$0090DC   | 
CODE_0090DF: RTS                                        ;$0090DF   | 

DATA_0090E0:          db $0B, $0A, $09, $08, $07, $06, $05, $04
DATA_0090E8:          db $03, $02, $01, $06, $06, $06, $06, $06
DATA_0090F0:          db $06, $06, $03, $03, $03, $03

CODE_0090F6: LDY $7E4E,x                                ;$0090F6   | 
CODE_0090F9: BEQ CODE_009100                            ;$0090F9   | 
CODE_0090FB: JSR CODE_008AF2                            ;$0090FB   | 
CODE_0090FE: BRA CODE_009103                            ;$0090FE   | 

CODE_009100: JSR CODE_008AE5                            ;$009100   | 
CODE_009103: LDA $7782,x                                ;$009103   | 
CODE_009106: BNE CODE_009120                            ;$009106   | 
CODE_009108: DEC $7E4C,x                                ;$009108   | 
CODE_00910B: BMI CODE_009120                            ;$00910B   | 
CODE_00910D: SEP #$20                                   ;$00910D   | 
CODE_00910F: LDY $7E4C,x                                ;$00910F   | 
CODE_009112: LDA $90E0,y                                ;$009112   | 
CODE_009115: STA $73C2,x                                ;$009115   | 
CODE_009118: LDA $90EB,y                                ;$009118   | 
CODE_00911B: STA $7782,x                                ;$00911B   | 
CODE_00911E: REP #$20                                   ;$00911E   | 
CODE_009120: RTS                                        ;$009120   | 

DATA_009121:          db $06, $05, $04, $03, $02, $01, $04, $08
DATA_009129:          db $08, $08, $04, $02

CODE_00912D: JSR CODE_008AE5                            ;$00912D   | 
CODE_009130: LDA $7782,x                                ;$009130   | 
CODE_009133: BNE CODE_00914D                            ;$009133   | 
CODE_009135: DEC $7E4C,x                                ;$009135   | 
CODE_009138: BMI CODE_00914D                            ;$009138   | 
CODE_00913A: SEP #$20                                   ;$00913A   | 
CODE_00913C: LDY $7E4C,x                                ;$00913C   | 
CODE_00913F: LDA $9121,y                                ;$00913F   | 
CODE_009142: STA $73C2,x                                ;$009142   | 
CODE_009145: LDA $9127,y                                ;$009145   | 
CODE_009148: STA $7782,x                                ;$009148   | 
CODE_00914B: REP #$20                                   ;$00914B   | 
CODE_00914D: RTS                                        ;$00914D   | 

DATA_00914E:          db $03, $02, $01, $06, $04, $02

CODE_009154: JSR CODE_008AE5                            ;$009154   | 
CODE_009157: LDA $7782,x                                ;$009157   | 
CODE_00915A: BNE CODE_009174                            ;$00915A   | 
CODE_00915C: DEC $7E4C,x                                ;$00915C   | 
CODE_00915F: BMI CODE_009174                            ;$00915F   | 
CODE_009161: SEP #$20                                   ;$009161   | 
CODE_009163: LDY $7E4C,x                                ;$009163   | 
CODE_009166: LDA $914E,y                                ;$009166   | 
CODE_009169: STA $73C2,x                                ;$009169   | 
CODE_00916C: LDA $9151,y                                ;$00916C   | 
CODE_00916F: STA $7782,x                                ;$00916F   | 
CODE_009172: REP #$20                                   ;$009172   | 
CODE_009174: RTS                                        ;$009174   | 

DATA_009175:          db $03, $02, $01, $06, $04, $02

CODE_00917B: JSR CODE_008AE5                            ;$00917B   | 
CODE_00917E: LDA $7782,x                                ;$00917E   | 
CODE_009181: BNE CODE_00919B                            ;$009181   | 
CODE_009183: DEC $7E4C,x                                ;$009183   | 
CODE_009186: BMI CODE_00919B                            ;$009186   | 
CODE_009188: SEP #$20                                   ;$009188   | 
CODE_00918A: LDY $7E4C,x                                ;$00918A   | 
CODE_00918D: LDA $9175,y                                ;$00918D   | 
CODE_009190: STA $73C2,x                                ;$009190   | 
CODE_009193: LDA $9178,y                                ;$009193   | 
CODE_009196: STA $7782,x                                ;$009196   | 
CODE_009199: REP #$20                                   ;$009199   | 
CODE_00919B: RTS                                        ;$00919B   | 

DATA_00919C:          db $02, $01, $0C, $08

CODE_0091A0: JSR CODE_008AE5                            ;$0091A0   | 
CODE_0091A3: LDA $7782,x                                ;$0091A3   | 
CODE_0091A6: BNE CODE_0091C0                            ;$0091A6   | 
CODE_0091A8: DEC $7E4C,x                                ;$0091A8   | 
CODE_0091AB: BMI CODE_0091C0                            ;$0091AB   | 
CODE_0091AD: SEP #$20                                   ;$0091AD   | 
CODE_0091AF: LDY $7E4C,x                                ;$0091AF   | 
CODE_0091B2: LDA $919C,y                                ;$0091B2   | 
CODE_0091B5: STA $73C2,x                                ;$0091B5   | 
CODE_0091B8: LDA $919E,y                                ;$0091B8   | 
CODE_0091BB: STA $7782,x                                ;$0091BB   | 
CODE_0091BE: REP #$20                                   ;$0091BE   | 
CODE_0091C0: RTS                                        ;$0091C0   | 

DATA_0091C1:          db $03, $02, $01, $08, $08, $04

CODE_0091C7: JSR CODE_008C12                            ;$0091C7   | 
CODE_0091CA: LDA $75A0,x                                ;$0091CA   | 
CODE_0091CD: CMP $71E0,x                                ;$0091CD   | 
CODE_0091D0: BNE CODE_0091D9                            ;$0091D0   | 
CODE_0091D2: EOR #$FFFF                                 ;$0091D2   | 
CODE_0091D5: INC A                                      ;$0091D5   | 
CODE_0091D6: STA $75A0,x                                ;$0091D6   | 
CODE_0091D9: LDA $75A2,x                                ;$0091D9   | 
CODE_0091DC: CMP $71E2,x                                ;$0091DC   | 
CODE_0091DF: BNE CODE_0091E8                            ;$0091DF   | 
CODE_0091E1: EOR #$FFFF                                 ;$0091E1   | 
CODE_0091E4: INC A                                      ;$0091E4   | 
CODE_0091E5: STA $75A2,x                                ;$0091E5   | 
CODE_0091E8: DEC $7782,x                                ;$0091E8   | 
CODE_0091EB: BNE CODE_009213                            ;$0091EB   | 
CODE_0091ED: DEC $7E4C,x                                ;$0091ED   | 
CODE_0091F0: BPL CODE_0091F6                            ;$0091F0   | 
CODE_0091F2: JSR CODE_008AF8                            ;$0091F2   | 
CODE_0091F5: RTS                                        ;$0091F5   | 

CODE_0091F6: SEP #$20                                   ;$0091F6   | 
CODE_0091F8: LDY $7E4C,x                                ;$0091F8   | 
CODE_0091FB: LDA $91C1,y                                ;$0091FB   | 
CODE_0091FE: STA $73C2,x                                ;$0091FE   | 
CODE_009201: LDA $91C4,y                                ;$009201   | 
CODE_009204: STA $7782,x                                ;$009204   | 
CODE_009207: REP #$20                                   ;$009207   | 
CODE_009209: CPY #$02                                   ;$009209   | 
CODE_00920B: BMI CODE_009213                            ;$00920B   | 
CODE_00920D: LDA #$0080                                 ;$00920D   | 
CODE_009210: STA $71E2,x                                ;$009210   | 
CODE_009213: RTS                                        ;$009213   | 

DATA_009214:          db $03, $02, $01, $08, $08, $08

CODE_00921A: JSR CODE_008C12                            ;$00921A   | 
CODE_00921D: JSR CODE_008AF2                            ;$00921D   | 
CODE_009220: LDA $7782,x                                ;$009220   | 
CODE_009223: BNE CODE_00923D                            ;$009223   | 
CODE_009225: DEC $7E4C,x                                ;$009225   | 
CODE_009228: BMI CODE_00923D                            ;$009228   | 
CODE_00922A: SEP #$20                                   ;$00922A   | 
CODE_00922C: LDY $7E4C,x                                ;$00922C   | 
CODE_00922F: LDA $9214,y                                ;$00922F   | 
CODE_009232: STA $73C2,x                                ;$009232   | 
CODE_009235: LDA $9217,y                                ;$009235   | 
CODE_009238: STA $7782,x                                ;$009238   | 
CODE_00923B: REP #$20                                   ;$00923B   | 
CODE_00923D: RTS                                        ;$00923D   | 

DATA_00923E:          db $0B, $0A, $09, $08, $07, $06, $05, $04
DATA_009246:          db $03, $02, $01, $01, $01, $01, $01, $01
DATA_00924E:          db $01, $01, $01, $01, $01, $02, $20

CODE_009254: JSR CODE_008AE5                            ;$009254   | 
CODE_009257: LDA $7782,x                                ;$009257   | 
CODE_00925A: BNE CODE_009274                            ;$00925A   | 
CODE_00925C: DEC $7E4C,x                                ;$00925C   | 
CODE_00925F: BMI CODE_009274                            ;$00925F   | 
CODE_009261: SEP #$20                                   ;$009261   | 
CODE_009263: LDY $7E4C,x                                ;$009263   | 
CODE_009266: LDA $923E,y                                ;$009266   | 
CODE_009269: STA $73C2,x                                ;$009269   | 
CODE_00926C: LDA $9249,y                                ;$00926C   | 
CODE_00926F: STA $7782,x                                ;$00926F   | 
CODE_009272: REP #$20                                   ;$009272   | 
CODE_009274: RTS                                        ;$009274   | 

DATA_009275:          db $04, $03, $02, $01, $06, $06, $06, $06

CODE_00927D: JSR CODE_008AE5                            ;$00927D   | 
CODE_009280: LDA $7782,x                                ;$009280   | 
CODE_009283: BNE CODE_00929D                            ;$009283   | 
CODE_009285: DEC $7E4C,x                                ;$009285   | 
CODE_009288: BMI CODE_00929D                            ;$009288   | 
CODE_00928A: SEP #$20                                   ;$00928A   | 
CODE_00928C: LDY $7E4C,x                                ;$00928C   | 
CODE_00928F: LDA $9275,y                                ;$00928F   | 
CODE_009292: STA $73C2,x                                ;$009292   | 
CODE_009295: LDA $9279,y                                ;$009295   | 
CODE_009298: STA $7782,x                                ;$009298   | 
CODE_00929B: REP #$20                                   ;$00929B   | 
CODE_00929D: RTS                                        ;$00929D   | 

DATA_00929E:          db $03, $03, $03, $03, $03, $03, $03, $AD
DATA_0092A6:          db $8F, $0B, $F0, $03

CODE_0092AA: JSR CODE_008C12                            ;$0092AA   | 
CODE_0092AD: JSR CODE_008AF2                            ;$0092AD   | 
CODE_0092B0: LDA $7782,x                                ;$0092B0   | 
CODE_0092B3: BNE CODE_0092CB                            ;$0092B3   | 
CODE_0092B5: DEC $7E4C,x                                ;$0092B5   | 
CODE_0092B8: BMI CODE_0092CB                            ;$0092B8   | 
CODE_0092BA: SEP #$20                                   ;$0092BA   | 
CODE_0092BC: LDY $7E4C,x                                ;$0092BC   | 
CODE_0092BF: TYA                                        ;$0092BF   | 
CODE_0092C0: STA $73C2,x                                ;$0092C0   | 
CODE_0092C3: LDA $929E,y                                ;$0092C3   | 
CODE_0092C6: STA $7782,x                                ;$0092C6   | 
CODE_0092C9: REP #$20                                   ;$0092C9   | 
CODE_0092CB: RTS                                        ;$0092CB   | 

DATA_0092CC:          db $03, $02, $00, $01, $08, $00, $FA, $FF
DATA_0092D4:          db $FD, $FF, $01, $00, $09, $00, $F8, $FF
DATA_0092DC:          db $06, $00, $03, $00, $FF, $FF, $F7, $FF
DATA_0092E4:          db $FE, $FF, $04, $00, $FE, $FF, $FC, $FF
DATA_0092EC:          db $FB, $FF

CODE_0092EE: LDY $7E4E,x                                ;$0092EE   | 
CODE_0092F1: LDA $7400,y                                ;$0092F1   | 
CODE_0092F4: STA $00                                    ;$0092F4   | 
CODE_0092F6: LDA $7402,y                                ;$0092F6   | 
CODE_0092F9: SEC                                        ;$0092F9   | 
CODE_0092FA: SBC #$001B                                 ;$0092FA   | 
CODE_0092FD: ASL A                                      ;$0092FD   | 
CODE_0092FE: PHY                                        ;$0092FE   | 
CODE_0092FF: TAY                                        ;$0092FF   | 
CODE_009300: LDA $00                                    ;$009300   | 
CODE_009302: BEQ CODE_009309                            ;$009302   | 
CODE_009304: LDA $92DA,y                                ;$009304   | 
CODE_009307: BRA CODE_00930C                            ;$009307   | 

CODE_009309: LDA $92D0,y                                ;$009309   | 
CODE_00930C: STA $00                                    ;$00930C   | 
CODE_00930E: LDA $92E4,y                                ;$00930E   | 
CODE_009311: STA $02                                    ;$009311   | 
CODE_009313: PLY                                        ;$009313   | 
CODE_009314: LDA $70E2,y                                ;$009314   | 
CODE_009317: CLC                                        ;$009317   | 
CODE_009318: ADC $00                                    ;$009318   | 
CODE_00931A: CLC                                        ;$00931A   | 
CODE_00931B: ADC $78C0,x                                ;$00931B   | 
CODE_00931E: CMP $70A2,x                                ;$00931E   | 
CODE_009321: BEQ CODE_00932D                            ;$009321   | 
CODE_009323: BMI CODE_00932A                            ;$009323   | 
CODE_009325: INC $70A2,x                                ;$009325   | 
CODE_009328: BRA CODE_00932D                            ;$009328   | 

CODE_00932A: DEC $70A2,x                                ;$00932A   | 
CODE_00932D: LDA $7182,y                                ;$00932D   | 
CODE_009330: CLC                                        ;$009330   | 
CODE_009331: ADC $02                                    ;$009331   | 
CODE_009333: CLC                                        ;$009333   | 
CODE_009334: ADC $78C2,x                                ;$009334   | 
CODE_009337: CMP $7142,x                                ;$009337   | 
CODE_00933A: BEQ CODE_009346                            ;$00933A   | 
CODE_00933C: BMI CODE_009343                            ;$00933C   | 
CODE_00933E: INC $7142,x                                ;$00933E   | 
CODE_009341: BRA CODE_009346                            ;$009341   | 

CODE_009343: DEC $7142,x                                ;$009343   | 
CODE_009346: DEC $7782,x                                ;$009346   | 
CODE_009349: BNE CODE_009370                            ;$009349   | 
CODE_00934B: DEC $7E4C,x                                ;$00934B   | 
CODE_00934E: BPL CODE_009354                            ;$00934E   | 
CODE_009350: JSR CODE_008AF8                            ;$009350   | 
CODE_009353: RTS                                        ;$009353   | 

CODE_009354: SEP #$20                                   ;$009354   | 
CODE_009356: LDY $7E4C,x                                ;$009356   | 
CODE_009359: LDA $92CC,y                                ;$009359   | 
CODE_00935C: STA $73C2,x                                ;$00935C   | 
CODE_00935F: LDA #$04                                   ;$00935F   | 
CODE_009361: STA $7782,x                                ;$009361   | 
CODE_009364: REP #$20                                   ;$009364   | 
CODE_009366: CPY #$02                                   ;$009366   | 
CODE_009368: BMI CODE_009370                            ;$009368   | 
CODE_00936A: LDA #$0080                                 ;$00936A   | 
CODE_00936D: STA $71E2,x                                ;$00936D   | 
CODE_009370: RTS                                        ;$009370   | 

DATA_009371:          db $03, $02, $01, $00, $04

CODE_009376: LDY $7E4E,x                                ;$009376   | 
CODE_009379: BEQ CODE_009380                            ;$009379   | 
CODE_00937B: JSR CODE_008AF2                            ;$00937B   | 
CODE_00937E: BRA CODE_009383                            ;$00937E   | 

CODE_009380: JSR CODE_008AE5                            ;$009380   | 
CODE_009383: LDA $7782,x                                ;$009383   | 
CODE_009386: BNE CODE_00939F                            ;$009386   | 
CODE_009388: DEC $7E4C,x                                ;$009388   | 
CODE_00938B: BMI CODE_00939F                            ;$00938B   | 
CODE_00938D: SEP #$20                                   ;$00938D   | 
CODE_00938F: LDY $7E4C,x                                ;$00938F   | 
CODE_009392: LDA $9371,y                                ;$009392   | 
CODE_009395: STA $73C2,x                                ;$009395   | 
CODE_009398: LDA #$04                                   ;$009398   | 
CODE_00939A: STA $7782,x                                ;$00939A   | 
CODE_00939D: REP #$20                                   ;$00939D   | 
CODE_00939F: RTS                                        ;$00939F   | 

DATA_0093A0:          db $04, $03, $02, $01

CODE_0093A4: JSR CODE_008AE5                            ;$0093A4   | 
CODE_0093A7: LDA $7782,x                                ;$0093A7   | 
CODE_0093AA: BNE CODE_0093C3                            ;$0093AA   | 
CODE_0093AC: DEC $7E4C,x                                ;$0093AC   | 
CODE_0093AF: BMI CODE_0093C3                            ;$0093AF   | 
CODE_0093B1: SEP #$20                                   ;$0093B1   | 
CODE_0093B3: LDY $7E4C,x                                ;$0093B3   | 
CODE_0093B6: LDA $93A0,y                                ;$0093B6   | 
CODE_0093B9: STA $73C2,x                                ;$0093B9   | 
CODE_0093BC: LDA #$04                                   ;$0093BC   | 
CODE_0093BE: STA $7782,x                                ;$0093BE   | 
CODE_0093C1: REP #$20                                   ;$0093C1   | 
CODE_0093C3: RTS                                        ;$0093C3   | 

DATA_0093C4:	     db $09, $08, $07, $06, $05, $04, $03, $02
DATA_0093CC:	     db $01, $00, $FF, $00, $FF, $03, $03, $03
DATA_0093D4:	     db $03, $03, $02, $02, $02, $01, $03, $01
DATA_0093DC:	     db $01, $01

CODE_0093DE: JSR CODE_008AF2                            ;$0093DE   | 
CODE_0093E1: LDA $7782,x                                ;$0093E1   | 
CODE_0093E4: BNE CODE_00940F                            ;$0093E4   | 
CODE_0093E6: DEC $7E4C,x                                ;$0093E6   | 
CODE_0093E9: BMI CODE_00940F                            ;$0093E9   | 
CODE_0093EB: SEP #$20                                   ;$0093EB   | 
CODE_0093ED: LDY $7E4C,x                                ;$0093ED   | 
CODE_0093F0: LDA $93C4,y                                ;$0093F0   | 
CODE_0093F3: BPL CODE_0093FF                            ;$0093F3   | 
CODE_0093F5: LDA $7E4E,x                                ;$0093F5   | 
CODE_0093F8: BPL CODE_0093FF                            ;$0093F8   | 
CODE_0093FA: STA $7462,x                                ;$0093FA   | 
CODE_0093FD: BRA CODE_009407                            ;$0093FD   | 

CODE_0093FF: STA $73C2,x                                ;$0093FF   | 
CODE_009402: LDA #$02                                   ;$009402   | 
CODE_009404: STA $7462,x                                ;$009404   | 
CODE_009407: LDA $93D1,y                                ;$009407   | 
CODE_00940A: STA $7782,x                                ;$00940A   | 
CODE_00940D: REP #$20                                   ;$00940D   | 
CODE_00940F: RTS                                        ;$00940F   | 

DATA_009410:	     db $02, $04, $06, $0A, $06, $04

CODE_009416: JSR CODE_008AE5                            ;$009416   | 
CODE_009419: LDA $7782,x                                ;$009419   | 
CODE_00941C: BNE CODE_009432                            ;$00941C   | 
CODE_00941E: DEC $73C2,x                                ;$00941E   | 
CODE_009421: BPL CODE_009426                            ;$009421   | 
CODE_009423: JMP CODE_008AF8                            ;$009423   | 

CODE_009426: LDY $73C2,x                                ;$009426   | 
CODE_009429: LDA $9410,y                                ;$009429   | 
CODE_00942C: AND #$00FF                                 ;$00942C   | 
CODE_00942F: STA $7782,x                                ;$00942F   | 
CODE_009432: RTS                                        ;$009432   | 

CODE_009433: LDA $7322,x                                ;$009433   | 
CODE_009436: BPL CODE_009446                            ;$009436   | 
CODE_009438: LDA $61CE                                  ;$009438   | 
CODE_00943B: BEQ CODE_009443                            ;$00943B   | 
CODE_00943D: LDA #$0006                                 ;$00943D   | 
CODE_009440: STA $7462,x                                ;$009440   | 
CODE_009443: JMP CODE_009503                            ;$009443   | 

CODE_009446: LDA $61CE                                  ;$009446   | 
CODE_009449: BEQ CODE_009474                            ;$009449   | 
CODE_00944B: LDA $70A2,x                                ;$00944B   | 
CODE_00944E: STA $3002                                  ;$00944E   | 
CODE_009451: LDA $7142,x                                ;$009451   | 
CODE_009454: STA $3004                                  ;$009454   | 
CODE_009457: LDA $7E8C,x                                ;$009457   | 
CODE_00945A: STA $3006                                  ;$00945A   | 
CODE_00945D: LDA $7322,x                                ;$00945D   | 
CODE_009460: STA $300A                                  ;$009460   | 
CODE_009463: LDA #$0004                                 ;$009463   | 
CODE_009466: STA $300E                                  ;$009466   | 
CODE_009469: PHX                                        ;$009469   | 
CODE_00946A: LDX #$09                                   ;$00946A   | 
CODE_00946C: LDA #$F5F4                                 ;$00946C   | 
CODE_00946F: JSL CODE_7EDE44                            ;$00946F   |  GSU init

CODE_009473: PLX                                        ;$009473   | 
CODE_009474: REP #$10                                   ;$009474   | 
CODE_009476: TAY                                        ;$009476   | 
CODE_009477: LDA $7E4E,x                                ;$009477   | 
CODE_00947A: BNE CODE_009485                            ;$00947A   | 
CODE_00947C: LDA #$0010                                 ;$00947C   | 
CODE_00947F: SEC                                        ;$00947F   | 
CODE_009480: SBC $7E4C,x                                ;$009480   | 
CODE_009483: BPL CODE_009488                            ;$009483   | 
CODE_009485: LDA #$0000                                 ;$009485   | 
CODE_009488: STA $00                                    ;$009488   | 
CODE_00948A: LDA $6000,y                                ;$00948A   | 
CODE_00948D: SEC                                        ;$00948D   | 
CODE_00948E: SBC $00                                    ;$00948E   | 
CODE_009490: STA $6000,y                                ;$009490   | 
CODE_009493: LDA $6002,y                                ;$009493   | 
CODE_009496: SEC                                        ;$009496   | 
CODE_009497: SBC $00                                    ;$009497   | 
CODE_009499: STA $6002,y                                ;$009499   | 
CODE_00949C: LDA $6008,y                                ;$00949C   | 
CODE_00949F: CLC                                        ;$00949F   | 
CODE_0094A0: ADC $00                                    ;$0094A0   | 
CODE_0094A2: STA $6008,y                                ;$0094A2   | 
CODE_0094A5: LDA $600A,y                                ;$0094A5   | 
CODE_0094A8: SEC                                        ;$0094A8   | 
CODE_0094A9: SBC $00                                    ;$0094A9   | 
CODE_0094AB: STA $600A,y                                ;$0094AB   | 
CODE_0094AE: LDA $6010,y                                ;$0094AE   | 
CODE_0094B1: SEC                                        ;$0094B1   | 
CODE_0094B2: SBC $00                                    ;$0094B2   | 
CODE_0094B4: STA $6010,y                                ;$0094B4   | 
CODE_0094B7: LDA $6012,y                                ;$0094B7   | 
CODE_0094BA: CLC                                        ;$0094BA   | 
CODE_0094BB: ADC $00                                    ;$0094BB   | 
CODE_0094BD: STA $6012,y                                ;$0094BD   | 
CODE_0094C0: LDA $6018,y                                ;$0094C0   | 
CODE_0094C3: CLC                                        ;$0094C3   | 
CODE_0094C4: ADC $00                                    ;$0094C4   | 
CODE_0094C6: STA $6018,y                                ;$0094C6   | 
CODE_0094C9: LDA $601A,y                                ;$0094C9   | 
CODE_0094CC: CLC                                        ;$0094CC   | 
CODE_0094CD: ADC $00                                    ;$0094CD   | 
CODE_0094CF: STA $601A,y                                ;$0094CF   | 
CODE_0094D2: BRA CODE_009501                            ;$0094D2   | 

CODE_0094D4: LDA #$0020                                 ;$0094D4   | 
CODE_0094D7: SEC                                        ;$0094D7   | 
CODE_0094D8: SBC $7E4C,x                                ;$0094D8   | 
CODE_0094DB: STA $00                                    ;$0094DB   | 
CODE_0094DD: LDA $6002,y                                ;$0094DD   | 
CODE_0094E0: CLC                                        ;$0094E0   | 
CODE_0094E1: ADC $00                                    ;$0094E1   | 
CODE_0094E3: STA $6002,y                                ;$0094E3   | 
CODE_0094E6: LDA $6008,y                                ;$0094E6   | 
CODE_0094E9: SEC                                        ;$0094E9   | 
CODE_0094EA: SBC $00                                    ;$0094EA   | 
CODE_0094EC: STA $6008,y                                ;$0094EC   | 
CODE_0094EF: LDA $6010,y                                ;$0094EF   | 
CODE_0094F2: CLC                                        ;$0094F2   | 
CODE_0094F3: ADC $00                                    ;$0094F3   | 
CODE_0094F5: STA $6010,y                                ;$0094F5   | 
CODE_0094F8: LDA $601A,y                                ;$0094F8   | 
CODE_0094FB: SEC                                        ;$0094FB   | 
CODE_0094FC: SBC $00                                    ;$0094FC   | 
CODE_0094FE: STA $601A,y                                ;$0094FE   | 
CODE_009501: SEP #$10                                   ;$009501   | 
CODE_009503: JSR CODE_008AF2                            ;$009503   | 
CODE_009506: LDA $7E4C,x                                ;$009506   | 
CODE_009509: CLC                                        ;$009509   | 
CODE_00950A: ADC #$0004                                 ;$00950A   | 
CODE_00950D: CMP #$0020                                 ;$00950D   | 
CODE_009510: BCC CODE_009515                            ;$009510   | 
CODE_009512: LDA #$0020                                 ;$009512   | 
CODE_009515: STA $7E4C,x                                ;$009515   | 
CODE_009518: RTS                                        ;$009518   | 

CODE_009519: JSR CODE_008AEC                            ;$009519   | 
CODE_00951C: RTS                                        ;$00951C   | 

CODE_00951D: JSR CODE_008AE5                            ;$00951D   | 
CODE_009520: LDA $7782,x                                ;$009520   | 
CODE_009523: BNE CODE_00952D                            ;$009523   | 
CODE_009525: INC $7782,x                                ;$009525   | 
CODE_009528: DEC $73C2,x                                ;$009528   | 
CODE_00952B: BMI CODE_00952E                            ;$00952B   | 
CODE_00952D: RTS                                        ;$00952D   | 

CODE_00952E: JMP CODE_008AF8                            ;$00952E   | 

CODE_009531: JSR CODE_008AE5                            ;$009531   | 
CODE_009534: LDA $7782,x                                ;$009534   | 
CODE_009537: BNE CODE_009544                            ;$009537   | 
CODE_009539: LDA #$0002                                 ;$009539   | 
CODE_00953C: STA $7782,x                                ;$00953C   | 
CODE_00953F: DEC $73C2,x                                ;$00953F   | 
CODE_009542: BMI CODE_009545                            ;$009542   | 
CODE_009544: RTS                                        ;$009544   | 

CODE_009545: JMP CODE_008AF8                            ;$009545   | 

CODE_009548: JSR CODE_008AE5                            ;$009548   | 
CODE_00954B: LDA $7782,x                                ;$00954B   | 
CODE_00954E: BNE CODE_00955B                            ;$00954E   | 
CODE_009550: LDA #$0003                                 ;$009550   | 
CODE_009553: STA $7782,x                                ;$009553   | 
CODE_009556: DEC $73C2,x                                ;$009556   | 
CODE_009559: BMI CODE_00955C                            ;$009559   | 
CODE_00955B: RTS                                        ;$00955B   | 

CODE_00955C: JMP CODE_008AF8                            ;$00955C   | 

CODE_00955F: JSR CODE_008AE5                            ;$00955F   | 
CODE_009562: LDA $7782,x                                ;$009562   | 
CODE_009565: BNE CODE_009572                            ;$009565   | 
CODE_009567: LDA #$0004                                 ;$009567   | 
CODE_00956A: STA $7782,x                                ;$00956A   | 
CODE_00956D: DEC $73C2,x                                ;$00956D   | 
CODE_009570: BMI CODE_009573                            ;$009570   | 
CODE_009572: RTS                                        ;$009572   | 

CODE_009573: JMP CODE_008AF8                            ;$009573   | 

CODE_009576: JSR CODE_008AE5                            ;$009576   | 
CODE_009579: LDA $7782,x                                ;$009579   | 
CODE_00957C: BNE CODE_009589                            ;$00957C   | 
CODE_00957E: LDA #$0006                                 ;$00957E   | 
CODE_009581: STA $7782,x                                ;$009581   | 
CODE_009584: DEC $73C2,x                                ;$009584   | 
CODE_009587: BMI CODE_00958A                            ;$009587   | 
CODE_009589: RTS                                        ;$009589   | 

CODE_00958A: JMP CODE_008AF8                            ;$00958A   | 

CODE_00958D: JSR CODE_008AE5                            ;$00958D   | 
CODE_009590: LDA $7782,x                                ;$009590   | 
CODE_009593: BNE CODE_0095A0                            ;$009593   | 
CODE_009595: LDA #$0008                                 ;$009595   | 
CODE_009598: STA $7782,x                                ;$009598   | 
CODE_00959B: DEC $73C2,x                                ;$00959B   | 
CODE_00959E: BMI CODE_0095A1                            ;$00959E   | 
CODE_0095A0: RTS                                        ;$0095A0   | 

CODE_0095A1: JMP CODE_008AF8                            ;$0095A1   | 

DATA_0095A4:          db $20, $00, $22, $00, $20, $80, $02, $40
DATA_0095AC:          db $00, $00, $02, $00, $20, $00, $22, $00
DATA_0095B4:          db $20, $80, $02, $80

DATA_0095B8:          db $00, $00, $00, $00, $00, $80, $00, $40
DATA_0095C0:          db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0095C8:          db $00, $80, $00, $80

CODE_0095CC: LDA $7322,x                                ;$0095CC   | 
CODE_0095CF: BMI CODE_0095F3                            ;$0095CF   | 
CODE_0095D1: LDY $7E4E,x                                ;$0095D1   | 
CODE_0095D4: LDA $95A4,y                                ;$0095D4   | 
CODE_0095D7: STA $00                                    ;$0095D7   | 
CODE_0095D9: LDA $95B8,y                                ;$0095D9   | 
CODE_0095DC: STA $02                                    ;$0095DC   | 
CODE_0095DE: REP #$10                                   ;$0095DE   | 
CODE_0095E0: LDY $7322,x                                ;$0095E0   | 
CODE_0095E3: LDA $6004,y                                ;$0095E3   | 
CODE_0095E6: ORA $00                                    ;$0095E6   | 
CODE_0095E8: EOR $02                                    ;$0095E8   | 
CODE_0095EA: CLC                                        ;$0095EA   | 
CODE_0095EB: ADC $7E8C,x                                ;$0095EB   | 
CODE_0095EE: STA $6004,y                                ;$0095EE   | 
CODE_0095F1: SEP #$10                                   ;$0095F1   | 
CODE_0095F3: JSR CODE_008AE5                            ;$0095F3   | 
CODE_0095F6: LDA $7E8E,x                                ;$0095F6   | 
CODE_0095F9: BNE CODE_009613                            ;$0095F9   | 
CODE_0095FB: LDA $78C0,x                                ;$0095FB   | 
CODE_0095FE: STA $7E8E,x                                ;$0095FE   | 
CODE_009601: LDA $7E4E,x                                ;$009601   | 
CODE_009604: CLC                                        ;$009604   | 
CODE_009605: ADC #$0002                                 ;$009605   | 
CODE_009608: STA $7E4E,x                                ;$009608   | 
CODE_00960B: CMP #$0014                                 ;$00960B   | 
CODE_00960E: BMI CODE_009613                            ;$00960E   | 
CODE_009610: STZ $7E4E,x                                ;$009610   | 
CODE_009613: RTS                                        ;$009613   | 

DATA_009614:          db $04, $03, $02, $01, $00, $00, $00

CODE_00961B: JSR CODE_008AE5                            ;$00961B   | 
CODE_00961E: LDA $7782,x                                ;$00961E   | 
CODE_009621: BNE CODE_00963A                            ;$009621   | 
CODE_009623: DEC $7E4C,x                                ;$009623   | 
CODE_009626: BMI CODE_00963A                            ;$009626   | 
CODE_009628: SEP #$20                                   ;$009628   | 
CODE_00962A: LDY $7E4C,x                                ;$00962A   | 
CODE_00962D: LDA $9614,y                                ;$00962D   | 
CODE_009630: STA $73C2,x                                ;$009630   | 
CODE_009633: LDA #$04                                   ;$009633   | 
CODE_009635: STA $7782,x                                ;$009635   | 
CODE_009638: REP #$20                                   ;$009638   | 
CODE_00963A: RTS                                        ;$00963A   | 

DATA_00963B:          db $04, $04, $04, $04, $04, $04, $04, $03
DATA_009643:          db $03, $02, $02

CODE_009646: PHX                                        ;$009646   | 
CODE_009647: TXA                                        ;$009647   | 
CODE_009648: AND #$00FF                                 ;$009648   | 
CODE_00964B: STA $3014                                  ;$00964B   |  r10
CODE_00964E: LDA #$0000                                 ;$00964E   | 
CODE_009651: STA $3000                                  ;$009651   | 
CODE_009654: LDA #$9693                                 ;$009654   | 
CODE_009657: STA $301C                                  ;$009657   |  r14
CODE_00965A: LDX #$09                                   ;$00965A   | 
CODE_00965C: LDA #$8CB1                                 ;$00965C   | 
CODE_00965F: JSL CODE_7EDE44                            ;$00965F   |  GSU init

CODE_009663: PLX                                        ;$009663   | 
CODE_009664: JSR CODE_008AE5                            ;$009664   | 
CODE_009667: LDA $7782,x                                ;$009667   | 
CODE_00966A: BNE CODE_009687                            ;$00966A   | 
CODE_00966C: DEC $73C2,x                                ;$00966C   | 
CODE_00966F: BPL CODE_009674                            ;$00966F   | 
CODE_009671: JMP CODE_008AF8                            ;$009671   | 

CODE_009674: SEP #$20                                   ;$009674   | 
CODE_009676: LDY $73C2,x                                ;$009676   | 
CODE_009679: LDA $9688,y                                ;$009679   | 
CODE_00967C: STA $7001,x                                ;$00967C   | 
CODE_00967F: LDA $963B,y                                ;$00967F   | 
CODE_009682: STA $7782,x                                ;$009682   | 
CODE_009685: REP #$20                                   ;$009685   | 
CODE_009687: RTS                                        ;$009687   | 

DATA_009688:         db $08, $10, $18, $28, $38, $58, $58, $58
DATA_009690:         db $58, $58, $68

; gsu table
DATA_009693:         dw $9868, $985E, $984F, $9836
DATA_00969B:         dw $9813, $97DC, $97A5, $976E
DATA_0096A3:         dw $9737, $9700, $96BF, $96AB

DATA_0096AB:         db $08, $08, $6A, $C6, $02, $F8, $08, $6A
DATA_0096B3:         db $86, $02, $08, $F8, $6A, $46, $02, $F8
DATA_0096BB:         db $F8, $6A, $06, $02

DATA_0096BF:         db $04, $FC, $45, $06, $00, $00, $08, $55
DATA_0096C7:         db $06, $00, $04, $04, $42, $C2, $02, $FC
DATA_0096CF:         db $04, $42, $82, $02, $04, $FC, $42, $42
DATA_0096D7:         db $02, $FC, $FC, $42, $02, $02, $0F, $0D
DATA_0096DF:         db $4C, $06, $00, $00, $0F, $4C, $46, $00
DATA_0096E7:         db $F7, $06, $4C, $06, $00, $12, $03, $4C
DATA_0096EF:         db $46, $00, $09, $F9, $4C, $46, $00, $FE
DATA_0096F7:         db $FB, $4C, $46, $00, $04, $06, $4C, $06
DATA_0096FF:         db $00

DATA_009700:         db $04, $FC, $54, $06, $00, $10, $10, $55
DATA_009708:         db $06, $00, $00, $08, $45, $06, $00, $00
DATA_009710:         db $08, $55, $06, $00, $10, $12, $4C, $06
DATA_009718:         db $00, $FF, $14, $4C, $46, $00, $F6, $09
DATA_009720:         db $4C, $06, $00, $13, $06, $4C, $46, $00
DATA_009728:         db $0A, $FC, $4C, $46, $00, $FD, $FE, $4C
DATA_009730:         db $46, $00, $04, $09, $4C, $06, $00

DATA_009737:         db $04, $FC, $44, $06, $00, $F8, $10, $55
DATA_00973F:         db $06, $00, $00, $08, $54, $06, $00, $10
DATA_009747:         db $10, $45, $06, $00, $11, $16, $4C, $06
DATA_00974F:         db $00, $FE, $18, $4C, $46, $00, $F5, $0D
DATA_009757:         db $4C, $06, $00, $14, $0A, $4C, $46, $00
DATA_00975F:         db $0B, $00, $4C, $06, $00, $FC, $02, $4C
DATA_009767:         db $46, $00, $04, $0D, $4C, $06, $00

DATA_00976E:         db $00, $18, $55, $06, $00, $00, $08, $44
DATA_009776:         db $06, $00, $10, $10, $54, $06, $00, $F8
DATA_00977E:         db $10, $45, $06, $00, $12, $1A, $4C, $06
DATA_009786:         db $00, $FD, $1C, $4D, $46, $00, $F5, $11
DATA_00978E:         db $4C, $06, $00, $15, $0E, $4D, $46, $00
DATA_009796:         db $0C, $04, $4D, $06, $00, $FB, $06, $4D
DATA_00979E:         db $46, $00, $04, $11, $4C, $06, $00

DATA_0097A5:         db $08, $08, $55, $06, $00, $10, $10, $44
DATA_0097AD:         db $06, $00, $F8, $10, $54, $06, $00, $00
DATA_0097B5:         db $18, $45, $06, $00, $12, $1E, $4D, $06
DATA_0097BD:         db $00, $FD, $20, $4E, $46, $00, $F4, $15
DATA_0097C5:         db $4D, $06, $00, $15, $12, $4E, $46, $00
DATA_0097CD:         db $0C, $08, $4E, $06, $00, $FB, $0A, $4E
DATA_0097D5:         db $46, $00, $04, $15, $4C, $06, $00

DATA_0097DC:         db $10, $20, $55, $06, $00, $F8, $10, $44
DATA_0097E4:         db $06, $00, $00, $18, $54, $06, $00, $08
DATA_0097EC:         db $08, $45, $06, $00, $12, $23, $4E, $46
DATA_0097F4:         db $00, $FD, $25, $4F, $46, $00, $F4, $1A
DATA_0097FC:         db $4E, $06, $00, $15, $17, $4F, $46, $00
DATA_009804:         db $0C, $0D, $4F, $06, $00, $FB, $0F, $4F
DATA_00980C:         db $46, $00, $04, $1A, $4D, $06, $00

DATA_009813:         db $12, $27, $4F, $46, $00, $F4, $1F, $4F
DATA_00981B:         db $06, $00, $04, $1F, $4E, $06, $00, $FC
DATA_009823:         db $28, $55, $06, $00, $00, $18, $44, $06
DATA_00982B:         db $00, $08, $08, $54, $06, $00, $10, $20
DATA_009833:         db $45, $06, $00

DATA_009836:         db $04, $24, $4F, $06, $00, $08, $30, $55
DATA_00983E:         db $06, $00, $FC, $28, $45, $06, $00, $10
DATA_009846:         db $20, $54, $06, $00, $08, $08, $44, $06
DATA_00984E:         db $00

DATA_00984F:         db $08, $30, $45, $06, $00, $FC, $28, $54
DATA_009857:         db $06, $00, $10, $20, $44, $06, $00

DATA_00985E:         db $08, $30, $54, $06, $00, $FC, $28, $44
DATA_009866:         db $06, $00

DATA_009868:         db $08, $30, $44, $06, $00

CODE_00986D: JSR CODE_008AE5                            ;$00986D   | 
CODE_009870: LDA $7782,x                                ;$009870   | 
CODE_009873: BNE CODE_009883                            ;$009873   | 
CODE_009875: DEC $7E4E,x                                ;$009875   | 
CODE_009878: BMI CODE_009883                            ;$009878   | 
CODE_00987A: INC $73C2,x                                ;$00987A   | 
CODE_00987D: LDA $7E4C,x                                ;$00987D   | 
CODE_009880: STA $7782,x                                ;$009880   | 
CODE_009883: RTS                                        ;$009883   | 

DATA_009884:          dw $002C, $003C, $0050, $0064
DATA_00988C:          dw $0068, $000C, $000C, $0014
DATA_009894:          dw $0018, $001C, $0004, $0004
DATA_00989C:          dw $0004, $0005, $0006, $0000
DATA_0098A4:          dw $0001, $0002, $0001, $0003

CODE_0098AC: PHX                                        ;$0098AC   | 
CODE_0098AD: LDA $78C0,x                                ;$0098AD   | 
CODE_0098B0: STA $3002                                  ;$0098B0   |  r1
CODE_0098B3: LDA $78C2,x                                ;$0098B3   | 
CODE_0098B6: STA $3004                                  ;$0098B6   |  r2
CODE_0098B9: LDA $7322,x                                ;$0098B9   | 
CODE_0098BC: STA $3006                                  ;$0098BC   |  r3
CODE_0098BF: LDA $7E8C,x                                ;$0098BF   | 
CODE_0098C2: STA $3008                                  ;$0098C2   |  r4
CODE_0098C5: LDA $70A2,x                                ;$0098C5   | 
CODE_0098C8: STA $300A                                  ;$0098C8   |  r5
CODE_0098CB: LDA $7142,x                                ;$0098CB   | 
CODE_0098CE: STA $300C                                  ;$0098CE   |  r6
CODE_0098D1: LDX #$08                                   ;$0098D1   | 
CODE_0098D3: LDA #$9287                                 ;$0098D3   | 
CODE_0098D6: JSL CODE_7EDE44                            ;$0098D6   |  GSU init

CODE_0098DA: PLX                                        ;$0098DA   | 
CODE_0098DB: JSR CODE_008AE5                            ;$0098DB   | 
CODE_0098DE: LDA $7E8E,x                                ;$0098DE   | 
CODE_0098E1: BNE CODE_00990F                            ;$0098E1   | 
CODE_0098E3: INC $7E4C,x                                ;$0098E3   | 
CODE_0098E6: LDA $7E4C,x                                ;$0098E6   | 
CODE_0098E9: ASL A                                      ;$0098E9   | 
CODE_0098EA: TAY                                        ;$0098EA   | 
CODE_0098EB: CPY #$0A                                   ;$0098EB   | 
CODE_0098ED: BNE CODE_0098F4                            ;$0098ED   | 
CODE_0098EF: LDA #$0000                                 ;$0098EF   | 
CODE_0098F2: BRA CODE_00990F                            ;$0098F2   | 

CODE_0098F4: LDA $9884,y                                ;$0098F4   | 
CODE_0098F7: STA $78C0,x                                ;$0098F7   | 
CODE_0098FA: LDA $988E,y                                ;$0098FA   | 
CODE_0098FD: STA $78C2,x                                ;$0098FD   | 
CODE_009900: LDA $9898,y                                ;$009900   | 
CODE_009903: STA $7E8E,x                                ;$009903   | 
CODE_009906: LDA $98A2,y                                ;$009906   | 
CODE_009909: STA $73C2,x                                ;$009909   | 
CODE_00990C: LDA #$0003                                 ;$00990C   | 
CODE_00990F: STA $7782,x                                ;$00990F   | 
CODE_009912: RTS                                        ;$009912   | 

CODE_009913: JSR CODE_008AE5                            ;$009913   | 
CODE_009916: LDA #$0001                                 ;$009916   | 
CODE_009919: STA $7782,x                                ;$009919   | 
CODE_00991C: DEC $7E4C,x                                ;$00991C   | 
CODE_00991F: LDA $7E4C,x                                ;$00991F   | 
CODE_009922: BPL CODE_009953                            ;$009922   | 
CODE_009924: LDA #$0001                                 ;$009924   | 
CODE_009927: STA $7E4C,x                                ;$009927   | 
CODE_00992A: INC $7E4E,x                                ;$00992A   | 
CODE_00992D: LDA $7E4E,x                                ;$00992D   | 
CODE_009930: CMP #$000F                                 ;$009930   | 
CODE_009933: BCC CODE_009953                            ;$009933   | 
CODE_009935: LDA #$000E                                 ;$009935   | 
CODE_009938: STA $7E4E,x                                ;$009938   | 
CODE_00993B: LDA $7462,x                                ;$00993B   | 
CODE_00993E: AND #$00FF                                 ;$00993E   | 
CODE_009941: CMP #$00FF                                 ;$009941   | 
CODE_009944: BEQ CODE_009953                            ;$009944   | 
CODE_009946: PHX                                        ;$009946   | 
CODE_009947: PHY                                        ;$009947   | 
CODE_009948: JSR CODE_00995F                            ;$009948   | 
CODE_00994B: PLY                                        ;$00994B   | 
CODE_00994C: PLX                                        ;$00994C   | 
CODE_00994D: LDA #$00FF                                 ;$00994D   | 
CODE_009950: STA $7462,x                                ;$009950   | 
CODE_009953: LDA $7E4E,x                                ;$009953   | 
CODE_009956: ASL A                                      ;$009956   | 
CODE_009957: TAY                                        ;$009957   | 
CODE_009958: LDA $997A,y                                ;$009958   | 
CODE_00995B: STA $73C2,x                                ;$00995B   | 
CODE_00995E: RTS                                        ;$00995E   | 

CODE_00995F: LDA #$022D                                 ;$00995F   | 
CODE_009962: JSL CODE_008B21                            ;$009962   | 
CODE_009966: LDA $70A2,x                                ;$009966   | 
CODE_009969: STA $70A2,y                                ;$009969   | 
CODE_00996C: LDA $7142,x                                ;$00996C   | 
CODE_00996F: STA $7142,y                                ;$00996F   | 
CODE_009972: PHX                                        ;$009972   | 
CODE_009973: TYX                                        ;$009973   | 
CODE_009974: JSL CODE_009A96                            ;$009974   | 
CODE_009978: PLX                                        ;$009978   | 
CODE_009979: RTS                                        ;$009979   | 

DATA_00997A:          dw $0000, $0001, $0002, $0003
DATA_009982:          dw $0004, $0005, $0006, $0007
DATA_00998A:          dw $0008, $0009, $000A, $000B
DATA_009992:          dw $000C, $000E, $000D

CODE_009998: JSR CODE_008AE5                            ;$009998   | 
CODE_00999B: LDA #$0002                                 ;$00999B   | 
CODE_00999E: STA $7782,x                                ;$00999E   | 
CODE_0099A1: DEC $7E4C,x                                ;$0099A1   | 
CODE_0099A4: LDA $7E4C,x                                ;$0099A4   | 
CODE_0099A7: BPL CODE_0099B8                            ;$0099A7   | 
CODE_0099A9: LDY $7E4E,x                                ;$0099A9   | 
CODE_0099AC: LDA $9A10,y                                ;$0099AC   | 
CODE_0099AF: AND #$00FF                                 ;$0099AF   | 
CODE_0099B2: STA $7E4C,x                                ;$0099B2   | 
CODE_0099B5: INC $7E4E,x                                ;$0099B5   | 
CODE_0099B8: LDA $7E4E,x                                ;$0099B8   | 
CODE_0099BB: AND #$0003                                 ;$0099BB   | 
CODE_0099BE: ASL A                                      ;$0099BE   | 
CODE_0099BF: TAY                                        ;$0099BF   | 
CODE_0099C0: LDA $9A08,y                                ;$0099C0   | 
CODE_0099C3: STA $73C2,x                                ;$0099C3   | 
CODE_0099C6: LDA $71E2,x                                ;$0099C6   | 
CODE_0099C9: BMI CODE_009A07                            ;$0099C9   | 
CODE_0099CB: CMP #$0280                                 ;$0099CB   | 
CODE_0099CE: BCC CODE_0099D7                            ;$0099CE   | 
CODE_0099D0: LDA #$0000                                 ;$0099D0   | 
CODE_0099D3: STA $7782,x                                ;$0099D3   | 
CODE_0099D6: RTS                                        ;$0099D6   | 

CODE_0099D7: LDA $7E8C,x                                ;$0099D7   | 
CODE_0099DA: BNE CODE_009A07                            ;$0099DA   | 
CODE_0099DC: INC $7E8C,x                                ;$0099DC   | 
CODE_0099DF: LDA #$022E                                 ;$0099DF   | 
CODE_0099E2: JSL CODE_008B21                            ;$0099E2   | 
CODE_0099E6: LDA $70A2,x                                ;$0099E6   | 
CODE_0099E9: CLC                                        ;$0099E9   | 
CODE_0099EA: ADC #$FFD8                                 ;$0099EA   | 
CODE_0099ED: STA $70A2,y                                ;$0099ED   | 
CODE_0099F0: LDA $7142,x                                ;$0099F0   | 
CODE_0099F3: CLC                                        ;$0099F3   | 
CODE_0099F4: ADC #$0000                                 ;$0099F4   | 
CODE_0099F7: STA $7142,y                                ;$0099F7   | 
CODE_0099FA: LDA #$0003                                 ;$0099FA   | 
CODE_0099FD: STA $7782,y                                ;$0099FD   | 
CODE_009A00: PHX                                        ;$009A00   | 
CODE_009A01: TYX                                        ;$009A01   | 
CODE_009A02: JSL CODE_009ABF                            ;$009A02   | 
CODE_009A06: PLX                                        ;$009A06   | 
CODE_009A07: RTS                                        ;$009A07   | 

DATA_009A08:          db $00, $00, $01, $00, $02, $00, $01, $00
DATA_009A10:          db $02, $03, $03, $03, $03, $20, $03, $03
DATA_009A18:          db $03

CODE_009A19: JSR CODE_008AE5                            ;$009A19   | 
CODE_009A1C: LDA #$0002                                 ;$009A1C   | 
CODE_009A1F: STA $7782,x                                ;$009A1F   | 
CODE_009A22: PHX                                        ;$009A22   | 
CODE_009A23: DEC $7E4C,x                                ;$009A23   | 
CODE_009A26: LDA $7E4C,x                                ;$009A26   | 
CODE_009A29: BPL CODE_009A49                            ;$009A29   | 
CODE_009A2B: LDA $7E4E,x                                ;$009A2B   | 
CODE_009A2E: AND #$0001                                 ;$009A2E   | 
CODE_009A31: CLC                                        ;$009A31   | 
CODE_009A32: ADC #$0000                                 ;$009A32   | 
CODE_009A35: STA $7E4C,x                                ;$009A35   | 
CODE_009A38: INC $7E4E,x                                ;$009A38   | 
CODE_009A3B: LDA $7E4E,x                                ;$009A3B   | 
CODE_009A3E: CMP #$000C                                 ;$009A3E   | 
CODE_009A41: BCC CODE_009A49                            ;$009A41   | 
CODE_009A43: LDA #$0004                                 ;$009A43   | 
CODE_009A46: STA $7E4E,x                                ;$009A46   | 
CODE_009A49: LDA $7E4E,x                                ;$009A49   | 
CODE_009A4C: STA $73C2,x                                ;$009A4C   | 
CODE_009A4F: LDA $7E8E,x                                ;$009A4F   | 
CODE_009A52: BNE CODE_009A61                            ;$009A52   | 
CODE_009A54: PHD                                        ;$009A54   | 
CODE_009A55: LDA #$0000                                 ;$009A55   | 
CODE_009A58: PHA                                        ;$009A58   | 
CODE_009A59: PLD                                        ;$009A59   | 
CODE_009A5A: JSL CODE_1191B8                            ;$009A5A   | 
CODE_009A5E: REP #$20                                   ;$009A5E   | 
CODE_009A60: PLD                                        ;$009A60   | 
CODE_009A61: PLX                                        ;$009A61   | 
CODE_009A62: STX $7E4A                                  ;$009A62   | 
CODE_009A65: RTS                                        ;$009A65   | 

CODE_009A66: JSR CODE_008AE5                            ;$009A66   | 
CODE_009A69: LDA #$0002                                 ;$009A69   | 
CODE_009A6C: STA $7782,x                                ;$009A6C   | 
CODE_009A6F: DEC $7E4C,x                                ;$009A6F   | 
CODE_009A72: LDA $7E4C,x                                ;$009A72   | 
CODE_009A75: BPL CODE_009A8F                            ;$009A75   | 
CODE_009A77: LDA #$0003                                 ;$009A77   | 
CODE_009A7A: STA $7E4C,x                                ;$009A7A   | 
CODE_009A7D: INC $7E4E,x                                ;$009A7D   | 
CODE_009A80: LDA $7E4E,x                                ;$009A80   | 
CODE_009A83: CMP #$0008                                 ;$009A83   | 
CODE_009A86: BCC CODE_009A8F                            ;$009A86   | 
CODE_009A88: LDA #$0000                                 ;$009A88   | 
CODE_009A8B: STA $7782,x                                ;$009A8B   | 
CODE_009A8E: RTS                                        ;$009A8E   | 

CODE_009A8F: LDA $7E4E,x                                ;$009A8F   | 
CODE_009A92: STA $73C2,x                                ;$009A92   | 
CODE_009A95: RTS                                        ;$009A95   | 

CODE_009A96: LDA #$0002                                 ;$009A96   | 
CODE_009A99: STA $7782,x                                ;$009A99   | 
CODE_009A9C: LDA #$0003                                 ;$009A9C   | 
CODE_009A9F: STA $7E4C,x                                ;$009A9F   | 
CODE_009AA2: STZ $7E4E,x                                ;$009AA2   | 
CODE_009AA5: STZ $7502,x                                ;$009AA5   | 
CODE_009AA8: LDA #$0000                                 ;$009AA8   | 
CODE_009AAB: STA $7462,x                                ;$009AAB   | 
CODE_009AAE: LDA #$0040                                 ;$009AAE   | 
CODE_009AB1: STA $7E8E,x                                ;$009AB1   | 
CODE_009AB4: LDA #$0008                                 ;$009AB4   | \ play sound #$0008
CODE_009AB7: JSL CODE_0085D2                            ;$009AB7   | /
CODE_009ABB: STX $7E4A                                  ;$009ABB   | 
CODE_009ABE: RTL                                        ;$009ABE   | 

CODE_009ABF: LDA #$0003                                 ;$009ABF   | 
CODE_009AC2: STA $7782,x                                ;$009AC2   | 
CODE_009AC5: STZ $7E4E,x                                ;$009AC5   | 
CODE_009AC8: STZ $7502,x                                ;$009AC8   | 
CODE_009ACB: LDA #$0000                                 ;$009ACB   | 
CODE_009ACE: STA $7462,x                                ;$009ACE   | 
CODE_009AD1: LDA #$003F                                 ;$009AD1   | \ play sound #$003F
CODE_009AD4: JSL CODE_0085D2                            ;$009AD4   | /
CODE_009AD8: RTL                                        ;$009AD8   | 

DATA_009AD9:          db $40, $00, $C0, $FF, $20, $F2, $8A, $BD
DATA_009AE1:          db $8E, $7E, $D0, $03

CODE_009AE5: JMP CODE_008AF8                            ;$009AE5   | 

CODE_009AE8: CMP #$0040                                 ;$009AE8   | 
CODE_009AEB: BPL CODE_009AFA                            ;$009AEB   | 
CODE_009AED: LDY #$FF                                   ;$009AED   | 
CODE_009AEF: AND #$0001                                 ;$009AEF   | 
CODE_009AF2: BEQ CODE_009AF6                            ;$009AF2   | 
CODE_009AF4: LDY #$01                                   ;$009AF4   | 
CODE_009AF6: TYA                                        ;$009AF6   | 
CODE_009AF7: STA $7462,x                                ;$009AF7   | 
CODE_009AFA: LDA $7E8E,x                                ;$009AFA   | 
CODE_009AFD: AND #$003F                                 ;$009AFD   | 
CODE_009B00: BNE CODE_009B12                            ;$009B00   | 
CODE_009B02: LDA $73C0,x                                ;$009B02   | 
CODE_009B05: EOR #$0002                                 ;$009B05   | 
CODE_009B08: STA $73C0,x                                ;$009B08   | 
CODE_009B0B: TAY                                        ;$009B0B   | 
CODE_009B0C: LDA $9AD9,y                                ;$009B0C   | 
CODE_009B0F: STA $71E0,x                                ;$009B0F   | 
CODE_009B12: RTS                                        ;$009B12   | 

CODE_009B13: JSR CODE_008AE5                            ;$009B13   | 
CODE_009B16: LDY $7462,x                                ;$009B16   | 
CODE_009B19: CPY #$FF                                   ;$009B19   | 
CODE_009B1B: BNE CODE_009B25                            ;$009B1B   | 
CODE_009B1D: LDA #$0001                                 ;$009B1D   | 
CODE_009B20: STA $7462,x                                ;$009B20   | 
CODE_009B23: BRA CODE_009B52                            ;$009B23   | 

CODE_009B25: LDA $7E8C,x                                ;$009B25   | 
CODE_009B28: CLC                                        ;$009B28   | 
CODE_009B29: ADC $7E4E,x                                ;$009B29   | 
CODE_009B2C: STA $7E8C,x                                ;$009B2C   | 
CODE_009B2F: BIT #$FF00                                 ;$009B2F   | 
CODE_009B32: BEQ CODE_009B40                            ;$009B32   | 
CODE_009B34: AND #$00FF                                 ;$009B34   | 
CODE_009B37: STA $7E8C,x                                ;$009B37   | 
CODE_009B3A: LDA #$00FF                                 ;$009B3A   | 
CODE_009B3D: STA $7462,x                                ;$009B3D   | 
CODE_009B40: LDA $7E4E,x                                ;$009B40   | 
CODE_009B43: CLC                                        ;$009B43   | 
CODE_009B44: ADC #$0004                                 ;$009B44   | 
CODE_009B47: CMP #$0100                                 ;$009B47   | 
CODE_009B4A: BMI CODE_009B4F                            ;$009B4A   | 
CODE_009B4C: LDA #$0100                                 ;$009B4C   | 
CODE_009B4F: STA $7E4E,x                                ;$009B4F   | 
CODE_009B52: RTS                                        ;$009B52   | 

DATA_009B53:         db $0C, $10, $20, $E5, $8A, $BD, $82, $77
DATA_009B5B:         db $D0, $14, $DE, $C2, $73, $10, $03

CODE_009B62: JMP CODE_008AF8                            ;$009B62   | 

CODE_009B65: LDY $73C2,x                                ;$009B65   | 
CODE_009B68: LDA $9B53,y                                ;$009B68   | 
CODE_009B6B: AND #$00FF                                 ;$009B6B   | 
CODE_009B6E: STA $7782,x                                ;$009B6E   | 
CODE_009B71: RTS                                        ;$009B71   | 

DATA_009B72:         db $03, $03, $03, $03, $03, $03, $03, $03
DATA_009B7A:         db $03, $02, $02, $02, $02, $02, $02, $02
DATA_009B82:         db $02, $02, $02, $02, $02, $02

CODE_009B88: JSR CODE_008AE5                            ;$009B88   | 
CODE_009B8B: SEP #$20                                   ;$009B8B   | 
CODE_009B8D: LDA $7782,x                                ;$009B8D   | 
CODE_009B90: BEQ CODE_009BA1                            ;$009B90   | 
CODE_009B92: LDY $73C2,x                                ;$009B92   | 
CODE_009B95: CPY #$16                                   ;$009B95   | 
CODE_009B97: BNE CODE_009BB4                            ;$009B97   | 
CODE_009B99: CMP #$02                                   ;$009B99   | 
CODE_009B9B: BCS CODE_009BB4                            ;$009B9B   | 
CODE_009B9D: LDA #$FF                                   ;$009B9D   | 
CODE_009B9F: BRA CODE_009BB6                            ;$009B9F   | 

CODE_009BA1: DEC $73C2,x                                ;$009BA1   | 
CODE_009BA4: BPL CODE_009BAB                            ;$009BA4   | 
CODE_009BA6: REP #$20                                   ;$009BA6   | 
CODE_009BA8: JMP CODE_008AF8                            ;$009BA8   | 

CODE_009BAB: LDY $73C2,x                                ;$009BAB   | 
CODE_009BAE: LDA $9B72,y                                ;$009BAE   | 
CODE_009BB1: STA $7782,x                                ;$009BB1   | 
CODE_009BB4: LDA #$05                                   ;$009BB4   | 
CODE_009BB6: STA $7462,x                                ;$009BB6   | 
CODE_009BB9: REP #$20                                   ;$009BB9   | 
CODE_009BBB: RTS                                        ;$009BBB   | 

CODE_009BBC: JSR CODE_008AE5                            ;$009BBC   | 
CODE_009BBF: LDA $7782,x                                ;$009BBF   | 
CODE_009BC2: BNE CODE_009BC7                            ;$009BC2   | 
CODE_009BC4: JMP CODE_008AF8                            ;$009BC4   | 

CODE_009BC7: LDA $7E8E,x                                ;$009BC7   | 
CODE_009BCA: BNE CODE_009BDD                            ;$009BCA   | 
CODE_009BCC: LDA #$0004                                 ;$009BCC   | 
CODE_009BCF: STA $7E8E,x                                ;$009BCF   | 
CODE_009BD2: DEC $73C2,x                                ;$009BD2   | 
CODE_009BD5: BPL CODE_009BDD                            ;$009BD5   | 
CODE_009BD7: LDA #$0005                                 ;$009BD7   | 
CODE_009BDA: STA $73C2,x                                ;$009BDA   | 
CODE_009BDD: RTS                                        ;$009BDD   | 

DATA_009BDE:         db $08, $06, $04, $02, $02

CODE_009BE3: JSR CODE_008AE5                            ;$009BE3   | 
CODE_009BE6: LDA $7782,x                                ;$009BE6   | 
CODE_009BE9: BNE CODE_009C10                            ;$009BE9   | 
CODE_009BEB: DEC $7E4C,x                                ;$009BEB   | 
CODE_009BEE: BPL CODE_009BF3                            ;$009BEE   | 
CODE_009BF0: JMP CODE_008AF8                            ;$009BF0   | 

CODE_009BF3: SEP #$20                                   ;$009BF3   | 
CODE_009BF5: DEC $73C2,x                                ;$009BF5   | 
CODE_009BF8: LDY $7E4C,x                                ;$009BF8   | 
CODE_009BFB: LDA $9BDE,y                                ;$009BFB   | 
CODE_009BFE: STA $7782,x                                ;$009BFE   | 
CODE_009C01: REP #$20                                   ;$009C01   | 
CODE_009C03: LDA #$0001                                 ;$009C03   | 
CODE_009C06: CPY #$03                                   ;$009C06   | 
CODE_009C08: BNE CODE_009C0D                            ;$009C08   | 
CODE_009C0A: LDA #$FFFF                                 ;$009C0A   | 
CODE_009C0D: STA $7462,x                                ;$009C0D   | 
CODE_009C10: RTS                                        ;$009C10   | 

DATA_009C11:         db $03, $03, $03, $03, $03, $03
DATA_009C17:         db $03, $02, $02, $02, $02, $02

CODE_009C1D: PHX                                        ;$009C1D   | 
CODE_009C1E: TXA                                        ;$009C1E   | 
CODE_009C1F: AND #$00FF                                 ;$009C1F   | 
CODE_009C22: STA $3014                                  ;$009C22   |  r10
CODE_009C25: LDA #$0000                                 ;$009C25   | 
CODE_009C28: STA $3000                                  ;$009C28   |  r0
CODE_009C2B: LDA #$9C6B                                 ;$009C2B   | 
CODE_009C2E: STA $301C                                  ;$009C2E   |  r14
CODE_009C31: LDX #$09                                   ;$009C31   | 
CODE_009C33: LDA #$8CB1                                 ;$009C33   | 
CODE_009C36: JSL CODE_7EDE44                            ;$009C36   |  GSU init

CODE_009C3A: PLX                                        ;$009C3A   | 
CODE_009C3B: JSR CODE_008AE5                            ;$009C3B   | 
CODE_009C3E: LDA $7782,x                                ;$009C3E   | 
CODE_009C41: BNE CODE_009C5E                            ;$009C41   | 
CODE_009C43: DEC $73C2,x                                ;$009C43   | 
CODE_009C46: BPL CODE_009C4B                            ;$009C46   | 
CODE_009C48: JMP CODE_008AF8                            ;$009C48   | 

CODE_009C4B: SEP #$20                                   ;$009C4B   | 
CODE_009C4D: LDY $73C2,x                                ;$009C4D   | 
CODE_009C50: LDA $9C5F,y                                ;$009C50   | 
CODE_009C53: STA $7001,x                                ;$009C53   | 
CODE_009C56: LDA $9C11,y                                ;$009C56   | 
CODE_009C59: STA $7782,x                                ;$009C59   | 
CODE_009C5C: REP #$20                                   ;$009C5C   | 
CODE_009C5E: RTS                                        ;$009C5E   | 

DATA_009C5F:         db $10, $10, $20, $38, $48, $58
DATA_009C65:         db $58, $50, $58, $50, $50, $48

; gsu table
DATA_009C6B:         dw $9E88, $9E7E, $9E6A, $9E47
DATA_009C73:         dw $9E1A, $9DE3, $9DAC, $9D7A
DATA_009C7B:         dw $9D43, $9D11, $9CDF, $9CB2
DATA_009C83:         dw $9C85

DATA_009C85:         db $03, $FE, $55, $06, $00, $09, $0B, $4C
DATA_009C8D:         db $04, $00, $09, $00, $4C, $04, $00, $FF
DATA_009C95:         db $01, $4C, $04, $00, $05, $07, $4C, $04
DATA_009C9D:         db $00, $0E, $07, $4C, $04, $00, $00, $0B
DATA_009CA5:         db $4C, $04, $00, $FE, $06, $4C, $04, $00
DATA_009CAD:         db $04, $FD, $4D, $04, $00

DATA_009CB2:         db $03, $FE, $55, $06, $00, $0A, $0D, $4C
DATA_009CBA:         db $04, $00, $0A, $FD, $4C, $04, $00, $FE
DATA_009CC2:         db $FE, $4C, $04, $00, $05, $08, $4C, $04
DATA_009CCA:         db $00, $10, $06, $4C, $04, $00, $FF, $0C
DATA_009CD2:         db $4D, $84, $00, $FC, $07, $4C, $04, $00
DATA_009CDA:         db $04, $FE, $4D, $04, $00

DATA_009CDF:         db $0C, $02, $55, $06, $00, $03, $FE, $45
DATA_009CE7:         db $06, $00, $0A, $0F, $4C, $04, $00, $09
DATA_009CEF:         db $FB, $4D, $44, $00, $FD, $FD, $4C, $04
DATA_009CF7:         db $00, $05, $09, $4C, $04, $00, $12, $06
DATA_009CFF:         db $4D, $04, $00, $FE, $0D, $4E, $84, $00
DATA_009D07:         db $FA, $08, $4C, $04, $00, $04, $FF, $4D
DATA_009D0F:         db $04, $00

DATA_009D11:         db $0C, $02, $55, $06, $00, $03, $FE, $54
DATA_009D19:         db $06, $00, $0B, $12, $4D, $44, $00, $0B
DATA_009D21:         db $FA, $4D, $44, $00, $FD, $FD, $4C, $04
DATA_009D29:         db $00, $05, $0B, $4C, $04, $00, $13, $06
DATA_009D31:         db $4D, $04, $00, $FE, $0F, $4E, $84, $00
DATA_009D39:         db $FA, $0A, $4D, $04, $00, $04, $01, $4E
DATA_009D41:         db $04, $00

DATA_009D43:         db $FC, $08, $55, $06, $00, $0C, $02, $45
DATA_009D4B:         db $06, $00, $03, $FE, $44, $06, $00, $0C
DATA_009D53:         db $15, $4D, $44, $00, $0C, $FA, $4D, $44
DATA_009D5B:         db $00, $FC, $FE, $4C, $04, $00, $05, $0D
DATA_009D63:         db $4C, $04, $00, $14, $07, $4D, $04, $00
DATA_009D6B:         db $FD, $11, $4F, $84, $00, $F9, $0C, $4D
DATA_009D73:         db $04, $00, $04, $03, $4E, $04, $00

DATA_009D7A:         db $FC, $08, $55, $06, $00, $0C, $02, $54
DATA_009D82:         db $06, $00, $0C, $19, $4E, $44, $00, $0C
DATA_009D8A:         db $FB, $4E, $44, $00, $FC, $FF, $4D, $44
DATA_009D92:         db $00, $05, $10, $4D, $44, $00, $15, $08
DATA_009D9A:         db $4D, $04, $00, $FD, $14, $4F, $84, $00
DATA_009DA2:         db $F9, $0F, $4D, $04, $00, $04, $06, $4E
DATA_009DAA:         db $04, $00

DATA_009DAC:         db $07, $16, $55, $06, $00, $FC, $08, $55
DATA_009DB4:         db $06, $00, $0C, $02, $44, $06, $00, $0D
DATA_009DBC:         db $1D, $4E, $44, $00, $0D, $FC, $4E, $44
DATA_009DC4:         db $00, $FB, $01, $4E, $44, $00, $05, $13
DATA_009DCC:         db $4E, $44, $00, $15, $09, $4E, $04, $00
DATA_009DD4:         db $FC, $17, $4F, $84, $00, $F8, $12, $4E
DATA_009DDC:         db $04, $00, $04, $09, $4F, $04, $00

DATA_009DE3:         db $07, $17, $55, $06, $00, $FC, $09, $55
DATA_009DEB:         db $06, $00, $0C, $03, $44, $06, $00, $0D
DATA_009DF3:         db $1F, $4F, $44, $00, $0D, $FE, $4F, $44
DATA_009DFB:         db $00, $FB, $03, $4E, $44, $00, $05, $15
DATA_009E03:         db $4E, $44, $00, $16, $0A, $4E, $04, $00
DATA_009E0B:         db $FC, $19, $4F, $84, $00, $F8, $14, $4E
DATA_009E13:         db $04, $00, $04, $0A, $4F, $04, $00

DATA_009E1A:         db $03, $20, $44, $06, $00, $07, $16, $45
DATA_009E22:         db $06, $00, $FC, $08, $54, $06, $00, $0D
DATA_009E2A:         db $22, $4F, $44, $00, $0E, $01, $4F, $44
DATA_009E32:         db $00, $FB, $05, $4F, $44, $00, $05, $19
DATA_009E3A:         db $4E, $44, $00, $17, $0D, $4E, $04, $00
DATA_009E42:         db $F7, $17, $4F, $04, $00

DATA_009E47:         db $17, $10, $4F, $04, $00, $03, $20, $54
DATA_009E4F:         db $06, $00, $07, $16, $54, $06, $00, $FC
DATA_009E57:         db $08, $44, $06, $00, $0E, $05, $4F, $44
DATA_009E5F:         db $00, $F7, $1A, $4F, $04, $00, $05, $1C
DATA_009E67:         db $4F, $44, $00

DATA_009E6A:         db $18, $12, $4F, $04, $00, $03, $20, $45
DATA_009E72:         db $06, $00, $07, $16, $44, $06, $00, $05
DATA_009E7A:         db $1F, $4F, $44, $00

DATA_009E7E:         db $03, $20, $54, $06, $00, $05, $22, $4F
DATA_009E86:         db $44, $00

DATA_009E88:         db $03, $20, $44, $06, $00, $05, $25, $4F
DATA_009E90:         db $44, $00, $DA

CODE_009E92: PHX                                        ;$009E92   | 
CODE_009E93: TXA                                        ;$009E93   | 
CODE_009E94: AND #$00FF                                 ;$009E94   | 
CODE_009E97: STA $3014                                  ;$009E97   |  r10
CODE_009E9A: LDA #$0000                                 ;$009E9A   | 
CODE_009E9D: STA $3000                                  ;$009E9D   |  r0
CODE_009EA0: LDA #$9EE0                                 ;$009EA0   | 
CODE_009EA3: STA $301C                                  ;$009EA3   |  r14
CODE_009EA6: LDX #$09                                   ;$009EA6   | 
CODE_009EA8: LDA #$8CB1                                 ;$009EA8   | 
CODE_009EAB: JSL CODE_7EDE44                            ;$009EAB   |  GSU init

CODE_009EAF: PLX                                        ;$009EAF   | 
CODE_009EB0: JSR CODE_008AE5                            ;$009EB0   | 
CODE_009EB3: LDA $7782,x                                ;$009EB3   | 
CODE_009EB6: BNE CODE_009ED2                            ;$009EB6   | 
CODE_009EB8: DEC $73C2,x                                ;$009EB8   | 
CODE_009EBB: BPL CODE_009EC0                            ;$009EBB   | 
CODE_009EBD: JMP CODE_008AF8                            ;$009EBD   | 

CODE_009EC0: SEP #$20                                   ;$009EC0   | 
CODE_009EC2: LDY $73C2,x                                ;$009EC2   | 
CODE_009EC5: LDA $9ED3,y                                ;$009EC5   | 
CODE_009EC8: STA $7001,x                                ;$009EC8   | 
CODE_009ECB: LDA #$02                                   ;$009ECB   | 
CODE_009ECD: STA $7782,x                                ;$009ECD   | 
CODE_009ED0: REP #$20                                   ;$009ED0   | 
CODE_009ED2: RTS                                        ;$009ED2   | 

DATA_009ED3:         db $10, $20, $30, $40, $50, $50, $48, $50
DATA_009EDB:         db $60, $58, $50, $60, $60

; gsu table
DATA_009EE0:         dw $A172, $A15E, $A140, $A118
DATA_009EE8:         dw $A0E6, $A0B4, $A087, $A055
DATA_009EF0:         dw $A019, $9FE2, $9FB0, $9F74
DATA_009EF8:         dw $9F38, $9EFC

DATA_009EFC:         db $07, $08, $42, $C2, $02, $F7, $08, $42
DATA_009F04:         db $82, $02, $07, $F8, $42, $42, $02, $F7
DATA_009F0C:         db $F8, $42, $02, $02, $09, $01, $86, $08
DATA_009F14:         db $02, $FF, $08, $86, $08, $02, $F5, $FE
DATA_009F1C:         db $86, $08, $02, $01, $F6, $86, $08, $02
DATA_009F24:         db $0C, $09, $86, $08, $02, $F5, $0A, $86
DATA_009F2C:         db $08, $02, $0B, $F4, $86, $08, $02, $F6
DATA_009F34:         db $F3, $86, $08, $02

DATA_009F38:         db $05, $05, $42, $C2, $02, $FD, $05, $42
DATA_009F40:         db $82, $02, $05, $FD, $42, $42, $02, $FD
DATA_009F48:         db $FD, $42, $02, $02, $11, $01, $86, $08
DATA_009F50:         db $02, $FF, $10, $86, $08, $02, $ED, $FE
DATA_009F58:         db $86, $08, $02, $01, $F2, $86, $08, $02
DATA_009F60:         db $10, $0D, $86, $08, $02, $F1, $0E, $86
DATA_009F68:         db $08, $02, $0D, $EE, $86, $08, $02, $F4
DATA_009F70:         db $ED, $86, $08, $02

DATA_009F74:         db $08, $08, $6A, $C6, $02, $F8, $08, $6A
DATA_009F7C:         db $86, $02, $08, $F8, $6A, $46, $02, $F8
DATA_009F84:         db $F8, $6A, $06, $02, $15, $03, $86, $08
DATA_009F8C:         db $02, $FF, $14, $86, $08, $02, $E9, $FF
DATA_009F94:         db $86, $08, $02, $01, $F0, $86, $08, $02
DATA_009F9C:         db $14, $0F, $86, $08, $02, $EF, $10, $86
DATA_009FA4:         db $08, $02, $0F, $EC, $86, $08, $02, $F2
DATA_009FAC:         db $EB, $86, $08, $02

DATA_009FB0:         db $08, $08, $E3, $06, $02, $F8, $00, $E3
DATA_009FB8:         db $06, $02, $19, $05, $86, $08, $02, $FF
DATA_009FC0:         db $1A, $86, $08, $02, $E5, $01, $86, $08
DATA_009FC8:         db $02, $01, $EE, $E3, $06, $02, $16, $12
DATA_009FD0:         db $86, $08, $02, $ED, $13, $86, $08, $02
DATA_009FD8:         db $11, $EA, $86, $08, $02, $F0, $E9, $86
DATA_009FE0:         db $08, $02

DATA_009FE2:         db $08, $F8, $E3, $06, $02, $08, $08, $E5
DATA_009FEA:         db $06, $02, $F8, $00, $E5, $06, $02, $1D
DATA_009FF2:         db $07, $86, $08, $02, $FF, $1E, $E3, $06
DATA_009FFA:         db $02, $E1, $03, $86, $08, $02, $01, $ED
DATA_00A002:         db $E5, $06, $02, $18, $16, $86, $08, $02
DATA_00A00A:         db $EB, $17, $86, $08, $02, $13, $E9, $86
DATA_00A012:         db $08, $02, $EE, $E8, $86, $08, $02

DATA_00A019:         db $00, $00, $E3, $06, $02, $08, $F8, $E5
DATA_00A021:         db $06, $02, $08, $08, $E5, $06, $02, $F8
DATA_00A029:         db $00, $E7, $06, $02, $21, $09, $86, $08
DATA_00A031:         db $02, $FF, $24, $E5, $06, $02, $DD, $05
DATA_00A039:         db $86, $08, $02, $01, $ED, $E7, $06, $02
DATA_00A041:         db $1A, $1A, $86, $08, $02, $E9, $1B, $86
DATA_00A049:         db $08, $02, $15, $E9, $86, $08, $02, $EC
DATA_00A051:         db $E8, $86, $08, $02

DATA_00A055:         db $00, $10, $E3, $06, $02, $00, $00, $E5
DATA_00A05D:         db $06, $02, $08, $F8, $E7, $06, $02, $24
DATA_00A065:         db $0C, $E3, $06, $02, $FF, $2A, $E7, $06
DATA_00A06D:         db $02, $DA, $08, $86, $08, $02, $1D, $20
DATA_00A075:         db $86, $08, $02, $E6, $21, $86, $08, $02
DATA_00A07D:         db $18, $EA, $86, $08, $02, $E9, $E9, $86
DATA_00A085:         db $08, $02

DATA_00A087:         db $F0, $08, $E3, $06, $02, $00, $10, $E5
DATA_00A08F:         db $06, $02, $00, $00, $E7, $06, $02, $26
DATA_00A097:         db $0F, $E5, $06, $02, $D8, $0B, $86, $08
DATA_00A09F:         db $02, $1F, $25, $86, $08, $02, $E4, $26
DATA_00A0A7:         db $86, $08, $02, $1A, $EC, $86, $08, $02
DATA_00A0AF:         db $E7, $EB, $E3, $06, $02

DATA_00A0B4:         db $E8, $18, $E3, $06, $02, $08, $20, $E3
DATA_00A0BC:         db $06, $02, $F0, $08, $E5, $06, $02, $00
DATA_00A0C4:         db $10, $E7, $06, $02, $28, $14, $E7, $06
DATA_00A0CC:         db $02, $D6, $10, $86, $08, $02, $21, $2C
DATA_00A0D4:         db $86, $08, $02, $E2, $2D, $E3, $06, $02
DATA_00A0DC:         db $1C, $EF, $86, $08, $02, $E5, $EE, $E5
DATA_00A0E4:         db $06, $02

DATA_00A0E6:         db $18, $10, $E3, $06, $02, $E8, $18, $E5
DATA_00A0EE:         db $06, $02, $08, $20, $E5, $06, $02, $F0
DATA_00A0F6:         db $08, $E7, $06, $02, $00, $10, $E7, $06
DATA_00A0FE:         db $02, $D5, $15, $86, $08, $02, $22, $32
DATA_00A106:         db $86, $08, $02, $E1, $33, $E5, $06, $02
DATA_00A10E:         db $1D, $F3, $E5, $06, $02, $E4, $F2, $E7
DATA_00A116:         db $06, $02

DATA_00A118:         db $00, $38, $E3, $06, $02, $18, $10, $E5
DATA_00A120:         db $06, $02, $E8, $18, $E7, $06, $02, $08
DATA_00A128:         db $20, $E7, $06, $02, $D3, $1B, $86, $08
DATA_00A130:         db $02, $24, $38, $E3, $06, $02, $E0, $39
DATA_00A138:         db $E7, $06, $02, $1F, $F9, $E5, $06, $02

DATA_00A140:         db $08, $10, $E3, $06, $02, $00, $38, $E5
DATA_00A148:         db $06, $02, $18, $10, $E7, $06, $02, $D3
DATA_00A150:         db $21, $E3, $06, $02, $24, $3E, $E5, $06
DATA_00A158:         db $02, $1F, $FF, $E7, $06, $02

DATA_00A15E:         db $08, $10, $E5, $06, $02, $00, $38, $E7
DATA_00A166:         db $06, $02, $D2, $27, $E5, $06, $02, $25
DATA_00A16E:         db $44, $E7, $06, $02

DATA_00A172:         db $08, $10, $E7, $06, $02, $D1, $2D, $E7
DATA_00A17A:         db $06, $02

DATA_00A17C:         db $04, $04, $04, $04, $04, $04, $04, $04
DATA_00A184:         db $04, $04, $04, $04, $04, $04, $04, $03
DATA_00A18C:         db $03, $03, $02, $02, $01, $01, $01

CODE_00A193: PHX                                        ;$00A193   | 
CODE_00A194: TXA                                        ;$00A194   | 
CODE_00A195: STA $3014                                  ;$00A195   |  r10
CODE_00A198: LDA #$0000                                 ;$00A198   | 
CODE_00A19B: STA $3000                                  ;$00A19B   |  r0
CODE_00A19E: LDA #$A1E9                                 ;$00A19E   | 
CODE_00A1A1: STA $301C                                  ;$00A1A1   |  r14
CODE_00A1A4: LDX #$09                                   ;$00A1A4   | 
CODE_00A1A6: LDA #$8CB1                                 ;$00A1A6   | 
CODE_00A1A9: JSL CODE_7EDE44                            ;$00A1A9   |  GSU init

CODE_00A1AD: PLX                                        ;$00A1AD   | 
CODE_00A1AE: JSR CODE_008AE5                            ;$00A1AE   | 
CODE_00A1B1: LDA $7782,x                                ;$00A1B1   | 
CODE_00A1B4: BNE CODE_00A1D1                            ;$00A1B4   | 
CODE_00A1B6: DEC $73C2,x                                ;$00A1B6   | 
CODE_00A1B9: BPL CODE_00A1BE                            ;$00A1B9   | 
CODE_00A1BB: JMP CODE_008AF8                            ;$00A1BB   | 

CODE_00A1BE: SEP #$20                                   ;$00A1BE   | 
CODE_00A1C0: LDY $73C2,x                                ;$00A1C0   | 
CODE_00A1C3: LDA $A1D2,y                                ;$00A1C3   | 
CODE_00A1C6: STA $7001,x                                ;$00A1C6   | 
CODE_00A1C9: LDA $A17C,y                                ;$00A1C9   | 
CODE_00A1CC: STA $7782,x                                ;$00A1CC   | 
CODE_00A1CF: REP #$20                                   ;$00A1CF   | 
CODE_00A1D1: RTS                                        ;$00A1D1   | 

DATA_00A1D2:         db $08, $10, $18, $20, $28, $30, $40, $38
DATA_00A1DA:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_00A1E2:         db $40, $40, $40, $40, $40, $40, $40

; gsu table
DATA_00A1E9:         dw $A548, $A53E, $A52F, $A51B
DATA_00A1F1:         dw $A502, $A4E4, $A4BC, $A499
DATA_00A1F9:         dw $A471, $A449, $A421, $A3F9
DATA_00A201:         dw $A3D1, $A3A9, $A381, $A359
DATA_00A209:         dw $A331, $A309, $A2E1, $A2B9
DATA_00A211:         dw $A291, $A269, $A241, $A219

DATA_00A219:         db $02, $00, $11, $00, $00, $FC, $00, $10
DATA_00A221:         db $00, $00, $04, $FC, $01, $00, $00, $FC
DATA_00A229:         db $FC, $00, $00, $00, $FB, $00, $11, $00
DATA_00A231:         db $00, $F8, $00, $10, $00, $00, $FB, $FA
DATA_00A239:         db $01, $00, $00, $F6, $FC, $00

DATA_00A241:         db $00, $00, $06, $03, $01, $00, $00, $FC
DATA_00A249:         db $05, $10, $40, $00, $08, $F7, $10, $00
DATA_00A251:         db $00, $FC, $F7, $10, $00, $00, $FB, $00
DATA_00A259:         db $11, $40, $00, $F3, $03, $10, $40, $00
DATA_00A261:         db $FB, $F1, $01, $40, $00, $F2, $F7, $01
DATA_00A269:         db $00, $00

DATA_00A269:         db $09, $03, $10, $40, $00, $FC, $08, $00
DATA_00A271:         db $40, $00, $0B, $F5, $10, $40, $00, $FC
DATA_00A279:         db $F4, $11, $00, $00, $FB, $01, $10, $40
DATA_00A281:         db $00, $F0, $03, $10, $00, $00, $FB, $ED
DATA_00A289:         db $01, $C0, $00, $EF, $F4, $01, $80, $00

DATA_00A291:         db $0C, $04, $01, $40, $00, $FC, $08, $01
DATA_00A299:         db $40, $00, $0D, $F3, $01, $40, $00, $FC
DATA_00A2A1:         db $F3, $10, $40, $00, $FB, $02, $00, $40
DATA_00A2A9:         db $00, $ED, $04, $00, $00, $00, $FB, $EB
DATA_00A2B1:         db $00, $C0, $00, $ED, $F2, $10, $80, $00

DATA_00A2B9:         db $0D, $05, $00, $C0, $00, $FC, $0A, $01
DATA_00A2C1:         db $C0, $00, $0E, $F2, $01, $C0, $00, $FC
DATA_00A2C9:         db $F3, $00, $40, $00, $FB, $03, $01, $40
DATA_00A2D1:         db $00, $EC, $05, $01, $00, $00, $FB, $E9
DATA_00A2D9:         db $11, $80, $00, $EC, $F1, $10, $C0, $00

DATA_00A2E1:         db $0E, $06, $11, $80, $00, $FB, $0C, $00
DATA_00A2E9:         db $C0, $00, $0F, $F1, $00, $C0, $00, $FC
DATA_00A2F1:         db $F3, $00, $C0, $00, $FB, $04, $01, $C0
DATA_00A2F9:         db $00, $EB, $06, $01, $80, $00, $FB, $E8
DATA_00A301:         db $10, $80, $00, $EB, $F0, $01, $C0, $00

DATA_00A309:         db $0E, $06, $01, $80, $00, $FC, $0C, $11
DATA_00A311:         db $80, $00, $0F, $F1, $11, $80, $00, $FC
DATA_00A319:         db $F3, $11, $80, $00, $FB, $05, $00, $C0
DATA_00A321:         db $00, $EB, $06, $00, $80, $00, $FB, $E8
DATA_00A329:         db $00, $80, $00, $EB, $F0, $00, $40, $00

DATA_00A331:         db $0D, $0A, $10, $00, $00, $FD, $0F, $10
DATA_00A339:         db $80, $00, $10, $F2, $10, $80, $00, $FE
DATA_00A341:         db $F6, $00, $80, $00, $FB, $06, $11, $80
DATA_00A349:         db $00, $EB, $07, $11, $80, $00, $FC, $EB
DATA_00A351:         db $01, $00, $00, $ED, $F4, $11, $00, $00

DATA_00A359:         db $0C, $0E, $10, $40, $00, $FE, $13, $00
DATA_00A361:         db $80, $00, $11, $F6, $01, $00, $00, $FE
DATA_00A369:         db $F8, $00, $00, $00, $FD, $09, $00, $80
DATA_00A371:         db $00, $E9, $09, $00, $C0, $00, $FC, $EE
DATA_00A379:         db $10, $00, $00, $EF, $F3, $00, $00, $00

DATA_00A381:         db $0B, $0E, $00, $40, $00, $FE, $16, $01
DATA_00A389:         db $00, $00, $10, $F9, $00, $00, $00, $FC
DATA_00A391:         db $FB, $11, $00, $00, $FD, $0C, $00, $00
DATA_00A399:         db $00, $E9, $0C, $00, $40, $00, $FA, $F2
DATA_00A3A1:         db $11, $00, $00, $EE, $F3, $01, $00, $00

DATA_00A3A9:         db $0A, $0F, $01, $40, $00, $FD, $19, $10
DATA_00A3B1:         db $00, $00, $0F, $FE, $11, $00, $00, $FB
DATA_00A3B9:         db $FB, $00, $40, $00, $FB, $0F, $11, $00
DATA_00A3C1:         db $00, $EB, $10, $11, $00, $00, $FA, $F2
DATA_00A3C9:         db $10, $40, $00, $EE, $F4, $01, $00, $00

DATA_00A3D1:         db $09, $10, $01, $40, $00, $FB, $1A, $00
DATA_00A3D9:         db $40, $00, $0E, $FD, $00, $40, $00, $FA
DATA_00A3E1:         db $FC, $01, $40, $00, $F9, $10, $00, $40
DATA_00A3E9:         db $00, $EC, $11, $00, $00, $00, $F9, $F3
DATA_00A3F1:         db $00, $40, $00, $ED, $F6, $00, $00, $00

DATA_00A3F9:         db $0B, $13, $00, $40, $00, $FA, $1D, $01
DATA_00A401:         db $40, $00, $0D, $FE, $01, $40, $00, $FB
DATA_00A409:         db $FE, $01, $C0, $00, $FA, $11, $01, $40
DATA_00A411:         db $00, $ED, $11, $01, $00, $00, $F9, $F3
DATA_00A419:         db $01, $40, $00, $EB, $FC, $10, $00, $00

DATA_00A421:         db $0C, $16, $10, $40, $00, $F9, $1E, $01
DATA_00A429:         db $40, $00, $0D, $FF, $01, $40, $00, $FB
DATA_00A431:         db $00, $00, $C0, $00, $FA, $12, $01, $C0
DATA_00A439:         db $00, $ED, $13, $01, $00, $00, $F9, $F5
DATA_00A441:         db $01, $40, $00, $E9, $FE, $11, $00, $00

DATA_00A449:         db $0D, $19, $11, $00, $00, $FA, $20, $00
DATA_00A451:         db $40, $00, $0E, $02, $00, $40, $00, $FB
DATA_00A459:         db $01, $10, $C0, $00, $FA, $15, $01, $C0
DATA_00A461:         db $00, $EC, $16, $00, $00, $00, $FA, $F8
DATA_00A469:         db $00, $40, $00, $E9, $FD, $10, $40, $00

DATA_00A471:         db $0F, $1A, $10, $00, $00, $FB, $23, $10
DATA_00A479:         db $40, $00, $0E, $05, $10, $40, $00, $FC
DATA_00A481:         db $03, $10, $C0, $00, $FA, $17, $01, $40
DATA_00A489:         db $00, $EC, $19, $10, $00, $00, $FB, $FB
DATA_00A491:         db $10, $40, $00, $E9, $FD, $00, $40, $00

DATA_00A499:         db $11, $1C, $01, $00, $00, $FD, $26, $00
DATA_00A4A1:         db $00, $00, $11, $08, $01, $00, $00, $FB
DATA_00A4A9:         db $09, $00, $C0, $00, $FB, $1C, $10, $00
DATA_00A4B1:         db $00, $E9, $1C, $00, $40, $00, $E9, $00
DATA_00A4B9:         db $01, $40, $00

DATA_00A4BC:         db $10, $1B, $00, $00, $00, $FC, $25, $10
DATA_00A4C4:         db $00, $00, $10, $09, $10, $00, $00, $FC
DATA_00A4CC:         db $06, $10, $C0, $00, $FB, $1A, $10, $40
DATA_00A4D4:         db $00, $EA, $1B, $10, $40, $00, $FB, $FD
DATA_00A4DC:         db $11, $00, $00, $E9, $FE, $01, $40, $00

DATA_00A4E4:         db $12, $1D, $01, $00, $00, $FE, $28, $01
DATA_00A4EC:         db $00, $00, $11, $09, $01, $00, $00, $FB
DATA_00A4F4:         db $0B, $00, $C0, $00, $FD, $1D, $01, $00
DATA_00A4FC:         db $00, $E9, $04, $00, $40, $00

DATA_00A502:         db $11, $21, $00, $00, $00, $10, $0C, $00
DATA_00A50A:         db $00, $00, $FA, $0E, $01, $C0, $00, $FD
DATA_00A512:         db $1E, $01, $00, $00, $EA, $07, $10, $40
DATA_00A51A:         db $00

DATA_00A51B:         db $10, $0E, $10, $00, $00, $FB, $11, $01
DATA_00A523:         db $40, $00, $FC, $22, $10, $00, $00, $EA
DATA_00A52B:         db $0A, $10, $00, $00

DATA_00A52F:         db $0F, $13, $11, $00, $00, $FB, $25, $11
DATA_00A537:         db $00, $00, $EB, $0A, $00, $00, $00

DATA_00A53E:         db $FA, $26, $10, $40, $00, $EB, $0B, $01
DATA_00A546:         db $00, $00

DATA_00A548:         db $F9, $27, $01, $40, $00

DATA_00A54D:         dw $F800, $0800

CODE_00A551: JSR CODE_008AE5                            ;$00A551   | 
CODE_00A554: LDY #$00                                   ;$00A554   | 
CODE_00A556: LDA $7142,x                                ;$00A556   | 
CODE_00A559: CMP $7E4C,x                                ;$00A559   | 
CODE_00A55C: BPL CODE_00A560                            ;$00A55C   | 
CODE_00A55E: INY                                        ;$00A55E   | 
CODE_00A55F: INY                                        ;$00A55F   | 
CODE_00A560: LDA $A54D,y                                ;$00A560   | 
CODE_00A563: STA $75A2,x                                ;$00A563   | 
CODE_00A566: RTS                                        ;$00A566   | 

DATA_00A567:         db $07, $07, $05, $04, $04, $04, $04, $04

CODE_00A56F: JSR CODE_008AE5                            ;$00A56F   | 
CODE_00A572: LDA $7782,x                                ;$00A572   | 
CODE_00A575: BNE CODE_00A58B                            ;$00A575   | 
CODE_00A577: DEC $73C2,x                                ;$00A577   | 
CODE_00A57A: BPL CODE_00A57F                            ;$00A57A   | 
CODE_00A57C: JMP CODE_008AF8                            ;$00A57C   | 

CODE_00A57F: LDY $73C2,x                                ;$00A57F   | 
CODE_00A582: LDA $A567,y                                ;$00A582   | 
CODE_00A585: AND #$00FF                                 ;$00A585   | 
CODE_00A588: STA $7782,x                                ;$00A588   | 
CODE_00A58B: RTS                                        ;$00A58B   | 

DATA_00A58C:         db $06, $06, $06, $06, $06, $05, $05, $05
DATA_00A594:         db $05, $05, $05, $04, $04, $04

CODE_00A59A: PHX                                        ;$00A59A   | 
CODE_00A59B: TXA                                        ;$00A59B   | 
CODE_00A59C: AND #$00FF                                 ;$00A59C   | 
CODE_00A59F: STA $3014                                  ;$00A59F   | 
CODE_00A5A2: LDA #$0000                                 ;$00A5A2   | 
CODE_00A5A5: STA $3000                                  ;$00A5A5   | 
CODE_00A5A8: LDA #$A5EB                                 ;$00A5A8   | 
CODE_00A5AB: STA $301C                                  ;$00A5AB   | 
CODE_00A5AE: LDX #$09                                   ;$00A5AE   | 
CODE_00A5B0: LDA #$8CB1                                 ;$00A5B0   | 
CODE_00A5B3: JSL CODE_7EDE44                            ;$00A5B3   |  GSU init

CODE_00A5B7: PLX                                        ;$00A5B7   | 
CODE_00A5B8: JSR CODE_008AE5                            ;$00A5B8   | 
CODE_00A5BB: LDA $7782,x                                ;$00A5BB   | 
CODE_00A5BE: BNE CODE_00A5DB                            ;$00A5BE   | 
CODE_00A5C0: DEC $73C2,x                                ;$00A5C0   | 
CODE_00A5C3: BPL CODE_00A5C8                            ;$00A5C3   | 
CODE_00A5C5: JMP CODE_008AF8                            ;$00A5C5   | 

CODE_00A5C8: SEP #$20                                   ;$00A5C8   | 
CODE_00A5CA: LDY $73C2,x                                ;$00A5CA   | 
CODE_00A5CD: LDA $A5DC,y                                ;$00A5CD   | 
CODE_00A5D0: STA $7001,x                                ;$00A5D0   | 
CODE_00A5D3: LDA $A58C,y                                ;$00A5D3   | 
CODE_00A5D6: STA $7782,x                                ;$00A5D6   | 
CODE_00A5D9: REP #$20                                   ;$00A5D9   | 
CODE_00A5DB: RTS                                        ;$00A5DB   | 

DATA_00A5DC:         db $08, $08, $08, $10, $18, $20, $18, $18
DATA_00A5E4:         db $18, $18, $10, $10, $10, $08, $08

DATA_00A5EB:         dw $A6A4, $A69F, $A69A, $A690
DATA_00A5F3:         dw $A681, $A66D, $A65E, $A64F
DATA_00A5FB:         dw $A640, $A631, $A627, $A61D
DATA_00A603:         dw $A613, $A60E, $A609

DATA_00A609:         db $00, $00, $E3, $06, $02

DATA_00A60E:         db $00, $01, $E3, $06, $02

DATA_00A613:         db $00, $00, $F8, $06, $00
DATA_00A618:         db $00, $03, $E3, $06, $02

DATA_00A61D:         db $00, $00, $F8, $46, $00
DATA_00A622:         db $00, $06, $E3, $06, $02

DATA_00A627:         db $00, $00, $F8, $06, $00
DATA_00A62C:         db $00, $0A, $E5, $06, $02

DATA_00A631:         db $08, $09, $F8, $06, $00
DATA_00A636:         db $00, $01, $F7, $46, $00
DATA_00A63B:         db $00, $0E, $E5, $46, $02

DATA_00A640:         db $08, $0A, $F8, $46, $00
DATA_00A645:         db $00, $03, $F7, $06, $00
DATA_00A64A:         db $00, $12, $E5, $06, $02

DATA_00A64F:         db $08, $0C, $F7, $06, $00
DATA_00A654:         db $00, $05, $F7, $46, $00
DATA_00A659:         db $00, $16, $E5, $46, $02

DATA_00A65E:         db $08, $0E, $F7, $46, $00
DATA_00A663:         db $00, $07, $F7, $06, $00
DATA_00A668:         db $00, $1A, $E7, $06, $02

DATA_00A66D:         db $00, $0B, $E1, $06, $00
DATA_00A672:         db $04, $18, $F8, $06, $00
DATA_00A677:         db $08, $10, $E1, $06, $00
DATA_00A67C:         db $00, $1E, $E7, $46, $02

DATA_00A681:         db $04, $19, $F8, $46, $00
DATA_00A686:         db $08, $12, $E1, $06, $00
DATA_00A68B:         db $00, $22, $E7, $86, $02

DATA_00A690:         db $04, $1B, $F8, $06, $00
DATA_00A695:         db $00, $26, $E7, $C6, $02

DATA_00A69A:         db $04, $1D, $59, $06, $00

DATA_00A69F:         db $04, $1F, $F7, $46, $00
DATA_00A6A4:         db $04, $21, $E1, $06, $00

    JSR CODE_008AE5     ; $00A6A9   |
    LDA $7782,x         ; $00A6AC   |
    BNE CODE_00A6B4     ; $00A6AF   |
    JMP CODE_008AF8     ; $00A6B1   |

CODE_00A6B4:
    LDA $7E8E,x         ; $00A6B4   |
    BNE CODE_00A6CD     ; $00A6B7   |
    SEP #$20            ; $00A6B9   |
    LDA #$02            ; $00A6BB   |
    STA $7E8E,x         ; $00A6BD   |
    DEC $73C2,x         ; $00A6C0   |
    BPL CODE_00A6CB     ; $00A6C3   |
    LDA $7E4C,x         ; $00A6C5   |
    STA $73C2,x         ; $00A6C8   |

CODE_00A6CB:
    REP #$20            ; $00A6CB   |

CODE_00A6CD:
    RTS                 ; $00A6CD   |

    JSR CODE_008AE5     ; $00A6CE   |
    LDA $7820,x         ; $00A6D1   |
    AND #$0001          ; $00A6D4   |
    BEQ CODE_00A701     ; $00A6D7   |
    LDA $73C2,x         ; $00A6D9   |
    BNE CODE_00A6E4     ; $00A6DC   |
    LDA #$001C          ; $00A6DE   |
    STA $6F62,x         ; $00A6E1   |

CODE_00A6E4:
    CMP #$0003          ; $00A6E4   |
    BEQ CODE_00A6EC     ; $00A6E7   |
    INC $73C2,x         ; $00A6E9   |

CODE_00A6EC:
    LDA $71E2,x         ; $00A6EC   |
    BMI CODE_00A701     ; $00A6EF   |
    LSR A               ; $00A6F1   |
    CMP #$0020          ; $00A6F2   |
    BCS CODE_00A6FA     ; $00A6F5   |
    JMP CODE_008AF8     ; $00A6F7   |

CODE_00A6FA:
    EOR #$FFFF          ; $00A6FA   |
    INC A               ; $00A6FD   |
    STA $71E2,x         ; $00A6FE   |

CODE_00A701:
    RTS                 ; $00A701   |

DATA_00A702:         db $0A, $09, $08, $07, $06, $05, $04, $03
DATA_00A70A:         db $02, $01, $00, $00

DATA_00A70E:         db $04, $04, $03, $03, $02, $02, $01, $01
DATA_00A716:         db $01, $01, $01, $01

DATA_00A71A:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_00A722:         db $01, $01, $FF, $01, $20, $E5, $8A, $BD
DATA_00A72A:         db $82, $77, $D0, $21, $DE, $4C, $7E, $10
DATA_00A732:         db $03

CODE_00A733: JMP CODE_008AF8                            ;$00A733   | 

CODE_00A736: SEP #$20                                   ;$00A736   | 
CODE_00A738: LDY $7E4C,x                                ;$00A738   | 
CODE_00A73B: LDA $A702,y                                ;$00A73B   | 
CODE_00A73E: STA $73C2,x                                ;$00A73E   | 
CODE_00A741: LDA $A70E,y                                ;$00A741   | 
CODE_00A744: STA $7782,x                                ;$00A744   | 
CODE_00A747: LDA $A71A,y                                ;$00A747   | 
CODE_00A74A: STA $7462,x                                ;$00A74A   | 
CODE_00A74D: REP #$20                                   ;$00A74D   | 
CODE_00A74F: RTS                                        ;$00A74F   | 

DATA_00A750:         db $03, $03, $03, $03, $03, $03, $03, $02
DATA_00A758:         db $02

CODE_00A759: JSR CODE_008AE5                            ;$00A759   | 
CODE_00A75C: LDA $7782,x                                ;$00A75C   | 
CODE_00A75F: BNE CODE_00A775                            ;$00A75F   | 
CODE_00A761: DEC $73C2,x                                ;$00A761   | 
CODE_00A764: BPL CODE_00A769                            ;$00A764   | 
CODE_00A766: JMP CODE_008AF8                            ;$00A766   | 

CODE_00A769: LDY $73C2,x                                ;$00A769   | 
CODE_00A76C: LDA $A750,y                                ;$00A76C   | 
CODE_00A76F: AND #$00FF                                 ;$00A76F   | 
CODE_00A772: STA $7782,x                                ;$00A772   | 
CODE_00A775: RTS                                        ;$00A775   | 

CODE_00A776: JSR CODE_008AE5                            ;$00A776   | 
CODE_00A779: LDA $7782,x                                ;$00A779   | 
CODE_00A77C: BNE CODE_00A78C                            ;$00A77C   | 
CODE_00A77E: DEC $73C2,x                                ;$00A77E   | 
CODE_00A781: BPL CODE_00A786                            ;$00A781   | 
CODE_00A783: JMP CODE_008AF8                            ;$00A783   | 

CODE_00A786: LDA #$0003                                 ;$00A786   | 
CODE_00A789: STA $7782,x                                ;$00A789   | 
CODE_00A78C: RTS                                        ;$00A78C   | 

CODE_00A78D: JSR CODE_008AE5                            ;$00A78D   | 
CODE_00A790: LDA $7782,x                                ;$00A790   | 
CODE_00A793: BNE CODE_00A7A3                            ;$00A793   | 
CODE_00A795: DEC $73C2,x                                ;$00A795   | 
CODE_00A798: BPL CODE_00A79D                            ;$00A798   | 
CODE_00A79A: JMP CODE_008AF8                            ;$00A79A   | 

CODE_00A79D: LDA #$0004                                 ;$00A79D   | 
CODE_00A7A0: STA $7782,x                                ;$00A7A0   | 
CODE_00A7A3: RTS                                        ;$00A7A3   | 

CODE_00A7A4: JSR CODE_008AE5                            ;$00A7A4   | 
CODE_00A7A7: LDA $7782,x                                ;$00A7A7   | 
CODE_00A7AA: BNE CODE_00A7D0                            ;$00A7AA   | 
CODE_00A7AC: SEP #$20                                   ;$00A7AC   | 
CODE_00A7AE: LDA #$01                                   ;$00A7AE   | 
CODE_00A7B0: STA $7462,x                                ;$00A7B0   | 
CODE_00A7B3: REP #$20                                   ;$00A7B3   | 
CODE_00A7B5: LDA #$0004                                 ;$00A7B5   | 
CODE_00A7B8: STA $7782,x                                ;$00A7B8   | 
CODE_00A7BB: DEC $73C2,x                                ;$00A7BB   | 
CODE_00A7BE: BPL CODE_00A7D0                            ;$00A7BE   | 
CODE_00A7C0: LDA #$0001                                 ;$00A7C0   | 
CODE_00A7C3: STA $73C2,x                                ;$00A7C3   | 
CODE_00A7C6: LDA $7142,x                                ;$00A7C6   | 
CODE_00A7C9: CLC                                        ;$00A7C9   | 
CODE_00A7CA: ADC #$0008                                 ;$00A7CA   | 
CODE_00A7CD: STA $7142,x                                ;$00A7CD   | 
CODE_00A7D0: RTS                                        ;$00A7D0   | 

DATA_00A7D1:         db $03, $03, $02, $02, $02, $01, $01, $01
DATA_00A7D9:         db $02

CODE_00A7DA: JSR CODE_008AE5                            ;$00A7DA   | 
CODE_00A7DD: LDA $7782,x                                ;$00A7DD   | 
CODE_00A7E0: BNE CODE_00A7F6                            ;$00A7E0   | 
CODE_00A7E2: DEC $73C2,x                                ;$00A7E2   | 
CODE_00A7E5: BPL CODE_00A7EA                            ;$00A7E5   | 
CODE_00A7E7: JMP CODE_008AF8                            ;$00A7E7   | 

CODE_00A7EA: LDY $73C2,x                                ;$00A7EA   | 
CODE_00A7ED: LDA $A7D1,y                                ;$00A7ED   | 
CODE_00A7F0: AND #$00FF                                 ;$00A7F0   | 
CODE_00A7F3: STA $7782,x                                ;$00A7F3   | 
CODE_00A7F6: RTS                                        ;$00A7F6   | 

CODE_00A7F7: JSR CODE_008AE5                            ;$00A7F7   | 
CODE_00A7FA: LDA $7782,x                                ;$00A7FA   | 
CODE_00A7FD: BNE CODE_00A80D                            ;$00A7FD   | 
CODE_00A7FF: DEC $73C2,x                                ;$00A7FF   | 
CODE_00A802: BPL CODE_00A807                            ;$00A802   | 
CODE_00A804: JMP CODE_008AF8                            ;$00A804   | 

CODE_00A807: LDA #$0002                                 ;$00A807   | 
CODE_00A80A: STA $7782,x                                ;$00A80A   | 
CODE_00A80D: RTS                                        ;$00A80D   | 

CODE_00A80E: JSR CODE_008AF2                            ;$00A80E   | 
CODE_00A811: RTS                                        ;$00A811   | 

DATA_00A824:         db $04, $04, $04, $04, $04, $04, $02, $02
DATA_00A82C:         db $02, $02, $02, $02, $02, $02, $02, $02
DATA_00A834:         db $02

DATA_00A812:         dw $282C, $2024, $181C, $14FF
DATA_00A81A:         dw $10FF, $0CFF, $08FF, $04FF
DATA_00A822:         dw $00FF

    LDY $7E4C,x         ; $00A835   |
    LDA $A811,y         ; $00A838   |
    BMI CODE_00A890     ; $00A83B   |
    XBA                 ; $00A83D   |
    ORA $7E4E,x         ; $00A83E   |
    AND #$00FF          ; $00A841   |
    STA $73C2,x         ; $00A844   |
    STX $00             ; $00A847   |

CODE_00A849: TXA                                        ;$00A849   | 
CODE_00A84A: AND #$00FF                                 ;$00A84A   | 
CODE_00A84D: STA $3014                                  ;$00A84D   | 
CODE_00A850: LDA #$0000                                 ;$00A850   | 
CODE_00A853: STA $3000                                  ;$00A853   | 
CODE_00A856: LDA #$A8AE                                 ;$00A856   | 
CODE_00A859: STA $301C                                  ;$00A859   | 
CODE_00A85C: LDX #$09                                   ;$00A85C   | 
CODE_00A85E: LDA #$8CB1                                 ;$00A85E   | 
CODE_00A861: JSL CODE_7EDE44                            ;$00A861   |  GSU init

CODE_00A865: LDX $00                                    ;$00A865   | 
CODE_00A867: LDA #$0004                                 ;$00A867   | 
CODE_00A86A: STA $300E                                  ;$00A86A   | 
CODE_00A86D: LDA $70A2,x                                ;$00A86D   | 
CODE_00A870: STA $3002                                  ;$00A870   | 
CODE_00A873: LDA $7142,x                                ;$00A873   | 
CODE_00A876: STA $3004                                  ;$00A876   | 
CODE_00A879: LDA $78C2,x                                ;$00A879   | 
CODE_00A87C: STA $3006                                  ;$00A87C   | 
CODE_00A87F: LDA $7322,x                                ;$00A87F   | 
CODE_00A882: STA $300A                                  ;$00A882   | 
CODE_00A885: LDX #$09                                   ;$00A885   | 
CODE_00A887: LDA #$F5F4                                 ;$00A887   | 
CODE_00A88A: JSL CODE_7EDE44                            ;$00A88A   |  GSU init

CODE_00A88E: LDX $00                                    ;$00A88E   | 
CODE_00A890: JSR CODE_008AE5                            ;$00A890   | 
CODE_00A893: LDA $7782,x                                ;$00A893   | 
CODE_00A896: BNE CODE_00A8AD                            ;$00A896   | 
CODE_00A898: DEC $7E4C,x                                ;$00A898   | 
CODE_00A89B: BPL CODE_00A8A0                            ;$00A89B   | 
CODE_00A89D: JMP CODE_008AF8                            ;$00A89D   | 

CODE_00A8A0: SEP #$20                                   ;$00A8A0   | 
CODE_00A8A2: LDY $7E4C,x                                ;$00A8A2   | 
CODE_00A8A5: LDA $A824,y                                ;$00A8A5   | 
CODE_00A8A8: STA $7782,x                                ;$00A8A8   | 
CODE_00A8AB: REP #$20                                   ;$00A8AB   | 
CODE_00A8AD: RTS                                        ;$00A8AD   | 

DATA_00A8AE:         dw $A90E, $AA12, $AB16, $AC1A
DATA_00A8B6:         dw $A922, $AA26, $AB2A, $AC2E
DATA_00A8BE:         dw $A936, $AA3A, $AB3E, $AC42
DATA_00A8C6:         dw $A94A, $AA4E, $AB52, $AC56
DATA_00A8CE:         dw $A95E, $AA62, $AB66, $AC6A
DATA_00A8D6:         dw $A972, $AA76, $AB7A, $AC7E
DATA_00A8DE:         dw $A986, $AA8A, $AB8E, $AC92
DATA_00A8E6:         dw $A99A, $AA9E, $ABA2, $ACA6
DATA_00A8EE:         dw $A9AE, $AAB2, $ABB6, $ACBA
DATA_00A8F6:         dw $A9C2, $AAC6, $ABCA, $ACCE
DATA_00A8FE:         dw $A9D6, $AADA, $ABDE, $ACE2
DATA_00A906:         dw $A9EA, $AAEE, $ABF2, $ACF6

DATA_00A90E:         db $FC, $00, $42, $C2, $02
DATA_00A913:         db $FC, $F0, $42, $42, $02
DATA_00A918:         db $EC, $00, $42, $82, $02
DATA_00A91D:         db $EC, $F0, $42, $02, $02

DATA_00A922:         db $0C, $FC, $42, $C2, $02
DATA_00A927:         db $FC, $FC, $42, $82, $02
DATA_00A92C:         db $0C, $EC, $42, $42, $02
DATA_00A931:         db $FC, $EC, $42, $02, $02

DATA_00A936:         db $14, $08, $42, $C2, $02
DATA_00A93B:         db $14, $F8, $42, $42, $02
DATA_00A940:         db $04, $08, $42, $82, $02
DATA_00A945:         db $04, $F8, $42, $02, $02

DATA_00A94A:         db $0C, $14, $42, $C2, $02
DATA_00A94F:         db $FC, $14, $42, $82, $02
DATA_00A954:         db $0C, $04, $42, $42, $02
DATA_00A959:         db $FC, $04, $42, $02, $02

DATA_00A95E:         db $FC, $10, $42, $C2, $02
DATA_00A963:         db $EC, $10, $42, $82, $02
DATA_00A968:         db $FC, $00, $42, $42, $02
DATA_00A96D:         db $EC, $00, $42, $02, $02

DATA_00A972:         db $08, $08, $42, $C2, $02
DATA_00A977:         db $F8, $08, $42, $82, $02
DATA_00A97C:         db $08, $F8, $42, $42, $02
DATA_00A981:         db $F8, $F8, $42, $02, $02

DATA_00A986:         db $08, $04, $E3, $06, $02
DATA_00A98B:         db $FC, $08, $E3, $06, $02
DATA_00A990:         db $04, $FC, $E3, $06, $02
DATA_00A995:         db $F8, $F8, $E3, $06, $02

DATA_00A99A:         db $08, $02, $E3, $06, $02
DATA_00A99F:         db $FC, $06, $E3, $06, $02
DATA_00A9A4:         db $04, $FA, $E3, $06, $02
DATA_00A9A9:         db $F8, $F6, $E5, $06, $02

DATA_00A9AE:         db $08, $00, $E5, $06, $02
DATA_00A9B3:         db $FC, $04, $E3, $06, $02
DATA_00A9B8:         db $04, $F8, $E3, $06, $02
DATA_00A9BD:         db $F8, $F4, $E7, $06, $02

DATA_00A9C2:         db $08, $EE, $E0, $02, $00
DATA_00A9C7:         db $08, $FE, $E7, $06, $02
DATA_00A9CC:         db $FC, $02, $E3, $06, $02
DATA_00A9D1:         db $04, $F6, $E5, $06, $02

DATA_00A9D6:         db $08, $EC, $E0, $02, $00
DATA_00A9DB:         db $08, $E4, $E0, $02, $00
DATA_00A9E0:         db $FC, $00, $E5, $06, $02
DATA_00A9E5:         db $04, $F4, $E7, $06, $02

DATA_00A9EA:         db $08, $F6, $E0, $02, $00
DATA_00A9EF:         db $08, $EE, $E0, $02, $00
DATA_00A9F4:         db $08, $E6, $E0, $02, $00
DATA_00A9F9:         db $FC, $FE, $E7, $06, $02
DATA_00A9FE:         db $00, $10, $E0, $02, $00
DATA_00AA03:         db $00, $08, $E0, $02, $00
DATA_00AA08:         db $00, $00, $E0, $02, $00
DATA_00AA0D:         db $00, $F8, $E0, $02, $00

DATA_00AA12:         db $FF, $02, $60, $C3, $02
DATA_00AA17:         db $FF, $F2, $60, $43, $02
DATA_00AA1C:         db $EF, $02, $60, $83, $02
DATA_00AA21:         db $EF, $F2, $60, $03, $02

DATA_00AA26:         db $0B, $FF, $60, $C3, $02
DATA_00AA2B:         db $FB, $FF, $60, $83, $02
DATA_00AA30:         db $0B, $EF, $60, $43, $02
DATA_00AA35:         db $FB, $EF, $60, $03, $02

DATA_00AA3A:         db $11, $08, $60, $C3, $02
DATA_00AA3F:         db $11, $F8, $60, $43, $02
DATA_00AA44:         db $01, $08, $60, $83, $02
DATA_00AA49:         db $01, $F8, $60, $03, $02

DATA_00AA4E:         db $0B, $11, $60, $C3, $02
DATA_00AA53:         db $FB, $11, $60, $83, $02
DATA_00AA58:         db $0B, $01, $60, $43, $02
DATA_00AA5D:         db $FB, $01, $60, $03, $02

DATA_00AA62:         db $FF, $0E, $60, $C3, $02
DATA_00AA67:         db $EF, $0E, $60, $83, $02
DATA_00AA6C:         db $FF, $FE, $60, $43, $02
DATA_00AA71:         db $EF, $FE, $60, $03, $02

DATA_00AA76:         db $08, $08, $60, $C3, $02
DATA_00AA7B:         db $F8, $08, $60, $83, $02
DATA_00AA80:         db $08, $F8, $60, $43, $02
DATA_00AA85:         db $F8, $F8, $60, $03, $02

DATA_00AA8A:         db $06, $03, $63, $07, $02
DATA_00AA8F:         db $FD, $06, $63, $07, $02
DATA_00AA94:         db $03, $FD, $63, $07, $02
DATA_00AA99:         db $FA, $FA, $63, $07, $02

DATA_00AA9E:         db $06, $01, $63, $07, $02
DATA_00AAA3:         db $FD, $04, $63, $07, $02
DATA_00AAA8:         db $03, $FB, $63, $07, $02
DATA_00AAAD:         db $FA, $F8, $65, $07, $02

DATA_00AAB2:         db $06, $00, $65, $07, $02
DATA_00AAB7:         db $FD, $03, $63, $07, $02
DATA_00AABC:         db $03, $FA, $63, $07, $02
DATA_00AAC1:         db $FA, $F7, $67, $07, $02

DATA_00AAC6:         db $08, $F0, $E0, $02, $00
DATA_00AACB:         db $06, $FE, $67, $07, $02
DATA_00AAD0:         db $FD, $01, $63, $07, $02
DATA_00AAD5:         db $03, $F8, $65, $07, $02

DATA_00AADA:         db $08, $E7, $E0, $02, $00
DATA_00AADF:         db $08, $EF, $E0, $02, $00
DATA_00AAE4:         db $FD, $00, $65, $07, $02
DATA_00AAE9:         db $03, $F7, $67, $07, $02

DATA_00AAEE:         db $08, $E5, $E0, $02, $00
DATA_00AAF3:         db $08, $ED, $E0, $02, $00
DATA_00AAF8:         db $08, $F5, $E0, $02, $00
DATA_00AAFD:         db $FD, $FD, $67, $07, $02
DATA_00AB02:         db $00, $10, $E0, $02, $00
DATA_00AB07:         db $00, $08, $E0, $02, $00
DATA_00AB0C:         db $00, $00, $E0, $02, $00
DATA_00AB11:         db $00, $F8, $E0, $02, $00

DATA_00AB16:         db $02, $04, $72, $C3, $00
DATA_00AB1B:         db $02, $FC, $72, $43, $00
DATA_00AB20:         db $FA, $04, $72, $83, $00
DATA_00AB25:         db $FA, $FC, $72, $03, $00

DATA_00AB2A:         db $0A, $02, $72, $C3, $00
DATA_00AB2F:         db $02, $02, $72, $83, $00
DATA_00AB34:         db $0A, $FA, $72, $43, $00
DATA_00AB39:         db $02, $FA, $72, $03, $00

DATA_00AB3E:         db $0E, $08, $72, $C3, $00
DATA_00AB43:         db $0E, $00, $72, $43, $00
DATA_00AB48:         db $06, $08, $72, $83, $00
DATA_00AB4D:         db $06, $00, $72, $03, $00

DATA_00AB52:         db $0A, $0E, $72, $C3, $00
DATA_00AB57:         db $02, $0E, $72, $83, $00
DATA_00AB5C:         db $0A, $06, $72, $43, $00
DATA_00AB61:         db $02, $06, $72, $03, $00

DATA_00AB66:         db $02, $0C, $72, $C3, $00
DATA_00AB6B:         db $FA, $0C, $72, $83, $00
DATA_00AB70:         db $02, $04, $72, $43, $00
DATA_00AB75:         db $FA, $04, $72, $03, $00

DATA_00AB7A:         db $08, $08, $72, $C3, $00
DATA_00AB7F:         db $00, $08, $72, $83, $00
DATA_00AB84:         db $08, $00, $72, $43, $00
DATA_00AB89:         db $00, $00, $72, $03, $00

DATA_00AB8E:         db $00, $00, $69, $07, $00
DATA_00AB93:         db $06, $02, $69, $07, $00
DATA_00AB98:         db $08, $06, $69, $07, $00
DATA_00AB9D:         db $02, $08, $69, $07, $00

DATA_00ABA2:         db $00, $FF, $6A, $07, $00
DATA_00ABA7:         db $06, $01, $69, $07, $00
DATA_00ABAC:         db $08, $05, $69, $07, $00
DATA_00ABB1:         db $02, $07, $69, $07, $00

DATA_00ABB6:         db $00, $FE, $6B, $07, $00
DATA_00ABBB:         db $06, $00, $69, $07, $00
DATA_00ABC0:         db $08, $04, $6A, $07, $00
DATA_00ABC5:         db $02, $06, $69, $07, $00

DATA_00ABCA:         db $08, $F7, $E0, $02, $00
DATA_00ABCF:         db $06, $FF, $6A, $07, $00
DATA_00ABD4:         db $08, $03, $6B, $07, $00
DATA_00ABD9:         db $02, $05, $69, $07, $00

DATA_00ABDE:         db $08, $EE, $E0, $02, $00
DATA_00ABE3:         db $08, $F6, $E0, $02, $00
DATA_00ABE8:         db $06, $FE, $6B, $07, $00
DATA_00ABED:         db $02, $04, $6A, $07, $00

DATA_00ABF2:         db $08, $E5, $E0, $02, $00
DATA_00ABF7:         db $08, $ED, $E0, $02, $00
DATA_00ABFC:         db $08, $FB, $E0, $02, $00
DATA_00AC01:         db $02, $03, $6B, $07, $00
DATA_00AC06:         db $00, $10, $E0, $02, $00
DATA_00AC0B:         db $00, $08, $E0, $02, $00
DATA_00AC10:         db $00, $00, $E0, $02, $00
DATA_00AC15:         db $00, $F8, $E0, $02, $00

DATA_00AC1A:         db $05, $06, $62, $C3, $00
DATA_00AC1F:         db $05, $FE, $62, $43, $00
DATA_00AC24:         db $FD, $06, $62, $83, $00
DATA_00AC29:         db $FD, $FE, $62, $03, $00

DATA_00AC2E:         db $0B, $FD, $62, $43, $00
DATA_00AC33:         db $0B, $05, $62, $C3, $00
DATA_00AC38:         db $03, $05, $62, $83, $00
DATA_00AC3D:         db $03, $FD, $62, $03, $00

DATA_00AC42:         db $0B, $00, $62, $43, $00
DATA_00AC47:         db $0B, $08, $62, $C3, $00
DATA_00AC4C:         db $03, $08, $62, $83, $00
DATA_00AC51:         db $03, $00, $62, $03, $00

DATA_00AC56:         db $03, $0B, $62, $83, $00
DATA_00AC5B:         db $0B, $03, $62, $43, $00
DATA_00AC60:         db $0B, $0B, $62, $C3, $00
DATA_00AC65:         db $03, $03, $62, $03, $00

DATA_00AC6A:         db $04, $0A, $62, $C3, $00
DATA_00AC6F:         db $04, $02, $62, $43, $00
DATA_00AC74:         db $FC, $0A, $62, $83, $00
DATA_00AC79:         db $FC, $02, $62, $03, $00

DATA_00AC7E:         db $08, $00, $62, $43, $00
DATA_00AC83:         db $08, $08, $62, $C3, $00
DATA_00AC88:         db $00, $08, $62, $83, $00
DATA_00AC8D:         db $00, $00, $62, $03, $00

DATA_00AC92:         db $05, $03, $79, $07, $00
DATA_00AC97:         db $06, $05, $79, $07, $00
DATA_00AC9C:         db $03, $06, $79, $07, $00
DATA_00ACA1:         db $02, $02, $79, $07, $00

DATA_00ACA6:         db $05, $02, $79, $07, $00
DATA_00ACAB:         db $06, $04, $79, $07, $00
DATA_00ACB0:         db $03, $05, $79, $07, $00
DATA_00ACB5:         db $02, $01, $7A, $07, $00

DATA_00ACBA:         db $05, $02, $79, $07, $00
DATA_00ACBF:         db $06, $04, $7A, $07, $00
DATA_00ACC4:         db $03, $05, $79, $07, $00
DATA_00ACC9:         db $02, $01, $7B, $07, $00

DATA_00ACCE:         db $08, $F9, $E0, $02, $00
DATA_00ACD3:         db $05, $01, $7A, $07, $00
DATA_00ACD8:         db $06, $03, $7B, $07, $00
DATA_00ACDD:         db $03, $04, $79, $07, $00

DATA_00ACE2:         db $08, $F1, $E0, $02, $00
DATA_00ACE7:         db $08, $F9, $E0, $02, $00
DATA_00ACEC:         db $05, $01, $7B, $07, $00
DATA_00ACF1:         db $03, $04, $7A, $07, $00

DATA_00ACF6:         db $08, $EB, $E0, $02, $00
DATA_00ACFB:         db $08, $F3, $E0, $02, $00
DATA_00AD00:         db $08, $FB, $E0, $02, $00
DATA_00AD05:         db $03, $03, $7B, $07, $00

CODE_00AD0A: LDA $7322,x                                ;$00AD0A   | 
CODE_00AD0D: BMI CODE_00AD61                            ;$00AD0D   | 
CODE_00AD0F: REP #$10                                   ;$00AD0F   | 
CODE_00AD11: TAY                                        ;$00AD11   | 
CODE_00AD12: LDA $7E4C,x                                ;$00AD12   | 
CODE_00AD15: STA $00                                    ;$00AD15   | 
CODE_00AD17: LDA $6000,y                                ;$00AD17   | 
CODE_00AD1A: SEC                                        ;$00AD1A   | 
CODE_00AD1B: SBC $00                                    ;$00AD1B   | 
CODE_00AD1D: STA $6000,y                                ;$00AD1D   | 
CODE_00AD20: LDA $6002,y                                ;$00AD20   | 
CODE_00AD23: SEC                                        ;$00AD23   | 
CODE_00AD24: SBC $00                                    ;$00AD24   | 
CODE_00AD26: STA $6002,y                                ;$00AD26   | 
CODE_00AD29: LDA $6008,y                                ;$00AD29   | 
CODE_00AD2C: CLC                                        ;$00AD2C   | 
CODE_00AD2D: ADC $00                                    ;$00AD2D   | 
CODE_00AD2F: STA $6008,y                                ;$00AD2F   | 
CODE_00AD32: LDA $600A,y                                ;$00AD32   | 
CODE_00AD35: SEC                                        ;$00AD35   | 
CODE_00AD36: SBC $00                                    ;$00AD36   | 
CODE_00AD38: STA $600A,y                                ;$00AD38   | 
CODE_00AD3B: LDA $6010,y                                ;$00AD3B   | 
CODE_00AD3E: SEC                                        ;$00AD3E   | 
CODE_00AD3F: SBC $00                                    ;$00AD3F   | 
CODE_00AD41: STA $6010,y                                ;$00AD41   | 
CODE_00AD44: LDA $6012,y                                ;$00AD44   | 
CODE_00AD47: CLC                                        ;$00AD47   | 
CODE_00AD48: ADC $00                                    ;$00AD48   | 
CODE_00AD4A: STA $6012,y                                ;$00AD4A   | 
CODE_00AD4D: LDA $6018,y                                ;$00AD4D   | 
CODE_00AD50: CLC                                        ;$00AD50   | 
CODE_00AD51: ADC $00                                    ;$00AD51   | 
CODE_00AD53: STA $6018,y                                ;$00AD53   | 
CODE_00AD56: LDA $601A,y                                ;$00AD56   | 
CODE_00AD59: CLC                                        ;$00AD59   | 
CODE_00AD5A: ADC $00                                    ;$00AD5A   | 
CODE_00AD5C: STA $601A,y                                ;$00AD5C   | 
CODE_00AD5F: SEP #$10                                   ;$00AD5F   | 
CODE_00AD61: JSR CODE_008AE5                            ;$00AD61   | 
CODE_00AD64: LDA $7782,x                                ;$00AD64   | 
CODE_00AD67: BNE CODE_00AD6C                            ;$00AD67   | 
CODE_00AD69: JMP CODE_008AF8                            ;$00AD69   | 

CODE_00AD6C: RTS                                        ;$00AD6C   | 

; these tables contain information for
; what to copy into VRAM, where, and how big
; byte 1: index into either $06F95E or $06FC79 table
; (this will be compressed chunk of data)
; if byte 1 == $FF, end loop for copying
; if byte 1 > $F0, use (byte 1 - $F0) as index into $7E0010
; and then grab chunk index from there instead
; this is for dynamic loading such as tilesets & spritesets
; bytes 2 & 3: VRAM destination address (word addressed)
; the address being >= $8000 (sign bit on)
; indicates it's $06FC79 table, $0A8000 decompression routine
; sign bit off (< $8000) indicates $06F95E, $08A980 decompression
; IF sign bit on, read an extra word: size of data to copy in BYTES
; (since VRAM uses word addressing, divide by 2 to get VRAM size)
; when sign bit is off, $0800 is size so no extra word
; tables are separated by offsets, loops through and will
; copy ALL of these at once until $FF reached
; this is part of loading for a screen, offsets are types of screen

; $000: in level
DATA_00AD6D:         db $19
DATA_00AD6E:         dw $F800, $1000
DATA_00AD71:         db $12
DATA_00AD73:         dw $9200, $0400
DATA_00AD77:         db $76
DATA_00AD78:         dw $9500, $0600
DATA_00AD7C:         db $72
DATA_00AD7D:         dw $C000, $2000
DATA_00AD81:         db $4F
DATA_00AD82:         dw $6000
DATA_00AD84:         db $F3
DATA_00AD85:         dw $9800, $1000
DATA_00AD89:         db $F4
DATA_00AD8A:         dw $A000, $1000
DATA_00AD8E:         db $F0
DATA_00AD8F:         dw $0000
DATA_00AD91:         db $F1
DATA_00AD92:         dw $0800
DATA_00AD94:         db $F2
DATA_00AD95:         dw $7000
DATA_00AD97:         db $F7
DATA_00AD98:         dw $D000, $0400
DATA_00AD9C:         db $F8
DATA_00AD9D:         dw $D200, $0400
DATA_00ADA1:         db $F9
DATA_00ADA2:         dw $D400, $0400
DATA_00ADA6:         db $FA
DATA_00ADA7:         dw $D600, $0400
DATA_00ADAB:         db $FB
DATA_00ADAC:         dw $D800, $0400
DATA_00ADB0:         db $FC
DATA_00ADB1:         dw $DA00, $0400
DATA_00ADB5:         db $F5
DATA_00ADB6:         dw $2800
DATA_00ADB8:         db $F6
DATA_00ADB9:         dw $2C00
DATA_00ADBB:         db $FF

; $04F: Yoshi's Island (file selection screen, end world cutscenes)
DATA_00ADBC:         db $F0
DATA_00ADBD:         dw $3400
DATA_00ADBF:         db $1D
DATA_00ADC0:         dw $3800
DATA_00ADC2:         db $73
DATA_00ADC3:         dw $DC00, $0800
DATA_00ADC7:         db $73
DATA_00ADC8:         dw $FC00, $0800
DATA_00ADCC:         db $74
DATA_00ADCD:         dw $BC00, $0800
DATA_00ADD1:         db $B1
DATA_00ADD2:         dw $0000
DATA_00ADD4:         db $FF

; $068: Nintendo Presents
DATA_00ADD5:         db $72
DATA_00ADD6:         dw $C000, $2000
DATA_00ADDA:         db $FF

; $06E: toadies death cinematic
DATA_00ADDB:         db $10
DATA_00ADDC:         dw $C000, $1000
DATA_00ADE0:         db $11
DATA_00ADE1:         dw $C800, $1000
DATA_00ADE5:         db $FF

; $079: intro cinematic
DATA_00ADE6:         db $27
DATA_00ADE7:         dw $7800
DATA_00ADE9:         db $87
DATA_00ADEA:         dw $8000, $2000
DATA_00ADEE:         db $88
DATA_00ADEF:         dw $9000, $2000
DATA_00ADF3:         db $89
DATA_00ADF4:         dw $A000, $2000
DATA_00ADF8:         db $8B
DATA_00ADF9:         db $B000, $2000
DATA_00ADFD:         db $8A
DATA_00ADFE:         dw $C000, $2000
DATA_00AE02:         db $4A
DATA_00AE03:         dw $5000
DATA_00AE05:         db $73
DATA_00AE06:         dw $7400
DATA_00AE08:         db $74
DATA_00AE09:         dw $6000
DATA_00AE0B:         db $75
DATA_00AE0C:         dw $6800
DATA_00AE0E:         db $FF

; $0A2: map screen
DATA_00AE0F:         db $F0
DATA_00AE10:         dw $0000
DATA_00AE12:         db $F1
DATA_00AE13:         dw $0800
DATA_00AE15:         db $7E
DATA_00AE16:         dw $1400
DATA_00AE18:         db $F2
DATA_00AE19:         dw $B800, $0800
DATA_00AE1D:         db $F3
DATA_00AE1E:         dw $BC00, $0800
DATA_00AE22:         db $56
DATA_00AE23:         dw $1000
DATA_00AE25:         db $F4
DATA_00AE26:         dw $3000
DATA_00AE28:         db $F5
DATA_00AE29:         dw $C000, $0800
DATA_00AE2D:         db $F6
DATA_00AE2E:         dw $C400, $0800
DATA_00AE32:         db $F7
DATA_00AE33:         dw $C800, $0800
DATA_00AE37:         db $F8
DATA_00AE38:         dw $CC00, $0800
DATA_00AE3C:         db $F9
DATA_00AE3D:         dw $D000, $0800
DATA_00AE41:         db $FA
DATA_00AE42:         dw $D400, $0800
DATA_00AE46:         db $FB
DATA_00AE47:         dw $D800, $0800
DATA_00AE4B:         db $FC
DATA_00AE4C:         dw $DC00, $0800
DATA_00AE50:         db $8F
DATA_00AE51:         dw $E000, $1000
DATA_00AE55:         db $8C
DATA_00AE56:         dw $F000, $1000
DATA_00AE5A:         db $73
DATA_00AE5B:         dw $FC00, $0800
DATA_00AE5F:         db $FF

; $0F3: bonus games
DATA_00AE60:         db $21
DATA_00AE61:         dw $7000
DATA_00AE63:         db $22
DATA_00AE64:         dw $7400
DATA_00AE66:         db $14
DATA_00AE67:         dw $F800, $1000
DATA_00AE6B:         db $15
DATA_00AE6C:         dw $9000, $1000
DATA_00AE70:         db $16
DATA_00AE71:         dw $9800, $1000
DATA_00AE75:         db $1C
DATA_00AE76:         dw $2800
DATA_00AE78:         db $4E
DATA_00AE79:         dw $2C00
DATA_00AE7B:         db $72
DATA_00AE7C:         dw $C000, $2000
DATA_00AE80:         db $13
DATA_00AE81:         dw $D000, $1000
DATA_00AE85:         db $F0
DATA_00AE86:         dw $6800
DATA_00AE88:         db $F2
DATA_00AE89:         dw $3800
DATA_00AE8B:         db $F4
DATA_00AE8C:         dw $3400
DATA_00AE8E:         db $FF

; $122: minigames
DATA_00AE8F:         db $41
DATA_00AE90:         dw $7000
DATA_00AE92:         db $19
DATA_00AE93:         dw $F800, $1000
DATA_00AE97:         db $25
DATA_00AE98:         dw $0000
DATA_00AE9A:         db $26
DATA_00AE9B:         dw $0800
DATA_00AE9D:         db $F0
DATA_00AE9E:         dw $9800, $1000
DATA_00AEA2:         db $F1
DATA_00AEA3:         dw $A000, $1000
DATA_00AEA7:         db $50
DATA_00AEA8:         dw $2800
DATA_00AEAA:         db $4E
DATA_00AEAB:         db $2C00
DATA_00AEAD:         db $72
DATA_00AEAE:         dw $C000, $2000
DATA_00AEB2:         db $24
DATA_00AEB3:         dw $5000
DATA_00AEB5:         db $4E
DATA_00AEB6:         dw $D800, $0400
DATA_00AEBA:         db $F2
DATA_00AEBB:         dw $6800
DATA_00AEBD:         db $F3
DATA_00AEBE:         dw $3800
DATA_00AEC0:         db $FF

; $154: Raphael the Raven boss fight
DATA_00AEC1:         db $F0
DATA_00AEC2:         dw $0000
DATA_00AEC4:         db $F1
DATA_00AEC5:         dw $1000
DATA_00AEC7:         db $F2
DATA_00AEC8:         dw $2000
DATA_00AECA:         db $F3
DATA_00AECB:         dw $3000
DATA_00AECD:         db $F4
DATA_00AECE:         dw $0000
DATA_00AED0:         db $72
DATA_00AED1:         dw $C000, $2000
DATA_00AED5:         db $4F
DATA_00AED6:         dw $6000
DATA_00AED8:         db $F5
DATA_00AED9:         dw $D000, $0400
DATA_00AEDD:         db $F6
DATA_00AEDE:         dw $D200, $0400
DATA_00AEE2:         db $F7
DATA_00AEE3:         dw $D400, $0400
DATA_00AEE7:         db $F8
DATA_00AEE8:         dw $D600, $0400
DATA_00AEEC:         db $F9
DATA_00AEED:         dw $D800, $0400
DATA_00AEF1:         db $FA
DATA_00AEF2:         dw $DA00, $0400
DATA_00AEF6:         db $FF

; $18A: 6-8 kamek autoscroll section
DATA_00AEF7:         db $1B
DATA_00AEF8:         dw $7000
DATA_00AEFA:         db $1E
DATA_00AEFB:         dw $7400
DATA_00AEFD:         db $1E
DATA_00AEFE:         dw $7800
DATA_00AF00:         db $72
DATA_00AF01:         dw $C000, $2000
DATA_00AF05:         db $4F
DATA_00AF06:         dw $6000
DATA_00AF08:         db $AF
DATA_00AF09:         dw $2800
DATA_00AF0B:         db $AF
DATA_00AF0C:         dw $3000
DATA_00AF0E:         db $AF
DATA_00AF0F:         dw $3800
DATA_00AF11:         db $67
DATA_00AF12:         dw $D000, $0400
DATA_00AF16:         db $3C
DATA_00AF17:         dw $D200, $0400
DATA_00AF1B:         db $55
DATA_00AF1C:         dw $D400, $0400
DATA_00AF20:         db $1A
DATA_00AF21:         dw $D600, $0400
DATA_00AF25:         db $1A
DATA_00AF26:         dw $D800, $0400
DATA_00AF2A:         db $29
DATA_00AF2B:         dw $DA00, $0400
DATA_00AF2F:         db $FF

; $1C3: credits & ending cutscenes
DATA_00AF30:         db $B3
DATA_00AF31:         dw $D400, $1000
DATA_00AF35:         db $AA
DATA_00AF36:         dw $5C00
DATA_00AF38:         db $FF
; end screen:VRAM tables

; begin tileset / spriteset data
; each entry in each table represents
; a different tileset / spriteset for the layer
; these are compressed graphics file indices
; into $06FC79 / $06F95E tables

; worlds 1-5 BG1 tileset data
; byte 1 gets loaded into $7E0010, 2 -> $11, 3 -> $12
; corresponds with $F0, $F1, and $F2 in $AD6D table
; there are 16 BG1 tilesets, $00-$0F
DATA_00AF39:         db $00, $01, $40
DATA_00AF3C:         db $02, $03, $41
DATA_00AF3F:         db $08, $09, $44
DATA_00AF42:         db $0A, $0B, $45
DATA_00AF45:         db $04, $05, $42
DATA_00AF48:         db $06, $07, $43
DATA_00AF4B:         db $0C, $0D, $46
DATA_00AF4E:         db $0E, $0F, $47
DATA_00AF51:         db $30, $31, $40
DATA_00AF54:         db $32, $33, $41
DATA_00AF57:         db $38, $39, $46
DATA_00AF5A:         db $3A, $3B, $45
DATA_00AF5D:         db $34, $35, $42
DATA_00AF60:         db $36, $37, $47
DATA_00AF63:         db $3C, $3D, $46
DATA_00AF66:         db $3E, $3F, $47

; world 6: same exact layout as above table
; except just for world 6 BG1
DATA_00AF69:         db $00, $01, $40
DATA_00AF6C:         db $69, $6A, $6B
DATA_00AF6F:         db $08, $09, $44
DATA_00AF72:         db $0A, $0B, $45
DATA_00AF75:         db $04, $05, $42
DATA_00AF78:         db $06, $07, $43
DATA_00AF7B:         db $0C, $0D, $46
DATA_00AF7E:         db $0E, $0F, $47
DATA_00AF81:         db $30, $31, $40
DATA_00AF84:         db $32, $33, $41
DATA_00AF87:         db $38, $39, $46
DATA_00AF8A:         db $3A, $3B, $45
DATA_00AF8D:         db $34, $35, $42
DATA_00AF90:         db $36, $37, $47
DATA_00AF93:         db $3C, $3D, $46
DATA_00AF96:         db $3E, $3F, $47

; BG2 tileset data
; byte 1 -> $7E0013, 2 -> $14
; corresponds to $F3 and $F4 in $AD6D table
; there are 32 BG2 tilesets, $00-$1F
DATA_00AF99:         db $17, $18
DATA_00AF9B:         db $08, $A3
DATA_00AF9D:         db $02, $03
DATA_00AF9F:         db $00, $01
DATA_00AFA1:         db $00, $01
DATA_00AFA3:         db $77, $7E
DATA_00AFA5:         db $0C, $90
DATA_00AFA7:         db $0A, $0B
DATA_00AFA9:         db $06, $07
DATA_00AFAB:         db $77, $78
DATA_00AFAD:         db $79, $0E
DATA_00AFAF:         db $04, $7A
DATA_00AFB1:         db $7B, $7C
DATA_00AFB3:         db $7D, $A4
DATA_00AFB5:         db $7F, $7E
DATA_00AFB7:         db $81, $82
DATA_00AFB9:         db $77, $78
DATA_00AFBB:         db $00, $05
DATA_00AFBD:         db $00, $05
DATA_00AFBF:         db $83, $84
DATA_00AFC1:         db $80, $81
DATA_00AFC3:         db $85, $86
DATA_00AFC5:         db $A1, $A2
DATA_00AFC7:         db $08, $09
DATA_00AFC9:         db $0D, $7E
DATA_00AFCB:         db $0E, $90
DATA_00AFCD:         db $85, $86
DATA_00AFCF:         db $85, $86
DATA_00AFD1:         db $09, $09
DATA_00AFD3:         db $A5, $A6
DATA_00AFD5:         db $7A, $7B
DATA_00AFD7:         db $A7, $A8

; BG3 tileset data
; byte 1 -> $7E0015, 2 -> $16
; corresponds to $F5 and $F6 in $AD6D table
; there are 48 BG3 tilesets, $00-$2F
DATA_00AFD9:         db $4D, $4E
DATA_00AFDB:         db $14, $15
DATA_00AFDD:         db $16, $15
DATA_00AFDF:         db $18, $18
DATA_00AFE1:         db $51, $52
DATA_00AFE3:         db $16, $15
DATA_00AFE5:         db $16, $15
DATA_00AFE7:         db $16, $15
DATA_00AFE9:         db $16, $15
DATA_00AFEB:         db $13, $13
DATA_00AFED:         db $12, $4E
DATA_00AFEF:         db $16, $15
DATA_00AFF1:         db $1A, $11
DATA_00AFF3:         db $10, $11
DATA_00AFF5:         db $28, $29
DATA_00AFF7:         db $2A, $2B
DATA_00AFF9:         db $4D, $4E
DATA_00AFFB:         db $10, $63
DATA_00AFFD:         db $15, $17
DATA_00AFFF:         db $4E, $4E
DATA_00B001:         db $51, $52
DATA_00B003:         db $53, $52
DATA_00B005:         db $5B, $5C
DATA_00B007:         db $54, $54
DATA_00B009:         db $1B, $54
DATA_00B00B:         db $51, $52
DATA_00B00D:         db $51, $52
DATA_00B00F:         db $18, $17
DATA_00B011:         db $14, $14
DATA_00B013:         db $4E, $4E
DATA_00B015:         db $19, $19
DATA_00B017:         db $4D, $4E
DATA_00B019:         db $61, $18
DATA_00B01B:         db $51, $52
DATA_00B01D:         db $62, $4E
DATA_00B01F:         db $19, $63
DATA_00B021:         db $64, $4E
DATA_00B023:         db $65, $65
DATA_00B025:         db $66, $17
DATA_00B027:         db $67, $52
DATA_00B029:         db $62, $62
DATA_00B02B:         db $57, $58
DATA_00B02D:         db $19, $19
DATA_00B02F:         db $57, $58
DATA_00B031:         db $68, $62
DATA_00B033:         db $68, $62
DATA_00B035:         db $57, $58
DATA_00B037:         db $59, $58

; spriteset data
; bytes 1-6 -> $7E0017-1C
; corresponds to $F7-$FC in $AD6D table
; there are 128 spritesets, $00-$7F
DATA_00B039:         db $20, $21, $2A, $2B, $5E, $29
DATA_00B03F:         db $20, $21, $5E, $1C, $31, $29
DATA_00B045:         db $1F, $2C, $36, $40, $51, $29
DATA_00B04B:         db $2E, $5E, $37, $1A, $1A, $1F
DATA_00B051:         db $55, $5E, $5F, $1F, $1A, $29
DATA_00B057:         db $53, $40, $51, $1A, $1A, $29
DATA_00B05D:         db $36, $2A, $2B, $3C, $2D, $71
DATA_00B063:         db $4A, $36, $1C, $71, $31, $59
DATA_00B069:         db $6A, $1A, $1A, $1A, $1A, $1A
DATA_00B06F:         db $50, $71, $2F, $31, $49, $29
DATA_00B075:         db $55, $57, $5D, $71, $1C, $2F
DATA_00B07B:         db $55, $71, $3C, $57, $4A, $1C
DATA_00B081:         db $3C, $3F, $1F, $71, $1A, $1A
DATA_00B087:         db $25, $71, $1C, $1A, $1A, $1A
DATA_00B08D:         db $2E, $1A, $1A, $1A, $1A, $1F
DATA_00B093:         db $36, $57, $38, $1C, $5C, $29
DATA_00B099:         db $3A, $3B, $31, $55, $71, $29
DATA_00B09F:         db $60, $61, $1C, $22, $23, $25
DATA_00B0A5:         db $1C, $25, $42, $43, $4F, $29
DATA_00B0AB:         db $5A, $5B, $5C, $25, $6A, $29
DATA_00B0B1:         db $1F, $37, $39, $42, $43, $1A
DATA_00B0B7:         db $27, $35, $4E, $3D, $1A, $30
DATA_00B0BD:         db $4E, $1C, $51, $46, $71, $29
DATA_00B0C3:         db $22, $23, $45, $60, $1A, $30
DATA_00B0C9:         db $42, $43, $38, $39, $1C, $59
DATA_00B0CF:         db $60, $1D, $71, $4E, $1C, $30
DATA_00B0D5:         db $60, $1D, $40, $46, $4E, $30
DATA_00B0DB:         db $55, $1D, $60, $4E, $51, $1A
DATA_00B0E1:         db $36, $63, $1F, $5C, $1A, $29
DATA_00B0E7:         db $39, $1D, $35, $1B, $63, $30
DATA_00B0ED:         db $71, $1A, $51, $5F, $60, $30
DATA_00B0F3:         db $2A, $63, $1A, $1A, $1A, $1A
DATA_00B0F9:         db $27, $3E, $1A, $3D, $1A, $1A
DATA_00B0FF:         db $25, $2B, $47, $64, $36, $1F
DATA_00B105:         db $51, $61, $48, $65, $1C, $60
DATA_00B10B:         db $48, $1C, $65, $28, $60, $71
DATA_00B111:         db $1C, $45, $1F, $71, $6A, $29
DATA_00B117:         db $4D, $6A, $48, $1F, $1A, $29
DATA_00B11D:         db $28, $60, $38, $4E, $36, $51
DATA_00B123:         db $1A, $1A, $2D, $1A, $1A, $1A
DATA_00B129:         db $45, $35, $54, $64, $1F, $1C
DATA_00B12F:         db $54, $58, $35, $3D, $71, $64
DATA_00B135:         db $35, $41, $1F, $64, $5C, $1C
DATA_00B13B:         db $32, $33, $34, $41, $4C, $54
DATA_00B141:         db $64, $1E, $41, $1F, $1C, $29
DATA_00B147:         db $55, $1E, $28, $60, $71, $5C
DATA_00B14D:         db $64, $4C, $41, $40, $68, $29
DATA_00B153:         db $2F, $5C, $5D, $1C, $1A, $1A
DATA_00B159:         db $27, $65, $49, $AA, $1C, $1F
DATA_00B15F:         db $61, $48, $71, $1C, $55, $6A
DATA_00B165:         db $71, $3C, $60, $3F, $49, $AA
DATA_00B16B:         db $53, $1A, $1C, $55, $31, $59
DATA_00B171:         db $42, $43, $55, $1F, $41, $1A
DATA_00B177:         db $2A, $2B, $29, $71, $1C, $5D
DATA_00B17D:         db $55, $1F, $27, $2A, $1A, $29
DATA_00B183:         db $4F, $2B, $47, $52, $60, $51
DATA_00B189:         db $2B, $47, $38, $71, $60, $51
DATA_00B18F:         db $40, $29, $31, $4E, $1C, $59
DATA_00B195:         db $1C, $1A, $1A, $4E, $1A, $1A
DATA_00B19B:         db $2B, $47, $26, $52, $56, $29
DATA_00B1A1:         db $2B, $47, $26, $52, $31, $29
DATA_00B1A7:         db $2B, $47, $1F, $29, $31, $51
DATA_00B1AD:         db $2B, $47, $2F, $1E, $71, $29
DATA_00B1B3:         db $29, $1A, $1A, $53, $1B, $1F
DATA_00B1B9:         db $31, $40, $1F, $1A, $1A, $1A
DATA_00B1BF:         db $41, $35, $39, $71, $1F, $29
DATA_00B1C5:         db $2B, $47, $24, $49, $1A, $1F
DATA_00B1CB:         db $1F, $5C, $49, $4E, $5D, $47
DATA_00B1D1:         db $3A, $3B, $1C, $1A, $1A, $29
DATA_00B1D7:         db $1F, $1A, $38, $1A, $1A, $1A
DATA_00B1DD:         db $2B, $47, $37, $54, $71, $29
DATA_00B1E3:         db $3F, $3C, $66, $1C, $47, $60
DATA_00B1E9:         db $31, $35, $71, $54, $55, $1F
DATA_00B1EF:         db $2E, $1F, $49, $24, $5E, $29
DATA_00B1F5:         db $58, $54, $5E, $1F, $48, $29
DATA_00B1FB:         db $60, $65, $30, $71, $1A, $1A
DATA_00B201:         db $5E, $29, $71, $26, $49, $4B
DATA_00B207:         db $55, $2F, $58, $64, $2C, $59
DATA_00B20D:         db $5E, $24, $1C, $29, $49, $4B
DATA_00B213:         db $27, $25, $38, $49, $2A, $29
DATA_00B219:         db $1F, $36, $4E, $1A, $1A, $1A
DATA_00B21F:         db $4D, $1F, $55, $28, $60, $71
DATA_00B225:         db $2E, $71, $1C, $1A, $1A, $1A
DATA_00B22B:         db $35, $39, $41, $25, $64, $29
DATA_00B231:         db $64, $25, $36, $41, $1A, $29
DATA_00B237:         db $4E, $44, $1A, $3D, $48, $29
DATA_00B23D:         db $5D, $1E, $36, $3D, $25, $48
DATA_00B243:         db $42, $43, $44, $6A, $1A, $1A
DATA_00B249:         db $64, $45, $1A, $1A, $1F, $29
DATA_00B24F:         db $2A, $2B, $38, $6A, $6C, $5E
DATA_00B255:         db $55, $31, $1A, $1A, $1A, $1F
DATA_00B25B:         db $35, $3E, $1C, $3D, $2B, $47
DATA_00B261:         db $2A, $2B, $5E, $63, $1A, $1A
DATA_00B267:         db $24, $1A, $1A, $1A, $1A, $1A
DATA_00B26D:         db $1A, $36, $31, $29, $66, $59
DATA_00B273:         db $40, $3A, $3B, $37, $36, $1A
DATA_00B279:         db $2F, $70, $61, $6A, $1A, $1F
DATA_00B27F:         db $6B, $6C, $1A, $6A, $47, $1F
DATA_00B285:         db $57, $5C, $5D, $24, $1C, $29
DATA_00B28B:         db $1B, $71, $29, $1C, $1F, $5D
DATA_00B291:         db $55, $5C, $5F, $45, $71, $37
DATA_00B297:         db $6F, $6D, $6E, $29, $6A, $1A
DATA_00B29D:         db $55, $6A, $A9, $1A, $1A, $1F
DATA_00B2A3:         db $62, $3C, $4E, $53, $71, $44
DATA_00B2A9:         db $68, $6A, $1A, $1A, $1A, $1A
DATA_00B2AF:         db $1A, $1E, $52, $1F, $71, $29
DATA_00B2B5:         db $5D, $44, $4C, $56, $1A, $1A
DATA_00B2BB:         db $1C, $29, $44, $2A, $71, $4E
DATA_00B2C1:         db $45, $71, $1C, $58, $1A, $1A
DATA_00B2C7:         db $55, $25, $71, $1F, $29, $1C
DATA_00B2CD:         db $5D, $37, $71, $29, $1C, $1A
DATA_00B2D3:         db $45, $6A, $1F, $1A, $1A, $1A
DATA_00B2D9:         db $1F, $64, $41, $53, $3E, $1C
DATA_00B2DF:         db $53, $71, $5D, $1C, $1A, $1A
DATA_00B2E5:         db $36, $1C, $38, $28, $60, $29
DATA_00B2EB:         db $2B, $47, $20, $21, $1C, $71
DATA_00B2F1:         db $20, $21, $2F, $1C, $5D, $47
DATA_00B2F7:         db $27, $35, $41, $54, $64, $68
DATA_00B2FD:         db $1C, $71, $2C, $2D, $1A, $1A
DATA_00B303:         db $6A, $6C, $63, $1A, $1A, $1A
DATA_00B309:         db $22, $23, $45, $60, $1A, $30
DATA_00B30F:         db $67, $3C, $55, $1A, $1A, $29
DATA_00B315:         db $54, $71, $41, $4C, $64, $37
DATA_00B31B:         db $AD, $AE, $AF, $B0, $67, $6A
DATA_00B321:         db $55, $47, $57, $49, $1C, $29
DATA_00B327:         db $27, $2B, $47, $1C, $25, $29
DATA_00B32D:         db $27, $71, $1C, $31, $1A, $1A
DATA_00B333:         db $1C, $45, $1F, $71, $46, $29

load_level_gfx:
CODE_00B339: PHB                                        ;$00B339   | 
CODE_00B33A: PHK                                        ;$00B33A   | 
CODE_00B33B: PLB                                        ;$00B33B   | 
CODE_00B33C: REP #$30                                   ;$00B33C   | 
CODE_00B33E: LDA $0136                                  ;$00B33E   |  \
CODE_00B341: ASL A                                      ;$00B341   |   | load BG1 tileset #
CODE_00B342: ADC $0136                                  ;$00B342   |   | * 3
CODE_00B345: TAY                                        ;$00B345   |  /
CODE_00B346: LDA $0218                                  ;$00B346   |  \  test world #
CODE_00B349: CMP #$000A                                 ;$00B349   |  /  != 6
CODE_00B34C: BNE CODE_00B35A                            ;$00B34C   | 
CODE_00B34E: LDA $AF69,y                                ;$00B34E   |  \
CODE_00B351: STA $10                                    ;$00B351   |   | different
CODE_00B353: LDA $AF6A,y                                ;$00B353   |   | table for
CODE_00B356: STA $11                                    ;$00B356   |   | world 6 BG1
CODE_00B358: BRA CODE_00B364                            ;$00B358   |  /

CODE_00B35A: LDA $AF39,y                                ;$00B35A   |  \  non-world 6
CODE_00B35D: STA $10                                    ;$00B35D   |   | BG1 VRAM files
CODE_00B35F: LDA $AF3A,y                                ;$00B35F   |   | -> $10, $11, $12
CODE_00B362: STA $11                                    ;$00B362   |  /
CODE_00B364: LDA $013A                                  ;$00B364   |  \  load BG2 tileset #
CODE_00B367: ASL A                                      ;$00B367   |  /  * 2
CODE_00B368: TAY                                        ;$00B368   | 
CODE_00B369: LDA $AF99,y                                ;$00B369   |  \  BG2 VRAM files
CODE_00B36C: STA $13                                    ;$00B36C   |  /  -> $13, $14
CODE_00B36E: LDA $013E                                  ;$00B36E   |  \  load BG3 tileset #
CODE_00B371: ASL A                                      ;$00B371   |  /  * 2
CODE_00B372: TAY                                        ;$00B372   | 
CODE_00B373: LDA $AFD9,y                                ;$00B373   |  \  BG3 VRAM files
CODE_00B376: STA $15                                    ;$00B376   |  /  -> $15, $16
CODE_00B378: LDA $0142                                  ;$00B378   |  \
CODE_00B37B: ASL A                                      ;$00B37B   |   | load spriteset #
CODE_00B37C: ADC $0142                                  ;$00B37C   |   | * 6
CODE_00B37F: ASL A                                      ;$00B37F   |   |
CODE_00B380: TAY                                        ;$00B380   |  /
CODE_00B381: LDA $B039,y                                ;$00B381   |  \
CODE_00B384: STA $6EB6                                  ;$00B384   |   | sprite VRAM files
CODE_00B387: STA $17                                    ;$00B387   |   | -> $17, $18, $19,
CODE_00B389: LDA $B03B,y                                ;$00B389   |   |    $1A, $1B, $1C
CODE_00B38C: STA $6EB8                                  ;$00B38C   |   |
CODE_00B38F: STA $19                                    ;$00B38F   |   | also store in
CODE_00B391: LDA $B03D,y                                ;$00B391   |   | $700EB6-EBB
CODE_00B394: STA $6EBA                                  ;$00B394   |   |
CODE_00B397: STA $1B                                    ;$00B397   |  /
CODE_00B399: SEP #$20                                   ;$00B399   | 
CODE_00B39B: LDY #$0000                                 ;$00B39B   | 

; pass in a Y for an $AD6D table offset to begin at
load_compressed_gfx_files:
CODE_00B39E: LDA #$16                                   ;$00B39E   |  \  loop through compressed
CODE_00B3A0: STA $012D                                  ;$00B3A0   |   | chunks of VRAM data in AD6D
CODE_00B3A3: LDA #$3D                                   ;$00B3A3   |   | table
CODE_00B3A5: STA $012E                                  ;$00B3A5   |   | 3 or 5 byte entries
CODE_00B3A8: LDA $AD6D,y                                ;$00B3A8   |   | byte 1: chunk index
CODE_00B3AB: CMP #$F0                                   ;$00B3AB   |   | FF marks done with section
CODE_00B3AD: BCC CODE_00B3C0                            ;$00B3AD   |   |
CODE_00B3AF: CMP #$FF                                   ;$00B3AF   |   | > $F0
CODE_00B3B1: BEQ CODE_00B3CB                            ;$00B3B1   |   | marks it
CODE_00B3B3: SEC                                        ;$00B3B3   |   | as an index into
CODE_00B3B4: SBC #$F0                                   ;$00B3B4   |   | $7E0010 table (tile/spriteset)
CODE_00B3B6: REP #$20                                   ;$00B3B6   |   | this value in table
CODE_00B3B8: AND #$00FF                                 ;$00B3B8   |   | is then used as file index
CODE_00B3BB: TAX                                        ;$00B3BB   |   |
CODE_00B3BC: SEP #$20                                   ;$00B3BC   |   | bytes 2 & 3 (word):
CODE_00B3BE: LDA $10,x                                  ;$00B3BE   |   | VRAM destination address
CODE_00B3C0: LDX $AD6E,y                                ;$00B3C0   |   |
CODE_00B3C3: JSR CODE_00B507                            ;$00B3C3   |   | decompress
CODE_00B3C6: INY                                        ;$00B3C6   |   |
CODE_00B3C7: INY                                        ;$00B3C7   |   | continue looping
CODE_00B3C8: INY                                        ;$00B3C8   |   |
CODE_00B3C9: BRA CODE_00B3A8                            ;$00B3C9   |  /

CODE_00B3CB: SEP #$10                                   ;$00B3CB   | 
CODE_00B3CD: PLB                                        ;$00B3CD   | 
CODE_00B3CE: RTL                                        ;$00B3CE   | 

CODE_00B3CF: PHB                                        ;$00B3CF   | 
CODE_00B3D0: PHK                                        ;$00B3D0   | 
CODE_00B3D1: PLB                                        ;$00B3D1   | 
CODE_00B3D2: LDA #$68                                   ;$00B3D2   | 
CODE_00B3D4: STA $10                                    ;$00B3D4   | 
CODE_00B3D6: LDA $011A                                  ;$00B3D6   | 
CODE_00B3D9: CMP #$80                                   ;$00B3D9   | 
CODE_00B3DB: BEQ CODE_00B3E6                            ;$00B3DB   | 
CODE_00B3DD: LDA $0216                                  ;$00B3DD   | 
CODE_00B3E0: BNE CODE_00B3E6                            ;$00B3E0   | 
CODE_00B3E2: LDA #$1F                                   ;$00B3E2   | 
CODE_00B3E4: STA $10                                    ;$00B3E4   | 
CODE_00B3E6: REP #$10                                   ;$00B3E6   | 
CODE_00B3E8: LDY #$004F                                 ;$00B3E8   | 
CODE_00B3EB: JMP CODE_00B39E                            ;$00B3EB   | 

CODE_00B3EE: PHB                                        ;$00B3EE   | 
CODE_00B3EF: PHK                                        ;$00B3EF   | 
CODE_00B3F0: PLB                                        ;$00B3F0   | 
CODE_00B3F1: JMP CODE_00B39E                            ;$00B3F1   | 

; tilemaps for each world map (2 bytes per world: BG1, BG2)
DATA_00B3F4:         db $7C, $7D
DATA_00B3F6:         db $7F, $80
DATA_00B3F8:         db $81, $82
DATA_00B3FA:         db $83, $84
DATA_00B3FC:         db $85, $86
DATA_00B3FE:         db $87, $88

DATA_00B400:         db $74, $B5, $B7, $75, $B6, $B8, $4C, $6C
DATA_00B408:         db $6D

; GFX for each world map (8 bytes per world)
DATA_00B409:         dw $9A99, $9C9B, $9E9D, $A09F
DATA_00B411:         dw $9A99, $9C9B, $9E9D, $A09F
DATA_00B419:         dw $9A99, $9C9B, $9E9D, $A09F
DATA_00B421:         dw $9A99, $9C9B, $9E9D, $A09F
DATA_00B429:         dw $9A99, $9C9B, $9E9D, $A09F
DATA_00B431:         dw $9A99, $9C9B, $9695, $9897

CODE_00B439: PHB                                        ;$00B439   | 
CODE_00B43A: PHK                                        ;$00B43A   | 
CODE_00B43B: PLB                                        ;$00B43B   | 
CODE_00B43C: LDA #$74                                   ;$00B43C   | 
CODE_00B43E: STA $12                                    ;$00B43E   | 
CODE_00B440: LDA #$75                                   ;$00B440   | 
CODE_00B442: STA $13                                    ;$00B442   | 
CODE_00B444: LDA #$4C                                   ;$00B444   | 
CODE_00B446: STA $14                                    ;$00B446   | 
CODE_00B448: LDY $0218                                  ;$00B448   | 
CODE_00B44B: LDA $B3F4,y                                ;$00B44B   | 
CODE_00B44E: STA $10                                    ;$00B44E   | 
CODE_00B450: LDA $B3F5,y                                ;$00B450   | 
CODE_00B453: STA $11                                    ;$00B453   | 
CODE_00B455: TYA                                        ;$00B455   | 
CODE_00B456: ASL A                                      ;$00B456   | 
CODE_00B457: ASL A                                      ;$00B457   | 
CODE_00B458: TAY                                        ;$00B458   | 
CODE_00B459: LDX #$00                                   ;$00B459   | 
CODE_00B45B: LDA $B409,y                                ;$00B45B   | 
CODE_00B45E: STA $15,x                                  ;$00B45E   | 
CODE_00B460: INY                                        ;$00B460   | 
CODE_00B461: INX                                        ;$00B461   | 
CODE_00B462: CPX #$08                                   ;$00B462   | 
CODE_00B464: BCC CODE_00B45B                            ;$00B464   | 
CODE_00B466: REP #$10                                   ;$00B466   | 
CODE_00B468: LDY #$00A2                                 ;$00B468   | 
CODE_00B46B: JMP CODE_00B39E                            ;$00B46B   | 

DATA_00B46E:         dw $0404, $7904, $0404, $7704
DATA_00B476:         dw $0C04, $040C

DATA_00B47A:         dw $0404, $7A04, $0404, $7804
DATA_00B482:         dw $0405, $0404

DATA_00B486:         dw $9696, $9696, $9897, $9A98
DATA_00B48E:         dw $999B, $9699

DATA_00B492:         dw $9C9C, $9F9C, $9C9C, $A09C
DATA_00B49A:         dw $9CA1, $9C9C

    PHB                 ; $00B49E   |
    PHK                 ; $00B49F   |
    PLB                 ; $00B4A0   |
    LDA $B46E,y         ; $00B4A1   |
    STA $10             ; $00B4A4   |
    LDA $B47A,y         ; $00B4A6   |
    STA $11             ; $00B4A9   |
    LDA $B486,y         ; $00B4AB   |
    STA $12             ; $00B4AE   |
    LDA $B492,y         ; $00B4B0   |
    STA $13             ; $00B4B3   |
    LDA #$4E            ; $00B4B5   |
    STA $6EBA           ; $00B4B7   |
    LDA #$FF            ; $00B4BA   |
    STA $6EB6           ; $00B4BC   |
    STA $6EB7           ; $00B4BF   |
    STA $6EB8           ; $00B4C2   |
    STA $6EB9           ; $00B4C5   |
    STA $6EBB           ; $00B4C8   |
    REP #$10            ; $00B4CB   |
    LDY #$0122          ; $00B4CD   |
    JMP CODE_00B39E     ; $00B4D0   |

    PHB                 ; $00B4D3   |
    PHK                 ; $00B4D4   |
    PLB                 ; $00B4D5   |
    LDX #$2218          ; $00B4D6   |
    LDX #$00BD          ; $00B4D9   |
    LDA #$38            ; $00B4DC   |
    STA $210A           ; $00B4DE   |
    LDA #$67            ; $00B4E1   |
    STA $6EB6           ; $00B4E3   |
    LDA #$3C            ; $00B4E6   |
    STA $6EB7           ; $00B4E8   |
    LDA #$55            ; $00B4EB   |
    STA $6EB8           ; $00B4ED   |
    LDA #$1A            ; $00B4F0   |
    STA $6EB9           ; $00B4F2   |
    LDA #$1A            ; $00B4F5   |
    STA $6EBA           ; $00B4F7   |
    LDA #$29            ; $00B4FA   |
    STA $6EBB           ; $00B4FC   |
    REP #$10            ; $00B4FF   |
    LDY #$018A          ; $00B501   |
    JMP CODE_00B39E     ; $00B504   |

; routine: decompresses LC_LZ16 (?) data file
    STX $0E             ; $00B507   | preserve VRAM dest address
    REP #$20            ; $00B509   |
    AND #$00FF          ; $00B50B   |
    STA $0C             ; $00B50E   |
    ASL A               ; $00B510   |
    ADC $0C             ; $00B511   |
    TAX                 ; $00B513   |
    LDA $0E             ; $00B514   | \
    BPL CODE_00B54D     ; $00B516   |  | VRAM destination address
    LDA $AD70,y         ; $00B518   |  | being >= $8000 signifies
    STA $0A             ; $00B51B   |  | it is 0A8000 decompression instead
    INY                 ; $00B51D   |  | we also have an extra word
    INY                 ; $00B51E   |  | in the AD6D table, they are
    PHY                 ; $00B51F   | /  the size of uncompressed chunk
    ASL A               ; $00B520   | \
    ASL A               ; $00B521   |  | effectively >> 6
    XBA                 ; $00B522   | /
    AND #$00FF          ; $00B523   |
    STA $3006           ; $00B526   |
    LDA $06FC79,x       ; $00B529   | vram data address
    STA $3002           ; $00B52D   |
    LDA $06FC7B,x       ; $00B530   | bank of address
    AND #$00FF          ; $00B534   |
    STA $3000           ; $00B537   |
    SEP #$10            ; $00B53A   |
    LDX #$0A            ; $00B53C   |
    LDA #$8000          ; $00B53E   |
    JSL $7EDE44         ; $00B541   | decompress
    REP #$10            ; $00B545   |
    LDY $0A             ; $00B547   |
    SEP #$20            ; $00B549   |
    BRA CODE_00B582     ; $00B54B   |

; decompresses LC_LZ1 data file

CODE_00B54D:
    PHY                 ; $00B54D   |
    LDA $06F95E,x       ; $00B54E   | \
    STA $3012           ; $00B552   |  |
    LDA $06F960,x       ; $00B555   |  | source address of
    AND #$00FF          ; $00B559   |  | compressed data
    STA $3008           ; $00B55C   | /
    LDA #$5800          ; $00B55F   | \  destination
    STA $3014           ; $00B562   | /
    SEP #$10            ; $00B565   |
    LDX #$08            ; $00B567   |
    LDA #$A980          ; $00B569   |
    JSL $7EDE44         ; $00B56C   | decompression routine
    REP #$10            ; $00B570   |
    LDA $3014           ; $00B572   | \
    SEC                 ; $00B575   |  | end - start = size
    SBC #$5800          ; $00B576   |  | of uncompressed data
    TAY                 ; $00B579   | /
    SEP #$20            ; $00B57A   |
    LDA $0C             ; $00B57C   |
    CMP #$B1            ; $00B57E   |
    BCS CODE_00B5A7     ; $00B580   |

CODE_00B582:
    LDA #$80            ; $00B582   | \
    STA $2115           ; $00B584   |  |
    LDX $0E             ; $00B587   |  | DMA
    STX $2116           ; $00B589   |  | decompressed data
    LDX #$1801          ; $00B58C   |  | to VRAM
    STX $4300           ; $00B58F   |  | destination passed in
    LDX #$5800          ; $00B592   |  | from X, ultimately 
    STX $4302           ; $00B595   |  | from AD6D tables
    LDA #$70            ; $00B598   |  |
    STA $4304           ; $00B59A   |  |
    STY $4305           ; $00B59D   |  |
    LDA #$01            ; $00B5A0   |  |
    STA $420B           ; $00B5A2   | /
    PLY                 ; $00B5A5   |
    RTS                 ; $00B5A6   |

CODE_00B5A7:
    LDX #$0000          ; $00B5A7   |
    CMP #$B9            ; $00B5AA   |
    BEQ CODE_00B5C4     ; $00B5AC   |
    CMP #$BA            ; $00B5AE   |
    BEQ CODE_00B5C4     ; $00B5B0   |
    INX                 ; $00B5B2   |
    INX                 ; $00B5B3   |
    CMP #$BB            ; $00B5B4   |
    BEQ CODE_00B5C4     ; $00B5B6   |
    CMP #$BC            ; $00B5B8   |
    BEQ CODE_00B5C4     ; $00B5BA   |
    INX                 ; $00B5BC   |
    INX                 ; $00B5BD   |
    CMP #$BD            ; $00B5BE   |
    BEQ CODE_00B5C4     ; $00B5C0   |
    INX                 ; $00B5C2   |
    INX                 ; $00B5C3   |

CODE_00B5C4:
    REP #$20            ; $00B5C4   |
    TYA                 ; $00B5C6   |
    STA $00             ; $00B5C7   |
    ASL A               ; $00B5C9   |
    PHA                 ; $00B5CA   |
    SEP #$20            ; $00B5CB   |
    PHB                 ; $00B5CD   |
    LDA #$7E            ; $00B5CE   |
    PHA                 ; $00B5D0   |
    PLB                 ; $00B5D1   |
    REP #$20            ; $00B5D2   |
    JSR ($B601,x)       ; $00B5D4   |

    SEP #$20            ; $00B5D7   |
    PLB                 ; $00B5D9   |
    PLY                 ; $00B5DA   |
    LDA $00             ; $00B5DB   |
    BEQ CODE_00B5FF     ; $00B5DD   |
    STA $2115           ; $00B5DF   |
    LDX $0E             ; $00B5E2   |
    STX $2116           ; $00B5E4   |
    LDX $02             ; $00B5E7   |
    STX $4300           ; $00B5E9   |
    LDX #$7BBE          ; $00B5EC   |
    STX $4302           ; $00B5EF   |
    LDA #$7E            ; $00B5F2   |
    STA $4304           ; $00B5F4   |
    STY $4305           ; $00B5F7   |
    LDA #$01            ; $00B5FA   |
    STA $420B           ; $00B5FC   |

CODE_00B5FF:
    PLY                 ; $00B5FF   |
    RTS                 ; $00B600   |

DATA_00B601:         dw $B609, $B6B7, $B70B, $B609

    LDX #$0000          ; $00B609   |
    LDY #$0000          ; $00B60C   |

CODE_00B60F:
    LDA $705800,x       ; $00B60F   |
    PHA                 ; $00B613   |
    AND #$000F          ; $00B614   |
    STA $7BBE,y         ; $00B617   |
    INY                 ; $00B61A   |
    PLA                 ; $00B61B   |
    AND #$00F0          ; $00B61C   |
    LSR A               ; $00B61F   |
    LSR A               ; $00B620   |
    LSR A               ; $00B621   |
    LSR A               ; $00B622   |
    STA $7BBE,y         ; $00B623   |
    INX                 ; $00B626   |
    INY                 ; $00B627   |
    DEC $00             ; $00B628   |
    BNE CODE_00B60F     ; $00B62A   |
    LDA #$0080          ; $00B62C   |
    STA $00             ; $00B62F   |
    LDA #$1900          ; $00B631   |
    STA $02             ; $00B634   |
    RTS                 ; $00B636   |

DATA_00B637:         dw $0000, $0000, $0000, $0000
DATA_00B63F:         dw $0000, $1010, $1010, $1010
DATA_00B647:         dw $2010, $2020, $2020, $3020
DATA_00B64F:         dw $3030, $3030, $3030, $3030
DATA_00B657:         dw $3030, $3030, $3030, $3030
DATA_00B65F:         dw $3030, $3030, $3030, $3030
DATA_00B667:         dw $3030, $3030, $3030, $3030
DATA_00B66F:         dw $3030, $3030, $3030, $3030

DATA_00B677:         dw $3030, $3030, $4040, $4040
DATA_00B67F:         dw $4040, $4040, $4040, $4040
DATA_00B687:         dw $4040, $4040, $4040, $4040
DATA_00B68F:         dw $4040, $4040, $4040, $4040
DATA_00B697:         dw $4040, $4040, $4040, $4040
DATA_00B69F:         dw $4040, $4040, $4040, $4040
DATA_00B6A7:         dw $4040, $4040, $4040, $4040
DATA_00B6AF:         dw $4040, $4040, $4040, $4040

    LDA #$0000          ; $00B6B7   |
    STA $04             ; $00B6BA   |
    LDX #$B637          ; $00B6BC   |
    LDA $0C             ; $00B6BF   |
    CMP #$00BC          ; $00B6C1   |
    BNE CODE_00B6C9     ; $00B6C4   |
    LDX #$B677          ; $00B6C6   |

CODE_00B6C9:
    STX $02             ; $00B6C9   |
    LDX #$0000          ; $00B6CB   |
    TXY                 ; $00B6CE   |
    LDA #$0020          ; $00B6CF   |
    STA $06             ; $00B6D2   |

CODE_00B6D4:
    LDA $705800,x       ; $00B6D4   |
    AND #$00FF          ; $00B6D8   |
    PHA                 ; $00B6DB   |
    AND #$000F          ; $00B6DC   |
    ORA [$02]           ; $00B6DF   |
    STA $7BBE,y         ; $00B6E1   |
    INY                 ; $00B6E4   |
    PLA                 ; $00B6E5   |
    LSR A               ; $00B6E6   |
    LSR A               ; $00B6E7   |
    LSR A               ; $00B6E8   |
    LSR A               ; $00B6E9   |
    ORA [$02]           ; $00B6EA   |
    STA $7BBE,y         ; $00B6EC   |
    INY                 ; $00B6EF   |
    INX                 ; $00B6F0   |
    DEC $06             ; $00B6F1   |
    BNE CODE_00B6FC     ; $00B6F3   |
    LDA #$0020          ; $00B6F5   |
    STA $06             ; $00B6F8   |
    INC $02             ; $00B6FA   |

CODE_00B6FC:
    DEC $00             ; $00B6FC   |
    BNE CODE_00B6D4     ; $00B6FE   |
    LDA #$0080          ; $00B700   |
    STA $00             ; $00B703   |
    LDA #$1900          ; $00B705   |
    STA $02             ; $00B708   |
    RTS                 ; $00B70A   |

    PHB                 ; $00B70B   |
    PHK                 ; $00B70C   |
    PLB                 ; $00B70D   |
    SEP #$10            ; $00B70E   |
    LDX #$00            ; $00B710   |
    STX $2115           ; $00B712   |
    LDX #$70            ; $00B715   |
    STX $4304           ; $00B717   |
    LDA #$1800          ; $00B71A   |
    STA $4300           ; $00B71D   |
    LDA #$5800          ; $00B720   |
    STA $00             ; $00B723   |
    LDX #$40            ; $00B725   |
    LDY #$01            ; $00B727   |

CODE_00B729:
    LDA $0E             ; $00B729   |
    STA $2116           ; $00B72B   |
    LDA $00             ; $00B72E   |
    STA $4302           ; $00B730   |
    LDA #$0040          ; $00B733   |
    STA $4305           ; $00B736   |
    STY $420B           ; $00B739   |
    LDA $0E             ; $00B73C   |
    CLC                 ; $00B73E   |
    ADC #$0080          ; $00B73F   |
    STA $0E             ; $00B742   |
    LDA $00             ; $00B744   |
    CLC                 ; $00B746   |
    ADC #$0040          ; $00B747   |
    STA $00             ; $00B74A   |
    DEX                 ; $00B74C   |
    BNE CODE_00B729     ; $00B74D   |
    REP #$10            ; $00B74F   |
    PLB                 ; $00B751   |
    RTS                 ; $00B752   |

; decompress graphics LC_LZ1
    LDX #$6800          ; $00B753   |
    STA $6000           ; $00B756   |
    ASL A               ; $00B759   |
    ADC $6000           ; $00B75A   |
    STX $6000           ; $00B75D   |
    STX $3014           ; $00B760   |
    TAX                 ; $00B763   |
    LDA $06F95E,x       ; $00B764   |
    STA $3012           ; $00B768   |
    LDA $06F960,x       ; $00B76B   |
    AND #$00FF          ; $00B76F   |
    STA $3008           ; $00B772   |
    SEP #$10            ; $00B775   |
    LDX #$08            ; $00B777   |
    LDA #$A980          ; $00B779   |
    JSL $7EDE44         ; $00B77C   | decompression routine
    REP #$10            ; $00B780   |
    LDA $3014           ; $00B782   |
    SEC                 ; $00B785   |
    SBC $6000           ; $00B786   |
    RTL                 ; $00B789   |

; screen palette tables begin
; split up into two-word entries, ending in $FFFF
; format of entries:
; RRRRRRRR RRRRRRRR dddddddd llllssss
; R = ROM (source) offset from $3FA000
; if negative, lop off sign bit and use as index into $7E0010 (dynamic)
; d = starting destination offset into CGRAM mirror table
; NOTE: d is a word address so * 2
; l = # of loops separated by $20 dest, source keeps counting
; s = size, # of words to copy per loop

; $00: in level
DATA_00B78A:         dw $027C, $3B11, $01C8, $5F81
DATA_00B792:         dw $8000, $1100, $8006, $1F01
DATA_00B79A:         dw $8002, $2F41, $800A, $341C
DATA_00B7A2:         dw $8004, $2F61, $8008, $2FE1
DATA_00B7AA:         dw $800C, $1FD1, $FFFF

; $26: Yoshi's Island (file selection screen, end world cutscenes) & credits?
DATA_00B7B0:         dw $2860, $4F31, $28D8, $1F21
DATA_00B7B8:         dw $2860, $4FB1, $8000, $1100
DATA_00B7C0:         dw $8002, $2F01, $8004, $1FF1
DATA_00B7C8:         dw $FFFF

; $40: Nintendo Presents
DATA_00B7CA:         dw $0130, $1100, $01C8, $1F81
DATA_00B7D2:         dw $FFFF

; $4A: toadies death cinematic
DATA_00B7D4:         dw $28F6, $2FE1, $FFFF

; $50: intro cinematic
DATA_00B7DA:         dw $2DDC, $1100, $2DDC, $2F01
DATA_00B7E2:         dw $30AC, $1F21, $328C, $1F31
DATA_00B7EA:         dw $2E18, $3F41, $346C, $1F81
DATA_00B7F2:         dw $2ECC, $7F91, $FFFF

; $6E: map screen
DATA_00B7F8:         dw $8000, $1100, $8002, $1F01
DATA_00B800:         dw $8004, $1F11, $8006, $1F21
DATA_00B808:         dw $8008, $1F71, $2860, $4F31
DATA_00B810:         dw $2860, $4F81, $3F4C, $2FC1
DATA_00B818:         dw $3DC6, $2FE1, $FFFF

; $94: bonus games
DATA_00B81E:         dw $401A, $1100, $8000, $3F01
DATA_00B826:         dw $8002, $1F71, $01C8, $6F81
DATA_00B82E:         dw $8004, $4F31, $8006, $4F91
DATA_00B836:         dw $3FFC, $1F51, $3FFC, $1FB1
DATA_00B83E:         dw $8008, $1FD1, $01C8, $2FE1
DATA_00B846:         dw $0222, $1FE1, $FFFF

; $C2: minigames
DATA_00B84E:         dw $2148, $1F01, $027C, $3B11
DATA_00B856:         dw $4354, $4F41, $01C8, $6F81
DATA_00B85E:         dw $8000, $1FD1, $FFFF

; $D8: 6-8 kamek autoscroll section
DATA_00B862:         dw $586E, $8F01, $01C8, $5F81
DATA_00B86A:         dw $8000, $1FD1, $8002, $2FE1
DATA_00B872:         dw $FFFF
; end screen palette tables

; foreground palette pointers (worlds 1-5)
DATA_00B874:         dw $067E, $06D2, $0726, $077A
DATA_00B87C:         dw $07CE, $0822, $0876, $08CA
DATA_00B884:         dw $091E, $0972, $09C6, $0A1A
DATA_00B88C:         dw $0A6E, $0AC2, $0B16, $0B6A
DATA_00B894:         dw $0BBE, $0C12, $0C66, $0CBA
DATA_00B89C:         dw $0D0E, $0D62, $0DB6, $0E0A
DATA_00B8A4:         dw $0E5E, $0EB2, $0F06, $0F5A
DATA_00B8AC:         dw $0FAE, $1002, $1056, $10AA

; foreground palette pointers (world 6)
DATA_00B8B4:         dw $067E, $0BBE, $0726, $077A
DATA_00B8BC:         dw $07CE, $0822, $0876, $08CA
DATA_00B8C4:         dw $091E, $0972, $09C6, $0A1A
DATA_00B8CC:         dw $0A6E, $0AC2, $0B16, $0B6A
DATA_00B8D4:         dw $0BBE, $0C12, $0C66, $0CBA
DATA_00B8DC:         dw $0D0E, $0D62, $0DB6, $0E0A
DATA_00B8E4:         dw $0E5E, $0EB2, $0F06, $0F5A
DATA_00B8EC:         dw $0FAE, $1002, $1056, $10AA

; layer 2 object palette pointers?
DATA_00B8F4:         dw $12A2, $11EE, $113A, $10FE
DATA_00B8FC:         dw $11B2, $1176, $1266, $122A
DATA_00B904:         dw $12DE, $1356, $1392, $13CE
DATA_00B90C:         dw $140A, $1446, $1482, $14BE
DATA_00B914:         dw $1356, $10FE, $1176, $14FA
DATA_00B91C:         dw $1536, $1572, $1662, $1662
DATA_00B924:         dw $15AE, $15EA, $1626, $16DA
DATA_00B92C:         dw $169E, $1716, $1752, $178E
DATA_00B934:         dw $187E, $18BA, $18F6, $1932
DATA_00B93C:         dw $196E, $19AA, $19E6, $1A22
DATA_00B944:         dw $1A5E, $1A9A, $1AD6, $1B12
DATA_00B94C:         dw $1B4E, $1B8A, $1BC6, $1C02
DATA_00B954:         dw $1C3E, $1C7A, $1CB6, $1CF2
DATA_00B95C:         dw $1D2E, $1D6A, $1DA6, $1DE2
DATA_00B964:         dw $1E1E, $1E5A, $1E96, $1ED2
DATA_00B96C:         dw $1F0E, $1F4A, $1F86, $1FC2

; layer 3 object palette pointers?
DATA_00B974:         dw $1FFE, $201C, $203A, $2058
DATA_00B97C:         dw $2076, $2094, $20B2, $20D0
DATA_00B984:         dw $2166, $210C, $212A, $2148
DATA_00B98C:         dw $20EE, $2184, $21A2, $21C0
DATA_00B994:         dw $21DE, $21FC, $221A, $2238
DATA_00B99C:         dw $2256, $2274, $2292, $22B0
DATA_00B9A4:         dw $22CE, $22EC, $230A, $2328
DATA_00B9AC:         dw $2346, $2364, $2382, $23A0
DATA_00B9B4:         dw $23BE, $23DC, $23FA, $2418
DATA_00B9BC:         dw $2436, $2454, $2472, $2490
DATA_00B9C4:         dw $24AE, $24CC, $24EA, $2508
DATA_00B9CC:         dw $2526, $2544, $2562, $2580
DATA_00B9D4:         dw $259E, $25BC, $25DA, $25F8
DATA_00B9DC:         dw $2616, $2634, $2652, $2670
DATA_00B9E4:         dw $268E, $26AC, $26CA, $26E8
DATA_00B9EC:         dw $2706, $2724, $2742, $2760

; sprite palette pointers?
DATA_00B9F4:         dw $02BE, $02FA, $0336, $0372
DATA_00B9FC:         dw $03AE, $03EA, $0426, $0462
DATA_00BA04:         dw $049E, $04DA, $0516, $0552
DATA_00BA0C:         dw $058E, $05CA, $0606, $0642

; relative pointers to each yoshi's palette
DATA_00BA14:         dw $0040, $005E, $007C, $009A
DATA_00BA1C:         dw $00B8, $00D6, $00F4, $0112

.load_level_palettes
    PHK                 ; $00BA25   |
    PLB                 ; $00BA26   |
    REP #$30            ; $00BA27   |
    LDA $0134           ; $00BA29   |
    ASL A               ; $00BA2C   |
    ADC #$0130          ; $00BA2D   |
    STA $10             ; $00BA30   |
    LDA $0138           ; $00BA32   |
    ASL A               ; $00BA35   |
    TAY                 ; $00BA36   |
    LDA $0218           ; $00BA37   |
    CMP #$000A          ; $00BA3A   |
    BNE CODE_00BA44     ; $00BA3D   |
    LDA $B8B4,y         ; $00BA3F   |
    BRA CODE_00BA47     ; $00BA42   |

CODE_00BA44:
    LDA $B874,y         ; $00BA44   |

CODE_00BA47:
    STA $12             ; $00BA47   |
    CLC                 ; $00BA49   |
    ADC #$003C          ; $00BA4A   |
    STA $1A             ; $00BA4D   |
    LDA $013C           ; $00BA4F   |
    ASL A               ; $00BA52   |
    TAY                 ; $00BA53   |
    LDA $B8F4,y         ; $00BA54   |
    STA $14             ; $00BA57   |
    LDA $0140           ; $00BA59   |
    ASL A               ; $00BA5C   |
    TAY                 ; $00BA5D   |
    LDA $B974,y         ; $00BA5E   |
    STA $16             ; $00BA61   |
    LDA $0144           ; $00BA63   |
    ASL A               ; $00BA66   |
    TAY                 ; $00BA67   |
    LDA $B9F4,y         ; $00BA68   |
    STA $18             ; $00BA6B   |
    LDA $0383           ; $00BA6D   |
    ASL A               ; $00BA70   |
    TAY                 ; $00BA71   |
    LDA $BA14,y         ; $00BA72   |
    STA $1C             ; $00BA75   |
    LDX #$0000          ; $00BA77   |

; loads a set of palettes from ROM into CGRAM
.load_palettes
CODE_00BA7A: LDA #$A000                                 ;$00BA7A   | 
CODE_00BA7D: STA $00                                    ;$00BA7D   | 
CODE_00BA7F: LDA #$5FA0                                 ;$00BA7F   | 
CODE_00BA82: STA $01                                    ;$00BA82   | 
CODE_00BA84: LDA $B78A,x                                ;$00BA84   | 
CODE_00BA87: BPL CODE_00BA95                            ;$00BA87   | 
CODE_00BA89: CMP #$FFFF                                 ;$00BA89   | 
CODE_00BA8C: BEQ CODE_00BADE                            ;$00BA8C   | 
CODE_00BA8E: AND #$7FFF                                 ;$00BA8E   | 
CODE_00BA91: TAY                                        ;$00BA91   | 
CODE_00BA92: LDA $0010,y                                ;$00BA92   | 
CODE_00BA95: TAY                                        ;$00BA95   | 
CODE_00BA96: LDA $B78D,x                                ;$00BA96   | 
CODE_00BA99: AND #$000F                                 ;$00BA99   | 
CODE_00BA9C: STA $03                                    ;$00BA9C   | 
CODE_00BA9E: LDA $B78D,x                                ;$00BA9E   | 
CODE_00BAA1: AND #$00F0                                 ;$00BAA1   | 
CODE_00BAA4: LSR A                                      ;$00BAA4   | 
CODE_00BAA5: LSR A                                      ;$00BAA5   | 
CODE_00BAA6: LSR A                                      ;$00BAA6   | 
CODE_00BAA7: LSR A                                      ;$00BAA7   | 
CODE_00BAA8: STA $05                                    ;$00BAA8   | 
CODE_00BAAA: LDA $B78C,x                                ;$00BAAA   | 
CODE_00BAAD: AND #$00FF                                 ;$00BAAD   | 
CODE_00BAB0: ASL A                                      ;$00BAB0   | 
CODE_00BAB1: STA $07                                    ;$00BAB1   | 
CODE_00BAB3: PHX                                        ;$00BAB3   | 
CODE_00BAB4: TAX                                        ;$00BAB4   | 
CODE_00BAB5: LDA $03                                    ;$00BAB5   | 
CODE_00BAB7: STA $09                                    ;$00BAB7   | 
CODE_00BAB9: LDA [$00],y                                ;$00BAB9   | 
CODE_00BABB: STA $702000,x                              ;$00BABB   | 
CODE_00BABF: STA $702D6C,x                              ;$00BABF   | 
CODE_00BAC3: INY                                        ;$00BAC3   | 
CODE_00BAC4: INY                                        ;$00BAC4   | 
CODE_00BAC5: INX                                        ;$00BAC5   | 
CODE_00BAC6: INX                                        ;$00BAC6   | 
CODE_00BAC7: DEC $09                                    ;$00BAC7   | 
CODE_00BAC9: BNE CODE_00BAB9                            ;$00BAC9   | 
CODE_00BACB: LDA $07                                    ;$00BACB   | 
CODE_00BACD: CLC                                        ;$00BACD   | 
CODE_00BACE: ADC #$0020                                 ;$00BACE   | 
CODE_00BAD1: STA $07                                    ;$00BAD1   | 
CODE_00BAD3: DEC $05                                    ;$00BAD3   | 
CODE_00BAD5: BNE CODE_00BAB4                            ;$00BAD5   | 
CODE_00BAD7: PLX                                        ;$00BAD7   | 
CODE_00BAD8: INX                                        ;$00BAD8   | 
CODE_00BAD9: INX                                        ;$00BAD9   | 
CODE_00BADA: INX                                        ;$00BADA   | 
CODE_00BADB: INX                                        ;$00BADB   | 
CODE_00BADC: BRA CODE_00BA84                            ;$00BADC   | 

CODE_00BADE: SEP #$30                                   ;$00BADE   | 
CODE_00BAE0: PLB                                        ;$00BAE0   | 
CODE_00BAE1: RTL                                        ;$00BAE1   | 

DATA_00BAE2:	     db $3C,$29,$7A,$29,$AE,$2C,$CC,$2C

CODE_00BAEA: PHB                                        ;$00BAEA   | 
CODE_00BAEB: PHK                                        ;$00BAEB   | 
CODE_00BAEC: PLB                                        ;$00BAEC   | 
CODE_00BAED: REP #$20                                   ;$00BAED   | 
CODE_00BAEF: LDA $BAE2,x                                ;$00BAEF   | 
CODE_00BAF2: STA $10                                    ;$00BAF2   | 
CODE_00BAF4: INC A                                      ;$00BAF4   | 
CODE_00BAF5: INC A                                      ;$00BAF5   | 
CODE_00BAF6: STA $12                                    ;$00BAF6   | 
CODE_00BAF8: LDA $BAE6,x                                ;$00BAF8   | 
CODE_00BAFB: STA $14                                    ;$00BAFB   | 
CODE_00BAFD: REP #$10                                   ;$00BAFD   | 
CODE_00BAFF: LDX #$0026                                 ;$00BAFF   | 
CODE_00BB02: JMP CODE_00BA7A                            ;$00BB02   | 

CODE_00BB05: PHB                                        ;$00BB05   | 
CODE_00BB06: PHK                                        ;$00BB06   | 
CODE_00BB07: PLB                                        ;$00BB07   | 
CODE_00BB08: JMP CODE_00BA7A                            ;$00BB08   | 

DATA_00BB0B:         dw $3ADE, $3B5A, $3BD6
DATA_00BB11:         dw $3C52, $3CCE, $3D4A

; palette pointer for each world map (4 pointers per world)
DATA_00BB17:         dw $3AE2, $3B00, $3B1E, $3B3C
DATA_00BB1F:         dw $3B5E, $3B7C, $3B9A, $3BB8
DATA_00BB27:         dw $3BDA, $3BF8, $3C16, $3C34
DATA_00BB2F:         dw $3C56, $3C74, $3C92, $3CB0
DATA_00BB37:         dw $3CD2, $3CF0, $3D0E, $3D2C
DATA_00BB3F:         dw $3D4E, $3D6C, $3D8A, $3DA8

    PHB                 ; $00BB47   |
    PHK                 ; $00BB48   |
    PLB                 ; $00BB49   |
    LDX $0218           ; $00BB4A   |
    LDA $BB0B,x         ; $00BB4D   |
    STA $10             ; $00BB50   |
    TXA                 ; $00BB52   |
    ASL A               ; $00BB53   |
    ASL A               ; $00BB54   |
    TAX                 ; $00BB55   |
    LDA $BB17,x         ; $00BB56   |
    STA $12             ; $00BB59   |
    LDA $BB19,x         ; $00BB5B   |
    STA $14             ; $00BB5E   |
    LDA $BB1B,x         ; $00BB60   |
    STA $16             ; $00BB63   |
    LDA $BB1D,x         ; $00BB65   |
    STA $18             ; $00BB68   |
    LDX #$006E          ; $00BB6A   |
    JMP CODE_00BA7A     ; $00BB6D   |

    PHB                 ; $00BB70   |
    PHK                 ; $00BB71   |
    PLB                 ; $00BB72   |
    LDA #$7F94          ; $00BB73   |
    STA $0948           ; $00BB76   |
    LDA #$0000          ; $00BB79   |
    STA $702000         ; $00BB7C   |
    LDA $0383           ; $00BB80   |
    ASL A               ; $00BB83   |
    TAX                 ; $00BB84   |
    LDA $BA14,x         ; $00BB85   |
    STA $10             ; $00BB88   |
    LDX #$00C2          ; $00BB8A   |
    JMP CODE_00BA7A     ; $00BB8D   |

    PHB                 ; $00BB90   |
    PHK                 ; $00BB91   |
    PLB                 ; $00BB92   |
    REP #$30            ; $00BB93   |
    LDA $0383           ; $00BB95   |
    ASL A               ; $00BB98   |
    TAY                 ; $00BB99   |
    LDA $BA14,y         ; $00BB9A   |
    STA $10             ; $00BB9D   |
    LDA $0144           ; $00BB9F   |
    ASL A               ; $00BBA2   |
    TAY                 ; $00BBA3   |
    LDA $B9F4,y         ; $00BBA4   |
    STA $12             ; $00BBA7   |
    LDX #$00D8          ; $00BBA9   |
    JMP CODE_00BA7A     ; $00BBAC   |

DATA_00BBAF:         dw $0000, $0014, $0028, $003C
DATA_00BBB7:         dw $0050, $0064, $0078, $008C
DATA_00BBBF:         dw $00A0, $00B4, $00C8, $00DC
DATA_00BBC7:         dw $00F0, $0104, $0118, $012C
DATA_00BBCF:         dw $0140, $0154, $0168, $01A4
DATA_00BBD7:         dw $017C, $0190

DATA_00BBDB:         db $05, $07, $08, $09, $0B, $0C, $23, $24
DATA_00BBE3:         db $25, $2C, $2D, $2E, $2F, $30, $31

; 20-byte chunks of data
DATA_00BBEA:         db $06, $00, $0A, $1D, $00, $10, $3C, $3C, $3C, $22
DATA_00BBF4:         db $22, $32, $00, $00, $13, $00, $00, $00, $00, $3F

DATA_00BBFE:         db $00, $00, $16, $3D, $00, $01, $70, $74, $78, $00
DATA_00BC08:         db $06, $00, $00, $00, $13, $00, $00, $00, $00, $00

DATA_00BC12:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC1C:         db $02, $00, $00, $00, $17, $00, $00, $00, $22, $20

DATA_00BC26:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC30:         db $02, $00, $00, $00, $14, $03, $00, $00, $22, $20

DATA_00BC3A:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC44:         db $02, $00, $00, $00, $13, $04, $00, $00, $22, $B3

DATA_00BC4E:         db $04, $00, $16, $3D, $01, $22, $69, $3A, $34, $77
DATA_00BC58:         db $02, $00, $00, $00, $11, $02, $00, $00, $22, $20

DATA_00BC62:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC6C:         db $02, $00, $00, $00, $13, $14, $00, $00, $22, $72

DATA_00BC76:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC80:         db $02, $00, $00, $00, $15, $02, $00, $00, $22, $20

DATA_00BC8A:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BC94:         db $02, $00, $00, $00, $15, $02, $00, $00, $22, $24

DATA_00BC9E:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BCA8:         db $02, $00, $00, $00, $11, $06, $00, $00, $22, $20

DATA_00BCB2:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BCBC:         db $02, $00, $00, $00, $13, $00, $00, $00, $22, $20

DATA_00BCC6:         db $0A, $00, $16, $3D, $01, $07, $00, $00, $00, $00
DATA_00BCD0:         db $00, $00, $00, $00, $11, $04, $00, $00, $22, $20

DATA_00BCDA:         db $02, $00, $16, $3D, $01, $00, $69, $28, $30, $77
DATA_00BCE4:         db $77, $00, $00, $00, $1F, $00, $00, $00, $02, $20

DATA_00BCEE:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BCF8:         db $02, $00, $00, $00, $11, $06, $00, $00, $22, $20

DATA_00BD02:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BD0C:         db $02, $00, $00, $00, $15, $00, $00, $00, $22, $20

DATA_00BD16:         db $02, $00, $16, $3D, $01, $59, $3A, $69, $34, $77
DATA_00BD20:         db $02, $00, $00, $00, $05, $12, $00, $00, $22, $45

DATA_00BD2A:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BD34:         db $02, $00, $00, $00, $13, $04, $00, $00, $22, $B3

DATA_00BD3E:         db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77
DATA_00BD48:         db $02, $00, $00, $00, $04, $13, $00, $00, $22, $24

DATA_00BD52:         db $08, $02, $16, $3D, $01, $09, $61, $69, $74, $00
DATA_00BD5C:         db $77, $00, $30, $00, $15, $02, $0A, $02, $02, $20

DATA_00BD66:         db $0C, $00, $16, $1D, $00, $01, $1C, $1C, $15, $22
DATA_00BD70:         db $01, $32, $00, $80, $17, $00, $00, $00, $10, $00

DATA_00BD7A:         db $0E, $06, $16, $3D, $01, $41, $6A, $3A, $34, $77
DATA_00BD84:         db $02, $00, $00, $A0, $17, $00, $10, $00, $20, $94

DATA_00BD8E:         db $08, $04, $07, $1B, $00, $03, $50, $5C, $00, $50
DATA_00BD98:         db $00, $00, $00, $00, $13, $00, $00, $00, $00, $00

; subroutine of sorts probably
CODE_00BDA2: PHB                                        ;$00BDA2   | 
CODE_00BDA3: PHK                                        ;$00BDA3   | 
CODE_00BDA4: PLB                                        ;$00BDA4   | 
CODE_00BDA5: REP #$10                                   ;$00BDA5   | 
CODE_00BDA7: LDY $BBAF,x                                ;$00BDA7   | 
CODE_00BDAA: LDA $BBEA,y                                ;$00BDAA   | 
CODE_00BDAD: STA $011C                                  ;$00BDAD   | 
CODE_00BDB0: LDA $BBEB,y                                ;$00BDB0   | 
CODE_00BDB3: STA $0126                                  ;$00BDB3   | 
CODE_00BDB6: LDA $BBEC,y                                ;$00BDB6   | 
CODE_00BDB9: STA $012D                                  ;$00BDB9   | 
CODE_00BDBC: LDA $BBED,y                                ;$00BDBC   | 
CODE_00BDBF: STA $012E                                  ;$00BDBF   | 
CODE_00BDC2: LDA $BBEE,y                                ;$00BDC2   | 
CODE_00BDC5: BEQ CODE_00BDE5                            ;$00BDC5   | 
CODE_00BDC7: REP #$20                                   ;$00BDC7   | 
CODE_00BDC9: LDA $702000                                ;$00BDC9   | 
CODE_00BDCD: STA $0948                                  ;$00BDCD   | 
CODE_00BDD0: STA $702020                                ;$00BDD0   | 
CODE_00BDD4: STA $702D8C                                ;$00BDD4   | 
CODE_00BDD8: LDA #$0000                                 ;$00BDD8   | 
CODE_00BDDB: STA $702000                                ;$00BDDB   | 
CODE_00BDDF: STA $702D6C                                ;$00BDDF   | 
CODE_00BDE3: SEP #$20                                   ;$00BDE3   | 
CODE_00BDE5: LDX #$0000                                 ;$00BDE5   | 
CODE_00BDE8: LDA $BBEF,y                                ;$00BDE8   | 
CODE_00BDEB: STA $095E,x                                ;$00BDEB   | 
CODE_00BDEE: INY                                        ;$00BDEE   | 
CODE_00BDEF: INX                                        ;$00BDEF   | 
CODE_00BDF0: CPX #$000F                                 ;$00BDF0   | 
CODE_00BDF3: BCC CODE_00BDE8                            ;$00BDF3   | 
CODE_00BDF5: STZ $094A                                  ;$00BDF5   | 
CODE_00BDF8: STZ $210A                                  ;$00BDF8   | 
CODE_00BDFB: LDY #$2100                                 ;$00BDFB   | 
CODE_00BDFE: STY $00                                    ;$00BDFE   | 
CODE_00BE00: SEP #$10                                   ;$00BE00   | 
CODE_00BE02: LDX #$0E                                   ;$00BE02   | 
CODE_00BE04: LDY $BBDB,x                                ;$00BE04   | 
CODE_00BE07: LDA $095E,x                                ;$00BE07   | 
CODE_00BE0A: STA ($00),y                                ;$00BE0A   | 
CODE_00BE0C: DEX                                        ;$00BE0C   | 
CODE_00BE0D: BPL CODE_00BE04                            ;$00BE0D   | 
CODE_00BE0F: REP #$20                                   ;$00BE0F   | 
CODE_00BE11: STZ $094C                                  ;$00BE11   | 
CODE_00BE14: STZ $212A                                  ;$00BE14   | 
CODE_00BE17: SEP #$20                                   ;$00BE17   | 
CODE_00BE19: LDA #$02                                   ;$00BE19   | 
CODE_00BE1B: STA $094B                                  ;$00BE1B   | 
CODE_00BE1E: STA $2101                                  ;$00BE1E   | 
CODE_00BE21: STZ $2133                                  ;$00BE21   | 
CODE_00BE24: PLB                                        ;$00BE24   | 
CODE_00BE25: RTL                                        ;$00BE25   | 

CODE_00BE26: REP #$30                                   ;$00BE26   | 
CODE_00BE28: PHB                                        ;$00BE28   | \
CODE_00BE29: LDY #$2200                                 ;$00BE29   |  |
CODE_00BE2C: LDX #$E552                                 ;$00BE2C   |  | move $00E552~$00E952 to $702200~$7025FF
CODE_00BE2F: LDA #$03FF                                 ;$00BE2F   |  |
CODE_00BE32: MVN 00 70                                  ;$00BE32   |  |
CODE_00BE35: PLB                                        ;$00BE35   | /
CODE_00BE36: SEP #$30                                   ;$00BE36   | 
CODE_00BE38: RTL                                        ;$00BE38   | 

; subroutine
; the four words following a call to this routine are passed-in arguments
; after storing the arguments, the sub adds 8 to the return address and jumps back
; arguments are stored, indexed by $096D, as follows:
; fourth word -> $096F,x
; first word -> $0971,x
; second word -> $0973,x
; third word -> $0975,x
; #$0000 -> $0977,x
; this is a way of setting up a DMA used by $00DE0C, the format of the arguments is actually:
; DDDDDD SSSSSS ssss
; D = long destination address
; S = long source address
; s = size
CODE_00BE39: PHP                                        ;$00BE39   | 
CODE_00BE3A: REP #$30                                   ;$00BE3A   | 
CODE_00BE3C: LDX $096D                                  ;$00BE3C   |  argument store index
CODE_00BE3F: LDA $02,s                                  ;$00BE3F   | \ return address as index
CODE_00BE41: TAY                                        ;$00BE41   | /
CODE_00BE42: LDA $0007,y                                ;$00BE42   | \
CODE_00BE45: STA $096F,x                                ;$00BE45   | / last word passed in
CODE_00BE48: LDA $0001,y                                ;$00BE48   | \
CODE_00BE4B: STA $0971,x                                ;$00BE4B   | / first word passed in
CODE_00BE4E: LDA $0003,y                                ;$00BE4E   | \
CODE_00BE51: STA $0973,x                                ;$00BE51   | / second word passed in
CODE_00BE54: LDA $0005,y                                ;$00BE54   | \
CODE_00BE57: STA $0975,x                                ;$00BE57   | / third word passed in
CODE_00BE5A: LDA #$0000                                 ;$00BE5A   | 
CODE_00BE5D: STA $0977,x                                ;$00BE5D   | 
CODE_00BE60: TXA                                        ;$00BE60   | 
CODE_00BE61: CLC                                        ;$00BE61   | 
CODE_00BE62: ADC #$0008                                 ;$00BE62   | \ offset argument store index
CODE_00BE65: STA $096D                                  ;$00BE65   | /
CODE_00BE68: TYA                                        ;$00BE68   | 
CODE_00BE69: CLC                                        ;$00BE69   | 
CODE_00BE6A: ADC #$0008                                 ;$00BE6A   | 
CODE_00BE6D: STA $02,s                                  ;$00BE6D   |  adds 8 to return address
CODE_00BE6F: PLP                                        ;$00BE6F   | 
CODE_00BE70: RTL                                        ;$00BE70   | 

; subroutine
; the three words following a call to this sub are passed-in arguments
; the accumulator is also passed in
; after storing the arguments, the sub adds 6 to the return address and jumps back
; arguments are stored, indexed by $096D, as follows:
; accumulator -> $096F,x
; first word -> $0971,x
; second word -> $0973,x
; third word -> $0975,x
; #$0000 -> $0977,x
    PHP                 ; $00BE71   |
    REP #$10            ; $00BE72   |
    LDX $096D           ; $00BE74   |\ store accumulator argument
    STA $096F,x         ; $00BE77   |/
    LDA $02,s           ; $00BE7A   |\ return address as index
    TAY                 ; $00BE7C   |/
    LDA $0001,y         ; $00BE7D   |\ first word passed in
    STA $0971,x         ; $00BE80   |/
    LDA $0003,y         ; $00BE83   |\ second word passed in
    STA $0973,x         ; $00BE86   |/
    LDA $0005,y         ; $00BE89   |\ last word passed in
    STA $0975,x         ; $00BE8C   |/
    LDA #$0000          ; $00BE8F   |
    STA $0977,x         ; $00BE92   |
    TXA                 ; $00BE95   |
    CLC                 ; $00BE96   |
    ADC #$0008          ; $00BE97   |\ offset argument store index
    STA $096D           ; $00BE9A   |/
    TYA                 ; $00BE9D   |
    CLC                 ; $00BE9E   |
    ADC #$0006          ; $00BE9F   |\ adds 6 to return address
    STA $02,s           ; $00BEA2   |/
    PLP                 ; $00BEA4   |
    RTL                 ; $00BEA5   |

    PHB                 ; $00BEA6   |
    PEA $7E48           ; $00BEA7   |\
    PLB                 ; $00BEAA   | | data bank $7E
    PLB                 ; $00BEAB   |/
    PHX                 ; $00BEAC   |
    LDX $4800           ; $00BEAD   |
    STA $0008,x         ; $00BEB0   |
    TYA                 ; $00BEB3   |
    STA $0000,x         ; $00BEB4   |
    LDA #$0180          ; $00BEB7   |
    STA $0002,x         ; $00BEBA   |
    LDA #$0018          ; $00BEBD   |
    STA $0004,x         ; $00BEC0   |
    LDA $0000           ; $00BEC3   |
    STA $0006,x         ; $00BEC6   |
    PLA                 ; $00BEC9   |
    STA $0005,x         ; $00BECA   |
    TXA                 ; $00BECD   |
    CLC                 ; $00BECE   |
    ADC #$000C          ; $00BECF   |
    STA $000A,x         ; $00BED2   |
    STA $4800           ; $00BED5   |
    PLB                 ; $00BED8   |
    RTL                 ; $00BED9   |

    PHB                 ; $00BEDA   |
    PEA $7E48           ; $00BEDB   |\
    PLB                 ; $00BEDE   | | data bank $7E
    PLB                 ; $00BEDF   |/
    PHX                 ; $00BEE0   |
    LDX $4800           ; $00BEE1   |
    STA $0008,x         ; $00BEE4   |
    TYA                 ; $00BEE7   |
    STA $0000,x         ; $00BEE8   |
    LDA #$0980          ; $00BEEB   |
    STA $0002,x         ; $00BEEE   |
    LDA #$0018          ; $00BEF1   |
    STA $0004,x         ; $00BEF4   |
    LDA #$7E48          ; $00BEF7   |
    STA $0006,x         ; $00BEFA   |
    TXA                 ; $00BEFD   |
    CLC                 ; $00BEFE   |
    ADC #$000C          ; $00BEFF   |
    STA $0005,x         ; $00BF02   |
    TXA                 ; $00BF05   |
    CLC                 ; $00BF06   |
    ADC #$000D          ; $00BF07   |
    STA $000A,x         ; $00BF0A   |
    STA $4800           ; $00BF0D   |
    PLA                 ; $00BF10   |
    STA $000C,x         ; $00BF11   |
    PLB                 ; $00BF14   |
    RTL                 ; $00BF15   |

    PHB                 ; $00BF16   |
    PEA $7E48           ; $00BF17   |\
    PLB                 ; $00BF1A   | | data bank $7E
    PLB                 ; $00BF1B   |/
    PHX                 ; $00BF1C   |
    LDX $4800           ; $00BF1D   |
    STA $0008,x         ; $00BF20   |
    TYA                 ; $00BF23   |
    STA $0000,x         ; $00BF24   |
    LDA #$0000          ; $00BF27   |
    STA $0002,x         ; $00BF2A   |
    LDA #$0018          ; $00BF2D   |
    STA $0004,x         ; $00BF30   |
    LDA $0000           ; $00BF33   |
    STA $0006,x         ; $00BF36   |
    PLA                 ; $00BF39   |
    STA $0005,x         ; $00BF3A   |
    TXA                 ; $00BF3D   |
    CLC                 ; $00BF3E   |
    ADC #$000C          ; $00BF3F   |
    STA $000A,x         ; $00BF42   |
    STA $4800           ; $00BF45   |
    PLB                 ; $00BF48   |
    RTL                 ; $00BF49   |

    PHB                 ; $00BF4A   |
    PEA $7E48           ; $00BF4B   |\
    PLB                 ; $00BF4E   | | data bank $7E
    PLB                 ; $00BF4F   |/
    PHX                 ; $00BF50   |
    LDX $4800           ; $00BF51   |
    STA $0008,x         ; $00BF54   |
    TYA                 ; $00BF57   |
    STA $0000,x         ; $00BF58   |
    LDA #$0800          ; $00BF5B   |
    STA $0002,x         ; $00BF5E   |
    LDA #$0018          ; $00BF61   |
    STA $0004,x         ; $00BF64   |
    LDA #$7E48          ; $00BF67   |
    STA $0006,x         ; $00BF6A   |
    TXA                 ; $00BF6D   |
    CLC                 ; $00BF6E   |
    ADC #$000C          ; $00BF6F   |
    STA $0005,x         ; $00BF72   |
    TXA                 ; $00BF75   |
    CLC                 ; $00BF76   |
    ADC #$000D          ; $00BF77   |
    STA $000A,x         ; $00BF7A   |
    STA $4800           ; $00BF7D   |
    PLA                 ; $00BF80   |
    STA $000C,x         ; $00BF81   |
    PLB                 ; $00BF84   |
    RTL                 ; $00BF85   |

    PHB                 ; $00BF86   |
    PEA $7E48           ; $00BF87   |\
    PLB                 ; $00BF8A   | | data bank $7E
    PLB                 ; $00BF8B   |/
    PHX                 ; $00BF8C   |
    LDX $4800           ; $00BF8D   |
    STA $0008,x         ; $00BF90   |
    TYA                 ; $00BF93   |
    STA $0000,x         ; $00BF94   |
    LDA #$0080          ; $00BF97   |
    STA $0002,x         ; $00BF9A   |
    LDA #$0019          ; $00BF9D   |
    STA $0004,x         ; $00BFA0   |
    LDA $0000           ; $00BFA3   |
    STA $0006,x         ; $00BFA6   |
    PLA                 ; $00BFA9   |
    STA $0005,x         ; $00BFAA   |
    TXA                 ; $00BFAD   |
    CLC                 ; $00BFAE   |
    ADC #$000C          ; $00BFAF   |
    STA $000A,x         ; $00BFB2   |
    STA $4800           ; $00BFB5   |
    PLB                 ; $00BFB8   |
    RTL                 ; $00BFB9   |

    PHB                 ; $00BFBA   |
    PEA $7E48           ; $00BFBB   |\
    PLB                 ; $00BFBE   | | data bank $7E
    PLB                 ; $00BFBF   |/
    PHX                 ; $00BFC0   |
    LDX $4800           ; $00BFC1   |
    STA $0008,x         ; $00BFC4   |
    TYA                 ; $00BFC7   |
    STA $0000,x         ; $00BFC8   |
    LDA #$0880          ; $00BFCB   |
    STA $0002,x         ; $00BFCE   |
    LDA #$0019          ; $00BFD1   |
    STA $0004,x         ; $00BFD4   |
    LDA #$7E48          ; $00BFD7   |
    STA $0006,x         ; $00BFDA   |
    TXA                 ; $00BFDD   |
    CLC                 ; $00BFDE   |
    ADC #$000C          ; $00BFDF   |
    STA $0005,x         ; $00BFE2   |
    TXA                 ; $00BFE5   |
    CLC                 ; $00BFE6   |
    ADC #$000D          ; $00BFE7   |
    STA $000A,x         ; $00BFEA   |
    STA $4800           ; $00BFED   |
    PLA                 ; $00BFF0   |
    STA $000C,x         ; $00BFF1   |
    PLB                 ; $00BFF4   |
    RTL                 ; $00BFF5   |

; freespace
DATA_00BFF6:         db $FF, $FF, $FF, $FF, $FF
DATA_00BFFB:         db $FF, $FF, $FF, $FF, $FF

;RAM
.NMI
CODE_00C000: SEI                                        ;$00C000   |  Disable interrupts
CODE_00C001: REP #$38                                   ;$00C001   | 
CODE_00C003: PHA                                        ;$00C003   | \
CODE_00C004: PHX                                        ;$00C004   |  |
CODE_00C005: PHY                                        ;$00C005   |  | push everything
CODE_00C006: PHD                                        ;$00C006   |  |
CODE_00C007: PHB                                        ;$00C007   | /
CODE_00C008: LDA #$0000                                 ;$00C008   | \ set direct page to #$0000
CODE_00C00B: TCD                                        ;$00C00B   | /
CODE_00C00C: SEP #$30                                   ;$00C00C   | 
CODE_00C00E: PHA                                        ;$00C00E   | \ set bank to $00
CODE_00C00F: PLB                                        ;$00C00F   | /
CODE_00C010: LDY $4210                                  ;$00C010   |  clear NMI flag
CODE_00C013: LDX $011C                                  ;$00C013   | 
CODE_00C016: JSR ($C074,x)                              ;$00C016   | 

CODE_00C019: LDA $4D                                    ;$00C019   | 
CODE_00C01B: BNE CODE_00C024                            ;$00C01B   | 
CODE_00C01D: LDX $2140                                  ;$00C01D   | 
CODE_00C020: CPX $4F                                    ;$00C020   | 
CODE_00C022: BNE CODE_00C02B                            ;$00C022   | 
CODE_00C024: STA $2140                                  ;$00C024   | 
CODE_00C027: STA $4F                                    ;$00C027   | 
CODE_00C029: STZ $4D                                    ;$00C029   | 
CODE_00C02B: LDA $51                                    ;$00C02B   | 
CODE_00C02D: STA $2141                                  ;$00C02D   | 
CODE_00C030: STZ $51                                    ;$00C030   | 
CODE_00C032: LDA $2143                                  ;$00C032   | 
CODE_00C035: CMP $55                                    ;$00C035   | 
CODE_00C037: BNE CODE_00C06C                            ;$00C037   | 
CODE_00C039: LDY $53                                    ;$00C039   | 
CODE_00C03B: BEQ CODE_00C045                            ;$00C03B   | 

CODE_00C03D: CMP $53                                    ;$00C03D   | 
CODE_00C03F: BEQ CODE_00C04D                            ;$00C03F   | 
CODE_00C041: STZ $53                                    ;$00C041   | 
CODE_00C043: BRA CODE_00C067                            ;$00C043   | 

CODE_00C045: LDX $57                                    ;$00C045   | 
CODE_00C047: BEQ CODE_00C067                            ;$00C047   | 

CODE_00C049: CMP $59                                    ;$00C049   | 
CODE_00C04B: BNE CODE_00C051                            ;$00C04B   | 
CODE_00C04D: LDY #$00                                   ;$00C04D   | 
CODE_00C04F: BRA CODE_00C067                            ;$00C04F   | 

CODE_00C051: DEX                                        ;$00C051   | 
CODE_00C052: CPX #$07                                   ;$00C052   | 
CODE_00C054: BCC CODE_00C058                            ;$00C054   | 
CODE_00C056: LDX #$06                                   ;$00C056   | 
CODE_00C058: STX $57                                    ;$00C058   | 
CODE_00C05A: LDY $59                                    ;$00C05A   | 
CODE_00C05C: LDX #$00                                   ;$00C05C   | 
CODE_00C05E: LDA $5A,x                                  ;$00C05E   | 
CODE_00C060: STA $59,x                                  ;$00C060   | 
CODE_00C062: INX                                        ;$00C062   | 
CODE_00C063: CPX $57                                    ;$00C063   | 
CODE_00C065: BCC CODE_00C05E                            ;$00C065   | 

CODE_00C067: STY $2143                                  ;$00C067   | 
CODE_00C06A: STY $55                                    ;$00C06A   | 
CODE_00C06C: REP #$30                                   ;$00C06C   | 
CODE_00C06E: PLB                                        ;$00C06E   | 
CODE_00C06F: PLD                                        ;$00C06F   | 
CODE_00C070: PLY                                        ;$00C070   | 
CODE_00C071: PLX                                        ;$00C071   | 
CODE_00C072: PLA                                        ;$00C072   | 
CODE_00C073: RTI                                        ;$00C073   |  Return from NMI

DATA_00C074:         dw $C084, $C10A, $C10A, $C22C
DATA_00C07C:         dw $C10A, $C10A, $C10B, $C10A

    LDY #$8F            ; $00C084   |\ Force blank
    STY $2100           ; $00C086   |/
    STZ $420C           ; $00C089   | Disable HDMA
    LDA $011B           ; $00C08C   |
    BNE CODE_00C094     ; $00C08F   |
    JMP CODE_00C0FD     ; $00C091   |

CODE_00C094:
    STZ $011B           ; $00C094   |
    JSR CODE_00E3DF     ; $00C097   |
    JSR CODE_00E3AA     ; $00C09A   |
    REP #$20            ; $00C09D   |
    LDA #$420B          ; $00C09F   |
    TCD                 ; $00C0A2   |
    LDX #$01            ; $00C0A3   |
    JSR CODE_00D4AC     ; $00C0A5   |
    JSR CODE_00D4E5     ; $00C0A8   |
    LDY #$80            ; $00C0AB   |
    STY $2115           ; $00C0AD   |
    LDA #$1801          ; $00C0B0   |
    STA $F5             ; $00C0B3   |
    JSR CODE_00DC6B     ; $00C0B5   |
    LDA #$0000          ; $00C0B8   |
    TCD                 ; $00C0BB   |
    SEP #$20            ; $00C0BC   |
    JSR CODE_00E507     ; $00C0BE   |
    LDA $39             ; $00C0C1   |\
    STA $210D           ; $00C0C3   | | BG1 horizontal scroll
    LDA $3A             ; $00C0C6   | |
    STA $210D           ; $00C0C8   |/
    LDA $3B             ; $00C0CB   |\

; sub called by GSU init routine $7EDECF
; r0 = #$0008
    STA $210E           ; $00C0CD   | | BG1 vertical scroll
    LDA $3C             ; $00C0D0   | |
    STA $210E           ; $00C0D2   |/
    LDA $3D             ; $00C0D5   |\
    STA $210F           ; $00C0D7   | | BG2 horizontal scroll
    LDA $3E             ; $00C0DA   | |
    STA $210F           ; $00C0DC   |/
    LDA $3F             ; $00C0DF   |\
    STA $2110           ; $00C0E1   | | BG2 vertical scroll
    LDA $40             ; $00C0E4   | |
    STA $2110           ; $00C0E6   |/
    LDA $41             ; $00C0E9   |\
    STA $2111           ; $00C0EB   | | BG3 horizontal scroll
    LDA $42             ; $00C0EE   | |
    STA $2111           ; $00C0F0   |/
    LDA $43             ; $00C0F3   |\
    STA $2112           ; $00C0F5   | | BG3 vertical scroll
    LDA $44             ; $00C0F8   | |
    STA $2112           ; $00C0FA   |/

CODE_00C0FD:
    LDA $0200           ; $00C0FD   |
    STA $2100           ; $00C100   |
    LDA $094A           ; $00C103   |
    STA $420C           ; $00C106   |
    RTS                 ; $00C109   |

    RTS                 ; $00C10A   |

    LDY #$8F            ; $00C10B   |\ Force blank
    STY $2100           ; $00C10D   |/
    STZ $420C           ; $00C110   | Disable HDMA
    LDA $096B           ; $00C113   |
    STA $2130           ; $00C116   |
    LDA $0994           ; $00C119   |
    ORA #$80            ; $00C11C   |
    STA $2132           ; $00C11E   |
    LDA $0992           ; $00C121   |
    ORA #$40            ; $00C124   |
    STA $2132           ; $00C126   |
    LDA $0990           ; $00C129   |
    ORA #$20            ; $00C12C   |
    STA $2132           ; $00C12E   |
    LDA $011B           ; $00C131   |
    BNE CODE_00C139     ; $00C134   |
    JMP CODE_00C1DF     ; $00C136   |

CODE_00C139:
    STZ $011B           ; $00C139   |
    JSR CODE_00E3DF     ; $00C13C   |
    JSR CODE_00E3AA     ; $00C13F   |
    REP #$20            ; $00C142   |
    LDA #$420B          ; $00C144   |
    TCD                 ; $00C147   |
    LDX #$2001          ; $00C148   |
    LDY $20D4           ; $00C14B   |
    BPL CODE_00C125     ; $00C14E   |
    LDA #$0000          ; $00C150   |
    TCD                 ; $00C153   |
    LDA $39             ; $00C154   |
    STA $7E5B59         ; $00C156   |
    LDA $3B             ; $00C15A   |
    STA $7E5B5B         ; $00C15C   |
    LDA $69             ; $00C160   |
    STA $7E5B5E         ; $00C162   |
    LDA $6B             ; $00C166   |
    STA $7E5B60         ; $00C168   |
    LDA $3D             ; $00C16C   |
    STA $7E5B99         ; $00C16E   |
    LDA $3F             ; $00C172   |
    STA $7E5B9B         ; $00C174   |
    LDA $6D             ; $00C178   |
    STA $7E5B9E         ; $00C17A   |
    LDA $6F             ; $00C17E   |
    STA $7E5BA0         ; $00C180   |
    LDA $1144           ; $00C184   |
    STA $7E5740         ; $00C187   |
    SEP #$20            ; $00C18B   |
    LDA $096C           ; $00C18D   |
    STA $7E5C9B         ; $00C190   |
    JSR CODE_00E507     ; $00C194   | update controllers

; set the screen scrolling registers
    LDA $0969           ; $00C197   |
    STA $212E           ; $00C19A   |
    LDA $0966           ; $00C19D   |
    STA $2125           ; $00C1A0   |
    LDA $39             ; $00C1A3   |\
    STA $210D           ; $00C1A5   | | BG1 horizontal scroll
    LDA $3A             ; $00C1A8   | |
    STA $210D           ; $00C1AA   |/
    LDA $3B             ; $00C1AD   |\
    STA $210E           ; $00C1AF   | | BG1 vertical scroll
    LDA $3C             ; $00C1B2   | |
    STA $210E           ; $00C1B4   |/
    LDA $3D             ; $00C1B7   |\
    STA $210F           ; $00C1B9   | | BG2 horizontal scroll
    LDA $3E             ; $00C1BC   | |
    STA $210F           ; $00C1BE   |/
    LDA $3F             ; $00C1C1   |\
    STA $2110           ; $00C1C3   | | BG2 vertical scroll
    LDA $40             ; $00C1C6   | |
    STA $2110           ; $00C1C8   |/
    LDA $41             ; $00C1CB   |\
    STA $2111           ; $00C1CD   | | BG3 horizontal scroll
    LDA $42             ; $00C1D0   | |
    STA $2111           ; $00C1D2   |/
    LDA $43             ; $00C1D5   |\
    STA $2112           ; $00C1D7   | | BG3 vertical scroll
    LDA $44             ; $00C1DA   | |
    STA $2112           ; $00C1DC   |/

CODE_00C1DF:
    LDA $0200           ; $00C1DF   |
    STA $2100           ; $00C1E2   |
    LDA $094A           ; $00C1E5   |
    STA $420C           ; $00C1E8   |
    RTS                 ; $00C1EB   |

DATA_00C1EC:         dw $4000, $6000, $4700, $6700

DATA_00C1F4:         dw $5180, $7180, $56DE, $56DE
DATA_00C1FC:         dw $64DE, $64DE

DATA_00C200:         dw $79DE, $79DE, $0E00, $0E00
DATA_00C208:         dw $1500, $1500, $1500, $1500

DATA_00C210:         db $63, $62

DATA_00C212:         db $3F, $BF, $00, $50, $28, $00, $00, $00
DATA_00C21A:         db $00, $00

DATA_00C21C:         db $01, $00, $01, $00, $01, $00, $00, $00
DATA_00C224:         db $FF, $FF, $FF, $00, $01, $01, $01, $00

    LDY #$8F            ; $00C22C   |\ Force blank
    STY $2100           ; $00C22E   |/
    STZ $420C           ; $00C231   | Disable HDMA
    LDA $1139           ; $00C234   |
    BEQ CODE_00C23B     ; $00C237   |
    STA $51             ; $00C239   |

CODE_00C23B:
    LDA $096C           ; $00C23B   |
    STA $2131           ; $00C23E   |
    LDA $0994           ; $00C241   |
    ORA #$80            ; $00C244   |
    STA $2132           ; $00C246   |
    LDA $0992           ; $00C249   |
    ORA #$40            ; $00C24C   |
    STA $2132           ; $00C24E   |
    LDA $0990           ; $00C251   |
    ORA #$20            ; $00C254   |
    STA $2132           ; $00C256   |
    REP #$20            ; $00C259   |
    INC $0131           ; $00C25B   |
    LDY #$8C80          ; $00C25E   |
    ORA $21,x           ; $00C261   |
    LDA #$1801          ; $00C263   |
    STA $4300           ; $00C266   |
    LDY #$E201          ; $00C269   |
    JSR CODE_0080AD     ; $00C26C   |
    ORA #$2CF0          ; $00C26F   |
    ASL A               ; $00C272   |
    ORA $0984           ; $00C273   |
    ASL A               ; $00C276   |
    TAX                 ; $00C277   |
    REP #$20            ; $00C278   |
    LDA $7EC1E8,x       ; $00C27A   |
    STA $2116           ; $00C27E   |
    LDA $7EC1F4,x       ; $00C281   |
    STA $4302           ; $00C285   |
    LDA $7EC200,x       ; $00C288   |
    STA $4305           ; $00C28C   |
    LDX #$8E7F          ; $00C28F   |
    TSB $43             ; $00C292   |
    STY $420B           ; $00C294   |
    SEP #$20            ; $00C297   |
    DEC $0980           ; $00C299   |
    BNE CODE_00C2A3     ; $00C29C   |
    LDA $011B           ; $00C29E   |
    BNE CODE_00C2A6     ; $00C2A1   |

CODE_00C2A3:
    JMP CODE_00C33E     ; $00C2A3   |

CODE_00C2A6:
    STZ $011B           ; $00C2A6   |
    LDA $0982           ; $00C2A9   |
    STZ $0982           ; $00C2AC   |
    STA $0980           ; $00C2AF   |
    JSR CODE_00E3DF     ; $00C2B2   |
    REP #$20            ; $00C2B5   |
    LDA #$420B          ; $00C2B7   |
    TCD                 ; $00C2BA   |
    LDX #$01            ; $00C2BB   |
    JSR CODE_00D4AC     ; $00C2BD   |
    JSR CODE_00D510     ; $00C2C0   |
    LDA #$5040          ; $00C2C3   |
    STA $2181           ; $00C2C6   |
    LDY #$7E            ; $00C2C9   |
    STY $2183           ; $00C2CB   |
    LDA #$8000          ; $00C2CE   |
    STA $F5             ; $00C2D1   |
    LDA #$6CAA          ; $00C2D3   |
    STA $F7             ; $00C2D6   |
    LDY #$00            ; $00C2D8   |
    STY $F9             ; $00C2DA   |
    LDA #$0380          ; $00C2DC   |
    STA $FA             ; $00C2DF   |
    STX $00             ; $00C2E1   |
    LDA #$0000          ; $00C2E3   |
    TCD                 ; $00C2E6   |
    SEP #$20            ; $00C2E7   |
    LDY $0984           ; $00C2E9   |
    LDA $C210,y         ; $00C2EC   |
    STA $2101           ; $00C2EF   |
    LDA $0969           ; $00C2F2   |
    STA $212E           ; $00C2F5   |
    LDA $0966           ; $00C2F8   |
    STA $2125           ; $00C2FB   |
    LDA $39             ; $00C2FE   |\
    STA $210D           ; $00C300   | | BG1 horizontal scroll
    LDA $3A             ; $00C303   | |
    STA $210D           ; $00C305   |/
    LDA $3B             ; $00C308   |\
    STA $210E           ; $00C30A   | | BG1 vertical scroll
    LDA $3C             ; $00C30D   | |
    STA $210E           ; $00C30F   |/
    LDA $020E           ; $00C312   |\
    STA $211F           ; $00C315   | | BG2 horizontal scroll
    LDA $020F           ; $00C318   | |
    STA $211F           ; $00C31B   |/
    LDA $0210           ; $00C31E   |\
    STA $2120           ; $00C321   | | BG2 vertical scroll
    LDA $0211           ; $00C324   | |
    STA $2120           ; $00C327   |/
    LDA $3D             ; $00C32A   |\
    STA $210F           ; $00C32C   | | BG3 horizontal scroll
    LDA $3E             ; $00C32F   | |
    STA $210F           ; $00C331   |/
    LDA $3F             ; $00C334   |\
    STA $2110           ; $00C336   | | BG3 vertical scroll
    LDA $40             ; $00C339   | |
    STA $2110           ; $00C33B   |/

CODE_00C33E:
    REP #$20            ; $00C33E   |
    LDA $41             ; $00C340   |
    CLC                 ; $00C342   |
    ADC $099E           ; $00C343   |
    STA $41             ; $00C346   |
    LSR A               ; $00C348   |
    STA $09BD           ; $00C349   |
    LSR A               ; $00C34C   |
    LSR A               ; $00C34D   |
    LSR A               ; $00C34E   |
    STA $09A1           ; $00C34F   |
    ADC $09BD           ; $00C352   |
    STA $09B9           ; $00C355   |
    ADC $09A1           ; $00C358   |
    STA $09B5           ; $00C35B   |
    ADC $09A1           ; $00C35E   |
    STA $09B1           ; $00C361   |
    ADC $09A1           ; $00C364   |
    STA $09AD           ; $00C367   |
    ADC $09A1           ; $00C36A   |
    STA $09A9           ; $00C36D   |
    ADC $09A1           ; $00C370   |
    STA $09A5           ; $00C373   |
    ADC $09A1           ; $00C376   |
    STA $09A1           ; $00C379   |
    SEP #$20            ; $00C37C   |
    LDA $095F           ; $00C37E   |
    STA $2107           ; $00C381   |
    LDA $0960           ; $00C384   |
    STA $2108           ; $00C387   |
    LDA $095E           ; $00C38A   |
    STA $7E5A19         ; $00C38D   |
    LDA $0967           ; $00C391   |
    STA $7E5A99         ; $00C394   |
    LDA $09A0           ; $00C398   |
    STA $4311           ; $00C39B   |
    JSR CODE_00E507     ; $00C39E   |
    LDA $0200           ; $00C3A1   |
    STA $2100           ; $00C3A4   |
    LDA $094A           ; $00C3A7   |
    STA $420C           ; $00C3AA   |
    LDA $098E           ; $00C3AD   |
    BEQ CODE_00C3E7     ; $00C3B0   |
    PHK                 ; $00C3B2   |
    PLB                 ; $00C3B3   |
    LDY $0201           ; $00C3B4   |
    LDX $C212,y         ; $00C3B7   |
    STX $096C           ; $00C3BA   |
    TYA                 ; $00C3BD   |
    ASL A               ; $00C3BE   |
    ASL A               ; $00C3BF   |
    TAY                 ; $00C3C0   |
    LDX #$DE04          ; $00C3C1   |
    STX $09,y           ; $00C3C4   |
    BPL CODE_00C3E2     ; $00C3C6   |
    LDA $C21C,y         ; $00C3C8   |
    STA $0996,x         ; $00C3CB   |
    LDA $0990,x         ; $00C3CE   |
    CLC                 ; $00C3D1   |
    ADC $C224,y         ; $00C3D2   |
    BPL CODE_00C3D9     ; $00C3D5   |
    LDA #$00            ; $00C3D7   |

CODE_00C3D9:
    CMP #$1F            ; $00C3D9   |
    BCC CODE_00C3DF     ; $00C3DB   |
    LDA #$1F            ; $00C3DD   |

CODE_00C3DF:
    STA $0990,x         ; $00C3DF   |

CODE_00C3E2:
    INY                 ; $00C3E2   |
    DEX                 ; $00C3E3   |
    DEX                 ; $00C3E4   |
    BPL CODE_00C3C3     ; $00C3E5   |

CODE_00C3E7:
    RTS                 ; $00C3E7   |

.IRQ_Handler
CODE_00C3E8: SEI                                        ;$00C3E8   |  Disable interrupts

.IRQ_Start
CODE_00C3E9: REP #$38                                   ;$00C3E9   | \
CODE_00C3EB: PHA                                        ;$00C3EB   |  |
CODE_00C3EC: PHX                                        ;$00C3EC   |  |
CODE_00C3ED: PHY                                        ;$00C3ED   |  | Push A/X/Y/DP/DB
CODE_00C3EE: PHD                                        ;$00C3EE   |  |
CODE_00C3EF: PHB                                        ;$00C3EF   | /
CODE_00C3F0: LDA #$0000                                 ;$00C3F0   | \ reset DP
CODE_00C3F3: TCD                                        ;$00C3F3   | /
CODE_00C3F4: SEP #$30                                   ;$00C3F4   | 
CODE_00C3F6: PHA                                        ;$00C3F6   | \ DB = $00
CODE_00C3F7: PLB                                        ;$00C3F7   | /

CODE_00C3F8: LDA $4211                                  ;$00C3F8   | 
CODE_00C3FB: LDX $0126                                  ;$00C3FB   | 
CODE_00C3FE: JSR ($C40A,x)                              ;$00C3FE   | 

.IRQ_Return
CODE_00C401: REP #$30                                   ;$00C401   | 
CODE_00C403: PLB                                        ;$00C403   | 
CODE_00C404: PLD                                        ;$00C404   | 
CODE_00C405: PLY                                        ;$00C405   | 
CODE_00C406: PLX                                        ;$00C406   | 
CODE_00C407: PLA                                        ;$00C407   | 
CODE_00C408: CLI                                        ;$00C408   | 

.EmptyHandler
CODE_00C409: RTI                                        ;$00C409   |  Return from IRQ

DATA_00C40A:	     dw $C412
DATA_00C40C:	     dw $C821
DATA_00C40E:	     dw $CA9A
DATA_00C410:	     dw $D308

CODE_00C412: LDA $0125                                  ;$00C412   | 
CODE_00C415: BNE CODE_00C43D                            ;$00C415   | 
CODE_00C417: BIT $4212                                  ;$00C417   | \ wait for h-blank to occur
CODE_00C41A: BVS CODE_00C417                            ;$00C41A   | /
CODE_00C41C: BIT $4212                                  ;$00C41C   | \ wait for h-blank to end
CODE_00C41F: BVC CODE_00C41C                            ;$00C41F   | /

CODE_00C421: LDA $094A                                  ;$00C421   | 
CODE_00C424: STA $420C                                  ;$00C424   | 
CODE_00C427: STZ $2100                                  ;$00C427   |  turn screen brightness off
CODE_00C42A: LDA #$50                                   ;$00C42A   | \ set h-timer to #$50
CODE_00C42C: STA $4207                                  ;$00C42C   | /
CODE_00C42F: LDA #$08                                   ;$00C42F   | \
CODE_00C431: INC $0125                                  ;$00C431   |  | set v-timer to #$08
CODE_00C434: STA $4209                                  ;$00C434   | /
CODE_00C437: LDA #$B1                                   ;$00C437   | \ Enable IRQ, NMI and auto-joypad reading
CODE_00C439: STA $4200                                  ;$00C439   | /
CODE_00C43C: RTS                                        ;$00C43C   | 

    DEC A               ; $00C43D   |
    BNE CODE_00C465     ; $00C43E   |

CODE_00C440:
    BIT $4212           ; $00C440   |\ wait for h-blank to occur
    BVS CODE_00C440     ; $00C443   |/

CODE_00C445:
    BIT $4212           ; $00C445   |\ wait for h-blank to end
    BVC CODE_00C445     ; $00C448   |/

    LDA $0200           ; $00C44A   |\ restore brightness
    STA $2100           ; $00C44D   |/
    LDA #$50            ; $00C450   |\ set h-timer to #$50
    STA $4207           ; $00C452   |/
    LDA #$D8            ; $00C455   | possibly set v-timer to #$D8
    LDX $0121           ; $00C457   |
    BNE CODE_00C45F     ; $00C45A   |
    JMP CODE_00C431     ; $00C45C   |

CODE_00C45F:
    JSR CODE_00C431     ; $00C45F   |
    JMP ($C714,x)       ; $00C462   |

CODE_00C465:
    BIT $4212           ; $00C465   |\ wait for h-blank to occur
    BVS CODE_00C465     ; $00C468   |/

CODE_00C46A:
    BIT $4212           ; $00C46A   |\ wait for h-blank to end
    BVC CODE_00C46A     ; $00C46D   |/

    LDY #$8F            ; $00C46F   |\ Force blank
    STY $2100           ; $00C471   |/
    STZ $420C           ; $00C474   | Disable HDMA
    LDX $011C           ; $00C477   |
    JMP ($C47D,x)       ; $00C47A   |

DATA_00C47D:         dw $C43C, $C48D, $C5FE, $C43C
DATA_00C485:         dw $C87A, $C641, $C43C, $C43C

    LDA $011B           ; $00C48D   |
    BNE CODE_00C495     ; $00C490   |
    JMP CODE_00C6CC     ; $00C492   |

CODE_00C495:
    REP #$20            ; $00C495   |
    LDA $3B             ; $00C497   |
    CLC                 ; $00C499   |
    ADC $0CB0           ; $00C49A   |
    STA $011F           ; $00C49D   |
    LDA $39             ; $00C4A0   |

CODE_00C4A2:
    STA $011D           ; $00C4A2   |
    SEP #$20            ; $00C4A5   |
    STA $210E           ; $00C4A7   |
    XBA                 ; $00C4AA   |
    STA $210E           ; $00C4AB   |
    STZ $011B           ; $00C4AE   |
    JSR CODE_00E3DF     ; $00C4B1   |
    JSR CODE_00E3AA     ; $00C4B4   |
    REP #$20            ; $00C4B7   |
    PHD                 ; $00C4B9   |
    LDA #$420B          ; $00C4BA   |
    TCD                 ; $00C4BD   |
    LDX #$01            ; $00C4BE   |
    JSR CODE_00DE0C     ; $00C4C0   |
    JSR CODE_00D4AC     ; $00C4C3   |
    JSR CODE_00D4E5     ; $00C4C6   |
    LDY #$80            ; $00C4C9   |
    STY $2115           ; $00C4CB   |
    LDA #$1801          ; $00C4CE   |
    STA $F5             ; $00C4D1   |
    LDY $0B0F           ; $00C4D3   |
    BEQ CODE_00C4F4     ; $00C4D6   |
    CPY #$0C            ; $00C4D8   |
    BCC CODE_00C4F4     ; $00C4DA   |
    LDA #$4E00          ; $00C4DC   |
    STA $2116           ; $00C4DF   |
    LDA #$6800          ; $00C4E2   |
    STA $F7             ; $00C4E5   |
    LDY #$70            ; $00C4E7   |
    STY $F9             ; $00C4E9   |
    LDA #$0C00          ; $00C4EB   |
    STA $FA             ; $00C4EE   |
    STX $00             ; $00C4F0   |
    BRA CODE_00C50E     ; $00C4F2   |

CODE_00C4F4:
    JSR CODE_00DCAE     ; $00C4F4   |
    JSR CODE_00D65D     ; $00C4F7   |
    JSR CODE_00DC6B     ; $00C4FA   |
    LDY $0D15           ; $00C4FD   |
    BEQ CODE_00C508     ; $00C500   |
    JSR CODE_00DC97     ; $00C502   |
    STZ $0D15           ; $00C505   |

CODE_00C508:
    JSR CODE_00DBA9     ; $00C508   |
    JSR CODE_00DC1C     ; $00C50B   |

CODE_00C50E:
    PLD                 ; $00C50E   |
    LDY $0D0D           ; $00C50F   |
    BNE CODE_00C51B     ; $00C512   |
    LDY $0134           ; $00C514   |
    CPY #$10            ; $00C517   |
    BCC CODE_00C539     ; $00C519   |

CODE_00C51B:
    LDA $0D0B           ; $00C51B   |
    STA $7E5D19         ; $00C51E   |
    CLC                 ; $00C522   |
    ADC #$0069          ; $00C523   |
    STA $7E5D1C         ; $00C526   |
    LDA $0D09           ; $00C52A   |
    STA $7E5C99         ; $00C52D   |
    CLC                 ; $00C531   |
    ADC #$00D2          ; $00C532   |
    STA $7E5C9C         ; $00C535   |

CODE_00C539:
    SEP #$20            ; $00C539   |
    LDA $011D           ; $00C53B   |
    STA $210D           ; $00C53E   |
    LDA $011E           ; $00C541   |
    STA $210D           ; $00C544   |
    LDA $011F           ; $00C547   |
    STA $210E           ; $00C54A   |
    LDA $0120           ; $00C54D   |
    STA $210E           ; $00C550   |
    LDA $3D             ; $00C553   |
    STA $210F           ; $00C555   |
    LDA $3E             ; $00C558   |
    STA $210F           ; $00C55A   |
    LDA $3F             ; $00C55D   |
    STA $2110           ; $00C55F   |
    LDA $40             ; $00C562   |
    STA $2110           ; $00C564   |
    LDA $41             ; $00C567   |
    STA $2111           ; $00C569   |
    LDA $42             ; $00C56C   |
    STA $2111           ; $00C56E   |
    LDA $43             ; $00C571   |
    STA $2112           ; $00C573   |
    LDA $44             ; $00C576   |
    STA $2112           ; $00C578   |
    JSR CODE_00E507     ; $00C57B   |

CODE_00C57E:
    REP #$20            ; $00C57E   |
    LDA #$2100          ; $00C580   |
    TCD                 ; $00C583   |
    LDA $0967           ; $00C584   |
    STA $2C             ; $00C587   |
    LDA $0969           ; $00C589   |
    STA $2E             ; $00C58C   |
    LDA $0962           ; $00C58E   |
    STA $0B             ; $00C591   |
    LDA $095F           ; $00C593   |
    STA $07             ; $00C596   |
    LDA $0964           ; $00C598   |
    STA $23             ; $00C59B   |
    LDA $096B           ; $00C59D   |
    STA $30             ; $00C5A0   |
    LDA $094C           ; $00C5A2   |
    STA $2A             ; $00C5A5   |
    SEP #$20            ; $00C5A7   |
    LDA $0961           ; $00C5A9   |
    STA $09             ; $00C5AC   |
    LDA $095E           ; $00C5AE   |
    STA $05             ; $00C5B1   |
    LDA $095B           ; $00C5B3   |
    STA $06             ; $00C5B6   |
    LDA $0966           ; $00C5B8   |
    STA $25             ; $00C5BB   |
    REP #$20            ; $00C5BD   |
    LDA #$4300          ; $00C5BF   |
    TCD                 ; $00C5C2   |
    LDA $12             ; $00C5C3   |
    STA $18             ; $00C5C5   |
    LDA $22             ; $00C5C7   |
    STA $28             ; $00C5C9   |
    LDA $32             ; $00C5CB   |
    STA $38             ; $00C5CD   |
    LDA $42             ; $00C5CF   |
    STA $48             ; $00C5D1   |
    LDA $52             ; $00C5D3   |
    STA $58             ; $00C5D5   |
    LDA $62             ; $00C5D7   |
    STA $68             ; $00C5D9   |
    LDA $72             ; $00C5DB   |
    STA $78             ; $00C5DD   |
    SEP #$20            ; $00C5DF   |
    LDA #$01            ; $00C5E1   |
    STA $1A             ; $00C5E3   |
    STA $2A             ; $00C5E5   |
    STA $3A             ; $00C5E7   |
    STA $4A             ; $00C5E9   |
    STA $5A             ; $00C5EB   |
    STA $6A             ; $00C5ED   |
    STA $7A             ; $00C5EF   |
    STZ $0125           ; $00C5F1   |
    LDA #$50            ; $00C5F4   |
    STA $4207           ; $00C5F6   |
    LDA #$06            ; $00C5F9   |
    JMP CODE_00C434     ; $00C5FB   |

    LDA $011B           ; $00C5FE   |
    BNE CODE_00C606     ; $00C601   |
    JMP CODE_00C6CC     ; $00C603   |

CODE_00C606:
    LDA #$80            ; $00C606   |
    STA $2115           ; $00C608   |
    REP #$20            ; $00C60B   |
    LDA #$3600          ; $00C60D   |
    STA $2116           ; $00C610   |
    LDA #$1801          ; $00C613   |
    STA $4300           ; $00C616   |
    LDA #$7EF2          ; $00C619   |
    STA $4302           ; $00C61C   |
    LDY #$00            ; $00C61F   |
    STY $4304           ; $00C621   |
    LDY #$80            ; $00C624   |
    STY $4305           ; $00C626   |
    LDX #$01            ; $00C629   |
    STX $420B           ; $00C62B   |

    LDA #$0080          ; $00C62E   |
    STA $43             ; $00C631   |
    STZ $41             ; $00C633   |
    LDA $7EF0           ; $00C635   |
    STA $011F           ; $00C638   |
    LDA $7EEE           ; $00C63B   |
    JMP CODE_00C4A2     ; $00C63E   |

    LDA $011B           ; $00C641   |
    BNE CODE_00C649     ; $00C644   |
    JMP CODE_00C6CC     ; $00C646   |

CODE_00C649:
    LDA $094E           ; $00C649   |
    STA $211A           ; $00C64C   |
    LDA $094F           ; $00C64F   |
    STA $211B           ; $00C652   |
    LDA $0950           ; $00C655   |
    STA $211B           ; $00C658   |
    LDA $0951           ; $00C65B   |
    STA $211C           ; $00C65E   |
    LDA $0952           ; $00C661   |
    STA $211C           ; $00C664   |
    LDA $0953           ; $00C667   |
    STA $211D           ; $00C66A   |
    LDA $0954           ; $00C66D   |
    STA $211D           ; $00C670   |
    LDA $0955           ; $00C673   |
    STA $211E           ; $00C676   |
    LDA $0956           ; $00C679   |
    STA $211E           ; $00C67C   |
    LDA $0957           ; $00C67F   |
    STA $211F           ; $00C682   |
    LDA $0958           ; $00C685   |
    STA $211F           ; $00C688   |
    LDA $0959           ; $00C68B   |
    STA $2120           ; $00C68E   |
    LDA $095A           ; $00C691   |
    STA $2120           ; $00C694   |
    REP #$20            ; $00C697   |
    LDA $0B83           ; $00C699   |
    STA $7E51E5         ; $00C69C   |
    STA $7E51E8         ; $00C6A0   |
    LDA $0967           ; $00C6A4   |
    STA $7E51EB         ; $00C6A7   |
    LDA $39             ; $00C6AB   |
    STA $3D             ; $00C6AD   |
    LDA $3B             ; $00C6AF   |
    CLC                 ; $00C6B1   |
    ADC $0CB0           ; $00C6B2   |
    STA $3F             ; $00C6B5   |
    LDA $43             ; $00C6B7   |
    LDY $0146           ; $00C6B9   |
    CPY #$09            ; $00C6BC   |
    BNE CODE_00C6C4     ; $00C6BE   |
    CLC                 ; $00C6C0   |
    ADC $0CB0           ; $00C6C1   |

CODE_00C6C4:
    STA $011F           ; $00C6C4   |
    LDA $41             ; $00C6C7   |
    JMP CODE_00C4A2     ; $00C6C9   |

CODE_00C6CC:
    LDA $0121           ; $00C6CC   |
    BEQ CODE_00C6F9     ; $00C6CF   |
    REP #$20            ; $00C6D1   |
    PHD                 ; $00C6D3   |
    LDA #$420B          ; $00C6D4   |
    TCD                 ; $00C6D7   |
    LDX #$01            ; $00C6D8   |
    JSR CODE_00DE0C     ; $00C6DA   |
    JSR CODE_00D4AC     ; $00C6DD   |
    JSR CODE_00D4E5     ; $00C6E0   |
    LDY #$80            ; $00C6E3   |
    STY $2115           ; $00C6E5   |
    LDA #$1801          ; $00C6E8   |
    STA $F5             ; $00C6EB   |
    JSR CODE_00DCAE     ; $00C6ED   |
    JSR CODE_00DC6B     ; $00C6F0   |
    PLD                 ; $00C6F3   |
    SEP #$20            ; $00C6F4   |
    JSR CODE_00E507     ; $00C6F6   |

CODE_00C6F9:
    LDA $011D           ; $00C6F9   |
    STA $210D           ; $00C6FC   |
    LDA $011E           ; $00C6FF   |
    STA $210D           ; $00C702   |
    LDA $011F           ; $00C705   |
    STA $210E           ; $00C708   |
    LDA $0120           ; $00C70B   |
    STA $210E           ; $00C70E   |
    JMP CODE_00C57E     ; $00C711   |

DATA_00C714:         dw $C718, $C719

    RTS                 ; $00C718   |

    JSL $00C71E         ; $00C719   |
    RTS                 ; $00C71D   |

    JSL $008259         ; $00C71E   |
    JSL $0394D3         ; $00C722   |
    JSL $04FA67         ; $00C726   |
    JSL $04DD9E         ; $00C72A   |
    JSL $0397D3         ; $00C72E   |
    REP #$20            ; $00C732   |
    LDX #$08            ; $00C734   |
    LDA #$B1EF          ; $00C736   |
    JSL $7EDE44         ; $00C739   | GSU init
    INC $0D23           ; $00C73D   |
    INC $0D25           ; $00C740   |
    LDA $0D25           ; $00C743   |
    CMP #$0010          ; $00C746   |
    BCC CODE_00C775     ; $00C749   |
    LDA $093E           ; $00C74B   |
    ORA $0942           ; $00C74E   |
    BEQ CODE_00C75D     ; $00C751   |
    LDA $0D23           ; $00C753   |
    CLC                 ; $00C756   |
    ADC #$0006          ; $00C757   |
    STA $0D23           ; $00C75A   |

CODE_00C75D:
    LDA $0D25           ; $00C75D   |
    AND #$0003          ; $00C760   |
    BEQ CODE_00C769     ; $00C763   |
    JMP CODE_0000C7     ; $00C765   |

CODE_00C769:
    REP #$10            ; $00C769   |
    LDX #$0000          ; $00C76B   |
    LDY $021A           ; $00C76E   |
    JMP CODE_0000C7     ; $00C771   |

CODE_00C775:
    SEP #$20            ; $00C775   |
    RTL                 ; $00C777   |

CODE_00C778: REP #$20                                   ;$00C778   | 
CODE_00C77A: PHB                                        ;$00C77A   | 
CODE_00C77B: PHK                                        ;$00C77B   | 
CODE_00C77C: PLB                                        ;$00C77C   | 
CODE_00C77D: LDA $0D21                                  ;$00C77D   | 
CODE_00C780: AND #$003F                                 ;$00C780   | 
CODE_00C783: STA $3016                                  ;$00C783   | 
CODE_00C786: STY $301C                                  ;$00C786   | 
CODE_00C789: LDA #$0051                                 ;$00C789   | 
CODE_00C78C: STA $3000                                  ;$00C78C   | 
CODE_00C78F: LDA #$49BC                                 ;$00C78F   | 
CODE_00C792: STA $3014                                  ;$00C792   | 
CODE_00C795: SEP #$10                                   ;$00C795   | 
CODE_00C797: LDA $0D1D                                  ;$00C797   | 
CODE_00C79A: STA $3012                                  ;$00C79A   | 
CODE_00C79D: LDA $0D1F                                  ;$00C79D   | 
CODE_00C7A0: STA $3010                                  ;$00C7A0   | 
CODE_00C7A3: LDX #$09                                   ;$00C7A3   | 
CODE_00C7A5: LDA #$E92F                                 ;$00C7A5   | 
CODE_00C7A8: JSL CODE_7EDE44                            ;$00C7A8   |  GSU init

CODE_00C7AC: LDA $3016                                  ;$00C7AC   | 
CODE_00C7AF: STA $0D21                                  ;$00C7AF   | 
CODE_00C7B2: LDA $3010                                  ;$00C7B2   | 
CODE_00C7B5: STA $0D1F                                  ;$00C7B5   | 
CODE_00C7B8: LDA $3012                                  ;$00C7B8   | 
CODE_00C7BB: STA $0D1D                                  ;$00C7BB   | 
CODE_00C7BE: INC $0CF9                                  ;$00C7BE   | 
CODE_00C7C1: PLB                                        ;$00C7C1   | 
CODE_00C7C2: LDA #$5038                                 ;$00C7C2   | 
CODE_00C7C5: STA $0D1B                                  ;$00C7C5   | 
CODE_00C7C8: REP #$10                                   ;$00C7C8   | 
CODE_00C7CA: LDA #$AAAA                                 ;$00C7CA   | 
CODE_00C7CD: STA $6C00                                  ;$00C7CD   | 
CODE_00C7D0: STA $6C02                                  ;$00C7D0   | 
CODE_00C7D3: LDA #$00E0                                 ;$00C7D3   | 
CODE_00C7D6: STA $0D19                                  ;$00C7D6   | 
CODE_00C7D9: SEP #$20                                   ;$00C7D9   | 
CODE_00C7DB: LDX #$0000                                 ;$00C7DB   | 
CODE_00C7DE: REP #$20                                   ;$00C7DE   | 
CODE_00C7E0: TXA                                        ;$00C7E0   | 
CODE_00C7E1: AND #$00FF                                 ;$00C7E1   | 
CODE_00C7E4: LSR A                                      ;$00C7E4   | 
CODE_00C7E5: ORA #$35C0                                 ;$00C7E5   | 
CODE_00C7E8: STA $6A02,x                                ;$00C7E8   | 
CODE_00C7EB: ORA #$0020                                 ;$00C7EB   | 
CODE_00C7EE: STA $6A22,x                                ;$00C7EE   | 
CODE_00C7F1: LDA $0B4C                                  ;$00C7F1   | 
CODE_00C7F4: SEC                                        ;$00C7F4   | 
CODE_00C7F5: SBC $0D19                                  ;$00C7F5   | 
CODE_00C7F8: SEP #$20                                   ;$00C7F8   | 
CODE_00C7FA: STA $6A00,x                                ;$00C7FA   | 
CODE_00C7FD: STA $6A20,x                                ;$00C7FD   | 

CODE_00C800: LDA $0D19                                  ;$00C800   | 
CODE_00C803: SEC                                        ;$00C803   | 
CODE_00C804: SBC #$10                                   ;$00C804   | 
CODE_00C806: STA $0D19                                  ;$00C806   | 
CODE_00C809: LDA $0D1B                                  ;$00C809   | 
CODE_00C80C: STA $6A01,x                                ;$00C80C   | 
CODE_00C80F: LDA $0D1C                                  ;$00C80F   | 
CODE_00C812: STA $6A21,x                                ;$00C812   | 
CODE_00C815: INX                                        ;$00C815   | 
CODE_00C816: INX                                        ;$00C816   | 
CODE_00C817: INX                                        ;$00C817   | 
CODE_00C818: INX                                        ;$00C818   | 
CODE_00C819: CPX #$0020                                 ;$00C819   | 
CODE_00C81C: BCC CODE_00C7DE                            ;$00C81C   | 
CODE_00C81E: SEP #$10                                   ;$00C81E   | 
CODE_00C820: RTL                                        ;$00C820   | 

CODE_00C821: LDA $0125                                  ;$00C821   | 
CODE_00C824: BNE CODE_00C842                            ;$00C824   | 

.WaitForHBlank
CODE_00C826: BIT $4212                                  ;$00C826   | 
CODE_00C829: BVS CODE_00C826                            ;$00C829   | 

CODE_00C82B: BIT $4212                                  ;$00C82B   | 
CODE_00C82E: BVC CODE_00C82B                            ;$00C82E   | 

CODE_00C830: LDA $094A                                  ;$00C830   | 
CODE_00C833: STA $420C                                  ;$00C833   | 
CODE_00C836: STZ $2100                                  ;$00C836   | 
CODE_00C839: LDA #$50                                   ;$00C839   | 
CODE_00C83B: STA $4207                                  ;$00C83B   | 
CODE_00C83E: LDA #$0E                                   ;$00C83E   | 
CODE_00C840: BRA CODE_00C85C                            ;$00C840   | 

CODE_00C842: DEC A                                      ;$00C842   | 
CODE_00C843: BNE CODE_00C862                            ;$00C843   | 
CODE_00C845: BIT $4212                                  ;$00C845   | 
CODE_00C848: BVS CODE_00C845                            ;$00C848   | 
CODE_00C84A: BIT $4212                                  ;$00C84A   | 
CODE_00C84D: BVC CODE_00C84A                            ;$00C84D   | 
CODE_00C84F: LDA $0200                                  ;$00C84F   | 
CODE_00C852: STA $2100                                  ;$00C852   | 
CODE_00C855: LDA #$50                                   ;$00C855   | 
CODE_00C857: STA $4207                                  ;$00C857   | 
CODE_00C85A: LDA #$C6                                   ;$00C85A   | 
CODE_00C85C: INC $0125                                  ;$00C85C   | 
CODE_00C85F: JMP CODE_00C434                            ;$00C85F   | 

CODE_00C862: BIT $4212                                  ;$00C862   | 
CODE_00C865: BVS CODE_00C862                            ;$00C865   | 
CODE_00C867: BIT $4212                                  ;$00C867   | 
CODE_00C86A: BVC CODE_00C867                            ;$00C86A   | 
CODE_00C86C: LDY #$8F                                   ;$00C86C   | 
CODE_00C86E: STY $2100                                  ;$00C86E   | 
CODE_00C871: STZ $420C                                  ;$00C871   | 
CODE_00C874: LDX $011C                                  ;$00C874   | 
CODE_00C877: JMP ($C47D,x)                              ;$00C877   | 

CODE_00C87A: LDA $011B                                  ;$00C87A   | 
CODE_00C87D: BNE CODE_00C882                            ;$00C87D   | 
CODE_00C87F: JMP CODE_00CA10                            ;$00C87F   | 

CODE_00C882: STZ $011B                                  ;$00C882   | 
CODE_00C885: JSR CODE_00E3DF                            ;$00C885   | 
CODE_00C888: JSR CODE_00E3AA                            ;$00C888   | 
CODE_00C88B: REP #$20                                   ;$00C88B   | 
CODE_00C88D: PHD                                        ;$00C88D   | 
CODE_00C88E: LDA #$420B                                 ;$00C88E   | 
CODE_00C891: TCD                                        ;$00C891   | 
CODE_00C892: LDX #$01                                   ;$00C892   | 
CODE_00C894: JSR CODE_00DE0C                            ;$00C894   | 
CODE_00C897: JSR CODE_00D4AC                            ;$00C897   | 
CODE_00C89A: JSR CODE_00D4E5                            ;$00C89A   | 
CODE_00C89D: LDY #$80                                   ;$00C89D   | 
CODE_00C89F: STY $2115                                  ;$00C89F   | 
CODE_00C8A2: LDA #$1801                                 ;$00C8A2   | 
CODE_00C8A5: STA $F5                                    ;$00C8A5   | 
CODE_00C8A7: LDA $0D15                                  ;$00C8A7   | 
CODE_00C8AA: BEQ CODE_00C8C5                            ;$00C8AA   | 
CODE_00C8AC: LDA #$7000                                 ;$00C8AC   | 
CODE_00C8AF: STA $2116                                  ;$00C8AF   | 
CODE_00C8B2: LDA #$4C00                                 ;$00C8B2   | 
CODE_00C8B5: STA $F7                                    ;$00C8B5   | 
CODE_00C8B7: LDY #$70                                   ;$00C8B7   | 
CODE_00C8B9: STY $F9                                    ;$00C8B9   | 
CODE_00C8BB: LDA #$0800                                 ;$00C8BB   | 
CODE_00C8BE: STA $FA                                    ;$00C8BE   | 
CODE_00C8C0: STX $00                                    ;$00C8C0   | 
CODE_00C8C2: STZ $0D15                                  ;$00C8C2   | 
CODE_00C8C5: LDA $0CF9                                  ;$00C8C5   | 
CODE_00C8C8: BEQ CODE_00C8E0                            ;$00C8C8   | 
CODE_00C8CA: STA $FA                                    ;$00C8CA   | 
CODE_00C8CC: LDA #$5000                                 ;$00C8CC   | 
CODE_00C8CF: STA $2116                                  ;$00C8CF   | 
CODE_00C8D2: LDA #$5800                                 ;$00C8D2   | 
CODE_00C8D5: STA $F7                                    ;$00C8D5   | 
CODE_00C8D7: LDY #$70                                   ;$00C8D7   | 
CODE_00C8D9: STY $F9                                    ;$00C8D9   | 
CODE_00C8DB: STX $00                                    ;$00C8DB   | 
CODE_00C8DD: STZ $0CF9                                  ;$00C8DD   | 
CODE_00C8E0: LDA $0B85                                  ;$00C8E0   | 
CODE_00C8E3: BNE CODE_00C8E8                            ;$00C8E3   | 
CODE_00C8E5: JMP CODE_00C9BA                            ;$00C8E5   | 

CODE_00C8E8: LDA #$5400                                 ;$00C8E8   | 
CODE_00C8EB: STA $2116                                  ;$00C8EB   | 
CODE_00C8EE: LDY #$40                                   ;$00C8EE   | 
CODE_00C8F0: LDA $6128                                  ;$00C8F0   | 
CODE_00C8F3: STA $F7                                    ;$00C8F3   | 
CODE_00C8F5: LDA #$0053                                 ;$00C8F5   | 
CODE_00C8F8: STA $F9                                    ;$00C8F8   | 
CODE_00C8FA: STY $FA                                    ;$00C8FA   | 
CODE_00C8FC: STX $00                                    ;$00C8FC   | 
CODE_00C8FE: LDA $612C                                  ;$00C8FE   | 
CODE_00C901: STA $F7                                    ;$00C901   | 
CODE_00C903: STY $FA                                    ;$00C903   | 
CODE_00C905: STX $00                                    ;$00C905   | 
CODE_00C907: LDA $6130                                  ;$00C907   | 
CODE_00C90A: STA $F7                                    ;$00C90A   | 
CODE_00C90C: STY $FA                                    ;$00C90C   | 
CODE_00C90E: STX $00                                    ;$00C90E   | 
CODE_00C910: LDA $6134                                  ;$00C910   | 
CODE_00C913: STA $F7                                    ;$00C913   | 
CODE_00C915: STY $FA                                    ;$00C915   | 
CODE_00C917: STX $00                                    ;$00C917   | 
CODE_00C919: LDA $6138                                  ;$00C919   | 
CODE_00C91C: STA $F7                                    ;$00C91C   | 
CODE_00C91E: STY $FA                                    ;$00C91E   | 
CODE_00C920: STX $00                                    ;$00C920   | 
CODE_00C922: LDA $613C                                  ;$00C922   | 
CODE_00C925: STA $F7                                    ;$00C925   | 
CODE_00C927: STY $FA                                    ;$00C927   | 
CODE_00C929: STX $00                                    ;$00C929   | 
CODE_00C92B: LDA $6140                                  ;$00C92B   | 
CODE_00C92E: STA $F7                                    ;$00C92E   | 
CODE_00C930: STY $FA                                    ;$00C930   | 
CODE_00C932: STX $00                                    ;$00C932   | 
CODE_00C934: LDA $6144                                  ;$00C934   | 
CODE_00C937: STA $F7                                    ;$00C937   | 
CODE_00C939: STY $FA                                    ;$00C939   | 
CODE_00C93B: STX $00                                    ;$00C93B   | 
CODE_00C93D: LDA #$5500                                 ;$00C93D   | 
CODE_00C940: STA $2116                                  ;$00C940   | 
CODE_00C943: SEP #$20                                   ;$00C943   | 
CODE_00C945: LDA $6128                                  ;$00C945   | 
CODE_00C948: STA $F7                                    ;$00C948   | 
CODE_00C94A: LDA $612B                                  ;$00C94A   | 
CODE_00C94D: STA $F8                                    ;$00C94D   | 
CODE_00C94F: STY $FA                                    ;$00C94F   | 
CODE_00C951: STX $00                                    ;$00C951   | 
CODE_00C953: LDA $612C                                  ;$00C953   | 
CODE_00C956: STA $F7                                    ;$00C956   | 
CODE_00C958: LDA $612F                                  ;$00C958   | 
CODE_00C95B: STA $F8                                    ;$00C95B   | 
CODE_00C95D: STY $FA                                    ;$00C95D   | 
CODE_00C95F: STX $00                                    ;$00C95F   | 
CODE_00C961: LDA $6130                                  ;$00C961   | 
CODE_00C964: STA $F7                                    ;$00C964   | 
CODE_00C966: LDA $6133                                  ;$00C966   | 
CODE_00C969: STA $F8                                    ;$00C969   | 
CODE_00C96B: STY $FA                                    ;$00C96B   | 
CODE_00C96D: STX $00                                    ;$00C96D   | 
CODE_00C96F: LDA $6134                                  ;$00C96F   | 
CODE_00C972: STA $F7                                    ;$00C972   | 
CODE_00C974: LDA $6137                                  ;$00C974   | 
CODE_00C977: STA $F8                                    ;$00C977   | 
CODE_00C979: STY $FA                                    ;$00C979   | 
CODE_00C97B: STX $00                                    ;$00C97B   | 
CODE_00C97D: LDA $6138                                  ;$00C97D   | 
CODE_00C980: STA $F7                                    ;$00C980   | 
CODE_00C982: LDA $613B                                  ;$00C982   | 
CODE_00C985: STA $F8                                    ;$00C985   | 
CODE_00C987: STY $FA                                    ;$00C987   | 
CODE_00C989: STX $00                                    ;$00C989   | 
CODE_00C98B: LDA $613C                                  ;$00C98B   | 
CODE_00C98E: STA $F7                                    ;$00C98E   | 
CODE_00C990: LDA $613F                                  ;$00C990   | 
CODE_00C993: STA $F8                                    ;$00C993   | 
CODE_00C995: STY $FA                                    ;$00C995   | 
CODE_00C997: STX $00                                    ;$00C997   | 
CODE_00C999: LDA $6140                                  ;$00C999   | 
CODE_00C99C: STA $F7                                    ;$00C99C   | 
CODE_00C99E: LDA $6143                                  ;$00C99E   | 
CODE_00C9A1: STA $F8                                    ;$00C9A1   | 
CODE_00C9A3: STY $FA                                    ;$00C9A3   | 
CODE_00C9A5: STX $00                                    ;$00C9A5   | 
CODE_00C9A7: LDA $6144                                  ;$00C9A7   | 
CODE_00C9AA: STA $F7                                    ;$00C9AA   | 
CODE_00C9AC: LDA $6147                                  ;$00C9AC   | 
CODE_00C9AF: STA $F8                                    ;$00C9AF   | 
CODE_00C9B1: STY $FA                                    ;$00C9B1   | 
CODE_00C9B3: STX $00                                    ;$00C9B3   | 
CODE_00C9B5: REP #$20                                   ;$00C9B5   | 
CODE_00C9B7: STZ $0B85                                  ;$00C9B7   | 

CODE_00C9BA: PLD                                        ;$00C9BA   | 
CODE_00C9BB: SEP #$20                                   ;$00C9BB   | 
CODE_00C9BD: JSR CODE_00E507                            ;$00C9BD   | 
CODE_00C9C0: LDA $39                                    ;$00C9C0   | 
CODE_00C9C2: STA $210D                                  ;$00C9C2   | 
CODE_00C9C5: LDA $3A                                    ;$00C9C5   | 
CODE_00C9C7: STA $210D                                  ;$00C9C7   | 
CODE_00C9CA: LDA $3B                                    ;$00C9CA   | 
CODE_00C9CC: STA $210E                                  ;$00C9CC   | 
CODE_00C9CF: LDA $3C                                    ;$00C9CF   | 
CODE_00C9D1: STA $210E                                  ;$00C9D1   | 
CODE_00C9D4: LDA $3D                                    ;$00C9D4   | 
CODE_00C9D6: STA $210F                                  ;$00C9D6   | 
CODE_00C9D9: LDA $3E                                    ;$00C9D9   | 
CODE_00C9DB: STA $210F                                  ;$00C9DB   | 
CODE_00C9DE: LDA $3F                                    ;$00C9DE   | 
CODE_00C9E0: STA $2110                                  ;$00C9E0   | 
CODE_00C9E3: LDA $40                                    ;$00C9E3   | 
CODE_00C9E5: STA $2110                                  ;$00C9E5   | 
CODE_00C9E8: LDA $41                                    ;$00C9E8   | 
CODE_00C9EA: STA $2111                                  ;$00C9EA   | 
CODE_00C9ED: LDA $42                                    ;$00C9ED   | 
CODE_00C9EF: STA $2111                                  ;$00C9EF   | 
CODE_00C9F2: LDA $43                                    ;$00C9F2   | 
CODE_00C9F4: STA $2112                                  ;$00C9F4   | 
CODE_00C9F7: LDA $44                                    ;$00C9F7   | 
CODE_00C9F9: STA $2112                                  ;$00C9F9   | 
CODE_00C9FC: LDA $45                                    ;$00C9FC   | 
CODE_00C9FE: STA $2113                                  ;$00C9FE   | 
CODE_00CA01: LDA $46                                    ;$00CA01   | 
CODE_00CA03: STA $2113                                  ;$00CA03   | 
CODE_00CA06: LDA $47                                    ;$00CA06   | 
CODE_00CA08: STA $2114                                  ;$00CA08   | 
CODE_00CA0B: LDA $48                                    ;$00CA0B   | 
CODE_00CA0D: STA $2114                                  ;$00CA0D   | 
CODE_00CA10: LDA $094B                                  ;$00CA10   | 
CODE_00CA13: STA $2101                                  ;$00CA13   | 
CODE_00CA16: LDA $095F                                  ;$00CA16   | 
CODE_00CA19: STA $2107                                  ;$00CA19   | 
CODE_00CA1C: LDA $0960                                  ;$00CA1C   | 
CODE_00CA1F: STA $2108                                  ;$00CA1F   | 
CODE_00CA22: LDA $096B                                  ;$00CA22   | 
CODE_00CA25: STA $2130                                  ;$00CA25   | 
CODE_00CA28: LDA $096C                                  ;$00CA28   | 
CODE_00CA2B: STA $2131                                  ;$00CA2B   | 
CODE_00CA2E: LDA $095B                                  ;$00CA2E   | 
CODE_00CA31: STA $2106                                  ;$00CA31   | 

CODE_00CA34: REP #$20                                   ;$00CA34   | 
CODE_00CA36: LDA $1407                                  ;$00CA36   | 
CODE_00CA39: STA $7E5B99                                ;$00CA39   | 
CODE_00CA3D: STA $7E5B9C                                ;$00CA3D   | 
CODE_00CA41: LDA #$4300                                 ;$00CA41   | 
CODE_00CA44: TCD                                        ;$00CA44   | 
CODE_00CA45: LDA $12                                    ;$00CA45   | 
CODE_00CA47: STA $18                                    ;$00CA47   | 
CODE_00CA49: LDA $22                                    ;$00CA49   | 
CODE_00CA4B: STA $28                                    ;$00CA4B   | 
CODE_00CA4D: LDA $32                                    ;$00CA4D   | 
CODE_00CA4F: STA $38                                    ;$00CA4F   | 
CODE_00CA51: LDA $42                                    ;$00CA51   | 
CODE_00CA53: STA $48                                    ;$00CA53   | 
CODE_00CA55: LDA $52                                    ;$00CA55   | 
CODE_00CA57: STA $58                                    ;$00CA57   | 
CODE_00CA59: LDA $62                                    ;$00CA59   | 
CODE_00CA5B: STA $68                                    ;$00CA5B   | 
CODE_00CA5D: LDA $72                                    ;$00CA5D   | 
CODE_00CA5F: STA $78                                    ;$00CA5F   | 
CODE_00CA61: SEP #$20                                   ;$00CA61   | 
CODE_00CA63: LDA #$01                                   ;$00CA63   | 
CODE_00CA65: STA $1A                                    ;$00CA65   | 
CODE_00CA67: STA $2A                                    ;$00CA67   | 
CODE_00CA69: STA $3A                                    ;$00CA69   | 
CODE_00CA6B: STA $4A                                    ;$00CA6B   | 
CODE_00CA6D: STA $5A                                    ;$00CA6D   | 
CODE_00CA6F: STA $6A                                    ;$00CA6F   | 
CODE_00CA71: STA $7A                                    ;$00CA71   | 
CODE_00CA73: STZ $0125                                  ;$00CA73   | 
CODE_00CA76: LDA #$50                                   ;$00CA76   | 
CODE_00CA78: STA $4207                                  ;$00CA78   | 
CODE_00CA7B: LDA #$0C                                   ;$00CA7B   | 
CODE_00CA7D: JMP CODE_00C434                            ;$00CA7D   | 

; vram address stuff?
DATA_00CA80:         dw $2000, $2000, $1000, $3000
DATA_00CA88:         dw $0000, $4000

DATA_00CA8C:         dw $96DE, $56DE, $76DE, $76DE
DATA_00CA94:         dw $56DE, $96DE

DATA_00CA98:         db $50, $52

CODE_00CA9A:
    BIT $4212           ; $00CA9A   |
    BVS CODE_00CA9A     ; $00CA9D   |

CODE_00CA9F:
    BIT $4212           ; $00CA9F   |
    BVC CODE_00CA9F     ; $00CAA2   |
    LDA #$8F            ; $00CAA4   |
    STA $2100           ; $00CAA6   |
    JSR CODE_00D4C3     ; $00CAA9   |
    LDA $0069           ; $00CAAC   |
    BEQ CODE_00CAF7     ; $00CAAF   |
    ASL A               ; $00CAB1   |
    ORA $006D           ; $00CAB2   |
    ASL A               ; $00CAB5   |
    TAX                 ; $00CAB6   |
    REP #$20            ; $00CAB7   |
    LDY #$80            ; $00CAB9   |
    STY $2115           ; $00CABB   |
    LDA $7ECA7C,x       ; $00CABE   |
    STA $2116           ; $00CAC2   |
    LDA #$1801          ; $00CAC5   |
    STA $4300           ; $00CAC8   |
    LDA $7ECA88,x       ; $00CACB   |
    STA $4302           ; $00CACF   |
    LDA #$2000          ; $00CAD2   |
    STA $4305           ; $00CAD5   |
    LDY #$7F            ; $00CAD8   |
    STY $4304           ; $00CADA   |
    LDY #$01            ; $00CADD   |
    STY $420B           ; $00CADF   |

    SEP #$20            ; $00CAE2   |
    DEC $0069           ; $00CAE4   |
    BNE CODE_00CAFC     ; $00CAE7   |
    LDX $6D             ; $00CAE9   |
    LDA $7ECA98,x       ; $00CAEB   |
    STA $210B           ; $00CAEF   |
    TXA                 ; $00CAF2   |
    EOR #$01            ; $00CAF3   |
    STA $6D             ; $00CAF5   |

CODE_00CAF7:
    LDA $011B           ; $00CAF7   |
    BNE CODE_00CB14     ; $00CAFA   |

CODE_00CAFC:
    BIT $4212           ; $00CAFC   |
    BVS CODE_00CAFC     ; $00CAFF   |

CODE_00CB01:
    BIT $4212           ; $00CB01   |
    BVC CODE_00CB01     ; $00CB04   |
    LDA $0200           ; $00CB06   |
    STA $2100           ; $00CB09   |
    LDA #$B1            ; $00CB0C   |
    STA $4200           ; $00CB0E   |
    JMP CODE_00CB97     ; $00CB11   |

CODE_00CB14:
    STZ $011B           ; $00CB14   |
    REP #$20            ; $00CB17   |
    LDA #$420B          ; $00CB19   |
    TCD                 ; $00CB1C   |
    LDX #$06            ; $00CB1D   |

CODE_00CB1F:
    LDA $0B93,x         ; $00CB1F   |
    STA $7017C2,x       ; $00CB22   |
    LDA $0B9B,x         ; $00CB26   |
    STA $7017E2,x       ; $00CB29   |
    DEX                 ; $00CB2D   |
    DEX                 ; $00CB2E   |
    BPL CODE_00CB1F     ; $00CB2F   |
    LDX #$01            ; $00CB31   |
    JSR CODE_00D52B     ; $00CB33   |
    LDA $0BD3           ; $00CB36   |
    BEQ CODE_00CB5B     ; $00CB39   |
    LDA $0BD5           ; $00CB3B   |
    STA $2116           ; $00CB3E   |
    LDA #$1801          ; $00CB41   |
    STA $F5             ; $00CB44   |
    LDA #$1C00          ; $00CB46   |
    STA $F7             ; $00CB49   |
    LDY #$70            ; $00CB4B   |
    STY $F9             ; $00CB4D   |
    LDA $0BD7           ; $00CB4F   |
    STA $FA             ; $00CB52   |
    LDY #$01            ; $00CB54   |
    STY $00             ; $00CB56   |
    STZ $0BD3           ; $00CB58   |

CODE_00CB5B:
    LDA #$0000          ; $00CB5B   |
    TCD                 ; $00CB5E   |
    SEP #$20            ; $00CB5F   |
    JSR CODE_00E507     ; $00CB61   |
    LDA $0200           ; $00CB64   |
    STA $2100           ; $00CB67   |
    LDA #$B1            ; $00CB6A   |
    STA $4200           ; $00CB6C   |
    LDA $006B           ; $00CB6F   |
    BEQ CODE_00CB97     ; $00CB72   |
    STZ $006B           ; $00CB74   |
    STA $0069           ; $00CB77   |
    REP #$20            ; $00CB7A   |
    LDA #$56DE          ; $00CB7C   |
    STA $20             ; $00CB7F   |
    LDY #$7F            ; $00CB81   |
    STY $22             ; $00CB83   |
    LDA #$1C00          ; $00CB85   |
    STA $23             ; $00CB88   |
    LDY #$70            ; $00CB8A   |
    STY $25             ; $00CB8C   |
    LDA #$6000          ; $00CB8E   |
    JSL $008288         ; $00CB91   |
    SEP #$20            ; $00CB95   |

CODE_00CB97:
    REP #$20            ; $00CB97   |
    LDA $00             ; $00CB99   |
    PHA                 ; $00CB9B   |
    LDX $0B8F           ; $00CB9C   |
    LDA $0B93           ; $00CB9F   |
    CLC                 ; $00CBA2   |
    ADC $7ECC58,x       ; $00CBA3   |
    BMI CODE_00CBB5     ; $00CBA7   |
    STA $0B93           ; $00CBA9   |
    STA $0B97           ; $00CBAC   |
    STA $0B9D           ; $00CBAF   |
    STA $0B9F           ; $00CBB2   |

CODE_00CBB5:
    LDX #$00            ; $00CBB5   |
    LDA #$F080          ; $00CBB7   |

CODE_00CBBA:
    STA $096D,x         ; $00CBBA   |
    STZ $096F,x         ; $00CBBD   |
    STA $0A6D,x         ; $00CBC0   |
    STZ $0A6F,x         ; $00CBC3   |
    DEX                 ; $00CBC6   |
    DEX                 ; $00CBC7   |
    DEX                 ; $00CBC8   |
    DEX                 ; $00CBC9   |
    BNE CODE_00CBBA     ; $00CBCA   |
    LDA $0B8D           ; $00CBCC   |
    ASL A               ; $00CBCF   |
    TAX                 ; $00CBD0   |
    LDA $7ED2C2,x       ; $00CBD1   |
    STA $00             ; $00CBD5   |
    LDA #$007E          ; $00CBD7   |
    STA $02             ; $00CBDA   |
    REP #$10            ; $00CBDC   |
    LDX #$0000          ; $00CBDE   |
    TXY                 ; $00CBE1   |

CODE_00CBE2:
    REP #$20            ; $00CBE2   |
    LDA [$00],y         ; $00CBE4   |
    STA $0A             ; $00CBE6   |
    INY                 ; $00CBE8   |
    INY                 ; $00CBE9   |
    SEP #$20            ; $00CBEA   |

CODE_00CBEC:
    LDA [$00],y         ; $00CBEC   |
    CMP #$FF            ; $00CBEE   |
    BEQ CODE_00CC31     ; $00CBF0   |
    PHA                 ; $00CBF2   |
    AND #$EF            ; $00CBF3   |
    STA $096F,x         ; $00CBF5   |
    ORA #$10            ; $00CBF8   |
    STA $0973,x         ; $00CBFA   |
    PLA                 ; $00CBFD   |
    AND #$10            ; $00CBFE   |
    LSR A               ; $00CC00   |
    LSR A               ; $00CC01   |
    LSR A               ; $00CC02   |
    ORA #$3D            ; $00CC03   |
    STA $0970,x         ; $00CC05   |
    STA $0974,x         ; $00CC08   |
    LDA $0A             ; $00CC0B   |
    STA $096D,x         ; $00CC0D   |
    STA $0971,x         ; $00CC10   |
    INY                 ; $00CC13   |
    CLC                 ; $00CC14   |
    ADC [$00],y         ; $00CC15   |
    STA $0A             ; $00CC17   |
    LDA $0B             ; $00CC19   |
    STA $096E,x         ; $00CC1B   |
    CLC                 ; $00CC1E   |
    ADC #$08            ; $00CC1F   |
    STA $0972,x         ; $00CC21   |
    REP #$20            ; $00CC24   |
    TXA                 ; $00CC26   |
    CLC                 ; $00CC27   |
    ADC #$0008          ; $00CC28   |
    TAX                 ; $00CC2B   |
    INY                 ; $00CC2C   |
    SEP #$20            ; $00CC2D   |
    BRA CODE_00CBEC     ; $00CC2F   |

CODE_00CC31:
    INY                 ; $00CC31   |
    LDA [$00],y         ; $00CC32   |
    BEQ CODE_00CC50     ; $00CC34   |
    INY                 ; $00CC36   |
    DEC A               ; $00CC37   |
    BEQ CODE_00CBE2     ; $00CC38   |
    DEC A               ; $00CC3A   |
    BEQ CODE_00CC46     ; $00CC3B   |
    LDA $0A             ; $00CC3D   |
    CLC                 ; $00CC3F   |
    ADC #$08            ; $00CC40   |
    STA $0A             ; $00CC42   |
    BRA CODE_00CBEC     ; $00CC44   |

CODE_00CC46:
    LDA [$00],y         ; $00CC46   |
    CLC                 ; $00CC48   |
    ADC $0B             ; $00CC49   |
    STA $0B             ; $00CC4B   |
    INY                 ; $00CC4D   |
    BRA CODE_00CBEC     ; $00CC4E   |

CODE_00CC50:
    REP #$20            ; $00CC50   |
    PLA                 ; $00CC52   |
    STA $00             ; $00CC53   |
    SEP #$30            ; $00CC55   |
    RTS                 ; $00CC57   |

DATA_00CC58:         db $BE, $F7, $42, $08

; credits text
DATA_00CC5C:         dw $A857, $08DA, $08B5, $0498
DATA_00CC64:         dw $07B9, $077C, $087A, $08BB
DATA_00CC6C:         dw $089E, $07B9, $08BA, $085C
DATA_00CC74:         dw $00FF, $A449, $08F5, $0878
DATA_00CC7C:         dw $089A, $0878, $08BA, $087F
DATA_00CC84:         dw $0C98, $08F5, $077C, $08D9
DATA_00CC8C:         dw $08BC, $089A, $0878, $01FF
DATA_00CC94:         dw $B443, $08F5, $089E, $08BA
DATA_00CC9C:         dw $087F, $0498, $087F, $0498
DATA_00CCA4:         dw $089A, $109E, $08D7, $0878
DATA_00CCAC:         dw $089A, $0878, $087E, $089E
DATA_00CCB4:         dw $00FF, $A449, $08F4, $087F
DATA_00CCBC:         dw $0498, $087E, $077C, $077D
DATA_00CCC4:         dw $08BC, $089C, $0C98, $08D1
DATA_00CCCC:         dw $0498, $089D, $089E, $01FF
DATA_00CCD4:         dw $B450, $08D1, $0498, $087B
DATA_00CCDC:         dw $077C, $089A, $0C98, $08D4
DATA_00CCE4:         dw $089E, $089D, $089D, $089E
DATA_00CCEC:         dw $00FF, $A849, $08DA, $08F1
DATA_00CCF4:         dw $07B9, $089E, $087E, $07B9
DATA_00CCFC:         dw $0878, $089C, $089C, $077C
DATA_00CD04:         dw $07B9, $08BA, $085C, $00FF
DATA_00CD0C:         dw $A44A, $08F5, $089E, $08BA
DATA_00CD14:         dw $087F, $0498, $109E, $06D2
DATA_00CD1C:         dw $08BE, $0878, $08BE, $0878
DATA_00CD24:         dw $089A, $0898, $01FF, $B45A
DATA_00CD2C:         dw $08D6, $0878, $08BA, $0878
DATA_00CD34:         dw $07B9, $10BC, $08D7, $0498
DATA_00CD3C:         dw $0498, $00FF, $A452, $08D4
DATA_00CD44:         dw $0498, $08D8, $089E, $08BA
DATA_00CD4C:         dw $087F, $1098, $08D4, $089E
DATA_00CD54:         dw $087B, $0878, $01FF, $B442
DATA_00CD5C:         dw $08F4, $0878, $08BB, $089E
DATA_00CD64:         dw $07B9, $10BC, $08F5, $0878
DATA_00CD6C:         dw $089A, $0878, $087F, $0878
DATA_00CD74:         dw $08BB, $0878, $00FF, $A449
DATA_00CD7C:         dw $08D4, $0878, $08D9, $08BC
DATA_00CD84:         dw $0878, $089A, $0C98, $08D6
DATA_00CD8C:         dw $089E, $07B9, $0498, $08BB
DATA_00CD94:         dw $0878, $01FF, $B443, $081A
DATA_00CD9C:         dw $08BC, $0498, $087A, $087F
DATA_00CDA4:         dw $0C98, $081A, $0878, $089C
DATA_00CDAC:         dw $0878, $089C, $089E, $08BB
DATA_00CDB4:         dw $089E, $00FF, $A438, $08F4
DATA_00CDBC:         dw $087F, $0498, $087E, $077C
DATA_00CDC4:         dw $087F, $0498, $07B9, $109E
DATA_00CDCC:         dw $08D4, $0878, $08BA, $0878
DATA_00CDD4:         dw $089C, $0878, $08BB, $08BA
DATA_00CDDC:         dw $08BC, $01FF, $B449, $08F4
DATA_00CDE4:         dw $087F, $0498, $087E, $077C
DATA_00CDEC:         dw $089A, $0C98, $081A, $089E
DATA_00CDF4:         dw $08BA, $087F, $0498, $087B
DATA_00CDFC:         dw $0878, $00FF, $A440, $081A
DATA_00CE04:         dw $0878, $08BA, $08BC, $089D
DATA_00CE0C:         dw $089E, $07B9, $0C98, $08F5
DATA_00CE14:         dw $0878, $089A, $077C, $08BB
DATA_00CE1C:         dw $0878, $089D, $0498, $00FF
DATA_00CE24:         dw $A83D, $08DA, $08B4, $089E
DATA_00CE2C:         dw $08BC, $07B9, $08BA, $0F7C
DATA_00CE34:         dw $08B5, $077C, $08BA, $0498
DATA_00CE3C:         dw $087E, $089D, $077C, $07B9
DATA_00CE44:         dw $08BA, $085C, $00FF, $A43E
DATA_00CE4C:         dw $081A, $0878, $08BA, $08BC
DATA_00CE54:         dw $087F, $0498, $08BA, $1078
DATA_00CE5C:         dw $081A, $0878, $089C, $0878
DATA_00CE64:         dw $089C, $08BC, $07B9, $0878
DATA_00CE6C:         dw $01FF, $B45A, $08D4, $077C
DATA_00CE74:         dw $089D, $08BB, $1078, $08F6
DATA_00CE7C:         dw $08BA, $08BC, $0498, $00FF
DATA_00CE84:         dw $A442, $081A, $089E, $08BA
DATA_00CE8C:         dw $087F, $0498, $087F, $0498
DATA_00CE94:         dw $07B9, $109E, $08D7, $089E
DATA_00CE9C:         dw $089C, $089E, $08BB, $089E
DATA_00CEA4:         dw $01FF, $B460, $07B6, $0498
DATA_00CEAC:         dw $0799, $0C98, $08D7, $089E
DATA_00CEB4:         dw $08BB, $089E, $00FF, $A83F
DATA_00CEBC:         dw $08DA, $08F4, $089E, $08BC
DATA_00CEC4:         dw $089D, $107B, $08B4, $089E
DATA_00CECC:         dw $089C, $089F, $089E, $08BA
DATA_00CED4:         dw $077C, $07B9, $085C, $00FF
DATA_00CEDC:         dw $A45A, $08D4, $089E, $0799
DATA_00CEE4:         dw $0C98, $08D4, $089E, $089D
DATA_00CEEC:         dw $087B, $089E, $00FF, $A830
DATA_00CEF4:         dw $08DA, $08B4, $087F, $0878
DATA_00CEFC:         dw $07B9, $0878, $087A, $08BB
DATA_00CF04:         dw $077C, $0FB9, $08B5, $077C
DATA_00CF0C:         dw $08BA, $0498, $087E, $089D
DATA_00CF14:         dw $077C, $07B9, $08BA, $085C
DATA_00CF1C:         dw $00FF, $A44E, $08F4, $087F
DATA_00CF24:         dw $0498, $087E, $077C, $077D
DATA_00CF2C:         dw $08BC, $089C, $0C98, $08D1
DATA_00CF34:         dw $0498, $089D, $089E, $01FF
DATA_00CF3C:         dw $B44C, $08D1, $0498, $08BA
DATA_00CF44:         dw $0878, $08BA, $087F, $0C98
DATA_00CF4C:         dw $08D7, $089E, $087E, $0878
DATA_00CF54:         dw $089C, $0498, $00FF, $A44A
DATA_00CF5C:         dw $08D6, $0878, $08BA, $0878
DATA_00CF64:         dw $087F, $0498, $07B9, $109E
DATA_00CF6C:         dw $06D2, $0498, $089C, $08BC
DATA_00CF74:         dw $07B9, $0878, $01FF, $B445
DATA_00CF7C:         dw $08F5, $089E, $089C, $089E
DATA_00CF84:         dw $0878, $089A, $0C98, $08D4
DATA_00CF8C:         dw $08BC, $07B9, $089E, $08BC
DATA_00CF94:         dw $089C, $077C, $00FF, $A84B
DATA_00CF9C:         dw $08DA, $08B4, $08DB, $08D0
DATA_00CFA4:         dw $08DB, $08B5, $077C, $08BA
DATA_00CFAC:         dw $0498, $087E, $089D, $077C
DATA_00CFB4:         dw $07B9, $085C, $00FF, $A448
DATA_00CFBC:         dw $081A, $089E, $08BA, $087F
DATA_00CFC4:         dw $0498, $0878, $089A, $0C98
DATA_00CFCC:         dw $08D4, $089E, $0498, $08D9
DATA_00CFD4:         dw $08BC, $089C, $0498, $00FF
DATA_00CFDC:         dw $A838, $08DA, $08F4, $089F
DATA_00CFE4:         dw $077C, $087A, $0498, $0878
DATA_00CFEC:         dw $0C9B, $08F5, $087F, $0878
DATA_00CFF4:         dw $089D, $089A, $10BA, $08F5
DATA_00CFFC:         dw $089E, $085C, $00FF, $A443
DATA_00D004:         dw $0818, $0878, $08BB, $0878
DATA_00D00C:         dw $07B9, $10BC, $081A, $0878
DATA_00D014:         dw $089C, $0878, $087E, $08BC
DATA_00D01C:         dw $087A, $087F, $0498, $01FF
DATA_00D024:         dw $B445, $081A, $089E, $08BA
DATA_00D02C:         dw $087F, $0498, $089A, $0C98
DATA_00D034:         dw $08D1, $0878, $07B9, $08BC
DATA_00D03C:         dw $087F, $0878, $089D, $0878
DATA_00D044:         dw $00FF, $A450, $081A, $089E
DATA_00D04C:         dw $0498, $087A, $087F, $0C98
DATA_00D054:         dw $08D4, $089E, $08BB, $0878
DATA_00D05C:         dw $0879, $077C, $01FF, $B44B
DATA_00D064:         dw $081A, $0878, $08BA, $08BC
DATA_00D06C:         dw $087F, $0498, $07B9, $109E
DATA_00D074:         dw $08F4, $0878, $089A, $0878
DATA_00D07C:         dw $0498, $00FF, $A44B, $08D1
DATA_00D084:         dw $0498, $07B9, $089E, $089D
DATA_00D08C:         dw $089E, $0879, $10BC, $08D4
DATA_00D094:         dw $0878, $089A, $08BC, $0498
DATA_00D09C:         dw $01FF, $B440, $08F4, $087F
DATA_00D0A4:         dw $0498, $087E, $077C, $089A
DATA_00D0AC:         dw $0C98, $081A, $0878, $089C
DATA_00D0B4:         dw $0878, $08BA, $087F, $0498
DATA_00D0BC:         dw $07B9, $089E, $00FF, $A44C
DATA_00D0C4:         dw $08D4, $0498, $089C, $0498
DATA_00D0CC:         dw $08D8, $089E, $08BA, $087F
DATA_00D0D4:         dw $0C98, $07B7, $08BC, $089A
DATA_00D0DC:         dw $08BC, $0498, $01FF, $B45B
DATA_00D0E4:         dw $08D4, $077C, $0498, $08D9
DATA_00D0EC:         dw $109E, $08D4, $0878, $08BB
DATA_00D0F4:         dw $089E, $00FF, $A449, $08F4
DATA_00D0FC:         dw $089E, $0498, $087A, $087F
DATA_00D104:         dw $0498, $07B9, $109E, $08F5
DATA_00D10C:         dw $089E, $089C, $0498, $08BB
DATA_00D114:         dw $0878, $01FF, $B44F, $08D6
DATA_00D11C:         dw $0498, $0F7C, $081A, $089E
DATA_00D124:         dw $08BA, $087F, $0498, $089C
DATA_00D12C:         dw $08BC, $07B9, $0878, $00FF
DATA_00D134:         dw $A449, $08D4, $077C, $089D
DATA_00D13C:         dw $08BA, $08BC, $089A, $0F7C
DATA_00D144:         dw $08F5, $0878, $089D, $0878
DATA_00D14C:         dw $0879, $077C, $01FF, $B445
DATA_00D154:         dw $08F5, $077C, $08BB, $08BA
DATA_00D15C:         dw $10BC, $08D1, $0878, $08BA
DATA_00D164:         dw $087F, $0498, $089C, $089E
DATA_00D16C:         dw $08BB, $089E, $00FF, $A451
DATA_00D174:         dw $08B5, $077C, $07B9, $077C
DATA_00D17C:         dw $0F9A, $0818, $087F, $0498
DATA_00D184:         dw $089F, $089F, $049B, $077C
DATA_00D18C:         dw $01FF, $B457, $08D1, $0498
DATA_00D194:         dw $07B9, $109E, $081A, $0878
DATA_00D19C:         dw $089C, $0878, $087B, $0878
DATA_00D1A4:         dw $00FF, $A858, $08DA, $08F1
DATA_00D1AC:         dw $07B9, $089E, $087B, $08BC
DATA_00D1B4:         dw $087A, $077C, $07B9, $085C
DATA_00D1BC:         dw $00FF, $A443, $08F4, $087F
DATA_00D1C4:         dw $0498, $087E, $077C, $07B9
DATA_00D1CC:         dw $10BC, $08D6, $0498, $08D8
DATA_00D1D4:         dw $0878, $089C, $089E, $08BB
DATA_00D1DC:         dw $089E, $00FF, $A834, $08DA
DATA_00D1E4:         dw $07B6, $08BF, $077C, $087A
DATA_00D1EC:         dw $08BC, $08BB, $0498, $08BD
DATA_00D1F4:         dw $0F7C, $08F1, $07B9, $089E
DATA_00D1FC:         dw $087B, $08BC, $087A, $077C
DATA_00D204:         dw $07B9, $085C, $00FF, $A446
DATA_00D20C:         dw $08D1, $0498, $07B9, $089E
DATA_00D214:         dw $08BA, $087F, $0C98, $081A
DATA_00D21C:         dw $0878, $089C, $0878, $08BC
DATA_00D224:         dw $087A, $087F, $0498, $00FF
DATA_00D22C:         dw $A41E, $07D5, $089E, $089E
DATA_00D234:         dw $089A, $10BA, $049B, $0498
DATA_00D23C:         dw $089A, $0F7C, $08BB, $087F
DATA_00D244:         dw $077C, $10D8, $087F, $0878
DATA_00D24C:         dw $08BD, $0F7C, $0878, $07B9
DATA_00D254:         dw $07B9, $0498, $08BD, $077C
DATA_00D25C:         dw $087B, $01FF, $B424, $08BE
DATA_00D264:         dw $087F, $077C, $07B9, $0F7C
DATA_00D26C:         dw $089C, $089E, $109C, $0878
DATA_00D274:         dw $089D, $107B, $087B, $0878
DATA_00D27C:         dw $107B, $049B, $0498, $08BD
DATA_00D284:         dw $077C, $08DB, $08DB, $08DB
DATA_00D28C:         dw $08DB, $00FF, $A442, $08D1
DATA_00D294:         dw $077C, $07B9, $089E, $077C
DATA_00D29C:         dw $10BA, $0878, $07B9, $0F7C
DATA_00D2A4:         dw $0879, $089E, $07B9, $089D
DATA_00D2AC:         dw $081F, $081F, $00FF, $A462
DATA_00D2B4:         dw $08F5, $08D1, $0FB6, $07B6
DATA_00D2BC:         dw $08D7, $08B5, $00FF

; credits text pointers
DATA_00D2C2:         dw $CC5C, $CC5C, $CC76, $CCB6
DATA_00D2CA:         dw $CCEE, $CD0C, $CD40, $CD7A
DATA_00D2D2:         dw $CDB8, $CE00, $CE24, $CE4A
DATA_00D2DA:         dw $CE84, $CEBA, $CEDC, $CEF2
DATA_00D2E2:         dw $CF1E, $CF5A, $CF9A, $CFBA
DATA_00D2EA:         dw $CFDC, $D002, $D046, $D080
DATA_00D2F2:         dw $D0C2, $D0F8, $D134, $D172
DATA_00D2FA:         dw $D1A6, $D1BE, $D1E0, $D20A
DATA_00D302:         dw $D22C, $D290, $D2B2

    LDA $0125           ; $00D308   |
    BNE CODE_00D329     ; $00D30B   |

CODE_00D30D:
    BIT $4212           ; $00D30D   |
    BVS CODE_00D30D     ; $00D310   |

CODE_00D312:
    BIT $4212           ; $00D312   |
    BVC CODE_00D312     ; $00D315   |
    LDA $094A           ; $00D317   |
    STA $420C           ; $00D31A   |
    STZ $2100           ; $00D31D   |
    LDA #$50            ; $00D320   |
    STA $4207           ; $00D322   |
    LDA #$08            ; $00D325   |
    BRA CODE_00D343     ; $00D327   |

CODE_00D329:
    DEC A               ; $00D329   |
    BNE CODE_00D34F     ; $00D32A   |

CODE_00D32C:
    BIT $4212           ; $00D32C   |
    BVS CODE_00D32C     ; $00D32F   |

CODE_00D331:
    BIT $4212           ; $00D331   |
    BVC CODE_00D331     ; $00D334   |
    LDA $0200           ; $00D336   |
    STA $2100           ; $00D339   |
    LDA #$50            ; $00D33C   |
    STA $4207           ; $00D33E   |
    LDA #$D8            ; $00D341   |

CODE_00D343:
    INC $0125           ; $00D343   |

CODE_00D346:
    STA $4209           ; $00D346   |
    LDA #$B1            ; $00D349   |
    STA $4200           ; $00D34B   |
    RTS                 ; $00D34E   |

CODE_00D34F:
    BIT $4212           ; $00D34F   |
    BVS CODE_00D34F     ; $00D352   |

CODE_00D354:
    BIT $4212           ; $00D354   |
    BVC CODE_00D354     ; $00D357   |
    LDY #$8F            ; $00D359   |
    STY $2100           ; $00D35B   |
    STZ $420C           ; $00D35E   |
    LDA $011B           ; $00D361   |
    BNE CODE_00D369     ; $00D364   |
    JMP CODE_00D46B     ; $00D366   |

CODE_00D369:
    STZ $011B           ; $00D369   |
    JSR CODE_00E3DF     ; $00D36C   |
    JSR CODE_00E3AA     ; $00D36F   |
    REP #$20            ; $00D372   |
    PHD                 ; $00D374   |
    LDA #$420B          ; $00D375   |
    TCD                 ; $00D378   |
    LDX #$01            ; $00D379   |
    JSR CODE_00DE0C     ; $00D37B   |
    JSR CODE_00D4AC     ; $00D37E   |
    JSR CODE_00D4E5     ; $00D381   |
    LDY #$80            ; $00D384   |
    STY $2115           ; $00D386   |
    LDA #$1801          ; $00D389   |
    STA $F5             ; $00D38C   |
    JSR CODE_00DCAE     ; $00D38E   |
    LDY $0D15           ; $00D391   |
    BEQ CODE_00D39E     ; $00D394   |
    JSR CODE_00DC97     ; $00D396   |
    STZ $0D15           ; $00D399   |
    BRA CODE_00D3A1     ; $00D39C   |

CODE_00D39E:
    JSR CODE_00DC6B     ; $00D39E   |

CODE_00D3A1:
    LDA $0118           ; $00D3A1   |
    CMP #$0030          ; $00D3A4   |
    BNE CODE_00D3C3     ; $00D3A7   |
    LDA $094A           ; $00D3A9   |
    AND #$0020          ; $00D3AC   |
    BEQ CODE_00D3C0     ; $00D3AF   |
    LDA $10E0           ; $00D3B1   |
    STA $7E5040         ; $00D3B4   |
    EOR #$FFFF          ; $00D3B8   |
    INC A               ; $00D3BB   |
    STA $7E5042         ; $00D3BC   |

CODE_00D3C0:
    JSR CODE_00DBA9     ; $00D3C0   |

CODE_00D3C3:
    PLD                 ; $00D3C3   |
    SEP #$20            ; $00D3C4   |
    LDA $39             ; $00D3C6   |
    STA $210D           ; $00D3C8   |
    LDA $3A             ; $00D3CB   |
    STA $210D           ; $00D3CD   |
    LDA $3B             ; $00D3D0   |
    STA $210E           ; $00D3D2   |
    LDA $3C             ; $00D3D5   |
    STA $210E           ; $00D3D7   |
    LDA $3D             ; $00D3DA   |
    STA $210F           ; $00D3DC   |
    LDA $3E             ; $00D3DF   |
    STA $210F           ; $00D3E1   |
    LDA $3F             ; $00D3E4   |
    STA $2110           ; $00D3E6   |
    LDA $40             ; $00D3E9   |
    STA $2110           ; $00D3EB   |
    LDA $41             ; $00D3EE   |
    STA $2111           ; $00D3F0   |
    LDA $42             ; $00D3F3   |
    STA $2111           ; $00D3F5   |
    LDA $43             ; $00D3F8   |
    STA $2112           ; $00D3FA   |
    LDA $44             ; $00D3FD   |
    STA $2112           ; $00D3FF   |
    LDA $0967           ; $00D402   |
    STA $212C           ; $00D405   |
    LDA $0968           ; $00D408   |
    STA $212D           ; $00D40B   |
    LDA $0969           ; $00D40E   |
    STA $212E           ; $00D411   |
    LDA $096A           ; $00D414   |
    STA $212F           ; $00D417   |
    LDA $0962           ; $00D41A   |
    STA $210B           ; $00D41D   |
    LDA $095F           ; $00D420   |
    STA $2107           ; $00D423   |
    LDA $095E           ; $00D426   |
    STA $2105           ; $00D429   |
    LDA $0964           ; $00D42C   |
    STA $2123           ; $00D42F   |
    LDA $0965           ; $00D432   |
    STA $2124           ; $00D435   |
    LDA $0966           ; $00D438   |
    STA $2125           ; $00D43B   |
    LDA $096B           ; $00D43E   |
    STA $2130           ; $00D441   |
    LDA $096C           ; $00D444   |
    STA $2131           ; $00D447   |
    LDA $094C           ; $00D44A   |
    STA $212A           ; $00D44D   |
    LDA $094D           ; $00D450   |
    STA $212B           ; $00D453   |
    LDA $0960           ; $00D456   |
    STA $2108           ; $00D459   |
    LDA $0961           ; $00D45C   |
    STA $2109           ; $00D45F   |
    LDA $095B           ; $00D462   |
    STA $2106           ; $00D465   |
    JSR CODE_00E507     ; $00D468   |

CODE_00D46B:
    REP #$20            ; $00D46B   |
    LDA #$4300          ; $00D46D   |
    TCD                 ; $00D470   |
    LDA $12             ; $00D471   |
    STA $18             ; $00D473   |
    LDA $22             ; $00D475   |
    STA $28             ; $00D477   |
    LDA $32             ; $00D479   |
    STA $38             ; $00D47B   |
    LDA $42             ; $00D47D   |
    STA $48             ; $00D47F   |
    LDA $52             ; $00D481   |
    STA $58             ; $00D483   |
    LDA $62             ; $00D485   |
    STA $68             ; $00D487   |
    LDA $72             ; $00D489   |
    STA $78             ; $00D48B   |
    SEP #$20            ; $00D48D   |
    LDA #$01            ; $00D48F   |
    STA $1A             ; $00D491   |
    STA $2A             ; $00D493   |
    STA $3A             ; $00D495   |
    STA $4A             ; $00D497   |
    STA $5A             ; $00D499   |
    STA $6A             ; $00D49B   |
    STA $7A             ; $00D49D   |
    STZ $0125           ; $00D49F   |
    LDA #$50            ; $00D4A2   |
    STA $4207           ; $00D4A4   |
    LDA #$06            ; $00D4A7   |
    JMP CODE_00D346     ; $00D4A9   |

CODE_00D4AC:
    STZ $2102           ; $00D4AC   |
    STZ $F5             ; $00D4AF   |
    LDA #$0004          ; $00D4B1   |
    STA $F6             ; $00D4B4   |
    LDA #$006A          ; $00D4B6   |
    STA $F8             ; $00D4B9   |
    LDA #$0220          ; $00D4BB   |
    STA $FA             ; $00D4BE   |
    STX $00             ; $00D4C0   |
    RTS                 ; $00D4C2   |

CODE_00D4C3:
    REP #$20            ; $00D4C3   |
    STZ $2102           ; $00D4C5   |
    STZ $4300           ; $00D4C8   |
    LDA #$6D04          ; $00D4CB   |
    STA $4301           ; $00D4CE   |
    LDA #$0009          ; $00D4D1   |
    STA $4303           ; $00D4D4   |
    LDA #$0220          ; $00D4D7   |
    STA $4305           ; $00D4DA   |
    LDX #$01            ; $00D4DD   |
    STX $420B           ; $00D4DF   |
    SEP #$20            ; $00D4E2   |
    RTS                 ; $00D4E4   |

CODE_00D4E5:
    LDA $0948           ; $00D4E5   |\
    AND #$001F          ; $00D4E8   | |
    ORA #$0020          ; $00D4EB   | |
    TAY                 ; $00D4EE   | |
    STY $2132           ; $00D4EF   | |
    LDA $0948           ; $00D4F2   | |
    LSR A               ; $00D4F5   | |
    LSR A               ; $00D4F6   | |
    LSR A               ; $00D4F7   | |
    LSR A               ; $00D4F8   | |
    LSR A               ; $00D4F9   | |
    AND #$001F          ; $00D4FA   | |
    ORA #$0040          ; $00D4FD   | |
    TAY                 ; $00D500   | |
    STY $2132           ; $00D501   | |
    LDA $0949           ; $00D504   | |
    LSR A               ; $00D507   | |
    LSR A               ; $00D508   | |
    ORA #$0080          ; $00D509   | |
    TAY                 ; $00D50C   | |
    STY $2132           ; $00D50D   |/

; dp = #$420B

CODE_00D510:
    LDY #$00            ; $00D510   |\ starting address in CGRAM
    STY $2121           ; $00D512   |/
    LDA #$2200          ; $00D515   |\ set destination to $2122
    STA $F5             ; $00D518   |/
    LDA #$2000          ; $00D51A   |\
    STA $F7             ; $00D51D   | | set source address ($702000)
    LDY #$70            ; $00D51F   | |
    STY $F9             ; $00D521   |/
    LDA #$0200          ; $00D523   |\ transfer $0200 bytes
    STA $FA             ; $00D526   |/
    STX $00             ; $00D528   | begin DMA
    RTS                 ; $00D52A   |

CODE_00D52B:
    LDA $0948           ; $00D52B   |
    AND #$001F          ; $00D52E   |
    ORA #$0020          ; $00D531   |
    TAY                 ; $00D534   |
    STY $2132           ; $00D535   |
    LDA $0948           ; $00D538   |
    LSR A               ; $00D53B   |
    LSR A               ; $00D53C   |
    LSR A               ; $00D53D   |
    LSR A               ; $00D53E   |
    LSR A               ; $00D53F   |
    AND #$001F          ; $00D540   |
    ORA #$0040          ; $00D543   |
    TAY                 ; $00D546   |
    STY $2132           ; $00D547   |
    LDA $0949           ; $00D54A   |
    LSR A               ; $00D54D   |
    LSR A               ; $00D54E   |
    ORA #$0080          ; $00D54F   |
    TAY                 ; $00D552   |
    STY $2132           ; $00D553   |
    LDY #$00            ; $00D556   |
    STY $2121           ; $00D558   |
    LDA #$2200          ; $00D55B   |
    STA $F5             ; $00D55E   |
    LDA #$1600          ; $00D560   |
    STA $F7             ; $00D563   |
    LDY #$70            ; $00D565   |
    STY $F9             ; $00D567   |
    LDA #$0200          ; $00D569   |
    STA $FA             ; $00D56C   |
    STX $00             ; $00D56E   |
    RTS                 ; $00D570   |

    PHB                 ; $00D571   |
    PHD                 ; $00D572   |
    PHK                 ; $00D573   |
    PLB                 ; $00D574   |
    REP #$20            ; $00D575   |
    LDA #$420B          ; $00D577   |
    TCD                 ; $00D57A   |
    LDX #$01            ; $00D57B   |
    LDY #$80            ; $00D57D   |
    STY $2115           ; $00D57F   |
    LDA #$1801          ; $00D582   |
    STA $F5             ; $00D585   |
    LDA #$0020          ; $00D587   |
    STA $0000           ; $00D58A   |

CODE_00D58D:
    INC $7974           ; $00D58D   |
    JSR CODE_00D65D     ; $00D590   |
    DEC $0000           ; $00D593   |
    BNE CODE_00D58D     ; $00D596   |
    SEP #$20            ; $00D598   |
    PLD                 ; $00D59A   |
    PLB                 ; $00D59B   |
    RTL                 ; $00D59C   |

; vram address stuff?
DATA_00D59D:         dw $1400, $1400, $1440, $1440
DATA_00D5A5:         dw $1480, $1480, $14C0, $14C0
DATA_00D5AD:         dw $1400, $1400, $1440, $1440
DATA_00D5B5:         dw $1480, $1480, $14C0, $14C0
DATA_00D5BD:         dw $1400, $1400, $1440, $1440
DATA_00D5C5:         dw $1480, $1480, $14C0, $14C0
DATA_00D5CD:         dw $1400, $1400, $1440, $1440
DATA_00D5D5:         dw $1480, $1480, $14C0, $14C0

DATA_00D5DD:         dw $C000, $C000, $C400, $C100
DATA_00D5E5:         dw $C500, $C000, $C400, $A880
DATA_00D5ED:         dw $C080, $C080, $C480, $C180
DATA_00D5F5:         dw $C580, $C080, $C480, $AA80
DATA_00D5FD:         dw $C200, $C200, $C600, $C300
DATA_00D605:         dw $C700, $C200, $C600, $AC80
DATA_00D60D:         dw $C280, $C280, $C680, $C380
DATA_00D615:         dw $C780, $C280, $C680, $AE80

DATA_00D61D:         dw $0000, $0000, $0008, $0000
DATA_00D625:         dw $0008, $0000, $0010, $0000
DATA_00D62D:         dw $0000, $0000, $0008, $0000
DATA_00D635:         dw $0008, $0000, $0010, $0000
DATA_00D63D:         dw $0000, $0000, $0008, $0000
DATA_00D645:         dw $0008, $0000, $0010, $0000
DATA_00D64D:         dw $0000, $0000, $0008, $0000
DATA_00D655:         dw $0008, $0000, $0010, $0000

CODE_00D65D:
    LDA $61B0           ; $00D65D   |
    BNE CODE_00D665     ; $00D660   |
    INC $0B6D           ; $00D662   |

CODE_00D665:
    LDA $0148           ; $00D665   |
    ASL A               ; $00D668   |
    TAX                 ; $00D669   |
    JSR ($D6C2,x)       ; $00D66A   |
    LDA $7974           ; $00D66D   |
    AND #$001E          ; $00D670   |
    ASL A               ; $00D673   |
    TAY                 ; $00D674   |
    LDA $7E08           ; $00D675   |
    AND $D61D,y         ; $00D678   |
    BEQ CODE_00D67F     ; $00D67B   |
    INY                 ; $00D67D   |
    INY                 ; $00D67E   |

CODE_00D67F:
    LDA $D59D,y         ; $00D67F   |
    STA $2116           ; $00D682   |
    LDA $D5DD,y         ; $00D685   |
    STA $F7             ; $00D688   |
    LDY #$52            ; $00D68A   |
    STY $F9             ; $00D68C   |
    LDY #$80            ; $00D68E   |
    STY $FA             ; $00D690   |
    STX $00             ; $00D692   |
    LDA $0CFB           ; $00D694   |
    BEQ CODE_00D6C1     ; $00D697   |
    LDA #$1280          ; $00D699   |
    STA $2116           ; $00D69C   |
    LDA #$60C0          ; $00D69F   |
    STA $F7             ; $00D6A2   |
    LDY #$70            ; $00D6A4   |
    STY $F9             ; $00D6A6   |
    LDA #$0100          ; $00D6A8   |
    STA $FA             ; $00D6AB   |
    STX $00             ; $00D6AD   |
    STA $FA             ; $00D6AF   |
    LDA #$1380          ; $00D6B1   |
    STA $2116           ; $00D6B4   |
    LDA #$62C0          ; $00D6B7   |
    STA $F7             ; $00D6BA   |
    STX $00             ; $00D6BC   |
    STZ $0CFB           ; $00D6BE   |

CODE_00D6C1:
    RTS                 ; $00D6C1   |

DATA_00D6C2:         dw $D6EA, $D713, $D765, $D7B4
DATA_00D6CA:         dw $D6E6, $D7F1, $D81E, $D898
DATA_00D6D2:         dw $D92D, $D977, $D99C, $D9F6
DATA_00D6DA:         dw $DA65, $DAE4, $DB06, $DB1C
DATA_00D6E2:         dw $DB54, $DB86

    PLA                 ; $00D6E6   |
    LDX #$01            ; $00D6E7   |
    RTS                 ; $00D6E9   |

    LDA $7974           ; $00D6EA   |
    AND #$0007          ; $00D6ED   |
    XBA                 ; $00D6F0   |
    LSR A               ; $00D6F1   |
    ORA #$1000          ; $00D6F2   |
    STA $2116           ; $00D6F5   |
    LDA #$B400          ; $00D6F8   |
    STA $F7             ; $00D6FB   |
    LDX #$52            ; $00D6FD   |
    STX $F9             ; $00D6FF   |
    LDA #$0100          ; $00D701   |
    STA $FA             ; $00D704   |
    LDX #$01            ; $00D706   |
    STX $00             ; $00D708   |
    RTS                 ; $00D70A   |

DATA_00D70B:         dw $8800, $8A00, $8C00, $8E00

    LDA #$2F00          ; $00D713   |
    STA $2116           ; $00D716   |
    LDA #$0200          ; $00D719   |
    STA $FA             ; $00D71C   |
    LDY #$56            ; $00D71E   |
    STY $F9             ; $00D720   |
    LDA $7974           ; $00D722   |
    LSR A               ; $00D725   |
    LSR A               ; $00D726   |
    AND #$0006          ; $00D727   |
    TAY                 ; $00D72A   |
    LDA $D70B,y         ; $00D72B   |
    STA $F7             ; $00D72E   |
    LDX #$01            ; $00D730   |
    STX $00             ; $00D732   |
    RTS                 ; $00D734   |

DATA_00D735:         dw $1000, $1080, $1200, $1280

DATA_00D73D:         dw $1100, $1180, $1300, $1380

DATA_00D745:         dw $D000, $D800, $C000, $C000
DATA_00D74D:         dw $D200, $DA00, $C000, $C000
DATA_00D755:         dw $D400, $DC00, $C000, $C000
DATA_00D75D:         dw $D600, $DE00, $C000, $C000

CODE_00D765:
    LDA $7974           ; $00D765   |
    AND #$001E          ; $00D768   |
    TAY                 ; $00D76B   |
    LDA $D745,y         ; $00D76C   |
    STA $F7             ; $00D76F   |
    LDX #$52            ; $00D771   |
    STX $F9             ; $00D773   |
    TYA                 ; $00D775   |
    AND #$0006          ; $00D776   |
    TAY                 ; $00D779   |
    LDA $D735,y         ; $00D77A   |
    STA $2116           ; $00D77D   |
    LDA #$0100          ; $00D780   |
    STA $FA             ; $00D783   |
    LDX #$01            ; $00D785   |
    STX $00             ; $00D787   |
    STA $FA             ; $00D789   |
    LDA $D73D,y         ; $00D78B   |
    STA $2116           ; $00D78E   |
    STX $00             ; $00D791   |
    RTS                 ; $00D793   |

DATA_00D794:         dw $9000, $9000, $9000, $9000
DATA_00D79C:         dw $9200, $9200, $9200, $9200
DATA_00D7A4:         dw $9400, $9400, $9400, $9400
DATA_00D7AC:         dw $9600, $9600, $9600, $9600

CODE_00D7B4:
    LDA $7974           ; $00D7B4   |
    AND #$000F          ; $00D7B7   |
    ASL A               ; $00D7BA   |
    TAY                 ; $00D7BB   |
    LDA $D794,y         ; $00D7BC   |
    STA $F7             ; $00D7BF   |
    LDX #$56            ; $00D7C1   |
    STX $F9             ; $00D7C3   |
    LDA #$2F00          ; $00D7C5   |
    STA $2116           ; $00D7C8   |
    LDA #$0200          ; $00D7CB   |
    STA $FA             ; $00D7CE   |
    LDX #$01            ; $00D7D0   |
    STX $00             ; $00D7D2   |
    RTS                 ; $00D7D4   |

DATA_00D7D5:         dw $9800, $9A00, $9C00, $9E00
DATA_00D7DD:         dw $A000, $A200, $A400, $A600
DATA_00D7E5:         dw $A400, $A200, $A000, $9E00
DATA_00D7ED:         dw $9C00, $9A00

    LDA $0B67           ; $00D7F1   |
    INC A               ; $00D7F4   |
    CMP #$0038          ; $00D7F5   |
    BCC CODE_00D7FD     ; $00D7F8   |
    LDA #$0000          ; $00D7FA   |

CODE_00D7FD:
    STA $0B67           ; $00D7FD   |
    LSR A               ; $00D800   |
    AND #$00FE          ; $00D801   |
    TAY                 ; $00D804   |

CODE_00D805:
    LDA $D7D5,y         ; $00D805   |

CODE_00D808:
    STA $F7             ; $00D808   |
    LDX #$56            ; $00D80A   |
    STX $F9             ; $00D80C   |
    LDA #$2F00          ; $00D80E   |
    STA $2116           ; $00D811   |
    LDA #$0200          ; $00D814   |
    STA $FA             ; $00D817   |
    LDX #$01            ; $00D819   |
    STX $00             ; $00D81B   |
    RTS                 ; $00D81D   |

    LDA $0B6D           ; $00D81E   |
    CMP #$0006          ; $00D821   |
    BCC CODE_00D834     ; $00D824   |
    STZ $0B6D           ; $00D826   |
    LDA $0B67           ; $00D829   |
    INC A               ; $00D82C   |
    INC A               ; $00D82D   |
    AND #$000E          ; $00D82E   |
    STA $0B67           ; $00D831   |

CODE_00D834:
    LDY $0B67           ; $00D834   |
    LDA $0146           ; $00D837   |
    CMP #$000A          ; $00D83A   |
    BNE CODE_00D805     ; $00D83D   |
    LDA $D7D5,y         ; $00D83F   |
    STA $F7             ; $00D842   |
    LDX #$56            ; $00D844   |
    STX $F9             ; $00D846   |
    LDA #$7F00          ; $00D848   |
    STA $2116           ; $00D84B   |
    LDA #$0200          ; $00D84E   |
    STA $FA             ; $00D851   |
    LDX #$01            ; $00D853   |
    STX $00             ; $00D855   |
    RTS                 ; $00D857   |

DATA_00D858:         dw $C800, $CA00, $CC00, $CE00
DATA_00D860:         dw $EC00, $EE00, $F000, $F200

DATA_00D868:         dw $C900, $CB00, $CD00, $CF00
DATA_00D870:         dw $ED00, $EF00, $F100, $F300

DATA_00D878:         dw $EC00, $EE00, $F000, $F200
DATA_00D880:         dw $F400, $F600, $F800, $FA00

DATA_00D888:         dw $ED00, $EF00, $F100, $F300
DATA_00D890:         dw $F500, $F700, $F900, $FB00

CODE_00D898:
    LDA $0B6D           ; $00D898   |
    CMP #$000B          ; $00D89B   |
    BCC CODE_00D8AD     ; $00D89E   |
    STZ $0B6D           ; $00D8A0   |
    LDA $0B67           ; $00D8A3   |
    INC A               ; $00D8A6   |
    AND #$0003          ; $00D8A7   |
    STA $0B67           ; $00D8AA   |

CODE_00D8AD:
    LDA $0B67           ; $00D8AD   |
    ASL A               ; $00D8B0   |
    TAY                 ; $00D8B1   |
    LDX #$52            ; $00D8B2   |
    LDA $0136           ; $00D8B4   |
    CMP #$000A          ; $00D8B7   |
    BNE CODE_00D8C3     ; $00D8BA   |
    TYA                 ; $00D8BC   |
    ORA #$0008          ; $00D8BD   |
    TAY                 ; $00D8C0   |
    LDX #$56            ; $00D8C1   |

CODE_00D8C3:
    STX $F9             ; $00D8C3   |
    LDX #$01            ; $00D8C5   |
    LDA $7974           ; $00D8C7   |
    AND #$0001          ; $00D8CA   |
    BEQ CODE_00D8F6     ; $00D8CD   |
    LDA $D858,y         ; $00D8CF   |
    STA $F7             ; $00D8D2   |
    LDA #$1000          ; $00D8D4   |
    STA $2116           ; $00D8D7   |
    LDA #$0100          ; $00D8DA   |
    STA $FA             ; $00D8DD   |
    STX $420B           ; $00D8DF   |
    LDA $D868,y         ; $00D8E2   |
    STA $F7             ; $00D8E5   |
    LDA #$1100          ; $00D8E7   |
    STA $2116           ; $00D8EA   |
    LDA #$0100          ; $00D8ED   |
    STA $FA             ; $00D8F0   |
    STX $420B           ; $00D8F2   |
    RTS                 ; $00D8F5   |

CODE_00D8F6:
    LDA $D878,y         ; $00D8F6   |
    STA $F7             ; $00D8F9   |
    LDA #$1080          ; $00D8FB   |
    STA $2116           ; $00D8FE   |
    LDA #$0100          ; $00D901   |
    STA $FA             ; $00D904   |
    STX $420B           ; $00D906   |
    LDA $D888,y         ; $00D909   |
    STA $F7             ; $00D90C   |
    LDA #$1180          ; $00D90E   |
    STA $2116           ; $00D911   |
    LDA #$0100          ; $00D914   |
    STA $FA             ; $00D917   |
    STX $420B           ; $00D919   |
    RTS                 ; $00D91C   |

DATA_00D91D:         dw $E400, $E600, $E800, $EA00

DATA_00D925:         dw $E500, $E700, $E900, $EB00

    INC $0B6D           ; $00D92D   |
    LDA $0B6D           ; $00D930   |
    CMP #$0010          ; $00D933   |
    BCC CODE_00D945     ; $00D936   |
    STZ $0B6D           ; $00D938   |
    LDA $0B67           ; $00D93B   |
    INC A               ; $00D93E   |
    AND #$0003          ; $00D93F   |
    STA $0B67           ; $00D942   |

CODE_00D945:
    LDA $0B67           ; $00D945   |
    ASL A               ; $00D948   |
    TAY                 ; $00D949   |
    LDA $D91D,y         ; $00D94A   |
    STA $F7             ; $00D94D   |
    LDX #$52            ; $00D94F   |
    STX $F9             ; $00D951   |
    LDA #$1000          ; $00D953   |
    STA $2116           ; $00D956   |
    LDA #$0100          ; $00D959   |
    STA $FA             ; $00D95C   |
    LDX #$01            ; $00D95E   |
    STX $420B           ; $00D960   |
    LDA $D925,y         ; $00D963   |
    STA $F7             ; $00D966   |
    LDA #$1100          ; $00D968   |
    STA $2116           ; $00D96B   |
    LDA #$0100          ; $00D96E   |
    STA $FA             ; $00D971   |
    STX $420B           ; $00D973   |
    RTS                 ; $00D976   |

    INC $0B6D           ; $00D977   |
    LDA $0B6D           ; $00D97A   |
    CMP #$0008          ; $00D97D   |
    BCC CODE_00D992     ; $00D980   |
    STZ $0B6D           ; $00D982   |
    LDA $0B67           ; $00D985   |
    CLC                 ; $00D988   |
    ADC #$0200          ; $00D989   |
    AND #$0600          ; $00D98C   |
    STA $0B67           ; $00D98F   |

CODE_00D992:
    LDA #$8000          ; $00D992   |
    CLC                 ; $00D995   |
    ADC $0B67           ; $00D996   |
    JMP CODE_00D808     ; $00D999   |

    LDA $0B6D           ; $00D99C   |
    CMP #$0008          ; $00D99F   |
    BCC CODE_00D9B4     ; $00D9A2   |
    STZ $0B6D           ; $00D9A4   |
    LDA $0B67           ; $00D9A7   |
    CLC                 ; $00D9AA   |
    ADC #$0200          ; $00D9AB   |
    AND #$0E00          ; $00D9AE   |
    STA $0B67           ; $00D9B1   |

CODE_00D9B4:
    LDA #$B000          ; $00D9B4   |
    CLC                 ; $00D9B7   |
    ADC $0B67           ; $00D9B8   |
    JMP CODE_00D808     ; $00D9BB   |

DATA_00D9BE:         dw $B000, $B200, $B400, $B600
DATA_00D9C6:         dw $B800, $BA00, $BC00, $BE00
DATA_00D9CE:         dw $BC00, $BA00, $B800, $B600
DATA_00D9D6:         dw $B400, $B200

DATA_00D9DA:         dw $000A, $0004, $0004, $0004
DATA_00D9E2:         dw $0004, $0004, $0004, $000A
DATA_00D9EA:         dw $0004, $0004, $0004, $0004
DATA_00D9F2:         dw $0004, $0004

    LDA $7974           ; $00D9F6   |
    AND #$0001          ; $00D9F9   |
    BNE CODE_00DA02     ; $00D9FC   |
    JSR CODE_00D765     ; $00D9FE   |
    RTS                 ; $00DA01   |

CODE_00DA02:
    LDA $0B67           ; $00DA02   |
    AND #$000F          ; $00DA05   |
    ASL A               ; $00DA08   |
    TAY                 ; $00DA09   |
    LDA $0B6D           ; $00DA0A   |
    CMP $D9DA,y         ; $00DA0D   |
    BCC CODE_00DA23     ; $00DA10   |
    STZ $0B6D           ; $00DA12   |
    INC $0B67           ; $00DA15   |
    LDA $0B67           ; $00DA18   |
    CMP #$000E          ; $00DA1B   |
    BCC CODE_00DA23     ; $00DA1E   |
    STZ $0B67           ; $00DA20   |

CODE_00DA23:
    LDA $D9BE,y         ; $00DA23   |
    JMP CODE_00D808     ; $00DA26   |

DATA_00DA29:         dw $E000, $E100, $E200, $E300
DATA_00DA31:         dw $F400, $F500, $F600, $F700
DATA_00DA39:         dw $F400, $F500, $E200, $E300

DATA_00DA41:         dw $F800, $F900, $FA00, $FB00
DATA_00DA49:         dw $FC00, $FD00, $FE00, $FF00
DATA_00DA51:         dw $FC00, $FD00, $FA00, $FB00

DATA_00DA59:         dw $0010, $000C, $000C, $0010
DATA_00DA61:         dw $000C, $000C

CODE_00DA65:
    LDX $0B67           ; $00DA65   |
    LDA $0B6D           ; $00DA68   |
    CMP $DA59,x         ; $00DA6B   |
    BCC CODE_00DA83     ; $00DA6E   |
    STZ $0B6D           ; $00DA70   |
    LDA $0B67           ; $00DA73   |
    INC A               ; $00DA76   |
    INC A               ; $00DA77   |
    CMP #$000C          ; $00DA78   |
    BCC CODE_00DA80     ; $00DA7B   |
    LDA #$0000          ; $00DA7D   |

CODE_00DA80:
    STA $0B67           ; $00DA80   |

CODE_00DA83:
    LDA $0B67           ; $00DA83   |
    ASL A               ; $00DA86   |
    TAY                 ; $00DA87   |
    LDX #$52            ; $00DA88   |
    STX $F9             ; $00DA8A   |
    LDX #$01            ; $00DA8C   |
    LDA $7974           ; $00DA8E   |
    AND #$0002          ; $00DA91   |
    BNE CODE_00DABD     ; $00DA94   |
    LDA $DA29,y         ; $00DA96   |
    STA $F7             ; $00DA99   |
    LDA #$1000          ; $00DA9B   |
    STA $2116           ; $00DA9E   |
    LDA #$0100          ; $00DAA1   |
    STA $FA             ; $00DAA4   |
    STX $420B           ; $00DAA6   |
    LDA $DA2B,y         ; $00DAA9   |
    STA $F7             ; $00DAAC   |
    LDA #$1100          ; $00DAAE   |
    STA $2116           ; $00DAB1   |
    LDA #$0100          ; $00DAB4   |
    STA $FA             ; $00DAB7   |
    STX $420B           ; $00DAB9   |
    RTS                 ; $00DABC   |

CODE_00DABD:
    LDA $DA41,y         ; $00DABD   |
    STA $F7             ; $00DAC0   |
    LDA #$1080          ; $00DAC2   |
    STA $2116           ; $00DAC5   |
    LDA #$0100          ; $00DAC8   |
    STA $FA             ; $00DACB   |
    STX $420B           ; $00DACD   |
    LDA $DA43,y         ; $00DAD0   |
    STA $F7             ; $00DAD3   |
    LDA #$1180          ; $00DAD5   |
    STA $2116           ; $00DAD8   |
    LDA #$0100          ; $00DADB   |
    STA $FA             ; $00DADE   |
    STX $420B           ; $00DAE0   |
    RTS                 ; $00DAE3   |

    INC $0B6F           ; $00DAE4   |
    LDA $0B6F           ; $00DAE7   |
    CMP #$0006          ; $00DAEA   |
    BCS CODE_00DAF2     ; $00DAED   |
    JMP CODE_00D898     ; $00DAEF   |

CODE_00DAF2:
    STZ $0B6F           ; $00DAF2   |
    LDA $0B69           ; $00DAF5   |
    INC A               ; $00DAF8   |
    INC A               ; $00DAF9   |
    AND #$000E          ; $00DAFA   |
    STA $0B69           ; $00DAFD   |
    LDY $0B69           ; $00DB00   |
    JMP CODE_00D805     ; $00DB03   |

    INC $0B6F           ; $00DB06   |
    LDA $7974           ; $00DB09   |
    AND #$0001          ; $00DB0C   |
    BEQ CODE_00DAF2     ; $00DB0F   |
    JMP CODE_00DA65     ; $00DB11   |

DATA_00DB14:         dw $A800, $AA00, $AC00, $AE00

    LDA $0B71           ; $00DB1C   |
    INC A               ; $00DB1F   |
    CMP #$0006          ; $00DB20   |
    BCC CODE_00DB2B     ; $00DB23   |
    INC $0B6B           ; $00DB25   |
    LDA #$0000          ; $00DB28   |

CODE_00DB2B:
    STA $0B71           ; $00DB2B   |
    LDX #$01            ; $00DB2E   |
    LDY $0B6B           ; $00DB30   |
    CMP #$0000          ; $00DB33   |
    BNE CODE_00DB43     ; $00DB36   |
    TYA                 ; $00DB38   |
    AND #$0006          ; $00DB39   |
    TAY                 ; $00DB3C   |
    LDA $DB14,y         ; $00DB3D   |
    JMP CODE_00D808     ; $00DB40   |

CODE_00DB43:
    RTS                 ; $00DB43   |

DATA_00DB44:         dw $C000, $C100, $C200, $C300

DATA_00DB4C:         dw $C080, $C180, $C280, $C380

    LDA $0B6D           ; $00DB54   |
    AND #$000C          ; $00DB57   |
    LSR A               ; $00DB5A   |
    TAY                 ; $00DB5B   |
    LDX #$56            ; $00DB5C   |
    STX $F9             ; $00DB5E   |
    LDA $DB44,y         ; $00DB60   |
    STA $F7             ; $00DB63   |
    LDA #$2F00          ; $00DB65   |
    STA $2116           ; $00DB68   |
    LDA #$0080          ; $00DB6B   |
    STA $FA             ; $00DB6E   |
    LDX #$01            ; $00DB70   |
    STX $420B           ; $00DB72   |
    STA $FA             ; $00DB75   |
    LDA $DB4C,y         ; $00DB77   |
    STA $F7             ; $00DB7A   |
    LDA #$2F80          ; $00DB7C   |
    STA $2116           ; $00DB7F   |
    STX $420B           ; $00DB82   |
    RTS                 ; $00DB85   |

    LDA $7974           ; $00DB86   |
    AND #$0003          ; $00DB89   |
    BNE CODE_00DB91     ; $00DB8C   |
    JMP CODE_00D7B4     ; $00DB8E   |

CODE_00DB91:
    JMP CODE_00DA65     ; $00DB91   |

    REP #$20            ; $00DB94   |
    PHD                 ; $00DB96   |
    LDA #$420B          ; $00DB97   |
    TCD                 ; $00DB9A   |
    LDA #$1801          ; $00DB9B   |
    STA $F5             ; $00DB9E   |
    LDX #$01            ; $00DBA0   |
    JSR CODE_00DBA9     ; $00DBA2   |
    PLD                 ; $00DBA5   |
    SEP #$20            ; $00DBA6   |
    RTL                 ; $00DBA8   |

CODE_00DBA9:
    LDY #$00            ; $00DBA9   |
    STY $F9             ; $00DBAB   |
    LDY #$81            ; $00DBAD   |
    STY $2115           ; $00DBAF   |
    LDY $0077           ; $00DBB2   |
    BEQ CODE_00DBD5     ; $00DBB5   |
    LDA #$6DAA          ; $00DBB7   |
    STA $F7             ; $00DBBA   |
    LDA $007B           ; $00DBBC   |
    STA $2116           ; $00DBBF   |
    LDY #$40            ; $00DBC2   |
    STY $FA             ; $00DBC4   |
    STX $00             ; $00DBC6   |
    LDA $007F           ; $00DBC8   |
    STA $2116           ; $00DBCB   |
    STY $FA             ; $00DBCE   |
    STX $00             ; $00DBD0   |
    STZ $0077           ; $00DBD2   |

CODE_00DBD5:
    LDY #$80            ; $00DBD5   |
    STY $2115           ; $00DBD7   |
    LDY $0079           ; $00DBDA   |
    BEQ CODE_00DC1B     ; $00DBDD   |
    LDA #$6E2A          ; $00DBDF   |
    STA $F7             ; $00DBE2   |
    LDA $007D           ; $00DBE4   |
    STA $2116           ; $00DBE7   |
    LDA $0083           ; $00DBEA   |
    STA $FA             ; $00DBED   |
    STX $00             ; $00DBEF   |
    LDA $0081           ; $00DBF1   |
    STA $2116           ; $00DBF4   |
    LDA $0087           ; $00DBF7   |
    STA $FA             ; $00DBFA   |
    STX $00             ; $00DBFC   |
    LDA $0085           ; $00DBFE   |
    STA $2116           ; $00DC01   |
    LDA $0083           ; $00DC04   |
    STA $FA             ; $00DC07   |
    STX $00             ; $00DC09   |
    LDA $0089           ; $00DC0B   |
    STA $2116           ; $00DC0E   |
    LDA $0087           ; $00DC11   |
    STA $FA             ; $00DC14   |
    STX $00             ; $00DC16   |
    STZ $0079           ; $00DC18   |

CODE_00DC1B:
    RTS                 ; $00DC1B   |

CODE_00DC1C:
    LDA $09ED           ; $00DC1C   |
    BEQ CODE_00DC60     ; $00DC1F   |
    LDX #$80            ; $00DC21   |
    STX $2115           ; $00DC23   |
    LDX #$01            ; $00DC26   |
    STX $F5             ; $00DC28   |
    LDX #$18            ; $00DC2A   |
    STX $F6             ; $00DC2C   |
    LDX #$4C            ; $00DC2E   |
    STX $F9             ; $00DC30   |
    LDY #$00            ; $00DC32   |
    LDX #$01            ; $00DC34   |

CODE_00DC36:
    LDA $09EF,y         ; $00DC36   |
    BMI CODE_00DC60     ; $00DC39   |
    PHA                 ; $00DC3B   |
    STA $2116           ; $00DC3C   |
    LDA $09F1,y         ; $00DC3F   |
    STA $F7             ; $00DC42   |
    LDA #$0004          ; $00DC44   |
    STA $FA             ; $00DC47   |
    STX $00             ; $00DC49   |
    PLA                 ; $00DC4B   |
    CLC                 ; $00DC4C   |
    ADC #$0020          ; $00DC4D   |
    STA $2116           ; $00DC50   |
    LDA #$0004          ; $00DC53   |
    STA $FA             ; $00DC56   |
    STX $00             ; $00DC58   |
    INY                 ; $00DC5A   |
    INY                 ; $00DC5B   |
    INY                 ; $00DC5C   |
    INY                 ; $00DC5D   |
    BRA CODE_00DC36     ; $00DC5E   |

CODE_00DC60:
    LDA #$0000          ; $00DC60   |
    STA $09ED           ; $00DC63   |
    DEC A               ; $00DC66   |
    STA $09EF           ; $00DC67   |
    RTS                 ; $00DC6A   |

CODE_00DC6B:
    LDA $0CF9           ; $00DC6B   |
    BEQ CODE_00DC96     ; $00DC6E   |
    BPL CODE_00DC7D     ; $00DC70   |
    AND #$7FE0          ; $00DC72   |
    STA $2116           ; $00DC75   |
    LDA #$6800          ; $00DC78   |
    BRA CODE_00DC86     ; $00DC7B   |

CODE_00DC7D:
    LDA #$5C00          ; $00DC7D   |
    STA $2116           ; $00DC80   |
    LDA #$5800          ; $00DC83   |

CODE_00DC86:
    STA $F7             ; $00DC86   |
    LDY #$70            ; $00DC88   |
    STY $F9             ; $00DC8A   |
    LDA #$0800          ; $00DC8C   |
    STA $FA             ; $00DC8F   |
    STX $00             ; $00DC91   |
    STZ $0CF9           ; $00DC93   |

CODE_00DC96:
    RTS                 ; $00DC96   |

CODE_00DC97:
    LDA #$3000          ; $00DC97   |
    STA $2116           ; $00DC9A   |
    LDA #$4E00          ; $00DC9D   |
    STA $F7             ; $00DCA0   |
    LDY #$70            ; $00DCA2   |
    STY $F9             ; $00DCA4   |
    LDA #$0800          ; $00DCA6   |
    STA $FA             ; $00DCA9   |
    STX $00             ; $00DCAB   |
    RTS                 ; $00DCAD   |

CODE_00DCAE:
    LDA #$4000          ; $00DCAE   |
    STA $2116           ; $00DCB1   |
    LDY #$40            ; $00DCB4   |
    LDA $6128           ; $00DCB6   |
    STA $F7             ; $00DCB9   |
    LDA $612A           ; $00DCBB   |
    STA $F9             ; $00DCBE   |
    STY $FA             ; $00DCC0   |
    STX $00             ; $00DCC2   |
    LDA $612C           ; $00DCC4   |
    STA $F7             ; $00DCC7   |
    LDA $612E           ; $00DCC9   |
    STA $F9             ; $00DCCC   |
    STY $FA             ; $00DCCE   |
    STX $00             ; $00DCD0   |
    LDA $6130           ; $00DCD2   |
    STA $F7             ; $00DCD5   |
    LDA $6132           ; $00DCD7   |
    STA $F9             ; $00DCDA   |
    STY $FA             ; $00DCDC   |
    STX $00             ; $00DCDE   |
    LDA $6134           ; $00DCE0   |
    STA $F7             ; $00DCE3   |
    LDA $6136           ; $00DCE5   |
    STA $F9             ; $00DCE8   |
    STY $FA             ; $00DCEA   |
    STX $00             ; $00DCEC   |
    LDA $6138           ; $00DCEE   |
    STA $F7             ; $00DCF1   |
    LDA $613A           ; $00DCF3   |
    STA $F9             ; $00DCF6   |
    STY $FA             ; $00DCF8   |
    STX $00             ; $00DCFA   |
    LDA $613C           ; $00DCFC   |
    STA $F7             ; $00DCFF   |
    LDA $613E           ; $00DD01   |
    STA $F9             ; $00DD04   |
    STY $FA             ; $00DD06   |
    STX $00             ; $00DD08   |
    LDA $6140           ; $00DD0A   |
    STA $F7             ; $00DD0D   |
    LDA $6142           ; $00DD0F   |
    STA $F9             ; $00DD12   |
    LDA #$0020          ; $00DD14   |
    STA $FA             ; $00DD17   |
    STX $00             ; $00DD19   |
    STA $FA             ; $00DD1B   |
    LDA $6145           ; $00DD1D   |
    STA $F8             ; $00DD20   |
    LDA $6144           ; $00DD22   |
    STA $F7             ; $00DD25   |
    STX $00             ; $00DD27   |
    LDA #$4100          ; $00DD29   |
    STA $2116           ; $00DD2C   |
    LDA $6128           ; $00DD2F   |
    STA $F7             ; $00DD32   |
    LDA $612A           ; $00DD34   |
    XBA                 ; $00DD37   |
    STA $F8             ; $00DD38   |
    STY $FA             ; $00DD3A   |
    STX $00             ; $00DD3C   |
    LDA $612C           ; $00DD3E   |
    STA $F7             ; $00DD41   |
    LDA $612E           ; $00DD43   |
    XBA                 ; $00DD46   |
    STA $F8             ; $00DD47   |
    STY $FA             ; $00DD49   |
    STX $00             ; $00DD4B   |
    LDA $6130           ; $00DD4D   |
    STA $F7             ; $00DD50   |
    LDA $6132           ; $00DD52   |
    XBA                 ; $00DD55   |
    STA $F8             ; $00DD56   |
    STY $FA             ; $00DD58   |
    STX $00             ; $00DD5A   |
    LDA $6134           ; $00DD5C   |
    STA $F7             ; $00DD5F   |
    LDA $6136           ; $00DD61   |
    XBA                 ; $00DD64   |
    STA $F8             ; $00DD65   |
    STY $FA             ; $00DD67   |
    STX $00             ; $00DD69   |
    LDA $6138           ; $00DD6B   |
    STA $F7             ; $00DD6E   |
    LDA $613A           ; $00DD70   |
    XBA                 ; $00DD73   |
    STA $F8             ; $00DD74   |
    STY $FA             ; $00DD76   |
    STX $00             ; $00DD78   |
    LDA $613C           ; $00DD7A   |
    STA $F7             ; $00DD7D   |
    LDA $613E           ; $00DD7F   |
    XBA                 ; $00DD82   |
    STA $F8             ; $00DD83   |
    STY $FA             ; $00DD85   |
    STX $00             ; $00DD87   |
    LDA $6140           ; $00DD89   |
    STA $F7             ; $00DD8C   |
    LDA $6142           ; $00DD8E   |
    XBA                 ; $00DD91   |
    STA $F8             ; $00DD92   |
    LDA #$0020          ; $00DD94   |
    STA $FA             ; $00DD97   |
    STX $00             ; $00DD99   |
    STA $FA             ; $00DD9B   |
    LDA $6144           ; $00DD9D   |
    STA $F7             ; $00DDA0   |
    LDA $6146           ; $00DDA2   |
    XBA                 ; $00DDA5   |
    STA $F8             ; $00DDA6   |
    STX $00             ; $00DDA8   |
    LDA $0B85           ; $00DDAA   |
    BEQ CODE_00DDE7     ; $00DDAD   |
    LDA #$4620          ; $00DDAF   |
    STA $2116           ; $00DDB2   |
    LDA $0B87           ; $00DDB5   |
    STA $F7             ; $00DDB8   |
    LDA #$0052          ; $00DDBA   |
    STA $F9             ; $00DDBD   |
    STY $FA             ; $00DDBF   |
    STX $00             ; $00DDC1   |
    LDA $0B8B           ; $00DDC3   |
    STA $F7             ; $00DDC6   |
    STY $FA             ; $00DDC8   |
    STX $00             ; $00DDCA   |
    LDA #$4720          ; $00DDCC   |
    STA $2116           ; $00DDCF   |
    LDA $0B89           ; $00DDD2   |
    STA $F7             ; $00DDD5   |
    STY $FA             ; $00DDD7   |
    STX $00             ; $00DDD9   |
    LDA $0B8D           ; $00DDDB   |
    STA $F7             ; $00DDDE   |
    STY $FA             ; $00DDE0   |
    STX $00             ; $00DDE2   |
    STZ $0B85           ; $00DDE4   |

CODE_00DDE7:
    LDA $6114           ; $00DDE7   |
    BEQ CODE_00DE0B     ; $00DDEA   |
    STA $F7             ; $00DDEC   |
    LDY #$52            ; $00DDEE   |
    STY $F9             ; $00DDF0   |
    LDA #$4200          ; $00DDF2   |
    STA $2116           ; $00DDF5   |
    LDY #$01            ; $00DDF8   |
    STY $FB             ; $00DDFA   |
    STX $00             ; $00DDFC   |
    LDA #$4300          ; $00DDFE   |
    STA $2116           ; $00DE01   |
    STY $FB             ; $00DE04   |
    STX $00             ; $00DE06   |
    STZ $6114           ; $00DE08   |

CODE_00DE0B:
    RTS                 ; $00DE0B   |

; perform DMA's that were added to queue by $00BE39

CODE_00DE0C:
    LDA #$8000          ; $00DE0C   |
    STA $F5             ; $00DE0F   | WRAM is destination
    LDY #$02            ; $00DE11   |
    LDA $096D,y         ; $00DE13   | size
    BEQ CODE_00DE43     ; $00DE16   |

CODE_00DE18:
    STA $FA             ; $00DE18   |
    LDA $096F,y         ; $00DE1A   | \
    STA $2181           ; $00DE1D   |  | destination WRAM address
    LDA $0970,y         ; $00DE20   |  |
    STA $2182           ; $00DE23   | /
    LDA $0972,y         ; $00DE26   | \
    STA $F7             ; $00DE29   |  | source address
    LDA $0973,y         ; $00DE2B   |  |
    STA $F8             ; $00DE2E   | /
    STX $00             ; $00DE30   | do DMA
    TYA                 ; $00DE32   |
    CLC                 ; $00DE33   |
    ADC #$0008          ; $00DE34   |
    TAY                 ; $00DE37   |
    LDA $096D,y         ; $00DE38   |
    BNE CODE_00DE18     ; $00DE3B   | keep doing more DMA's until 0 size encountered
    STZ $096D           ; $00DE3D   |
    STZ $096F           ; $00DE40   |

CODE_00DE43:
    RTS                 ; $00DE43   |

.superfxinit1
CODE_00DE44: STZ $3030                                  ;$00DE44   |  nuke GSU status/flag register
CODE_00DE47: LDY $012D                                  ;$00DE47   | \ set SCBR
CODE_00DE4A: STY $3038                                  ;$00DE4A   | /
CODE_00DE4D: LDY $012E                                  ;$00DE4D   | \ set SCMR
CODE_00DE50: STY $303A                                  ;$00DE50   | /
CODE_00DE53: STX $3034                                  ;$00DE53   |  set PBR
CODE_00DE56: STA $301E                                  ;$00DE56   |  set program counter
CODE_00DE59: LDA #$0020                                 ;$00DE59   | \ start GSU execution
CODE_00DE5C: BIT $3030                                  ;$00DE5C   | /\
CODE_00DE5F: BNE CODE_00DE5C                            ;$00DE5F   |  / wait for GSU execution to end
CODE_00DE61: LDY #$00                                   ;$00DE61   | \ give SCPU ROM/RAM bus access
CODE_00DE63: STY $303A                                  ;$00DE63   | /
CODE_00DE66: RTL                                        ;$00DE66   | 

.superfxinit2
CODE_00DE67: PHB                                        ;$00DE67   |  preserve bank
CODE_00DE68: STZ $3030                                  ;$00DE68   |  nuke GSU status/flag register
CODE_00DE6B: LDY $012D                                  ;$00DE6B   | \ set SCBR
CODE_00DE6E: STY $3038                                  ;$00DE6E   | /
CODE_00DE71: LDY $012E                                  ;$00DE71   | \ set SCMR
CODE_00DE74: STY $303A                                  ;$00DE74   | /
CODE_00DE77: STX $3034                                  ;$00DE77   |  set PBR
CODE_00DE7A: STA $301E                                  ;$00DE7A   |  set program counter
CODE_00DE7D: PHK                                        ;$00DE7D   | \
CODE_00DE7E: PLB                                        ;$00DE7E   |  | sub call
CODE_00DE7F: JSR CODE_00E240                            ;$00DE7F   | /
CODE_00DE82: PLB                                        ;$00DE82   |  restore bank
CODE_00DE83: LDA #$0020                                 ;$00DE83   | \ start GSU execution
CODE_00DE86: BIT $3030                                  ;$00DE86   | /\
CODE_00DE89: BNE CODE_00DE86                            ;$00DE89   |  / wait for GSU execution to end
CODE_00DE8B: LDY #$00                                   ;$00DE8B   | \ give SCPU ROM/RAM bus access
CODE_00DE8D: STY $303A                                  ;$00DE8D   | /
CODE_00DE90: RTL                                        ;$00DE90   | 

.superfxinit3
CODE_00DE91: STZ $3030                                  ;$00DE91   |  nuke GSU status/flag register
CODE_00DE94: LDY $012D                                  ;$00DE94   | \ set SCBR
CODE_00DE97: STY $3038                                  ;$00DE97   | /
CODE_00DE9A: LDY $012E                                  ;$00DE9A   | \ set SCMR
CODE_00DE9D: STY $303A                                  ;$00DE9D   | /
CODE_00DEA0: STX $3034                                  ;$00DEA0   |  set PBR
CODE_00DEA3: STA $301E                                  ;$00DEA3   |  set program counter
CODE_00DEA6: REP #$10                                   ;$00DEA6   | 
CODE_00DEA8: LDA #$0020                                 ;$00DEA8   | \
CODE_00DEAB: TAY                                        ;$00DEAB   |  | start GSU execution
CODE_00DEAC: BIT $3030                                  ;$00DEAC   | /\
CODE_00DEAF: BNE CODE_00DEAC                            ;$00DEAF   |  / wait for GSU execution to end
CODE_00DEB1: LDX $3000                                  ;$00DEB1   | \
CODE_00DEB4: BEQ CODE_00DEC6                            ;$00DEB4   |  |
CODE_00DEB6: LDA $7F0000,x                              ;$00DEB6   |  |
CODE_00DEBA: STA $3000                                  ;$00DEBA   |  | execute the GSU routine again until r0 is zero
CODE_00DEBD: LDA $301E                                  ;$00DEBD   |  |
CODE_00DEC0: STA $301E                                  ;$00DEC0   |  |
CODE_00DEC3: TYA                                        ;$00DEC3   |  |
CODE_00DEC4: BRA CODE_00DEAC                            ;$00DEC4   | /

CODE_00DEC6: LDY #$0000                                 ;$00DEC6   | \ give SCPU ROM/RAM bus access
CODE_00DEC9: STY $303A                                  ;$00DEC9   | /
CODE_00DECC: SEP #$10                                   ;$00DECC   | 
CODE_00DECE: RTL                                        ;$00DECE   | 

.superfxinit4
CODE_00DECF: STZ $3030                                  ;$00DECF   |  nuke GSU status/flag register
CODE_00DED2: LDY $012D                                  ;$00DED2   | \ set SCBR
CODE_00DED5: STY $3038                                  ;$00DED5   | /
CODE_00DED8: LDY $012E                                  ;$00DED8   | \ set SCMR
CODE_00DEDB: STY $303A                                  ;$00DEDB   | /
CODE_00DEDE: STX $3034                                  ;$00DEDE   |  set PBR
CODE_00DEE1: STA $301E                                  ;$00DEE1   |  set program counter
CODE_00DEE4: REP #$10                                   ;$00DEE4   | 
CODE_00DEE6: LDA #$0020                                 ;$00DEE6   | \
CODE_00DEE9: TAY                                        ;$00DEE9   |  | start GSU execution
CODE_00DEEA: BIT $3030                                  ;$00DEEA   | /\
CODE_00DEED: BNE CODE_00DEEA                            ;$00DEED   |  / wait for GSU execution to end
CODE_00DEEF: LDX $3000                                  ;$00DEEF   | \
CODE_00DEF2: BPL CODE_00DF04                            ;$00DEF2   |  |
CODE_00DEF4: LDA $7F0000,x                              ;$00DEF4   |  |
CODE_00DEF8: STA $3000                                  ;$00DEF8   |  | execute the GSU routine again until r0 is positive
CODE_00DEFB: LDA $301E                                  ;$00DEFB   |  |
CODE_00DEFE: STA $301E                                  ;$00DEFE   |  |
CODE_00DF01: TYA                                        ;$00DF01   |  |
CODE_00DF02: BRA CODE_00DEEA                            ;$00DF02   | /

CODE_00DF04: BEQ CODE_00DF1F                            ;$00DF04   |  end GSU execution if r0 is zero
CODE_00DF06: STZ $303A                                  ;$00DF06   |  give SCPU ROM/RAM bus access
CODE_00DF09: JSR ($DF26,x)                              ;$00DF09   |  x = r0 (#$0002 - #$001A)

CODE_00DF0C: SEP #$20                                   ;$00DF0C   | 
CODE_00DF0E: LDA $012E                                  ;$00DF0E   | \ set SCMR
CODE_00DF11: STA $303A                                  ;$00DF11   | /
CODE_00DF14: REP #$20                                   ;$00DF14   | 
CODE_00DF16: LDA $301E                                  ;$00DF16   | \
CODE_00DF19: STA $301E                                  ;$00DF19   |  | execute the GSU routine again
CODE_00DF1C: TYA                                        ;$00DF1C   |  |
CODE_00DF1D: BRA CODE_00DEEA                            ;$00DF1D   | /

CODE_00DF1F: LDY #$0000                                 ;$00DF1F   | \ give SCPU ROM/RAM bus access
CODE_00DF22: STY $303A                                  ;$00DF22   | /
CODE_00DF25: SEP #$10                                   ;$00DF25   | 
CODE_00DF27: RTL                                        ;$00DF27   | 

; pointer table
; index is r0 after a GSU routine is called by $7EDECF
; when r0 is positive and non-zero
DATA_00DF28:	     dw $DF68		; r0 = #$0002
DATA_00DF2A:	     dw $E04F		; r0 = #$0004
DATA_00DF2C:	     dw $E0A9		; r0 = #$0006
DATA_00DF2E:	     dw $C0CD		; r0 = #$0008
DATA_00DF30:	     dw $DFC3		; r0 = #$000A
DATA_00DF32:	     dw $E023		; r0 = #$000C
DATA_00DF34:	     dw $E017		; r0 = #$000E
DATA_00DF36:	     dw $E0D7		; r0 = #$0010
DATA_00DF38:	     dw $E0E6		; r0 = #$0012
DATA_00DF3A:	     dw $E0F2		; r0 = #$0014
DATA_00DF3C:	     dw $DF44		; r0 = #$0016
DATA_00DF3E:	     dw $E068		; r0 = #$0018
DATA_00DF40:	     dw $E101		; r0 = #$001A
DATA_00DF42:	     dw $E126		; r0 = #$001C

; r0 = #$0016
CODE_00DF44: PHY                                        ;$00DF44   | 
CODE_00DF45: LDA $021A                                  ;$00DF45   | 
CODE_00DF48: CMP #$000B                                 ;$00DF48   | 
CODE_00DF4B: BNE CODE_00DF62                            ;$00DF4B   | 
CODE_00DF4D: STZ $021A                                  ;$00DF4D   | 
CODE_00DF50: LDA #$001F                                 ;$00DF50   | 
CODE_00DF53: STA $0118                                  ;$00DF53   | 
CODE_00DF56: LDA #$0001                                 ;$00DF56   | 
CODE_00DF59: STA $022D                                  ;$00DF59   | 
CODE_00DF5C: JSL CODE_01B2B7                            ;$00DF5C   | 
CODE_00DF60: PLY                                        ;$00DF60   | 
CODE_00DF61: RTS                                        ;$00DF61   | 

CODE_00DF62: JSL CODE_02A4B5                            ;$00DF62   | 
CODE_00DF66: PLY                                        ;$00DF66   | 
CODE_00DF67: RTS                                        ;$00DF67   | 

; r0 = #$0002
CODE_00DF68: PHY                                        ;$00DF68   | 
CODE_00DF69: SEP #$10                                   ;$00DF69   | 
CODE_00DF6B: LDA $300C                                  ;$00DF6B   |  r6
CODE_00DF6E: CMP #$A400                                 ;$00DF6E   | 
CODE_00DF71: BNE CODE_00DF7A                            ;$00DF71   | 

CODE_00DF73: JSR CODE_00DFE2                            ;$00DF73   | 
CODE_00DF76: SEP #$10                                   ;$00DF76   | 
CODE_00DF78: BRA CODE_00DF97                            ;$00DF78   | 

CODE_00DF7A: LDA $6000                                  ;$00DF7A   | 
CODE_00DF7D: AND #$FFF0                                 ;$00DF7D   | 
CODE_00DF80: STA $0000                                  ;$00DF80   | 
CODE_00DF83: LDA $6002                                  ;$00DF83   | 
CODE_00DF86: AND #$FFF0                                 ;$00DF86   | 
CODE_00DF89: STA $0002                                  ;$00DF89   | 
CODE_00DF8C: JSL CODE_03A520                            ;$00DF8C   | 
CODE_00DF90: LDA #$0009                                 ;$00DF90   | \ play sound #$0009
CODE_00DF93: JSL CODE_0085D2                            ;$00DF93   | /
CODE_00DF97: LDA #$01E4                                 ;$00DF97   | 
CODE_00DF9A: JSL CODE_008B21                            ;$00DF9A   | 
CODE_00DF9E: LDA $0000                                  ;$00DF9E   | 
CODE_00DFA1: STA $70A2,y                                ;$00DFA1   | 
CODE_00DFA4: LDA $0002                                  ;$00DFA4   | 
CODE_00DFA7: STA $7142,y                                ;$00DFA7   | 
CODE_00DFAA: LDA #$000C                                 ;$00DFAA   | 
CODE_00DFAD: STA $73C2,y                                ;$00DFAD   | 
CODE_00DFB0: LDA #$0008                                 ;$00DFB0   | 
CODE_00DFB3: STA $7782,y                                ;$00DFB3   | 
CODE_00DFB6: REP #$10                                   ;$00DFB6   | 

CODE_00DFB8: LDA #$0000                                 ;$00DFB8   | 
CODE_00DFBB: STA $0095                                  ;$00DFBB   | 
CODE_00DFBE: LDA #$0007                                 ;$00DFBE   | 
CODE_00DFC1: BRA CODE_00DFCD                            ;$00DFC1   | 

; r0 = #$000A
CODE_00DFC3: LDA #$0000                                 ;$00DFC3   | 
CODE_00DFC6: STA $0095                                  ;$00DFC6   | 
CODE_00DFC9: PHY                                        ;$00DFC9   | 
CODE_00DFCA: LDA #$0001                                 ;$00DFCA   | 
CODE_00DFCD: STA $008F                                  ;$00DFCD   | 
CODE_00DFD0: LDA $6000                                  ;$00DFD0   | 
CODE_00DFD3: STA $0091                                  ;$00DFD3   | 
CODE_00DFD6: LDA $6002                                  ;$00DFD6   | 
CODE_00DFD9: STA $0093                                  ;$00DFD9   | 
CODE_00DFDC: JSL CODE_109295                            ;$00DFDC   | 
CODE_00DFE0: PLY                                        ;$00DFE0   | 
CODE_00DFE1: RTS                                        ;$00DFE1   | 

CODE_00DFE2: LDA #$0093                                 ;$00DFE2   | 
CODE_00DFE5: INC $03B4                                  ;$00DFE5   | 
CODE_00DFE8: LDY $03B4                                  ;$00DFE8   | 
CODE_00DFEB: CPY #$0014                                 ;$00DFEB   | 
CODE_00DFEE: BMI CODE_00DFF1                            ;$00DFEE   | 
CODE_00DFF0: INC A                                      ;$00DFF0   | 
CODE_00DFF1: JSL CODE_0085D2                            ;$00DFF1   | 
CODE_00DFF5: LDA #$0002                                 ;$00DFF5   | 
CODE_00DFF8: STA $0006                                  ;$00DFF8   | 
CODE_00DFFB: SEP #$10                                   ;$00DFFB   | 
CODE_00DFFD: LDA $6000                                  ;$00DFFD   | 
CODE_00E000: AND #$FFF0                                 ;$00E000   | 
CODE_00E003: STA $0000                                  ;$00E003   | 
CODE_00E006: LDA $6002                                  ;$00E006   | 
CODE_00E009: AND #$FFF0                                 ;$00E009   | 
CODE_00E00C: JSL CODE_03A4F5                            ;$00E00C   | 
CODE_00E010: REP #$10                                   ;$00E010   | 
CODE_00E012: RTS                                        ;$00E012   | 

CODE_00E013: JSR CODE_00DFE2                            ;$00E013   | 
CODE_00E016: RTL                                        ;$00E016   | 

; r0 = #$000E
CODE_00E017: LDA $300A                                  ;$00E017   |  r5
CODE_00E01A: STA $0095                                  ;$00E01A   | 
CODE_00E01D: BRA CODE_00DFC9                            ;$00E01D   | 

CODE_00E01F: JSR CODE_00E023                            ;$00E01F   | 
CODE_00E022: RTL                                        ;$00E022   | 

; r0 = #$000C
CODE_00E023: JSR CODE_00DFC3                            ;$00E023   | 
CODE_00E026: PHY                                        ;$00E026   | 
CODE_00E027: LDA $0091                                  ;$00E027   | 
CODE_00E02A: CLC                                        ;$00E02A   | 
CODE_00E02B: ADC #$0010                                 ;$00E02B   | 
CODE_00E02E: STA $0091                                  ;$00E02E   | 
CODE_00E031: JSL CODE_109295                            ;$00E031   | 
CODE_00E035: LDA $0093                                  ;$00E035   | 
CODE_00E038: CLC                                        ;$00E038   | 
CODE_00E039: ADC #$0010                                 ;$00E039   | 
CODE_00E03C: STA $0093                                  ;$00E03C   | 
CODE_00E03F: JSL CODE_109295                            ;$00E03F   | 
CODE_00E043: LDA $6000                                  ;$00E043   | 
CODE_00E046: STA $0091                                  ;$00E046   | 
CODE_00E049: JSL CODE_109295                            ;$00E049   | 
CODE_00E04D: PLY                                        ;$00E04D   | 
CODE_00E04E: RTS                                        ;$00E04E   | 

; r0 = #$0004
CODE_00E04F: PHY                                        ;$00E04F   | 
CODE_00E050: LDA $6000                                  ;$00E050   | 
CODE_00E053: STA $0091                                  ;$00E053   | 
CODE_00E056: LDA $6002                                  ;$00E056   | 
CODE_00E059: STA $0093                                  ;$00E059   | 
CODE_00E05C: LDA #$0000                                 ;$00E05C   | 
CODE_00E05F: STA $008F                                  ;$00E05F   | 
CODE_00E062: JSL CODE_109295                            ;$00E062   | 
CODE_00E066: PLY                                        ;$00E066   | 
CODE_00E067: RTS                                        ;$00E067   | 

; r0 = #$0018
CODE_00E068: PHY                                        ;$00E068   | 
CODE_00E069: LDA $6000                                  ;$00E069   | 
CODE_00E06C: STA $0091                                  ;$00E06C   | 
CODE_00E06F: LDA $6002                                  ;$00E06F   | 
CODE_00E072: STA $0093                                  ;$00E072   | 
CODE_00E075: LDA #$0006                                 ;$00E075   | 
CODE_00E078: STA $008F                                  ;$00E078   | 
CODE_00E07B: JSL CODE_109295                            ;$00E07B   | 
CODE_00E07F: PLY                                        ;$00E07F   | 
CODE_00E080: RTS                                        ;$00E080   | 

DATA_00E081:         dw $0000, $0000, $0000, $2A0D
DATA_00E089:         dw $0000, $0000, $0000, $2A1C
DATA_00E091:         dw $0000, $0000, $0000, $2A2B
DATA_00E099:         dw $0000, $0000, $0000, $2A3A
DATA_00E0A1:         dw $0000, $0000, $0000, $964C

; r0 = #$0006
CODE_00E0A9: PHY                                        ;$00E0A9   | 
CODE_00E0AA: LDA $300C                                  ;$00E0AA   |  r6
CODE_00E0AD: AND #$00FF                                 ;$00E0AD   | 
CODE_00E0B0: ASL A                                      ;$00E0B0   | 
CODE_00E0B1: TAX                                        ;$00E0B1   | 
CODE_00E0B2: LDA $00E081,x                              ;$00E0B2   | 
CODE_00E0B6: STA $95                                    ;$00E0B6   | 
CODE_00E0B8: LDA $6000                                  ;$00E0B8   | 
CODE_00E0BB: STA $91                                    ;$00E0BB   | 
CODE_00E0BD: LDA $6002                                  ;$00E0BD   | 
CODE_00E0C0: STA $93                                    ;$00E0C0   | 
CODE_00E0C2: LDA #$0004                                 ;$00E0C2   | 
CODE_00E0C5: STA $8F                                    ;$00E0C5   | 
CODE_00E0C7: JSL CODE_109295                            ;$00E0C7   | 
CODE_00E0CB: PLY                                        ;$00E0CB   | 
CODE_00E0CC: RTS                                        ;$00E0CC   | 

CODE_00E0CD: PHY                                        ;$00E0CD   | 
CODE_00E0CE: LDX $3002                                  ;$00E0CE   |  r1
CODE_00E0D1: JSL CODE_03BF87                            ;$00E0D1   | 
CODE_00E0D5: PLY                                        ;$00E0D5   | 
CODE_00E0D6: RTS                                        ;$00E0D6   | 

; r0 = #$0010
CODE_00E0D7: LDA $013E                                  ;$00E0D7   | 
CODE_00E0DA: CMP #$000A                                 ;$00E0DA   | 
CODE_00E0DD: BNE CODE_00E0E5                            ;$00E0DD   | 
CODE_00E0DF: PHY                                        ;$00E0DF   | 
CODE_00E0E0: JSL CODE_04F1F6                            ;$00E0E0   | 
CODE_00E0E4: PLY                                        ;$00E0E4   | 
CODE_00E0E5: RTS                                        ;$00E0E5   | 

; r0 = #$0012
CODE_00E0E6: LDA $0CCA                                  ;$00E0E6   | 
CODE_00E0E9: BNE CODE_00E0F1                            ;$00E0E9   | 
CODE_00E0EB: PHY                                        ;$00E0EB   | 
CODE_00E0EC: JSL CODE_04AC9C                            ;$00E0EC   | 
CODE_00E0F0: PLY                                        ;$00E0F0   | 
CODE_00E0F1: RTS                                        ;$00E0F1   | 

; r0 = #$0014
CODE_00E0F2: PHY                                        ;$00E0F2   | 
CODE_00E0F3: SEP #$10                                   ;$00E0F3   | 
CODE_00E0F5: JSL CODE_03A853                            ;$00E0F5   | 
CODE_00E0F9: REP #$10                                   ;$00E0F9   | 
CODE_00E0FB: PLY                                        ;$00E0FB   | 
CODE_00E0FC: RTS                                        ;$00E0FC   | 

DATA_00E0FD:	     dw $0080, $FF80

; r0 = #$001A
CODE_00E101: LDA $0CCA                                  ;$00E101   | 
CODE_00E104: BNE CODE_00E125                            ;$00E104   | 
CODE_00E106: PHY                                        ;$00E106   | 
CODE_00E107: LDA #$0028                                 ;$00E107   | 
CODE_00E10A: JSL CODE_04F6E2                            ;$00E10A   | 
CODE_00E10E: LDA #$FB00                                 ;$00E10E   | 
CODE_00E111: STA $60AA                                  ;$00E111   | 
CODE_00E114: LDX $60C4                                  ;$00E114   | 
CODE_00E117: LDA $00E0FD,x                              ;$00E117   | 
CODE_00E11B: STA $60A8                                  ;$00E11B   | 
CODE_00E11E: LDA #$0020                                 ;$00E11E   | 
CODE_00E121: STA $61F6                                  ;$00E121   | 
CODE_00E124: PLY                                        ;$00E124   | 
CODE_00E125: RTS                                        ;$00E125   | 

; r0 = #$001C
CODE_00E126: PHY                                        ;$00E126   | 
CODE_00E127: LDA $6000                                  ;$00E127   | 
CODE_00E12A: STA $007972                                ;$00E12A   | 
CODE_00E12E: SEP #$10                                   ;$00E12E   | 
CODE_00E130: TAX                                        ;$00E130   | 
CODE_00E131: LDA $7360,x                                ;$00E131   | 
CODE_00E134: CMP #$0115                                 ;$00E134   | 
CODE_00E137: BEQ CODE_00E144                            ;$00E137   | 
CODE_00E139: CMP #$0065                                 ;$00E139   | 
CODE_00E13C: BNE CODE_00E14A                            ;$00E13C   | 
CODE_00E13E: JSL CODE_0CEA92                            ;$00E13E   | 
CODE_00E142: BRA CODE_00E14E                            ;$00E142   | 

CODE_00E144: JSL CODE_04CA27                            ;$00E144   | 
CODE_00E148: BRA CODE_00E14E                            ;$00E148   | 

CODE_00E14A: JSL CODE_0EB499                            ;$00E14A   | 
CODE_00E14E: REP #$10                                   ;$00E14E   | 
CODE_00E150: PLY                                        ;$00E150   | 
CODE_00E151: RTS                                        ;$00E151   | 

.superfxinit5
CODE_00E152: PHB                                        ;$00E152   |  preserve bank
CODE_00E153: STZ $3030                                  ;$00E153   |  nuke status/flag register
CODE_00E156: LDY $012D                                  ;$00E156   | \ set SCBR
CODE_00E159: STY $3038                                  ;$00E159   | /
CODE_00E15C: LDY $012E                                  ;$00E15C   | \ set SCMR
CODE_00E15F: STY $303A                                  ;$00E15F   | /
CODE_00E162: STX $3034                                  ;$00E162   |  set PBR
CODE_00E165: STA $301E                                  ;$00E165   |  set program counter
CODE_00E168: LDA $011A                                  ;$00E168   | 
CODE_00E16B: BEQ CODE_00E170                            ;$00E16B   | 
CODE_00E16D: JMP CODE_00E225                            ;$00E16D   | 

CODE_00E170: PHK                                        ;$00E170   | 
CODE_00E171: PLB                                        ;$00E171   | 
CODE_00E172: REP #$10                                   ;$00E172   | 
CODE_00E174: LDX $04                                    ;$00E174   | 
CODE_00E176: LDY $06                                    ;$00E176   | 
CODE_00E178: LDA #$000C                                 ;$00E178   | 
CODE_00E17B: STA $0C                                    ;$00E17B   | 
CODE_00E17D: CPX #$01FE                                 ;$00E17D   | 
CODE_00E180: BCC CODE_00E188                            ;$00E180   | 
CODE_00E182: STZ $0E                                    ;$00E182   | 
CODE_00E184: LDA $3F                                    ;$00E184   | 
CODE_00E186: BRA CODE_00E1EE                            ;$00E186   | 

CODE_00E188: TYA                                        ;$00E188   | 
CODE_00E189: LSR A                                      ;$00E189   | 
CODE_00E18A: LSR A                                      ;$00E18A   | 
CODE_00E18B: STA $08                                    ;$00E18B   | 
CODE_00E18D: CLC                                        ;$00E18D   | 
CODE_00E18E: ADC #$0008                                 ;$00E18E   | 
CODE_00E191: CMP #$0020                                 ;$00E191   | 
CODE_00E194: BCC CODE_00E199                            ;$00E194   | 
CODE_00E196: LDA #$0020                                 ;$00E196   | 
CODE_00E199: ASL A                                      ;$00E199   | 
CODE_00E19A: STA $0A                                    ;$00E19A   | 
CODE_00E19C: LDA $E9D4,x                                ;$00E19C   | 
CODE_00E19F: PHP                                        ;$00E19F   | 
CODE_00E1A0: BPL CODE_00E1A6                            ;$00E1A0   | 
CODE_00E1A2: EOR #$FFFF                                 ;$00E1A2   | 
CODE_00E1A5: INC A                                      ;$00E1A5   | 
CODE_00E1A6: CMP #$0100                                 ;$00E1A6   | 
CODE_00E1A9: SEP #$20                                   ;$00E1A9   | 
CODE_00E1AB: XBA                                        ;$00E1AB   | 
CODE_00E1AC: LDA $0A                                    ;$00E1AC   | 
CODE_00E1AE: BCS CODE_00E1C4                            ;$00E1AE   | 
CODE_00E1B0: STA $004202                                ;$00E1B0   | 
CODE_00E1B4: XBA                                        ;$00E1B4   | 
CODE_00E1B5: STA $004203                                ;$00E1B5   | 
CODE_00E1B9: NOP                                        ;$00E1B9   | 
CODE_00E1BA: NOP                                        ;$00E1BA   | 
CODE_00E1BB: NOP                                        ;$00E1BB   | 
CODE_00E1BC: REP #$20                                   ;$00E1BC   | 
CODE_00E1BE: LDA $004217                                ;$00E1BE   | 
CODE_00E1C2: BRA CODE_00E1C6                            ;$00E1C2   | 

CODE_00E1C4: REP #$20                                   ;$00E1C4   | 
CODE_00E1C6: AND #$00FF                                 ;$00E1C6   | 
CODE_00E1C9: LSR A                                      ;$00E1C9   | 
CODE_00E1CA: LSR A                                      ;$00E1CA   | 
CODE_00E1CB: LSR A                                      ;$00E1CB   | 
CODE_00E1CC: LSR A                                      ;$00E1CC   | 
CODE_00E1CD: PLP                                        ;$00E1CD   | 
CODE_00E1CE: BPL CODE_00E1D4                            ;$00E1CE   | 
CODE_00E1D0: EOR #$FFFF                                 ;$00E1D0   | 
CODE_00E1D3: INC A                                      ;$00E1D3   | 
CODE_00E1D4: STA $0E                                    ;$00E1D4   | 
CODE_00E1D6: CLC                                        ;$00E1D6   | 
CODE_00E1D7: ADC $08                                    ;$00E1D7   | 
CODE_00E1D9: AND #$00FF                                 ;$00E1D9   | 
CODE_00E1DC: CMP #$0030                                 ;$00E1DC   | 
CODE_00E1DF: LDA $0E                                    ;$00E1DF   | 
CODE_00E1E1: BCC CODE_00E1EB                            ;$00E1E1   | 
CODE_00E1E3: LDA $08                                    ;$00E1E3   | 
CODE_00E1E5: EOR #$FFFF                                 ;$00E1E5   | 
CODE_00E1E8: ADC #$002F                                 ;$00E1E8   | 
CODE_00E1EB: CLC                                        ;$00E1EB   | 
CODE_00E1EC: ADC $3F                                    ;$00E1EC   | 
CODE_00E1EE: STA $55C6,y                                ;$00E1EE   | 
CODE_00E1F1: LDA $0E                                    ;$00E1F1   | 
CODE_00E1F3: STA $55C4,y                                ;$00E1F3   | 
CODE_00E1F6: PHX                                        ;$00E1F6   | 
CODE_00E1F7: TXA                                        ;$00E1F7   | 
CODE_00E1F8: CMP #$01FE                                 ;$00E1F8   | 
CODE_00E1FB: BCC CODE_00E200                            ;$00E1FB   | 
CODE_00E1FD: LDA #$01FE                                 ;$00E1FD   | 
CODE_00E200: LSR A                                      ;$00E200   | 
CODE_00E201: AND #$00FC                                 ;$00E201   | 
CODE_00E204: TAX                                        ;$00E204   | 
CODE_00E205: LDA $54C2,x                                ;$00E205   | 
CODE_00E208: STA $53C2,y                                ;$00E208   | 
CODE_00E20B: PLA                                        ;$00E20B   | 
CODE_00E20C: SEC                                        ;$00E20C   | 
CODE_00E20D: SBC #$0010                                 ;$00E20D   | 
CODE_00E210: AND #$07FE                                 ;$00E210   | 
CODE_00E213: TAX                                        ;$00E213   | 
CODE_00E214: INY                                        ;$00E214   | 
CODE_00E215: INY                                        ;$00E215   | 
CODE_00E216: INY                                        ;$00E216   | 
CODE_00E217: INY                                        ;$00E217   | 
CODE_00E218: DEC $0C                                    ;$00E218   | 
CODE_00E21A: BEQ CODE_00E21F                            ;$00E21A   | 
CODE_00E21C: JMP CODE_00E17D                            ;$00E21C   | 

CODE_00E21F: STX $04                                    ;$00E21F   | 
CODE_00E221: STY $06                                    ;$00E221   | 
CODE_00E223: SEP #$10                                   ;$00E223   | 

CODE_00E225: PLB                                        ;$00E225   | 
CODE_00E226: LDA #$0020                                 ;$00E226   | \ start GSU execution
CODE_00E229: BIT $3030                                  ;$00E229   | /\
CODE_00E22C: BNE CODE_00E229                            ;$00E22C   |  / wait for GSU execution to end
CODE_00E22E: LDY #$00                                   ;$00E22E   | \
CODE_00E230: STY $303A                                  ;$00E230   | / give SCPU ROM/RAM bus access
CODE_00E233: RTL                                        ;$00E233   | 

DATA_00E234:	     dw $0064,$000A
DATA_00E238:	     dw $000A,$FFF6
DATA_00E23C:	     dw $012C,$0000

CODE_00E240: REP #$10                                   ;$00E240   | 
CODE_00E242: LDA $0379                                  ;$00E242   | \
CODE_00E245: CMP #$03E8                                 ;$00E245   |  |
CODE_00E248: BCC CODE_00E25E                            ;$00E248   |  | Prevents the player from getting >999 lives
; |
CODE_00E24A: LDA #$03E7                                 ;$00E24A   |  |
CODE_00E24D: STA $0379                                  ;$00E24D   | /
CODE_00E250: LDA $037F                                  ;$00E250   | 
CODE_00E253: CMP #$03E8                                 ;$00E253   | 
CODE_00E256: BCC CODE_00E25E                            ;$00E256   | 
CODE_00E258: LDA #$03E7                                 ;$00E258   | 
CODE_00E25B: STA $037F                                  ;$00E25B   | 

CODE_00E25E: STZ $0389                                  ;$00E25E   | 
CODE_00E261: INC $03A9                                  ;$00E261   | 
CODE_00E264: LDY #$0000                                 ;$00E264   | 
CODE_00E267: LDA $0396                                  ;$00E267   | 
CODE_00E26A: BEQ CODE_00E2B5                            ;$00E26A   | 
CODE_00E26C: BPL CODE_00E270                            ;$00E26C   | 

CODE_00E26E: INY                                        ;$00E26E   | 
CODE_00E26F: INY                                        ;$00E26F   | 
CODE_00E270: LDA $0B57                                  ;$00E270   | 
CODE_00E273: BNE CODE_00E27D                            ;$00E273   | 
CODE_00E275: LDA $03A9                                  ;$00E275   | 
CODE_00E278: CMP #$0008                                 ;$00E278   | 
CODE_00E27B: BCC CODE_00E2B3                            ;$00E27B   | 
CODE_00E27D: LDA #$0036                                 ;$00E27D   | 
CODE_00E280: JSR CODE_00E372                            ;$00E280   | 

CODE_00E283: STZ $03A9                                  ;$00E283   | 
CODE_00E286: LDA $03B6                                  ;$00E286   | 
CODE_00E289: CLC                                        ;$00E289   | 
CODE_00E28A: ADC $E238,y                                ;$00E28A   | 
CODE_00E28D: BMI CODE_00E297                            ;$00E28D   | 
CODE_00E28F: STA $03B6                                  ;$00E28F   | 
CODE_00E292: CMP $E23C,y                                ;$00E292   | 
CODE_00E295: BCC CODE_00E2A3                            ;$00E295   | 
CODE_00E297: LDA $E23C,y                                ;$00E297   | 
CODE_00E29A: STA $03B6                                  ;$00E29A   | 
CODE_00E29D: STZ $0396                                  ;$00E29D   | 
CODE_00E2A0: JMP CODE_00E32C                            ;$00E2A0   | 

CODE_00E2A3: LDA $0396                                  ;$00E2A3   | 
CODE_00E2A6: SEC                                        ;$00E2A6   | 
CODE_00E2A7: SBC $E238,y                                ;$00E2A7   | 
CODE_00E2AA: STA $0396                                  ;$00E2AA   | 
CODE_00E2AD: TYA                                        ;$00E2AD   | 
CODE_00E2AE: BNE CODE_00E2B3                            ;$00E2AE   | 
CODE_00E2B0: INC $0389                                  ;$00E2B0   | 
CODE_00E2B3: BRA CODE_00E32C                            ;$00E2B3   | 

CODE_00E2B5: LDA $0387                                  ;$00E2B5   | 
CODE_00E2B8: BMI CODE_00E2CC                            ;$00E2B8   | 
CODE_00E2BA: BNE CODE_00E32C                            ;$00E2BA   | 

CODE_00E2BC: LDA $0B57                                  ;$00E2BC   | 
CODE_00E2BF: ORA $0B65                                  ;$00E2BF   | 
CODE_00E2C2: ORA $0B7B                                  ;$00E2C2   | 
CODE_00E2C5: ORA $0D0F                                  ;$00E2C5   | 
CODE_00E2C8: BEQ CODE_00E2F5                            ;$00E2C8   | 
CODE_00E2CA: BRA CODE_00E32C                            ;$00E2CA   | 

CODE_00E2CC: LDA $03B6                                  ;$00E2CC   | 
CODE_00E2CF: CMP #$006D                                 ;$00E2CF   | 
CODE_00E2D2: BCS CODE_00E32C                            ;$00E2D2   | 
CODE_00E2D4: INC $0394                                  ;$00E2D4   | 
CODE_00E2D7: LDA $0394                                  ;$00E2D7   | 
CODE_00E2DA: CMP #$000C                                 ;$00E2DA   | 
CODE_00E2DD: BCC CODE_00E32C                            ;$00E2DD   | 

CODE_00E2DF: STZ $0394                                  ;$00E2DF   | 
CODE_00E2E2: INC $03B6                                  ;$00E2E2   | 
CODE_00E2E5: LDA $03B6                                  ;$00E2E5   | 
CODE_00E2E8: CMP #$0064                                 ;$00E2E8   | 
CODE_00E2EB: BNE CODE_00E32C                            ;$00E2EB   | 

CODE_00E2ED: LDA #$0032                                 ;$00E2ED   | 
CODE_00E2F0: JSR CODE_00E372                            ;$00E2F0   | 

CODE_00E2F3: BRA CODE_00E32C                            ;$00E2F3   | 

CODE_00E2F5: STZ $0394                                  ;$00E2F5   | 
CODE_00E2F8: LDA $0C8A                                  ;$00E2F8   | 
CODE_00E2FB: BNE CODE_00E36F                            ;$00E2FB   | 
CODE_00E2FD: LDA $03B6                                  ;$00E2FD   | 
CODE_00E300: BEQ CODE_00E36F                            ;$00E300   | 
CODE_00E302: INC $0392                                  ;$00E302   | 
CODE_00E305: LDA $0392                                  ;$00E305   | 
CODE_00E308: CMP #$0004                                 ;$00E308   | 
CODE_00E30B: BCC CODE_00E32C                            ;$00E30B   | 
CODE_00E30D: STZ $0392                                  ;$00E30D   | 
CODE_00E310: DEC $03B6                                  ;$00E310   | 
CODE_00E313: LDA $03B6                                  ;$00E313   | 
CODE_00E316: CMP #$005A                                 ;$00E316   | 
CODE_00E319: BCS CODE_00E32C                            ;$00E319   | 
CODE_00E31B: LDA $03AB                                  ;$00E31B   | 
CODE_00E31E: AND #$00FF                                 ;$00E31E   | 
CODE_00E321: BNE CODE_00E32C                            ;$00E321   | 
CODE_00E323: INC $03AB                                  ;$00E323   | 
CODE_00E326: LDA #$0024                                 ;$00E326   | 
CODE_00E329: JSR CODE_00E372                            ;$00E329   | 

CODE_00E32C: LDX #$0000                                 ;$00E32C   | 
CODE_00E32F: LDA $03B6                                  ;$00E32F   | 
CODE_00E332: CMP #$03E8                                 ;$00E332   | 
CODE_00E335: BCC CODE_00E33D                            ;$00E335   | 

CODE_00E337: LDA #$03E7                                 ;$00E337   | 
CODE_00E33A: STA $03B6                                  ;$00E33A   | 

CODE_00E33D: LDY #$0000                                 ;$00E33D   | 

CODE_00E340: CMP $E234,x                                ;$00E340   | 
CODE_00E343: BCC CODE_00E34B                            ;$00E343   | 
CODE_00E345: SBC $E234,x                                ;$00E345   | 
CODE_00E348: INY                                        ;$00E348   | 
CODE_00E349: BRA CODE_00E340                            ;$00E349   | 

CODE_00E34B: STY $00,x                                  ;$00E34B   | 
CODE_00E34D: INX                                        ;$00E34D   | 
CODE_00E34E: INX                                        ;$00E34E   | 
CODE_00E34F: CPX #$0004                                 ;$00E34F   | 
CODE_00E352: BNE CODE_00E33D                            ;$00E352   | 
CODE_00E354: STA $00,x                                  ;$00E354   | 
CODE_00E356: LDA $00                                    ;$00E356   | 
CODE_00E358: STA $03A1                                  ;$00E358   | 
CODE_00E35B: LDA $02                                    ;$00E35B   | 
CODE_00E35D: STA $03A3                                  ;$00E35D   | 
CODE_00E360: LDA $04                                    ;$00E360   | 
CODE_00E362: STA $03A5                                  ;$00E362   | 
CODE_00E365: BNE CODE_00E36F                            ;$00E365   | 
CODE_00E367: LDA $0392                                  ;$00E367   | 
CODE_00E36A: BNE CODE_00E36F                            ;$00E36A   | 
CODE_00E36C: INC $0389                                  ;$00E36C   | 

CODE_00E36F: SEP #$10                                   ;$00E36F   | 
CODE_00E371: RTS                                        ;$00E371   | 

CODE_00E372: PHX                                        ;$00E372   | 
CODE_00E373: LDX $57                                    ;$00E373   | \
CODE_00E375: STA $59,x                                  ;$00E375   |  | play sound
CODE_00E377: INC $57                                    ;$00E377   | /
CODE_00E379: PLX                                        ;$00E379   | 
CODE_00E37A: RTS                                        ;$00E37A   | 

CODE_00E37B: PHB                                        ;$00E37B   | 
CODE_00E37C: PHK                                        ;$00E37C   | 
CODE_00E37D: PLB                                        ;$00E37D   | 
CODE_00E37E: JSR CODE_00E3AA                            ;$00E37E   | 
CODE_00E381: PLB                                        ;$00E381   | 
CODE_00E382: RTL                                        ;$00E382   | 

DATA_00E383:	     db $02,$40,$7E,$75,$82,$00,$08,$80
DATA_00E38B:	     db $17,$F2,$E8,$01,$2D,$B6,$01,$76
DATA_00E393:	     db $B9,$01,$00,$80,$17,$9E,$BC,$0F
DATA_00E39B:	     db $C1,$B6,$01,$FA,$E8,$01,$42,$E5
DATA_00E3A3:	     db $01,$02,$E9,$01,$D2,$E1,$10

CODE_00E3AA: REP #$10                                   ;$00E3AA   | 
CODE_00E3AC: LDY $0127                                  ;$00E3AC   | 
CODE_00E3AF: LDX $E383,y                                ;$00E3AF   | 
CODE_00E3B2: LDA $E385,y                                ;$00E3B2   | 
CODE_00E3B5: JSR CODE_00E44A                            ;$00E3B5   | 
CODE_00E3B8: LDA $0127                                  ;$00E3B8   | 
CODE_00E3BB: BNE CODE_00E3CA                            ;$00E3BB   | 
CODE_00E3BD: STA $7E4000                                ;$00E3BD   | 
CODE_00E3C1: STA $7E4001                                ;$00E3C1   | 
CODE_00E3C5: DEC A                                      ;$00E3C5   | 
CODE_00E3C6: STA $7E4003                                ;$00E3C6   | 
CODE_00E3CA: STZ $0127                                  ;$00E3CA   | 
CODE_00E3CD: RTS                                        ;$00E3CD   | 

DATA_00E3CE:	     db $00,$48

DATA_00E3D0:	     db $7E,$2A,$B7,$11,$44,$B7,$11

CODE_00E3D7: PHB                                        ;$00E3D7   | 
CODE_00E3D8: PHK                                        ;$00E3D8   | 
CODE_00E3D9: PLB                                        ;$00E3D9   | 
CODE_00E3DA: JSR CODE_00E3DF                            ;$00E3DA   | 
CODE_00E3DD: PLB                                        ;$00E3DD   | 
CODE_00E3DE: RTL                                        ;$00E3DE   | 

CODE_00E3DF: REP #$10                                   ;$00E3DF   | 
CODE_00E3E1: LDX $0129                                  ;$00E3E1   | 
CODE_00E3E4: LDY $E3CE,x                                ;$00E3E4   | 
CODE_00E3E7: LDA $E3D0,x                                ;$00E3E7   | 
CODE_00E3EA: PHB                                        ;$00E3EA   | 
CODE_00E3EB: PHA                                        ;$00E3EB   | 
CODE_00E3EC: PLB                                        ;$00E3EC   | 
CODE_00E3ED: STA $00                                    ;$00E3ED   | 
CODE_00E3EF: REP #$20                                   ;$00E3EF   | 
CODE_00E3F1: LDA $0000,y                                ;$00E3F1   | 
CODE_00E3F4: STA $04                                    ;$00E3F4   | 
CODE_00E3F6: CMP #$4802                                 ;$00E3F6   | 
CODE_00E3F9: BEQ CODE_00E443                            ;$00E3F9   | 
CODE_00E3FB: INY                                        ;$00E3FB   | 
CODE_00E3FC: INY                                        ;$00E3FC   | 
CODE_00E3FD: LDA $0000,y                                ;$00E3FD   | 
CODE_00E400: STA $002116                                ;$00E400   | 
CODE_00E404: LDA $0004,y                                ;$00E404   | 
CODE_00E407: STA $004301                                ;$00E407   | 
CODE_00E40B: LDA $0006,y                                ;$00E40B   | 
CODE_00E40E: STA $004303                                ;$00E40E   | 
CODE_00E412: LDA $0008,y                                ;$00E412   | 
CODE_00E415: STA $004305                                ;$00E415   | 
CODE_00E419: LDA $0002,y                                ;$00E419   | 
CODE_00E41C: SEP #$20                                   ;$00E41C   | 
CODE_00E41E: STA $002115                                ;$00E41E   | 
CODE_00E422: XBA                                        ;$00E422   | 
CODE_00E423: STA $004300                                ;$00E423   | 
CODE_00E427: LDA #$01                                   ;$00E427   | 
CODE_00E429: STA $00420B                                ;$00E429   | 
CODE_00E42D: REP #$20                                   ;$00E42D   | 
CODE_00E42F: LDA $000A,y                                ;$00E42F   | 
CODE_00E432: TAY                                        ;$00E432   | 
CODE_00E433: CMP $04                                    ;$00E433   | 
CODE_00E435: BNE CODE_00E3FD                            ;$00E435   | 
CODE_00E437: LDA $000129                                ;$00E437   | 
CODE_00E43B: BNE CODE_00E443                            ;$00E43B   | 
CODE_00E43D: LDA #$4802                                 ;$00E43D   | 
CODE_00E440: STA $4800                                  ;$00E440   | 
CODE_00E443: PLB                                        ;$00E443   | 
CODE_00E444: STZ $0129                                  ;$00E444   | 
CODE_00E447: SEP #$30                                   ;$00E447   | 
CODE_00E449: RTS                                        ;$00E449   | 

CODE_00E44A: PHB                                        ;$00E44A   | 
CODE_00E44B: PHA                                        ;$00E44B   | 
CODE_00E44C: PLB                                        ;$00E44C   | 
CODE_00E44D: STA $00                                    ;$00E44D   | 
CODE_00E44F: REP #$20                                   ;$00E44F   | 
CODE_00E451: LDY $0000,x                                ;$00E451   | 
CODE_00E454: BPL CODE_00E45A                            ;$00E454   | 
CODE_00E456: SEP #$30                                   ;$00E456   | 
CODE_00E458: PLB                                        ;$00E458   | 
CODE_00E459: RTS                                        ;$00E459   | 

CODE_00E45A: LDA $0002,x                                ;$00E45A   | 
CODE_00E45D: AND #$1FFF                                 ;$00E45D   | 
CODE_00E460: INC A                                      ;$00E460   | 
CODE_00E461: STA $01                                    ;$00E461   | 
CODE_00E463: STA $03                                    ;$00E463   | 
CODE_00E465: LDA #$0080                                 ;$00E465   | 
CODE_00E468: BIT $0002,x                                ;$00E468   | 
CODE_00E46B: BPL CODE_00E470                            ;$00E46B   | 
CODE_00E46D: LDA #$0081                                 ;$00E46D   | 
CODE_00E470: STA $002115                                ;$00E470   | 
CODE_00E474: STA $05                                    ;$00E474   | 
CODE_00E476: TYA                                        ;$00E476   | 
CODE_00E477: STA $002116                                ;$00E477   | 
CODE_00E47B: LDA $0002,x                                ;$00E47B   | 
CODE_00E47E: AND #$2000                                 ;$00E47E   | 
CODE_00E481: BEQ CODE_00E49F                            ;$00E481   | 
CODE_00E483: LDA #$0003                                 ;$00E483   | 
CODE_00E486: STA $03                                    ;$00E486   | 
CODE_00E488: LDA $0004,x                                ;$00E488   | 
CODE_00E48B: STA $004302                                ;$00E48B   | 
CODE_00E48F: LDA $0005,x                                ;$00E48F   | 
CODE_00E492: STA $004303                                ;$00E492   | 
CODE_00E496: LDA $002139                                ;$00E496   | 
CODE_00E49A: LDA #$3981                                 ;$00E49A   | 
CODE_00E49D: BRA CODE_00E4EB                            ;$00E49D   | 

CODE_00E49F: LDA $00                                    ;$00E49F   | 
CODE_00E4A1: STA $004304                                ;$00E4A1   | 
CODE_00E4A5: LDY #$01                                   ;$00E4A5   | 
CODE_00E4A7: CLC                                        ;$00E4A7   | 
CODE_00E4A8: BVC CODE_00E4E1                            ;$00E4A8   | 
CODE_00E4AA: LSR $01                                    ;$00E4AA   | 
CODE_00E4AC: LDA #$0002                                 ;$00E4AC   | 
CODE_00E4AF: STA $03                                    ;$00E4AF   | 
CODE_00E4B1: LDA #$1908                                 ;$00E4B1   | 
CODE_00E4B4: STA $004300                                ;$00E4B4   | 
CODE_00E4B8: TXA                                        ;$00E4B8   | 
CODE_00E4B9: CLC                                        ;$00E4B9   | 
CODE_00E4BA: ADC #$0005                                 ;$00E4BA   | 
CODE_00E4BD: STA $004302                                ;$00E4BD   | 
CODE_00E4C1: LDA $01                                    ;$00E4C1   | 
CODE_00E4C3: STA $004305                                ;$00E4C3   | 
CODE_00E4C7: LDA #$0100                                 ;$00E4C7   | 
CODE_00E4CA: STA $00420A                                ;$00E4CA   | 
CODE_00E4CE: LDA $05                                    ;$00E4CE   | 
CODE_00E4D0: AND #$007F                                 ;$00E4D0   | 
CODE_00E4D3: STA $002115                                ;$00E4D3   | 
CODE_00E4D7: LDA $0000,x                                ;$00E4D7   | 
CODE_00E4DA: STA $002116                                ;$00E4DA   | 
CODE_00E4DE: LDY #$08                                   ;$00E4DE   | 
CODE_00E4E0: CLC                                        ;$00E4E0   | 
CODE_00E4E1: TXA                                        ;$00E4E1   | 
CODE_00E4E2: CLC                                        ;$00E4E2   | 
CODE_00E4E3: ADC #$0004                                 ;$00E4E3   | 
CODE_00E4E6: STA $004302                                ;$00E4E6   | 
CODE_00E4EA: TYA                                        ;$00E4EA   | 
CODE_00E4EB: STA $004300                                ;$00E4EB   | 
CODE_00E4EF: LDA $01                                    ;$00E4EF   | 
CODE_00E4F1: STA $004305                                ;$00E4F1   | 
CODE_00E4F5: LDA #$0100                                 ;$00E4F5   | 
CODE_00E4F8: STA $00420A                                ;$00E4F8   | 
CODE_00E4FC: TXA                                        ;$00E4FC   | 
CODE_00E4FD: CLC                                        ;$00E4FD   | 
CODE_00E4FE: ADC #$0004                                 ;$00E4FE   | 
CODE_00E501: ADC $03                                    ;$00E501   | 
CODE_00E503: TAX                                        ;$00E503   | 
CODE_00E504: JMP CODE_00E451                            ;$00E504   | 

CODE_00E507: LDA $4212                                  ;$00E507   | \
CODE_00E50A: LSR A                                      ;$00E50A   |  | enable auto-joypad read
CODE_00E50B: BCS CODE_00E507                            ;$00E50B   | /
CODE_00E50D: REP #$30                                   ;$00E50D   | 

.update_controllers					    ;\
CODE_00E50F: LDA $4218                                  ;$00E50F   |  |\ load controller 1 data
CODE_00E512: BIT #$000F                                 ;$00E512   |  | | filter out potentially unwanted bits
CODE_00E515: BEQ CODE_00E51A                            ;$00E515   |  | |
CODE_00E517: LDA #$0000                                 ;$00E517   |  | |
CODE_00E51A: STA $093C                                  ;$00E51A   |  | |\ store filtered value to $093C and Y
CODE_00E51D: TAY                                        ;$00E51D   |  | |/
CODE_00E51E: EOR $0944                                  ;$00E51E   |  | | flip any disabled bits off
CODE_00E521: AND $093C                                  ;$00E521   |  | | reset any disabled bits turned on
CODE_00E524: STA $093E                                  ;$00E524   |  | | store controller data
CODE_00E527: STY $0944                                  ;$00E527   |  |/
CODE_00E52A: LDA $421A                                  ;$00E52A   |  |\ load controller 2 data
CODE_00E52D: BIT #$000F                                 ;$00E52D   |  | | filter out potentially unwanted bits
CODE_00E530: BEQ CODE_00E535                            ;$00E530   |  | |
CODE_00E532: LDA #$0000                                 ;$00E532   |  | |
CODE_00E535: STA $0940                                  ;$00E535   |  | |\ store filtered value to $0940 and Y
CODE_00E538: TAY                                        ;$00E538   |  | |/
CODE_00E539: EOR $0946                                  ;$00E539   |  | | flip any disabled bits off
CODE_00E53C: AND $0940                                  ;$00E53C   |  | | reset any disabled bits turned on
CODE_00E53F: STA $0942                                  ;$00E53F   |  | | store controller data
CODE_00E542: STY $0946                                  ;$00E542   |  |/
CODE_00E545: LDA $093C                                  ;$00E545   |  |
CODE_00E548: STA $35                                    ;$00E548   |  |
CODE_00E54A: LDA $093E                                  ;$00E54A   |  |
CODE_00E54D: STA $37                                    ;$00E54D   |  |
CODE_00E54F: SEP #$30                                   ;$00E54F   |  |
CODE_00E551: RTS                                        ;$00E551   | /

; 1024 bytes moved to $702200
; division lookup table for gsu: 1/x
DATA_00E552:         dw $FFFF, $FFFF, $8000, $5555
DATA_00E55A:         dw $4000, $3333, $2AAA, $2492
DATA_00E562:         dw $2000, $1C71, $1999, $1745
DATA_00E56A:         dw $1555, $13B1, $1249, $1111
DATA_00E572:         dw $1000, $0F0F, $0E38, $0D79
DATA_00E57A:         dw $0CCC, $0C30, $0BA2, $0B21
DATA_00E582:         dw $0AAA, $0A3D, $09D8, $097B
DATA_00E58A:         dw $0924, $08D3, $0888, $0842
DATA_00E592:         dw $0800, $07C1, $0787, $0750
DATA_00E59A:         dw $071C, $06EB, $06BC, $0690
DATA_00E5A2:         dw $0666, $063E, $0618, $05F4
DATA_00E5AA:         dw $05D1, $05B0, $0590, $0572
DATA_00E5B2:         dw $0555, $0539, $051E, $0505
DATA_00E5BA:         dw $04EC, $04D4, $04BD, $04A7
DATA_00E5C2:         dw $0492, $047D, $0469, $0456
DATA_00E5CA:         dw $0444, $0432, $0421, $0410
DATA_00E5D2:         dw $0400, $03F0, $03E0, $03D2
DATA_00E5DA:         dw $03C3, $03B5, $03A8, $039B
DATA_00E5E2:         dw $038E, $0381, $0375, $0369
DATA_00E5EA:         dw $035E, $0353, $0348, $033D
DATA_00E5F2:         dw $0333, $0329, $031F, $0315
DATA_00E5FA:         dw $030C, $0303, $02FA, $02F1
DATA_00E602:         dw $02E8, $02E0, $02D8, $02D0
DATA_00E60A:         dw $02C8, $02C0, $02B9, $02B1
DATA_00E612:         dw $02AA, $02A3, $029C, $0295
DATA_00E61A:         dw $028F, $0288, $0282, $027C
DATA_00E622:         dw $0276, $0270, $026A, $0264
DATA_00E62A:         dw $025E, $0259, $0253, $024E
DATA_00E632:         dw $0249, $0243, $023E, $0239
DATA_00E63A:         dw $0234, $0230, $022B, $0226
DATA_00E642:         dw $0222, $021D, $0219, $0214
DATA_00E64A:         dw $0210, $020C, $0208, $0204
DATA_00E652:         dw $0200, $01FC, $01F8, $01F4
DATA_00E65A:         dw $01F0, $01EC, $01E9, $01E5
DATA_00E662:         dw $01E1, $01DE, $01DA, $01D7
DATA_00E66A:         dw $01D4, $01D0, $01CD, $01CA
DATA_00E672:         dw $01C7, $01C3, $01C0, $01BD
DATA_00E67A:         dw $01BA, $01B7, $01B4, $01B2
DATA_00E682:         dw $01AF, $01AC, $01A9, $01A6
DATA_00E68A:         dw $01A4, $01A1, $019E, $019C
DATA_00E692:         dw $0199, $0197, $0194, $0192
DATA_00E69A:         dw $018F, $018D, $018A, $0188
DATA_00E6A2:         dw $0186, $0183, $0181, $017F
DATA_00E6AA:         dw $017D, $017A, $0178, $0176
DATA_00E6B2:         dw $0174, $0172, $0170, $016E
DATA_00E6BA:         dw $016C, $016A, $0168, $0166
DATA_00E6C2:         dw $0164, $0162, $0160, $015E
DATA_00E6CA:         dw $015C, $015A, $0158, $0157
DATA_00E6D2:         dw $0155, $0153, $0151, $0150
DATA_00E6DA:         dw $014E, $014C, $014A, $0149
DATA_00E6E2:         dw $0147, $0146, $0144, $0142
DATA_00E6EA:         dw $0141, $013F, $013E, $013C
DATA_00E6F2:         dw $013B, $0139, $0138, $0136
DATA_00E6FA:         dw $0135, $0133, $0132, $0130
DATA_00E702:         dw $012F, $012E, $012C, $012B
DATA_00E70A:         dw $0129, $0128, $0127, $0125
DATA_00E712:         dw $0124, $0123, $0121, $0120
DATA_00E71A:         dw $011F, $011E, $011C, $011B
DATA_00E722:         dw $011A, $0119, $0118, $0116
DATA_00E72A:         dw $0115, $0114, $0113, $0112
DATA_00E732:         dw $0111, $010F, $010E, $010D
DATA_00E73A:         dw $010C, $010B, $010A, $0109
DATA_00E742:         dw $0108, $0107, $0106, $0105
DATA_00E74A:         dw $0104, $0103, $0102, $0101
DATA_00E752:         dw $0100, $00FF, $00FE, $00FD
DATA_00E75A:         dw $00FC, $00FB, $00FA, $00F9
DATA_00E762:         dw $00F8, $00F7, $00F6, $00F5
DATA_00E76A:         dw $00F4, $00F3, $00F2, $00F1
DATA_00E772:         dw $00F0, $00F0, $00EF, $00EE
DATA_00E77A:         dw $00ED, $00EC, $00EB, $00EA
DATA_00E782:         dw $00EA, $00E9, $00E8, $00E7
DATA_00E78A:         dw $00E6, $00E5, $00E5, $00E4
DATA_00E792:         dw $00E3, $00E2, $00E1, $00E1
DATA_00E79A:         dw $00E0, $00DF, $00DE, $00DE
DATA_00E7A2:         dw $00DD, $00DC, $00DB, $00DB
DATA_00E7AA:         dw $00DA, $00D9, $00D9, $00D8
DATA_00E7B2:         dw $00D7, $00D6, $00D6, $00D5
DATA_00E7BA:         dw $00D4, $00D4, $00D3, $00D2
DATA_00E7C2:         dw $00D2, $00D1, $00D0, $00D0
DATA_00E7CA:         dw $00CF, $00CE, $00CE, $00CD
DATA_00E7D2:         dw $00CC, $00CC, $00CB, $00CA
DATA_00E7DA:         dw $00CA, $00C9, $00C9, $00C8
DATA_00E7E2:         dw $00C7, $00C7, $00C6, $00C5
DATA_00E7EA:         dw $00C5, $00C4, $00C4, $00C3
DATA_00E7F2:         dw $00C3, $00C2, $00C1, $00C1
DATA_00E7FA:         dw $00C0, $00C0, $00BF, $00BF
DATA_00E802:         dw $00BE, $00BD, $00BD, $00BC
DATA_00E80A:         dw $00BC, $00BB, $00BB, $00BA
DATA_00E812:         dw $00BA, $00B9, $00B9, $00B8
DATA_00E81A:         dw $00B8, $00B7, $00B7, $00B6
DATA_00E822:         dw $00B6, $00B5, $00B5, $00B4
DATA_00E82A:         dw $00B4, $00B3, $00B3, $00B2
DATA_00E832:         dw $00B2, $00B1, $00B1, $00B0
DATA_00E83A:         dw $00B0, $00AF, $00AF, $00AE
DATA_00E842:         dw $00AE, $00AD, $00AD, $00AC
DATA_00E84A:         dw $00AC, $00AC, $00AB, $00AB
DATA_00E852:         dw $00AA, $00AA, $00A9, $00A9
DATA_00E85A:         dw $00A8, $00A8, $00A8, $00A7
DATA_00E862:         dw $00A7, $00A6, $00A6, $00A5
DATA_00E86A:         dw $00A5, $00A5, $00A4, $00A4
DATA_00E872:         dw $00A3, $00A3, $00A3, $00A2
DATA_00E87A:         dw $00A2, $00A1, $00A1, $00A1
DATA_00E882:         dw $00A0, $00A0, $009F, $009F
DATA_00E88A:         dw $009F, $009E, $009E, $009D
DATA_00E892:         dw $009D, $009D, $009C, $009C
DATA_00E89A:         dw $009C, $009B, $009B, $009A
DATA_00E8A2:         dw $009A, $009A, $0099, $0099
DATA_00E8AA:         dw $0099, $0098, $0098, $0098
DATA_00E8B2:         dw $0097, $0097, $0097, $0096
DATA_00E8BA:         dw $0096, $0095, $0095, $0095
DATA_00E8C2:         dw $0094, $0094, $0094, $0093
DATA_00E8CA:         dw $0093, $0093, $0092, $0092
DATA_00E8D2:         dw $0092, $0091, $0091, $0091
DATA_00E8DA:         dw $0090, $0090, $0090, $0090
DATA_00E8E2:         dw $008F, $008F, $008F, $008E
DATA_00E8EA:         dw $008E, $008E, $008D, $008D
DATA_00E8F2:         dw $008D, $008C, $008C, $008C
DATA_00E8FA:         dw $008C, $008B, $008B, $008B
DATA_00E902:         dw $008A, $008A, $008A, $0089
DATA_00E90A:         dw $0089, $0089, $0089, $0088
DATA_00E912:         dw $0088, $0088, $0087, $0087
DATA_00E91A:         dw $0087, $0087, $0086, $0086
DATA_00E922:         dw $0086, $0086, $0085, $0085
DATA_00E92A:         dw $0085, $0084, $0084, $0084
DATA_00E932:         dw $0084, $0083, $0083, $0083
DATA_00E93A:         dw $0083, $0082, $0082, $0082
DATA_00E942:         dw $0082, $0081, $0081, $0081
DATA_00E94A:         dw $0081, $0080, $0080, $0080

DATA_00E953:         db $00

; mode 7 stuff?
DATA_00E954:         dw $0100, $0100, $0100, $00FF
DATA_00E95C:         dw $00FF, $00FE, $00FD, $00FC
DATA_00E964:         dw $00FB, $00FA, $00F8, $00F7
DATA_00E96C:         dw $00F5, $00F3, $00F1, $00EF
DATA_00E974:         dw $00ED, $00EA, $00E7, $00E5
DATA_00E97C:         dw $00E2, $00DF, $00DC, $00D8
DATA_00E984:         dw $00D5, $00D1, $00CE, $00CA
DATA_00E98C:         dw $00C6, $00C2, $00BE, $00B9
DATA_00E994:         dw $00B5, $00B1, $00AC, $00A7
DATA_00E99C:         dw $00A2, $009D, $0098, $0093
DATA_00E9A4:         dw $008E, $0089, $0084, $007E
DATA_00E9AC:         dw $0079, $0073, $006D, $0068
DATA_00E9B4:         dw $0062, $005C, $0056, $0050
DATA_00E9BC:         dw $004A, $0044, $003E, $0038
DATA_00E9C4:         dw $0032, $002C, $0026, $001F
DATA_00E9CC:         dw $0019, $0013, $000D, $0006

DATA_00E9D4:         dw $0000, $FFFA, $FFF3, $FFED
DATA_00E9DC:         dw $FFE7, $FFE1, $FFDA, $FFD4
DATA_00E9E4:         dw $FFCE, $FFC8, $FFC2, $FFBC
DATA_00E9EC:         dw $FFB6, $FFB0, $FFAA, $FFA4
DATA_00E9F4:         dw $FF9E, $FF98, $FF93, $FF8D
DATA_00E9FC:         dw $FF87, $FF82, $FF7C, $FF77
DATA_00EA04:         dw $FF72, $FF6D, $FF68, $FF63
DATA_00EA0C:         dw $FF5E, $FF59, $FF54, $FF4F
DATA_00EA14:         dw $FF4B, $FF47, $FF42, $FF3E
DATA_00EA1C:         dw $FF3A, $FF36, $FF32, $FF2F
DATA_00EA24:         dw $FF2B, $FF28, $FF24, $FF21
DATA_00EA2C:         dw $FF1E, $FF1B, $FF19, $FF16
DATA_00EA34:         dw $FF13, $FF11, $FF0F, $FF0D
DATA_00EA3C:         dw $FF0B, $FF09, $FF08, $FF06
DATA_00EA44:         dw $FF05, $FF04, $FF03, $FF02
DATA_00EA4C:         dw $FF01, $FF01, $FF00, $FF00

DATA_00EA57:         dw $00FF, $01FF, $01FF, $02FF
DATA_00EA5F:         dw $03FF, $04FF, $05FF, $06FF
DATA_00EA67:         dw $08FF, $09FF, $0BFF, $0DFF
DATA_00EA6F:         dw $0FFF, $11FF, $13FF, $16FF
DATA_00EA77:         dw $19FF, $1BFF, $1EFF, $21FF
DATA_00EA7F:         dw $24FF, $28FF, $2BFF, $2FFF
DATA_00EA87:         dw $32FF, $36FF, $3AFF, $3EFF
DATA_00EA8F:         dw $42FF, $47FF, $4BFF, $4FFF
DATA_00EA97:         dw $54FF, $59FF, $5EFF, $63FF
DATA_00EA9F:         dw $68FF, $6DFF, $72FF, $77FF
DATA_00EAA7:         dw $7CFF, $82FF, $87FF, $8DFF
DATA_00EAAF:         dw $93FF, $98FF, $9EFF, $A4FF
DATA_00EAB7:         dw $AAFF, $B0FF, $B6FF, $BCFF
DATA_00EABF:         dw $C2FF, $C8FF, $CEFF, $D4FF
DATA_00EAC7:         dw $DAFF, $E1FF, $E7FF, $EDFF
DATA_00EACF:         dw $F3FF, $FAFF, $00FF

DATA_00EAD5:         dw $0600, $0D00, $1300, $1900
DATA_00EADD:         dw $1F00, $2600, $2C00, $3200
DATA_00EAE5:         dw $3800, $3E00, $4400, $4A00
DATA_00EAED:         dw $5000, $5600, $5C00, $6200
DATA_00EAF5:         dw $6800, $6D00, $7300, $7900
DATA_00EAFD:         dw $7E00, $8400, $8900, $8E00
DATA_00EB05:         dw $9300, $9800, $9D00, $A200
DATA_00EB0D:         dw $A700, $AC00, $B100, $B500
DATA_00EB15:         dw $B900, $BE00, $C200, $C600
DATA_00EB1D:         dw $CA00, $CE00, $D100, $D500
DATA_00EB25:         dw $D800, $DC00, $DF00, $E200
DATA_00EB2D:         dw $E500, $E700, $EA00, $ED00
DATA_00EB35:         dw $EF00, $F100, $F300, $F500
DATA_00EB3D:         dw $F700, $F800, $FA00, $FB00
DATA_00EB45:         dw $FC00, $FD00, $FE00, $FF00
DATA_00EB4D:         dw $FF00

DATA_00EB4F:         dw $0000, $0001, $0001, $0001
DATA_00EB57:         dw $0001, $FF01, $FF00, $FE00
DATA_00EB5F:         dw $FD00, $FC00, $FB00, $FA00
DATA_00EB67:         dw $F800, $F700, $F500, $F300
DATA_00EB6F:         dw $F100, $EF00, $ED00, $EA00
DATA_00EB77:         dw $E700, $E500, $E200, $DF00
DATA_00EB7F:         dw $DC00, $D800, $D500, $D100
DATA_00EB87:         dw $CE00, $CA00, $C600, $C200
DATA_00EB8F:         dw $BE00, $B900, $B500, $B100
DATA_00EB97:         dw $AC00, $A700, $A200, $9D00
DATA_00EB9F:         dw $9800, $9300, $8E00, $8900
DATA_00EBA7:         dw $8400, $7E00, $7900, $7300
DATA_00EBAF:         dw $6D00, $6800, $6200, $5C00
DATA_00EBB7:         dw $5600, $5000, $4A00, $4400
DATA_00EBBF:         dw $3E00, $3800, $3200, $2C00
DATA_00EBC7:         dw $2600, $1F00, $1900, $1300
DATA_00EBCF:         dw $0D00, $0600

DATA_00EBD3:         db $00

; level 10 header
DATA_00EBD4:         db $A3, $5F, $20, $30, $8D, $50, $58, $C9
DATA_00EBDC:         db $01, $00

; level 10 object data
DATA_00EBDE:         db $48, $22, $D0, $2F, $02, $48, $24, $76
DATA_00EBE6:         db $09, $05, $48, $24, $1D, $02, $04, $48
DATA_00EBEE:         db $24, $69, $06, $00, $C6, $12, $6A, $FA
DATA_00EBF6:         db $C4, $23, $57, $04, $C4, $22, $4D, $04
DATA_00EBFE:         db $C6, $13, $6E, $06, $C6, $12, $6C, $05
DATA_00EC06:         db $C6, $13, $6C, $FC, $3C, $24, $4B, $01
DATA_00EC0E:         db $48, $12, $00, $01, $1C, $48, $14, $9C
DATA_00EC16:         db $03, $06, $48, $20, $00, $01, $0B, $48
DATA_00EC1E:         db $20, $C0, $0F, $03, $48, $20, $B7, $08
DATA_00EC26:         db $00, $48, $20, $A8, $07, $00, $A5, $20
DATA_00EC2E:         db $8A, $02, $48, $20, $3E, $01, $06, $48
DATA_00EC36:         db $20, $08, $07, $02, $A6, $14, $E8, $04
DATA_00EC3E:         db $48, $24, $04, $0B, $00, $48, $24, $90
DATA_00EC46:         db $06, $00, $48, $12, $02, $27, $00, $C6
DATA_00EC4E:         db $12, $F3, $04, $A7, $22, $B2, $23, $01
DATA_00EC56:         db $48, $14, $08, $07, $08, $00, $14, $E5
DATA_00EC5E:         db $50, $00, $24, $56, $A8, $00, $20, $A5
DATA_00EC66:         db $50, $15, $12, $62, $02, $3C, $12, $33
DATA_00EC6E:         db $FD, $41, $24, $69, $03, $41, $24, $76
DATA_00EC76:         db $02, $41, $24, $90, $06, $41, $24, $04
DATA_00EC7E:         db $09, $41, $20, $C2, $05, $41, $20, $B7
DATA_00EC86:         db $01, $41, $20, $A8, $05, $FF

; level 10 screen exit data
DATA_00EC8C:         db $20, $48, $02, $72, $04, $24, $48, $AA
DATA_00EC94:         db $73, $04, $14, $78, $00, $58, $06, $12
DATA_00EC9C:         db $D4, $03, $7B, $05, $FF

; level 48 header
DATA_00ECA1:         db $A3, $5F, $20, $30, $8D, $60, $59, $A9
DATA_00ECA9:         db $01, $00

; level 48 object data
DATA_00ECAB:         db $00, $00, $1E, $FD, $00, $01, $11, $FD
DATA_00ECB3:         db $00, $02, $1E, $FD, $00, $03, $11, $FD
DATA_00ECBB:         db $00, $04, $1E, $FD, $00, $05, $11, $FD
DATA_00ECC3:         db $00, $06, $1E, $FD, $00, $07, $11, $FD
DATA_00ECCB:         db $48, $70, $00, $09, $01, $48, $7A, $00
DATA_00ECD3:         db $0F, $01, $48, $70, $20, $01, $07, $48
DATA_00ECDB:         db $70, $A0, $0F, $05, $47, $71, $C0, $6F
DATA_00ECE3:         db $03, $47, $78, $C0, $21, $03, $A5, $70
DATA_00ECEB:         db $02, $03, $00, $74, $A3, $9A, $D2, $74
DATA_00ECF3:         db $A4, $01, $CE, $74, $87, $FF, $D2, $74
DATA_00ECFB:         db $88, $05, $CE, $74, $8E, $02, $D2, $75
DATA_00ED03:         db $B1, $03, $00, $75, $A5, $91, $D1, $75
DATA_00ED0B:         db $66, $03, $00, $75, $56, $8E, $D2, $75
DATA_00ED13:         db $57, $01, $00, $75, $59, $8F, $D1, $75
DATA_00ED1B:         db $6A, $03, $00, $75, $AA, $90, $D2, $75
DATA_00ED23:         db $BB, $01, $CE, $75, $9E, $FF, $CE, $75
DATA_00ED2B:         db $9F, $01, $D2, $76, $B1, $01, $CE, $76
DATA_00ED33:         db $67, $FC, $D2, $76, $68, $06, $00, $76
DATA_00ED3B:         db $6F, $8F, $00, $76, $7F, $91, $D2, $76
DATA_00ED43:         db $89, $05, $00, $76, $88, $8E, $00, $76
DATA_00ED4B:         db $98, $90, $D2, $76, $A9, $05, $D1, $76
DATA_00ED53:         db $AF, $00, $D2, $76, $BF, $05, $CE, $77
DATA_00ED5B:         db $96, $FF, $00, $78, $89, $9C, $D1, $78
DATA_00ED63:         db $99, $01, $00, $78, $8E, $9C, $00, $79
DATA_00ED6B:         db $83, $9C, $D1, $78, $9E, $01, $D1, $79
DATA_00ED73:         db $93, $01, $00, $79, $A6, $9A, $D2, $79
DATA_00ED7B:         db $A7, $03, $D1, $79, $AB, $00, $48, $7A
DATA_00ED83:         db $90, $0F, $06, $48, $7A, $2C, $03, $06
DATA_00ED8B:         db $A5, $7A, $1A, $03, $00, $73, $7F, $9C
DATA_00ED93:         db $D1, $73, $8F, $02, $00, $73, $BF, $9D
DATA_00ED9B:         db $C6, $71, $55, $FE, $68, $71, $5D, $00
DATA_00EDA3:         db $00, $C4, $71, $37, $04, $68, $72, $80
DATA_00EDAB:         db $02, $02, $C4, $72, $65, $06, $C4, $73
DATA_00EDB3:         db $55, $06, $68, $74, $39, $03, $00, $68
DATA_00EDBB:         db $75, $16, $03, $00, $C4, $75, $5D, $04
DATA_00EDC3:         db $C6, $76, $27, $FC, $C4, $76, $29, $06
DATA_00EDCB:         db $C4, $77, $48, $02, $C6, $77, $56, $FE
DATA_00EDD3:         db $00, $77, $8E, $50, $00, $78, $82, $50
DATA_00EDDB:         db $68, $78, $68, $01, $00, $68, $78, $6D
DATA_00EDE3:         db $01, $00, $68, $79, $63, $00, $00, $00
DATA_00EDEB:         db $72, $94, $9A, $D2, $72, $95, $06, $00
DATA_00EDF3:         db $72, $9C, $9B, $48, $72, $BF, $04, $04
DATA_00EDFB:         db $48, $77, $AB, $0B, $05, $68, $73, $7D
DATA_00EE03:         db $00, $00, $00, $73, $80, $50, $68, $73
DATA_00EE0B:         db $73, $00, $00, $C4, $72, $50, $02, $68
DATA_00EE13:         db $72, $74, $00, $00, $68, $71, $7E, $00
DATA_00EE1B:         db $00, $00, $7A, $72, $50, $00, $7A, $76
DATA_00EE23:         db $50, $41, $70, $A2, $0D, $41, $72, $AF
DATA_00EE2B:         db $04, $41, $77, $AB, $0B, $41, $7A, $90
DATA_00EE33:         db $0B, $FF

; level 48 screen exit data
DATA_00EE35:         db $70, $10, $0A, $28, $05, $7A, $10, $4B
DATA_00EE3D:         db $24, $05, $FF

; level 78 header
DATA_00EE40:         db $05, $AF, $6C, $B8, $0D, $50, $70, $08
DATA_00EE48:         db $79, $20

; level 78 object data
DATA_00EE4A:         db $AC, $50, $70, $08, $AB, $50, $77, $19
DATA_00EE52:         db $AC, $60, $F7, $18, $AD, $50, $90, $06
DATA_00EE5A:         db $AA, $50, $95, $19, $AD, $70, $15, $05
DATA_00EE62:         db $AA, $70, $19, $02, $B2, $70, $2A, $FB
DATA_00EE6A:         db $B3, $70, $1E, $F8, $B0, $70, $0A, $03
DATA_00EE72:         db $03, $AC, $70, $80, $04, $AD, $70, $A0
DATA_00EE7A:         db $05, $AD, $70, $1F, $02, $AD, $71, $14
DATA_00EE82:         db $0B, $AA, $71, $10, $09, $AB, $71, $14
DATA_00EE8A:         db $03, $AD, $71, $32, $03, $AB, $71, $32
DATA_00EE92:         db $05, $B0, $71, $01, $02, $02, $B1, $70
DATA_00EE9A:         db $2A, $01, $B1, $71, $21, $01, $B1, $71
DATA_00EEA2:         db $42, $00, $B1, $71, $71, $00, $AC, $71
DATA_00EEAA:         db $72, $03, $AD, $71, $90, $05, $B2, $71
DATA_00EEB2:         db $57, $FF, $B7, $71, $96, $01, $AC, $71
DATA_00EEBA:         db $58, $05, $AD, $71, $B8, $05, $BC, $71
DATA_00EEC2:         db $5E, $07, $B0, $71, $76, $07, $03, $00
DATA_00EECA:         db $50, $80, $6F, $00, $70, $90, $6F, $00
DATA_00EED2:         db $71, $0E, $70, $AC, $00, $60, $0C, $AD
DATA_00EEDA:         db $00, $80, $0C, $00, $00, $5D, $74, $AC
DATA_00EEE2:         db $00, $5E, $01, $AD, $00, $9E, $01, $AF
DATA_00EEEA:         db $00, $7E, $01, $D4, $00, $4F, $07, $D6
DATA_00EEF2:         db $00, $4F, $06, $D5, $01, $45, $07, $D7
DATA_00EEFA:         db $00, $BF, $06, $D3, $01, $50, $04, $05
DATA_00EF02:         db $00, $00, $70, $6F, $AA, $20, $98, $08
DATA_00EF0A:         db $AB, $20, $9A, $06, $AC, $20, $EA, $07
DATA_00EF12:         db $AD, $30, $08, $08, $AA, $21, $70, $08
DATA_00EF1A:         db $AB, $21, $C2, $03, $AC, $21, $70, $0D
DATA_00EF22:         db $AB, $21, $7C, $04, $AC, $21, $AC, $03
DATA_00EF2A:         db $B0, $21, $92, $09, $02, $AD, $21, $C2
DATA_00EF32:         db $0D, $B6, $21, $F3, $02, $B7, $31, $01
DATA_00EF3A:         db $05, $AC, $31, $26, $02, $AF, $31, $46
DATA_00EF42:         db $02, $AD, $31, $67, $01, $AA, $30, $0A
DATA_00EF4A:         db $06, $AB, $30, $0E, $06, $AE, $30, $0C
DATA_00EF52:         db $06, $D4, $20, $21, $07, $D6, $20, $21
DATA_00EF5A:         db $0B, $D5, $20, $2C, $07, $D7, $20, $91
DATA_00EF62:         db $0B, $D3, $20, $32, $09, $05, $B1, $20
DATA_00EF6A:         db $B9, $00, $B1, $20, $E9, $00, $D4, $30
DATA_00EF72:         db $64, $04, $D6, $30, $64, $0C, $D5, $31
DATA_00EF7A:         db $60, $04, $D7, $30, $A4, $0C, $D3, $30
DATA_00EF82:         db $75, $0A, $02, $00, $21, $BE, $70, $D4
DATA_00EF8A:         db $21, $F8, $09, $D6, $21, $F8, $06, $D5
DATA_00EF92:         db $21, $FE, $09, $D7, $31, $88, $06, $D3
DATA_00EF9A:         db $31, $09, $04, $07, $B1, $30, $1B, $00
DATA_00EFA2:         db $B1, $30, $1E, $00, $B1, $30, $2C, $01
DATA_00EFAA:         db $B1, $30, $5C, $01, $B1, $30, $8C, $01
DATA_00EFB2:         db $00, $31, $02, $7F, $B1, $21, $F2, $00
DATA_00EFBA:         db $D6, $33, $11, $0D, $D5, $33, $1E, $0B
DATA_00EFC2:         db $D7, $33, $C1, $0D, $D4, $33, $11, $0B
DATA_00EFCA:         db $D3, $33, $22, $0B, $09, $FF

; level 78 screen exit data
DATA_00EFD0:         db $50, $10, $49, $1E, $03, $70, $A1, $78
DATA_00EFD8:         db $0A, $03, $71, $A1, $02, $29, $02, $00
DATA_00EFE0:         db $A1, $2D, $29, $03, $01, $78, $06, $38
DATA_00EFE8:         db $00, $30, $78, $12, $09, $00, $21, $A1
DATA_00EFF0:         db $04, $78, $02, $31, $78, $33, $3A, $00
DATA_00EFF8:         db $33, $78, $1B, $36, $00, $FF

; level A1 header
DATA_00EFFE:         db $03, $5C, $C3, $00, $05, $50, $28, $03
DATA_00F006:         db $01, $40

; level A1 object data
DATA_00F008:         db $00, $0D, $11, $FD, $00, $0E, $11, $FD
DATA_00F010:         db $00, $0F, $11, $FD, $48, $00, $00, $7F
DATA_00F018:         db $01, $44, $00, $42, $14, $08, $45, $01
DATA_00F020:         db $77, $03, $05, $48, $00, $20, $03, $01
DATA_00F028:         db $CD, $01, $77, $03, $FD, $48, $00, $40
DATA_00F030:         db $01, $04, $48, $00, $90, $06, $02, $48
DATA_00F038:         db $00, $C0, $12, $00, $48, $01, $A8, $03
DATA_00F040:         db $02, $48, $00, $D0, $1B, $02, $43, $00
DATA_00F048:         db $24, $01, $48, $01, $28, $03, $01, $43
DATA_00F050:         db $01, $29, $01, $8C, $00, $25, $13, $4E
DATA_00F058:         db $01, $BE, $04, $00, $48, $02, $A5, $16
DATA_00F060:         db $05, $48, $02, $68, $00, $01, $4E, $02
DATA_00F068:         db $79, $05, $00, $48, $02, $4F, $00, $03
DATA_00F070:         db $48, $03, $8B, $00, $01, $4E, $03, $8C
DATA_00F078:         db $02, $00, $4E, $03, $BC, $02, $00, $48
DATA_00F080:         db $03, $8F, $00, $02, $48, $03, $BF, $02
DATA_00F088:         db $04, $48, $04, $B5, $06, $04, $48, $04
DATA_00F090:         db $BF, $02, $04, $46, $07, $82, $03, $00
DATA_00F098:         db $CD, $07, $95, $04, $FC, $CD, $07, $C2
DATA_00F0A0:         db $03, $FD, $46, $06, $CE, $03, $00, $48
DATA_00F0A8:         db $05, $B5, $09, $01, $48, $06, $C1, $1E
DATA_00F0B0:         db $03, $48, $07, $6A, $05, $05, $53, $00
DATA_00F0B8:         db $96, $0C, $A6, $07, $A7, $03, $48, $07
DATA_00F0C0:         db $22, $0D, $03, $43, $01, $2C, $01, $8C
DATA_00F0C8:         db $01, $2D, $17, $43, $03, $25, $01, $48
DATA_00F0D0:         db $03, $26, $01, $01, $43, $03, $28, $01
DATA_00F0D8:         db $8C, $03, $29, $1B, $43, $05, $25, $03
DATA_00F0E0:         db $69, $05, $26, $05, $03, $48, $05, $26
DATA_00F0E8:         db $05, $00, $43, $05, $2C, $03, $8C, $05
DATA_00F0F0:         db $2D, $13, $43, $07, $21, $01, $C4, $06
DATA_00F0F8:         db $64, $04, $C4, $04, $6A, $02, $C4, $02
DATA_00F100:         db $5A, $0A, $68, $01, $AE, $01, $00, $68
DATA_00F108:         db $02, $A1, $01, $00, $48, $20, $00, $2F
DATA_00F110:         db $01, $48, $20, $20, $01, $09, $A6, $20
DATA_00F118:         db $91, $02, $A6, $22, $9C, $02, $48, $22
DATA_00F120:         db $2E, $01, $09, $48, $22, $B8, $07, $00
DATA_00F128:         db $6C, $21, $26, $02, $00, $6C, $21, $B3
DATA_00F130:         db $08, $00, $48, $20, $B2, $05, $00, $48
DATA_00F138:         db $20, $C0, $2F, $03, $F4, $20, $A8, $05
DATA_00F140:         db $F4, $22, $A6, $05, $48, $74, $00, $04
DATA_00F148:         db $05, $48, $70, $00, $41, $01, $48, $70
DATA_00F150:         db $20, $02, $09, $48, $70, $A0, $09, $01
DATA_00F158:         db $48, $71, $B1, $01, $00, $48, $70, $C0
DATA_00F160:         db $17, $03, $48, $72, $C1, $09, $03, $A6
DATA_00F168:         db $70, $82, $03, $F4, $70, $BA, $04, $00
DATA_00F170:         db $72, $85, $C4, $48, $73, $A3, $01, $02
DATA_00F178:         db $CB, $73, $A8, $01, $02, $46, $73, $A9
DATA_00F180:         db $03, $02, $CB, $73, $9E, $01, $00, $45
DATA_00F188:         db $73, $7D, $02, $01, $44, $73, $9D, $01
DATA_00F190:         db $03, $48, $73, $AE, $01, $02, $48, $73
DATA_00F198:         db $A7, $04, $00, $46, $74, $D5, $09, $00
DATA_00F1A0:         db $48, $73, $D3, $1C, $02, $46, $54, $78
DATA_00F1A8:         db $02, $00, $CB, $54, $78, $04, $02, $CD
DATA_00F1B0:         db $54, $CB, $02, $FC, $45, $54, $5B, $02
DATA_00F1B8:         db $02, $48, $54, $00, $0F, $01, $48, $54
DATA_00F1C0:         db $20, $07, $02, $48, $54, $28, $00, $02
DATA_00F1C8:         db $48, $54, $50, $01, $1A, $48, $54, $2E
DATA_00F1D0:         db $01, $2A, $48, $63, $02, $0F, $0F, $CC
DATA_00F1D8:         db $54, $CA, $FE, $FE, $48, $54, $CA, $05
DATA_00F1E0:         db $05, $53, $54, $89, $05, $A7, $54, $52
DATA_00F1E8:         db $00, $02, $A7, $54, $D9, $00, $04, $A7
DATA_00F1F0:         db $64, $4D, $00, $07, $A7, $64, $82, $00
DATA_00F1F8:         db $06, $A7, $64, $F2, $02, $00, $A7, $74
DATA_00F200:         db $64, $01, $00, $A7, $74, $45, $00, $01
DATA_00F208:         db $00, $63, $EE, $FE, $53, $73, $AB, $03
DATA_00F210:         db $C6, $54, $B7, $FC, $C6, $64, $B8, $04
DATA_00F218:         db $C6, $74, $4A, $FE, $F4, $06, $BB, $04
DATA_00F220:         db $00, $74, $92, $C4, $41, $70, $A3, $06
DATA_00F228:         db $41, $70, $CC, $0B, $41, $71, $B1, $01
DATA_00F230:         db $41, $72, $C1, $09, $41, $73, $A3, $01
DATA_00F238:         db $41, $73, $A7, $04, $41, $73, $D5, $08
DATA_00F240:         db $41, $73, $AE, $01, $41, $74, $D0, $0D
DATA_00F248:         db $41, $54, $C8, $03, $41, $20, $B2, $05
DATA_00F250:         db $41, $20, $CA, $1B, $41, $22, $B8, $05
DATA_00F258:         db $41, $00, $92, $04, $41, $01, $A8, $03
DATA_00F260:         db $41, $02, $A5, $15, $41, $04, $B0, $01
DATA_00F268:         db $41, $04, $B5, $06, $41, $04, $BF, $02
DATA_00F270:         db $41, $05, $B5, $09, $41, $06, $C1, $09
DATA_00F278:         db $41, $06, $CD, $0C, $A7, $54, $2B, $00
DATA_00F280:         db $00, $F4, $54, $CC, $01, $69, $64, $29
DATA_00F288:         db $04, $03, $69, $54, $12, $05, $03, $6C
DATA_00F290:         db $05, $4C, $00, $01, $6C, $05, $45, $00
DATA_00F298:         db $01, $48, $64, $28, $00, $03, $48, $64
DATA_00F2A0:         db $29, $06, $00, $68, $64, $55, $00, $00
DATA_00F2A8:         db $FF

; level A1 screen exit data
DATA_00F2A9:         db $07, $78, $00, $79, $06, $20, $78, $1F
DATA_00F2B1:         db $70, $07, $22, $78, $00, $07, $06, $70
DATA_00F2B9:         db $78, $1F, $2B, $07, $54, $BE, $18, $4A
DATA_00F2C1:         db $00, $FF

; level BE header
DATA_00F2C3:         db $10, $DB, $0C, $15, $8E, $B0, $08, $C0
DATA_00F2CB:         db $19, $60

; level BE object data
DATA_00F2CD:         db $00, $00, $1E, $FD, $00, $01, $11, $FD
DATA_00F2D5:         db $00, $02, $11, $FD, $01, $21, $60, $04
DATA_00F2DD:         db $29, $01, $41, $C5, $14, $03, $03, $21
DATA_00F2E5:         db $65, $26, $02, $22, $69, $26, $01, $22
DATA_00F2ED:         db $6A, $05, $29, $02, $31, $6B, $12, $01
DATA_00F2F5:         db $31, $6C, $06, $12, $03, $32, $63, $12
DATA_00F2FD:         db $58, $41, $8B, $08, $00, $14, $31, $51
DATA_00F305:         db $04, $07, $14, $31, $C1, $03, $04, $14
DATA_00F30D:         db $41, $01, $04, $09, $14, $41, $93, $02
DATA_00F315:         db $02, $67, $31, $81, $00, $01, $57, $31
DATA_00F31D:         db $E1, $02, $57, $41, $13, $01, $57, $41
DATA_00F325:         db $71, $01, $57, $41, $83, $01, $63, $31
DATA_00F32D:         db $86, $01, $63, $31, $B8, $01, $63, $31
DATA_00F335:         db $F7, $01, $63, $41, $28, $01, $63, $41
DATA_00F33D:         db $56, $01, $14, $31, $8B, $02, $0E, $14
DATA_00F345:         db $32, $81, $02, $02, $14, $31, $AD, $06
DATA_00F34D:         db $0D, $67, $31, $FE, $03, $00, $67, $42
DATA_00F355:         db $70, $01, $00, $57, $31, $CC, $01, $57
DATA_00F35D:         db $32, $D1, $01, $57, $41, $0C, $01, $57
DATA_00F365:         db $41, $3C, $02, $57, $42, $41, $01, $63
DATA_00F36D:         db $32, $85, $01, $63, $32, $C6, $01, $63
DATA_00F375:         db $32, $F5, $01, $63, $42, $24, $01, $63
DATA_00F37D:         db $42, $47, $01, $63, $42, $75, $01, $63
DATA_00F385:         db $42, $A6, $01, $14, $32, $49, $04, $05
DATA_00F38D:         db $14, $32, $9C, $02, $03, $14, $32, $C9
DATA_00F395:         db $05, $05, $14, $42, $1B, $03, $04, $14
DATA_00F39D:         db $42, $9A, $02, $02, $14, $42, $5A, $04
DATA_00F3A5:         db $04, $57, $32, $7A, $01, $57, $32, $DD
DATA_00F3AD:         db $01, $57, $32, $FA, $02, $57, $42, $2C
DATA_00F3B5:         db $02, $57, $42, $6C, $02, $14, $42, $59
DATA_00F3BD:         db $01, $06, $57, $42, $8A, $02, $67, $32
DATA_00F3C5:         db $5E, $00, $03, $57, $32, $8C, $01, $57
DATA_00F3CD:         db $41, $42, $01, $63, $41, $79, $01, $C6
DATA_00F3D5:         db $31, $8A, $FC, $C6, $41, $2A, $FC, $C6
DATA_00F3DD:         db $32, $84, $04, $C6, $42, $28, $FC, $C4
DATA_00F3E5:         db $42, $87, $00, $57, $31, $B3, $01, $02
DATA_00F3ED:         db $21, $CD, $05, $01, $21, $CE, $02, $05
DATA_00F3F5:         db $03, $22, $C1, $05, $58, $31, $1D, $04
DATA_00F3FD:         db $00, $14, $21, $EE, $02, $03, $FF

; level BE screen exit data
DATA_00F404:         db $42, $C8, $03, $38, $00, $FF

; level C8 header
DATA_00F40A:         db $A3, $5F, $20, $30, $8D, $50, $58, $00
DATA_00F412:         db $01, $40

; level C8 object data
DATA_00F414:         db $46, $30, $7F, $05, $00, $44, $31, $25
DATA_00F41C:         db $08, $04, $45, $31, $2E, $05, $04, $44
DATA_00F424:         db $30, $26, $02, $04, $CD, $30, $79, $05
DATA_00F42C:         db $FB, $CB, $30, $71, $08, $03, $CC, $32
DATA_00F434:         db $78, $FB, $FB, $44, $32, $29, $04, $04
DATA_00F43C:         db $CB, $32, $78, $06, $03, $48, $30, $00
DATA_00F444:         db $2F, $01, $48, $30, $20, $05, $04, $48
DATA_00F44C:         db $30, $70, $01, $03, $41, $30, $A2, $05
DATA_00F454:         db $48, $30, $B0, $09, $04, $41, $32, $B4
DATA_00F45C:         db $09, $48, $32, $97, $01, $06, $48, $32
DATA_00F464:         db $2E, $01, $09, $CB, $30, $7F, $14, $03
DATA_00F46C:         db $48, $31, $84, $02, $02, $41, $30, $BA
DATA_00F474:         db $04, $41, $31, $74, $02, $44, $30, $BF
DATA_00F47C:         db $04, $02, $48, $30, $BF, $00, $02, $48
DATA_00F484:         db $31, $B3, $00, $02, $48, $30, $EF, $04
DATA_00F48C:         db $01, $48, $31, $B4, $02, $00, $44, $31
DATA_00F494:         db $B7, $04, $02, $48, $31, $B7, $00, $02
DATA_00F49C:         db $48, $31, $BB, $00, $02, $48, $31, $E7
DATA_00F4A4:         db $04, $01, $41, $31, $BC, $02, $44, $31
DATA_00F4AC:         db $BF, $04, $02, $48, $31, $BF, $00, $02
DATA_00F4B4:         db $48, $32, $B3, $00, $02, $48, $31, $EF
DATA_00F4BC:         db $04, $01, $53, $30, $BF, $04, $53, $31
DATA_00F4C4:         db $B7, $04, $53, $31, $BF, $04, $53, $31
DATA_00F4CC:         db $5B, $04, $48, $31, $28, $03, $01, $48
DATA_00F4D4:         db $31, $4A, $01, $01, $49, $30, $37, $02
DATA_00F4DC:         db $49, $32, $3A, $02, $49, $31, $52, $02
DATA_00F4E4:         db $49, $31, $5F, $02, $FF

; level C8 screen exit data
DATA_00F4E9:         db $32, $CF, $04, $4D, $00, $FF

; level CF header
DATA_00F4EF:         db $03, $5E, $C0, $4A, $FD, $70, $60, $8F
DATA_00F4F7:         db $64, $00

; level CF object data
DATA_00F4F9:         db $48, $40, $00, $01, $1F, $48, $41, $06
DATA_00F501:         db $09, $1F, $48, $50, $C4, $0F, $00, $FF
DATA_00F509:         db $FF

; level D4 header
DATA_00F50A:         db $A3, $5F, $20, $30, $8D, $20, $58, $C9
DATA_00F512:         db $05, $E0

; level D4 object data
DATA_00F514:         db $48, $72, $2A, $05, $0A, $48, $70, $D0
DATA_00F51C:         db $2F, $02, $A5, $70, $B3, $02, $CB, $72
DATA_00F524:         db $26, $01, $01, $CB, $72, $57, $01, $07
DATA_00F52C:         db $44, $71, $5F, $07, $01, $44, $72, $27
DATA_00F534:         db $02, $04, $44, $72, $78, $01, $05, $CB
DATA_00F53C:         db $71, $8E, $01, $04, $CB, $70, $26, $0C
DATA_00F544:         db $01, $44, $70, $47, $17, $08, $CC, $70
DATA_00F54C:         db $96, $FC, $F9, $48, $70, $86, $03, $00
DATA_00F554:         db $48, $70, $96, $01, $03, $48, $70, $6C
DATA_00F55C:         db $00, $02, $53, $70, $89, $03, $48, $70
DATA_00F564:         db $5C, $04, $00, $48, $70, $4F, $17, $00
DATA_00F56C:         db $48, $71, $7E, $09, $00, $48, $71, $AE
DATA_00F574:         db $09, $00, $53, $72, $46, $04, $53, $71
DATA_00F57C:         db $AB, $03, $53, $70, $53, $03, $00, $70
DATA_00F584:         db $8B, $32, $50, $70, $9B, $01, $00, $70
DATA_00F58C:         db $BB, $35, $51, $70, $BC, $0F, $52, $71
DATA_00F594:         db $67, $FC, $04, $00, $71, $B3, $37, $51
DATA_00F59C:         db $71, $68, $0F, $00, $72, $68, $34, $50
DATA_00F5A4:         db $72, $58, $00, $00, $72, $48, $32, $00
DATA_00F5AC:         db $71, $BC, $34, $00, $71, $AC, $32, $00
DATA_00F5B4:         db $71, $B9, $3A, $50, $71, $C9, $00, $48
DATA_00F5BC:         db $70, $20, $01, $0A, $48, $70, $00, $2F
DATA_00F5C4:         db $01, $C4, $72, $80, $06, $C4, $72, $90
DATA_00F5CC:         db $06, $C4, $72, $B0, $06, $C4, $72, $C0
DATA_00F5D4:         db $06, $C4, $71, $23, $12, $C4, $71, $33
DATA_00F5DC:         db $12, $00, $70, $48, $3F, $00, $70, $59
DATA_00F5E4:         db $40, $00, $71, $72, $3F, $00, $70, $AF
DATA_00F5EC:         db $3C, $00, $71, $A8, $43, $00, $71, $A9
DATA_00F5F4:         db $44, $00, $70, $8E, $3F, $00, $71, $98
DATA_00F5FC:         db $41, $00, $71, $99, $42, $00, $71, $96
DATA_00F604:         db $45, $00, $71, $8A, $3F, $00, $72, $37
DATA_00F60C:         db $3F, $FF

; level D4 screen exit data
DATA_00F60E:         db $70, $10, $23, $12, $04, $FF

; level 10 sprite data
DATA_00F614:         db $1E, $4F, $42, $65, $34, $32, $65, $34
DATA_00F61C:         db $34, $65, $34, $36, $1E, $31, $26, $FF
DATA_00F624:         db $FF

; level 48 sprite data
DATA_00F625:         db $8A, $F2, $13, $80, $F8, $16, $1B, $F6
DATA_00F62D:         db $18, $1B, $F6, $20, $1B, $F6, $22, $81
DATA_00F635:         db $F8, $4A, $80, $F8, $38, $1B, $F6, $36
DATA_00F63D:         db $8A, $F5, $3F, $8A, $F3, $44, $89, $F3
DATA_00F645:         db $89, $8A, $F3, $97, $4F, $EA, $9D, $65
DATA_00F64D:         db $EC, $92, $FA, $F0, $6C, $8B, $F3, $93
DATA_00F655:         db $89, $F3, $8E, $1B, $F6, $1A, $8A, $F2
DATA_00F65D:         db $1D, $1B, $F6, $3A, $8A, $F1, $26, $65
DATA_00F665:         db $F2, $18, $65, $F2, $1A, $65, $F2, $36
DATA_00F66D:         db $65, $F2, $38, $65, $F2, $3A, $8D, $E2
DATA_00F675:         db $23, $FF, $FF

; level 78 sprite data
DATA_00F678:         db $65, $EE, $1A, $31, $13, $12, $93, $72
DATA_00F680:         db $06, $4F, $4A, $04, $65, $52, $15, $65
DATA_00F688:         db $52, $18, $AF, $53, $19, $AF, $53, $14
DATA_00F690:         db $AF, $53, $16, $AF, $53, $17, $AF, $EF
DATA_00F698:         db $18, $AF, $EF, $19, $AF, $EF, $1B, $AF
DATA_00F6A0:         db $EF, $1C, $B5, $62, $1B, $93, $76, $33
DATA_00F6A8:         db $93, $6E, $1B, $E7, $76, $3A, $61, $6B
DATA_00F6B0:         db $38, $FF, $FF

; level A1 sprite data
DATA_00F6B3:         db $05, $07, $17, $06, $07, $1E, $06, $07
DATA_00F6BB:         db $34, $05, $07, $39, $05, $07, $53, $06
DATA_00F6C3:         db $07, $5E, $06, $07, $70, $99, $0D, $58
DATA_00F6CB:         db $99, $0B, $46, $FA, $14, $3D, $DA, $10
DATA_00F6D3:         db $06, $65, $14, $20, $C0, $0C, $6A, $C1
DATA_00F6DB:         db $0C, $14, $05, $07, $05, $8A, $F8, $1C
DATA_00F6E3:         db $26, $E5, $16, $1E, $F6, $0A, $1E, $54
DATA_00F6EB:         db $08, $1E, $54, $26, $26, $47, $17, $8A
DATA_00F6F3:         db $F4, $2F, $26, $E5, $35, $1E, $F7, $49
DATA_00F6FB:         db $FA, $F8, $3B, $C2, $A4, $4B, $65, $C4
DATA_00F703:         db $43, $65, $D2, $46, $65, $E4, $4C, $1E
DATA_00F70B:         db $16, $6B, $BE, $DE, $44, $BE, $CE, $4D
DATA_00F713:         db $AD, $EC, $3E, $AD, $50, $0F, $1E, $B8
DATA_00F71B:         db $4C, $FF, $FF

; level BE sprite data
DATA_00F71E:         db $20, $8C, $12, $20, $7A, $12, $20, $7C
DATA_00F726:         db $20, $20, $8E, $1F, $20, $92, $27, $20
DATA_00F72E:         db $72, $2B, $31, $89, $2D, $01, $96, $18
DATA_00F736:         db $DA, $74, $14, $DA, $86, $21, $DA, $8E
DATA_00F73E:         db $2B, $65, $7C, $17, $65, $80, $19, $65
DATA_00F746:         db $7C, $27, $65, $80, $25, $4F, $66, $1F
DATA_00F74E:         db $FF, $FF

; level C8 sprite data
DATA_00F750:         db $01, $72, $03, $12, $74, $2B, $DA, $6C
DATA_00F758:         db $15, $DA, $7A, $11, $DA, $7A, $19, $DA
DATA_00F760:         db $7A, $21, $DA, $68, $1D, $6A, $6E, $0B
DATA_00F768:         db $6A, $6E, $0C, $6A, $6E, $0D, $4F, $6A
DATA_00F770:         db $10, $FF, $FF

; level CF sprite data
DATA_00F773:         db $34, $B6, $0B, $48, $98, $03, $FF, $FF

; level D4 sprite data
DATA_00F77B:         db $B2, $E4, $0A, $72, $EE, $10, $72, $F2
DATA_00F783:         db $11, $25, $E8, $04, $25, $E6, $04, $FA
DATA_00F78B:         db $EC, $23, $AF, $ED, $21, $AF, $ED, $25
DATA_00F793:         db $AF, $ED, $27, $AF, $ED, $1F, $98, $E8
DATA_00F79B:         db $28, $44, $E7, $0D, $D6, $EB, $2C, $97
DATA_00F7A3:         db $EF, $0B, $FF, $FF

; freespace
DATA_00F7A7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7AF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7B7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7BF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7C7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7CF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7D7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7DF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7E7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7EF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7F7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F7FF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F807:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F80F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F817:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F81F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F827:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F82F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F837:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F83F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F847:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F84F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F857:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F85F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F867:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F86F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F877:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F87F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F887:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F88F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F897:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F89F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8A7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8AF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8B7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8BF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8C7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8CF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8D7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8DF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8E7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8EF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8F7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F8FF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F907:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F90F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F917:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F91F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F927:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F92F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F937:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F93F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F947:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F94F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F957:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F95F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F967:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F96F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F977:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F97F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F987:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F98F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F997:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F99F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9A7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9AF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9B7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9BF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9C7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9CF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9D7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9DF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9E7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9EF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9F7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00F9FF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FA9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FABF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FACF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FADF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FAFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FB9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FBFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FC9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FCFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FD9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FDFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FE9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FECF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FED7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FEFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FF9F:         db $FF

.buildtime
DATA_00FFA0:         db $95, $07, $31 		; build date (July 31st, 1995)
DATA_00FFA3:         db $11, $19 		; build time (11:19 am)

; freespace, 11 bytes
DATA_00FFA5:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_00FFAD:         db $FF, $FF, $FF

.ROMRegistration
db $30,$31					    ;
db $59,$49,$20,$20				    ; "YI  "
db $00,$00,$00,$00,$00,$00,$00			    ;
db $05						    ; 32KB RAM allotted to Super FX
db $00						    ; Not a special version
db $00						    ;

.ROMSpecs
db $59,$4F,$53,$48,$49,$27,$53,$20		    ; "YOSHI'S "
db $49,$53,$4C,$41,$4E,$44,$20,$20		    ; "ISLAND  "
db $20,$20,$20,$20,$20				    ; "     "
db $20						    ; LoROM
db $15						    ; ROM + SuperFX + RAM + SRAM
db $0B						    ; 2MB ROM
db $00						    ; 2KB SRAM
db $01						    ; NTSC
db $33						    ; Extended header
db $00						    ; Version 1.0
dw $ECD3					    ; Checksum complement
dw $132C					    ; Checksum
dw $814F,$814F  				    ;
dw $814F					    ; Native COP vector (unused)
dw $814F					    ; Native BRK vector (unused)
dw $814F					    ; Native ABORT vector (unused)
dw $0108					    ; Native NMI vector (v-blank)
dw $814F					    ; Native RESET vector (unused)
dw $010C					    ; Native IRQ vector
dw $814F,$814F  				    ;
dw $814F					    ; Emulation COP vector (unused)
dw $814F					    ; Emulation BRK vector (unused)
dw $814F					    ; Emulation ABORT vector (unused)
dw $814F					    ; Emulation NMI vector (unused)
dw $8000					    ; Emulation RESET vector (start game)
dw $814F					    ; Emulation IRQ and BRK vector (unused)
