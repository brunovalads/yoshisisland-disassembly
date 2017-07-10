lorom

org $008000

arch 65816

  SEI                                       ; $008000 |  Disable IRQ
  REP #$09                                  ; $008001 |\ Disable emulation mode
  XCE                                       ; $008003 |/
  SEP #$30                                  ; $008004 |
  LDA #$00                                  ; $008006 |
  PHA                                       ; $008008 |\ set ROM bank
  PLB                                       ; $008009 |/
  PHA                                       ; $00800A |\
  PHA                                       ; $00800B | | init direct page
  PLD                                       ; $00800C |/
  STZ !reg_nmitimen                         ; $00800D |  Disable IRQ, NMI and auto-joypad reading
  STZ !reg_joyser0                          ; $008010 |  disable joypad port
  LDA #$8F                                  ; $008013 |\ Enable F-blank
  STA !reg_inidisp                          ; $008015 |/
  LDA #$01                                  ; $008018 |\ Enable Backup RAM
  STA !gsu_bramr                            ; $00801A |/
  STZ !reg_mosaic                           ; $00801D |  set pixel size to 1x1
  STZ !reg_apu_port0                        ; $008020 |\
  STZ !reg_apu_port1                        ; $008023 | | Clear SPC I/O ports
  STZ !reg_apu_port2                        ; $008026 | |
  STZ !reg_apu_port3                        ; $008029 |/
  LDA #$FF                                  ; $00802C |\ Latch H/V counters in I/O port
  STA !reg_wrio                             ; $00802E |/
  STZ !reg_htimel                           ; $008031 |\ init H Timer
  STZ !reg_htimeh                           ; $008034 |/
  STZ !reg_vtimel                           ; $008037 |\ init V Timer
  STZ !reg_vtimeh                           ; $00803A |/
  STZ !reg_mdmaen                           ; $00803D |\ init DMA and HDMA enables
  STZ !reg_hdmaen                           ; $008040 |/
  STZ !reg_memsel                           ; $008043 |  SlowROM
  REP #$20                                  ; $008046 |
  LDA #$8000                                ; $008048 |\ Set up OAM
  STA !reg_oamaddl                          ; $00804B |/
  LDA #$01FF                                ; $00804E |\ Set up the stack
  TCS                                       ; $008051 |/
  SEP #$20                                  ; $008052 |
  JSL $0082D0                               ; $008054 |  init RAM and SRAM
  LDX #$10                                  ; $008058 |\ Upload SPC engine
  JSL set_level_music                       ; $00805A |/
  REP #$20                                  ; $00805E |
  LDX #$0F                                  ; $008060 |\

CODE_008062:
  LDA $813F,x                               ; $008062 | |
  STA $0100,x                               ; $008065 | | copy $008140~$00814E to $0101~$010F
  DEX                                       ; $008068 | |
  DEX                                       ; $008069 | |
  BPL CODE_008062                           ; $00806A |/
  LDA #$C000                                ; $00806C |\
  STA $20                                   ; $00806F | |
  LDY #$7E                                  ; $008071 | |
  STY $22                                   ; $008073 | |
  LDA #$C000                                ; $008075 | | DMA $00C000~$00FFFF to $7EC000~$7EFFFF
  STA $23                                   ; $008078 | |
  LDY #$00                                  ; $00807A | |
  STY $25                                   ; $00807C | |
  LDA #$4000                                ; $00807E | |
  JSL dma_wram_gen_purpose                  ; $008081 |/

; init GSU stuff, kinda
; sets up clock speed and initializes the RAMBR
  SEP #$20                                  ; $008085 |
  REP #$10                                  ; $008087 |
  LDX #$0046                                ; $008089 |\

CODE_00808C:
  STZ $0118,x                               ; $00808C | | init $0118~$015E
  DEX                                       ; $00808F | |
  BPL CODE_00808C                           ; $008090 |/
  SEP #$10                                  ; $008092 |
  LDA #$01                                  ; $008094 |\ Sets GSU clock speed
  STA !gsu_clsr                             ; $008096 |/ 00 = 10.7MHz, 01 = 21.4MHz
  LDA #$A0                                  ; $008099 |\ mask GSU interrupts and set multiplier frequency to high-speed
  STA !gsu_cfgr                             ; $00809B |/
  LDA #$16                                  ; $00809E |\ set SCBR to #$16
  STA $012D                                 ; $0080A0 |/
  LDA #$3D                                  ; $0080A3 |\ set screen mode to OBJ array, 16-color gradient mode
  STA $012E                                 ; $0080A5 |/ and give GSU ROM/RAM bus access
  REP #$20                                  ; $0080A8 |
  STZ $012B                                 ; $0080AA |
  STZ !r_last_world_unlocked                ; $0080AD |
  LDX #$08                                  ; $0080B0 |\
  LDA #$A97B                                ; $0080B2 | | initialize RAMBR to #$0000
  JSL r_gsu_init_1                          ; $0080B5 |/ GSU init
  SEP #$20                                  ; $0080B9 |
  LDA $707E7D                               ; $0080BB |\
  BNE CODE_0080C9                           ; $0080BF | |
  LDA $707E7C                               ; $0080C1 | |
  CMP #$03                                  ; $0080C5 | |
  BCC CODE_0080F0                           ; $0080C7 | |

CODE_0080C9:
  REP #$20                                  ; $0080C9 | |
  LDA #$0000                                ; $0080CB | | check checksum and nuke it if it's corrupted
  STA $707E7C                               ; $0080CE | |
  STA $707E70                               ; $0080D2 | |
  STA $707E72                               ; $0080D6 | |
  STA $707E74                               ; $0080DA | |
  STA $707E76                               ; $0080DE | |
  STA $707E78                               ; $0080E2 | |
  STA $707E7A                               ; $0080E6 |/
  JSL $108000                               ; $0080EA |  generate new checksum
  SEP #$20                                  ; $0080EE |

CODE_0080F0:
  CLI                                       ; $0080F0 |  enable interrupts

GameLoop:
  LDA !r_game_loop_complete                 ; $0080F1 |\ Wait for interrupt
  BMI GameLoop                              ; $0080F4 |/
  BRA CODE_008130                           ; $0080F6 | Branching past debug code
; debug code
; enables controller 2 to advance frame by frame
  LDA !r_joy2_hi_press                      ; $0080F8 |
  AND #$10                                  ; $0080FB |
  BEQ CODE_008107                           ; $0080FD |
  LDA $012F                                 ; $0080FF |
  EOR #$01                                  ; $008102 |
  STA $012F                                 ; $008104 |

CODE_008107:
  LDA $012F                                 ; $008107 |
  BEQ CODE_008130                           ; $00810A |
  LDY #$20                                  ; $00810C |
  LDA !r_joy2_lo_press                      ; $00810E |\ R-button on press
  AND #$10                                  ; $008111 |/ Controller 2
  BNE CODE_00812D                           ; $008113 |
  LDA !r_joy2_lo                            ; $008115 |
  AND #$30                                  ; $008118 |
  BNE CODE_008121                           ; $00811A |
  STZ $0130                                 ; $00811C |
  BRA CODE_00813A                           ; $00811F |

CODE_008121:
  LDA $0130                                 ; $008121 |
  BEQ CODE_00812B                           ; $008124 |
  DEC $0130                                 ; $008126 |
  BRA CODE_00813A                           ; $008129 |

CODE_00812B:
  LDY #$04                                  ; $00812B |

CODE_00812D:
  STY $0130                                 ; $00812D |
; END DEBUG CODE

CODE_008130:
  REP #$20                                  ; $008130 |\
  INC !r_frame_counter_global_dp            ; $008132 | | Frame beginning
  SEP #$20                                  ; $008134 | |
  JSL $008150                               ; $008136 |/ execute game mode code

CODE_00813A:
  DEC !r_game_loop_complete                 ; $00813A |\ end and begin new frame
  BRA GameLoop                              ; $00813D |/
  RTI                                       ; $00813F |

; this is data copied to RAM to be executed as code later
; copied to $0101~$010F
  NOP                                       ; $008140 |\
  NOP                                       ; $008141 | |
  NOP                                       ; $008142 | |
  RTI                                       ; $008143 | | db $EA,$EA,$EA,$40,$EA,$EA,$EA,$5C
  NOP                                       ; $008144 | | db $00,$C0,$7E,$5C,$E8,$C3,$7E
  NOP                                       ; $008145 | |
  NOP                                       ; $008146 | |
  JML $7EC000                               ; $008147 | | jump to NMI
  JML $7EC3E8                               ; $00814B |/ jump to IRQ
  RTI                                       ; $00814F |
  LDA !r_game_mode                          ; $008150 |\ get game mode pointer
  ASL A                                     ; $008153 | |
  ADC !r_game_mode                          ; $008154 | |
  TAX                                       ; $008157 | |
  PHB                                       ; $008158 | |
  LDA $816C,x                               ; $008159 | |\
  PHA                                       ; $00815C | | | set pointer bank
  PHA                                       ; $00815D | | |
  PLB                                       ; $00815E | |/
  LDA $00816B,x                             ; $00815F | |\
  PHA                                       ; $008163 | | | set pointer address
  LDA $00816A,x                             ; $008164 | | |
  PHA                                       ; $008168 | |/
  RTL                                       ; $008169 |/ jump to game mode pointer

GameModePtr:
  dl $10838A                                ; $00816A | $00: Prepare Nintendo Presents
  dl $10891D                                ; $00816D | $01: Load Nintendo Presents
  dl $0083EF                                ; $008170 | $02: Fade into Nintendo Presents
  dl $1083E6                                ; $008173 | $03: Nintendo Presents
  dl $0083CC                                ; $008176 | $04: Fade out of Nintendo Presents
  dl $0FBDBD                                ; $008179 | $05: Load cutscene
  dl $0083CC                                ; $00817C | $06: Fade into cutscene
  dl $0FBEB9                                ; $00817F | $07: Cutscene
  dl $0083EF                                ; $008182 | $08: Fade out of cutscene
  dl $1780D5                                ; $008185 | $09: Load title screen
  dl $1787D4                                ; $008188 | $0A: Fade into title screen
  dl $0083CC                                ; $00818B | $0B: Level fade out (after entering pipe)
  dl $01AF8F                                ; $00818E | $0C: Level fade in + level name
  dl $01B4E0                                ; $008191 | $0D: Level fade in after pipe/door
  dl $108D4B                                ; $008194 | $0E: Level fade in (after level name)
  dl $01C0D8                                ; $008197 | $0F: Level (with control)
  dl $01B57F                                ; $00819A | $10: Victory cutscenes
  dl $108E85                                ; $00819D | $11: Death
  dl $0083CC                                ; $0081A0 | $12: Death from running out of stars
  dl $0FBB79                                ; $0081A3 | $13: Prepare retry screen
  dl $0083CC                                ; $0081A6 | $14: Retry screen cutscene fade in
  dl $0FBC65                                ; $0081A9 | $15: Retry screen cutscene
  dl $0083FB                                ; $0081AC | $16: Load end of world cutscene
  dl $10E1C0                                ; $0081AF | $17: Final cinema sequence
  dl $1780D5                                ; $0081B2 | $18: Load title screen
  dl $1787D4                                ; $0081B5 | $19: World cutscene after bowser
  dl $0083CC                                ; $0081B8 | $1A: Load credits?
  dl $10E1D9                                ; $0081BB | $1B: Load/Fade to credits (?)
  dl $10E356                                ; $0081BE | $1C: Beginning of credits (very slow fade in effect)
  dl $10E3CA                                ; $0081C1 | $1D: Credits
  dl $0083A7                                ; $0081C4 | $1E: Start+select level fade out
  dl $0083EF                                ; $0081C7 | $1F: Level fade out to overworld
  dl $17A58D                                ; $0081CA | $20: Prepare overworld
  dl $0083CC                                ; $0081CD | $21: Fade into overworld
  dl $17B3CC                                ; $0081D0 | $22: Overworld
  dl $0083CC                                ; $0081D3 | $23: Fade to overworld after beating a level (not 100%)
  dl $17B362                                ; $0081D6 | $24: Overworld level progression
  dl $0083CC                                ; $0081D9 | $25: Fade to overworld after beating a level (100%)
  dl $17AA19                                ; $0081DC | $26: Change level score on overworld
  dl $0083CC                                ; $0081DF | $27: Fade into World score flip cutscene
  dl $17A931                                ; $0081E2 | $28: World score flip cutscene
  dl $0083EF                                ; $0081E5 | $29: Go to bonus game from high score screen (to 2A)
  dl $109AE7                                ; $0081E8 | $2A: Prepare/load bonus game
  dl $0083CC                                ; $0081EB | $2B: Fade in to bonus game or prepare/load bonus game ??
  dl $10A13A                                ; $0081EE | $2C: In bonus game
  dl $0083CC                                ; $0081F1 | $2D: Fade in Throwing balloons minigame
  dl $117FFF                                ; $0081F4 | $2E:
  dl $0083CC                                ; $0081F7 | $2F: Fade in ?
  dl $1181D8                                ; $0081FA | $30:
  dl $01E26C                                ; $0081FD | $31: Loading/fade to score screen from boss cutscene
  dl $0083CC                                ; $008200 | $32: Fade in ?
  dl $01E52C                                ; $008203 | $33:
  dl $0083CC                                ; $008206 | $34: Fade in middle ring restart
  dl $01E5E8                                ; $008209 | $35: Restart from the middle ring screen
  dl $01E6EF                                ; $00820C | $36: Restart selection
  dl $0083EF                                ; $00820F | $37: Fade out of title screen
  dl $10DA32                                ; $008212 | $38: Load intro cutscene
  dl $10DCAC                                ; $008215 | $39: Intro cutscene
  dl $0083CC                                ; $008218 | $3A: Retry cutscene fade out
  dl $01E6A1                                ; $00821B | $3B: Prepare retry screen
  dl $0083CC                                ; $00821E | $3C: Fade into retry screen
  dl $01E6B8                                ; $008221 | $3D: Retry screen
  dl $01E6EF                                ; $008224 | $3E: Retry cutscene selection
  dl $10DE3E                                ; $008227 | $3F: Load game over screen?
  dl $10DF52                                ; $00822A | $40: Game over screen
  dl $0083CC                                ; $00822D | $41: Fade in Error Screen
  dl $108A99                                ; $008230 | $42: Controller Error Screen
  dl $0083CC                                ; $008233 | $43: Fade in ?
  dl $1088FA                                ; $008236 | $44:

disable_nmi:
  STZ !reg_nmitimen                         ; $008239 | disable NMI
  STZ !reg_hdmaen                           ; $00823C | disable HDMA
  LDA #$8F                                  ; $00823F |\ Enables F-blank
  STA !reg_inidisp                          ; $008241 |/
  RTL                                       ; $008244 |

enable_nmi:
  LDA #$81                                  ; $008245 |\
  STA !reg_nmitimen                         ; $008247 | | enable NMI and auto-joypad read
  RTL                                       ; $00824A |/

init_oam:
  REP #$20                                  ; init_oam|
  LDX #$08                                  ; $00824D |\
  LDA #$BD16                                ; $00824F | | GSU: initialize OAM routine
  JSL r_gsu_init_1                          ; $008252 |/
  SEP #$20                                  ; $008256 |
  RTL                                       ; $008258 |

init_oam_buffer:
  REP #$20                                  ; $008259 |
  LDX #$08                                  ; $00825B |
  LDA #$B1D8                                ; $00825D | gsu_init_oam_buffer
  JSL r_gsu_init_1                          ; $008260 |
  SEP #$20                                  ; $008264 |
  RTL                                       ; $008266 |

oam_high_buffer_to_table:
  REP #$20                                  ; $008267 |
  LDX #$08                                  ; $008269 |\
  LDA #$B289                                ; $00826B | | GSU: compress OAM high buffer into OAM high table routine
  JSL r_gsu_init_1                          ; $00826E |/
  SEP #$20                                  ; $008272 |
  RTL                                       ; $008274 |

  db $FF,$FF                                ; $008275 |

; called by routines loading new screens
init_oam_and_bg3_tilemap:
  LDA #$03                                  ; $008277 |\ Set tilemap queue to DMA
  STA $0127                                 ; $008279 |/ (BG3 init)
  JSL disable_nmi                           ; $00827C | disable NMI
  JSL init_oam                              ; $008280 | init OAM
  JML prepare_tilemap_dma_queue_l           ; $008284 |


; General purpose DMA to WRAM
; Arguments:
;   Accumulator = Transfer Size
;   $20 = WRAM destination address
;   $22 = WRAM bank
;   $23 = Source address
;   $25 = Source bank
dma_wram_gen_purpose:
  STA $4305                                 ; $008288 |
  LDA $20                                   ; $00828B |
  STA !reg_wmaddl                           ; $00828D |
  LDY $22                                   ; $008290 |
  STY !reg_wmaddh                           ; $008292 |
  LDA #$8000                                ; $008295 |
  STA $4300                                 ; $008298 |
  LDA $23                                   ; $00829B |
  STA $4302                                 ; $00829D |
  LDY $25                                   ; $0082A0 |
  STY $4304                                 ; $0082A2 |
  LDY #$01                                  ; $0082A5 |
  STY !reg_mdmaen                           ; $0082A7 |
  RTL                                       ; $0082AA |

; Init DMA to arbitrary address (WRAM/SRAM)
; Uses multiplication result for source like a madman
; Arguments:
;   Accumulator = Transfer Size
;   Reg Y = Value to init with
;   $20 = Destination address
;   $22 = Destination bank
dma_init_gen_purpose:
  STA $4305                                 ; $0082AB | Size from A
  STY !reg_m7a                              ; $0082AE |\
  LDX #$00                                  ; $0082B1 | | Take value to init with and
  STX !reg_m7a                              ; $0082B3 | | and multiply with 1 and use
  INX                                       ; $0082B6 | | result for init values
  STX !reg_m7b                              ; $0082B7 |/
  LDA #$3480                                ; $0082BA |
  STA $4300                                 ; $0082BD |
  LDA $20                                   ; $0082C0 |
  STA $4302                                 ; $0082C2 |
  LDX $22                                   ; $0082C5 |
  STX $4304                                 ; $0082C7 |
  LDX #$01                                  ; $0082CA |
  STX !reg_mdmaen                           ; $0082CC |
  RTL                                       ; $0082CF |

  JSL disable_nmi                           ; $0082D0 |\
  REP #$20                                  ; $0082D4 | |
  LDY #$00                                  ; $0082D6 | |
  STZ $20                                   ; $0082D8 | | init $7E0000 - $7E00FF
  STZ $22                                   ; $0082DA | |
  LDA #$0100                                ; $0082DC | |
  JSL dma_init_gen_purpose                  ; $0082DF |/
  LDA #$0200                                ; $0082E3 |\
  STA $20                                   ; $0082E6 | |
  LDX #$7E                                  ; $0082E8 | | init $7E0200 - $7EBFFF
  STX $22                                   ; $0082EA | |
  LDA #$BE00                                ; $0082EC | |
  JSL dma_init_gen_purpose                  ; $0082EF |/
  STZ $20                                   ; $0082F3 |\
  LDX #$7F                                  ; $0082F5 | |
  STX $22                                   ; $0082F7 | | init $7F0000 - $7FFFFF
  LDA #$0000                                ; $0082F9 | |
  JSL dma_init_gen_purpose                  ; $0082FC |/
  LDX #$70                                  ; $008300 |\
  STX $22                                   ; $008302 | | init $700000 - $707BFF
  LDA #$7C00                                ; $008304 | | (everything in SRAM minus the save files, their checksums, and backups of both)
  JSL dma_init_gen_purpose                  ; $008307 |/
  LDA #$FFFF                                ; $00830B |
  STA $7E4002                               ; $00830E |
  LDA #$4802                                ; $008312 |
  STA $7E4800                               ; $008315 |
  SEP #$20                                  ; $008319 |
  RTL                                       ; $00831B |

; Clears out all active states of gamemode 0F
; Keeps level settings, item memory, collectables, save file states etc
clear_basic_states:
  REP #$20                                  ; $00831C |
  LDY #$00                                  ; $00831E |\
  STZ $21                                   ; $008320 | |
  LDA #$0035                                ; $008322 | | clear $7E0035 - $7E00EF
  STA $20                                   ; $008325 | |
  LDA #$00CB                                ; $008327 | |
  JSL dma_init_gen_purpose                  ; $00832A |/
  LDA #$093C                                ; $00832E |\
  STA $20                                   ; $008331 | | clear $7E093C - $7E11B6
  LDA #$087A                                ; $008333 | |
  JSL dma_init_gen_purpose                  ; $008336 |/
  LDA #$6092                                ; $00833A |\
  STA $20                                   ; $00833D | | clear $700092 - $7001F7
  LDA #$0166                                ; $00833F | |
  JSL dma_init_gen_purpose                  ; $008342 |/
  LDA #$7E08                                ; $008346 |\
  STA $20                                   ; $008349 | | clear $701E08 - $701FEF
  LDA #$01E8                                ; $00834B | |
  JSL dma_init_gen_purpose                  ; $00834E |/
  LDA #$2604                                ; $008352 |\
  STA $20                                   ; $008355 | |
  LDX #$70                                  ; $008357 | | clear $702604 - $7077FF
  STX $22                                   ; $008359 | |
  LDA #$51FC                                ; $00835B | |
  JSL dma_init_gen_purpose                  ; $00835E |/
  SEP #$20                                  ; $008362 |
  RTL                                       ; $008364 |

ExecutePtr:
  STY $03                                   ; $008365 | preserve Y
  PLY                                       ; $008367 |\ pull the high byte and bank byte and store it in $00
  STY $00                                   ; $008368 |/ to create a pointer to the pointer table
  REP #$30                                  ; $00836A |
  AND #$00FF                                ; $00836C |  allow for a maximum of 256 pointers
  ASL A                                     ; $00836F |\ get the pointer table index and store it in Y
  TAY                                       ; $008370 |/
  PLA                                       ; $008371 |\ pull the high byte and bank byte and store it in $01
  STA $01                                   ; $008372 |/ to create a pointer to the pointer table
  INY                                       ; $008374 |  increment to the first byte of the pointer table
  LDA [$00],y                               ; $008375 |  load the pointer
  STA $00                                   ; $008377 |  and store the pointer
  SEP #$30                                  ; $008379 |
  LDY $03                                   ; $00837B |  restore Y
  JML [$0000]                               ; $00837D | jump to the pointer

ExecutePtrLong:
  STY $05                                   ; $008380 | preserve Y
  PLY                                       ; $008382 |\ pull the high byte and bank byte and store it in $02
  STY $02                                   ; $008383 |/ to create a pointer to the pointer table
  REP #$30                                  ; $008385 |
  AND #$00FF                                ; $008387 |  allow for a maximum of 256 pointers
  STA $03                                   ; $00838A |\
  ASL A                                     ; $00838C | | multiply the pointer by three
  ADC $03                                   ; $00838D | |
  TAY                                       ; $00838F |/
  PLA                                       ; $008390 |\ pull the high byte and bank byte and store it in $03
  STA $03                                   ; $008391 |/ to create a pointer to the pointer table
  INY                                       ; $008393 |  increment to the first byte of the pointer table
  LDA [$02],y                               ; $008394 |\ load and store the first two bytes of the pointer
  STA $00                                   ; $008396 |/
  INY                                       ; $008398 |  move to the next byte in the pointer table
  LDA [$02],y                               ; $008399 |\ load and store the last byte of the pointer
  STA $01                                   ; $00839B |/ (also rereads the high byte)
  XBA                                       ; $00839D |
  SEP #$30                                  ; $00839E |
  PHB                                       ; $0083A0 |\
  PHA                                       ; $0083A1 | | load pointer bank
  PLB                                       ; $0083A2 |/
  LDY $05                                   ; $0083A3 |  restore Y
  JML [$0000]                               ; $0083A5 | jump to the pointer

  LDX $0201                                 ; $0083A8 |
  LDA !r_reg_inidisp_mirror                 ; $0083AB |
  AND #$0F                                  ; $0083AE |
  CMP $83C6,x                               ; $0083B0 |
  BNE fade_screen_in_out_add_fade           ; $0083B3 |
  TXA                                       ; $0083B5 |
  EOR #$01                                  ; $0083B6 |
  AND #$01                                  ; $0083B8 |
  STA $0201                                 ; $0083BA |
  LDA #$20                                  ; $0083BD |\
  STA !r_game_mode                          ; $0083BF | | jump to prepare overworld game mode
  BRA fade_screen_in_out_ret                ; $0083C2 |/

fade_amount:
  db $01,$FF                                ; $0083C4 |

fade_limit:
  db $0F,$00                                ; $0083C6 |

; unused entry?
  PHB                                       ; $0083C8 |
  LDA #$00                                  ; $0083C9 |
  PHA                                       ; $0083CB |
  PLB                                       ; $0083CC |

; various game modes:
; $04, $06, $0B, $12, $14, $1A, $21, $23, $25, $27
; $2B, $2D, $2F, $32, $34, $3A, $3C, $41, $43

; Gamemode for fading in or out
; When fade is done, go to next game mode
fade_screen_in_out:
  LDX $0201                                 ; $0083CD | Fade in/out type
  LDA !r_reg_inidisp_mirror                 ; $0083D0 |\
  AND #$0F                                  ; $0083D3 | |
  CMP fade_limit,x                          ; $0083D5 | | Check if fade completed
  BNE .add_fade                             ; $0083D8 |/
  TXA                                       ; $0083DA |\
  EOR #$01                                  ; $0083DB | | Fade complete
  AND #$01                                  ; $0083DD | | Toggle it on/off
  STA $0201                                 ; $0083DF |/
  INC !r_game_mode                          ; $0083E2 |   Go to next game mode
  BRA .ret                                  ; $0083E5 |

.add_fade
  CLC                                       ; $0083E7 |\
  ADC fade_amount,x                         ; $0083E8 | | Add fade amount (-1/+1)
  STA !r_reg_inidisp_mirror                 ; $0083EB |/

.ret
  PLB                                       ; $0083EE |
  RTL                                       ; $0083EF |

gamemode1F:
  DEC $0202                                 ; $0083F0 |
  BPL fade_screen_in_out_ret                ; $0083F3 |
  LDA #$02                                  ; $0083F5 |
  STA $0202                                 ; $0083F7 |
  BRA fade_screen_in_out                    ; $0083FA |

gamemode16:
  DEC $0202                                 ; $0083FC |
  BPL fade_screen_in_out_ret                ; $0083FF |
  LDA #$08                                  ; $008401 |
  STA $0202                                 ; $008403 |
  BRA fade_screen_in_out                    ; $008406 |

; RNG routine
random_number_gen:
  PHP                                       ; $008408 |
  SEP #$20                                  ; $008409 |
  LDA !reg_slhv                             ; $00840B |  latch H/V counter
  LDA !reg_stat78                           ; $00840E |  set "low byte" read for $213C
  REP #$20                                  ; $008411 |
  LDA !reg_ophct                            ; $008413 |\
  CLC                                       ; $008416 | | add on horizontal & vertical
  ADC !s_rng                                ; $008417 | | scanline values to previous RNG
  STA !s_rng                                ; $00841A |/
  PLP                                       ; $00841D |
  RTL                                       ; $00841E |

SPC700Upload:
  PHP                                       ; $00841F | Preserve processor flags
  REP #$30                                  ; $008420 |   16 bit A/X/Y
  LDY #$0000                                ; $008422 |
  LDA #$BBAA                                ; $008425 |\ Value to check if the SPC is ready

.SPC_wait
  CMP !reg_apu_port0                        ; $008428 | | Wait for the SPC to be ready
  BNE .SPC_wait                             ; $00842B |/
  SEP #$20                                  ; $00842D |  8 bit A
  LDA #$CC                                  ; $00842F |\ Byte used to enable SPC block upload
  BRA .send_SPC_block                       ; $008431 |/

.transfer_bytes
  LDA [$00],y                               ; $008433 | | Load the Byte into the low byte
  INY                                       ; $008435 | | Increase the index
  XBA                                       ; $008436 | | Move it to the high byte
  LDA #$00                                  ; $008437 |/ Set the validation byte to the low byte
  BRA .store_word                           ; $008439 |

.next_byte
  XBA                                       ; $00843B |\  Switch the high and low byte
  LDA [$00],y                               ; $00843C | | Load a new low byte
  INY                                       ; $00843E | | Increase the index
  XBA                                       ; $00843F |/ Switch the new low byte to the high byte

.validation_loop
  CMP !reg_apu_port0                        ; $008440 | | Wait till $2140 matches the validation byte
  BNE .validation_loop                      ; $008443 |/
  INC A                                     ; $008445 |  Increment the validation byte

.store_word
  REP #$20                                  ; $008446 | | 16 bit A
  STA !reg_apu_port0                        ; $008448 | | Store to $2140/$2141
  SEP #$20                                  ; $00844B | | 8 bit A
  DEX                                       ; $00844D |/ Decrement byte counter
  BNE .next_byte                            ; $00844E |

.validation_loop_2
  CMP !reg_apu_port0                        ; $008450 | | validate again
  BNE .validation_loop_2                    ; $008453 |/

.add_3
  ADC #$03                                  ; $008455 | | If A is 0 add 3 again
  BEQ .add_3                                ; $008457 |/

.send_SPC_block
  PHA                                       ; $008459 |  Preserve A to store to $2140 later
  REP #$20                                  ; $00845A |  16 bit A
  LDA [$00],y                               ; $00845C |\
  BNE .store_SPC_block                      ; $00845E | | Clear out the address
  DEC $000C                                 ; $008460 | | (can't use 00 for transfers)
  BMI .store_SPC_block                      ; $008463 |/
  LDA $000C                                 ; $008465 |
  ASL A                                     ; $008468 |
  ADC $000C                                 ; $008469 | $000C * 3 + carry
  TAY                                       ; $00846C |
  LDA $0003,y                               ; $00846D |
  STA $00                                   ; $008470 |
  LDA $0004,y                               ; $008472 |
  STA $01                                   ; $008475 |
  LDY #$0000                                ; $008477 |
  LDA [$00],y                               ; $00847A |\ Get data length

.store_SPC_block
  INY                                       ; $00847C | |
  INY                                       ; $00847D | |
  TAX                                       ; $00847E |/
  LDA [$00],y                               ; $00847F |\ Get address to write to in SPC RAM
  INY                                       ; $008481 | |
  INY                                       ; $008482 |/
  STA !reg_apu_port2                        ; $008483 |  Store the address of SPC RAM to write to $2142
  SEP #$20                                  ; $008486 |  8 bit A
  CPX #$0001                                ; $008488 |
  LDA #$00                                  ; $00848B |\ Store the carry flag in $2141
  ROL A                                     ; $00848D | |
  STA !reg_apu_port1                        ; $00848E |/
  ADC #$7F                                  ; $008491 |  if A is one this sets the overflow flag
  PLA                                       ; $008493 |\ Store the A pushed earlier
  STA !reg_apu_port0                        ; $008494 |/

.ret_validate
  CMP !reg_apu_port0                        ; $008497 | | validate again
  BNE .ret_validate                         ; $00849A |/
  BVS .transfer_bytes                       ; $00849C |  If the overflow is not set, keep uploading
  STZ !reg_apu_port0                        ; $00849E |\ Clear SPC I/O ports
  STZ !reg_apu_port1                        ; $0084A1 | |
  STZ !reg_apu_port2                        ; $0084A4 | |
  STZ !reg_apu_port3                        ; $0084A7 |/
  PLP                                       ; $0084AA |  Restore processor flag
  RTS                                       ; $0084AB |

; SPC data block pointers
SPC_ptr:
  dl $4E0000                                ; $0084AC |
  dl $4E169C                                ; $0084AF |
  dl $4E23BF                                ; $0084B2 |
  dl $4E2C39                                ; $0084B5 |
  dl $4E38D2                                ; $0084B8 |
  dl $4ED0FE                                ; $0084BB |
  dl $4ED5D0                                ; $0084BE |
  dl $4EE279                                ; $0084C1 |
  dl $4EEC85                                ; $0084C4 |
  dl $4F4122                                ; $0084C7 |
  dl $4F5C48                                ; $0084CA |
  dl $4F6E5A                                ; $0084CD |
  dl $4F82E6                                ; $0084D0 |
  dl $4FFCB2                                ; $0084D3 |
  dl $500342                                ; $0084D6 |
  dl $4F33F0                                ; $0084D9 |
  dl $4EFEC1                                ; $0084DC |
  dl $4F205D                                ; $0084DF |
  dl $4E3E90                                ; $0084E2 |
  dl $4EBBEC                                ; $0084E5 |

; SPC data block sets (4 bytes per)
spc_data_blocks:
  db $2B, $FF, $FF, $FF                     ; $0084E8 |
  db $25, $22, $2E, $FF                     ; $0084EC |
  db $25, $22, $1C, $FF                     ; $0084F0 |
  db $25, $19, $13, $FF                     ; $0084F4 |
  db $25, $16, $10, $FF                     ; $0084F8 |
  db $25, $16, $0D, $FF                     ; $0084FC |
  db $25, $22, $28, $FF                     ; $008500 |
  db $25, $16, $0A, $FF                     ; $008504 |
  db $25, $19, $07, $FF                     ; $008508 |
  db $25, $19, $1F, $FF                     ; $00850C |
  db $25, $01, $04, $FF                     ; $008510 |
  db $31, $34, $FF, $FF                     ; $008514 |
  db $37, $3A, $FF, $FF                     ; $008518 |

; Item-Denial table for each music track; $00 enables items and $01 disables them
item_denial_table:
  db $00, $00, $00, $01, $00, $01, $00, $01 ; $00851C |
  db $01, $01, $00, $00, $01, $00, $00, $00 ; $008524 |

  db $FF, $00, $FF                          ; $00852C |

; SPC data block set to use for each level
spc_block_set_indexes:
  db $0C, $10, $18, $1C, $14                ; $00852F |
  db $1C, $20, $24, $24, $24                ; $008534 |
  db $28, $28, $2C, $1C, $00                ; $008539 |
  db $00, $00, $04, $08, $30                ; $00853E |

; takes argument of track in X
; sets and uploads new music
set_level_music:
  STX !r_header_music                       ; $008543 |

upload_music_data:
  LDX !r_header_music                       ; $008546 | Music level header
  LDA.l item_denial_table,x                 ; $008549 |
  BMI .compare_to_previous                  ; $00854D |
  STA !r_pause_item_disable                 ; $00854F | Set enable/disable for pause items

.compare_to_previous
  INX                                       ; $008552 |\
  CPX !r_spc_block_set                      ; $008553 | | Return if same SPC block
  BNE .set_spc_block_set                    ; $008556 | | already loaded
  RTL                                       ; $008558 |/

.set_spc_block_set
  STX !r_spc_block_set                      ; $008559 | SPC data block set
  STZ $0205                                 ; $00855C | Clear Music track (?)
  LDA.l spc_block_set_indexes-1,x           ; $00855F | Block set to use
  TAX                                       ; $008563 |
  STZ $0C                                   ; $008564 |\
  STZ $0D                                   ; $008566 | | clear out some scratch RAM for use later
  STZ $0E                                   ; $008568 |/
  LDY #$00                                  ; $00856A |

; add 4 spc blocks to a list
; $0207 holds 4 indexes and $0000 holds 4 long pointers
; FF means empty block
; $0C as flag for upload
; $0E is counter for pointers
.add_spc_block
  LDA.l spc_data_blocks,x                   ; $00856C |
  CMP !r_spc_blocks,y                       ; $008570 |\ Return if same block
  BEQ .next_spc_block                       ; $008573 |/
  STA !r_spc_blocks,y                       ; $008575 | Add block index
  CMP #$FF                                  ; $008578 |
  BEQ .next_spc_block                       ; $00857A |
  INC $0C                                   ; $00857C | Flag for enable upload
  PHX                                       ; $00857E |
  PHY                                       ; $00857F |
  TAX                                       ; $008580 |
  LDY $0E                                   ; $008581 |\
  LDA.l SPC_ptr-1,x                         ; $008583 | |
  STA $0000,y                               ; $008587 | |
  LDA.l SPC_ptr,x                           ; $00858A | | Add long pointer for data block
  STA $0001,y                               ; $00858E | |
  LDA.l SPC_ptr+1,x                         ; $008591 | |
  STA $0002,y                               ; $008595 |/
  INY                                       ; $008598 |\
  INY                                       ; $008599 | |
  INY                                       ; $00859A | | + 3 for pointer list counter
  STY $0E                                   ; $00859B |/
  PLY                                       ; $00859D |
  PLX                                       ; $00859E |

.next_spc_block
  INX                                       ; $00859F |\ Increase index by one
  INY                                       ; $0085A0 |/
  CPY #$04                                  ; $0085A1 |\ Leave once past max blocks (4)
  BCC .add_spc_block                        ; $0085A3 |/
  DEC $0C                                   ; $0085A5 |
  BMI .ret                                  ; $0085A7 |

.UploadDataToSPC
  SEI                                       ; $0085A9 |\ Prevent interrupts from interrupting SPC upload
  LDA #$FF                                  ; $0085AA | |
  STA !reg_apu_port0                        ; $0085AC | |
  JSR SPC700Upload                          ; $0085AF | | Main SPC upload loop
  CLI                                       ; $0085B2 |/ Enable interrupts again

.ret
  LDX #$03                                  ; $0085B3 |\

.clear_apu_ports
  STZ $2140,x                               ; $0085B5 | | clear APU I/O registers
  DEX                                       ; $0085B8 | |
  BPL .clear_apu_ports                      ; $0085B9 |/
  REP #$20                                  ; $0085BB |
  STZ !r_apu_io_0_mirror                    ; $0085BD |\
  STZ !r_apu_io_0_mirror_prev               ; $0085C0 | |
  STZ !r_apu_io_2_mirror                    ; $0085C3 | | clear APU I/O mirrors
  STZ !r_apu_io_2_mirror_prev               ; $0085C6 | |
  STZ !r_sound_queue_size                   ; $0085C9 | |
  STZ !r_sound_queue                        ; $0085CC |/
  SEP #$20                                  ; $0085CF |
  RTL                                       ; $0085D1 |

; long routine
; takes sound ID as argument in accumulator
push_sound_queue:
  LDY !r_sound_queue_size                   ; $0085D2 |\
  STA !r_sound_queue,y                      ; $0085D5 | | Push sound into sound queue
  INC !r_sound_queue_size                   ; $0085D8 | | Increment queue size
  RTL                                       ; $0085DB |/

init_kamek_OH_MY:
  RTL                                       ; $0085DC |

  dw $8607                                  ; $0085DD |
  dw $8641                                  ; $0085DF |
  dw $8670                                  ; $0085E1 |
  dw $8691                                  ; $0085E3 |

main_kamek_OH_MY:
  LDY #$01                                  ; $0085E5 |
  STY !r_autoscr_x_active                   ; $0085E7 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $0085EA |
  SEC                                       ; $0085EC |
  SBC !r_bg1_cam_x                          ; $0085ED |
  CMP #$00F0                                ; $0085F0 |
  BMI CODE_0085F8                           ; $0085F3 |
  INC !r_bg1_cam_x                          ; $0085F5 |

CODE_0085F8:
  LDA !r_bg1_cam_x                          ; $0085F8 |
  STA $0C23                                 ; $0085FB |
  TXY                                       ; $0085FE |
  LDA !s_spr_wildcard_5_lo_dp,x             ; $0085FF |
  ASL A                                     ; $008601 |
  TAX                                       ; $008602 |
  JSR ($85DD,x)                             ; $008603 |
  RTL                                       ; $008606 |

  TYX                                       ; $008607 |
  LDA !s_spr_x_speed_lo,x                   ; $008608 |
  BMI CODE_008622                           ; $00860B |
  STZ !s_spr_x_speed_lo,x                   ; $00860D |
  STZ !s_spr_x_accel,x                      ; $008610 |
  LDA #$0002                                ; $008613 |
  STA !s_spr_anim_frame,x                   ; $008616 |
  LDA #$0020                                ; $008619 |
  STA !s_spr_timer_1,x                      ; $00861C |
  INC !s_spr_wildcard_5_lo_dp,x             ; $00861F |
  RTS                                       ; $008621 |

CODE_008622:
  CMP #$FF00                                ; $008622 |
  BMI CODE_00862C                           ; $008625 |
  LDA #$0005                                ; $008627 |
  BRA CODE_00863D                           ; $00862A |

CODE_00862C:
  LDA !s_spr_timer_2,x                      ; $00862C |
  BNE CODE_008640                           ; $00862F |
  LDA #$0002                                ; $008631 |
  STA !s_spr_timer_2,x                      ; $008634 |
  LDA !s_spr_anim_frame,x                   ; $008637 |
  EOR #$0001                                ; $00863A |

CODE_00863D:
  STA !s_spr_anim_frame,x                   ; $00863D |

CODE_008640:
  RTS                                       ; $008640 |

  TYX                                       ; $008641 |
  LDA !s_spr_timer_1,x                      ; $008642 |
  ORA !s_spr_timer_2,x                      ; $008645 |
  BNE CODE_00866F                           ; $008648 |
  INC !s_spr_anim_frame,x                   ; $00864A |
  LDA !s_spr_anim_frame,x                   ; $00864D |
  CMP #$0004                                ; $008650 |
  BNE CODE_008669                           ; $008653 |
  LDA #$005B                                ; $008655 |\ play sound #$005B
  JSL push_sound_queue                      ; $008658 |/
  LDA #$0082                                ; $00865C |
  STA $704070                               ; $00865F |
  INC !r_msg_box_state                      ; $008663 |
  INC !s_spr_wildcard_5_lo_dp,x             ; $008666 |
  RTS                                       ; $008668 |

CODE_008669:
  LDA #$0008                                ; $008669 |
  STA !s_spr_timer_2,x                      ; $00866C |

CODE_00866F:
  RTS                                       ; $00866F |

  TYX                                       ; $008670 |
  LDA !r_msg_box_state                      ; $008671 |
  BNE CODE_008690                           ; $008674 |
  LDA #$0002                                ; $008676 |
  STA !s_spr_anim_frame,x                   ; $008679 |
  LDA #$FC00                                ; $00867C |
  STA !s_spr_x_speed_lo,x                   ; $00867F |
  LDA #$0040                                ; $008682 |
  STA !s_spr_x_accel,x                      ; $008685 |
  LDA #$0400                                ; $008688 |
  STA !s_spr_x_accel_ceiling,x              ; $00868B |
  INC !s_spr_wildcard_5_lo_dp,x             ; $00868E |

CODE_008690:
  RTS                                       ; $008690 |

  TYX                                       ; $008691 |
  LDA !s_spr_x_speed_lo,x                   ; $008692 |
  CLC                                       ; $008695 |
  ADC #$0080                                ; $008696 |
  CMP #$0100                                ; $008699 |
  BCS CODE_0086A3                           ; $00869C |
  LDA #$0006                                ; $00869E |
  BRA CODE_0086B4                           ; $0086A1 |

CODE_0086A3:
  CLC                                       ; $0086A3 |
  ADC #$0080                                ; $0086A4 |
  CMP #$0200                                ; $0086A7 |
  BCS CODE_0086B1                           ; $0086AA |
  LDA #$0005                                ; $0086AC |
  BRA CODE_0086B4                           ; $0086AF |

CODE_0086B1:
  LDA #$0002                                ; $0086B1 |

CODE_0086B4:
  STA !s_spr_anim_frame,x                   ; $0086B4 |
  LDA !s_spr_x_speed_lo,x                   ; $0086B7 |
  BMI CODE_0086C2                           ; $0086BA |
  LDA #$0002                                ; $0086BC |
  STA !s_spr_facing_dir,x                   ; $0086BF |

CODE_0086C2:
  LDA !s_spr_cam_x_pos,x                    ; $0086C2 |
  CMP #$0140                                ; $0086C5 |
  BMI CODE_008690                           ; $0086C8 |
  LDX $108A                                 ; $0086CA |
  LDA !s_spr_x_pixel_pos,x                  ; $0086CD |
  STA $00                                   ; $0086D0 |
  LDA !s_spr_y_pixel_pos,x                  ; $0086D2 |
  STA $02                                   ; $0086D5 |
  JSL $02E1A3                               ; $0086D7 |
  LDX $108A                                 ; $0086DB |
  JSL $03A31E                               ; $0086DE |
  LDX $12                                   ; $0086E2 |
  PLA                                       ; $0086E4 |
  JML $03A31E                               ; $0086E5 |

init_background_shyguy:
  LDY !r_cam_moving_dir_x                   ; $0086E9 |
  BEQ CODE_0086F2                           ; $0086EC |
  JML $03A31E                               ; $0086EE |

CODE_0086F2:
  LDA !s_spr_x_pixel_pos,x                  ; $0086F2 |
  SEC                                       ; $0086F5 |
  SBC !r_bg1_cam_x                          ; $0086F6 |
  CLC                                       ; $0086F9 |
  ADC !r_bg2_cam_x                          ; $0086FA |
  STA !s_spr_x_pixel_pos,x                  ; $0086FD |
  STA !s_spr_wildcard_1_lo,x                ; $008700 |
  LDA !s_spr_y_pixel_pos,x                  ; $008703 |
  CLC                                       ; $008706 |
  ADC #$0008                                ; $008707 |
  SEC                                       ; $00870A |
  SBC !r_bg1_cam_y                          ; $00870B |
  CLC                                       ; $00870E |
  ADC !r_bg2_cam_y                          ; $00870F |
  AND #$FFF8                                ; $008712 |
  CLC                                       ; $008715 |
  ADC #$000A                                ; $008716 |
  STA !s_spr_y_pixel_pos,x                  ; $008719 |
  STA !s_spr_wildcard_2_lo,x                ; $00871C |
  INC !s_spr_bg_layer,x                     ; $00871F |
  INC !s_spr_bg_layer,x                     ; $008722 |
  RTL                                       ; $008725 |

  db $E0,$FF,$20,$00                        ; $008726 |

main_background_shyguy:
  JSL $03AF23                               ; $00872A |
  JSL $03A2C7                               ; $00872E |
  BCC CODE_008738                           ; $008732 |
  JML $03A32E                               ; $008734 |

CODE_008738:
  LDA !s_spr_facing_dir,x                   ; $008738 |
  DEC A                                     ; $00873B |
  STA $00                                   ; $00873C |
  LDA !s_spr_x_pixel_pos,x                  ; $00873E |
  SEC                                       ; $008741 |
  SBC !s_spr_wildcard_1_lo,x                ; $008742 |
  CLC                                       ; $008745 |
  ADC #$0020                                ; $008746 |
  CMP #$0040                                ; $008749 |
  BCC CODE_008767                           ; $00874C |
  EOR $00                                   ; $00874E |
  BMI CODE_008767                           ; $008750 |

CODE_008752:
  LDA $10                                   ; $008752 |
  AND #$001F                                ; $008754 |
  CLC                                       ; $008757 |
  ADC #$0030                                ; $008758 |
  STA !s_spr_timer_3,x                      ; $00875B |
  LDA !s_spr_facing_dir,x                   ; $00875E |
  EOR #$0002                                ; $008761 |
  STA !s_spr_facing_dir,x                   ; $008764 |

CODE_008767:
  LDY !s_spr_timer_3,x                      ; $008767 |
  BEQ CODE_008752                           ; $00876A |
  LDY !s_spr_facing_dir,x                   ; $00876C |
  LDA $8726,y                               ; $00876F |
  STA !s_spr_x_speed_lo,x                   ; $008772 |
  LDY !s_spr_timer_2,x                      ; $008775 |
  BNE CODE_008789                           ; $008778 |
  LDA #$0008                                ; $00877A |
  STA !s_spr_timer_2,x                      ; $00877D |
  LDA !s_spr_anim_frame,x                   ; $008780 |
  EOR #$0001                                ; $008783 |
  STA !s_spr_anim_frame,x                   ; $008786 |

CODE_008789:
  RTL                                       ; $008789 |

init_skinny_platform:
  STZ !s_spr_facing_dir,x                   ; $00878A |
  RTL                                       ; $00878D |

main_skinny_platform:
  REP #$10                                  ; $00878E |
  LDY !s_spr_oam_pointer,x                  ; $008790 |
  LDA !s_spr_cam_y_pos,x                    ; $008793 |
  STA $00                                   ; $008796 |
  LDA !s_spr_gsu_morph_1_lo,x               ; $008798 |
  AND #$00FF                                ; $00879B |
  CLC                                       ; $00879E |
  ADC $00                                   ; $00879F |
  STA $6002,y                               ; $0087A1 |
  LDA !s_spr_gsu_morph_1_hi,x               ; $0087A4 |
  AND #$00FF                                ; $0087A7 |
  CLC                                       ; $0087AA |
  ADC $00                                   ; $0087AB |
  STA $600A,y                               ; $0087AD |
  LDA !s_spr_gsu_morph_2_lo,x               ; $0087B0 |
  AND #$00FF                                ; $0087B3 |
  CLC                                       ; $0087B6 |
  ADC $00                                   ; $0087B7 |
  STA $6012,y                               ; $0087B9 |
  LDA !s_spr_gsu_morph_2_hi,x               ; $0087BC |
  AND #$00FF                                ; $0087BF |
  CLC                                       ; $0087C2 |
  ADC $00                                   ; $0087C3 |
  STA $601A,y                               ; $0087C5 |
  LDA !s_spr_wildcard_1_lo,x                ; $0087C8 |
  AND #$00FF                                ; $0087CB |
  CLC                                       ; $0087CE |
  ADC $00                                   ; $0087CF |
  STA $6022,y                               ; $0087D1 |
  LDA !s_spr_wildcard_1_hi,x                ; $0087D4 |
  AND #$00FF                                ; $0087D7 |
  CLC                                       ; $0087DA |
  ADC $00                                   ; $0087DB |
  STA $602A,y                               ; $0087DD |
  LDA !s_spr_wildcard_2_lo,x                ; $0087E0 |
  AND #$00FF                                ; $0087E3 |
  CLC                                       ; $0087E6 |
  ADC $00                                   ; $0087E7 |
  STA $6032,y                               ; $0087E9 |
  LDA !s_spr_wildcard_2_hi,x                ; $0087EC |
  AND #$00FF                                ; $0087EF |
  CLC                                       ; $0087F2 |
  ADC $00                                   ; $0087F3 |
  STA $603A,y                               ; $0087F5 |
  SEP #$10                                  ; $0087F8 |
  LDA !s_player_tile_collision              ; $0087FA |
  AND #$0003                                ; $0087FD |
  BNE CODE_00880B                           ; $008800 |
  LDA !s_player_y                           ; $008802 |
  CLC                                       ; $008805 |
  ADC !s_spr_wildcard_4_lo_dp,x             ; $008806 |
  STA !s_player_y                           ; $008808 |

CODE_00880B:
  LDA !s_spr_gsu_morph_1_lo,x               ; $00880B |
  AND #$00FF                                ; $00880E |
  STA $6000                                 ; $008811 |
  STA $00                                   ; $008814 |
  LDA !s_spr_gsu_morph_1_hi,x               ; $008816 |
  AND #$00FF                                ; $008819 |
  STA $6002                                 ; $00881C |
  STA $02                                   ; $00881F |
  LDA !s_spr_gsu_morph_2_lo,x               ; $008821 |
  AND #$00FF                                ; $008824 |
  STA $6004                                 ; $008827 |
  STA $04                                   ; $00882A |
  LDA !s_spr_gsu_morph_2_hi,x               ; $00882C |
  AND #$00FF                                ; $00882F |
  STA $6006                                 ; $008832 |
  STA $06                                   ; $008835 |
  LDA !s_spr_wildcard_1_lo,x                ; $008837 |
  AND #$00FF                                ; $00883A |
  STA $6008                                 ; $00883D |
  STA $08                                   ; $008840 |
  LDA !s_spr_wildcard_1_hi,x                ; $008842 |
  AND #$00FF                                ; $008845 |
  STA $600A                                 ; $008848 |
  STA $0A                                   ; $00884B |
  LDA !s_spr_wildcard_2_lo,x                ; $00884D |
  AND #$00FF                                ; $008850 |
  STA $600C                                 ; $008853 |
  STA $0C                                   ; $008856 |
  LDA !s_spr_wildcard_2_hi,x                ; $008858 |
  AND #$00FF                                ; $00885B |
  STA $600E                                 ; $00885E |
  STA $0E                                   ; $008861 |
  STZ !gsu_r1                               ; $008863 |
  LDY $60AB                                 ; $008866 |
  BPL CODE_008870                           ; $008869 |
  LDY !s_player_jump_state                  ; $00886B |
  BNE CODE_0088C7                           ; $00886E |

CODE_008870:
  LDA !s_player_center_x                    ; $008870 |
  SEC                                       ; $008873 |
  SBC !s_spr_x_pixel_pos,x                  ; $008874 |
  CLC                                       ; $008877 |
  ADC #$0020                                ; $008878 |
  CMP #$0040                                ; $00887B |
  BCS CODE_0088CF                           ; $00887E |
  STA !gsu_r2                               ; $008880 |
  LDA !s_spr_x_pixel_pos,x                  ; $008883 |
  SEC                                       ; $008886 |
  SBC #$0018                                ; $008887 |
  SEC                                       ; $00888A |
  SBC !s_player_center_x                    ; $00888B |
  STA !gsu_r3                               ; $00888E |
  LDA #$0046                                ; $008891 |
  CLC                                       ; $008894 |
  ADC !s_spr_wildcard_6_lo_dp,x             ; $008895 |
  STA $603E                                 ; $008897 |
  LSR A                                     ; $00889A |
  STA $603C                                 ; $00889B |
  STA !gsu_r6                               ; $00889E |
  LDA !s_player_center_y                    ; $0088A1 |
  CLC                                       ; $0088A4 |
  ADC !s_car_wheel_ext_height               ; $0088A5 |
  STA !gsu_r8                               ; $0088A8 |
  LDA !s_player_hitbox_half_height          ; $0088AB |
  STA !gsu_r9                               ; $0088AE |
  LDA !s_spr_y_pixel_pos,x                  ; $0088B1 |
  STA !gsu_r10                              ; $0088B4 |
  LDX #$0B                                  ; $0088B7 |
  LDA #$860A                                ; $0088B9 |
  JSL r_gsu_init_1                          ; $0088BC |  GSU init
  LDX $12                                   ; $0088C0 |
  LDY !gsu_r1                               ; $0088C2 |
  BNE CODE_0088F5                           ; $0088C5 |

CODE_0088C7:
  LDA !s_spr_y_speed_lo,x                   ; $0088C7 |
  BEQ CODE_0088CF                           ; $0088CA |
  JMP CODE_00899F                           ; $0088CC |

CODE_0088CF:
  LDY #$0E                                  ; $0088CF |

CODE_0088D1:
  LDA $7960,y                               ; $0088D1 |
  BEQ CODE_0088EC                           ; $0088D4 |
  CMP #$0008                                ; $0088D6 |
  BPL CODE_0088DE                           ; $0088D9 |
  LDA #$0008                                ; $0088DB |

CODE_0088DE:
  LSR A                                     ; $0088DE |
  LSR A                                     ; $0088DF |
  LSR A                                     ; $0088E0 |
  EOR #$FFFF                                ; $0088E1 |
  INC A                                     ; $0088E4 |
  CLC                                       ; $0088E5 |
  ADC $7960,y                               ; $0088E6 |
  STA $7960,y                               ; $0088E9 |

CODE_0088EC:
  DEY                                       ; $0088EC |
  DEY                                       ; $0088ED |
  BPL CODE_0088D1                           ; $0088EE |
  STZ !s_spr_wildcard_4_lo_dp,x             ; $0088F0 |
  JMP CODE_008985                           ; $0088F2 |

CODE_0088F5:
  LDA !s_spr_y_speed_lo,x                   ; $0088F5 |
  BEQ CODE_00891A                           ; $0088F8 |
  LDY #$0E                                  ; $0088FA |

CODE_0088FC:
  LDA $6000,y                               ; $0088FC |
  SEC                                       ; $0088FF |
  SBC $7960,y                               ; $008900 |
  BMI CODE_008914                           ; $008903 |
  CMP #$8000                                ; $008905 |
  ROR A                                     ; $008908 |
  CMP #$8000                                ; $008909 |
  ROR A                                     ; $00890C |
  CLC                                       ; $00890D |
  ADC $7960,y                               ; $00890E |
  STA $7960,y                               ; $008911 |

CODE_008914:
  DEY                                       ; $008914 |
  DEY                                       ; $008915 |
  BPL CODE_0088FC                           ; $008916 |
  BRA CODE_008936                           ; $008918 |

CODE_00891A:
  LDY #$0E                                  ; $00891A |

CODE_00891C:
  LDA $6000,y                               ; $00891C |
  SEC                                       ; $00891F |
  SBC $7960,y                               ; $008920 |
  CMP #$8000                                ; $008923 |
  ROR A                                     ; $008926 |
  CMP #$8000                                ; $008927 |
  ROR A                                     ; $00892A |
  CLC                                       ; $00892B |
  ADC $7960,y                               ; $00892C |
  STA $7960,y                               ; $00892F |
  DEY                                       ; $008932 |
  DEY                                       ; $008933 |
  BPL CODE_00891C                           ; $008934 |

CODE_008936:
  LDY !s_spr_wildcard_4_lo_dp,x             ; $008936 |
  BNE CODE_00894F                           ; $008938 |
  LDA !s_player_y_speed                     ; $00893A |
  LSR A                                     ; $00893D |
  LSR A                                     ; $00893E |
  LSR A                                     ; $00893F |
  LSR A                                     ; $008940 |
  STA !s_spr_wildcard_6_lo_dp,x             ; $008941 |
  LDY !s_player_ground_pound_state          ; $008943 |
  BEQ CODE_00894F                           ; $008946 |
  LDA !s_player_y_speed                     ; $008948 |
  LSR A                                     ; $00894B |
  STA !s_spr_y_speed_lo,x                   ; $00894C |

CODE_00894F:
  LDA !s_player_tile_collision              ; $00894F |
  AND #$0003                                ; $008952 |
  BNE CODE_008985                           ; $008955 |
  LDA $6020                                 ; $008957 |
  AND #$FFFE                                ; $00895A |
  TAY                                       ; $00895D |
  LDA $7960,y                               ; $00895E |
  CLC                                       ; $008961 |
  ADC !s_spr_y_pixel_pos,x                  ; $008962 |
  SEC                                       ; $008965 |
  SBC #$001E                                ; $008966 |
  SEC                                       ; $008969 |
  SBC !s_car_wheel_ext_height               ; $00896A |
  STA !s_player_y                           ; $00896D |
  STZ !s_player_y_speed                     ; $008970 |
  INC !s_on_sprite_platform_flag            ; $008973 |
  LDY #$02                                  ; $008976 |
  STY !s_spr_wildcard_4_lo_dp,x             ; $008978 |
  LDA !s_spr_y_speed_lo,x                   ; $00897A |
  BEQ CODE_008985                           ; $00897D |
  LDA #$0800                                ; $00897F |
  STA !s_player_y_speed                     ; $008982 |

CODE_008985:
  LDA !s_spr_y_speed_lo,x                   ; $008985 |
  BEQ CODE_008992                           ; $008988 |
  LDA !s_spr_wildcard_6_lo_dp,x             ; $00898A |
  CLC                                       ; $00898C |
  ADC #$0004                                ; $00898D |
  BRA CODE_00899D                           ; $008990 |

CODE_008992:
  LDA !s_spr_wildcard_6_lo_dp,x             ; $008992 |
  SEC                                       ; $008994 |
  SBC #$0008                                ; $008995 |
  BPL CODE_00899D                           ; $008998 |
  LDA #$0000                                ; $00899A |

CODE_00899D:
  STA !s_spr_wildcard_6_lo_dp,x             ; $00899D |

CODE_00899F:
  SEP #$20                                  ; $00899F |
  LDA $00                                   ; $0089A1 |
  STA !s_spr_gsu_morph_1_lo,x               ; $0089A3 |
  LDA $02                                   ; $0089A6 |
  STA !s_spr_gsu_morph_1_hi,x               ; $0089A8 |
  LDA $04                                   ; $0089AB |
  STA !s_spr_gsu_morph_2_lo,x               ; $0089AD |
  LDA $06                                   ; $0089B0 |
  STA !s_spr_gsu_morph_2_hi,x               ; $0089B2 |
  LDA $08                                   ; $0089B5 |
  STA !s_spr_wildcard_1_lo,x                ; $0089B7 |
  LDA $0A                                   ; $0089BA |
  STA !s_spr_wildcard_1_hi,x                ; $0089BC |
  LDA $0C                                   ; $0089BF |
  STA !s_spr_wildcard_2_lo,x                ; $0089C1 |
  LDA $0E                                   ; $0089C4 |
  STA !s_spr_wildcard_2_hi,x                ; $0089C6 |
  REP #$20                                  ; $0089C9 |
  RTL                                       ; $0089CB |

; pointer table (address - 1)
; main ambient sprite routines
  dw $8CBE, $8D03, $8D36, $8D74             ; $0089CC |
  dw $8D8E, $8DA4, $8DB1, $8DE6             ; $0089D4 |
  dw $8DF7, $8E15, $8E36, $8E5D             ; $0089DC |
  dw $8E7D, $8EEE, $8EFD, $8F0A             ; $0089E4 |
  dw $8F3A, $8F69, $8F9A, $8FD1             ; $0089EC |
  dw $9006, $9027, $9098, $90B9             ; $0089F4 |
  dw $90C2, $AD09, $90F5, $912C             ; $0089FC |
  dw $9153, $9518, $917A, $919F             ; $008A04 |
  dw $91C6, $9219, $9253, $927C             ; $008A0C |
  dw $92ED, $9375, $93A3, $93DD             ; $008A14 |
  dw $9432, $9518, $9547, $955E             ; $008A1C |
  dw $92AC, $92A4, $955E, $9518             ; $008A24 |
  dw $9518, $9518, $9518, $9547             ; $008A2C |
  dw $A7D9, $9530, $961A, $9530             ; $008A34 |
  dw $9645, $95CB, $9530, $986C             ; $008A3C |
  dw $986C, $9518, $958C, $986C             ; $008A44 |
  dw $9575, $9575, $9518, $9547             ; $008A4C |
  dw $9415, $9ADC, $9B12, $9530             ; $008A54 |
  dw $9518, $9530, $9530, $955E             ; $008A5C |
  dw $9B54, $9518, $9B87, $9BBB             ; $008A64 |
  dw $9BE2, $9C1C, $9E91, $9518             ; $008A6C |
  dw $9518, $951C, $A192, $A192             ; $008A74 |
  dw $A550, $A56E, $A599, $9ADC             ; $008A7C |
  dw $A6A8, $A6CD, $A834, $A6A8             ; $008A84 |
  dw $A725, $9B54, $A758, $A775             ; $008A8C |
  dw $9518, $A78C, $A7A3, $A7F6             ; $008A94 |
  dw $9530, $9518, $A80D, $9518             ; $008A9C |
  dw $8D95, $9219, $9518, $9518             ; $008AA4 |
  dw $98AB, $9912, $9997, $9A18             ; $008AAC |
  dw $9A65                                  ; $008AB4 |

handle_ambient_sprites:
  PHB                                       ; $008AB6 |
  PHK                                       ; $008AB7 |
  PLB                                       ; $008AB8 |
  LDA !s_sprite_disable_flag                ; $008AB9 |
  ORA $0B55                                 ; $008ABC |
  ORA !r_cur_item_used                      ; $008ABF |
  STA $0B8F                                 ; $008AC2 |
  LDX #$3C                                  ; $008AC5 |

CODE_008AC7:
  LDY $6EC0,x                               ; $008AC7 |
  BEQ CODE_008ACF                           ; $008ACA |
  JSR CODE_008AD7                           ; $008ACC |

CODE_008ACF:
  DEX                                       ; $008ACF |
  DEX                                       ; $008AD0 |
  DEX                                       ; $008AD1 |
  DEX                                       ; $008AD2 |
  BPL CODE_008AC7                           ; $008AD3 |
  PLB                                       ; $008AD5 |
  RTL                                       ; $008AD6 |

CODE_008AD7:
  LDA $7320,x                               ; $008AD7 |
  ASL A                                     ; $008ADA |
  REP #$10                                  ; $008ADB |
  TAY                                       ; $008ADD |
  LDA $8658,y                               ; $008ADE |
  SEP #$10                                  ; $008AE1 |
  PHA                                       ; $008AE3 |
  RTS                                       ; $008AE4 |

; generic ambient sprite routine
CODE_008AE5:
  LDA $0B8F                                 ; $008AE5 |
  BEQ CODE_008AF2                           ; $008AE8 |
  PLA                                       ; $008AEA |
  RTS                                       ; $008AEB |

; alt entry point
CODE_008AEC:
  LDA $0B8F                                 ; $008AEC |
  BEQ CODE_008AF2                           ; $008AEF |
  RTS                                       ; $008AF1 |

CODE_008AF2:
  LDA $7782,x                               ; $008AF2 |\
  BNE CODE_008B0D                           ; $008AF5 | | Remove Ambient sprite if timer is zero
  PLA                                       ; $008AF7 |/

CODE_008AF8:
  STZ $6EC0,x                               ; $008AF8 |
  LDA #$00FF                                ; $008AFB |
  STA $7462,x                               ; $008AFE |
  LDY $76E2,x                               ; $008B01 |
  BMI CODE_008B0C                           ; $008B04 |
  LDA $7ECE,y                               ; $008B06 |
  TRB $7ECC                                 ; $008B09 |

CODE_008B0C:
  RTS                                       ; $008B0C |

CODE_008B0D:
  DEC $7782,x                               ; $008B0D |
  LDA $7E8E,x                               ; $008B10 |
  BEQ CODE_008B18                           ; $008B13 |
  DEC $7E8E,x                               ; $008B15 |

CODE_008B18:
  LDY $7781,x                               ; $008B18 |
  BEQ CODE_008B20                           ; $008B1B |
  DEC $7781,x                               ; $008B1D |

CODE_008B20:
  RTS                                       ; $008B20 |

; this routine tries to find a free slot in the ambient sprite table
; if it fails, it will replace the oldest ambient sprite
; parameters:
; 16-bit A: ID of ambient sprite to spawn
spawn_ambient_sprite:
  PHA                                       ; $008B21 | preserve ID arg
  LDY #$3C                                  ; $008B22 | loop through ambients

.find_freeslot_loop
  LDA $6EC0,y                               ; $008B24 |\
  BEQ .init_data                            ; $008B27 | |
  DEY                                       ; $008B29 | | if state == $0000
  DEY                                       ; $008B2A | | done with loop and
  DEY                                       ; $008B2B | | spawn ambient
  DEY                                       ; $008B2C | |
  BPL .find_freeslot_loop                   ; $008B2D |/
  LDY $7E4A                                 ; $008B2F |\  if ambient table is full,
  DEY                                       ; $008B32 | | move ambient overwrite slot
  DEY                                       ; $008B33 | | down one and set that as new
  DEY                                       ; $008B34 | | overwrite slot, also spawn
  DEY                                       ; $008B35 | | and overwrite at that slot
  BPL .store_ambient_overwrite              ; $008B36 | | wrap below 0 -> $3C
  LDY #$3C                                  ; $008B38 |/

.store_ambient_overwrite
  STY $7E4A                                 ; $008B3A | stores new slot #

.init_data
  LDA #$0000                                ; $008B3D |\
  STA $71E0,y                               ; $008B40 | |
  STA $71E2,y                               ; $008B43 | |
  STA $73C0,y                               ; $008B46 | |
  STA $70A0,y                               ; $008B49 | |
  STA $7140,y                               ; $008B4C | |
  STA $7E4C,y                               ; $008B4F | |
  STA $7E4E,y                               ; $008B52 | |
  STA $7E8C,y                               ; $008B55 | |
  STA $7782,y                               ; $008B58 | | initialize ambient
  STA $7E8E,y                               ; $008B5B | | sprite tables
  STA $73C2,y                               ; $008B5E | | with $0000
  STA $7820,y                               ; $008B61 | |
  STA $6EC2,y                               ; $008B64 | |
  STA $76E0,y                               ; $008B67 | |
  STA $7640,y                               ; $008B6A | |
  STA $7642,y                               ; $008B6D | |
  STA $7500,y                               ; $008B70 | |
  STA $75A0,y                               ; $008B73 | |
  STA $7780,y                               ; $008B76 |/
  DEC A                                     ; $008B79 |\
  STA $7322,y                               ; $008B7A | | init these with $FFFF
  STA $76E2,y                               ; $008B7D |/
  LDA #$1FFF                                ; $008B80 |\ this with $1FFF
  STA $7822,y                               ; $008B83 |/
  PLA                                       ; $008B86 |\ arg -> sprite ID
  STA $7320,y                               ; $008B87 |/
  PHX                                       ; $008B8A | preserve X
  ASL A                                     ; $008B8B |\
  REP #$10                                  ; $008B8C | | preserve Y
  TAX                                       ; $008B8E | | and set up sprite ID << 2
  SEP #$20                                  ; $008B8F | | as index into bank $0A
  PHY                                       ; $008B91 | | sprite tables in ROM
  LDA $0AB59E,x                             ; $008B92 | |
  LDY #$0006                                ; $008B96 |/

CODE_008B99:
  CMP $6EB5,y                               ; $008B99 |
  BEQ CODE_008BA4                           ; $008B9C |
  DEY                                       ; $008B9E |
  BNE CODE_008B99                           ; $008B9F |
  TYA                                       ; $008BA1 |
  BRA CODE_008BA9                           ; $008BA2 |

CODE_008BA4:
  TYA                                       ; $008BA4 |
  ADC #$06                                  ; $008BA5 |
  ASL A                                     ; $008BA7 |
  ASL A                                     ; $008BA8 |

CODE_008BA9:
  REP #$20                                  ; $008BA9 |
  AND #$00FF                                ; $008BAB |
  PLY                                       ; $008BAE |
  STA $7140,y                               ; $008BAF |
  LDA $0AB19F,x                             ; $008BB2 |
  AND #$00FF                                ; $008BB6 |
  EOR #$0030                                ; $008BB9 |
  STA $7002,y                               ; $008BBC |
  LDA $0AB19E,x                             ; $008BBF |
  AND #$00FF                                ; $008BC3 |
  STA $7462,y                               ; $008BC6 |
  LDA $0AB39D,x                             ; $008BC9 |
  AND #$FF00                                ; $008BCD |
  BPL CODE_008BD5                           ; $008BD0 |
  ORA #$00FF                                ; $008BD2 |

CODE_008BD5:
  XBA                                       ; $008BD5 |
  STA $7502,y                               ; $008BD6 |
  LDA $0AB39E,x                             ; $008BD9 |
  AND #$FF00                                ; $008BDD |
  BPL CODE_008BE5                           ; $008BE0 |
  ORA #$00FF                                ; $008BE2 |

CODE_008BE5:
  XBA                                       ; $008BE5 |
  ASL A                                     ; $008BE6 |
  ASL A                                     ; $008BE7 |
  ASL A                                     ; $008BE8 |
  ASL A                                     ; $008BE9 |
  STA $75A2,y                               ; $008BEA |
  LDA $0AAB9E,x                             ; $008BED |
  STA $6F60,y                               ; $008BF1 |
  LDA $0AAD9E,x                             ; $008BF4 |
  STA $6F62,y                               ; $008BF8 |
  LDA $0AAF9E,x                             ; $008BFB |
  STA $7000,y                               ; $008BFF |
  LDA #$000E                                ; $008C02 |
  STA $6EC0,y                               ; $008C05 |
  LDA #$00FF                                ; $008C08 |
  STA $7460,y                               ; $008C0B |
  SEP #$10                                  ; $008C0E |
  PLX                                       ; $008C10 |
  RTL                                       ; $008C11 |

CODE_008C12:
  LDA $75A0,x                               ; $008C12 |
  SEC                                       ; $008C15 |
  SBC $71E0,x                               ; $008C16 |
  ASL A                                     ; $008C19 |
  LDA $7500,x                               ; $008C1A |
  BCC CODE_008C23                           ; $008C1D |
  EOR #$FFFF                                ; $008C1F |
  INC A                                     ; $008C22 |

CODE_008C23:
  CLC                                       ; $008C23 |
  ADC $71E0,x                               ; $008C24 |
  STA $71E0,x                               ; $008C27 |
  AND #$00FF                                ; $008C2A |
  XBA                                       ; $008C2D |
  CLC                                       ; $008C2E |
  ADC $70A0,x                               ; $008C2F |
  STA $70A0,x                               ; $008C32 |
  LDA $71E0,x                               ; $008C35 |
  AND #$FF00                                ; $008C38 |
  BPL CODE_008C40                           ; $008C3B |
  ORA #$00FF                                ; $008C3D |

CODE_008C40:
  XBA                                       ; $008C40 |
  ADC #$0000                                ; $008C41 |
  STA $7280,x                               ; $008C44 |
  CLC                                       ; $008C47 |
  ADC $70A2,x                               ; $008C48 |
  STA $70A2,x                               ; $008C4B |
  LDA $75A2,x                               ; $008C4E |
  SEC                                       ; $008C51 |
  SBC $71E2,x                               ; $008C52 |
  ASL A                                     ; $008C55 |
  LDA $7502,x                               ; $008C56 |
  BCC CODE_008C5F                           ; $008C59 |
  EOR #$FFFF                                ; $008C5B |
  INC A                                     ; $008C5E |

CODE_008C5F:
  CLC                                       ; $008C5F |
  ADC $71E2,x                               ; $008C60 |
  STA $71E2,x                               ; $008C63 |
  AND #$00FF                                ; $008C66 |
  XBA                                       ; $008C69 |
  CLC                                       ; $008C6A |
  ADC $7140,x                               ; $008C6B |
  STA $7140,x                               ; $008C6E |
  LDA $71E2,x                               ; $008C71 |
  AND #$FF00                                ; $008C74 |
  BPL CODE_008C7C                           ; $008C77 |
  ORA #$00FF                                ; $008C79 |

CODE_008C7C:
  XBA                                       ; $008C7C |
  ADC #$0000                                ; $008C7D |
  STA $7282,x                               ; $008C80 |
  CLC                                       ; $008C83 |
  ADC $7142,x                               ; $008C84 |
  STA $7142,x                               ; $008C87 |
  RTS                                       ; $008C8A |

  dw $0007, $0008, $0009, $000A             ; $008C8B |
  dw $0009, $0008, $0007, $0006             ; $008C93 |
  dw $0005, $0004, $0003, $0002             ; $008C9B |
  dw $0001, $0003, $0004, $0005             ; $008CA3 |
  dw $0004, $0003, $0003, $0003             ; $008CAB |
  dw $0003, $0003, $0003, $0003             ; $008CB3 |
  dw $0003, $0003                           ; $008CBB |

  JSR CODE_008AE5                           ; $008CBF |
  LDA $7782,x                               ; $008CC2 |
  BNE CODE_008CDF                           ; $008CC5 |
  LDA $7E4C,x                               ; $008CC7 |
  DEC A                                     ; $008CCA |
  DEC A                                     ; $008CCB |
  BPL CODE_008CCF                           ; $008CCC |
  RTS                                       ; $008CCE |

CODE_008CCF:
  STA $7E4C,x                               ; $008CCF |
  TAY                                       ; $008CD2 |
  LDA $8C8B,y                               ; $008CD3 |
  STA $73C2,x                               ; $008CD6 |
  LDA $8CA5,y                               ; $008CD9 |
  STA $7782,x                               ; $008CDC |

CODE_008CDF:
  RTS                                       ; $008CDF |

  dw $0000, $0002, $0001, $0001             ; $008CE0 |
  dw $0000, $0000, $0001, $0000             ; $008CE8 |
  dw $0000, $0000, $0000, $FFFF             ; $008CF0 |
  dw $0000, $0000, $FFFF, $FFFF             ; $008CF8 |
  dw $FFFE, $0000                           ; $008D00 |

  JSR CODE_008AE5                           ; $008D04 |
  LDA $7782,x                               ; $008D07 |
  ASL A                                     ; $008D0A |
  TAY                                       ; $008D0B |
  LDA $8CDE,y                               ; $008D0C |
  CLC                                       ; $008D0F |
  ADC $7142,x                               ; $008D10 |
  STA $7142,x                               ; $008D13 |
  RTS                                       ; $008D16 |

  dw $0001, $0000, $0000, $0000             ; $008D17 |
  dw $0000, $0000, $FFFF, $0000             ; $008D1F |
  dw $FFFF, $0000, $0000, $0000             ; $008D27 |
  dw $0000, $0000, $0001, $0000             ; $008D2F |

  JSR CODE_008AE5                           ; $008D37 |
  LDA $7822,x                               ; $008D3A |
  AND #$00FF                                ; $008D3D |
  STA $7782,x                               ; $008D40 |
  BNE CODE_008D48                           ; $008D43 |
  JMP CODE_008AF8                           ; $008D45 |

CODE_008D48:
  LDA #$00FF                                ; $008D48 |
  ORA $7822,x                               ; $008D4B |
  STA $7822,x                               ; $008D4E |
  LDA #$0002                                ; $008D51 |
  STA $7462,x                               ; $008D54 |
  INC $7E4C,x                               ; $008D57 |
  LDA $7E4C,x                               ; $008D5A |
  BIT #$0018                                ; $008D5D |
  BEQ CODE_008D65                           ; $008D60 |
  DEC $7142,x                               ; $008D62 |

CODE_008D65:
  AND #$000F                                ; $008D65 |
  ASL A                                     ; $008D68 |
  TAY                                       ; $008D69 |
  LDA $70A2,x                               ; $008D6A |
  CLC                                       ; $008D6D |
  ADC $8D17,y                               ; $008D6E |
  STA $70A2,x                               ; $008D71 |
  RTS                                       ; $008D74 |

  JSR CODE_008AE5                           ; $008D75 |
  LDA $7782,x                               ; $008D78 |
  BNE CODE_008D89                           ; $008D7B |
  INC $7782,x                               ; $008D7D |
  LDA $7002,x                               ; $008D80 |
  ORA #$0080                                ; $008D83 |
  STA $7002,x                               ; $008D86 |

CODE_008D89:
  RTS                                       ; $008D89 |

  db $40,$40,$FF,$00,$00                    ; $008D8A |

  JSR CODE_008AE5                           ; $008D8F |
  INC $73C2,x                               ; $008D92 |
  RTS                                       ; $008D95 |

  JSR CODE_008AEC                           ; $008D96 |
  LDA $14                                   ; $008D99 |
  LSR A                                     ; $008D9B |
  LSR A                                     ; $008D9C |
  LSR A                                     ; $008D9D |
  AND #$0003                                ; $008D9E |
  STA $73C2,x                               ; $008DA1 |
  RTS                                       ; $008DA4 |

  JSR CODE_008AEC                           ; $008DA5 |
  RTS                                       ; $008DA8 |

  db $02, $01, $00, $FF, $00, $06, $06, $06 ; $008DA9 |
  db $03                                    ; $008DB1 |

  JSR CODE_008AE5                           ; $008DB2 |
  SEP #$20                                  ; $008DB5 |
  LDY $7E4C,x                               ; $008DB7 |
  LDA $7782,x                               ; $008DBA |
  BNE CODE_008DD7                           ; $008DBD |
  DEC $7E4C,x                               ; $008DBF |
  BMI CODE_008DE4                           ; $008DC2 |
  DEY                                       ; $008DC4 |
  CPY #$03                                  ; $008DC5 |
  BNE CODE_008DD1                           ; $008DC7 |
  LDA $7000,x                               ; $008DC9 |
  AND #$FC                                  ; $008DCC |
  STA $7000,x                               ; $008DCE |

CODE_008DD1:
  LDA $8DAE,y                               ; $008DD1 |
  STA $7782,x                               ; $008DD4 |

CODE_008DD7:
  LDA $8DA9,y                               ; $008DD7 |
  STA $73C2,x                               ; $008DDA |
  BMI CODE_008DE1                           ; $008DDD |
  LDA #$06                                  ; $008DDF |

CODE_008DE1:
  STA $7462,x                               ; $008DE1 |

CODE_008DE4:
  REP #$20                                  ; $008DE4 |
  RTS                                       ; $008DE6 |

  JSR CODE_008AE5                           ; $008DE7 |
  SEP #$20                                  ; $008DEA |
  LDA $7782,x                               ; $008DEC |
  LSR A                                     ; $008DEF |
  LSR A                                     ; $008DF0 |
  LSR A                                     ; $008DF1 |
  STA $73C2,x                               ; $008DF2 |
  REP #$20                                  ; $008DF5 |
  RTS                                       ; $008DF7 |

  DEC $7782,x                               ; $008DF8 |
  LDA $7782,x                               ; $008DFB |
  BNE CODE_008E03                           ; $008DFE |
  JMP CODE_008AF8                           ; $008E00 |

CODE_008E03:
  CMP #$003F                                ; $008E03 |
  BCS CODE_008E0B                           ; $008E06 |
  DEC $7782,x                               ; $008E08 |

CODE_008E0B:
  SEP #$20                                  ; $008E0B |
  LSR A                                     ; $008E0D |
  AND #$07                                  ; $008E0E |
  STA $73C2,x                               ; $008E10 |
  REP #$20                                  ; $008E13 |
  RTS                                       ; $008E15 |

  JSR CODE_008AE5                           ; $008E16 |
  LDY $73C2,x                               ; $008E19 |
  LDA $7782,x                               ; $008E1C |
  BNE CODE_008E2F                           ; $008E1F |
  DEC $73C2,x                               ; $008E21 |
  BPL CODE_008E29                           ; $008E24 |
  JMP CODE_008AF8                           ; $008E26 |

CODE_008E29:
  LDA #$0002                                ; $008E29 |
  STA $7782,x                               ; $008E2C |

CODE_008E2F:
  RTS                                       ; $008E2F |

  db $09, $07, $06, $03, $02, $01, $00      ; $008E30 |

  JSR CODE_008AE5                           ; $008E37 |
  SEP #$20                                  ; $008E3A |
  LDY $7E4C,x                               ; $008E3C |
  LDA $7782,x                               ; $008E3F |
  BNE CODE_008E4F                           ; $008E42 |
  DEC $7E4C,x                               ; $008E44 |
  BMI CODE_008E55                           ; $008E47 |
  LDA $8E2F,y                               ; $008E49 |
  STA $7782,x                               ; $008E4C |

CODE_008E4F:
  LDA $8E33,y                               ; $008E4F |
  STA $73C2,x                               ; $008E52 |

CODE_008E55:
  REP #$20                                  ; $008E55 |
  RTS                                       ; $008E57 |

  db $06, $06, $06, $06, $04, $03           ; $008E58 |

  JSR CODE_008AE5                           ; $008E5E |
  SEP #$20                                  ; $008E61 |
  LDY $73C2,x                               ; $008E63 |
  LDA $7782,x                               ; $008E66 |
  BNE CODE_008E77                           ; $008E69 |
  DEY                                       ; $008E6B |
  BMI CODE_008E77                           ; $008E6C |
  DEC $73C2,x                               ; $008E6E |
  LDA $8E58,y                               ; $008E71 |
  STA $7782,x                               ; $008E74 |

CODE_008E77:
  REP #$20                                  ; $008E77 |
  RTS                                       ; $008E79 |

  db $06, $06, $05, $05                     ; $008E7A |

  JSR CODE_008AE5                           ; $008E7E |
  SEP #$20                                  ; $008E81 |
  LDY $73C2,x                               ; $008E83 |
  LDA $7782,x                               ; $008E86 |
  LSR A                                     ; $008E89 |
  BNE CODE_008E9A                           ; $008E8A |
  DEY                                       ; $008E8C |
  DEY                                       ; $008E8D |
  BMI CODE_008E9A                           ; $008E8E |
  TYA                                       ; $008E90 |
  STA $73C2,x                               ; $008E91 |
  LDA $8E7A,y                               ; $008E94 |
  STA $7782,x                               ; $008E97 |

CODE_008E9A:
  REP #$10                                  ; $008E9A |
  LDA $73C2,x                               ; $008E9C |
  LSR A                                     ; $008E9F |
  TXY                                       ; $008EA0 |
  LDX $7E4C,y                               ; $008EA1 |
  LDA $00E954,x                             ; $008EA4 |
  STA !reg_m7a                              ; $008EA8 |
  LDA $00E955,x                             ; $008EAB |
  STA !reg_m7a                              ; $008EAF |
  LDA #$FC                                  ; $008EB2 |
  BCC CODE_008EB8                           ; $008EB4 |
  LDA #$FE                                  ; $008EB6 |

CODE_008EB8:
  CLC                                       ; $008EB8 |
  ADC $7E4E,y                               ; $008EB9 |
  STA $7E4E,y                               ; $008EBC |
  STA !reg_m7b                              ; $008EBF |
  REP #$20                                  ; $008EC2 |
  LDA !reg_mpym                             ; $008EC4 |
  ASL A                                     ; $008EC7 |
  ASL A                                     ; $008EC8 |
  ASL A                                     ; $008EC9 |
  STA $71E0,y                               ; $008ECA |
  LDA $00E9D4,x                             ; $008ECD |
  SEP #$20                                  ; $008ED1 |
  STA !reg_m7a                              ; $008ED3 |
  XBA                                       ; $008ED6 |
  STA !reg_m7a                              ; $008ED7 |
  LDA $7E4E,y                               ; $008EDA |
  STA !reg_m7b                              ; $008EDD |
  REP #$20                                  ; $008EE0 |
  LDA !reg_mpym                             ; $008EE2 |
  ASL A                                     ; $008EE5 |
  ASL A                                     ; $008EE6 |
  ASL A                                     ; $008EE7 |
  STA $71E2,y                               ; $008EE8 |
  SEP #$10                                  ; $008EEB |
  TYX                                       ; $008EED |
  RTS                                       ; $008EEE |

  JSR CODE_008AE5                           ; $008EEF |
  LDA $71E2,x                               ; $008EF2 |
  BMI CODE_008EFD                           ; $008EF5 |
  LDA #$0001                                ; $008EF7 |
  STA $73C2,x                               ; $008EFA |

CODE_008EFD:
  RTS                                       ; $008EFD |

  JSR CODE_008AE5                           ; $008EFE |
  LDA $7782,x                               ; $008F01 |
  LSR A                                     ; $008F04 |
  LSR A                                     ; $008F05 |
  LSR A                                     ; $008F06 |
  STA $73C2,x                               ; $008F07 |
  RTS                                       ; $008F0A |

  JSR CODE_008AE5                           ; $008F0B |
  LDA $7782,x                               ; $008F0E |
  CMP #$0008                                ; $008F11 |
  BNE CODE_008F19                           ; $008F14 |
  INC $73C2,x                               ; $008F16 |

CODE_008F19:
  AND #$0007                                ; $008F19 |
  BNE CODE_008F2E                           ; $008F1C |
  LDA !s_rng                                ; $008F1E |
  AND #$0001                                ; $008F21 |
  BNE CODE_008F27                           ; $008F24 |
  DEC A                                     ; $008F26 |

CODE_008F27:
  CLC                                       ; $008F27 |
  ADC $70A2,x                               ; $008F28 |
  STA $70A2,x                               ; $008F2B |

CODE_008F2E:
  RTS                                       ; $008F2E |

  db $02, $02, $02, $01, $01, $01, $03, $03 ; $008F2F |
  db $03, $02, $02, $02                     ; $008F37 |

  JSR CODE_008AE5                           ; $008F3B |
  LDA $7782,x                               ; $008F3E |
  BNE CODE_008F5B                           ; $008F41 |
  SEP #$20                                  ; $008F43 |
  DEC $7E4C,x                               ; $008F45 |
  BEQ CODE_008F59                           ; $008F48 |
  LDY $7E4C,x                               ; $008F4A |
  LDA $8F34,y                               ; $008F4D |
  STA $7782,x                               ; $008F50 |
  LDA $8F2E,y                               ; $008F53 |
  STA $73C2,x                               ; $008F56 |

CODE_008F59:
  REP #$20                                  ; $008F59 |

CODE_008F5B:
  RTS                                       ; $008F5B |

  db $05, $04, $03, $01, $01, $02, $01, $03 ; $008F5C |
  db $03, $03, $03, $03, $04, $04           ; $008F64 |

  JSR CODE_008AE5                           ; $008F6A |
  LDA $7782,x                               ; $008F6D |
  BNE CODE_008F8A                           ; $008F70 |
  DEC $7E4C,x                               ; $008F72 |
  BMI CODE_008F8A                           ; $008F75 |
  SEP #$20                                  ; $008F77 |
  LDY $7E4C,x                               ; $008F79 |
  LDA $8F5C,y                               ; $008F7C |
  STA $73C2,x                               ; $008F7F |
  LDA $8F63,y                               ; $008F82 |
  STA $7782,x                               ; $008F85 |
  REP #$20                                  ; $008F88 |

CODE_008F8A:
  RTS                                       ; $008F8A |

  db $08, $07, $06, $05, $04, $03, $02, $01 ; $008F8B |
  db $40, $02, $02, $02, $02, $02, $02, $02 ; $008F93 |

  JSR CODE_008AE5                           ; $008F9B |
  LDA $7782,x                               ; $008F9E |
  BNE CODE_008FBB                           ; $008FA1 |
  DEC $7E4C,x                               ; $008FA3 |
  BMI CODE_008FBB                           ; $008FA6 |
  SEP #$20                                  ; $008FA8 |
  LDY $7E4C,x                               ; $008FAA |
  LDA $8F8B,y                               ; $008FAD |
  STA $73C2,x                               ; $008FB0 |
  LDA $8F93,y                               ; $008FB3 |
  STA $7782,x                               ; $008FB6 |
  REP #$20                                  ; $008FB9 |

CODE_008FBB:
  RTS                                       ; $008FBB |

  db $0B, $0A, $09, $08, $07, $06, $05, $04 ; $008FBC |
  db $03, $02, $01, $04, $04, $04, $04, $04 ; $008FC4 |
  db $04, $03, $03, $02, $02, $01           ; $008FCC |

  LDY $7E4E,x                               ; $008FD2 |
  BEQ CODE_008FE4                           ; $008FD5 |
  LDA $0B8F                                 ; $008FD7 |
  BEQ CODE_008FE4                           ; $008FDA |
  DEC $7782,x                               ; $008FDC |
  BPL CODE_008FE7                           ; $008FDF |
  JMP CODE_008AF8                           ; $008FE1 |

CODE_008FE4:
  JSR CODE_008AE5                           ; $008FE4 |

CODE_008FE7:
  LDA $7782,x                               ; $008FE7 |
  BNE CODE_009004                           ; $008FEA |
  DEC $7E4C,x                               ; $008FEC |
  BMI CODE_009004                           ; $008FEF |
  SEP #$20                                  ; $008FF1 |
  LDY $7E4C,x                               ; $008FF3 |
  LDA $8FBC,y                               ; $008FF6 |
  STA $73C2,x                               ; $008FF9 |
  LDA $8FC7,y                               ; $008FFC |
  STA $7782,x                               ; $008FFF |
  REP #$20                                  ; $009002 |

CODE_009004:
  RTS                                       ; $009004 |

  db $01, $11                               ; $009005 |

  JSR CODE_008AE5                           ; $009007 |
  LDA $7782,x                               ; $00900A |
  BNE CODE_009027                           ; $00900D |
  DEC $7E4C,x                               ; $00900F |
  BMI CODE_009027                           ; $009012 |
  SEP #$20                                  ; $009014 |
  LDY $7E4C,x                               ; $009016 |
  LDA $9005,y                               ; $009019 |
  STA $73C2,x                               ; $00901C |
  LDA $9006,y                               ; $00901F |
  STA $7782,x                               ; $009022 |
  REP #$20                                  ; $009025 |

CODE_009027:
  RTS                                       ; $009027 |

  JSR CODE_008AE5                           ; $009028 |
  LDY $7E4C,x                               ; $00902B |
  LDA !s_spr_x_pixel_pos,y                  ; $00902E |
  STA $00                                   ; $009031 |
  LDA !s_spr_y_pixel_pos,y                  ; $009033 |
  CLC                                       ; $009036 |
  ADC #$0008                                ; $009037 |
  STA $02                                   ; $00903A |
  LDA $7E4E,x                               ; $00903C |
  STA $06                                   ; $00903F |
  LDA $7E8C,x                               ; $009041 |
  STA $04                                   ; $009044 |
  LDA $70A2,x                               ; $009046 |
  STA $08                                   ; $009049 |
  LDA $7142,x                               ; $00904B |
  STA $0A                                   ; $00904E |
  JSL $049B42                               ; $009050 |
  LDA $04                                   ; $009054 |
  STA $7E8C,x                               ; $009056 |
  BPL CODE_009061                           ; $009059 |
  EOR #$FFFF                                ; $00905B |
  INC A                                     ; $00905E |
  STA $04                                   ; $00905F |

CODE_009061:
  LDA $06                                   ; $009061 |
  STA $7E4E,x                               ; $009063 |
  BPL CODE_00906C                           ; $009066 |
  EOR #$FFFF                                ; $009068 |
  INC A                                     ; $00906B |

CODE_00906C:
  CLC                                       ; $00906C |
  ADC $04                                   ; $00906D |
  CMP #$0030                                ; $00906F |
  BCS CODE_00907A                           ; $009072 |
  LDA #$0001                                ; $009074 |
  STA $73C2,x                               ; $009077 |

CODE_00907A:
  LDA $08                                   ; $00907A |
  STA $70A2,x                               ; $00907C |
  LDA $0A                                   ; $00907F |
  STA $7142,x                               ; $009081 |
  RTS                                       ; $009084 |

  db $0A, $09, $08, $07, $06, $05, $04, $03 ; $009085 |
  db $02, $01, $05, $05, $05, $04, $04, $04 ; $00908D |
  db $03, $03, $02, $02                     ; $009095 |

  JSR CODE_008AE5                           ; $009099 |
  LDA $7782,x                               ; $00909C |
  BNE CODE_0090B9                           ; $00909F |
  DEC $7E4C,x                               ; $0090A1 |
  BMI CODE_0090B9                           ; $0090A4 |
  SEP #$20                                  ; $0090A6 |
  LDY $7E4C,x                               ; $0090A8 |
  LDA $9085,y                               ; $0090AB |
  STA $73C2,x                               ; $0090AE |
  LDA $908F,y                               ; $0090B1 |
  STA $7782,x                               ; $0090B4 |
  REP #$20                                  ; $0090B7 |

CODE_0090B9:
  RTS                                       ; $0090B9 |

  JSR CODE_008AEC                           ; $0090BA |
  RTS                                       ; $0090BD |

  db $06, $04, $04, $03, $03                ; $0090BE |

  JSR CODE_008AE5                           ; $0090C3 |
  LDA $7782,x                               ; $0090C6 |
  BNE CODE_0090DF                           ; $0090C9 |
  DEC $73C2,x                               ; $0090CB |
  BPL CODE_0090D3                           ; $0090CE |
  JMP CODE_008AF8                           ; $0090D0 |

CODE_0090D3:
  LDY $73C2,x                               ; $0090D3 |
  LDA $90BE,y                               ; $0090D6 |
  AND #$00FF                                ; $0090D9 |
  STA $7782,x                               ; $0090DC |

CODE_0090DF:
  RTS                                       ; $0090DF |

  db $0B, $0A, $09, $08, $07, $06, $05, $04 ; $0090E0 |
  db $03, $02, $01, $06, $06, $06, $06, $06 ; $0090E8 |
  db $06, $06, $03, $03, $03, $03           ; $0090F0 |

  LDY $7E4E,x                               ; $0090F6 |
  BEQ CODE_009100                           ; $0090F9 |
  JSR CODE_008AF2                           ; $0090FB |
  BRA CODE_009103                           ; $0090FE |

CODE_009100:
  JSR CODE_008AE5                           ; $009100 |

CODE_009103:
  LDA $7782,x                               ; $009103 |
  BNE CODE_009120                           ; $009106 |
  DEC $7E4C,x                               ; $009108 |
  BMI CODE_009120                           ; $00910B |
  SEP #$20                                  ; $00910D |
  LDY $7E4C,x                               ; $00910F |
  LDA $90E0,y                               ; $009112 |
  STA $73C2,x                               ; $009115 |
  LDA $90EB,y                               ; $009118 |
  STA $7782,x                               ; $00911B |
  REP #$20                                  ; $00911E |

CODE_009120:
  RTS                                       ; $009120 |

  db $06, $05, $04, $03, $02, $01, $04, $08 ; $009121 |
  db $08, $08, $04, $02                     ; $009129 |

  JSR CODE_008AE5                           ; $00912D |
  LDA $7782,x                               ; $009130 |
  BNE CODE_00914D                           ; $009133 |
  DEC $7E4C,x                               ; $009135 |
  BMI CODE_00914D                           ; $009138 |
  SEP #$20                                  ; $00913A |
  LDY $7E4C,x                               ; $00913C |
  LDA $9121,y                               ; $00913F |
  STA $73C2,x                               ; $009142 |
  LDA $9127,y                               ; $009145 |
  STA $7782,x                               ; $009148 |
  REP #$20                                  ; $00914B |

CODE_00914D:
  RTS                                       ; $00914D |

  db $03, $02, $01, $06, $04, $02           ; $00914E |

  JSR CODE_008AE5                           ; $009154 |
  LDA $7782,x                               ; $009157 |
  BNE CODE_009174                           ; $00915A |
  DEC $7E4C,x                               ; $00915C |
  BMI CODE_009174                           ; $00915F |
  SEP #$20                                  ; $009161 |
  LDY $7E4C,x                               ; $009163 |
  LDA $914E,y                               ; $009166 |
  STA $73C2,x                               ; $009169 |
  LDA $9151,y                               ; $00916C |
  STA $7782,x                               ; $00916F |
  REP #$20                                  ; $009172 |

CODE_009174:
  RTS                                       ; $009174 |

  db $03, $02, $01, $06, $04, $02           ; $009175 |

  JSR CODE_008AE5                           ; $00917B |
  LDA $7782,x                               ; $00917E |
  BNE CODE_00919B                           ; $009181 |
  DEC $7E4C,x                               ; $009183 |
  BMI CODE_00919B                           ; $009186 |
  SEP #$20                                  ; $009188 |
  LDY $7E4C,x                               ; $00918A |
  LDA $9175,y                               ; $00918D |
  STA $73C2,x                               ; $009190 |
  LDA $9178,y                               ; $009193 |
  STA $7782,x                               ; $009196 |
  REP #$20                                  ; $009199 |

CODE_00919B:
  RTS                                       ; $00919B |

  db $02, $01, $0C, $08                     ; $00919C |

  JSR CODE_008AE5                           ; $0091A0 |
  LDA $7782,x                               ; $0091A3 |
  BNE CODE_0091C0                           ; $0091A6 |
  DEC $7E4C,x                               ; $0091A8 |
  BMI CODE_0091C0                           ; $0091AB |
  SEP #$20                                  ; $0091AD |
  LDY $7E4C,x                               ; $0091AF |
  LDA $919C,y                               ; $0091B2 |
  STA $73C2,x                               ; $0091B5 |
  LDA $919E,y                               ; $0091B8 |
  STA $7782,x                               ; $0091BB |
  REP #$20                                  ; $0091BE |

CODE_0091C0:
  RTS                                       ; $0091C0 |

  db $03, $02, $01, $08, $08, $04           ; $0091C1 |

  JSR CODE_008C12                           ; $0091C7 |
  LDA $75A0,x                               ; $0091CA |
  CMP $71E0,x                               ; $0091CD |
  BNE CODE_0091D9                           ; $0091D0 |
  EOR #$FFFF                                ; $0091D2 |
  INC A                                     ; $0091D5 |
  STA $75A0,x                               ; $0091D6 |

CODE_0091D9:
  LDA $75A2,x                               ; $0091D9 |
  CMP $71E2,x                               ; $0091DC |
  BNE CODE_0091E8                           ; $0091DF |
  EOR #$FFFF                                ; $0091E1 |
  INC A                                     ; $0091E4 |
  STA $75A2,x                               ; $0091E5 |

CODE_0091E8:
  DEC $7782,x                               ; $0091E8 |
  BNE CODE_009213                           ; $0091EB |
  DEC $7E4C,x                               ; $0091ED |
  BPL CODE_0091F6                           ; $0091F0 |
  JSR CODE_008AF8                           ; $0091F2 |
  RTS                                       ; $0091F5 |

CODE_0091F6:
  SEP #$20                                  ; $0091F6 |
  LDY $7E4C,x                               ; $0091F8 |
  LDA $91C1,y                               ; $0091FB |
  STA $73C2,x                               ; $0091FE |
  LDA $91C4,y                               ; $009201 |
  STA $7782,x                               ; $009204 |
  REP #$20                                  ; $009207 |
  CPY #$02                                  ; $009209 |
  BMI CODE_009213                           ; $00920B |
  LDA #$0080                                ; $00920D |
  STA $71E2,x                               ; $009210 |

CODE_009213:
  RTS                                       ; $009213 |

  db $03, $02, $01, $08, $08, $08           ; $009214 |

  JSR CODE_008C12                           ; $00921A |
  JSR CODE_008AF2                           ; $00921D |
  LDA $7782,x                               ; $009220 |
  BNE CODE_00923D                           ; $009223 |
  DEC $7E4C,x                               ; $009225 |
  BMI CODE_00923D                           ; $009228 |
  SEP #$20                                  ; $00922A |
  LDY $7E4C,x                               ; $00922C |
  LDA $9214,y                               ; $00922F |
  STA $73C2,x                               ; $009232 |
  LDA $9217,y                               ; $009235 |
  STA $7782,x                               ; $009238 |
  REP #$20                                  ; $00923B |

CODE_00923D:
  RTS                                       ; $00923D |

  db $0B, $0A, $09, $08, $07, $06, $05, $04 ; $00923E |
  db $03, $02, $01, $01, $01, $01, $01, $01 ; $009246 |
  db $01, $01, $01, $01, $01, $02           ; $00924E |

  JSR CODE_008AE5                           ; $009254 |
  LDA $7782,x                               ; $009257 |
  BNE CODE_009274                           ; $00925A |
  DEC $7E4C,x                               ; $00925C |
  BMI CODE_009274                           ; $00925F |
  SEP #$20                                  ; $009261 |
  LDY $7E4C,x                               ; $009263 |
  LDA $923E,y                               ; $009266 |
  STA $73C2,x                               ; $009269 |
  LDA $9249,y                               ; $00926C |
  STA $7782,x                               ; $00926F |
  REP #$20                                  ; $009272 |

CODE_009274:
  RTS                                       ; $009274 |

  db $04, $03, $02, $01, $06, $06, $06, $06 ; $009275 |

  JSR CODE_008AE5                           ; $00927D |
  LDA $7782,x                               ; $009280 |
  BNE CODE_00929D                           ; $009283 |
  DEC $7E4C,x                               ; $009285 |
  BMI CODE_00929D                           ; $009288 |
  SEP #$20                                  ; $00928A |
  LDY $7E4C,x                               ; $00928C |
  LDA $9275,y                               ; $00928F |
  STA $73C2,x                               ; $009292 |
  LDA $9279,y                               ; $009295 |
  STA $7782,x                               ; $009298 |
  REP #$20                                  ; $00929B |

CODE_00929D:
  RTS                                       ; $00929D |

  db $03, $03, $03, $03, $03, $03, $03, $AD ; $00929E |
  db $8F, $0B, $F0, $03                     ; $0092A6 |

  JSR CODE_008C12                           ; $0092AA |
  JSR CODE_008AF2                           ; $0092AD |
  LDA $7782,x                               ; $0092B0 |
  BNE CODE_0092CB                           ; $0092B3 |
  DEC $7E4C,x                               ; $0092B5 |
  BMI CODE_0092CB                           ; $0092B8 |
  SEP #$20                                  ; $0092BA |
  LDY $7E4C,x                               ; $0092BC |
  TYA                                       ; $0092BF |
  STA $73C2,x                               ; $0092C0 |
  LDA $929E,y                               ; $0092C3 |
  STA $7782,x                               ; $0092C6 |
  REP #$20                                  ; $0092C9 |

CODE_0092CB:
  RTS                                       ; $0092CB |

  db $03, $02, $00, $01, $08, $00, $FA, $FF ; $0092CC |
  db $FD, $FF, $01, $00, $09, $00, $F8, $FF ; $0092D4 |
  db $06, $00, $03, $00, $FF, $FF, $F7, $FF ; $0092DC |
  db $FE, $FF, $04, $00, $FE, $FF, $FC, $FF ; $0092E4 |
  db $FB, $FF                               ; $0092EC |

  LDY $7E4E,x                               ; $0092EE |
  LDA !s_spr_facing_dir,y                   ; $0092F1 |
  STA $00                                   ; $0092F4 |
  LDA !s_spr_anim_frame,y                   ; $0092F6 |
  SEC                                       ; $0092F9 |
  SBC #$001B                                ; $0092FA |
  ASL A                                     ; $0092FD |
  PHY                                       ; $0092FE |
  TAY                                       ; $0092FF |
  LDA $00                                   ; $009300 |
  BEQ CODE_009309                           ; $009302 |
  LDA $92DA,y                               ; $009304 |
  BRA CODE_00930C                           ; $009307 |

CODE_009309:
  LDA $92D0,y                               ; $009309 |

CODE_00930C:
  STA $00                                   ; $00930C |
  LDA $92E4,y                               ; $00930E |
  STA $02                                   ; $009311 |
  PLY                                       ; $009313 |
  LDA !s_spr_x_pixel_pos,y                  ; $009314 |
  CLC                                       ; $009317 |
  ADC $00                                   ; $009318 |
  CLC                                       ; $00931A |
  ADC $78C0,x                               ; $00931B |
  CMP $70A2,x                               ; $00931E |
  BEQ CODE_00932D                           ; $009321 |
  BMI CODE_00932A                           ; $009323 |
  INC $70A2,x                               ; $009325 |
  BRA CODE_00932D                           ; $009328 |

CODE_00932A:
  DEC $70A2,x                               ; $00932A |

CODE_00932D:
  LDA !s_spr_y_pixel_pos,y                  ; $00932D |
  CLC                                       ; $009330 |
  ADC $02                                   ; $009331 |
  CLC                                       ; $009333 |
  ADC $78C2,x                               ; $009334 |
  CMP $7142,x                               ; $009337 |
  BEQ CODE_009346                           ; $00933A |
  BMI CODE_009343                           ; $00933C |
  INC $7142,x                               ; $00933E |
  BRA CODE_009346                           ; $009341 |

CODE_009343:
  DEC $7142,x                               ; $009343 |

CODE_009346:
  DEC $7782,x                               ; $009346 |
  BNE CODE_009370                           ; $009349 |
  DEC $7E4C,x                               ; $00934B |
  BPL CODE_009354                           ; $00934E |
  JSR CODE_008AF8                           ; $009350 |
  RTS                                       ; $009353 |

CODE_009354:
  SEP #$20                                  ; $009354 |
  LDY $7E4C,x                               ; $009356 |
  LDA $92CC,y                               ; $009359 |
  STA $73C2,x                               ; $00935C |
  LDA #$04                                  ; $00935F |
  STA $7782,x                               ; $009361 |
  REP #$20                                  ; $009364 |
  CPY #$02                                  ; $009366 |
  BMI CODE_009370                           ; $009368 |
  LDA #$0080                                ; $00936A |
  STA $71E2,x                               ; $00936D |

CODE_009370:
  RTS                                       ; $009370 |

  db $03, $02, $01, $00, $04                ; $009371 |

  LDY $7E4E,x                               ; $009376 |
  BEQ CODE_009380                           ; $009379 |
  JSR CODE_008AF2                           ; $00937B |
  BRA CODE_009383                           ; $00937E |

CODE_009380:
  JSR CODE_008AE5                           ; $009380 |

CODE_009383:
  LDA $7782,x                               ; $009383 |
  BNE CODE_00939F                           ; $009386 |
  DEC $7E4C,x                               ; $009388 |
  BMI CODE_00939F                           ; $00938B |
  SEP #$20                                  ; $00938D |
  LDY $7E4C,x                               ; $00938F |
  LDA $9371,y                               ; $009392 |
  STA $73C2,x                               ; $009395 |
  LDA #$04                                  ; $009398 |
  STA $7782,x                               ; $00939A |
  REP #$20                                  ; $00939D |

CODE_00939F:
  RTS                                       ; $00939F |

  db $04, $03, $02, $01                     ; $0093A0 |

  JSR CODE_008AE5                           ; $0093A4 |
  LDA $7782,x                               ; $0093A7 |
  BNE CODE_0093C3                           ; $0093AA |
  DEC $7E4C,x                               ; $0093AC |
  BMI CODE_0093C3                           ; $0093AF |
  SEP #$20                                  ; $0093B1 |
  LDY $7E4C,x                               ; $0093B3 |
  LDA $93A0,y                               ; $0093B6 |
  STA $73C2,x                               ; $0093B9 |
  LDA #$04                                  ; $0093BC |
  STA $7782,x                               ; $0093BE |
  REP #$20                                  ; $0093C1 |

CODE_0093C3:
  RTS                                       ; $0093C3 |

  db $09, $08, $07, $06, $05, $04, $03, $02 ; $0093C4 |
  db $01, $00, $FF, $00, $FF, $03, $03, $03 ; $0093CC |
  db $03, $03, $02, $02, $02, $01, $03, $01 ; $0093D4 |
  db $01, $01                               ; $0093DC |

  JSR CODE_008AF2                           ; $0093DE |
  LDA $7782,x                               ; $0093E1 |
  BNE CODE_00940F                           ; $0093E4 |
  DEC $7E4C,x                               ; $0093E6 |
  BMI CODE_00940F                           ; $0093E9 |
  SEP #$20                                  ; $0093EB |
  LDY $7E4C,x                               ; $0093ED |
  LDA $93C4,y                               ; $0093F0 |
  BPL CODE_0093FF                           ; $0093F3 |
  LDA $7E4E,x                               ; $0093F5 |
  BPL CODE_0093FF                           ; $0093F8 |
  STA $7462,x                               ; $0093FA |
  BRA CODE_009407                           ; $0093FD |

CODE_0093FF:
  STA $73C2,x                               ; $0093FF |
  LDA #$02                                  ; $009402 |
  STA $7462,x                               ; $009404 |

CODE_009407:
  LDA $93D1,y                               ; $009407 |
  STA $7782,x                               ; $00940A |
  REP #$20                                  ; $00940D |

CODE_00940F:
  RTS                                       ; $00940F |

  db $02, $04, $06, $0A, $06, $04           ; $009410 |

  JSR CODE_008AE5                           ; $009416 |
  LDA $7782,x                               ; $009419 |
  BNE CODE_009432                           ; $00941C |
  DEC $73C2,x                               ; $00941E |
  BPL CODE_009426                           ; $009421 |
  JMP CODE_008AF8                           ; $009423 |

CODE_009426:
  LDY $73C2,x                               ; $009426 |
  LDA $9410,y                               ; $009429 |
  AND #$00FF                                ; $00942C |
  STA $7782,x                               ; $00942F |

CODE_009432:
  RTS                                       ; $009432 |

  LDA $7322,x                               ; $009433 |
  BPL CODE_009446                           ; $009436 |
  LDA $61CE                                 ; $009438 |
  BEQ CODE_009443                           ; $00943B |
  LDA #$0006                                ; $00943D |
  STA $7462,x                               ; $009440 |

CODE_009443:
  JMP CODE_009503                           ; $009443 |

CODE_009446:
  LDA $61CE                                 ; $009446 |
  BEQ CODE_009474                           ; $009449 |
  LDA $70A2,x                               ; $00944B |
  STA !gsu_r1                               ; $00944E |
  LDA $7142,x                               ; $009451 |
  STA !gsu_r2                               ; $009454 |
  LDA $7E8C,x                               ; $009457 |
  STA !gsu_r3                               ; $00945A |
  LDA $7322,x                               ; $00945D |
  STA !gsu_r5                               ; $009460 |
  LDA #$0004                                ; $009463 |
  STA !gsu_r7                               ; $009466 |
  PHX                                       ; $009469 |
  LDX #$09                                  ; $00946A |
  LDA #$F5F4                                ; $00946C |
  JSL r_gsu_init_1                          ; $00946F |  GSU init
  PLX                                       ; $009473 |

CODE_009474:
  REP #$10                                  ; $009474 |
  TAY                                       ; $009476 |
  LDA $7E4E,x                               ; $009477 |
  BNE CODE_009485                           ; $00947A |
  LDA #$0010                                ; $00947C |
  SEC                                       ; $00947F |
  SBC $7E4C,x                               ; $009480 |
  BPL CODE_009488                           ; $009483 |

CODE_009485:
  LDA #$0000                                ; $009485 |

CODE_009488:
  STA $00                                   ; $009488 |
  LDA $6000,y                               ; $00948A |
  SEC                                       ; $00948D |
  SBC $00                                   ; $00948E |
  STA $6000,y                               ; $009490 |
  LDA $6002,y                               ; $009493 |
  SEC                                       ; $009496 |
  SBC $00                                   ; $009497 |
  STA $6002,y                               ; $009499 |
  LDA $6008,y                               ; $00949C |
  CLC                                       ; $00949F |
  ADC $00                                   ; $0094A0 |
  STA $6008,y                               ; $0094A2 |
  LDA $600A,y                               ; $0094A5 |
  SEC                                       ; $0094A8 |
  SBC $00                                   ; $0094A9 |
  STA $600A,y                               ; $0094AB |
  LDA $6010,y                               ; $0094AE |
  SEC                                       ; $0094B1 |
  SBC $00                                   ; $0094B2 |
  STA $6010,y                               ; $0094B4 |
  LDA $6012,y                               ; $0094B7 |
  CLC                                       ; $0094BA |
  ADC $00                                   ; $0094BB |
  STA $6012,y                               ; $0094BD |
  LDA $6018,y                               ; $0094C0 |
  CLC                                       ; $0094C3 |
  ADC $00                                   ; $0094C4 |
  STA $6018,y                               ; $0094C6 |
  LDA $601A,y                               ; $0094C9 |
  CLC                                       ; $0094CC |
  ADC $00                                   ; $0094CD |
  STA $601A,y                               ; $0094CF |
  BRA CODE_009501                           ; $0094D2 |
; dead code
  LDA #$0020                                ; $0094D4 |
  SEC                                       ; $0094D7 |
  SBC $7E4C,x                               ; $0094D8 |
  STA $00                                   ; $0094DB |
  LDA $6002,y                               ; $0094DD |
  CLC                                       ; $0094E0 |
  ADC $00                                   ; $0094E1 |
  STA $6002,y                               ; $0094E3 |
  LDA $6008,y                               ; $0094E6 |
  SEC                                       ; $0094E9 |
  SBC $00                                   ; $0094EA |
  STA $6008,y                               ; $0094EC |
  LDA $6010,y                               ; $0094EF |
  CLC                                       ; $0094F2 |
  ADC $00                                   ; $0094F3 |
  STA $6010,y                               ; $0094F5 |
  LDA $601A,y                               ; $0094F8 |
  SEC                                       ; $0094FB |
  SBC $00                                   ; $0094FC |
  STA $601A,y                               ; $0094FE |
; end dead code

CODE_009501:
  SEP #$10                                  ; $009501 |

CODE_009503:
  JSR CODE_008AF2                           ; $009503 |
  LDA $7E4C,x                               ; $009506 |
  CLC                                       ; $009509 |
  ADC #$0004                                ; $00950A |
  CMP #$0020                                ; $00950D |
  BCC CODE_009515                           ; $009510 |
  LDA #$0020                                ; $009512 |

CODE_009515:
  STA $7E4C,x                               ; $009515 |
  RTS                                       ; $009518 |

  JSR CODE_008AEC                           ; $009519 |
  RTS                                       ; $00951C |

  JSR CODE_008AE5                           ; $00951D |
  LDA $7782,x                               ; $009520 |
  BNE CODE_00952D                           ; $009523 |
  INC $7782,x                               ; $009525 |
  DEC $73C2,x                               ; $009528 |
  BMI CODE_00952E                           ; $00952B |

CODE_00952D:
  RTS                                       ; $00952D |

CODE_00952E:
  JMP CODE_008AF8                           ; $00952E |

; an ambient sprite main routine
  JSR CODE_008AE5                           ; $009531 |
  LDA $7782,x                               ; $009534 |
  BNE CODE_009544                           ; $009537 |
  LDA #$0002                                ; $009539 |
  STA $7782,x                               ; $00953C |
  DEC $73C2,x                               ; $00953F |
  BMI CODE_009545                           ; $009542 |

CODE_009544:
  RTS                                       ; $009544 |

CODE_009545:
  JMP CODE_008AF8                           ; $009545 |

; an ambient sprite main routine
  JSR CODE_008AE5                           ; $009548 |
  LDA $7782,x                               ; $00954B |
  BNE CODE_00955B                           ; $00954E |
  LDA #$0003                                ; $009550 |
  STA $7782,x                               ; $009553 |
  DEC $73C2,x                               ; $009556 |
  BMI CODE_00955C                           ; $009559 |

CODE_00955B:
  RTS                                       ; $00955B |

CODE_00955C:
  JMP CODE_008AF8                           ; $00955C |

  JSR CODE_008AE5                           ; $00955F |
  LDA $7782,x                               ; $009562 |
  BNE CODE_009572                           ; $009565 |
  LDA #$0004                                ; $009567 |
  STA $7782,x                               ; $00956A |
  DEC $73C2,x                               ; $00956D |
  BMI CODE_009573                           ; $009570 |

CODE_009572:
  RTS                                       ; $009572 |

CODE_009573:
  JMP CODE_008AF8                           ; $009573 |

  JSR CODE_008AE5                           ; $009576 |
  LDA $7782,x                               ; $009579 |
  BNE CODE_009589                           ; $00957C |
  LDA #$0006                                ; $00957E |
  STA $7782,x                               ; $009581 |
  DEC $73C2,x                               ; $009584 |
  BMI CODE_00958A                           ; $009587 |

CODE_009589:
  RTS                                       ; $009589 |

CODE_00958A:
  JMP CODE_008AF8                           ; $00958A |

  JSR CODE_008AE5                           ; $00958D |
  LDA $7782,x                               ; $009590 |
  BNE CODE_0095A0                           ; $009593 |
  LDA #$0008                                ; $009595 |
  STA $7782,x                               ; $009598 |
  DEC $73C2,x                               ; $00959B |
  BMI CODE_0095A1                           ; $00959E |

CODE_0095A0:
  RTS                                       ; $0095A0 |

CODE_0095A1:
  JMP CODE_008AF8                           ; $0095A1 |

  db $20, $00, $22, $00, $20, $80, $02, $40 ; $0095A4 |
  db $00, $00, $02, $00, $20, $00, $22, $00 ; $0095AC |
  db $20, $80, $02, $80                     ; $0095B4 |

  db $00, $00, $00, $00, $00, $80, $00, $40 ; $0095B8 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0095C0 |
  db $00, $80, $00, $80                     ; $0095C8 |

  LDA $7322,x                               ; $0095CC |
  BMI CODE_0095F3                           ; $0095CF |
  LDY $7E4E,x                               ; $0095D1 |
  LDA $95A4,y                               ; $0095D4 |
  STA $00                                   ; $0095D7 |
  LDA $95B8,y                               ; $0095D9 |
  STA $02                                   ; $0095DC |
  REP #$10                                  ; $0095DE |
  LDY $7322,x                               ; $0095E0 |
  LDA $6004,y                               ; $0095E3 |
  ORA $00                                   ; $0095E6 |
  EOR $02                                   ; $0095E8 |
  CLC                                       ; $0095EA |
  ADC $7E8C,x                               ; $0095EB |
  STA $6004,y                               ; $0095EE |
  SEP #$10                                  ; $0095F1 |

CODE_0095F3:
  JSR CODE_008AE5                           ; $0095F3 |
  LDA $7E8E,x                               ; $0095F6 |
  BNE CODE_009613                           ; $0095F9 |
  LDA $78C0,x                               ; $0095FB |
  STA $7E8E,x                               ; $0095FE |
  LDA $7E4E,x                               ; $009601 |
  CLC                                       ; $009604 |
  ADC #$0002                                ; $009605 |
  STA $7E4E,x                               ; $009608 |
  CMP #$0014                                ; $00960B |
  BMI CODE_009613                           ; $00960E |
  STZ $7E4E,x                               ; $009610 |

CODE_009613:
  RTS                                       ; $009613 |

  db $04, $03, $02, $01, $00, $00, $00      ; $009614 |

  JSR CODE_008AE5                           ; $00961B |
  LDA $7782,x                               ; $00961E |
  BNE CODE_00963A                           ; $009621 |
  DEC $7E4C,x                               ; $009623 |
  BMI CODE_00963A                           ; $009626 |
  SEP #$20                                  ; $009628 |
  LDY $7E4C,x                               ; $00962A |
  LDA $9614,y                               ; $00962D |
  STA $73C2,x                               ; $009630 |
  LDA #$04                                  ; $009633 |
  STA $7782,x                               ; $009635 |
  REP #$20                                  ; $009638 |

CODE_00963A:
  RTS                                       ; $00963A |

  db $04, $04, $04, $04, $04, $04, $04, $03 ; $00963B |
  db $03, $02, $02                          ; $009643 |

  PHX                                       ; $009646 |
  TXA                                       ; $009647 |
  AND #$00FF                                ; $009648 |
  STA !gsu_r10                              ; $00964B |  r10
  LDA #$0000                                ; $00964E |
  STA !gsu_r0                               ; $009651 |
  LDA #$9693                                ; $009654 |
  STA !gsu_r14                              ; $009657 |  r14
  LDX #$09                                  ; $00965A |
  LDA #$8CB1                                ; $00965C |
  JSL r_gsu_init_1                          ; $00965F |  GSU init
  PLX                                       ; $009663 |
  JSR CODE_008AE5                           ; $009664 |
  LDA $7782,x                               ; $009667 |
  BNE CODE_009687                           ; $00966A |
  DEC $73C2,x                               ; $00966C |
  BPL CODE_009674                           ; $00966F |
  JMP CODE_008AF8                           ; $009671 |

CODE_009674:
  SEP #$20                                  ; $009674 |
  LDY $73C2,x                               ; $009676 |
  LDA $9688,y                               ; $009679 |
  STA $7001,x                               ; $00967C |
  LDA $963B,y                               ; $00967F |
  STA $7782,x                               ; $009682 |
  REP #$20                                  ; $009685 |

CODE_009687:
  RTS                                       ; $009687 |

  db $08, $10, $18, $28, $38, $58, $58, $58 ; $009688 |
  db $58, $58, $68                          ; $009690 |

; gsu table
  dw $9868, $985E, $984F, $9836             ; $009693 |
  dw $9813, $97DC, $97A5, $976E             ; $00969B |
  dw $9737, $9700, $96BF, $96AB             ; $0096A3 |

  db $08, $08, $6A, $C6, $02, $F8, $08, $6A ; $0096AB |
  db $86, $02, $08, $F8, $6A, $46, $02, $F8 ; $0096B3 |
  db $F8, $6A, $06, $02                     ; $0096BB |

  db $04, $FC, $45, $06, $00, $00, $08, $55 ; $0096BF |
  db $06, $00, $04, $04, $42, $C2, $02, $FC ; $0096C7 |
  db $04, $42, $82, $02, $04, $FC, $42, $42 ; $0096CF |
  db $02, $FC, $FC, $42, $02, $02, $0F, $0D ; $0096D7 |
  db $4C, $06, $00, $00, $0F, $4C, $46, $00 ; $0096DF |
  db $F7, $06, $4C, $06, $00, $12, $03, $4C ; $0096E7 |
  db $46, $00, $09, $F9, $4C, $46, $00, $FE ; $0096EF |
  db $FB, $4C, $46, $00, $04, $06, $4C, $06 ; $0096F7 |
  db $00                                    ; $0096FF |

  db $04, $FC, $54, $06, $00, $10, $10, $55 ; $009700 |
  db $06, $00, $00, $08, $45, $06, $00, $00 ; $009708 |
  db $08, $55, $06, $00, $10, $12, $4C, $06 ; $009710 |
  db $00, $FF, $14, $4C, $46, $00, $F6, $09 ; $009718 |
  db $4C, $06, $00, $13, $06, $4C, $46, $00 ; $009720 |
  db $0A, $FC, $4C, $46, $00, $FD, $FE, $4C ; $009728 |
  db $46, $00, $04, $09, $4C, $06, $00      ; $009730 |

  db $04, $FC, $44, $06, $00, $F8, $10, $55 ; $009737 |
  db $06, $00, $00, $08, $54, $06, $00, $10 ; $00973F |
  db $10, $45, $06, $00, $11, $16, $4C, $06 ; $009747 |
  db $00, $FE, $18, $4C, $46, $00, $F5, $0D ; $00974F |
  db $4C, $06, $00, $14, $0A, $4C, $46, $00 ; $009757 |
  db $0B, $00, $4C, $06, $00, $FC, $02, $4C ; $00975F |
  db $46, $00, $04, $0D, $4C, $06, $00      ; $009767 |

  db $00, $18, $55, $06, $00, $00, $08, $44 ; $00976E |
  db $06, $00, $10, $10, $54, $06, $00, $F8 ; $009776 |
  db $10, $45, $06, $00, $12, $1A, $4C, $06 ; $00977E |
  db $00, $FD, $1C, $4D, $46, $00, $F5, $11 ; $009786 |
  db $4C, $06, $00, $15, $0E, $4D, $46, $00 ; $00978E |
  db $0C, $04, $4D, $06, $00, $FB, $06, $4D ; $009796 |
  db $46, $00, $04, $11, $4C, $06, $00      ; $00979E |

  db $08, $08, $55, $06, $00, $10, $10, $44 ; $0097A5 |
  db $06, $00, $F8, $10, $54, $06, $00, $00 ; $0097AD |
  db $18, $45, $06, $00, $12, $1E, $4D, $06 ; $0097B5 |
  db $00, $FD, $20, $4E, $46, $00, $F4, $15 ; $0097BD |
  db $4D, $06, $00, $15, $12, $4E, $46, $00 ; $0097C5 |
  db $0C, $08, $4E, $06, $00, $FB, $0A, $4E ; $0097CD |
  db $46, $00, $04, $15, $4C, $06, $00      ; $0097D5 |

  db $10, $20, $55, $06, $00, $F8, $10, $44 ; $0097DC |
  db $06, $00, $00, $18, $54, $06, $00, $08 ; $0097E4 |
  db $08, $45, $06, $00, $12, $23, $4E, $46 ; $0097EC |
  db $00, $FD, $25, $4F, $46, $00, $F4, $1A ; $0097F4 |
  db $4E, $06, $00, $15, $17, $4F, $46, $00 ; $0097FC |
  db $0C, $0D, $4F, $06, $00, $FB, $0F, $4F ; $009804 |
  db $46, $00, $04, $1A, $4D, $06, $00      ; $00980C |

  db $12, $27, $4F, $46, $00, $F4, $1F, $4F ; $009813 |
  db $06, $00, $04, $1F, $4E, $06, $00, $FC ; $00981B |
  db $28, $55, $06, $00, $00, $18, $44, $06 ; $009823 |
  db $00, $08, $08, $54, $06, $00, $10, $20 ; $00982B |
  db $45, $06, $00                          ; $009833 |

  db $04, $24, $4F, $06, $00, $08, $30, $55 ; $009836 |
  db $06, $00, $FC, $28, $45, $06, $00, $10 ; $00983E |
  db $20, $54, $06, $00, $08, $08, $44, $06 ; $009846 |
  db $00                                    ; $00984E |

  db $08, $30, $45, $06, $00, $FC, $28, $54 ; $00984F |
  db $06, $00, $10, $20, $44, $06, $00      ; $009857 |

  db $08, $30, $54, $06, $00, $FC, $28, $44 ; $00985E |
  db $06, $00                               ; $009866 |

  db $08, $30, $44, $06, $00                ; $009868 |

  JSR CODE_008AE5                           ; $00986D |
  LDA $7782,x                               ; $009870 |
  BNE CODE_009883                           ; $009873 |
  DEC $7E4E,x                               ; $009875 |
  BMI CODE_009883                           ; $009878 |
  INC $73C2,x                               ; $00987A |
  LDA $7E4C,x                               ; $00987D |
  STA $7782,x                               ; $009880 |

CODE_009883:
  RTS                                       ; $009883 |

  dw $002C, $003C, $0050, $0064             ; $009884 |
  dw $0068, $000C, $000C, $0014             ; $00988C |
  dw $0018, $001C, $0004, $0004             ; $009894 |
  dw $0004, $0005, $0006, $0000             ; $00989C |
  dw $0001, $0002, $0001, $0003             ; $0098A4 |

  PHX                                       ; $0098AC |
  LDA $78C0,x                               ; $0098AD |
  STA !gsu_r1                               ; $0098B0 |  r1
  LDA $78C2,x                               ; $0098B3 |
  STA !gsu_r2                               ; $0098B6 |  r2
  LDA $7322,x                               ; $0098B9 |
  STA !gsu_r3                               ; $0098BC |  r3
  LDA $7E8C,x                               ; $0098BF |
  STA !gsu_r4                               ; $0098C2 |  r4
  LDA $70A2,x                               ; $0098C5 |
  STA !gsu_r5                               ; $0098C8 |  r5
  LDA $7142,x                               ; $0098CB |
  STA !gsu_r6                               ; $0098CE |  r6
  LDX #$08                                  ; $0098D1 |
  LDA #$9287                                ; $0098D3 |
  JSL r_gsu_init_1                          ; $0098D6 |  GSU init
  PLX                                       ; $0098DA |
  JSR CODE_008AE5                           ; $0098DB |
  LDA $7E8E,x                               ; $0098DE |
  BNE CODE_00990F                           ; $0098E1 |
  INC $7E4C,x                               ; $0098E3 |
  LDA $7E4C,x                               ; $0098E6 |
  ASL A                                     ; $0098E9 |
  TAY                                       ; $0098EA |
  CPY #$0A                                  ; $0098EB |
  BNE CODE_0098F4                           ; $0098ED |
  LDA #$0000                                ; $0098EF |
  BRA CODE_00990F                           ; $0098F2 |

CODE_0098F4:
  LDA $9884,y                               ; $0098F4 |
  STA $78C0,x                               ; $0098F7 |
  LDA $988E,y                               ; $0098FA |
  STA $78C2,x                               ; $0098FD |
  LDA $9898,y                               ; $009900 |
  STA $7E8E,x                               ; $009903 |
  LDA $98A2,y                               ; $009906 |
  STA $73C2,x                               ; $009909 |
  LDA #$0003                                ; $00990C |

CODE_00990F:
  STA $7782,x                               ; $00990F |
  RTS                                       ; $009912 |

  JSR CODE_008AE5                           ; $009913 |
  LDA #$0001                                ; $009916 |
  STA $7782,x                               ; $009919 |
  DEC $7E4C,x                               ; $00991C |
  LDA $7E4C,x                               ; $00991F |
  BPL CODE_009953                           ; $009922 |
  LDA #$0001                                ; $009924 |
  STA $7E4C,x                               ; $009927 |
  INC $7E4E,x                               ; $00992A |
  LDA $7E4E,x                               ; $00992D |
  CMP #$000F                                ; $009930 |
  BCC CODE_009953                           ; $009933 |
  LDA #$000E                                ; $009935 |
  STA $7E4E,x                               ; $009938 |
  LDA $7462,x                               ; $00993B |
  AND #$00FF                                ; $00993E |
  CMP #$00FF                                ; $009941 |
  BEQ CODE_009953                           ; $009944 |
  PHX                                       ; $009946 |
  PHY                                       ; $009947 |
  JSR CODE_00995F                           ; $009948 |
  PLY                                       ; $00994B |
  PLX                                       ; $00994C |
  LDA #$00FF                                ; $00994D |
  STA $7462,x                               ; $009950 |

CODE_009953:
  LDA $7E4E,x                               ; $009953 |
  ASL A                                     ; $009956 |
  TAY                                       ; $009957 |
  LDA $997A,y                               ; $009958 |
  STA $73C2,x                               ; $00995B |
  RTS                                       ; $00995E |

CODE_00995F:
  LDA #$022D                                ; $00995F |
  JSL spawn_ambient_sprite                  ; $009962 |
  LDA $70A2,x                               ; $009966 |
  STA $70A2,y                               ; $009969 |
  LDA $7142,x                               ; $00996C |
  STA $7142,y                               ; $00996F |
  PHX                                       ; $009972 |
  TYX                                       ; $009973 |
  JSL $009A96                               ; $009974 |
  PLX                                       ; $009978 |
  RTS                                       ; $009979 |

  dw $0000, $0001, $0002, $0003             ; $00997A |
  dw $0004, $0005, $0006, $0007             ; $009982 |
  dw $0008, $0009, $000A, $000B             ; $00998A |
  dw $000C, $000E, $000D                    ; $009992 |

  JSR CODE_008AE5                           ; $009998 |
  LDA #$0002                                ; $00999B |
  STA $7782,x                               ; $00999E |
  DEC $7E4C,x                               ; $0099A1 |
  LDA $7E4C,x                               ; $0099A4 |
  BPL CODE_0099B8                           ; $0099A7 |
  LDY $7E4E,x                               ; $0099A9 |
  LDA $9A10,y                               ; $0099AC |
  AND #$00FF                                ; $0099AF |
  STA $7E4C,x                               ; $0099B2 |
  INC $7E4E,x                               ; $0099B5 |

CODE_0099B8:
  LDA $7E4E,x                               ; $0099B8 |
  AND #$0003                                ; $0099BB |
  ASL A                                     ; $0099BE |
  TAY                                       ; $0099BF |
  LDA $9A08,y                               ; $0099C0 |
  STA $73C2,x                               ; $0099C3 |
  LDA $71E2,x                               ; $0099C6 |
  BMI CODE_009A07                           ; $0099C9 |
  CMP #$0280                                ; $0099CB |
  BCC CODE_0099D7                           ; $0099CE |
  LDA #$0000                                ; $0099D0 |
  STA $7782,x                               ; $0099D3 |
  RTS                                       ; $0099D6 |

CODE_0099D7:
  LDA $7E8C,x                               ; $0099D7 |
  BNE CODE_009A07                           ; $0099DA |
  INC $7E8C,x                               ; $0099DC |
  LDA #$022E                                ; $0099DF |
  JSL spawn_ambient_sprite                  ; $0099E2 |
  LDA $70A2,x                               ; $0099E6 |
  CLC                                       ; $0099E9 |
  ADC #$FFD8                                ; $0099EA |
  STA $70A2,y                               ; $0099ED |
  LDA $7142,x                               ; $0099F0 |
  CLC                                       ; $0099F3 |
  ADC #$0000                                ; $0099F4 |
  STA $7142,y                               ; $0099F7 |
  LDA #$0003                                ; $0099FA |
  STA $7782,y                               ; $0099FD |
  PHX                                       ; $009A00 |
  TYX                                       ; $009A01 |
  JSL $009ABF                               ; $009A02 |
  PLX                                       ; $009A06 |

CODE_009A07:
  RTS                                       ; $009A07 |

  db $00, $00, $01, $00, $02, $00, $01, $00 ; $009A08 |
  db $02, $03, $03, $03, $03, $20, $03, $03 ; $009A10 |
  db $03                                    ; $009A18 |

  JSR CODE_008AE5                           ; $009A19 |
  LDA #$0002                                ; $009A1C |
  STA $7782,x                               ; $009A1F |
  PHX                                       ; $009A22 |
  DEC $7E4C,x                               ; $009A23 |
  LDA $7E4C,x                               ; $009A26 |
  BPL CODE_009A49                           ; $009A29 |
  LDA $7E4E,x                               ; $009A2B |
  AND #$0001                                ; $009A2E |
  CLC                                       ; $009A31 |
  ADC #$0000                                ; $009A32 |
  STA $7E4C,x                               ; $009A35 |
  INC $7E4E,x                               ; $009A38 |
  LDA $7E4E,x                               ; $009A3B |
  CMP #$000C                                ; $009A3E |
  BCC CODE_009A49                           ; $009A41 |
  LDA #$0004                                ; $009A43 |
  STA $7E4E,x                               ; $009A46 |

CODE_009A49:
  LDA $7E4E,x                               ; $009A49 |
  STA $73C2,x                               ; $009A4C |
  LDA $7E8E,x                               ; $009A4F |
  BNE CODE_009A61                           ; $009A52 |
  PHD                                       ; $009A54 |
  LDA #$0000                                ; $009A55 |
  PHA                                       ; $009A58 |
  PLD                                       ; $009A59 |
  JSL $1191B8                               ; $009A5A |
  REP #$20                                  ; $009A5E |
  PLD                                       ; $009A60 |

CODE_009A61:
  PLX                                       ; $009A61 |
  STX $7E4A                                 ; $009A62 |
  RTS                                       ; $009A65 |

  JSR CODE_008AE5                           ; $009A66 |
  LDA #$0002                                ; $009A69 |
  STA $7782,x                               ; $009A6C |
  DEC $7E4C,x                               ; $009A6F |
  LDA $7E4C,x                               ; $009A72 |
  BPL CODE_009A8F                           ; $009A75 |
  LDA #$0003                                ; $009A77 |
  STA $7E4C,x                               ; $009A7A |
  INC $7E4E,x                               ; $009A7D |
  LDA $7E4E,x                               ; $009A80 |
  CMP #$0008                                ; $009A83 |
  BCC CODE_009A8F                           ; $009A86 |
  LDA #$0000                                ; $009A88 |
  STA $7782,x                               ; $009A8B |
  RTS                                       ; $009A8E |

CODE_009A8F:
  LDA $7E4E,x                               ; $009A8F |
  STA $73C2,x                               ; $009A92 |
  RTS                                       ; $009A95 |

  LDA #$0002                                ; $009A96 |
  STA $7782,x                               ; $009A99 |
  LDA #$0003                                ; $009A9C |
  STA $7E4C,x                               ; $009A9F |
  STZ $7E4E,x                               ; $009AA2 |
  STZ $7502,x                               ; $009AA5 |
  LDA #$0000                                ; $009AA8 |
  STA $7462,x                               ; $009AAB |
  LDA #$0040                                ; $009AAE |
  STA $7E8E,x                               ; $009AB1 |
  LDA #$0008                                ; $009AB4 |\ play sound #$0008
  JSL push_sound_queue                      ; $009AB7 |/
  STX $7E4A                                 ; $009ABB |
  RTL                                       ; $009ABE |

  LDA #$0003                                ; $009ABF |
  STA $7782,x                               ; $009AC2 |
  STZ $7E4E,x                               ; $009AC5 |
  STZ $7502,x                               ; $009AC8 |
  LDA #$0000                                ; $009ACB |
  STA $7462,x                               ; $009ACE |
  LDA #$003F                                ; $009AD1 |\ play sound #$003F
  JSL push_sound_queue                      ; $009AD4 |/
  RTL                                       ; $009AD8 |

  db $40, $00, $C0, $FF, $20, $F2, $8A, $BD ; $009AD9 |
  db $8E, $7E, $D0, $03                     ; $009AE1 |

; dead code?
  JMP CODE_008AF8                           ; $009AE5 |
; dead code?
  CMP #$0040                                ; $009AE8 |
  BPL CODE_009AFA                           ; $009AEB |
  LDY #$FF                                  ; $009AED |
  AND #$0001                                ; $009AEF |
  BEQ CODE_009AF6                           ; $009AF2 |
  LDY #$01                                  ; $009AF4 |

CODE_009AF6:
  TYA                                       ; $009AF6 |
  STA $7462,x                               ; $009AF7 |

CODE_009AFA:
  LDA $7E8E,x                               ; $009AFA |
  AND #$003F                                ; $009AFD |
  BNE CODE_009B12                           ; $009B00 |
  LDA $73C0,x                               ; $009B02 |
  EOR #$0002                                ; $009B05 |
  STA $73C0,x                               ; $009B08 |
  TAY                                       ; $009B0B |
  LDA $9AD9,y                               ; $009B0C |
  STA $71E0,x                               ; $009B0F |

CODE_009B12:
  RTS                                       ; $009B12 |
; end dead code

  JSR CODE_008AE5                           ; $009B13 |
  LDY $7462,x                               ; $009B16 |
  CPY #$FF                                  ; $009B19 |
  BNE CODE_009B25                           ; $009B1B |
  LDA #$0001                                ; $009B1D |
  STA $7462,x                               ; $009B20 |
  BRA CODE_009B52                           ; $009B23 |

CODE_009B25:
  LDA $7E8C,x                               ; $009B25 |
  CLC                                       ; $009B28 |
  ADC $7E4E,x                               ; $009B29 |
  STA $7E8C,x                               ; $009B2C |
  BIT #$FF00                                ; $009B2F |
  BEQ CODE_009B40                           ; $009B32 |
  AND #$00FF                                ; $009B34 |
  STA $7E8C,x                               ; $009B37 |
  LDA #$00FF                                ; $009B3A |
  STA $7462,x                               ; $009B3D |

CODE_009B40:
  LDA $7E4E,x                               ; $009B40 |
  CLC                                       ; $009B43 |
  ADC #$0004                                ; $009B44 |
  CMP #$0100                                ; $009B47 |
  BMI CODE_009B4F                           ; $009B4A |
  LDA #$0100                                ; $009B4C |

CODE_009B4F:
  STA $7E4E,x                               ; $009B4F |

CODE_009B52:
  RTS                                       ; $009B52 |

  db $0C, $10, $20, $E5, $8A, $BD, $82, $77 ; $009B53 |
  db $D0, $14, $DE, $C2, $73, $10, $03      ; $009B5B |

  JMP CODE_008AF8                           ; $009B62 |

  LDY $73C2,x                               ; $009B65 |
  LDA $9B53,y                               ; $009B68 |
  AND #$00FF                                ; $009B6B |
  STA $7782,x                               ; $009B6E |
  RTS                                       ; $009B71 |

  db $03, $03, $03, $03, $03, $03, $03, $03 ; $009B72 |
  db $03, $02, $02, $02, $02, $02, $02, $02 ; $009B7A |
  db $02, $02, $02, $02, $02, $02           ; $009B82 |

  JSR CODE_008AE5                           ; $009B88 |
  SEP #$20                                  ; $009B8B |
  LDA $7782,x                               ; $009B8D |
  BEQ CODE_009BA1                           ; $009B90 |
  LDY $73C2,x                               ; $009B92 |
  CPY #$16                                  ; $009B95 |
  BNE CODE_009BB4                           ; $009B97 |
  CMP #$02                                  ; $009B99 |
  BCS CODE_009BB4                           ; $009B9B |
  LDA #$FF                                  ; $009B9D |
  BRA CODE_009BB6                           ; $009B9F |

CODE_009BA1:
  DEC $73C2,x                               ; $009BA1 |
  BPL CODE_009BAB                           ; $009BA4 |
  REP #$20                                  ; $009BA6 |
  JMP CODE_008AF8                           ; $009BA8 |

CODE_009BAB:
  LDY $73C2,x                               ; $009BAB |
  LDA $9B72,y                               ; $009BAE |
  STA $7782,x                               ; $009BB1 |

CODE_009BB4:
  LDA #$05                                  ; $009BB4 |

CODE_009BB6:
  STA $7462,x                               ; $009BB6 |
  REP #$20                                  ; $009BB9 |
  RTS                                       ; $009BBB |

  JSR CODE_008AE5                           ; $009BBC |
  LDA $7782,x                               ; $009BBF |
  BNE CODE_009BC7                           ; $009BC2 |
  JMP CODE_008AF8                           ; $009BC4 |

CODE_009BC7:
  LDA $7E8E,x                               ; $009BC7 |
  BNE CODE_009BDD                           ; $009BCA |
  LDA #$0004                                ; $009BCC |
  STA $7E8E,x                               ; $009BCF |
  DEC $73C2,x                               ; $009BD2 |
  BPL CODE_009BDD                           ; $009BD5 |
  LDA #$0005                                ; $009BD7 |
  STA $73C2,x                               ; $009BDA |

CODE_009BDD:
  RTS                                       ; $009BDD |

  db $08, $06, $04, $02, $02                ; $009BDE |

  JSR CODE_008AE5                           ; $009BE3 |
  LDA $7782,x                               ; $009BE6 |
  BNE CODE_009C10                           ; $009BE9 |
  DEC $7E4C,x                               ; $009BEB |
  BPL CODE_009BF3                           ; $009BEE |
  JMP CODE_008AF8                           ; $009BF0 |

CODE_009BF3:
  SEP #$20                                  ; $009BF3 |
  DEC $73C2,x                               ; $009BF5 |
  LDY $7E4C,x                               ; $009BF8 |
  LDA $9BDE,y                               ; $009BFB |
  STA $7782,x                               ; $009BFE |
  REP #$20                                  ; $009C01 |
  LDA #$0001                                ; $009C03 |
  CPY #$03                                  ; $009C06 |
  BNE CODE_009C0D                           ; $009C08 |
  LDA #$FFFF                                ; $009C0A |

CODE_009C0D:
  STA $7462,x                               ; $009C0D |

CODE_009C10:
  RTS                                       ; $009C10 |

  db $03, $03, $03, $03, $03, $03           ; $009C11 |
  db $03, $02, $02, $02, $02, $02           ; $009C17 |

  PHX                                       ; $009C1D |
  TXA                                       ; $009C1E |
  AND #$00FF                                ; $009C1F |
  STA !gsu_r10                              ; $009C22 |  r10
  LDA #$0000                                ; $009C25 |
  STA !gsu_r0                               ; $009C28 |  r0
  LDA #$9C6B                                ; $009C2B |
  STA !gsu_r14                              ; $009C2E |  r14
  LDX #$09                                  ; $009C31 |
  LDA #$8CB1                                ; $009C33 |
  JSL r_gsu_init_1                          ; $009C36 |  GSU init
  PLX                                       ; $009C3A |
  JSR CODE_008AE5                           ; $009C3B |
  LDA $7782,x                               ; $009C3E |
  BNE CODE_009C5E                           ; $009C41 |
  DEC $73C2,x                               ; $009C43 |
  BPL CODE_009C4B                           ; $009C46 |
  JMP CODE_008AF8                           ; $009C48 |

CODE_009C4B:
  SEP #$20                                  ; $009C4B |
  LDY $73C2,x                               ; $009C4D |
  LDA $9C5F,y                               ; $009C50 |
  STA $7001,x                               ; $009C53 |
  LDA $9C11,y                               ; $009C56 |
  STA $7782,x                               ; $009C59 |
  REP #$20                                  ; $009C5C |

CODE_009C5E:
  RTS                                       ; $009C5E |

  db $10, $10, $20, $38, $48, $58           ; $009C5F |
  db $58, $50, $58, $50, $50, $48           ; $009C65 |

; gsu table
  dw $9E88, $9E7E, $9E6A, $9E47             ; $009C6B |
  dw $9E1A, $9DE3, $9DAC, $9D7A             ; $009C73 |
  dw $9D43, $9D11, $9CDF, $9CB2             ; $009C7B |
  dw $9C85                                  ; $009C83 |

  db $03, $FE, $55, $06, $00, $09, $0B, $4C ; $009C85 |
  db $04, $00, $09, $00, $4C, $04, $00, $FF ; $009C8D |
  db $01, $4C, $04, $00, $05, $07, $4C, $04 ; $009C95 |
  db $00, $0E, $07, $4C, $04, $00, $00, $0B ; $009C9D |
  db $4C, $04, $00, $FE, $06, $4C, $04, $00 ; $009CA5 |
  db $04, $FD, $4D, $04, $00                ; $009CAD |

  db $03, $FE, $55, $06, $00, $0A, $0D, $4C ; $009CB2 |
  db $04, $00, $0A, $FD, $4C, $04, $00, $FE ; $009CBA |
  db $FE, $4C, $04, $00, $05, $08, $4C, $04 ; $009CC2 |
  db $00, $10, $06, $4C, $04, $00, $FF, $0C ; $009CCA |
  db $4D, $84, $00, $FC, $07, $4C, $04, $00 ; $009CD2 |
  db $04, $FE, $4D, $04, $00                ; $009CDA |

  db $0C, $02, $55, $06, $00, $03, $FE, $45 ; $009CDF |
  db $06, $00, $0A, $0F, $4C, $04, $00, $09 ; $009CE7 |
  db $FB, $4D, $44, $00, $FD, $FD, $4C, $04 ; $009CEF |
  db $00, $05, $09, $4C, $04, $00, $12, $06 ; $009CF7 |
  db $4D, $04, $00, $FE, $0D, $4E, $84, $00 ; $009CFF |
  db $FA, $08, $4C, $04, $00, $04, $FF, $4D ; $009D07 |
  db $04, $00                               ; $009D0F |

  db $0C, $02, $55, $06, $00, $03, $FE, $54 ; $009D11 |
  db $06, $00, $0B, $12, $4D, $44, $00, $0B ; $009D19 |
  db $FA, $4D, $44, $00, $FD, $FD, $4C, $04 ; $009D21 |
  db $00, $05, $0B, $4C, $04, $00, $13, $06 ; $009D29 |
  db $4D, $04, $00, $FE, $0F, $4E, $84, $00 ; $009D31 |
  db $FA, $0A, $4D, $04, $00, $04, $01, $4E ; $009D39 |
  db $04, $00                               ; $009D41 |

  db $FC, $08, $55, $06, $00, $0C, $02, $45 ; $009D43 |
  db $06, $00, $03, $FE, $44, $06, $00, $0C ; $009D4B |
  db $15, $4D, $44, $00, $0C, $FA, $4D, $44 ; $009D53 |
  db $00, $FC, $FE, $4C, $04, $00, $05, $0D ; $009D5B |
  db $4C, $04, $00, $14, $07, $4D, $04, $00 ; $009D63 |
  db $FD, $11, $4F, $84, $00, $F9, $0C, $4D ; $009D6B |
  db $04, $00, $04, $03, $4E, $04, $00      ; $009D73 |

  db $FC, $08, $55, $06, $00, $0C, $02, $54 ; $009D7A |
  db $06, $00, $0C, $19, $4E, $44, $00, $0C ; $009D82 |
  db $FB, $4E, $44, $00, $FC, $FF, $4D, $44 ; $009D8A |
  db $00, $05, $10, $4D, $44, $00, $15, $08 ; $009D92 |
  db $4D, $04, $00, $FD, $14, $4F, $84, $00 ; $009D9A |
  db $F9, $0F, $4D, $04, $00, $04, $06, $4E ; $009DA2 |
  db $04, $00                               ; $009DAA |

  db $07, $16, $55, $06, $00, $FC, $08, $55 ; $009DAC |
  db $06, $00, $0C, $02, $44, $06, $00, $0D ; $009DB4 |
  db $1D, $4E, $44, $00, $0D, $FC, $4E, $44 ; $009DBC |
  db $00, $FB, $01, $4E, $44, $00, $05, $13 ; $009DC4 |
  db $4E, $44, $00, $15, $09, $4E, $04, $00 ; $009DCC |
  db $FC, $17, $4F, $84, $00, $F8, $12, $4E ; $009DD4 |
  db $04, $00, $04, $09, $4F, $04, $00      ; $009DDC |

  db $07, $17, $55, $06, $00, $FC, $09, $55 ; $009DE3 |
  db $06, $00, $0C, $03, $44, $06, $00, $0D ; $009DEB |
  db $1F, $4F, $44, $00, $0D, $FE, $4F, $44 ; $009DF3 |
  db $00, $FB, $03, $4E, $44, $00, $05, $15 ; $009DFB |
  db $4E, $44, $00, $16, $0A, $4E, $04, $00 ; $009E03 |
  db $FC, $19, $4F, $84, $00, $F8, $14, $4E ; $009E0B |
  db $04, $00, $04, $0A, $4F, $04, $00      ; $009E13 |

  db $03, $20, $44, $06, $00, $07, $16, $45 ; $009E1A |
  db $06, $00, $FC, $08, $54, $06, $00, $0D ; $009E22 |
  db $22, $4F, $44, $00, $0E, $01, $4F, $44 ; $009E2A |
  db $00, $FB, $05, $4F, $44, $00, $05, $19 ; $009E32 |
  db $4E, $44, $00, $17, $0D, $4E, $04, $00 ; $009E3A |
  db $F7, $17, $4F, $04, $00                ; $009E42 |

  db $17, $10, $4F, $04, $00, $03, $20, $54 ; $009E47 |
  db $06, $00, $07, $16, $54, $06, $00, $FC ; $009E4F |
  db $08, $44, $06, $00, $0E, $05, $4F, $44 ; $009E57 |
  db $00, $F7, $1A, $4F, $04, $00, $05, $1C ; $009E5F |
  db $4F, $44, $00                          ; $009E67 |

  db $18, $12, $4F, $04, $00, $03, $20, $45 ; $009E6A |
  db $06, $00, $07, $16, $44, $06, $00, $05 ; $009E72 |
  db $1F, $4F, $44, $00                     ; $009E7A |

  db $03, $20, $54, $06, $00, $05, $22, $4F ; $009E7E |
  db $44, $00                               ; $009E86 |

  db $03, $20, $44, $06, $00, $05, $25, $4F ; $009E88 |
  db $44, $00                               ; $009E90 |

  PHX                                       ; $009E92 |
  TXA                                       ; $009E93 |
  AND #$00FF                                ; $009E94 |
  STA !gsu_r10                              ; $009E97 |  r10
  LDA #$0000                                ; $009E9A |
  STA !gsu_r0                               ; $009E9D |  r0
  LDA #$9EE0                                ; $009EA0 |
  STA !gsu_r14                              ; $009EA3 |  r14
  LDX #$09                                  ; $009EA6 |
  LDA #$8CB1                                ; $009EA8 |
  JSL r_gsu_init_1                          ; $009EAB |  GSU init
  PLX                                       ; $009EAF |
  JSR CODE_008AE5                           ; $009EB0 |
  LDA $7782,x                               ; $009EB3 |
  BNE CODE_009ED2                           ; $009EB6 |
  DEC $73C2,x                               ; $009EB8 |
  BPL CODE_009EC0                           ; $009EBB |
  JMP CODE_008AF8                           ; $009EBD |

CODE_009EC0:
  SEP #$20                                  ; $009EC0 |
  LDY $73C2,x                               ; $009EC2 |
  LDA $9ED3,y                               ; $009EC5 |
  STA $7001,x                               ; $009EC8 |
  LDA #$02                                  ; $009ECB |
  STA $7782,x                               ; $009ECD |
  REP #$20                                  ; $009ED0 |

CODE_009ED2:
  RTS                                       ; $009ED2 |

  db $10, $20, $30, $40, $50, $50, $48, $50 ; $009ED3 |
  db $60, $58, $50, $60, $60                ; $009EDB |

; gsu table
  dw $A172, $A15E, $A140, $A118             ; $009EE0 |
  dw $A0E6, $A0B4, $A087, $A055             ; $009EE8 |
  dw $A019, $9FE2, $9FB0, $9F74             ; $009EF0 |
  dw $9F38, $9EFC                           ; $009EF8 |

  db $07, $08, $42, $C2, $02, $F7, $08, $42 ; $009EFC |
  db $82, $02, $07, $F8, $42, $42, $02, $F7 ; $009F04 |
  db $F8, $42, $02, $02, $09, $01, $86, $08 ; $009F0C |
  db $02, $FF, $08, $86, $08, $02, $F5, $FE ; $009F14 |
  db $86, $08, $02, $01, $F6, $86, $08, $02 ; $009F1C |
  db $0C, $09, $86, $08, $02, $F5, $0A, $86 ; $009F24 |
  db $08, $02, $0B, $F4, $86, $08, $02, $F6 ; $009F2C |
  db $F3, $86, $08, $02                     ; $009F34 |

  db $05, $05, $42, $C2, $02, $FD, $05, $42 ; $009F38 |
  db $82, $02, $05, $FD, $42, $42, $02, $FD ; $009F40 |
  db $FD, $42, $02, $02, $11, $01, $86, $08 ; $009F48 |
  db $02, $FF, $10, $86, $08, $02, $ED, $FE ; $009F50 |
  db $86, $08, $02, $01, $F2, $86, $08, $02 ; $009F58 |
  db $10, $0D, $86, $08, $02, $F1, $0E, $86 ; $009F60 |
  db $08, $02, $0D, $EE, $86, $08, $02, $F4 ; $009F68 |
  db $ED, $86, $08, $02                     ; $009F70 |

  db $08, $08, $6A, $C6, $02, $F8, $08, $6A ; $009F74 |
  db $86, $02, $08, $F8, $6A, $46, $02, $F8 ; $009F7C |
  db $F8, $6A, $06, $02, $15, $03, $86, $08 ; $009F84 |
  db $02, $FF, $14, $86, $08, $02, $E9, $FF ; $009F8C |
  db $86, $08, $02, $01, $F0, $86, $08, $02 ; $009F94 |
  db $14, $0F, $86, $08, $02, $EF, $10, $86 ; $009F9C |
  db $08, $02, $0F, $EC, $86, $08, $02, $F2 ; $009FA4 |
  db $EB, $86, $08, $02                     ; $009FAC |

  db $08, $08, $E3, $06, $02, $F8, $00, $E3 ; $009FB0 |
  db $06, $02, $19, $05, $86, $08, $02, $FF ; $009FB8 |
  db $1A, $86, $08, $02, $E5, $01, $86, $08 ; $009FC0 |
  db $02, $01, $EE, $E3, $06, $02, $16, $12 ; $009FC8 |
  db $86, $08, $02, $ED, $13, $86, $08, $02 ; $009FD0 |
  db $11, $EA, $86, $08, $02, $F0, $E9, $86 ; $009FD8 |
  db $08, $02                               ; $009FE0 |

  db $08, $F8, $E3, $06, $02, $08, $08, $E5 ; $009FE2 |
  db $06, $02, $F8, $00, $E5, $06, $02, $1D ; $009FEA |
  db $07, $86, $08, $02, $FF, $1E, $E3, $06 ; $009FF2 |
  db $02, $E1, $03, $86, $08, $02, $01, $ED ; $009FFA |
  db $E5, $06, $02, $18, $16, $86, $08, $02 ; $00A002 |
  db $EB, $17, $86, $08, $02, $13, $E9, $86 ; $00A00A |
  db $08, $02, $EE, $E8, $86, $08, $02      ; $00A012 |

  db $00, $00, $E3, $06, $02, $08, $F8, $E5 ; $00A019 |
  db $06, $02, $08, $08, $E5, $06, $02, $F8 ; $00A021 |
  db $00, $E7, $06, $02, $21, $09, $86, $08 ; $00A029 |
  db $02, $FF, $24, $E5, $06, $02, $DD, $05 ; $00A031 |
  db $86, $08, $02, $01, $ED, $E7, $06, $02 ; $00A039 |
  db $1A, $1A, $86, $08, $02, $E9, $1B, $86 ; $00A041 |
  db $08, $02, $15, $E9, $86, $08, $02, $EC ; $00A049 |
  db $E8, $86, $08, $02                     ; $00A051 |

  db $00, $10, $E3, $06, $02, $00, $00, $E5 ; $00A055 |
  db $06, $02, $08, $F8, $E7, $06, $02, $24 ; $00A05D |
  db $0C, $E3, $06, $02, $FF, $2A, $E7, $06 ; $00A065 |
  db $02, $DA, $08, $86, $08, $02, $1D, $20 ; $00A06D |
  db $86, $08, $02, $E6, $21, $86, $08, $02 ; $00A075 |
  db $18, $EA, $86, $08, $02, $E9, $E9, $86 ; $00A07D |
  db $08, $02                               ; $00A085 |

  db $F0, $08, $E3, $06, $02, $00, $10, $E5 ; $00A087 |
  db $06, $02, $00, $00, $E7, $06, $02, $26 ; $00A08F |
  db $0F, $E5, $06, $02, $D8, $0B, $86, $08 ; $00A097 |
  db $02, $1F, $25, $86, $08, $02, $E4, $26 ; $00A09F |
  db $86, $08, $02, $1A, $EC, $86, $08, $02 ; $00A0A7 |
  db $E7, $EB, $E3, $06, $02                ; $00A0AF |

  db $E8, $18, $E3, $06, $02, $08, $20, $E3 ; $00A0B4 |
  db $06, $02, $F0, $08, $E5, $06, $02, $00 ; $00A0BC |
  db $10, $E7, $06, $02, $28, $14, $E7, $06 ; $00A0C4 |
  db $02, $D6, $10, $86, $08, $02, $21, $2C ; $00A0CC |
  db $86, $08, $02, $E2, $2D, $E3, $06, $02 ; $00A0D4 |
  db $1C, $EF, $86, $08, $02, $E5, $EE, $E5 ; $00A0DC |
  db $06, $02                               ; $00A0E4 |

  db $18, $10, $E3, $06, $02, $E8, $18, $E5 ; $00A0E6 |
  db $06, $02, $08, $20, $E5, $06, $02, $F0 ; $00A0EE |
  db $08, $E7, $06, $02, $00, $10, $E7, $06 ; $00A0F6 |
  db $02, $D5, $15, $86, $08, $02, $22, $32 ; $00A0FE |
  db $86, $08, $02, $E1, $33, $E5, $06, $02 ; $00A106 |
  db $1D, $F3, $E5, $06, $02, $E4, $F2, $E7 ; $00A10E |
  db $06, $02                               ; $00A116 |

  db $00, $38, $E3, $06, $02, $18, $10, $E5 ; $00A118 |
  db $06, $02, $E8, $18, $E7, $06, $02, $08 ; $00A120 |
  db $20, $E7, $06, $02, $D3, $1B, $86, $08 ; $00A128 |
  db $02, $24, $38, $E3, $06, $02, $E0, $39 ; $00A130 |
  db $E7, $06, $02, $1F, $F9, $E5, $06, $02 ; $00A138 |

  db $08, $10, $E3, $06, $02, $00, $38, $E5 ; $00A140 |
  db $06, $02, $18, $10, $E7, $06, $02, $D3 ; $00A148 |
  db $21, $E3, $06, $02, $24, $3E, $E5, $06 ; $00A150 |
  db $02, $1F, $FF, $E7, $06, $02           ; $00A158 |

  db $08, $10, $E5, $06, $02, $00, $38, $E7 ; $00A15E |
  db $06, $02, $D2, $27, $E5, $06, $02, $25 ; $00A166 |
  db $44, $E7, $06, $02                     ; $00A16E |

  db $08, $10, $E7, $06, $02, $D1, $2D, $E7 ; $00A172 |
  db $06, $02                               ; $00A17A |

  db $04, $04, $04, $04, $04, $04, $04, $04 ; $00A17C |
  db $04, $04, $04, $04, $04, $04, $04, $03 ; $00A184 |
  db $03, $03, $02, $02, $01, $01, $01      ; $00A18C |

  PHX                                       ; $00A193 |
  TXA                                       ; $00A194 |
  STA !gsu_r10                              ; $00A195 |  r10
  LDA #$0000                                ; $00A198 |
  STA !gsu_r0                               ; $00A19B |  r0
  LDA #$A1E9                                ; $00A19E |
  STA !gsu_r14                              ; $00A1A1 |  r14
  LDX #$09                                  ; $00A1A4 |
  LDA #$8CB1                                ; $00A1A6 |
  JSL r_gsu_init_1                          ; $00A1A9 |  GSU init
  PLX                                       ; $00A1AD |
  JSR CODE_008AE5                           ; $00A1AE |
  LDA $7782,x                               ; $00A1B1 |
  BNE CODE_00A1D1                           ; $00A1B4 |
  DEC $73C2,x                               ; $00A1B6 |
  BPL CODE_00A1BE                           ; $00A1B9 |
  JMP CODE_008AF8                           ; $00A1BB |

CODE_00A1BE:
  SEP #$20                                  ; $00A1BE |
  LDY $73C2,x                               ; $00A1C0 |
  LDA $A1D2,y                               ; $00A1C3 |
  STA $7001,x                               ; $00A1C6 |
  LDA $A17C,y                               ; $00A1C9 |
  STA $7782,x                               ; $00A1CC |
  REP #$20                                  ; $00A1CF |

CODE_00A1D1:
  RTS                                       ; $00A1D1 |

  db $08, $10, $18, $20, $28, $30, $40, $38 ; $00A1D2 |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $00A1DA |
  db $40, $40, $40, $40, $40, $40, $40      ; $00A1E2 |

; gsu table
  dw $A548, $A53E, $A52F, $A51B             ; $00A1E9 |
  dw $A502, $A4E4, $A4BC, $A499             ; $00A1F1 |
  dw $A471, $A449, $A421, $A3F9             ; $00A1F9 |
  dw $A3D1, $A3A9, $A381, $A359             ; $00A201 |
  dw $A331, $A309, $A2E1, $A2B9             ; $00A209 |
  dw $A291, $A269, $A241, $A219             ; $00A211 |

  db $02, $00, $11, $00, $00, $FC, $00, $10 ; $00A219 |
  db $00, $00, $04, $FC, $01, $00, $00, $FC ; $00A221 |
  db $FC, $00, $00, $00, $FB, $00, $11, $00 ; $00A229 |
  db $00, $F8, $00, $10, $00, $00, $FB, $FA ; $00A231 |
  db $01, $00, $00, $F6, $FC, $00           ; $00A239 |

  db $00, $00, $06, $03, $01, $00, $00, $FC ; $00A23F |
  db $05, $10, $40, $00, $08, $F7, $10, $00 ; $00A247 |
  db $00, $FC, $F7, $10, $00, $00, $FB, $00 ; $00A24F |
  db $11, $40, $00, $F3, $03, $10, $40, $00 ; $00A257 |
  db $FB, $F1, $01, $40, $00, $F2, $F7, $01 ; $00A25F |
  db $00, $00                               ; $00A267 |

  db $09, $03, $10, $40, $00, $FC, $08, $00 ; $00A269 |
  db $40, $00, $0B, $F5, $10, $40, $00, $FC ; $00A271 |
  db $F4, $11, $00, $00, $FB, $01, $10, $40 ; $00A279 |
  db $00, $F0, $03, $10, $00, $00, $FB, $ED ; $00A281 |
  db $01, $C0, $00, $EF, $F4, $01, $80, $00 ; $00A289 |

  db $0C, $04, $01, $40, $00, $FC, $08, $01 ; $00A291 |
  db $40, $00, $0D, $F3, $01, $40, $00, $FC ; $00A299 |
  db $F3, $10, $40, $00, $FB, $02, $00, $40 ; $00A2A1 |
  db $00, $ED, $04, $00, $00, $00, $FB, $EB ; $00A2A9 |
  db $00, $C0, $00, $ED, $F2, $10, $80, $00 ; $00A2B1 |

  db $0D, $05, $00, $C0, $00, $FC, $0A, $01 ; $00A2B9 |
  db $C0, $00, $0E, $F2, $01, $C0, $00, $FC ; $00A2C1 |
  db $F3, $00, $40, $00, $FB, $03, $01, $40 ; $00A2C9 |
  db $00, $EC, $05, $01, $00, $00, $FB, $E9 ; $00A2D1 |
  db $11, $80, $00, $EC, $F1, $10, $C0, $00 ; $00A2D9 |

  db $0E, $06, $11, $80, $00, $FB, $0C, $00 ; $00A2E1 |
  db $C0, $00, $0F, $F1, $00, $C0, $00, $FC ; $00A2E9 |
  db $F3, $00, $C0, $00, $FB, $04, $01, $C0 ; $00A2F1 |
  db $00, $EB, $06, $01, $80, $00, $FB, $E8 ; $00A2F9 |
  db $10, $80, $00, $EB, $F0, $01, $C0, $00 ; $00A301 |

  db $0E, $06, $01, $80, $00, $FC, $0C, $11 ; $00A309 |
  db $80, $00, $0F, $F1, $11, $80, $00, $FC ; $00A311 |
  db $F3, $11, $80, $00, $FB, $05, $00, $C0 ; $00A319 |
  db $00, $EB, $06, $00, $80, $00, $FB, $E8 ; $00A321 |
  db $00, $80, $00, $EB, $F0, $00, $40, $00 ; $00A329 |

  db $0D, $0A, $10, $00, $00, $FD, $0F, $10 ; $00A331 |
  db $80, $00, $10, $F2, $10, $80, $00, $FE ; $00A339 |
  db $F6, $00, $80, $00, $FB, $06, $11, $80 ; $00A341 |
  db $00, $EB, $07, $11, $80, $00, $FC, $EB ; $00A349 |
  db $01, $00, $00, $ED, $F4, $11, $00, $00 ; $00A351 |

  db $0C, $0E, $10, $40, $00, $FE, $13, $00 ; $00A359 |
  db $80, $00, $11, $F6, $01, $00, $00, $FE ; $00A361 |
  db $F8, $00, $00, $00, $FD, $09, $00, $80 ; $00A369 |
  db $00, $E9, $09, $00, $C0, $00, $FC, $EE ; $00A371 |
  db $10, $00, $00, $EF, $F3, $00, $00, $00 ; $00A379 |

  db $0B, $0E, $00, $40, $00, $FE, $16, $01 ; $00A381 |
  db $00, $00, $10, $F9, $00, $00, $00, $FC ; $00A389 |
  db $FB, $11, $00, $00, $FD, $0C, $00, $00 ; $00A391 |
  db $00, $E9, $0C, $00, $40, $00, $FA, $F2 ; $00A399 |
  db $11, $00, $00, $EE, $F3, $01, $00, $00 ; $00A3A1 |

  db $0A, $0F, $01, $40, $00, $FD, $19, $10 ; $00A3A9 |
  db $00, $00, $0F, $FE, $11, $00, $00, $FB ; $00A3B1 |
  db $FB, $00, $40, $00, $FB, $0F, $11, $00 ; $00A3B9 |
  db $00, $EB, $10, $11, $00, $00, $FA, $F2 ; $00A3C1 |
  db $10, $40, $00, $EE, $F4, $01, $00, $00 ; $00A3C9 |

  db $09, $10, $01, $40, $00, $FB, $1A, $00 ; $00A3D1 |
  db $40, $00, $0E, $FD, $00, $40, $00, $FA ; $00A3D9 |
  db $FC, $01, $40, $00, $F9, $10, $00, $40 ; $00A3E1 |
  db $00, $EC, $11, $00, $00, $00, $F9, $F3 ; $00A3E9 |
  db $00, $40, $00, $ED, $F6, $00, $00, $00 ; $00A3F1 |

  db $0B, $13, $00, $40, $00, $FA, $1D, $01 ; $00A3F9 |
  db $40, $00, $0D, $FE, $01, $40, $00, $FB ; $00A401 |
  db $FE, $01, $C0, $00, $FA, $11, $01, $40 ; $00A409 |
  db $00, $ED, $11, $01, $00, $00, $F9, $F3 ; $00A411 |
  db $01, $40, $00, $EB, $FC, $10, $00, $00 ; $00A419 |

  db $0C, $16, $10, $40, $00, $F9, $1E, $01 ; $00A421 |
  db $40, $00, $0D, $FF, $01, $40, $00, $FB ; $00A429 |
  db $00, $00, $C0, $00, $FA, $12, $01, $C0 ; $00A431 |
  db $00, $ED, $13, $01, $00, $00, $F9, $F5 ; $00A439 |
  db $01, $40, $00, $E9, $FE, $11, $00, $00 ; $00A441 |

  db $0D, $19, $11, $00, $00, $FA, $20, $00 ; $00A449 |
  db $40, $00, $0E, $02, $00, $40, $00, $FB ; $00A451 |
  db $01, $10, $C0, $00, $FA, $15, $01, $C0 ; $00A459 |
  db $00, $EC, $16, $00, $00, $00, $FA, $F8 ; $00A461 |
  db $00, $40, $00, $E9, $FD, $10, $40, $00 ; $00A469 |

  db $0F, $1A, $10, $00, $00, $FB, $23, $10 ; $00A471 |
  db $40, $00, $0E, $05, $10, $40, $00, $FC ; $00A479 |
  db $03, $10, $C0, $00, $FA, $17, $01, $40 ; $00A481 |
  db $00, $EC, $19, $10, $00, $00, $FB, $FB ; $00A489 |
  db $10, $40, $00, $E9, $FD, $00, $40, $00 ; $00A491 |

  db $11, $1C, $01, $00, $00, $FD, $26, $00 ; $00A499 |
  db $00, $00, $11, $08, $01, $00, $00, $FB ; $00A4A1 |
  db $09, $00, $C0, $00, $FB, $1C, $10, $00 ; $00A4A9 |
  db $00, $E9, $1C, $00, $40, $00, $E9, $00 ; $00A4B1 |
  db $01, $40, $00                          ; $00A4B9 |

  db $10, $1B, $00, $00, $00, $FC, $25, $10 ; $00A4BC |
  db $00, $00, $10, $09, $10, $00, $00, $FC ; $00A4C4 |
  db $06, $10, $C0, $00, $FB, $1A, $10, $40 ; $00A4CC |
  db $00, $EA, $1B, $10, $40, $00, $FB, $FD ; $00A4D4 |
  db $11, $00, $00, $E9, $FE, $01, $40, $00 ; $00A4DC |

  db $12, $1D, $01, $00, $00, $FE, $28, $01 ; $00A4E4 |
  db $00, $00, $11, $09, $01, $00, $00, $FB ; $00A4EC |
  db $0B, $00, $C0, $00, $FD, $1D, $01, $00 ; $00A4F4 |
  db $00, $E9, $04, $00, $40, $00           ; $00A4FC |

  db $11, $21, $00, $00, $00, $10, $0C, $00 ; $00A502 |
  db $00, $00, $FA, $0E, $01, $C0, $00, $FD ; $00A50A |
  db $1E, $01, $00, $00, $EA, $07, $10, $40 ; $00A512 |
  db $00                                    ; $00A51A |

  db $10, $0E, $10, $00, $00, $FB, $11, $01 ; $00A51B |
  db $40, $00, $FC, $22, $10, $00, $00, $EA ; $00A523 |
  db $0A, $10, $00, $00                     ; $00A52B |

  db $0F, $13, $11, $00, $00, $FB, $25, $11 ; $00A52F |
  db $00, $00, $EB, $0A, $00, $00, $00      ; $00A537 |

  db $FA, $26, $10, $40, $00, $EB, $0B, $01 ; $00A53E |
  db $00, $00                               ; $00A546 |

  db $F9, $27, $01, $40, $00                ; $00A548 |

  dw $F800, $0800                           ; $00A54D |

  JSR CODE_008AE5                           ; $00A551 |
  LDY #$00                                  ; $00A554 |
  LDA $7142,x                               ; $00A556 |
  CMP $7E4C,x                               ; $00A559 |
  BPL CODE_00A560                           ; $00A55C |
  INY                                       ; $00A55E |
  INY                                       ; $00A55F |

CODE_00A560:
  LDA $A54D,y                               ; $00A560 |
  STA $75A2,x                               ; $00A563 |
  RTS                                       ; $00A566 |

  db $07, $07, $05, $04, $04, $04, $04, $04 ; $00A567 |

  JSR CODE_008AE5                           ; $00A56F |
  LDA $7782,x                               ; $00A572 |
  BNE CODE_00A58B                           ; $00A575 |
  DEC $73C2,x                               ; $00A577 |
  BPL CODE_00A57F                           ; $00A57A |
  JMP CODE_008AF8                           ; $00A57C |

CODE_00A57F:
  LDY $73C2,x                               ; $00A57F |
  LDA $A567,y                               ; $00A582 |
  AND #$00FF                                ; $00A585 |
  STA $7782,x                               ; $00A588 |

CODE_00A58B:
  RTS                                       ; $00A58B |

  db $06, $06, $06, $06, $06, $05, $05, $05 ; $00A58C |
  db $05, $05, $05, $04, $04, $04           ; $00A594 |

  PHX                                       ; $00A59A |
  TXA                                       ; $00A59B |
  AND #$00FF                                ; $00A59C |
  STA !gsu_r10                              ; $00A59F |
  LDA #$0000                                ; $00A5A2 |
  STA !gsu_r0                               ; $00A5A5 |
  LDA #$A5EB                                ; $00A5A8 |
  STA !gsu_r14                              ; $00A5AB |
  LDX #$09                                  ; $00A5AE |
  LDA #$8CB1                                ; $00A5B0 |
  JSL r_gsu_init_1                          ; $00A5B3 |  GSU init
  PLX                                       ; $00A5B7 |
  JSR CODE_008AE5                           ; $00A5B8 |
  LDA $7782,x                               ; $00A5BB |
  BNE CODE_00A5DB                           ; $00A5BE |
  DEC $73C2,x                               ; $00A5C0 |
  BPL CODE_00A5C8                           ; $00A5C3 |
  JMP CODE_008AF8                           ; $00A5C5 |

CODE_00A5C8:
  SEP #$20                                  ; $00A5C8 |
  LDY $73C2,x                               ; $00A5CA |
  LDA $A5DC,y                               ; $00A5CD |
  STA $7001,x                               ; $00A5D0 |
  LDA $A58C,y                               ; $00A5D3 |
  STA $7782,x                               ; $00A5D6 |
  REP #$20                                  ; $00A5D9 |

CODE_00A5DB:
  RTS                                       ; $00A5DB |

  db $08, $08, $08, $10, $18, $20, $18, $18 ; $00A5DC |
  db $18, $18, $10, $10, $10, $08, $08      ; $00A5E4 |

  dw $A6A4, $A69F, $A69A, $A690             ; $00A5EB |
  dw $A681, $A66D, $A65E, $A64F             ; $00A5F3 |
  dw $A640, $A631, $A627, $A61D             ; $00A5FB |
  dw $A613, $A60E, $A609                    ; $00A603 |

  db $00, $00, $E3, $06, $02                ; $00A609 |

  db $00, $01, $E3, $06, $02                ; $00A60E |

  db $00, $00, $F8, $06, $00                ; $00A613 |
  db $00, $03, $E3, $06, $02                ; $00A618 |

  db $00, $00, $F8, $46, $00                ; $00A61D |
  db $00, $06, $E3, $06, $02                ; $00A622 |

  db $00, $00, $F8, $06, $00                ; $00A627 |
  db $00, $0A, $E5, $06, $02                ; $00A62C |

  db $08, $09, $F8, $06, $00                ; $00A631 |
  db $00, $01, $F7, $46, $00                ; $00A636 |
  db $00, $0E, $E5, $46, $02                ; $00A63B |

  db $08, $0A, $F8, $46, $00                ; $00A640 |
  db $00, $03, $F7, $06, $00                ; $00A645 |
  db $00, $12, $E5, $06, $02                ; $00A64A |

  db $08, $0C, $F7, $06, $00                ; $00A64F |
  db $00, $05, $F7, $46, $00                ; $00A654 |
  db $00, $16, $E5, $46, $02                ; $00A659 |

  db $08, $0E, $F7, $46, $00                ; $00A65E |
  db $00, $07, $F7, $06, $00                ; $00A663 |
  db $00, $1A, $E7, $06, $02                ; $00A668 |

  db $00, $0B, $E1, $06, $00                ; $00A66D |
  db $04, $18, $F8, $06, $00                ; $00A672 |
  db $08, $10, $E1, $06, $00                ; $00A677 |
  db $00, $1E, $E7, $46, $02                ; $00A67C |

  db $04, $19, $F8, $46, $00                ; $00A681 |
  db $08, $12, $E1, $06, $00                ; $00A686 |
  db $00, $22, $E7, $86, $02                ; $00A68B |

  db $04, $1B, $F8, $06, $00                ; $00A690 |
  db $00, $26, $E7, $C6, $02                ; $00A695 |

  db $04, $1D, $59, $06, $00                ; $00A69A |

  db $04, $1F, $F7, $46, $00                ; $00A69F |
  db $04, $21, $E1, $06, $00                ; $00A6A4 |

  JSR CODE_008AE5                           ; $00A6A9 |
  LDA $7782,x                               ; $00A6AC |
  BNE CODE_00A6B4                           ; $00A6AF |
  JMP CODE_008AF8                           ; $00A6B1 |

CODE_00A6B4:
  LDA $7E8E,x                               ; $00A6B4 |
  BNE CODE_00A6CD                           ; $00A6B7 |
  SEP #$20                                  ; $00A6B9 |
  LDA #$02                                  ; $00A6BB |
  STA $7E8E,x                               ; $00A6BD |
  DEC $73C2,x                               ; $00A6C0 |
  BPL CODE_00A6CB                           ; $00A6C3 |
  LDA $7E4C,x                               ; $00A6C5 |
  STA $73C2,x                               ; $00A6C8 |

CODE_00A6CB:
  REP #$20                                  ; $00A6CB |

CODE_00A6CD:
  RTS                                       ; $00A6CD |

  JSR CODE_008AE5                           ; $00A6CE |
  LDA $7820,x                               ; $00A6D1 |
  AND #$0001                                ; $00A6D4 |
  BEQ CODE_00A701                           ; $00A6D7 |
  LDA $73C2,x                               ; $00A6D9 |
  BNE CODE_00A6E4                           ; $00A6DC |
  LDA #$001C                                ; $00A6DE |
  STA $6F62,x                               ; $00A6E1 |

CODE_00A6E4:
  CMP #$0003                                ; $00A6E4 |
  BEQ CODE_00A6EC                           ; $00A6E7 |
  INC $73C2,x                               ; $00A6E9 |

CODE_00A6EC:
  LDA $71E2,x                               ; $00A6EC |
  BMI CODE_00A701                           ; $00A6EF |
  LSR A                                     ; $00A6F1 |
  CMP #$0020                                ; $00A6F2 |
  BCS CODE_00A6FA                           ; $00A6F5 |
  JMP CODE_008AF8                           ; $00A6F7 |

CODE_00A6FA:
  EOR #$FFFF                                ; $00A6FA |
  INC A                                     ; $00A6FD |
  STA $71E2,x                               ; $00A6FE |

CODE_00A701:
  RTS                                       ; $00A701 |

  db $0A, $09, $08, $07, $06, $05, $04, $03 ; $00A702 |
  db $02, $01, $00, $00                     ; $00A70A |

  db $04, $04, $03, $03, $02, $02, $01, $01 ; $00A70E |
  db $01, $01, $01, $01                     ; $00A716 |

  db $01, $01, $01, $01, $01, $01, $01, $01 ; $00A71A |
  db $01, $01, $FF, $01, $20, $E5, $8A, $BD ; $00A722 |
  db $82, $77, $D0, $21, $DE, $4C, $7E, $10 ; $00A72A |
  db $03                                    ; $00A732 |

  JMP CODE_008AF8                           ; $00A733 |

  SEP #$20                                  ; $00A736 |
  LDY $7E4C,x                               ; $00A738 |
  LDA $A702,y                               ; $00A73B |
  STA $73C2,x                               ; $00A73E |
  LDA $A70E,y                               ; $00A741 |
  STA $7782,x                               ; $00A744 |
  LDA $A71A,y                               ; $00A747 |
  STA $7462,x                               ; $00A74A |
  REP #$20                                  ; $00A74D |
  RTS                                       ; $00A74F |

  db $03, $03, $03, $03, $03, $03, $03, $02 ; $00A750 |
  db $02                                    ; $00A758 |

  JSR CODE_008AE5                           ; $00A759 |
  LDA $7782,x                               ; $00A75C |
  BNE CODE_00A775                           ; $00A75F |
  DEC $73C2,x                               ; $00A761 |
  BPL CODE_00A769                           ; $00A764 |
  JMP CODE_008AF8                           ; $00A766 |

CODE_00A769:
  LDY $73C2,x                               ; $00A769 |
  LDA $A750,y                               ; $00A76C |
  AND #$00FF                                ; $00A76F |
  STA $7782,x                               ; $00A772 |

CODE_00A775:
  RTS                                       ; $00A775 |

  JSR CODE_008AE5                           ; $00A776 |
  LDA $7782,x                               ; $00A779 |
  BNE CODE_00A78C                           ; $00A77C |
  DEC $73C2,x                               ; $00A77E |
  BPL CODE_00A786                           ; $00A781 |
  JMP CODE_008AF8                           ; $00A783 |

CODE_00A786:
  LDA #$0003                                ; $00A786 |
  STA $7782,x                               ; $00A789 |

CODE_00A78C:
  RTS                                       ; $00A78C |

  JSR CODE_008AE5                           ; $00A78D |
  LDA $7782,x                               ; $00A790 |
  BNE CODE_00A7A3                           ; $00A793 |
  DEC $73C2,x                               ; $00A795 |
  BPL CODE_00A79D                           ; $00A798 |
  JMP CODE_008AF8                           ; $00A79A |

CODE_00A79D:
  LDA #$0004                                ; $00A79D |
  STA $7782,x                               ; $00A7A0 |

CODE_00A7A3:
  RTS                                       ; $00A7A3 |

  JSR CODE_008AE5                           ; $00A7A4 |
  LDA $7782,x                               ; $00A7A7 |
  BNE CODE_00A7D0                           ; $00A7AA |
  SEP #$20                                  ; $00A7AC |
  LDA #$01                                  ; $00A7AE |
  STA $7462,x                               ; $00A7B0 |
  REP #$20                                  ; $00A7B3 |
  LDA #$0004                                ; $00A7B5 |
  STA $7782,x                               ; $00A7B8 |
  DEC $73C2,x                               ; $00A7BB |
  BPL CODE_00A7D0                           ; $00A7BE |
  LDA #$0001                                ; $00A7C0 |
  STA $73C2,x                               ; $00A7C3 |
  LDA $7142,x                               ; $00A7C6 |
  CLC                                       ; $00A7C9 |
  ADC #$0008                                ; $00A7CA |
  STA $7142,x                               ; $00A7CD |

CODE_00A7D0:
  RTS                                       ; $00A7D0 |

  db $03, $03, $02, $02, $02, $01, $01, $01 ; $00A7D1 |
  db $02                                    ; $00A7D9 |

  JSR CODE_008AE5                           ; $00A7DA |
  LDA $7782,x                               ; $00A7DD |
  BNE CODE_00A7F6                           ; $00A7E0 |
  DEC $73C2,x                               ; $00A7E2 |
  BPL CODE_00A7EA                           ; $00A7E5 |
  JMP CODE_008AF8                           ; $00A7E7 |

CODE_00A7EA:
  LDY $73C2,x                               ; $00A7EA |
  LDA $A7D1,y                               ; $00A7ED |
  AND #$00FF                                ; $00A7F0 |
  STA $7782,x                               ; $00A7F3 |

CODE_00A7F6:
  RTS                                       ; $00A7F6 |

  JSR CODE_008AE5                           ; $00A7F7 |
  LDA $7782,x                               ; $00A7FA |
  BNE CODE_00A80D                           ; $00A7FD |
  DEC $73C2,x                               ; $00A7FF |
  BPL CODE_00A807                           ; $00A802 |
  JMP CODE_008AF8                           ; $00A804 |

CODE_00A807:
  LDA #$0002                                ; $00A807 |
  STA $7782,x                               ; $00A80A |

CODE_00A80D:
  RTS                                       ; $00A80D |

  JSR CODE_008AF2                           ; $00A80E |
  RTS                                       ; $00A811 |

  dw $282C, $2024, $181C, $14FF             ; $00A812 |
  dw $10FF, $0CFF, $08FF, $04FF             ; $00A81A |
  dw $00FF                                  ; $00A822 |

  db $04, $04, $04, $04, $04, $04, $02, $02 ; $00A824 |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $00A82C |
  db $02                                    ; $00A834 |

  LDY $7E4C,x                               ; $00A835 |
  LDA $A811,y                               ; $00A838 |
  BMI CODE_00A890                           ; $00A83B |
  XBA                                       ; $00A83D |
  ORA $7E4E,x                               ; $00A83E |
  AND #$00FF                                ; $00A841 |
  STA $73C2,x                               ; $00A844 |
  STX $00                                   ; $00A847 |
  TXA                                       ; $00A849 |
  AND #$00FF                                ; $00A84A |
  STA !gsu_r10                              ; $00A84D |
  LDA #$0000                                ; $00A850 |
  STA !gsu_r0                               ; $00A853 |
  LDA #$A8AE                                ; $00A856 |
  STA !gsu_r14                              ; $00A859 |
  LDX #$09                                  ; $00A85C |
  LDA #$8CB1                                ; $00A85E |
  JSL r_gsu_init_1                          ; $00A861 |  GSU init
  LDX $00                                   ; $00A865 |
  LDA #$0004                                ; $00A867 |
  STA !gsu_r7                               ; $00A86A |
  LDA $70A2,x                               ; $00A86D |
  STA !gsu_r1                               ; $00A870 |
  LDA $7142,x                               ; $00A873 |
  STA !gsu_r2                               ; $00A876 |
  LDA $78C2,x                               ; $00A879 |
  STA !gsu_r3                               ; $00A87C |
  LDA $7322,x                               ; $00A87F |
  STA !gsu_r5                               ; $00A882 |
  LDX #$09                                  ; $00A885 |
  LDA #$F5F4                                ; $00A887 |
  JSL r_gsu_init_1                          ; $00A88A |  GSU init
  LDX $00                                   ; $00A88E |

CODE_00A890:
  JSR CODE_008AE5                           ; $00A890 |
  LDA $7782,x                               ; $00A893 |
  BNE CODE_00A8AD                           ; $00A896 |
  DEC $7E4C,x                               ; $00A898 |
  BPL CODE_00A8A0                           ; $00A89B |
  JMP CODE_008AF8                           ; $00A89D |

CODE_00A8A0:
  SEP #$20                                  ; $00A8A0 |
  LDY $7E4C,x                               ; $00A8A2 |
  LDA $A824,y                               ; $00A8A5 |
  STA $7782,x                               ; $00A8A8 |
  REP #$20                                  ; $00A8AB |

CODE_00A8AD:
  RTS                                       ; $00A8AD |

  dw $A90E, $AA12, $AB16, $AC1A             ; $00A8AE |
  dw $A922, $AA26, $AB2A, $AC2E             ; $00A8B6 |
  dw $A936, $AA3A, $AB3E, $AC42             ; $00A8BE |
  dw $A94A, $AA4E, $AB52, $AC56             ; $00A8C6 |
  dw $A95E, $AA62, $AB66, $AC6A             ; $00A8CE |
  dw $A972, $AA76, $AB7A, $AC7E             ; $00A8D6 |
  dw $A986, $AA8A, $AB8E, $AC92             ; $00A8DE |
  dw $A99A, $AA9E, $ABA2, $ACA6             ; $00A8E6 |
  dw $A9AE, $AAB2, $ABB6, $ACBA             ; $00A8EE |
  dw $A9C2, $AAC6, $ABCA, $ACCE             ; $00A8F6 |
  dw $A9D6, $AADA, $ABDE, $ACE2             ; $00A8FE |
  dw $A9EA, $AAEE, $ABF2, $ACF6             ; $00A906 |

  db $FC, $00, $42, $C2, $02                ; $00A90E |
  db $FC, $F0, $42, $42, $02                ; $00A913 |
  db $EC, $00, $42, $82, $02                ; $00A918 |
  db $EC, $F0, $42, $02, $02                ; $00A91D |

  db $0C, $FC, $42, $C2, $02                ; $00A922 |
  db $FC, $FC, $42, $82, $02                ; $00A927 |
  db $0C, $EC, $42, $42, $02                ; $00A92C |
  db $FC, $EC, $42, $02, $02                ; $00A931 |

  db $14, $08, $42, $C2, $02                ; $00A936 |
  db $14, $F8, $42, $42, $02                ; $00A93B |
  db $04, $08, $42, $82, $02                ; $00A940 |
  db $04, $F8, $42, $02, $02                ; $00A945 |

  db $0C, $14, $42, $C2, $02                ; $00A94A |
  db $FC, $14, $42, $82, $02                ; $00A94F |
  db $0C, $04, $42, $42, $02                ; $00A954 |
  db $FC, $04, $42, $02, $02                ; $00A959 |

  db $FC, $10, $42, $C2, $02                ; $00A95E |
  db $EC, $10, $42, $82, $02                ; $00A963 |
  db $FC, $00, $42, $42, $02                ; $00A968 |
  db $EC, $00, $42, $02, $02                ; $00A96D |

  db $08, $08, $42, $C2, $02                ; $00A972 |
  db $F8, $08, $42, $82, $02                ; $00A977 |
  db $08, $F8, $42, $42, $02                ; $00A97C |
  db $F8, $F8, $42, $02, $02                ; $00A981 |

  db $08, $04, $E3, $06, $02                ; $00A986 |
  db $FC, $08, $E3, $06, $02                ; $00A98B |
  db $04, $FC, $E3, $06, $02                ; $00A990 |
  db $F8, $F8, $E3, $06, $02                ; $00A995 |

  db $08, $02, $E3, $06, $02                ; $00A99A |
  db $FC, $06, $E3, $06, $02                ; $00A99F |
  db $04, $FA, $E3, $06, $02                ; $00A9A4 |
  db $F8, $F6, $E5, $06, $02                ; $00A9A9 |

  db $08, $00, $E5, $06, $02                ; $00A9AE |
  db $FC, $04, $E3, $06, $02                ; $00A9B3 |
  db $04, $F8, $E3, $06, $02                ; $00A9B8 |
  db $F8, $F4, $E7, $06, $02                ; $00A9BD |

  db $08, $EE, $E0, $02, $00                ; $00A9C2 |
  db $08, $FE, $E7, $06, $02                ; $00A9C7 |
  db $FC, $02, $E3, $06, $02                ; $00A9CC |
  db $04, $F6, $E5, $06, $02                ; $00A9D1 |

  db $08, $EC, $E0, $02, $00                ; $00A9D6 |
  db $08, $E4, $E0, $02, $00                ; $00A9DB |
  db $FC, $00, $E5, $06, $02                ; $00A9E0 |
  db $04, $F4, $E7, $06, $02                ; $00A9E5 |

  db $08, $F6, $E0, $02, $00                ; $00A9EA |
  db $08, $EE, $E0, $02, $00                ; $00A9EF |
  db $08, $E6, $E0, $02, $00                ; $00A9F4 |
  db $FC, $FE, $E7, $06, $02                ; $00A9F9 |
  db $00, $10, $E0, $02, $00                ; $00A9FE |
  db $00, $08, $E0, $02, $00                ; $00AA03 |
  db $00, $00, $E0, $02, $00                ; $00AA08 |
  db $00, $F8, $E0, $02, $00                ; $00AA0D |

  db $FF, $02, $60, $C3, $02                ; $00AA12 |
  db $FF, $F2, $60, $43, $02                ; $00AA17 |
  db $EF, $02, $60, $83, $02                ; $00AA1C |
  db $EF, $F2, $60, $03, $02                ; $00AA21 |

  db $0B, $FF, $60, $C3, $02                ; $00AA26 |
  db $FB, $FF, $60, $83, $02                ; $00AA2B |
  db $0B, $EF, $60, $43, $02                ; $00AA30 |
  db $FB, $EF, $60, $03, $02                ; $00AA35 |

  db $11, $08, $60, $C3, $02                ; $00AA3A |
  db $11, $F8, $60, $43, $02                ; $00AA3F |
  db $01, $08, $60, $83, $02                ; $00AA44 |
  db $01, $F8, $60, $03, $02                ; $00AA49 |

  db $0B, $11, $60, $C3, $02                ; $00AA4E |
  db $FB, $11, $60, $83, $02                ; $00AA53 |
  db $0B, $01, $60, $43, $02                ; $00AA58 |
  db $FB, $01, $60, $03, $02                ; $00AA5D |

  db $FF, $0E, $60, $C3, $02                ; $00AA62 |
  db $EF, $0E, $60, $83, $02                ; $00AA67 |
  db $FF, $FE, $60, $43, $02                ; $00AA6C |
  db $EF, $FE, $60, $03, $02                ; $00AA71 |

  db $08, $08, $60, $C3, $02                ; $00AA76 |
  db $F8, $08, $60, $83, $02                ; $00AA7B |
  db $08, $F8, $60, $43, $02                ; $00AA80 |
  db $F8, $F8, $60, $03, $02                ; $00AA85 |

  db $06, $03, $63, $07, $02                ; $00AA8A |
  db $FD, $06, $63, $07, $02                ; $00AA8F |
  db $03, $FD, $63, $07, $02                ; $00AA94 |
  db $FA, $FA, $63, $07, $02                ; $00AA99 |

  db $06, $01, $63, $07, $02                ; $00AA9E |
  db $FD, $04, $63, $07, $02                ; $00AAA3 |
  db $03, $FB, $63, $07, $02                ; $00AAA8 |
  db $FA, $F8, $65, $07, $02                ; $00AAAD |

  db $06, $00, $65, $07, $02                ; $00AAB2 |
  db $FD, $03, $63, $07, $02                ; $00AAB7 |
  db $03, $FA, $63, $07, $02                ; $00AABC |
  db $FA, $F7, $67, $07, $02                ; $00AAC1 |

  db $08, $F0, $E0, $02, $00                ; $00AAC6 |
  db $06, $FE, $67, $07, $02                ; $00AACB |
  db $FD, $01, $63, $07, $02                ; $00AAD0 |
  db $03, $F8, $65, $07, $02                ; $00AAD5 |

  db $08, $E7, $E0, $02, $00                ; $00AADA |
  db $08, $EF, $E0, $02, $00                ; $00AADF |
  db $FD, $00, $65, $07, $02                ; $00AAE4 |
  db $03, $F7, $67, $07, $02                ; $00AAE9 |

  db $08, $E5, $E0, $02, $00                ; $00AAEE |
  db $08, $ED, $E0, $02, $00                ; $00AAF3 |
  db $08, $F5, $E0, $02, $00                ; $00AAF8 |
  db $FD, $FD, $67, $07, $02                ; $00AAFD |
  db $00, $10, $E0, $02, $00                ; $00AB02 |
  db $00, $08, $E0, $02, $00                ; $00AB07 |
  db $00, $00, $E0, $02, $00                ; $00AB0C |
  db $00, $F8, $E0, $02, $00                ; $00AB11 |

  db $02, $04, $72, $C3, $00                ; $00AB16 |
  db $02, $FC, $72, $43, $00                ; $00AB1B |
  db $FA, $04, $72, $83, $00                ; $00AB20 |
  db $FA, $FC, $72, $03, $00                ; $00AB25 |

  db $0A, $02, $72, $C3, $00                ; $00AB2A |
  db $02, $02, $72, $83, $00                ; $00AB2F |
  db $0A, $FA, $72, $43, $00                ; $00AB34 |
  db $02, $FA, $72, $03, $00                ; $00AB39 |

  db $0E, $08, $72, $C3, $00                ; $00AB3E |
  db $0E, $00, $72, $43, $00                ; $00AB43 |
  db $06, $08, $72, $83, $00                ; $00AB48 |
  db $06, $00, $72, $03, $00                ; $00AB4D |

  db $0A, $0E, $72, $C3, $00                ; $00AB52 |
  db $02, $0E, $72, $83, $00                ; $00AB57 |
  db $0A, $06, $72, $43, $00                ; $00AB5C |
  db $02, $06, $72, $03, $00                ; $00AB61 |

  db $02, $0C, $72, $C3, $00                ; $00AB66 |
  db $FA, $0C, $72, $83, $00                ; $00AB6B |
  db $02, $04, $72, $43, $00                ; $00AB70 |
  db $FA, $04, $72, $03, $00                ; $00AB75 |

  db $08, $08, $72, $C3, $00                ; $00AB7A |
  db $00, $08, $72, $83, $00                ; $00AB7F |
  db $08, $00, $72, $43, $00                ; $00AB84 |
  db $00, $00, $72, $03, $00                ; $00AB89 |

  db $00, $00, $69, $07, $00                ; $00AB8E |
  db $06, $02, $69, $07, $00                ; $00AB93 |
  db $08, $06, $69, $07, $00                ; $00AB98 |
  db $02, $08, $69, $07, $00                ; $00AB9D |

  db $00, $FF, $6A, $07, $00                ; $00ABA2 |
  db $06, $01, $69, $07, $00                ; $00ABA7 |
  db $08, $05, $69, $07, $00                ; $00ABAC |
  db $02, $07, $69, $07, $00                ; $00ABB1 |

  db $00, $FE, $6B, $07, $00                ; $00ABB6 |
  db $06, $00, $69, $07, $00                ; $00ABBB |
  db $08, $04, $6A, $07, $00                ; $00ABC0 |
  db $02, $06, $69, $07, $00                ; $00ABC5 |

  db $08, $F7, $E0, $02, $00                ; $00ABCA |
  db $06, $FF, $6A, $07, $00                ; $00ABCF |
  db $08, $03, $6B, $07, $00                ; $00ABD4 |
  db $02, $05, $69, $07, $00                ; $00ABD9 |

  db $08, $EE, $E0, $02, $00                ; $00ABDE |
  db $08, $F6, $E0, $02, $00                ; $00ABE3 |
  db $06, $FE, $6B, $07, $00                ; $00ABE8 |
  db $02, $04, $6A, $07, $00                ; $00ABED |

  db $08, $E5, $E0, $02, $00                ; $00ABF2 |
  db $08, $ED, $E0, $02, $00                ; $00ABF7 |
  db $08, $FB, $E0, $02, $00                ; $00ABFC |
  db $02, $03, $6B, $07, $00                ; $00AC01 |
  db $00, $10, $E0, $02, $00                ; $00AC06 |
  db $00, $08, $E0, $02, $00                ; $00AC0B |
  db $00, $00, $E0, $02, $00                ; $00AC10 |
  db $00, $F8, $E0, $02, $00                ; $00AC15 |

  db $05, $06, $62, $C3, $00                ; $00AC1A |
  db $05, $FE, $62, $43, $00                ; $00AC1F |
  db $FD, $06, $62, $83, $00                ; $00AC24 |
  db $FD, $FE, $62, $03, $00                ; $00AC29 |

  db $0B, $FD, $62, $43, $00                ; $00AC2E |
  db $0B, $05, $62, $C3, $00                ; $00AC33 |
  db $03, $05, $62, $83, $00                ; $00AC38 |
  db $03, $FD, $62, $03, $00                ; $00AC3D |

  db $0B, $00, $62, $43, $00                ; $00AC42 |
  db $0B, $08, $62, $C3, $00                ; $00AC47 |
  db $03, $08, $62, $83, $00                ; $00AC4C |
  db $03, $00, $62, $03, $00                ; $00AC51 |

  db $03, $0B, $62, $83, $00                ; $00AC56 |
  db $0B, $03, $62, $43, $00                ; $00AC5B |
  db $0B, $0B, $62, $C3, $00                ; $00AC60 |
  db $03, $03, $62, $03, $00                ; $00AC65 |

  db $04, $0A, $62, $C3, $00                ; $00AC6A |
  db $04, $02, $62, $43, $00                ; $00AC6F |
  db $FC, $0A, $62, $83, $00                ; $00AC74 |
  db $FC, $02, $62, $03, $00                ; $00AC79 |

  db $08, $00, $62, $43, $00                ; $00AC7E |
  db $08, $08, $62, $C3, $00                ; $00AC83 |
  db $00, $08, $62, $83, $00                ; $00AC88 |
  db $00, $00, $62, $03, $00                ; $00AC8D |

  db $05, $03, $79, $07, $00                ; $00AC92 |
  db $06, $05, $79, $07, $00                ; $00AC97 |
  db $03, $06, $79, $07, $00                ; $00AC9C |
  db $02, $02, $79, $07, $00                ; $00ACA1 |

  db $05, $02, $79, $07, $00                ; $00ACA6 |
  db $06, $04, $79, $07, $00                ; $00ACAB |
  db $03, $05, $79, $07, $00                ; $00ACB0 |
  db $02, $01, $7A, $07, $00                ; $00ACB5 |

  db $05, $02, $79, $07, $00                ; $00ACBA |
  db $06, $04, $7A, $07, $00                ; $00ACBF |
  db $03, $05, $79, $07, $00                ; $00ACC4 |
  db $02, $01, $7B, $07, $00                ; $00ACC9 |

  db $08, $F9, $E0, $02, $00                ; $00ACCE |
  db $05, $01, $7A, $07, $00                ; $00ACD3 |
  db $06, $03, $7B, $07, $00                ; $00ACD8 |
  db $03, $04, $79, $07, $00                ; $00ACDD |

  db $08, $F1, $E0, $02, $00                ; $00ACE2 |
  db $08, $F9, $E0, $02, $00                ; $00ACE7 |
  db $05, $01, $7B, $07, $00                ; $00ACEC |
  db $03, $04, $7A, $07, $00                ; $00ACF1 |

  db $08, $EB, $E0, $02, $00                ; $00ACF6 |
  db $08, $F3, $E0, $02, $00                ; $00ACFB |
  db $08, $FB, $E0, $02, $00                ; $00AD00 |
  db $03, $03, $7B, $07, $00                ; $00AD05 |

  LDA $7322,x                               ; $00AD0A |
  BMI CODE_00AD61                           ; $00AD0D |
  REP #$10                                  ; $00AD0F |
  TAY                                       ; $00AD11 |
  LDA $7E4C,x                               ; $00AD12 |
  STA $00                                   ; $00AD15 |
  LDA $6000,y                               ; $00AD17 |
  SEC                                       ; $00AD1A |
  SBC $00                                   ; $00AD1B |
  STA $6000,y                               ; $00AD1D |
  LDA $6002,y                               ; $00AD20 |
  SEC                                       ; $00AD23 |
  SBC $00                                   ; $00AD24 |
  STA $6002,y                               ; $00AD26 |
  LDA $6008,y                               ; $00AD29 |
  CLC                                       ; $00AD2C |
  ADC $00                                   ; $00AD2D |
  STA $6008,y                               ; $00AD2F |
  LDA $600A,y                               ; $00AD32 |
  SEC                                       ; $00AD35 |
  SBC $00                                   ; $00AD36 |
  STA $600A,y                               ; $00AD38 |
  LDA $6010,y                               ; $00AD3B |
  SEC                                       ; $00AD3E |
  SBC $00                                   ; $00AD3F |
  STA $6010,y                               ; $00AD41 |
  LDA $6012,y                               ; $00AD44 |
  CLC                                       ; $00AD47 |
  ADC $00                                   ; $00AD48 |
  STA $6012,y                               ; $00AD4A |
  LDA $6018,y                               ; $00AD4D |
  CLC                                       ; $00AD50 |
  ADC $00                                   ; $00AD51 |
  STA $6018,y                               ; $00AD53 |
  LDA $601A,y                               ; $00AD56 |
  CLC                                       ; $00AD59 |
  ADC $00                                   ; $00AD5A |
  STA $601A,y                               ; $00AD5C |
  SEP #$10                                  ; $00AD5F |

CODE_00AD61:
  JSR CODE_008AE5                           ; $00AD61 |
  LDA $7782,x                               ; $00AD64 |
  BNE CODE_00AD6C                           ; $00AD67 |
  JMP CODE_008AF8                           ; $00AD69 |

CODE_00AD6C:
  RTS                                       ; $00AD6C |

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
; this is part of loading for a scene, offsets are types of scenes

scene_gfx_layout:
; $000: in level
  db $19                                    ; $00AD6D |
  dw $F800, $1000                           ; $00AD6E |
  db $12                                    ; $00AD71 |
  dw $9200, $0400                           ; $00AD73 |
  db $76                                    ; $00AD77 |
  dw $9500, $0600                           ; $00AD78 |
  db $72                                    ; $00AD7C |
  dw $C000, $2000                           ; $00AD7D |
  db $4F                                    ; $00AD81 |
  dw $6000                                  ; $00AD82 |
  db $F3                                    ; $00AD84 |
  dw $9800, $1000                           ; $00AD85 |
  db $F4                                    ; $00AD89 |
  dw $A000, $1000                           ; $00AD8A |
  db $F0                                    ; $00AD8E |
  dw $0000                                  ; $00AD8F |
  db $F1                                    ; $00AD91 |
  dw $0800                                  ; $00AD92 |
  db $F2                                    ; $00AD94 |
  dw $7000                                  ; $00AD95 |
  db $F7                                    ; $00AD97 |
  dw $D000, $0400                           ; $00AD98 |
  db $F8                                    ; $00AD9C |
  dw $D200, $0400                           ; $00AD9D |
  db $F9                                    ; $00ADA1 |
  dw $D400, $0400                           ; $00ADA2 |
  db $FA                                    ; $00ADA6 |
  dw $D600, $0400                           ; $00ADA7 |
  db $FB                                    ; $00ADAB |
  dw $D800, $0400                           ; $00ADAC |
  db $FC                                    ; $00ADB0 |
  dw $DA00, $0400                           ; $00ADB1 |
  db $F5                                    ; $00ADB5 |
  dw $2800                                  ; $00ADB6 |
  db $F6                                    ; $00ADB8 |
  dw $2C00                                  ; $00ADB9 |
  db $FF                                    ; $00ADBB |

; $04F: Yoshi's Island (file selection scene, end world cutscenes)
  db $F0                                    ; $00ADBC |
  dw $3400                                  ; $00ADBD |
  db $1D                                    ; $00ADBF |
  dw $3800                                  ; $00ADC0 |
  db $73                                    ; $00ADC2 |
  dw $DC00, $0800                           ; $00ADC3 |
  db $73                                    ; $00ADC7 |
  dw $FC00, $0800                           ; $00ADC8 |
  db $74                                    ; $00ADCC |
  dw $BC00, $0800                           ; $00ADCD |
  db $B1                                    ; $00ADD1 |
  dw $0000                                  ; $00ADD2 |
  db $FF                                    ; $00ADD4 |

; $068: Nintendo Presents
  db $72                                    ; $00ADD5 |
  dw $C000, $2000                           ; $00ADD6 |
  db $FF                                    ; $00ADDA |

; $06E: toadies death cinematic
  db $10                                    ; $00ADDB |
  dw $C000, $1000                           ; $00ADDC |
  db $11                                    ; $00ADE0 |
  dw $C800, $1000                           ; $00ADE1 |
  db $FF                                    ; $00ADE5 |

; $079: intro cinematic
  db $27                                    ; $00ADE6 |
  dw $7800                                  ; $00ADE7 |
  db $87                                    ; $00ADE9 |
  dw $8000, $2000                           ; $00ADEA |
  db $88                                    ; $00ADEE |
  dw $9000, $2000                           ; $00ADEF |
  db $89                                    ; $00ADF3 |
  dw $A000, $2000                           ; $00ADF4 |
  db $8B                                    ; $00ADF8 |
  dw $B000, $2000                           ; $00ADF9 |
  db $8A                                    ; $00ADFD |
  dw $C000, $2000                           ; $00ADFE |
  db $4A                                    ; $00AE02 |
  dw $5000                                  ; $00AE03 |
  db $73                                    ; $00AE05 |
  dw $7400                                  ; $00AE06 |
  db $74                                    ; $00AE08 |
  dw $6000                                  ; $00AE09 |
  db $75                                    ; $00AE0B |
  dw $6800                                  ; $00AE0C |
  db $FF                                    ; $00AE0E |

; $0A2: map scene
  db $F0                                    ; $00AE0F |
  dw $0000                                  ; $00AE10 |
  db $F1                                    ; $00AE12 |
  dw $0800                                  ; $00AE13 |
  db $7E                                    ; $00AE15 |
  dw $1400                                  ; $00AE16 |
  db $F2                                    ; $00AE18 |
  dw $B800, $0800                           ; $00AE19 |
  db $F3                                    ; $00AE1D |
  dw $BC00, $0800                           ; $00AE1E |
  db $56                                    ; $00AE22 |
  dw $1000                                  ; $00AE23 |
  db $F4                                    ; $00AE25 |
  dw $3000                                  ; $00AE26 |
  db $F5                                    ; $00AE28 |
  dw $C000, $0800                           ; $00AE29 |
  db $F6                                    ; $00AE2D |
  dw $C400, $0800                           ; $00AE2E |
  db $F7                                    ; $00AE32 |
  dw $C800, $0800                           ; $00AE33 |
  db $F8                                    ; $00AE37 |
  dw $CC00, $0800                           ; $00AE38 |
  db $F9                                    ; $00AE3C |
  dw $D000, $0800                           ; $00AE3D |
  db $FA                                    ; $00AE41 |
  dw $D400, $0800                           ; $00AE42 |
  db $FB                                    ; $00AE46 |
  dw $D800, $0800                           ; $00AE47 |
  db $FC                                    ; $00AE4B |
  dw $DC00, $0800                           ; $00AE4C |
  db $8F                                    ; $00AE50 |
  dw $E000, $1000                           ; $00AE51 |
  db $8C                                    ; $00AE55 |
  dw $F000, $1000                           ; $00AE56 |
  db $73                                    ; $00AE5A |
  dw $FC00, $0800                           ; $00AE5B |
  db $FF                                    ; $00AE5F |

; $0F3: bonus games
  db $21                                    ; $00AE60 |
  dw $7000                                  ; $00AE61 |
  db $22                                    ; $00AE63 |
  dw $7400                                  ; $00AE64 |
  db $14                                    ; $00AE66 |
  dw $F800, $1000                           ; $00AE67 |
  db $15                                    ; $00AE6B |
  dw $9000, $1000                           ; $00AE6C |
  db $16                                    ; $00AE70 |
  dw $9800, $1000                           ; $00AE71 |
  db $1C                                    ; $00AE75 |
  dw $2800                                  ; $00AE76 |
  db $4E                                    ; $00AE78 |
  dw $2C00                                  ; $00AE79 |
  db $72                                    ; $00AE7B |
  dw $C000, $2000                           ; $00AE7C |
  db $13                                    ; $00AE80 |
  dw $D000, $1000                           ; $00AE81 |
  db $F0                                    ; $00AE85 |
  dw $6800                                  ; $00AE86 |
  db $F2                                    ; $00AE88 |
  dw $3800                                  ; $00AE89 |
  db $F4                                    ; $00AE8B |
  dw $3400                                  ; $00AE8C |
  db $FF                                    ; $00AE8E |

; $122: minigames
  db $41                                    ; $00AE8F |
  dw $7000                                  ; $00AE90 |
  db $19                                    ; $00AE92 |
  dw $F800, $1000                           ; $00AE93 |
  db $25                                    ; $00AE97 |
  dw $0000                                  ; $00AE98 |
  db $26                                    ; $00AE9A |
  dw $0800                                  ; $00AE9B |
  db $F0                                    ; $00AE9D |
  dw $9800, $1000                           ; $00AE9E |
  db $F1                                    ; $00AEA2 |
  dw $A000, $1000                           ; $00AEA3 |
  db $50                                    ; $00AEA7 |
  dw $2800                                  ; $00AEA8 |
  db $4E                                    ; $00AEAA |
  dw $2C00                                  ; $00AEAB |
  db $72                                    ; $00AEAD |
  dw $C000, $2000                           ; $00AEAE |
  db $24                                    ; $00AEB2 |
  dw $5000                                  ; $00AEB3 |
  db $4E                                    ; $00AEB5 |
  dw $D800, $0400                           ; $00AEB6 |
  db $F2                                    ; $00AEBA |
  dw $6800                                  ; $00AEBB |
  db $F3                                    ; $00AEBD |
  dw $3800                                  ; $00AEBE |
  db $FF                                    ; $00AEC0 |

; $154: Raphael the Raven boss fight
  db $F0                                    ; $00AEC1 |
  dw $0000                                  ; $00AEC2 |
  db $F1                                    ; $00AEC4 |
  dw $1000                                  ; $00AEC5 |
  db $F2                                    ; $00AEC7 |
  dw $2000                                  ; $00AEC8 |
  db $F3                                    ; $00AECA |
  dw $3000                                  ; $00AECB |
  db $F4                                    ; $00AECD |
  dw $0000                                  ; $00AECE |
  db $72                                    ; $00AED0 |
  dw $C000, $2000                           ; $00AED1 |
  db $4F                                    ; $00AED5 |
  dw $6000                                  ; $00AED6 |
  db $F5                                    ; $00AED8 |
  dw $D000, $0400                           ; $00AED9 |
  db $F6                                    ; $00AEDD |
  dw $D200, $0400                           ; $00AEDE |
  db $F7                                    ; $00AEE2 |
  dw $D400, $0400                           ; $00AEE3 |
  db $F8                                    ; $00AEE7 |
  dw $D600, $0400                           ; $00AEE8 |
  db $F9                                    ; $00AEEC |
  dw $D800, $0400                           ; $00AEED |
  db $FA                                    ; $00AEF1 |
  dw $DA00, $0400                           ; $00AEF2 |
  db $FF                                    ; $00AEF6 |

; $18A: 6-8 kamek autoscroll section
  db $1B                                    ; $00AEF7 |
  dw $7000                                  ; $00AEF8 |
  db $1E                                    ; $00AEFA |
  dw $7400                                  ; $00AEFB |
  db $1E                                    ; $00AEFD |
  dw $7800                                  ; $00AEFE |
  db $72                                    ; $00AF00 |
  dw $C000, $2000                           ; $00AF01 |
  db $4F                                    ; $00AF05 |
  dw $6000                                  ; $00AF06 |
  db $AF                                    ; $00AF08 |
  dw $2800                                  ; $00AF09 |
  db $AF                                    ; $00AF0B |
  dw $3000                                  ; $00AF0C |
  db $AF                                    ; $00AF0E |
  dw $3800                                  ; $00AF0F |
  db $67                                    ; $00AF11 |
  dw $D000, $0400                           ; $00AF12 |
  db $3C                                    ; $00AF16 |
  dw $D200, $0400                           ; $00AF17 |
  db $55                                    ; $00AF1B |
  dw $D400, $0400                           ; $00AF1C |
  db $1A                                    ; $00AF20 |
  dw $D600, $0400                           ; $00AF21 |
  db $1A                                    ; $00AF25 |
  dw $D800, $0400                           ; $00AF26 |
  db $29                                    ; $00AF2A |
  dw $DA00, $0400                           ; $00AF2B |
  db $FF                                    ; $00AF2F |

; $1C3: credits & ending cutscenes
  db $B3                                    ; $00AF30 |
  dw $D400, $1000                           ; $00AF31 |
  db $AA                                    ; $00AF35 |
  dw $5C00                                  ; $00AF36 |
  db $FF                                    ; $00AF38 |
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
bg1_tileset_files:
  db $00, $01, $40                          ; $00AF39 |
  db $02, $03, $41                          ; $00AF3C |
  db $08, $09, $44                          ; $00AF3F |
  db $0A, $0B, $45                          ; $00AF42 |
  db $04, $05, $42                          ; $00AF45 |
  db $06, $07, $43                          ; $00AF48 |
  db $0C, $0D, $46                          ; $00AF4B |
  db $0E, $0F, $47                          ; $00AF4E |
  db $30, $31, $40                          ; $00AF51 |
  db $32, $33, $41                          ; $00AF54 |
  db $38, $39, $46                          ; $00AF57 |
  db $3A, $3B, $45                          ; $00AF5A |
  db $34, $35, $42                          ; $00AF5D |
  db $36, $37, $47                          ; $00AF60 |
  db $3C, $3D, $46                          ; $00AF63 |
  db $3E, $3F, $47                          ; $00AF66 |

; world 6: same exact layout as above table
; except just for world 6 BG1
bg1_dark_tileset_files:
  db $00, $01, $40                          ; $00AF69 |
  db $69, $6A, $6B                          ; $00AF6C |
  db $08, $09, $44                          ; $00AF6F |
  db $0A, $0B, $45                          ; $00AF72 |
  db $04, $05, $42                          ; $00AF75 |
  db $06, $07, $43                          ; $00AF78 |
  db $0C, $0D, $46                          ; $00AF7B |
  db $0E, $0F, $47                          ; $00AF7E |
  db $30, $31, $40                          ; $00AF81 |
  db $32, $33, $41                          ; $00AF84 |
  db $38, $39, $46                          ; $00AF87 |
  db $3A, $3B, $45                          ; $00AF8A |
  db $34, $35, $42                          ; $00AF8D |
  db $36, $37, $47                          ; $00AF90 |
  db $3C, $3D, $46                          ; $00AF93 |
  db $3E, $3F, $47                          ; $00AF96 |

; BG2 tileset data
; byte 1 -> $7E0013, 2 -> $14
; corresponds to $F3 and $F4 in $AD6D table
; there are 32 BG2 tilesets, $00-$1F
bg2_tileset_files:
  db $17, $18                               ; $00AF99 |
  db $08, $A3                               ; $00AF9B |
  db $02, $03                               ; $00AF9D |
  db $00, $01                               ; $00AF9F |
  db $00, $01                               ; $00AFA1 |
  db $77, $7E                               ; $00AFA3 |
  db $0C, $90                               ; $00AFA5 |
  db $0A, $0B                               ; $00AFA7 |
  db $06, $07                               ; $00AFA9 |
  db $77, $78                               ; $00AFAB |
  db $79, $0E                               ; $00AFAD |
  db $04, $7A                               ; $00AFAF |
  db $7B, $7C                               ; $00AFB1 |
  db $7D, $A4                               ; $00AFB3 |
  db $7F, $7E                               ; $00AFB5 |
  db $81, $82                               ; $00AFB7 |
  db $77, $78                               ; $00AFB9 |
  db $00, $05                               ; $00AFBB |
  db $00, $05                               ; $00AFBD |
  db $83, $84                               ; $00AFBF |
  db $80, $81                               ; $00AFC1 |
  db $85, $86                               ; $00AFC3 |
  db $A1, $A2                               ; $00AFC5 |
  db $08, $09                               ; $00AFC7 |
  db $0D, $7E                               ; $00AFC9 |
  db $0E, $90                               ; $00AFCB |
  db $85, $86                               ; $00AFCD |
  db $85, $86                               ; $00AFCF |
  db $09, $09                               ; $00AFD1 |
  db $A5, $A6                               ; $00AFD3 |
  db $7A, $7B                               ; $00AFD5 |
  db $A7, $A8                               ; $00AFD7 |

; BG3 tileset data
; byte 1 -> $7E0015, 2 -> $16
; corresponds to $F5 and $F6 in $AD6D table
; there are 48 BG3 tilesets, $00-$2F
bg3_tilesets_files:
  db $4D, $4E                               ; $00AFD9 |
  db $14, $15                               ; $00AFDB |
  db $16, $15                               ; $00AFDD |
  db $18, $18                               ; $00AFDF |
  db $51, $52                               ; $00AFE1 |
  db $16, $15                               ; $00AFE3 |
  db $16, $15                               ; $00AFE5 |
  db $16, $15                               ; $00AFE7 |
  db $16, $15                               ; $00AFE9 |
  db $13, $13                               ; $00AFEB |
  db $12, $4E                               ; $00AFED |
  db $16, $15                               ; $00AFEF |
  db $1A, $11                               ; $00AFF1 |
  db $10, $11                               ; $00AFF3 |
  db $28, $29                               ; $00AFF5 |
  db $2A, $2B                               ; $00AFF7 |
  db $4D, $4E                               ; $00AFF9 |
  db $10, $63                               ; $00AFFB |
  db $15, $17                               ; $00AFFD |
  db $4E, $4E                               ; $00AFFF |
  db $51, $52                               ; $00B001 |
  db $53, $52                               ; $00B003 |
  db $5B, $5C                               ; $00B005 |
  db $54, $54                               ; $00B007 |
  db $1B, $54                               ; $00B009 |
  db $51, $52                               ; $00B00B |
  db $51, $52                               ; $00B00D |
  db $18, $17                               ; $00B00F |
  db $14, $14                               ; $00B011 |
  db $4E, $4E                               ; $00B013 |
  db $19, $19                               ; $00B015 |
  db $4D, $4E                               ; $00B017 |
  db $61, $18                               ; $00B019 |
  db $51, $52                               ; $00B01B |
  db $62, $4E                               ; $00B01D |
  db $19, $63                               ; $00B01F |
  db $64, $4E                               ; $00B021 |
  db $65, $65                               ; $00B023 |
  db $66, $17                               ; $00B025 |
  db $67, $52                               ; $00B027 |
  db $62, $62                               ; $00B029 |
  db $57, $58                               ; $00B02B |
  db $19, $19                               ; $00B02D |
  db $57, $58                               ; $00B02F |
  db $68, $62                               ; $00B031 |
  db $68, $62                               ; $00B033 |
  db $57, $58                               ; $00B035 |
  db $59, $58                               ; $00B037 |

; spriteset data
; bytes 1-6 -> $7E0017-1C
; corresponds to $F7-$FC in $AD6D table
; there are 128 spritesets, $00-$7F
spriteset_files:
  db $20, $21, $2A, $2B, $5E, $29           ; $00B039 |
  db $20, $21, $5E, $1C, $31, $29           ; $00B03F |
  db $1F, $2C, $36, $40, $51, $29           ; $00B045 |
  db $2E, $5E, $37, $1A, $1A, $1F           ; $00B04B |
  db $55, $5E, $5F, $1F, $1A, $29           ; $00B051 |
  db $53, $40, $51, $1A, $1A, $29           ; $00B057 |
  db $36, $2A, $2B, $3C, $2D, $71           ; $00B05D |
  db $4A, $36, $1C, $71, $31, $59           ; $00B063 |
  db $6A, $1A, $1A, $1A, $1A, $1A           ; $00B069 |
  db $50, $71, $2F, $31, $49, $29           ; $00B06F |
  db $55, $57, $5D, $71, $1C, $2F           ; $00B075 |
  db $55, $71, $3C, $57, $4A, $1C           ; $00B07B |
  db $3C, $3F, $1F, $71, $1A, $1A           ; $00B081 |
  db $25, $71, $1C, $1A, $1A, $1A           ; $00B087 |
  db $2E, $1A, $1A, $1A, $1A, $1F           ; $00B08D |
  db $36, $57, $38, $1C, $5C, $29           ; $00B093 |
  db $3A, $3B, $31, $55, $71, $29           ; $00B099 |
  db $60, $61, $1C, $22, $23, $25           ; $00B09F |
  db $1C, $25, $42, $43, $4F, $29           ; $00B0A5 |
  db $5A, $5B, $5C, $25, $6A, $29           ; $00B0AB |
  db $1F, $37, $39, $42, $43, $1A           ; $00B0B1 |
  db $27, $35, $4E, $3D, $1A, $30           ; $00B0B7 |
  db $4E, $1C, $51, $46, $71, $29           ; $00B0BD |
  db $22, $23, $45, $60, $1A, $30           ; $00B0C3 |
  db $42, $43, $38, $39, $1C, $59           ; $00B0C9 |
  db $60, $1D, $71, $4E, $1C, $30           ; $00B0CF |
  db $60, $1D, $40, $46, $4E, $30           ; $00B0D5 |
  db $55, $1D, $60, $4E, $51, $1A           ; $00B0DB |
  db $36, $63, $1F, $5C, $1A, $29           ; $00B0E1 |
  db $39, $1D, $35, $1B, $63, $30           ; $00B0E7 |
  db $71, $1A, $51, $5F, $60, $30           ; $00B0ED |
  db $2A, $63, $1A, $1A, $1A, $1A           ; $00B0F3 |
  db $27, $3E, $1A, $3D, $1A, $1A           ; $00B0F9 |
  db $25, $2B, $47, $64, $36, $1F           ; $00B0FF |
  db $51, $61, $48, $65, $1C, $60           ; $00B105 |
  db $48, $1C, $65, $28, $60, $71           ; $00B10B |
  db $1C, $45, $1F, $71, $6A, $29           ; $00B111 |
  db $4D, $6A, $48, $1F, $1A, $29           ; $00B117 |
  db $28, $60, $38, $4E, $36, $51           ; $00B11D |
  db $1A, $1A, $2D, $1A, $1A, $1A           ; $00B123 |
  db $45, $35, $54, $64, $1F, $1C           ; $00B129 |
  db $54, $58, $35, $3D, $71, $64           ; $00B12F |
  db $35, $41, $1F, $64, $5C, $1C           ; $00B135 |
  db $32, $33, $34, $41, $4C, $54           ; $00B13B |
  db $64, $1E, $41, $1F, $1C, $29           ; $00B141 |
  db $55, $1E, $28, $60, $71, $5C           ; $00B147 |
  db $64, $4C, $41, $40, $68, $29           ; $00B14D |
  db $2F, $5C, $5D, $1C, $1A, $1A           ; $00B153 |
  db $27, $65, $49, $AA, $1C, $1F           ; $00B159 |
  db $61, $48, $71, $1C, $55, $6A           ; $00B15F |
  db $71, $3C, $60, $3F, $49, $AA           ; $00B165 |
  db $53, $1A, $1C, $55, $31, $59           ; $00B16B |
  db $42, $43, $55, $1F, $41, $1A           ; $00B171 |
  db $2A, $2B, $29, $71, $1C, $5D           ; $00B177 |
  db $55, $1F, $27, $2A, $1A, $29           ; $00B17D |
  db $4F, $2B, $47, $52, $60, $51           ; $00B183 |
  db $2B, $47, $38, $71, $60, $51           ; $00B189 |
  db $40, $29, $31, $4E, $1C, $59           ; $00B18F |
  db $1C, $1A, $1A, $4E, $1A, $1A           ; $00B195 |
  db $2B, $47, $26, $52, $56, $29           ; $00B19B |
  db $2B, $47, $26, $52, $31, $29           ; $00B1A1 |
  db $2B, $47, $1F, $29, $31, $51           ; $00B1A7 |
  db $2B, $47, $2F, $1E, $71, $29           ; $00B1AD |
  db $29, $1A, $1A, $53, $1B, $1F           ; $00B1B3 |
  db $31, $40, $1F, $1A, $1A, $1A           ; $00B1B9 |
  db $41, $35, $39, $71, $1F, $29           ; $00B1BF |
  db $2B, $47, $24, $49, $1A, $1F           ; $00B1C5 |
  db $1F, $5C, $49, $4E, $5D, $47           ; $00B1CB |
  db $3A, $3B, $1C, $1A, $1A, $29           ; $00B1D1 |
  db $1F, $1A, $38, $1A, $1A, $1A           ; $00B1D7 |
  db $2B, $47, $37, $54, $71, $29           ; $00B1DD |
  db $3F, $3C, $66, $1C, $47, $60           ; $00B1E3 |
  db $31, $35, $71, $54, $55, $1F           ; $00B1E9 |
  db $2E, $1F, $49, $24, $5E, $29           ; $00B1EF |
  db $58, $54, $5E, $1F, $48, $29           ; $00B1F5 |
  db $60, $65, $30, $71, $1A, $1A           ; $00B1FB |
  db $5E, $29, $71, $26, $49, $4B           ; $00B201 |
  db $55, $2F, $58, $64, $2C, $59           ; $00B207 |
  db $5E, $24, $1C, $29, $49, $4B           ; $00B20D |
  db $27, $25, $38, $49, $2A, $29           ; $00B213 |
  db $1F, $36, $4E, $1A, $1A, $1A           ; $00B219 |
  db $4D, $1F, $55, $28, $60, $71           ; $00B21F |
  db $2E, $71, $1C, $1A, $1A, $1A           ; $00B225 |
  db $35, $39, $41, $25, $64, $29           ; $00B22B |
  db $64, $25, $36, $41, $1A, $29           ; $00B231 |
  db $4E, $44, $1A, $3D, $48, $29           ; $00B237 |
  db $5D, $1E, $36, $3D, $25, $48           ; $00B23D |
  db $42, $43, $44, $6A, $1A, $1A           ; $00B243 |
  db $64, $45, $1A, $1A, $1F, $29           ; $00B249 |
  db $2A, $2B, $38, $6A, $6C, $5E           ; $00B24F |
  db $55, $31, $1A, $1A, $1A, $1F           ; $00B255 |
  db $35, $3E, $1C, $3D, $2B, $47           ; $00B25B |
  db $2A, $2B, $5E, $63, $1A, $1A           ; $00B261 |
  db $24, $1A, $1A, $1A, $1A, $1A           ; $00B267 |
  db $1A, $36, $31, $29, $66, $59           ; $00B26D |
  db $40, $3A, $3B, $37, $36, $1A           ; $00B273 |
  db $2F, $70, $61, $6A, $1A, $1F           ; $00B279 |
  db $6B, $6C, $1A, $6A, $47, $1F           ; $00B27F |
  db $57, $5C, $5D, $24, $1C, $29           ; $00B285 |
  db $1B, $71, $29, $1C, $1F, $5D           ; $00B28B |
  db $55, $5C, $5F, $45, $71, $37           ; $00B291 |
  db $6F, $6D, $6E, $29, $6A, $1A           ; $00B297 |
  db $55, $6A, $A9, $1A, $1A, $1F           ; $00B29D |
  db $62, $3C, $4E, $53, $71, $44           ; $00B2A3 |
  db $68, $6A, $1A, $1A, $1A, $1A           ; $00B2A9 |
  db $1A, $1E, $52, $1F, $71, $29           ; $00B2AF |
  db $5D, $44, $4C, $56, $1A, $1A           ; $00B2B5 |
  db $1C, $29, $44, $2A, $71, $4E           ; $00B2BB |
  db $45, $71, $1C, $58, $1A, $1A           ; $00B2C1 |
  db $55, $25, $71, $1F, $29, $1C           ; $00B2C7 |
  db $5D, $37, $71, $29, $1C, $1A           ; $00B2CD |
  db $45, $6A, $1F, $1A, $1A, $1A           ; $00B2D3 |
  db $1F, $64, $41, $53, $3E, $1C           ; $00B2D9 |
  db $53, $71, $5D, $1C, $1A, $1A           ; $00B2DF |
  db $36, $1C, $38, $28, $60, $29           ; $00B2E5 |
  db $2B, $47, $20, $21, $1C, $71           ; $00B2EB |
  db $20, $21, $2F, $1C, $5D, $47           ; $00B2F1 |
  db $27, $35, $41, $54, $64, $68           ; $00B2F7 |
  db $1C, $71, $2C, $2D, $1A, $1A           ; $00B2FD |
  db $6A, $6C, $63, $1A, $1A, $1A           ; $00B303 |
  db $22, $23, $45, $60, $1A, $30           ; $00B309 |
  db $67, $3C, $55, $1A, $1A, $29           ; $00B30F |
  db $54, $71, $41, $4C, $64, $37           ; $00B315 |
  db $AD, $AE, $AF, $B0, $67, $6A           ; $00B31B |
  db $55, $47, $57, $49, $1C, $29           ; $00B321 |
  db $27, $2B, $47, $1C, $25, $29           ; $00B327 |
  db $27, $71, $1C, $31, $1A, $1A           ; $00B32D |
  db $1C, $45, $1F, $71, $46, $29           ; $00B333 |

; Loads BG1/BG2/BG3 tilesets and sprite set graphics based on level headers
load_level_gfx:
  PHB                                       ; $00B339 |
  PHK                                       ; $00B33A |
  PLB                                       ; $00B33B |
  REP #$30                                  ; $00B33C |
  LDA !r_header_bg1_tileset                 ; $00B33E |\
  ASL A                                     ; $00B341 | | load BG1 tileset #
  ADC !r_header_bg1_tileset                 ; $00B342 | | * 3 as index Y
  TAY                                       ; $00B345 |/
  LDA !r_cur_world                          ; $00B346 |\
  CMP #$000A                                ; $00B349 |/  test world if world 6
  BNE .reg_tileset                          ; $00B34C |
  LDA bg1_dark_tileset_files,y              ; $00B34E |\
  STA $10                                   ; $00B351 | | different
  LDA bg1_dark_tileset_files+1,y            ; $00B353 | | table for
  STA $11                                   ; $00B356 | | world 6 BG1
  BRA .set_files                            ; $00B358 |/

.reg_tileset
  LDA bg1_tileset_files,y                   ; $00B35A |\  Regular (W1-5)
  STA $10                                   ; $00B35D | | BG1 VRAM files
  LDA bg1_tileset_files+1,y                 ; $00B35F | | -> $10, $11, $12
  STA $11                                   ; $00B362 |/

.set_files
  LDA !r_header_bg2_tileset                 ; $00B364 |\  load BG2 tileset #
  ASL A                                     ; $00B367 |/  * 2
  TAY                                       ; $00B368 |
  LDA bg2_tileset_files,y                   ; $00B369 |\  BG2 VRAM files
  STA $13                                   ; $00B36C |/  -> $13, $14
  LDA !r_header_bg3_tileset                 ; $00B36E |\  load BG3 tileset #
  ASL A                                     ; $00B371 |/  * 2
  TAY                                       ; $00B372 |
  LDA bg3_tilesets_files,y                  ; $00B373 |\  BG3 VRAM files
  STA $15                                   ; $00B376 |/  -> $15, $16
  LDA !r_header_spr_tileset                 ; $00B378 |\
  ASL A                                     ; $00B37B | | load spriteset #
  ADC !r_header_spr_tileset                 ; $00B37C | | * 6
  ASL A                                     ; $00B37F | |
  TAY                                       ; $00B380 |/
  LDA spriteset_files,y                     ; $00B381 |\
  STA !s_sprset_1_index                     ; $00B384 | | sprite VRAM files
  STA $17                                   ; $00B387 | | -> $17, $18, $19,
  LDA spriteset_files+2,y                   ; $00B389 | |    $1A, $1B, $1C
  STA !s_sprset_3_index                     ; $00B38C | |
  STA $19                                   ; $00B38F | | also store in
  LDA spriteset_files+4,y                   ; $00B391 | | $700EB6-EBB
  STA !s_sprset_5_index                     ; $00B394 | |
  STA $1B                                   ; $00B397 |/
  SEP #$20                                  ; $00B399 |
  LDY #$0000                                ; $00B39B |

; pass in a Y for an $AD6D table offset to begin at
load_compressed_gfx_files:
  LDA #$16                                  ; $00B39E |\  loop through compressed
  STA $012D                                 ; $00B3A0 | | chunks of VRAM data in AD6D
  LDA #$3D                                  ; $00B3A3 | | table
  STA $012E                                 ; $00B3A5 | | 3 or 5 byte entries

.get_pointer
  LDA scene_gfx_layout,y                    ; $00B3A8 | | byte 1: chunk index
  CMP #$F0                                  ; $00B3AB | | FF marks done with section
  BCC .decompress                           ; $00B3AD | |
  CMP #$FF                                  ; $00B3AF | | > $F0
  BEQ .ret                                  ; $00B3B1 | | marks it
  SEC                                       ; $00B3B3 | | as an index into
  SBC #$F0                                  ; $00B3B4 | | $7E0010 table (tile/spriteset)
  REP #$20                                  ; $00B3B6 | | this value in table
  AND #$00FF                                ; $00B3B8 | | is then used as file index
  TAX                                       ; $00B3BB | |
  SEP #$20                                  ; $00B3BC | | bytes 2 & 3 (word):
  LDA $10,x                                 ; $00B3BE | | VRAM destination address

.decompress
  LDX scene_gfx_layout+1,y                  ; $00B3C0 | |
  JSR decompress_gfx_file                   ; $00B3C3 | | decompress
  INY                                       ; $00B3C6 | |
  INY                                       ; $00B3C7 | | continue looping
  INY                                       ; $00B3C8 | |
  BRA .get_pointer                          ; $00B3C9 |/

.ret
  SEP #$10                                  ; $00B3CB |
  PLB                                       ; $00B3CD |
  RTL                                       ; $00B3CE |

  PHB                                       ; $00B3CF |
  PHK                                       ; $00B3D0 |
  PLB                                       ; $00B3D1 |
  LDA #$68                                  ; $00B3D2 |
  STA $10                                   ; $00B3D4 |
  LDA $011A                                 ; $00B3D6 |
  CMP #$80                                  ; $00B3D9 |
  BEQ CODE_00B3E6                           ; $00B3DB |
  LDA !r_last_world_unlocked                ; $00B3DD |
  BNE CODE_00B3E6                           ; $00B3E0 |
  LDA #$1F                                  ; $00B3E2 |
  STA $10                                   ; $00B3E4 |

CODE_00B3E6:
  REP #$10                                  ; $00B3E6 |
  LDY #$004F                                ; $00B3E8 |
  JMP load_compressed_gfx_files             ; $00B3EB |

load_compressed_gfx_files_l:
  PHB                                       ; $00B3EE |
  PHK                                       ; $00B3EF |
  PLB                                       ; $00B3F0 |
  JMP load_compressed_gfx_files             ; $00B3F1 |

; tilemaps for each world map (2 bytes per world: BG1, BG2)
  db $7C, $7D                               ; $00B3F4 |
  db $7F, $80                               ; $00B3F6 |
  db $81, $82                               ; $00B3F8 |
  db $83, $84                               ; $00B3FA |
  db $85, $86                               ; $00B3FC |
  db $87, $88                               ; $00B3FE |

  db $74, $B5, $B7, $75, $B6, $B8, $4C, $6C ; $00B400 |
  db $6D                                    ; $00B408 |

; GFX for each world map (8 bytes per world)
  dw $9A99, $9C9B, $9E9D, $A09F             ; $00B409 |
  dw $9A99, $9C9B, $9E9D, $A09F             ; $00B411 |
  dw $9A99, $9C9B, $9E9D, $A09F             ; $00B419 |
  dw $9A99, $9C9B, $9E9D, $A09F             ; $00B421 |
  dw $9A99, $9C9B, $9E9D, $A09F             ; $00B429 |
  dw $9A99, $9C9B, $9695, $9897             ; $00B431 |

  PHB                                       ; $00B439 |
  PHK                                       ; $00B43A |
  PLB                                       ; $00B43B |
  LDA #$74                                  ; $00B43C |
  STA $12                                   ; $00B43E |
  LDA #$75                                  ; $00B440 |
  STA $13                                   ; $00B442 |
  LDA #$4C                                  ; $00B444 |
  STA $14                                   ; $00B446 |
  LDY !r_cur_world                          ; $00B448 |
  LDA $B3F4,y                               ; $00B44B |
  STA $10                                   ; $00B44E |
  LDA $B3F5,y                               ; $00B450 |
  STA $11                                   ; $00B453 |
  TYA                                       ; $00B455 |
  ASL A                                     ; $00B456 |
  ASL A                                     ; $00B457 |
  TAY                                       ; $00B458 |
  LDX #$00                                  ; $00B459 |

CODE_00B45B:
  LDA $B409,y                               ; $00B45B |
  STA $15,x                                 ; $00B45E |
  INY                                       ; $00B460 |
  INX                                       ; $00B461 |
  CPX #$08                                  ; $00B462 |
  BCC CODE_00B45B                           ; $00B464 |
  REP #$10                                  ; $00B466 |
  LDY #$00A2                                ; $00B468 |
  JMP load_compressed_gfx_files             ; $00B46B |

  dw $0404, $7904, $0404, $7704             ; $00B46E |
  dw $0C04, $040C                           ; $00B476 |

  dw $0404, $7A04, $0404, $7804             ; $00B47A |
  dw $0405, $0404                           ; $00B482 |

  dw $9696, $9696, $9897, $9A98             ; $00B486 |
  dw $999B, $9699                           ; $00B48E |

  dw $9C9C, $9F9C, $9C9C, $A09C             ; $00B492 |
  dw $9CA1, $9C9C                           ; $00B49A |

  PHB                                       ; $00B49E |
  PHK                                       ; $00B49F |
  PLB                                       ; $00B4A0 |
  LDA $B46E,y                               ; $00B4A1 |
  STA $10                                   ; $00B4A4 |
  LDA $B47A,y                               ; $00B4A6 |
  STA $11                                   ; $00B4A9 |
  LDA $B486,y                               ; $00B4AB |
  STA $12                                   ; $00B4AE |
  LDA $B492,y                               ; $00B4B0 |
  STA $13                                   ; $00B4B3 |
  LDA #$4E                                  ; $00B4B5 |
  STA !s_sprset_5_index                     ; $00B4B7 |
  LDA #$FF                                  ; $00B4BA |
  STA !s_sprset_1_index                     ; $00B4BC |
  STA !s_sprset_2_index                     ; $00B4BF |
  STA !s_sprset_3_index                     ; $00B4C2 |
  STA !s_sprset_4_index                     ; $00B4C5 |
  STA !s_sprset_6_index                     ; $00B4C8 |
  REP #$10                                  ; $00B4CB |
  LDY #$0122                                ; $00B4CD |
  JMP load_compressed_gfx_files             ; $00B4D0 |

; hardcoded graphics for this level mode (6-8 kamek autoscroll)
load_levelmode_0A_gfx:
  PHB                                       ; $00B4D3 |
  PHK                                       ; $00B4D4 |
  PLB                                       ; $00B4D5 |
  LDX #$2218                                ; $00B4D6 |\ Shigeru???
  LDX #$00BD                                ; $00B4D9 |/
  LDA #$38                                  ; $00B4DC |
  STA !reg_bg4sc                            ; $00B4DE |
  LDA #$67                                  ; $00B4E1 |\
  STA !s_sprset_1_index                     ; $00B4E3 | |
  LDA #$3C                                  ; $00B4E6 | |
  STA !s_sprset_2_index                     ; $00B4E8 | |
  LDA #$55                                  ; $00B4EB | |
  STA !s_sprset_3_index                     ; $00B4ED | | Setup sprite graphics files
  LDA #$1A                                  ; $00B4F0 | | to load
  STA !s_sprset_4_index                     ; $00B4F2 | |
  LDA #$1A                                  ; $00B4F5 | |
  STA !s_sprset_5_index                     ; $00B4F7 | |
  LDA #$29                                  ; $00B4FA | |
  STA !s_sprset_6_index                     ; $00B4FC | |
  REP #$10                                  ; $00B4FF |/
  LDY #$018A                                ; $00B501 |  Index for scene_gfx_layout table
  JMP load_compressed_gfx_files             ; $00B504 |  Load graphics files

; routine: decompresses LC_LZ16 (?) data file
; parameters:
; X: VRAM destination address
; A: gfx file #
decompress_gfx_file:
  STX $0E                                   ; $00B507 | preserve VRAM dest address
  REP #$20                                  ; $00B509 |\
  AND #$00FF                                ; $00B50B | |
  STA $0C                                   ; $00B50E | | x = A * 3
  ASL A                                     ; $00B510 | | to get as long gfx index
  ADC $0C                                   ; $00B511 | |
  TAX                                       ; $00B513 |/
  LDA $0E                                   ; $00B514 |\
  BPL decompress_lc_lz1                     ; $00B516 | | VRAM destination address
  LDA $AD70,y                               ; $00B518 | | being >= $8000 signifies
  STA $0A                                   ; $00B51B | | it is LC_LZ16 decompression instead
  INY                                       ; $00B51D | | we also have an extra word
  INY                                       ; $00B51E | | in the AD6D table,
  PHY                                       ; $00B51F |/  the size of uncompressed chunk
  ASL A                                     ; $00B520 |\
  ASL A                                     ; $00B521 | |
  XBA                                       ; $00B522 | | r3 = uncompressed size >> 6
  AND #$00FF                                ; $00B523 | |
  STA !gsu_r3                               ; $00B526 |/
  LDA $06FC79,x                             ; $00B529 |\ r1 = address of gfx file
  STA !gsu_r1                               ; $00B52D |/
  LDA $06FC7B,x                             ; $00B530 |\
  AND #$00FF                                ; $00B534 | | r0 = bank of gfx file
  STA !gsu_r0                               ; $00B537 |/
  SEP #$10                                  ; $00B53A |\
  LDX #$0A                                  ; $00B53C | | gsu_decompress_lc_lz16
  LDA #$8000                                ; $00B53E | |
  JSL r_gsu_init_1                          ; $00B541 |/
  REP #$10                                  ; $00B545 |
  LDY $0A                                   ; $00B547 |
  SEP #$20                                  ; $00B549 |
  BRA CODE_00B582                           ; $00B54B |

; decompresses LC_LZ1 data file
; takes X as parameter: gfx index (file * 3)
decompress_lc_lz1:
  PHY                                       ; $00B54D |
  LDA $06F95E,x                             ; $00B54E |\ r9 = address of gfx file
  STA !gsu_r9                               ; $00B552 |/
  LDA $06F960,x                             ; $00B555 |\
  AND #$00FF                                ; $00B559 | | r4 = bank of gfx file
  STA !gsu_r4                               ; $00B55C |/
  LDA #$5800                                ; $00B55F |\ r10 = SRAM destination
  STA !gsu_r10                              ; $00B562 |/
  SEP #$10                                  ; $00B565 |\
  LDX #$08                                  ; $00B567 | | gsu_decompress_lc_lz1
  LDA #$A980                                ; $00B569 | |
  JSL r_gsu_init_1                          ; $00B56C |/
  REP #$10                                  ; $00B570 |
  LDA !gsu_r10                              ; $00B572 |\  returns r10 as end
  SEC                                       ; $00B575 | | end - start = size
  SBC #$5800                                ; $00B576 | | of uncompressed data
  TAY                                       ; $00B579 |/
  SEP #$20                                  ; $00B57A |
  LDA $0C                                   ; $00B57C |
  CMP #$B1                                  ; $00B57E |
  BCS CODE_00B5A7                           ; $00B580 |

CODE_00B582:
  LDA #$80                                  ; $00B582 |\
  STA !reg_vmain                            ; $00B584 | |
  LDX $0E                                   ; $00B587 | | DMA
  STX !reg_vmadd                            ; $00B589 | | decompressed data
  LDX #$1801                                ; $00B58C | | to VRAM
  STX $4300                                 ; $00B58F | | destination passed in
  LDX #$5800                                ; $00B592 | | from X, ultimately
  STX $4302                                 ; $00B595 | | from AD6D tables
  LDA #$70                                  ; $00B598 | |
  STA $4304                                 ; $00B59A | |
  STY $4305                                 ; $00B59D | |
  LDA #$01                                  ; $00B5A0 | |
  STA !reg_mdmaen                           ; $00B5A2 |/
  PLY                                       ; $00B5A5 |
  RTS                                       ; $00B5A6 |

CODE_00B5A7:
  LDX #$0000                                ; $00B5A7 |
  CMP #$B9                                  ; $00B5AA |
  BEQ CODE_00B5C4                           ; $00B5AC |
  CMP #$BA                                  ; $00B5AE |
  BEQ CODE_00B5C4                           ; $00B5B0 |
  INX                                       ; $00B5B2 |
  INX                                       ; $00B5B3 |
  CMP #$BB                                  ; $00B5B4 |
  BEQ CODE_00B5C4                           ; $00B5B6 |
  CMP #$BC                                  ; $00B5B8 |
  BEQ CODE_00B5C4                           ; $00B5BA |
  INX                                       ; $00B5BC |
  INX                                       ; $00B5BD |
  CMP #$BD                                  ; $00B5BE |
  BEQ CODE_00B5C4                           ; $00B5C0 |
  INX                                       ; $00B5C2 |
  INX                                       ; $00B5C3 |

CODE_00B5C4:
  REP #$20                                  ; $00B5C4 |
  TYA                                       ; $00B5C6 |
  STA $00                                   ; $00B5C7 |
  ASL A                                     ; $00B5C9 |
  PHA                                       ; $00B5CA |
  SEP #$20                                  ; $00B5CB |
  PHB                                       ; $00B5CD |
  LDA #$7E                                  ; $00B5CE |
  PHA                                       ; $00B5D0 |
  PLB                                       ; $00B5D1 |
  REP #$20                                  ; $00B5D2 |
  JSR ($B601,x)                             ; $00B5D4 |
  SEP #$20                                  ; $00B5D7 |
  PLB                                       ; $00B5D9 |
  PLY                                       ; $00B5DA |
  LDA $00                                   ; $00B5DB |
  BEQ CODE_00B5FF                           ; $00B5DD |
  STA !reg_vmain                            ; $00B5DF |
  LDX $0E                                   ; $00B5E2 |
  STX !reg_vmadd                            ; $00B5E4 |
  LDX $02                                   ; $00B5E7 |
  STX $4300                                 ; $00B5E9 |
  LDX #$7BBE                                ; $00B5EC |
  STX $4302                                 ; $00B5EF |
  LDA #$7E                                  ; $00B5F2 |
  STA $4304                                 ; $00B5F4 |
  STY $4305                                 ; $00B5F7 |
  LDA #$01                                  ; $00B5FA |
  STA !reg_mdmaen                           ; $00B5FC |

CODE_00B5FF:
  PLY                                       ; $00B5FF |
  RTS                                       ; $00B600 |

  dw $B609, $B6B7, $B70B, $B609             ; $00B601 |

  LDX #$0000                                ; $00B609 |
  LDY #$0000                                ; $00B60C |

CODE_00B60F:
  LDA $705800,x                             ; $00B60F |
  PHA                                       ; $00B613 |
  AND #$000F                                ; $00B614 |
  STA $7BBE,y                               ; $00B617 |
  INY                                       ; $00B61A |
  PLA                                       ; $00B61B |
  AND #$00F0                                ; $00B61C |
  LSR A                                     ; $00B61F |
  LSR A                                     ; $00B620 |
  LSR A                                     ; $00B621 |
  LSR A                                     ; $00B622 |
  STA $7BBE,y                               ; $00B623 |
  INX                                       ; $00B626 |
  INY                                       ; $00B627 |
  DEC $00                                   ; $00B628 |
  BNE CODE_00B60F                           ; $00B62A |
  LDA #$0080                                ; $00B62C |
  STA $00                                   ; $00B62F |
  LDA #$1900                                ; $00B631 |
  STA $02                                   ; $00B634 |
  RTS                                       ; $00B636 |

  dw $0000, $0000, $0000, $0000             ; $00B637 |
  dw $0000, $1010, $1010, $1010             ; $00B63F |
  dw $2010, $2020, $2020, $3020             ; $00B647 |
  dw $3030, $3030, $3030, $3030             ; $00B64F |
  dw $3030, $3030, $3030, $3030             ; $00B657 |
  dw $3030, $3030, $3030, $3030             ; $00B65F |
  dw $3030, $3030, $3030, $3030             ; $00B667 |
  dw $3030, $3030, $3030, $3030             ; $00B66F |

  dw $3030, $3030, $4040, $4040             ; $00B677 |
  dw $4040, $4040, $4040, $4040             ; $00B67F |
  dw $4040, $4040, $4040, $4040             ; $00B687 |
  dw $4040, $4040, $4040, $4040             ; $00B68F |
  dw $4040, $4040, $4040, $4040             ; $00B697 |
  dw $4040, $4040, $4040, $4040             ; $00B69F |
  dw $4040, $4040, $4040, $4040             ; $00B6A7 |
  dw $4040, $4040, $4040, $4040             ; $00B6AF |

  LDA #$0000                                ; $00B6B7 |
  STA $04                                   ; $00B6BA |
  LDX #$B637                                ; $00B6BC |
  LDA $0C                                   ; $00B6BF |
  CMP #$00BC                                ; $00B6C1 |
  BNE CODE_00B6C9                           ; $00B6C4 |
  LDX #$B677                                ; $00B6C6 |

CODE_00B6C9:
  STX $02                                   ; $00B6C9 |
  LDX #$0000                                ; $00B6CB |
  TXY                                       ; $00B6CE |
  LDA #$0020                                ; $00B6CF |
  STA $06                                   ; $00B6D2 |

CODE_00B6D4:
  LDA $705800,x                             ; $00B6D4 |
  AND #$00FF                                ; $00B6D8 |
  PHA                                       ; $00B6DB |
  AND #$000F                                ; $00B6DC |
  ORA [$02]                                 ; $00B6DF |
  STA $7BBE,y                               ; $00B6E1 |
  INY                                       ; $00B6E4 |
  PLA                                       ; $00B6E5 |
  LSR A                                     ; $00B6E6 |
  LSR A                                     ; $00B6E7 |
  LSR A                                     ; $00B6E8 |
  LSR A                                     ; $00B6E9 |
  ORA [$02]                                 ; $00B6EA |
  STA $7BBE,y                               ; $00B6EC |
  INY                                       ; $00B6EF |
  INX                                       ; $00B6F0 |
  DEC $06                                   ; $00B6F1 |
  BNE CODE_00B6FC                           ; $00B6F3 |
  LDA #$0020                                ; $00B6F5 |
  STA $06                                   ; $00B6F8 |
  INC $02                                   ; $00B6FA |

CODE_00B6FC:
  DEC $00                                   ; $00B6FC |
  BNE CODE_00B6D4                           ; $00B6FE |
  LDA #$0080                                ; $00B700 |
  STA $00                                   ; $00B703 |
  LDA #$1900                                ; $00B705 |
  STA $02                                   ; $00B708 |
  RTS                                       ; $00B70A |

  PHB                                       ; $00B70B |
  PHK                                       ; $00B70C |
  PLB                                       ; $00B70D |
  SEP #$10                                  ; $00B70E |
  LDX #$00                                  ; $00B710 |
  STX !reg_vmain                            ; $00B712 |
  LDX #$70                                  ; $00B715 |
  STX $4304                                 ; $00B717 |
  LDA #$1800                                ; $00B71A |
  STA $4300                                 ; $00B71D |
  LDA #$5800                                ; $00B720 |
  STA $00                                   ; $00B723 |
  LDX #$40                                  ; $00B725 |
  LDY #$01                                  ; $00B727 |

CODE_00B729:
  LDA $0E                                   ; $00B729 |
  STA !reg_vmadd                            ; $00B72B |
  LDA $00                                   ; $00B72E |
  STA $4302                                 ; $00B730 |
  LDA #$0040                                ; $00B733 |
  STA $4305                                 ; $00B736 |
  STY !reg_mdmaen                           ; $00B739 |
  LDA $0E                                   ; $00B73C |
  CLC                                       ; $00B73E |
  ADC #$0080                                ; $00B73F |
  STA $0E                                   ; $00B742 |
  LDA $00                                   ; $00B744 |
  CLC                                       ; $00B746 |
  ADC #$0040                                ; $00B747 |
  STA $00                                   ; $00B74A |
  DEX                                       ; $00B74C |
  BNE CODE_00B729                           ; $00B74D |
  REP #$10                                  ; $00B74F |
  PLB                                       ; $00B751 |
  RTS                                       ; $00B752 |

; decompress graphics LC_LZ1: long version
; takes A as parameter: gfx file #
decompress_lc_lz1_l:
  LDX #$6800                                ; $00B753 |
; Entry: takes X as SRAM destination parameter
.x
  STA $6000                                 ; $00B756 |\  A *= 3, to get file #
  ASL A                                     ; $00B759 | | as index into long table
  ADC $6000                                 ; $00B75A |/
  STX $6000                                 ; $00B75D |\ ($0000) = r10 = #$6800
  STX !gsu_r10                              ; $00B760 |/ (SRAM destination of decompression)
  TAX                                       ; $00B763 |\
  LDA $06F95E,x                             ; $00B764 | | r9 = address of gfx file
  STA !gsu_r9                               ; $00B768 |/
  LDA $06F960,x                             ; $00B76B |\
  AND #$00FF                                ; $00B76F | | r4 = bank of gfx file
  STA !gsu_r4                               ; $00B772 |/
  SEP #$10                                  ; $00B775 |\
  LDX #$08                                  ; $00B777 | | gsu_decompress_lc_lz1
  LDA #$A980                                ; $00B779 | |
  JSL r_gsu_init_1                          ; $00B77C |/
  REP #$10                                  ; $00B780 |
  LDA !gsu_r10                              ; $00B782 |\  returns r10 as end
  SEC                                       ; $00B785 | | end - start = size
  SBC $6000                                 ; $00B786 |/  of uncompressed data
  RTL                                       ; $00B789 |


; scene palette tables begin
; split up into two-word entries, ending in $FFFF
; format of entries:
; RRRRRRRR RRRRRRRR dddddddd llllssss
; R = ROM (source) offset from $3FA000
; if negative, lop off sign bit and use as index into $7E0010 (dynamic)
; d = starting destination offset into CGRAM mirror table
; NOTE: d is a word address so * 2
; l = # of loops separated by row ($20 bytes) dest, source keeps counting
; s = size, # of words to copy per loop
; $00: in level
scene_palette_layout:
  dw $027C, $3B11                           ; $00B78A | Default BG1 palette
  dw $01C8, $5F81                           ; $00B78E | Default sprite palettes
  dw $8000, $1100                           ; $00B792 | Background Color
  dw $8006, $1F01                           ; $00B796 | BG3 palette
  dw $8002, $2F41                           ; $00B79A | BG1 palette
  dw $800A, $341C                           ; $00B79E | BG1 palette
  dw $8004, $2F61                           ; $00B7A2 | BG2 palette
  dw $8008, $2FE1                           ; $00B7A6 | Sprite palettes
  dw $800C, $1FD1                           ; $00B7AA | Yoshi palette
  dw $FFFF                                  ; $00B7AE | End marker

; $26: Yoshi's Island (file selection scene, end world cutscenes) & credits?
  dw $2860, $4F31, $28D8, $1F21             ; $00B7B0 |
  dw $2860, $4FB1, $8000, $1100             ; $00B7B8 |
  dw $8002, $2F01, $8004, $1FF1             ; $00B7C0 |
  dw $FFFF                                  ; $00B7C8 |

; $40: Nintendo Presents
  dw $0130, $1100, $01C8, $1F81             ; $00B7CA |
  dw $FFFF                                  ; $00B7D2 |

; $4A: toadies death cinematic
  dw $28F6, $2FE1, $FFFF                    ; $00B7D4 |

; $50: intro cinematic
  dw $2DDC, $1100, $2DDC, $2F01             ; $00B7DA |
  dw $30AC, $1F21, $328C, $1F31             ; $00B7E2 |
  dw $2E18, $3F41, $346C, $1F81             ; $00B7EA |
  dw $2ECC, $7F91, $FFFF                    ; $00B7F2 |

; $6E: map scene
  dw $8000, $1100, $8002, $1F01             ; $00B7F8 |
  dw $8004, $1F11, $8006, $1F21             ; $00B800 |
  dw $8008, $1F71, $2860, $4F31             ; $00B808 |
  dw $2860, $4F81, $3F4C, $2FC1             ; $00B810 |
  dw $3DC6, $2FE1, $FFFF                    ; $00B818 |

; $94: bonus games
  dw $401A, $1100, $8000, $3F01             ; $00B81E |
  dw $8002, $1F71, $01C8, $6F81             ; $00B826 |
  dw $8004, $4F31, $8006, $4F91             ; $00B82E |
  dw $3FFC, $1F51, $3FFC, $1FB1             ; $00B836 |
  dw $8008, $1FD1, $01C8, $2FE1             ; $00B83E |
  dw $0222, $1FE1, $FFFF                    ; $00B846 |

; $C2: minigames
  dw $2148, $1F01, $027C, $3B11             ; $00B84E |
  dw $4354, $4F41, $01C8, $6F81             ; $00B856 |
  dw $8000, $1FD1, $FFFF                    ; $00B85E |

; $D8: 6-8 kamek autoscroll section
  dw $586E, $8F01, $01C8, $5F81             ; $00B862 |
  dw $8000, $1FD1, $8002, $2FE1             ; $00B86A |
  dw $FFFF                                  ; $00B872 |
; end scene palette tables

; all palettes indexing into $3FA000 palette data
; foreground palette pointers (worlds 1-5)
bg1_palette_ptrs:
  dw $067E, $06D2, $0726, $077A             ; $00B874 |
  dw $07CE, $0822, $0876, $08CA             ; $00B87C |
  dw $091E, $0972, $09C6, $0A1A             ; $00B884 |
  dw $0A6E, $0AC2, $0B16, $0B6A             ; $00B88C |
  dw $0BBE, $0C12, $0C66, $0CBA             ; $00B894 |
  dw $0D0E, $0D62, $0DB6, $0E0A             ; $00B89C |
  dw $0E5E, $0EB2, $0F06, $0F5A             ; $00B8A4 |
  dw $0FAE, $1002, $1056, $10AA             ; $00B8AC |

; foreground palette pointers (world 6)
bg1_dark_world_palette_ptrs:
  dw $067E, $0BBE, $0726, $077A             ; $00B8B4 |
  dw $07CE, $0822, $0876, $08CA             ; $00B8BC |
  dw $091E, $0972, $09C6, $0A1A             ; $00B8C4 |
  dw $0A6E, $0AC2, $0B16, $0B6A             ; $00B8CC |
  dw $0BBE, $0C12, $0C66, $0CBA             ; $00B8D4 |
  dw $0D0E, $0D62, $0DB6, $0E0A             ; $00B8DC |
  dw $0E5E, $0EB2, $0F06, $0F5A             ; $00B8E4 |
  dw $0FAE, $1002, $1056, $10AA             ; $00B8EC |

; layer 2 object palette pointers?
bg2_palette_ptrs:
  dw $12A2, $11EE, $113A, $10FE             ; $00B8F4 |
  dw $11B2, $1176, $1266, $122A             ; $00B8FC |
  dw $12DE, $1356, $1392, $13CE             ; $00B904 |
  dw $140A, $1446, $1482, $14BE             ; $00B90C |
  dw $1356, $10FE, $1176, $14FA             ; $00B914 |
  dw $1536, $1572, $1662, $1662             ; $00B91C |
  dw $15AE, $15EA, $1626, $16DA             ; $00B924 |
  dw $169E, $1716, $1752, $178E             ; $00B92C |
  dw $187E, $18BA, $18F6, $1932             ; $00B934 |
  dw $196E, $19AA, $19E6, $1A22             ; $00B93C |
  dw $1A5E, $1A9A, $1AD6, $1B12             ; $00B944 |
  dw $1B4E, $1B8A, $1BC6, $1C02             ; $00B94C |
  dw $1C3E, $1C7A, $1CB6, $1CF2             ; $00B954 |
  dw $1D2E, $1D6A, $1DA6, $1DE2             ; $00B95C |
  dw $1E1E, $1E5A, $1E96, $1ED2             ; $00B964 |
  dw $1F0E, $1F4A, $1F86, $1FC2             ; $00B96C |

; layer 3 object palette pointers?
bg3_palette_ptrs:
  dw $1FFE, $201C, $203A, $2058             ; $00B974 |
  dw $2076, $2094, $20B2, $20D0             ; $00B97C |
  dw $2166, $210C, $212A, $2148             ; $00B984 |
  dw $20EE, $2184, $21A2, $21C0             ; $00B98C |
  dw $21DE, $21FC, $221A, $2238             ; $00B994 |
  dw $2256, $2274, $2292, $22B0             ; $00B99C |
  dw $22CE, $22EC, $230A, $2328             ; $00B9A4 |
  dw $2346, $2364, $2382, $23A0             ; $00B9AC |
  dw $23BE, $23DC, $23FA, $2418             ; $00B9B4 |
  dw $2436, $2454, $2472, $2490             ; $00B9BC |
  dw $24AE, $24CC, $24EA, $2508             ; $00B9C4 |
  dw $2526, $2544, $2562, $2580             ; $00B9CC |
  dw $259E, $25BC, $25DA, $25F8             ; $00B9D4 |
  dw $2616, $2634, $2652, $2670             ; $00B9DC |
  dw $268E, $26AC, $26CA, $26E8             ; $00B9E4 |
  dw $2706, $2724, $2742, $2760             ; $00B9EC |

; sprite palette pointers?
sprite_palette_ptrs:
  dw $02BE, $02FA, $0336, $0372             ; $00B9F4 |
  dw $03AE, $03EA, $0426, $0462             ; $00B9FC |
  dw $049E, $04DA, $0516, $0552             ; $00BA04 |
  dw $058E, $05CA, $0606, $0642             ; $00BA0C |

; relative pointers to each yoshi's palette
yoshi_palette_ptrs:
  dw $0040, $005E, $007C, $009A             ; $00BA14 |
  dw $00B8, $00D6, $00F4, $0112             ; $00BA1C |

; sets up pointers of dynamic palettes in $7E0010 for in level
; load_palettes will transfer the palettes
load_level_palettes:
  PHB                                       ; $00BA24 |\  save data bank
  PHK                                       ; $00BA25 | | set data bank
  PLB                                       ; $00BA26 |/
  REP #$30                                  ; $00BA27 |
  LDA !r_header_bg_color                    ; $00BA29 |\
  ASL A                                     ; $00BA2C | | backdrop color =
  ADC #$0130                                ; $00BA2D | | $3FA000 + header * 2 + $130
  STA $10                                   ; $00BA30 |/
  LDA !r_header_bg1_palette                 ; $00BA32 |\
  ASL A                                     ; $00BA35 | | BG1 header to Y index
  TAY                                       ; $00BA36 |/
  LDA !r_cur_world                          ; $00BA37 |\
  CMP #$000A                                ; $00BA3A | |
  BNE .regular                              ; $00BA3D | | If World 6
  LDA bg1_dark_world_palette_ptrs,y         ; $00BA3F | | Load dark world palette pointer
  BRA .get_pointers                         ; $00BA42 | |

.regular
  LDA bg1_palette_ptrs,y                    ; $00BA44 |/  Regular palettes pointer

.get_pointers
  STA $12                                   ; $00BA47 | store pointer
  CLC                                       ; $00BA49 |\
  ADC #$003C                                ; $00BA4A | | BG1 second part palette pointer
  STA $1A                                   ; $00BA4D |/
  LDA !r_header_bg2_palette                 ; $00BA4F |\
  ASL A                                     ; $00BA52 | |
  TAY                                       ; $00BA53 | | BG2 palette pointer
  LDA bg2_palette_ptrs,y                    ; $00BA54 | |
  STA $14                                   ; $00BA57 |/
  LDA !r_header_bg3_palette                 ; $00BA59 |\
  ASL A                                     ; $00BA5C | |
  TAY                                       ; $00BA5D | | BG3 palette pointer
  LDA bg3_palette_ptrs,y                    ; $00BA5E | |
  STA $16                                   ; $00BA61 |/
  LDA !r_header_spr_palette                 ; $00BA63 |\
  ASL A                                     ; $00BA66 | |
  TAY                                       ; $00BA67 | | Sprite palettes pointer
  LDA sprite_palette_ptrs,y                 ; $00BA68 | |
  STA $18                                   ; $00BA6B |/
  LDA !r_yoshi_color                        ; $00BA6D |\
  ASL A                                     ; $00BA70 | |
  TAY                                       ; $00BA71 | | Yoshi pointer
  LDA yoshi_palette_ptrs,y                  ; $00BA72 | |
  STA $1C                                   ; $00BA75 |/
  LDX #$0000                                ; $00BA77 | Set as first palette table ($B78A)

; loads a set of palettes from ROM into CGRAM
; takes argument of what table in register X (see $B78A)
; if table contains dynamic pointers, setup is needed $0010 RAM
load_palettes:
  LDA #$A000                                ; $00BA7A |\
  STA $00                                   ; $00BA7D | | Setup base palette pointer
  LDA #$5FA0                                ; $00BA7F | | as $5FA000 ($3FA000)
  STA $01                                   ; $00BA82 |/

.get_pointer
  LDA scene_palette_layout,x                ; $00BA84 |\  Palette setup data
  BPL .setup_loops                          ; $00BA87 | | If < $8000 it's a relative pointer
  CMP #$FFFF                                ; $00BA89 | |
  BEQ .ret                                  ; $00BA8C | | Check for end marker
  AND #$7FFF                                ; $00BA8E | | if negative, index into $0010 RAM
  TAY                                       ; $00BA91 | | to get relative pointer
  LDA $0010,y                               ; $00BA92 |/

.setup_loops
  TAY                                       ; $00BA95 |\
  LDA scene_palette_layout+3,x              ; $00BA96 | |
  AND #$000F                                ; $00BA99 | | Size nibble
  STA $03                                   ; $00BA9C |/
  LDA scene_palette_layout+3,x              ; $00BA9E |\
  AND #$00F0                                ; $00BAA1 | |
  LSR A                                     ; $00BAA4 | |
  LSR A                                     ; $00BAA5 | | amount of rows to do
  LSR A                                     ; $00BAA6 | | shift high nibble to low
  LSR A                                     ; $00BAA7 | |
  STA $05                                   ; $00BAA8 |/
  LDA scene_palette_layout+2,x              ; $00BAAA |\
  AND #$00FF                                ; $00BAAD | |
  ASL A                                     ; $00BAB0 | | CGRAM index (word address)
  STA $07                                   ; $00BAB1 |/
  PHX                                       ; $00BAB3 |

.set_index
  TAX                                       ; $00BAB4 |  CGRAM Index to X
  LDA $03                                   ; $00BAB5 |\ Size of transfer
  STA $09                                   ; $00BAB7 |/ Set as loop counter

; $00 = base pointer of $5FA000
; Y = index into palettes
; X = index into CGRAM mirror
.write_palette
  LDA [$00],y                               ; $00BAB9 | Load value from palette table
  STA !s_cgram_mirror,x                     ; $00BABB | Store to CGRAM mirror
  STA $702D6C,x                             ; $00BABF | Other CGRAM mirror
  INY                                       ; $00BAC3 |\
  INY                                       ; $00BAC4 | | Increase indexes by one word
  INX                                       ; $00BAC5 | |
  INX                                       ; $00BAC6 |/
  DEC $09                                   ; $00BAC7 | Decrease loop counter
  BNE .write_palette                        ; $00BAC9 |
  LDA $07                                   ; $00BACB |\
  CLC                                       ; $00BACD | |
  ADC #$0020                                ; $00BACE | | CGRAM index to next row
  STA $07                                   ; $00BAD1 | |
  DEC $05                                   ; $00BAD3 | | Decrease row counter
  BNE .set_index                            ; $00BAD5 |/
  PLX                                       ; $00BAD7 |\  Pull palette layout index
  INX                                       ; $00BAD8 | | increase by 4 to get to
  INX                                       ; $00BAD9 | | next entry
  INX                                       ; $00BADA | |
  INX                                       ; $00BADB |/
  BRA .get_pointer                          ; $00BADC | Get next palette entry

.ret
  SEP #$30                                  ; $00BADE |
  PLB                                       ; $00BAE0 |
  RTL                                       ; $00BAE1 |


  db $3C,$29,$7A,$29,$AE,$2C,$CC,$2C        ; $00BAE2 |

  PHB                                       ; $00BAEA |
  PHK                                       ; $00BAEB |
  PLB                                       ; $00BAEC |
  REP #$20                                  ; $00BAED |
  LDA $BAE2,x                               ; $00BAEF |
  STA $10                                   ; $00BAF2 |
  INC A                                     ; $00BAF4 |
  INC A                                     ; $00BAF5 |
  STA $12                                   ; $00BAF6 |
  LDA $BAE6,x                               ; $00BAF8 |
  STA $14                                   ; $00BAFB |
  REP #$10                                  ; $00BAFD |
  LDX #$0026                                ; $00BAFF |
  JMP load_palettes                         ; $00BB02 |

  PHB                                       ; $00BB05 |
  PHK                                       ; $00BB06 |
  PLB                                       ; $00BB07 |
  JMP load_palettes                         ; $00BB08 |

  dw $3ADE, $3B5A, $3BD6                    ; $00BB0B |
  dw $3C52, $3CCE, $3D4A                    ; $00BB11 |

; palette pointer for each world map (4 pointers per world)
  dw $3AE2, $3B00, $3B1E, $3B3C             ; $00BB17 |
  dw $3B5E, $3B7C, $3B9A, $3BB8             ; $00BB1F |
  dw $3BDA, $3BF8, $3C16, $3C34             ; $00BB27 |
  dw $3C56, $3C74, $3C92, $3CB0             ; $00BB2F |
  dw $3CD2, $3CF0, $3D0E, $3D2C             ; $00BB37 |
  dw $3D4E, $3D6C, $3D8A, $3DA8             ; $00BB3F |

  PHB                                       ; $00BB47 |
  PHK                                       ; $00BB48 |
  PLB                                       ; $00BB49 |
  LDX !r_cur_world                          ; $00BB4A |
  LDA $BB0B,x                               ; $00BB4D |
  STA $10                                   ; $00BB50 |
  TXA                                       ; $00BB52 |
  ASL A                                     ; $00BB53 |
  ASL A                                     ; $00BB54 |
  TAX                                       ; $00BB55 |
  LDA $BB17,x                               ; $00BB56 |
  STA $12                                   ; $00BB59 |
  LDA $BB19,x                               ; $00BB5B |
  STA $14                                   ; $00BB5E |
  LDA $BB1B,x                               ; $00BB60 |
  STA $16                                   ; $00BB63 |
  LDA $BB1D,x                               ; $00BB65 |
  STA $18                                   ; $00BB68 |
  LDX #$006E                                ; $00BB6A |
  JMP load_palettes                         ; $00BB6D |

  PHB                                       ; $00BB70 |
  PHK                                       ; $00BB71 |
  PLB                                       ; $00BB72 |
  LDA #$7F94                                ; $00BB73 |
  STA !r_reg_coldata_mirror                 ; $00BB76 |
  LDA #$0000                                ; $00BB79 |
  STA !s_cgram_mirror                       ; $00BB7C |
  LDA !r_yoshi_color                        ; $00BB80 |
  ASL A                                     ; $00BB83 |
  TAX                                       ; $00BB84 |
  LDA yoshi_palette_ptrs,x                  ; $00BB85 |
  STA $10                                   ; $00BB88 |
  LDX #$00C2                                ; $00BB8A |
  JMP load_palettes                         ; $00BB8D |

; hardcoded palettes for this level mode
load_levelmode_0A_palettes:
  PHB                                       ; $00BB90 |
  PHK                                       ; $00BB91 |
  PLB                                       ; $00BB92 |
  REP #$30                                  ; $00BB93 |
  LDA !r_yoshi_color                        ; $00BB95 |\
  ASL A                                     ; $00BB98 | |
  TAY                                       ; $00BB99 | | Setup yoshi color pointer
  LDA yoshi_palette_ptrs,y                  ; $00BB9A | |
  STA $10                                   ; $00BB9D |/
  LDA !r_header_spr_palette                 ; $00BB9F |\
  ASL A                                     ; $00BBA2 | |
  TAY                                       ; $00BBA3 | | Setup sprite palette pointer
  LDA sprite_palette_ptrs,y                 ; $00BBA4 | |
  STA $12                                   ; $00BBA7 |/
  LDX #$00D8                                ; $00BBA9 |   Setup index into scene_palette_layout
  JMP load_palettes                         ; $00BBAC |   Load palettes from

; indices into $BBEA just below (each scene)
; indexed by levelmode_index
scene_layout_indices:
  dw $0000, $0014, $0028, $003C             ; $00BBAF |
  dw $0050, $0064, $0078, $008C             ; $00BBB7 |
  dw $00A0, $00B4, $00C8, $00DC             ; $00BBBF |
  dw $00F0, $0104, $0118, $012C             ; $00BBC7 |
  dw $0140, $0154, $0168, $01A4             ; $00BBCF |
  dw $017C, $0190                           ; $00BBD7 |

; mapping of $21xx registers to $095E-$096C mirrors
reg_mirror_mapping:
  db $05, $07, $08, $09, $0B, $0C, $23, $24 ; $00BBDB |
  db $25, $2C, $2D, $2E, $2F, $30, $31      ; $00BBE3 |

; scene layout information: 20 bytes per scene
; holds data for graphics setup for each scene
; including GSU and VRAM registers
; format:
; byte $00 -> $011C
; byte $01 -> $0126
; byte $02 -> $012D (SCBR/$3038 mirror)
; byte $03 -> $012E (SCMR/$303A mirror)
; byte $04 = flag: does some weird palette trickery if set
; bytes $05-$13 -> $095E-$096C (VRAM register mirrors)
scene_register_layout:
  db $06, $00, $0A, $1D, $00, $10, $3C, $3C, $3C, $22; $00BBEA |
  db $22, $32, $00, $00, $13, $00, $00, $00, $00, $3F; $00BBF4 |

  db $00, $00, $16, $3D, $00, $01, $70, $74, $78, $00; $00BBFE |
  db $06, $00, $00, $00, $13, $00, $00, $00, $00, $00; $00BC08 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC12 |
  db $02, $00, $00, $00, $17, $00, $00, $00, $22, $20; $00BC1C |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC26 |
  db $02, $00, $00, $00, $14, $03, $00, $00, $22, $20; $00BC30 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC3A |
  db $02, $00, $00, $00, $13, $04, $00, $00, $22, $B3; $00BC44 |

  db $04, $00, $16, $3D, $01, $22, $69, $3A, $34, $77; $00BC4E |
  db $02, $00, $00, $00, $11, $02, $00, $00, $22, $20; $00BC58 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC62 |
  db $02, $00, $00, $00, $13, $14, $00, $00, $22, $72; $00BC6C |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC76 |
  db $02, $00, $00, $00, $15, $02, $00, $00, $22, $20; $00BC80 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC8A |
  db $02, $00, $00, $00, $15, $02, $00, $00, $22, $24; $00BC94 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BC9E |
  db $02, $00, $00, $00, $11, $06, $00, $00, $22, $20; $00BCA8 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BCB2 |
  db $02, $00, $00, $00, $13, $00, $00, $00, $22, $20; $00BCBC |

  db $0A, $00, $16, $3D, $01, $07, $00, $00, $00, $00; $00BCC6 |
  db $00, $00, $00, $00, $11, $04, $00, $00, $22, $20; $00BCD0 |

  db $02, $00, $16, $3D, $01, $00, $69, $28, $30, $77; $00BCDA |
  db $77, $00, $00, $00, $1F, $00, $00, $00, $02, $20; $00BCE4 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BCEE |
  db $02, $00, $00, $00, $11, $06, $00, $00, $22, $20; $00BCF8 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BD02 |
  db $02, $00, $00, $00, $15, $00, $00, $00, $22, $20; $00BD0C |

  db $02, $00, $16, $3D, $01, $59, $3A, $69, $34, $77; $00BD16 |
  db $02, $00, $00, $00, $05, $12, $00, $00, $22, $45; $00BD20 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BD2A |
  db $02, $00, $00, $00, $13, $04, $00, $00, $22, $B3; $00BD34 |

  db $02, $00, $16, $3D, $01, $69, $69, $3A, $34, $77; $00BD3E |
  db $02, $00, $00, $00, $04, $13, $00, $00, $22, $24; $00BD48 |

  db $08, $02, $16, $3D, $01, $09, $61, $69, $74, $00; $00BD52 |
  db $77, $00, $30, $00, $15, $02, $0A, $02, $02, $20; $00BD5C |

  db $0C, $00, $16, $1D, $00, $01, $1C, $1C, $15, $22; $00BD66 |
  db $01, $32, $00, $80, $17, $00, $00, $00, $10, $00; $00BD70 |

  db $0E, $06, $16, $3D, $01, $41, $6A, $3A, $34, $77; $00BD7A |
  db $02, $00, $00, $A0, $17, $00, $10, $00, $20, $94; $00BD84 |

  db $08, $04, $07, $1B, $00, $03, $50, $5C, $00, $50; $00BD8E |
  db $00, $00, $00, $00, $13, $00, $00, $00, $00, $00; $00BD98 |

; in: x = scene index
init_scene_regs:
  PHB                                       ; $00BDA2 |
  PHK                                       ; $00BDA3 |
  PLB                                       ; $00BDA4 |
  REP #$10                                  ; $00BDA5 |
  LDY scene_layout_indices,x                ; $00BDA7 | index into scene info
  LDA scene_register_layout,y               ; $00BDAA |\
  STA !r_interrupt_mode                     ; $00BDAD | |
  LDA scene_register_layout+1,y             ; $00BDB0 | | first 4 bytes of scene entry
  STA !r_irq_setting                        ; $00BDB3 | | see scene_register_layout for info
  LDA scene_register_layout+2,y             ; $00BDB6 | |
  STA $012D                                 ; $00BDB9 | | SCBR mirror
  LDA scene_register_layout+3,y             ; $00BDBC | |
  STA $012E                                 ; $00BDBF |/  SCMR mirror
  LDA scene_register_layout+4,y             ; $00BDC2 |\
  BEQ .cont                                 ; $00BDC5 | |
  REP #$20                                  ; $00BDC7 | | fifth byte is a flag
  LDA !s_cgram_mirror                       ; $00BDC9 | |
  STA !r_reg_coldata_mirror                 ; $00BDCD | |
  STA !s_cgram_mirror+$20                   ; $00BDD0 | | Set background color
  STA $702D8C                               ; $00BDD4 | | And move bgcolor mirror down a row
  LDA #$0000                                ; $00BDD8 | |
  STA !s_cgram_mirror                       ; $00BDDB | | Clear original bgcolor mirror
  STA $702D6C                               ; $00BDDF |/
  SEP #$20                                  ; $00BDE3 |

.cont
  LDX #$0000                                ; $00BDE5 |

.set_reg_mirrors
  LDA scene_register_layout+5,y             ; $00BDE8 |\
  STA $095E,x                               ; $00BDEB | | copies scene info from ROM
  INY                                       ; $00BDEE | | into VRAM reg mirrors
  INX                                       ; $00BDEF | |
  CPX #$000F                                ; $00BDF0 | |
  BCC .set_reg_mirrors                      ; $00BDF3 |/
  STZ !r_reg_hdmaen_mirror                  ; $00BDF5 |
  STZ !reg_bg4sc                            ; $00BDF8 |
  LDY #$2100                                ; $00BDFB |\
  STY $00                                   ; $00BDFE |/ Set register pointer
  SEP #$10                                  ; $00BE00 |
  LDX #$0E                                  ; $00BE02 | loop counter

.init_registers
  LDY reg_mirror_mapping,x                  ; $00BE04 |\  which VRAM register $21xx
  LDA $095E,x                               ; $00BE07 | |
  STA ($00),y                               ; $00BE0A | | writes $095E-$096C to
  DEX                                       ; $00BE0C | | respective $21xx reg's
  BPL .init_registers                       ; $00BE0D |/
  REP #$20                                  ; $00BE0F |\
  STZ !r_reg_wbglog_mirror                  ; $00BE11 | | Clear window mask
  STZ !reg_wbglog                           ; $00BE14 | |
  SEP #$20                                  ; $00BE17 |/
  LDA #$02                                  ; $00BE19 |\
  STA !r_reg_obsel_mirror                   ; $00BE1B | | set Name Base Select
  STA !reg_obsel                            ; $00BE1E |/
  STZ !reg_setini                           ; $00BE21 |
  PLB                                       ; $00BE24 |
  RTL                                       ; $00BE25 | Return


copy_division_lookup_to_sram:
  REP #$30                                  ; $00BE26 |
  PHB                                       ; $00BE28 |\
  LDY #$2200                                ; $00BE29 | |
  LDX #$E552                                ; $00BE2C | | move $00E552~$00E952 to $702200~$7025FF
  LDA #$03FF                                ; $00BE2F | |
  MVN $70,$00                               ; $00BE32 | |
  PLB                                       ; $00BE35 |/
  SEP #$30                                  ; $00BE36 |
  RTL                                       ; $00BE38 |

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
  PHP                                       ; $00BE39 |
  REP #$30                                  ; $00BE3A |
  LDX $096D                                 ; $00BE3C |  argument store index
  LDA $02,s                                 ; $00BE3F |\ return address as index
  TAY                                       ; $00BE41 |/
  LDA $0007,y                               ; $00BE42 |\
  STA $096F,x                               ; $00BE45 |/ last word passed in
  LDA $0001,y                               ; $00BE48 |\
  STA $0971,x                               ; $00BE4B |/ first word passed in
  LDA $0003,y                               ; $00BE4E |\
  STA $0973,x                               ; $00BE51 |/ second word passed in
  LDA $0005,y                               ; $00BE54 |\
  STA $0975,x                               ; $00BE57 |/ third word passed in
  LDA #$0000                                ; $00BE5A |
  STA $0977,x                               ; $00BE5D |
  TXA                                       ; $00BE60 |
  CLC                                       ; $00BE61 |
  ADC #$0008                                ; $00BE62 |\ offset argument store index
  STA $096D                                 ; $00BE65 |/
  TYA                                       ; $00BE68 |
  CLC                                       ; $00BE69 |
  ADC #$0008                                ; $00BE6A |
  STA $02,s                                 ; $00BE6D |  adds 8 to return address
  PLP                                       ; $00BE6F |
  RTL                                       ; $00BE70 |

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
  PHP                                       ; $00BE71 |
  REP #$10                                  ; $00BE72 |
  LDX $096D                                 ; $00BE74 |\ store accumulator argument
  STA $096F,x                               ; $00BE77 |/
  LDA $02,s                                 ; $00BE7A |\ return address as index
  TAY                                       ; $00BE7C |/
  LDA $0001,y                               ; $00BE7D |\ first word passed in
  STA $0971,x                               ; $00BE80 |/
  LDA $0003,y                               ; $00BE83 |\ second word passed in
  STA $0973,x                               ; $00BE86 |/
  LDA $0005,y                               ; $00BE89 |\ last word passed in
  STA $0975,x                               ; $00BE8C |/
  LDA #$0000                                ; $00BE8F |
  STA $0977,x                               ; $00BE92 |
  TXA                                       ; $00BE95 |
  CLC                                       ; $00BE96 |
  ADC #$0008                                ; $00BE97 |\ offset argument store index
  STA $096D                                 ; $00BE9A |/
  TYA                                       ; $00BE9D |
  CLC                                       ; $00BE9E |
  ADC #$0006                                ; $00BE9F |\ adds 6 to return address
  STA $02,s                                 ; $00BEA2 |/
  PLP                                       ; $00BEA4 |
  RTL                                       ; $00BEA5 |

; Add to VRAM DMA queue routines ($7E4800 table)
; Arguments passed in:
; DMA Size from register A
; VRAM Destination from Y
; Source Bank from $0001
; Source Address from X

; video port control = $80
; DMA control = $01
; DMA dest reg = $2118
  PHB                                       ; $00BEA6 |
  PEA $7E48                                 ; $00BEA7 |\
  PLB                                       ; $00BEAA | | data bank $7E
  PLB                                       ; $00BEAB |/
  PHX                                       ; $00BEAC |
  LDX $4800                                 ; $00BEAD |
  STA $0008,x                               ; $00BEB0 |
  TYA                                       ; $00BEB3 |
  STA $0000,x                               ; $00BEB4 |
  LDA #$0180                                ; $00BEB7 |
  STA $0002,x                               ; $00BEBA |
  LDA #$0018                                ; $00BEBD |
  STA $0004,x                               ; $00BEC0 |
  LDA $0000                                 ; $00BEC3 |
  STA $0006,x                               ; $00BEC6 |
  PLA                                       ; $00BEC9 |
  STA $0005,x                               ; $00BECA |
  TXA                                       ; $00BECD |
  CLC                                       ; $00BECE |
  ADC #$000C                                ; $00BECF |
  STA $000A,x                               ; $00BED2 |
  STA $4800                                 ; $00BED5 |
  PLB                                       ; $00BED8 |
  RTL                                       ; $00BED9 |

; unused? (bugged size?)
; video port control = $80
; DMA control = $09
; DMA dest reg = $2118
  PHB                                       ; $00BEDA |
  PEA $7E48                                 ; $00BEDB |\
  PLB                                       ; $00BEDE | | data bank $7E
  PLB                                       ; $00BEDF |/
  PHX                                       ; $00BEE0 |
  LDX $4800                                 ; $00BEE1 |
  STA $0008,x                               ; $00BEE4 |
  TYA                                       ; $00BEE7 |
  STA $0000,x                               ; $00BEE8 |
  LDA #$0980                                ; $00BEEB |
  STA $0002,x                               ; $00BEEE |
  LDA #$0018                                ; $00BEF1 |
  STA $0004,x                               ; $00BEF4 |
  LDA #$7E48                                ; $00BEF7 |
  STA $0006,x                               ; $00BEFA |
  TXA                                       ; $00BEFD |
  CLC                                       ; $00BEFE |
  ADC #$000C                                ; $00BEFF |
  STA $0005,x                               ; $00BF02 |
  TXA                                       ; $00BF05 |
  CLC                                       ; $00BF06 |
  ADC #$000D                                ; $00BF07 |
  STA $000A,x                               ; $00BF0A |
  STA $4800                                 ; $00BF0D |
  PLA                                       ; $00BF10 |
  STA $000C,x                               ; $00BF11 |
  PLB                                       ; $00BF14 |
  RTL                                       ; $00BF15 |

; video port control = $00
; DMA control = $00
; DMA dest reg = $2118
  PHB                                       ; $00BF16 |
  PEA $7E48                                 ; $00BF17 |\
  PLB                                       ; $00BF1A | | data bank $7E
  PLB                                       ; $00BF1B |/
  PHX                                       ; $00BF1C |
  LDX $4800                                 ; $00BF1D |
  STA $0008,x                               ; $00BF20 |
  TYA                                       ; $00BF23 |
  STA $0000,x                               ; $00BF24 |
  LDA #$0000                                ; $00BF27 |
  STA $0002,x                               ; $00BF2A |
  LDA #$0018                                ; $00BF2D |
  STA $0004,x                               ; $00BF30 |
  LDA $0000                                 ; $00BF33 |
  STA $0006,x                               ; $00BF36 |
  PLA                                       ; $00BF39 |
  STA $0005,x                               ; $00BF3A |
  TXA                                       ; $00BF3D |
  CLC                                       ; $00BF3E |
  ADC #$000C                                ; $00BF3F |
  STA $000A,x                               ; $00BF42 |
  STA $4800                                 ; $00BF45 |
  PLB                                       ; $00BF48 |
  RTL                                       ; $00BF49 |

; unused? (bugged size?)
; video port control = $00
; DMA control = $08
; DMA dest reg = $2118
  PHB                                       ; $00BF4A |
  PEA $7E48                                 ; $00BF4B |\
  PLB                                       ; $00BF4E | | data bank $7E
  PLB                                       ; $00BF4F |/
  PHX                                       ; $00BF50 |
  LDX $4800                                 ; $00BF51 |
  STA $0008,x                               ; $00BF54 |
  TYA                                       ; $00BF57 |
  STA $0000,x                               ; $00BF58 |
  LDA #$0800                                ; $00BF5B |
  STA $0002,x                               ; $00BF5E |
  LDA #$0018                                ; $00BF61 |
  STA $0004,x                               ; $00BF64 |
  LDA #$7E48                                ; $00BF67 |
  STA $0006,x                               ; $00BF6A |
  TXA                                       ; $00BF6D |
  CLC                                       ; $00BF6E |
  ADC #$000C                                ; $00BF6F |
  STA $0005,x                               ; $00BF72 |
  TXA                                       ; $00BF75 |
  CLC                                       ; $00BF76 |
  ADC #$000D                                ; $00BF77 |
  STA $000A,x                               ; $00BF7A |
  STA $4800                                 ; $00BF7D |
  PLA                                       ; $00BF80 |
  STA $000C,x                               ; $00BF81 |
  PLB                                       ; $00BF84 |
  RTL                                       ; $00BF85 |

; video port control = $80
; DMA control = $00
; DMA dest reg = $2119
  PHB                                       ; $00BF86 |
  PEA $7E48                                 ; $00BF87 |\
  PLB                                       ; $00BF8A | | data bank $7E
  PLB                                       ; $00BF8B |/
  PHX                                       ; $00BF8C |
  LDX $4800                                 ; $00BF8D |
  STA $0008,x                               ; $00BF90 |
  TYA                                       ; $00BF93 |
  STA $0000,x                               ; $00BF94 |
  LDA #$0080                                ; $00BF97 |
  STA $0002,x                               ; $00BF9A |
  LDA #$0019                                ; $00BF9D |
  STA $0004,x                               ; $00BFA0 |
  LDA $0000                                 ; $00BFA3 |
  STA $0006,x                               ; $00BFA6 |
  PLA                                       ; $00BFA9 |
  STA $0005,x                               ; $00BFAA |
  TXA                                       ; $00BFAD |
  CLC                                       ; $00BFAE |
  ADC #$000C                                ; $00BFAF |
  STA $000A,x                               ; $00BFB2 |
  STA $4800                                 ; $00BFB5 |
  PLB                                       ; $00BFB8 |
  RTL                                       ; $00BFB9 |

; video port control = $80
; DMA control = $08
; DMA dest reg = $2119
  PHB                                       ; $00BFBA |
  PEA $7E48                                 ; $00BFBB |\
  PLB                                       ; $00BFBE | | data bank $7E
  PLB                                       ; $00BFBF |/
  PHX                                       ; $00BFC0 |
  LDX $4800                                 ; $00BFC1 |
  STA $0008,x                               ; $00BFC4 |
  TYA                                       ; $00BFC7 |
  STA $0000,x                               ; $00BFC8 |
  LDA #$0880                                ; $00BFCB |
  STA $0002,x                               ; $00BFCE |
  LDA #$0019                                ; $00BFD1 |
  STA $0004,x                               ; $00BFD4 |
  LDA #$7E48                                ; $00BFD7 |
  STA $0006,x                               ; $00BFDA |
  TXA                                       ; $00BFDD |
  CLC                                       ; $00BFDE |
  ADC #$000C                                ; $00BFDF |
  STA $0005,x                               ; $00BFE2 |
  TXA                                       ; $00BFE5 |
  CLC                                       ; $00BFE6 |
  ADC #$000D                                ; $00BFE7 |
  STA $000A,x                               ; $00BFEA |
  STA $4800                                 ; $00BFED |
  PLA                                       ; $00BFF0 |
  STA $000C,x                               ; $00BFF1 |
  PLB                                       ; $00BFF4 |
  RTL                                       ; $00BFF5 |

; freespace
  db $FF, $FF, $FF, $FF, $FF                ; $00BFF6 |
  db $FF, $FF, $FF, $FF, $FF                ; $00BFFB |

;RAM
NMI:
  SEI                                       ; $00C000 | Disable interrupts to stop interrupting an interrupt
  REP #$38                                  ; $00C001 |\
  PHA                                       ; $00C003 | | Make sure we're in 16-bit
  PHX                                       ; $00C004 | | Push processor flags and registers
  PHY                                       ; $00C005 | |
  PHD                                       ; $00C006 | |
  PHB                                       ; $00C007 |/
  LDA #$0000                                ; $00C008 |\ set direct page to #$0000
  TCD                                       ; $00C00B |/
  SEP #$30                                  ; $00C00C | 8 bit A/X/Y
  PHA                                       ; $00C00E |\ set bank to $00
  PLB                                       ; $00C00F |/
  LDY !reg_rdnmi                            ; $00C010 | clear NMI flag
  LDX !r_interrupt_mode                     ; $00C013 |
  JSR ($C074,x)                             ; $00C016 |
  LDA $4D                                   ; $00C019 |\ Check if music track to be played
  BNE play_music_track                      ; $00C01B |/
  LDX !reg_apu_port0                        ; $00C01D |\
  CPX $4F                                   ; $00C020 | | If music track ID is same as previous frame, skip processing
  BNE handle_sound                          ; $00C022 |/

play_music_track:
  STA !reg_apu_port0                        ; $00C024 |\  Send music track ID
  STA $4F                                   ; $00C027 | | Copy to precious frame
  STZ $4D                                   ; $00C029 |/  Clear music track ID

handle_sound:
  LDA $51                                   ; $00C02B |\
  STA !reg_apu_port1                        ; $00C02D | | Play pseudo-noise sound and clear mirror
  STZ $51                                   ; $00C030 |/
  LDA !reg_apu_port3                        ; $00C032 |\
  CMP $55                                   ; $00C035 | | If current playing sound is same as previous frame then return
  BNE .ret                                  ; $00C037 |/
  LDY $53                                   ; $00C039 |\
  BEQ .check_sound_queue                    ; $00C03B |/  Check if immediate sound to be played this frame
  CMP $53                                   ; $00C03D |\
  BEQ .clear_sound                          ; $00C03F | | If sound ID is same as current, clear it
  STZ $53                                   ; $00C041 | | Otherwise just play sound ID
  BRA .play_sound                           ; $00C043 |/

.check_sound_queue
  LDX $57                                   ; $00C045 |\
  BEQ .play_sound                           ; $00C047 |/ Check if sound queue is empty
  CMP !r_sound_queue_dp                     ; $00C049 |\
  BNE .check_sound_queue_size               ; $00C04B |/ Check if sound ID is same as current sound

.clear_sound
  LDY #$00                                  ; $00C04D | Clear APU mirror
  BRA .play_sound                           ; $00C04F |

.check_sound_queue_size
  DEX                                       ; $00C051 |
  CPX #$07                                  ; $00C052 |\  if queue size > $06
  BCC .process_sound_queue                  ; $00C054 | | then limit it to $06
  LDX #$06                                  ; $00C056 |/

.process_sound_queue
  STX $57                                   ; $00C058 | New sound queue size
  LDY !r_sound_queue_dp                     ; $00C05A | Sound ID to be played
  LDX #$00                                  ; $00C05C |

.pop_sound_queue
  LDA $5A,x                                 ; $00C05E |\
  STA !r_sound_queue_dp,x                   ; $00C060 | | Shuffle all values down the queue
  INX                                       ; $00C062 | |
  CPX $57                                   ; $00C063 |/
  BCC .pop_sound_queue                      ; $00C065 |

.play_sound
  STY !reg_apu_port3                        ; $00C067 | APU I/O 3 mirror (play sound)
  STY $55                                   ; $00C06A | Copy to previous frame sound ID

.ret
  REP #$30                                  ; $00C06C |
  PLB                                       ; $00C06E |
  PLD                                       ; $00C06F |
  PLY                                       ; $00C070 |
  PLX                                       ; $00C071 |
  PLA                                       ; $00C072 |
  RTI                                       ; $00C073 | Return from NMI

  dw $C084, $C10A, $C10A, $C22C             ; $00C074 |
  dw $C10A, $C10A, $C10B, $C10A             ; $00C07C |

  LDY #$8F                                  ; $00C084 |\ Force blank
  STY !reg_inidisp                          ; $00C086 |/
  STZ !reg_hdmaen                           ; $00C089 | Disable HDMA
  LDA !r_game_loop_complete                 ; $00C08C |
  BNE CODE_00C094                           ; $00C08F |
  JMP CODE_00C0FD                           ; $00C091 |

CODE_00C094:
  STZ !r_game_loop_complete                 ; $00C094 |
  JSR process_vram_dma_queue                ; $00C097 |
  JSR prepare_tilemap_dma_queue             ; $00C09A |
  REP #$20                                  ; $00C09D |
  LDA #$420B                                ; $00C09F |
  TCD                                       ; $00C0A2 |
  LDX #$01                                  ; $00C0A3 |
  JSR CODE_00D4AC                           ; $00C0A5 |
  JSR CODE_00D4E5                           ; $00C0A8 |
  LDY #$80                                  ; $00C0AB |
  STY !reg_vmain                            ; $00C0AD |
  LDA #$1801                                ; $00C0B0 |
  STA $F5                                   ; $00C0B3 |
  JSR CODE_00DC6B                           ; $00C0B5 |
  LDA #$0000                                ; $00C0B8 |
  TCD                                       ; $00C0BB |
  SEP #$20                                  ; $00C0BC |
  JSR CODE_00E507                           ; $00C0BE |
  LDA $39                                   ; $00C0C1 |\
  STA !reg_bg1hofs                          ; $00C0C3 | | BG1 horizontal scroll
  LDA $3A                                   ; $00C0C6 | |
  STA !reg_bg1hofs                          ; $00C0C8 |/
  LDA $3B                                   ; $00C0CB |\
  STA !reg_bg1vofs                          ; $00C0CD | | BG1 vertical scroll
  LDA $3C                                   ; $00C0D0 | |
  STA !reg_bg1vofs                          ; $00C0D2 |/
  LDA $3D                                   ; $00C0D5 |\
  STA !reg_bg2hofs                          ; $00C0D7 | | BG2 horizontal scroll
  LDA $3E                                   ; $00C0DA | |
  STA !reg_bg2hofs                          ; $00C0DC |/
  LDA $3F                                   ; $00C0DF |\
  STA !reg_bg2vofs                          ; $00C0E1 | | BG2 vertical scroll
  LDA $40                                   ; $00C0E4 | |
  STA !reg_bg2vofs                          ; $00C0E6 |/
  LDA $41                                   ; $00C0E9 |\
  STA !reg_bg3hofs                          ; $00C0EB | | BG3 horizontal scroll
  LDA $42                                   ; $00C0EE | |
  STA !reg_bg3hofs                          ; $00C0F0 |/
  LDA $43                                   ; $00C0F3 |\
  STA !reg_bg3vofs                          ; $00C0F5 | | BG3 vertical scroll
  LDA $44                                   ; $00C0F8 | |
  STA !reg_bg3vofs                          ; $00C0FA |/

CODE_00C0FD:
  LDA !r_reg_inidisp_mirror                 ; $00C0FD |
  STA !reg_inidisp                          ; $00C100 |
  LDA !r_reg_hdmaen_mirror                  ; $00C103 |
  STA !reg_hdmaen                           ; $00C106 |
  RTS                                       ; $00C109 |

  RTS                                       ; $00C10A |

  LDY #$8F                                  ; $00C10B |\ Force blank
  STY !reg_inidisp                          ; $00C10D |/
  STZ !reg_hdmaen                           ; $00C110 | Disable HDMA
  LDA !r_reg_cgwsel_mirror                  ; $00C113 |
  STA !reg_cgwsel                           ; $00C116 |
  LDA $0994                                 ; $00C119 |
  ORA #$80                                  ; $00C11C |
  STA !reg_coldata                          ; $00C11E |
  LDA $0992                                 ; $00C121 |
  ORA #$40                                  ; $00C124 |
  STA !reg_coldata                          ; $00C126 |
  LDA $0990                                 ; $00C129 |
  ORA #$20                                  ; $00C12C |
  STA !reg_coldata                          ; $00C12E |
  LDA !r_game_loop_complete                 ; $00C131 |
  BNE CODE_00C139                           ; $00C134 |
  JMP CODE_00C1DF                           ; $00C136 |

CODE_00C139:
  STZ !r_game_loop_complete                 ; $00C139 |
  JSR process_vram_dma_queue                ; $00C13C |
  JSR prepare_tilemap_dma_queue             ; $00C13F |
  REP #$20                                  ; $00C142 |
  LDA #$420B                                ; $00C144 |
  TCD                                       ; $00C147 |
  LDX #$01                                  ; $00C148 |
  JSR CODE_00D4AC                           ; $00C14A |
  JSR CODE_00D510                           ; $00C14D |
  LDA #$0000                                ; $00C150 |
  TCD                                       ; $00C153 |
  LDA $39                                   ; $00C154 |
  STA $7E5B59                               ; $00C156 |
  LDA $3B                                   ; $00C15A |
  STA $7E5B5B                               ; $00C15C |
  LDA $69                                   ; $00C160 |
  STA $7E5B5E                               ; $00C162 |
  LDA $6B                                   ; $00C166 |
  STA $7E5B60                               ; $00C168 |
  LDA $3D                                   ; $00C16C |
  STA $7E5B99                               ; $00C16E |
  LDA $3F                                   ; $00C172 |
  STA $7E5B9B                               ; $00C174 |
  LDA $6D                                   ; $00C178 |
  STA $7E5B9E                               ; $00C17A |
  LDA $6F                                   ; $00C17E |
  STA $7E5BA0                               ; $00C180 |
  LDA $1144                                 ; $00C184 |
  STA $7E5740                               ; $00C187 |
  SEP #$20                                  ; $00C18B |
  LDA !r_reg_cgadsub_mirror                 ; $00C18D |
  STA $7E5C9B                               ; $00C190 |
  JSR CODE_00E507                           ; $00C194 | update controllers

; set the screen scrolling registers
  LDA !r_reg_tmw_mirror                     ; $00C197 |
  STA !reg_tmw                              ; $00C19A |
  LDA !r_reg_wobjsel_mirror                 ; $00C19D |
  STA !reg_wobjsel                          ; $00C1A0 |
  LDA $39                                   ; $00C1A3 |\
  STA !reg_bg1hofs                          ; $00C1A5 | | BG1 horizontal scroll
  LDA $3A                                   ; $00C1A8 | |
  STA !reg_bg1hofs                          ; $00C1AA |/
  LDA $3B                                   ; $00C1AD |\
  STA !reg_bg1vofs                          ; $00C1AF | | BG1 vertical scroll
  LDA $3C                                   ; $00C1B2 | |
  STA !reg_bg1vofs                          ; $00C1B4 |/
  LDA $3D                                   ; $00C1B7 |\
  STA !reg_bg2hofs                          ; $00C1B9 | | BG2 horizontal scroll
  LDA $3E                                   ; $00C1BC | |
  STA !reg_bg2hofs                          ; $00C1BE |/
  LDA $3F                                   ; $00C1C1 |\
  STA !reg_bg2vofs                          ; $00C1C3 | | BG2 vertical scroll
  LDA $40                                   ; $00C1C6 | |
  STA !reg_bg2vofs                          ; $00C1C8 |/
  LDA $41                                   ; $00C1CB |\
  STA !reg_bg3hofs                          ; $00C1CD | | BG3 horizontal scroll
  LDA $42                                   ; $00C1D0 | |
  STA !reg_bg3hofs                          ; $00C1D2 |/
  LDA $43                                   ; $00C1D5 |\
  STA !reg_bg3vofs                          ; $00C1D7 | | BG3 vertical scroll
  LDA $44                                   ; $00C1DA | |
  STA !reg_bg3vofs                          ; $00C1DC |/

CODE_00C1DF:
  LDA !r_reg_inidisp_mirror                 ; $00C1DF |
  STA !reg_inidisp                          ; $00C1E2 |
  LDA !r_reg_hdmaen_mirror                  ; $00C1E5 |
  STA !reg_hdmaen                           ; $00C1E8 |
  RTS                                       ; $00C1EB |

  dw $4000, $6000, $4700, $6700             ; $00C1EC |

  dw $5180, $7180, $56DE, $56DE             ; $00C1F4 |
  dw $64DE, $64DE                           ; $00C1FC |

  dw $79DE, $79DE, $0E00, $0E00             ; $00C200 |
  dw $1500, $1500, $1500, $1500             ; $00C208 |

  db $63, $62                               ; $00C210 |

  db $3F, $BF, $00, $50, $28, $00, $00, $00 ; $00C212 |
  db $00, $00                               ; $00C21A |

  db $01, $00, $01, $00, $01, $00, $00, $00 ; $00C21C |
  db $FF, $FF, $FF, $00, $01, $01, $01, $00 ; $00C224 |

  LDY #$8F                                  ; $00C22C |\ Force blank
  STY !reg_inidisp                          ; $00C22E |/
  STZ !reg_hdmaen                           ; $00C231 | Disable HDMA
  LDA $1139                                 ; $00C234 |
  BEQ CODE_00C23B                           ; $00C237 |
  STA $51                                   ; $00C239 |

CODE_00C23B:
  LDA !r_reg_cgadsub_mirror                 ; $00C23B |
  STA !reg_cgadsub                          ; $00C23E |
  LDA $0994                                 ; $00C241 |
  ORA #$80                                  ; $00C244 |
  STA !reg_coldata                          ; $00C246 |
  LDA $0992                                 ; $00C249 |
  ORA #$40                                  ; $00C24C |
  STA !reg_coldata                          ; $00C24E |
  LDA $0990                                 ; $00C251 |
  ORA #$20                                  ; $00C254 |
  STA !reg_coldata                          ; $00C256 |
  REP #$20                                  ; $00C259 |
  INC $0131                                 ; $00C25B |
  LDY #$8C80                                ; $00C25E |
  ORA $21,x                                 ; $00C261 |
  LDA #$1801                                ; $00C263 |
  STA $4300                                 ; $00C266 |
  LDY #$01                                  ; $00C269 |
  SEP #$20                                  ; $00C26B |
  LDA $0980                                 ; $00C26D |
  BEQ CODE_00C29E                           ; $00C270 |
  ASL A                                     ; $00C272 |
  ORA $0984                                 ; $00C273 |
  ASL A                                     ; $00C276 |
  TAX                                       ; $00C277 |
  REP #$20                                  ; $00C278 |
  LDA $7EC1E8,x                             ; $00C27A |
  STA !reg_vmadd                            ; $00C27E |
  LDA $7EC1F4,x                             ; $00C281 |
  STA $4302                                 ; $00C285 |
  LDA $7EC200,x                             ; $00C288 |
  STA $4305                                 ; $00C28C |
  LDX #$7F                                  ; $00C28F |
  STX $4304                                 ; $00C291 |
  STY !reg_mdmaen                           ; $00C294 |
  SEP #$20                                  ; $00C297 |
  DEC $0980                                 ; $00C299 |
  BNE CODE_00C2A3                           ; $00C29C |

CODE_00C29E:
  LDA !r_game_loop_complete                 ; $00C29E |
  BNE CODE_00C2A6                           ; $00C2A1 |

CODE_00C2A3:
  JMP CODE_00C33E                           ; $00C2A3 |

CODE_00C2A6:
  STZ !r_game_loop_complete                 ; $00C2A6 |
  LDA $0982                                 ; $00C2A9 |
  STZ $0982                                 ; $00C2AC |
  STA $0980                                 ; $00C2AF |
  JSR process_vram_dma_queue                ; $00C2B2 |
  REP #$20                                  ; $00C2B5 |
  LDA #$420B                                ; $00C2B7 |
  TCD                                       ; $00C2BA |
  LDX #$01                                  ; $00C2BB |
  JSR CODE_00D4AC                           ; $00C2BD |
  JSR CODE_00D510                           ; $00C2C0 |
  LDA #$5040                                ; $00C2C3 |
  STA !reg_wmaddl                           ; $00C2C6 |
  LDY #$7E                                  ; $00C2C9 |
  STY !reg_wmaddh                           ; $00C2CB |
  LDA #$8000                                ; $00C2CE |
  STA $F5                                   ; $00C2D1 |
  LDA #$6CAA                                ; $00C2D3 |
  STA $F7                                   ; $00C2D6 |
  LDY #$00                                  ; $00C2D8 |
  STY $F9                                   ; $00C2DA |
  LDA #$0380                                ; $00C2DC |
  STA $FA                                   ; $00C2DF |
  STX $00                                   ; $00C2E1 |
  LDA #$0000                                ; $00C2E3 |
  TCD                                       ; $00C2E6 |
  SEP #$20                                  ; $00C2E7 |
  LDY $0984                                 ; $00C2E9 |
  LDA $C210,y                               ; $00C2EC |
  STA !reg_obsel                            ; $00C2EF |
  LDA !r_reg_tmw_mirror                     ; $00C2F2 |
  STA !reg_tmw                              ; $00C2F5 |
  LDA !r_reg_wobjsel_mirror                 ; $00C2F8 |
  STA !reg_wobjsel                          ; $00C2FB |
  LDA $39                                   ; $00C2FE |\
  STA !reg_bg1hofs                          ; $00C300 | | BG1 horizontal scroll
  LDA $3A                                   ; $00C303 | |
  STA !reg_bg1hofs                          ; $00C305 |/
  LDA $3B                                   ; $00C308 |\
  STA !reg_bg1vofs                          ; $00C30A | | BG1 vertical scroll
  LDA $3C                                   ; $00C30D | |
  STA !reg_bg1vofs                          ; $00C30F |/
  LDA $020E                                 ; $00C312 |\
  STA !reg_m7x                              ; $00C315 | | BG2 horizontal scroll
  LDA $020F                                 ; $00C318 | |
  STA !reg_m7x                              ; $00C31B |/
  LDA $0210                                 ; $00C31E |\
  STA !reg_m7y                              ; $00C321 | | BG2 vertical scroll
  LDA $0211                                 ; $00C324 | |
  STA !reg_m7y                              ; $00C327 |/
  LDA $3D                                   ; $00C32A |\
  STA !reg_bg2hofs                          ; $00C32C | | BG3 horizontal scroll
  LDA $3E                                   ; $00C32F | |
  STA !reg_bg2hofs                          ; $00C331 |/
  LDA $3F                                   ; $00C334 |\
  STA !reg_bg2vofs                          ; $00C336 | | BG3 vertical scroll
  LDA $40                                   ; $00C339 | |
  STA !reg_bg2vofs                          ; $00C33B |/

CODE_00C33E:
  REP #$20                                  ; $00C33E |
  LDA $41                                   ; $00C340 |
  CLC                                       ; $00C342 |
  ADC $099E                                 ; $00C343 |
  STA $41                                   ; $00C346 |
  LSR A                                     ; $00C348 |
  STA $09BD                                 ; $00C349 |
  LSR A                                     ; $00C34C |
  LSR A                                     ; $00C34D |
  LSR A                                     ; $00C34E |
  STA $09A1                                 ; $00C34F |
  ADC $09BD                                 ; $00C352 |
  STA $09B9                                 ; $00C355 |
  ADC $09A1                                 ; $00C358 |
  STA $09B5                                 ; $00C35B |
  ADC $09A1                                 ; $00C35E |
  STA $09B1                                 ; $00C361 |
  ADC $09A1                                 ; $00C364 |
  STA $09AD                                 ; $00C367 |
  ADC $09A1                                 ; $00C36A |
  STA $09A9                                 ; $00C36D |
  ADC $09A1                                 ; $00C370 |
  STA $09A5                                 ; $00C373 |
  ADC $09A1                                 ; $00C376 |
  STA $09A1                                 ; $00C379 |
  SEP #$20                                  ; $00C37C |
  LDA !r_reg_bg1sc_mirror                   ; $00C37E |
  STA !reg_bg1sc                            ; $00C381 |
  LDA !r_reg_bg2sc_mirror                   ; $00C384 |
  STA !reg_bg2sc                            ; $00C387 |
  LDA !r_reg_bgmode_mirror                  ; $00C38A |
  STA $7E5A19                               ; $00C38D |
  LDA !r_reg_tm_mirror                      ; $00C391 |
  STA $7E5A99                               ; $00C394 |
  LDA $09A0                                 ; $00C398 |
  STA $4311                                 ; $00C39B |
  JSR CODE_00E507                           ; $00C39E |
  LDA !r_reg_inidisp_mirror                 ; $00C3A1 |
  STA !reg_inidisp                          ; $00C3A4 |
  LDA !r_reg_hdmaen_mirror                  ; $00C3A7 |
  STA !reg_hdmaen                           ; $00C3AA |
  LDA $098E                                 ; $00C3AD |
  BEQ CODE_00C3E7                           ; $00C3B0 |
  PHK                                       ; $00C3B2 |
  PLB                                       ; $00C3B3 |
  LDY $0201                                 ; $00C3B4 |
  LDX $C212,y                               ; $00C3B7 |
  STX !r_reg_cgadsub_mirror                 ; $00C3BA |
  TYA                                       ; $00C3BD |
  ASL A                                     ; $00C3BE |
  ASL A                                     ; $00C3BF |
  TAY                                       ; $00C3C0 |
  LDX #$04                                  ; $00C3C1 |

CODE_00C3C3:
  DEC $0996,x                               ; $00C3C3 |
  BPL CODE_00C3E2                           ; $00C3C6 |
  LDA $C21C,y                               ; $00C3C8 |
  STA $0996,x                               ; $00C3CB |
  LDA $0990,x                               ; $00C3CE |
  CLC                                       ; $00C3D1 |
  ADC $C224,y                               ; $00C3D2 |
  BPL CODE_00C3D9                           ; $00C3D5 |
  LDA #$00                                  ; $00C3D7 |

CODE_00C3D9:
  CMP #$1F                                  ; $00C3D9 |
  BCC CODE_00C3DF                           ; $00C3DB |
  LDA #$1F                                  ; $00C3DD |

CODE_00C3DF:
  STA $0990,x                               ; $00C3DF |

CODE_00C3E2:
  INY                                       ; $00C3E2 |
  DEX                                       ; $00C3E3 |
  DEX                                       ; $00C3E4 |
  BPL CODE_00C3C3                           ; $00C3E5 |

CODE_00C3E7:
  RTS                                       ; $00C3E7 |

IRQ_Handler:
  SEI                                       ; $00C3E8 |  Disable interrupts

IRQ_Start:
  REP #$38                                  ; $00C3E9 |\
  PHA                                       ; $00C3EB | |
  PHX                                       ; $00C3EC | |
  PHY                                       ; $00C3ED | | Push A/X/Y/DP/DB
  PHD                                       ; $00C3EE | |
  PHB                                       ; $00C3EF |/
  LDA #$0000                                ; $00C3F0 |\  DP = $0000
  TCD                                       ; $00C3F3 |/
  SEP #$30                                  ; $00C3F4 |   8-bit
  PHA                                       ; $00C3F6 |\  DB = $00
  PLB                                       ; $00C3F7 |/
  LDA !reg_timeup                           ; $00C3F8 |
  LDX !r_irq_setting                        ; $00C3FB |
  JSR ($C40A,x)                             ; $00C3FE |  IRQ scanline mode

IRQ_Return:
  REP #$30                                  ; $00C401 |
  PLB                                       ; $00C403 |
  PLD                                       ; $00C404 |
  PLY                                       ; $00C405 |
  PLX                                       ; $00C406 |
  PLA                                       ; $00C407 |
  CLI                                       ; $00C408 |

EmptyHandler:
  RTI                                       ; $00C409 |  Return from IRQ

  dw $C412                                  ; $00C40A |  Default
  dw $C821                                  ; $00C40C |  Story Cutscene
  dw $CA9A                                  ; $00C40E |  Credits
  dw $D308                                  ; $00C410 |  Bonus/Bandit Games

  LDA !r_irq_count                          ; $00C412 |\ IRQ counter
  BNE CODE_00C43D                           ; $00C415 |/

; IRQ = 0
; V: 6 H: 50 for gamemode 0F
; Enables HDMA settings before enabling the screen next IRQ
irq_0:
  BIT !reg_hvbjoy                           ; $00C417 |\ wait for h-blank to end
  BVS irq_0                                 ; $00C41A |/

.main
  BIT !reg_hvbjoy                           ; $00C41C |\ wait for h-blank to start
  BVC .main                                 ; $00C41F |/
  LDA !r_reg_hdmaen_mirror                  ; $00C421 |\ Set HDMA
  STA !reg_hdmaen                           ; $00C424 |/
  STZ !reg_inidisp                          ; $00C427 |  turn screen brightness off
  LDA #$50                                  ; $00C42A |\ set h-timer to #$50
  STA !reg_htimel                           ; $00C42C |/
  LDA #$08                                  ; $00C42F |  set v-timer to #$08

next_irq:
  INC !r_irq_count                          ; $00C431 |

; Vertical line taken from A
set_v_irq:
  STA !reg_vtimel                           ; $00C434 |
  LDA #$B1                                  ; $00C437 |\ Enable IRQ, NMI and auto-joypad reading
  STA !reg_nmitimen                         ; $00C439 |/
  RTS                                       ; $00C43C |

CODE_00C43D:
  DEC A                                     ; $00C43D |\ Test IRQ 1 or 2
  BNE irq_2                                 ; $00C43E |/

; IRQ = 1
irq_1:
  BIT !reg_hvbjoy                           ; $00C440 |\ wait for h-blank to end
  BVS irq_1                                 ; $00C443 |/

.main
  BIT !reg_hvbjoy                           ; $00C445 |\ wait for h-blank to start
  BVC .main                                 ; $00C448 |/
  LDA !r_reg_inidisp_mirror                 ; $00C44A |\ restore brightness
  STA !reg_inidisp                          ; $00C44D |/
  LDA #$50                                  ; $00C450 |\ set h-timer to #$50
  STA !reg_htimel                           ; $00C452 |/
  LDA #$D8                                  ; $00C455 | possibly set v-timer to #$D8
  LDX !r_stage_intro_flag                   ; $00C457 |
  BNE CODE_00C45F                           ; $00C45A |
  JMP next_irq                              ; $00C45C |

CODE_00C45F:
  JSR next_irq                              ; $00C45F |\ level load intro (with name)
  JMP ($C714,x)                             ; $00C462 |/

; IRQ = 2
irq_2:
  BIT !reg_hvbjoy                           ; $00C465 |\ wait for h-blank to occur
  BVS irq_2                                 ; $00C468 |/

.main
  BIT !reg_hvbjoy                           ; $00C46A |\ wait for h-blank to end
  BVC .main                                 ; $00C46D |/
  LDY #$8F                                  ; $00C46F |\ Force blank
  STY !reg_inidisp                          ; $00C471 |/
  STZ !reg_hdmaen                           ; $00C474 | Disable HDMA
  LDX !r_interrupt_mode                     ; $00C477 |
  JMP ($C47D,x)                             ; $00C47A |

; IRQ Mode pointers for VRAM transfer
; Modes that lead to RTS does transfer in NMI instead (except for $0E)
  dw $C43C                                  ; $00C47D | Nintendo Logo
  dw $C48D                                  ; $00C47F | Normal Level Mode
  dw $C5FE                                  ; $00C481 | Offset-per-tile Level Modes (1-7/6-4)
  dw $C43C                                  ; $00C483 | Island Scenes
  dw $C87A                                  ; $00C485 | Story Cutscene / Credits
  dw $C641                                  ; $00C487 | Raphael the Raven boss
  dw $C43C                                  ; $00C489 | World Map
  dw $C43C                                  ; $00C48B | Bonus & Bandit Games

; Normal Level Mode
  LDA !r_game_loop_complete                 ; $00C48D |\
  BNE CODE_00C495                           ; $00C490 | | Is game mode still running?
  JMP CODE_00C6CC                           ; $00C492 |/  If so, jump

CODE_00C495:
  REP #$20                                  ; $00C495 |  16-bit A
  LDA $3B                                   ; $00C497 |\
  CLC                                       ; $00C499 | | Camera Y + shake offset
  ADC !r_y_cam_offset                       ; $00C49A | | To vertical scroll reg mirror
  STA !r_reg_bg1vofs_mirror                 ; $00C49D |/
  LDA $39                                   ; $00C4A0 |\

CODE_00C4A2:
  STA !r_reg_bg1hofs_mirror                 ; $00C4A2 |/ Camera X to hor. scroll reg mirror
  SEP #$20                                  ; $00C4A5 |  8-bit A
  STA !reg_bg1vofs                          ; $00C4A7 |
  XBA                                       ; $00C4AA |
  STA !reg_bg1vofs                          ; $00C4AB |
  STZ !r_game_loop_complete                 ; $00C4AE |  Set Game Mode as still running
  JSR process_vram_dma_queue                ; $00C4B1 |
  JSR prepare_tilemap_dma_queue             ; $00C4B4 |
  REP #$20                                  ; $00C4B7 |
  PHD                                       ; $00C4B9 |
  LDA #$420B                                ; $00C4BA |\
  TCD                                       ; $00C4BD |/ DP = $420B
  LDX #$01                                  ; $00C4BE |
  JSR CODE_00DE0C                           ; $00C4C0 |
  JSR CODE_00D4AC                           ; $00C4C3 |
  JSR CODE_00D4E5                           ; $00C4C6 |
  LDY #$80                                  ; $00C4C9 |
  STY !reg_vmain                            ; $00C4CB |
  LDA #$1801                                ; $00C4CE |
  STA $F5                                   ; $00C4D1 |
  LDY !r_pause_menu_state                   ; $00C4D3 |
  BEQ CODE_00C4F4                           ; $00C4D6 |
  CPY #$0C                                  ; $00C4D8 |
  BCC CODE_00C4F4                           ; $00C4DA |
  LDA #$4E00                                ; $00C4DC |
  STA !reg_vmadd                            ; $00C4DF |
  LDA #$6800                                ; $00C4E2 |
  STA $F7                                   ; $00C4E5 |
  LDY #$70                                  ; $00C4E7 |
  STY $F9                                   ; $00C4E9 |
  LDA #$0C00                                ; $00C4EB |
  STA $FA                                   ; $00C4EE |
  STX $00                                   ; $00C4F0 |
  BRA CODE_00C50E                           ; $00C4F2 |

CODE_00C4F4:
  JSR CODE_00DCAE                           ; $00C4F4 |
  JSR animate_bg_tilesets                   ; $00C4F7 |
  JSR CODE_00DC6B                           ; $00C4FA |
  LDY $0D15                                 ; $00C4FD |
  BEQ CODE_00C508                           ; $00C500 |
  JSR CODE_00DC97                           ; $00C502 |
  STZ $0D15                                 ; $00C505 |

CODE_00C508:
  JSR CODE_00DBA9                           ; $00C508 |
  JSR CODE_00DC1C                           ; $00C50B |

CODE_00C50E:
  PLD                                       ; $00C50E |
  LDY $0D0D                                 ; $00C50F |
  BNE CODE_00C51B                           ; $00C512 |
  LDY !r_header_bg_color                    ; $00C514 |
  CPY #$10                                  ; $00C517 |
  BCC CODE_00C539                           ; $00C519 |

CODE_00C51B:
  LDA !r_bg_gradient_y_upper                ; $00C51B |
  STA $7E5D19                               ; $00C51E |
  CLC                                       ; $00C522 |
  ADC #$0069                                ; $00C523 |
  STA $7E5D1C                               ; $00C526 |
  LDA !r_bg_gradient_y_lower                ; $00C52A |
  STA $7E5C99                               ; $00C52D |
  CLC                                       ; $00C531 |
  ADC #$00D2                                ; $00C532 |
  STA $7E5C9C                               ; $00C535 |

CODE_00C539:
  SEP #$20                                  ; $00C539 |
  LDA !r_reg_bg1hofs_mirror                 ; $00C53B |
  STA !reg_bg1hofs                          ; $00C53E |
  LDA $011E                                 ; $00C541 |
  STA !reg_bg1hofs                          ; $00C544 |
  LDA !r_reg_bg1vofs_mirror                 ; $00C547 |
  STA !reg_bg1vofs                          ; $00C54A |
  LDA $0120                                 ; $00C54D |
  STA !reg_bg1vofs                          ; $00C550 |
  LDA $3D                                   ; $00C553 |
  STA !reg_bg2hofs                          ; $00C555 |
  LDA $3E                                   ; $00C558 |
  STA !reg_bg2hofs                          ; $00C55A |
  LDA $3F                                   ; $00C55D |
  STA !reg_bg2vofs                          ; $00C55F |
  LDA $40                                   ; $00C562 |
  STA !reg_bg2vofs                          ; $00C564 |
  LDA $41                                   ; $00C567 |
  STA !reg_bg3hofs                          ; $00C569 |
  LDA $42                                   ; $00C56C |
  STA !reg_bg3hofs                          ; $00C56E |
  LDA $43                                   ; $00C571 |
  STA !reg_bg3vofs                          ; $00C573 |
  LDA $44                                   ; $00C576 |
  STA !reg_bg3vofs                          ; $00C578 |
  JSR CODE_00E507                           ; $00C57B |

; update registers
CODE_00C57E:
  REP #$20                                  ; $00C57E |
  LDA #$2100                                ; $00C580 |\
  TCD                                       ; $00C583 |/ DP = $2100
  LDA !r_reg_tm_mirror                      ; $00C584 |
  STA $2C                                   ; $00C587 |
  LDA !r_reg_tmw_mirror                     ; $00C589 |
  STA $2E                                   ; $00C58C |
  LDA !r_reg_bg12nba_mirror                 ; $00C58E |
  STA $0B                                   ; $00C591 |
  LDA !r_reg_bg1sc_mirror                   ; $00C593 |
  STA $07                                   ; $00C596 |
  LDA !r_reg_w12sel_mirror                  ; $00C598 |
  STA $23                                   ; $00C59B |
  LDA !r_reg_cgwsel_mirror                  ; $00C59D |
  STA $30                                   ; $00C5A0 |
  LDA !r_reg_wbglog_mirror                  ; $00C5A2 |
  STA $2A                                   ; $00C5A5 |
  SEP #$20                                  ; $00C5A7 |
  LDA !r_reg_bg3sc_mirror                   ; $00C5A9 |
  STA $09                                   ; $00C5AC |
  LDA !r_reg_bgmode_mirror                  ; $00C5AE |
  STA $05                                   ; $00C5B1 |
  LDA !r_reg_mosaic_mirror                  ; $00C5B3 |
  STA $06                                   ; $00C5B6 |
  LDA !r_reg_wobjsel_mirror                 ; $00C5B8 |
  STA $25                                   ; $00C5BB |
  REP #$20                                  ; $00C5BD |
  LDA #$4300                                ; $00C5BF |\
  TCD                                       ; $00C5C2 |/ DP = $4300
  LDA $12                                   ; $00C5C3 |
  STA $18                                   ; $00C5C5 |
  LDA $22                                   ; $00C5C7 |
  STA $28                                   ; $00C5C9 |
  LDA $32                                   ; $00C5CB |
  STA $38                                   ; $00C5CD |
  LDA $42                                   ; $00C5CF |
  STA $48                                   ; $00C5D1 |
  LDA $52                                   ; $00C5D3 |
  STA $58                                   ; $00C5D5 |
  LDA $62                                   ; $00C5D7 |
  STA $68                                   ; $00C5D9 |
  LDA $72                                   ; $00C5DB |
  STA $78                                   ; $00C5DD |
  SEP #$20                                  ; $00C5DF |
  LDA #$01                                  ; $00C5E1 |
  STA $1A                                   ; $00C5E3 |
  STA $2A                                   ; $00C5E5 |
  STA $3A                                   ; $00C5E7 |
  STA $4A                                   ; $00C5E9 |
  STA $5A                                   ; $00C5EB |
  STA $6A                                   ; $00C5ED |
  STA $7A                                   ; $00C5EF |
  STZ !r_irq_count                          ; $00C5F1 |
  LDA #$50                                  ; $00C5F4 |
  STA !reg_htimel                           ; $00C5F6 |
  LDA #$06                                  ; $00C5F9 |
  JMP set_v_irq                             ; $00C5FB |

  LDA !r_game_loop_complete                 ; $00C5FE |
  BNE CODE_00C606                           ; $00C601 |
  JMP CODE_00C6CC                           ; $00C603 |

CODE_00C606:
  LDA #$80                                  ; $00C606 |
  STA !reg_vmain                            ; $00C608 |
  REP #$20                                  ; $00C60B |
  LDA #$3600                                ; $00C60D |
  STA !reg_vmadd                            ; $00C610 |
  LDA #$1801                                ; $00C613 |
  STA $4300                                 ; $00C616 |
  LDA #$7EF2                                ; $00C619 |
  STA $4302                                 ; $00C61C |
  LDY #$00                                  ; $00C61F |
  STY $4304                                 ; $00C621 |
  LDY #$80                                  ; $00C624 |
  STY $4305                                 ; $00C626 |
  LDX #$01                                  ; $00C629 |
  STX !reg_mdmaen                           ; $00C62B |
  LDA #$0080                                ; $00C62E |
  STA $43                                   ; $00C631 |
  STZ $41                                   ; $00C633 |
  LDA !s_opt_cam_y                          ; $00C635 |
  STA !r_reg_bg1vofs_mirror                 ; $00C638 |
  LDA !s_opt_cam_x                          ; $00C63B |
  JMP CODE_00C4A2                           ; $00C63E |

  LDA !r_game_loop_complete                 ; $00C641 |
  BNE CODE_00C649                           ; $00C644 |
  JMP CODE_00C6CC                           ; $00C646 |

CODE_00C649:
  LDA !r_reg_m7sel_mirror                   ; $00C649 |
  STA !reg_m7sel                            ; $00C64C |
  LDA !r_reg_m7a_mirror                     ; $00C64F |
  STA !reg_m7a                              ; $00C652 |
  LDA $0950                                 ; $00C655 |
  STA !reg_m7a                              ; $00C658 |
  LDA !r_reg_m7b_mirror                     ; $00C65B |
  STA !reg_m7b                              ; $00C65E |
  LDA $0952                                 ; $00C661 |
  STA !reg_m7b                              ; $00C664 |
  LDA !r_reg_m7c_mirror                     ; $00C667 |
  STA !reg_m7c                              ; $00C66A |
  LDA $0954                                 ; $00C66D |
  STA !reg_m7c                              ; $00C670 |
  LDA !r_reg_m7d_mirror                     ; $00C673 |
  STA !reg_m7d                              ; $00C676 |
  LDA $0956                                 ; $00C679 |
  STA !reg_m7d                              ; $00C67C |
  LDA !r_reg_m7x_mirror                     ; $00C67F |
  STA !reg_m7x                              ; $00C682 |
  LDA $0958                                 ; $00C685 |
  STA !reg_m7x                              ; $00C688 |
  LDA !r_reg_m7y_mirror                     ; $00C68B |
  STA !reg_m7y                              ; $00C68E |
  LDA $095A                                 ; $00C691 |
  STA !reg_m7y                              ; $00C694 |
  REP #$20                                  ; $00C697 |
  LDA $0B83                                 ; $00C699 |
  STA $7E51E5                               ; $00C69C |
  STA $7E51E8                               ; $00C6A0 |
  LDA !r_reg_tm_mirror                      ; $00C6A4 |
  STA $7E51EB                               ; $00C6A7 |
  LDA $39                                   ; $00C6AB |
  STA $3D                                   ; $00C6AD |
  LDA $3B                                   ; $00C6AF |
  CLC                                       ; $00C6B1 |
  ADC !r_y_cam_offset                       ; $00C6B2 |
  STA $3F                                   ; $00C6B5 |
  LDA $43                                   ; $00C6B7 |
  LDY !r_header_level_mode                  ; $00C6B9 |
  CPY #$09                                  ; $00C6BC |
  BNE CODE_00C6C4                           ; $00C6BE |
  CLC                                       ; $00C6C0 |
  ADC !r_y_cam_offset                       ; $00C6C1 |

CODE_00C6C4:
  STA !r_reg_bg1vofs_mirror                 ; $00C6C4 |
  LDA $41                                   ; $00C6C7 |
  JMP CODE_00C4A2                           ; $00C6C9 |

CODE_00C6CC:
  LDA !r_stage_intro_flag                   ; $00C6CC |
  BEQ CODE_00C6F9                           ; $00C6CF |
  REP #$20                                  ; $00C6D1 |
  PHD                                       ; $00C6D3 |
  LDA #$420B                                ; $00C6D4 |
  TCD                                       ; $00C6D7 |
  LDX #$01                                  ; $00C6D8 |
  JSR CODE_00DE0C                           ; $00C6DA |
  JSR CODE_00D4AC                           ; $00C6DD |
  JSR CODE_00D4E5                           ; $00C6E0 |
  LDY #$80                                  ; $00C6E3 |
  STY !reg_vmain                            ; $00C6E5 |
  LDA #$1801                                ; $00C6E8 |
  STA $F5                                   ; $00C6EB |
  JSR CODE_00DCAE                           ; $00C6ED |
  JSR CODE_00DC6B                           ; $00C6F0 |
  PLD                                       ; $00C6F3 |
  SEP #$20                                  ; $00C6F4 |
  JSR CODE_00E507                           ; $00C6F6 |

CODE_00C6F9:
  LDA !r_reg_bg1hofs_mirror                 ; $00C6F9 |
  STA !reg_bg1hofs                          ; $00C6FC |
  LDA $011E                                 ; $00C6FF |
  STA !reg_bg1hofs                          ; $00C702 |
  LDA !r_reg_bg1vofs_mirror                 ; $00C705 |
  STA !reg_bg1vofs                          ; $00C708 |
  LDA $0120                                 ; $00C70B |
  STA !reg_bg1vofs                          ; $00C70E |
  JMP CODE_00C57E                           ; $00C711 |

  dw $C718, $C719                           ; $00C714 |

  RTS                                       ; $00C718 |

  JSL $00C71E                               ; $00C719 | execute gamemode 0F stuff
  RTS                                       ; $00C71D | during level intro

  JSL $008259                               ; $00C71E |
  JSL $0394D3                               ; $00C722 |
  JSL draw_player                           ; $00C726 |
  JSL $04DD9E                               ; $00C72A |
  JSL $0397D3                               ; $00C72E |
  REP #$20                                  ; $00C732 |
  LDX #$08                                  ; $00C734 |
  LDA #$B1EF                                ; $00C736 |
  JSL r_gsu_init_1                          ; $00C739 | GSU init
  INC $0D23                                 ; $00C73D |
  INC $0D25                                 ; $00C740 |
  LDA $0D25                                 ; $00C743 |
  CMP #$0010                                ; $00C746 |
  BCC CODE_00C775                           ; $00C749 |
  LDA !r_joy1_lo_press                      ; $00C74B |
  ORA !r_joy2_lo_press                      ; $00C74E |
  BEQ CODE_00C75D                           ; $00C751 |
  LDA $0D23                                 ; $00C753 |
  CLC                                       ; $00C756 |
  ADC #$0006                                ; $00C757 |
  STA $0D23                                 ; $00C75A |

CODE_00C75D:
  LDA $0D25                                 ; $00C75D |
  AND #$0003                                ; $00C760 |
  BEQ CODE_00C769                           ; $00C763 |
  JML $00C7C8                               ; $00C765 |

CODE_00C769:
  REP #$10                                  ; $00C769 |
  LDX #$0000                                ; $00C76B |
  LDY !r_cur_stage                          ; $00C76E |
  JML $00C778                               ; $00C771 |

CODE_00C775:
  SEP #$20                                  ; $00C775 |
  RTL                                       ; $00C777 |

  REP #$20                                  ; $00C778 |
  PHB                                       ; $00C77A |
  PHK                                       ; $00C77B |
  PLB                                       ; $00C77C |
  LDA $0D21                                 ; $00C77D |
  AND #$003F                                ; $00C780 |
  STA !gsu_r11                              ; $00C783 |
  STY !gsu_r14                              ; $00C786 |
  LDA #$0051                                ; $00C789 |
  STA !gsu_r0                               ; $00C78C |
  LDA #$49BC                                ; $00C78F | level name pointers
  STA !gsu_r10                              ; $00C792 |
  SEP #$10                                  ; $00C795 |
  LDA $0D1D                                 ; $00C797 |
  STA !gsu_r9                               ; $00C79A |
  LDA $0D1F                                 ; $00C79D |
  STA !gsu_r8                               ; $00C7A0 |
  LDX #$09                                  ; $00C7A3 |
  LDA #$E92F                                ; $00C7A5 |
  JSL r_gsu_init_1                          ; $00C7A8 | GSU init
  LDA !gsu_r11                              ; $00C7AC |
  STA $0D21                                 ; $00C7AF |
  LDA !gsu_r8                               ; $00C7B2 |
  STA $0D1F                                 ; $00C7B5 |
  LDA !gsu_r9                               ; $00C7B8 |
  STA $0D1D                                 ; $00C7BB |
  INC $0CF9                                 ; $00C7BE |
  PLB                                       ; $00C7C1 |
  LDA #$5038                                ; $00C7C2 |
  STA $0D1B                                 ; $00C7C5 |
  REP #$10                                  ; $00C7C8 |
  LDA #$AAAA                                ; $00C7CA |
  STA !s_oam_hi_table_mirror                ; $00C7CD |
  STA $6C02                                 ; $00C7D0 |
  LDA #$00E0                                ; $00C7D3 |
  STA !r_msg_box_mask_size                  ; $00C7D6 |
  SEP #$20                                  ; $00C7D9 |
  LDX #$0000                                ; $00C7DB |

CODE_00C7DE:
  REP #$20                                  ; $00C7DE |
  TXA                                       ; $00C7E0 |
  AND #$00FF                                ; $00C7E1 |
  LSR A                                     ; $00C7E4 |
  ORA #$35C0                                ; $00C7E5 |
  STA $6A02,x                               ; $00C7E8 |
  ORA #$0020                                ; $00C7EB |
  STA $6A22,x                               ; $00C7EE |
  LDA $0B4C                                 ; $00C7F1 |
  SEC                                       ; $00C7F4 |
  SBC !r_msg_box_mask_size                  ; $00C7F5 |
  SEP #$20                                  ; $00C7F8 |
  STA !s_oam_lo_table_mirror,x              ; $00C7FA |
  STA $6A20,x                               ; $00C7FD |
  LDA !r_msg_box_mask_size                  ; $00C800 |
  SEC                                       ; $00C803 |
  SBC #$10                                  ; $00C804 |
  STA !r_msg_box_mask_size                  ; $00C806 |
  LDA $0D1B                                 ; $00C809 |
  STA $6A01,x                               ; $00C80C |
  LDA $0D1C                                 ; $00C80F |
  STA $6A21,x                               ; $00C812 |
  INX                                       ; $00C815 |
  INX                                       ; $00C816 |
  INX                                       ; $00C817 |
  INX                                       ; $00C818 |
  CPX #$0020                                ; $00C819 |
  BCC CODE_00C7DE                           ; $00C81C |
  SEP #$10                                  ; $00C81E |
  RTL                                       ; $00C820 |

  LDA !r_irq_count                          ; $00C821 |
  BNE CODE_00C842                           ; $00C824 |

wait_hblank:
  BIT !reg_hvbjoy                           ; $00C826 |
  BVS wait_hblank                           ; $00C829 |

CODE_00C82B:
  BIT !reg_hvbjoy                           ; $00C82B |
  BVC CODE_00C82B                           ; $00C82E |
  LDA !r_reg_hdmaen_mirror                  ; $00C830 |
  STA !reg_hdmaen                           ; $00C833 |
  STZ !reg_inidisp                          ; $00C836 |
  LDA #$50                                  ; $00C839 |
  STA !reg_htimel                           ; $00C83B |
  LDA #$0E                                  ; $00C83E |
  BRA CODE_00C85C                           ; $00C840 |

CODE_00C842:
  DEC A                                     ; $00C842 |
  BNE CODE_00C862                           ; $00C843 |

CODE_00C845:
  BIT !reg_hvbjoy                           ; $00C845 |
  BVS CODE_00C845                           ; $00C848 |

CODE_00C84A:
  BIT !reg_hvbjoy                           ; $00C84A |
  BVC CODE_00C84A                           ; $00C84D |
  LDA !r_reg_inidisp_mirror                 ; $00C84F |
  STA !reg_inidisp                          ; $00C852 |
  LDA #$50                                  ; $00C855 |
  STA !reg_htimel                           ; $00C857 |
  LDA #$C6                                  ; $00C85A |

CODE_00C85C:
  INC !r_irq_count                          ; $00C85C |
  JMP set_v_irq                             ; $00C85F |

CODE_00C862:
  BIT !reg_hvbjoy                           ; $00C862 |
  BVS CODE_00C862                           ; $00C865 |

CODE_00C867:
  BIT !reg_hvbjoy                           ; $00C867 |
  BVC CODE_00C867                           ; $00C86A |
  LDY #$8F                                  ; $00C86C |
  STY !reg_inidisp                          ; $00C86E |
  STZ !reg_hdmaen                           ; $00C871 |
  LDX !r_interrupt_mode                     ; $00C874 |
  JMP ($C47D,x)                             ; $00C877 |

  LDA !r_game_loop_complete                 ; $00C87A |
  BNE CODE_00C882                           ; $00C87D |
  JMP CODE_00CA10                           ; $00C87F |

CODE_00C882:
  STZ !r_game_loop_complete                 ; $00C882 |
  JSR process_vram_dma_queue                ; $00C885 |
  JSR prepare_tilemap_dma_queue             ; $00C888 |
  REP #$20                                  ; $00C88B |
  PHD                                       ; $00C88D |
  LDA #$420B                                ; $00C88E |
  TCD                                       ; $00C891 |
  LDX #$01                                  ; $00C892 |
  JSR CODE_00DE0C                           ; $00C894 |
  JSR CODE_00D4AC                           ; $00C897 |
  JSR CODE_00D4E5                           ; $00C89A |
  LDY #$80                                  ; $00C89D |
  STY !reg_vmain                            ; $00C89F |
  LDA #$1801                                ; $00C8A2 |
  STA $F5                                   ; $00C8A5 |
  LDA $0D15                                 ; $00C8A7 |
  BEQ CODE_00C8C5                           ; $00C8AA |
  LDA #$7000                                ; $00C8AC |
  STA !reg_vmadd                            ; $00C8AF |
  LDA #$4C00                                ; $00C8B2 |
  STA $F7                                   ; $00C8B5 |
  LDY #$70                                  ; $00C8B7 |
  STY $F9                                   ; $00C8B9 |
  LDA #$0800                                ; $00C8BB |
  STA $FA                                   ; $00C8BE |
  STX $00                                   ; $00C8C0 |
  STZ $0D15                                 ; $00C8C2 |

CODE_00C8C5:
  LDA $0CF9                                 ; $00C8C5 |
  BEQ CODE_00C8E0                           ; $00C8C8 |
  STA $FA                                   ; $00C8CA |
  LDA #$5000                                ; $00C8CC |
  STA !reg_vmadd                            ; $00C8CF |
  LDA #$5800                                ; $00C8D2 |
  STA $F7                                   ; $00C8D5 |
  LDY #$70                                  ; $00C8D7 |
  STY $F9                                   ; $00C8D9 |
  STX $00                                   ; $00C8DB |
  STZ $0CF9                                 ; $00C8DD |

CODE_00C8E0:
  LDA $0B85                                 ; $00C8E0 |
  BNE CODE_00C8E8                           ; $00C8E3 |
  JMP CODE_00C9BA                           ; $00C8E5 |

CODE_00C8E8:
  LDA #$5400                                ; $00C8E8 |
  STA !reg_vmadd                            ; $00C8EB |
  LDY #$40                                  ; $00C8EE |
  LDA $6128                                 ; $00C8F0 |
  STA $F7                                   ; $00C8F3 |
  LDA #$0053                                ; $00C8F5 |
  STA $F9                                   ; $00C8F8 |
  STY $FA                                   ; $00C8FA |
  STX $00                                   ; $00C8FC |
  LDA $612C                                 ; $00C8FE |
  STA $F7                                   ; $00C901 |
  STY $FA                                   ; $00C903 |
  STX $00                                   ; $00C905 |
  LDA $6130                                 ; $00C907 |
  STA $F7                                   ; $00C90A |
  STY $FA                                   ; $00C90C |
  STX $00                                   ; $00C90E |
  LDA $6134                                 ; $00C910 |
  STA $F7                                   ; $00C913 |
  STY $FA                                   ; $00C915 |
  STX $00                                   ; $00C917 |
  LDA $6138                                 ; $00C919 |
  STA $F7                                   ; $00C91C |
  STY $FA                                   ; $00C91E |
  STX $00                                   ; $00C920 |
  LDA $613C                                 ; $00C922 |
  STA $F7                                   ; $00C925 |
  STY $FA                                   ; $00C927 |
  STX $00                                   ; $00C929 |
  LDA $6140                                 ; $00C92B |
  STA $F7                                   ; $00C92E |
  STY $FA                                   ; $00C930 |
  STX $00                                   ; $00C932 |
  LDA $6144                                 ; $00C934 |
  STA $F7                                   ; $00C937 |
  STY $FA                                   ; $00C939 |
  STX $00                                   ; $00C93B |
  LDA #$5500                                ; $00C93D |
  STA !reg_vmadd                            ; $00C940 |
  SEP #$20                                  ; $00C943 |
  LDA $6128                                 ; $00C945 |
  STA $F7                                   ; $00C948 |
  LDA $612B                                 ; $00C94A |
  STA $F8                                   ; $00C94D |
  STY $FA                                   ; $00C94F |
  STX $00                                   ; $00C951 |
  LDA $612C                                 ; $00C953 |
  STA $F7                                   ; $00C956 |
  LDA $612F                                 ; $00C958 |
  STA $F8                                   ; $00C95B |
  STY $FA                                   ; $00C95D |
  STX $00                                   ; $00C95F |
  LDA $6130                                 ; $00C961 |
  STA $F7                                   ; $00C964 |
  LDA $6133                                 ; $00C966 |
  STA $F8                                   ; $00C969 |
  STY $FA                                   ; $00C96B |
  STX $00                                   ; $00C96D |
  LDA $6134                                 ; $00C96F |
  STA $F7                                   ; $00C972 |
  LDA $6137                                 ; $00C974 |
  STA $F8                                   ; $00C977 |
  STY $FA                                   ; $00C979 |
  STX $00                                   ; $00C97B |
  LDA $6138                                 ; $00C97D |
  STA $F7                                   ; $00C980 |
  LDA $613B                                 ; $00C982 |
  STA $F8                                   ; $00C985 |
  STY $FA                                   ; $00C987 |
  STX $00                                   ; $00C989 |
  LDA $613C                                 ; $00C98B |
  STA $F7                                   ; $00C98E |
  LDA $613F                                 ; $00C990 |
  STA $F8                                   ; $00C993 |
  STY $FA                                   ; $00C995 |
  STX $00                                   ; $00C997 |
  LDA $6140                                 ; $00C999 |
  STA $F7                                   ; $00C99C |
  LDA $6143                                 ; $00C99E |
  STA $F8                                   ; $00C9A1 |
  STY $FA                                   ; $00C9A3 |
  STX $00                                   ; $00C9A5 |
  LDA $6144                                 ; $00C9A7 |
  STA $F7                                   ; $00C9AA |
  LDA $6147                                 ; $00C9AC |
  STA $F8                                   ; $00C9AF |
  STY $FA                                   ; $00C9B1 |
  STX $00                                   ; $00C9B3 |
  REP #$20                                  ; $00C9B5 |
  STZ $0B85                                 ; $00C9B7 |

CODE_00C9BA:
  PLD                                       ; $00C9BA |
  SEP #$20                                  ; $00C9BB |
  JSR CODE_00E507                           ; $00C9BD |
  LDA $39                                   ; $00C9C0 |
  STA !reg_bg1hofs                          ; $00C9C2 |
  LDA $3A                                   ; $00C9C5 |
  STA !reg_bg1hofs                          ; $00C9C7 |
  LDA $3B                                   ; $00C9CA |
  STA !reg_bg1vofs                          ; $00C9CC |
  LDA $3C                                   ; $00C9CF |
  STA !reg_bg1vofs                          ; $00C9D1 |
  LDA $3D                                   ; $00C9D4 |
  STA !reg_bg2hofs                          ; $00C9D6 |
  LDA $3E                                   ; $00C9D9 |
  STA !reg_bg2hofs                          ; $00C9DB |
  LDA $3F                                   ; $00C9DE |
  STA !reg_bg2vofs                          ; $00C9E0 |
  LDA $40                                   ; $00C9E3 |
  STA !reg_bg2vofs                          ; $00C9E5 |
  LDA $41                                   ; $00C9E8 |
  STA !reg_bg3hofs                          ; $00C9EA |
  LDA $42                                   ; $00C9ED |
  STA !reg_bg3hofs                          ; $00C9EF |
  LDA $43                                   ; $00C9F2 |
  STA !reg_bg3vofs                          ; $00C9F4 |
  LDA $44                                   ; $00C9F7 |
  STA !reg_bg3vofs                          ; $00C9F9 |
  LDA $45                                   ; $00C9FC |
  STA !reg_bg4hofs                          ; $00C9FE |
  LDA $46                                   ; $00CA01 |
  STA !reg_bg4hofs                          ; $00CA03 |
  LDA $47                                   ; $00CA06 |
  STA !reg_bg4vofs                          ; $00CA08 |
  LDA $48                                   ; $00CA0B |
  STA !reg_bg4vofs                          ; $00CA0D |

CODE_00CA10:
  LDA !r_reg_obsel_mirror                   ; $00CA10 |
  STA !reg_obsel                            ; $00CA13 |
  LDA !r_reg_bg1sc_mirror                   ; $00CA16 |
  STA !reg_bg1sc                            ; $00CA19 |
  LDA !r_reg_bg2sc_mirror                   ; $00CA1C |
  STA !reg_bg2sc                            ; $00CA1F |
  LDA !r_reg_cgwsel_mirror                  ; $00CA22 |
  STA !reg_cgwsel                           ; $00CA25 |
  LDA !r_reg_cgadsub_mirror                 ; $00CA28 |
  STA !reg_cgadsub                          ; $00CA2B |
  LDA !r_reg_mosaic_mirror                  ; $00CA2E |
  STA !reg_mosaic                           ; $00CA31 |
  REP #$20                                  ; $00CA34 |
  LDA $1407                                 ; $00CA36 |
  STA $7E5B99                               ; $00CA39 |
  STA $7E5B9C                               ; $00CA3D |
  LDA #$4300                                ; $00CA41 |
  TCD                                       ; $00CA44 |
  LDA $12                                   ; $00CA45 |
  STA $18                                   ; $00CA47 |
  LDA $22                                   ; $00CA49 |
  STA $28                                   ; $00CA4B |
  LDA $32                                   ; $00CA4D |
  STA $38                                   ; $00CA4F |
  LDA $42                                   ; $00CA51 |
  STA $48                                   ; $00CA53 |
  LDA $52                                   ; $00CA55 |
  STA $58                                   ; $00CA57 |
  LDA $62                                   ; $00CA59 |
  STA $68                                   ; $00CA5B |
  LDA $72                                   ; $00CA5D |
  STA $78                                   ; $00CA5F |
  SEP #$20                                  ; $00CA61 |
  LDA #$01                                  ; $00CA63 |
  STA $1A                                   ; $00CA65 |
  STA $2A                                   ; $00CA67 |
  STA $3A                                   ; $00CA69 |
  STA $4A                                   ; $00CA6B |
  STA $5A                                   ; $00CA6D |
  STA $6A                                   ; $00CA6F |
  STA $7A                                   ; $00CA71 |
  STZ !r_irq_count                          ; $00CA73 |
  LDA #$50                                  ; $00CA76 |
  STA !reg_htimel                           ; $00CA78 |
  LDA #$0C                                  ; $00CA7B |
  JMP set_v_irq                             ; $00CA7D |

; vram address stuff?
  dw $2000, $2000, $1000, $3000             ; $00CA80 |
  dw $0000, $4000                           ; $00CA88 |

  dw $96DE, $56DE, $76DE, $76DE             ; $00CA8C |
  dw $56DE, $96DE                           ; $00CA94 |

  db $50, $52                               ; $00CA98 |

CODE_00CA9A:
  BIT !reg_hvbjoy                           ; $00CA9A |
  BVS CODE_00CA9A                           ; $00CA9D |

CODE_00CA9F:
  BIT !reg_hvbjoy                           ; $00CA9F |
  BVC CODE_00CA9F                           ; $00CAA2 |
  LDA #$8F                                  ; $00CAA4 |
  STA !reg_inidisp                          ; $00CAA6 |
  JSR CODE_00D4C3                           ; $00CAA9 |
  LDA $0069                                 ; $00CAAC |
  BEQ CODE_00CAF7                           ; $00CAAF |
  ASL A                                     ; $00CAB1 |
  ORA $006D                                 ; $00CAB2 |
  ASL A                                     ; $00CAB5 |
  TAX                                       ; $00CAB6 |
  REP #$20                                  ; $00CAB7 |
  LDY #$80                                  ; $00CAB9 |
  STY !reg_vmain                            ; $00CABB |
  LDA $7ECA7C,x                             ; $00CABE |
  STA !reg_vmadd                            ; $00CAC2 |
  LDA #$1801                                ; $00CAC5 |
  STA $4300                                 ; $00CAC8 |
  LDA $7ECA88,x                             ; $00CACB |
  STA $4302                                 ; $00CACF |
  LDA #$2000                                ; $00CAD2 |
  STA $4305                                 ; $00CAD5 |
  LDY #$7F                                  ; $00CAD8 |
  STY $4304                                 ; $00CADA |
  LDY #$01                                  ; $00CADD |
  STY !reg_mdmaen                           ; $00CADF |
  SEP #$20                                  ; $00CAE2 |
  DEC $0069                                 ; $00CAE4 |
  BNE CODE_00CAFC                           ; $00CAE7 |
  LDX $6D                                   ; $00CAE9 |
  LDA $7ECA98,x                             ; $00CAEB |
  STA !reg_bg12nba                          ; $00CAEF |
  TXA                                       ; $00CAF2 |
  EOR #$01                                  ; $00CAF3 |
  STA $6D                                   ; $00CAF5 |

CODE_00CAF7:
  LDA !r_game_loop_complete                 ; $00CAF7 |
  BNE CODE_00CB14                           ; $00CAFA |

CODE_00CAFC:
  BIT !reg_hvbjoy                           ; $00CAFC |
  BVS CODE_00CAFC                           ; $00CAFF |

CODE_00CB01:
  BIT !reg_hvbjoy                           ; $00CB01 |
  BVC CODE_00CB01                           ; $00CB04 |
  LDA !r_reg_inidisp_mirror                 ; $00CB06 |
  STA !reg_inidisp                          ; $00CB09 |
  LDA #$B1                                  ; $00CB0C |
  STA !reg_nmitimen                         ; $00CB0E |
  JMP CODE_00CB97                           ; $00CB11 |

CODE_00CB14:
  STZ !r_game_loop_complete                 ; $00CB14 |
  REP #$20                                  ; $00CB17 |
  LDA #$420B                                ; $00CB19 |
  TCD                                       ; $00CB1C |
  LDX #$06                                  ; $00CB1D |

CODE_00CB1F:
  LDA $0B93,x                               ; $00CB1F |
  STA $7017C2,x                             ; $00CB22 |
  LDA $0B9B,x                               ; $00CB26 |
  STA $7017E2,x                             ; $00CB29 |
  DEX                                       ; $00CB2D |
  DEX                                       ; $00CB2E |
  BPL CODE_00CB1F                           ; $00CB2F |
  LDX #$01                                  ; $00CB31 |
  JSR CODE_00D52B                           ; $00CB33 |
  LDA $0BD3                                 ; $00CB36 |
  BEQ CODE_00CB5B                           ; $00CB39 |
  LDA $0BD5                                 ; $00CB3B |
  STA !reg_vmadd                            ; $00CB3E |
  LDA #$1801                                ; $00CB41 |
  STA $F5                                   ; $00CB44 |
  LDA #$1C00                                ; $00CB46 |
  STA $F7                                   ; $00CB49 |
  LDY #$70                                  ; $00CB4B |
  STY $F9                                   ; $00CB4D |
  LDA $0BD7                                 ; $00CB4F |
  STA $FA                                   ; $00CB52 |
  LDY #$01                                  ; $00CB54 |
  STY $00                                   ; $00CB56 |
  STZ $0BD3                                 ; $00CB58 |

CODE_00CB5B:
  LDA #$0000                                ; $00CB5B |
  TCD                                       ; $00CB5E |
  SEP #$20                                  ; $00CB5F |
  JSR CODE_00E507                           ; $00CB61 |
  LDA !r_reg_inidisp_mirror                 ; $00CB64 |
  STA !reg_inidisp                          ; $00CB67 |
  LDA #$B1                                  ; $00CB6A |
  STA !reg_nmitimen                         ; $00CB6C |
  LDA !r_player_jump_state                  ; $00CB6F |
  BEQ CODE_00CB97                           ; $00CB72 |
  STZ !r_player_jump_state                  ; $00CB74 |
  STA $0069                                 ; $00CB77 |
  REP #$20                                  ; $00CB7A |
  LDA #$56DE                                ; $00CB7C |
  STA $20                                   ; $00CB7F |
  LDY #$7F                                  ; $00CB81 |
  STY $22                                   ; $00CB83 |
  LDA #$1C00                                ; $00CB85 |
  STA $23                                   ; $00CB88 |
  LDY #$70                                  ; $00CB8A |
  STY $25                                   ; $00CB8C |
  LDA #$6000                                ; $00CB8E |
  JSL dma_wram_gen_purpose                  ; $00CB91 |
  SEP #$20                                  ; $00CB95 |

CODE_00CB97:
  REP #$20                                  ; $00CB97 |
  LDA $00                                   ; $00CB99 |
  PHA                                       ; $00CB9B |
  LDX $0B8F                                 ; $00CB9C |
  LDA $0B93                                 ; $00CB9F |
  CLC                                       ; $00CBA2 |
  ADC $7ECC58,x                             ; $00CBA3 |
  BMI CODE_00CBB5                           ; $00CBA7 |
  STA $0B93                                 ; $00CBA9 |
  STA $0B97                                 ; $00CBAC |
  STA $0B9D                                 ; $00CBAF |
  STA $0B9F                                 ; $00CBB2 |

CODE_00CBB5:
  LDX #$00                                  ; $00CBB5 |
  LDA #$F080                                ; $00CBB7 |

CODE_00CBBA:
  STA $096D,x                               ; $00CBBA |
  STZ $096F,x                               ; $00CBBD |
  STA $0A6D,x                               ; $00CBC0 |
  STZ $0A6F,x                               ; $00CBC3 |
  DEX                                       ; $00CBC6 |
  DEX                                       ; $00CBC7 |
  DEX                                       ; $00CBC8 |
  DEX                                       ; $00CBC9 |
  BNE CODE_00CBBA                           ; $00CBCA |
  LDA $0B8D                                 ; $00CBCC |
  ASL A                                     ; $00CBCF |
  TAX                                       ; $00CBD0 |
  LDA $7ED2C2,x                             ; $00CBD1 |
  STA $00                                   ; $00CBD5 |
  LDA #$007E                                ; $00CBD7 |
  STA $02                                   ; $00CBDA |
  REP #$10                                  ; $00CBDC |
  LDX #$0000                                ; $00CBDE |
  TXY                                       ; $00CBE1 |

CODE_00CBE2:
  REP #$20                                  ; $00CBE2 |
  LDA [$00],y                               ; $00CBE4 |
  STA $0A                                   ; $00CBE6 |
  INY                                       ; $00CBE8 |
  INY                                       ; $00CBE9 |
  SEP #$20                                  ; $00CBEA |

CODE_00CBEC:
  LDA [$00],y                               ; $00CBEC |
  CMP #$FF                                  ; $00CBEE |
  BEQ CODE_00CC31                           ; $00CBF0 |
  PHA                                       ; $00CBF2 |
  AND #$EF                                  ; $00CBF3 |
  STA $096F,x                               ; $00CBF5 |
  ORA #$10                                  ; $00CBF8 |
  STA $0973,x                               ; $00CBFA |
  PLA                                       ; $00CBFD |
  AND #$10                                  ; $00CBFE |
  LSR A                                     ; $00CC00 |
  LSR A                                     ; $00CC01 |
  LSR A                                     ; $00CC02 |
  ORA #$3D                                  ; $00CC03 |
  STA $0970,x                               ; $00CC05 |
  STA $0974,x                               ; $00CC08 |
  LDA $0A                                   ; $00CC0B |
  STA $096D,x                               ; $00CC0D |
  STA $0971,x                               ; $00CC10 |
  INY                                       ; $00CC13 |
  CLC                                       ; $00CC14 |
  ADC [$00],y                               ; $00CC15 |
  STA $0A                                   ; $00CC17 |
  LDA $0B                                   ; $00CC19 |
  STA $096E,x                               ; $00CC1B |
  CLC                                       ; $00CC1E |
  ADC #$08                                  ; $00CC1F |
  STA $0972,x                               ; $00CC21 |
  REP #$20                                  ; $00CC24 |
  TXA                                       ; $00CC26 |
  CLC                                       ; $00CC27 |
  ADC #$0008                                ; $00CC28 |
  TAX                                       ; $00CC2B |
  INY                                       ; $00CC2C |
  SEP #$20                                  ; $00CC2D |
  BRA CODE_00CBEC                           ; $00CC2F |

CODE_00CC31:
  INY                                       ; $00CC31 |
  LDA [$00],y                               ; $00CC32 |
  BEQ CODE_00CC50                           ; $00CC34 |
  INY                                       ; $00CC36 |
  DEC A                                     ; $00CC37 |
  BEQ CODE_00CBE2                           ; $00CC38 |
  DEC A                                     ; $00CC3A |
  BEQ CODE_00CC46                           ; $00CC3B |
  LDA $0A                                   ; $00CC3D |
  CLC                                       ; $00CC3F |
  ADC #$08                                  ; $00CC40 |
  STA $0A                                   ; $00CC42 |
  BRA CODE_00CBEC                           ; $00CC44 |

CODE_00CC46:
  LDA [$00],y                               ; $00CC46 |
  CLC                                       ; $00CC48 |
  ADC $0B                                   ; $00CC49 |
  STA $0B                                   ; $00CC4B |
  INY                                       ; $00CC4D |
  BRA CODE_00CBEC                           ; $00CC4E |

CODE_00CC50:
  REP #$20                                  ; $00CC50 |
  PLA                                       ; $00CC52 |
  STA $00                                   ; $00CC53 |
  SEP #$30                                  ; $00CC55 |
  RTS                                       ; $00CC57 |

  db $BE, $F7, $42, $08                     ; $00CC58 |

; credits text
  dw $A857, $08DA, $08B5, $0498             ; $00CC5C |
  dw $07B9, $077C, $087A, $08BB             ; $00CC64 |
  dw $089E, $07B9, $08BA, $085C             ; $00CC6C |
  dw $00FF, $A449, $08F5, $0878             ; $00CC74 |
  dw $089A, $0878, $08BA, $087F             ; $00CC7C |
  dw $0C98, $08F5, $077C, $08D9             ; $00CC84 |
  dw $08BC, $089A, $0878, $01FF             ; $00CC8C |
  dw $B443, $08F5, $089E, $08BA             ; $00CC94 |
  dw $087F, $0498, $087F, $0498             ; $00CC9C |
  dw $089A, $109E, $08D7, $0878             ; $00CCA4 |
  dw $089A, $0878, $087E, $089E             ; $00CCAC |
  dw $00FF, $A449, $08F4, $087F             ; $00CCB4 |
  dw $0498, $087E, $077C, $077D             ; $00CCBC |
  dw $08BC, $089C, $0C98, $08D1             ; $00CCC4 |
  dw $0498, $089D, $089E, $01FF             ; $00CCCC |
  dw $B450, $08D1, $0498, $087B             ; $00CCD4 |
  dw $077C, $089A, $0C98, $08D4             ; $00CCDC |
  dw $089E, $089D, $089D, $089E             ; $00CCE4 |
  dw $00FF, $A849, $08DA, $08F1             ; $00CCEC |
  dw $07B9, $089E, $087E, $07B9             ; $00CCF4 |
  dw $0878, $089C, $089C, $077C             ; $00CCFC |
  dw $07B9, $08BA, $085C, $00FF             ; $00CD04 |
  dw $A44A, $08F5, $089E, $08BA             ; $00CD0C |
  dw $087F, $0498, $109E, $06D2             ; $00CD14 |
  dw $08BE, $0878, $08BE, $0878             ; $00CD1C |
  dw $089A, $0898, $01FF, $B45A             ; $00CD24 |
  dw $08D6, $0878, $08BA, $0878             ; $00CD2C |
  dw $07B9, $10BC, $08D7, $0498             ; $00CD34 |
  dw $0498, $00FF, $A452, $08D4             ; $00CD3C |
  dw $0498, $08D8, $089E, $08BA             ; $00CD44 |
  dw $087F, $1098, $08D4, $089E             ; $00CD4C |
  dw $087B, $0878, $01FF, $B442             ; $00CD54 |
  dw $08F4, $0878, $08BB, $089E             ; $00CD5C |
  dw $07B9, $10BC, $08F5, $0878             ; $00CD64 |
  dw $089A, $0878, $087F, $0878             ; $00CD6C |
  dw $08BB, $0878, $00FF, $A449             ; $00CD74 |
  dw $08D4, $0878, $08D9, $08BC             ; $00CD7C |
  dw $0878, $089A, $0C98, $08D6             ; $00CD84 |
  dw $089E, $07B9, $0498, $08BB             ; $00CD8C |
  dw $0878, $01FF, $B443, $081A             ; $00CD94 |
  dw $08BC, $0498, $087A, $087F             ; $00CD9C |
  dw $0C98, $081A, $0878, $089C             ; $00CDA4 |
  dw $0878, $089C, $089E, $08BB             ; $00CDAC |
  dw $089E, $00FF, $A438, $08F4             ; $00CDB4 |
  dw $087F, $0498, $087E, $077C             ; $00CDBC |
  dw $087F, $0498, $07B9, $109E             ; $00CDC4 |
  dw $08D4, $0878, $08BA, $0878             ; $00CDCC |
  dw $089C, $0878, $08BB, $08BA             ; $00CDD4 |
  dw $08BC, $01FF, $B449, $08F4             ; $00CDDC |
  dw $087F, $0498, $087E, $077C             ; $00CDE4 |
  dw $089A, $0C98, $081A, $089E             ; $00CDEC |
  dw $08BA, $087F, $0498, $087B             ; $00CDF4 |
  dw $0878, $00FF, $A440, $081A             ; $00CDFC |
  dw $0878, $08BA, $08BC, $089D             ; $00CE04 |
  dw $089E, $07B9, $0C98, $08F5             ; $00CE0C |
  dw $0878, $089A, $077C, $08BB             ; $00CE14 |
  dw $0878, $089D, $0498, $00FF             ; $00CE1C |
  dw $A83D, $08DA, $08B4, $089E             ; $00CE24 |
  dw $08BC, $07B9, $08BA, $0F7C             ; $00CE2C |
  dw $08B5, $077C, $08BA, $0498             ; $00CE34 |
  dw $087E, $089D, $077C, $07B9             ; $00CE3C |
  dw $08BA, $085C, $00FF, $A43E             ; $00CE44 |
  dw $081A, $0878, $08BA, $08BC             ; $00CE4C |
  dw $087F, $0498, $08BA, $1078             ; $00CE54 |
  dw $081A, $0878, $089C, $0878             ; $00CE5C |
  dw $089C, $08BC, $07B9, $0878             ; $00CE64 |
  dw $01FF, $B45A, $08D4, $077C             ; $00CE6C |
  dw $089D, $08BB, $1078, $08F6             ; $00CE74 |
  dw $08BA, $08BC, $0498, $00FF             ; $00CE7C |
  dw $A442, $081A, $089E, $08BA             ; $00CE84 |
  dw $087F, $0498, $087F, $0498             ; $00CE8C |
  dw $07B9, $109E, $08D7, $089E             ; $00CE94 |
  dw $089C, $089E, $08BB, $089E             ; $00CE9C |
  dw $01FF, $B460, $07B6, $0498             ; $00CEA4 |
  dw $0799, $0C98, $08D7, $089E             ; $00CEAC |
  dw $08BB, $089E, $00FF, $A83F             ; $00CEB4 |
  dw $08DA, $08F4, $089E, $08BC             ; $00CEBC |
  dw $089D, $107B, $08B4, $089E             ; $00CEC4 |
  dw $089C, $089F, $089E, $08BA             ; $00CECC |
  dw $077C, $07B9, $085C, $00FF             ; $00CED4 |
  dw $A45A, $08D4, $089E, $0799             ; $00CEDC |
  dw $0C98, $08D4, $089E, $089D             ; $00CEE4 |
  dw $087B, $089E, $00FF, $A830             ; $00CEEC |
  dw $08DA, $08B4, $087F, $0878             ; $00CEF4 |
  dw $07B9, $0878, $087A, $08BB             ; $00CEFC |
  dw $077C, $0FB9, $08B5, $077C             ; $00CF04 |
  dw $08BA, $0498, $087E, $089D             ; $00CF0C |
  dw $077C, $07B9, $08BA, $085C             ; $00CF14 |
  dw $00FF, $A44E, $08F4, $087F             ; $00CF1C |
  dw $0498, $087E, $077C, $077D             ; $00CF24 |
  dw $08BC, $089C, $0C98, $08D1             ; $00CF2C |
  dw $0498, $089D, $089E, $01FF             ; $00CF34 |
  dw $B44C, $08D1, $0498, $08BA             ; $00CF3C |
  dw $0878, $08BA, $087F, $0C98             ; $00CF44 |
  dw $08D7, $089E, $087E, $0878             ; $00CF4C |
  dw $089C, $0498, $00FF, $A44A             ; $00CF54 |
  dw $08D6, $0878, $08BA, $0878             ; $00CF5C |
  dw $087F, $0498, $07B9, $109E             ; $00CF64 |
  dw $06D2, $0498, $089C, $08BC             ; $00CF6C |
  dw $07B9, $0878, $01FF, $B445             ; $00CF74 |
  dw $08F5, $089E, $089C, $089E             ; $00CF7C |
  dw $0878, $089A, $0C98, $08D4             ; $00CF84 |
  dw $08BC, $07B9, $089E, $08BC             ; $00CF8C |
  dw $089C, $077C, $00FF, $A84B             ; $00CF94 |
  dw $08DA, $08B4, $08DB, $08D0             ; $00CF9C |
  dw $08DB, $08B5, $077C, $08BA             ; $00CFA4 |
  dw $0498, $087E, $089D, $077C             ; $00CFAC |
  dw $07B9, $085C, $00FF, $A448             ; $00CFB4 |
  dw $081A, $089E, $08BA, $087F             ; $00CFBC |
  dw $0498, $0878, $089A, $0C98             ; $00CFC4 |
  dw $08D4, $089E, $0498, $08D9             ; $00CFCC |
  dw $08BC, $089C, $0498, $00FF             ; $00CFD4 |
  dw $A838, $08DA, $08F4, $089F             ; $00CFDC |
  dw $077C, $087A, $0498, $0878             ; $00CFE4 |
  dw $0C9B, $08F5, $087F, $0878             ; $00CFEC |
  dw $089D, $089A, $10BA, $08F5             ; $00CFF4 |
  dw $089E, $085C, $00FF, $A443             ; $00CFFC |
  dw $0818, $0878, $08BB, $0878             ; $00D004 |
  dw $07B9, $10BC, $081A, $0878             ; $00D00C |
  dw $089C, $0878, $087E, $08BC             ; $00D014 |
  dw $087A, $087F, $0498, $01FF             ; $00D01C |
  dw $B445, $081A, $089E, $08BA             ; $00D024 |
  dw $087F, $0498, $089A, $0C98             ; $00D02C |
  dw $08D1, $0878, $07B9, $08BC             ; $00D034 |
  dw $087F, $0878, $089D, $0878             ; $00D03C |
  dw $00FF, $A450, $081A, $089E             ; $00D044 |
  dw $0498, $087A, $087F, $0C98             ; $00D04C |
  dw $08D4, $089E, $08BB, $0878             ; $00D054 |
  dw $0879, $077C, $01FF, $B44B             ; $00D05C |
  dw $081A, $0878, $08BA, $08BC             ; $00D064 |
  dw $087F, $0498, $07B9, $109E             ; $00D06C |
  dw $08F4, $0878, $089A, $0878             ; $00D074 |
  dw $0498, $00FF, $A44B, $08D1             ; $00D07C |
  dw $0498, $07B9, $089E, $089D             ; $00D084 |
  dw $089E, $0879, $10BC, $08D4             ; $00D08C |
  dw $0878, $089A, $08BC, $0498             ; $00D094 |
  dw $01FF, $B440, $08F4, $087F             ; $00D09C |
  dw $0498, $087E, $077C, $089A             ; $00D0A4 |
  dw $0C98, $081A, $0878, $089C             ; $00D0AC |
  dw $0878, $08BA, $087F, $0498             ; $00D0B4 |
  dw $07B9, $089E, $00FF, $A44C             ; $00D0BC |
  dw $08D4, $0498, $089C, $0498             ; $00D0C4 |
  dw $08D8, $089E, $08BA, $087F             ; $00D0CC |
  dw $0C98, $07B7, $08BC, $089A             ; $00D0D4 |
  dw $08BC, $0498, $01FF, $B45B             ; $00D0DC |
  dw $08D4, $077C, $0498, $08D9             ; $00D0E4 |
  dw $109E, $08D4, $0878, $08BB             ; $00D0EC |
  dw $089E, $00FF, $A449, $08F4             ; $00D0F4 |
  dw $089E, $0498, $087A, $087F             ; $00D0FC |
  dw $0498, $07B9, $109E, $08F5             ; $00D104 |
  dw $089E, $089C, $0498, $08BB             ; $00D10C |
  dw $0878, $01FF, $B44F, $08D6             ; $00D114 |
  dw $0498, $0F7C, $081A, $089E             ; $00D11C |
  dw $08BA, $087F, $0498, $089C             ; $00D124 |
  dw $08BC, $07B9, $0878, $00FF             ; $00D12C |
  dw $A449, $08D4, $077C, $089D             ; $00D134 |
  dw $08BA, $08BC, $089A, $0F7C             ; $00D13C |
  dw $08F5, $0878, $089D, $0878             ; $00D144 |
  dw $0879, $077C, $01FF, $B445             ; $00D14C |
  dw $08F5, $077C, $08BB, $08BA             ; $00D154 |
  dw $10BC, $08D1, $0878, $08BA             ; $00D15C |
  dw $087F, $0498, $089C, $089E             ; $00D164 |
  dw $08BB, $089E, $00FF, $A451             ; $00D16C |
  dw $08B5, $077C, $07B9, $077C             ; $00D174 |
  dw $0F9A, $0818, $087F, $0498             ; $00D17C |
  dw $089F, $089F, $049B, $077C             ; $00D184 |
  dw $01FF, $B457, $08D1, $0498             ; $00D18C |
  dw $07B9, $109E, $081A, $0878             ; $00D194 |
  dw $089C, $0878, $087B, $0878             ; $00D19C |
  dw $00FF, $A858, $08DA, $08F1             ; $00D1A4 |
  dw $07B9, $089E, $087B, $08BC             ; $00D1AC |
  dw $087A, $077C, $07B9, $085C             ; $00D1B4 |
  dw $00FF, $A443, $08F4, $087F             ; $00D1BC |
  dw $0498, $087E, $077C, $07B9             ; $00D1C4 |
  dw $10BC, $08D6, $0498, $08D8             ; $00D1CC |
  dw $0878, $089C, $089E, $08BB             ; $00D1D4 |
  dw $089E, $00FF, $A834, $08DA             ; $00D1DC |
  dw $07B6, $08BF, $077C, $087A             ; $00D1E4 |
  dw $08BC, $08BB, $0498, $08BD             ; $00D1EC |
  dw $0F7C, $08F1, $07B9, $089E             ; $00D1F4 |
  dw $087B, $08BC, $087A, $077C             ; $00D1FC |
  dw $07B9, $085C, $00FF, $A446             ; $00D204 |
  dw $08D1, $0498, $07B9, $089E             ; $00D20C |
  dw $08BA, $087F, $0C98, $081A             ; $00D214 |
  dw $0878, $089C, $0878, $08BC             ; $00D21C |
  dw $087A, $087F, $0498, $00FF             ; $00D224 |
  dw $A41E, $07D5, $089E, $089E             ; $00D22C |
  dw $089A, $10BA, $049B, $0498             ; $00D234 |
  dw $089A, $0F7C, $08BB, $087F             ; $00D23C |
  dw $077C, $10D8, $087F, $0878             ; $00D244 |
  dw $08BD, $0F7C, $0878, $07B9             ; $00D24C |
  dw $07B9, $0498, $08BD, $077C             ; $00D254 |
  dw $087B, $01FF, $B424, $08BE             ; $00D25C |
  dw $087F, $077C, $07B9, $0F7C             ; $00D264 |
  dw $089C, $089E, $109C, $0878             ; $00D26C |
  dw $089D, $107B, $087B, $0878             ; $00D274 |
  dw $107B, $049B, $0498, $08BD             ; $00D27C |
  dw $077C, $08DB, $08DB, $08DB             ; $00D284 |
  dw $08DB, $00FF, $A442, $08D1             ; $00D28C |
  dw $077C, $07B9, $089E, $077C             ; $00D294 |
  dw $10BA, $0878, $07B9, $0F7C             ; $00D29C |
  dw $0879, $089E, $07B9, $089D             ; $00D2A4 |
  dw $081F, $081F, $00FF, $A462             ; $00D2AC |
  dw $08F5, $08D1, $0FB6, $07B6             ; $00D2B4 |
  dw $08D7, $08B5, $00FF                    ; $00D2BC |

; credits text pointers
  dw $CC5C, $CC5C, $CC76, $CCB6             ; $00D2C2 |
  dw $CCEE, $CD0C, $CD40, $CD7A             ; $00D2CA |
  dw $CDB8, $CE00, $CE24, $CE4A             ; $00D2D2 |
  dw $CE84, $CEBA, $CEDC, $CEF2             ; $00D2DA |
  dw $CF1E, $CF5A, $CF9A, $CFBA             ; $00D2E2 |
  dw $CFDC, $D002, $D046, $D080             ; $00D2EA |
  dw $D0C2, $D0F8, $D134, $D172             ; $00D2F2 |
  dw $D1A6, $D1BE, $D1E0, $D20A             ; $00D2FA |
  dw $D22C, $D290, $D2B2                    ; $00D302 |

  LDA !r_irq_count                          ; $00D308 |
  BNE CODE_00D329                           ; $00D30B |

CODE_00D30D:
  BIT !reg_hvbjoy                           ; $00D30D |
  BVS CODE_00D30D                           ; $00D310 |

CODE_00D312:
  BIT !reg_hvbjoy                           ; $00D312 |
  BVC CODE_00D312                           ; $00D315 |
  LDA !r_reg_hdmaen_mirror                  ; $00D317 |
  STA !reg_hdmaen                           ; $00D31A |
  STZ !reg_inidisp                          ; $00D31D |
  LDA #$50                                  ; $00D320 |
  STA !reg_htimel                           ; $00D322 |
  LDA #$08                                  ; $00D325 |
  BRA CODE_00D343                           ; $00D327 |

CODE_00D329:
  DEC A                                     ; $00D329 |
  BNE CODE_00D34F                           ; $00D32A |

CODE_00D32C:
  BIT !reg_hvbjoy                           ; $00D32C |
  BVS CODE_00D32C                           ; $00D32F |

CODE_00D331:
  BIT !reg_hvbjoy                           ; $00D331 |
  BVC CODE_00D331                           ; $00D334 |
  LDA !r_reg_inidisp_mirror                 ; $00D336 |
  STA !reg_inidisp                          ; $00D339 |
  LDA #$50                                  ; $00D33C |
  STA !reg_htimel                           ; $00D33E |
  LDA #$D8                                  ; $00D341 |

CODE_00D343:
  INC !r_irq_count                          ; $00D343 |

CODE_00D346:
  STA !reg_vtimel                           ; $00D346 |
  LDA #$B1                                  ; $00D349 |
  STA !reg_nmitimen                         ; $00D34B |
  RTS                                       ; $00D34E |

CODE_00D34F:
  BIT !reg_hvbjoy                           ; $00D34F |
  BVS CODE_00D34F                           ; $00D352 |

CODE_00D354:
  BIT !reg_hvbjoy                           ; $00D354 |
  BVC CODE_00D354                           ; $00D357 |
  LDY #$8F                                  ; $00D359 |
  STY !reg_inidisp                          ; $00D35B |
  STZ !reg_hdmaen                           ; $00D35E |
  LDA !r_game_loop_complete                 ; $00D361 |
  BNE CODE_00D369                           ; $00D364 |
  JMP CODE_00D46B                           ; $00D366 |

CODE_00D369:
  STZ !r_game_loop_complete                 ; $00D369 |
  JSR process_vram_dma_queue                ; $00D36C | bonus
  JSR prepare_tilemap_dma_queue             ; $00D36F |
  REP #$20                                  ; $00D372 |
  PHD                                       ; $00D374 |
  LDA #$420B                                ; $00D375 |
  TCD                                       ; $00D378 |
  LDX #$01                                  ; $00D379 |
  JSR CODE_00DE0C                           ; $00D37B |
  JSR CODE_00D4AC                           ; $00D37E |
  JSR CODE_00D4E5                           ; $00D381 |
  LDY #$80                                  ; $00D384 |
  STY !reg_vmain                            ; $00D386 |
  LDA #$1801                                ; $00D389 |
  STA $F5                                   ; $00D38C |
  JSR CODE_00DCAE                           ; $00D38E |
  LDY $0D15                                 ; $00D391 |
  BEQ CODE_00D39E                           ; $00D394 |
  JSR CODE_00DC97                           ; $00D396 |
  STZ $0D15                                 ; $00D399 |
  BRA CODE_00D3A1                           ; $00D39C |

CODE_00D39E:
  JSR CODE_00DC6B                           ; $00D39E |

CODE_00D3A1:
  LDA !r_game_mode                          ; $00D3A1 |
  CMP #$0030                                ; $00D3A4 |
  BNE CODE_00D3C3                           ; $00D3A7 |
  LDA !r_reg_hdmaen_mirror                  ; $00D3A9 |
  AND #$0020                                ; $00D3AC |
  BEQ CODE_00D3C0                           ; $00D3AF |
  LDA $10E0                                 ; $00D3B1 |
  STA $7E5040                               ; $00D3B4 |
  EOR #$FFFF                                ; $00D3B8 |
  INC A                                     ; $00D3BB |
  STA $7E5042                               ; $00D3BC |

CODE_00D3C0:
  JSR CODE_00DBA9                           ; $00D3C0 |

CODE_00D3C3:
  PLD                                       ; $00D3C3 |
  SEP #$20                                  ; $00D3C4 |
  LDA $39                                   ; $00D3C6 |
  STA !reg_bg1hofs                          ; $00D3C8 |
  LDA $3A                                   ; $00D3CB |
  STA !reg_bg1hofs                          ; $00D3CD |
  LDA $3B                                   ; $00D3D0 |
  STA !reg_bg1vofs                          ; $00D3D2 |
  LDA $3C                                   ; $00D3D5 |
  STA !reg_bg1vofs                          ; $00D3D7 |
  LDA $3D                                   ; $00D3DA |
  STA !reg_bg2hofs                          ; $00D3DC |
  LDA $3E                                   ; $00D3DF |
  STA !reg_bg2hofs                          ; $00D3E1 |
  LDA $3F                                   ; $00D3E4 |
  STA !reg_bg2vofs                          ; $00D3E6 |
  LDA $40                                   ; $00D3E9 |
  STA !reg_bg2vofs                          ; $00D3EB |
  LDA $41                                   ; $00D3EE |
  STA !reg_bg3hofs                          ; $00D3F0 |
  LDA $42                                   ; $00D3F3 |
  STA !reg_bg3hofs                          ; $00D3F5 |
  LDA $43                                   ; $00D3F8 |
  STA !reg_bg3vofs                          ; $00D3FA |
  LDA $44                                   ; $00D3FD |
  STA !reg_bg3vofs                          ; $00D3FF |
  LDA !r_reg_tm_mirror                      ; $00D402 |
  STA !reg_tm                               ; $00D405 |
  LDA !r_reg_ts_mirror                      ; $00D408 |
  STA !reg_ts                               ; $00D40B |
  LDA !r_reg_tmw_mirror                     ; $00D40E |
  STA !reg_tmw                              ; $00D411 |
  LDA !r_reg_tsw_mirror                     ; $00D414 |
  STA !reg_tsw                              ; $00D417 |
  LDA !r_reg_bg12nba_mirror                 ; $00D41A |
  STA !reg_bg12nba                          ; $00D41D |
  LDA !r_reg_bg1sc_mirror                   ; $00D420 |
  STA !reg_bg1sc                            ; $00D423 |
  LDA !r_reg_bgmode_mirror                  ; $00D426 |
  STA !reg_bgmode                           ; $00D429 |
  LDA !r_reg_w12sel_mirror                  ; $00D42C |
  STA !reg_w12sel                           ; $00D42F |
  LDA !r_reg_w34sel_mirror                  ; $00D432 |
  STA !reg_w34sel                           ; $00D435 |
  LDA !r_reg_wobjsel_mirror                 ; $00D438 |
  STA !reg_wobjsel                          ; $00D43B |
  LDA !r_reg_cgwsel_mirror                  ; $00D43E |
  STA !reg_cgwsel                           ; $00D441 |
  LDA !r_reg_cgadsub_mirror                 ; $00D444 |
  STA !reg_cgadsub                          ; $00D447 |
  LDA !r_reg_wbglog_mirror                  ; $00D44A |
  STA !reg_wbglog                           ; $00D44D |
  LDA !r_reg_wobjlog_mirror                 ; $00D450 |
  STA !reg_wobjlog                          ; $00D453 |
  LDA !r_reg_bg2sc_mirror                   ; $00D456 |
  STA !reg_bg2sc                            ; $00D459 |
  LDA !r_reg_bg3sc_mirror                   ; $00D45C |
  STA !reg_bg3sc                            ; $00D45F |
  LDA !r_reg_mosaic_mirror                  ; $00D462 |
  STA !reg_mosaic                           ; $00D465 |
  JSR CODE_00E507                           ; $00D468 |

CODE_00D46B:
  REP #$20                                  ; $00D46B |
  LDA #$4300                                ; $00D46D |
  TCD                                       ; $00D470 |
  LDA $12                                   ; $00D471 |
  STA $18                                   ; $00D473 |
  LDA $22                                   ; $00D475 |
  STA $28                                   ; $00D477 |
  LDA $32                                   ; $00D479 |
  STA $38                                   ; $00D47B |
  LDA $42                                   ; $00D47D |
  STA $48                                   ; $00D47F |
  LDA $52                                   ; $00D481 |
  STA $58                                   ; $00D483 |
  LDA $62                                   ; $00D485 |
  STA $68                                   ; $00D487 |
  LDA $72                                   ; $00D489 |
  STA $78                                   ; $00D48B |
  SEP #$20                                  ; $00D48D |
  LDA #$01                                  ; $00D48F |
  STA $1A                                   ; $00D491 |
  STA $2A                                   ; $00D493 |
  STA $3A                                   ; $00D495 |
  STA $4A                                   ; $00D497 |
  STA $5A                                   ; $00D499 |
  STA $6A                                   ; $00D49B |
  STA $7A                                   ; $00D49D |
  STZ !r_irq_count                          ; $00D49F |
  LDA #$50                                  ; $00D4A2 |
  STA !reg_htimel                           ; $00D4A4 |
  LDA #$06                                  ; $00D4A7 |
  JMP CODE_00D346                           ; $00D4A9 |

; DMA OAM
CODE_00D4AC:
  STZ !reg_oamaddl                          ; $00D4AC |
  STZ $F5                                   ; $00D4AF |
  LDA #$0004                                ; $00D4B1 |
  STA $F6                                   ; $00D4B4 |
  LDA #$006A                                ; $00D4B6 |
  STA $F8                                   ; $00D4B9 |
  LDA #$0220                                ; $00D4BB |
  STA $FA                                   ; $00D4BE |
  STX $00                                   ; $00D4C0 |
  RTS                                       ; $00D4C2 |

CODE_00D4C3:
  REP #$20                                  ; $00D4C3 |
  STZ !reg_oamaddl                          ; $00D4C5 |
  STZ $4300                                 ; $00D4C8 |
  LDA #$6D04                                ; $00D4CB |
  STA $4301                                 ; $00D4CE |
  LDA #$0009                                ; $00D4D1 |
  STA $4303                                 ; $00D4D4 |
  LDA #$0220                                ; $00D4D7 |
  STA $4305                                 ; $00D4DA |
  LDX #$01                                  ; $00D4DD |
  STX !reg_mdmaen                           ; $00D4DF |
  SEP #$20                                  ; $00D4E2 |
  RTS                                       ; $00D4E4 |

; fixed color data
CODE_00D4E5:
  LDA !r_reg_coldata_mirror                 ; $00D4E5 |\
  AND #$001F                                ; $00D4E8 | | bits 0-4 of $0948
  ORA #$0020                                ; $00D4EB | | are red channel intensity
  TAY                                       ; $00D4EE | |
  STY !reg_coldata                          ; $00D4EF |/
  LDA !r_reg_coldata_mirror                 ; $00D4F2 |\
  LSR A                                     ; $00D4F5 | |
  LSR A                                     ; $00D4F6 | | bits 5-9 of $0948 (word)
  LSR A                                     ; $00D4F7 | | are green channel intensity
  LSR A                                     ; $00D4F8 | |
  LSR A                                     ; $00D4F9 | |
  AND #$001F                                ; $00D4FA | |
  ORA #$0040                                ; $00D4FD | |
  TAY                                       ; $00D500 | |
  STY !reg_coldata                          ; $00D501 |/
  LDA $0949                                 ; $00D504 |\
  LSR A                                     ; $00D507 | | bits 10-14 of $0948 (word)
  LSR A                                     ; $00D508 | | are blue channel intensity
  ORA #$0080                                ; $00D509 | |
  TAY                                       ; $00D50C | |
  STY !reg_coldata                          ; $00D50D |/

; dp = $420B
CODE_00D510:
  LDY #$00                                  ; $00D510 |\ starting address in CGRAM
  STY !reg_cgadd                            ; $00D512 |/
  LDA #$2200                                ; $00D515 |\ set destination to $2122
  STA $F5                                   ; $00D518 |/
  LDA #$2000                                ; $00D51A |\
  STA $F7                                   ; $00D51D | | set source address ($702000)
  LDY #$70                                  ; $00D51F | |
  STY $F9                                   ; $00D521 |/
  LDA #$0200                                ; $00D523 |\ transfer $0200 bytes
  STA $FA                                   ; $00D526 |/
  STX $00                                   ; $00D528 | begin DMA
  RTS                                       ; $00D52A |

CODE_00D52B:
  LDA !r_reg_coldata_mirror                 ; $00D52B |
  AND #$001F                                ; $00D52E |
  ORA #$0020                                ; $00D531 |
  TAY                                       ; $00D534 |
  STY !reg_coldata                          ; $00D535 |
  LDA !r_reg_coldata_mirror                 ; $00D538 |
  LSR A                                     ; $00D53B |
  LSR A                                     ; $00D53C |
  LSR A                                     ; $00D53D |
  LSR A                                     ; $00D53E |
  LSR A                                     ; $00D53F |
  AND #$001F                                ; $00D540 |
  ORA #$0040                                ; $00D543 |
  TAY                                       ; $00D546 |
  STY !reg_coldata                          ; $00D547 |
  LDA $0949                                 ; $00D54A |
  LSR A                                     ; $00D54D |
  LSR A                                     ; $00D54E |
  ORA #$0080                                ; $00D54F |
  TAY                                       ; $00D552 |
  STY !reg_coldata                          ; $00D553 |
  LDY #$00                                  ; $00D556 |
  STY !reg_cgadd                            ; $00D558 |
  LDA #$2200                                ; $00D55B |
  STA $F5                                   ; $00D55E |
  LDA #$1600                                ; $00D560 |
  STA $F7                                   ; $00D563 |
  LDY #$70                                  ; $00D565 |
  STY $F9                                   ; $00D567 |
  LDA #$0200                                ; $00D569 |
  STA $FA                                   ; $00D56C |
  STX $00                                   ; $00D56E |
  RTS                                       ; $00D570 |

; called on level load
; sets up DMA registers and does the tileset animate $20 times (for a full cycle)
init_tileset_animation:
  PHB                                       ; $00D571 |
  PHD                                       ; $00D572 |
  PHK                                       ; $00D573 |
  PLB                                       ; $00D574 |
  REP #$20                                  ; $00D575 |
  LDA #$420B                                ; $00D577 |\
  TCD                                       ; $00D57A |/ DP = $420B
  LDX #$01                                  ; $00D57B |
  LDY #$80                                  ; $00D57D |\
  STY !reg_vmain                            ; $00D57F |/ Video Port $80
  LDA #$1801                                ; $00D582 |\ DMA control = $01
  STA $F5                                   ; $00D585 |/ Destination VRAM
  LDA #$0020                                ; $00D587 |
  STA $0000                                 ; $00D58A |

.loop
  INC $7974                                 ; $00D58D |
  JSR animate_bg_tilesets                   ; $00D590 |\
  DEC $0000                                 ; $00D593 | | call routine $20 times (full cycle)
  BNE .loop                                 ; $00D596 |/
  SEP #$20                                  ; $00D598 |
  PLD                                       ; $00D59A |
  PLB                                       ; $00D59B |
  RTL                                       ; $00D59C |

; vram address for default tileset animation
; $1400 = coins
; $1440 = !-switch blocks
; $1480 = !-switch coins
; $14C0 = Super Mario Star Blocks
default_tile_anim_vram_ptrs:
  dw $1400, $1400, $1440, $1440             ; $00D59D |
  dw $1480, $1480, $14C0, $14C0             ; $00D5A5 |
  dw $1400, $1400, $1440, $1440             ; $00D5AD |
  dw $1480, $1480, $14C0, $14C0             ; $00D5B5 |
  dw $1400, $1400, $1440, $1440             ; $00D5BD |
  dw $1480, $1480, $14C0, $14C0             ; $00D5C5 |
  dw $1400, $1400, $1440, $1440             ; $00D5CD |
  dw $1480, $1480, $14C0, $14C0             ; $00D5D5 |

; bank $52 ($248000)
; all uncompressed graphics
; every even emtry is when !-switch blocks are transparent
; Odd entries point to solid graphics
default_tile_anim_source_ptrs:
  dw $C000, $C000, $C400, $C100             ; $00D5DD |
  dw $C500, $C000, $C400, $A880             ; $00D5E5 |
  dw $C080, $C080, $C480, $C180             ; $00D5ED |
  dw $C580, $C080, $C480, $AA80             ; $00D5F5 |
  dw $C200, $C200, $C600, $C300             ; $00D5FD |
  dw $C700, $C200, $C600, $AC80             ; $00D605 |
  dw $C280, $C280, $C680, $C380             ; $00D60D |
  dw $C780, $C280, $C680, $AE80             ; $00D615 |

; $0008 = !-switch timer
; $0010 = baby mario blocks
; if corrosponding bits are met with !s_switch_state, then do next entry instead
switch_block_skip_mask:
  dw $0000, $0000, $0008, $0000             ; $00D61D |
  dw $0008, $0000, $0010, $0000             ; $00D625 |
  dw $0000, $0000, $0008, $0000             ; $00D62D |
  dw $0008, $0000, $0010, $0000             ; $00D635 |
  dw $0000, $0000, $0008, $0000             ; $00D63D |
  dw $0008, $0000, $0010, $0000             ; $00D645 |
  dw $0000, $0000, $0008, $0000             ; $00D64D |
  dw $0008, $0000, $0010, $0000             ; $00D655 |

; process tileset animation
; transfer either during IRQ/NMI or level load
; DP = $420B
animate_bg_tilesets:
  LDA !s_sprite_disable_flag                ; $00D65D | Sprite pause flag
  BNE .anim_sub                             ; $00D660 |
  INC $0B6D                                 ; $00D662 | ??

.anim_sub
  LDA !r_header_anim_tileset                ; $00D665 | tileset animation
  ASL A                                     ; $00D668 |\
  TAX                                       ; $00D669 | | Index and execute subroutine
  JSR (tile_animation_ptrs,x)               ; $00D66A |/  X as return value to do default (0/1)
  LDA $7974                                 ; $00D66D | animation timer
  AND #$001E                                ; $00D670 | 32 frames, only keep even frames
  ASL A                                     ; $00D673 |\
  TAY                                       ; $00D674 |/  Set as Y index
  LDA !s_switch_state                       ; $00D675 |\
  AND switch_block_skip_mask,y              ; $00D678 | | Check for !-switch block/super mario blocks
  BEQ .dma_default_animation                ; $00D67B | | if bits match: skip entry and do next
  INY                                       ; $00D67D | | this makes the odd entries be for solid versions
  INY                                       ; $00D67E |/  of !-switch and mario blocks

; coin and !-switch block animations
; every even entry for default animations
; otherwise switch_block_skip_mask determines if we want odd entries
.dma_default_animation
  LDA default_tile_anim_vram_ptrs,y         ; $00D67F |
  STA !reg_vmadd                            ; $00D682 |
  LDA default_tile_anim_source_ptrs,y       ; $00D685 |
  STA $F7                                   ; $00D688 |  Set source address
  LDY #$52                                  ; $00D68A |\
  STY $F9                                   ; $00D68C |/ Set bank as $52
  LDY #$80                                  ; $00D68E |\
  STY $FA                                   ; $00D690 |/ Set size as $0080
  STX $00                                   ; $00D692 | X value from subroutine to enable transfer at all
  LDA $0CFB                                 ; $00D694 | Flag to load to something?
  BEQ .ret                                  ; $00D697 |
  LDA #$1280                                ; $00D699 |\
  STA !reg_vmadd                            ; $00D69C | | ? ? ?
  LDA #$60C0                                ; $00D69F | | ? ? ?
  STA $F7                                   ; $00D6A2 | | ? ? ?
  LDY #$70                                  ; $00D6A4 | | ? ? ?
  STY $F9                                   ; $00D6A6 | | ? ? ?
  LDA #$0100                                ; $00D6A8 | | ? ? ?
  STA $FA                                   ; $00D6AB | | ? ? ?
  STX $00                                   ; $00D6AD | | ? ? ?
  STA $FA                                   ; $00D6AF | | ? ? ?
  LDA #$1380                                ; $00D6B1 | | ? ? ?
  STA !reg_vmadd                            ; $00D6B4 | | ? ? ?
  LDA #$62C0                                ; $00D6B7 | | ? ? ?
  STA $F7                                   ; $00D6BA | | ? ? ?
  STX $00                                   ; $00D6BC | | ? ? ?
  STZ $0CFB                                 ; $00D6BE |/

.ret
  RTS                                       ; $00D6C1 |

; tileset animation subroutines
; returns to do
tile_animation_ptrs:
  dw tile_animation_00                      ; $00D6C2 | header 0
  dw tile_animation_01                      ; $00D6C4 | header 1
  dw tile_animation_02                      ; $00D6C6 | header 2
  dw tile_animation_03                      ; $00D6C8 | header 3
  dw tile_animation_04                      ; $00D6CA | header 4
  dw tile_animation_05                      ; $00D6CC | header 5
  dw tile_animation_06                      ; $00D6CE | header 6
  dw tile_animation_07                      ; $00D6D0 | header 7
  dw tile_animation_08                      ; $00D6D2 | header 8
  dw tile_animation_09                      ; $00D6D4 | header 9
  dw tile_animation_0A                      ; $00D6D6 | header A
  dw tile_animation_0B                      ; $00D6D8 | header B
  dw tile_animation_0C                      ; $00D6DA | header C
  dw tile_animation_0D                      ; $00D6DC | header D
  dw tile_animation_0E                      ; $00D6DE | header E
  dw tile_animation_0F                      ; $00D6E0 | header F
  dw tile_animation_10                      ; $00D6E2 | header 10
  dw tile_animation_11                      ; $00D6E4 | header 11

; do nothing
; BG1: None
tile_animation_04:
  PLA                                       ; $00D6E6 |\
  LDX #$01                                  ; $00D6E7 | | Pull all the way out of
  RTS                                       ; $00D6E9 |/  animate_bg_tilesets

; BG1: common
; BG2: transparent
tile_animation_00:
  LDA $7974                                 ; $00D6EA |
  AND #$0007                                ; $00D6ED |\
  XBA                                       ; $00D6F0 | | VRAM address:
  LSR A                                     ; $00D6F1 | | $1000-$1380 ($80 per frame)
  ORA #$1000                                ; $00D6F2 | |
  STA !reg_vmadd                            ; $00D6F5 |/
  LDA #$B400                                ; $00D6F8 |\
  STA $F7                                   ; $00D6FB | | Source
  LDX #$52                                  ; $00D6FD | | $52B400
  STX $F9                                   ; $00D6FF |/
  LDA #$0100                                ; $00D701 |\  $0100 transfer size
  STA $FA                                   ; $00D704 |/
  LDX #$01                                  ; $00D706 |
  STX $00                                   ; $00D708 |
  RTS                                       ; $00D70A |

; bank $56
anim_pond_water_gfx_ptrs:
  dw $8800, $8A00, $8C00, $8E00             ; $00D70B |
; BG1: common
; BG2: Water of Pond
tile_animation_01:
  LDA #$2F00                                ; $00D713 |\ VRAM address
  STA !reg_vmadd                            ; $00D716 |/
  LDA #$0200                                ; $00D719 |\ $0200 transfer size
  STA $FA                                   ; $00D71C |/
  LDY #$56                                  ; $00D71E |\ Bank $56
  STY $F9                                   ; $00D720 |/
  LDA $7974                                 ; $00D722 |
  LSR A                                     ; $00D725 |
  LSR A                                     ; $00D726 |
  AND #$0006                                ; $00D727 |
  TAY                                       ; $00D72A |
  LDA anim_pond_water_gfx_ptrs,y            ; $00D72B |\
  STA $F7                                   ; $00D72E |/ Set source $56xxxx
  LDX #$01                                  ; $00D730 |
  STX $00                                   ; $00D732 |
  RTS                                       ; $00D734 |


; VRAM addresses top row?
anim_clouds_vram_ptrs_0:
  dw $1000, $1080, $1200, $1280             ; $00D735 |
; VRAM addresses bottom row?
anim_clouds_vram_ptrs_1:
  dw $1100, $1180, $1300, $1380             ; $00D73D |
; Source bank $52
anim_clouds_gfx_ptrs:
  dw $D000, $D800, $C000, $C000             ; $00D745 |
  dw $D200, $DA00, $C000, $C000             ; $00D74D |
  dw $D400, $DC00, $C000, $C000             ; $00D755 |
  dw $D600, $DE00, $C000, $C000             ; $00D75D |
; BG1: common
; BG2: clouds
tile_animation_02:
  LDA $7974                                 ; $00D765 |\  32 frames
  AND #$001E                                ; $00D768 | | Every other frame
  TAY                                       ; $00D76B |/
  LDA anim_clouds_gfx_ptrs,y                ; $00D76C |\
  STA $F7                                   ; $00D76F |/ Set source $52xxxx
  LDX #$52                                  ; $00D771 |\
  STX $F9                                   ; $00D773 |/ Bank $52
  TYA                                       ; $00D775 |\
  AND #$0006                                ; $00D776 | | Down to 4 entries
  TAY                                       ; $00D779 |/
  LDA anim_clouds_vram_ptrs_0,y             ; $00D77A |\
  STA !reg_vmadd                            ; $00D77D | |
  LDA #$0100                                ; $00D780 | | Transfer upper row?
  STA $FA                                   ; $00D783 | | $0100 size
  LDX #$01                                  ; $00D785 | |
  STX $00                                   ; $00D787 |/
  STA $FA                                   ; $00D789 | Same size
  LDA anim_clouds_vram_ptrs_1,y             ; $00D78B |\
  STA !reg_vmadd                            ; $00D78E | | Do lower row?
  STX $00                                   ; $00D791 |/
  RTS                                       ; $00D793 |

; bank $56
anim_smile_clouds_gfx_ptrs:
  dw $9000, $9000, $9000, $9000             ; $00D794 |
  dw $9200, $9200, $9200, $9200             ; $00D79C |
  dw $9400, $9400, $9400, $9400             ; $00D7A4 |
  dw $9600, $9600, $9600, $9600             ; $00D7AC |
; BG1: common
; BG3: Smiley Clouds
tile_animation_03:
  LDA $7974                                 ; $00D7B4 |\
  AND #$000F                                ; $00D7B7 | | 16 animation frames
  ASL A                                     ; $00D7BA | | one transfer per frame
  TAY                                       ; $00D7BB |/
  LDA anim_smile_clouds_gfx_ptrs,y          ; $00D7BC |\  Set source address
  STA $F7                                   ; $00D7BF |/
  LDX #$56                                  ; $00D7C1 |\  Bank $56
  STX $F9                                   ; $00D7C3 |/
  LDA #$2F00                                ; $00D7C5 |\  VRAM address
  STA !reg_vmadd                            ; $00D7C8 |/  $2F00
  LDA #$0200                                ; $00D7CB |\
  STA $FA                                   ; $00D7CE |/  $0200 transfer size
  LDX #$01                                  ; $00D7D0 |
  STX $00                                   ; $00D7D2 |
  RTS                                       ; $00D7D4 |

; bank $56
; every 4th frame
anim_bg3_water_gfx_ptrs:
  dw $9800, $9A00, $9C00, $9E00             ; $00D7D5 |
  dw $A000, $A200, $A400, $A600             ; $00D7DD |
  dw $A400, $A200, $A000, $9E00             ; $00D7E5 |
  dw $9C00, $9A00                           ; $00D7ED |
; BG1: Common
; BG3: Water
tile_animation_05:
  LDA !r_anim_tileset_timer                 ; $00D7F1 |\
  INC A                                     ; $00D7F4 |/  Incerase timer
  CMP #$0038                                ; $00D7F5 |\
  BCC .get_frame                            ; $00D7F8 | | Reset timer if > $38
  LDA #$0000                                ; $00D7FA |/

.get_frame
  STA !r_anim_tileset_timer                 ; $00D7FD |   Set increase or reset
  LSR A                                     ; $00D800 |\
  AND #$00FE                                ; $00D801 | | >>1 and filter to even frame
  TAY                                       ; $00D804 |/  New graphic every 4th frame

.get_ptr
  LDA anim_bg3_water_gfx_ptrs,y             ; $00D805 |\

; many routines go here for generic transfer
; tile_animation_05_transfer
.transfer
  STA $F7                                   ; $00D808 |/ Set source address
  LDX #$56                                  ; $00D80A |\
  STX $F9                                   ; $00D80C |/ Set bank $56
  LDA #$2F00                                ; $00D80E |\
  STA !reg_vmadd                            ; $00D811 | | VRAM addr $2F00
  LDA #$0200                                ; $00D814 | | $0200 transfer size
  STA $FA                                   ; $00D817 |/
  LDX #$01                                  ; $00D819 |
  STX $00                                   ; $00D81B |
  RTS                                       ; $00D81D |

; BG1: Common
; BG3: Castle Torches/Clouds
tile_animation_06:
  LDA $0B6D                                 ; $00D81E |
  CMP #$0006                                ; $00D821 |
  BCC .transfer                             ; $00D824 |
  STZ $0B6D                                 ; $00D826 |
  LDA !r_anim_tileset_timer                 ; $00D829 |
  INC A                                     ; $00D82C |
  INC A                                     ; $00D82D |
  AND #$000E                                ; $00D82E |
  STA !r_anim_tileset_timer                 ; $00D831 |

.transfer
  LDY !r_anim_tileset_timer                 ; $00D834 |
  LDA !r_header_level_mode                  ; $00D837 |
  CMP #$000A                                ; $00D83A |
  BNE tile_animation_05_get_ptr             ; $00D83D |
  LDA anim_bg3_water_gfx_ptrs,y             ; $00D83F |\ Set source address
  STA $F7                                   ; $00D842 |/
  LDX #$56                                  ; $00D844 |
  STX $F9                                   ; $00D846 |
  LDA #$7F00                                ; $00D848 |\ $7F00 VRAM address
  STA !reg_vmadd                            ; $00D84B |/
  LDA #$0200                                ; $00D84E |\ $0200 transfer size
  STA $FA                                   ; $00D851 |/
  LDX #$01                                  ; $00D853 |
  STX $00                                   ; $00D855 |
  RTS                                       ; $00D857 |

; Castle Lava graphics
; bank 52 if BG1 tilset is $0A, else bank 56 (wood or stone castle)
anim_castle_lava_gfx_ptrs_0:
  dw $C800, $CA00, $CC00, $CE00             ; $00D858 |
  dw $EC00, $EE00, $F000, $F200             ; $00D860 |
anim_castle_lava_gfx_ptrs_1:
  dw $C900, $CB00, $CD00, $CF00             ; $00D868 |
  dw $ED00, $EF00, $F100, $F300             ; $00D870 |
; these two are transferred every other frame
; instead of tables above
anim_castle_lava_gfx_ptrs_2:
  dw $EC00, $EE00, $F000, $F200             ; $00D878 |
  dw $F400, $F600, $F800, $FA00             ; $00D880 |
anim_castle_lava_gfx_ptrs_3:
  dw $ED00, $EF00, $F100, $F300             ; $00D888 |
  dw $F500, $F700, $F900, $FB00             ; $00D890 |

; BG1: Common, Castle Lava
tile_animation_07:
  LDA $0B6D                                 ; $00D898 |
  CMP #$000B                                ; $00D89B |
  BCC .check_tileset                        ; $00D89E |
  STZ $0B6D                                 ; $00D8A0 |
  LDA !r_anim_tileset_timer                 ; $00D8A3 |
  INC A                                     ; $00D8A6 |
  AND #$0003                                ; $00D8A7 |
  STA !r_anim_tileset_timer                 ; $00D8AA |

.check_tileset
  LDA !r_anim_tileset_timer                 ; $00D8AD |
  ASL A                                     ; $00D8B0 |
  TAY                                       ; $00D8B1 |
  LDX #$52                                  ; $00D8B2 |\
  LDA !r_header_bg1_tileset                 ; $00D8B4 | | bank $52 if BG1 tileset is $0A
  CMP #$000A                                ; $00D8B7 | | else bank $56
  BNE .transfer                             ; $00D8BA |/
  TYA                                       ; $00D8BC |
  ORA #$0008                                ; $00D8BD |
  TAY                                       ; $00D8C0 |
  LDX #$56                                  ; $00D8C1 |

.transfer
  STX $F9                                   ; $00D8C3 | Bank $56 or $52
  LDX #$01                                  ; $00D8C5 |
  LDA $7974                                 ; $00D8C7 |
  AND #$0001                                ; $00D8CA |\
  BEQ .other_transfer                       ; $00D8CD |/ Branch every other frame
  LDA anim_castle_lava_gfx_ptrs_0,y         ; $00D8CF |\ Source address
  STA $F7                                   ; $00D8D2 |/
  LDA #$1000                                ; $00D8D4 |
  STA !reg_vmadd                            ; $00D8D7 |
  LDA #$0100                                ; $00D8DA |
  STA $FA                                   ; $00D8DD |
  STX !reg_mdmaen                           ; $00D8DF |
  LDA anim_castle_lava_gfx_ptrs_1,y         ; $00D8E2 |\ Source address
  STA $F7                                   ; $00D8E5 |/
  LDA #$1100                                ; $00D8E7 |
  STA !reg_vmadd                            ; $00D8EA |
  LDA #$0100                                ; $00D8ED |\ $0100 size
  STA $FA                                   ; $00D8F0 |/
  STX !reg_mdmaen                           ; $00D8F2 |
  RTS                                       ; $00D8F5 |

; bubbles and wall shading
.other_transfer
  LDA anim_castle_lava_gfx_ptrs_2,y         ; $00D8F6 |
  STA $F7                                   ; $00D8F9 |
  LDA #$1080                                ; $00D8FB |
  STA !reg_vmadd                            ; $00D8FE |
  LDA #$0100                                ; $00D901 |
  STA $FA                                   ; $00D904 |
  STX !reg_mdmaen                           ; $00D906 |
  LDA anim_castle_lava_gfx_ptrs_3,y         ; $00D909 |
  STA $F7                                   ; $00D90C |
  LDA #$1180                                ; $00D90E |
  STA !reg_vmadd                            ; $00D911 |
  LDA #$0100                                ; $00D914 |
  STA $FA                                   ; $00D917 |
  STX !reg_mdmaen                           ; $00D919 |
  RTS                                       ; $00D91C |

; bank $52
anim_ice_water_gfx_ptrs_0:
  dw $E400, $E600, $E800, $EA00             ; $00D91D |
anim_ice_water_gfx_ptrs_1:
  dw $E500, $E700, $E900, $EB00             ; $00D925 |

; BG1: Common, water in Icy area
tile_animation_08:
  INC $0B6D                                 ; $00D92D |
  LDA $0B6D                                 ; $00D930 |
  CMP #$0010                                ; $00D933 |
  BCC .transfer                             ; $00D936 |
  STZ $0B6D                                 ; $00D938 |
  LDA !r_anim_tileset_timer                 ; $00D93B |
  INC A                                     ; $00D93E |
  AND #$0003                                ; $00D93F |
  STA !r_anim_tileset_timer                 ; $00D942 |

.transfer
  LDA !r_anim_tileset_timer                 ; $00D945 |
  ASL A                                     ; $00D948 |
  TAY                                       ; $00D949 |
  LDA anim_ice_water_gfx_ptrs_0,y           ; $00D94A |\ Source Address
  STA $F7                                   ; $00D94D |/
  LDX #$52                                  ; $00D94F |\ Bank $52
  STX $F9                                   ; $00D951 |/
  LDA #$1000                                ; $00D953 |
  STA !reg_vmadd                            ; $00D956 |
  LDA #$0100                                ; $00D959 |
  STA $FA                                   ; $00D95C |
  LDX #$01                                  ; $00D95E |
  STX !reg_mdmaen                           ; $00D960 |
  LDA anim_ice_water_gfx_ptrs_1,y           ; $00D963 |\ Source Address
  STA $F7                                   ; $00D966 |/
  LDA #$1100                                ; $00D968 |
  STA !reg_vmadd                            ; $00D96B |
  LDA #$0100                                ; $00D96E |
  STA $FA                                   ; $00D971 |
  STX !reg_mdmaen                           ; $00D973 |
  RTS                                       ; $00D976 |

; BG1: Common
; BG3: Snowstorm
tile_animation_09:
  INC $0B6D                                 ; $00D977 |
  LDA $0B6D                                 ; $00D97A |
  CMP #$0008                                ; $00D97D |
  BCC .set_source_addr                      ; $00D980 |
  STZ $0B6D                                 ; $00D982 |
  LDA !r_anim_tileset_timer                 ; $00D985 |\
  CLC                                       ; $00D988 | | timer + $0200
  ADC #$0200                                ; $00D989 | | each 8th frame
  AND #$0600                                ; $00D98C | |
  STA !r_anim_tileset_timer                 ; $00D98F |/

.set_source_addr
  LDA #$8000                                ; $00D992 |\
  CLC                                       ; $00D995 | | Set source as
  ADC !r_anim_tileset_timer                 ; $00D996 | | $8000-$8600 ($0200 steps)
  JMP tile_animation_05_transfer            ; $00D999 |/  (bank $56)

; BG1: Common
; BG3: Goonies
tile_animation_0A:
  LDA $0B6D                                 ; $00D99C |
  CMP #$0008                                ; $00D99F |
  BCC .set_source_addr                      ; $00D9A2 |
  STZ $0B6D                                 ; $00D9A4 |
  LDA !r_anim_tileset_timer                 ; $00D9A7 |\
  CLC                                       ; $00D9AA | |
  ADC #$0200                                ; $00D9AB | | timer + $0200
  AND #$0E00                                ; $00D9AE | | each 8th frame
  STA !r_anim_tileset_timer                 ; $00D9B1 |/

.set_source_addr
  LDA #$B000                                ; $00D9B4 |\
  CLC                                       ; $00D9B7 | | Set source as
  ADC !r_anim_tileset_timer                 ; $00D9B8 | | $8000-$8E00 ($0200 steps)
  JMP tile_animation_05_transfer            ; $00D9BB |/  (bank $56)


; bank $56
anim_butterfly_gfx_ptrs:
  dw $B000, $B200, $B400, $B600             ; $00D9BE |
  dw $B800, $BA00, $BC00, $BE00             ; $00D9C6 |
  dw $BC00, $BA00, $B800, $B600             ; $00D9CE |
  dw $B400, $B200                           ; $00D9D6 |

anim_butterfly_timers:
  dw $000A, $0004, $0004, $0004             ; $00D9DA |
  dw $0004, $0004, $0004, $000A             ; $00D9E2 |
  dw $0004, $0004, $0004, $0004             ; $00D9EA |
  dw $0004, $0004                           ; $00D9F2 |
; BG1: Common
; BG2: Clouds
; BG3: Butterfly
tile_animation_0B:
  LDA $7974                                 ; $00D9F6 |\
  AND #$0001                                ; $00D9F9 | | Every other frame do either
  BNE .butterfly                            ; $00D9FC | | Butterfly animation
  JSR tile_animation_02                     ; $00D9FE | | or Cloud animation
  RTS                                       ; $00DA01 |/

.butterfly
  LDA !r_anim_tileset_timer                 ; $00DA02 |
  AND #$000F                                ; $00DA05 |
  ASL A                                     ; $00DA08 |
  TAY                                       ; $00DA09 |
  LDA $0B6D                                 ; $00DA0A |
  CMP anim_butterfly_timers,y               ; $00DA0D |
  BCC .transfer                             ; $00DA10 |
  STZ $0B6D                                 ; $00DA12 |
  INC !r_anim_tileset_timer                 ; $00DA15 |
  LDA !r_anim_tileset_timer                 ; $00DA18 |
  CMP #$000E                                ; $00DA1B |
  BCC .transfer                             ; $00DA1E |
  STZ !r_anim_tileset_timer                 ; $00DA20 |

.transfer
  LDA anim_butterfly_gfx_ptrs,y             ; $00DA23 |\ get source pointer
  JMP tile_animation_05_transfer            ; $00DA26 |/


anim_bg1_water_gfx_ptrs_0:
  dw $E000, $E100, $E200, $E300             ; $00DA29 |
  dw $F400, $F500, $F600, $F700             ; $00DA31 |
  dw $F400, $F500, $E200, $E300             ; $00DA39 |
anim_bg1_water_gfx_ptrs_1:
  dw $F800, $F900, $FA00, $FB00             ; $00DA41 |
  dw $FC00, $FD00, $FE00, $FF00             ; $00DA49 |
  dw $FC00, $FD00, $FA00, $FB00             ; $00DA51 |

anim_bg1_water_timers:
  dw $0010, $000C, $000C, $0010             ; $00DA59 |
  dw $000C, $000C                           ; $00DA61 |
; BG1: Common, Water
tile_animation_0C:
  LDX !r_anim_tileset_timer                 ; $00DA65 |
  LDA $0B6D                                 ; $00DA68 |
  CMP anim_bg1_water_timers,x               ; $00DA6B |
  BCC .transfer                             ; $00DA6E |
  STZ $0B6D                                 ; $00DA70 |
  LDA !r_anim_tileset_timer                 ; $00DA73 |
  INC A                                     ; $00DA76 |
  INC A                                     ; $00DA77 |
  CMP #$000C                                ; $00DA78 |
  BCC .set_timer                            ; $00DA7B |
  LDA #$0000                                ; $00DA7D |

.set_timer
  STA !r_anim_tileset_timer                 ; $00DA80 |

.transfer
  LDA !r_anim_tileset_timer                 ; $00DA83 |
  ASL A                                     ; $00DA86 |
  TAY                                       ; $00DA87 |
  LDX #$52                                  ; $00DA88 |
  STX $F9                                   ; $00DA8A |
  LDX #$01                                  ; $00DA8C |
  LDA $7974                                 ; $00DA8E |\
  AND #$0002                                ; $00DA91 | | 2 out of 4 frames
  BNE .other_transfer                       ; $00DA94 |/
  LDA anim_bg1_water_gfx_ptrs_0,y           ; $00DA96 |
  STA $F7                                   ; $00DA99 |
  LDA #$1000                                ; $00DA9B |
  STA !reg_vmadd                            ; $00DA9E |
  LDA #$0100                                ; $00DAA1 |
  STA $FA                                   ; $00DAA4 |
  STX !reg_mdmaen                           ; $00DAA6 |
  LDA anim_bg1_water_gfx_ptrs_0+2,y         ; $00DAA9 |
  STA $F7                                   ; $00DAAC |
  LDA #$1100                                ; $00DAAE |
  STA !reg_vmadd                            ; $00DAB1 |
  LDA #$0100                                ; $00DAB4 |
  STA $FA                                   ; $00DAB7 |
  STX !reg_mdmaen                           ; $00DAB9 |
  RTS                                       ; $00DABC |

.other_transfer
  LDA anim_bg1_water_gfx_ptrs_1,y           ; $00DABD |
  STA $F7                                   ; $00DAC0 |
  LDA #$1080                                ; $00DAC2 |
  STA !reg_vmadd                            ; $00DAC5 |
  LDA #$0100                                ; $00DAC8 |
  STA $FA                                   ; $00DACB |
  STX !reg_mdmaen                           ; $00DACD |
  LDA anim_bg1_water_gfx_ptrs_1+2,y         ; $00DAD0 |
  STA $F7                                   ; $00DAD3 |
  LDA #$1180                                ; $00DAD5 |
  STA !reg_vmadd                            ; $00DAD8 |
  LDA #$0100                                ; $00DADB |
  STA $FA                                   ; $00DADE |
  STX !reg_mdmaen                           ; $00DAE0 |
  RTS                                       ; $00DAE3 |

; BG1: Common, Castle Lava
; BG3: Castle Torches and Clouds
tile_animation_0D:
  INC $0B6F                                 ; $00DAE4 |
  LDA $0B6F                                 ; $00DAE7 |\
  CMP #$0006                                ; $00DAEA | |
  BCS .torch_and_clouds                     ; $00DAED | | Do lava animation if timer < $07
  JMP tile_animation_07                     ; $00DAEF |/

.torch_and_clouds
  STZ $0B6F                                 ; $00DAF2 | Clear timer
  LDA $0B69                                 ; $00DAF5 |
  INC A                                     ; $00DAF8 |
  INC A                                     ; $00DAF9 |
  AND #$000E                                ; $00DAFA |
  STA $0B69                                 ; $00DAFD |
  LDY $0B69                                 ; $00DB00 |
  JMP tile_animation_05_get_ptr             ; $00DB03 |

; BG1: Common, Water
; BG3: Castle Torches and Clouds
tile_animation_0E:
  INC $0B6F                                 ; $00DB06 |
  LDA $7974                                 ; $00DB09 |
  AND #$0001                                ; $00DB0C |\
  BEQ tile_animation_0D_torch_and_clouds    ; $00DB0F | | alternate between water / torches
  JMP tile_animation_0C                     ; $00DB11 |/  every other frame


anim_bg3_alt_cloud_gfx_ptr:
  dw $A800, $AA00, $AC00, $AE00             ; $00DB14 |
; BG1: Common
; BG3: Clouds
tile_animation_0F:
  LDA $0B71                                 ; $00DB1C |
  INC A                                     ; $00DB1F |
  CMP #$0006                                ; $00DB20 |
  BCC .prep_load                            ; $00DB23 |
  INC $0B6B                                 ; $00DB25 |
  LDA #$0000                                ; $00DB28 |

.prep_load
  STA $0B71                                 ; $00DB2B |
  LDX #$01                                  ; $00DB2E |
  LDY $0B6B                                 ; $00DB30 |
  CMP #$0000                                ; $00DB33 |
  BNE .ret                                  ; $00DB36 |
  TYA                                       ; $00DB38 |
  AND #$0006                                ; $00DB39 |
  TAY                                       ; $00DB3C |
  LDA anim_bg3_alt_cloud_gfx_ptr,y          ; $00DB3D |\ Set source address
  JMP tile_animation_05_transfer            ; $00DB40 |/

.ret
  RTS                                       ; $00DB43 |


  dw $C000, $C100, $C200, $C300             ; $00DB44 |

  dw $C080, $C180, $C280, $C380             ; $00DB4C |
; BG1: Common
; BG3: Reserved Animation (?)
; unused??
tile_animation_10:
  LDA $0B6D                                 ; $00DB54 |
  AND #$000C                                ; $00DB57 |
  LSR A                                     ; $00DB5A |
  TAY                                       ; $00DB5B |
  LDX #$56                                  ; $00DB5C |\ bank $56
  STX $F9                                   ; $00DB5E |/
  LDA $DB44,y                               ; $00DB60 |\ source address
  STA $F7                                   ; $00DB63 |/
  LDA #$2F00                                ; $00DB65 |\ VRAM address $2F00
  STA !reg_vmadd                            ; $00DB68 |/
  LDA #$0080                                ; $00DB6B |\ $0080 transfer size
  STA $FA                                   ; $00DB6E |/
  LDX #$01                                  ; $00DB70 |\ enable DMA
  STX !reg_mdmaen                           ; $00DB72 |/
  STA $FA                                   ; $00DB75 |
  LDA $DB4C,y                               ; $00DB77 |
  STA $F7                                   ; $00DB7A |
  LDA #$2F80                                ; $00DB7C |
  STA !reg_vmadd                            ; $00DB7F |
  STX !reg_mdmaen                           ; $00DB82 |
  RTS                                       ; $00DB85 |

; BG1: Common, Water
; BG3: Smiley Clouds
tile_animation_11:
  LDA $7974                                 ; $00DB86 |\
  AND #$0003                                ; $00DB89 | |
  BNE .water                                ; $00DB8C | |
  JMP tile_animation_03                     ; $00DB8E | | Smiley clouds @ 1/4 frames
.water
  JMP tile_animation_0C                     ; $00DB91 |/  Water anim @ 3/4 frames


  REP #$20                                  ; $00DB94 |
  PHD                                       ; $00DB96 |
  LDA #$420B                                ; $00DB97 |
  TCD                                       ; $00DB9A |
  LDA #$1801                                ; $00DB9B |
  STA $F5                                   ; $00DB9E |
  LDX #$01                                  ; $00DBA0 |
  JSR CODE_00DBA9                           ; $00DBA2 |
  PLD                                       ; $00DBA5 |
  SEP #$20                                  ; $00DBA6 |
  RTL                                       ; $00DBA8 |

CODE_00DBA9:
  LDY #$00                                  ; $00DBA9 |
  STY $F9                                   ; $00DBAB |
  LDY #$81                                  ; $00DBAD |
  STY !reg_vmain                            ; $00DBAF |
  LDY !r_new_column_flag                    ; $00DBB2 |\
  BEQ CODE_00DBD5                           ; $00DBB5 | |
  LDA #$6DAA                                ; $00DBB7 | | has a new column been spawned?
  STA $F7                                   ; $00DBBA | |
  LDA $007B                                 ; $00DBBC | | if so, DMA $40 bytes from
  STA !reg_vmadd                            ; $00DBBF | | left half column buffer
  LDY #$40                                  ; $00DBC2 | | to VRAM left half of column
  STY $FA                                   ; $00DBC4 | |
  STX $00                                   ; $00DBC6 | |
  LDA $007F                                 ; $00DBC8 | | and do right half as well
  STA !reg_vmadd                            ; $00DBCB | |
  STY $FA                                   ; $00DBCE | |
  STX $00                                   ; $00DBD0 | |
  STZ !r_new_column_flag                    ; $00DBD2 |/  finally, clear newly spawned flag

CODE_00DBD5:
  LDY #$80                                  ; $00DBD5 |
  STY !reg_vmain                            ; $00DBD7 |
  LDY !r_new_row_flag                       ; $00DBDA |
  BEQ CODE_00DC1B                           ; $00DBDD |
  LDA #$6E2A                                ; $00DBDF |
  STA $F7                                   ; $00DBE2 |
  LDA $007D                                 ; $00DBE4 |
  STA !reg_vmadd                            ; $00DBE7 |
  LDA $0083                                 ; $00DBEA |
  STA $FA                                   ; $00DBED |
  STX $00                                   ; $00DBEF |
  LDA $0081                                 ; $00DBF1 |
  STA !reg_vmadd                            ; $00DBF4 |
  LDA $0087                                 ; $00DBF7 |
  STA $FA                                   ; $00DBFA |
  STX $00                                   ; $00DBFC |
  LDA $0085                                 ; $00DBFE |
  STA !reg_vmadd                            ; $00DC01 |
  LDA $0083                                 ; $00DC04 |
  STA $FA                                   ; $00DC07 |
  STX $00                                   ; $00DC09 |
  LDA !r_game_over_state                    ; $00DC0B |
  STA !reg_vmadd                            ; $00DC0E |
  LDA $0087                                 ; $00DC11 |
  STA $FA                                   ; $00DC14 |
  STX $00                                   ; $00DC16 |
  STZ !r_new_row_flag                       ; $00DC18 |

CODE_00DC1B:
  RTS                                       ; $00DC1B |

CODE_00DC1C:
  LDA $09ED                                 ; $00DC1C |
  BEQ CODE_00DC60                           ; $00DC1F |
  LDX #$80                                  ; $00DC21 |
  STX !reg_vmain                            ; $00DC23 |
  LDX #$01                                  ; $00DC26 |
  STX $F5                                   ; $00DC28 |
  LDX #$18                                  ; $00DC2A |
  STX $F6                                   ; $00DC2C |
  LDX #$4C                                  ; $00DC2E |
  STX $F9                                   ; $00DC30 |
  LDY #$00                                  ; $00DC32 |
  LDX #$01                                  ; $00DC34 |

CODE_00DC36:
  LDA $09EF,y                               ; $00DC36 |
  BMI CODE_00DC60                           ; $00DC39 |
  PHA                                       ; $00DC3B |
  STA !reg_vmadd                            ; $00DC3C |
  LDA $09F1,y                               ; $00DC3F |
  STA $F7                                   ; $00DC42 |
  LDA #$0004                                ; $00DC44 |
  STA $FA                                   ; $00DC47 |
  STX $00                                   ; $00DC49 |
  PLA                                       ; $00DC4B |
  CLC                                       ; $00DC4C |
  ADC #$0020                                ; $00DC4D |
  STA !reg_vmadd                            ; $00DC50 |
  LDA #$0004                                ; $00DC53 |
  STA $FA                                   ; $00DC56 |
  STX $00                                   ; $00DC58 |
  INY                                       ; $00DC5A |
  INY                                       ; $00DC5B |
  INY                                       ; $00DC5C |
  INY                                       ; $00DC5D |
  BRA CODE_00DC36                           ; $00DC5E |

CODE_00DC60:
  LDA #$0000                                ; $00DC60 |
  STA $09ED                                 ; $00DC63 |
  DEC A                                     ; $00DC66 |
  STA $09EF                                 ; $00DC67 |
  RTS                                       ; $00DC6A |

CODE_00DC6B:
  LDA $0CF9                                 ; $00DC6B |
  BEQ CODE_00DC96                           ; $00DC6E |
  BPL CODE_00DC7D                           ; $00DC70 |
  AND #$7FE0                                ; $00DC72 |
  STA !reg_vmadd                            ; $00DC75 |
  LDA #$6800                                ; $00DC78 |
  BRA CODE_00DC86                           ; $00DC7B |

CODE_00DC7D:
  LDA #$5C00                                ; $00DC7D |
  STA !reg_vmadd                            ; $00DC80 |
  LDA #$5800                                ; $00DC83 |

CODE_00DC86:
  STA $F7                                   ; $00DC86 |
  LDY #$70                                  ; $00DC88 |
  STY $F9                                   ; $00DC8A |
  LDA #$0800                                ; $00DC8C |
  STA $FA                                   ; $00DC8F |
  STX $00                                   ; $00DC91 |
  STZ $0CF9                                 ; $00DC93 |

CODE_00DC96:
  RTS                                       ; $00DC96 |

CODE_00DC97:
  LDA #$3000                                ; $00DC97 |
  STA !reg_vmadd                            ; $00DC9A |
  LDA #$4E00                                ; $00DC9D |
  STA $F7                                   ; $00DCA0 |
  LDY #$70                                  ; $00DCA2 |
  STY $F9                                   ; $00DCA4 |
  LDA #$0800                                ; $00DCA6 |
  STA $FA                                   ; $00DCA9 |
  STX $00                                   ; $00DCAB |
  RTS                                       ; $00DCAD |

; Yoshi graphics DMA
;
CODE_00DCAE:
  LDA #$4000                                ; $00DCAE |
  STA !reg_vmadd                            ; $00DCB1 |
  LDY #$40                                  ; $00DCB4 |
  LDA $6128                                 ; $00DCB6 |
  STA $F7                                   ; $00DCB9 |
  LDA $612A                                 ; $00DCBB |
  STA $F9                                   ; $00DCBE |
  STY $FA                                   ; $00DCC0 |
  STX $00                                   ; $00DCC2 |
  LDA $612C                                 ; $00DCC4 |
  STA $F7                                   ; $00DCC7 |
  LDA $612E                                 ; $00DCC9 |
  STA $F9                                   ; $00DCCC |
  STY $FA                                   ; $00DCCE |
  STX $00                                   ; $00DCD0 |
  LDA $6130                                 ; $00DCD2 |
  STA $F7                                   ; $00DCD5 |
  LDA $6132                                 ; $00DCD7 |
  STA $F9                                   ; $00DCDA |
  STY $FA                                   ; $00DCDC |
  STX $00                                   ; $00DCDE |
  LDA $6134                                 ; $00DCE0 |
  STA $F7                                   ; $00DCE3 |
  LDA $6136                                 ; $00DCE5 |
  STA $F9                                   ; $00DCE8 |
  STY $FA                                   ; $00DCEA |
  STX $00                                   ; $00DCEC |
  LDA $6138                                 ; $00DCEE |
  STA $F7                                   ; $00DCF1 |
  LDA $613A                                 ; $00DCF3 |
  STA $F9                                   ; $00DCF6 |
  STY $FA                                   ; $00DCF8 |
  STX $00                                   ; $00DCFA |
  LDA $613C                                 ; $00DCFC |
  STA $F7                                   ; $00DCFF |
  LDA $613E                                 ; $00DD01 |
  STA $F9                                   ; $00DD04 |
  STY $FA                                   ; $00DD06 |
  STX $00                                   ; $00DD08 |
  LDA $6140                                 ; $00DD0A |
  STA $F7                                   ; $00DD0D |
  LDA $6142                                 ; $00DD0F |
  STA $F9                                   ; $00DD12 |
  LDA #$0020                                ; $00DD14 |
  STA $FA                                   ; $00DD17 |
  STX $00                                   ; $00DD19 |
  STA $FA                                   ; $00DD1B |
  LDA $6145                                 ; $00DD1D |
  STA $F8                                   ; $00DD20 |
  LDA $6144                                 ; $00DD22 |
  STA $F7                                   ; $00DD25 |
  STX $00                                   ; $00DD27 |
; Start writing lower row
  LDA #$4100                                ; $00DD29 |
  STA !reg_vmadd                            ; $00DD2C |
  LDA $6128                                 ; $00DD2F |
  STA $F7                                   ; $00DD32 |
  LDA $612A                                 ; $00DD34 |
  XBA                                       ; $00DD37 |
  STA $F8                                   ; $00DD38 |
  STY $FA                                   ; $00DD3A |
  STX $00                                   ; $00DD3C |
  LDA $612C                                 ; $00DD3E |
  STA $F7                                   ; $00DD41 |
  LDA $612E                                 ; $00DD43 |
  XBA                                       ; $00DD46 |
  STA $F8                                   ; $00DD47 |
  STY $FA                                   ; $00DD49 |
  STX $00                                   ; $00DD4B |
  LDA $6130                                 ; $00DD4D |
  STA $F7                                   ; $00DD50 |
  LDA $6132                                 ; $00DD52 |
  XBA                                       ; $00DD55 |
  STA $F8                                   ; $00DD56 |
  STY $FA                                   ; $00DD58 |
  STX $00                                   ; $00DD5A |
  LDA $6134                                 ; $00DD5C |
  STA $F7                                   ; $00DD5F |
  LDA $6136                                 ; $00DD61 |
  XBA                                       ; $00DD64 |
  STA $F8                                   ; $00DD65 |
  STY $FA                                   ; $00DD67 |
  STX $00                                   ; $00DD69 |
  LDA $6138                                 ; $00DD6B |
  STA $F7                                   ; $00DD6E |
  LDA $613A                                 ; $00DD70 |
  XBA                                       ; $00DD73 |
  STA $F8                                   ; $00DD74 |
  STY $FA                                   ; $00DD76 |
  STX $00                                   ; $00DD78 |
  LDA $613C                                 ; $00DD7A |
  STA $F7                                   ; $00DD7D |
  LDA $613E                                 ; $00DD7F |
  XBA                                       ; $00DD82 |
  STA $F8                                   ; $00DD83 |
  STY $FA                                   ; $00DD85 |
  STX $00                                   ; $00DD87 |
  LDA $6140                                 ; $00DD89 |
  STA $F7                                   ; $00DD8C |
  LDA $6142                                 ; $00DD8E |
  XBA                                       ; $00DD91 |
  STA $F8                                   ; $00DD92 |
  LDA #$0020                                ; $00DD94 |
  STA $FA                                   ; $00DD97 |
  STX $00                                   ; $00DD99 |
  STA $FA                                   ; $00DD9B |
  LDA $6144                                 ; $00DD9D |
  STA $F7                                   ; $00DDA0 |
  LDA $6146                                 ; $00DDA2 |
  XBA                                       ; $00DDA5 |
  STA $F8                                   ; $00DDA6 |
  STX $00                                   ; $00DDA8 |
  LDA $0B85                                 ; $00DDAA |
  BEQ CODE_00DDE7                           ; $00DDAD |
  LDA #$4620                                ; $00DDAF |
  STA !reg_vmadd                            ; $00DDB2 |
  LDA $0B87                                 ; $00DDB5 |
  STA $F7                                   ; $00DDB8 |
  LDA #$0052                                ; $00DDBA |
  STA $F9                                   ; $00DDBD |
  STY $FA                                   ; $00DDBF |
  STX $00                                   ; $00DDC1 |
  LDA $0B8B                                 ; $00DDC3 |
  STA $F7                                   ; $00DDC6 |
  STY $FA                                   ; $00DDC8 |
  STX $00                                   ; $00DDCA |
  LDA #$4720                                ; $00DDCC |
  STA !reg_vmadd                            ; $00DDCF |
  LDA $0B89                                 ; $00DDD2 |
  STA $F7                                   ; $00DDD5 |
  STY $FA                                   ; $00DDD7 |
  STX $00                                   ; $00DDD9 |
  LDA $0B8D                                 ; $00DDDB |
  STA $F7                                   ; $00DDDE |
  STY $FA                                   ; $00DDE0 |
  STX $00                                   ; $00DDE2 |
  STZ $0B85                                 ; $00DDE4 |

CODE_00DDE7:
  LDA $6114                                 ; $00DDE7 |
  BEQ CODE_00DE0B                           ; $00DDEA |
  STA $F7                                   ; $00DDEC |
  LDY #$52                                  ; $00DDEE |
  STY $F9                                   ; $00DDF0 |
  LDA #$4200                                ; $00DDF2 |
  STA !reg_vmadd                            ; $00DDF5 |
  LDY #$01                                  ; $00DDF8 |
  STY $FB                                   ; $00DDFA |
  STX $00                                   ; $00DDFC |
  LDA #$4300                                ; $00DDFE |
  STA !reg_vmadd                            ; $00DE01 |
  STY $FB                                   ; $00DE04 |
  STX $00                                   ; $00DE06 |
  STZ $6114                                 ; $00DE08 |

CODE_00DE0B:
  RTS                                       ; $00DE0B |

; perform DMA's that were added to queue by $00BE39
CODE_00DE0C:
  LDA #$8000                                ; $00DE0C |
  STA $F5                                   ; $00DE0F | WRAM is destination
  LDY #$02                                  ; $00DE11 |
  LDA $096D,y                               ; $00DE13 | size
  BEQ CODE_00DE43                           ; $00DE16 |

CODE_00DE18:
  STA $FA                                   ; $00DE18 |
  LDA $096F,y                               ; $00DE1A |\
  STA !reg_wmaddl                           ; $00DE1D | | destination WRAM address
  LDA $0970,y                               ; $00DE20 | |
  STA !reg_wmaddm                           ; $00DE23 |/
  LDA $0972,y                               ; $00DE26 |\
  STA $F7                                   ; $00DE29 | | source address
  LDA $0973,y                               ; $00DE2B | |
  STA $F8                                   ; $00DE2E |/
  STX $00                                   ; $00DE30 | do DMA
  TYA                                       ; $00DE32 |
  CLC                                       ; $00DE33 |
  ADC #$0008                                ; $00DE34 |
  TAY                                       ; $00DE37 |
  LDA $096D,y                               ; $00DE38 |
  BNE CODE_00DE18                           ; $00DE3B | keep doing more DMA's until 0 size encountered
  STZ $096D                                 ; $00DE3D |
  STZ $096F                                 ; $00DE40 |

CODE_00DE43:
  RTS                                       ; $00DE43 |

r_gsu_init_1 = $7EDE44
gsu_init_1:
  STZ !gsu_sfr                              ; $00DE44 |  nuke GSU status/flag register
  LDY $012D                                 ; $00DE47 |\ set SCBR
  STY !gsu_scbr                             ; $00DE4A |/
  LDY $012E                                 ; $00DE4D |\ set SCMR
  STY !gsu_scmr                             ; $00DE50 |/
  STX !gsu_pbr                              ; $00DE53 |  set PBR
  STA !gsu_r15                              ; $00DE56 |  set program counter
  LDA #$0020                                ; $00DE59 |\ start GSU execution

CODE_00DE5C:
  BIT !gsu_sfr                              ; $00DE5C |\
  BNE CODE_00DE5C                           ; $00DE5F |/ wait for GSU execution to end
  LDY #$00                                  ; $00DE61 |\  give SCPU ROM/RAM bus access
  STY !gsu_scmr                             ; $00DE63 |/
  RTL                                       ; $00DE66 |

r_gsu_init_2 = $7EDE67
gsu_init_2:
  PHB                                       ; $00DE67 |  preserve bank
  STZ !gsu_sfr                              ; $00DE68 |  nuke GSU status/flag register
  LDY $012D                                 ; $00DE6B |\ set SCBR
  STY !gsu_scbr                             ; $00DE6E |/
  LDY $012E                                 ; $00DE71 |\ set SCMR
  STY !gsu_scmr                             ; $00DE74 |/
  STX !gsu_pbr                              ; $00DE77 |  set PBR
  STA !gsu_r15                              ; $00DE7A |  set program counter
  PHK                                       ; $00DE7D |\
  PLB                                       ; $00DE7E | | sub call
  JSR CODE_00E240                           ; $00DE7F |/
  PLB                                       ; $00DE82 |  restore bank
  LDA #$0020                                ; $00DE83 |\ start GSU execution

CODE_00DE86:
  BIT !gsu_sfr                              ; $00DE86 |\
  BNE CODE_00DE86                           ; $00DE89 |/ wait for GSU execution to end
  LDY #$00                                  ; $00DE8B |\  give SCPU ROM/RAM bus access
  STY !gsu_scmr                             ; $00DE8D |/
  RTL                                       ; $00DE90 |

r_gsu_init_3 = $7EDE91
gsu_init_3:
  STZ !gsu_sfr                              ; $00DE91 |  nuke GSU status/flag register
  LDY $012D                                 ; $00DE94 |\ set SCBR
  STY !gsu_scbr                             ; $00DE97 |/
  LDY $012E                                 ; $00DE9A |\ set SCMR
  STY !gsu_scmr                             ; $00DE9D |/
  STX !gsu_pbr                              ; $00DEA0 |  set PBR
  STA !gsu_r15                              ; $00DEA3 |  set program counter
  REP #$10                                  ; $00DEA6 |
  LDA #$0020                                ; $00DEA8 |\
  TAY                                       ; $00DEAB |/ start GSU execution

CODE_00DEAC:
  BIT !gsu_sfr                              ; $00DEAC |\
  BNE CODE_00DEAC                           ; $00DEAF |/ wait for GSU execution to end
  LDX !gsu_r0                               ; $00DEB1 |\
  BEQ CODE_00DEC6                           ; $00DEB4 | |
  LDA $7F0000,x                             ; $00DEB6 | |
  STA !gsu_r0                               ; $00DEBA | | execute the GSU routine again until r0 is zero
  LDA !gsu_r15                              ; $00DEBD | |
  STA !gsu_r15                              ; $00DEC0 | |
  TYA                                       ; $00DEC3 | |
  BRA CODE_00DEAC                           ; $00DEC4 |/

CODE_00DEC6:
  LDY #$0000                                ; $00DEC6 |\ give SCPU ROM/RAM bus access
  STY !gsu_scmr                             ; $00DEC9 |/
  SEP #$10                                  ; $00DECC |
  RTL                                       ; $00DECE |

r_gsu_init_4 = $7EDECF
gsu_init_4:
  STZ !gsu_sfr                              ; $00DECF |  nuke GSU status/flag register
  LDY $012D                                 ; $00DED2 |\ set SCBR
  STY !gsu_scbr                             ; $00DED5 |/
  LDY $012E                                 ; $00DED8 |\ set SCMR
  STY !gsu_scmr                             ; $00DEDB |/
  STX !gsu_pbr                              ; $00DEDE |  set PBR
  STA !gsu_r15                              ; $00DEE1 |  set program counter
  REP #$10                                  ; $00DEE4 |
  LDA #$0020                                ; $00DEE6 |\
  TAY                                       ; $00DEE9 | | start GSU execution

CODE_00DEEA:
  BIT !gsu_sfr                              ; $00DEEA |\
  BNE CODE_00DEEA                           ; $00DEED |/  wait for GSU execution to end
  LDX !gsu_r0                               ; $00DEEF |\
  BPL CODE_00DF04                           ; $00DEF2 | |
  LDA $7F0000,x                             ; $00DEF4 | | sign bit on means MAP16 fetch from RAM
  STA !gsu_r0                               ; $00DEF8 | | continue the GSU routine from where
  LDA !gsu_r15                              ; $00DEFB | | it left off, after the stop nop
  STA !gsu_r15                              ; $00DEFE | |
  TYA                                       ; $00DF01 | |
  BRA CODE_00DEEA                           ; $00DF02 |/

CODE_00DF04:
  BEQ CODE_00DF1F                           ; $00DF04 |  end GSU execution if r0 is zero
  STZ !gsu_scmr                             ; $00DF06 |  give SCPU ROM/RAM bus access
  JSR ($DF26,x)                             ; $00DF09 |  x = r0 ($0002~$001A)
  SEP #$20                                  ; $00DF0C |
  LDA $012E                                 ; $00DF0E |\ set SCMR
  STA !gsu_scmr                             ; $00DF11 |/
  REP #$20                                  ; $00DF14 |
  LDA !gsu_r15                              ; $00DF16 |\
  STA !gsu_r15                              ; $00DF19 | | execute the GSU routine again
  TYA                                       ; $00DF1C | |
  BRA CODE_00DEEA                           ; $00DF1D |/

CODE_00DF1F:
  LDY #$0000                                ; $00DF1F |\ give SCPU ROM/RAM bus access
  STY !gsu_scmr                             ; $00DF22 |/
  SEP #$10                                  ; $00DF25 |
  RTL                                       ; $00DF27 |

; pointer table
; index is r0 after a GSU routine is called by $7EDECF
; when r0 returns positive and non-zero
  dw $DF68                                  ; $00DF28 | r0 = #$0002
  dw $E04F                                  ; $00DF2A | r0 = #$0004
  dw $E0A9                                  ; $00DF2C | r0 = #$0006
  dw $E0CD                                  ; $00DF2E | r0 = #$0008
  dw $DFC3                                  ; $00DF30 | r0 = #$000A
  dw $E023                                  ; $00DF32 | r0 = #$000C
  dw $E017                                  ; $00DF34 | r0 = #$000E
  dw $E0D7                                  ; $00DF36 | r0 = #$0010
  dw $E0E6                                  ; $00DF38 | r0 = #$0012
  dw $E0F2                                  ; $00DF3A | r0 = #$0014
  dw $DF44                                  ; $00DF3C | r0 = #$0016
  dw $E068                                  ; $00DF3E | r0 = #$0018
  dw $E101                                  ; $00DF40 | r0 = #$001A
  dw $E126                                  ; $00DF42 | r0 = #$001C

; r0 = #$0016
  PHY                                       ; $00DF44 |
  LDA !r_cur_stage                          ; $00DF45 |
  CMP #$000B                                ; $00DF48 |
  BNE CODE_00DF62                           ; $00DF4B |
  STZ !r_cur_stage                          ; $00DF4D |
  LDA #$001F                                ; $00DF50 |
  STA !r_game_mode                          ; $00DF53 |
  LDA #$0001                                ; $00DF56 |
  STA $022D                                 ; $00DF59 |
  JSL $01B2B7                               ; $00DF5C |
  PLY                                       ; $00DF60 |
  RTS                                       ; $00DF61 |

CODE_00DF62:
  JSL $02A4B5                               ; $00DF62 |
  PLY                                       ; $00DF66 |
  RTS                                       ; $00DF67 |

; r0 = #$0002
  PHY                                       ; $00DF68 |
  SEP #$10                                  ; $00DF69 |
  LDA !gsu_r6                               ; $00DF6B |  r6
  CMP #$A400                                ; $00DF6E |
  BNE CODE_00DF7A                           ; $00DF71 |
  JSR CODE_00DFE2                           ; $00DF73 |
  SEP #$10                                  ; $00DF76 |
  BRA CODE_00DF97                           ; $00DF78 |

CODE_00DF7A:
  LDA $6000                                 ; $00DF7A |
  AND #$FFF0                                ; $00DF7D |
  STA $0000                                 ; $00DF80 |
  LDA $6002                                 ; $00DF83 |
  AND #$FFF0                                ; $00DF86 |
  STA $0002                                 ; $00DF89 |
  JSL $03A520                               ; $00DF8C |
  LDA #$0009                                ; $00DF90 |\ play sound #$0009
  JSL push_sound_queue                      ; $00DF93 |/

CODE_00DF97:
  LDA #$01E4                                ; $00DF97 |
  JSL spawn_ambient_sprite                  ; $00DF9A |
  LDA $0000                                 ; $00DF9E |
  STA $70A2,y                               ; $00DFA1 |
  LDA $0002                                 ; $00DFA4 |
  STA $7142,y                               ; $00DFA7 |
  LDA #$000C                                ; $00DFAA |
  STA $73C2,y                               ; $00DFAD |
  LDA #$0008                                ; $00DFB0 |
  STA $7782,y                               ; $00DFB3 |
  REP #$10                                  ; $00DFB6 |
  LDA #$0000                                ; $00DFB8 |
  STA $0095                                 ; $00DFBB |
  LDA #$0007                                ; $00DFBE |
  BRA CODE_00DFCD                           ; $00DFC1 |

; r0 = #$000A
CODE_00DFC3:
  LDA #$0000                                ; $00DFC3 |
  STA $0095                                 ; $00DFC6 |

CODE_00DFC9:
  PHY                                       ; $00DFC9 |
  LDA #$0001                                ; $00DFCA |

CODE_00DFCD:
  STA $008F                                 ; $00DFCD |
  LDA $6000                                 ; $00DFD0 |
  STA $0091                                 ; $00DFD3 |
  LDA $6002                                 ; $00DFD6 |
  STA $0093                                 ; $00DFD9 |
  JSL $109295                               ; $00DFDC |
  PLY                                       ; $00DFE0 |
  RTS                                       ; $00DFE1 |

CODE_00DFE2:
  LDA #$0093                                ; $00DFE2 |
  INC !r_red_coins_amount                   ; $00DFE5 |
  LDY !r_red_coins_amount                   ; $00DFE8 |
  CPY #$0014                                ; $00DFEB |
  BMI CODE_00DFF1                           ; $00DFEE |
  INC A                                     ; $00DFF0 |

CODE_00DFF1:
  JSL push_sound_queue                      ; $00DFF1 |
  LDA #$0002                                ; $00DFF5 |
  STA $0006                                 ; $00DFF8 |
  SEP #$10                                  ; $00DFFB |
  LDA $6000                                 ; $00DFFD |
  AND #$FFF0                                ; $00E000 |
  STA $0000                                 ; $00E003 |
  LDA $6002                                 ; $00E006 |
  AND #$FFF0                                ; $00E009 |
  JSL $03A4F5                               ; $00E00C |
  REP #$10                                  ; $00E010 |
  RTS                                       ; $00E012 |

  JSR CODE_00DFE2                           ; $00E013 |
  RTL                                       ; $00E016 |

; r0 = #$000E
  LDA !gsu_r5                               ; $00E017 |  r5
  STA $0095                                 ; $00E01A |
  BRA CODE_00DFC9                           ; $00E01D |
  JSR CODE_00E023                           ; $00E01F |
  RTL                                       ; $00E022 |

; r0 = #$000C
CODE_00E023:
  JSR CODE_00DFC3                           ; $00E023 |
  PHY                                       ; $00E026 |
  LDA $0091                                 ; $00E027 |
  CLC                                       ; $00E02A |
  ADC #$0010                                ; $00E02B |
  STA $0091                                 ; $00E02E |
  JSL $109295                               ; $00E031 |
  LDA $0093                                 ; $00E035 |
  CLC                                       ; $00E038 |
  ADC #$0010                                ; $00E039 |
  STA $0093                                 ; $00E03C |
  JSL $109295                               ; $00E03F |
  LDA $6000                                 ; $00E043 |
  STA $0091                                 ; $00E046 |
  JSL $109295                               ; $00E049 |
  PLY                                       ; $00E04D |
  RTS                                       ; $00E04E |

; r0 = #$0004
  PHY                                       ; $00E04F |
  LDA $6000                                 ; $00E050 |
  STA $0091                                 ; $00E053 |
  LDA $6002                                 ; $00E056 |
  STA $0093                                 ; $00E059 |
  LDA #$0000                                ; $00E05C |
  STA $008F                                 ; $00E05F |
  JSL $109295                               ; $00E062 |
  PLY                                       ; $00E066 |
  RTS                                       ; $00E067 |

; r0 = #$0018
  PHY                                       ; $00E068 |
  LDA $6000                                 ; $00E069 |
  STA $0091                                 ; $00E06C |
  LDA $6002                                 ; $00E06F |
  STA $0093                                 ; $00E072 |
  LDA #$0006                                ; $00E075 |
  STA $008F                                 ; $00E078 |
  JSL $109295                               ; $00E07B |
  PLY                                       ; $00E07F |
  RTS                                       ; $00E080 |

  dw $0000, $0000, $0000, $2A0D             ; $00E081 |
  dw $0000, $0000, $0000, $2A1C             ; $00E089 |
  dw $0000, $0000, $0000, $2A2B             ; $00E091 |
  dw $0000, $0000, $0000, $2A3A             ; $00E099 |
  dw $0000, $0000, $0000, $964C             ; $00E0A1 |

; r0 = #$0006
  PHY                                       ; $00E0A9 |
  LDA !gsu_r6                               ; $00E0AA |  r6
  AND #$00FF                                ; $00E0AD |
  ASL A                                     ; $00E0B0 |
  TAX                                       ; $00E0B1 |
  LDA $00E081,x                             ; $00E0B2 |
  STA $95                                   ; $00E0B6 |
  LDA $6000                                 ; $00E0B8 |
  STA $91                                   ; $00E0BB |
  LDA $6002                                 ; $00E0BD |
  STA $93                                   ; $00E0C0 |
  LDA #$0004                                ; $00E0C2 |
  STA $8F                                   ; $00E0C5 |
  JSL $109295                               ; $00E0C7 |
  PLY                                       ; $00E0CB |
  RTS                                       ; $00E0CC |

; r0 = #$0008
  PHY                                       ; $00E0CD |
  LDX !gsu_r1                               ; $00E0CE |  r1
  JSL $03BF87                               ; $00E0D1 |
  PLY                                       ; $00E0D5 |
  RTS                                       ; $00E0D6 |

; r0 = #$0010
  LDA !r_header_bg3_tileset                 ; $00E0D7 |
  CMP #$000A                                ; $00E0DA |
  BNE CODE_00E0E5                           ; $00E0DD |
  PHY                                       ; $00E0DF |
  JSL $04F1F6                               ; $00E0E0 |
  PLY                                       ; $00E0E4 |

CODE_00E0E5:
  RTS                                       ; $00E0E5 |

; r0 = #$0012
  LDA $0CCA                                 ; $00E0E6 |
  BNE CODE_00E0F1                           ; $00E0E9 |
  PHY                                       ; $00E0EB |
  JSL $04AC9C                               ; $00E0EC |
  PLY                                       ; $00E0F0 |

CODE_00E0F1:
  RTS                                       ; $00E0F1 |

; r0 = #$0014
  PHY                                       ; $00E0F2 |
  SEP #$10                                  ; $00E0F3 |
  JSL $03A853                               ; $00E0F5 |
  REP #$10                                  ; $00E0F9 |
  PLY                                       ; $00E0FB |
  RTS                                       ; $00E0FC |

  dw $0080, $FF80                           ; $00E0FD |

; r0 = #$001A
  LDA $0CCA                                 ; $00E101 |
  BNE CODE_00E125                           ; $00E104 |
  PHY                                       ; $00E106 |
  LDA #$0028                                ; $00E107 |
  JSL player_death                          ; $00E10A |
  LDA #$FB00                                ; $00E10E |
  STA !s_player_y_speed                     ; $00E111 |
  LDX !s_player_direction                   ; $00E114 |
  LDA $00E0FD,x                             ; $00E117 |
  STA !s_player_x_speed_prev                ; $00E11B |
  LDA #$0020                                ; $00E11E |
  STA $61F6                                 ; $00E121 |
  PLY                                       ; $00E124 |

CODE_00E125:
  RTS                                       ; $00E125 |

; r0 = #$001C
  PHY                                       ; $00E126 |
  LDA $6000                                 ; $00E127 |
  STA $007972                               ; $00E12A |
  SEP #$10                                  ; $00E12E |
  TAX                                       ; $00E130 |
  LDA !s_spr_id,x                           ; $00E131 |
  CMP #$0115                                ; $00E134 |
  BEQ CODE_00E144                           ; $00E137 |
  CMP #$0065                                ; $00E139 |
  BNE CODE_00E14A                           ; $00E13C |
  JSL $0CEA92                               ; $00E13E |
  BRA CODE_00E14E                           ; $00E142 |

CODE_00E144:
  JSL $04CA27                               ; $00E144 |
  BRA CODE_00E14E                           ; $00E148 |

CODE_00E14A:
  JSL $0EB499                               ; $00E14A |

CODE_00E14E:
  REP #$10                                  ; $00E14E |
  PLY                                       ; $00E150 |
  RTS                                       ; $00E151 |

r_gsu_init_5 = $7EE152
gsu_init_5:
  PHB                                       ; $00E152 |  preserve bank
  STZ !gsu_sfr                              ; $00E153 |  nuke status/flag register
  LDY $012D                                 ; $00E156 |\ set SCBR
  STY !gsu_scbr                             ; $00E159 |/
  LDY $012E                                 ; $00E15C |\ set SCMR
  STY !gsu_scmr                             ; $00E15F |/
  STX !gsu_pbr                              ; $00E162 |  set PBR
  STA !gsu_r15                              ; $00E165 |  set program counter
  LDA $011A                                 ; $00E168 |
  BEQ CODE_00E170                           ; $00E16B |
  JMP CODE_00E225                           ; $00E16D |

CODE_00E170:
  PHK                                       ; $00E170 |
  PLB                                       ; $00E171 |
  REP #$10                                  ; $00E172 |
  LDX $04                                   ; $00E174 |
  LDY $06                                   ; $00E176 |
  LDA #$000C                                ; $00E178 |
  STA $0C                                   ; $00E17B |

CODE_00E17D:
  CPX #$01FE                                ; $00E17D |
  BCC CODE_00E188                           ; $00E180 |
  STZ $0E                                   ; $00E182 |
  LDA $3F                                   ; $00E184 |
  BRA CODE_00E1EE                           ; $00E186 |

CODE_00E188:
  TYA                                       ; $00E188 |
  LSR A                                     ; $00E189 |
  LSR A                                     ; $00E18A |
  STA $08                                   ; $00E18B |
  CLC                                       ; $00E18D |
  ADC #$0008                                ; $00E18E |
  CMP #$0020                                ; $00E191 |
  BCC CODE_00E199                           ; $00E194 |
  LDA #$0020                                ; $00E196 |

CODE_00E199:
  ASL A                                     ; $00E199 |
  STA $0A                                   ; $00E19A |
  LDA $E9D4,x                               ; $00E19C |
  PHP                                       ; $00E19F |
  BPL CODE_00E1A6                           ; $00E1A0 |
  EOR #$FFFF                                ; $00E1A2 |
  INC A                                     ; $00E1A5 |

CODE_00E1A6:
  CMP #$0100                                ; $00E1A6 |
  SEP #$20                                  ; $00E1A9 |
  XBA                                       ; $00E1AB |
  LDA $0A                                   ; $00E1AC |
  BCS CODE_00E1C4                           ; $00E1AE |
  STA $004202                               ; $00E1B0 |
  XBA                                       ; $00E1B4 |
  STA $004203                               ; $00E1B5 |
  NOP                                       ; $00E1B9 |
  NOP                                       ; $00E1BA |
  NOP                                       ; $00E1BB |
  REP #$20                                  ; $00E1BC |
  LDA $004217                               ; $00E1BE |
  BRA CODE_00E1C6                           ; $00E1C2 |

CODE_00E1C4:
  REP #$20                                  ; $00E1C4 |

CODE_00E1C6:
  AND #$00FF                                ; $00E1C6 |
  LSR A                                     ; $00E1C9 |
  LSR A                                     ; $00E1CA |
  LSR A                                     ; $00E1CB |
  LSR A                                     ; $00E1CC |
  PLP                                       ; $00E1CD |
  BPL CODE_00E1D4                           ; $00E1CE |
  EOR #$FFFF                                ; $00E1D0 |
  INC A                                     ; $00E1D3 |

CODE_00E1D4:
  STA $0E                                   ; $00E1D4 |
  CLC                                       ; $00E1D6 |
  ADC $08                                   ; $00E1D7 |
  AND #$00FF                                ; $00E1D9 |
  CMP #$0030                                ; $00E1DC |
  LDA $0E                                   ; $00E1DF |
  BCC CODE_00E1EB                           ; $00E1E1 |
  LDA $08                                   ; $00E1E3 |
  EOR #$FFFF                                ; $00E1E5 |
  ADC #$002F                                ; $00E1E8 |

CODE_00E1EB:
  CLC                                       ; $00E1EB |
  ADC $3F                                   ; $00E1EC |

CODE_00E1EE:
  STA $55C6,y                               ; $00E1EE |
  LDA $0E                                   ; $00E1F1 |
  STA $55C4,y                               ; $00E1F3 |
  PHX                                       ; $00E1F6 |
  TXA                                       ; $00E1F7 |
  CMP #$01FE                                ; $00E1F8 |
  BCC CODE_00E200                           ; $00E1FB |
  LDA #$01FE                                ; $00E1FD |

CODE_00E200:
  LSR A                                     ; $00E200 |
  AND #$00FC                                ; $00E201 |
  TAX                                       ; $00E204 |
  LDA $54C2,x                               ; $00E205 |
  STA $53C2,y                               ; $00E208 |
  PLA                                       ; $00E20B |
  SEC                                       ; $00E20C |
  SBC #$0010                                ; $00E20D |
  AND #$07FE                                ; $00E210 |
  TAX                                       ; $00E213 |
  INY                                       ; $00E214 |
  INY                                       ; $00E215 |
  INY                                       ; $00E216 |
  INY                                       ; $00E217 |
  DEC $0C                                   ; $00E218 |
  BEQ CODE_00E21F                           ; $00E21A |
  JMP CODE_00E17D                           ; $00E21C |

CODE_00E21F:
  STX $04                                   ; $00E21F |
  STY $06                                   ; $00E221 |
  SEP #$10                                  ; $00E223 |

CODE_00E225:
  PLB                                       ; $00E225 |
  LDA #$0020                                ; $00E226 |\ start GSU execution

CODE_00E229:
  BIT !gsu_sfr                              ; $00E229 |/\
  BNE CODE_00E229                           ; $00E22C | / wait for GSU execution to end
  LDY #$00                                  ; $00E22E |\
  STY !gsu_scmr                             ; $00E230 |/ give SCPU ROM/RAM bus access
  RTL                                       ; $00E233 |

  dw $0064,$000A                            ; $00E234 |
  dw $000A,$FFF6                            ; $00E238 |
  dw $012C,$0000                            ; $00E23C |

CODE_00E240:
  REP #$10                                  ; $00E240 |
  LDA !r_extra_lives                        ; $00E242 |\
  CMP #$03E8                                ; $00E245 | |
  BCC CODE_00E25E                           ; $00E248 | | Prevents the player from getting >999 lives
  LDA #$03E7                                ; $00E24A | |
  STA !r_extra_lives                        ; $00E24D |/
  LDA !r_1ups_collected                     ; $00E250 |
  CMP #$03E8                                ; $00E253 |
  BCC CODE_00E25E                           ; $00E256 |
  LDA #$03E7                                ; $00E258 |
  STA !r_1ups_collected                     ; $00E25B |

CODE_00E25E:
  STZ $0389                                 ; $00E25E |
  INC $03A9                                 ; $00E261 |
  LDY #$0000                                ; $00E264 |
  LDA !r_star_autoincrease                  ; $00E267 |
  BEQ CODE_00E2B5                           ; $00E26A |
  BPL CODE_00E270                           ; $00E26C |
  INY                                       ; $00E26E |
  INY                                       ; $00E26F |

CODE_00E270:
  LDA $0B57                                 ; $00E270 |
  BNE CODE_00E27D                           ; $00E273 |
  LDA $03A9                                 ; $00E275 |
  CMP #$0008                                ; $00E278 |
  BCC CODE_00E2B3                           ; $00E27B |

CODE_00E27D:
  LDA #$0036                                ; $00E27D |
  JSR CODE_00E372                           ; $00E280 |
  STZ $03A9                                 ; $00E283 |
  LDA !r_stars_amount                       ; $00E286 |
  CLC                                       ; $00E289 |
  ADC $E238,y                               ; $00E28A |
  BMI CODE_00E297                           ; $00E28D |
  STA !r_stars_amount                       ; $00E28F |
  CMP $E23C,y                               ; $00E292 |
  BCC CODE_00E2A3                           ; $00E295 |

CODE_00E297:
  LDA $E23C,y                               ; $00E297 |
  STA !r_stars_amount                       ; $00E29A |
  STZ !r_star_autoincrease                  ; $00E29D |
  JMP CODE_00E32C                           ; $00E2A0 |

CODE_00E2A3:
  LDA !r_star_autoincrease                  ; $00E2A3 |
  SEC                                       ; $00E2A6 |
  SBC $E238,y                               ; $00E2A7 |
  STA !r_star_autoincrease                  ; $00E2AA |
  TYA                                       ; $00E2AD |
  BNE CODE_00E2B3                           ; $00E2AE |
  INC $0389                                 ; $00E2B0 |

CODE_00E2B3:
  BRA CODE_00E32C                           ; $00E2B3 |

CODE_00E2B5:
  LDA $0387                                 ; $00E2B5 |
  BMI CODE_00E2CC                           ; $00E2B8 |
  BNE CODE_00E32C                           ; $00E2BA |
  LDA $0B57                                 ; $00E2BC |
  ORA $0B65                                 ; $00E2BF |
  ORA $0B7B                                 ; $00E2C2 |
  ORA !r_msg_box_state                      ; $00E2C5 |
  BEQ CODE_00E2F5                           ; $00E2C8 |
  BRA CODE_00E32C                           ; $00E2CA |

CODE_00E2CC:
  LDA !r_stars_amount                       ; $00E2CC |
  CMP #$006D                                ; $00E2CF |
  BCS CODE_00E32C                           ; $00E2D2 |
  INC $0394                                 ; $00E2D4 |
  LDA $0394                                 ; $00E2D7 |
  CMP #$000C                                ; $00E2DA |
  BCC CODE_00E32C                           ; $00E2DD |
  STZ $0394                                 ; $00E2DF |
  INC !r_stars_amount                       ; $00E2E2 |
  LDA !r_stars_amount                       ; $00E2E5 |
  CMP #$0064                                ; $00E2E8 |
  BNE CODE_00E32C                           ; $00E2EB |
  LDA #$0032                                ; $00E2ED |
  JSR CODE_00E372                           ; $00E2F0 |
  BRA CODE_00E32C                           ; $00E2F3 |

CODE_00E2F5:
  STZ $0394                                 ; $00E2F5 |
  LDA $0C8A                                 ; $00E2F8 |
  BNE CODE_00E36F                           ; $00E2FB |
  LDA !r_stars_amount                       ; $00E2FD |
  BEQ CODE_00E36F                           ; $00E300 |
  INC $0392                                 ; $00E302 |
  LDA $0392                                 ; $00E305 |
  CMP #$0004                                ; $00E308 |
  BCC CODE_00E32C                           ; $00E30B |
  STZ $0392                                 ; $00E30D |
  DEC !r_stars_amount                       ; $00E310 |
  LDA !r_stars_amount                       ; $00E313 |
  CMP #$005A                                ; $00E316 |
  BCS CODE_00E32C                           ; $00E319 |
  LDA $03AB                                 ; $00E31B |
  AND #$00FF                                ; $00E31E |
  BNE CODE_00E32C                           ; $00E321 |
  INC $03AB                                 ; $00E323 |
  LDA #$0024                                ; $00E326 |
  JSR CODE_00E372                           ; $00E329 |

CODE_00E32C:
  LDX #$0000                                ; $00E32C |
  LDA !r_stars_amount                       ; $00E32F |
  CMP #$03E8                                ; $00E332 |
  BCC CODE_00E33D                           ; $00E335 |
  LDA #$03E7                                ; $00E337 |
  STA !r_stars_amount                       ; $00E33A |

CODE_00E33D:
  LDY #$0000                                ; $00E33D |

CODE_00E340:
  CMP $E234,x                               ; $00E340 |
  BCC CODE_00E34B                           ; $00E343 |
  SBC $E234,x                               ; $00E345 |
  INY                                       ; $00E348 |
  BRA CODE_00E340                           ; $00E349 |

CODE_00E34B:
  STY $00,x                                 ; $00E34B |
  INX                                       ; $00E34D |
  INX                                       ; $00E34E |
  CPX #$0004                                ; $00E34F |
  BNE CODE_00E33D                           ; $00E352 |
  STA $00,x                                 ; $00E354 |
  LDA $00                                   ; $00E356 |
  STA $03A1                                 ; $00E358 |
  LDA $02                                   ; $00E35B |
  STA $03A3                                 ; $00E35D |
  LDA $04                                   ; $00E360 |
  STA $03A5                                 ; $00E362 |
  BNE CODE_00E36F                           ; $00E365 |
  LDA $0392                                 ; $00E367 |
  BNE CODE_00E36F                           ; $00E36A |
  INC $0389                                 ; $00E36C |

CODE_00E36F:
  SEP #$10                                  ; $00E36F |
  RTS                                       ; $00E371 |

CODE_00E372:
  PHX                                       ; $00E372 |
  LDX $57                                   ; $00E373 |\
  STA !r_sound_queue_dp,x                   ; $00E375 | | play sound
  INC $57                                   ; $00E377 |/
  PLX                                       ; $00E379 |
  RTS                                       ; $00E37A |

prepare_tilemap_dma_queue_l:
  PHB                                       ; $00E37B |
  PHK                                       ; $00E37C |
  PLB                                       ; $00E37D |
  JSR prepare_tilemap_dma_queue             ; $00E37E |
  PLB                                       ; $00E381 |
  RTL                                       ; $00E382 |

tilemap_dma_queue_pointers:
  dl $7E4002                                ; $00E383 | Default RAM queue
  dl $008275                                ; $00E386 | empty
  dl $178008                                ; $00E389 | Island cutscene init
  dl $01E8F2                                ; $00E38C | BG3 tilemap init
  dl $01B62D                                ; $00E38F | Score screen BG1 tilemap inits
  dl $01B976                                ; $00E392 | Score Screen BG3 tilemap data
  dl $178000                                ; $00E395 | Island graphics init
  dl $0FBC9E                                ; $00E398 | tilemap init (map, story, title init)
  dl $01B6C1                                ; $00E39B | Score Screen BG3 tilemap init
  dl $01E8FA                                ; $00E39E | In level BG3 tilemap init
  dl $01E542                                ; $00E3A1 | Retry Screen init & tilemap
  dl $01E902                                ; $00E3A4 | In level BG3 tilemap init
  dl $10E1D2                                ; $00E3A7 | Credits Screen BG1 tilemap init

; Prepare to process a tilemap DMA queue
; Defaults back to $7E4002 after it's done
; $0127 is index for what queue to process
prepare_tilemap_dma_queue:
  REP #$10                                  ; $00E3AA |
  LDY $0127                                 ; $00E3AC | Load queue pointer index
  LDX tilemap_dma_queue_pointers,y          ; $00E3AF | address
  LDA tilemap_dma_queue_pointers+2,y        ; $00E3B2 | bank
  JSR process_tilemap_dma_queue             ; $00E3B5 | Process queue until all entries are done
  LDA $0127                                 ; $00E3B8 |\
  BNE .ret                                  ; $00E3BB | | If RAM Queue was just processed
  STA $7E4000                               ; $00E3BD | | Set size pointer to 00
  STA $7E4001                               ; $00E3C1 | | And set end marker at first entry
  DEC A                                     ; $00E3C5 | |
  STA $7E4003                               ; $00E3C6 |/

.ret
  STZ $0127                                 ; $00E3CA |\ Defalt Queue to RAM queue
  RTS                                       ; $00E3CD |/ And return

; DMA queue address
  dw $4800                                  ; $00E3CE |

; DMA queue bank
  db $7E,$2A,$B7,$11,$44,$B7,$11            ; $00E3D0 |

process_vram_dma_queue_l:
  PHB                                       ; $00E3D7 |
  PHK                                       ; $00E3D8 |
  PLB                                       ; $00E3D9 |
  JSR process_vram_dma_queue                ; $00E3DA |
  PLB                                       ; $00E3DD |
  RTL                                       ; $00E3DE |

; perform DMA's that are queued in $7E4800
process_vram_dma_queue:
  REP #$10                                  ; $00E3DF |
  LDX $0129                                 ; $00E3E1 | which queue (there's only 1, $7E4800)
  LDY $E3CE,x                               ; $00E3E4 |\ DMA queue address
  LDA $E3D0,x                               ; $00E3E7 |/ & bank ($7E4800)
  PHB                                       ; $00E3EA |\
  PHA                                       ; $00E3EB | | preserve & set data bank to $7E
  PLB                                       ; $00E3EC |/
  STA $00                                   ; $00E3ED |
  REP #$20                                  ; $00E3EF |
  LDA $0000,y                               ; $00E3F1 |\  $4800 holds the end of queue
  STA $04                                   ; $00E3F4 | | if it is $4802 then we have nothing
  CMP #$4802                                ; $00E3F6 | | so branch to RTS
  BEQ .ret                                  ; $00E3F9 |/
  INY                                       ; $00E3FB |\ start loop off at $4802
  INY                                       ; $00E3FC |/

; loops through DMA queue in sets of 12-byte entries
; let e = current entry in loop, indexes from 0 to B
.loop_queue
  LDA $0000,y                               ; $00E3FD |\ e[0:1] ->
  STA $002116                               ; $00E400 |/ VRAM destination address
  LDA $0004,y                               ; $00E404 |\  e[4] ->
  STA $004301                               ; $00E407 | | DMA destination register
  LDA $0006,y                               ; $00E40B | | e[5:7] ->
  STA $004303                               ; $00E40E |/  long source address
  LDA $0008,y                               ; $00E412 |\ e[8:9] ->
  STA $004305                               ; $00E415 |/ DMA size
  LDA $0002,y                               ; $00E419 |\  e[2] ->
  SEP #$20                                  ; $00E41C | | video port control
  STA $002115                               ; $00E41E |/
  XBA                                       ; $00E422 |\ e[3] ->
  STA $004300                               ; $00E423 |/ DMA control
  LDA #$01                                  ; $00E427 |\
  STA $00420B                               ; $00E429 |/ begin DMA
  REP #$20                                  ; $00E42D |
  LDA $000A,y                               ; $00E42F |\
  TAY                                       ; $00E432 | | e[A:B] ->
  CMP $04                                   ; $00E433 | | address of next entry
  BNE .loop_queue                           ; $00E435 |/  in queue

  LDA $000129                               ; $00E437 |\ if queue is not $4800,
  BNE .ret                                  ; $00E43B |/ don't bother cleaning it
  LDA #$4802                                ; $00E43D |\ reset end of queue
  STA $4800                                 ; $00E440 |/ address to default (empty)

.ret
  PLB                                       ; $00E443 |\ clean up by restoring data bank
  STZ $0129                                 ; $00E444 |/ and clearing DMA queue index
  SEP #$30                                  ; $00E447 |
  RTS                                       ; $00E449 |

; VRAM tilemap DMA Queue start
; Queue Format:
;   e[0:1]: xvvv vvvv vvvv vvvv
;      x = End of queue marker
;      v = VRAM destination/source address
;   e[2:3]: vidt tttt tttt tttt
;       t = transfer size - 1 (will also act as queue size)
;       v = column transfer (32 byte increase if set, otherwise 1)
;       i = Does a fixed transfer if set (init data)
;       d = Direction, does a read of VRAM if set (otherwise write)
; if d == 1
;   (Read Tilemap)
;   Read from VRAM address and write to destination
;   e[4:6]
;     Long Destination address to write to
; if d == 0 and i == 0
;     (Write Tilemap)
;     Write to VRAM address using data from entry
;     e[4:t]
;         Data to DMA, size same as t
; if d == 0 and i == 1
;     (Init Tilemap)
;     Write to VRAM address floodfill using data from entry
;     e[4:5]
;         Word data to DMA
;
; Queue bank in A
; Queue Adress in X
process_tilemap_dma_queue:
  PHB                                       ; $00E44A |
  PHA                                       ; $00E44B |\
  PLB                                       ; $00E44C |/  Set bank from pointer
  STA $00                                   ; $00E44D |\  Save pointer bank
  REP #$20                                  ; $00E44F |/

; check end of queue
.check_end_marker
  LDY $0000,x                               ; $00E451 |   e[0:1]
  BPL .set_size_and_video_port              ; $00E454 |\
  SEP #$30                                  ; $00E456 | | if sign bit on, no more queue entries
  PLB                                       ; $00E458 | | Return if signed bit on first word
  RTS                                       ; $00E459 |/

.set_size_and_video_port
  LDA $0002,x                               ; $00E45A |  e[2:3]
  AND #%0001111111111111                    ; $00E45D |
  INC A                                     ; $00E460 |
  STA $01                                   ; $00E461 |\ save transfer size
  STA $03                                   ; $00E463 |/
  LDA #$0080                                ; $00E465 |  increment by 1 (rows)
  BIT $0002,x                               ; $00E468 |  sign bit handles column/row mode
  BPL .handle_transfer_direction            ; $00E46B |
  LDA #$0081                                ; $00E46D |  increment by 32 (column)

.handle_transfer_direction
  STA $002115                               ; $00E470 |  Video Port Control
  STA $05                                   ; $00E474 |
  TYA                                       ; $00E476 |  e[0:1]
  STA $002116                               ; $00E477 |  VRAM Adress
  LDA $0002,x                               ; $00E47B |  e[2:3]
  AND #%0010000000000000                    ; $00E47E |\ direction bit
  BEQ .handle_vram_write_entry              ; $00E481 |/
; Read from VRAM
  LDA #$0003                                ; $00E483 |\
  STA $03                                   ; $00E486 |/ queue entry size = 7 bytes
  LDA $0004,x                               ; $00E488 |  e[4:5]
  STA $004302                               ; $00E48B |  DMA Source Low Address
  LDA $0005,x                               ; $00E48F |  e[5:6]
  STA $004303                               ; $00E492 |  DMA Source High Adress (and bank)
  LDA $002139                               ; $00E496 |  Increment VRAM address
  LDA #$3981                                ; $00E49A |  Set direction to read from VRAM
  BRA .enable_transfer                      ; $00E49D |

.handle_vram_write_entry
  LDA $00                                   ; $00E49F | Set
  STA $004304                               ; $00E4A1 | DMA Source Bank
  LDY #$1801                                ; $00E4A5 |
  BVC .set_destination_address              ; $00E4A8 | Continue if bit 5 of byte 4 set
;  Fixed Transfer write to VRAM
  LSR $01                                   ; $00E4AA |
  LDA #$0002                                ; $00E4AC |\ queue entry size 2+4 = 6
  STA $03                                   ; $00E4AF |/
  LDA #$1908                                ; $00E4B1 | Set fixed transfer
  STA $004300                               ; $00E4B4 | DMA control
  TXA                                       ; $00E4B8 |
  CLC                                       ; $00E4B9 |
  ADC #$0005                                ; $00E4BA |
  STA $004302                               ; $00E4BD | DMA Source Address
  LDA $01                                   ; $00E4C1 |
  STA $004305                               ; $00E4C3 | DMA Size
  LDA #$0100                                ; $00E4C7 |\
  STA $00420A                               ; $00E4CA |/ Enable DMA channel 0
  LDA $05                                   ; $00E4CE |
  AND #$007F                                ; $00E4D0 |
  STA $002115                               ; $00E4D3 | Video Port Control
  LDA $0000,x                               ; $00E4D7 |
  STA $002116                               ; $00E4DA | VRAM Address
  LDY #$1808                                ; $00E4DE |

.set_destination_address
  TXA                                       ; $00E4E1 |
  CLC                                       ; $00E4E2 |
  ADC #$0004                                ; $00E4E3 |
  STA $004302                               ; $00E4E6 | DMA Source Address
  TYA                                       ; $00E4EA |

.enable_transfer
  STA $004300                               ; $00E4EB | DMA Control & Destination Reg
  LDA $01                                   ; $00E4EF |
  STA $004305                               ; $00E4F1 | DMA Size
  LDA #$0100                                ; $00E4F5 |
  STA $00420A                               ; $00E4F8 | Enable DMA channel 0
  TXA                                       ; $00E4FC |
  CLC                                       ; $00E4FD |
  ADC #$0004                                ; $00E4FE |\
  ADC $03                                   ; $00E501 | | add entry size and go to next item in queue
  TAX                                       ; $00E503 | |
  JMP .check_end_marker                     ; $00E504 |/


CODE_00E507:
  LDA !reg_hvbjoy                           ; $00E507 |\
  LSR A                                     ; $00E50A | | wait till auto-joypad read
  BCS CODE_00E507                           ; $00E50B |/
  REP #$30                                  ; $00E50D |

update_controllers:
  LDA !reg_joy1l                            ; $00E50F |\  load controller 1 data
  BIT #$000F                                ; $00E512 | | if invalid bits are on
  BEQ CODE_00E51A                           ; $00E515 | |
  LDA #$0000                                ; $00E517 | | then just store 0

CODE_00E51A:
  STA !r_joy1_lo                            ; $00E51A | | store controller 1 data (or 0)
  TAY                                       ; $00E51D | |
  EOR !r_joy1_lo_prev                       ; $00E51E | |\  xor with previous data gets you bits
  AND !r_joy1_lo                            ; $00E521 | | | that were not on before but are now
  STA !r_joy1_lo_press                      ; $00E524 | |/  hence, store onpress 1 data
  STY !r_joy1_lo_prev                       ; $00E527 |/  store previous controller 1 data
  LDA !reg_joy2l                            ; $00E52A |\  load controller 2 data
  BIT #$000F                                ; $00E52D | | if invalid bits are on
  BEQ CODE_00E535                           ; $00E530 | |
  LDA #$0000                                ; $00E532 | | then just store 0

CODE_00E535:
  STA !r_joy2_lo                            ; $00E535 | | store controller data 2 (or 0)
  TAY                                       ; $00E538 | |
  EOR !r_joy2_lo_prev                       ; $00E539 | |\  xor with previous data gets you bits
  AND !r_joy2_lo                            ; $00E53C | | | that were not on before but are now
  STA !r_joy2_lo_press                      ; $00E53F | |/  hence, store onpress 2 data
  STY !r_joy2_lo_prev                       ; $00E542 |/  store previous controller 2 data
  LDA !r_joy1_lo                            ; $00E545 |
  STA $35                                   ; $00E548 | mirror controller 1 in $0035
  LDA !r_joy1_lo_press                      ; $00E54A |
  STA $37                                   ; $00E54D | and controller 1 onpress in $0037
  SEP #$30                                  ; $00E54F |
  RTS                                       ; $00E551 |

; 1024 bytes moved to $702200
; division lookup table for gsu: 1/x
  dw $FFFF, $FFFF, $8000, $5555             ; $00E552 |
  dw $4000, $3333, $2AAA, $2492             ; $00E55A |
  dw $2000, $1C71, $1999, $1745             ; $00E562 |
  dw $1555, $13B1, $1249, $1111             ; $00E56A |
  dw $1000, $0F0F, $0E38, $0D79             ; $00E572 |
  dw $0CCC, $0C30, $0BA2, $0B21             ; $00E57A |
  dw $0AAA, $0A3D, $09D8, $097B             ; $00E582 |
  dw $0924, $08D3, $0888, $0842             ; $00E58A |
  dw $0800, $07C1, $0787, $0750             ; $00E592 |
  dw $071C, $06EB, $06BC, $0690             ; $00E59A |
  dw $0666, $063E, $0618, $05F4             ; $00E5A2 |
  dw $05D1, $05B0, $0590, $0572             ; $00E5AA |
  dw $0555, $0539, $051E, $0505             ; $00E5B2 |
  dw $04EC, $04D4, $04BD, $04A7             ; $00E5BA |
  dw $0492, $047D, $0469, $0456             ; $00E5C2 |
  dw $0444, $0432, $0421, $0410             ; $00E5CA |
  dw $0400, $03F0, $03E0, $03D2             ; $00E5D2 |
  dw $03C3, $03B5, $03A8, $039B             ; $00E5DA |
  dw $038E, $0381, $0375, $0369             ; $00E5E2 |
  dw $035E, $0353, $0348, $033D             ; $00E5EA |
  dw $0333, $0329, $031F, $0315             ; $00E5F2 |
  dw $030C, $0303, $02FA, $02F1             ; $00E5FA |
  dw $02E8, $02E0, $02D8, $02D0             ; $00E602 |
  dw $02C8, $02C0, $02B9, $02B1             ; $00E60A |
  dw $02AA, $02A3, $029C, $0295             ; $00E612 |
  dw $028F, $0288, $0282, $027C             ; $00E61A |
  dw $0276, $0270, $026A, $0264             ; $00E622 |
  dw $025E, $0259, $0253, $024E             ; $00E62A |
  dw $0249, $0243, $023E, $0239             ; $00E632 |
  dw $0234, $0230, $022B, $0226             ; $00E63A |
  dw $0222, $021D, $0219, $0214             ; $00E642 |
  dw $0210, $020C, $0208, $0204             ; $00E64A |
  dw $0200, $01FC, $01F8, $01F4             ; $00E652 |
  dw $01F0, $01EC, $01E9, $01E5             ; $00E65A |
  dw $01E1, $01DE, $01DA, $01D7             ; $00E662 |
  dw $01D4, $01D0, $01CD, $01CA             ; $00E66A |
  dw $01C7, $01C3, $01C0, $01BD             ; $00E672 |
  dw $01BA, $01B7, $01B4, $01B2             ; $00E67A |
  dw $01AF, $01AC, $01A9, $01A6             ; $00E682 |
  dw $01A4, $01A1, $019E, $019C             ; $00E68A |
  dw $0199, $0197, $0194, $0192             ; $00E692 |
  dw $018F, $018D, $018A, $0188             ; $00E69A |
  dw $0186, $0183, $0181, $017F             ; $00E6A2 |
  dw $017D, $017A, $0178, $0176             ; $00E6AA |
  dw $0174, $0172, $0170, $016E             ; $00E6B2 |
  dw $016C, $016A, $0168, $0166             ; $00E6BA |
  dw $0164, $0162, $0160, $015E             ; $00E6C2 |
  dw $015C, $015A, $0158, $0157             ; $00E6CA |
  dw $0155, $0153, $0151, $0150             ; $00E6D2 |
  dw $014E, $014C, $014A, $0149             ; $00E6DA |
  dw $0147, $0146, $0144, $0142             ; $00E6E2 |
  dw $0141, $013F, $013E, $013C             ; $00E6EA |
  dw $013B, $0139, $0138, $0136             ; $00E6F2 |
  dw $0135, $0133, $0132, $0130             ; $00E6FA |
  dw $012F, $012E, $012C, $012B             ; $00E702 |
  dw $0129, $0128, $0127, $0125             ; $00E70A |
  dw $0124, $0123, $0121, $0120             ; $00E712 |
  dw $011F, $011E, $011C, $011B             ; $00E71A |
  dw $011A, $0119, $0118, $0116             ; $00E722 |
  dw $0115, $0114, $0113, $0112             ; $00E72A |
  dw $0111, $010F, $010E, $010D             ; $00E732 |
  dw $010C, $010B, $010A, $0109             ; $00E73A |
  dw $0108, $0107, $0106, $0105             ; $00E742 |
  dw $0104, $0103, $0102, $0101             ; $00E74A |
  dw $0100, $00FF, $00FE, $00FD             ; $00E752 |
  dw $00FC, $00FB, $00FA, $00F9             ; $00E75A |
  dw $00F8, $00F7, $00F6, $00F5             ; $00E762 |
  dw $00F4, $00F3, $00F2, $00F1             ; $00E76A |
  dw $00F0, $00F0, $00EF, $00EE             ; $00E772 |
  dw $00ED, $00EC, $00EB, $00EA             ; $00E77A |
  dw $00EA, $00E9, $00E8, $00E7             ; $00E782 |
  dw $00E6, $00E5, $00E5, $00E4             ; $00E78A |
  dw $00E3, $00E2, $00E1, $00E1             ; $00E792 |
  dw $00E0, $00DF, $00DE, $00DE             ; $00E79A |
  dw $00DD, $00DC, $00DB, $00DB             ; $00E7A2 |
  dw $00DA, $00D9, $00D9, $00D8             ; $00E7AA |
  dw $00D7, $00D6, $00D6, $00D5             ; $00E7B2 |
  dw $00D4, $00D4, $00D3, $00D2             ; $00E7BA |
  dw $00D2, $00D1, $00D0, $00D0             ; $00E7C2 |
  dw $00CF, $00CE, $00CE, $00CD             ; $00E7CA |
  dw $00CC, $00CC, $00CB, $00CA             ; $00E7D2 |
  dw $00CA, $00C9, $00C9, $00C8             ; $00E7DA |
  dw $00C7, $00C7, $00C6, $00C5             ; $00E7E2 |
  dw $00C5, $00C4, $00C4, $00C3             ; $00E7EA |
  dw $00C3, $00C2, $00C1, $00C1             ; $00E7F2 |
  dw $00C0, $00C0, $00BF, $00BF             ; $00E7FA |
  dw $00BE, $00BD, $00BD, $00BC             ; $00E802 |
  dw $00BC, $00BB, $00BB, $00BA             ; $00E80A |
  dw $00BA, $00B9, $00B9, $00B8             ; $00E812 |
  dw $00B8, $00B7, $00B7, $00B6             ; $00E81A |
  dw $00B6, $00B5, $00B5, $00B4             ; $00E822 |
  dw $00B4, $00B3, $00B3, $00B2             ; $00E82A |
  dw $00B2, $00B1, $00B1, $00B0             ; $00E832 |
  dw $00B0, $00AF, $00AF, $00AE             ; $00E83A |
  dw $00AE, $00AD, $00AD, $00AC             ; $00E842 |
  dw $00AC, $00AC, $00AB, $00AB             ; $00E84A |
  dw $00AA, $00AA, $00A9, $00A9             ; $00E852 |
  dw $00A8, $00A8, $00A8, $00A7             ; $00E85A |
  dw $00A7, $00A6, $00A6, $00A5             ; $00E862 |
  dw $00A5, $00A5, $00A4, $00A4             ; $00E86A |
  dw $00A3, $00A3, $00A3, $00A2             ; $00E872 |
  dw $00A2, $00A1, $00A1, $00A1             ; $00E87A |
  dw $00A0, $00A0, $009F, $009F             ; $00E882 |
  dw $009F, $009E, $009E, $009D             ; $00E88A |
  dw $009D, $009D, $009C, $009C             ; $00E892 |
  dw $009C, $009B, $009B, $009A             ; $00E89A |
  dw $009A, $009A, $0099, $0099             ; $00E8A2 |
  dw $0099, $0098, $0098, $0098             ; $00E8AA |
  dw $0097, $0097, $0097, $0096             ; $00E8B2 |
  dw $0096, $0095, $0095, $0095             ; $00E8BA |
  dw $0094, $0094, $0094, $0093             ; $00E8C2 |
  dw $0093, $0093, $0092, $0092             ; $00E8CA |
  dw $0092, $0091, $0091, $0091             ; $00E8D2 |
  dw $0090, $0090, $0090, $0090             ; $00E8DA |
  dw $008F, $008F, $008F, $008E             ; $00E8E2 |
  dw $008E, $008E, $008D, $008D             ; $00E8EA |
  dw $008D, $008C, $008C, $008C             ; $00E8F2 |
  dw $008C, $008B, $008B, $008B             ; $00E8FA |
  dw $008A, $008A, $008A, $0089             ; $00E902 |
  dw $0089, $0089, $0089, $0088             ; $00E90A |
  dw $0088, $0088, $0087, $0087             ; $00E912 |
  dw $0087, $0087, $0086, $0086             ; $00E91A |
  dw $0086, $0086, $0085, $0085             ; $00E922 |
  dw $0085, $0084, $0084, $0084             ; $00E92A |
  dw $0084, $0083, $0083, $0083             ; $00E932 |
  dw $0083, $0082, $0082, $0082             ; $00E93A |
  dw $0082, $0081, $0081, $0081             ; $00E942 |
  dw $0081, $0080, $0080, $0080             ; $00E94A |
  dw $0080                                  ; $00E952 |

; mode 7 stuff?
; indexed by rotation value in Raphael boss fight
raphael_mode7_matrix_a_d:
  dw $0100, $0100, $0100, $00FF             ; $00E954 |
  dw $00FF, $00FE, $00FD, $00FC             ; $00E95C |
  dw $00FB, $00FA, $00F8, $00F7             ; $00E964 |
  dw $00F5, $00F3, $00F1, $00EF             ; $00E96C |
  dw $00ED, $00EA, $00E7, $00E5             ; $00E974 |
  dw $00E2, $00DF, $00DC, $00D8             ; $00E97C |
  dw $00D5, $00D1, $00CE, $00CA             ; $00E984 |
  dw $00C6, $00C2, $00BE, $00B9             ; $00E98C |
  dw $00B5, $00B1, $00AC, $00A7             ; $00E994 |
  dw $00A2, $009D, $0098, $0093             ; $00E99C |
  dw $008E, $0089, $0084, $007E             ; $00E9A4 |
  dw $0079, $0073, $006D, $0068             ; $00E9AC |
  dw $0062, $005C, $0056, $0050             ; $00E9B4 |
  dw $004A, $0044, $003E, $0038             ; $00E9BC |
  dw $0032, $002C, $0026, $001F             ; $00E9C4 |
  dw $0019, $0013, $000D, $0006             ; $00E9CC |
raphael_mode7_matrix_b_c:
  dw $0000, $FFFA, $FFF3, $FFED             ; $00E9D4 |
  dw $FFE7, $FFE1, $FFDA, $FFD4             ; $00E9DC |
  dw $FFCE, $FFC8, $FFC2, $FFBC             ; $00E9E4 |
  dw $FFB6, $FFB0, $FFAA, $FFA4             ; $00E9EC |
  dw $FF9E, $FF98, $FF93, $FF8D             ; $00E9F4 |
  dw $FF87, $FF82, $FF7C, $FF77             ; $00E9FC |
  dw $FF72, $FF6D, $FF68, $FF63             ; $00EA04 |
  dw $FF5E, $FF59, $FF54, $FF4F             ; $00EA0C |
  dw $FF4B, $FF47, $FF42, $FF3E             ; $00EA14 |
  dw $FF3A, $FF36, $FF32, $FF2F             ; $00EA1C |
  dw $FF2B, $FF28, $FF24, $FF21             ; $00EA24 |
  dw $FF1E, $FF1B, $FF19, $FF16             ; $00EA2C |
  dw $FF13, $FF11, $FF0F, $FF0D             ; $00EA34 |
  dw $FF0B, $FF09, $FF08, $FF06             ; $00EA3C |
  dw $FF05, $FF04, $FF03, $FF02             ; $00EA44 |
  dw $FF01, $FF01, $FF00, $FF00             ; $00EA4C |


  dw $FF00, $FF00, $FF00, $FF01             ; $00EA54 |
  dw $FF01, $FF02, $FF03, $FF04             ; $00EA5C |
  dw $FF05, $FF06, $FF08, $FF09             ; $00EA64 |
  dw $FF0B, $FF0D, $FF0F, $FF11             ; $00EA6C |
  dw $FF13, $FF16, $FF19, $FF1B             ; $00EA74 |
  dw $FF1E, $FF21, $FF24, $FF28             ; $00EA7C |
  dw $FF2B, $FF2F, $FF32, $FF36             ; $00EA84 |
  dw $FF3A, $FF3E, $FF42, $FF47             ; $00EA8C |
  dw $FF4B, $FF4F, $FF54, $FF59             ; $00EA94 |
  dw $FF5E, $FF63, $FF68, $FF6D             ; $00EA9C |
  dw $FF72, $FF77, $FF7C, $FF82             ; $00EAA4 |
  dw $FF87, $FF8D, $FF93, $FF98             ; $00EAAC |
  dw $FF9E, $FFA4, $FFAA, $FFB0             ; $00EAB4 |
  dw $FFB6, $FFBC, $FFC2, $FFC8             ; $00EABC |
  dw $FFCE, $FFD4, $FFDA, $FFE1             ; $00EAC4 |
  dw $FFE7, $FFED, $FFF3, $FFFA             ; $00EACC |
  dw $0000, $0006, $000D, $0013             ; $00EAD4 |
  dw $0019, $001F, $0026, $002C             ; $00EADC |
  dw $0032, $0038, $003E, $0044             ; $00EAE4 |
  dw $004A, $0050, $0056, $005C             ; $00EAEC |
  dw $0062, $0068, $006D, $0073             ; $00EAF4 |
  dw $0079, $007E, $0084, $0089             ; $00EAFC |
  dw $008E, $0093, $0098, $009D             ; $00EB04 |
  dw $00A2, $00A7, $00AC, $00B1             ; $00EB0C |
  dw $00B5, $00B9, $00BE, $00C2             ; $00EB14 |
  dw $00C6, $00CA, $00CE, $00D1             ; $00EB1C |
  dw $00D5, $00D8, $00DC, $00DF             ; $00EB24 |
  dw $00E2, $00E5, $00E7, $00EA             ; $00EB2C |
  dw $00ED, $00EF, $00F1, $00F3             ; $00EB34 |
  dw $00F5, $00F7, $00F8, $00FA             ; $00EB3C |
  dw $00FB, $00FC, $00FD, $00FE             ; $00EB44 |
  dw $00FF, $00FF, $0100, $0100             ; $00EB4C |
  dw $0100, $0100, $0100, $00FF             ; $00EB54 |
  dw $00FF, $00FE, $00FD, $00FC             ; $00EB5C |
  dw $00FB, $00FA, $00F8, $00F7             ; $00EB64 |
  dw $00F5, $00F3, $00F1, $00EF             ; $00EB6C |
  dw $00ED, $00EA, $00E7, $00E5             ; $00EB74 |
  dw $00E2, $00DF, $00DC, $00D8             ; $00EB7C |
  dw $00D5, $00D1, $00CE, $00CA             ; $00EB84 |
  dw $00C6, $00C2, $00BE, $00B9             ; $00EB8C |
  dw $00B5, $00B1, $00AC, $00A7             ; $00EB94 |
  dw $00A2, $009D, $0098, $0093             ; $00EB9C |
  dw $008E, $0089, $0084, $007E             ; $00EBA4 |
  dw $0079, $0073, $006D, $0068             ; $00EBAC |
  dw $0062, $005C, $0056, $0050             ; $00EBB4 |
  dw $004A, $0044, $003E, $0038             ; $00EBBC |
  dw $0032, $002C, $0026, $001F             ; $00EBC4 |
  dw $0019, $0013, $000D, $0006             ; $00EBCC |

; level object data
  incbin level/level-10-obj.bin             ; $00EBD4 |
  incbin level/level-48-obj.bin             ; $00ECA1 |
  incbin level/level-78-obj.bin             ; $00EE40 |
  incbin level/level-A1-obj.bin             ; $00EFFE |
  incbin level/level-BE-obj.bin             ; $00F2C3 |
  incbin level/level-C8-obj.bin             ; $00F40A |
  incbin level/level-CF-obj.bin             ; $00F4EF |
  incbin level/level-D4-obj.bin             ; $00F50A |

; level sprite data
  incbin level/level-10-spr.bin             ; $00F614 |
  incbin level/level-48-spr.bin             ; $00F625 |
  incbin level/level-78-spr.bin             ; $00F678 |
  incbin level/level-A1-spr.bin             ; $00F6B3 |
  incbin level/level-BE-spr.bin             ; $00F71E |
  incbin level/level-C8-spr.bin             ; $00F750 |
  incbin level/level-CF-spr.bin             ; $00F773 |
  incbin level/level-D4-spr.bin             ; $00F77B |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7A7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7AF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7B7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7BF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7C7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7CF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7D7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7DF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7E7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7EF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7F7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F7FF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F807 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F80F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F817 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F81F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F827 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F82F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F837 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F83F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F847 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F84F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F857 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F85F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F867 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F86F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F877 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F87F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F887 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F88F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F897 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F89F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8A7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8AF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8B7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8BF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8C7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8CF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8D7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8DF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8E7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8EF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8F7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F8FF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F907 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F90F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F917 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F91F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F927 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F92F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F937 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F93F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F947 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F94F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F957 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F95F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F967 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F96F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F977 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F97F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F987 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F98F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F997 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F99F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9A7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9AF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9B7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9BF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9C7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9CF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9D7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9DF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9E7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9EF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9F7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00F9FF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FA9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FABF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FACF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FADF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FAFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FB9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FBFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FC9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FCFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FD9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FDFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FE9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FECF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FED7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FEFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FF97 |
  db $FF                                    ; $00FF9F |

buildtime:
  db $95, $07, $31                          ; $00FFA0 | build date (July 31st, 1995)
  db $11, $19                               ; $00FFA3 | build time (11:19 am)

; freespace, 11 bytes
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $00FFA5 |
  db $FF, $FF, $FF                          ; $00FFAD |

ROMRegistration:
  db $30,$31                                ; $00FFB0 | Maker code "01" (Nintendo)
  db $59,$49,$20,$20                        ; $00FFB2 | Game code: "YI  "
  db $00,$00,$00,$00,$00,$00                ; $00FFB6 | Reserved
  db $00                                    ; $00FFBC | FLASH size
  db $05                                    ; $00FFBD | 32KB RAM allotted to Super FX
  db $00                                    ; $00FFBE | Not a special version
  db $00                                    ; $00FFBF | Chipset sub-type

ROMSpecs:
  db $59,$4F,$53,$48,$49,$27,$53,$20        ; $00FFC0 | "YOSHI'S "
  db $49,$53,$4C,$41,$4E,$44,$20,$20        ; $00FFC8 | "ISLAND  "
  db $20,$20,$20,$20,$20                    ; $00FFD0 | "     "
  db $20                                    ; $00FFD5 | LoROM
  db $15                                    ; $00FFD6 | ROM + SuperFX + RAM + SRAM
  db $0B                                    ; $00FFD7 | 2MB ROM
  db $00                                    ; $00FFD8 | 2KB SRAM
  db $01                                    ; $00FFD9 | NTSC
  db $33                                    ; $00FFDA | Extended header
  db $00                                    ; $00FFDB | Version 1.0
  dw $ECD3                                  ; $00FFDC | Checksum complement
  dw $132C                                  ; $00FFDE | Checksum
  dw $814F,$814F                            ; $00FFE0 | unused native vectors
  dw $814F                                  ; $00FFE4 | Native COP vector (unused)
  dw $814F                                  ; $00FFE6 | Native BRK vector (unused)
  dw $814F                                  ; $00FFE8 | Native ABORT vector (unused)
  dw $0108                                  ; $00FFEA | Native NMI vector (v-blank)
  dw $814F                                  ; $00FFEC | Native RESET vector (unused)
  dw $010C                                  ; $00FFEE | Native IRQ vector
  dw $814F,$814F                            ; $00FFF0 | unused emulation vectors
  dw $814F                                  ; $00FFF4 | Emulation COP vector (unused)
  dw $814F                                  ; $00FFF6 | Emulation BRK vector (unused)
  dw $814F                                  ; $00FFF8 | Emulation ABORT vector (unused)
  dw $814F                                  ; $00FFFA | Emulation NMI vector (unused)
  dw $8000                                  ; $00FFFC | Emulation RESET vector (start game)
  dw $814F                                  ; $00FFFE | Emulation IRQ vector (unused)
